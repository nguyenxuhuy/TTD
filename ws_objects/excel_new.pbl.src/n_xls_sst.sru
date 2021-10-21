$PBExportHeader$n_xls_sst.sru
forward
global type n_xls_sst from n_xls_data
end type
end forward

global type n_xls_sst from n_xls_data
end type
global n_xls_sst n_xls_sst

type variables
public CONSTANT integer B1 = 1
public CONSTANT integer B2 = 2
public CONSTANT integer B4 = 4
public n_cst_hash_unicode invo_hash
public n_xls_subroutines invo_sub
public ulong il_total_in_doc
public ulong il_total_unique
public ulong il_limit = 8224

constant integer INTEGER_0 = 0
constant integer EXTSST_BUFFER_SIZE = 8192
public blob ib_extsst_arr[]
public integer ii_extsst_pos = EXTSST_BUFFER_SIZE
public integer ii_extsst_count
public integer ii_extsst_buffer
public integer ii_string_per_extsst = 8

long 		il_absolute_pos = 12
integer 	ii_relative_pos = 12
blob 		ib_cur_portion
integer  ii_cur_pos = 1

end variables

forward prototypes
public function unsignedlong of_add_string (string as_value)
public function integer of_add_string (blob ab_value)
public function integer of_write (olestream ai_stream)
public function integer of_add_extsst ()
public function unsignedlong of_get_sst (long al_offset)
end prototypes

public function unsignedlong of_add_string (string as_value);return of_add_string(invo_sub.of_ansi2unicode(as_value))
end function

public function integer of_add_string (blob ab_value);integer li_header_size = 4
long ll_len_value,ll_hash_value

blob lb_header, lb_data
integer li_split_pos
blob lb_first_part
blob lb_last_part

ll_len_value = len(ab_value)

IF il_total_unique = 0 THEN
	lb_header = (invo_sub.of_pack(B2,252) + invo_sub.of_pack(B2, 8) + invo_sub.of_pack(B4,il_total_in_doc) + invo_sub.of_pack(B4,il_total_unique))
	of_append(lb_header,0)
END IF

il_total_in_doc ++

ll_hash_value = invo_hash.of_get_value(ab_value)
if NOT IsNull(ll_hash_value) then
	return (ll_hash_value - 1)
end if

il_total_unique ++
invo_hash.of_set_value(ab_value,il_total_unique)

if (ii_relative_pos + 3 + ll_len_value) > il_limit then
	
	if il_limit - ii_relative_pos < 5 then
		
		of_appendb4(60,ii_cur_pos - 1)
		of_append(ib_cur_portion,ii_cur_pos - 1)

		ii_cur_pos = 1
		
		ii_relative_pos = li_header_size
		il_absolute_pos += li_header_size
		
		ii_cur_pos = BlobEdit(ib_cur_portion,ii_cur_pos,invo_sub.of_pack(B2,integer(ll_len_value / 2)) + invo_sub.of_pack(B1,1))
		ii_cur_pos = BlobEdit(ib_cur_portion,ii_cur_pos,ab_value)

		if mod(il_total_unique - 1,ii_string_per_extsst) = 0 then
			of_add_extsst()
		end if

		il_absolute_pos += (3 + ll_len_value)
		ii_relative_pos = ii_relative_pos + 3 + ll_len_value
	else
		
		if mod(il_total_unique - 1,ii_string_per_extsst) = 0 then
			of_add_extsst()
		end if
		
		li_split_pos = il_limit - ii_relative_pos - 3

		if mod(li_split_pos,2) = 1 then
			li_split_pos --
		end if

		lb_first_part = blobmid(ab_value,1,li_split_pos)
		lb_last_part = blobmid(ab_value,li_split_pos + 1,ll_len_value - li_split_pos)						
				
		il_absolute_pos += (3 + len(lb_first_part))
		ii_relative_pos = ii_relative_pos + 3 + len(lb_first_part)

		ii_cur_pos = BlobEdit(ib_cur_portion,ii_cur_pos,invo_sub.of_pack(B2,integer(ll_len_value / 2)) + invo_sub.of_pack(B1,1))
		ii_cur_pos = BlobEdit(ib_cur_portion,ii_cur_pos,lb_first_part)
		
		of_appendb4(60,ii_cur_pos - 1)
		of_append(ib_cur_portion,ii_cur_pos - 1)
		ii_cur_pos = 1
		
		ii_relative_pos = li_header_size
		il_absolute_pos += li_header_size

		ii_cur_pos = BlobEdit(ib_cur_portion,ii_cur_pos,invo_sub.of_pack(B1,1))
		ii_cur_pos = BlobEdit(ib_cur_portion,ii_cur_pos,lb_last_part)
		
		il_absolute_pos += (1 + len(lb_last_part))
		ii_relative_pos = ii_relative_pos + 1 + len(lb_last_part)
	end if

