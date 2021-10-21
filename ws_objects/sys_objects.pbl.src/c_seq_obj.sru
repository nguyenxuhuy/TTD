$PBExportHeader$c_seq_obj.sru
$PBExportComments$sequence object in Core_sysAdmin Lib
forward
global type c_seq_obj from nonvisualobject
end type
end forward

global type c_seq_obj from nonvisualobject autoinstantiate
end type

type variables
string is_seq_code
string is_value[]
string is_type[]		//text, date, number
boolean ib_isdate
string is_continuous, is_manual
string is_format
private:

end variables

forward prototypes
public function string f_get_seq ()
public function string f_get_old_seq ()
public function string f_get_seq (date vd_date)
public function string f_get_old_seq (date vd_date)
public function integer f_validate_format_string (string vs_format_string)
public function integer f_init_seq (string vs_seq_code)
public function integer f_validate_seq_string (string vs_seq_string)
public function long f_get_currval (string vs_seq_code)
public function string f_getseqvalue (long vl_seqid)
public function string f_getseqvalue (long vl_seqid, datawindow vdw_focus)
public function integer f_create_db_sequence (long vl_seq_id, long vl_start_value)
public function integer f_drop_db_sequence (long vl_seq_id)
public function integer f_reset_db_sequence (long vl_seq_id, long vl_start_value)
public function long f_get_nextvalue (long vl_seq_id)
public function boolean f_check_exists_user_bdobject (string vs_seq_name)
end prototypes

public function string f_get_seq ();string ls_seq_string
int li_index
long ll_seq_num
//
//If is_manual = 'N' Then
//	If is_continuous = 'Y' Then
//		ls_seq_string = this.f_get_old_seq( )
//		if not isnull(ls_seq_string) then return ls_seq_string
//	End If
//	
//	If IsNull(is_format) Then
//		ls_seq_string = string(f_get_nextvalue( is_seq_code))
//	Else
//		ls_seq_string = ''
//		for li_index = 1 to upperbound(this.is_value)
//			if  lower(this.is_type[li_index]) = 'text' then
//				ls_seq_string += this.is_value[li_index]
//			else	
//				ll_seq_num = f_get_nextvalue( is_seq_code)
//				ls_seq_string += String(ll_seq_num,this.is_value[li_index])
//			end if
//		next
//	End If
//Else
//	SetNull(ls_seq_string)
//End If

return ls_seq_string

end function

public function string f_get_old_seq ();string ls_old_seq_num

//If is_continuous = 'N' Then
//	SetNull(ls_old_seq_num)
//Else
//	Select Min(seq_string) into :ls_old_seq_num
//		from erp_sequences_del where seq_code = :is_seq_code;
//		
//	If Not IsNull(	ls_old_seq_num) Then
//		Delete from erp_sequences_del where seq_code = :is_seq_code and seq_string = :ls_old_seq_num;
//		If SQLCA.SQLCode <> 0 Then	SetNull(ls_old_seq_num)
//	End If
//End If

return ls_old_seq_num
end function

public function string f_get_seq (date vd_date);string ls_seq_string
int li_index
long ll_seq_num

//If is_manual = 'N' Then
//	If is_continuous = 'Y' Then
//		ls_seq_string = this.f_get_old_seq(vd_date )
//		if not isnull(ls_seq_string) then return ls_seq_string
//	End If
//	
//	If IsNull(is_format) Then
//		ls_seq_string = string(f_get_nextvalue( is_seq_code))
//	Else
//		ls_seq_string = ''
//		for li_index = 1 to upperbound(this.is_value)
//			if  lower(this.is_type[li_index]) = 'text' then
//				ls_seq_string += this.is_value[li_index]
//			elseif lower(this.is_type[li_index]) = 'date' then
//				ls_seq_string += string(vd_date, this.is_value[li_index])
//			else
//				ll_seq_num = f_get_nextvalue( is_seq_code)
//				ls_seq_string += String(ll_seq_num,this.is_value[li_index])
//			end if
//		next
//	End If
//Else
//	SetNull(ls_seq_string)
//End If

return ls_seq_string
end function

public function string f_get_old_seq (date vd_date);string ls_old_seq_num, ls_date_format
int li_index

