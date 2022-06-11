$PBExportHeader$b_sequences.sru
forward
global type b_sequences from s_object_instantiate
end type
end forward

global type b_sequences from s_object_instantiate
end type

type variables

string  is_TYPE
string  is_TEXT_STR
string  is_FORMAT_STR 
string  is_TEXT_SEPARATE_YN 
string  is_DATE_SEPARATE_YN
string  is_COMBINE_CHAR
string  is_COMBINE_ORDER
string  is_RESET_TYPE 
string  is_DATE_STR  
string  is_CONTINUOUS_YN  
double idb_START_VALUE  
double idb_NEXT_VALUE   
double idb_LAST_VALUE  
date  	 id_LAST_VALUE_DATE
string	 is_seq_code
string	 is_seq_name
end variables

forward prototypes
public function integer f_create_db_sequence (long vl_seq_id, long vl_start_value)
public function integer f_drop_db_sequence (long vl_seq_id)
public function integer f_reset_db_sequence (long vl_seq_id, long vl_start_value)
public function integer f_init (double vdb_id)
public function double f_get_nextvalue (long vl_seq_id)
public function double f_get_nextvalue (long vl_seq_id, date vd_date)
protected function string f_get_combined_seq (string vs_text, string vs_number_str, string vs_date_str)
public function string f_create_autonumber (double vdb_temp_seq_id)
public function string f_create_autonumber (date vd_date)
public function integer f_delete_autonumber (string vs_seqstring, date vd_date)
public function integer f_delete_autonumber (string vs_seqstring, double vdb_del_seq_id)
protected function double f_find_reset_sequence (any va_reset_code)
public function integer f_delete_autonumber (string vs_seqstring, string vs_reset_str)
protected function double f_create_reset_sequence (any va_reset_code)
public function string f_create_autonumber (string vs_reset_str)
public function boolean f_is_dbseq_existed (string vs_sequence)
public function string f_create_autonumber (double vdb_temp_seq_id, date vd_date)
public function integer f_init_ex (double vdb_id, ref t_transaction rt_transaction)
public function string f_create_autonumber_ex (date vd_date, ref t_transaction rt_transaction)
public function string f_create_autonumber_ex (double vdb_temp_seq_id, ref t_transaction rt_transaction)
public function string f_create_autonumber_ex (double vdb_temp_seq_id, date vd_date, ref t_transaction rt_transaction)
public function string f_create_autonumber_ex (string vs_reset_str, ref t_transaction rt_transaction)
protected function double f_create_reset_sequence_ex (any va_reset_code, ref t_transaction rt_transaction)
public function integer f_create_db_sequence_ex (long vl_seq_id, long vl_start_value, ref t_transaction rt_transaction)
public function integer f_delete_autonumber_ex (string vs_seqstring, date vd_date, ref t_transaction rt_transaction)
public function integer f_delete_autonumber_ex (string vs_seqstring, double vdb_del_seq_id, ref t_transaction rt_transaction)
public function integer f_delete_autonumber_ex (string vs_seqstring, string vs_reset_str, ref t_transaction rt_transaction)
protected function double f_find_reset_sequence_ex (any va_reset_code, ref t_transaction rt_transaction)
public function double f_get_nextvalue_ex (long vl_seq_id, ref t_transaction rt_transaction)
public function double f_get_nextvalue_ex (long vl_seq_id, date vd_date, ref t_transaction rt_transaction)
public function integer f_drop_db_sequence_ex (long vl_seq_id, ref t_transaction rt_transaction)
public function boolean f_is_dbseq_existed_ex (string vs_sequence, ref t_transaction rt_transaction)
public function integer f_reset_db_sequence_ex (long vl_seq_id, long vl_start_value, ref t_transaction rt_transaction)
end prototypes

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

EXECUTE IMMEDIATE :ls_sql using sqlca;

If SQLCA.SQLCode = -1 Then Return -1

//UPDATE SEQUENCES SET NEXT_VALUE = :vl_start_value
//WHERE object_ref_id =:vl_seq_id using sqlca;
//COMMIT using sqlca;
	 
Return 1
end function

public function integer f_drop_db_sequence (long vl_seq_id);string ls_sql
int		li_null

If IsNull(vl_seq_id) Then
	SetNull(li_null)
	Return li_null
End If

	ls_sql = "DROP SEQUENCE " + '"'+string(vl_seq_id) + '"'
			
	EXECUTE IMMEDIATE :ls_sql using sqlca;
	
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

public function integer f_init (double vdb_id);select 
sequences.TYPE,
nvl(sequences.TEXT_STR,''),
nvl(sequences.FORMAT_STR,'') ,
nvl(sequences.TEXT_SEPARATE_YN,'N') ,
nvl(sequences.DATE_SEPARATE_YN,'N'),
nvl(sequences.COMBINE_CHAR,''),
sequences.COMBINE_ORDER,
nvl(sequences.RESET_TYPE,'none') ,
nvl(sequences.DATE_STR,'none')  ,
nvl(sequences.CONTINUOUS_YN,'N')  ,
nvl(sequences.START_VALUE,0)  ,
nvl(sequences.NEXT_VALUE,0) ,  
nvl(sequences.LAST_VALUE,0),  
sequences.LAST_VALUE_DATE,
nvl(flexible_data.code,''),
nvl(flexible_data.name,'')
into
:is_TYPE,
:is_TEXT_STR,
:is_FORMAT_STR ,
:is_TEXT_SEPARATE_YN ,
:is_DATE_SEPARATE_YN,
:is_COMBINE_CHAR,
:is_COMBINE_ORDER,
:is_RESET_TYPE ,
:is_DATE_STR  ,
:is_CONTINUOUS_YN , 
:idb_START_VALUE,  
:idb_NEXT_VALUE ,  
:idb_LAST_VALUE , 
:id_LAST_VALUE_DATE,
:is_seq_code,
:is_seq_name
from flexible_data
join sequences on flexible_data.id = sequences.object_ref_id
where sequences.object_ref_id = :vdb_id and flexible_data.object_ref_table ='SEQUENCES' using sqlca;

if sqlca.sqlcode = 0 then
	if isnull(is_TEXT_STR) then is_TEXT_STR = ''
	if isnull(is_FORMAT_STR) then is_FORMAT_STR = ''
	if isnull(is_COMBINE_CHAR) then is_COMBINE_CHAR = ''
	if isnull(is_seq_code) then is_seq_code = ''
	if isnull(is_seq_name) then is_seq_name = ''
	return 1
else
	return 0