else
	
	ii_cur_pos = BlobEdit(ib_cur_portion,ii_cur_pos,invo_sub.of_pack(B2,integer(ll_len_value / 2)) + invo_sub.of_pack(B1,1))
	ii_cur_pos = BlobEdit(ib_cur_portion,ii_cur_pos,ab_value)

	if mod(il_total_unique - 1,ii_string_per_extsst) = 0 then
		of_add_extsst()
	end if

	il_absolute_pos += (3 + ll_len_value)
	ii_relative_pos = ii_relative_pos + 3 + ll_len_value
end if

RETURN il_total_unique - 1
end function

public function integer of_write (olestream ai_stream);super::of_write(ai_stream)

integer li_ret = 1
integer ll_i
blob lb_emp[]

for ll_i = 1 to ii_extsst_buffer

	if ll_i = ii_extsst_buffer then
		ai_stream.write(blobmid(ib_extsst_arr[ll_i],1,ii_extsst_pos - 1))
	else
		ai_stream.write(ib_extsst_arr[ll_i])
	end if

next

ib_extsst_arr = lb_emp
ii_extsst_pos = EXTSST_BUFFER_SIZE
ii_extsst_count = 0
ii_extsst_buffer = 0

return li_ret
end function

public function integer of_add_extsst ();
ii_extsst_count ++

IF ii_extsst_pos >= EXTSST_BUFFER_SIZE THEN
	ii_extsst_pos  = 1
	ii_extsst_buffer ++
	ib_extsst_arr[ii_extsst_buffer] = Blob(Space(EXTSST_BUFFER_SIZE))
END IF

ii_extsst_pos = BlobEdit(ib_extsst_arr[ii_extsst_buffer], ii_extsst_pos , il_absolute_pos)
ii_extsst_pos = BlobEdit(ib_extsst_arr[ii_extsst_buffer], ii_extsst_pos , ii_relative_pos)
ii_extsst_pos = BlobEdit(ib_extsst_arr[ii_extsst_buffer], ii_extsst_pos , INTEGER_0)

RETURN 1
end function

public function unsignedlong of_get_sst (long al_offset);blob lb_header

IF il_count > 0 THEN
	lb_header = (invo_sub.of_pack(B2,252) + invo_sub.of_pack(B2,8) + invo_sub.of_pack(B4,il_total_in_doc) + invo_sub.of_pack(B4,il_total_unique))
	BlobEdit(ib_arr[1],1,lb_header)
END IF

IF (ii_cur_pos - 1 > 0) then
	lb_header = invo_sub.of_pack(B2,60) + invo_sub.of_pack(B2,ii_cur_pos - 1)
	of_append(lb_header,0)
	of_append(ib_cur_portion,ii_cur_pos - 1)
end if

//GET EXTSST
long ll_absolute_pos, ll_pos
integer li_i, li_buffer

lb_header = invo_sub.of_pack(B2,255) + invo_sub.of_pack(B2,ii_extsst_count * 8 + 2) + invo_sub.of_pack(B2,ii_string_per_extsst)
of_append(lb_header,0)

ll_pos = EXTSST_BUFFER_SIZE
FOR li_i = 1 TO ii_extsst_count
	IF ll_pos >= EXTSST_BUFFER_SIZE THEN
		li_buffer ++
		ll_pos = 1
	END IF
	ll_absolute_pos = long(BlobMid(ib_extsst_arr[li_buffer],ll_pos,4)) + al_offset
	BlobEdit(ib_extsst_arr[li_buffer], ll_pos , ll_absolute_pos)
	ll_pos += 8
NEXT

RETURN il_total_size + ii_extsst_count * 8
end function

event constructor;blob{8224} lb_temp
invo_hash = create n_cst_hash_unicode
invo_sub = create n_xls_subroutines
ib_cur_portion = lb_temp
return
end event

on n_xls_sst.create
call super::create
end on

on n_xls_sst.destroy
call super::destroy
end on

event destructor;setnull(ib_cur_portion)
destroy(invo_hash)
destroy(invo_sub)
return
end event

