$PBExportHeader$b_multithread.sru
forward
global type b_multithread from s_object
end type
end forward

global type b_multithread from s_object
event e_window_e_post ( double vdb_origin_doc_id,  string vs_sob,  string vs_obj_handling,  string vs_server_name,  string vs_logid,  string vs_logpass,  double vdb_userid,  double vdb_company_id,  double vdb_branch_id )
event e_window_e_popup ( b_callback vc_callback,  string vs_server_name,  string vs_logid,  string vs_logpass,  integer vl_interval_minute,  string vs_dwo,  double vl_userid )
event e_window_e_update ( b_callback vod_callback,  string vs_price_type,  string vs_server_name,  string vs_logid,  string vs_logpass )
event e_window_e_action_process ( string vs_object_type,  string vs_servername,  string vs_logid,  string vs_logpass,  string vs_process )
end type
global b_multithread b_multithread

type variables

t_transaction it_transaction
c_timing ic_timing
double	idb_userid
string		ias_table_created[]
end variables

forward prototypes
public subroutine f_update_data (string vs_data)
public function integer f_multitheared (b_callback vc_callback, string vs_sql_pro, string vs_sql_report, string vs_server_name, string vs_logid, string vs_logpass, string vs_dwo, any vaa_retrieve_arg[])
public function integer f_update_table (string vs_update_table, string vs_column_set, any vaa_data_set[], string vs_column_where, any vaa_data_where[])
public function double f_create_id ()
public function boolean f_is_managed_qty_sob (double vdb_item_id)
public function integer f_get_lot_or_serial_yn_sob (double vdb_item_id, ref string rs_lot_yn, ref string rs_serial_yn)
public function integer f_disconnect ()
protected function integer f_update_item_balance_sob (b_doc vod_handling, double vadb_item_ref_id[], date vd_trans_date, double vdb_new_doc_id, string vs_sob)
public function integer f_send_mail_multi (any vaa_retieve_arg[], string vs_subject, string vs_header, string vs_body, string vs_footer, string vs_server_name, string vs_logid, string vs_logpass, b_callback vb_callback)
public function integer f_connect (string vs_server_name, string vs_logid, string vs_logpass)
public function integer f_copy_table (double vdb_origin_doc_id, double vadb_new_object_ref_id[], double vadb_origin_object_ref_id[], string vs_table, string vs_col_ref, ref double radb_new_id[], ref double radb_origin_id[], string vs_table_sob)
public function integer f_create_table_sob (string vs_table_name)
public function integer f_drop_table_sob ()
public function integer f_update_value (double vdb_origin_doc_id, string vs_sob, date vd_trans_date, t_ds_db vds_obj_post, b_doc vod_obj_handling)
public function integer f_update_active_yn (t_ds_db vds_import, string vs_price_type)
public subroutine f_update_manager_group (double vdb_item_id, string vs_mana_code, string vs_menu_code)
public subroutine f_multitheared_popup (b_callback vc_callback, string vs_server_name, string vs_logid, string vs_logpass, long vl_interval_minute, string vs_dwo, long vl_userid)
public function integer f_log_post (double vdb_doc_id, string vs_err)
public function boolean f_is_period_closed (string vs_stop_type, date vd_trans_date, string vs_period_type, t_transaction rt_transaction)
public function string f_get_doc_status (double vdb_doc_id, t_transaction rt_transaction)
public function integer f_get_qty_and_value_yn (double vdb_trans_hdr_id, ref string rs_qty, ref string rs_value, t_transaction rt_transaction)
public function integer f_update_streamvalue_multi_ex (t_ds_db vdw_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row, t_ds_db vdw_f_object, string vas_f_object_col[], string vas_f_object_col_sv[], t_ds_db vdw_t_object, string vas_t_object_col[], string vas_t_object_col_sv[], ref s_str_ds_4_posting rstr_ds_4_posting, s_str_data vstr_data_from_to)
public function integer f_update_streamvalue_multi_ex (t_ds_db vdw_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row, t_ds_db vdw_f_object, string vas_f_object_col[], string vas_f_object_col_sv[], t_ds_db vdw_t_object, string vas_t_object_col[], string vas_t_object_col_sv[], t_ds_db vdw_currency, string vas_cur_col[], string vas_cur_col_sv[], double vdb_trans_value, double vdb_base_value, ref s_str_ds_4_posting rstr_ds_4_posting, s_str_data vstr_data_from_to)
public function integer f_update_streamvalue_multi (t_ds_db vpo_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row)
public function integer f_update_streamvalue_multi (t_ds_db vdw_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row, t_ds_db vdw_f_object, string vas_f_object_col[], string vas_f_object_col_sv[], t_ds_db vdw_t_object, string vas_t_object_col[], string vas_t_object_col_sv[], t_ds_db vdw_currency, string vas_cur_col[], string vas_cur_col_sv[], double vdb_trans_value, double vdb_base_value, ref s_str_ds_4_posting rstr_ds_4_posting)
public function integer f_update_streamvalue_multi (t_ds_db vdw_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row, t_ds_db vdw_f_object, string vas_f_object_col[], string vas_f_object_col_sv[], t_ds_db vdw_t_object, string vas_t_object_col[], string vas_t_object_col_sv[], ref s_str_ds_4_posting rstr_ds_4_posting)
public function string f_get_object_type (long vl_object_id)
public function integer f_set_qty_sku (ref t_transaction rt_transaction, ref powerobject rpo_item, double vdb_row, double vdb_item_id, double vdb_trans_uom, string vs_qty_column, string vs_in_out, ref double rdb_qty_sku, ref double rdb_round_diff)
private function integer f_update_item_balance_all (ref t_transaction rt_transaction, any vaa_arg[], date vd_balance_date)
public function integer f_update_item_balance (ref t_transaction rt_transaction, any vaa_arg[], date vd_trans_date, double vdb_qty, double vdb_base_value, string vs_in_out, string vs_balance_control, string ls_lotno_serial, string vs_value_yn, string vs_object_type)
public function integer f_get_stock_uom (double vdb_item_id, ref double rdb_stock_uom, ref string rs_uom_code)
public function string f_get_object_code_ex (double vdb_id, ref t_transaction rt_transaction)
public function integer f_update_moving_avg (double vdb_item_id, double vdb_moving_avg, ref t_transaction rt_transaction)
public function integer f_get_item_managed_qty_value (double vdb_item, ref string rs_qty_yn, ref string rs_value_yn, ref t_transaction rt_transaction)
public function integer f_booking_item_lot_multi_ex (ref t_transaction rt_transaction, ref t_ds_db rds_stream, t_ds_db vdw_item, long vl_item_row, ref t_ds_db rpo_item_lot, any vaa_data[], date vd_trans_date, string vs_lot_yn, string vs_serial_yn, string vs_qty_yn, string vs_value_yn, string vs_post_type, double vdb_item_value, double vdb_item_base_value, double vdb_item_qty, t_ds_db vdw_f_object, t_ds_db vdw_t_object, string vas_col_item[], string vas_col_item_lot[], string vas_col_item_value[], string vas_col_f_object[], string vas_col_t_object[], double vdb_trans_uom, string vas_col_f_object_sv[], string vas_col_t_object_sv[], string vas_col_item_sv[], string vas_col_item_lot_sv[], string vas_col_item_value_sv[], string vs_item_ref_table, string vs_samecol_string, string vs_doc_type, double vdb_dwitem_id, double vdb_doc_id, t_ds_db vdw_currency, string vas_col_currency[], string vas_col_currency_sv[], ref s_str_ds_4_posting rstr_ds_4_posting)
public function string f_get_related_doc_qty_yn (double vdb_doc_id, ref t_transaction rt_transaction)
public function integer f_get_ds_of_streamvalue_ex (ref double vdb_doc_version, ref t_ds_db rdw_item, ref t_ds_db rdw_f_object, ref t_ds_db rdw_t_object, ref t_ds_db rdw_f_lot, ref t_ds_db rdw_t_lot, ref t_ds_db rdw_item_value, ref t_ds_db rdw_item_lot, s_str_streamvalue vstr_streamvalue, ref t_transaction rt_transaction)
public function integer f_get_dwcol_of_streamvalue (ref string ras_col_f_object[], ref string ras_col_f_object_sv[], ref string ras_col_t_object[], ref string ras_col_t_object_sv[], ref string ras_col_item[], ref string ras_col_item_sv[], ref string ras_col_item_value[], ref string ras_col_item_value_sv[], ref string ras_col_item_lot[], ref string ras_col_item_lot_sv[], ref string ras_col_currency[], ref string ras_col_currency_sv[], s_str_streamvalue vstr_streamvalue)
public function string f_get_object_type_ex (double vdb_object_id, ref t_transaction rt_transaction)
public function integer f_get_lot_or_serial_yn_ex (double vdb_item_id, ref string rs_lot_yn, ref string rs_serial_yn, ref t_transaction rt_transaction)
public function boolean f_is_managed_qty_ex (double vdb_item_id, ref t_transaction rt_transaction)
public function integer f_update_round_diff (double vdb_item_id, double vdb_round_diff, ref t_transaction rt_transaction)
public function string f_get_warehouse_negative (double vdb_id, ref t_transaction rt_transaction)
public function integer f_get_stock_uom_ex (double vdb_item_id, ref double rdb_stock_uom, ref string rs_uom_code, ref t_transaction rt_transaction)
public function integer f_test (integer vi_test)
public function integer f_get_qty_and_value_yn_sob (double vdb_doc_id, ref string rs_quantity_yn, ref string rs_value_yn, ref t_transaction rt_transaction)
public function integer f_insert_item_balance (ref t_ds_db rds_item_balance, any vaa_arg[], date vd_balance_date, string vs_in_out, double vdb_in_out_qty, double vdb_in_out_base_value, double vdb_open_qty, double vdb_open_value, double vdb_close_qty, double vdb_close_value, t_transaction rt_transaction)
public function integer f_postinsert_streamvalue (ref t_ds_db rds_stream, long vl_row, string vs_value_yn, string vs_qty_yn, string vs_item_ref_table, double vdb_item_ref_id, string vs_doc_ref_type, double vdb_doc_ref_id, ref date vd_trans_date, t_transaction rt_transaction)
public subroutine f_post (string vs_server, string vs_login, string vs_pwd, double vdb_company_id, double vdb_branch_id, double vdb_user_id, string vs_sob, string vs_dwo, string vs_docs_id, s_str_streamvalue vastr_streamvalue[], s_str_ds_4_posting vstr_ds_4_posting)
public function integer f_copy_version (double vdb_doc_id, s_str_ds_4_posting vstr_ds_4_posting, ref t_transaction rt_transaction)
public function integer f_booking_item_multi_ex (double vdb_doc_id, double vdb_doc_version, string vs_doctype, ref t_transaction rt_transaction, date vd_trans_date, string vs_post_type, string vs_qty_yn, string vs_value_yn, double vadb_related_doc_id[], s_str_streamvalue vstr_streamvalue[], s_str_ds_4_posting rstr_ds_4_posting)
public function long f_unbooking_ex (double vdb_doc_id, double vdb_doc_version, string vs_doctype, date vd_trans_date, string vs_qty_yn, string vs_value_yn, s_str_streamvalue vstr_streamvalue[], s_str_ds_4_posting vstr_ds_4_posting, ref t_transaction rt_transaction)
public function integer f_get_round_diff (ref t_transaction rt_transaction, ref powerobject rpo_item, double vdb_row, double vdb_item_id, double vdb_trans_uom, string vs_qty_column, ref double rdb_round_diff)
public subroutine f_unpost (string vs_server, string vs_login, string vs_pwd, double vdb_company_id, double vdb_branch_id, double vdb_user_id, string vs_sob, string vs_dwo, string vs_docs_id, s_str_streamvalue vastr_streamvalue[], s_str_ds_4_posting vstr_ds_4_posting)
public function double f_get_last_pur_price (double vdb_item_id, ref t_transaction rt_transaction)
public function double f_get_moving_avg (double vdb_item_id, ref t_transaction rt_transaction)
public function integer f_get_posting_type_account (t_ds_db vds_trans_setup, string vs_dwo_get_amount, string vs_posting_type, ref s_str_post_account rstr_post_acct_spec[], ref s_str_post_account rstr_post_acct_group[], ref s_str_post_account rstr_post_acct_all[], ref s_str_post_info rstr_post_info)
protected function integer f_get_posting_condition_multi (double vdb_doc_version, s_str_post_info vstr_post_info, t_ds_db vds_get_amount, long vl_handle_row, ref string rs_condition_val, ref string rs_condition_coltype, ref t_transaction rt_transaction, ref s_str_ds_4_posting rstr_ds_4_posting)
protected function integer f_get_posting_object_multi (double vdb_doc_version, s_str_post_account vstr_post_info, t_ds_db vds_get_amount, long vl_handle_row, ref double rdb_dr_object_id, ref double rdb_cr_object_id, ref t_transaction rt_transaction, ref s_str_ds_4_posting rstr_ds_4_posting, ref double rdb_dr_subacct_id, ref double rdb_cr_subacct_id)
protected function integer f_get_posting_trans_text_multi (double vdb_doc_version, s_str_post_info vstr_post_info, t_ds_db vds_get_amount, long vl_handle_row, ref string rs_trans_text_dw, ref t_transaction rt_transaction, ref s_str_ds_4_posting rstr_ds_4_posting)
public function string f_get_obj_type_other (double vdb_object_id, string vs_obj_type_primary)
public function integer f_insert_ledger_trans (double vdb_doc_id, string vs_doctype, date vd_trans_date, ref t_transaction rt_transaction, ref t_ds_db vds_ledger_trans)
public function integer f_insert_object_trans (double vdb_doc_id, string vs_doctype, date vd_trans_date, ref t_transaction rt_transaction, t_ds_db rds_obj_trans_post)
public function integer f_update_object_balance (string vs_sob, double vdb_branch_id, double vdb_object_id, string vs_object_type, double vdb_currency_id, double vdb_account_id, double vdb_subaccount, string vs_not_accept, double vdc_close_amt, double vdc_close_base_amt, ref t_transaction rt_transaction, string vs_balance_control, date vd_trans_date, date vd_max_date, ref t_ds_db rds_object_balance_after)
private function integer f_update_allobject_openclose_value (ref t_ds_db rds_allobject_balance, t_ds_db vds_allobject_balance_after, ref t_transaction rt_transaction)
public function integer f_booking_multi (double vdb_doc_id, double vdb_doc_version, date vd_trans_date, string vs_doctype, string vs_qty_yn, string vs_value_yn, double vadb_related_doc_id[], ref t_transaction rt_transaction, ref s_str_ds_4_posting rstr_ds_4_posting, s_str_streamvalue vastr_streamvalue[])
public function integer f_get_trans_setup (double vdb_trans_hdr_id, ref t_ds_db rds_trans_setup, t_transaction rt_transaction)
protected function integer f_get_posting_object_multi (double vdb_doc_version, ref s_str_post_info vstr_post_info, t_ds_db vds_get_amount, long vl_handle_row, ref double rdb_dr_object_id, ref double rdb_cr_object_id, ref t_transaction rt_transaction, ref s_str_ds_4_posting rstr_ds_4_posting, ref double rdb_dr_subacct_id, ref double rdb_cr_subacct_id)
public function integer f_get_trans_setup_account (double vdb_dr_object, double vdb_cr_object, string vs_condition_val, string vs_condition_coltype, s_str_post_account vstr_post_account_spec[], s_str_post_account vstr_post_account_grp[], s_str_post_account vstr_post_account_all[], ref s_str_post_info vstr_post_info, ref s_str_post_account rstr_post_account, ref t_transaction rt_transaction)
public function double f_get_posting_group (double vdb_object_id, ref t_transaction rt_transaction)
public function string f_get_balance_control (double vdb_id, ref t_transaction rt_transaction)
public function integer f_insert_object_balance (double vdb_doc_id, date vd_trans_date, ref t_transaction rt_transaction, t_ds_db rds_obj_balance_post, string vs_post_unpost, string vs_sob)
public function integer f_create_post_line_multi (double vdb_doc_id, date vd_trans_date, double vdb_doc_version, double vdb_curr_id, double vdb_exrate, double vdb_return_doc_id, double vdb_branch_id, double vdb_trans_hdr_id, ref s_str_ds_4_posting vstr_ds_4_posting, s_str_streamvalue vastr_streamvalue[], ref t_transaction rt_transaction)
public function integer f_insert_post_line_multi (double vdb_doc_id, date vd_trans_date, double vdb_doc_version, double vdb_branch_id, t_ds_db vds_get_amount, double vdb_currency_id, double vdc_exrate, double vdb_return_doc_id, s_str_post_account vstr_spec_acct[], s_str_post_account vstr_grp_acct[], s_str_post_account vstr_all_acct[], s_str_post_info vstr_post_info, ref s_str_ds_4_posting vstr_ds_4_posting, s_str_streamvalue vastr_streamvalue[], ref t_transaction rt_transaction)
public function integer f_get_item_columns_of_streamvalue (string vs_item_dwo, ref string ras_col_item[], s_str_streamvalue vastr_streamvalue[])
public function integer f_insert_item_balance_row_multi_ex (ref t_transaction rt_transaction, ref t_ds_db rds_item, ref long rl_item_row, t_ds_db vds_f_object, t_ds_db vds_t_object, date vd_trans_date, string vs_post_type, string vas_col_item[], string vas_col_item_value[], string vas_f_col_object[], string vas_t_col_object[], any vaa_data[], string vs_qty_yn, string vs_value_yn, double vdb_trans_uom, string vs_qty_column, double vdb_value, ref s_str_ds_4_posting rstr_ds_4_posting, string vs_trans_qty_yn, string vs_trans_val_yn, ref s_str_data rstr_data_from_to, double vdb_doc_id, string vs_related_doc_qty_yn)
public function decimal f_get_return_unit_cogs (double vdb_sal_rtn_line_id, ref t_transaction rt_transaction)
public function boolean f_is_managed_value_ex (double vdb_item_id, ref t_transaction rt_transaction)
public function string f_get_object_control_yn (double vdb_id, ref t_transaction rt_transaction)
public function string f_get_doc_type (double vdb_doc_id, ref transaction rtransaction)
public function integer f_create_exrate_post_line_ex (double vdb_dr_object_id, double vdb_cr_object_id, t_ds_db vds_f_post_line, double vdb_trans_amount, double vdb_base_amount, double vdb_settle_curr, double vdb_settle_exrate, date vd_trans_date, double vdb_doc_id, double vdb_object_ref_id, string vs_object_ref_table, s_str_post_account vstr_post_account, ref t_ds_db rds_post_line, ref t_transaction rt_transaction)
public function integer f_insert_exrate_post_line_ex (ref t_ds_db rds_post_line, s_str_post_account vstr_post_account, double vdb_diff_amount, double vdb_settle_currency, double vdb_exrate, date vd_trans_date, double vdb_doc_id, double vdb_object_ref_id, string vs_object_ref_table, double vdb_dr_object_id, double vdb_cr_object_id, ref t_transaction rt_transaction)
end prototypes

event e_window_e_post(double vdb_origin_doc_id, string vs_sob, string vs_obj_handling, string vs_server_name, string vs_logid, string vs_logpass, double vdb_userid, double vdb_company_id, double vdb_branch_id);/***************************************************************
Sự Kiện ghi sổ phụ
		Chức năng	: copy chứng từ gốc, copy các bản TRANS,Update lại các bản BALANCE
		Tham số		: vdb_origin_doc_id id gốc của document
						  vs_sob Ký tự sổ phụ muốn ghi
						  vs_obj_handling tên đối tượng đang ghi sổ
						  vs_server_name tên servername kết nối database
						  vs_logid schema kết nối db
						  vs_logpass pass kết nối db
						  vdb_userid user đang đăng nhập
***************************************************************/
double 				ldb_new_doc_id,ladb_new_object_ref_id[] ,ladb_origin_object_ref_id[], ladb_new_id[],ladb_new_object_ref_id_lv3[],ladb_origin_object_ref_id_lv3[]
double				ladb_origin_id[],ladb_empty[],ladb_new_object_ref_id_lv2[],ladb_origin_object_ref_id_lv2[]
string					ls_doc_type,ls_update_col,ls_qty_yn,ls_value_yn,ls_table_sob,las_table_created[]
date					ld_trans_date
any					laa_data_set[],laa_data_where[],laa_empty[],laa_data_set_defaul[],laa_data_where_defalut[]
int						li_idx,li_rtn
c_dwservice			lc_dwsr
t_ds_db				lds_ledger_trans,lds_obj_post
b_doc					lod_obj_handling

if this.f_connect( vs_server_name, vs_logpass, vs_logpass) = -1 then return
idb_userid = vdb_userid
g_user = create c_user_instance
g_user.f_init( idb_userid)
gi_user_comp_id = vdb_company_id
gdb_branch = vdb_branch_id
gi_userid	= vdb_userid

if lc_dwsr.f_get_qty_and_value_yn( vdb_origin_doc_id, ls_qty_yn,ls_value_yn) <> 1 then
end if
//-- tạo mới toàn bộ bảng cần thiết --//
ls_table_sob = 'DOCUMENT;OBJECT_TRANS;LEDGER_TRANS;BOOKED_SLIP;INVENTORY_LINE;SAL_INVOICE_LINE;PUR_INVOICE_LINE;PAYMENT_LINE;CHARGE_LINE;POST_LINE;TAX_LINE;STREAM_VALUE;POST_LINE;LEDGER_LINE;'
if this.f_create_table_sob( ls_table_sob) = -1 then
	this.f_drop_table_sob( )
	return 
end if
//--nhân bản document ( main )--//
if this.f_copy_table( vdb_origin_doc_id, ladb_new_object_ref_id, ladb_origin_object_ref_id, 'DOCUMENT', '', ladb_new_id, ladb_origin_id,ias_table_created[1]) = -1 then return
ldb_new_doc_id = ladb_new_id[1]
ladb_new_object_ref_id[upperbound(ladb_new_object_ref_id) + 1] = ldb_new_doc_id
ladb_origin_object_ref_id[upperbound(ladb_origin_object_ref_id) + 1] = vdb_origin_doc_id
laa_data_set_defaul[1] = "'"+ vs_sob + "'"
laa_data_where_defalut[1] = ldb_new_doc_id
//--nhân bản OBJECT_TRANS--//
if this.f_copy_table( vdb_origin_doc_id, ladb_new_object_ref_id, ladb_origin_object_ref_id, 'OBJECT_TRANS', 'DOC_REF_ID', ladb_new_id, ladb_origin_id,ias_table_created[2]) = -1 then return
//--update cột sob--//
if this.f_update_table('OBJECT_TRANS', 'sob;', laa_data_set_defaul, 'DOC_REF_ID;', laa_data_where_defalut) = -1 then return
//--nhân bản LEDGER_TRANS--//
if this.f_copy_table( vdb_origin_doc_id, ladb_new_object_ref_id, ladb_origin_object_ref_id, 'LEDGER_TRANS', 'DOC_REF_ID', ladb_new_id, ladb_origin_id,ias_table_created[3]) = -1 then return
//--update cột sob--//
if this.f_update_table('LEDGER_TRANS', 'sob;', laa_data_set_defaul, 'DOC_REF_ID;', laa_data_where_defalut) = -1 then return
//--nhân bản booked_slip --//
if this.f_copy_table( vdb_origin_doc_id, ladb_new_object_ref_id, ladb_origin_object_ref_id, 'BOOKED_SLIP', 'OBJECT_REF_ID', ladb_new_id, ladb_origin_id,ias_table_created[4]) = -1 then return
//--update lại version_id, cho document vừa nhân bản--//
if vs_sob <> 'F' then
	laa_data_set[1] = ladb_new_id[1]
	laa_data_set[2] = "'"+vs_sob+"'"
	laa_data_set[3] = vdb_origin_doc_id
	laa_data_where[1] = ldb_new_doc_id
	if this.f_update_table('DOCUMENT', 'version_id;sob;FSOB_ID;', laa_data_set, 'id;', laa_data_where) = -1 then	return
else
	laa_data_set[1] = ldb_new_doc_id
	laa_data_where[1] = vdb_origin_doc_id
	if this.f_update_table('DOCUMENT', 'FSOB_ID;', laa_data_set, 'id;', laa_data_where) = -1 then return
	laa_data_set[1] = ladb_new_id[1]
	laa_data_set[2] = "'"+vs_sob+"'"
	laa_data_where[1] = ldb_new_doc_id
	if this.f_update_table('DOCUMENT', 'version_id;sob;', laa_data_set, 'id;', laa_data_where) = -1 then	return
end if
laa_data_set = laa_empty
laa_data_where = laa_empty
//--update lại version_no, cho booked_slip vừa nhân bản--//
laa_data_set[1] = 1
laa_data_where[1] = ladb_new_id[1]
if this.f_update_table('BOOKED_SLIP', 'version_no;', laa_data_set, 'id;', laa_data_where) = -1 then return
laa_data_set = laa_empty
laa_data_where = laa_empty
ladb_new_object_ref_id = ladb_new_id
ladb_origin_object_ref_id = ladb_origin_id
//--nhân bản INVENTORY_LINE--//
if this.f_copy_table( vdb_origin_doc_id, ladb_new_object_ref_id, ladb_origin_object_ref_id, 'INVENTORY_LINE', 'OBJECT_REF_ID', ladb_new_id, ladb_origin_id,ias_table_created[5]) = -1 then	return
//--nhân bản SAL_INVOICE_LINE--//
if this.f_copy_table( vdb_origin_doc_id, ladb_new_object_ref_id, ladb_origin_object_ref_id, 'SAL_INVOICE_LINE', 'OBJECT_REF_ID', ladb_new_id, ladb_origin_id,ias_table_created[6]) = -1 then return
//--nhân bản PUR_INVOICE_LINE--//
if this.f_copy_table( vdb_origin_doc_id, ladb_new_object_ref_id, ladb_origin_object_ref_id, 'PUR_INVOICE_LINE', 'OBJECT_REF_ID', ladb_new_id, ladb_origin_id,ias_table_created[7]) = -1 then return
//--nhân bản PAYMENT_LINE--//
if this.f_copy_table( vdb_origin_doc_id, ladb_new_object_ref_id, ladb_origin_object_ref_id, 'PAYMENT_LINE', 'OBJECT_REF_ID', ladb_new_id, ladb_origin_id,ias_table_created[8]) = -1 then return
//--nhân bản LEDGER_LINE--//
if this.f_copy_table( vdb_origin_doc_id, ladb_new_object_ref_id, ladb_origin_object_ref_id, 'LEDGER_LINE', 'OBJECT_REF_ID', ladb_new_id, ladb_origin_id,ias_table_created[14]) = -1 then return

ladb_new_object_ref_id_lv2 = ladb_new_id
ladb_origin_object_ref_id_lv2 = ladb_origin_id
//-- nhân bản CHARGE_LINE của SAL_INVOICE_LINE or PUR_INVOICE_LINE--//
if this.f_copy_table( vdb_origin_doc_id, ladb_new_object_ref_id_lv2, ladb_origin_object_ref_id_lv2, 'CHARGE_LINE', 'OBJECT_REF_ID', ladb_new_id, ladb_origin_id,ias_table_created[9]) = -1 then return
//--nhân bản POST_LINE của SAL_INVOICE_LINE or PUR_INVOICE_LINE or PAYMENT_LINE--//
if this.f_copy_table( vdb_origin_doc_id, ladb_new_object_ref_id_lv2, ladb_origin_object_ref_id_lv2, 'POST_LINE', 'OBJECT_REF_ID', ladb_new_id, ladb_origin_id,ias_table_created[10]) = -1 then return
//--update lại doc_id của POST_LINE của SAL_INVOICE_LINE or PUR_INVOICE_LINE or PAYMENT_LINE --//
laa_data_set[1] = ldb_new_doc_id
for li_idx = 1 to upperbound(ladb_new_object_ref_id_lv2)
	laa_data_where[1] = ladb_new_object_ref_id_lv2[li_idx]
	if this.f_update_table('POST_LINE', 'DOC_ID;', laa_data_set, 'OBJECT_REF_ID;', laa_data_where) = -1 then 
		return
	end if
next
//--Nhân bản TAX_LINE của SAL_INVOICE_LINE or PUR_INVOICE_LINE--//
if this.f_copy_table( vdb_origin_doc_id, ladb_new_object_ref_id_lv2, ladb_origin_object_ref_id_lv2, 'TAX_LINE', 'OBJECT_REF_ID', ladb_new_id, ladb_origin_id,ias_table_created[11]) = -1 then	 return
ladb_new_object_ref_id_lv3 = ladb_new_id
ladb_origin_object_ref_id_lv3 = ladb_origin_id
//--nhân bản POST_LINE của TAX_LINE --//
if this.f_copy_table( vdb_origin_doc_id, ladb_new_object_ref_id_lv3, ladb_origin_object_ref_id_lv3, 'POST_LINE', 'OBJECT_REF_ID', ladb_new_id, ladb_origin_id,ias_table_created[13]) = -1 then return
//--update lại doc_id của POST_LINE của TAX_LINE --//
laa_data_set[1] = ldb_new_doc_id
for li_idx = 1 to upperbound(ladb_new_object_ref_id_lv3)
	laa_data_where[1] = ladb_new_object_ref_id_lv3[li_idx]
	if this.f_update_table('POST_LINE', 'DOC_ID;', laa_data_set, 'OBJECT_REF_ID;', laa_data_where) = -1 then return
next
//--update cột sob--//
if this.f_update_table('POST_LINE', 'sob;', laa_data_set_defaul, 'DOC_ID;', laa_data_where_defalut) = -1 then return
//--nhân bản STREAM_VALUE --//
if this.f_copy_table( vdb_origin_doc_id, ladb_new_object_ref_id_lv2, ladb_origin_object_ref_id_lv2, 'STREAM_VALUE', 'ITEM_REF_ID', ladb_new_id, ladb_origin_id,ias_table_created[12]) = -1 then return
//-- update lại doc_ref_id cho STREAM_VALUE--// thêm cột sob
laa_data_set[1] = ldb_new_doc_id
for li_idx = 1 to upperbound(ladb_new_object_ref_id_lv2)
	laa_data_where[1] = ladb_new_object_ref_id_lv2[li_idx]
	if this.f_update_table('STREAM_VALUE', 'DOC_REF_ID;', laa_data_set, 'ITEM_REF_ID;', laa_data_where) = -1 then return 
//	commit using it_transaction;//////////////////////////////////////////commit để debug--//
next
//--update cột sob--//
if this.f_update_table('STREAM_VALUE', 'sob;', laa_data_set_defaul, 'DOC_REF_ID;', laa_data_where_defalut) = -1 then return
lds_obj_post = create t_ds_db
lod_obj_handling = create using vs_obj_handling
select doc.DOC_TYPE, bks.TRANS_DATE into :ls_doc_type, :ld_trans_date
from document doc join booked_slip bks on bks.id = doc.version_id
where doc.id = :vdb_origin_doc_id using it_transaction;
if it_transaction.sqlcode <> 0 then
	this.f_drop_table_sob( )
	return
end if 
if ls_value_yn = 'Y' then
	this.f_update_value( vdb_origin_doc_id, vs_sob, ld_trans_date, lds_obj_post, lod_obj_handling)
end if
if ls_qty_yn = 'Y' then
	//--update item_balance--//
//	commit using it_transaction;//////////////////////////////////////////commit để debug--//
	
	if this.f_update_item_balance_sob( lod_obj_handling, ladb_new_object_ref_id_lv2, ld_trans_date, ldb_new_doc_id,vs_sob) = -1 then
		this.f_drop_table_sob( )
		destroy lds_obj_post
		destroy lod_obj_handling
		return 
	end if
end if
commit using it_transaction;
destroy lds_obj_post
destroy lod_obj_handling
destroy g_user
this.f_drop_table_sob( )
disconnect using it_transaction;
disconnect using SQLCA;
end event

event e_window_e_popup(b_callback vc_callback, string vs_server_name, string vs_logid, string vs_logpass, integer vl_interval_minute, string vs_dwo, double vl_userid);////tao transaction rieng cho popup và khởi tạo timer

//it_transaction = create t_transaction
//it_transaction.DBMS = 'O10 Oracle10g (10.1.0)'
//it_transaction.ServerName =vs_server_name
//it_transaction.LogId =vs_logid
//it_transaction.LogPass = vs_logpass
//it_transaction.AutoCommit = False
//it_transaction.DBParm = "CommitOnDisconnect='No',PBCatalogOwner='"+ vs_logid +"'"
//connect using it_transaction;
//ic_timing = create c_timing
//ic_timing.is_dwo = vs_dwo
//ic_timing.il_user_id = vl_userid
//ic_timing.ib_callback = vc_callback
//ic_timing.il_interval_minute = vl_interval_minute
//ic_timing.it_transaction = it_transaction 
//ic_timing.start(120) //pm mo 10s thì hiện alert
//ic_timing.f_get_data( )
end event

event e_window_e_update(b_callback vod_callback, string vs_price_type, string vs_server_name, string vs_logid, string vs_logpass);t_ds_db		lds_tmp

if this.f_connect( vs_server_name, vs_logid, vs_logpass) = -1 then return 
//lds_tmp = vod_callback.f_get_ids_data(1)
this.f_update_active_yn( lds_tmp, vs_price_type)
end event

event e_window_e_action_process(string vs_object_type, string vs_servername, string vs_logid, string vs_logpass, string vs_process);string		vs_tmp

if lower(vs_object_type) = 'u_timesheet' then
	this.f_connect( vs_servername, vs_logid,vs_logpass)
	execute immediate :vs_process using it_transaction;
	disconnect using it_transaction;
	disconnect using SQLCA;
end if
return
end event

public subroutine f_update_data (string vs_data);string 	ls_values[], ls_remind_option, ls_updSQL
double 	ldb_id
c_string 	lc_string
lc_string.f_stringtoarray(vs_data, ';',  ls_values)
//messagebox('', vs_data)

ldb_id = double(ls_values[1])
ls_remind_option = ls_values[2]

t_transaction lt_transaction_stop
lt_transaction_stop = create t_transaction
lt_transaction_stop.DBMS = 'O10 Oracle10g (10.1.0)'
lt_transaction_stop.ServerName =it_transaction.servername
lt_transaction_stop.LogId =it_transaction.logid
lt_transaction_stop.LogPass = it_transaction.logpass
lt_transaction_stop.AutoCommit = False
lt_transaction_stop.DBParm = "CommitOnDisconnect='No',PBCatalogOwner='"+ it_transaction.logid +"'"
connect using lt_transaction_stop;

if ls_remind_option = 'pause' then
	ls_updSQL = "UPDATE alert_data "+ &
					" SET checked_yn = 'N',LAST_MDF_DATE = (select sysdate from dual), LAST_MDF_BY = " + string(gi_userid) + & 
					" WHERE ID = "+ string(ldb_id)
									
	EXECUTE IMMEDIATE :ls_updSQL using it_transaction ;
	commit using lt_transaction_stop;
	if it_transaction.sqlcode <> 0 then
		messagebox('ERROR', 'f_update_data' + it_transaction.sqlerrtext)
	end if
end if
if ls_remind_option = 'stop' then
	////tao transaction rieng cho popup và khởi tạo timer
	ls_updSQL = "UPDATE alert_data "+ &
					" SET checked_yn = 'Y',LAST_MDF_DATE = (select sysdate from dual), LAST_MDF_BY = " + string(gi_userid) + & 
					" WHERE ID = "+ string(ldb_id)
									
	EXECUTE IMMEDIATE :ls_updSQL using lt_transaction_stop ;
	commit using lt_transaction_stop;
	if lt_transaction_stop.sqlcode <> 0 then
		messagebox('ERROR', 'f_update_data' + lt_transaction_stop.sqlerrtext)
	end if
end if
end subroutine

public function integer f_multitheared (b_callback vc_callback, string vs_sql_pro, string vs_sql_report, string vs_server_name, string vs_logid, string vs_logpass, string vs_dwo, any vaa_retrieve_arg[]);t_ds_db			lds_report
t_transaction	lt_transaction
string				ls_modify,ls_rtn
blob				lblb_report
long				ll_retrieve
any				laa_arg[10]
int					li_idx,li_count

lt_transaction = create t_transaction
lt_transaction.DBMS = 'O10 Oracle10g (10.1.0)'
lt_transaction.ServerName = vs_server_name
lt_transaction.LogId = vs_logid
lt_transaction.LogPass = vs_logpass
lt_transaction.AutoCommit = False
lt_transaction.DBParm = "CommitOnDisconnect='No',PBCatalogOwner='"+ vs_logid +"'"
connect using lt_transaction;

if vs_sql_pro <> '' then
	execute immediate :vs_sql_pro using lt_transaction;
end if

lds_report = create t_ds_db
lds_report.dataobject = vs_dwo
ls_modify = "Datawindow.Table.Select=~'" + vs_sql_report + "~'"
ls_rtn =lds_report.modify(ls_modify )
lds_report.f_settransobject(lt_transaction )
li_count = upperbound(vaa_retrieve_arg)
for li_idx = 1 to li_count
	laa_arg[li_idx] = vaa_retrieve_arg[li_idx]
next
ll_retrieve = lds_report.retrieve(laa_arg[1], laa_arg[2], laa_arg[3], laa_arg[4], laa_arg[5], laa_arg[6], laa_arg[7], laa_arg[8], laa_arg[9], laa_arg[10] )
//sleep(5)
//if ll_retrieve > 0 then
	lds_report.getfullstate( lblb_report)
	vc_callback.f_setdata(lblb_report)
//end if
destroy lds_report
disconnect using lt_transaction;
return ll_retrieve
end function

public function integer f_update_table (string vs_update_table, string vs_column_set, any vaa_data_set[], string vs_column_where, any vaa_data_where[]);int					li_idx
string				ls_sql_update,las_column_set[],las_column_where[],ls_sql_col_set,ls_sql_where
c_string			lc_str

lc_str.f_stringtoarray( vs_column_set, ';', las_column_set)
lc_str.f_stringtoarray( vs_column_where, ';', las_column_where)
for li_idx = 1 to upperbound(las_column_set)
	if ls_sql_col_set <> '' then ls_sql_col_set += ', '
	ls_sql_col_set += las_column_set[li_idx] + ' = ' + string(vaa_data_set[li_idx])
next
for li_idx = 1 to upperbound(las_column_where)
	if ls_sql_where <> '' then ls_sql_where = ' AND '
	ls_sql_where += las_column_where[li_idx] + ' = ' + string(vaa_data_where[li_idx])
next
ls_sql_update += 'update ' + vs_update_table 
ls_sql_update += ' set ' + ls_sql_col_set
ls_sql_update += ' where ' + ls_sql_where
execute immediate :ls_sql_update using it_transaction;
if it_transaction.sqlcode <> 0 then 
	this.f_drop_table_sob()
	return -1
end if
return 1
end function

public function double f_create_id ();/************************************************************************
Chức năng: Tạo ID cho 1 đối tượng
------------------------------------------------------------------------------
Tham số:
--------------------
Return (Double): Số dùng làm primary key của đối tượng
				     : -1 Nếu có lỗi
=================================================================*/

double		ldb_id

select SEQ_TABLE_ID.nextval into :ldb_id from dual using it_transaction;

if it_transaction.sqlcode = 0 then
	return ldb_id
else
	return -1
end if

end function

public function boolean f_is_managed_qty_sob (double vdb_item_id);boolean			lb_ok
string				ls_qty_yn

setnull(lb_ok)
if isnull(vdb_item_id) or vdb_item_id = 0 then	return lb_ok

select quantity_yn into :ls_qty_yn from item where object_ref_id = :vdb_item_id  using it_transaction;

if it_transaction.sqlcode = 0 then
	if ls_qty_yn = 'Y' then return true
	return false
else
	gf_messagebox('m.c_item.f_is_managed_qty.01','Thông báo','Lôi Select table:'+sqlca.sqlerrtext,'stop','ok',1)
	return lb_ok
end if

end function

public function integer f_get_lot_or_serial_yn_sob (double vdb_item_id, ref string rs_lot_yn, ref string rs_serial_yn);
select nvl(item.lot_yn,'N'),nvl(item.serial_yn,'N') into :rs_lot_yn,:rs_serial_yn 
from item 
where item.object_ref_id = :vdb_item_id using it_transaction;
if it_transaction.sqlcode = 0 then
	return 1
else
	return -1
end if
end function

public function integer f_disconnect ();disconnect using it_transaction;
destroy it_transaction
return 0
end function

protected function integer f_update_item_balance_sob (b_doc vod_handling, double vadb_item_ref_id[], date vd_trans_date, double vdb_new_doc_id, string vs_sob);
double				ldb_item_id,ldb_qty_sku,ldb_value,ldb_object_ref_id,ldb_f_object_id,ldb_t_object_id
string					las_col_f_object[], las_col_f_object_sv[], las_col_t_object[], las_col_t_object_sv[], las_col_item[], las_col_item_sv[],las_col_item_value[]
string					las_col_item_value_sv[], las_col_item_lot[], las_col_item_lot_sv[], las_col_currency[], las_col_currency_sv[],ls_balance_control
string					ls_lot_yn,ls_serial_yn,ls_sql,ls_sql_syntax,ls_err,ls_qty_yn,ls_value_yn,ls_f_object_type,ls_t_object_type
string					ls_manage_qty_yn,ls_manage_value_yn
any					laa_data[]
int						li_idx,li_rtn,li_idx1,li_rowcount,li_idx2
s_str_streamvalue	lstr_streamvalue[]
t_ds_db				lds_stream
b_obj_instantiate	lb_obj_ins

lds_stream = create t_ds_db
li_rtn = vod_handling.f_get_str_streamvalue(lstr_streamvalue)
for li_idx = 1 to li_rtn
	vod_handling.f_get_dwcol_of_streamvalue( las_col_f_object[], las_col_f_object_sv[], las_col_t_object[], las_col_t_object_sv[], las_col_item[], las_col_item_sv[],las_col_item_value[], las_col_item_value_sv[], las_col_item_lot[], las_col_item_lot_sv[], las_col_currency[], las_col_currency_sv[], li_idx)
//	this.f_get_qty_and_value_yn_sob( vdb_new_doc_id, ls_qty_yn,ls_value_yn)
	for li_idx1 = 1 to upperbound(vadb_item_ref_id)
		ls_sql = 'select '+las_col_item_sv[1]+','+las_col_item_sv[2]+','+las_col_item_sv[5]+','+las_col_item_sv[3]+','+las_col_f_object_sv[1]+','+las_col_t_object_sv[1]
		if upperbound(las_col_item_value_sv) > 0 then ls_sql += ','+las_col_item_value_sv[3]+','+las_col_item_value_sv[5]+','+las_col_item_value_sv[2]
		if upperbound(las_col_item_lot_sv) >0 then ls_sql += ','+las_col_item_lot_sv[2]+','+las_col_item_lot_sv[3]
		ls_sql +=', TRANS_DATE,COMPANY_ID from STREAM_VALUE where ITEM_REF_ID = '+string(vadb_item_ref_id[li_idx1])
		ls_sql_syntax = it_transaction.syntaxfromsql(ls_sql, "", ls_err)
		if len(ls_err) = 0 then
			lds_stream.create( ls_sql_syntax, ls_err)
			lds_stream.f_settransobject( it_transaction)
			li_rowcount = lds_stream.retrieve( )
			if li_rowcount < 0 then
				destroy lds_stream
				return -1
			elseif li_rowcount = 0 then
				continue 
			end if
			ldb_item_id = lds_stream.getitemnumber(li_rowcount , las_col_item_sv[1])
			lb_obj_ins.f_get_item_managed_qty_value( ldb_item_id, ls_manage_qty_yn, ls_manage_value_yn)
			this.f_get_lot_or_serial_yn_sob( ldb_item_id, ls_lot_yn,ls_serial_yn)
			laa_data[1] = ldb_item_id
			laa_data[2] = lds_stream.getitemnumber(li_rowcount , 'COMPANY_ID')
			laa_data[3] = lds_stream.getitemnumber(li_rowcount , las_col_item_sv[2])
			laa_data[4] = lds_stream.getitemnumber(li_rowcount , las_col_item_sv[5])
			laa_data[5] = lds_stream.getitemdatetime( li_rowcount, 'TRANS_DATE')
			laa_data[9] = vs_sob

			ldb_f_object_id = lds_stream.getitemnumber( li_rowcount, las_col_f_object_sv[1])
//			ls_f_object_type = this.f_get_object_type_sob(ldb_f_object_id )		
			ldb_t_object_id = lds_stream.getitemnumber( li_rowcount, las_col_t_object_sv[1])
//			ls_t_object_type = this.f_get_object_type_sob(ldb_t_object_id )	
			//--trường hợp không quản lý số serial/lot--//
			if ( (ls_value_yn = 'Y' and ls_manage_value_yn='Y') or (ls_qty_yn ='Y' and ls_manage_qty_yn = 'Y') ) AND (ls_serial_yn = 'N' and ls_lot_yn = 'N' ) then
				laa_data[7] = '@'
				laa_data[8] = '@'
				if upperbound(las_col_item_value_sv) > 0 then 
					ldb_qty_sku = lds_stream.getitemnumber(li_rowcount , las_col_item_value_sv[5])
				else
					ldb_qty_sku = lds_stream.getitemnumber(li_rowcount , las_col_item_sv[3])
				end if
				if isnull(ldb_qty_sku) then ldb_qty_sku = 0
				if upperbound(las_col_item_value_sv) > 0 then ldb_value = lds_stream.getitemnumber(li_rowcount , las_col_item_value_sv[3])
				if isnull(ldb_value) then ldb_value = 0
				
				//-- Cập nhật đối tượng FROM --//
				if upper(ls_f_object_type) = 'WAREHOUSE' then
					/* mở ra để kiểm tra âm khi ghi sổ
					ls_balance_control = 'negative_not_allow'*/
					ls_balance_control = 'negative_allow'
				else
					ls_balance_control = 'negative_allow'
				end if		
				laa_data[6] = ldb_f_object_id	
				//-- ghi sổ SL--//						
				if (ls_value_yn = 'N' or ls_manage_value_yn='N') AND (ls_qty_yn ='Y' and ls_manage_qty_yn = 'Y') then 
					laa_data[10] = 'N'
					laa_data[11] = gdb_branch							
					if vod_handling.f_update_item_balance(it_transaction, laa_data, vd_trans_date, ldb_qty_sku,ldb_value,'OUT',ls_balance_control, 'N' , 'N',ls_t_object_type) = -1 then
						destroy lds_stream
						return -1
					end if
//					commit using it_transaction; ///////////////////////--thêm vào khi debug -///
				end if
				//-- ghi sổ GT--//
				if (ls_value_yn = 'Y' and ls_manage_value_yn='Y') AND (ls_qty_yn ='Y' and ls_manage_qty_yn = 'Y') then 
					laa_data[10] = 'Y'
					laa_data[11] = gdb_branch							
					if vod_handling.f_update_item_balance(it_transaction, laa_data, vd_trans_date, ldb_qty_sku,ldb_value,'OUT',ls_balance_control, 'N' , 'Y', ls_t_object_type) = -1 then
						destroy lds_stream
						return -1
					end if
//					commit using it_transaction; ///////////////////////--thêm vào khi debug -///
				end if
				
				//-- Cập nhật đối tượng TO --//
				ls_balance_control = 'negative_allow'
				laa_data[6] = ldb_t_object_id
				//-- ghi sổ SL--//						
				if (ls_value_yn = 'N' or ls_manage_value_yn='N') AND (ls_qty_yn ='Y' and ls_manage_qty_yn = 'Y') then 
					laa_data[10] = 'N'
					laa_data[11] = gdb_branch										
					if vod_handling.f_update_item_balance(it_transaction, laa_data, vd_trans_date, ldb_qty_sku,ldb_value,'IN',ls_balance_control, 'N' , 'N',ls_t_object_type) = -1 then
						destroy lds_stream
						return -1
					end if
					
//					commit using it_transaction; ///////////////////////--thêm vào khi debug -///
				end if
				//-- ghi sổ GT--//
				if (ls_value_yn = 'Y' and ls_manage_value_yn='Y') AND (ls_qty_yn ='Y' and ls_manage_qty_yn = 'Y') then 
					laa_data[10] = 'Y'
					laa_data[11] = gdb_branch		
					if vod_handling.f_update_item_balance(it_transaction, laa_data, vd_trans_date, ldb_qty_sku,ldb_value,'IN',ls_balance_control, 'N' , 'Y',ls_t_object_type) = -1 then
						destroy lds_stream
						return -1
					end if					
//					commit using it_transaction; ///////////////////////--thêm vào khi debug -///
				end if
			end if
			//--trường hợp có quản lý số serial/lot--//
			if( (ls_value_yn = 'Y' and ls_manage_value_yn='Y') or (ls_qty_yn ='Y' and ls_manage_qty_yn = 'Y') ) AND (ls_serial_yn = 'Y' or ls_lot_yn = 'Y' )then 
				for li_idx2 = 1 to li_rowcount
					laa_data[7] = lds_stream.getitemstring( li_idx2, las_col_item_lot_sv[2])
					laa_data[8] = lds_stream.getitemstring( li_idx2, las_col_item_lot_sv[3])
					if upperbound(las_col_item_value_sv) > 0 then ldb_qty_sku = lds_stream.getitemnumber(li_idx2 , las_col_item_value_sv[5])
					if isnull(ldb_qty_sku) then ldb_qty_sku = 0
					if upperbound(las_col_item_value_sv) > 0 then ldb_value = lds_stream.getitemnumber(li_idx2 , las_col_item_value_sv[3])
					if isnull(ldb_value) then ldb_value = 0
					//-- Cập nhật đối tượng FROM --//
					if upper(ls_f_object_type) = 'WAREHOUSE' then
						/* mở ra để kiểm tra âm khi ghi sổ
						ls_balance_control = 'negative_not_allow'*/
						ls_balance_control = 'negative_allow'
					else
						ls_balance_control = 'negative_allow'
					end if						
					laa_data[6] = ldb_f_object_id	
					//-- ghi sổ SL--//						
					if (ls_value_yn = 'N' or ls_manage_value_yn='N') AND (ls_qty_yn ='Y' and ls_manage_qty_yn = 'Y') then 
						laa_data[10] = 'N'
						laa_data[11] = gdb_branch								
						if vod_handling.f_update_item_balance(it_transaction, laa_data, vd_trans_date, ldb_qty_sku,ldb_value,'OUT',ls_balance_control, 'N' , 'N',ls_t_object_type) = -1 then
							destroy lds_stream
							return -1
						end if
					end if
					//-- ghi sổ GT--//
					if (ls_value_yn = 'Y' and ls_manage_value_yn='Y') AND (ls_qty_yn ='Y' and ls_manage_qty_yn = 'Y') then 
						laa_data[10] = 'Y'
						laa_data[11] = gdb_branch			
						if vod_handling.f_update_item_balance(it_transaction, laa_data, vd_trans_date, ldb_qty_sku,ldb_value,'OUT',ls_balance_control, 'N' , 'Y',ls_t_object_type) = -1 then
							destroy lds_stream
							return -1
						end if					
					end if
					
					//-- Cập nhật đối tượng TO --//
					ls_balance_control = 'negative_allow'					
					laa_data[6] = ldb_t_object_id
					//-- ghi sổ SL--//						
					if (ls_value_yn = 'N' or ls_manage_value_yn='N') AND (ls_qty_yn ='Y' and ls_manage_qty_yn = 'Y') then 
						laa_data[10] = 'N'
						laa_data[11] = gdb_branch							
						if vod_handling.f_update_item_balance(it_transaction, laa_data, vd_trans_date, ldb_qty_sku,ldb_value,'IN',ls_balance_control, 'N' , 'N',ls_t_object_type) = -1 then
							destroy lds_stream
							return -1
						end if
					end if
					//-- ghi sổ GT--//
					if (ls_value_yn = 'Y' and ls_manage_value_yn='Y') AND (ls_qty_yn ='Y' and ls_manage_qty_yn = 'Y') then 
						laa_data[10] = 'Y'
						laa_data[11] = gdb_branch			
						if vod_handling.f_update_item_balance(it_transaction, laa_data, vd_trans_date, ldb_qty_sku,ldb_value,'IN',ls_balance_control, 'N' , 'Y',ls_t_object_type) = -1 then
							destroy lds_stream
							return -1
						end if						
					end if
				next
			end if
		end if
	next
next
destroy lds_stream
return 1
end function

public function integer f_send_mail_multi (any vaa_retieve_arg[], string vs_subject, string vs_header, string vs_body, string vs_footer, string vs_server_name, string vs_logid, string vs_logpass, b_callback vb_callback);c_dwservice		lc_dwser
c_string			lc_string
t_ds_db			lds_maillist_line
string				ls_to_email, ls_cc_mail, ls_pacth_att, ls_temp_hd, ls_temp_ft, ls_contact_name
long				ll_idx,ll_count,ll_retrieve

it_transaction.DBMS = 'O10 Oracle10g (10.1.0)'
it_transaction.ServerName = vs_server_name
it_transaction.LogId = vs_logid
it_transaction.LogPass = vs_logpass
it_transaction.AutoCommit = False
it_transaction.DBParm = "CommitOnDisconnect='No',PBCatalogOwner='"+ vs_logid +"'"
connect using it_transaction;
//messagebox('','connect :'+string(it_transaction.sqlcode))
if it_transaction.sqlcode <> 0 then return -1

lds_maillist_line = create t_ds_db
lds_maillist_line.dataobject = 'ds_maillist_line_grid'
//lds_maillist_line.f_add_where(vs_column , vaa_data[])
lds_maillist_line.f_settransobject( it_transaction)
ll_retrieve = lds_maillist_line.retrieve(vaa_retieve_arg[1])
//messagebox('','retrieve :'+string(ll_retrieve))
if ll_retrieve <= 0 then return -1
for ll_idx = 1 to ll_retrieve
	ls_to_email = lds_maillist_line.getitemstring( ll_idx , 'email')
	if isnull(ls_to_email) or ls_to_email = '' then continue
	ls_contact_name = lds_maillist_line.getitemstring( ll_idx , 'contact_name')
	if isnull(ls_contact_name) then ls_contact_name = ''
	ls_temp_hd = lc_string.f_globalreplace( vs_header, '[]', ls_contact_name)
	ls_temp_ft = lc_string.f_globalreplace( vs_footer, '[]', ls_contact_name)
//	messagebox('','trước khi send ('+ls_temp_hd+'   '+ls_temp_ft+')')
	lc_dwser.f_send_mail( ls_to_email, ls_cc_mail, vs_subject, ls_pacth_att, ls_temp_hd, vs_body, ls_temp_ft, 2, false)
//	messagebox('','sau khi send ')
	ll_count ++
next
vb_callback.f_finished_send_mail(ll_count)
destroy lds_maillist_line
return 0
end function

public function integer f_connect (string vs_server_name, string vs_logid, string vs_logpass);it_transaction.DBMS = 'O10 Oracle10g (10.1.0)'
it_transaction.ServerName = vs_server_name
it_transaction.LogId = vs_logid
it_transaction.LogPass = vs_logpass
it_transaction.AutoCommit = False
it_transaction.DBParm = "CommitOnDisconnect='No',PBCatalogOwner='"+ vs_logid +"'"
it_transaction.database = 'multithread'
////-- khoá khi debug --//
//SQLCA.DBMS = 'O10 Oracle10g (10.1.0)'
//SQLCA.ServerName = vs_server_name
//SQLCA.LogId = vs_logid
//SQLCA.LogPass = vs_logpass
//SQLCA.AutoCommit = False
//SQLCA.DBParm = "CommitOnDisconnect='No',PBCatalogOwner='"+ vs_logid +"'"
//SQLCA.database = 'multithread'  //-- khoá khi debug --//
 
connect using it_transaction;
if it_transaction.sqlcode <> 0 then 
	messagebox('err', it_transaction.sqlerrtext)
	return -1
end if
////-- khoá khi debug --//
//connect using SQLCA;
//if SQLCA.sqlcode <> 0 then return -1  //-- khoá khi debug --//
//
return 0
end function

public function integer f_copy_table (double vdb_origin_doc_id, double vadb_new_object_ref_id[], double vadb_origin_object_ref_id[], string vs_table, string vs_col_ref, ref double radb_new_id[], ref double radb_origin_id[], string vs_table_sob);/*******************************************************************************
Chức năng: nhân bản dữ liệu của bảng vs_table, phụ thuộc origin_doc_id 
Tham số 
				vdb_origin_doc_id 				: id của bảng document gốc
				vadb_new_object_ref_id[] 	: mảng object_ref_id để cập nhật master-detail cho bảng vs_table
				vadb_origin_object_ref_id[] : mảng object_ref_id gốc của bảng vs_table
				vs_table 							: Bảng cần nhân bản dữ liệu
				vs_col_ref						: cột ref_id chỉ quan hệ master-detail
				radb_new_id[]					: trả ra mảng ID mới sau khi nhân bản của vs_table
				radb_origin_id[]				: trả ra mảng ID gốc của vs_table
return 0	Không làm gì cả
		 1	nhân bản thành công
		-1	Lỗi
********************************************************************************/
int			li_rtn,li_count
long		ll_rowcount,ll_idx,ll_idx1
string		ls_sql,ls_sql_syntax,ls_err,ls_sql_drop,ls_sql_update,ls_sql_insert //,ls_table_tmp
double	ldb_new_id,ldb_origin_id,ldb_origin_object_ref_id,ldb_new_object_ref_id,ladb_empty[]
c_string	lc_str
t_ds_db	lds_origin_table

lds_origin_table = create t_ds_db
lc_str.f_arraytostring( vadb_origin_object_ref_id, ',', ls_sql)
ls_sql = '('+ls_sql+')'
choose case upper(vs_table)
	case 'BOOKED_SLIP'
		ls_sql = 'select bks.ID,bks.'+vs_col_ref+' from booked_slip bks join document doc on bks.id = doc.version_id where doc.id = ' + string(vdb_origin_doc_id)
	case 'INVENTORY_LINE'
		ls_sql = 'select ivl.id,ivl.'+vs_col_ref+' from inventory_line ivl join v_inventory_line ivl1 on ivl.id= ivl1.id where ivl1.doc_id = ' + string(vdb_origin_doc_id)
	case 'SAL_INVOICE_LINE'
		ls_sql = 'select sal.id,sal.'+vs_col_ref+' from SAL_INVOICE_LINE sal join V_SAL_INVOICE_LINE sal1 on sal.id= sal1.id where sal1.doc_id = ' + string(vdb_origin_doc_id)
	case 'PUR_INVOICE_LINE'
		ls_sql = 'select pur.id,pur.'+vs_col_ref+' from PUR_INVOICE_LINE pur join V_PUR_INVOICE_LINE pur1 on pur.id= pur1.id where pur1.doc_id = ' + string(vdb_origin_doc_id)
	case 'PAYMENT_LINE'
		ls_sql = 'select pay.id,pay.'+vs_col_ref+' from PAYMENT_LINE pay join V_PAYMENT_LINE pay1 on pay.id= pay1.id where pay1.doc_id = ' + string(vdb_origin_doc_id)
	case 'OBJECT_TRANS'
		ls_sql = 'select obt.id,obt.'+vs_col_ref+' from OBJECT_TRANS obt join document doc on obt.DOC_REF_ID= doc.id where doc.id = ' + string(vdb_origin_doc_id)
	case 'LEDGER_TRANS'
		ls_sql = 'select led.id,led.'+vs_col_ref+' from LEDGER_TRANS led join document doc on led.DOC_REF_ID= doc.id where doc.id = ' + string(vdb_origin_doc_id)
	case 'STREAM_VALUE'
		ls_sql = 'select str.id as STREAM_VALUE_ID,str.'+vs_col_ref+' as STREAM_VALUE_'+vs_col_ref+'  from STREAM_VALUE str where str.ITEM_REF_ID in ' + ls_sql
	case 'POST_LINE'
		ls_sql = 'select post.id as POST_LINE_ID,post.'+vs_col_ref+' as POST_LINE_'+vs_col_ref+' from POST_LINE post where post.OBJECT_REF_ID in ' + ls_sql
	case 'TAX_LINE'
		ls_sql = 'select tax.id as TAX_LINE_id ,tax.'+vs_col_ref+' as TAX_LINE_'+vs_col_ref+' from TAX_LINE tax where tax.object_ref_id in ' + ls_sql
	case 'CHARGE_LINE'
		ls_sql = 'select chr.id as CHARGE_LINE_id ,chr.'+vs_col_ref+' as CHARGE_LINE_'+vs_col_ref+' from CHARGE_LINE chr where chr.object_ref_id in ' + ls_sql
	case 'DOCUMENT'
		ls_sql = 'select doc.id as DOCUMENT_id '+' from DOCUMENT doc where doc.id = '+string(vdb_origin_doc_id)
	case 'LEDGER_LINE'
//		ls_sql = 'select pay.id,pay.'+vs_col_ref+' from LEDGER_LINE pay join V_PAYMENT_LINE pay1 on pay.id= pay1.id where pay1.doc_id = ' + string(vdb_origin_doc_id)
		ls_sql = 'select led.id,led.'+vs_col_ref+' from LEDGER_LINE led join booked_slip bks on bks.id = led.object_ref_id join document doc on doc.version_id = bks.id where doc.id = ' + string(vdb_origin_doc_id)
	case else
		this.f_drop_table_sob()
		return -1
end choose
ls_sql_syntax = it_transaction.syntaxfromsql(ls_sql, "", ls_err)
if len(ls_err) = 0 then
	lds_origin_table.create( ls_sql_syntax, ls_err)
	lds_origin_table.f_settransobject( it_transaction)
	ll_rowcount = lds_origin_table.retrieve( )
	if ll_rowcount = -1 then 
		this.f_drop_table_sob()
		return -1
	end if
	lds_origin_table.setsort( vs_col_ref +' a')
	lds_origin_table.sort( )
else
	this.f_drop_table_sob()
	destroy lds_origin_table
	return -1
end if
if ll_rowcount = 0 then
else
	radb_new_id = ladb_empty
	radb_origin_id = ladb_empty
	for ll_idx = 1 to ll_rowcount
		if vs_col_ref <> '' then ldb_origin_object_ref_id = lds_origin_table.getitemnumber( ll_idx, vs_table +'_'+vs_col_ref)
		if isnull(ldb_origin_object_ref_id) then 
			this.f_drop_table_sob()
			return -1
		end if
		for ll_idx1 = 1 to upperbound(vadb_origin_object_ref_id)
			if vadb_origin_object_ref_id[ll_idx1] = ldb_origin_object_ref_id then
				ldb_new_object_ref_id = vadb_new_object_ref_id[ll_idx1]
				exit
			else
				ldb_new_object_ref_id = 0
			end if
		next
		if ldb_new_object_ref_id = 0 and vs_table <> 'DOCUMENT'  then continue
		ldb_new_id = this.f_create_id( )
		if ldb_new_id = 0 then 
			this.f_drop_table_sob()
			return -1
		end if
		radb_new_id[ll_idx] = ldb_new_id
		ldb_origin_id = lds_origin_table.getitemnumber( ll_idx,vs_table + '_id')
		if isnull(ldb_origin_id) or ldb_origin_id = 0 then 
			this.f_drop_table_sob()
			return -1
		end if
		radb_origin_id[ll_idx] = ldb_origin_id
		//--insert bảng tạm--//
		ls_sql_insert = 'insert into ttd.' + vs_table_sob + ' select ' + vs_table +'.* from ' + vs_table + ' where '+ vs_table +'.id = ' + string(ldb_origin_id)
		execute immediate :ls_sql_insert using it_transaction;
		if it_transaction.sqlcode <> 0 then 
			this.f_drop_table_sob()
			return -1
		end if
		//--update bảng tạm --//
		ls_sql_update = 'update ttd.' + vs_table_sob
		if upper(vs_table) = 'DOCUMENT' then
			ls_sql_update +=' set id = ' + string(ldb_new_id) + ','
			ls_sql_update +=' CREATED_BY = ' +string(gi_userid)+ ', LAST_MDF_BY = ' +string(gi_userid)+ ', CREATED_DATE = sysdate, LAST_MDF_DATE = sysdate'
			ls_sql_update +=' where id = ' + string(vdb_origin_doc_id)
		else
			ls_sql_update +=' set id = ' + string(ldb_new_id) + ' , ' +vs_col_ref+ ' = ' + string(ldb_new_object_ref_id) +','
			ls_sql_update +=' CREATED_BY = ' +string(idb_userid)+ ', LAST_MDF_BY = ' +string(idb_userid)+ ', CREATED_DATE = sysdate, LAST_MDF_DATE = sysdate'
			ls_sql_update +=' where id = ' + string(ldb_origin_id)
		end if
		execute immediate :ls_sql_update using it_transaction;
		if it_transaction.sqlcode <> 0 then 
			this.f_drop_table_sob()
			return -1
		end if
	next
	//--insert bảng gốc--//	
	ls_sql_insert = 'insert into ' + vs_table + ' select ' + vs_table_sob +'.* from ' + vs_table_sob
	execute immediate :ls_sql_insert using it_transaction;
	if it_transaction.sqlcode <> 0 then 
		this.f_drop_table_sob()
		return -1
	end if
end if
destroy lds_origin_table
return li_rtn
end function

public function integer f_create_table_sob (string vs_table_name);c_string		lc_string

string			las_table_name[],ls_table_tmp,ls_sql_create,ls_table_number
int				li_idx,li_count,li_array

li_array = lc_string.f_stringtoarray( vs_table_name, ';', las_table_name[])
for li_idx = 1 to li_array
	//--kiểm tra bảng đã đc tạo chưa--//
	ls_table_tmp = upper(las_table_name[li_idx] + '_SOB')
	select count(table_name) into :li_count from all_tables where upper(table_name) = :ls_table_tmp using SQLCA ; //--Khóa khi debug --//
//	select count(table_name) into :li_count from all_tables where upper(table_name) = :ls_table_tmp using it_transaction ; //--mở khi debug --//
	//--nếu đã được tạo thì lấy tên bản khác để tạo và ghi sổ--//
	Do While li_count > 0
		ls_table_number = string(rand(1000))
		ls_table_tmp = upper(las_table_name[li_idx] +'_'+ ls_table_number + '_SOB')
		select count(table_name) into :li_count from all_tables where upper(table_name) = :ls_table_tmp using SQLCA ;  //--Khóa khi debug --//
//		select count(table_name) into :li_count from all_tables where upper(table_name) = :ls_table_tmp using it_transaction ;//--mở khi debug --//
	Loop
	//-- Tạo bảng tạm
	ls_sql_create = 'CREATE TABLE TTD.' + ls_table_tmp + ' AS SELECT ' + las_table_name[li_idx] + '.* FROM ' + las_table_name[li_idx] + ' WHERE 1=0'
	execute immediate :ls_sql_create using SQLCA;  			//--Khóa khi debug --//
//	execute immediate :ls_sql_create using it_transaction; 	//--mở khi debug --//
	if SQLCA.sqlcode <> 0 then return -1							//--Khóa khi debug --//
//	if it_transaction.sqlcode <> 0 then return -1				//--mở khi debug --//
	ias_table_created[li_idx] = ls_table_tmp
next
return 1
end function

public function integer f_drop_table_sob ();int 			li_idx,li_count
string			ls_sql_drop,las_tmp[]
c_string		lc_string

//-- rollback toàn bộ session --//
//rollback using it_transaction;
li_count = upperbound(ias_table_created)
for li_idx = 1 to li_count
	//--Xóa bảng tạm--//
	ls_sql_drop = 'DROP TABLE TTD.' + ias_table_created[li_idx] + ' CASCADE CONSTRAINTS'
	execute immediate :ls_sql_drop using SQLCA;  		//--Khóa khi debug --//
//	execute immediate :ls_sql_drop using it_transaction; //-- mở khi debug --//
	if SQLCA.sqlcode <> 0 then continue						//--Khóa khi debug --//
//	if it_transaction.sqlcode <> 0 then continue				 //-- mở khi debug --//
	
next
ias_table_created = las_tmp
return 1
end function

public function integer f_update_value (double vdb_origin_doc_id, string vs_sob, date vd_trans_date, t_ds_db vds_obj_post, b_doc vod_obj_handling);

//-- update object_balance đối tượng Nợ--//
	vds_obj_post.dataobject = 'ds_obj_balance_post_dr'
	if vod_obj_handling.f_insert_object_balance( vdb_origin_doc_id,  vd_trans_date, it_transaction, vds_obj_post, 'post',vs_sob) <> 1 then
		this.f_drop_table_sob( )
		destroy vds_obj_post
		destroy vod_obj_handling
		rollback using it_transaction;
		return -1
	end if
	//-- update ledger_balance đối tượng Nợ--//
	vds_obj_post.dataobject = 'ds_ledger_balance_post_dr'
	if vod_obj_handling.f_insert_object_balance( vdb_origin_doc_id,  vd_trans_date, it_transaction, vds_obj_post, 'post',vs_sob) <> 1 then
		this.f_drop_table_sob( )
		destroy vds_obj_post
		destroy vod_obj_handling
		rollback using it_transaction;
		return -1
	end if
	//-- update object_balance đối tượng Có--//
	vds_obj_post.dataobject = 'ds_obj_balance_post_cr'
	if vod_obj_handling.f_insert_object_balance( vdb_origin_doc_id,  vd_trans_date, it_transaction, vds_obj_post, 'post',vs_sob) <> 1 then
		this.f_drop_table_sob( )
		destroy vds_obj_post
		destroy vod_obj_handling
		rollback using it_transaction;
		return -1
	end if
	//-- update ledger_balance đối tượng Có--//
	vds_obj_post.dataobject = 'ds_ledger_balance_post_cr'
	if vod_obj_handling.f_insert_object_balance( vdb_origin_doc_id,  vd_trans_date, it_transaction, vds_obj_post, 'post',vs_sob) <> 1 then
		this.f_drop_table_sob( )
		destroy vds_obj_post
		destroy vod_obj_handling
		rollback using it_transaction;
		return -1
	end if
	
return 0
end function

public function integer f_update_active_yn (t_ds_db vds_import, string vs_price_type);/**************************************
update cột active_yn cho bảng item_price.
dòng nào mới insert vào là Y, dòng cũ là N
**************************************/
int			li_idx
any		laa_data[]
string		ls_item_code,ls_mana_code
double	ldb_item_id,ldb_id
boolean	lb_rollback

b_obj_instantiate	lb_obj 
//
//for li_idx = 1 to vds_import.rowcount() 
//	ldb_id = vds_import.getitemnumber(li_idx,'ID')
//	ls_item_code = vds_import.getitemstring(li_idx,'item_code')
//	ls_mana_code = vds_import.getitemstring(li_idx,'VENDOR_GROUP')
//	lb_obj.f_get_item_info( 0, ls_item_code, laa_data)
//	ldb_item_id = double(laa_data[1])
//	update item_price
//	set item_price.active_yn = 'N'
//	where item_price.id in (  select itp.id
//								from item_price itp
//								where itp.price_type = :vs_price_type and itp.item_id = :ldb_item_id and itp.active_yn = 'Y'
//												and not exists (select itp1.id
//																	 from item_price itp1 
//																	 where itp1.price_type = :vs_price_type and itp1.item_id = :ldb_item_id 
//																				  and itp1.id = :ldb_id and itp1.id = itp.id and itp1.active_yn = 'Y')) using it_transaction;
//	if not this.f_check_sqlcode( ) then exit
//	update item_price
//	set item_price.active_yn = 'Y'
//	where item_price.id = :ldb_id using it_transaction;
//	if not this.f_check_sqlcode( ) then exit
//	this.f_update_manager_group( ldb_item_id, ls_mana_code, 'u_discount_vendor_price_gr')
//	if not this.f_check_sqlcode( ) then exit
//next
//if not this.f_check_sqlcode( ) then
//	rollback using it_transaction;
//else
//	commit using it_transaction; 
//end if
return 0
end function

public subroutine f_update_manager_group (double vdb_item_id, string vs_mana_code, string vs_menu_code);/***********************************************
update lại cột manager_group cho bảng object của ITEM
hiện đang dùng cho Hiệp Phát để upd lại nhóm chiết khấu
***********************************************/
double	ldb_mana_id

select vv.id into :ldb_mana_id
from valueset_value vv join FLEXIBLE_DATA FF on FF.ID = vv.object_ref_id
where vv.code = :vs_mana_code and FF.CODE = :vs_menu_code using it_transaction;

update object
set manage_group = :ldb_mana_id
where id = :vdb_item_id using it_transaction;
end subroutine

public subroutine f_multitheared_popup (b_callback vc_callback, string vs_server_name, string vs_logid, string vs_logpass, long vl_interval_minute, string vs_dwo, long vl_userid);////tao transaction rieng cho popup và khởi tạo timer

it_transaction = create t_transaction
it_transaction.DBMS = 'O10 Oracle10g (10.1.0)'
it_transaction.ServerName =vs_server_name
it_transaction.LogId =vs_logid
it_transaction.LogPass = vs_logpass
it_transaction.AutoCommit = False
it_transaction.DBParm = "CommitOnDisconnect='No',PBCatalogOwner='"+ vs_logid +"'"
connect using it_transaction;
ic_timing = create c_timing
ic_timing.is_dwo = vs_dwo
ic_timing.il_user_id = vl_userid
ic_timing.ib_callback = vc_callback
ic_timing.il_interval_minute = vl_interval_minute
ic_timing.it_transaction = it_transaction 
ic_timing.start(60) //pm mo 1p thì hiện alert
end subroutine

public function integer f_log_post (double vdb_doc_id, string vs_err);string		ls_path, ls_file
int			li_ret
ls_path = GetCurrentDirectory( )

ls_file ='post_log_'+string(today(),'yymmdd')+'.txt'

li_ret = FileOpen(ls_file, LineMode!, Write!, LockWrite!, Append!, EncodingUTF8!)
FileWrite(li_ret, "document/item ID: " + string(vdb_doc_id)  + "  - Time: "+ String(Now(), "hh:mm") )
FileWrite(li_ret, "Error: " + vs_err )
FileClose(li_ret)

return 1
end function

public function boolean f_is_period_closed (string vs_stop_type, date vd_trans_date, string vs_period_type, t_transaction rt_transaction);int					li_cnt
string				ls_role_user_id,  ls_currentSQL, ls_currentWhere, ls_join, ls_where,   ls_modifySQL, ls_modifyWhere, ls_rtn
any				laa_value[]
c_string_ex			lc_string
c_sql_ex				lc_sql
t_ds_db			lds_period_control
 
lc_string = create c_string_ex
lc_sql = create c_sql_ex

select count(id) into :li_cnt from fiscal_period where :vd_trans_date between from_date and to_date using rt_transaction;

if li_cnt = 0 then
	return true 
end if

select count(ID) into :li_cnt
from fiscal_period
where period_type = upper(:vs_period_type)
	and nvl(closed_yn,'N') = 'Y'
    and  :vd_trans_date between from_date and to_date using rt_transaction;

if li_cnt = 1 then return true

select count(fpc.ID) into :li_cnt
from fiscal_period_control fpc join fiscal_period on fiscal_period.id = fpc.object_ref_id and fiscal_period.period_type = upper(:vs_period_type)
where fpc.stop_type = 'ALL'
    and  :vd_trans_date between fpc.from_date and fpc.to_date 
	and nvl(fpc.STOP_YN,'N') = 'Y'
	and fpc.ROLE_USER_ID is null using rt_transaction;
	
if li_cnt = 1 then return true

select count(fpc.ID) into :li_cnt
from fiscal_period_control fpc join fiscal_period on fiscal_period.id = fpc.object_ref_id and fiscal_period.period_type = upper(:vs_period_type)
where stop_type = upper(:vs_stop_type)
    and  :vd_trans_date between fpc.from_date and fpc.to_date 
	and nvl(fpc.STOP_YN,'N') = 'Y'
	and fpc.ROLE_USER_ID is null using rt_transaction;
	
if li_cnt = 1 then return true

lc_string.f_arraytostring( g_user.idb_role_id[], ',' ,ls_role_user_id)
//Trường hợp user không có nhóm
if ls_role_user_id = '' or isnull(ls_role_user_id) then
	ls_role_user_id = '='+string(gi_userid) 
else
	ls_role_user_id = 'in ('+ls_role_user_id+',' +string(gi_userid) +')'
end if
lds_period_control = create t_ds_db
lds_period_control.dataobject = 'd_fiscal_period_control_grid'
lds_period_control.f_settransobject( rt_transaction)

lds_period_control.f_getcurrentSQL( ls_currentSQL, ls_currentWhere)
ls_join = " join fiscal_period on fiscal_period.id = fiscal_period_control.object_ref_id and fiscal_period.period_type = ~~'" + upper(vs_period_type)+ "~~'"
ls_where += " to_char(fiscal_period_control.from_date, 'yyyymmdd') <= ~~'"+string(vd_trans_date,'yyyymmdd') +"~~' AND "	
ls_where += " to_char(fiscal_period_control.to_date, 'yyyymmdd')  >= ~~'"+string(vd_trans_date,'yyyymmdd') +"~~' AND "	
ls_where += " fiscal_period_control.ROLE_USER_ID "+ls_role_user_id + " AND "
ls_where += " fiscal_period_control.STOP_YN = ~~'Y~~' "

ls_modifySQL = ls_currentSQL + ls_join
ls_modifyWhere = ls_currentWhere + ls_where + " AND fiscal_period_control.stop_type = ~~'ALL~~' " 

lc_sql.f_addtowhereclause( ls_modifySQL, ls_modifyWhere, ' AND ')
ls_rtn =lds_period_control.modify('Datawindow.Table.Select= "' + ls_modifySQL +'"' )
if lds_period_control.retrieve( ) > 0 then return true

ls_modifySQL = ls_currentSQL + ls_join
ls_modifyWhere = ls_currentWhere + ls_where + " AND fiscal_period_control.stop_type = ~~'" +upper(vs_stop_type) +"~~'"

lc_sql.f_addtowhereclause( ls_modifySQL, ls_modifyWhere, ' AND ')
ls_rtn =lds_period_control.modify('Datawindow.Table.Select= "' + ls_modifySQL +'"' )
if lds_period_control.retrieve( ) > 0 then return true

destroy lds_period_control
return false
end function

public function string f_get_doc_status (double vdb_doc_id, t_transaction rt_transaction);string	ls_status


select status 
into :ls_status
from document
where id = :vdb_doc_id using rt_transaction;

if rt_transaction.sqlcode <> 0 then
	return ''
end if
return ls_status


end function

public function integer f_get_qty_and_value_yn (double vdb_trans_hdr_id, ref string rs_qty, ref string rs_value, t_transaction rt_transaction);/************************************************************************
Chức năng: Trả về ghi sổ số lượng và ghi sổ giá trị

=================================================================*/

select nvl(quantity_yn,'N') , nvl(value_yn,'N') into :rs_qty, :rs_value 
from TRANS_SETUP_HDR
where id = :vdb_trans_hdr_id and COMPANY_ID = :gi_user_comp_id using rt_transaction; 

if rt_transaction.sqlcode = 0 then
	return 1
else
	return -1
end if
end function

public function integer f_update_streamvalue_multi_ex (t_ds_db vdw_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row, t_ds_db vdw_f_object, string vas_f_object_col[], string vas_f_object_col_sv[], t_ds_db vdw_t_object, string vas_t_object_col[], string vas_t_object_col_sv[], ref s_str_ds_4_posting rstr_ds_4_posting, s_str_data vstr_data_from_to);int				li_idx,li_rtn, li_pos_s, li_pos_e, li_chr_nbr, li_idx_master
long			ll_t_object_row, ll_f_object_row
double		ldb_object_ref_id, ldb_qty, ldb_sv_qty, ldb_f_object, ldb_t_object, ldb_tmp_object


//-- update các giá trị của dw item/lot/value--//
for li_idx = 1 to upperbound(vas_data_col)
	if pos(upper(vs_pas_col), upper(vas_update_col[li_idx])+';' ) > 0  then continue
	
	if upper(vas_data_col[li_idx])= 'QTY' then 
		ldb_qty = vdw_data.f_getitemany( vl_data_row, vas_data_col[li_idx]+'_sku')
		if ldb_qty < 0 then
			ldb_sv_qty =-ldb_qty	
		else
			ldb_sv_qty =ldb_qty	
		end if
		li_rtn = rds_stream.setitem( vl_update_row,vas_update_col[li_idx], ldb_sv_qty  )
	else
		li_rtn = rds_stream.setitem( vl_update_row,vas_update_col[li_idx], vdw_data.f_getitemany( vl_data_row, vas_data_col[li_idx])  )
	end if
next

//if li_rtn = -1 then
//	gf_messagebox('m.b_doc.f_update_streamvalue_multi.011','Thông báo','Lỗi setitem vào datastore rd_streamvalue: f_update_streamvalue(24)','stop','ok',1)
//	return -1
//end if

//-- update f_object và t_object --//
if vdw_f_object.dataobject = vdw_data.dataobject then
	ll_f_object_row = vl_data_row
else		 
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(vdw_data.dataobject, len(vdw_data.dataobject) - 5) + '[')
	li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
	li_chr_nbr = li_pos_e - (li_pos_s + len(vdw_data.dataobject ) - 4)
	li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(vdw_data.dataobject ) -4 , li_chr_nbr ))
	
	if vdw_f_object.dataobject = rstr_ds_4_posting.ds_master[li_idx_master].dataobject then
		ldb_object_ref_id = vdw_data.getitemnumber(vl_data_row, 'object_ref_id')
		ll_f_object_row = vdw_f_object.find("ID ="+string(ldb_object_ref_id),1,vdw_f_object.rowcount())		
	end if	
	if ll_f_object_row = 0 then ll_f_object_row = vdw_f_object.getrow()
end if

if vdw_t_object.dataobject = vdw_data.dataobject then
	ll_t_object_row = vl_data_row
else			 
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(vdw_data.dataobject, len(vdw_data.dataobject) -5) + '[')
	li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
	li_chr_nbr = li_pos_e - (li_pos_s + len(vdw_data.dataobject ) - 4)
	li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(vdw_data.dataobject ) -4 , li_chr_nbr ))
	
	if vdw_t_object.dataobject = rstr_ds_4_posting.ds_master[li_idx_master].dataobject then
		ldb_object_ref_id = vdw_data.getitemnumber(vl_data_row, 'object_ref_id')
		ll_f_object_row = vdw_t_object.find("ID ="+string(ldb_object_ref_id),1,vdw_t_object.rowcount())		
	end if	
	if ll_t_object_row = 0 then ll_t_object_row = vdw_t_object.getrow()
end if

for li_idx = 1 to upperbound(vas_f_object_col[])
	if li_idx = 1 then
		ldb_f_object =  vdw_f_object.f_getitemany( ll_f_object_row, vas_f_object_col[li_idx] )
		ldb_t_object = vdw_t_object.f_getitemany( ll_t_object_row, vas_t_object_col[li_idx] )
		if  ldb_qty < 0 then //-- đảo object from/to --//
			ldb_tmp_object = ldb_f_object
			ldb_f_object = ldb_t_object
			ldb_t_object = ldb_tmp_object
		end if
		li_rtn = rds_stream.setitem( vl_update_row,vas_f_object_col_sv[li_idx], ldb_f_object)
		li_rtn = rds_stream.setitem( vl_update_row,vas_t_object_col_sv[li_idx], ldb_t_object)
	else
		li_rtn = rds_stream.setitem( vl_update_row,vas_f_object_col_sv[li_idx], vstr_data_from_to.aa_data_from[li_idx - 1] )
		li_rtn = rds_stream.setitem( vl_update_row,vas_t_object_col_sv[li_idx], vstr_data_from_to.aa_data_to[li_idx - 1])		
	end if		
next

//if li_rtn = -1 then
//	
//	gf_messagebox('m.b_doc.f_update_streamvalue_multi.021','Thông báo','Lỗi setitem vào datastore rd_streamvalue: f_update_streamvalue(68)','stop','ok',1)
//	return -1
//end if

return li_rtn
end function

public function integer f_update_streamvalue_multi_ex (t_ds_db vdw_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row, t_ds_db vdw_f_object, string vas_f_object_col[], string vas_f_object_col_sv[], t_ds_db vdw_t_object, string vas_t_object_col[], string vas_t_object_col_sv[], t_ds_db vdw_currency, string vas_cur_col[], string vas_cur_col_sv[], double vdb_trans_value, double vdb_base_value, ref s_str_ds_4_posting rstr_ds_4_posting, s_str_data vstr_data_from_to);int				li_idx,li_rtn, li_pos_s, li_pos_e, li_chr_nbr, li_idx_master
long			ll_t_object_row, ll_f_object_row, ll_currency_row
double		ldb_object_ref_id, ldb_qty, ldb_sv_qty, ldb_f_object, ldb_t_object, ldb_tmp_object

//-- update các giá trị của dw item/lot/value--//
for li_idx = 1 to upperbound(vas_data_col)
	if pos(upper(vs_pas_col), upper(vas_update_col[li_idx])+';' ) > 0  then continue
	
	if upper(vas_data_col[li_idx])= 'QTY' then 
		ldb_qty = vdw_data.f_getitemany( vl_data_row, vas_data_col[li_idx]+'_sku')
		if ldb_qty < 0 then
			ldb_sv_qty = -ldb_qty		
		else
			ldb_sv_qty = ldb_qty
		end if
		li_rtn = rds_stream.setitem( vl_update_row,vas_update_col[li_idx],  ldb_sv_qty )
	elseif lower(vas_update_col[li_idx]) = 'trans_value' then
		li_rtn = rds_stream.setitem( vl_update_row,vas_update_col[li_idx], vdb_trans_value  )
	elseif lower(vas_update_col[li_idx]) = 'base_value' then
		li_rtn = rds_stream.setitem( vl_update_row,vas_update_col[li_idx], vdb_base_value  )
	else
		li_rtn = rds_stream.setitem( vl_update_row,vas_update_col[li_idx], vdw_data.f_getitemany( vl_data_row, vas_data_col[li_idx])  )
	end if
next

if li_rtn = -1 then
	gf_messagebox('m.b_doc.f_update_streamvalue_multi.01','Thông báo','Lỗi setitem vào datastore rd_streamvalue: f_update_streamvalue(28)','stop','ok',1)
	return -1
end if

//-- update f_object và t_object --//
if vdw_f_object.dataobject = vdw_data.dataobject then
	ll_f_object_row = vl_data_row
else
	
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(vdw_data.dataobject, len(vdw_data.dataobject) - 5) + '[')
	li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
	li_chr_nbr = li_pos_e - (li_pos_s + len(vdw_data.dataobject) - 4)
	li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(vdw_data.dataobject ) - 4 , li_chr_nbr ))
	
	if vdw_f_object.dataobject = rstr_ds_4_posting.ds_master[li_idx_master].dataobject then
		ldb_object_ref_id = vdw_data.getitemnumber(vl_data_row, 'object_ref_id')
		ll_f_object_row = vdw_f_object.find("ID ="+string(ldb_object_ref_id),1,vdw_f_object.rowcount())		
	end if		

	if ll_f_object_row = 0 then ll_f_object_row = vdw_f_object.getrow()
end if

if vdw_t_object.dataobject = vdw_data.dataobject then
	ll_t_object_row = vl_data_row
else
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(vdw_data.dataobject, len(vdw_data.dataobject) - 5) + '[')
	li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
	li_chr_nbr = li_pos_e - (li_pos_s + len(vdw_data.dataobject) - 4)
	li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(vdw_data.dataobject ) - 4 , li_chr_nbr ))
	
	if vdw_t_object.dataobject = rstr_ds_4_posting.ds_master[li_idx_master].dataobject then
		ldb_object_ref_id = vdw_data.getitemnumber(vl_data_row, 'object_ref_id')
		ll_f_object_row = vdw_t_object.find("ID ="+string(ldb_object_ref_id),1,vdw_t_object.rowcount())		
	end if		
	
	if ll_t_object_row = 0 then ll_t_object_row = vdw_t_object.getrow()
end if
for li_idx = 1 to upperbound(vas_f_object_col[])
	if  li_idx = 1 then
		 ldb_f_object = vdw_f_object.f_getitemany( ll_f_object_row, vas_f_object_col[li_idx] )
		 ldb_t_object = vdw_t_object.f_getitemany( ll_t_object_row, vas_t_object_col[li_idx] )
		 if ldb_qty < 0 then //-- đảo đối tượng from/to --//
			ldb_tmp_object = ldb_f_object
			ldb_f_object = ldb_t_object
			ldb_t_object = ldb_tmp_object
		end if
		li_rtn = rds_stream.setitem( vl_update_row,vas_f_object_col_sv[li_idx], ldb_f_object)
		li_rtn = rds_stream.setitem( vl_update_row,vas_t_object_col_sv[li_idx], ldb_t_object)
	else
		li_rtn = rds_stream.setitem( vl_update_row,vas_f_object_col_sv[li_idx], vstr_data_from_to.aa_data_from[li_idx - 1] )
		li_rtn = rds_stream.setitem( vl_update_row,vas_t_object_col_sv[li_idx], vstr_data_from_to.aa_data_to[li_idx - 1])		
	end if	
next
if li_rtn = -1 then
	gf_messagebox('m.b_doc.f_update_streamvalue_multi.02','Thông báo','Lỗi setitem vào datastore rd_streamvalue: f_update_streamvalue(70)','stop','ok',1)
	return -1
end if

//-- update currency --//
if isvalid( vdw_currency ) then
	if vdw_currency.dataobject = vdw_data.dataobject then
		ll_currency_row = vl_data_row
	else
		li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(vdw_data.dataobject, len(vdw_data.dataobject) - 5) + '[')
		li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
		li_chr_nbr = li_pos_e -(li_pos_s + len(vdw_data.dataobject ) - 4)
		li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(vdw_data.dataobject ) - 4 , li_chr_nbr ))
		
		if vdw_currency.dataobject = rstr_ds_4_posting.ds_master[li_idx_master].dataobject then
			ldb_object_ref_id = vdw_data.getitemnumber(vl_data_row, 'object_ref_id')
			ll_f_object_row = vdw_currency.find("ID ="+string(ldb_object_ref_id),1,vdw_currency.rowcount())		
		end if			
	
		if ll_currency_row = 0 then ll_currency_row = vdw_currency.getrow()
	end if
	for li_idx = 1 to upperbound(vas_cur_col[])
		li_rtn = rds_stream.setitem( vl_update_row,vas_cur_col_sv[li_idx], vdw_currency.f_getitemany( ll_currency_row, vas_cur_col[li_idx] ))
	next
	if li_rtn = -1 then
		gf_messagebox('m.b_doc.f_update_streamvalue_multi.03','Thông báo','Lỗi setitem vào datastore rd_streamvalue: f_update_streamvalue(91)','stop','ok',1)
		return -1
	end if
end if
return li_rtn
end function

public function integer f_update_streamvalue_multi (t_ds_db vpo_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row);int				li_idx,li_rtn
long			ll_t_object_row, ll_f_object_row
double		ldb_object_ref_id, ldb_qty


//-- update các giá trị của dw item/lot/value--//
for li_idx = 1 to upperbound(vas_data_col)
	if pos(upper(vs_pas_col), upper(vas_update_col[li_idx])+';' ) > 0  then continue
	
	if upper(vas_data_col[li_idx])= 'QTY' then 
		ldb_qty = vpo_data.f_getitemany( vl_data_row, vas_data_col[li_idx]+'_sku') 
		if ldb_qty < 0 then ldb_qty = -ldb_qty
		li_rtn = rds_stream.setitem( vl_update_row,vas_update_col[li_idx], ldb_qty )
	else
		li_rtn = rds_stream.setitem( vl_update_row,vas_update_col[li_idx], vpo_data.f_getitemany( vl_data_row, vas_data_col[li_idx])  )
	end if
next

if li_rtn = -1 then
	gf_messagebox('m;b_doc.f_update_streamvalue_multi.01','Thông báo','Lỗi setitem vào datastore rd_streamvalue: f_update_streamvalue(l11)','stop','ok',1)
	return -1
end if

return li_rtn
end function

public function integer f_update_streamvalue_multi (t_ds_db vdw_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row, t_ds_db vdw_f_object, string vas_f_object_col[], string vas_f_object_col_sv[], t_ds_db vdw_t_object, string vas_t_object_col[], string vas_t_object_col_sv[], t_ds_db vdw_currency, string vas_cur_col[], string vas_cur_col_sv[], double vdb_trans_value, double vdb_base_value, ref s_str_ds_4_posting rstr_ds_4_posting);int				li_idx,li_rtn, li_pos_s, li_pos_e, li_chr_nbr, li_idx_master
long			ll_t_object_row, ll_f_object_row, ll_currency_row
double		ldb_object_ref_id, ldb_qty, ldb_sv_qty, ldb_f_object, ldb_t_object, ldb_tmp_object
t_dw_mpl	ldw_master

//-- update các giá trị của dw item/lot/value--//
for li_idx = 1 to upperbound(vas_data_col)
	if pos(upper(vs_pas_col), upper(vas_update_col[li_idx])+';' ) > 0  then continue
	
	if upper(vas_data_col[li_idx])= 'QTY' then 
		ldb_qty = vdw_data.f_getitemany( vl_data_row, vas_data_col[li_idx]+'_sku')
		if ldb_qty < 0 then
			ldb_sv_qty = -ldb_qty		
		else
			ldb_sv_qty = ldb_qty
		end if
		li_rtn = rds_stream.setitem( vl_update_row,vas_update_col[li_idx],  ldb_sv_qty )
	elseif lower(vas_update_col[li_idx]) = 'trans_value' then
		li_rtn = rds_stream.setitem( vl_update_row,vas_update_col[li_idx], vdb_trans_value  )
	elseif lower(vas_update_col[li_idx]) = 'base_value' then
		li_rtn = rds_stream.setitem( vl_update_row,vas_update_col[li_idx], vdb_base_value  )
	else
		li_rtn = rds_stream.setitem( vl_update_row,vas_update_col[li_idx], vdw_data.f_getitemany( vl_data_row, vas_data_col[li_idx])  )
	end if
next

if li_rtn = -1 then
	gf_messagebox('m.b_doc.f_update_streamvalue_multi.01','Thông báo','Lỗi setitem vào datastore rd_streamvalue: f_update_streamvalue(28)','stop','ok',1)
	return -1
end if

//-- update f_object và t_object --//
if vdw_f_object.dataobject = vdw_data.dataobject then
	ll_f_object_row = vl_data_row
else
	
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(vdw_data.dataobject, len(vdw_data.dataobject) - 5) + '[')
	li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
	li_chr_nbr = li_pos_e - (li_pos_s + len(vdw_data.dataobject) - 4)
	li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(vdw_data.dataobject ) - 4 , li_chr_nbr ))
	
	if vdw_f_object.dataobject = rstr_ds_4_posting.ds_master[li_idx_master].dataobject then
		ldb_object_ref_id = vdw_data.getitemnumber(vl_data_row, 'object_ref_id')
		ll_f_object_row = vdw_f_object.find("ID ="+string(ldb_object_ref_id),1,vdw_f_object.rowcount())		
	end if		

	if ll_f_object_row = 0 then ll_f_object_row = vdw_f_object.getrow()
end if

if vdw_t_object.dataobject = vdw_data.dataobject then
	ll_t_object_row = vl_data_row
else
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(vdw_data.dataobject, len(vdw_data.dataobject) - 5) + '[')
	li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
	li_chr_nbr = li_pos_e - (li_pos_s + len(vdw_data.dataobject) - 4)
	li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(vdw_data.dataobject ) - 4 , li_chr_nbr ))
	
	if vdw_t_object.dataobject = rstr_ds_4_posting.ds_master[li_idx_master].dataobject then
		ldb_object_ref_id = vdw_data.getitemnumber(vl_data_row, 'object_ref_id')
		ll_f_object_row = vdw_t_object.find("ID ="+string(ldb_object_ref_id),1,vdw_t_object.rowcount())		
	end if		
	
	if ll_t_object_row = 0 then ll_t_object_row = vdw_t_object.getrow()
end if
for li_idx = 1 to upperbound(vas_f_object_col[])
	 ldb_f_object = vdw_f_object.f_getitemany( ll_f_object_row, vas_f_object_col[li_idx] )
	 ldb_t_object = vdw_t_object.f_getitemany( ll_t_object_row, vas_t_object_col[li_idx] )
	 if ldb_qty < 0 then //-- đảo đối tượng from/to --//
		ldb_tmp_object = ldb_f_object
		ldb_f_object = ldb_t_object
		ldb_t_object = ldb_tmp_object
	end if
	li_rtn = rds_stream.setitem( vl_update_row,vas_f_object_col_sv[li_idx], ldb_f_object)
	li_rtn = rds_stream.setitem( vl_update_row,vas_t_object_col_sv[li_idx], ldb_t_object)
next
if li_rtn = -1 then
	gf_messagebox('m.b_doc.f_update_streamvalue_multi.02','Thông báo','Lỗi setitem vào datastore rd_streamvalue: f_update_streamvalue(70)','stop','ok',1)
	return -1
end if

//-- update currency --//
if isvalid( vdw_currency ) then
	if vdw_currency.dataobject = vdw_data.dataobject then
		ll_currency_row = vl_data_row
	else
		li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(vdw_data.dataobject, len(vdw_data.dataobject) - 5) + '[')
		li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
		li_chr_nbr = li_pos_e -(li_pos_s + len(vdw_data.dataobject ) - 4)
		li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(vdw_data.dataobject ) - 4 , li_chr_nbr ))
		
		if vdw_currency.dataobject = rstr_ds_4_posting.ds_master[li_idx_master].dataobject then
			ldb_object_ref_id = vdw_data.getitemnumber(vl_data_row, 'object_ref_id')
			ll_f_object_row = vdw_currency.find("ID ="+string(ldb_object_ref_id),1,vdw_currency.rowcount())		
		end if			
	
		if ll_currency_row = 0 then ll_currency_row = vdw_currency.getrow()
	end if
	for li_idx = 1 to upperbound(vas_cur_col[])
		li_rtn = rds_stream.setitem( vl_update_row,vas_cur_col_sv[li_idx], vdw_currency.f_getitemany( ll_currency_row, vas_cur_col[li_idx] ))
	next
	if li_rtn = -1 then
		gf_messagebox('m.b_doc.f_update_streamvalue_multi.03','Thông báo','Lỗi setitem vào datastore rd_streamvalue: f_update_streamvalue(91)','stop','ok',1)
		return -1
	end if
end if
return li_rtn
end function

public function integer f_update_streamvalue_multi (t_ds_db vdw_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row, t_ds_db vdw_f_object, string vas_f_object_col[], string vas_f_object_col_sv[], t_ds_db vdw_t_object, string vas_t_object_col[], string vas_t_object_col_sv[], ref s_str_ds_4_posting rstr_ds_4_posting);int				li_idx,li_rtn, li_pos_s, li_pos_e, li_chr_nbr, li_idx_master
long			ll_t_object_row, ll_f_object_row
double		ldb_object_ref_id, ldb_qty, ldb_sv_qty, ldb_f_object, ldb_t_object, ldb_tmp_object
t_dw_mpl	ldw_master

//-- update các giá trị của dw item/lot/value--//
for li_idx = 1 to upperbound(vas_data_col)
	if pos(upper(vs_pas_col), upper(vas_update_col[li_idx])+';' ) > 0  then continue
	
	if upper(vas_data_col[li_idx])= 'QTY' then 
		ldb_qty = vdw_data.f_getitemany( vl_data_row, vas_data_col[li_idx]+'_sku')
		if ldb_qty < 0 then
			ldb_sv_qty =-ldb_qty	
		else
			ldb_sv_qty =ldb_qty	
		end if
		li_rtn = rds_stream.setitem( vl_update_row,vas_update_col[li_idx], ldb_sv_qty  )
	else
		li_rtn = rds_stream.setitem( vl_update_row,vas_update_col[li_idx], vdw_data.f_getitemany( vl_data_row, vas_data_col[li_idx])  )
	end if
next

if li_rtn = -1 then
	gf_messagebox('m.b_doc.f_update_streamvalue_multi.011','Thông báo','Lỗi setitem vào datastore rd_streamvalue: f_update_streamvalue(24)','stop','ok',1)
	return -1
end if

//-- update f_object và t_object --//
if vdw_f_object.dataobject = vdw_data.dataobject then
	ll_f_object_row = vl_data_row
else		 
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(vdw_data.dataobject, len(vdw_data.dataobject) - 5) + '[')
	li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
	li_chr_nbr = li_pos_e - (li_pos_s + len(vdw_data.dataobject ) - 4)
	li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(vdw_data.dataobject ) -4 , li_chr_nbr ))
	
	if vdw_f_object.dataobject = rstr_ds_4_posting.ds_master[li_idx_master].dataobject then
		ldb_object_ref_id = vdw_data.getitemnumber(vl_data_row, 'object_ref_id')
		ll_f_object_row = vdw_f_object.find("ID ="+string(ldb_object_ref_id),1,vdw_f_object.rowcount())		
	end if	
	if ll_f_object_row = 0 then ll_f_object_row = vdw_f_object.getrow()
end if

if vdw_t_object.dataobject = vdw_data.dataobject then
	ll_t_object_row = vl_data_row
else			 
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(vdw_data.dataobject, len(vdw_data.dataobject) -5) + '[')
	li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
	li_chr_nbr = li_pos_e - (li_pos_s + len(vdw_data.dataobject ) - 4)
	li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(vdw_data.dataobject ) -4 , li_chr_nbr ))
	
	if vdw_t_object.dataobject = rstr_ds_4_posting.ds_master[li_idx_master].dataobject then
		ldb_object_ref_id = vdw_data.getitemnumber(vl_data_row, 'object_ref_id')
		ll_f_object_row = vdw_t_object.find("ID ="+string(ldb_object_ref_id),1,vdw_t_object.rowcount())		
	end if	
	if ll_t_object_row = 0 then ll_t_object_row = vdw_t_object.getrow()
end if

for li_idx = 1 to upperbound(vas_f_object_col[])
	ldb_f_object =  vdw_f_object.f_getitemany( ll_f_object_row, vas_f_object_col[li_idx] )
	ldb_t_object = vdw_t_object.f_getitemany( ll_t_object_row, vas_t_object_col[li_idx] )
	if  ldb_qty < 0 then //-- đảo object from/to --//
		ldb_tmp_object = ldb_f_object
		ldb_f_object = ldb_t_object
		ldb_t_object = ldb_tmp_object
	end if
	li_rtn = rds_stream.setitem( vl_update_row,vas_f_object_col_sv[li_idx], ldb_f_object)
	li_rtn = rds_stream.setitem( vl_update_row,vas_t_object_col_sv[li_idx], ldb_t_object)
next

if li_rtn = -1 then
	gf_messagebox('m.b_doc.f_update_streamvalue_multi.021','Thông báo','Lỗi setitem vào datastore rd_streamvalue: f_update_streamvalue(68)','stop','ok',1)
	return -1
end if

return li_rtn
end function

public function string f_get_object_type (long vl_object_id);string ls_object_type
int		li_cnt

if isnull(vl_object_id) then
	gf_messagebox('m.b_doc.f_get_object_type.01','Thông báo','ID của đối tượng là NULL','stop','ok',1)
	return ''	
end if 
select count(id)  into :li_cnt from object where id = :vl_object_id using sqlca;

if li_cnt = 1 then
	select object_ref_table into :ls_object_type from object where id = :vl_object_id using sqlca;
	return ls_object_type
else
	gf_messagebox('m.b_doc.f_get_object_type.01','Thông báo','Không tìm thấy đối tượng có ID:@'+string(vl_object_id),'stop','ok',1)
	return ''
end if



end function

public function integer f_set_qty_sku (ref t_transaction rt_transaction, ref powerobject rpo_item, double vdb_row, double vdb_item_id, double vdb_trans_uom, string vs_qty_column, string vs_in_out, ref double rdb_qty_sku, ref double rdb_round_diff);/**********************************************************************
Chức năng: Cập nhật cột số lượng theo đơn vị tồn kho (SKU) và trả về số cập nhật
(Đang sử dụng)
----------------------------------------------------------------------------------------------
Tham số: 
			- rt_transaction : connection
			- rdw_item: datawindow chứa mã hàng giao dịch
			- vdb_row: số row đang xét
			- rdb_qty_sku: số quy đổi theo đơn vị SKU
			- rdb_round_diff: số chệnh lệch làm tròn khi quy đổi
Return: 1 thành công, -1 lỗi
==============================================================*/
double				ldb_qty, ldb_qty_sku, ldba_convert_data[], ldb_round_diff
int						li_rtn
string					lsa_item_column[]
c_unit_instance_ex	lc_unit


//-- Kiểm tra dw --//
if not isvalid(rpo_item ) then 
	gf_messagebox('m.b_doc.f_set_qty_sku.01','Thông báo','DW chứa item không VALID','exclamation','ok',1)
	rollback using rt_transaction;
	return -1	
end if

//-- kiểm tra số row --//
if vdb_row < 1 then 
	gf_messagebox('m.b_doc.f_set_qty_sku.02','Thông báo','Số dòng không hợp lệ','exclamation','ok',1)
	rollback using rt_transaction;
	return -1	
end if

//-- Lấy tham số item_id --//
if isnull(vdb_item_id) or vdb_item_id = 0 then
	gf_messagebox('m.b_doc.f_set_qty_sku.03','Thông báo','Không có mã hàng trong giao dịch','exclamation','ok',1)
	rollback using rt_transaction;
	return -1		
end if
//-- kiểm tra tham số đơn vị giao dịch --//
if isnull(vdb_trans_uom) or vdb_trans_uom = 0 then
	gf_messagebox('m.b_doc.f_set_qty_sku.05','Thông báo','Không tìm thấy đơn vị giao dịch','exclamation','ok',1)
	rollback using rt_transaction;
	return -1		
end if

ldb_qty = rpo_item.dynamic getitemnumber(vdb_row,vs_qty_column)
if isnull(ldb_qty) then  ldb_qty = 0 

//-- tính số lượng quy đổi đơn vị --//
lc_unit = create c_unit_instance_ex
li_rtn = lc_unit.f_get_data_4_conversion_unit_ex( vdb_trans_uom, vdb_item_id, ldb_qty, ldba_convert_data[], rt_transaction)

//-- cập nhật chênh lệch quy đổi --//
if li_rtn = 0 then
	rpo_item.dynamic setitem(vdb_row,vs_qty_column+'_sku', ldb_qty)
	rdb_qty_sku = ldb_qty
elseif li_rtn = 1 then

	ldb_round_diff = lc_unit.f_get_round_diff( vdb_item_id)
	if isnull(ldb_round_diff) then ldb_round_diff =0
	if upper(vs_in_out) = 'OUT' then
		ldb_qty_sku = ldba_convert_data[1] + ldba_convert_data[2] - ldb_round_diff
	else
		ldb_qty_sku = ldba_convert_data[1] + ldba_convert_data[2] + ldb_round_diff
	end if
	rdb_qty_sku = lc_unit.f_round( rt_transaction,  ldba_convert_data[4], ldb_qty_sku)
	
	if isnull(rdb_qty_sku) then rdb_qty_sku = 0
	rpo_item.dynamic setitem(vdb_row, vs_qty_column+'_sku', rdb_qty_sku)

	ldb_round_diff = ldb_qty_sku - rdb_qty_sku
	if upper(vs_in_out) = 'OUT' then
		rdb_round_diff = - ldb_round_diff
	else
		rdb_round_diff = ldb_round_diff
	end if	
else	 
	rollback using rt_transaction;
	destroy lc_unit
	return -1
end if
destroy lc_unit 
return 1
end function

private function integer f_update_item_balance_all (ref t_transaction rt_transaction, any vaa_arg[], date vd_balance_date);
long				ll_row_cnt, ll_insertrow, ll_idx

t_ds_db			lds_item_balance, lds_item_balance_all


lds_item_balance = create t_ds_db
lds_item_balance.dataobject = 'ds_item_balance'
lds_item_balance.f_settransobject(rt_transaction)

lds_item_balance_all = create t_ds_db
lds_item_balance_all.dataobject = 'ds_item_balance_all'
lds_item_balance_all.f_settransobject(rt_transaction)

ll_row_cnt = lds_item_balance_all.retrieve(relativedate(vd_balance_date, -1), vd_balance_date, vaa_arg[9],vaa_arg[2], vaa_arg[1],  vaa_arg[6], vaa_arg[3], vaa_arg[4],vaa_arg[7],vaa_arg[8],vaa_arg[10],vaa_arg[11])
FOR ll_idx =1 to ll_row_cnt
	ll_insertrow = lds_item_balance.insertrow(0)
	lds_item_balance.setitem(ll_insertrow,'id', this.f_create_id_ex( rt_transaction))	
	lds_item_balance.setitem(ll_insertrow,'balance_date', vd_balance_date)
	lds_item_balance.setitem(ll_insertrow,'item_id', lds_item_balance_all.getitemnumber(ll_idx, 'item_id'))
	lds_item_balance.setitem(ll_insertrow,'company_id',lds_item_balance_all.getitemnumber(ll_idx, 'company_id'))
	lds_item_balance.setitem(ll_insertrow,'SPEC_ID', lds_item_balance_all.getitemnumber(ll_idx, 'SPEC_ID'))
	lds_item_balance.setitem(ll_insertrow,'loc_id',lds_item_balance_all.getitemnumber(ll_idx, 'loc_id'))	
	lds_item_balance.setitem(ll_insertrow,'object_id', lds_item_balance_all.getitemnumber(ll_idx, 'object_id'))	
	lds_item_balance.setitem(ll_insertrow,'sob', lds_item_balance_all.getitemstring(ll_idx, 'sob'))	
	lds_item_balance.setitem(ll_insertrow,'lot_no', lds_item_balance_all.getitemstring(ll_idx, 'lot_no'))
	lds_item_balance.setitem(ll_insertrow,'serial_no', lds_item_balance_all.getitemstring(ll_idx, 'serial_no'))		
	lds_item_balance.setitem(ll_insertrow,'value_yn', lds_item_balance_all.getitemstring(ll_idx, 'value_yn'))
	lds_item_balance.setitem(ll_insertrow,'branch_id', lds_item_balance_all.getitemnumber(ll_idx, 'branch_id'))
	
	lds_item_balance.setitem(ll_insertrow,'open_qty', lds_item_balance_all.getitemnumber(ll_idx, 'close_qty') )
	lds_item_balance.setitem(ll_insertrow,'open_base_value', lds_item_balance_all.getitemnumber(ll_idx, 'close_base_value'))
	lds_item_balance.setitem(ll_insertrow,'close_qty',  lds_item_balance_all.getitemnumber(ll_idx, 'close_qty'))
	lds_item_balance.setitem(ll_insertrow,'close_base_value', lds_item_balance_all.getitemnumber(ll_idx, 'close_base_value'))	
NEXT

if lds_item_balance.update(true,false) = -1 then
	gf_messagebox('m.b_doc.f_update_object_balance_all.01','Thông báo', rt_transaction.SQLErrText ,'stop','ok',1)	
	rollback using rt_transaction;
	destroy lds_item_balance 
	destroy lds_item_balance_all
	return -1
end if

destroy lds_item_balance_all
destroy lds_item_balance
return 1
	
end function

public function integer f_update_item_balance (ref t_transaction rt_transaction, any vaa_arg[], date vd_trans_date, double vdb_qty, double vdb_base_value, string vs_in_out, string vs_balance_control, string ls_lotno_serial, string vs_value_yn, string vs_object_type);/**************************************************************************************
Chức năng:
-------------------------------------
Tham số:	
				- vaa_data[]: vaa_data[1](item_id), vaa_data[2](company_id), vaa_data[3](spec_id), vaa_data[4](loc_id)
								  vaa_data[5](trans_date), vaa_data[6](object_id), vaa_data[7](lot_no), vaa_data[8](serial_no),
								  vaa_data[9](sob),vaa_data[10](value_yn),vaa_data[11](branch_id),
--------------------------------------
return:	0: chứng từ không cập nhật tồn kho
			1: cập nhật tồn kho thành công
		   -1: Lỗi
=============================================================================*/

string				ls_tmpStr, ls_item_code, ls_base_curcode, ls_base_curname, ls_uom_code
long  				ll_idx, ll_row_bal, ll_row_cnt, ll_insertrow, ll_row_upd
double			ldb_open_qty, ldb_open_value,ldb_close_qty, ldb_close_value , ldb_base_curID, ldb_baseCur_roundID
double			ldb_in_qty,ldb_out_qty, ldb_in_value, ldb_out_value, ldb_moving_avg, ldb_stock_uom, ldb_stock_round
double			ldb_close_qty_tmp, ldb_close_value_tmp
date				ld_balance_date, ld_max_date
int					li_waiting_cnt, li_date_cnt

t_ds_db					lds_item_balance, lds_item_open_bal
c_unit_instance_ex	lc_unit


lc_unit = create c_unit_instance_ex

lds_item_balance = create t_ds_db
lds_item_balance.dataobject = 'ds_item_balance'
lds_item_balance.setsort('balance_date a')
lds_item_balance.f_settransobject(rt_transaction)
lds_item_balance.f_set_retrieve_args( vaa_arg[])

this.f_get_stock_uom_ex(double(vaa_arg[1]) , ldb_stock_uom, ls_uom_code, rt_transaction)
ldb_stock_round = lc_unit.f_get_round_id_ex( ldb_stock_uom, double(vaa_arg[1]), 'item', rt_transaction)

redo:

ll_row_cnt = lds_item_balance.event e_retrieve( )
if ll_row_cnt = 0 then  //-- Chưa có trong bàng item_balance --//
	//-- tính open --//
	lds_item_open_bal = create t_ds_db
	lds_item_open_bal.dataobject = 'ds_item_open_balance'
	lds_item_open_bal.f_settransobject(rt_transaction)
	lds_item_open_bal.f_set_retrieve_args( vaa_arg[])	
	ll_row_bal = lds_item_open_bal.event e_retrieve( )
	if ll_row_bal =1 then
		ldb_open_qty = lds_item_open_bal.getitemnumber(1, 'close_qty')
		if isnull(ldb_open_qty) then ldb_open_qty = 0
		ldb_open_value = lds_item_open_bal.getitemnumber(1, 'close_base_value')
		if isnull(ldb_open_value) then ldb_open_value = 0
		ld_max_date = date(lds_item_open_bal.getitemdatetime(1, 'balance_date'))
	elseif ll_row_bal = 0 then
		ldb_open_qty = 0
		ldb_open_value = 0		
		setnull(ld_max_date)
	else
		rollback using rt_transaction;
		destroy lds_item_open_bal
		destroy lds_item_balance
		messagebox('Thông báo', ' Lỗi retrieve ds_item_open_balance'+ rt_transaction.sqlerrtext)
//		gf_messagebox('m.b_doc.f_update_item_balance.01','Thông báo','Lỗi retrieve ds_item_open_balance:@'+rt_transaction.sqlerrtext,'stop','ok',1)
		return -1
	end if
	destroy lds_item_open_bal
	//-- tính close  --//	
	if upper(vs_in_out) = 'IN' then
		ldb_close_qty = ldb_open_qty + vdb_qty
		ldb_close_qty = lc_unit.f_round( rt_transaction, ldb_stock_round,ldb_close_qty)
		ldb_close_value = ldb_open_value + vdb_base_value
	else
		ldb_close_qty = ldb_open_qty - vdb_qty
		ldb_close_qty = lc_unit.f_round( rt_transaction, ldb_stock_round,ldb_close_qty)
		ldb_close_value = ldb_open_value - vdb_base_value		
	end if
	//-- kiểm tra close cho phép âm --//
	if vs_balance_control = 'negative_not_allow'   then
		if ldb_close_qty < 0 then

			if isnull(ls_tmpStr) or ls_tmpStr = '' then					
				ls_tmpStr =  this.f_get_object_code_ex(vaa_arg[1], rt_transaction)
				this.f_log_post(double(vaa_arg[1])  , 'Mã hàng sau xuất âm số lượng: '+ls_tmpStr+' ('+string(ldb_close_qty)+')')
				messagebox('Thông báo','Mã hàng sau xuất âm số lượng:@'+ls_tmpStr)
//				gf_messagebox('m.b_doc.f_update_item_balance.02','Thông báo','Mã hàng sau xuất âm số lượng: @'+ls_tmpStr, 'exclamation','ok',1)
			else
				ls_item_code =  this.f_get_object_code_ex(vaa_arg[1], rt_transaction)
				this.f_log_post(double(vaa_arg[1])  , 'Mã hàng sau xuất âm số lượng: '+ls_item_code+' ('+string(ldb_close_qty)+')')
				messagebox('Thông báo','Mã hàng sau xuất âm số lượng:@'+ls_item_code)
//				gf_messagebox('m.b_doc.f_update_item_balance.03','Thông báo','Mã hàng sau xuất âm số lượng: @'+ls_item_code+'- Seri: @'+ls_tmpStr, 'exclamation','ok',1)
			end if
			rollback using rt_transaction;				
			destroy lds_item_balance			

			return -1
		end if
	end if
	ll_insertrow = this.f_insert_item_balance(lds_item_balance ,vaa_arg[], vd_trans_date, vs_in_out, vdb_qty, vdb_base_value, ldb_open_qty, ldb_open_value, ldb_close_qty, ldb_close_value, rt_transaction)
	
	//-- Cập nhất tất cả item khác khi giao dịch đầu tiên của ngày phát sinh--//
	li_date_cnt = daysafter( ld_max_date, vd_trans_date)
	if li_date_cnt > 0  then
		setnull(vdb_qty)
		setnull(vdb_base_value)
		ldb_close_qty_tmp = ldb_open_qty
		ldb_close_value_tmp = ldb_open_value 		
		FOR ll_idx = 1 to li_date_cnt
			ld_balance_date = relativedate(ld_max_date, ll_idx)	
			if ll_row_bal = 1 and ll_idx <= li_date_cnt -1 then //-- insert balance của item giao dịch từ max_date đến trans_date --//
				ll_insertrow = this.f_insert_item_balance(lds_item_balance ,vaa_arg[], ld_balance_date, vs_in_out, vdb_qty, vdb_base_value, ldb_open_qty, ldb_open_value, ldb_close_qty_tmp, ldb_close_value_tmp, rt_transaction)
			end if
		NEXT				
	end if	
	
else //-- Đã có trong bảng item_balance --//
	ld_balance_date = date(lds_item_balance.getitemdatetime(1,'balance_date'))
	li_date_cnt  = daysafter(vd_trans_date, ld_balance_date)
	if li_date_cnt > 0 then
		ldb_open_qty = 0
		ldb_open_value = 0		
		FOR ll_idx = 1 to li_date_cnt // insert record balance từ trans_date đến first balance_date đầu tiên đã có trong balance --//
			ld_balance_date = relativedate(vd_trans_date, ll_idx -1)						
			//-- tính close  --//	
			if ll_idx = 1 then				
				if upper(vs_in_out) = 'IN' then
					ldb_close_qty = ldb_open_qty + vdb_qty
					ldb_close_qty = lc_unit.f_round( rt_transaction, ldb_stock_round,ldb_close_qty)
					ldb_close_value = ldb_open_value + vdb_base_value
				else
					ldb_close_qty = ldb_open_qty - vdb_qty
					ldb_close_qty = lc_unit.f_round( rt_transaction, ldb_stock_round,ldb_close_qty)
					ldb_close_value = ldb_open_value - vdb_base_value		
				end if				
			else
				setnull(vdb_qty)
				setnull(vdb_base_value)
				ldb_close_qty = ldb_open_qty 
				ldb_close_qty = lc_unit.f_round( rt_transaction, ldb_stock_round,ldb_close_qty)
				ldb_close_value = ldb_open_value 	
			end if
			//-- kiểm tra close qty, value --//
			if vs_balance_control = 'negative_not_allow'  then
				if ldb_close_qty < 0 then
					if isnull(ls_tmpStr) then					
						ls_tmpStr = this.f_get_object_code_ex(vaa_arg[1], rt_transaction )
						this.f_log_post(double(vaa_arg[1])  , 'Mã hàng sau xuất âm số lượng: '+ls_tmpStr+' ('+string(ldb_close_qty)+')')
						messagebox('Thông báo','Mã hàng sau xuất âm số lượng:@'+ls_tmpStr)
//						gf_messagebox('m.b_doc.f_update_item_balance.02','Thông báo','Mã hàng sau xuất âm số lượng:@'+ls_tmpStr, 'exclamation','ok',1)
					else
						ls_item_code =this.f_get_object_code_ex(vaa_arg[1], rt_transaction)
						this.f_log_post(double(vaa_arg[1])  , 'Mã hàng sau xuất âm số lượng: '+ls_item_code+' ('+string(ldb_close_qty)+')')
						messagebox('Thông báo','Mã hàng sau xuất âm số lượng:@'+ls_item_code)
//						gf_messagebox('m.b_doc.f_update_item_balance.03','Thông báo','Mã hàng sau xuất âm số lượng:@'+ls_item_code+'- Seri:@'+ls_tmpStr, 'exclamation','ok',1)
					end if
					rollback using rt_transaction;				
					destroy lds_item_balance			
					return -1
				end if
			end if					
			ll_insertrow = this.f_insert_item_balance(lds_item_balance ,vaa_arg[], ld_balance_date, vs_in_out, vdb_qty, vdb_base_value, ldb_open_qty, ldb_open_value, ldb_close_qty, ldb_close_value, rt_transaction)
			//-- Lấy close làm open của record sau --//
			ldb_open_qty = ldb_close_qty
			ldb_open_value = ldb_close_value			
		NEXT				
	end if
	
	//-- cập nhật open/close các record đã có tiếp sau first balance_date--//
	FOR ll_row_upd = 1 to ll_row_cnt
		ldb_in_qty = lds_item_balance.getitemnumber(ll_row_upd, 'in_qty')
		if isnull(ldb_in_qty) then ldb_in_qty = 0
		ldb_out_qty = lds_item_balance.getitemnumber(ll_row_upd, 'out_qty')
		if isnull(ldb_out_qty) then ldb_out_qty = 0
		ldb_in_value = lds_item_balance.getitemnumber(ll_row_upd, 'in_base_value')
		if isnull(ldb_in_value) then ldb_in_value = 0
		ldb_out_value = lds_item_balance.getitemnumber(ll_row_upd, 'out_base_value')	
		if isnull(ldb_out_value) then ldb_out_value = 0
		if li_date_cnt = 0 and ll_row_upd = 1 then //-- ngày trans_date đã có trong bảng balance --//
			ldb_open_qty = lds_item_balance.getitemnumber(ll_row_upd, 'open_qty')
			if isnull(ldb_open_qty) then ldb_open_qty = 0
			ldb_open_value = lds_item_balance.getitemnumber(ll_row_upd, 'open_base_value')			
			if isnull(ldb_open_value) then ldb_open_value = 0		
			if upper(vs_in_out) = 'IN' then
				ldb_in_qty = ldb_in_qty + vdb_qty
				ldb_in_value = ldb_in_value + vdb_base_value
				lds_item_balance.setitem(ll_row_upd,'in_qty', ldb_in_qty)
				lds_item_balance.setitem(ll_row_upd,'in_base_value', ldb_in_value)
			else
				ldb_out_qty = ldb_out_qty + vdb_qty
				ldb_out_value = ldb_out_value + vdb_base_value			
				lds_item_balance.setitem(ll_row_upd,'out_qty', ldb_out_qty)
				lds_item_balance.setitem(ll_row_upd,'out_base_value', ldb_out_value)
			end if
		end if
		//-- set open  --//
		if ll_row_upd > 0 then
			lds_item_balance.setitem(ll_row_upd,'open_qty', ldb_open_qty)
			lds_item_balance.setitem(ll_row_upd,'open_base_value', ldb_open_value)		
		end if
		//-- tính close qty, value --//
		ldb_close_qty = ldb_open_qty + ldb_in_qty - ldb_out_qty
		ldb_close_qty = lc_unit.f_round( rt_transaction, ldb_stock_round,ldb_close_qty)
		ldb_close_value = ldb_open_value + ldb_in_value - ldb_out_value		
		//-- kiểm tra close qty, value --//
		if vs_balance_control = 'negative_not_allow'  then			
			if ldb_close_qty < 0 then
				if isnull(ls_tmpStr) then					
					ls_tmpStr = this.f_get_object_code_ex(vaa_arg[1], rt_transaction )
					this.f_log_post(double(vaa_arg[1])  , 'Mã hàng sau xuất âm số lượng: '+ls_tmpStr+' ('+string(ldb_close_qty)+')')
					messagebox('Thông báo','Mã hàng sau xuất âm số lượng:@'+ls_tmpStr)
//					gf_messagebox('m.b_doc.f_update_item_balance.02','Thông báo','Mã hàng sau xuất âm số lượng:@'+ls_tmpStr, 'exclamation','ok',1)
				else
					ls_item_code = this.f_get_object_code_ex(vaa_arg[1], rt_transaction)
					this.f_log_post(double(vaa_arg[1])  , 'Mã hàng sau xuất âm số lượng: '+ls_item_code+' ('+string(ldb_close_qty)+')')
					messagebox('Thông báo','Mã hàng sau xuất âm số lượng:@'+ls_item_code)
//					gf_messagebox('m.b_doc.f_update_item_balance.03','Thông báo','Mã hàng sau xuất âm số lượng:@'+ls_item_code+'- Seri:@'+ls_tmpStr, 'exclamation','ok',1)
				end if
				rollback using rt_transaction;				
				destroy lds_item_balance			
				return -1
			end if
		end if	
		//-- set close --//
		lds_item_balance.setitem(ll_row_upd,'close_qty', ldb_close_qty)
		lds_item_balance.setitem(ll_row_upd,'close_base_value', ldb_close_value)	
		lds_item_balance.setitem(ll_row_upd,'value_yn', vs_value_yn)
		//-- Lấy close làm open của record sau --//
		ldb_open_qty = ldb_close_qty
		ldb_open_value = ldb_close_value
	NEXT	
end if

// cập nhật lại giá moving average --//
if  upper(vs_in_out) = 'IN'  and lower(vs_object_type) = 'warehouse' and upper(ls_lotno_serial) <> 'Y' then
//	lu_item = create u_item
	if ldb_close_qty > 0 and ldb_close_value >= 0 then
		ldb_moving_avg =  ldb_close_value/ldb_close_qty 
		lc_unit.f_get_base_cur_ex( ldb_base_curID, ls_base_curCode, ls_base_curName, rt_transaction )
		ldb_baseCur_roundID = lc_unit.f_get_round_id_ex(ldb_base_curID , 0, 'bc', rt_transaction)		
		ldb_moving_avg = lc_unit.f_round( rt_transaction, ldb_baseCur_roundID, ldb_moving_avg)
	elseif ldb_close_qty < 0 then
		ldb_moving_avg =  abs(ldb_close_value)/abs(ldb_close_qty) 
		lc_unit.f_get_base_cur_ex( ldb_base_curID, ls_base_curCode, ls_base_curName, rt_transaction)
		ldb_baseCur_roundID = lc_unit.f_get_round_id_ex(ldb_base_curID , 0, 'bc', rt_transaction)		
		ldb_moving_avg = lc_unit.f_round( rt_transaction, ldb_baseCur_roundID, ldb_moving_avg)		
	else 
		ldb_moving_avg = 0
	end if
	if ldb_moving_avg > 0 or ( ldb_moving_avg = 0 and ldb_close_qty > 0 ) then
		if this.f_update_moving_avg(vaa_arg[1],ldb_moving_avg, rt_transaction)= -1 then 
			return -1
		end if
	end if
end if	

//if vaa_arg[1] = 27744530 then debugbreak()
	
if lds_item_balance.update(true,false) = -1 then
	//-- kiểm tra lỗi user khác đã cập nhật dữ liệu ii_dberrorcode = -3, trùng khóa index ii_dberrorcode = 1--//
	if lds_item_balance.ii_dberrorcode = -3 or lds_item_balance.ii_dberrorcode = 1 then
		lds_item_balance.ii_dberrorcode = 0
		DO while li_waiting_cnt < 20
			li_waiting_cnt++
			goto redo			
		LOOP
		this.f_log_post(double(vaa_arg[1])  ,  rt_transaction.SQLErrText )
//		gf_messagebox('m.b_doc.f_update_object_balance.03','Thông báo', rt_transaction.SQLErrText ,'stop','ok',1)
		return -1		
	end if
	this.f_log_post(double(vaa_arg[1])  ,  rt_transaction.SQLErrText )
//	gf_messagebox('m.b_doc.f_update_object_balance.03','Thông báo', rt_transaction.SQLErrText ,'stop','ok',1)	
	rollback using rt_transaction;
	destroy lds_item_balance
	return -1
end if
lds_item_balance.resetupdate( )
destroy lc_unit
destroy lds_item_balance

return 1
	
end function

public function integer f_get_stock_uom (double vdb_item_id, ref double rdb_stock_uom, ref string rs_uom_code);
int			li_cnt

select count (object.id) into :li_cnt
from object join item on item.object_ref_id = object.id
where object.id = :vdb_item_id using sqlca;

if li_cnt > 1 then
	gf_messagebox('m.b_obj_instantiate.f_get_stock_uom2.01','Thống báo','Lỗi: Bảng ITEM có nhiều hơn 1 record cho ID:@'+string(vdb_item_id),'stop','ok',1)
	return -1
elseif li_cnt = 0 then
	gf_messagebox('m.b_obj_instantiate.f_get_stock_uom2.02','Thống báo','Không có mã hàng có ID:@'+string(vdb_item_id),'stop','ok',1)
	return -1	
end if

select item.stock_uom, uom.code into :rdb_stock_uom, :rs_uom_code
from object 
join item on item.object_ref_id = object.id
join uom on uom.id = item.stock_uom
where object.id = :vdb_item_id using sqlca;

return 1
end function

public function string f_get_object_code_ex (double vdb_id, ref t_transaction rt_transaction);
string	ls_code

//setnull(ls_code)
if isnull(vdb_id) then return ls_code

select code into :ls_code from object where id = :vdb_id using rt_transaction;
if rt_transaction.sqlcode = 100 then
	select code into :ls_code from legal_entity where id = :vdb_id using rt_transaction;
end if

if rt_transaction.sqlcode = 100 then
	select code into :ls_code from valueset_value where id = :vdb_id using rt_transaction;
end if

if rt_transaction.sqlcode = 100 then
	select code into :ls_code from uom where id = :vdb_id using rt_transaction;
end if

if rt_transaction.sqlcode = 0 then
	return ls_code
else
	gf_messagebox('m.b_umltithread.f_get_object_code.01','Thông báo','Không tìm thấy mã đối tượng có ID:@'+string(vdb_id),'exclamation','ok',1) 			
	return ls_code
end if
end function

public function integer f_update_moving_avg (double vdb_item_id, double vdb_moving_avg, ref t_transaction rt_transaction);double			ldb_moving_avg
string				ls_item_code

if isnull(vdb_item_id) or vdb_item_id = 0 then return 0
if isnull(vdb_moving_avg) then vdb_moving_avg = 0


update item set moving_avg = :vdb_moving_avg where object_ref_id = :vdb_item_id using rt_transaction;
if rt_transaction.sqlcode = -1 then
	rollback using rt_transaction;
	ls_item_code = this.f_get_code(vdb_item_id )
	gf_messagebox('m.c_item.f_update_moving_avg.01','Thông báo','Không cập nhật được giá bình quân di động của mặt hàng:@'+ls_item_code,'stop','ok',1)
	return -1
else
	return 1
end if
end function

public function integer f_get_item_managed_qty_value (double vdb_item, ref string rs_qty_yn, ref string rs_value_yn, ref t_transaction rt_transaction);/************************************************************************
Chức năng: Trả về ghi sổ số lượng và ghi sổ giá trị

=================================================================*/

int			li_cnt

select count(id) into :li_cnt from  ITEM where object_ref_id = :vdb_item and COMPANY_ID = :gi_user_comp_id  using rt_transaction; 

if li_cnt = 1 then
	select nvl(quantity_yn,'N') , nvl(value_yn,'N') into :rs_qty_yn, :rs_value_yn 
	from ITEM
	where object_ref_id = :vdb_item and COMPANY_ID = :gi_user_comp_id   using rt_transaction; 
	return 1
else
	gf_messagebox('m.bmultithread.f_get_item_managed_qty_value.01','Thông báo','Không tìm thấy mã hàng có ID:@'+string(vdb_item),'stop','ok',1)		
	return -1
end if
end function

public function integer f_booking_item_lot_multi_ex (ref t_transaction rt_transaction, ref t_ds_db rds_stream, t_ds_db vdw_item, long vl_item_row, ref t_ds_db rpo_item_lot, any vaa_data[], date vd_trans_date, string vs_lot_yn, string vs_serial_yn, string vs_qty_yn, string vs_value_yn, string vs_post_type, double vdb_item_value, double vdb_item_base_value, double vdb_item_qty, t_ds_db vdw_f_object, t_ds_db vdw_t_object, string vas_col_item[], string vas_col_item_lot[], string vas_col_item_value[], string vas_col_f_object[], string vas_col_t_object[], double vdb_trans_uom, string vas_col_f_object_sv[], string vas_col_t_object_sv[], string vas_col_item_sv[], string vas_col_item_lot_sv[], string vas_col_item_value_sv[], string vs_item_ref_table, string vs_samecol_string, string vs_doc_type, double vdb_dwitem_id, double vdb_doc_id, t_ds_db vdw_currency, string vas_col_currency[], string vas_col_currency_sv[], ref s_str_ds_4_posting rstr_ds_4_posting);/**************************************************************************************
Chức năng: duyệt tất các các mặt hàng có trong document để insert hoặc cập nhật tồn kho theo từng ngày. 
	 # mặt hàng không quản lý số lượng thì bỏ qua
	 # Mặt hàng không quản lý số lot/seri: cập số lượng và giá trị tồn kho trên cùng record
	 # mặt hàng có quản lý số lot/seri: 
	 		- Cập nhật số lượng tồn kho theo lot/seri, mỗi lot/seri 1 record tồn kho Số lượng.
			- Cập nhật giá trị tồn kho theo mã hàng ( tổng giá trị của các lot/seri), mỗi mã hàng 1 record giá trịn tồn kho.
-------------------------------------------------------
Tham số:	- rt_transaction : transacion của document
				- vd_trans_date: ngày ghi sổ
				- vs_post_type : POST hoặc UNPOST
				- vs_qty_yn: 'Y/N' là chứng từ ghi sổ số lượng hoặc không.
				- vs_value_yn: 'Y/N' là chứng từ ghi sổ giá trị hoặc không.
-------------------------------------------------------
return:	0: chứng từ không cập nhật tồn kho
			1: cập nhật tồn kho thành công
		   -1: Lỗi
=============================================================================*/
int							li_rtn, li_cnt, li_idx
long						ll_row, ll_insertrow_sv
string						ls_original_filter, ls_sv_value_yn, ls_sv_qty_yn, ls_manage_qty_yn, ls_manage_value_yn, ls_data
string						ls_base_curr_code, ls_base_curr_name, ls_related_doc_qty_yn
double					ldb_value_lot_seri,ldb_base_value_lot_seri, ldb_qty_lot_seri,  ldb_base_curr, ldb_invoiced_qty, ldb_invoicing_qty
double					ldb_round_id_trans, ldb_round_id_base

s_str_data				lstr_data_from_to, lstr_data_null
c_unit_instance			lc_unit

ls_related_doc_qty_yn = this.f_get_related_doc_qty_yn(vdb_doc_id, rt_transaction )
if this.f_get_item_managed_qty_value(vaa_data[1] ,ls_manage_qty_yn, ls_manage_value_yn, rt_transaction ) = -1 then return -1
if vs_value_yn ='Y' and ls_manage_value_yn = 'Y' then 
	ls_sv_value_yn = 'Y' 
else
	ls_sv_value_yn = 'N' 
end if
if vs_qty_yn ='Y' and ls_manage_qty_yn = 'Y' then 
	ls_sv_qty_yn = 'Y' 
else
	ls_sv_qty_yn = 'N' 
end if		

if ls_sv_value_yn = 'Y' then 
	lc_unit.f_get_base_cur(ldb_base_curr, ls_base_curr_code, ls_base_curr_name)	
	ldb_round_id_base = lc_unit.f_get_round_id( ldb_round_id_base, 0, 'bc')		
	ldb_round_id_trans = vdw_currency.f_getitemany( vdw_currency.getrow(), vas_col_currency[1] )
	ldb_round_id_trans = lc_unit.f_get_round_id( ldb_round_id_trans, 0, 'amount')	
end if

if vs_lot_yn = 'Y' then rpo_item_lot.setsort("lot_no a")
if vs_serial_yn = 'Y'  then rpo_item_lot.setsort("serial_no a")
rpo_item_lot.sort()

for ll_row = 1 to rpo_item_lot.rowcount( )				
	lstr_data_from_to = lstr_data_null
	ls_data = rpo_item_lot.dynamic getitemstring( ll_row, vas_col_f_object[2])	
	if isnull(ls_data) and  vs_lot_yn = 'Y'  then
		gf_messagebox('m.b_doc.f_booking_item_lot_multi_ex.04','Thông báo','Mã hàng sau chưa nhập số lô:@'+this.f_get_object_code_ex( vaa_data[1] , rt_transaction ),'stop','ok',1)		
		rollback using rt_transaction;
		destroy rds_stream
		return -1					
	end if
	lstr_data_from_to.aa_data_from[1] = ls_data

	ls_data = rpo_item_lot.dynamic getitemstring( ll_row, vas_col_f_object[3])	
	if isnull(ls_data) and  vs_serial_yn = 'Y'  then
		gf_messagebox('m.b_doc.f_booking_item_lot_multi_ex.05','Thông báo','Mã hàng sau chưa nhập số seri:@'+this.f_get_object_code_ex( vaa_data[1], rt_transaction ),'stop','ok',1)		
		rollback using rt_transaction;
		destroy rds_stream
		return -1						
	end if			
	lstr_data_from_to.aa_data_from[2] = ls_data	
	
	
	//-- tính giá trị của một lot/seri --//
	if ls_sv_value_yn = 'Y' then
		ldb_qty_lot_seri = rpo_item_lot.getitemnumber( ll_row, vas_col_item_lot[1])
		if isnull(ldb_qty_lot_seri) or ldb_qty_lot_seri = 0 then continue
		ldb_invoiced_qty = rpo_item_lot.getitemnumber( ll_row, 'invoiced_qty')
		if isnull(ldb_invoiced_qty) then  ldb_invoiced_qty = 0 
		if ldb_invoiced_qty > 0 then ldb_qty_lot_seri -= ldb_invoiced_qty
		if ll_row < rpo_item_lot.rowcount( ) and vdb_item_qty > 0	then
			if ldb_qty_lot_seri < vdb_item_qty then
				ldb_value_lot_seri = vdb_item_value/vdb_item_qty * ldb_qty_lot_seri
				ldb_value_lot_seri = lc_unit.f_round( rt_transaction, ldb_round_id_trans,ldb_value_lot_seri)
				
				ldb_base_value_lot_seri =  vdb_item_base_value/vdb_item_qty * ldb_qty_lot_seri
				ldb_base_value_lot_seri = lc_unit.f_round( rt_transaction, ldb_round_id_base,ldb_base_value_lot_seri)
				
				vdb_item_value -= ldb_value_lot_seri
				vdb_item_base_value -= ldb_base_value_lot_seri			
				vdb_item_qty -= ldb_qty_lot_seri
			else
				ldb_value_lot_seri = vdb_item_value
				ldb_base_value_lot_seri = vdb_item_base_value
				ldb_qty_lot_seri = vdb_item_qty
				vdb_item_qty = 0				
			end if
		elseif ll_row = rpo_item_lot.dynamic rowcount( ) then
			ldb_value_lot_seri = vdb_item_value
			ldb_base_value_lot_seri = vdb_item_base_value
			ldb_qty_lot_seri  = vdb_item_qty
			vdb_item_qty = 0
		end if
		//-- update số lượng đã invoiced của table lot_line --//
		if upper(vs_post_type) = 'POST' then
			ldb_invoiced_qty += ldb_qty_lot_seri
		else
			ldb_invoiced_qty -= ldb_qty_lot_seri
		end if
		rpo_item_lot.setitem(ll_row, 'invoiced_qty', ldb_invoiced_qty)
	end if
	
	//-- insert row --//
	this.f_insert_item_balance_row_multi_ex( rt_transaction, rpo_item_lot, ll_row, vdw_f_object, vdw_t_object, vd_trans_date, vs_post_type, vas_col_item_lot[], vas_col_item_value[], vas_col_f_object[], vas_col_t_object[], vaa_data[],  ls_sv_qty_yn, ls_sv_value_yn, vdb_trans_uom, vas_col_item_lot[1], ldb_base_value_lot_seri,  rstr_ds_4_posting,  vs_qty_yn, vs_value_yn , lstr_data_from_to, vdb_doc_id, ls_related_doc_qty_yn)

	//-- update steamvalue --//
	if upper(vs_post_type) = 'POST' then
		ll_insertrow_sv = rds_stream.event e_addrow( )		
		
		if  ls_sv_qty_yn = 'Y' and  ls_sv_value_yn = 'Y' then  //-- cập nhật stream_value GT --//
			li_rtn = this.f_update_streamvalue_multi_ex( vdw_item, rds_stream, vas_col_item_value[], vas_col_item_value_sv[], vs_samecol_string, vl_item_row, ll_insertrow_sv,vdw_f_object, vas_col_f_object[], vas_col_f_object_sv[],vdw_t_object, vas_col_t_object[], vas_col_t_object_sv[], vdw_currency,vas_col_currency[], vas_col_currency_sv[], ldb_value_lot_seri, ldb_base_value_lot_seri, rstr_ds_4_posting, lstr_data_from_to)

			if li_rtn = 1 then
				 li_rtn = this.f_update_streamvalue_multi(rpo_item_lot, rds_stream, vas_col_item_lot[], vas_col_item_lot_sv[], '', ll_row,ll_insertrow_sv)
			end if			
			if li_rtn = -1 then
				destroy rds_stream
				rollback using rt_transaction;
				return -1
			end if					
			
			li_rtn = this.f_postinsert_streamvalue(rds_stream , ll_insertrow_sv, ls_sv_value_yn,ls_sv_qty_yn, vs_item_ref_table, vdb_dwitem_ID, vs_doc_type, vdb_doc_id, vd_trans_date, rt_transaction)
			if li_rtn = -1 then 
				destroy rds_stream
				rollback using rt_transaction;
				return -1
			end if
		elseif  ls_sv_qty_yn = 'Y' and  ls_sv_value_yn = 'N' and (vs_value_yn = 'N' or ls_related_doc_qty_yn = 'N')  then  //-- cập nhật stream_value SL --//
			li_rtn = this.f_update_streamvalue_multi_ex( vdw_item, rds_stream, vas_col_item[], vas_col_item_sv[], vs_samecol_string, vl_item_row,ll_insertrow_sv, vdw_f_object, vas_col_f_object[], vas_col_f_object_sv[], vdw_t_object, vas_col_t_object[], vas_col_t_object_sv[], rstr_ds_4_posting, lstr_data_from_to)

			if li_rtn = 1 then
				 li_rtn = this.f_update_streamvalue_multi(rpo_item_lot, rds_stream, vas_col_item_lot[], vas_col_item_lot_sv[], '', ll_row,ll_insertrow_sv)
			end if			
			if li_rtn = -1 then
				destroy rds_stream
				rollback using rt_transaction;
				return -1
			end if					
			
			li_rtn = this.f_postinsert_streamvalue(rds_stream , ll_insertrow_sv, ls_sv_value_yn,ls_sv_qty_yn, vs_item_ref_table, vdb_dwitem_ID, vs_doc_type, vdb_doc_id, vd_trans_date, rt_transaction )
			if li_rtn = -1 then 
				destroy rds_stream
				rollback using rt_transaction;
				return -1
			end if

		end if

	end if
	//-- khi đã phân bổ hết giá trị vào số lượng kết của lot/seri --//
	if vdb_item_qty = 0 then exit
next

//-- update cot sku  của lot/seri --//
if rpo_item_lot.update(true,false) = -1 then
	gf_messagebox('m.b_doc.f_booking_item.06','Thông báo','Không cập nhật được số lượng theo đơn vị tồn kho:@' +rt_transaction.sqlerrtext ,'exclamation','ok',1)
	destroy rds_stream
	rollback using rt_transaction;
	return -1
end if	
rpo_item_lot.resetupdate()		

return 1
end function

public function string f_get_related_doc_qty_yn (double vdb_doc_id, ref t_transaction rt_transaction);int		li_cnt

select count(t.f_doc_id) into :li_cnt
 from matching t 
    join document t1 on t1.id = t.f_doc_id
    join booked_slip t2 on t2.id= t1.version_id
    where t.t_doc_id = :vdb_doc_id
    and nvl(t2.QUANTITY_YN, 'N') = 'Y' using rt_transaction;
	 
if 	 li_cnt > 0 then
	return 'Y'
else
	select count(t.t_doc_id) into :li_cnt
	 from matching t 
		 join document t1 on t1.id = t.t_doc_id
		 join booked_slip t2 on t2.id= t1.version_id
		 where t.f_doc_id = :vdb_doc_id
		 and nvl(t2.QUANTITY_YN, 'N') = 'Y' using rt_transaction;	
	if li_cnt > 0 then
		return  'Y'
	else
		return 'N'
	end if
end if

return 'N'
end function

public function integer f_get_ds_of_streamvalue_ex (ref double vdb_doc_version, ref t_ds_db rdw_item, ref t_ds_db rdw_f_object, ref t_ds_db rdw_t_object, ref t_ds_db rdw_f_lot, ref t_ds_db rdw_t_lot, ref t_ds_db rdw_item_value, ref t_ds_db rdw_item_lot, s_str_streamvalue vstr_streamvalue, ref t_transaction rt_transaction);//-- Lấy dw trên form theo cài đặt streamvalue structure: để thực hiện update item balance --//
string						ls_colname, ls_coltype
int							li_pos_s, li_pos_e, li_chr_nbr
any						laa_value[]


//-- Lấy dw --//
laa_value[1] = vdb_doc_version

	if lower(vstr_streamvalue.s_item_dwo) = 'none' then return 0
	rdw_item = create t_ds_db 
	rdw_item.dataobject = vstr_streamvalue.s_item_dwo
	
	if upper(rdw_item.describe("DataWindow.Table.UpdateTable")) = 'DOCUMENT' then
		rdw_item.f_add_where('VERSION_ID',laa_value[] )
	elseif  upper(rdw_item.describe("DataWindow.Table.UpdateTable")) = 'BOOKED_SLIP' then
		rdw_item.f_add_where('ID',laa_value[] )
	elseif upper(rdw_item.describe("DataWindow.Table.UpdateTable")) = 'TAX_LINE' or upper(rdw_item.describe("DataWindow.Table.UpdateTable")) = 'LOT_LINE' then
		rdw_item.f_add_where('doc_version',laa_value[] )
	else
		rdw_item.f_add_where('object_ref_id',laa_value[] )
	end if	
	rdw_item.f_settransobject(rt_transaction)								
	rdw_item.event e_retrieve()
		
	if vstr_streamvalue.s_f_obj_dwo = vstr_streamvalue.s_item_dwo then
		rdw_f_object = rdw_item
	else	
		
		rdw_f_object = create t_ds_db 
		rdw_f_object.dataobject = vstr_streamvalue.s_f_obj_dwo 
		
		if upper(rdw_f_object.describe("DataWindow.Table.UpdateTable")) = 'DOCUMENT' then
			rdw_f_object.f_add_where('VERSION_ID',laa_value[] )
		elseif  upper(rdw_f_object.describe("DataWindow.Table.UpdateTable")) = 'BOOKED_SLIP' then
			rdw_f_object.f_add_where('ID',laa_value[] )
		elseif upper(rdw_f_object.describe("DataWindow.Table.UpdateTable")) = 'TAX_LINE' or upper(rdw_f_object.describe("DataWindow.Table.UpdateTable")) = 'LOT_LINE' then
			rdw_f_object.f_add_where('doc_version',laa_value[] )
		else
			rdw_f_object.f_add_where('object_ref_id',laa_value[] )
		end if	
		rdw_f_object.f_settransobject(rt_transaction)								
		rdw_f_object.event e_retrieve()
	end if
	
	if vstr_streamvalue.s_t_obj_dwo = vstr_streamvalue.s_item_dwo then
		rdw_t_object = rdw_item
	else
		rdw_t_object = create t_ds_db 
		rdw_t_object.dataobject = vstr_streamvalue.s_t_obj_dwo 
		
		if upper(rdw_t_object.describe("DataWindow.Table.UpdateTable")) = 'DOCUMENT' then
			rdw_t_object.f_add_where('VERSION_ID',laa_value[] )
		elseif  upper(rdw_t_object.describe("DataWindow.Table.UpdateTable")) = 'BOOKED_SLIP' then
			rdw_t_object.f_add_where('ID',laa_value[] )
		elseif  upper(rdw_t_object.describe("DataWindow.Table.UpdateTable")) = 'BOOKED_SLIP' then
			rdw_t_object.f_add_where('ID',laa_value[] )
		elseif upper(rdw_t_object.describe("DataWindow.Table.UpdateTable")) = 'TAX_LINE' or upper(rdw_t_object.describe("DataWindow.Table.UpdateTable")) = 'LOT_LINE' then
			rdw_t_object.f_add_where('doc_version',laa_value[] )
		else
			rdw_t_object.f_add_where('object_ref_id',laa_value[] )
		end if	
		rdw_t_object.f_settransobject(rt_transaction)								
		rdw_t_object.event e_retrieve()				
	end if
	//-- lây dw giá trị --//
	
	if vstr_streamvalue.s_item_dwo = vstr_streamvalue.s_value_dwo then
		rdw_item_value = rdw_item
	elseif vstr_streamvalue.s_value_dwo <> '' then	
		
		rdw_item_value = create t_ds_db 
		rdw_item_value.dataobject = vstr_streamvalue.s_value_dwo 
		
		if upper(rdw_item_value.describe("DataWindow.Table.UpdateTable")) = 'DOCUMENT' then
			rdw_item_value.f_add_where('VERSION_ID',laa_value[] )
		elseif  upper(rdw_item_value.describe("DataWindow.Table.UpdateTable")) = 'BOOKED_SLIP' then
			rdw_item_value.f_add_where('ID',laa_value[] )			
		elseif upper(rdw_t_object.describe("DataWindow.Table.UpdateTable")) = 'TAX_LINE' or upper(rdw_item_value.describe("DataWindow.Table.UpdateTable")) = 'LOT_LINE' then
			rdw_item_value.f_add_where('doc_version',laa_value[] )
		else
			rdw_item_value.f_add_where('object_ref_id',laa_value[] )
		end if	
		rdw_item_value.f_settransobject(rt_transaction)								
		rdw_item_value.event e_retrieve()				
				
	end if
	
	//-- Lấy dw lot--//
	if vstr_streamvalue.s_item_lot_dwo <> '' and left(vstr_streamvalue.s_item_lot_dwo, 3) <> 'ds_' then	
		
		rdw_item_lot = create t_ds_db 
		rdw_item_lot.dataobject = vstr_streamvalue.s_item_lot_dwo 
		
		if upper(rdw_item_lot.describe("DataWindow.Table.UpdateTable")) = 'DOCUMENT' then
			rdw_item_lot.f_add_where('VERSION_ID',laa_value[] )
		elseif  upper(rdw_item_lot.describe("DataWindow.Table.UpdateTable")) = 'BOOKED_SLIP' then
			rdw_item_lot.f_add_where('ID',laa_value[] )		
		elseif upper(rdw_item_lot.describe("DataWindow.Table.UpdateTable")) = 'TAX_LINE' or upper(rdw_item_lot.describe("DataWindow.Table.UpdateTable")) = 'LOT_LINE' then
			rdw_item_lot.f_add_where('doc_version',laa_value[] )
		else
			rdw_item_lot.f_add_where('object_ref_id',laa_value[] )
		end if	
		rdw_item_lot.f_settransobject(rt_transaction)								
		rdw_item_lot.event e_retrieve()					
	end if
	
	//--ds f_lot --//
	if vstr_streamvalue.s_f_lot_dwo = vstr_streamvalue.s_item_lot_dwo then
		rdw_f_lot = rdw_item_lot
	elseif vstr_streamvalue.s_f_lot_dwo <> '' then	
		rdw_f_lot = create t_ds_db 
		rdw_f_lot.dataobject = vstr_streamvalue.s_f_lot_dwo 
		
		if upper(rdw_f_lot.describe("DataWindow.Table.UpdateTable")) = 'DOCUMENT' then
			rdw_f_lot.f_add_where('VERSION_ID',laa_value[] )
		elseif  upper(rdw_f_lot.describe("DataWindow.Table.UpdateTable")) = 'BOOKED_SLIP' then
			rdw_f_lot.f_add_where('ID',laa_value[] )	
		elseif upper(rdw_f_lot.describe("DataWindow.Table.UpdateTable")) = 'TAX_LINE' or upper(rdw_f_lot.describe("DataWindow.Table.UpdateTable")) = 'LOT_LINE' then
			rdw_f_lot.f_add_where('doc_version',laa_value[] )
		else
			rdw_f_lot.f_add_where('object_ref_id',laa_value[] )
		end if	
		rdw_f_lot.f_settransobject(rt_transaction)								
		rdw_f_lot.event e_retrieve()					
	end if
	//--ds t_lot --/
	if vstr_streamvalue.s_t_lot_dwo = vstr_streamvalue.s_t_obj_dwo then
		rdw_t_lot = rdw_t_object
	elseif vstr_streamvalue.s_t_lot_dwo <> '' then	
		rdw_t_lot = create t_ds_db 
		rdw_t_lot.dataobject = vstr_streamvalue.s_t_lot_dwo 
		
		if upper(rdw_t_lot.describe("DataWindow.Table.UpdateTable")) = 'DOCUMENT' then
			rdw_t_lot.f_add_where('VERSION_ID',laa_value[] )
		elseif  upper(rdw_t_lot.describe("DataWindow.Table.UpdateTable")) = 'BOOKED_SLIP' then
			rdw_t_lot.f_add_where('ID',laa_value[] )				
		elseif upper(rdw_t_lot.describe("DataWindow.Table.UpdateTable")) = 'TAX_LINE' or upper(rdw_t_lot.describe("DataWindow.Table.UpdateTable")) = 'LOT_LINE' then
			rdw_t_lot.f_add_where('doc_version',laa_value[] )
		else
			rdw_t_lot.f_add_where('object_ref_id',laa_value[] )
		end if	
		rdw_t_lot.f_settransobject(rt_transaction)								
		rdw_t_lot.event e_retrieve()					

	end if
	
	//-- lấy dw currency --//


//-- Kết thúc lấy dw --//
return 1
end function

public function integer f_get_dwcol_of_streamvalue (ref string ras_col_f_object[], ref string ras_col_f_object_sv[], ref string ras_col_t_object[], ref string ras_col_t_object_sv[], ref string ras_col_item[], ref string ras_col_item_sv[], ref string ras_col_item_value[], ref string ras_col_item_value_sv[], ref string ras_col_item_lot[], ref string ras_col_item_lot_sv[], ref string ras_col_currency[], ref string ras_col_currency_sv[], s_str_streamvalue vstr_streamvalue);//-- Lấy dw trên form theo cài đặt streamvalue structure: để thực hiện update item balance --//

c_string_ex					lc_string

lc_string = create c_string_ex

	lc_string.f_stringtoarray( vstr_streamvalue.s_item_column, ';', ras_col_item)
	lc_string.f_stringtoarray( vstr_streamvalue.s_item_column_sv, ';', ras_col_item_sv)
	lc_string.f_stringtoarray( vstr_streamvalue.s_item_lot_column, ';', ras_col_item_lot)
	lc_string.f_stringtoarray( vstr_streamvalue.s_item_lot_column_sv, ';', ras_col_item_lot_sv)
	
	lc_string.f_stringtoarray( vstr_streamvalue.s_f_obj_column, ';', ras_col_f_object)
	lc_string.f_stringtoarray( vstr_streamvalue.s_f_lot_column, ';', ras_col_f_object, true) // lấy thêm colname f_lot	
	lc_string.f_stringtoarray( vstr_streamvalue.s_f_column_sv, ';', ras_col_f_object_sv)
	lc_string.f_stringtoarray( vstr_streamvalue.s_t_obj_column, ';', ras_col_t_object)
	lc_string.f_stringtoarray( vstr_streamvalue.s_t_lot_column, ';', ras_col_t_object, true) // lấy thêm colname f_lot	
	lc_string.f_stringtoarray( vstr_streamvalue.s_t_column_sv, ';', ras_col_t_object_sv)
	
	lc_string.f_stringtoarray( vstr_streamvalue.s_currency_column, ';', ras_col_currency)
	lc_string.f_stringtoarray( vstr_streamvalue.s_currency_column_sv, ';', ras_col_currency_sv)
	lc_string.f_stringtoarray( vstr_streamvalue.s_value_column, ';', ras_col_item_value)
	lc_string.f_stringtoarray( vstr_streamvalue.s_value_column_sv, ';', ras_col_item_value_sv)

//-- Kết thúc lấy dw --//
return 1
end function

public function string f_get_object_type_ex (double vdb_object_id, ref t_transaction rt_transaction);string ls_object_type

select object_ref_table into :ls_object_type from object where id = :vdb_object_id using rt_transaction;

if rt_transaction.sqlcode =  -1 then
	gf_messagebox('m.b_doc.f_get_object_type.01','Thông báo','Lỗi database:@'+rt_transaction.sqlerrtext,'stop','ok',1)
	return ''
end if

return ls_object_type

end function

public function integer f_get_lot_or_serial_yn_ex (double vdb_item_id, ref string rs_lot_yn, ref string rs_serial_yn, ref t_transaction rt_transaction);
select nvl(item.lot_yn,'N'),nvl(item.serial_yn,'N') into :rs_lot_yn,:rs_serial_yn 
from item 
where item.object_ref_id = :vdb_item_id using rt_transaction;
if rt_transaction.sqlcode = 0 then
	return 1
else
	return -1
end if
end function

public function boolean f_is_managed_qty_ex (double vdb_item_id, ref t_transaction rt_transaction);boolean			lb_ok
string				ls_qty_yn

setnull(lb_ok)
if isnull(vdb_item_id) or vdb_item_id = 0 then	return lb_ok

select quantity_yn into :ls_qty_yn from item where object_ref_id = :vdb_item_id  using rt_transaction;

if rt_transaction.sqlcode = 0 then
	if ls_qty_yn = 'Y' then return true
	return false
else
	gf_messagebox('m.b_multithread.f_is_managed_qty_ex.01','Thông báo','Lôi Select table:'+rt_transaction.sqlerrtext,'stop','ok',1)
	return lb_ok
end if

end function

public function integer f_update_round_diff (double vdb_item_id, double vdb_round_diff, ref t_transaction rt_transaction);double			ldb_moving_avg
string				ls_item_code

if isnull(vdb_item_id) or vdb_item_id = 0 then return 0
if isnull(vdb_round_diff) then vdb_round_diff = 0

update item set round_diff = :vdb_round_diff where object_ref_id = :vdb_item_id using rt_transaction;

if rt_transaction.sqlcode = -1 then
	rollback using rt_transaction;
	ls_item_code = this.f_get_object_code_ex(vdb_item_id, rt_transaction )
	gf_messagebox('m.c_item.f_update_round_diff.01','Thông báo','Không cập nhật được chênh lệch làm tròn quy đổi đơn vị của mặt hàng:@'+ls_item_code,'stop','ok',1)
	return -1
else
	return 1
end if
end function

public function string f_get_warehouse_negative (double vdb_id, ref t_transaction rt_transaction);int					li_cnt 
string				ls_yn

select count(id) into :li_cnt  from object where id = :vdb_id using rt_transaction;

if li_cnt = 0 then
	return 'negative_allow'
else
	select nvl(negative_allow_yn,'N') into :ls_yn  from object where id = :vdb_id using rt_transaction;
	
	if  ls_yn = 'Y' then
		return  'negative_allow'
	else
		return  'negative_not_allow'
	end if
end if
end function

public function integer f_get_stock_uom_ex (double vdb_item_id, ref double rdb_stock_uom, ref string rs_uom_code, ref t_transaction rt_transaction);
int			li_cnt

select count (object.id) into :li_cnt
from object join item on item.object_ref_id = object.id
where object.id = :vdb_item_id using rt_transaction;

if li_cnt > 1 then
	gf_messagebox('m.b_obj_instantiate.f_get_stock_uom2.01','Thống báo','Lỗi: Bảng ITEM có nhiều hơn 1 record cho ID:@'+string(vdb_item_id),'stop','ok',1)
	return -1
elseif li_cnt = 0 then
	gf_messagebox('m.b_obj_instantiate.f_get_stock_uom2.02','Thống báo','Không có mã hàng có ID:@'+string(vdb_item_id),'stop','ok',1)
	return -1	
end if

select item.stock_uom, uom.code into :rdb_stock_uom, :rs_uom_code
from object 
join item on item.object_ref_id = object.id
join uom on uom.id = item.stock_uom
where object.id = :vdb_item_id using rt_transaction;

return 1
end function

public function integer f_test (integer vi_test);t_ds_db		lds_test

lds_test = create t_ds_db
lds_test.dataobject = 'd_lot_line_grid'

return 0
end function

public function integer f_get_qty_and_value_yn_sob (double vdb_doc_id, ref string rs_quantity_yn, ref string rs_value_yn, ref t_transaction rt_transaction);
select coalesce(bks.QUANTITY_YN,'N'),coalesce(bks.VALUE_YN,'N') into :rs_quantity_yn,:rs_value_yn
from booked_slip bks left join document doc on doc.id = bks.object_ref_id and doc.version_id = bks.id 
where doc.id = :vdb_doc_id using rt_transaction; 

if rt_transaction.sqlcode = 0 then
	return 1
elseif rt_transaction.sqlcode = 100 then
	return 0
else
	return -1
end if
end function

public function integer f_insert_item_balance (ref t_ds_db rds_item_balance, any vaa_arg[], date vd_balance_date, string vs_in_out, double vdb_in_out_qty, double vdb_in_out_base_value, double vdb_open_qty, double vdb_open_value, double vdb_close_qty, double vdb_close_value, t_transaction rt_transaction);
long			ll_insertrow
string			ls_tmpStr

ll_insertrow = rds_item_balance.insertrow(0)
rds_item_balance.setitem(ll_insertrow,'id', this.f_create_id_ex( rt_transaction))	

rds_item_balance.setitem(ll_insertrow,'item_id', vaa_arg[1])
rds_item_balance.setitem(ll_insertrow,'company_id',vaa_arg[2])
rds_item_balance.setitem(ll_insertrow,'SPEC_ID', vaa_arg[3])
rds_item_balance.setitem(ll_insertrow,'loc_id', vaa_arg[4])
rds_item_balance.setitem(ll_insertrow,'balance_date', vd_balance_date)
rds_item_balance.setitem(ll_insertrow,'object_id', vaa_arg[6])	
rds_item_balance.setitem(ll_insertrow,'sob', vaa_arg[9])	
rds_item_balance.setitem(ll_insertrow,'value_yn', vaa_arg[10])
rds_item_balance.setitem(ll_insertrow,'branch_id', vaa_arg[11])
ls_tmpStr = vaa_arg[7]
if ls_tmpStr = '@' then setnull(ls_tmpStr)
rds_item_balance.setitem(ll_insertrow,'lot_no', ls_tmpStr)
ls_tmpStr = vaa_arg[8]
if ls_tmpStr = '@' then setnull(ls_tmpStr)	
rds_item_balance.setitem(ll_insertrow,'serial_no', ls_tmpStr)
if not isnull(vdb_in_out_qty) then
	if upper(vs_in_out) = 'IN' then	
		rds_item_balance.setitem(ll_insertrow,'in_qty', vdb_in_out_qty)
		rds_item_balance.setitem(ll_insertrow,'in_base_value', vdb_in_out_base_value)
	else
		rds_item_balance.setitem(ll_insertrow,'out_qty', vdb_in_out_qty)
		rds_item_balance.setitem(ll_insertrow,'out_base_value', vdb_in_out_base_value)	
	end if
end if
rds_item_balance.setitem(ll_insertrow,'open_qty', vdb_open_qty)
rds_item_balance.setitem(ll_insertrow,'open_base_value', vdb_open_value)
rds_item_balance.setitem(ll_insertrow,'close_qty', vdb_close_qty)
rds_item_balance.setitem(ll_insertrow,'close_base_value', vdb_close_value)

return ll_insertrow
end function

public function integer f_postinsert_streamvalue (ref t_ds_db rds_stream, long vl_row, string vs_value_yn, string vs_qty_yn, string vs_item_ref_table, double vdb_item_ref_id, string vs_doc_ref_type, double vdb_doc_ref_id, ref date vd_trans_date, t_transaction rt_transaction);int	li_rtn

	li_rtn = rds_stream.setitem( vl_row, 'ID', this.f_create_id_ex(rt_transaction))
	if li_rtn = 1 then li_rtn = rds_stream.setitem( vl_row, 'QTY_YN', vs_qty_yn)
	if li_rtn = 1 then li_rtn = rds_stream.setitem( vl_row, 'VALUE_YN', vs_value_yn)
	if li_rtn = 1 then li_rtn = rds_stream.setitem( vl_row, 'DOC_REF_ID', vdb_doc_ref_id )
	if li_rtn = 1 then li_rtn = rds_stream.setitem( vl_row, 'DOC_REF_TYPE', upper(vs_doc_ref_type) )
	if li_rtn = 1 then li_rtn = rds_stream.setitem( vl_row, 'TRANS_DATE', vd_trans_date )
	if li_rtn = 1 then li_rtn = rds_stream.setitem( vl_row, 'ITEM_REF_ID', vdb_item_ref_id  )
	if li_rtn = 1 then li_rtn = rds_stream.setitem( vl_row, 'ITEM_REF_TABLE', upper(vs_item_ref_table) )
	if li_rtn = 1 then li_rtn = rds_stream.setitem( vl_row, 'SOB', upper(gs_sob) )
return li_rtn
end function

public subroutine f_post (string vs_server, string vs_login, string vs_pwd, double vdb_company_id, double vdb_branch_id, double vdb_user_id, string vs_sob, string vs_dwo, string vs_docs_id, s_str_streamvalue vastr_streamvalue[], s_str_ds_4_posting vstr_ds_4_posting);
t_ds_db					ldsa_details[]

double					ldb_doc_id, ldb_trans_hdr_id, ladb_related_doc_id[],ldb_branch_id, ldb_doc_version, ldb_curr_id, ldb_exrate, ldb_return_doc_id
any 						la_data[], la_null[]
string						ls_obj_name,ls_qty_yn,ls_value_yn, ls_respond, ls_doctype, ls_post_message_yn, ls_ts_qty, ls_ts_value
string						ls_where, ls_sort
long 						ll_rtn, ll_currentrow,ll_count,ll_count_p, ll_count_l, ll_count_o,ll_count_it
int							li_cnt, li_idx, li_doc_cnt
date						ld_trans_date,ld_sysdate
boolean					lb_value_posted, lb_qty_posted, lb_create_postline_yn,lb_err


t_ds_db					lds_docs
t_transaction			lt_transaction

lt_transaction = create t_transaction
lt_transaction.DBMS = 'O10 Oracle10g (10.1.0)'
lt_transaction.ServerName = vs_server
lt_transaction.LogId = vs_login
lt_transaction.LogPass = vs_pwd
lt_transaction.AutoCommit = False
lt_transaction.DBParm = "CommitOnDisconnect='No',PBCatalogOwner='"+ vs_login +"'"
lt_transaction.database = 'multithread'
connect using	lt_transaction;	
string ls_errorText
if lt_transaction.sqlcode <> 0 then
	ls_errorText = lt_transaction.sqlerrtext 
	if isnull(ls_errortext) then ls_errortext = "(empty errortext)"
	messagebox("Database Error", "Please contact Support. Could not connect to the database: " + "~r~n~r~n" + ls_errortext)
	return 
end if

g_user = create c_user_instance
g_user.f_init_ex( vdb_user_id,lt_transaction )
gi_user_comp_id =vdb_company_id
gdb_branch = vdb_branch_id
gi_userid = vdb_user_id
gs_sob = vs_sob


select trunc(sysdate)  into :ld_sysdate from dual using lt_transaction;

lds_docs = create t_ds_db
lds_docs.dataobject = vs_dwo
la_data[1]=vs_docs_id
lds_docs.f_add_where( 'id', la_data[]) 
lds_docs.f_get_doc_trace(  ls_where, ls_sort)
lds_docs.f_add_where( ls_where, ' AND ')
lds_docs.f_settransobject(lt_transaction )
li_doc_cnt = lds_docs.retrieve( )

FOR li_idx = 1 to li_doc_cnt
	ldb_doc_id = lds_docs.getitemnumber(li_idx, 'id')
	ldb_doc_version =  lds_docs.getitemnumber(li_idx, 'version_id')
	ldb_branch_id = lds_docs.getitemnumber(li_idx, 'branch_id')
	ldb_trans_hdr_id = lds_docs.getitemnumber( li_idx, 'trans_hdr_id')
	ls_doctype = lds_docs.getitemstring(li_idx,'doc_type')
	ld_trans_date = date(lds_docs.getitemdatetime( li_idx, 'trans_date'))
	
	if lds_docs.describe( 'currency_id.coltype') = 'number' then
		ldb_curr_id =  lds_docs.getitemnumber( li_idx, 'currency_id')
	end if
	if lds_docs.describe( 'exchange_rate.coltype') = 'number' then
		ldb_exrate =  lds_docs.getitemnumber( li_idx, 'exchange_rate')
		if isnull(ldb_exrate) then ldb_exrate = 0
	end if
	ldb_return_doc_id = lds_docs.getitemnumber( li_idx, 'object_ref_id')
	if isnull(ldb_return_doc_id) then ldb_return_doc_id = 0
	this.f_get_qty_and_value_yn_sob( ldb_doc_id, ls_qty_yn, ls_value_yn, lt_transaction)
	this.f_get_qty_and_value_yn(ldb_trans_hdr_id, ls_ts_qty, ls_ts_value,lt_transaction)
			

	
	//-- Tạo tài khoản định khoản --//
	if ls_value_yn ='Y' then		
		select count(id) into :li_cnt from post_line where doc_id =:ldb_doc_id using lt_transaction;		
		if li_cnt > 0 then
			delete from post_line where doc_id =:ldb_doc_id using lt_transaction;		
		end if
		if  ldb_curr_id = 0 or isnull(ldb_curr_id) or ldb_exrate = 0 then
			this.f_log_post( ldb_doc_id,'Chứng từ chưa có loại tiền giao dịch hoặc tỷ giá')		
			update document set status = 'new' where id = :ldb_doc_id using lt_transaction;	
			continue
		end if
//		messagebox('f_create_post_line_multi','start')
		if this.f_create_post_line_multi(ldb_doc_id,ld_trans_date, ldb_doc_version, ldb_curr_id, ldb_exrate, ldb_return_doc_id , ldb_branch_id, ldb_trans_hdr_id, vstr_ds_4_posting, vastr_streamvalue[], lt_transaction) = -1 then	
			continue 
		else
			commit using lt_transaction;
		end if
		
		if this.f_booking_multi( ldb_doc_id,ldb_doc_version, ld_trans_date, ls_doctype, ls_qty_yn,ls_value_yn, ladb_related_doc_id[], lt_transaction, vstr_ds_4_posting, vastr_streamvalue[]) = -1 then 			
			continue 
		end if
		lb_value_posted = true	
	end if


	//-- Ghi sổ số lượng --//
	if (ls_qty_yn = 'Y' and ls_value_yn = 'N')  then//Nếu không ghi sổ kế toán mà có ghi sổ số lượng thì thực hiện ghi sổ số lượng luôn
		//Chèn ghi sổ kho
		
	//-- cập nhật item_balance --//		
		if this.f_booking_item_multi_ex( ldb_doc_id, ldb_doc_version, ls_doctype,lt_transaction, ld_trans_date, 'post', ls_qty_yn,ls_value_yn,  ladb_related_doc_id[], vastr_streamvalue[], vstr_ds_4_posting) = -1 then
			continue
		end if
		lb_qty_posted = true
	end if	
		
 
	//Cập nhật trạng thái và sob ghi sổ
	if lb_qty_posted or lb_value_posted then
		//-- kiểm tra xem bảng trans có ghi sổ chưa --// 
		
		if ls_value_yn ='Y' then
//			select count(doc_id) into :ll_count_p from post_line
//			where doc_id = :ldb_doc_id using lt_transaction;
			
//			select count(doc_ref_id) into :ll_count_l from ledger_trans
//			where doc_ref_id = :ldb_doc_id using lt_transaction;
//			
//			select count(doc_ref_id) into :ll_count_o from object_trans
//			where doc_ref_id = :ldb_doc_id using lt_transaction;
//			if ls_doctype = 'GOODS_TRANSFER'  or ls_doctype = 'ASSEMBLE' then //or ls_doctype = 'GOODS_RECEIPT_MISC' or ls_doctype = 'GOODS_DELIVERY_MISC'
//				if ll_count_p = 0 or ll_count_l = 0 then lb_err = true
//			elseif ls_doctype = 'GOODS_RECEIPT_MISC' or ls_doctype = 'GOODS_DELIVERY_MISC' then
//					//--  ?????? --//
//			else
//				if ll_count_p = 0 or  (ll_count_o = 0 and ls_doctype <> 'PROD_ORDERS') then lb_err = true   //OR ll_count_l = 0
//			end if 
			if lb_err then
				Rollback using lt_transaction;
				this.f_log_post( ldb_doc_id,'Chứng từ đã ghi sổ nhưng không cập nhật tiền giao dịch. Ghi sổ lại và liên hệ người quản trị')	
//				gf_messagebox('m.b_doc.e_action_post_multi.13','Thông báo','Chứng từ đã ghi sổ nhưng không cập nhật tiền giao dịch. Ghi sổ lại và liên hệ người quản trị' ,'stop','ok',1)		
				
				//-- update  document status :new --//
				FOR li_idx = 1 to li_doc_cnt
					ldb_doc_id = lds_docs.getitemnumber(li_idx, 'id')
					update document set status = 'new' where id = :ldb_doc_id using lt_transaction;						
				NEXT
				commit using  lt_transaction;	
				return 
			end if
		end if
		
		if ls_qty_yn = 'Y' then	
			
			SELECT COUNT(STR.DOC_REF_ID) into :ll_count_it
			FROM GL.STREAM_VALUE STR LEFT JOIN (SELECT DOC.ID,IVL.ID ITEM_REF_ID,IVL.ITEM_ID
																	FROM AD.DOCUMENT DOC 
																				JOIN IM.INVENTORY_LINE IVL ON IVL.OBJECT_REF_ID = DOC.VERSION_ID) DOCR ON DOCR.ITEM_REF_ID = STR.ITEM_REF_ID
															LEFT JOIN AD.DOCUMENT DOC ON DOC.ID = STR.DOC_REF_ID
															LEFT JOIN IM.INVENTORY_LINE IVL ON IVL.OBJECT_REF_ID = DOC.VERSION_ID
			WHERE DOCR.ID <> STR.DOC_REF_ID
            			AND STR.TRANS_DATE = :ld_trans_date
            			AND STR.DOC_REF_ID = :ldb_doc_id USING lt_transaction;
			
			if ll_count_it > 0 then
//				vb_callback.is_post_msg =' Chứng từ đã ghi sổ nhưng không cập nhật số lượng. Ghi sổ lại' 
				Rollback using lt_transaction;
				this.f_log_post( ldb_doc_id,' Chứng từ đã ghi sổ nhưng không cập nhật số lượng. Ghi sổ lại' )								
				//-- update  document status :new --//
				FOR li_idx = 1 to li_doc_cnt
					ldb_doc_id = lds_docs.getitemnumber(li_idx, 'id')
					update document set status = 'new' where id = :ldb_doc_id using lt_transaction;						
				NEXT
				commit using  lt_transaction;					
				return
			end if
		end if
		lds_docs.setitem(li_idx, 'status', 'booked')
//		lds_docs.setitem(li_idx, 'sob', gs_sob)
//		messagebox('Thông báo','OK')
		ll_rtn = lds_docs.update(true,false )
		if ll_rtn = 1 then	
			lds_docs.resetupdate( )
			//-- Cập nhật trạng thái chứng từ liện quan --//
//			if this.event e_statuschanged_multi( 'booked', ldb_doc_id, ls_doctype, true, vt_transaction) = -1 then
//				Rollback using vt_transaction;
//				continue
//			end if			
			commit using lt_transaction;		
//			messagebox('Thông báo','Complete!')
		else							
//			vb_callback.is_post_msg ='Không cập nhật được trạng thái ghi sổ:@'+vt_transaction.sqlerrtext
			Rollback using lt_transaction;	
			this.f_log_post( ldb_doc_id,'Không cập nhật được trạng thái ghi sổ:@'+lt_transaction.sqlerrtext )					
			//-- update  document status :new --//
			FOR li_idx = 1 to li_doc_cnt
				ldb_doc_id = lds_docs.getitemnumber(li_idx, 'id')
				update document set status = 'new' where id = :ldb_doc_id using lt_transaction;						
			NEXT
			commit using  lt_transaction;								
			return
		end if
	end if
	
NEXT

disconnect using	lt_transaction;	

destroy lt_transaction
end subroutine

public function integer f_copy_version (double vdb_doc_id, s_str_ds_4_posting vstr_ds_4_posting, ref t_transaction rt_transaction);double		ldb_version_id, ldb_new_ver, ldb_id
int				li_idx, li_colCnt
string			ls_updateTable, ls_colUpdate[], ls_object_ref_table, las_table_line[]
string			ls_sql, ls_col_list, ls_trace_cols_insrt, ls_trace_cols_val

c_string_ex		lc_string

lc_string = create c_string_ex

//-- cập nhật version_id--//
select version_id into :ldb_version_id
from document 
where id = :vdb_doc_id
using rt_transaction;

select seq_table_id.nextval  into :ldb_new_ver from dual using rt_transaction;

Update document 
set version_id = :ldb_new_ver ,  last_mdf_by = :gi_userid, last_mdf_date = sysdate, status = 'new'
where id = :vdb_doc_id using rt_transaction;

//-- copy detail --//
ls_trace_cols_insrt = ",created_by, created_date, last_mdf_by, last_mdf_date"
ls_trace_cols_val = ",created_by, created_date"
FOR li_idx = 1 to upperbound(vstr_ds_4_posting.ds_details[] )
	//-- insert BOOKED_SLIP/ ORDERS --//
	ls_updateTable = upper(vstr_ds_4_posting.ds_details[li_idx].describe("datawindow.table.Updatetable"))
	li_colCnt = vstr_ds_4_posting.ds_details[li_idx].f_getcolumns_update( ls_colUpdate[])
	lc_string.f_arraytostring(ls_colUpdate[], ',', ls_col_list)
	ls_sql = "INSERT into " + ls_updateTable + " (" +ls_col_list + ls_trace_cols_insrt +") "
	ls_sql =  lc_string.f_globalreplace( ls_sql, 'id_table', 'id')
	if ls_updateTable = 'BOOKED_SLIP' or ls_updateTable = 'ORDERS' then 				
		ls_col_list =  lc_string.f_globalreplace( ls_col_list, 'id_table', string(ldb_new_ver))
		ls_col_list =  lc_string.f_globalreplace( ls_col_list, 'version_no', 'version_no + 1')
		ls_sql += " SELECT "+ ls_col_list + ls_trace_cols_val +","+string(gi_userid) +", sysdate from "+ ls_updateTable + " where id ="+ string(ldb_version_id)
		
		EXECUTE immediate :ls_sql using rt_transaction;
	elseif ls_updateTable = 'TAX_LINE' or ls_updateTable = 'LOT_LINE' then
		ls_col_list =  lc_string.f_globalreplace( ls_col_list, 'id_table', 'seq_table_id.nextval')
		ls_col_list =  lc_string.f_globalreplace( ls_col_list, 'doc_version',  string(ldb_new_ver))
		ls_sql += " SELECT "+ ls_col_list + ls_trace_cols_val +","+string(gi_userid) +", sysdate from "+ ls_updateTable + " where doc_version ="+ string(ldb_version_id)		
		EXECUTE immediate :ls_sql using rt_transaction;	
		//-- update object_ref_id --//
		ls_object_ref_table = rt_transaction.f_get_ref_Table(ldb_version_id,  ls_updateTable)
		if ls_object_ref_table <> '' then
			ls_sql = "UPDATE " + ls_updateTable + "t set t.object_ref_id = "
			ls_sql += "( select u.id from "+ls_object_ref_table + "u where u.last_mdf_by = t.object_ref_id)"
			ls_sql += " WHERE t.doc_version = "+ string(ldb_new_ver)
			EXECUTE immediate :ls_sql  using rt_transaction;			
			
			//-- update last_mdf_by cua table LINE --//
			ls_sql = "UPDATE " + ls_object_ref_table + "t set t.last_mdf_by = "+string(gi_userid)
			ls_sql += " WHERE t.doc_version = "+ string(ldb_new_ver)
			
		end if
	else
		ls_col_list =  lc_string.f_globalreplace( ls_col_list, 'id_table', 'seq_table_id.nextval')
		ls_col_list =  lc_string.f_globalreplace( ls_col_list, 'last_mdf_by', 'id')
		ls_col_list =  lc_string.f_globalreplace( ls_col_list, 'object_ref_id',  string(ldb_new_ver))
		ls_sql += " SELECT "+ ls_col_list + ls_trace_cols_val +","+string(gi_userid) +", sysdate from "+ ls_updateTable + " where object_ref_id ="+ string(ldb_version_id)				
		EXECUTE immediate :ls_sql using rt_transaction;	

	end if			
NEXT

commit using rt_transaction;		

return 0
end function

public function integer f_booking_item_multi_ex (double vdb_doc_id, double vdb_doc_version, string vs_doctype, ref t_transaction rt_transaction, date vd_trans_date, string vs_post_type, string vs_qty_yn, string vs_value_yn, double vadb_related_doc_id[], s_str_streamvalue vstr_streamvalue[], s_str_ds_4_posting rstr_ds_4_posting);/**************************************************************************************
Chức năng: duyệt tất các các mặt hàng có trong document để insert hoặc cập nhật tồn kho theo từng ngày. 
	 # mặt hàng không quản lý số lượng thì bỏ qua
	 # Mặt hàng không quản lý số lot/seri: cập số lượng và giá trị tồn kho trên cùng record
	 # mặt hàng có quản lý số lot/seri: 
	 		- Cập nhật số lượng tồn kho theo lot/seri, mỗi lot/seri 1 record tồn kho Số lượng.
			- Cập nhật giá trị tồn kho theo mã hàng ( tổng giá trị của các lot/seri), mỗi mã hàng 1 record giá trịn tồn kho.
-------------------------------------
Tham số:	- rt_transaction : transacion của document
				- vd_trans_date: ngày ghi sổ
				- vs_post_type : POST hoặc UNPOST
				- vs_qty_yn: 'Y/N' là chứng từ ghi sổ số lượng hoặc không.
				- vs_value_yn: 'Y/N' là chứng từ ghi sổ giá trị hoặc không.
--------------------------------------
return:	0: chứng từ không cập nhật tồn kho
			1: cập nhật tồn kho thành công
		   -1: Lỗi 
=============================================================================*/
int							li_rtn, li_cnt, li_idx  //, li_pos_s, li_pos_e, li_chr_nbr, li_idx_master
long						ll_row, ll_row2, ll_insertrow_sv,ll_count, ll_row_itemmaster
any						laa_data[]
string						ls_lot_yn,ls_serial_yn, ls_item_ref_table, ls_samecol_string,ls_item_column_sv, ls_sv_qty_yn, ls_sv_value_yn, ls_related_doc_qty_yn
string						las_col_f_object[], las_col_f_object_sv[], las_col_t_object[], las_col_t_object_sv[], las_col_item[], las_col_item_sv[]
string						las_col_item_value[], las_col_item_value_sv[], las_col_item_lot[], las_col_item_lot_sv[], las_col_currency[], las_col_currency_sv[]
string						ls_where, ls_original_filter_lot,ls_original_filter_item, ls_ref_table, ls_manage_qty_yn, ls_manage_value_yn
double					ldb_trans_uom, ldb_item_id, ldb_dwitem_ID, ldb_value,ldb_base_value, ldb_qty, ldb_trans_charge_amt, ldb_base_charge_amt
double					ldb_itemmaster_ID


c_string_ex					lc_string
t_ds_db					ldw_f_object,ldw_item,ldw_t_object,ldw_item_lot,ldw_item_value, ldw_currency
t_ds_db					lds_stream, lds_item_lot, ldw_master , lds_f_lot, lds_t_lot
s_str_data				lstr_data_from_to, lstr_data_null


ls_related_doc_qty_yn =this.f_get_related_doc_qty_yn(vdb_doc_id, rt_transaction) 

lc_string = create c_string_ex
FOR li_idx = 1 to upperbound(vstr_streamvalue[])
	ls_original_filter_item =''
	ls_original_filter_lot = ''	
//	//-- Lấy ds --//
	li_rtn = this.f_get_ds_of_streamvalue_ex(vdb_doc_version, ldw_item, ldw_f_object,ldw_t_object , lds_f_lot, lds_t_lot, ldw_item_value,ldw_item_lot, vstr_streamvalue[li_idx], rt_transaction)
	if li_rtn = 0 then 
		messagebox('Thông báo','Lỗi f_get_ds_of_streamvalue_ex')
		return 0
	end if
	if li_rtn = -1 then
		this.f_log_post(vdb_doc_id  , 'Không lấy được Datastore của streamvalue')
		rollback using rt_transaction;		
		return -1
	end if
	//-- Lấy dw col--//
	li_rtn = this.f_get_dwcol_of_streamvalue( las_col_f_object[], las_col_f_object_sv[], las_col_t_object[], las_col_t_object_sv[], las_col_item[], las_col_item_sv[],las_col_item_value[], las_col_item_value_sv[], las_col_item_lot[], las_col_item_lot_sv[], las_col_currency[], las_col_currency_sv[], vstr_streamvalue[li_idx])
	if li_rtn = 0 then return 0
	if li_rtn = -1 then
		this.f_log_post(vdb_doc_id  , 'Không lấy được Datastore column của streamvalue')
		rollback using rt_transaction;
		return -1
	end if
	
	
	//-- Thông tin để update streamvalue --//
	lds_stream = create t_ds_db
	lds_stream.dataobject = 'ds_streamvalue'
	lds_stream.f_settransobject( rt_transaction)
	//-- Lấy các thông tin document chung --//
	ls_item_ref_table = upper(ldw_item.describe( "datawindow.table.updateTable"))
	
	//-- Lấy các cột trùng nhau giữa dw lot và dw item --//
	ls_item_column_sv = vstr_streamvalue[li_idx].s_item_column_sv
	ls_item_column_sv = lc_string.f_globalreplace(ls_item_column_sv , ' ', '')
	if right(ls_item_column_sv,1)<> ';' then ls_item_column_sv += ';'	
	FOR li_cnt = 1 to upperbound(las_col_item_lot_sv[])
		if pos(ls_item_column_sv, las_col_item_lot_sv[li_cnt]+';')> 0 then
			ls_samecol_string += las_col_item_lot_sv[li_cnt]+';'
		end if
	NEXT
	
	//-- Lấy dw lot--//
//	if upper(vs_qty_yn) = 'Y' then
//		if isvalid(ldw_item_lot) then
//			//-- ghi nhớ lại filter hiện tại --//
//			ls_original_filter_lot = ldw_item_lot.describe( "datawindow.table.filter")
//		end if
//	end if	
	
//		li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(ldw_item.dataobject, len(ldw_item.dataobject) - 5) + '[')
//		li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
//		li_chr_nbr = li_pos_e - (li_pos_s + len(ldw_item.dataobject) - 4)
//		li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(ldw_item.dataobject) - 4 , li_chr_nbr ))
		
//		ldw_master = rstr_ds_4_posting.ds_master[li_idx_master]						
//		ls_ref_table= upper(ldw_master.describe( "datawindow.table.updateTable"))
//		if ls_ref_table = 'BOOKED_SLIP' then
			FOR ll_row = 1 to ldw_item.rowcount( )			
				ldb_item_id =  ldw_item.getitemnumber(ll_row,las_col_item[1])
				
//				if ldb_item_id = 26197654 then debugbreak()
				
				ldb_dwitem_ID = ldw_item.getitemnumber( ll_row,'ID')
				ldb_trans_uom = ldw_item.getitemnumber(ll_row,las_col_item[4])
				if upper(this.f_get_object_type_ex(ldb_item_id,rt_transaction) ) <> 'ITEM' then continue
				if this.f_get_item_managed_qty_value(ldb_item_id ,ls_manage_qty_yn, ls_manage_value_yn, rt_transaction ) = -1 then
					this.f_log_post(vdb_doc_id  , 'Không tìm thấy Mã hàng có ID:@'+ string(ldb_item_id))
					rollback using rt_transaction;
					destroy lds_stream					
					return -1
				end if
				if vs_value_yn = 'Y' and ls_manage_value_yn ='Y' then
					ls_sv_value_yn ='Y' 
				else
					ls_sv_value_yn ='N' 
				end if
				if vs_qty_yn = 'Y'  and ls_manage_qty_yn ='Y' then
					ls_sv_qty_yn ='Y'
				else 
					ls_sv_qty_yn ='N'
				end if				
				//-- update item balance theo ngày --//
				ldb_qty = ldw_item.getitemnumber( ll_row,las_col_item[3])
				if isnull(ldb_qty) or ldb_qty = 0 then continue 			
				
				if ls_sv_value_yn = 'Y'  then
					ldb_value =  ldw_item.getitemnumber(ll_row,las_col_item_value[2]) //--trans value --//
					if isnull(ldb_value) then ldb_value =0			
					ldb_base_value =  ldw_item.getitemnumber(ll_row,las_col_item_value[3]) //--base value --//
					if isnull(ldb_base_value) then ldb_base_value =0			
					if las_col_item_value[3] = 'cogs' and ldb_base_value = 0 then
						ldb_base_value = this.f_get_last_pur_price( ldb_item_id, rt_transaction )	
						ldb_base_value = ldb_base_value * ldb_qty						
						ldb_value = ldb_base_value
					end if					
					//-- Đảo dấu form kiểm kê, khi điều chỉnh chênh lệch thiếu --//
					if ldw_item.dataobject = 'd_inventory_line_counting_grid' and ldb_value < 0 then
						ldb_value = - ldb_value
					end if				
					//-- Đảo dấu form kiểm kê, khi điều chỉnh chênh lệch thiếu --//
					if ldw_item.dataobject = 'd_inventory_line_counting_grid' and ldb_base_value < 0 then
						ldb_base_value = - ldb_base_value
					end if	
					
					//-- Công thêm thuế nhập khẩu và phí mua hàng nếu có --//
					if vs_doctype = 'PUR_INVOICE' then
						SELECT sum(TRANS_AMT), sum(BASE_AMT) INTO :ldb_trans_charge_amt, :ldb_base_charge_amt
						FROM POST_LINE 
						WHERE DOC_ID = :vdb_doc_id AND DR_OBJECT_ID = :ldb_item_id AND SOB = :gs_sob AND OBJECT_REF_TABLE <> :ls_item_ref_table  USING rt_transaction;
						if isnull(ldb_trans_charge_amt) then ldb_trans_charge_amt = 0
						if isnull(ldb_base_charge_amt) then ldb_base_charge_amt = 0
						ldb_value += ldb_trans_charge_amt
						ldb_base_value += ldb_base_charge_amt

						//-- cập nhật giá mua sau cùng --//
						UPDATE item set last_pur_price = round(:ldb_base_value/:ldb_qty,0) where object_ref_id = :ldb_item_id using rt_transaction;
						
					end if					
				end if
		
				//-- set các biến cho update item balance --//
				laa_data[1] = ldb_item_id														//-- Item_ID--//
				laa_data[2] = ldw_item.getitemnumber(ll_row,'COMPANY_ID')			//--Company_ID--//
				laa_data[3] = ldw_item.getitemnumber(ll_row,las_col_item[2])		//--Spec_ID--//
				
				//-- loc_id của ldw_item nhập kho hoặc xuất tùy vào khai báo stream_value struct--//
				if pos(vstr_streamvalue[li_idx].s_f_obj_column, 'loc_id' )> 0 and vstr_streamvalue[li_idx].s_f_obj_dwo = ldw_item.dataobject then
					lstr_data_from_to.aa_data_from[3] = ldw_item.getitemnumber(ll_row,las_col_f_object[4]) 
				elseif pos(vstr_streamvalue[li_idx].s_t_obj_column, 'loc_id' )> 0 and vstr_streamvalue[li_idx].s_t_obj_dwo = ldw_item.dataobject then
					lstr_data_from_to.aa_data_to[3] = ldw_item.getitemnumber(ll_row,las_col_t_object[4]) 
				end if				
//				laa_data[4] = ldw_item.getitemnumber(ll_row,las_col_item[5]) 		//--Loc_ID--//				
				laa_data[5] = datetime(vd_trans_date)										//--Trans_date--//
				laa_data[9] = gs_sob
				///-- kiểm tra item có quản lý số seri hoặc số lô không --//
				if this.f_get_lot_or_serial_yn_ex( laa_data[1], ls_lot_yn,ls_serial_yn, rt_transaction) = -1 then
					this.f_log_post(vdb_doc_id  , 'Mã hàng không hợp lệ:@'+ this.f_get_object_code_ex( ldb_item_id, rt_transaction  ))
					rollback using rt_transaction;
					destroy lds_stream
					return -1
				end if
				
				//-- ghi sổ giá trị hoặc ghi sổ số lượng với mã hàng ko quản lý số  seri --//
				if (ls_serial_yn = 'N' and ls_lot_yn = 'N'  and (ls_sv_qty_yn ='Y' or ls_sv_value_yn ='Y' ) ) then  //-- (vs_value_yn = 'Y' and lb_managed_qty) OR and vs_qty_yn = 'Y' 
		
//					laa_data[7] = '@'			//--Lot_no--//
//					laa_data[8] = '@'			//--Serial_no--//
					lstr_data_from_to.aa_data_from[1] ='@'
					lstr_data_from_to.aa_data_from[2] ='@'					
					
					if this.f_insert_item_balance_row_multi_ex( rt_transaction, ldw_item, ll_row, ldw_f_object, ldw_t_object, vd_trans_date, vs_post_type, las_col_item[], las_col_item_value[], las_col_f_object[], las_col_t_object[], laa_data[], ls_sv_qty_yn, ls_sv_value_yn, ldb_trans_uom, las_col_item[3], ldb_base_value, rstr_ds_4_posting,vs_qty_yn, vs_value_yn, lstr_data_from_to , vdb_doc_id, ls_related_doc_qty_yn) = -1 then 
						destroy lds_stream
						rollback using rt_transaction;
						return -1
					end if
					
					//-- update streamvalue theo chứng từ --//
					if  upper(vs_post_type) = 'POST' then		
						
						if  ls_sv_qty_yn = 'Y' and  ls_sv_value_yn = 'Y'  then //-- cập nhật stream_value GT --//
							ll_insertrow_sv = lds_stream.event e_addrow( )
							if ll_insertrow_sv < 1 then 
								this.f_log_post(vdb_doc_id  , 'Không insert được stream')
								destroy lds_stream
								rollback using rt_transaction;
								return -1
							end if							
							li_rtn = this.f_update_streamvalue_multi_ex( ldw_item, lds_stream, las_col_item_value[], las_col_item_value_sv[], '', ll_row, ll_insertrow_sv,ldw_f_object, las_col_f_object[], las_col_f_object_sv[],ldw_t_object, las_col_t_object[], las_col_t_object_sv[], ldw_currency,las_col_currency[], las_col_currency_sv[], ldb_value, ldb_base_value, rstr_ds_4_posting, lstr_data_from_to)
							if li_rtn = -1 then 
								destroy lds_stream
								rollback using rt_transaction;
								messagebox('Thông báo','Lỗi f_update_streamvalue_multi_ex')
								return -1
							end if
							
							li_rtn = this.f_postinsert_streamvalue(lds_stream , ll_insertrow_sv, ls_sv_value_yn,ls_sv_qty_yn, ls_item_ref_table, ldb_dwitem_ID, vs_doctype, vdb_doc_id, vd_trans_date, rt_transaction )
							if li_rtn = -1 or li_rtn = 0 then 
								this.f_log_post(vdb_doc_id  , 'Không insert được stream')
								destroy lds_stream
								rollback using rt_transaction;
								return -1
							end if													
						elseif ls_sv_qty_yn = 'Y' and  ls_sv_value_yn = 'N' and ( vs_value_yn = 'N' or ls_related_doc_qty_yn = 'N') then //-- cập nhật stream_value SL --//
							ll_insertrow_sv = lds_stream.event e_addrow( )
							if ll_insertrow_sv < 1 then 
								this.f_log_post(vdb_doc_id  , 'Không insert được stream')
								destroy lds_stream
								rollback using rt_transaction;
								return -1
							end if										
							li_rtn = this.f_update_streamvalue_multi_ex( ldw_item, lds_stream, las_col_item[], las_col_item_sv[], '', ll_row,ll_insertrow_sv, ldw_f_object, las_col_f_object[], las_col_f_object_sv[],ldw_t_object, las_col_t_object[], las_col_t_object_sv[], rstr_ds_4_posting, lstr_data_from_to)								
							if li_rtn = -1 then 
								destroy lds_stream
								rollback using rt_transaction;
								return -1
							end if					
								
							li_rtn = this.f_postinsert_streamvalue(lds_stream , ll_insertrow_sv, ls_sv_value_yn,ls_sv_qty_yn, ls_item_ref_table, ldb_dwitem_ID, vs_doctype, vdb_doc_id, vd_trans_date, rt_transaction )
							if li_rtn = -1 or li_rtn = 0 then 
								this.f_log_post(vdb_doc_id  , 'Không insert được stream')
								destroy lds_stream
								rollback using rt_transaction;
								return -1
							end if													
						end if											
					end if			
					
				elseif (ls_serial_yn = 'Y'  or ls_lot_yn = 'Y') and (ls_sv_qty_yn ='Y' or ls_sv_value_yn ='Y' ) then //-- mặt hàng có quản lý seri/lot --//
					if not isvalid(ldw_item_lot) then
						if ls_sv_qty_yn = 'Y'     then							
							this.f_log_post(vdb_doc_id  ,'DW item_lot trong streamvalue structure không hợp lệ')
							destroy lds_stream
							rollback using rt_transaction;
							return -1
						elseif ls_sv_value_yn = 'Y'  then
							lds_item_lot = create t_ds_db
							lds_item_lot.dataobject = 'ds_lot_line_4booking'
							ls_where = " matching.t_doc_id = "+string(vdb_doc_id)
							lds_item_lot.f_add_where( ls_where, 'AND')
							lds_item_lot.f_settransobject(rt_transaction )
							lds_item_lot.retrieve( )
		
							lds_item_lot.setfilter( "t_ref_id = "+string(ldb_dwitem_ID ))
							lds_item_lot.filter( )			
							//-- tính tổng số lượng các lot/seri --//
							if  lds_item_lot.rowcount( )	 > 0 then ldb_qty = double(lds_item_lot.describe("Evaluate('Sum("+las_col_item_lot[1]+")', 0)"))	
							
							li_rtn = this.f_booking_item_lot_multi_ex( rt_transaction,lds_stream ,ldw_item, ll_row, lds_item_lot, laa_data[], vd_trans_date, ls_lot_yn, ls_serial_yn, vs_qty_yn, vs_value_yn, &
														vs_post_type, ldb_value,ldb_base_value, ldb_qty, ldw_f_object, ldw_t_object, las_col_item[], las_col_item_lot[], las_col_item_value[], las_col_f_object[], las_col_t_object[],&								
														ldb_trans_uom,las_col_f_object_sv[], las_col_t_object_sv[],las_col_item_sv[], las_col_item_lot_sv[],las_col_item_value_sv[], ls_item_ref_table, &
														ls_samecol_string, vs_doctype, ldb_dwitem_id, vdb_doc_id, ldw_currency,las_col_currency[], las_col_currency_sv[], rstr_ds_4_posting)	
							if li_rtn = -1 then 
								return -1
							end if
						end if
					else
						ldw_item_lot.setfilter( "object_ref_id = "+string(ldb_dwitem_ID ))
						ldw_item_lot.filter( )					
						//-- tính tổng số lượng các lot/seri --//
						if  ldw_item_lot.rowcount( )	 > 0 then ldb_qty = double(ldw_item_lot.describe("Evaluate('Sum("+las_col_item_lot[1]+")', 0)"))		
						
						li_rtn = this.f_booking_item_lot_multi_ex( rt_transaction,lds_stream ,ldw_item, ll_row, ldw_item_lot, laa_data[], vd_trans_date, ls_lot_yn, ls_serial_yn, vs_qty_yn, vs_value_yn, &
													vs_post_type, ldb_value,ldb_base_value, ldb_qty, ldw_f_object, ldw_t_object, las_col_item[], las_col_item_lot[], las_col_item_value[], las_col_f_object[], las_col_t_object[],&								
													ldb_trans_uom,las_col_f_object_sv[], las_col_t_object_sv[],las_col_item_sv[], las_col_item_lot_sv[],las_col_item_value_sv[], ls_item_ref_table, &
													ls_samecol_string, vs_doctype, ldb_dwitem_id, vdb_doc_id, ldw_currency,las_col_currency[], las_col_currency_sv[], rstr_ds_4_posting)
						if li_rtn = -1 then 
							return -1
						end if
						
					end if					
		
					
				end if
			NEXT			
/*			
		else	//-- trường hợp sản lệnh sản xuất: chiết tiết vật liệu của thành phẩm--//		
			//-- xả filter nếu có --//

				FOR ll_row = 1 to ldw_item.rowcount( )			
					ldb_item_id =  ldw_item.getitemnumber(ll_row,las_col_item[1])
					ldb_dwitem_ID = ldw_item.getitemnumber( ll_row,'ID')
					ldb_trans_uom = ldw_item.getitemnumber(ll_row,las_col_item[4])
					if upper(this.f_get_object_type(ldb_item_id)) <> 'ITEM' then continue
					if lobj_ins.f_get_item_managed_qty_value(ldb_item_id ,ls_manage_qty_yn, ls_manage_value_yn) = -1 then return -1
					if vs_value_yn = 'Y' and ls_manage_value_yn ='Y' then
						ls_sv_value_yn ='Y' 
					else
						ls_sv_value_yn ='N' 
					end if
					if vs_qty_yn = 'Y'  and ls_manage_qty_yn ='Y' then
						ls_sv_qty_yn ='Y'
					else 
						ls_sv_qty_yn ='N'
					end if						
					//-- update item balance theo ngày --//
					ldb_qty = ldw_item.getitemnumber( ll_row,las_col_item[3])
					if isnull(ldb_qty) or ldb_qty = 0 then continue 	
					
					if ls_sv_value_yn = 'Y'  then
						ldb_value =  ldw_item.getitemnumber(ll_row,las_col_item_value[2]) //--trans value --//
						if isnull(ldb_value) then ldb_value =0			
						ldb_base_value =  ldw_item.getitemnumber(ll_row,las_col_item_value[3]) //--base value --//
						if isnull(ldb_base_value) then ldb_base_value =0			
						//-- Đảo dấu form kiểm kê, khi điều chỉnh chênh lệch thiếu --//
						if ldw_item.dataobject = 'd_inventory_line_counting_grid' and ldb_value < 0 then
							ldb_value = - ldb_value
						end if				
						//-- Đảo dấu form kiểm kê, khi điều chỉnh chênh lệch thiếu --//
						if ldw_item.dataobject = 'd_inventory_line_counting_grid' and ldb_base_value < 0 then
							ldb_base_value = - ldb_base_value
						end if							
						//-- Công thêm thuế nhập khẩu và phí mua hàng nếu có --//
						if this.classname( ) = 'u_pur_invoice' then
							SELECT sum(TRANS_AMT), sum(BASE_AMT) INTO :ldb_trans_charge_amt, :ldb_base_charge_amt
							FROM POST_LINE 
							WHERE DOC_ID = :vdb_doc_id AND DR_OBJECT_ID = :ldb_item_id AND SOB = :gs_sob AND OBJECT_REF_TABLE <> :ls_item_ref_table  USING rt_transaction;
							if isnull(ldb_trans_charge_amt) then ldb_trans_charge_amt = 0
							if isnull(ldb_base_charge_amt) then ldb_base_charge_amt = 0
							ldb_value += ldb_trans_charge_amt
							ldb_base_value += ldb_base_charge_amt
	
							//-- cập nhật giá mua sau cùng --//
							UPDATE item set last_pur_price = round(:ldb_base_value/:ldb_qty,0) where object_ref_id = :ldb_item_id using rt_transaction;
							
						end if					
					end if
			
					//-- set các biến cho update item balance --//
					laa_data[1] = ldb_item_id														//-- Item_ID--//
					laa_data[2] = ldw_item.getitemnumber(ll_row,'COMPANY_ID')			//--Company_ID--//
					laa_data[3] = ldw_item.getitemnumber(ll_row,las_col_item[2])		//--Spec_ID--//
					//-- loc_id của ldw_item nhập kho hoặc xuất tùy vào khai báo stream_value struct--//
					if pos(vstr_streamvalue[li_idx].s_f_obj_column, 'loc_id' )> 0 and vstr_streamvalue[li_idx].s_f_obj_dwo = ldw_item.dataobject then
						lstr_data_from_to.aa_data_from[3] = ldw_item.getitemnumber(ll_row,las_col_f_object[4]) 
					elseif pos(vstr_streamvalue[li_idx].s_t_obj_column, 'loc_id' )> 0 and vstr_streamvalue[li_idx].s_t_obj_dwo = ldw_item.dataobject then
						lstr_data_from_to.aa_data_to[3] = ldw_item.getitemnumber(ll_row,las_col_t_object[4]) 
					end if							
//					laa_data[4] = ldw_item.getitemnumber(ll_row,las_col_item[5]) 		//--Loc_ID--//
					laa_data[5] = datetime(vd_trans_date)										//--Trans_date--//
					laa_data[9] = gs_sob
					///-- kiểm tra item có quản lý số seri hoặc số lô không --//
					if lobj_ins.f_get_lot_or_serial_yn( laa_data[1], ls_lot_yn,ls_serial_yn) = -1 then
						gf_messagebox('m.b_doc.f_booking_item.01','Thông báo','Mã hàng không hợp lệ:@'+ lobj_ins.f_get_object_code( laa_data[1]),'stop','ok',1)		
						rollback using rt_transaction;
						destroy lds_stream
						return -1
					end if
					
					//-- ghi sổ giá trị hoặc ghi sổ số lượng với mã hàng ko quản lý số  seri --//
					if (ls_serial_yn = 'N' and ls_lot_yn = 'N' and (ls_sv_qty_yn ='Y' or ls_sv_value_yn ='Y' ) ) then  //-- (vs_value_yn = 'Y' and lb_managed_qty) OR and vs_qty_yn = 'Y' 
			
//						laa_data[7] = '@'			//--Lot_no--//
//						laa_data[8] = '@'			//--Serial_no--//
						lstr_data_from_to.aa_data_from[1] ='@'
						lstr_data_from_to.aa_data_from[2] ='@'							

						if this.f_insert_item_balance_row_multi_ex( rt_transaction, ldw_item, ll_row, ldw_f_object, ldw_t_object, vd_trans_date, vs_post_type, las_col_item[], las_col_item_value[], las_col_f_object[], las_col_t_object[], laa_data[], ls_sv_qty_yn, ls_sv_value_yn, ldb_trans_uom, las_col_item[3], ldb_base_value, rstr_ds_4_posting,vs_qty_yn, vs_value_yn, lstr_data_from_to, vdb_doc_id, ls_related_doc_qty_yn) = -1 then 
							destroy lds_stream
							rollback using rt_transaction;
							return -1
						end if
						
						//-- update streamvalue theo chứng từ --//
						if  upper(vs_post_type) = 'POST' then		
							
							if  ls_sv_qty_yn = 'Y' and  ls_sv_value_yn = 'Y'  then //-- cập nhật stream_value GT --//
								ll_insertrow_sv = lds_stream.event e_addrow( )
								if ll_insertrow_sv < 1 then 
									gf_messagebox('m.b_doc.f_booking_item.09','Thông báo','Không insert được stream','stop','ok',1)
									destroy lds_stream
									rollback using rt_transaction;
									return -1
								end if								
								li_rtn = this.f_update_streamvalue_multi_ex( ldw_item, lds_stream, las_col_item_value[], las_col_item_value_sv[], '', ll_row, ll_insertrow_sv,ldw_f_object, las_col_f_object[], las_col_f_object_sv[],ldw_t_object, las_col_t_object[], las_col_t_object_sv[], ldw_currency,las_col_currency[], las_col_currency_sv[], ldb_value, ldb_base_value, rstr_ds_4_posting, lstr_data_from_to)
								if li_rtn = -1 then 
									destroy lds_stream
									rollback using rt_transaction;
									return -1
								end if
								
								li_rtn = this.f_postinsert_streamvalue(lds_stream , ll_insertrow_sv, ls_sv_value_yn,ls_sv_qty_yn, ls_item_ref_table, ldb_dwitem_ID, vs_doctype, vdb_doc_id, vd_trans_date)
								if li_rtn = -1 or li_rtn = 0 then 
									gf_messagebox('m.b_doc.f_booking_item.09','Thông báo','Không insert được stream','stop','ok',1)
									destroy lds_stream
									rollback using rt_transaction;
									return -1
								end if						
								
							elseif  ls_sv_qty_yn = 'Y' and  ls_sv_value_yn = 'N' and ( vs_value_yn = 'N' or ls_related_doc_qty_yn = 'N')  then //-- cập nhật stream_value SL --//
								ll_insertrow_sv = lds_stream.event e_addrow( )
								if ll_insertrow_sv < 1 then 
									gf_messagebox('m.b_doc.f_booking_item.09','Thông báo','Không insert được stream','stop','ok',1)
									destroy lds_stream
									rollback using rt_transaction;
									return -1
								end if								
								li_rtn = this.f_update_streamvalue_multi_ex( ldw_item, lds_stream, las_col_item[], las_col_item_sv[], '', ll_row,ll_insertrow_sv, ldw_f_object, las_col_f_object[], las_col_f_object_sv[],ldw_t_object, las_col_t_object[], las_col_t_object_sv[], rstr_ds_4_posting, lstr_data_from_to)								
								if li_rtn = -1 then 
									destroy lds_stream
									rollback using rt_transaction;
									return -1
								end if					
									
								li_rtn = this.f_postinsert_streamvalue(lds_stream , ll_insertrow_sv, ls_sv_value_yn,ls_sv_qty_yn, ls_item_ref_table, ldb_dwitem_ID, vs_doctype, vdb_doc_id, vd_trans_date)
								if li_rtn = -1 or li_rtn = 0 then 
									gf_messagebox('m.b_doc.f_booking_item.09','Thông báo','Không insert được stream','stop','ok',1)
									destroy lds_stream
									rollback using rt_transaction;
									return -1
								end if						
								
							end if		
						end if			
						
					elseif (ls_serial_yn = 'Y'  or ls_lot_yn = 'Y') and  (ls_sv_qty_yn ='Y' or ls_sv_value_yn ='Y' ) then //-- mặt hàng có quản lý seri/lot --//
						if not isvalid(ldw_item_lot) then
							if ls_sv_qty_yn = 'Y'   then
								gf_messagebox('m.b_doc.f_booking_item.03','Thông báo','DW item_lot trong streamvalue structure không hợp lệ','stop','ok',1)		
								destroy lds_stream
								rollback using rt_transaction;
								return -1
							elseif ls_sv_value_yn = 'Y'  then
								lds_item_lot = create t_ds_db
								lds_item_lot.dataobject = 'ds_lot_line_4booking'
								ls_where = " matching.t_doc_id = "+string(vdb_doc_id)
								lds_item_lot.f_add_where( ls_where, 'AND')
								lds_item_lot.f_settransobject(rt_transaction )
								lds_item_lot.retrieve( )
			
								lds_item_lot.setfilter( "t_ref_id = "+string(ldb_dwitem_ID ))
								lds_item_lot.filter( )			
								//-- tính tổng số lượng các lot/seri --//
								if  lds_item_lot.rowcount( )	 > 0 then ldb_qty = double(lds_item_lot.describe("Evaluate('Sum("+las_col_item_lot[1]+")', 0)"))	
								
								li_rtn = this.f_booking_item_lot_multi_ex( rt_transaction,lds_stream ,ldw_item, ll_row, lds_item_lot, laa_data[], vd_trans_date, ls_lot_yn, ls_serial_yn, vs_qty_yn, vs_value_yn, &
															vs_post_type, ldb_value,ldb_base_value, ldb_qty, ldw_f_object, ldw_t_object, las_col_item[], las_col_item_lot[], las_col_item_value[], las_col_f_object[], las_col_t_object[],&								
															ldb_trans_uom,las_col_f_object_sv[], las_col_t_object_sv[],las_col_item_sv[], las_col_item_lot_sv[],las_col_item_value_sv[], ls_item_ref_table, &
															ls_samecol_string, vs_doctype, ldb_dwitem_id, vdb_doc_id, ldw_currency,las_col_currency[], las_col_currency_sv[], rstr_ds_4_posting)	
								if li_rtn = -1 then return -1
								
							end if
						else
							ldw_item_lot.setfilter( "object_ref_id = "+string(ldb_dwitem_ID ))
							ldw_item_lot.filter( )					
							//-- tính tổng số lượng các lot/seri --//
							if  ldw_item_lot.rowcount( )	 > 0 then ldb_qty = double(ldw_item_lot.describe("Evaluate('Sum("+las_col_item_lot[1]+")', 0)"))		

							li_rtn = this.f_booking_item_lot_multi_ex( rt_transaction,lds_stream ,ldw_item, ll_row, ldw_item_lot, laa_data[], vd_trans_date, ls_lot_yn, ls_serial_yn, vs_qty_yn, vs_value_yn, &
														vs_post_type, ldb_value,ldb_base_value, ldb_qty, ldw_f_object, ldw_t_object, las_col_item[], las_col_item_lot[], las_col_item_value[], las_col_f_object[], las_col_t_object[],&								
														ldb_trans_uom,las_col_f_object_sv[], las_col_t_object_sv[],las_col_item_sv[], las_col_item_lot_sv[],las_col_item_value_sv[], ls_item_ref_table, &
														ls_samecol_string, vs_doctype, ldb_dwitem_id, vdb_doc_id, ldw_currency,las_col_currency[], las_col_currency_sv[], rstr_ds_4_posting)	
							if li_rtn = -1 then return -1
						end if														
					end if
				NEXT									
													
		end if
*/		
	//-- update cot sku ,cogs--//
	if ldw_item.update() = -1 then
		this.f_log_post(vdb_doc_id  ,'Không cập nhật được số lượng theo đơn vị tồn kho:@' +rt_transaction.sqlerrtext )
		rollback using rt_transaction;
		destroy lds_stream
		return -1
	end if	
	ldw_item.resetupdate()
	
	if lds_stream.update(true,false ) = -1 then
		this.f_log_post(vdb_doc_id  ,'Không cập nhật được số lượng theo đơn vị tồn kho:@' +rt_transaction.sqlerrtext )
		rollback using rt_transaction;
		destroy lds_stream
		return -1	
	end if
	lds_stream.resetupdate( )
	
	
	if ls_original_filter_lot <> '?' and ls_original_filter_lot <> '' then
		lc_string.f_globalreplace(ls_original_filter_lot ,'~~','')
		ldw_item_lot.setfilter( ls_original_filter_lot)
		ldw_item_lot.filter( )
	end if
NEXT

//-- chèn code kiểm tra stream đã đc ghi ghi vào bảng chưa (Long)--//
		Select count(stream_value.item_ref_id) into :ll_count
		From stream_value
		Where stream_value.doc_ref_id = :vdb_doc_id using rt_transaction;
		if ll_count = 0 and ls_manage_qty_yn ='Y'  and vs_qty_yn = 'Y' and upper(vs_post_type) = 'POST'  then
			this.f_log_post(vdb_doc_id  ,'Cập nhật ghi sổ không thành công f_booking_item_multi_ex(490)' )
			Rollback using rt_transaction;
			Update document set status = 'new' where id = :vdb_doc_id using rt_transaction;
			commit  using rt_transaction;
			return -1
		end if
//----------------------------------------------------------------------------//
destroy lds_stream
return 1
end function

public function long f_unbooking_ex (double vdb_doc_id, double vdb_doc_version, string vs_doctype, date vd_trans_date, string vs_qty_yn, string vs_value_yn, s_str_streamvalue vstr_streamvalue[], s_str_ds_4_posting vstr_ds_4_posting, ref t_transaction rt_transaction);//Hàm sửa ghi sổ chứng từ
//Tham số: vl_doc_id :id của chứng từ (document)

t_ds_db 			lds_obj_post
long				ll_rtn
double			ladb_related_doc_id[]


//delete ledger_trans where doc_ref_id =:vdb_doc_id using rt_transaction;
//if rt_transaction.sqlcode = -1 then 
//	gf_messagebox('m.b_doc.f_unbooking.01','Thông báo','Lỗi xóa dữ liệu:@'+rt_transaction.sqlerrtext,'stop','ok',1)
//	rollback using lt_transaction;
//	return -1
//end if

delete object_trans where doc_ref_id =:vdb_doc_id using rt_transaction;
if rt_transaction.sqlcode = -1 then 
	gf_messagebox('m.b_doc.f_unbooking.01','Thông báo','Lỗi xóa dữ liệu:@'+rt_transaction.sqlerrtext,'stop','ok',1)
	rollback using rt_transaction;
	return -1
end if


//-- cập nhật object balance --//
//-- update object_balance đối tượng Nợ--//
lds_obj_post = create t_ds_db
lds_obj_post.dataobject = 'ds_obj_balance_post_dr'
if this.f_insert_object_balance( vdb_doc_id,  vd_trans_date, rt_transaction, lds_obj_post, 'unpost',gs_sob) <> 1 then
	destroy lds_obj_post
	return -1	
end if
//-- update ledger_balance đối tượng Nợ--//
//lds_obj_post.dataobject = 'ds_ledger_balance_post_dr'
//if this.f_insert_object_balance( vdb_doc_id,  vd_trans_date, rt_transaction, lds_obj_post, 'unpost',gs_sob) <> 1 then
//	destroy lds_obj_post
//	return -1	
//end if
//-- update object_balance đối tượng Có--//
lds_obj_post.dataobject = 'ds_obj_balance_post_cr'
if this.f_insert_object_balance( vdb_doc_id,  vd_trans_date, rt_transaction, lds_obj_post, 'unpost',gs_sob) <> 1 then
	destroy lds_obj_post
	return -1	
end if
//-- update ledger_balance đối tượng Có--//
//lds_obj_post.dataobject = 'ds_ledger_balance_post_cr'
//if this.f_insert_object_balance( vdb_doc_id,  vd_trans_date, rt_transaction, lds_obj_post, 'unpost',gs_sob) <> 1 then
//	destroy lds_obj_post
//	return -1	
//end if

//B3: Xóa bảng Trans
delete stream_value where doc_ref_id =:vdb_doc_id using rt_transaction;
if rt_transaction.sqlcode = -1 then
	gf_messagebox('m.b_doc.f_unbooking.01','Thông báo','Lỗi xóa dữ liệu:@'+rt_transaction.sqlerrtext,'stop','ok',1)
	rollback using rt_transaction;
	return -1
end if
//-- cập nhật lại bảng item_balance --//
this.f_booking_item_multi_ex( vdb_doc_id, vdb_doc_version, vs_doctype , rt_transaction, vd_trans_date, 'unpost', vs_qty_yn, vs_value_yn, ladb_related_doc_id[], vstr_streamvalue[], vstr_ds_4_posting )
//if this.f_booking_item_ex(lt_transaction, ld_trans_date, 'unpost', vs_qty_yn, vs_value_yn, ladb_related_doc_id[]) = -1 then
//	return -1
//end if


//-- xóa post line --//
delete post_line where doc_id =:vdb_doc_id using rt_transaction;
if rt_transaction.sqlcode = -1 then
	gf_messagebox('m.b_doc.f_unbooking.01','Thông báo','Lỗi xóa dữ liệu:@'+rt_transaction.sqlerrtext,'stop','ok',1)
	rollback using rt_transaction;
	return -1
end if

destroy lds_obj_post

return ll_rtn
end function

public function integer f_get_round_diff (ref t_transaction rt_transaction, ref powerobject rpo_item, double vdb_row, double vdb_item_id, double vdb_trans_uom, string vs_qty_column, ref double rdb_round_diff);/**********************************************************************************
Chức năng: Lấy số chênh lệch làm tròn khi quy đổi đơn vị giao dịch sang đơn vị tốn kho, khi sửa ghi sồ (UNPOST)
 				 # Chênh lệch =  (SL giao dịch x hệ dố quy đổi + SL chênh lệch hiện tại cùa mã hàng) - SL sku 
				 # Chênh lệch âm: thể hiện tồn kho hiện tại > hơn thực tế
				 # Chênh lệch dương: thể hiện tồn kho hiện tại < hơn thực tế
------------------------------------------------------------------------------------------------------------------------------------
Tham số: 
			- rt_transaction : connection
			- rdw_item: datawindow chứa mã hàng giao dịch
			- vdb_row: số row đang xét
			- rdb_qty_sku: số quy đổi theo đơn vị SKU
Return: 1 thành công, -1 lỗi
==============================================================*/
double				ldb_qty, ldb_qty_sku, ldba_convert_data[], ldb_round_diff
int						li_rtn

c_unit_instance_Ex	lc_unit_instance

//-- Kiểm tra dw --//
if not isvalid(rpo_item) then 
	gf_messagebox('m.b_doc.f_set_qty_sku.01','Thông báo','DW chứa item không VALID','exclamation','ok',1)
	rollback using rt_transaction;
	return -1	
end if

//-- kiểm tra số row --//
if vdb_row < 1 then 
	gf_messagebox('m.b_doc.f_set_qty_sku.02','Thông báo','Số dòng không hợp lệ','exclamation','ok',1)
	rollback using rt_transaction;
	return -1	
end if
	
//-- Lấy item, số lượng và đơn vị giao dịch --//
if isnull(vdb_item_id) or vdb_item_id = 0 then
	gf_messagebox('m.b_doc.f_set_qty_sku.04','Thông báo','Không có mã hàng trong giao dịch','exclamation','ok',1)
	rollback using rt_transaction;
	return -1		
end if
if isnull(vdb_trans_uom) or vdb_trans_uom = 0 then
	gf_messagebox('m.b_doc.f_set_qty_sku.05','Thông báo','Không tìm thấy đơn vị giao dịch','exclamation','ok',1)
	rollback using rt_transaction;
	return -1		
end if

ldb_qty = rpo_item.dynamic getitemnumber(vdb_row,vs_qty_column)
if isnull(ldb_qty) then  ldb_qty = 0 

//-- Lấy sku_qty của chứng từ --//
ldb_qty_sku =  rpo_item.dynamic getitemnumber(vdb_row,vs_qty_column+'_sku')
if isnull(ldb_qty_sku) then ldb_qty_sku = 0
//-- lấy round_diff hiện tại trước lúc sửa ghi sổ
select count(id) into :li_rtn from item where object_ref_id = :vdb_item_id using rt_transaction;
if li_rtn = 1 then
	select round_diff into :ldb_round_diff from item where object_ref_id = :vdb_item_id using rt_transaction;
end if

//-- tính số lượng quy đổi đơn vị --//
lc_unit_instance = create c_unit_instance_Ex
li_rtn = lc_unit_instance.f_get_data_4_conversion_unit_ex( vdb_trans_uom, vdb_item_id, ldb_qty, ldba_convert_data[], rt_transaction)
ldb_round_diff =  ldba_convert_data[1] + ldba_convert_data[2] + ldb_round_diff - ldb_qty_sku
rdb_round_diff = ldb_round_diff
destroy lc_unit_instance
return 1
end function

public subroutine f_unpost (string vs_server, string vs_login, string vs_pwd, double vdb_company_id, double vdb_branch_id, double vdb_user_id, string vs_sob, string vs_dwo, string vs_docs_id, s_str_streamvalue vastr_streamvalue[], s_str_ds_4_posting vstr_ds_4_posting);
t_ds_db					ldsa_details[]

double					ldb_doc_id, ldb_trans_hdr_id, ladb_related_doc_id[],ldb_branch_id, ldb_doc_version
any 						la_data[], la_null[]
string						ls_obj_name,ls_qty_yn,ls_value_yn, ls_respond, ls_doctype, ls_post_message_yn, ls_ts_qty, ls_ts_value
string						ls_dwdetail_string, ls_where, ls_sort
long 						ll_rtn, ll_currentrow,ll_count,ll_count_p, ll_count_l, ll_count_o,ll_count_it
int							li_cnt, li_idx
date						ld_trans_date,ld_sysdate
boolean					lb_value_posted, lb_qty_posted, lb_create_postline_yn,lb_err


t_ds_db					lds_docs
t_transaction			lt_transaction

lt_transaction = create t_transaction
lt_transaction.DBMS = 'O10 Oracle10g (10.1.0)'
lt_transaction.ServerName = vs_server
lt_transaction.LogId = vs_login
lt_transaction.LogPass = vs_pwd
lt_transaction.AutoCommit = False
lt_transaction.DBParm = "CommitOnDisconnect='No',PBCatalogOwner='"+ vs_login +"'"
lt_transaction.database = 'multithread'
connect using	lt_transaction;	

string ls_errorText
if lt_transaction.sqlcode <> 0 then
	ls_errorText = lt_transaction.sqlerrtext 
	if isnull(ls_errortext) then ls_errortext = "(empty errortext)"
	messagebox("Database Error", "Please contact Support. Could not connect to the database: " + "~r~n~r~n" + ls_errortext)
	return 
end if

g_user = create c_user_instance
g_user.f_init_ex( vdb_user_id,lt_transaction )
gi_user_comp_id =vdb_company_id
gdb_branch = vdb_branch_id
gi_userid = vdb_user_id
gs_sob = vs_sob


select trunc(sysdate)  into :ld_sysdate from dual using lt_transaction;

lds_docs = create t_ds_db
lds_docs.dataobject = vs_dwo
la_data[1]=double(vs_docs_id)
lds_docs.f_add_where( 'id', la_data[]) 
lds_docs.f_get_doc_trace(  ls_where, ls_sort)
lds_docs.f_add_where( ls_where, ' AND ')
lds_docs.f_settransobject(lt_transaction )
li_cnt = lds_docs.retrieve( )

FOR li_idx = 1 to li_cnt
	ldb_doc_id = lds_docs.getitemnumber(li_idx, 'id')
	ldb_doc_version =  lds_docs.getitemnumber(li_idx, 'version_id')
	ldb_branch_id = lds_docs.getitemnumber(li_idx, 'branch_id')
	ldb_trans_hdr_id = lds_docs.getitemnumber( li_idx, 'trans_hdr_id')
	ls_doctype = lds_docs.getitemstring(li_idx,'doc_type')
	ld_trans_date = date(lds_docs.getitemdatetime( li_idx, 'trans_date'))
	this.f_get_qty_and_value_yn_sob( ldb_doc_id, ls_qty_yn,ls_value_yn, lt_transaction)
	this.f_unbooking_ex( ldb_doc_id, ldb_doc_version, ls_doctype, ld_trans_date, ls_qty_yn,ls_value_yn, vastr_streamvalue[], vstr_ds_4_posting,lt_transaction)

NEXT
commit using lt_transaction;	
disconnect using	lt_transaction;	
destroy lt_transaction
end subroutine

public function double f_get_last_pur_price (double vdb_item_id, ref t_transaction rt_transaction);double			ldb_last_pur_price

if isnull(vdb_item_id) or vdb_item_id = 0 then return -1

select last_pur_price into :ldb_last_pur_price from item where object_ref_id = :vdb_item_id using rt_transaction;

if isnull(ldb_last_pur_price) or ldb_last_pur_price = 0 then
	
	ldb_last_pur_price = this.f_get_moving_avg( vdb_item_id, rt_transaction)
end if

return ldb_last_pur_price
end function

public function double f_get_moving_avg (double vdb_item_id, ref t_transaction rt_transaction);double			ldb_moving_avg


if isnull(vdb_item_id) or vdb_item_id = 0 then return -1

select moving_avg into :ldb_moving_avg from item where object_ref_id = :vdb_item_id using t_Transaction;

if isnull(ldb_moving_avg) then ldb_moving_avg = 0

return ldb_moving_avg
end function

public function integer f_get_posting_type_account (t_ds_db vds_trans_setup, string vs_dwo_get_amount, string vs_posting_type, ref s_str_post_account rstr_post_acct_spec[], ref s_str_post_account rstr_post_acct_group[], ref s_str_post_account rstr_post_acct_all[], ref s_str_post_info rstr_post_info);
string					ls_find, ls_dr_setup_type, ls_cr_setup_type, ls_condition_val, ls_dr_objtype, ls_cr_objtype, ls_obj_str
long					ll_row_found
int						li_spec_cnt, li_grp_cnt, li_All_cnt
double				ldb_obj_id, ldb_obj_grp
boolean				lb_fistfound = true
 
if vs_posting_type = 'NULL' then
	ls_find = " isnull(posting_type)" +" AND DW_GET_AMOUNT	= '"+ vs_dwo_get_amount + "'"
else
	ls_find = " posting_type ='" +vs_posting_type+"' AND DW_GET_AMOUNT	= '"+ vs_dwo_get_amount +"'"
end if

ll_row_found = vds_trans_setup.find(ls_find, 1, vds_trans_setup.rowcount() )
DO while ll_row_found > 0 
	
	if lb_fistfound then
		lb_fistfound = false
		rstr_post_info.s_col_amt = vds_trans_setup.getitemstring(ll_row_found, 'col_get_amount')	
		rstr_post_info.s_col_base_amt = vds_trans_setup.getitemstring(ll_row_found, 'col_get_base_amount')+';'	
		rstr_post_info.s_dr_dw_object = vds_trans_setup.getitemstring(ll_row_found, 'dr_dw_object')	
		rstr_post_info.s_dr_object_col = vds_trans_setup.getitemstring(ll_row_found, 'dr_object_col')	
		rstr_post_info.s_cr_dw_object = vds_trans_setup.getitemstring(ll_row_found, 'cr_dw_object')	
		rstr_post_info.s_cr_object_col = vds_trans_setup.getitemstring(ll_row_found, 'cr_object_col')	
		rstr_post_info.s_dw_trans_text = vds_trans_setup.getitemstring(ll_row_found, 'dw_trans_text')
		rstr_post_info.s_col_trans_text = vds_trans_setup.getitemstring(ll_row_found, 'column_trans_text')		
 		rstr_post_info.s_dr_obj_type =  vds_trans_setup.getitemstring(ll_row_found, 'dr_obj_type') 
 		rstr_post_info.s_cr_obj_type =  vds_trans_setup.getitemstring(ll_row_found, 'cr_obj_type') 
		rstr_post_info.db_dr_object_id =  vds_trans_setup.getitemnumber(ll_row_found, 'DR_OBJ_INSTANCE_ID') 
		rstr_post_info.db_cr_object_id =   vds_trans_setup.getitemnumber(ll_row_found, 'CR_OBJ_INSTANCE_ID') 
		
		if isnull(rstr_post_info.s_col_amt) or rstr_post_info.s_col_amt = '' then
			gf_messagebox('m.b_doc.f_get_posting_type_account.01','Thông báo','Giao dịch ghi sổ chưa cài đặt cột giá trị @'+vs_posting_type,'exclamation','ok',1)
			return -1	
		end if		
		if isnull(rstr_post_info.s_col_base_amt) or rstr_post_info.s_col_base_amt = '' then
			gf_messagebox('m.b_doc.f_get_posting_type_account.02','Thông báo','Giao dịch ghi sổ chưa cài đặt cột giá trị quy đổi @'+vs_posting_type,'exclamation','ok',1)
			return -1	
		end if			
		if (isnull(rstr_post_info.s_dr_dw_object) or rstr_post_info.s_dr_dw_object = '') and rstr_post_info.s_dr_obj_type <> 'ACCOUNT' and rstr_post_info.db_dr_object_id = 0  then
			gf_messagebox('m.b_doc.f_get_posting_type_account.03','Thông báo','Giao dịch ghi sổ chưa cài đặt DW đối tượng NỢ @'+vs_posting_type,'exclamation','ok',1)
			return -1	
		end if				
		if ( isnull(rstr_post_info.s_dr_object_col) or rstr_post_info.s_dr_object_col = '')  and rstr_post_info.s_dr_obj_type <> 'ACCOUNT' and rstr_post_info.db_dr_object_id = 0  then
			gf_messagebox('m.b_doc.f_get_posting_type_account.03','Thông báo','Giao dịch ghi sổ chưa cài đặt cột đối tượng NỢ @'+vs_posting_type,'exclamation','ok',1)
			return -1	
		end if						
		if ( isnull(rstr_post_info.s_cr_dw_object) or rstr_post_info.s_cr_dw_object = '' ) and rstr_post_info.s_cr_obj_type <> 'ACCOUNT' and rstr_post_info.db_cr_object_id = 0 	then
			gf_messagebox('m.b_doc.f_get_posting_type_account.03','Thông báo','Giao dịch ghi sổ chưa cài đặt DW đối tượng CÓ @'+vs_posting_type,'exclamation','ok',1)
			return -1	
		end if				
		if ( isnull(rstr_post_info.s_cr_object_col) or rstr_post_info.s_cr_object_col = '') and rstr_post_info.s_cr_obj_type<> 'ACCOUNT' and rstr_post_info.db_cr_object_id = 0  then
			gf_messagebox('m.b_doc.f_get_posting_type_account.03','Thông báo','Giao dịch ghi sổ chưa cài đặt cột đối tượng CÓ@'+vs_posting_type,'exclamation','ok',1)
			return -1	
		end if								
	end if
	
	
	ls_dr_setup_type =  vds_trans_setup.getitemstring(ll_row_found, 'dr_setup_type')
	ls_cr_setup_type = vds_trans_setup.getitemstring(ll_row_found, 'cr_setup_type')
	if ls_dr_setup_type = 'specific' or ls_cr_setup_type = 'specific' then		
		rstr_post_info.s_dw_criterial = vds_trans_setup.getitemstring(ll_row_found, 'dr_dw_criterial')
		rstr_post_info.s_col_criterial = vds_trans_setup.getitemstring(ll_row_found, 'dr_col_criterial')			
		ls_condition_val = vds_trans_setup.getitemstring(ll_row_found, 'dr_value_criterial')			
		
		if isnull(rstr_post_info.s_dw_criterial) or rstr_post_info.s_dw_criterial = '' then
			rstr_post_info.s_dw_criterial = vds_trans_setup.getitemstring(ll_row_found, 'cr_dw_criterial')
			rstr_post_info.s_col_criterial = vds_trans_setup.getitemstring(ll_row_found, 'cr_col_criterial')
			ls_condition_val = vds_trans_setup.getitemstring(ll_row_found, 'cr_value_criterial')	
		end if
		if isnull(ls_condition_val) then ls_condition_val =''
		
		if  ls_dr_setup_type = 'specific' then
			ldb_obj_id = vds_trans_setup.getitemnumber(ll_row_found, 'DR_OBJ_INSTANCE_ID')
			ls_obj_str = string(ldb_obj_id)
			if ls_cr_setup_type = 'group' then
				ldb_obj_grp = vds_trans_setup.getitemnumber(ll_row_found, 'CR_POSTING_GROUP')
				ls_obj_str += ';'+string(ldb_obj_grp)
			end if
		end if
		if  ls_cr_setup_type = 'specific' then
			ldb_obj_id = vds_trans_setup.getitemnumber(ll_row_found, 'CR_OBJ_INSTANCE_ID')
			if ls_dr_setup_type = 'group' then
				ldb_obj_grp = vds_trans_setup.getitemnumber(ll_row_found, 'DR_POSTING_GROUP')		
				ls_obj_str = string(ldb_obj_grp)
			end if
			if ls_obj_str <> '' then ls_obj_str += ';'
			ls_obj_str += string(ldb_obj_id)
		end if
		if isnull(ldb_obj_id) or ldb_obj_id = 0 then
			gf_messagebox('m.b_doc.f_get_posting_type_account.01','Thông báo','Chưa cài đặt đối tượng ghi sổ cụ thể:@'+ vs_posting_type,'stop','ok',1)
			return -1
		end if
		ls_dr_objtype = vds_trans_setup.getitemstring(ll_row_found, 'dr_obj_type')
		ls_cr_objtype = vds_trans_setup.getitemstring(ll_row_found, 'cr_obj_type')
		
		li_spec_cnt++
		rstr_post_info.s_spec_idx += ';'+ls_dr_objtype+';'+ls_cr_objtype+';'+ ls_obj_str +';'+ls_condition_val+'['+string(li_spec_cnt)+ ']'
		//-- clear gia tri cua bien --//
		ls_obj_str = ''
		
		rstr_post_acct_spec[li_spec_cnt].s_setup_type = ls_dr_setup_type+';'+ls_cr_setup_type+';'
		rstr_post_acct_spec[li_spec_cnt].s_posting_type = vs_posting_type
		rstr_post_acct_spec[li_spec_cnt].db_dr_account = vds_trans_setup.getitemnumber(ll_row_found, 'DR_ACCT_ID')
		rstr_post_acct_spec[li_spec_cnt].db_cr_account = vds_trans_setup.getitemnumber(ll_row_found, 'CR_ACCT_ID')
		rstr_post_acct_spec[li_spec_cnt].db_dr_subaccount = vds_trans_setup.getitemnumber(ll_row_found, 'DR_SUBACCT_ID')
		rstr_post_acct_spec[li_spec_cnt].db_cr_subaccount = vds_trans_setup.getitemnumber(ll_row_found, 'CR_SUBACCT_ID')
		rstr_post_acct_spec[li_spec_cnt].s_col_amt = vds_trans_setup.getitemstring(ll_row_found, 'col_get_amount')	
		rstr_post_acct_spec[li_spec_cnt].s_col_base_amt = vds_trans_setup.getitemstring(ll_row_found, 'col_get_base_amount')	
		if  pos( rstr_post_info.s_col_base_amt, rstr_post_acct_spec[li_spec_cnt].s_col_base_amt +';') = 0 then
			rstr_post_info.s_col_base_amt +=  rstr_post_acct_spec[li_spec_cnt].s_col_base_amt + ';'
		end if
		rstr_post_acct_spec[li_spec_cnt].s_trans_text = vds_trans_setup.getitemstring(ll_row_found, 'trans_text')
		if isnull(rstr_post_acct_spec[li_spec_cnt].s_trans_text) then rstr_post_acct_spec[li_spec_cnt].s_trans_text =''
		rstr_post_acct_spec[li_spec_cnt].s_post_type_text = rstr_post_acct_spec[li_spec_cnt].s_trans_text 
		rstr_post_acct_spec[li_spec_cnt].s_dr_object_type = vds_trans_setup.getitemstring(ll_row_found, 'dr_obj_type')
		rstr_post_acct_spec[li_spec_cnt].s_cr_object_type = vds_trans_setup.getitemstring(ll_row_found, 'cr_obj_type')		
		rstr_post_acct_spec[li_spec_cnt].s_val_condition = ls_condition_val
		rstr_post_acct_spec[li_spec_cnt].s_dr_dw_object = vds_trans_setup.getitemstring(ll_row_found, 'dr_dw_object')	
		rstr_post_acct_spec[li_spec_cnt].s_dr_object_col = vds_trans_setup.getitemstring(ll_row_found, 'dr_object_col')	
		rstr_post_acct_spec[li_spec_cnt].s_cr_dw_object = vds_trans_setup.getitemstring(ll_row_found, 'cr_dw_object')	
		rstr_post_acct_spec[li_spec_cnt].s_cr_object_col = vds_trans_setup.getitemstring(ll_row_found, 'cr_object_col')		
		
 		rstr_post_acct_spec[li_spec_cnt].s_dr_obj_type =  vds_trans_setup.getitemstring(ll_row_found, 'dr_obj_type') 
 		rstr_post_acct_spec[li_spec_cnt].s_cr_obj_type =  vds_trans_setup.getitemstring(ll_row_found, 'cr_obj_type') 		
		
	elseif ls_dr_setup_type = 'group' or ls_cr_setup_type = 'group' then
		rstr_post_info.s_dw_criterial = vds_trans_setup.getitemstring(ll_row_found, 'dr_dw_criterial')
		rstr_post_info.s_col_criterial = vds_trans_setup.getitemstring(ll_row_found, 'dr_col_criterial')			
		ls_condition_val = vds_trans_setup.getitemstring(ll_row_found, 'dr_value_criterial')	
		
		if isnull(rstr_post_info.s_dw_criterial) or rstr_post_info.s_dw_criterial = '' then
			rstr_post_info.s_dw_criterial = vds_trans_setup.getitemstring(ll_row_found, 'cr_dw_criterial')
			rstr_post_info.s_col_criterial = vds_trans_setup.getitemstring(ll_row_found, 'cr_col_criterial')
			ls_condition_val = vds_trans_setup.getitemstring(ll_row_found, 'cr_value_criterial')	
		end if
		if isnull(ls_condition_val) then ls_condition_val =''
				
		if  ls_dr_setup_type = 'group' then
			ldb_obj_id = vds_trans_setup.getitemnumber(ll_row_found, 'DR_POSTING_GROUP')
			ls_obj_str = string(ldb_obj_id)
			if ls_cr_setup_type = 'group' then
				ldb_obj_grp = vds_trans_setup.getitemnumber(ll_row_found, 'CR_POSTING_GROUP')
				ls_obj_str += ';'+string(ldb_obj_grp)
			end if
		elseif ls_cr_setup_type = 'group' then
			ldb_obj_id = vds_trans_setup.getitemnumber(ll_row_found, 'CR_POSTING_GROUP')
			ls_obj_str += string(ldb_obj_id)			
		end if
		
		
		if isnull(ldb_obj_id) or ldb_obj_id = 0 then
			gf_messagebox('m.b_doc.f_get_posting_type_account.02','Thông báo','Chưa cài đặt nhóm ghi sổ cụ thể:@'+ vs_posting_type,'stop','ok',1)
			return -1
		end if
		ls_dr_objtype = vds_trans_setup.getitemstring(ll_row_found, 'dr_obj_type')
		ls_cr_objtype = vds_trans_setup.getitemstring(ll_row_found, 'cr_obj_type')
		
		li_grp_cnt++
		rstr_post_info.s_group_idx += ';'+ls_dr_objtype+';'+ls_cr_objtype+ ';'+ ls_obj_str +';'+ls_condition_val+'['+string(li_grp_cnt)+ ']'
		//-- clear gia tri cua bien --//
		ls_obj_str = ''
		
		rstr_post_acct_group[li_grp_cnt].s_setup_type = ls_dr_setup_type+';'+ls_cr_setup_type+';'
		rstr_post_acct_group[li_grp_cnt].s_posting_type = vs_posting_type
		rstr_post_acct_group[li_grp_cnt].db_dr_account = vds_trans_setup.getitemnumber(ll_row_found, 'DR_ACCT_ID')
		rstr_post_acct_group[li_grp_cnt].db_cr_account = vds_trans_setup.getitemnumber(ll_row_found, 'CR_ACCT_ID')
		rstr_post_acct_group[li_grp_cnt].db_dr_subaccount = vds_trans_setup.getitemnumber(ll_row_found, 'DR_SUBACCT_ID')
		rstr_post_acct_group[li_grp_cnt].db_cr_subaccount = vds_trans_setup.getitemnumber(ll_row_found, 'CR_SUBACCT_ID')
		rstr_post_acct_group[li_grp_cnt].s_col_amt = vds_trans_setup.getitemstring(ll_row_found, 'col_get_amount')	
		rstr_post_acct_group[li_grp_cnt].s_col_base_amt = vds_trans_setup.getitemstring(ll_row_found, 'col_get_base_amount')			
		if  pos( rstr_post_info.s_col_base_amt , rstr_post_acct_group[li_grp_cnt].s_col_base_amt +';') = 0 then
			rstr_post_info.s_col_base_amt += rstr_post_acct_group[li_grp_cnt].s_col_base_amt + ';'
		end if		
		rstr_post_acct_group[li_grp_cnt].s_trans_text = vds_trans_setup.getitemstring(ll_row_found, 'trans_text')
		if isnull(rstr_post_acct_group[li_grp_cnt].s_trans_text) then rstr_post_acct_group[li_grp_cnt].s_trans_text =''
		rstr_post_acct_group[li_grp_cnt].s_post_type_text = rstr_post_acct_group[li_grp_cnt].s_trans_text
		rstr_post_acct_group[li_grp_cnt].s_dr_object_type = vds_trans_setup.getitemstring(ll_row_found, 'dr_obj_type')
		rstr_post_acct_group[li_grp_cnt].s_cr_object_type = vds_trans_setup.getitemstring(ll_row_found, 'cr_obj_type')
		rstr_post_acct_group[li_grp_cnt].s_val_condition = ls_condition_val		
		rstr_post_acct_group[li_grp_cnt].s_dr_dw_object = vds_trans_setup.getitemstring(ll_row_found, 'dr_dw_object')	
		rstr_post_acct_group[li_grp_cnt].s_dr_object_col = vds_trans_setup.getitemstring(ll_row_found, 'dr_object_col')	
		rstr_post_acct_group[li_grp_cnt].s_cr_dw_object = vds_trans_setup.getitemstring(ll_row_found, 'cr_dw_object')	
		rstr_post_acct_group[li_grp_cnt].s_cr_object_col = vds_trans_setup.getitemstring(ll_row_found, 'cr_object_col')			
		
 		rstr_post_acct_group[li_grp_cnt].s_dr_obj_type =  vds_trans_setup.getitemstring(ll_row_found, 'dr_obj_type') 
 		rstr_post_acct_group[li_grp_cnt].s_cr_obj_type =  vds_trans_setup.getitemstring(ll_row_found, 'cr_obj_type') 		
	else
		if not isnull(vds_trans_setup.getitemstring(ll_row_found, 'dr_dw_criterial')) then 
			rstr_post_info.s_dw_criterial = vds_trans_setup.getitemstring(ll_row_found, 'dr_dw_criterial')
		end if
		if not isnull(vds_trans_setup.getitemstring(ll_row_found, 'dr_col_criterial')) then
			rstr_post_info.s_col_criterial = vds_trans_setup.getitemstring(ll_row_found, 'dr_col_criterial')	
		end if
		if not isnull(vds_trans_setup.getitemstring(ll_row_found, 'dr_value_criterial')) then
			ls_condition_val = vds_trans_setup.getitemstring(ll_row_found, 'dr_value_criterial')	
		end if
		
		if isnull(rstr_post_info.s_dw_criterial) or rstr_post_info.s_dw_criterial = '' then
			if not isnull(vds_trans_setup.getitemstring(ll_row_found, 'cr_dw_criterial')) then
				rstr_post_info.s_dw_criterial = vds_trans_setup.getitemstring(ll_row_found, 'cr_dw_criterial')
			end if
			if not isnull(vds_trans_setup.getitemstring(ll_row_found, 'cr_col_criterial')) then
				rstr_post_info.s_col_criterial = vds_trans_setup.getitemstring(ll_row_found, 'cr_col_criterial')
			end if
			if not isnull(vds_trans_setup.getitemstring(ll_row_found, 'cr_value_criterial')) then
				ls_condition_val = vds_trans_setup.getitemstring(ll_row_found, 'cr_value_criterial')	
			end if
		end if
		if isnull(ls_condition_val) then ls_condition_val =''
		ls_dr_objtype = vds_trans_setup.getitemstring(ll_row_found, 'dr_obj_type')
		ls_cr_objtype = vds_trans_setup.getitemstring(ll_row_found, 'cr_obj_type')
		
		li_all_cnt++
		rstr_post_info.s_all_idx += ';'+ls_dr_objtype+';'+ls_cr_objtype+ ';'+';'+ls_condition_val+'['+string(li_all_cnt)+ ']'
		
		rstr_post_acct_all[li_all_cnt].s_setup_type = ls_dr_setup_type+';'+ls_cr_setup_type+';'
		rstr_post_acct_all[li_all_cnt].s_posting_type = vs_posting_type
		rstr_post_acct_all[li_all_cnt].db_dr_account = vds_trans_setup.getitemnumber(ll_row_found, 'DR_ACCT_ID')
		rstr_post_acct_all[li_all_cnt].db_cr_account = vds_trans_setup.getitemnumber(ll_row_found, 'CR_ACCT_ID')
		rstr_post_acct_all[li_all_cnt].db_dr_subaccount = vds_trans_setup.getitemnumber(ll_row_found, 'DR_SUBACCT_ID')
		rstr_post_acct_all[li_all_cnt].db_cr_subaccount = vds_trans_setup.getitemnumber(ll_row_found, 'CR_SUBACCT_ID')
		rstr_post_acct_all[li_all_cnt].s_col_amt = vds_trans_setup.getitemstring(ll_row_found, 'col_get_amount')	
		rstr_post_acct_all[li_all_cnt].s_col_base_amt = vds_trans_setup.getitemstring(ll_row_found, 'col_get_base_amount')	
		if  pos( rstr_post_info.s_col_base_amt, rstr_post_acct_all[li_all_cnt].s_col_base_amt+';') = 0 then
			rstr_post_info.s_col_base_amt +=  rstr_post_acct_all[li_all_cnt].s_col_base_amt + ';'
		end if		
		rstr_post_acct_all[li_all_cnt].s_trans_text = vds_trans_setup.getitemstring(ll_row_found, 'trans_text')
		if isnull(rstr_post_acct_all[li_all_cnt].s_trans_text ) then rstr_post_acct_all[li_all_cnt].s_trans_text = ''
		rstr_post_acct_all[li_all_cnt].s_post_type_text = rstr_post_acct_all[li_all_cnt].s_trans_text 
		rstr_post_acct_all[li_all_cnt].s_dr_object_type = vds_trans_setup.getitemstring(ll_row_found, 'dr_obj_type')
		rstr_post_acct_all[li_all_cnt].s_cr_object_type = vds_trans_setup.getitemstring(ll_row_found, 'cr_obj_type')		
		rstr_post_acct_all[li_all_cnt].s_val_condition = ls_condition_val			
		rstr_post_acct_all[li_all_cnt].s_dr_dw_object = vds_trans_setup.getitemstring(ll_row_found, 'dr_dw_object')	
		rstr_post_acct_all[li_all_cnt].s_dr_object_col = vds_trans_setup.getitemstring(ll_row_found, 'dr_object_col')	
		rstr_post_acct_all[li_all_cnt].s_cr_dw_object = vds_trans_setup.getitemstring(ll_row_found, 'cr_dw_object')	
		rstr_post_acct_all[li_all_cnt].s_cr_object_col = vds_trans_setup.getitemstring(ll_row_found, 'cr_object_col')		
		
 		rstr_post_acct_all[li_all_cnt].s_dr_obj_type =  vds_trans_setup.getitemstring(ll_row_found, 'dr_obj_type') 
 		rstr_post_acct_all[li_all_cnt].s_cr_obj_type =  vds_trans_setup.getitemstring(ll_row_found, 'cr_obj_type') 		
	end if
	
	ll_row_found = vds_trans_setup.find(ls_find, ll_row_found+1, vds_trans_setup.rowcount()+1 )
	
LOOP

return 1
end function

protected function integer f_get_posting_condition_multi (double vdb_doc_version, s_str_post_info vstr_post_info, t_ds_db vds_get_amount, long vl_handle_row, ref string rs_condition_val, ref string rs_condition_coltype, ref t_transaction rt_transaction, ref s_str_ds_4_posting rstr_ds_4_posting);long			ll_master_row
double		ldb_object_ref_id
string			ls_dwo_master, ls_colname, ls_coltype, ls_updTable
int				li_chr_nbr, li_idx_master, li_pos_s, li_pos_e
c_dwservice_ex			l_dwservice

l_dwservice = create c_dwservice_ex

//-- Lấy conditional value --// 
if vstr_post_info.s_dw_criterial = left(vds_get_amount.dataobject, len(vds_get_amount.dataobject) - 5) then 
	rs_condition_val = string(vds_get_amount.f_getitemany( vl_handle_row ,vstr_post_info.s_col_criterial))
	rs_condition_coltype = vds_get_amount.Describe( vstr_post_info.s_col_criterial+".ColType")
elseif not isnull(vstr_post_info.s_dw_criterial) and vstr_post_info.s_dw_criterial <> '' then
	ldb_object_ref_id =  vds_get_amount.getitemnumber(vl_handle_row, 'object_ref_id')
	
	
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(vds_get_amount.dataobject, len(vds_get_amount.dataobject) - 5) + '[')
	li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
	li_chr_nbr = li_pos_e - (li_pos_s + len(vds_get_amount.dataobject) - 4)
	li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(vds_get_amount.dataobject) - 4 , li_chr_nbr ))	
	
	if isvalid(rstr_ds_4_posting.ds_master[li_idx_master]) then
		ls_dwo_master = left(rstr_ds_4_posting.ds_master[li_idx_master].dataobject, len(rstr_ds_4_posting.ds_master[li_idx_master].dataobject) -5)							
		
		li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  ls_dwo_master + '[')
		li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)		
		li_chr_nbr = li_pos_e - (li_pos_s + len(ls_dwo_master + '[') )
		li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(ls_dwo_master + '[') , li_chr_nbr ))
		
		if rstr_ds_4_posting.ds_details[li_idx_master].rowcount() =  0 then
			IF upper(rstr_ds_4_posting.ds_details[li_idx_master].describe("DataWindow.Table.UpdateTable")) <> 'BOOKED_SLIP' THEN
				rstr_ds_4_posting.ds_details[li_idx_master].f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx_master] , " booked_slip.ID = " + string(vdb_doc_version), " AND " )
			else
				ls_colname = 'ID'
				l_dwservice.f_get_build_column(rstr_ds_4_posting.ds_details[li_idx_master], ls_colname, ls_coltype)		
				rstr_ds_4_posting.ds_details[li_idx_master].f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx_master] ," "+ ls_colname+" = "+ string(vdb_doc_version) , " AND " )
			end if					
			rstr_ds_4_posting.ds_details[li_idx_master].f_settransobject(rt_transaction)
			rstr_ds_4_posting.ds_details[li_idx_master].retrieve()		
		end if
		ll_master_row = rstr_ds_4_posting.ds_details[li_idx_master].find( "id = "+string(ldb_object_ref_id) , 1, rstr_ds_4_posting.ds_details[li_idx_master].rowcount())		
				
		if vstr_post_info.s_dw_criterial = ls_dwo_master then 			
			rs_condition_val = string(rstr_ds_4_posting.ds_details[li_idx_master].f_getitemany( ll_master_row, vstr_post_info.s_col_criterial))	
			rs_condition_coltype = rstr_ds_4_posting.ds_details[li_idx_master].Describe( vstr_post_info.s_col_criterial+".ColType")
		else
			if isvalid(rstr_ds_4_posting.ds_master[li_idx_master]) then
				ldb_object_ref_id =  rstr_ds_4_posting.ds_details[li_idx_master].getitemnumber(ll_master_row, 'object_ref_id')
				ls_dwo_master = left(rstr_ds_4_posting.ds_master[li_idx_master].dataobject, len(rstr_ds_4_posting.ds_master[li_idx_master].dataobject) -5)					
	
				li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  ls_dwo_master + '[')
				li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)							
				li_chr_nbr = li_pos_e - (li_pos_s + len(ls_dwo_master + '[') )				
				if li_chr_nbr > 0 then
					li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(ls_dwo_master + '[') , li_chr_nbr ))
				else
					li_idx_master = 0
				end if
				
				if rstr_ds_4_posting.ds_details[li_idx_master].rowcount() =  0 and li_idx_master > 0 then
					ls_updTable = upper(rstr_ds_4_posting.ds_details[li_idx_master].describe("DataWindow.Table.UpdateTable")) 
					IF ls_updTable = 'DOCUMENT' then
						rstr_ds_4_posting.ds_details[li_idx_master].f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx_master] , " document.version_ID = " + string(vdb_doc_version) , " AND " )
					elseif ls_updTable <> 'BOOKED_SLIP' THEN	
						rstr_ds_4_posting.ds_details[li_idx_master].f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx_master] , " booked_slip.ID = " + string(vdb_doc_version) , " AND " )
					else
						ls_colname = 'ID'
						l_dwservice.f_get_build_column(rstr_ds_4_posting.ds_details[li_idx_master], ls_colname, ls_coltype)		
						rstr_ds_4_posting.ds_details[li_idx_master].f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx_master] ," "+ ls_colname+" = "+ string(vdb_doc_version) , " AND " )
					end if								
										
					rstr_ds_4_posting.ds_details[li_idx_master].f_settransobject(rt_transaction)
					rstr_ds_4_posting.ds_details[li_idx_master].retrieve()		
				end if					
				if vstr_post_info.s_dw_criterial = ls_dwo_master and  li_idx_master > 0 then
					ll_master_row = rstr_ds_4_posting.ds_details[li_idx_master].find( "id = "+string(ldb_object_ref_id) , 1, rstr_ds_4_posting.ds_details[li_idx_master].rowcount())												
					rs_condition_val = string(rstr_ds_4_posting.ds_details[li_idx_master].f_getitemany( ll_master_row, vstr_post_info.s_col_criterial))	
					rs_condition_coltype = rstr_ds_4_posting.ds_details[li_idx_master].Describe( vstr_post_info.s_col_criterial+".ColType")		
				end if
			end if
		end if
	end if
end if

return 1
end function

protected function integer f_get_posting_object_multi (double vdb_doc_version, s_str_post_account vstr_post_info, t_ds_db vds_get_amount, long vl_handle_row, ref double rdb_dr_object_id, ref double rdb_cr_object_id, ref t_transaction rt_transaction, ref s_str_ds_4_posting rstr_ds_4_posting, ref double rdb_dr_subacct_id, ref double rdb_cr_subacct_id);/////////////////////////////////////////
// 1 //
////////////////////////////////////////////

long			ll_master_row
double		ldb_object_ref_id
string			ls_dwo_master, ls_colname, ls_coltype
int				li_chr_nbr, li_idx_master, li_pos_s, li_pos_e
c_dwservice_ex			l_dwservice

l_dwservice = create c_dwservice_ex
 
if not isnull(vstr_post_info.s_dr_dw_object) and vstr_post_info.s_dr_dw_object <> '' then
	if vstr_post_info.s_dr_dw_object = left(vds_get_amount.dataobject, len(vds_get_amount.dataobject) - 5) then 
		rdb_dr_object_id = vds_get_amount.getitemnumber( vl_handle_row ,vstr_post_info.s_dr_object_col)
		///////////////////////////////////////////////-subacct-////////////////////////////////////////////////
		if vds_get_amount.dataobject <> 'd_gl_journal_line_grid' then
			rdb_dr_subacct_id = vds_get_amount.getitemnumber( vl_handle_row ,'subaccount')
		else
			rdb_dr_subacct_id = vds_get_amount.getitemnumber( vl_handle_row ,'DR_SUBACCOUNT')
		end if										
	else
		
		li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(vds_get_amount.dataobject, len(vds_get_amount.dataobject) - 5) + '[')
		li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
		li_chr_nbr = li_pos_e - (li_pos_s + len(vds_get_amount.dataobject) - 4)
		li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(vds_get_amount.dataobject) - 4, li_chr_nbr ))
		
		ls_dwo_master = left(rstr_ds_4_posting.ds_master[li_idx_master].dataobject, len(rstr_ds_4_posting.ds_master[li_idx_master].dataobject) -5) 						
		ldb_object_ref_id =  vds_get_amount.getitemnumber(vl_handle_row, 'object_ref_id')
		
		li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  ls_dwo_master + '[')
		li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
		
		if li_pos_s = 0 then
			rollback using rt_transaction;
			gf_messagebox('m.b_doc.f_get_posting_object_multi.01','Thông báo','Không tìm thấy DWO trong chuỗi datastore:@'+ls_dwo_master ,'stop','ok',1)					
			return -1
		end if
		li_chr_nbr = li_pos_e - (li_pos_s + len(ls_dwo_master + '[') )
		li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(ls_dwo_master + '[') , li_chr_nbr ))
	
		if isvalid(rstr_ds_4_posting.ds_details[li_idx_master]) then
			if rstr_ds_4_posting.ds_details[li_idx_master].rowcount() = 0 then
				IF upper(rstr_ds_4_posting.ds_details[li_idx_master].describe("DataWindow.Table.UpdateTable")) <> 'BOOKED_SLIP' THEN	
					rstr_ds_4_posting.ds_details[li_idx_master].f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx_master] , " booked_slip.ID = " + string(vdb_doc_version) , " AND " )
				else
					ls_colname = 'ID'
					l_dwservice.f_get_build_column(rstr_ds_4_posting.ds_details[li_idx_master], ls_colname, ls_coltype)		
					rstr_ds_4_posting.ds_details[li_idx_master].f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx_master] ," "+ ls_colname+" = "+ string(vdb_doc_version) , " AND " )
				end if					
				
				rstr_ds_4_posting.ds_details[li_idx_master].f_settransobject(rt_transaction)
				rstr_ds_4_posting.ds_details[li_idx_master].retrieve()								
			end if									
			ll_master_row = rstr_ds_4_posting.ds_details[li_idx_master].find( "id = "+string(ldb_object_ref_id) , 1, rstr_ds_4_posting.ds_details[li_idx_master].rowcount())						

			if vstr_post_info.s_dr_dw_object = ls_dwo_master then 		
				rdb_dr_object_id = rstr_ds_4_posting.ds_details[li_idx_master].getitemnumber( ll_master_row, vstr_post_info.s_dr_object_col)		
				///////////////////////////////////////////////-subacct-////////////////////////////////////////////////
				if rstr_ds_4_posting.ds_details[li_idx_master].dataobject <> 'd_gl_journal_line_grid' then
					rdb_dr_subacct_id =  rstr_ds_4_posting.ds_details[li_idx_master].getitemnumber( ll_master_row ,'subaccount')	
				else
					rdb_dr_subacct_id =  rstr_ds_4_posting.ds_details[li_idx_master].getitemnumber( ll_master_row ,'DR_SUBACCOUNT')
				end if																				
			else
				ldb_object_ref_id =  rstr_ds_4_posting.ds_details[li_idx_master].getitemnumber(ll_master_row, 'object_ref_id')
				ls_dwo_master = left(rstr_ds_4_posting.ds_master[li_idx_master].dataobject, len(rstr_ds_4_posting.ds_master[li_idx_master].dataobject) - 5)

				li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  ls_dwo_master + '[')
				li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
				
				if li_pos_s = 0 then
					rollback using rt_transaction;
					gf_messagebox('m.b_doc.f_get_posting_object_multi.01','Thông báo','Không tìm thấy DWO trong chuỗi datastore:@'+ls_dwo_master ,'stop','ok',1)					
					return -1
				end if
				li_chr_nbr = li_pos_e - ( li_pos_s + len(ls_dwo_master + '[') )
				li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(ls_dwo_master + '[') , li_chr_nbr ))
		
				if isvalid(rstr_ds_4_posting.ds_details[li_idx_master]) then
					
					if rstr_ds_4_posting.ds_details[li_idx_master].rowcount() = 0 then
						IF upper(rstr_ds_4_posting.ds_details[li_idx_master].describe("DataWindow.Table.UpdateTable")) <> 'BOOKED_SLIP' THEN	
							rstr_ds_4_posting.ds_details[li_idx_master].f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx_master] , " booked_slip.ID = " + string(vdb_doc_version) , " AND " )
						else
							ls_colname = 'ID'
							l_dwservice.f_get_build_column(rstr_ds_4_posting.ds_details[li_idx_master], ls_colname, ls_coltype)		
							rstr_ds_4_posting.ds_details[li_idx_master].f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx_master] ," "+ ls_colname+" = "+ string(vdb_doc_version) , " AND " )
						end if												
						rstr_ds_4_posting.ds_details[li_idx_master].f_settransobject(rt_transaction)
						rstr_ds_4_posting.ds_details[li_idx_master].retrieve()								
					end if									
													
					if vstr_post_info.s_dr_dw_object = ls_dwo_master  then 
						ll_master_row = rstr_ds_4_posting.ds_details[li_idx_master].find( "id = "+string(ldb_object_ref_id) , 1, rstr_ds_4_posting.ds_details[li_idx_master].rowcount())							
						rdb_dr_object_id = rstr_ds_4_posting.ds_details[li_idx_master].getitemnumber( ll_master_row, vstr_post_info.s_dr_object_col)		
						///////////////////////////////////////////////-subacct-////////////////////////////////////////////////
						if rstr_ds_4_posting.ds_details[li_idx_master].dataobject <> 'd_gl_journal_line_grid' then
							rdb_dr_subacct_id =  rstr_ds_4_posting.ds_details[li_idx_master].getitemnumber( ll_master_row ,'subaccount')								
						else
							rdb_dr_subacct_id =  rstr_ds_4_posting.ds_details[li_idx_master].getitemnumber( ll_master_row ,'DR_SUBACCOUNT')
						end if																				
					end if
				end if
			end if
		end if
	end if	
else 
	rdb_dr_object_id = vstr_post_info.db_dr_object_id
end if

if ( isnull(rdb_dr_object_id) or rdb_dr_object_id =0 ) and vstr_post_info.s_dr_obj_type <> 'ACCOUNT'  then
	gf_messagebox('m.b_doc.f_get_posting_object_multi.02','Thông báo','Đối tượng NỢ chưa được nhập' ,'exclamation','ok',1)
	rollback using rt_transaction;		
	return -1
end if

	
if not isnull(vstr_post_info.s_cr_dw_object) and vstr_post_info.s_cr_dw_object <> '' then
	if vstr_post_info.s_cr_dw_object = left(vds_get_amount.dataobject, len(vds_get_amount.dataobject) - 5) then 
		rdb_cr_object_id = vds_get_amount.getitemnumber( vl_handle_row ,vstr_post_info.s_cr_object_col)
		///////////////////////////////////////////////-subacct-////////////////////////////////////////////////
		if vds_get_amount.dataobject <> 'd_gl_journal_line_grid' then
			rdb_cr_subacct_id =  vds_get_amount.getitemnumber( vl_handle_row ,'subaccount')		
		else
			rdb_cr_subacct_id =  vds_get_amount.getitemnumber( vl_handle_row ,'CR_SUBACCOUNT')		
		end if																												
	else
		li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(vds_get_amount.dataobject, len(vds_get_amount.dataobject) - 5) + '[')
		li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
		li_chr_nbr = li_pos_e - ( li_pos_s + len(vds_get_amount.dataobject ) -4 )
		li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(vds_get_amount.dataobject ) - 4 , li_chr_nbr ))
		
		ls_dwo_master = left(rstr_ds_4_posting.ds_master[li_idx_master].dataobject, len(rstr_ds_4_posting.ds_master[li_idx_master].dataobject) - 5)						
		ldb_object_ref_id =  vds_get_amount.getitemnumber(vl_handle_row, 'object_ref_id')
		
		li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  ls_dwo_master + '[')
		li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
		
		if li_pos_s = 0 then
			rollback using rt_transaction;
			gf_messagebox('m.b_doc.f_get_posting_object_multi.01','Thông báo','Không tìm thấy DWO trong chuỗi datastore:@'+ls_dwo_master ,'stop','ok',1)					
			return -1
		end if
		li_chr_nbr = li_pos_e - ( li_pos_s + len(ls_dwo_master + '[') )
		li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(ls_dwo_master + '[') , li_chr_nbr ))
	
		if isvalid(rstr_ds_4_posting.ds_details[li_idx_master]) then
			if rstr_ds_4_posting.ds_details[li_idx_master].rowcount() = 0 then
				IF upper(rstr_ds_4_posting.ds_details[li_idx_master].describe("DataWindow.Table.UpdateTable")) <> 'BOOKED_SLIP' THEN	
					rstr_ds_4_posting.ds_details[li_idx_master].f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx_master] , " booked_slip.ID = " + string(vdb_doc_version) , " AND " )
				else
					ls_colname = 'ID'
					l_dwservice.f_get_build_column(rstr_ds_4_posting.ds_details[li_idx_master], ls_colname, ls_coltype)		
					rstr_ds_4_posting.ds_details[li_idx_master].f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx_master] ," "+ ls_colname+" = "+ string(vdb_doc_version) , " AND " )
				end if					
				
				rstr_ds_4_posting.ds_details[li_idx_master].f_settransobject(rt_transaction)
				rstr_ds_4_posting.ds_details[li_idx_master].retrieve()								
			end if									
			ll_master_row = rstr_ds_4_posting.ds_details[li_idx_master].find( "id = "+string(ldb_object_ref_id) , 1, rstr_ds_4_posting.ds_details[li_idx_master].rowcount())						

			if vstr_post_info.s_cr_dw_object = ls_dwo_master then 		
				rdb_cr_object_id = rstr_ds_4_posting.ds_details[li_idx_master].getitemnumber( ll_master_row, vstr_post_info.s_cr_object_col)		
				///////////////////////////////////////////////-subacct-////////////////////////////////////////////////
				if rstr_ds_4_posting.ds_details[li_idx_master].dataobject <> 'd_gl_journal_line_grid' then
					rdb_cr_subacct_id =  rstr_ds_4_posting.ds_details[li_idx_master].getitemnumber( ll_master_row ,'subaccount')		
				else
					rdb_cr_subacct_id =  rstr_ds_4_posting.ds_details[li_idx_master].getitemnumber( ll_master_row ,'CR_SUBACCOUNT')		
				end if																																												
			else
				ldb_object_ref_id =  rstr_ds_4_posting.ds_details[li_idx_master].getitemnumber(ll_master_row, 'object_ref_id')
				ls_dwo_master = left( rstr_ds_4_posting.ds_master[li_idx_master].dataobject, len(rstr_ds_4_posting.ds_master[li_idx_master].dataobject) - 5)

				li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  ls_dwo_master + '[')
				li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
				
				if li_pos_s = 0 then
					rollback using rt_transaction;
					gf_messagebox('m.b_doc.f_get_posting_object_multi.01','Thông báo','Không tìm thấy DWO trong chuỗi datastore:@'+ls_dwo_master ,'stop','ok',1)					
					return -1
				end if
				li_chr_nbr = li_pos_e - (li_pos_s + len(ls_dwo_master + '['))
				li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(ls_dwo_master + '[') , li_chr_nbr ))
		
				if isvalid(rstr_ds_4_posting.ds_details[li_idx_master]) then
					
					if rstr_ds_4_posting.ds_details[li_idx_master].rowcount() = 0 then
						IF upper(rstr_ds_4_posting.ds_details[li_idx_master].describe("DataWindow.Table.UpdateTable")) <> 'BOOKED_SLIP' THEN	
							rstr_ds_4_posting.ds_details[li_idx_master].f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx_master] , " booked_slip.ID = " + string(vdb_doc_version) , " AND " )
						else
							ls_colname = 'ID'
							l_dwservice.f_get_build_column(rstr_ds_4_posting.ds_details[li_idx_master], ls_colname, ls_coltype)		
							rstr_ds_4_posting.ds_details[li_idx_master].f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx_master] ," "+ ls_colname+" = "+ string(vdb_doc_version) , " AND " )
						end if								
						
						rstr_ds_4_posting.ds_details[li_idx_master].f_settransobject(rt_transaction)
						rstr_ds_4_posting.ds_details[li_idx_master].retrieve()								
					end if									
													
					if vstr_post_info.s_cr_dw_object = ls_dwo_master then 
						ll_master_row = rstr_ds_4_posting.ds_details[li_idx_master].find( "id = "+string(ldb_object_ref_id) , 1, rstr_ds_4_posting.ds_details[li_idx_master].rowcount())							
						rdb_cr_object_id = rstr_ds_4_posting.ds_details[li_idx_master].getitemnumber( ll_master_row, vstr_post_info.s_cr_object_col)		
						///////////////////////////////////////////////-subacct-////////////////////////////////////////////////
						if rstr_ds_4_posting.ds_details[li_idx_master].dataobject <> 'd_gl_journal_line_grid' then
							rdb_cr_subacct_id =  rstr_ds_4_posting.ds_details[li_idx_master].getitemnumber( ll_master_row ,'subaccount')		
						else
							rdb_cr_subacct_id =  rstr_ds_4_posting.ds_details[li_idx_master].getitemnumber( ll_master_row ,'CR_SUBACCOUNT')		
						end if																																												
					end if
				end if
			end if
		end if
	end if	
else
	rdb_cr_object_id = vstr_post_info.db_cr_object_id
end if

if ( isnull(rdb_cr_object_id) or rdb_cr_object_id =0 ) and vstr_post_info.s_cr_obj_type <> 'ACCOUNT'  then
	gf_messagebox('m.b_doc.f_get_posting_object_multi.03','Thông báo','Đối tượng CÓ chưa được nhập' ,'exclamation','ok',1)
	rollback using rt_transaction;		
	return -1
end if

return 1
end function

protected function integer f_get_posting_trans_text_multi (double vdb_doc_version, s_str_post_info vstr_post_info, t_ds_db vds_get_amount, long vl_handle_row, ref string rs_trans_text_dw, ref t_transaction rt_transaction, ref s_str_ds_4_posting rstr_ds_4_posting);long			ll_master_row
double		ldb_object_ref_id
string			ls_dwo_master, ls_colname, ls_coltype
int				li_chr_nbr, li_idx_master, li_pos_s, li_pos_e

c_dwservice_ex			l_dwservice

l_dwservice = create c_dwservice_ex

//-- Lấy trans_text --// 
if vstr_post_info.s_dw_trans_text = left(vds_get_amount.dataobject, len(vds_get_amount.dataobject) - 5) then 
	rs_trans_text_dw = vds_get_amount.getitemstring( vl_handle_row ,vstr_post_info.s_col_trans_text)
elseif not isnull(vstr_post_info.s_dw_trans_text) and vstr_post_info.s_dw_trans_text <> ''  then
	ldb_object_ref_id =  vds_get_amount.getitemnumber(vl_handle_row, 'object_ref_id')
	
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,   left(vds_get_amount.dataobject, len(vds_get_amount.dataobject) - 5) + '[')
	li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
	li_chr_nbr = li_pos_e - (li_pos_s + len(vds_get_amount.dataobject ) - 4)
	li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(vds_get_amount.dataobject) - 4 , li_chr_nbr ))		
	
	if isvalid(rstr_ds_4_posting.ds_master[li_idx_master]) then
		ls_dwo_master = left(rstr_ds_4_posting.ds_master[li_idx_master].dataobject, len(rstr_ds_4_posting.ds_master[li_idx_master].dataobject) -5 )		

		li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  ls_dwo_master + '[')
		li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)		
		li_chr_nbr = li_pos_e - (li_pos_s + len(ls_dwo_master + '[') )
		li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(ls_dwo_master + '[') , li_chr_nbr ))
		
		if rstr_ds_4_posting.ds_details[li_idx_master].rowcount() =  0 then
			IF upper(rstr_ds_4_posting.ds_details[li_idx_master].describe("DataWindow.Table.UpdateTable")) <> 'BOOKED_SLIP' THEN	
				rstr_ds_4_posting.ds_details[li_idx_master].f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx_master] , " booked_slip.ID = " + string(vdb_doc_version) , " AND " )
			else
				ls_colname = 'ID'
				l_dwservice.f_get_build_column(rstr_ds_4_posting.ds_details[li_idx_master], ls_colname, ls_coltype)		
				rstr_ds_4_posting.ds_details[li_idx_master].f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx_master] ," "+ ls_colname+" = "+ string(vdb_doc_version) , " AND " )
			end if						

			rstr_ds_4_posting.ds_details[li_idx_master].f_settransobject(rt_transaction)
			rstr_ds_4_posting.ds_details[li_idx_master].retrieve()		
		end if
		ll_master_row = rstr_ds_4_posting.ds_details[li_idx_master].find( "id = "+string(ldb_object_ref_id) , 1, rstr_ds_4_posting.ds_details[li_idx_master].rowcount())	
							
		if vstr_post_info.s_dw_trans_text = ls_dwo_master then 
			rs_trans_text_dw =  rstr_ds_4_posting.ds_details[li_idx_master].getitemstring( ll_master_row, vstr_post_info.s_col_trans_text)	
		else
			ldb_object_ref_id =  rstr_ds_4_posting.ds_details[li_idx_master].getitemnumber(ll_master_row, 'object_ref_id')
			
			if isvalid(rstr_ds_4_posting.ds_master[li_idx_master]) then
				ls_dwo_master = left(rstr_ds_4_posting.ds_master[li_idx_master].dataobject, len(rstr_ds_4_posting.ds_master[li_idx_master].dataobject) - 5)							
		
				li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  ls_dwo_master + '[')
				li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)		
				li_chr_nbr = li_pos_e - (li_pos_s + len(ls_dwo_master + '[') )
				li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(ls_dwo_master + '[') , li_chr_nbr ))
				
				if rstr_ds_4_posting.ds_details[li_idx_master].rowcount() =  0 then
					IF upper(rstr_ds_4_posting.ds_details[li_idx_master].describe("DataWindow.Table.UpdateTable")) <> 'BOOKED_SLIP' THEN	
						rstr_ds_4_posting.ds_details[li_idx_master].f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx_master] , " booked_slip.ID = " + string(vdb_doc_version) , " AND " )
					else
						ls_colname = 'ID'
						l_dwservice.f_get_build_column(rstr_ds_4_posting.ds_details[li_idx_master], ls_colname, ls_coltype)		
						rstr_ds_4_posting.ds_details[li_idx_master].f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx_master] ," "+ ls_colname+" = "+ string(vdb_doc_version) , " AND " )
					end if						
					rstr_ds_4_posting.ds_details[li_idx_master].f_settransobject(rt_transaction)
					rstr_ds_4_posting.ds_details[li_idx_master].retrieve()		
				end if
				
				if vstr_post_info.s_dw_trans_text = ls_dwo_master then
					ll_master_row = rstr_ds_4_posting.ds_details[li_idx_master].find( "id = "+string(ldb_object_ref_id) , 1, rstr_ds_4_posting.ds_details[li_idx_master].rowcount())									
					rs_trans_text_dw = rstr_ds_4_posting.ds_details[li_idx_master].getitemstring( ll_master_row, vstr_post_info.s_col_trans_text)
				end if
			end if
		end if
	end if
end if
if isnull(rs_trans_text_dw) then rs_trans_text_dw =''	


return 1
end function

public function string f_get_obj_type_other (double vdb_object_id, string vs_obj_type_primary);string		ls_both_yn


if vs_obj_type_primary = '' or isnull(vs_obj_type_primary) then return ''
if vdb_object_id = 0 or isnull(vdb_object_id) then return ''
if lower(vs_obj_type_primary) = 'customer' then
	select vendor_yn into :ls_both_yn
	from customer where object_ref_id = :vdb_object_id using sqlca;
	if sqlca.sqlcode <> 0 then return ''
	if ls_both_yn = 'Y' then
		return 'VENDOR'
	else
		return ''
	end if
elseif lower(vs_obj_type_primary) = 'vendor' then
	select customer_yn into :ls_both_yn
	from vendor where object_ref_id = :vdb_object_id using sqlca;
	if sqlca.sqlcode <> 0 then return ''
	if ls_both_yn = 'Y' then
		return 'CUSTOMER'
	else
		return ''
	end if
end if
return ''
end function

public function integer f_insert_ledger_trans (double vdb_doc_id, string vs_doctype, date vd_trans_date, ref t_transaction rt_transaction, ref t_ds_db vds_ledger_trans);//Hàm cập nhật bảng Object trans từ Post_line
long  				ll_idx, ll_row, ll_row_cnt
double			ll_account_id_dr, ll_account_id_cr, ll_subaccount_id_dr, ll_subaccount_id_cr, ll_trans_currency, ll_id, ldb_branch_id
double			ldb_trans_amount,ldb_base_amount,ld_ex_rate
//dec 				 ld_ex_rate
string 			ls_not_accept, ls_trans_text
any 				la_value[]

t_ds_db			lds_ledger_trans_post


vds_ledger_trans.dataobject = 'ds_ledger_trans_grid'
vds_ledger_trans.f_settransobject(rt_transaction)

lds_ledger_trans_post = create t_ds_db
lds_ledger_trans_post.dataobject = 'ds_ledger_trans_post'
la_value[1] = vdb_doc_id
lds_ledger_trans_post.f_add_where( 'doc_id', la_value[])
lds_ledger_trans_post.f_settransobject( rt_transaction)
ll_row_cnt = lds_ledger_trans_post.retrieve( )

for ll_idx = 1 to ll_row_cnt
	vdb_doc_id = lds_ledger_trans_post.getitemnumber(ll_idx,'doc_id')
	ldb_branch_id = lds_ledger_trans_post.getitemnumber(ll_idx,'branch_id')
	ll_account_id_dr = lds_ledger_trans_post.getitemnumber(ll_idx,'DR_ACCOUNT_ID')
	ll_subaccount_id_dr = lds_ledger_trans_post.getitemnumber(ll_idx,'DR_SUBACCOUNT')
	ll_account_id_cr = lds_ledger_trans_post.getitemnumber(ll_idx,'CR_ACCOUNT_ID') 
	ll_subaccount_id_cr = lds_ledger_trans_post.getitemnumber(ll_idx,'CR_SUBACCOUNT') 
//	ld_trans_amt = lds_ledger_trans_post.getitemdecimal(ll_idx,'trans_amt')
//	ld_base_amt = lds_ledger_trans_post.getitemdecimal(ll_idx,'base_amt')
	ldb_trans_amount = lds_ledger_trans_post.getitemnumber( ll_idx, 'trans_amt')
	ldb_base_amount = lds_ledger_trans_post.getitemnumber( ll_idx, 'base_amt')
	ld_ex_rate = lds_ledger_trans_post.getitemnumber(ll_idx,'EX_RATE')
	ll_trans_currency = lds_ledger_trans_post.getitemnumber(ll_idx,'TRANS_CUR_ID')
	ls_not_accept = lds_ledger_trans_post.getitemstring(ll_idx,'NOT_ACCEPT_YN')
	ls_trans_text = lds_ledger_trans_post.getitemstring(ll_idx,'post_type_text')
	ll_row = vds_ledger_trans.event e_addrow()
	ll_id = this.f_create_id_ex(rt_transaction )
	vds_ledger_trans.setitem(ll_row,'id',ll_id)	
	vds_ledger_trans.setitem(ll_row,'branch_id',ldb_branch_id)	
	vds_ledger_trans.setitem(ll_row,'TRANS_DATE',vd_trans_date)
	vds_ledger_trans.setitem(ll_row,'DR_ACCOUNT_ID',ll_account_id_dr)
	vds_ledger_trans.setitem(ll_row,'DR_SUBACCOUNT',ll_subaccount_id_dr)
	vds_ledger_trans.setitem(ll_row,'CR_ACCOUNT_ID',ll_account_id_cr)
	vds_ledger_trans.setitem(ll_row,'CR_SUBACCOUNT',ll_subaccount_id_cr)
	vds_ledger_trans.setitem(ll_row,'AMOUNT',ldb_trans_amount)
	vds_ledger_trans.setitem(ll_row,'BASE_AMOUNT',ldb_base_amount)
	vds_ledger_trans.setitem(ll_row,'TRANS_CURRENCY',ll_trans_currency)
	vds_ledger_trans.setitem(ll_row,'EXCHANGE_RATE',ld_ex_rate)
	vds_ledger_trans.setitem(ll_row,'NOT_ACCEPT_YN',ls_not_accept)
	vds_ledger_trans.setitem(ll_row,'DOC_REF_ID',vdb_doc_id)
	vds_ledger_trans.setitem(ll_row,'DOC_REF_TYPE',vs_doctype)
	vds_ledger_trans.setitem(ll_row,'trans_text',ls_trans_text)
next
if vds_ledger_trans.update(true,false) = -1 then
	rollback using rt_transaction;
	destroy lds_ledger_trans_post
	return -1
end if
destroy lds_ledger_trans_post
return 1
	
end function

public function integer f_insert_object_trans (double vdb_doc_id, string vs_doctype, date vd_trans_date, ref t_transaction rt_transaction, t_ds_db rds_obj_trans_post);//Hàm cập nhật bảng Object trans từ Post_line
long  				ll_idx, ll_row, ll_row_cnt
double			ll_object_id, ll_trans_currency, ll_id, ldb_branch_id,ld_trans_amt, ld_base_amt, ld_ex_rate
//dec 				ld_trans_amt, ld_base_amt, ld_ex_rate
string 				ls_not_accept
any 				la_value[]

t_ds_db			lds_object_trans

lds_object_trans = create t_ds_db
lds_object_trans.dataobject = 'ds_object_trans_grid'
lds_object_trans.f_settransobject(rt_transaction)

la_value[1] = vdb_doc_id
rds_obj_trans_post.f_add_where( 'doc_id', la_value[])
rds_obj_trans_post.f_settransobject( rt_transaction)
ll_row_cnt = rds_obj_trans_post.retrieve( )

for ll_idx = 1 to ll_row_cnt
	vdb_doc_id = rds_obj_trans_post.getitemnumber(ll_idx,'doc_id')
	ldb_branch_id = rds_obj_trans_post.getitemnumber(ll_idx,'branch_id')
	ll_object_id = rds_obj_trans_post.getitemnumber(ll_idx,'OBJECT_ID')
	ld_trans_amt = rds_obj_trans_post.getitemnumber(ll_idx,'trans_amt')
	ld_base_amt = rds_obj_trans_post.getitemnumber(ll_idx,'base_amt')
	ld_ex_rate = rds_obj_trans_post.getitemnumber(ll_idx,'EX_RATE')
	ll_trans_currency = rds_obj_trans_post.getitemnumber(ll_idx,'TRANS_CUR_ID')
	ls_not_accept = rds_obj_trans_post.getitemstring(ll_idx,'NOT_ACCEPT_YN')
	ll_row = lds_object_trans.event e_addrow()
	ll_id = this.f_create_id_ex( rt_transaction)
	lds_object_trans.setitem(ll_row,'id',ll_id)	
	lds_object_trans.setitem(ll_row,'branch_id',ldb_branch_id)	
	lds_object_trans.setitem(ll_row,'TRANS_DATE',vd_trans_date)
	lds_object_trans.setitem(ll_row,'OBJECT_ID',ll_object_id)
	lds_object_trans.setitem(ll_row,'TRANS_CURRENCY',ll_trans_currency)
	lds_object_trans.setitem(ll_row,'EXCHANGE_RATE',ld_ex_rate)
//	lds_object_trans.setitem(ll_row,'NOT_ACCEPT_YN',ls_not_accept)
	lds_object_trans.setitem(ll_row,'DOC_REF_ID',vdb_doc_id)
	lds_object_trans.setitem(ll_row,'DOC_REF_TYPE',upper(vs_doctype))
	if rds_obj_trans_post.dataobject = 'ds_obj_trans_post_dr' then
		lds_object_trans.setitem(ll_row,'DR_AMOUNT',ld_trans_amt)
		lds_object_trans.setitem(ll_row,'DR_BASE_AMOUNT',ld_base_amt)	
	else
		lds_object_trans.setitem(ll_row,'CR_AMOUNT',ld_trans_amt)
		lds_object_trans.setitem(ll_row,'CR_BASE_AMOUNT',ld_base_amt)			
	end if
//	if this.f_insert_loyalty_trans( ll_object_id, vs_doctype, vdb_doc_id) = -1 then return -1
next

if lds_object_trans.update(true,false) = -1 then
	rollback using rt_transaction;
	destroy lds_object_trans
	return -1
end if
destroy lds_object_trans
return 1
	
end function

public function integer f_update_object_balance (string vs_sob, double vdb_branch_id, double vdb_object_id, string vs_object_type, double vdb_currency_id, double vdb_account_id, double vdb_subaccount, string vs_not_accept, double vdc_close_amt, double vdc_close_base_amt, ref t_transaction rt_transaction, string vs_balance_control, date vd_trans_date, date vd_max_date, ref t_ds_db rds_object_balance_after);//Hàm cập nhật bảng Object trans từ Post_line
long  				ll_idx, ll_rowinsert, ll_row_cnt, ll_rowfound
double 			ldb_trans_amt, ldb_base_amt, ldb_ex_rate, ldb_open_amt, ldb_open_base_amt, ldb_id
double			ldb_dr_amt, ldb_dr_base_amt, ldb_cr_amt, ldb_cr_base_amt, ldb_close_amt, ldb_close_base_amt
string 			ls_not_accept, ls_where_column, ls_account_code
any 				la_value[]
date				ld_balance_date
int					li_waiting_cnt, li_date_cnt, li_insert_cnt
//u_account		lu_account
t_ds_db			lds_allobject_balance_after, lds_allobject_balance



lds_allobject_balance = create t_ds_db
lds_allobject_balance.dataobject = 'ds_object_balance_grid'
lds_allobject_balance.f_settransobject(rt_transaction)

//-- chuẩn bị add where để retrieve balance --//
la_value[1]= vd_trans_date
la_value[2] = vdb_object_id
la_value[3] = vdb_currency_id
la_value[4] = vdb_account_id
la_value[5] = vdb_subaccount
la_value[6] = vs_not_accept
la_value[7] = gi_user_comp_id
la_value[8] = vdb_branch_id
la_value[9] = vs_sob

rds_object_balance_after.f_set_retrieve_args( la_value[])
redo:
ll_row_cnt = rds_object_balance_after.event e_retrieve( )
li_date_cnt = daysafter(vd_max_date, vd_trans_date)
if li_date_cnt > 0 then //-- chỉ cấp nhật tất cả các object khi đối phát sinh giao dịch đầu tiên của ngày --//
	li_insert_cnt = li_date_cnt
	lds_allobject_balance_after = create t_ds_db
	lds_allobject_balance_after.dataobject = 'ds_allobject_balance_after'
	lds_allobject_balance_after.f_settransobject(rt_transaction)	
else
	li_insert_cnt = -li_date_cnt
end if

FOR ll_idx = 1 to li_insert_cnt	
	if li_date_cnt > 0 then
		ld_balance_date =RelativeDate ( vd_max_date, ll_idx )
	else
		ld_balance_date =RelativeDate ( vd_trans_date, ll_idx )
	end if
	ll_rowfound =0
	if  li_date_cnt < 0 then
		ll_rowfound = rds_object_balance_after.find(" string(BALANCE_DATE,'ddmmyyyy') = '"+ string(ld_balance_date,'ddmmyyyy')+"'" ,1,rds_object_balance_after.rowcount())
		if ll_rowfound > 0 then
			ldb_dr_amt = rds_object_balance_after.getitemnumber(ll_rowfound, 'DR_TRANS_AMOUNT')
			if isnull(ldb_dr_amt) then ldb_dr_amt = 0
			ldb_dr_base_amt = rds_object_balance_after.getitemnumber(ll_rowfound, 'DR_BASE_AMOUNT')
			if isnull(ldb_dr_base_amt) then ldb_dr_base_amt = 0
			ldb_cr_amt = rds_object_balance_after.getitemnumber( ll_rowfound, 'CR_TRANS_AMOUNT')
			if isnull(ldb_cr_amt) then ldb_cr_amt = 0
			ldb_cr_base_amt = rds_object_balance_after.getitemnumber( ll_rowfound, 'CR_BASE_AMOUNT')
			if isnull(ldb_cr_base_amt) then ldb_cr_base_amt = 0
		else
			 ldb_dr_amt = 0
			 ldb_dr_base_amt = 0
			 ldb_cr_amt = 0
			 ldb_cr_base_amt = 0	 
		end if
	end if
	
	if (li_date_cnt > 0 and ll_idx < li_insert_cnt ) OR li_date_cnt < 0 then
		
		if ll_idx = 1 then
			ldb_open_amt = vdc_close_amt
			ldb_open_base_amt = vdc_close_base_amt
		end if
		ldb_close_amt = ldb_open_amt + ldb_dr_amt - ldb_cr_amt
		ldb_close_base_amt = ldb_open_base_amt + ldb_dr_base_amt - ldb_cr_base_amt
	
		//-- kiểm tra ghi sổ âm --//
		if vs_balance_control = 'dr' then
			if ldb_close_base_amt <0 or ldb_close_amt < 0 then 
//				lu_account = create u_account
				ls_account_code= this.f_get_object_code_ex(vdb_object_id, rt_transaction)
//				ls_account_code= lu_account.f_get_code( vdb_object_id)
//				destroy lu_account
				gf_messagebox('m.b_doc.f_update_object_balance.01','Thông báo', 'Tài khoản sau không được dư bên Có vào ngày-@'+string(ld_balance_date,gs_w_date_format)+':@'+ls_account_code,'exclamation','ok',1)			
				rollback using rt_transaction;
				destroy rds_object_balance_after	
				return -1
			end if
		elseif  vs_balance_control = 'cr' then
			if ldb_close_base_amt  > 0 or ldb_close_amt > 0 then 
//				lu_account = create u_account
				ls_account_code= this.f_get_object_code_ex(vdb_object_id, rt_transaction)
//				destroy lu_account
				gf_messagebox('m.b_doc.f_update_object_balance.02','Thông báo', 'Tài khoản sau không được dư bên Nợ vào ngày-@'+string(ld_balance_date,gs_w_date_format)+':@'+ls_account_code ,'exclamation','ok',1)			
				rollback using rt_transaction;
				destroy rds_object_balance_after	
				return -1			
			end if		
		end if
		//-- chừa lại record sau cùng không insert, khi return về sẽ insert --//
		if ll_rowfound > 0 then 
			ll_rowinsert = ll_rowfound
		else
			 ll_rowinsert = rds_object_balance_after.event e_addrow()		
			 ldb_id = this.f_create_id_ex( rt_transaction)
			 rds_object_balance_after.setitem(ll_rowinsert,'ID', ldb_id)		
			rds_object_balance_after.setitem(ll_rowinsert,'branch_id', vdb_branch_id)			
			rds_object_balance_after.setitem( ll_rowinsert, 'OBJECT_ID',vdb_object_id)
			rds_object_balance_after.setitem( ll_rowinsert, 'OBJECT_REF_TYPE',upper(vs_object_type))
			rds_object_balance_after.setitem( ll_rowinsert, 'TRANS_CURRENCY',vdb_currency_id)
			rds_object_balance_after.setitem( ll_rowinsert, 'CONTROL_ACCOUNT',vdb_account_id)
			rds_object_balance_after.setitem( ll_rowinsert, 'SUBACCOUNT',vdb_subaccount)
			rds_object_balance_after.setitem( ll_rowinsert, 'BALANCE_DATE', ld_balance_date)
			rds_object_balance_after.setitem( ll_rowinsert, 'SOB', vs_sob)	
			rds_object_balance_after.setitem( ll_rowinsert, 'NOT_ACCEPT_YN', vs_not_accept)			 
		end if		
		
		rds_object_balance_after.setitem( ll_rowinsert, 'OPEN_TRANS_AMOUNT',ldb_open_amt)
		rds_object_balance_after.setitem( ll_rowinsert, 'OPEN_BASE_AMOUNT', ldb_open_base_amt)	
		rds_object_balance_after.setitem( ll_rowinsert, 'CLOSE_TRANS_AMOUNT',ldb_close_amt)
		rds_object_balance_after.setitem( ll_rowinsert, 'CLOSE_BASE_AMOUNT',  ldb_close_base_amt)
	
		ldb_open_amt = ldb_close_amt
		ldb_open_base_amt = ldb_close_base_amt
	end if
	
	//-- Kéo các balance của đối tượng khác theo cùng --//
	if li_date_cnt > 0 then //-- ngày giao dịch > ngày max của bảng balance --//
		if lds_allobject_balance_after.retrieve( relativedate(ld_balance_date, -1), ld_balance_date, vs_object_type, vs_sob,gi_user_comp_id, vdb_branch_id, & 
														 vdb_object_id, vdb_account_id, vdb_subaccount, vdb_currency_id, vs_not_accept )  > 0 then
			this.f_update_allobject_openclose_value( lds_allobject_balance, lds_allobject_balance_after, rt_transaction)		
		end if
	end if
NEXT

if rds_object_balance_after.update(true,false) = -1 then
	//-- kiểm tra lỗi user khác đã cập nhật dữ liệu --//
	if rds_object_balance_after.ii_dberrorcode = -3 or rds_object_balance_after.ii_dberrorcode = 1 then
		rds_object_balance_after.ii_dberrorcode = 0
		DO while li_waiting_cnt < 20
			li_waiting_cnt++
			goto redo			
		LOOP
		gf_messagebox('m.b_doc.f_update_object_balance.02','Thông báo', rt_transaction.SQLErrText ,'stop','ok',1)	
		return -1
	end if
	gf_messagebox('m.b_doc.f_update_object_balance.02','Thông báo', rt_transaction.SQLErrText ,'stop','ok',1)	
	rollback using rt_transaction;
	destroy rds_object_balance_after
	return -1
end if
rds_object_balance_after.resetupdate( )


destroy lds_allobject_balance
destroy lds_allobject_balance_after

return 1
	
end function

private function integer f_update_allobject_openclose_value (ref t_ds_db rds_allobject_balance, t_ds_db vds_allobject_balance_after, ref t_transaction rt_transaction);//Hàm cập nhật bảng Object trans từ Post_line
long				ll_row, ll_insertrow
date				ld_balance_date
double			ldb_id

if vds_allobject_balance_after.rowcount() > 0 then
	ld_balance_date = date(vds_allobject_balance_after.getitemdatetime(1,'BALANCE_DATE'))
	ld_balance_date = relativedate(ld_balance_date, 1)
	FOR ll_row = 1 to vds_allobject_balance_after.rowcount()
		ll_insertrow = rds_allobject_balance.event e_addrow()		
		ldb_id = this.f_create_id_ex( rt_transaction)
		rds_allobject_balance.setitem(ll_insertrow,'ID',ldb_id )			
		rds_allobject_balance.setitem(ll_insertrow,'branch_id', vds_allobject_balance_after.getitemnumber(ll_row, 'branch_id') )			
		rds_allobject_balance.setitem( ll_insertrow, 'OBJECT_ID',vds_allobject_balance_after.getitemnumber(ll_row, 'OBJECT_ID'))
		rds_allobject_balance.setitem( ll_insertrow, 'OBJECT_REF_TYPE',vds_allobject_balance_after.getitemstring(ll_row, 'OBJECT_REF_TYPE'))
		rds_allobject_balance.setitem( ll_insertrow, 'TRANS_CURRENCY',vds_allobject_balance_after.getitemnumber(ll_row, 'TRANS_CURRENCY'))
		rds_allobject_balance.setitem( ll_insertrow, 'CONTROL_ACCOUNT',vds_allobject_balance_after.getitemnumber(ll_row, 'CONTROL_ACCOUNT'))
		rds_allobject_balance.setitem( ll_insertrow, 'SUBACCOUNT',vds_allobject_balance_after.getitemnumber(ll_row, 'SUBACCOUNT'))
		rds_allobject_balance.setitem( ll_insertrow, 'BALANCE_DATE', ld_balance_date)
		rds_allobject_balance.setitem( ll_insertrow, 'SOB', vds_allobject_balance_after.getitemstring(ll_row, 'SOB'))	
		rds_allobject_balance.setitem( ll_insertrow, 'NOT_ACCEPT_YN', vds_allobject_balance_after.getitemstring(ll_row, 'NOT_ACCEPT_YN'))
		
		rds_allobject_balance.setitem( ll_insertrow, 'OPEN_TRANS_AMOUNT',vds_allobject_balance_after.getitemnumber(ll_row, 'CLOSE_TRANS_AMOUNT'))
		rds_allobject_balance.setitem( ll_insertrow, 'OPEN_BASE_AMOUNT', vds_allobject_balance_after.getitemnumber(ll_row, 'CLOSE_BASE_AMOUNT'))
	
		rds_allobject_balance.setitem( ll_insertrow, 'CLOSE_TRANS_AMOUNT',vds_allobject_balance_after.getitemnumber(ll_row, 'CLOSE_TRANS_AMOUNT'))
		rds_allobject_balance.setitem( ll_insertrow, 'CLOSE_BASE_AMOUNT',  vds_allobject_balance_after.getitemnumber(ll_row, 'CLOSE_BASE_AMOUNT'))
		
	NEXT
	
	if rds_allobject_balance.update(true,false) = -1 then
		rollback using rt_transaction;
		destroy rds_allobject_balance
		return -1
	end if
	rds_allobject_balance.resetupdate( )	
end if

return 1
	
end function

public function integer f_booking_multi (double vdb_doc_id, double vdb_doc_version, date vd_trans_date, string vs_doctype, string vs_qty_yn, string vs_value_yn, double vadb_related_doc_id[], ref t_transaction rt_transaction, ref s_str_ds_4_posting rstr_ds_4_posting, s_str_streamvalue vastr_streamvalue[]);//-- Hàm ghi sổ chứng từ
//-- Tham số: vl_doc_id :id của chứng từ (document)
long 					ll_rtn

t_ds_db 				lds_ledger_trans, lds_obj_post

//-- Ghi sổ ledger_trans --//
//lds_ledger_trans = create t_ds_db
//if f_insert_ledger_trans(vdb_doc_id,vs_doctype, vd_trans_Date, rt_transaction, lds_ledger_trans) <> 1 then
//	destroy lds_ledger_trans
//	return -1
//end if
//
//-- Ghi sổ object_trans đối tượng Nợ--**//
lds_obj_post = create t_ds_db
lds_obj_post.dataobject = 'ds_obj_trans_post_dr'
if f_insert_object_trans(vdb_doc_id,vs_doctype, vd_trans_Date, rt_transaction, lds_obj_post) <> 1 then
	destroy lds_obj_post
	return -1
end if
//-- Ghi sổ object_trans đối tượng Có--**//
lds_obj_post.dataobject = 'ds_obj_trans_post_cr'
if f_insert_object_trans(vdb_doc_id,vs_doctype, vd_trans_Date, rt_transaction, lds_obj_post) <> 1 then
	destroy lds_obj_post
	return -1
end if
//-- update object_balance đối tượng Nợ--**//
lds_obj_post.dataobject = 'ds_obj_balance_post_dr'
if this.f_insert_object_balance( vdb_doc_id,  vd_trans_Date, rt_transaction, lds_obj_post, 'post',gs_sob) <> 1 then
	destroy lds_obj_post
	return -1	
end if

//-- update ledger_balance đối tượng Nợ--//
//lds_obj_post.dataobject = 'ds_ledger_balance_post_dr'
//if this.f_insert_object_balance( vdb_doc_id,  vd_trans_Date, rt_transaction, lds_obj_post, 'post',gs_sob) <> 1 then
//	destroy lds_obj_post
//	return -1	
//end if

//-- update object_balance đối tượng Có--**//
lds_obj_post.dataobject = 'ds_obj_balance_post_cr'
if this.f_insert_object_balance( vdb_doc_id,  vd_trans_Date, rt_transaction, lds_obj_post, 'post',gs_sob) <> 1 then
	destroy lds_obj_post
	return -1	
end if

//-- update ledger_balance đối tượng Có--//
//lds_obj_post.dataobject = 'ds_ledger_balance_post_cr'
//if this.f_insert_object_balance( vdb_doc_id,  vd_trans_Date, rt_transaction, lds_obj_post, 'post',gs_sob) <> 1 then
//	destroy lds_obj_post
//	return -1	
//end if

//-- upstream value --//
ll_rtn = upperbound(vastr_streamvalue[])
if ll_rtn > 0 then
	if this.f_booking_item_multi_ex(vdb_doc_id, vdb_doc_version, vs_doctype, rt_transaction,vd_trans_Date, 'post', vs_qty_yn,vs_value_yn, vadb_related_doc_id[], vastr_streamvalue[], rstr_ds_4_posting) = -1 then
		return -1
	end if
end if

//destroy lds_ledger_trans
destroy lds_obj_post
return 1
end function

public function integer f_get_trans_setup (double vdb_trans_hdr_id, ref t_ds_db rds_trans_setup, t_transaction rt_transaction);//Lấy các cài đặt có quản lý giá trị
// return: 1 thành công có dữ liệu, 0 thành công không dữ liệu, -1 lỗi

//string				ls_int_string
long	 			ll_rtn
any 				la_null[], la_data[]
//u_trans_setup 	lc_trans_setup

//lc_trans_setup = create u_trans_setup
la_data[1] = vdb_trans_hdr_id
//
//ls_int_string = 'object_name;'
//if idwsetup_initial.f_is_branch_yn('d_trans_setup_hdr_grid') then
//	la_value[2] = gdb_branch
//	ls_int_string = 'object_name;branch_id;'
//end if	

ll_rtn = this.f_init_object_table(rds_trans_setup, 'd_trans_setup_grid','object_ref_id;', la_data[], la_null[], rt_transaction)
rds_trans_setup.setsort("dw_get_amount a, posting_type a")
rds_trans_setup.sort()
//destroy lc_trans_setup
return ll_rtn
end function

protected function integer f_get_posting_object_multi (double vdb_doc_version, ref s_str_post_info vstr_post_info, t_ds_db vds_get_amount, long vl_handle_row, ref double rdb_dr_object_id, ref double rdb_cr_object_id, ref t_transaction rt_transaction, ref s_str_ds_4_posting rstr_ds_4_posting, ref double rdb_dr_subacct_id, ref double rdb_cr_subacct_id);/////////////////////////////////////////
// 2 //
////////////////////////////////////////////

long			ll_master_row
double		ldb_object_ref_id
string			ls_dwo_master, ls_colname, ls_coltype
int				li_chr_nbr, li_idx_master, li_pos_s, li_pos_e
c_dwservice_ex			l_dwservice

l_dwservice = create c_dwservice_ex

if not isnull(vstr_post_info.s_dr_dw_object) and vstr_post_info.s_dr_dw_object <> '' then
	if vstr_post_info.s_dr_dw_object = left(vds_get_amount.dataobject, len(vds_get_amount.dataobject) - 5) then 
		rdb_dr_object_id = vds_get_amount.getitemnumber( vl_handle_row ,vstr_post_info.s_dr_object_col)
		///////////////////////////////////////////////-subacct-////////////////////////////////////////////////
		if vds_get_amount.dataobject <> 'd_gl_journal_line_grid' then
			rdb_dr_subacct_id = vds_get_amount.getitemnumber( vl_handle_row ,'subaccount')
		else
			rdb_dr_subacct_id = vds_get_amount.getitemnumber( vl_handle_row ,'DR_SUBACCOUNT')
		end if										
	else			
		li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(vds_get_amount.dataobject, len(vds_get_amount.dataobject) - 5) + '[')
		if li_pos_s > 0 then //-- tìm master --//
			IF upper(vds_get_amount.describe("DataWindow.Table.UpdateTable")) = 'BOOKED_SLIP' THEN
				ldb_object_ref_id =  vds_get_amount.getitemnumber(vl_handle_row, 'id')			
			else
				ldb_object_ref_id =  vds_get_amount.getitemnumber(vl_handle_row, 'object_ref_id')	
			end if		
			li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
			li_chr_nbr = li_pos_e - (li_pos_s + len(vds_get_amount.dataobject) - 4)
			li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(vds_get_amount.dataobject) - 4, li_chr_nbr ))			
			ls_dwo_master = left(rstr_ds_4_posting.ds_master[li_idx_master].dataobject, len(rstr_ds_4_posting.ds_master[li_idx_master].dataobject) -5) 	
			IF upper(rstr_ds_4_posting.ds_master[li_idx_master].describe("DataWindow.Table.UpdateTable")) = 'DOCUMENT' THEN	
				ls_colname = 'VERSION_ID'
			else
				ls_colname = 'ID'
			end if	
			l_dwservice.f_get_build_column(rstr_ds_4_posting.ds_master[li_idx_master], ls_colname, ls_coltype)		
			rstr_ds_4_posting.ds_master[li_idx_master].f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx_master] ," "+ ls_colname+" = "+ string(ldb_object_ref_id) , " AND " )			
			rstr_ds_4_posting.ds_master[li_idx_master].f_settransobject(rt_transaction)		
			if rstr_ds_4_posting.ds_master[li_idx_master].retrieve() = 1 then		
				if vstr_post_info.s_dr_dw_object = ls_dwo_master then 		
					rdb_dr_object_id = rstr_ds_4_posting.ds_master[li_idx_master].getitemnumber( 1, vstr_post_info.s_dr_object_col)		
					///////////////////////////////////////////////-subacct-////////////////////////////////////////////////
					if rstr_ds_4_posting.ds_master[li_idx_master].dataobject <> 'd_gl_journal_line_grid' then
						rdb_dr_subacct_id =  rstr_ds_4_posting.ds_master[li_idx_master].getitemnumber( 1 ,'subaccount')	
					else
						rdb_dr_subacct_id =  rstr_ds_4_posting.ds_master[li_idx_master].getitemnumber( 1 ,'DR_SUBACCOUNT')
					end if						
				elseif li_idx_master > 1 then // lấy master cấp trên nữa --//
					IF upper(rstr_ds_4_posting.ds_master[li_idx_master].describe("DataWindow.Table.UpdateTable")) = 'BOOKED_SLIP' THEN
						ldb_object_ref_id =  rstr_ds_4_posting.ds_master[li_idx_master].getitemnumber(1, 'id')			
					else
						ldb_object_ref_id =  rstr_ds_4_posting.ds_master[li_idx_master].getitemnumber(1, 'object_ref_id')	
					end if												
					li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  ls_dwo_master + '[')
					li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
					
					if li_pos_s = 0 then
						vstr_post_info.s_err_text = 'Không tìm thấy DWO trong chuỗi datastore:'+ls_dwo_master 
	//					rollback using rt_transaction;
	//					gf_messagebox('m.b_doc.f_get_posting_object_multi.01','Thông báo','Không tìm thấy DWO trong chuỗi datastore:@'+ls_dwo_master ,'stop','ok',1)					
						return -1
					end if
					li_chr_nbr = li_pos_e - (li_pos_s + len(ls_dwo_master + '[') )
					li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(ls_dwo_master + '[') , li_chr_nbr ))			
					ls_dwo_master = left(rstr_ds_4_posting.ds_master[li_idx_master].dataobject, len(rstr_ds_4_posting.ds_master[li_idx_master].dataobject) -5)
					
					IF upper(rstr_ds_4_posting.ds_master[li_idx_master].describe("DataWindow.Table.UpdateTable")) = 'DOCUMENT' THEN	
						ls_colname = 'VERSION_ID'
					else
						ls_colname = 'ID'
					end if					
					l_dwservice.f_get_build_column(rstr_ds_4_posting.ds_master[li_idx_master], ls_colname, ls_coltype)		
					rstr_ds_4_posting.ds_master[li_idx_master].f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx_master] ," "+ ls_colname+" = "+ string(ldb_object_ref_id) , " AND " )			
					rstr_ds_4_posting.ds_master[li_idx_master].f_settransobject(rt_transaction)
					if rstr_ds_4_posting.ds_master[li_idx_master].retrieve() = 1 then
						if vstr_post_info.s_dr_dw_object = ls_dwo_master then 		
							rdb_dr_object_id = rstr_ds_4_posting.ds_master[li_idx_master].getitemnumber( 1, vstr_post_info.s_dr_object_col)		
							///////////////////////////////////////////////-subacct-////////////////////////////////////////////////
							if rstr_ds_4_posting.ds_master[li_idx_master].dataobject <> 'd_gl_journal_line_grid' then
								rdb_dr_subacct_id =  rstr_ds_4_posting.ds_master[li_idx_master].getitemnumber( 1 ,'subaccount')	
							else
								rdb_dr_subacct_id =  rstr_ds_4_posting.ds_master[li_idx_master].getitemnumber( 1 ,'DR_SUBACCOUNT')
							end if						
						elseif li_idx_master > 1 then // lấy master cấp trên nữa --//	
							ldb_object_ref_id =  rstr_ds_4_posting.ds_master[li_idx_master].getitemnumber(1, 'object_ref_id')
						elseif li_idx_master = 1 then
							 //-- tìm theo hướng detail của vds_get_amount--//
						end if
					else
						//-- error master retrive = 0 --//
					end if				
				end if
			else
				//-- error master retrive = 0 --//
			end if				
		else  //-- vds_get_amount: là master 1 --//				
			IF upper(vds_get_amount.describe("DataWindow.Table.UpdateTable")) = 'DOCUMENT' THEN
				ldb_object_ref_id =  vds_get_amount.getitemnumber(vl_handle_row, 'version_id')			
			else
				ldb_object_ref_id =  vds_get_amount.getitemnumber(vl_handle_row, 'ID')	
			end if					
			li_idx_master =  1			
			IF upper(rstr_ds_4_posting.ds_details[li_idx_master].describe("DataWindow.Table.UpdateTable")) = 'BOOKED_SLIP' THEN	
				ls_colname = 'id'
			else
				ls_colname = 'object_ref_id'
			end if					
			l_dwservice.f_get_build_column(rstr_ds_4_posting.ds_details[li_idx_master], ls_colname, ls_coltype)		
			rstr_ds_4_posting.ds_details[li_idx_master].f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx_master] ," "+ ls_colname+" = "+ string(ldb_object_ref_id) , " AND " )			
			rstr_ds_4_posting.ds_details[li_idx_master].f_settransobject(rt_transaction)			
			if rstr_ds_4_posting.ds_details[li_idx_master].retrieve() = 1 then
				if vstr_post_info.s_dr_dw_object = left(rstr_ds_4_posting.ds_details[li_idx_master].dataobject, len(rstr_ds_4_posting.ds_details[li_idx_master].dataobject) - 5) then 		
					rdb_dr_object_id = rstr_ds_4_posting.ds_details[li_idx_master].getitemnumber( 1, vstr_post_info.s_dr_object_col)		
					///////////////////////////////////////////////-subacct-////////////////////////////////////////////////
					if rstr_ds_4_posting.ds_details[li_idx_master].dataobject <> 'd_gl_journal_line_grid' then
						rdb_dr_subacct_id =  rstr_ds_4_posting.ds_master[li_idx_master].getitemnumber( 1 ,'subaccount')	
					else
						rdb_dr_subacct_id =  rstr_ds_4_posting.ds_master[li_idx_master].getitemnumber( 1 ,'DR_SUBACCOUNT')
					end if								
				else //-- tìm details cấp dưới nữa --//
					
				end if				
			else
				//-- error retrieve = 0 --//
			end if
		end if
	end if	
else 
	rdb_dr_object_id = vstr_post_info.db_dr_object_id
end if

if ( isnull(rdb_dr_object_id) or rdb_dr_object_id =0 ) and vstr_post_info.s_dr_obj_type <> 'ACCOUNT'  then
	vstr_post_info.s_err_text = 'Đối tượng NỢ chưa được nhập'
//	gf_messagebox('m.b_doc.f_get_posting_object_multi.02','Thông báo','Đối tượng NỢ chưa được nhập' ,'exclamation','ok',1)
//	rollback using rt_transaction;		
	return -1
end if

	
if not isnull(vstr_post_info.s_cr_dw_object) and vstr_post_info.s_cr_dw_object <> '' then
	if vstr_post_info.s_cr_dw_object = left(vds_get_amount.dataobject, len(vds_get_amount.dataobject) - 5) then 
		rdb_cr_object_id = vds_get_amount.getitemnumber( vl_handle_row ,vstr_post_info.s_cr_object_col)
		///////////////////////////////////////////////-subacct-////////////////////////////////////////////////
		if vds_get_amount.dataobject <> 'd_gl_journal_line_grid' then
			rdb_cr_subacct_id =  vds_get_amount.getitemnumber( vl_handle_row ,'subaccount')		
		else
			rdb_cr_subacct_id =  vds_get_amount.getitemnumber( vl_handle_row ,'CR_SUBACCOUNT')		
		end if																												
	else
		li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(vds_get_amount.dataobject, len(vds_get_amount.dataobject) - 5) + '[')
		
		if li_pos_s > 0 then //-- tìm master --//
			IF upper(vds_get_amount.describe("DataWindow.Table.UpdateTable")) = 'BOOKED_SLIP' THEN
				ldb_object_ref_id =  vds_get_amount.getitemnumber(vl_handle_row, 'id')			
			else
				ldb_object_ref_id =  vds_get_amount.getitemnumber(vl_handle_row, 'object_ref_id')	
			end if		
			li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
			li_chr_nbr = li_pos_e - (li_pos_s + len(vds_get_amount.dataobject) - 4)
			li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(vds_get_amount.dataobject) - 4, li_chr_nbr ))			
			ls_dwo_master = left(rstr_ds_4_posting.ds_master[li_idx_master].dataobject, len(rstr_ds_4_posting.ds_master[li_idx_master].dataobject) -5) 	
			IF upper(rstr_ds_4_posting.ds_master[li_idx_master].describe("DataWindow.Table.UpdateTable")) = 'DOCUMENT' THEN	
				ls_colname = 'VERSION_ID'
			else
				ls_colname = 'ID'
			end if	
			l_dwservice.f_get_build_column(rstr_ds_4_posting.ds_master[li_idx_master], ls_colname, ls_coltype)		
			rstr_ds_4_posting.ds_master[li_idx_master].f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx_master] ," "+ ls_colname+" = "+ string(ldb_object_ref_id) , " AND " )			
			rstr_ds_4_posting.ds_master[li_idx_master].f_settransobject(rt_transaction)		
			if rstr_ds_4_posting.ds_master[li_idx_master].retrieve() = 1 then			
				if ls_dwo_master = vstr_post_info.s_cr_dw_object then	
					rdb_cr_object_id = rstr_ds_4_posting.ds_master[li_idx_master].getitemnumber( 1, vstr_post_info.s_cr_object_col)		
					///////////////////////////////////////////////-subacct-////////////////////////////////////////////////
					if rstr_ds_4_posting.ds_master[li_idx_master].dataobject <> 'd_gl_journal_line_grid' then
						rdb_cr_subacct_id =  rstr_ds_4_posting.ds_master[li_idx_master].getitemnumber( 1 ,'subaccount')		
					else
						rdb_cr_subacct_id =  rstr_ds_4_posting.ds_master[li_idx_master].getitemnumber( 1 ,'CR_SUBACCOUNT')		
					end if		
				elseif li_idx_master > 1 then //-- lấy master cấp trên nữa --//
					IF upper(rstr_ds_4_posting.ds_master[li_idx_master].describe("DataWindow.Table.UpdateTable")) = 'BOOKED_SLIP' THEN
						ldb_object_ref_id =  rstr_ds_4_posting.ds_master[li_idx_master].getitemnumber(1, 'id')			
					else
						ldb_object_ref_id =  rstr_ds_4_posting.ds_master[li_idx_master].getitemnumber(1, 'object_ref_id')	
					end if		
					li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str, ls_dwo_master + '[')
					li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
					li_chr_nbr = li_pos_e - (li_pos_s + len(rstr_ds_4_posting.ds_master[li_idx_master].dataobject) - 4)
					li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(rstr_ds_4_posting.ds_master[li_idx_master].dataobject) - 4, li_chr_nbr ))			
					ls_dwo_master = left(rstr_ds_4_posting.ds_master[li_idx_master].dataobject, len(rstr_ds_4_posting.ds_master[li_idx_master].dataobject) -5) 	
					IF upper(rstr_ds_4_posting.ds_master[li_idx_master].describe("DataWindow.Table.UpdateTable")) = 'DOCUMENT' THEN	
						ls_colname = 'VERSION_ID'
					else
						ls_colname = 'ID'
					end if	
					l_dwservice.f_get_build_column(rstr_ds_4_posting.ds_master[li_idx_master], ls_colname, ls_coltype)		
					rstr_ds_4_posting.ds_master[li_idx_master].f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx_master] ," "+ ls_colname+" = "+ string(ldb_object_ref_id) , " AND " )			
					rstr_ds_4_posting.ds_master[li_idx_master].f_settransobject(rt_transaction)		
					if rstr_ds_4_posting.ds_master[li_idx_master].retrieve() = 1 then			
						if ls_dwo_master = vstr_post_info.s_cr_dw_object then	
							rdb_cr_object_id = rstr_ds_4_posting.ds_master[li_idx_master].getitemnumber( 1, vstr_post_info.s_cr_object_col)		
							///////////////////////////////////////////////-subacct-////////////////////////////////////////////////
							if rstr_ds_4_posting.ds_master[li_idx_master].dataobject <> 'd_gl_journal_line_grid' then
								rdb_cr_subacct_id =  rstr_ds_4_posting.ds_master[li_idx_master].getitemnumber( 1 ,'subaccount')		
							else
								rdb_cr_subacct_id =  rstr_ds_4_posting.ds_master[li_idx_master].getitemnumber( 1 ,'CR_SUBACCOUNT')		
							end if		
						elseif li_idx_master > 1 then //-- lấy master cấp trên nữa --//		
						end if
					else
						//-- error retrieve = 0--//
					end if
				elseif li_idx_master = 1 then 
					//-- lấy hướng detail của vds_get_amount --//
				end if
			else
				//-- error retrieve = 0--//
			end if		
		else //--vds_get_amount là master 1--//
			//-- tìm detail--
			IF upper(vds_get_amount.describe("DataWindow.Table.UpdateTable")) = 'DOCUMENT' THEN
				ldb_object_ref_id =  vds_get_amount.getitemnumber(vl_handle_row, 'version_id')			
			else
				ldb_object_ref_id =  vds_get_amount.getitemnumber(vl_handle_row, 'ID')	
			end if					
			li_idx_master =  1			
			IF upper(rstr_ds_4_posting.ds_details[li_idx_master].describe("DataWindow.Table.UpdateTable")) = 'BOOKED_SLIP' THEN	
				ls_colname = 'id'
			else
				ls_colname = 'object_ref_id'
			end if					
			l_dwservice.f_get_build_column(rstr_ds_4_posting.ds_details[li_idx_master], ls_colname, ls_coltype)		
			rstr_ds_4_posting.ds_details[li_idx_master].f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx_master] ," "+ ls_colname+" = "+ string(ldb_object_ref_id) , " AND " )			
			rstr_ds_4_posting.ds_details[li_idx_master].f_settransobject(rt_transaction)			
			if rstr_ds_4_posting.ds_details[li_idx_master].retrieve() = 1 then
				if left(rstr_ds_4_posting.ds_details[li_idx_master].dataobject, len(rstr_ds_4_posting.ds_details[li_idx_master].dataobject) - 5) = vstr_post_info.s_cr_dw_object then	
					rdb_cr_object_id = rstr_ds_4_posting.ds_details[li_idx_master].getitemnumber( 1, vstr_post_info.s_cr_object_col)		
					///////////////////////////////////////////////-subacct-////////////////////////////////////////////////
					if rstr_ds_4_posting.ds_details[li_idx_master].dataobject <> 'd_gl_journal_line_grid' then
						rdb_cr_subacct_id =  rstr_ds_4_posting.ds_details[li_idx_master].getitemnumber( 1 ,'subaccount')		
					else
						rdb_cr_subacct_id =  rstr_ds_4_posting.ds_details[li_idx_master].getitemnumber( 1 ,'CR_SUBACCOUNT')		
					end if		
				else //-- lấy detail cấp dưới nữa --//		
				end if				
			else //-- error retrieve = 0--//
			end if
			
		end if		
	end if	
else
	rdb_cr_object_id = vstr_post_info.db_cr_object_id
end if

if ( isnull(rdb_cr_object_id) or rdb_cr_object_id =0 ) and vstr_post_info.s_cr_obj_type <> 'ACCOUNT'  then
	vstr_post_info.s_err_text = 'Đối tượng CÓ chưa được nhập'
//	gf_messagebox('m.b_doc.f_get_posting_object_multi.03','Thông báo','Đối tượng CÓ chưa được nhập' ,'exclamation','ok',1)
//	rollback using rt_transaction;		
	return -1
end if

return 1
end function

public function integer f_get_trans_setup_account (double vdb_dr_object, double vdb_cr_object, string vs_condition_val, string vs_condition_coltype, s_str_post_account vstr_post_account_spec[], s_str_post_account vstr_post_account_grp[], s_str_post_account vstr_post_account_all[], ref s_str_post_info vstr_post_info, ref s_str_post_account rstr_post_account, ref t_transaction rt_transaction);/**********************
Đang dùng
----------------
Return:    
    -1 : error 
    1  : OK: có tài khoản định khoản
    0  : OK: không định khoản
    2  : OK: Định khoản cho tất cả trường hợp (ALL)
    3  : OK:  đối tượng nợ/có thay đổi ->cần get lại
*/

boolean                lb_all = true, lb_found, lb_ok
string                    ls_find_dr, ls_find_cr, ls_idx, ls_obj_code, ls_criteria_value, ls_criteria_value_tmp, ls_find[6]
string                    ls_dr_objtype, ls_cr_objtype, ls_dr_objtype_other, ls_cr_objtype_other
double                ldb_posting_grp, ldb_posting_grp_offset
int                        li_pos, li_idx, li_pos2, li_grp_idx
//b_rule                lb_rule


if isnull(vs_condition_val) then vs_condition_val = ''

if vdb_dr_object > 0 then
    ls_dr_objtype = this.f_get_object_type_ex(vdb_dr_object, rt_transaction )
//    ls_dr_objtype_other = this.f_get_obj_type_other( vdb_dr_object, ls_dr_objtype)
elseif vdb_dr_object = 0 or isnull(vdb_dr_object) then
    ls_dr_objtype = vstr_post_info.s_dr_obj_type
end if
if vdb_cr_object > 0 then 
    ls_cr_objtype = this.f_get_object_type_ex(vdb_cr_object, rt_transaction )
//    ls_cr_objtype_other = this.f_get_obj_type_other( vdb_cr_object, ls_cr_objtype)
elseif vdb_cr_object = 0 or isnull(vdb_cr_object) then
    ls_cr_objtype =  vstr_post_info.s_cr_obj_type
end if

//--SPEC--//
if upperbound(vstr_post_account_spec[]) > 0 then
    lb_all = false    
    if not match(vstr_post_info.s_spec_idx, "[=><]") then //-- Cài đặt Không có điều kiện --//
        	if vstr_post_account_spec[1].s_setup_type = 'specific;all;' then
            ls_find_dr = ';'+ls_dr_objtype+';'+ ls_cr_objtype + ';'+string(vdb_dr_object)+';' + vs_condition_val+'['
        	elseif  vstr_post_account_spec[1].s_setup_type = 'specific;group;' and  vdb_cr_object > 0 then
            ldb_posting_grp = this.f_get_posting_group(vdb_cr_object,  rt_transaction)
		   if isnull(ldb_posting_grp) then ldb_posting_grp = 0
            ls_find_dr = ';'+ls_dr_objtype+';'+ ls_cr_objtype +';'+string(vdb_dr_object)+';' + string(ldb_posting_grp)+';'+ vs_condition_val+'['
		elseif vstr_post_account_spec[1].s_setup_type = 'specific;specific;' and vdb_dr_object > 0 and vdb_cr_object > 0  then
			ls_find_dr = ';'+ls_dr_objtype+';'+ ls_cr_objtype + ';'+string(vdb_dr_object)+';' +string(vdb_cr_object)+';' + vs_condition_val+'['
        	end if
        
        if vstr_post_account_spec[1].s_setup_type = 'all;specific;' then
            ls_find_cr = ';'+ls_dr_objtype+';'+ ls_cr_objtype + ';'+string(vdb_cr_object)+';' + vs_condition_val+'['
        elseif vstr_post_account_spec[1].s_setup_type = 'group;specific;' and  vdb_dr_object > 0 then
            ldb_posting_grp = this.f_get_posting_group(vdb_dr_object, rt_transaction )
		   if isnull(ldb_posting_grp) then ldb_posting_grp = 0
            ls_find_cr = ';'+ls_dr_objtype+';'+ ls_cr_objtype +';' + string(ldb_posting_grp)+ ';'+string(vdb_cr_object)+';' + vs_condition_val+'['
        end if
        
        if pos(vstr_post_info.s_spec_idx,ls_find_dr) > 0 then
            ls_idx = mid(vstr_post_info.s_spec_idx, pos(vstr_post_info.s_spec_idx,ls_find_dr) + len(ls_find_dr))
            ls_idx = mid(ls_idx, 1, pos(ls_idx, ']') -1)
            rstr_post_account = vstr_post_account_spec[integer(ls_idx)]
            
            return 1
        elseif pos(vstr_post_info.s_spec_idx,ls_find_cr) > 0 then
            ls_idx = mid(vstr_post_info.s_spec_idx, pos(vstr_post_info.s_spec_idx,ls_find_cr) + len(ls_find_cr))
            ls_idx = mid(ls_idx, 1, pos(ls_idx, ']') -1)
            rstr_post_account = vstr_post_account_spec[integer(ls_idx)]            
            return 1
        elseif ls_dr_objtype_other <> '' and ls_cr_objtype_other <> ''  then
            if vstr_post_account_spec[1].s_setup_type = 'specific;all;' then
                ls_find_dr = ';'+ls_dr_objtype_other+';'+ ls_cr_objtype_other + ';'+string(vdb_dr_object)+';' + vs_condition_val+'['
            elseif  vstr_post_account_spec[1].s_setup_type = 'specific;group;' and  vdb_cr_object > 0 then
                ldb_posting_grp = this.f_get_posting_group(vdb_cr_object, rt_transaction )
			  if isnull(ldb_posting_grp) then ldb_posting_grp = 0
                ls_find_dr = ';'+ls_dr_objtype_other+';'+ ls_cr_objtype_other + ';'+string(vdb_dr_object)+';' + string(ldb_posting_grp)+';' + vs_condition_val+'['
            end if            
                        
            if pos(vstr_post_info.s_spec_idx,ls_find_dr) > 0 then
                ls_idx = mid(vstr_post_info.s_spec_idx, pos(vstr_post_info.s_spec_idx,ls_find_dr) + len(ls_find_dr))
                ls_idx = mid(ls_idx, 1, pos(ls_idx, ']') -1)
                rstr_post_account = vstr_post_account_spec[integer(ls_idx)]                
                return 1            
            else
                
                if vstr_post_account_spec[1].s_setup_type = 'all;specific;' then
                    ls_find_cr = ';'+ls_dr_objtype_other+';'+ ls_cr_objtype_other + ';'+string(vdb_cr_object)+';' + vs_condition_val+'['
                elseif vstr_post_account_spec[1].s_setup_type = 'group;specific;' and  vdb_dr_object > 0 then
                    ldb_posting_grp = this.f_get_posting_group(vdb_dr_object,  rt_transaction)
				  if isnull(ldb_posting_grp) then ldb_posting_grp = 0
                    ls_find_cr = ';'+ls_dr_objtype_other+';'+ ls_cr_objtype_other +';' + string(ldb_posting_grp)+  ';'+string(vdb_cr_object)+';' + vs_condition_val+'['
                end if                
                
                if pos(vstr_post_info.s_spec_idx,ls_find_cr) > 0 then
                    ls_idx = mid(vstr_post_info.s_spec_idx, pos(vstr_post_info.s_spec_idx,ls_find_cr) + len(ls_find_cr))
                    ls_idx = mid(ls_idx, 1, pos(ls_idx, ']') -1)
                    rstr_post_account = vstr_post_account_spec[integer(ls_idx)]                
                    return 1    
                end if
            end if            
        elseif ls_dr_objtype_other <> '' then
            
            if vstr_post_account_spec[1].s_setup_type = 'specific;all;' then
                ls_find_dr = ';'+ls_dr_objtype_other+';'+ ls_cr_objtype + ';'+string(vdb_dr_object)+';' + vs_condition_val+'['
            elseif  vstr_post_account_spec[1].s_setup_type = 'specific;group;' and  vdb_cr_object > 0 then
                ldb_posting_grp = this.f_get_posting_group(vdb_cr_object, rt_transaction )
			  if isnull(ldb_posting_grp) then ldb_posting_grp = 0
                ls_find_dr = ';'+ls_dr_objtype_other+';'+ ls_cr_objtype + ';'+string(vdb_dr_object)+';' + string(ldb_posting_grp)+ ';' + vs_condition_val+'['
            end if                        
            
            if pos(vstr_post_info.s_spec_idx,ls_find_dr) > 0 then
                ls_idx = mid(vstr_post_info.s_spec_idx, pos(vstr_post_info.s_spec_idx,ls_find_dr) + len(ls_find_dr))
                ls_idx = mid(ls_idx, 1, pos(ls_idx, ']') -1)
                rstr_post_account = vstr_post_account_spec[integer(ls_idx)]                
                return 1            
            end if
        elseif ls_cr_objtype_other <> '' then
            
            if vstr_post_account_spec[1].s_setup_type = 'all;specific;' then
                ls_find_cr = ';'+ls_dr_objtype+';'+ ls_cr_objtype_other + ';'+string(vdb_cr_object)+';' + vs_condition_val+'['
            elseif vstr_post_account_spec[1].s_setup_type = 'group;specific;' and  vdb_dr_object > 0 then
                ldb_posting_grp = this.f_get_posting_group(vdb_dr_object, rt_transaction )
			  if isnull(ldb_posting_grp) then ldb_posting_grp = 0
                ls_find_cr = ';'+ls_dr_objtype+';'+ ls_cr_objtype_other + ';' + string(ldb_posting_grp)+';'+string(vdb_cr_object)+';' + vs_condition_val+'['
            end if                            
            if pos(vstr_post_info.s_spec_idx,ls_find_cr) > 0 then
                ls_idx = mid(vstr_post_info.s_spec_idx, pos(vstr_post_info.s_spec_idx,ls_find_cr) + len(ls_find_cr))
                ls_idx = mid(ls_idx, 1, pos(ls_idx, ']') -1)
                rstr_post_account = vstr_post_account_spec[integer(ls_idx)]            
                return 1            
            end if
        end if
    else //-- Cài đặt có điều kiện --//
//        ls_find[1] = ';'+ls_dr_objtype+';'+ ls_cr_objtype + ';'+string(vdb_dr_object)+';' 
        ls_find[1] =  ';'+string(vdb_dr_object)+';' 
        li_pos = pos(vstr_post_info.s_spec_idx,ls_find[1])
        li_idx = 1
        if li_pos = 0 then
//            ls_find[2] = ';'+ls_dr_objtype+';'+ ls_cr_objtype +';'+string(vdb_cr_object)+';' 
            ls_find[2] = ';'+string(vdb_cr_object)+';' 
            li_pos = pos(vstr_post_info.s_spec_idx,ls_find[2])
            li_idx = 2
        end if
        
        if li_pos = 0 and ls_dr_objtype_other <> '' then
//            ls_find[3] = ';'+ls_dr_objtype_other+';'+ ls_cr_objtype +';'+string(vdb_dr_object)+';' 
            ls_find[3] = ';'+string(vdb_dr_object)+';' 
            li_pos = pos(vstr_post_info.s_spec_idx,ls_find[3])
            li_idx = 3
        end if
        if li_pos = 0 and ls_cr_objtype_other <> '' then
//            ls_find[4] = ';'+ls_dr_objtype+';'+ ls_cr_objtype_other +';'+string(vdb_cr_object)+';'
            ls_find[4] = ';'+string(vdb_cr_object)+';' 
            li_pos = pos(vstr_post_info.s_spec_idx,ls_find[4])
            li_idx = 4
        end if
        if li_pos = 0 and ls_dr_objtype_other <>'' and ls_cr_objtype_other <> '' then
//            ls_find[5] = ';'+ls_dr_objtype_other+';'+ ls_cr_objtype_other +';'+string(vdb_dr_object)+';' 
            ls_find[5] = ';'+string(vdb_dr_object)+';' 
            li_pos = pos(vstr_post_info.s_spec_idx,ls_find[5])
            li_idx = 5
        end if
        if li_pos = 0 and ls_dr_objtype_other <>'' and ls_cr_objtype_other <> '' then
//            ls_find[6] = ';'+ls_dr_objtype_other+';'+ ls_cr_objtype_other +';'+string(vdb_cr_object)+';' 
            ls_find[6] = ';'+string(vdb_cr_object)+';' 
            li_pos = pos(vstr_post_info.s_spec_idx,ls_find[6])
            li_idx = 6
        end if        
        DO while li_pos > 0
            ls_criteria_value = mid(vstr_post_info.s_spec_idx, li_pos + len(ls_find[li_idx]))
            ls_criteria_value = mid(ls_criteria_value, 1, pos(ls_criteria_value, '[') -1)
            li_pos2 = lastPos(ls_criteria_value, ';')
            if li_pos2 > 0 then
                ls_criteria_value_tmp = mid(ls_criteria_value, li_pos2 + 1)
            else
                ls_criteria_value_tmp = ls_criteria_value
            end if
            if vs_condition_val = '' and vs_condition_coltype = 'number' then vs_condition_val = '0'
//            lb_ok =  lb_rule.f_is_criteria_ok( vs_condition_val, ls_criteria_value_tmp, vs_condition_coltype)
            if lb_ok then
                ls_find[li_idx] +=  ls_criteria_value+'['
                if pos(vstr_post_info.s_spec_idx,ls_find[li_idx]) > 0 then
                    ls_idx = mid(vstr_post_info.s_spec_idx, pos(vstr_post_info.s_spec_idx,ls_find[li_idx]) + len(ls_find[li_idx]))
                    ls_idx = mid(ls_idx, 1, pos(ls_idx, ']') -1)
                    rstr_post_account = vstr_post_account_spec[integer(ls_idx)]
                    if rstr_post_account.s_dr_obj_type <> ls_dr_objtype or rstr_post_account.s_cr_obj_type <> ls_cr_objtype then
                        return 3
                    else
                        return 1
                    end if                    
//                    return 1            
                else
                    li_pos = pos(vstr_post_info.s_spec_idx,ls_find[li_idx], li_pos + len(ls_find[li_idx]))                    
                end if
            else
                li_pos = pos(vstr_post_info.s_spec_idx,ls_find[li_idx], li_pos + len(ls_find[li_idx]))
            end if            
        LOOP            
    
    end if
end if


//--GROUP--//
if upperbound(vstr_post_account_grp[]) > 0 then
    lb_all = false
    if not match(vstr_post_info.s_group_idx, "[=><]") then   //-- Cài đặt không có điều kiện --//
        //-- lấy object type--//
        if vdb_dr_object > 0 then
            ldb_posting_grp = this.f_get_posting_group(vdb_dr_object, rt_transaction )
		   if isnull(ldb_posting_grp) then ldb_posting_grp = 0
            if ldb_posting_grp < 1 then
                ls_obj_code = this.f_get_object_code_ex(vdb_dr_object, rt_transaction)
			   vstr_post_info.s_err_text = 'Đối tượng chưa được khai báo nhóm ghi sổ@'+ ls_obj_code
//                gf_messagebox('m.b_doc.f_get_setup_account.01.3','Thông báo','Đối tượng chưa được khai báo nhóm ghi sổ@'+ ls_obj_code,'stop','ok',1)
                return -1            
            end if
        end if
        //-- lấy group idx --//
		FOR li_grp_idx = 1 to  upperbound(vstr_post_account_grp[])
			if vstr_post_account_grp[li_grp_idx].s_dr_obj_type = ls_dr_objtype and vstr_post_account_grp[li_grp_idx].s_cr_obj_type = ls_cr_objtype then
				lb_found = true
				exit 
			end if
		NEXT
		if not lb_found then li_grp_idx =1
        if vstr_post_account_grp[li_grp_idx].s_setup_type = 'group;all;' then
            ls_find_dr = ';'+ls_dr_objtype+';'+ ls_cr_objtype +';'+string(ldb_posting_grp)+';' + vs_condition_val+'['    
        elseif  vstr_post_account_grp[li_grp_idx].s_setup_type = 'group;group;' and  vdb_cr_object > 0 then
            ldb_posting_grp_offset = this.f_get_posting_group(vdb_cr_object , rt_transaction)
		   if isnull(ldb_posting_grp_offset) then ldb_posting_grp_offset = 0
            ls_find_dr = ';'+ls_dr_objtype+';'+ ls_cr_objtype + ';'+string(ldb_posting_grp)+';' + string(ldb_posting_grp_offset)+ ';' + vs_condition_val+'['
        end if                            
        
        if pos(vstr_post_info.s_group_idx,ls_find_dr) > 0 then
            ls_idx = mid(vstr_post_info.s_group_idx, pos(vstr_post_info.s_group_idx,ls_find_dr) + len(ls_find_dr))
            ls_idx = mid(ls_idx, 1, pos(ls_idx, ']') -1)
            rstr_post_account = vstr_post_account_grp[integer(ls_idx)]
            return 1
        elseif ls_dr_objtype_other <> '' or ls_cr_objtype_other <> '' then
                            
            if vstr_post_account_grp[li_grp_idx].s_setup_type = 'group;all;' then
                ls_find_dr = ';'+ls_dr_objtype_other+';'+ ls_cr_objtype +';'+string(ldb_posting_grp)+';' + vs_condition_val+'['    
            elseif  vstr_post_account_grp[li_grp_idx].s_setup_type = 'group;group;' and  vdb_cr_object > 0 then
                ldb_posting_grp_offset = this.f_get_posting_group(vdb_cr_object, rt_transaction )
			  if isnull(ldb_posting_grp_offset) then ldb_posting_grp_offset = 0
                ls_find_dr = ';'+ls_dr_objtype_other+';'+ ls_cr_objtype + ';'+string(ldb_posting_grp)+';' + string(ldb_posting_grp_offset)+ ';' + vs_condition_val+'['
            end if                                    
            if pos(vstr_post_info.s_group_idx,ls_find_dr) > 0 then
                ls_idx = mid(vstr_post_info.s_group_idx, pos(vstr_post_info.s_group_idx,ls_find_dr) + len(ls_find_dr))
                ls_idx = mid(ls_idx, 1, pos(ls_idx, ']') -1)
                rstr_post_account = vstr_post_account_grp[integer(ls_idx)]
                return 1            
            end if
                        
            if vstr_post_account_grp[li_grp_idx].s_setup_type = 'group;all;' then
                ls_find_dr = ';'+ls_dr_objtype +';'+ ls_cr_objtype_other +';'+string(ldb_posting_grp)+';' + vs_condition_val+'['
            elseif  vstr_post_account_grp[li_grp_idx].s_setup_type = 'group;group;' and  vdb_cr_object > 0 then
                ldb_posting_grp_offset = this.f_get_posting_group(vdb_cr_object ,rt_transaction )
			   if isnull(ldb_posting_grp_offset) then ldb_posting_grp_offset = 0
                ls_find_dr = ';'+ls_dr_objtype+';'+ ls_cr_objtype_other + ';'+string(ldb_posting_grp)+';' + string(ldb_posting_grp_offset)+ ';' + vs_condition_val+'['
            end if                
            if pos(vstr_post_info.s_group_idx,ls_find_dr) > 0 then
                ls_idx = mid(vstr_post_info.s_group_idx, pos(vstr_post_info.s_group_idx,ls_find_dr) + len(ls_find_dr))
                ls_idx = mid(ls_idx, 1, pos(ls_idx, ']') -1)
                rstr_post_account = vstr_post_account_grp[integer(ls_idx)]
                return 1            
            end if            
                                    
            if vstr_post_account_grp[li_grp_idx].s_setup_type = 'group;all;' then
                ls_find_dr = ';'+ls_dr_objtype_other +';'+ ls_cr_objtype_other +';'+string(ldb_posting_grp)+';' + vs_condition_val+'['
            elseif  vstr_post_account_grp[li_grp_idx].s_setup_type = 'group;group;' and  vdb_cr_object > 0 then
                ldb_posting_grp_offset = this.f_get_posting_group(vdb_cr_object, rt_transaction )
			  if isnull(ldb_posting_grp_offset) then ldb_posting_grp_offset = 0
                ls_find_dr = ';'+ls_dr_objtype_other+';'+ ls_cr_objtype_other + ';'+string(ldb_posting_grp)+';' + string(ldb_posting_grp_offset)+ ';' + vs_condition_val+'['
            end if                            
            
            if pos(vstr_post_info.s_group_idx,ls_find_dr) > 0 then
                ls_idx = mid(vstr_post_info.s_group_idx, pos(vstr_post_info.s_group_idx,ls_find_dr) + len(ls_find_dr))
                ls_idx = mid(ls_idx, 1, pos(ls_idx, ']') -1)
                rstr_post_account = vstr_post_account_grp[integer(ls_idx)]            
                return 1        
            end if                            
            
        end if
        
        //-- lấy object type--//
        if vdb_cr_object > 0 then
        ldb_posting_grp = this.f_get_posting_group(vdb_cr_object, rt_transaction )
		if isnull(ldb_posting_grp) then ldb_posting_grp = 0
            if ldb_posting_grp < 1 then
                ls_obj_code = this.f_get_object_code_ex(vdb_dr_object, rt_transaction)
			   vstr_post_info.s_err_text = 'Đối tượng chưa được khai báo nhóm ghi sổ@'+ ls_obj_code
//                gf_messagebox('m.b_doc.f_get_setup_account.01.3','Thông báo','Đối tượng chưa được khai báo nhóm ghi sổ@'+ ls_obj_code,'stop','ok',1)
                return -1            
            end if        
        end if
                
        if vstr_post_account_grp[li_grp_idx].s_setup_type = 'all;group;' then
            ls_find_cr = ';'+ls_dr_objtype+';'+ ls_cr_objtype +';'+string(ldb_posting_grp)+';' + vs_condition_val+'['
        elseif  vstr_post_account_grp[li_grp_idx].s_setup_type = 'group;group;' and  vdb_dr_object > 0 then
            ldb_posting_grp_offset = this.f_get_posting_group(vdb_dr_object , rt_transaction)
		   if isnull(ldb_posting_grp_offset) then ldb_posting_grp_offset = 0 
            ls_find_cr = ';'+ls_dr_objtype+';'+ ls_cr_objtype + ';'+string(ldb_posting_grp_offset)+';' + string(ldb_posting_grp)+ ';' + vs_condition_val+'['
        end if                            
        
        if pos(vstr_post_info.s_group_idx,ls_find_cr) > 0 then
            ls_idx = mid(vstr_post_info.s_group_idx, pos(vstr_post_info.s_group_idx,ls_find_cr) + len(ls_find_cr))
            ls_idx = mid(ls_idx, 1, pos(ls_idx, ']') -1)
            rstr_post_account = vstr_post_account_grp[integer(ls_idx)]            
            return 1
        elseif  ls_dr_objtype_other <> '' or ls_cr_objtype_other <> '' then
            
            if vstr_post_account_grp[1].s_setup_type = 'all;group;' then
                ls_find_cr = ';'+ls_dr_objtype_other+';'+ ls_cr_objtype +';'+string(ldb_posting_grp)+';' + vs_condition_val+'['
            elseif  vstr_post_account_grp[1].s_setup_type = 'group;group;' and  vdb_dr_object > 0 then
                ldb_posting_grp_offset = this.f_get_posting_group(vdb_dr_object, rt_transaction )
			   if isnull(ldb_posting_grp_offset) then ldb_posting_grp_offset = 0
                ls_find_cr = ';'+ls_dr_objtype_other+';'+ ls_cr_objtype + ';'+string(ldb_posting_grp_offset)+';' + string(ldb_posting_grp)+ ';' + vs_condition_val+'['
            end if                            
            
            if pos(vstr_post_info.s_group_idx,ls_find_cr) > 0 then
                ls_idx = mid(vstr_post_info.s_group_idx, pos(vstr_post_info.s_group_idx,ls_find_cr) + len(ls_find_cr))
                ls_idx = mid(ls_idx, 1, pos(ls_idx, ']') -1)
                rstr_post_account = vstr_post_account_grp[integer(ls_idx)]            
                return 1        
            end if
            
            if vstr_post_account_grp[li_grp_idx].s_setup_type = 'all;group;' then
                ls_find_cr = ';'+ls_dr_objtype +';'+ ls_cr_objtype_other +';'+string(ldb_posting_grp)+';' + vs_condition_val+'['
            elseif  vstr_post_account_grp[li_grp_idx].s_setup_type = 'group;group;' and  vdb_dr_object > 0 then
                ldb_posting_grp_offset = this.f_get_posting_group(vdb_dr_object , rt_transaction)
			  if isnull(ldb_posting_grp_offset) then ldb_posting_grp_offset = 0
                ls_find_cr = ';'+ls_dr_objtype+';'+ ls_cr_objtype_other + ';'+string(ldb_posting_grp_offset)+';' + string(ldb_posting_grp)+ ';' + vs_condition_val+'['
            end if                    
            
            if pos(vstr_post_info.s_group_idx,ls_find_cr) > 0 then
                ls_idx = mid(vstr_post_info.s_group_idx, pos(vstr_post_info.s_group_idx,ls_find_cr) + len(ls_find_cr))
                ls_idx = mid(ls_idx, 1, pos(ls_idx, ']') -1)
                rstr_post_account = vstr_post_account_grp[integer(ls_idx)]            
                return 1        
            end if                
            
            if vstr_post_account_grp[li_grp_idx].s_setup_type = 'all;group;' then
                ls_find_cr = ';'+ls_dr_objtype_other +';'+ ls_cr_objtype_other +';'+string(ldb_posting_grp)+';' + vs_condition_val+'['
            elseif  vstr_post_account_grp[li_grp_idx].s_setup_type = 'group;group;' and  vdb_dr_object > 0 then
                ldb_posting_grp_offset = this.f_get_posting_group(vdb_dr_object, rt_transaction )
			  if isnull(ldb_posting_grp_offset) then ldb_posting_grp_offset = 0
                ls_find_cr = ';'+ls_dr_objtype_other+';'+ ls_cr_objtype_other + ';'+string(ldb_posting_grp_offset)+';' + string(ldb_posting_grp)+ ';' + vs_condition_val+'['
            end if                                
            if pos(vstr_post_info.s_group_idx,ls_find_cr) > 0 then
                ls_idx = mid(vstr_post_info.s_group_idx, pos(vstr_post_info.s_group_idx,ls_find_cr) + len(ls_find_cr))
                ls_idx = mid(ls_idx, 1, pos(ls_idx, ']') -1)
                rstr_post_account = vstr_post_account_grp[integer(ls_idx)]            
                return 1        
            end if                            

        end if

    else  //-- Cài đặt có điều kiện --//
        
        if vdb_dr_object > 0 then
            ldb_posting_grp = this.f_get_posting_group(vdb_dr_object, rt_transaction )
		   if isnull(ldb_posting_grp) then ldb_posting_grp = 0
            if ldb_posting_grp < 1 then
                ls_obj_code = this.f_get_object_code_ex(vdb_dr_object, rt_transaction)
			   vstr_post_info.s_err_text = 'Đối tượng chưa được khai báo nhóm ghi sổ@'+ ls_obj_code
//                gf_messagebox('m.b_doc.f_get_setup_account.01.3','Thông báo','Đối tượng chưa được khai báo nhóm ghi sổ@'+ ls_obj_code,'stop','ok',1)
                return -1            
            end if
            ls_find[1] = ';'+string(ldb_posting_grp)+';' 
            li_pos = pos(vstr_post_info.s_group_idx,ls_find[1])    
            DO while li_pos > 0
                ls_criteria_value = mid(vstr_post_info.s_group_idx, li_pos + len(ls_find[1]))
                ls_criteria_value = mid(ls_criteria_value, 1, pos(ls_criteria_value, '[') -1)
                if li_pos2 > 0 then
                    ls_criteria_value_tmp = mid(ls_criteria_value, li_pos2 + 1)
                else
                    ls_criteria_value_tmp = ls_criteria_value
                end if                
                if vs_condition_val = '' and vs_condition_coltype = 'number' then vs_condition_val = '0'
//                lb_ok =  lb_rule.f_is_criteria_ok( vs_condition_val, ls_criteria_value_tmp, vs_condition_coltype )
                
                if lb_ok then
                    ls_find[1] = ';'+string(ldb_posting_grp)+';' + ls_criteria_value+'['
                    if pos(vstr_post_info.s_group_idx,ls_find[1]) > 0 then
                        ls_idx = mid(vstr_post_info.s_group_idx, pos(vstr_post_info.s_group_idx,ls_find[1]) + len(ls_find[1]))
                        ls_idx = mid(ls_idx, 1, pos(ls_idx, ']') -1)
                        rstr_post_account = vstr_post_account_grp[integer(ls_idx)]
                        if rstr_post_account.s_dr_obj_type <> ls_dr_objtype or rstr_post_account.s_cr_obj_type <> ls_cr_objtype then
                            return 3
                        else
                            return 1
                        end if
                    else 
                        li_pos = pos(vstr_post_info.s_group_idx,ls_find[1], li_pos + len(ls_find[1]))
                    end if
                else
                    li_pos = pos(vstr_post_info.s_group_idx,ls_find[1], li_pos + len(ls_find[1]))
                end if            
            LOOP                        
        end if        
        if vdb_cr_object > 0 then
            ldb_posting_grp = this.f_get_posting_group(vdb_cr_object, rt_transaction )
		   if isnull(ldb_posting_grp) then ldb_posting_grp = 0
            if ldb_posting_grp < 1 then
                ls_obj_code = this.f_get_object_code_ex(vdb_dr_object, rt_transaction)
			   vstr_post_info.s_err_text = 'Đối tượng chưa được khai báo nhóm ghi sổ@'+ ls_obj_code
//                gf_messagebox('m.b_doc.f_get_setup_account.01.3','Thông báo','Đối tượng chưa được khai báo nhóm ghi sổ@'+ ls_obj_code,'stop','ok',1)
                return -1            
            end if        
            ls_find[1] =  ';'+string(ldb_posting_grp)+';' 
            li_pos = pos(vstr_post_info.s_group_idx,ls_find[1])
            DO while li_pos > 0
                ls_criteria_value = mid(vstr_post_info.s_group_idx, li_pos + len(ls_find[1]))
                ls_criteria_value = mid(ls_criteria_value, 1, pos(ls_criteria_value, '[') -1)
                if li_pos2 > 0 then
                    ls_criteria_value_tmp = mid(ls_criteria_value, li_pos2 + 1)
                else
                    ls_criteria_value_tmp = ls_criteria_value
                end if                            
                if vs_condition_val = '' and vs_condition_coltype = 'number' then vs_condition_val = '0'
//                lb_ok =  lb_rule.f_is_criteria_ok( vs_condition_val, ls_criteria_value_tmp, vs_condition_coltype )

                if lb_ok then
                    ls_find[1] =  ';'+string(ldb_posting_grp)+';' + ls_criteria_value+'['
                    if pos(vstr_post_info.s_group_idx,ls_find[1]) > 0 then
                        ls_idx = mid(vstr_post_info.s_group_idx, pos(vstr_post_info.s_group_idx,ls_find[1]) + len(ls_find[1]))
                        ls_idx = mid(ls_idx, 1, pos(ls_idx, ']') -1)
                        rstr_post_account = vstr_post_account_grp[integer(ls_idx)]
                        if rstr_post_account.s_dr_obj_type <> ls_dr_objtype or rstr_post_account.s_cr_obj_type <> ls_cr_objtype then
                            return 3
                        else
                            return 1
                        end if
                    else
                        li_pos = pos(vstr_post_info.s_group_idx,ls_find[1], li_pos + len(ls_find[1]))
                    end if
                else
                    li_pos = pos(vstr_post_info.s_group_idx,ls_find[1], li_pos + len(ls_find[1]))
                end if            
            LOOP                        
        end if            

    end if
end if



//--ALL--//
if upperbound(vstr_post_account_all[]) > 0 then
    if not match(vstr_post_info.s_all_idx, "[=><]") then   //-- Cài đặt không có điều kiện --//
        ls_find[1] = ';'+ls_dr_objtype+';'+ ls_cr_objtype +';'+';' + vs_condition_val+'['
        if pos(vstr_post_info.s_all_idx,ls_find[1]) > 0 then
            ls_idx = mid(vstr_post_info.s_all_idx, pos(vstr_post_info.s_all_idx,ls_find[1]) + len(ls_find[1]))
            ls_idx = mid(ls_idx, 1, pos(ls_idx, ']') -1)
            
            rstr_post_account = vstr_post_account_all[integer(ls_idx)]
            if lb_all then 
                return 2
            else
                return 1
            end if
        elseif  ls_dr_objtype_other <> '' and ls_cr_objtype_other <> ''  then
            ls_find[1] = ';'+ls_dr_objtype_other+';'+ ls_cr_objtype_other +';'+';' + vs_condition_val+'['
            if pos(vstr_post_info.s_all_idx,ls_find[1]) > 0 then
                ls_idx = mid(vstr_post_info.s_all_idx, pos(vstr_post_info.s_all_idx,ls_find[1]) + len(ls_find[1]))
                ls_idx = mid(ls_idx, 1, pos(ls_idx, ']') -1)
                
                rstr_post_account = vstr_post_account_all[integer(ls_idx)]
                if lb_all then 
                    return 2
                else
                    return 1
                end if            
            end if
        elseif  ls_dr_objtype_other <> '' then
            ls_find[1] = ';'+ls_dr_objtype_other+';'+ ls_cr_objtype +';'+';' + vs_condition_val+'['
            if pos(vstr_post_info.s_all_idx,ls_find[1]) > 0 then
                ls_idx = mid(vstr_post_info.s_all_idx, pos(vstr_post_info.s_all_idx,ls_find[1]) + len(ls_find[1]))
                ls_idx = mid(ls_idx, 1, pos(ls_idx, ']') -1)
                
                rstr_post_account = vstr_post_account_all[integer(ls_idx)]
                if lb_all then 
                    return 2
                else
                    return 1
                end if            
            end if
        elseif ls_cr_objtype_other <> ''  then
            ls_find[1] = ';'+ls_dr_objtype +';'+ ls_cr_objtype_other +';'+';' + vs_condition_val+'['
            if pos(vstr_post_info.s_all_idx,ls_find[1]) > 0 then
                ls_idx = mid(vstr_post_info.s_all_idx, pos(vstr_post_info.s_all_idx,ls_find[1]) + len(ls_find[1]))
                ls_idx = mid(ls_idx, 1, pos(ls_idx, ']') -1)
                
                rstr_post_account = vstr_post_account_all[integer(ls_idx)]
                if lb_all then 
                    return 2
                else
                    return 1
                end if            
            end if            
				
		else  // -- trường hợp posting type là ledger sẽ bỏ qua nếu user không chọn đối tượng là tài khoản--//
			if ls_dr_objtype <> 'ACCOUNT' and ls_cr_objtype <> 'ACCOUNT'  and pos(vstr_post_info.s_all_idx,'ACCOUNT') > 0  then 	return 0
        end if    
    else //-- Cài đặt có điều kiện --//
        ls_find[1] = ';'+ls_dr_objtype+';'+ ls_cr_objtype +';'+';' 
        li_pos = pos(vstr_post_info.s_all_idx,ls_find[1])
        li_idx = 1
        if li_pos = 0 and ls_dr_objtype_other <> '' and ls_cr_objtype_other <> '' then
            ls_find[2] = ';'+ls_dr_objtype_other+';'+ ls_cr_objtype_other +';'+';' 
            li_pos = pos(vstr_post_info.s_all_idx,ls_find[2])
            li_idx = 2
        end if
        if li_pos = 0 and ls_dr_objtype_other <> ''  then
            ls_find[3] = ';'+ls_dr_objtype_other+';'+ ls_cr_objtype +';'+';' 
            li_pos = pos(vstr_post_info.s_all_idx,ls_find[3])
            li_idx = 3
        end if        
        if li_pos = 0 and ls_cr_objtype_other <> ''  then
            ls_find[4] = ';'+ls_dr_objtype+';'+ ls_cr_objtype_other +';'+';' 
            li_pos = pos(vstr_post_info.s_all_idx,ls_find[4])
            li_idx = 4
        end if        
        DO while li_pos > 0
            ls_criteria_value = mid(vstr_post_info.s_all_idx, li_pos + len(ls_find[1]))
            ls_criteria_value = mid(ls_criteria_value, 1, pos(ls_criteria_value, '[') -1)
            if li_pos2 > 0 then
                ls_criteria_value_tmp = mid(ls_criteria_value, li_pos2 + 1)
            else
                ls_criteria_value_tmp = ls_criteria_value
            end if                                        
            if vs_condition_val = '' and vs_condition_coltype = 'number' then vs_condition_val = '0'
//            lb_ok =  lb_rule.f_is_criteria_ok( vs_condition_val, ls_criteria_value_tmp, vs_condition_coltype )

            if lb_ok then
                ls_find[li_idx] += ls_criteria_value+'['
                if pos(vstr_post_info.s_all_idx,ls_find[li_idx ]) > 0 then
                    ls_idx = mid(vstr_post_info.s_all_idx, pos(vstr_post_info.s_all_idx,ls_find[li_idx]) + len(ls_find[li_idx]) )
                    ls_idx = mid(ls_idx, 1, pos(ls_idx, ']') -1)
                    rstr_post_account = vstr_post_account_all[integer(ls_idx)]
                    return 1            
                else
                    
                    li_pos = pos(vstr_post_info.s_all_idx,ls_find[li_idx] , li_pos + len(ls_find[li_idx]))
                end if
            else
                li_pos = pos(vstr_post_info.s_all_idx,ls_find[li_idx] , li_pos + len(ls_find[li_idx]))
            end if            
        LOOP                                
    end if
else
    if  upperbound(vstr_post_account_grp[]) > 0 or  upperbound(vstr_post_account_spec[]) > 0 then 
        //-- Trường hợp : đối tượng không cần ghi sổ với posting type này--//
        return 0	
    end if
end if
//-- xét trường hợp cài tài khoản cho tất cả nhưng ko dùng--//
if pos(vstr_post_info.s_all_idx, 'ACCOUNT;') > 0 and ls_dr_objtype <> 'ACCOUNT' and  ls_cr_objtype <> 'ACCOUNT' then
	  //-- Trường hợp : đối tượng không cần ghi sổ với posting type này--//
	  return 0
end if
// trường hợp phải thoả đk mới ghi sổ, không thoả không ghi --//
if ls_criteria_value <> '' or vs_condition_val <> '' then
	return 0
end if
vstr_post_info.s_err_text = 'Chưa cài đặt tài khoản ghi sổ'
//gf_messagebox('m.b_doc.f_get_setup_account.01.3','Thông báo','Chưa cài đặt tài khoản ghi sổ','stop','ok',1)
return -1

end function

public function double f_get_posting_group (double vdb_object_id, ref t_transaction rt_transaction);double		ldb_id
int				li_cnt



select count(id) into :li_cnt
from object where id = :vdb_object_id using rt_transaction;

if li_cnt = 1 then
	select posting_group into :ldb_id 
	from object where id = :vdb_object_id using rt_transaction;
	if isnull(ldb_id) then ldb_id = 0
	return ldb_id
else
	gf_messagebox('m.s_object.f_get_posting_group.01','Thông báo','Không tìm thấy đối tượng có ID:@'+string(vdb_object_id),'exclamation','ok',1)
	setnull(ldb_id)
	return ldb_id
end if

end function

public function string f_get_balance_control (double vdb_id, ref t_transaction rt_transaction);string			ls_balance_control

SELECT balance_control into :ls_balance_control
FROM ACCOUNT
where object_ref_id = :vdb_id using rt_transaction;

if rt_transaction.sqlcode = 0 then
	return ls_balance_control
else
	return ''
end if
end function

public function integer f_insert_object_balance (double vdb_doc_id, date vd_trans_date, ref t_transaction rt_transaction, t_ds_db rds_obj_balance_post, string vs_post_unpost, string vs_sob);//Hàm cập nhật bảng Object trans từ Post_line
long  				ldb_idx, ll_row, ll_row_cnt, ll_insertrow, ll_row_prev_bal
double			ldb_object_id, ldb_trans_currency, ldb_id, ldb_account_id, ldb_subaccount, ldb_branch_id
double 			ldb_trans_amt, ldb_base_amt, ldb_ex_rate, ldb_open_amt, ldb_open_base_amt
double			ldb_dr_amt, ldb_dr_base_amt, ldb_cr_amt, ldb_cr_base_amt, ldb_close_amt, ldb_close_base_amt
string 			ls_not_accept, ls_where_column,ls_object_type, ls_balance_control, ls_account_code
any 				la_value[], la_empty[]
int 				li_waiting_cnt, li_rtn
date				ld_prev_bal_date, ld_max_date

t_ds_db			lds_object_balance, lds_object_open_bal
//u_account		lu_account


lds_object_balance = create t_ds_db


lds_object_open_bal = create t_ds_db
lds_object_open_bal.dataobject =  'ds_object_balance_preday'
lds_object_open_bal.f_settransobject(rt_transaction )


la_value[1] = vdb_doc_id
rds_obj_balance_post.f_add_where( 'doc_id', la_value[])
rds_obj_balance_post.f_settransobject( rt_transaction)
ll_row_cnt = rds_obj_balance_post.retrieve( )

FOR ldb_idx = 1 to ll_row_cnt
	ldb_branch_id = rds_obj_balance_post.getitemnumber(ldb_idx,'branch_id')
	ldb_account_id = rds_obj_balance_post.getitemnumber(ldb_idx,'ACCOUNT_ID')
	ldb_subaccount = rds_obj_balance_post.getitemnumber(ldb_idx,'SUBACCOUNT')
	ldb_trans_currency = rds_obj_balance_post.getitemnumber(ldb_idx,'TRANS_CUR_ID')
	ls_not_accept = rds_obj_balance_post.getitemstring(ldb_idx,'NOT_ACCEPT_YN')	
	if rds_obj_balance_post.dataobject = 'ds_obj_balance_post_dr'  or rds_obj_balance_post.dataobject = 'ds_obj_balance_post_cr'  then
		ldb_object_id = rds_obj_balance_post.getitemnumber(ldb_idx,'OBJECT_ID')
		ls_object_type = rds_obj_balance_post.getitemstring(ldb_idx,'object_ref_table')	
		if ls_object_type = 'ACCOUNT' then continue
	else
		ldb_object_id = ldb_account_id
		ls_object_type = 'ACCOUNT'
//		lu_account = create u_account
		ls_balance_control = this.f_get_balance_control( ldb_object_id, rt_transaction)
	end if
	ldb_trans_amt = rds_obj_balance_post.getitemnumber(ldb_idx,'trans_amt')
	if isnull(ldb_trans_amt) then ldb_trans_amt = 0
	if lower(vs_post_unpost) = 'unpost' then
		ldb_trans_amt = - ldb_trans_amt
	end if	
	ldb_base_amt = rds_obj_balance_post.getitemnumber(ldb_idx,'base_amt')
	if isnull(ldb_base_amt) then ldb_base_amt = 0
	if lower(vs_post_unpost) = 'unpost' then
		ldb_base_amt = - ldb_base_amt
	end if	
	ldb_ex_rate = rds_obj_balance_post.getitemnumber(ldb_idx,'EX_RATE')
	if isnull(ldb_ex_rate) then ldb_ex_rate = 0
	
	//-- Set các biến về 0 (Bảo update 15/12/2015) --//
	ldb_open_amt = 0
	ldb_open_base_amt = 0
	ldb_dr_amt = 0
	ldb_dr_base_amt = 0
	ldb_cr_amt = 0
	ldb_cr_base_amt = 0
	//-- chuẩn bị add where để retrieve balance --//
	lds_object_balance.dataobject = 'ds_object_balance_grid'
	lds_object_balance.f_settransobject(rt_transaction)	
	la_value[] = la_empty[]
	la_value[1] = vd_trans_date
	la_value[2] = ldb_object_id
	la_value[3] = ldb_trans_currency
	la_value[4] = ldb_account_id
	la_value[5] = ldb_subaccount
	la_value[6] = ls_not_accept
	la_value[7] = gi_user_comp_id
	la_value[8] = vs_sob
	la_value[9] = ldb_branch_id
	
	lds_object_balance.f_set_retrieve_args( la_value[])
	redo:
	
	ll_row = lds_object_balance.event e_retrieve( )
	if ll_row = 0 then		
		//-- lấy close_amt ngày trước gần nhất làm open amount --//
//		la_value[1]= vd_trans_date
		lds_object_open_bal.f_set_retrieve_args( la_value[])
		ll_row_prev_bal = lds_object_open_bal.event e_retrieve( )
		if ll_row_prev_bal = 1 then
			ldb_open_amt = lds_object_open_bal.getitemnumber( 1, 'close_trans_amount')
			if isnull(ldb_open_amt) then ldb_open_amt = 0
			ldb_open_base_amt = lds_object_open_bal.getitemnumber( 1, 'close_base_amount')
			if isnull(ldb_open_base_amt) then ldb_open_base_amt = 0
			//-- update balance các ngày không có giao dịch trước đây của object--//
			ld_prev_bal_date = date( lds_object_open_bal.getitemdatetime( 1, 'balance_date'))			
			if daysafter(ld_prev_bal_date, vd_trans_date) > 0 then
				lds_object_balance.dataobject = 'ds_object_balance_after'
				lds_object_balance.f_settransobject(rt_transaction)				
				//-- giọi hàm cấp nhật open/close từ trước đó tới ngày trước vd_trans_date 1 ngày --//
				li_rtn = this.f_update_object_balance(vs_sob,ldb_branch_id, ldb_object_id, ls_object_type, ldb_trans_currency,ldb_account_id,ldb_subaccount, ls_not_accept, & 
													ldb_open_amt,ldb_open_base_amt,rt_transaction,ls_balance_control, vd_trans_date,ld_prev_bal_date, lds_object_balance)
				if li_rtn = -1 then
					rollback using rt_transaction;
					destroy lds_object_balance	
//					destroy lu_account					
					return -1
				end if
			end if
			ll_insertrow = lds_object_balance.event e_addrow()	
			ldb_id = this.f_create_id_ex(rt_transaction )
			lds_object_balance.setitem(ll_insertrow,'id', ldb_id)				
		elseif ll_row_prev_bal = 0 then
			ldb_open_amt = 0
			ldb_open_base_amt = 0
			ll_insertrow = lds_object_balance.event e_addrow()	
			ldb_id = this.f_create_id_ex( rt_transaction)
			lds_object_balance.setitem(ll_insertrow,'id', ldb_id)	
		else
			this.f_log_post( vdb_doc_id,'Không lấy được số dư đầu do bảng balance có nhiều dòng trong 1 ngày')	
//			gf_messagebox('m.b_doc.f_insert_object_balance.01','Thông báo','Không lấy được số dư đầu do bảng balance có nhiều dòng trong 1 ngày:b_doc.f_insert_object_balance:line 86','stop','ok',1)
			destroy lds_object_open_bal
			rollback using rt_transaction;
			return -1
		end if
	elseif ll_row  =1 then //-- đối tượng đã có giao dịch --//
		ll_insertrow = ll_row
		ldb_open_amt = lds_object_balance.getitemnumber( 1, 'open_trans_amount')
		if isnull(ldb_open_amt) then ldb_open_amt = 0
		ldb_open_base_amt = lds_object_balance.getitemnumber( 1, 'open_base_amount')
		if isnull(ldb_open_base_amt) then ldb_open_base_amt = 0		
		ldb_dr_amt = lds_object_balance.getitemnumber( 1, 'DR_TRANS_AMOUNT')
		if isnull(ldb_dr_amt) then ldb_dr_amt = 0
		ldb_dr_base_amt = lds_object_balance.getitemnumber( 1, 'DR_BASE_AMOUNT')
		if isnull(ldb_dr_base_amt) then ldb_dr_base_amt = 0
		ldb_cr_amt = lds_object_balance.getitemnumber( 1, 'CR_TRANS_AMOUNT')
		if isnull(ldb_cr_amt) then ldb_cr_amt = 0
		ldb_cr_base_amt = lds_object_balance.getitemnumber( 1, 'CR_BASE_AMOUNT')
		if isnull(ldb_cr_base_amt) then ldb_cr_base_amt = 0
	else
		this.f_log_post( vdb_doc_id,'Không lấy được số dư đầu do bảng balance có nhiều dòng trong 1 ngày')	
//		gf_messagebox('m.b_doc.f_insert_object_balance.01','Thông báo','Không lấy được số dư đầu do bảng balance có nhiều dòng trong 1 ngày:b_doc.f_insert_object_balance:line 86','stop','ok',1)
		destroy lds_object_open_bal
		rollback using rt_transaction;
		return -1		
	end if		
	
	//-- update TRANS AMOUNT và CLOSE AMOUNT của ngay trans_date --//
	if ll_row = 0 then
		lds_object_balance.setitem(ll_insertrow,'branch_id', ldb_branch_id)			
		lds_object_balance.setitem( ll_insertrow, 'OBJECT_ID',ldb_object_id)
		lds_object_balance.setitem( ll_insertrow, 'OBJECT_REF_TYPE',ls_object_type)
		lds_object_balance.setitem( ll_insertrow, 'TRANS_CURRENCY',ldb_trans_currency)
		lds_object_balance.setitem( ll_insertrow, 'CONTROL_ACCOUNT',ldb_account_id)
		lds_object_balance.setitem( ll_insertrow, 'SUBACCOUNT',ldb_subaccount)
		lds_object_balance.setitem( ll_insertrow, 'BALANCE_DATE', vd_trans_date)
		lds_object_balance.setitem( ll_insertrow, 'OPEN_TRANS_AMOUNT',ldb_open_amt)
		lds_object_balance.setitem( ll_insertrow, 'OPEN_BASE_AMOUNT', ldb_open_base_amt)
		lds_object_balance.setitem( ll_insertrow, 'SOB', la_value[8])
	end if
	
	if rds_obj_balance_post.dataobject = 'ds_obj_balance_post_dr' or rds_obj_balance_post.dataobject = 'ds_ledger_balance_post_dr' then
		lds_object_balance.setitem( ll_insertrow, 'DR_TRANS_AMOUNT', ldb_dr_amt + ldb_trans_amt)
		lds_object_balance.setitem( ll_insertrow, 'DR_BASE_AMOUNT', ldb_dr_base_amt +ldb_base_amt )
		ldb_close_amt = ldb_open_amt +  (ldb_dr_amt + ldb_trans_amt)  -  ldb_cr_amt 
		ldb_close_base_amt = ldb_open_base_amt +  (ldb_dr_base_amt + ldb_base_amt)  -  ldb_cr_base_amt
	else
		lds_object_balance.setitem( ll_insertrow, 'CR_TRANS_AMOUNT', ldb_cr_amt + ldb_trans_amt)
		lds_object_balance.setitem( ll_insertrow, 'CR_BASE_AMOUNT', ldb_cr_base_amt +ldb_base_amt)
		ldb_close_amt = ldb_open_amt +  ldb_dr_amt  -  (ldb_cr_amt + ldb_trans_amt)
		ldb_close_base_amt = ldb_open_base_amt +  ldb_dr_base_amt  -  (ldb_cr_base_amt + ldb_base_amt)
	end if
		
	//-- kiểm tra ghi sổ âm --//
	if ls_balance_control = 'dr' then
		if ldb_close_base_amt <0 or ldb_close_amt < 0 then 
			ls_account_code= this.f_get_object_code_ex( ldb_object_id,rt_transaction )
			this.f_log_post( vdb_doc_id, 'Tài khoản sau không được dư bên Có:@'+ls_account_code)	
//			gf_messagebox('m.b_doc.f_insert_object_balance.02','Thông báo', 'Tài khoản sau không được dư bên Có:@'+ls_account_code ,'exclamation','ok',1)			
			rollback using rt_transaction;
			destroy lds_object_balance	
//			destroy lu_account
			return -1
		end if
	elseif  ls_balance_control = 'cr' then
		if ldb_close_base_amt  > 0 or ldb_close_amt > 0 then 
			ls_account_code= this.f_get_object_code_ex( ldb_object_id,rt_transaction )
			this.f_log_post( vdb_doc_id, 'Tài khoản sau không được dư bên Nợ:@'+ls_account_code)	
//			gf_messagebox('m.b_doc.f_insert_object_balance.03','Thông báo', 'Tài khoản sau không được dư bên Nợ:@'+ls_account_code ,'exclamation','ok',1)			
			rollback using rt_transaction;
			destroy lds_object_balance	
//			destroy lu_account
			return -1			
		end if		
	end if
	
	lds_object_balance.setitem( ll_insertrow, 'CLOSE_TRANS_AMOUNT', ldb_close_amt )
	lds_object_balance.setitem( ll_insertrow, 'CLOSE_BASE_AMOUNT', ldb_close_base_amt )
	lds_object_balance.setitem( ll_insertrow, 'NOT_ACCEPT_YN', ls_not_accept)
	//-- update database cho đến ngày giao dịch --//
	if lds_object_balance.update(true,false) = 1 then
		lds_object_balance.resetupdate( )
	else
		//-- kiểm tra lỗi user khác đã cập nhật dữ liệu --//
		if lds_object_balance.ii_dberrorcode = -3 then
			lds_object_balance.ii_dberrorcode = 0
			goto redo
			DO while li_waiting_cnt < 20
				li_waiting_cnt++
				goto redo			
			LOOP
			this.f_log_post( vdb_doc_id, rt_transaction.SQLErrText)	
//			gf_messagebox('m.b_doc.f_insert_object_balance.04','Thông báo', rt_transaction.SQLErrText ,'stop','ok',1)
			return -1				
		end if
		this.f_log_post( vdb_doc_id, rt_transaction.SQLErrText)	
//		gf_messagebox('m.b_doc.f_insert_object_balance.04','Thông báo', rt_transaction.SQLErrText ,'stop','ok',1)
		rollback using rt_transaction;
		destroy lds_object_balance	
		destroy lds_object_open_bal
//		destroy lu_account
		return -1
	end if	
	
	//-- update object balance những ngày sau trans_date các ngày tiếp theo --//
	SELECT max(balance_date) into :ld_max_date from object_balance 
	where  sob =:vs_sob and object_id= :ldb_object_id and company_id = :gi_user_comp_id	and branch_id = :ldb_branch_id
	and trans_currency = :ldb_trans_currency	and control_account = :ldb_account_id	and nvl(subaccount,0) = nvl(:ldb_subaccount,0)	using rt_transaction;
	
	
	if daysafter(vd_trans_date, ld_max_date) > 0 then
		lds_object_balance.dataobject = 'ds_object_balance_after'
		lds_object_balance.f_settransobject(rt_transaction)						
		li_rtn = this.f_update_object_balance(vs_sob,ldb_branch_id, ldb_object_id, ls_object_type, ldb_trans_currency,ldb_account_id,ldb_subaccount, ls_not_accept, & 
											ldb_close_amt,ldb_close_base_amt,rt_transaction,ls_balance_control,vd_trans_date, ld_max_date, lds_object_balance)
		if li_rtn = -1 then
			rollback using rt_transaction;
			destroy lds_object_balance	
//			destroy lu_account					
			return -1
		end if		
		
		if lds_object_balance.update(true,false) = 1 then
			lds_object_balance.resetupdate( )
		else
			//-- kiểm tra lỗi user khác đã cập nhật dữ liệu --//
			if lds_object_balance.ii_dberrorcode = -3 then
				lds_object_balance.ii_dberrorcode = 0
				goto redo
				DO while li_waiting_cnt < 20
					li_waiting_cnt++
					goto redo			
				LOOP
				this.f_log_post( vdb_doc_id, rt_transaction.SQLErrText)	
				rollback using rt_transaction;
//				gf_messagebox('m.b_doc.f_insert_object_balance.04','Thông báo', rt_transaction.SQLErrText ,'stop','ok',1)
				return -1				
			end if
			this.f_log_post( vdb_doc_id, rt_transaction.SQLErrText)	
//			gf_messagebox('m.b_doc.f_insert_object_balance.04','Thông báo', rt_transaction.SQLErrText ,'stop','ok',1)
			rollback using rt_transaction;
			destroy lds_object_balance	
			destroy lds_object_open_bal
//			destroy lu_account
			return -1
		end if
	end if
	
NEXT

destroy lds_object_balance
destroy lds_object_open_bal
//destroy lu_account
return 1
	
end function

public function integer f_create_post_line_multi (double vdb_doc_id, date vd_trans_date, double vdb_doc_version, double vdb_curr_id, double vdb_exrate, double vdb_return_doc_id, double vdb_branch_id, double vdb_trans_hdr_id, ref s_str_ds_4_posting vstr_ds_4_posting, s_str_streamvalue vastr_streamvalue[], ref t_transaction rt_transaction);	/**********************************************************
Chức năng: Tạo định khoản cho chứng từ theo cài đặt ngiệp vụ ghi sổ
--------------------------------------------------------------------------------------------
Tham số: vdb_doc_id : ID của chứng từ cần ghi sổ
			 vs_new: hàm được viết optimize lại
---------------------------------------------------------------------
Return: 	 1 -> Thành công
			-1 -> Lỗi
==============================TrevietSoftware.com*/
t_ds_db						lds_trans_setup, lds_get_amount
c_string_ex						lc_string
c_dwservice_ex					l_dwservice
s_str_post_info				lstr_post_info, lstr_post_info_empty
s_str_post_account		lstr_post_acct_spec[], lstr_post_acct_group[], lstr_post_acct_all[] , lstrs_post_acct_empty[]

long					ll_row, ll_cnt, ll_rtn, ll_idx
string					ls_dw_get_mount,ls_dw_get_mount_tmp, ls_col_get_base_amount, ls_col_get_amount, ls_original_filter, ls_source_filter
string					ls_posting_type, ls_posting_type_tmp, ls_findString, ls_empty[], ls_rtn, ls_col_base_amt[]
boolean				lb_skip
int						li_idx, li_pos_s, li_pos_e, li_chr_nbr
string					ls_colname, ls_coltype

l_dwservice = create c_dwservice_ex
lc_string = create c_string_ex
//-- Kiểm tra tham số truyền vào --//
if vdb_doc_id = 0 or isnull(vdb_doc_id) then 
	gf_messagebox('m.b_doc.f_create_post_line.01','Thông báo','Tham số ID chứng từ không hợp lệ !','exclamation','ok',1)
	return -1
end if
if vdb_trans_hdr_id = 0 or isnull(vdb_trans_hdr_id) then
	gf_messagebox('m.b_doc.f_create_post_line.03','Thông báo','Chứng từ chưa có giao dịch','exclamation','ok',1)
	return -1	
end if
//messagebox('f_get_trans_setup','Start')
//-- Lấy toàn bộ thông tin cài đặt nghiệp vụ của chứng từ --//
lds_trans_setup = create t_ds_db
if this.f_get_trans_setup(vdb_trans_hdr_id, lds_trans_setup, rt_transaction) < 1 then
	messagebox('f_get_trans_setup','Error')
//	gf_messagebox('m.b_doc.f_create_post_line.06','Thông báo','Giao dịch ghi sổ chưa cài đặt','exclamation','ok',1)
	destroy lds_trans_setup
	return -1		
end if
//messagebox('loop','Start')
//-- Duyệt theo dw_get_amount --//
ll_row = 1
DO
	ls_posting_type_tmp = lds_trans_setup.getitemstring( ll_row, 'posting_type')
	if isnull(ls_posting_type_tmp) then  ls_posting_type_tmp= 'NULL' 
	ls_dw_get_mount_tmp = lds_trans_setup.getitemstring( ll_row, 'dw_get_amount')
	if isnull(ls_dw_get_mount_tmp) or ls_dw_get_mount_tmp=''  then		
		this.f_log_post( vdb_doc_id,'Giao dịch ghi sổ chưa cài đặt dw giá trị')		
		update document set status = 'new' where id = :vdb_doc_id using rt_transaction;		
		gf_messagebox('m.b_doc.f_create_post_line.07','Thông báo','Giao dịch ghi sổ chưa cài đặt dw giá trị','exclamation','ok',1)
		return -1		
	end if	

	if ls_dw_get_mount_tmp <> ls_dw_get_mount or ls_posting_type_tmp <> ls_posting_type then //-- thay đổi dw chứa giá trị ghi sổ --//		
		
		if ls_dw_get_mount_tmp <> ls_dw_get_mount then
			ls_dw_get_mount = ls_dw_get_mount_tmp
			
			li_pos_s = pos(vstr_ds_4_posting.s_dataobject_str,  ls_dw_get_mount + '[')
			li_pos_e = pos(vstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)			
			li_chr_nbr = li_pos_e - (li_pos_s + len(ls_dw_get_mount + '['))
			li_idx = integer(mid(vstr_ds_4_posting.s_dataobject_str, li_pos_s + len(ls_dw_get_mount + '[') , li_chr_nbr ))
			lds_get_amount = vstr_ds_4_posting.ds_details[li_idx]
			
			IF upper(lds_get_amount.describe("DataWindow.Table.UpdateTable")) = 'TAX_LINE'THEN		
				ls_colname = 'doc_version'
			else
				ls_colname = 'object_ref_ID'
			end if
			l_dwservice.f_get_build_column(lds_get_amount, ls_colname, ls_coltype)
			lds_get_amount.f_build_join_where_4_posting(vstr_ds_4_posting.s_join_detail[li_idx] ," "+ ls_colname+" = "+ string(vdb_doc_version) , " AND " )			
			ll_rtn= lds_get_amount.f_settransobject(rt_transaction)
			ll_rtn= lds_get_amount.retrieve()			
		end if
		//-- Lấy setup tài khoản theo posting type --//
		if ls_posting_type_tmp <> ls_posting_type then
			ls_posting_type = ls_posting_type_tmp						
			lstr_post_acct_spec[] = lstrs_post_acct_empty[]
			lstr_post_acct_group[] = lstrs_post_acct_empty[]
			lstr_post_acct_all = lstrs_post_acct_empty[]
			lstr_post_info = lstr_post_info_empty
			ll_rtn = this.f_get_posting_type_account(lds_trans_setup, ls_dw_get_mount, ls_posting_type_tmp, lstr_post_acct_spec[],lstr_post_acct_group[],lstr_post_acct_all[] ,lstr_post_info)
			if ll_rtn = -1 then return -1
		end if
		
		//-- check post amount để bỏ qua --//
		ls_col_base_amt[] =  ls_empty[]
		ll_cnt = lc_string.f_stringtoarray(  lstr_post_info.s_col_base_amt ,';', ls_col_base_amt[])
		
		
		FOR ll_idx = 1 to ll_cnt
			if ls_col_base_amt[ll_idx] <> 'cogs'  and ls_posting_type <> 'cogs' and pos( ls_col_base_amt[ll_idx] ,'base_amount') = 0  then
				ls_rtn = lds_get_amount.Describe("Evaluate('Sum("+ ls_col_base_amt[ll_idx]+")', 0)")
				if ls_rtn <> '!' and ls_rtn = '0' then 			
					lb_skip = true
				else
					lb_skip = false
					exit
				end if
			else
				lb_skip = false
				exit
			end if
		NEXT
		if lb_skip then
			if ls_posting_type = 'NULL' then
				ls_findString = "dw_get_amount <> '"+ls_dw_get_mount_tmp+"' OR not isnull(posting_type)"
			else
				ls_findString = "dw_get_amount <> '"+ls_dw_get_mount_tmp+"' OR posting_type <>'"+ ls_posting_type +"'"
			end if
			
			ll_row = lds_trans_setup.find(ls_findString ,ll_row+1, lds_trans_setup.rowcount()+1)			
			continue //-- nhảy qua posting type tiếp theo--//
		end if
		
		//-- insert dw post_line --//			
		ll_rtn = this.f_insert_post_line_multi( vdb_doc_id,vd_trans_date,vdb_doc_version, vdb_branch_id,lds_get_amount, vdb_curr_id,vdb_exrate, vdb_return_doc_id, lstr_post_acct_spec[],lstr_post_acct_group[],lstr_post_acct_all[] ,lstr_post_info, vstr_ds_4_posting, vastr_streamvalue[], rt_transaction)
		if ll_rtn = -1 then
			messagebox('f_insert_post_line_multi','ERROR')
			return -1
		end if
	end if	

	if ls_posting_type = 'NULL' then
		ls_findString = "dw_get_amount <> '"+ls_dw_get_mount_tmp+"' OR not isnull(posting_type)"
	else
		ls_findString = "dw_get_amount <> '"+ls_dw_get_mount_tmp+"' OR posting_type <>'"+ ls_posting_type +"'"
	end if
	
	ll_row = lds_trans_setup.find(ls_findString ,ll_row+1, lds_trans_setup.rowcount()+1)
LOOP while ll_row > 0


return 1
end function

public function integer f_insert_post_line_multi (double vdb_doc_id, date vd_trans_date, double vdb_doc_version, double vdb_branch_id, t_ds_db vds_get_amount, double vdb_currency_id, double vdc_exrate, double vdb_return_doc_id, s_str_post_account vstr_spec_acct[], s_str_post_account vstr_grp_acct[], s_str_post_account vstr_all_acct[], s_str_post_info vstr_post_info, ref s_str_ds_4_posting vstr_ds_4_posting, s_str_streamvalue vastr_streamvalue[], ref t_transaction rt_transaction);/******************************************************************************
Hàm mới (Dev. 17 Feb 18): dùng strutrure lưu giữ posting account.

=============================================TrevietSoftware*/

long				ll_row, ll_insert_row, ll_rtn_row, ll_rtn, ll_master_row, ll_row_cnt, li_cnt, li_response
string				ls_trans_text_dw, ls_not_accept_col, ls_posting_type,  las_col_item[], ls_condition_val, ls_condition_coltype, ls_dwo_master
string				ls_base_curr_code, ls_base_curr_name, ls_object_ref_table, ls_base_currcode, ls_base_currname, ls_f_post_line_str
double			ldb_amount, ldb_base_amount, ldb_dr_object_id, ldb_cr_object_id, ldb_round_diff, ldb_act_qty_sku, ldb_trans_uom, ldb_base_settled_amt
double			ldb_base_curr, ldb_object_ref_id,  ldb_post_line_id[], ldb_invoice_exrate,ldb_round_id,ldb_exrate_amt
double			ldb_dr_subacct_id, ldb_cr_subacct_id, ldb_dr_account_id, ldb_cr_account_id, ldb_cogs
boolean			lb_found, lb_update_sku, lb_managed_value, lb_create_account, lb_accounted
date				ld_trans_date
any				laa_data[] , laa_data_postline[]

s_str_post_account		lstr_post_account
c_string_ex					lc_string
t_ds_db						lds_matching, lds_f_post_line, rds_post_line, lds_master
c_unit_instance_ex		lc_unit_instance_ex

lc_unit_instance_ex = create c_unit_instance_ex
lc_string =  create c_string_ex

ldb_exrate_amt = vdc_exrate
if isnull(vdb_currency_id) or vdb_currency_id = 0 then return -1
if isnull(ldb_exrate_amt) or ldb_exrate_amt = 0 then return -1
ld_trans_date = vd_trans_date

lds_matching = create t_ds_db
lds_matching.dataobject = 'ds_matching'
lds_matching.f_settransobject( rt_transaction)
lds_f_post_line = create t_ds_db
lds_f_post_line.dataobject = 'd_post_line_grid'
lds_f_post_line.f_settransobject(rt_transaction)


lb_update_sku = false

rds_post_line = create t_ds_db
rds_post_line.dataobject = 'd_post_line_grid'
rds_post_line.f_settransobject(rt_transaction)	

lb_create_account = true

//--Lấy round_id --//
lc_unit_instance_ex.f_get_base_cur_ex( ldb_base_curr, ls_base_curr_code, ls_base_curr_name,rt_transaction)
ldb_round_id = lc_unit_instance_ex.f_get_round_id_ex( ldb_base_curr, 0, 'amount',rt_transaction)

FOR ll_row = 1 to vds_get_amount.rowcount()
		
	//-- Lấy conditional value --//
	this.f_get_posting_condition_multi(vdb_doc_version, vstr_post_info, vds_get_amount, ll_row, ls_condition_val, ls_condition_coltype, rt_transaction, vstr_ds_4_posting)

	//-- Lấy object id DR/CR --//
	ldb_dr_subacct_id=0
	ldb_cr_subacct_id=0
	ldb_dr_object_id =0
	ldb_cr_object_id =0	
	if this.f_get_posting_object_multi(vdb_doc_version, vstr_post_info, vds_get_amount, ll_row, ldb_dr_object_id,ldb_cr_object_id,rt_transaction,vstr_ds_4_posting, ldb_dr_subacct_id, ldb_cr_subacct_id) = -1 then
		this.f_log_post( vdb_doc_id,vstr_post_info.s_err_text )
		rollback using rt_transaction;
		return -1
	end if
	

	
	//-- Lấy tài khoản và tiểu mục ghi sổ --//		
	if ll_rtn_row < 2  or lstr_post_account.s_posting_type = 'ledger'  or ls_condition_val <>'' then
		ll_rtn_row = this.f_get_Trans_setup_account( ldb_dr_object_id, ldb_cr_object_id,ls_condition_val,ls_condition_coltype, vstr_spec_acct[],vstr_grp_acct[], vstr_all_acct[], vstr_post_info,  lstr_post_account, rt_transaction)
	end if
	if ll_rtn_row = -1 then
		this.f_log_post( vdb_doc_id,vstr_post_info.s_err_text )
		rollback using rt_transaction;
		return -1		
	end if
	if ll_rtn_row = 0 then continue //-- Đối tượng ko cần định khoản --//
	
	//-- Lấy lại object id DR/CR sau khi có structure --//
	if ll_rtn_row = 3 then
		if this.f_get_posting_object_multi(vdb_doc_version, lstr_post_account, vds_get_amount, ll_row, ldb_dr_object_id,ldb_cr_object_id,rt_transaction,vstr_ds_4_posting, ldb_dr_subacct_id, ldb_cr_subacct_id) = -1 then
			rollback using rt_transaction;
			return -1
		end if	
	end if
	
	//-- Kiểm tra TK quản lý đối trượng --//
	
	//-- Lấy trans_text --//
	this.f_get_posting_trans_text_multi(vdb_doc_version, vstr_post_info, vds_get_amount, ll_row, ls_trans_text_dw, rt_transaction, vstr_ds_4_posting)
	
//	//-- lấy acct trên v_dw_get_amt --//
//	if lstr_post_account.db_dr_account = 0 or isnull(lstr_post_account.db_dr_account) then
//		if (lstr_post_account.s_dr_object_type = 'ledger' OR lstr_post_account.s_dr_object_type = 'ACCOUNT') and vstr_post_info.s_dr_dw_object = left(vds_get_amount.dataobject, len(vds_get_amount.dataobject) - 5) then
//			//-- Kiểm tra TK quản lý đối trượng --//
//			if lb_obj_ins.f_get_object_control_yn( ldb_dr_object_id) = 'Y' then
//				gf_messagebox('m.b_doc.f_insert_post_line_multi.05','Thông báo','TK có quản lý đối tượng không được ghi sổ trực tiếp: @' + lb_obj_ins.f_get_object_code( ldb_dr_object_id)  ,'exclamation','ok',1)
//				rollback using rt_transaction;				
//				return -1
//			end if			
//			
//			lstr_post_account.db_dr_account = ldb_dr_object_id
//		end if
//	end if
//	if lstr_post_account.db_cr_account = 0 or isnull(lstr_post_account.db_cr_account) then
//		if (lstr_post_account.s_cr_object_type = 'ledger' OR lstr_post_account.s_cr_object_type = 'ACCOUNT') and vstr_post_info.s_cr_dw_object = left(vds_get_amount.dataobject, len(vds_get_amount.dataobject) - 5) then
//			//-- Kiểm tra TK quản lý đối trượng --//
//			if lb_obj_ins.f_get_object_control_yn( ldb_cr_object_id) = 'Y' then
//				gf_messagebox('m.b_doc.f_insert_post_line_multi.05','Thông báo','TK có quản lý đối tượng không được ghi sổ trực tiếp: @' + lb_obj_ins.f_get_object_code( ldb_cr_object_id)  ,'exclamation','ok',1)
//				rollback using rt_transaction;				
//				return -1
//			end if						
//			
//			lstr_post_account.db_cr_account = ldb_cr_object_id
//		end if
//	end if	


	//-- lấy SUBacct trên v_dw_get_amt : xử lý sau--//
	//--==================--//
	
	//-- set số lượng SKU --//
	if lower(lstr_post_account.s_cr_object_type) = 'item' then // and lower(ls_col_get_base_amount) = 'cogs' 
		lb_update_sku = true
		//-- set số lượng SKU --//
		this.f_get_item_columns_of_streamvalue( vds_get_amount.dataobject, las_col_item[], vastr_streamvalue[])
		if upperbound(las_col_item[]) > 0 then				
			ldb_trans_uom = vds_get_amount.getitemnumber(ll_row,las_col_item[4])				
			ll_rtn = this.f_set_Qty_sku(rt_transaction, vds_get_amount, ll_row, ldb_cr_object_id ,ldb_trans_uom, las_col_item[3], 'OUT', ldb_act_qty_sku, ldb_round_diff)
			if ll_rtn = -1 then
				vds_get_amount.resetupdate()
				rollback using rt_transaction;
				return -1
			end if
			this.f_update_round_diff( ldb_cr_object_id, ldb_round_diff, rt_transaction)
		end if
		lb_managed_value = this.f_is_managed_value_ex( ldb_cr_object_id, rt_transaction)
		if vds_get_amount.dataobject = 'd_inventory_line_counting_grid' then			
			if not lb_managed_value then	continue //-- mã hàng ko quản lý giá trị , xuất kho kiểm kê  ko ghi sổ tài khoản --//
		end if
		//-- set cogs vào hóa đơn bán --//		
		if lower(lstr_post_account.s_col_base_amt) = 'cogs' then		
			if not lb_managed_value then	continue //-- mã hàng ko quản lý giá trị , xuất kho bán  ko ghi giá vốn --//
			if vdb_return_doc_id > 0 then
				ldb_base_amount = this.f_get_return_unit_cogs(  vds_get_amount.getitemnumber(ll_row, 'id'), rt_transaction )
				if ldb_base_amount = -1 then
					vds_get_amount.resetupdate()
					rollback using rt_transaction;
					return -1
				end if
			else
				ldb_base_amount = this.f_get_last_pur_price(ldb_cr_object_id, rt_transaction)
				if ldb_act_qty_sku < 0 then ldb_act_qty_sku = -ldb_act_qty_sku //-- kiểm kê thiếu hàng : ghi âm sku--//
				ldb_base_amount = lc_unit_instance_ex.f_round(rt_transaction, ldb_round_id, ldb_base_amount * ldb_act_qty_sku)
			end if		
			vds_get_amount.setitem(ll_row,lstr_post_account.s_col_base_amt, ldb_base_amount)
		end if
	elseif lower(lstr_post_account.s_dr_object_type) = 'item' and lower(lstr_post_account.s_cr_object_type) <> 'tax_authority'  and lower(lstr_post_account.s_cr_object_type) <> 'charge_object' then
		//-- set số lượng SKU --//
		this.f_get_item_columns_of_streamvalue( vds_get_amount.dataobject, las_col_item[], vastr_streamvalue[])
		if upperbound(las_col_item[]) > 0 then
			lb_update_sku = true
			ldb_trans_uom = vds_get_amount.getitemnumber(ll_row,las_col_item[4])
			ll_rtn = this.f_set_Qty_sku(rt_transaction, vds_get_amount, ll_row, ldb_dr_object_id, ldb_trans_uom, las_col_item[3], 'OUT', ldb_act_qty_sku, ldb_round_diff)
			if ll_rtn = -1 then
				vds_get_amount.resetupdate()
				rollback using rt_transaction;
				return -1
			end if
			this.f_update_round_diff( ldb_dr_object_id, ldb_round_diff, rt_transaction)
		end if
		if vds_get_amount.dataobject = 'd_inventory_line_counting_grid' then
			lb_managed_value = this.f_is_managed_value_ex( ldb_dr_object_id,rt_transaction )  //-- Kiểmm kê mã hàng ko quản lý giá trị , ko ghi sổ tài khoản --//
			if not lb_managed_value then	continue 
		end if
	end if				

	//-- lấy ldb_base_amount ; ldb_amount --//
	ldb_base_amount = vds_get_amount.getitemnumber(ll_row, lstr_post_account.s_col_base_amt )
	if isnull(ldb_base_amount) then ldb_base_amount = 0
	if lower(lstr_post_account.s_col_base_amt) = 'cogs' and ldb_base_amount = 0 then
		if lower(lstr_post_account.s_dr_object_type) = 'item' then
			ldb_cogs = this.f_get_last_pur_price(ldb_dr_object_id, rt_transaction)
			ldb_base_amount = lc_unit_instance_ex.f_round(rt_transaction, ldb_round_id, ldb_cogs * ldb_act_qty_sku)
		elseif  lower(lstr_post_account.s_cr_object_type) = 'item' then
			ldb_cogs = this.f_get_last_pur_price(ldb_cr_object_id, rt_transaction)
			ldb_base_amount = lc_unit_instance_ex.f_round(rt_transaction, ldb_round_id, ldb_cogs * ldb_act_qty_sku)
		end if
		ldb_amount = ldb_base_amount
	else
		ldb_amount = vds_get_amount.getitemnumber(ll_row, lstr_post_account.s_col_amt)
	end if	
	if isnull(ldb_amount) then ldb_amount = 0
	//-- Đảo dấu số tiền tren form kiểm kê khi thiếu hàng --//
	if vds_get_amount.dataobject = 'd_inventory_line_counting_grid' and ldb_amount < 0 then
		ldb_amount = - ldb_amount
	end if
	//-- Đảo dấu số tiền tren form kiểm kê khi thiếu hàng --//
	if vds_get_amount.dataobject = 'd_inventory_line_counting_grid' and ldb_base_amount < 0 then
		ldb_base_amount = - ldb_base_amount
	end if
	
	//-- kiểm tra ldb_base_amount ; ldb_amount --//
	if lstr_post_account.s_posting_type <> 'cogs' and ldb_base_amount = 0 & 
		and lstr_post_account.s_col_base_amt <> 'cogs' and pos(lstr_post_account.s_col_base_amt , 'base_amount') = 0  then continue 
	if lstr_post_account.s_col_base_amt = 'cogs' and lower(lstr_post_account.s_dr_object_type) <> 'item' and lower(lstr_post_account.s_cr_object_type) <> 'item' then continue
	if (ldb_base_amount = 0 or isnull(ldb_base_amount)) then
		if lower(lstr_post_account.s_dr_object_type) <> 'item' then
			if lower(lstr_post_account.s_cr_object_type) <> 'item' then
				if ll_row = vds_get_amount.rowcount() then exit
				continue
			end if
		end if
	end if	

	//-- kiểm tra tài khoản nợ ---//
	if (lstr_post_account.s_dr_object_type = 'ledger' OR  lstr_post_account.s_dr_object_type = 'ACCOUNT') and ldb_dr_object_id > 0 then
		//-- Kiểm tra TK quản lý đối trượng --//
		if this.f_get_object_control_yn( ldb_dr_object_id, rt_transaction) = 'Y' then
			messagebox('Thông báo','TK có quản lý đối tượng không được ghi sổ trực tiếp: @' + this.f_get_object_code_ex( ldb_dr_object_id, rt_transaction))
//			gf_messagebox('m.b_doc.f_insert_post_line_multi.05','Thông báo','TK có quản lý đối tượng không được ghi sổ trực tiếp: @' + this.f_get_object_code( ldb_dr_object_id)  ,'exclamation','ok',1)
			rollback using rt_transaction;				
			return -1
		end if		
		//-- lấy acct trên v_dw --//
		ldb_dr_account_id = ldb_dr_object_id
	else
		ldb_dr_account_id = lstr_post_account.db_dr_account
	end if		
	//-- kiểm tra tài khoản có ---//
	if (lstr_post_account.s_cr_object_type = 'ledger' OR  lstr_post_account.s_cr_object_type = 'ACCOUNT' ) and ldb_cr_object_id > 0 then
		//-- Kiểm tra TK quản lý đối trượng --//
		if this.f_get_object_control_yn( ldb_cr_object_id, rt_transaction) = 'Y' then
			messagebox('Thông báo','TK có quản lý đối tượng không được ghi sổ trực tiếp: @' + this.f_get_object_code_ex( ldb_cr_object_id, rt_transaction))
//			gf_messagebox('m.b_doc.f_insert_post_line_multi.05','Thông báo','Tài khoản có quản lý đối tượng không được ghi sổ trực tiếp: @' + lb_obj_ins.f_get_object_code( ldb_cr_object_id)  ,'exclamation','ok',1)
			rollback using rt_transaction;				
			return -1
		end if			
		//-- lấy acct trên v_dwt --//
		ldb_cr_account_id = ldb_cr_object_id
	else
		ldb_cr_account_id = lstr_post_account.db_cr_account
	end if		

	//-- Xứ lý ngoại tệ tiền thuế và chênh lệch tỷ giá --//	
	if  ldb_base_curr <> vdb_currency_id then 
		//-- xử lý thuế: quy đổi tiền thuế ngược lại ngoại tệ --//
		if lstr_post_account.s_posting_type = 'tax' then
			ldb_round_id = lc_unit_instance_ex.f_get_round_id_ex( vdb_currency_id, 0, 'amount', rt_transaction) 
			if ldb_amount > 0 then
				ldb_exrate_amt = lc_unit_instance_ex.f_round( rt_transaction, ldb_round_id,  ldb_base_amount/ldb_amount)				
			else
				ldb_exrate_amt = 0
			end if
		end if	
		//-- xử lý base_amount khi có chênh lẹch tỷ giá --//
		if upper(vds_get_amount.describe( "DataWindow.Table.UpdateTable")) = 'PAYMENT_LINE' then
			laa_data[1] = vds_get_amount.getitemnumber(ll_row, 'id')
			laa_data[2] = 'PAYMENT_LINE'
			lds_matching.f_add_where( 't_ref_id;t_ref_table', laa_data[])				
			if lds_matching.retrieve( ) > 0 then
				ldb_post_line_id[] = lds_matching.object.f_ref_id.Primary.Current
				
				lc_string.f_arraytostring( ldb_post_line_id[], ';', ls_f_post_line_str)
				laa_data_postline[1] = '('+ls_f_post_line_str+')'					
				lds_f_post_line.f_add_where( 'ID', laa_data_postline[])
				if lds_f_post_line.retrieve( ) > 0 then						
					ldb_object_ref_id = vds_get_amount.getitemnumber(ll_row, 'id')
					ls_object_ref_table =  upper(vds_get_amount.describe( "DataWindow.Table.UpdateTable"))	
					if this.f_create_exrate_post_line_ex( ldb_dr_object_id, ldb_cr_object_id, lds_f_post_line, ldb_amount,ldb_base_amount, vdb_currency_id,ldb_exrate_amt, ld_trans_date, vdb_doc_id, ldb_object_ref_id, ls_object_ref_table, lstr_post_account, rds_post_line , rt_transaction) = -1 then
						rollback using rt_transaction;
						destroy lds_matching							
						return -1							
					end if
					ldb_invoice_exrate = lds_f_post_line.getitemnumber( 1, 'EX_RATE' )
					if isnull(ldb_invoice_exrate) or ldb_invoice_exrate= 0 then ldb_invoice_exrate = 1
					ldb_base_amount = min(ldb_base_amount, ldb_invoice_exrate*ldb_amount )
				end if
			end if						
		end if
	end if	
	
	//--insert post_line--//
	ll_insert_row = rds_post_line.event e_addrow()
	rds_post_line.setitem(ll_insert_row,'id', this.f_create_id_ex(rt_transaction )  )
	rds_post_line.setitem(ll_insert_row,'branch_id', vdb_branch_id )
	rds_post_line.setitem(ll_insert_row,'dr_object_type', upper(lstr_post_account.s_dr_object_type ))
	rds_post_line.setitem(ll_insert_row,'dr_object_id', ldb_dr_object_id)
	rds_post_line.setitem(ll_insert_row,'trans_text', lstr_post_account.s_trans_text +'-'+ ls_trans_text_dw)
//	if lstr_post_account.s_post_type_text =''  then lstr_post_account.s_post_type_text = ls_trans_text_dw		
//	rds_post_line.setitem(ll_insert_row,'post_type_text', lstr_post_account.s_post_type_text )
	if lstr_post_account.s_post_type_text =''  then
		rds_post_line.setitem(ll_insert_row,'post_type_text', ls_trans_text_dw )
	else
		rds_post_line.setitem(ll_insert_row,'post_type_text', lstr_post_account.s_post_type_text )
	end if		
	rds_post_line.setitem(ll_insert_row,'dr_account_id', ldb_dr_account_id)
	rds_post_line.setitem(ll_insert_row,'dr_subaccount', ldb_dr_subacct_id)
	rds_post_line.setitem(ll_insert_row,'cr_object_type', upper(lstr_post_account.s_cr_object_type ))
	rds_post_line.setitem(ll_insert_row,'cr_object_id', ldb_cr_object_id)
	rds_post_line.setitem(ll_insert_row,'cr_account_id',ldb_cr_account_id)	
	rds_post_line.setitem(ll_insert_row,'cr_subaccount',ldb_cr_subacct_id)
	ls_posting_type = lstr_post_account.s_posting_type
	if ls_posting_type= 'NULL' then  setnull(ls_posting_type)		
	rds_post_line.setitem(ll_insert_row,'post_type', ls_posting_type)
	rds_post_line.setitem(ll_insert_row,'doc_id', vdb_doc_id)		
	rds_post_line.setitem(ll_insert_row,'object_ref_id',  vds_get_amount.getitemnumber(ll_row, 'id'))
	rds_post_line.setitem(ll_insert_row,'object_ref_table', upper(vds_get_amount.describe( "DataWindow.Table.UpdateTable")))
	rds_post_line.setitem(ll_insert_row,'trans_amt', ldb_amount)
	rds_post_line.setitem(ll_insert_row,'base_amt',  ldb_base_amount)	
	if ls_posting_type = 'cogs' then
		rds_post_line.setitem(ll_insert_row,'TRANS_CUR_ID', ldb_base_curr )
		rds_post_line.setitem(ll_insert_row,'EX_RATE', 1)
	else
		rds_post_line.setitem(ll_insert_row,'TRANS_CUR_ID', vdb_currency_id)
		rds_post_line.setitem(ll_insert_row,'EX_RATE', ldb_exrate_amt)		
	end if	
	rds_post_line.setitem(ll_insert_row,'trans_date', ld_trans_date)

	if not isnull(ls_not_accept_col) and ls_not_accept_col<>'' then
		rds_post_line.setitem(ll_insert_row,'not_accept',  vds_get_amount.getitemstring(ll_row,ls_not_accept_col))
	end if	
		
	if mod(ll_insert_row, 20) = 0 and lb_create_account then
		if rds_post_line.update(true,false) = -1 then
			gf_messagebox('m.b_doc.f_insert_post_line_multi.03','Thông báo','Không cập nhật được post line:@' +rt_transaction.sqlerrtext ,'exclamation','ok',1)
			rollback using rt_transaction;
			return -1
		end if	
		rds_post_line.reset()
		
	end if
NEXT

if lb_create_account then
	//-- destroy ds--//
	if rds_post_line.update(true,false) = -1 then
		this.f_log_post( vdb_doc_id,'Không cập nhật được postline :@' +rt_transaction.sqlerrtext)
//		gf_messagebox('m.b_doc.f_insert_post_line_multi.03','Thông báo','Không cập nhật được postline :@' +rt_transaction.sqlerrtext ,'exclamation','ok',1)
		rollback using rt_transaction;
		return -1
	end if	
	destroy rds_post_line
	GarbageCollect ( )
	
	
	//-- update cot sku ,cogs--//
	if  vds_get_amount.rowcount()> 0 and lb_update_sku then
		if vds_get_amount.update(true,false) = -1 then
			this.f_log_post( vdb_doc_id,'Không cập nhật được số lượng theo đơn vị tồn kho:@' +rt_transaction.sqlerrtext)
//			gf_messagebox('m.b_doc.f_insert_post_line_multi.04','Thông báo','Không cập nhật được số lượng theo đơn vị tồn kho:@' +rt_transaction.sqlerrtext ,'exclamation','ok',1)
			rollback using rt_transaction;
			return -1
		end if	
		vds_get_amount.resetupdate()	
	end if
	
	destroy lds_matching
	return 1
end if
destroy lds_matching
destroy rds_post_line
return 0

end function

public function integer f_get_item_columns_of_streamvalue (string vs_item_dwo, ref string ras_col_item[], s_str_streamvalue vastr_streamvalue[]);int					li_idx
c_string_ex			lc_string

lc_string = create c_string_ex

FOR li_idx = 1 to upperbound(vastr_streamvalue[])
	if left(vastr_streamvalue[li_idx].s_item_dwo, len(vastr_streamvalue[li_idx].s_item_dwo)-5) = left(vs_item_dwo, len(vs_item_dwo) -5) then
		lc_string.f_stringtoarray( vastr_streamvalue[li_idx].s_item_column, ';', ras_col_item[])
	end if										
NEXT
return upperbound(ras_col_item[])

end function

public function integer f_insert_item_balance_row_multi_ex (ref t_transaction rt_transaction, ref t_ds_db rds_item, ref long rl_item_row, t_ds_db vds_f_object, t_ds_db vds_t_object, date vd_trans_date, string vs_post_type, string vas_col_item[], string vas_col_item_value[], string vas_f_col_object[], string vas_t_col_object[], any vaa_data[], string vs_qty_yn, string vs_value_yn, double vdb_trans_uom, string vs_qty_column, double vdb_value, ref s_str_ds_4_posting rstr_ds_4_posting, string vs_trans_qty_yn, string vs_trans_val_yn, ref s_str_data rstr_data_from_to, double vdb_doc_id, string vs_related_doc_qty_yn);/**************************************************************************************
Chức năng: Cập nhật 1 record giao dịch vào bảng item balance. 
	 # mặt hàng không quản lý số lượng thì bỏ qua
	 # Mặt hàng không quản lý số lot/seri: cập số lượng và giá trị tồn kho trên cùng record
	 # mặt hàng có quản lý số lot/seri: 
	 		- Cập nhật số lượng tồn kho theo lot/seri, mỗi lot/seri 1 record tồn kho Số lượng.
			- Cập nhật giá trị tồn kho theo mã hàng ( tổng giá trị của các lot/seri), mỗi mã hàng 1 record giá trịn tồn kho.
-------------------------------------
Tham số:	- rt_transaction : transacion của document
				- rdw_item : dw giao dịch chứa item cần ghi sổ, dw có chứa column giá trị ghi sổ trong trường hợp vs_value = 'Y'
				- vds_f_object: dw chứa đối tượng FROM
				- vds_t_object: dw chứa đối tượng TO
				- vd_trans_date: ngày ghi sổ
				- vs_post_type : POST hoặc UNPOST
				- vas_col_item[]: mảng chứa các cột: item_id, qty...
				- vas_col_item_value[]: mảng chưa các cột item_id, giá trị ghi sổ ...
				- vas_f_col_object[]: mảng chứa cột f_object_id
				- vas_t_col_object[]: mảng chưa cột t_object_id
				- vs_qty_yn : 'Y' ghi sổ số lượng
				- vs_value_yn: nếu là 'Y' tức là ghi sổ giá trị
				- vaa_data[]: vaa_data[1](item_id), vaa_data[2](company_id), vaa_data[3](spec_id), vaa_data[4](loc_id)
								  vaa_data[5](trans_date), vaa_data[6](object_id), vaa_data[7](lot_no), vaa_data[8](serial_no),
								  vaa_data[9](sob),vaa_data[10](value_yn),vaa_data[10](branch_id)
--------------------------------------
return:	0: chứng từ không cập nhật tồn kho
			1: cập nhật tồn kho thành công
		   -1: Lỗi
=============================================================================*/
int							li_rtn, li_pos_s, li_pos_e, li_chr_nbr, li_idx_master	, li_idx	
long						ll_f_object_row, ll_t_object_row
string						ls_balance_control, ls_warehouse_trans_type, ls_lot_yn,ls_serial_yn
string						ls_f_object_type,ls_t_object_type, ls_tmp_object_type, ls_dwo_tmp
double					ldb_qty_sku, ldb_trans_qty, ldb_trans_uom, ldb_round_diff, ldb_object_ref_id
double					ldb_f_object_id, ldb_t_object_id, ldb_tmp_object_id, ldb_null
boolean					lb_is_manage_value
any						la_tmp



//--Lấy Id của đối tượng FROM--//
if vds_f_object.dataobject = rds_item.dataobject then 
	ldb_f_object_id = vds_f_object.getitemnumber( rl_item_row, vas_f_col_object[1])
	if  upperbound(vas_f_col_object[]) = 4 then
		rstr_data_from_to.aa_data_from[3] = vds_f_object.getitemnumber( rl_item_row, vas_f_col_object[4])
	end if	
else
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(rds_item.dataobject,len(rds_item.dataobject) -5) + '[')
	if li_pos_s = 0 then //-- khong có trong list ->rds_item là master 1 --//
		li_idx_master =  1
		if upper(rds_item.describe("datawindow.table.UpdateTable")) = 'DOCUMENT' then
			ldb_object_ref_id =  rds_item.getitemnumber( rl_item_row, 'version_id')
		else
			ldb_object_ref_id =  rds_item.getitemnumber( rl_item_row, 'ID')
		end if	
		if vds_f_object.dataobject = rstr_ds_4_posting.ds_details[li_idx_master].dataobject then
			ll_f_object_row = vds_f_object.find("object_ref_id ="+string(ldb_object_ref_id),1,vds_f_object.rowcount())	
			if ll_f_object_row > 0 then
				ldb_f_object_id = vds_f_object.getitemnumber( ll_f_object_row, vas_f_col_object[1])
				if  upperbound(vas_f_col_object[]) = 4 then
					rstr_data_from_to.aa_data_from[3] = vds_f_object.getitemnumber( ll_f_object_row, vas_f_col_object[4])
				end if				
			end if			
		else //-- tiềm detail cấp dưới nữa --//			
			
		end if
	else
		//-- lấy master kiểm tra--//
		ldb_object_ref_id =  rds_item.getitemnumber( rl_item_row, 'object_ref_id')
		li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
		li_chr_nbr = li_pos_e - (li_pos_s + len(rds_item.dataobject) - 4)
		li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(rds_item.dataobject) - 4 , li_chr_nbr ))		
		
		if vds_f_object.dataobject = rstr_ds_4_posting.ds_master[li_idx_master].dataobject then
			if upper(vds_f_object.describe("datawindow.table.UpdateTable")) = 'DOCUMENT' then
				ll_f_object_row = vds_f_object.find("version_id ="+string(ldb_object_ref_id),1,vds_f_object.rowcount())
			else
				ll_f_object_row = vds_f_object.find(" ID ="+string(ldb_object_ref_id),1,vds_f_object.rowcount())
			end if
			if ll_f_object_row > 0 then
				ldb_f_object_id = vds_f_object.getitemnumber( ll_f_object_row, vas_f_col_object[1])
				if  upperbound(vas_f_col_object[]) = 4 then
					rstr_data_from_to.aa_data_from[3] = vds_f_object.getitemnumber( ll_f_object_row, vas_f_col_object[4])
				end if						
			end if					
		else  //-- tiềm master cấp trên nữa --//		
			li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(rstr_ds_4_posting.ds_master[li_idx_master].dataobject,len(rstr_ds_4_posting.ds_master[li_idx_master].dataobject) -5) + '[')
			li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
			li_chr_nbr = li_pos_e - (li_pos_s + len(rstr_ds_4_posting.ds_master[li_idx_master].dataobject) - 4)
			li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(rstr_ds_4_posting.ds_master[li_idx_master].dataobject) - 4 , li_chr_nbr ))		
			if vds_f_object.dataobject = rstr_ds_4_posting.ds_master[li_idx_master].dataobject then
				if upper(vds_f_object.describe("datawindow.table.UpdateTable")) = 'DOCUMENT' then
					ll_f_object_row = vds_f_object.find("version_id ="+string(ldb_object_ref_id),1,vds_f_object.rowcount())
				else
					ll_f_object_row = vds_f_object.find(" ID ="+string(ldb_object_ref_id),1,vds_f_object.rowcount())
				end if
				if ll_f_object_row > 0 then
					ldb_f_object_id = vds_f_object.getitemnumber( ll_f_object_row, vas_f_col_object[1])
					if  upperbound(vas_f_col_object[]) = 4 then
						rstr_data_from_to.aa_data_from[3] = vds_f_object.getitemnumber( ll_f_object_row, vas_f_col_object[4])
					end if						
				end if						
			else //-- tiềm master cấp trên nữa --//		
			end if
		end if 
	end if
end if		


if vds_t_object.dataobject = rds_item.dataobject then 
	ldb_t_object_id = vds_t_object.getitemnumber( rl_item_row, vas_t_col_object[1])
	if ldb_t_object_id = ldb_f_object_id then //-- từ kho = đến kho: cho phép đổi lot/serial trong cùng kho --//
		FOR li_idx = 2 to upperbound(vas_t_col_object[]) 
			la_tmp = vds_t_object.f_getitemany( rl_item_row, vas_t_col_object[li_idx])
			if isnull(la_tmp) and li_idx < 4 then
				rstr_data_from_to.aa_data_to[li_idx -1]  = rstr_data_from_to.aa_data_from[li_idx -1] 
			else
				rstr_data_from_to.aa_data_to[li_idx -1] =  vds_t_object.f_getitemany( rl_item_row, vas_t_col_object[li_idx])
			end if			
		NEXT	
	else
		if upperbound(rstr_data_from_to.aa_data_to[]) = 3 then
			rstr_data_from_to.aa_data_to[1] = rstr_data_from_to.aa_data_from[1] 
			rstr_data_from_to.aa_data_to[2] = rstr_data_from_to.aa_data_from[2] 
		elseif upper(this.f_get_object_type_ex(ldb_t_object_id, rt_transaction )) = 'WAREHOUSE'  then
			rstr_data_from_to.aa_data_to[1] = rstr_data_from_to.aa_data_from[1] 
			rstr_data_from_to.aa_data_to[2] = rstr_data_from_to.aa_data_from[2] 			
			if upperbound(vas_t_col_object[]) = 4 then
				rstr_data_from_to.aa_data_to[3] =  vds_t_object.f_getitemany( rl_item_row, vas_t_col_object[4])
			end if
		else
			rstr_data_from_to.aa_data_to[1] = rstr_data_from_to.aa_data_from[1] 
			rstr_data_from_to.aa_data_to[2] = rstr_data_from_to.aa_data_from[2] 					
		end if	
	end if
else
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(rds_item.dataobject,len(rds_item.dataobject) -5) + '[')
	if li_pos_s = 0 then //-- khong có trong list ->rds_item là master 1 --//
		li_idx_master =  1
		if upper(rds_item.describe("datawindow.table.UpdateTable")) = 'DOCUMENT' then
			ldb_object_ref_id =  rds_item.getitemnumber( rl_item_row, 'version_id')
		else
			ldb_object_ref_id =  rds_item.getitemnumber( rl_item_row, 'ID')
		end if	
		if vds_t_object.dataobject = rstr_ds_4_posting.ds_details[li_idx_master].dataobject then
			ll_t_object_row = vds_t_object.find("object_ref_id ="+string(ldb_object_ref_id),1,vds_t_object.rowcount())
			if ll_t_object_row > 0 then
				ldb_t_object_id = vds_t_object.getitemnumber( ll_t_object_row, vas_t_col_object[1])
				if ldb_t_object_id = ldb_f_object_id then //-- từ kho = đến kho: cho phép đổi lot/serial trong cùng kho --//
					FOR li_idx = 2 to upperbound(vas_t_col_object[]) 
						la_tmp = vds_t_object.f_getitemany( ll_t_object_row, vas_t_col_object[li_idx])
						if isnull(la_tmp) and li_idx < 4 then
							rstr_data_from_to.aa_data_to[li_idx -1]  = rstr_data_from_to.aa_data_from[li_idx -1] 
						else
							rstr_data_from_to.aa_data_to[li_idx -1] =  vds_t_object.f_getitemany( ll_t_object_row, vas_t_col_object[li_idx])
						end if								
					NEXT	
				else
					if upperbound(rstr_data_from_to.aa_data_to[]) = 3 then
						rstr_data_from_to.aa_data_to[1] = rstr_data_from_to.aa_data_from[1] 
						rstr_data_from_to.aa_data_to[2] = rstr_data_from_to.aa_data_from[2] 
					elseif upper(this.f_get_object_type_ex(ldb_t_object_id, rt_transaction )) = 'WAREHOUSE'  then
						rstr_data_from_to.aa_data_to[1] = rstr_data_from_to.aa_data_from[1] 
						rstr_data_from_to.aa_data_to[2] = rstr_data_from_to.aa_data_from[2] 	
						if upperbound( vas_t_col_object[]) = 4 then
							rstr_data_from_to.aa_data_to[3] =  vds_t_object.f_getitemany( ll_t_object_row, vas_t_col_object[4])
						end if
					else
						rstr_data_from_to.aa_data_to[1] = rstr_data_from_to.aa_data_from[1] 
						rstr_data_from_to.aa_data_to[2] = rstr_data_from_to.aa_data_from[2]					
					end if	
				end if						
			end if						
		else //-- tiềm detail cấp dưới nữa --//	
		end if	
	else
		//-- lấy master kiểm tra--/
		ldb_object_ref_id =  rds_item.getitemnumber( rl_item_row, 'object_ref_id')
		li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
		li_chr_nbr = li_pos_e - (li_pos_s + len(rds_item.dataobject) - 4)
		li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(rds_item.dataobject) - 4 , li_chr_nbr ))		
		if vds_t_object.dataobject = rstr_ds_4_posting.ds_master[li_idx_master].dataobject then
			if upper(vds_t_object.describe("datawindow.table.UpdateTable")) = 'DOCUMENT' then
				ll_t_object_row = vds_t_object.find(" VERSION_ID ="+string(ldb_object_ref_id),1,vds_t_object.rowcount())
			else
				ll_t_object_row = vds_t_object.find(" ID ="+string(ldb_object_ref_id),1,vds_t_object.rowcount())
			end if
			if ll_t_object_row > 0 then
				ldb_t_object_id = vds_t_object.getitemnumber( ll_t_object_row, vas_t_col_object[1])
				if ldb_t_object_id = ldb_f_object_id then //-- từ kho = đến kho: cho phép đổi lot/serial trong cùng kho --//
					FOR li_idx = 2 to upperbound(vas_t_col_object[]) 
						la_tmp = vds_t_object.f_getitemany( ll_t_object_row, vas_t_col_object[li_idx])
						if isnull(la_tmp) and li_idx < 4 then
							rstr_data_from_to.aa_data_to[li_idx -1]  = rstr_data_from_to.aa_data_from[li_idx -1] 
						else
							rstr_data_from_to.aa_data_to[li_idx -1] =  vds_t_object.f_getitemany( ll_t_object_row, vas_t_col_object[li_idx])
						end if														
					NEXT	
				else
					if upperbound(rstr_data_from_to.aa_data_to[]) = 3 then
						rstr_data_from_to.aa_data_to[1] = rstr_data_from_to.aa_data_from[1] 
						rstr_data_from_to.aa_data_to[2] = rstr_data_from_to.aa_data_from[2] 
					elseif upper(this.f_get_object_type_ex(ldb_t_object_id, rt_transaction )) = 'WAREHOUSE'  then
						rstr_data_from_to.aa_data_to[1] = rstr_data_from_to.aa_data_from[1] 
						rstr_data_from_to.aa_data_to[2] = rstr_data_from_to.aa_data_from[2] 
						if upperbound(vas_t_col_object[]) = 4 then
							rstr_data_from_to.aa_data_to[3] =  vds_t_object.f_getitemany( ll_t_object_row, vas_t_col_object[4])
						end if
					else
						rstr_data_from_to.aa_data_to[1] = rstr_data_from_to.aa_data_from[1] 
						rstr_data_from_to.aa_data_to[2] = rstr_data_from_to.aa_data_from[2] 							
					end if					
				end if							
			end if				
		else //-- tiềm master cấp trên nữa --//	
			li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(rstr_ds_4_posting.ds_master[li_idx_master].dataobject,len(rstr_ds_4_posting.ds_master[li_idx_master].dataobject) -5) + '[')
			li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
			li_chr_nbr = li_pos_e - (li_pos_s + len(rstr_ds_4_posting.ds_master[li_idx_master].dataobject) - 4)
			li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(rstr_ds_4_posting.ds_master[li_idx_master].dataobject) - 4 , li_chr_nbr ))			
			if vds_t_object.dataobject = rstr_ds_4_posting.ds_master[li_idx_master].dataobject then
				if upper(vds_t_object.describe("datawindow.table.UpdateTable")) = 'DOCUMENT' then
					ll_t_object_row = vds_t_object.find(" VERSION_ID ="+string(ldb_object_ref_id),1,vds_t_object.rowcount())
				else
					ll_t_object_row = vds_t_object.find(" ID ="+string(ldb_object_ref_id),1,vds_t_object.rowcount())
				end if
				if ll_t_object_row > 0 then
					ldb_t_object_id = vds_t_object.getitemnumber( ll_t_object_row, vas_t_col_object[1])
					if ldb_t_object_id = ldb_f_object_id then //-- từ kho = đến kho: cho phép đổi lot/serial trong cùng kho --//
						FOR li_idx = 2 to upperbound(vas_t_col_object[]) 
							la_tmp = vds_t_object.f_getitemany( ll_t_object_row, vas_t_col_object[li_idx])
							if isnull(la_tmp) and li_idx < 4 then
								rstr_data_from_to.aa_data_to[li_idx -1]  = rstr_data_from_to.aa_data_from[li_idx -1] 
							else
								rstr_data_from_to.aa_data_to[li_idx -1] =  vds_t_object.f_getitemany( ll_t_object_row, vas_t_col_object[li_idx])
							end if														
						NEXT	
					else
						if upperbound(rstr_data_from_to.aa_data_to[]) = 3 then
							rstr_data_from_to.aa_data_to[1] = rstr_data_from_to.aa_data_from[1] 
							rstr_data_from_to.aa_data_to[2] = rstr_data_from_to.aa_data_from[2] 
						elseif upper(this.f_get_object_type_ex(ldb_t_object_id, rt_transaction )) = 'WAREHOUSE'  then
							rstr_data_from_to.aa_data_to[1] = rstr_data_from_to.aa_data_from[1] 
							rstr_data_from_to.aa_data_to[2] = rstr_data_from_to.aa_data_from[2] 
							if upperbound(vas_t_col_object[]) = 4 then
								rstr_data_from_to.aa_data_to[3] =  vds_t_object.f_getitemany( ll_t_object_row, vas_t_col_object[4])
							end if
						else
							rstr_data_from_to.aa_data_to[1] = rstr_data_from_to.aa_data_from[1] 
							rstr_data_from_to.aa_data_to[2] = rstr_data_from_to.aa_data_from[2] 							
						end if					
					end if							
				end if								
			else  //-- tiềm master cấp trên nữa --//	
			end if
		end if
	
	end if		
end if		


if isnull(ldb_f_object_id) or ldb_f_object_id = 0 then 
	messagebox('Thông báo','Đối tượng ghi sổ xuất nhập kho chưa được nhập NULL')
//	gf_messagebox('m.b_doc.f_insert_item_balance_row_multi.01','Thông báo','Đối tượng ghi sổ xuất nhập kho chưa được nhập NULL','stop','ok',1)
	return -1
end if
if isnull(ldb_t_object_id) or ldb_t_object_id = 0 then 
	messagebox('Thông báo','Đối tượng ghi số xuất nhập kho chưa được nhập NULL' )
//	gf_messagebox('m.b_doc.f_insert_item_balance_row_multi.01','Thông báo','Đối tượng ghi số xuất nhập kho chưa được nhập NULL','stop','ok',1)
	return -1
end if
ls_f_object_type = this.f_get_object_type_ex(ldb_f_object_id , rt_transaction )		
ls_t_object_type = this.f_get_object_type_ex(ldb_t_object_id , rt_transaction)		
if upper(ls_f_object_type) = 'WAREHOUSE' then
	ls_warehouse_trans_type = 'OUT'
else
	ls_warehouse_trans_type = 'IN'
end if

this.f_get_lot_or_serial_yn_ex(vaa_data[1],  ls_lot_yn,ls_serial_yn, rt_transaction)
lb_is_manage_value =  this.f_is_managed_qty_ex( vaa_data[1], rt_transaction)

//-- set sku_qty khi POST --//	
//if upper(vs_qty_yn) = 'Y' then
	if upper(vs_post_type) = 'POST' then
		if upper(vs_value_yn) = 'N' or  (upper(vs_value_yn) = 'Y' and (ls_lot_yn ='Y' or ls_serial_yn = 'Y') ) then  // nếu quản lý lot/seri ghi sổ gia trị chưa tình sku của lot/seri
			//-- Lây sku_qty và round diff --//		
			if this.f_set_Qty_sku(rt_transaction, rds_item, rl_item_row,vaa_data[1],vdb_trans_uom, vs_qty_column, ls_warehouse_trans_type, ldb_qty_sku, ldb_round_diff) = -1 then
				messagebox('Thông báo','f_set_Qty_sku')
				return -1
			end if
		else
			ldb_qty_sku = rds_item.dynamic getitemnumber(rl_item_row,vs_qty_column+'_sku')
		end if
	else //-- Lấy sku_qty khi UNPOST hoặc ghi sổ vừa SL vừa Giá trị--//
		ldb_qty_sku = rds_item.dynamic getitemnumber(rl_item_row,vs_qty_column+'_sku')
		if isnull(ldb_qty_sku) then ldb_qty_sku = 0		
		//-- Lấy round diff --//
		if this.f_get_round_diff( rt_transaction, rds_item, rl_item_row, vaa_data[1], vdb_trans_uom,vs_qty_column, ldb_round_diff) = -1 then 
			messagebox('Thông báo','f_get_round_diff')
			return -1
		end if
	end if
	if ldb_qty_sku < 0 then //-- Đảo giao dịch IN<->OUT --//
		ls_warehouse_trans_type = 'OUT'
		ldb_qty_sku = - ldb_qty_sku
		ldb_tmp_object_id = ldb_f_object_id
		ldb_f_object_id = ldb_t_object_id
		ldb_t_object_id = ldb_tmp_object_id
		ls_tmp_object_type = ls_f_object_type
		ls_f_object_type = ls_t_object_type
		ls_t_object_type = ls_tmp_object_type
	end if
	if upper(vs_post_type) = 'UNPOST' then	ldb_qty_sku = - ldb_qty_sku
	
	//-- update round_diff --//
	if ls_warehouse_trans_type = 'OUT' then
		this.f_update_round_diff( ldb_f_object_id, ldb_round_diff, rt_transaction)
	else
		this.f_update_round_diff( ldb_t_object_id, ldb_round_diff, rt_transaction)
	end if	
//end if

//-- Lấy giá trị ghi sổ --//
if upper(vs_value_yn) = 'Y' then
	if upper(vs_post_type) = 'UNPOST' then vdb_value = - vdb_value
end if	
	
//-- Cập nhật đối tượng FROM --//
if upper(ls_f_object_type) = 'WAREHOUSE' then
	ls_balance_control  = this.f_get_warehouse_negative(ldb_f_object_id ,rt_transaction )

else
	ls_balance_control = 'negative_allow'
end if			
vaa_data[6] = ldb_f_object_id	
vaa_data[7] = rstr_data_from_to.aa_data_from[1]	
vaa_data[8] = rstr_data_from_to.aa_data_from[2]	
//-- loc_id --//
if upperbound(rstr_data_from_to.aa_data_from[]) = 3 then
	vaa_data[4] = rstr_data_from_to.aa_data_from[3]	
else
	setnull(ldb_null)
	vaa_data[4] =ldb_null	
end if
//-- Cập nhật ghi sổ SL khi chứng từ chọn vừa ghi sổ SL vừa GT--//
if vs_qty_yn = 'Y'  and ( vs_trans_val_yn = 'N' or vs_related_doc_qty_yn ='N')  then  //--Ghi số balance SL--//
	vaa_data[10] = 'N'
	vaa_data[11] = gdb_branch
	if this.f_update_item_balance(rt_transaction, vaa_data, vd_trans_date, ldb_qty_sku,0,'OUT',ls_balance_control, 'N' , 'N' ,ls_t_object_type) = -1 then
		update document set status = 'new' where id = :vdb_doc_id using rt_transaction;		
		commit using rt_transaction;
		return -1
	end if	
end if
if vs_value_yn = 'Y' and  (vs_qty_yn = 'Y' or vs_related_doc_qty_yn ='Y') then   //--Ghi số balance GT--//
	vaa_data[10] = vs_value_yn
	vaa_data[11] = gdb_branch
	if this.f_update_item_balance(rt_transaction, vaa_data, vd_trans_date, ldb_qty_sku,vdb_value,'OUT',ls_balance_control, 'N' , vs_value_yn,ls_t_object_type) = -1 then
		update document set status = 'new' where id = :vdb_doc_id using rt_transaction;
		commit using rt_transaction;
		return -1
	end if
end if

//-- Cập nhật đối tượng TO --//
if upper(ls_t_object_type) = 'WAREHOUSE' then
	ls_balance_control  = this.f_get_warehouse_negative(ldb_t_object_id , rt_transaction )
else
	ls_balance_control = 'negative_allow'
end if
vaa_data[6] = ldb_t_object_id
//--lot_no--//
vaa_data[7] = rstr_data_from_to.aa_data_to[1]
//--serial_no--//
vaa_data[8] = rstr_data_from_to.aa_data_to[2]
//--loc_id--//
if upperbound(rstr_data_from_to.aa_data_to[]) = 3 then 
	vaa_data[4] = rstr_data_from_to.aa_data_to[3]
else
	setnull(ldb_null)
	vaa_data[4] =ldb_null
end if

//-- Cập nhật ghi sổ SL khi chứng từ chọn vừa ghi sổ SL vừa GT--//
if vs_qty_yn = 'Y'  and ( vs_trans_val_yn = 'N'  or vs_related_doc_qty_yn ='N')   then  //--Ghi số balance SL--//
	vaa_data[10] = 'N'
	vaa_data[11] = gdb_branch
	if this.f_update_item_balance(rt_transaction, vaa_data, vd_trans_date, ldb_qty_sku,0,'IN',ls_balance_control, 'N' , 'N',ls_t_object_type) = -1 then
		update document set status = 'new' where id = :vdb_doc_id using rt_transaction;
		commit using rt_transaction;
		return -1
	end if
end if
if vs_value_yn = 'Y'  and  (vs_qty_yn = 'Y' or vs_related_doc_qty_yn ='Y')  then   //--Ghi số balance GT--//
	vaa_data[10] = vs_value_yn
	vaa_data[11] = gdb_branch
	if this.f_update_item_balance(rt_transaction, vaa_data, vd_trans_date, ldb_qty_sku,vdb_value,'IN',ls_balance_control, 'N' , vs_value_yn,ls_t_object_type) = -1 then
		update document set status = 'new' where id = :vdb_doc_id using rt_transaction;
		commit using rt_transaction;
		return -1
	end if
end if

return 1

end function

public function decimal f_get_return_unit_cogs (double vdb_sal_rtn_line_id, ref t_transaction rt_transaction);decimal 	ldc_cogs,ldc_return_cost_price,ldc_ACT_QTY_SKU, ldc_adj_amount
double	ldb_sal_id
string 	ls_doc_code,ls_status

//-- trường hợp: hóa đơn <-> phiếu xuất kho <-> đơn bán hàng
select sal.id,sal.cogs,sal.ACT_QTY_SKU into :ldb_sal_id,:ldc_cogs,:ldc_ACT_QTY_SKU from so_line so 
                        join matching mat on mat.f_ref_id = so.id
                        join inventory_line ivl on mat.t_ref_id = ivl.id
                        join matching mat1 on mat1.f_ref_id = ivl.id
                        join sal_invoice_line sal on mat1.t_ref_id = sal.id                
                        join matching mat2 on mat2.f_ref_id = so.id
                        join so_line so1 on mat2.t_ref_id = so1.id
                        join matching mat3 on mat3.f_ref_id = so1.id
                        join inventory_line ivl1 on mat3.t_ref_id = ivl1.id
                        join matching mat4 on mat4.f_ref_id = ivl1.id
                        join sal_invoice_line sal1 on mat4.t_ref_id =  sal1.id 
where sal1.id = :vdb_sal_rtn_line_id using rt_transaction;

if rt_transaction.sqlcode = 0 then 
	if 	isnull(ldc_cogs) then ldc_cogs = 0							
	if ldc_cogs = 0 then 
		select doc.status,doc.code into :ls_status,:ls_doc_code from document doc
					  join sal_invoice_line sal on sal.object_ref_id = doc.version_id 
		where sal.id = :ldb_sal_id using rt_transaction;
		if rt_transaction.sqlcode <> 0 then
			messagebox('Thông báo','b_doc.f_get_sal_price(line:25)')
			return -1
		else
			if ls_status <> 'booked' then
				gf_messagebox('m.b_doc.f_get_sal_price.01','Thông báo','Hóa đơn gốc:'+ls_doc_code + 'chưa ghi sổ','exclamation','ok',1)
				return -1
			end if
		end if
	end if
elseif rt_transaction.sqlcode = 100 then
	select sal.id,sal.cogs,sal.ACT_QTY_SKU into :ldb_sal_id,:ldc_cogs,:ldc_ACT_QTY_SKU from so_line so 
                        join matching mat on mat.f_ref_id = so.id
                        join sal_invoice_line sal on mat.t_ref_id = sal.id               
                        join matching mat2 on mat2.f_ref_id = so.id
                        join so_line so1 on mat2.t_ref_id = so1.id
                        join matching mat4 on mat4.f_ref_id = so1.id
                        join sal_invoice_line sal1 on mat4.t_ref_id =  sal1.id using rt_transaction;
	
	if rt_transaction.sqlcode = 0 then
		if isnull(ldc_cogs) then ldc_cogs = 0
		if ldc_cogs = 0 then
			select doc.status,doc.code into :ls_status,:ls_doc_code from document doc
					  join sal_invoice_line sal on sal.object_ref_id = doc.version_id 
			where sal.id = :ldb_sal_id using rt_transaction;
			if rt_transaction.sqlcode <> 0 then
				messagebox('Thông báo','b_doc.f_get_sal_price(line:46)')
			else
				if ls_status <> 'booked' then
					gf_messagebox('m.b_doc.f_get_sal_price.01','Thông báo','Hóa đơn gốc:'+ls_doc_code + 'chưa ghi sổ','exclamation','ok',1)
					return -1
				end if
			end if
		end if
	elseif rt_transaction.sqlcode = 100 then
	end if
else
	messagebox('Thông báo','b_doc.f_get_sal_price(line:68)')
end if
//-- Kiểm tra số lượng trên hóa đơn --//
if ldc_ACT_QTY_SKU = 0 or isnull(ldc_ACT_QTY_SKU) then
	gf_messagebox('m.b_doc.f_get_sal_price.03','Thông báo','Hóa đơn gốc:'+ls_doc_code + 'Không nhập số lượng hàng hóa dịch vụ','exclamation','ok',1)
	return -1
end if
//-- Lấy giá vốn điều chỉnh --///
select base_value into :ldc_adj_amount
from STREAM_VALUE_ADJ where STREAM_VALUE_REF_ID = :ldb_sal_id using rt_transaction;
if isnull(ldc_adj_amount) then ldc_adj_amount = 0

ldc_return_cost_price = (ldc_cogs + ldc_adj_amount)/ ldc_ACT_QTY_SKU

return ldc_return_cost_price
end function

public function boolean f_is_managed_value_ex (double vdb_item_id, ref t_transaction rt_transaction);boolean			lb_ok
string				ls_value_yn

setnull(lb_ok)
if isnull(vdb_item_id) or vdb_item_id = 0 then	return lb_ok

select quantity_yn into :ls_value_yn from item where object_ref_id = :vdb_item_id  using rt_transaction;

if rt_transaction.sqlcode = 0 then
	if ls_value_yn = 'Y' then return true
	return false
else
	gf_messagebox('m.b_multithread.f_is_managed_qty_ex.01','Thông báo','Lôi Select table:'+rt_transaction.sqlerrtext,'stop','ok',1)
	return lb_ok
end if

end function

public function string f_get_object_control_yn (double vdb_id, ref t_transaction rt_transaction);string			ls_obj_control

SELECT OBJ_CONTROL_YN into :ls_obj_control
FROM ACCOUNT
where object_ref_id = :vdb_id using rt_transaction;

if rt_transaction.sqlcode = 0 then
	if isnull(ls_obj_control) then ls_obj_control ='N'
	return ls_obj_control
else
	return ''
end if
end function

public function string f_get_doc_type (double vdb_doc_id, ref transaction rtransaction);string			ls_data

select doc_type into :ls_data
	from document 
		where id = :vdb_doc_id 
		and company_id = :gi_user_comp_id 
		and branch_id = :gdb_branch 
		and sob = :gs_sob using rtransaction;
		
if rtransaction.sqlcode = 0 then
	return ls_data
else 
	return ''
end if
end function

public function integer f_create_exrate_post_line_ex (double vdb_dr_object_id, double vdb_cr_object_id, t_ds_db vds_f_post_line, double vdb_trans_amount, double vdb_base_amount, double vdb_settle_curr, double vdb_settle_exrate, date vd_trans_date, double vdb_doc_id, double vdb_object_ref_id, string vs_object_ref_table, s_str_post_account vstr_post_account, ref t_ds_db rds_post_line, ref t_transaction rt_transaction);/**********************************************************
Chức năng: Tạo định khoản cho chứng từ theo cài đặt ngiệp vụ ghi sổ
--------------------------------------------------------------------------------------------
Tham số: vdb_doc_id : ID của chứng từ cần ghi sổ
---------------------------------------------------------------------
Return: 	 1 -> Thành công
			-1 -> Lỗi
==============================TrevietSoftware.com*/
string					ls_f_post_line_str
any					laa_data[]
long					ll_row
double				ldb_f_currency, ldb_f_exrate, ldb_f_trans_amt, ldb_f_base_amt, ldb_settle_trans_amt, ldb_settle_base_amt, ldb_exrate_diff_amt


	
	FOR ll_row = 1 to vds_f_post_line.rowcount( )
		ldb_f_currency = vds_f_post_line.getitemnumber( ll_row, 'TRANS_CUR_ID' )
		if isnull(ldb_f_currency) then ldb_f_currency = 0
		ldb_f_exrate = vds_f_post_line.getitemnumber( ll_row, 'EX_RATE' )
		if isnull(ldb_f_exrate) then ldb_f_exrate = 1
		ldb_f_trans_amt = vds_f_post_line.getitemnumber( ll_row, 'TRANS_AMT' )
		if isnull(ldb_f_trans_amt) then ldb_f_trans_amt = 0
		ldb_f_base_amt = vds_f_post_line.getitemnumber( ll_row, 'BASE_AMT' )
		if isnull(ldb_f_base_amt) then ldb_f_base_amt = 0
		if ldb_f_currency = vdb_settle_curr then
			//-- xác định số tiền giao dịch cấn trừ : ldb_settle_trans_amt--//
			if vdb_trans_amount >= ldb_f_trans_amt then
				ldb_settle_trans_amt = ldb_f_trans_amt
				vdb_trans_amount -= ldb_f_trans_amt
				ldb_settle_base_amt = min(ldb_f_base_amt, ldb_f_trans_amt * vdb_settle_exrate) //				
			else
				ldb_settle_trans_amt = vdb_trans_amount
				ldb_f_base_amt = vdb_trans_amount*ldb_f_exrate
				vdb_trans_amount = 0
				ldb_settle_base_amt =  min(ldb_f_base_amt, vdb_trans_amount * vdb_settle_exrate)				
			end if
//			-- xác định số tiền chênh lệch : ldb_exrate_diff_amt--//
			if upper(vstr_post_account.s_dr_object_type) = 'VENDOR' OR upper(vstr_post_account.s_dr_object_type) = 'CUSTOMER' OR upper(vstr_post_account.s_dr_object_type) = 'STAFF' THEN
				ldb_exrate_diff_amt =  ldb_settle_trans_amt * vdb_settle_exrate - ldb_f_base_amt  // dr - cr //
			else
				ldb_exrate_diff_amt =  ldb_f_base_amt - ldb_settle_trans_amt * vdb_settle_exrate // cr - dr //
			end if					
			if ldb_exrate_diff_amt = 0 then continue
			if this.f_insert_exrate_post_line_ex( rds_post_line,vstr_post_account, ldb_exrate_diff_amt, vdb_settle_curr, vdb_settle_exrate, vd_trans_date, vdb_doc_id, vdb_object_ref_id, vs_object_ref_table, vdb_dr_object_id, vdb_cr_object_id, rt_transaction) = -1 then 				
				return -1		
			end if
		else
			gf_messagebox('m.b_doc.f_create_exrate_post_line_ex.01','Thống báo','Ngoại tệ khác nhau không thể cấn trừ công nợ','exclamation','ok',1)
			return -1
		end if

	NEXT


return 1
end function

public function integer f_insert_exrate_post_line_ex (ref t_ds_db rds_post_line, s_str_post_account vstr_post_account, double vdb_diff_amount, double vdb_settle_currency, double vdb_exrate, date vd_trans_date, double vdb_doc_id, double vdb_object_ref_id, string vs_object_ref_table, double vdb_dr_object_id, double vdb_cr_object_id, ref t_transaction rt_transaction);long			ll_insert_row
double		ldba_exchange_account[]
string			ls_exrate_method, ls_trans_text, ls_posting_type, ls_doc_type

c_unit_instance_ex		lc_unit_instance_ex

lc_unit_instance_ex = create c_unit_instance_ex
if vdb_settle_currency = 0 or isnull(vdb_settle_currency) then return 0
if vdb_doc_id = 0 or isnull(vdb_doc_id) then return 0
if vdb_diff_amount = 0 or isnull(vdb_diff_amount) then return 0

if lc_unit_instance_ex.f_get_exchange_account_info_ex( vdb_settle_currency, ldba_exchange_account[], ls_exrate_method, ls_trans_text, rt_transaction) = -1 then return -1
ls_doc_type = this.f_get_doc_type( vdb_doc_id, rt_transaction)
if ls_doc_type = '' then
	messagebox('m.b_doc.f_insert_exrate_post_line_ex.02','Không xác định được loại chứng từ của ID:@'+string(vdb_doc_id))
//	gf_messagebox('m.b_doc.f_insert_exrate_post_line_ex.02','Thông báo','Không xác định được loại chứng từ của ID:@'+string(vdb_doc_id),'exclamation','ok',1)
	return -1
end if

if vdb_diff_amount > 0   then //-- lỗ --//
	if isnull(ldba_exchange_account[1]) or ldba_exchange_account[1] = 0 then
		gf_messagebox('m.b_doc.f_insert_exrate_post_line_ex.01','Thông báo','Chưa cài đặt tài khoản lỗ chênh lệch tỷ giá thực hiện','exclamation','ok',1)
		return -1
	end if
	//-- Chi: đảo đối tượng --//
	if ls_doc_type = 'PAYMENT' or ls_doc_type ='BANK_VOUCHER_PAYMENT' then	
		//-- đổi đối tượng và tk Nợ qua Có --//
		vstr_post_account.db_cr_account = vstr_post_account.db_dr_account 
		vstr_post_account.s_cr_object_type = vstr_post_account.s_dr_object_type 
		vstr_post_account.db_cr_object_id = vdb_dr_object_id
	else
		vstr_post_account.db_cr_object_id = vdb_cr_object_id //-- Gán lại đối tượng khi ko đảo -//
	end if

	//-- Ghi Nợ tài khoản Lỗ tỷ giá --//
	vstr_post_account.db_dr_account = ldba_exchange_account[1]
	vstr_post_account.s_dr_object_type = 'ACCOUNT'
	vstr_post_account.db_dr_object_id =  ldba_exchange_account[1]		
		
	ls_posting_type = 'realized_loss'
	ls_trans_text = 'Lỗ chênh lệch tỷ giá'
else		//-- lãi --//
	if isnull(ldba_exchange_account[2]) or ldba_exchange_account[2] = 0 then
		gf_messagebox('m.b_doc.f_insert_exrate_post_line_ex.01','Thông báo','Chưa cài đặt tài khoản lãi chênh lệch tỷ giá thực hiện','exclamation','ok',1)
		return -1
	end if		
	//-- Thu: đảo đối tượng --//
	if ls_doc_type = 'RECEIPT' or ls_doc_type ='BANK_VOUCHER' then	
		//-- đổi đối tượng và tk Có qua Nợ --//
		vstr_post_account.db_dr_account = vstr_post_account.db_cr_account 
		vstr_post_account.s_dr_object_type = vstr_post_account.s_cr_object_type 
		vstr_post_account.db_dr_object_id = vdb_cr_object_id
	else
		vstr_post_account.db_dr_object_id = vdb_dr_object_id //-- Gán lại đối tượng khi ko đảo -//
	end if

	//-- Ghi Có tài khoản Lãi tỷ giá --//
	vstr_post_account.db_cr_account = ldba_exchange_account[2]
	vstr_post_account.s_cr_object_type = 'ACCOUNT'
	vstr_post_account.db_cr_object_id = ldba_exchange_account[2]			
		
	ls_posting_type = 'realized_profit'
	ls_trans_text = 'Lãi chênh lệch tỷ giá'
	vdb_diff_amount = -vdb_diff_amount
end if
//--insert post_line--//
ll_insert_row = rds_post_line.event e_addrow()
rds_post_line.setitem(ll_insert_row,'id', this.f_create_id_ex( rt_transaction) )
rds_post_line.setitem(ll_insert_row,'dr_object_type', upper(vstr_post_account.s_dr_object_type))
rds_post_line.setitem(ll_insert_row,'dr_object_id', vstr_post_account.db_dr_object_id)
rds_post_line.setitem(ll_insert_row,'trans_text', ls_trans_text )
rds_post_line.setitem(ll_insert_row,'post_type_text', ls_trans_text )
rds_post_line.setitem(ll_insert_row,'dr_account_id', vstr_post_account.db_dr_account)
rds_post_line.setitem(ll_insert_row,'dr_subaccount', vstr_post_account.db_dr_subaccount)
rds_post_line.setitem(ll_insert_row,'cr_object_type', upper(vstr_post_account.s_cr_object_type))
rds_post_line.setitem(ll_insert_row,'cr_object_id', vstr_post_account.db_cr_object_id)
rds_post_line.setitem(ll_insert_row,'cr_account_id', vstr_post_account.db_cr_account)
rds_post_line.setitem(ll_insert_row,'cr_subaccount', vstr_post_account.db_cr_subaccount)		
rds_post_line.setitem(ll_insert_row,'post_type', ls_posting_type)
rds_post_line.setitem(ll_insert_row,'doc_id', vdb_doc_id)
rds_post_line.setitem(ll_insert_row,'object_ref_id', vdb_object_ref_id)
rds_post_line.setitem(ll_insert_row,'object_ref_table', upper(vs_object_ref_table))
rds_post_line.setitem(ll_insert_row,'trans_amt', 0)
rds_post_line.setitem(ll_insert_row,'base_amt',  vdb_diff_amount)
rds_post_line.setitem(ll_insert_row,'TRANS_CUR_ID', vdb_settle_currency)
rds_post_line.setitem(ll_insert_row,'EX_RATE', vdb_exrate)
rds_post_line.setitem(ll_insert_row,'trans_date', vd_trans_date)

return ll_insert_row
end function

on b_multithread.create
call super::create
end on

on b_multithread.destroy
call super::destroy
end on

event constructor;call super::constructor;it_transaction = create t_transaction
RegistryGet("HKEY_CURRENT_USER\Control Panel\International","sShortDate",RegString!, gs_w_date_format)
RegistryGet("HKEY_CURRENT_USER\Control Panel\International","sThousand",RegString!, gs_w_thousand_grp)
RegistryGet("HKEY_CURRENT_USER\Control Panel\International","sDecimal",RegString!, gs_decimal)

end event

event destructor;call super::destructor;destroy it_transaction
end event