end if
end function

public function double f_get_nextvalue (long vl_seq_id);double ll_seq
string ls_sql,ls_seq_id

ls_seq_id = string(vl_seq_id)
SELECT COUNT(SEQUENCE_NAME) into :ll_seq  FROM USER_SEQUENCES WHERE SEQUENCE_NAME = :ls_seq_id USING SQLCA;
if ll_seq = 0 then this.f_create_db_sequence( vl_seq_id, 1)
if SQLCA.SQLCODE = -1 then return -1
	DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;	
		ls_sql = "SELECT " + '"'+string(vl_seq_id) + '"'+ ".nextval FROM dual"
		PREPARE SQLSA FROM :ls_sql ;
		OPEN DYNAMIC my_cursor;
//		if sqlca.sqlcode = -1 then
//			this.f_create_db_sequence( vl_seq_id, 1)
//			OPEN DYNAMIC my_cursor;
//		end if		
		FETCH my_cursor INTO :ll_seq ;
		CLOSE my_cursor ;
		
    UPDATE SEQUENCES SET NEXT_VALUE = :ll_seq + 1,  LAST_VALUE = :ll_seq
	 WHERE object_ref_ID = :vl_seq_id using sqlca;
	 COMMIT using sqlca;
return ll_seq
end function

public function double f_get_nextvalue (long vl_seq_id, date vd_date);double ll_seq
string ls_sql

	DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;	
		ls_sql = "SELECT " + '"'+string(vl_seq_id) +'"'+ ".nextval FROM dual"
		PREPARE SQLSA FROM :ls_sql ;
		OPEN DYNAMIC my_cursor;
		FETCH my_cursor INTO :ll_seq ;
		CLOSE my_cursor ;
		
    UPDATE SEQUENCES SET NEXT_VALUE = :ll_seq + 1 ,
	 								 LAST_VALUE = :ll_seq ,
									 LAST_VALUE_DATE	= 	:vd_date
	 WHERE OBJECT_REF_ID = :vl_seq_id;
	 COMMIT using sqlca;
return ll_seq
end function

protected function string f_get_combined_seq (string vs_text, string vs_number_str, string vs_date_str);string		ls_seq
choose case is_COMBINE_ORDER
	case 'text_number_date'
		if  is_TEXT_SEPARATE_YN = 'Y' then
			ls_seq = vs_text+ is_COMBINE_CHAR
		else
			ls_seq = vs_text
		end if
		if  is_DATE_SEPARATE_YN = 'Y' then
			ls_seq += vs_number_str+ is_COMBINE_CHAR +vs_date_str
		else
			ls_seq += vs_number_str +vs_date_str
		end if				
	case 'text_date_number'
		if  is_TEXT_SEPARATE_YN = 'Y' then
			ls_seq = vs_text+ is_COMBINE_CHAR
		else
			ls_seq = vs_text
		end if
		if  is_DATE_SEPARATE_YN = 'Y' then
			ls_seq += vs_date_str+ is_COMBINE_CHAR +vs_number_str
		else
			ls_seq += vs_date_str +vs_number_str
		end if				
	case 'number_text_date'
		if  is_TEXT_SEPARATE_YN = 'Y' then
			ls_seq = vs_number_str+ is_COMBINE_CHAR
		else
			ls_seq = vs_number_str
		end if
		if  is_DATE_SEPARATE_YN = 'Y' then
			ls_seq += vs_text+ is_COMBINE_CHAR +vs_date_str
		else
			ls_seq += vs_text +vs_date_str
		end if				
	case 'number_date_text'
		if  is_TEXT_SEPARATE_YN = 'Y' then
			ls_seq = vs_number_str+ is_COMBINE_CHAR
		else
			ls_seq = vs_number_str
		end if
		if  is_DATE_SEPARATE_YN = 'Y' then
			ls_seq += vs_date_str+ is_COMBINE_CHAR +vs_text
		else
			ls_seq += vs_date_str +vs_text
		end if					
	case 'date_text_number'
		if  is_TEXT_SEPARATE_YN = 'Y' then
			ls_seq = vs_date_str+ is_COMBINE_CHAR
		else
			ls_seq = vs_date_str
		end if
		if  is_DATE_SEPARATE_YN = 'Y' then
			ls_seq += vs_text+ is_COMBINE_CHAR +vs_number_str
		else
			ls_seq += vs_text +vs_number_str
		end if							
	case 'date_number_text'
		if  is_TEXT_SEPARATE_YN = 'Y' then
			ls_seq = vs_date_str+ is_COMBINE_CHAR
		else
			ls_seq = vs_date_str
		end if
		if  is_DATE_SEPARATE_YN = 'Y' then
			ls_seq += vs_number_str+ is_COMBINE_CHAR +vs_text
		else
			ls_seq += vs_number_str +vs_text
		end if									
end choose

return ls_seq
end function

public function string f_create_autonumber (double vdb_temp_seq_id);t_ds_db				lds_seq_del
string					ls_seq_dateString, ls_seq_text, ls_seq_nbrString, ls_seq_combine
double				ldb_nextval
any					laa_value[]


lds_seq_del = create t_ds_db
lds_seq_del.dataobject = 'd_sequences_del_grid'
laa_value[1] = vdb_temp_seq_id
lds_seq_del.f_add_where( 'SEQ_DEL_ID', laa_value[])
lds_seq_del.f_settransobject( sqlca)
if lds_seq_del.retrieve() > 0 then
	//-- Long thêm vào ngày 28/08/2018 tình huống không đánh số liên tục thì không cần lấy từ sequences_del --//
	if this.is_continuous_yn = 'Y' then
		lds_seq_del.setsort( " seq_string a ")
		lds_seq_del.sort( )
		ls_seq_combine = lds_seq_del.getitemstring( 1, 'seq_string')
		lds_seq_del.deleterow( 1)
		if lds_seq_del.update( ) = 1 then
			commit using sqlca;
		end if
		destroy lds_seq_del
		return ls_seq_combine
	end if
else
	this.f_init( vdb_temp_seq_id)	
end if

ldb_nextval = this.f_get_nextvalue( vdb_temp_seq_id)
ls_seq_nbrString = string(ldb_nextval, this.is_format_str )
ls_seq_combine = this.f_get_combined_seq(is_TEXT_STR, ls_seq_nbrString, '')

destroy lds_seq_del
return ls_seq_combine

end function

public function string f_create_autonumber (date vd_date);t_ds_db				lds_seq_del
string					ls_seq_dateString, ls_seq_text, ls_seq_nbrString, ls_seq_combine
double				ldb_nextval, ldb_seq_id
any					laa_value[]