//If is_continuous = 'N' Then
//	SetNull(ls_old_seq_num)
//Else
//	For li_index = 1 to UpperBound(is_type)
//		If is_type[li_index] = 'date' Then
//			ls_date_format = is_value[li_index]
//			Exit
//		End If
//	Next
//	
//	Select Min(seq_string) into :ls_old_seq_num
//		from erp_sequences_del 
//		where seq_code = :is_seq_code and to_char(seq_date,:ls_date_format) = to_char(:vd_date,:ls_date_format);
//	
//	If Not IsNull(	ls_old_seq_num) Then
//		Delete from erp_sequences_del where seq_code = :is_seq_code and seq_string = :ls_old_seq_num;
//		If SQLCA.SQLCode <> 0 Then	SetNull(ls_old_seq_num)
//	End If
//End If
//
return ls_old_seq_num
end function

public function integer f_validate_format_string (string vs_format_string);String ls_first, ls_tmp, ls_char
int li_pos, li_pos_cur, li_i, li_null, li_pos_tmp, li_count_date, li_count_seq

If IsNull(vs_format_string) or Len(Trim(vs_format_string)) = 0 Then
	SetNull(li_null)
	Return li_null
End If

vs_format_string = Trim(vs_format_string)

li_pos = Pos(vs_format_string,'0')
If li_pos < 1 Then return -1
li_pos = Pos(vs_format_string,' ')
If li_pos > 0 Then return -1	
			
ls_first = Left(vs_format_string,1)
li_pos_cur = 1

Do 
	Choose Case ls_first
		Case '"',"'"
			li_pos = Pos(vs_format_string,ls_first,li_pos_cur + 1)
			If li_pos < li_pos_cur Then return -1
			ls_tmp = Mid(vs_format_string,li_pos_cur + 1, li_pos - li_pos_cur - 1)
			li_pos_cur = li_pos + 1
			ls_first = Mid(vs_format_string,li_pos_cur,1)
		Case '0'
			If li_count_seq = 1 Then Return -1
			li_pos = LastPos(vs_format_string,ls_first)
			If li_pos < li_pos_cur Then return -1
			ls_tmp = Mid(vs_format_string,li_pos_cur, li_pos - li_pos_cur + 1)
			For li_i = 1 to Len(ls_tmp)
				ls_char = Mid(ls_tmp,li_i,1)
				If ls_char <> ls_first Then Return -1
			Next
			li_pos_cur = li_pos + 1
			li_count_seq = 1
			ls_first = Mid(vs_format_string,li_pos_cur,1)
		Case else
			If li_count_date = 1 Then Return -1
			li_pos = Len(vs_format_string) + 1
			If li_pos > li_pos_tmp and li_pos_tmp > 0 Then li_pos = li_pos_tmp
			li_pos_tmp = Pos(vs_format_string,'"',li_pos_cur + 1)
			If li_pos > li_pos_tmp and li_pos_tmp > 0 Then li_pos = li_pos_tmp
			li_pos_tmp = Pos(vs_format_string,"'",li_pos_cur + 1)
			If li_pos > li_pos_tmp and li_pos_tmp > 0 Then li_pos = li_pos_tmp
			li_pos_tmp = Pos(vs_format_string,'0',li_pos_cur + 1)
			If li_pos > li_pos_tmp and li_pos_tmp > 0 Then li_pos = li_pos_tmp
			
			ls_tmp = Mid(vs_format_string,li_pos_cur, li_pos - li_pos_cur)
			li_pos_cur = li_pos
			li_count_date = 1
			ls_first = Mid(vs_format_string,li_pos_cur,1)
			
			Select to_char(sysdate,:ls_tmp) into :ls_tmp from dual;
			If SQLCA.SQLCode <> 0 Then Return -1

	End Choose	
Loop While li_pos_cur <= Len(vs_format_string)

Return 1
end function

public function integer f_init_seq (string vs_seq_code);String ls_first, ls_tmp, ls_char, ls_type[], ls_value[]
int li_pos, li_pos_cur, li_index, li_i, li_null, li_pos_tmp, li_count_seq, li_count_date

string ls_format_string

If IsNull(vs_seq_code) Then
	SetNull(li_null)
	Return li_null
End If

Select trim(format_string), nvl(continuous,'N'), nvl(manual,'N')
	into :ls_format_string, :is_continuous, :is_manual
	from erp_sequences where seq_code = :vs_seq_code;
If SQLCA.SQLCode <> 0 Then Return -1	
is_format = ls_format_string

////for test
//ls_format_string = is_format
////////////

If IsNull(ls_format_string) Then
	is_type = ls_type
	is_value = ls_value
	ib_isdate = false
	is_seq_code = vs_seq_code
	Return 1
