$PBExportHeader$c_dwsetup_initial.sru
forward
global type c_dwsetup_initial from s_object_instantiate
end type
end forward

global type c_dwsetup_initial from s_object_instantiate
end type

type variables
any				iaa_rtn_data[]
string				ias_rtn_data[], is_receive_column, is_return_column, is_ACCEPT_OUT_OF_LIST_YN

t_ds_db			ids_setup_dw
end variables

forward prototypes
public function integer f_set_autonumber (string vs_colname, t_dw vdw_handle, long vl_row)
public function integer f_del_autonumber (string vs_colname, t_dw vdw_handle)
public function string f_get_enter_column ()
public function long f_init_ids_setup_dw (string vs_objname)
public function string f_get_must_save_string (string vs_dwo, string vs_objectname, string vs_coltype)
public function string f_get_must_booked_string (string vs_dwo, string vs_objectname, string vs_coltype)
public function string f_get_displayonly_string (string vs_dwo, string vs_objectname, string vs_coltype)
public function string f_get_textcolor_string (string vs_dwo, string vs_objectname, string vs_coltype)
public function string f_get_visible_string (string vs_dwo, string vs_objectname, string vs_coltype)
public function boolean f_is_valueset_accept_out_of_list_value (string vs_dwo, string vs_colname)
public function boolean f_is_branch_yn (string vs_dwo)
public function string f_get_backcolor_string (string vs_dwo, string vs_objectname, string vs_coltype)
public function string f_get_protect_save_string (string vs_dwo, string vs_objectname, string vs_coltype)
public function integer f_get_dwdatatype_string (string vs_colname, string vs_coltype, t_dw rdw_handle, ref string rs_dwdatatype)
public function integer f_initvalue (datawindow vdw_handle, long vl_row)
public function integer f_set_initvalue (datawindow vdw_handle, long vl_row_dwhandle, long vl_row_dwsetup, string vs_colname, string vs_coltype, string vs_colstyle, string vs_value)
public function integer f_get_payment_dwo_colname (string vs_dwo, string vs_objectname, ref string rs_base_date_dwo, ref string rs_base_date_column)
public function integer f_get_report_date (string vs_data, ref date rd_prior_period_date, ref date rd_last_period_date)
public function integer f_auto_copy_field (t_dw_mpl vdw_handle, long vl_row)
public function boolean f_is_valueset_receive_number (string vs_dwobject, string vs_receive_column)
public function boolean f_is_valueset_return_number (string vs_dwvalueset_object, string vs_return_column)
public function integer f_get_must_booked_colname (t_dw_mpl vdw_handle, ref string rsa_colname[])
public function boolean f_is_match_not_modify (string vs_dwo, string vs_objectname)
public function integer f_get_sequence_info (string vs_seq_str, ref double rdb_seq_id)
public function boolean f_is_dwdatatype (string vs_dwdatatype_string, powerobject vpo_handling)
public function integer f_get_sequence_info (powerobject vpo_handle, string vs_colname, ref double rdb_seq_id, ref string vs_seq_reset_colname)
public function boolean f_is_duplicated_data (datawindow vdw_handle, long vl_row, ref string rs_duplicated_colname)
public function integer f_get_unique_colnames (datawindow vdw_handle, ref string rs_unique_colnames)
public function integer f_set_initvalue (t_ds_db vds_handle, long vl_row_dwhandle, long vl_row_dwsetup, string vs_colname, string vs_coltype, string vs_colstyle, string vs_value)
public function integer f_initvalue (t_ds_db vds_handle, long vl_row)
public function string f_get_drilldown_object (string vs_dwo, string vs_colname)
public function boolean f_is_object_branch_yn (string vs_object)
public function string f_get_textcolor_string (string vs_dwo, string vs_objectname, string vs_coltype, t_dw vdw_handle)
public function integer f_set_autonumber (t_dw vdw_handle, long vl_row)
public function integer f_set_initvalue (t_dw vdw_handle, long vl_row_dwhandle, t_ds_db vds_dwsetup, long vl_row_dwsetup, string vs_colname, string vs_coltype, string vs_colstyle, string vs_value)
public function long f_retrieve_dwc (s_object_display rod_hdl, s_w_main rw_parent, t_dw_mpl rdw_parent, datawindowchild rdwc_hdl, string vs_colname, t_ds_db vds_dwsetup)
public function boolean f_is_duplicated_data (t_dw_mpl vdw_handle, long vl_row)
public function long f_init_ids_setup_dw_ex (string vs_objname, ref t_transaction rt_transaction)
public function integer f_set_autonumber_ex (t_dw vdw_handle, long vl_row, ref t_transaction rt_transaction)
public function integer f_set_autonumber_ex (string vs_colname, t_dw vdw_handle, long vl_row, ref t_transaction rt_transaction)
public function boolean f_is_duplicated_data_ex (t_dw_mpl vdw_handle, long vl_row)
public function long f_init_ids_setup_dw_ex (string vs_objname)
public function string f_get_autonumber_ex (string vs_colname, t_dw vdw_handle, long vl_row, ref t_transaction rt_transaction)
public function integer f_get_sequence_info (string vs_dwo, string vs_colname, ref double rdb_seq_id, ref string vs_seq_reset_colname)
public function string f_get_autonumber_ex (string vs_colname, string vs_dwo, ref t_transaction rt_transaction)
public function long f_init_ids_setup_dw_ex (double vdb_branch, string vs_objname, ref t_transaction rt_transaction)
public function integer f_get_initvalue (string vs_dwo, string vs_colname, double vdb_branch_id, ref any ra_value)
public function boolean f_is_duplicated_data_ex (t_dw_mpl vdw_handle, long vl_row, double vdb_branch)
end prototypes

public function integer f_set_autonumber (string vs_colname, t_dw vdw_handle, long vl_row);b_sequences		lb_sequences
double				ldb_seq_id
string					ls_seq_reset_colname, ls_seq_reset_coltext, ls_autonumber, ls_current_autonumber
//date					ld_origin_date, ld_current_date
any					la_origin_reset_data, la_current_reset_data

//-- Kiểm tra cột auto-sequence --//
this.f_get_sequence_info(vdw_handle, vs_colname,ldb_seq_id, ls_seq_reset_colname)
if ldb_seq_id = 0 then return 0

if lb_sequences.f_init(ldb_seq_id) = 1 then
	if lb_sequences.is_type = 'manual' then return 0
	ls_current_autonumber = vdw_handle.getitemstring(vl_row, vs_colname)
	if isnull(ls_current_autonumber) then //-- chưa tạo số --//
		if lb_sequences.is_reset_type = 'none' then
			
			if ls_seq_reset_colname = '' or isnull(ls_seq_reset_colname) then
				ls_autonumber = lb_sequences.f_create_autonumber(ldb_seq_id)
			else
				if lower(trim(ls_seq_reset_colname)) = 'session_date' then
					la_current_reset_data = gd_session_date
				else
					la_current_reset_data = vdw_handle.f_getitemany(vl_row, ls_seq_reset_colname)
					ls_autonumber = lb_sequences.f_create_autonumber(ldb_seq_id, date(la_current_reset_data))
				end if				
			end if
		else
			if ls_seq_reset_colname = '' or isnull(ls_seq_reset_colname) then
				gf_messagebox('m.c_dwsetup_initial.f_set_autonumber.01','Thông báo','Chưa cài đặt cột ngày tạo số tự động cho cách đánh số:@'+&
										lb_sequences.is_seq_code + '-' + lb_sequences.is_seq_name, 'exclamation','ok',1)
				return -1
			end if		
			if lower(trim(ls_seq_reset_colname)) = 'session_date' then
				la_current_reset_data = gd_session_date
			else
				la_current_reset_data = vdw_handle.f_getitemany(vl_row, ls_seq_reset_colname)
			end if
			if isnull(la_current_reset_data) then
				ls_seq_reset_coltext = vdw_handle.describe(ls_seq_reset_colname+'_t.text')
				gf_messagebox('m.c_dwsetup_initial.f_set_autonumber.02','Thông báo','Chưa nhập dữ liệu :@'+ls_seq_reset_coltext, 'exclamation','ok',1)			
				vdw_handle.setitem(vl_row, vs_colname, ls_autonumber)
				return -1
			end if
			if lb_sequences.is_reset_type = 'structure' then
				ls_autonumber = lb_sequences.f_create_autonumber(string(la_current_reset_data))			
			else
				ls_autonumber = lb_sequences.f_create_autonumber(date(la_current_reset_data))
			end if
		end if			
	else //-- đã có số --//
		if lb_sequences.is_reset_type = 'none' then return 0		
		la_origin_reset_data = vdw_handle.f_getitemany(vl_row, ls_seq_reset_colname, primary!, true)
		la_current_reset_data = vdw_handle.f_getitemany(vl_row, ls_seq_reset_colname, primary!, false)
		if isnull(la_current_reset_data) then
			ls_seq_reset_coltext = vdw_handle.describe(ls_seq_reset_colname+'_t.text')
			gf_messagebox('m.c_dwsetup_initial.f_set_autonumber.02','Thông báo','Chưa nhập dữ liệu :@'+ls_seq_reset_coltext, 'exclamation','ok',1)			
			return -1
		end if
		choose case lb_sequences.is_reset_type 
			case 'monthly'
				if month(date(la_current_reset_data)) = month(date(la_origin_reset_data)) then return 0					
			case 'yearly'
				if year(date(la_current_reset_data)) = year(date(la_origin_reset_data)) then return 0						
			case 'daily'
				if day(date(la_current_reset_data)) = day(date(la_origin_reset_data)) then return 0				
			case 'structure'
				if string(la_current_reset_data) = string(la_origin_reset_data) then return 0
		end choose		
		
		if lb_sequences.is_reset_type = 'structure' then
			//-- xóa seq cũ --//
			lb_sequences.f_delete_autonumber(ls_current_autonumber, string(la_origin_reset_data))
			//--tạo seq mới --//
			ls_autonumber = lb_sequences.f_create_autonumber(string(la_current_reset_data))
		else
			//-- xóa seq cũ --//
			lb_sequences.f_delete_autonumber(ls_current_autonumber, date(la_origin_reset_data))
			//--tạo seq mới --//
			ls_autonumber = lb_sequences.f_create_autonumber(date(la_current_reset_data))
		end if			
	end if
else
	return 0
end if

return vdw_handle.setitem(vl_row, vs_colname, ls_autonumber)

end function

public function integer f_del_autonumber (string vs_colname, t_dw vdw_handle);b_sequences		lb_sequences
s_w_main			ldw_parent
double				ldb_seq_id
string					ls_seq_reset_colname, ls_autonumber, ls_delete_autonumber, ld_reset_str
date					ld_origin_date, ld_delete_date
long					ll_del_row

//-- Kiểm tra cột auto-sequence --//
this.f_get_sequence_info(vdw_handle, vs_colname,ldb_seq_id, ls_seq_reset_colname)
if ldb_seq_id = 0 then return 0

vdw_handle.f_getparentwindow(ldw_parent)

if lb_sequences.f_init_ex(ldb_seq_id, ldw_parent.it_transaction ) = 1 then
	if lb_sequences.is_type = 'manual' then return 0
	//-- Long thêm vào ngày 28/08/2018 xử lý tình huống không tích đánh số liên tục thì không cần lưu vào SEQUENCES_DEL --//
	if lb_sequences.is_CONTINUOUS_YN = 'N' or isnull(lb_sequences.is_CONTINUOUS_YN) then return 0
	FOR ll_del_row =1 to vdw_handle.deletedcount()
		ls_delete_autonumber = vdw_handle.getitemstring(ll_del_row, vs_colname, delete!,false)
		if isnull(ls_delete_autonumber) or ls_delete_autonumber ='' then continue
		if lb_sequences.is_reset_type = 'none' then
			lb_sequences.f_delete_autonumber_ex(ls_delete_autonumber , ldb_seq_id, ldw_parent.it_transaction )
		elseif lb_sequences.is_reset_type = 'structure' then
			ld_reset_str = vdw_handle.getitemstring(ll_del_row, ls_seq_reset_colname, delete!,false)
			lb_sequences.f_delete_autonumber_ex(ls_delete_autonumber , ld_reset_str, ldw_parent.it_transaction )	
		else
			ld_delete_date = date(vdw_handle.getitemdatetime(ll_del_row, ls_seq_reset_colname, delete!,false))
			lb_sequences.f_delete_autonumber_ex(ls_delete_autonumber , ld_delete_date, ldw_parent.it_transaction )			
		end if
	NEXT
end if	
return vdw_handle.deletedcount()
end function

public function string f_get_enter_column ();string 			ls_enter_column
long			ll_row_found

ll_row_found = this.ids_setup_dw.find( "not isnull(ENTER_PROCESS_COL)" ,1, ids_setup_dw.rowcount( ))
if ll_row_found = 0 then
	return ''
else
	ls_enter_column = this.ids_setup_dw.getitemstring( ll_row_found, 'ENTER_PROCESS_COL')
	return ls_enter_column
end if

end function

public function long f_init_ids_setup_dw (string vs_objname);any		laa_value[]

if isvalid(ids_setup_dw) then
	ids_setup_dw.setfilter( "") 
	ids_setup_dw.filter( )
	if ids_setup_dw.rowcount() > 0 then
		is_receive_column = ''
		is_return_column = ''
		return 1
	else
		ids_setup_dw.dataobject = 'ds_setup_dw'
	end if
else
	ids_setup_dw = create t_ds_db
	ids_setup_dw.dataobject = 'ds_setup_dw'
end if
is_receive_column = ''
is_return_column = ''

laa_value[1] = '='+upper(vs_objname)
laa_value[2] = gi_user_comp_id
laa_value[3] = gdb_branch
ids_setup_dw.f_add_where('object;company_id;branch_id;',laa_value[])
ids_setup_dw.settransobject (sqlca)
return ids_setup_dw.retrieve()

end function

public function string f_get_must_save_string (string vs_dwo, string vs_objectname, string vs_coltype);string			ls_must_save_criteria_col, ls_expression, ls_coltype, ls_dwo
long			ll_row_found
c_string		lc_string
datastore		lds_temp

ls_expression ="no"
ls_dwo = left(vs_dwo, len(vs_dwo) - 5)
ll_row_found = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" + vs_objectname + "' AND mandatory_save_yn = 'Y' ",1, ids_setup_dw.rowcount( ) )
if ll_row_found > 0 then	
	ls_must_save_criteria_col = this.ids_setup_dw.getitemstring(ll_row_found, 'MUST_SAVE_CRITERIA_COL')		
	if not isnull(ls_must_save_criteria_col) and trim(ls_must_save_criteria_col) <> '' then
		lds_temp = create datastore
		lds_temp.dataobject = vs_dwo
		ls_coltype = lds_temp.describe(ls_must_save_criteria_col + '.coltype' )
		destroy lds_temp
		ls_expression = this.ids_setup_dw.getitemstring(ll_row_found, 'MUST_SAVE_CRITERIA_VAL')
		ls_expression = lc_string.f_get_expression(ls_expression,ls_coltype,ls_must_save_criteria_col, 'modify')
		ls_expression ="If("+ls_expression + ", ~~'yes~~',~~'no~~')"
	else
		ls_expression ="yes"
	end if		
	
end if

return ls_expression
end function

public function string f_get_must_booked_string (string vs_dwo, string vs_objectname, string vs_coltype);/****************************************************************
Chức năng: chỉ áp dụng cài đặt điều kiện phụ thuộc trên cùng DW
------------------------------------------------------------------------------
return: 
	- 'yes': cột được cài đặt bắt buộc nhập khi ghi sổ
	- 'no' : nếu cột không cài đặt bắt buộc nhập khi ghi sổ
	- 'Chuỗi expression' : nếu cột cài đặt bặt buộc nhập khi ghi sổ có điều kiện phụ thuộc dữ liệu của cột khác trên cùng DW.

=========================================================*/

string			ls_must_booked_yn, ls_must_booked_criteria_col, ls_expression, ls_coltype, ls_dwo
long			ll_row_found
c_string		lc_string
datastore		lds_temp

ls_expression ="no"
ls_dwo = left(vs_dwo, len(vs_dwo) - 5)
ll_row_found = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" + vs_objectname + "' AND mandatory_booked_yn = 'Y' ",1, ids_setup_dw.rowcount( ) )
if ll_row_found > 0 then	
	ls_must_booked_criteria_col = this.ids_setup_dw.getitemstring(ll_row_found, 'MUST_BOOKED_CRITERIA_COL')		
	if not isnull(ls_must_booked_criteria_col) and trim(ls_must_booked_criteria_col) <> '' then
		lds_temp = create datastore
		lds_temp.dataobject = vs_dwo
		ls_coltype = lds_temp.describe(ls_must_booked_criteria_col + '.coltype' )
		destroy lds_temp			
		ls_expression = this.ids_setup_dw.getitemstring(ll_row_found, 'MUST_BOOKED_CRITERIA_VAL')
		ls_expression = lc_string.f_get_expression(ls_expression,ls_coltype,ls_must_booked_criteria_col, 'modify')
		ls_expression ="If("+ls_expression + ", ~~'yes~~',~~'no~~')"
	else
		ls_expression ="yes"
	end if		