//-- init template sequence --//
if this.is_date_str = 'none' or isnull(this.is_date_str) then return ''

ldb_seq_id = this.f_find_reset_sequence( vd_date)

if ldb_seq_id > 0 then
	//-- Long thêm vào ngày 28/08/2018 tình huống không đánh số liên tục thì không cần lấy từ sequences_del --//
	if this.is_continuous_yn = 'Y' then
		lds_seq_del = create t_ds_db
		lds_seq_del.dataobject = 'd_sequences_del_grid'
		laa_value[1] = ldb_seq_id
		lds_seq_del.f_add_where( 'SEQ_DEL_ID', laa_value[])
		lds_seq_del.f_settransobject( sqlca)
		lds_seq_del.setsort( " seq_string a ")
		if lds_seq_del.retrieve() > 0 then
			ls_seq_combine = lds_seq_del.getitemstring( 1, 'seq_string')
			lds_seq_del.deleterow( 1)
			if lds_seq_del.update( ) = 1 then
				commit using sqlca;
			end if
			destroy  lds_seq_del
			return ls_seq_combine
		else
			this.f_init( ldb_seq_id)
		end if
	end if
elseif ldb_seq_id = 0 then
	ldb_seq_id = this.f_create_reset_sequence( vd_date)
	if ldb_seq_id = -1 then return ''
else
	return ''
end if

ls_seq_dateString = string(vd_date, this.is_date_str)
ldb_nextval = this.f_get_nextvalue( ldb_seq_id, vd_date)
ls_seq_nbrString = string(ldb_nextval, this.is_format_str )
ls_seq_combine = this.f_get_combined_seq(is_TEXT_STR, ls_seq_nbrString, ls_seq_dateString)
destroy  lds_seq_del
return ls_seq_combine

end function

public function integer f_delete_autonumber (string vs_seqstring, date vd_date);t_ds_db				lds_seq_del

double				ldb_Id, ldb_seq_id


ldb_seq_id = this.f_find_reset_sequence( vd_date)

if ldb_seq_id > 0 then
	lds_seq_del = create t_ds_db
	lds_seq_del.dataobject = 'd_sequences_del_grid'
	lds_seq_del.f_settransobject( sqlca)
	lds_seq_del.event e_addrow( )
	ldb_Id = this.f_create_id( )
	
	lds_seq_del.setitem( 1, 'ID', ldb_Id)
	lds_seq_del.setitem( 1, 'SEQ_DEL_ID', ldb_seq_id)
	lds_seq_del.setitem( 1, 'seq_string', vs_seqString)
	lds_seq_del.setitem( 1, 'seq_date', vd_date)
	

	if lds_seq_del.update( ) = 1 then
		commit using sqlca;
		destroy lds_seq_del
		return 1
	else
		gf_messagebox('m.b_sequences.f_delete_autonumber.01','Thông báo','b_sequences.f_delete_autonumber,line 22: Không cập nhật được bảng xóa sequences','exclamation','ok',1)
		destroy lds_seq_del
		return -1
	end if

else
	return -1
end if

end function

public function integer f_delete_autonumber (string vs_seqstring, double vdb_del_seq_id);t_ds_db				lds_seq_del

double				ldb_Id


if vdb_del_seq_id > 0 then
	lds_seq_del = create t_ds_db
	lds_seq_del.dataobject = 'd_sequences_del_grid'
	lds_seq_del.f_settransobject( sqlca)
	lds_seq_del.event e_addrow( )
	ldb_Id = this.f_create_id( )
	
	lds_seq_del.setitem( 1, 'ID', ldb_Id)
	lds_seq_del.setitem( 1, 'SEQ_DEL_ID', vdb_del_seq_id)
	lds_seq_del.setitem( 1, 'seq_string', vs_seqString)
	
	if lds_seq_del.update( ) = 1 then		
		commit using sqlca;
		destroy lds_seq_del
		return 1
	else
		gf_messagebox('m.b_sequences.f_delete_autonumber.01','Thông báo','b_sequences.f_delete_autonumber,line 22: Không cập nhật được bảng xóa sequences','exclamation','ok',1)
		destroy lds_seq_del
		return -1
	end if

else
	return 0
end if

end function

protected function double f_find_reset_sequence (any va_reset_code);t_ds_db				lds_flextable
int						li_rtn
string					ls_seq_resetString
double				ldb_seq_id
any					laa_value[]

if isnull(va_reset_code) then return 0
if  this.is_date_str = 'none' or isnull(this.is_date_str ) then
	ls_seq_resetString = string(va_reset_code)
else
	ls_seq_resetString = string(date(va_reset_code), this.is_date_str)
end if
laa_value[1] ='='+ this.is_seq_code + '@'+ls_seq_resetString
laa_value[2] = '=SEQUENCES'
//-- 
lds_flextable = create t_ds_db
lds_flextable.dataobject = 'd_flexible_data_grid'
lds_flextable.f_add_where( 'code;object_ref_table;', laa_value[])
lds_flextable.f_settransobject( sqlca)

li_rtn =  lds_flextable.retrieve( ) 
if li_rtn = 1 then
	ldb_seq_id = lds_flextable.getitemnumber( 1, 'ID')
	return ldb_seq_id
elseif  li_rtn = 0 then
	return 0
else
	gf_messagebox('m.b_sequences.f_find_reset_sequence.01','Thông báo','Không tìm thấy cách đánh số: @'+string(laa_value[1]) ,'exclamation','ok',1) 
	return -1
end if
end function

public function integer f_delete_autonumber (string vs_seqstring, string vs_reset_str);t_ds_db				lds_seq_del

double				ldb_Id, ldb_seq_id


ldb_seq_id = this.f_find_reset_sequence( vs_reset_str)

if ldb_seq_id > 0 then
	lds_seq_del = create t_ds_db
	lds_seq_del.dataobject = 'd_sequences_del_grid'
	lds_seq_del.f_settransobject( sqlca)
	lds_seq_del.event e_addrow( )
	ldb_Id = this.f_create_id( )
	
	lds_seq_del.setitem( 1, 'ID', ldb_Id)
	lds_seq_del.setitem( 1, 'SEQ_DEL_ID', ldb_seq_id)
	lds_seq_del.setitem( 1, 'seq_string', vs_seqString)