End If

li_pos = Pos(ls_format_string,'0')
If li_pos < 1 Then return -1			
li_pos = Pos(ls_format_string,' ')
If li_pos > 0 Then return -1	
			
ib_isdate = false

ls_first = Left(ls_format_string,1)
li_pos_cur = 1
li_index = 1
Do 
	Choose Case ls_first
		Case '"',"'"
			li_pos = Pos(ls_format_string,ls_first,li_pos_cur + 1)
			If li_pos < li_pos_cur Then return -1
			ls_tmp = Mid(ls_format_string,li_pos_cur + 1, li_pos - li_pos_cur - 1)
			ls_type[li_index] = 'text'
			ls_value[li_index] = ls_tmp
			li_pos_cur = li_pos + 1
			li_index += 1
			ls_first = Mid(ls_format_string,li_pos_cur,1)
		Case '0'
			If li_count_seq = 1 Then Return -1
			li_pos = LastPos(ls_format_string,ls_first)
			If li_pos < li_pos_cur Then return -1
			ls_tmp = Mid(ls_format_string,li_pos_cur, li_pos - li_pos_cur + 1)
			For li_i = 1 to Len(ls_tmp)
				ls_char = Mid(ls_tmp,li_i,1)
				If ls_char <> ls_first Then Return -1
			Next
			ls_type[li_index] = 'number'
			ls_value[li_index] = ls_tmp
			li_pos_cur = li_pos + 1
			li_index += 1
			li_count_seq = 1
			ls_first = Mid(ls_format_string,li_pos_cur,1)
		Case else
			If li_count_date = 1 Then Return -1
			li_pos = Len(ls_format_string) + 1
			If li_pos > li_pos_tmp and li_pos_tmp > 0 Then li_pos = li_pos_tmp
			li_pos_tmp = Pos(ls_format_string,'"',li_pos_cur + 1)
			If li_pos > li_pos_tmp and li_pos_tmp > 0 Then li_pos = li_pos_tmp
			li_pos_tmp = Pos(ls_format_string,"'",li_pos_cur + 1)
			If li_pos > li_pos_tmp and li_pos_tmp > 0 Then li_pos = li_pos_tmp
			li_pos_tmp = Pos(ls_format_string,'0',li_pos_cur + 1)
			If li_pos > li_pos_tmp and li_pos_tmp > 0 Then li_pos = li_pos_tmp
			
			ls_tmp = Mid(ls_format_string,li_pos_cur, li_pos - li_pos_cur)
			ls_type[li_index] = 'date'
			ls_value[li_index] = ls_tmp
			ib_isdate = true
			li_pos_cur = li_pos
			li_index += 1
			li_count_date = 1
			ls_first = Mid(ls_format_string,li_pos_cur,1)
			
			Select to_char(sysdate,:ls_tmp) into :ls_tmp from dual;
			If SQLCA.SQLCode <> 0 Then Return -1

	End Choose	
Loop While li_pos_cur <= Len(ls_format_string)

is_type = ls_type
is_value = ls_value
is_seq_code = vs_seq_code

Return 1
end function

public function integer f_validate_seq_string (string vs_seq_string);String ls_format_string, ls_cur_text
int li_i, li_cur_pos

Select trim(format_string) into :ls_format_string
	from erp_sequence where seq_code = :is_seq_code and company_id = :gi_user_comp_id;
If SQLCA.SQLCode <> 0 Then Return -1	

////test
//ls_format_string = is_format

If IsNull(ls_format_string) Then
	If Not IsNumber(vs_seq_string) Then Return -1
Else
	li_cur_pos = 1
	For li_i = 1 to UpperBound(is_type)
		ls_cur_text = Mid(vs_seq_string, li_cur_pos, Len(is_value[li_i]))
		li_cur_pos += Len(is_value[li_i])
		
		If Len(ls_cur_text) <> Len(is_value[li_i]) Then Return -1
		
		Choose Case is_type[li_i]
			Case 'text'
				If ls_cur_text <> is_value[li_i] Then Return -1
			Case 'number'
				If Not IsNumber(ls_cur_text) Then Return -1
			Case 'date'
				date ldt_tmp
				Select to_date(:ls_cur_text,:is_value[li_i]) into :ldt_tmp from dual;
				If SQLCA.SQLCode <> 0 Then Return -1
		End Choose
	Next
	If li_cur_pos <= Len(vs_seq_string) Then Return -1