end if

return ls_expression
end function

public function string f_get_displayonly_string (string vs_dwo, string vs_objectname, string vs_coltype);string			ls_displayonly_yn, ls_displayonly_criteria_col, ls_criteria, ls_coltype, ls_dwo, ls_expression, ls_closeStr
long			ll_row_found
c_string		lc_string
datastore		lds_temp

ls_dwo = left(vs_dwo, len(vs_dwo) - 5)
lds_temp = create datastore
lds_temp.dataobject = vs_dwo
ll_row_found = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" + vs_objectname + "' AND displayonly_yn ='Y' ",1, ids_setup_dw.rowcount( ) )
if ll_row_found > 0 then	
	//-- kiểm tra điều kiện displayonly --//
	ls_displayonly_criteria_col = this.ids_setup_dw.getitemstring(ll_row_found, 'displayonly_criteria_col')		
	if not isnull(ls_displayonly_criteria_col) and trim(ls_displayonly_criteria_col) <> '' then
		ls_coltype = lds_temp.describe(ls_displayonly_criteria_col + '.coltype' )			
		ls_criteria = this.ids_setup_dw.getitemstring(ll_row_found, 'displayonly_criteria_val')
		ls_criteria = lc_string.f_get_expression(ls_criteria,ls_coltype,ls_displayonly_criteria_col, 'modify')
		if ls_expression <> '' then ls_expression += ", "
		ls_expression += "If("+ls_criteria + ", ~~'yes~~' "  //, ~~'no~~')"
		ls_closeStr += ') '
	else
		ls_expression = "yes"
	end if		
	ll_row_found = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" + vs_objectname + "' AND displayonly_yn ='Y' ", ll_row_found+1, ids_setup_dw.rowcount( ) + 1)
end if

if ls_expression = '' then 
	ls_expression ="no"
elseif  ls_expression <> 'yes' then
	ls_expression += ", ~~'no~~'" + ls_closeStr
end if

destroy lds_temp	
return ls_expression

end function

public function string f_get_textcolor_string (string vs_dwo, string vs_objectname, string vs_coltype);string		ls_textcolor, ls_textclr_criteria_col, ls_expression, ls_expression_tmp, ls_coltype, ls_dwo, ls_closeStr
long		ll_row_found
c_string	lc_string


ls_dwo = left(vs_dwo, len(vs_dwo) - 5)
ll_row_found = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" + vs_objectname + "' AND not isnull(textcolor)",1, ids_setup_dw.rowcount( ) )

DO WHILE ll_row_found > 0 
	ls_textcolor = this.ids_setup_dw.getitemstring(ll_row_found, 'textcolor')
	if isnull(ls_textcolor) or ls_textcolor = "default" then
		ls_expression =  "default"
		return ls_expression
	end if
	ls_textclr_criteria_col = this.ids_setup_dw.getitemstring(ll_row_found, 'TEXTCLR_CRITERIA_COL')		
	if not isnull(ls_textclr_criteria_col) and trim(ls_textclr_criteria_col) <> '' then
		ls_expression_tmp = this.ids_setup_dw.getitemstring(ll_row_found, 'TEXTCLR_CRITERIA_VAL')
		ls_expression_tmp = lc_string.f_get_expression(ls_expression_tmp,vs_coltype,ls_textclr_criteria_col, 'modify')
		if ls_expression <> '' then ls_expression += ", "
		ls_expression +="If("+ls_expression_tmp + ", "+ls_textcolor 
		ls_closeStr += ') '
	else
		ls_expression =  ls_textcolor
		return ls_expression
	end if		
	
	ll_row_found = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" + vs_objectname + "' AND not isnull(textcolor)",ll_row_found+1, ids_setup_dw.rowcount( ) +1)
LOOP

if ls_expression = '' then
	ls_expression =  "default"
else
	ls_expression += ", 0" + ls_closeStr
end if

return ls_expression
end function

public function string f_get_visible_string (string vs_dwo, string vs_objectname, string vs_coltype);string			ls_hidden_yn, ls_hidden_criteria_col, ls_expression, ls_dwo, ls_coltype, ls_expression_tmp, ls_closeStr
long			ll_row_found
c_string		lc_string
datastore		lds_temp

lds_temp = create datastore
lds_temp.dataobject = vs_dwo
ls_dwo = left(vs_dwo, len(vs_dwo) - 5)
ll_row_found = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" + vs_objectname + "' AND not isnull(hidden_yn)",1, ids_setup_dw.rowcount( ) )

DO WHILE ll_row_found > 0 
	ls_hidden_yn = this.ids_setup_dw.getitemstring(ll_row_found, 'hidden_yn')
	if ls_hidden_yn = 'Y' then
		ls_hidden_criteria_col = this.ids_setup_dw.getitemstring(ll_row_found, 'hidden_criteria_col')		
		if not isnull(ls_hidden_criteria_col) and trim(ls_hidden_criteria_col) <> '' then
			ls_coltype = lds_temp.describe(ls_hidden_criteria_col + '.coltype' )						
			ls_expression_tmp = this.ids_setup_dw.getitemstring(ll_row_found, 'hidden_criteria_val')
			ls_expression_tmp = lc_string.f_get_expression(ls_expression_tmp,ls_coltype,ls_hidden_criteria_col, 'modify')
			if ls_expression <> '' then ls_expression += ", "
			ls_expression += "If("+ls_expression + ", 0"
			ls_closeStr += ') '
		else			
			ls_expression ="0"
			destroy lds_temp
			return ls_expression
		end if		
	end if
	ll_row_found = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" + vs_objectname + "' AND not isnull(hidden_yn)",ll_row_found+1, ids_setup_dw.rowcount( ) +1)
LOOP

if ls_expression = '' then
	ls_expression =  "1"
else
	ls_expression += ", 1" + ls_closeStr
end if
destroy lds_temp
return ls_expression

end function

public function boolean f_is_valueset_accept_out_of_list_value (string vs_dwo, string vs_colname);long		ll_row
string		ls_dwdatatype, ls_accept_out_of_list_value, ls_dwo

ls_dwo = left(vs_dwo, len(vs_dwo) - 5)
ll_row = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" + vs_colname + "'",1, ids_setup_dw.rowcount( ) )
if ll_row > 0 then
	ls_dwdatatype = ids_setup_dw.getitemstring(ll_row, 'dwdatatype')
	if ls_dwdatatype = 'valueset' or ls_dwdatatype = 'dwo' then
		ls_accept_out_of_list_value = ids_setup_dw.getitemstring(ll_row, 'ACCEPT_OUT_OF_LIST_YN')
		if ls_accept_out_of_list_value = 'Y' then
	 		return true
		end if
	end if
end if
return false
end function

public function boolean f_is_branch_yn (string vs_dwo);long		ll_row
string		ls_dwo

ls_dwo = left(vs_dwo, len(vs_dwo) - 5)
ll_row = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND branch_yn ='Y'", 1, ids_setup_dw.rowcount( ) )
if ll_row > 0 then
	return true
else
	return false
end if

end function

public function string f_get_backcolor_string (string vs_dwo, string vs_objectname, string vs_coltype);string		ls_textcolor, ls_textclr_criteria_col, ls_expression, ls_expression_tmp, ls_coltype, ls_dwo, ls_closeStr
long		ll_row_found
c_string	lc_string


ls_dwo = left(vs_dwo, len(vs_dwo) - 5)
ll_row_found = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" + vs_objectname + "' AND not isnull(backcolor)",1, ids_setup_dw.rowcount( ) )

DO WHILE ll_row_found > 0 
	ls_textcolor = this.ids_setup_dw.getitemstring(ll_row_found, 'backcolor')
	if isnull(ls_textcolor) or ls_textcolor = "default" then
		ls_expression =  "default"
		return ls_expression
	end if
	ls_textclr_criteria_col = this.ids_setup_dw.getitemstring(ll_row_found, 'backCLR_CRITERIA_COL')		
	if not isnull(ls_textclr_criteria_col) and trim(ls_textclr_criteria_col) <> '' then
		ls_expression_tmp = this.ids_setup_dw.getitemstring(ll_row_found, 'backCLR_CRITERIA_VAL')
		ls_expression_tmp = lc_string.f_get_expression(ls_expression_tmp,vs_coltype,ls_textclr_criteria_col, 'modify')
		if ls_expression <> '' then ls_expression += ", "
		ls_expression +="If("+ls_expression_tmp + ", "+ls_textcolor 
		ls_closeStr += ') '
	else
		ls_expression =  ls_textcolor
		return ls_expression
	end if		
	
	ll_row_found = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" + vs_objectname + "' AND not isnull(backcolor)",ll_row_found+1, ids_setup_dw.rowcount( ) +1)
LOOP

if ls_expression = '' then
	ls_expression =  "default"
else
	ls_expression += ", 0" + ls_closeStr
end if

return ls_expression
end function

public function string f_get_protect_save_string (string vs_dwo, string vs_objectname, string vs_coltype);string			ls_protect_save_criteria_col, ls_criteria, ls_coltype, ls_dwo
string			ls_locked_aftersaved_yn
long			ll_row_found
c_string		lc_string
datastore		lds_temp
ls_criteria ="no"
ls_dwo = left(vs_dwo, len(vs_dwo) - 5)
ll_row_found = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" + vs_objectname + "' AND not isnull(PROTECT_AFTER_SAVE_YN)",1, ids_setup_dw.rowcount( ) )
if ll_row_found > 0 then	
	//-- kiểm tra điều kiện displayonly --//
	ls_locked_aftersaved_yn = this.ids_setup_dw.getitemstring(ll_row_found, 'PROTECT_AFTER_SAVE_YN')
	if ls_locked_aftersaved_yn = 'Y' then
		ls_protect_save_criteria_col = this.ids_setup_dw.getitemstring(ll_row_found, 'protect_save_criteria_col')		
		if not isnull(ls_protect_save_criteria_col) and trim(ls_protect_save_criteria_col) <> '' then
			lds_temp = create datastore
			lds_temp.dataobject = vs_dwo
			ls_coltype = lds_temp.describe(ls_protect_save_criteria_col + '.coltype' )
			destroy lds_temp				
			ls_criteria = this.ids_setup_dw.getitemstring(ll_row_found, 'protect_save_criteria_val')
			ls_criteria = lc_string.f_get_expression(ls_criteria,ls_coltype,ls_protect_save_criteria_col, 'modify')
			ls_criteria = "If("+ls_criteria + ", ~~'yes~~', ~~'no~~')"
		else
			ls_criteria = "yes"
		end if		
	end if
	// kiểm tra điều kiện khóa sau khi lưu --//
//	if ls_criteria = 'no' then
//		ls_locked_aftersaved_yn = this.ids_setup_dw.getitemstring(ll_row_found, 'PROTECT_AFTER_SAVE_YN')
//		if ls_locked_aftersaved_yn = 'Y' then
//			ls_criteria = "if(IsRowNew(), ~~'no~~',~~'yes~~')"
//		end if
//	end if
end if

return ls_criteria
end function

public function integer f_get_dwdatatype_string (string vs_colname, string vs_coltype, t_dw rdw_handle, ref string rs_dwdatatype);/**************************************************************************
Chức năng: kiểm tra và lấy dwdatatype (dwo,struct_segment,sequences) và số dòng của ids_setup_dw
-------------
Tham số: 
=================================================================*/

string		ls_valuset_criteria_col, ls_dwdatatype, ls_dwo, ls_expresssion, ls_coltype
long		ll_row_found
c_string	lc_string

rs_dwdatatype = 'normal'
ls_dwo = rdw_handle.dataobject
ls_dwo = left(ls_dwo, len(ls_dwo) - 5)
ll_row_found = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" + vs_colname + "' AND not isnull(dwdatatype)",1, ids_setup_dw.rowcount( ) )

DO while ll_row_found > 0 	
	ls_dwdatatype = this.ids_setup_dw.getitemstring(ll_row_found, 'dwdatatype')
	if ls_dwdatatype = 'dwo' or ls_dwdatatype = 'valueset' or ls_dwdatatype = 'STRUCT_SEGMENT' or  ls_dwdatatype = 'SEQUENCES'  then
		ls_valuset_criteria_col = this.ids_setup_dw.getitemstring(ll_row_found, 'VALUESET_CRITERIA_COL')		
		if not isnull(ls_valuset_criteria_col) and trim(ls_valuset_criteria_col) <> '' then
			ls_expresssion = this.ids_setup_dw.getitemstring(ll_row_found, 'VALUESET_CRITERIA_VAL')
			ls_coltype = rdw_handle.describe( ls_valuset_criteria_col + ".coltype")
			ls_expresssion = lc_string.f_get_expression(ls_expresssion,ls_coltype,ls_valuset_criteria_col, 'modify')
			ls_expresssion ="If("+ls_expresssion + ", ~~'yes~~',~~'no~~')"
			if this.f_is_dwdatatype( ls_expresssion, rdw_handle) then
				rs_dwdatatype = ls_dwdatatype
				return ll_row_found
			end if
		else
			rs_dwdatatype = ls_dwdatatype
			return ll_row_found
		end if		
	end if
	ll_row_found = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" + vs_colname + "' AND not isnull(dwdatatype)",ll_row_found+1, ids_setup_dw.rowcount( ) +1)
LOOP

return 0
end function

public function integer f_initvalue (datawindow vdw_handle, long vl_row);/*******************************************************
Khởi tạo giá trị mặc định khi thêm dòng mới cho DW
-------------------------------------------------------------------------------------------------
Tham số:   	 - vdw_handle: DW đang thêm dòng mới
           		 - vl_row: số dòng của record thêm mới
-------------------------------------------------------------------------------------------------
Return:      	 - 1 khởi tạo thành công
				 - 0: không có giá trị mặc định
				 - Err: -1
===========================================*/
string		ls_value, ls_colname, ls_colstyle, ls_coltype
string		ls_init_value_criteria_col, ls_expresssion,ls_value_coltype
int			li_Rtn, li_cnt
long		ll_row
c_string				lc_string
t_ds_db				lds_dwsetup

//-- kiểm tra biến vdw_handle --//
//-- kiểm tra biến vl_row --//
ids_setup_dw.setfilter("DWOBJECT = '"+ left(vdw_handle.dataobject,len(vdw_handle.dataobject)-5)+"' AND not isnull(init_value)  AND branch_id = "+string(gdb_branch ) )
ids_setup_dw.filter( )

li_cnt = ids_setup_dw.rowcount( ) 
if li_cnt > 0 then
	lds_dwsetup = create t_ds_db
	lds_dwsetup.dataobject = ids_setup_dw.dataobject
	
	ids_setup_dw.setsort( "dwcolumn a")
	ids_setup_dw.sort( )
	FOR ll_row = 1 to li_cnt
		ls_colname = ids_setup_dw.getitemstring( ll_row, 'dwcolumn')	
		ls_value = ids_setup_dw.getitemstring( ll_row, 'init_value')	
		ls_colstyle = vdw_handle.describe(ls_colname+".edit.style")
		ls_coltype = vdw_handle.describe(ls_colname+'.coltype' )
		ls_init_value_criteria_col = this.ids_setup_dw.getitemstring(ll_row, 'INIT_VALUE_CRITERIA_COL')		
		ls_value_coltype = vdw_handle.describe(ls_init_value_criteria_col+'.coltype' )
		
		
		if not isnull(ls_init_value_criteria_col) and trim(ls_init_value_criteria_col) <> '' then
			ls_expresssion = this.ids_setup_dw.getitemstring(ll_row, 'INIT_VALUE_CRITERIA_VAL')
			ls_expresssion = lc_string.f_get_expression(ls_expresssion,ls_value_coltype,ls_init_value_criteria_col, 'modify')
			ls_expresssion ="If("+ls_expresssion + ", ~~'yes~~',~~'no~~')"
			if this.f_is_dwdatatype( ls_expresssion, vdw_handle) then
				ids_setup_dw.rowscopy( ll_row, ll_row, primary!, lds_dwsetup, 1, primary!)
				if this.f_set_initvalue( vdw_handle, vl_row,lds_dwsetup, ll_row, ls_colname, ls_coltype, ls_colstyle, ls_value) = -1 then return -1
			end if
		else
			 if this.f_set_initvalue( vdw_handle, vl_row,lds_dwsetup, ll_row, ls_colname, ls_coltype, ls_colstyle, ls_value) = -1 then return -1
		end if	
		lds_dwsetup.reset()
	NEXT
	
	ids_setup_dw.setfilter('')
	ids_setup_dw.filter( )	
	return 1	
end if
ids_setup_dw.setfilter('')
ids_setup_dw.filter( )
return 0
end function

