$PBExportHeader$n_xls_data.sru
forward
global type n_xls_data from nonvisualobject
end type
end forward

global type n_xls_data from nonvisualobject
end type
global n_xls_data n_xls_data

type prototypes

end prototypes

type variables
constant  integer BUFFER_SIZE =  40480
protected uint ii_max_current_size = BUFFER_SIZE
protected blob ib_arr[]
public ulong il_count
public ulong il_total_size
protected uint ii_current_size = BUFFER_SIZE

blob	  ib_bf_char
blob{2} ib_bf_integer
blob{4} ib_bf_long
blob{8} ib_bf_double
blob{8} ib_bf_empty_double
end variables

forward prototypes
protected function integer of_add_item ()
public function integer of_write (olestream ai_stream)
public function integer of_append (ref blob ab_data, long al_length)
public function long of_edit (long al_start, ref blob ab_data)
public function integer of_appendb3 (integer ai_data1, integer ai_data2)
public function integer of_appendb2 (integer ai_data)
public function integer of_appendb4 (long al_data)
public function integer of_appendb8 (double adb_num)
public function integer of_appendb4 (integer ai_data1, integer ai_data2)
public function integer of_appendb1 (integer ai_data)
public function integer of_appendb8 (integer ai_data1, integer ai_data2, integer ai_data3, integer ai_data4)
public function integer of_appendb6 (integer ai_data1, integer ai_data2, integer ai_data3)
public function integer of_appendba (integer ai_data1, integer ai_data2, integer ai_data3, integer ai_data4, integer ai_data5)
end prototypes

protected function integer of_add_item ();integer li_ret = 1
blob{40480} lb_temp
il_count ++
ii_current_size = 0
ib_arr[il_count] = lb_temp
return li_ret
end function

public function integer of_write (olestream ai_stream);integer li_ret = 1
ulong ll_i
blob lb_emp[]

for ll_i = 1 to il_count

	if ll_i = il_count then
		ai_stream.write(blobmid(ib_arr[ll_i],1,ii_current_size))
	else
		//ai_stream.write(blobmid(ib_arr[ll_i],1,ii_max_current_size))
		ai_stream.write(ib_arr[ll_i])
	end if

next

ib_arr = lb_emp
ii_max_current_size = BUFFER_SIZE
il_count = 0
il_total_size = 0
ii_current_size = BUFFER_SIZE

return li_ret
end function

public function integer of_append (ref blob ab_data, long al_length);integer li_ret = 1
ulong ll_size,li_pos = 1
uint li_right_size
blob lb_part
boolean lb_full

ll_size = len(ab_data)
IF al_length = 0 or al_length >= ll_size THEN
	al_length = ll_size
	lb_full = true
ELSE
	ll_size = al_length
END IF

do while ll_size > 0

	if ii_current_size = ii_max_current_size then
		of_add_item()
	end if

	if ll_size <= ii_max_current_size - ii_current_size then

		IF li_pos = 1 and lb_full THEN
			BlobEdit(ib_arr[il_count],ii_current_size + 1,ab_data)
		ELSE
			BlobEdit(ib_arr[il_count],ii_current_size + 1,BlobMid(ab_data,li_pos,ll_size))
		END IF
		
		ii_current_size = ii_current_size + ll_size
		il_total_size += ll_size
		ll_size = 0
	else
		li_right_size = ii_max_current_size - ii_current_size

		BlobEdit(ib_arr[il_count],ii_current_size + 1,BlobMid(ab_data,li_pos,li_right_size))
		ll_size -= li_right_size
		li_pos  += li_right_size

		ii_current_size += li_right_size
		il_total_size += li_right_size
	end if

loop

return li_ret
end function

public function long of_edit (long al_start, ref blob ab_data);IF al_start + Len(ab_data) > il_total_size THEN
	RETURN -1
ELSE
	long ll_index,ll_pos	
	ll_pos = Mod(al_start,BUFFER_SIZE)
	ll_index = long(al_start/BUFFER_SIZE) + 1
	RETURN BlobEdit(ib_arr[1],ll_pos,ab_data)
END IF
end function

public function integer of_appendb3 (integer ai_data1, integer ai_data2);long ll_pos

IF ii_max_current_size - ii_current_size  >= 4 then
	ll_pos = ii_current_size + 1
	ll_pos = BlobEdit(ib_arr[il_count],ll_pos,ai_data1)
	ii_current_size = BlobEdit(ib_arr[il_count],ll_pos,ai_data2)
	ii_current_size -= 2
ELSE
	of_appendb2(ai_data1)
	of_appendb1(ai_data2)
END IF

RETURN 1
end function

