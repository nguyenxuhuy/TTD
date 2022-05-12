$PBExportHeader$s_object_display.sru
$PBExportComments$Đối tượng chung cho tất cả các đối tượng của business
forward
global type s_object_display from s_object
end type
end forward

global type s_object_display from s_object
event type integer e_tv_selectionchanged ( ref treeview rpo_tv )
event type integer e_rbuttonclicked ( ref window r_window )
event type integer e_window_e_preopen ( )
event type integer e_window_e_postopen ( )
event type integer e_window_closequery ( )
event type integer e_window ( string vs_message )
event type integer e_treeview ( ref powerobject rpo_handling,  string vs_message )
event type integer e_dw_e_preretrieve ( ref datawindow rpo_dw )
event type integer e_dw_e_postinsertrow ( ref datawindow rpo_dw,  long vl_currentrow )
event type integer e_dw_e_preinsertrow ( ref datawindow rpo_dw )
event type integer e_dw_e_itemchanged ( ref datawindow rpo_dw,  long vl_currentrow,  string vs_colname,  string vs_editdata )
event type integer e_datawindow ( ref powerobject rpo_dw,  string vs_message )
event type integer e_dw_rowfocuschanged ( ref datawindow rpo_dw,  long vl_currentrow )
event type integer e_dw_updatestart ( ref datawindow rdw_requester )
event type integer e_dw_e_postdelete ( ref datawindow rpo_dw,  long vl_currentrow )
event type integer e_tv_rightclicked ( ref treeview rtv_handling,  long vl_clicked_handle )
event type integer e_pm_popup ( ref t_m_popup rm_popup )
event type integer e_pm_clicked ( ref t_m_popup rm_popup,  string vs_clickedmenu )
event type integer e_popmenu ( ref powerobject rpo_requester,  string vs_message )
event type integer e_window_e_postdelete ( )
event type integer e_window_e_postsave ( integer vi_save_return )
event type integer e_window_e_postmodify ( )
event type integer e_dw_e_postmodifyrow ( ref datawindow rpo_dw )
event type integer e_tv_selectionchanging ( ref treeview rpo_tv )
event type integer e_window_e_postadd ( )
event type integer e_dw_e_rollback_modify ( ref datawindow rpo_dw )
event type integer e_dw_e_rollback_save ( ref datawindow rpo_dw )
event type integer e_dw_rowfocuschanging ( ref datawindow rpo_dw,  long vl_currentrow,  long vl_newrow )
event type integer e_dw_e_postsave ( ref datawindow rpo_dw )
event type integer e_dw_e_postretrieve ( ref datawindow rpo_dw,  long vl_rowcount )
event type integer e_dw_e_refresh ( ref datawindow rpo_dw )
event type integer e_window_e_refresh ( )
event type integer e_action ( string vs_action )
event type integer e_action_ctrl_e_postmodifyrow ( )
event type integer e_action_ctrl_getfocus ( )
event type integer e_action_ctrl_retrieveend ( )
event type integer e_action_ctrl_updateend ( )
event type integer e_dropdownlistbox ( ref powerobject rpo_handling,  long vl_value,  string vs_message )
event type integer e_ddlb_selectionchanged ( ref dropdownlistbox rddlb_handling,  long vl_index )
event e_window_e_okclose ( )
event type integer e_window_e_close ( )
event type integer e_dw_e_presave ( ref datawindow rpo_dw )
event type integer e_dw_clicked ( ref datawindow rdw_handling,  long vl_currentrow,  string vs_colname )
event type integer e_dw_rbuttondown ( ref datawindow rpo_dw )
event type integer e_window_e_view_report ( )
event type integer e_cbx_clicked ( ref checkbox rcbx_handling )
event type integer e_htb_moved ( ref htrackbar rhtb_handling )
event type integer e_checkbox ( ref powerobject rcbx_handling,  string vs_message )
event type integer e_htrackbar ( ref powerobject rhtb_handling,  string vs_message )
event type integer e_action_ctrl_bttn ( )
event type integer e_dw_e_modifyrow ( ref datawindow rpo_dw )
event type integer e_tab ( ref powerobject rpo_handling,  string vs_message )
event type integer e_tab_selectionchanged ( ref t_t rtab_handle )
event type integer e_singlelineedit ( ref powerobject rsgle_handling,  string vs_message )
event type integer e_sgle_modified ( ref singlelineedit rsgle_handling )
event type integer e_window_open ( )
event type integer e_window_e_postopen_child ( )
event type integer e_dw_getfocus ( ref t_dw_mpl rdw_handling )
event type integer e_dw_e_save ( ref datawindow rpo_dw )
event type integer e_dw_updateend ( ref datawindow rdw_requester )
event type integer e_window_e_copy_form ( )
event type integer e_dw_e_vscroll ( ref datawindow rpo_dw )
event type integer e_window_e_copy_to ( )
event type integer e_window_e_view ( ref s_object_display rod_relation,  ref string rs_dwo_view )
event type integer e_window_e_post ( )
event type integer e_window_e_unpost ( )
event type integer e_item_barcode ( string vs_btn_name )
event type integer e_window_e_change_object ( )
event type integer e_window_e_allocate ( )
event type integer e_window_e_amortize ( )
event type integer e_window_e_collect ( )
event type integer e_window_e_filter_resize ( )
event type integer e_window_e_filteroff ( )
event type integer e_window_e_ledger_transfer ( )
event type integer e_window_e_cancel ( )
event type integer e_dw_e_preitemchanged ( ref datawindow rpo_dw,  long vl_currentrow,  string vs_colname,  string vs_editdata )
event type integer e_window_e_send_2_approve ( )
event type integer e_window_e_settlement ( )
event type integer e_wimdow_e_view_settlement ( )
event type integer e_window_e_cancel_settlement ( )
event type integer e_dw_dwnkey ( ref datawindow rpo_dw,  keycode v_keycode,  integer v_keyflags )
event type integer e_window_e_fiscal_year ( )
event type integer e_window_e_prepost ( )
event type integer e_window_e_preunpost ( )
event type integer e_widnow_e_preaccounting ( )
event type integer e_widnow_e_postaccounting ( )
event type integer e_dw_e_predelete ( ref datawindow rpo_dw,  long vl_currentrow )
event type integer e_window_e_approved ( )
event type integer e_dw_e_doubleclicked ( ref datawindow rdw_handling,  long vl_row,  string vs_colname )
event type integer e_dw_dragdrop ( ref datawindow rdw_handling,  ref datawindow vdw_source,  long vl_row,  dwobject dow )
event type integer e_window_e_sendmail ( )
event type integer e_dw_e_mousemove ( integer vi_xpos,  integer vi_ypos,  long vl_row,  ref datawindow rdw_handling )
event type integer e_dw_e_dwnlbuttonup ( integer vi_xpos,  integer vi_ypos,  long vl_row,  ref datawindow rdw_handling )
event type integer e_action_attach ( )
event type integer e_window_e_importfile ( )
event type integer e_window_e_reject ( )
event type integer e_window_e_request_2_change ( )
event type integer e_window_e_completed ( )
event type integer e_window_e_lose ( )
event type integer e_window_e_postcompleted ( )
event type integer e_statuschanged ( string vs_post_status,  double vdb_doc_id,  string vs_doctype,  boolean vb_post )
event type integer e_dw_e_preretrieve_start ( ref datawindow rpo_dw )
event type integer e_dw_e_postitemchanged ( ref datawindow rpo_dw,  long vl_currentrow,  string vs_colname,  string vs_editdata )
event type integer e_dw_e_beforeitemchanged ( ref datawindow rpo_dw,  long vl_currentrow,  string vs_colname,  string vs_editdata )
event type integer e_dw_buttonclicked ( ref datawindow rdw_handling,  long vl_currentrow,  string vs_colname )
event type integer e_window_e_postcopy ( )
event type integer e_window_e_afterpost ( )
event e_czkem_onatttransactionex ( string enrollnumber,  long isinvalid,  long attstate,  long verifymethod,  long year,  long month,  long day,  long hour,  long minute,  long second,  string vs_zkem_name )
event e_czkem_onhidnum ( )
event e_czkem_onverify ( )
event type integer e_dw_e_preprint ( ref datawindow rpo_dw )
event type integer e_dw_e_postprint ( ref datawindow rpo_dw )
event type integer e_statuschanged_multi ( string vs_post_status,  double vdb_doc_id,  string vs_doctype,  boolean vb_post,  ref t_transaction rt_transaction )
event type integer e_window_activate ( )
event type integer e_window_e_precopy_to ( string vs_objectname_to )
event e_window_e_firstpage ( )
event e_window_e_previouspage ( )
event e_window_e_nextpage ( )
event e_window_e_lastpage ( )
event type integer e_window_e_precopy_from ( )
event type integer e_window_e_saveclose ( )
event type integer e_dw_e_predelete_start ( ref datawindow rpo_dw,  long vl_currentrow )
event type integer e_dw_dragwithin ( ref datawindow rdw_handling,  ref datawindow vdw_source,  long vl_row,  dwobject dow )
event type integer e_dw_dragenter ( ref datawindow rdw_handling,  ref datawindow vdw_source )
event type integer e_dw_dragleave ( ref datawindow rdw_handling,  ref datawindow vdw_source )
event type integer e_window_close ( )
event type integer e_window_e_presave ( )
event type integer e_dw_e_itemfocuschanged ( datawindow rpo_dw,  long vl_currentrow,  string vs_colname )
event type integer e_window_e_detail_start ( )
event type integer e_window_e_saveas ( ref t_dw_mpl rdw_forcus )
event type integer e_window_e_postcopy_to ( string vs_objectname_to,  double vdb_t_doc_id,  s_str_dwo_related vastr_dwo_related[] )
end type
global s_object_display s_object_display

type variables

t_ds_db					ids_book, ids_filter_data
c_ds_usr_profile 		ids_user_profile
c_dwsetup_initial		idwsetup_initial	
t_transaction			it_transaction
s_str_drilldown_data 	istr_drilldown

w_xls_service_progress iw_progress

boolean					ib_copying,ib_copy_tax, ib_querymode_on,ib_copy_line, ib_allocating, ib_amortizing, ib_collecting, ib_tax_error
int							ii_idle_time, ii_tp_index
string						is_object_title,is_exrate_type, is_dwmain_filter,is_copy_type, is_dwo_have_valueset, is_copy_stage
string						is_win_grp, is_sheet_type, is_win_name, is_enable_buttons

protected:
string			is_m_popup, is_menu_id, is_menu_code, is_ruleobject_column
string			is_dso_dw_properties, is_display_model

boolean		ib_filter = true, ib_refresh = true , ib_trace = true
boolean		ib_editing = false, ib_keyboardlocked = true, ib_changed_dwo_4edit
boolean 		ib_query = true, ib_update = true , ib_insert = true, ib_delete= true, ib_print, ib_excel
boolean 		ib_query_ctx= true, ib_update_ctx = true, ib_insert_ctx = true, ib_delete_ctx = true, ib_trace_ctx = true
boolean		ib_display_text
int				ii_wdisplay_width, ii_wdisplay_height
double		idb_main_ID

string 			is_dwcolumn_books[],is_criteria_of_dwcolumn_books[]

s_w_main					iw_display
s_object_display			ipo_related[], ipo_main
s_str_dwo					istr_dwo[]
s_str_dwo_related			istr_dwo_related[], istr_data_related[]
s_str_unit					istr_unit[]
s_str_streamvalue			istr_streamvalue[]
s_str_dwo_tabpage		iastr_dwo_tabpage[]
s_str_actionpane			istr_actionpane[]
s_str_tvo						istr_tvo[]
c_unit_instance				ic_unit_instance
s_tp_actionpane			is_tp_actionpane[]
s_tp_multi					ia_tabpage[]
s_str_report					istr_report
s_object_instantiate		ipo_tv
t_ds_db						ids_data[]

t_ds_db_ws 			ids_focus, iads_detail[], iads_share[],iads_none_md[], ids_data_ws[]
s_str_ds_md			iastr_ds_md[]
s_str_ds_ms			iastr_ds_ms[]


end variables

forward prototypes
public function long f_insert_environment_v ()
public function string f_get_path_classname (powerobject rpo_object)
public function boolean f_is_code_existed (string vs_code)
public function integer f_get_dwo (ref s_str_dwo rc_s_dwo[])
public function string f_get_tv_label ()
public function powerobject f_get_tv_data ()
public function integer f_get_tv_pictureindex ()
public function integer f_get_tv_selectedpictureindex ()
public function string f_get_tv_parentstring ()
public function string f_get_tv_findstring ()
public function boolean f_get_ib_keyboardlocked ()
public subroutine f_set_ib_editing (boolean vb_editing)
public function boolean f_get_ib_editing ()
public function string f_get_main_dwo ()
public function string f_get_main_dwo_for_edit ()
public function integer f_set_tv_data_structure (double vdb_id)
public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[])
public function integer f_handle_message (ref powerobject rpo_requester, ref string rs_message)
public function integer f_handle_message (ref datawindow rdw_requester, ref long vl_currentrow, string vs_colname, string vs_editdata, string vs_message)
public function integer f_handle_message (ref treeview rtv_requester, long vl_clicked_handle, string vs_message)
public function integer f_set_menu_id (string vs_menu_id)
public function string f_get_menu_id ()
public function string f_get_enter_colname (string vs_dwo)
public function integer f_upd_sort_number (ref datawindow rdw_requester, string vs_sort_colname, string vs_retrieve_colname, any va_where_val)
public function integer f_handle_message (ref datawindow rdw_requester, long vl_currentrow, long vl_newrow, string vs_message)
public function integer f_get_tp_actionpane (ref s_tp_actionpane rtp_actionpane[])
public function integer f_set_wdisplay (ref window rw_display)
public function any f_get_tv_sort_data ()
public function boolean f_is_changed_dwo_4edit ()
public function integer f_get_actionpane_structure (ref s_str_actionpane rstr_actionpane[])
public function integer f_create_actionpane (t_t rtb_action)
public function string f_get_title ()
public function integer f_set_actionpane_structure (s_str_actionpane vstr_actionpane[])
public function integer f_handle_message (ref datawindow rdw_requester, long vl_value, string vs_message)
public function integer f_create_tabpage ()
public function string f_get_display_model ()
public function integer f_set_related_object (powerobject vpo_related)
public function integer f_get_related_object (ref powerobject rpo_related[])
public subroutine f_set_dwo_related ()
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
public function integer f_get_dwo_related (ref s_str_dwo_related rstr_dwo_related[])
public function integer f_set_main_id (double vdb_id)
public function double f_get_main_id ()
public function integer f_set_main_object (powerobject vpo_main_objname)
public function integer f_set_tv_structure (long vl_row)
public function integer f_set_tv_structure (double vdb_up_id, string vs_label)
public function integer f_set_tv_structure (double vdb_id)
public function integer f_set_tv_structure (string vs_label_col)
public function string f_get_relatedtext ()
public function integer f_set_dwo_structure (s_str_dwo vstr_dwo[])
public function integer f_set_related_object (powerobject vpo_related[])
public function integer f_get_dwo_tabpage (ref s_str_dwo_tabpage rstr_dwo_tabpage[])
public function boolean f_get_ib_changed_dwo_4edit ()
public function long f_filter_criteria_of_book (string vs_book_id)
public function integer f_set_criteria_of_book ()
public function integer f_set_data_related (s_str_dwo_related vstr_data_related[])
public function integer f_get_criteria_of_book (ref string rs_dwcolumns[], ref string rs_criteria_of_dwcolumns[])
public function integer f_book (double vdb_book_id, boolean vb_modify)
public function integer f_get_data_related (ref s_str_dwo_related rstr_data_related[])
public subroutine f_set_oringinal_size (integer vi_width, integer vi_height)
public function string f_get_object_table ()
public function string f_get_ruleobject_column ()
public function boolean f_get_ib_display_text ()
public function integer f_get_data_related (string vs_related_objname, ref s_str_dwo_related rstr_data_related[])
public function integer f_find_related_object (ref s_object_display rpo_found, string vs_objname, integer vi_tp_index)
public function integer f_renew_tabidx_related_object (string vs_objname, integer vi_old_tp_index, integer vi_new_tp_index)
public function integer f_renew_tabidx_object (string vs_objname, integer vi_old_tp_index, integer vi_new_tp_index)
public function integer f_renew_tabidx_main_object (ref s_object_display rpo_main, string vs_objname, integer vi_old_tp_index, integer vi_new_tp_index)
public subroutine f_set_str_unit ()
public function long f_get_str_unit (ref s_str_unit rs_str_unit[])
public function integer f_get_setup_objectname (ref string rs_objectname)
public function integer f_get_data_related (datastore vds_dwsetup, ref s_str_dwo_related rstr_data_related[], ref s_object_display rod_handling)
public function datastore f_get_ids_policy_rule ()
public function datastore f_get_ids_policy_security ()
public function integer f_init_policy_datastore ()
public function window f_get_wdisplay ()
public function integer f_ctrl_actionbuttons (powerobject rpo_control)
public function integer f_display_on_tv (t_tv r_tv, any va_retrieve_arg[5])
public function integer f_display_on_tv (t_tv r_tv, any va_retrieve_arg[5], boolean vb_delete)
public function integer f_insert_tv_item (double vdb_id, t_tv r_tv)
public function integer f_insert_tv_item (powerobject vpo_tv, t_tv r_tv)
public function integer f_set_popupmenu (ref t_m_popup rm_menu, string vs_menu_name)
public function integer f_set_menu_code (string vs_menu_code)
public function string f_get_menu_code ()
public function integer f_get_str_report (ref s_str_report rs_str_report)
public function integer f_close_object (string vs_objname, integer vi_tap_index)
public function integer f_handle_message (ref datawindow rdw_requester, ref long vl_currentrow, string vs_colname, string vs_message)
public subroutine f_set_actionpane (s_str_actionpane vstr_actionpane[])
public function decimal f_get_exchange_rate (string vs_cur_code, date vd_trans_date)
public function boolean f_get_ib_copying ()
public subroutine f_set_ib_copying (boolean vb_copying)
public function integer f_get_colname_exchange_rate (datawindow vdw_object, string vs_colname_object, ref string rs_colname_cur, ref string rs_colname_exc)
public function integer f_delete_matching (datawindow vdw_deleting, long vl_del_row)
public function datawindow f_get_dw_print ()
public function integer f_find_main_object (ref s_object_display rpo_found, string vs_objname, integer vi_tp_index)
public function integer f_find_object (ref s_object_display rpo_found, string vs_objname, integer vi_tp_index)
public function s_object_display f_get_main_object ()
public function integer f_set_suspend_data (t_dw_mpl vdw_suspend)
public function integer f_set_suspend_data_tab (t_dw_mpl vdw_suspend)
public subroutine f_set_str_streamvalue ()
public function long f_get_str_streamvalue (ref s_str_streamvalue rs_str_streamvalue[])
public function integer f_resize_fixedpart_grid ()
public function integer f_resize_fixedpart_form ()
public function integer f_reset_fixedpart_grid ()
public function t_ds_db f_get_ids_matching ()
public function integer f_get_currency_exrate_of_doc (ref double rdb_currency_id, ref decimal rdc_exrate)
public function boolean f_chk_qty_matching (s_str_dwo_related vastr_dwo_related[])
public subroutine f_set_istr_actionpane (s_str_actionpane vstr_actionpane[])
public function integer f_get_istr_actionpane (ref s_str_actionpane rstr_actionpane[])
public subroutine f_get_resize_wdisplay (ref integer ri_width, ref integer ri_height)
public subroutine f_set_resize_wdisplay (integer vi_width, integer vi_height)
public function integer f_get_dw_policy_attr (t_dw vdw_handle, ref s_str_policy_attr rstr_rule_attr[], ref s_str_policy_attr rstr_security_attr[], ref string rsa_attr_name[])
public function integer f_update_amt_ex_markup_comm_disc (datawindow vdw_line, double vdb_currency_id, integer vi_tax_percent, string vs_include_tax_yn, decimal vdc_exc)
public function integer f_update_tax (datawindow vdw_line, string vs_colname_amount, string vs_colname_amount_ex_tax, decimal vdc_exc_rate, string vs_include_tax_yn)
public function integer f_round (ref datawindow rpo_dw, long vl_currentrow, string vs_colname, string vs_editdata)
public function integer f_update_matching (datawindow vdw_modifing, long vl_row_editing, dwbuffer v_dwbuffer)
public function boolean f_is_auto_appr ()
public function string f_get_rule_dwo_constraint ()
public function string f_get_security_dwo_constraint ()
public function integer f_handle_message (ref datawindow rdw_handling, ref datawindow vdw_source, long vl_row, dwobject dwo, string vs_message)
public function integer f_handle_message (integer vi_xpos, integer vi_ypos, long vl_row, ref datawindow rdw_handling, string vs_message)
public function integer f_set_dwo_structure_tabpage (s_str_dwo_tabpage vastr_dwo_tabpage[])
public function integer f_update_cogs (date vd_sdate, date vd_edate, string vs_warehouse_yn, string vs_spec_yn, string vs_lot_yn, string vs_serial_yn, string vs_loc_yn, string vs_update_method, double vdb_object_ref_id, string vs_object_ref_table)
public function integer f_get_item_open_balance (date vd_balance_date, s_str_item_balance vstr_item_balance, ref double rdb_open_qty, ref double rdb_open_value, ref double rdb_avg_price)
public function integer f_update_cogs_avg (date vd_sdate, date vd_edate, string vs_update_method, string vs_cost_method, s_str_item_balance vstr_item_balance, double vdb_object_ref_id, string vs_object_ref_table)
public function integer f_get_item_in_cost (date vd_sdate, date vd_edate, s_str_item_balance vstr_item_balance, double vdb_rtn_value_adj, t_ds_db rds_cust_rtn_inperiod, ref double rdb_in_qty, ref double rdb_in_value, double rdb_rtn_qty_inperiod)
public function decimal f_calculation_tax (double vdc_amount, double vdc_amount_ex_tax, decimal vdc_price, integer vdc_qty, decimal vdc_exc_rate, integer vi_tax_percent, string vs_include_tax_yn)
public subroutine f_caculation_ex_tax (double vdc_qty, double vdc_price, double vdc_act_price, integer vi_tax_percent, string vs_include_tax_yn, double vdc_exc, double vdb_currency_id, ref double rdc_price_ex, ref double rdc_act_price_ex, ref double rdc_amt_ex, ref double rdc_act_amt_ex, ref double rdc_base_amt_ex, ref double rdc_act_base_amt_ex)
public subroutine f_caculation_comm (double vdc_act_amt_ex_tax, integer vi_comm_pct, double vdb_currency_id, ref double rdc_comm_amt)
public subroutine f_caculation_disc (double vdc_act_amt_ex_tax, integer vi_disc_pct, double vdb_currency_id, ref double rdc_disc_amt)
public subroutine f_caculation_markup (double vdc_amt_ex_tax, double vdc_act_amt_ex_tax, integer vi_markup_pct, double vdb_currency_id, ref double rdc_markup_amt, ref double rdc_markup_return)
public function t_ds_db_ws f_get_ds (string vs_dwo)
public function integer f_init_ds_data ()
public function integer f_arrange_dwdetail (t_ds_db_ws vds_detail[])
public function integer f_arrage_dwshared (t_ds_db_ws vds_shared[])
public function integer f_set_md_ms ()
public function integer f_connect_db ()
public function integer f_get_ds_retrieve_args (ref t_ds_db_ws rds_focus, ref any ra_args[])
public function integer f_handle_message (ref powerobject rpo_requester, long vl_value, string rs_message)
public function integer f_set_record_security_ws (t_ds_db_ws vds_handing)
public function integer f_set_record_security_ws ()
public function string f_get_json (long vl_start_row, long vl_nbr_of_row, ref string rs_json_string, string vs_username, string vs_password)
public function t_ds_db_ws f_get_dsmain ()
public function integer f_change_drilldown_rpt (s_object_display vod_object_report)
public function integer f_set_drilldown_data (s_str_drilldown_data vstr_drilldown_data)
public function integer f_set_suspend_report (t_dw_mpl vdw_suspend)
public function integer f_set_suspend_report_tab (t_dw_mpl vdw_suspend)
public subroutine f_set_ii_leftpart_width_tabpage (integer vi_tabpage_idx, integer vi_width)
public subroutine f_set_ii_midpart_width_tabpage (integer vi_tabpage_idx, integer vi_width)
public subroutine f_set_ii_fixedpart1_height_tabpage (integer vi_tabpage_idx, integer vi_height)
public subroutine f_set_ii_upperpart_height_tabpage (integer vi_tabpage_idx, integer vi_height)
public function long f_update_line_no (t_dw_mpl vdw_line, long vl_start_row, string vs_line_no_colname)
public function integer f_get_item_ds_adj (date vd_sdate, s_str_item_balance vstr_item_balance, ref t_ds_db rds_item_adj)
public function integer f_get_obj_ds_adj (date vd_sdate, double vdb_obj_id, ref t_ds_db rds_obj_adj)
public function integer f_update_item_out_cost (double vdb_avg_price, s_str_item_balance vstr_item_balance, double vdb_object_ref_id, string vs_object_ref_table, string vs_cost_method, date vd_sdate, date vd_edate, double vdb_in_qty_total, double vdb_in_amt_total, t_ds_db rds_item_adj)
public function integer f_update_item_transfer_cost (double vdb_avg_price, s_str_item_balance vstr_item_balance, double vdb_object_ref_id, string vs_object_ref_table, string vs_cost_method, date vd_sdate, date vd_edate, ref t_ds_db rds_item_adj)
public function integer f_update_item_cust_return_cost_inperiod (double vdb_avg_price, t_ds_db vds_item_cust_return, double vdb_object_ref_id, string vs_object_ref_table, string vs_cost_method, date vd_sdate, date vd_edate, ref t_ds_db rds_item_adj)
public function integer f_update_item_cust_return_cost_prior (double vdb_avg_price, s_str_item_balance vstr_item_balance, double vdb_object_ref_id, string vs_object_ref_table, string vs_cost_method, date vd_sdate, date vd_edate, ref t_ds_db rds_item_adj)
public function integer f_del_obj_adj (date vd_sdate, ref t_transaction rt_transaction)
public function integer f_del_item_adj (date vd_sdate, s_str_item_balance vstr_item_balance, ref t_transaction rt_transaction)
public function long f_update_line_no_postinsert (t_dw_mpl vdw_line, long vl_start_row, string vs_line_no_colname)
public function integer f_update_tax (datawindow vdw_line, string vs_colname_amount, string vs_colname_amount_ex_tax, decimal vdc_exc_rate, string vs_include_tax_yn, string vs_dwo_tax)
public function integer f_get_drilldown_data (string vs_object_name, string vs_dwo, string vs_colname, ref s_str_drilldown_data rstr_drilldown_data, long vl_cur_row)
public subroutine f_set_ib_refresh (boolean vb_ib_refresh)
public function boolean f_get_ib_refresh ()
public function integer f_get_doc_version (t_dw_mpl vdw_main)
public function integer f_find_related_object (ref s_object_display rpo_found, string vs_objname)
public subroutine f_set_it_transaction (t_transaction vt_transaction)
public function integer f_expand_dw (t_dw_mpl vdw_handling, string vs_name, integer vi_height)
public function integer of_set_progress_text (string vs_text)
public function integer of_show_progress (integer ai_progress, string vs_title)
public function integer f_get_drilldown_data (ref s_str_drilldown_data rstr_drilldown_data)
public function integer f_open_drilldown_rpt ()
public function integer f_insert_tv_item (powerobject vpo_tv, t_tv r_tv, long vl_parent_hdl)
public function integer f_display_on_tv_new (t_tv r_tv, any va_retrieve_arg[5])
public function integer f_init_policy_datastore_ex (ref t_transaction rt_transaction)
public function integer f_handle_message (ref datawindow rdw_requester, string vs_message, keycode v_keycode, integer v_keyflags)
public function decimal f_get_exchange_rate_ex (string vs_cur_code, date vd_trans_date)
public function integer f_update_ribbonbar (u_rbb rbb_handle)
public function integer f_ctrl_enable_button (u_rbb vrbb_handle, t_dw_mpl vdw_focus)
public function integer f_init_policy_datastore_exx (ref t_transaction rt_transaction)
end prototypes

event type integer e_tv_selectionchanged(ref treeview rpo_tv);return 0
end event

event type integer e_rbuttonclicked(ref window r_window);return 0
end event

event type integer e_window_e_preopen();/*******************************************************
Return: 
	- 0: Thực hiện retrieve cho dw_focus trong event e_postopen
	- 1: Không thực hiện retrieve cho dw_focus trong event e_postopen
------------------------------------------------------------------------------------------*/
return 0
end event

event type integer e_window_e_postopen();
//this.f_ctrl_actionbuttons( ldw_focus)
return 0
end event

event type integer e_window_closequery();if iw_display.dynamic f_update_userprofile() = -1 then
	return -1
end if
return 0
end event

event type integer e_window(string vs_message);string			ls_object_name


choose case vs_message
	case 'closequery'
		return this.event e_window_closequery()
	case 'e_postadd'
		return this.event e_window_e_postadd()	
	case 'e_postdelete'
		return this.event e_window_e_postdelete()	
	case 'e_postmodify'
		return this.event e_window_e_postmodify()	
	case 'e_postopen'
		return this.event e_window_e_postopen()	
	case 'e_postopen_child'
		return this.event e_window_e_postopen_child()			
//	case 'e_postsave'
//		return this.event e_window_e_postsave()			
	case 'e_saveclose'
		return this.event e_window_e_saveclose()				
	case 'e_preopen'
		return this.event e_window_e_preopen()	
	case 'e_refresh'
		return this.event e_window_e_refresh()		
	case 'e_okclose'
		this.event e_window_e_okclose()	
		return 0
	case 'e_close'
		return this.event e_window_e_close()	
	case 'e_view_report'
		return this.event e_window_e_view_report( )
	case 'open'
		return this.event e_window_open( )		
	case 'e_copy_form'
		return this.event e_window_e_copy_form( )
	case 'e_copy_to'
		return this.event e_window_e_copy_to( )	
	case 'e_post'
		return this.event e_window_e_post( )
	case 'e_prepost'
		return this.event e_window_e_prepost( )
	case 'e_afterpost'
		return this.event e_window_e_afterpost( )
	case 'e_unpost'
		return this.event e_window_e_unpost( )
	case 'e_preunpost'
		return this.event e_window_e_preunpost( )
	case 'e_allocate'
		return this.event e_window_e_allocate( )		
	case 'e_amortize'
		return this.event e_window_e_amortize( )		
	case 'e_collect'
		return this.event e_window_e_collect( )			
	case 'e_filter_resize'
		return this.event e_window_e_filter_resize( )				
	case 'e_filteroff'
		return this.event e_window_e_filteroff( )		
	case 'e_ledger_transfer'
		return this.event e_window_e_ledger_transfer( )
	case 'e_cancel'
		return this.event e_window_e_cancel( )	
	case 'e_settlement'
		return this.event e_window_e_settlement( )	
	case 'e_v_settlement'
		return this.event e_window_e_cancel_settlement( )
	case 'e_fiscal_year'
		return this.event e_window_e_fiscal_year( )
	case 'e_sendmail'
		return this.event e_window_e_sendmail( )
	case 'e_importfile'
		return this.event e_window_e_importfile( )
	case 'e_completed'
		return this.event e_window_e_completed()
	case 'e_postcompleted'
		return this.event e_window_e_postcompleted()
	case 'e_lose'
		return this.event e_window_e_lose()
	case 'e_approved'
		return this.event e_window_e_approved( )
	case 'e_firstpage'
		this.event e_window_e_firstpage( )	
		return 0
	case 'e_previouspage'
		this.event e_window_e_previouspage( )	
		return 0
	case 'e_nextpage'
		this.event e_window_e_nextpage( )		
		return 0
	case 'e_lastpage'
		this.event e_window_e_lastpage( )				
		return 0
end choose

end event

event type integer e_treeview(ref powerobject rpo_handling, string vs_message);treeview		ltv_handling

ltv_handling = rpo_handling
choose case vs_message
	case 'selectionchanged'
		return this.event e_tv_selectionchanged(ltv_handling )
	case 'selectionchanging'
		return this.event e_tv_selectionchanging(ltv_handling )		
end choose
return 0
end event

event type integer e_dw_e_preretrieve(ref datawindow rpo_dw);return 0
end event

event type integer e_dw_e_postinsertrow(ref datawindow rpo_dw, long vl_currentrow);
return 0
end event

event type integer e_dw_e_preinsertrow(ref datawindow rpo_dw);return 0
end event

event type integer e_dw_e_itemchanged(ref datawindow rpo_dw, long vl_currentrow, string vs_colname, string vs_editdata);long     				ll_find
t_dw_mpl			ldw_ct_form

//if AncestorReturnValue = 1 then return 1
	if mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_address' then
		if vs_colname = 'active_yn' then
			ll_find = rpo_dw.find( "active_yn = 'Y'", 1, rpo_dw.rowcount( ) )
			if ll_find > 0 then
				rpo_dw.setitem(ll_find,'active_yn','N')
			end if
		end if
	elseif pos(rpo_dw.dataobject,'d_contact_grid') > 0 then
		ldw_ct_form = iw_display.f_get_dw('d_main_contact_form' )
		//d_main_contact_form
		if vs_colname = 'main_yn' then
			ll_find = rpo_dw.find( "main_yn = 'Y'", 1, rpo_dw.rowcount( ) )
			if ll_find > 0 then
				rpo_dw.setitem(ll_find,'main_yn','N')
			end if
			ll_find = ldw_ct_form.find( "main_yn = 'Y'",1, ldw_ct_form.rowcount( ))
			if ll_find > 0 then
				ldw_ct_form.setitem(ll_find,'main_yn','N')
			end if
		end if
	end if
	return 0
end event

event type integer e_datawindow(ref powerobject rpo_dw, string vs_message);
t_dw_mpl			ldw_handling

ldw_handling = rpo_dw

choose case vs_message
	case 'e_preretrieve_start'
		return this.event e_dw_e_preretrieve_start(ldw_handling )		
	case 'e_predelete_start'
		return this.event e_dw_e_predelete_start(ldw_handling , 0)				
	case 'e_preretrieve'		
		return this.event e_dw_e_preretrieve(ldw_handling )
	case 'e_preinsertrow'
		return this.event e_dw_e_preinsertrow(ldw_handling )		
	case 'updatestart'
		return this.event e_dw_updatestart(ldw_handling )
	case 'updateend'
		return this.event e_dw_updateend(ldw_handling )		
	case 'e_modifyrow'
		return this.event e_dw_e_modifyrow(ldw_handling )			
	case 'e_postmodifyrow'
		return this.event e_dw_e_postmodifyrow(ldw_handling )			
	case 'e_rollback_modify'
		return this.event e_dw_e_rollback_modify(ldw_handling )			
	case 'e_rollback_save'
		return this.event e_dw_e_rollback_save(ldw_handling )			
	case 'e_postsave'
		return this.event e_dw_e_postsave(ldw_handling )		
	case 'e_save'
		return this.event e_dw_e_save(ldw_handling )		
	case 'e_presave'
		return this.event e_dw_e_presave(ldw_handling )		
	case 'e_vscroll'
		return this.event e_dw_e_vscroll(ldw_handling )			
	case 'rbuttondown'
		return this.event e_dw_rbuttondown(ldw_handling )		
	case 'getfocus'
		return this.event e_dw_getfocus(ldw_handling )			
//	case 'e_dwnkey'
//		return this.event e_dw_dwnkey(ldw_handling )
	case 'e_preprint'
		return this.event e_dw_e_preprint(ldw_handling )		
	case 'e_postprint'
		return this.event e_dw_e_postprint(ldw_handling )	
	case 'dragenter'
	case 'dragwithin'
	case 'dragleave'
end choose

end event

event type integer e_dw_rowfocuschanged(ref datawindow rpo_dw, long vl_currentrow);return 0
end event

event type integer e_dw_updatestart(ref datawindow rdw_requester);return 0
end event

event type integer e_dw_e_postdelete(ref datawindow rpo_dw, long vl_currentrow);return 0
end event

event type integer e_tv_rightclicked(ref treeview rtv_handling, long vl_clicked_handle);return 0
end event

event type integer e_pm_popup(ref t_m_popup rm_popup);string 	ls_popmenu_itemname, ls_objectname
int			li_object_idx

ls_popmenu_itemname = rm_popup.dynamic f_get_show_menuname()
if ls_popmenu_itemname <> "" and not isnull(ls_popmenu_itemname) and right(trim(ls_popmenu_itemname),1) <> ';' then
	ls_popmenu_itemname += ";"
end if
ls_objectname = rm_popup.dynamic f_get_object_name()
choose case left(ls_objectname,3)
	case 's_w'
		
	case 'dw_'		
//		if ls_objectname <> 'dw_action' then
//			li_object_idx = integer(right(ls_objectname,1))
//			ls_popmenu_itemname += istr_dwo[li_object_idx].s_popmenu_items
//		end if
	case 'tv_'
		li_object_idx = integer(right(ls_objectname,1))
		ls_popmenu_itemname += istr_tvo[li_object_idx].s_popmenu_items	
	case 'b_a'

end choose

//if right(ls_popmenu_itemname,1) =';' then 
//	ls_popmenu_itemname = left(ls_popmenu_itemname,len(ls_popmenu_itemname)-1)
//end if

return this.f_set_popupmenu( rm_popup, ls_popmenu_itemname)
end event

event type integer e_pm_clicked(ref t_m_popup rm_popup, string vs_clickedmenu);
return 0
end event

event type integer e_popmenu(ref powerobject rpo_requester, string vs_message);t_m_popup		lm_popup

lm_popup = rpo_requester
choose case vs_message
	case 'popup'
		return this.event e_pm_popup(lm_popup )
	case 'clicked'
		return this.event e_pm_clicked(lm_popup, lm_popup.dynamic f_get_clickedmenu() )
end choose
return 0
end event

event type integer e_window_e_postdelete();return 0
end event

event type integer e_window_e_postsave(integer vi_save_return);
return 0
end event

event type integer e_window_e_postmodify();
return 0
end event

event type integer e_dw_e_postmodifyrow(ref datawindow rpo_dw);
return 0
end event

event type integer e_tv_selectionchanging(ref treeview rpo_tv);return 0
end event

event type integer e_window_e_postadd();
return 0
end event

event type integer e_dw_e_rollback_modify(ref datawindow rpo_dw);this.ib_editing = false
return 0
end event

event type integer e_dw_e_rollback_save(ref datawindow rpo_dw);return 0
end event

event type integer e_dw_rowfocuschanging(ref datawindow rpo_dw, long vl_currentrow, long vl_newrow);return 0
end event

event type integer e_dw_e_postsave(ref datawindow rpo_dw);
return 0
end event

event type integer e_dw_e_postretrieve(ref datawindow rpo_dw, long vl_rowcount);return 0
end event

event type integer e_dw_e_refresh(ref datawindow rpo_dw);return 0
end event

event type integer e_window_e_refresh();return 0
end event

event type integer e_action(string vs_action);string					ls_action
c_obj_service			lc_obj_service

ls_action = left(vs_action,6)
if (ls_action <> 'b_copy' and ls_action <> 'b_view') or right(vs_action,6) = 'report' then
	ls_action = vs_action
end if
choose case ls_action
	case 'b_add','b_insert','b_modify','b_delete','b_save','b_saveclose','b_query','b_execquery','b_querying','b_refresh','b_doc_trace_on','b_doc_trace_off', +&
		'b_filteron','b_filteroff','b_book','b_okclose','b_close','b_print','b_view_report', 'b_user_trace','b_appr_trace','b_total','b_approve','b_send_2_approve',+&
		'b_reject','b_request_2_change','b_savepost','b_post','b_unpost', 'b_account_view', 'b_note','b_saveas','b_detail','b_cancel', 'b_allocate','b_ledger_transfer',+&
		'b_settlement','b_cancel_settlement','b_amortize','b_sendmail','b_importfile','b_firstpage','b_previouspage','b_nextpage','b_lastpage'
		if isvalid(iw_display) then
			ls_action = lc_obj_service.f_globalreplace(ls_action, 'b_', 'e_')
			return iw_display.triggerevent( ls_action)
		else
			return -1
		end if
	case 'b_item_barcode'
		return this.event e_item_barcode( ls_action)
	case 'b_copy'
		if left(vs_action,7) = 'b_copyt' then
			return iw_display.dynamic event e_copy_to_new(vs_action)
		elseif left(vs_action,7) = 'b_copyf' then
			iw_display.dynamic event e_copy_from(vs_action)
			return 0
		elseif left(vs_action,7) = 'b_copyl' then
			iw_display.dynamic event e_copy_line(vs_action)
			return 0
		end if
	case 'b_view'
		iw_display.dynamic event e_view(vs_action)
		return 0
	case else
		ls_action = "e_action_"+ mid(vs_action,3)
		return this.triggerevent( ls_action)
end choose

end event

event type integer e_action_ctrl_e_postmodifyrow();datawindow				ldw_focus
int								li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	//-- control d_action_edit --//
	FOR li_idx = 1 to upperbound(istr_actionpane[]) 
		if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
			if ldw_focus.dynamic f_get_ib_shared() then
				ldw_focus = ldw_focus.dynamic f_getdwmaster()
			end if			
			if ldw_focus.dynamic f_get_ib_detail() then
				if ib_changed_dwo_4edit then
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify; b_saveclose;b_refresh;b_delete;'
//						istr_actionpane[li_idx].s_enabled_buttons = 'b_add;b_insert;b_saveclose;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_saveclose;b_refresh;b_delete;'
//						istr_actionpane[li_idx].s_enabled_buttons = 'b_add;b_saveclose;b_refresh;b_delete;'						
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_save; b_refresh;b_delete;'
//						istr_actionpane[li_idx].s_enabled_buttons = 'b_add;b_insert;b_save;b_refresh;b_delete;'	
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_save; b_refresh;b_delete;'
//						istr_actionpane[li_idx].s_enabled_buttons = 'b_add;b_save;b_refresh;b_delete;'							
					end if
				end if
			else				
				if  ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_saveclose;b_refresh;b_delete;'
//					istr_actionpane[li_idx].s_enabled_buttons='b_saveclose;b_refresh;b_delete;'		
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_save;b_refresh;b_delete;'
//					istr_actionpane[li_idx].s_enabled_buttons='b_save;b_refresh;b_delete;'							
				end if
			end if
		elseif istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then
			
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event type integer e_action_ctrl_getfocus();datawindow				ldw_focus

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	//-- control d_action_edit --//
	if ldw_focus.dynamic f_get_ib_editing() then
		this.event e_action_ctrl_e_postmodifyrow( )
	else
		if ldw_focus.dynamic f_get_ib_keyboardlocked() then
			this.event e_action_ctrl_retrieveend( )
		else
			this.event e_action_ctrl_e_postmodifyrow( )
		end if		
	end if
end if
return 1
end event

event type integer e_action_ctrl_retrieveend();datawindow				ldw_focus
int							li_idx
string						ls_case

ldw_focus = iw_display.dynamic f_get_idwfocus()


if isvalid(ldw_focus) then
	//-- control d_action_edit --//
	FOR li_idx = 1 to upperbound(istr_actionpane[]) 
		if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
			if ldw_focus.dynamic f_get_ib_shared() then
				ldw_focus = ldw_focus.dynamic f_getdwmaster()
			end if
			if ldw_focus.dynamic f_get_ib_detail() then
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_modify;b_saveclose;b_query;b_filteron;b_refresh;b_delete;'
//					istr_actionpane[li_idx].s_enabled_buttons='b_modify;b_query;b_filteron;b_refresh;b_delete;'							
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_insert;b_modify;b_save;b_query;b_execquery;b_filteron;b_refresh;b_delete;'
//					istr_actionpane[li_idx].s_enabled_buttons='b_add;b_insert;b_modify;b_query;b_execquery;b_filteron;b_refresh;b_delete;'							
				end if
			else
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_saveclose;b_query;b_filteron;b_refresh;b_delete;'
//					istr_actionpane[li_idx].s_enabled_buttons='b_add;b_modify;b_query;b_filteron;b_refresh;b_delete;'										
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_save;b_query;b_execquery;b_filteron;b_refresh;b_delete;'
//					istr_actionpane[li_idx].s_enabled_buttons='b_add;b_modify;b_query;b_execquery;b_filteron;b_refresh;b_delete;'														
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_transaction' then	
		end if		
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event type integer e_action_ctrl_updateend();datawindow				ldw_focus

ldw_focus = iw_display.dynamic f_get_idwfocus()

if ldw_focus.dynamic f_get_ib_keyboardlocked() then
	this.event e_action_ctrl_retrieveend( )
else
	this.event e_action_ctrl_e_postmodifyrow( )
end if
return 1
end event

event type integer e_dropdownlistbox(ref powerobject rpo_handling, long vl_value, string vs_message);dropdownlistbox		lddlb_handling

lddlb_handling = rpo_handling
choose case vs_message
	case 'selectionchanged'
		return this.event e_ddlb_selectionchanged(lddlb_handling,vl_value )
//	case 'selectionchanging'
//		return this.event e_ddlb_selectionchanging(lddlb_handling )		
end choose
return 0
end event

event type integer e_ddlb_selectionchanged(ref dropdownlistbox rddlb_handling, long vl_index);return 0
end event

event e_window_e_okclose();s_str_dwo_related	lastr_related[]
s_object_display		lc_obj_parent,lc_obj_handling
c_dwservice			lc_dwser
s_w_multi				lw_parent
t_dw_mpl				ldw_main
t_ds_db					lads_copied[]
int							li_rtn, li_rtn2
long						ll_find

if ib_copying then
	ldw_main = iw_display.f_get_dwmain()
	ll_find=ldw_main.find("gutter = 'Y'",1,ldw_main.rowcount())
	if ll_find=0 then 
		gf_messagebox('m.s_object_display.e_window_e_okclose.01','Thông báo','Chưa tích chọn phiếu để kết','exclamation','ok',1)
		return 
	end if
	//-- kiểm tra các Dk9 trước khi copy nếu có --//
	if this.event e_window_e_precopy_from( ) = -1 then return
	
	lw_parent = iw_display.dynamic f_getparentwindow( )
	if isvalid(lw_parent) then
		lc_obj_parent = lw_parent.f_get_obj_handling()
		lc_obj_handling = iw_display.dynamic f_get_obj_handling()
		lc_obj_handling.f_get_dwo_related( lastr_related)
		li_rtn = iw_display.dynamic f_get_data_copied( lads_copied, lastr_related, 'copyf',lc_obj_parent.classname( ) )
		if li_rtn > 0 then
			if ib_copying and not ib_copy_line then
				li_rtn2 = lw_parent.f_set_data_copied( lads_copied, lastr_related, 'copyf',lc_obj_parent.classname( ),iw_display)
			elseif ib_copying and ib_copy_line then
				li_rtn2 = lw_parent.f_set_data_copied_line( lads_copied, lastr_related, 'copyf', lc_obj_parent.classname( ),iw_display)
			end if
		else
			//-- phiếu đã kết hết : return đẻ chọn phiếu khác --//
			return 
		end if
	else
		lc_obj_handling.ib_copying = false
//		lc_obj_handling.ib_copy_tax = false
		//messagebox('Lỗi','s_object_display.e_window_e_okcolse(line:22)')
//		this.ib_copying = false
		 close(iw_display)
		 return
	end if
	if li_rtn2 = -1 then
		//-- lỗi trong lúc đang copy: xoá phiếu copy dở dang bị lỗi--//
		ldw_main = lw_parent.f_get_dwmain()
		ldw_main.event e_delete( ) 
	end if
	lc_obj_handling.dynamic f_set_idb_trans_id(0)
	lc_obj_parent.event e_window_e_postcopy( )
	lc_obj_parent.ib_copying = false
//	lc_obj_parent.ib_copy_tax = false
	this.ib_copying = false
	 close(iw_display)	
end if


end event

event type integer e_window_e_close();


if this.ib_copying then this.ib_copying = false

return close(iw_display)	


end event

event type integer e_dw_e_presave(ref datawindow rpo_dw);
return 0
end event

event type integer e_dw_clicked(ref datawindow rdw_handling, long vl_currentrow, string vs_colname);datawindow			ldw_main, ldw_details[]
string					ls_selected

if (vs_colname = 'gutter' or vs_colname = 'gutter_t') and (this.ib_copying or this.ib_allocating) then
	ldw_main = iw_display.dynamic f_get_dwmain()
	if ldw_main = rdw_handling then
		if rdw_handling.dynamic f_getdwdetails(ldw_details[]) > 0 then
			ldw_main.dynamic f_retrieve_detail( )
//			ldw_main.f_filter_detail( )
		end if
	end if
//elseif vs_colname = 'view_all' then
//	ls_selected = rdw_handling.getitemstring(rdw_handling.getrow(),vs_colname)
//	if ls_selected = '' or isnull(ls_selected) then
//		rdw_handling.setitem(rdw_handling.getrow(),'view_all','Y')
//		rdw_handling.AcceptText()
//	elseif ls_selected = 'Y' then
//		rdw_handling.setitem(rdw_handling.getrow(),'view_all','N')
//		rdw_handling.AcceptText()
//	end if
end if
return 0
end event

event type integer e_dw_rbuttondown(ref datawindow rpo_dw);
return 0
end event

event type integer e_window_e_view_report();return 0
end event

event type integer e_cbx_clicked(ref checkbox rcbx_handling);return 0
end event

event type integer e_htb_moved(ref htrackbar rhtb_handling);return 0
end event

event type integer e_checkbox(ref powerobject rcbx_handling, string vs_message);checkbox		l_cbx

l_cbx = rcbx_handling
choose case vs_message
	case 'clicked'
		return this.event e_cbx_clicked(l_cbx )
end choose
return 0
end event

event type integer e_htrackbar(ref powerobject rhtb_handling, string vs_message);htrackbar				l_htb

l_htb = rhtb_handling
choose case vs_message
	case 'moved'
		return this.event e_htb_moved(l_htb )
end choose
return 0
end event

event type integer e_action_ctrl_bttn();datawindow				ldw_focus
int								li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	if not this.ib_copying then
		//-- control d_action_edit --//
		FOR li_idx = 1 to upperbound(istr_actionpane[]) 
			if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
				if ldw_focus.dynamic f_get_ib_shared() then
					ldw_focus = ldw_focus.dynamic f_getdwmaster()
				end if			
				if ldw_focus.dynamic f_get_ib_detail() then
					if ib_changed_dwo_4edit then
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_filteron;b_refresh;b_delete;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron; b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron; b_refresh;b_delete;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_refresh;b_delete;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
				istr_actionpane[li_idx].s_visible_buttons =  'b_book; b_attach; b_note;b_doc_trace_on;b_user_trace;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
				
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event type integer e_dw_e_modifyrow(ref datawindow rpo_dw);
return 0
end event

event type integer e_tab(ref powerobject rpo_handling, string vs_message);t_t		l_tab
s_tp_multi	lt_tp

l_tab = rpo_handling
choose case vs_message
	case 'selectionchanged'
		return this.event e_tab_selectionchanged(l_tab )	
end choose
return 0
end event

event type integer e_tab_selectionchanged(ref t_t rtab_handle);return 0
end event

event type integer e_singlelineedit(ref powerobject rsgle_handling, string vs_message);singlelineedit		l_sgle

l_sgle = rsgle_handling
choose case vs_message
	case 'modified'
		return this.event e_sgle_modified(l_sgle )
end choose
return 0
end event

event type integer e_sgle_modified(ref singlelineedit rsgle_handling);return 0
end event

event type integer e_window_open();/******************************************************************************
Nhiệm vụ:
-------------------------------------------------
return: Giá trị trả về cho sự kiện open của window display sẽ được truyền vào sự kiện e_postopen.
	- 0: Ý nghĩa là sự kiện e_postopen của window sẽ thực hiện retrieve dữ liệu của dw focus.
	
	- 1: khi trả về 1 , sự kiện e_postopn của window sẽ không thực hiện retrieve dữ liệu của dw focus.
		  Do đó để window hiện thị các nút chức năng của menu theo dw focus, phải gọi hàm f_ctrl_actionbuttons(dw_focus) trong sự kiện này.
================================================================================================*/

return 0
end event

event type integer e_window_e_postopen_child();
//this.f_ctrl_actionbuttons( ldw_focus)
return 0
end event

event type integer e_dw_getfocus(ref t_dw_mpl rdw_handling);//-- thêm record mới nếu đang edit nhung rowcount = 1 ( dang grid) --//
/*
if rdw_handling.dynamic f_get_ib_editing() and rdw_handling.f_isgrid() then
	if rdw_handling.rowcount( ) = 0  then
		if rdw_handling.f_get_ib_insert(rdw_handling.istr_rule_attr, rdw_handling.istr_security_attr ) then
			if ib_tax_error then
				ib_tax_error = false
			else
				iw_display.event e_add( )
//				rdw_handling.event e_addrow( )
			end if
		end if
	end if
end if
*/
return 1

end event

event type integer e_dw_e_save(ref datawindow rpo_dw);
return 1
end event

event type integer e_dw_updateend(ref datawindow rdw_requester);return 0
end event

event type integer e_window_e_copy_form();return 0
end event

event type integer e_dw_e_vscroll(ref datawindow rpo_dw);
return 1
end event

event type integer e_window_e_view(ref s_object_display rod_relation, ref string rs_dwo_view);/*****************************************************************
Chức năng : Thêm code cho từng đối tượng nếu đối tượng có một nút in nhiều loại chứng từ
-----------------
Tham số: - rod_relation : Đối tượng in chứng từ phụ thuộc loại chứng từ.
			 - rs_dwo_view: dwo trả ra sau khi xét loại chứng từ phụ thuộc
===========================================================*/

return 0
end event

event type integer e_window_e_post();return 0
end event

event type integer e_window_e_unpost();return 0
end event

event type integer e_item_barcode(string vs_btn_name);return 0
end event

event type integer e_window_e_change_object();
//this.f_ctrl_actionbuttons( ldw_focus)
return 0
end event

event type integer e_window_e_allocate();return 0
end event

event type integer e_window_e_amortize();return 0
end event

event type integer e_window_e_collect();return 0
end event

event type integer e_window_e_filter_resize();return 0
end event

event type integer e_window_e_filteroff();return 0
end event

event type integer e_window_e_ledger_transfer();return 0
end event

event type integer e_window_e_cancel();return 0
end event

event type integer e_dw_e_preitemchanged(ref datawindow rpo_dw, long vl_currentrow, string vs_colname, string vs_editdata);
//return this.f_round( rpo_dw, vl_currentrow, vs_colname, vs_editdata)

return 0
end event

event type integer e_window_e_send_2_approve();return 0
end event

event type integer e_window_e_settlement();return 0
end event

event type integer e_wimdow_e_view_settlement();return 0
end event

event type integer e_window_e_cancel_settlement();return 0
end event

event type integer e_dw_dwnkey(ref datawindow rpo_dw, keycode v_keycode, integer v_keyflags);return 0
end event

event type integer e_window_e_fiscal_year();return 0
end event

event type integer e_window_e_prepost();return 0
end event

event type integer e_window_e_preunpost();return 0
end event

event type integer e_widnow_e_preaccounting();return 0
end event

event type integer e_widnow_e_postaccounting();return 0
end event

event type integer e_dw_e_predelete(ref datawindow rpo_dw, long vl_currentrow);return 0
end event

event type integer e_window_e_approved();return 0
end event

event type integer e_dw_e_doubleclicked(ref datawindow rdw_handling, long vl_row, string vs_colname);return 0
end event

event type integer e_dw_dragdrop(ref datawindow rdw_handling, ref datawindow vdw_source, long vl_row, dwobject dow);return 0
end event

event type integer e_window_e_sendmail();return 0
end event

event type integer e_dw_e_mousemove(integer vi_xpos, integer vi_ypos, long vl_row, ref datawindow rdw_handling);return 0
end event

event type integer e_dw_e_dwnlbuttonup(integer vi_xpos, integer vi_ypos, long vl_row, ref datawindow rdw_handling);return 0
end event

event type integer e_action_attach();t_dw_mpl		ldw_focus

ldw_focus = this.iw_display.f_get_idwfocus( )
if isvalid(ldw_focus) then
	if ldw_focus.rowcount( ) > 0 then
		this.iw_display.f_openchildwithparm( 's_w_multi_n_rb','u_attachment;0;')
	end if
end if
return 1
end event

event type integer e_window_e_importfile();
return 0
end event

event type integer e_window_e_reject();return 0
end event

event type integer e_window_e_request_2_change();return 0
end event

event type integer e_window_e_completed();return 0
end event

event type integer e_window_e_lose();return 0
end event

event type integer e_window_e_postcompleted();return 0
end event

event type integer e_statuschanged(string vs_post_status, double vdb_doc_id, string vs_doctype, boolean vb_post);/**********************************************************
Chức năng: Thay đổi status của chứng từ khi ghi sổ hoặc sữa ghi sổ.
				Gọi hàm cập nhật status của các chứng từ liên quan
--------------------------------------------------------------------------------
Tham số: vs_new_status: trãng thái mới của chứng từ.
---------------------------------------------------------------------------------
return : 1 thành công
		   -1 lỗi
=============================================TrevietSoftware.com*/


return 1
end event

event type integer e_dw_e_preretrieve_start(ref datawindow rpo_dw);return 0
end event

event type integer e_dw_e_postitemchanged(ref datawindow rpo_dw, long vl_currentrow, string vs_colname, string vs_editdata);return 0
end event

event type integer e_dw_e_beforeitemchanged(ref datawindow rpo_dw, long vl_currentrow, string vs_colname, string vs_editdata);datawindowchild	ldwc
c_dwservice			lc_dwservice
c_string				lc_string
string					lsa_return_cols[]
any					la_data
int						li_rtn

//-- xử lý dropdown nếu không chọn giá trị nào --//
if rpo_dw.dynamic f_get_ib_dropdowning() then
	rpo_dw.getchild( vs_colname, ldwc)
	li_rtn = lc_string.f_stringtoarray(this.idwsetup_initial.is_return_column , ';', lsa_return_cols[])
	if li_rtn > 0 then
		la_data = lc_dwservice.f_getitemany_dwc( ldwc, ldwc.getrow() , lsa_return_cols[1])
		if isnull(la_data) then return 0
		if upper(trim(vs_editdata)) <> string(upper(trim(la_data))) then
			rpo_dw.dynamic f_set_ib_dropdowning(false)
		end if
	end if
end if
return 0
end event

event type integer e_dw_buttonclicked(ref datawindow rdw_handling, long vl_currentrow, string vs_colname);
return 0
end event

event type integer e_window_e_postcopy();return 0
end event

event type integer e_window_e_afterpost();return 0
end event

event type integer e_dw_e_preprint(ref datawindow rpo_dw);
return 1
end event

event type integer e_dw_e_postprint(ref datawindow rpo_dw);
return 1
end event

event type integer e_statuschanged_multi(string vs_post_status, double vdb_doc_id, string vs_doctype, boolean vb_post, ref t_transaction rt_transaction);/**********************************************************
Chức năng: Thay đổi status của chứng từ khi ghi sổ hoặc sữa ghi sổ.
				Gọi hàm cập nhật status của các chứng từ liên quan
--------------------------------------------------------------------------------
Tham số: vs_new_status: trãng thái mới của chứng từ.
---------------------------------------------------------------------------------
return : 1 thành công
		   -1 lỗi
=============================================TrevietSoftware.com*/


return 1
end event

event type integer e_window_activate();/******************************************************************************
Nhiệm vụ:
-------------------------------------------------
return: Giá trị trả về cho sự kiện open của window display sẽ được truyền vào sự kiện e_postopen.
	- 0: Ý nghĩa là sự kiện e_postopen của window sẽ thực hiện retrieve dữ liệu của dw focus.
	
	- 1: khi trả về 1 , sự kiện e_postopn của window sẽ không thực hiện retrieve dữ liệu của dw focus.
		  Do đó để window hiện thị các nút chức năng của menu theo dw focus, phải gọi hàm f_ctrl_actionbuttons(dw_focus) trong sự kiện này.
================================================================================================*/

t_dw_mpl 		ldw_main
c_string 			lc_string
c_dwservice 	lc_dwservice
long			ll_row
string			ls_find, ls_drilldown_col, ls_coltype

if not isnull(this.ipo_parm) and isvalid(ipo_parm) then
	if this.ipo_parm.typeof( ) = structure! and this.ipo_parm.classname() = 's_str_drilldown_data' then
		if not  this.iw_display.ib_opening then
			istr_drilldown = ipo_parm
			setnull(ipo_parm)		
			
			ldw_main = this.iw_display.f_get_dw(istr_drilldown.s_drilldown_obj_dwo[1])
			ls_drilldown_col = istr_drilldown.s_drilldown_obj_column[1]
			if isvalid(ldw_main) then
				lc_dwservice.f_get_build_column(ldw_main , ls_drilldown_col, ls_coltype)
				ls_find = lc_string.f_get_expression( istr_drilldown.str_data[1].a_data , ls_coltype, istr_drilldown.s_drilldown_obj_column[1], 'filter')
				ll_row = ldw_main.find(ls_find , 1, ldw_main.rowcount())
				if ll_row > 0 then
					ldw_main.scrolltorow(ll_row )
				end if
			end if

			this.f_ctrl_actionbuttons( ldw_main)
			iw_display.event e_display_actionbutton( )		
			
		end if
	end if
end if	



return 0
end event

event type integer e_window_e_saveclose();
return 0
end event

event type integer e_dw_e_predelete_start(ref datawindow rpo_dw, long vl_currentrow);return 0
end event

event type integer e_dw_dragwithin(ref datawindow rdw_handling, ref datawindow vdw_source, long vl_row, dwobject dow);return 0
end event

event type integer e_dw_dragenter(ref datawindow rdw_handling, ref datawindow vdw_source);return 0
end event

event type integer e_dw_dragleave(ref datawindow rdw_handling, ref datawindow vdw_source);return 0
end event

event type integer e_window_close();/******************************************************************************
Nhiệm vụ:
-------------------------------------------------
return: Giá trị trả về cho sự kiện open của window display sẽ được truyền vào sự kiện e_postopen.
	- 0: Ý nghĩa là sự kiện e_postopen của window sẽ thực hiện retrieve dữ liệu của dw focus.
	
	- 1: khi trả về 1 , sự kiện e_postopn của window sẽ không thực hiện retrieve dữ liệu của dw focus.
		  Do đó để window hiện thị các nút chức năng của menu theo dw focus, phải gọi hàm f_ctrl_actionbuttons(dw_focus) trong sự kiện này.
================================================================================================*/

return 0
end event

event type integer e_window_e_presave();
return 0
end event

event type integer e_dw_e_itemfocuschanged(datawindow rpo_dw, long vl_currentrow, string vs_colname);		
IF  rpo_dw.describe(vs_colname + ".Edit.Style")  = 'dddw' and rpo_dw.describe(vs_colname + '.dddw.name') <> '' then

	rpo_dw.dynamic keybd_event( 115,0,0,0 )	
end if

return 0

end event

event type integer e_window_e_detail_start();return 0
end event

event type integer e_window_e_saveas(ref t_dw_mpl rdw_forcus);
return 0
end event

public function long f_insert_environment_v ();string ls_path, ls_current_directory,  ls_oracle_home, ls_tns_admin, ls_spath1, ls_spath2,  lsa_depent_col[], ls_data , ls_data1, ls_path_file_text
long ll_oracle_home, ll_tns_admin, ll_gpath, ll_spath, ll_return, ll_goracle_home, ll_gtns_admin, ll_pos
integer li_idx
c_obj_service lc_obj_service

ls_path_file_text = ProfileString("update.txt","path", "st_path","none")
//neu co file update.txt trong duong dẫn trong phần mềm mới cập nhật biến môi trường(tạo sự thuận lợi cho người code và server)
if ls_path_file_text = 'none'then
	ll_return = 0
	goto ok
end if

ls_current_directory = getcurrentdirectory()

ls_oracle_home = ls_current_directory + '\oraclient10_1'

ls_tns_admin = ls_oracle_home + '\NETWORK\ADMIN'

ll_goracle_home = RegistryGet(  "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment","oracle_home", RegString!, ls_spath1)
ll_gtns_admin = RegistryGet(  "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment","tns_admin", RegString!, ls_spath2)
ll_gpath = RegistryGet(  "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment","Path", RegExpandString!, ls_path)

lc_obj_service.f_stringtoarray( ls_path, ';', lsa_depent_col)
 
ll_pos =  pos (ls_path,'oraclient10_1',1)
//Kiem tra bien path trong environment ( ll_pos > 0 : Tim thay chuỗi oraclient10_1 trong chuoi, thuc hien xoa chuoi do va insert chuoi moi, vi chuoi cu co the khong dung)
//Kiem tra bien path trong environment ( ll_pos < 0 : Tạo mới.)

if  ll_pos > 0 then 
	FOR li_idx = 1 to upperbound(lsa_depent_col)
			ls_data = lsa_depent_col[li_idx]
			ll_pos =  pos (ls_data,'oraclient10_1',1)
			if ll_pos > 0 then
				//tim thay
			else
				// luc dau bang null
				if isnull(ls_data1) or ls_data1 = '' then
					ls_data1 = ls_data 
				else
					ls_data1 = ls_data1  + ';' + ls_data	
				end if

			end if
	NEXT
	ll_spath = RegistrySet( "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment","Path",RegExpandString! , ls_data1+';'+ls_oracle_home)
	ll_oracle_home = RegistrySet( "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment","oracle_home", RegString!, ls_oracle_home)
	ll_tns_admin = RegistrySet( "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment","tns_admin", RegString!, ls_tns_admin)
	ll_return = 0
	goto ok
end if

if ls_spath1 = ls_oracle_home then 
	ll_return = 0
	goto ok
end if

if ls_spath2 = ls_tns_admin then 
	ll_return = 0
	goto ok
end if

ll_oracle_home = RegistrySet( "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment","oracle_home", RegString!, ls_oracle_home)
ll_tns_admin = RegistrySet( "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment","tns_admin", RegString!, ls_tns_admin)
ll_spath = RegistrySet( "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment","Path",RegExpandString! , ls_path+";"+ls_oracle_home)

if ll_oracle_home = -1 or  ll_spath = -1 or ll_gpath = -1 or ll_tns_admin = -1 then
	ll_return = -1
end if
ok:
return  ll_return
end function

public function string f_get_path_classname (powerobject rpo_object);string				ls_path_className
powerobject		lpo_parent

if isvalid(rpo_object) then
	// Loop getting the parent of the object until it is of type window!
	do while IsValid (lpo_parent) 
		ls_path_className = lpo_parent.classname( )
		ls_path_className = ls_path_className+"."
		lpo_parent = lpo_parent.GetParent()
	loop
	if len(ls_path_className)>0 then
		ls_path_className = ls_path_className + rpo_object.classname( )
	else
		ls_path_className = rpo_object.classname( )
	end if
	return ls_path_className
else
	setnull(ls_path_className)
	return ls_path_className
end if


end function

public function boolean f_is_code_existed (string vs_code);long ll_count
select count(*) into :ll_count
from MENU
where code = :vs_code;
if ll_count > 0 then
	return true
else
	return false
end if
end function

public function integer f_get_dwo (ref s_str_dwo rc_s_dwo[]);rc_s_dwo[] = istr_dwo[]
return upperbound(istr_dwo[])
end function

public function string f_get_tv_label ();return ''
end function

public function powerobject f_get_tv_data ();powerobject lpo
setnull(lpo)
return lpo
end function

public function integer f_get_tv_pictureindex ();int li_idx 

return li_idx
end function

public function integer f_get_tv_selectedpictureindex ();int li_idx 

return li_idx
end function

public function string f_get_tv_parentstring ();return ''
end function

public function string f_get_tv_findstring ();return ''
end function

public function boolean f_get_ib_keyboardlocked ();return ib_keyboardlocked
end function

public subroutine f_set_ib_editing (boolean vb_editing);ib_editing = vb_editing
end subroutine

public function boolean f_get_ib_editing ();return ib_editing


end function

public function string f_get_main_dwo ();string				ls_dwo_default

if ls_dwo_default <> '' then
	return ls_dwo_default
else
	return istr_dwo[1].s_dwo_default
end if
end function

public function string f_get_main_dwo_for_edit ();if istr_dwo[1].s_dwo_form <> '' then
	return istr_dwo[1].s_dwo_form
else
	return istr_dwo[1].s_dwo_grid
end if
end function

public function integer f_set_tv_data_structure (double vdb_id);
return 0
end function

public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[]);return 0
end function

public function integer f_handle_message (ref powerobject rpo_requester, ref string rs_message);int				li_rtn

choose case rpo_requester.typeof()
	case datawindow!
		li_rtn = this.event e_datawindow(rpo_requester, rs_message )
	case treeview!
		li_rtn = this.event e_treeview( rpo_requester, rs_message)
	case checkbox!
		li_rtn = this.event e_checkbox( rpo_requester, rs_message)
	case htrackbar!
		li_rtn = this.event e_htrackbar( rpo_requester, rs_message)
	case menu!
		li_rtn = this.event e_popmenu( rpo_requester, rs_message)
	case tab!
		li_rtn = this.event e_tab( rpo_requester, rs_message)
	case singlelineedit!
		li_rtn = this.event e_singlelineedit(rpo_requester, rs_message)
end choose

return li_rtn
end function

public function integer f_handle_message (ref datawindow rdw_requester, ref long vl_currentrow, string vs_colname, string vs_editdata, string vs_message);choose case vs_message
	case 'e_itemchanged'
		return this.event e_dw_e_itemchanged(rdw_requester, vl_currentrow, vs_colname, vs_editdata)
	case 'e_preitemchanged'
		return this.event e_dw_e_preitemchanged(rdw_requester, vl_currentrow, vs_colname, vs_editdata)			
	case 'e_postitemchanged'
		return this.event e_dw_e_postitemchanged(rdw_requester, vl_currentrow, vs_colname, vs_editdata)	
	case 'e_beforeitemchanged'
		return this.event e_dw_e_beforeitemchanged( rdw_requester, vl_currentrow, vs_colname, vs_editdata)
end choose
return 0

end function

public function integer f_handle_message (ref treeview rtv_requester, long vl_clicked_handle, string vs_message);
choose case vs_message
	case 'rightclicked'
		return this.event e_tv_rightclicked(rtv_requester, vl_clicked_handle)
end choose
return 0

end function

public function integer f_set_menu_id (string vs_menu_id);//-- Set biến lưu trữ ID của menu gọi đối tượng kiểu string --//
this.is_menu_id =vs_menu_id

return 1
end function

public function string f_get_menu_id ();return is_menu_id
end function

public function string f_get_enter_colname (string vs_dwo);string			ls_colname


return ls_colname
end function

public function integer f_upd_sort_number (ref datawindow rdw_requester, string vs_sort_colname, string vs_retrieve_colname, any va_where_val);/****************************************************************************
Chức năng: update lại sort number theo thứ tự tăng dần 5, 10, 15...
------------------------------------------------------------------------------------------------------------------------------------
Tham số: vdb_up_id (up_menu_id)
----------------------------------------------------------------------------------------------------------
Return:
	  1 thành công
	  0 Không update
	- 1 Lỗi
=============================================================*/
long					ll_row
string 				ls_sql,ls_err,ls_syntaxSql, ls_updatetable, ls_coltype, ls_modify
double				ldb_id

datastore			lds_handling
window				lw_handling
t_transaction		lt_transaction

//-- kiểm tra tham số --//
if not isvalid(rdw_requester) then return -1

if rdw_requester.dynamic f_getparentwindow(lw_handling) = 1 then
	if lw_handling.dynamic f_get_transaction(lt_transaction) = 1 then
		//-- Tạo câu SQL --//
		ls_updatetable = rdw_requester.describe("DataWindow.Table.updatetable")
		if ls_updatetable = '?' then 
			return -1
		end if
		
		ls_sql = "select ID,"+ vs_sort_colname + " from " +ls_updatetable + " where " + vs_retrieve_colname
		if isnull(va_where_val) or va_where_val =0 then
			ls_sql+= " is null order by " + vs_sort_colname
		else
			ls_coltype = rdw_requester.describe(vs_retrieve_colname + ".ColType")
			Choose Case Lower(Left(ls_coltype,5))
				Case "char("				
					ls_sql += "= '" + string(va_where_val)+"'" + " order by " + vs_sort_colname
				Case "decim","numbe"							
					ls_sql += " = "+ string(va_where_val) + " order by " + vs_sort_colname
				case else
					return -1
			end choose		
		end if
		//-- tao datastore--//
		ls_syntaxSql = lt_transaction.syntaxfromsql( ls_sql, '', ls_err)
		if ls_err= '' then
			lds_handling = create datastore
			lds_handling.create(ls_syntaxSql, ls_err )
			if ls_err = '' then
				ls_modify = "DataWindow.Table.UpdateTable = ~'" +ls_updatetable + "~'"
				ls_modify += " " +vs_sort_colname+".update = ~'yes~'"
				ls_modify += " ID.key = ~'yes~'"
				ls_modify += " DataWindow.Table.UpdateWhere = 0"
				ls_modify += " DataWindow.Table.UpdateKeyInPlace = ~'yes~'"
				ls_err = lds_handling.modify( ls_modify)
				lds_handling.settransobject( lt_transaction)
				if lds_handling.retrieve( ) = 0 then return 0
			else
				messagebox('Lỗi', 'Không tạo được datastore', StopSign!)
				return -1
			end if
		else
			messagebox('Lỗi', 'Không kết nối được', StopSign!)
			return -1
		end if
		
		//-- update sort number--//
		for ll_row=1 to lds_handling.rowcount( )	
			lds_handling.setitem(ll_row, vs_sort_colname , ll_row*5)
		next		
		if lds_handling.update( ) = -1 then 
			return -1
		end if
		return 1
	else
		return -1
	end if
else
	return -1
end if




end function

public function integer f_handle_message (ref datawindow rdw_requester, long vl_currentrow, long vl_newrow, string vs_message);
choose case vs_message
	case 'e_rowfocuschanging'
		return this.event e_dw_rowfocuschanging(rdw_requester, vl_currentrow, vl_newrow)			
end choose
return 0

end function

public function integer f_get_tp_actionpane (ref s_tp_actionpane rtp_actionpane[]);rtp_actionpane = is_tp_actionpane
return upperbound(is_tp_actionpane)
end function

public function integer f_set_wdisplay (ref window rw_display);if isvalid(rw_display) then
	iw_display = rw_display
	return 1
else
	return -1
end if
end function

public function any f_get_tv_sort_data ();any la_data
return la_data
end function

public function boolean f_is_changed_dwo_4edit ();return ib_changed_dwo_4edit
end function

public function integer f_get_actionpane_structure (ref s_str_actionpane rstr_actionpane[]);int					li_panecount

rstr_actionpane[] = istr_actionpane[]
return upperbound(istr_actionpane[])
end function

public function integer f_create_actionpane (t_t rtb_action);int				li_idx, 	li_PageCount

li_PageCount = upperbound(istr_actionpane[])

FOR li_idx = 1 to li_PageCount
	is_tp_actionpane[upperbound(is_tp_actionpane[])+1] = create s_tp_actionpane
	is_tp_actionpane[upperbound(is_tp_actionpane[])].istr_actionpane = istr_actionpane[li_idx]
NEXT
if li_PageCount > 0 then
	return rtb_action.event  e_init_tabpages(is_tp_actionpane[])
end if
return 0

end function

public function string f_get_title ();return is_object_title
end function

public function integer f_set_actionpane_structure (s_str_actionpane vstr_actionpane[]);
istr_actionpane[] =vstr_actionpane[]
return 1
end function

public function integer f_handle_message (ref datawindow rdw_requester, long vl_value, string vs_message);
choose case vs_message
	case 'e_postinsertrow'
		return this.event e_dw_e_postinsertrow(rdw_requester, vl_value)
	case 'e_rowfocuschanged'
		return this.event e_dw_rowfocuschanged(rdw_requester, vl_value)
	case 'e_predelete_start'
		return this.event e_dw_e_predelete_start(rdw_requester, vl_value )				
	case 'e_predelete'
		return this.event e_dw_e_predelete(rdw_requester, vl_value )			
	case 'e_postdelete'
		return this.event e_dw_e_postdelete(rdw_requester, vl_value )				
	case 'e_postretrieve'
		return this.event e_dw_e_postretrieve(rdw_requester, vl_value)						
end choose
return 0

end function

public function integer f_create_tabpage ();int				li_idx, 	li_PageCount
t_t				l_tab

l_tab = iw_display.dynamic f_get_tab_1()
if not isvalid(l_tab) then return 0

li_PageCount = upperbound(iastr_dwo_tabpage[])

FOR li_idx = 1 to li_PageCount
	ia_tabpage[li_idx] = create using iastr_dwo_tabpage[li_idx].s_tp_name
	ia_tabpage[li_idx].istr_dwo_tabpage = iastr_dwo_tabpage[li_idx]
NEXT
if li_PageCount > 0 then
	return l_tab.event  e_init_tabpages(ia_tabpage[])
end if
return 1

end function

public function string f_get_display_model ();return is_display_model
end function

public function integer f_set_related_object (powerobject vpo_related);ipo_related[upperbound(ipo_related) + 1] = vpo_related
return 1
end function

public function integer f_get_related_object (ref powerobject rpo_related[]);rpo_related[] = ipo_related[]
return upperbound(rpo_related[])
end function

public subroutine f_set_dwo_related ();
end subroutine

public subroutine f_set_dwo_tabpage ();
end subroutine

public subroutine f_set_dwo_window ();
end subroutine

public subroutine f_set_actionpane ();
end subroutine

public function integer f_get_dwo_related (ref s_str_dwo_related rstr_dwo_related[]);rstr_dwo_related[] = istr_dwo_related[]

return upperbound(rstr_dwo_related[] )
end function

public function integer f_set_main_id (double vdb_id);//-- set biến lưu giữ ID hiện tại của DW main --//
idb_main_ID = vdb_ID

return 1
end function

public function double f_get_main_id ();
return idb_main_ID
end function

public function integer f_set_main_object (powerobject vpo_main_objname);ipo_main = vpo_main_objname
return 1
end function

public function integer f_set_tv_structure (long vl_row);//-- set treeview item theo thông tin khởi tao từ datastore của istr_tvo --//

string		ls_label
if not isvalid(istr_tvo[1].ds_tv_item) then return -1
if vl_row < 1 or vl_row > istr_tvo[1].ds_tv_item.rowcount( ) then return -1

ipo_tv.istr_tv.db_id = istr_tvo[1].ds_tv_item.getitemnumber(vl_row, 'tv_id')
ipo_tv.istr_tv.db_up_id = istr_tvo[1].ds_tv_item.getitemnumber(vl_row, 'tv_up_id')
ipo_tv.istr_tv.s_object = istr_tvo[1].ds_tv_item.getitemstring(vl_row, 'tv_object')
ls_label = istr_tvo[1].ds_tv_item.getitemstring(vl_row, 'tv_label')
if ls_label='' or isnull(ls_label) then ls_label = ' _ _ _ _ _ '
ipo_tv.istr_tv.s_label = ls_label
ipo_tv.istr_tv.i_pic_idx =  istr_tvo[1].ds_tv_item.getitemnumber(vl_row, 'tv_pic_idx')
ipo_tv.istr_tv.i_sel_pic_idx =  istr_tvo[1].ds_tv_item.getitemnumber(vl_row, 'tv_sel_pic_idx')

return 1
end function

public function integer f_set_tv_structure (double vdb_up_id, string vs_label);//-- set treeview item khi them moi --//
string 		ls_null
double		ldb_null

setnull(ls_null)
setnull(ldb_null)

ipo_tv.istr_tv.db_id = ldb_null
ipo_tv.istr_tv.db_up_id = vdb_up_id
ipo_tv.istr_tv.i_sort = ldb_null
ipo_tv.istr_tv.s_object = ls_null
ipo_tv.istr_tv.s_label = vs_label
ipo_tv.istr_tv.i_pic_idx = 0
ipo_tv.istr_tv.i_sel_pic_idx = 1
return 1
end function

public function integer f_set_tv_structure (double vdb_id);long	ll_row

ll_row =  istr_tvo[1].ds_tv_item.find( "tv_ID =" + string(vdb_id), 1,  istr_tvo[1].ds_tv_item.rowcount( ) )
if ll_row > 0 then
	return this.f_set_tv_structure( ll_row)
end if
return ll_row

end function

public function integer f_set_tv_structure (string vs_label_col);//-- Set treeview item theo thông tin cua 1 datawidnow --//

datawindow			ldw_main

ldw_main = iw_display.dynamic f_get_dwmain()
ipo_tv.istr_tv.db_id = ldw_main.getitemnumber( ldw_main.getrow(), 'ID')
ipo_tv.istr_tv.s_label =  ldw_main.getitemstring( ldw_main.getrow(), vs_label_col)
ipo_tv.istr_tv.i_pic_idx = 0
ipo_tv.istr_tv.i_sel_pic_idx = 1
return 0


end function

public function string f_get_relatedtext ();
return istr_data_related[1].s_text
end function

public function integer f_set_dwo_structure (s_str_dwo vstr_dwo[]);
istr_dwo[] = vstr_dwo[]
return 1
end function

public function integer f_set_related_object (powerobject vpo_related[]);ipo_related[] = vpo_related[]
return 1
end function

public function integer f_get_dwo_tabpage (ref s_str_dwo_tabpage rstr_dwo_tabpage[]);rstr_dwo_tabpage[] = iastr_dwo_tabpage[]
return upperbound(rstr_dwo_tabpage[])
end function

public function boolean f_get_ib_changed_dwo_4edit ();return ib_changed_dwo_4edit
end function

public function long f_filter_criteria_of_book (string vs_book_id);string ls_filter
if vs_book_id <> '' then
	ls_filter = 'record_access_line_object_ref_id = '+vs_book_id
else
	ls_filter = ''
end if
	ids_book.setfilter( ls_filter)
	ids_book.filter( )
return ids_book.rowcount()
end function

public function integer f_set_criteria_of_book ();long 				ll_idx,ll_idx1
int					li_rtn
string 			las_dwcolumns[] , las_criteria_of_dwcolumns[],ls_criteria_of_column,ls_EditStyle,ls_colname
string				ls_source_value,las_source_values[],ls_dataobject
datawindow 	ldw_main
window			lw_parent
c_string			lc_string

ls_dataobject = this.f_get_main_dwo( )
if mid(ls_dataobject,1,len(ls_dataobject)-5) = 'd_object_book' then
	lw_parent = iw_display.dynamic f_getparentwindow()
	ldw_main = lw_parent.dynamic f_get_dwmain()
else
	ldw_main = iw_display.dynamic f_get_dwmain()
end if
for ll_idx=1 to ids_book.rowcount( )
	ls_colname = ids_book.getitemstring( ll_idx, 'dwcolumn')
	ls_criteria_of_column = ids_book.getitemstring( ll_idx, 'criteria')
	ls_EditStyle = ldw_main.describe( ls_colname + '.edit.style')
	if ls_EditStyle = 'ddlb' then
		ls_source_value = ldw_main.describe(ls_colname+ '.values')
		ls_source_value = lc_string.f_globalreplace( ls_source_value, '~t', ';')
		li_rtn = lc_string.f_stringtoarray(ls_source_value,'/',las_source_values[])
		for ll_idx1 = 1 to li_rtn
			if match(lower(las_source_values[ll_idx1]),lower(ls_criteria_of_column)+';') then
				ls_criteria_of_column = mid(las_source_values[ll_idx1],pos(las_source_values[ll_idx1],';') + 1)
				exit
			end if
		next
	end if
	las_dwcolumns[upperbound(las_dwcolumns)+1] = ls_colname
	las_criteria_of_dwcolumns[upperbound(las_criteria_of_dwcolumns)+1] = ls_criteria_of_column
next
is_dwcolumn_books = las_dwcolumns
is_criteria_of_dwcolumn_books = las_criteria_of_dwcolumns
return upperbound(las_criteria_of_dwcolumns)
end function

public function integer f_set_data_related (s_str_dwo_related vstr_data_related[]);istr_data_related = vstr_data_related

return 1
end function

public function integer f_get_criteria_of_book (ref string rs_dwcolumns[], ref string rs_criteria_of_dwcolumns[]);rs_dwcolumns[] = is_dwcolumn_books[] 
rs_criteria_of_dwcolumns[] = is_criteria_of_dwcolumn_books[] 

return upperbound(rs_criteria_of_dwcolumns)
end function

public function integer f_book (double vdb_book_id, boolean vb_modify);string 			ls_sql,ls_dataobject,ls_syntaxSql,ls_err,ls_filter,ls_obj, las_dwcolumns[], las_criteria_of_dwcolumns[]
//t_transaction 	lt_transaction
long				ll_cnt
double			ldb_book_id
datawindow		ldw_main,ldw_main_parent
window			lw_parent
b_obj_instantiate	lbo_ins

//--nếu lần đầu mở window thì lấy ID sổ mặc định để retrieve--//
//if gi_userid = 0 then return 0
ldw_main = iw_display.dynamic f_get_dwmain()
ls_dataobject = ldw_main.dataobject
ls_dataobject = mid(ls_dataobject,1,len(ls_dataobject)-5)
ls_obj = this.classname( )
if left(ls_obj,2) = 'u_' then ls_obj = upper(ls_obj)

if not this.iw_display.ib_opening then
	connect using it_transaction;
end if
//if lbo_ins.f_is_branch_yn_ex( ls_obj, it_transaction) then
	if vdb_book_id = 0 then   // -- lấy default book --//
		select count(db.ID) into :ll_cnt
			from	record_access_hdr rah join default_book db on db.object_ref_id = rah.id
			where db.default_yn = 'Y' and db.user_id = :gi_userid
					and rah.dwo = :ls_dataobject
					and rah.object = :ls_obj
					using it_transaction;							
		if ll_cnt = 0 then
			select count(ID) into :ll_cnt
			from	record_access_hdr
			where default_yn = 'Y'
					and dwo = :ls_dataobject and object = :ls_obj using it_transaction;		
			if ll_cnt = 0 then
				is_dwcolumn_books[] = las_dwcolumns[]
				is_criteria_of_dwcolumn_books[] = las_criteria_of_dwcolumns[]
				return 0
			elseif  ll_cnt = 1 then
				select ID into :ldb_book_id
				from	record_access_hdr
				where default_yn = 'Y'
						and dwo = :ls_dataobject and object = :ls_obj using it_transaction;						
			elseif  ll_cnt > 1 then
				select ID into :ldb_book_id
				from	record_access_hdr
				where default_yn = 'Y'
						and dwo = :ls_dataobject and object = :ls_obj and rownum = 1
						using it_transaction;					
			end if
		elseif ll_cnt = 1 then
			select  rah.id into :ldb_book_id
			from	record_access_hdr rah join default_book db on db.object_ref_id = rah.id
			where db.default_yn = 'Y' and db.user_id = :gi_userid
					and rah.dwo = :ls_dataobject
					and rah.object = :ls_obj
					using it_transaction;				
		elseif ll_cnt > 1 then
				select  rah.id into :ldb_book_id
			from	record_access_hdr rah join default_book db on db.object_ref_id = rah.id
			where db.default_yn = 'Y' and db.user_id = :gi_userid
					and rah.dwo = :ls_dataobject
					and rah.object = :ls_obj
					and rownum=1
					using it_transaction;			
		end if
	else
		ldb_book_id = vdb_book_id
	end if	


//--tạo ids_book nếu datastore chưa được tạo--//
if not isvalid(ids_book) then

	ids_book = create t_ds_db
	ids_book.dataobject = 'ds_book'
	ids_book.settransobject( it_transaction)
	ids_book.retrieve( ldb_book_id)
	f_set_criteria_of_book()

else 
//	if vb_modify then ids_book.retrieve(ldb_book_id )
	ids_book.settransobject( it_transaction)
	ids_book.retrieve(ldb_book_id )
	f_set_criteria_of_book()

end if
if not this.iw_display.ib_opening then
	disconnect using it_transaction;
end if
return upperbound(is_criteria_of_dwcolumn_books)
end function

public function integer f_get_data_related (ref s_str_dwo_related rstr_data_related[]);
rstr_data_related[] = istr_data_related[]
return upperbound(rstr_data_related)
end function

public subroutine f_set_oringinal_size (integer vi_width, integer vi_height);iw_display.windowstate = normal!
iw_display.width = vi_width
iw_display.height = vi_height

end subroutine

public function string f_get_object_table ();return is_table
end function

public function string f_get_ruleobject_column ();return is_ruleobject_column
end function

public function boolean f_get_ib_display_text ();return ib_display_text


end function

public function integer f_get_data_related (string vs_related_objname, ref s_str_dwo_related rstr_data_related[]);
int							li_idx, li_objCount

li_objCount = upperbound(istr_dwo_related[])
FOR li_idx = 1 to li_objCount
	if istr_dwo_related[li_idx].s_related_obj_name = vs_related_objname or istr_dwo_related[li_idx].s_related_obj_dwo = vs_related_objname or istr_dwo_related[li_idx].s_related_obj_replace_dwo = vs_related_objname then
		rstr_data_related[upperbound(rstr_data_related)+1] = istr_dwo_related[li_idx]
		if istr_dwo_related[li_idx].s_related_obj_name = 'b_view' then exit
	end if
NEXT

return upperbound(rstr_data_related[])
end function

public function integer f_find_related_object (ref s_object_display rpo_found, string vs_objname, integer vi_tp_index);
int			li_idx , li_objCnt, li_rtn
li_objCnt = upperbound(this.ipo_related[])
if li_objCnt = 0 then return 0
FOR li_idx =1 to li_objCnt
	if this.ipo_related[li_idx].classname() = vs_objname and this.ipo_related[li_idx].ii_tp_index = vi_tp_index then
		rpo_found = this.ipo_related[li_idx]
		return 1
	else
		if upperbound(this.ipo_related[li_idx].ipo_related[]) > 0 then
			li_rtn = this.ipo_related[li_idx].f_find_related_object(rpo_found, vs_objname, vi_tp_index)
			if li_rtn = 1 then return 1
		else
			continue
		end if
	end if
NEXT
return 0
end function

public function integer f_renew_tabidx_related_object (string vs_objname, integer vi_old_tp_index, integer vi_new_tp_index);
int			li_idx , li_objCnt, li_rtn
li_objCnt = upperbound(this.ipo_related[])
if li_objCnt = 0 then return 0
FOR li_idx =1 to li_objCnt
	if this.ipo_related[li_idx].classname() = vs_objname and this.ipo_related[li_idx].ii_tp_index = vi_old_tp_index then		
		this.ipo_related[li_idx].ii_tp_index = vi_new_tp_index
		return 1
	else
		if upperbound(this.ipo_related[li_idx].ipo_related[]) > 0 then
			li_rtn = this.ipo_related[li_idx].f_renew_tabidx_related_object(vs_objname, vi_old_tp_index, vi_new_tp_index)
			if li_rtn = 1 then return 1
		else
			continue
		end if
	end if
NEXT
return 0
end function

public function integer f_renew_tabidx_object (string vs_objname, integer vi_old_tp_index, integer vi_new_tp_index);
int							li_idx , li_objCnt, li_rtn
s_object_display 		lpo_main

if this.classname( ) = vs_objname and this.ii_tp_index = vi_old_tp_index  then
	this.ii_tp_index = vi_new_tp_index
	return 1
end if
li_rtn = this.f_renew_tabidx_main_object(lpo_main,vs_objname, vi_old_tp_index, vi_new_tp_index)
if li_rtn = 1 then
	return 1
else
	li_rtn = lpo_main.f_renew_tabidx_related_object( vs_objname,vi_old_tp_index, vi_new_tp_index)
	if li_rtn = 1 then 
		return 1
	end if
end if
return 0
end function

public function integer f_renew_tabidx_main_object (ref s_object_display rpo_main, string vs_objname, integer vi_old_tp_index, integer vi_new_tp_index);
int						li_idx , li_objCnt, li_rtn

if not isvalid(this.ipo_main) then 
	rpo_main = this
	return 0
end if
DO while isvalid(this.ipo_main) 
	if this.ipo_main.classname() = vs_objname and this.ipo_main.ii_tp_index = vi_old_tp_index then
		this.ipo_main.ii_tp_index = vi_new_tp_index
		return 1
	else
		rpo_main = this.ipo_main
		return rpo_main.f_renew_tabidx_main_object(rpo_main, vs_objname, vi_old_tp_index, vi_new_tp_index)
	end if
LOOP
return 0

end function

public subroutine f_set_str_unit ();
end subroutine

public function long f_get_str_unit (ref s_str_unit rs_str_unit[]);rs_str_unit[] = istr_unit[]

return upperbound(rs_str_unit[])
end function

public function integer f_get_setup_objectname (ref string rs_objectname);return 0
end function

public function integer f_get_data_related (datastore vds_dwsetup, ref s_str_dwo_related rstr_data_related[], ref s_object_display rod_handling);boolean			lb_continue
string				ls_dwo, ls_setup_objname, ls_dwdatatype, ls_criteria,ls_appli_id
int					li_idx
any				la_data[]
t_ds_db		lds_dwobject

ls_dwdatatype = vds_dwsetup.getitemstring(1, 'dwdatatype') 

FOR li_idx = 1 to vds_dwsetup.rowcount()	
	if ls_dwdatatype = 'valueset' or ls_dwdatatype = 'dwo'  then
		lb_continue = false
		if this.classname() = 'u_valueset' or rod_handling.classname() = 'u_valueset' then
			if this.classname() = 'u_valueset' then rstr_data_related[li_idx].s_related_obj_name  =  'u_valueset'
			if rod_handling.classname() = 'u_valueset' then rstr_data_related[li_idx].s_related_obj_name  = rod_handling.classname()
			//--kiểm tra role/user áp dụng của điều kiện phụ thuộc--// 
			ls_appli_id = vds_dwsetup.getitemstring(li_idx,'applicable_ref_id_string')
			if not isnull(ls_appli_id) or trim(ls_appli_id) <> '' then
				if this.classname() = 'u_valueset' then
					if not this.dynamic f_is_user_appli(gi_userid,ls_appli_id) then lb_continue = true
//						ls_dwo = vds_dwsetup.getitemstring(li_idx, 'object_ref_code')
//						if left(ls_dwo, 2) = 'd_' then	ls_dwo += '_grid'			
//						rstr_data_related[li_idx].s_related_obj_dwo =ls_dwo
//						continue
//					end if
				else
					if not rod_handling.dynamic f_is_user_appli(gi_userid,ls_appli_id) then lb_continue = true
				end if
			end if			
		else
			rstr_data_related[li_idx].s_related_obj_name  = rod_handling.classname()
		end if

		ls_dwo = vds_dwsetup.getitemstring(li_idx, 'object_ref_code')
		if left(ls_dwo, 2) = 'd_'  then ls_dwo += '_grid'		// kieem tra them neu dw ko co grid thi phai  + _form
		if left(ls_dwo, 3) = 'dp_' then ls_dwo += '_form'	

		rstr_data_related[li_idx].s_related_obj_dwo =ls_dwo
		rstr_data_related[li_idx].s_related_obj_column = vds_dwsetup.getitemstring(li_idx, 'dwvalueset_related_column')
		if lb_continue then continue
		
		ls_dwo = vds_dwsetup.getitemstring(li_idx, 'dwobject_main')
		if ls_dwo = 'd_struct_popup' then
			rstr_data_related[li_idx].s_uprow_column = 'depend_uprow_yn'	
			ls_dwo = 'd_struct_popup_form'
		else
			if left(ls_dwo, 2) = 'd_' then ls_dwo += '_grid'
			if left(ls_dwo, 3) = 'dp_' then ls_dwo += '_form'
		end if
		
		rstr_data_related[li_idx].s_main_obj_dwo = ls_dwo	

		rstr_data_related[li_idx].s_criteria_type =  vds_dwsetup.getitemstring(li_idx, 'criteria_type')
		if rstr_data_related[li_idx].s_criteria_type = 'fixed' or isnull(rstr_data_related[li_idx].s_criteria_type) then
			ls_criteria = vds_dwsetup.getitemstring(li_idx, 'dwobject_main_value')
			if ls_criteria <> '' and not isnull(ls_criteria) then rstr_data_related[li_idx].s_data[1] = ls_criteria
		elseif  rstr_data_related[li_idx].s_criteria_type = 'objname' then
			if rod_handling.f_get_setup_objectname( ls_setup_objname) <> -1 then
				rstr_data_related[li_idx].s_data[1] =ls_setup_objname
			else
				return -1
			end if
		elseif rstr_data_related[li_idx].s_criteria_type = 'dwo' then
			rstr_data_related[li_idx].s_data[1] =ls_dwo
		else
			rstr_data_related[li_idx].s_main_obj_column = vds_dwsetup.getitemstring(li_idx, 'dwobject_main_column')	
		end if
	elseif  ls_dwdatatype = 'STRUCT_SEGMENT' then
		rstr_data_related[li_idx].s_related_obj_name  = rod_handling.classname()
		rstr_data_related[li_idx].s_related_obj_dwo ='d_struct_popup_form'
		rstr_data_related[li_idx].s_related_obj_column = 'object_ref_id'
		rstr_data_related[li_idx].s_uprow_column = 'depend_uprow_yn'
		rstr_data_related[li_idx].s_criteria_type =  vds_dwsetup.getitemstring(li_idx, 'criteria_type')
		rstr_data_related[li_idx].s_data[1] = string(vds_dwsetup.getitemnumber(li_idx, 'object_ref_id'))
	end if
NEXT

return upperbound(rstr_data_related)
end function

public function datastore f_get_ids_policy_rule ();return ids_policy_rule
end function

public function datastore f_get_ids_policy_security ();return ids_policy_security
end function

public function integer f_init_policy_datastore ();c_menu						lc_menulc_identification_initial
c_identification_initial		lc_identification_initial
c_string						lc_string
any							laa_value[]
string							ls_menu_code, ls_indentification_id, ls_policy_id
int								li_ruleCount
double						ldb_policy_id[], ldb_idkey_id


ldb_idkey_id = lc_identification_initial.f_get_idkey_id( this.f_get_menu_code( ) )
li_ruleCount = g_user.i_rule.f_get_appli_rule_id_union(ldb_policy_id[] , gi_userid, string(ldb_idkey_id), 'policy')

ids_policy_rule = create t_ds_db
ids_policy_rule.dataobject = 'ds_policy_rule'

laa_value[1] = is_menu_code
laa_value[2] = gdb_branch
ids_policy_rule.f_add_where(  'identification_code;branch_id;', laa_value[])
ids_policy_rule.settransobject( sqlca)
ids_policy_rule.retrieve( )

ids_policy_security =  create t_ds_db
ids_policy_security.dataobject = 'ds_policy_security'

laa_value[1] = is_menu_code
lc_string.f_arraytostring( ldb_policy_id[], ';' ,ls_policy_id)
laa_value[2] = '('+ls_policy_id+')'
ids_policy_security.f_add_where('identification_code;object_ref_id;', laa_value[])
ids_policy_security.settransobject( sqlca)
ids_policy_security.retrieve( )

return 1
end function

public function window f_get_wdisplay ();return iw_display

end function

public function integer f_ctrl_actionbuttons (powerobject rpo_control);string					ls_eventname

if rpo_control.typeof() = datawindow! then
	this.event e_action_ctrl_bttn( )
//	ls_eventname = 'e_action_ctrl_' + vs_message
//	return this.triggerevent( ls_eventname)
end if
return 0
end function

public function integer f_display_on_tv (t_tv r_tv, any va_retrieve_arg[5]);transaction		lt_transaction
long 				ll_row, ll_root_hdl
int					li_rtn, li_cnt

//-- xóa treeview để load lại --//
if isvalid(iw_display) then
	iw_display.dynamic f_get_transaction(lt_transaction)
	if isvalid(lt_transaction) then
		istr_tvo[1].ds_tv_item.settransobject( lt_transaction)
	else 
		return -1
	end if
end if
//-- load treeview items--//
li_cnt =  istr_tvo[1].ds_tv_item.retrieve(va_retrieve_arg[1], va_retrieve_arg[2], va_retrieve_arg[3], va_retrieve_arg[4], va_retrieve_arg[5] ) 
if li_cnt = -1 then
	gf_messagebox('m.s_object_display.f_display_on_tv.01','Thông báo',' datastore Không truy vấn được: s_object_display.f_display_on_tv() line:16 (@'+istr_tvo[1].ds_tv_item.dataobject+')','exclamation','ok',1)
	return -1
end if
if li_cnt > 0 then
	FOR ll_row = 1 to li_cnt
		li_rtn = this.f_set_tv_structure( ll_row)
		if li_rtn = 1 then
			if r_tv.dynamic f_find_item_hdl(ipo_tv.f_get_tv_findstring( )) = -1 then
				li_rtn = this.f_insert_tv_item( ipo_tv, r_tv)
			else
				continue
			end if
		else
			return -1
		end if
	NEXT
	ll_root_hdl = r_tv.FindItem(RootTreeItem! , 0)
	r_tv.setredraw(false)
	r_tv.SortAll(ll_root_hdl , userdefinedsort!)
//	r_tv.selectitem(ll_root_hdl)
//	r_tv.expanditem(ll_root_hdl)
	
	r_tv.setredraw(true)	
end if
return li_cnt
end function

public function integer f_display_on_tv (t_tv r_tv, any va_retrieve_arg[5], boolean vb_delete);
//-- xóa treeview để load lại --//
if vb_delete then
	r_tv.dynamic f_delete_all_items()
end if
return this.f_display_on_tv( r_tv, va_retrieve_arg[5])

end function

public function integer f_insert_tv_item (double vdb_id, t_tv r_tv);int					li_rtn
double			ldb_ID

if vdb_id < 1 then return -1
if not isvalid(r_tv) then return -1

if this.f_set_tv_structure( vdb_id) = 1 then
	li_rtn = r_tv.dynamic f_populate_item(ipo_tv)
	if li_rtn = 1 then
		return 1
	else
		ldb_ID = double(ipo_tv.f_get_tv_parentstring( ))
		if ldb_ID > 0 then
			li_rtn = this.f_insert_tv_item( ldb_id, r_tv)
			if li_rtn = 1 then return 1
		else
			return -1
		end if
	end if
else
	return -1
end if
return 1
end function

public function integer f_insert_tv_item (powerobject vpo_tv, t_tv r_tv);int				li_rtn
double		ldb_id

li_rtn =  r_tv.dynamic f_populate_item(vpo_tv)
if li_rtn = -1 then
	ldb_id = double(ipo_tv.f_get_tv_parentstring( ))
	if ldb_id > 0 then
		li_rtn = this.f_insert_tv_item( ldb_id, r_tv)
	end if
end if
return li_rtn
end function

public function integer f_set_popupmenu (ref t_m_popup rm_menu, string vs_menu_name);//c_ds_lang lds_lang_text
long 							ll_item, ll_i, li_itemCnt
string 							ls_arr_cbname[], ls_text, ls_menu_code, ls_idkey_code, ls_dwobject
c_obj_service				lc_obj_service
datawindow					ldw_handle
s_str_policy_attr			lstr_policy_attr

//-- set menu language --//
if gs_user_lang <> 'vi-vn' then
	t_w_mdi.ids_lang_text.f_set_menu_lang(rm_menu)
end if

//-- show menu item --//
lc_obj_service.f_stringtoarray( vs_menu_name, ';', ls_arr_cbname)
li_itemCnt = UpperBound(rm_menu.item)
FOR ll_item = 1 to li_itemCnt
	for ll_i = 1 to upperbound(ls_arr_cbname)		
		if rm_menu.item[ll_item].classname() = ls_arr_cbname[ll_i] then

			if  ls_arr_cbname[ll_i] = 'm_close_object' then
				ls_text = t_w_mdi.ids_lang_text.f_get_lang_text( rm_menu.dynamic f_get_object_name() )
				if ls_text = '' then 	ls_text = rm_menu.dynamic f_get_object_name()
				rm_menu.item[ll_item].text = 'Đóng ' +ls_text
			end if
			if gi_userid > 0 then
				if rm_menu.ipo_clicked.typeOf() = datawindow! then
					ldw_handle = rm_menu.ipo_clicked
					ls_dwobject = ldw_handle.dataobject
					if left(ls_dwobject,9) <> 'd_action_' then ls_dwobject = left(ls_dwobject,len(ls_dwobject)-5)
					ls_idkey_code = is_menu_code+ '.' + ls_dwobject +'.'+ ls_arr_cbname[ll_i]
					g_user.i_rule.f_get_attribute_rule_dwctrl( ls_idKey_code, ids_policy_rule, iw_display, lstr_policy_attr)
					if lstr_policy_attr.b_access then
						g_user.i_rule.f_get_attribute_rule_dwctrl( ls_idKey_code, ids_policy_security, iw_display, lstr_policy_attr)
					end if	
					rm_menu.item[ll_item].visible =  lstr_policy_attr.b_access	
					continue
				end if	
			end if
			rm_menu.item[ll_item].visible = true		
		end if
	next
NEXT

return 1 
end function

public function integer f_set_menu_code (string vs_menu_code);//-- Set biến lưu trữ menu code của menu gọi đối tượng kiểu string --//
this.is_menu_code =vs_menu_code

return 1
end function

public function string f_get_menu_code ();
if is_menu_code = '' then
	is_menu_code = this.classname( )
end if
return is_menu_code
end function

public function integer f_get_str_report (ref s_str_report rs_str_report);rs_str_report = istr_report
return 1
end function

public function integer f_close_object (string vs_objname, integer vi_tap_index);
s_tp_actionpane		ltp_actionpane_cur, ltp_actionpane_change
s_str_actionpane		lstr_actionpane
s_object_display		lpo_close, lpo_change, lpo_related[], lpo_rearrange_related[]
c_obj_service			lc_obj_service
t_t							ltab_action
int							li_idx
boolean					lb_start_arrange


if this.f_find_object(lpo_close,  vs_objname, vi_tap_index) = 1 then
		
	//-- quay ve main object --//
	lpo_change = lpo_close.f_get_main_object()
	//-- chuyen actionpane --//
	ltab_action = iw_display.dynamic f_get_tab_action()
	ltab_action.dynamic event e_change_actionpane(lpo_change )
	iw_display.dynamic event e_change_object(lpo_change )
	//-- Đóng các object related --//
	destroy lpo_close	
	ltp_actionpane_cur = ltab_action.control[vi_tap_index]
	ltab_action.closetab( ltp_actionpane_cur)		
	//-- remove related object ra khoi array --//
	lpo_change.f_get_related_object(lpo_related[])
	lc_obj_service.f_rearrange_array(lpo_related[] , lpo_rearrange_related[])
	lpo_change.f_set_related_object(lpo_rearrange_related[])
	
	//-- rearrane tab và select tab khác--//
	FOR li_idx = 1 to upperbound(ltab_action.control)
		ltp_actionpane_change = ltab_action.control[li_idx]
		lstr_actionpane = ltp_actionpane_change.f_get_actionpane_structure( )
		if lb_start_arrange = true then
			if lpo_change.f_renew_tabidx_object(lstr_actionpane.s_objname_handling , lstr_actionpane.i_tp_index, li_idx) = 1 then
				lstr_actionpane.i_tp_index = li_idx
				ltp_actionpane_change.f_set_actionpane_structure( lstr_actionpane)
			end if
		end if			
		if  lstr_actionpane.s_objname_handling = lpo_change.classname( ) and lstr_actionpane.i_tp_index =lpo_change.ii_tp_index &
			and lstr_actionpane.s_dwo_action = 'd_action_edit' then
			ltab_action.selecttab(li_idx )
			lb_start_arrange = true
		end if

	NEXT
end if
return 1
end function

public function integer f_handle_message (ref datawindow rdw_requester, ref long vl_currentrow, string vs_colname, string vs_message);choose case vs_message
	case 'clicked'
		return this.event e_dw_clicked(rdw_requester, vl_currentrow, vs_colname)		
	case 'buttoncliked'
		return this.event e_dw_buttonclicked( rdw_requester, vl_currentrow, vs_colname)				
	case 'e_doubleclicked'
		return this.event e_dw_e_doubleclicked( rdw_requester, vl_currentrow, vs_colname)
end choose
return 0

end function

public subroutine f_set_actionpane (s_str_actionpane vstr_actionpane[]);istr_actionpane[] = vstr_actionpane[]
end subroutine

public function decimal f_get_exchange_rate (string vs_cur_code, date vd_trans_date);c_unit_instance	lc_unit
c_string				lc_string
double				ldb_cur_id
decimal				ldc_buy_rate,ldc_sell_rate

ldb_cur_id = lc_unit.f_get_id( vs_cur_code)
if ldb_cur_id > 0 then
	if lc_unit.f_is_unit_standard( ldb_cur_id) then
		return 1
	end if
	select exchange_rate.buy_rate,exchange_rate.sell_rate into :ldc_buy_rate,:ldc_sell_rate
    from exchange_rate
    where exchange_rate.object_ref_id = :ldb_cur_id
	 		and exchange_rate.trans_date = (
			 select max(exchange_rate.trans_date)
			 from exchange_rate
			 where trunc(exchange_rate.trans_date) <= trunc(:vd_trans_date) and exchange_rate.object_ref_id = :ldb_cur_id) using SQLCA;
	 if SQLCA.sqlcode = 0 then
		if trim(lower(is_exrate_type)) = 'buy' then
			return ldc_buy_rate
		elseif trim(lower(is_exrate_type)) = 'sell' then
			return ldc_sell_rate
		else
			//--Chưa set biến is_exrate_type trong contructor của object--//
			messagebox('Lỗi','s_object_display.f_get_exchange_rate(line:24)')
		end if
	elseif SQLCA.sqlcode = 100 then
		gf_messagebox('m.s_object_display.f_get_exchange_rate.01','Thông báo','Chưa cài đặt tỷ giá cho @'+vs_cur_code,'exclamation','ok',1)
		return 0
	else
		//--Lỗi database--//
		messagebox('Lỗi','s_object_display.f_get_exchange_rate(line:31)')
		return 0
	end if
else
	//--không lấy đc id của loai tiền--//
	messagebox('Lỗi','s_object_display.f_get_exchange_rate(line:)')
end if
return 0
end function

public function boolean f_get_ib_copying ();return ib_copying


end function

public subroutine f_set_ib_copying (boolean vb_copying);ib_copying = vb_copying
end subroutine

public function integer f_get_colname_exchange_rate (datawindow vdw_object, string vs_colname_object, ref string rs_colname_cur, ref string rs_colname_exc);s_str_unit		lstr_unit[]
c_string			lc_string
string				las_dwo_unit[],las_column_unit[]
int					li_count,li_idx

li_count = this.f_get_str_unit( lstr_unit[])
if li_count = 0 then return 0
for li_idx = 1 to li_count
	lc_string.f_stringtoarray( lstr_unit[li_idx].s_colname_unit , ';', las_column_unit)
	lc_string.f_stringtoarray( lstr_unit[li_idx].s_dwo_unit , ';', las_dwo_unit) 
	if mid(las_dwo_unit[4],1,len(las_dwo_unit[4])-5) = mid(vdw_object.dataobject,1,len(vdw_object.dataobject)-5) &
		and pos(vs_colname_object+';',las_column_unit[4]+';') > 0 then 
		rs_colname_cur = las_column_unit[4]
		rs_colname_exc = las_column_unit[5]
		return 1
	end if
next
return 0
end function

public function integer f_delete_matching (datawindow vdw_deleting, long vl_del_row);return 0
end function

public function datawindow f_get_dw_print ();datawindow  ldw_temp

setnull(ldw_temp)
return ldw_temp
end function

public function integer f_find_main_object (ref s_object_display rpo_found, string vs_objname, integer vi_tp_index);
int						li_idx , li_objCnt, li_rtn

if not isvalid(this.ipo_main) then 
	rpo_found = this
	return 0
end if
DO while isvalid(this.ipo_main) 
	if this.ipo_main.classname() = vs_objname and this.ipo_main.ii_tp_index = vi_tp_index then
		rpo_found = this.ipo_main
		return 1
	else	
		rpo_found = this.ipo_main
		return this.ipo_main.f_find_main_object( rpo_found, vs_objname, vi_tp_index)
	end if
LOOP
return 0

end function

public function integer f_find_object (ref s_object_display rpo_found, string vs_objname, integer vi_tp_index);
int							li_idx , li_objCnt, li_rtn
s_object_display 		lpo_found

if this.classname( ) = vs_objname and this.ii_tp_index = vi_tp_index  then
	rpo_found = this
	return 1
end if
li_rtn = this.f_find_main_object( lpo_found, vs_objname, vi_tp_index)
if li_rtn = 1 then
	rpo_found = lpo_found
else
	li_rtn = lpo_found.f_find_related_object( lpo_found, vs_objname,vi_tp_index)
	if li_rtn = 1 then 
		rpo_found = lpo_found
	end if
end if
return li_rtn
end function

public function s_object_display f_get_main_object ();return ipo_main 
end function

public function integer f_set_suspend_data (t_dw_mpl vdw_suspend);string	ls_current_where, ls_sql
int		li_idx

FOR li_idx = 1 to upperbound(istr_dwo[])
	if vdw_suspend.dataobject =istr_dwo[li_idx].s_dwo_grid or vdw_suspend.dataobject =istr_dwo[li_idx].s_dwo_form then
		if not isvalid(istr_dwo[li_idx].ds_suspend_data) then istr_dwo[li_idx].ds_suspend_data = create datastore
		istr_dwo[li_idx].ds_suspend_data.dataobject = vdw_suspend.dataobject
		istr_dwo[li_idx].s_suspend_originalwhere = vdw_suspend.is_originalwhereClause
//		vdw_suspend.f_getCurrentSQL(ls_sql, ls_current_where)
		istr_dwo[li_idx].s_suspend_sqlnowhere = ls_sql		
		istr_dwo[li_idx].s_suspend_where = ls_current_where	
		istr_dwo[li_idx].s_where_query_mode=vdw_suspend.is_where_query_mode //giu lay where tim kiem truoc khi change object
		istr_dwo[li_idx].b_suspend_editing = vdw_suspend.dynamic f_get_ib_editing()
		istr_dwo[li_idx].str_suspend_rule_attr = vdw_suspend.dynamic f_get_rule_attr()
		istr_dwo[li_idx].str_suspend_security_attr = vdw_suspend.dynamic f_get_security_attr()
		istr_dwo[li_idx].c_suspend_querymode = vdw_suspend.inv_querymode
		istr_dwo[li_idx].c_suspend_sort = vdw_suspend.inv_sort
		
//		vdw_suspend.rowscopy( 1, vdw_suspend.rowcount( ) , primary!, istr_dwo[li_idx].ds_suspend_data, 1, primary!)
//		vdw_suspend.rowscopy( 1, vdw_suspend.filteredcount() , filter!, istr_dwo[li_idx].ds_suspend_data, 1, filter!)
		return istr_dwo[li_idx].ds_suspend_data.resetupdate()
	end if
NEXT
return 0
end function

public function integer f_set_suspend_data_tab (t_dw_mpl vdw_suspend);string	ls_current_where, ls_sql
int			li_idx1, li_idx2


FOR li_idx1 = 1 to upperbound(iastr_dwo_tabpage[])
	FOR li_idx2 = 1 to upperbound(iastr_dwo_tabpage[li_idx1].str_dwo[])
		if vdw_suspend.dataobject = iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].s_dwo_grid &
			or vdw_suspend.dataobject = iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].s_dwo_form &
			then
			if not isvalid(iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].ds_suspend_data) then iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].ds_suspend_data = create datastore
			iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].ds_suspend_data.dataobject = vdw_suspend.dataobject
			iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].s_suspend_originalwhere = vdw_suspend.is_originalwhereClause
//			vdw_suspend.f_getCurrentSQL(ls_sql, ls_current_where)
			iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].s_suspend_sqlnowhere = ls_sql				
			iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].s_suspend_where = ls_current_where		
			iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].b_suspend_editing = vdw_suspend.dynamic f_get_ib_editing()
			iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].str_suspend_rule_attr = vdw_suspend.dynamic f_get_rule_attr()
			iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].str_suspend_security_attr = vdw_suspend.dynamic f_get_security_attr()			
			iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].c_suspend_querymode = vdw_suspend.inv_querymode
			iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].c_suspend_sort = vdw_suspend.inv_sort
			
//			vdw_suspend.rowscopy( 1, vdw_suspend.rowcount( ) , primary!,iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].ds_suspend_data, 1, primary!)	
//			vdw_suspend.rowscopy( 1, vdw_suspend.filteredcount( ) , filter!,iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].ds_suspend_data, 1, filter!)	
			return iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].ds_suspend_data.resetupdate()
		end if		
	NEXT
NEXT
return 0
end function

public subroutine f_set_str_streamvalue ();
end subroutine

public function long f_get_str_streamvalue (ref s_str_streamvalue rs_str_streamvalue[]);rs_str_streamvalue[] = istr_streamvalue[]

return upperbound(rs_str_streamvalue[])
end function

public function integer f_resize_fixedpart_grid ();
return 0
end function

public function integer f_resize_fixedpart_form ();
return 0
end function

public function integer f_reset_fixedpart_grid ();
return 0
end function

public function t_ds_db f_get_ids_matching ();t_ds_db	lds_temp
return lds_temp
end function

public function integer f_get_currency_exrate_of_doc (ref double rdb_currency_id, ref decimal rdc_exrate);s_str_unit		lstr_unit[]
c_unit_instance	lc_unit
c_string			lc_string
t_dw_mpl			ldw_exchange_rate
string				las_dwo_unit[],las_column_unit[], ls_cur_code
int					li_count,li_idx, li_rtn



li_count = this.f_get_str_unit( lstr_unit[])
if li_count = 0 then return 0
for li_idx = 1 to li_count
	lc_string.f_stringtoarray( lstr_unit[li_idx].s_colname_unit , ';', las_column_unit)
	li_rtn = lc_string.f_stringtoarray( lstr_unit[li_idx].s_dwo_unit , ';', las_dwo_unit) 
	if li_rtn < 5 then
		gf_messagebox('m.s_object_display.01','Thông báo','Chưa khai báo dw và cột tỷ giá trong structure','exclamation','ok',1)
		return -1
	end if
	if las_dwo_unit[4] = '' or isnull(las_dwo_unit[4]) then
		gf_messagebox('m.s_object_display.01','Thông báo','Chưa khai báo dw và cột tỷ giá trong structure','exclamation','ok',1)
		return -1		
	end if
	
	ldw_exchange_rate = this.iw_display.dynamic f_get_dw(las_dwo_unit[4])
	if isnull(ldw_exchange_rate) or not isvalid(ldw_exchange_rate) then
		gf_messagebox('m.s_object_display.02','Thông báo','Không tìm thấy DW tỷ giá được khai báo trong structure','exclamation','ok',1)
		return -1				
	end if
	ls_cur_code = ldw_exchange_rate.getitemstring(ldw_exchange_rate.getrow( ) ,las_column_unit[4] )
	if isnull(ls_cur_code) or ls_cur_code = '' then
		gf_messagebox('m.s_object_display.03','Thông báo','Chưa nhập loại tiền','exclamation','ok',1)
		return -1			
	end if
	rdb_currency_id = lc_unit.f_get_id( ls_cur_code)
	rdc_exrate = ldw_exchange_rate.getitemnumber(ldw_exchange_rate.getrow( ) ,las_column_unit[5] )
	return 1
next
return 0
end function

public function boolean f_chk_qty_matching (s_str_dwo_related vastr_dwo_related[]);return true
end function

public subroutine f_set_istr_actionpane (s_str_actionpane vstr_actionpane[]);istr_actionpane[] = vstr_actionpane[]
end subroutine

public function integer f_get_istr_actionpane (ref s_str_actionpane rstr_actionpane[]);rstr_actionpane[] = istr_actionpane[]
return upperbound(rstr_actionpane)
end function

public subroutine f_get_resize_wdisplay (ref integer ri_width, ref integer ri_height);ri_width = ii_wdisplay_width
ri_height = ii_wdisplay_height
end subroutine

public subroutine f_set_resize_wdisplay (integer vi_width, integer vi_height);ii_wdisplay_width = vi_width 
ii_wdisplay_height = vi_height
end subroutine

public function integer f_get_dw_policy_attr (t_dw vdw_handle, ref s_str_policy_attr rstr_rule_attr[], ref s_str_policy_attr rstr_security_attr[], ref string rsa_attr_name[]);string					ls_idKey_code, ls_filterStr, ls_bttn_name
int						li_idx, li_rtn, li_idx2
double				ldb_business_rule_id, ld_policy_id
boolean				lb_ok

s_str_policy_attr 	lstr_rule_attr, lstr_security_attr, lstr_security_attr_union
c_string				lc_string

if gi_userid > 0 and isvalid(this.ids_policy_rule)  then
	//-- filter rule for column --//
	//--nếu muốn gộp 2 đối tượng khai báo ở 2 phân hệ khác nhau(VD: u_goods_delivery và u_goods_delivery@delivery_2) thì dùng this.classname() thay cho is_menu_code--//
	if left(vdw_handle.dataobject, 8) <>'d_action' then
		ls_idKey_code = is_menu_code+'.'+ left(vdw_handle.dataobject, len(vdw_handle.dataobject) - 5) +'.*'
	else
		ls_idKey_code = is_menu_code+'.'+ vdw_handle.dataobject +'.*'
	end if
	ls_filterStr = lc_string.f_get_expression( ls_idKey_code, 'char()', 'identification_code', 'filter')	
	this.ids_policy_rule.setfilter( ls_filterStr)
	this.ids_policy_rule.filter( )
	this.ids_policy_rule.setsort(' identification_code a, ID a' )
	this.ids_policy_rule.sort( )
	
	//-- filter security for column --//
	this.ids_policy_security.setfilter( ls_filterStr)
	this.ids_policy_security.filter( )
	this.ids_policy_security.setsort(' identification_code a, object_ref_id a, ID a' )
	this.ids_policy_security.sort( )
	
	//-- Xét các cột có cài đặt rule --//
	FOR li_idx = 1 to this.ids_policy_rule.rowcount( )
		
		ls_idKey_code = this.ids_policy_rule.getitemstring( li_idx, 'identification_code')
		//-- Kiểm tra cài đặt 1 code nhiều rule sẽ bỏ qua --//
		if li_idx = 1 then
			rsa_attr_name[upperbound(rsa_attr_name)+1] = ls_idKey_code
		else
			if ls_idKey_code <> this.ids_policy_rule.getitemstring( li_idx -1, 'identification_code') then 
				rsa_attr_name[upperbound(rsa_attr_name)+1] = ls_idKey_code
			elseif upperbound(rstr_rule_attr) = upperbound(rsa_attr_name) then 
				continue
			end if
		end if
		//-- kiềm tra rule có applied theo đúng diều kiện ko --//
		lb_ok = g_user.i_rule.f_is_policy_applied( this.ids_policy_rule , li_idx, this.iw_display ) 
		if isnull(lb_ok) then return -1
		if lb_ok then			
			vdw_handle.f_get_policy_attr(this.ids_policy_rule, li_idx, lstr_rule_attr)
			rstr_rule_attr[upperbound(rstr_rule_attr)+1] = lstr_rule_attr
		else
			if ls_idKey_code =  this.ids_policy_rule.getitemstring( li_idx + 1, 'identification_code') then
				continue
			else
				if upperbound(rstr_rule_attr) = upperbound(rsa_attr_name) then continue
				rstr_rule_attr[upperbound(rstr_rule_attr)+1] = vdw_handle.istr_rule_attr
			end if
		end if		
		//-- tìm security của idkey --//
		li_rtn = this.ids_policy_security.find( "identification_code ='" + ls_idKey_code+"'",1, this.ids_policy_security.rowcount( ))
		if li_rtn = 0 then
			rstr_security_attr[upperbound(rstr_security_attr)+1] = vdw_handle.istr_security_attr
		else			
			if this.ids_policy_security.rowcount() > 0 then
			//-- reset giá trị biến --//
				lstr_security_attr_union.b_delete = false
				lstr_security_attr_union.b_insert = false
				lstr_security_attr_union.b_update = false
				lstr_security_attr_union.b_query = false	
				lstr_security_attr_union.b_excel = false
				lstr_security_attr_union.b_print = false
				lstr_security_attr_union.b_access = false
				lstr_security_attr_union.b_full_inherit = false			
				DO WHILE li_rtn > 0 
					if ld_policy_id <> this.ids_policy_security.getitemnumber( li_rtn, 'id') then //-- Bỏ qua trường hợp 1 rule vời 2 điều kiện ràng buộc --//
						ld_policy_id = this.ids_policy_security.getitemnumber( li_rtn, 'id')
						ldb_business_rule_id = this.ids_policy_security.getitemnumber( li_rtn, 'object_ref_id')				
						lb_ok = g_user.i_rule.f_is_policy_applied( this.ids_policy_security, li_rtn, this.iw_display)
						if isnull(lb_ok) then return -1
						if lb_ok then
							vdw_handle.f_get_policy_attr(this.ids_policy_security, li_rtn, lstr_security_attr)
							vdw_handle.f_get_policy_attr_union(lstr_security_attr, lstr_security_attr_union )
						else
							if this.ids_policy_security.rowcount( ) > li_rtn then 
								if ldb_business_rule_id = this.ids_policy_security.getitemnumber( li_rtn + 1, 'object_ref_id') and &
									ld_policy_id <> this.ids_policy_security.getitemnumber( li_rtn +1, 'id') and &
									ls_idKey_code = this.ids_policy_security.getitemstring( li_rtn +1, 'identification_code') then
									li_rtn = li_rtn + 1
									continue // Tìm các cài đặt policy khác cho cùng một role(business_rule_id) và cùng đối tượng (idkey_code)--//
								else
									vdw_handle.f_get_policy_attr_union(vdw_handle.istr_security_attr, lstr_security_attr_union )
								end if
							else
								vdw_handle.f_get_policy_attr_union(vdw_handle.istr_security_attr, lstr_security_attr_union )
							end if
						end if		
					end if
					//-- tìm cài đặt security của các role khác nếu có : kết quả là hợp (OR) của các role --//
					li_rtn = this.ids_policy_security.find( "identification_code ='" + ls_idKey_code+"'",li_rtn+1, this.ids_policy_security.rowcount( )+1)
				LOOP
				ldb_business_rule_id = 0
				ld_policy_id = 0
				rstr_security_attr[upperbound(rstr_security_attr)+1] = lstr_security_attr_union
			else
				rstr_security_attr[upperbound(rstr_security_attr)+1] =vdw_handle.istr_security_attr
			end if
		end if
		
	NEXT
	
	//-- Xét các cột có cài đặt security nhưng không cài đạt rule --//
	li_idx = 1
	IF  this.ids_policy_security.rowcount( ) > 0 then
		DO
			//-- tim nếu rule co roi thi bo qua --//
			ls_idKey_code = this.ids_policy_security.getitemstring( li_idx, 'identification_code')
			li_rtn = this.ids_policy_rule.find(  "identification_code ='" + ls_idKey_code+"'",1, this.ids_policy_rule.rowcount( ))
			if li_rtn  > 0 then
				li_idx++
				continue //-- bỏ qua vì đã xét bên rule --//
			elseif li_rtn = 0 then
				if ls_idKey_code <> this.ids_policy_security.getitemstring( li_idx -1, 'identification_code') then
					rstr_rule_attr[upperbound(rstr_rule_attr)+1] = vdw_handle.istr_rule_attr
					rsa_attr_name[upperbound(rsa_attr_name)+1] = ls_idKey_code
				end if
			else
				gf_messagebox('m.s_object_display.f_get_dw_policy_attr.01','Thông báo','Lỗi tìm kiếm:@'+ "identification_code ='" + ls_idKey_code+"'",'stop','ok',1)
				return -1
			end if
			li_rtn = li_idx
			//-- reset giá trị biến --//
			lstr_security_attr_union.b_delete = false
			lstr_security_attr_union.b_insert = false
			lstr_security_attr_union.b_update = false
			lstr_security_attr_union.b_query = false	
			lstr_security_attr_union.b_excel = false
			lstr_security_attr_union.b_print = false
			lstr_security_attr_union.b_access = false
			lstr_security_attr_union.b_full_inherit = false				
			DO WHILE li_rtn > 0 
				li_idx = li_rtn
				if ld_policy_id <> this.ids_policy_security.getitemnumber( li_rtn, 'id')  then //-- Bỏ qua trường hợp 1 rule vời 2 điều kiện ràng buộc --//
					ld_policy_id = this.ids_policy_security.getitemnumber( li_rtn, 'id')	
					ldb_business_rule_id = this.ids_policy_security.getitemnumber( li_rtn, 'object_ref_id')	
					lb_ok = g_user.i_rule.f_is_policy_applied( this.ids_policy_security, li_rtn, this.iw_display)
					if isnull(lb_ok) then return -1				
					if lb_ok then
						vdw_handle.f_get_policy_attr(this.ids_policy_security, li_rtn, lstr_security_attr)
						vdw_handle.f_get_policy_attr_union(lstr_security_attr, lstr_security_attr_union )
					else
						if this.ids_policy_security.rowcount( ) > li_rtn then
							if ld_policy_id <> this.ids_policy_security.getitemnumber( li_rtn +1, 'id')  and &							
								ldb_business_rule_id = this.ids_policy_security.getitemnumber( li_rtn + 1, 'object_ref_id') and &
								ls_idKey_code = this.ids_policy_security.getitemstring( li_rtn +1, 'identification_code') then
								li_rtn = li_rtn + 1
								continue // Tìm các cài đặt policy khác cho cùng một role(business_rule_id) và cùng đối tượng (idkey_code)--//							
							else
								vdw_handle.f_get_policy_attr_union(vdw_handle.istr_security_attr, lstr_security_attr_union )
							end if
						else
							vdw_handle.f_get_policy_attr_union(vdw_handle.istr_security_attr, lstr_security_attr_union )
						end if
					end if			
				end if
				//-- tìm cài đặt security của các role khác nếu có : kết quả là hợp (OR) của các role--//
				li_rtn = this.ids_policy_security.find( "identification_code ='" + ls_idKey_code+"'",li_rtn+1, this.ids_policy_security.rowcount( )+1)
			LOOP
			if upperbound(rstr_security_attr) < upperbound(rsa_attr_name)  then 
				rstr_security_attr[upperbound(rstr_security_attr)+1] = lstr_security_attr_union
			end if
			ldb_business_rule_id = 0
			li_idx ++
		LOOP WHILE li_idx <= this.ids_policy_security.rowcount( )
	end if
	//-- tra lai filter --//
	this.ids_policy_security.setfilter( '')
	this.ids_policy_security.filter( )
	this.ids_policy_rule.setfilter( '')
	this.ids_policy_rule.filter( )
end if			
return upperbound(rsa_attr_name[])
end function

public function integer f_update_amt_ex_markup_comm_disc (datawindow vdw_line, double vdb_currency_id, integer vi_tax_percent, string vs_include_tax_yn, decimal vdc_exc);c_unit_instance			lc_unit
datawindow				ldw_main
double					ldc_amt_ex,ldc_act_amt_ex,ldc_markup_return,ldc_comm_amt,ldc_markup_amt
double					ldc_base_amt_ex,ldc_act_base_amt_ex,ldc_disc_amt,ldc_qty,ldc_price,ldc_act_price,ldc_price_ex,ldc_act_price_ex
double					ldb_round_id
int							li_idx,li_markup_pct,li_comm_pct,li_disc_pct

ldw_main = iw_display.dynamic f_get_dwmain()
ldb_round_id = lc_unit.f_get_round_id(vdb_currency_id, 0, 'amount')
for li_idx = 1 to vdw_line.rowcount()
	if vdw_line.describe("qty.x") <> '!' then
		ldc_qty = vdw_line.getitemnumber(li_idx,'qty')
		if vdw_line.describe("price.x") <> '!' then
			ldc_price = vdw_line.getitemnumber(li_idx,'price')
			if vdw_line.describe("act_price.x") <> '!' then
				ldc_act_price = vdw_line.getitemnumber(li_idx,'act_price')
			else
				ldc_act_price = 0
			end if
		else
			ldc_price = 0
		end if
	else
		ldc_qty = 0
	end if	
	if vdw_line.describe("PRICE_EX_TAX.x") <> '!' then
		this.f_caculation_ex_tax(ldc_qty,ldc_price,ldc_act_price,vi_tax_percent,vs_include_tax_yn,vdc_exc,vdb_currency_id,ldc_price_ex, ldc_act_price_ex,ldc_amt_ex,ldc_act_amt_ex,ldc_base_amt_ex,ldc_act_base_amt_ex)
		vdw_line.setitem(li_idx,'price_ex_tax',ldc_price_ex)
		vdw_line.setitem(li_idx,'amount_ex_tax',ldc_amt_ex)
		vdw_line.setitem(li_idx,'base_amount_ex_tax',ldc_base_amt_ex)
	end if
	if vdw_line.describe("act_amount_ex_tax.x") <> '!' then
		this.f_caculation_ex_tax(ldc_qty,ldc_price,ldc_act_price,vi_tax_percent,vs_include_tax_yn,vdc_exc,vdb_currency_id,ldc_price_ex, ldc_act_price_ex,ldc_amt_ex,ldc_act_amt_ex,ldc_base_amt_ex,ldc_act_base_amt_ex)
		vdw_line.setitem(li_idx,'act_price_ex_tax',ldc_act_price_ex)
		vdw_line.setitem(li_idx,'act_amount_ex_tax',ldc_act_amt_ex)
		vdw_line.setitem(li_idx,'act_base_amount_ex_tax',ldc_act_base_amt_ex)
	end if
	if vdw_line.describe("comm_pct.x") <> '!' then
		li_comm_pct = vdw_line.getitemnumber(li_idx,'comm_pct')
		if li_comm_pct > 0 then
			this.f_caculation_comm( ldc_act_amt_ex,li_comm_pct, vdb_currency_id,ldc_comm_amt)
			vdw_line.setitem(li_idx,'comm_amt',ldc_comm_amt)
		end if
	end if
	if vdw_line.describe("comm_pct.x") <> '!' then
		li_markup_pct = vdw_line.getitemnumber(li_idx,'markup_pct')
		if li_markup_pct > 0 then
			this.f_caculation_markup(ldc_amt_ex, ldc_act_amt_ex, li_markup_pct,vdb_currency_id,ldc_markup_amt, ldc_markup_return)
				vdw_line.setitem(li_idx,'markup_return',ldc_markup_return)
				vdw_line.setitem(li_idx,'markup_amt',ldc_markup_amt)
		end if
	end if
	if vdw_line.describe("DISC_PCT.x") <> '!' then
		li_disc_pct = vdw_line.getitemnumber(li_idx,'disc_pct')
		if li_disc_pct > 0 then
			this.f_caculation_disc(ldc_act_amt_ex,li_disc_pct,vdb_currency_id,ldc_disc_amt)
			vdw_line.setitem(li_idx,'disc_amt',ldc_disc_amt)
		end if
	end if
next
return 0
end function

public function integer f_update_tax (datawindow vdw_line, string vs_colname_amount, string vs_colname_amount_ex_tax, decimal vdc_exc_rate, string vs_include_tax_yn);c_unit_instance		lc_unit
datawindow			ldw_tax
decimal				ldc_amount,ldc_tax,ldx_tax_include,ldc_tax_amt,ldc_price,ldc_qty,ldc_price_b_tax,ldc_amount_b_tax
decimal				ldc_amt_ex,ldc_act_amt_ex,ldc_act_amount,ldc_markup_return,ldc_amount_ex_tax
double				ldb_id,ldb_round_id
long					ll_find
string					ls_filter,ls_filter_detail
int						li_tax_percent,li_idx,li_markup_pct

ldw_tax = iw_display.f_get_dw('d_tax_line_grid')
ls_filter = ldw_tax.describe( "datawindow.table.filter")
ls_filter_detail = vdw_line.dynamic f_get_detail_filterstring( ldw_tax, true)
if ls_filter <> ls_filter_detail  then
	ldw_tax.setfilter(ls_filter_detail)
	ldw_tax.filter()
end if
for li_idx = 1 to vdw_line.rowcount()
	ll_find = 0
	ldx_tax_include = 0
	ldc_amount = vdw_line.getitemnumber(li_idx,vs_colname_amount)
	ldc_amount_ex_tax = vdw_line.getitemnumber(li_idx,vs_colname_amount_ex_tax)
	ldc_price = vdw_line.getitemnumber(li_idx,'price')
	ldc_qty = vdw_line.getitemnumber(li_idx,'qty')
	if isnull(ldc_amount) or ldc_amount = 0 then continue
	ldb_id = vdw_line.getitemnumber(li_idx,'ID')
	if vdw_line.rowcount() = ldw_tax.rowcount( ) then
		ll_find = ldw_tax.find( 'object_ref_id = '+string(ldb_id), 1, ldw_tax.rowcount( ) )
		li_tax_percent = ldw_tax.getitemnumber( ll_find, 'tax_pct')
		ldc_tax = this.f_calculation_tax( ldc_amount,ldc_amount_ex_tax,ldc_price,ldc_qty, vdc_exc_rate, li_tax_percent, vs_include_tax_yn)
	elseif vdw_line.rowcount() < ldw_tax.rowcount( ) then
		Do
			ll_find ++
			ll_find = ldw_tax.find( 'object_ref_id = '+string(ldb_id)+" and include_yn = 'Y' ", ll_find, ldw_tax.rowcount( ) + 1 )
			if ll_find > 0 then
				li_tax_percent = ldw_tax.getitemnumber( ll_find, 'tax_pct')
				ldc_tax_amt = this.f_calculation_tax(ldc_amount,ldc_amount_ex_tax,ldc_price,ldc_qty, vdc_exc_rate, li_tax_percent, vs_include_tax_yn)
				ldw_tax.setitem(ll_find , 'tax_amt', ldc_tax_amt)
				ldw_tax.setitem(ll_find , 'tax_correction', ldc_tax_amt)
				ldw_tax.setitem(ll_find , 'exchange_rate', vdc_exc_rate)
				ldx_tax_include += ldc_tax_amt
			end if
		Loop While ll_find > 0
		ll_find = ldw_tax.find( 'object_ref_id = '+string(ldb_id)+" and uprow_yn = 'Y' ", 1, ldw_tax.rowcount( ) )
		if ll_find > 0 then
			li_tax_percent = ldw_tax.getitemnumber( ll_find, 'tax_pct')
			ldc_amount = (ldc_amount * vdc_exc_rate)+ldx_tax_include
			ldc_tax = this.f_calculation_tax(ldc_amount,ldc_amount_ex_tax,ldc_price,ldc_qty, 1, li_tax_percent, vs_include_tax_yn)
		end if
	end if
	ldw_tax.setitem(ll_find , 'tax_amt',  ldc_tax)
	ldw_tax.setitem(ll_find , 'tax_correction',  ldc_tax)
	ldw_tax.setitem(ll_find , 'exchange_rate', vdc_exc_rate)
next
//if ls_filter <> '?' then
//	ldw_tax.setfilter( ls_filter)
//	ldw_tax.filter( )
//end if
return 0
end function

public function integer f_round (ref datawindow rpo_dw, long vl_currentrow, string vs_colname, string vs_editdata);return 0
end function

public function integer f_update_matching (datawindow vdw_modifing, long vl_row_editing, dwbuffer v_dwbuffer);return 0
end function

public function boolean f_is_auto_appr ();long		ll_find

ll_find = ids_policy_rule.find( "object_ref_code = '"+this.classname( )+"' and AUTO_APPR_YN = 'Y'" , 1, ids_policy_rule.rowcount( ) )
if ll_find > 0 then
	return true
else
	ll_find = ids_policy_security.find( "object_ref_code = '"+this.classname( )+"' and AUTO_APPR_YN = 'Y'" , 1, ids_policy_security.rowcount( ) )
	if ll_find > 0 then
		return true
	else
		return false
	end if
end if
end function

public function string f_get_rule_dwo_constraint ();long 		ll_idx,ll_find
string		ls_dwo,ls_rtn

ls_dwo = this.ids_policy_rule.getitemstring( 1, 'dwobject_constraint')
ls_rtn = ls_dwo +';'
Do
	ll_find++
	ll_find = this.ids_policy_rule.find( "dwobject_constraint <> '"+ls_dwo+"'", ll_find , this.ids_policy_rule.rowcount( ) + 1)
	if ll_find > 0 then
		ls_dwo = this.ids_policy_rule.getitemstring( ll_find, 'dwobject_constraint')
		ls_rtn += ls_dwo +';'
	end if
Loop While ll_find > 0
return ls_rtn
end function

public function string f_get_security_dwo_constraint ();long 		ll_idx,ll_find
string		ls_dwo,ls_rtn

ls_dwo = this.ids_policy_security.getitemstring( 1, 'dwobject_constraint')
ls_rtn = ls_dwo +';'
Do
	ll_find++
	ll_find = this.ids_policy_security.find( "dwobject_constraint <> '"+ls_dwo+"'", ll_find , this.ids_policy_security.rowcount( ) + 1)
	if ll_find > 0 then
		ls_dwo = this.ids_policy_security.getitemstring( ll_find, 'dwobject_constraint')
		ls_rtn += ls_dwo +';'
	end if
Loop While ll_find > 0
return ls_rtn
end function

public function integer f_handle_message (ref datawindow rdw_handling, ref datawindow vdw_source, long vl_row, dwobject dwo, string vs_message);
choose case lower(vs_message)
	case 'dragdrop'
		return this.event e_dw_dragdrop( rdw_handling, vdw_source, vl_row, dwo)
	case 'dragwithin'
		return this.event e_dw_dragwithin( rdw_handling, vdw_source, vl_row, dwo)
	case 'dragenter'
		return this.event e_dw_dragenter( rdw_handling, vdw_source)
	case 'dragleave'
		return this.event e_dw_dragleave( rdw_handling, vdw_source)
end choose
end function

public function integer f_handle_message (integer vi_xpos, integer vi_ypos, long vl_row, ref datawindow rdw_handling, string vs_message);
choose case lower(vs_message)
	case 'e_mousemove'
		return this.event e_dw_e_mousemove( vi_xpos, vi_ypos, vl_row, rdw_handling)
	case 'e_dwnlbuttonup'
		return this.event e_dw_e_dwnlbuttonup( vi_xpos, vi_ypos,vl_row, rdw_handling)
end choose

return 0
end function

public function integer f_set_dwo_structure_tabpage (s_str_dwo_tabpage vastr_dwo_tabpage[]);
iastr_dwo_tabpage[] = vastr_dwo_tabpage[]
return 1
end function

public function integer f_update_cogs (date vd_sdate, date vd_edate, string vs_warehouse_yn, string vs_spec_yn, string vs_lot_yn, string vs_serial_yn, string vs_loc_yn, string vs_update_method, double vdb_object_ref_id, string vs_object_ref_table);/****************************************************************************
Chức năng: Tính toán giá vốn xuất kho
--------------------------------------------------
Tham số: - vd_sdate: ngày bắt đầu kỳ kho
			 - vd_edate: ngày đóng kỳ kho
			 - vs_warehouse_yn: Y tính giá vốn riêng từng kho, N tính chung
			 - vs_spec_yn: Y tính giá vồn riêng từng spec
			 - vs_lot_yn: Y tính giá vốn riêng từng lô
			 - vs_serial_yn: Y tính giá vốn riêng từng seri
			 - vs_loc_yn: tính giá vốn riêng từng vị trí
			 - vs_update_method: phương pháp cập nhật điều chỉnh: 1) direct (cập nhật trực tiếp vào bút toán trong kỳ), 2) adj_entries ( tạo bút toán điều chỉnh riêng)
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Return :   1 Thành công
			-1 Lỗi
=====================================================================*/

string				ls_where, ls_cost_method, ls_sql, ls_rtn
long				ll_row
double			ldb_item_id
int					li_rtn, li_pos
b_obj_instantiate		lobj_ins
t_ds_db 					lds_item_out
s_str_item_balance	lstr_item_balance
c_string					lc_String


//-- xóa obj_balance_adj --//

if this.f_del_obj_adj(vd_sdate  , it_transaction) = -1 then return -1

//-- Lấy tất cảc các mã hàng có xuất kho trong kỳ --//
lds_item_out = create t_ds_db 
lds_item_out.dataobject = 'ds_item_out'

lds_item_out.f_getcurrentsql( ls_sql, ls_where)
li_pos= pos(ls_sql , ' FROM ')
ls_sql = left( ls_sql, li_pos)
if vs_warehouse_yn = 'N' then
	ls_sql =  lc_String.f_globalreplace( ls_sql, ',sv.F_OBJECT_ID', ',NULL')
end if
if vs_spec_yn = 'N' then
	ls_sql = lc_String.f_globalreplace( ls_sql, ',sv.spec_id', ',NULL')
end if		
if vs_lot_yn = 'N' then
	ls_sql =  lc_String.f_globalreplace( ls_sql, ',sv.lot_no', ',NULL')
end if				
if vs_serial_yn = 'N' then
	ls_sql = lc_String.f_globalreplace( ls_sql, ',sv.serial_no', ',NULL')
end if						
if vs_loc_yn = 'N' then
	ls_sql =lc_String.f_globalreplace( ls_sql, ',sv.loc_id', ',NULL')
end if							


if lobj_ins.f_is_branch_yn( this.classname()) then
	ls_where = " from stream_value sv join item on item.object_ref_id = sv.item_id and item.value_yn = ~~'Y~~' and nvl(item.manufacture_yn,~~'N~~') =~~'N~~' " &
					+ " join object obj_wh on obj_wh.id = sv.f_object_id and obj_wh.object_ref_table = ~~'WAREHOUSE~~'  AND obj_wh.branch_id = " + string( gdb_branch ) &
					+ " WHERE sv.value_yn = ~~'Y~~' AND sv.company_id = "+string(gi_user_comp_id)  + " AND sv.sob = ~~'"+gs_sob+"~~'" &
					+ " AND sv.trans_date BETWEEN to_date(~~'"+string(vd_sdate, gs_w_date_format)+"~~',"+"~~'"+gs_w_date_format+"~~') AND  to_date(~~'" &
					+ string(vd_edate, gs_w_date_format)+"~~',"+"~~'"+gs_w_date_format+"~~') "		
else
	ls_where = " from stream_value sv join item on item.object_ref_id = sv.item_id and item.value_yn = ~~'Y~~' and nvl(item.manufacture_yn,~~'N~~') =~~'N~~' " &
					+ " join object obj_wh on obj_wh.id = sv.f_object_id and obj_wh.object_ref_table = ~~'WAREHOUSE~~'" &
					+ " WHERE sv.value_yn = ~~'Y~~' AND sv.company_id = "+string(gi_user_comp_id)  + " AND sv.sob = ~~'"+gs_sob+"~~'" &
					+ " AND sv.trans_date BETWEEN to_date(~~'"+string(vd_sdate, gs_w_date_format)+"~~',"+"~~'"+gs_w_date_format+"~~') AND  to_date(~~'" &
					+ string(vd_edate, gs_w_date_format)+"~~',"+"~~'"+gs_w_date_format+"~~') "	
end if
				
ls_sql += ls_where
ls_rtn = lds_item_out.modify("Datawindow.Table.Select= '" + ls_sql +"'")

if ls_rtn  <>'' then
	messagebox('Thông báo', 'Lỗi modify DW line 52.s_object_display.f_update_cogs()')
	return -1
end if

lds_item_out.f_settransobject(SQLCA)
if lds_item_out.retrieve( ) > 0 then
	//-- Duyệt từng mã hàng và gọi hàm tính giá vốn xuất kho theo phương pháp phù hợp --//
	FOR ll_row = 1 to lds_item_out.rowcount()
		lstr_item_balance.db_item_id = lds_item_out.getitemnumber( ll_row, 'item_id')
		if vs_warehouse_yn = 'Y' then
			lstr_item_balance.db_wh_id = lds_item_out.getitemnumber( ll_row, 'F_OBJECT_ID')
		end if
		if vs_spec_yn = 'Y' then
			lstr_item_balance.db_spec_id = lds_item_out.getitemnumber( ll_row, 'spec_id')
		end if		
		if vs_lot_yn = 'Y' then
			lstr_item_balance.s_lot_no = lds_item_out.getitemstring( ll_row, 'lot_no')
		else
			lstr_item_balance.s_lot_no = '@'
		end if				
		if vs_serial_yn = 'Y' then
			lstr_item_balance.s_serial_no = lds_item_out.getitemstring( ll_row, 'serial_no')
		else
			lstr_item_balance.s_serial_no = '@'
		end if						
		if vs_loc_yn = 'Y' then
			lstr_item_balance.db_loc_id = lds_item_out.getitemnumber( ll_row, 'loc_id')
		end if							
		
		ls_cost_method = lds_item_out.getitemstring( ll_row, 'cost_method')
		//-- kiểm tra có thay đổi phương pháp tính giá trong suốt năm tài chính --//
		
		if ls_cost_method = 'periodic_avg' then
			li_rtn = this.f_update_cogs_avg(vd_sdate ,vd_edate, vs_update_method,ls_cost_method, lstr_item_balance, vdb_object_ref_id, vs_object_ref_table)
			if li_rtn = -1 then return -1
		elseif ls_cost_method = 'fifo' then
			messagebox('Thông báo','Chưa phát triển tính giá vốn FIFO')
		else
			messagebox('Thông báo','Chưa phát triển :'+ls_cost_method)
		end if
	NEXT
else
	return 1
end if

it_transaction.f_db_upd_item_balance_adj( relativeDate(vd_sdate, -1), gs_sob )
it_transaction.f_db_upd_obj_balance_adj(relativeDate(vd_sdate, -1), gs_sob)

return 1
end function

public function integer f_get_item_open_balance (date vd_balance_date, s_str_item_balance vstr_item_balance, ref double rdb_open_qty, ref double rdb_open_value, ref double rdb_avg_price);/****************************************************************************
Chức năng: Lấy số lượng và giá trị tồn kho đầu kỳ theo phương pháp giá bình quân:
				Tồn đầu kỳ không phân biệt control account của item: Nếu 1 mã hàng có 2 tài khoản control trên table balance, tồn đầu kỳ
				được tính bằng tổng balance của 2 account.
---------------------------------------------------------------------------------------------
Tham số: - vd_balance_date: ngày bắt đầu kỳ kho
			 - vstr_item_balance : structure chứa : kho, spec, lot, serial, loc
			 - rdb_open_qty: số đầy kỳ trả về
			 - rdb_open_value: giá trị đầu kỳ trả về 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Return :   1 Thành công
			-1 Lỗi
=====================================================================*/

long				ll_row	, ll_cnt	
int					li_pos,li_idx
string				ls_sql, ls_where,  ls_rtn, ls_group, ls_table
//date 				ld_close_date
t_transaction	lt_transaction
t_ds_db 			lds_item_open
t_s_sql_attr		lastr_sql_attr[]
c_sql				lc_sql
b_obj_instantiate		lbo_instance

//-- Tính số đầu kỳ --/
lds_item_open = create t_ds_db 
lds_item_open.dataobject = 'ds_item_open'
lds_item_open.f_getcurrentsql(ls_sql, ls_where)

this.iw_display.f_get_transaction(lt_transaction )

li_idx = lc_sql.f_parse( ls_sql + ls_where, lastr_sql_attr[])

ls_group = lastr_sql_attr[1].s_group
ls_table = mid(ls_group, 1, lastpos(upper(ls_group), 'GROUP BY' ) -1 )
ls_group =  mid(ls_group, lastpos(upper(ls_group), 'GROUP BY'  ) +8)
lastr_sql_attr[1].s_group = ls_group


//ld_close_date = relativedate(vd_balance_date, -1)
ls_where = " ib.item_id = "+string(vstr_item_balance.db_item_id) + " AND ib.balance_date = to_date(~~'" + string(vd_balance_date,gs_w_date_format)+ "~~',~~'"+gs_w_date_format+"~~')"
if vstr_item_balance.db_wh_id > 0 then
	ls_where += '  AND ib.object_id = ' + string(vstr_item_balance.db_wh_id)
end if
if vstr_item_balance.db_spec_id > 0 then 
	ls_where += '  AND ib.spec_id = ' + string(vstr_item_balance.db_spec_id)
end if
if vstr_item_balance.s_lot_no <> '@' then
	ls_where += "  AND ib.lot_no = ~~'" + vstr_item_balance.s_lot_no + "~~'"
end if
if vstr_item_balance.s_serial_no <> '@' then
	ls_where += "  AND ib.serial_no = ~~'" + vstr_item_balance.s_serial_no + "~~'"	
end if
if vstr_item_balance.db_loc_id > 0 then
	ls_where += '  AND ib.loc_id = ' + string(vstr_item_balance.db_loc_id)	
end if
if lbo_instance.f_is_branch_yn( this.classname( ) ) then
	ls_where += '  AND owh.branch_id = ' + string(gdb_branch )	
end if

ls_where +=" AND ib.sob = ~~'"+gs_sob+"~~' AND ib.value_yn = ~~'Y~~'" + " AND ib.company_id = " +string(gi_user_comp_id )

lastr_sql_attr[1].s_tables += " GROUP BY " +ls_table + " join (SELECT ID  FROM object  WHERE object.object_ref_table = ~~'WAREHOUSE~~') owh on owh.id = ib.object_id" //-- loại bỏ các object không phải kho--//

lastr_sql_attr[1].s_where = ls_where
ls_sql = lc_sql.f_assemble( lastr_sql_attr[])

ls_rtn = lds_item_open.modify("Datawindow.Table.Select= '" + ls_sql +"'")
if ls_rtn  <>'' then
	messagebox('Thông báo','Lỗi modify DW line 47.s_object_display.f_update_cogs_avg()')
	rollback using lt_transaction;
	return -1
end if
lds_item_open.f_settransobject( lt_transaction)
ll_cnt = lds_item_open.retrieve( )

if ll_cnt > 0 then
	rdb_open_qty = lds_item_open.getitemnumber( 1, 'open_qty')
	rdb_open_value = lds_item_open.getitemnumber( 1, 'open_value')
	rdb_avg_price = lds_item_open.getitemnumber( 1, 'period_avg_price')
	destroy lds_item_open
	return 1
end if

rdb_open_qty = 0
rdb_open_value = 0
rdb_avg_price = 0
destroy lds_item_open
return 1

end function

public function integer f_update_cogs_avg (date vd_sdate, date vd_edate, string vs_update_method, string vs_cost_method, s_str_item_balance vstr_item_balance, double vdb_object_ref_id, string vs_object_ref_table);/****************************************************************************
Chức năng: Tính toán giá vốn xuất kho bình quân theo kỳ.
	- Số lượng nhập khi trong kỳ = nhập mua + nhập khách hàng trả hàng của kỳ trước (trừ trường hợp nhập kho trả hàng cùng kỳ, nếu tính bình quân tất cả kho, không tính lượng nhập chuyển kho)
	- Số lượng xuất kho trong kỳ = Xuất bán/dùng + xuất trả hàng nhà cung cấp. (không tính phần xuất trả hàng được áp giá đích danh)
	- Lượng nhập kho khách hàng trả cùng kỳ sẽ có giá = giá bình quân của kỳ.
	- Nhập kho trả hàng không kết với đơn bán hàng trước được tính như nhập mua.
--------------------------------------------------
Tham số: - vd_sdate: ngày bắt đầu kỳ kho
			 - vd_edate: ngày đóng sổ kho kỳ thực hiện
			 - vs_warehouse_yn: Y tính giá vốn riêng từng kho, N tính chung
			 - vs_spec_yn: Y tính giá vồn riêng từng spec
			 - vs_lot_yn: Y tính giá vốn riêng từng lô
			 - vs_serial_yn: Y tính giá vốn riêng từng seri
			 - vs_loc_yn: tính giá vốn riêng từng vị trí
			 - vs_update_method: phương pháp cập nhật điều chỉnh: 1) direct (cập nhật trực tiếp vào bút toán trong kỳ), 2) adj_entries ( tạo bút toán điều chỉnh riêng)
			 - vdb_item_id: ID của hàng hóa.			 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Return :   1 Thành công
			-1 Lỗi
=====================================================================*/

double			ldb_open_qty, ldb_open_value, ldb_avg_price, ldb_in_qty, ldb_in_value, ldb_price_round_id, ldb_base_curr_id
double			ldb_cust_rtn_qty_inperiod, ldb_rtn_value_adj, ldb_branch_id
string 			ls_base_currcode, ls_base_currname
date				ld_sdate
t_transaction	lt_transaction
t_ds_db			lds_item_cust_rtn_inperiod, lds_item_balance_adj
b_obj_instantiate		lobj_ins

if  vstr_item_balance.db_item_id = 27745270 then debugbreak()

this.iw_display.f_get_transaction(lt_transaction )
//-- Tính số đầu kỳ --//
if this.f_get_item_open_balance( vd_sdate, vstr_item_balance, ldb_open_qty, ldb_open_value, ldb_avg_price) = -1 then return -1
//-- xóa balance_adj từ ngày đóng ky mới: chưa xoa theo điều kiện --//
this.f_del_item_adj( vd_sdate, vstr_item_balance , lt_transaction)

 lds_item_balance_adj = create t_ds_db
 lds_item_balance_adj.dataobject = 'ds_item_balance_adj'
 lds_item_balance_adj.f_settransobject( lt_transaction)
 this.f_get_item_ds_adj( vd_sdate, vstr_item_balance, lds_item_balance_adj)
 
//-- Cập nhất giá nhập của các giao dịch nhập khách hàng trả hàng của của kỳ trước --//
if f_update_item_cust_return_cost_prior(ldb_avg_price, vstr_item_balance, vdb_object_ref_id, vs_object_ref_table ,vs_cost_method,vd_sdate,vd_edate,  lds_item_balance_adj) = -1 then return -1

//-- Tính số nhập trong kỳ  --// 

lds_item_cust_rtn_inperiod = create t_ds_db
lds_item_cust_rtn_inperiod.dataobject = 'ds_item_cust_return_inperiod'
lds_item_cust_rtn_inperiod.f_settransobject( sqlca)
lds_item_cust_rtn_inperiod.setsort( "trans_Date a")

if lobj_ins.f_is_branch_yn( this.classname()) then
	ldb_branch_id = gdb_branch
else
	ldb_branch_id = 0
end if
lds_item_cust_rtn_inperiod.retrieve(gs_sob,gi_user_comp_id,ldb_branch_id, vstr_item_balance.db_item_id,vstr_item_balance.db_wh_id, vstr_item_balance.db_spec_id, &
																vstr_item_balance.db_loc_id, vstr_item_balance.s_lot_no, vstr_item_balance.s_serial_no, vd_sdate, vd_edate )

if this.f_get_item_in_cost(vd_sdate, vd_edate,  vstr_item_balance,ldb_rtn_value_adj, lds_item_cust_rtn_inperiod, ldb_in_qty, ldb_in_value,ldb_cust_rtn_qty_inperiod) = -1 then return -1

//-- cập nhật điều chỉnh giá xuất kho theo giá bình quân của kỳ --//
this.ic_unit_instance.f_get_base_cur( ldb_base_curr_id, ls_base_currcode, ls_base_currname)
ldb_price_round_id = this.ic_unit_instance.f_get_round_id( ldb_base_curr_id,0, 'price')
if ldb_open_qty  + ldb_in_qty > 0 then
	ldb_avg_price = (ldb_open_value + ldb_in_value)/(ldb_open_qty + ldb_in_qty)
	ldb_avg_price = this.ic_unit_instance.f_round( lt_transaction, ldb_price_round_id, ldb_avg_price)
	
	//-- Cập nhật giá nhập kho khách hàng trả cùng kỳ --//
	if f_update_item_cust_return_cost_inperiod(ldb_avg_price, lds_item_cust_rtn_inperiod,vdb_object_ref_id, vs_object_ref_table,vs_cost_method,vd_sdate, vd_edate, lds_item_balance_adj)= -1 then return -1
	destroy lds_item_cust_rtn_inperiod
	
	//-- Cập nhất xuất kho --//
	if f_update_item_out_cost(ldb_avg_price, vstr_item_balance, vdb_object_ref_id, vs_object_ref_table ,vs_cost_method,vd_sdate,vd_edate, &
									ldb_open_qty + ldb_in_qty + ldb_cust_rtn_qty_inperiod,ldb_open_value + ldb_in_value , lds_item_balance_adj) = -1 then return -1
	
	//-- cập nhất giá trị luân chuyển kho nếu tính bình quân tất cả kho --//
	if f_update_item_transfer_cost(ldb_avg_price, vstr_item_balance, vdb_object_ref_id, vs_object_ref_table ,vs_cost_method,vd_sdate,vd_edate, lds_item_balance_adj) = -1 then return -1
		
	UPDATE item SET MOVING_AVG = :ldb_avg_price WHERE object_ref_id = :vstr_item_balance.db_item_id	using lt_transaction;
		
else
	//-- thông báo --//
end if

//lt_transaction.f_db_upd_obj_balance_adj( relativeDate(vd_sdate, -1) , gs_sob )
destroy lds_item_balance_adj

return 1
end function

public function integer f_get_item_in_cost (date vd_sdate, date vd_edate, s_str_item_balance vstr_item_balance, double vdb_rtn_value_adj, t_ds_db rds_cust_rtn_inperiod, ref double rdb_in_qty, ref double rdb_in_value, double rdb_rtn_qty_inperiod);/****************************************************************************
Chức năng: Lấy số lượng và giá trị nhập trong kỳ trừ lượng trả hàng, trừ nhập luân chuyển nếu tính tất cả kho
---------------------------------------------------------------------------------------------
Tham số: - vd_sdate: ngày bắt đầu kỳ
			 - vd_edate: ngày đóng kỳ
			 - vstr_item_balance : structure chứa : kho, spec, lot, serial, loc
			 - rdb_open_qty: số đầy kỳ trả về
			 - rdb_open_value: giá trị đầu kỳ trả về 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Return :   1 Thành công
			-1 Lỗi
=====================================================================*/

long				ll_row	, ll_cnt	
int					li_pos
string				ls_sql, ls_where,  ls_rtn, ls_join
date 				ld_close_date
t_transaction	lt_transaction
t_ds_db 			lds_item_in
b_obj_instantiate		lobj_ins

//-- Tính số đầu kỳ --/
lds_item_in = create t_ds_db 
lds_item_in.dataobject = 'ds_item_in'
lds_item_in.f_getcurrentsql(ls_sql, ls_where)

this.iw_display.f_get_transaction(lt_transaction )

ls_where = " WHERE sv.item_id = "+string(vstr_item_balance.db_item_id) + " AND trans_date between to_date(~~'" + string(vd_sdate,gs_w_date_format)+ "~~',~~'"+gs_w_date_format+"~~')" &
							+ " AND to_date(~~'" + string(vd_edate,gs_w_date_format)+ "~~',~~'"+gs_w_date_format+"~~')" + " and nvl(sv.value_yn,~~'N~~') = ~~'Y~~'"

if vstr_item_balance.db_wh_id > 0 then
	ls_where += '  AND sv.t_object_id = ' + string(vstr_item_balance.db_wh_id)
end if

if lobj_ins.f_is_branch_yn( this.classname( ) ) then
	ls_join = " join object owht on owht.id = sv.t_object_id AND  owht.object_ref_table = ~~'WAREHOUSE~~' AND owht.branch_id = " + string(gdb_branch )
	ls_join += " join object owhf on owhf.id = sv.f_object_id "
else
	ls_join = " join object owht on owht.id = sv.t_object_id AND  owht.object_ref_table = ~~'WAREHOUSE~~'"
	ls_join += " join object owhf on owhf.id = sv.f_object_id "
end if

if vstr_item_balance.db_spec_id > 0 then 
	ls_where += '  AND sv.spec_id = ' + string(vstr_item_balance.db_spec_id)
end if
if vstr_item_balance.s_lot_no <> '@' then
	ls_where += "  AND sv.t_lot_no = ~~'" + vstr_item_balance.s_lot_no + "~~'"
end if
if vstr_item_balance.s_serial_no <> '@' then
	ls_where += "  AND sv.t_serial_no = ~~'" + vstr_item_balance.s_serial_no + "~~'"	
end if
if vstr_item_balance.db_loc_id > 0 then
	ls_where += '  AND sv.t_loc_id = ' + string(vstr_item_balance.db_loc_id)	
end if

if lobj_ins.f_is_branch_yn( this.classname( ) ) then
	ls_where += " AND sv.sob = ~~'"+gs_sob+"~~'"  +" AND sv.company_id = " +string(gi_user_comp_id ) &
					+ " AND ( owhf.object_ref_table <> ~~'WAREHOUSE~~' or owhf.branch_id <> owht.branch_id ) "	
else
	ls_where += " AND sv.sob = ~~'"+gs_sob+"~~'"  +" AND sv.company_id = " +string(gi_user_comp_id ) &
					+ " AND ( owhf.object_ref_table <> ~~'WAREHOUSE~~' ) "	
end if

ls_sql += ls_join + ls_where

ls_rtn = lds_item_in.modify("Datawindow.Table.Select= '" + ls_sql +"'")
if ls_rtn  <>'' then
	messagebox('Thông báo','Lỗi modify DW line 47.s_object_display.f_update_cogs_avg()')
	rollback using lt_transaction;
	return -1
end if
lds_item_in.f_settransobject( lt_transaction)
ll_cnt = lds_item_in.retrieve( )

if ll_cnt > 0 then
	rdb_in_qty = lds_item_in.getitemnumber( 1, 'in_qty')
	if isnull(rdb_in_qty) then rdb_in_qty = 0
	rdb_in_value = lds_item_in.getitemnumber( 1, 'in_value')
	if isnull(rdb_in_value) then rdb_in_value = 0
end if
//-- trừ nhập trả hàng cùng kỳ --// 
rdb_rtn_qty_inperiod = double(rds_cust_rtn_inperiod.Describe("Evaluate('Sum(qty)', 0)"))
rdb_in_qty = rdb_in_qty - rdb_rtn_qty_inperiod
rdb_in_value = rdb_in_value - double(rds_cust_rtn_inperiod.Describe("Evaluate('Sum(base_value)', 0)"))
//-- công giá trị điều chỉnh khách hảng trả của kỳ trước --//
rdb_in_value += vdb_rtn_value_adj

destroy lds_item_in
return 1

end function

public function decimal f_calculation_tax (double vdc_amount, double vdc_amount_ex_tax, decimal vdc_price, integer vdc_qty, decimal vdc_exc_rate, integer vi_tax_percent, string vs_include_tax_yn);double			ldc_tax
double			ldb_round_id
datawindow		ldw_main
c_unit_instance	lc_unit

ldb_round_id = lc_unit.f_get_round_id( 0, 0, 'bc')
ldw_main = iw_display.dynamic f_get_dwmain()
if trim(upper(vs_include_tax_yn)) = 'N' or isnull(vs_include_tax_yn) then
	ldc_tax = lc_unit.f_round( ldw_main, ldb_round_id, (vdc_amount * vdc_exc_rate * vi_tax_percent) / 100)
	return ldc_tax
elseif trim(upper(vs_include_tax_yn)) = 'Y' then
	ldc_tax = lc_unit.f_round( ldw_main, ldb_round_id, vdc_amount - vdc_amount_ex_tax)
	return ldc_tax
end if
return 0
end function

public subroutine f_caculation_ex_tax (double vdc_qty, double vdc_price, double vdc_act_price, integer vi_tax_percent, string vs_include_tax_yn, double vdc_exc, double vdb_currency_id, ref double rdc_price_ex, ref double rdc_act_price_ex, ref double rdc_amt_ex, ref double rdc_act_amt_ex, ref double rdc_base_amt_ex, ref double rdc_act_base_amt_ex);double				ldb_base_round_id,ldb_round_id,ldb_price_round_id
decimal				ldc_tmp
datawindow			ldw_main
c_unit_instance		lc_unit

ldb_round_id = lc_unit.f_get_round_id( vdb_currency_id, 0, 'amount')
ldb_price_round_id = lc_unit.f_get_round_id( vdb_currency_id, 0, 'price')
ldb_base_round_id = lc_unit.f_get_round_id( 0, 0, 'bc')
ldw_main = iw_display.dynamic f_get_dwmain()
if trim(upper(vs_include_tax_yn)) = 'N' or isnull(vs_include_tax_yn) or vs_include_tax_yn = "" then
	rdc_price_ex = vdc_price
	rdc_act_price_ex = vdc_act_price
	rdc_amt_ex = lc_unit.f_round(ldw_main, ldb_round_id,vdc_qty * vdc_price)
	rdc_act_amt_ex = lc_unit.f_round(ldw_main, ldb_round_id,vdc_qty * vdc_act_price)
	rdc_base_amt_ex = lc_unit.f_round(ldw_main, ldb_base_round_id,vdc_qty * vdc_price * vdc_exc)
	rdc_act_base_amt_ex =  lc_unit.f_round(ldw_main, ldb_base_round_id,vdc_qty * vdc_act_price * vdc_exc)
elseif trim(upper(vs_include_tax_yn)) = 'Y' then
	if vi_tax_percent = 0 then
		ldc_tmp = 1
	end if
	ldc_tmp = 100/(100 + vi_tax_percent)
	rdc_price_ex = lc_unit.f_round(ldw_main, ldb_price_round_id,vdc_price * ldc_tmp)
	rdc_act_price_ex = lc_unit.f_round(ldw_main, ldb_price_round_id,vdc_act_price * ldc_tmp)
	rdc_amt_ex = lc_unit.f_round(ldw_main, ldb_round_id,vdc_qty * rdc_price_ex)
	rdc_act_amt_ex = lc_unit.f_round(ldw_main, ldb_round_id,vdc_qty * rdc_act_price_ex)
	rdc_base_amt_ex = lc_unit.f_round(ldw_main, ldb_base_round_id,vdc_qty * rdc_price_ex * vdc_exc)
	rdc_act_base_amt_ex =  lc_unit.f_round(ldw_main, ldb_base_round_id,vdc_qty * rdc_act_price_ex * vdc_exc)
end if
end subroutine

public subroutine f_caculation_comm (double vdc_act_amt_ex_tax, integer vi_comm_pct, double vdb_currency_id, ref double rdc_comm_amt);double				ldb_base_round_id,ldb_round_id
datawindow			ldw_main
c_unit_instance		lc_unit

ldw_main = iw_display.dynamic f_get_dwmain()
ldb_round_id = lc_unit.f_get_round_id( vdb_currency_id, 0, 'amount')
rdc_comm_amt =  lc_unit.f_round(ldw_main, ldb_round_id,vdc_act_amt_ex_tax*vi_comm_pct/100)
end subroutine

public subroutine f_caculation_disc (double vdc_act_amt_ex_tax, integer vi_disc_pct, double vdb_currency_id, ref double rdc_disc_amt);double				ldb_base_round_id,ldb_round_id
datawindow			ldw_main
c_unit_instance		lc_unit

ldw_main = iw_display.dynamic f_get_dwmain()
ldb_round_id = lc_unit.f_get_round_id( vdb_currency_id, 0, 'amount')
rdc_disc_amt =  lc_unit.f_round(ldw_main, ldb_round_id,vdc_act_amt_ex_tax*vi_disc_pct/100)
end subroutine

public subroutine f_caculation_markup (double vdc_amt_ex_tax, double vdc_act_amt_ex_tax, integer vi_markup_pct, double vdb_currency_id, ref double rdc_markup_amt, ref double rdc_markup_return);double				ldb_base_round_id,ldb_round_id
datawindow			ldw_main
c_unit_instance		lc_unit

ldw_main = iw_display.dynamic f_get_dwmain()
ldb_round_id = lc_unit.f_get_round_id( vdb_currency_id, 0, 'amount')
rdc_markup_return = lc_unit.f_round(ldw_main,ldb_round_id, (vdc_amt_ex_tax - vdc_act_amt_ex_tax)*vi_markup_pct/100)
rdc_markup_amt =  lc_unit.f_round(ldw_main,ldb_round_id, vdc_amt_ex_tax - vdc_act_amt_ex_tax - rdc_markup_return)


end subroutine

public function t_ds_db_ws f_get_ds (string vs_dwo);int				li_idx
t_ds_db_ws  lds_null

FOR li_idx = 1 to upperbound(this.ids_data_ws[] )
	if pos(ids_data_ws[li_idx].dataobject, vs_dwo) > 0 then
		return  ids_data_ws[li_idx]
	end if	
NEXT

setnull(lds_null)
return lds_null
end function

public function integer f_init_ds_data ();string			las_master_keycol[], las_detail_keycol[], las_empty[]
int				li_idx, li_idx2

c_string		lc_String

//-- init dwo của window --//
FOR li_idx = 1 to upperbound(this.istr_dwo[])
	ids_data_ws[li_idx] = create t_ds_db_ws
	ids_data_ws[li_idx].dataobject = istr_dwo[li_idx].s_dwo_default
//	g_user.i_rule.f_set_policy_dwctrl(this , ids_data_ws[li_idx])
	ids_data_ws[li_idx].f_settransobject(it_transaction)
	ids_data_ws[li_idx].f_set_obj_display(this)
	//-- set các biến instance --//
	ids_data_ws[li_idx].f_set_ib_detail( istr_dwo[li_idx].b_detail )
	ids_data_ws[li_idx].f_set_ib_master( istr_dwo[li_idx].b_master )
	ids_data_ws[li_idx].f_set_ib_shared( istr_dwo[li_idx].b_shared )
	ids_data_ws[li_idx].f_set_ib_cascade_del( istr_dwo[li_idx].b_cascade_del )
	ids_data_ws[li_idx].f_set_ib_ref_table_yn( istr_dwo[li_idx].b_ref_table_yn )
//	ids_data_ws[li_idx].f_set_ref_table_field( istr_dwo[li_idx].s_ref_table_field )
	ids_data_ws[li_idx].f_set_ib_insert( istr_dwo[li_idx].b_insert )
	ids_data_ws[li_idx].f_set_ib_delete( istr_dwo[li_idx].b_delete )
	ids_data_ws[li_idx].f_set_ib_update( istr_dwo[li_idx].b_update )
	ids_data_ws[li_idx].f_set_ib_query( istr_dwo[li_idx].b_query )
	ids_data_ws[li_idx].f_set_ib_excel( istr_dwo[li_idx].b_excel )
	ids_data_ws[li_idx].f_set_ib_traceable( istr_dwo[li_idx].b_traceable )
	ids_data_ws[li_idx].f_set_ib_relation_1_1(istr_dwo[li_idx].b_relation_1_1 )
				
	//-- ghi nhớ để set master-detail --//
	if istr_dwo[li_idx].b_master and istr_dwo[li_idx].s_dwo_details <> '' then
		iastr_ds_md[upperbound(iastr_ds_md[]) + 1].ds_master = ids_data_ws[li_idx]
		iastr_ds_md[upperbound(iastr_ds_md[])].s_dwo_detail=  istr_dwo[li_idx].s_dwo_details
	end if
	//-- ghi nhớ để set master-shared --//
	if istr_dwo[li_idx].b_master and istr_dwo[li_idx].s_dwo_shared <> '' then
		iastr_ds_ms[upperbound(iastr_ds_ms[]) + 1].ds_master = ids_data_ws[li_idx]
		iastr_ds_ms[upperbound(iastr_ds_ms[])].s_dwo_shared = istr_dwo[li_idx].s_dwo_shared
	end if				
	//-- ghi nho dwdetail --//
	las_master_keycol[] = las_empty[]
	las_detail_keycol[] = las_empty[]
	if istr_dwo[li_idx].b_detail then
		iads_detail[upperbound(iads_detail[])+1] =  ids_data_ws[li_idx]
		lc_String.f_stringtoarray( istr_dwo[li_idx].s_master_keycol , ';', las_master_keycol[])
		ids_data_ws[li_idx].f_set_master_keycol(las_master_keycol[])
		lc_String.f_stringtoarray( istr_dwo[li_idx].s_detail_keycol , ';', las_detail_keycol[])
		ids_data_ws[li_idx].f_set_detail_keycol(las_detail_keycol[])
	end if
	//-- ghi nho dwshared --//
	if istr_dwo[li_idx].b_shared then
		iads_share[upperbound(iads_share[])+1] =  ids_data_ws[li_idx]
	end if	
	//--ghi nhớ dw không master không detail--//
	if not istr_dwo[li_idx].b_master and not istr_dwo[li_idx].b_detail then
		iads_none_md[upperbound(iads_none_md[]) + 1] = ids_data_ws[li_idx]
	end if
NEXT

//-- init dwo của tabpage --//
FOR li_idx = 1 to upperbound(this.iastr_dwo_tabpage[])
	
	FOR li_idx2 = 1 to upperbound(this.iastr_dwo_tabpage[li_idx].str_dwo[])
		ids_data_ws[upperbound(ids_data_ws[])+1] = create t_ds_db_ws

		ids_data_ws[upperbound(ids_data_ws[])].dataobject = iastr_dwo_tabpage[li_idx].str_dwo[li_idx2].s_dwo_default
	//	g_user.i_rule.f_set_policy_dwctrl(this , ids_data_ws[upperbound(ids_data_ws[])])
		ids_data_ws[upperbound(ids_data_ws[])].f_settransobject(it_transaction)
		ids_data_ws[upperbound(ids_data_ws[])].f_set_obj_display(this)
		//-- set các biến instance --//
		ids_data_ws[upperbound(ids_data_ws[])].f_set_ib_detail( iastr_dwo_tabpage[li_idx].str_dwo[li_idx2].b_detail )
		ids_data_ws[upperbound(ids_data_ws[])].f_set_ib_master( iastr_dwo_tabpage[li_idx].str_dwo[li_idx2].b_master )
		ids_data_ws[upperbound(ids_data_ws[])].f_set_ib_shared( iastr_dwo_tabpage[li_idx].str_dwo[li_idx2].b_shared )
		ids_data_ws[upperbound(ids_data_ws[])].f_set_ib_cascade_del( iastr_dwo_tabpage[li_idx].str_dwo[li_idx2].b_cascade_del )
		ids_data_ws[upperbound(ids_data_ws[])].f_set_ib_ref_table_yn( iastr_dwo_tabpage[li_idx].str_dwo[li_idx2].b_ref_table_yn )
	//	ids_data_ws[upperbound(ids_data_ws[])].f_set_ref_table_field( iastr_dwo_tabpage[li_idx].str_dwo[li_idx2].s_ref_table_field )
		ids_data_ws[upperbound(ids_data_ws[])].f_set_ib_insert( iastr_dwo_tabpage[li_idx].str_dwo[li_idx2].b_insert )
		ids_data_ws[upperbound(ids_data_ws[])].f_set_ib_delete( iastr_dwo_tabpage[li_idx].str_dwo[li_idx2].b_delete )
		ids_data_ws[upperbound(ids_data_ws[])].f_set_ib_update( iastr_dwo_tabpage[li_idx].str_dwo[li_idx2].b_update )
		ids_data_ws[upperbound(ids_data_ws[])].f_set_ib_query( iastr_dwo_tabpage[li_idx].str_dwo[li_idx2].b_query )
		ids_data_ws[upperbound(ids_data_ws[])].f_set_ib_excel( iastr_dwo_tabpage[li_idx].str_dwo[li_idx2].b_excel )
		ids_data_ws[upperbound(ids_data_ws[])].f_set_ib_traceable( iastr_dwo_tabpage[li_idx].str_dwo[li_idx2].b_traceable )
		ids_data_ws[upperbound(ids_data_ws[])].f_set_ib_relation_1_1(iastr_dwo_tabpage[li_idx].str_dwo[li_idx2].b_relation_1_1 )
					
		//-- ghi nhớ để set master-detail --//
		if iastr_dwo_tabpage[li_idx].str_dwo[li_idx2].b_master and iastr_dwo_tabpage[li_idx].str_dwo[li_idx2].s_dwo_details <> '' then
			iastr_ds_md[upperbound(iastr_ds_md[]) + 1].ds_master = ids_data_ws[upperbound(ids_data_ws[])]
			iastr_ds_md[upperbound(iastr_ds_md[])].s_dwo_detail=  iastr_dwo_tabpage[li_idx].str_dwo[li_idx2].s_dwo_details
		end if
		//-- ghi nhớ để set master-shared --//
		if iastr_dwo_tabpage[li_idx].str_dwo[li_idx2].b_master and iastr_dwo_tabpage[li_idx].str_dwo[li_idx2].s_dwo_shared <> '' then
			iastr_ds_ms[upperbound(iastr_ds_ms[]) + 1].ds_master = ids_data_ws[upperbound(ids_data_ws[])]
			iastr_ds_ms[upperbound(iastr_ds_ms[])].s_dwo_shared = iastr_dwo_tabpage[li_idx].str_dwo[li_idx2].s_dwo_shared
		end if				
		//-- ghi nho dwdetail --//
		las_master_keycol[] = las_empty[]
		las_detail_keycol[] = las_empty[]
		if iastr_dwo_tabpage[li_idx].str_dwo[li_idx2].b_detail then
			iads_detail[upperbound(iads_detail[])+1] =  ids_data_ws[upperbound(ids_data_ws[])]
			lc_String.f_stringtoarray( iastr_dwo_tabpage[li_idx].str_dwo[li_idx2].s_master_keycol , ';', las_master_keycol[])
			ids_data_ws[upperbound(ids_data_ws[])].f_set_master_keycol(las_master_keycol[])
			lc_String.f_stringtoarray( iastr_dwo_tabpage[li_idx].str_dwo[li_idx2].s_detail_keycol , ';', las_detail_keycol[])
			ids_data_ws[upperbound(ids_data_ws[])].f_set_detail_keycol(las_detail_keycol[])
		end if
		//-- ghi nho dwshared --//
		if iastr_dwo_tabpage[li_idx].str_dwo[li_idx2].b_shared then
			iads_share[upperbound(iads_share[])+1] =  ids_data_ws[upperbound(ids_data_ws[])]
		end if	
		//--ghi nhớ dw không master không detail--//
		if not iastr_dwo_tabpage[li_idx].str_dwo[li_idx2].b_master and not iastr_dwo_tabpage[li_idx].str_dwo[li_idx2].b_detail then
			iads_none_md[upperbound(iads_none_md[]) + 1] = ids_data_ws[upperbound(ids_data_ws[])]
		end if
	NEXT
NEXT


return 1
end function

public function integer f_arrange_dwdetail (t_ds_db_ws vds_detail[]);int			li_idx1, li_idx2, li_masterCount, li_detailCount
string		ls_dwo_detail
c_string	lc_string

li_masterCount = upperbound(iastr_ds_md[])
if li_masterCount = 1 then
	
	if upperbound(iastr_ds_md[1].ds_details[] ) = 0 then
		iastr_ds_md[1].ds_details[] = vds_detail[]
	else
		li_detailCount = upperbound(vds_detail[])
		FOR li_idx1 = 1 to li_detailCount
			iastr_ds_md[1].ds_details[li_detailCount + li_idx1] = vds_detail[li_idx1]
		NEXT
	end if	
else
	FOR li_idx1 = 1 to li_masterCount
		FOR li_idx2 = 1 to upperbound(vds_detail[])
			iastr_ds_md[li_idx1].s_dwo_detail = lc_string.f_globalreplace(iastr_ds_md[li_idx1].s_dwo_detail, ' ', '')
			if right(iastr_ds_md[li_idx1].s_dwo_detail,1) <> ';' then iastr_ds_md[li_idx1].s_dwo_detail += ';'
			if pos(iastr_ds_md[li_idx1].s_dwo_detail, vds_detail[li_idx2].dataobject+';') > 0 then
				iastr_ds_md[li_idx1].ds_details[upperbound(iastr_ds_md[li_idx1].ds_details[])+1] = vds_detail[li_idx2]
			end if
		NEXT
	NEXT
end if
return li_masterCount
end function

public function integer f_arrage_dwshared (t_ds_db_ws vds_shared[]);int			li_idx1, li_idx2, li_masterCount, li_shareCount
string		ls_dwo_detail

li_masterCount = upperbound(iastr_ds_ms[])
if li_masterCount = 1 then
	if upperbound(iastr_ds_ms[1].ds_shared[] ) = 0 then
		iastr_ds_ms[1].ds_shared[] = vds_shared[]
	else
		li_shareCount = upperbound(vds_shared[])
		FOR li_idx1 = 1 to li_shareCount
			iastr_ds_ms[1].ds_shared[li_shareCount + li_idx1] = vds_shared[li_idx1]
		NEXT
	end if
else
	FOR li_idx1 = 1 to li_masterCount
		FOR li_idx2 = 1 to upperbound(vds_shared[])
			if pos(iastr_ds_ms[li_idx1].s_dwo_shared, vds_shared[li_idx2].dataobject+';') > 0 then
				iastr_ds_ms[li_idx1].ds_shared[upperbound(iastr_ds_ms[li_idx1].ds_shared[])+1] = vds_shared[li_idx2]
			end if
		NEXT
	NEXT
end if
return li_masterCount
end function

public function integer f_set_md_ms ();int		li_idx

FOR li_idx = 1 to upperbound(iastr_ds_md[])
	iastr_ds_md[li_idx].ds_master.f_set_dsmaster(iastr_ds_md[li_idx].ds_details[])
NEXT
FOR li_idx = 1 to upperbound(iastr_ds_ms[])
	iastr_ds_ms[li_idx].ds_master.f_set_dsShare(iastr_ds_ms[li_idx].ds_shared[])
NEXT
return 0 
end function

public function integer f_connect_db ();
//-- Tạo connection voi database --//
it_transaction = create t_transaction
it_transaction.dbms =	SQLCA.DBMS
it_transaction.ServerName	 = SQLCA.ServerName
it_transaction.LogId	 = SQLCA.LogId
it_transaction.LogPass 	 = SQLCA.LogPass 
it_transaction.AutoCommit 	 = false 
it_transaction.DBParm	 = SQLCA.DBParm
connect using	it_transaction;	

return it_transaction.sqlcode

end function

public function integer f_get_ds_retrieve_args (ref t_ds_db_ws rds_focus, ref any ra_args[]);return 0
end function

public function integer f_handle_message (ref powerobject rpo_requester, long vl_value, string rs_message);int				li_rtn

choose case rpo_requester.typeof()
	case treeview!
//		li_rtn = this.event e_treeview( rpo_requester, rs_message)
	case dropdownlistbox!
		li_rtn = this.event e_dropdownlistbox( rpo_requester,vl_value, rs_message)
end choose

return li_rtn
end function

public function integer f_set_record_security_ws (t_ds_db_ws vds_handing);t_ds_db_ws		lads_detail[]
int					li_rtn,li_idx,li_count

li_count = vds_handing.f_getdsdetails( lads_detail[])
li_rtn = vds_handing.f_set_rec_security( )
for li_idx = 1 to li_count
	this.f_set_record_security_ws(lads_detail[li_idx] )
next
return li_rtn
end function

public function integer f_set_record_security_ws ();t_ds_db_ws		lds_main,lads_detail[],lds_master

int				li_rtn,li_idx,li_count


lds_main = this.ids_data_ws[1]
lds_main.f_set_rec_security( )
li_count = lds_main.f_getdsdetails( lads_detail)
for li_idx = 1 to li_count
	li_rtn = this.f_set_record_security_ws(lads_detail[li_idx] )
next
//--set record cho các dw none md(thường là báo cáo)--//
for li_idx = 1 to upperbound(iads_none_md[])
	lds_master = this.f_get_ds( iads_none_md[li_idx].dataobject)
	if isvalid(lds_master) then
		lds_master.f_set_rec_security( )
	end if
next
return 1
end function

public function string f_get_json (long vl_start_row, long vl_nbr_of_row, ref string rs_json_string, string vs_username, string vs_password);long		ll_row_rtn, ll_row, ll_cnt, ll_idx
string		las_colnames[]
sailjson				l_sailjson, l_sailjson_tmp
c_connect_srv		lc_connect_srv

//-- kiểm tra user valid --//

if lc_connect_srv.f_isvalid_pwd_ws( vs_username, vs_password) = false then return ''

this.f_set_record_security_ws( )

if vl_start_row = 1 then //-- retrieve data nếu là làn đầu gọi service --//
	this.ids_data_ws[1].event e_retrieve()
end if

l_sailjson = create sailjson
ll_cnt = ids_data_ws[1].f_getcolumns_sql(las_colnames[])
FOR ll_row = vl_start_row to vl_nbr_of_row	
	//add json object
	l_sailjson_tmp = l_sailjson.addobject(ids_data_ws[1].dataobject)
	FOR ll_idx = 1 to ll_cnt
		l_sailjson_tmp.setattribute(las_colnames[ll_idx], string(ids_data_ws[1].f_getitemany(ll_row, las_colnames[ll_idx]) ))
	NEXT
	
NEXT

rs_json_string =  l_sailjson.getformatjson('' )

return rs_json_string
end function

public function t_ds_db_ws f_get_dsmain ();return this.ids_data_ws[1]
end function

public function integer f_change_drilldown_rpt (s_object_display vod_object_report);string						ls_display_model
s_w_main				lw_requester
s_str_dw_md			lastr_dw_md_empty[]
s_str_dw_ms			lastr_dw_ms_empty[]
t_dw_mpl				ldw_empty[], ldw_detail[], ldw_share[], ldw_main
s_object_display		lod_handling
//-- tat control --//
this.iw_display.f_set_invisible_ctrl()

//-- tắt tìm kiếm --//
//if this.iw_display.ib_querymode_on then this.iw_display.event e_execquery( )
//-- cất dữ liệu của report cũ --//
this.iw_display.f_suspend_dw( )

//-- change object handling --//
this.iw_display.f_set_obj_handling( vod_object_report)
lw_requester = this.iw_display
lod_handling = this.iw_display.f_get_obj_handling( )
lod_handling.f_set_wdisplay(lw_requester)
lod_handling.f_init_policy_datastore( )

//-- gán dwo cho dw cùa window --//
this.iw_display.iastr_dw_ms = lastr_dw_ms_empty[]
this.iw_display.iastr_dw_md = lastr_dw_md_empty[]
this.iw_display.f_set_iwdw_detail(ldw_empty[])
this.iw_display.f_set_iwdw_share( ldw_empty[])
this.iw_display.f_set_iadw_none_md( ldw_empty[])
this.iw_display.f_set_dwo( )

//-- tao tabpage detail nếu có --//
if lod_handling.dynamic f_create_tabpage() = -1 then return -1
	
//-- set master detail share --//
this.iw_display.f_get_iwdw_detail(ldw_detail[])
this.iw_display.f_get_iwdw_share(ldw_share[])
this.iw_display.f_arrange_dwdetail(ldw_detail[] )
this.iw_display.f_arrage_dwshared( ldw_share[])
this.iw_display.f_set_iwdw_detail(ldw_detail[])
this.iw_display.f_set_iwdw_share(ldw_share[])
this.iw_display.f_set_md_ms()


//-- set record security --//
this.iw_display.f_set_record_security( )

//-- tat che do filter --//
//if this.iw_display.ib_filter_on and lod_handling.is_dwmain_filter = '' then 
//	this.iw_display.event e_filteroff( )
//end if

//-- bat control --//
ls_display_model = lod_handling.f_get_display_model()
this.iw_display.dynamic f_set_visible_ctrl(ls_display_model)

//-- set resize parm--//
lod_handling.event e_window( 'e_preopen')

//-- set orignal retrieve parm --//
lod_handling.event e_window( 'open')

//-- resize theo display model mới --//
this.iw_display.f_resize( ls_display_model)

//-- thông báo đến object --//
lod_handling.event e_window( 'e_postopen')

ldw_main = this.iw_display.f_get_dwmain( )
lod_handling.f_ctrl_actionbuttons(ldw_main)

this.iw_display.event e_display_actionbutton( )

this.iw_display.f_set_redraw_dw(true)
return 1
end function

public function integer f_set_drilldown_data (s_str_drilldown_data vstr_drilldown_data);//string								ls_cols[]
//int									li_cnt, li_row, li_idx
//c_string							lc_string
//t_dw_mpl						ldw_handle
//
//FOR li_row = 1 to upperbound(vstr_drilldown_data.s_drilldown_obj_dwo[])		
//
//	ldw_handle = this.iw_display.f_get_dw(vstr_drilldown_data.s_drilldown_obj_dwo[li_row]+'_grid')
//	if isvalid(ldw_handle)  then
//		if ldw_handle.getrow() = 0 then  continue
//		li_cnt = lc_string.f_stringtoarray(vstr_drilldown_data.s_drilldown_obj_column[li_row],';', ls_cols[])
//		
//		For li_idx = 1 to li_cnt
//			ldw_handle.setitem( ldw_handle.getrow(), ls_cols[li_idx], vstr_drilldown_data.str_data[li_row].aa_data[li_idx]) 
//		Next 	
//	end if
//NEXT
istr_drilldown = vstr_drilldown_data
return 1
end function

public function integer f_set_suspend_report (t_dw_mpl vdw_suspend);string	ls_current_where, ls_sql
int		li_idx

FOR li_idx = 1 to upperbound(istr_dwo[])
	if vdw_suspend.dataobject =istr_dwo[li_idx].s_dwo_grid or vdw_suspend.dataobject =istr_dwo[li_idx].s_dwo_form then
		
		if not isvalid(istr_dwo[li_idx].ds_suspend_data) then istr_dwo[li_idx].ds_suspend_data = create datastore
		istr_dwo[li_idx].ds_suspend_data.dataobject = vdw_suspend.dataobject
//		istr_dwo[li_idx].s_suspend_originalwhere = vdw_suspend.is_originalwhereClause
//		vdw_suspend.f_getCurrentSQL(ls_sql, ls_current_where)
//		istr_dwo[li_idx].s_suspend_sqlnowhere = ls_sql		
//		istr_dwo[li_idx].s_suspend_where = ls_current_where	
//		istr_dwo[li_idx].s_where_query_mode=vdw_suspend.is_where_query_mode //giu lay where tim kiem truoc khi change object
//		istr_dwo[li_idx].b_suspend_editing = vdw_suspend.dynamic f_get_ib_editing()
//		istr_dwo[li_idx].str_suspend_rule_attr = vdw_suspend.dynamic f_get_rule_attr()
//		istr_dwo[li_idx].str_suspend_security_attr = vdw_suspend.dynamic f_get_security_attr()
//		istr_dwo[li_idx].c_suspend_querymode = vdw_suspend.inv_querymode
//		istr_dwo[li_idx].c_suspend_sort = vdw_suspend.inv_sort
		
		vdw_suspend.rowscopy( 1, vdw_suspend.rowcount( ) , primary!, istr_dwo[li_idx].ds_suspend_data, 1, primary!)
		vdw_suspend.rowscopy( 1, vdw_suspend.filteredcount() , filter!, istr_dwo[li_idx].ds_suspend_data, 1, filter!)
		return istr_dwo[li_idx].ds_suspend_data.resetupdate()
	end if
NEXT
return 0
end function

public function integer f_set_suspend_report_tab (t_dw_mpl vdw_suspend);string	ls_current_where, ls_sql
int			li_idx1, li_idx2


FOR li_idx1 = 1 to upperbound(iastr_dwo_tabpage[])
	FOR li_idx2 = 1 to upperbound(iastr_dwo_tabpage[li_idx1].str_dwo[])
		if vdw_suspend.dataobject = iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].s_dwo_grid &
			or vdw_suspend.dataobject = iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].s_dwo_form &
			then
			if not isvalid(iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].ds_suspend_data) then iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].ds_suspend_data = create datastore
			iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].ds_suspend_data.dataobject = vdw_suspend.dataobject
//			iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].s_suspend_originalwhere = vdw_suspend.is_originalwhereClause
//			vdw_suspend.f_getCurrentSQL(ls_sql, ls_current_where)
//			iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].s_suspend_sqlnowhere = ls_sql				
//			iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].s_suspend_where = ls_current_where		
//			iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].b_suspend_editing = vdw_suspend.dynamic f_get_ib_editing()
//			iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].str_suspend_rule_attr = vdw_suspend.dynamic f_get_rule_attr()
//			iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].str_suspend_security_attr = vdw_suspend.dynamic f_get_security_attr()			
//			iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].c_suspend_querymode = vdw_suspend.inv_querymode
//			iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].c_suspend_sort = vdw_suspend.inv_sort
			
			vdw_suspend.rowscopy( 1, vdw_suspend.rowcount( ) , primary!,iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].ds_suspend_data, 1, primary!)	
			vdw_suspend.rowscopy( 1, vdw_suspend.filteredcount( ) , filter!,iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].ds_suspend_data, 1, filter!)	
			return iastr_dwo_tabpage[li_idx1].str_dwo[li_idx2].ds_suspend_data.resetupdate()
		end if		
	NEXT
NEXT
return 0
end function

public subroutine f_set_ii_leftpart_width_tabpage (integer vi_tabpage_idx, integer vi_width);iastr_dwo_tabpage[vi_tabpage_idx].i_leftpart_width = vi_width


end subroutine

public subroutine f_set_ii_midpart_width_tabpage (integer vi_tabpage_idx, integer vi_width);iastr_dwo_tabpage[vi_tabpage_idx].i_midpart_width = vi_width


end subroutine

public subroutine f_set_ii_fixedpart1_height_tabpage (integer vi_tabpage_idx, integer vi_height);iastr_dwo_tabpage[vi_tabpage_idx].i_fixedpart1_height = vi_height


end subroutine

public subroutine f_set_ii_upperpart_height_tabpage (integer vi_tabpage_idx, integer vi_height);iastr_dwo_tabpage[vi_tabpage_idx].i_upperpart_height = vi_height


end subroutine

public function long f_update_line_no (t_dw_mpl vdw_line, long vl_start_row, string vs_line_no_colname);long		ll_row
string		ls_sort


ls_sort = vdw_line.Describe("DataWindow.Table.Sort")

vdw_line.setsort( 'line_no a')
vdw_line.sort()
FOR 	ll_row = vl_start_row to vdw_line.rowcount()	
	vdw_line.setitem(ll_row, vs_line_no_colname,ll_row)	
NEXT

vdw_line.setsort(ls_sort)
vdw_line.sort()


return vl_start_row

end function

public function integer f_get_item_ds_adj (date vd_sdate, s_str_item_balance vstr_item_balance, ref t_ds_db rds_item_adj);/****************************************************************************
Chức năng: Lấy số lượng và giá trị tồn kho đầu kỳ theo phương pháp giá bình quân:
				Tồn đầu kỳ không phân biệt control account của item: Nếu 1 mã hàng có 2 tài khoản control trên table balance, tồn đầu kỳ
				được tính bằng tổng balance của 2 account.
---------------------------------------------------------------------------------------------
Tham số: - vd_balance_date: ngày bắt đầu kỳ kho
			 - vstr_item_balance : structure chứa : kho, spec, lot, serial, loc
			 - rdb_open_qty: số đầy kỳ trả về
			 - rdb_open_value: giá trị đầu kỳ trả về 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Return :   1 Thành công
			-1 Lỗi
=====================================================================*/

long				ll_cnt	, ll_idx
string				ls_sql, ls_where,  ls_rtn

t_transaction	lt_transaction
t_s_sql_attr		lastr_sql_attr[]
c_sql				lc_sql

//-- Tính số đầu kỳ --/
rds_item_adj.f_getcurrentsql(ls_sql, ls_where)

this.iw_display.f_get_transaction(lt_transaction )

ll_idx = lc_sql.f_parse( ls_sql + ls_where, lastr_sql_attr[])

//ld_close_date = relativedate(vd_balance_date, -1)
ls_where = " iba.item_id = "+string(vstr_item_balance.db_item_id) + " AND iba.balance_date >= to_date(~~'" + string(vd_sdate,gs_w_date_format)+ "~~',~~'"+gs_w_date_format+"~~')"
if vstr_item_balance.db_wh_id > 0 then
	ls_where += '  AND iba.object_id = ' + string(vstr_item_balance.db_wh_id)
end if
if vstr_item_balance.db_spec_id > 0 then 
	ls_where += '  AND iba.spec_id = ' + string(vstr_item_balance.db_spec_id)
end if
if vstr_item_balance.s_lot_no <> '@' then
	ls_where += "  AND iba.lot_no = ~~'" + vstr_item_balance.s_lot_no + "~~'"
end if
if vstr_item_balance.s_serial_no <> '@' then
	ls_where += "  AND iba.serial_no = ~~'" + vstr_item_balance.s_serial_no + "~~'"	
end if
if vstr_item_balance.db_loc_id > 0 then
	ls_where += '  AND iba.loc_id = ' + string(vstr_item_balance.db_loc_id)	
end if

ls_where +=" AND iba.sob = ~~'"+gs_sob+"~~' AND iba.value_yn = ~~'Y~~'" +" AND iba.company_id = " +string(gi_user_comp_id )

lastr_sql_attr[ll_idx].s_tables += " join (SELECT ID  FROM object  WHERE object.object_ref_table = ~~'WAREHOUSE~~') owh on owh.id = iba.object_id" //-- loại bỏ các object không phải kho--//

lastr_sql_attr[ll_idx].s_where = ls_where
ls_sql = lc_sql.f_assemble( lastr_sql_attr[])

ls_rtn = rds_item_adj.modify("Datawindow.Table.Select= '" + ls_sql +"'")
if ls_rtn  <>'' then
	messagebox('Thông báo','Lỗi modify DW line 47.s_object_display.f_get_item_ds_adj()')
	rollback using lt_transaction;
	return -1
end if

rds_item_adj.f_settransobject( lt_transaction)
ll_cnt = rds_item_adj.retrieve( )


return ll_cnt

end function

public function integer f_get_obj_ds_adj (date vd_sdate, double vdb_obj_id, ref t_ds_db rds_obj_adj);/****************************************************************************
Chức năng: Lấy số lượng và giá trị tồn kho đầu kỳ theo phương pháp giá bình quân:
				Tồn đầu kỳ không phân biệt control account của item: Nếu 1 mã hàng có 2 tài khoản control trên table balance, tồn đầu kỳ
				được tính bằng tổng balance của 2 account.
---------------------------------------------------------------------------------------------
Tham số: - vd_balance_date: ngày bắt đầu kỳ kho
			 - vstr_item_balance : structure chứa : kho, spec, lot, serial, loc
			 - rdb_open_qty: số đầy kỳ trả về
			 - rdb_open_value: giá trị đầu kỳ trả về 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Return :   1 Thành công
			-1 Lỗi
=====================================================================*/

long				ll_cnt	, ll_idx
string				ls_sql, ls_where,  ls_rtn

t_transaction	lt_transaction
t_s_sql_attr		lastr_sql_attr[]
c_sql				lc_sql

//-- Tính số đầu kỳ --/
rds_obj_adj.f_getcurrentsql(ls_sql, ls_where)

this.iw_display.f_get_transaction(lt_transaction )

ll_idx = lc_sql.f_parse( ls_sql + ls_where, lastr_sql_attr[])

//ld_close_date = relativedate(vd_balance_date, -1)
ls_where = " oba.object_id = "+string(vdb_obj_id) + " AND oba.balance_date >= to_date(~~'" + string(vd_sdate,gs_w_date_format)+ "~~',~~'"+gs_w_date_format+"~~')"


ls_where +=" AND oba.sob = ~~'"+gs_sob+"~~' AND oba.company_id = " +string(gi_user_comp_id )  //-- loại các dòng sổ thuế (Long)--//

lastr_sql_attr[ll_idx].s_tables += " join (SELECT ID  FROM object  WHERE object.object_ref_table = ~~'ACCOUNT~~') o_acct on o_acct.id = oba.object_id" //-- loại bỏ các object không phải kho--//

lastr_sql_attr[ll_idx].s_where = ls_where
ls_sql = lc_sql.f_assemble( lastr_sql_attr[])

ls_rtn = rds_obj_adj.modify("Datawindow.Table.Select= '" + ls_sql +"'")
if ls_rtn  <>'' then
	messagebox('Thông báo','Lỗi modify DW line 47.s_object_display.f_get_obj_ds_adj()')
	rollback using lt_transaction;
	return -1
end if

rds_obj_adj.f_settransobject( lt_transaction)
ll_cnt = rds_obj_adj.retrieve( )


return ll_cnt

end function

public function integer f_update_item_out_cost (double vdb_avg_price, s_str_item_balance vstr_item_balance, double vdb_object_ref_id, string vs_object_ref_table, string vs_cost_method, date vd_sdate, date vd_edate, double vdb_in_qty_total, double vdb_in_amt_total, t_ds_db rds_item_adj);/****************************************************************************
Chức năng: cập nhật giá bình quân xuất kho, chưa xử lý nhiều tài khoản control account.
---------------------------------------------------------------------------------------------------------
Tham số: - vdb_avg_price: giá bình quân kỳ trước
			 - vstr_item_balance: struct chứa các thành phần index của table balance
			 - vdb_object_ref_id: id cảa bookedslip tham chiếu
			 - vs_object_ref_table: table ref: BOOKED_SLIP
			 - vs_cost_method: phương pháp tính giá: AVG
			 - vd_sdate: ngày bắt đầu kỳ kho
			 - vd_edate: ngày đóng kỳ thực hiện
	 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Return :   1 Thành công
			-1 Lỗi
=====================================================================*/
long				ll_row_cnt, ll_row, ll_row_insert,ll_count, ll_row_prior_item_fr, ll_row_prior_obj_dr, ll_row_prior_obj_cr
double			ldb_out_price,  ldb_out_base_value, ldb_out_qty, ldb_adj_value,ldb_base_curr_id, ldb_amt_round_id, ldb_in_qty_remain
double			ldb_doc_id, ldb_item_ref_id, ldb_account_dr, ldb_account_cr, ldb_subaccount_dr, ldb_subaccount_cr, ldb_ledger_trans_id
double			ldb_wh_id, ldb_item_id, ldb_loc_id, ldb_spec_id, ld_balance_ref_id, ldb_branch_id, ldb_stock_round, ldb_stock_uom,ldb_in_amt_remain
double			ldb_dr_acct_ctrl, ldb_cr_acct_ctrl, ldb_in_value, ldb_out_value
string				ls_item_ref_table, ls_not_accept_yn, ls_lot_no, ls_serial_no, ls_itemcode,ls_doc_code,ls_line_text
string				ls_uom_code, ls_base_currcode, ls_base_currname, ls_findStr
date				ld_out_cost_trans_date
t_ds_db					lds_item_out_cost, lds_stream_value_adj, lds_dr_obj_adj, lds_cr_obj_adj
t_transaction			lt_transaction
b_obj_instantiate		lbo_instance

lds_item_out_cost = create t_ds_db
lds_item_out_cost.dataobject = 'ds_item_out_cost'
lds_item_out_cost.f_settransobject( sqlca)
lds_item_out_cost.setsort( "trans_Date a")
if lbo_instance.f_is_branch_yn( this.classname( ) ) then
	ldb_branch_id = gdb_branch
else
	ldb_branch_id = 0
end if
ll_row_cnt = lds_item_out_cost.retrieve(gs_sob,gi_user_comp_id,ldb_branch_id, vstr_item_balance.db_item_id,vstr_item_balance.db_wh_id, vstr_item_balance.db_spec_id, &
																vstr_item_balance.db_loc_id, vstr_item_balance.s_lot_no, vstr_item_balance.s_serial_no, vd_sdate, vd_edate )

if ll_row_cnt >0 then															
	this.iw_display.f_get_transaction(lt_transaction)
	lds_stream_value_adj = create t_ds_db
	lds_stream_value_adj.dataobject = 'ds_stream_value_adj'
	lds_stream_value_adj.f_settransobject(lt_transaction )
	ldb_item_id = vstr_item_balance.db_item_id
	lbo_instance.f_get_stock_uom(ldb_item_id, ldb_stock_uom, ls_uom_code)
	ldb_stock_round = ic_unit_instance.f_get_round_id( ldb_stock_uom, ldb_item_id, 'item')	
	this.ic_unit_instance.f_get_base_cur( ldb_base_curr_id, ls_base_currcode, ls_base_currname)
	ldb_amt_round_id = this.ic_unit_instance.f_get_round_id( ldb_base_curr_id,0, 'amount')	
	ldb_in_amt_remain = vdb_in_amt_total
	
	lds_dr_obj_adj = create t_ds_db	
	lds_cr_obj_adj = create t_ds_db
	
	FOR ll_row = 1 to ll_row_cnt
		ldb_out_qty = lds_item_out_cost.getitemnumber( ll_row, 'qty')
		if isnull(ldb_out_qty) then ldb_out_qty = 0

		//-- kiểm tra để bỏ qua trường hợp các mã hàng có phiếu xuất trong kỳ trước mà lập hóa đơn bán trong kỳ này--//
		ldb_item_ref_id = lds_item_out_cost.getitemnumber(ll_row,'ITEM_REF_ID')
		ld_out_cost_trans_date = date(lds_item_out_cost.getitemdatetime(ll_row,'TRANS_DATE'))

		Select count(bks.TRANS_DATE) into :ll_count
		From booked_slip bks join inventory_line ivl on ivl.object_ref_id = bks.id
									join matching mat on mat.f_ref_id = ivl.id
		where mat.t_ref_id = :ldb_item_ref_id and to_char(:ld_out_cost_trans_date,'mm') <> to_char(bks.TRANS_DATE,'mm') using SQLCA;
		if ll_count > 0 then
			continue
		end if
		//-------------------------------------------------------//
		
		vdb_in_qty_total -= ldb_out_qty
		ldb_in_qty_remain = this.ic_unit_instance.f_round( lt_transaction, ldb_stock_round, vdb_in_qty_total)
		if ldb_in_qty_remain < 0 then
			ls_itemcode = lbo_instance.f_get_code(ldb_item_id)
			gf_messagebox('m.s_object_display.f_update_item_out_cost.01', 'Thông báo','Lượng xuất kho ghi sổ nhiều hơn lượng nhập kho, mã hàng:@'+ls_itemcode,'stop','ok',1)
			rollback using lt_transaction;			
			return -1
		end if
		ldb_out_base_value = lds_item_out_cost.getitemnumber( ll_row, 'base_value')
		if isnull(ldb_out_base_value) then ldb_out_base_value = 0

		if ldb_in_qty_remain > 0 then
			ldb_adj_value = vdb_avg_price*ldb_out_qty - ldb_out_base_value		
		else 
			ldb_adj_value = ldb_in_amt_remain - ldb_out_base_value
		end if
		
		//-- làm tròn --//
		 ldb_adj_value = this.ic_unit_instance.f_round( lt_transaction, ldb_amt_round_id, ldb_adj_value)
		 ldb_in_amt_remain -= ldb_out_base_value + ldb_adj_value
		//-- điều chỉnh stream_value --//
		ll_row_insert = lds_stream_value_adj.event e_addrow( )
		lds_stream_value_adj.setitem( ll_row_insert, 'ID', this.f_create_id( ) )
		lds_stream_value_adj.setitem( ll_row_insert, 'stream_value_ref_id', lds_item_out_cost.getitemnumber(ll_row,'ID') )
		lds_stream_value_adj.setitem( ll_row_insert, 'BASE_VALUE',ldb_adj_value )
		lds_stream_value_adj.setitem( ll_row_insert, 'ADJ_DATE',vd_edate )
		lds_stream_value_adj.setitem( ll_row_insert, 'OBJECT_REF_ID',vdb_object_ref_id )
		lds_stream_value_adj.setitem( ll_row_insert, 'OBJECT_REF_TABLE',vs_object_ref_table)
		lds_stream_value_adj.setitem( ll_row_insert, 'COST_METHOD',vs_cost_method )
		//-- điều chỉnh ledger_trans --//
		ldb_doc_id = lds_item_out_cost.getitemnumber(ll_row,'DOC_REF_ID')
		ldb_item_ref_id = lds_item_out_cost.getitemnumber(ll_row,'ITEM_REF_ID')
		ls_item_ref_table = lds_item_out_cost.getitemstring(ll_row,'ITEM_REF_TABLE')
		ldb_wh_id = lds_item_out_cost.getitemnumber(ll_row,'F_OBJECT_ID')
		ldb_loc_id  = lds_item_out_cost.getitemnumber(ll_row,'loc_id')
		if isnull(ldb_loc_id) then ldb_loc_id = 0
		ldb_spec_id = lds_item_out_cost.getitemnumber(ll_row,'spec_id')
		if isnull(ldb_spec_id) then ldb_spec_id = 0
		ls_lot_no = lds_item_out_cost.getitemstring(ll_row,'lot_no')
		if isnull(ls_lot_no) then ls_lot_no = '@'
		ls_serial_no = lds_item_out_cost.getitemstring(ll_row,'serial_no')
		if isnull(ls_serial_no) then ls_serial_no = '@'
		ldb_branch_id =  lds_item_out_cost.getitemnumber(ll_row,'branch_id')
		
		try
			SELECT DR_ACCOUNT_ID, CR_ACCOUNT_ID, DR_SUBACCOUNT, CR_SUBACCOUNT, NOT_ACCEPT_YN,POST_TYPE_TEXT
			INTO :ldb_account_dr, :ldb_account_cr, :ldb_subaccount_dr, :ldb_subaccount_cr, :ls_not_accept_yn, :ls_line_text
			FROM post_line 
			WHERE	 object_ref_ID = :ldb_item_ref_id
			 AND object_ref_table = :ls_item_ref_table 
			 AND  doc_id = :ldb_doc_id
			 AND sob = :gs_sob
			 AND nvl(post_type,'cogs') <> 'revenue'
			 AND company_id = :gi_user_comp_id USING sqlca;
			 
			 if sqlca.sqlcode = 100 then
				//-- không có ledger id --//
				select doc.code into :ls_doc_code
				from document doc
				where doc.id = :ldb_doc_id using sqlca;
				gf_messagebox('m.s_object_display.f_update_item_out_cost.02', 'Thông báo','chứng từ @'+ls_doc_code+'@ chưa ghi sổ tài khoản giá vốn ','stop','ok',1)
				rollback using lt_transaction;
				return -1
			 end if
			 if isnull(ldb_subaccount_dr) then ldb_subaccount_dr = 0
			 if isnull(ldb_subaccount_cr) then ldb_subaccount_cr = 0
			 
//			 if ldb_account_dr = 104505 then debugbreak()
			//-- lấy ds_obj_adj --//	 
			if ldb_dr_acct_ctrl <> ldb_account_dr then
				ldb_dr_acct_ctrl = ldb_account_dr			
				lds_dr_obj_adj.dataobject = 'ds_obj_balance_adj'
				lds_dr_obj_adj.f_settransobject(lt_transaction )				
				this.f_get_obj_ds_adj( vd_sdate, ldb_dr_acct_ctrl, lds_dr_obj_adj)
			end if
			if ldb_cr_acct_ctrl <> ldb_account_cr then
				ldb_cr_acct_ctrl = ldb_account_cr			
				lds_cr_obj_adj.dataobject = 'ds_obj_balance_adj'
				lds_cr_obj_adj.f_settransobject(lt_transaction )				
				this.f_get_obj_ds_adj( vd_sdate, ldb_cr_acct_ctrl, lds_cr_obj_adj)
			end if	
	
			 SELECT ID into :ldb_ledger_trans_id
			 FROM ledger_trans
			 WHERE nvl(not_accept_yn,'@') = nvl(:ls_not_accept_yn,'@')
			 AND DR_ACCOUNT_ID = :ldb_account_dr
			 AND CR_ACCOUNT_ID = :ldb_account_cr
			 AND nvl(DR_SUBACCOUNT,0) = nvl(:ldb_subaccount_dr,0)
			 AND nvl(CR_SUBACCOUNT,0) = nvl(:ldb_subaccount_cr,0)
			 AND DOC_REF_ID = :ldb_doc_id
			 AND NVL(ledger_trans.trans_text,'@') = nvl(:ls_line_text,'@')
			 AND SOB = :gs_sob USING sqlca;			 
			 
			 if ldb_ledger_trans_id = 27758335 then debugbreak()
				
			 INSERT INTO ledger_trans_adj(ID, LEDGER_REF_ID, BASE_AMOUNT, ADJUST_DATE, object_ref_id, object_ref_table)
				VALUES(SEQ_TABLE_ID.NEXTVAL, :ldb_ledger_trans_id, :ldb_adj_value, :vd_edate,:vdb_object_ref_id, :vs_object_ref_table ) using lt_transaction;		
				
			//-----------------------------//
			//-- update item balance --// 
			//----------------------------//					
			//-- lấy số đầu kỳ --//			
//			if ll_row = 1 then
//				ls_findStr = " sob = '"+gs_sob + "' AND company_id = "+string(gi_user_comp_id) + " AND string(balance_date,'yyyymmdd') ='"+ string(vd_sdate,'yyyymmdd') &
//							 +"' AND object_id = "+string(ldb_wh_id) + " AND item_id ="+string(ldb_item_id)+ " AND value_yn ='Y' " &
//							 +" AND (isnull(spec_id) or spec_id = "+string(ldb_spec_id) + ") AND ( isnull(loc_id) or loc_id = " +string(ldb_loc_id) +")" &
//							 + " AND ( isnull(lot_no) or lot_no = '" + ls_lot_no +"') ANd ( isnull(serial_no) or serial_no = '"+ ls_serial_no + "')" &
//							 + " AND ( isnull(ACCOUNT_CONTROL) or ACCOUNT_CONTROL = " +string(ldb_account_cr) +")"
//				ll_row_insert = rds_item_adj.find(ls_findStr, 1, rds_item_adj.rowcount() )
//				if ll_row_insert > 0 then
//					ldb_open_item_adj = rds_item_adj.getitemnumber(ll_row_insert, 'open_base_value')
//					if isnull(ldb_open_item_adj) then ldb_open_item_adj = 0
//				end if
//			end if

			ls_findStr = " sob = '"+gs_sob + "' AND company_id = "+string(gi_user_comp_id) + " AND string(balance_date,'yyyymmdd') ='"+ string(ld_out_cost_trans_date,'yyyymmdd') &
						 +"' AND object_id = "+string(ldb_wh_id) + " AND item_id ="+string(ldb_item_id)+ " AND value_yn ='Y' " &
						 +" AND (isnull(spec_id) or spec_id = "+string(ldb_spec_id) + ") AND ( isnull(loc_id) or loc_id = " +string(ldb_loc_id) +")" &
						 + " AND ( isnull(lot_no) or lot_no = '" + ls_lot_no +"') ANd ( isnull(serial_no) or serial_no = '"+ ls_serial_no + "')" &
						 + " AND ( isnull(ACCOUNT_CONTROL) or ACCOUNT_CONTROL = " +string(ldb_account_cr) +")"
			
			ll_row_insert = rds_item_adj.find(ls_findStr, 1, rds_item_adj.rowcount() )
			if ll_row_insert > 0 then					
//				ldb_in_value = rds_item_adj.getitemnumber(ll_row_insert, "IN_BASE_VALUE")
//				if isnull(ldb_in_value) then ldb_in_value = 0
				ldb_out_value = rds_item_adj.getitemnumber(ll_row_insert, "OUT_BASE_VALUE")
				if isnull(ldb_out_value) then ldb_out_value = 0
//				if ll_row_prior_item_fr <> ll_row_insert and ld_out_cost_trans_date > vd_sdate then
//					rds_item_adj.setitem(ll_row_insert, "OPEN_BASE_VALUE", ldb_open_item_adj)
//				end if
				rds_item_adj.setitem(ll_row_insert, "OUT_BASE_VALUE", ldb_out_value + ldb_adj_value )
//				rds_item_adj.setitem(ll_row_insert, "CLOSE_BASE_VALUE", ldb_open_item_adj + ldb_in_value - ldb_adj_value - ldb_out_value )
			else
				ll_row_insert = rds_item_adj.event e_addrow()
//				ll_row_prior_item_fr = ll_row_insert
//				rds_item_adj.setitem(ll_row_insert, "OPEN_BASE_VALUE", ldb_open_item_adj)
				rds_item_adj.setitem(ll_row_insert, "OUT_BASE_VALUE", ldb_adj_value )
//				rds_item_adj.setitem(ll_row_insert, "CLOSE_BASE_VALUE", ldb_open_item_adj - ldb_adj_value  )	
				
				rds_item_adj.setitem(ll_row_insert, "id", this.f_create_id( ) )
				rds_item_adj.setitem(ll_row_insert, "BALANCE_DATE", ld_out_cost_trans_date)
				rds_item_adj.setitem(ll_row_insert, "ADJUST_DATE", vd_edate)
				rds_item_adj.setitem(ll_row_insert, "object_id", ldb_wh_id)
				rds_item_adj.setitem(ll_row_insert, "item_id", ldb_item_id)
				rds_item_adj.setitem(ll_row_insert, "spec_id", ldb_spec_id)
				rds_item_adj.setitem(ll_row_insert, "loc_id", ldb_loc_id)
				rds_item_adj.setitem(ll_row_insert, "lot_no", ls_lot_no)
				rds_item_adj.setitem(ll_row_insert, "serial_no", ls_serial_no)
				rds_item_adj.setitem(ll_row_insert, "object_ref_id", vdb_object_ref_id)
				rds_item_adj.setitem(ll_row_insert, "value_yn", 'Y')
//				rds_item_adj.setitem(ll_row_insert, "ACCOUNT_CONTROL", ldb_account_cr)
			end if
			//-- ghi nhớ lại số đầu kỳ cho ngày tiếp theo --//
//			ldb_open_item_adj = ldb_open_item_adj + ldb_in_value - ldb_out_value - ldb_adj_value
			
			//-------------------------------//
			//-- update object balance --//
			//------------------------------//
	
			//-- Update DR account --//
			ls_findStr = " sob = '"+gs_sob + "' AND company_id = "+string(gi_user_comp_id) + " AND string(balance_date,'yyyymmdd') ='"+ string(ld_out_cost_trans_date,'yyyymmdd') &
						 +"' AND object_id = "+string(ldb_dr_acct_ctrl) + " AND branch_id ="+string(ldb_branch_id) &
						 +" AND (isnull(ACCOUNT_CONTROL) or ACCOUNT_CONTROL = "+string(ldb_dr_acct_ctrl) +")" &
						 + " AND ( isnull(SUBACCOUNT) or SUBACCOUNT = " +string(ldb_subaccount_dr) +")" 		
						 
			ll_row_insert = lds_dr_obj_adj.find(ls_findStr, 1, lds_dr_obj_adj.rowcount() )
			if ll_row_insert > 0 then					
				ldb_in_value = lds_dr_obj_adj.getitemnumber(ll_row_insert, "DR_BASE_AMOUNT")
				if isnull(ldb_in_value) then ldb_in_value = 0
//				ldb_out_value = lds_dr_obj_adj.getitemnumber(ll_row_insert, "CR_BASE_AMOUNT")
//				if isnull(ldb_out_value) then ldb_out_value = 0
//				if ll_row_prior_obj_dr <> ll_row_insert and ld_out_cost_trans_date > vd_sdate and ll_row > 1 then
//					lds_dr_obj_adj.setitem(ll_row_insert, "OPEN_BASE_AMOUNT", ldb_open_dr_obj_adj)
//				else
//					ldb_open_dr_obj_adj =  lds_dr_obj_adj.getitemnumber(ll_row_insert, "OPEN_BASE_AMOUNT")
//					ll_row_prior_obj_dr = ll_row_insert
//				end if
				lds_dr_obj_adj.setitem(ll_row_insert, "DR_BASE_AMOUNT", ldb_in_value +ldb_adj_value )
//				lds_dr_obj_adj.setitem(ll_row_insert, "CLOSE_BASE_AMOUNT", ldb_open_dr_obj_adj + ldb_in_value + ldb_adj_value - ldb_out_value )
			else
				//--Nếu tìm không thấy trans_date , thi tìm vd_sdate: open DR account --//
//				ls_findStr = " sob = '"+gs_sob + "' AND company_id = "+string(gi_user_comp_id) + " AND string(balance_date,'yyyymmdd') ='"+ string(vd_sdate,'yyyymmdd') &
//							 +"' AND object_id = "+string(ldb_dr_acct_ctrl) + " AND branch_id ="+string(ldb_branch_id) &
//							 +" AND (isnull(ACCOUNT_CONTROL) or ACCOUNT_CONTROL = "+string(ldb_dr_acct_ctrl) +")" &
//							 + " AND ( isnull(SUBACCOUNT) or SUBACCOUNT = " +string(ldb_subaccount_dr) +")" 
//							 
//				ll_row_insert = lds_dr_obj_adj.find(ls_findStr, 1, lds_dr_obj_adj.rowcount() )
//				if ll_row_insert > 0 then
//					ldb_open_dr_obj_adj = lds_dr_obj_adj.getitemnumber(ll_row_insert, 'OPEN_BASE_AMOUNT')
//					if isnull(ldb_open_dr_obj_adj) then ldb_open_dr_obj_adj = 0
//				end if
				
				ll_row_insert = lds_dr_obj_adj.event e_addrow()
//				ll_row_prior_obj_dr = ll_row_insert
//				lds_dr_obj_adj.setitem(ll_row_insert, "OPEN_BASE_AMOUNT", ldb_open_dr_obj_adj)
				lds_dr_obj_adj.setitem(ll_row_insert, "DR_BASE_AMOUNT", ldb_adj_value )
//				lds_dr_obj_adj.setitem(ll_row_insert, "CLOSE_BASE_AMOUNT", ldb_open_dr_obj_adj + ldb_adj_value  )	
				
				lds_dr_obj_adj.setitem(ll_row_insert, "id", this.f_create_id( ) )
				lds_dr_obj_adj.setitem(ll_row_insert, "BALANCE_DATE", ld_out_cost_trans_date)
				lds_dr_obj_adj.setitem(ll_row_insert, "ADJUST_DATE", vd_edate)
				lds_dr_obj_adj.setitem(ll_row_insert, "object_id", ldb_dr_acct_ctrl)
				lds_dr_obj_adj.setitem(ll_row_insert, "branch_id", ldb_branch_id)
				lds_dr_obj_adj.setitem(ll_row_insert, "ACCOUNT_CONTROL", ldb_dr_acct_ctrl)
				lds_dr_obj_adj.setitem(ll_row_insert, "SUBACCOUNT", ldb_subaccount_dr)
				lds_dr_obj_adj.setitem(ll_row_insert, "object_ref_id", vdb_object_ref_id)
			end if
			//-- ghi nhớ lại số đầu kỳ cho ngày tiếp theo --//
//			ldb_open_dr_obj_adj = ldb_open_dr_obj_adj + ldb_in_value - ldb_out_value + ldb_adj_value		

			//-- Update CR account --//
			ls_findStr = " sob = '"+gs_sob + "' AND company_id = "+string(gi_user_comp_id) + " AND string(balance_date,'yyyymmdd') ='"+ string(ld_out_cost_trans_date,'yyyymmdd') &
						 +"' AND object_id = "+string(ldb_cr_acct_ctrl) + " AND branch_id ="+string(ldb_branch_id) &
						 +" AND (isnull(ACCOUNT_CONTROL) or ACCOUNT_CONTROL = "+string(ldb_cr_acct_ctrl) +")" &
						 + " AND ( isnull(SUBACCOUNT) or SUBACCOUNT = " +string(ldb_subaccount_cr) +")" 		
						 
			ll_row_insert = lds_cr_obj_adj.find(ls_findStr, 1, lds_cr_obj_adj.rowcount() )
			if ll_row_insert > 0 then					
//				ldb_in_value = lds_cr_obj_adj.getitemnumber(ll_row_insert, "DR_BASE_AMOUNT")
//				if isnull(ldb_in_value) then ldb_in_value = 0
				ldb_out_value = lds_cr_obj_adj.getitemnumber(ll_row_insert, "CR_BASE_AMOUNT")
				if isnull(ldb_out_value) then ldb_out_value = 0
//				if ll_row_prior_obj_cr <> ll_row_insert and ld_out_cost_trans_date > vd_sdate and ll_row > 1 then
//					lds_cr_obj_adj.setitem(ll_row_insert, "OPEN_BASE_AMOUNT", ldb_open_cr_obj_adj)
//				else
//					ldb_open_cr_obj_adj =  lds_cr_obj_adj.getitemnumber(ll_row_insert, "OPEN_BASE_AMOUNT")
//					ll_row_prior_obj_cr = ll_row_insert
//				end if
				lds_cr_obj_adj.setitem(ll_row_insert, "CR_BASE_AMOUNT", ldb_out_value + ldb_adj_value )
//				lds_cr_obj_adj.setitem(ll_row_insert, "CLOSE_BASE_AMOUNT", ldb_open_cr_obj_adj + ldb_in_value - ldb_adj_value - ldb_out_value )
			else
				//--Nếu không tìm thấy trans_date thì tìm vd_sdate: open CR account --//
//				ls_findStr = " sob = '"+gs_sob + "' AND company_id = "+string(gi_user_comp_id) + " AND string(balance_date,'yyyymmdd') ='"+ string(vd_sdate,'yyyymmdd') &
//							 +"' AND object_id = "+string(ldb_cr_acct_ctrl) + " AND branch_id ="+string(ldb_branch_id) &
//							 +" AND (isnull(ACCOUNT_CONTROL) or ACCOUNT_CONTROL = "+string(ldb_cr_acct_ctrl) +")" &
//							 + " AND ( isnull(SUBACCOUNT) or SUBACCOUNT = " +string(ldb_subaccount_cr) +")" 
//							 
//				ll_row_insert = lds_cr_obj_adj.find(ls_findStr, 1, lds_cr_obj_adj.rowcount() )
//				if ll_row_insert > 0 then
//					ldb_open_cr_obj_adj = lds_cr_obj_adj.getitemnumber(ll_row_insert, 'OPEN_BASE_AMOUNT')
//					if isnull(ldb_open_cr_obj_adj) then ldb_open_cr_obj_adj = 0
//				end if	
//				
				ll_row_insert = lds_cr_obj_adj.event e_addrow()
//				ll_row_prior_obj_cr = ll_row_insert
//				lds_cr_obj_adj.setitem(ll_row_insert, "OPEN_BASE_AMOUNT", ldb_open_cr_obj_adj)
				lds_cr_obj_adj.setitem(ll_row_insert, "CR_BASE_AMOUNT", ldb_adj_value )
//				lds_cr_obj_adj.setitem(ll_row_insert, "CLOSE_BASE_AMOUNT", ldb_open_cr_obj_adj - ldb_adj_value  )	
				
				lds_cr_obj_adj.setitem(ll_row_insert, "id", this.f_create_id( ) )
				lds_cr_obj_adj.setitem(ll_row_insert, "BALANCE_DATE", ld_out_cost_trans_date)
				lds_cr_obj_adj.setitem(ll_row_insert, "ADJUST_DATE", vd_edate)
				lds_cr_obj_adj.setitem(ll_row_insert, "object_id", ldb_cr_acct_ctrl)
				lds_cr_obj_adj.setitem(ll_row_insert, "branch_id", ldb_branch_id)
				lds_cr_obj_adj.setitem(ll_row_insert, "ACCOUNT_CONTROL", ldb_cr_acct_ctrl)
				lds_cr_obj_adj.setitem(ll_row_insert, "SUBACCOUNT", ldb_subaccount_cr)
				lds_cr_obj_adj.setitem(ll_row_insert, "object_ref_id", vdb_object_ref_id)
			end if
			//-- ghi nhớ lại số đầu kỳ cho ngày tiếp theo --//
//			ldb_open_cr_obj_adj = ldb_open_cr_obj_adj + ldb_in_value - ldb_out_value  - ldb_adj_value	
			
			//-- update --//
			if lds_dr_obj_adj.update(true,false) = -1 then
				gf_messagebox('m.s_object_display.f_update_item_out_cost.04', 'Thông báo','Lỗi update:@'+lt_transaction.sqlerrtext,'stop','ok',1)
				rollback using lt_transaction;
				return -1					
			end if
			lds_dr_obj_adj.resetupdate( )
			if lds_cr_obj_adj.update(true,false) = -1 then
				gf_messagebox('m.s_object_display.f_update_item_out_cost.04', 'Thông báo','Lỗi update:@'+lt_transaction.sqlerrtext,'stop','ok',1)
				rollback using lt_transaction;
				return -1					
			end if
			lds_cr_obj_adj.resetupdate( )	
			
		catch (runtimeerror l_rte)
			gf_messagebox('m.s_object_display.f_update_item_out_cost.03', 'Thông báo','Lỗi SQL:@'+lt_transaction.sqlerrtext,'stop','ok',1)
			rollback using lt_transaction;
			return -1
		end try
	NEXT	

	if lds_stream_value_adj.UPdate(true, false ) = -1 then
		gf_messagebox('m.s_object_display.f_update_item_out_cost.04', 'Thông báo','Lỗi update:@'+lt_transaction.sqlerrtext,'stop','ok',1)
		rollback using lt_transaction;
		return -1
	end if
	destroy lds_dr_obj_adj
	destroy lds_cr_obj_adj
	DESTROY lds_stream_value_adj
end if

if rds_item_adj.update(true,false) = -1 then
	gf_messagebox('m.s_object_display.f_update_item_out_cost.04', 'Thông báo','Lỗi update:@'+lt_transaction.sqlerrtext,'stop','ok',1)
	rollback using lt_transaction;
	return -1					
end if
rds_item_adj.resetupdate()


DESTROY lds_item_out_cost

return 1
end function

public function integer f_update_item_transfer_cost (double vdb_avg_price, s_str_item_balance vstr_item_balance, double vdb_object_ref_id, string vs_object_ref_table, string vs_cost_method, date vd_sdate, date vd_edate, ref t_ds_db rds_item_adj);
long				ll_row_cnt, ll_row, ll_row_insert, ll_row_prior_item_fr,ll_row_prior_item_to, ll_row_prior_obj_dr, ll_row_prior_obj_cr
double			ldb_out_price,  ldb_out_base_value, ldb_out_qty, ldb_adj_value,ldb_base_curr_id, ldb_amt_round_id
double			ldb_doc_id, ldb_item_ref_id, ldb_account_dr, ldb_account_cr, ldb_subaccount_dr, ldb_subaccount_cr, ldb_ledger_trans_id
double			ldb_f_wh_id, ldb_t_wh_id, ldb_item_id, ldb_loc_id, ldb_spec_id, ld_balance_ref_id, ldb_branch_id, ldb_dr_acct_ctrl, ldb_cr_acct_ctrl
double			ldb_in_value, ldb_out_value, ldb_open_f_item_adj,ldb_open_t_item_adj, ldb_open_dr_obj_adj, ldb_open_cr_obj_adj
string				ls_item_ref_table, ls_not_accept_yn, ls_lot_no, ls_serial_no, ls_itemcode, ls_base_currcode, ls_base_currname,ls_trans_text, ls_findStr
date				ld_trans_date
t_ds_db			lds_item_transfer_cost, lds_stream_value_adj, lds_dr_obj_adj, lds_cr_obj_adj
t_transaction	lt_transaction
b_obj_instantiate		lbo_ins

lds_item_transfer_cost = create t_ds_db
lds_item_transfer_cost.dataobject = 'ds_item_transfer_cost'
lds_item_transfer_cost.f_settransobject( sqlca)
if lbo_ins.f_is_branch_yn( this.classname( ) ) then
	ldb_branch_id = gdb_branch
else
	ldb_branch_id = 0
end if
ll_row_cnt = lds_item_transfer_cost.retrieve(gs_sob,gi_user_comp_id, vstr_item_balance.db_item_id,vstr_item_balance.db_wh_id, vstr_item_balance.db_spec_id, &
																vstr_item_balance.db_loc_id, vstr_item_balance.s_lot_no, vstr_item_balance.s_serial_no, vd_sdate, vd_edate )
if ll_row_cnt >0 then															
	this.iw_display.f_get_transaction(lt_transaction)
	lds_stream_value_adj = create t_ds_db
	lds_stream_value_adj.dataobject = 'ds_stream_value_adj'
	lds_stream_value_adj.f_settransobject(lt_transaction )
	this.ic_unit_instance.f_get_base_cur( ldb_base_curr_id, ls_base_currcode, ls_base_currname)
	ldb_amt_round_id = this.ic_unit_instance.f_get_round_id( ldb_base_curr_id,0, 'amount')
	
	lds_dr_obj_adj = create t_ds_db

	
	lds_cr_obj_adj = create t_ds_db
	lds_cr_obj_adj.dataobject = 'ds_obj_balance_adj'
	lds_cr_obj_adj.f_settransobject(lt_transaction )	
	
	
	FOR ll_row = 1 to ll_row_cnt
		ldb_out_qty = lds_item_transfer_cost.getitemnumber( ll_row, 'qty')
		if isnull(ldb_out_qty) then ldb_out_qty = 0

		ldb_out_base_value = lds_item_transfer_cost.getitemnumber( ll_row, 'base_value')
		if isnull(ldb_out_base_value) then ldb_out_base_value = 0
		if ldb_out_base_value <> vdb_avg_price*ldb_out_qty then
			ldb_adj_value = vdb_avg_price*ldb_out_qty - ldb_out_base_value
			ldb_adj_value = this.ic_unit_instance.f_round(lt_transaction , ldb_amt_round_id, ldb_adj_value)
			//-- điều chỉnh stream_value --//
			ll_row_insert = lds_stream_value_adj.event e_addrow( )
			lds_stream_value_adj.setitem( ll_row_insert, 'ID', this.f_create_id( ) )
			lds_stream_value_adj.setitem( ll_row_insert, 'stream_value_ref_id', lds_item_transfer_cost.getitemnumber(ll_row,'ID') )
			lds_stream_value_adj.setitem( ll_row_insert, 'BASE_VALUE',ldb_adj_value )
			lds_stream_value_adj.setitem( ll_row_insert, 'ADJ_DATE',vd_edate )
			lds_stream_value_adj.setitem( ll_row_insert, 'OBJECT_REF_ID',vdb_object_ref_id )
			lds_stream_value_adj.setitem( ll_row_insert, 'OBJECT_REF_TABLE',vs_object_ref_table)
			lds_stream_value_adj.setitem( ll_row_insert, 'COST_METHOD',vs_cost_method )
			//-- điều chỉnh ledger_trans --//
			ldb_doc_id = lds_item_transfer_cost.getitemnumber(ll_row,'DOC_REF_ID')
			ldb_item_ref_id = lds_item_transfer_cost.getitemnumber(ll_row,'ITEM_REF_ID')
			ls_item_ref_table = lds_item_transfer_cost.getitemstring(ll_row,'ITEM_REF_TABLE')
			ldb_f_wh_id = lds_item_transfer_cost.getitemnumber(ll_row,'F_OBJECT_ID')
			ldb_t_wh_id = lds_item_transfer_cost.getitemnumber(ll_row,'T_OBJECT_ID')
			ldb_item_id = lds_item_transfer_cost.getitemnumber(ll_row,'item_id')
			ldb_loc_id  = lds_item_transfer_cost.getitemnumber(ll_row,'loc_id')
			if isnull(ldb_loc_id) then ldb_loc_id = 0
			ldb_spec_id = lds_item_transfer_cost.getitemnumber(ll_row,'spec_id')
			if isnull(ldb_spec_id) then ldb_spec_id = 0
			ls_lot_no = lds_item_transfer_cost.getitemstring(ll_row,'lot_no')
			if isnull(ls_lot_no) then ls_lot_no = '@'
			ls_serial_no = lds_item_transfer_cost.getitemstring(ll_row,'serial_no')
			if isnull(ls_serial_no) then ls_serial_no = '@'
			ldb_branch_id =  lds_item_transfer_cost.getitemnumber(ll_row,'branch_id')
			ld_trans_date = date(lds_item_transfer_cost.getitemdatetime(ll_row,'trans_date'))
			try
				SELECT DR_ACCOUNT_ID, CR_ACCOUNT_ID, DR_SUBACCOUNT, CR_SUBACCOUNT, NOT_ACCEPT_YN,POST_TYPE_TEXT
				INTO :ldb_account_dr, :ldb_account_cr, :ldb_subaccount_dr, :ldb_subaccount_cr, :ls_not_accept_yn, :ls_trans_text
				FROM post_line 
				WHERE	 object_ref_ID = :ldb_item_ref_id
				 AND object_ref_table = :ls_item_ref_table 
				 AND  doc_id = :ldb_doc_id
				 AND sob = :gs_sob
				 AND company_id = :gi_user_comp_id USING sqlca;

				 if isnull(ldb_subaccount_dr) then ldb_subaccount_dr = 0
				 if isnull(ldb_subaccount_cr) then ldb_subaccount_cr = 0		
				 
				//-- lấy ds_obj_adj --//	 
				if ldb_dr_acct_ctrl <> ldb_account_dr then
					ldb_dr_acct_ctrl = ldb_account_dr				
					lds_dr_obj_adj.dataobject = 'ds_obj_balance_adj'
					lds_dr_obj_adj.f_settransobject(lt_transaction )					
					this.f_get_obj_ds_adj( vd_sdate, ldb_dr_acct_ctrl, lds_dr_obj_adj)
				end if
				if ldb_cr_acct_ctrl <> ldb_account_cr then
					ldb_cr_acct_ctrl = ldb_account_cr	
					lds_cr_obj_adj.dataobject = 'ds_obj_balance_adj'
					lds_cr_obj_adj.f_settransobject(lt_transaction )						
					this.f_get_obj_ds_adj( vd_sdate, ldb_cr_acct_ctrl, lds_cr_obj_adj)
				end if	
			
				 SELECT ID into :ldb_ledger_trans_id
				 FROM ledger_trans
				 WHERE nvl(not_accept_yn,'@') = nvl(:ls_not_accept_yn,'@')
				 AND nvl(trans_text,'@') = nvl(:ls_trans_text,'@')
				 AND DR_ACCOUNT_ID = :ldb_account_dr
				 AND CR_ACCOUNT_ID = :ldb_account_cr
				 AND nvl(DR_SUBACCOUNT,0) = nvl(:ldb_subaccount_dr,0)
				 AND nvl(CR_SUBACCOUNT,0) = nvl(:ldb_subaccount_cr,0)
				 AND DOC_REF_ID = :ldb_doc_id
				 AND SOB = :gs_sob USING sqlca;
				 
				 INSERT INTO ledger_trans_adj(ID, LEDGER_REF_ID, BASE_AMOUNT, ADJUST_DATE, object_ref_id, object_ref_table)
					VALUES(SEQ_TABLE_ID.NEXTVAL, :ldb_ledger_trans_id, :ldb_adj_value, :vd_edate,:vdb_object_ref_id, :vs_object_ref_table ) using lt_transaction;
															
				//-----------------------------//
				//-- update item balance --// 
				//----------------------------//					
				//-- lấy số đầu kỳ --//			
				if ll_row = 1 then
					//-- F_warehouse --//
					ls_findStr = " sob = '"+gs_sob + "' AND company_id = "+string(gi_user_comp_id) + " AND string(balance_date,'yyyymmdd') ='"+ string(vd_sdate,'yyyymmdd') &
								 +"' AND object_id = "+string(ldb_f_wh_id) + " AND item_id ="+string(ldb_item_id)+ " AND value_yn ='Y' " &
								 +" AND (isnull(spec_id) or spec_id = "+string(ldb_spec_id) + ") AND ( isnull(loc_id) or loc_id = " +string(ldb_loc_id) +")" &
								 + " AND ( isnull(lot_no) or lot_no = '" + ls_lot_no +"') ANd ( isnull(serial_no) or serial_no = '"+ ls_serial_no + "')" &
								 + " AND ( isnull(ACCOUNT_CONTROL) or ACCOUNT_CONTROL = " +string(ldb_account_cr) +")"
					ll_row_insert = rds_item_adj.find(ls_findStr, 1, rds_item_adj.rowcount() )
					if ll_row_insert > 0 then
						ldb_open_f_item_adj = rds_item_adj.getitemnumber(ll_row_insert, 'open_base_value')
						if isnull(ldb_open_f_item_adj) then ldb_open_f_item_adj = 0
					end if
					//-- T_warehouse --//
					ls_findStr = " sob = '"+gs_sob + "' AND company_id = "+string(gi_user_comp_id) + " AND string(balance_date,'yyyymmdd') ='"+ string(vd_sdate,'yyyymmdd') &
								 +"' AND object_id = "+string(ldb_t_wh_id) + " AND item_id ="+string(ldb_item_id)+ " AND value_yn ='Y' " &
								 +" AND (isnull(spec_id) or spec_id = "+string(ldb_spec_id) + ") AND ( isnull(loc_id) or loc_id = " +string(ldb_loc_id) +")" &
								 + " AND ( isnull(lot_no) or lot_no = '" + ls_lot_no +"') ANd ( isnull(serial_no) or serial_no = '"+ ls_serial_no + "')" &
								 + " AND ( isnull(ACCOUNT_CONTROL) or ACCOUNT_CONTROL = " +string(ldb_account_dr) +")"
					ll_row_insert = rds_item_adj.find(ls_findStr, 1, rds_item_adj.rowcount() )
					if ll_row_insert > 0 then
						ldb_open_t_item_adj = rds_item_adj.getitemnumber(ll_row_insert, 'open_base_value')
						if isnull(ldb_open_t_item_adj) then ldb_open_t_item_adj = 0
					end if					
				end if
				
				//-- F_warehouse --//
				ls_findStr = " sob = '"+gs_sob + "' AND company_id = "+string(gi_user_comp_id) + " AND string(balance_date,'yyyymmdd') ='"+ string(ld_Trans_date,'yyyymmdd') &
							 +"' AND object_id = "+string(ldb_f_wh_id) + " AND item_id ="+string(ldb_item_id)+ " AND value_yn ='Y' " &
							 +" AND (isnull(spec_id) or spec_id = "+string(ldb_spec_id) + ") AND ( isnull(loc_id) or loc_id = " +string(ldb_loc_id) +")" &
							 + " AND ( isnull(lot_no) or lot_no = '" + ls_lot_no +"') ANd ( isnull(serial_no) or serial_no = '"+ ls_serial_no + "')" &
							 + " AND ( isnull(ACCOUNT_CONTROL) or ACCOUNT_CONTROL = " +string(ldb_account_cr) +")"
				
				ll_row_insert = rds_item_adj.find(ls_findStr, 1, rds_item_adj.rowcount() )
				if ll_row_insert > 0 then					
					ldb_in_value = rds_item_adj.getitemnumber(ll_row_insert, "IN_BASE_VALUE")
					if isnull(ldb_in_value) then ldb_in_value = 0
					ldb_out_value = rds_item_adj.getitemnumber(ll_row_insert, "OUT_BASE_VALUE")
					if isnull(ldb_out_value) then ldb_out_value = 0
					if ll_row_prior_item_fr <> ll_row_insert and ld_Trans_date > vd_sdate then
						rds_item_adj.setitem(ll_row_insert, "OPEN_BASE_VALUE", ldb_open_f_item_adj)
					end if
					rds_item_adj.setitem(ll_row_insert, "OUT_BASE_VALUE", ldb_in_value +ldb_adj_value )
					rds_item_adj.setitem(ll_row_insert, "CLOSE_BASE_VALUE", ldb_open_f_item_adj + ldb_in_value - ldb_adj_value - ldb_out_value )
				else
					ll_row_insert = rds_item_adj.event e_addrow()
					ll_row_prior_item_fr = ll_row_insert
					rds_item_adj.setitem(ll_row_insert, "OPEN_BASE_VALUE", ldb_open_f_item_adj)
					rds_item_adj.setitem(ll_row_insert, "OUT_BASE_VALUE", ldb_adj_value )
					rds_item_adj.setitem(ll_row_insert, "CLOSE_BASE_VALUE", ldb_open_f_item_adj - ldb_adj_value  )	
					
					rds_item_adj.setitem(ll_row_insert, "id", this.f_create_id( ) )
					rds_item_adj.setitem(ll_row_insert, "BALANCE_DATE", ld_Trans_date)
					rds_item_adj.setitem(ll_row_insert, "ADJUST_DATE", vd_edate)
					rds_item_adj.setitem(ll_row_insert, "object_id", ldb_f_wh_id)
					rds_item_adj.setitem(ll_row_insert, "item_id", ldb_item_id)
					rds_item_adj.setitem(ll_row_insert, "spec_id", ldb_spec_id)
					rds_item_adj.setitem(ll_row_insert, "loc_id", ldb_loc_id)
					rds_item_adj.setitem(ll_row_insert, "lot_no", ls_lot_no)
					rds_item_adj.setitem(ll_row_insert, "serial_no", ls_serial_no)
					rds_item_adj.setitem(ll_row_insert, "object_ref_id", vdb_object_ref_id)
					rds_item_adj.setitem(ll_row_insert, "value_yn", 'Y')
					rds_item_adj.setitem(ll_row_insert, "ACCOUNT_CONTROL", ldb_account_dr)
				end if
				//-- ghi nhớ lại số đầu kỳ cho ngày tiếp theo --//
				ldb_open_f_item_adj = ldb_open_f_item_adj + ldb_in_value - ldb_out_value - ldb_adj_value

				//-- T_warehouse --//
				ls_findStr = " sob = '"+gs_sob + "' AND company_id = "+string(gi_user_comp_id) + " AND string(balance_date,'yyyymmdd') ='"+ string(ld_Trans_date,'yyyymmdd') &
							 +"' AND object_id = "+string(ldb_t_wh_id) + " AND item_id ="+string(ldb_item_id)+ " AND value_yn ='Y' " &
							 +" AND (isnull(spec_id) or spec_id = "+string(ldb_spec_id) + ") AND ( isnull(loc_id) or loc_id = " +string(ldb_loc_id) +")" &
							 + " AND ( isnull(lot_no) or lot_no = '" + ls_lot_no +"') ANd ( isnull(serial_no) or serial_no = '"+ ls_serial_no + "')" &
							 + " AND ( isnull(ACCOUNT_CONTROL) or ACCOUNT_CONTROL = " +string(ldb_account_dr) +")"
				
				ll_row_insert = rds_item_adj.find(ls_findStr, 1, rds_item_adj.rowcount() )
				if ll_row_insert > 0 then					
					ldb_in_value = rds_item_adj.getitemnumber(ll_row_insert, "IN_BASE_VALUE")
					if isnull(ldb_in_value) then ldb_in_value = 0
					ldb_out_value = rds_item_adj.getitemnumber(ll_row_insert, "OUT_BASE_VALUE")
					if isnull(ldb_out_value) then ldb_out_value = 0
					if ll_row_prior_item_to <> ll_row_insert and ld_Trans_date > vd_sdate then
						rds_item_adj.setitem(ll_row_insert, "OPEN_BASE_VALUE", ldb_open_t_item_adj)
					end if
					rds_item_adj.setitem(ll_row_insert, "IN_BASE_VALUE", ldb_in_value +ldb_adj_value )
					rds_item_adj.setitem(ll_row_insert, "CLOSE_BASE_VALUE", ldb_open_t_item_adj + ldb_in_value + ldb_adj_value - ldb_out_value )
				else
					ll_row_insert = rds_item_adj.event e_addrow()
					ll_row_prior_item_to = ll_row_insert
					rds_item_adj.setitem(ll_row_insert, "OPEN_BASE_VALUE", ldb_open_t_item_adj)
					rds_item_adj.setitem(ll_row_insert, "IN_BASE_VALUE", ldb_adj_value )
					rds_item_adj.setitem(ll_row_insert, "CLOSE_BASE_VALUE", ldb_open_t_item_adj + ldb_adj_value  )	
					
					rds_item_adj.setitem(ll_row_insert, "id", this.f_create_id( ) )
					rds_item_adj.setitem(ll_row_insert, "BALANCE_DATE", ld_Trans_date)
					rds_item_adj.setitem(ll_row_insert, "ADJUST_DATE", vd_edate)
					rds_item_adj.setitem(ll_row_insert, "object_id", ldb_t_wh_id)
					rds_item_adj.setitem(ll_row_insert, "item_id", ldb_item_id)
					rds_item_adj.setitem(ll_row_insert, "spec_id", ldb_spec_id)
					rds_item_adj.setitem(ll_row_insert, "loc_id", ldb_loc_id)
					rds_item_adj.setitem(ll_row_insert, "lot_no", ls_lot_no)
					rds_item_adj.setitem(ll_row_insert, "serial_no", ls_serial_no)
					rds_item_adj.setitem(ll_row_insert, "object_ref_id", vdb_object_ref_id)
					rds_item_adj.setitem(ll_row_insert, "value_yn", 'Y')
					rds_item_adj.setitem(ll_row_insert, "ACCOUNT_CONTROL", ldb_account_dr)
				end if
				//-- ghi nhớ lại số đầu kỳ cho ngày tiếp theo --//
				ldb_open_t_item_adj = ldb_open_t_item_adj + ldb_in_value - ldb_out_value + ldb_adj_value
				
				//-------------------------------//
				//-- update object balance --//
				//------------------------------//
				if ll_row = 1 then

		
				end if			
				//-- Update DR account --//
				ls_findStr = " sob = '"+gs_sob + "' AND company_id = "+string(gi_user_comp_id) + " AND string(balance_date,'yyyymmdd') ='"+ string(ld_Trans_date,'yyyymmdd') &
							 +"' AND object_id = "+string(ldb_dr_acct_ctrl) + " AND branch_id ="+string(ldb_branch_id) &
							 +" AND (isnull(ACCOUNT_CONTROL) or ACCOUNT_CONTROL = "+string(ldb_dr_acct_ctrl) +")" &
							 + " AND ( isnull(SUBACCOUNT) or SUBACCOUNT = " +string(ldb_subaccount_dr) +")" 		
							 
				ll_row_insert = lds_dr_obj_adj.find(ls_findStr, 1, lds_dr_obj_adj.rowcount() )
				if ll_row_insert > 0 then					
					ldb_in_value = lds_dr_obj_adj.getitemnumber(ll_row_insert, "DR_BASE_AMOUNT")
					if isnull(ldb_in_value) then ldb_in_value = 0
					ldb_out_value = lds_dr_obj_adj.getitemnumber(ll_row_insert, "CR_BASE_AMOUNT")
					if isnull(ldb_out_value) then ldb_out_value = 0
					if ll_row_prior_obj_dr <> ll_row_insert  and ld_Trans_date > vd_sdate  and ll_row > 1 then
						lds_dr_obj_adj.setitem(ll_row_insert, "OPEN_BASE_AMOUNT", ldb_open_dr_obj_adj)
					end if
					lds_dr_obj_adj.setitem(ll_row_insert, "DR_BASE_AMOUNT", ldb_in_value +ldb_adj_value )
					lds_dr_obj_adj.setitem(ll_row_insert, "CLOSE_BASE_AMOUNT", ldb_open_dr_obj_adj + ldb_in_value + ldb_adj_value - ldb_out_value )
				else
					//-- nếu không tìm thấy tans_date , thì tìm vd_sdate: open DR account --//
					ls_findStr = " sob = '"+gs_sob + "' AND company_id = "+string(gi_user_comp_id) + " AND string(balance_date,'yyyymmdd') ='"+ string(vd_sdate,'yyyymmdd') &
								 +"' AND object_id = "+string(ldb_dr_acct_ctrl) + " AND branch_id ="+string(ldb_branch_id) &
								 +" AND (isnull(ACCOUNT_CONTROL) or ACCOUNT_CONTROL = "+string(ldb_dr_acct_ctrl) +")" &
								 + " AND ( isnull(SUBACCOUNT) or SUBACCOUNT = " +string(ldb_subaccount_dr) +")" 
								 
					ll_row_insert = lds_dr_obj_adj.find(ls_findStr, 1, lds_dr_obj_adj.rowcount() )
					if ll_row_insert > 0 then
						ldb_open_dr_obj_adj = lds_dr_obj_adj.getitemnumber(ll_row_insert, 'OPEN_BASE_AMOUNT')
						if isnull(ldb_open_dr_obj_adj) then ldb_open_dr_obj_adj = 0
					end if
					
					ll_row_insert = lds_dr_obj_adj.event e_addrow()
					ll_row_prior_obj_dr = ll_row_insert
					lds_dr_obj_adj.setitem(ll_row_insert, "OPEN_BASE_AMOUNT", ldb_open_dr_obj_adj)
					lds_dr_obj_adj.setitem(ll_row_insert, "DR_BASE_AMOUNT", ldb_adj_value )
					lds_dr_obj_adj.setitem(ll_row_insert, "CLOSE_BASE_AMOUNT", ldb_open_dr_obj_adj + ldb_adj_value  )	
					
					lds_dr_obj_adj.setitem(ll_row_insert, "id", this.f_create_id( ) )
					lds_dr_obj_adj.setitem(ll_row_insert, "BALANCE_DATE", ld_Trans_date)
					lds_dr_obj_adj.setitem(ll_row_insert, "ADJUST_DATE", vd_edate)
					lds_dr_obj_adj.setitem(ll_row_insert, "object_id", ldb_dr_acct_ctrl)
					lds_dr_obj_adj.setitem(ll_row_insert, "branch_id", ldb_branch_id)
					lds_dr_obj_adj.setitem(ll_row_insert, "ACCOUNT_CONTROL", ldb_dr_acct_ctrl)
					lds_dr_obj_adj.setitem(ll_row_insert, "SUBACCOUNT", ldb_subaccount_dr)
					lds_dr_obj_adj.setitem(ll_row_insert, "object_ref_id", vdb_object_ref_id)
				end if
				//-- ghi nhớ lại số đầu kỳ cho ngày tiếp theo --//
				ldb_open_dr_obj_adj = ldb_open_dr_obj_adj + ldb_in_value - ldb_out_value + ldb_adj_value		

				//-- Update CR account --//
				ls_findStr = " sob = '"+gs_sob + "' AND company_id = "+string(gi_user_comp_id) + " AND string(balance_date,'yyyymmdd') ='"+ string(ld_Trans_date,'yyyymmdd') &
							 +"' AND object_id = "+string(ldb_cr_acct_ctrl) + " AND branch_id ="+string(ldb_branch_id) &
							 +" AND (isnull(ACCOUNT_CONTROL) or ACCOUNT_CONTROL = "+string(ldb_cr_acct_ctrl) +")" &
							 + " AND ( isnull(SUBACCOUNT) or SUBACCOUNT = " +string(ldb_subaccount_cr) +")" 		
							 
				ll_row_insert = lds_cr_obj_adj.find(ls_findStr, 1, lds_cr_obj_adj.rowcount() )
				if ll_row_insert > 0 then					
					ldb_in_value = lds_cr_obj_adj.getitemnumber(ll_row_insert, "DR_BASE_AMOUNT")
					if isnull(ldb_in_value) then ldb_in_value = 0
					ldb_out_value = lds_cr_obj_adj.getitemnumber(ll_row_insert, "CR_BASE_AMOUNT")
					if isnull(ldb_out_value) then ldb_out_value = 0
					if ll_row_prior_obj_cr <> ll_row_insert and ld_Trans_date > vd_sdate   and ll_row > 1 then
						lds_cr_obj_adj.setitem(ll_row_insert, "OPEN_BASE_AMOUNT", ldb_open_cr_obj_adj)
					end if 
					lds_cr_obj_adj.setitem(ll_row_insert, "CR_BASE_AMOUNT", ldb_out_value + ldb_adj_value )
					lds_cr_obj_adj.setitem(ll_row_insert, "CLOSE_BASE_AMOUNT", ldb_open_cr_obj_adj + ldb_in_value - ldb_adj_value - ldb_out_value )
				else
					//-- nếu không tìm thấy tans_date , thì tìm vd_sdate:open CR account --//
					ls_findStr = " sob = '"+gs_sob + "' AND company_id = "+string(gi_user_comp_id) + " AND string(balance_date,'yyyymmdd') ='"+ string(vd_sdate,'yyyymmdd') &
								 +"' AND object_id = "+string(ldb_cr_acct_ctrl) + " AND branch_id ="+string(ldb_branch_id) &
								 +" AND (isnull(ACCOUNT_CONTROL) or ACCOUNT_CONTROL = "+string(ldb_cr_acct_ctrl) +")" &
								 + " AND ( isnull(SUBACCOUNT) or SUBACCOUNT = " +string(ldb_subaccount_cr) +")" 
								 
					ll_row_insert = lds_cr_obj_adj.find(ls_findStr, 1, lds_cr_obj_adj.rowcount() )
					if ll_row_insert > 0 then
						ldb_open_cr_obj_adj = lds_cr_obj_adj.getitemnumber(ll_row_insert, 'OPEN_BASE_AMOUNT')
						if isnull(ldb_open_cr_obj_adj) then ldb_open_cr_obj_adj = 0
					end if			
					
					ll_row_insert = lds_cr_obj_adj.event e_addrow()
					ll_row_prior_obj_cr = ll_row_insert
					lds_cr_obj_adj.setitem(ll_row_insert, "OPEN_BASE_AMOUNT", ldb_open_cr_obj_adj)
					lds_cr_obj_adj.setitem(ll_row_insert, "CR_BASE_AMOUNT", ldb_adj_value )
					lds_cr_obj_adj.setitem(ll_row_insert, "CLOSE_BASE_AMOUNT", ldb_open_cr_obj_adj - ldb_adj_value  )	
					
					lds_cr_obj_adj.setitem(ll_row_insert, "id", this.f_create_id( ) )
					lds_cr_obj_adj.setitem(ll_row_insert, "BALANCE_DATE", ld_Trans_date)
					lds_cr_obj_adj.setitem(ll_row_insert, "ADJUST_DATE", vd_edate)
					lds_cr_obj_adj.setitem(ll_row_insert, "object_id", ldb_cr_acct_ctrl)
					lds_cr_obj_adj.setitem(ll_row_insert, "branch_id", ldb_branch_id)
					lds_cr_obj_adj.setitem(ll_row_insert, "ACCOUNT_CONTROL", ldb_cr_acct_ctrl)
					lds_cr_obj_adj.setitem(ll_row_insert, "SUBACCOUNT", ldb_subaccount_cr)
					lds_cr_obj_adj.setitem(ll_row_insert, "object_ref_id", vdb_object_ref_id)
				end if
				//-- ghi nhớ lại số đầu kỳ cho ngày tiếp theo --//
				ldb_open_cr_obj_adj = ldb_open_cr_obj_adj + ldb_in_value - ldb_out_value  - ldb_adj_value		
				
				//-- update --//
				if lds_dr_obj_adj.update(true,false) = -1 then
					gf_messagebox('m.s_object_display.f_update_item_transfer_cost.02', 'Thông báo','Lỗi update:@'+lt_transaction.sqlerrtext,'stop','ok',1)
					rollback using lt_transaction;
					return -1					
				end if
				lds_dr_obj_adj.resetupdate( )
				if lds_cr_obj_adj.update(true,false) = -1 then
					gf_messagebox('m.s_object_display.f_update_item_transfer_cost.02', 'Thông báo','Lỗi update:@'+lt_transaction.sqlerrtext,'stop','ok',1)
					rollback using lt_transaction;
					return -1					
				end if
				lds_cr_obj_adj.resetupdate( )	
								
			catch (runtimeerror l_rte)
				gf_messagebox('m.s_object_display.f_update_item_transfer_cost.01', 'Thông báo','Lỗi SQL:@'+lt_transaction.sqlerrtext,'stop','ok',1)
				rollback using lt_transaction;
				return -1
			end try
			
		end if		
	NEXT	

	if lds_stream_value_adj.UPdate(true, false ) = -1 then
		gf_messagebox('m.s_object_display.f_update_item_transfer_cost.02', 'Thông báo','Lỗi update:@'+lt_transaction.sqlerrtext,'stop','ok',1)
		rollback using lt_transaction;
		return -1
	end if
	destroy lds_dr_obj_adj
	destroy lds_cr_obj_adj
	DESTROY lds_stream_value_adj
end if

if rds_item_adj.update(true,false) = -1 then
	gf_messagebox('m.s_object_display.f_update_item_transfer_cost.02', 'Thông báo','Lỗi update:@'+lt_transaction.sqlerrtext,'stop','ok',1)
	rollback using lt_transaction;
	return -1					
end if
rds_item_adj.resetupdate()

DESTROY lds_item_transfer_cost

return 1
end function

public function integer f_update_item_cust_return_cost_inperiod (double vdb_avg_price, t_ds_db vds_item_cust_return, double vdb_object_ref_id, string vs_object_ref_table, string vs_cost_method, date vd_sdate, date vd_edate, ref t_ds_db rds_item_adj);
long				ll_row_cnt, ll_row, ll_row_insert, ll_cnt, ll_row_prior_item_to, ll_row_prior_obj_dr, ll_row_prior_obj_cr
double			ldb_rtn_price,  ldb_rtn_base_value, ldb_rtn_qty, ldb_adj_value, ldb_base_curr_id, ldb_amt_round_id
double			ldb_dr_acct_ctrl, ldb_cr_acct_ctrl, ldb_in_value, ldb_out_value, ldb_rtn_open_obj_dr, ldb_rtn_open_obj_cr
double			ldb_doc_id, ldb_item_ref_id, ldb_account_dr, ldb_account_cr, ldb_subaccount_dr, ldb_subaccount_cr, ldb_ledger_trans_id
double			ldb_wh_id, ldb_item_id, ldb_loc_id, ldb_spec_id, ld_balance_ref_id, ldb_branch_id, ldb_open_item_adj
string				ls_item_ref_table, ls_not_accept_yn, ls_lot_no, ls_serial_no, ls_base_currcode, ls_base_currname, ls_trans_text, ls_findStr
date				ld_trans_date
t_ds_db			lds_stream_value_adj, lds_dr_obj_adj, lds_cr_obj_adj
t_transaction	lt_transaction



ll_row_cnt = vds_item_cust_return.rowcount()
if ll_row_cnt >0 then															
	this.iw_display.f_get_transaction(lt_transaction)
	lds_stream_value_adj = create t_ds_db
	lds_stream_value_adj.dataobject = 'ds_stream_value_adj'
	lds_stream_value_adj.f_settransobject(lt_transaction )
	this.ic_unit_instance.f_get_base_cur( ldb_base_curr_id, ls_base_currcode, ls_base_currname)
	ldb_amt_round_id = this.ic_unit_instance.f_get_round_id( ldb_base_curr_id,0, 'amount')

	lds_dr_obj_adj = create t_ds_db
	lds_cr_obj_adj = create t_ds_db

	
	FOR ll_row = 1 to ll_row_cnt
		ldb_rtn_qty = vds_item_cust_return.getitemnumber( ll_row, 'qty')
		if isnull(ldb_rtn_qty) then ldb_rtn_qty = 0
		ldb_rtn_base_value = vds_item_cust_return.getitemnumber( ll_row, 'base_value')
		if isnull(ldb_rtn_base_value) then ldb_rtn_base_value = 0
		if ldb_rtn_base_value <> vdb_avg_price*ldb_rtn_qty then
			ldb_adj_value = vdb_avg_price*ldb_rtn_qty - ldb_rtn_base_value
			ldb_adj_value =  this.ic_unit_instance.f_round(lt_transaction , ldb_amt_round_id, ldb_adj_value)
			//-- điều chỉnh stream_value --//
			ll_row_insert = lds_stream_value_adj.event e_addrow( )
			lds_stream_value_adj.setitem( ll_row_insert, 'ID', this.f_create_id( ) )
			lds_stream_value_adj.setitem( ll_row_insert, 'stream_value_ref_id', vds_item_cust_return.getitemnumber(ll_row,'ID') )
			lds_stream_value_adj.setitem( ll_row_insert, 'BASE_VALUE',ldb_adj_value )
			lds_stream_value_adj.setitem( ll_row_insert, 'ADJ_DATE',vd_edate )
			lds_stream_value_adj.setitem( ll_row_insert, 'OBJECT_REF_ID',vdb_object_ref_id )
			lds_stream_value_adj.setitem( ll_row_insert, 'OBJECT_REF_TABLE',vs_object_ref_table)
			lds_stream_value_adj.setitem( ll_row_insert, 'COST_METHOD',vs_cost_method )
			//-- điều chỉnh ledger_trans --//
			ldb_doc_id = vds_item_cust_return.getitemnumber(ll_row,'DOC_REF_ID')
			ldb_item_ref_id = vds_item_cust_return.getitemnumber(ll_row,'ITEM_REF_ID')
			ls_item_ref_table = vds_item_cust_return.getitemstring(ll_row,'ITEM_REF_TABLE')
			ldb_wh_id = vds_item_cust_return.getitemnumber(ll_row,'T_OBJECT_ID')
			ldb_item_id = vds_item_cust_return.getitemnumber(ll_row,'item_id')
			ldb_loc_id  = vds_item_cust_return.getitemnumber(ll_row,'loc_id')
			if isnull(ldb_loc_id) then ldb_loc_id = 0
			ldb_spec_id = vds_item_cust_return.getitemnumber(ll_row,'spec_id')
			if isnull(ldb_spec_id) then ldb_spec_id = 0
			ls_lot_no = vds_item_cust_return.getitemstring(ll_row,'lot_no')
			if isnull(ls_lot_no) then ls_lot_no = '@'
			ls_serial_no = vds_item_cust_return.getitemstring(ll_row,'serial_no')
			if isnull(ls_serial_no) then ls_serial_no = '@'
			ldb_branch_id =  vds_item_cust_return.getitemnumber(ll_row,'branch_id')
			ld_trans_date = date(vds_item_cust_return.getitemdatetime(ll_row,'trans_date'))
			try
				SELECT DR_ACCOUNT_ID, CR_ACCOUNT_ID, DR_SUBACCOUNT, CR_SUBACCOUNT, NOT_ACCEPT_YN, POST_TYPE_TEXT
				INTO :ldb_account_dr, :ldb_account_cr, :ldb_subaccount_dr, :ldb_subaccount_cr, :ls_not_accept_yn, :ls_trans_text
				FROM post_line 
				WHERE	 object_ref_ID = :ldb_item_ref_id
				 AND object_ref_table = :ls_item_ref_table 
				 AND  doc_id = :ldb_doc_id
				 AND sob = :gs_sob
				 AND company_id = :gi_user_comp_id USING sqlca;
				 
				 if isnull(ldb_subaccount_dr) then ldb_subaccount_dr = 0
				 if isnull(ldb_subaccount_cr) then ldb_subaccount_cr = 0		
				 
				//-- lấy ds_obj_adj --//	  
				if ldb_dr_acct_ctrl <> ldb_account_dr then
					ldb_dr_acct_ctrl = ldb_account_dr				
					lds_dr_obj_adj.dataobject = 'ds_obj_balance_adj'
					lds_dr_obj_adj.f_settransobject(lt_transaction )					
					this.f_get_obj_ds_adj( vd_sdate, ldb_dr_acct_ctrl, lds_dr_obj_adj)
				end if
				if ldb_cr_acct_ctrl <> ldb_account_cr then
					ldb_cr_acct_ctrl = ldb_account_cr				
					lds_cr_obj_adj.dataobject = 'ds_obj_balance_adj'
					lds_cr_obj_adj.f_settransobject(lt_transaction )					
					this.f_get_obj_ds_adj( vd_sdate, ldb_cr_acct_ctrl, lds_cr_obj_adj)
				end if
				
				 SELECT ID into :ldb_ledger_trans_id
				 FROM ledger_trans
				 WHERE nvl(not_accept_yn,'@') = nvl(:ls_not_accept_yn,'@')
				 AND nvl(trans_text,'@') = nvl(:ls_trans_text,'@')
				 AND DR_ACCOUNT_ID = :ldb_account_dr
				 AND CR_ACCOUNT_ID = :ldb_account_cr
				 AND nvl(DR_SUBACCOUNT,0) = nvl(:ldb_subaccount_dr,0)
				 AND nvl(CR_SUBACCOUNT,0) = nvl(:ldb_subaccount_cr,0)
				 AND DOC_REF_ID = :ldb_doc_id
				 AND SOB = :gs_sob USING sqlca;
				 
				INSERT INTO ledger_trans_adj(ID, LEDGER_REF_ID, BASE_AMOUNT, ADJUST_DATE, object_ref_id, object_ref_table)
					VALUES(SEQ_TABLE_ID.NEXTVAL, :ldb_ledger_trans_id, :ldb_adj_value, :vd_edate,:vdb_object_ref_id, :vs_object_ref_table ) using lt_transaction;				 
				//-----------------------------//
				//-- update item balance --// 
				//----------------------------//					
				//-- lấy số đầu kỳ --//			
				if ll_row = 1 then
					ls_findStr = " sob = '"+gs_sob + "' AND company_id = "+string(gi_user_comp_id) + " AND string(balance_date,'yyyymmdd') ='"+ string(vd_sdate,'yyyymmdd') &
								 +"' AND object_id = "+string(ldb_wh_id) + " AND item_id ="+string(ldb_item_id)+ " AND value_yn ='Y' " &
								 +" AND (isnull(spec_id) or spec_id = "+string(ldb_spec_id) + ") AND ( isnull(loc_id) or loc_id = " +string(ldb_loc_id) +")" &
								 + " AND ( isnull(lot_no) or lot_no = '" + ls_lot_no +"') ANd ( isnull(serial_no) or serial_no = '"+ ls_serial_no + "')" &
								 + " AND ( isnull(ACCOUNT_CONTROL) or ACCOUNT_CONTROL = " +string(ldb_account_dr) +")"
					ll_row_insert = rds_item_adj.find(ls_findStr, 1, rds_item_adj.rowcount() )
					if ll_row_insert > 0 then
						ldb_open_item_adj = rds_item_adj.getitemnumber(ll_row_insert, 'open_base_value')
						if isnull(ldb_open_item_adj) then ldb_open_item_adj = 0
					end if
				end if

				ls_findStr = " sob = '"+gs_sob + "' AND company_id = "+string(gi_user_comp_id) + " AND string(balance_date,'yyyymmdd') ='"+ string(ld_Trans_date,'yyyymmdd') &
							 +"' AND object_id = "+string(ldb_wh_id) + " AND item_id ="+string(ldb_item_id)+ " AND value_yn ='Y' " &
							 +" AND (isnull(spec_id) or spec_id = "+string(ldb_spec_id) + ") AND ( isnull(loc_id) or loc_id = " +string(ldb_loc_id) +")" &
							 + " AND ( isnull(lot_no) or lot_no = '" + ls_lot_no +"') ANd ( isnull(serial_no) or serial_no = '"+ ls_serial_no + "')" &
							 + " AND ( isnull(ACCOUNT_CONTROL) or ACCOUNT_CONTROL = " +string(ldb_account_dr) +")"
				
				ll_row_insert = rds_item_adj.find(ls_findStr, 1, rds_item_adj.rowcount() )
				if ll_row_insert > 0 then					
					ldb_in_value = rds_item_adj.getitemnumber(ll_row_insert, "IN_BASE_VALUE")
					if isnull(ldb_in_value) then ldb_in_value = 0
					ldb_out_value = rds_item_adj.getitemnumber(ll_row_insert, "OUT_BASE_VALUE")
					if isnull(ldb_out_value) then ldb_out_value = 0
					if ll_row_prior_item_to <> ll_row_insert and ld_Trans_date > vd_sdate then
						rds_item_adj.setitem(ll_row_insert, "OPEN_BASE_VALUE", ldb_open_item_adj)
					end if
					rds_item_adj.setitem(ll_row_insert, "IN_BASE_VALUE", ldb_in_value +ldb_adj_value )
					rds_item_adj.setitem(ll_row_insert, "CLOSE_BASE_VALUE", ldb_open_item_adj + ldb_in_value + ldb_adj_value - ldb_out_value )
				else
					ll_row_insert = rds_item_adj.event e_addrow()
					ll_row_prior_item_to = ll_row_insert
					rds_item_adj.setitem(ll_row_insert, "OPEN_BASE_VALUE", ldb_open_item_adj)
					rds_item_adj.setitem(ll_row_insert, "IN_BASE_VALUE", ldb_adj_value )
					rds_item_adj.setitem(ll_row_insert, "CLOSE_BASE_VALUE", ldb_open_item_adj + ldb_adj_value  )	
					
					rds_item_adj.setitem(ll_row_insert, "id", this.f_create_id( ) )
					rds_item_adj.setitem(ll_row_insert, "BALANCE_DATE", ld_Trans_date)
					rds_item_adj.setitem(ll_row_insert, "ADJUST_DATE", vd_edate)
					rds_item_adj.setitem(ll_row_insert, "object_id", ldb_wh_id)
					rds_item_adj.setitem(ll_row_insert, "item_id", ldb_item_id)
					rds_item_adj.setitem(ll_row_insert, "spec_id", ldb_spec_id)
					rds_item_adj.setitem(ll_row_insert, "loc_id", ldb_loc_id)
					rds_item_adj.setitem(ll_row_insert, "lot_no", ls_lot_no)
					rds_item_adj.setitem(ll_row_insert, "serial_no", ls_serial_no)
					rds_item_adj.setitem(ll_row_insert, "object_ref_id", vdb_object_ref_id)
					rds_item_adj.setitem(ll_row_insert, "value_yn", 'Y')
					rds_item_adj.setitem(ll_row_insert, "ACCOUNT_CONTROL", ldb_account_dr)
				end if
				//-- ghi nhớ lại số đầu kỳ cho ngày tiếp theo --//
				ldb_open_item_adj = ldb_open_item_adj + ldb_in_value - ldb_out_value + ldb_adj_value
				
				//-------------------------------//
				//-- update object balance --//
				//------------------------------//
	
				//-- Update DR account --//
				ls_findStr = " sob = '"+gs_sob + "' AND company_id = "+string(gi_user_comp_id) + " AND string(balance_date,'yyyymmdd') ='"+ string(ld_Trans_date,'yyyymmdd') &
							 +"' AND object_id = "+string(ldb_dr_acct_ctrl) + " AND branch_id ="+string(ldb_branch_id) &
							 +" AND (isnull(ACCOUNT_CONTROL) or ACCOUNT_CONTROL = "+string(ldb_dr_acct_ctrl) +")" &
							 + " AND ( isnull(SUBACCOUNT) or SUBACCOUNT = " +string(ldb_subaccount_dr) +")" 		
							 
				ll_row_insert = lds_dr_obj_adj.find(ls_findStr, 1, lds_dr_obj_adj.rowcount() )
				if ll_row_insert > 0 then					
					ldb_in_value = lds_dr_obj_adj.getitemnumber(ll_row_insert, "DR_BASE_AMOUNT")
					if isnull(ldb_in_value) then ldb_in_value = 0
					ldb_out_value = lds_dr_obj_adj.getitemnumber(ll_row_insert, "CR_BASE_AMOUNT")
					if isnull(ldb_out_value) then ldb_out_value = 0
					if ll_row_prior_obj_dr <> ll_row_insert and ld_Trans_date > vd_sdate  and ll_row > 1 then
						lds_dr_obj_adj.setitem(ll_row_insert, "OPEN_BASE_AMOUNT", ldb_rtn_open_obj_dr)
					end if					
					lds_dr_obj_adj.setitem(ll_row_insert, "DR_BASE_AMOUNT", ldb_in_value +ldb_adj_value )
					lds_dr_obj_adj.setitem(ll_row_insert, "CLOSE_BASE_AMOUNT", ldb_rtn_open_obj_dr + ldb_in_value + ldb_adj_value - ldb_out_value )
				else
					//--Nếu không có ngày trans_date thì tìm theo ngày vd_sdate: open DR account --//
					ls_findStr = " sob = '"+gs_sob + "' AND company_id = "+string(gi_user_comp_id) + " AND string(balance_date,'yyyymmdd') ='"+ string(vd_sdate,'yyyymmdd') &
								 +"' AND object_id = "+string(ldb_dr_acct_ctrl) + " AND branch_id ="+string(ldb_branch_id) &
								 +" AND (isnull(ACCOUNT_CONTROL) or ACCOUNT_CONTROL = "+string(ldb_dr_acct_ctrl) +")" &
								 + " AND ( isnull(SUBACCOUNT) or SUBACCOUNT = " +string(ldb_subaccount_dr) +")" 
								 
					ll_row_insert = lds_dr_obj_adj.find(ls_findStr, 1, lds_dr_obj_adj.rowcount() )
					if ll_row_insert > 0 then
						ldb_rtn_open_obj_dr = lds_dr_obj_adj.getitemnumber(ll_row_insert, 'OPEN_BASE_AMOUNT')
						if isnull(ldb_rtn_open_obj_dr) then ldb_rtn_open_obj_dr = 0
					end if
					
					ll_row_insert = lds_dr_obj_adj.event e_addrow()
					ll_row_prior_obj_dr = ll_row_insert
					lds_dr_obj_adj.setitem(ll_row_insert, "OPEN_BASE_AMOUNT", ldb_rtn_open_obj_dr)
					lds_dr_obj_adj.setitem(ll_row_insert, "DR_BASE_AMOUNT", ldb_adj_value )
					lds_dr_obj_adj.setitem(ll_row_insert, "CLOSE_BASE_AMOUNT", ldb_rtn_open_obj_dr + ldb_adj_value  )	
					
					lds_dr_obj_adj.setitem(ll_row_insert, "id", this.f_create_id( ) )
					lds_dr_obj_adj.setitem(ll_row_insert, "BALANCE_DATE", ld_Trans_date)
					lds_dr_obj_adj.setitem(ll_row_insert, "ADJUST_DATE", vd_edate)
					lds_dr_obj_adj.setitem(ll_row_insert, "object_id", ldb_dr_acct_ctrl)
					lds_dr_obj_adj.setitem(ll_row_insert, "branch_id", ldb_branch_id)
					lds_dr_obj_adj.setitem(ll_row_insert, "ACCOUNT_CONTROL", ldb_dr_acct_ctrl)
					lds_dr_obj_adj.setitem(ll_row_insert, "SUBACCOUNT", ldb_subaccount_dr)
					lds_dr_obj_adj.setitem(ll_row_insert, "object_ref_id", vdb_object_ref_id)
				end if
				//-- ghi nhớ lại số đầu kỳ cho ngày tiếp theo --//
				ldb_rtn_open_obj_dr = ldb_rtn_open_obj_dr + ldb_in_value - ldb_out_value + ldb_adj_value		

				//-- Update CR account --//
				ls_findStr = " sob = '"+gs_sob + "' AND company_id = "+string(gi_user_comp_id) + " AND string(balance_date,'yyyymmdd') ='"+ string(ld_Trans_date,'yyyymmdd') &
							 +"' AND object_id = "+string(ldb_cr_acct_ctrl) + " AND branch_id ="+string(ldb_branch_id) &
							 +" AND (isnull(ACCOUNT_CONTROL) or ACCOUNT_CONTROL = "+string(ldb_cr_acct_ctrl) +")" &
							 + " AND ( isnull(SUBACCOUNT) or SUBACCOUNT = " +string(ldb_subaccount_cr) +")" 		
							 
				ll_row_insert = lds_cr_obj_adj.find(ls_findStr, 1, lds_cr_obj_adj.rowcount() )
				if ll_row_insert > 0 then					
					ldb_in_value = lds_cr_obj_adj.getitemnumber(ll_row_insert, "DR_BASE_AMOUNT")
					if isnull(ldb_in_value) then ldb_in_value = 0
					ldb_out_value = lds_cr_obj_adj.getitemnumber(ll_row_insert, "CR_BASE_AMOUNT")
					if isnull(ldb_out_value) then ldb_out_value = 0
					if ll_row_prior_obj_cr <> ll_row_insert  and ld_Trans_date > vd_sdate and ll_row > 1  then
						lds_cr_obj_adj.setitem(ll_row_insert, "OPEN_BASE_AMOUNT", ldb_rtn_open_obj_cr)
					end if										
					lds_cr_obj_adj.setitem(ll_row_insert, "CR_BASE_AMOUNT", ldb_out_value + ldb_adj_value )
					lds_cr_obj_adj.setitem(ll_row_insert, "CLOSE_BASE_AMOUNT", ldb_rtn_open_obj_cr + ldb_in_value - ldb_adj_value - ldb_out_value )
				else
					//-- Nếu không có ngày trans_date thì tìm theo ngày vd_sdate : open CR account --//
					ls_findStr = " sob = '"+gs_sob + "' AND company_id = "+string(gi_user_comp_id) + " AND string(balance_date,'yyyymmdd') ='"+ string(vd_sdate,'yyyymmdd') &
								 +"' AND object_id = "+string(ldb_cr_acct_ctrl) + " AND branch_id ="+string(ldb_branch_id) &
								 +" AND (isnull(ACCOUNT_CONTROL) or ACCOUNT_CONTROL = "+string(ldb_cr_acct_ctrl) +")" &
								 + " AND ( isnull(SUBACCOUNT) or SUBACCOUNT = " +string(ldb_subaccount_cr) +")" 
								 
					ll_row_insert = lds_cr_obj_adj.find(ls_findStr, 1, lds_cr_obj_adj.rowcount() )
					if ll_row_insert > 0 then
						ldb_rtn_open_obj_cr = lds_cr_obj_adj.getitemnumber(ll_row_insert, 'OPEN_BASE_AMOUNT')
						if isnull(ldb_rtn_open_obj_cr) then ldb_rtn_open_obj_cr = 0
					end if			
					
					ll_row_insert = lds_cr_obj_adj.event e_addrow()
					ll_row_prior_obj_cr = ll_row_insert
					lds_cr_obj_adj.setitem(ll_row_insert, "OPEN_BASE_AMOUNT", ldb_rtn_open_obj_cr)
					lds_cr_obj_adj.setitem(ll_row_insert, "CR_BASE_AMOUNT", ldb_adj_value )
					lds_cr_obj_adj.setitem(ll_row_insert, "CLOSE_BASE_AMOUNT", ldb_rtn_open_obj_cr - ldb_adj_value  )	
					
					lds_cr_obj_adj.setitem(ll_row_insert, "id", this.f_create_id( ) )
					lds_dr_obj_adj.setitem(ll_row_insert, "BALANCE_DATE", ld_Trans_date)
					lds_cr_obj_adj.setitem(ll_row_insert, "ADJUST_DATE", vd_edate)
					lds_cr_obj_adj.setitem(ll_row_insert, "object_id", ldb_cr_acct_ctrl)
					lds_cr_obj_adj.setitem(ll_row_insert, "branch_id", ldb_branch_id)
					lds_cr_obj_adj.setitem(ll_row_insert, "ACCOUNT_CONTROL", ldb_cr_acct_ctrl)
					lds_cr_obj_adj.setitem(ll_row_insert, "SUBACCOUNT", ldb_subaccount_cr)
					lds_cr_obj_adj.setitem(ll_row_insert, "object_ref_id", vdb_object_ref_id)
				end if
				//-- ghi nhớ lại số đầu kỳ cho ngày tiếp theo --//
				ldb_rtn_open_obj_cr = ldb_rtn_open_obj_cr + ldb_in_value - ldb_out_value  - ldb_adj_value		
				
				//-- update --//
				if lds_dr_obj_adj.update(true,false) = -1 then
					gf_messagebox('m.s_object_display.f_update_item_cust_return_cost_inperiod.02', 'Thông báo','Lỗi update:@'+lt_transaction.sqlerrtext,'stop','ok',1)
					rollback using lt_transaction;
					return -1					
				end if
				lds_dr_obj_adj.resetupdate( )
				if lds_cr_obj_adj.update(true,false) = -1 then
					gf_messagebox('m.s_object_display.f_update_item_cust_return_cost_inperiod.02', 'Thông báo','Lỗi update:@'+lt_transaction.sqlerrtext,'stop','ok',1)
					rollback using lt_transaction;
					return -1					
				end if
				lds_cr_obj_adj.resetupdate( )	
				
			catch (runtimeerror l_rte)
				gf_messagebox('m.s_object_display.f_update_item_cust_return_cost_inperiod.01', 'Thông báo','Lỗi SQL:@'+lt_transaction.sqlerrtext,'stop','ok',1)
				rollback using lt_transaction;
				return -1
			end try

		end if		
	NEXT	

	
	if lds_stream_value_adj.UPdate(true, false ) = -1 then
		gf_messagebox('m.s_object_display.f_update_item_cust_return_cost_inperiod.02', 'Thông báo','Lỗi update:@'+lt_transaction.sqlerrtext,'stop','ok',1)
		rollback using lt_transaction;
		return -1
	end if
	destroy lds_dr_obj_adj
	destroy lds_cr_obj_adj
	DESTROY lds_stream_value_adj
end if

if rds_item_adj.update(true,false) = -1 then
	gf_messagebox('m.s_object_display.f_update_item_cust_return_cost_inperiod.02', 'Thông báo','Lỗi update:@'+lt_transaction.sqlerrtext,'stop','ok',1)
	rollback using lt_transaction;
	return -1					
end if
rds_item_adj.resetupdate()


return 1
end function

public function integer f_update_item_cust_return_cost_prior (double vdb_avg_price, s_str_item_balance vstr_item_balance, double vdb_object_ref_id, string vs_object_ref_table, string vs_cost_method, date vd_sdate, date vd_edate, ref t_ds_db rds_item_adj);/****************************************************************************
Chức năng: cập nhật giá trả hàng của kỳ trước
-----------------------------------------------------------
Tham số: - vdb_avg_price: giá bình quân kỳ trước
			 - vstr_item_balance: struct chứa các thành phần index của table balance
			 - vdb_object_ref_id: id cảa bookedslip tham chiếu
			 - vs_object_ref_table: table ref: BOOKED_SLIP
			 - vs_cost_method: phương pháp tính giá: AVG
			 - vd_sdate: ngày bắt đầu kỳ kho
			 - vd_edate: ngày đóng kỳ thực hiện
			 - rdb_rtn_qty: số lượng trả hàng
			 - rdb_rtn_value_act: giá trị trả hàng
			 - rdb_rtn_value_adj: giá trị điều chỉnh
	 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Return :   1 Thành công
			-1 Lỗi
=====================================================================*/
long				ll_row_cnt, ll_row, ll_row_insert, ll_row_prior_item_to, ll_row_prior_obj_dr, ll_row_prior_obj_cr
double			ldb_rtn_price,  ldb_rtn_base_value, ldb_rtn_qty, ldb_adj_value, ldb_amt_round_id, ldb_base_curr_id, ldb_in_value, ldb_out_value
double			ldb_doc_id, ldb_item_ref_id, ldb_account_dr, ldb_account_cr, ldb_subaccount_dr, ldb_subaccount_cr, ldb_ledger_trans_id
double			ldb_wh_id, ldb_item_id, ldb_loc_id, ldb_spec_id, ld_balance_ref_id, ldb_branch_id, ldb_open_item_adj
double			ldb_dr_acct_ctrl, ldb_cr_acct_ctrl, ldb_open_dr_obj_adj, ldb_open_cr_obj_adj, ldb_rtn_open_obj_dr, ldb_rtn_open_obj_cr
string				ls_item_ref_table, ls_not_accept_yn, ls_lot_no, ls_serial_no, ls_base_currcode, ls_base_currname, ls_trans_text, ls_findStr
date				ld_Trans_date

t_ds_db			lds_item_cust_return_prior, lds_stream_value_adj, lds_dr_obj_adj, lds_cr_obj_adj
t_transaction	lt_transaction
b_obj_instantiate		lobj_ins

lds_item_cust_return_prior = create t_ds_db
lds_item_cust_return_prior.dataobject = 'ds_item_cust_return_prior'
lds_item_cust_return_prior.f_settransobject( sqlca)
lds_item_cust_return_prior.setsort( "trans_Date a")
lds_item_cust_return_prior.setsort( "trans_Date a")

if lobj_ins.f_is_branch_yn( this.classname( ) ) then
	ldb_branch_id = gdb_branch
else
	ldb_branch_id = 0 
end if

ll_row_cnt = lds_item_cust_return_prior.retrieve(gs_sob,gi_user_comp_id,ldb_branch_id, vstr_item_balance.db_item_id,vstr_item_balance.db_wh_id, vstr_item_balance.db_spec_id, &
																vstr_item_balance.db_loc_id, vstr_item_balance.s_lot_no, vstr_item_balance.s_serial_no, vd_sdate, vd_edate )
if ll_row_cnt >0 then															
	this.iw_display.f_get_transaction(lt_transaction)
	lds_stream_value_adj = create t_ds_db
	lds_stream_value_adj.dataobject = 'ds_stream_value_adj'
	lds_stream_value_adj.f_settransobject(lt_transaction )
	this.ic_unit_instance.f_get_base_cur( ldb_base_curr_id, ls_base_currcode, ls_base_currname)
	ldb_amt_round_id = this.ic_unit_instance.f_get_round_id( ldb_base_curr_id,0, 'amount')

	lds_dr_obj_adj = create t_ds_db
	lds_cr_obj_adj = create t_ds_db

	
	FOR ll_row = 1 to ll_row_cnt
		ldb_rtn_qty = lds_item_cust_return_prior.getitemnumber( ll_row, 'qty')
		if isnull(ldb_rtn_qty) then ldb_rtn_qty = 0
		ldb_rtn_base_value = lds_item_cust_return_prior.getitemnumber( ll_row, 'base_value')
		if isnull(ldb_rtn_base_value) then ldb_rtn_base_value = 0
		if ldb_rtn_base_value <> vdb_avg_price*ldb_rtn_qty then
			ldb_adj_value = vdb_avg_price*ldb_rtn_qty - ldb_rtn_base_value
			ldb_adj_value = this.ic_unit_instance.f_round( lt_transaction, ldb_amt_round_id, ldb_adj_value)
			//-- điều chỉnh stream_value --//
			ll_row_insert = lds_stream_value_adj.event e_addrow( )
			lds_stream_value_adj.setitem( ll_row_insert, 'ID', this.f_create_id( ) )
			lds_stream_value_adj.setitem( ll_row_insert, 'stream_value_ref_id', lds_item_cust_return_prior.getitemnumber(ll_row,'ID') )
			lds_stream_value_adj.setitem( ll_row_insert, 'BASE_VALUE',ldb_adj_value )
			lds_stream_value_adj.setitem( ll_row_insert, 'ADJ_DATE',vd_edate )
			lds_stream_value_adj.setitem( ll_row_insert, 'OBJECT_REF_ID',vdb_object_ref_id )
			lds_stream_value_adj.setitem( ll_row_insert, 'OBJECT_REF_TABLE',vs_object_ref_table)
			lds_stream_value_adj.setitem( ll_row_insert, 'COST_METHOD',vs_cost_method )
			//-- điều chỉnh ledger_trans --//
			ldb_doc_id = lds_item_cust_return_prior.getitemnumber(ll_row,'DOC_REF_ID')
			ldb_item_ref_id = lds_item_cust_return_prior.getitemnumber(ll_row,'ITEM_REF_ID')
			ls_item_ref_table = lds_item_cust_return_prior.getitemstring(ll_row,'ITEM_REF_TABLE')
			ldb_wh_id = lds_item_cust_return_prior.getitemnumber(ll_row,'T_OBJECT_ID')
			ldb_item_id = lds_item_cust_return_prior.getitemnumber(ll_row,'item_id')
			ldb_loc_id  = lds_item_cust_return_prior.getitemnumber(ll_row,'loc_id')
			if isnull(ldb_loc_id) then ldb_loc_id = 0
			ldb_spec_id = lds_item_cust_return_prior.getitemnumber(ll_row,'spec_id')
			if isnull(ldb_spec_id) then ldb_spec_id = 0
			ls_lot_no = lds_item_cust_return_prior.getitemstring(ll_row,'lot_no')
			if isnull(ls_lot_no) then ls_lot_no = '@'
			ls_serial_no = lds_item_cust_return_prior.getitemstring(ll_row,'serial_no')
			if isnull(ls_serial_no) then ls_serial_no = '@'
			ldb_branch_id =  lds_item_cust_return_prior.getitemnumber(ll_row,'branch_id')
			ld_Trans_date = date(lds_item_cust_return_prior.getitemdatetime(ll_row,'trans_date'))
			try
				//-- lấy tài khoản adjust --//
				SELECT DR_ACCOUNT_ID, CR_ACCOUNT_ID, DR_SUBACCOUNT, CR_SUBACCOUNT, NOT_ACCEPT_YN, POST_TYPE_TEXT
				INTO :ldb_account_dr, :ldb_account_cr, :ldb_subaccount_dr, :ldb_subaccount_cr, :ls_not_accept_yn, :ls_trans_text
				FROM post_line 
				WHERE	 object_ref_ID = :ldb_item_ref_id
				 AND object_ref_table = :ls_item_ref_table 
				 AND  doc_id = :ldb_doc_id
				 AND sob = :gs_sob
				 AND company_id = :gi_user_comp_id USING sqlca;

				 if isnull(ldb_subaccount_dr) then ldb_subaccount_dr = 0
				 if isnull(ldb_subaccount_cr) then ldb_subaccount_cr = 0		
				 
				//-- lấy ds_obj_adj --//	 
				if ldb_dr_acct_ctrl <> ldb_account_dr then
					ldb_dr_acct_ctrl = ldb_account_dr				
					lds_dr_obj_adj.dataobject = 'ds_obj_balance_adj'
					lds_dr_obj_adj.f_settransobject(lt_transaction )					
					this.f_get_obj_ds_adj( vd_sdate, ldb_dr_acct_ctrl, lds_dr_obj_adj)
				end if
				if ldb_cr_acct_ctrl <> ldb_account_cr then
					ldb_cr_acct_ctrl = ldb_account_cr				
					lds_cr_obj_adj.dataobject = 'ds_obj_balance_adj'
					lds_cr_obj_adj.f_settransobject(lt_transaction )					
					this.f_get_obj_ds_adj( vd_sdate, ldb_cr_acct_ctrl, lds_cr_obj_adj)
				end if
				
				 SELECT ID into :ldb_ledger_trans_id
				 FROM ledger_trans
				 WHERE nvl(not_accept_yn,'@') = nvl(:ls_not_accept_yn,'@')
				 AND nvl(trans_text,'@') = nvl(:ls_trans_text,'@')
				 AND DR_ACCOUNT_ID = :ldb_account_dr
				 AND CR_ACCOUNT_ID = :ldb_account_cr
				 AND nvl(DR_SUBACCOUNT,0) = nvl(:ldb_subaccount_dr,0)
				 AND nvl(CR_SUBACCOUNT,0) = nvl(:ldb_subaccount_cr,0)
				 AND DOC_REF_ID = :ldb_doc_id
				 AND SOB = :gs_sob USING sqlca;
				 
				 INSERT INTO ledger_trans_adj(ID, LEDGER_REF_ID, BASE_AMOUNT, ADJUST_DATE, object_ref_id, object_ref_table)
					VALUES(SEQ_TABLE_ID.NEXTVAL, :ldb_ledger_trans_id, :ldb_adj_value, :vd_edate,:vdb_object_ref_id, :vs_object_ref_table ) using lt_transaction;
					
				//-----------------------------//
				//-- update item balance --// 
				//----------------------------//					
				//-- lấy số đầu kỳ --//			
				if ll_row = 1 then
					ls_findStr = " sob = '"+gs_sob + "' AND company_id = "+string(gi_user_comp_id) + " AND string(balance_date,'yyyymmdd') ='"+ string(vd_sdate,'yyyymmdd') &
								 +"' AND object_id = "+string(ldb_wh_id) + " AND item_id ="+string(ldb_item_id)+ " AND value_yn ='Y' " &
								 +" AND (isnull(spec_id) or spec_id = "+string(ldb_spec_id) + ") AND ( isnull(loc_id) or loc_id = " +string(ldb_loc_id) +")" &
								 + " AND ( isnull(lot_no) or lot_no = '" + ls_lot_no +"') ANd ( isnull(serial_no) or serial_no = '"+ ls_serial_no + "')" &
								 + " AND ( isnull(ACCOUNT_CONTROL) or ACCOUNT_CONTROL = " +string(ldb_account_dr) +")"
					ll_row_insert = rds_item_adj.find(ls_findStr, 1, rds_item_adj.rowcount() )
					if ll_row_insert > 0 then
						ldb_open_item_adj = rds_item_adj.getitemnumber(ll_row_insert, 'open_base_value')
						if isnull(ldb_open_item_adj) then ldb_open_item_adj = 0
					end if
				end if

				ls_findStr = " sob = '"+gs_sob + "' AND company_id = "+string(gi_user_comp_id) + " AND string(balance_date,'yyyymmdd') ='"+ string(ld_Trans_date,'yyyymmdd') &
							 +"' AND object_id = "+string(ldb_wh_id) + " AND item_id ="+string(ldb_item_id)+ " AND value_yn ='Y' " &
							 +" AND (isnull(spec_id) or spec_id = "+string(ldb_spec_id) + ") AND ( isnull(loc_id) or loc_id = " +string(ldb_loc_id) +")" &
							 + " AND ( isnull(lot_no) or lot_no = '" + ls_lot_no +"') ANd ( isnull(serial_no) or serial_no = '"+ ls_serial_no + "')" &
							 + " AND ( isnull(ACCOUNT_CONTROL) or ACCOUNT_CONTROL = " +string(ldb_account_dr) +")"
				
				ll_row_insert = rds_item_adj.find(ls_findStr, 1, rds_item_adj.rowcount() )
				if ll_row_insert > 0 then					
					ldb_in_value = rds_item_adj.getitemnumber(ll_row_insert, "IN_BASE_VALUE")
					if isnull(ldb_in_value) then ldb_in_value = 0
					ldb_out_value = rds_item_adj.getitemnumber(ll_row_insert, "OUT_BASE_VALUE")
					if isnull(ldb_out_value) then ldb_out_value = 0
					if ll_row_prior_item_to <> ll_row_insert and ld_Trans_date > vd_sdate then
						rds_item_adj.setitem(ll_row_insert, "OPEN_BASE_VALUE", ldb_open_item_adj)
					end if
					rds_item_adj.setitem(ll_row_insert, "IN_BASE_VALUE", ldb_in_value +ldb_adj_value )
					rds_item_adj.setitem(ll_row_insert, "CLOSE_BASE_VALUE", ldb_open_item_adj + ldb_in_value + ldb_adj_value - ldb_out_value )
				else
					ll_row_insert = rds_item_adj.event e_addrow()
					ll_row_prior_item_to = ll_row_insert
					rds_item_adj.setitem(ll_row_insert, "OPEN_BASE_VALUE", ldb_open_item_adj)
					rds_item_adj.setitem(ll_row_insert, "IN_BASE_VALUE", ldb_adj_value )
					rds_item_adj.setitem(ll_row_insert, "CLOSE_BASE_VALUE", ldb_open_item_adj + ldb_adj_value  )	
					
					rds_item_adj.setitem(ll_row_insert, "id", this.f_create_id( ) )
					rds_item_adj.setitem(ll_row_insert, "BALANCE_DATE", ld_Trans_date)
					rds_item_adj.setitem(ll_row_insert, "ADJUST_DATE", vd_edate)
					rds_item_adj.setitem(ll_row_insert, "object_id", ldb_wh_id)
					rds_item_adj.setitem(ll_row_insert, "item_id", ldb_item_id)
					rds_item_adj.setitem(ll_row_insert, "spec_id", ldb_spec_id)
					rds_item_adj.setitem(ll_row_insert, "loc_id", ldb_loc_id)
					rds_item_adj.setitem(ll_row_insert, "lot_no", ls_lot_no)
					rds_item_adj.setitem(ll_row_insert, "serial_no", ls_serial_no)
					rds_item_adj.setitem(ll_row_insert, "object_ref_id", vdb_object_ref_id)
					rds_item_adj.setitem(ll_row_insert, "value_yn", 'Y')
					rds_item_adj.setitem(ll_row_insert, "ACCOUNT_CONTROL", ldb_account_dr)
				end if
				//-- ghi nhớ lại số đầu kỳ cho ngày tiếp theo --//
				ldb_open_item_adj = ldb_open_item_adj + ldb_in_value - ldb_out_value + ldb_adj_value
				
				//-------------------------------//
				//-- update object balance --//
				//------------------------------//
	
				//-- Update DR account --//
				ls_findStr = " sob = '"+gs_sob + "' AND company_id = "+string(gi_user_comp_id) + " AND string(balance_date,'yyyymmdd') ='"+ string(ld_Trans_date,'yyyymmdd') &
							 +"' AND object_id = "+string(ldb_dr_acct_ctrl) + " AND branch_id ="+string(ldb_branch_id) &
							 +" AND (isnull(ACCOUNT_CONTROL) or ACCOUNT_CONTROL = "+string(ldb_dr_acct_ctrl) +")" &
							 + " AND ( isnull(SUBACCOUNT) or SUBACCOUNT = " +string(ldb_subaccount_dr) +")" 		
							 
				ll_row_insert = lds_dr_obj_adj.find(ls_findStr, 1, lds_dr_obj_adj.rowcount() )
				if ll_row_insert > 0 then					
					ldb_in_value = lds_dr_obj_adj.getitemnumber(ll_row_insert, "DR_BASE_AMOUNT")
					if isnull(ldb_in_value) then ldb_in_value = 0
					ldb_out_value = lds_dr_obj_adj.getitemnumber(ll_row_insert, "CR_BASE_AMOUNT")
					if isnull(ldb_out_value) then ldb_out_value = 0
					if ll_row_prior_obj_dr <> ll_row_insert and ld_Trans_date > vd_sdate  and ll_row > 1 then
						lds_dr_obj_adj.setitem(ll_row_insert, "OPEN_BASE_AMOUNT", ldb_rtn_open_obj_dr)
					end if
					lds_dr_obj_adj.setitem(ll_row_insert, "DR_BASE_AMOUNT", ldb_in_value +ldb_adj_value )
					lds_dr_obj_adj.setitem(ll_row_insert, "CLOSE_BASE_AMOUNT", ldb_rtn_open_obj_dr + ldb_in_value + ldb_adj_value - ldb_out_value )
				else
					//--Nếu không tìm thấy trans_date thì tìm vd_sdate: open DR account --//
					ls_findStr = " sob = '"+gs_sob + "' AND company_id = "+string(gi_user_comp_id) + " AND string(balance_date,'yyyymmdd') ='"+ string(vd_sdate,'yyyymmdd') &
								 +"' AND object_id = "+string(ldb_dr_acct_ctrl) + " AND branch_id ="+string(ldb_branch_id) &
								 +" AND (isnull(ACCOUNT_CONTROL) or ACCOUNT_CONTROL = "+string(ldb_dr_acct_ctrl) +")" &
								 + " AND ( isnull(SUBACCOUNT) or SUBACCOUNT = " +string(ldb_subaccount_dr) +")" 
								 
					ll_row_insert = lds_dr_obj_adj.find(ls_findStr, 1, lds_dr_obj_adj.rowcount() )
					if ll_row_insert > 0 then
						ldb_rtn_open_obj_dr = lds_dr_obj_adj.getitemnumber(ll_row_insert, 'OPEN_BASE_AMOUNT')
						if isnull(ldb_rtn_open_obj_dr) then ldb_rtn_open_obj_dr = 0
					end if			
					
					ll_row_insert = lds_dr_obj_adj.event e_addrow()
					ll_row_prior_obj_dr = ll_row_insert
					lds_dr_obj_adj.setitem(ll_row_insert, "OPEN_BASE_AMOUNT", ldb_rtn_open_obj_dr)
					lds_dr_obj_adj.setitem(ll_row_insert, "DR_BASE_AMOUNT", ldb_adj_value )
					lds_dr_obj_adj.setitem(ll_row_insert, "CLOSE_BASE_AMOUNT", ldb_rtn_open_obj_dr + ldb_adj_value  )	
					
					lds_dr_obj_adj.setitem(ll_row_insert, "id", this.f_create_id( ) )
					lds_dr_obj_adj.setitem(ll_row_insert, "BALANCE_DATE", ld_Trans_date)
					lds_dr_obj_adj.setitem(ll_row_insert, "ADJUST_DATE", vd_edate)
					lds_dr_obj_adj.setitem(ll_row_insert, "object_id", ldb_dr_acct_ctrl)
					lds_dr_obj_adj.setitem(ll_row_insert, "branch_id", ldb_branch_id)
					lds_dr_obj_adj.setitem(ll_row_insert, "ACCOUNT_CONTROL", ldb_dr_acct_ctrl)
					lds_dr_obj_adj.setitem(ll_row_insert, "SUBACCOUNT", ldb_subaccount_dr)
					lds_dr_obj_adj.setitem(ll_row_insert, "object_ref_id", vdb_object_ref_id)
				end if
				//-- ghi nhớ lại số đầu kỳ cho ngày tiếp theo --//
				ldb_rtn_open_obj_dr = ldb_rtn_open_obj_dr + ldb_in_value - ldb_out_value + ldb_adj_value		

				//-- Update CR account --//
				ls_findStr = " sob = '"+gs_sob + "' AND company_id = "+string(gi_user_comp_id) + " AND string(balance_date,'yyyymmdd') ='"+ string(ld_Trans_date,'yyyymmdd') &
							 +"' AND object_id = "+string(ldb_cr_acct_ctrl) + " AND branch_id ="+string(ldb_branch_id) &
							 +" AND (isnull(ACCOUNT_CONTROL) or ACCOUNT_CONTROL = "+string(ldb_cr_acct_ctrl) +")" &
							 + " AND ( isnull(SUBACCOUNT) or SUBACCOUNT = " +string(ldb_subaccount_cr) +")" 		
							 
				ll_row_insert = lds_cr_obj_adj.find(ls_findStr, 1, lds_cr_obj_adj.rowcount() )
				if ll_row_insert > 0 then					
					ldb_in_value = lds_cr_obj_adj.getitemnumber(ll_row_insert, "DR_BASE_AMOUNT")
					if isnull(ldb_in_value) then ldb_in_value = 0
					ldb_out_value = lds_cr_obj_adj.getitemnumber(ll_row_insert, "CR_BASE_AMOUNT")
					if isnull(ldb_out_value) then ldb_out_value = 0
					if ll_row_prior_obj_cr <> ll_row_insert and ld_Trans_date > vd_sdate  and ll_row > 1 then
						lds_cr_obj_adj.setitem(ll_row_insert, "OPEN_BASE_AMOUNT", ldb_rtn_open_obj_cr)
					end if
					lds_cr_obj_adj.setitem(ll_row_insert, "CR_BASE_AMOUNT", ldb_out_value + ldb_adj_value )
					lds_cr_obj_adj.setitem(ll_row_insert, "CLOSE_BASE_AMOUNT", ldb_rtn_open_obj_cr + ldb_in_value - ldb_adj_value - ldb_out_value )
				else
					//--Nếu không tìm thấy trans_date, thì tìm vd_sdate: open CR account --//
					ls_findStr = " sob = '"+gs_sob + "' AND company_id = "+string(gi_user_comp_id) + " AND string(balance_date,'yyyymmdd') ='"+ string(vd_sdate,'yyyymmdd') &
								 +"' AND object_id = "+string(ldb_cr_acct_ctrl) + " AND branch_id ="+string(ldb_branch_id) &
								 +" AND (isnull(ACCOUNT_CONTROL) or ACCOUNT_CONTROL = "+string(ldb_cr_acct_ctrl) +")" &
								 + " AND ( isnull(SUBACCOUNT) or SUBACCOUNT = " +string(ldb_subaccount_cr) +")" 
								 
					ll_row_insert = lds_cr_obj_adj.find(ls_findStr, 1, lds_cr_obj_adj.rowcount() )
					if ll_row_insert > 0 then
						ldb_rtn_open_obj_cr = lds_cr_obj_adj.getitemnumber(ll_row_insert, 'OPEN_BASE_AMOUNT')
						if isnull(ldb_rtn_open_obj_cr) then ldb_rtn_open_obj_cr = 0
					end if			
					
					ll_row_insert = lds_cr_obj_adj.event e_addrow()
					ll_row_prior_obj_cr = ll_row_insert
					lds_cr_obj_adj.setitem(ll_row_insert, "OPEN_BASE_AMOUNT", ldb_rtn_open_obj_cr)
					lds_cr_obj_adj.setitem(ll_row_insert, "CR_BASE_AMOUNT", ldb_adj_value )
					lds_cr_obj_adj.setitem(ll_row_insert, "CLOSE_BASE_AMOUNT", ldb_rtn_open_obj_cr - ldb_adj_value  )	
					
					lds_cr_obj_adj.setitem(ll_row_insert, "id", this.f_create_id( ) )
					lds_cr_obj_adj.setitem(ll_row_insert, "BALANCE_DATE", ld_Trans_date)
					lds_cr_obj_adj.setitem(ll_row_insert, "ADJUST_DATE", vd_edate)
					lds_dr_obj_adj.setitem(ll_row_insert, "object_id", ldb_cr_acct_ctrl)
					lds_cr_obj_adj.setitem(ll_row_insert, "branch_id", ldb_branch_id)
					lds_cr_obj_adj.setitem(ll_row_insert, "ACCOUNT_CONTROL", ldb_cr_acct_ctrl)
					lds_cr_obj_adj.setitem(ll_row_insert, "SUBACCOUNT", ldb_subaccount_cr)
					lds_cr_obj_adj.setitem(ll_row_insert, "object_ref_id", vdb_object_ref_id)
				end if
				//-- ghi nhớ lại số đầu kỳ cho ngày tiếp theo --//
				ldb_rtn_open_obj_cr = ldb_rtn_open_obj_cr + ldb_in_value - ldb_out_value  - ldb_adj_value		
				
				//-- update --//
				if lds_dr_obj_adj.update(true,false) = -1 then
					gf_messagebox('m.s_object_display.f_update_item_cust_return_cost_prior.02', 'Thông báo','Lỗi update:@'+lt_transaction.sqlerrtext,'stop','ok',1)
					rollback using lt_transaction;
					return -1					
				end if
				lds_dr_obj_adj.resetupdate( )
				if lds_cr_obj_adj.update(true,false) = -1 then
					gf_messagebox('m.s_object_display.f_update_item_cust_return_cost_prior.02', 'Thông báo','Lỗi update:@'+lt_transaction.sqlerrtext,'stop','ok',1)
					rollback using lt_transaction;
					return -1					
				end if
				lds_cr_obj_adj.resetupdate( )	
				
			catch (runtimeerror l_rte)
				gf_messagebox('m.s_object_display.f_update_item_cust_return_cost_prior.01', 'Thông báo','Lỗi SQL:@'+lt_transaction.sqlerrtext,'stop','ok',1)
				rollback using lt_transaction;
				return -1
			end try
			

		end if		
	NEXT	
	
		
	if lds_stream_value_adj.UPdate(true, false ) = -1 then
		gf_messagebox('m.s_object_display.f_update_item_cust_return_cost_prior.02', 'Thông báo','Lỗi update:@'+lt_transaction.sqlerrtext,'stop','ok',1)
		rollback using lt_transaction;
		return -1
	end if
	destroy lds_dr_obj_adj
	destroy lds_cr_obj_adj
	DESTROY lds_stream_value_adj
end if

if rds_item_adj.update(true,false) = -1 then
	gf_messagebox('m.s_object_display.f_update_item_cust_return_cost_prior.02', 'Thông báo','Lỗi update:@'+lt_transaction.sqlerrtext,'stop','ok',1)
	rollback using lt_transaction;
	return -1					
end if
rds_item_adj.resetupdate()

DESTROY lds_item_cust_return_prior

return 1
end function

public function integer f_del_obj_adj (date vd_sdate, ref t_transaction rt_transaction);b_inventory		lbo_inst
	
if 	lbo_inst.f_is_branch_yn( this.classname()) then
	DELETE object_balance_adj 
	where sob =:gs_sob 
	and company_id =:gi_user_comp_id 
	and branch_id = :gdb_branch
	and balance_date > :vd_sdate  using rt_transaction;	
else
	DELETE object_balance_adj 
	where sob =:gs_sob 
	and company_id =:gi_user_comp_id 
	and balance_date > :vd_sdate  using rt_transaction;
end if
return rt_transaction.sqlcode
end function

public function integer f_del_item_adj (date vd_sdate, s_str_item_balance vstr_item_balance, ref t_transaction rt_transaction);string			ls_sql, ls_where

ls_sql = '	DELETE item_balance_adj ib WHERE  ib.item_id = ' + string(vstr_item_balance.db_item_id) &
			+ " AND ib.sob ='"+gs_sob +"'" + " AND ib.company_id ="+string( gi_user_comp_id) &
			+ " AND to_char(ib.balance_date,'yyyymmdd') >='" + string(vd_sdate,'yyyymmdd') + "'"

if vstr_item_balance.db_wh_id > 0 then
	ls_where += '  AND ib.object_id = ' + string(vstr_item_balance.db_wh_id)
end if
if vstr_item_balance.db_spec_id > 0 then 
	ls_where += '  AND ib.spec_id = ' + string(vstr_item_balance.db_spec_id)
end if
if vstr_item_balance.s_lot_no <> '@' then
	ls_where += "  AND ib.lot_no = '" + vstr_item_balance.s_lot_no + "'"
end if
if vstr_item_balance.s_serial_no <> '@' then
	ls_where += "  AND ib.serial_no = '" + vstr_item_balance.s_serial_no + "'"	
end if
if vstr_item_balance.db_loc_id > 0 then
	ls_where += '  AND ib.loc_id = ' + string(vstr_item_balance.db_loc_id)	
end if

ls_sql += ls_where

Execute immediate :ls_sql using rt_transaction;

return rt_transaction.sqlcode
end function

public function long f_update_line_no_postinsert (t_dw_mpl vdw_line, long vl_start_row, string vs_line_no_colname);long		ll_row


FOR 	ll_row = vl_start_row to vdw_line.rowcount()	
	vdw_line.setitem(ll_row, vs_line_no_colname,ll_row)	
NEXT

return vl_start_row

end function

public function integer f_update_tax (datawindow vdw_line, string vs_colname_amount, string vs_colname_amount_ex_tax, decimal vdc_exc_rate, string vs_include_tax_yn, string vs_dwo_tax);c_unit_instance		lc_unit
datawindow			ldw_tax
decimal				ldc_amount,ldc_tax,ldx_tax_include,ldc_tax_amt,ldc_price,ldc_qty,ldc_price_b_tax,ldc_amount_b_tax
decimal				ldc_amt_ex,ldc_act_amt_ex,ldc_act_amount,ldc_markup_return,ldc_amount_ex_tax
double				ldb_id,ldb_round_id
long					ll_find
string					ls_filter,ls_filter_detail
int						li_tax_percent,li_idx,li_markup_pct

ldw_tax = iw_display.f_get_dw(vs_dwo_tax)
ls_filter = ldw_tax.describe( "datawindow.table.filter")
ls_filter_detail = vdw_line.dynamic f_get_detail_filterstring( ldw_tax, true)
if ls_filter <> ls_filter_detail  then
	ldw_tax.setfilter(ls_filter_detail)
	ldw_tax.filter()
end if
for li_idx = 1 to vdw_line.rowcount()
	ll_find = 0
	ldx_tax_include = 0
	ldc_amount = vdw_line.getitemnumber(li_idx,vs_colname_amount)
	ldc_amount_ex_tax = vdw_line.getitemnumber(li_idx,vs_colname_amount_ex_tax)
	ldc_price = vdw_line.getitemnumber(li_idx,'price')
	ldc_qty = vdw_line.getitemnumber(li_idx,'qty')
	if isnull(ldc_amount) or ldc_amount = 0 then continue
	ldb_id = vdw_line.getitemnumber(li_idx,'ID')
	if vdw_line.rowcount() = ldw_tax.rowcount( ) then
		ll_find = ldw_tax.find( 'object_ref_id = '+string(ldb_id), 1, ldw_tax.rowcount( ) )
		li_tax_percent = ldw_tax.getitemnumber( ll_find, 'tax_pct')
		ldc_tax = this.f_calculation_tax( ldc_amount,ldc_amount_ex_tax,ldc_price,ldc_qty, vdc_exc_rate, li_tax_percent, vs_include_tax_yn)
	elseif vdw_line.rowcount() < ldw_tax.rowcount( ) then
		Do
			ll_find ++
			ll_find = ldw_tax.find( 'object_ref_id = '+string(ldb_id)+" and include_yn = 'Y' ", ll_find, ldw_tax.rowcount( ) + 1 )
			if ll_find > 0 then
				li_tax_percent = ldw_tax.getitemnumber( ll_find, 'tax_pct')
				ldc_tax_amt = this.f_calculation_tax(ldc_amount,ldc_amount_ex_tax,ldc_price,ldc_qty, vdc_exc_rate, li_tax_percent, vs_include_tax_yn)
				ldw_tax.setitem(ll_find , 'tax_amt', ldc_tax_amt)
				ldw_tax.setitem(ll_find , 'tax_correction', ldc_tax_amt)
				ldw_tax.setitem(ll_find , 'exchange_rate', vdc_exc_rate)
				ldx_tax_include += ldc_tax_amt
			end if
		Loop While ll_find > 0
		ll_find = ldw_tax.find( 'object_ref_id = '+string(ldb_id)+" and uprow_yn = 'Y' ", 1, ldw_tax.rowcount( ) )
		if ll_find > 0 then
			li_tax_percent = ldw_tax.getitemnumber( ll_find, 'tax_pct')
			ldc_amount = (ldc_amount * vdc_exc_rate)+ldx_tax_include
			ldc_tax = this.f_calculation_tax(ldc_amount,ldc_amount_ex_tax,ldc_price,ldc_qty, 1, li_tax_percent, vs_include_tax_yn)
		end if
	end if
	ldw_tax.setitem(ll_find , 'tax_amt',  ldc_tax)
	ldw_tax.setitem(ll_find , 'tax_correction',  ldc_tax)
	ldw_tax.setitem(ll_find , 'exchange_rate', vdc_exc_rate)
next
//if ls_filter <> '?' then
//	ldw_tax.setfilter( ls_filter)
//	ldw_tax.filter( )
//end if
return 0
end function

public function integer f_get_drilldown_data (string vs_object_name, string vs_dwo, string vs_colname, ref s_str_drilldown_data rstr_drilldown_data, long vl_cur_row);string								ls_OriginalFilter, ls_filterStr, ls_drilldown_dwo, ls_drilldown_col, ls_dwo, ls_drilldown_dwo_main
long								ll_cur_row
int									li_idx,li_row, li_rtn
s_str_drilldown_data			lstr_drilldown_data
c_string							lc_string
t_dw_mpl						ldw_handle

//-- lưu giữ filter gốc: nếu có--//
ls_OriginalFilter = this.idwsetup_initial.ids_setup_dw.Describe("DataWindow.Table.Filter")
if right(vs_dwo,5) = '_form' or  right(vs_dwo,5) = '_grid' then
	ls_dwo = left(vs_dwo, len(vs_dwo) -5)
else
	ls_dwo = vs_dwo
end if
ls_filterStr = "dwobject ='"+ls_dwo+ "' AND dwcolumn ='" + vs_colname + "' AND CRITERIA_TYPE ='drilldown' AND OBJECT_REF_TABLE = '"+vs_object_name+"'"
this.idwsetup_initial.ids_setup_dw.setfilter(ls_filterStr)
this.idwsetup_initial.ids_setup_dw.filter() 
if this.idwsetup_initial.ids_setup_dw.rowcount( ) > 0 then
	this.idwsetup_initial.ids_setup_dw.setsort( " DWOBJECT_MAIN asc")
	this.idwsetup_initial.ids_setup_dw.sort()
	FOR li_row = 1 to this.idwsetup_initial.ids_setup_dw.rowcount( )
		if li_row = 1 then
			ls_drilldown_dwo_main = this.idwsetup_initial.ids_setup_dw.getitemstring( li_row, 'DWOBJECT_MAIN')
			
			if isnull(ls_drilldown_dwo_main) or ls_drilldown_dwo_main = '' then
				gf_messagebox('m.s_object_display.f_get_drill_data.01','Thông báo','Cài đặt drildown chưa có DW lấy dữ liệu','exclamation','ok',1)
				li_rtn = -1
				goto original_filter
			end if				
			ls_drilldown_col = this.idwsetup_initial.ids_setup_dw.getitemstring( li_row, 'DWOBJECT_MAIN_COLUMN')		
			if isnull(ls_drilldown_col) or ls_drilldown_col = '' then
				gf_messagebox('m.s_object_display.f_get_drill_data.02','Thông báo','Cài đặt drildown chưa có cột lấy dữ liệu','exclamation','ok',1)
				li_rtn = -1
				goto original_filter
			end if				
			lstr_drilldown_data.s_drilldown_obj_dwo[1]	= ls_drilldown_dwo_main	
			lstr_drilldown_data.s_drilldown_obj_column[1] = ls_drilldown_col +';'
			
			ls_drilldown_dwo = this.idwsetup_initial.ids_setup_dw.getitemstring( li_row, 'DWVALUESET')
			if isnull(ls_drilldown_dwo) or ls_drilldown_dwo = '' then
				gf_messagebox('m.s_object_display.f_get_drill_data.01','Thông báo','Cài đặt drildown chưa có DW lấy dữ liệu','exclamation','ok',1)
				li_rtn = -1
				goto original_filter
			end if			
			ls_drilldown_col = this.idwsetup_initial.ids_setup_dw.getitemstring( li_row, 'DWVALUESET_RELATED_COLUMN')
			if isnull(ls_drilldown_col) or ls_drilldown_col = '' then
				gf_messagebox('m.s_object_display.f_get_drill_data.02','Thông báo','Cài đặt drildown chưa có cột lấy dữ liệu','exclamation','ok',1)
				li_rtn = -1
				goto original_filter
			end if			
			ldw_handle = this.iw_display.f_get_dw(ls_drilldown_dwo+'_grid')
			if left(ls_drilldown_dwo,2) = 'dp' then ll_cur_row = ldw_handle.getrow( )
			if left(ls_drilldown_dwo,2) = 'dr' then ll_cur_row = vl_cur_row
			lstr_drilldown_data.str_data[1].aa_data[1] = ldw_handle.dynamic f_getitemany(ll_cur_row , ls_drilldown_col)
		else
			if this.idwsetup_initial.ids_setup_dw.getitemstring( li_row, 'DWOBJECT_MAIN') = ls_drilldown_dwo_main then
				ls_drilldown_col = this.idwsetup_initial.ids_setup_dw.getitemstring( li_row, 'DWOBJECT_MAIN_COLUMN')			
				if isnull(ls_drilldown_col) or ls_drilldown_col = '' then
					gf_messagebox('m.s_object_display.f_get_drill_data.02','Thông báo','Cài đặt drildown chưa có cột lấy dữ liệu','exclamation','ok',1)
					li_rtn = -1
					goto original_filter
				end if				
				lstr_drilldown_data.s_drilldown_obj_column[upperbound(lstr_drilldown_data.s_drilldown_obj_column)] += ls_drilldown_col +';'	
				
				ls_drilldown_dwo = this.idwsetup_initial.ids_setup_dw.getitemstring( li_row, 'DWVALUESET')
				if isnull(ls_drilldown_dwo) or ls_drilldown_dwo = '' then
					gf_messagebox('m.s_object_display.f_get_drill_data.01','Thông báo','Cài đặt drildown chưa có DW lấy dữ liệu','exclamation','ok',1)
					li_rtn = -1
					goto original_filter
				end if					
				ls_drilldown_col = this.idwsetup_initial.ids_setup_dw.getitemstring( li_row, 'DWVALUESET_RELATED_COLUMN')
				if isnull(ls_drilldown_col) or ls_drilldown_col = '' then
					gf_messagebox('m.s_object_display.f_get_drill_data.02','Thông báo','Cài đặt drildown chưa có cột lấy dữ liệu','exclamation','ok',1)
					li_rtn = -1
					goto original_filter
				end if
				ldw_handle = this.iw_display.f_get_dw(ls_drilldown_dwo+'_grid')
				if left(ls_drilldown_dwo,2) = 'dp' then ll_cur_row = ldw_handle.getrow( )
				if left(ls_drilldown_dwo,2) = 'dr' then ll_cur_row = vl_cur_row
				li_idx = upperbound(lstr_drilldown_data.str_data[upperbound(lstr_drilldown_data.s_drilldown_obj_column)].aa_data[]) +1
				lstr_drilldown_data.str_data[upperbound(lstr_drilldown_data.s_drilldown_obj_column)].aa_data[li_idx] = ldw_handle.dynamic f_getitemany(ll_cur_row , ls_drilldown_col)
			else
				ls_drilldown_dwo_main = this.idwsetup_initial.ids_setup_dw.getitemstring( li_row, 'DWOBJECT_MAIN')
				if isnull(ls_drilldown_dwo_main) or ls_drilldown_dwo_main = '' then
					gf_messagebox('m.s_object_display.f_get_drill_data.01','Thông báo','Cài đặt drildown chưa có DW lấy dữ liệu','exclamation','ok',1)
					li_rtn = -1
					goto original_filter
				end if					
				ls_drilldown_col = this.idwsetup_initial.ids_setup_dw.getitemstring( li_row, 'DWOBJECT_MAIN_COLUMN')			
				if isnull(ls_drilldown_col) or ls_drilldown_col = '' then
					gf_messagebox('m.s_object_display.f_get_drill_data.02','Thông báo','Cài đặt drildown chưa có cột lấy dữ liệu','exclamation','ok',1)
					li_rtn = -1
					goto original_filter
				end if				
				lstr_drilldown_data.s_drilldown_obj_dwo[upperbound(lstr_drilldown_data.s_drilldown_obj_dwo)+1]	= ls_drilldown_dwo_main									
				lstr_drilldown_data.s_drilldown_obj_column[upperbound(lstr_drilldown_data.s_drilldown_obj_column)+1] += ls_drilldown_col +';'
				
				ls_drilldown_dwo = this.idwsetup_initial.ids_setup_dw.getitemstring( li_row, 'DWVALUESET')
				if isnull(ls_drilldown_dwo) or ls_drilldown_dwo = '' then
					gf_messagebox('m.s_object_display.f_get_drill_data.01','Thông báo','Cài đặt drildown chưa có DW lấy dữ liệu','exclamation','ok',1)
					li_rtn = -1
					goto original_filter
				end if					
				ls_drilldown_col = this.idwsetup_initial.ids_setup_dw.getitemstring( li_row, 'DWVALUESET_RELATED_COLUMN')
				if isnull(ls_drilldown_col) or ls_drilldown_col = '' then
					gf_messagebox('m.s_object_display.f_get_drill_data.02','Thông báo','Cài đặt drildown chưa có cột lấy dữ liệu','exclamation','ok',1)
					li_rtn = -1
					goto original_filter
				end if		
				ldw_handle = this.iw_display.f_get_dw(ls_drilldown_dwo+'_grid')		
				if left(ls_drilldown_dwo,2) = 'dp' then ll_cur_row = ldw_handle.getrow( )
				if left(ls_drilldown_dwo,2) = 'dr' then ll_cur_row = vl_cur_row
				li_idx = upperbound(lstr_drilldown_data.str_data[upperbound(lstr_drilldown_data.s_drilldown_obj_column)+1].aa_data[]) +1
				lstr_drilldown_data.str_data[upperbound(lstr_drilldown_data.s_drilldown_obj_column)+1].aa_data[li_idx] = ldw_handle.dynamic f_getitemany(ll_cur_row , ls_drilldown_col)				
			end if
		end if
		
	NEXT
	rstr_drilldown_data = lstr_drilldown_data
	li_rtn = 1
end if

original_filter:
//-- trả lại filter gốc --//
if ls_OriginalFilter <> '?' then
	ls_OriginalFilter = lc_string.f_globalreplace(ls_OriginalFilter , '~~', '')
	this.idwsetup_initial.ids_setup_dw.setfilter(ls_OriginalFilter)	
else
	this.idwsetup_initial.ids_setup_dw.setfilter('')
end if	
this.idwsetup_initial.ids_setup_dw.filter()

return li_rtn
end function

public subroutine f_set_ib_refresh (boolean vb_ib_refresh);ib_refresh = vb_ib_refresh
end subroutine

public function boolean f_get_ib_refresh ();return ib_refresh
end function

public function integer f_get_doc_version (t_dw_mpl vdw_main);return 0
end function

public function integer f_find_related_object (ref s_object_display rpo_found, string vs_objname);
int			li_idx , li_objCnt, li_rtn
li_objCnt = upperbound(this.ipo_related[])
if li_objCnt = 0 then return 0
FOR li_idx =1 to li_objCnt
	if this.ipo_related[li_idx].classname() = vs_objname  then
		rpo_found = this.ipo_related[li_idx]
		return 1
	end if
NEXT
return 0
end function

public subroutine f_set_it_transaction (t_transaction vt_transaction);it_transaction = vt_transaction
end subroutine

public function integer f_expand_dw (t_dw_mpl vdw_handling, string vs_name, integer vi_height);

	if vs_name = 't_expand' then
		if iw_display.f_get_ii_upperpart_height( ) > vi_height+ 60 then
			iw_display. f_set_ii_fixedpart2_height(vi_height+60,true)  
		else
			iw_display. f_set_ii_fixedpart2_height(vi_height+60,true)
			iw_display.f_set_ii_upperpart_height( vi_height+60 + 150 , true)
		end if
		vdw_handling.modify("t_expand.visible = false")
		vdw_handling.modify("t_colapse.visible = true")
//		rdw_handling.object.t_expand.visible = false
//		rdw_handling.object.t_colapse.visible = true
		iw_display.f_resize( this.is_display_model )
	elseif vs_name = 't_colapse' then
		iw_display. f_set_ii_fixedpart2_height(vi_height+60,true)  
		vdw_handling.modify("t_expand.visible = true")
		vdw_handling.modify("t_colapse.visible = false")		
//		rdw_handling.object.t_expand.visible = true
//		rdw_handling.object.t_colapse.visible = false
		iw_display.f_resize( this.is_display_model )
	end if
	
	return 1
end function

public function integer of_set_progress_text (string vs_text);iw_progress.f_set_text_progress( vs_text)
return 1
end function

public function integer of_show_progress (integer ai_progress, string vs_title);if ai_progress > 100 then
	if isvalid(iw_progress) then
		close(iw_progress)
		setnull(iw_progress)
	end if
else
	if isvalid(iw_progress) then
	else
		open(iw_progress)
		iw_progress.title = vs_title +' ......... '
	end if
	iw_progress.event ue_show_progress(ai_progress)	
end if 

return 1
end function

public function integer f_get_drilldown_data (ref s_str_drilldown_data rstr_drilldown_data);rstr_drilldown_data = istr_drilldown
return upperbound(rstr_drilldown_data.aa_data[])
end function

public function integer f_open_drilldown_rpt ();
string			lsa_colname[]
int				li_cnt, li_idx
c_string		lc_string
t_dw_mpl	ldw_parm

ldw_parm = this.iw_display.f_get_dw( this.istr_drilldown.s_drilldown_obj_dwo[1] )
li_cnt = lc_string.f_stringtoarray(this.istr_drilldown.s_drilldown_obj_column[1] , ';', lsa_colname[])

if ldw_parm.rowcount( ) = 0 then	ldw_parm.event e_addrow( )
FOR li_idx = 1 to li_cnt
	this.iw_display.idw_focus.setitem( 1, lsa_colname[li_idx], this.istr_drilldown.aa_data[li_idx] )
NEXT
this.iw_display.event e_view_report( )

return 1
end function

public function integer f_insert_tv_item (powerobject vpo_tv, t_tv r_tv, long vl_parent_hdl);int				li_rtn
double		ldb_id

li_rtn =  r_tv.dynamic f_populate_item(vpo_tv, vl_parent_hdl)

return li_rtn
end function

public function integer f_display_on_tv_new (t_tv r_tv, any va_retrieve_arg[5]);transaction		lt_transaction
long 				ll_row, ll_root_hdl, ll_parent_hdl
int					li_rtn, li_cnt


istr_tvo[1].ds_tv_item.settransobject( it_transaction)
//-- load treeview items--//
li_cnt =  istr_tvo[1].ds_tv_item.retrieve(va_retrieve_arg[1], va_retrieve_arg[2], va_retrieve_arg[3], va_retrieve_arg[4], va_retrieve_arg[5] ) 
if li_cnt = -1 then
	gf_messagebox('m.s_object_display.f_display_on_tv.01','Thông báo',' datastore Không truy vấn được: s_object_display.f_display_on_tv() line:16 (@'+istr_tvo[1].ds_tv_item.dataobject+')','exclamation','ok',1)
	return -1
end if
if li_cnt > 0 then
	FOR ll_row = 1 to li_cnt
		li_rtn = this.f_set_tv_structure( ll_row)
		if li_rtn = 1 then
			ll_parent_hdl = 0
			if r_tv.dynamic f_find_item_hdl(ipo_tv.f_get_tv_findstring( ), ipo_tv.f_get_tv_parentstring( ), ll_parent_hdl) = -1 then
				li_rtn = this.f_insert_tv_item( ipo_tv, r_tv, ll_parent_hdl)
			else
				continue
			end if
		else
			return -1
		end if
	NEXT
	ll_root_hdl = r_tv.FindItem(RootTreeItem! , 0)
	r_tv.setredraw(false)
	r_tv.SortAll(ll_root_hdl , userdefinedsort!)
//	r_tv.selectitem(ll_root_hdl)
//	r_tv.expanditem(ll_root_hdl)
	
	r_tv.setredraw(true)	
end if
return li_cnt
end function

public function integer f_init_policy_datastore_ex (ref t_transaction rt_transaction);c_menu						lc_menulc_identification_initial
c_identification_initial		lc_identification_initial
c_string						lc_string
any							laa_value[]
string							ls_menu_code, ls_indentification_id, ls_policy_id
int								li_ruleCount
double						ldb_policy_id[], ldb_idkey_id


ldb_idkey_id = lc_identification_initial.f_get_idkey_id_ex( this.f_get_menu_code( ), rt_transaction )
li_ruleCount = g_user.i_rule.f_get_appli_rule_id_union_ex(ldb_policy_id[] , gi_userid, string(ldb_idkey_id), 'policy', rt_transaction)

ids_policy_rule = create t_ds_db
ids_policy_rule.dataobject = 'ds_policy_rule'

laa_value[1] = '='+is_menu_code 
laa_value[2] = gdb_branch
ids_policy_rule.f_add_where(  'object_ref_code;branch_id;', laa_value[])
ids_policy_rule.settransobject( rt_transaction)
ids_policy_rule.retrieve( )

ids_policy_security =  create t_ds_db
ids_policy_security.dataobject = 'ds_policy_security'

laa_value[1] = '='+is_menu_code
lc_string.f_arraytostring( ldb_policy_id[], ';' ,ls_policy_id)
laa_value[2] = '('+ls_policy_id+')'
ids_policy_security.f_add_where('object_ref_code;object_ref_id;', laa_value[])
ids_policy_security.settransobject( rt_transaction)
ids_policy_security.retrieve( )

return 1
end function

public function integer f_handle_message (ref datawindow rdw_requester, string vs_message, keycode v_keycode, integer v_keyflags);
choose case vs_message
//	case 'e_dwnkey'
//		return this.event e_dw_e_postinsertrow(rdw_requester, vl_value)
	case 'e_dwnkey'
		return this.event e_dw_dwnkey(rdw_requester ,v_keycode, v_keyflags)		
			
end choose
return 0

end function

public function decimal f_get_exchange_rate_ex (string vs_cur_code, date vd_trans_date);
c_string				lc_string
double				ldb_cur_id, ldb_base_curr_id
string					ls_basecurr_code, ls_basecurr_name
decimal				ldc_buy_rate, ldc_sell_rate

t_transaction		lt_transaction

lt_transaction = create t_transaction
lt_transaction.dbms =	SQLCA.DBMS
lt_transaction.ServerName	 = SQLCA.ServerName
lt_transaction.LogId	 = SQLCA.LogId
lt_transaction.LogPass 	 = SQLCA.LogPass 
lt_transaction.AutoCommit 	 = false 
lt_transaction.DBParm	 = SQLCA.DBParm
connect using lt_transaction;

ldb_cur_id = this.ic_unit_instance.f_get_curr_id( vs_cur_code, lt_transaction)
if ldb_cur_id > 0 then
	ic_unit_instance.f_get_base_cur_ex(ldb_base_curr_id , ls_basecurr_code, ls_basecurr_name, lt_transaction)
	if ldb_base_curr_id = ldb_cur_id then
		return 1
	end if
	select exchange_rate.buy_rate,exchange_rate.sell_rate into :ldc_buy_rate,:ldc_sell_rate
    from exchange_rate
    where exchange_rate.object_ref_id = :ldb_cur_id
	 		and exchange_rate.trans_date = (
			 select max(exchange_rate.trans_date)
			 from exchange_rate
			 where trunc(exchange_rate.trans_date) <= trunc(:vd_trans_date) and exchange_rate.object_ref_id = :ldb_cur_id) using lt_transaction;
	 if lt_transaction.sqlcode = 0 then
		disconnect using lt_transaction;
		destroy lt_transaction
		if trim(lower(is_exrate_type)) = 'buy' then
			return ldc_buy_rate
		elseif trim(lower(is_exrate_type)) = 'sell' then
			return ldc_sell_rate
		else
			//--Chưa set biến is_exrate_type trong contructor của object--//
			messagebox('Lỗi','s_object_display.f_get_exchange_rate(line:24)')
		end if
	elseif lt_transaction.sqlcode = 100 then
		disconnect using lt_transaction;
		destroy lt_transaction
		gf_messagebox('m.s_object_display.f_get_exchange_rate.01','Thông báo','Chưa cài đặt tỷ giá cho @'+vs_cur_code,'exclamation','ok',1)
		return 0
	else
		disconnect using lt_transaction;
		destroy lt_transaction
		//--Lỗi database--//
		messagebox('Lỗi','s_object_display.f_get_exchange_rate(line:31)')
		return 0
	end if
else
	disconnect using lt_transaction;
	destroy lt_transaction
	//--không lấy đc id của loai tiền--//
	messagebox('Lỗi','s_object_display.f_get_exchange_rate(line:)')
end if

return 0
end function

public function integer f_update_ribbonbar (u_rbb rbb_handle);
int						li_cnt, li_idx, li_bttn_cnt, li_idx1
string					lsa_sub[], lsa_bttn[], lsa_bttn_nm[],  lsa_null[], ls_enble_buttons
c_string				lc_string
RibbonCategoryItem			l_rci
RibbonPanelItem				l_rpi, l_rpi_action
RibbonLargeButtonItem 		l_rlbi, l_rlbi_null
RibbonMenu						l_rMenu		
RibbonMenuItem				l_rmitem, l_rmitem_tmp
RibbonGroupItem				l_rgi
RibbonSmallButtonItem 		l_rsbi, l_rsbi_null

rbb_handle.getcategorybyindex( 1, l_rci)
li_cnt  = lc_string.f_stringtoarray(istr_actionpane[1].s_button_has_sub , ';', lsa_sub[])

FOR li_idx = 1 to li_cnt
	lsa_bttn[] = lsa_null[]
	lsa_bttn_nm[] =  lsa_null[]
	if lsa_sub[li_idx] = 'b_copyt' or  lsa_sub[li_idx] = 'b_copyf'   then
		rbb_handle.getchilditembyindex( l_rci.itemhandle, 3, l_rpi)	
		if lsa_sub[li_idx] = 'b_copyt' then
			rbb_handle.getchilditembyindex( l_rpi.itemhandle, 2, l_rsbi)
		else
			rbb_handle.getchilditembyindex( l_rpi.itemhandle, 1, l_rsbi)
		end if
		li_bttn_cnt  = lc_string.f_stringtoarray(istr_actionpane[1].sa_sub_button[li_idx] , ';', lsa_bttn[])
		li_bttn_cnt  = lc_string.f_stringtoarray(istr_actionpane[1].sa_subbutton_name[li_idx] , ';', lsa_bttn_nm[])
		if li_bttn_cnt = 0 then
			//-- xóa copy --//			
			rbb_handle.deleteSmallbutton(l_rsbi.itemhandle )
		else
			l_rsbi.getmenu( l_rMenu)
			for li_idx1 = 1 to li_bttn_cnt
				if li_idx1 = 1 then
					l_rMenu.getitem( 1 , l_rmitem)
					l_rmitem.tag = lsa_bttn[li_idx1]
					l_rmitem.text = lsa_bttn_nm[li_idx1]
					l_rMenu.setitem( 1, l_rmitem)
				else
					l_rmitem_tmp.tag = lsa_bttn[li_idx1]
					l_rmitem_tmp.text = lsa_bttn_nm[li_idx1]
					l_rmitem_tmp.picturename = l_rmitem.picturename
					l_rMenu.insertitem( li_idx1, l_rmitem_tmp)
				end if
			next
			l_rsbi.setmenu(l_rMenu )
			rbb_handle.SetSmallButton (l_rsbi.itemhandle, l_rsbi )
		end if
	elseif lsa_sub[li_idx] = 'b_view' then
		rbb_handle.getchilditembyindex( l_rci.itemhandle, 4, l_rpi)			
		li_bttn_cnt  = lc_string.f_stringtoarray(istr_actionpane[1].sa_sub_button[li_idx] , ';', lsa_bttn[])
		li_bttn_cnt  = lc_string.f_stringtoarray(istr_actionpane[1].sa_subbutton_name[li_idx] , ';', lsa_bttn_nm[])
		if li_bttn_cnt = 0 then
			//-- xóa copy --//			
			rbb_handle.deletepanel(l_rpi.itemhandle )
		else
			rbb_handle.getchilditembyindex( l_rpi.itemhandle, 1, l_rsbi)
			l_rsbi.getmenu( l_rMenu)
			for li_idx1 = 1 to li_bttn_cnt
				if li_idx1 = 1 then
					l_rMenu.getitem( 1 , l_rmitem)
					l_rmitem.tag = lsa_bttn[li_idx1]
					l_rmitem.text = lsa_bttn_nm[li_idx1]
					l_rMenu.setitem( 1 ,l_rmitem)
				else
					l_rmitem_tmp.tag = lsa_bttn[li_idx1]
					l_rmitem_tmp.text = lsa_bttn_nm[li_idx1]
					l_rmitem_tmp.picturename = l_rmitem.picturename
					l_rMenu.insertitem(li_idx1, l_rmitem_tmp)
				end if
			next
			l_rsbi.setmenu(l_rMenu )
			rbb_handle.SetSmallButton (l_rsbi.itemhandle, l_rsbi )
		end if		
	elseif lsa_sub[li_idx] = 'b_approve' then
		rbb_handle.getchilditembyindex( l_rci.itemhandle, 5, l_rpi)	
		li_bttn_cnt  = lc_string.f_stringtoarray(istr_actionpane[1].sa_sub_button[li_idx] , ';', lsa_bttn[])
		if li_bttn_cnt = 0 then
			rbb_handle.deletepanel(l_rpi.itemhandle )
		end if		
	elseif lsa_sub[li_idx] = 'b_update' then
		if iw_display.classname( ) = 's_w_multi_rb' then
			rbb_handle.getchilditembyindex( l_rci.itemhandle, 6, l_rpi)	
		elseif iw_display.classname( ) = 's_w_multi_n_rb' then
			rbb_handle.getchilditembyindex( l_rci.itemhandle, 4, l_rpi)	
			
		end if
		li_bttn_cnt  = lc_string.f_stringtoarray(istr_actionpane[1].sa_sub_button[li_idx] , ';', lsa_bttn[])
		li_bttn_cnt  = lc_string.f_stringtoarray(istr_actionpane[1].sa_subbutton_name[li_idx] , ';', lsa_bttn_nm[])
		if li_bttn_cnt = 0 then
			rbb_handle.deletepanel(l_rpi.itemhandle )
		else
			for li_idx1 = 1 to li_bttn_cnt
				l_rsbi = l_rsbi_null
				if lsa_bttn[li_idx1] = 'b_doc_trace' then 
					//-- thêm nút ghi sổ và hủy: panel action --//
					rbb_handle.getchilditembyindex( l_rci.itemhandle, 2, l_rpi_action)	
					//-- add nút ghi sổ--//
					rbb_handle.getchilditembyindex( l_rpi_action.itemhandle, 1, l_rgi)	
					l_rsbi.picturename = "Edit!"
					l_rsbi.clicked = "ue_tabbutton"
					l_rsbi.PowerTipDescription="Ghi sổ Ctrl+G" 
					l_rsbi.Tag="e_post"
					l_rsbi.Shortcut="Ctrl+G"
					rbb_handle.InsertSmallButtonLast (l_rgi.itemhandle,l_rsbi)
					//-- add nút canel--//
					rbb_handle.getchilditembyindex( l_rpi_action.itemhandle, 2, l_rgi)	
					l_rsbi = l_rsbi_null
					l_rsbi.picturename = "Custom080!"
					l_rsbi.clicked = "ue_tabbutton"
					l_rsbi.PowerTipDescription="Hủy" 
					l_rsbi.Tag="e_cancel"
					rbb_handle.InsertSmallButtonLast (l_rgi.itemhandle,l_rsbi)			
					l_rsbi = l_rsbi_null
				end if				
				l_rsbi.text =  lsa_bttn_nm[li_idx1]
				l_rsbi.Tag= lsa_bttn[li_idx1]
				l_rsbi.clicked = "ue_tabbutton"			
				if lsa_bttn[li_idx1] = 'b_doc_trace' then
					l_rsbi.picturename = "Browse1!"
				elseif lsa_bttn[li_idx1] = 'b_complete'then
					l_rsbi.picturename = "Custom026!"
				elseif lsa_bttn[li_idx1] = 'b_lose'then
					l_rsbi.picturename = "Custom027a!"
				elseif lsa_bttn[li_idx1] = 'b_excel'then
					l_rsbi.picturename = "Custom043!"
				elseif lsa_bttn[li_idx1] = 'e_action_load_file' then
					l_rsbi.picturename = "Browser!"
				elseif  lsa_bttn[li_idx1] = 'e_action_link' then
					l_rsbi.picturename = "Hyperlinkbig!"
				elseif  lsa_bttn[li_idx1] = 'e_action_open_file' then
					l_rsbi.picturename = "Preview1!"
				end if
				rbb_handle.InsertSmallButtonLast (l_rpi.itemhandle,l_rsbi)
			next						
		end if		
	elseif lsa_sub[li_idx] = 'b_related_object' then
		rbb_handle.getchilditembyindex( l_rci.itemhandle, 7, l_rpi)	
		li_bttn_cnt  = lc_string.f_stringtoarray(istr_actionpane[1].sa_sub_button[li_idx] , ';', lsa_bttn[])
		li_bttn_cnt  = lc_string.f_stringtoarray(istr_actionpane[1].sa_subbutton_name[li_idx] , ';', lsa_bttn_nm[])
		if li_bttn_cnt = 0 then
			rbb_handle.deletepanel(l_rpi.itemhandle )
		else
			for li_idx1 = 1 to li_bttn_cnt
				l_rlbi = l_rlbi_null	
				l_rlbi.text =  lsa_bttn_nm[li_idx1]
				l_rlbi.Tag= lsa_bttn[li_idx1]
				l_rlbi.clicked = "ue_tabbutton"		
				l_rlbi.picturename = "OrdersBig!"
				rbb_handle.InsertLargeButtonLast (l_rpi.itemhandle,l_rlbi)
			next										
		end if				
	end if
NEXT

return 0

end function

public function integer f_ctrl_enable_button (u_rbb vrbb_handle, t_dw_mpl vdw_focus);string					ls_type, ls_status, ls_updateTable,  ls_idKey_code[]
boolean				 lb_editing, lb_updatable, lb_change_4_edit, lb_detail

s_str_policy_attr		lstr_rule_attr, lstr_security_attr

if isnull(vdw_focus) then
	setnull(ls_type)
else

	ls_updateTable = upper(vdw_focus.describe("datawindow.table.updatetable")) 
	if vdw_focus.rowcount() = 0 then
//		setnull(ls_status)
		ls_status = ''
	else
		if left(this.classname( ), 9)= 'u_detail_' or ls_updateTable = 'DOCUMENT'  then
			ls_status = vdw_focus.getitemstring(vdw_focus.getrow(), 'status')
		end if
	end if
	if left(this.classname( ), 3)= 'ur_' then
		ls_type = 'report'
	elseif left(this.classname( ), 9)= 'u_detail_' then
		ls_type = 'detail'
	else
		if ls_updateTable = 'DOCUMENT'   then		
			ls_type = 'document'
		else
			ls_type = 'object'
		end if
	end if
	lb_editing = vdw_focus.f_get_ib_editing()
	lstr_rule_attr = vdw_focus.dynamic f_get_rule_attr()
	lstr_security_attr = vdw_focus.dynamic f_get_security_attr()
	lb_updatable = lstr_rule_attr.b_update and lstr_security_attr.b_update
	lb_detail = vdw_focus.f_get_ib_detail()
end if

vrbb_handle.f_ctrl_enable_button(ls_type, ls_status, lb_editing, lb_updatable, this.ib_Changed_dwo_4edit, is_enable_buttons,  lb_detail)
return 1
end function

public function integer f_init_policy_datastore_exx (ref t_transaction rt_transaction);c_menu						lc_menulc_identification_initial
c_identification_initial		lc_identification_initial
c_string						lc_string
any							laa_value[]
string							ls_menu_code, ls_indentification_id, ls_policy_id
int								li_ruleCount, li_row
double						ldb_policy_id[], ldb_idkey_id


ldb_idkey_id = lc_identification_initial.f_get_idkey_id_ex( this.f_get_menu_code( ), rt_transaction )
li_ruleCount = g_user.i_rule.f_get_appli_rule_id_union_ex(ldb_policy_id[] , gi_userid, string(ldb_idkey_id), 'policy', rt_transaction)

ids_policy_rule = create t_ds_db
ids_policy_rule.dataobject = 'ds_policy_rule'

laa_value[1] = '='+is_menu_code 
laa_value[2] = gdb_branch
ids_policy_rule.f_add_where(  'object_ref_code;branch_id;', laa_value[])
ids_policy_rule.settransobject( rt_transaction)
ids_policy_rule.retrieve( )

ids_policy_security =  create t_ds_db
ids_policy_security.dataobject = 'ds_policy_security'

laa_value[1] = is_menu_code
if upperbound(ldb_policy_id[]) > 0 then
	lc_string.f_arraytostring( ldb_policy_id[], ';' ,ls_policy_id)
	laa_value[2] = '('+ls_policy_id+')'
	ids_policy_security.f_add_where('identification_code;object_ref_id;', laa_value[])
else
	ids_policy_security.f_add_where('identification_code;', laa_value[])
end if
ids_policy_security.settransobject( rt_transaction)
ids_policy_security.retrieve( )

//-- set enable buttons --//
if gi_userid = 0 then
	is_enable_buttons = istr_actionpane[1].s_button_name
else
	ids_policy_security.setfilter( "identification_code like '%."+is_menu_code+".e_%'")
	ids_policy_security.filter( )
	if ids_policy_security.rowcount( ) = 0 then
		is_enable_buttons = istr_actionpane[1].s_button_name
	else
		FOR li_row = 1 to  ids_policy_security.rowcount( )
			if ids_policy_security.getitemstring( li_row,'access_yn') = 'Y' then
				is_enable_buttons += ids_policy_security.getitemstring( li_row,'object_ref_code')+';'
			end if
		NEXT
		ids_policy_security.setfilter( "identification_code like '%."+is_menu_code+".b_%'")
		ids_policy_security.filter( )		
		FOR li_row = 1 to  ids_policy_security.rowcount( )
			if ids_policy_security.getitemstring( li_row,'access_yn') = 'Y' then
				is_enable_buttons += ids_policy_security.getitemstring( li_row,'object_ref_code')+';'
			end if
		NEXT		
	end if	
	ids_policy_security.setfilter('')
	ids_policy_security.filter( )
end if
return 1
end function

on s_object_display.create
call super::create
end on

on s_object_display.destroy
call super::destroy
end on

event destructor;int							li_idx, li_count
t_t							ltab_action
s_tp_actionpane		ltp_actionpane_close
s_str_actionpane		lstr_actionpane_close


//-- destroy các object liên quan --//
li_count = upperbound(ipo_related[])
FOR  li_idx = li_count to 1 step -1	
	ltab_action = iw_display.dynamic f_get_tab_action()
	ltp_actionpane_close = ltab_action.control[ipo_related[li_idx].ii_tp_index]
	lstr_actionpane_close = ltp_actionpane_close.f_get_actionpane_structure( )
	destroy ipo_related[li_idx]
	ltab_action.closetab(ltp_actionpane_close )	
NEXT

if isvalid(ids_user_profile) then destroy ids_user_profile
if isvalid(ids_book) then destroy ids_book
if isvalid(ids_policy_rule) then destroy ids_policy_rule
if isvalid(ids_policy_security) then destroy ids_policy_security
if isvalid(ids_policy_alert) then destroy ids_policy_alert
if isvalid(ids_attribute) then destroy ids_attribute
if isvalid(ids_filter_data) then destroy ids_filter_data
end event

event constructor;call super::constructor;any		la_value[]
t_transaction		lt_transasction

lt_transasction = create t_transaction
lt_transasction.dbms =	SQLCA.DBMS
lt_transasction.ServerName	 = SQLCA.ServerName
lt_transasction.LogId	 = SQLCA.LogId
lt_transasction.LogPass 	 = SQLCA.LogPass 
lt_transasction.AutoCommit 	 = false 
lt_transasction.DBParm	 = SQLCA.DBParm
connect using	lt_transasction;	

istr_actionpane[1].s_dwo_action = 'd_action_edit'
istr_actionpane[1].s_button_name = 'b_add;b_insert;b_modify;b_save;b_query;b_execquery;b_filteron;b_refresh;b_delete;b_print;b_view_report;'
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title

this.f_set_actionpane( )
this.f_set_dwo_window( )
this.f_set_dwo_tabpage( )
this.f_set_dwo_related( )
this.f_set_str_unit( )
this.f_set_str_streamvalue( )

ids_user_profile = create	c_ds_usr_profile
la_value[1] ='='+ this.classname( )
la_value[2] = gi_userid
ids_user_profile.f_add_where(  'object_name;user_id', la_value[])
ids_user_profile.f_set_transaction( lt_transasction )
ids_user_profile.retrieve( )

//-- init dwsetup --//
if upper(this.classname( )) <> 'U_VALUESET_ENTRY' then
	idwsetup_initial.f_init_ids_setup_dw_ex( upper(this.classname( )), lt_transasction )
//else
//	idwsetup_initial.f_init_ids_setup_dw( upper(this.f_get_menu_code( ) ) )
end if

disconnect using lt_transasction;
destroy lt_transasction
end event