public function integer f_set_initvalue (datawindow vdw_handle, long vl_row_dwhandle, long vl_row_dwsetup, string vs_colname, string vs_coltype, string vs_colstyle, string vs_value);/*******************************************************
Gán giá trị mặc định vào dw
-------------------------------------------------------------------------------------------------
Tham số:   	 - vdw_handle: dw insert dòng mới
           		 - vl_row_dwhandle: dòng đang thêm mới
				 - vl_row_dwsetup: Số dòng cùa ids_setup_dw chứa giá trị cài đặt mặc định
				 - vs_colname: tên cột có cài đặt giá trị mặc định
				 - vs_coltype: Kiễu dữ liệu của cột
				 - vs_colstyle: Kiểu edit của cột
				 - vs_value: giá trị mặc định cài đặt

===========================================*/
string		ls_return_column, lsa_return_column[], ls_receive_column, lsa_receive_column[], ls_find_str, ls_coltype
int			li_Rtn, li_cnt, li_colCount
long		ll_row, ll_child_row
any		la_data
c_string				lc_string
Datawindowchild 	ldwc_child
c_dwservice		lc_dwservice

	
//-- set giá trị mặc định --//
CHOOSE CASE Lower ( Left ( vs_coltype, 5 ) )
	CASE "char(", "char"		//  CHARACTER DATATYPE
		li_Rtn = vdw_handle.setitem(vl_row_dwhandle,vs_colname, vs_value)
	CASE "date"					//  DATE DATATYPE
		li_Rtn = vdw_handle.setitem(vl_row_dwhandle,vs_colname, date( vs_value))
	CASE "datet"				//  DATETIME DATATYPE
		li_Rtn = vdw_handle.setitem(vl_row_dwhandle,vs_colname, datetime( vs_value))
	CASE "decim"				//  DECIMAL DATATYPE
		li_Rtn = vdw_handle.setitem(vl_row_dwhandle,vs_colname, dec( vs_value))
	CASE "numbe", "long", "ulong", "real", "int"				//  NUMBER DATATYPE	
		li_Rtn = vdw_handle.setitem(vl_row_dwhandle,vs_colname, double( vs_value))				
	CASE "time", "times"		//  TIME DATATYPE
		li_Rtn = vdw_handle.setitem(vl_row_dwhandle,vs_colname, time( vs_value))
END CHOOSE		
if li_Rtn = -1 then
	gf_messagebox('m.c_dwsetup_initial.f_set_initvalue.01','Thông báo','Không tạo được giá trị mặc định:@'+vs_colname+':'+vs_value,'exclamation','ok',1)
	return -1
end if

//-- trường hợp velueset: set giá trị cho các cột nhận giá trị trả về của valueset --//
if vs_colstyle = 'dddw' then		
	ls_return_column =  this.ids_setup_dw.getitemstring(vl_row_dwsetup, 'return_column')
	ls_receive_column = this.ids_setup_dw.getitemstring(vl_row_dwsetup,'receive_column')
	li_colCount = lc_string.f_stringtoarray( ls_return_column,';', lsa_return_column[])
	li_colCount = lc_string.f_stringtoarray( ls_receive_column,';', lsa_receive_column[])
	ls_receive_column = lc_string.f_getfirsttoken(ls_receive_column, ';')
	ls_return_column = lc_string.f_getfirsttoken(ls_return_column, ';')
	
	vdw_handle.dynamic f_retrieve_dwc_ex(vs_colname)
	if vdw_handle.getchild(vs_colname, ldwc_child ) = -1 then return -1
	ls_coltype = vdw_handle.describe(ls_receive_column+'.coltype' )
	if Lower ( Left ( ls_coltype , 4) ) = "char" then
		ls_find_str = ls_return_column +" = '"+ vs_value +"'"
	elseif  Lower ( Left ( ls_coltype , 6) ) =  "number" then
		ls_find_str = ls_return_column +" = "+ vs_value
	end if		
//	ldwc_child.settransobject( sqlca)
//	ldwc_child.retrieve( )
	ll_child_row = ldwc_child.find(ls_find_str, 1, ldwc_child.rowcount())
	if ll_child_row > 0 then
		FOR li_Rtn = 1 to li_colCount
			if lsa_receive_column[li_rtn] =vs_colname then continue
			la_data = lc_dwservice.f_getitemany_dwc( ldwc_child,ll_child_row , lsa_return_column[li_rtn])
			ls_coltype = vdw_handle.describe(lsa_receive_column[li_Rtn] +'.coltype' )			
			if left(ls_coltype,4) = 'char' then
				vdw_handle.setitem( vl_row_dwhandle, lsa_receive_column[li_Rtn], string(la_data))
			else
				vdw_handle.setitem( vl_row_dwhandle, lsa_receive_column[li_Rtn], la_data)
			end if						
		NEXT
	end if
end if		

return 1
end function

public function integer f_get_payment_dwo_colname (string vs_dwo, string vs_objectname, ref string rs_base_date_dwo, ref string rs_base_date_column);long		ll_row_found
string		ls_dwo, ls_findStr

ls_dwo = left(vs_dwo, len(vs_dwo) - 5)
ls_findStr = "dwobject ='"+ls_dwo+ "' AND dwcolumn ='" + vs_objectname + "' AND isnull(DWVALUESET_RELATED_COLUMN) AND not (isnull(DWOBJECT_MAIN)  AND isnull(DWOBJECT_MAIN_COLUMN))"
ll_row_found = this.ids_setup_dw.find(ls_findStr,1, ids_setup_dw.rowcount( ) )
if ll_row_found > 0 then
	rs_base_date_dwo =   this.ids_setup_dw.getitemstring(ll_row_found, 'DWOBJECT_MAIN')
	rs_base_date_column = this.ids_setup_dw.getitemstring(ll_row_found, 'DWOBJECT_MAIN_COLUMN')
	return 1
end if
return 0
end function

public function integer f_get_report_date (string vs_data, ref date rd_prior_period_date, ref date rd_last_period_date);c_datetime		lc_datetime
date				ld_prior_period_date,ld_last_period_date, ld_tmp

choose case vs_data
	case 'Năm này','Năm trước'
		if vs_data = 'Năm này' then
			ld_tmp = today()
		else
			ld_tmp = lc_datetime.f_relativeyear(today(), -1)
		end if
		rd_prior_period_date = lc_datetime.f_firstdaymonthofyear(ld_tmp)
		rd_last_period_date = lc_datetime.f_lastdaymonthofyear(ld_tmp)
		return 1
	case 'Quý này','Quý trước'
		if vs_data = 'Quý này' then
			ld_tmp = today()
		else
			ld_tmp = lc_datetime.f_relativemonth(today(), -3)
		end if
		rd_prior_period_date = lc_datetime.f_firstdaymonthofquarter(ld_tmp)
		rd_last_period_date = lc_datetime.f_lastdaymonthofquarter(ld_tmp)
		return 1
	case 'Quý 01','Quý 02','Quý 03','Quý 04'
		if vs_data = 'Quý 01' then
			ld_tmp = date(int(Year(today())), 01, 01)
		elseif vs_data = 'Quý 02' then
			ld_tmp = date(int(Year(today())), 04, 01)
		elseif vs_data = 'Quý 03' then
			ld_tmp = date(int(Year(today())), 07, 01)
		else
			ld_tmp = date(int(Year(today())), 10, 01)
		end if
		rd_prior_period_date = lc_datetime.f_firstdaymonthofquarter(ld_tmp)
		rd_last_period_date = lc_datetime.f_lastdaymonthofquarter(ld_tmp)
		return 1
	case 'Tháng này','Tháng trước'
		if vs_data = 'Tháng này' then
			ld_tmp = today()
		else
			ld_tmp = lc_datetime.f_relativemonth(today(), -1)
		end if
		rd_prior_period_date = lc_datetime.f_firstdayofmonth(ld_tmp)
		rd_last_period_date = lc_datetime.f_lastdayofmonth(ld_tmp)
		case 'Tháng 01','Tháng 02','Tháng 03','Tháng 04','Tháng 05','Tháng 06','Tháng 07','Tháng 08','Tháng 09','Tháng 10','Tháng 11','Tháng 12'
			ld_tmp = date(int(Year(today())), dec(right(vs_data,2)), 01)
		rd_prior_period_date = lc_datetime.f_firstdayofmonth(ld_tmp)
		rd_last_period_date = lc_datetime.f_lastdayofmonth(ld_tmp)
		return 1
end choose
return 0
end function

public function integer f_auto_copy_field (t_dw_mpl vdw_handle, long vl_row);long						ll_row_found
string						ls_colname, ls_dwo
any						la_data
datawindowchild		ldwc

ls_dwo = left(vdw_handle.dataobject, len(vdw_handle.dataobject) - 5)
ll_row_found = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND auto_copy_yn = 'Y'" ,1, ids_setup_dw.rowcount( ))
if ll_row_found = 0 then
	return 0
else
	DO 
		ls_colname = this.ids_setup_dw.getitemstring(ll_row_found, 'dwcolumn')
		la_data = vdw_handle.dynamic f_getitemany(vl_row -1 ,ls_colname)
		vdw_handle.setcolumn(ls_colname)
		vdw_handle.settext(string(la_data))
		
		IF  vdw_handle.describe(ls_colname + ".Edit.Style")  = 'dddw' and vdw_handle.describe(ls_colname + '.dddw.name') <> '' then
			vdw_handle.f_retrieve_dwc_ex(ls_colname )
		end if				
		vdw_handle.accepttext()
		vdw_handle.setitem(vl_row,ls_colname, la_data)
		ll_row_found = this.ids_setup_dw.find( "dwobject ='"+ls_dwo+ "' AND auto_copy_yn = 'Y'" ,ll_row_found+1, ids_setup_dw.rowcount( )+1)
	LOOP while ll_row_found > 0
	return 1
end if


end function

public function boolean f_is_valueset_receive_number (string vs_dwobject, string vs_receive_column);long				ll_row
string				ls_receive_column, las_receive_column[], ls_coltype, ls_dwo
int					li_colCnt, li_idx
c_string			lc_string
datastore		lds_temp


//-- kiem tra cột nhận dữ liệu trả về có là kieu number hay ko ? --//
li_colCnt = lc_string.f_stringtoarray(vs_receive_column ,';',las_receive_column)
if li_colCnt > 0 then
	lds_temp = create datastore
	if right(vs_dwobject, 5) = '_form' or right(vs_dwobject, 5) = '_grid' or left(vs_dwobject, 3) = 'dd_'   then
		lds_temp.dataobject = vs_dwobject
	else
		lds_temp.dataobject = vs_dwobject+ '_grid'
		if  lds_temp.describe(las_receive_column[1]+".ColType") = '' then
			lds_temp.dataobject = vs_dwobject+ '_form'
		end if
	end if
	
	FOR li_idx = 1 to li_colCnt
		ls_coltype =  lds_temp.describe( las_receive_column[li_idx] + ".ColType")
		if  left(ls_coltype,5) = 'numbe' or  left(ls_coltype,5) = 'decim' then
			destroy lds_temp
			return true
		end if
	NEXT			
	destroy lds_temp
end if
	
return false
end function

public function boolean f_is_valueset_return_number (string vs_dwvalueset_object, string vs_return_column);long				ll_row
string				ls_return_column, las_return_column[], ls_coltype
int					li_colCnt, li_idx
c_string			lc_string
datastore		lds_temp

lds_temp = create datastore
lds_temp.dataobject = vs_dwvalueset_object
//-- kiem tra cột nhận dữ liệu trả về có là kieu number hay ko ? --//
li_colCnt = lc_string.f_stringtoarray(vs_return_column ,';',las_return_column)
FOR li_idx = 1 to li_colCnt
	ls_coltype =  lds_temp.describe( las_return_column[li_idx] + ".ColType")
	if  left(ls_coltype,5) = 'numbe' or  left(ls_coltype,5) = 'decim' then
		destroy lds_temp
		return true
	end if
NEXT			
destroy lds_temp
return false
end function

public function integer f_get_must_booked_colname (t_dw_mpl vdw_handle, ref string rsa_colname[]);/****************************************************************
Chức năng: Lấy các cột có cài đặt bắt buộc nhập khi ghi sổ 
------------------------------------------------------------------------------
Than số:
	- vdw_handle: DW cần kiểm tra
	-rs_colname: mảng tên cột trả về
----------------------------------------------
return: số lượng cột
=========================================================*/

string			ls_must_booked_yn, ls_must_booked_criteria_col, ls_expression, ls_coltype, ls_dwo
long			ll_row_found
c_string		lc_string


ls_dwo = left(vdw_handle.dataobject, len(vdw_handle.dataobject) - 5)
ll_row_found = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND mandatory_booked_yn = 'Y' ",1, ids_setup_dw.rowcount( ) )
if ll_row_found > 0 then	
	ls_must_booked_criteria_col = this.ids_setup_dw.getitemstring(ll_row_found, 'MUST_BOOKED_CRITERIA_COL')		
	if not isnull(ls_must_booked_criteria_col) and trim(ls_must_booked_criteria_col) <> '' then
		ls_coltype = vdw_handle.describe(ls_must_booked_criteria_col + '.coltype' )			
		ls_expression = this.ids_setup_dw.getitemstring(ll_row_found, 'MUST_BOOKED_CRITERIA_VAL')
		ls_expression = lc_string.f_get_expression(ls_expression,ls_coltype,ls_must_booked_criteria_col, 'modify')
		ls_expression ="If("+ls_expression + ", ~~'yes~~',~~'no~~')"
		ls_must_booked_yn = vdw_handle.describe("Evaluate(' "+ ls_expression+ "'," + string(vdw_handle.getrow( ))+')')
		if ls_must_booked_yn = 'yes' then
			rsa_colname[upperbound(rsa_colname[])+1] = this.ids_setup_dw.getitemstring( ll_row_found, 'dwcolumn')
		end if
	else
		rsa_colname[upperbound(rsa_colname[])+1] = this.ids_setup_dw.getitemstring( ll_row_found, 'dwcolumn')
	end if		
	ll_row_found = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND not isnull(mandatory_booked_yn)", ll_row_found + 1, ids_setup_dw.rowcount( ) + 1)
end if

return upperbound(rsa_colname[])
end function

public function boolean f_is_match_not_modify (string vs_dwo, string vs_objectname);string			ls_dwo
long			ll_row_found

ls_dwo = left(vs_dwo, len(vs_dwo) - 5)
ll_row_found = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" + vs_objectname + "' AND MATCH_NOT_MODIFY_YN = 'Y'",1, ids_setup_dw.rowcount( ) )
if ll_row_found > 0 then	
	return true
else
	return false
end if
end function

public function integer f_get_sequence_info (string vs_seq_str, ref double rdb_seq_id);double	ldb_id
long		ll_row_found
string		ls_dwo, ls_valuset_criteria_col, ls_expresssion, ls_coltype
c_string	lc_string

//ls_dwo = left(vdw_handle.dataobject, len(vdw_handle.dataobject) - 5)
//ls_coltype = vdw_handle.describe(vs_colname+'.coltype')
//ll_row_found = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" + vs_colname + "' AND dwdatatype = 'sequences'",1, ids_setup_dw.rowcount( ) )
//DO WHILE ll_row_found > 0 	
//	ls_valuset_criteria_col = this.ids_setup_dw.getitemstring(ll_row_found, 'VALUESET_CRITERIA_COL')		
//	if not isnull(ls_valuset_criteria_col) and trim(ls_valuset_criteria_col) <> '' then
//		ls_expresssion = this.ids_setup_dw.getitemstring(ll_row_found, 'VALUESET_CRITERIA_VAL')
//		ls_coltype = vdw_handle.describe(ls_valuset_criteria_col+'.coltype')
//		ls_expresssion = lc_string.f_get_expression(ls_expresssion,ls_coltype,ls_valuset_criteria_col, 'modify')
//		ls_expresssion ="If("+ls_expresssion + ", ~~'yes~~',~~'no~~')"
//		if this.f_is_dwdatatype( ls_expresssion, vdw_handle) then
//			rdb_seq_id = this.ids_setup_dw.getitemnumber(ll_row_found, 'object_ref_id')
//			vs_seq_reset_colname = this.ids_setup_dw.getitemstring(ll_row_found, 'SEQ_RESET_COLUMN')
//			return 1
//		end if	
//	else
//		rdb_seq_id = this.ids_setup_dw.getitemnumber(ll_row_found, 'object_ref_id')
//		vs_seq_reset_colname = this.ids_setup_dw.getitemstring(ll_row_found, 'SEQ_RESET_COLUMN')
//		return 1		
//	end if
//	ll_row_found = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" + vs_colname + "' AND dwdatatype = 'sequences'", ll_row_found+1, ids_setup_dw.rowcount( ) +1)
//LOOP
//
return 0
end function

public function boolean f_is_dwdatatype (string vs_dwdatatype_string, powerobject vpo_handling);
if vs_dwdatatype_string = 'yes' then return true
if vpo_handling.dynamic getrow() > 0 then
	if vpo_handling.dynamic describe("Evaluate(' "+ vs_dwdatatype_string+ "'," + string(vpo_handling.dynamic getrow( ))+')') = 'yes' then
		return true
	else
		return false
	end if
else
	return false
end if

end function

public function integer f_get_sequence_info (powerobject vpo_handle, string vs_colname, ref double rdb_seq_id, ref string vs_seq_reset_colname);double	ldb_id
long		ll_row_found
string		ls_dwo, ls_valuset_criteria_col, ls_expresssion, ls_coltype,ls_dataobject
c_string	lc_string

