$PBExportHeader$t_dw_mpl.sru
$PBExportComments$Datawindow manipulate data, inherited from t_dw
forward
global type t_dw_mpl from t_dw
end type
end forward

global type t_dw_mpl from t_dw
integer width = 891
integer height = 684
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = styleshadowbox!
event type long e_insertrow ( )
event type integer e_preinsertrow ( )
event type long e_postinsertrow ( long al_row )
event type integer e_deleterow ( long al_row )
event type integer e_predeleterow ( long vl_row )
event type long e_addrow ( )
event type integer e_cancel ( )
event type integer e_modifyrow ( )
event type integer e_premodifyrow ( )
event type integer e_itemchanged ( long row,  dwobject dwo,  ref string data )
event type integer e_delete ( )
event type integer e_save ( )
event type integer e_postdelete ( long vl_delete_row )
event e_postrefresh ( long vl_cur_rowid )
event type integer e_query ( )
event type integer e_execquery ( )
event type integer e_postcancel ( )
event type integer e_preretrieve ( )
event type integer e_precancel ( )
event type integer e_attach ( )
event type boolean e_check_excute_itemchange ( string vs_receipt_col,  c_dwservice vstr_dwservice )
event type integer e_display_actionbutton ( )
event type integer e_postmodifyrow ( )
event type integer e_presave ( )
event type integer e_postsave ( )
event type integer e_resetupdate ( )
event type integer e_rollback_save ( )
event type integer e_rollback_modify ( )
event type integer e_rollback_insert ( long vl_row )
event type integer e_postretrieve ( long vl_rowcount )
event type integer e_resetadding ( )
event type integer e_popup_data ( string vs_colname,  string vs_objname )
event type string e_doc_trace ( )
event type integer e_delete_all ( )
event e_dwclosedropdown pbm_dwclosedropdown
event type integer e_itemchanged_ex ( long row,  string colname,  ref string data )
event type long e_addrow_ex ( )
event type integer e_resetupdate_del ( )
event type integer e_autosave ( )
event type integer e_preautosave ( )
event type integer e_postautosave ( )
end type
global t_dw_mpl t_dw_mpl

type prototypes

end prototypes

type variables
string		is_dwo_source, is_col_source, is_col_target, is_ref_table_field, is_filter_type
any		a_ref_data[]
boolean  ib_itemchanged_all_row, ib_excel_copying, ib_accept_data, ib_uprow_copy, ib_keynull


protected:
any 		ia_retrieve_arg[]

string 	ias_master_totalcol[], ias_detail_totalcol[]
string 	ias_master_keycol[], ias_detail_keycol[]
string 	is_textprev
string		is_dwo_grid, is_dwo_form
double	idb_upd_ID[], idb_insert_ID[]
double	idb_rule_id[]
boolean	ib_grid_n_form

s_str_criteria_rec		is_str_criteria_rec[]

end variables

forward prototypes
public function integer f_set_criteria_retreive ()
public function integer f_chk_ora_dberror (long vl_err_code)
public function string f_chk_required_data ()
public function integer f_upd_lastmdf_by ()
public subroutine f_set_dwdetail (ref t_dw_mpl rdw_master, string vs_keycol)
public function integer f_reset ()
public function integer f_setredraw (boolean ab_switch)
public function t_dw_mpl f_getdwmaster ()
public function integer f_enable (boolean ab_switch)
public function integer f_accepttext ()
public function string f_get_pkcol ()
public function integer f_insertrow ()
public subroutine f_set_dwdetail (ref t_dw_mpl rdw_master)
public function integer f_get_detail_keycol (ref string rs_key[])
public function integer f_get_master_keycol (ref string rs_key[])
public subroutine f_set_dwdetail (ref t_dw_mpl rdw_master, string vs_master_keycol, string vs_detail_keycol)
public subroutine f_set_dwdetail (ref t_dw_mpl rdw_master, string vs_master_keycol, string vs_detail_keycol, boolean vb_cascade_del)
public subroutine f_set_dwdetail (ref t_dw_mpl rdw_master, string vs_keycol, boolean vb_cascade_del)
public subroutine f_set_total (ref t_dw_mpl rdw_total, string vs_master_totalcol, string vs_detail_totalcol)
public function integer f_enter_focus (t_dw_mpl vdw_focus)
public function integer f_enter_focus (t_dw_mpl vdw_focus, boolean vb_lastrow)
public function boolean f_check_struct_seq (string as_dataobject, string as_colname, long al_struct_id, string as_segment)
public function integer f_check_item_data (string vs_data, integer vi_dwdatatype, integer vi_ref_id, string vs_receipt_col, string vs_retrieve_col, string vs_column_nm)
public function integer f_upd_lastmdf_by (long vl_row)
public function integer f_upd_created_by (long vl_row)
public function integer f_set_sort ()
public function integer f_check_limit (string vs_object_name, string vs_column_name, string vs_data)
public function integer f_enter_focus (string vs_colname, ref tab rtab_goto)
public function integer f_buildrecwhereclause (t_ds_db vds_criteria, ref string as_where)
public function integer f_buildrecsql (ref string rs_recsql)
public function boolean f_check_foreign_key (string as_table_name, string as_id_colume_name, any aa_id_value)
protected function integer f_openwindow (string vs_open_window, string vs_receipt_col[], any vs_values_col_fillter[])
public function integer f_get_argument_list (ref string as_name[], ref string as_type[], t_dw_mpl adw_requestor)
protected function integer f_openreport (string vs_open_window, any lsa_values_col_retrieve[], string vs_datawindow_report, string vs_receipt_col[])
public function string f_get_datacolumn_name (string as_columnname, string as_receipt_col, string as_return_col)
public subroutine f_modify (t_dw_mpl at_dw_mpl, string as_columnname, string as_dataobject, string as_display_col)
public function integer f_check_item_data (string vs_data, integer vi_dwdatatype, integer vi_ref_id, string vs_receipt_col, string vs_retrieve_col, string vs_column_nm, string vs_value_dep, string vs_column_dep)
private function integer f_check_valueset (string vs_data, ref c_dwservice vc_dwservice, integer vi_index, string vs_column_value, string vs_column_search)
public function integer f_select (string vs_data, integer vi_dwdatatype, integer vi_ref_id, string vs_receipt_col, string vs_retrieve_col, string vs_not_excute_itemchage_yn, string vs_insert_struct_yn)
public function integer f_upd_track_info ()
public function integer f_setfocus ()
public subroutine f_set_dwmaster (ref t_dw_mpl rdw_detail, boolean vb_cascade_del, string vs_master_keycol, string vs_detail_keycol)
public subroutine f_set_idw_master (datawindow vdw_master)
public function integer f_getdwdetails (ref datawindow rdw_details[])
public function long f_retrieve_detail ()
public function long f_reset_detail ()
public subroutine f_set_ib_detail (boolean vb_detail)
public subroutine f_set_master_keycol (string vas_keycol[])
public subroutine f_set_detail_keycol (string vas_keycol[])
public function boolean f_get_ib_master ()
public function boolean f_get_ib_update ()
public function boolean f_get_ib_delete ()
public function boolean f_get_ib_query ()
public function boolean f_get_ib_editing ()
public function integer f_set_retrieve_args (any va_args[])
public function boolean f_is_company ()
public function boolean f_is_branch ()
protected function integer f_buildwhereclause_of_masterkey (ref string as_where)
public function boolean f_get_ib_detail ()
protected function integer f_buildwhereclause_of_masterkey (ref datawindow rdw_master, ref datawindow rdw_detail, ref string as_where, string vas_master_keycol[], string vas_detail_keycol[])
protected function integer f_get_masterkeys (ref any va_keyvalues[], ref string vs_keydbnames[], ref string vs_keycoltypes[])
public function integer f_send_message_to_object (ref datawindow vdw_focus, long vl_currentrow, string vs_colname, string vs_editdata, string vs_message)
public function boolean f_get_ib_cascade_del ()
public function integer f_set_ib_ref_table_yn (boolean vb_ref_table_yn)
public function boolean f_get_ib_ref_table_yn ()
public function integer f_set_ref_table_field (string vs_ref_table_field)
public function integer f_set_ib_master (boolean vb_master)
public function integer f_set_ib_cascade_del (boolean vb_cascade_del)
public function string f_get_ref_table_field ()
public function boolean f_get_ib_insert ()
public function boolean f_get_ib_displaying ()
public function integer f_setfocus (ref datawindow rdw_focus)
public function integer f_set_ib_inserting (boolean vb_inserting)
public function integer f_send_message_to_object (ref datawindow vdw_focus, long vl_currentrow, long vl_newrow, string vs_message)
public subroutine f_set_ib_displaying (boolean vb_displaying)
public subroutine f_set_dwmaster (ref datawindow radw_detail[], boolean vb_cascade_del, string vs_master_keycol[], string vs_detail_keycol[])
protected function integer f_groupcount ()
public function integer f_create_navigate_bttn ()
public function integer f_repaint_navigate_bttn (string vs_button)
public function integer f_set_ib_insert (boolean vb_insert)
public function integer f_set_ib_delete (boolean vb_delete)
public function integer f_set_ib_update (boolean vb_update)
public function integer f_set_ib_query (boolean vb_query)
public function integer f_set_ib_print (boolean vb_print)
public function integer f_set_ib_excel (boolean vb_excel)
public function string f_buildwhereclause ()
public function string f_get_company_colname ()
public function string f_get_branch_colname ()
public function integer f_change_2_edit ()
public function integer f_change_2_grid ()
public function integer f_change_2_form ()
public function integer f_close_edit ()
public subroutine f_set_ib_shared (boolean vb_shared)
public function integer f_set_ib_editing (boolean vb_editing)
public function boolean f_get_ib_shared ()
public function integer f_set_ib_saving (boolean vb_saving)
public function integer f_set_dwmaster (ref datawindow radw_detail[])
public function long f_filter_detail ()
public function integer f_getdwshared (ref datawindow ldw_shared[])
public function integer f_set_dwo_grid (string vs_dwo_grid)
public function integer f_set_dwo_form (string vs_dwo_form)
public function datawindow f_get_idw_master ()
public function integer f_find_dwdetail (ref datawindow rdw_found, string vs_dwo)
public function boolean f_get_ib_traceable ()
public function integer f_set_ib_traceable (boolean vb_traceable)
public function boolean f_get_ib_focus_master ()
public function integer f_set_ib_focus_master (boolean vb_focus_master)
public function integer f_create_ctrl_text_of_pic (integer vi_idx_btn, string vs_ctrl_pic_name)
public function integer f_visible_ctrl_text_of_pic ()
public function integer f_enable_ctrl_text_of_pic (integer vs_indx)
public function integer f_change_color_ctrl_of_pic (string vs_ctrl_name)
public function integer f_update_pic (blob vblb_picture, string vs_pic_name, string vs_path, long row)
public function boolean f_check_posmouse_on_pic (integer xpos, integer ypos, string vs_ctrl_pic_name)
public subroutine f_set_ib_edit_changing (boolean vb_edit_changing)
public function integer f_get_valueset (ref powerobject rpo_dwsetup, string vs_data)
public function string f_get_autocomplete_string (string vs_colname, string vs_searchtext, string vs_dddw_ddlb)
public function boolean f_is_lang ()
public function integer f_rebuild_select_column (string vs_columns)
public function integer f_calendar (string vs_colname, string vs_coltype)
public function integer f_load_pic (long vl_row)
public function integer f_get_criteria_record (s_str_criteria_rec rs_str_criteria_rec[])
public function integer f_set_criteria_record (s_str_criteria_rec vs_str_criteria_rec[])
public function integer f_set_rec_security ()
public function integer f_set_ib_dataerror (boolean vb_dataerror)
public function integer f_set_dwshare (ref datawindow rdw_share[])
public function integer f_set_rule_id_rec (double vdb_rule_id[])
public function integer f_get_rule_id_rec (ref double rdb_rule_id[])
public subroutine f_set_ib_dummy_row_yn (boolean vb_dummy_row_yn)
public function integer f_destroy_dddw (string vs_colname)
public function integer f_set_ref_data ()
private function integer f_check_valueset (ref string rs_data, string vs_colname, datawindowchild vdwc_handle)
public function long f_select_detail (boolean vb_selected)
public subroutine f_set_ib_relation_1_1 (boolean vb_relation_1_1)
public function boolean f_get_ib_relation_1_1 ()
public function integer f_get_data_pic (s_object_display vobj_handle, ref string rs_pic_ref_table, ref string rs_pic_ref_field, ref string rs_pic_ref_colname, string vs_colname)
public function string f_get_path_pic (string vs_pic_ref_table, string vs_pic_ref_colname, double vdb_ref_id, t_transaction vt_transaction)
public function boolean f_get_ib_delete (s_str_policy_attr vstr_security_attr, s_str_policy_attr vstr_rule_attr)
public function boolean f_get_ib_insert (s_str_policy_attr vstr_security_attr, s_str_policy_attr vstr_rule_attr)
public function boolean f_get_ib_query (s_str_policy_attr vstr_security_attr, s_str_policy_attr vstr_rule_attr)
public function boolean f_get_ib_update (s_str_policy_attr vstr_security_attr, s_str_policy_attr vstr_rule_attr)
public subroutine f_set_ib_keyboardlocked (boolean vb_keyboardlocked)
public function boolean f_get_ib_keyboardlocked ()
public function string f_buildwhereclause_of_company ()
public subroutine f_openmap (string vs_bt_name)
public function boolean f_get_ib_saving ()
public subroutine f_set_ib_dropdowning (boolean vb_dropdowning)
public function integer f_setitem_returndata (string vs_colname, long vl_row)
public function integer f_update_column_4_all_row (string vs_colname, long vl_currentrow, string vs_data)
protected function integer f_buildwhereclause_4_dwdetail (ref string as_where)
public function long f_retrieve_detail_old ()
public function string f_get_sql_join_master (string vs_dwo_detail)
public function string f_get_detail_filterstring (t_dw_mpl vdw_detail, boolean vb_doc_filter)
public function integer f_setnull_columns (string vas_colname[], long vl_row)
public function boolean f_is_sob ()
public function string f_buildwhereclause_of_sob ()
public function integer f_send_message_to_object (ref datawindow rdw_focus, ref datawindow vdw_source, long vl_currentrow, dwobject dwo, string vs_message)
public function integer f_set_target_data ()
public function integer f_update_column_4_all_row (string vs_colname, long vl_currentrow)
public function integer f_setitem_returndata (string vs_colname, long vl_row, boolean vb_check_upcopy)
public function integer f_get_doc_trace (ref string rs_where, ref string rs_sort)
public function boolean f_get_ib_dummy_row ()
public subroutine f_set_ib_valuesetting (boolean vb_valuesetting)
public function integer f_change_dwo (string vs_dwo)
public function integer f_open_drilldown (string vs_colname, long vl_row)
public function integer f_set_ib_grid_n_form (boolean vb_grid_n_form)
public function boolean f_get_ib_dropdowning ()
public function integer f_checkin_gutter_detail (string vs_data)
public function integer f_set_master_detail_ref_table (long vl_row)
public function integer f_buildwhereclause (ref string rs_where)
public subroutine f_set_ib_dummy_row (boolean vb_dummy_row)
public function integer f_restore_original_data (string vas_colname[], long vl_row)
public function string f_get_autocomplete_string (string vs_colname, string vs_searchtext, string vs_dddw_ddlb, ref datawindowchild rdwc_dropdown)
public function integer f_setitem_returndata (string vs_colname, long vl_row, boolean vb_check_upcopy, boolean vb_settext_yn)
public function integer f_update_pic (blob vblb_picture, string vs_ctrl_pic_name, string vs_path, string vs_filetype, long row)
public function string f_get_path_pic (string vs_pic_ref_table, string vs_pic_ref_field, string vs_pic_ref_colname, double vdb_ref_id, t_transaction vt_transaction)
public function integer f_remove_pic_file (string vs_pic_ref_table, string vs_pic_ref_field, string vs_pic_ref_colname, double vdb_ref_id)
private function integer f_delete_detail (ref datawindow rdw_detail, string vs_deletesql)
public function integer f_set_ib_deleting (boolean vb_delete)
public function string f_get_autocomplete_string (string vs_colname, string vs_searchtext, string vs_dddw_ddlb, ref datawindowchild rdwc_dropdown, ref long rl_found_row)
public function integer f_set_rec_security_ex (ref t_transaction rt_transaction)
public function string f_get_autocomplete_string_ex (string vs_colname, string vs_searchtext, string vs_dddw_ddlb)
public function string f_get_autocomplete_string_ex (string vs_colname, string vs_searchtext, string vs_dddw_ddlb, ref datawindowchild rdwc_dropdown)
public function string f_get_autocomplete_string_ex (string vs_colname, string vs_searchtext, string vs_dddw_ddlb, ref datawindowchild rdwc_dropdown, ref long rl_found_row)
public function integer f_calendar_ex (string vs_colname, string vs_coltype)
public function integer f_close_edit_ex ()
public function boolean f_get_ib_inserting ()
public function boolean f_get_ib_excel_copying ()
public function integer f_update_pic_ex (blob vblb_picture, string vs_ctrl_pic_name, string vs_path, string vs_filetype, long row)
public function integer f_remove_pic_file_ex (string vs_pic_ref_table, string vs_pic_ref_field, string vs_pic_ref_colname, double vdb_ref_id)
end prototypes

event type long e_insertrow();/******************************************************
Chức năng: chèn record, chỉ thực hiện cho dw detail
----------------------------------------------------------------------------------
Return	-1: error
			0: no action
			1: success
==========================================*/	
long	ll_currow, ll_rc, ll_inst_row
string ls_first_col


if not this.f_isgrid( ) then return -1

//-- Trước khi thêm mới: reset dwdetail của detail, set editing cho cac dw liên kết --//
If This.Event e_PreInsertRow() = -1 Then Return 0

// Get current row
ll_currow = This.GetRow()
If ll_currow < 0 Then ll_currow = 0

// Insert row.
ib_inserting = true
ib_editing = true


ll_inst_row = This.InsertRow (ll_currow)
if This.rowcount() =1 then
	ll_rc = this.setrow( 1)
else
	ll_rc = this.ScrollToRow(ll_inst_row)
end if
if ll_rc = -1 then
	this.event e_rollback_insert(ll_inst_row)
	return -1
end if


ib_inserting = false
//-- Sau khi thêm record: gán các giá trị mặc đinh, ID và thông báo cho Object --//
ll_rc = This.Event e_PostInsertRow(ll_inst_row)

if ll_rc = -1 then
	this.event e_rollback_insert(ll_inst_row)
end if

//-- Set ngôn ngữ --//
t_w_mdi.ids_lang_text.f_set_dw_lang(this)

Return ll_rc



end event

event type integer e_preinsertrow();/*===========================================
Dùng để viết các chức năng trước khi add 1 dòng mới
	- reset các dw detail nếu có
	- Set trạng thái edit cho các dw liên kết
------------------------------------------------------------------------------
return : 1 - thành công
		: 0 - không làm gì cả
		: -1 lỗi
=============================================*/
int						li_idx
datawindow			ldw_handling


//-- chuyển trạng thái edit cùa cac dw master --//
if this.ib_isdetail then
	if idw_master.getrow( ) = 0 then
		if not this.ib_dummy_row then
			messagebox('Loi', 'insert detail chua co master')
			return -1
		end if
	end if
end if

//-- Thông báo object --//
if not this.ib_dummy_row then
	ldw_handling = this
	return this.f_send_message_to_object( ldw_handling, 'e_preinsertrow')
end if

//-- set ngôn ngữ cho dwc --//

return 0

end event

event type long e_postinsertrow(long al_row);/**************************************************************
Chức năng:
	- set ID cho record mới
	- Gán các giá trị mặc định của fields theo setup
	- Thống báo cho object
---------------------------------------------------------------------------
Tham số: al_row dòng đang được thêm mới
=======================================================*/

int							li_idx, li_cnt
long						ll_master_row, ll_detail_row, li_rtn
double					ldb_ID	
string						las_master_keycol[], las_detail_keycol[], ls_ref_table, ls_first_col, ls_ref_field
any						la_data
s_w_main				lw_parent
s_object_display		lpo_handling
t_dw_mpl				ldw_handling, ldw_master,ldw_detail
c_string					lc_string

//-- set edit property --//
//this.f_set_editable_property( true)

this.f_getparentwindow( lw_parent)
lpo_handling = lw_parent.dynamic f_get_obj_handling()

//-- tạo ID của record --//
if this.describe( 'ID.coltype') = 'number' then
	ldb_ID	= lpo_handling.dynamic f_create_id_ex(lw_parent.it_transaction )
	if ldb_ID < 1 then return -1
	this.setitem( al_row, 'ID', ldb_ID)	
end if
//-- set auto number : không phụ thuộc ngày --//
 lpo_handling.idwsetup_initial.f_set_autonumber_ex( this, al_row, lw_parent.it_transaction)
 
//-- company --//
if this.f_is_company( ) then
	this.setitem( al_row, 'company_id',gi_user_comp_id)
end if

//-- branch --//
if this.f_is_branch( ) then
	this.setitem( al_row, 'branch_id',gdb_branch)
end if

//-- sob --//
if this.f_is_sob( ) then
	this.setitem( al_row, 'sob',gs_sob)
end if

//-- Cập nhật dữ liệu DW khác vào: Chỉ cập nhật khi dw_focus có khai báo s_col_target --//
if al_row = 1 then
	if is_dwo_source<>'' and is_col_source<>'' and is_col_target <> '' then
		if this.f_set_target_data( ) = -1 then return -1
	end if	
end if

//-- set master cho detail va ref_field --//
if this.f_set_master_detail_ref_table( al_row) = -1 then return -1

//-- set edit property : trước khi tạo giá trị mặc định --//
if not this.ib_dummy_row  then this.f_set_editable_property( true)

//-- tạo các giá trị mặc định --//
//-- chạy sau set property để trường hợp khởi tạo valueset chạy đúng cho dòng đầu tiên(Long)--//
li_cnt = lpo_handling.idwsetup_initial.f_initvalue(this, al_row)
if li_cnt = -1 then return -1


//-- reset các dwdetail --//
//--if this.ib_ismaster and upperbound(iadw_detail[]) > 0 and not lpo_handling.ib_copying then--//
if this.ib_ismaster and upperbound(iadw_detail[]) > 0 then
	if lpo_handling.f_is_changed_dwo_4edit( ) then
		if this.f_reset_detail( ) = -1 then return -1
	else
		if this.f_filter_detail( ) = -1 then return -1
	end if
end if

//-- chuyển trạng thái edit cùa cac dw master --//
if this.ib_isdetail then
	if not this.ib_dummy_row  then
		this.idw_master.triggerevent("e_modifyrow")
	end if
end if

//-- chuyển trạng thái edit cùa cac dw detail --//
if this.ib_ismaster and not this.ib_dummy_row then
	FOR li_idx = 1 to upperbound(this.iadw_detail)
		this.iadw_detail[li_idx].triggerevent("e_modifyrow")
	NEXT	
end if

//-- chuyển trạng thái edit cùa cac dw share --//
if this.ib_ismaster and upperbound(this.iadw_shared) > 0 then
	FOR li_idx = 1 to upperbound(iadw_shared)
		this.iadw_shared[li_idx].triggerevent("e_modifyrow")
	NEXT
end if


//-- copy giá trị dòng trên --//
if al_row > 1 and not lpo_handling.ib_copying then
	lpo_handling.idwsetup_initial.f_auto_copy_field(this, al_row) 
end if

//-- set edit property : sau khi tạo giá trị mặc định --//
if not this.ib_dummy_row  then this.f_set_editable_property( true)

ls_first_col = f_GetFirstColumn(true)
if ls_first_col <> '' then
	this.SetColumn(ls_first_col)
end if

//-- Thông báo object --//
ldw_handling = this
li_rtn = this.f_send_message_to_object( ldw_handling, al_row, 'e_postinsertrow')
if li_rtn = -1 then return -1


return al_row
end event

event type integer e_deleterow(long al_row);//////////////////////////////////////////////////////////
//Return	-1: error
//			0: no action
//			1: success
/////////////////////////////////////////////////////////	
integer			li_rc,li_version_no
string				ls_deleteSQL[],ls_updatetable,ls_status,ls_doc_code
t_transaction	lt_transaction
window 			lw_parent


If This.RowCount() = 0 Then Return 0
ls_updatetable = this.describe( "datawindow.table.update")
//--kiểm tra trạng thái của chứng từ--//
if upper(ls_updatetable) = 'DOCUMENT' then
	ls_status = this.getitemstring( al_row , 'status')
	ls_doc_code = this.getitemstring( al_row , 'code')
	if isnull(ls_doc_code) then ls_doc_code = ''
	if upper(ls_status) <> 'NEW' and  upper(ls_status) <> 'PLANNED' then
		gf_messagebox('m.t_dw_mpl.e_deleterow.01','Thông báo','Phiếu @: '+ls_doc_code+' không phải phiếu "MỚI" hoặc "KẾ HOẠCH" nên không được xóa','exclamation','ok',1)
		return -1
	end if
end if
if upper(ls_updatetable) = 'BOOKED_SLIP' or upper(ls_updatetable) = 'ORDERS'  then
	li_version_no = this.getitemnumber(al_row,'VERSION_NO')
	if li_version_no > 1 then
		gf_messagebox('m.t_dw_mpl.e_deleterow.01','Thông báo','Phiếu @: '+ls_doc_code+' không phải phiếu "MỚI" nên không được xóa','exclamation','ok',1)
		return -1
	end if
end if
//-- pre-delete of al_row --//
li_rc = This.Event e_PreDeleteRow(al_row) 
If li_rc <0 Then Return -1

//-- delete al_row--//
this.deleterow( al_row)

//-- li_rc là biến trả về của e_PreDeleteRow(al_row) : từ object có thể trả về 2 ( chỉ delete trên dw mà ko update database --//
return li_rc
end event

event type integer e_predeleterow(long vl_row);/*==============================================
Chức năng: xóa dữ liệu dw detail
-----------------------------------------------------------------------------
//Return	-1: error
//			0: no action
//			1: success
================================================*/	
double				ldb_masterkey_id
string					ls_coltype, ls_deleteSQL, ls_table, ls_where, las_masterkeycol[],las_detailkeycol[]
string					ls_ref_table, ls_ref_table_field,ls_delete_clause
int						li_idx1, li_idx2, li_rtn,li_rnt1
any					laa_keyvalue[]
c_string				lc_string
window				lw_parent
s_object_display		lod_handling
s_str_dwo_related	lstr_related[]
t_dw_mpl			ldw_handle

if this.rowcount( ) = 0 then return -1


//--del bảng match trước--//
this.f_getparentwindow( lw_parent)
//if isvalid(lw_parent) then
//	lod_handling = lw_parent.dynamic f_get_obj_handling()
//	li_rtn = lod_handling.f_delete_matching( this,vl_row)
//end if
if li_rtn = -1 then return -1
ls_ref_table =  this.describe( "DataWindow.Table.UpdateTable")
if this.ib_ismaster then	
	if this.ib_iscascade_del then
		FOR li_idx1 = 1 to  upperbound(this.iadw_detail)
			//-- gọi predelete_start lên object --//
			li_rtn = this.f_send_message_to_object(iadw_detail[li_idx1] ,0, 'e_predelete_start')
			//-- li_rtn = 1: không delete detai, nhưng vẫn cho phép xoá master và các detail khác --//
			if li_rtn = 1 then
				continue 
			end if			
			//-- delete detail --//
			li_rnt1 = iadw_detail[li_idx1].dynamic f_get_master_keycol(las_masterkeycol[])
			iadw_detail[li_idx1].dynamic f_get_detail_keycol(las_detailkeycol[])
			//-- kiểm tra xem có đang edit hay không--//
			if this.ib_editing then
				if li_rnt1 > 0 then
					ls_delete_clause = ''
					for li_idx2= 1 to li_rnt1
						ls_coltype = this.describe(las_masterkeycol[li_idx2]+'.coltype' )
						laa_keyvalue[li_idx2] =  this.f_getitemany( vl_row, las_masterkeycol[li_idx2])
						if isnull(laa_keyvalue[li_idx2]) then laa_keyvalue[li_idx2] = '()'
						if ls_delete_clause <> '' then ls_delete_clause += ' AND '
						ls_delete_clause += lc_string.f_get_expression(string(laa_keyvalue[li_idx2]) , ls_coltype,las_detailkeycol[li_idx2], 'filter')
					next
					ls_deleteSQL = ls_delete_clause
				end if
			else
				ls_table =  iadw_detail[li_idx1].describe( "DataWindow.Table.UpdateTable")
				if ls_table = '?' then 
					//-- gọi lên object --//
					ldw_handle = this
					return this.f_send_message_to_object(ldw_handle , vl_row, 'e_predelete')					
				end if
				ls_deleteSQL = "DELETE "+ls_table + " WHERE "		
				ls_where = ""
				if li_rnt1 > 0 then
					FOR li_idx2= 1 to li_rnt1
						ls_coltype = this.describe(las_masterkeycol[li_idx2]+'.coltype' )
						laa_keyvalue[li_idx2] =  this.f_getitemany( vl_row, las_masterkeycol[li_idx2])
						if isnull(laa_keyvalue[li_idx2]) then 
							laa_keyvalue[li_idx2] = '()'
						elseif left(ls_coltype,4) = 'char' then
							laa_keyvalue[li_idx2] = '='+string(laa_keyvalue[li_idx2])
						end if
						if ls_where <> "" then ls_where += ' AND '
						ls_where += lc_string.f_get_expression(string(laa_keyvalue[li_idx2]) , ls_coltype,las_detailkeycol[li_idx2], 'build where')
						ls_where = lc_string.f_globalreplace(ls_where , '~~', '')
					NEXT		
					ls_deleteSQL += ls_where
				else
					return -1
				end if		
			end if
			if ls_deleteSQL <> '' then li_rtn = this.f_delete_detail(this.iadw_detail[li_idx1], ls_deleteSQL)
			if li_rtn = -1 then return -1
		NEXT	
	else
		FOR li_idx1 = 1 to  upperbound(this.iadw_detail)
			if this.iadw_detail[li_idx1].rowcount() > 0 then
				gf_messagebox('m.e_predeleterow.01','Thông báo','Không thể xóa vì còn dữ liệu chi tiết liên quan','exclamation','ok',1)
				return -1
			end if
		NEXT
	end if
end if
//-- gọi lên object --//
ldw_handle = this
return this.f_send_message_to_object(ldw_handle , vl_row, 'e_predelete')

end event

event type long e_addrow();//////////////////////////////////////////////////////////
//Return	-1: error
//			0: no action
//			1: success
/////////////////////////////////////////////////////////			
long			ll_rc, ll_currow, ll_add_row
int  			li_process
string		ls_first_col


//-- Trước khi thêm mới: reset dwdetail, set editing cho cac dw liên kết --//
If This.Event e_PreInsertRow() = -1 Then
	Return -1
end if

//-- Thêm record mới --//
this.ib_inserting = true
this.ib_editing = true

li_process = integer(this.Object.DataWindow.Processing)
if li_process = 0 and this.ib_ismaster and not this.ib_isdetail then 
	ll_rc = this.rowcount( )
	if ll_rc =1 then
		if this.getitemstatus( 1, 0, primary!) <> Newmodified! then
			this.reset( )
		else
			ll_add_row =1
		end if
	end if
else
	if this.ib_relation_1_1 and this.ib_focus_master then
		ll_add_row = this.rowcount( )
	end if
end if

if ll_add_row = 0 then ll_add_row = This.InsertRow(0)
if ll_add_row = 1 then 
	ll_rc = this.setrow( 1)
else
	ll_rc = this.ScrollToRow(ll_add_row)
end if
if ll_rc = -1 then
	this.event e_rollback_insert(ll_add_row)
	return -1
end if

//ls_first_col = f_GetFirstColumn(true)
//if ls_first_col <> '' then
//	this.SetColumn(ls_first_col)
//end if


//-- Sau khi thêm record: gán các giá trị mặc đinh, ID và thông báo cho Object --//
ll_rc = This.Event e_PostInsertRow(ll_add_row)

if ll_rc = -1 then
	this.event e_rollback_insert(ll_add_row)
end if
this.ib_inserting = false
Return ll_rc

end event

event type integer e_cancel();long ll_row
Boolean lb_querymode
int li_precancel
ll_row = GetRow()
If ll_row < 1 Then Return -1
ib_cancelling = true
 
lb_querymode = inv_QueryMode.f_GetEnabled()
If lb_querymode Then 
	inv_querymode.event e_cancel()
	f_Enable(false)
	return 1
End If

li_precancel = this.event e_precancel( )

if li_precancel = -1 then return -1


This.Object.Data.Primary.current[ll_row] = This.Object.Data.Original[ll_row]


//call postcancel event
this.event e_postcancel( )
ib_cancelling = false
Return 1


end event

event type integer e_modifyrow();//////////////////////////////////////////////////////////
//Return	-1: error
//			0: no action
//			1: success
/////////////////////////////////////////////////////////	
integer				li_rc

datawindow			ldw_requester

if not ib_editing  then
	ib_editing = true
	
	//-- Allow for pre functionality --//
	li_rc = This.Event e_PreModifyRow()
	if li_rc = -1 then
		this.event e_rollback_modify( )
		return -1
	end if

	this.f_set_editable_property( true)
	//-- ẩn nút chuyển dạng form<-> lưới --//
	if this.f_get_ib_update( ) then
		if this.f_isgrid( ) then
			this.modify( "b_form.visible = no")
		else
			this.modify( "b_grid.visible = no")
		end if
	end if

	//-- post modify --//
	li_rc = This.Event e_PostModifyRow()
	if li_rc = -1 then
		this.event e_rollback_modify( )
		return -1
	end if
	
	//-- Đổi dummy row thành true row --//
	if ib_dummy_row then
		if this.getitemstatus( 1, 0, primary!) = notmodified! then
			ib_dummy_row = false
			if this.idw_master.rowcount( ) > 0 then
				this.setitemstatus( 1, 0, primary!, newmodified!)
				if this.f_set_master_detail_ref_table( 1) = -1 then return -1
			else
				this.reset( )
				this.resetupdate( )
			end if
		end if
	end if
	
	ldw_requester = this
	this.f_send_message_to_object( ldw_requester,'e_modifyrow')		
	return 1
end if

return 0
end event

event type integer e_premodifyrow();datawindow 		ldw_master

if this.ib_isdetail then
	return this.idw_master.triggerevent("e_modifyrow")
elseif this.ib_isshared then
	if this.idw_master.dynamic f_get_ib_detail() then
		ldw_master = this.idw_master.dynamic f_getdwmaster()
		return ldw_master.triggerevent("e_modifyrow")
	end if
end if

return 1
end event

event e_itemchanged;/*********************************************************************
Chức năng: kiểm tra ràng buộc dữ liệu trên cùng dw
------------------------------------------------------------
return:
	- 0 :Dữ liệu nhập ok
	- 1 : Dữ liệu nhập không hợp lệ
	- 2 : Dữ liệu nhập đã được thay đổi và setitem ok
=============================================================*/
datawindowchild	ldwc
datawindow			ldw_requester
c_string				lc_string
c_dwservice			lc_dwservice
c_dwsetup_initial	lc_dwsetup_initial
window				lw_display
s_object_display	lod_handle	
int						li_rtn, li_velueset_return, li_idx, li_chk, li_rtn_preitemchanged, li_rpt_parm_rtn
string					las_empty[], ls_coltype, ls_dwdatatype, ls_dwdatatype_str, lsa_return_cols[], lsa_receive_cols[], las_rtn_data[]
string					ls_col_curcode, ls_col_exrate,ls_col_name, ls_dwo, ls_data
any					laa_empty[], la_data, laa_rtn_data[]
double				ldb_exrate
date					ld_prior_period_date, ld_last_period_date
long					ll_row_upd
boolean				lb_valueset_receive_number

this.f_getparentwindow( lw_display)
lod_handle = lw_display.dynamic f_get_obj_handling()	
ldw_requester = this
//-- kiểm tra ràng buộc trên object trước khi setitem --//
li_rtn = this.f_send_message_to_object( ldw_requester,row,dwo.name, data, 'e_beforeitemchanged')
if li_rtn = 1 then
	if li_velueset_return = 1 then
		lod_handle.idwsetup_initial.ias_rtn_data[]  = las_empty[]
		lod_handle.idwsetup_initial.iaa_rtn_data[]  = laa_empty[]		
	end if
	this.ib_dropdowning = false
	this.ib_dataerror = true
	return 1
end if
//-- Kiểm tra ràng buộc dữ liệu với data value set --//
if not ib_valuesetting then //-- khi đang open window valueset thì bỏ qua itemchanged --//
	
	if this.ib_dropdowning then		
		ls_dwo = left(this.dataobject, len(this.dataobject) - 5)
		li_rtn = lod_handle.idwsetup_initial.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" +dwo.name+ "'" ,1, lod_handle.idwsetup_initial.ids_setup_dw.rowcount( ))	
		lod_handle.idwsetup_initial.is_return_column = lod_handle.idwsetup_initial.ids_setup_dw.getitemstring( li_rtn, 'RETURN_COLUMN')	
		lod_handle.idwsetup_initial.is_receive_column = lod_handle.idwsetup_initial.ids_setup_dw.getitemstring( li_rtn, 'RECEIVE_COLUMN')		
		li_rtn = lc_string.f_stringtoarray(lod_handle.idwsetup_initial.is_return_column , ';', lsa_return_cols[])
		if li_rtn = 0 or isnull(li_rtn) then //-- Trường hợp không cài đặt return_col (report)
			this.getchild( dwo.name, ldwc)						
			la_data = lc_dwservice.f_getitemany_dwc( ldwc, ldwc.getrow() ,'CODE')
			if not isnull(la_data) then
				lc_dwsetup_initial.f_get_report_date(la_data,ld_prior_period_date, ld_last_period_date)							
				li_rtn = lc_string.f_stringtoarray(lod_handle.idwsetup_initial.is_receive_column , ';', lsa_receive_cols[])
				if li_rtn = 0 then return 0 //-- trường hợp popup input data--//
				this.setitem( row, lsa_receive_cols[2],ld_prior_period_date)
				this.setitem( row, lsa_receive_cols[3],ld_last_period_date)
				li_velueset_return = 2
			end if
		else		
			this.ib_dropdown_excepted = true
			return 2
		end if
	else
		ls_dwo = left(this.dataobject, len(this.dataobject) - 5)
		li_rtn = lod_handle.idwsetup_initial.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" +dwo.name+ "'" ,1, lod_handle.idwsetup_initial.ids_setup_dw.rowcount( ))	
		lod_handle.idwsetup_initial.is_return_column = lod_handle.idwsetup_initial.ids_setup_dw.getitemstring( li_rtn, 'RETURN_COLUMN')	
		lod_handle.idwsetup_initial.is_receive_column = lod_handle.idwsetup_initial.ids_setup_dw.getitemstring( li_rtn, 'RECEIVE_COLUMN')
		li_rtn = lc_string.f_stringtoarray(lod_handle.idwsetup_initial.is_return_column , ';', lsa_return_cols[])
		if li_rtn = 0 or isnull(li_rtn) then //-- Trường hợp không cài đặt return_col (report)
			this.getchild( dwo.name, ldwc)						
			la_data = lc_dwservice.f_getitemany_dwc( ldwc, ldwc.getrow() ,'CODE')
			if not isnull(la_data) then
				lc_dwsetup_initial.f_get_report_date(la_data,ld_prior_period_date, ld_last_period_date)				
				li_rtn = lc_string.f_stringtoarray(lod_handle.idwsetup_initial.is_receive_column , ';', lsa_receive_cols[])
				if li_rtn = 0 then return 0 //-- trường hợp popup input data--//
				this.setitem( row, lsa_receive_cols[2],ld_prior_period_date)
				this.setitem( row, lsa_receive_cols[3],ld_last_period_date)
				li_velueset_return = 2
			end if
		else
			//-- khi edit trưc tiếp --//
			ls_coltype = this.describe(dwo.name +'.coltype' )
			li_rtn = lod_handle.idwsetup_initial.f_get_dwdatatype_string(dwo.name , ls_coltype,this, ls_dwdatatype)
			if (ls_dwdatatype = 'dwo' or ls_dwdatatype = 'valueset') then			
	
				this.f_retrieve_dwc_ex(dwo.name )
				this.getchild( dwo.name, ldwc)
	//			if il_dwc_currentrow < 2 then
	//				il_dwc_currentrow = ldwc.getrow( )
	//			end if
				li_velueset_return = this.f_check_valueset( data, dwo.name, ldwc)
				if li_velueset_return = -1 then
					this.ib_dataerror = true
					this.ib_dropdowning = false
					return 1
				end if				
			end if		
		end if
	end if
	// gọi lên object xử lý sau khi setitem //
	
	//## gọi lên object xử lý làm tròn --//
	li_rtn_preitemchanged = this.f_send_message_to_object( ldw_requester,row,dwo.name, data, 'e_preitemchanged')
	if li_rtn_preitemchanged = 1  then 
		//-- set null --//
//		this.f_setnull_columns(lsa_receive_cols[] , row)
		return 1
	end if
	//##Kết thúc xử lý làm tròn --//
	
	//--------------------------------------------------------------------//
	//-- Xử lý chung khi có dropdown và cả khi không drodown --//
	//-------------------------------------------------------------------//
	//-- Thông báo với đối tượng quản lý khi edit trược tiếp --//
	if li_rtn_preitemchanged = 2 then 
		ls_data = string(this.f_getitemany( row, dwo.name))
	else
		ls_data = data
	end if
	//--kiểm tra tỷ giá: khi edit cột loại tiền--//
//	li_chk = lod_handle.f_get_colname_exchange_rate( this, lod_handle.idwsetup_initial.is_receive_column, ls_col_curcode, ls_col_exrate)
//	if li_chk = 1 and ls_col_curcode = dwo.name  then
//		ldb_exrate = lod_handle.f_get_exchange_rate( data, today())
//		this.setitem( row, ls_col_exrate, ldb_exrate)
//	end if		
	//-- kiểm tra sau khi đã set dữ liệu thì trên object còn làm gì nữa không --//
//	li_rtn = this.f_send_message_to_object( ldw_requester,row,dwo.name, ls_data, 'e_itemchanged')	

//	if li_rtn = 1 then
//		if li_velueset_return = 1 then
//			lod_handle.idwsetup_initial.ias_rtn_data[]  = las_empty[]
//			lod_handle.idwsetup_initial.iaa_rtn_data[]  = laa_empty[]		
//		end if
//		this.ib_dropdowning = false
//		this.ib_dataerror = true
//		return 1
//	else				
		//-- kiểm copy dòng trên --//		
		ls_dwo = left(this.dataobject, len(this.dataobject) - 5)
		ll_row_upd = lod_handle.idwsetup_initial.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" +dwo.name+ "' AND auto_copy_yn = 'Y'" ,1, lod_handle.idwsetup_initial.ids_setup_dw.rowcount( ))		
		
		if li_velueset_return = 1 then//-- trường hợp valueset --//  							
			if ll_row_upd > 0 then //-- có valueset va copy dòng trên --//
				if this.ib_dropdown_scrolling then //-- đang scroll dwc--//
					this.f_setitem_returndata( dwo.name, row)
					li_rtn = this.f_send_message_to_object( ldw_requester,row,dwo.name, ls_data, 'e_postitemchanged')	
					ib_dropdown_excepted = true
					return 0
				end if
				if row < this.rowcount( ) then
					if gf_messagebox('m.t_dw_mpl.e_itemchanged.01','Thông báo','Bạn có muốn cập nhật cho tất cả các dòng bên dưới không?','question','yesno',1) = 1 then
						this.f_update_column_4_all_row( dwo.name, row)
						ib_itemchanged_all_row = true  // bật biến cờ = true, đê báo khi gọi lên object item change --//
					else
						this.f_setitem_returndata( dwo.name, row)
					end if				
				else
					this.f_setitem_returndata( dwo.name, row)
				end if	
			else	//if this.ib_dropdowning = false then //-- có valuset nhưng ko copy dòng trên --//
				this.f_setitem_returndata( dwo.name, row)
				if this.ib_dropdown_scrolling then //-- đang scroll dwc--//
					li_rtn = this.f_send_message_to_object( ldw_requester,row,dwo.name, ls_data, 'e_postitemchanged')	
					 ib_dropdown_excepted = true
					 return 0
				end if
			end if
		elseif li_velueset_return = 0 and ll_row_upd = 0  then //khi xóa dữ liệu thì không hỏi update các dòng khác --//
			if isnull(data) or data = '' then
				this.f_setitem_returndata( dwo.name, row)
			end if
		else 
			// trường hợp không có valuset nhưng có copy dòng trên --//
			if ll_row_upd > 0 then 
				if row < this.rowcount( ) then
					if gf_messagebox('m.t_dw_mpl.e_itemchanged.01','Thông báo','Bạn có muốn cập nhật cho tất cả các dòng bên dưới không?','question','yesno',1) = 1 then
						this.f_update_column_4_all_row( dwo.name, row,data)
						ib_itemchanged_all_row = true  // bật biến cờ = true, đê báo khi gọi lên object item change --//
					end if
				else
					this.f_setitem_returndata( dwo.name, row) //-- dữ liệu chỉ có 1 dòng--//
				end if	
			end if			
		end if
		//-- kiểm tra sau khi đã set dữ liệu thì trên object còn làm gì nữa không --//
		li_rtn = this.f_send_message_to_object( ldw_requester,row,dwo.name, ls_data, 'e_itemchanged')	
		ib_itemchanged_all_row = false // sau khi gọi lên object reset lại biên cờ về false --//
		if li_rtn = 1 then
			if li_velueset_return = 1 then
				lod_handle.idwsetup_initial.ias_rtn_data[]  = las_empty[]
				lod_handle.idwsetup_initial.iaa_rtn_data[]  = laa_empty[]		
			end if
			this.ib_dropdowning = false
			this.ib_dataerror = true
			return 1
		elseif li_rtn = 2 then
			return 2
		else				
			this.ib_dropdowning = false
				li_rtn = this.f_send_message_to_object( ldw_requester,row,dwo.name, ls_data, 'e_postitemchanged')	
			if li_rtn_preitemchanged = 2 then return 2
			return li_rtn		
		end if
end if
this.ib_dropdowning = false
return 0
end event

event type integer e_delete();//////////////////////////////////////////////////////////
//Return	-1: error
//			0: no action
//			1: success
/////////////////////////////////////////////////////////	
integer						li_rc, li_rtn
long							ll_row, ll_last_del_row
string							ls_selected
s_w_main					lw_parent

If This.RowCount() = 0 Then Return 0
this.ib_deleting = true

//-- Delete dòng hiện hành --//
ll_last_del_row = this.getrow()
li_rc = This.event e_DeleteRow (ll_last_del_row)
if li_rc = -1 then
	this.ib_deleting = false
	return -1
end if

//-- Delete các dòng được chọn --//
if this.f_isgrid( ) then
	ll_row  = this.find( " gutter = 'Y' " , 1, this.rowcount())
	DO while ll_row > 0
		li_rc = this.event e_deleterow(ll_row)
		if li_rc = -1 then
			return -1
		end if
		ll_last_del_row = ll_row		
		ll_row  = this.find( " gutter = 'Y' " , ll_row, this.rowcount() + 1)
	LOOP
end if


//-- update database --//
if li_rc <> 2 then //-- li_rc = 2: bỏ qua update database --//
	this.f_getparentwindow(lw_parent)
	this.settransobject( lw_parent.it_transaction)			
	li_rtn = this.update(true, false)
	if li_rtn = -1 then
		this.ib_deleting = false
		this.resetupdate( )
		return -1	
	else
		this.resetupdate( )
	end if
end if

//-- after delete process --//
this.ib_deleting = false
li_rtn = this.event e_postdelete( ll_last_del_row)

return li_rtn


end event

event type integer e_save();
int 				li_rtn, li_idx
string 			ls_updatetable
t_dw_mpl		ldw_request
s_w_main		lw_parent

//-- lưu master trước trong presave --//
if not ib_saving then 
	this.ib_saving = true		
	if this.event e_presave( ) = -1 then
		this.event e_rollback_save( )
		return -1
	end if
	if this.f_get_ib_update( ) then	
		ldw_request = this
		li_rtn = this.f_send_message_to_object(ldw_request, 'e_save')
		if li_rtn = 1 then
			//check updatetable property
			ls_updatetable = describe("DataWindow.Table.updatetable")
			if ls_updatetable = '?' then
				this.ib_editing = false
				this.ib_inserting = false
				gf_messagebox('m.t_dw_mpl.e_save.01','Thống báo','Không có DW update của:@'+this.dataobject,'exclamation','ok',1)
				return 0
			end if
			
			if this.accepttext( ) <>1 then return -1
			this.ib_editing = false
			this.ib_inserting = false				
			//-- update --//
			this.f_getparentwindow(lw_parent)
			this.settransobject( lw_parent.it_transaction)			
			li_rtn = this.update(true, false)
			if li_rtn = -1 then
				this.event e_rollback_save( )
				return -1
			end if
			//-- lưu detial trong postsave --//
			if this.event e_postsave( ) = -1 then return -1			
			// nếu đang copy từ excel (import) thì phải resetupdate --//
			if ib_excel_copying then	this.resetupdate( )  
		elseif li_rtn = 0 then
			this.ib_editing = false
			this.ib_inserting = false		
//			this.ib_saving = false
			this.f_set_editable_property(this.ib_editing)
		else
			this.event e_rollback_save( )
			return -1
		end if
	else
		this.ib_editing = false
		this.ib_inserting = false			
//		this.ib_saving = false
		this.f_set_editable_property(this.ib_editing)
	end if
end if
return li_rtn

end event

event type integer e_postdelete(long vl_delete_row);/*===========================
Sau khi delete, Scroll đến record kế tiếp
-------------------------------------------------------------- */

long 					ll_currow, ll_row_cnt
int						li_process, li_rtn
datawindow		ldw_handling
window 				lw_parent
s_object_display	lpo_handling

ll_row_cnt = this.rowcount( )
ldw_handling = this

if ll_row_cnt > 0 and not this.ib_editing and not this.ib_inserting then
	if  vl_delete_row >= ll_row_cnt  then 
		ll_currow = this.scrolltorow(ll_row_cnt)
	else
		ll_currow = this.scrolltorow(vl_delete_row)
	end if
end if
//--kiểm tra xem có đang edit không--//
if not this.ib_editing then
	this.f_retrieve_detail( )
end if
this.f_filter_detail( )


return this.f_send_message_to_object(ldw_handling , ll_currow, 'e_postdelete')

end event

event e_postrefresh(long vl_cur_rowid);long ll_row_cnt, ll_cur_row

try
	ll_row_cnt = this.rowcount( )
	ll_cur_row = this.getrowfromrowid( vl_cur_rowID)
	// error handle ( neu rowID khong to tai trong dw)

	if ll_cur_row > 0 then 
		this.scrolltorow(ll_cur_row)
	else
		this.scrolltorow(ll_row_cnt )
	end if	
	
catch (runtimeerror lre)
//	openwithparm (c_w_err, lre.text)
end try
end event

event type integer e_query();Integer	li_i,li_count
t_dw_mpl	ldw_master,ldw_shared,ldw_detail

// Get the current master
ldw_master = f_GetDWMaster()
If IsNull(ldw_master) or not IsValid(ldw_master) Then Return -1
If not IsValid(ldw_master.inv_querymode) Then Return -1

//-- ẩn nút chuyển dạng form<-> lưới --//
if ldw_master.f_isgrid( ) then
	ldw_master.modify( "b_form.visible = no")
else
	ldw_master.modify( "b_grid.visible = no")
end if

// Disable refresh of the DWs
ldw_master.f_SetRedraw(false)

// Enable current DWs
ldw_master.f_Enable(true)

ldw_master.f_SetRedraw(true)
Return 1

end event

event type integer e_execquery();t_dw_mpl	ldw_master
s_w_multi	lw_parent

// Get the current master
if not this.f_get_ib_master( ) and not this.f_get_ib_detail( ) then
	 this.f_getparentwindow( lw_parent)
	 ldw_master = lw_parent.f_get_dwmain( )
else
	ldw_master = f_GetDWMaster()
end if

//-- hiện nút chuyển dạng form<-> lưới --//
if ldw_master.f_isgrid( ) then
	ldw_master.modify( "b_form.visible = yes")
else
	ldw_master.modify( "b_grid.visible = yes")
end if

ldw_master.inv_querymode.event e_ok()

ldw_master.f_Enable(false)

return 1
end event

event type integer e_postcancel();/*=========================================
Thực hiện các công việc cụ thể của từng window sau khi cancel
-------------------------------------------------------------------------------
return (integer): 0 không làm gì cả
					: 1 thành công
					:-1 lỗi
==========================================*/
this.ib_cancelling = false
return 0
end event

event type integer e_preretrieve();/*==============================
Chức năng:
	- Set security cho dw trước khi retrieve
	- Set properties cho dw trước khi retrieve
	- Gán tham số retrieve: ia_retrieve_arg[]
    - Thông báo cho ic_obj_handling
----------------------------------------------------------
return (integer): 0 Không gán gì cả
					: 1 Gán thành công
					: -1 lỗi
					: -9 dw external không tiên hành retrieve
===============================*/
int								li_rtn
string							ls_currentSQL,ls_currentWhere, ls_originalWhere, ls_rtn, ls_modify, ls_Where, ls_joinSQL, ls_currentWhere_ref
string							ls_where_ver, ls_sort_ver, ls_filter_join, ls_table_m, ls_table_alias_m, ls_join_m, ls_where_m, ls_filterstring
boolean						lb_querymode
any							la_empty[]
s_w_main					lw_parent
s_object_display			lpo_handling
t_dw_mpl					ldw_focus,ldw_main
c_sql							lc_sql
b_obj_instantiate			lbo_ins


ldw_focus = this

lb_querymode = inv_QueryMode.f_GetEnabled()
//-- querymode khi retrieve dwmain --//
if (lb_querymode and this.ib_ismaster and not this.ib_isdetail) or (lb_querymode and not this.ib_ismaster and not this.ib_isdetail) then
	inv_QueryMode.f_querymode( false)  
	return 0
end if
//-- querymode khi retrieve detial --//
if lb_querymode then inv_QueryMode.f_querymode( false)

if this.ib_edit_changing then return 0

//-- Thông báo cho obj_handling --//
li_rtn = this.f_send_message_to_object( ldw_focus, "e_preretrieve_start")
if li_rtn = -9 then return li_rtn

//-- gán gia trị cho biến ia_retrieve_arg[] --//
if this.f_getparentwindow(lw_parent) = 1 then
	this.settransobject( lw_parent.it_transaction)
	lpo_handling = lw_parent.dynamic f_get_obj_handling()
	if isvalid(lpo_handling) then
		li_rtn = lpo_handling.f_get_dw_retrieve_args(ldw_focus,  la_empty[] )
		if li_rtn > 0 then ia_retrieve_arg[] = la_empty[]
		if li_rtn < 0 then return -1
	end if
end if
ldw_main = lw_parent.dynamic f_get_dwmain()

if this.f_getcurrentSQL( ls_currentSQL, ls_currentWhere) =1 then
	if isnull(is_originalwhereClause)  then
		ib_first_buildwhere = true
		is_originalwhereClause = ls_currentWhere
		is_originalSQL_NoWhere = ls_currentSQL
	else
		ib_first_buildwhere = false
	end if
	
	 //-- trường hợp bấm refres khi đang kết phiếu thì không cần build where lại --//
	 if not ib_first_buildwhere and lpo_handling.ib_copying and lpo_handling.f_get_ib_refresh( ) then return 0
	 
	ls_currentWhere_ref = ls_currentWhere
	ls_originalWhere = is_originalwhereClause
		
	li_rtn = this.f_buildwhereclause(ls_currentWhere_ref ) 
	if li_rtn = 1 then
		if ls_currentWhere_ref = '' then
			ls_Where = ls_originalWhere 
		else
			if ls_originalWhere <> '' then	ls_originalWhere += ' AND '		
			ls_Where = ls_originalWhere + ls_currentWhere_ref
		end if
	elseif  li_rtn = 0 then
		ls_Where = ls_currentWhere_ref
	else
		return -1
	end if
	
	//--gắn vào where tìm kiếm nếu có
	if this.ib_ismaster and not this.ib_isdetail  then
		if ib_first_buildwhere then this.inv_querymode.f_setquerywhereclause(is_where_query_mode)
		if this.is_where_query_mode<> '' then ls_Where += ' AND ' + this.is_where_query_mode	
	end if
	
	//-- build from clause with join for detail DW--//
	ls_joinSQL = ls_currentSQL
	if this.ib_isdetail and not lpo_handling.ib_copying and not lpo_handling.ib_allocating then
		ls_joinSQL = this.f_get_sql_join_master( this.dataobject )
	end if
	
	//-- gắn join clause của master nếu đang tìm kiếm trên master --//
	if this.ib_isdetail and not lpo_handling.ib_copying and not lpo_handling.ib_allocating then
		ldw_main = lw_parent.dynamic f_get_dwmain()
		if ldw_main.is_join_query_mode <> '' then	ls_joinSQL += ' ' + ldw_main.is_join_query_mode
	end if
	
	//-- add where version id --//
//	ls_where_ver = this.event e_doc_trace( )	
	this.f_get_doc_trace(ls_where_ver, ls_sort_ver)
	
	//-- add join match khi copy --//
	if lpo_handling.ib_copying and this.is_join_match <> '' then
		//-- build where lần đầu sẽ gắn join clause --//
		if ib_first_buildwhere then ls_joinSQL += ' ' + this.is_join_match 
		
		if ls_Where <> "" then
			ls_joinSQL += " WHERE "+ ls_Where
		elseif ls_currentWhere <> "" and not this.ib_ismaster and not this.ib_isdetail then
			ls_joinSQL += " WHERE "+ ls_currentWhere
		end if				
		if ls_where_ver <> '' then ls_joinSQL += ' AND ' + ls_where_ver
	else
		if ls_Where <> "" then 
			if ls_where_ver <> '' then ls_Where += ' AND ' + ls_where_ver
		elseif ls_currentWhere <> "" and not this.ib_ismaster and not this.ib_isdetail then
			ls_Where = ls_currentWhere
			if ls_where_ver <> '' then ls_Where += ' AND ' + ls_where_ver
		end if				
		lc_sql.f_addtowhereclause( ls_joinSQL, ls_Where, ' AND ')
	end if
	
	//-- add/remove where với dwh_search --//	
	//-- chỉ join voi dwmain --//
	if ldw_main.dataobject = this.dataobject and not this.ib_edit_changing then
		lbo_ins.f_add_where_dwh_search( lw_parent.is_filter_txt  , ls_joinSQL)
		if left(ldw_main.describe( 'obj_search.coltype'), 5) = 'char(' then 
			ls_filterstring = lbo_ins.f_get_filterstring( ldw_main, lw_parent.is_filter_txt , 'obj_search')
			ldw_main.setfilter( ls_filterstring)
		elseif left(ldw_main.describe( 'doc_search.coltype'), 5) = 'char(' then
			ls_filterstring = lbo_ins.f_get_filterstring( ldw_main, lw_parent.is_filter_txt , 'doc_search')
			ldw_main.setfilter( ls_filterstring)
		end if
	end if	
		
	if ls_currentWhere <> ls_Where or  ls_where_ver <> '' or this.ib_isdetail or ldw_main.dataobject = this.dataobject then
			ls_modify = 'Datawindow.Table.Select= "' + ls_joinSQL +'"'
			ls_rtn =this.modify(ls_modify )
			if ls_sort_ver <> '' then this.setsort(ls_sort_ver)
		end if
	end if

//-- Thông báo cho obj_handling --//
li_rtn = this.f_send_message_to_object( ldw_focus, "e_preretrieve")
return li_rtn
end event

event type integer e_precancel();/*============================================
Thực hiện các công việc liên quan trước khi cancel
-----------------------------------------------------------
return (integer): 0 không làm gì cả
					: 1 thực hiên thành công
					: -1 lỗi
==============================================*/
return 0
end event

event type integer e_attach();String ls_dataobject
t_dw_mpl ldw_master

//If ib_isshared Then
                If IsValid ( idw_master ) Then
                                ldw_master = idw_master
                End If
//Else
                ldw_master = this
//End If

If IsValid ( ldw_master ) Then
                ls_dataobject = ldw_master.DataObject
                If IsNull(ls_dataobject) or Trim(ls_dataobject) = '' Then Return -1
                If ldw_master.RowCount() = 0 Then Return -1

//                Return OpenWithParm(u_w_document,ldw_master)
Else
                Return -1
End If
end event

event type boolean e_check_excute_itemchange(string vs_receipt_col, c_dwservice vstr_dwservice);return true
end event

event type integer e_display_actionbutton();/*********************************************
Chức năng: điều khiển các nút chức năng
-------------------------------------------------------------------------------*/

//-- Điều khiển các nút soạn thảo --//

return 1
end event

event type integer e_postmodifyrow();int 							li_idx

if this.ib_ismaster then
	// -- modify dwdetail --//
	FOR li_idx = 1 to upperbound(this.iadw_detail)
		this.iadw_detail[li_idx].triggerevent("e_modifyrow")
	NEXT
	// -- modify dwshared --//
	FOR li_idx = 1 to upperbound(this.iadw_shared)
		this.iadw_shared[li_idx].triggerevent("e_modifyrow")
	NEXT	
end if

return 1
end event

event type integer e_presave();datawindow 	ldw_master, ldw_handling
c_string		lc_string
int				li_rtn, li_idx
long			ll_row
string			ls_ref_table, lsa_ref_table_field[], ls_original_filter,ls_coltype
any			laa_empty[], la_ref_data

if this.ib_ismaster  and not this.ib_isdetail and this.ib_ref_table_yn then		
	//-- cấp nhật object_ref_table lên master --//
	li_rtn =  this.f_set_ref_data()
	if li_rtn = -1 then return -1
	li_rtn = lc_string.f_stringtoarray( this.is_ref_table_field, ';', lsa_ref_table_field[])
	FOR li_idx = 1 to li_rtn
		ls_coltype = this.describe( lsa_ref_table_field[li_idx] + '.coltype')
		if left(ls_coltype,5) = 'char(' then a_ref_data[li_idx] = upper(a_ref_data[li_idx])
		this.setitem( this.getrow( ) , lsa_ref_table_field[li_idx], a_ref_data[li_idx])
	NEXT	
	this.a_ref_data[] = laa_empty[]
	
elseif this.ib_isdetail then
	li_rtn = this.idw_master.dynamic event e_save()
	if li_rtn = -1 then return -1
	
/* Khóa ngày 08/02/2014 --/
elseif this.ib_isshared then
	this.idw_master.dynamic f_set_ib_editing(false)
	this.idw_master.dynamic f_set_ib_inserting(false)
	this.idw_master.dynamic f_set_ib_saving(true)
	if this.idw_master.dynamic f_get_ib_detail() then
		ldw_master = this.idw_master.dynamic f_getdwmaster()
		li_rtn = ldw_master.dynamic event e_save()
	end if
*/
end if
//-- Thông báo cho obj_handling --//
ldw_handling = this
li_rtn = this.f_send_message_to_object( ldw_handling, "e_presave")
return li_rtn

end event

event type integer e_postsave();//-- lưu các dw details --//

int						li_rtn, li_idx
long					ll_currow, ll_row_cnt

datawindow			ldw_requester
window				lw_parent
powerobject			lpo_handling

if this.ib_ismaster then
	//-- save detail --//
	FOR li_idx = 1 to upperbound(this.iadw_detail)		
		li_rtn = this.iadw_detail[li_idx].dynamic event e_save()
		if li_rtn = -1 then return -1
	NEXT
	//-- save shared --//
	if  upperbound(this.iadw_shared)	> 0 then
				
		FOR li_idx = 1 to upperbound(this.iadw_shared)	
			this.iadw_shared[li_idx].dynamic f_set_ib_editing(false)
			this.iadw_shared[li_idx].dynamic f_set_ib_inserting(false)
			this.iadw_shared[li_idx].dynamic f_set_ib_saving(true)
			this.iadw_shared[li_idx].dynamic f_set_editable_property( false)	
		NEXT
	end if
end if
//-- insert dummy row --//
ll_row_cnt = this.rowcount( )
if ll_row_cnt = 0 and not this.f_isgrid( ) then
	if not isvalid(lpo_handling) then
		this.f_getparentwindow( lw_parent)
		lpo_handling = lw_parent.dynamic f_get_obj_handling()
	end if
	ldw_requester =  lw_parent.dynamic f_get_dwmain() 
	if ldw_requester = this  and lpo_handling.dynamic f_get_ib_changed_dwo_4edit() then
		//-- không làm gì hết--//
	else
		if this.ib_dummy_row_yn then
			ib_dummy_row = true
			ll_currow = this.event e_addrow( )
			this.event e_resetadding( )	
		end if
	end if
end if

ldw_requester = this
return this.f_send_message_to_object(ldw_requester , 'e_postsave')

end event

event type integer e_resetupdate();int li_rtn, li_idx

if ib_saving or this.ib_deleting or this.ib_editing then
	if this.ib_isdetail or this.ib_isshared then
		li_rtn = this.idw_master.dynamic event e_resetupdate()
		if li_rtn = -1 then return -1
	end if
	
	li_rtn = this.resetupdate( )

	this.ib_saving = false
	this.ib_deleting = false
	this.ib_editing = false
		
	//-- hiện nút chuyển dạng form <-> lưới --//
	if this.f_isgrid( ) then
		this.modify( "b_form.visible = yes")
	else
		this.modify( "b_grid.visible = yes")
	end if		
	if this.ib_ismaster then
		//-- detail --//
		FOR li_idx = 1 to upperbound(this.iadw_detail)
			li_rtn = this.iadw_detail[li_idx].dynamic event e_resetupdate()
			if li_rtn = -1 then return -1
		NEXT
		//-- shared --//
		FOR li_idx = 1 to upperbound(this.iadw_shared)
			li_rtn = this.iadw_shared[li_idx].dynamic event e_resetupdate()
			if li_rtn = -1 then return -1
		NEXT		
	end if
end if

return 1
end event

event type integer e_rollback_save();/*********************************************
Cập nhật lại trạng thái edit của dw trước khi save
------------------------------------------------------------------------------*/
datawindow			ldw_handling
window					lw_parent
powerobject			lpo_handling
int							li_idx
boolean					lb_detail_displaying

if ib_saving then
	this.ib_editing= true
	ib_saving = false
	this.f_set_editable_property( true)
	
	if this.ib_isdetail then
		this.idw_master.dynamic event e_rollback_save()
	end if
	
	if this.ib_ismaster then
		FOR li_idx = 1 to upperbound(this.iadw_detail[])
			lb_detail_displaying = this.iadw_detail[li_idx].dynamic f_get_ib_displaying() 
			if lb_detail_displaying then
				this.iadw_detail[li_idx].dynamic event e_rollback_save()
				exit
			end if
		NEXT
	end if	
end if




//-- Gọi điều khiển các button --//
//if this.f_getparentwindow( lw_parent) = 1 then
//	lpo_handling = lw_parent.dynamic f_get_obj_handling()
//	//-- Báo object handling --//
//	if isvalid(lpo_handling) then
//		lpo_handling.dynamic f_ctrl_actionbuttons(ldw_handling)
//	else
//	end if
//end if

//-- thông báo cho object điều khiển --//
ldw_handling = this
return this.f_send_message_to_object( ldw_handling,'e_rollback_save' )
end event

event type integer e_rollback_modify();/*********************************************
Cập nhật lại trạng thái edit của dw trước khi modify
------------------------------------------------------------------------------*/
int 					li_idx
boolean				lb_keyboardlocked
window				lw_parent
powerobject		lpo_handling
datawindow		ldw_handling

if this.ib_editing then
	if this.f_getparentwindow( lw_parent) = 1 then
		lpo_handling = lw_parent.dynamic f_get_obj_handling()
		if isvalid(lpo_handling) then
			this.ib_editing= false
			this.f_set_editable_property( false)
			//-- hiện nút chuyển dạng form<-> lưới --//
			if this.f_isgrid( ) then
				this.modify( "b_form.visible = yes")
			else
				this.modify( "b_grid.visible = yes")
			end if	
			//--rollback object --//
			ldw_handling = this
			this.f_send_message_to_object(ldw_handling , 'e_rollback_modify')	
			
			if this.ib_isdetail then
				this.idw_master.dynamic event e_rollback_modify()
			end if
			if this.ib_ismaster then
				FOR li_idx = 1 to upperbound(this.iadw_detail)
					this.iadw_detail[li_idx].dynamic event e_rollback_modify()
				NEXT
			end if	
		end if
	end if
end if

return 1
end event

event type integer e_rollback_insert(long vl_row);/*********************************************
Cập nhật lại trạng thái edit của dw trước khi modify
------------------------------------------------------------------------------*/

if this.ib_inserting then
	this.rowsdiscard( vl_row, vl_row, primary!)
	this.ib_inserting = false
	this.event e_rollback_modify( )
	if vl_row > 1 then
		this.scrolltorow( vl_row - 1)
	end if	
end if
return 1
end event

event type integer e_postretrieve(long vl_rowcount);datawindow				ldw_requester
window					lw_parent
s_object_display		lod_handling

this.f_getparentwindow( lw_parent)
lod_handling = lw_parent.dynamic f_get_obj_handling()

//-- retrieve detail --// 
If  ib_ismaster and not this.ib_isdetail  and not lod_handling.ib_copying and not lod_handling.ib_allocating and not this.ib_edit_changing  then // and not this.ib_edit_changing
//	and upperbound(this.iadw_detail) > 0  
	this.f_filter_detail( )
End If

ib_retrieving = false

ldw_requester = this
return this.f_send_message_to_object( ldw_requester,vl_rowCount, 'e_postretrieve')

end event

event type integer e_resetadding();int li_rtn, li_idx

if this.ib_editing then
	if this.ib_isdetail  then
		li_rtn = this.idw_master.dynamic event e_rollback_modify()
		if li_rtn = -1 then return -1
	end if
	
	li_rtn = this.resetupdate( )
	this.ib_inserting = false
	this.ib_editing = false
	
	if this.ib_ismaster  then
		FOR li_idx = 1 to upperbound(this.iadw_detail)
			li_rtn = this.iadw_detail[li_idx].dynamic event e_rollback_modify()
			if li_rtn = -1 then return -1
		NEXT
	end if
end if

return 1
end event

event type integer e_popup_data(string vs_colname, string vs_objname);string						ls_coltype, ls_data, ls_rtn, ls_dwo, ls_return_column,ls_displaycolname,ls_rtn_colname, ls_dwdatatype
string						ls_receive_column, las_receive_column[],ls_doctype,ls_history_obj_ref_code,ls_history_display_column
string						ls_drilldown_object, ls_obj_ref_name, ls_where_rec, ls_dwo_rec
int							li_colCnt, li_idx, li_rtn, li_rtn_preitemchanged
long						ll_setup_row
double					ldb_setup_id
boolean					lb_querymode
b_popup_data			lb_popup_data
window					lw_parent
c_string					lc_string
c_dwsetup_initial		ldwsetup_initial
datawindow				ldw_requester,ldw_main
s_object_display		lod_handle
c_dwservice				lc_dwservice
datawindowchild		ldwc

this.f_getparentwindow(lw_parent)
lod_handle = lw_parent.dynamic f_get_obj_handling()
ldw_requester = this
if lod_handle.classname( ) = 'u_structure' then return 0 //-- khi là form structure popup thì không open valuset được --//
ls_coltype = this.describe( vs_colname+'.coltype')
ll_setup_row = lod_handle.idwsetup_initial.f_get_dwdatatype_string(vs_colname, ls_coltype, this, ls_dwdatatype)
if ll_setup_row > 0 then
	ls_drilldown_object =  lod_handle.idwsetup_initial.ids_setup_dw.getitemstring(ll_setup_row, 'OBJECT_REF_TABLE')
//	ls_obj_ref_name =  lod_handle.idwsetup_initial.ids_setup_dw.getitemstring(ll_setup_row, 'OBJECT_REF_NAME')
	ls_return_column =  lod_handle.idwsetup_initial.ids_setup_dw.getitemstring(ll_setup_row, 'return_column')
	ls_receive_column = lod_handle.idwsetup_initial.ids_setup_dw.getitemstring(ll_setup_row, 'receive_column')
	lc_string.f_stringtoarray( ls_receive_column, ';', las_receive_column[])
	ls_displaycolname = lod_handle.idwsetup_initial.ids_setup_dw.getitemstring( ll_setup_row, 'display_column')	
	if lastpos(ls_displaycolname,';') < len(ls_displaycolname) then ls_displaycolname +=';'	
	ls_displaycolname ='gutter;'+ls_displaycolname
	ldb_setup_id = lod_handle.idwsetup_initial.ids_setup_dw.getitemnumber(ll_setup_row,'ID')
	lod_handle.idwsetup_initial.ids_setup_dw.setfilter("ID ="+string(ldb_setup_id))
	lod_handle.idwsetup_initial.ids_setup_dw.filter( )
	
	//-- build record where security --//
	if this.getchild( vs_colname , ldwc) <> -1 then
		ls_obj_ref_name = lod_handle.idwsetup_initial.ids_setup_dw.getitemstring( 1, 'object_record_ref')
		ls_dwo_rec = lod_handle.idwsetup_initial.ids_setup_dw.getitemstring( 1, 'object_ref_name')
		ls_where_rec = lc_dwservice.f_buildwhere_rec_security_ex( ldwc, ls_dwo_rec, upper(ls_obj_ref_name) )
	end if
else
	return -1
end if

//-- Lay display column --//
DO
	ls_rtn_colname =  lc_string.f_gettoken(ls_return_column , ';') + ';'
	if pos(ls_displaycolname, ls_rtn_colname) = 0 then
		ls_displaycolname += ls_rtn_colname
	end if
LOOP WHILE  ls_return_column <> ''

//-- lấy display column cho truy vấn lượt sử--//
ls_history_obj_ref_code = lod_handle.idwsetup_initial.ids_setup_dw.getitemstring(1, 'history_obj_ref_code')
if not isnull(ls_history_obj_ref_code) and len(ls_history_obj_ref_code) > 0 then
	ls_history_display_column = lod_handle.idwsetup_initial.ids_setup_dw.getitemstring(1, 'history_display_column')
	if lastpos(ls_history_display_column,';') < len(ls_history_display_column) then ls_history_display_column +=';'	
	ls_history_display_column ='gutter;'+ls_history_display_column
end if

//-- Khởi tạo valueset object--//
lb_popup_data = lw_parent.dynamic f_create_flex_object(lod_handle.idwsetup_initial.ids_setup_dw, vs_objname)
if isnull(lb_popup_data) then return -1

lb_popup_data.is_dwo_have_valueset =  this.dataobject
lb_popup_data.is_display_column = ls_displaycolname
lb_popup_data.is_display_column_history = ls_history_display_column
if this.gettext( ) <> '`' and lastpos(this.gettext( ),'`') = len(this.gettext( )) then
	ls_data = left(this.gettext( ),len(this.gettext( )) -1)
else
	ls_data = string(this.f_getitemany( this.getrow( ) ,  vs_colname ))
end if

lb_popup_data.f_set_currentdata(ls_data)
lb_popup_data.is_drilldown_object = ls_drilldown_object
//lb_popup_data.is_object_ref_name = ls_obj_ref_name
lb_popup_data.is_where_rec = ls_where_rec
ib_valuesetting = true
if vs_objname = 'u_valueset' then
	lw_parent.dynamic f_openchildwithparm('s_w_multi_n_rb',lb_popup_data)				
else
	openwithparm(s_wr_multi, lb_popup_data)
end if
ls_rtn = message.stringparm
setnull( message.stringparm)

this.ib_dropdowning = false
this.setcolumn( vs_colname)

if ls_rtn = 'ok' then
//	lod_handle.idwsetup_initial.ids_setup_dw.setfilter("dwobject ='"+ls_dwo+ "' AND dwcolumn = '"+vs_colname+"'" )
//	lod_handle.idwsetup_initial.ids_setup_dw.filter( )	
	if vs_objname = 'u_valueset' then
		if  lod_handle.idwsetup_initial.f_is_valueset_receive_number(this.dataobject,ls_receive_column ) then
			if upperbound(lod_handle.idwsetup_initial.iaa_rtn_data[]) > 0 then 
				ls_data = string(lod_handle.idwsetup_initial.iaa_rtn_data[1] )
			end if
		else		
			if  upperbound(lod_handle.idwsetup_initial.ias_rtn_data[]) > 0 then
				ls_data = lod_handle.idwsetup_initial.ias_rtn_data[1]
			end if
		end if
	elseif vs_objname = 'u_structure' then
		if  upperbound(lod_handle.idwsetup_initial.iaa_rtn_data[]) > 0 then
			this.setitem( this.getrow(), vs_colname, lod_handle.idwsetup_initial.iaa_rtn_data[1])
		end if				
	end if
	li_rtn = this.f_setitem_returndata(vs_colname , this.getrow(), true) 
	if li_rtn <> -1 then
		if vs_objname = 'u_valueset' then this.accepttext( )
	else
		return -1
	end if
	//-- Kiểm tra query mode --//
	lb_querymode = inv_QueryMode.f_GetEnabled()
	If lb_querymode = false Then
		//-- gửi data cho object kiểm tra neu là valueset--//
		if ls_data <> '' and vs_objname = 'u_valueset' then
			
			//##xử lý làm tròn --//
			li_rtn_preitemchanged = this.f_send_message_to_object( ldw_requester,this.getrow(),vs_colname, ls_data, 'e_preitemchanged')
			if li_rtn_preitemchanged =1  then
				this.f_setnull_columns(las_receive_column[] , this.getrow())
				lod_handle.idwsetup_initial.ids_setup_dw.setfilter( "" )
				lod_handle.idwsetup_initial.ids_setup_dw.filter( )				
				return -1
			end if
			//##Kết thúc xử lý làm tròn --//
			li_rtn = this.f_send_message_to_object( ldw_requester,this.getrow(),vs_colname, ls_data, 'e_itemchanged')
			if li_rtn = -1 then
				this.f_setnull_columns(las_receive_column[] , this.getrow())
				lod_handle.idwsetup_initial.ids_setup_dw.setfilter( "" )
				lod_handle.idwsetup_initial.ids_setup_dw.filter( )	
				return -1
			end if
		end if
	end if
elseif  ls_rtn = 'clear' then
	if vs_objname = 'u_structure' then
		this.f_setnull_columns(las_receive_column[] , this.getrow())
	end if	
else
	this.settext(ls_data )	
end if

this.selecttext( len(this.gettext( ))+1 ,0 )
ib_valuesetting = false //-- kết thúc valusetting --//

//if this.f_get_ib_focus_master( ) then
	lw_parent.dynamic f_set_idwfocus(ldw_requester)
//end if

if li_rtn = -1 then
	destroy lb_popup_data
	lod_handle.idwsetup_initial.ids_setup_dw.setfilter( "" )
	lod_handle.idwsetup_initial.ids_setup_dw.filter( )	
	return -1
end if
if vs_objname <> 'u_valueset' then 
	destroy lb_popup_data
	lod_handle.idwsetup_initial.ids_setup_dw.setfilter( "" )
	lod_handle.idwsetup_initial.ids_setup_dw.filter( )	
end if
return 1
end event

event type string e_doc_trace();s_w_main				lw_display
c_dwservice				lc_dwservice
s_object_display		lod_handle
c_string					lc_string
double					ldb_doc_id
any						laa_data[]
string						ls_where, ls_colname, ls_coltype
long						ll_master_row

if this.describe( "version_id.coltype" ) = 'number' then
	this.f_getparentwindow(lw_display )
	if lw_display.dynamic f_get_ib_doc_trace_on() then
		if this.getrow( ) > 0 then
			ldb_doc_id = this.getitemnumber(this.getrow( ), 'id')
//			laa_data[1] = ldb_doc_id
			ls_colname = ' ID'
			lc_dwservice.f_get_build_column( this, ls_colname, ls_coltype)		
			ls_where = ls_colname + '=' + string(ldb_doc_id)
			return ls_where
//			this.f_add_where( 'ID;', laa_data[])
//			this.setsort( 'ID a')
//			this.sort( )
		end if
	else
		ls_colname = ' extend_id'
		lc_dwservice.f_get_build_column( this, ls_colname, ls_coltype)
		ls_where = ls_colname
		ls_colname = ' version_id'
		lc_dwservice.f_get_build_column( this, ls_colname, ls_coltype)
		ls_where = ls_where +' = ' + ls_colname
		return ls_where
	end if
elseif this.describe( "version_no.coltype" ) = 'number' then
	this.f_getparentwindow(lw_display )
	if lw_display.dynamic f_get_ib_doc_trace_on() then
		if this.idw_master.getrow( ) > 0 then
			ls_colname = ' ID'
			lc_dwservice.f_get_build_column( this, ls_colname, ls_coltype)		
			ls_where = ls_colname
			ls_colname = ' extend_id'
			lc_dwservice.f_get_build_column( this.idw_master, ls_colname, ls_coltype)
			ls_where = ls_where +' = ' + ls_colname			
			return ls_where
		end if
	else
		lod_handle = lw_display.f_get_obj_handling( )
		if not lod_handle.ib_copying then
			ls_coltype = this.idw_master.describe( "version_id.coltype")
			ls_colname = 'version_id'
			lc_dwservice.f_get_build_column( idw_master, ls_colname, ls_coltype)
			ls_where = ls_colname
			ls_coltype = this.describe( "ID.coltype")
			ls_colname = 'ID'
			lc_dwservice.f_get_build_column( this, ls_colname, ls_coltype)
			ls_where += ' = '+ ls_colname
			return ls_where
//			if ls_where <> '' then 	this.f_add_where(ls_where, ' AND ')								
		elseif lod_handle.ib_copying and lod_handle.is_copy_type <> 'copyt' then
			ll_master_row = this.idw_master.find( "gutter = 'Y'", 1, this.idw_master.rowcount())
			DO while ll_master_row > 0					
				if not isnull(ls_where) and ls_where <>'' then
					ls_where +=';'
				end if
				ls_where += string(idw_master.getitemnumber(ll_master_row, 'version_id' ))
				ll_master_row = this.idw_master.find( "gutter = 'Y'", ll_master_row+1, this.idw_master.rowcount()+1)
			LOOP				
			/*
			ll_master_row = idw_master.getrow()
			if ll_master_row > 0 then
				ls_where += string(idw_master.getitemnumber(ll_master_row, 'version_id' ))
			end if */

			ls_coltype = this.idw_master.describe( "version_id.coltype")
			if pos(ls_where, ';') > 0 then
				ls_where = '('+ls_where+')'
			end if
			ls_colname = 'ID'
			lc_dwservice.f_get_build_column( this, ls_colname, ls_coltype)
			ls_where = lc_string.f_get_expression( ls_where, ls_coltype, ls_colname, 'build where')	
			return ls_where
//			if ls_where <> '' then 	this.f_add_where(ls_where, ' AND ')	
		
		end if
	end if
end if
return ''
end event

event type integer e_delete_all();//////////////////////////////////////////////////////////
//Return	-1: error
//			0: no action
//			1: success
// xóa hết tất cả các dòng trong datawindow
/////////////////////////////////////////////////////////	
integer						li_rc, li_rtn
long							ll_row, ll_last_del_row
string							ls_selected
s_w_main					lw_parent

If This.RowCount() = 0 Then Return 0
this.ib_deleting = true

//-- Delete dòng hiện hành --//
ll_last_del_row = this.getrow()
li_rc = This.event e_DeleteRow (ll_last_del_row)
if li_rc = -1 then
	this.ib_deleting = false
	return -1
end if

//-- Delete các dòng được chọn --//
	for ll_row=this.rowcount( ) to 1 step -1
		li_rc = this.event e_deleterow(ll_row)
		if li_rc = -1 then
			return -1
		end if
	next
//-- update database --//
//if not this.ib_editing then
	this.f_getparentwindow(lw_parent)
	this.settransobject( lw_parent.it_transaction)			
	li_rtn = this.update(true, false)
	if li_rtn = -1 then
		this.resetupdate( )
		return -1	
	else
		this.resetupdate( )
		end if
//end if

//-- after delete process --//
this.ib_deleting = false
li_rtn = this.event e_postdelete( ll_last_del_row)

return li_rtn


end event

event type integer e_itemchanged_ex(long row, string colname, ref string data);/*********************************************************************
Chức năng: kiểm tra ràng buộc dữ liệu trên cùng dw: GỌI KHI COPY TỪ EXCEL VÀO DW
------------------------------------------------------------
return:
	- 0 :Dữ liệu nhập ok
	- 1 : Dữ liệu nhập không hợp lệ
	- 2 : Dữ liệu nhập đã được thay đổi và setitem ok
=============================================================*/
datawindowchild	ldwc
datawindow			ldw_requester
c_string				lc_string
c_dwservice			lc_dwservice
c_dwsetup_initial	lc_dwsetup_initial
window				lw_display
s_object_display	lod_handle	
int						li_rtn, li_velueset_return, li_idx, li_chk, li_rtn_preitemchanged, li_rpt_parm_rtn
string					las_empty[], ls_coltype, ls_dwdatatype, ls_dwdatatype_str, lsa_return_cols[], lsa_receive_cols[], las_rtn_data[]
string					ls_col_curcode, ls_col_exrate,ls_col_name, ls_dwo, ls_data
any					laa_empty[], la_data, laa_rtn_data[]
double				ldb_exrate
date					ld_prior_period_date, ld_last_period_date
long					ll_row_upd
boolean				lb_valueset_receive_number

this.f_getparentwindow( lw_display)
lod_handle = lw_display.dynamic f_get_obj_handling()	
ldw_requester = this
//-- kiểm tra ràng buộc trên object trước khi setitem --//
li_rtn = this.f_send_message_to_object( ldw_requester,row,colname, data, 'e_beforeitemchanged')
if li_rtn = 1 then
	if li_velueset_return = 1 then
		lod_handle.idwsetup_initial.ias_rtn_data[]  = las_empty[]
		lod_handle.idwsetup_initial.iaa_rtn_data[]  = laa_empty[]		
	end if
	this.ib_dropdowning = false
	this.ib_dataerror = true
	return 1
end if
//-- Kiểm tra ràng buộc dữ liệu với data value set --//
if not ib_valuesetting then //-- khi đang open window valueset thì bỏ qua itemchanged --//
	
	if this.ib_dropdowning then		
		this.getchild( colname, ldwc)
		li_rtn = lc_string.f_stringtoarray(lod_handle.idwsetup_initial.is_return_column , ';', lsa_return_cols[])
		//-- Trường hợp không cài đặt return_col (report)
		if li_rtn = 0 or isnull(li_rtn) then
			la_data = lc_dwservice.f_getitemany_dwc( ldwc, ldwc.getrow() ,'CODE')
			if not isnull(la_data) then
				li_rpt_parm_rtn = lc_dwsetup_initial.f_get_report_date(la_data,ld_prior_period_date, ld_last_period_date)
				if li_rpt_parm_rtn = 1 then
					li_rtn = lc_string.f_stringtoarray(lod_handle.idwsetup_initial.is_receive_column , ';', lsa_receive_cols[])
					if li_rtn = 0 then return 0 //-- trường hợp popup input data--//					
					lod_handle.idwsetup_initial.ias_rtn_data[1] = la_data
					lod_handle.idwsetup_initial.ias_rtn_data[2] = string(ld_prior_period_date)
					lod_handle.idwsetup_initial.ias_rtn_data[3] = string(ld_last_period_date)
	//				this.setitem( row, lsa_receive_cols[2],ld_prior_period_date)
	//				this.setitem( row, lsa_receive_cols[3],ld_last_period_date)
					li_velueset_return = 1
				end if
			end if
		else //-- xử lý form nhập liệu --//
			if isnull(data) then
				lod_handle.idwsetup_initial.ias_rtn_data[]  = las_empty[]
				lod_handle.idwsetup_initial.iaa_rtn_data[]  = laa_empty[]		
				li_velueset_return = 1	
			else
				li_rtn = lc_string.f_stringtoarray(lod_handle.idwsetup_initial.is_receive_column , ';', lsa_receive_cols[])
				li_chk = lod_handle.f_get_colname_exchange_rate( this, lod_handle.idwsetup_initial.is_receive_column, ls_col_curcode, ls_col_exrate)
				//-- xử lý tỷ giá : khi edit cột loại tiền --//
				if li_chk = 1 and ls_col_curcode = colname and not isnull(data) then
					ldb_exrate = lod_handle.f_get_exchange_rate_ex( data, today())
					this.setitem( row, ls_col_exrate, ldb_exrate)
				end if				
				
				lb_valueset_receive_number = lod_handle.idwsetup_initial.f_is_valueset_receive_number(this.dataobject, lod_handle.idwsetup_initial.is_receive_column ) 					
				if lb_valueset_receive_number then
					lod_handle.idwsetup_initial.iaa_rtn_data[1] = data
				else
					lod_handle.idwsetup_initial.ias_rtn_data[1] = data
				end if
				FOR li_idx = 2 to li_rtn			
					la_data = lc_dwservice.f_getitemany_dwc( ldwc, ldwc.getrow() , lsa_return_cols[li_idx])
					if lb_valueset_receive_number then
						lod_handle.idwsetup_initial.iaa_rtn_data[li_idx] = la_data
					else
						lod_handle.idwsetup_initial.ias_rtn_data[li_idx] = la_data
					end if
					li_velueset_return = 1	
					//-- set tỷ giá khi thay trong cột giá trị trả về có cột loại tiền --//
					if li_chk = 1 then				
						if lsa_receive_cols[li_idx] = ls_col_curcode and not isnull(la_data) then
							//-- sau này sửa lại lấy ngày session date --//
							ldb_exrate = lod_handle.f_get_exchange_rate_ex( string(la_data), gd_session_date)
							this.setitem( row, ls_col_exrate, ldb_exrate)
						end if
					end if
				NEXT
			end if
		end if
	else
		//-- khi edit trưc tiếp --//
		ls_coltype = this.describe(colname +'.coltype' )
		li_rtn = lod_handle.idwsetup_initial.f_get_dwdatatype_string(colname , ls_coltype,this, ls_dwdatatype)
		if (ls_dwdatatype = 'dwo' or ls_dwdatatype = 'valueset') then			

			this.f_retrieve_dwc_ex(colname )
			this.getchild( colname, ldwc)

			li_velueset_return = this.f_check_valueset( data, colname, ldwc)
			if li_velueset_return = -1 then
				this.ib_dataerror = true
				this.ib_dropdowning = false
				return 1
			end if				
		end if		
	end if
	// gọi lên object xử lý sau khi setitem //
	
	//## gọi lên object xử lý làm tròn --//
	li_rtn_preitemchanged = this.f_send_message_to_object( ldw_requester,row,colname, data, 'e_preitemchanged')
	if li_rtn_preitemchanged = 1  then 
		//-- set null --//
//		this.f_setnull_columns(lsa_receive_cols[] , row)
		return 1
	end if
	//##Kết thúc xử lý làm tròn --//
	
	//--------------------------------------------------------------------//
	//-- Xử lý chung khi có dropdown và cả khi không drodown --//
	//-------------------------------------------------------------------//
	//-- Thông báo với đối tượng quản lý khi edit trược tiếp --//
	if li_rtn_preitemchanged = 2 then 
		ls_data = string(this.f_getitemany( row, colname))
	else
		ls_data = data
	end if
	//--kiểm tra tỷ giá: khi edit cột loại tiền--//
//	li_chk = lod_handle.f_get_colname_exchange_rate( this, lod_handle.idwsetup_initial.is_receive_column, ls_col_curcode, ls_col_exrate)
//	if li_chk = 1 and ls_col_curcode = colname  then
//		ldb_exrate = lod_handle.f_get_exchange_rate( data, today())
//		this.setitem( row, ls_col_exrate, ldb_exrate)
//	end if		
	//-- kiểm tra sau khi đã set dữ liệu thì trên object còn làm gì nữa không --//
//	li_rtn = this.f_send_message_to_object( ldw_requester,row,colname, ls_data, 'e_itemchanged')	

//	if li_rtn = 1 then
//		if li_velueset_return = 1 then
//			lod_handle.idwsetup_initial.ias_rtn_data[]  = las_empty[]
//			lod_handle.idwsetup_initial.iaa_rtn_data[]  = laa_empty[]		
//		end if
//		this.ib_dropdowning = false
//		this.ib_dataerror = true
//		return 1
//	else				
		//-- kiểm copy dòng trên --//		
		ls_dwo = left(this.dataobject, len(this.dataobject) - 5)
		ll_row_upd = lod_handle.idwsetup_initial.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" +colname+ "' AND auto_copy_yn = 'Y'" ,1, lod_handle.idwsetup_initial.ids_setup_dw.rowcount( ))		
		
		if li_velueset_return = 1 then//-- trường hợp valueset --//  							
			if ll_row_upd > 0 then //-- có valueset va copy dòng trên --//
				if row < this.rowcount( ) then
					if gf_messagebox('m.t_dw_mpl.e_itemchanged.01','Thông báo','Bạn có muốn cập nhật cho tất cả các dòng bên dưới không?','question','yesno',1) = 1 then
						this.f_update_column_4_all_row( colname, row)
						ib_itemchanged_all_row = true  // bật biến cờ = true, đê báo khi gọi lên object item change --//
					else
						this.f_setitem_returndata( colname, row,false,false)
					end if				
				else
					this.f_setitem_returndata( colname, row,false,false)
				end if	
			else	//if this.ib_dropdowning = false then //-- có valuset nhưng ko copy dòng trên --//
				this.f_setitem_returndata( colname, row,false,false)
				if this.ib_dropdown_scrolling then //-- đang scroll dwc--//
					li_rtn = this.f_send_message_to_object( ldw_requester,row,colname, ls_data, 'e_postitemchanged')	
					ib_dropdown_excepted = true
					return 0
				end if				
			end if
		elseif li_velueset_return = 0 and ll_row_upd = 0  then //khi xóa dữ liệu thì không hỏi update các dòng khác --//
			if isnull(data) or data = '' then
				this.f_setitem_returndata( colname, row,false,false)
			end if
		else 
			// trường hợp không có valuset nhưng có copy dòng trên --//
			if ll_row_upd > 0 then 
				if row < this.rowcount( ) then
					if gf_messagebox('m.t_dw_mpl.e_itemchanged.01','Thông báo','Bạn có muốn cập nhật cho tất cả các dòng bên dưới không?','question','yesno',1) = 1 then
						this.f_update_column_4_all_row( colname, row,data)
						ib_itemchanged_all_row = true  // bật biến cờ = true, đê báo khi gọi lên object item change --//
					end if
				else
					this.f_setitem_returndata( colname, row,false,false) //-- dữ liệu chỉ có 1 dòng--//
				end if	
			end if			
		end if
		//-- kiểm tra sau khi đã set dữ liệu thì trên object còn làm gì nữa không --//
		li_rtn = this.f_send_message_to_object( ldw_requester,row,colname, ls_data, 'e_itemchanged')	
		ib_itemchanged_all_row = false // sau khi gọi lên object reset lại biên cờ về false --//
		if li_rtn = 1 then
			if li_velueset_return = 1 then
				lod_handle.idwsetup_initial.ias_rtn_data[]  = las_empty[]
				lod_handle.idwsetup_initial.iaa_rtn_data[]  = laa_empty[]		
			end if
			this.ib_dropdowning = false
			this.ib_dataerror = true
			return 1
		elseif li_rtn = 2 then
			return 2
		else				
			this.ib_dropdowning = false
				li_rtn = this.f_send_message_to_object( ldw_requester,row,colname, ls_data, 'e_postitemchanged')	
				ib_dropdown_excepted = true
			if li_rtn_preitemchanged = 2 then return 2
			return li_rtn		
		end if
end if
this.ib_dropdowning = false
return 0
end event

event type long e_addrow_ex();//////////////////////////////////////////////////////////
//Return	-1: error
//			0: no action
//			1: success
/////////////////////////////////////////////////////////			
long			ll_rc, ll_currow, ll_add_row
int  			li_process
string		ls_first_col


//-- Trước khi thêm mới: reset dwdetail, set editing cho cac dw liên kết --//
If This.Event e_PreInsertRow() = -1 Then
	Return -1
end if

//-- Thêm record mới --//
this.ib_inserting = true
this.ib_editing = true

li_process = integer(this.Object.DataWindow.Processing)
if li_process = 0 and this.ib_ismaster and not this.ib_isdetail then 
	ll_rc = this.rowcount( )
	if ll_rc =1 then
		if this.getitemstatus( 1, 0, primary!) <> Newmodified! then
			this.reset( )
		else
			ll_add_row =1
		end if
	end if
else
	if this.ib_relation_1_1 and this.ib_focus_master then
		ll_add_row = this.rowcount( )
	end if
end if

if ll_add_row = 0 then ll_add_row = This.InsertRow(0)
if ll_add_row = 1 then 
	ll_rc = this.setrow( 1)
else
	this.ScrollToRow(ll_add_row)
end if
if ll_rc = -1 then
	this.event e_rollback_insert(ll_add_row)
	return -1
end if

//ls_first_col = f_GetFirstColumn(true)
//if ls_first_col <> '' then
//	this.SetColumn(ls_first_col)
//end if


//-- Sau khi thêm record: gán các giá trị mặc đinh, ID và thông báo cho Object --//
ll_rc = This.Event e_PostInsertRow(ll_add_row)

if ll_rc = -1 then
	this.event e_rollback_insert(ll_add_row)
end if
this.ib_inserting = false
Return ll_rc

end event

event type integer e_resetupdate_del();int li_rtn, li_idx

if this.ib_editing then
//	if this.ib_isdetail or this.ib_isshared then
//		li_rtn = this.idw_master.dynamic event e_resetupdate_del()
//		if li_rtn = -1 then return -1
//	end if
	
	li_rtn = this.resetupdate( )

	//-- hiện nút chuyển dạng form <-> lưới --//
	if this.f_isgrid( ) then
		this.modify( "b_form.visible = yes")
	else
		this.modify( "b_grid.visible = yes")
	end if		
	if this.ib_ismaster then
		//-- detail --//
		FOR li_idx = 1 to upperbound(this.iadw_detail)
			li_rtn = this.iadw_detail[li_idx].dynamic event e_resetupdate_del()
			if li_rtn = -1 then return -1
		NEXT
		//-- shared --//
		FOR li_idx = 1 to upperbound(this.iadw_shared)
			li_rtn = this.iadw_shared[li_idx].dynamic event e_resetupdate_del()
			if li_rtn = -1 then return -1
		NEXT		
	end if
end if

return 1
end event

event type integer e_autosave();
int 				li_rtn, li_idx
string 			ls_updatetable
t_dw_mpl		ldw_request
s_w_main		lw_parent

//-- lưu master trước trong presave --//
if not ib_saving and ib_editing then 
	this.ib_saving = true		
	if this.event e_preautosave( ) = -1 then
//		this.event e_rollback_save( )
		return -1
	end if
	if this.f_get_ib_update( ) then	
		ldw_request = this
		li_rtn = this.f_send_message_to_object(ldw_request, 'e_save')
		if li_rtn = 1 then
			//check updatetable property
			ls_updatetable = describe("DataWindow.Table.updatetable")
			if ls_updatetable = '?' then
//				this.ib_editing = false
//				this.ib_inserting = false
				gf_messagebox('m.t_dw_mpl.e_save.01','Thống báo','Không có DW update của:@'+this.dataobject,'exclamation','ok',1)
				return 0
			end if
			
			if this.accepttext( ) <>1 then return -1
//			this.ib_editing = false
//			this.ib_inserting = false				
			//-- update --//
			this.f_getparentwindow(lw_parent)
			this.settransobject( lw_parent.it_transaction)			
			li_rtn = this.update(true, false)
			if li_rtn = -1 then
//				this.event e_rollback_save( )
				return -1
			end if
			this.resetupdate( )
//			if ib_excel_copying then	this.resetupdate( )  // nếu đang copy từ excel (import) thì phải resetupdate --//
		elseif li_rtn = 0 then
//			this.ib_editing = false
//			this.ib_inserting = false		
//			this.ib_saving = false
//			this.f_set_editable_property(this.ib_editing)
		else
//			this.event e_rollback_save( )
			return -1
		end if
	else
//		this.ib_editing = false
//		this.ib_inserting = false			
//		this.ib_saving = false
//		this.f_set_editable_property(this.ib_editing)
	end if
	//-- lưu detial trong postsave --//
	if this.event e_postautosave( ) = -1 then return -1
end if
return li_rtn

end event

event type integer e_preautosave();datawindow 	ldw_master, ldw_handling
c_string		lc_string
int				li_rtn, li_idx
long			ll_row
string			ls_ref_table, lsa_ref_table_field[], ls_original_filter,ls_coltype
any			laa_empty[], la_ref_data

if this.ib_ismaster  and not this.ib_isdetail and this.ib_ref_table_yn then		
	//-- cấp nhật object_ref_table lên master --//
	li_rtn =  this.f_set_ref_data()
	if li_rtn = -1 then return -1
	li_rtn = lc_string.f_stringtoarray( this.is_ref_table_field, ';', lsa_ref_table_field[])
	FOR li_idx = 1 to li_rtn
		ls_coltype = this.describe( lsa_ref_table_field[li_idx] + '.coltype')
		if left(ls_coltype,5) = 'char(' then a_ref_data[li_idx] = upper(a_ref_data[li_idx])
		this.setitem( this.getrow( ) , lsa_ref_table_field[li_idx], a_ref_data[li_idx])
	NEXT	
	this.a_ref_data[] = laa_empty[]
	
elseif this.ib_isdetail then
	li_rtn = this.idw_master.dynamic event e_autosave()
	if li_rtn = -1 then return -1
	
/* Khóa ngày 08/02/2014 --/
elseif this.ib_isshared then
	this.idw_master.dynamic f_set_ib_editing(false)
	this.idw_master.dynamic f_set_ib_inserting(false)
	this.idw_master.dynamic f_set_ib_saving(true)
	if this.idw_master.dynamic f_get_ib_detail() then
		ldw_master = this.idw_master.dynamic f_getdwmaster()
		li_rtn = ldw_master.dynamic event e_save()
	end if
*/
end if
//-- Thông báo cho obj_handling --//
ldw_handling = this
li_rtn = this.f_send_message_to_object( ldw_handling, "e_presave")
return li_rtn

end event

event type integer e_postautosave();//-- lưu các dw details --//

int						li_rtn, li_idx
long					ll_currow, ll_row_cnt

datawindow			ldw_requester
window				lw_parent
powerobject			lpo_handling

if this.ib_ismaster then
	//-- save detail --//
	FOR li_idx = 1 to upperbound(this.iadw_detail)		
		li_rtn = this.iadw_detail[li_idx].dynamic event e_autosave()
		if li_rtn = -1 then return -1
	NEXT
	//-- save shared --//
//	if  upperbound(this.iadw_shared)	> 0 then
				
//		FOR li_idx = 1 to upperbound(this.iadw_shared)	
//			this.iadw_shared[li_idx].dynamic f_set_ib_editing(false)
//			this.iadw_shared[li_idx].dynamic f_set_ib_inserting(false)
//			this.iadw_shared[li_idx].dynamic f_set_ib_saving(true)
//			this.iadw_shared[li_idx].dynamic f_set_editable_property( false)	
//		NEXT
//	end if
end if
//-- insert dummy row --//
ll_row_cnt = this.rowcount( )
if ll_row_cnt = 0 and not this.f_isgrid( ) then
	if not isvalid(lpo_handling) then
		this.f_getparentwindow( lw_parent)
		lpo_handling = lw_parent.dynamic f_get_obj_handling()
	end if
	ldw_requester =  lw_parent.dynamic f_get_dwmain() 
	if ldw_requester = this  and lpo_handling.dynamic f_get_ib_changed_dwo_4edit() then
		//-- không làm gì hết--//
	else
		if this.ib_dummy_row_yn then
			ib_dummy_row = true
			ll_currow = this.event e_addrow( )
			this.event e_resetadding( )	
		end if
	end if
end if

ldw_requester = this
return this.f_send_message_to_object(ldw_requester , 'e_postsave')

end event

public function integer f_set_criteria_retreive ();/* Cài đk để truy xuất dữ liệu ít lại.

*/
return 0
end function

public function integer f_chk_ora_dberror (long vl_err_code);try
	choose case vl_err_code
		case 0
			return 1
		case 12899
//			gf_messagebox("msg_DuLieuNhapQuaDai")
		case 1400
//			gf_messagebox("datarequired")
		case 2292
//			gf_messagebox("delete_integrity")
		case 2291
//			gf_messagebox("no_match_integrity")
		case 3114
//			gf_messagebox("msg_KetNoiBiNgat")
		case 1
//			gf_messagebox("msg_NhapTrungDuLieu")
		case else
//			messagebox('db Error',vl_err_code)
	end choose
	return 1
catch (runtimeerror lre)
//	openwithparm(c_w_err, lre.text)
end try
end function

public function string f_chk_required_data ();/* Usage: khi save datawidnow, hàm kiểm tra tất cả các column bắt buộc nhập liệu
- return chuỗi tên cột bắt buộc nhập nhưng chưa có dữ liệu, null nếu ko có cột nào như thế */
string ls_dwo, ls_col_string, ls_colname, ls_datatype, ls_coltext
int  li_count, li_cols, li_idx, ll_cur_row
boolean lb_required
try
	ls_dwo = this.dataobject
	ll_cur_row = this.getrow( )
	if ll_cur_row < 1 then 
		setnull(ls_col_string)
		return ls_col_string
	end if
	DECLARE lcs_req_column cursor for
	SELECT dwcolumn from erp_dwcolumn_setup
	WHERE dwobject = :ls_dwo and company_id = :gi_user_comp_id and upper(mandatory_yn) = 'Y';
	open lcs_req_column;
	FETCH lcs_req_column  into :ls_colname;
	DO while sqlca.sqlcode = 0
		li_cols = integer(this.object.datawindow.column.count)
		FOR li_idx = 1 to li_cols
			if  this.describe( "#"+string(li_idx)+".name") = ls_colname then
				ls_coltext = this.describe( ls_colname+"_t.text")
				ls_datatype = this.describe( "#"+string(li_idx)+".coltype")
				CHOOSE CASE Lower ( Left ( ls_datatype , 5 ) )
					CASE "numbe", "long", "ulong", "real", "int"	
						real lr_data
						lr_data = this.getitemnumber( ll_cur_row, li_idx)
						if isnull(lr_data) then ls_col_string = ls_col_string + ls_coltext +","
					CASE "char(", "char"
						string ls_data
						ls_data = this.getitemstring( ll_cur_row, li_idx)
						if isnull(ls_data) or trim(ls_data) = '' then ls_col_string = ls_col_string + ls_coltext +","
					CASE "date"
						date ldt_data
						ldt_data = this.getitemdate( ll_cur_row, li_idx)
						if isnull(ldt_data) or trim(string(ldt_data)) = '' then ls_col_string = ls_col_string + ls_coltext +","
					case  "datet"
						datetime ldtm_data
						ldtm_data = this.getitemdatetime ( ll_cur_row, li_idx)
						if isnull(ldtm_data) or trim(string(ldtm_data)) = '' then ls_col_string = ls_col_string + ls_coltext +","
					CASE "decim"
					CASE "time", "times"
				END CHOOSE
				
				exit
				
			end if
		NEXT
		FETCH lcs_req_column  into :ls_colname;
	LOOP
	if not isnull(ls_col_string) then ls_col_string = left(ls_col_string,len(ls_col_string)-1)
	if  trim(ls_col_string) = '' then setnull(ls_col_string)
	return ls_col_string
catch (runtimeerror lre)
//	openwithparm(c_w_err, lre.text)
end try
end function

public function integer f_upd_lastmdf_by ();/* return 0 succeed, -1 error*/
long ll_currow
int li_cols, li_idx
string ls_updatetable, ls_updSQL, ls_where, ls_dbname, ls_coltype
any la_data
try
	// update created_by 
	ls_updatetable = this.describe( "DataWindow.Table.UpdateTable")
	ll_currow = this.getrow( )
	li_cols = integer(this.object.datawindow.column.count)
	ls_updSQL = "UPDATE "+ls_updatetable+ " SET last_mdf_by = '"+string(gi_userid)+"', last_mdf_date=sysdate"
	FOR li_idx =1 to li_cols
		if lower(this.describe( "#"+string(li_idx)+".Key"))="yes" then
			ls_dbname = this.describe( "#"+string(li_idx)+".dbname")
			ls_coltype = this.describe( "#"+string(li_idx)+".coltype")
			la_data = this.object.data[ll_currow,li_idx]
			CHOOSE CASE lower(ls_coltype)
				CASE 'number','int','long','decimal','real','ulong'
					if ls_where = '' then
						ls_where = " WHERE "+ls_dbname+" = "+string(la_data)
					else
						ls_where = ls_where+" AND "+ls_dbname+" = "+string(la_data)
					end if
				CASE ELSE //string
					if ls_where = '' then
						ls_where = " WHERE "+ls_dbname+" = '"+string(la_data)+"'"
					else
						ls_where = ls_where+" AND "+ls_dbname+" = '"+string(la_data)+"'"
					end if
			END CHOOSE
		end if
	NEXT
	ls_updSQL = ls_updSQL + ls_where
	EXECUTE IMMEDIATE :ls_updSQL;
//	if SQLCA.SQLCODE  = 0 then
//		commit;
//	else 
//		ROLLBACK;
//	end if
	return  SQLCA.SQLCODE 
	
catch (runtimeerror lre)
//	openwithparm(c_w_err, lre.text)
end try
end function

public subroutine f_set_dwdetail (ref t_dw_mpl rdw_master, string vs_keycol);/* set this la dw_detail, va chi ra dau la dw_master va cac key column cua dw_master*/
f_set_dwdetail(rdw_master,vs_keycol,vs_keycol)
end subroutine

public function integer f_reset ();int li_numdetails, li_i, li_rc = 1

If This.Reset() <> 1 Then Return -1
/*
if not this.f_isgrid( ) then
	ib_dummy_row = true
	this.event e_addrow( )
	this.event e_resetadding( )	
end if
*/
Return li_rc
	
	

end function

public function integer f_setredraw (boolean ab_switch);int li_numdetails, li_i, li_rc = 1

If IsNull(ab_switch) Then Return -1

If This.SetRedraw(ab_switch) <> 1 Then Return -1

li_numdetails = UpperBound(iadw_detail)
For li_i = 1 to li_numdetails
	If IsValid ( iadw_detail[li_i] ) Then
		li_rc = iadw_detail[li_i].SetRedraw(ab_switch)
		If li_rc <> 1 Then Exit
	End If
Next

Return li_rc
	
end function

public function t_dw_mpl f_getdwmaster ();t_dw_mpl ldw_null

If ib_isdetail Then
	If IsValid ( idw_master ) Then
		Return idw_master.dynamic f_GetDWMaster()
	Else
		SetNull(ldw_null)
		Return ldw_null
	End If
elseif ib_isshared then
	If IsValid ( idw_master ) Then
		Return idw_master
	Else		
		SetNull(ldw_null)
		Return ldw_null
	End If	
Else
	Return this
End If
end function

public function integer f_enable (boolean ab_switch);int li_numdetails, li_i, li_rc = 1, li_numshared
String	ls_switch = "yes"

If IsNull(ab_switch) Then Return -1

// Get No for True and Yes for False
If ab_switch Then ls_switch = "no"

// Enable/Disable the DW
//This.Modify("Datawindow.ReadOnly=~'"+ls_switch+"~'")
This.f_set_readonly(not ab_switch, true)

// Enable querymode on the  DW
if ab_switch then
	If This.inv_querymode.f_SetEnabled(ab_switch) <> 1 Then
		Return -1
	End If
end if

if not ab_switch then
	// Disable querymode on the  DW
	If This.inv_querymode.f_querymode(ab_switch) <> 1 Then
		Return -1
	End If
end if

li_numdetails = UpperBound(iadw_detail)
For li_i = 1 to li_numdetails
	If IsValid ( iadw_detail[li_i] ) Then
		li_rc = iadw_detail[li_i].dynamic f_Enable(ab_switch)
		If li_rc<> 1 Then Exit
	End If
Next

li_numshared = UpperBound(iadw_shared)
For li_i = 1 to li_numshared
	If IsValid ( iadw_shared[li_i] ) Then
		li_rc = iadw_shared[li_i].dynamic f_Enable(ab_switch)
		If li_rc<> 1 Then Exit
	End If
Next

Return li_rc
	
end function

public function integer f_accepttext ();int li_numdetails, li_i, li_rc = 1

If This.AcceptText() <> 1 Then Return -1

li_numdetails = UpperBound(iadw_detail)
For li_i = 1 to li_numdetails
	If IsValid( iadw_detail[li_i] ) Then
		li_rc = iadw_detail[li_i].dynamic f_AcceptText()
		If li_rc <> 1 Then Exit
	End If
Next

Return li_rc
end function

public function string f_get_pkcol ();/*================================
Lấy tên cột làm primary key của datawindow
---------------------------------------------------------
return: (string) tên cột
		: '' emtry string nếu không có primary key
=================================*/
int li_cols, li_idx
string ls_pkcol =''

li_cols =  integer(this.object.datawindow.column.count)
FOR li_idx = 1 to li_cols
	if lower(this.describe( '#'+string(li_idx)+'.key'))='yes' then
		ls_pkcol = this.describe('#'+string(li_idx)+'.name' ) +';'
	end if
NEXT
if ls_pkcol <>'' then ls_pkcol = left(ls_pkcol, len(ls_pkcol) - 1)
return ls_pkcol
end function

public function integer f_insertrow ();//int li_i

//This.DBCancel()
//This.f_Reset()
//This.InsertRow(0)
//For li_i = 1 to Upperbound(This.iadw_detail)
//	This.iadw_detail[li_i].DBCancel()
//	This.iadw_detail[li_i].f_Reset()
//	This.iadw_detail[li_i].InsertRow(0)
//Next
//
//For li_i = 1 to Upperbound(This.iadw_shared)
//	This.iadw_shared[li_i].DBCancel()
//	This.iadw_shared[li_i].f_Reset()
//	This.iadw_shared[li_i].InsertRow(0)
//Next

Return 1
end function

public subroutine f_set_dwdetail (ref t_dw_mpl rdw_master);/* set this la dw_detail, va chi ra dau la dw_master va cac key column cua dw_master*/
c_obj_service lobj_srv

ib_isdetail = true
idw_master = rdw_master

end subroutine

public function integer f_get_detail_keycol (ref string rs_key[]);int li_rt
rs_key = ias_detail_keycol
li_rt = upperbound(ias_detail_keycol)
return li_rt
end function

public function integer f_get_master_keycol (ref string rs_key[]);int li_rt
rs_key = ias_master_keycol
li_rt = upperbound(ias_master_keycol)
return li_rt 
end function

public subroutine f_set_dwdetail (ref t_dw_mpl rdw_master, string vs_master_keycol, string vs_detail_keycol);/* set this la dw_detail, va chi ra dau la dw_master va cac key column cua dw_master*/
c_obj_service lobj_srv

ib_isdetail = true
idw_master = rdw_master
lobj_srv.f_stringtoarray(vs_master_keycol, ';',ias_master_keycol ) 
lobj_srv.f_stringtoarray(vs_detail_keycol, ';',ias_detail_keycol ) 

end subroutine

public subroutine f_set_dwdetail (ref t_dw_mpl rdw_master, string vs_master_keycol, string vs_detail_keycol, boolean vb_cascade_del);/* set this la dw_detail, va chi ra dau la dw_master va cac key column cua dw_master*/
c_obj_service lobj_srv

ib_isdetail = true
ib_iscascade_del = vb_cascade_del
idw_master = rdw_master

lobj_srv.f_stringtoarray(vs_master_keycol, ';',ias_master_keycol ) 
lobj_srv.f_stringtoarray(vs_detail_keycol, ';',ias_detail_keycol ) 

end subroutine

public subroutine f_set_dwdetail (ref t_dw_mpl rdw_master, string vs_keycol, boolean vb_cascade_del);/* set this la dw_detail, va chi ra dau la dw_master va cac key column cua dw_master*/
f_set_dwdetail(rdw_master,vs_keycol,vs_keycol, vb_cascade_del)
end subroutine

public subroutine f_set_total (ref t_dw_mpl rdw_total, string vs_master_totalcol, string vs_detail_totalcol);/* set this la dw_detail, va chi ra dau la cot can update total cua master va cua detail tuong ung*/
//c_obj_service lobj_srv
//
//
//if not this.ib_isdetail then return
//
//ib_istotal_update = true
//idw_total = rdw_total
//
//lobj_srv.f_stringtoarray(vs_master_totalcol, ';',ias_master_totalcol ) 
//lobj_srv.f_stringtoarray(vs_detail_totalcol, ';',ias_detail_totalcol )
//
end subroutine

public function integer f_enter_focus (t_dw_mpl vdw_focus);t_w_main lw_parent
string ls_colname
ls_colname = this.getcolumnname( )
this.f_getparentwindow( lw_parent)
if ls_colname = this.f_getlastcolumn(true) then	
	if this.ib_editing then
		if lw_parent.event e_save( ) = -1 then return 1	
//		lw_parent.idw_focus = vdw_focus
//		lw_parent.idw_focus.setfocus()
//		if lw_parent.idw_focus.rowcount() = 0 then lw_parent.event e_add( )
		return 1
	end if	
end if


//end if
Send( Handle(This), 256, 9, long(0,0) )
return 1
end function

public function integer f_enter_focus (t_dw_mpl vdw_focus, boolean vb_lastrow);t_w_main lw_parent
string ls_colname
ls_colname = this.getcolumnname( )
this.f_getparentwindow( lw_parent)
if vb_lastrow then
	if this.getrow( ) = this.rowcount( ) then
		if ls_colname = this.f_getlastcolumn(true) then	
			vdw_focus.setfocus()
			if vdw_focus.rowcount() = 0 then lw_parent.event e_add( )
			return 1
		end if
	end if
	Send( Handle(This), 256, 9, long(0,0) )
	return 1
else
	if ls_colname = this.f_getlastcolumn(true) then	
		vdw_focus.setfocus()
		if vdw_focus.rowcount() = 0 then lw_parent.event e_add( )
		return 1
	end if
	Send( Handle(This), 256, 9, long(0,0) )
	return 1		
end if
end function

public function boolean f_check_struct_seq (string as_dataobject, string as_colname, long al_struct_id, string as_segment);character lc_last
String ls_colname, ls_data, ls_coltype, ls_test
int li_rtn
int li_dwcoltype, li_ref_id
string ls_receipt_col, ls_retrieve_col, ls_segment
long ll_struct_id

SELECT dwdatatype, ref_id, receipt_col, retrieve_col into :li_dwcoltype, :li_ref_id, :ls_receipt_col, :ls_retrieve_col
FROM erp_dwcolumn_setup
WHERE company_id = :gi_user_comp_id and 
	( (dwobject = :this.dataobject and dwcolumn=:as_colname)
	or 
	  ( struct_id = :al_struct_id  and dwcolumn = : as_segment) );
if sqlca.sqlcode = 0 then 
	if li_dwcoltype = 3 then 
		return true
	end if 
end if 
return false
end function

public function integer f_check_item_data (string vs_data, integer vi_dwdatatype, integer vi_ref_id, string vs_receipt_col, string vs_retrieve_col, string vs_column_nm);/*----------------------------------------------------------------------------------------------------------
Gọi window struct/value set để kiểm tra dữ liệu cho window nhập liệu chính
-----------------------------------------------------------------------------------------------------------*/
//c_dwservice	l_dwservice
//c_string  lcs_string
//ANY la_null
//setnull(la_null)
////t_w_main lw_parent
//c_struct lcs_struct
//c_struct_combination lcs_struct_combination
//string ls_depent_comlumn, ls_module
//date ld_date
//Integer li_rc, li_i, li_element, li_rt
//string lsa_receipt_col[], lsa_retrieve_col[], ls_depent_value, ls_depent_value_all
//long ll_editing_row, ll_index, ll_curr_index
//string lsr_receipt_col[]
//l_dwservice.f_stringtoarray( vs_receipt_col, ';', lsr_receipt_col[])
//for li_i = 1 to upperbound(lsr_receipt_col[])
//	if lsr_receipt_col[li_i] = vs_column_nm then 
//		ll_curr_index = li_i
//	end if 
//next 
//li_i = 0
//try
//	// Save editing row
//	ll_editing_row = this.getrow( )
//
//	// Prepare reference information
//	if vi_ref_id = 0 then
//		gf_messagebox('msg_no_setup_ref_id')
//		return 0
//	end if
//	if isnull(vs_receipt_col) or trim(vs_receipt_col)='' then
//		gf_messagebox('msg_no_setup_receipt')
//		return 0
//	end if
//
//	l_dwservice.ii_ref_id = vi_ref_id
//	l_dwservice.is_data = vs_data
//	l_dwservice.f_stringtoarray( vs_receipt_col, ';', lsa_receipt_col) 
//	
//	// Put data in the current column (suppress the '-')
//	This.SetText(vs_data)
//	
//	// Open the reference list window
//	//**** khog su ly struct seq   vi_dwdatatype = 3 
//	if vi_dwdatatype = 1 then //struct	  
//	//???	openwithparm(u_w_struct_popup, l_dwservice)	
//		ls_module =  lcs_struct.f_get_module(l_dwservice.ii_ref_id)
//		if isnull(vs_data) or trim(vs_data) = '' then 
//			l_dwservice.iaa_return_val[1] = 0
//			l_dwservice.iaa_return_val[2] =  ''
//			l_dwservice.iaa_return_val[3] =  ''		
//		else 
//			if lcs_struct_combination.f_countid(ls_module, vs_data,  l_dwservice.ii_ref_id) < 1 then 				
//				return 0
//			else 
//				l_dwservice.iaa_return_val[1] = lcs_struct_combination.f_getid( ls_module, vs_data,  l_dwservice.ii_ref_id)
//				l_dwservice.iaa_return_val[2] =  vs_data
//				l_dwservice.iaa_return_val[3] =  lcs_struct_combination.f_getname( ls_module, vs_data,  l_dwservice.ii_ref_id)
//		///////test-----------------------------------------------
//				for ll_index = 1 to upperbound(lsa_receipt_col[])
//					if not isnull(lsa_receipt_col[ll_index]) and trim(lsa_receipt_col[ll_index]) <> '' then 
//						try
//							if ll_index =1 then 
//								this.setitem( this.getrow(), lsa_receipt_col[ll_index], long(l_dwservice.iaa_return_val[ll_index]) )								
//							else 
//								this.setitem( this.getrow(), lsa_receipt_col[ll_index], l_dwservice.iaa_return_val[ll_index] )		
//							end if
//						catch( runtimeerror rte2)
//							gf_messagebox('msg_KieuDuLieuKhongDung')
//							return -1
//						end try				
//					end if
//			  next 
//			  ////--------------------------------------------
//			end if
//		end if 
//	elseif vi_dwdatatype = 2 then //value set
//		// Kiem tra type cua vaulueset
//		int li_set_type
//		SELECT evs.set_type into :li_set_type
//		from erp_value_set evs
//		where evs.set_id = :vi_ref_id;		
//		if sqlca.sqlcode <> 0 then
//			gf_messagebox('msg_ValueSetKkhongCoSetType')
//			return -1
//		end if		
//		// set retrieve value
//		if not isnull(vs_retrieve_col) and trim(vs_retrieve_col)<>'' then
//			l_dwservice.f_stringtoarray( vs_retrieve_col, ';', lsa_retrieve_col )
//			// lấy dữ liệu phụ thuộc
//
//			if li_set_type = 4 or li_set_type = 6 then
//				l_dwservice.iaa_retrieve_val[1] = vs_retrieve_col
//			elseif li_set_type = 2 then // khi struct co nhung value set phu tuoc
//				long ll_depent_id
//				//ll_depent_id = this.getitemnumber(ll_editing_row - 1, 'value_id')
//				ll_depent_id = this.getitemnumber(ll_editing_row , lsa_retrieve_col[1])
//				if ll_depent_id > 0 then
//					l_dwservice.iaa_retrieve_val[1] = ll_depent_id
//				else
//					gf_messagebox('msg_ChuCoGiaTriPhuThuoc')
//					return -1
//				end if
//			else
//				li_element = upperbound(lsa_retrieve_col)
//				FOR li_i = 1 to li_element
//					l_dwservice.iaa_retrieve_val[li_i] = this.f_getitemany(ll_editing_row, lsa_retrieve_col[li_i])
//				NEXT
//			end if
//		end if
//	
//		if li_set_type < 4  and  li_set_type <> 2 then
//			if li_i = 0 then li_i = 1
//			l_dwservice.iaa_retrieve_val[li_i] = gi_user_comp_id
//			l_dwservice.iaa_retrieve_val[li_i + 1] = gs_user_lang
//		end if
//		// ??? OpenWithParm(u_w_value_set, l_dwservice)
//		 if f_check_valueset(vs_data, l_dwservice, ll_curr_index ) = 0 then
//			// khong co du lieu value set.
//			return 0
//		 end if 
//		 
//		//set value
//		if li_set_type = 1  then 
//			if not isnull(l_dwservice) then 
//			  // dung dau cham phay de phan cach thu tu cac cot nhan gia tri tra ve tu struct.
//			  lcs_string.f_ParseToArray(vs_receipt_col , ';', lsa_receipt_col[])
//			  for ll_index = 1 to upperbound(lsa_receipt_col[])
//				if not isnull(lsa_receipt_col[ll_index]) and trim(lsa_receipt_col[ll_index]) <> '' then 
//					try
//						if ll_index =1 then 
//							this.setitem( this.getrow(), lsa_receipt_col[ll_index], long(l_dwservice.iaa_return_val[ll_index]) )								
//						else 
//							this.setitem( this.getrow(), lsa_receipt_col[ll_index], l_dwservice.iaa_return_val[ll_index] )		
//						end if
//					catch( runtimeerror rte1)
//						gf_messagebox('msg_KieuDuLieuKhongDung')
//						return -1
//					end try				
//				end if
//			  next 
//			end if 		
//		else // valueset			
//			// Check if value(s) was (were) selected and enough values were returned
//			if UpperBound(l_dwservice.iaa_return_val ) < upperbound(lsa_receipt_col) then
//				gf_messagebox('msg_return_val_not_enough')
//				// Reset text entered
//				This.SetText("")
//				// Reset focus on the requestor DW
//				This.SetFocus()
//				Return -1
//			End If
//			
//			// Set selected values in the columns
//			li_element = UpperBound(lsa_receipt_col)		
//			For li_i=1 To li_element
//				try
//					if lsa_receipt_col[li_i] <> vs_column_nm then 
//						This.SetItem(ll_editing_row,lsa_receipt_col[li_i], l_dwservice.iaa_return_val[li_i])	
//					end if	
//				catch( runtimeerror rte3)
//					gf_messagebox('msg_KieuDuLieuKhongDung')
//					return -1
//				end try
//			Next	
//			// Reset focus on the requestor DW
//			This.SetFocus()
//		end if			 
//	end if	
//
//	return 1
//catch (runtimeerror lre)
////	openwithparm(c_w_err, lre.text)
//	return 0
//end try
return 1
end function

public function integer f_upd_lastmdf_by (long vl_row);/* return 0 succeed, -1 error*/
long ll_currow
int li_cols, li_idx
string ls_updatetable, ls_updSQL, ls_where, ls_dbname, ls_coltype
any la_data

return 0
/*
try
	// update created_by 
	ls_updatetable = this.describe( "DataWindow.Table.UpdateTable")
//	ll_currow = this.getrow( )
	li_cols = integer(this.object.datawindow.column.count)
	ls_updSQL = "UPDATE "+ls_updatetable+ " SET last_mdf_by = '"+string(gi_userid)+"', last_mdf_date=sysdate "
	FOR li_idx =1 to li_cols
		if lower(this.describe( "#"+string(li_idx)+".Key"))="yes" then
			ls_dbname = this.describe( "#"+string(li_idx)+".dbname")
			ls_coltype = this.describe( "#"+string(li_idx)+".coltype")
			la_data = this.object.data[vl_row,li_idx]
			CHOOSE CASE lower(ls_coltype)
				CASE 'number','int','long','decimal','real','ulong'
					if ls_where = '' then
						ls_where = " WHERE "+ls_dbname+" = "+string(la_data)
					else
						ls_where = ls_where+" AND "+ls_dbname+" = "+string(la_data)
					end if
				CASE ELSE //string
					if ls_where = '' then
						ls_where = " WHERE "+ls_dbname+" = '"+string(la_data)+"'"
					else
						ls_where = ls_where+" AND "+ls_dbname+" = '"+string(la_data)+"'"
					end if
			END CHOOSE
		end if
	NEXT
	ls_updSQL = ls_updSQL + ls_where
	EXECUTE IMMEDIATE :ls_updSQL using ;

	return  SQLCA.SQLCODE 
	
catch (runtimeerror lre)
//	openwithparm(c_w_err, lre.text)
end try

*/
end function

public function integer f_upd_created_by (long vl_row);/* return 0 succeed, -1 error*/
long ll_currow
int li_cols, li_idx
string ls_updatetable, ls_updSQL, ls_where, ls_dbname, ls_coltype
any la_data

return 0
/*
try
	// update created_by
	ls_updatetable = this.describe( "DataWindow.Table.UpdateTable")
//	ll_currow = this.getrow( )
	li_cols = integer(this.object.datawindow.column.count)
		ls_updSQL = "UPDATE "+ls_updatetable+ " SET created_by = '"+string(gi_userid)+"', created_date= sysdate "
	FOR li_idx =1 to li_cols
		if lower(this.describe( "#"+string(li_idx)+".Key"))="yes" then
			ls_dbname = this.describe( "#"+string(li_idx)+".dbname")
			ls_coltype = this.describe( "#"+string(li_idx)+".coltype")
			la_data = this.object.data[vl_row,li_idx]
			CHOOSE CASE lower(ls_coltype)
				CASE 'number','int','long','decimal','real','ulong'
					if ls_where = '' then
						ls_where = "WHERE "+ls_dbname+" = "+string(la_data)
					else
						ls_where = ls_where+" AND "+ls_dbname+" = "+string(la_data)
					end if
				CASE ELSE
					if ls_where = '' then
						ls_where = "WHERE "+ls_dbname+" = '"+string(la_data)+"'"
					else
						ls_where = ls_where+" AND "+ls_dbname+" = '"+string(la_data)+"'"
					end if
			END CHOOSE
		end if
	NEXT
	ls_updSQL = ls_updSQL + ls_where
	EXECUTE IMMEDIATE :ls_updSQL;
//	if SQLCA.SQLCODE = 0 then 
//		COMMIT;
//	end if
	return SQLCA.SQLCODE
	
catch (runtimeerror lre)
//	openwithparm(c_w_err, lre.text)
end try

*/
end function

public function integer f_set_sort ();/*
return : 
	 1 co cai dat sort va sort thanh cong
	-1 co cai dat sort va sort KHONG thanh cong
   	 0 Khong cai dat sort, khong thuc hien sort   
*/
string ls_dataobject, ls_column, ls_sort_type, ls_sort
ls_dataobject = this.dataobject

declare cur_obj cursor for
	  select DWCOLUMN, SORT_TYPE
		from ERP_DWCOLUMN_SETUP
	 where DWOBJECT= :ls_dataobject
		and nvl(SORT_TYPE, 'none') in ('asc', 'desc')
		and company_id = :gi_user_comp_id
	 order by SORT_SEQ, SORT_TYPE ;
ls_sort = ''	 
open cur_obj;
fetch cur_obj into :ls_column, :ls_sort_type;
do while sqlca.sqlcode = 0
	ls_sort = ls_sort + ls_column + ' ' + ls_sort_type + ', '
	fetch cur_obj into :ls_column, :ls_sort_type;
loop;
close cur_obj;
if trim(ls_sort) <>  '' and not isnull(ls_sort) then 
	ls_sort = mid (ls_sort, 1, len(trim(ls_sort)) - 1 )
	this.setsort(ls_sort)
	if this.sort( ) > 0 then 
		return 1
	else 
		return -1
	end if 	
end if 
return 0
	
	

 
end function

public function integer f_check_limit (string vs_object_name, string vs_column_name, string vs_data);/*
return : 
	 1 co cai dat limit va nhap chua vuot qua gioi han
	-1 co cai dat limit va nhap qua gioi han (Limit)
   	 0 Khong cai dat limit, khong kiem tra limit   
*/
int li_result
string ls_dataobject, ls_column, ls_sort_type, ls_sort
long ll_limit
ls_dataobject = this.dataobject

select limit into :ll_limit
from DWCOLUMN_SETUP_HDR
where DWOBJECT= :vs_object_name
and nvl(limit, 0) > 0
and dwcolumn = :vs_column_name
and company_id = :gi_user_comp_id;

if isnull(ll_limit) then  ll_limit = 0
if ll_limit > 0 then 
	if len(vs_data) > ll_limit then 
	 	return -1
	else 
		return 1
	end if 
else
	return 0
end if 


end function

public function integer f_enter_focus (string vs_colname, ref tab rtab_goto);string ls_colname
int li_idx
//t_w_main		lw_parent
windowobject	lwo_tabpage[]
t_dw_mpl		ldw_goto

ls_colname = this.getcolumnname( )
//this.f_getparentwindow( lw_parent)

if ls_colname = vs_colname then
	rtab_goto.setfocus()
	lwo_tabpage = rtab_goto.control[rtab_goto.selectedTab].control
	FOR li_idx = 1 to upperbound(lwo_tabpage)
		If lwo_tabpage[li_idx].typeof() = Datawindow! Then
			ldw_goto = lwo_tabpage[li_idx]
//			rtab_goto.setfocus()
//			rtab_goto.selectTab(rtab_goto.selectedTab)
			ldw_goto.setfocus()
			return 1
		end if
	NEXT
else
	Send( Handle(This), 256, 9, long(0,0) )
	return 1			
end if
end function

public function integer f_buildrecwhereclause (t_ds_db vds_criteria, ref string as_where);String		ls_where, ls_criteria
String		ls_colname, ls_value
String		ls_coltype, ls_dbname
String		ls_values[], ls_empty[]
Integer	li_i, li_count, li_pos
Integer	li_j, li_nb_values
Boolean	lb_not
String		ls_obj_type, ls_logic

c_obj_service		lc_obj_service

// Get number of criterias
li_count = vds_criteria.rowcount()
if li_count > 0 then
	vds_criteria.setsort("logic desc")
	vds_criteria.sort()
else
	return -1
end if
// Build the WHERE clause with the criterias
For li_i = li_count To 1 step -1
	// Get the current criteria's value , Get column's name , Get logical operator
	ls_value = vds_criteria.getitemstring(li_i, 'value1')
	ls_colname = vds_criteria.getitemstring(li_i, 'col_name')
	ls_logic = vds_criteria.getitemstring(li_i, 'logic')
	// Ignore NULL values
	If IsNull(ls_value) or Len(ls_value) = 0 Then continue
	
	// Reset some variables
	lb_not = false
	ls_criteria = ""
	ls_values[] = ls_empty[]
	
	// Link the criterias with the AND operator
	If ls_where <> "" Then ls_where += " "+ls_logic+" "
	
	// Get column's DB name & type
	ls_dbname = this.describe(ls_colname + ".DBAlias")
	if pos(ls_dbname,'.')=1 then
		ls_dbname = this.describe(ls_colname + ".DBName")
	elseif ls_dbname = '!' then
		ls_dbname = ls_colname
	elseif ls_dbname = '?' then
		messagebox('Thông báo','f_buildrecwhereclause: Không lấy được dbalias')
		return -1
	end if
	ls_coltype = this.describe(ls_colname + ".ColType")
	ls_obj_type = this.describe(ls_colname + ".Edit.Style")
	
	// Add criteria to the WHERE clause depending on the column's datatype
	Choose Case Lower(Left(ls_coltype,5))
			
		Case "char("		
			
			// Build the beginning of the criteria (add upper only if necessary)
//			If idw_requestor.of_IsKeyColumn(ls_colname) Then
//				ls_criteria = "( " + ls_dbname + " "
//			Else
				ls_criteria = "( UPPER(" + ls_dbname + ") "
//			End If
			
			If Match(ls_value,"^> *[^=].*$") Then				// Check for the > wildcard
				ls_criteria += "> ~~'" + Upper(Trim(Mid(ls_value,2))) + "~~'"
			ElseIf Match(ls_value,"^>= *.+$") Then				// Check for the >= wildcard
				ls_criteria += ">= ~~'" + Upper(Trim(Mid(ls_value,3))) + "~~'"
			ElseIf Match(ls_value,"^< *[^=>].*$") Then		// Check for the < wildcard
				ls_criteria += "< ~~'" + Upper(Trim(Mid(ls_value,2))) + "~~'"
			ElseIf Match(ls_value,"^<= *.+$") Then				// Check for the <= wildcard
				ls_criteria += "<= ~~'" + Upper(Trim(Mid(ls_value,3))) + "~~'"
			ElseIf Match(ls_value,"^<> *( *)$") Then			// Check for the <>() wildcard (not null value)
				ls_criteria = "( " + ls_dbname + " IS NOT NULL"
			ElseIf Match(ls_value,"^( *)$") Then				// Check for the () wildcard (null value)
				ls_criteria = "( " + ls_dbname + " IS NULL"
			ElseIf Match(ls_value,"^<> *[^(*]+$") Then		// Check for the <> wildcard (with simple value)
				ls_criteria += "<> ~~'" + Upper(Trim(Mid(ls_value,3))) + "~~'"
			Else	// The criteria contains a list of values or is a simple value (maybe with *)
				If Match(ls_value,"^<> *.+$") Then				// Check for the <> wildcard
					lb_not = true
					// Remove the <>
					ls_value = Trim(Mid(ls_value,3))
				End If
				
				// Add 'not' keyword if necessary
				If lb_not Then ls_criteria += "NOT "
				
				If Match(ls_value,"^(.*[;:]+.+)$") Then		// Check for a list of values between brackets
					// Remove brackets
					ls_value = Trim(Mid(ls_value,2,Len(ls_value)-2))
					
					li_pos = Pos(ls_value,":")
					If li_pos > 0 Then								// This is a 'between' wildcard -> (ABC:ZZZ)
						// We must have 2 values
						ls_values[1] = Trim(Left(ls_value,li_pos -1))
						ls_values[2] = Trim(Mid(ls_value,li_pos +1))
						
						ls_criteria += "BETWEEN ~~'" + Upper(ls_values[1]) + "~~'" &
											+ " AND ~~'" + Upper(ls_values[2]) + "~~'"
					Else													// This is a 'in' wildcard -> (ABC;DEF;GHI;ZZZ)
						// Build criteria
						ls_criteria += "IN ( "
						
						// Get the list of values
						li_nb_values = lc_obj_service.f_StringToArray(ls_value,";",ls_values)
						
						// Check all the values
						For li_j=1 To li_nb_values
							// Add value to criteria
							ls_criteria += "~~'" + Upper(Trim(ls_values[li_j])) + "~~'"
							If li_j <> li_nb_values Then ls_criteria += " , "
						Next
						
						// Ending bracket for the IN
						ls_criteria += " )"
					End If
				Else														// Simple value (maybe containing *)
					li_pos = Pos(ls_value,"*")
					If li_pos > 0 Then								// This is a 'like'
						// Replace * by %
						ls_value = lc_obj_service.f_GlobalReplace(ls_value,"*","%")
						// Add value to criteria
						ls_criteria += "LIKE ~~'" + Upper(ls_value) + "~~'"
					Else													// Simple equality (=)
						// Add value to criteria
						ls_criteria += "= ~~'" + Upper(ls_value) + "~~'"
					End If
				End If
			End If
			
		Case "date","datet"
			
			// Build the beginning of the criteria
			ls_criteria = "( TRUNC(" + ls_dbname + ") "
			
			If Match(ls_value,"^> *[^=].*$") Then				// Check for the > wildcard			
				ls_criteria += "> TO_DATE(~~'" + Trim(Mid(ls_value,2)) + "~~',~~'YYYY-MM-DD~~')"
			ElseIf Match(ls_value,"^>= *.+$") Then				// Check for the >= wildcard
				ls_criteria += ">= TO_DATE(~~'" + Trim(Mid(ls_value,3)) + "~~',~~'YYYY-MM-DD~~')"
			ElseIf Match(ls_value,"^< *[^=>].*$") Then			// Check for the < wildcard
				ls_criteria += "< TO_DATE(~~'" + Trim(Mid(ls_value,2)) + "~~',~~'YYYY-MM-DD~~')"
			ElseIf Match(ls_value,"^<= *.+$") Then				// Check for the <= wildcard
				ls_criteria += "<= TO_DATE(~~'" + Trim(Mid(ls_value,3)) + "~~',~~'YYYY-MM-DD~~')"
			ElseIf Match(ls_value,"^<> *( *)$") &
				 Or Match(ls_value,"^\*$") Then					// Check for the <>() wildcard (not null value) 
				 															// Also accept a single '*' character
				ls_criteria = "( " + ls_dbname + " IS NOT NULL"
			ElseIf Match(ls_value,"^( *)$") Then				// Check for the () wildcard (null value)
				ls_criteria = "( " + ls_dbname + " IS NULL"
			ElseIf Match(ls_value,"^<> *[^(*]+$") Then		// Check for the <> wildcard (with simple value)
				ls_criteria += "<> TO_DATE(~~'" + Trim(Mid(ls_value,3)) + "~~',~~'YYYY-MM-DD~~')"
			Else	// The criteria contains a list of values or is a simple value
				If Match(ls_value,"^<> *.+$") Then				// Check for the <> wildcard
					lb_not = true
					// Remove the <>
					ls_value = Trim(Mid(ls_value,3))
				End If
				
				// Add 'not' keyword if necessary
				If lb_not Then ls_criteria += "NOT "
				
				If Match(ls_value,"^(.*[;:]+.+)$") Then		// Check for a list of values between brackets
					// Remove brackets
					ls_value = Trim(Mid(ls_value,2,Len(ls_value)-2))
					
					li_pos = Pos(ls_value,":")
					If li_pos > 0 Then								// This is a 'between' wildcard -> (ABC:ZZZ)
						// We must have 2 values
						ls_values[1] = Trim(Left(ls_value,li_pos -1))
						ls_values[2] = Trim(Mid(ls_value,li_pos +1))
						
						ls_criteria += "BETWEEN TO_DATE(~~'" + ls_values[1] + "~~',~~'YYYY-MM-DD~~')" &
											+ " AND TO_DATE(~~'" + ls_values[2] + "~~',~~'YYYY-MM-DD~~')"
					Else													// This is a 'in' wildcard -> (ABC;DEF;GHI;ZZZ)
						// Build criteria
						ls_criteria += "IN ( "
						
						// Get the list of values
						li_nb_values = lc_obj_service.f_StringToArray(ls_value,";",ls_values)
						
						// Check all the values
						For li_j=1 To li_nb_values
							// Add value to criteria
							ls_criteria += "TO_DATE(~~'" + Upper(Trim(ls_values[li_j])) + "~~',~~'YYYY-MM-DD~~')"
							If li_j <> li_nb_values Then ls_criteria += " , "
						Next
						
						// Ending bracket for the IN
						ls_criteria += " )"
					End If
				Else														// Simple equality (=)
					// Add value to criteria
					ls_criteria += "= TO_DATE(~~'" + ls_value + "~~',~~'YYYY-MM-DD~~')"
				End If
			End If
			
		Case "decim","numbe"
			
			// Build the beginning of the criteria
			ls_criteria = "( " + ls_dbname + " "
			
			// Replace ',' by '.'
			ls_value = lc_obj_service.f_GlobalReplace(ls_value,",",".")
			
			If Match(ls_value,"^> *[^=].*$") Then				// Check for the > wildcard			
				ls_criteria += "> " + Trim(Mid(ls_value,2))
			ElseIf Match(ls_value,"^>= *.+$") Then				// Check for the >= wildcard
				ls_criteria += ">= " + Trim(Mid(ls_value,3))
			ElseIf Match(ls_value,"^< *[^=>].*$") Then		// Check for the < wildcard
				ls_criteria += "< " + Trim(Mid(ls_value,2))
			ElseIf Match(ls_value,"^<= *.+$") Then				// Check for the <= wildcard
				ls_criteria += "<= " + Trim(Mid(ls_value,3))
			ElseIf Match(ls_value,"^<> *( *)$") &
				 Or Match(ls_value,"^\*$") Then					// Check for the <>() wildcard (not null value)
				 															// Also accept a single '*' character
				ls_criteria = "( " + ls_dbname + " IS NOT NULL"
			ElseIf Match(ls_value,"^( *)$") Then				// Check for the () wildcard (null value)
				ls_criteria = "( " + ls_dbname + " IS NULL"
			ElseIf Match(ls_value,"^<> *[^(*]+$") Then		// Check for the <> wildcard (with simple value)
				ls_criteria += "<> " + Trim(Mid(ls_value,3))
			Else	// The criteria contains a list of values or is a simple value (maybe with *)
				If Match(ls_value,"^<> *.+$") Then				// Check for the <> wildcard
					lb_not = true
					// Remove the <>
					ls_value = Trim(Mid(ls_value,3))
				End If
				
				// Add 'not' keyword if necessary
				If lb_not Then ls_criteria += "NOT "
				
				If Match(ls_value,"^(.*[;:]+.+)$") Then		// Check for a list of values between brackets
					// Remove brackets
					ls_value = Trim(Mid(ls_value,2,Len(ls_value)-2))
					
					li_pos = Pos(ls_value,":")
					If li_pos > 0 Then								// This is a 'between' wildcard -> (ABC:ZZZ)
						// We must have 2 values
						ls_values[1] = Trim(Left(ls_value,li_pos -1))
						ls_values[2] = Trim(Mid(ls_value,li_pos +1))
						
						ls_criteria += "BETWEEN " + ls_values[1] + " AND " + ls_values[2]
					Else													// This is a 'in' wildcard -> (ABC;DEF;GHI;ZZZ)
						// Build criteria
						ls_criteria += "IN ( "
						
						// Get the list of values
						li_nb_values = lc_obj_service.f_StringToArray(ls_value,";",ls_values)
						
						// Check all the values
						For li_j=1 To li_nb_values
							// Add value to criteria
							ls_criteria += Trim(ls_values[li_j])
							If li_j <> li_nb_values Then ls_criteria += " , "
						Next
						
						// Ending bracket for the IN
						ls_criteria += " )"
					End If
				Else														// Simple equality (=)
					//15878: Allow find by checkbox with value null
					If ls_obj_type = 'checkbox' And ls_value = '0' Then
						ls_criteria += '= 0 OR ' + ls_dbname + ' IS NULL'
					Else
						// Add value to criteria
						ls_criteria += "= " + ls_value
					End If
				End If
			End If
			
		Case "time"
			
			// Build the beginning of the criteria
			ls_criteria = "( TO_CHAR(" + ls_dbname + ",~~'HH24:MI:SS~~') "
			
			If Match(ls_value,"^> *[^=].*$") Then				// Check for the > wildcard			
				ls_criteria += "> TO_CHAR(TO_DATE(~~'" + Trim(Mid(ls_value,2)) + "~~',~~'HH24:MI:SS~~'),~~'HH24:MI:SS~~')"
			ElseIf Match(ls_value,"^>= *.+$") Then				// Check for the >= wildcard
				ls_criteria += ">= TO_CHAR(TO_DATE(~~'" + Trim(Mid(ls_value,3)) + "~~',~~'HH24:MI:SS~~'),~~'HH24:MI:SS~~')"
			ElseIf Match(ls_value,"^< *[^=>].*$") Then		// Check for the < wildcard
				ls_criteria += "< TO_CHAR(TO_DATE(~~'" + Trim(Mid(ls_value,2)) + "~~',~~'HH24:MI:SS~~'),~~'HH24:MI:SS~~')"
			ElseIf Match(ls_value,"^<= *.+$") Then				// Check for the <= wildcard
				ls_criteria += "<= TO_CHAR(TO_DATE(~~'" + Trim(Mid(ls_value,3)) + "~~',~~'HH24:MI:SS~~'),~~'HH24:MI:SS~~')"
			ElseIf Match(ls_value,"^<> *( *)$") &
				 Or Match(ls_value,"^\*$") Then					// Check for the <>() wildcard (not null value)
				 															// Also accept a single '*' character
				ls_criteria = "( " + ls_dbname + " IS NOT NULL )"
			ElseIf Match(ls_value,"^( *)$") Then				// Check for the () wildcard (null value)
				ls_criteria = "( " + ls_dbname + " IS NULL )"
			ElseIf Match(ls_value,"^<> *[^(*]+$") Then		// Check for the <> wildcard (with simple value)
				ls_criteria += "<> TO_CHAR(TO_DATE(~~'" + Trim(Mid(ls_value,3)) + "~~',~~'HH24:MI:SS~~'),~~'HH24:MI:SS~~')"
			Else	// The criteria contains a list of values or is a simple value (maybe with *)
				If Match(ls_value,"^<> *.+$") Then				// Check for the <> wildcard
					lb_not = true
					// Remove the <>
					ls_value = Trim(Mid(ls_value,3))
				End If
				
				// Add 'not' keyword if necessary
				If lb_not Then ls_criteria += "NOT "
				
				If Match(ls_value,"^(.*[;:]+.+)$") Then		// Check for a list of values between brackets
					// Remove brackets
					ls_value = Trim(Mid(ls_value,2,Len(ls_value)-2))
					
					li_pos = Pos(ls_value,":")
					If li_pos > 0 Then								// This is a 'between' wildcard -> (ABC:ZZZ)
						// We must have 2 values
						ls_values[1] = Trim(Left(ls_value,li_pos -1))
						ls_values[2] = Trim(Mid(ls_value,li_pos +1))
						
						ls_criteria += "BETWEEN TO_CHAR(TO_DATE(~~'" + ls_values[1] + "~~',~~'HH24:MI:SS~~'),~~'HH24:MI:SS~~')" &
											+ " AND TO_CHAR(TO_DATE(~~'" + ls_values[2] + "~~',~~'HH24:MI:SS~~'),~~'HH24:MI:SS~~')"
					Else													// This is a 'in' wildcard -> (ABC;DEF;GHI;ZZZ)
						// Build criteria
						ls_criteria += "IN ( "
						
						// Get the list of values
						li_nb_values = lc_obj_service.f_StringToArray(ls_value,";",ls_values)
						
						// Check all the values
						For li_j=1 To li_nb_values
							// Add value to criteria
							ls_criteria += "TO_CHAR(TO_DATE(~~'" + Upper(Trim(ls_values[li_j])) &
												+ "~~',~~'HH24:MI:SS~~'),~~'HH24:MI:SS~~')"
							If li_j <> li_nb_values Then ls_criteria += " , "
						Next
						
						// End the criteria
						ls_criteria += " )"
					End If
				Else														// Simple equality (=)
					// Add value to criteria
					ls_criteria += "= TO_CHAR(TO_DATE(~~'" + ls_value + "~~',~~'HH24:MI:SS~~'),~~'HH24:MI:SS~~')"
				End If
			End If
			
		Case Else
			// There was a problem getting the column type
			ls_criteria = "ERROR"
			
	End Choose
	
	// Check if the criteria was properly built
	If ls_criteria = "ERROR" Then
		// Return the error message
		as_where = "Error building criteria for column ~'" + ls_colname + "~'."
		Return -1
	End If
	
	// The criteria was build
	// -> Add the last bracket
	ls_criteria += " )"
	
	// Add criteria to WHERE Clause
	ls_where += ls_criteria
Next

// Set the where clause to be returned
as_where = ls_where

Return 1

end function

public function integer f_buildrecsql (ref string rs_recsql);//String		ls_recwhereclause, ls_recsql, ls_originalSQL
//string 		ls_role_str, ls_dw_name, ls_filter, ls_where
//int 			li_cnt
//long 		ll_role_id
//
//t_ds_db			lds_rec_criteria
//c_sql				lnv_sql
//
//lds_rec_criteria = create t_ds_db
//lds_rec_criteria.dataobject = 'd_c_w_rec_security_dw1'
//lds_rec_criteria.settransobject( sqlca)
//lds_rec_criteria.retrieve(gi_user_comp_id)
//
//ls_dw_name = this.dataobject
//if isnull(ls_dw_name) or ls_dw_name ='' then return 0
//
//ls_filter = "type = 'user' and ROLE_USER_ID ="+ string(gi_userid) +" and dw_name = '"+ ls_dw_name +"'"
//lds_rec_criteria.setfilter( ls_filter)
//lds_rec_criteria.filter( )
//
//if lds_rec_criteria.rowcount( ) = 0 then
//	DECLARE lc_role CURSOR FOR
//		SELECT ROLE_ID FROM ERP_ROLE_USER WHERE USER_ID = :gi_userid;
//	OPEN lc_role;
//	FETCH  lc_role into	 :ll_role_id;
//	
//	DO while sqlca.sqlcode = 0
//		if ls_role_str <> '' then ls_role_str = ls_role_str +","
//		ls_role_str += string(ll_role_id)
//		FETCH  lc_role into	 :ll_role_id;
//	LOOP
//	CLOSE lc_role;
//	if isnull(ls_role_str) or ls_role_str='' then return 0
//	ls_filter = "type = 'role' and pos(~""+ls_role_str+ "~", string(ROLE_USER_ID)) > 0 and dw_name = '"+ ls_dw_name +"'"
//	lds_rec_criteria.setfilter( ls_filter)
//	lds_rec_criteria.filter( )
//	if lds_rec_criteria.rowcount( ) = 0 then return 0
//end if
//
//// Get the updated where clause
//If this.f_buildrecwhereclause( lds_rec_criteria, ls_recwhereclause) <> 1 Then
//	MessageBox("DW  -> f_buildrecwhereclause : ", ls_recwhereclause)
//	Return -1
//End If
//
//// Check returned WHERE clause
//If ls_recwhereclause = "" Then
////	 If no criterias were entered, use original SQL
//	if this.f_getoriginalsql( rs_recSQL) <> 1 then
////		gf_messagebox('msg_ErrorGetOriginalSQL')
//		return -1
//	end if
//Else
//	// Criterias were entered and a new WHERE clause was built
//	// -> build the new SQL select statement
//	
//	// Use the original SQL as the basis for the query SQL
//	if this.f_getoriginalsql( ls_recsql) <> 1 then
//		gf_messagebox('msg_ErrorGetOriginalSQL')
//		return -1
//	end if	
//	
//	// Add the query where clause to the SQL statement
//	If lnv_sql.f_AddToWhereClause(ls_recsql, ls_recwhereclause,"AND") = 1 Then
//		// Save the query SQL
//		rs_recsql = ls_recsql
//	End If
//End If
//
//// Save new query WHERE clause
////is_querywhereclause = ls_querywhereclause
//
//destroy lds_rec_criteria
Return 1
//
end function

public function boolean f_check_foreign_key (string as_table_name, string as_id_colume_name, any aa_id_value);/*
Nội dung:Kiem tra co ton tai khoa ngoai  ko
---------------------------------------------------------------------------------------------
Biến:
	Tên									Diễn giải
- as_table_name 						Tên table
- as_id_colume_name				Tên cột ID của table
- aa_id_value							Giá trị của ID
----------------------------------------------------------------------------------------------
Trả về:
	- > 0 la co ton tai khoa ngoai
	- = 0 la ko ton tai khoa ngoai
*/
long ll_count
string ls_sql
ls_sql =  "SELECT count(*) FROM " + as_table_name + " WHERE nvl(" + as_id_colume_name + ", 0) = " + string(aa_id_value)

DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;
PREPARE SQLSA FROM :ls_sql;
OPEN DYNAMIC my_cursor ;
FETCH my_cursor INTO :ll_count ;
CLOSE my_cursor ;

if ll_count = 0 then 
	ls_sql =  "SELECT count(*) FROM " + as_table_name + " WHERE " + as_id_colume_name + " = '" + string(aa_id_value) +"'"	
	PREPARE SQLSA FROM :ls_sql;	
	OPEN DYNAMIC my_cursor ;	
	FETCH my_cursor INTO :ll_count ;
	CLOSE my_cursor ;		
end if 

if ll_count > 0 then 
	return true
end if 

return false
end function

protected function integer f_openwindow (string vs_open_window, string vs_receipt_col[], any vs_values_col_fillter[]);string ls_window_name, ls_value, ls_find, ls_data, ls_primary_col
string ls_fillter,ls_col_type,ls_error
int li_rt , li_pos
long li_i
boolean bValid ,lb_flag = false
t_w_main lw_opened, lw_parent ,lw_temp
window lw_activesheet

/*
Try	
//	bamboo-100.ib_has_rtn_btn= true	
	//This.f_getparentwindow( lw_parent)
	// kiểm tra nếu windown gọi tới đã được mở rồi thì chỉ cần cho nó lổi lên trên 
	lw_activesheet = t_w_mdi.GetFirstSheet()
	IF IsValid(lw_activesheet) THEN
     DO
		 bValid = IsValid (lw_activesheet) 
		 if  bValid  then 
		 	if lw_activesheet.classname( ) = vs_open_window then 
				lb_flag = true
				exit 
			 end if 
		end if 	 
		lw_activesheet = t_w_mdi.GetNextSheet(lw_activesheet)			 
	 LOOP WHILE bValid		
	END IF
	if lb_flag = true  then 
		lw_activesheet.BringToTop = TRUE 
		lb_flag = false 
	else
		li_rt = OpenSheet(lw_opened, vs_open_window, t_w_mdi, 0, layered!)
		If li_rt = -1 Then Return -1	
		//lw_opened.iw_parent = lw_parent
		//lw_parent.Enabled = false
		lw_opened.ib_child = false	
	end if 	
	//-----------------------------------------------------------------------------------------	
	if isvalid(lw_activesheet) then 
		lw_temp = lw_activesheet
	else
		lw_temp = lw_opened
	end if 
	t_dw_mpl ldw_master	
	ldw_master= lw_temp.idw_focus.f_getdwmaster( )
	lw_temp.post f_set_idwfocus(ldw_master)	
	ls_fillter =''	
	for li_i =1 to upperbound(vs_receipt_col) -1
		ls_col_type = f_get_column_type(vs_receipt_col[li_i]  ,lw_temp.idw_focus)
		choose case  ls_col_type
			case 'char'
				if not isnull(vs_values_col_fillter[li_i]) then 
					ls_fillter =  	ls_fillter +  vs_receipt_col[li_i] + " like '%"+ string(vs_values_col_fillter[li_i]) +"%'  and "
				end if	
			case  'int','long','deci','real','numb','ulon'
			if not isnull(vs_values_col_fillter[li_i]) then 
				ls_fillter=ls_fillter + vs_receipt_col[li_i] + " = " + string(vs_values_col_fillter[li_i]) 
			end if 	
		case 'date'
			if not isnull(vs_values_col_fillter[li_i]) then 
				ls_fillter=ls_fillter + vs_receipt_col[li_i] + " = " +    "  date('"+string(vs_values_col_fillter[li_i]) +"')  "
			end if 	
		case 'datet'	
			ls_fillter=ls_fillter + vs_receipt_col[li_i] + " = " +    "  datetime('"+string(vs_values_col_fillter[li_i]) +"')  "
		end choose					 
    next 	 
	 ls_col_type = f_get_column_type(vs_receipt_col[li_i]  ,lw_temp.idw_focus) 
	choose case  ls_col_type
			case 'char'
				if not isnull(vs_values_col_fillter[li_i]) then 
					ls_fillter =  ls_fillter +  vs_receipt_col[li_i] + " = '"+ string(vs_values_col_fillter[li_i]) +"'  and "
				end if	
			case  'int','long','deci','real','numb','ulon'
			if not isnull(vs_values_col_fillter[li_i]) then 
				ls_fillter=ls_fillter + vs_receipt_col[li_i] + " = " + string(vs_values_col_fillter[li_i]) 
			end if 	
		case 'date'
			if not isnull(vs_values_col_fillter[li_i]) then 
				ls_fillter=ls_fillter + vs_receipt_col[li_i] + " = " +    "  date('"+string(vs_values_col_fillter[li_i]) +"')  "
			end if 	
		case 'datet'	
			ls_fillter=ls_fillter + vs_receipt_col[li_i] + " = " +    "  datetime('"+string(vs_values_col_fillter[li_i]) +"')  "
		end choose		
		// bo ' and ' dang cuoi neu co
	select nvl( RTRIM(:ls_fillter ,' and '),'') into :ls_fillter   from dual 	;
	// không cài đặt cột phụ thuộc nào cả thì cho hiện ra tất cả 
	  if isnull(ls_fillter) then ls_fillter =''
     lw_temp.idw_focus.setfilter(ls_fillter)	  
	 lw_temp.idw_focus.filter( ) 
catch (RuntimeError e)
	
//	OpenWithParm(c_w_err,e.text)
End Try
return 1 
end function

public function string f_get_column_type (string vs_column_name, t_dw_mpl vd_t_tw_mpl);string ls_coltype
//vs_column_name = vd_t_tw_mpl.describe( ls_colname +'.name')		
ls_coltype = vd_t_tw_mpl.describe( vs_column_name +".coltype")
if left(lower(ls_coltype), 5) ='datet' then return left(lower(ls_coltype), 5)
return left(lower(ls_coltype), 4) 					

end function

public function integer f_check_column_name (string vs_column_name, t_dw_mpl vt_dw_mpl);string colname, colvariable
int i, icount
icount = integer(vt_dw_mpl.describe('DataWindow.Column.Count'))
FOR i = 1 TO icount
  colvariable = '#'+string(i)+'.name'
  colname = vt_dw_mpl.describe(colvariable)   
  if upper(trim(colname)) = upper(trim(vs_column_name)) then 
	return 1 
  end if 
NEXT
*/
return 0
end function

public function integer f_get_argument_list (ref string as_name[], ref string as_type[], t_dw_mpl adw_requestor);String ls_name[], ls_type[], ls_syntax, ls_arguments
Long ll_begin, ll_end, ll_index
// Get the DataWindow syntax
ls_syntax = adw_requestor.Describe("DataWindow.Syntax")
// Locate the arguments cluster
ll_begin = Pos(ls_syntax, "arguments=((", 1)
IF ll_begin = 0 THEN
// There are no arguments
RETURN 0
ELSE
// Go to the first argument
ll_begin += 11
END IF

// Locate the end of the arguments cluster
ll_end = Pos(ls_syntax, "))", ll_begin) + 1

// Get all of the arguments
ls_arguments = Mid(ls_syntax, ll_begin, ll_end - ll_begin)

// Tokenize the argument string
DO WHILE Len(ls_arguments) > 1
ll_index++

// Compute the begin and end of the argument name
ll_begin = Pos(ls_arguments, '"', 1) + 1
ll_end = Pos(ls_arguments, '"', ll_begin + 1)

// Store the argument name
ls_name[ll_index] = Mid(ls_arguments, ll_begin, ll_end - ll_begin)

// Remove the argument name from the list
ls_arguments = Mid(ls_arguments, ll_end + 1)

// Compute the begin and end of the argument type
ll_begin = Pos(ls_arguments, ',', 1) + 1
ll_end = Pos(ls_arguments, ")", 1)

// Store the argument type
ls_type[ll_index] = Trim(Mid(ls_arguments, ll_begin, ll_end - ll_begin))

// Remove the argument type from the list
ls_arguments = Trim(Mid(ls_arguments, ll_end + 1))
LOOP

// Return the arrays
as_name = ls_name
as_type = ls_type

RETURN ll_index

end function

protected function integer f_openreport (string vs_open_window, any lsa_values_col_retrieve[], string vs_datawindow_report, string vs_receipt_col[]);long ll_row,li_i ,ll_row_argumet
string ls_col_type ,ls_null
String ls_name[], ls_type[]
date ldt_from_date ,ldt_to_date 
datetime  ldtime_from_date ,ldtime_to_date
//u_w_report_preview lu_w_report_preview
//c_company lc_comp
/*
Try
	opensheet(lu_w_report_preview,t_w_mdi, 0, layered!)
	if not isvalid(lu_w_report_preview) then return -1 
	lu_w_report_preview.dw_1.dataobject = trim(vs_datawindow_report)
	lu_w_report_preview.dw_1.settransobject(sqlca)
	// lay dc kieu du lieu cua cac bien trong report de set gia tri cho dung neu no khong co trong form 
	f_get_argument_list(ls_name,ls_type,lu_w_report_preview.dw_1)  
	// nếu số argument trong report <> số biến trong cài đặt thì báo lỗi 
	
	if (upperbound(lsa_values_col_retrieve) <> upperbound(ls_name)) or ((upperbound(lsa_values_col_retrieve) <> upperbound(vs_receipt_col)))     then return -1 	
	setnull(ls_null)
	for ll_row = 1 to  upperbound(lsa_values_col_retrieve)		
			if  isnull( lsa_values_col_retrieve[ll_row]	) then 								
					ls_col_type =  left(lower(ls_type[ll_row]), 4) 	
					choose case  ls_col_type
						case 'char','stri'
							// trường hợp cài đặt internal và external nếu mà biến đó không có trong form click thì 
							// phải đặt tên biến theo quy chuẩn AS_INTERNAL ,AS_EXTERNAL  để xét giá tri mặc định 
							// AS_INTERNAl ='internal'  , AS_EXTERNAL = null 
							if  upper(trim(vs_receipt_col[ll_row])) = 'AS_INTERNAL'  then 
								lsa_values_col_retrieve[ll_row] ='internal' 
							elseif 	 upper(trim(vs_receipt_col[ll_row]))  ='AS_EXTERNAL' THEN
								lsa_values_col_retrieve[ll_row] = ls_null
							else
									lsa_values_col_retrieve[ll_row] = '%'
							end if 						
						case  'int','long','deci','real','numb','ulon'			
							// từ báo biểu ra báo biều nếu có biến AS_COMPANY_ID,AS_USER_ID  thì gán mac dinh cho no 
							if  upper(trim(vs_receipt_col[ll_row])) = 'AS_COMPANY_ID'  then 
									lsa_values_col_retrieve[ll_row] = gi_user_comp_id
							elseif 	upper(trim(vs_receipt_col[ll_row])) = 'AS_USER_ID'  then 	
								lsa_values_col_retrieve[ll_row] = gi_userid
							else
									lsa_values_col_retrieve[ll_row] = 0
							END IF 		
						// khi cài đặt phải theo nếu report nào truy vấn theo từ ngày tới ngày 
						// đặt cố định 2 biến đó tên  adt_from_date ,adt_to_date 
						// nếu có biến là adt_from_date thì lấy ngày đầu tháng của tháng hiện tại 
						// nếu có biến là adt_to_date thì lấy ngày cuối tháng cùa tháng hiên tại 
						// ngược lại lấy ngày hiện tại 
						case 'date'
						
							SELECT (ADD_MONTHS(LAST_DAY(sysdate) ,-1) +1), sysdate into  :ldt_from_date,:ldt_to_date  from dual;							
							if  Lower(trim(vs_receipt_col[ll_row])) = 'adt_from_date'  then 
								lsa_values_col_retrieve[ll_row]= ldt_from_date
							elseif  Lower(trim(vs_receipt_col[ll_row])) = 'adt_to_date'  then 
								lsa_values_col_retrieve[ll_row]= ldt_to_date
							else
								lsa_values_col_retrieve[ll_row] =today()
							end if 	
					case 'datet'	
							SELECT (ADD_MONTHS(LAST_DAY(sysdate) ,-1) +1), sysdate  into  :ldtime_from_date,:ldtime_to_date  from dual;		
							if  Lower(trim(vs_receipt_col[ll_row])) = 'adt_from_date'  then 
									lsa_values_col_retrieve[ll_row]= ldtime_from_date
							elseif  Lower(trim(vs_receipt_col[ll_row])) = 'adt_to_date'  then 
									lsa_values_col_retrieve[ll_row]= ldtime_to_date
							else
								lsa_values_col_retrieve[ll_row] =today()
							end if 	
					end choose		
			end if			
	next 		
	ll_row_argumet = upperbound(ls_name) 
	choose case ll_row_argumet
		case 1 
			ll_row = lu_w_report_preview.dw_1.retrieve(lsa_values_col_retrieve[1])
		case 2 
			ll_row =  lu_w_report_preview.dw_1.retrieve(lsa_values_col_retrieve[1], lsa_values_col_retrieve[2])
		case 3 
			ll_row = lu_w_report_preview.dw_1.retrieve(lsa_values_col_retrieve[1], lsa_values_col_retrieve[2], lsa_values_col_retrieve[3])
		case 4 
			ll_row = lu_w_report_preview.dw_1.retrieve(lsa_values_col_retrieve[1], lsa_values_col_retrieve[2], lsa_values_col_retrieve[3], lsa_values_col_retrieve[4])
		case 5 
			ll_row = lu_w_report_preview.dw_1.retrieve(lsa_values_col_retrieve[1], lsa_values_col_retrieve[2], lsa_values_col_retrieve[3], lsa_values_col_retrieve[4],lsa_values_col_retrieve[5])
		case 6
			ll_row = lu_w_report_preview.dw_1.retrieve(lsa_values_col_retrieve[1], lsa_values_col_retrieve[2], lsa_values_col_retrieve[3], lsa_values_col_retrieve[4],lsa_values_col_retrieve[5], &
								lsa_values_col_retrieve[6])
		case 7
			ll_row = lu_w_report_preview.dw_1.retrieve(lsa_values_col_retrieve[1], lsa_values_col_retrieve[2], lsa_values_col_retrieve[3], lsa_values_col_retrieve[4],lsa_values_col_retrieve[5], &
								lsa_values_col_retrieve[6], lsa_values_col_retrieve[7])
		case 8
			ll_row = lu_w_report_preview.dw_1.retrieve(lsa_values_col_retrieve[1], lsa_values_col_retrieve[2], lsa_values_col_retrieve[3], lsa_values_col_retrieve[4],lsa_values_col_retrieve[5], &
								lsa_values_col_retrieve[6], lsa_values_col_retrieve[7], lsa_values_col_retrieve[8])
		case 9						
		  	ll_row = lu_w_report_preview.dw_1.retrieve(lsa_values_col_retrieve[1], lsa_values_col_retrieve[2], lsa_values_col_retrieve[3], lsa_values_col_retrieve[4],lsa_values_col_retrieve[5], &
								lsa_values_col_retrieve[6], lsa_values_col_retrieve[7], lsa_values_col_retrieve[8], lsa_values_col_retrieve[9])
		case 10						
			ll_row = lu_w_report_preview.dw_1.retrieve(lsa_values_col_retrieve[1], lsa_values_col_retrieve[2], lsa_values_col_retrieve[3], lsa_values_col_retrieve[4],lsa_values_col_retrieve[5], &
								lsa_values_col_retrieve[6], lsa_values_col_retrieve[7], lsa_values_col_retrieve[8], lsa_values_col_retrieve[9], lsa_values_col_retrieve[10])
	end choose	
	if ll_row > 0 then 
    		lu_w_report_preview.dw_1.object.datawindow.print.preview = true		
		lu_w_report_preview.is_pic_path = lc_comp.f_loadpicture( )
		lu_w_report_preview.dw_1.object.p_logo.Filename = lu_w_report_preview.is_pic_path	 
	end if 
catch (RuntimeError e)
//	OpenWithParm(c_w_err,e.text)
End Try
*/
return 1 
end function

public function string f_get_datacolumn_name (string as_columnname, string as_receipt_col, string as_return_col);c_dwservice	l_dwservice
string lsa_receipt_col[] ,lsa_return_col[]
long ll_recept ,ll_return ,li,ll_find 
l_dwservice.f_stringtoarray( as_receipt_col, ';', lsa_receipt_col) 
l_dwservice.f_stringtoarray( as_return_col, ';', lsa_return_col) 
ll_recept =  upperbound(lsa_receipt_col)
ll_return = upperbound(lsa_return_col)
// cài đặt sai 
for li=1 to ll_recept 
	if upper(trim(as_columnname)) = upper(trim( lsa_receipt_col[li])) then 
		ll_find = li 
		exit 
	end if 
next 
if ll_find =0 then return ''
if ll_find > upperbound(lsa_return_col) then return ''
return  lsa_return_col[ll_find]

end function

public subroutine f_modify (t_dw_mpl at_dw_mpl, string as_columnname, string as_dataobject, string as_display_col);//d_addess
t_ds_db lds_01
string ls_colname, ls_colvariable,a
int i, icount
long ll_width =0 ,ll_total_width =0 ,ll_width_child
lds_01 = create t_ds_db
 at_dw_mpl.Modify( as_columnname+ '.dddw.name=' +  as_dataobject ) 		//as_dataobject
 if as_dataobject = 'd_c_w_struct_popup_3' then 
	 at_dw_mpl.Modify( as_columnname+ '.dddw.displaycolumn=str_code' ) 		
	 at_dw_mpl.Modify( as_columnname+ '.dddw.datacolumn=str_code') 
 else
	a= at_dw_mpl.Modify( as_columnname+ '.dddw.displaycolumn=' + as_display_col ) 		
	a=at_dw_mpl.Modify( as_columnname+ '.dddw.datacolumn=' + as_display_col ) 
 end if 	
a=at_dw_mpl.Modify( as_columnname+ '.dddw.autoretrieve=0' ) 		
a=at_dw_mpl.Modify( as_columnname+ '.dddw.useasborder=yes' ) 		//dddw.useasborder=yes 
at_dw_mpl.Modify( as_columnname+ '.dddw.hscrollbar=yes' )  ////dddw.hscrollbar=yes
at_dw_mpl.Modify( as_columnname+ '.dddw.hscrollbar=yes' )  ////dddw.hscrollbar=yes
at_dw_mpl.Modify( as_columnname+ '.dddw.vscrollbar=yes' )//dddw.vscrollbar=yes
at_dw_mpl.Modify( as_columnname+ '.dddw.allowedit=yes' )//dddw.allowedit=no
at_dw_mpl.Modify( as_columnname+ '.dddw.nilisnull=yes' )//dddw.nilisnull=yes
//at_dw_mpl.Modify( as_columnname+ '.dddw.showlist=yes' )// dddw.showlist=yes
ll_width = long(at_dw_mpl.Describe(as_columnname+'.width') )
lds_01.dataobject = as_dataobject
icount = integer(lds_01.describe('DataWindow.Column.Count'))
FOR i = 1 TO icount
  ls_colvariable = '#'+string(i)+'.name'
  ls_colname = lds_01.describe(ls_colvariable)   // #1.name, #2.name, etc  
  ll_total_width = ll_total_width + long(lds_01.Describe(ls_colname+'.width') )
NEXT
if  ll_total_width > this.width/2 then 
	ll_total_width = this.width/2
end if 
ll_total_width += 50;
if ll_width = 0 then ll_width =1 
ll_width_child =  (ll_total_width / ll_width) *100 

at_dw_mpl.Modify( as_columnname+ '.dddw.percentwidth=' +string(ll_width_child) )//dddw.percentwidth=300
 destroy lds_01
end subroutine

public function integer f_check_item_data (string vs_data, integer vi_dwdatatype, integer vi_ref_id, string vs_receipt_col, string vs_retrieve_col, string vs_column_nm, string vs_value_dep, string vs_column_dep);/*----------------------------------------------------------------------------------------------------------
Gọi window struct/value set để kiểm tra dữ liệu cho window nhập liệu chính
-----------------------------------------------------------------------------------------------------------*/
//c_dwservice	l_dwservice
//c_string  lcs_string
//ANY la_null
//setnull(la_null)
////t_w_main lw_parent
//c_struct lcs_struct
//c_struct_combination lcs_struct_combination
//string ls_depent_comlumn, ls_module
//date ld_date
//Integer li_rc, li_i, li_element, li_rt
//string lsa_receipt_col[], lsa_retrieve_col[], ls_depent_value, ls_depent_value_all
//long ll_editing_row, ll_index, ll_curr_index
//string lsr_receipt_col[]
//l_dwservice.f_stringtoarray( vs_receipt_col, ';', lsr_receipt_col[])
//for li_i = 1 to upperbound(lsr_receipt_col[])
//	if lsr_receipt_col[li_i] = vs_column_nm then 
//		ll_curr_index = li_i
//	end if 
//next 
//li_i = 0
//try
//	// Save editing row
//	ll_editing_row = this.getrow( )
//
//	// Prepare reference information
//	if vi_ref_id = 0 then
//		gf_messagebox('msg_no_setup_ref_id')
//		return 0
//	end if
//	if isnull(vs_receipt_col) or trim(vs_receipt_col)='' then
//		gf_messagebox('msg_no_setup_receipt')
//		return 0
//	end if
//
//	l_dwservice.ii_ref_id = vi_ref_id
//	l_dwservice.is_data = vs_data
//	l_dwservice.f_stringtoarray( vs_receipt_col, ';', lsa_receipt_col) 
//	
//	// Put data in the current column (suppress the '-')
//	This.SetText(vs_data)
//	
//	// Open the reference list window
//	//**** khog su ly struct seq   vi_dwdatatype = 3 
//	if vi_dwdatatype = 1 then //struct	  
//	//???	openwithparm(u_w_struct_popup, l_dwservice)	
//		ls_module =  lcs_struct.f_get_module(l_dwservice.ii_ref_id)
//		if isnull(vs_data) or trim(vs_data) = '' then 
//			l_dwservice.iaa_return_val[1] = 0
//			l_dwservice.iaa_return_val[2] =  ''
//			l_dwservice.iaa_return_val[3] =  ''		
//		else 
//			if lcs_struct_combination.f_countid(ls_module, vs_data,  l_dwservice.ii_ref_id) < 1 then 				
//				return 0
//			else 
//				l_dwservice.iaa_return_val[1] = lcs_struct_combination.f_getid( ls_module, vs_data,  l_dwservice.ii_ref_id)
//				l_dwservice.iaa_return_val[2] =  vs_data
//				l_dwservice.iaa_return_val[3] =  lcs_struct_combination.f_getname( ls_module, vs_data,  l_dwservice.ii_ref_id)
//		///////test-----------------------------------------------
//				for ll_index = 1 to upperbound(lsa_receipt_col[])
//					if not isnull(lsa_receipt_col[ll_index]) and trim(lsa_receipt_col[ll_index]) <> '' then 
//						try
//							if ll_index =1 then 
//								this.setitem( this.getrow(), lsa_receipt_col[ll_index], long(l_dwservice.iaa_return_val[ll_index]) )								
//							else 
//								this.setitem( this.getrow(), lsa_receipt_col[ll_index], l_dwservice.iaa_return_val[ll_index] )		
//							end if
//						catch( runtimeerror rte2)
//							gf_messagebox('msg_KieuDuLieuKhongDung')
//							return -1
//						end try				
//					end if
//			  next 
//			  ////--------------------------------------------
//			end if
//		end if 
//	elseif vi_dwdatatype = 2 then //value set
//		// Kiem tra type cua vaulueset
//		int li_set_type
//		SELECT evs.set_type into :li_set_type
//		from erp_value_set evs
//		where evs.set_id = :vi_ref_id;		
//		if sqlca.sqlcode <> 0 then
//			gf_messagebox('msg_ValueSetKkhongCoSetType')
//			return -1
//		end if		
//		// set retrieve value
//		if not isnull(vs_retrieve_col) and trim(vs_retrieve_col)<>'' then
//			l_dwservice.f_stringtoarray( vs_retrieve_col, ';', lsa_retrieve_col )
//			// lấy dữ liệu phụ thuộc
//
//			if li_set_type = 4 or li_set_type = 6 then
//				l_dwservice.iaa_retrieve_val[1] = vs_retrieve_col
//			elseif li_set_type = 2 then // khi struct co nhung value set phu tuoc
//				long ll_depent_id
//				//ll_depent_id = this.getitemnumber(ll_editing_row - 1, 'value_id')
//				ll_depent_id = this.getitemnumber(ll_editing_row , lsa_retrieve_col[1])
//				if ll_depent_id > 0 then
//					l_dwservice.iaa_retrieve_val[1] = ll_depent_id
//				else
//					gf_messagebox('msg_ChuCoGiaTriPhuThuoc')
//					return -1
//				end if
//			else
//				li_element = upperbound(lsa_retrieve_col)
//				FOR li_i = 1 to li_element
//					l_dwservice.iaa_retrieve_val[li_i] = this.f_getitemany(ll_editing_row, lsa_retrieve_col[li_i])
//				NEXT
//			end if
//		end if
//	
//		if li_set_type < 4  and  li_set_type <> 2 then
//			if li_i = 0 then li_i = 1
//			l_dwservice.iaa_retrieve_val[li_i] = gi_user_comp_id
//			l_dwservice.iaa_retrieve_val[li_i + 1] = gs_user_lang
//		end if
//		// ??? OpenWithParm(u_w_value_set, l_dwservice)
//		 if f_check_valueset(vs_data, l_dwservice, ll_curr_index, vs_value_dep, vs_column_dep ) = 0 then
//			// khong co du lieu value set.
//			return 0
//		 end if 
//		 
//		//set value
//		if li_set_type = 1  then 
//			if not isnull(l_dwservice) then 
//			  // dung dau cham phay de phan cach thu tu cac cot nhan gia tri tra ve tu struct.
//			  lcs_string.f_ParseToArray(vs_receipt_col , ';', lsa_receipt_col[])
//			  for ll_index = 1 to upperbound(lsa_receipt_col[])
//				if not isnull(lsa_receipt_col[ll_index]) and trim(lsa_receipt_col[ll_index]) <> '' then 
//					try
//						if ll_index =1 then 
//							this.setitem( this.getrow(), lsa_receipt_col[ll_index], long(l_dwservice.iaa_return_val[ll_index]) )								
//						else 
//							this.setitem( this.getrow(), lsa_receipt_col[ll_index], l_dwservice.iaa_return_val[ll_index] )		
//						end if
//					catch( runtimeerror rte1)
//						gf_messagebox('msg_KieuDuLieuKhongDung')
//						return -1
//					end try				
//				end if
//			  next 
//			end if 		
//		else // valueset			
//			// Check if value(s) was (were) selected and enough values were returned
//			if UpperBound(l_dwservice.iaa_return_val ) < upperbound(lsa_receipt_col) then
//				gf_messagebox('msg_return_val_not_enough')
//				// Reset text entered
//				This.SetText("")
//				// Reset focus on the requestor DW
//				This.SetFocus()
//				Return -1
//			End If
//			
//			// Set selected values in the columns
//			li_element = UpperBound(lsa_receipt_col)		
//			For li_i=1 To li_element
//				try
//					if lsa_receipt_col[li_i] <> vs_column_nm then 
//						This.SetItem(ll_editing_row,lsa_receipt_col[li_i], l_dwservice.iaa_return_val[li_i])	
//					end if	
//				catch( runtimeerror rte3)
//					gf_messagebox('msg_KieuDuLieuKhongDung')
//					return -1
//				end try
//			Next	
//			// Reset focus on the requestor DW
//			This.SetFocus()
//		end if			 
//	end if	
//
//	return 1
//catch (runtimeerror lre)
////	openwithparm(c_w_err, lre.text)
//	return 0
//end try
return 1
end function

private function integer f_check_valueset (string vs_data, ref c_dwservice vc_dwservice, integer vi_index, string vs_column_value, string vs_column_search);/*----------------------------------------------------------------------------------------------------------
Gọi window struct/value set để kiểm tra dữ liệu cho window nhập liệu chính
-----------------------------------------------------------------------------------------------------------*/
string ls_dwobject, ls_return_col, ls_retrieve_col, ls_title, ls_value
string lsa_return_col[]
int li_set_type,li_set_id, li_up_set_id
long ll_rows, ll_index
any la_null
setnull(la_null)
c_dwservice lc_dwservice
t_ds_db lds_datastore
lds_datastore = create t_ds_db 

// chuẩn bị các biến để retrieve dữ liệu
DECLARE lc_valueset cursor for
	SELECT evs.set_code, evs.set_type, evs.return_col, evs.up_set_id, evs.set_id
	from erp_value_set evs
	where evs.set_id = :vc_dwservice.ii_ref_id;
	
OPEN lc_valueset;
FETCH lc_valueset into :ls_dwobject, :li_set_type, :ls_return_col, :li_up_set_id, :li_set_id;
// retrieve dữ liệu
if sqlca.sqlcode = 0 then
	CLOSE lc_valueset;
	// get dataobject
	if li_set_type = 1  or li_set_type = 2 then		
		lds_datastore.dataobject ='dddw_valueset'		
		ls_return_col = 'value_code;value_desc;value_id'
	else
		lds_datastore.dataobject = ls_dwobject
	end if
	lds_datastore.settransobject(SQLCA)
	
	//retrieve data for lds_datastore	
	if li_set_type = 1 or li_set_type =2 then
		if  vc_dwservice.iaa_retrieve_val[1] = gi_user_comp_id then
			int li
			setnull(li)
			ll_rows = lds_datastore.retrieve(li_set_id,li )
		else
			ll_rows = lds_datastore.retrieve(li_set_id, vc_dwservice.iaa_retrieve_val[1])
		end if
	
	elseif li_set_type = 3 then
		ll_rows = lds_datastore.retrieve(vc_dwservice.iaa_retrieve_val[1],vc_dwservice.iaa_retrieve_val[2],vc_dwservice.iaa_retrieve_val[3], &
			vc_dwservice.iaa_retrieve_val[4], vc_dwservice.iaa_retrieve_val[5], vc_dwservice.iaa_retrieve_val[6], &
			vc_dwservice.iaa_retrieve_val[7],vc_dwservice.iaa_retrieve_val[8],vc_dwservice.iaa_retrieve_val[9],vc_dwservice.iaa_retrieve_val[10])
//	elseif li_set_type = 4 then
//		vc_dwservice.f_get_dwlist(string(vc_dwservice.iaa_retrieve_val[1]), lds_datastore )
//		ll_rows = lds_datastore.rowcount( )
//	elseif li_set_type = 5 then
//		if  isnull( vc_dwservice.iaa_retrieve_val[1]) or string(vc_dwservice.iaa_retrieve_val[1])='' then
//			vc_dwservice.f_get_dwcollist( lds_datastore)
//		else
//			vc_dwservice.f_get_dwcollist( vc_dwservice.iaa_retrieve_val[1], lds_datastore )
//		end if
//		ll_rows = this.dw_2.rowcount( )
//	elseif  li_set_type = 6 then
//		vc_dwservice.f_get_winlist(lds_datastore)
//		ll_rows = lds_datastore.rowcount( )	
	end if
end if
//vc_dwservice.iaa_return_col[vi_index]

vc_dwservice.f_stringtoarray(ls_return_col, ';', lsa_return_col[])
if isnull(vs_data) or trim(vs_data) = ''  then 
	for ll_index = 1  to upperbound(lsa_return_col[])		
			CHOOSE CASE Lower ( Left (  lds_datastore.describe( lsa_return_col[ll_index]+".coltype") , 5 ) )
				CASE "numbe", "long", "ulong", "real", "int"	
					vc_dwservice.iaa_return_val[ll_index] = 0
				CASE "char(", "char"
					vc_dwservice.iaa_return_val[ll_index] = ''
				CASE "date"
					//vc_dwservice.iaa_return_val[ll_index] = ''		
				CASE "datet"
				CASE "decim"
				CASE "time", "times"
			END CHOOSE
	next 
	return 1
end if 
  if ll_rows > 0 then 
	for ll_rows = 1 to lds_datastore.rowcount()
		lds_datastore.setitem( ll_rows, lsa_return_col[vi_index] , upper(lds_datastore.f_getitemany(ll_rows, lsa_return_col[vi_index])))
	next 
	if not (isnull(vs_column_value) or vs_column_value = '') and not (isnull(vs_column_search) or vs_column_search = '') then
		if this.getrow() > 0 then 
			ls_value = this.getitemstring(this.getrow(), vs_column_value)
		end if 
	end if 
	if not (isnull(ls_value) or ls_value = '') then
		ll_rows =  lds_datastore.find("trim("+lsa_return_col[vi_index]+ ") = '" + upper(vs_data)+ "' and " + vs_column_search + " ='" + ls_value + "'", 1, lds_datastore.rowcount( ))		
	else
		ll_rows =  lds_datastore.find("trim("+lsa_return_col[vi_index]+ ") = '" + upper(vs_data)+ "'", 1, lds_datastore.rowcount( ))
	end if 
	 if ll_rows > 0 then 
		for ll_index = 1  to upperbound(lsa_return_col[])	
			vc_dwservice.iaa_return_val[ll_index] = lds_datastore.f_getitemany(ll_rows, lsa_return_col[ll_index])
		next 
		return 1
	else 
		return 0	
	end if 
else 
	return 0
end if 



end function

public function integer f_select (string vs_data, integer vi_dwdatatype, integer vi_ref_id, string vs_receipt_col, string vs_retrieve_col, string vs_not_excute_itemchage_yn, string vs_insert_struct_yn);/*----------------------------------------------------------------------------------------------------------
Gọi window struct/value set để chọn dữ liệu trả về cho window nhập liệu chính
-----------------------------------------------------------------------------------------------------------*/
//c_dwservice	l_dwservice
//c_string  lcs_string
////t_w_main lw_parent
//string ls_depent_comlumn
//date ld_date
//Integer li_rc, li_i, li_element, li_rt
//string lsa_receipt_col[], lsa_retrieve_col[], ls_depent_value, ls_depent_value_all
//long ll_editing_row, ll_index
//
////u_w_struct_popup lu_w_struct_popup
//try
//	// Save editing row
//	ll_editing_row = this.getrow( )
//
//	// Prepare reference information
//	if vi_ref_id = 0 then
//		gf_messagebox('msg_no_setup_ref_id')
//		return 0
//	end if
//	if isnull(vs_receipt_col) or trim(vs_receipt_col)='' then
//		gf_messagebox('msg_no_setup_receipt')
//		return 0
//	end if
//
//	l_dwservice.ii_ref_id = vi_ref_id
//	l_dwservice.is_data = vs_data
//	l_dwservice.is_insert_struct_yn = vs_insert_struct_yn
//	l_dwservice.f_stringtoarray( vs_receipt_col, ';', lsa_receipt_col) 
//	
//	// Put data in the current column (suppress the '-')
//	This.SetText(vs_data)
////	this.accepttext( )
//	// Open the reference list window
//	if vi_dwdatatype = 1 or vi_dwdatatype = 3 then //struct	
//	    // kieu cau truc sequence.
//	    if vi_dwdatatype = 3 then
//			c_struct lcs_struct
//			// xu lay ngay phu thuoc
//			ls_depent_comlumn = lcs_struct.f_getdepentdatecol( l_dwservice.ii_ref_id ) 
//			if not isnull(ls_depent_comlumn) then 
//				ld_date = date(this.getitemdatetime(this.getrow(), ls_depent_comlumn))
//				if isnull(ld_date) then 
//					gf_messagebox('msg_PhaiNhapNgayPhuThuocTruoc')	
//					return 0
//				else 
//					l_dwservice.iaa_return_val[1] = ld_date
//				end if 
//			end if	
//			// xu ly gia tri phu thuoc
//			if not isnull(vs_retrieve_col) and trim(vs_retrieve_col)<>'' then
//				l_dwservice.f_stringtoarray( vs_retrieve_col, ';', lsa_retrieve_col )
//				li_element = upperbound(lsa_retrieve_col)
//				FOR li_i = 1 to li_element
//					ls_depent_value = string(this.f_getitemany(ll_editing_row, lsa_retrieve_col[li_i])) 
//					if isnull(ls_depent_value) then
//						gf_messagebox('msg_ChuaNhapGtriCotPhuThuoc' + ';' + lsa_retrieve_col[li_i] )
//						return -1
//					end if
//					ls_depent_value_all = ls_depent_value_all + ls_depent_value + ';'
//				NEXT
//				ls_depent_value_all = left(ls_depent_value_all, len(ls_depent_value_all) - 1)
//				l_dwservice.iaa_retrieve_val[1] = ls_depent_value_all
//			end if
//		end if 
////		openwithparm(lu_w_struct_popup, l_dwservice, 'u_w_struct_popup')	
//	elseif vi_dwdatatype = 2 then //value set
//		// Kiem tra type cua vaulueset
//		int li_set_type
//		SELECT evs.set_type into :li_set_type
//		from erp_value_set evs
//		where evs.set_id = :vi_ref_id;		
//		if sqlca.sqlcode <> 0 then
//			gf_messagebox('msg_ValueSetKkhongCoSetType')
//			return 0
//		end if		
//		// set retrieve value
//		if not isnull(vs_retrieve_col) and trim(vs_retrieve_col)<>'' then
//			l_dwservice.f_stringtoarray( vs_retrieve_col, ';', lsa_retrieve_col )
//			// lấy dữ liệu phụ thuộc
//
//			if li_set_type = 4 or li_set_type = 6 then
//				l_dwservice.iaa_retrieve_val[1] = vs_retrieve_col
//			elseif li_set_type = 2 then // khi struct co nhung value set phu tuoc
//				long ll_depent_id
//				//ll_depent_id = this.getitemnumber(ll_editing_row -1, 'value_id')
//				ll_depent_id = this.getitemnumber(ll_editing_row, lsa_retrieve_col[1])
//				if ll_depent_id > 0 then
//					l_dwservice.iaa_retrieve_val[1] = ll_depent_id
//				else
//					gf_messagebox('msg_ChuCoGiaTriPhuThuoc')
//					return -1
//				end if
//			else
//				li_element = upperbound(lsa_retrieve_col)
//				FOR li_i = 1 to li_element
//					l_dwservice.iaa_retrieve_val[li_i] = this.f_getitemany(ll_editing_row, lsa_retrieve_col[li_i])
//				NEXT
//			end if
//		end if
//	
//		if li_set_type < 4  and  li_set_type <> 2 then
//			if li_i = 0 then li_i = 1
//			l_dwservice.iaa_retrieve_val[li_i] = gi_user_comp_id
//			l_dwservice.iaa_retrieve_val[li_i + 1] = gs_user_lang
//		end if
////		OpenWithParm(u_w_value_set, l_dwservice)
//	end if	
//	////////////////////////////////////
//	//--- Get return values -----///
//	/////////////////////////////////
//	l_dwservice = Message.PowerObjectParm
//	setnull(Message.PowerObjectParm)
//	
//	if not isvalid(l_dwservice) then 	return 0
//	if vi_dwdatatype = 1 or  vi_dwdatatype = 3 then 
//		if not isnull(l_dwservice) then 
//		  // dung dau cham phay de phan cach thu tu cac cot nhan gia tri tra ve tu struct.
//		  lcs_string.f_ParseToArray(vs_receipt_col , ';', lsa_receipt_col[])
//		  for ll_index = 1 to upperbound(lsa_receipt_col[])
//			if not isnull(lsa_receipt_col[ll_index]) and trim(lsa_receipt_col[ll_index]) <> '' then 
//				try
//					if ll_index =2 then 
//						this.settext( string(l_dwservice.iaa_return_val[ll_index]))
//					elseif ll_index = 1 then 
//						this.setitem( this.getrow(), lsa_receipt_col[ll_index], long(l_dwservice.iaa_return_val[ll_index]) )
//					else 
//						this.setitem( this.getrow(), lsa_receipt_col[ll_index], l_dwservice.iaa_return_val[ll_index] )							
//					end if
//				catch( runtimeerror rte1)
//					gf_messagebox('msg_KieuDuLieuKhongDung')
//					return 0
//				end try				
//			end if
//		  next 
//		end if 		
////	elseif  vi_dwdatatype = 3 then // struct_seq
////		this.setitem( this.getrow(),  lsa_receipt_col[1] , l_dwservice.iaa_return_val[1] )
////		this.setitem( this.getrow(),  lsa_receipt_col[2] , l_dwservice.iaa_return_val[2] )
////		this.setitem( this.getrow(),  lsa_receipt_col[3] , l_dwservice.iaa_return_val[3] )
//////		This.SetText(l_dwservice.iaa_return_val[2])
//	else // valueset			
//		// Check if value(s) was (were) selected and enough values were returned
//		if UpperBound(l_dwservice.iaa_return_val ) < upperbound(lsa_receipt_col) then
//			gf_messagebox('msg_return_val_not_enough')
//			// Reset text entered
//			This.SetText("")
//			// Reset focus on the requestor DW
//			This.SetFocus()
//			Return -1
//		End If
//		
//		// Set selected values in the columns
//		li_element = UpperBound(lsa_receipt_col)
//		if isnull(vs_not_excute_itemchage_yn) then vs_not_excute_itemchage_yn = 'N'
//		if vs_not_excute_itemchage_yn = 'Y' and this.event e_check_excute_itemchange(vs_receipt_col,  l_dwservice) then 
//			This.SetItem(ll_editing_row,lsa_receipt_col[1], l_dwservice.iaa_return_val[1])		
//		else 
//			this.settext( string(l_dwservice.iaa_return_val[1]))
//		end if 
//		For li_i=2 To li_element
//			try
//				This.SetItem(ll_editing_row,lsa_receipt_col[li_i], l_dwservice.iaa_return_val[li_i])			
//			catch( runtimeerror rte2)
//				gf_messagebox('msg_KieuDuLieuKhongDung')
//				return -1
//			end try
//		Next
//	
//		// Reset focus on the requestor DW
//		This.SetFocus()
//	end if	
	Return 0
//catch (runtimeerror lre)
////	openwithparm(c_w_err, lre.text)
//	return -1
//end try
end function

public function integer f_upd_track_info ();/* return 0 succeed, -1 error*/
string				ls_updatetable, ls_updSQL,ls_sysdate,ls_format
long					ll_idx
double				ladb_empty[]
datetime				ldt_sysdate
t_w_main			lw_parent
t_transaction		lt_tracsaction
c_datetime			lc_datet


ls_updatetable = this.describe( "DataWindow.Table.UpdateTable")
if this.f_getparentwindow(lw_parent ) = 1 then
	lw_parent.dynamic f_get_transaction(lt_tracsaction)
	if isvalid(lt_tracsaction) then
		ls_format = lc_datet.f_get_sessiondate_format_ex(lt_tracsaction )
		ls_sysdate = lc_datet.f_getsysdate_ex(ls_format + " hh24:mi:ss" , lt_tracsaction)		
		//-- update track infor when insert new record --//		
		FOR ll_idx =1 to upperbound(idb_insert_id[])
			ls_updSQL = "UPDATE "+ls_updatetable + &
								" SET created_by = "+string(gi_userid)+ & 
								", 	     created_date = to_date('" + ls_sysdate +"','"+ ls_format + " hh24:mi:ss') " + &
								", 	     last_mdf_date = to_date('" + ls_sysdate +"','"+ ls_format + " hh24:mi:ss') " + &
								", 	     last_mdf_by = "+string(gi_userid)+ & 
								"WHERE ID = "+ string(idb_insert_id[ll_idx])
								
			EXECUTE IMMEDIATE :ls_updSQL using lt_tracsaction ;
			if lt_tracsaction.sqlcode <> 0 then
				messagebox('ERROR', 'f_upd_track_info')
				return -1
			end if
		NEXT
		idb_insert_id[] = ladb_empty[]
		FOR ll_idx =1 to upperbound(idb_upd_id[])
			ls_updSQL = "UPDATE "+ls_updatetable + &
								" SET last_mdf_date = to_date('" + ls_sysdate +"','"+ ls_format + " hh24:mi:ss') " + &
								", 	     last_mdf_by = "+string(gi_userid)+ & 
								"WHERE ID = "+ string(idb_upd_id[ll_idx])
								
			EXECUTE IMMEDIATE :ls_updSQL  using lt_tracsaction;
			if lt_tracsaction.sqlcode <> 0 then
				messagebox('ERROR', 'f_upd_track_info')
				return -1
			end if
		NEXT
		idb_upd_id[] = ladb_empty[]
	else
		messagebox('ERROR', 'f_upd_track_info')
		return -1
	end if
else
	messagebox('ERROR', 'f_upd_track_info')
	return -1
end if

return 0
	

end function

public function integer f_setfocus ();/*******************************************************
Chức năng: setfocus dw và đặt con trỏ vào cột đầu tiên cho phép edit
----------------
Return:
	1 thành công
	-1 lỗi
	null nếu dw null
============================================*/
int				li_rtn
string		ls_first_col
li_rtn  = this.setfocus( )

if li_rtn = -1 then
	messagebox('loi','can message')
	return -1
end if

return li_rtn
end function

public subroutine f_set_dwmaster (ref t_dw_mpl rdw_detail, boolean vb_cascade_del, string vs_master_keycol, string vs_detail_keycol);///* set this la dw_master, va gan cac dw_deal*/
//int						li_idx
//c_obj_service 	lobj_srv
////-- set dwmaster --//
//this.ib_ismaster = true
//this.ib_iscascade_del = vb_cascade_del
//this.iadw_detail[1] = rdw_detail
//
////-- set detail --//
//rdw_detail.ib_isdetail = true
//rdw_detail.idw_master = this
//lobj_srv.f_stringtoarray(vs_master_keycol, ';',rdw_detail.ias_master_keycol ) 
//lobj_srv.f_stringtoarray(vs_detail_keycol, ';',rdw_detail.ias_detail_keycol ) 
//
end subroutine

public subroutine f_set_idw_master (datawindow vdw_master);idw_master = vdw_master
end subroutine

public function integer f_getdwdetails (ref datawindow rdw_details[]);int li_rt
rdw_details[] = iadw_detail[]
li_rt = UpperBound(iadw_detail)
Return li_rt 
end function

public function long f_retrieve_detail ();/*
return 1: success

*/
int 					li_idx, li_cnt
t_dw_mpl			ladw_details[]

FOR li_idx = 1 TO upperbound(iadw_detail[])
	iadw_detail[li_idx].dynamic event e_retrieve() 

	li_cnt = iadw_detail[li_idx].dynamic f_getdwdetails(ladw_details[])
	if li_cnt > 0 then
		iadw_detail[li_idx].dynamic f_retrieve_detail()
	end if
NEXT
return 1

end function

public function long f_reset_detail ();long 					ll_numdetails, ll_i, ll_rc
string					ls_filterString

ll_numdetails = UpperBound(iadw_detail)
if this.ib_isdetail then
	For ll_i = 1 to ll_numdetails
		If IsValid ( iadw_detail[ll_i] ) Then
			ls_filterString =  this.f_get_detail_filterString( iadw_detail[ll_i], false)
			iadw_detail[ll_i].setfilter(ls_filterString)
			iadw_detail[ll_i].filter()
			if iadw_detail[ll_i].dynamic f_get_ib_master() then
				ll_rc = iadw_detail[ll_i].dynamic f_reset_detail()
			end if
		End If
	Next	
else
	For ll_i = 1 to ll_numdetails
		If IsValid ( iadw_detail[ll_i] ) Then
			ll_rc = iadw_detail[ll_i].reset()
			if iadw_detail[ll_i].dynamic f_get_ib_master() then
				ll_rc = iadw_detail[ll_i].dynamic f_reset()
			end if
		End If
	Next
end if
Return ll_rc
	
end function

public subroutine f_set_ib_detail (boolean vb_detail);ib_isdetail = vb_detail

end subroutine

public subroutine f_set_master_keycol (string vas_keycol[]);ias_master_keycol [] = vas_keycol[]
end subroutine

public subroutine f_set_detail_keycol (string vas_keycol[]);ias_detail_keycol [] = vas_keycol[]
end subroutine

public function boolean f_get_ib_master ();return ib_ismaster

end function

public function boolean f_get_ib_update ();return this.f_get_ib_update(istr_security_attr, istr_rule_attr)

end function

public function boolean f_get_ib_delete ();
return this.f_get_ib_delete( istr_security_attr, istr_rule_attr)

end function

public function boolean f_get_ib_query ();return this.f_get_ib_query(istr_security_attr, istr_rule_attr)
end function

public function boolean f_get_ib_editing ();return ib_editing
end function

public function integer f_set_retrieve_args (any va_args[]);ia_retrieve_arg[]= va_args[]
return 1
end function

public function boolean f_is_company ();
string		ls_colvisible


ls_colvisible = this.Describe ("company_id.coltype" )
if ls_colvisible = '!' then 
	return false
end if
return true

end function

public function boolean f_is_branch ();
string		ls_colvisible


ls_colvisible = this.Describe ("branch_id.coltype" )
if ls_colvisible = '!' then 
	return false
end if
return true

end function

protected function integer f_buildwhereclause_of_masterkey (ref string as_where);		
string					ls_coltype, ls_dbname, ls_where, ls_value, ls_master_key_value
int						li_cols, li_idx
long					li_master_currow, ll_row
boolean				lb_master_found
datawindow			ldw_detail
c_string				lc_string
c_dwservice			lc_dwservice
s_object_display	lod_handle
window				lw_display

if ib_isdetail then	
	ls_where = as_where	
	if isvalid(idw_master) then
		if idw_master.dynamic f_get_ib_detail() then
			//-- detail cấp 2 --//
			ldw_detail = this
			if this.f_buildwhereclause_of_masterkey( idw_master, ldw_detail, as_where, ias_master_keycol[], ias_detail_keycol[]) = -1 then
				return -1
			end if
		else
			//-- detail cấp 1 --//				
			if this.f_getparentwindow(lw_display) =1 then
				lod_handle= lw_display.dynamic f_get_obj_handling()
			end if
			li_cols = upperbound(ias_master_keycol)
			FOR li_idx = 1 TO li_cols
				//-- Link the criterias with the AND operator --//
				If ls_where <> "" Then ls_where += " AND "		
				//-- lấy tên cột của detail --//
				ls_dbname =  ias_detail_keycol[li_idx]
				if lc_dwservice.f_get_build_column( this,ls_dbname, ls_colType) = -1 then
					return -1			
				end if					
				if lod_handle.ib_copying or lod_handle.ib_allocating then
					li_master_currow = this.idw_master.find( "gutter = 'Y'", 1, this.idw_master.rowcount())
				else
					li_master_currow = idw_master.getrow()
				end if
				DO while li_master_currow > 0					
					if not isnull(ls_master_key_value) and ls_master_key_value <>'' then
						ls_master_key_value +=';'
					end if
					ls_master_key_value += string(idw_master.dynamic f_getitemany(li_master_currow, ias_master_keycol[li_idx]))

					if lod_handle.ib_copying or lod_handle.ib_allocating then
						li_master_currow = this.idw_master.find( "gutter = 'Y'", li_master_currow+1, this.idw_master.rowcount()+1)
					else
						li_master_currow = 0
					end if
					lb_master_found = true
				LOOP				
				if not lb_master_found then
					ls_where =''
					exit
				end if
				if isnull(ls_master_key_value) then
					ls_master_key_value ='()'
				end if			
				if pos(ls_master_key_value,';')>0 then 
					ls_master_key_value = '('+ls_master_key_value+')'
				else
					if left(ls_colType, 4) = 'char' then
						if ls_master_key_value <> '()' then
							ls_master_key_value = '='+ls_master_key_value
						end if
					end if		
				end if
				ls_where += lc_string.f_get_expression(ls_master_key_value , ls_coltype, ls_dbname,'build where')			
				//xóa biến ls_master_key_value để tranh trường hợp cộng dồn do nhiều cột master key
				ls_master_key_value = ''
			NEXT	
			if ls_where <> '' then
				as_where = ls_where	
				return 1
			else
				as_where = " 1 = 0 "
				return 0
			end if
		end if
	else
		return -1
	end if
else
	return 0
end if

end function

public function boolean f_get_ib_detail ();return ib_isdetail

end function

protected function integer f_buildwhereclause_of_masterkey (ref datawindow rdw_master, ref datawindow rdw_detail, ref string as_where, string vas_master_keycol[], string vas_detail_keycol[]);
string					ls_orginalSQL_nowhere,ls_whereclause, ls_dbname, ls_tables[], ls_empty[], ls_where, ls_wheredetail3
string					las_master_keycol[], las_detail_keycol[], ls_colType, ls_where_4_copy
int						li_cols, li_idx, li_rtn, li_cnt
c_sql					lc_sql
t_s_sql_attr 				lastr_sql[]
c_dwservice				lc_dwservice
c_string						lc_string
t_dw_mpl					ldw_grandmaster, ldw_match
s_object_display			lc_obj_handling, lc_obj_parent
s_w_main					lw_parent, lw_grandparent
s_str_dwo_related		lstr_dwo_related[],lstr_dwo_related_tmp[]
	
if rdw_master.dynamic f_getCurrentSQL(ls_orginalSQL_nowhere, ls_whereclause) = 1 then
	li_rtn = lc_sql.f_parse(ls_orginalSQL_nowhere, lastr_sql[])
	if li_rtn = 1 then
		//-- Remove ORDER BY clause --//
		lastr_sql[1].s_order = ""		
		// Replace the selected columns of the detail by the linkage columns
		li_cols = UpperBound(vas_master_keycol[])
		lastr_sql[1].s_columns = ""				
		For li_idx = 1 To li_cols
			If li_idx > 1 Then lastr_sql[1].s_columns += ","
			ls_dbname = vas_master_keycol[li_idx] 
			if lc_dwservice.f_get_build_column( rdw_master,ls_dbname, ls_colType) = -1 then
				return -1			
			end if			

			lastr_sql[1].s_columns += ls_dbname
		Next
		//-- kiem tra where detail cấp 3 --//
		ldw_grandmaster = rdw_master.dynamic f_getdwmaster()
		if isvalid(ldw_grandmaster) then
			if ldw_grandmaster.f_get_ib_detail() then
				//-- detail cấp 3 --//
				rdw_master.dynamic f_get_master_keycol(las_master_keycol[])
				rdw_master.dynamic f_get_detail_keycol(las_detail_keycol[])
				li_rtn = this.f_buildwhereclause_of_masterkey( ldw_grandmaster, rdw_master, ls_wheredetail3, las_master_keycol[], las_detail_keycol[])				
			end if
		end if		
		
		if ls_wheredetail3 <>'' then 
			lastr_sql[1].s_where = ls_wheredetail3
		else 
			lastr_sql[1].s_where = ls_whereclause
		end if
		
		// Rebuild the detail SQL
		ls_orginalSQL_nowhere = lc_sql.f_Assemble(lastr_sql)
		
		// Prepare the main Query where clause
		ls_where += "("
		
		// Copy master columns & tables locally for faster access
		li_cols = UpperBound(vas_detail_keycol)
		For li_idx = 1 To li_cols
			If li_idx > 1 Then ls_where += ","
			// Add linkage column
			ls_dbname = vas_detail_keycol[li_idx] 
			if lc_dwservice.f_get_build_column( rdw_detail,ls_dbname, ls_colType) = -1 then
				return -1			
			end if					

			ls_where += ls_dbname
		Next
		
		// Finish add of the detail SQL
		ls_where += ") IN (" + ls_orginalSQL_nowhere + ")"		
		//-- kiêm tra form copy --//
		this.f_getparentwindow( lw_parent)
		lc_obj_handling = lw_parent.f_get_obj_handling( )
		if lc_obj_handling.ib_copying or lc_obj_handling.ib_allocating then
			lw_grandparent = lw_parent.f_getparentwindow( )
			lc_obj_parent = lw_grandparent.f_get_obj_handling( )					
			li_cnt = lc_obj_handling.f_get_data_related( lc_obj_parent.classname( ) , lstr_dwo_related_tmp[])
			if li_cnt = 2 then
				//-- cùng 1 đối tượng nhưng có quan hệ FROM TO khác nhau --//
				//-- lúc khai báo related phải khai báo FROM trước TO sau --//
				//-- trường hợp hiện tại là phiếu xuất tạo phiếu nhập, phiếu nhập tạo phiếu xuất --//
				if lstr_dwo_related_tmp[1].b_f_matching and not lstr_dwo_related_tmp[1].b_t_matching and &
					not lstr_dwo_related_tmp[2].b_f_matching and lstr_dwo_related_tmp[2].b_t_matching then
					lstr_dwo_related[1] = lstr_dwo_related_tmp[1]
				else
					lstr_dwo_related = lstr_dwo_related_tmp
				end if
			else
				lstr_dwo_related = lstr_dwo_related_tmp
			end if
			li_cnt = upperbound(lstr_dwo_related[])
			if li_cnt = 1 then
				if upperbound(lstr_dwo_related[1].s_match_f_dwo[]) >0 then
					ldw_match = lw_parent.f_get_dw( lstr_dwo_related[1].s_match_f_dwo[1])
					if not isvalid(ldw_match) or ldw_match.dataobject = '' then
						//--Lỗi khai báo str copy bị sai tên dw
						gf_messagebox('m.t_dw_mpl.f_buildwhere_of_masterkey.01','Thông báo','Không tìm thấy DWO:@'+ lstr_dwo_related[1].s_match_f_dwo[1],'exclamation','ok',1)
						return -1
					end if
					if left(ldw_match.dataobject, len(ldw_match.dataobject)-5) = left(this.dataobject, len(this.dataobject)-5) then
						ls_where_4_copy = lc_dwservice.f_buildwhere_line_4_copy(lstr_dwo_related[1] , ldw_match)
					end if
				end if
			else
				gf_messagebox('m.t_dw_mpl.f_buildwhere_of_masterkey.02','Thông báo','Cấu trúc related dwo không có đúng 1 đối tượng liên quan: b_doc.e_window_postopen_child.01: line12','exclamation','ok',1)
				return -1
			end if			
		end if
		if ls_where_4_copy <> '' then
			ls_where = ls_where + ' AND ' + ls_where_4_copy
		end if
		as_where =ls_where
	end if

	return 1
else
	return -1
end if

return 0

end function

protected function integer f_get_masterkeys (ref any va_keyvalues[], ref string vs_keydbnames[], ref string vs_keycoltypes[]);
int						li_idx, li_cols
long					li_master_currow


if ib_isdetail then	
	if isvalid(idw_master) then
		//-- detail cấp 1 --//
		li_cols = upperbound(ias_master_keycol)
		li_master_currow = idw_master.getrow()
		if li_master_currow > 0 then
			FOR li_idx = 1 TO upperbound(ias_master_keycol)
				va_keyvalues[li_idx] = idw_master.dynamic f_getitemany(li_master_currow, ias_master_keycol[li_idx])
				vs_keycoltypes[li_idx] = this.describe(ias_detail_keycol[li_idx] + ".ColType")
				vs_keydbnames[li_idx] = this.describe(ias_detail_keycol[li_idx] + ".DBAlias")
				if pos(vs_keydbnames[li_idx],'.') = 1 then
					vs_keydbnames[li_idx] = this.describe(ias_detail_keycol[li_idx] + ".DBName")
				elseif  vs_keydbnames[li_idx] = '!' then
					vs_keydbnames[li_idx] = ias_detail_keycol[li_idx]
				elseif vs_keydbnames[li_idx] = '?' then
					messagebox('Thông báo','f_get_masterkeys:Không lấy được DBalias')
					return -1
				end if
			NEXT			
			return 1
		else
			return -1
		end if
	else
		return -1
	end if
else
	return 0
end if

end function

public function integer f_send_message_to_object (ref datawindow vdw_focus, long vl_currentrow, string vs_colname, string vs_editdata, string vs_message);int 					li_rtn
powerobject		lpo_handling
window				lw_display
if this.f_getparentwindow( lw_display) = 1 then
	lpo_handling = lw_display.dynamic f_get_obj_handling()
	if isvalid(lpo_handling) then
		return lpo_handling.dynamic f_handle_message(vdw_focus,vl_currentrow,vs_colname, vs_editdata, vs_message)
	end if
end if
return -1
end function

public function boolean f_get_ib_cascade_del ();return ib_iscascade_del

end function

public function integer f_set_ib_ref_table_yn (boolean vb_ref_table_yn);ib_ref_table_yn = vb_ref_table_yn
return 1
end function

public function boolean f_get_ib_ref_table_yn ();return ib_ref_table_yn
end function

public function integer f_set_ref_table_field (string vs_ref_table_field);is_ref_table_field = vs_ref_table_field
return 1
end function

public function integer f_set_ib_master (boolean vb_master);ib_ismaster = vb_master
return 1
end function

public function integer f_set_ib_cascade_del (boolean vb_cascade_del);ib_iscascade_del = vb_cascade_del
return 1
end function

public function string f_get_ref_table_field ();return is_ref_table_field
end function

public function boolean f_get_ib_insert ();return this.f_get_ib_insert( istr_security_attr, istr_rule_attr)

end function

public function boolean f_get_ib_displaying ();return ib_displaying
end function

public function integer f_setfocus (ref datawindow rdw_focus);/*******************************************************
Chức năng: setfocus dw và đặt con trỏ vào cột đầu tiên cho phép edit
----------------
Return:
	1 thành công
	-1 lỗi
	null nếu dw null
============================================*/
int				li_rtn
string		ls_first_col
li_rtn  = rdw_focus.setfocus( )

if li_rtn = -1 then
	messagebox('loi','can message')
	return -1
end if

return li_rtn
end function

public function integer f_set_ib_inserting (boolean vb_inserting);ib_inserting = vb_inserting
return 1
end function

public function integer f_send_message_to_object (ref datawindow vdw_focus, long vl_currentrow, long vl_newrow, string vs_message);int 					li_rtn
powerobject		lpo_handling
window				lw_display
if this.f_getparentwindow( lw_display) = 1 then
	lpo_handling = lw_display.dynamic f_get_obj_handling()
	if isvalid(lpo_handling) then
		return lpo_handling.dynamic f_handle_message(vdw_focus, vl_currentrow,vl_newrow, vs_message)
	end if
end if
return -1
end function

public subroutine f_set_ib_displaying (boolean vb_displaying);ib_displaying = vb_displaying

end subroutine

public subroutine f_set_dwmaster (ref datawindow radw_detail[], boolean vb_cascade_del, string vs_master_keycol[], string vs_detail_keycol[]);///* set this la dw_master, va gan cac dw_deal */
//int						li_idx
//string				las_master_keycol[], las_detail_keycol[]
//c_obj_service 	lobj_srv
//
//
////-- set dwmaster --//
//this.ib_ismaster = true
//this.ib_iscascade_del = vb_cascade_del
//this.ib_ref_table_yn = false
//this.iadw_detail[] = radw_detail[]
//
////-- set detail --//
//FOR li_idx = 1 to upperbound(radw_detail[])
//	if li_idx = 1 then radw_detail[li_idx].dynamic f_set_ib_displaying(true)
//	radw_detail[li_idx].dynamic f_set_ib_detail(true)
//	radw_detail[li_idx].dynamic f_set_idw_master(this)
//	lobj_srv.f_stringtoarray(vs_master_keycol[li_idx], ';', las_master_keycol[] ) 
//	radw_detail[li_idx].dynamic f_set_master_keycol(las_master_keycol[])
//	lobj_srv.f_stringtoarray(vs_detail_keycol[li_idx], ';',  las_detail_keycol[]) 
//	radw_detail[li_idx].dynamic f_set_detail_keycol(las_detail_keycol[])
//NEXT
//
//return 1
end subroutine

protected function integer f_groupcount ();string 				ls_temp
long 					li
long 					li_pos
long 					li_pos2
long 					li_groupcount
boolean				lb_groupnewpage[], lb_groupoutflag

ls_temp = this.describe("datawindow.bands")
li_pos = 1

do while li_pos > 0
	li_pos = pos(ls_temp,"header.",li_pos)

	if li_pos > 0 then
		li_groupcount ++
		li_pos ++
	end if

loop

return li_groupcount
end function

public function integer f_create_navigate_bttn ();string 		ls_button,ls_footer, ls_rtn
int				li_footerheight


li_footerheight = integer(this.describe('datawindow.footer.height'))
li_footerheight += 94
ls_footer = ' datawindow.footer.height = "' + string(li_footerheight) + '" '
if this.ib_grid_n_form then
	if this.f_isgrid( ) then 
		ls_button += 'create button(band=footer text="" filename="Pics\b_form.png" enabled=yes action="0" border="0" color="33554432" x="20" y="0" height="84" width="105" vtextalign="0" htextalign="0"  name=b_form visible="1"   font.face="Tahoma" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="67108864" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="1" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.tip="Chuyển dạng form" tooltip.transparency="0" transparency="0" )'	
	else
		ls_button += 'create button(band=footer text="" filename="Pics\b_grid.png" enabled=yes action="0" border="0" color="33554432" x="20" y="0" height="84" width="105" vtextalign="0" htextalign="0"  name=b_grid visible="1"   font.face="Tahoma" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="67108864" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="1" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.tip="Chuyển dạng lưới" tooltip.transparency="0" transparency="0" )'
	end if
end if
//ls_button += 'create button(band=footer text="" filename="Pics\b_first.png" enabled=yes action="0" border="0" color="33554432" x="125" y="0" height="84" width="105" vtextalign="0" htextalign="0"  name=b_first visible="1"   font.face="Tahoma" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="67108864" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="1" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.tip="Dòng đầu" tooltip.transparency="0" transparency="0" )'
//ls_button += 'create button(band=footer text="" filename="Pics\b_prior.png" enabled=yes action="0" border="0" color="33554432" x="230" y="0" height="84" width="105" vtextalign="0" htextalign="0"  name=b_prior visible="1"   font.face="Tahoma" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="67108864" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="1" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.tip="Dòng trước" tooltip.transparency="0" transparency="0" )'
//ls_button += 'create button(band=footer text="" filename="Pics\b_next.png" enabled=yes action="0" border="0" color="33554432" x="335" y="0" height="84" width="105" vtextalign="0" htextalign="0"  name=b_next visible="1"   font.face="Tahoma" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="67108864" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="1" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.tip="Dòng sau" tooltip.transparency="0" transparency="0" )'
//ls_button += 'create button(band=footer text="" filename="Pics\b_last.png" enabled=yes action="0" border="0" color="33554432" x="440" y="0" height="84" width="105" vtextalign="0" htextalign="0"  name=b_last visible="1"   font.face="Tahoma" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="67108864" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="1" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.tip="Dòng cuối" tooltip.transparency="0" transparency="0" )'

this.setredraw( false)
ls_rtn = this.Modify(ls_footer)
ls_rtn = this.Modify(ls_button)	
//this.SetPosition ( 'b_first', 'footer' , true )
//this.SetPosition ( 'b_prior', 'footer' , true )
//this.SetPosition ( 'b_next', 'footer' , true )
//this.SetPosition ( 'b_last', 'footer' , true )
this.setredraw( true)
return 0

end function

public function integer f_repaint_navigate_bttn (string vs_button);if vs_button = 'b_form' then
	if pos(this.describe(  vs_button + ".filename"), 'yellow', 1) = 0 then
		this.setredraw( false)
		this.modify( vs_button +".filename = 'Pics\"+  vs_button+ "_yellow.png'")
		this.setredraw( true)
	end if
else
	if pos(this.describe( "b_form.filename"), 'yellow', 1) > 0 then
		this.setredraw( false)
		this.modify( "b_form.filename = 'Pics\b_form.png'")
		this.setredraw( true)
	end if	
end if

if vs_button = 'b_grid' then
	if pos(this.describe(  vs_button + ".filename"), 'yellow', 1) = 0 then
		this.setredraw( false)
		this.modify( vs_button +".filename = 'Pics\"+  vs_button+ "_yellow.png'")
		this.setredraw( true)
	end if
else
	if pos(this.describe( "b_grid.filename"), 'yellow', 1) > 0 then
		this.setredraw( false)
		this.modify( "b_grid.filename = 'Pics\b_grid.png'")
		this.setredraw( true)
	end if	
end if

if vs_button = 'b_first' then
	if pos(this.describe(  vs_button + ".filename"), 'yellow', 1) = 0 then
		this.setredraw( false)
		this.modify( vs_button +".filename = 'Pics\"+  vs_button+ "_yellow.png'")
		this.setredraw( true)
	end if
else
	if pos(this.describe( "b_first.filename"), 'yellow', 1) > 0 then
		this.setredraw( false)
		this.modify( "b_first.filename = 'Pics\b_first.png'")
		this.setredraw( true)
	end if	
end if

if vs_button = 'b_prior' then
	if pos(this.describe(  vs_button + ".filename"), 'yellow', 1) = 0 then
		this.setredraw( false)
		this.modify( vs_button +".filename = 'Pics\"+  vs_button+ "_yellow.png'")
		this.setredraw( true)
	end if
else
	if pos(this.describe( "b_prior.filename"), 'yellow', 1) > 0 then
		this.setredraw( false)
		this.modify( "b_prior.filename = 'Pics\b_prior.png'")
		this.setredraw( true)
	end if	
end if

if vs_button = 'b_next' then
	if pos(this.describe(  vs_button + ".filename"), 'yellow', 1) = 0 then
		this.setredraw( false)
		this.modify( vs_button +".filename = 'Pics\"+  vs_button+ "_yellow.png'")
		this.setredraw( true)
	end if
else
	if pos(this.describe( "b_next.filename"), 'yellow', 1) > 0 then
		this.setredraw( false)
		this.modify( "b_next.filename = 'Pics\b_next.png'")
		this.setredraw( true)
	end if	
end if

if vs_button = 'b_last' then
	if pos(this.describe(  vs_button + ".filename"), 'yellow', 1) = 0 then
		this.setredraw( false)
		this.modify( vs_button +".filename = 'Pics\"+  vs_button+ "_yellow.png'")
		this.setredraw( true)
	end if
else
	if pos(this.describe( "b_last.filename"), 'yellow', 1) > 0 then
		this.setredraw( false)
		this.modify( "b_last.filename = 'Pics\b_last.png'")
		this.setredraw( true)
	end if	
end if
return 1
end function

public function integer f_set_ib_insert (boolean vb_insert);ib_insert = vb_insert
return 1
end function

public function integer f_set_ib_delete (boolean vb_delete);ib_delete = vb_delete
return 1
end function

public function integer f_set_ib_update (boolean vb_update);ib_update = vb_update
return 1
end function

public function integer f_set_ib_query (boolean vb_query);ib_query = vb_query
return 1
end function

public function integer f_set_ib_print (boolean vb_print);ib_print = vb_print
return 1
end function

public function integer f_set_ib_excel (boolean vb_excel);ib_excel = vb_excel
return 1
end function

public function string f_buildwhereclause ();int					li_idx, li_count,li_rtn
any				la_master_key_value[]
string 			ls_whereclause, ls_where_master, ls_related_dwo,ls_where_sob
string				ls_dwcolumns[],ls_criteria_of_dwcolumns[],ls_rtn, ls_dbname

window					lw_parent
t_dw_mpl					ldw_main
s_object_display		lpo_handling
s_str_dwo_related		lstr_data_related[]
c_dwservice				lc_service


ls_whereclause = this.f_buildwhereclause_of_company( )
ls_where_sob = this.f_buildwhereclause_of_sob( )
if ls_where_sob <> '' then
	if ls_whereclause<>'' then
		ls_whereclause = ls_whereclause + ' AND ' + ls_where_sob
	else
		ls_whereclause=ls_where_sob
	end if
end if
if this.f_getparentwindow( lw_parent) = 1 then
	ldw_main =  lw_parent.dynamic f_get_dwmain()
	//-- related object key hoac book key --//
	lpo_handling = lw_parent.dynamic f_get_obj_handling()
	if this = ldw_main or (lpo_handling.classname( ) = 'u_valueset' and this.ib_ismaster ) then		
		
		//-- build related key --//
		li_count = lpo_handling.dynamic f_get_data_related(lstr_data_related[])
		if li_count > 0 then
			//-- Nếu đã build where 1 lần rồi thì không build lại --//
			if not this.ib_first_buildwhere then return ''			
			li_rtn = lc_service.f_buildwhereclause_of_relation(lpo_handling, lstr_data_related[] )
			if li_rtn > 0 then						
				FOR li_idx = 1 to li_count
					if (not lstr_data_related[li_idx].b_f_matching and lstr_data_related[li_idx].b_t_matching) and li_idx > 1 then
						//-- cùng 1 đối tượng nhưng có quan hệ FROM TO khác nhau --//
						//-- lúc khai báo related phải khai báo FROM trước TO sau --//
						//-- trường hợp hiện tại là phiếu xuất tạo phiếu nhập, phiếu nhập tạo phiếu xuất --//
						if ls_whereclause <> '' and len(trim(lstr_data_related[li_idx].s_where)) > 0 then ls_whereclause +=  ' OR '
					else
						if ls_whereclause <> '' and len(trim(lstr_data_related[li_idx].s_where)) > 0 then ls_whereclause +=  ' AND '
					end if
					ls_whereclause+=  lstr_data_related[li_idx].s_where	
				NEXT
				if ls_whereclause <> '' then
					is_originalwhereClause = '('+ls_whereclause + ')' //////////////--Hỏi Long khi nào dùng --//
					return '('+ls_whereclause + ')'
				else
					return ''
				end if
			else
				return ''
			end if 
		end if
		//-- build book key --//
		li_rtn = lpo_handling.dynamic f_get_criteria_of_book(ls_dwcolumns,ls_criteria_of_dwcolumns)
		for li_idx = 1 to li_rtn
			if ls_whereclause <> '' then ls_whereclause += ' AND '
			ls_rtn = lc_service.f_buildwhereclause(this,ls_dwcolumns[li_idx] ,ls_criteria_of_dwcolumns[li_idx])
			ls_whereclause += ls_rtn
		next
		if ls_whereclause <> '' then
			return '('+ ls_whereclause + ')'
		else
			return ls_whereclause
		end if
	end if
end if

//-- master key --//
if this.f_buildwhereclause_4_dwdetail( ls_where_master) = -1 then
	setnull(ls_whereclause)
	return ls_whereclause
else
	if isnull(ls_where_master) then ls_where_master =''
	if ls_where_master <>'' then
		if ls_whereclause <> '' then ls_whereclause +=  ' AND '
		ls_whereclause+= ls_where_master
	end if
	if ls_whereclause <> '' then
		return '('+ ls_whereclause + ')'
	end if
end if

/* khóa kiểu where detial cũ --//
if this.f_buildwhereclause_of_masterkey( ls_where_master) = -1 then
	setnull(ls_whereclause)
	return ls_whereclause
else
	if isnull(ls_where_master) then ls_where_master =''
	if ls_whereclause <> '' then ls_whereclause +=  ' AND '
	ls_whereclause+= ls_where_master	
	if ls_whereclause <> '' then
		return '('+ ls_whereclause + ')'
	end if
end if
*/
return ls_whereclause

end function

public function string f_get_company_colname ();
int 			li_col_count, li_col
string		ls_colname

li_col_count = Integer(this.object.datawindow.column.count)
FOR li_col = 1 to li_col_count
	ls_colname = this.Describe ( "#"+string(li_col) + "dbname" )
	if pos(ls_colname, 'company_id') > 0 then
		return ls_colname
	end if
NEXT
		
return ''
end function

public function string f_get_branch_colname ();
int 			li_col_count, li_col
string		ls_colname

li_col_count = Integer(this.object.datawindow.column.count)
FOR li_col = 1 to li_col_count
	ls_colname = this.Describe ( "#"+string(li_col) + "dbname" )
	if pos(ls_colname, 'branch_id') > 0 then
		return ls_colname
	end if
NEXT
		
return ''
end function

public function integer f_change_2_edit ();//-- đổi giao diện sang giao diện editing --//
double			ldb_id
string				ls_main_dwo_for_edit, ls_oringalSQL_nowhere, ls_originalwhereClause, ls_editWhere, ls_colname, ls_coltype
boolean			lb_change4edit
window					lw_parent
s_object_display		lpo_handling
c_sql						lc_sql
//t_transaction			lt_transaction
s_str_dwo				lstr_dwo[]
t_ds						lds_data_tmp
c_dwservice			lc_dwservice

if this.f_getparentwindow( lw_parent) = 1 then	
	ib_edit_changing = true
	//-- ghi nhớ ID hiện tại --//
	if this.getrow( ) > 0 then
		ldb_id = this.getitemnumber( this.getrow(), 'id')
	end if	
	
	//-- nhớ lại originalSQL --//
	if this.f_getCurrentSQL(ls_oringalSQL_nowhere, ls_originalwhereClause) = 1 then
		this.f_set_currentwhere( ls_originalwhereClause)
	end if			
	
	lpo_handling = lw_parent.dynamic f_get_obj_handling()
	ls_main_dwo_for_edit = lpo_handling.f_get_main_dwo_for_edit()
	//-- đổi dwo thành dwo edit --//
	if this.dataobject <> ls_main_dwo_for_edit then
		lb_change4edit = true
		this.dataobject = ls_main_dwo_for_edit
		this.f_set_scrollbar( )
	
//		lw_parent.dynamic f_get_transaction(lt_transaction)
//		this.settransobject( lt_transaction)
		this.f_getCurrentSQL(ls_oringalSQL_nowhere, ls_originalwhereClause)		
//		this.f_set_properties( )
	end if
	
	//-- đổi whereclause --//	
	ls_colname = 'ID'
	if lc_dwservice.f_get_build_column( this, ls_colname, ls_coltype) = -1 then return -1
	ls_editWhere = ls_colname + " = " + string(ldb_id)
	if this.describe( "version_id.coltype" ) = 'number' then
		ls_colname = 'extend_id'
		lc_dwservice.f_get_build_column( this, ls_colname, ls_coltype)
		ls_editWhere += ' AND ' + ls_colname
		ls_colname = 'version_id'
		lc_dwservice.f_get_build_column( this, ls_colname, ls_coltype)
		ls_editWhere = ls_editWhere +' = ' + ls_colname
	end if
	
	lc_sql.f_addtowhereclause( ls_oringalSQL_nowhere, ls_editWhere," AND ")
	this.modify( "Datawindow.table.select = '"+ ls_oringalSQL_nowhere + "'")

	//-- resize fixed part --//
	lpo_handling.f_resize_fixedpart_form( )
end if
return 0
end function

public function integer f_change_2_grid ();s_object_display		lpo_handling
window					lw_parent
t_transaction			lt_transaction
c_sql						lc_sql
int							li_idx
string						ls_originalWhereClause_grid, ls_originalWhereClause_form, ls_originalSQL_nowhere, ls_modify, ls_rtn
string						ls_detail_filterString
double					ldb_current_ID
long						ll_currow, ll_rowcnt
		
if this.f_getparentwindow( lw_parent) = 1 then
	lw_parent.dynamic f_get_transaction(lt_transaction)	
	connect using lt_transaction;
	lpo_handling = lw_parent.dynamic f_get_obj_handling()
	if isvalid(lpo_handling) then		
		if this.getrow() > 0 then
			ldb_current_ID = this.getitemnumber( this.getrow(), 'ID')
		end if

		if  is_dwo_grid <> '' then
			//-- doi dataobject --//
			this.dataobject = is_dwo_grid
			this.f_set_scrollbar( )
			this.f_getcurrentSQL( ls_originalSQL_nowhere, ls_originalWhereClause_grid)
			if lpo_handling.ib_copying and this.is_join_match <> '' then
				ls_originalSQL_nowhere += ' ' + this.is_join_match
				ls_modify = "Datawindow.Table.Select= '" + ls_originalSQL_nowhere +"'"
				ls_rtn =this.modify(ls_modify )	
			end if	
			//-- reset column visible in user tabsequence --//
			this.f_reset_visible_in_user_tabsequence()
			this.f_set_properties( )
			//-- resize filter --//
			if lw_parent.dynamic f_is_filter_on() then
				lw_parent.dynamic event e_filter_resize()	
			end if							
			this.settransobject( lt_transaction)		
			this.f_create_navigate_bttn( )
			this.f_set_editable_property( false)
			this.object.datawindow.color = rgb(255,255,255)		
			//-- filter detail --//
			if this.ib_isdetail then
				if idw_master.dynamic f_get_ib_detail() then
					ls_detail_filterString = idw_master.dynamic f_get_detail_filterstring( this, this.ib_doc_filter)
					this.setfilter(ls_detail_filterString)
				end if
			end if				
			ll_rowcnt = this.event e_retrieve( )	
			disconnect using lt_transaction;
			if lw_parent.dynamic f_is_filter_on() then
				lw_parent.dynamic f_filter_dwmain()	
			end if			
			if ll_rowcnt > 1 then
				ll_currow = this.find( "ID = "+string(ldb_current_ID), 1, ll_rowcnt)
				if ll_currow > 0 then
					this.scrolltorow( ll_currow)
				end if
			end if
		end if
		//-- resize fixed part --//
		lpo_handling.f_resize_fixedpart_grid( )
	end if
end if		

return 0
end function

public function integer f_change_2_form ();s_object_display		lpo_handling
window					lw_parent
t_transaction			lt_transaction
c_sql						lc_sql
int							li_idx
string						ls_originalWhereClause_grid,ls_originalWhereClause_form, ls_originalSQL_nowhere, ls_modify, ls_rtn
string						ls_detail_filterString
double					ldb_current_ID
long						ll_currow, ll_rowcnt

if this.f_getparentwindow( lw_parent) = 1 then
	lw_parent.dynamic f_get_transaction(lt_transaction)		
	connect using lt_transaction;
	lpo_handling = lw_parent.dynamic f_get_obj_handling()
	if isvalid(lpo_handling) then
		if this.getrow() > 0 then
			ldb_current_ID = this.getitemnumber(  this.getrow(), 'ID')
		end if

		if  is_dwo_form <> '' then
			//-- doi dataobject --//
			this.dataobject = is_dwo_form
			this.f_set_scrollbar( )
			this.f_getcurrentSQL( ls_originalSQL_nowhere, ls_originalWhereClause_form)
			if lpo_handling.ib_copying and this.is_join_match <> '' then
				ls_originalSQL_nowhere += ' ' + this.is_join_match
				ls_modify = "Datawindow.Table.Select= '" + ls_originalSQL_nowhere +"'"
				ls_rtn =this.modify(ls_modify )	
			end if	
			//-- resize filter --//
			if lw_parent.dynamic f_is_filter_on() then
				lw_parent.dynamic event e_filter_resize_new()
			end if									
//			this.f_set_properties( )
			this.settransobject( lt_transaction)			
			this.f_create_navigate_bttn( )
			this.object.datawindow.color = rgb(255,255,255)
			//-- filter detail --//
			if this.ib_isdetail then
				if idw_master.dynamic f_get_ib_detail() then
					ls_detail_filterString = idw_master.dynamic f_get_detail_filterstring( this, this.ib_doc_filter)
					this.setfilter(ls_detail_filterString)
				end if
			end if		
			ll_rowcnt = this.event e_retrieve( )
			disconnect using lt_transaction;
			if lw_parent.dynamic f_is_filter_on() then
				lw_parent.dynamic f_filter_dwmain_new()	
			end if	
			
			if ll_rowcnt > 1 then
				ll_currow = this.find( "ID = "+string(ldb_current_ID), 1, ll_rowcnt)
				if ll_currow > 0 then
					this.scrolltorow( ll_currow)
				end if
			end if											
		end if
		//-- resize fixed part --//
		lpo_handling.f_resize_fixedpart_form( )
	end if
end if

return 0
end function

public function integer f_close_edit ();//-- đổi giao diện sang giao diện editing --//
double			ldb_id
string				ls_main_dwo_for_edit, ls_oringalSQL_nowhere, ls_originalwhereClause, ls_editWhere
string				ls_currentSQL_nowhere, ls_currentwhereClause, ls_rtn
long				ll_rowcnt, ll_currow

window				lw_parent
s_object_display	lpo_handling
c_sql					lc_sql
t_transaction		lt_transaction
datawindow			ldw_focus
s_str_dwo			lstr_dwo[]

if this.f_getparentwindow( lw_parent) = 1 then
	lpo_handling = lw_parent.dynamic f_get_obj_handling()
	if  this.getrow() > 0 and not ib_dummy_row then
		ldb_id = this.getitemnumber( this.getrow(), 'ID')
	else
		ib_dummy_row = false
	end if
	ib_edit_changing = true
	//-- đổi dwo ve dwo default--//
	this.dataobject = lpo_handling.dynamic f_get_main_dwo()
	lw_parent.dynamic f_get_transaction(lt_transaction)
	this.settransobject( lt_transaction)	
	
	//-- đổi lại where gốc --//
	if this.f_getCurrentSQL(ls_currentSQL_nowhere, ls_currentwhereClause) = 1 then
		ls_originalwhereClause = this.f_get_currentwhere( )
		lc_sql.f_addtowhereclause( ls_currentSQL_nowhere, ls_originalwhereClause," AND ")
		ls_rtn = this.modify( "Datawindow.table.select = '"+ ls_currentSQL_nowhere + "'")
		this.f_create_navigate_bttn( )
		ldw_focus = lw_parent.dynamic f_get_idwfocus()
		if ldw_focus.classname() = this.classname() then
			this.object.datawindow.color = rgb(255,255,255)
		end if
		this.f_set_scrollbar( )
		this.f_set_properties( )		
		ll_rowcnt = this.event e_retrieve( )	
		this.f_set_ib_edit_changing(false)
		if ll_rowcnt > 1 then
			if ldb_id > 0 then
				ll_currow = this.find( "ID = "+string(ldb_id), 1, ll_rowcnt)
			else
				ll_currow = ll_rowcnt
			end if
			this.scrolltorow( ll_currow)
		end if		
		//this.f_set_ib_edit_changing(false)
	end if			
	//-- resize fixed part --//
	lpo_handling.f_reset_fixedpart_grid( )	
end if
return 0

end function

public subroutine f_set_ib_shared (boolean vb_shared);ib_isshared = vb_shared

end subroutine

public function integer f_set_ib_editing (boolean vb_editing);ib_editing = vb_editing
return 1
end function

public function boolean f_get_ib_shared ();return ib_isshared

end function

public function integer f_set_ib_saving (boolean vb_saving);ib_saving = vb_saving
return 1
end function

public function integer f_set_dwmaster (ref datawindow radw_detail[]);/* set this la dw_master, va gan cac dw_deal */
int						li_idx
string				las_master_keycol[], las_detail_keycol[]
c_obj_service 	lobj_srv


//-- set dwmaster --//
this.iadw_detail[] = radw_detail[]

//-- set detail --//
FOR li_idx = 1 to upperbound(radw_detail[])
	if li_idx = 1 then radw_detail[li_idx].dynamic f_set_ib_displaying(true)
	radw_detail[li_idx].dynamic f_set_idw_master(this)
	
//	lobj_srv.f_stringtoarray(vs_master_keycol[li_idx], ';', las_master_keycol[] ) 
//	radw_detail[li_idx].dynamic f_set_master_keycol(las_master_keycol[])
//	
//	lobj_srv.f_stringtoarray(vs_detail_keycol[li_idx], ';',  las_detail_keycol[]) 
//	radw_detail[li_idx].dynamic f_set_detail_keycol(las_detail_keycol[])
NEXT

return 1
end function

public function long f_filter_detail ();int 					li_idx, li_rtn
long					ll_originrow,ll_row
string					ls_filterString
double				ldb_id
t_dw_mpl			ldw_detail[], ldw_detail_child[]

ldw_detail[] = iadw_detail[]
FOR li_idx = 1 TO upperbound(ldw_detail)
	
	if not ldw_detail[li_idx].f_get_ib_dummy_row( ) then
		ls_filterString = this.f_get_detail_filterString( ldw_detail[li_idx],ldw_detail[li_idx].ib_doc_filter )
		ldw_detail[li_idx].setfilter(ls_filterString)
		ldw_detail[li_idx].filter()
		
		ll_row = ldw_detail[li_idx].getrow( )
		if ll_row > 0 then
			ldw_detail[li_idx].f_load_pic(ll_row)
		end if
		
		//-- set rowcount gutter --//
		ldw_detail[li_idx].f_set_gutter_rowcount( )
		
		if ldw_detail[li_idx].f_getdwdetails(ldw_detail_child[]) > 0 then
			li_rtn= ldw_detail[li_idx].f_filter_detail()
		end if
	end if
NEXT
return 0

end function

public function integer f_getdwshared (ref datawindow ldw_shared[]);int li_rt
ldw_shared = iadw_shared
li_rt = UpperBound(iadw_shared)

Return li_rt 
end function

public function integer f_set_dwo_grid (string vs_dwo_grid);is_dwo_grid  = vs_dwo_grid

return 1
end function

public function integer f_set_dwo_form (string vs_dwo_form);is_dwo_form  = vs_dwo_form
return 1
end function

public function datawindow f_get_idw_master ();return idw_master 
end function

public function integer f_find_dwdetail (ref datawindow rdw_found, string vs_dwo);
int						li_idx , li_dwCnt, li_rtn, li_dwCnt2, li_idx2
datawindow			ladw_detail[]
li_dwCnt = upperbound(this.iadw_detail[])
if li_dwCnt = 0 then return 0
FOR li_idx =1 to li_dwCnt
	if this.iadw_detail[li_idx].dataobject = vs_dwo then
		rdw_found = this.iadw_detail[li_idx]
		return 1
	else
		li_dwCnt2 = this.iadw_detail[li_idx].dynamic f_getdwdetails(ladw_detail[])
		FOR li_idx2 = 1 to li_dwCnt2
			if ladw_detail[li_idx2].dataobject = vs_dwo then
				rdw_found =  ladw_detail[li_idx2]
				return 1
			end if			
		NEXT
	end if
NEXT
return 0
end function

public function boolean f_get_ib_traceable ();return ib_traceable

end function

public function integer f_set_ib_traceable (boolean vb_traceable);ib_traceable = vb_traceable
return 1
end function

public function boolean f_get_ib_focus_master ();return ib_focus_Master

end function

public function integer f_set_ib_focus_master (boolean vb_focus_master);ib_focus_Master = vb_focus_Master
return 1
end function

public function integer f_create_ctrl_text_of_pic (integer vi_idx_btn, string vs_ctrl_pic_name);string ls_modify,ls_text,ls_name,ls_rtn,ls_font_height,ls_y
long 	ll_text_x,ll_i

if vi_idx_btn > 0 and vi_idx_btn < 3 then
	for ll_i = 1 to vi_idx_btn
		if ll_i=1 then
			ll_text_x = long(this.describe(vs_ctrl_pic_name+".X")) + long(this.describe(vs_ctrl_pic_name+".width")) - 78
			ls_text = '+'
			ls_name = 'add_pic' 
			ls_font_height = '-13'
			ls_y = '20'
		else
//			ll_text_x = long(this.describe(vs_ctrl_pic_name+".X")) + long(this.describe(vs_ctrl_pic_name+".width")) - (78*2)
			ll_text_x = long(this.describe(vs_ctrl_pic_name+".X")) + long(this.describe(vs_ctrl_pic_name+".width")) - 78
			ls_text = '-'
			ls_name = 'remove_pic'
			ls_font_height = '-15'
			ls_y = '10'
		end if
		If this.Describe(ls_name + ".x") <> "!" Then continue
		ls_modify =&
			'create text(band=detail color=~"32768~"' &
			+' alignment=~"2~" border=~"0~" x='+'~"'+string(ll_text_x)+'~"'+' y=~"'+ls_y+'~" height=~"68~" width=~"78~"'&
			+' text='+'~"'+ls_text+'~"'+" name="+ls_name + ' font.face=~"Tahoma~" font.height=~"'+ls_font_height+'~"' &
			+' font.weight=~"700~" font.family=~"2~" font.pitch=~"2~" font.charset=~"0~"'&
			+' background.mode=~"2~" background.color=~"1073741824~" background.transparency=~"100~")'
		ls_rtn = this.Modify(ls_modify)
	next
end if
return 1
end function

public function integer f_visible_ctrl_text_of_pic ();this.Modify('add_pic.visible=0')
this.Modify('remove_pic.visible=0')
return 1
end function

public function integer f_enable_ctrl_text_of_pic (integer vs_indx);if vs_indx > 1 then
	this.Modify('add_pic.visible=0')
	this.Modify('remove_pic.visible=1')
else
	this.Modify('add_pic.visible=1')
	this.Modify('remove_pic.visible=0')
end if
return 1
end function

public function integer f_change_color_ctrl_of_pic (string vs_ctrl_name);if vs_ctrl_name = 'add_pic' then
		this.Modify('add_pic.color=~"20396031~"')
		this.Modify('remove_pic.color=~"32768~"')
	elseif vs_ctrl_name = 'remove_pic' then
		this.Modify('remove_pic.color=~"20396031~"')
		this.Modify('add_pic.color=~"32768~"')
	else 
		this.Modify('remove_pic.color=~"32768~"')
		this.Modify('add_pic.color=~"32768~"')
	end if
return 1
end function

public function integer f_update_pic (blob vblb_picture, string vs_pic_name, string vs_path, long row);long 				ll_obj_ref_id,ll_rtn,ll_ref_id,ll_idx
window			lw_parent
t_transaction 	lt_transaction
powerobject	lc_object_handle_parent
s_str_dwo		lc_s_str_dwo[]
string 			ls_rtn,ls_pic_ref_field,ls_pic_ref_table,ls_sql
	
	this.f_getparentwindow( lw_parent)
	lc_object_handle_parent = lw_parent.dynamic f_get_obj_handling()
	lc_object_handle_parent.dynamic f_get_dwo(lc_s_str_dwo)
	
	for ll_idx = 1 to upperbound(lc_s_str_dwo)
		if lc_s_str_dwo[ll_idx].s_dwo_default = this.dataobject then
			ls_pic_ref_table = lc_s_str_dwo[ll_idx].s_pic_ref_table
			ls_pic_ref_field = lc_s_str_dwo[ll_idx].s_pic_ref_field
			exit
		end if
	next
	ll_ref_id = this.getitemnumber( row, ls_pic_ref_field)
	ls_sql = 'UPDATE '+ls_pic_ref_table+' SET LOGO = ? WHERE ID = ? '
	
	//--Tạo sql động cú pháp 2--//
	PREPARE SQLSA         
		FROM  :ls_sql
		using SQLCA;
	EXECUTE SQLSA        
		USING :vblb_picture,:ll_ref_id ;
	
	ll_rtn = SQLCA.sqlcode
	if ll_rtn = 0 then
		COMMIT USING SQLCA ;
		if vs_path = '' then
			ls_rtn = this.modify( vs_pic_name + '.filename =""')
		else
			ls_rtn = this.modify( vs_pic_name + '.filename ='+"'"+vs_path+"'")
		end if
	end if
	return ll_rtn
end function

public function boolean f_check_posmouse_on_pic (integer xpos, integer ypos, string vs_ctrl_pic_name);
if	((xpos > UnitsToPixels(long(this.describe(vs_ctrl_pic_name+".X")),XUnitsToPixels!) - 200 and xpos < UnitsToPixels(long(this.describe(vs_ctrl_pic_name+".X")),XUnitsToPixels!) ) or &
	(xpos > UnitsToPixels(long(this.describe(vs_ctrl_pic_name+".X")),XUnitsToPixels! ) + UnitsToPixels(long(this.describe(vs_ctrl_pic_name+".width")),XUnitsToPixels! ) and  &
	xpos < UnitsToPixels(long(this.describe(vs_ctrl_pic_name+".X")),XUnitsToPixels! ) + UnitsToPixels(long(this.describe(vs_ctrl_pic_name+".width")),XUnitsToPixels!) + 200 )) or &
	( ypos < UnitsToPixels(long(this.describe(vs_ctrl_pic_name+".Y")),YUnitsToPixels!) - UnitsToPixels(long(this.describe("add_pic.Y")),YUnitsToPixels!) - 4 or & 
	(ypos > UnitsToPixels(long(this.describe(vs_ctrl_pic_name+".Y")),YUnitsToPixels!) + UnitsToPixels(long(this.describe(vs_ctrl_pic_name+".height")),YUnitsToPixels!) ) &
	) then
	return true
else
	return false
end if

end function

public subroutine f_set_ib_edit_changing (boolean vb_edit_changing);ib_edit_changing  = vb_edit_changing
end subroutine

public function integer f_get_valueset (ref powerobject rpo_dwsetup, string vs_data);
return 1
end function

public function string f_get_autocomplete_string (string vs_colname, string vs_searchtext, string vs_dddw_ddlb);string					ls_autocomplete, ls_findexp, ls_displaydata_value, ls_dddw_displaycol
int						li_searchtextlen, li_ddlb_index
long					ll_dddw_rowcount, ll_findrow
boolean				lb_matchfound
datawindowchild	ldwc
c_dwservice			lc_dwservice

li_searchtextlen = len(vs_searchtext)

If ((li_searchtextlen <  Len(is_textprev))  or  (Lower (vs_searchtext) = Lower (is_textprev))) and is_textprev <> '' Then
	is_textprev = ''
	return ''
End If	

If vs_dddw_ddlb = 'dddw' Then  
	ls_dddw_displaycol = this.describe( vs_colname+ '.dddw.displaycolumn')

	// Search for a match in DDDW
	ls_findexp = "Lower (Left (" + ls_dddw_displaycol + ", " + String (li_searchtextlen) + ")) = '" + Lower (vs_searchtext) + "'"
	this.getchild( vs_colname, ldwc)	
	if is_textprev = '' then
		ll_dddw_rowcount = this.f_retrieve_dwc(vs_colname )
	else
		ll_dddw_rowcount = ldwc.Rowcount()
	end if	

	//-- filter --//
	IF not isnull(vs_searchtext) and trim(vs_searchtext)<>'' then 
		ldwc.SetFilter("upper("+ ls_dddw_displaycol +") like '%"+ upper(vs_searchtext)+"%' ")
	else
		ldwc.SetFilter("")
	end if 		
	ldwc.Filter()		
	lc_dwservice.f_set_gutter_rowcount(ldwc )
	if li_searchtextlen = 0 then return ''
	
	
	ll_findrow = ldwc.Find (ls_findexp, 1, ll_dddw_rowcount)
	lb_matchfound = (ll_findrow > 0)
	If lb_matchfound then
		ls_autocomplete= ldwc.GetItemString(ll_findrow,ls_dddw_displaycol)
		is_textprev  = vs_searchtext
	else
		is_textprev = ''
		ls_autocomplete = ''
	end if                                            
ElseIf vs_dddw_ddlb = 'ddlb' Then 
	if is_textprev ='' then return ''
	Do
		li_ddlb_index++
		ls_displaydata_value = This.GetValue(vs_colname, li_ddlb_index)
		If ls_displaydata_value = '' Then 
			Exit
		End If
		lb_matchfound = ( Lower(vs_searchtext) = Lower( Left(ls_displaydata_value, Len(vs_searchtext))) )
	Loop Until lb_matchfound
	If lb_matchfound Then
		ls_autocomplete = Left (ls_displaydata_value, Pos(ls_displaydata_value,'~t') -1)        	
	End If
End If

return ls_autocomplete
end function

public function boolean f_is_lang ();
string		ls_coltype


ls_coltype = this.Describe ("lang.coltype" )
if ls_coltype = '!' then 
	return false
else
	return true
end if
end function

public function integer f_rebuild_select_column (string vs_columns);
string					ls_currentSQL_nowhere, ls_currentwhere, ls_rebuildSQL, ls_dbname, ls_rtn, ls_originalColString, ls_delcol[]
string					las_dbname[], ls_empty[], las_original_colname[], ls_coltype
int						li_idx, li_rtn, li_colCnt
boolean				lb_notexist
c_sql					lc_sql
t_s_sql_attr 			lastr_sql[]
c_string				lc_string
c_dwservice			lc_dwservice

//-- lấy các cột không cần thiết --//
li_colCnt = this.f_getcolumns_sql(las_original_colname[] )
FOR li_idx = 1 to li_colCnt
	if pos(vs_columns, las_original_colname[li_idx]+';') = 0 then
		ls_delcol[upperbound(ls_delcol) + 1] = las_original_colname[li_idx]
	end if
NEXT

if this.dynamic f_getCurrentSQL(ls_currentSQL_nowhere, ls_currentwhere) = 1 then
	li_rtn = lc_sql.f_parse(ls_currentSQL_nowhere, lastr_sql[])
	if li_rtn = 1 then
		//-- Remove ORDER BY clause --//
		lastr_sql[1].s_order = ""	
		//-- remove khoảng trắng trong select --//
		lastr_sql[1].s_columns = lc_string.f_removesqlwhitespace( lastr_sql[1].s_columns)
//		lc_string.f_globalreplace(  lastr_sql[1].s_columns ,' ,',',',   lastr_sql[1].s_columns)
		For li_idx = 1 To upperbound(ls_delcol[] )	
			
			//-- Replace the selected columns of the detail by the linkage columns --//		
			ls_dbname =ls_delcol[li_idx]
			if lc_dwservice.f_get_build_column( this, ls_dbname, ls_coltype) =-1 then
				return -1
			end if				
			
			
			li_rtn = lc_string.f_globalreplace(  lastr_sql[1].s_columns , ls_dbname+',', '',   lastr_sql[1].s_columns)
			if li_rtn = 0 then
				 li_rtn = lc_string.f_globalreplace(  lastr_sql[1].s_columns , ls_dbname, '',   lastr_sql[1].s_columns)
				 if li_rtn = 0 then
					 li_rtn = lc_string.f_globalreplace(  lastr_sql[1].s_columns , "as "+ls_dbname+',', '',   lastr_sql[1].s_columns)
					 if li_rtn = 0 then
						li_rtn = lc_string.f_globalreplace(  lastr_sql[1].s_columns , "as "+ls_dbname, '',   lastr_sql[1].s_columns)
						if li_rtn  = 0 then
							li_rtn = lc_string.f_globalreplace(  lastr_sql[1].s_columns , ls_delcol[li_idx]+',', '',   lastr_sql[1].s_columns)
							if li_rtn = 0 then
								li_rtn = lc_string.f_globalreplace(  lastr_sql[1].s_columns , ls_delcol[li_idx], '',   lastr_sql[1].s_columns)
								lastr_sql[1].s_columns = mid(lastr_sql[1].s_columns,1,lastpos(lastr_sql[1].s_columns,',') -1)
							end if
						end if
					 end if
				else
					lastr_sql[1].s_columns = mid(lastr_sql[1].s_columns,1,lastpos(lastr_sql[1].s_columns,',') -1)
				end if
			end if
			
			//-- destroy columname --//
			ls_rtn = this.modify( " destroy column "+ls_delcol[li_idx])
			ls_rtn = this.modify( " destroy "+ls_delcol[li_idx]+'_t')		
		Next			
		lastr_sql[1].s_where += ls_currentwhere
				
		// Rebuild the detail SQL
		ls_rebuildSQL = lc_sql.f_Assemble(lastr_sql)
		ls_rebuildSQL = "Datawindow.Table.Select= ~'" + ls_rebuildSQL +"~'"
		ls_rtn =this.modify(ls_rebuildSQL )		
		if ls_rtn <> '' then			
			return -1
		end if
	end if
else
	return -1
end if
return 0

end function

public function integer f_calendar (string vs_colname, string vs_coltype);string				ls_date, ls_type
datetime 		ldatetime_calendar
date 				ldate_calendar, ld_null
str_calendar  	lstr_calendar
//-- open calendar --//
ls_date = string(this.getitemdatetime( this.getrow(), vs_colname),'yyyymmdd')
lstr_calendar.date_current =  ls_date
if ls_date = '19000101' or ls_date ='' then
	this.setcolumn( vs_colname)
	this.settext('')
	lstr_calendar.date_current = string(today(),'yyyymmdd') 
end if
OpenWithParm(w_calENDar, lstr_calendar)
ls_date = message.stringparm
setnull(message.stringparm)
this.setcolumn( vs_colname)
IF IsNull(ls_date) or Len(ls_date) < 1 THEN return 1 
choose case vs_coltype
	case 'date'			
		select to_date(:ls_date,'yyyymmdd') into :ldate_calendar from dual ;
		this.settext( string(ldate_calendar))
		this.accepttext( )
	case 'datetime'				
		select to_date(:ls_date,'yyyymmdd') into :ldatetime_calendar from dual ;
		//This.setitem( row,ls_colname,ldatetime_calendar)
		this.settext( string(ldatetime_calendar))
		this.accepttext( )
end choose	

end function

public function integer f_load_pic (long vl_row);
s_w_main 			lw_parent
powerobject		lc_object_handle_parent
string				ls_sql,ls_pic_ref_table,ls_pic_ref_field,ls_colname_p_logo,ls_colname_p_1,ls_pic_ref_colname
string				ls_default_directory,ls_pic_name,ls_path
long				ll_ref_id,ll_idx,ll_idx2,ll_find
double			ldb_ref_id
blob				lblb_logo
int					li_fileidx
t_transaction	lt_transaction
t_ds_db			lds_attment

lt_transaction = create t_transaction

lt_transaction.dbms =	SQLCA.DBMS
lt_transaction.ServerName	 = SQLCA.ServerName
lt_transaction.LogId	 = SQLCA.LogId
lt_transaction.LogPass 	 = SQLCA.LogPass 
lt_transaction.AutoCommit 	 = false 
lt_transaction.DBParm	 = SQLCA.DBParm
connect using lt_transaction;

if this.describe( 'p_1.x') <> '!' and this.describe( 'p_1.x') <> '?' then 
	ls_colname_p_1 = 'p_1'
end if
if this.describe( 'p_logo.x') <> '!' and this.describe( 'p_logo.x') <> '?' then
	ls_colname_p_logo = 'p_logo'
end if
if ls_colname_p_1 <> '' or ls_colname_p_logo <> '' then
	lds_attment = create t_ds_db
	this.f_getparentwindow( lw_parent)
	lc_object_handle_parent = lw_parent.dynamic f_get_obj_handling()
//	lw_parent.dynamic f_get_transaction(lt_transaction)

	if ls_colname_p_logo <> '' then
		if this.f_get_data_pic(lc_object_handle_parent,ls_pic_ref_table,ls_pic_ref_field,ls_pic_ref_colname,ls_colname_p_logo) = 1 then
			if pos(lc_object_handle_parent.classname( ),'ur_') > 0 or lc_object_handle_parent.classname( ) = 'b_view' then
//				ls_path = gs_path_pic + '\pics\' + ls_pic_ref_colname+'_'+string(gdb_branch) + '.jpg'
//				if not FileExists ( ls_path ) then
//					ldb_ref_id = gi_user_comp_id
//				else
					ldb_ref_id = gdb_branch
//				end if
			else
				ldb_ref_id = this.getitemnumber( vl_row,ls_pic_ref_field)
			end if
			ls_path = this.f_get_path_pic(ls_pic_ref_table,ls_pic_ref_field,ls_pic_ref_colname, ldb_ref_id, lt_transaction)//-- hàm mới--//
//			ls_pic_name = mid(ls_path, lastpos(ls_path,'\') +1)
//			this.setitem( 1, 'p_logo', ls_path)
			if not FileExists ( ls_path ) then
				ldb_ref_id = gi_user_comp_id
				ls_path = this.f_get_path_pic(ls_pic_ref_table,ls_pic_ref_field,ls_pic_ref_colname, ldb_ref_id, lt_transaction)//-- hàm mới--//
//				this.setitem( 1, 'p_logo', ls_path)
			end if
			if isnull(ls_path) then ls_path =''
			this.modify(ls_colname_p_logo + '.filename='+"'"+ls_path+"'")
		else
			//--chưa cài đặt str cho hình--//
			messagebox('Lỗi','t_dw_mpl.f_load_pic(line:31)')
			destroy lds_attment
			return -1
		end if
	end if
	if ls_colname_p_1 <> '' then
		if this.f_get_data_pic(lc_object_handle_parent,ls_pic_ref_table,ls_pic_ref_field,ls_pic_ref_colname,ls_colname_p_1) = 1 then
			lds_attment.dataobject = 'ds_attachment_grid'
			lds_attment.f_settransobject( SQLCA)
			lds_attment.retrieve( )
			for ll_idx = 1 to vl_row
				ldb_ref_id = this.getitemnumber( ll_idx, ls_pic_ref_field)
				ll_find = lds_attment.find( "OBJECT_REF_ID = "+ string(ldb_ref_id), 1, lds_attment.rowcount( ) )
				if ll_find > 0 then
					ls_path = this.f_get_path_pic(ls_pic_ref_table,ls_pic_ref_colname, ldb_ref_id, lt_transaction) //-- hàm cũ--//
				else 
					ls_path = ''
				end if
				if ls_path <> '' then this.setitem( ll_idx,ls_colname_p_1, ls_path)
			next
		else
			//--chưa cài đặt str cho hình--//
			messagebox('Lỗi','t_dw_mpl.f_load_pic(line:43)')
			destroy lds_attment
			return -1
		end if
	end if

	disconnect using lt_transaction;
	destroy lt_transaction
	destroy lds_attment
end if
return 1
end function

public function integer f_get_criteria_record (s_str_criteria_rec rs_str_criteria_rec[]);rs_str_criteria_rec = is_str_criteria_rec
return upperbound(rs_str_criteria_rec)


end function

public function integer f_set_criteria_record (s_str_criteria_rec vs_str_criteria_rec[]);is_str_criteria_rec = vs_str_criteria_rec
return upperbound(is_str_criteria_rec)

end function

public function integer f_set_rec_security ();string						ls_currentSQL, ls_currentWhere,ls_modify,ls_rtn,ls_where,ls_dwo,ls_object_name
c_sql						lc_sql
c_dwservice				lc_dwser
s_object_display		lobj_handle
window					lw_parent
t_dw_mpl				ldw_handle
c_string					lc_string

if gi_userid = 0 then return 1
ls_dwo = this.dataobject
this.f_getparentwindow( lw_parent)
lobj_handle = lw_parent.dynamic f_get_obj_handling()
ls_object_name = lobj_handle.idwsetup_initial.ids_setup_dw.getitemstring( 1, 'object')
ldw_handle = this
ls_where = lc_dwser.f_buildwhere_rec_security( ldw_handle, mid(ls_dwo,1,len(ls_dwo)-5),ls_object_name)
if ls_where <> '' then
	ls_where = '('+ls_where+')'
	ls_where = lc_string.f_globalreplace( ls_where, '"', '')
	if this.f_getcurrentSQL( ls_currentSQL, ls_currentWhere) =1 then
		//Lưu lại where record để sử dụng trong lúc tìm kiếm
		this.is_record_where = ls_where
		if ls_currentWhere <> '' then ls_currentWhere += ' AND '
		if ls_where <> '' then ls_where = ls_currentWhere + ls_where
		if ls_where <> '' then lc_sql.f_addtowhereclause( ls_currentSQL, ls_where, " AND ")
		if ls_currentWhere <> ls_where then
			ls_modify = 'Datawindow.Table.Select= "' + ls_currentSQL +'"'
			ls_rtn =this.modify(ls_modify )
		end if
	end if
end if
return 1
end function

public function integer f_set_ib_dataerror (boolean vb_dataerror);ib_dataerror = vb_dataerror
return 1
end function

public function integer f_set_dwshare (ref datawindow rdw_share[]);int li_no_of_dwshare, li_idx
iadw_shared = rdw_share

li_no_of_dwshare = upperbound(iadw_shared)
FOR li_idx = 1 to li_no_of_dwshare
	iadw_shared[li_idx].dynamic f_set_idw_master(this)
	if this.sharedata( iadw_shared[li_idx]) = -1 then
		gf_messagebox('m.t_dw_mpl.f_set_dwshare.01','Thông báo','Lỗi setshare:@'+this.dataobject+ ';'+iadw_shared[li_idx].dataobject,'exclamation','ok',1)
		return -1
	end if
NEXT
end function

public function integer f_set_rule_id_rec (double vdb_rule_id[]);idb_rule_id = vdb_rule_id
return 1
end function

public function integer f_get_rule_id_rec (ref double rdb_rule_id[]); rdb_rule_id = idb_rule_id
return upperbound(rdb_rule_id)
end function

public subroutine f_set_ib_dummy_row_yn (boolean vb_dummy_row_yn);ib_dummy_row_yn = vb_dummy_row_yn

end subroutine

public function integer f_destroy_dddw (string vs_colname);string					ls_rtn

IF  this.describe(vs_colname + ".Edit.Style")  = 'dddw' then
//	ls_rtn = this.Modify( vs_colname+ ".dddw.name=~'~'" ) 
//	ls_rtn = this.Modify( vs_colname+ '.dddw.useasborder=no' )
//	ls_rtn = this.Modify( vs_colname+ '.dddw.displaycolumn=~'~'' ) 		
//	ls_rtn = this.Modify( vs_colname+ '.dddw.datacolumn=~'~'') 
	ls_rtn = this.Modify( vs_colname+ '.Edit.DisplayOnly=~'yes~'')
	return 1
end if
return 0
end function

public function integer f_set_ref_data ();int			li_idx, li_cnt, li_col
string 		ls_ref_column, las_ref_column[]
c_string	lc_string

if this.ib_ismaster and not this.ib_isdetail and this.f_get_ib_ref_table_yn() then
	FOR li_idx =1 to upperbound(this.iadw_detail[])
		if this.iadw_detail[li_idx].dynamic f_get_ib_ref_table_yn() then
			if this.iadw_detail[li_idx].getrow() = 0 then
				gf_messagebox('m.t_dw_mpl.f_set_ref_data.01','Thông báo','Chưa nhập dữ liệu chi tiết', 'exclamation','ok',1)
				return -1
			end if
			ls_ref_column = this.iadw_detail[li_idx].dynamic f_get_ref_table_field()
			li_cnt = lc_string.f_stringtoarray(ls_ref_column , ';', las_ref_column[])
			FOR li_col = 1 to li_cnt
				if upper(las_ref_column[ li_col ]) = 'OBJECT_REF_TABLE' then
					a_ref_data[1] = this.iadw_detail[li_idx].describe("datawindow.table.update")
				else
					a_ref_data[li_col] = this.iadw_detail[li_idx].dynamic f_getitemany(this.iadw_detail[li_idx].getrow() ,las_ref_column[li_col])
				end if
			NEXT			
			return li_cnt
		end if
	NEXT
end if
return 0
end function

private function integer f_check_valueset (ref string rs_data, string vs_colname, datawindowchild vdwc_handle);/*******************************************************************
chức năng : kiểm tra dữ liệu nhập có trong valueset không
-------------------------------------------------------------------------------
return: 1 dữ liệu ok
		-1 dữ liệu không hợp lệ.
=================================================*/

string						ls_data[], ls_coltext, ls_dwdatatype, ls_coltype, ls_receive_columns, ls_filterdata
string						ls_display_columns,ls_rtn_columns, las_rtn_columns[],ls_data_colname, las_empty[], ls_dataGroup[]
any						laa_empty[]
int							li_colCnt, li_idx, li_rtn_colCnt, li_col, li_cntGroup
long						ll_found, ll_row_setup
boolean					lb_valueset_receive_number
c_string					lc_string
c_dwservice				lc_dwservice
window					lw_display
s_object_display		lod_handle

this.f_getparentwindow( lw_display)
lod_handle = lw_display.dynamic f_get_obj_handling()

//-- kiem tra data null --//
if isnull(rs_data) or rs_data ='' then 
	lod_handle.idwsetup_initial.ias_rtn_data[]  = las_empty[]
	lod_handle.idwsetup_initial.iaa_rtn_data[]  = laa_empty[]
	//-- set giá tri trả về cho các cột nhận giá trị --//
//	this.f_setitem_returndata( vs_colname, this.getrow())	
	return 0
end if

//-- tạo valueset object --//
ls_coltype =  this.describe( vs_colname+ '.coltype' )
ll_row_setup = lod_handle.idwsetup_initial.f_get_dwdatatype_string( vs_colname, ls_coltype, this, ls_dwdatatype)

if ll_row_setup > 0 then
	//-- kiem tra cot du lieu tra ve --//
	ls_display_columns = lod_handle.idwsetup_initial.ids_setup_dw.getitemstring( ll_row_setup, 'display_column')
	ls_rtn_columns = lod_handle.idwsetup_initial.ids_setup_dw.getitemstring( ll_row_setup, 'return_column')	
	ls_receive_columns =  lod_handle.idwsetup_initial.ids_setup_dw.getitemstring( ll_row_setup, 'receive_column')	
	if ls_rtn_columns ='' then 
		ls_coltext = t_w_mdi.ids_lang_text.f_get_lang_text(vs_colname)
		ib_dataerror = true
		gf_messagebox('m.t_dw_mpl.f_check_valueset.01','Thông báo','Không tìm thấy cột trả dữ liệu trong cài đặt bộ giá trị: @'+ls_coltext ,'Exclamation','ok',1)
		return -1
	end if		
	li_rtn_colCnt = lc_string.f_stringtoarray(ls_rtn_columns , ';', las_rtn_columns[])
	ls_data_colname = lc_string.f_getfirsttoken(ls_display_columns, ';') 
	
	//-- kiem tra cột nhận dữ liệu trả về có là kieu number hay ko ? --//
	lb_valueset_receive_number = lod_handle.idwsetup_initial.f_is_valueset_receive_number( this.dataobject, ls_receive_columns)
	if lb_valueset_receive_number   and li_colCnt > 1 then
		ib_dataerror = true
		gf_messagebox('m.t_dw_mpl.f_check_valueset.02','Thông báo','Chỉ được nhập 1 dữ liệu và không có dấu (;)','Exclamation','ok',1)		
		return -1
	end if
	

	//-- Kiểm tra toàn toàn bộ dữ liệu có trong valueset --//

	ls_filterdata = upper(lc_string.f_globalreplace( rs_data, "'", "~~'" , 2, len(rs_data) -1) )
	ll_found = vdwc_handle.find("upper("+ls_data_colname+ ")= '"+ls_filterdata + "'", 1, vdwc_handle.rowcount())
	if ll_found = 0 then 
		ls_filterdata = trim(ls_filterdata)
		ll_found = vdwc_handle.find("trim(upper("+ls_data_colname+ "))= '"+ls_filterdata + "'", 1, vdwc_handle.rowcount())
	end if

	//-- kiểm tra từng thành phần , khi từng thành phần ko thấy --//
	if ll_found > 0 then
		//-- lấy giá trị return --//		
		lod_handle.idwsetup_initial.ias_rtn_data[] = las_empty[]
		lod_handle.idwsetup_initial.iaa_rtn_data[] = laa_empty[]	
		FOR li_col = 1 to li_rtn_colCnt
			if lb_valueset_receive_number then
				lod_handle.idwsetup_initial.iaa_rtn_data[li_col] = lc_dwservice.f_getitemany_dwc(vdwc_handle, ll_found, las_rtn_columns[li_col]) 
			else					
				lod_handle.idwsetup_initial.ias_rtn_data[li_col] += string(lc_dwservice.f_getitemany_dwc(vdwc_handle, ll_found, las_rtn_columns[li_col]))
			end if
		NEXT		
	else
		//-- dữ liệu multi row --//
		li_cntGroup = lc_string.f_stringtoarray( rs_data, '|', ls_dataGroup[])
		if li_cntGroup = 0 then
			li_colCnt = lc_string.f_stringtoarray( rs_data, ';', ls_data[])
		else
			FOR li_idx = 1 to li_cntGroup
				li_colCnt = lc_string.f_stringtoarray( ls_dataGroup[li_idx], ';', ls_data[], true)
			NEXT
		end if		
		FOR li_idx = 1 to li_colCnt
			ls_filterdata = upper(lc_string.f_globalreplace( ls_data[li_idx], "'", "~~'", 2, len(ls_data[li_idx]) -1))
			ll_found = vdwc_handle.find("upper("+ls_data_colname+ ")= '"+ ls_filterdata + "'", 1, vdwc_handle.rowcount())
			if ll_found = 0 then
				ls_filterdata = trim(ls_filterdata)
				ll_found = vdwc_handle.find("trim(upper("+ls_data_colname+ "))= '"+ ls_filterdata + "'", 1, vdwc_handle.rowcount())
			end if
			if ll_found > 0 then
				//-- lấy giá trị return --//		
				if li_colCnt = 1 then
					lod_handle.idwsetup_initial.ias_rtn_data[] = las_empty[]
					lod_handle.idwsetup_initial.iaa_rtn_data[] = laa_empty[]	
				end if
				FOR li_col = 1 to li_rtn_colCnt
					if lb_valueset_receive_number then
						lod_handle.idwsetup_initial.iaa_rtn_data[li_col] = lc_dwservice.f_getitemany_dwc(vdwc_handle, ll_found, las_rtn_columns[li_col]) 
					else
						if li_idx > 1 then
							if lod_handle.idwsetup_initial.ias_rtn_data[li_col] <> '' then lod_handle.idwsetup_initial.ias_rtn_data[li_col] += ';'
							lod_handle.idwsetup_initial.ias_rtn_data[li_col] += string(lc_dwservice.f_getitemany_dwc(vdwc_handle, ll_found, las_rtn_columns[li_col]))
							exit
						end if						
						lod_handle.idwsetup_initial.ias_rtn_data[li_col] += string(lc_dwservice.f_getitemany_dwc(vdwc_handle, ll_found, las_rtn_columns[li_col]))
						if li_colCnt > 1 then exit
					end if
				NEXT
			else
				//-- kiểm tra có chấp nhận giá trị ngoài danh sách --//
				if lod_handle.idwsetup_initial.f_is_valueset_accept_out_of_list_value(this.dataobject, vs_colname ) then return 0
				
				ib_dataerror = true
				lod_handle.idwsetup_initial.ias_rtn_data[] = las_empty[]
				lod_handle.idwsetup_initial.iaa_rtn_data[] = laa_empty[]
				gf_messagebox('m.t_dw_mpl.f_check_valueset.03','Thông báo','Dữ liệu sau không được phép: @'+ls_data[li_idx] ,'Exclamation','ok',1)
				return -1
			end if
		NEXT
	end if
end if
return 1
end function

public function long f_select_detail (boolean vb_selected);/*
return 1: success

*/
int 						li_idx
long 					ll_row
double				ldb_object_ref_id
datawindow			ladw_details[]

ldb_object_ref_id = this.getitemnumber( this.getrow(), 'id')
FOR li_idx = 1 TO upperbound(iadw_detail)
	
	ll_row = iadw_detail[li_idx].find("ID ="+string(ldb_object_ref_id),1,iadw_detail[li_idx].rowcount()) 
	DO while ll_row> 0 
		if vb_selected then
			 iadw_detail[li_idx].setitem(ll_row,'gutter','Y')
		else
			 iadw_detail[li_idx].setitem(ll_row,'gutter','N')
		end if
		if iadw_detail[li_idx].dynamic f_getdwdetails(ladw_details[]) > 0 then
			 iadw_detail[li_idx].dynamic f_select_detail(vb_selected)
		end if
		ll_row = iadw_detail[li_idx].find("ID ="+string(ldb_object_ref_id), ll_row +1 ,iadw_detail[li_idx].rowcount()+1) 
	LOOP

NEXT
return 1

end function

public subroutine f_set_ib_relation_1_1 (boolean vb_relation_1_1);ib_relation_1_1 = vb_relation_1_1

end subroutine

public function boolean f_get_ib_relation_1_1 ();return ib_relation_1_1

end function

public function integer f_get_data_pic (s_object_display vobj_handle, ref string rs_pic_ref_table, ref string rs_pic_ref_field, ref string rs_pic_ref_colname, string vs_colname);s_str_dwo_tabpage	lstr_dwo_tab[]
s_str_dwo				lstr_dwo[]
s_str_report			lstr_report

int				li_idx,li_idx1

if (pos(vobj_handle.classname(),'ur_') > 0 and vs_colname = 'p_logo') or vobj_handle.classname() = 'b_view' then
	vobj_handle.f_get_str_report( lstr_report)
	rs_pic_ref_table = lstr_report.s_pic_ref_table
	rs_pic_ref_field = lstr_report.s_pic_ref_field
	rs_pic_ref_colname = lstr_report.s_pic_ref_colname
	if len(rs_pic_ref_colname) =0 or  len(rs_pic_ref_field) = 0 or len(rs_pic_ref_table) =0 then return -1
	return 1
elseif (pos(vobj_handle.classname(),'ur_') > 0 or pos(vobj_handle.classname(),'u_') > 0) and vs_colname = 'p_1' then
	vobj_handle.f_get_dwo_tabpage( lstr_dwo_tab[])
	for li_idx = 1 to upperbound(lstr_dwo_tab)
		for li_idx1 = 1 to upperbound(lstr_dwo_tab[li_idx].str_dwo )
			if lstr_dwo_tab[li_idx].str_dwo[li_idx1].s_dwo_default = this.dataobject then
				rs_pic_ref_table = lstr_dwo_tab[li_idx].str_dwo[li_idx1].s_pic_ref_table
				rs_pic_ref_field = lstr_dwo_tab[li_idx].str_dwo[li_idx1].s_pic_ref_field
				rs_pic_ref_colname = lstr_dwo_tab[li_idx].str_dwo[li_idx1].s_pic_ref_colname
				if len(rs_pic_ref_colname) =0 or  len(rs_pic_ref_field) = 0 or len(rs_pic_ref_table) =0 then return -1
				return 1
			end if
		next
	next
elseif pos(vobj_handle.classname(),'ur_') = 0 and vs_colname = 'p_logo'  then
	vobj_handle.f_get_dwo( lstr_dwo[])
	for li_idx = 1 to upperbound(lstr_dwo)
		if lstr_dwo[li_idx].s_dwo_default = this.dataobject then
			rs_pic_ref_table = lstr_dwo[li_idx].s_pic_ref_table
			rs_pic_ref_field = lstr_dwo[li_idx].s_pic_ref_field
			rs_pic_ref_colname = lstr_dwo[li_idx].s_pic_ref_colname
			if len(rs_pic_ref_colname) =0 or  len(rs_pic_ref_field) = 0 or len(rs_pic_ref_table) =0 then return -1
			return 1
		end if
	next
	vobj_handle.f_get_dwo_tabpage( lstr_dwo_tab[])
	for li_idx = 1 to upperbound(lstr_dwo_tab)
		for li_idx1 = 1 to upperbound(lstr_dwo_tab[li_idx].str_dwo )
			if lstr_dwo_tab[li_idx].str_dwo[li_idx1].s_dwo_default = this.dataobject then
				rs_pic_ref_table = lstr_dwo_tab[li_idx].str_dwo[li_idx1].s_pic_ref_table
				rs_pic_ref_field = lstr_dwo_tab[li_idx].str_dwo[li_idx1].s_pic_ref_field
				rs_pic_ref_colname = lstr_dwo_tab[li_idx].str_dwo[li_idx1].s_pic_ref_colname
				if len(rs_pic_ref_colname) =0 or  len(rs_pic_ref_field) = 0 or len(rs_pic_ref_table) =0 then return -1
				return 1
			end if
		next
	next
elseif pos(vobj_handle.classname(),'valueset') > 0 and vs_colname = 'p_1' then
	rs_pic_ref_table = 'ATTACHMENT'
	rs_pic_ref_field = 'ID'
	rs_pic_ref_colname = 'ATTACH_DOC'
	return 1
end if
return 0
end function

public function string f_get_path_pic (string vs_pic_ref_table, string vs_pic_ref_colname, double vdb_ref_id, t_transaction vt_transaction);string				ls_pic_name,ls_sql,ls_default_directory,ls_path
blob				lblb_logo
int					li_fileidx
		
ls_pic_name =vs_pic_ref_colname+'_'+string(vdb_ref_id) + '.jpg'
ls_default_directory = gs_path_pic
ls_path = ls_default_directory + '\pics\' + ls_pic_name
if FileExists ( ls_path ) then
	return ls_path
end if
if upper(vs_pic_ref_table) = 'LEGAL_ENTITY' then
	ls_sql = 'select '+vs_pic_ref_colname+' from '+vs_pic_ref_table+' where id = ?'
else
	ls_sql = 'select '+vs_pic_ref_colname+' from '+vs_pic_ref_table+' where object_ref_id = ?'
end if

DECLARE cursor_pic DYNAMIC CURSOR FOR SQLSA ;
PREPARE SQLSA         
		FROM :ls_sql
		using vt_transaction;
OPEN DYNAMIC cursor_pic using :vdb_ref_id ;
FETCH cursor_pic INTO :lblb_logo ;
CLOSE cursor_pic ;

if len(lblb_logo) > 0 then
	li_fileidx = FileOpen(ls_path, StreamMode!, Write!, LockWrite!, Replace!)
	FileWriteEx(li_fileidx,lblb_logo)
	FileClose(li_fileidx)
end if
return ls_path
end function

public function boolean f_get_ib_delete (s_str_policy_attr vstr_security_attr, s_str_policy_attr vstr_rule_attr);return ib_delete and  vstr_security_attr.b_delete and vstr_rule_attr.b_delete
end function

public function boolean f_get_ib_insert (s_str_policy_attr vstr_security_attr, s_str_policy_attr vstr_rule_attr);return ib_insert and vstr_security_attr.b_insert and vstr_rule_attr.b_insert
end function

public function boolean f_get_ib_query (s_str_policy_attr vstr_security_attr, s_str_policy_attr vstr_rule_attr);return ib_query and  vstr_security_attr.b_query and vstr_rule_attr.b_query
end function

public function boolean f_get_ib_update (s_str_policy_attr vstr_security_attr, s_str_policy_attr vstr_rule_attr);return ib_update and  vstr_security_attr.b_update and vstr_rule_attr.b_update
end function

public subroutine f_set_ib_keyboardlocked (boolean vb_keyboardlocked);ib_keyboardlocked = vb_keyboardlocked

end subroutine

public function boolean f_get_ib_keyboardlocked ();return ib_keyboardlocked 

end function

public function string f_buildwhereclause_of_company ();boolean				lb_branch_yn
string 				ls_whereclause, ls_modify, ls_currentSQL, ls_currentWhere,ls_rtn, ls_dbname, ls_coltype
c_sql					lc_sql
c_dwservice			lc_dwservice
window				lw_display
s_object_display	lod_handle, lod_parent

//-- company --//
if this.f_is_company( ) then
	ls_dbname = 'company_id'
	lc_dwservice.f_get_build_column( this,ls_dbname, ls_coltype)
	ls_whereclause = ls_dbname+ " =" + string(gi_user_comp_id)
end if

//-- branch --//
if this.f_is_branch( ) then
	this.f_getparentwindow( lw_display)
	lod_handle = lw_display.dynamic f_get_obj_handling()	
	lb_branch_yn =  lod_handle.idwsetup_initial.f_is_branch_yn( this.dataobject )
	
	if lod_handle.classname( ) <> 'u_valueset' then
		lb_branch_yn =  lod_handle.idwsetup_initial.f_is_branch_yn( this.dataobject )
	else
		lod_parent = lod_handle.f_get_main_object( )
		lb_branch_yn =  lod_parent.idwsetup_initial.f_is_branch_yn( lod_handle.is_dwo_have_valueset  )
	end if
	if lb_branch_yn then
		ls_dbname = 'branch_id'
		lc_dwservice.f_get_build_column( this, ls_dbname, ls_coltype)
		if ls_whereclause <> '' then ls_whereclause +=  ' AND '
		ls_whereclause = ls_whereclause + ls_dbname+ ' =' + string(gdb_branch)
	end if
end if


return ls_whereclause

end function

public subroutine f_openmap (string vs_bt_name);string				ls_chrome, ls_adrress, ls_address_col
c_string			lc_string

RegistryGet( "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Google\Update", "LastInstallerSuccessLaunchCmdLine", RegString!, ls_chrome)
if isnull(ls_chrome) or ls_chrome = '' then
	gf_messagebox('m.t_dw_mpl.f_openmap.01','Thông báo','Xem địa chỉ trên google Map, cần cài đặt Chrome', 'stop', 'ok',1)
	return
end if
ls_chrome = lc_string.f_globalreplace( trim(ls_chrome), '"', '')

ls_address_col = this.describe( vs_bt_name+".tag")
if ls_address_col = '' or isnull(ls_address_col) then
	ls_adrress = '74 Cù Lao, phường 2, Q. Phú nhuận, HCM'
else
	ls_adrress = this.getitemstring( this.getrow(),ls_address_col )
end if
ls_adrress = lc_string.f_globalreplace( trim(ls_adrress), ' ', '+')
ls_chrome += ' www.google.com/maps/search/'+ls_adrress
run(ls_chrome) 

/*
window 					lw_parent
c_string					lc_string
powerobject 			lc_object_handle
s_str_dwo_related 	ls_str_dwo_related[]
string						ls_object_name

this.f_getparentwindow( lw_parent)
lc_object_handle = lw_parent.dynamic f_get_obj_handling()
ls_object_name = lc_string.f_globalreplace( vs_bt_name, 'b_', 'u_')
lc_object_handle.dynamic f_get_data_related(ls_object_name,ls_str_dwo_related[])
lw_parent.dynamic f_build_data_related(ls_str_dwo_related)		
lc_object_handle.dynamic f_set_data_related(ls_str_dwo_related)
lw_parent.dynamic f_openchildwithparm('s_w_map_n','c_map_n;0')
*/
end subroutine

public function boolean f_get_ib_saving ();return ib_saving
end function

public subroutine f_set_ib_dropdowning (boolean vb_dropdowning);ib_dropdowning = vb_dropdowning

end subroutine

public function integer f_setitem_returndata (string vs_colname, long vl_row);
return this.f_setitem_returndata(vs_colname ,vl_row, false)

end function

public function integer f_update_column_4_all_row (string vs_colname, long vl_currentrow, string vs_data);string	ls_coltype
int		li_rtn
long	ll_row

s_w_main			lw_parent
t_dw_mpl			ldw_handle
s_object_display	lod_handle

this.f_getparentwindow(lw_parent )
lod_handle = lw_parent.f_get_obj_handling( )
ldw_handle = this
ls_coltype =  this.describe( vs_colname+ '.coltype' )
FOR ll_row = vl_currentrow to this.rowcount( )
	choose case left(ls_coltype,5)
		case 'numbe', 'decim'
			li_rtn = this.setitem(ll_row, vs_colname, double(vs_data))
		case 'char('
			li_rtn = this.setitem(ll_row, vs_colname, vs_data)
		case 'date','datet'
			li_rtn = this.setitem(ll_row, vs_colname, date(vs_data))
	end choose
	if ll_row > vl_currentrow then
		lod_handle.event e_dw_e_itemchanged( ldw_handle, ll_row, vs_colname, vs_data)
	end if
NEXT
return 0
end function

protected function integer f_buildwhereclause_4_dwdetail (ref string as_where);
string					ls_table_m, ls_table_alias_m, ls_join_m, ls_where_m
c_dwservice			lc_dwservice
window				lw_display
s_object_display	lod_handle

if ib_isdetail then	
	if isvalid(idw_master) then
		this.f_getparentwindow(lw_display)
		lod_handle= lw_display.dynamic f_get_obj_handling()
		if lod_handle.ib_copying or lod_handle.ib_allocating then
			this.f_buildwhereclause_of_masterkey( as_where)
		else			
			if lc_dwservice.f_parse_fromwhere_clause(idw_master, ls_table_m, ls_table_alias_m, ls_join_m, ls_where_m) = -1 then return -1
			if ls_where_m <> '' then
				if as_where <> '' then
					as_where = as_where + ' AND '+ ls_where_m
				else
					as_where = ls_where_m 
				end if
			end if
		end if
		return 1
	else
		return -1
	end if
else
	return 0
end if

end function

public function long f_retrieve_detail_old ();/*
return 1: success

*/
int 					li_idx, li_idx2, li_cnt
long 					ll_originrow, ll_rows
double				ldb_id
string					ls_originFilter
window				lw_parent
datawindow			ladw_details[]
s_object_display	lpo_handling


this.f_getparentwindow( lw_parent)
lpo_handling = lw_parent.dynamic f_get_obj_handling()
FOR li_idx = 1 TO upperbound(iadw_detail)
	if iadw_detail[li_idx].getrow() > 0 then
		//-- nhớ lại Id trước khi retreive --//
		ldb_id = iadw_detail[li_idx].getitemnumber(iadw_detail[li_idx].getrow(), 'ID')
		if isnull(ldb_id) then ldb_id = 0
	end if
	if lpo_handling.ib_copying  Then
		iadw_detail[li_idx].setfilter('')
		iadw_detail[li_idx].filter()
	end if
	iadw_detail[li_idx].dynamic event e_retrieve() //-- e_retrieve() return 0 lỗi hệ thống--//

	ll_rows = iadw_detail[li_idx].rowcount()
	if ldb_id > 0 then
		//-- Tìm lại record trước khi retrieve --//
		ll_originrow = iadw_detail[li_idx].find(" ID = " + string(ldb_id), 1, ll_rows)
		if ll_originrow > 1 then
			iadw_detail[li_idx].scrolltorow(ll_originrow)
		end if
	end if
	li_cnt = iadw_detail[li_idx].dynamic f_getdwdetails(ladw_details[])
	
	if  iadw_detail[li_idx].dynamic f_get_ib_master() and iadw_detail[li_idx].dynamic f_get_ib_detail()  and li_cnt > 0 and not lpo_handling.ib_copying  Then
		//--filter detail --//
		iadw_detail[li_idx].dynamic f_filter_detail( )
	End If		
	
	if ll_rows = 0 then		
		if li_cnt > 0 then
			For li_idx2 = 1 to li_cnt
				ll_rows = ladw_details[li_idx2].reset() //event e_retrieve()
			NEXT
		end if
	else
		if li_cnt > 0 then
			iadw_detail[li_idx].dynamic f_retrieve_detail()
		end if
	end if
NEXT
return ll_rows

end function

public function string f_get_sql_join_master (string vs_dwo_detail);string			ls_joinSQL, ls_table_m, ls_table_alias_m, ls_join_m, ls_where_m, ls_detail_colname, ls_coltype, ls_Onclause
string			ls_detailSQL, ls_detailWhere, ls_join_remain, ls_group_by
int				li_idx, li_pos, li_rtn
c_dwservice			lc_dwservice
c_string				lc_string
t_ds					lds_tmp
c_sql					lc_sql
t_s_sql_attr			lstr_sql_attr[]


lds_tmp = create t_ds
lds_tmp.dataobject = vs_dwo_detail
lds_tmp.f_getcurrentsql(ls_detailSQL , ls_detailWhere)
destroy lds_tmp

if lc_dwservice.f_parse_fromwhere_clause(this.idw_master ,ls_table_m, ls_table_alias_m, ls_join_m, ls_where_m) = -1 then 
	gf_messagebox('m.t_dw_mpl.f_get_sql_join_master.01','Thông báo','Lỗi parse JOIN clause của DW master','stop','ok',1)
	return ''
end if
FOR li_idx = 1 to upperbound(ias_master_keycol[])
	if ls_Onclause <> '' then ls_onclause += ' AND '
	if this.ib_keynull = false then
		if ls_table_alias_m = '' then
			ls_Onclause += ls_table_m + '.' + ias_master_keycol[li_idx]
		else
			ls_Onclause += ls_table_alias_m + '.' + ias_master_keycol[li_idx]
		end if			
		ls_detail_colname = ias_detail_keycol[li_idx]
		lc_dwservice.f_get_build_column( this, ls_detail_colname, ls_coltype)
		ls_onclause += ' = ' + ls_detail_colname
	else
		ls_detail_colname = ias_detail_keycol[li_idx]
		lc_dwservice.f_get_build_column( this, ls_detail_colname, ls_coltype)
		if left(ls_coltype, 5) = 'char(' then
			if ls_table_alias_m = '' then
				ls_Onclause += " coalesce("+ ls_table_m + '.' + ias_master_keycol[li_idx]+ ", ~~'~~') "
			else
				ls_Onclause += " coalesce("+ls_table_alias_m + '.' + ias_master_keycol[li_idx]+ ", ~~'~~') "
			end if					
			ls_detail_colname = " coalesce("+ ls_detail_colname+ ", ~~'~~') "
		elseif left(ls_coltype, 5) = 'numbe' then
			if ls_table_alias_m = '' then
				ls_Onclause += " coalesce("+ ls_table_m + '.' + ias_master_keycol[li_idx]+ ",0) "
			else
				ls_Onclause += " coalesce("+ ls_table_alias_m + '.' + ias_master_keycol[li_idx]+ ",0) "
			end if					
			ls_detail_colname = " coalesce("+ ls_detail_colname+ ",0) "
		end if
		ls_onclause += ' = ' + ls_detail_colname					
	end if
NEXT
//-- remove LRF join --//
if ls_table_alias_m = '' then
	ls_join_m = lc_sql.f_remove_LRF_join_ex(ls_join_m, ls_where_m, ls_table_m)
else
	ls_join_m = lc_sql.f_remove_LRF_join_ex(ls_join_m, ls_where_m, ls_table_alias_m)
end if

//-- Tách GROUP clause trước khi join, sau đó gắn lại--//
li_rtn = lc_sql.f_parse( ls_detailSQL, lstr_sql_attr[])
if li_rtn = 1 then
	ls_group_by = lstr_sql_attr[1].s_group
	lstr_sql_attr[1].s_group = ''
	ls_detailSQL = lc_sql.f_assemble( lstr_sql_attr[])
	
	ls_joinSQL = ls_detailSQL + ' JOIN ' + ls_table_m +' ' + ls_table_alias_m + ' ON ' + ls_onclause + ' ' + ls_join_m
	//-- gắn GROUP BY lại --//
	if ls_group_by <> '' and not isnull(ls_group_by) then
		ls_joinSQL += ' GROUP BY '+ ls_group_by
	end if	
else
	FOR li_idx = 1 to li_rtn
		ls_joinSQL = lstr_sql_attr[li_idx].s_tables + ' JOIN ' + ls_table_m +' ' + ls_table_alias_m + ' ON ' + ls_onclause + ' ' + ls_join_m
		lstr_sql_attr[li_idx].s_tables = ls_joinSQL
	NEXT
	ls_joinSQL = lc_sql.f_assemble( lstr_sql_attr[])
end if



return ls_joinSQL
end function

public function string f_get_detail_filterstring (t_dw_mpl vdw_detail, boolean vb_doc_filter);/*
return 1: success

*/
int 					li_idx, li_cnt
long 					ll_master_currow
string					las_master_keycol[], las_detail_keycol[], ls_filterString, ls_ColType, ls_data, ls_dbname
double				ldb_data, ldb_doc_id
string					ls_master_key_value
boolean				lb_doc_trace
window				lw_parent
t_dw_mpl			ldw_main
s_object_display	lod_handle
c_dwservice			lc_dwservice
c_string				lc_string


this.f_getparentwindow( lw_parent)
lod_handle = lw_parent.dynamic f_get_obj_handling()
ldw_main = lw_parent.dynamic f_get_dwmain()

li_cnt = vdw_detail.f_get_detail_keycol(las_detail_keycol[])
li_cnt = vdw_detail.f_get_master_keycol(las_master_keycol[])
FOR li_idx = 1 to li_cnt
	//-- lấy tên cột của detail --//
	ls_dbname =  las_detail_keycol[li_idx]
	ls_colType =  vdw_detail.describe(ls_dbname +'.Coltype')

	if lw_parent.dynamic f_get_ib_doc_trace_on() then
		if vdw_detail.describe( "version_no.coltype" ) = 'number' then
			ls_dbname = 'ID'
			ls_colType =  vdw_detail.describe(ls_dbname +'.Coltype')
			lb_doc_trace = true
		end if
	end if

	if  lod_handle.is_copy_stage = 'data_getting' then // (lod_handle.ib_copying or lod_handle.ib_allocating) and 
		if this.dataobject = ldw_main.dataobject then
			ll_master_currow = this.find( "gutter = 'Y'", 1, this.rowcount())
			if ll_master_currow = 0 then ll_master_currow =  this.getrow()	
		else
			if this.rowcount( ) > 0 then	ll_master_currow = 1
		end if
	elseif vb_doc_filter then
		if this.dataobject = ldw_main.dataobject then
			ll_master_currow = this.getrow()
		else
			if this.rowcount( ) > 0 then	ll_master_currow = 1
		end if		
	else
		ll_master_currow = this.getrow()		
	end if
	
	DO while ll_master_currow > 0 and ll_master_currow <= this.rowcount( )
		if ls_data <>'' then
			ls_data +=';'
		end if		
		if lb_doc_trace then
			ls_data += string(this.f_getitemany(ll_master_currow, 'extend_id'))
		else
			ls_data += string(this.f_getitemany(ll_master_currow, las_master_keycol[li_idx]))
		end if
		if lod_handle.is_copy_stage = 'data_getting' then // (lod_handle.ib_copying or lod_handle.ib_allocating ) and
			if this.dataobject = ldw_main.dataobject then
				ll_master_currow = this.find( "gutter = 'Y'", ll_master_currow+1, this.rowcount()+1)
			else
				ll_master_currow++
			end if
		elseif vb_doc_filter then
			if this.dataobject = ldw_main.dataobject then
				ll_master_currow = 0
			else
				ll_master_currow++
			end if			
		else
			ll_master_currow = 0
		end if		
	LOOP
	//-- lấy thêm dòng getrow của main nếu đang là copy to --//
	if lod_handle.is_copy_type = 'copyt'  and this.dataobject = ldw_main.dataobject and lod_handle.ib_copying  and lod_handle.is_copy_stage = 'data_getting'  then //
		if this.ib_inserting = true then
			if isnull(this.getitemstring(this.getrow( ),'gutter')) or this.getitemstring(this.getrow( ),'gutter') = 'N' then
				if trim(ls_data) <> '' then ls_data = ''		
				ls_data = string(this.f_getitemany(this.getrow( ) , las_master_keycol[li_idx]))
			end if			
		else
			if isnull(this.getitemstring(this.getrow( ),'gutter')) or this.getitemstring(this.getrow( ),'gutter') = 'N' then
				if trim(ls_data) <> '' then ls_data +=';'		
				ls_data += string(this.f_getitemany(this.getrow( ) , las_master_keycol[li_idx]))
			end if
		end if
	end if
	
	if isnull(ls_data) then
		ls_data = '()'
	elseif  ls_data = '' then
		if lod_handle.ib_allocating then
			ls_filterString = ''
		else
			if  left(ls_colType, 4) = 'numb' then
				ls_filterString =  las_detail_keycol[li_idx]+'= 0'
			else
				ls_filterString =  las_detail_keycol[li_idx]+ "= '' "
			end if
		end if
		exit
	end if
	if pos(ls_data,';')>0 then 
		ls_data = '('+ls_data+')'
	else
		if left(ls_colType, 4) = 'char' then
			if ls_data <> '()' then
				ls_data = '='+ls_data
			end if
		end if		
	end if			
	if ls_filterString <> '' then ls_filterString += ' AND '
	ls_filterString += lc_string.f_get_expression(ls_data , ls_coltype, ls_dbname,'filter')			
	//xóa biến ls_data để tranh trường hợp cộng dồn do nhiều cột master key
	ls_data = ''		
NEXT


return ls_filterString

end function

public function integer f_setnull_columns (string vas_colname[], long vl_row);string		ls_null
date		ld_null
datetime	ldt_null
long		ll_null
time		lt_null
int			li_idx

FOR li_idx = 1 to upperbound(vas_colname[])
	CHOOSE CASE Lower ( Left ( this.Describe ( vas_colname[li_idx] + ".ColType" ) , 5 ) )
			CASE "char(", "char"		//  CHARACTER DATATYPE
				setnull(ls_null)
				this.setitem( vl_row, vas_colname[li_idx], ls_null)
			CASE "date"					//  DATE DATATYPE
				setnull(ld_null)
				this.setitem( vl_row, vas_colname[li_idx], ld_null)
			CASE "datet"				//  DATETIME DATATYPE
				setnull(ldt_null)
				this.setitem( vl_row, vas_colname[li_idx], ldt_null)
			CASE "decim", "numbe", "long", "ulong", "real", "int"				//  NUMBER DATATYPE	
				setnull(ll_null)
				this.setitem( vl_row, vas_colname[li_idx], ll_null)
			CASE "time", "times"		//  TIME DATATYPE
				setnull(lt_null)
				this.setitem( vl_row, vas_colname[li_idx], lt_null)
	END CHOOSE
	
NEXT

Return 1
end function

public function boolean f_is_sob ();
string		ls_colvisible


ls_colvisible = this.Describe ("sob.coltype" )
if ls_colvisible = '!' then 
	return false
else
	return true
end if
end function

public function string f_buildwhereclause_of_sob ();
string 			ls_rtn, ls_dbname, ls_coltype,ls_whereclause
c_dwservice		lc_dwservice


//-- sob --//
if this.f_is_sob( ) then
	ls_dbname = 'sob'
	lc_dwservice.f_get_build_column( this,ls_dbname, ls_coltype)
	ls_whereclause = +ls_dbname+ " = '" + gs_sob + "'"
end if

return ls_whereclause

end function

public function integer f_send_message_to_object (ref datawindow rdw_focus, ref datawindow vdw_source, long vl_currentrow, dwobject dwo, string vs_message);int 					li_rtn
s_object_display		lpo_handling
window				lw_display
if this.f_getparentwindow( lw_display) = 1 then
	lpo_handling = lw_display.dynamic f_get_obj_handling()
	if isvalid(lpo_handling) then
		return lpo_handling.f_handle_message(rdw_focus,vdw_source,vl_currentrow, dwo, vs_message)
	end if
end if
return -1
end function

public function integer f_set_target_data ();/**************************************************************************************
Chức năng: copy thông tin từ dwo source vào row đầu tiên cùa dwo target nếu dwo target đã có dữ liệu thì không copy
------------------------------------------------------------------------------------------------------------------------------------------
Return 1 : ok
		 0 : Không có nội dung copy
		 -1: error
============================================================================*/
t_dw_mpl		ldw_source
s_w_main		lw_parent
any				la_data_source, la_data_target

if is_dwo_source = '' then return 0
if is_col_source = '' then return 0
if is_col_target = '' then return 0
if this.rowcount( ) > 0 then
	this.f_getparentwindow( lw_parent)
	ldw_source = lw_parent.f_get_dw(is_dwo_source )
	if not isvalid(ldw_source) then
		gf_messagebox('m.t_dw_mpl.f_set_target_data.01','Thông báo','Không tìm thấy DWO nguồn do cài đặt tên DWO trong structure chưa đúng','stop','ok', 1)
	end if
	la_data_source = ldw_source.f_getitemany( ldw_source.getrow() , is_col_source)
	la_data_target = this.f_getitemany( 1, is_col_target)
	if isnull(la_data_target) then 
		return this.setitem( 1, is_col_target, la_data_source)
	else
		return 0
	end if
end if

return 0
end function

public function integer f_update_column_4_all_row (string vs_colname, long vl_currentrow);long					ll_row, ll_row_setup
int						li_idx, li_colCnt, li_null, li_rtn
string					ls_receive_column, ls_coltype, ls_dwdatatype, las_receive_colname[], ls_null
boolean				lb_valueset_receive_number
date					ldt_null

window				lw_display
s_object_display	lod_handle
c_string				lc_string


if vl_currentrow = 0 then return 0
this.f_getparentwindow( lw_display)
lod_handle = lw_display.dynamic f_get_obj_handling()

ls_coltype =  this.describe( vs_colname+ '.coltype' )
ll_row_setup = lod_handle.idwsetup_initial.f_get_dwdatatype_string( vs_colname, ls_coltype, this, ls_dwdatatype)
ls_receive_column = lod_handle.idwsetup_initial.ids_setup_dw.getitemstring( ll_row_setup,'receive_column')
li_colCnt = lc_string.f_stringtoarray(ls_receive_column , ';', las_receive_colname[])
lb_valueset_receive_number = lod_handle.idwsetup_initial.f_is_valueset_receive_number(this.dataobject, ls_receive_column) 

FOR ll_row = vl_currentrow to this.rowcount( )
	FOR li_idx = 1 to li_colCnt
		if  lb_valueset_receive_number then
			if upperbound( lod_handle.idwsetup_initial.iaa_rtn_data[]) = 0 then 
				ls_coltype = this.describe( las_receive_colname[li_idx]+'.coltype')
				choose case left(ls_coltype,5)
					case 'numbe', 'decim'
						setnull(li_null)
						li_rtn = this.setitem(ll_row, las_receive_colname[li_idx] , li_null)
					case 'char('
						setnull(ls_null)
						li_rtn = this.setitem(ll_row, las_receive_colname[li_idx] , ls_null)
					case 'date','datet'
						setnull(ldt_null)
						li_rtn = this.setitem(ll_row, las_receive_colname[li_idx] , ldt_null)
				end choose
			else
				li_rtn = this.setitem(ll_row, las_receive_colname[li_idx] ,  lod_handle.idwsetup_initial.iaa_rtn_data[li_idx])
			end if
		else
			if  upperbound( lod_handle.idwsetup_initial.ias_rtn_data[]) = 0 then
				ls_coltype = this.describe( las_receive_colname[li_idx]+'.coltype')
				choose case left(ls_coltype,5)
					case 'numbe', 'decim'
						setnull(li_null)
						li_rtn = this.setitem(ll_row, las_receive_colname[li_idx] , li_null)
					case 'char('
						setnull(ls_null)
						li_rtn = this.setitem(ll_row, las_receive_colname[li_idx] , ls_null)
					case 'date','datet'
						setnull(ldt_null)
						li_rtn = this.setitem(ll_row, las_receive_colname[li_idx] , ldt_null)
				end choose			
			else
				ls_coltype = this.describe( las_receive_colname[li_idx]+'.coltype')
				choose case left(ls_coltype,5)
					case 'numbe', 'decim'
						li_rtn = this.setitem(ll_row, las_receive_colname[li_idx] , dec(lod_handle.idwsetup_initial.ias_rtn_data[li_idx]))
					case 'char('
						ls_receive_column = string(lod_handle.idwsetup_initial.ias_rtn_data[li_idx])
						li_rtn = this.setitem(ll_row, las_receive_colname[li_idx] , string(lod_handle.idwsetup_initial.ias_rtn_data[li_idx]))
					case 'date','datet'
						li_rtn = this.setitem(ll_row, las_receive_colname[li_idx] , date(lod_handle.idwsetup_initial.ias_rtn_data[li_idx]))
				end choose
			end if
		end if
		if li_rtn = - 1 then
			gf_messagebox('m.t_dw_mpl.f_setitem_returndata.01','Thông báo','Không gán được dữ liệu vào cột: @'+ las_receive_colname[li_idx], 'exclamation', 'ok',1)
			return -1
		end if	
	NEXT
NEXT

return 1
end function

public function integer f_setitem_returndata (string vs_colname, long vl_row, boolean vb_check_upcopy);string				ls_receive_column, las_receive_colname[], ls_data, las_empty[], las_data[], las_return_cols[]
string				ls_col_curcode, ls_curcode, ls_col_exrate, ls_null, ls_coltype, ls_dwdatatype, ls_dwo,ls_coltext
any				laa_empty[],la_data, la_null
int					li_idx, li_colCnt, li_rtn, li_null, li_chk
long				ll_row_setup, ll_row_upd
boolean			lb_valueset_receive_number,lb_is_mat
double			ldb_exrate
datetime			ldt_null
date				ld_prior_period_date, ld_last_period_date

c_string				lc_string
c_dwservice			lc_dwservice
window				lw_display
s_object_display	lod_handle
datawindowchild	ldwc
b_obj_instantiate	lb_obj_ins

setnull(la_null)
this.f_getparentwindow( lw_display)
lod_handle = lw_display.dynamic f_get_obj_handling()

ls_coltype =  this.describe( vs_colname+ '.coltype' )
ll_row_setup = lod_handle.idwsetup_initial.f_get_dwdatatype_string( vs_colname, ls_coltype, this, ls_dwdatatype)

ls_receive_column = lod_handle.idwsetup_initial.ids_setup_dw.getitemstring( ll_row_setup,'receive_column')

li_chk = lod_handle.f_get_colname_exchange_rate( this,ls_receive_column, ls_col_curcode, ls_col_exrate)
						

li_colCnt = lc_string.f_stringtoarray(ls_receive_column , ';', las_receive_colname[])
lb_valueset_receive_number = lod_handle.idwsetup_initial.f_is_valueset_receive_number(this.dataobject, ls_receive_column) 
FOR li_idx = 1 to li_colCnt
	//--set tỷ giá
	if li_chk = 1 and upperbound( lod_handle.idwsetup_initial.iaa_rtn_data[]) > 0  then				
		if las_receive_colname[li_idx] = ls_col_curcode  then
			//-- sau này sửa lại lấy ngày session date --//
			ldb_exrate = lod_handle.f_get_exchange_rate_ex( string(lod_handle.idwsetup_initial.iaa_rtn_data[li_idx]), gd_session_date)
			this.setitem( vl_row, ls_col_exrate, ldb_exrate)
		end if
	end if	
	
	if las_receive_colname[li_idx] = vs_colname then
		//-- kiểm tra cột không được sửa khi đã kết phiếu--//
		if upperbound( lod_handle.idwsetup_initial.iaa_rtn_data[]) > 0 then
			la_data = this.f_getitemany( vl_row, vs_colname)
			if lb_valueset_receive_number or ls_dwdatatype='STRUCT_SEGMENT'  then
				lb_is_mat = lb_obj_ins.f_is_matched( lod_handle, vs_colname, this, la_data,lod_handle.idwsetup_initial.iaa_rtn_data[li_idx] )
			else
				lb_is_mat = lb_obj_ins.f_is_matched( lod_handle, vs_colname, this, la_data,lod_handle.idwsetup_initial.iaa_rtn_data[li_idx] )
			end if	
		end if
		if lb_is_mat then
			ls_coltext = lc_dwservice.f_getcolumnlabel(vs_colname , this.dataobject, upper(lod_handle.classname( )) )
			gf_messagebox('m.b_doc.e_itemchanged.01','Thông báo','Phiếu đã kết nên không được sửa cột sau: @'+ls_coltext, 'exclamation','ok',1)
			this.ib_dataerror = true
			return -1
		end if
		if lb_valueset_receive_number or ls_dwdatatype='STRUCT_SEGMENT'  then
			if upperbound( lod_handle.idwsetup_initial.iaa_rtn_data[]) = 0 then 
				if pos(ls_receive_column,';') > 0 then  this.settext('' )
			else
				this.settext( lod_handle.idwsetup_initial.iaa_rtn_data[li_idx] )
			end if
		else		
			if  upperbound( lod_handle.idwsetup_initial.ias_rtn_data[]) = 0 then
				this.settext('' )
			else
				this.settext(  lod_handle.idwsetup_initial.ias_rtn_data[li_idx] )
				this.setitem(vl_row, vs_colname ,  lod_handle.idwsetup_initial.ias_rtn_data[li_idx] )
			end if
		end if
	end if
	if  lb_valueset_receive_number or ls_dwdatatype='STRUCT_SEGMENT' then
		ls_coltype = this.describe( las_receive_colname[li_idx]+'.coltype')
		if upperbound( lod_handle.idwsetup_initial.iaa_rtn_data[]) = 0 then 			
			choose case left(ls_coltype,5)
				case 'numbe', 'decim'
					setnull(li_null)
					if this.getrow( ) <> vl_row or las_receive_colname[li_idx] <> vs_colname then li_rtn = this.setitem(vl_row, las_receive_colname[li_idx] , li_null)
				case 'char('
					setnull(ls_null)
					if this.getrow( ) <> vl_row or las_receive_colname[li_idx] <> vs_colname then li_rtn = this.setitem(vl_row, las_receive_colname[li_idx] , ls_null)
				case 'date','datet'
					setnull(ldt_null)
					if this.getrow( ) <> vl_row or las_receive_colname[li_idx] <> vs_colname then li_rtn = this.setitem(vl_row, las_receive_colname[li_idx] , ldt_null)
			end choose
		else
			if this.getrow( ) <> vl_row or las_receive_colname[li_idx] <> vs_colname then
				if not isnull( lod_handle.idwsetup_initial.iaa_rtn_data[li_idx]) then
					li_rtn = this.setitem(vl_row, las_receive_colname[li_idx] ,  lod_handle.idwsetup_initial.iaa_rtn_data[li_idx])
				else
					choose case left(ls_coltype,5)
						case 'numbe', 'decim'
							setnull(li_null)
							li_rtn = this.setitem(vl_row, las_receive_colname[li_idx] , li_null)
						case 'char('
							setnull(ls_null)
							li_rtn = this.setitem(vl_row, las_receive_colname[li_idx] , ls_null)
						case 'date','datet'
							setnull(ldt_null)
							li_rtn = this.setitem(vl_row, las_receive_colname[li_idx] , ldt_null)
					end choose
				end if
			end if
		end if
	else
		if  upperbound( lod_handle.idwsetup_initial.ias_rtn_data[]) = 0 then
			ls_coltype = this.describe( las_receive_colname[li_idx]+'.coltype')
			choose case left(ls_coltype,5)
				case 'numbe', 'decim'
					setnull(li_null)
					if this.getrow( ) <> vl_row or las_receive_colname[li_idx] <> vs_colname then li_rtn = this.setitem(vl_row, las_receive_colname[li_idx] , li_null)
				case 'char('
					setnull(ls_null)
					if this.getrow( ) <> vl_row or las_receive_colname[li_idx] <> vs_colname then li_rtn = this.setitem(vl_row, las_receive_colname[li_idx] , ls_null)
				case 'date','datet'
					setnull(ldt_null)
					if this.getrow( ) <> vl_row or las_receive_colname[li_idx] <> vs_colname then li_rtn = this.setitem(vl_row, las_receive_colname[li_idx] , ldt_null)
			end choose			
		else
			ls_coltype = this.describe( las_receive_colname[li_idx]+'.coltype')
			choose case left(ls_coltype,5)
				case 'numbe', 'decim'
					if this.getrow( ) <> vl_row or las_receive_colname[li_idx] <> vs_colname then li_rtn = this.setitem(vl_row, las_receive_colname[li_idx] , dec(lod_handle.idwsetup_initial.ias_rtn_data[li_idx]))
				case 'char('
					ls_receive_column = string(lod_handle.idwsetup_initial.ias_rtn_data[li_idx])
					if this.getrow( ) <> vl_row or las_receive_colname[li_idx] <> vs_colname then li_rtn = this.setitem(vl_row, las_receive_colname[li_idx] , string(lod_handle.idwsetup_initial.ias_rtn_data[li_idx]))
				case 'date','datet'
					ld_prior_period_date = date(lod_handle.idwsetup_initial.ias_rtn_data[li_idx])
					if this.getrow( ) <> vl_row or las_receive_colname[li_idx] <> vs_colname then li_rtn = this.setitem(vl_row, las_receive_colname[li_idx] , date(lod_handle.idwsetup_initial.ias_rtn_data[li_idx]))
			end choose
		end if
	end if
	if li_rtn = - 1 then
		gf_messagebox('m.t_dw_mpl.f_setitem_returndata.01','Thông báo','Không gán được dữ liệu vào cột: @'+ las_receive_colname[li_idx], 'exclamation', 'ok',1)
		return -1
	end if

NEXT
//-- xử lý  copy dòng trên --//
if vb_check_upcopy then
	ls_dwo = left(this.dataobject, len(this.dataobject) - 5)
	ll_row_upd = lod_handle.idwsetup_initial.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" +vs_colname+ "' AND auto_copy_yn = 'Y'" ,1, lod_handle.idwsetup_initial.ids_setup_dw.rowcount( ))			
	if ll_row_upd > 0 then 
		if vl_row < this.rowcount( ) then
			if gf_messagebox('m.t_dw_mpl.01','Thông báo','Bạn có muốn cập nhật cho tất cả các dòng bên dưới không?','question','yesno',1) = 1 then
				this.f_update_column_4_all_row(vs_colname, vl_row)
			end if
		end if				
	end if		
end if
if not ib_uprow_copy then
	lod_handle.idwsetup_initial.iaa_rtn_data[] = laa_empty[]
	lod_handle.idwsetup_initial.ias_rtn_data[] = las_empty[]
end if
return 1
end function

public function integer f_get_doc_trace (ref string rs_where, ref string rs_sort);s_w_main				lw_display
c_dwservice				lc_dwservice
s_object_display		lod_handle
c_string					lc_string
double					ldb_doc_id
any						laa_data[]
string						ls_colname, ls_coltype
long						ll_master_row
t_dw_mpl				ldw_master

if this.describe( "version_id.coltype" ) = 'number' and left(this.dataobject,3) <> 'dv_' then
	this.f_getparentwindow(lw_display )
	if lw_display.dynamic f_get_ib_doc_trace_on() then
		if this.getrow( ) > 0 then
			ldb_doc_id = this.getitemnumber(this.getrow( ), 'id')
			ls_colname = ' ID'
			lc_dwservice.f_get_build_column( this, ls_colname, ls_coltype)		
			rs_where = ls_colname + '=' + string(ldb_doc_id)			
		end if
		rs_sort = "extend_id a"
		return 1
	else
		ls_colname = ' extend_id'
		lc_dwservice.f_get_build_column( this, ls_colname, ls_coltype)
		rs_where = ls_colname
		ls_colname = ' version_id'
		lc_dwservice.f_get_build_column( this, ls_colname, ls_coltype)
		rs_where = rs_where +' = ' + ls_colname
		return 0
	end if
elseif this.describe( "version_no.coltype" ) = 'number' then
	this.f_getparentwindow(lw_display )
	if lw_display.dynamic f_get_ib_doc_trace_on() then
		if this.ib_isshared then
			ldw_master =  this.idw_master.dynamic f_get_idw_master()
		else
			ldw_master = this.idw_master
		end if
		if ldw_master.getrow( ) > 0 then
			ls_colname = ' ID'
			lc_dwservice.f_get_build_column( this, ls_colname, ls_coltype)		
			rs_where = ls_colname
			ls_colname = ' extend_id'
			lc_dwservice.f_get_build_column(ldw_master, ls_colname, ls_coltype)
			rs_where = rs_where +' = ' + ls_colname			
			return 1
		end if
	else
		lod_handle = lw_display.f_get_obj_handling( )
		if not lod_handle.ib_copying then
			if this.ib_isshared then
				ldw_master =  this.idw_master.dynamic f_get_idw_master()
			else
				ldw_master = this.idw_master
			end if			
			ls_coltype = ldw_master.describe( "version_id.coltype")
			ls_colname = 'version_id'
			lc_dwservice.f_get_build_column( ldw_master, ls_colname, ls_coltype)
			rs_where = ls_colname
			ls_coltype = this.describe( "ID.coltype")
			ls_colname = 'ID'
			lc_dwservice.f_get_build_column( this, ls_colname, ls_coltype)
			rs_where += ' = '+ ls_colname
			return 0
		elseif lod_handle.ib_copying and lod_handle.is_copy_type <> 'copyt' then
			if this.ib_isshared then
				ldw_master =  this.idw_master.dynamic f_get_idw_master()
			else
				ldw_master = this.idw_master
			end if					
			ll_master_row = ldw_master.find( "gutter = 'Y'", 1, ldw_master.rowcount())
			DO while ll_master_row > 0					
				if not isnull(rs_where) and rs_where <>'' then
					rs_where +=';'
				end if
				rs_where += string(ldw_master.getitemnumber(ll_master_row, 'version_id' ))
				ll_master_row = ldw_master.find( "gutter = 'Y'", ll_master_row+1, ldw_master.rowcount()+1)
			LOOP				

			ls_coltype = ldw_master.describe( "version_id.coltype")
			if pos(rs_where, ';') > 0 then
				rs_where = '('+rs_where+')'
			end if
			ls_colname = 'ID'
			lc_dwservice.f_get_build_column( this, ls_colname, ls_coltype)
			rs_where = lc_string.f_get_expression( rs_where, ls_coltype, ls_colname, 'build where')	
			return 0
		end if
	end if
end if

end function

public function boolean f_get_ib_dummy_row ();return ib_dummy_row
end function

public subroutine f_set_ib_valuesetting (boolean vb_valuesetting);ib_valuesetting = vb_valuesetting

end subroutine

public function integer f_change_dwo (string vs_dwo);s_object_display		lpo_handling
window					lw_parent
t_transaction			lt_transaction
c_sql						lc_sql
int							li_idx
string						ls_originalWhereClause_grid,ls_originalWhereClause_form, ls_originalSQL_nowhere, ls_modify, ls_rtn
string						ls_detail_filterString
double					ldb_current_ID
long						ll_currow, ll_rowcnt

if this.f_getparentwindow( lw_parent) = 1 then
	lw_parent.dynamic f_get_transaction(lt_transaction)			
	lpo_handling = lw_parent.dynamic f_get_obj_handling()
	if isvalid(lpo_handling) then
		if this.getrow() > 0 then
			ldb_current_ID = this.getitemnumber(  this.getrow(), 'ID')
		end if

			//-- thay đổi dataonject: giu lại whereclause gốc --//
			this.f_getcurrentSQL(ls_originalSQL_nowhere,  ls_originalWhereClause_grid)

			//-- doi dataobject --//
			this.dataobject = vs_dwo
			this.f_set_scrollbar( )

			this.f_getcurrentSQL( ls_originalSQL_nowhere, ls_originalWhereClause_form)
			lc_sql.f_addtowhereclause( ls_originalSQL_nowhere, ls_originalWhereClause_grid, " AND ")

			ls_modify = "Datawindow.Table.Select= '" + ls_originalSQL_nowhere +"'"
			ls_rtn =this.modify(ls_modify )							
			//-- resize filter --//
			if lw_parent.dynamic f_is_filter_on() then
				lw_parent.dynamic event e_filter_resize()
			end if									
			this.f_set_properties( )
			this.settransobject( lt_transaction)			
			this.f_create_navigate_bttn( )
			this.object.datawindow.color = rgb(255,255,255)
			
			//-- filter detail --//
			if this.ib_isdetail then
				ls_detail_filterString = idw_master.dynamic f_get_detail_filterstring( this, this.ib_doc_filter)
				this.setfilter(ls_detail_filterString)
			end if		
			ll_rowcnt = this.event e_retrieve( )
			if lw_parent.dynamic f_is_filter_on() then
				lw_parent.dynamic f_filter_dwmain()	
			end if	
			
			if ll_rowcnt > 1 then
				ll_currow = this.find( "ID = "+string(ldb_current_ID), 1, ll_rowcnt)
				if ll_currow > 0 then
					this.scrolltorow( ll_currow)
				end if
			end if											

		//-- resize fixed part --//
		lpo_handling.f_resize_fixedpart_form( )
	end if
end if

return 0
end function

public function integer f_open_drilldown (string vs_colname, long vl_row);string						ls_object, ls_data, ls_doc_type
any						la_clicked_data
window 					lw_parent
s_object_display		lod_handle, lpo_related
b_obj_instantiate		lbo_inst
s_str_drilldown_data		lstr_drilldown_data

this.f_getparentwindow( lw_parent)
if lw_parent.classname() = 's_w_multi' then
	lod_handle = lw_parent.dynamic f_get_obj_handling()	
	if left(lod_handle.classname( ),3) <> 'ur_' then return 0
	ls_object =  lod_handle.idwsetup_initial.f_get_drilldown_object( this.dataobject, vs_colname) 
	if ls_object = '' or isnull(ls_object) then return 0
	if ls_object = 'MULTI' then 		
		ls_data = this.getitemstring( vl_row , vs_colname)
		ls_doc_type = lbo_inst.f_get_doc_type( ls_data)
		if ls_doc_type = '' then return 0
		ls_object = 'U_'+ls_doc_type
	end if
	if lw_parent.dynamic event e_create_related_object(ls_object,lpo_related) = -1 then return -1
	lw_parent.dynamic event e_change_object_appeon(lpo_related)	
end if

return 0


end function

public function integer f_set_ib_grid_n_form (boolean vb_grid_n_form);ib_grid_n_form = vb_grid_n_form
return 1
end function

public function boolean f_get_ib_dropdowning ();return this.ib_dropdowning
end function

public function integer f_checkin_gutter_detail (string vs_data);t_dw_mpl			ldw_detail[], ldw_detail_child[]

int 					li_idx, li_rtn
long					ll_row

ldw_detail[] = iadw_detail[]
FOR li_idx = 1 TO upperbound(ldw_detail)
	if ldw_detail[li_idx].describe( 'gutter_t.x') <> '!' then
		for ll_row = 1 to ldw_detail[li_idx].rowcount( )
			ldw_detail[li_idx].setitem( ll_row, 'gutter', vs_data)
		next
	end if
	if ldw_detail[li_idx].f_getdwdetails(ldw_detail_child[]) > 0 then
		ldw_detail[li_idx].f_checkin_gutter_detail( vs_data)
	end if
next
return 0
end function

public function integer f_set_master_detail_ref_table (long vl_row);t_dw_mpl	ldw_master,ldw_detail
c_string		lc_string
int				li_idx,li_rtn
any			la_data
long			ll_detail_row,ll_master_row
string			las_master_keycol[],las_detail_keycol[],ls_ref_table,ls_ref_field

if this.ib_isdetail or this.ib_isshared  then
	if  this.ib_isdetail then
		ldw_master = idw_master
		ldw_detail = this
		ll_detail_row = vl_row
	elseif this.idw_master.dynamic f_get_ib_detail() then
		ldw_master = this.idw_master.dynamic f_get_idw_master()
		ldw_detail = this.idw_master
		ll_detail_row =  this.idw_master.getrow( )
	end if
	if isvalid(ldw_master) then
		ll_master_row = ldw_master.getrow( )
		if ll_master_row > 0 then		
			ldw_detail.f_get_master_keycol(las_master_keycol[])
			ldw_detail.f_get_detail_keycol(las_detail_keycol[])					
			FOR li_idx = 1 TO upperbound(las_master_keycol[])
				if upper(las_detail_keycol[li_idx]) = 'ID' then continue
				la_data = ldw_master.f_getitemany(ll_master_row, las_master_keycol[li_idx])
				li_rtn = ldw_detail.setitem(ll_detail_row , las_detail_keycol[li_idx], la_data)
				if li_rtn = -1 then return -1			
			NEXT				
			//-- set ref_field cho detail--//
			ls_ref_table = ldw_master.describe("DataWindow.Table.updatetable")
			if ls_ref_table ='?' then
				messagebox('ERROR','Chưa Update Properties datawindow')
				return -1
			end if
			ls_ref_field = lc_string.f_getfirsttoken(ldw_detail.is_ref_table_field,';')
			if ldw_detail.ib_ref_table_yn OR UPPER(ls_ref_field) = 'OBJECT_REF_TABLE' then 
				ldw_detail.setitem(ll_detail_row , 'OBJECT_REF_TABLE' , upper(ls_ref_table))
			elseif  UPPER(ls_ref_field) <> 'OBJECT_REF_TABLE' and  ls_ref_field <> '' and ldw_detail.ib_ref_table_yn = false then
				ldw_detail.setitem(ll_detail_row , ls_ref_field, upper(ls_ref_table))
			END IF
		else
			if not ldw_detail.ib_dummy_row then
				messagebox('Loi', 'chua co mater')
				return -1
			end if
		end if
	end if
end if
return 0
end function

public function integer f_buildwhereclause (ref string rs_where);int					li_idx, li_count,li_rtn
any				la_master_key_value[]
string 			ls_whereclause, ls_where_master, ls_related_dwo,ls_where_sob
string				ls_dwcolumns[],ls_criteria_of_dwcolumns[],ls_rtn, ls_dbname

window					lw_parent
t_dw_mpl					ldw_main
s_object_display		lpo_handling
s_str_dwo_related		lstr_data_related[]
c_dwservice				lc_service


ls_whereclause = this.f_buildwhereclause_of_company( )
ls_where_sob = this.f_buildwhereclause_of_sob( )
if ls_where_sob <> '' then
	if ls_whereclause<>'' then
		ls_whereclause = ls_whereclause + ' AND ' + ls_where_sob
	else
		ls_whereclause=ls_where_sob
	end if
end if
if this.f_getparentwindow( lw_parent) = 1 then
	ldw_main =  lw_parent.dynamic f_get_dwmain()
	//-- related object key hoac book key --//
	lpo_handling = lw_parent.dynamic f_get_obj_handling()
	if this = ldw_main or (lpo_handling.classname( ) = 'u_valueset' and this.ib_ismaster ) then		
		
		//-- build related key --//
		li_count = lpo_handling.dynamic f_get_data_related(lstr_data_related[])
		if li_count > 0 then
			//-- Nếu đã build where 1 lần rồi thì không build lại --//
			if not this.ib_first_buildwhere then 
				return 0			
			end if
			li_rtn = lc_service.f_buildwhereclause_of_relation(lpo_handling, lstr_data_related[] )
			if li_rtn > 0 then						
				FOR li_idx = 1 to li_count
					if (not lstr_data_related[li_idx].b_f_matching and lstr_data_related[li_idx].b_t_matching) and li_idx > 1 then
						//-- cùng 1 đối tượng nhưng có quan hệ FROM TO khác nhau --//
						//-- lúc khai báo related phải khai báo FROM trước TO sau --//
						//-- trường hợp hiện tại là phiếu xuất tạo phiếu nhập, phiếu nhập tạo phiếu xuất --//
						if ls_whereclause <> '' and len(trim(lstr_data_related[li_idx].s_where)) > 0 then ls_whereclause +=  ' OR '
					else
						if ls_whereclause <> '' and len(trim(lstr_data_related[li_idx].s_where)) > 0 then ls_whereclause +=  ' AND '
					end if
					ls_whereclause+=  lstr_data_related[li_idx].s_where	
				NEXT
				if ls_whereclause <> '' then
//					is_originalwhereClause = '('+ls_whereclause + ')' //////////////--Hỏi Long khi nào dùng --//
					rs_where =  '('+ls_whereclause + ')'
					return 1
				else
					rs_where = ''
					return 1
				end if
			else
				rs_where = ''
				return 1
			end if 
		end if
		//-- build book key --//
		li_rtn = lpo_handling.dynamic f_get_criteria_of_book(ls_dwcolumns,ls_criteria_of_dwcolumns)
		for li_idx = 1 to li_rtn
			if ls_whereclause <> '' then ls_whereclause += ' AND '
			ls_rtn = lc_service.f_buildwhereclause(this,ls_dwcolumns[li_idx] ,ls_criteria_of_dwcolumns[li_idx])
			ls_whereclause += ls_rtn
		next
		if ls_whereclause <> '' then
			rs_where =  '('+ ls_whereclause + ')'
			return 1
		else
			rs_where = ls_whereclause
			return 1
		end if
	end if
end if

//-- master key --//
if this.f_buildwhereclause_4_dwdetail( ls_where_master) = -1 then
	setnull(rs_where)
	return -1
else
	if isnull(ls_where_master) then ls_where_master =''
	if ls_where_master <>'' then
		if ls_whereclause <> '' then ls_whereclause +=  ' AND '
		ls_whereclause+= ls_where_master
	end if
	if ls_whereclause <> '' then
		rs_where = '('+ ls_whereclause + ')'
		return 1
	end if
end if

/* khóa kiểu where detial cũ --//
if this.f_buildwhereclause_of_masterkey( ls_where_master) = -1 then
	setnull(ls_whereclause)
	return ls_whereclause
else
	if isnull(ls_where_master) then ls_where_master =''
	if ls_whereclause <> '' then ls_whereclause +=  ' AND '
	ls_whereclause+= ls_where_master	
	if ls_whereclause <> '' then
		return '('+ ls_whereclause + ')'
	end if
end if
*/
rs_where = ls_whereclause
return 1

end function

public subroutine f_set_ib_dummy_row (boolean vb_dummy_row);ib_dummy_row = vb_dummy_row

end subroutine

public function integer f_restore_original_data (string vas_colname[], long vl_row);any 		la_data
int			li_idx

FOR li_idx = 1 to upperbound(vas_colname[])
	la_data = this.f_getitemany(vl_row , vas_colname[li_idx], primary!, true)
	this.setitem(vl_row , vas_colname[li_idx], la_data)
NEXT

Return 1
end function

public function string f_get_autocomplete_string (string vs_colname, string vs_searchtext, string vs_dddw_ddlb, ref datawindowchild rdwc_dropdown);string					ls_autocomplete, ls_findexp, ls_displaydata_value, ls_dddw_displaycol, ls_dwdatatype, ls_coltype
string					ls_displaycolname, ls_filter_str, ls_colname
int						li_searchtextlen, li_ddlb_index
long					ll_dddw_rowcount, ll_findrow, ll_setup_row
boolean				lb_matchfound
s_object_display	lod_handling
s_w_multi			lw_parent
b_obj_instantiate	lbo_inst
c_dwservice		lc_dwservice


li_searchtextlen = len(vs_searchtext)

If ((li_searchtextlen <  Len(is_textprev))  or  (Lower (vs_searchtext) = Lower (is_textprev))) and is_textprev <> '' Then
	is_textprev = ''
	return ''
End If	

If vs_dddw_ddlb = 'dddw' Then  
	ls_dddw_displaycol = this.describe( vs_colname+ '.dddw.displaycolumn')
	
	// Search for a match in DDDW
//	ls_findexp = "Lower (Left (" + ls_dddw_displaycol + ", " + String (li_searchtextlen) + ")) = '" + Lower (vs_searchtext) + "'"

	ll_dddw_rowcount = rdwc_dropdown.Rowcount()
	if ll_dddw_rowcount = 0 then ll_dddw_rowcount = this.f_retrieve_dwc( vs_colname)
	 
	
	//-- filter --//
	IF not isnull(vs_searchtext) and trim(vs_searchtext)<>'' then 
		if left(rdwc_dropdown.describe( 'obj_search.coltype'), 5) = 'char(' then 
			ls_colname = 'obj_search'
		elseif left(rdwc_dropdown.describe( 'doc_search.coltype'), 5) = 'char(' then
			ls_colname = 'doc_search'
		end if
		if ls_colname <> '' then 
			ls_filter_str = lbo_inst.f_get_filterstring( rdwc_dropdown, vs_searchtext, ls_colname)
		else
			ls_filter_str = lbo_inst.f_get_filterstring( rdwc_dropdown, vs_searchtext)
		end if
		rdwc_dropdown.SetFilter(ls_filter_str)
	else
		rdwc_dropdown.SetFilter("")
	end if 		
	rdwc_dropdown.Filter()		
	if rdwc_dropdown.rowcount() = 0 then
		rdwc_dropdown.SetFilter("")
		rdwc_dropdown.Filter()
	end if
	lc_dwservice.f_set_gutter_rowcount(rdwc_dropdown )
	if li_searchtextlen = 0 then return ''
	
//	ll_findrow = rdwc_dropdown.Find (ls_findexp, 1, ll_dddw_rowcount)
	ll_findrow = rdwc_dropdown.Find (ls_filter_str, 1, ll_dddw_rowcount)
	lb_matchfound = (ll_findrow > 0)
	If lb_matchfound then
		ls_autocomplete= rdwc_dropdown.GetItemString(ll_findrow,ls_dddw_displaycol)
		is_textprev  = vs_searchtext
		rdwc_dropdown.scrolltorow(ll_findrow)
	else
		is_textprev = ''
		ls_autocomplete = ''
	end if                                            
ElseIf vs_dddw_ddlb = 'ddlb' Then 
	if is_textprev ='' then return ''
	Do
		li_ddlb_index++
		ls_displaydata_value = This.GetValue(vs_colname, li_ddlb_index)
		If ls_displaydata_value = '' Then 
			Exit
		End If
		lb_matchfound = ( Lower(vs_searchtext) = Lower( Left(ls_displaydata_value, Len(vs_searchtext))) )
	Loop Until lb_matchfound
	If lb_matchfound Then
		ls_autocomplete = Left (ls_displaydata_value, Pos(ls_displaydata_value,'~t') -1)        	
	End If
End If

return ls_autocomplete
end function

public function integer f_setitem_returndata (string vs_colname, long vl_row, boolean vb_check_upcopy, boolean vb_settext_yn);string				ls_receive_column, las_receive_colname[], ls_data, las_empty[], las_data[], las_return_cols[]
string				ls_col_curcode, ls_curcode, ls_col_exrate, ls_null, ls_coltype, ls_dwdatatype, ls_dwo,ls_coltext
any				laa_empty[],la_data, la_null
int					li_idx, li_colCnt, li_rtn, li_null, li_chk
long				ll_row_setup, ll_row_upd
boolean			lb_valueset_receive_number,lb_is_mat
double			ldb_exrate
datetime			ldt_null
date				ld_prior_period_date, ld_last_period_date

c_string				lc_string
c_dwservice			lc_dwservice
window				lw_display
s_object_display	lod_handle
datawindowchild	ldwc
b_obj_instantiate	lb_obj_ins

setnull(la_null)
this.f_getparentwindow( lw_display)
lod_handle = lw_display.dynamic f_get_obj_handling()

ls_coltype =  this.describe( vs_colname+ '.coltype' )
ll_row_setup = lod_handle.idwsetup_initial.f_get_dwdatatype_string( vs_colname, ls_coltype, this, ls_dwdatatype)

ls_receive_column = lod_handle.idwsetup_initial.ids_setup_dw.getitemstring( ll_row_setup,'receive_column')

li_chk = lod_handle.f_get_colname_exchange_rate( this,ls_receive_column, ls_col_curcode, ls_col_exrate)
						

li_colCnt = lc_string.f_stringtoarray(ls_receive_column , ';', las_receive_colname[])
lb_valueset_receive_number = lod_handle.idwsetup_initial.f_is_valueset_receive_number(this.dataobject, ls_receive_column) 
FOR li_idx = 1 to li_colCnt
	//--set tỷ giá
	if li_chk = 1 and upperbound( lod_handle.idwsetup_initial.iaa_rtn_data[]) > 0  then				
		if las_receive_colname[li_idx] = ls_col_curcode  then
			//-- sau này sửa lại lấy ngày session date --//
			ldb_exrate = lod_handle.f_get_exchange_rate( string(lod_handle.idwsetup_initial.iaa_rtn_data[li_idx]), gd_session_date)
			this.setitem( vl_row, ls_col_exrate, ldb_exrate)
		end if
	end if	
	
	if las_receive_colname[li_idx] = vs_colname then
		//-- kiểm tra cột không được sửa khi đã kết phiếu--//
		if upperbound( lod_handle.idwsetup_initial.iaa_rtn_data[]) > 0 then
			la_data = this.f_getitemany( vl_row, vs_colname)
			if lb_valueset_receive_number or ls_dwdatatype='STRUCT_SEGMENT'  then
				lb_is_mat = lb_obj_ins.f_is_matched( lod_handle, vs_colname, this, la_data,lod_handle.idwsetup_initial.iaa_rtn_data[li_idx] )
			else
				lb_is_mat = lb_obj_ins.f_is_matched( lod_handle, vs_colname, this, la_data,lod_handle.idwsetup_initial.iaa_rtn_data[li_idx] )
			end if	
		end if
		if lb_is_mat then
			ls_coltext = lc_dwservice.f_getcolumnlabel(vs_colname , this.dataobject, upper(lod_handle.classname( )) )
			gf_messagebox('m.b_doc.e_itemchanged.01','Thông báo','Phiếu đã kết nên không được sửa cột sau: @'+ls_coltext, 'exclamation','ok',1)
			this.ib_dataerror = true
			return -1
		end if
		if vb_settext_yn = true then
			if lb_valueset_receive_number or ls_dwdatatype='STRUCT_SEGMENT'  then
				if upperbound( lod_handle.idwsetup_initial.iaa_rtn_data[]) = 0 then 
					if pos(ls_receive_column,';') > 0 then  this.settext('' )
				else
					this.settext( lod_handle.idwsetup_initial.iaa_rtn_data[li_idx] )
				end if
			else		
				if  upperbound( lod_handle.idwsetup_initial.ias_rtn_data[]) = 0 then
					this.settext('' )
				else
					this.settext(  lod_handle.idwsetup_initial.ias_rtn_data[li_idx] )
					this.setitem(vl_row, vs_colname ,  lod_handle.idwsetup_initial.ias_rtn_data[li_idx] )
				end if
			end if
		end if
	end if
	if  lb_valueset_receive_number or ls_dwdatatype='STRUCT_SEGMENT' then
		ls_coltype = this.describe( las_receive_colname[li_idx]+'.coltype')
		if upperbound( lod_handle.idwsetup_initial.iaa_rtn_data[]) = 0 then 			
			choose case left(ls_coltype,5)
				case 'numbe', 'decim'
					setnull(li_null)
					if this.getrow( ) <> vl_row or las_receive_colname[li_idx] <> vs_colname then li_rtn = this.setitem(vl_row, las_receive_colname[li_idx] , li_null)
				case 'char('
					setnull(ls_null)
					if this.getrow( ) <> vl_row or las_receive_colname[li_idx] <> vs_colname then li_rtn = this.setitem(vl_row, las_receive_colname[li_idx] , ls_null)
				case 'date','datet'
					setnull(ldt_null)
					if this.getrow( ) <> vl_row or las_receive_colname[li_idx] <> vs_colname then li_rtn = this.setitem(vl_row, las_receive_colname[li_idx] , ldt_null)
			end choose
		else
			if this.getrow( ) <> vl_row or las_receive_colname[li_idx] <> vs_colname then
				if not isnull( lod_handle.idwsetup_initial.iaa_rtn_data[li_idx]) then
					li_rtn = this.setitem(vl_row, las_receive_colname[li_idx] ,  lod_handle.idwsetup_initial.iaa_rtn_data[li_idx])
				else
					choose case left(ls_coltype,5)
						case 'numbe', 'decim'
							setnull(li_null)
							li_rtn = this.setitem(vl_row, las_receive_colname[li_idx] , li_null)
						case 'char('
							setnull(ls_null)
							li_rtn = this.setitem(vl_row, las_receive_colname[li_idx] , ls_null)
						case 'date','datet'
							setnull(ldt_null)
							li_rtn = this.setitem(vl_row, las_receive_colname[li_idx] , ldt_null)
					end choose
				end if
			end if
		end if
	else
		if  upperbound( lod_handle.idwsetup_initial.ias_rtn_data[]) = 0 then
			ls_coltype = this.describe( las_receive_colname[li_idx]+'.coltype')
			choose case left(ls_coltype,5)
				case 'numbe', 'decim'
					setnull(li_null)
					if this.getrow( ) <> vl_row or las_receive_colname[li_idx] <> vs_colname then li_rtn = this.setitem(vl_row, las_receive_colname[li_idx] , li_null)
				case 'char('
					setnull(ls_null)
					if this.getrow( ) <> vl_row or las_receive_colname[li_idx] <> vs_colname then li_rtn = this.setitem(vl_row, las_receive_colname[li_idx] , ls_null)
				case 'date','datet'
					setnull(ldt_null)
					if this.getrow( ) <> vl_row or las_receive_colname[li_idx] <> vs_colname then li_rtn = this.setitem(vl_row, las_receive_colname[li_idx] , ldt_null)
			end choose			
		else
			ls_coltype = this.describe( las_receive_colname[li_idx]+'.coltype')
			choose case left(ls_coltype,5)
				case 'numbe', 'decim'
					if this.getrow( ) <> vl_row or las_receive_colname[li_idx] <> vs_colname then li_rtn = this.setitem(vl_row, las_receive_colname[li_idx] , dec(lod_handle.idwsetup_initial.ias_rtn_data[li_idx]))
				case 'char('
					ls_receive_column = string(lod_handle.idwsetup_initial.ias_rtn_data[li_idx])
					if this.getrow( ) <> vl_row or las_receive_colname[li_idx] <> vs_colname then li_rtn = this.setitem(vl_row, las_receive_colname[li_idx] , string(lod_handle.idwsetup_initial.ias_rtn_data[li_idx]))
				case 'date','datet'
					ld_prior_period_date = date(lod_handle.idwsetup_initial.ias_rtn_data[li_idx])
					if this.getrow( ) <> vl_row or las_receive_colname[li_idx] <> vs_colname then li_rtn = this.setitem(vl_row, las_receive_colname[li_idx] , date(lod_handle.idwsetup_initial.ias_rtn_data[li_idx]))
			end choose
		end if
	end if
	if li_rtn = - 1 then
		gf_messagebox('m.t_dw_mpl.f_setitem_returndata.01','Thông báo','Không gán được dữ liệu vào cột: @'+ las_receive_colname[li_idx], 'exclamation', 'ok',1)
		return -1
	end if

NEXT
//-- xử lý  copy dòng trên --//
if vb_check_upcopy then
	ls_dwo = left(this.dataobject, len(this.dataobject) - 5)
	ll_row_upd = lod_handle.idwsetup_initial.ids_setup_dw.find("dwobject ='"+ls_dwo+ "' AND dwcolumn ='" +vs_colname+ "' AND auto_copy_yn = 'Y'" ,1, lod_handle.idwsetup_initial.ids_setup_dw.rowcount( ))			
	if ll_row_upd > 0 then 
		if vl_row < this.rowcount( ) then
			if gf_messagebox('m.t_dw_mpl.01','Thông báo','Bạn có muốn cập nhật cho tất cả các dòng bên dưới không?','question','yesno',1) = 1 then
				this.f_update_column_4_all_row(vs_colname, vl_row)
			end if
		end if				
	end if		
end if
if not ib_uprow_copy then
	lod_handle.idwsetup_initial.iaa_rtn_data[] = laa_empty[]
	lod_handle.idwsetup_initial.ias_rtn_data[] = las_empty[]
end if
return 1
end function

public function integer f_update_pic (blob vblb_picture, string vs_ctrl_pic_name, string vs_path, string vs_filetype, long row);long 				ll_obj_ref_id,ll_rtn,ll_ref_id,ll_idx
window			lw_parent
t_transaction 	lt_transaction
powerobject	lc_object_handle_parent
s_str_dwo		lc_s_str_dwo[]
string 			ls_rtn,ls_pic_ref_field,ls_pic_ref_table, ls_pic_ref_colname,  ls_sql
	
	this.f_getparentwindow( lw_parent)
	lc_object_handle_parent = lw_parent.dynamic f_get_obj_handling()
	
	this.f_get_data_pic( lc_object_handle_parent, ls_pic_ref_table, ls_pic_ref_field, ls_pic_ref_colname, vs_ctrl_pic_name)

	ll_ref_id = this.getitemnumber( row, ls_pic_ref_field)
	ls_sql = 'UPDATE '+ls_pic_ref_table+' SET '+ls_pic_ref_colname+ ' = ? , ' + ls_pic_ref_colname +'_filetype  = ?  WHERE ID = ? '

	//--Tạo sql động cú pháp 2--//
	PREPARE SQLSA         
		FROM  :ls_sql
		using SQLCA;
	EXECUTE SQLSA        
		USING :vblb_picture,:vs_filetype,:ll_ref_id ;
	
	ll_rtn = SQLCA.sqlcode
	if ll_rtn = 0 then
		COMMIT USING SQLCA ;
		if vs_path = '' then
			ls_rtn = this.modify( vs_ctrl_pic_name + '.filename =""')
			
		else
			ls_rtn = this.modify( vs_ctrl_pic_name + '.filename ='+"'"+vs_path+"'")
		end if
	end if
	return ll_rtn
end function

public function string f_get_path_pic (string vs_pic_ref_table, string vs_pic_ref_field, string vs_pic_ref_colname, double vdb_ref_id, t_transaction vt_transaction);string				ls_pic_name,ls_sql,ls_default_directory,ls_path, ls_filetype
blob				lblb_logo
int					li_fileidx

		
ls_sql = 'select '+vs_pic_ref_colname+ '_filetype from '+vs_pic_ref_table+' where ID  = ?'

DECLARE cursor_pic DYNAMIC CURSOR FOR SQLSA ;
PREPARE SQLSA         
		FROM :ls_sql
		using vt_transaction;
OPEN DYNAMIC cursor_pic using :vdb_ref_id ;
FETCH cursor_pic INTO :ls_filetype ;
CLOSE cursor_pic ;		
		
ls_pic_name =vs_pic_ref_colname+'_'+string(vdb_ref_id) + ls_filetype
ls_default_directory = gs_path_pic
ls_path = ls_default_directory + '\pics\' + ls_pic_name
if FileExists ( ls_path ) then
	return ls_path
end if

ls_sql = 'select '+vs_pic_ref_colname+' from '+vs_pic_ref_table+' where ID  = ?'

//DECLARE cursor_pic DYNAMIC CURSOR FOR SQLSA ;
PREPARE SQLSA         
		FROM :ls_sql
		using vt_transaction;
OPEN DYNAMIC cursor_pic using :vdb_ref_id ;
FETCH cursor_pic INTO :lblb_logo ;
CLOSE cursor_pic ;

if len(lblb_logo) > 0 then
	li_fileidx = FileOpen(ls_path, StreamMode!, Write!, LockWrite!, Replace!)
	FileWriteEx(li_fileidx,lblb_logo)
	FileClose(li_fileidx)
end if
return ls_path
end function

public function integer f_remove_pic_file (string vs_pic_ref_table, string vs_pic_ref_field, string vs_pic_ref_colname, double vdb_ref_id);string				ls_pic_name,ls_sql,ls_default_directory,ls_path, ls_filetype
blob				lblb_logo
int					li_fileidx

		
ls_sql = 'select '+vs_pic_ref_colname+ '_filetype from '+vs_pic_ref_table+' where ID  = ?'

DECLARE cursor_pic DYNAMIC CURSOR FOR SQLSA ;
PREPARE SQLSA         
		FROM :ls_sql
		using sqlca;
OPEN DYNAMIC cursor_pic using :vdb_ref_id ;
FETCH cursor_pic INTO :ls_filetype ;
CLOSE cursor_pic ;		
		
ls_pic_name =vs_pic_ref_colname+'_'+string(vdb_ref_id) + ls_filetype
ls_default_directory = gs_path_pic
ls_path = ls_default_directory + '\pics\' + ls_pic_name
if FileExists ( ls_path ) then
	if FileDelete ( ls_path ) then return 1
	return -1
else
	return 0
end if

end function

private function integer f_delete_detail (ref datawindow rdw_detail, string vs_deletesql);/*
return 1: success

*/
any					laa_keyvalue[]
int						li_rtn, li_idx,li_rtn1,li_rtn2,li_idx2,li_idx3,li_rtn3
long					ll_row,ll_find
string					las_master_keycol[],las_detail_keycol[], ls_table, ls_keycol, ls_deleteSQL, ls_ref_table, ls_where
string					ls_masterkeycol, ls_detailkeycol, ls_selectSQL,ls_coltype,ls_filter
t_dw_mpl 		ladw_details[]
c_string				lc_string
c_sql					lc_sql
t_s_sql_attr 			lastr_sql[]
t_transaction		lt_transaction
window				lw_parent
s_object_display	lod_handling

//--del bảng match trước--//
if this.f_getparentwindow( lw_parent) = 1 then
	if isvalid(lw_parent) then
		lod_handling = lw_parent.dynamic f_get_obj_handling()
		li_rtn = lod_handling.f_delete_matching( rdw_detail,0)
	end if
end if
if li_rtn = -1 then return -1
//-- Xóa detail của detail --//
if rdw_detail.dynamic f_get_ib_master() then
	li_rtn = rdw_detail.dynamic f_getdwdetails(ladw_details[])
	if  rdw_detail.dynamic f_get_ib_cascade_del()  then		
		ls_ref_table = rdw_detail.describe( "DataWindow.Table.UpdateTable")		
		if li_rtn > 0 then
			FOR li_idx = 1 to li_rtn
				li_rtn3 = ladw_details[li_idx].dynamic f_get_master_keycol(las_master_keycol[])
				ladw_details[li_idx].dynamic f_get_detail_keycol(las_detail_keycol[])
				//-- kiểm tra đang edit--//
				if rdw_detail.dynamic f_get_ib_editing() then
					if li_rtn3 > 0 then
						ls_filter = ''
						for li_idx2= 1 to li_rtn3
							laa_keyvalue[li_idx2] = ''
							ls_coltype = this.describe(las_master_keycol[li_idx2]+'.coltype' )
							for li_idx3 = 1 to rdw_detail.rowcount()
								if string(laa_keyvalue[li_idx2]) <> '' then laa_keyvalue[li_idx2] += ','
								laa_keyvalue[li_idx2] =  string(rdw_detail.dynamic f_getitemany( li_idx3, las_master_keycol[li_idx2]))
							next
							if isnull(laa_keyvalue[li_idx2]) then laa_keyvalue[li_idx2] = '()'
							if pos(string(laa_keyvalue[li_idx2]),',') > 0 then laa_keyvalue[li_idx2] = '('+string(laa_keyvalue[li_idx2])+')'
							if ls_filter <> '' then ls_filter += ' AND '
							ls_filter += lc_string.f_get_expression(string(laa_keyvalue[li_idx2]) , ls_coltype,las_detail_keycol[li_idx2], 'filter')
						next
						ls_deleteSQL = ls_filter
					end if
				else
					ls_table =   ladw_details[li_idx].describe( "DataWindow.Table.UpdateTable")
					if ls_table = '?' then continue 		
					ls_deleteSQL = "DELETE " + ls_table + " WHERE "			
					//-- build where --//
					ls_where = ""			
					if li_rtn3 > 0 then
						//-- tao chuoi key column --//
						lc_string.f_arraytostring( las_master_keycol[], ",", ls_masterkeycol)
						lc_string.f_arraytostring( las_detail_keycol[], ",", ls_detailkeycol)
						if ladw_details[li_idx].dynamic f_get_ib_ref_table_yn() then
							ls_masterkeycol +=", '"+ upper(ls_ref_table) +"'"
							ls_detailkeycol += ", '"+ upper(ls_ref_table) +"'"
						end if				
						
						if lc_sql.f_parse( vs_deletesql, lastr_sql[]) = 1 then
							lastr_sql[1].s_verb = 'SELECT'
							lastr_sql[1].s_columns = ls_masterkeycol
							ls_selectSQL = lc_sql.f_assemble(lastr_sql[])
						end if
					
						ls_deleteSQL += "("+ls_detailkeycol+") IN (" + ls_selectSQL +")"
					else
						return -1
					end if	
				end if		
				li_rtn1 = this.f_delete_detail(ladw_details[li_idx] , ls_deleteSQL)
				if li_rtn1 = -1 then return -1
			NEXT
		end if
	else //-- ko cascade delete --//
		FOR li_idx = 1 to li_rtn
			if ladw_details[li_idx].rowcount( ) > 0 then
				gf_messagebox('m.f_delete_detail.01','Thông báo','Không thể xóa vì còn dữ liệu chi tiết liên quan của:@'+ladw_details[li_idx].dataobject,'exclamation','ok',1)
				return -1
			end if
		NEXT
		return 1
	end if
end if
	
//-- xóa detail --//
lw_parent.dynamic f_get_transaction(lt_transaction)
if rdw_detail.dynamic f_get_ib_editing() then 
	ll_find = rdw_detail.find(vs_deletesql,1,rdw_detail.rowcount())
	if ll_find < 0 then return -1
	Do While ll_find > 0 
		rdw_detail.deleterow(ll_find)
		ll_find = rdw_detail.find(vs_deletesql,ll_find,rdw_detail.rowcount() + 1)
	Loop
	//-- update --//
	rdw_detail.settransobject(lt_transaction)
	li_rtn = rdw_detail.update(true, false)
	if li_rtn = -1 then
		rdw_detail.dynamic f_set_ib_deleting( false)
		rdw_detail.resetupdate( )
		return -1	
	else
		rdw_detail.resetupdate( )
	end if	
	return 1
else	
	if isvalid(lt_transaction) then
		execute immediate :vs_deletesql using lt_transaction ;
		if lt_transaction.sqlcode = -1 then return -1
	//	rdw_detail.dynamic event e_retrieve()
		return 1
	end if
end if


return li_rtn
end function

public function integer f_set_ib_deleting (boolean vb_delete);ib_deleting = vb_delete
return 1
end function

public function string f_get_autocomplete_string (string vs_colname, string vs_searchtext, string vs_dddw_ddlb, ref datawindowchild rdwc_dropdown, ref long rl_found_row);string					ls_autocomplete, ls_findexp, ls_displaydata_value, ls_dddw_displaycol, ls_dwdatatype, ls_coltype
string					ls_displaycolname, ls_filter_str
int						li_searchtextlen, li_ddlb_index
long					ll_dddw_rowcount, ll_findrow, ll_setup_row
boolean				lb_matchfound
s_object_display	lod_handling
s_w_multi			lw_parent
b_obj_instantiate	lbo_inst



li_searchtextlen = len(vs_searchtext)

If ((li_searchtextlen <  Len(is_textprev))  or  (Lower (vs_searchtext) = Lower (is_textprev))) and is_textprev <> '' Then
	is_textprev = ''
	return ''
End If	

If vs_dddw_ddlb = 'dddw' Then  
	ls_dddw_displaycol = this.describe( vs_colname+ '.dddw.displaycolumn')
	
	// Search for a match in DDDW
	ls_findexp = "Lower (Left (" + ls_dddw_displaycol + ", " + String (li_searchtextlen) + ")) = '" + Lower (vs_searchtext) + "'"

	ll_dddw_rowcount = rdwc_dropdown.Rowcount()
	if ll_dddw_rowcount = 0 then ll_dddw_rowcount = this.f_retrieve_dwc( vs_colname)
	
	//-- filter --//
	IF not isnull(vs_searchtext) and trim(vs_searchtext)<>'' then 
//		rdwc_dropdown.SetFilter("upper("+ ls_dddw_displaycol +") like '%"+ upper(vs_searchtext)+"%' ")
		ls_filter_str = lbo_inst.f_get_filterstring( rdwc_dropdown, vs_searchtext)
		rdwc_dropdown.SetFilter(ls_filter_str)
	else
		rdwc_dropdown.SetFilter("")
	end if 		
	rdwc_dropdown.Filter()		
	if rdwc_dropdown.rowcount() = 0 then
		rdwc_dropdown.SetFilter("")
		rdwc_dropdown.Filter()
	end if
	
	if li_searchtextlen = 0 then return ''
	
	ll_findrow = rdwc_dropdown.Find (ls_findexp, 1, ll_dddw_rowcount)
	lb_matchfound = (ll_findrow > 0)
	If lb_matchfound then
		ls_autocomplete= rdwc_dropdown.GetItemString(ll_findrow,ls_dddw_displaycol)
		is_textprev  = vs_searchtext
		rl_found_row = ll_findrow
//		rdwc_dropdown.scrolltorow(ll_findrow)
	else
		is_textprev = ''
		ls_autocomplete = ''
	end if                                            
ElseIf vs_dddw_ddlb = 'ddlb' Then 
	if is_textprev ='' then return ''
	Do
		li_ddlb_index++
		ls_displaydata_value = This.GetValue(vs_colname, li_ddlb_index)
		If ls_displaydata_value = '' Then 
			Exit
		End If
		lb_matchfound = ( Lower(vs_searchtext) = Lower( Left(ls_displaydata_value, Len(vs_searchtext))) )
	Loop Until lb_matchfound
	If lb_matchfound Then
		ls_autocomplete = Left (ls_displaydata_value, Pos(ls_displaydata_value,'~t') -1)        	
	End If
End If

return ls_autocomplete
end function

public function integer f_set_rec_security_ex (ref t_transaction rt_transaction);string						ls_currentSQL, ls_currentWhere,ls_modify,ls_rtn,ls_where,ls_dwo,ls_object_name
c_sql						lc_sql
c_dwservice				lc_dwser
s_object_display		lobj_handle
window					lw_parent
t_dw_mpl				ldw_handle
c_string					lc_string

if gi_userid = 0 then return 1
ls_dwo = this.dataobject
this.f_getparentwindow( lw_parent)
lobj_handle = lw_parent.dynamic f_get_obj_handling()
ls_object_name = lobj_handle.idwsetup_initial.ids_setup_dw.getitemstring( 1, 'object')
ldw_handle = this
ls_where = lc_dwser.f_buildwhere_rec_security_ex( ldw_handle, mid(ls_dwo,1,len(ls_dwo)-5),ls_object_name, rt_transaction)
if ls_where <> '' then
	ls_where = '('+ls_where+')'
	ls_where = lc_string.f_globalreplace( ls_where, '"', '')
	if this.f_getcurrentSQL( ls_currentSQL, ls_currentWhere) =1 then
		//Lưu lại where record để sử dụng trong lúc tìm kiếm
		this.is_record_where = ls_where
		if ls_currentWhere <> '' then ls_currentWhere += ' AND '
		if ls_where <> '' then ls_where = ls_currentWhere + ls_where
		if ls_where <> '' then lc_sql.f_addtowhereclause( ls_currentSQL, ls_where, " AND ")
		if ls_currentWhere <> ls_where then
			ls_modify = 'Datawindow.Table.Select= "' + ls_currentSQL +'"'
			ls_rtn =this.modify(ls_modify )
		end if
	end if
end if
return 1
end function

public function string f_get_autocomplete_string_ex (string vs_colname, string vs_searchtext, string vs_dddw_ddlb);string					ls_autocomplete, ls_findexp, ls_displaydata_value, ls_dddw_displaycol
int						li_searchtextlen, li_ddlb_index
long					ll_dddw_rowcount, ll_findrow
boolean				lb_matchfound
datawindowchild	ldwc
c_dwservice			lc_dwservice

li_searchtextlen = len(vs_searchtext)

If ((li_searchtextlen <  Len(is_textprev))  or  (Lower (vs_searchtext) = Lower (is_textprev))) and is_textprev <> '' Then
	is_textprev = ''
	return ''
End If	


If vs_dddw_ddlb = 'dddw' Then  
	ls_dddw_displaycol = this.describe( vs_colname+ '.dddw.displaycolumn')

	// Search for a match in DDDW
	ls_findexp = "Lower (Left (" + ls_dddw_displaycol + ", " + String (li_searchtextlen) + ")) = '" + Lower (vs_searchtext) + "'"
	this.getchild( vs_colname, ldwc)	
	if is_textprev = '' then
		ll_dddw_rowcount = this.f_retrieve_dwc_ex(vs_colname )
	else
		ll_dddw_rowcount = ldwc.Rowcount()
	end if	

	//-- filter --//
	IF not isnull(vs_searchtext) and trim(vs_searchtext)<>'' then 
		ldwc.SetFilter("upper("+ ls_dddw_displaycol +") like '%"+ upper(vs_searchtext)+"%' ")
	else
		ldwc.SetFilter("")
	end if 		
	ldwc.Filter()		
	lc_dwservice.f_set_gutter_rowcount(ldwc )
	if li_searchtextlen = 0 then return ''
	
	
	ll_findrow = ldwc.Find (ls_findexp, 1, ll_dddw_rowcount)
	lb_matchfound = (ll_findrow > 0)
	If lb_matchfound then
		ls_autocomplete= ldwc.GetItemString(ll_findrow,ls_dddw_displaycol)
		is_textprev  = vs_searchtext
	else
		is_textprev = ''
		ls_autocomplete = ''
	end if                                            
ElseIf vs_dddw_ddlb = 'ddlb' Then 
	if is_textprev ='' then return ''
	Do
		li_ddlb_index++
		ls_displaydata_value = This.GetValue(vs_colname, li_ddlb_index)
		If ls_displaydata_value = '' Then 
			Exit
		End If
		lb_matchfound = ( Lower(vs_searchtext) = Lower( Left(ls_displaydata_value, Len(vs_searchtext))) )
	Loop Until lb_matchfound
	If lb_matchfound Then
		ls_autocomplete = Left (ls_displaydata_value, Pos(ls_displaydata_value,'~t') -1)        	
	End If
End If

return ls_autocomplete
end function

public function string f_get_autocomplete_string_ex (string vs_colname, string vs_searchtext, string vs_dddw_ddlb, ref datawindowchild rdwc_dropdown);string					ls_autocomplete, ls_findexp, ls_displaydata_value, ls_dddw_displaycol, ls_dwdatatype, ls_coltype
string					ls_displaycolname, ls_filter_str, ls_colname
int						li_searchtextlen, li_ddlb_index
long					ll_dddw_rowcount, ll_findrow, ll_setup_row
boolean				lb_matchfound
s_object_display	lod_handling
s_w_multi			lw_parent
b_obj_instantiate	lbo_inst
c_dwservice		lc_dwservice

/*/------------------------------------------------------
Hàm gọi trong event: editchanged 
==================================*/

li_searchtextlen = len(vs_searchtext)
if li_searchtextlen = 0 then 
	rdwc_dropdown.SetFilter("")
	rdwc_dropdown.Filter()
	return ''
end if
If ((li_searchtextlen <  Len(is_textprev))  or  (Lower (vs_searchtext) = Lower (is_textprev))) and is_textprev <> '' Then
	is_textprev = ''
	return ''
End If	

If vs_dddw_ddlb = 'dddw' Then  
	ls_dddw_displaycol = this.describe( vs_colname+ '.dddw.displaycolumn')
	
	// Search for a match in DDDW
//	ls_findexp = "Lower (Left (" + ls_dddw_displaycol + ", " + String (li_searchtextlen) + ")) = '" + Lower (vs_searchtext) + "'"

	ll_dddw_rowcount = rdwc_dropdown.Rowcount()
	if ll_dddw_rowcount = 0 then ll_dddw_rowcount = this.f_retrieve_dwc_ex( vs_colname)
	 
	
	//-- filter --//
	IF not isnull(vs_searchtext) and trim(vs_searchtext)<>'' then 
		if left(rdwc_dropdown.describe( 'obj_search.coltype'), 5) = 'char(' then 
			ls_colname = 'obj_search'
		elseif left(rdwc_dropdown.describe( 'doc_search.coltype'), 5) = 'char(' then
			ls_colname = 'doc_search'
		end if
		if ls_colname <> '' then 
			ls_filter_str = lbo_inst.f_get_filterstring( rdwc_dropdown, vs_searchtext, ls_colname)
		else
			ls_filter_str = lbo_inst.f_get_filterstring( rdwc_dropdown, vs_searchtext)
		end if
		rdwc_dropdown.SetFilter(ls_filter_str)
	else
		rdwc_dropdown.SetFilter("")
	end if 		
	rdwc_dropdown.Filter()		
//	if rdwc_dropdown.rowcount() = 0 then
//		rdwc_dropdown.SetFilter("")
//		rdwc_dropdown.Filter()
//	end if
	lc_dwservice.f_set_gutter_rowcount(rdwc_dropdown )	
	
//	ll_findrow = rdwc_dropdown.Find (ls_findexp, 1, ll_dddw_rowcount)
	ll_findrow = rdwc_dropdown.Find (ls_filter_str, 1, ll_dddw_rowcount)
	lb_matchfound = (ll_findrow > 0)
	If lb_matchfound then
		ls_autocomplete= rdwc_dropdown.GetItemString(ll_findrow,ls_dddw_displaycol)
		is_textprev  = vs_searchtext
		rdwc_dropdown.scrolltorow(ll_findrow)
	else
		is_textprev = ''
		ls_autocomplete = ''
	end if                                            
ElseIf vs_dddw_ddlb = 'ddlb' Then 
	if is_textprev ='' then return ''
	Do
		li_ddlb_index++
		ls_displaydata_value = This.GetValue(vs_colname, li_ddlb_index)
		If ls_displaydata_value = '' Then 
			Exit
		End If
		lb_matchfound = ( Lower(vs_searchtext) = Lower( Left(ls_displaydata_value, Len(vs_searchtext))) )
	Loop Until lb_matchfound
	If lb_matchfound Then
		ls_autocomplete = Left (ls_displaydata_value, Pos(ls_displaydata_value,'~t') -1)        	
	End If
End If

return ls_autocomplete
end function

public function string f_get_autocomplete_string_ex (string vs_colname, string vs_searchtext, string vs_dddw_ddlb, ref datawindowchild rdwc_dropdown, ref long rl_found_row);string					ls_autocomplete, ls_findexp, ls_displaydata_value, ls_dddw_displaycol, ls_dwdatatype, ls_coltype
string					ls_displaycolname, ls_filter_str
int						li_searchtextlen, li_ddlb_index
long					ll_dddw_rowcount, ll_findrow, ll_setup_row
boolean				lb_matchfound
s_object_display	lod_handling
s_w_multi			lw_parent
b_obj_instantiate	lbo_inst



li_searchtextlen = len(vs_searchtext)

If ((li_searchtextlen <  Len(is_textprev))  or  (Lower (vs_searchtext) = Lower (is_textprev))) and is_textprev <> '' Then
	is_textprev = ''
	return ''
End If	

If vs_dddw_ddlb = 'dddw' Then  
	ls_dddw_displaycol = this.describe( vs_colname+ '.dddw.displaycolumn')
	
	// Search for a match in DDDW
	ls_findexp = "Lower (Left (" + ls_dddw_displaycol + ", " + String (li_searchtextlen) + ")) = '" + Lower (vs_searchtext) + "'"

	ll_dddw_rowcount = rdwc_dropdown.Rowcount()
	if ll_dddw_rowcount = 0 then ll_dddw_rowcount = this.f_retrieve_dwc_ex( vs_colname)
	
	//-- filter --//
	IF not isnull(vs_searchtext) and trim(vs_searchtext)<>'' then 
//		rdwc_dropdown.SetFilter("upper("+ ls_dddw_displaycol +") like '%"+ upper(vs_searchtext)+"%' ")
		ls_filter_str = lbo_inst.f_get_filterstring( rdwc_dropdown, vs_searchtext)
		rdwc_dropdown.SetFilter(ls_filter_str)
	else
		rdwc_dropdown.SetFilter("")
	end if 		
	rdwc_dropdown.Filter()		
	if rdwc_dropdown.rowcount() = 0 then
		rdwc_dropdown.SetFilter("")
		rdwc_dropdown.Filter()
	end if
	
	if li_searchtextlen = 0 then return ''
	
	ll_findrow = rdwc_dropdown.Find (ls_findexp, 1, ll_dddw_rowcount)
	lb_matchfound = (ll_findrow > 0)
	If lb_matchfound then
		ls_autocomplete= rdwc_dropdown.GetItemString(ll_findrow,ls_dddw_displaycol)
		is_textprev  = vs_searchtext
		rl_found_row = ll_findrow
//		rdwc_dropdown.scrolltorow(ll_findrow)
	else
		is_textprev = ''
		ls_autocomplete = ''
	end if                                            
ElseIf vs_dddw_ddlb = 'ddlb' Then 
	if is_textprev ='' then return ''
	Do
		li_ddlb_index++
		ls_displaydata_value = This.GetValue(vs_colname, li_ddlb_index)
		If ls_displaydata_value = '' Then 
			Exit
		End If
		lb_matchfound = ( Lower(vs_searchtext) = Lower( Left(ls_displaydata_value, Len(vs_searchtext))) )
	Loop Until lb_matchfound
	If lb_matchfound Then
		ls_autocomplete = Left (ls_displaydata_value, Pos(ls_displaydata_value,'~t') -1)        	
	End If
End If

return ls_autocomplete
end function

public function integer f_calendar_ex (string vs_colname, string vs_coltype);string				ls_date, ls_type
datetime 		ldatetime_calendar
date 				ldate_calendar, ld_null
str_calendar  	lstr_calendar
t_transaction	lt_transaction

//-- open calendar --//
ls_date = string(this.getitemdatetime( this.getrow(), vs_colname),'yyyymmdd')
lstr_calendar.date_current =  ls_date
if ls_date = '19000101' or ls_date ='' then
	this.setcolumn( vs_colname)
	this.settext('')
	lstr_calendar.date_current = string(today(),'yyyymmdd') 
end if
OpenWithParm(w_calENDar, lstr_calendar)
ls_date = message.stringparm
setnull(message.stringparm)
this.setcolumn( vs_colname)
IF IsNull(ls_date) or Len(ls_date) < 1 THEN return 1 
lt_transaction = create t_transaction
lt_transaction.dbms =	SQLCA.DBMS
lt_transaction.ServerName	 = SQLCA.ServerName
lt_transaction.LogId	 = SQLCA.LogId
lt_transaction.LogPass 	 = SQLCA.LogPass 
lt_transaction.AutoCommit 	 = false 
lt_transaction.DBParm	 = SQLCA.DBParm
connect using	lt_transaction;	

choose case vs_coltype
	case 'date'			
		select to_date(:ls_date,'yyyymmdd') into :ldate_calendar from dual using lt_transaction;
		this.settext( string(ldate_calendar))
		this.accepttext( )
	case 'datetime'				
		select to_date(:ls_date,'yyyymmdd') into :ldatetime_calendar from dual using lt_transaction;
		//This.setitem( row,ls_colname,ldatetime_calendar)
		this.settext( string(ldatetime_calendar))
		this.accepttext( )
end choose	

disconnect using	lt_transaction;	
destroy lt_transaction

end function

public function integer f_close_edit_ex ();//-- đổi giao diện sang giao diện editing --//
double			ldb_id
string				ls_main_dwo_for_edit, ls_oringalSQL_nowhere, ls_originalwhereClause, ls_editWhere
string				ls_currentSQL_nowhere, ls_currentwhereClause, ls_rtn
long				ll_rowcnt, ll_currow

window				lw_parent
s_object_display	lpo_handling
c_sql					lc_sql
t_transaction		lt_transaction
datawindow			ldw_focus
s_str_dwo			lstr_dwo[]

if this.f_getparentwindow( lw_parent) = 1 then
	lpo_handling = lw_parent.dynamic f_get_obj_handling()
	if  this.getrow() > 0 and not ib_dummy_row then
		ldb_id = this.getitemnumber( this.getrow(), 'ID')
	else
		ib_dummy_row = false
	end if
	ib_edit_changing = true
	//-- đổi dwo ve dwo default--//
	this.dataobject = lpo_handling.dynamic f_get_main_dwo()
	lw_parent.dynamic f_get_transaction(lt_transaction)
	connect using lt_transaction;
	this.settransobject( lt_transaction)	
	
	//-- đổi lại where gốc --//
	if this.f_getCurrentSQL(ls_currentSQL_nowhere, ls_currentwhereClause) = 1 then
		ls_originalwhereClause = this.f_get_currentwhere( )
		lc_sql.f_addtowhereclause( ls_currentSQL_nowhere, ls_originalwhereClause," AND ")
		ls_rtn = this.modify( "Datawindow.table.select = '"+ ls_currentSQL_nowhere + "'")
		this.f_create_navigate_bttn( )
		ldw_focus = lw_parent.dynamic f_get_idwfocus()
		if ldw_focus.classname() = this.classname() then
			this.object.datawindow.color = rgb(255,255,255)
		end if
		this.f_set_scrollbar( )
		this.f_set_properties( )
		this.f_set_ib_edit_changing(false)
		ll_rowcnt = this.event e_retrieve( )	
		if ll_rowcnt > 1 then
			if ldb_id > 0 then
				ll_currow = this.find( "ID = "+string(ldb_id), 1, ll_rowcnt)
			else
				ll_currow = ll_rowcnt
			end if
			this.scrolltorow( ll_currow)
		end if		
		//this.f_set_ib_edit_changing(false)
	end if			
	//-- resize fixed part --//
	lpo_handling.f_reset_fixedpart_grid( )	
	disconnect using lt_transaction;
end if
return 0

end function

public function boolean f_get_ib_inserting ();return ib_inserting
end function

public function boolean f_get_ib_excel_copying ();return ib_excel_copying
end function

public function integer f_update_pic_ex (blob vblb_picture, string vs_ctrl_pic_name, string vs_path, string vs_filetype, long row);long 				ll_obj_ref_id,ll_rtn,ll_ref_id,ll_idx
string 			ls_rtn,ls_pic_ref_field,ls_pic_ref_table, ls_pic_ref_colname,  ls_sql
window			lw_parent
t_transaction 	lt_transaction
powerobject		lc_object_handle_parent
s_str_dwo		lc_s_str_dwo[]

//-- Tạo connection voi database --//
lt_transaction = create t_transaction
lt_transaction.dbms =	SQLCA.DBMS
lt_transaction.ServerName	 = SQLCA.ServerName
lt_transaction.LogId	 = SQLCA.LogId
lt_transaction.LogPass 	 = SQLCA.LogPass 
lt_transaction.AutoCommit 	 = false 
lt_transaction.DBParm	 = SQLCA.DBParm
connect using	lt_transaction;	

	
	this.f_getparentwindow( lw_parent)
	lc_object_handle_parent = lw_parent.dynamic f_get_obj_handling()
	
	this.f_get_data_pic( lc_object_handle_parent, ls_pic_ref_table, ls_pic_ref_field, ls_pic_ref_colname, vs_ctrl_pic_name)

	ll_ref_id = this.getitemnumber( row, ls_pic_ref_field)
			
	ls_sql = "UPDATE "+ls_pic_ref_table + " SET " + ls_pic_ref_colname +"_filetype = '"+vs_filetype + "' WHERE ID = "+ string(ll_ref_id)
	EXECUTE immediate :ls_sql using lt_transaction;
	
	INSERT into blob_temp(id, blob_tmp)
	VALUES (:ll_ref_id, : vblb_picture) using lt_transaction;
	
	ll_rtn = lt_transaction.f_update_pic(ls_pic_ref_table,ls_pic_ref_colname, ll_ref_id)
	
	ls_sql = "Truncate table blob_temp"
	EXECUTE immediate :ls_sql using lt_transaction;
	
	commit using lt_transaction;
	disconnect   using	lt_transaction;	
	destroy  lt_transaction;

	if vs_path = '' then
		ls_rtn = this.modify( vs_ctrl_pic_name + '.filename =""')
		
	else
		ls_rtn = this.modify( vs_ctrl_pic_name + '.filename ='+"'"+vs_path+"'")
	end if
	
	return ll_rtn

end function

public function integer f_remove_pic_file_ex (string vs_pic_ref_table, string vs_pic_ref_field, string vs_pic_ref_colname, double vdb_ref_id);string				ls_pic_name,ls_sql,ls_default_directory,ls_path, ls_filetype
blob				lblb_logo
int					li_trn

t_transaction	lt_transaction

//-- Tạo connection voi database --//
lt_transaction = create t_transaction
lt_transaction.dbms =	SQLCA.DBMS
lt_transaction.ServerName	 = SQLCA.ServerName
lt_transaction.LogId	 = SQLCA.LogId
lt_transaction.LogPass 	 = SQLCA.LogPass 
lt_transaction.AutoCommit 	 = false 
lt_transaction.DBParm	 = SQLCA.DBParm
connect using	lt_transaction;	


		
ls_filetype = lt_transaction.f_remove_pic(vs_pic_ref_table, vs_pic_ref_colname, vdb_ref_id)

ls_pic_name =vs_pic_ref_colname+'_'+string(vdb_ref_id) + ls_filetype
ls_default_directory = gs_path_pic
ls_path = ls_default_directory + '\pics\' + ls_pic_name
if FileExists ( ls_path ) then
	if FileDelete ( ls_path ) then
		li_trn = 1
	else
		li_trn = -1
	end if
end if
commit using	lt_transaction;	
disconnect using	lt_transaction;	
destroy lt_transaction
return li_trn

end function

on t_dw_mpl.create
call super::create
end on

on t_dw_mpl.destroy
call super::destroy
end on

event rowfocuschanging;call super::rowfocuschanging;int 			li_idx
Boolean 		lb_querymode

//-- kiểm tra query mode --//
lb_querymode = inv_QueryMode.f_GetEnabled()
If lb_querymode Then Return 

if this.ib_ismaster and upperbound( this.iadw_detail[]) > 0 and not this.ib_isdetail then
	if this.ib_editing and not this.ib_inserting and not this.ib_deleting then 
		return 1
	end if
end if

return this.event e_rowfocuschanging( currentrow,  newrow )
end event

event rowfocuschanged;call super::rowfocuschanged;Boolean 				lb_querymode
int						li_idx

window 				lw_parent
t_dw_mpl			ldw_requester, ldw_focus, ldw_main
s_object_display	lpo_handling

//-- kiem tra query mode --//
lb_querymode = inv_QueryMode.f_GetEnabled()
If lb_querymode Then Return

if this.f_getparentwindow( lw_parent) = -1 then	 return -1
//-- Gọi điều khiển các button --//
if not ib_retrieving and not this.ib_inserting and not ib_deleting and not ib_saving  then
	//-- Báo object handling --//
	lpo_handling = lw_parent.dynamic f_get_obj_handling()
	//-- bật tắt nút --//
	ldw_focus = lw_parent.dynamic f_get_idwfocus()
	ldw_main = lw_parent.dynamic f_get_dwmain()
	ldw_requester = this	
	if not  ib_isdetail and this.ib_editing then
		//-- set editable column --//
		this.f_set_editable_property_row( this.ib_editing )
	end if	

	
	//-- filter detail --//
	// bỏ điều kiện  not  ib_isdetail  vì nếu có điều kiện thì khi rowfoscus trên dw ko phải main thì các detail của nó ko filter lại //
	If  ib_ismaster  and not lpo_handling.ib_copying and not lpo_handling.ib_allocating and not ldw_main.ib_retrieving  and not this.ib_version_copying then
		this.f_filter_detail( )
	End If
	//-- chạy điều khiển nút sau khi filter detail khi cài đặt PQ hoặc CS mà dwo điều kiện là detail ko bị lỗi--//
	if not lw_parent.dynamic f_get_ib_opening()  and ldw_focus.dataobject = ldw_requester.dataobject then
		if lw_parent.classname( ) <> 's_wr_multi' and lw_parent.classname( ) <> 's_w_multi_n' and lw_parent.classname( ) <> 's_w_multi_popup' then
			lw_parent.dynamic f_ctrl_enable_button(ldw_requester)
		else
			lpo_handling.f_ctrl_actionbuttons(ldw_requester)
			lw_parent.triggerevent( "e_display_actionbutton" )	
		end if
	end if

end if



//--scroll shared dw --//
if not this.ib_retrieving then
	if this.ib_ismaster and upperbound(this.iadw_shared[]) > 0 then
		FOR li_idx = 1 to  upperbound(this.iadw_shared[]) 
			this.iadw_shared[li_idx].scrolltorow(currentrow)
		NEXT
	elseif this.ib_isshared then
		this.idw_master.scrolltorow( currentrow)
	end if
end if

//-- gọi e_rowfocuschanged --//
if not ib_retrieving and not this.ib_inserting and not ib_deleting and not ib_saving and not lw_parent.dynamic f_get_ib_dwmain_resetting() &
	and not this.ib_edit_changing and not this.ib_isshared then
	this.event e_rowfocuschanged(currentrow)
end if

return 0


end event

event updateend;call super::updateend;window					lw_parent
datawindow				ldw_focus, ldw_requester
s_object_display		lpo_handling


//-- Gọi điều khiển các button --//
if this.f_getparentwindow( lw_parent) = 1 then
	ldw_focus = lw_parent.dynamic f_get_idwfocus()
	lpo_handling = lw_parent.dynamic f_get_obj_handling()
	//-- Báo object handling --//
	if isvalid(lpo_handling) then

		//-- set editable column --//
		this.f_set_editable_property(this.ib_editing)
	else
	end if
end if

if rowsinserted + rowsupdated > 0 then	
	//--Up trace info --//
	if this.ib_traceable then
		if this.f_upd_track_info() = -1 then
			return -1
		end if
	end if
	
end if

ldw_requester = this
return this.f_send_message_to_object( ldw_requester, 'updateend')
end event

event e_next;call super::e_next;return this.scrollnextrow( )
end event

event e_last;call super::e_last;if this.rowcount( ) = 0 then return 0
return this.scrolltorow( this.rowcount( ) )
end event

event e_first;call super::e_first;if this.rowcount( ) = 0 then return 0
return this.scrolltorow( 1)
end event

event e_prior;call super::e_prior;return this.scrollpriorrow( )
end event

event e_retrieve;call super::e_retrieve;int 							li_cols, li_idx,li_idx2, li_preretrieve, li_count
any 							la_retrieve_arg[10]
long 							ll_rtn, li_master_currow

setpointer(HourGlass!)
ib_retrieving = true
li_preretrieve = this.event e_preretrieve( )

if li_preretrieve <> -1 then
	if li_preretrieve = -9 then return -9 //-- dw external không retrieve --//
//	if ib_isdetail then		
//		if isvalid(idw_master) then
//			li_master_currow = idw_master.getrow()
//			if li_master_currow +  idw_master.filteredcount( ) <= 0 then				
//				this.f_reset( )
//			elseif idw_master.dynamic f_get_ib_dummy_row() then
//				ib_retrieving = false
//				this.f_reset( )
//			end if
//		end if
//	end if
	//-- lấy tham so retrieve --//
	li_count = upperbound(ia_retrieve_arg)
	if li_count > 0 then
		la_retrieve_arg[ ] = ia_retrieve_arg[]
	end if				
else //-- preretieve loi --//
	return -1
end if

if 	ib_retrieving then
	ll_rtn = this.retrieve(la_retrieve_arg[1], la_retrieve_arg[2], la_retrieve_arg[3], la_retrieve_arg[4],la_retrieve_arg[5], &
								la_retrieve_arg[6], la_retrieve_arg[7], la_retrieve_arg[8], la_retrieve_arg[9], la_retrieve_arg[10])		
	this.event e_postretrieve( ll_rtn)	
end if
setpointer(arrow!)
return ll_rtn
end event

event e_refresh;call super::e_refresh;/* return -1 if error */

double 				ldb_ID
long					ll_cur_row, ll_rows


ll_cur_row = this.getrow( )
if this.ib_editing = false then
	//-- Giu lai ID cua record hien tai --//
	ll_cur_row = this.getrow( )
	if ll_cur_row>0 then
		if this.describe( "id.coltype")= 'number' then
			ldb_ID = this.getitemnumber( this.getrow(), 'ID')
		end if
	end if
	ll_rows = this.event e_retrieve( )
	if ll_rows > 0 and ldb_ID > 0 then
		//-- chuyen den dong hien tai --//
		ll_cur_row = this.find( "ID = "+string(ldb_ID), 1, ll_rows)
		this.scrolltorow( ll_cur_row)
	end if
else	
	if ll_cur_row>0 then
		if this.getitemstatus( ll_cur_row, 0, primary!) = newmodified! or  this.getitemstatus( ll_cur_row, 0, primary!) = new! or this.ib_dummy_row then
			return 0
		else
			return this.reselectrow(ll_cur_row)	
		end if
	end if
end if

return ll_rows


end event

event retrieveend;call super::retrieveend;Boolean 					lb_querymode
long						ll_row, ll_len
int							li_idx
string						ls_gutter_text
s_w_main				lw_parent
s_object_display		lpo_handling
datawindow				ldw_focus, ldw_main
s_str_actionpane		lstr_actionpane[]

//-- query mode --//
lb_querymode = inv_QueryMode.f_GetEnabled()
If lb_querymode Then Return

this.f_getparentwindow( lw_parent)
lpo_handling = lw_parent.dynamic f_get_obj_handling()

//-- them record trang cho free form chua co du lieu --//
if rowcount = 0 and not this.f_isgrid( ) and not left(this.dataobject,2) = 'dr' and not lpo_handling.ib_copying  then  //

	ldw_main = lw_parent.dynamic f_get_dwmain()
	if ldw_main  = this  and lpo_handling.f_get_ib_changed_dwo_4edit() then
		//-- không làm gì hết--//
	else	
		ib_dummy_row = true
		this.event e_addrow( )
		this.event e_resetadding( )
	end if
else
	ib_dummy_row = false
end if

//-- Gọi điều khiển các button --//
ldw_focus = lw_parent.dynamic f_get_idwfocus()
//-- Báo object handling --//
if  ldw_focus.dataobject = this.dataobject then //and not lw_parent.dynamic f_get_ib_opening() then
	if lw_parent.classname( ) <> 's_wr_multi' and lw_parent.classname( ) <> 's_w_multi_n' and lw_parent.classname( ) <> 's_w_multi_popup'  then
		lw_parent.dynamic f_ctrl_enable_button(ldw_focus)
	else
		lpo_handling.f_ctrl_actionbuttons(ldw_focus)
		lw_parent.triggerevent( "e_display_actionbutton" )				
	end if
end if
//-- set editable column --// 
//this.f_set_editable_property_row( this.ib_editing)

/*OLD
//-- retrieve detail --//
If  ib_ismaster and not this.ib_isdetail and upperbound(this.iadw_detail) > 0  and not lpo_handling.ib_copying Then
	if rowcount > 0  then //-- đối tượng được open để copy thì ko retrieve detail --//
		if not this.ib_edit_changing then
			this.f_retrieve_detail( )
		end if
	else
		this.f_reset_detail( )
	end if
End If OLD*/

If  ib_ismaster and not this.ib_isdetail and not lpo_handling.ib_copying Then  // and not this.ib_edit_changing
	this.f_retrieve_detail( )
End If


//--scroll shared dw --//
if this.ib_ismaster and upperbound(this.iadw_shared) > 0 then
	FOR li_idx = 1 to upperbound(this.iadw_shared)
		if this.ib_dummy_row then
			this.iadw_shared[li_idx].dynamic f_set_ib_dummy_row(ib_dummy_row)
		end if
		this.iadw_shared[li_idx].scrolltorow(this.getrow())
	NEXT
end if

//--Load hình khi dw có khung hình--//
//--Detail được load hình trong f_filter_detail--//
if ib_ismaster or lower(left(lpo_handling.classname( ),3)) = 'ur_' or lower(lpo_handling.classname( )) = 'b_view' then

	ll_row = this.getrow( )
	if ll_row > 0 then
		f_load_pic(ll_row)
	end if

end if

this.event e_retrieveend( rowcount )

//-- set tổng số record --//
if this.f_isgrid( ) and not this.ib_isdetail  then
	this.setredraw( false)
	if this.describe("gutter_t.x") <> '?' and  this.describe("gutter_t.x") <> '!' then
		this.modify("gutter_t.text= '["+string(rowcount)+ "]' ")
		ls_gutter_text = this.describe( "gutter_t.text")
		ll_len =len(ls_gutter_text)*35
		this.modify( "gutter_t.x = 9 gutter_t.width="+string(ll_len))
		this.modify( "gutter.x = 9 gutter.width="+string(ll_len))		
		this.modify("gutter_t.color  = '" +string(rgb(0,0,255))+"'")
	end if	
	this.setredraw( true)
end if	


return 0
end event

event doubleclicked;call super::doubleclicked;	t_dw_mpl	ldw_handling
	If IsValid (inv_Sort) Then
		if row = 0 then
			inv_sort.Event e_DoubleClicked(xpos,ypos,row,dwo)
		end if
	End If
	if row > 0 then
		ldw_handling = this
		return this.f_send_message_to_object( ldw_handling,row, dwo.name, "e_doubleclicked")
	end if
end event

event e_filter;call super::e_filter;String ls_dataobject
t_dw_mpl ldw_master

//If ib_isshared Then
//	ldw_master = This.f_getdwmaster( )
//Else
	ldw_master = this
//End If
ls_dataobject = ldw_master.DataObject
If IsNull(ls_dataobject) or Trim(ls_dataobject) = '' Then Return -1

//Return OpenWithParm(u_w_filter,ldw_master)

end event

event updatestart;call super::updatestart;int 					li_idx1, li_idx2, li_rtn, li_colCnt
long 					ll_modified_row, ll_detail_row
string 				ls_col_string, ls_table_update, las_master_keycol[], las_detail_keycol[],ls_source,ls_data_current, ls_data_origin
string					ls_must_save_string, ls_columns[], ls_coltype, ls_coltext, ls_original_filter, lsa_ref_columns[],ls_match_not_modify
any 					la_data
boolean				lb_filter,lb_not_modify
double				ldb_main_id,ladb_related_id[]
c_string				lc_string
datawindow			ldw_requester,ldw_main,ladw_shared[]
s_w_main			lw_display
s_object_display	lod_handle
c_dwservice			lc_dwser
t_ds_db				lds_tmp


this.f_getparentwindow( lw_display)
lod_handle = lw_display.dynamic f_get_obj_handling()
ldw_main = lw_display.dynamic f_get_dwmain()
li_rtn = this.f_getdwshared( ladw_shared)
//-- khóa lại sau khi chỉnh dw main lấy hết cột hiện thị như dw share --//
if li_rtn > 0 then
	li_colCnt = this.f_getcolumns_sql( ls_columns[])
else
	li_colCnt = this.f_getcolumns( ls_columns[])
end if
//----//
if this.modifiedcount( ) > 0 then	
//	this.GetItemNumber(1, "ID", Filter!, false)
	ll_modified_row = this.GetNextModified(0, Primary!)
	if ll_modified_row = 0 then
		ll_modified_row = this.GetNextModified(0, Filter!)
		lb_filter = true
	end if
	DO while ll_modified_row > 0 //and ll_modified_row <= this.rowcount( )		
		FOR li_idx1 = 1 to li_colCnt
			//-- khóa lại sau khi chỉnh dw main lấy hết cột hiện thị như dw share --//
			if li_rtn > 0 then
				ls_coltext = lc_dwser.f_getcolumnlabel_ex(ls_columns[li_idx1] , this.dataobject, lod_handle.classname( ) , lw_display.it_transaction ) 
			else
				ls_coltext = this.describe( ls_columns[li_idx1]+'_t.text')
			end if
			//----//
			//-- tạo số tự động --//
			lod_handle.idwsetup_initial.f_set_autonumber_ex(ls_columns[li_idx1] , this, ll_modified_row, lw_display.it_transaction)
			//-- Kiểm bắt buộc nhập khi lưu --//
			ls_coltype = this.describe( ls_columns[li_idx1]+'.coltype')
			ls_must_save_string =  lod_handle.idwsetup_initial.f_get_must_save_string(this.dataobject, ls_columns[li_idx1], ls_coltype)			
			if ls_must_save_string = 'yes' then
				if lb_filter then
					la_data = this.f_getitemany( ll_modified_row, ls_columns[li_idx1], Filter!, false)
				else
					la_data = this.f_getitemany( ll_modified_row, ls_columns[li_idx1], Primary!, false)
				end if
				if isnull(la_data) then
					gf_messagebox('m.t_dw_mpl.updatestart.01','Thông báo','Chưa nhập dữ liệu cho cột sau: @'+ls_coltext, 'exclamation','ok',1)
					return 1
				end if
			elseif ls_must_save_string <> 'no' then
				ls_col_string = this.describe( "Evaluate('"+ls_must_save_string+"', "+string(ll_modified_row)+")")
				if ls_col_string = 'yes' then
					if lb_filter then
						la_data = this.f_getitemany( ll_modified_row, ls_columns[li_idx1], Filter!, false)
					else
						la_data = this.f_getitemany( ll_modified_row, ls_columns[li_idx1], Primary!, false)
					end if
					if isnull(la_data) then
						gf_messagebox('m.t_dw_mpl.updatestart.01','Thông báo','Chưa nhập dữ liệu cho cột sau: @'+ls_coltext, 'exclamation','ok',1)
						return 1
					end if			
				end if
			end if
			//-- kiểm tra cột không được sửa sao khi match--//
			lb_not_modify = lod_handle.idwsetup_initial.f_is_match_not_modify(this.dataobject, ls_columns[li_idx1])
			if lb_not_modify then
				if this.getitemstatus( ll_modified_row, ls_columns[li_idx1], Primary!) = DataModified! or this.getitemstatus( ll_modified_row, ls_columns[li_idx1], Filter!) = DataModified! then
					ldb_main_id = ldw_main.getitemnumber(ldw_main.getrow( ) , 'ID')
					if lb_filter then
						ls_data_current = string(this.f_getitemany( ll_modified_row, ls_columns[li_idx1], Filter!, false))
						ls_data_origin = string(this.f_getitemany( ll_modified_row, ls_columns[li_idx1], Filter!, true))
					else
						ls_data_current = string(this.f_getitemany( ll_modified_row, ls_columns[li_idx1], Primary!, false))
						ls_data_origin = string(this.f_getitemany( ll_modified_row, ls_columns[li_idx1], Primary!, true))
					end if
					if isnull(ls_data_current) then ls_data_current = ''
					if isnull(ls_data_origin) then ls_data_origin = ''
					if ls_data_current <> ls_data_origin then
						li_rtn = lod_handle.dynamic f_get_t_doc_id(ldb_main_id,ladb_related_id[])
						if li_rtn = 0 then li_rtn = lod_handle.dynamic f_get_f_doc_id(ldb_main_id,ladb_related_id[])
						if li_rtn > 0 then 
							gf_messagebox('m.t_dw_mpl.updatestart.03','Thông báo','Phiếu đã kết nên không được sửa cột sau: @'+ls_coltext, 'exclamation','ok',1)
							return 1
						end if
					end if
				end if
			end if
		NEXT
		//-- kiểm tra trùng dữ liệu --//
		if lod_handle.idwsetup_initial.f_is_duplicated_data_ex(this, ll_modified_row) then
			return 1
		end if
		//-- Nếu là master kiểm tra cập nhật key cho detail nếu bị thay đổi--//
		if this.ib_ismaster then
		end if		
		//-- update bảng matching --//
		if not lod_handle.f_get_ib_copying( ) then
			if lb_filter then
				if lod_handle.f_update_matching(this,ll_modified_row, Filter!)	= -1 then return 1
			else
				if lod_handle.f_update_matching(this,ll_modified_row, Primary!)	= -1 then return 1
			end if
		end if
		//-- tìm row modifief tiếp theo --//
		if lb_filter then
			ll_modified_row = this.GetNextModified(ll_modified_row, Filter!)
		else
			ll_modified_row = this.GetNextModified(ll_modified_row, Primary!)
		end if
		if ll_modified_row = 0 and not lb_filter then 
			ll_modified_row = this.GetNextModified(0, Filter!)
			lb_filter = true
		end if
	LOOP
end if

//-- Cập nhật bảng sequences_del --//
if this.deletedcount( ) > 0 then
	FOR li_idx1 = 1 to li_colCnt
		lod_handle.idwsetup_initial.f_del_autonumber(ls_columns[li_idx1] , this )
	NEXT
end if

//-- kiểm tra master có update ref_table_field chưa --//
if this.ib_ismaster and not this.ib_isdetail and this.ib_ref_table_yn then
	li_colCnt = lc_string.f_stringtoarray( this.is_ref_table_field, ';', lsa_ref_columns[])
	FOR li_idx1 = 1 to li_colCnt
		ll_modified_row = this.find( "isnull("+ lsa_ref_columns[li_idx1] +")" , 1, this.rowcount())
		if ll_modified_row > 0 then
			gf_messagebox('m.t_dw_mpl.updatestart.02','Thông báo','Chưa có nhập dữ liệu chi tiết','exclamation','ok',1)
			return 1
		end if		
	NEXT	
end if


//-- thông báo object --//
if this.modifiedcount( ) + this.deletedcount( ) >0 then
	ldw_requester = this
	if this.f_send_message_to_object( ldw_requester, 'updatestart') = -1 then
		return 1
	end if
end if

return 0

end event

event sqlpreview;call super::sqlpreview;
//if sqltype = PreviewInsert! then
//	if this.ib_traceable then
//		idb_insert_id[upperbound(idb_insert_id)+1] = this.getitemnumber( row,'ID', buffer,false)
//	end if
//elseif sqltype = PreviewUpdate! then
//	if this.ib_traceable then
//		idb_upd_id[upperbound(idb_upd_id)+1] = this.getitemnumber( row,'ID',buffer,false)
//	end if
//elseif sqltype = PreviewDelete! then	
//elseif sqltype = PreviewSelect! then	
//	//-- Load hình nếu có khung hình --//
////	if row > 0 then this.f_load_pic(row)
//
//end if
end event

event e_rowfocuschanging;call super::e_rowfocuschanging;t_dw_mpl			ldw_main
window 				lw_parent
datawindow			ldw_requester
s_object_display	lpo_handling

ldw_requester = this
this.f_getparentwindow( lw_parent)
lpo_handling = lw_parent.dynamic f_get_obj_handling()
ldw_main = lw_parent.dynamic f_get_dwmain()
If  ib_ismaster  and not lpo_handling.ib_copying and not lpo_handling.ib_allocating and not ldw_main.ib_retrieving  and not this.ib_version_copying and pos(lpo_handling.classname( ),'_valueset_') > 0 then
	this.f_checkin_gutter_detail( 'N')
end if
return this.f_send_message_to_object( ldw_requester, currentrow, newrow, 'e_rowfocuschanging' )

end event

event e_rowfocuschanged;call super::e_rowfocuschanged;datawindow			ldw_requester


ldw_requester = this
return this.f_send_message_to_object( ldw_requester, currentrow,'e_rowfocuschanged')

end event

event buttonclicked;call super::buttonclicked;string		ls_btname
t_dw_mpl		ldw_handle

ls_btname = dwo.name
choose case ls_btname
	case 'b_grid'
		this.f_change_2_grid( )
	case 'b_form'
		this.f_change_2_form( )
	case 'b_first'
		this.event e_first( )
	case 'b_prior'
		this.event e_prior( )
	case 'b_next'
		this.event e_next( )
	case 'b_last'
		this.event e_last( )
//	case 'b_map','b_map_1'
//		this.f_openmap()
end choose
if pos(ls_btname,'b_map') > 0 then
	this.f_openmap(ls_btname)
end if
ldw_handle = this
this.f_send_message_to_object( ldw_handle,row, ls_btname, "buttonclicked")
end event

event editchanged;call super::editchanged;int 						li_rtn, li_editpos
long					ll_found_row
string					ls_autocomplete_string, ls_editStyle, ls_dwdatatype,ls_dwdatatype_str, ls_coltype, ls_colname, ls_filter_str
character				lc_last, ls_next2last
window				lw_parent
s_object_display	lod_handling
datawindowchild	ldwc
b_obj_instantiate	lbo_ins

//-- kiểm tra cột set edit mask 'time' (hh:mm): thêm vào ngày tháng năm--//
if this.describe( dwo.name+".tag") = 'time' then
	data = '1900-01-01 '+ data
end if

//-- open window valueset --//
lc_last = Right(data, 1)
ls_colname = dwo.name
if lc_last = '`' then
	ls_next2last = left(Right(data, 2),1)
	if ls_next2last <> "'" then //-- Nếu có dấu (') truoc dấu trừ (-) thì ko open window valueset --//
		//-- build where theo gia trị phụ thuộc --//
		if this.f_getparentwindow( lw_parent) = 1 then
			lod_handling = lw_parent.dynamic f_get_obj_handling()
		end if	

		ls_coltype = this.describe(dwo.name +'.coltype' )
		li_rtn = lod_handling.idwsetup_initial.f_get_dwdatatype_string(dwo.name , ls_coltype, this, ls_dwdatatype)
		if li_rtn = 0 then return
		if (ls_dwdatatype = 'valueset' or ls_dwdatatype = 'dwo' ) then
			li_rtn = this.event e_popup_data(dwo.name, 'u_valueset' )
//			if this.inv_querymode.f_GetEnabled() then this.inv_querymode.event e_itemchanged( row, ls_colname,this.gettext( ) )
			if li_rtn = -1 then return 1		
		elseif ls_dwdatatype = 'STRUCT_SEGMENT'  then
		//-- Trường hợp structure --//
			li_rtn = this.event e_popup_data(dwo.name,'u_structure' )
			if li_rtn = -1 then return 1		
		end if
	end if
else

	//* -- Khoá để complete sau khi bấm ENTER --//
	ls_editStyle =  this.describe(dwo.name + ".Edit.Style")
	IF ls_editStyle = 'dddw' or ls_editStyle = 'ddlb' then
		//-- filter dwc--//
		if this.getchild( dwo.name, ldwc) = -1 then return		
		//-- auto complete value set --//
		li_editpos = this.position()
		if len(mid(data,li_editpos -1,1)) > 1 then li_editpos ++
		ls_autocomplete_string = this.f_get_autocomplete_string_ex(dwo.name, data, ls_editStyle, ldwc)		
		
		if lower(left(trim(ls_autocomplete_string), len(data))) = lower(data) then
			this.settext( ls_autocomplete_string)	
			If len(data) = len(ls_autocomplete_string) THEN
				 This.SelectText (Len (ls_autocomplete_string)+1, 0)
			Else
				This.SelectText (li_editpos, Len (ls_autocomplete_string))
			End If						
		end if
		if this.ib_dropdowning = false then 
			this.ib_dropdowning = true
			this.keybd_event( 115,0,0,0 )
		end if
	
	end if
	 //--Khoá để complete sau khi bấm ENTER */
	 
end if
	

end event

event getfocus;call super::getfocus;window 				lw_parent
s_object_display	lpo_handling
datawindow			ldw_focus, ldw_getfocus, ldw_shared[], ldw_detail[], ldw_request
Boolean 				lb_querymode
string 				ls_colname
int						li_idx, li_rtn

//-- Kiểm tra query mode --//
//lb_querymode = inv_QueryMode.f_GetEnabled()
//If lb_querymode Then Return
//-- kiểm tra có đang bị lỗi nhập liệu --//
if this.ib_dataerror then
	this.ib_dataerror =false
	return 1
end if

//-- gán idw_focus: Chỉ thay đổi focus khi dang editing --//
if this.f_getparentwindow( lw_parent) = 1 then
		
	lpo_handling = lw_parent.dynamic f_get_obj_handling()		
	if isvalid(lpo_handling) then
		ldw_focus = lw_parent.dynamic f_get_idwfocus()
		if this.ib_isshared then
			ldw_getfocus = this.f_getdwmaster( )
		elseif this.ib_isdetail and this.ib_focus_master   then
			ldw_getfocus = this.f_getdwmaster( )
		else
			ldw_getfocus = this
		end if		
		if isvalid(ldw_focus) and 	ldw_focus.dataobject <> ldw_getfocus.dataobject then
			//-- thay đôi màu background cua dw losefocus va getfocus --//
			ldw_focus.object.datawindow.color = lw_parent.backcolor //rgb(221,221,221)
			if ldw_focus.dynamic f_get_ib_master() and ldw_focus.dynamic f_getdwshared(ldw_shared) > 0 then
				FOR li_idx = 1 to upperbound(ldw_shared)
					ldw_shared[li_idx].object.datawindow.color = lw_parent.backcolor 
				NEXT
			elseif ldw_focus.dynamic f_get_ib_master() and ldw_focus.dynamic f_getdwdetails(ldw_detail) > 0 then
				FOR li_idx = 1 to upperbound(ldw_detail)
					if ldw_detail[li_idx].dynamic f_get_ib_focus_master() then
						ldw_detail[li_idx].object.datawindow.color = lw_parent.backcolor 
					end if
				NEXT				
			end if
			//-- get focus --//
			this.object.datawindow.color = rgb(255,255,255)		
			ldw_getfocus.object.datawindow.color = rgb(255,255,255)
			if this.ib_ismaster and upperbound(this.iadw_shared) > 0 then
				FOR li_idx = 1 to upperbound(iadw_shared)
					iadw_shared[li_idx].object.datawindow.color =rgb(255,255,255)
				NEXT
			elseif  this.ib_ismaster and upperbound(this.iadw_detail ) > 0 then
				FOR li_idx = 1 to upperbound(iadw_detail)
					if iadw_detail[li_idx].dynamic f_get_ib_focus_master() then
						iadw_detail[li_idx].object.datawindow.color  =rgb(255,255,255)
					end if
				NEXT								
			end if
			//-- set dw focus khi dataobject thay đoi --//
			lw_parent.dynamic f_set_idwfocus(ldw_getfocus)
			ldw_focus = ldw_getfocus	
			//-- bật tắt nút theo phân quyền--//
			if not lw_parent.dynamic f_get_ib_opening() then
				if lw_parent.classname( ) <> 's_wr_multi' and lw_parent.classname( ) <> 's_w_multi_n' and lw_parent.classname( ) <> 's_w_multi_popup'  then
					lw_parent.dynamic f_ctrl_enable_button(ldw_focus)
				else
					lpo_handling.dynamic f_ctrl_actionbuttons(ldw_focus)
					lw_parent.triggerevent( "e_display_actionbutton" )			
				end if
			end if
		else //-- trường hợp getfocus lai dw dang focus : chỉ thay doi mau nen cua dw--//
			this.object.datawindow.color = rgb(255,255,255)
			ldw_getfocus.object.datawindow.color = rgb(255,255,255)
			if ldw_getfocus.dynamic f_get_ib_master() and ldw_getfocus.dynamic f_getdwshared(ldw_shared[])> 0 then
				FOR li_idx = 1 to upperbound(ldw_shared)
					ldw_shared[li_idx].object.datawindow.color =rgb(255,255,255)
				NEXT
			elseif  ldw_getfocus.dynamic f_get_ib_master() and ldw_getfocus.dynamic f_getdwdetails(ldw_detail[])> 0 then
				FOR li_idx = 1 to upperbound(ldw_detail)
					if ldw_detail[li_idx].dynamic f_get_ib_focus_master() then
						ldw_detail[li_idx].object.datawindow.color  =rgb(255,255,255)
					end if
				NEXT								
			end if		
			if not lw_parent.dynamic f_get_ib_opening() and not this.ib_inserting and not this.ib_valuesetting then 		
				//-- set editable column --// ( cần kiểm tra xem có cân thiết gọi hàm ở đây ko?)
//				this.f_set_editable_property( this.ib_editing )		
			end if			
		end if
		//-- Thong bao object --chuyển về sau: 30/09/2020--//
		ldw_request = this
		li_rtn = this.f_send_message_to_object( ldw_request, 'getfocus')
		if li_rtn = -9 then return //-- (-9) là dw external nên không thực gì hết --//		
	else
		return -1
	end if
	this.Modify("DataWindow.Syntax.Modified=No")
	//-- goi user event --//
	if this.event e_getfocus( ) = 1 then return 1
	return 1
else
	return -1
end if

end event

event itemchanged;call super::itemchanged;int					li_rtn, li_ansector_rtn
boolean			lb_querymode
string				ls_data, ls_coltype, ls_colname,ls_coltext,ls_origin_data
any				la_origindata
c_string			lc_string
c_dwservice		lc_dwser
window			lw_display

s_object_display	lod_handle
b_obj_instantiate	lb_obj_ins

la_origindata = this.f_getitemany( row, dwo.name)
ls_origin_data = string(la_origindata)
//-- Kiểm tra query mode --//
lb_querymode = inv_QueryMode.f_GetEnabled()
If lb_querymode Then
	// Pass the data entered to the querymode service
	Return inv_querymode.event e_ItemChanged(1, string(dwo.name),data)
End If
//-- return khi dữ liệu nhập trước đó bị lỗi --//
if this.ib_dataerror then
	this.ib_dataerror = false
	return 0
end if

if string(data) = '`' then
	//-- Trường hợp quét khối chuổi rồi bấm dấu trừ --//
	ls_data = string(la_origindata)
else
	ls_data = string(data)
end if

//-- kiểm tra cột không được sửa sau khi kết chứng từ --//
this.f_getparentwindow( lw_display)
lod_handle = lw_display.dynamic f_get_obj_handling()
if lb_obj_ins.f_is_matched( lod_handle, dwo.name, this,ls_origin_data,ls_data) then 
	ls_coltext = lc_dwser.f_getcolumnlabel(dwo.name , this.dataobject, upper(lod_handle.classname( )) )
	gf_messagebox('m.b_doc.e_itemchanged.01','Thông báo','Phiếu đã kết nên không được sửa cột sau: @'+ls_coltext, 'exclamation','ok',1)
	this.settext(la_origindata)
	this.ib_dataerror = true
	return 1
end if

//-- tính toán phép tính số học : 5+(6-3)*4 --//
ls_coltype = this.describe( dwo.name+'.coltype')
if left(ls_coltype,3) = 'num' or  left(ls_coltype,3) = 'dec' then
	if not isnumber(ls_data) then
		if lc_string.f_check_data_number(ls_data) then
			ls_data = this.describe( "Evaluate('" + ls_data + "', 0) ")
			li_ansector_rtn = 2
		else
			this.ib_dataerror = true
			gf_messagebox('m.t_dw_mpl.itemchanged.01','Thông báo','Dữ liệu không hợp lệ:@'+ls_data,'exclamation','ok',1)
			this.ib_dataerror = false
			return 1
		end if
	end if
end if
//-- gọi e_itemchanged --//
//li_rtn = this.event e_itemchanged( row, dwo, ls_data)
li_rtn = this.event e_itemchanged(row, dwo, ls_data)
//-- kiểm tra giá trị trả về --//
if li_ansector_rtn = 2 and li_rtn = 0 then
	ls_colname = dwo.name
	li_rtn = this.setitem( row,ls_colname , double(ls_data))
	return 2
elseif  li_ansector_rtn = 2 and li_rtn = 2 then
	return 2
elseif li_rtn = 1 then
	ls_colname = dwo.name
	this.setitem( row,ls_colname ,la_origindata)	
	return 1
elseif data = '`' and li_rtn <> 0 then
	/* and li_rtn <> 0 được thêm vào để không bị lỗi trong trường hợp đổi loại đối tượng rồi mới bấm dấu trừ , lúc này origindata là null */
	this.ib_dataerror = true
	return 1
end if
return li_rtn
end event

event itemerror;call super::itemerror;string 				ls_coltype, ls_colname, lsa_receive_cols[],  ls_col_curcode, ls_col_exrate
boolean				lb_querymode
int						li_cnt, li_idx, li_chk
double				ldb_exrate
any					la_data
c_string				lc_string
window				lw_display
s_object_display	lod_handle	

//-- Kiểm tra query mode --//
lb_querymode = inv_QueryMode.f_GetEnabled()
If lb_querymode Then Return 2

if this.ib_dataerror then
	ls_colname = dwo.name
	if string(data) <> '`' then this.setcolumn( ls_colname)
	//-- restore lại dữ liệu original --//
	this.f_getparentwindow( lw_display)
	lod_handle = lw_display.dynamic f_get_obj_handling()		
	//--kiểm tra tỷ giá: khi edit cột loại tiền--//
	li_chk = lod_handle.f_get_colname_exchange_rate( this, lod_handle.idwsetup_initial.is_receive_column, ls_col_curcode, ls_col_exrate)	
	li_cnt = lc_string.f_stringtoarray(lod_handle.idwsetup_initial.is_receive_column , ';', lsa_receive_cols[])	
	FOR li_idx = 1 to li_cnt
		la_data = this.f_getitemany( row, lsa_receive_cols[li_idx], primary!, true)
		this.setitem( row,  lsa_receive_cols[li_idx], la_data)
		//-- lấy lại tỷ giá theo --//
		if  li_chk = 1 and ls_col_curcode = lsa_receive_cols[li_idx] then
			la_data = this.f_getitemany( row, ls_col_exrate, primary!, true)
			this.setitem( row, ls_col_exrate, la_data)
		end if
	NEXT
	this.ib_dataerror = false
	return 1
else
	ls_coltype = this.describe( dwo.name + '.coltype')
	if left(ls_coltype,3) = 'num' or left(ls_coltype,3) = 'dec' and ib_accept_data then
//		this.ib_dataerror =true
		return 2
	end if
//	this.ib_dataerror =true
	return 1
end if				
end event

event itemfocuschanged;call super::itemfocuschanged;string			ls_editStyle
datawindowchild 		ldwc
s_w_main				lw_display
s_object_display		lod_handle
//t_dw_mpl				ldw_request


ib_dropdowning = false
is_textprev = ''
if dwo.name = this.is_focus_colname then this.selecttext(1, len(this.gettext( )))


this.f_getparentwindow( lw_display)
lod_handle = lw_display.dynamic f_get_obj_handling()
//ldw_request = this
lod_handle.post event e_dw_e_itemfocuschanged( this, row,dwo.name)


end event

event losefocus;call super::losefocus;//t_w_main lw_parent

Boolean lb_querymode

//-- kiểm tra query mode --//
//lb_querymode = inv_QueryMode.f_GetEnabled()
//If lb_querymode Then Return

ib_dropdowning = false
//-- accepttext và đổi màu nền --//
if not this.ib_dataerror then
	if this.accepttext( ) = -1 then return 1
end if
is_focus_colname = this.getcolumnname( )
return this.event e_losefocus( )

end event

event e_mousemove;call super::e_mousemove;string 				ls_ctrl_pic_name,ls_rtn
window				lw_parent
s_object_display	lobj_handle
t_dw_mpl			ldw_handling
//-- Thay doi hinh cua cac nut navigation --//
this.f_repaint_navigate_bttn( dwo.name)

ls_ctrl_pic_name = 'p_logo'
if this.describe(ls_ctrl_pic_name+".X") <> "!" and this.describe(ls_ctrl_pic_name+".visible") <> '0' then
	if dwo.name = ls_ctrl_pic_name then
		this.f_getparentwindow(lw_parent )
		lobj_handle = lw_parent.dynamic f_get_obj_handling( )
		if lobj_handle.classname( ) = 'b_view' or pos(lobj_handle.classname( ),'report') > 0 then return
		if this.describe("add_pic.X") <> "!" then
			ls_rtn = this.describe(ls_ctrl_pic_name+".Filename")
			if ls_rtn <> '' then
				f_enable_ctrl_text_of_pic(2)
			else
				f_enable_ctrl_text_of_pic(1)
			end if
		else
				f_create_ctrl_text_of_pic(2,dwo.name)
		end if
	else /*kiểm tra xmouse trong khoảng từ xpic đến xpic-200 hoặc xmouse từxpic + widthpic đến xpic + widthpic + 200*/
		if  f_check_posmouse_on_pic(xpos,ypos,ls_ctrl_pic_name) then
			f_visible_ctrl_text_of_pic()
		end if
	end if
	if this.describe("add_pic.visible") <> "!" then
		if this.describe("remove_pic.visible") <> "!" then
			if this.describe("add_pic.visible") <> "0" or this.describe("remove_pic.visible") <> "0" then
				f_change_color_ctrl_of_pic(dwo.name)
			elseif this.describe("add_pic.visible") <> "0" then
				f_change_color_ctrl_of_pic(dwo.name)
			end if
		else
		end if
	end if
end if
ldw_handling = this
this.f_send_message_to_object( xpos, ypos, row, ldw_handling, 'e_mousemove')
/*
long ll_count, ll_row
// chưa tính đến việc phân quyền cho từng user 
string ls_colname,ls_window_click,ls_datawindow_click,ls_describe,ls_QueryModeCheck,ls_colvariable ,ls_windowopen,ls_datawindow_report,ls_datawindow_report1
long li_i, li_icount,li_access_right,li_admin
window lw_parent
this.f_getparentwindow( lw_parent)
ls_colname = trim(dwo.name)
ls_window_click = lw_parent.classname()
ls_datawindow_click = this.dataobject
Select  WINDOWNAME,cust_char_03  into :ls_windowopen ,:ls_datawindow_report
From erp_primary_window  
Where trim(dwcolname) = trim(:ls_colname) and  nvl(trim(window_click), :ls_window_click) = trim(:ls_window_click) and CUST_CHAR_01 =:ls_datawindow_click and rownum=1  ;
// nếu có cài đặt drill down thì quét sáng cột đó và thay đổi hình dạng con chuột
ll_row = row
if len(trim(ls_windowopen)) <>0 and not isnull(ls_windowopen) then 	
// phan tich them 	
	select role_id  into :li_admin  from erp_role_user where user_id = :gi_userid  and rownum <2 ;
	if li_admin <>1 then 
		// phân quyền nếu mở báo biểu thì kiểm tra phần quyền cho báo biểu trước		
		// nếu mở window 
		if isnull(ls_datawindow_report) or len(trim(ls_datawindow_report)) =0  then 
			SELECT access_right into :li_access_right
						  FROM ERP_USER_SECURITY
						WHERE user_id = :gi_userid
							AND company_id = :gi_user_comp_id
							AND security_id = :ls_windowopen;								
			// nếu mức user không có thì kiểm tra trong nhóm 				
			if isnull(li_access_right ) or li_access_right = 0 then 		//if-08//
				SELECT  access_right into :li_access_right
				 FROM ERP_ROLE_SECURITY
				WHERE role_id in (select role_id from erp_role_user where user_id = :gi_userid)
				AND company_id = :gi_user_comp_id
				AND security_id = :ls_windowopen;	
				// cần phải kiểm tra thêm 				
			end if		
			if isnull(li_access_right ) or li_access_right = 0 then return -1 	
		// nếu mở báo biều 	
		else
		select  RTRIM(:ls_datawindow_report ,'r') ||'p' into :ls_datawindow_report1   from dual 	;
			SELECT access_right into :li_access_right
						  FROM ERP_USER_SECURITY
						WHERE user_id = :gi_userid
							AND company_id = :gi_user_comp_id
							AND security_id = :ls_datawindow_report1;								
			// nếu mức user không có thì kiểm tra trong nhóm 		
			if isnull(li_access_right ) or li_access_right = 0 then 		//if-08//
				SELECT  access_right into :li_access_right
				 FROM ERP_ROLE_SECURITY
				WHERE role_id in (select role_id from erp_role_user where user_id = :gi_userid)
				AND company_id = :gi_user_comp_id
				AND security_id = :ls_datawindow_report1;	
			end if		
			if isnull(li_access_right ) or li_access_right = 0 then return -1 	
		end if // end 	isnull(ls_datawindow_report)
	end if 	// nếu không phải la ADmin
//----------------------------------------------------------------------------
	is_col_click = ls_colname
	if row =0 then 
		ls_describe = (ls_colname + ".Color=16711680")
		ls_QueryModeCheck= this.Modify(ls_describe )	
		ls_describe = (ls_colname + ".font.Italic=1")
		ls_QueryModeCheck= this.Modify(ls_describe ) 	
	else
		ls_describe = (ls_colname + ".Color='0~tIf(getrow() =" + string(ll_row)+" ,RGB(0, 0,255),0)'")
		ls_QueryModeCheck= this.Modify(ls_describe )	
		ls_describe = (ls_colname + ".font.Italic='0~tIf(getrow() =" + string(ll_row)+" ,1,0)'")
		ls_QueryModeCheck= this.Modify(ls_describe ) 	
	end if 	
else 
	// bo thiet lap chu tren cot vua moi quet len // tam thoi dung cach củ chuối này đã
	// truong hop la cot compute thi sao day??
	if is_col_click <>'' and not isnull(is_col_click) then 
		ls_describe = (is_col_click + ".Color=0")
		ls_QueryModeCheck= this.Modify(ls_describe )	
		ls_describe = (is_col_click + ".font.Italic=0")
		ls_QueryModeCheck= this.Modify(ls_describe ) 	
	end if	
end if 
	 */

end event

event e_dwnkey;call super::e_dwnkey;
s_w_main 					lw_parent
datawindow				ldw_actionpane
t_dw_mpl				ldw_handle
datawindowchild		ldwc
s_object_display		lpo_handling
b_obj_instantiate		lbo_inst

string				ls_name, ls_selected, ls_clipboard, ls_autocomplete_string, ls_data, ls_coltype, ls_dwdatatype,  las_empty[]		
int					li_row, li_idx, li_editpos, li_rtn
boolean			lb_querymode
any				la_data, laa_empty[]

if ancestorreturnvalue = 1 then return 1

if key=keyA! and keyflags = 2 then
	if this.f_isgrid( ) then
		ls_selected = this.getitemstring( this.getrow(), 'gutter')
		if ls_selected = 'Y' then
			FOR li_row = 1 to this.rowcount( )
				this.setitem( li_row, 'gutter', 'N')
			NEXT
		else
			FOR li_row = 1 to this.rowcount( )
				this.setitem( li_row, 'gutter', 'Y')
			NEXT			
		end if
	end if
	return 1
elseif key=keyS! and keyflags = 2 then
	if this.accepttext( ) <> 1 then return 1
	if this.f_getparentwindow(lw_parent) = 1 then		
		if lw_parent.dynamic f_get_dw_actionpane('d_action_edit',ldw_actionpane) = 1 then
			if ldw_actionpane.dynamic f_is_button_active('b_save') then
				lw_parent.dynamic event e_save( )
			elseif  ldw_actionpane.dynamic f_is_button_active('b_saveclose') then
				lw_parent.dynamic event e_saveclose( )
			end if
		end if
	end if
	return 1
elseif key=keyM! and keyflags = 2 then
	if this.f_getparentwindow(lw_parent) = 1 then
		if lw_parent.dynamic f_get_dw_actionpane('d_action_edit',ldw_actionpane) = 1 then
			if ldw_actionpane.dynamic f_is_button_active('b_modify') then
				lw_parent.dynamic event e_modify( )
			end if
		end if
	end if
	return 1
elseif key=keyN! and keyflags = 2 then
	if this.accepttext( ) <> 1 then return 1
	if this.f_getparentwindow(lw_parent) = 1 then
		if lw_parent.dynamic f_get_dw_actionpane('d_action_edit',ldw_actionpane) = 1 then
			if ldw_actionpane.dynamic f_is_button_active('b_add') then
				lw_parent.dynamic event e_add( )
			elseif  ldw_actionpane.dynamic f_is_button_active('b_add_multi') then
				lw_parent.dynamic event e_add( )
			end if
		end if
	end if
	return	 1
elseif key=keyI! and keyflags = 2 then
	if this.accepttext( ) <> 1 then return 1
	if this.f_getparentwindow(lw_parent) = 1 then
		if lw_parent.dynamic f_get_dw_actionpane('d_action_edit',ldw_actionpane) = 1 then
			if ldw_actionpane.dynamic f_is_button_active('b_insert') then
				lw_parent.dynamic event e_insert( )
			end if
		end if
	end if
	return	 1
elseif key=keyD! and keyflags = 2 then
	if this.f_getparentwindow(lw_parent) = 1 then
		if lw_parent.dynamic f_get_dw_actionpane('d_action_edit',ldw_actionpane) = 1 then
			if ldw_actionpane.dynamic f_is_button_active('b_delete') then
				lw_parent.dynamic event e_delete( )
			end if
		end if
	end if
	return	
elseif key=keyF! and keyflags = 2 then
	if this.f_getparentwindow(lw_parent) = 1 then
		if lw_parent.dynamic f_get_dw_actionpane('d_action_edit',ldw_actionpane) = 1 then
			if ldw_actionpane.dynamic f_is_button_active('b_query') then
				lw_parent.dynamic event e_query( )
			end if
		end if
	end if
	return 1
elseif key=keyX! and keyflags = 2 then
	if this.f_getparentwindow(lw_parent) = 1 then
		if lw_parent.dynamic f_get_dw_actionpane('d_action_edit',ldw_actionpane) = 1 then
			if ldw_actionpane.dynamic f_is_button_active('b_exec_query') then
				lw_parent.dynamic event e_exec_query( )
			end if
		end if
	end if
	return	 1	
elseif key=keyF5! then
	if this.f_getparentwindow(lw_parent) = 1 then
		if lw_parent.dynamic f_get_dw_actionpane('d_action_edit',ldw_actionpane) = 1 then
			if ldw_actionpane.dynamic f_is_button_active('b_refresh') then
				lw_parent.dynamic event e_refresh( )
			end if
		end if
	end if
	return	 1	
elseif  key = keyK! and keyflags =  2 and this.ib_editing  then
	ls_name = this.getcolumnname( )
	IF this.getrow( ) > 1 THEN
		this.settext( string(this.f_getitemany(this.getrow( ) - 1, ls_name)) )
	END IF
elseif key = keyT! and keyflags =  2 and this.ib_editing  then
	IF this.getrow( ) > 1 THEN
		ls_name = this.getcolumnname( )
		ls_data = string(this.f_getitemany(this.getrow( ) - 1, ls_name))
		this.settext(ls_data)
		ib_uprow_copy = true
		this.accepttext( )		
		ib_uprow_copy = false
		this.f_getparentwindow(lw_parent)
		lpo_handling = lw_parent.dynamic f_get_obj_handling()			
		ls_coltype = this.describe(ls_name +'.coltype' )
		li_rtn = lpo_handling.idwsetup_initial.f_get_dwdatatype_string(ls_name , ls_coltype,this, ls_dwdatatype)
		if (ls_dwdatatype = 'dwo' or ls_dwdatatype = 'valueset') then	
			this.f_update_column_4_all_row(ls_name , this.getrow())
			lpo_handling.idwsetup_initial.iaa_rtn_data[] = laa_empty[]
			lpo_handling.idwsetup_initial.ias_rtn_data[] = las_empty[]					
		else
			this.f_update_column_4_all_row( ls_name, this.getrow(),ls_data)
		end if
		
	end if
elseif key = KeyEscape! then
	this.f_getparentwindow(lw_parent)
	if this.ib_editing then
		lpo_handling = lw_parent.f_get_obj_handling( )
		if lpo_handling.f_get_ib_changed_dwo_4edit( ) then
			lw_parent.dynamic event e_closeedit( )
		else
			close (lw_parent)
		end if
	else
		close (lw_parent)
	end if	
	
elseif key=keyV! and keyflags = 2 then
	//-- copy  dán từ excel--//
	if this.f_isgrid( )  and  (this.f_get_ib_editing( ) or this.f_get_ib_keyboardlocked( ) = false ) then //
//		if this.f_get_ib_editing( ) = false and this.f_get_ib_keyboardlocked( ) then
//			this.f_set_editable_property( true)
//		end if
		this.f_getparentwindow(lw_parent)
		lpo_handling = lw_parent.dynamic f_get_obj_handling()
		if (this.f_get_ib_detail( ) = false and this.f_get_ib_master( ) = false) or this.f_get_ib_detail( ) or lpo_handling.f_is_changed_dwo_4edit( ) = false then
			ls_clipboard = Clipboard()
			if pos(ls_clipboard, char(9) ) <  lastpos(ls_clipboard, char(9) ) or pos(ls_clipboard, char(10) ) <  lastpos(ls_clipboard, char(10) ) then
				ldw_handle = this
				ldw_handle.ib_excel_copying = true
				connect using lw_parent.it_transaction;
				lbo_inst.f_importclipboard_dw_ex( lw_parent.it_transaction, ldw_handle, ldw_handle.getrow( ) , ldw_handle.getcolumnname( ))	
				disconnect using lw_parent.it_transaction;
				ldw_handle.ib_excel_copying = false
			end if
		end if
//		if this.f_get_ib_editing( ) = false and this.f_get_ib_keyboardlocked( )  then
//			this.f_set_editable_property( false)
//		end if
		
	end if
elseif key=keyZ! and keyflags = 2 then
	ls_name = this.getcolumnname( )
	la_data = this.f_getitemany( this.getrow(), ls_name, primary!, true)
	if isnull(la_data) then 
		this.settext( '')
	else
		this.settext( string(la_data))
	end if
	this.accepttext( )
elseif key=keyF3! then
	if this.f_getparentwindow(lw_parent) = 1 then		
		if lw_parent.f_is_filter_on( ) then
			lw_parent.dw_filter.setfocus( )
		end if
	end if
end if
end event

event e_vscroll;call super::e_vscroll;window					lw_display
s_object_display		lod_handle
datawindow				ldw_requester
int							li_rtn

if not this.f_isgrid( ) then
	this.f_getparentwindow( lw_display)
	lod_handle = lw_display.dynamic f_get_obj_handling()
	if isvalid(lod_handle) then
		ldw_requester = this
		li_rtn = this.f_send_message_to_object( ldw_requester,'e_vscroll')
		if li_rtn = 0 then return 0
		if lod_handle.classname( ) = 'b_view' then return 0
		return li_rtn
	end if
end if

		
		
end event

event clicked;call super::clicked;string 			ls_ctrl_of_pic,ls_ctrl_pic_name
string 			ls_file_name,ls_path,ls_default_directory
int					li_file,li_rtn, li_x, li_width
blob				lblb_logo
string				ls_coltype,ls_band, ls_filetype, ls_pic_ref_table, ls_pic_ref_field, ls_pic_ref_colname, ls_pic_name
long				ll_row
double			ldb_pic_ref_id
s_w_main				lw_parent
s_object_display	lod_handling
t_transaction		lt_transaction

this.ib_dropdowning= false

ls_ctrl_pic_name = 'p_logo'
this.setredraw( false)
if this.describe(ls_ctrl_pic_name+".X") <> "!" then
	ls_ctrl_of_pic = dwo.name
	if ls_ctrl_of_pic = 'add_pic' then
		ls_default_directory = GetCurrentDirectory ( )
		li_rtn = GetFileOpenName("Select File",ls_path, ls_file_name, "jpg","Graphic Files (*.bmp;*.gif;*.jpg;*.jpeg;*.png),*.bmp;*.gif;*.jpg;*.jpeg;*.png")
		if li_rtn = 0 or li_rtn = -1 then return 
		li_file = FileOpen(ls_path, StreamMode!, Read!, LockWrite!, Append!)
		FileReadEx(li_file,lblb_logo)
		FileClose(li_file)
		ChangeDirectory(ls_default_directory)
		ls_filetype = mid(ls_file_name,pos(ls_file_name,'.'))
		this.f_update_pic_ex( lblb_logo, ls_ctrl_pic_name, ls_path,ls_filetype, row )
	elseif ls_ctrl_of_pic = 'remove_pic' then		
		//-- xoá file ở ngoài thư mục Pics néu có --//
		this.modify( ls_ctrl_pic_name + '.filename =""')
		this.f_getparentwindow( lw_parent)
		lod_handling = lw_parent.f_get_obj_handling( )
		this.f_get_data_pic( lod_handling, ls_pic_ref_table, ls_pic_ref_field, ls_pic_ref_colname, ls_ctrl_pic_name)
		ldb_pic_ref_id = this.getitemnumber( row, ls_pic_ref_field)
		this.f_remove_pic_file_ex( ls_pic_ref_table, ls_pic_ref_field, ls_pic_ref_colname, ldb_pic_ref_id)	
		this.modify( ls_ctrl_pic_name + '.filename =""')
	
	end if
end if

if this.ib_editing or not this.ib_keyboardlocked then
	//-- open calendar --//
	if this.f_isgrid( ) then
		ls_coltype = this.describe( dwo.name+'.coltype')
		if ls_coltype = 'datetime' then
			ls_coltype = this.describe( dwo.name+'.tag')			
			li_x =  integer(this.describe( dwo.name+'.x'))
			li_width =  integer(this.describe( dwo.name+'.width'))	
			if li_width+ li_x -  this.il_old_horzscrollpos -  PixelsToUnits ( xpos, XPixelsToUnits! ) <= 105 and this.describe( dwo.name+'.protect') = '0' then
				this.f_calendar_ex( dwo.name, ls_coltype)
			end if			
		end if
		
		if dwo.name = 'gutter' and this.getrow( ) = this.rowcount( ) and this.describe("p_add.x") <> '!' then
			if this.accepttext( ) = -1 then return -1
			this.setitem( row, 'gutter', 'N')
			this.f_getparentwindow( lw_parent)
			lw_parent.event e_add( )
//			lw_parent.f_get_transaction( lt_transaction )
//			connect using lt_transaction;
//			this.event e_addrow( )
//			disconnect using lt_transaction;
			
		end if
	elseif left(dwo.name,10) = 'b_calendar' then
		ls_coltype = this.describe( mid(dwo.name,12)+'.tag')
		this.f_calendar_ex( mid(dwo.name,12), ls_coltype)
	end if
	//-- open structure --//
	if this.f_isgrid( ) then
		if this.describe("b_struct_"+dwo.name+".x") <> '!' then
			 li_x =  integer(this.describe( dwo.name+'.x'))
			 li_width =  integer(this.describe( dwo.name+'.width'))		
			 if li_width + li_x -  PixelsToUnits ( xpos, XPixelsToUnits! ) <= 105 then
				this.event e_popup_data( dwo.name,'u_structure')
			end if		 
		end if
	elseif left(dwo.name,8) = 'b_struct' then
		this.event e_popup_data( mid(dwo.name,10),'u_structure')
	end if
end if
if this.Describe(dwo.name+".Type") = 'column' then
	this.is_focus_colname =  dwo.name
	this.setcolumn( is_focus_colname)
	if il_old_horzscrollpos <>this.il_horzscrollpos then
		ls_default_directory = this.modify( "DataWindow.HorizontalScrollPosition ="+string( this.il_old_horzscrollpos ))
		this.il_horzscrollpos = this.il_old_horzscrollpos
	end if
end if
this.setredraw( true)
//-- open drilldown object --//
ll_row = row
if ll_row = 0 then //-- trường hợp click vào group của báo cáo --//
	ls_band = this.getbandatpointer( )
	ls_band = mid(ls_band,lastpos(ls_band,"~t",len(ls_band)))
	ll_row = long(ls_band)
end if
this.post f_open_drilldown(  dwo.name,ll_row )


end event

event dragdrop;call super::dragdrop;t_dw_mpl	ldw_handling,ldw_source


ldw_handling = this
ldw_source = source
return this.f_send_message_to_object( ldw_handling,ldw_source,row, dwo, "dragdrop")

end event

event e_dwnlbuttonup;call super::e_dwnlbuttonup;t_dw_mpl 	ldw_handling

ldw_handling = this
return this.f_send_message_to_object( xpos, ypos, row, ldw_handling, 'e_dwnlbuttonup')
end event

event e_getfocus;call super::e_getfocus;
//-------------------------------------------------------------//
//-- kiểm tra điều kiện cập nhật dữ liệu từ dwo khác --//
//-----------------------------------------------------------//

//-- Chỉ cập nhật khi đang editing --//
if this.ib_editing then
	//-- Chỉ cập nhật khi dw_focus có khai báo s_col_target --//
	if is_dwo_source<>'' and is_col_source<>'' and is_col_target <> '' then
		if this.rowcount( ) > 0 then
			if this.f_set_target_data( ) = -1 then return 1
		end if
	end if	
end if

return 0
end event

event dragenter;call super::dragenter;t_dw_mpl	ldw_handling,ldw_source
dwobject		ldwo

ldw_handling = this
ldw_source = source
return this.f_send_message_to_object( ldw_handling,ldw_source,0, ldwo, "dragenter")

end event

event dragleave;call super::dragleave;t_dw_mpl	ldw_handling,ldw_source
dwobject		ldwo

ldw_handling = this
ldw_source = source
return this.f_send_message_to_object( ldw_handling,ldw_source,0, ldwo, "dragleave")
end event

event dragwithin;call super::dragwithin;t_dw_mpl	ldw_handling,ldw_source


ldw_handling = this
ldw_source = source
return this.f_send_message_to_object( ldw_handling,ldw_source,row, dwo, "dragwithin")

end event

event e_command;call super::e_command;
      CHOOSE CASE notificationcode
          CASE 2048 // or 2049
                  // DDDW RowFocusChanged
          CASE 1281
                  // DDDW Clicked
				this.ib_dropdowning = false
          CASE 2314
                  // DDDW RightMouseButtonDown
          CASE 2313
                  // DDDW LeftMouseButtonUp
          CASE 2317
                  // DDDW VScroll
          CASE 2318
                  // DDDW HScroll
          CASE 2311
                  // DDDW Mouse Move
          CASE 769
                  // DDDW Retrieve End
        END CHOOSE
end event