//	lds_seq_del.setitem( 1, 'seq_date', vd_date)
	

	if lds_seq_del.update( ) = 1 then
		commit using sqlca;
		destroy lds_seq_del
		return 1
	else
		gf_messagebox('m.b_sequences.f_delete_autonumber.01','Thông báo','b_sequences.f_delete_autonumber,line 22: Không cập nhật được bảng xóa sequences','exclamation','ok',1)
		destroy lds_seq_del
		return -1
	end if

else
	return -1
end if

end function

protected function double f_create_reset_sequence (any va_reset_code);t_ds_db				lds_flextable, lds_seq
long					ll_row
string					ls_seq_resetString, ls_seq_code, ls_TEXT_STR
double				ldb_flextable_id, ldb_seq_id

if isnull(va_reset_code) then return 0
if this.is_date_str = 'none' or isnull(this.is_date_str) then 
	ls_seq_resetString = string(va_reset_code)
	ls_TEXT_STR = ls_seq_resetString
	this.is_text_str = ls_TEXT_STR	
else
	ls_seq_resetString = string(date(va_reset_code), this.is_date_str)
	ls_TEXT_STR = this.is_text_str
end if

ls_seq_code = this.is_seq_code + '@'+ls_seq_resetString
ldb_flextable_id = this.f_create_id( )

//-- 
lds_flextable = create t_ds_db
lds_flextable.dataobject = 'd_flexible_data_grid'
lds_flextable.f_settransobject( sqlca)

ll_row = lds_flextable.event e_addrow( )
lds_flextable.setitem( ll_row, 'ID', ldb_flextable_id)
lds_flextable.setitem( ll_row, 'code', ls_seq_code)
lds_flextable.setitem( ll_row, 'name', is_seq_name + '-' + ls_seq_resetString)
lds_flextable.setitem( ll_row, 'object_ref_table', 'SEQUENCES')

if lds_flextable.update( ) = -1 then
	gf_messagebox('m.b_sequences.f_create_reset_sequence.01','Thông báo', 'b_sequences.f_create_reset_sequence, line24:Không tạo được seq mới','exlamation','ok',1)
	return -1
end if
this.f_create_db_sequence( ldb_flextable_id, 1)

lds_seq = create t_ds_db
lds_seq.dataobject = 'd_sequences_form'
lds_seq.f_settransobject( sqlca)

ldb_seq_id = this.f_create_id( )
ll_row = lds_seq.event e_addrow( )
lds_seq.setitem( ll_row, 'ID', ldb_seq_id)
lds_seq.setitem( ll_row, 'object_ref_id', ldb_flextable_id)
lds_seq.setitem( ll_row, 'object_ref_table', 'FLEXIBLE_DATA')
lds_seq.setitem( ll_row, 'TYPE', is_TYPE)
lds_seq.setitem( ll_row, 'TEXT_STR', ls_TEXT_STR)
lds_seq.setitem( ll_row, 'FORMAT_STR', is_FORMAT_STR)
lds_seq.setitem( ll_row, 'TEXT_SEPARATE_YN', is_TEXT_SEPARATE_YN)
lds_seq.setitem( ll_row, 'DATE_SEPARATE_YN', is_DATE_SEPARATE_YN)
lds_seq.setitem( ll_row, 'COMBINE_CHAR', is_COMBINE_CHAR)
lds_seq.setitem( ll_row, 'COMBINE_ORDER', is_COMBINE_ORDER)
lds_seq.setitem( ll_row, 'RESET_TYPE', is_RESET_TYPE)
lds_seq.setitem( ll_row, 'DATE_STR', is_DATE_STR)
lds_seq.setitem( ll_row, 'CONTINUOUS_YN', is_CONTINUOUS_YN)
lds_seq.setitem( ll_row, 'START_VALUE', 1)
lds_seq.setitem( ll_row, 'NEXT_VALUE', 1)

if lds_seq.update( ) = -1 then
	rollback using sqlca;
	destroy lds_flextable
	destroy lds_seq
	gf_messagebox('m.b_sequences.f_create_reset_sequence.02','Thông báo', 'b_sequences.f_create_reset_sequence, line52:Không tạo được seq mới','exlamation','ok',1)
	return -1
else
	commit using sqlca;
	destroy lds_flextable
	destroy lds_seq	
	return ldb_flextable_id
end if

end function

public function string f_create_autonumber (string vs_reset_str);t_ds_db				lds_seq_del
string					ls_seq_dateString, ls_seq_text, ls_seq_nbrString, ls_seq_combine
double				ldb_nextval, ldb_seq_id
any					laa_value[]


ldb_seq_id = this.f_find_reset_sequence( vs_reset_str)

if ldb_seq_id > 0 then
	//-- Long thêm vào ngày 28/08/2018 tình huống không đánh số liên tục thì không cần lấy từ sequences_del --//
	if this.is_continuous_yn = 'Y' then
		lds_seq_del = create t_ds_db
		lds_seq_del.dataobject = 'd_sequences_del_grid'
		laa_value[1] = ldb_seq_id
		lds_seq_del.f_add_where( 'SEQ_DEL_ID', laa_value[])
		lds_seq_del.f_settransobject( sqlca)
		lds_seq_del.setsort( " seq_string a ")
		if lds_seq_del.retrieve() > 0 then
			ls_seq_combine = lds_seq_del.getitemstring( 1, 'seq_string')
			lds_seq_del.deleterow( 1)
			if lds_seq_del.update( ) = 1 then
				commit using sqlca;
			end if
			destroy  lds_seq_del
			return ls_seq_combine
		else
			this.f_init(ldb_seq_id )
		end if
	end if
elseif ldb_seq_id = 0 then
	ldb_seq_id = this.f_create_reset_sequence( vs_reset_str)
	if ldb_seq_id = -1 then return ''
else
	return ''
end if

ldb_nextval = this.f_get_nextvalue( ldb_seq_id)
ls_seq_nbrString = string(ldb_nextval, this.is_format_str )
ls_seq_combine = this.f_get_combined_seq(is_TEXT_STR, ls_seq_nbrString, ls_seq_dateString)
destroy  lds_seq_del
return ls_seq_combine

end function

public function boolean f_is_dbseq_existed (string vs_sequence);int			li_cnt

select count(object_id) into :li_cnt from user_objects where object_type = 'SEQUENCE' and object_name = :vs_sequence;

IF li_cnt > 0 then
	return true
else
	return false
end if
end function

public function string f_create_autonumber (double vdb_temp_seq_id, date vd_date);t_ds_db				lds_seq_del
string					ls_seq_dateString, ls_seq_text, ls_seq_nbrString, ls_seq_combine
double				ldb_nextval
any					laa_value[]