public function integer of_appendb2 (integer ai_data);IF ii_max_current_size - ii_current_size  >= 2 then
	ii_current_size = BlobEdit(ib_arr[il_count],ii_current_size + 1,ai_data)
	ii_current_size --
ELSE
	BlobEdit(ib_bf_integer,1,ai_data)
	of_append(ib_bf_integer,0)	
END IF

RETURN 1
end function

public function integer of_appendb4 (long al_data);IF ii_max_current_size - ii_current_size  >= 4 then
	ii_current_size = BlobEdit(ib_arr[il_count],ii_current_size + 1,al_data)
	ii_current_size --
ELSE
	BlobEdit(ib_bf_long,1,al_data)
	of_append(ib_bf_long,0)	
END IF

RETURN 1
end function

public function integer of_appendb8 (double adb_num);
IF IsNull(adb_num) THEN
	of_append(ib_bf_empty_double,0)
ELSEIF ii_max_current_size - ii_current_size  >= 8 then
	ii_current_size = BlobEdit(ib_arr[il_count],ii_current_size + 1,adb_num)
	ii_current_size --
ELSE
	BlobEdit(ib_bf_double,1,adb_num)
	of_append(ib_bf_double,0)
END IF

RETURN 1
end function

public function integer of_appendb4 (integer ai_data1, integer ai_data2);long ll_pos

IF ii_max_current_size - ii_current_size  >= 4 then
	ll_pos = ii_current_size + 1
	ll_pos = BlobEdit(ib_arr[il_count],ll_pos,ai_data1)
	ii_current_size = BlobEdit(ib_arr[il_count],ll_pos,ai_data2)
	ii_current_size --
ELSE
	blobedit(ib_bf_long,1,ai_data1)
	blobedit(ib_bf_long,3,ai_data2)
	of_append(ib_bf_long,0)
END IF

RETURN 1
end function

public function integer of_appendb1 (integer ai_data);IF ii_max_current_size - ii_current_size  >= 2 then
	ii_current_size = BlobEdit(ib_arr[il_count],ii_current_size + 1,ai_data)
	ii_current_size -= 2
ELSE
	BlobEdit(ib_bf_integer,1,ai_data)
	ib_bf_char = BlobMid(ib_bf_integer,1,1)
	of_append(ib_bf_char,0)	
END IF

RETURN 1

end function

public function integer of_appendb8 (integer ai_data1, integer ai_data2, integer ai_data3, integer ai_data4);long ll_pos

IF ii_max_current_size - ii_current_size  >= 8 then
	ll_pos = ii_current_size + 1
	ll_pos = BlobEdit(ib_arr[il_count],ll_pos,ai_data1)
	ll_pos = BlobEdit(ib_arr[il_count],ll_pos,ai_data2)
	ll_pos = BlobEdit(ib_arr[il_count],ll_pos,ai_data3)
	ii_current_size = BlobEdit(ib_arr[il_count],ll_pos,ai_data4)
	ii_current_size --
ELSE
	of_appendb4(ai_data1,ai_data2)
	of_appendb4(ai_data3,ai_data4)
END IF

RETURN 1
end function

public function integer of_appendb6 (integer ai_data1, integer ai_data2, integer ai_data3);long ll_pos

IF ii_max_current_size - ii_current_size  >= 6 then
	ll_pos = ii_current_size + 1
	ll_pos = BlobEdit(ib_arr[il_count],ll_pos,ai_data1)
	ll_pos = BlobEdit(ib_arr[il_count],ll_pos,ai_data2)
	ii_current_size = BlobEdit(ib_arr[il_count],ll_pos,ai_data3)
	ii_current_size --
ELSE
	of_appendb4(ai_data1,ai_data2)
	of_appendb2(ai_data3)
END IF

RETURN 1
end function

public function integer of_appendba (integer ai_data1, integer ai_data2, integer ai_data3, integer ai_data4, integer ai_data5);long ll_pos

IF ii_max_current_size - ii_current_size  >= 10 then
	ll_pos = ii_current_size + 1
	ll_pos = BlobEdit(ib_arr[il_count],ll_pos,ai_data1)
	ll_pos = BlobEdit(ib_arr[il_count],ll_pos,ai_data2)
	ll_pos = BlobEdit(ib_arr[il_count],ll_pos,ai_data3)
	ll_pos = BlobEdit(ib_arr[il_count],ll_pos,ai_data4)
	ii_current_size = BlobEdit(ib_arr[il_count],ll_pos,ai_data5)
	ii_current_size --
ELSE
	of_appendb4(ai_data1,ai_data2)
	of_appendb4(ai_data3,ai_data4)
	of_appendb2(ai_data5)
END IF

RETURN 1
end function

on n_xls_data.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_xls_data.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;blob lb_temp[]
ib_arr = lb_temp
end event