ls_dataobject = vpo_handle.dynamic f_get_dataobject()
ls_dwo = left(ls_dataobject, len(ls_dataobject) - 5)
//ls_coltype = vpo_handle.describe(vs_colname+'.coltype')
ll_row_found = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" + vs_colname + "' AND dwdatatype = 'SEQUENCES'",1, ids_setup_dw.rowcount( ) )
DO WHILE ll_row_found > 0 	
	ls_valuset_criteria_col = this.ids_setup_dw.getitemstring(ll_row_found, 'VALUESET_CRITERIA_COL')		
	if not isnull(ls_valuset_criteria_col) and trim(ls_valuset_criteria_col) <> '' then
		ls_expresssion = this.ids_setup_dw.getitemstring(ll_row_found, 'VALUESET_CRITERIA_VAL')
		ls_coltype = vpo_handle.dynamic describe(ls_valuset_criteria_col+'.coltype')
		ls_expresssion = lc_string.f_get_expression(ls_expresssion,ls_coltype,ls_valuset_criteria_col, 'modify')
		ls_expresssion ="If("+ls_expresssion + ", ~~'yes~~',~~'no~~')"
		if this.f_is_dwdatatype( ls_expresssion, vpo_handle) then
			rdb_seq_id = this.ids_setup_dw.getitemnumber(ll_row_found, 'object_ref_id')
			vs_seq_reset_colname = this.ids_setup_dw.getitemstring(ll_row_found, 'SEQ_RESET_COLUMN')
			return 1
		end if	
	else
		rdb_seq_id = this.ids_setup_dw.getitemnumber(ll_row_found, 'object_ref_id')
		vs_seq_reset_colname = this.ids_setup_dw.getitemstring(ll_row_found, 'SEQ_RESET_COLUMN')
		return 1		
	end if
	ll_row_found = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" + vs_colname + "' AND dwdatatype = 'SEQUENCES'", ll_row_found+1, ids_setup_dw.rowcount( ) +1)
LOOP

return 0
end function

public function boolean f_is_duplicated_data (datawindow vdw_handle, long vl_row, ref string rs_duplicated_colname);/**********************************************************************************
Chức năng: Kiểm tra trùng dữ liệu theo cài đặt bảng và trả về tên các cột trùng
------------------------------------------------------------------------------------------------*/

string			ls_unique_cols, lsa_unique_cols[] , ls_filterString, ls_data, ls_coltype, ls_dbname, ls_dwo, lsa_empty[]
long			ll_row_found
int				li_cnt, li_idx
boolean		lb_rtn
c_string				lc_string
c_dwservice			lc_dwservice


ls_dwo = left(vdw_handle.dataobject, len(vdw_handle.dataobject) - 5)
ll_row_found = this.ids_setup_dw.find("dwobject = '"+ls_dwo + "' AND not isnull(unique_column)" ,1, ids_setup_dw.rowcount( ))

lb_rtn= false
if ll_row_found = 0 then
	return false
else
	DO
		lsa_unique_cols[] = lsa_empty[]
		ls_filterString = ''		
		vdw_handle.setfilter(ls_filterString)
		li_cnt = vdw_handle.filter()		
		ls_unique_cols = this.ids_setup_dw.getitemstring(ll_row_found, 'unique_column')
		li_cnt = lc_string.f_stringtoarray( ls_unique_cols, ';', lsa_unique_cols[])
		FOR li_idx = 1 to li_cnt
			ls_dbname =  lsa_unique_cols[li_idx]
			lc_dwservice.f_get_build_column(vdw_handle , ls_dbname, ls_coltype)
			ls_data = string(vdw_handle.dynamic f_getitemany(vl_row,lsa_unique_cols[li_idx]))
			if isnull(ls_data) then
				ls_data = '()'
			else
				if left(ls_coltype,4) = 'char' then ls_data = '='+ls_data
			end if
			if ls_filterString <> '' then ls_filterString+= ' AND '
			ls_filterString += lc_string.f_get_expression(ls_data, ls_coltype,ls_dbname, 'filter')
		NEXT
		vdw_handle.setfilter(ls_filterString)
		li_cnt = vdw_handle.filter()

		if li_cnt > 1 then
			lb_rtn = true
			if rs_duplicated_colname <> '' then rs_duplicated_colname += ';'
			rs_duplicated_colname += ls_unique_cols				
		elseif li_cnt < 0 then
			setnull(lb_rtn)
			gf_messagebox('m.c_dwsetup_initial.f_is_duplicated_data.02','Thông báo','Không retrieve được dữ liệu, c_dwsetup_initial.f_is_duplicated_data:line 43' ,'exclamation','ok',1)
			return lb_rtn
		end if		
		ll_row_found = this.ids_setup_dw.find("dwobject = '"+ls_dwo+ "' AND not isnull(unique_column)" ,ll_row_found + 1, ids_setup_dw.rowcount( )+1)
	LOOP while ll_row_found > 0
	vdw_handle.setfilter("")
	li_cnt = vdw_handle.filter()	
	return lb_rtn
end if



end function

public function integer f_get_unique_colnames (datawindow vdw_handle, ref string rs_unique_colnames);/**********************************************************************************
Chức năng: Kiểm tra trùng dữ liệu theo cài đặt bảng và trả về tên các cột trùng
------------------------------------------------------------------------------------------------*/

string			ls_dwo
long			ll_row_found

c_string				lc_string
c_dwservice			lc_dwservice


ls_dwo = left(vdw_handle.dataobject, len(vdw_handle.dataobject) - 5)
ll_row_found = this.ids_setup_dw.find("dwobject = '"+ls_dwo + "' AND not isnull(unique_column)" ,1, ids_setup_dw.rowcount( ))


if ll_row_found = 0 then
	return 0
elseif ll_row_found > 0 then
	rs_unique_colnames = this.ids_setup_dw.getitemstring(ll_row_found, 'unique_column')
else
	return -1
end if

return 1

end function

public function integer f_set_initvalue (t_ds_db vds_handle, long vl_row_dwhandle, long vl_row_dwsetup, string vs_colname, string vs_coltype, string vs_colstyle, string vs_value);/*******************************************************
Gán giá trị mặc định vào dw
-------------------------------------------------------------------------------------------------
Tham số:   	 - vds_handle: dw insert dòng mới
           		 - vl_row_dwhandle: dòng đang thêm mới
				 - vl_row_dwsetup: Số dòng cùa ids_setup_dw chứa giá trị cài đặt mặc định
				 - vs_colname: tên cột có cài đặt giá trị mặc định
				 - vs_coltype: Kiễu dữ liệu của cột
				 - vs_colstyle: Kiểu edit của cột
				 - vs_value: giá trị mặc định cài đặt

===========================================*/
string		ls_return_column, lsa_return_column[], ls_receive_column, lsa_receive_column[], ls_find_str, ls_coltype
int			li_Rtn, li_cnt, li_colCount
long		ll_row, ll_child_row
any		la_data
c_string				lc_string
Datawindowchild 	ldwc_child
c_dwservice		lc_dwservice

	
//-- set giá trị mặc định --//
CHOOSE CASE Lower ( Left ( vs_coltype, 5 ) )
	CASE "char(", "char"		//  CHARACTER DATATYPE
		li_Rtn = vds_handle.setitem(vl_row_dwhandle,vs_colname, vs_value)
	CASE "date"					//  DATE DATATYPE
		li_Rtn = vds_handle.setitem(vl_row_dwhandle,vs_colname, date( vs_value))
	CASE "datet"				//  DATETIME DATATYPE
		li_Rtn = vds_handle.setitem(vl_row_dwhandle,vs_colname, datetime( vs_value))
	CASE "decim"				//  DECIMAL DATATYPE
		li_Rtn = vds_handle.setitem(vl_row_dwhandle,vs_colname, dec( vs_value))
	CASE "numbe", "long", "ulong", "real", "int"				//  NUMBER DATATYPE	
		li_Rtn = vds_handle.setitem(vl_row_dwhandle,vs_colname, double( vs_value))				
	CASE "time", "times"		//  TIME DATATYPE
		li_Rtn = vds_handle.setitem(vl_row_dwhandle,vs_colname, time( vs_value))
END CHOOSE		
if li_Rtn = -1 then
	gf_messagebox('m.c_dwsetup_initial.f_set_initvalue.01','Thông báo','Không tạo được giá trị mặc định:@'+vs_colname+':'+vs_value,'exclamation','ok',1)
	return -1
end if

//-- trường hợp velueset: set giá trị cho các cột nhận giá trị trả về của valueset --//
//if vs_colstyle = 'dddw' then		
//	ls_return_column =  this.ids_setup_dw.getitemstring(vl_row_dwsetup, 'return_column')
//	ls_receive_column = this.ids_setup_dw.getitemstring(vl_row_dwsetup,'receive_column')
//	li_colCount = lc_string.f_stringtoarray( ls_return_column,';', lsa_return_column[])
//	li_colCount = lc_string.f_stringtoarray( ls_receive_column,';', lsa_receive_column[])
//	ls_receive_column = lc_string.f_getfirsttoken(ls_receive_column, ';')
//	ls_return_column = lc_string.f_getfirsttoken(ls_return_column, ';')
//	if vds_handle.getchild(vs_colname, ldwc_child ) = -1 then return -1
//	ls_coltype = vds_handle.describe(ls_receive_column+'.coltype' )
//	if Lower ( Left ( ls_coltype , 4) ) = "char" then
//		ls_find_str = ls_return_column +" = '"+ vs_value +"'"
//	elseif  Lower ( Left ( ls_coltype , 6) ) =  "number" then
//		ls_find_str = ls_return_column +" = "+ vs_value
//	end if		
//	ldwc_child.settransobject( sqlca)
//	ldwc_child.retrieve( )
//	ll_child_row = ldwc_child.find(ls_find_str, 1, ldwc_child.rowcount())
//	if ll_child_row > 0 then
//		FOR li_Rtn = 1 to li_colCount
//			if lsa_receive_column[li_rtn] =vs_colname then continue
//			la_data = lc_dwservice.f_getitemany_dwc( ldwc_child,ll_child_row , lsa_return_column[li_rtn])
//			ls_coltype = vds_handle.describe(lsa_receive_column[li_Rtn] +'.coltype' )			
//			if left(ls_coltype,4) = 'char' then
//				vds_handle.setitem( vl_row_dwhandle, lsa_receive_column[li_Rtn], string(la_data))
//			else
//				vds_handle.setitem( vl_row_dwhandle, lsa_receive_column[li_Rtn], la_data)
//			end if						
//		NEXT
//	end if
//end if		

return 1
end function

public function integer f_initvalue (t_ds_db vds_handle, long vl_row);/*******************************************************
Khởi tạo giá trị mặc định khi thêm dòng mới cho DW
-------------------------------------------------------------------------------------------------
Tham số:   	 - vds_handle: DW đang thêm dòng mới
           		 - vl_row: số dòng của record thêm mới
-------------------------------------------------------------------------------------------------
Return:      	 - 1 khởi tạo thành công
				 - 0: không có giá trị mặc định
				 - Err: -1
===========================================*/
string		ls_value, ls_colname, ls_colstyle, ls_coltype
string		ls_init_value_criteria_col, ls_expresssion,ls_value_coltype
int			li_Rtn, li_cnt
long		ll_row
c_string				lc_string


//-- kiểm tra biến vds_handle --//
//-- kiểm tra biến vl_row --//
ids_setup_dw.setfilter("DWOBJECT = '"+ left(vds_handle.dataobject,len(vds_handle.dataobject)-5)+"' AND not isnull(init_value)")
ids_setup_dw.filter( )

li_cnt = ids_setup_dw.rowcount( ) 
if li_cnt > 0 then
	ids_setup_dw.setsort( "dwcolumn a")
	ids_setup_dw.sort( )
	FOR ll_row = 1 to li_cnt
		ls_colname = ids_setup_dw.getitemstring( ll_row, 'dwcolumn')	
		ls_value = ids_setup_dw.getitemstring( ll_row, 'init_value')	
		ls_colstyle = vds_handle.describe(ls_colname+".edit.style")
		ls_coltype = vds_handle.describe(ls_colname+'.coltype' )
		ls_init_value_criteria_col = this.ids_setup_dw.getitemstring(ll_row, 'INIT_VALUE_CRITERIA_COL')		
		ls_value_coltype = vds_handle.describe(ls_init_value_criteria_col+'.coltype' )
		if not isnull(ls_init_value_criteria_col) and trim(ls_init_value_criteria_col) <> '' then
			ls_expresssion = this.ids_setup_dw.getitemstring(ll_row, 'INIT_VALUE_CRITERIA_VAL')
			ls_expresssion = lc_string.f_get_expression(ls_expresssion,ls_value_coltype,ls_init_value_criteria_col, 'modify')
			ls_expresssion ="If("+ls_expresssion + ", ~~'yes~~',~~'no~~')"
			if this.f_is_dwdatatype( ls_expresssion, vds_handle) then
				 if this.f_set_initvalue( vds_handle, vl_row, ll_row, ls_colname, ls_coltype, ls_colstyle, ls_value) = -1 then return -1
			end if
		else
			 if this.f_set_initvalue( vds_handle, vl_row, ll_row, ls_colname, ls_coltype, ls_colstyle, ls_value) = -1 then return -1
		end if	
	NEXT
	
	ids_setup_dw.setfilter('')
	ids_setup_dw.filter( )	
	return 1	
end if
ids_setup_dw.setfilter('')
ids_setup_dw.filter( )
return 0
end function

public function string f_get_drilldown_object (string vs_dwo, string vs_colname);string		ls_object, ls_dwo
long		ll_row_found
c_string	lc_string


ls_dwo = left(vs_dwo, len(vs_dwo) - 5)
ll_row_found = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" + vs_colname + "' AND not isnull(object_ref_table)",1, ids_setup_dw.rowcount( ) )

if ll_row_found > 0 then
	ls_object = this.ids_setup_dw.getitemstring( ll_row_found, 'object_ref_table')
end if
return ls_object
end function

public function boolean f_is_object_branch_yn (string vs_object);
int			li_cnt



select count(ID) into :li_cnt
from DWCOLUMN_SETUP_HDR 
where  branch_yn = 'Y' and upper(object) = upper(:vs_object) using sqlca;

if li_cnt > 0 then
	return true
else
	return false
end if
end function

public function string f_get_textcolor_string (string vs_dwo, string vs_objectname, string vs_coltype, t_dw vdw_handle);string		ls_textcolor, ls_textclr_criteria_col, ls_expression, ls_expression_tmp, ls_coltype, ls_dwo, ls_closeStr
long		ll_row_found
c_string	lc_string


ls_dwo = left(vs_dwo, len(vs_dwo) - 5)
ll_row_found = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" + vs_objectname + "' AND not isnull(textcolor)",1, ids_setup_dw.rowcount( ) )

DO WHILE ll_row_found > 0 
	ls_textcolor = this.ids_setup_dw.getitemstring(ll_row_found, 'textcolor')
	if isnull(ls_textcolor) or ls_textcolor = "default" then
		ls_expression =  "default"
		return ls_expression
	end if
	ls_textclr_criteria_col = this.ids_setup_dw.getitemstring(ll_row_found, 'TEXTCLR_CRITERIA_COL')		
	if not isnull(ls_textclr_criteria_col) and trim(ls_textclr_criteria_col) <> '' then
		vs_coltype = vdw_handle.describe( ls_textclr_criteria_col +  ".coltype")
		ls_expression_tmp = this.ids_setup_dw.getitemstring(ll_row_found, 'TEXTCLR_CRITERIA_VAL')
		ls_expression_tmp = lc_string.f_get_expression(ls_expression_tmp,vs_coltype,ls_textclr_criteria_col, 'modify')
		if ls_expression <> '' then ls_expression += ", "
		ls_expression +="If("+ls_expression_tmp + ", "+ls_textcolor 
		ls_closeStr += ') '
	else
		ls_expression =  ls_textcolor
		return ls_expression
	end if		
	
	ll_row_found = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" + vs_objectname + "' AND not isnull(textcolor)",ll_row_found+1, ids_setup_dw.rowcount( ) +1)
LOOP

if ls_expression = '' then
	ls_expression =  "default"
else
	ls_expression += ", 0" + ls_closeStr
end if

return ls_expression
end function

public function integer f_set_autonumber (t_dw vdw_handle, long vl_row);//-- Dùng gọi trong dw postinsert --//

b_sequences		lb_sequences
c_string				lc_string
double				ldb_seq_id
string					ls_seq_reset_colname, ls_seq_reset_coltext, ls_autonumber, ls_current_autonumber
string					ls_colname, ls_coltype, ls_valueset_criteria_col, ls_value_coltype, ls_expresssion
any					la_origin_reset_data, la_current_reset_data
int						li_cnt
long					ll_row