lds_seq_del = create t_ds_db
lds_seq_del.dataobject = 'd_sequences_del_grid'
laa_value[1] = vdb_temp_seq_id
lds_seq_del.f_add_where( 'SEQ_DEL_ID', laa_value[])
lds_seq_del.f_settransobject( sqlca)
if lds_seq_del.retrieve() > 0 then
	//-- Long thêm vào ngày 28/08/2018 tình huống không đánh số liên tục thì không cần lấy từ sequences_del --//
	if this.is_continuous_yn = 'Y' then
		lds_seq_del.setsort( " seq_string a ")
		lds_seq_del.sort( )
		ls_seq_combine = lds_seq_del.getitemstring( 1, 'seq_string')
		lds_seq_del.deleterow( 1)
		if lds_seq_del.update( ) = 1 then
			commit using sqlca;
		end if
		destroy lds_seq_del
		return ls_seq_combine
	end if
else
	this.f_init( vdb_temp_seq_id)	
end if

ls_seq_dateString = string(vd_date, this.is_date_str)
ldb_nextval = this.f_get_nextvalue( vdb_temp_seq_id)
ls_seq_nbrString = string(ldb_nextval, this.is_format_str )
ls_seq_combine = this.f_get_combined_seq(is_TEXT_STR, ls_seq_nbrString, ls_seq_dateString)
//ls_seq_combine = this.f_get_combined_seq(is_TEXT_STR, ls_seq_nbrString, '')

destroy lds_seq_del
return ls_seq_combine

end function

public function integer f_init_ex (double vdb_id, ref t_transaction rt_transaction);int			li_cnt

select 
count(sequences.id) into :li_cnt
from flexible_data
join sequences on flexible_data.id = sequences.object_ref_id
where sequences.object_ref_id = :vdb_id and flexible_data.object_ref_table ='SEQUENCES' using rt_transaction;

if li_cnt = 1 then
	select 
	sequences.TYPE,
	coalesce(sequences.TEXT_STR,''),
	coalesce(sequences.FORMAT_STR,'') ,
	coalesce(sequences.TEXT_SEPARATE_YN,'N') ,
	coalesce(sequences.DATE_SEPARATE_YN,'N'),
	coalesce(sequences.COMBINE_CHAR,''),
	sequences.COMBINE_ORDER,
	coalesce(sequences.RESET_TYPE,'none') ,
	coalesce(sequences.DATE_STR,'none')  ,
	coalesce(sequences.CONTINUOUS_YN,'N')  ,
	coalesce(sequences.START_VALUE,0)  ,
	coalesce(sequences.NEXT_VALUE,0) ,  
	coalesce(sequences.LAST_VALUE,0),  
	sequences.LAST_VALUE_DATE,
	coalesce(flexible_data.code,''),
	coalesce(flexible_data.name,'')
	into
	:is_TYPE,
	:is_TEXT_STR,
	:is_FORMAT_STR ,
	:is_TEXT_SEPARATE_YN ,
	:is_DATE_SEPARATE_YN,
	:is_COMBINE_CHAR,
	:is_COMBINE_ORDER,
	:is_RESET_TYPE ,
	:is_DATE_STR  ,
	:is_CONTINUOUS_YN , 
	:idb_START_VALUE,  
	:idb_NEXT_VALUE ,  
	:idb_LAST_VALUE , 
	:id_LAST_VALUE_DATE,
	:is_seq_code,
	:is_seq_name
	from flexible_data
	join sequences on flexible_data.id = sequences.object_ref_id
	where sequences.object_ref_id = :vdb_id and flexible_data.object_ref_table ='SEQUENCES' using rt_transaction;
	
	if isnull(is_TEXT_STR) then is_TEXT_STR = ''
	if isnull(is_FORMAT_STR) then is_FORMAT_STR = ''
	if isnull(is_COMBINE_CHAR) then is_COMBINE_CHAR = ''
	if isnull(is_seq_code) then is_seq_code = ''
	if isnull(is_seq_name) then is_seq_name = ''	
	return 1
else
	return 0
end if

end function

public function string f_create_autonumber_ex (date vd_date, ref t_transaction rt_transaction);t_ds_db				lds_seq_del
string					ls_seq_dateString, ls_seq_text, ls_seq_nbrString, ls_seq_combine
double				ldb_nextval, ldb_seq_id
any					laa_value[]

//-- init template sequence --//
if this.is_date_str = 'none' or isnull(this.is_date_str) then return ''

ldb_seq_id = this.f_find_reset_sequence_ex( vd_date, rt_transaction)

if ldb_seq_id > 0 then
	//-- Long thêm vào ngày 28/08/2018 tình huống không đánh số liên tục thì không cần lấy từ sequences_del --//
	if this.is_continuous_yn = 'Y' then
		lds_seq_del = create t_ds_db
		lds_seq_del.dataobject = 'd_sequences_del_grid'
		laa_value[1] = ldb_seq_id
		lds_seq_del.f_add_where( 'SEQ_DEL_ID', laa_value[])
		lds_seq_del.f_settransobject( rt_transaction)
		lds_seq_del.setsort( " seq_string a ")
		if lds_seq_del.retrieve() > 0 then
			ls_seq_combine = lds_seq_del.getitemstring( 1, 'seq_string')
			lds_seq_del.deleterow( 1)
			if lds_seq_del.update( ) = 1 then
				commit using rt_transaction;
			end if
			destroy  lds_seq_del
			return ls_seq_combine
		else
			this.f_init_ex( ldb_seq_id, rt_transaction)
		end if
	end if
elseif ldb_seq_id = 0 then
	ldb_seq_id = this.f_create_reset_sequence_ex( vd_date,rt_transaction)
	if ldb_seq_id = -1 then return ''
else
	return ''
end if

ls_seq_dateString = string(vd_date, this.is_date_str)
ldb_nextval = this.f_get_nextvalue_ex( ldb_seq_id, vd_date, rt_transaction)
ls_seq_nbrString = string(ldb_nextval, this.is_format_str )
ls_seq_combine = this.f_get_combined_seq(is_TEXT_STR, ls_seq_nbrString, ls_seq_dateString)
destroy  lds_seq_del
return ls_seq_combine

end function

public function string f_create_autonumber_ex (double vdb_temp_seq_id, ref t_transaction rt_transaction);t_ds_db				lds_seq_del
string					ls_seq_dateString, ls_seq_text, ls_seq_nbrString, ls_seq_combine
double				ldb_nextval
any					laa_value[]