End If

Return 1
end function

public function long f_get_currval (string vs_seq_code);long ll_seq = 1
string ls_sql
//     ls_sql = "SELECT " + vs_seq_code + ".nextval FROM dual"
//	DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;	
//	PREPARE SQLSA FROM :ls_sql USING SQLCA; 
//	OPEN DYNAMIC my_cursor;
//	FETCH my_cursor INTO :ll_seq ;
//	CLOSE my_cursor ;
// 
	 
//PREPARE SQLSA FROM :ls_sql ;
//DESCRIBE SQLSA INTO SQLDA ;
//DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;
//OPEN DYNAMIC my_cursor USING DESCRIPTOR SQLDA ;
//FETCH my_cursor USING DESCRIPTOR SQLDA ;
//ll_seq = GetDynamicNumber(SQLDA, 1)
//CLOSE my_cursor ;
return ll_seq
end function

public function string f_getseqvalue (long vl_seqid);string ls_value


return ls_value
end function

public function string f_getseqvalue (long vl_seqid, datawindow vdw_focus);string ls_value


return ls_value
end function

public function integer f_create_db_sequence (long vl_seq_id, long vl_start_value);string ls_sql
int		li_null

If IsNull(vl_seq_id) or IsNull(vl_start_value) Then
	SetNull(li_null)
	Return li_null
End If


	ls_sql = "CREATE SEQUENCE " + '"'+string(vl_seq_id)+'"'  &
			+ " START WITH " + string(vl_start_value) &
			+ " MAXVALUE 999999999999999999999999999"  & 
			+ " NOCACHE"
	
	EXECUTE IMMEDIATE :ls_sql ;
	
	If SQLCA.SQLCode = -1 Then Return -1
	
    UPDATE ERP_SEQUENCE SET NEXT_VALUE = :vl_start_value
	 WHERE SEQ_id =:vl_seq_id;
	 COMMIT;
	 
Return 1
end function

public function integer f_drop_db_sequence (long vl_seq_id);string ls_sql
int		li_null

If IsNull(vl_seq_id) Then
	SetNull(li_null)
	Return li_null
End If

	ls_sql = "DROP SEQUENCE " + '"'+string(vl_seq_id) + '"'
			
	EXECUTE IMMEDIATE :ls_sql ;
	
	If SQLCA.SQLCode = -1 Then Return -1

Return 1
end function

public function integer f_reset_db_sequence (long vl_seq_id, long vl_start_value);int		li_null, li_rt

If IsNull(vl_seq_id) or IsNull(vl_start_value) Then
	SetNull(li_null)
	Return li_null
End If

	li_rt = f_drop_db_sequence(vl_seq_id)
	If li_rt <> 1 Then Return -1
	
	li_rt = f_create_db_sequence(vl_seq_id, vl_start_value)
	If li_rt <> 1 Then Return -1
	
Return 1
end function

public function long f_get_nextvalue (long vl_seq_id);long ll_seq
string ls_sql

	DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;	
		ls_sql = "SELECT " + '"'+string(vl_seq_id) +'"'+ ".nextval FROM dual"
		PREPARE SQLSA FROM :ls_sql ;
		OPEN DYNAMIC my_cursor;
		FETCH my_cursor INTO :ll_seq ;
		CLOSE my_cursor ;
		
    UPDATE ERP_SEQUENCE SET NEXT_VALUE = :ll_seq + 1
	 WHERE SEQ_ID = :vl_seq_id;
	 COMMIT;
return ll_seq
end function

public function boolean f_check_exists_user_bdobject (string vs_seq_name);/*--------------------------------------------------------------------

Nane         :  f_check_exists_seq
Arg string  : vs_seq_name 

         Khởi tạo: Út
             Ngày : 15-07-2009
		----------------------------------------------------------		 
 Nội dung xử lý: Kiểm tra một seq trùng tên với đối tượng database.
    Giá trị trả về: 
	 				+ True   :Nếu đã có rồi.
					+ False  :Chưa có

--------------------------------------------------------------------
Sửa:none

--------------------------------------------------------------------*/
long ll_count

select count(*) into :ll_count 
  from user_objects 
where object_name = UPPER(:vs_seq_name);
	
if ll_count > 0 then
	return true	
else
	return false
end if
end function

on c_seq_obj.create
call super::create
TriggerEvent( this, "constructor" )
end on

on c_seq_obj.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