ids_setup_dw.setfilter("DWOBJECT = '"+ left(vdw_handle.dataobject,len(vdw_handle.dataobject)-5)+"' AND dwdatatype='SEQUENCES' ")
ids_setup_dw.filter( )
li_cnt = ids_setup_dw.rowcount( ) 
if li_cnt > 0 then
	FOR ll_row = 1 to li_cnt
		ls_colname = ids_setup_dw.getitemstring( ll_row, 'dwcolumn')	
		ls_coltype = vdw_handle.describe(ls_colname+'.coltype' )
		ls_valueset_criteria_col = this.ids_setup_dw.getitemstring(ll_row, 'VALUESET_CRITERIA_COL')		
		ls_value_coltype = vdw_handle.describe(ls_valueset_criteria_col+'.coltype' )
		if not isnull(ls_valueset_criteria_col) and trim(ls_valueset_criteria_col) <> '' then
			ls_expresssion = this.ids_setup_dw.getitemstring(ll_row, 'VALUESET_CRITERIA_VAL')
			ls_expresssion = lc_string.f_get_expression(ls_expresssion,ls_value_coltype,ls_valueset_criteria_col, 'modify')
			ls_expresssion ="If("+ls_expresssion + ", ~~'yes~~',~~'no~~')"
			if this.f_is_dwdatatype( ls_expresssion, vdw_handle) then
				//-- Kiểm tra cột auto-sequence --//
				this.f_get_sequence_info(vdw_handle, ls_colname,ldb_seq_id, ls_seq_reset_colname)
				if ldb_seq_id = 0 then return 0			
				if lb_sequences.f_init(ldb_seq_id) = 1 then
					if lb_sequences.is_type = 'manual' then return 0
					ls_current_autonumber = vdw_handle.getitemstring(vl_row, ls_colname)
					if isnull(ls_current_autonumber) then //-- chưa tạo số --//
						if lb_sequences.is_reset_type = 'none' then			
							if ls_seq_reset_colname = '' or isnull(ls_seq_reset_colname) then
								ls_autonumber = lb_sequences.f_create_autonumber(ldb_seq_id)
								ids_setup_dw.setfilter('')
								ids_setup_dw.filter( )							
								return vdw_handle.setitem(vl_row, ls_colname, ls_autonumber)
							end if
						end if			
					end if
				end if			 				
			end if
		else
			//-- Kiểm tra cột auto-sequence --//
			this.f_get_sequence_info(vdw_handle, ls_colname,ldb_seq_id, ls_seq_reset_colname)
			if ldb_seq_id = 0 then return 0			
			if lb_sequences.f_init(ldb_seq_id) = 1 then
				if lb_sequences.is_type = 'manual' then return 0
				ls_current_autonumber = vdw_handle.getitemstring(vl_row, ls_colname)
				if isnull(ls_current_autonumber) then //-- chưa tạo số --//
					if lb_sequences.is_reset_type = 'none' then			
						if ls_seq_reset_colname = '' or isnull(ls_seq_reset_colname) then
							ls_autonumber = lb_sequences.f_create_autonumber(ldb_seq_id)
							ids_setup_dw.setfilter('')
							ids_setup_dw.filter( )							
							return vdw_handle.setitem(vl_row, ls_colname, ls_autonumber)
						end if
					end if			
				end if
			end if			 
		end if			
	NEXT
end if
ids_setup_dw.setfilter('')
ids_setup_dw.filter( )
return 0

end function

public function integer f_set_initvalue (t_dw vdw_handle, long vl_row_dwhandle, t_ds_db vds_dwsetup, long vl_row_dwsetup, string vs_colname, string vs_coltype, string vs_colstyle, string vs_value);/*******************************************************
Gán giá trị mặc định vào dw
-------------------------------------------------------------------------------------------------
Tham số:   	 - vdw_handle: dw insert dòng mới
           		 - vl_row_dwhandle: dòng đang thêm mới
				 - vl_row_dwsetup: Số dòng cùa ids_setup_dw chứa giá trị cài đặt mặc định
				 - vs_colname: tên cột có cài đặt giá trị mặc định
				 - vs_coltype: Kiễu dữ liệu của cột
				 - vs_colstyle: Kiểu edit của cột
				 - vs_value: giá trị mặc định cài đặt

===========================================*/
string		ls_return_column, lsa_return_column[], ls_receive_column, lsa_receive_column[], ls_find_str, ls_coltype
int			li_Rtn, li_cnt, li_colCount
long		ll_row_cnt, ll_child_row
any		la_data
c_string				lc_string
Datawindowchild 	ldwc_child
c_dwservice			lc_dwservice
s_w_main			lw_parent
s_object_display	lod_hdl
	
//-- set giá trị mặc định --//
CHOOSE CASE Lower ( Left ( vs_coltype, 5 ) )
	CASE "char(", "char"		//  CHARACTER DATATYPE
		li_Rtn = vdw_handle.setitem(vl_row_dwhandle,vs_colname, vs_value)
	CASE "date"					//  DATE DATATYPE
		li_Rtn = vdw_handle.setitem(vl_row_dwhandle,vs_colname, date( vs_value))
	CASE "datet"				//  DATETIME DATATYPE
		li_Rtn = vdw_handle.setitem(vl_row_dwhandle,vs_colname, datetime( vs_value))
	CASE "decim"				//  DECIMAL DATATYPE
		li_Rtn = vdw_handle.setitem(vl_row_dwhandle,vs_colname, dec( vs_value))
	CASE "numbe", "long", "ulong", "real", "int"				//  NUMBER DATATYPE	
		li_Rtn = vdw_handle.setitem(vl_row_dwhandle,vs_colname, double( vs_value))				
	CASE "time", "times"		//  TIME DATATYPE
		li_Rtn = vdw_handle.setitem(vl_row_dwhandle,vs_colname, time( vs_value))
END CHOOSE		
if li_Rtn = -1 then
	gf_messagebox('m.c_dwsetup_initial.f_set_initvalue.01','Thông báo','Không tạo được giá trị mặc định:@'+vs_colname+':'+vs_value,'exclamation','ok',1)
	return -1
end if

//-- trường hợp velueset: set giá trị cho các cột nhận giá trị trả về của valueset --//
if vs_colstyle = 'dddw' then		
	ls_return_column =  this.ids_setup_dw.getitemstring(vl_row_dwsetup, 'return_column')
	ls_receive_column = this.ids_setup_dw.getitemstring(vl_row_dwsetup,'receive_column')
	li_colCount = lc_string.f_stringtoarray( ls_return_column,';', lsa_return_column[])
	li_colCount = lc_string.f_stringtoarray( ls_receive_column,';', lsa_receive_column[])
	ls_receive_column = lc_string.f_getfirsttoken(ls_receive_column, ';')
	ls_return_column = lc_string.f_getfirsttoken(ls_return_column, ';')
//	if vdw_handle.getchild(vs_colname, ldwc_child ) = -1 then return -1
	
	ls_coltype = vdw_handle.describe(ls_receive_column+'.coltype' )
	if Lower ( Left ( ls_coltype , 4) ) = "char" then
		ls_find_str = ls_return_column +" = '"+ vs_value +"'"
	elseif  Lower ( Left ( ls_coltype , 6) ) =  "number" then
		ls_find_str = ls_return_column +" = "+ vs_value
	end if		
	 vdw_handle.f_getparentwindow(lw_parent)
	 lod_hdl = lw_parent.f_get_obj_handling( )
//	ll_row_cnt = this.f_retrieve_dwc(lod_hdl, lw_parent, vdw_handle, ldwc_child, vs_colname, vds_dwsetup )
	ll_row_cnt = vdw_handle.dynamic f_retrieve_dwc_ex(vs_colname)
	if vdw_handle.getchild(vs_colname, ldwc_child ) = -1 then return -1
	
	ll_child_row = ldwc_child.find(ls_find_str, 1, ldwc_child.rowcount())
	if ll_child_row > 0 then
		FOR li_Rtn = 1 to li_colCount
			if lsa_receive_column[li_rtn] =vs_colname then continue
			la_data = lc_dwservice.f_getitemany_dwc( ldwc_child,ll_child_row , lsa_return_column[li_rtn])
			ls_coltype = vdw_handle.describe(lsa_receive_column[li_Rtn] +'.coltype' )			
			if left(ls_coltype,4) = 'char' then
				vdw_handle.setitem( vl_row_dwhandle, lsa_receive_column[li_Rtn], string(la_data))
			else
				vdw_handle.setitem( vl_row_dwhandle, lsa_receive_column[li_Rtn], la_data)
			end if						
		NEXT
	end if
end if		

return 1
end function

public function long f_retrieve_dwc (s_object_display rod_hdl, s_w_main rw_parent, t_dw_mpl rdw_parent, datawindowchild rdwc_hdl, string vs_colname, t_ds_db vds_dwsetup);long					ll_rowcount, ll_where_len
int						li_count, li_idx
string					ls_originalsql_nowhere,ls_originalwhere, ls_whereclause, ls_dddwo, ls_rtn, ls_rebuild_dwc_sql, ls_col_string
string					ls_displaycolname
any					laa_value[]
c_dwservice				lc_dwservice
s_object_display		lpo_valueset
s_str_dwo_related		lstr_data_related[]
c_string					lc_string
c_sql						lc_sql

ls_dddwo = rdw_parent.describe( vs_colname+ '.dddw.name' )
lc_dwservice.f_getcurrentsql( rdwc_hdl, ls_originalsql_nowhere,ls_originalwhere)
lpo_valueset = create using 'u_valueset'
//-- Khởi tạo data related structure --//
lpo_valueset.dynamic f_get_data_related(vds_dwsetup,lstr_data_related[], rod_hdl)
//-- build data related --//
rw_parent.dynamic f_build_data_related( lstr_data_related[]) 

li_count = lc_dwservice.f_buildwhereclause_of_relation(rdwc_hdl, lstr_data_related[])
FOR li_idx = 1 to li_count
	if ls_whereclause <> '' then ls_whereclause +=  ' AND '
	ls_whereclause+=  lstr_data_related[li_idx].s_where	
NEXT
if ls_whereclause <> '' then ls_whereclause = '('+ls_whereclause+')'
destroy lpo_valueset

//-- lấy lại orginal where --//
ls_originalwhere = rdw_parent.istr_dddw_where.s_originalwhere
if ls_originalwhere <> '' then
	if pos(rdw_parent.istr_dddw_where.s_dddwo, ls_dddwo+';') = 0 then
		ls_originalwhere = ''
	else
		ls_rtn = mid(rdw_parent.istr_dddw_where.s_dddwo,1 ,pos(rdw_parent.istr_dddw_where.s_dddwo, ls_dddwo+';')+len(ls_dddwo))
		li_count = lc_string.f_countoccurrences(ls_rtn, ';')	
		if li_count = 1 then
			ls_originalwhere = mid(ls_originalwhere,1,pos(ls_originalwhere,';') -1)
		elseif li_count > 1 then
			ll_where_len = lc_string.f_pos(ls_originalwhere , ';', li_count) - lc_string.f_pos(ls_originalwhere , ';', li_count -1) - 1
			ls_originalwhere = mid(ls_originalwhere, lc_string.f_pos(ls_originalwhere , ';', li_count -1)+1, ll_where_len)
		end if
	end if
end if

if ls_whereclause <> '' then
	if ls_originalwhere <> '' then ls_whereclause = ls_originalwhere + ' AND ' + ls_whereclause
else
	ls_whereclause = ls_originalwhere
end if
lc_sql.f_addtowhereclause(ls_originalsql_nowhere,ls_whereclause , ' AND ')	
ls_rebuild_dwc_sql = 'Datawindow.Table.Select= ~"' + ls_originalsql_nowhere +'~"'
ls_rtn = rdwc_hdl.modify( ls_rebuild_dwc_sql)
//-- kiem tra language --//
if lc_dwservice.f_is_lang_dwc(rdwc_hdl ) then
	laa_value[1] = gs_user_lang
	ls_col_string = 'lang;'
//	lc_dwservice.f_add_where_dwc(ldwc,'lang;',laa_value[])
end if
//-- add where comapny --//
if pos(ls_displaycolname, 'company_id') > 0 then
	laa_value[upperbound(laa_value[])+1] = gi_user_comp_id
	ls_col_string += 'company_id;'
end if
//-- add where branch --//
ls_displaycolname = vds_dwsetup.getitemstring( 1, 'display_column')	
if pos(ls_displaycolname, 'branch_id') > 0  then
	laa_value[upperbound(laa_value[])+1] = gdb_branch
	ls_col_string += 'branch_id;'
end if
if upperbound(laa_value[]) > 0 then
	lc_dwservice.f_add_where_dwc(rdwc_hdl, ls_col_string, laa_value[])
end if

if ls_rtn <> '' then
	gf_messagebox('m.t_dw_mpl.f_retrieve_dwc.01','Thông báo','Không modify SQL được:t_dw_mpl.f_retrieve_dwc()line:57','exclamation','ok',1) 
	return -1
end if

rdwc_hdl.settrans( sqlca)

ll_rowcount = rdwc_hdl.retrieve( )


return ll_rowcount
end function

public function boolean f_is_duplicated_data (t_dw_mpl vdw_handle, long vl_row);any			las_args[]
string			ls_unique_cols, lsa_unique_cols[] , ls_sqlnowhere, ls_where, ls_data, ls_coltype, ls_rtn, ls_data_4msg, ls_dbname, ls_dwo,ls_update_table
string			ls_uniqueCol_independence[], ls_data_origin, lsa_empty[], ls_sqlnowhere_origin
long			ll_row_found
int				li_cnt, li_idx, li_cnt_independence, li_idx2
boolean		lb_modified, lb_not_origin
c_string				lc_string
t_ds_db				lds_check
c_sql					lc_sql
c_dwservice			lc_dwservice
s_w_main			lw_display
s_object_display	lod_handle
b_obj_instantiate	lobj_ins

ls_dwo = left(vdw_handle.dataobject, len(vdw_handle.dataobject) - 5)
ll_row_found = this.ids_setup_dw.find("dwobject = '"+ls_dwo + "' AND not isnull(unique_column)" ,1, ids_setup_dw.rowcount( ))
vdw_handle.dynamic f_getparentwindow(lw_display)
lod_handle = lw_display.dynamic f_get_obj_handling()

if ll_row_found = 0 then
	return false