lds_seq_del = create t_ds_db
lds_seq_del.dataobject = 'd_sequences_del_grid'
laa_value[1] = vdb_temp_seq_id
lds_seq_del.f_add_where( 'SEQ_DEL_ID', laa_value[])
lds_seq_del.f_settransobject( rt_transaction)
if lds_seq_del.retrieve() > 0 then
	//-- Long thêm vào ngày 28/08/2018 tình huống không đánh số liên tục thì không cần lấy từ sequences_del --//
	if this.is_continuous_yn = 'Y' then
		lds_seq_del.setsort( " seq_string a ")
		lds_seq_del.sort( )
		ls_seq_combine = lds_seq_del.getitemstring( 1, 'seq_string')
		lds_seq_del.deleterow( 1)
		if lds_seq_del.update( ) = 1 then
			commit using rt_transaction;
		end if
		destroy lds_seq_del
		return ls_seq_combine
	end if
else
	this.f_init_ex( vdb_temp_seq_id, rt_transaction)	
end if

ldb_nextval = this.f_get_nextvalue_ex( vdb_temp_seq_id, rt_transaction)
ls_seq_nbrString = string(ldb_nextval, this.is_format_str )
ls_seq_combine = this.f_get_combined_seq(is_TEXT_STR, ls_seq_nbrString, '')

destroy lds_seq_del
return ls_seq_combine

end function

public function string f_create_autonumber_ex (double vdb_temp_seq_id, date vd_date, ref t_transaction rt_transaction);t_ds_db				lds_seq_del
string					ls_seq_dateString, ls_seq_text, ls_seq_nbrString, ls_seq_combine
double				ldb_nextval
any					laa_value[]


lds_seq_del = create t_ds_db
lds_seq_del.dataobject = 'd_sequences_del_grid'
laa_value[1] = vdb_temp_seq_id
lds_seq_del.f_add_where( 'SEQ_DEL_ID', laa_value[])
lds_seq_del.f_settransobject( rt_transaction)
if lds_seq_del.retrieve() > 0 then
	//-- Long thêm vào ngày 28/08/2018 tình huống không đánh số liên tục thì không cần lấy từ sequences_del --//
	if this.is_continuous_yn = 'Y' then
		lds_seq_del.setsort( " seq_string a ")
		lds_seq_del.sort( )
		ls_seq_combine = lds_seq_del.getitemstring( 1, 'seq_string')
		lds_seq_del.deleterow( 1)
		if lds_seq_del.update( ) = 1 then
			commit using rt_transaction;
		end if
		destroy lds_seq_del
		return ls_seq_combine
	end if
else
	this.f_init_ex( vdb_temp_seq_id, rt_transaction)	
end if

ls_seq_dateString = string(vd_date, this.is_date_str)
ldb_nextval = this.f_get_nextvalue_ex( vdb_temp_seq_id, rt_transaction)
ls_seq_nbrString = string(ldb_nextval, this.is_format_str )
ls_seq_combine = this.f_get_combined_seq(is_TEXT_STR, ls_seq_nbrString, ls_seq_dateString)
//ls_seq_combine = this.f_get_combined_seq(is_TEXT_STR, ls_seq_nbrString, '')

destroy lds_seq_del
return ls_seq_combine

end function

public function string f_create_autonumber_ex (string vs_reset_str, ref t_transaction rt_transaction);t_ds_db				lds_seq_del
string					ls_seq_dateString, ls_seq_text, ls_seq_nbrString, ls_seq_combine
double				ldb_nextval, ldb_seq_id
any					laa_value[]


ldb_seq_id = this.f_find_reset_sequence_ex( vs_reset_str, rt_transaction)

if ldb_seq_id > 0 then
	//-- Long thêm vào ngày 28/08/2018 tình huống không đánh số liên tục thì không cần lấy từ sequences_del --//
	if this.is_continuous_yn = 'Y' then
		lds_seq_del = create t_ds_db
		lds_seq_del.dataobject = 'd_sequences_del_grid'
		laa_value[1] = ldb_seq_id
		lds_seq_del.f_add_where( 'SEQ_DEL_ID', laa_value[])
		lds_seq_del.f_settransobject( rt_transaction)
		lds_seq_del.setsort( " seq_string a ")
		if lds_seq_del.retrieve() > 0 then
			ls_seq_combine = lds_seq_del.getitemstring( 1, 'seq_string')
			lds_seq_del.deleterow( 1)
			if lds_seq_del.update( ) = 1 then
				commit using rt_transaction;
			end if
			destroy  lds_seq_del
			return ls_seq_combine
		else
			this.f_init_ex(ldb_seq_id ,  rt_transaction)
		end if
	end if
elseif ldb_seq_id = 0 then
	ldb_seq_id = this.f_create_reset_sequence_ex( vs_reset_str,rt_transaction)
	if ldb_seq_id = -1 then return ''
else
	return ''
end if

ldb_nextval = this.f_get_nextvalue_ex( ldb_seq_id, rt_transaction)
ls_seq_nbrString = string(ldb_nextval, this.is_format_str )
ls_seq_combine = this.f_get_combined_seq(is_TEXT_STR, ls_seq_nbrString, ls_seq_dateString)
destroy  lds_seq_del
return ls_seq_combine

end function

protected function double f_create_reset_sequence_ex (any va_reset_code, ref t_transaction rt_transaction);t_ds_db				lds_flextable, lds_seq
long					ll_row
string					ls_seq_resetString, ls_seq_code, ls_TEXT_STR
double				ldb_flextable_id, ldb_seq_id

if isnull(va_reset_code) then return 0
if this.is_date_str = 'none' or isnull(this.is_date_str) then 
	ls_seq_resetString = string(va_reset_code)
	ls_TEXT_STR = ls_seq_resetString
	this.is_text_str = ls_TEXT_STR	
else
	ls_seq_resetString = string(date(va_reset_code), this.is_date_str)
	ls_TEXT_STR = this.is_text_str
end if

ls_seq_code = this.is_seq_code + '@'+ls_seq_resetString
ldb_flextable_id = this.f_create_id_ex( rt_transaction)

//-- 
lds_flextable = create t_ds_db
lds_flextable.dataobject = 'd_flexible_data_grid'
lds_flextable.f_settransobject( rt_transaction)

ll_row = lds_flextable.event e_addrow( )
lds_flextable.setitem( ll_row, 'ID', ldb_flextable_id)
lds_flextable.setitem( ll_row, 'code', ls_seq_code)
lds_flextable.setitem( ll_row, 'name', is_seq_name + '-' + ls_seq_resetString)
lds_flextable.setitem( ll_row, 'object_ref_table', 'SEQUENCES')

if lds_flextable.update( ) = -1 then
	gf_messagebox('m.b_sequences.f_create_reset_sequence.01','Thông báo', 'b_sequences.f_create_reset_sequence, line24:Không tạo được seq mới','exlamation','ok',1)
	return -1
end if
this.f_create_db_sequence_ex( ldb_flextable_id, 1, rt_transaction)

lds_seq = create t_ds_db
lds_seq.dataobject = 'd_sequences_form'
lds_seq.f_settransobject( rt_transaction)

ldb_seq_id = this.f_create_id_ex(rt_transaction )
ll_row = lds_seq.event e_addrow( )
lds_seq.setitem( ll_row, 'ID', ldb_seq_id)
lds_seq.setitem( ll_row, 'object_ref_id', ldb_flextable_id)
lds_seq.setitem( ll_row, 'object_ref_table', 'FLEXIBLE_DATA')
lds_seq.setitem( ll_row, 'TYPE', is_TYPE)
lds_seq.setitem( ll_row, 'TEXT_STR', ls_TEXT_STR)
lds_seq.setitem( ll_row, 'FORMAT_STR', is_FORMAT_STR)
lds_seq.setitem( ll_row, 'TEXT_SEPARATE_YN', is_TEXT_SEPARATE_YN)
lds_seq.setitem( ll_row, 'DATE_SEPARATE_YN', is_DATE_SEPARATE_YN)
lds_seq.setitem( ll_row, 'COMBINE_CHAR', is_COMBINE_CHAR)
lds_seq.setitem( ll_row, 'COMBINE_ORDER', is_COMBINE_ORDER)
lds_seq.setitem( ll_row, 'RESET_TYPE', is_RESET_TYPE)
lds_seq.setitem( ll_row, 'DATE_STR', is_DATE_STR)
lds_seq.setitem( ll_row, 'CONTINUOUS_YN', is_CONTINUOUS_YN)
lds_seq.setitem( ll_row, 'START_VALUE', 1)
lds_seq.setitem( ll_row, 'NEXT_VALUE', 1)

if lds_seq.update( ) = -1 then
	rollback using rt_transaction;
	destroy lds_flextable
	destroy lds_seq
	gf_messagebox('m.b_sequences.f_create_reset_sequence.02','Thông báo', 'b_sequences.f_create_reset_sequence, line52:Không tạo được seq mới','exlamation','ok',1)
	return -1
else
	commit using rt_transaction;
	destroy lds_flextable
	destroy lds_seq	
	return ldb_flextable_id
end if

end function

public function integer f_create_db_sequence_ex (long vl_seq_id, long vl_start_value, ref t_transaction rt_transaction);string ls_sql
int		li_null

If IsNull(vl_seq_id) or IsNull(vl_start_value) Then
	SetNull(li_null)
	Return li_null
End If


ls_sql = "CREATE SEQUENCE " + '"'+string(vl_seq_id)+'"'  &
		+ " START WITH " + string(vl_start_value) &
		+ " MAXVALUE 999999999999999999999999999"  & 
		+ " NOCACHE"

EXECUTE IMMEDIATE :ls_sql using rt_transaction;

If rt_transaction.SQLCode = -1 Then Return -1

//UPDATE SEQUENCES SET NEXT_VALUE = :vl_start_value
//WHERE object_ref_id =:vl_seq_id using sqlca;
//COMMIT using sqlca;
	 
Return 1
end function

public function integer f_delete_autonumber_ex (string vs_seqstring, date vd_date, ref t_transaction rt_transaction);t_ds_db				lds_seq_del

double				ldb_Id, ldb_seq_id


ldb_seq_id = this.f_find_reset_sequence_ex( vd_date, rt_transaction)

if ldb_seq_id > 0 then
	lds_seq_del = create t_ds_db
	lds_seq_del.dataobject = 'd_sequences_del_grid'
	lds_seq_del.f_settransobject( rt_transaction)
	lds_seq_del.event e_addrow( )
	ldb_Id = this.f_create_id_ex(rt_transaction )
	
	lds_seq_del.setitem( 1, 'ID', ldb_Id)
	lds_seq_del.setitem( 1, 'SEQ_DEL_ID', ldb_seq_id)
	lds_seq_del.setitem( 1, 'seq_string', vs_seqString)
	lds_seq_del.setitem( 1, 'seq_date', vd_date)
	

	if lds_seq_del.update( ) = 1 then
		commit using rt_transaction;
		destroy lds_seq_del
		return 1
	else
		gf_messagebox('m.b_sequences.f_delete_autonumber.01','Thông báo','b_sequences.f_delete_autonumber,line 22: Không cập nhật được bảng xóa sequences','exclamation','ok',1)
		destroy lds_seq_del
		return -1
	end if

else
	return -1
end if

end function

public function integer f_delete_autonumber_ex (string vs_seqstring, double vdb_del_seq_id, ref t_transaction rt_transaction);t_ds_db				lds_seq_del

double				ldb_Id


if vdb_del_seq_id > 0 then
	lds_seq_del = create t_ds_db
	lds_seq_del.dataobject = 'd_sequences_del_grid'
	lds_seq_del.f_settransobject( rt_transaction)
	lds_seq_del.event e_addrow( )
	ldb_Id = this.f_create_id_ex(rt_transaction )
	
	lds_seq_del.setitem( 1, 'ID', ldb_Id)
	lds_seq_del.setitem( 1, 'SEQ_DEL_ID', vdb_del_seq_id)
	lds_seq_del.setitem( 1, 'seq_string', vs_seqString)
	
	if lds_seq_del.update( ) = 1 then		
		commit using rt_transaction;
		destroy lds_seq_del
		return 1
	else
		gf_messagebox('m.b_sequences.f_delete_autonumber.01','Thông báo','b_sequences.f_delete_autonumber,line 22: Không cập nhật được bảng xóa sequences','exclamation','ok',1)
		destroy lds_seq_del
		return -1
	end if

else
	return 0
end if

end function

public function integer f_delete_autonumber_ex (string vs_seqstring, string vs_reset_str, ref t_transaction rt_transaction);t_ds_db				lds_seq_del

double				ldb_Id, ldb_seq_id


ldb_seq_id = this.f_find_reset_sequence_ex( vs_reset_str,rt_transaction )