else
	
	lod_handle.f_get_dw_retrieve_args( vdw_handle, las_args[])
	lds_check = create t_ds_db
	lds_check.dataobject = vdw_handle.dataobject
	lds_check.f_getcurrentsql(ls_sqlnowhere_origin , ls_where)

	ls_where =''
	DO 
		ls_unique_cols = this.ids_setup_dw.getitemstring(ll_row_found, 'unique_column')
		li_cnt_independence = lc_string.f_stringtoarray( ls_unique_cols, '|', ls_uniqueCol_independence[])
		if li_cnt_independence = 1 then
			li_cnt = lc_string.f_stringtoarray( ls_unique_cols, ';', lsa_unique_cols[])
			FOR li_idx = 1 to li_cnt
				if vdw_handle.getitemstatus(vl_row, lsa_unique_cols[li_idx],primary!) = datamodified! &
					OR vdw_handle.getitemstatus(vl_row, 0,primary!) = newmodified! then lb_modified = true
					
				ls_data = string(vdw_handle.dynamic f_getitemany(vl_row,lsa_unique_cols[li_idx]))
				if isnull(ls_data) and li_cnt = 1 then
					 lb_modified = false 
					 exit
				end if
				ls_data_origin = string(vdw_handle.dynamic f_getitemany(vl_row,lsa_unique_cols[li_idx], primary!,true ))
				if isnull(ls_data_origin) then ls_data_origin =''
				if ls_data_origin <> ls_data or vdw_handle.getitemstatus(vl_row, 0,primary!) = newmodified!  then  lb_not_origin = true

				ls_dbname =  lsa_unique_cols[li_idx]				
				lc_dwservice.f_get_build_column(vdw_handle , ls_dbname, ls_coltype)
				
				if ls_data_4msg <> '' then ls_data_4msg += ';'
				ls_data_4msg += upper(ls_data)
				if isnull(ls_data) then
					ls_data = '()'
				else
					if left(ls_coltype,4) = 'char' then ls_data = '='+ upper(ls_data)
				end if
				if ls_where <> '' then ls_where+= ' AND '
				ls_dbname = 'UPPER('+ls_dbname+')'
				ls_where += lc_string.f_get_expression(ls_data, ls_coltype,ls_dbname, 'build where')

			NEXT		
			if lb_modified  and lb_not_origin then	
				if lobj_ins.f_is_branch_yn_ex(lod_handle.classname(), lw_display.it_transaction ) and vdw_handle.f_is_branch() then
					ls_dbname = 'branch_id'
					lc_dwservice.f_get_build_column(vdw_handle , ls_dbname, ls_coltype)				
					if ls_where <> '' then ls_where += ' AND '
					ls_where += lc_string.f_get_expression(string( gdb_branch ), ls_coltype,ls_dbname, 'build where')
				end if
				
				ls_update_table=lds_check.describe( "DataWindow.Table.UpdateTable")
				ls_data='='+right(lod_handle.classname(),len(lod_handle.classname())-2)
				if  UPPER(ls_update_table)='OBJECT' then
					ls_dbname='OBJECT_REF_TABLE'
					ls_data = upper(ls_data)
				elseif UPPER(ls_update_table)='DOCUMENT' then
					ls_dbname='DOC_TYPE'
					ls_data =  upper(ls_data)
				ELSE
					ls_dbname=''
				end if
				IF ls_dbname<>'' THEN
					lc_dwservice.f_get_build_column(vdw_handle , ls_dbname, ls_coltype)
					ls_dbname = 'UPPER('+ls_dbname+')'
					if ls_where <> '' then ls_where+= ' AND '
					ls_where += lc_string.f_get_expression(ls_data, ls_coltype,ls_dbname, 'build where')
				END IF
				ls_sqlnowhere = ls_sqlnowhere_origin
				lc_sql.f_addtowhereclause(ls_sqlnowhere , ls_where, ' AND ')
					
				ls_rtn = lds_check.modify(  'Datawindow.Table.Select= "' + ls_sqlnowhere +'"')
				if ls_rtn = '' then
					//-- đóng lại bởi Long, vì bắt trùng dữ liệu không cần build where branch --//
					//lds_check.f_addwhereclause_of_company(lod_handle )
					//-- mở rộng cho người dùng có thể chọn bắt trùng theo branch hoặc không --//
					lds_check.settransobject( lw_display.it_transaction)
					lds_check.f_set_retrieve_args( las_args)
					li_cnt = lds_check.event e_retrieve( )
					if li_cnt > 0 then
						gf_messagebox('m.c_dwsetup_initial.f_is_duplicated_data.01','Thông báo','Dữ liệu sau bị trùng lắp: @'+ls_data_4msg,'exclamation','ok',1)
						return true
					elseif li_cnt < 0 then
						gf_messagebox('m.c_dwsetup_initial.f_is_duplicated_data.02','Thông báo','Không retrieve được dữ liệu, c_dwsetup_initial.f_is_duplicated_data:line 35','exclamation','ok',1)
						return true
					end if
				else
					gf_messagebox('m.c_dwsetup_initial.f_is_duplicated_data.03','Thông báo','Không modify được DW, c_dwsetup_initial.f_is_duplicated_data:line 31','exclamation','ok',1)
					return true
				end if
			end if			
		elseif li_cnt_independence > 1 then
			FOR li_idx = 1 to li_cnt_independence
				ls_where =''
				ls_data_4msg = ''
				lb_modified = false
				lb_not_origin = false
				 lsa_unique_cols[] = lsa_empty[]
				li_cnt = lc_string.f_stringtoarray( ls_uniqueCol_independence[li_idx], ';', lsa_unique_cols[])
				FOR li_idx2 = 1 to li_cnt
					if vdw_handle.getitemstatus(vl_row, lsa_unique_cols[li_idx2],primary!) = datamodified! &
						OR vdw_handle.getitemstatus(vl_row, 0,primary!) = newmodified! then lb_modified = true
					ls_data = string(vdw_handle.dynamic f_getitemany(vl_row,lsa_unique_cols[li_idx2]))
					if isnull(ls_data) and li_cnt = 1 then
						 lb_modified = false 
						 exit
					end if					
					ls_data_origin = string(vdw_handle.dynamic f_getitemany(vl_row,lsa_unique_cols[li_idx2], primary!,true ))
					if ls_data_origin <> ls_data or  vdw_handle.getitemstatus(vl_row, 0,primary!) = newmodified!  then  lb_not_origin = true
					
					ls_dbname =  lsa_unique_cols[li_idx2]					
					lc_dwservice.f_get_build_column(vdw_handle , ls_dbname, ls_coltype)					
					if ls_data_4msg <> '' then ls_data_4msg += ';'
					ls_data_4msg += upper(ls_data)
					if isnull(ls_data) then
						ls_data = '()'
					else
						if left(ls_coltype,4) = 'char' then ls_data = '='+ upper(ls_data)
					end if
					if ls_where <> '' then ls_where+= ' AND '
					ls_dbname = 'UPPER('+ls_dbname+')'
					ls_where += lc_string.f_get_expression(ls_data, ls_coltype,ls_dbname, 'build where')
				NEXT			
				if lb_modified and lb_not_origin then	
					if lobj_ins.f_is_branch_yn_ex(lod_handle.classname(), lw_display.it_transaction) then
						ls_dbname = 'branch_id'
						lc_dwservice.f_get_build_column(vdw_handle , ls_dbname, ls_coltype)		
						if ls_where <> '' then ls_where+= ' AND '
						ls_where += lc_string.f_get_expression(string( gdb_branch ), ls_coltype,ls_dbname, 'build where')
					end if				
					
					ls_update_table=lds_check.describe( "DataWindow.Table.UpdateTable")
					ls_data='='+right(lod_handle.classname(),len(lod_handle.classname())-2)
					if  UPPER(ls_update_table)='OBJECT' then
						ls_dbname='OBJECT_REF_TABLE'
						ls_data = upper(ls_data)
					elseif UPPER(ls_update_table)='DOCUMENT' then
						ls_dbname='DOC_TYPE'
						ls_data =  upper(ls_data)
					ELSE
						ls_dbname=''
					end if
					IF ls_dbname<>'' THEN
						lc_dwservice.f_get_build_column(vdw_handle , ls_dbname, ls_coltype)
						ls_dbname = 'UPPER('+ls_dbname+')'
						if ls_where <> '' then ls_where+= ' AND '
						ls_where += lc_string.f_get_expression(ls_data, ls_coltype,ls_dbname, 'build where')
					END IF
					ls_sqlnowhere = ls_sqlnowhere_origin
					lc_sql.f_addtowhereclause(ls_sqlnowhere , ls_where, ' AND ')
						
					ls_rtn = lds_check.modify(  'Datawindow.Table.Select= "' + ls_sqlnowhere +'"')
					if ls_rtn = '' then
						//-- đóng lại bởi Long, vì bắt trùng dữ liệu không cần build where branch --//
						//lds_check.f_addwhereclause_of_company(lod_handle )
						//-- mở rộng cho người dùng có thể chọn bắt trùng theo branch hoặc không --//
						lds_check.settransobject( lw_display.it_transaction)
						lds_check.f_set_retrieve_args( las_args)
						li_cnt = lds_check.event e_retrieve( )
						if li_cnt > 0 then
							gf_messagebox('m.c_dwsetup_initial.f_is_duplicated_data.01','Thông báo','Dữ liệu sau bị trùng lắp: @'+ls_data_4msg,'exclamation','ok',1)
							return true
						elseif li_cnt < 0 then
							gf_messagebox('m.c_dwsetup_initial.f_is_duplicated_data.02','Thông báo','Không retrieve được dữ liệu, c_dwsetup_initial.f_is_duplicated_data:line 35','exclamation','ok',1)
							return true
						end if
					else
						gf_messagebox('m.c_dwsetup_initial.f_is_duplicated_data.03','Thông báo','Không modify được DW, c_dwsetup_initial.f_is_duplicated_data:line 31','exclamation','ok',1)
						return true
					end if
				end if				
			NEXT
		end if
		
		ll_row_found = this.ids_setup_dw.find("dwobject = '"+ls_dwo+ "' AND not isnull(unique_column)" ,ll_row_found + 1, ids_setup_dw.rowcount( )+1)
	LOOP while ll_row_found > 0
	return false
end if



end function

public function long f_init_ids_setup_dw_ex (string vs_objname, ref t_transaction rt_transaction);any		laa_value[]

if isvalid(ids_setup_dw) then
	ids_setup_dw.setfilter( "") 
	ids_setup_dw.filter( )
	if ids_setup_dw.rowcount() > 0 then
		is_receive_column = ''
		is_return_column = ''
		return 1
	else
		ids_setup_dw.dataobject = 'ds_setup_dw'
	end if
else
	ids_setup_dw = create t_ds_db
	ids_setup_dw.dataobject = 'ds_setup_dw'
end if
is_receive_column = ''
is_return_column = ''

laa_value[1] = '='+upper(vs_objname)
laa_value[2] = gi_user_comp_id
laa_value[3] = gdb_branch
ids_setup_dw.f_add_where('object;company_id;branch_id;',laa_value[])
ids_setup_dw.settransobject (rt_transaction)
return ids_setup_dw.retrieve()

end function

public function integer f_set_autonumber_ex (t_dw vdw_handle, long vl_row, ref t_transaction rt_transaction);//-- Dùng gọi trong dw postinsert --//

b_sequences		lb_sequences
c_string				lc_string
double				ldb_seq_id
string					ls_seq_reset_colname, ls_seq_reset_coltext, ls_autonumber, ls_current_autonumber
string					ls_colname, ls_coltype, ls_valueset_criteria_col, ls_value_coltype, ls_expresssion
any					la_origin_reset_data, la_current_reset_data
int						li_cnt
long					ll_row

ids_setup_dw.setfilter("DWOBJECT = '"+ left(vdw_handle.dataobject,len(vdw_handle.dataobject)-5)+"' AND dwdatatype='SEQUENCES' ")
ids_setup_dw.filter( )
li_cnt = ids_setup_dw.rowcount( ) 
if li_cnt > 0 then
	FOR ll_row = 1 to li_cnt
		ls_colname = ids_setup_dw.getitemstring( ll_row, 'dwcolumn')	
		ls_coltype = vdw_handle.describe(ls_colname+'.coltype' )
		ls_valueset_criteria_col = this.ids_setup_dw.getitemstring(ll_row, 'VALUESET_CRITERIA_COL')		
		ls_value_coltype = vdw_handle.describe(ls_valueset_criteria_col+'.coltype' )
		if not isnull(ls_valueset_criteria_col) and trim(ls_valueset_criteria_col) <> '' then
			ls_expresssion = this.ids_setup_dw.getitemstring(ll_row, 'VALUESET_CRITERIA_VAL')
			ls_expresssion = lc_string.f_get_expression(ls_expresssion,ls_value_coltype,ls_valueset_criteria_col, 'modify')
			ls_expresssion ="If("+ls_expresssion + ", ~~'yes~~',~~'no~~')"
			if this.f_is_dwdatatype( ls_expresssion, vdw_handle) then
				//-- Kiểm tra cột auto-sequence --//
				this.f_get_sequence_info(vdw_handle, ls_colname,ldb_seq_id, ls_seq_reset_colname)
				if ldb_seq_id = 0 then return 0			
				if lb_sequences.f_init(ldb_seq_id) = 1 then
					if lb_sequences.is_type = 'manual' then return 0
					ls_current_autonumber = vdw_handle.getitemstring(vl_row, ls_colname)
					if isnull(ls_current_autonumber) then //-- chưa tạo số --//
						if lb_sequences.is_reset_type = 'none' then			
							if ls_seq_reset_colname = '' or isnull(ls_seq_reset_colname) then
								ls_autonumber = lb_sequences.f_create_autonumber_ex(ldb_seq_id, rt_transaction)
								ids_setup_dw.setfilter('')
								ids_setup_dw.filter( )							
								return vdw_handle.setitem(vl_row, ls_colname, ls_autonumber)
							end if
						end if			
					end if
				end if			 				
			end if
		else
			//-- Kiểm tra cột auto-sequence --//
			this.f_get_sequence_info(vdw_handle, ls_colname,ldb_seq_id, ls_seq_reset_colname)
			if ldb_seq_id = 0 then return 0			
			if lb_sequences.f_init_ex(ldb_seq_id, rt_transaction) = 1 then
				if lb_sequences.is_type = 'manual' then return 0
				ls_current_autonumber = vdw_handle.getitemstring(vl_row, ls_colname)
				if isnull(ls_current_autonumber) then //-- chưa tạo số --//
					if lb_sequences.is_reset_type = 'none' then			
						if ls_seq_reset_colname = '' or isnull(ls_seq_reset_colname) then
							ls_autonumber = lb_sequences.f_create_autonumber_ex(ldb_seq_id, rt_transaction)
							ids_setup_dw.setfilter('')
							ids_setup_dw.filter( )							
							return vdw_handle.setitem(vl_row, ls_colname, ls_autonumber)
						end if
					end if			
				end if
			end if			 
		end if			
	NEXT
end if
ids_setup_dw.setfilter('')
ids_setup_dw.filter( )
return 0

end function

public function integer f_set_autonumber_ex (string vs_colname, t_dw vdw_handle, long vl_row, ref t_transaction rt_transaction);b_sequences		lb_sequences
double				ldb_seq_id
string					ls_seq_reset_colname, ls_seq_reset_coltext, ls_autonumber, ls_current_autonumber
//date					ld_origin_date, ld_current_date
any					la_origin_reset_data, la_current_reset_data

//-- Kiểm tra cột auto-sequence --//
this.f_get_sequence_info(vdw_handle, vs_colname,ldb_seq_id, ls_seq_reset_colname)
if ldb_seq_id = 0 then return 0

if lb_sequences.f_init_ex(ldb_seq_id, rt_transaction) = 1 then
	if lb_sequences.is_type = 'manual' then return 0
	ls_current_autonumber = vdw_handle.getitemstring(vl_row, vs_colname)
	if isnull(ls_current_autonumber) then //-- chưa tạo số --//
		if lb_sequences.is_reset_type = 'none' then
			
			if ls_seq_reset_colname = '' or isnull(ls_seq_reset_colname) then
				ls_autonumber = lb_sequences.f_create_autonumber_ex(ldb_seq_id, rt_transaction)
			else
				if lower(trim(ls_seq_reset_colname)) = 'session_date' then
					la_current_reset_data = gd_session_date
				else
					la_current_reset_data = vdw_handle.f_getitemany(vl_row, ls_seq_reset_colname)
					ls_autonumber = lb_sequences.f_create_autonumber_ex(ldb_seq_id, date(la_current_reset_data), rt_transaction)
				end if				
			end if
		else
			if ls_seq_reset_colname = '' or isnull(ls_seq_reset_colname) then
				gf_messagebox('m.c_dwsetup_initial.f_set_autonumber.01','Thông báo','Chưa cài đặt cột ngày tạo số tự động cho cách đánh số:@'+&
										lb_sequences.is_seq_code + '-' + lb_sequences.is_seq_name, 'exclamation','ok',1)
				return -1
			end if		
			if lower(trim(ls_seq_reset_colname)) = 'session_date' then
				la_current_reset_data = gd_session_date
			else
				la_current_reset_data = vdw_handle.f_getitemany(vl_row, ls_seq_reset_colname)
			end if
			if isnull(la_current_reset_data) then
				ls_seq_reset_coltext = vdw_handle.describe(ls_seq_reset_colname+'_t.text')
				gf_messagebox('m.c_dwsetup_initial.f_set_autonumber.02','Thông báo','Chưa nhập dữ liệu :@'+ls_seq_reset_coltext, 'exclamation','ok',1)			
				vdw_handle.setitem(vl_row, vs_colname, ls_autonumber)
				return -1
			end if
			if lb_sequences.is_reset_type = 'structure' then
				ls_autonumber = lb_sequences.f_create_autonumber_ex(string(la_current_reset_data), rt_transaction)			
			else
				ls_autonumber = lb_sequences.f_create_autonumber_ex(date(la_current_reset_data), rt_transaction)
			end if
		end if			
	else //-- đã có số --//
		if lb_sequences.is_reset_type = 'none' then return 0		
		if lower(trim(ls_seq_reset_colname)) = 'session_date' then return 0
			
		la_origin_reset_data = vdw_handle.f_getitemany(vl_row, ls_seq_reset_colname, primary!, true)
		la_current_reset_data = vdw_handle.f_getitemany(vl_row, ls_seq_reset_colname, primary!, false)
		if isnull(la_current_reset_data) then
			ls_seq_reset_coltext = vdw_handle.describe(ls_seq_reset_colname+'_t.text')
			gf_messagebox('m.c_dwsetup_initial.f_set_autonumber.02','Thông báo','Chưa nhập dữ liệu :@'+ls_seq_reset_coltext, 'exclamation','ok',1)			
			return -1
		end if
		choose case lb_sequences.is_reset_type 
			case 'monthly'
				if month(date(la_current_reset_data)) = month(date(la_origin_reset_data)) then return 0					
			case 'yearly'
				if year(date(la_current_reset_data)) = year(date(la_origin_reset_data)) then return 0						
			case 'daily'
				if day(date(la_current_reset_data)) = day(date(la_origin_reset_data)) then return 0				
			case 'structure'
				if string(la_current_reset_data) = string(la_origin_reset_data) then return 0
		end choose		
		
		if lb_sequences.is_reset_type = 'structure' then
			//-- xóa seq cũ --//
			lb_sequences.f_delete_autonumber_ex(ls_current_autonumber, string(la_origin_reset_data),rt_transaction )
			//--tạo seq mới --//
			ls_autonumber = lb_sequences.f_create_autonumber_ex(string(la_current_reset_data), rt_transaction)
		else
			//-- xóa seq cũ --//
			lb_sequences.f_delete_autonumber_ex(ls_current_autonumber, date(la_origin_reset_data), rt_transaction)
			//--tạo seq mới --//
			ls_autonumber = lb_sequences.f_create_autonumber_ex(date(la_current_reset_data), rt_transaction)
		end if			
	end if
else
	return 0
end if

return vdw_handle.setitem(vl_row, vs_colname, ls_autonumber)

end function