if ldb_seq_id > 0 then
	lds_seq_del = create t_ds_db
	lds_seq_del.dataobject = 'd_sequences_del_grid'
	lds_seq_del.f_settransobject( rt_transaction)
	lds_seq_del.event e_addrow( )
	ldb_Id = this.f_create_id_ex(rt_transaction )
	
	lds_seq_del.setitem( 1, 'ID', ldb_Id)
	lds_seq_del.setitem( 1, 'SEQ_DEL_ID', ldb_seq_id)
	lds_seq_del.setitem( 1, 'seq_string', vs_seqString)
//	lds_seq_del.setitem( 1, 'seq_date', vd_date)
	

	if lds_seq_del.update( ) = 1 then
		commit using rt_transaction;
		destroy lds_seq_del
		return 1
	else
		gf_messagebox('m.b_sequences.f_delete_autonumber.01','Thông báo','b_sequences.f_delete_autonumber,line 22: Không cập nhật được bảng xóa sequences','exclamation','ok',1)
		destroy lds_seq_del
		return -1
	end if

else
	return -1
end if

end function

protected function double f_find_reset_sequence_ex (any va_reset_code, ref t_transaction rt_transaction);t_ds_db				lds_flextable
int						li_rtn
string					ls_seq_resetString
double				ldb_seq_id
any					laa_value[]

if isnull(va_reset_code) then return 0
if  this.is_date_str = 'none' or isnull(this.is_date_str ) then
	ls_seq_resetString = string(va_reset_code)
else
	ls_seq_resetString = string(date(va_reset_code), this.is_date_str)
end if
laa_value[1] ='='+ this.is_seq_code + '@'+ls_seq_resetString
laa_value[2] = '=SEQUENCES'
//-- 
lds_flextable = create t_ds_db
lds_flextable.dataobject = 'd_flexible_data_grid'
lds_flextable.f_add_where( 'code;object_ref_table;', laa_value[])
lds_flextable.f_settransobject( rt_transaction)

li_rtn =  lds_flextable.retrieve( ) 
if li_rtn = 1 then
	ldb_seq_id = lds_flextable.getitemnumber( 1, 'ID')
	return ldb_seq_id
elseif  li_rtn = 0 then
	return 0
else
	gf_messagebox('m.b_sequences.f_find_reset_sequence.01','Thông báo','Không tìm thấy cách đánh số: @'+string(laa_value[1]) ,'exclamation','ok',1) 
	return -1
end if
end function

public function double f_get_nextvalue_ex (long vl_seq_id, ref t_transaction rt_transaction);double ll_seq
string ls_sql,ls_seq_id

DynamicStagingArea dsa_stage1
dsa_stage1 = CREATE DynamicStagingArea


ls_seq_id = string(vl_seq_id)
SELECT COUNT(SEQUENCE_NAME) into :ll_seq  FROM USER_SEQUENCES WHERE SEQUENCE_NAME = :ls_seq_id USING rt_transaction;
if ll_seq = 0 then this.f_create_db_sequence_ex( vl_seq_id, 1, rt_transaction)
if rt_transaction.SQLCODE = -1 then return -1
/*
	DECLARE my_cursor DYNAMIC CURSOR FOR dsa_stage1 ;	
		ls_sql = "SELECT " + '"'+string(vl_seq_id) + '"'+ ".nextval FROM dual"
		PREPARE dsa_stage1 FROM :ls_sql ;
		OPEN DYNAMIC my_cursor;
//		if sqlca.sqlcode = -1 then
//			this.f_create_db_sequence( vl_seq_id, 1)
//			OPEN DYNAMIC my_cursor;
//		end if		
		FETCH my_cursor INTO :ll_seq ;
		CLOSE my_cursor ;
		destroy dsa_stage1
		*/
	ll_seq = rt_transaction.f_seq_nextval(string(vl_seq_id))
	
    UPDATE SEQUENCES SET NEXT_VALUE = :ll_seq + 1,  LAST_VALUE = :ll_seq
	 WHERE object_ref_ID = :vl_seq_id using rt_transaction;
	 COMMIT using rt_transaction;
return ll_seq
end function

public function double f_get_nextvalue_ex (long vl_seq_id, date vd_date, ref t_transaction rt_transaction);double ll_seq
string ls_sql

/*
	DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;	
		ls_sql = "SELECT " + '"'+string(vl_seq_id) +'"'+ ".nextval FROM dual"
		PREPARE SQLSA FROM :ls_sql ;
		OPEN DYNAMIC my_cursor;
		FETCH my_cursor INTO :ll_seq ;
		CLOSE my_cursor ;
		
    UPDATE SEQUENCES SET NEXT_VALUE = :ll_seq + 1 ,
	 								 LAST_VALUE = :ll_seq ,
									 LAST_VALUE_DATE	= 	:vd_date
	 WHERE OBJECT_REF_ID = :vl_seq_id;
	 COMMIT using vl_seq_id;
	 */
ll_seq = rt_transaction.f_seq_nextval(string(vl_seq_id) )

return ll_seq
end function

public function integer f_drop_db_sequence_ex (long vl_seq_id, ref t_transaction rt_transaction);string ls_sql
int		li_null

If IsNull(vl_seq_id) Then
	SetNull(li_null)
	Return li_null
End If

	ls_sql = "DROP SEQUENCE " + '"'+string(vl_seq_id) + '"'
			
	EXECUTE IMMEDIATE :ls_sql using rt_transaction;
	
	If rt_transaction.SQLCode = -1 Then Return -1

Return 1
end function

public function boolean f_is_dbseq_existed_ex (string vs_sequence, ref t_transaction rt_transaction);int			li_cnt

select count(object_id) into :li_cnt from user_objects where object_type = 'SEQUENCE' and object_name = :vs_sequence using rt_transaction;

IF li_cnt > 0 then
	return true
else
	return false
end if
end function

public function integer f_reset_db_sequence_ex (long vl_seq_id, long vl_start_value, ref t_transaction rt_transaction);int		li_null, li_rt

If IsNull(vl_seq_id) or IsNull(vl_start_value) Then
	SetNull(li_null)
	Return li_null
End If

	li_rt = f_drop_db_sequence_ex(vl_seq_id, rt_transaction)
	If li_rt <> 1 Then Return -1
	
	li_rt = f_create_db_sequence_ex(vl_seq_id, vl_start_value, rt_transaction)
	If li_rt <> 1 Then Return -1
	
Return 1
end function

on b_sequences.create
call super::create
end on

on b_sequences.destroy
call super::destroy
end on