public function boolean f_is_duplicated_data_ex (t_dw_mpl vdw_handle, long vl_row);any			las_args[]
string			ls_unique_cols, lsa_unique_cols[] , ls_sqlnowhere, ls_where, ls_data, ls_coltype, ls_rtn, ls_data_4msg, ls_dbname, ls_dwo,ls_update_table
string			ls_uniqueCol_independence[], ls_data_origin, lsa_empty[], ls_sqlnowhere_origin
long			ll_row_found
int				li_cnt, li_idx, li_cnt_independence, li_idx2
boolean		lb_modified, lb_not_origin
c_string				lc_string
t_ds_db				lds_check
c_sql					lc_sql
c_dwservice			lc_dwservice
s_w_main			lw_display
s_object_display	lod_handle
b_obj_instantiate	lobj_ins

ls_dwo = left(vdw_handle.dataobject, len(vdw_handle.dataobject) - 5)
ll_row_found = this.ids_setup_dw.find("dwobject = '"+ls_dwo + "' AND not isnull(unique_column)" ,1, ids_setup_dw.rowcount( ))
vdw_handle.dynamic f_getparentwindow(lw_display)
lod_handle = lw_display.dynamic f_get_obj_handling()

if ll_row_found = 0 then
	return false
else
	
	lod_handle.f_get_dw_retrieve_args( vdw_handle, las_args[])
	lds_check = create t_ds_db
	lds_check.dataobject = vdw_handle.dataobject
	lds_check.f_getcurrentsql(ls_sqlnowhere_origin , ls_where)

	ls_where =''
	DO 
		ls_unique_cols = this.ids_setup_dw.getitemstring(ll_row_found, 'unique_column')
		li_cnt_independence = lc_string.f_stringtoarray( ls_unique_cols, '|', ls_uniqueCol_independence[])
		if li_cnt_independence = 1 then
			li_cnt = lc_string.f_stringtoarray( ls_unique_cols, ';', lsa_unique_cols[])
			FOR li_idx = 1 to li_cnt
				if vdw_handle.getitemstatus(vl_row, lsa_unique_cols[li_idx],primary!) = datamodified! &
					OR vdw_handle.getitemstatus(vl_row, 0,primary!) = newmodified! then lb_modified = true
					
				ls_data = string(vdw_handle.dynamic f_getitemany(vl_row,lsa_unique_cols[li_idx]))
				if isnull(ls_data) and li_cnt = 1 then
					 lb_modified = false 
					 exit
				end if
				ls_data_origin = string(vdw_handle.dynamic f_getitemany(vl_row,lsa_unique_cols[li_idx], primary!,true ))
				if isnull(ls_data_origin) then ls_data_origin =''
				if ls_data_origin <> ls_data or vdw_handle.getitemstatus(vl_row, 0,primary!) = newmodified!  then  lb_not_origin = true

				ls_dbname =  lsa_unique_cols[li_idx]				
				lc_dwservice.f_get_build_column(vdw_handle , ls_dbname, ls_coltype)
				
				if ls_data_4msg <> '' then ls_data_4msg += ';'
				ls_data_4msg += upper(ls_data)
				if isnull(ls_data) then
					ls_data = '()'
				else
					if left(ls_coltype,4) = 'char' then ls_data = '='+ upper(ls_data)
				end if
				if ls_where <> '' then ls_where+= ' AND '
				ls_dbname = 'UPPER('+ls_dbname+')'
				ls_where += lc_string.f_get_expression(ls_data, ls_coltype,ls_dbname, 'build where')

			NEXT		
			if lb_modified  and lb_not_origin then	
				if lobj_ins.f_is_branch_yn_ex(lod_handle.classname(), lw_display.it_transaction ) and vdw_handle.f_is_branch() then
					ls_dbname = 'branch_id'
					lc_dwservice.f_get_build_column(vdw_handle , ls_dbname, ls_coltype)				
					if ls_where <> '' then ls_where += ' AND '
					ls_where += lc_string.f_get_expression(string( gdb_branch ), ls_coltype,ls_dbname, 'build where')
				end if
				
				ls_update_table=lds_check.describe( "DataWindow.Table.UpdateTable")
				ls_data='='+right(lod_handle.classname(),len(lod_handle.classname())-2)
				if  UPPER(ls_update_table)='OBJECT' then
					ls_dbname='OBJECT_REF_TABLE'
					ls_data = upper(ls_data)
				elseif UPPER(ls_update_table)='DOCUMENT' then
					ls_dbname='DOC_TYPE'
					ls_data =  upper(ls_data)
				ELSE
					ls_dbname=''
				end if
				IF ls_dbname<>'' THEN
					lc_dwservice.f_get_build_column(vdw_handle , ls_dbname, ls_coltype)
					ls_dbname = 'UPPER('+ls_dbname+')'
					if ls_where <> '' then ls_where+= ' AND '
					ls_where += lc_string.f_get_expression(ls_data, ls_coltype,ls_dbname, 'build where')
				END IF
				ls_sqlnowhere = ls_sqlnowhere_origin
				lc_sql.f_addtowhereclause(ls_sqlnowhere , ls_where, ' AND ')
					
				ls_rtn = lds_check.modify(  'Datawindow.Table.Select= "' + ls_sqlnowhere +'"')
				if ls_rtn = '' then
					//-- đóng lại bởi Long, vì bắt trùng dữ liệu không cần build where branch --//
					//lds_check.f_addwhereclause_of_company(lod_handle )
					//-- mở rộng cho người dùng có thể chọn bắt trùng theo branch hoặc không --//
					lds_check.settransobject( lw_display.it_transaction )
					lds_check.f_set_retrieve_args( las_args)
					li_cnt = lds_check.event e_retrieve( )
					if li_cnt > 0 then
						gf_messagebox('m.c_dwsetup_initial.f_is_duplicated_data.01','Thông báo','Dữ liệu sau bị trùng lắp: @'+ls_data_4msg,'exclamation','ok',1)
						return true
					elseif li_cnt < 0 then
						gf_messagebox('m.c_dwsetup_initial.f_is_duplicated_data.02','Thông báo','Không retrieve được dữ liệu, c_dwsetup_initial.f_is_duplicated_data:line 35','exclamation','ok',1)
						return true
					end if
				else
					gf_messagebox('m.c_dwsetup_initial.f_is_duplicated_data.03','Thông báo','Không modify được DW, c_dwsetup_initial.f_is_duplicated_data:line 31','exclamation','ok',1)
					return true
				end if
			end if			
		elseif li_cnt_independence > 1 then
			FOR li_idx = 1 to li_cnt_independence
				ls_where =''
				ls_data_4msg = ''
				lb_modified = false
				lb_not_origin = false
				 lsa_unique_cols[] = lsa_empty[]
				li_cnt = lc_string.f_stringtoarray( ls_uniqueCol_independence[li_idx], ';', lsa_unique_cols[])
				FOR li_idx2 = 1 to li_cnt
					if vdw_handle.getitemstatus(vl_row, lsa_unique_cols[li_idx2],primary!) = datamodified! &
						OR vdw_handle.getitemstatus(vl_row, 0,primary!) = newmodified! then lb_modified = true
					ls_data = string(vdw_handle.dynamic f_getitemany(vl_row,lsa_unique_cols[li_idx2]))
					if isnull(ls_data) and li_cnt = 1 then
						 lb_modified = false 
						 exit
					end if					
					ls_data_origin = string(vdw_handle.dynamic f_getitemany(vl_row,lsa_unique_cols[li_idx2], primary!,true ))
					if ls_data_origin <> ls_data or  vdw_handle.getitemstatus(vl_row, 0,primary!) = newmodified!  then  lb_not_origin = true
					
					ls_dbname =  lsa_unique_cols[li_idx2]					
					lc_dwservice.f_get_build_column(vdw_handle , ls_dbname, ls_coltype)					
					if ls_data_4msg <> '' then ls_data_4msg += ';'
					ls_data_4msg += upper(ls_data)
					if isnull(ls_data) then
						ls_data = '()'
					else
						if left(ls_coltype,4) = 'char' then ls_data = '='+ upper(ls_data)
					end if
					if ls_where <> '' then ls_where+= ' AND '
					ls_dbname = 'UPPER('+ls_dbname+')'
					ls_where += lc_string.f_get_expression(ls_data, ls_coltype,ls_dbname, 'build where')
				NEXT			
				if lb_modified and lb_not_origin then	
					if lobj_ins.f_is_branch_yn_ex(lod_handle.classname(), lw_display.it_transaction ) then
						ls_dbname = 'branch_id'
						lc_dwservice.f_get_build_column(vdw_handle , ls_dbname, ls_coltype)		
						if ls_where <> '' then ls_where+= ' AND '
						ls_where += lc_string.f_get_expression(string( gdb_branch ), ls_coltype,ls_dbname, 'build where')
					end if				
					
					ls_update_table=lds_check.describe( "DataWindow.Table.UpdateTable")
					ls_data='='+right(lod_handle.classname(),len(lod_handle.classname())-2)
					if  UPPER(ls_update_table)='OBJECT' then
						ls_dbname='OBJECT_REF_TABLE'
						ls_data = upper(ls_data)
					elseif UPPER(ls_update_table)='DOCUMENT' then
						ls_dbname='DOC_TYPE'
						ls_data =  upper(ls_data)
					ELSE
						ls_dbname=''
					end if
					IF ls_dbname<>'' THEN
						lc_dwservice.f_get_build_column(vdw_handle , ls_dbname, ls_coltype)
						ls_dbname = 'UPPER('+ls_dbname+')'
						if ls_where <> '' then ls_where+= ' AND '
						ls_where += lc_string.f_get_expression(ls_data, ls_coltype,ls_dbname, 'build where')
					END IF
					ls_sqlnowhere = ls_sqlnowhere_origin
					lc_sql.f_addtowhereclause(ls_sqlnowhere , ls_where, ' AND ')
						
					ls_rtn = lds_check.modify(  'Datawindow.Table.Select= "' + ls_sqlnowhere +'"')
					if ls_rtn = '' then
						//-- đóng lại bởi Long, vì bắt trùng dữ liệu không cần build where branch --//
						//lds_check.f_addwhereclause_of_company(lod_handle )
						//-- mở rộng cho người dùng có thể chọn bắt trùng theo branch hoặc không --//
						lds_check.settransobject( lw_display.it_transaction)
						lds_check.f_set_retrieve_args( las_args)
						li_cnt = lds_check.event e_retrieve( )
						if li_cnt > 0 then
							gf_messagebox('m.c_dwsetup_initial.f_is_duplicated_data.01','Thông báo','Dữ liệu sau bị trùng lắp: @'+ls_data_4msg,'exclamation','ok',1)
							return true
						elseif li_cnt < 0 then
							gf_messagebox('m.c_dwsetup_initial.f_is_duplicated_data.02','Thông báo','Không retrieve được dữ liệu, c_dwsetup_initial.f_is_duplicated_data:line 35','exclamation','ok',1)
							return true
						end if
					else
						gf_messagebox('m.c_dwsetup_initial.f_is_duplicated_data.03','Thông báo','Không modify được DW, c_dwsetup_initial.f_is_duplicated_data:line 31','exclamation','ok',1)
						return true
					end if
				end if				
			NEXT
		end if
		
		ll_row_found = this.ids_setup_dw.find("dwobject = '"+ls_dwo+ "' AND not isnull(unique_column)" ,ll_row_found + 1, ids_setup_dw.rowcount( )+1)
	LOOP while ll_row_found > 0
	return false
end if



end function

public function long f_init_ids_setup_dw_ex (string vs_objname);any		laa_value[]
long		ll_rtn
t_transaction			lt_transaction

//-- Tạo connection voi database --//
lt_transaction = create t_transaction
lt_transaction.dbms =	SQLCA.DBMS
lt_transaction.ServerName	 = SQLCA.ServerName
lt_transaction.LogId	 = SQLCA.LogId
lt_transaction.LogPass 	 = SQLCA.LogPass 
lt_transaction.AutoCommit 	 = false 
lt_transaction.DBParm	 = SQLCA.DBParm
connect using	lt_transaction;	

if isvalid(ids_setup_dw) then
	ids_setup_dw.setfilter( "") 
	ids_setup_dw.filter( )
	if ids_setup_dw.rowcount() > 0 then
		is_receive_column = ''
		is_return_column = ''
		return 1
	else
		ids_setup_dw.dataobject = 'ds_setup_dw'
	end if
else
	ids_setup_dw = create t_ds_db
	ids_setup_dw.dataobject = 'ds_setup_dw'
end if
is_receive_column = ''
is_return_column = ''

laa_value[1] = '='+upper(vs_objname)
laa_value[2] = gi_user_comp_id
laa_value[3] = gdb_branch
ids_setup_dw.f_add_where('object;company_id;branch_id;',laa_value[])
ids_setup_dw.settransobject (lt_transaction)
ll_rtn = ids_setup_dw.retrieve()

disconnect using lt_transaction;
destroy lt_transaction
return  ll_rtn

end function

public function string f_get_autonumber_ex (string vs_colname, t_dw vdw_handle, long vl_row, ref t_transaction rt_transaction);b_sequences		lb_sequences
double				ldb_seq_id
string					ls_seq_reset_colname, ls_seq_reset_coltext, ls_autonumber, ls_current_autonumber
//date					ld_origin_date, ld_current_date
any					la_origin_reset_data, la_current_reset_data

//-- Kiểm tra cột auto-sequence --//
this.f_get_sequence_info(vdw_handle, vs_colname,ldb_seq_id, ls_seq_reset_colname)
if ldb_seq_id = 0 then return ''

if lb_sequences.f_init_ex(ldb_seq_id, rt_transaction) = 1 then
	if lb_sequences.is_type = 'manual' then return ''
	ls_current_autonumber = vdw_handle.getitemstring(vl_row, vs_colname)
	if isnull(ls_current_autonumber) or vl_row = 0 then //-- chưa tạo số --//
		if lb_sequences.is_reset_type = 'none' then
			
			if ls_seq_reset_colname = '' or isnull(ls_seq_reset_colname) then
				ls_autonumber = lb_sequences.f_create_autonumber_ex(ldb_seq_id, rt_transaction)
			else
				if lower(trim(ls_seq_reset_colname)) = 'session_date' or vl_row = 0 then
					la_current_reset_data = gd_session_date
				else
					la_current_reset_data = vdw_handle.f_getitemany(vl_row, ls_seq_reset_colname)
					ls_autonumber = lb_sequences.f_create_autonumber_ex(ldb_seq_id, date(la_current_reset_data), rt_transaction)
				end if				
			end if
		else
			if ls_seq_reset_colname = '' or isnull(ls_seq_reset_colname) then
				gf_messagebox('m.c_dwsetup_initial.f_set_autonumber.01','Thông báo','Chưa cài đặt cột ngày tạo số tự động cho cách đánh số:@'+&
										lb_sequences.is_seq_code + '-' + lb_sequences.is_seq_name, 'exclamation','ok',1)
				return ''
			end if		
			if lower(trim(ls_seq_reset_colname)) = 'session_date'  or vl_row = 0 then
				la_current_reset_data = gd_session_date
			else
				la_current_reset_data = vdw_handle.f_getitemany(vl_row, ls_seq_reset_colname)
			end if
			if isnull(la_current_reset_data) then
				ls_seq_reset_coltext = vdw_handle.describe(ls_seq_reset_colname+'_t.text')
				gf_messagebox('m.c_dwsetup_initial.f_set_autonumber.02','Thông báo','Chưa nhập dữ liệu :@'+ls_seq_reset_coltext, 'exclamation','ok',1)			
				vdw_handle.setitem(vl_row, vs_colname, ls_autonumber)
				return ''
			end if
			if lb_sequences.is_reset_type = 'structure' then
				ls_autonumber = lb_sequences.f_create_autonumber_ex(string(la_current_reset_data), rt_transaction)			
			else
				ls_autonumber = lb_sequences.f_create_autonumber_ex(date(la_current_reset_data), rt_transaction)
			end if
		end if			
	else //-- đã có số --//
		if lb_sequences.is_reset_type = 'none' then return ''		
		la_origin_reset_data = vdw_handle.f_getitemany(vl_row, ls_seq_reset_colname, primary!, true)
		la_current_reset_data = vdw_handle.f_getitemany(vl_row, ls_seq_reset_colname, primary!, false)
		if isnull(la_current_reset_data) then
			ls_seq_reset_coltext = vdw_handle.describe(ls_seq_reset_colname+'_t.text')
			gf_messagebox('m.c_dwsetup_initial.f_set_autonumber.02','Thông báo','Chưa nhập dữ liệu :@'+ls_seq_reset_coltext, 'exclamation','ok',1)			
			return ''
		end if
		choose case lb_sequences.is_reset_type 
			case 'monthly'
				if month(date(la_current_reset_data)) = month(date(la_origin_reset_data)) then return ''			
			case 'yearly'
				if year(date(la_current_reset_data)) = year(date(la_origin_reset_data)) then return ''					
			case 'daily'
				if day(date(la_current_reset_data)) = day(date(la_origin_reset_data)) then return ''			
			case 'structure'
				if string(la_current_reset_data) = string(la_origin_reset_data) then return ''
		end choose		
		
		if lb_sequences.is_reset_type = 'structure' then
			//-- xóa seq cũ --//
			lb_sequences.f_delete_autonumber_ex(ls_current_autonumber, string(la_origin_reset_data), rt_transaction )
			//--tạo seq mới --//
			ls_autonumber = lb_sequences.f_create_autonumber_ex(string(la_current_reset_data), rt_transaction)
		else
			//-- xóa seq cũ --//
			lb_sequences.f_delete_autonumber_ex(ls_current_autonumber, date(la_origin_reset_data), rt_transaction)
			//--tạo seq mới --//
			ls_autonumber = lb_sequences.f_create_autonumber_ex(date(la_current_reset_data), rt_transaction)
		end if			
	end if
else
	return ''
end if

return  ls_autonumber

end function

public function integer f_get_sequence_info (string vs_dwo, string vs_colname, ref double rdb_seq_id, ref string vs_seq_reset_colname);double	ldb_id
long		ll_row_found
string		ls_dwo, ls_valuset_criteria_col, ls_expresssion, ls_coltype,ls_dataobject
c_string	lc_string

ls_dataobject = vs_dwo
ls_dwo = left(ls_dataobject, len(ls_dataobject) - 5)

ll_row_found = this.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" + vs_colname + "' AND dwdatatype = 'SEQUENCES'",1, ids_setup_dw.rowcount( ) )
if ll_row_found > 0 then

	rdb_seq_id = this.ids_setup_dw.getitemnumber(ll_row_found, 'object_ref_id')
	vs_seq_reset_colname = this.ids_setup_dw.getitemstring(ll_row_found, 'SEQ_RESET_COLUMN')
	return 1		

end if
return 0
end function

public function string f_get_autonumber_ex (string vs_colname, string vs_dwo, ref t_transaction rt_transaction);b_sequences		lb_sequences
double				ldb_seq_id
string					ls_seq_reset_colname, ls_seq_reset_coltext, ls_autonumber, ls_current_autonumber
//date					ld_origin_date, ld_current_date
any					la_origin_reset_data, la_current_reset_data

//-- Kiểm tra cột auto-sequence --//
this.f_get_sequence_info(vs_dwo, vs_colname,ldb_seq_id, ls_seq_reset_colname)
if ldb_seq_id = 0 then return ''

if lb_sequences.f_init_ex(ldb_seq_id, rt_transaction) = 1 then
	if lb_sequences.is_type = 'manual' then return ''


		if lb_sequences.is_reset_type = 'none' then
			
			if ls_seq_reset_colname = '' or isnull(ls_seq_reset_colname) then
				ls_autonumber = lb_sequences.f_create_autonumber_ex(ldb_seq_id, rt_transaction)
			else
				ls_autonumber = lb_sequences.f_create_autonumber_ex(ldb_seq_id, gd_session_date, rt_transaction)
	
			end if
		else
			if ls_seq_reset_colname = '' or isnull(ls_seq_reset_colname) then
				gf_messagebox('m.c_dwsetup_initial.f_set_autonumber.01','Thông báo','Chưa cài đặt cột ngày tạo số tự động cho cách đánh số:@'+&
										lb_sequences.is_seq_code + '-' + lb_sequences.is_seq_name, 'exclamation','ok',1)
				return ''
			end if		
			
			la_current_reset_data = gd_session_date

			if lb_sequences.is_reset_type = 'structure' then
				ls_autonumber = lb_sequences.f_create_autonumber_ex(string(la_current_reset_data), rt_transaction)			
			else
				ls_autonumber = lb_sequences.f_create_autonumber_ex(date(la_current_reset_data), rt_transaction)
			end if
		end if			

else
	return ''
end if

return  ls_autonumber

end function

public function long f_init_ids_setup_dw_ex (double vdb_branch, string vs_objname, ref t_transaction rt_transaction);any		laa_value[]

if isvalid(ids_setup_dw) then
	ids_setup_dw.setfilter( "") 
	ids_setup_dw.filter( )
	if ids_setup_dw.rowcount() > 0 then
		is_receive_column = ''
		is_return_column = ''
		return 1
	else
		ids_setup_dw.dataobject = 'ds_setup_dw'
	end if
else
	ids_setup_dw = create t_ds_db
	ids_setup_dw.dataobject = 'ds_setup_dw'
end if
is_receive_column = ''
is_return_column = ''

laa_value[1] = '='+upper(vs_objname)
laa_value[2] = gi_user_comp_id
laa_value[3] = vdb_branch
ids_setup_dw.f_add_where('object;company_id;branch_id;',laa_value[])
ids_setup_dw.settransobject (rt_transaction)
return ids_setup_dw.retrieve()

end function

public function integer f_get_initvalue (string vs_dwo, string vs_colname, double vdb_branch_id, ref any ra_value);/*******************************************************
Khởi tạo giá trị mặc định khi thêm dòng mới cho DW
-------------------------------------------------------------------------------------------------
Tham số:   	 - vdw_handle: DW đang thêm dòng mới
           		 - vl_row: số dòng của record thêm mới
-------------------------------------------------------------------------------------------------
Return:      	 - 1 khởi tạo thành công
				 - 0: không có giá trị mặc định
				 - Err: -1
===========================================*/
string		ls_value,ls_findStr, ls_coltype, ls_init_value_criteria_col
long		ll_row

t_ds_db				lds_tmp

//-- kiểm tra biến vdw_handle --//
if vs_dwo = '' or isnull(vs_dwo) then return 0
if vs_colname = '' or isnull(vs_colname) then return 0
if vdb_branch_id = 0 or isnull(vdb_branch_id) then return 0

ls_findStr = "DWOBJECT = '"+ left(vs_dwo,len(vs_dwo)-5)+"' AND dwcolumn ='"+vs_colname+"' AND branch_id = "+string(vdb_branch_id ) 
ll_row = ids_setup_dw.find(ls_findStr, 1 ,ids_setup_dw.rowcount( ) )

if ll_row > 0 then
	ls_value = ids_setup_dw.getitemstring( ll_row, 'init_value')	
	ls_init_value_criteria_col = this.ids_setup_dw.getitemstring(ll_row, 'INIT_VALUE_CRITERIA_COL')		
	if ls_init_value_criteria_col ='' or isnull(ls_init_value_criteria_col) then
		lds_tmp = create t_ds_db
		lds_tmp.dataobject = vs_dwo
		ls_coltype = lds_tmp.describe(vs_colname+'.coltype' )
		if left(ls_coltype,5) = 'char(' then
			ra_value = ls_value
		elseif left(ls_coltype,5) = 'numbe' then
			ra_value = double(ls_value)
		elseif left(ls_coltype,5) = 'datet' then
			ra_value = date(ls_value)
		end if
		return 1
	else
		return 0
	end if
else
	return 0
end if

end function

public function boolean f_is_duplicated_data_ex (t_dw_mpl vdw_handle, long vl_row, double vdb_branch);any			las_args[]
string			ls_unique_cols, lsa_unique_cols[] , ls_sqlnowhere, ls_where, ls_data, ls_coltype, ls_rtn, ls_data_4msg, ls_dbname, ls_dwo,ls_update_table
string			ls_uniqueCol_independence[], ls_data_origin, lsa_empty[], ls_sqlnowhere_origin, ls_dbtable, ls_dbcol
long			ll_row_found
int				li_cnt, li_idx, li_cnt_independence, li_idx2, li_duplicated
boolean		lb_modified, lb_not_origin
c_string				lc_string
t_ds_db				lds_check
c_sql					lc_sql
c_dwservice			lc_dwservice
s_w_main			lw_display
s_object_display	lod_handle
b_obj_instantiate	lobj_ins

ls_dwo = left(vdw_handle.dataobject, len(vdw_handle.dataobject) - 5)
ll_row_found = this.ids_setup_dw.find("dwobject = '"+ls_dwo + "' AND not isnull(unique_column)" ,1, ids_setup_dw.rowcount( ))
vdw_handle.dynamic f_getparentwindow(lw_display)
lod_handle = lw_display.dynamic f_get_obj_handling()

if ll_row_found = 0 then
	return false
else
	
//	lod_handle.f_get_dw_retrieve_args( vdw_handle, las_args[])
//	lds_check = create t_ds_db
//	lds_check.dataobject = vdw_handle.dataobject
//	lds_check.f_getcurrentsql(ls_sqlnowhere_origin , ls_where)

	ls_where =''
	DO 
		ls_unique_cols = this.ids_setup_dw.getitemstring(ll_row_found, 'unique_column')
		li_cnt_independence = lc_string.f_stringtoarray( ls_unique_cols, '|', ls_uniqueCol_independence[])  //-- đk HOẶC --//
		if li_cnt_independence = 1 then
			li_cnt = lc_string.f_stringtoarray( ls_unique_cols, ';', lsa_unique_cols[])  //-- đk VÀ --//
			FOR li_idx = 1 to li_cnt 
				ls_update_table = vdw_handle.describe( lsa_unique_cols[li_idx]+'.dbname')
				ls_dbcol = mid(ls_update_table, pos(ls_update_table,'.') +1)	
				if  li_idx = 1 then
					ls_dbtable = left(ls_update_table, pos(ls_update_table,'.') -1)					
				else
					if ls_dbtable <> left(ls_update_table, pos(ls_update_table,'.') -1) then return false  //-- Không kiểm tra 2 field ở 2 table khác nhau --//
				end if
				
				if vdw_handle.getitemstatus(vl_row, lsa_unique_cols[li_idx],primary!) = datamodified! OR vdw_handle.getitemstatus(vl_row, 0,primary!) = newmodified! then 															
					lb_modified = true
				end if
				ls_data = string(vdw_handle.dynamic f_getitemany(vl_row,lsa_unique_cols[li_idx]))								
				if isnull(ls_data) and li_cnt = 1 then
					 return false 
				end if
				ls_data_origin = string(vdw_handle.dynamic f_getitemany(vl_row,lsa_unique_cols[li_idx], primary!,true ))
				if isnull(ls_data_origin) then ls_data_origin =''
				
				if  ls_data_origin = ls_data and li_cnt = 1 then
					 return false 
				end if
				
				if ls_data_origin <> ls_data or vdw_handle.getitemstatus(vl_row, 0,primary!) = newmodified!  then  
					lb_not_origin = true
				end if
				
				ls_dbname =  lsa_unique_cols[li_idx]				
				lc_dwservice.f_get_build_column(vdw_handle , ls_dbname, ls_coltype)
				if ls_data_4msg <> '' then ls_data_4msg += ';'
				ls_data_4msg += upper(ls_data)
		
				if ls_where <> '' then ls_where+= ' AND '
				if left(ls_coltype,5) = 'char(' then
					if isnull(ls_data) then
						ls_where += ls_dbcol+" is null"
					else
						ls_data = upper(ls_data)
						ls_where += "UPPER("+ ls_dbcol+") ='"+ ls_data+"'"
					end if							
				elseif  left(ls_coltype,5) = 'numbe' then
					ls_where += ls_dbcol + '='+ ls_data
				end if
			NEXT		
			if lb_modified  and lb_not_origin then	
//				if lobj_ins.f_is_branch_yn_ex(lod_handle.classname(), lw_display.it_transaction ) and vdw_handle.f_is_branch() then
//					ls_dbname = 'branch_id'
//					lc_dwservice.f_get_build_column(vdw_handle , ls_dbname, ls_coltype)				
//					if ls_where <> '' then ls_where += ' AND '
//					ls_where += lc_string.f_get_expression(string( gdb_branch ), ls_coltype,ls_dbname, 'build where')
//				end if
				if vdb_branch > 0 then
					if ls_where <> '' then ls_where += ' AND '
					ls_where += "branch_id =" + string(vdb_branch)
				end if
				
				li_duplicated = lw_display.it_transaction.f_is_duplicated( ls_dbtable, ls_where)
				if li_duplicated > 0 then
					
					gf_messagebox('m.c_dwsetup_initial.f_is_duplicated_data_ex.01','Thông báo','Dữ liệu sau bị trùng lắp: @'+ls_data_4msg,'exclamation','ok',1)
					return true
				end if
			end if			
		elseif li_cnt_independence > 1 then
			/*
			FOR li_idx = 1 to li_cnt_independence
				ls_where =''
				ls_data_4msg = ''
				lb_modified = false
				lb_not_origin = false
				 lsa_unique_cols[] = lsa_empty[]
				li_cnt = lc_string.f_stringtoarray( ls_uniqueCol_independence[li_idx], ';', lsa_unique_cols[])
				FOR li_idx2 = 1 to li_cnt
					if vdw_handle.getitemstatus(vl_row, lsa_unique_cols[li_idx2],primary!) = datamodified! &
						OR vdw_handle.getitemstatus(vl_row, 0,primary!) = newmodified! then lb_modified = true
					ls_data = string(vdw_handle.dynamic f_getitemany(vl_row,lsa_unique_cols[li_idx2]))
					if isnull(ls_data) and li_cnt = 1 then
						 lb_modified = false 
						 exit
					end if					
					ls_data_origin = string(vdw_handle.dynamic f_getitemany(vl_row,lsa_unique_cols[li_idx2], primary!,true ))
					if ls_data_origin <> ls_data or  vdw_handle.getitemstatus(vl_row, 0,primary!) = newmodified!  then  lb_not_origin = true
					
					ls_dbname =  lsa_unique_cols[li_idx2]					
					lc_dwservice.f_get_build_column(vdw_handle , ls_dbname, ls_coltype)					
					if ls_data_4msg <> '' then ls_data_4msg += ';'
					ls_data_4msg += upper(ls_data)
					if isnull(ls_data) then
						ls_data = '()'
					else
						if left(ls_coltype,4) = 'char' then ls_data = '='+ upper(ls_data)
					end if
					if ls_where <> '' then ls_where+= ' AND '
					ls_dbname = 'UPPER('+ls_dbname+')'
					ls_where += lc_string.f_get_expression(ls_data, ls_coltype,ls_dbname, 'build where')
				NEXT			
				if lb_modified and lb_not_origin then	
					if lobj_ins.f_is_branch_yn(lod_handle.classname()) then
						ls_dbname = 'branch_id'
						lc_dwservice.f_get_build_column(vdw_handle , ls_dbname, ls_coltype)		
						if ls_where <> '' then ls_where+= ' AND '
						ls_where += lc_string.f_get_expression(string( gdb_branch ), ls_coltype,ls_dbname, 'build where')
					end if				
					
					ls_update_table=lds_check.describe( "DataWindow.Table.UpdateTable")
					ls_data='='+right(lod_handle.classname(),len(lod_handle.classname())-2)
					if  UPPER(ls_update_table)='OBJECT' then
						ls_dbname='OBJECT_REF_TABLE'
						ls_data = upper(ls_data)
					elseif UPPER(ls_update_table)='DOCUMENT' then
						ls_dbname='DOC_TYPE'
						ls_data =  upper(ls_data)
					ELSE
						ls_dbname=''
					end if
					IF ls_dbname<>'' THEN
						lc_dwservice.f_get_build_column(vdw_handle , ls_dbname, ls_coltype)
						ls_dbname = 'UPPER('+ls_dbname+')'
						if ls_where <> '' then ls_where+= ' AND '
						ls_where += lc_string.f_get_expression(ls_data, ls_coltype,ls_dbname, 'build where')
					END IF
					ls_sqlnowhere = ls_sqlnowhere_origin
					lc_sql.f_addtowhereclause(ls_sqlnowhere , ls_where, ' AND ')
						
					ls_rtn = lds_check.modify(  'Datawindow.Table.Select= "' + ls_sqlnowhere +'"')
					if ls_rtn = '' then
						//-- đóng lại bởi Long, vì bắt trùng dữ liệu không cần build where branch --//
						//lds_check.f_addwhereclause_of_company(lod_handle )
						//-- mở rộng cho người dùng có thể chọn bắt trùng theo branch hoặc không --//
						lds_check.settransobject( lw_display.it_transaction)
						lds_check.f_set_retrieve_args( las_args)
						li_cnt = lds_check.event e_retrieve( )
						if li_cnt > 0 then
							gf_messagebox('m.c_dwsetup_initial.f_is_duplicated_data.01','Thông báo','Dữ liệu sau bị trùng lắp: @'+ls_data_4msg,'exclamation','ok',1)
							return true
						elseif li_cnt < 0 then
							gf_messagebox('m.c_dwsetup_initial.f_is_duplicated_data.02','Thông báo','Không retrieve được dữ liệu, c_dwsetup_initial.f_is_duplicated_data:line 35','exclamation','ok',1)
							return true
						end if
					else
						gf_messagebox('m.c_dwsetup_initial.f_is_duplicated_data.03','Thông báo','Không modify được DW, c_dwsetup_initial.f_is_duplicated_data:line 31','exclamation','ok',1)
						return true
					end if
				end if				
			NEXT
			*/
		end if
		
		ll_row_found = this.ids_setup_dw.find("dwobject = '"+ls_dwo+ "' AND not isnull(unique_column)" ,ll_row_found + 1, ids_setup_dw.rowcount( )+1)
	LOOP while ll_row_found > 0
	return false
end if



end function

on c_dwsetup_initial.create
call super::create
end on

on c_dwsetup_initial.destroy
call super::destroy
end on

event destructor;call super::destructor;
if isvalid(ids_setup_dw) then destroy ids_setup_dw
end event

