$PBExportHeader$b_doc.sru
forward
global type b_doc from s_object_display
end type
end forward

global type b_doc from s_object_display
boolean ib_filter = false
boolean ib_refresh = false
boolean ib_trace = false
boolean ib_keyboardlocked = false
boolean ib_query = false
boolean ib_update = false
boolean ib_insert = false
boolean ib_delete = false
boolean ib_query_ctx = false
boolean ib_update_ctx = false
boolean ib_insert_ctx = false
boolean ib_delete_ctx = false
boolean ib_trace_ctx = false
event type integer e_action_post_multi ( t_ds_db vds_main,  s_str_ds_4_posting vstr_ds_4_posting,  t_transaction vt_transaction )
event type integer e_action_post_multi_ex ( t_ds_db vds_main,  s_str_ds_4_posting vstr_ds_4_posting,  t_transaction vt_transaction )
end type
global b_doc b_doc

type variables
double		idb_previous_exrate, idb_previous_uom
long			il_previous_uom_row
double		idb_trans_id
boolean		ib_doc_return_yn
t_ds_db		ids_matching,ids_trans_setup,ids_tax_authority,ids_currency

s_str_ds_4_posting		istr_ds_4_posting
end variables

forward prototypes
public function integer f_post_tax (string vs_dw_binding)
public function integer f_post_tax (string vs_doc_type, string vs_dw_binding)
public function integer f_delete_matching (datawindow vdw_deleting, long vl_del_row)
public function boolean f_is_matching (double vdb_doc_id, ref double radb_t_ref_id[], ref string ras_t_ref_table[])
public function boolean f_chk_qty_matching (s_str_dwo_related vastr_dwo_related[])
public function long f_find_object_on_post_set (string vs_object_type, t_ds_db vds_post_line_set, string vs_dr_cr)
public function long f_get_trans_setup_dwo (string vs_dwo_object, t_ds_db vds_trans_setup, string vs_dr_cr, ref t_ds_db vds_trans_setup_of_dwo)
public function long f_get_trans_setup_dwo (string vs_dwo_object, t_ds_db vds_trans_setup, string vs_dr_cr, ref t_ds_db vds_data[])
public subroutine f_set_actionpane ()
public function string f_get_object_type (long vl_object_id)
public function string f_get_balance_control_type (long vl_account_id)
public subroutine f_set_idb_trans_id (double vdb_trans_id)
public function integer f_view_all_on_off (readonly datawindow rdw_handling, string vs_colname)
public function integer f_set_ids_matching (t_ds_db vds_handling)
public function t_ds_db f_get_ids_matching ()
public function decimal f_get_values_qty_first_copy (datawindow vdw_handling, string vs_t_ref_table, string vas_match_handling_column[], string vas_match_column[], ref decimal rdc_qty_matching, ref decimal rdc_qty_doc, long vl_row)
public function string f_get_doc_code_matching (double vadb_ref_id[])
public function integer f_get_trans_setup (double vdb_trans_hdr_id, ref t_ds_db rds_trans_setup)
public function integer f_get_trans_setup_account (t_ds_db vds_trans_setup, string vs_posting_type, double vdb_dr_object_id, double vdb_cr_object_id, any va_dr_criteria_data, string vs_dr_coltype, any va_cr_criteria_data, string vs_cr_coltype, ref s_str_post_account rstr_post_account, ref string rs_dr_obj_type, ref string rs_cr_obj_type)
public function integer f_update_item_balance (string vs_post_type)
public function integer f_update_item_balance (ref t_ds_db rds_item_balance, t_dw_mpl vdw_handling, string vs_col_handling, long vl_row_handling, string vs_type, ref any raa_data[], string vs_post_type)
public function integer f_get_trans_date (ref date rd_trans_date)
public function integer f_get_address (double vdb_object_id, string vs_address_type, ref string rs_address)
public function integer f_insert_ledger_trans (double vdb_doc_id, string vs_doctype, date vd_trans_date, ref t_transaction rt_transaction, ref t_ds_db vds_ledger_trans)
public function integer f_insert_object_trans (double vdb_doc_id, string vs_doctype, date vd_trans_date, ref t_transaction rt_transaction, t_ds_db rds_obj_trans_post)
public function integer f_update_value_matching (ref datastore rds_matching, datawindow vdw_modify, long vl_currentrow, string vs_t_column[], string vs_matching_column[])
public function string f_get_obj_type_other (double vdb_object_id, string vs_obj_type_primary)
public function long f_unbooking (double vdb_doc_id, string vs_qty_yn, string vs_value_yn)
public function integer f_update_item_balance (ref t_transaction rt_transaction, any vaa_arg[], date vd_trans_date, double vdb_qty, double vdb_base_value, string vs_in_out, string vs_balance_control, string ls_lotno_serial, string vs_value_yn, string vs_object_type)
public function integer f_set_qty_sku (ref t_transaction rt_transaction, ref t_dw_mpl rdw_item, double vdb_row, ref t_dw_mpl rdw_item_lot, double vdb_row_lot, string vs_in_out, ref double rdb_qty_sku, double rdb_round_diff)
protected function long f_get_ds_matching (ref t_ds_db rds_matching, datawindow vdw_handled, long vl_row, boolean vb_f_matching, t_transaction vt_transaction)
public function decimal f_get_pur_price (double vdb_pur_rtn_line_id, t_transaction vt_transaction)
public function integer f_find_trans_setup_account_cr (t_ds_db vds_trans_setup, string vs_posting_type, double vdb_dr_object_id, double vdb_cr_object_id, any va_cr_criteria_data, string vs_cr_coltype, ref s_str_post_account rstr_post_account, ref string vs_dr_obj_type, ref string vs_cr_obj_type, double vdb_cr_post_group)
public function integer f_find_trans_setup_account_dr (t_ds_db vds_trans_setup, string vs_posting_type, double vdb_dr_object_id, double vdb_cr_object_id, any va_dr_criteria_data, string vs_dr_coltype, ref s_str_post_account rstr_post_account, ref string vs_dr_obj_type, ref string vs_cr_obj_type, double vdb_dr_post_group)
public function boolean f_is_matched_from (t_dw_mpl vdw_check, string vs_from_table)
public function decimal f_get_return_unit_cogs (double vdb_sal_rtn_line_id)
public function boolean f_check_in_serial (t_dw_mpl rpo_dw, t_dw_mpl rdw_master, string vs_editdata)
public function integer f_get_dw_4upd_item_balance (ref t_dw_mpl rdw_item, ref t_dw_mpl rdw_f_object, ref t_dw_mpl rdw_t_object, ref t_dw_mpl rdw_item_value, ref t_dw_mpl rdw_item_lot, ref string ras_f_col_object[], ref string ras_t_col_object[], ref string ras_col_item[], ref string ras_col_item_value[], ref string ras_col_item_lot[])
public function integer f_insert_item_balance (ref t_transaction rt_transaction, date vd_trans_date, string vs_post_type, string vs_qty_yn, string vs_value_yn)
public function date f_get_payment_based_date (string vs_dwo, string vs_payment_term_column)
public function integer f_get_doc_version (t_dw_mpl vdw_main)
public function integer f_get_allocation_info (ref string ras_allocation_info[])
public function string f_get_doc_type (t_dw_mpl vdw_main)
public function integer f_delete_matching_chage_line (datawindow vdw_deleting, long vl_del_row)
public function double f_get_idb_trans_id ()
public function integer f_get_invoice_sign_code (double vdb_object_id, ref string rs_invoice_sign, ref string rs_invoice_code)
public function integer f_check_must_booked_data (t_dw_mpl vdw_handle, string vsa_colname[])
public function string f_get_doc_status (double vdb_doc_id)
public function boolean f_is_booked (double vdb_doc_id)
public function integer f_round (ref datawindow rpo_dw, long vl_currentrow, string vs_colname, string vs_editdata)
public subroutine f_get_amount_matching (double vdb_id, string vs_table, string vs_colname[], ref decimal rdc_amount[])
public function double f_get_so_doc_id (string vs_t_ref_table, double vdb_t_doc_id)
public function double f_get_po_doc_id (string vs_t_ref_table, double vdb_t_doc_id)
public function string f_get_ref_table (double vdb_doc_id)
public function string f_get_doc_type (double vdb_doc_id)
public function boolean f_is_full_qty_matching (double vdb_f_doc_id)
public function integer f_update_table (double vdb_update_id, string vs_update_table, string vs_update_colname, string vs_update_data, t_transaction vt_transaction)
public function integer f_update_related_doc_status (string vs_upd_doc_type, double vdb_t_doc_id, string vs_cur_doc_type, t_transaction vt_transaction)
public function string f_get_update_doc_id (double vdb_f_doc_id, double vdb_t_doc_id, string vs_cur_doc_type)
public function integer f_get_trans_setup_account (t_ds_db vds_trans_setup, string vs_posting_type, t_dw_mpl vdw_get_amount, long vl_get_amount_row, ref s_str_post_account rstr_post_account)
public function long f_find_trans_setup_row_object (t_ds_db vds_trans_setup, ref long rl_trans_row, ref double rdb_object_id, ref string rs_object_type, string vs_posting_type, t_dw_mpl vdw_get_amount, long vl_get_amount_row, string vs_findstring1, string vs_dr_cr)
public function boolean f_is_period_closed (date vd_trans_date, string vs_trans_type)
public function long f_find_trans_setup_row_object_dr (t_ds_db vds_trans_setup, ref long rl_trans_row, ref double rdb_object_id, double rdb_subaccount, ref string rs_object_type, string vs_posting_type, t_dw_mpl vdw_get_amount, long vl_get_amount_row, string vs_findstring1)
public function integer f_get_object_and_subaccount (string vs_dw_object, string vs_object_col, t_dw_mpl vdw_get_amount, long vl_get_amount_row, ref double rdb_object_id, ref double rdb_subaccount)
public function long f_find_trans_setup_account_dr (t_ds_db vds_trans_setup, string vs_posting_type, t_dw_mpl vdw_get_amount, long vl_get_amount_row, string vs_findstr1, ref s_str_post_account rstr_post_account, ref long rl_trans_setup_row)
public function long f_find_trans_setup_row_object_cr (t_ds_db vds_trans_setup, ref long rl_trans_row, ref double rdb_object_id, double rdb_subaccount, ref string rs_object_type, string vs_posting_type, t_dw_mpl vdw_get_amount, long vl_get_amount_row, string vs_findstring1)
public function integer f_find_trans_setup_account_cr (t_ds_db vds_trans_setup, string vs_posting_type, t_dw_mpl vdw_get_amount, long vl_get_amount_row, string vs_findstr1, ref s_str_post_account rstr_post_account, ref long rl_trans_setup_row)
public function integer f_insert_streamvalue (string vs_qty_yn, string vs_value_yn)
public function integer f_postinsert_streamvalue (ref t_ds_db rds_stream, long vl_row, string vs_value_yn, string vs_qty_yn, string vs_item_ref_table, double vdb_item_ref_id, string vs_doc_ref_type, double vdb_doc_ref_id, date vd_trans_date)
public function integer f_update_streamvalue (t_dw_mpl vdw_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row, t_dw_mpl vdw_f_object, string vas_f_object_col[], string vas_f_object_col_sv[], t_dw_mpl vdw_t_object, string vas_t_object_col[], string vas_t_object_col_sv[])
public function integer f_doc_filter (string vs_dwo_filter, boolean vb_doc_filter_yn)
public function boolean f_is_related_doc_booked (double vdb_related_doc_id)
public function integer f_get_t_doc_id (double vdb_f_doc_id, ref double radb_t_doc_id[])
public function integer f_booking (double vdb_doc_id, string vs_doctype, string vs_qty_yn, string vs_value_yn, double vadb_related_doc_id[], ref t_transaction rt_transaction)
public function integer f_booking_item (ref t_transaction rt_transaction, date vd_trans_date, string vs_post_type, string vs_qty_yn, string vs_value_yn, double vadb_related_doc_id[])
public function integer f_get_dw_of_streamvalue (ref t_dw_mpl rdw_item, ref t_dw_mpl rdw_f_object, ref t_dw_mpl rdw_t_object, ref t_dw_mpl rdw_item_value, ref t_dw_mpl rdw_item_lot, ref t_dw_mpl rdw_currency, integer vi_idx)
public function integer f_get_dwcol_of_streamvalue (ref string ras_col_f_object[], ref string ras_col_f_object_sv[], ref string ras_col_t_object[], ref string ras_col_t_object_sv[], ref string ras_col_item[], ref string ras_col_item_sv[], ref string ras_col_item_value[], ref string ras_col_item_value_sv[], ref string ras_col_item_lot[], ref string ras_col_item_lot_sv[], ref string ras_col_currency[], ref string ras_col_currency_sv[], integer vi_idx)
public function integer f_get_item_columns_of_streamvalue (string vs_item_dwo, ref string ras_col_item[])
public function decimal f_get_remain_qty_matching_1 (double vdb_f_doc_id)
public function double f_get_return_price (double vdb_line_id, string vs_col_get_price, string vs_col_get_qty, string vs_dwo_get_price)
public function integer f_insert_matching (powerobject vpo_f_copy, powerobject vpo_t_copy, string vas_match_col[], string vas_match_f_col[], string vs_match_type, double vdb_doc_f_id, double vdb_doc_t_id, ref t_ds_db rds_matching, datetime vdt_match_date, long vl_f_row, long vl_t_row)
public function double f_get_doc_id (double vdb_detail_id, string vs_detail_table)
public function integer f_update_matching (datawindow vdw_modifing, long vl_row_editing, dwbuffer v_dwbuffer)
public function integer f_booking_sob (double vdb_doc_id, double vdb_trans_hdr_id, string vs_doctype)
public function integer f_insert_object_balance (double vdb_doc_id, date vd_trans_date, ref t_transaction rt_transaction, t_ds_db rds_obj_balance_post, string vs_post_unpost, string vs_sob)
public function integer f_insert_exrate_post_line (ref t_ds_db rds_post_line, s_str_post_account vstr_post_account, double vdb_diff_amount, double vdb_settle_currency, double vdb_exrate, date vd_trans_date, double vdb_doc_id, double vdb_object_ref_id, string vs_object_ref_table)
public function integer f_get_f_doc_id (double vdb_t_doc_id, ref double radb_f_doc_id[])
public function integer f_post_tax (double vdb_trans_hdr_id, double vdb_master_id, string vs_dw_binding)
public subroutine f_retrieve_dw_post_line ()
public function boolean f_check_id_exists_table (double vdb_id, string vs_table)
public function double f_get_assemble_doc_id (string vs_t_ref_table, double vdb_t_doc_id)
public function double f_get_values_settle (double vdb_f_doc_id, string vs_col_matching)
public function integer f_update_streamvalue (t_dw_mpl vdw_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row, t_dw_mpl vdw_f_object, string vas_f_object_col[], string vas_f_object_col_sv[], t_dw_mpl vdw_t_object, string vas_t_object_col[], string vas_t_object_col_sv[], t_dw_mpl vdw_currency, string vas_cur_col[], string vas_cur_col_sv[], double vdb_trans_value, double vdb_base_value)
public function integer f_booking_item_lot (ref t_transaction rt_transaction, ref t_ds_db rds_stream, t_dw_mpl vdw_item, long vl_item_row, ref powerobject rpo_item_lot, any vaa_data[], date vd_trans_date, string vs_lot_yn, string vs_serial_yn, string vs_qty_yn, string vs_value_yn, string vs_post_type, double vdb_item_value, double vdb_item_base_value, double vdb_item_qty, t_dw_mpl vdw_f_object, t_dw_mpl vdw_t_object, string vas_col_item[], string vas_col_item_lot[], string vas_col_item_value[], string vas_col_f_object[], string vas_col_t_object[], double vdb_trans_uom, string vas_col_f_object_sv[], string vas_col_t_object_sv[], string vas_col_item_sv[], string vas_col_item_lot_sv[], string vas_col_item_value_sv[], string vs_item_ref_table, string vs_samecol_string, string vs_doc_type, double vdb_dwitem_id, double vdb_doc_id, t_dw_mpl vdw_currency, string vas_col_currency[], string vas_col_currency_sv[])
public function integer f_set_qty_sku (ref t_transaction rt_transaction, ref powerobject rpo_item, double vdb_row, double vdb_item_id, double vdb_trans_uom, string vs_qty_column, string vs_in_out, ref double rdb_qty_sku, ref double rdb_round_diff)
public function integer f_get_round_diff (ref t_transaction rt_transaction, ref powerobject rpo_item, double vdb_row, double vdb_item_id, double vdb_trans_uom, string vs_qty_column, ref double rdb_round_diff)
public function integer f_update_streamvalue (powerobject vpo_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row)
public function integer f_create_exrate_post_line (t_ds_db vds_f_post_line, double vdb_trans_amount, double vdb_base_amount, double vdb_settle_curr, double vdb_settle_exrate, date vd_trans_date, double vdb_doc_id, double vdb_object_ref_id, string vs_object_ref_table, s_str_post_account vstr_post_account, ref t_ds_db rds_post_line)
public function string f_get_previous_doc_status (string vs_doc_type, string vs_doc_status)
public function integer f_create_post_line (double vdb_doc_id, double vdb_branch_id, double vdb_trans_hdr_id, ref t_ds_db rds_post_line)
public function integer f_insert_post_line (ref t_ds_db rds_post_line, double vdb_doc_id, double vdb_branch_id, t_ds_db vds_trans_setup, t_dw_mpl vdw_get_amount, string vs_posting_type[], double vdb_currency_id, decimal vdc_exrate)
public function integer f_add_link_item_catch (double vdb_item_id, double vdb_qty, string ls_item_id, string ls_item_code, string ls_item_name, t_dw_mpl rdw_object)
public function string f_get_trans_id_4copy ()
private function integer f_update_allobject_openclose_value (ref t_ds_db rds_allobject_balance, t_ds_db vds_allobject_balance_after, ref t_transaction rt_transaction)
public function integer f_update_object_balance (string vs_sob, double vdb_branch_id, double vdb_object_id, string vs_object_type, double vdb_currency_id, double vdb_account_id, double vdb_subaccount, string vs_not_accept, double vdc_close_amt, double vdc_close_base_amt, ref t_transaction rt_transaction, string vs_balance_control, date vd_trans_date, date vd_max_date, ref t_ds_db rds_object_balance_after)
public function integer f_insert_item_balance (ref t_ds_db rds_item_balance, any vaa_arg[], date vd_balance_date, string vs_in_out, double vdb_in_out_qty, double vdb_in_out_base_value, double vdb_open_qty, double vdb_open_value, double vdb_close_qty, double vdb_close_value)
private function integer f_update_item_balance_all (ref t_transaction rt_transaction, any vaa_arg[], date vd_balance_date)
public function integer f_get_doc_info (double vdb_doc_id, ref string rs_doctype, ref date rd_bookeddate, ref string rs_status, ref string rs_doc_code)
public function integer f_update_related_status (double vdb_doc_id, string vs_doctype, string vs_post_status, boolean vb_post, ref string rs_doc_id_updated)
public function double f_get_values_matched_from (string vs_dwo_matched_f, string vs_col_matched_f, double vdb_f_ref_id, double vdb_doc_id)
public function integer f_get_values_matching_and_return (double vdb_f_ref_id, string vs_ref_table_return, ref double rdb_values_matching, ref double rdb_values_rtn, string vs_col_matching, double vdb_doc_id, string vs_t_ref_table, string vs_ref_table_minus)
public function integer f_get_remain_and_matched_value (t_dw_mpl vdw_f_matching, string vs_dwo_match_to, string vas_dwo_return[], string vs_f_match_column, string vs_match_column, ref double rdb_total_remain, ref double rdb_total_matched, long vl_row, double vdb_doc_id, string vs_dwo_matched_f, string vs_col_matched_f, string vas_dwo_minus[])
public function integer f_get_remain_and_matched_value (t_dw_mpl vdw_handling, string vs_dwo_match_from, string vs_dwo_match_to, string vas_dwo_return[], string vs_f_match_column, string vs_match_column, ref double rdb_remain_value[], ref double rdb_matched_value[], ref double rdb_f_ref_id[], ref double rdb_total_remain, ref double rdb_total_matched, long vl_row, ref double rdb_matching, double vdb_doc_id, string vs_dwo_matched_f, string vs_col_matched_f, string vas_dwo_minus[])
public function integer f_get_values_matching_and_return (double vdb_f_ref_id, string vs_ref_table_return, ref double rdb_values_matching, ref double rdb_values_rtn, string vs_col_matching, double vdb_doc_id, string vs_t_ref_table)
public function integer f_set_dw_tax_transfer (ref t_dw_mpl rdw_ledger_transfer_line, t_dw_mpl dw_master)
public function integer f_set_dw_ledger_transfer_line (ref t_dw_mpl rdw_ledger_transfer_line, t_dw_mpl vdw_master, string vs_transfer_type)
public function integer f_set_dw_profit_transfer (ref t_dw_mpl rdw_ledger_transfer_line, t_dw_mpl vdw_master)
public function integer f_insert_loyalty_trans (double vdb_object_id, string vs_doctype, double vdb_doc_id)
public function integer f_insert_measurement_balance (double vdb_doc_id, date vd_trans_date, ref t_transaction rt_transaction, t_ds_db vds_obj_balance_post, string vs_post_unpost, string vs_sob)
public function string f_get_object_code (long vl_object_id)
public function integer f_insert_post_line (double vdb_doc_id, double vdb_branch_id, t_ds_db vds_trans_setup, t_dw_mpl vdw_get_amount, string vs_posting_type[], double vdb_currency_id, decimal vdc_exrate)
public function integer f_create_post_line (double vdb_doc_id, double vdb_branch_id, double vdb_trans_hdr_id)
public function integer f_get_posting_type_account (t_ds_db vds_trans_setup, string vs_dwo_get_amount, string vs_posting_type, ref s_str_post_account rstr_post_acct_spec[], ref s_str_post_account rstr_post_acct_group[], ref s_str_post_account rstr_post_acct_all[], ref s_str_post_info rstr_post_info)
public function integer f_insert_post_line (double vdb_doc_id, double vdb_branch_id, t_dw_mpl vdw_get_amount, double vdb_currency_id, double vdc_exrate, s_str_post_account vstr_spec_acct[], s_str_post_account vstr_grp_acct[], s_str_post_account vstr_all_acct[], s_str_post_info vstr_post_info)
public function integer f_create_post_line (double vdb_doc_id, double vdb_branch_id, double vdb_trans_hdr_id, string vs_new)
public function integer f_get_trans_setup_account (double vdb_dr_object, double vdb_cr_object, string vs_condition_val, string vs_condition_coltype, s_str_post_account vstr_post_account_spec[], s_str_post_account vstr_post_account_grp[], s_str_post_account vstr_post_account_all[], s_str_post_info vstr_post_info, ref s_str_post_account rstr_post_account)
public function integer f_create_ds_4_posting (t_dw_mpl vdw_main, ref s_str_ds_4_posting rstr_ds_4_posting)
protected function integer f_get_posting_trans_text_multi (double vdb_doc_version, s_str_post_info vstr_post_info, t_ds_db vds_get_amount, long vl_handle_row, ref string rs_trans_text_dw, ref t_transaction rt_transaction, ref s_str_ds_4_posting rstr_ds_4_posting)
protected function integer f_get_posting_condition_multi (double vdb_doc_version, s_str_post_info vstr_post_info, t_ds_db vds_get_amount, long vl_handle_row, ref string rs_condition_val, ref string rs_condition_coltype, ref t_transaction rt_transaction, ref s_str_ds_4_posting rstr_ds_4_posting)
public function integer f_get_ds_of_streamvalue (double vdb_doc_version, ref t_ds_db rdw_item, ref t_ds_db rdw_f_object, ref t_ds_db rdw_t_object, ref t_ds_db rdw_item_value, ref t_ds_db rdw_item_lot, ref t_ds_db rdw_currency, integer vi_idx, ref s_str_ds_4_posting rstr_ds_4_posting, ref t_transaction rt_transaction)
public function integer f_update_streamvalue_multi (t_ds_db vdw_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row, t_ds_db vdw_f_object, string vas_f_object_col[], string vas_f_object_col_sv[], t_ds_db vdw_t_object, string vas_t_object_col[], string vas_t_object_col_sv[], ref s_str_ds_4_posting rstr_ds_4_posting)
public function integer f_update_streamvalue_multi (t_ds_db vdw_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row, t_ds_db vdw_f_object, string vas_f_object_col[], string vas_f_object_col_sv[], t_ds_db vdw_t_object, string vas_t_object_col[], string vas_t_object_col_sv[], t_ds_db vdw_currency, string vas_cur_col[], string vas_cur_col_sv[], double vdb_trans_value, double vdb_base_value, ref s_str_ds_4_posting rstr_ds_4_posting)
public function integer f_update_streamvalue_multi (t_ds_db vpo_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row)
public function integer f_booking_item_lot_multi (ref t_transaction rt_transaction, ref t_ds_db rds_stream, t_ds_db vdw_item, long vl_item_row, ref t_ds_db rpo_item_lot, any vaa_data[], date vd_trans_date, string vs_lot_yn, string vs_serial_yn, string vs_qty_yn, string vs_value_yn, string vs_post_type, double vdb_item_value, double vdb_item_base_value, double vdb_item_qty, t_ds_db vdw_f_object, t_ds_db vdw_t_object, string vas_col_item[], string vas_col_item_lot[], string vas_col_item_value[], string vas_col_f_object[], string vas_col_t_object[], double vdb_trans_uom, string vas_col_f_object_sv[], string vas_col_t_object_sv[], string vas_col_item_sv[], string vas_col_item_lot_sv[], string vas_col_item_value_sv[], string vs_item_ref_table, string vs_samecol_string, string vs_doc_type, double vdb_dwitem_id, double vdb_doc_id, t_ds_db vdw_currency, string vas_col_currency[], string vas_col_currency_sv[], ref s_str_ds_4_posting rstr_ds_4_posting)
public function integer f_booking_item_multi (double vdb_doc_id, double vdb_doc_version, string vs_doctype, ref t_transaction rt_transaction, date vd_trans_date, string vs_post_type, string vs_qty_yn, string vs_value_yn, double vadb_related_doc_id[], ref s_str_ds_4_posting rstr_ds_4_posting)
public function integer f_booking_multi (double vdb_doc_id, double vdb_doc_version, date vd_trans_date, string vs_doctype, string vs_qty_yn, string vs_value_yn, double vadb_related_doc_id[], ref t_transaction rt_transaction, ref s_str_ds_4_posting rstr_ds_4_posting)
public function integer f_reset_ds_4_posting (ref s_str_ds_4_posting rstr_ds_4_posting)
public function integer f_update_related_status_multi (double vdb_doc_id, string vs_doctype, string vs_post_status, boolean vb_post, ref string rs_doc_id_updated, ref t_transaction rt_transaction)
public function integer f_insert_post_line_multi (double vdb_doc_id, date vd_trans_date, double vdb_doc_version, double vdb_branch_id, t_ds_db vds_get_amount, double vdb_currency_id, double vdc_exrate, s_str_post_account vstr_spec_acct[], s_str_post_account vstr_grp_acct[], s_str_post_account vstr_all_acct[], s_str_post_info vstr_post_info, ref s_str_ds_4_posting vstr_ds_4_posting, ref t_transaction rt_transaction)
public function integer f_create_post_line_multi (double vdb_doc_id, date vd_trans_date, double vdb_doc_version, double vdb_branch_id, double vdb_trans_hdr_id, ref s_str_ds_4_posting vstr_ds_4_posting, ref t_transaction rt_transaction)
protected function integer f_get_posting_object (s_str_post_account vstr_post_account, t_dw_mpl vdw_get_amount, long vl_handle_row, ref double rdb_dr_object_id, ref double rdb_cr_object_id, ref t_transaction rt_transaction, ref double rdb_dr_subacct_id, ref double rdb_cr_subacct_id)
protected function integer f_get_posting_object (s_str_post_info vstr_post_info, t_dw_mpl vdw_get_amount, long vl_handle_row, ref double rdb_dr_object_id, ref double rdb_cr_object_id, ref t_transaction rt_transaction, ref double rdb_dr_subacct_id, ref double rdb_cr_subacct_id)
protected function integer f_get_posting_object_multi (double vdb_doc_version, s_str_post_info vstr_post_info, t_ds_db vds_get_amount, long vl_handle_row, ref double rdb_dr_object_id, ref double rdb_cr_object_id, ref t_transaction rt_transaction, ref s_str_ds_4_posting rstr_ds_4_posting, ref double rdb_dr_subacct_id, ref double rdb_cr_subacct_id)
public function integer f_insert_item_balance_row (ref t_transaction rt_transaction, ref powerobject rpo_item, ref long vl_item_row, t_dw_mpl rdw_f_object, t_dw_mpl rdw_t_object, date vd_trans_date, string vs_post_type, string vas_col_item[], string vas_col_item_value[], string vas_f_col_object[], string vas_t_col_object[], any vaa_data[], string vs_qty_yn, string vs_value_yn, double vdb_trans_uom, string vs_qty_column, double vdb_value, string vs_trans_qty_yn, string vs_trans_val_yn)
public function integer f_insert_item_balance_row_multi (ref t_transaction rt_transaction, ref t_ds_db rds_item, ref long rl_item_row, t_ds_db vds_f_object, t_ds_db vds_t_object, date vd_trans_date, string vs_post_type, string vas_col_item[], string vas_col_item_value[], string vas_f_col_object[], string vas_t_col_object[], any vaa_data[], string vs_qty_yn, string vs_value_yn, double vdb_trans_uom, string vs_qty_column, double vdb_value, ref s_str_ds_4_posting rstr_ds_4_posting, string vs_trans_qty_yn, string vs_trans_val_yn)
public function integer f_b4_post_tax ()
public function integer f_update_tax_after_copy (string vs_dw_binding, double vdb_master_id)
public function integer f_update_streamvalue_multi_ex (t_ds_db vdw_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row, t_ds_db vdw_f_object, string vas_f_object_col[], string vas_f_object_col_sv[], t_ds_db vdw_t_object, string vas_t_object_col[], string vas_t_object_col_sv[], ref s_str_ds_4_posting rstr_ds_4_posting, s_str_data vstr_data_from_to)
public function integer f_update_streamvalue_multi_ex (t_ds_db vdw_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row, t_ds_db vdw_f_object, string vas_f_object_col[], string vas_f_object_col_sv[], t_ds_db vdw_t_object, string vas_t_object_col[], string vas_t_object_col_sv[], t_ds_db vdw_currency, string vas_cur_col[], string vas_cur_col_sv[], double vdb_trans_value, double vdb_base_value, ref s_str_ds_4_posting rstr_ds_4_posting, s_str_data vstr_data_from_to)
public function integer f_update_streamvalue_ex (t_dw_mpl vdw_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row, t_dw_mpl vdw_f_object, string vas_f_object_col[], string vas_f_object_col_sv[], t_dw_mpl vdw_t_object, string vas_t_object_col[], string vas_t_object_col_sv[], t_dw_mpl vdw_currency, string vas_cur_col[], string vas_cur_col_sv[], double vdb_trans_value, double vdb_base_value, s_str_data vstr_data_from_to)
public function integer f_update_streamvalue_ex (t_dw_mpl vdw_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row, t_dw_mpl vdw_f_object, string vas_f_object_col[], string vas_f_object_col_sv[], t_dw_mpl vdw_t_object, string vas_t_object_col[], string vas_t_object_col_sv[], s_str_data vstr_data_from_to)
public function integer f_get_dw_of_streamvalue_ex (ref t_dw_mpl rdw_item, ref t_dw_mpl rdw_f_object, ref t_dw_mpl rdw_t_object, t_dw_mpl rdw_f_lot, t_dw_mpl rdw_t_lot, ref t_dw_mpl rdw_item_value, ref t_dw_mpl rdw_item_lot, ref t_dw_mpl rdw_currency, integer vi_idx)
public function integer f_get_ds_of_streamvalue_ex (double vdb_doc_version, ref t_ds_db rdw_item, ref t_ds_db rdw_f_object, ref t_ds_db rdw_t_object, ref t_ds_db rdw_f_lot, ref t_ds_db rdw_t_lot, ref t_ds_db rdw_item_value, ref t_ds_db rdw_item_lot, ref t_ds_db rdw_currency, integer vi_idx, ref s_str_ds_4_posting rstr_ds_4_posting, ref t_transaction rt_transaction)
public function integer f_booking_item_multi_ex (double vdb_doc_id, double vdb_doc_version, string vs_doctype, ref t_transaction rt_transaction, date vd_trans_date, string vs_post_type, string vs_qty_yn, string vs_value_yn, double vadb_related_doc_id[], ref s_str_ds_4_posting rstr_ds_4_posting)
public function integer f_booking_item_lot_multi_ex (ref t_transaction rt_transaction, ref t_ds_db rds_stream, t_ds_db vdw_item, long vl_item_row, ref t_ds_db rpo_item_lot, any vaa_data[], date vd_trans_date, string vs_lot_yn, string vs_serial_yn, string vs_qty_yn, string vs_value_yn, string vs_post_type, double vdb_item_value, double vdb_item_base_value, double vdb_item_qty, t_ds_db vdw_f_object, t_ds_db vdw_t_object, string vas_col_item[], string vas_col_item_lot[], string vas_col_item_value[], string vas_col_f_object[], string vas_col_t_object[], double vdb_trans_uom, string vas_col_f_object_sv[], string vas_col_t_object_sv[], string vas_col_item_sv[], string vas_col_item_lot_sv[], string vas_col_item_value_sv[], string vs_item_ref_table, string vs_samecol_string, string vs_doc_type, double vdb_dwitem_id, double vdb_doc_id, t_ds_db vdw_currency, string vas_col_currency[], string vas_col_currency_sv[], ref s_str_ds_4_posting rstr_ds_4_posting)
public function integer f_booking_item_lot_ex (ref t_transaction rt_transaction, ref t_ds_db rds_stream, t_dw_mpl vdw_item, long vl_item_row, ref powerobject rpo_item_lot, any vaa_data[], date vd_trans_date, string vs_lot_yn, string vs_serial_yn, string vs_qty_yn, string vs_value_yn, string vs_post_type, double vdb_item_value, double vdb_item_base_value, double vdb_item_qty, t_dw_mpl vdw_f_object, t_dw_mpl vdw_t_object, string vas_col_item[], string vas_col_item_lot[], string vas_col_item_value[], string vas_col_f_object[], string vas_col_t_object[], double vdb_trans_uom, string vas_col_f_object_sv[], string vas_col_t_object_sv[], string vas_col_item_sv[], string vas_col_item_lot_sv[], string vas_col_item_value_sv[], string vs_item_ref_table, string vs_samecol_string, string vs_doc_type, double vdb_dwitem_id, double vdb_doc_id, t_dw_mpl vdw_currency, string vas_col_currency[], string vas_col_currency_sv[])
public function integer f_booking_item_ex (ref t_transaction rt_transaction, date vd_trans_date, string vs_post_type, string vs_qty_yn, string vs_value_yn, double vadb_related_doc_id[])
public function long f_unbooking_ex (double vdb_doc_id, string vs_qty_yn, string vs_value_yn)
public function integer f_insert_item_balance_row_ex (ref t_transaction rt_transaction, ref powerobject rpo_item, ref long vl_item_row, t_dw_mpl rdw_f_object, t_dw_mpl rdw_t_object, date vd_trans_date, string vs_post_type, string vas_col_item[], string vas_col_item_value[], string vas_f_col_object[], string vas_t_col_object[], any vaa_data[], string vs_qty_yn, string vs_value_yn, double vdb_trans_uom, string vs_qty_column, double vdb_value, string vs_trans_qty_yn, string vs_trans_val_yn, ref s_str_data rstr_data_from_to, double vdb_doc_id, string vs_related_doc_qty_yn)
public function integer f_insert_item_balance_row_multi_ex (ref t_transaction rt_transaction, ref t_ds_db rds_item, ref long rl_item_row, t_ds_db vds_f_object, t_ds_db vds_t_object, date vd_trans_date, string vs_post_type, string vas_col_item[], string vas_col_item_value[], string vas_f_col_object[], string vas_t_col_object[], any vaa_data[], string vs_qty_yn, string vs_value_yn, double vdb_trans_uom, string vs_qty_column, double vdb_value, ref s_str_ds_4_posting rstr_ds_4_posting, string vs_trans_qty_yn, string vs_trans_val_yn, ref s_str_data rstr_data_from_to, double vdb_doc_id, string vs_related_doc_qty_yn)
protected function integer f_get_posting_object_multi (double vdb_doc_version, s_str_post_account vstr_post_info, t_ds_db vds_get_amount, long vl_handle_row, ref double rdb_dr_object_id, ref double rdb_cr_object_id, ref t_transaction rt_transaction, ref s_str_ds_4_posting rstr_ds_4_posting, ref double rdb_dr_subacct_id, ref double rdb_cr_subacct_id)
public function integer f_create_exrate_post_line_ex (double vdb_dr_object_id, double vdb_cr_object_id, t_ds_db vds_f_post_line, double vdb_trans_amount, double vdb_base_amount, double vdb_settle_curr, double vdb_settle_exrate, date vd_trans_date, double vdb_doc_id, double vdb_object_ref_id, string vs_object_ref_table, s_str_post_account vstr_post_account, ref t_ds_db rds_post_line)
public function integer f_insert_exrate_post_line_ex (ref t_ds_db rds_post_line, s_str_post_account vstr_post_account, double vdb_diff_amount, double vdb_settle_currency, double vdb_exrate, date vd_trans_date, double vdb_doc_id, double vdb_object_ref_id, string vs_object_ref_table, double vdb_dr_object_id, double vdb_cr_object_id)
public function integer f_get_dfl_trans_info (string vs_doctype, double vdb_branch_id, ref s_str_data rstr_data, ref t_transaction rt_transaction)
public function string f_get_doc_type_ex (double vdb_doc_id, ref t_transaction rt_transaction)
public function integer f_set_ds_4_posting ()
public function integer f_get_ds_4_posting (ref s_str_ds_4_posting rstr_ds_4_posting)
end prototypes

event type integer e_action_post_multi(t_ds_db vds_main, s_str_ds_4_posting vstr_ds_4_posting, t_transaction vt_transaction);
c_dwservice				lc_dwsr
c_datetime				lc_datet
b_obj_instantiate		lbo_instance
//u_post_line				lc_post_line
t_ds_db					ldsa_details[]

double					ldb_doc_id, ldb_trans_hdr_id, ladb_related_doc_id[],ldb_branch_id, ldb_doc_version
any 						la_data[], la_null[]
string						ls_obj_name,ls_qty_yn,ls_value_yn, ls_respond, ls_doctype, ls_post_message_yn, ls_ts_qty, ls_ts_value
string						ls_dwdetail_string
long 						ll_rtn, ll_currentrow,ll_count,ll_count_p, ll_count_l, ll_count_o,ll_count_it
int							li_cnt, li_idx
date						ld_trans_date,ld_sysdate
boolean					lb_value_posted, lb_qty_posted, lb_create_postline_yn,lb_err


FOR li_idx = 1 to vds_main.rowcount( )
	ldb_doc_id = vds_main.getitemnumber(li_idx, 'id')
	ldb_doc_version =  vds_main.getitemnumber(li_idx, 'version_id')
	ldb_branch_id = vds_main.getitemnumber(li_idx, 'branch_id')
	ldb_trans_hdr_id = vds_main.getitemnumber( li_idx, 'trans_hdr_id')
	ls_doctype = vds_main.getitemstring(li_idx,'doc_type')
	ld_trans_date = date(vds_main.getitemdatetime( li_idx, 'trans_date'))
	ld_sysdate = date(lc_datet.f_getsysdate( ))
	
	if li_idx > 1 then this.f_reset_ds_4_posting( vstr_ds_4_posting)
	
	if ld_trans_date > ld_sysdate then
		if gf_messagebox('m.b_doc.e_action_post_multi.01', 'Thông báo','Ngày ghi sổ ' + string(ld_trans_date) + ' lớn hơn ngày hệ thống '+string(ld_sysdate)+'. @' + ' Bạn có muốn tiếp tục ghi sổ không','question','yesno',2) = 2 then
			return -1
		end if
	end if
		
	if ldb_trans_hdr_id = 0 or isnull(ldb_trans_hdr_id) then		
		gf_messagebox('m.b_doc.e_action_post_multi.02','Thông báo','Chứng từ chưa có giao dịch','exclamation','ok',1)
		return -1
	end if	

	if lc_dwsr.f_get_qty_and_value_yn( ldb_doc_id, ls_qty_yn,ls_value_yn) <> 1 then
		gf_messagebox('m.b_doc.e_action_post_multi.03','Thông báo','Phải lưu chứng từ trước khi ghi sổ','exclamation','ok',1)	
		return -1
	end if
	
	//-- kiểm tra đóng kỳ kế toán --//
	if ls_qty_yn = 'Y' then
		if lbo_instance.f_is_period_closed(  'inventory', ld_trans_date,'normal') then
			gf_messagebox('m.b_doc.e_action_post_multi.04','Thông báo','Đã đóng kỳ kho hoặc chưa tạo kỳ kế toán nên không thể ghi sổ','exclamation','ok',1)
			return -1
		end if
	end if
			
	if ls_value_yn = 'Y' then
		if lbo_instance.f_is_period_closed(  'finance', ld_trans_date,'normal') then
			gf_messagebox('m.b_doc.e_action_post_multi.05','Thông báo','Đã đóng kỳ hoặc chưa tạo kỳ kế toán nên không thể ghi sổ','exclamation','ok',1)
			return -1
		end if		
	end if	
	
	//-- kiểm tra chứng từ đã được ghi sổ bởi user khác --//
	if this.f_is_booked(ldb_doc_id) then
		gf_messagebox('m.b_doc.e_action_post_multi.06','Thông báo','Chứng từ đã được ghi sổ bởi người khác! Vui lòng bấm nút nạp lại dữ liệu','exclamation','ok',1)
		return -1
	end if

	if ls_qty_yn = 'N' and ls_value_yn = 'N' then
		gf_messagebox('m.b_doc.e_action_post_multi.07','Thông báo','Chứng từ chưa chọn ghi sổ giá trị hoặc số lượng','exclamation','ok',1)		
		return	 -1
	end if

	
	//-- Kiểm tra tick chọn ghi sổ giá trị và sl có trùng với cài đặt ghi sổ hay không? --//
	if lbo_instance.f_get_qty_and_value_yn(ldb_trans_hdr_id, ls_ts_qty, ls_ts_value) = -1 then 
		gf_messagebox('m.b_doc.e_action_post_multi.08','Thông báo','Cài đặt giao dịch bị lỗi ','stop','ok',1)
		return -1
	end if
	//-- Ghi sổ giá trị --//
	if ls_ts_value <> ls_value_yn then
		gf_messagebox('m.b_doc.e_action_post_multi.09','Thông báo','Ghi sổ GIÁ TRỊ không đúng với cài đặt giao dịch! Cần chọn giao dịch khác, hoặc thay đổi cài đặt','stop','ok',1) 	
		return -1
	end if
	//-- Ghi sổ số lượng --//
	if ls_ts_qty <> ls_qty_yn then
		gf_messagebox('m.b_doc.e_action_post_multi.10','Thông báo','Ghi sổ SỐ LƯỢNG không đúng với cài đặt giao dịch! Cần chọn giao dịch khác, hoặc thay đổi cài đặt','stop','ok',1) 
		return -1
	end if
		
	//-- thông báo đến đối tượng truoc khi tạo tài khoản --//
	if this.event e_window( 'e_prepost') = -1 then
		Rollback using vt_transaction;	
		return -1
	end if	
	
	//-- Tạo tài khoản định khoản --//
	if ls_value_yn ='Y' then		
		select count(id) into :li_cnt from post_line where doc_id =:ldb_doc_id using sqlca;		
		if li_cnt = 0 then
			//-- Tạo tài khoản ghi sổ: post ghi sổ --//
			this.event e_widnow_e_preaccounting()
			
			if this.f_create_post_line_multi(ldb_doc_id,ld_trans_date, ldb_doc_version, ldb_branch_id, ldb_trans_hdr_id, vstr_ds_4_posting, vt_transaction) = -1 then
			
				rollback using vt_transaction;
				return -1
			else
				commit using vt_transaction;
			end if
		end if
		
		this.event e_widnow_e_postaccounting()
		//-- KT có mở form xem định khoản không --//
			ls_respond = 'booked'

		
		//-- Ghi sổ giá trị --//
		if ls_respond = 'booked' then	
			setpointer(hourglass!)
			
			if this.f_booking_multi( ldb_doc_id,ldb_doc_version, ld_trans_date, ls_doctype, ls_qty_yn,ls_value_yn, ladb_related_doc_id[], vt_transaction, vstr_ds_4_posting) = -1 then 			
				return -1
			end if
			lb_value_posted = true
		else
			return -1
		end if		
	end if
	
	//-- Ghi sổ số lượng --//
	if (ls_qty_yn = 'Y' and ls_value_yn = 'N')  then//Nếu không ghi sổ kế toán mà có ghi sổ số lượng thì thực hiện ghi sổ số lượng luôn
		//Chèn ghi sổ kho

	//-- cập nhật item_balance --//		
		if this.f_booking_item_multi(ldb_doc_id, ldb_doc_version, ls_doctype, vt_transaction, ld_trans_date, 'post', ls_qty_yn,ls_value_yn,  ladb_related_doc_id[], vstr_ds_4_posting) = -1 then
			return -1
		end if
		lb_qty_posted = true
	end if	
		
	//-- thông báo đến đối tượng sau khi post --//
	if this.event e_window( 'e_post') = -1 then
		Rollback using vt_transaction;			
		return -1
	end if

	//Cập nhật trạng thái và sob ghi sổ
	if lb_qty_posted or lb_value_posted then
		//-- kiểm tra xem bảng trans có ghi sổ chưa --// 
		if ls_value_yn ='Y' then
			select count(doc_id) into :ll_count_p from post_line
			where doc_id = :ldb_doc_id using vt_transaction;
			
			select count(doc_ref_id) into :ll_count_l from ledger_trans
			where doc_ref_id = :ldb_doc_id using vt_transaction;
			
			select count(doc_ref_id) into :ll_count_o from object_trans
			where doc_ref_id = :ldb_doc_id using vt_transaction;
			if ls_doctype = 'GOODS_TRANSFER'  or ls_doctype = 'ASSEMBLE' then //or ls_doctype = 'GOODS_RECEIPT_MISC' or ls_doctype = 'GOODS_DELIVERY_MISC'
				if ll_count_p = 0 or ll_count_l = 0 then lb_err = true
			elseif ls_doctype = 'GOODS_RECEIPT_MISC' or ls_doctype = 'GOODS_DELIVERY_MISC' then
					//--  ?????? --//
			else
				if ll_count_p = 0 or  ll_count_l = 0 or (ll_count_o = 0 and ls_doctype <> 'PROD_ORDERS') then lb_err = true
			end if 
			if lb_err then
				gf_messagebox('m.b_doc.e_action_post_multi.13','Thông báo',' Chứng từ đã ghi sổ nhưng không cập nhật tiền giao dịch. Ghi sổ lại và liên hệ người quản trị' ,'stop','ok',1)		
				Rollback using vt_transaction;
				return -1
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
            			AND STR.DOC_REF_ID = :ldb_doc_id USING vt_transaction;
			
			if ll_count_it > 0 then
				gf_messagebox('m.b_doc.e_action_post_multi.14','Thông báo',' Chứng từ đã ghi sổ nhưng không cập nhật số lượng. Ghi sổ lại' ,'stop','ok',1)		
				Rollback using vt_transaction;
				return -1
			end if
		end if
		vds_main.setitem(li_idx, 'status', 'booked')
		vds_main.setitem(li_idx, 'sob', gs_sob)
		ll_rtn = vds_main.update(true,false )
		if ll_rtn = 1 then	
			vds_main.resetupdate( )
			//-- Cập nhật trạng thái chứng từ liện quan --//
			if this.event e_statuschanged_multi( 'booked', ldb_doc_id, ls_doctype, true, vt_transaction) = -1 then
				Rollback using vt_transaction;
				return -1
			end if
			
			//-- thông báo đến đối tượng sau khi cập nhật trạng thái --//
			if this.event e_window( 'e_afterpost') = -1 then
				Rollback using vt_transaction;		
				return -1
			end if		
			commit using vt_transaction;					
		else							
			gf_messagebox('m.b_doc.e_action_post_multi.15','Thông báo','Không cập nhật được trạng thái ghi sổ:@'+vt_transaction.sqlerrtext ,'stop','ok',1)			
			Rollback using vt_transaction;			
			return -1
		end if
	end if
NEXT
return 1
end event

event type integer e_action_post_multi_ex(t_ds_db vds_main, s_str_ds_4_posting vstr_ds_4_posting, t_transaction vt_transaction);
c_dwservice				lc_dwsr
c_datetime				lc_datet
b_obj_instantiate		lbo_instance
//u_post_line				lc_post_line
t_ds_db					ldsa_details[]

double					ldb_doc_id, ldb_trans_hdr_id, ladb_related_doc_id[],ldb_branch_id, ldb_doc_version
any 						la_data[], la_null[]
string						ls_obj_name,ls_qty_yn,ls_value_yn, ls_respond, ls_doctype, ls_post_message_yn, ls_ts_qty, ls_ts_value
string						ls_dwdetail_string
long 						ll_rtn, ll_currentrow,ll_count,ll_count_p, ll_count_l, ll_count_o,ll_count_it
int							li_cnt, li_idx
date						ld_trans_date,ld_sysdate
boolean					lb_value_posted, lb_qty_posted, lb_create_postline_yn,lb_err


FOR li_idx = 1 to vds_main.rowcount( )
	ldb_doc_id = vds_main.getitemnumber(li_idx, 'id')
	ldb_doc_version =  vds_main.getitemnumber(li_idx, 'version_id')
	ldb_branch_id = vds_main.getitemnumber(li_idx, 'branch_id')
	ldb_trans_hdr_id = vds_main.getitemnumber( li_idx, 'trans_hdr_id')
	ls_doctype = vds_main.getitemstring(li_idx,'doc_type')
	ld_trans_date = date(vds_main.getitemdatetime( li_idx, 'trans_date'))
	ld_sysdate = date(lc_datet.f_getsysdate( ))
//	//-- Minh trí: ngày ghi sổ là ngày hệ thống --//
//	ld_trans_date = ld_sysdate
	///////////////////////////////////////////////
	if li_idx > 1 then this.f_reset_ds_4_posting( vstr_ds_4_posting)
	
	if ld_trans_date > ld_sysdate then
		if gf_messagebox('m.b_doc.e_action_post_multi.01', 'Thông báo','Ngày ghi sổ ' + string(ld_trans_date) + ' lớn hơn ngày hệ thống '+string(ld_sysdate)+'. @' + ' Bạn có muốn tiếp tục ghi sổ không','question','yesno',2) = 2 then
			return -1
		end if
	end if
		
	if ldb_trans_hdr_id = 0 or isnull(ldb_trans_hdr_id) then		
		gf_messagebox('m.b_doc.e_action_post_multi.02','Thông báo','Chứng từ chưa có giao dịch','exclamation','ok',1)
		return -1
	end if	

	if lc_dwsr.f_get_qty_and_value_yn( ldb_doc_id, ls_qty_yn,ls_value_yn) <> 1 then
		gf_messagebox('m.b_doc.e_action_post_multi.03','Thông báo','Phải lưu chứng từ trước khi ghi sổ','exclamation','ok',1)	
		return -1
	end if
	
	//-- kiểm tra đóng kỳ kế toán --//
	if ls_qty_yn = 'Y' then
		if lbo_instance.f_is_period_closed(  'inventory', ld_trans_date,'normal') then
			gf_messagebox('m.b_doc.e_action_post_multi.04','Thông báo','Đã đóng kỳ kho hoặc chưa tạo kỳ kế toán nên không thể ghi sổ','exclamation','ok',1)
			return -1
		end if
	end if
			
	if ls_value_yn = 'Y' then
		if lbo_instance.f_is_period_closed(  'finance', ld_trans_date,'normal') then
			gf_messagebox('m.b_doc.e_action_post_multi.05','Thông báo','Đã đóng kỳ hoặc chưa tạo kỳ kế toán nên không thể ghi sổ','exclamation','ok',1)
			return -1
		end if		
	end if	
	
	//-- kiểm tra chứng từ đã được ghi sổ bởi user khác --//
	if this.f_is_booked(ldb_doc_id) then
		gf_messagebox('m.b_doc.e_action_post_multi.06','Thông báo','Chứng từ đã được ghi sổ bởi người khác! Vui lòng bấm nút nạp lại dữ liệu','exclamation','ok',1)
		return -1
	end if

	if ls_qty_yn = 'N' and ls_value_yn = 'N' then
		gf_messagebox('m.b_doc.e_action_post_multi.07','Thông báo','Chứng từ chưa chọn ghi sổ giá trị hoặc số lượng','exclamation','ok',1)		
		return	 -1
	end if

	
	//-- Kiểm tra tick chọn ghi sổ giá trị và sl có trùng với cài đặt ghi sổ hay không? --//
	if lbo_instance.f_get_qty_and_value_yn(ldb_trans_hdr_id, ls_ts_qty, ls_ts_value) = -1 then 
		gf_messagebox('m.b_doc.e_action_post_multi.08','Thông báo','Cài đặt giao dịch bị lỗi ','stop','ok',1)
		return -1
	end if
	//-- Ghi sổ giá trị --//
	if ls_ts_value <> ls_value_yn then
		gf_messagebox('m.b_doc.e_action_post_multi.09','Thông báo','Ghi sổ GIÁ TRỊ không đúng với cài đặt giao dịch! Cần chọn giao dịch khác, hoặc thay đổi cài đặt','stop','ok',1) 	
		return -1
	end if
	//-- Ghi sổ số lượng --//
	if ls_ts_qty <> ls_qty_yn then
		gf_messagebox('m.b_doc.e_action_post_multi.10','Thông báo','Ghi sổ SỐ LƯỢNG không đúng với cài đặt giao dịch! Cần chọn giao dịch khác, hoặc thay đổi cài đặt','stop','ok',1) 
		return -1
	end if
		
	//-- thông báo đến đối tượng truoc khi tạo tài khoản --//
	if this.event e_window( 'e_prepost') = -1 then
		Rollback using vt_transaction;	
		return -1
	end if	
	
	//-- Tạo tài khoản định khoản --//
	if ls_value_yn ='Y' then		
		select count(id) into :li_cnt from post_line where doc_id =:ldb_doc_id using sqlca;		
		if li_cnt = 0 then
			//-- Tạo tài khoản ghi sổ: post ghi sổ --//
			this.event e_widnow_e_preaccounting()
			
			if this.f_create_post_line_multi(ldb_doc_id,ld_trans_date, ldb_doc_version, ldb_branch_id, ldb_trans_hdr_id, vstr_ds_4_posting, vt_transaction) = -1 then
			
				rollback using vt_transaction;
				return -1
			else
				commit using vt_transaction;
			end if
		end if
		
		this.event e_widnow_e_postaccounting()
		//-- KT có mở form xem định khoản không --//
			ls_respond = 'booked'

		
		//-- Ghi sổ giá trị --//
		if ls_respond = 'booked' then	
			setpointer(hourglass!)
			
			if this.f_booking_multi( ldb_doc_id,ldb_doc_version, ld_trans_date, ls_doctype, ls_qty_yn,ls_value_yn, ladb_related_doc_id[], vt_transaction, vstr_ds_4_posting) = -1 then 			
				return -1
			end if
			lb_value_posted = true
		else
			return -1
		end if		
	end if
	
	//-- Ghi sổ số lượng --//
	if (ls_qty_yn = 'Y' and ls_value_yn = 'N')  then//Nếu không ghi sổ kế toán mà có ghi sổ số lượng thì thực hiện ghi sổ số lượng luôn
		//Chèn ghi sổ kho

	//-- cập nhật item_balance --//		
		if this.f_booking_item_multi_ex(ldb_doc_id, ldb_doc_version, ls_doctype, vt_transaction, ld_trans_date, 'post', ls_qty_yn,ls_value_yn,  ladb_related_doc_id[], vstr_ds_4_posting) = -1 then
			return -1
		end if
		lb_qty_posted = true
	end if	
		
	//-- thông báo đến đối tượng sau khi post --//
	if this.event e_window( 'e_post') = -1 then
		Rollback using vt_transaction;			
		return -1
	end if

	//Cập nhật trạng thái và sob ghi sổ
	if lb_qty_posted or lb_value_posted then
		//-- kiểm tra xem bảng trans có ghi sổ chưa --// 
		if ls_value_yn ='Y' then
			select count(doc_id) into :ll_count_p from post_line
			where doc_id = :ldb_doc_id using vt_transaction;
			
			select count(doc_ref_id) into :ll_count_l from ledger_trans
			where doc_ref_id = :ldb_doc_id using vt_transaction;
			
			select count(doc_ref_id) into :ll_count_o from object_trans
			where doc_ref_id = :ldb_doc_id using vt_transaction;
			if ls_doctype = 'GOODS_TRANSFER'  or ls_doctype = 'ASSEMBLE' then //or ls_doctype = 'GOODS_RECEIPT_MISC' or ls_doctype = 'GOODS_DELIVERY_MISC'
				if ll_count_p = 0 or ll_count_l = 0 then lb_err = true
			elseif ls_doctype = 'GOODS_RECEIPT_MISC' or ls_doctype = 'GOODS_DELIVERY_MISC' then
					//--  ?????? --//
			else
				if ll_count_p = 0 or  ll_count_l = 0 or (ll_count_o = 0 and ls_doctype <> 'PROD_ORDERS') then lb_err = true
			end if 
			if lb_err then
				gf_messagebox('m.b_doc.e_action_post_multi.13','Thông báo',' Chứng từ đã ghi sổ nhưng không cập nhật tiền giao dịch. Ghi sổ lại và liên hệ người quản trị' ,'stop','ok',1)		
				Rollback using vt_transaction;
				return -1
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
            			AND STR.DOC_REF_ID = :ldb_doc_id USING vt_transaction;
			
			if ll_count_it > 0 then
				gf_messagebox('m.b_doc.e_action_post_multi.14','Thông báo',' Chứng từ đã ghi sổ nhưng không cập nhật số lượng. Ghi sổ lại' ,'stop','ok',1)		
				Rollback using vt_transaction;
				return -1
			end if
		end if
		vds_main.setitem(li_idx, 'status', 'booked')
		vds_main.setitem(li_idx, 'sob', gs_sob)
		//-- Minh Trí: ngày ghi sổ là ngày hệ thống --//
//		update BOOKED_SLIP set trans_date = :ld_trans_date where id = :ldb_doc_version using vt_transaction;
		////////////////////////////////////////
		ll_rtn = vds_main.update(true,false )
		if ll_rtn = 1 then	
			vds_main.resetupdate( )
			//-- Cập nhật trạng thái chứng từ liện quan --//
			if this.event e_statuschanged_multi( 'booked', ldb_doc_id, ls_doctype, true, vt_transaction) = -1 then
				Rollback using vt_transaction;
				return -1
			end if
			
			//-- thông báo đến đối tượng sau khi cập nhật trạng thái --//
			if this.event e_window( 'e_afterpost') = -1 then
				Rollback using vt_transaction;		
				return -1
			end if		
			commit using vt_transaction;					
		else							
			gf_messagebox('m.b_doc.e_action_post_multi.15','Thông báo','Không cập nhật được trạng thái ghi sổ:@'+vt_transaction.sqlerrtext ,'stop','ok',1)			
			Rollback using vt_transaction;			
			return -1
		end if
	end if
NEXT
return 1
end event

public function integer f_post_tax (string vs_dw_binding);//Hàm post thuế lên chứng từ
string 			ls_object_name, ls_dr_dw_object, ls_cr_dw_object, ls_int_string
long 			ll_idx, ll_row
any 			la_value[], la_retrieve_arg[]

t_dw_mpl 			ldw_main, ldw_binding
u_tax_authority 	lc_tax
u_trans_setup 		lc_trans_setup		
t_ds_db 				lds_trans_setup, lds_tax_authority
b_obj_instantiate		lobj_ins

ls_object_name = this.classname()
ldw_binding = iw_display.f_get_dw(vs_dw_binding)
lc_trans_setup = create u_trans_setup
lc_tax = create u_tax_authority
lds_trans_setup = create t_ds_db
lds_tax_authority = create t_ds_db

la_value[1] = '='+ls_object_name
ls_int_string = 'object_name;'
if lobj_ins.f_is_branch_yn('u_trans_setup') then
	la_value[2] = gdb_branch
	ls_int_string = 'object_name;branch_id;'
end if

ldw_main = iw_display.dynamic f_get_dwmain()
la_retrieve_arg[1] = ldw_main.getitemstring(ldw_main.getrow(),'doc_type')
lds_trans_setup = create t_ds_db
lc_trans_setup.f_init_object_table(lds_trans_setup, 'ds_trans_setup_grid',ls_int_string, la_value[],la_retrieve_arg[])
lds_trans_setup.setfilter("lower(dr_obj_type) ='tax_authority'")
lds_trans_setup.filter()
for ll_idx = 1 to lds_trans_setup.rowcount( )
	ll_row = ldw_binding.event e_addrow()
	ldw_binding.setitem(ll_row,'tax_id',lds_trans_setup.getitemnumber(ll_idx,'dr_obj_instance_id'))
	ldw_binding.setitem(ll_row,'object_code',lds_trans_setup.getitemstring(ll_idx,'dr_object_code'))
	la_value[1] =  lds_trans_setup.getitemnumber(ll_idx,'dr_obj_instance_id')
	ls_int_string = 'object_ref_id;'
	if lobj_ins.f_is_branch_yn('u_tax_authority') then
		la_value[2] = gdb_branch
		ls_int_string = 'object_ref_id;branch_id;'
	end if	
	lds_tax_authority = create t_ds_db
	lc_tax.f_init_object_table(lds_tax_authority, 'd_tax_authority_form', ls_int_string,la_value[],la_retrieve_arg[])
	if lds_tax_authority.rowcount() > 0 then
		ldw_binding.setitem(ll_row,'tax_pct',lds_tax_authority.getitemnumber(1,'default_pct') )
	end if
next
lds_trans_setup.setfilter("lower(cr_obj_type) ='tax_authority'") 
lds_trans_setup.filter()
for ll_idx = 1 to lds_trans_setup.rowcount( )
	ll_row = ldw_binding.event e_addrow()
	ldw_binding.setitem(ll_row,'tax_id',lds_trans_setup.getitemnumber(ll_idx,'cr_obj_instance_id') )
	ldw_binding.setitem(ll_row,'object_code',lds_trans_setup.getitemstring(ll_idx,'cr_object_code') )
	la_value[1] =  lds_trans_setup.getitemnumber(ll_idx,'cr_obj_instance_id')
	ls_int_string = 'object_ref_id;'
	if  lobj_ins.f_is_branch_yn('u_tax_authority') then
		la_value[2] = gdb_branch
		ls_int_string = 'object_ref_id;branch_id;'
	end if		
	lc_tax.f_init_object_table(lds_tax_authority, 'd_tax_authority_form',ls_int_string,la_value[],la_retrieve_arg[])
	if lds_tax_authority.rowcount() > 0 then
		ldw_binding.setitem(ll_row,'tax_pct',lds_tax_authority.getitemnumber(1,'default_pct') )
	end if
next
destroy lc_trans_setup
destroy lc_tax
destroy lds_tax_authority
destroy lds_trans_setup
return 1
end function

public function integer f_post_tax (string vs_doc_type, string vs_dw_binding);//Hàm post thuế lên chứng từ
u_tax_authority lc_tax
u_trans_setup 	lc_trans_setup
t_dw_mpl 		ldw_binding
t_ds_db 			lds_trans_setup, lds_tax_authority
b_obj_instantiate	lobj_ins

string 			ls_object_name, ls_dr_dw_object, ls_cr_dw_object, ls_int_string
long 				ll_idx, ll_row
any 				la_value[], la_retrieve_arg[]

ls_object_name = this.classname()
ldw_binding = iw_display.f_get_dw(vs_dw_binding)
lc_trans_setup = create u_trans_setup
lc_tax = create u_tax_authority
lds_trans_setup = create t_ds_db
lds_tax_authority = create t_ds_db
la_value[1] = '='+ls_object_name
ls_int_string = 'object_name;'
if  lobj_ins.f_is_branch_yn('u_trans_setup') then
	la_value[2] = gdb_branch
	ls_int_string = 'object_name;branch_id;'
end if	
la_retrieve_arg[1] = vs_doc_type
lc_trans_setup.f_init_object_table(lds_trans_setup, 'ds_trans_setup_grid',ls_int_string,la_value[],la_retrieve_arg[])
lds_trans_setup.setfilter("lower(dr_obj_type) ='tax_authority'")
lds_trans_setup.filter()
for ll_idx = 1 to lds_trans_setup.rowcount( )
	ll_row = ldw_binding.event e_addrow()
	ldw_binding.setitem(ll_row,'tax_id',lds_trans_setup.getitemnumber(ll_idx,'dr_obj_instance_id'))
	ldw_binding.setitem(ll_row,'object_code',lds_trans_setup.getitemstring(ll_idx,'dr_object_code'))
	la_value[1] =  lds_trans_setup.getitemnumber(ll_idx,'dr_obj_instance_id')
	ls_int_string = 'object_ref_id;'
	if  lobj_ins.f_is_branch_yn('u_tax_authority') then
		la_value[2] = gdb_branch
		ls_int_string = 'object_ref_id;branch_id;'
	end if		
	lc_tax.f_init_object_table(lds_tax_authority, 'd_tax_authority_form', ls_int_string, la_value[],la_retrieve_arg[])
	if lds_tax_authority.rowcount() > 0 then
		ldw_binding.setitem(ll_row,'tax_pct',lds_tax_authority.getitemnumber(1,'default_pct') )
	end if
next
lds_trans_setup.setfilter("lower(cr_obj_type) ='tax_authority'") 
lds_trans_setup.filter()
for ll_idx = 1 to lds_trans_setup.rowcount( ) 
	ll_row = ldw_binding.event e_addrow()
	ldw_binding.setitem(ll_row,'tax_id',lds_trans_setup.getitemnumber(ll_idx,'cr_obj_instance_id') )
	ldw_binding.setitem(ll_row,'object_code',lds_trans_setup.getitemstring(ll_idx,'cr_object_code') )
	la_value[1] =  lds_trans_setup.getitemnumber(ll_idx,'cr_obj_instance_id')
	ls_int_string = 'object_ref_id;'
	if lobj_ins.f_is_branch_yn('u_tax_authority') then
		la_value[2] = gdb_branch
		ls_int_string = 'object_ref_id;branch_id;'
	end if		
	lc_tax.f_init_object_table(lds_tax_authority, 'd_tax_authority_form', ls_int_string,la_value[],la_retrieve_arg[])
	if lds_tax_authority.rowcount() > 0 then
		ldw_binding.setitem(ll_row,'tax_pct',lds_tax_authority.getitemnumber(1,'default_pct') )
	end if
next
destroy lc_trans_setup
destroy lc_tax
return 1
end function

public function integer f_delete_matching (datawindow vdw_deleting, long vl_del_row);s_str_dwo_related	lstr_related[]
t_transaction			lt_transaction
t_ds_db 					lds_matching
c_string					lc_string
s_w_multi				lw_parent
t_dw_mpl					ldw_main
int							li_count,li_idx,li_idx1,li_rtn, li_rtn2
long						ll_idx2,ll_count1,ll_find, ll_find1
any						laa_data[]
double					ldb_t_ref_id, ldb_id
boolean					lb_exit
string						ls_table_update, ls_t_doc, ls_f_doc

iw_display.dynamic f_get_transaction( lt_transaction)
li_count = this.f_get_dwo_related( lstr_related)
lds_matching = create t_ds_db
li_rtn2=this.f_get_ds_matching( lds_matching, vdw_deleting, vl_del_row,true,lt_transaction) 
if li_rtn2 >0 then
	ls_t_doc = lds_matching.getitemstring(li_rtn2, 't_doc_code') 
	if isnull(ls_t_doc) then ls_t_doc =''
	ls_f_doc = lds_matching.getitemstring(li_rtn2, 'f_doc_code')
	if isnull(ls_f_doc) then ls_f_doc =''
	gf_messagebox('m.b_doc.f_delete_matching.01','Thông báo','Phiếu '+ls_t_doc +' đã kết với Phiếu '+ls_f_doc+' nên không được xóa, hủy phiếu','exclamation','ok',1)
	destroy lds_matching
	return -1
end if
ls_table_update=upper(vdw_deleting.describe( "DataWindow.Table.UpdateTable"))
if ls_table_update='DOCUMENT' and vl_del_row>0 then
	ldb_id= vdw_deleting.getitemnumber(vl_del_row ,'id')
	if isnull(ldb_id) then ldb_id=0
	delete from matching where t_doc_id= :ldb_id using lt_transaction;
	if lt_transaction.sqlcode <>0 then
		gf_messagebox('m.b_doc.f_delete_matching.02','Thông báo','Lỗi, không xóa bảng match được:@'+lt_transaction.sqlerrtext ,'stop','ok',1)
		rollback using  lt_transaction;
		return -1
	end if
	commit using  lt_transaction ;
	return 1
else
	for li_idx = 1 to li_count
		if lstr_related[li_idx].b_t_matching then // có cập nhật bản match và nằm bên To
			for li_idx1 = 1 to upperbound(lstr_related[li_idx].s_match_t_dwo)
				if lstr_related[li_idx].s_match_t_dwo[li_idx1] = vdw_deleting.dataobject then //dw đang modify là dw cập nhật match bên To
					if ids_matching.rowcount( ) = 0 then
						if vl_del_row > 0 then //xoa theo t_ref_id -> xoa tung dong line
							ldb_id = vdw_deleting.getitemnumber(vl_del_row,'id')
							if isnull(ldb_id) then ldb_id=0
							delete from matching where t_ref_id= :ldb_id using lt_transaction;
						elseif vl_del_row = 0 and vdw_deleting.rowcount() > 0 then //xoa theo t_doc_id ->truong hop xoa ca phieu
							vdw_deleting.dynamic f_getparentwindow(lw_parent)
							ldw_main = lw_parent.dynamic f_get_dwmain()
							ldb_id= ldw_main.getitemnumber(ldw_main.getrow( ) ,'id')
							if isnull(ldb_id) then ldb_id=0
							delete from matching where t_doc_id= :ldb_id using lt_transaction;
						end if
						if lt_transaction.sqlcode <>0 then
							gf_messagebox('m.b_doc.f_delete_matching.02','Thông báo','Lỗi, không xóa bảng match được:@'+lt_transaction.sqlerrtext ,'stop','ok',1)
							rollback using  lt_transaction;
							return -1
						end if
						commit using  lt_transaction ;
						lb_exit = true
						exit
					else
						if vdw_deleting.find("gutter = 'Y'",1,vdw_deleting.rowcount()) > 0 then
							Do
								ll_find = vdw_deleting.find("gutter = 'Y'",ll_find+1,vdw_deleting.rowcount()+1)
								if ll_find > 0 then
									ldb_t_ref_id = vdw_deleting.getitemnumber(ll_find,'ID')
									ll_find1=ids_matching.find( "t_ref_id = "+string(ldb_t_ref_id), 1, ids_matching.rowcount( ) )
									if ll_find1>0 then
										do
											ids_matching.deleterow(ll_find1 )
											ll_find1=ids_matching.find( "t_ref_id = "+string(ldb_t_ref_id),ll_find1, ids_matching.rowcount( ))
										loop while ll_find1>0
									end if
								end if
							Loop While ll_find > 0
							lb_exit = true
							exit
						else
							if vl_del_row > 0 then
								ldb_t_ref_id = vdw_deleting.getitemnumber(vl_del_row,'ID')
								ll_find1=ids_matching.find( "t_ref_id = "+string(ldb_t_ref_id), 1, ids_matching.rowcount( ) )
								if ll_find1>0 then
									do
										ids_matching.deleterow(ll_find1 )
										ll_find1=ids_matching.find( "t_ref_id = "+string(ldb_t_ref_id),ll_find1, ids_matching.rowcount( ))
									loop while ll_find1>0
								end if
								lb_exit = true
								exit
							end if
						end if
					end if
				end if
			next
		end if	
		if lb_exit = true then exit
	next
end if
destroy lds_matching
return li_rtn
end function

public function boolean f_is_matching (double vdb_doc_id, ref double radb_t_ref_id[], ref string ras_t_ref_table[]);//int					li_count,li_idx,li_idx1,li_idx2,li_count1
//string				ls_updatetable_f,ls_updatetable_master,ls_sql,ls_modify,ls_rtn,ls_ref_table
long				ll_rtn
//t_dw_mpl	ldw_match_f,ldw_master
//t_transaction	lt_transaction
//t_ds_db			lds_matching

ll_rtn = this.f_get_t_doc_id( vdb_doc_id, radb_t_ref_id)
if ll_rtn > 0 then
	return true
end if
/*
li_count = upperbound(istr_dwo_related)
lds_matching = create t_ds_db
lds_matching.dataobject = 'ds_match_line'
for li_idx = 1 to li_count
	if istr_dwo_related[li_idx].b_f_matching then
		for li_idx1 = 1 to upperbound(istr_dwo_related[li_idx].s_match_f_dwo )
			if istr_dwo_related[li_idx].s_match_f_dwo[li_idx1] <> '' then
				if pos(istr_dwo_related[li_idx].s_match_f_dwo[li_idx1],'catch') > 0 then continue
				ldw_match_f = iw_display.dynamic f_get_dw(istr_dwo_related[li_idx].s_match_f_dwo[li_idx1])
				ldw_master = ldw_match_f.dynamic f_get_idw_master()
				ls_updatetable_f = ldw_match_f.describe( "Datawindow.Table.UpdateTable")
				ls_updatetable_master = ldw_master.describe( "Datawindow.Table.UpdateTable")
				ls_sql = "select "+ls_updatetable_f+".id as id,document.code as code,matching.t_ref_table as ref_table,matching.t_ref_id as ref_id " +&
							"from "+ls_updatetable_f+' ' +&
							"join "+ls_updatetable_master+" on "+ls_updatetable_f+".object_ref_id = "+ls_updatetable_master+".id " +&
							"join document on "+ls_updatetable_master+".object_ref_id = document.id " +&
							"join matching on matching.f_ref_id = "+ls_updatetable_f+".id "+&
							"where document.id = "+string(vdb_doc_id)+" and EXISTS (select matching.f_ref_id from matching)"
				ls_modify = 'Datawindow.Table.Select= "' + ls_sql +'"'
				ls_rtn =lds_matching.modify(ls_modify )
				iw_display.dynamic f_get_transaction(lt_transaction)
				lds_matching.f_settransobject( lt_transaction)
				ll_rtn = lds_matching.retrieve( )
				if ll_rtn > 0 then 
					li_count1 ++
					for li_idx2 = 1 to ll_rtn
						radb_t_ref_id[li_idx2] = lds_matching.getitemnumber( li_idx2, 'ref_id')
						ls_ref_table = lds_matching.getitemstring( li_idx2, 'ref_table')
						if li_idx2 = 1 then
							ras_t_ref_table[li_count1] = ls_ref_table
						else
							if ras_t_ref_table[li_count1] <> ls_ref_table then
								li_count1 ++
								ras_t_ref_table[li_count1] = ls_ref_table
							end if
						end if
					next
					destroy lds_matching
					return true
				end if
			end if
		next
	end if
next
destroy lds_matching
*/
return false
end function

public function boolean f_chk_qty_matching (s_str_dwo_related vastr_dwo_related[]);int					li_idx,li_idx2,li_idx3
long				ll_find,ll_modified_row
string				las_match_f_column[],las_match_column[],ls_table_to,ls_item_name,ls_rf_dwo
decimal			ldc_qty,ldc_rtn
c_string			lc_string
t_ds_db			lds_to
t_dw_mpl		ldw_source,ldw_target
/*
lds_to = create t_ds_db
for li_idx = 1 to upperbound(vastr_dwo_related)
	if vastr_dwo_related[li_idx].b_f_matching then
		for li_idx2 = 1 to upperbound(vastr_dwo_related[li_idx].s_match_f_dwo)
			if vastr_dwo_related[li_idx].s_match_f_dwo[li_idx2] <> '' then
				ldw_source = iw_display.dynamic f_get_dw(vastr_dwo_related[li_idx].s_match_f_dwo[li_idx2])
				if ib_copying then // trường hợp copy
					lc_string.f_stringtoarray( vastr_dwo_related[li_idx].s_match_f_column[li_idx2], ';', las_match_f_column)
					lc_string.f_stringtoarray( vastr_dwo_related[li_idx].s_match_column[li_idx2], ';', las_match_column)
					if upperbound(vastr_dwo_related[li_idx].s_match_rf_dwo) >= li_idx2 then ls_rf_dwo = vastr_dwo_related[li_idx].s_match_rf_dwo[li_idx2]
					if isvalid(ldw_source) then
						lds_to.dataobject = vastr_dwo_related[li_idx].s_match_t_dwo[li_idx2]
						ls_table_to = lds_to.describe( "datawindow.table.updatetable")
						if ldw_source.f_isgrid( ) then
							ll_find = ldw_source.find( "gutter = 'Y'", 1, ldw_source.rowcount())
							if ll_find > 0 then
								ll_find = 0
								Do
									ll_find++
									ll_find = ldw_source.find( "gutter = 'Y'", ll_find, ldw_source.rowcount())
									if ll_find > 0 then
							//			if this.f_get_values_qty( ldw_source,ls_table_to,ls_rf_dwo, las_match_f_column, las_match_column, ldc_rtn, ldc_qty, ll_find) = 0 then
											ls_item_name = ldw_source.getitemstring( ll_find, 'line_text')
											gf_messagebox('m.b_doc.f_chk_qty_matching.01','Thông báo','Số lượng của: '+ls_item_name+' đã được kết hết','exclamation','ok',1)
											destroy lds_to
											return false
							//			end if
									end if
								Loop while ll_find > 0
							else
								for li_idx3 = 1 to ldw_source.rowcount()
						//			if this.f_get_values_qty( ldw_source,ls_table_to,ls_rf_dwo, las_match_f_column, las_match_column, ldc_rtn, ldc_qty, li_idx3) = 0 then
										ls_item_name = ldw_source.getitemstring( li_idx3, 'line_text')
										gf_messagebox('m.b_doc.f_chk_qty_matching.01','Thông báo','Số lượng của: '+ls_item_name+' đã được kết hết','exclamation','ok',1)
										destroy lds_to
										return false
							//		end if
								next
							end if
						else
						//	if this.f_get_values_qty( ldw_source,ls_table_to,ls_rf_dwo, las_match_f_column, las_match_column, ldc_rtn, ldc_qty, ldw_source.getrow( ) ) = 0 then
								ls_item_name = ldw_source.getitemstring( ldw_source.getrow( ), 'line_text')
								gf_messagebox('m.b_doc.f_chk_qty_matching.01','Thông báo','Số lượng của: '+ls_item_name+' đã được kết hết','exclamation','ok',1)
								destroy lds_to
								return false
						//	end if
						end if
					end if
				else // trường hợp sửa
					if isvalid(ldw_source) then return true  //trường hợp sửa bên nguồn thì không cần chk
					ldw_target = iw_display.dynamic f_get_dw(vastr_dwo_related[li_idx].s_match_t_dwo[li_idx2])
					ll_modified_row = ldw_target.GetNextModified(0, Primary!)
					Do While ll_modified_row > 0 and ll_modified_row <= ldw_target.rowcount( )
						
						ll_modified_row = ldw_target.GetNextModified(ll_modified_row, Primary!)
					Loop 
				end if
			end if
		next
	end if
next
destroy lds_to
*/
return true
end function

public function long f_find_object_on_post_set (string vs_object_type, t_ds_db vds_post_line_set, string vs_dr_cr);//Hàm tìm đối tượng đối ứng
//Tham số: vs_object_type :loại đối tượng cần tìm
//				vds_post_line_set :datastore chứa các đối tượng đã được post
//				vs_dr_cr: kiểm bên Nợ hoặc Có
//return :trả về dòng tìm thấy đối tượng đối ứng

if vs_dr_cr = 'dr' then
	return vds_post_line_set.find("dr_object_type='"+vs_object_type+"'",1,vds_post_line_set.rowcount())
else
	return vds_post_line_set.find("cr_object_type='"+vs_object_type+"'",1,vds_post_line_set.rowcount())
end if
end function

public function long f_get_trans_setup_dwo (string vs_dwo_object, t_ds_db vds_trans_setup, string vs_dr_cr, ref t_ds_db vds_trans_setup_of_dwo);//Hàm này lấy các dòng cài đặt ghi sổ có liên quna đến dwo
long ll_rtn
if vs_dr_cr = 'dr' then
	vds_trans_setup.setfilter("dr_dw_object ='"+vs_dwo_object+"'")
	vds_trans_setup.filter()
	vds_trans_setup.rowscopy(1,vds_trans_setup.rowcount(), Primary!, vds_trans_setup_of_dwo,1,Primary!)
	return vds_trans_setup_of_dwo.rowcount()
end if
if vs_dr_cr = 'cr' then
	vds_trans_setup.setfilter("cr_dw_object ='"+vs_dwo_object+"'")
	vds_trans_setup.filter()
	vds_trans_setup.rowscopy(1,vds_trans_setup.rowcount(), Primary!, vds_trans_setup_of_dwo,1,Primary!)
	return vds_trans_setup_of_dwo.rowcount()
end if
return 0
end function

public function long f_get_trans_setup_dwo (string vs_dwo_object, t_ds_db vds_trans_setup, string vs_dr_cr, ref t_ds_db vds_data[]);//Hàm này lấy các dòng cài đặt ghi sổ có liên quna đến dwo
//Hàm trả về mảng các datastore phân biệt theo posting_type cài đặt ghi sổ có liên quan đến dwo
//Mục đích trả về mảng vì để đảm bảo cả hai thop cài đặt 1 dw nhiều lần vì có 2 nghiệp vụ hoặc vì cài đặt theo nhiều đối tượng
long 		ll_rtn, ll_idx
string 		ls_post_type, ls_pre_post_type
t_ds_db 	vds_null[], lds_buffer


vds_data = vds_null
if vs_dr_cr = 'dr' then
	vds_trans_setup.setfilter("dr_dw_object ='"+vs_dwo_object+"'")
elseif  vs_dr_cr = 'cr' then
	vds_trans_setup.setfilter("cr_dw_object ='"+vs_dwo_object+"'")
end if

vds_trans_setup.filter()
ll_rtn = vds_trans_setup.rowcount()
vds_trans_setup.setsort('posting_type asc')
vds_trans_setup.sort()
lds_buffer = create t_ds_db
lds_buffer.dataobject = vds_trans_setup.dataobject

vds_trans_setup.rowscopy(1,vds_trans_setup.rowcount(), Primary!, lds_buffer,1,Primary!)
for ll_idx = 1 to  vds_trans_setup.rowcount()
	if ll_idx > 1 then ls_pre_post_type =  vds_trans_setup.getitemstring(ll_idx - 1,'posting_type')
	ls_post_type = vds_trans_setup.getitemstring(ll_idx,'posting_type')
	if isnull(ls_post_type) then ls_post_type = ''
	if isnull(ls_pre_post_type) then ls_pre_post_type = ''
	if ll_idx = 1 or (ll_idx > 1 and ls_post_type <> ls_pre_post_type) then
		if vs_dr_cr = 'dr' then
			if ls_post_type="" or isnull(ls_post_type) then
				lds_buffer.setfilter("dr_dw_object ='"+vs_dwo_object+"' AND isnull(posting_type)")
			else
				lds_buffer.setfilter("dr_dw_object ='"+vs_dwo_object+"' and posting_type ='" +ls_post_type+"'")
			end if
		elseif  vs_dr_cr = 'cr' then
			if ls_post_type="" or isnull(ls_post_type) then
				lds_buffer.setfilter("cr_dw_object ='"+vs_dwo_object+"' AND isnull(posting_type)")
			else
				lds_buffer.setfilter("cr_dw_object ='"+vs_dwo_object+"' and posting_type ='" +ls_post_type+"'")
			end if			
		end if
		lds_buffer.filter()
		vds_data[upperbound(vds_data) + 1] = create t_ds_db
		vds_data[upperbound(vds_data)].dataobject =  vds_trans_setup.dataobject
		lds_buffer.rowscopy(1,lds_buffer.rowcount(), Primary!, vds_data[upperbound(vds_data)],1,Primary!)
	end if
next
destroy lds_buffer
return upperbound(vds_data)
	
end function

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

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

public function string f_get_balance_control_type (long vl_account_id);string 			balance_control_type, ls_int_string
any 			la_null[], la_data[]
t_ds_db 		lds_tmp
u_account 	lc_object

balance_control_type = 'none'
lc_object = create u_account
la_data[1] = vl_account_id

lds_tmp = create t_ds_db

if lc_object.f_init_object_table(lds_tmp, 'd_account_form', 'object_ref_id', la_data, la_null) > 0 then
	balance_control_type = lower(lds_tmp.getitemstring( 1, 'balance_control'))
end if
destroy lc_object
destroy lds_tmp
return balance_control_type
end function

public subroutine f_set_idb_trans_id (double vdb_trans_id);idb_trans_id = vdb_trans_id
end subroutine

public function integer f_view_all_on_off (readonly datawindow rdw_handling, string vs_colname);datawindow	ldw_master
double		ldb_master_id
string			ls_selected

if vs_colname = 'view_all' then
	ls_selected = rdw_handling.getitemstring(rdw_handling.rowcount(),vs_colname)
	if ls_selected = 'N' or isnull(ls_selected) then
		//rdw_handling.settext('Y')
		rdw_handling.setitem(rdw_handling.rowcount(),'view_all','Y')
		rdw_handling.setfilter('')
		rdw_handling.filter()
	elseif ls_selected = 'Y' then
	//	rdw_handling.settext('N')
		rdw_handling.setitem(rdw_handling.rowcount(),'view_all','N')
		ldw_master = rdw_handling.dynamic f_get_idw_master()
		ldb_master_id = ldw_master.getitemnumber(ldw_master.getrow(),'id')
		rdw_handling.setfilter('object_ref_id = '+string(ldb_master_id))
		rdw_handling.filter()
	end if
end if
return 0
end function

public function integer f_set_ids_matching (t_ds_db vds_handling);long	ll_rtn
transaction		lt_transaction
ids_matching.dataobject = vds_handling.dataobject
iw_display.f_get_transaction(lt_transaction)
ids_matching.f_settransobject(lt_transaction)
ll_rtn = vds_handling.rowscopy( 1 , vds_handling.rowcount() , Primary!, ids_matching, ids_matching.rowcount() + 1, Primary!)
return ll_rtn
end function

public function t_ds_db f_get_ids_matching ();return ids_matching
end function

public function decimal f_get_values_qty_first_copy (datawindow vdw_handling, string vs_t_ref_table, string vas_match_handling_column[], string vas_match_column[], ref decimal rdc_qty_matching, ref decimal rdc_qty_doc, long vl_row);int					li_idx
any				laa_data[]
long				ll_rtn,ll_find
string				ls_t_ref_table,ls_f_doc_code,ls_t_doc_code
double			ladb_t_id[],ladb_f_id[]
decimal			ldc_handling_qty
//t_ds_db			lds_matching
t_transaction	lt_transaction

//iw_display.dynamic f_get_transaction(lt_transaction)
//lds_matching = create t_ds_db
//lds_matching.dataobject = 'ds_matching'
//lds_matching.f_settransobject( lt_transaction)
if ib_copying then
	laa_data[1] = vdw_handling.getitemnumber( vl_row, 'ID')
	laa_data[2] = vs_t_ref_table	
else
	ladb_t_id[1] = vdw_handling.getitemnumber( vl_row, 'ID')
//	if not isvalid(ids_matching) then
//		select matching.f_ref_id into :ladb_f_id[1] from matching where t_ref_id = :ladb_t_id[1] using SQLCA;
//		if lt_transaction.sqlcode = -1 then
//			return -1
//		elseif lt_transaction.sqlcode = 100 then
//			return 0
//		end if
//		laa_data[1] = ladb_f_id[1]
//	else
		ll_find = ids_matching.find( 't_ref_id = '+string(ladb_f_id[1]), 1, ids_matching.rowcount())
		if ll_find > 0 then
			laa_data[1] = ids_matching.getitemnumber( ll_find, 'f_ref_table')
		end if
//	end if
	ls_t_ref_table = vdw_handling.describe("Datawindow.table.update")
	laa_data[2] = ls_t_ref_table	
end if

ids_matching.f_add_where( 'f_ref_id;t_ref_table', laa_data)
ll_rtn = ids_matching.retrieve( )
if ll_rtn > 0 then
	for li_idx = 1 to ll_rtn
		rdc_qty_matching += ids_matching.getitemnumber( li_idx, 'qty')
	next
	for li_idx = 1 to upperbound(vas_match_column)
		if upper(vas_match_column[li_idx]) = 'QTY' then
			ldc_handling_qty = vdw_handling.getitemnumber( vl_row, vas_match_handling_column[li_idx])
			rdc_qty_doc = ids_matching.getitemnumber( ll_rtn, ids_matching.getitemstring( ll_rtn, 'f_ref_table') +'_qty')
			exit
		end if
	next
end if
//destroy ids_matching
if ib_copying then
	rdc_qty_doc = ldc_handling_qty
	return rdc_qty_doc - rdc_qty_matching
else
	if ldc_handling_qty <= rdc_qty_matching then
		return rdc_qty_matching - ldc_handling_qty
	else
		if rdc_qty_doc > ldc_handling_qty then
			return rdc_qty_doc - ldc_handling_qty
		else
			return -1
		end if
	end if
end if

end function

public function string f_get_doc_code_matching (double vadb_ref_id[]);t_transaction	lt_transaction
//c_string			lc_str
t_ds_db			lds_matching
string				ls_sql,ls_ref_id,ls_modify,ls_rtn,ls_doc_code
long				ll_rtn
int					li_idx,li_idx1
any				laa_data[]

iw_display.dynamic f_get_transaction(lt_transaction)
//lc_str.f_arraytostring( vadb_ref_id, ',', ls_ref_id)
laa_data[1] = vadb_ref_id[1]
lds_matching = create t_ds_db
//for li_idx = 1 to upperbound(vas_ref_table)
//	if li_idx > 1 then
//		if upper(vas_ref_table[li_idx]) = upper(vas_ref_table[li_idx -1]) then continue
//	end if
	lds_matching.dataobject = 'ds_matching'
//	if li_idx = 1 then
	lds_matching.f_settransobject( lt_transaction)
	lds_matching.f_add_where( 't_ref_id', laa_data)
	ll_rtn = lds_matching.retrieve( )
//	for li_idx1 = 1 to ll_rtn
		if ll_rtn > 0 then 
			ls_doc_code = lds_matching.getitemstring( ll_rtn, 't_doc_code') 
//		else
//			if lds_matching.getitemstring( li_idx1, 't_doc_code')  <> lds_matching.getitemstring( li_idx1 - 1, 't_doc_code') then
//				ls_doc_code += lds_matching.getitemstring( li_idx1, 't_doc_code') +','
			end if
//		end if
//			
//	next
//next

//ls_sql = "select pl.id as id,document.code as code,matching.f_ref_table as ref_table,matching.f_ref_id as ref_id "+&
//			"from document "							  
//if upperbound(vas_t_ref_table) > 1 then
//	ls_sql +=	"left join orders on document.id = orders.object_ref_id " +&
//					"left join "+string(vas_t_ref_table[1])+" pl on orders.id = pl.object_ref_id "  +&
//					"left join booked_slip bks on document.id = bks.object_ref_id "+&
//					"left join "+string(vas_t_ref_table[2])+" ivl on bks.id = ivl.object_ref_id "
//else
//	ls_sql +=	"left join orders on document.id = orders.object_ref_id " +&
//					"left join "+string(vas_t_ref_table[1])+" pl on orders.id = pl.object_ref_id "  +&
//					"left join booked_slip bks on document.id = bks.object_ref_id "+&
//					"left join "+string(vas_t_ref_table[1])+" ivl on bks.id = ivl.object_ref_id "
//end if
//ls_sql +="left join matching on pl.id = matching.t_ref_id or ivl.id = matching.t_ref_id "+&
//			"where matching.t_ref_id in ("+ls_ref_id+") "
//			
//lds_matching = create t_ds_db
//lds_matching.dataobject = 'ds_match_line'
//ls_modify = 'Datawindow.Table.Select= "' + ls_sql +'"'
//ls_rtn =lds_matching.modify(ls_modify )
//iw_display.dynamic f_get_transaction(lt_transaction)
//lds_matching.f_settransobject( lt_transaction)
//ll_rtn = lds_matching.retrieve( )
//for li_idx = 1 to ll_rtn
//	ls_rtn = trim(lds_matching.getitemstring( li_idx, 'code'))
//	if li_idx = 1 then
//		ls_doc_code = ls_rtn
//	else
//		if pos(ls_doc_code+',',ls_rtn+',') = 0 then
//			ls_doc_code += ','+ls_rtn
//		end if
//	end if
//next
return ls_doc_code
end function

public function integer f_get_trans_setup (double vdb_trans_hdr_id, ref t_ds_db rds_trans_setup);//Lấy các cài đặt có quản lý giá trị
// return: 1 thành công có dữ liệu, 0 thành công không dữ liệu, -1 lỗi

//string				ls_int_string
long	 			ll_rtn
any 				la_null[], la_data[]
u_trans_setup 	lc_trans_setup

lc_trans_setup = create u_trans_setup
la_data[1] = vdb_trans_hdr_id
//
//ls_int_string = 'object_name;'
//if idwsetup_initial.f_is_branch_yn('d_trans_setup_hdr_grid') then
//	la_value[2] = gdb_branch
//	ls_int_string = 'object_name;branch_id;'
//end if	

ll_rtn = lc_trans_setup.f_init_object_table(rds_trans_setup, 'd_trans_setup_grid','object_ref_id;', la_data[], la_null[])
rds_trans_setup.setsort("dw_get_amount a, posting_type a")
rds_trans_setup.sort()
destroy lc_trans_setup
return ll_rtn
end function

public function integer f_get_trans_setup_account (t_ds_db vds_trans_setup, string vs_posting_type, double vdb_dr_object_id, double vdb_cr_object_id, any va_dr_criteria_data, string vs_dr_coltype, any va_cr_criteria_data, string vs_cr_coltype, ref s_str_post_account rstr_post_account, ref string rs_dr_obj_type, ref string rs_cr_obj_type);/**********************
Không còn dùng
===================*/

string		ls_dr_obj_name, ls_cr_obj_name
long		ll_found_row
double	ldb_dr_post_group, ldb_cr_post_group

string		ls_cr_obj_type_other, ls_dr_obj_type_other
s_object	ls_object


//-- Lấy object_type và post_group --//
ls_object = create s_object
if vdb_dr_object_id > 0 then
	if ls_object.f_init_object( vdb_dr_object_id) = 1 then
		rs_dr_obj_type = ls_object.ids_attribute.getitemstring( 1, 'object_ref_table')//
		ldb_dr_post_group = ls_object.ids_attribute.getitemnumber( 1, 'posting_group')
		ls_dr_obj_name = ls_object.ids_attribute.getitemstring( 1, 'name')
		if isnull(ldb_dr_post_group) then ldb_dr_post_group = 0
	else
		gf_messagebox('m.b_doc.f_get_setup_account.01','Thông báo','Không tìm thấy đối tượng Nợ','exclamation','ok',1)
		return -1	
	end if
end if
if vdb_cr_object_id > 0 then
	if ls_object.f_init_object( vdb_cr_object_id) = 1 then
		rs_cr_obj_type = ls_object.ids_attribute.getitemstring( 1, 'object_ref_table')	//
		ls_cr_obj_name = ls_object.ids_attribute.getitemstring( 1, 'name')
		ldb_cr_post_group = ls_object.ids_attribute.getitemnumber( 1, 'posting_group')
		if isnull(ldb_cr_post_group) then ldb_cr_post_group = 0
	else
		gf_messagebox('m.b_doc.f_get_setup_account.02','Thông báo','Không tìm thấy đối tượng Có','exclamation','ok',1)
		return -1	
	end if
end if
destroy ls_object


//-- lấy tài khoản đối tượng Nợ --//

ll_found_row = this.f_find_trans_setup_account_dr( vds_trans_setup, vs_posting_type,vdb_dr_object_id,vdb_cr_object_id, va_dr_criteria_data, vs_dr_coltype, rstr_post_account, rs_dr_obj_type, rs_cr_obj_type, ldb_dr_post_group)
if ll_found_row = -1 or ll_found_row = 2 then
	return ll_found_row
elseif  ll_found_row = 0 then //-- không tìm thấy tài khoản đối tượng nợ --//
	ls_dr_obj_type_other = this.f_get_obj_type_other(vdb_dr_object_id , rs_dr_obj_type)
	if ls_dr_obj_type_other <> '' then
		rs_dr_obj_type = ls_dr_obj_type_other
	else
		gf_messagebox('m.b_doc.f_get_setup_account.01','Thông báo','Không tìm thấy tài khoản của đối tượng Nợ:@'+ls_dr_obj_name,'exclamation','ok',1)
		return -1				
	end if
	ll_found_row = this.f_find_trans_setup_account_dr( vds_trans_setup, vs_posting_type,vdb_dr_object_id, vdb_cr_object_id,va_dr_criteria_data, vs_dr_coltype, rstr_post_account, rs_dr_obj_type, rs_cr_obj_type, ldb_dr_post_group)
	if ll_found_row = -1 or ll_found_row = 2 then
		return ll_found_row
	elseif ll_found_row = 0 then
		gf_messagebox('m.b_doc.f_get_setup_account.03','Thông báo','Không tìm thấy tài khoản của đối tượng trong cài đặt','exclamation','ok',1)
		return -1
	end if
end if

//-- Lấy tài khoản đối tượng Có --//
ll_found_row = this.f_find_trans_setup_account_cr( vds_trans_setup, vs_posting_type,vdb_dr_object_id,vdb_cr_object_id, va_cr_criteria_data, vs_cr_coltype,rstr_post_account, rs_dr_obj_type, rs_cr_obj_type, ldb_cr_post_group)
if ll_found_row = -1 or ll_found_row = 1 or ll_found_row = 2 then
	return ll_found_row
else //-- không tìm thấy đối tài khoản đối tượng có --//
	//-- kiểm tra loại đối tượng khác (đối tượng vừa là customer vừa là vendor) --//
	ls_cr_obj_type_other = this.f_get_obj_type_other(vdb_cr_object_id , rs_cr_obj_type)
	if ls_cr_obj_type_other <> '' then
		rs_cr_obj_type = ls_cr_obj_type_other
	else
		gf_messagebox('m.b_doc.f_get_setup_account.02','Thông báo','Không tìm thấy tài khoản của đối tượng Có:@'+ls_cr_obj_name,'exclamation','ok',1)
		return 0
	end if		
	ll_found_row = this.f_find_trans_setup_account_cr( vds_trans_setup, vs_posting_type,vdb_dr_object_id,vdb_cr_object_id, va_cr_criteria_data, vs_cr_coltype,rstr_post_account, rs_dr_obj_type, rs_cr_obj_type, ldb_cr_post_group)
	if  ll_found_row = -1 or ll_found_row = 1 then
		return ll_found_row
	else
		gf_messagebox('m.b_doc.f_get_setup_account.02','Thông báo','Không tìm thấy tài khoản của đối tượng Có:@'+ls_cr_obj_name,'exclamation','ok',1)
		return -1
	end if
end if

return 1
end function

public function integer f_update_item_balance (string vs_post_type);//--------------------------//
//-- KHÔNG CÒN DUNG--//
//==============//
//select count(id) from item_balance where 
int							li_idx,li_rtn
any						laa_data[]
date						ld_trans_date
long						ll_rtn,ll_idx,ll_idx2,ll_row,ll_idx3,ll_in_qty,ll_out_qty
string						las_col_item[],las_f_col_object[],las_t_col_object[],las_col_item_lot[]
string						ls_lot_yn,ls_serial_yn,ls_lot_no,ls_serial_no,ls_original_filter,ls_filter
double					ldb_item_id,ldb_branch_id,ldb_company_id,ldb_loc_id,ldb_spec_id,ldb_f_object_id,ldb_t_object_id,ldb_item_balance_id
c_string					lc_string
t_ds_db					lds_item_balance
t_dw_mpl				ldw_f_object,ldw_item,ldw_t_object,ldw_item_lot,ldw_main,ladw_detail[]
c_dwservice				lc_dwsr
t_transaction			lt_transaction
s_str_streamvalue		lastr_streamvalue[] 

//ll_rtn = this.f_get_str_streamvalue( lastr_streamvalue)
//ldw_main = iw_display.dynamic f_get_dwmain()
//iw_display.dynamic f_get_transaction(lt_transaction)
//lds_item_balance = create t_ds_db
//
//for li_idx = 1 to ll_rtn
//	ldw_f_object = iw_display.dynamic f_get_dw(lastr_streamvalue[li_idx].s_f_obj_dwo)
//	ldw_item = iw_display.dynamic f_get_dw(lastr_streamvalue[li_idx].s_item_dwo)
////	ldw_item_lot = iw_display.dynamic f_get_dw(lastr_streamvalue[li_idx].s_item_lot_dwo)
//	ldw_t_object =  iw_display.dynamic f_get_dw(lastr_streamvalue[li_idx].s_t_obj_dwo)
////	ls_original_filter = ldw_item_lot.describe( "datawindow.table.filter")
//	lc_string.f_stringtoarray( lastr_streamvalue[li_idx].s_f_obj_column, ';',las_f_col_object)
//	lc_string.f_stringtoarray( lastr_streamvalue[li_idx].s_t_obj_column, ';',las_t_col_object)
//	lc_string.f_stringtoarray( lastr_streamvalue[li_idx].s_item_column, ';',las_col_item)
////	lc_string.f_stringtoarray( lastr_streamvalue[li_idx].s_item_lot_column, ';',las_col_item_lot)
//	for ll_idx = 1 to ldw_item.rowcount( )
////		ldw_item_lot.setfilter("")
////		ldw_item_lot.filter( )
//		laa_data[1] = ldw_item.getitemnumber(ll_idx,las_col_item[1])
//		laa_data[2] =  ldw_item.getitemnumber(ll_idx,'BRANCH_ID')
//		laa_data[3] = ldw_item.getitemnumber(ll_idx,'COMPANY_ID')
//		laa_data[4] = ldw_item.getitemnumber(ll_idx,las_col_item[2])
//		laa_data[5] = ldw_item.getitemnumber(ll_idx,las_col_item[5]) 
////		ldw_item_lot.setfilter( "object_ref_id = "+string(ldw_item.getitemnumber( ll_idx,'ID') ))
////		ldw_item_lot.filter( )
//		if ldw_f_object.dataobject = ldw_item.dataobject then 
//			ldb_f_object_id = ldw_f_object.getitemnumber( ll_idx, las_f_col_object[1])
//		else
//			ldb_f_object_id = ldw_f_object.getitemnumber( ldw_f_object.getrow( ), las_f_col_object[1])
//		end if
//		if ldw_t_object.dataobject = ldw_item.dataobject then 
//			ldb_t_object_id = ldw_t_object.getitemnumber( ll_idx, las_t_col_object[1])
//		else
//			ldb_t_object_id = ldw_t_object.getitemnumber( ldw_t_object.getrow( ), las_t_col_object[1])
//		end if
//		lc_dwsr.f_get_lot_or_serial_yn( laa_data[1], ls_lot_yn,ls_serial_yn)
//		if ls_serial_yn = 'Y' or ls_lot_yn = 'Y' then
//			for ll_idx2 = 1 to ldw_item_lot.rowcount( )
//				laa_data[7] = ldw_item_lot.getitemstring( ll_idx2, las_col_item_lot[3])
//				laa_data[8] = ldw_item_lot.getitemstring( ll_idx2, las_col_item_lot[2])
//				laa_data[9] = '>='+string(ld_trans_date)
//				//trường hợp out_qty
//				laa_data[6] = ldb_f_object_id
//				if this.f_update_item_balance( lds_item_balance,ldw_item_lot,las_col_item_lot[1],ll_idx2,'OUT',laa_data,vs_post_type) = -1 then return -1
//				if lds_item_balance.update(true,false ) = 1 then 
//					lds_item_balance.resetupdate( )
//				else
//					destroy lds_item_balance
//					rollback using lt_transaction;
//					return -1
//				end if
//				//trường hợp in_qty
//				laa_data[6] = ldb_t_object_id
//				if this.f_update_item_balance( lds_item_balance,ldw_item_lot,las_col_item_lot[1],ll_idx2,'IN',laa_data,vs_post_type) = -1 then return -1
//				if lds_item_balance.update(true,false ) = 1 then 
//					lds_item_balance.resetupdate( )
//				else
//					destroy lds_item_balance
//					rollback using lt_transaction;
//					return -1
//				end if
//			next
//		else
//			setnull(laa_data[7]) 
//			setnull(laa_data[8]) 
//			laa_data[9] = '>='+string(ld_trans_date)
//			//trường hợp out_qty
//			laa_data[6] = ldb_f_object_id
//			if this.f_update_item_balance( lds_item_balance,ldw_item,las_col_item[3],ll_idx,'OUT',laa_data,vs_post_type) = -1 then return -1
//			if lds_item_balance.update(true,false ) = 1 then 
//				lds_item_balance.resetupdate( )
//			else
//				destroy lds_item_balance
//				rollback using lt_transaction;
//				return -1
//			end if
//			//trường hợp in_qty
//			laa_data[6] = ldb_t_object_id
//			if this.f_update_item_balance( lds_item_balance,ldw_item,las_col_item[3],ll_idx,'IN',laa_data,vs_post_type) = -1 then return -1
//			if lds_item_balance.update(true,false ) = 1 then 
//				lds_item_balance.resetupdate( )
//			else
//				destroy lds_item_balance
//				rollback using lt_transaction;
//				return -1
//			end if
//		end if
//	next
//next
//if ls_original_filter <> '?' then
//	lc_string.f_globalreplace(ls_original_filter ,'~~','')
//	ldw_item_lot.setfilter( ls_original_filter)
//	ldw_item_lot.filter( )
//end if
//destroy lds_item_balance
return 1
end function

public function integer f_update_item_balance (ref t_ds_db rds_item_balance, t_dw_mpl vdw_handling, string vs_col_handling, long vl_row_handling, string vs_type, ref any raa_data[], string vs_post_type);//=====================//
//-- Không còn dùng 19/10/2015--//
//====================//

int						li_idx
date					ld_trans_date
long					ll_rtn,ll_idx,ll_row,ll_idx3,ll_in_qty,ll_out_qty
c_dwservice			lc_dwsr
t_transaction		lt_transaction

string ls_sql,ls_where

//ld_trans_date = date(right(string(raa_data[9]),len(string(raa_data[9]))-2))
//	iw_display.dynamic f_get_transaction(lt_transaction)
//	rds_item_balance.dataobject = 'ds_item_balance'
//	rds_item_balance.f_settransobject(lt_transaction)
//	if isnull(raa_data[7]) then raa_data[7] = '@'
//	if isnull(raa_data[8]) then raa_data[8] = '@'
//	ll_row = rds_item_balance.retrieve(raa_data[1],raa_data[2],raa_data[3],raa_data[4],raa_data[5],raa_data[6],raa_data[7],raa_data[8],ld_trans_date )
//	rds_item_balance.setsort( 'BALANCE_DATE asc')
//	rds_item_balance.sort( )
//	if raa_data[7] = '@' then setnull(raa_data[7])
//	if raa_data[8] = '@' then setnull(raa_data[8])
//	if ll_row > 0 then
//		if ll_row = 1 then
//			if ld_trans_date = date(rds_item_balance.getitemdatetime( ll_row, 'BALANCE_DATE') ) then
//				if upper(vs_type) = 'IN' then
//					ll_in_qty =  rds_item_balance.getitemnumber(ll_row,'in_qty')
//					if isnull(ll_in_qty) then ll_in_qty = 0
//					if vs_post_type = 'unpost' then
//						ll_in_qty = ll_in_qty + (vdw_handling.getitemnumber( vl_row_handling,vs_col_handling) * -1)
//					else
//						ll_in_qty = ll_in_qty + vdw_handling.getitemnumber( vl_row_handling,vs_col_handling)
//					end if
//					rds_item_balance.setitem( ll_row,'in_qty',ll_in_qty )
//				else
//					ll_out_qty = rds_item_balance.getitemnumber(ll_row,'out_qty')
//					if isnull(ll_out_qty) then ll_out_qty = 0
//					if vs_post_type = 'unpost' then
//						ll_out_qty = ll_out_qty + (vdw_handling.getitemnumber( vl_row_handling,vs_col_handling) * -1)
//					else
//						ll_out_qty = ll_out_qty + vdw_handling.getitemnumber( vl_row_handling,vs_col_handling)
//					end if
//					rds_item_balance.setitem( ll_row,'out_qty',ll_out_qty )
//				end if
//				rds_item_balance.setitem( ll_row, 'close_qty',rds_item_balance.getitemnumber( ll_row, 'open_qty') + (rds_item_balance.getitemnumber( ll_row,'in_qty')) - (rds_item_balance.getitemnumber( ll_row,'out_qty')))
//			else
//				if upper(vs_type) = 'IN' then
//					raa_data[10] = vdw_handling.getitemnumber( vl_row_handling,vs_col_handling)
//					raa_data[11] = 0
//				else
//					raa_data[10] = 0
//					raa_data[11] = vdw_handling.getitemnumber( vl_row_handling,vs_col_handling)
//				end if
//				ll_rtn = this.f_insert_item_balance(rds_item_balance ,raa_data, ld_trans_date)
//				if ll_rtn = -1 then return -1
//			end if
//		else
//			if ld_trans_date <> date(rds_item_balance.getitemdatetime( 1, 'BALANCE_DATE') ) then
//				if upper(vs_type) = 'IN' then
//					raa_data[10] = vdw_handling.getitemnumber( vl_row_handling,vs_col_handling)
//					raa_data[11] = 0
//				else
//					raa_data[10] = 0
//					raa_data[11] = vdw_handling.getitemnumber( vl_row_handling,vs_col_handling)
//				end if
//				ll_rtn = this.f_insert_item_balance(rds_item_balance ,raa_data, ld_trans_date)
//				if ll_rtn = -1 then return -1
//				for ll_idx3 = 2 to ll_row + 1
//					rds_item_balance.setitem( ll_idx3, 'open_qty',rds_item_balance.getitemnumber( ll_idx3 - 1, 'close_qty') )
//					rds_item_balance.setitem( ll_idx3, 'close_qty',rds_item_balance.getitemnumber( ll_idx3, 'open_qty') + rds_item_balance.getitemnumber( ll_idx3, 'in_qty') - rds_item_balance.getitemnumber( ll_idx3, 'out_qty'))
//				next
//			elseif ld_trans_date = date(rds_item_balance.getitemdatetime( 1, 'BALANCE_DATE') ) then
//				for ll_idx3 = 1 to ll_row
//					if ll_idx3 = 1 then
//						if upper(vs_type) = 'IN' then
//							ll_in_qty =  rds_item_balance.getitemnumber(ll_idx3,'in_qty')
//							if isnull(ll_in_qty) then ll_in_qty = 0
//							if vs_post_type = 'unpost' then
//								rds_item_balance.setitem( ll_idx3,'in_qty',ll_in_qty + (vdw_handling.getitemnumber( vl_row_handling,vs_col_handling) * -1))
//							else
//								rds_item_balance.setitem( ll_idx3,'in_qty',ll_in_qty + vdw_handling.getitemnumber( vl_row_handling,vs_col_handling) )
//							end if
//						else
//							if vs_post_type = 'unpost' then
//								rds_item_balance.setitem( ll_idx3,'out_qty',ll_in_qty + (vdw_handling.getitemnumber( vl_row_handling,vs_col_handling) * -1) )
//							else
//								rds_item_balance.setitem( ll_idx3,'out_qty',ll_in_qty + vdw_handling.getitemnumber( vl_row_handling,vs_col_handling)  )
//							end if
//						end if
//						rds_item_balance.setitem( ll_idx3, 'close_qty',rds_item_balance.getitemnumber( ll_idx3, 'open_qty') + rds_item_balance.getitemnumber( ll_idx3, 'in_qty') - rds_item_balance.getitemnumber( ll_idx3, 'out_qty'))
//					else
//						rds_item_balance.setitem( ll_idx3, 'open_qty',rds_item_balance.getitemnumber( ll_idx3 - 1, 'close_qty') )
//						rds_item_balance.setitem( ll_idx3, 'close_qty',rds_item_balance.getitemnumber( ll_idx3, 'open_qty') + rds_item_balance.getitemnumber( ll_idx3, 'in_qty') - rds_item_balance.getitemnumber( ll_idx3, 'out_qty'))
//					end if
//				next
//			end if
//		end if
//	elseif ll_row = 0 then
//		if upper(vs_type) = 'IN' then
//			raa_data[10] = vdw_handling.getitemnumber( vl_row_handling,vs_col_handling)
//			raa_data[11] = 0
//		else
//			raa_data[10] = 0
//			raa_data[11] = vdw_handling.getitemnumber( vl_row_handling,vs_col_handling)
//		end if
//		if isnull(raa_data[6]) then return 0
//		ll_rtn = this.f_insert_item_balance(rds_item_balance ,raa_data, ld_trans_date)
//		if ll_rtn = -1 then return -1
//	else
//		return -1
//	end if
return 1
end function

public function integer f_get_trans_date (ref date rd_trans_date);
t_dw_mpl		ldw_main

ldw_main = this.iw_display.f_get_dwmain( )

rd_trans_date = date(ldw_main.getitemdatetime(ldw_main.getrow( ) , 'trans_date'))
if isnull(rd_trans_date) or string(rd_trans_date,'ddmmyyyy') = '01011900' then
	gf_messagebox('m.b_doc.f_get_trans_date.01','Thông báo','Chưa có ngày ghi sổ','exclamation','ok',1)
	return -1
end if
return 1

end function

public function integer f_get_address (double vdb_object_id, string vs_address_type, ref string rs_address);/***************************************
Lấy địa chỉ của object_id truyền vào
	return 1: thành công
			 -1: lỗi
****************************************/
t_ds_db		lds_address
double		ldb_id
string			ls_object_code
long			ll_row,ll_find,ll_rtn
any			laa_data[]

lds_address = create t_ds_db
lds_address.dataobject = 'd_address_form'
lds_address.f_settransobject( SQLCA)
select case obj.object_ref_table
                when 'CUSTOMER' then cus.id
                when 'VENDOR' then ven.id
			  when 'PROSPECT' then pro.id
         end id , obj.code into :ldb_id,:ls_object_code
from object obj 
		left join customer cus on cus.object_ref_id = obj.id
		left join vendor ven on ven.object_ref_Id = obj.id
		left join prospect pro on pro.object_ref_id = obj.id
where obj.id = :vdb_object_id using SQLCA;
if SQLCA.sqlcode = 0 then
	laa_data[1] = ldb_id
	lds_address.f_add_where( 'object_ref_id;', laa_data)
	ll_row = lds_address.retrieve( )
	if ll_row > 0 then
		//lấy địa chỉ theo type truyền vào hoặc all , nếu không có thì lấy địa chỉ còn lại
		ll_find = lds_address.find( "upper(PURPOSE) = '" +upper(vs_address_type)+"'"+" OR  upper(PURPOSE) = 'ALL'",1 ,ll_row )
		if ll_find = 0 then ll_find = lds_address.find( "upper(PURPOSE) <> '" +upper(vs_address_type)+"'",1 ,ll_row )
		if ll_find > 0 then
			rs_address = lds_address.getitemstring( ll_find, 'address')
			if isnull(rs_address) or trim(rs_address)='' then 
				ll_rtn = -1 
			else
				destroy lds_address
				return 1
			end if
		else
			ll_rtn = -1
		end if
	else
		ll_rtn = -1
	end if
else
	// object_id không phải là KH/NCC
	messagebox('Thông báo','b_doc.f_get_address(line:46)')
	destroy lds_address
	return -1
end if
if ll_rtn = -1 then 
	gf_messagebox('m.b_doc.f_get_address.01','Thông báo','KH/NCC '+ls_object_code+' chưa nhập địa chỉ ','exclamation','ok',1)
	destroy lds_address
	return -1
end if

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
	ll_id = this.f_create_id( )
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
	ll_id = this.f_create_id( )
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
	if this.f_insert_loyalty_trans( ll_object_id, vs_doctype, vdb_doc_id) = -1 then return -1
next

if lds_object_trans.update(true,false) = -1 then
	rollback using rt_transaction;
	destroy lds_object_trans
	return -1
end if
destroy lds_object_trans
return 1
	
end function

public function integer f_update_value_matching (ref datastore rds_matching, datawindow vdw_modify, long vl_currentrow, string vs_t_column[], string vs_matching_column[]);/*===========ket qua tra ve============
//	0: khong lam gi het
//	1:thanh cong
//	-1: loi
================================*/

double			ldb_f_id
int					li_col,li_row,li_row2
long 				li_rnt, ll_find
decimal			ldc_amount[],ldc_sum_matching_amount[],ldc_sum_f_amount[], ldc_amount_row, ldc_tax,ldc_f_amount, ldc_value[], ldc_match[]
string				ls_f_col_sum[]
transaction		lt_transaction

//if pos(vdw_modify.dataobject,'d_charge_line')>0 then //update charge line
//	for li_col=1 to upperbound(vs_t_column[])
//		ldc_amount[li_col]=vdw_modify.getitemnumber(vl_currentrow,vs_t_column[li_col])
//		rds_matching.setitem(rds_matching.rowcount(),vs_matching_column[li_col],ldc_amount[li_col]) 
//	next
//	return 1
//else  //update so tien phieu thu/chi
//	iw_display.f_get_transaction( lt_transaction)
//	ls_f_col_sum[1]='trans_amt'
//	ls_f_col_sum[2]='base_amt'
	//tinh tong tien trong ds matching va so tien tren datawindow
	if  rds_matching.rowcount()>0 then
		for li_col=1 to upperbound(vs_t_column[])
			ldc_amount[li_col]=vdw_modify.getitemnumber(vl_currentrow,vs_t_column[li_col])
			for li_row=1 to  rds_matching.rowcount()
				ldb_f_id=rds_matching.getitemnumber(li_row,'f_ref_id')
//				ldc_f_amount=rds_matching.getitemnumber(li_row,ls_f_col_sum[li_col])
//				this.f_get_amount_matching(ldb_f_id,'PAYMENT_LINE',vs_matching_column[], ldc_value[])
				if isnull(ldc_f_amount) and ids_matching.rowcount() >0 then //truong hop vua moi copy sua lai so tien
					ldc_f_amount=rds_matching.getitemnumber(li_row,vs_matching_column[li_col])
					rds_matching.setitem(li_row,vs_matching_column[li_col],ldc_f_amount - ldc_value[li_col]) //set lai gia tri match
					rds_matching.setitem(li_row,ls_f_col_sum[li_col],ldc_f_amount - ldc_value[li_col])
					ldc_sum_f_amount[li_col] += ldc_f_amount - ldc_value[li_col]
				elseif  ids_matching.rowcount() =0 then 
					ldc_match[li_col]=rds_matching.getitemnumber(li_row,vs_matching_column[li_col])
					rds_matching.setitem(li_row,ls_f_col_sum[li_col],ldc_f_amount -ldc_value[li_col]+ldc_match[li_col])
					ldc_sum_f_amount[li_col] +=ldc_f_amount -ldc_value[li_col]+ldc_match[li_col]
				else
					ldc_f_amount=rds_matching.getitemnumber(li_row,ls_f_col_sum[li_col])
					ldc_sum_f_amount[li_col] += ldc_f_amount
				end if
			next
		next
		//update so tien trong bang matching
		for li_col=1 to  upperbound(vs_matching_column[])
			/*Rào lại ngày 23/01/2015 bởi Long
			lý do theo yêu cầu của a Duy
			*/
			//	if ldc_amount[li_col] >ldc_sum_f_amount[li_col] then
			//		gf_messagebox('m.b_doc.f_update_matching_value.01','Thông báo','Số tiền nhập vào vượt quá số tiền được kết','exclamation','ok',1)
			//		return -1
			//	else
					li_row=1
						DO WHILE li_row<=rds_matching.rowcount()
							ldc_amount_row = rds_matching.getitemnumber(li_row,ls_f_col_sum[li_col])
							if ldc_amount[li_col] <=ldc_amount_row  then
								rds_matching.setitem(li_row,vs_matching_column[li_col],ldc_amount[li_col]) 
								for li_row2=li_row+1 to  rds_matching.rowcount()
									rds_matching.setitem(li_row2,vs_matching_column[li_col],0) 
								next
								exit
							else
								rds_matching.setitem(li_row,vs_matching_column[li_col],ldc_amount_row) 
								ldc_amount[li_col] =ldc_amount[li_col] - ldc_amount_row
								li_row++
							end if
					LOOP			
			//	end if
		next
		return 1
	else
		return 0
	end if
//end if
		
	






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

public function long f_unbooking (double vdb_doc_id, string vs_qty_yn, string vs_value_yn);//Hàm sửa ghi sổ chứng từ
//Tham số: vl_doc_id :id của chứng từ (document)
t_transaction	lt_transaction
t_ds_db 			lds_tmp, lds_obj_post
long				ll_rtn
date				ld_trans_date
double			ladb_related_doc_id[]

this.iw_display.f_get_transaction( lt_transaction)
//B3: Xóa bảng Trans
delete stream_value where doc_ref_id =:vdb_doc_id using lt_transaction;
if lt_transaction.sqlcode = -1 then
	gf_messagebox('m.b_doc.f_unbooking.01','Thông báo','Lỗi xóa dữ liệu:@'+lt_transaction.sqlerrtext,'stop','ok',1)
	rollback using lt_transaction;
	return -1
end if

delete ledger_trans where doc_ref_id =:vdb_doc_id using lt_transaction;
if lt_transaction.sqlcode = -1 then 
	gf_messagebox('m.b_doc.f_unbooking.01','Thông báo','Lỗi xóa dữ liệu:@'+lt_transaction.sqlerrtext,'stop','ok',1)
	rollback using lt_transaction;
	return -1
end if

delete object_trans where doc_ref_id =:vdb_doc_id using lt_transaction;
if lt_transaction.sqlcode = -1 then 
	gf_messagebox('m.b_doc.f_unbooking.01','Thông báo','Lỗi xóa dữ liệu:@'+lt_transaction.sqlerrtext,'stop','ok',1)
	rollback using lt_transaction;
	return -1
end if


if this.f_get_trans_date( ld_trans_date) = -1 then return -1
if isnull(ld_trans_date) then
	gf_messagebox('m.b_doc.f_booking.02','Thông báo','Ngày giao dịch chưa có','exclamation','ok',1)
	return -1
end if

//-- cập nhật object balance --//
//-- update object_balance đối tượng Nợ--//
lds_obj_post = create t_ds_db
lds_obj_post.dataobject = 'ds_obj_balance_post_dr'
if this.f_insert_object_balance( vdb_doc_id,  ld_trans_date, lt_transaction, lds_obj_post, 'unpost',gs_sob) <> 1 then
	destroy lds_obj_post
	return -1	
end if
//-- update ledger_balance đối tượng Nợ--//
lds_obj_post.dataobject = 'ds_ledger_balance_post_dr'
if this.f_insert_object_balance( vdb_doc_id,  ld_trans_date, lt_transaction, lds_obj_post, 'unpost',gs_sob) <> 1 then
	destroy lds_obj_post
	return -1	
end if
//-- update object_balance đối tượng Có--//
lds_obj_post.dataobject = 'ds_obj_balance_post_cr'
if this.f_insert_object_balance( vdb_doc_id,  ld_trans_date, lt_transaction, lds_obj_post, 'unpost',gs_sob) <> 1 then
	destroy lds_obj_post
	return -1	
end if
//-- update ledger_balance đối tượng Có--//
lds_obj_post.dataobject = 'ds_ledger_balance_post_cr'
if this.f_insert_object_balance( vdb_doc_id,  ld_trans_date, lt_transaction, lds_obj_post, 'unpost',gs_sob) <> 1 then
	destroy lds_obj_post
	return -1	
end if

//-- cập nhật lại bảng item_balance --//
if this.f_booking_item(lt_transaction, ld_trans_date, 'unpost', vs_qty_yn, vs_value_yn, ladb_related_doc_id[]) = -1 then
	return -1
end if
//-- xóa post line --//
delete post_line where doc_id =:vdb_doc_id using lt_transaction;
if lt_transaction.sqlcode = -1 then
	gf_messagebox('m.b_doc.f_unbooking.01','Thông báo','Lỗi xóa dữ liệu:@'+lt_transaction.sqlerrtext,'stop','ok',1)
	rollback using lt_transaction;
	return -1
end if

destroy lds_tmp
destroy lds_obj_post
return ll_rtn
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

t_ds_db			lds_item_balance, lds_item_open_bal
b_obj_instantiate	lbo_ins

lds_item_balance = create t_ds_db
lds_item_balance.dataobject = 'ds_item_balance'
lds_item_balance.setsort('balance_date a')
lds_item_balance.f_settransobject(rt_transaction)
lds_item_balance.f_set_retrieve_args( vaa_arg[])

lbo_ins.f_get_stock_uom(double(vaa_arg[1]) , ldb_stock_uom, ls_uom_code)
ldb_stock_round = ic_unit_instance.f_get_round_id( ldb_stock_uom, double(vaa_arg[1]), 'item')

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
		gf_messagebox('m.b_doc.f_update_item_balance.01','Thông báo','Lỗi retrieve ds_item_open_balance:@'+sqlca.sqlerrtext,'stop','ok',1)
		return -1
	end if
	destroy lds_item_open_bal
	//-- tính close  --//	
	if upper(vs_in_out) = 'IN' then
		ldb_close_qty = ldb_open_qty + vdb_qty
		ldb_close_qty = ic_unit_instance.f_round( rt_transaction, ldb_stock_round,ldb_close_qty)
		ldb_close_value = ldb_open_value + vdb_base_value
	else
		ldb_close_qty = ldb_open_qty - vdb_qty
		ldb_close_qty = ic_unit_instance.f_round( rt_transaction, ldb_stock_round,ldb_close_qty)
		ldb_close_value = ldb_open_value - vdb_base_value		
	end if
	//-- kiểm tra close cho phép âm --//
	if vs_balance_control = 'negative_not_allow'   then
		if ldb_close_qty < 0 then

			if isnull(ls_tmpStr) or ls_tmpStr = '' then					
				ls_tmpStr =  lbo_ins.f_get_object_code(vaa_arg[1])
				gf_messagebox('m.b_doc.f_update_item_balance.02','Thông báo','Mã hàng sau xuất âm số lượng: @'+ls_tmpStr, 'exclamation','ok',1)
			else
				ls_item_code =  lbo_ins.f_get_object_code(vaa_arg[1])
				gf_messagebox('m.b_doc.f_update_item_balance.03','Thông báo','Mã hàng sau xuất âm số lượng: @'+ls_item_code+'- Seri: @'+ls_tmpStr, 'exclamation','ok',1)
			end if
			rollback using rt_transaction;				
			destroy lds_item_balance			

			return -1
		end if
	end if
	ll_insertrow = this.f_insert_item_balance(lds_item_balance ,vaa_arg[], vd_trans_date, vs_in_out, vdb_qty, vdb_base_value, ldb_open_qty, ldb_open_value, ldb_close_qty, ldb_close_value)
	
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
				ll_insertrow = this.f_insert_item_balance(lds_item_balance ,vaa_arg[], ld_balance_date, vs_in_out, vdb_qty, vdb_base_value, ldb_open_qty, ldb_open_value, ldb_close_qty_tmp, ldb_close_value_tmp)
			end if
			//-- insert balance của tất cả item khác từ max_date tới trans_date --//
			if this.f_update_item_balance_all(rt_transaction, vaa_arg[], ld_balance_date) = -1 then return -1
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
					ldb_close_qty = ic_unit_instance.f_round( rt_transaction, ldb_stock_round,ldb_close_qty)
					ldb_close_value = ldb_open_value + vdb_base_value
				else
					ldb_close_qty = ldb_open_qty - vdb_qty
					ldb_close_qty = ic_unit_instance.f_round( rt_transaction, ldb_stock_round,ldb_close_qty)
					ldb_close_value = ldb_open_value - vdb_base_value		
				end if				
			else
				setnull(vdb_qty)
				setnull(vdb_base_value)
				ldb_close_qty = ldb_open_qty 
				ldb_close_qty = ic_unit_instance.f_round( rt_transaction, ldb_stock_round,ldb_close_qty)
				ldb_close_value = ldb_open_value 	
			end if
			//-- kiểm tra close qty, value --//
			if vs_balance_control = 'negative_not_allow'  then
				if ldb_close_qty < 0 then
					if isnull(ls_tmpStr) then					
						ls_tmpStr = lbo_ins.f_get_object_code(vaa_arg[1])
						gf_messagebox('m.b_doc.f_update_item_balance.02','Thông báo','Mã hàng sau xuất âm số lượng:@'+ls_tmpStr, 'exclamation','ok',1)
					else
						ls_item_code =lbo_ins.f_get_object_code(vaa_arg[1])
						gf_messagebox('m.b_doc.f_update_item_balance.03','Thông báo','Mã hàng sau xuất âm số lượng:@'+ls_item_code+'- Seri:@'+ls_tmpStr, 'exclamation','ok',1)
					end if
					rollback using rt_transaction;				
					destroy lds_item_balance			
					return -1
				end if
			end if					
			ll_insertrow = this.f_insert_item_balance(lds_item_balance ,vaa_arg[], ld_balance_date, vs_in_out, vdb_qty, vdb_base_value, ldb_open_qty, ldb_open_value, ldb_close_qty, ldb_close_value)
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
		ldb_close_qty = ic_unit_instance.f_round( rt_transaction, ldb_stock_round,ldb_close_qty)
		ldb_close_value = ldb_open_value + ldb_in_value - ldb_out_value		
		//-- kiểm tra close qty, value --//
		if vs_balance_control = 'negative_not_allow'  then			
			if ldb_close_qty < 0 then
				if isnull(ls_tmpStr) then					
					ls_tmpStr = lbo_ins.f_get_object_code(vaa_arg[1])
					gf_messagebox('m.b_doc.f_update_item_balance.02','Thông báo','Mã hàng sau xuất âm số lượng:@'+ls_tmpStr, 'exclamation','ok',1)
				else
					ls_item_code = lbo_ins.f_get_object_code(vaa_arg[1])
					gf_messagebox('m.b_doc.f_update_item_balance.03','Thông báo','Mã hàng sau xuất âm số lượng:@'+ls_item_code+'- Seri:@'+ls_tmpStr, 'exclamation','ok',1)
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
		ic_unit_instance.f_get_base_cur( ldb_base_curID, ls_base_curCode, ls_base_curName)
		ldb_baseCur_roundID = ic_unit_instance.f_get_round_id(ldb_base_curID , 0, 'bc')		
		ldb_moving_avg = ic_unit_instance.f_round( rt_transaction, ldb_baseCur_roundID, ldb_moving_avg)
	elseif ldb_close_qty < 0 then
		ldb_moving_avg =  abs(ldb_close_value)/abs(ldb_close_qty) 
		ic_unit_instance.f_get_base_cur( ldb_base_curID, ls_base_curCode, ls_base_curName)
		ldb_baseCur_roundID = ic_unit_instance.f_get_round_id(ldb_base_curID , 0, 'bc')		
		ldb_moving_avg = ic_unit_instance.f_round( rt_transaction, ldb_baseCur_roundID, ldb_moving_avg)		
	else 
		ldb_moving_avg = 0
	end if
	if ldb_moving_avg > 0 or ( ldb_moving_avg = 0 and ldb_close_qty > 0 ) then
		if lbo_ins.f_update_moving_avg(vaa_arg[1],ldb_moving_avg, rt_transaction)= -1 then 
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
		gf_messagebox('m.b_doc.f_update_object_balance.03','Thông báo', rt_transaction.SQLErrText ,'stop','ok',1)
		return -1		
	end if
	gf_messagebox('m.b_doc.f_update_object_balance.03','Thông báo', rt_transaction.SQLErrText ,'stop','ok',1)	
	rollback using rt_transaction;
	destroy lds_item_balance
	return -1
end if
lds_item_balance.resetupdate( )

destroy lds_item_balance

return 1
	
end function

public function integer f_set_qty_sku (ref t_transaction rt_transaction, ref t_dw_mpl rdw_item, double vdb_row, ref t_dw_mpl rdw_item_lot, double vdb_row_lot, string vs_in_out, ref double rdb_qty_sku, double rdb_round_diff);/**********************************************************************
Chức năng: Cập nhật cột số lượng theo đơn vị tồn kho (SKU) và trả về số cập nhật
(Không còn sử dụng)
----------------------------------------------------------------------------------------------
Tham số: 
			- rt_transaction : connection
			- rdw_item: datawindow chứa mã hàng giao dịch
			- vdb_row: số row đang xét
			- rdw_item_lot: datawindow chứa lot giao dịch
			- vdb_row_lot: số row lot đang xét			
			- rdb_qty_sku: số quy đổi theo đơn vị SKU
Return: 1 thành công, -1 lỗi
==============================================================*/
string					ls_item_column[], ls_item_lot_column[]
double				ldb_qty, ldb_qty_sku, ldb_trans_unit, ldb_item_id, ldba_convert_data[], ldb_round_diff
int						li_rtn
c_string				lc_string



//-- Kiểm tra dw --//
if not isvalid(rdw_item) then 
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

//-- kiểm tra cài đặt --//
if upperbound(istr_streamvalue[]) = 0 then
	gf_messagebox('m.b_doc.f_set_qty_sku.03','Thông báo','Chưa cài đặt streamvalue','exclamation','ok',1)
	rollback using rt_transaction;
	return -1	
end if

//-- kiểm tra cài đặt streamvalue cột dw item --//
if lc_string.f_stringtoarray( istr_streamvalue[1].s_item_column, ';', ls_item_column[]) < 5 then
	gf_messagebox('m.b_doc.f_set_qty_sku.04','Thông báo','Cài đặt cột item trong structure streamvalue chưa đúng','exclamation','ok',1)
	rollback using rt_transaction;
	return -1		
end if
//-- Lấy item giao dịch --//
ldb_item_id = rdw_item.getitemnumber(vdb_row,ls_item_column[1])
if isnull(ldb_item_id) or ldb_item_id = 0 then
	gf_messagebox('m.b_doc.f_set_qty_sku.05','Thông báo','Không có mã hàng trong giao dịch','exclamation','ok',1)
	rollback using rt_transaction;
	return -1		
end if
//-- Lấy đơn vị giao dịch --//
ldb_trans_unit = rdw_item.getitemnumber(vdb_row,ls_item_column[4])
if isnull(ldb_trans_unit) or ldb_trans_unit = 0 then
	gf_messagebox('m.b_doc.f_set_qty_sku.06','Thông báo','Không tìm thấy đơn vị giao dịch','exclamation','ok',1)
	rollback using rt_transaction;
	return -1		
end if

//-- kiểm tra cài đặt streamvalue cột dw item lot --//
if lc_string.f_stringtoarray( istr_streamvalue[1].s_item_lot_column, ';', ls_item_lot_column[]) < 3 then
	gf_messagebox('m.b_doc.f_set_qty_sku.07','Thông báo','Cài đặt cột item lot trong structure streamvalue chưa đúng','exclamation','ok',1)
	rollback using rt_transaction;
	return -1		
end if
//-- lấy số lượng --//
ldb_qty = rdw_item_lot.getitemnumber(vdb_row_lot,ls_item_lot_column[1])
if isnull(ldb_qty) then  ldb_qty = 0 


//-- tính số lượng quy đổi đơn vị --//
li_rtn = ic_unit_instance.f_get_data_4_conversion_unit( ldb_trans_unit, ldb_item_id, ldb_qty, ldba_convert_data[])

//-- cập nhật chênh lệch quy đổi --//
if li_rtn = 0 then
	rdw_item_lot.setitem(vdb_row_lot,ls_item_lot_column[1]+'_sku', ldb_qty)
	rdb_qty_sku = ldb_qty
elseif li_rtn = 1 then

	ldb_round_diff = ic_unit_instance.f_get_round_diff( ldb_item_id)
	if isnull(ldb_round_diff) then ldb_round_diff =0
	if upper(vs_in_out) = 'OUT' then
		ldb_qty_sku = ldba_convert_data[1] + ldba_convert_data[2] - ldb_round_diff
	else
		ldb_qty_sku = ldba_convert_data[1] + ldba_convert_data[2] + ldb_round_diff
	end if
	rdb_qty_sku = ic_unit_instance.f_round( rdw_item , ldba_convert_data[4], ldb_qty_sku)
	if isnull(rdb_qty_sku) then rdb_qty_sku = 0
	rdw_item_lot.setitem(vdb_row_lot,ls_item_lot_column[1]+'_sku', rdb_qty_sku)
	
	ldb_round_diff = ldb_qty_sku - rdb_qty_sku
	if upper(vs_in_out) = 'OUT' then
		rdb_round_diff = - ldb_round_diff
	else
		rdb_round_diff = ldb_round_diff
	end if	

else
	rollback using rt_transaction;
	return -1
end if
//-- update cot sku --//
//if rdw_item_lot.update(true,false) = -1 then
//	gf_messagebox('m.b_doc.f_set_qty_sku.08','Thông báo','Không cập nhật được số lượng theo đơn vị tồn kho:@' +rt_transaction.sqlerrtext ,'exclamation','ok',1)
//	rollback using rt_transaction;
//	return -1
//end if
//rdw_item_lot.resetupdate()
return 1
end function

protected function long f_get_ds_matching (ref t_ds_db rds_matching, datawindow vdw_handled, long vl_row, boolean vb_f_matching, t_transaction vt_transaction);c_dwservice		lc_svr
t_dw_mpl		ldw_main
c_string			lc_string
window			lw_parent
c_sql				lc_sql
string				ls_sql,ls_original_where,ls_id,ls_where,ls_modify,ls_rtn,ls_filter
long				ll_rtn
any				laa_data[]
int					li_idx

rds_matching.dataobject = 'ds_matching'
rds_matching.f_settransobject( vt_transaction)
if not vb_f_matching then
	if vl_row > 0 then
		laa_data[1] = vdw_handled.getitemnumber(vl_row,'id')
		rds_matching.f_add_where( 't_ref_id', laa_data[])
	elseif vl_row = 0 and vdw_handled.rowcount() > 0 then
		vdw_handled.dynamic f_getparentwindow(lw_parent)
		ldw_main = lw_parent.dynamic f_get_dwmain()
		laa_data[1] = ldw_main.getitemnumber(ldw_main.getrow( ) ,'id')
		rds_matching.f_add_where( 't_doc_id', laa_data[])
	elseif vl_row = 0 and vdw_handled.rowcount() = 0 then
		return 0
	end if
else
	if vl_row > 0 then
		laa_data[1] = vdw_handled.getitemnumber(vl_row,'id')
		rds_matching.f_add_where( 'f_ref_id', laa_data[])
	elseif vl_row = 0 and vdw_handled.rowcount() > 0 then
		vdw_handled.dynamic f_getparentwindow(lw_parent)
		ldw_main = lw_parent.dynamic f_get_dwmain()
		laa_data[1] = ldw_main.getitemnumber(ldw_main.getrow( ) ,'id')
		rds_matching.f_add_where( 'f_doc_id', laa_data[])
	elseif vl_row = 0 and vdw_handled.rowcount() = 0 then
		return 0
	end if
end if
return rds_matching.retrieve( )
end function

public function decimal f_get_pur_price (double vdb_pur_rtn_line_id, t_transaction vt_transaction);decimal 	ldc_price,ldc_qty_sku
double	ldb_pur_id
string 	ls_doc_code,ls_status
					 
select pur.id,pur.price,pur.qty_sku into :ldb_pur_id,:ldc_price,:ldc_qty_sku from po_line po 
                        join matching mat on mat.f_ref_id = po.id
                        join inventory_line ivl on mat.t_ref_id = ivl.id
                        join matching mat1 on mat1.f_ref_id = ivl.id
                        join pur_invoice_line pur on mat1.t_ref_id = pur.id
                        join matching mat2 on mat2.f_ref_id = po.id
                        join po_line po1 on mat2.t_ref_id = po1.id
                        join matching mat3 on mat3.f_ref_id = po1.id
                        join inventory_line ivl1 on mat3.t_ref_id = ivl1.id
                        join matching mat4 on mat4.f_ref_id = ivl1.id
                        join pur_invoice_line pur1 on mat4.t_ref_id = pur1.id
where pur1.id = :vdb_pur_rtn_line_id using vt_transaction;
if isnull(ldc_qty_sku) then ldc_qty_sku = 0
if vt_transaction.sqlcode = 0 then
	if ldc_qty_sku = 0 then 
		select doc.status,doc.code into :ls_status,:ls_doc_code from document doc
					  join pur_invoice_line pur on pur.object_ref_id = doc.version_id 
		where pur.id = :ldb_pur_id using SQLCA;
		if SQLCA.sqlcode <> 0 then
			messagebox('Thông báo','b_doc.f_get_sal_price(line:24)')
			return -1
		else
			if ls_status <> 'booked' then
				gf_messagebox('m.b_doc.f_get_sal_price.01','Thông báo','Hóa đơn :'+ls_doc_code + 'chưa ghi sổ','exclamation','ok',1)
				return -1
			end if
		end if
	end if
	return ldc_price
elseif vt_transaction.sqlcode = 100 then
	select pur.id,pur.price,pur.qty_sku into :ldb_pur_id,:ldc_price,:ldc_qty_sku from po_line po 
                        join matching mat on mat.f_ref_id = po.id
                        join pur_invoice_line pur on mat.t_ref_id = pur.id
                        join matching mat2 on mat2.f_ref_id = po.id
                        join po_line po1 on mat2.t_ref_id = po1.id
                        join matching mat3 on mat3.f_ref_id = po1.id
                        join pur_invoice_line pur1 on mat3.t_ref_id = pur1.id
	where pur1.id = :vdb_pur_rtn_line_id using vt_transaction;
	if vt_transaction.sqlcode = 0 then
		select doc.status,doc.code into :ls_status,:ls_doc_code from document doc
				  join pur_invoice_line pur on pur.object_ref_id = doc.version_id 
		where pur.id = :ldb_pur_id using SQLCA;
		if SQLCA.sqlcode <> 0 then
			messagebox('Thông báo','b_doc.f_get_sal_price(line:46)')
		else
			if ls_status <> 'booked' then
				gf_messagebox('m.b_doc.f_get_sal_price.02','Thông báo','Hóa đơn :'+ls_doc_code + 'chưa ghi sổ','exclamation','ok',1)
				return -1
			end if
		end if
//	else
	end if
	return ldc_price
else
	messagebox('Thông báo','b_doc.f_get_sal_price(line:59)')
end if
return 0
end function

public function integer f_find_trans_setup_account_cr (t_ds_db vds_trans_setup, string vs_posting_type, double vdb_dr_object_id, double vdb_cr_object_id, any va_cr_criteria_data, string vs_cr_coltype, ref s_str_post_account rstr_post_account, ref string vs_dr_obj_type, ref string vs_cr_obj_type, double vdb_cr_post_group);/**************************
Không còn dùng
=======================*/

string		ls_find1, ls_find2, ls_find3, ls_criteria_value,ls_obj_type_offset,ls_setup_type_offset, ls_dwo_offset
long		ll_found_row
boolean	lb_ok

b_rule		lb_rule


if vs_posting_type = 'NULL' then
	ls_find1 += " isnull(posting_type)" 
else
	ls_find1 += " posting_type ='" +vs_posting_type+"'"
end if

//-- Tìm tài khoản Có --//
if upper(vs_cr_obj_type) = 'ACCOUNT' then 
	rstr_post_account.db_cr_account = vdb_cr_object_id
elseif vs_cr_obj_type <> '' then
	//-- Tìm chính xác đối tượng --//
	ls_find2 = " and cr_obj_type ='"+ upper(vs_cr_obj_type) +"'"
	ls_find3 = ls_find1 + ls_find2 + " and CR_OBJ_INSTANCE_ID ="+string(vdb_cr_object_id) 
	ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())
	if ll_found_row > 0 then
		if vs_cr_coltype <> '' then
			DO while not lb_ok and ll_found_row > 0
				ls_criteria_value = vds_trans_setup.getitemstring(ll_found_row, 'CR_VALUE_CRITERIAL')
				if isnull(ls_criteria_value) then ls_criteria_value = '()'					
				lb_ok =  lb_rule.f_is_criteria_ok( string(va_cr_criteria_data), ls_criteria_value, vs_cr_coltype)
				if lb_ok then exit
				ll_found_row = vds_trans_setup.find(ls_find3, ll_found_row+1, vds_trans_setup.rowcount()+1)
			LOOP
		end if	
	elseif ll_found_row = 0 then
		//-- Tìm theo posting group --//
		ls_find3 = ls_find1 + ls_find2+ " and CR_POSTING_GROUP ="+string(vdb_cr_post_group)
		ls_find3 +=  " and CR_SETUP_TYPE = 'group'"
		ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())
		if  ll_found_row > 0 then
			if vs_cr_coltype <> '' then
				DO while not lb_ok and ll_found_row > 0
					ls_criteria_value = vds_trans_setup.getitemstring(ll_found_row, 'CR_VALUE_CRITERIAL')
					if isnull(ls_criteria_value) then ls_criteria_value = '()'					
					lb_ok =  lb_rule.f_is_criteria_ok( string(va_cr_criteria_data), ls_criteria_value, vs_cr_coltype)			
					if lb_ok then exit
					ll_found_row = vds_trans_setup.find(ls_find3, ll_found_row+1, vds_trans_setup.rowcount()+1)
				LOOP
			end if			
		elseif  ll_found_row = 0 then
			//-- Tìm all --//
			ls_find3 = ls_find1 + ls_find2+" and CR_SETUP_TYPE = 'all'"
			ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())
			if ll_found_row > 0 then
				if vs_cr_coltype <> '' then
					DO while not lb_ok and ll_found_row > 0
						ls_criteria_value = vds_trans_setup.getitemstring(ll_found_row, 'CR_VALUE_CRITERIAL')
						if isnull(ls_criteria_value) then ls_criteria_value = '()'						
						lb_ok =  lb_rule.f_is_criteria_ok( string(va_cr_criteria_data), ls_criteria_value, vs_cr_coltype)		
						if lb_ok then exit
						ll_found_row = vds_trans_setup.find(ls_find3, ll_found_row+1, vds_trans_setup.rowcount()+1)
					LOOP
				end if				
				if ll_found_row = 0 then
					//-- không tìm thấy --//
					return 0						
				end if
			elseif ll_found_row = 0 then
				//-- không tìm thấy --//
				return 0				
			else
				gf_messagebox('m.b_doc.f_find_setup_account.04','Thông báo','Lỗi hàm vds_trans_setup.find:b_doc.f_get_setup_account,line125','stop','ok',1)
				return -1			
			end if
		else
			gf_messagebox('m.b_doc.f_find_setup_account.05','Thông báo','Lỗi hàm vds_trans_setup.find:b_doc.f_get_setup_account,line112','stop','ok',1)
			return -1		
		end if
	else
		gf_messagebox('m.b_doc.f_find_setup_account.06','Thông báo','Lỗi hàm vds_trans_setup.find:b_doc.f_get_setup_account,line98','stop','ok',1)
		return -1
	end if
	rstr_post_account.db_cr_object_id = vdb_cr_object_id
	rstr_post_account.db_cr_account = vds_trans_setup.getitemnumber(ll_found_row, 'CR_ACCT_ID')
	rstr_post_account.db_cr_subaccount = vds_trans_setup.getitemnumber(ll_found_row, 'CR_SUBACCT_ID')
	rstr_post_account.s_trans_text = vds_trans_setup.getitemstring(ll_found_row, 'trans_text')
	ls_obj_type_offset = vds_trans_setup.getitemstring(ll_found_row, 'dr_obj_type')
	ls_obj_type_offset = vs_dr_obj_type
	ls_dwo_offset = vds_trans_setup.getitemstring(ll_found_row, 'dr_dw_object')	
	ls_setup_type_offset = vds_trans_setup.getitemstring(ll_found_row, 'DR_SETUP_TYPE')
	if (lower(ls_obj_type_offset) = 'account' or ls_setup_type_offset = 'specific') and (ls_dwo_offset='' or isnull(ls_dwo_offset)) then
		rstr_post_account.db_dr_object_id = vds_trans_setup.getitemnumber(ll_found_row, 'DR_OBJ_INSTANCE_ID')
		if lower(ls_obj_type_offset) <> 'account' then vs_dr_obj_type = vds_trans_setup.getitemstring(ll_found_row, 'dr_obj_type')
		rstr_post_account.db_dr_account = vds_trans_setup.getitemnumber(ll_found_row, 'DR_ACCT_ID')
		rstr_post_account.db_dr_subaccount = vds_trans_setup.getitemnumber(ll_found_row, 'DR_SUBACCT_ID')
		rstr_post_account.s_trans_text = vds_trans_setup.getitemstring(ll_found_row, 'trans_text')
		return 2
	end if
end if
//-- trường hợp cả Nợ và Có đều cài đặt object_type là account --//
if vs_dr_obj_type = '' and vs_cr_obj_type = '' then
	ll_found_row = vds_trans_setup.find(ls_find1, 1, vds_trans_setup.rowcount())
	if ll_found_row > 0 then
		rstr_post_account.db_dr_object_id =vdb_dr_object_id
		vs_dr_obj_type = vds_trans_setup.getitemstring(ll_found_row, 'dr_obj_type')
		rstr_post_account.db_cr_object_id = vdb_cr_object_id
		vs_cr_obj_type = vds_trans_setup.getitemstring(ll_found_row, 'cr_obj_type')		
		rstr_post_account.db_dr_account = vds_trans_setup.getitemnumber(ll_found_row, 'DR_ACCT_ID')
		rstr_post_account.db_cr_subaccount = vds_trans_setup.getitemnumber(ll_found_row, 'dr_obj_type')				
		rstr_post_account.db_cr_account = vds_trans_setup.getitemnumber(ll_found_row, 'CR_ACCT_ID')
		rstr_post_account.db_cr_subaccount = vds_trans_setup.getitemnumber(ll_found_row, 'CR_SUBACCT_ID')		
		rstr_post_account.s_trans_text = vds_trans_setup.getitemstring(ll_found_row, 'trans_text')
		return 2
	else
		gf_messagebox('m.b_doc.f_find_setup_account.07','Thông báo','Không tìm thấy tài khoản ghi sổ trong cài đặt','exclamation','ok',1)
		return 0							
	end if
end if
return 1
end function

public function integer f_find_trans_setup_account_dr (t_ds_db vds_trans_setup, string vs_posting_type, double vdb_dr_object_id, double vdb_cr_object_id, any va_dr_criteria_data, string vs_dr_coltype, ref s_str_post_account rstr_post_account, ref string vs_dr_obj_type, ref string vs_cr_obj_type, double vdb_dr_post_group);/**************************
Không còn dùng
=======================*/

string		ls_find1, ls_find2, ls_find3, ls_criteria_value,ls_obj_type_offset, ls_setup_type_offset, ls_dwo_offset
long		ll_found_row
boolean	lb_ok

b_rule		lb_rule


if vs_posting_type = 'NULL' then
	ls_find1 += " isnull(posting_type)" 
else
	ls_find1 += " posting_type ='" +vs_posting_type+"'"
end if
//-- Tìm tài khoản Nợ --//
if upper(vs_dr_obj_type) = 'ACCOUNT' then 
	rstr_post_account.db_dr_account = vdb_dr_object_id
elseif vs_dr_obj_type <> '' then
	//-- Tìm chính xác đối tượng --//
	ls_find2 = " and dr_obj_type ='"+ upper(vs_dr_obj_type) +"'"
	ls_find3 = ls_find1 + ls_find2 + " and DR_OBJ_INSTANCE_ID ="+string(vdb_dr_object_id) 
	ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())
	if ll_found_row > 0 then
		if vs_dr_coltype <> ''  then
			DO while not lb_ok and ll_found_row > 0
				ls_criteria_value = vds_trans_setup.getitemstring(ll_found_row, 'DR_VALUE_CRITERIAL')
				if isnull(ls_criteria_value) then ls_criteria_value = '()'
				ls_criteria_value = ls_criteria_value
				lb_ok =  lb_rule.f_is_criteria_ok( string(va_dr_criteria_data), ls_criteria_value, vs_dr_coltype)				
				if lb_ok then exit
				ll_found_row = vds_trans_setup.find(ls_find3, ll_found_row+1, vds_trans_setup.rowcount()+1)
			LOOP
		end if
	elseif ll_found_row = 0 then
		//-- Tìm theo posting group --//
		ls_find3 = ls_find1 + ls_find2 + " and DR_POSTING_GROUP ="+string(vdb_dr_post_group)
		ls_find3 +=  " and DR_SETUP_TYPE = 'group'"
		ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())
		if  ll_found_row > 0 then
			if vs_dr_coltype <> '' then
				DO while not lb_ok and ll_found_row > 0
					ls_criteria_value = vds_trans_setup.getitemstring(ll_found_row, 'DR_VALUE_CRITERIAL')
					if isnull(ls_criteria_value) then ls_criteria_value = '()'
					ls_criteria_value = ls_criteria_value					
					lb_ok =  lb_rule.f_is_criteria_ok( string(va_dr_criteria_data), ls_criteria_value, vs_dr_coltype)	
					if lb_ok then exit
					ll_found_row = vds_trans_setup.find(ls_find3, ll_found_row+1, vds_trans_setup.rowcount()+1)
				LOOP
			end if
		elseif  ll_found_row = 0 then
			//-- Tìm all --//
			ls_find3 = ls_find1 + ls_find2 + " and DR_SETUP_TYPE = 'all'"
			ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())
			if ll_found_row > 0 then
				if vs_dr_coltype <> '' then
					DO while not lb_ok and ll_found_row > 0
						ls_criteria_value = vds_trans_setup.getitemstring(ll_found_row, 'DR_VALUE_CRITERIAL')
						if isnull(ls_criteria_value) then ls_criteria_value = '()'
						ls_criteria_value = ls_criteria_value								
						lb_ok =  lb_rule.f_is_criteria_ok( string(va_dr_criteria_data), ls_criteria_value, vs_dr_coltype)	
						if lb_ok then exit
						ll_found_row = vds_trans_setup.find(ls_find3, ll_found_row+1, vds_trans_setup.rowcount()+1)
					LOOP
				end if			
				if ll_found_row = 0 then
					return 0			
				end if
			elseif ll_found_row = 0 then
				return 0				
			else
				gf_messagebox('m.b_doc.f_find_setup_account.01','Thông báo','Lỗi hàm vds_trans_setup.find:b_doc.f_get_setup_account,line63','stop','ok',1)
				return -1			
			end if
		else
			gf_messagebox('m.b_doc.f_find_setup_account.02','Thông báo','Lỗi hàm vds_trans_setup.find:b_doc.f_get_setup_account,line50','stop','ok',1)
			return -1		
		end if
	else
		gf_messagebox('m.b_doc.f_find_setup_account.03','Thông báo','Lỗi hàm vds_trans_setup.find:b_doc.f_get_setup_account,line36','stop','ok',1)
		return -1
	end if
	rstr_post_account.db_dr_object_id = vdb_dr_object_id
	rstr_post_account.db_dr_account = vds_trans_setup.getitemnumber(ll_found_row, 'DR_ACCT_ID')
	rstr_post_account.db_dr_subaccount = vds_trans_setup.getitemnumber(ll_found_row, 'DR_SUBACCT_ID')
	rstr_post_account.s_trans_text = vds_trans_setup.getitemstring(ll_found_row, 'trans_text')
	ls_obj_type_offset = vds_trans_setup.getitemstring(ll_found_row, 'cr_obj_type')
	vs_cr_obj_type = ls_obj_type_offset
	ls_dwo_offset = vds_trans_setup.getitemstring(ll_found_row, 'cr_dw_object')
	ls_setup_type_offset = vds_trans_setup.getitemstring(ll_found_row, 'CR_SETUP_TYPE')
	if (lower(ls_obj_type_offset) = 'account' or ls_setup_type_offset = 'specific') and (ls_dwo_offset='' or isnull(ls_dwo_offset)) then
		if lower(ls_obj_type_offset) <> 'account' then vs_cr_obj_type =  vds_trans_setup.getitemstring(ll_found_row, 'cr_obj_type')
		rstr_post_account.db_cr_object_id = vds_trans_setup.getitemnumber(ll_found_row, 'CR_OBJ_INSTANCE_ID')
		rstr_post_account.db_cr_account = vds_trans_setup.getitemnumber(ll_found_row, 'CR_ACCT_ID')
		rstr_post_account.db_cr_subaccount = vds_trans_setup.getitemnumber(ll_found_row, 'CR_SUBACCT_ID')
		rstr_post_account.s_trans_text = vds_trans_setup.getitemstring(ll_found_row, 'trans_text')
		return 2
	end if
end if
//-- trường hợp cả Nợ và Có đều cài đặt object_type là account
if vs_dr_obj_type = '' and vs_cr_obj_type = '' then
	ll_found_row = vds_trans_setup.find(ls_find1, 1, vds_trans_setup.rowcount())
	if ll_found_row > 0 then
		vs_dr_obj_type =  vds_trans_setup.getitemstring(ll_found_row, 'dr_obj_type')
		rstr_post_account.db_dr_object_id = vdb_dr_object_id
		vs_cr_obj_type =  vds_trans_setup.getitemstring(ll_found_row, 'cr_obj_type')
		rstr_post_account.db_cr_object_id = vdb_cr_object_id	
		rstr_post_account.db_dr_account = vds_trans_setup.getitemnumber(ll_found_row, 'DR_ACCT_ID')
		rstr_post_account.db_cr_subaccount = vds_trans_setup.getitemnumber(ll_found_row, 'DR_SUBACCT_ID')				
		rstr_post_account.db_cr_account = vds_trans_setup.getitemnumber(ll_found_row, 'CR_ACCT_ID')
		rstr_post_account.db_cr_subaccount = vds_trans_setup.getitemnumber(ll_found_row, 'CR_SUBACCT_ID')		
		rstr_post_account.s_trans_text = vds_trans_setup.getitemstring(ll_found_row, 'trans_text')
		return 2
	else
		gf_messagebox('m.b_doc.f_find_setup_account.07','Thông báo','Không tìm thấy tài khoản ghi sổ trong cài đặt','exclamation','ok',1)
		return 0							
	end if
end if
return 1
end function

public function boolean f_is_matched_from (t_dw_mpl vdw_check, string vs_from_table);boolean 	lb_matched
long		ll_row, ll_cnt
double	ldb_id
setnull(lb_matched)

if not isvalid(vdw_check)  then return	lb_matched
if vs_from_table = '' or isnull(vs_from_table) then return  lb_matched

FOR ll_row = 1 to vdw_check.rowcount()
	ldb_id = vdw_check.getitemnumber(ll_row, 'id')
	
	select count(matching.f_ref_id) into :ll_cnt 
	from matching 
	where matching.t_ref_id = :ldb_id 
		and upper(matching.F_REF_TABLE) = upper(:vs_from_table) using sqlca;
		
	if ll_cnt > 0 then return true
NEXT
return false
end function

public function decimal f_get_return_unit_cogs (double vdb_sal_rtn_line_id);decimal 	ldc_cogs,ldc_return_cost_price,ldc_ACT_QTY_SKU, ldc_adj_amount
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
where sal1.id = :vdb_sal_rtn_line_id using sqlca;

if sqlca.sqlcode = 0 then
	if 	isnull(ldc_cogs) then ldc_cogs = 0							
	if ldc_cogs = 0 then 
		select doc.status,doc.code into :ls_status,:ls_doc_code from document doc
					  join sal_invoice_line sal on sal.object_ref_id = doc.version_id 
		where sal.id = :ldb_sal_id using SQLCA;
		if SQLCA.sqlcode <> 0 then
			messagebox('Thông báo','b_doc.f_get_sal_price(line:25)')
			return -1
		else
			if ls_status <> 'booked' then
				gf_messagebox('m.b_doc.f_get_sal_price.01','Thông báo','Hóa đơn gốc:'+ls_doc_code + 'chưa ghi sổ','exclamation','ok',1)
				return -1
			end if
		end if
	end if
elseif sqlca.sqlcode = 100 then
	select sal.id,sal.cogs,sal.ACT_QTY_SKU into :ldb_sal_id,:ldc_cogs,:ldc_ACT_QTY_SKU from so_line so 
                        join matching mat on mat.f_ref_id = so.id
                        join sal_invoice_line sal on mat.t_ref_id = sal.id               
                        join matching mat2 on mat2.f_ref_id = so.id
                        join so_line so1 on mat2.t_ref_id = so1.id
                        join matching mat4 on mat4.f_ref_id = so1.id
                        join sal_invoice_line sal1 on mat4.t_ref_id =  sal1.id using sqlca;
	
	if sqlca.sqlcode = 0 then
		if isnull(ldc_cogs) then ldc_cogs = 0
		if ldc_cogs = 0 then
			select doc.status,doc.code into :ls_status,:ls_doc_code from document doc
					  join sal_invoice_line sal on sal.object_ref_id = doc.version_id 
			where sal.id = :ldb_sal_id using SQLCA;
			if SQLCA.sqlcode <> 0 then
				messagebox('Thông báo','b_doc.f_get_sal_price(line:46)')
			else
				if ls_status <> 'booked' then
					gf_messagebox('m.b_doc.f_get_sal_price.01','Thông báo','Hóa đơn gốc:'+ls_doc_code + 'chưa ghi sổ','exclamation','ok',1)
					return -1
				end if
			end if
		end if
	elseif sqlca.sqlcode = 100 then
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
from STREAM_VALUE_ADJ where STREAM_VALUE_REF_ID = :ldb_sal_id using sqlca;
if isnull(ldc_adj_amount) then ldc_adj_amount = 0

ldc_return_cost_price = (ldc_cogs + ldc_adj_amount)/ ldc_ACT_QTY_SKU

return ldc_return_cost_price
end function

public function boolean f_check_in_serial (t_dw_mpl rpo_dw, t_dw_mpl rdw_master, string vs_editdata);//-- Đang tiến hành viết hàm kiểm tra số serial khi nhập kho--//
//--Chưa xong--//
any				laa_data[]
long				ll_insertrow,ll_find,ll_qty,ll_qty_master,ll_rtn
string				ls_rbt_ins_del,ls_rbt_seri_lot_no,ls_data,ls_uom_code,ls_item_code,ls_line_text
decimal			ldc_price,ldc_amount
t_ds_db			lds_lot_line
t_dw_mpl		ldw_lot_line,ldw_master
t_transaction	lt_transaction

//if AncestorReturnValue = 1 then return 1
//if pos(rpo_dw.dataobject,'d_scan_barcode') > 0 or pos(rpo_dw.dataobject,'d_lot_line') > 0 then
	iw_display.f_get_transaction(lt_transaction)
	lds_lot_line = create t_ds_db
	lds_lot_line.dataobject = 'ds_lot_line'
	lds_lot_line.f_settransobject(lt_transaction )
//	if pos(rpo_dw.dataobject,'d_lot_line') > 0 then
//		ldw_master = rpo_dw.dynamic f_get_idw_master( )
//	else
//		ldw_lot_line = iw_display.f_get_dw( 'd_lot_line_grid')
//		ldw_master = ldw_lot_line.f_get_idw_master( )
//	end if
	laa_data[1] = ldw_master.getitemnumber( ldw_master.getrow( ) , 'item_ID')
	lds_lot_line.f_add_where( 'object_id', laa_data)
	ll_rtn = lds_lot_line.retrieve( )
	ls_uom_code = ldw_master.getitemstring( ldw_master.getrow( ) , 'uom_code')
	ls_item_code = ldw_master.getitemstring( ldw_master.getrow( ) , 'item_code')
	ls_line_text = ldw_master.getitemstring( ldw_master.getrow( ) , 'line_text')
	if pos(rpo_dw.dataobject,'d_scan_barcode') > 0 then
//		if isnull(vs_editdata) or vs_editdata = '' then return 0
//		ls_rbt_ins_del = rpo_dw.getitemstring(vl_currentrow,'rbt_ins_del')
		
//		ls_rbt_seri_lot_no = rpo_dw.getitemstring(vl_currentrow,'rbt_seri_lot_no')
		ls_rbt_seri_lot_no = rpo_dw.getitemstring(rpo_dw.getrow(),'rbt_seri_lot_no')
		
		ldw_lot_line = iw_display.dynamic f_get_dw('d_lot_line_grid')
//		if vs_colname = 'barcode' then
			ll_qty_master = ldw_master.getitemnumber( ldw_master.getrow( ) , 'qty')
			if ldw_lot_line.rowcount( ) < ll_qty_master then
				if ls_rbt_seri_lot_no = 'serial' then
					ll_find = ldw_lot_line.find( 'serial_no = '+"'"+trim(vs_editdata)+"'", 1,ldw_lot_line.rowcount( ) )
					if ll_find = 0 then
						ll_find = lds_lot_line.find('serial_no = '+"'"+trim(vs_editdata)+"'",1,lds_lot_line.rowcount( ) )
						if ll_find > 0 then
							lds_lot_line.setfilter('serial_no = '+"'"+trim(vs_editdata)+"'")
							lds_lot_line.filter( )
							if mod(lds_lot_line.rowcount( ),2 ) = 0 then ll_find = 0
						end if
						if ls_rbt_ins_del = 'insert' then
							if ll_find = 0  then
								if ldw_lot_line.rowcount( ) = 1 then
									ls_data = ldw_lot_line.getitemstring( 1, 'serial_no')
									if isnull(ls_data) or ls_data = '' then 
										ll_insertrow = 1
									else
										ll_insertrow = ldw_lot_line.event e_addrow( )
									end if
								else
									ll_insertrow = ldw_lot_line.event e_addrow( )
								end if
								if ll_insertrow > 0 then
									ldw_lot_line.setitem(ll_insertrow,'serial_no',vs_editdata)
									ldw_lot_line.setitem(ll_insertrow,'qty',1)
								else
									messagebox('Lỗi','c_goods_receipt.e_dw_e_itemchanged(line:17)')
									rpo_dw.settext('')
									rpo_dw.setitem(rpo_dw.getrow(),'barcode','')
								//	return 1
								end if
							else
								gf_messagebox('m.c_goods_receipt.e_dw_e_itemchanged.01','Thông báo','Số serial @: '+vs_editdata+' đã tồn tại','exclamation','ok',1)
								rpo_dw.settext('')
								rpo_dw.setitem(rpo_dw.getrow(),'barcode','')
						//		return 1
							end if
						else //--delete--//
							if ll_find > 0 then
								ldw_lot_line.event e_deleterow( ll_find)
							else
								gf_messagebox('m.c_goods_receipt.e_dw_e_itemchanged.02','Thông báo','Số serial @: '+vs_editdata+' không tồn tại','exclamation','ok',1)
								rpo_dw.settext('')
								rpo_dw.setitem(rpo_dw.getrow(),'barcode','')
					//			return 1
							end if
						end if
					else
						gf_messagebox('m.c_goods_receipt.e_dw_e_itemchanged.08','Thông báo','Số serial @: '+vs_editdata+' đã tồn tại','exclamation','ok',1)
						rpo_dw.settext('')
						rpo_dw.setitem(rpo_dw.getrow(),'barcode','')
				//		return 1
					end if
				else//--lot--//
					ll_find = ldw_lot_line.find( 'lot_no = '+"'"+vs_editdata+"'", 1,ldw_lot_line.rowcount( ) )
					if ls_rbt_ins_del = 'insert' then	
						if ll_find > 0 then
							ll_qty = ldw_lot_line.getitemnumber( ll_find, 'qty')
							if isnull(ll_qty) then ll_qty = 0
							ldw_lot_line.setitem(ll_find,'qty',ll_qty + 1)
						else
							if ldw_lot_line.rowcount( ) = 1 then
								ls_data = ldw_lot_line.getitemstring( 1, 'lot_no')
								if isnull(ls_data) or ls_data = '' then 
									ll_insertrow = 1
								else
									ll_insertrow = ldw_lot_line.event e_addrow( )
								end if
							else
								ll_insertrow = ldw_lot_line.event e_addrow( )
							end if
							if ll_insertrow > 0 then
								ldw_lot_line.setitem(ll_insertrow,'lot_no',vs_editdata)
								ldw_lot_line.setitem(ll_insertrow,'qty',1)
							else
								messagebox('Lỗi','c_goods_receipt.e_dw_e_itemchanged(line:17)')
								rpo_dw.settext('')
								rpo_dw.setitem(rpo_dw.getrow(),'barcode','')
						//		return 1
							end if
						end if
					else //--delete--//
						if ll_find > 0 then
							ll_qty = ldw_lot_line.getitemnumber( ll_find, 'qty')
							if isnull(ll_qty) then ll_qty = 0
							if ll_qty = 1 then
								ldw_lot_line.event e_deleterow( ll_find)
							elseif ll_qty > 1 then
								ldw_lot_line.setitem(ll_find,'qty',ll_qty - 1)
							end if
						else
							gf_messagebox('m.c_goods_receipt.e_dw_e_itemchanged.03','Thông báo','Số lô/lot @: '+vs_editdata+' không tồn tại','exclamation','ok',1)
							rpo_dw.settext('')
							rpo_dw.setitem(rpo_dw.getrow(),'barcode','')
					//		return 1
						end if
					end if
				end if
				rpo_dw.settext('')
				rpo_dw.setitem(rpo_dw.getrow(),'barcode','')
		//		return 1
			else
				gf_messagebox('m.c_goods_receipt.e_dw_e_itemchanged.04','Thông báo','Mặt hàng '+ls_item_code+' - '+ls_line_text+' đã đủ số lượng '+string(ll_qty_master)+' '+ls_uom_code,'exclamation','ok',1)
		//		return 1
			end if
//		elseif vs_colname = 'rbt_seri_lot_no' then
//			if ls_rbt_seri_lot_no = 'serial' then 
//				rpo_dw.object.barcode_t.text =  'Số lô/lot'
//			else
//				rpo_dw.object.barcode_t.text = 'Số serial'
//			end if
//			return AncestorReturnValue
//		else
//			return AncestorReturnValue
//		end if
/*
	else
		if vs_colname = 'serial_no' then
			ll_find = rpo_dw.find( 'serial_no = '+"'"+trim(vs_editdata)+"'", 1,rpo_dw.rowcount( ) )
			if ll_find = 0 then 
				ll_find = lds_lot_line.find('serial_no = '+"'"+trim(vs_editdata)+"'",1,lds_lot_line.rowcount( ) )
				if ll_find > 0 then
					lds_lot_line.setfilter('serial_no = '+"'"+trim(vs_editdata)+"'")
					lds_lot_line.filter( )
					if mod(lds_lot_line.rowcount( ),2 ) = 0 then ll_find = 0
				end if
				if ll_find > 0 then 
					gf_messagebox('m.c_goods_receipt.e_dw_e_itemchanged.05','Thông báo','Số serial @: '+vs_editdata+' đã tồn tại','exclamation','ok',1)
					rpo_dw.settext('')
					return 1
				elseif ldw_master.getitemnumber( ldw_master.getrow( ) , 'qty') < rpo_dw.rowcount() then
					gf_messagebox('m.c_goods_receipt.e_dw_e_itemchanged.07','Thông báo','Mặt hàng '+ls_item_code+' - '+ls_line_text+' đã đủ số lượng '+string(ll_qty_master)+' '+ls_uom_code,'exclamation','ok',1)
					return 1
				end if
			else
				gf_messagebox('m.c_goods_receipt.e_dw_e_itemchanged.06','Thông báo','Số serial @: '+vs_editdata+' đã tồn tại','exclamation','ok',1)
				rpo_dw.settext('')
				return 1
			end if
		end if
		*/
	end if
	destroy lds_lot_line
//elseif pos(rpo_dw.dataobject,'d_inventory_line_receipt') > 0 then
//	choose case vs_colname
//		case 'qty','price'
//			if vs_colname = 'qty' then
//				ldc_price = rpo_dw.getitemnumber(vl_currentrow,'price')
//				ldc_amount = ldc_price * dec(vs_editdata)
//			else
//				ll_qty = rpo_dw.getitemnumber(vl_currentrow,'qty')
//				ldc_amount =ll_qty * dec(vs_editdata)
//			end if
//			rpo_dw.setitem(vl_currentrow,'amount',ldc_amount)
//		case 'doc_qty'
//			rpo_dw.setitem(vl_currentrow,'qty',dec(vs_editdata))
//	end choose
//end if
//return AncestorReturnValue
return false
end function

public function integer f_get_dw_4upd_item_balance (ref t_dw_mpl rdw_item, ref t_dw_mpl rdw_f_object, ref t_dw_mpl rdw_t_object, ref t_dw_mpl rdw_item_value, ref t_dw_mpl rdw_item_lot, ref string ras_f_col_object[], ref string ras_t_col_object[], ref string ras_col_item[], ref string ras_col_item_value[], ref string ras_col_item_lot[]);//-- Lấy dw trên form theo cài đặt streamvalue structure: để thực hiện update item balance --//

c_string					lc_string


//-- Lấy dw --//
if lower(this.istr_streamvalue[1].s_item_dwo) = 'none' then return 0
rdw_item = iw_display.dynamic f_get_dw(this.istr_streamvalue[1].s_item_dwo)
if not isvalid(rdw_item) then
	gf_messagebox('m.b_doc.f_get_dw_4upd_item_balance.01','Thông báo','DW mã hàng trong streamvalue structure không hợp lệ','stop','ok',1)		
	return -1
end if
if this.istr_streamvalue[1].s_f_obj_dwo = this.istr_streamvalue[1].s_item_dwo then
	rdw_f_object = rdw_item
else
	rdw_f_object = iw_display.dynamic f_get_dw(this.istr_streamvalue[1].s_f_obj_dwo)
	if not isvalid(rdw_f_object) then
		gf_messagebox('m.b_doc.f_get_dw_4upd_item_balance.02','Thông báo','DW đối tượng FROM trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if	
end if
if this.istr_streamvalue[1].s_t_obj_dwo = this.istr_streamvalue[1].s_item_dwo then
	rdw_t_object = rdw_item
else
	rdw_t_object =  iw_display.dynamic f_get_dw(this.istr_streamvalue[1].s_t_obj_dwo)
	if not isvalid(rdw_t_object) then
		gf_messagebox('m.b_doc.f_get_dw_4upd_item_balance.03','Thông báo','DW đối tượng TO trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if	
end if
//-- lây dw giá trị --//

if this.istr_streamvalue[1].s_item_dwo = this.istr_streamvalue[1].s_value_dwo then
	rdw_item_value = rdw_item
elseif this.istr_streamvalue[1].s_value_dwo <> '' then
	rdw_item_value = iw_display.dynamic f_get_dw(this.istr_streamvalue[1].s_value_dwo)
	if not isvalid(rdw_item_value) then
		gf_messagebox('m.b_doc.f_get_dw_4upd_item_balance.04','Thông báo','DW giá trị hàng trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if			
end if
lc_string.f_stringtoarray( this.istr_streamvalue[1].s_value_column, ';',ras_col_item_value[])

//-- Lấy dw lot--//
if this.istr_streamvalue[1].s_item_lot_dwo <> '' then
	rdw_item_lot = iw_display.dynamic f_get_dw(this.istr_streamvalue[1].s_item_lot_dwo)
	if not isvalid(rdw_item_lot) then
		gf_messagebox('m.b_doc.f_get_dw_4upd_item_balance.05','Thông báo','DW item_lot trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if
	lc_string.f_stringtoarray( this.istr_streamvalue[1].s_item_lot_column, ';',ras_col_item_lot)
end if

lc_string.f_stringtoarray( this.istr_streamvalue[1].s_f_obj_column, ';',ras_f_col_object)
lc_string.f_stringtoarray( this.istr_streamvalue[1].s_t_obj_column, ';',ras_t_col_object)
lc_string.f_stringtoarray( this.istr_streamvalue[1].s_item_column, ';',ras_col_item)
//-- Kết thúc lấy dw --//
return 1
end function

public function integer f_insert_item_balance (ref t_transaction rt_transaction, date vd_trans_date, string vs_post_type, string vs_qty_yn, string vs_value_yn);/**************************************************************************************
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
===============
//--KHÔNG CÒN DÙNG--//
=============================================================================*/
int							li_rtn, li_cnt
long						ll_row, ll_row2
any						laa_data[]
date						ld_trans_date
string						ls_lot_yn,ls_serial_yn,ls_original_filter
string						las_col_item[], las_col_item_value[], las_col_item_lot[], las_f_col_object[], las_t_col_object[]
double					ldb_trans_uom, ldb_item_id
boolean					lb_managed_qty

u_item					lu_item
c_string					lc_string
t_dw_mpl				ldw_f_object,ldw_item,ldw_t_object,ldw_item_lot,ldw_item_value
c_dwservice				lc_dwsr

lu_item = create u_item
li_cnt = upperbound(this.istr_streamvalue[])
if li_cnt = 0 then
	gf_messagebox('m.b_doc.f_insert_item_balance.01','Thông báo','Chưa cài đặt streamvalue','exclamation','ok',1)
	rollback using rt_transaction;
	return -1	
end if
	
//-- Lấy dw --//
li_rtn =this.f_get_dw_4upd_item_balance(ldw_item, ldw_f_object, ldw_t_object,ldw_item_value, ldw_item_lot, las_f_col_object[], las_t_col_object[], las_col_item[], las_col_item_value[], las_col_item_lot[])
if li_rtn = 0 then return 0
if li_rtn = -1 then
	rollback using rt_transaction;
	return -1
end if

//-- Lấy dw lot--//
if upper(vs_qty_yn) = 'Y' then
	if isvalid(ldw_item_lot) then
		//-- ghi nhớ lại filter hiện tại --//
		ls_original_filter = ldw_item_lot.describe( "datawindow.table.filter")
	end if
end if	

FOR ll_row = 1 to ldw_item.rowcount( )
	
	ldb_item_id =  ldw_item.getitemnumber(ll_row,las_col_item[1])
	ldb_trans_uom = ldw_item.getitemnumber(ll_row,las_col_item[4])
	if upper(this.f_get_object_type(ldb_item_id)) <> 'ITEM' then continue
	lb_managed_qty = lu_item.f_is_managed_qty(ldb_item_id )
	if not lb_managed_qty then continue
	
	//-- set các biến cho update item balance --//
	laa_data[1] = ldb_item_id
	laa_data[2] = ldw_item.getitemnumber(ll_row,'COMPANY_ID')
	laa_data[3] = ldw_item.getitemnumber(ll_row,las_col_item[2])
	laa_data[4] = ldw_item.getitemnumber(ll_row,las_col_item[5]) 
	laa_data[5] = datetime(vd_trans_date)
	setnull(li_rtn)
	laa_data[9] = li_rtn
	
	///-- kiểm tra item có quản lý số seri hoặc số lô không --//
	if lc_dwsr.f_get_lot_or_serial_yn( laa_data[1], ls_lot_yn,ls_serial_yn) = -1 then
		gf_messagebox('m.b_doc.f_insert_item_balance.02','Thông báo','Mã hàng không hợp lệ:@'+lu_item.f_get_code(laa_data[1] ),'stop','ok',1)		
		rollback using rt_transaction;
		destroy lu_item
		return -1
	end if
	
	//-- ghi sổ giá trị hoặc ghi sổ số lượng với mã hàng ko quản lý số  seri --//
	if (vs_value_yn = 'Y' and lb_managed_qty) OR (ls_serial_yn = 'N' and ls_lot_yn = 'N' and vs_qty_yn = 'Y' and lb_managed_qty) then
		laa_data[7] = '@'
		laa_data[8] = '@'	
//		this.f_insert_item_balance_row( /*ref t_transaction rt_transaction*/, /*ref powerobject rpo_item*/, /*ref long vl_item_row*/, /*t_dw_mpl rdw_f_object*/, /*t_dw_mpl rdw_t_object*/, /*date vd_trans_date*/, /*string vs_post_type*/, /*string vas_col_item[]*/, /*string vas_col_item_value[]*/, /*string vas_f_col_object[]*/, /*string vas_t_col_object[]*/, /*any vaa_data[]*/, /*string vs_qty_yn*/, /*string vs_value_yn*/, /*double vdb_trans_uom*/, /*string vs_qty_column*/, /*double vdb_value */)
//		this.f_insert_item_balance_row( rt_transaction, ldw_item, ll_row, ldw_f_object, ldw_t_object, vd_trans_date, vs_post_type, las_col_item[], las_col_item_value[], las_f_col_object[], las_t_col_object[], laa_data[], vs_qty_yn, vs_value_yn, ldb_trans_uom, las_col_item[3])
	end if
	//-- cập nhât balance các mã hàng có quản lý số lot/seri --//
	if (ls_serial_yn = 'Y' or ls_lot_yn = 'Y') and vs_qty_yn = 'Y' then
		if not isvalid(ldw_item_lot) then
			gf_messagebox('m.b_doc.f_insert_item_balance.03','Thông báo','DW item_lot trong streamvalue structure không hợp lệ','stop','ok',1)		
			return -1
		end if
		ldw_item_lot.setfilter( "object_ref_id = "+string(ldw_item.getitemnumber( ll_row,'ID') ))
		ldw_item_lot.filter( )	
		for ll_row2 = 1 to ldw_item_lot.rowcount( )				
			laa_data[7] = ldw_item_lot.getitemstring( ll_row2, las_col_item_lot[2])
			laa_data[8] = ldw_item_lot.getitemstring( ll_row2, las_col_item_lot[3])
			if isnull(laa_data[7]) and  ls_lot_yn = 'Y'  then
				gf_messagebox('m.b_doc.f_insert_item_balance.04','Thông báo','Mã hàng sau chưa nhập số lô:@'+lu_item.f_get_code(laa_data[1] ),'stop','ok',1)		
				rollback using rt_transaction;
				destroy lu_item
				return -1					
			end if
			if isnull(laa_data[8]) and  ls_serial_yn = 'Y'  then
				gf_messagebox('m.b_doc.f_insert_item_balance.05','Thông báo','Mã hàng sau chưa nhập số seri:@'+lu_item.f_get_code(laa_data[1] ),'stop','ok',1)		
				rollback using rt_transaction;
				destroy lu_item
				return -1						
			end if			
			//-- insert row --//
//			this.f_insert_item_balance_row( rt_transaction, ldw_item_lot, ll_row2, ldw_f_object, ldw_t_object, vd_trans_date, vs_post_type, las_col_item_lot[], las_col_item_value[], las_f_col_object[], las_t_col_object[], laa_data[], 'Y' , 'N', ldb_trans_uom, las_col_item_lot[1])
		next
		//-- update cot sku ,cogs--//
		if ldw_item_lot.update(true,false) = -1 then
			gf_messagebox('m.b_doc.f_insert_item_balance.06','Thông báo','Không cập nhật được số lượng theo đơn vị tồn kho:@' +rt_transaction.sqlerrtext ,'exclamation','ok',1)
			rollback using rt_transaction;
			return -1
		end if	
		ldw_item_lot.resetupdate()			
	end if
NEXT

//-- update cot sku ,cogs--//
if ldw_item.update(true,false) = -1 then
	gf_messagebox('m.b_doc.f_insert_item_balance.07','Thông báo','Không cập nhật được số lượng theo đơn vị tồn kho:@' +rt_transaction.sqlerrtext ,'exclamation','ok',1)
	rollback using rt_transaction;
	return -1
end if	
ldw_item.resetupdate()

if ls_original_filter <> '?' and ls_original_filter <> '' then
	lc_string.f_globalreplace(ls_original_filter ,'~~','')
	ldw_item_lot.setfilter( ls_original_filter)
	ldw_item_lot.filter( )
end if
destroy lu_item
return 1
end function

public function date f_get_payment_based_date (string vs_dwo, string vs_payment_term_column);int					li_rtn
string				ls_base_date_dwo, ls_base_date_column, ls_date_text
date				ld_base_date
t_dw_mpl		ldw_base_Date

setnull(ld_base_date)
li_rtn = this.idwsetup_initial.f_get_payment_dwo_colname( vs_dwo, vs_payment_term_column, ls_base_date_dwo, ls_base_date_column)
if li_rtn = 1 then
	ldw_base_Date = this.iw_display.f_get_dw(ls_base_date_dwo+'_grid' )
	if isvalid(ldw_base_Date) then
		if ldw_base_Date.getrow( ) > 0 then
			if left(ldw_base_Date.describe( ls_base_date_column+'.coltype'), 4) = 'date' then
				ld_base_date = date(ldw_base_Date.getitemdatetime(ldw_base_Date.getrow( ), ls_base_date_column))
				if isnull(ld_base_date) then
					ls_date_text = ldw_base_Date.describe(ls_base_date_column+'_t.text' )
					gf_messagebox('m.b_doc.f_get_payment_based_date.01','Thông báo','Chưa nhập ngày căn cứ tính công nợ:@'+ls_date_text,'exclamation','ok',1)
				end if
			else
				gf_messagebox('m.b_doc.f_get_payment_based_date.02','Thông báo','Cài đặt cột ngày căn cứ tính công nợ chưa đúng kiểu dữ liệu:@'+ls_base_date_column, 'exclamation','ok',1)
			end if
		else
			gf_messagebox('m.b_doc.f_get_payment_based_date.01','Thông báo','Chưa nhập ngày căn cứ tính công nợ:@'+ls_date_text,'exclamation','ok',1)
		end if
	else
		gf_messagebox('m.b_doc.f_get_payment_based_date.03','Thông báo','Không tìm thấy DWO cài đặt ngày căn cứ thời hạn công nợ:'+ls_base_date_dwo,'exclamation', 'ok', 1)
	end if
else
	gf_messagebox('m.b_doc.f_get_payment_based_date.04','Thông báo','Chưa cài đặt ngày căn cứ tính công nợ', 'exclamation','ok',1)
end if
return ld_base_date
end function

public function integer f_get_doc_version (t_dw_mpl vdw_main);double		ldb_version_id
string			ls_object_ref_table
any			laa_data[]
int				li_version
t_ds_db			lds_version
t_Transaction	lt_Transaction

if vdw_main.getrow() > 0 then
	if vdw_main.describe( "version_id.coltype" ) = 'number' then
		
		//-- Tạo connection voi database --//
		lt_Transaction = create t_transaction
		lt_Transaction.dbms =	SQLCA.DBMS
		lt_Transaction.ServerName	 = SQLCA.ServerName
		lt_Transaction.LogId	 = SQLCA.LogId
		lt_Transaction.LogPass 	 = SQLCA.LogPass 
		lt_Transaction.AutoCommit 	 = false 
		lt_Transaction.DBParm	 = SQLCA.DBParm
		connect using	lt_Transaction;		
		
		ldb_version_id = vdw_main.getitemnumber(vdw_main.getrow(), 'version_id')
		ls_object_ref_table =  vdw_main.getitemstring(vdw_main.getrow(), 'object_ref_table')
		lds_version = create t_ds_db
		if upper(ls_object_ref_table) = 'ORDERS' then
			lds_version.dataobject = 'd_order_grid'
		else
			lds_version.dataobject = 'd_invoice_grid'
		end if
		lds_version.settransobject( lt_Transaction )
		laa_data[1] = ldb_version_id
		lds_version.f_add_where( 'id', laa_data[])
		if lds_version.retrieve( ) > 0 then
			li_version = lds_version.getitemnumber( 1, 'version_no')
			destroy lds_version
			return li_version
		end if
		disconnect using lt_Transaction;
		destroy lt_Transaction
	else
		return 1
	end if
end if
destroy lds_version
return 0

end function

public function integer f_get_allocation_info (ref string ras_allocation_info[]);/***********************************************************
Chức năng: khai báo cáo các thông tin liên quan phân bổ chi phí
---------------------------------------------------------------------------------
ras_allocation_info[1] = 'd_pur_invoice_line_grid' : tên dwo làm căn cứ phân bổ
ras_allocation_info[2] = 'qty'							: tên cột căn cứ phân bổ theo số lượng
ras_allocation_info[3] = 'base_amount'				: tên cột căn cứ phân bổ theo giá trị
ras_allocation_info[4] = 'd_charge_line_grid'		: tên dwo chi phí phân bổ
-------------------------------------------------------------------------------------------------

=====================================================*/
return upperbound(ras_allocation_info[])
end function

public function string f_get_doc_type (t_dw_mpl vdw_main);string			ls_doctype


if vdw_main.getrow() > 0 then
	ls_doctype = vdw_main.getitemstring(vdw_main.getrow(), 'doc_type')
end if
return ls_doctype

end function

public function integer f_delete_matching_chage_line (datawindow vdw_deleting, long vl_del_row);s_str_dwo_related	lstr_related[]
t_transaction			lt_transaction
t_ds_db 					lds_matching
c_string					lc_string
int							li_rtn			
long						ll_idx2,ll_count1

if pos(vdw_deleting.dataobject,'d_charge_line') =0 then return 0
iw_display.dynamic f_get_transaction( lt_transaction)
lds_matching = create t_ds_db
ll_count1 = this.f_get_ds_matching( lds_matching, vdw_deleting, vl_del_row,false,lt_transaction)
if ll_count1 = 0 then 
	destroy lds_matching
	return li_rtn
elseif li_rtn = -1 then 
	destroy lds_matching
	return li_rtn
end if
if ll_count1 > 1 then
	for ll_idx2 = ll_count1 to 1 step -1
		lds_matching.deleterow( ll_idx2)
	next
elseif ll_count1 = 1 then
	lds_matching.deleterow( ll_count1)
end if
li_rtn = lds_matching.update(true,false )
if li_rtn = -1 then
	messagebox('Lỗi','b_doc.f_update_matching(line:31)')
	rollback using lt_transaction;
end if	
destroy lds_matching
return li_rtn
end function

public function double f_get_idb_trans_id ();return idb_trans_id 
end function

public function integer f_get_invoice_sign_code (double vdb_object_id, ref string rs_invoice_sign, ref string rs_invoice_code);/***************************************
Lấy kí hiệu và mẫu số hóa đơn của nhà cung cấp
Tham số truyền vào: id của NCC
return 1: thành công
		 0:không có dữ liệu
		-1: lỗi
****************************************/

select org.invoice_sign,org.invoice_code into :rs_invoice_sign, :rs_invoice_code
from object obj
left join vendor vd on vd.object_ref_id=obj.id
left join ORGANIZATION org on vd.id=org.object_ref_id 
where obj.id= :vdb_object_id using sqlca;
if sqlca.sqlcode = 0 then
	return 1
elseif sqlca.sqlcode = 0 then
	return 0
end if
return -1


end function

public function integer f_check_must_booked_data (t_dw_mpl vdw_handle, string vsa_colname[]);
string				lsa_colname[]
int					li_cnt, li_idx
any				la_data

//-- Kiểm tra các cột dữ liệu cài đặt bắt buộc khi ghi sổ đã có dữ liệu --/

li_cnt = this.idwsetup_initial.f_get_must_booked_colname( vdw_handle, lsa_colname)
FOR li_idx = 1 to li_cnt
	la_data = vdw_handle.dynamic f_getitemany( vdw_handle.getrow( ) ,lsa_colname[li_idx] )
	if isnull(la_data) then
		
	end if
NEXT

return 1
end function

public function string f_get_doc_status (double vdb_doc_id);string	ls_status


select status 
into :ls_status
from document
where id = :vdb_doc_id using SQLCA;

if sqlca.sqlcode <> 0 then
	gf_messagebox('m.b_doc.f_get_doc_status.01','Thông báo','Lỗi SQL:@'+sqlca.sqlerrtext,'stop','ok',1)
	return ''
end if
return ls_status


end function

public function boolean f_is_booked (double vdb_doc_id);string	ls_status

ls_status = this.f_get_doc_status(vdb_doc_id )

if upper(ls_status) = 'BOOKED' then
	return true
else
	return false
end if
end function

public function integer f_round (ref datawindow rpo_dw, long vl_currentrow, string vs_colname, string vs_editdata);/*********************************************************************
Chức năng: kiểm tra ràng buộc dữ liệu trên cùng dw
------------------------------------------------------------
return:
	- 0 :Dữ liệu nhập ok
	- 1 : Dữ liệu nhập không hợp lệ
	- 2 : Dữ liệu nhập đã được thay đổi và setitem ok
ldba_data[1]: data đã làm tròn
ldba_data[2]: data đã qui đổi đơn vị
ldba_data[3]: data chênh lệch làm tròn
=============================================================*/
datawindow			ldw_handling
double				ldb_unit_id,ldb_item_id,ldb_round_id
double				ldb_diff,ldba_data_conver[],ldba_data[],ldba_data_cur[]
long					ll_idx_str
any					laa_data[]

ll_idx_str = ic_unit_instance.f_get_data_4_rounding( istr_unit[], rpo_dw, vs_colname, vs_editdata, laa_data,vl_currentrow) 
if ll_idx_str > 0 then
	if lower(laa_data[4]) <> 'ex' then
		ic_unit_instance.is_table = 'uom'
		ldb_unit_id = ic_unit_instance.f_get_id( string(laa_data[2]))
		if lower(laa_data[4]) = 'item' then
			//--Trường hợp là item--//
			ic_unit_instance.is_table = 'object'
			ldb_item_id = ic_unit_instance.f_get_id(trim(string(laa_data[3])) )
			if ldb_unit_id = 0 or ldb_item_id = 0 then return 0
		else
			//--Trường hợp price và amound--//
			ldb_item_id = 0
		end if
		ic_unit_instance.is_table = 'uom'
		//--Làm tròn--//
		ldb_round_id = ic_unit_instance.f_get_round_id( ldb_unit_id, ldb_item_id,laa_data[4])
		if ldb_round_id <= 0 then return 1
		ldba_data[1] = ic_unit_instance.f_round(rpo_dw ,ldb_round_id, double(laa_data[1]))
		//--Qui đổi đơn vị--//
		if lower(string(laa_data[4])) = 'item' then //--or lower(string(laa_data[4])) = 'account' --//
			if istr_unit[ll_idx_str].s_colname_convert <> '' then //-- chưa dùng --//
				if ic_unit_instance.f_get_data_4_conversion_unit( ldb_unit_id, ldb_item_id, ldba_data[1], ldba_data_conver) > 0 then
					ldba_data[2] = ic_unit_instance.f_round(rpo_dw,ldba_data_conver[3], ldba_data_conver[1])
					ldba_data[3] = ldba_data_conver[2]
				end if
			end if
			ic_unit_instance.f_setitem_rounding( rpo_dw, istr_unit[], vs_colname,ldba_data[],'item',vs_editdata,vl_currentrow)
			if ic_unit_instance.f_get_data_4_conversion_cur( istr_unit, rpo_dw, 0, ldba_data[1],0, ldba_data_cur,'',vs_colname,vl_currentrow) > 0 then
				ic_unit_instance.f_setitem_rounding( rpo_dw, istr_unit[], vs_colname,ldba_data_cur[],'cur',vs_editdata,vl_currentrow)
			end if
		elseif lower(string(laa_data[4])) = 'price'  then
			if ic_unit_instance.f_get_data_4_conversion_cur( istr_unit, rpo_dw,ldba_data[1] ,0,0, ldba_data_cur,laa_data[2],vs_colname,vl_currentrow) > 0 then
				ic_unit_instance.f_setitem_rounding( rpo_dw, istr_unit[], vs_colname,ldba_data_cur[],'cur',vs_editdata,vl_currentrow)
			end if
		end if
	else
		ldba_data[1] = double(vs_editdata)
		if ic_unit_instance.f_get_data_4_conversion_cur( istr_unit, rpo_dw,0,0,ldba_data[1], ldba_data_cur,'',vs_colname,vl_currentrow) > 0 then
			ic_unit_instance.f_setitem_rounding( rpo_dw, istr_unit[], vs_colname,ldba_data_cur[],'cur',vs_editdata,vl_currentrow)
		end if
		return 0
	end if
	if lower(string(laa_data[4])) = 'amount' or lower(string(laa_data[4])) = 'bc' then
		ldba_data[3] = ldba_data[1]
		setnull(ldba_data[2])
		//-- trường hợp cột đang edit có loại làm tròn là bc thì không cần setitem lại cột amount --//
		if lower(string(laa_data[4])) = 'bc' then ldba_data[1] = -1
		ic_unit_instance.f_setitem_rounding( rpo_dw, istr_unit, vs_colname, ldba_data, 'cur', vs_editdata,vl_currentrow)
	end if
	//--trường hợp dữ liệu đang change là mã hàng hoặc loại tiền--//
	if vs_editdata = laa_data[2] or vs_editdata = laa_data[3] then
		return 0
	else
		return 2
	end if
end if
return 0
end function

public subroutine f_get_amount_matching (double vdb_id, string vs_table, string vs_colname[], ref decimal rdc_amount[]);transaction		lt_transaction
t_ds_db			lds_matching
any				laa_data[]
long				ll_rtn, ll_col,ll_row


lds_matching = create t_ds_db
iw_display.dynamic f_get_transaction(lt_transaction)
laa_data[1] = vdb_id
laa_data[2] = vs_table
lds_matching.dataobject = 'ds_matching'
lds_matching.f_settransobject( lt_transaction)
lds_matching.f_add_where( 'f_ref_id;t_ref_table',laa_data)
ll_rtn=lds_matching.retrieve()
if  ll_rtn>0 then
	for ll_col=1 to upperbound(vs_colname[]) 
		rdc_amount[ll_col]=0
		for ll_row=1 to ll_rtn
			rdc_amount[ll_col]+=lds_matching.getitemnumber( ll_row,vs_colname[ll_col])
		next
	next
	destroy lds_matching
else
	for ll_col=1 to upperbound(vs_colname[]) 
	rdc_amount[ll_col]=0
	next
	destroy lds_matching
end if

end subroutine

public function double f_get_so_doc_id (string vs_t_ref_table, double vdb_t_doc_id);double 		ldb_doc_id

choose case upper(vs_t_ref_table)
	case 'SAL_INVOICE_LINE'
		select DISTINCT doc.id into :ldb_doc_id
		from document doc join so_line so on so.object_ref_id = doc.version_id
                                      join matching mat on mat.f_ref_id = so.id
                                      join inventory_line ivl on mat.t_ref_id = ivl.id
                                      join matching mat1 on mat1.f_ref_id = ivl.id
                                      join sal_invoice_line sal on mat1.t_ref_id = sal.id
                                      join document doc1 on doc1.version_id = sal.object_ref_id 
		where doc1.id = :vdb_t_doc_id and rownum < 2 using SQLCA;
		if SQLCA.SQLCODE = 100 then
			select DISTINCT doc.id into :ldb_doc_id
        		from document doc join so_line so on so.object_ref_id = doc.version_id
                                      join matching mat on mat.f_ref_id = so.id       
                                      join sal_invoice_line sal on mat.t_ref_id = sal.id
								  join document doc1 on doc1.version_id = sal.object_ref_id 
			where doc1.id = :vdb_t_doc_id and rownum < 2 using SQLCA ;
		end if
	case 'PAYMENT_LINE'
		select DISTINCT doc.id into :ldb_doc_id
         from document doc join so_line so on so.object_ref_id = doc.version_id
                                      join matching mat on mat.f_ref_id = so.id
                                      join inventory_line ivl on mat.t_ref_id = ivl.id
                                      join matching mat1 on mat1.f_ref_id = ivl.id
                                      join sal_invoice_line sal on mat1.t_ref_id = sal.id
                                      join matching mat2 on mat2.f_ref_id = sal.id
                                      join payment_line pay on mat2.t_ref_id = pay.id
                                      join document doc1 on doc1.version_id = pay.object_ref_id 
         where doc1.id = :vdb_t_doc_id and rownum < 2 using SQLCA;
		if SQLCA.sqlcode = 100 then
			select DISTINCT doc.id into :ldb_doc_id
			from document doc join so_line so on so.object_ref_id = doc.version_id
												  join matching mat1 on mat1.f_ref_id = so.id
												  join sal_invoice_line sal on mat1.t_ref_id = sal.id
												  join matching mat2 on mat2.f_ref_id = sal.id
												  join payment_line pay on mat2.t_ref_id = pay.id
												  join document doc1 on doc1.version_id = pay.object_ref_id 
			where doc1.id = :vdb_t_doc_id and rownum < 2 using SQLCA;
		end if
	case 'INVENTORY_LINE'
		select DISTINCT doc.id into :ldb_doc_id
		from document doc join so_line so on so.object_ref_id = doc.version_id
                                      join matching mat on mat.f_ref_id = so.id
                                      join inventory_line ivl on mat.t_ref_id = ivl.id
								  join document doc1 on doc1.version_id = ivl.object_ref_id 
		where doc1.id = :vdb_t_doc_id and rownum < 2 using SQLCA;
end choose
if isnull(ldb_doc_id) then ldb_doc_id = 0
if SQLCA.sqlcode = -1 then ldb_doc_id = -1
return ldb_doc_id
end function

public function double f_get_po_doc_id (string vs_t_ref_table, double vdb_t_doc_id);double 		ldb_doc_id

choose case upper(vs_t_ref_table)
	case 'PUR_INVOICE_LINE'
		// PUR -> INVEN -> PO
		SELECT DISTINCT MAT2.F_DOC_ID into :ldb_doc_id 
		FROM DOCUMENT DOC //PUR
			 JOIN MATCHING MAT1 ON MAT1.T_DOC_ID = DOC.ID AND MAT1.F_REF_TABLE = 'INVENTORY_LINE' //INVEN
			 JOIN MATCHING MAT2 ON MAT2.T_DOC_ID = MAT1.F_DOC_ID AND MAT2.F_REF_TABLE = 'PO_LINE' //PO
		WHERE DOC.ID = :vdb_t_doc_id using SQLCA;
		if SQLCA.SQLCODE = 100 then
			// PUR -> PO
			SELECT DISTINCT MAT1.F_DOC_ID into :ldb_doc_id 
			FROM DOCUMENT DOC //PUR
				 JOIN MATCHING MAT1 ON MAT1.T_DOC_ID = DOC.ID AND MAT1.F_REF_TABLE = 'PO_LINE' //PO
			WHERE DOC.ID = :vdb_t_doc_id using SQLCA;
		end if
	case 'PAYMENT_LINE'
		// PAY -> PUR -> INVEN -> PO
		SELECT DISTINCT MAT3.F_DOC_ID into :ldb_doc_id 
		FROM DOCUMENT DOC //PAYMENT
			 JOIN MATCHING MAT1 ON MAT1.T_DOC_ID = DOC.ID AND MAT1.F_REF_TABLE = 'POST_LINE' //PUR
			 JOIN MATCHING MAT2 ON MAT2.T_DOC_ID = MAT1.F_DOC_ID AND MAT2.F_REF_TABLE = 'INVENTORY_LINE'  //INVEN
			 JOIN MATCHING MAT3 ON MAT3.T_DOC_ID = MAT2.F_DOC_ID AND MAT3.F_REF_TABLE = 'PO_LINE' //PO
		WHERE DOC.ID = :vdb_t_doc_id using SQLCA;
		if SQLCA.sqlcode = 100 then
			// PAY -> PUR -> PO
			SELECT DISTINCT MAT2.F_DOC_ID into :ldb_doc_id 
			FROM DOCUMENT DOC //PAYMENT
				 JOIN MATCHING MAT1 ON MAT1.T_DOC_ID = DOC.ID AND MAT1.F_REF_TABLE = 'POST_LINE' //PUR
				 JOIN MATCHING MAT2 ON MAT2.T_DOC_ID = MAT1.F_DOC_ID AND MAT2.F_REF_TABLE = 'PO_LINE'  //INVEN
			WHERE DOC.ID = :vdb_t_doc_id using SQLCA;
		end if
	case 'INVENTORY_LINE'
		// INVEN -> PO
		SELECT DISTINCT MAT1.F_DOC_ID into :ldb_doc_id 
		FROM DOCUMENT DOC //INVEN
			 JOIN MATCHING MAT1 ON MAT1.T_DOC_ID = DOC.ID AND MAT1.F_REF_TABLE = 'PO_LINE'  //INVEN
		WHERE DOC.ID = :vdb_t_doc_id using SQLCA;
end choose
if isnull(ldb_doc_id) then ldb_doc_id = 0
if SQLCA.sqlcode = -1 then ldb_doc_id = -1
return ldb_doc_id
end function

public function string f_get_ref_table (double vdb_doc_id);string ls_ref_table


select object_ref_table into :ls_ref_table from document where id = :vdb_doc_id using sqlca;

if sqlca.sqlcode = -1 then
	gf_messagebox('m.b_doc.f_get_ref_table.01','Thông báo','Lỗi DB:@'+sqlca.sqlerrtext,'stop','ok',1)
	setnull(ls_ref_table)
	return ls_ref_table
end if
return ls_ref_table
end function

public function string f_get_doc_type (double vdb_doc_id);string			ls_doc_type

if vdb_doc_id = 0 then return ''
select doc.doc_type into :ls_doc_type
from document doc
where doc.id = :vdb_doc_id using SQLCA;

if sqlca.sqlcode <> 0 then
	gf_messagebox('m.b_doc.f_get_doc_type.01','Thông báo','Lỗi SQL:@'+sqlca.sqlerrtext,'stop','ok',1)
	return ''
end if
if isnull(ls_doc_type) then ls_doc_type = ''
return ls_doc_type
end function

public function boolean f_is_full_qty_matching (double vdb_f_doc_id);t_ds_db		lds_matching
decimal		ldc_qty,ldc_f_qty,ldc_remain
long			ll_rtn
any			laa_data[]
int				li_idx

lds_matching = create t_ds_db
lds_matching.dataobject = 'ds_matching'
lds_matching.f_settransobject( SQLCA)
laa_data[1] = vdb_f_doc_id
lds_matching.f_add_where( 'f_doc_id', laa_data)
ll_rtn = lds_matching.retrieve()
for li_idx = 1 to ll_rtn
//	ldc_f_qty += lds_matching.getitemnumber( li_idx, 'f_qty')
	ldc_qty += lds_matching.getitemnumber( li_idx, 'qty')
next
destroy lds_matching
//if ldc_f_qty - ldc_qty > 0 then
//	return false
//else
	return true
//end if

/*********************
trả về số lượng chưa kết hết
*********************
t_ds_db		lds_matching,lds_tmp
boolean		lb_return = false
double		ldb_f_ref_id
long			ll_rtn,ll_find
any			laa_data[]
int				li_idx

lds_matching = create t_ds_db
lds_tmp = create t_ds_db
lds_matching.dataobject = 'ds_matching'
lds_tmp.dataobject = 'ds_matching'
lds_matching.f_settransobject( SQLCA)
laa_data[1] = vdb_f_doc_id
lds_matching.f_add_where( 'f_doc_id', laa_data)
ll_rtn = lds_matching.retrieve()
//lds_matching.rowscopy( /*long s*/, /*long e*/, /*dwbuffer f*/, /*datastore d*/, /*long i*/, /*dwbuffer t */)
lds_matching.rowscopy( 1 , ll_rtn, Primary!, lds_tmp, lds_tmp.rowcount() + 1, Primary!)
ll_find ++
DO
	ll_find = lds_matching.find( "qty < f_qty", ll_find, lds_matching.rowcount( ) )
	if ll_find > 0 then
		if lds_matching.getitemnumber( ll_find, 'f_doc_id') <> ldb_f_ref_id then
			ldb_f_ref_id = lds_matching.getitemnumber( ll_find, 'f_doc_id')
			lds_tmp.setfilter( "f_doc_id = " + string(lds_matching.getitemnumber( ll_find, 'f_doc_id') ))
		end if
	end if
Loop While ll_find > 0
if ll_find > 0 then
//	ldb_f_ref_id = lds_matching.getitemnumber( ll_find, /*readonly integer c */)
end if
if ll_find = 0 then lb_return = true
destroy lds_matching
destroy lds_tmp
return lb_return*/
end function

public function integer f_update_table (double vdb_update_id, string vs_update_table, string vs_update_colname, string vs_update_data, t_transaction vt_transaction);int			li_rtn,li_idx
string		ls_sql,las_colname[],las_data[]
c_string	lc_string

li_rtn = lc_string.f_stringtoarray(vs_update_colname , ';', las_colname)
li_rtn = lc_string.f_stringtoarray(vs_update_data , ';', las_data)
ls_sql = "update " + vs_update_table + " set "
for li_idx = 1 to li_rtn
	ls_sql = ls_sql + las_colname[li_idx] + ' = ' + las_data[li_idx] 
	if li_idx <> li_rtn then ls_sql = ls_sql + ', '
next
ls_sql = "where id =  " + string(vdb_update_id)
execute immediate :ls_sql using vt_transaction;
if vt_transaction.sqlcode <> 0 then return -1
return 1
end function

public function integer f_update_related_doc_status (string vs_upd_doc_type, double vdb_t_doc_id, string vs_cur_doc_type, t_transaction vt_transaction);double		ldb_f_doc_id[],ladb_t_doc_id[]
string			ls_doc_type,ls_status
long			ll_rtn
int				li_idx, li_cnt

li_cnt = this.f_get_f_doc_id( vdb_t_doc_id, ldb_f_doc_id)
if li_cnt = 0 then return 0
//Do
//	if this.f_is_full_qty_matching(ldb_f_doc_id ) then
//		
//	end if
//	ls_doc_type = this.f_get_doc_type(ldb_f_doc_id )
//	if upper(ls_doc_type) <> upper(vs_upd_doc_type) then ldb_f_doc_id = this.f_get_f_doc_id( ldb_f_doc_id)
//Loop While upper(ls_doc_type) <> upper(vs_upd_doc_type) and ls_doc_type <> ''
//if this.f_is_full_qty_matching(ldb_f_doc_id) then
//	ll_rtn = this.f_get_t_doc_id( ldb_f_doc_id, ladb_t_doc_id[])
//else

//end if
//if upper(ls_doc_type) = upper(vs_upd_doc_type) then
//	return this.f_update_table( ldb_f_doc_id, 'document;', 'status;','' , vt_transaction)
//end if
return 0
end function

public function string f_get_update_doc_id (double vdb_f_doc_id, double vdb_t_doc_id, string vs_cur_doc_type);double		ldb_f_doc_id,ladb_t_doc_id[]
string			ls_doc_type,ls_status
long			ll_rtn
int				li_idx



/*if this.f_is_full_qty_matching(ldb_f_doc_id) then
	ll_rtn = this.f_get_t_doc_id( ldb_f_doc_id, ladb_t_doc_id[])
	if ll_rtn = 1 and ladb_t_doc_id[1] = vdb_t_doc_id then 
		if upper(vs_cur_doc_type) = 'GOODS_RECEIPT' then 
			ls_status = 'full_receive'
		elseif upper(vs_cur_doc_type) = 'GOODS_DELIVERY' then
			ls_status = 'full_issue'
		elseif upper(vs_cur_doc_type) = 'SAL_INVOICE' or upper(vs_cur_doc_type) = 'PUR_INVOICE' then
			ls_status = 'invoiced'
		elseif upper(vs_cur_doc_type) = 'BANK_VOUCHER_PAYMENT' or upper(vs_cur_doc_type) = 'BANK_VOUCHER' or upper(vs_cur_doc_type) = 'RECEIPT' or upper(vs_cur_doc_type) = 'PAYMENT' then
			ls_status = 'paid'
		end if
		return ls_status
	else
		for li_idx = 1 to ll_rtn
		next
	end if
else
	
end if*/
return ''
end function

public function integer f_get_trans_setup_account (t_ds_db vds_trans_setup, string vs_posting_type, t_dw_mpl vdw_get_amount, long vl_get_amount_row, ref s_str_post_account rstr_post_account);/**********************
Không cèn dùng: 20FEb18
*/
long		ll_found_row, ll_rtn
string		ls_find1

if vs_posting_type = 'NULL' then
	ls_find1 += " isnull(posting_type)" +" AND DW_GET_AMOUNT	= '"+ left(vdw_get_amount.dataobject, len(vdw_get_amount.dataobject) - 5) + "'"
else
	ls_find1 += " posting_type ='" +vs_posting_type+"' AND DW_GET_AMOUNT	= '"+ left(vdw_get_amount.dataobject, len(vdw_get_amount.dataobject) - 5) +"'"
end if
ll_found_row = vds_trans_setup.find(ls_find1, 1, vds_trans_setup.rowcount())

//-- lấy tài khoản đối tượng Nợ --//
ll_rtn = this.f_find_trans_setup_account_dr( vds_trans_setup, vs_posting_type, vdw_get_amount, vl_get_amount_row, ls_find1, rstr_post_account, ll_found_row)
if ll_rtn = -1 or ll_rtn = 0 then
	return ll_rtn
elseif ll_rtn = 2 then
	return ll_found_row
end if

//-- Lấy tài khoản đối tượng Có --//
ll_rtn = this.f_find_trans_setup_account_cr( vds_trans_setup, vs_posting_type, vdw_get_amount, vl_get_amount_row, ls_find1, rstr_post_account, ll_found_row)
if ll_rtn = -1 or ll_rtn = 0  then
	return ll_rtn	
end if
return ll_found_row

end function

public function long f_find_trans_setup_row_object (t_ds_db vds_trans_setup, ref long rl_trans_row, ref double rdb_object_id, ref string rs_object_type, string vs_posting_type, t_dw_mpl vdw_get_amount, long vl_get_amount_row, string vs_findstring1, string vs_dr_cr);/*************************
Không còn dùng
================*/
string		ls_find2, ls_find3
string		ls_dr_dw_object, ls_dr_object_col, ls_dr_obj_type, ls_dr_obj_name, ls_dr_obj_type_other
string		ls_CR_dw_object, ls_CR_object_col, ls_CR_obj_type, ls_CR_obj_name, ls_CR_obj_type_other
long		ll_found_row, ll_object_row
double	ldb_dr_object_id, ldb_dr_post_group, ldb_cr_object_id, ldb_cr_post_group, ldb_object_ref_id

t_dw_mpl	ldw_CR_object, ldw_dr_object
s_object		lso_object

lso_object = create s_object
if upper(vs_dr_cr) = 'DR' then
	ls_dr_dw_object =  vds_trans_setup.getitemstring(rl_trans_row, 'DR_DW_OBJECT')
	if not isnull(ls_dr_dw_object) and ls_dr_dw_object <> '' then    //-- Tìm theo đối tượng ghi sổ --//	
		//-- tìm đích danh --//
		ls_dr_object_col = vds_trans_setup.getitemstring(rl_trans_row, 'DR_OBJECT_COL')
		if isnull(ls_dr_object_col) or ls_dr_object_col = '' then
			gf_messagebox('m.b_doc.f_find_trans_setup_row_object.01','Thông báo','Chưa cài đặt cột chứa đối tượng ghi Nợ của DW:@'+ ls_dr_dw_object,'stop','ok',1)
			destroy lso_object
			return -1								
		end if			
		
		if ls_dr_dw_object = left(vdw_get_amount.dataobject, len(vdw_get_amount.dataobject) - 5) then
			ldb_dr_object_id = vdw_get_amount.getitemnumber(vl_get_amount_row, ls_dr_object_col)
		elseif upper(left(vdw_get_amount.dataobject, len(vdw_get_amount.dataobject) - 5)) = 'D_TAX_LINE' or upper(left(vdw_get_amount.dataobject, len(vdw_get_amount.dataobject) - 5)) = 'D_CHARGE_LINE' THEN
			ldw_dr_object = this.iw_display.dynamic f_get_dw(ls_dr_dw_object+ '_grid')
			ldb_object_ref_id =  vdw_get_amount.getitemnumber(vl_get_amount_row, 'object_ref_id')
			ll_object_row = ldw_dr_object.find( "id = "+string(ldb_object_ref_id) , 1, ldw_dr_object.rowcount())
			if ll_object_row = 0 then
				ldb_dr_object_id = ldw_dr_object.getitemnumber(ldw_dr_object.getrow(), ls_dr_object_col)
			else
				ldb_dr_object_id = ldw_dr_object.getitemnumber(ll_object_row, ls_dr_object_col)
			end if
		else
			ldw_dr_object = this.iw_display.dynamic f_get_dw(ls_dr_dw_object+ '_grid')
			ldb_dr_object_id = ldw_dr_object.getitemnumber(ldw_dr_object.getrow(), ls_dr_object_col)			
		end if
		
		if ldb_dr_object_id = 0 or isnull(ldb_dr_object_id) then 
			destroy lso_object
			return 0 		//-- không có đối tượng ghi sổ --//
		end if
		
		if lso_object.f_init_object( ldb_dr_object_id) = 1 then
			ls_dr_obj_type = lso_object.ids_attribute.getitemstring( 1, 'object_ref_table')//
			ldb_dr_post_group = lso_object.ids_attribute.getitemnumber( 1, 'posting_group')
			ls_dr_obj_name = lso_object.ids_attribute.getitemstring( 1, 'name')
			if isnull(ldb_dr_post_group) then ldb_dr_post_group = 0
		else
			gf_messagebox('m.b_doc.f_find_trans_setup_row_object.02','Thông báo','Không tìm thấy đối tượng Nợ','exclamation','ok',1)
			destroy lso_object
			return -1	
		end if			
		
		ls_find2 = " and dr_obj_type ='"+ upper(ls_dr_obj_type) +"'"
		ls_find3 = vs_findString1 + ls_find2 + " and DR_OBJ_INSTANCE_ID ="+string(ldb_dr_object_id) 
		ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())				
		
		if ll_found_row = 0 then // Tìm theo nhóm ghi sổ --//
			ls_find3 = vs_findString1 + ls_find2 + " and DR_POSTING_GROUP ="+string(ldb_dr_post_group)
			ls_find3 +=  " and DR_SETUP_TYPE = 'group'"
			ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())			
		end if
		
		if ll_found_row = 0 then // Tìm theo loại tất cả--//
			ls_find3 = vs_findString1 + ls_find2 + " and DR_SETUP_TYPE = 'all'"
			ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())			
		end if
		
		if ll_found_row > 0 then
			rl_trans_row = ll_found_row
			rdb_object_id = ldb_dr_object_id
			rs_object_type = ls_dr_obj_type
			destroy lso_object
			return 1
		else
			//-- Object vừa là khách hàng vừa là nhà cung cấp --//
			ls_dr_obj_type_other = this.f_get_obj_type_other(ldb_dr_object_id , ls_dr_obj_type)
			if isnull(ls_dr_obj_type_other) or ls_dr_obj_type_other = '' then
				return 0
				gf_messagebox('m.b_doc.f_find_trans_setup_row_object.06','Thông báo','Không tìm thấy cài đặt tài khoản ghi sổ của đối tượng Nợ:@'+ls_dr_obj_name,'stop','ok',1)
				destroy lso_object
				return -1
			end if
			ls_find2 = " and dr_obj_type ='"+ upper(ls_dr_obj_type_other) +"'"
			ls_find3 = vs_findString1 + ls_find2 + " and DR_OBJ_INSTANCE_ID ="+string(ldb_dr_object_id)
			ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())		
			
			if ll_found_row = 0 then // Tìm theo nhóm ghi sổ --//
				ls_find3 = vs_findString1 + ls_find2 + " and DR_POSTING_GROUP ="+string(ldb_dr_post_group)
				ls_find3 +=  " and DR_SETUP_TYPE = 'group'"
				ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())			
			end if
			
			if ll_found_row = 0 then // Tìm theo loại tất cả--//
				ls_find3 = vs_findString1 + ls_find2 + " and DR_SETUP_TYPE = 'all'"
				ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())			
			end if
			
			if ll_found_row > 0 then				
				rl_trans_row = ll_found_row
				rdb_object_id = ldb_dr_object_id
				rs_object_type = ls_dr_obj_type
				destroy lso_object
				return 1
			else
				return 0
				gf_messagebox('m.b_doc.f_find_trans_setup_row_object.07','Thông báo','Không tìm thấy cài đặt tài khoản ghi sổ của đối tượng Nợ:@'+ls_dr_obj_name,'stop','ok',1)
				destroy lso_object
				return -1
			end if				
		end if
	end if
elseif upper(vs_dr_cr) = 'CR' then
	ls_CR_dw_object =  vds_trans_setup.getitemstring(rl_trans_row, 'CR_DW_OBJECT')
	if not isnull(ls_CR_dw_object) and ls_CR_dw_object <> '' then    //-- Tìm theo đối tượng ghi sổ --//	
		//-- tìm đích danh --//
		ls_CR_object_col = vds_trans_setup.getitemstring(rl_trans_row, 'CR_OBJECT_COL')
		if isnull(ls_CR_object_col) or ls_CR_object_col = '' then
			gf_messagebox('m.b_doc.f_find_trans_setup_row_object.01','Thông báo','Chưa cài đặt cột chứa đối tượng ghi Có của DW:@'+ ls_CR_dw_object,'stop','ok',1)
			destroy lso_object
			return -1								
		end if			
		
		if ls_CR_dw_object = left(vdw_get_amount.dataobject, len(vdw_get_amount.dataobject) - 5) then
			ldb_CR_object_id = vdw_get_amount.getitemnumber(vl_get_amount_row, ls_CR_object_col)
		elseif upper(left(vdw_get_amount.dataobject, len(vdw_get_amount.dataobject) - 5)) = 'D_TAX_LINE' or upper(left(vdw_get_amount.dataobject, len(vdw_get_amount.dataobject) - 5)) = 'D_CHARGE_LINE' THEN
			ldw_CR_object = this.iw_display.dynamic f_get_dw(ls_CR_dw_object+ '_grid')
			ldb_object_ref_id =  vdw_get_amount.getitemnumber(vl_get_amount_row, 'object_ref_id')
			ll_object_row = ldw_CR_object.find( "id = "+string(ldb_object_ref_id) , 1, ldw_CR_object.rowcount())								
			if ll_object_row = 0 then
				ldb_CR_object_id = ldw_CR_object.getitemnumber(ldw_CR_object.getrow(), ls_CR_object_col)
			else
				ldb_CR_object_id = ldw_CR_object.getitemnumber(ll_object_row, ls_CR_object_col)
			end if			
		else
			ldw_CR_object = this.iw_display.dynamic f_get_dw(ls_CR_dw_object+ '_grid')
			ldb_CR_object_id = ldw_CR_object.getitemnumber(ldw_CR_object.getrow(), ls_CR_object_col)			
		end if
		
		if ldb_CR_object_id = 0 or isnull(ldb_CR_object_id) then return 0 		//-- không có đối tượng ghi sổ --//
		
		if lso_object.f_init_object( ldb_CR_object_id) = 1 then
			ls_CR_obj_type = lso_object.ids_attribute.getitemstring( 1, 'object_ref_table')//
			ldb_CR_post_group = lso_object.ids_attribute.getitemnumber( 1, 'posting_group')
			ls_CR_obj_name = lso_object.ids_attribute.getitemstring( 1, 'name')
			if isnull(ldb_CR_post_group) then ldb_CR_post_group = 0
		else
			gf_messagebox('m.b_doc.f_find_trans_setup_row_object.02','Thông báo','Không tìm thấy đối tượng Có','exclamation','ok',1)
			destroy lso_object
			return -1	
		end if			
		
		ls_find2 = " and CR_obj_type ='"+ upper(ls_CR_obj_type) +"'"
		ls_find3 = vs_findString1 + ls_find2 + " and CR_OBJ_INSTANCE_ID ="+string(ldb_CR_object_id) 
		ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())				
		
		if ll_found_row = 0 then // Tìm theo nhóm ghi sổ --//
			ls_find3 = vs_findString1 + ls_find2 + " and CR_POSTING_GROUP ="+string(ldb_CR_post_group)
			ls_find3 +=  " and CR_SETUP_TYPE = 'group'"
			ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())			
		end if
		
		if ll_found_row = 0 then // Tìm theo loại tất cả--//
			ls_find3 = vs_findString1 + ls_find2 + " and CR_SETUP_TYPE = 'all'"
			ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())			
		end if
		
		if ll_found_row > 0 then
			rl_trans_row = ll_found_row
			rdb_object_id = ldb_CR_object_id
			rs_object_type = ls_cr_obj_type
			destroy lso_object
			return 1
		else
			//-- Object vừa là khách hàng vừa là nhà cung cấp --//
			ls_CR_obj_type_other = this.f_get_obj_type_other(ldb_CR_object_id , ls_CR_obj_type)
			if isnull(ls_CR_obj_type_other) or ls_CR_obj_type_other = '' then
				return 0
				gf_messagebox('m.b_doc.f_find_trans_setup_row_object.06','Thông báo','Không tìm thấy cài đặt tài khoản ghi sổ của đối tượng Có:@'+ls_CR_obj_name,'stop','ok',1)
				destroy lso_object
				return -1
			end if
			ls_find2 = " and CR_obj_type ='"+ upper(ls_CR_obj_type_other) +"'"
			ls_find3 = vs_findString1 + ls_find2 + " and CR_OBJ_INSTANCE_ID ="+string(ldb_CR_object_id)
			ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())		
			
			if ll_found_row = 0 then // Tìm theo nhóm ghi sổ --//
				ls_find3 = vs_findString1 + ls_find2 + " and CR_POSTING_GROUP ="+string(ldb_CR_post_group)
				ls_find3 +=  " and CR_SETUP_TYPE = 'group'"
				ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())			
			end if
			
			if ll_found_row = 0 then // Tìm theo loại tất cả--//
				ls_find3 = vs_findString1 + ls_find2 + " and CR_SETUP_TYPE = 'all'"
				ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())			
			end if
			
			if ll_found_row > 0 then
				rl_trans_row = ll_found_row
				rdb_object_id = ldb_CR_object_id
				rs_object_type = ls_cr_obj_type
				destroy lso_object
				return 1
			else
				return 0
				gf_messagebox('m.b_doc.f_find_trans_setup_row_object.07','Thông báo','Không tìm thấy cài đặt tài khoản ghi sổ của đối tượng Có:@'+ls_CR_obj_name,'stop','ok',1)
				destroy lso_object
				return -1
			end if				
		end if
	else //-- Cả Nợ và có đều là tài khoản --//
		return 1
	end if	
end if
end function

public function boolean f_is_period_closed (date vd_trans_date, string vs_trans_type);
 

return false
end function

public function long f_find_trans_setup_row_object_dr (t_ds_db vds_trans_setup, ref long rl_trans_row, ref double rdb_object_id, double rdb_subaccount, ref string rs_object_type, string vs_posting_type, t_dw_mpl vdw_get_amount, long vl_get_amount_row, string vs_findstring1);string		ls_find2, ls_find3
string		ls_dr_dw_object, ls_dr_object_col, ls_dr_obj_type, ls_dr_obj_name, ls_dr_obj_type_other
long		ll_found_row, ll_object_row
double	ldb_dr_object_id, ldb_dr_post_group, ldb_subaccount

t_dw_mpl	ldw_master, ldw_dr_object
s_object		lso_object

lso_object = create s_object

ls_dr_dw_object =  vds_trans_setup.getitemstring(rl_trans_row, 'DR_DW_OBJECT')
if not isnull(ls_dr_dw_object) and ls_dr_dw_object <> '' then    //-- Tìm theo đối tượng ghi sổ --//	
	//-- tìm đích danh --//
	ls_dr_object_col = vds_trans_setup.getitemstring(rl_trans_row, 'DR_OBJECT_COL')
	if isnull(ls_dr_object_col) or ls_dr_object_col = '' then
		gf_messagebox('m.b_doc.f_find_trans_setup_row_object.01','Thông báo','Chưa cài đặt cột chứa đối tượng ghi Nợ của DW:@'+ ls_dr_dw_object,'stop','ok',1)
		destroy lso_object
		return -1								
	end if			
	//-- lấy Id của object --//
	if this.f_get_object_and_subaccount(ls_dr_dw_object , ls_dr_object_col,vdw_get_amount, vl_get_amount_row, ldb_dr_object_id, ldb_subaccount) = -1 then return -1	
	if ldb_dr_object_id = 0 or isnull(ldb_dr_object_id) then 
		destroy lso_object
		return 0 		//-- không có đối tượng ghi sổ --//
	end if
	
	//-- gán object Id và subaccount --//
	rdb_object_id = ldb_dr_object_id
	rdb_subaccount = ldb_subaccount	
	
	if lso_object.f_init_object( ldb_dr_object_id) = 1 then
		ls_dr_obj_type = lso_object.ids_attribute.getitemstring( 1, 'object_ref_table')//
		ldb_dr_post_group = lso_object.ids_attribute.getitemnumber( 1, 'posting_group')
		ls_dr_obj_name = lso_object.ids_attribute.getitemstring( 1, 'name')
		if isnull(ldb_dr_post_group) then ldb_dr_post_group = 0
	else
		destroy lso_object
		return -1	
	end if			
	
	//-- trường hợp đối tượng tài khoản --//
	if upper(ls_dr_obj_type) = 'ACCOUNT' then
		rs_object_type = ls_dr_obj_type
		destroy lso_object
		return 1		
	end if
	
	ls_find2 = " and dr_obj_type ='"+ upper(ls_dr_obj_type) +"'"
	ls_find3 = vs_findString1 + ls_find2 + " and DR_OBJ_INSTANCE_ID ="+string(ldb_dr_object_id) 
	ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())				
	
	if ll_found_row = 0 then // Tìm theo nhóm ghi sổ --//
		ls_find3 = vs_findString1 + ls_find2 + " and DR_POSTING_GROUP ="+string(ldb_dr_post_group)
		ls_find3 +=  " and DR_SETUP_TYPE = 'group'"
		ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())			
	end if
	
	if ll_found_row = 0 then // Tìm theo loại tất cả--//
		ls_find3 = vs_findString1 + ls_find2 + " and DR_SETUP_TYPE = 'all'"
		ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())			
	end if
	
	if ll_found_row > 0 then
		rl_trans_row = ll_found_row
		rs_object_type = ls_dr_obj_type
		destroy lso_object
		return 1
	else
		//-- Object vừa là khách hàng vừa là nhà cung cấp --//
		ls_dr_obj_type_other = this.f_get_obj_type_other(ldb_dr_object_id , ls_dr_obj_type)
		if isnull(ls_dr_obj_type_other) or ls_dr_obj_type_other = '' then
			return 0
		end if
		ls_find2 = " and dr_obj_type ='"+ upper(ls_dr_obj_type_other) +"'"
		ls_find3 = vs_findString1 + ls_find2 + " and DR_OBJ_INSTANCE_ID ="+string(ldb_dr_object_id)
		ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())		
		
		if ll_found_row = 0 then // Tìm theo nhóm ghi sổ --//
			ls_find3 = vs_findString1 + ls_find2 + " and DR_POSTING_GROUP ="+string(ldb_dr_post_group)
			ls_find3 +=  " and DR_SETUP_TYPE = 'group'"
			ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())			
		end if
		
		if ll_found_row = 0 then // Tìm theo loại tất cả--//
			ls_find3 = vs_findString1 + ls_find2 + " and DR_SETUP_TYPE = 'all'"
			ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())			
		end if
		
		if ll_found_row > 0 then				
			rl_trans_row = ll_found_row
			rs_object_type = ls_dr_obj_type
			destroy lso_object
			return 1
		else
			return 0
		end if				
	end if
end if
return 0

end function

public function integer f_get_object_and_subaccount (string vs_dw_object, string vs_object_col, t_dw_mpl vdw_get_amount, long vl_get_amount_row, ref double rdb_object_id, ref double rdb_subaccount);
double			ldb_object_ref_id
long				ll_object_row
t_dw_mpl		ldw_object, ldw_master

if vs_dw_object = left(vdw_get_amount.dataobject, len(vdw_get_amount.dataobject) - 5) then
	rdb_object_id = vdw_get_amount.getitemnumber(vl_get_amount_row, vs_object_col)
	if upper(vdw_get_amount.describe('datawindow.Table.UpdateTable')) = 'LEDGER_LINE' then
		rdb_subaccount = vdw_get_amount.getitemnumber(vl_get_amount_row, 'dr_subaccount')
	else
		rdb_subaccount = vdw_get_amount.getitemnumber(vl_get_amount_row, 'subaccount')
	end if		
else
	ldw_object = this.iw_display.dynamic f_get_dw(vs_dw_object+ '_grid')
	if not isvalid(ldw_object) then
		gf_messagebox('m.b_doc.f_get_object_and_subaccount.01','Thông báo','Không tìm thấy DW OBJECT trong cài đặt ghi sổ:@'+ vs_dw_object,'stop','ok',1)
		return -1
	end if
	ldw_master = vdw_get_amount.dynamic f_get_idw_master()
	if isvalid(ldw_master) then
		if ldw_object = ldw_master then			
			ldb_object_ref_id =  vdw_get_amount.getitemnumber(vl_get_amount_row, 'object_ref_id')
			ll_object_row = ldw_object.find( "id = "+string(ldb_object_ref_id) , 1, ldw_object.rowcount())
		end if
	end if
	if ll_object_row = 0 then ll_object_row = ldw_object.getrow() 
	rdb_object_id = ldw_object.getitemnumber(ll_object_row, vs_object_col)	
	if upper(ldw_object.describe('datawindow.Table.UpdateTable')) = 'LEDGER_LINE' then
		rdb_subaccount = ldw_object.getitemnumber(ll_object_row, 'dr_subaccount')
	else
		rdb_subaccount = ldw_object.getitemnumber(ll_object_row, 'subaccount')
	end if				
end if

return 1
end function

public function long f_find_trans_setup_account_dr (t_ds_db vds_trans_setup, string vs_posting_type, t_dw_mpl vdw_get_amount, long vl_get_amount_row, string vs_findstr1, ref s_str_post_account rstr_post_account, ref long rl_trans_setup_row);/**************************
*/


string		ls_dw_trans_text, ls_col_trans_text, ls_trans_text, ls_type_text
string		ls_cr_obj_type, ls_cr_dw_object, ls_dr_dw_object, ls_dr_obj_type
string		ls_dr_dw_criteria, ls_dr_col_criteria, ls_dr_coltype_criteria, ls_cr_dw_criteria, ls_criteria_value
long		ll_found_row, ll_rtn, ll_criteria_row, ll_trans_text_row, ll_found_row_dr
boolean	lb_ok, lb_cr_found
any		la_dr_criteria_data
double	ldb_dr_object_id, ldb_cr_object_id, ldb_account_id, ldb_object_ref_id, ldb_dr_subaccount, ldb_cr_subaccount

t_dw_mpl	ldw_dr_criteria, ldw_master, ldw_trans_text
b_rule		lb_rule

if rl_trans_setup_row > 0 then
	ll_found_row = rl_trans_setup_row
	ldw_master = vdw_get_amount.dynamic f_get_idw_master()
	DO while not lb_ok and ll_found_row > 0
		ls_dr_dw_criteria = vds_trans_setup.getitemstring(ll_found_row, 'dr_dw_criterial')		
		ls_dr_dw_object =  vds_trans_setup.getitemstring(ll_found_row, 'DR_dw_object')

		//--Không phụ thuộc đk và không đối tượng -> ưu tiên tìm bên có --//
		if (isnull(ls_dr_dw_criteria) or ls_dr_dw_criteria = '') AND (isnull(ls_dr_dw_object) or ls_dr_dw_object = '') then	
			ll_found_row_dr = ll_found_row
			ll_rtn = this.f_find_trans_setup_account_cr( vds_trans_setup,vs_posting_type, vdw_get_amount, vl_get_amount_row, vs_findstr1, rstr_post_account, ll_found_row_dr )
			//-- xử lý --//
			if ll_rtn = 1 then 				
				lb_cr_found = true
				ls_dr_obj_type =  vds_trans_setup.getitemstring(ll_found_row, 'dr_obj_type')
				lb_ok = true
				ll_found_row = ll_found_row_dr
			end if
			if ll_rtn = -1 or ll_rtn = 0 then return ll_rtn
		else
			ll_found_row_dr = ll_found_row
			ls_cr_dw_criteria = vds_trans_setup.getitemstring(ll_found_row, 'cr_dw_criterial')
			if  (isnull(ls_dr_dw_criteria) or ls_dr_dw_criteria = '') AND ( not isnull(ls_cr_dw_criteria) and ls_cr_dw_criteria <> '' ) then
				//-- Ưu tiên tìm bên Có trước --//
				ll_found_row_dr = ll_found_row
				ll_rtn = this.f_find_trans_setup_account_cr( vds_trans_setup,vs_posting_type, vdw_get_amount, vl_get_amount_row, vs_findstr1, rstr_post_account, ll_found_row_dr )
				if ll_rtn = 1 then  lb_cr_found = true
				if ll_rtn = -1 or ll_rtn = 0 then return ll_rtn
			elseif not isnull(ls_dr_dw_criteria) and ls_dr_dw_criteria <> '' then				//-- Tìm theo ĐK bên nợ --//
				ldw_dr_criteria = this.iw_display.dynamic f_get_dw(ls_dr_dw_criteria+ '_grid')
				if not isvalid(ldw_dr_criteria)  then
					gf_messagebox('m.b_doc.f_find_setup_account_dr.01','Thông báo','Không tìm thấy DW điều kiện:@'+ ls_dr_dw_criteria,'stop','ok',1)
					return -1								
				end if								
				ls_dr_col_criteria = vds_trans_setup.getitemstring(ll_found_row, 'DR_COL_CRITERIAL')
				if isnull(ls_dr_col_criteria) or ls_dr_col_criteria = '' then
					gf_messagebox('m.b_doc.f_find_setup_account_dr.02','Thông báo',' Chưa cài đặt cột phụ thuộc của DW điều kiện:@'+ ls_dr_dw_criteria,'stop','ok',1)
					return -1								
				end if			
			
				DO while not lb_ok and ll_found_row > 0 	//-- Tìm khi có điều kiện phụ thuộc --//				
					ls_criteria_value = vds_trans_setup.getitemstring(ll_found_row, 'DR_VALUE_CRITERIAL')
					if isnull(ls_criteria_value) or ls_criteria_value = '' then
						gf_messagebox('m.b_doc.f_find_setup_account_dr.03','Thông báo',' Chưa cài đặt giá trị phụ thuộc DW điều kiện:@'+ ls_dr_dw_criteria,'stop','ok',1)
						return -1								
					end if
									
					if ls_dr_dw_criteria = left(vdw_get_amount.dataobject, len(vdw_get_amount.dataobject) - 5) then
						la_dr_criteria_data = vdw_get_amount.dynamic f_getitemany(vl_get_amount_row, ls_dr_col_criteria)
						ls_dr_coltype_criteria = vdw_get_amount.describe(ls_dr_col_criteria+'.coltype')
					else
						if isvalid(ldw_master) then
							if ldw_dr_criteria = ldw_master then
								ldb_object_ref_id =  vdw_get_amount.getitemnumber(vl_get_amount_row, 'object_ref_id')
								ll_criteria_row = ldw_dr_criteria.find( "id = "+string(ldb_object_ref_id) , 1, ldw_dr_criteria.rowcount())						
							end if
						end if
						if ll_criteria_row = 0 then ll_criteria_row = ldw_dr_criteria.getrow()
						la_dr_criteria_data = ldw_dr_criteria.dynamic f_getitemany(ll_criteria_row, ls_dr_col_criteria)
						ls_dr_coltype_criteria = ldw_dr_criteria.describe(ls_dr_col_criteria+'.coltype')				
					end if
					
					lb_ok =  lb_rule.f_is_criteria_ok( string(la_dr_criteria_data), ls_criteria_value, ls_dr_coltype_criteria)				
					if lb_ok then exit
					ll_found_row = vds_trans_setup.find(vs_findStr1, ll_found_row+1, vds_trans_setup.rowcount()+1)	
				LOOP
				if not lb_ok then
					gf_messagebox('m.b_doc.f_find_setup_account_dr.04','Thông báo','Cài đặt điều kiện phụ thuộc chưa đầy đủ:@'+ ls_dr_dw_criteria,'stop','ok',1)
					return -1												
				else
					lb_ok = false 		//-- trả lại giá trị false để tiếp tục xét theo đối tượng ghi sổ --//
					vs_findStr1 += " AND DR_VALUE_CRITERIAL ='" + ls_criteria_value + "'"
				end if							
			end if
			
			//-- Tiếp tục kiểm tìm theo đối tượng bên Nợ --//			
			ls_dr_dw_object =  vds_trans_setup.getitemstring(ll_found_row, 'DR_dw_object')
			if isnull(ls_dr_dw_object) or ls_dr_dw_object = '' then //-- Trường hợp ben Nợ không có đối tượng nhưng có ĐK --//
				lb_ok = true				
				ls_dr_obj_type =  vds_trans_setup.getitemstring(ll_found_row, 'dr_obj_type')
			else
//				ll_rtn = this.f_find_trans_setup_row_object_dr( vds_trans_setup, ll_found_row, ldb_dr_object_id, ldb_dr_subaccount, ls_dr_obj_type, vs_posting_type, vdw_get_amount,  vl_get_amount_row, vs_findStr1)
				ll_rtn = this.f_find_trans_setup_row_object_dr( vds_trans_setup, ll_found_row_dr, ldb_dr_object_id, ldb_dr_subaccount, ls_dr_obj_type, vs_posting_type, vdw_get_amount,  vl_get_amount_row, vs_findStr1)
				if ll_rtn = 1 then lb_ok = true
				if ll_rtn = -1 or ll_rtn = 0 then return ll_rtn				
			end if			
		end if		
	LOOP
	//-- set tài khoản Nợ trả về--//
//	rl_trans_setup_row = ll_found_row
	rl_trans_setup_row = ll_found_row_dr
	rstr_post_account.db_dr_object_id = ldb_dr_object_id
	rstr_post_account.s_dr_object_type = ls_dr_obj_type	
	
	if upper(ls_dr_obj_type) = 'ACCOUNT' and (not isnull(ls_dr_dw_object) and ls_dr_dw_object <> '' ) then
		rstr_post_account.db_dr_account = ldb_dr_object_id		
	else
		ldb_account_id = vds_trans_setup.getitemnumber(ll_found_row_dr, 'DR_ACCT_ID')
		if ldb_account_id = 0 or isnull(ldb_account_id) then
			gf_messagebox('m.b_doc.f_find_setup_account_dr.05','Thông báo','Chưa cài đặt tài khoản Nợ của nghiệp vụ:@'+ vs_posting_type,'stop','ok',1)
			return -1
		end if
		rstr_post_account.db_dr_account = ldb_account_id
	end if		
	//-- set subaccount  Nợ --//
	if ldb_dr_subaccount = 0 or isnull(ldb_dr_subaccount) then ldb_dr_subaccount = vds_trans_setup.getitemnumber(ll_found_row, 'DR_SUBACCT_ID')
	rstr_post_account.db_dr_subaccount = ldb_dr_subaccount
	//-- Get dw_trans_text and column_trans_text --//
	if rstr_post_account.s_trans_text = '' or isnull(rstr_post_account.s_trans_text) then
		ls_dw_trans_text =  vds_trans_setup.getitemstring( ll_found_row, 'dw_trans_text')
		ls_col_trans_text =  vds_trans_setup.getitemstring( ll_found_row, 'column_trans_text')
		ls_type_text = vds_trans_setup.getitemstring( ll_found_row, 'trans_text')
//		if isnull(ls_dw_trans_text) or isnull(ls_col_trans_text) then
//			ls_type_text = vds_trans_setup.getitemstring( ll_found_row, 'trans_text')
		if not isnull(ls_dw_trans_text) and not isnull(ls_col_trans_text) then
			if ls_dw_trans_text = left(vdw_get_amount.dataobject, len(vdw_get_amount.dataobject) - 5) then 
				ls_trans_text = vdw_get_amount.getitemstring( vl_get_amount_row , ls_col_trans_text)
			else
				ldw_master = vdw_get_amount.dynamic f_get_idw_master()
				ldw_trans_text = this.iw_display.dynamic f_get_dw(ls_dw_trans_text+ '_grid')
				if not isvalid(ldw_trans_text)  then
					gf_messagebox('m.b_doc.f_find_setup_account_dr.06','Thông báo','Không tìm thấy DW TRANS TEXT:@'+ ls_dw_trans_text,'stop','ok',1)
					return -1								
				end if								
				if isvalid(ldw_master) then
					if ldw_trans_text = ldw_master then
						ldb_object_ref_id =  vdw_get_amount.getitemnumber(vl_get_amount_row, 'object_ref_id')
						ll_trans_text_row = ldw_trans_text.find( "id = "+string(ldb_object_ref_id) , 1, ldw_trans_text.rowcount())						
					end if
				end if
				if ll_trans_text_row = 0 then ll_trans_text_row = ldw_trans_text.getrow()			
				ls_trans_text = ldw_trans_text.getitemstring( ll_trans_text_row, ls_col_trans_text)			
			end if
		end if	
		if (ls_type_text = '' or isnull(ls_type_text)) and ls_trans_text <> '' then
			ls_type_text = ls_trans_text
		elseif ( ls_trans_text = '' or isnull(ls_trans_text) ) and ls_type_text <> ''then
			ls_trans_text = ls_type_text
		elseif ls_type_text <>'' and ls_trans_text <> '' then
			ls_trans_text = ls_type_text + '-' + ls_trans_text
		end if
		rstr_post_account.s_trans_text = ls_trans_text	
		rstr_post_account.s_post_type_text = ls_type_text
	end if
	//-- set tk Có trả về--//
	if lb_cr_found then				
		return 2		
	end if		
	return 1		
end if
return 0

end function

public function long f_find_trans_setup_row_object_cr (t_ds_db vds_trans_setup, ref long rl_trans_row, ref double rdb_object_id, double rdb_subaccount, ref string rs_object_type, string vs_posting_type, t_dw_mpl vdw_get_amount, long vl_get_amount_row, string vs_findstring1);string		ls_find2, ls_find3
string		ls_CR_dw_object, ls_CR_object_col, ls_CR_obj_type, ls_CR_obj_name, ls_CR_obj_type_other
long		ll_found_row, ll_object_row
double	ldb_CR_object_id, ldb_CR_post_group, ldb_subaccount

t_dw_mpl	ldw_master, ldw_CR_object
s_object		lso_object

lso_object = create s_object

ls_CR_dw_object =  vds_trans_setup.getitemstring(rl_trans_row, 'CR_DW_OBJECT')
if not isnull(ls_CR_dw_object) and ls_CR_dw_object <> '' then    //-- Tìm theo đối tượng ghi sổ --//	
	//-- tìm đích danh --//
	ls_CR_object_col = vds_trans_setup.getitemstring(rl_trans_row, 'CR_OBJECT_COL')
	if isnull(ls_CR_object_col) or ls_CR_object_col = '' then
		gf_messagebox('m.b_doc.f_find_trans_setup_row_object.01','Thông báo','Chưa cài đặt cột chứa đối tượng ghi Nợ của DW:@'+ ls_CR_dw_object,'stop','ok',1)
		destroy lso_object
		return -1								
	end if			
	//-- lấy Id của object --//
	if this.f_get_object_and_subaccount(ls_CR_dw_object , ls_CR_object_col,vdw_get_amount, vl_get_amount_row, ldb_CR_object_id, ldb_subaccount) = -1 then return -1	
	if ldb_CR_object_id = 0 or isnull(ldb_CR_object_id) then 
		destroy lso_object
		return 0 		//-- không có đối tượng ghi sổ --//
	end if
	
	//-- gán object Id và subaccount --//
	rdb_object_id = ldb_CR_object_id
	rdb_subaccount = ldb_subaccount	
	
	if lso_object.f_init_object( ldb_CR_object_id) = 1 then
		ls_CR_obj_type = lso_object.ids_attribute.getitemstring( 1, 'object_ref_table')//
		ldb_CR_post_group = lso_object.ids_attribute.getitemnumber( 1, 'posting_group')
		ls_CR_obj_name = lso_object.ids_attribute.getitemstring( 1, 'name')
		if isnull(ldb_CR_post_group) then ldb_CR_post_group = 0
	else
		destroy lso_object
		return -1	
	end if			
	
	//-- trường hợp đối tượng tài khoản --//
	if upper(ls_CR_obj_type) = 'ACCOUNT' then
		rs_object_type = ls_CR_obj_type
		destroy lso_object
		return 1		
	end if
	
	ls_find2 = " and CR_obj_type ='"+ upper(ls_CR_obj_type) +"'"
	ls_find3 = vs_findString1 + ls_find2 + " and CR_OBJ_INSTANCE_ID ="+string(ldb_CR_object_id) 
	ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())				
	
	if ll_found_row = 0 then // Tìm theo nhóm ghi sổ --//
		ls_find3 = vs_findString1 + ls_find2 + " and CR_POSTING_GROUP ="+string(ldb_CR_post_group)
		ls_find3 +=  " and CR_SETUP_TYPE = 'group'"
		ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())			
	end if
	
	if ll_found_row = 0 then // Tìm theo loại tất cả--//
		ls_find3 = vs_findString1 + ls_find2 + " and CR_SETUP_TYPE = 'all'"
		ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())			
	end if
	
	if ll_found_row > 0 then
		rl_trans_row = ll_found_row
		rs_object_type = ls_CR_obj_type
		destroy lso_object
		return 1
	else
		//-- Object vừa là khách hàng vừa là nhà cung cấp --//
		ls_CR_obj_type_other = this.f_get_obj_type_other(ldb_CR_object_id , ls_CR_obj_type)
		if isnull(ls_CR_obj_type_other) or ls_CR_obj_type_other = '' then
			return 0
		end if
		ls_find2 = " and CR_obj_type ='"+ upper(ls_CR_obj_type_other) +"'"
		ls_find3 = vs_findString1 + ls_find2 + " and CR_OBJ_INSTANCE_ID ="+string(ldb_CR_object_id)
		ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())		
		
		if ll_found_row = 0 then // Tìm theo nhóm ghi sổ --//
			ls_find3 = vs_findString1 + ls_find2 + " and CR_POSTING_GROUP ="+string(ldb_CR_post_group)
			ls_find3 +=  " and CR_SETUP_TYPE = 'group'"
			ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())			
		end if
		
		if ll_found_row = 0 then // Tìm theo loại tất cả--//
			ls_find3 = vs_findString1 + ls_find2 + " and CR_SETUP_TYPE = 'all'"
			ll_found_row = vds_trans_setup.find(ls_find3, 1, vds_trans_setup.rowcount())			
		end if
		
		if ll_found_row > 0 then				
			rl_trans_row = ll_found_row
			rs_object_type = ls_CR_obj_type
			destroy lso_object
			return 1
		else
			return 0
		end if				
	end if
end if
return 0

end function

public function integer f_find_trans_setup_account_cr (t_ds_db vds_trans_setup, string vs_posting_type, t_dw_mpl vdw_get_amount, long vl_get_amount_row, string vs_findstr1, ref s_str_post_account rstr_post_account, ref long rl_trans_setup_row);/**************************
*/

string		ls_dw_trans_text, ls_col_trans_text, ls_trans_text, ls_type_text
string		ls_cr_obj_type, ls_cr_dw_object
string		ls_CR_col_criteria, ls_CR_coltype_criteria, ls_cr_dw_criteria, ls_criteria_value
long		ll_found_row, ll_rtn, ll_criteria_row, ll_trans_text_row
boolean	lb_ok
any		la_CR_criteria_data
double	ldb_cr_object_id, ldb_account_id, ldb_cr_subaccount, ldb_object_ref_id

t_dw_mpl	ldw_CR_criteria, ldw_master, ldw_trans_text
b_rule		lb_rule

if rl_trans_setup_row > 0 then
	ll_found_row = rl_trans_setup_row
	ldw_master = vdw_get_amount.dynamic f_get_idw_master()
	DO while not lb_ok and ll_found_row > 0
		ls_CR_dw_criteria = vds_trans_setup.getitemstring(ll_found_row, 'CR_dw_criterial')		
		ls_CR_dw_object =  vds_trans_setup.getitemstring(ll_found_row, 'CR_dw_object')
		//--Không phụ thuộc đk và không đối tượng --//
		if (isnull(ls_CR_dw_criteria) or ls_CR_dw_criteria = '') AND (isnull(ls_CR_dw_object) or ls_CR_dw_object = '') then	
			lb_ok = true
			ls_CR_obj_type =  vds_trans_setup.getitemstring(ll_found_row, 'CR_obj_type')
		else
			if not isnull(ls_CR_dw_criteria) and ls_CR_dw_criteria <> '' then				//-- Tìm theo ĐK bên Có --//
				ldw_CR_criteria = this.iw_display.dynamic f_get_dw(ls_CR_dw_criteria+ '_grid')
				if not isvalid(ldw_CR_criteria)  then
					gf_messagebox('m.b_doc.f_find_setup_account_dr.03','Thông báo','Không tìm thấy DW điều kiện:@'+ ls_CR_dw_criteria,'stop','ok',1)
					return -1								
				end if								
				ls_CR_col_criteria = vds_trans_setup.getitemstring(ll_found_row, 'CR_COL_CRITERIAL')
				if isnull(ls_CR_col_criteria) or ls_CR_col_criteria = '' then
					gf_messagebox('m.b_doc.f_find_setup_account_dr.02','Thông báo',' Chưa cài đặt cột phụ thuộc của DW điều kiện:@'+ ls_CR_dw_criteria,'stop','ok',1)
					return -1								
				end if			
			
				DO while not lb_ok and ll_found_row > 0 	//-- Tìm khi có điều kiện phụ thuộc --//				
					ls_criteria_value = vds_trans_setup.getitemstring(ll_found_row, 'CR_VALUE_CRITERIAL')
					if isnull(ls_criteria_value) or ls_criteria_value = '' then
						gf_messagebox('m.b_doc.f_find_setup_account_dr.01','Thông báo',' Chưa cài đặt giá trị phụ thuộc DW điều kiện:@'+ ls_CR_dw_criteria,'stop','ok',1)
						return -1								
					end if
									
					if ls_CR_dw_criteria = left(vdw_get_amount.dataobject, len(vdw_get_amount.dataobject) - 5) then
						la_CR_criteria_data = vdw_get_amount.dynamic f_getitemany(vl_get_amount_row, ls_CR_col_criteria)
						ls_CR_coltype_criteria = vdw_get_amount.describe(ls_CR_col_criteria+'.coltype')
					else
						if isvalid(ldw_master) then
							if ldw_CR_criteria = ldw_master then
								ldb_object_ref_id =  vdw_get_amount.getitemnumber(vl_get_amount_row, 'object_ref_id')
								ll_criteria_row = ldw_CR_criteria.find( "id = "+string(ldb_object_ref_id) , 1, ldw_CR_criteria.rowcount())						
							end if
						end if
						if ll_criteria_row = 0 then ll_criteria_row = ldw_CR_criteria.getrow()
						la_CR_criteria_data = ldw_CR_criteria.dynamic f_getitemany(ll_criteria_row, ls_CR_col_criteria)
						ls_CR_coltype_criteria = ldw_CR_criteria.describe(ls_CR_col_criteria+'.coltype')				
					end if
					
					lb_ok =  lb_rule.f_is_criteria_ok( string(la_CR_criteria_data), ls_criteria_value, ls_CR_coltype_criteria)				
					if lb_ok then exit
					ll_found_row = vds_trans_setup.find(vs_findStr1, ll_found_row+1, vds_trans_setup.rowcount()+1)	
				LOOP
				if not lb_ok then
					gf_messagebox('m.b_doc.f_find_setup_account_dr.04','Thông báo','Cài đặt điều kiện phụ thuộc chưa đầy đủ:@'+ ls_CR_dw_criteria,'stop','ok',1)
					return -1												
				else
					lb_ok = false 		//-- trả lại giá trị false để tiếp tục xét theo đối tượng ghi sổ --//
					vs_findStr1 += " AND CR_VALUE_CRITERIAL ='" + ls_criteria_value + "'"
				end if							
			end if
			
			//-- Tiếp tục kiểm tìm theo đối tượng bên Nợ --//			
			ls_CR_dw_object =  vds_trans_setup.getitemstring(ll_found_row, 'CR_dw_object')
			if isnull(ls_CR_dw_object) or ls_CR_dw_object = '' then //-- Trường hợp ben Nợ không có đối tượng nhưng có ĐK --//
				lb_ok = true				
				ls_CR_obj_type =  vds_trans_setup.getitemstring(ll_found_row, 'CR_obj_type')
			else
				ll_rtn = this.f_find_trans_setup_row_object_cr( vds_trans_setup, ll_found_row, ldb_CR_object_id, ldb_CR_subaccount, ls_CR_obj_type, vs_posting_type, vdw_get_amount,  vl_get_amount_row, vs_findStr1)
				if ll_rtn = 1 then lb_ok = true
				if ll_rtn = -1 or ll_rtn = 0 then return ll_rtn				
			end if			
		end if		
	LOOP
	//-- set tài khoản Nợ trả về--//
	rl_trans_setup_row = ll_found_row
	rstr_post_account.db_CR_object_id = ldb_CR_object_id
	rstr_post_account.s_CR_object_type = ls_CR_obj_type	
	
	if upper(ls_CR_obj_type) = 'ACCOUNT' and (not isnull(ls_CR_dw_object) and ls_CR_dw_object <> '' ) then
		rstr_post_account.db_CR_account = ldb_CR_object_id		
	else
		ldb_account_id = vds_trans_setup.getitemnumber(ll_found_row, 'CR_ACCT_ID')
		if ldb_account_id = 0 or isnull(ldb_account_id) then
			gf_messagebox('m.b_doc.f_find_setup_account_dr.07','Thông báo','Chưa cài đặt tài khoản Nợ của nghiệp vụ:@'+ vs_posting_type,'stop','ok',1)
			return -1
		end if
		rstr_post_account.db_CR_account = ldb_account_id
	end if		
	//-- set subaccount  Nợ --//
	if ldb_CR_subaccount = 0 or isnull(ldb_CR_subaccount) then ldb_CR_subaccount = vds_trans_setup.getitemnumber(ll_found_row, 'CR_SUBACCT_ID')
	rstr_post_account.db_CR_subaccount = ldb_CR_subaccount
		
	//-- Get dw_trans_text and column_trans_text --//
	if rstr_post_account.s_trans_text = '' or isnull(rstr_post_account.s_trans_text) then
		ls_dw_trans_text =  vds_trans_setup.getitemstring( ll_found_row, 'dw_trans_text')
		ls_col_trans_text =  vds_trans_setup.getitemstring( ll_found_row, 'column_trans_text')
		ls_type_text = vds_trans_setup.getitemstring( ll_found_row, 'trans_text')
//		if isnull(ls_dw_trans_text) or isnull(ls_col_trans_text) then
//			ls_type_text = vds_trans_setup.getitemstring( ll_found_row, 'trans_text')
		if not isnull(ls_dw_trans_text) and not isnull(ls_col_trans_text) then
			if ls_dw_trans_text = left(vdw_get_amount.dataobject, len(vdw_get_amount.dataobject) - 5) then 
				ls_trans_text = vdw_get_amount.getitemstring( vl_get_amount_row , ls_col_trans_text)
			else
				ldw_master = vdw_get_amount.dynamic f_get_idw_master()
				ldw_trans_text = this.iw_display.dynamic f_get_dw(ls_dw_trans_text+ '_grid')
				if not isvalid(ldw_trans_text)  then
					gf_messagebox('m.b_doc.f_find_setup_account_dr.06','Thông báo','Không tìm thấy DW TRANS TEXT:@'+ ls_dw_trans_text,'stop','ok',1)
					return -1								
				end if								
				if isvalid(ldw_master) then
					if ldw_trans_text = ldw_master then
						ldb_object_ref_id =  vdw_get_amount.getitemnumber(vl_get_amount_row, 'object_ref_id')
						ll_trans_text_row = ldw_trans_text.find( "id = "+string(ldb_object_ref_id) , 1, ldw_trans_text.rowcount())						
					end if
				end if
				if ll_trans_text_row = 0 then ll_trans_text_row = ldw_trans_text.getrow()			
				ls_trans_text = ldw_trans_text.getitemstring( ll_trans_text_row, ls_col_trans_text)			
			end if
		end if	
		if (ls_type_text = '' or isnull(ls_type_text)) and ls_trans_text <> '' then
			ls_type_text = ls_trans_text
		elseif ( ls_trans_text = '' or isnull(ls_trans_text) ) and ls_type_text <> ''then
			ls_trans_text = ls_type_text
		elseif ls_type_text <>'' and ls_trans_text <> '' then
			ls_trans_text = ls_type_text + '-' + ls_trans_text
		end if
		rstr_post_account.s_trans_text = ls_trans_text	
		rstr_post_account.s_post_type_text = ls_type_text
	end if
	return 1		
end if
return 0

end function

public function integer f_insert_streamvalue (string vs_qty_yn, string vs_value_yn);t_transaction	lt_transaction
t_dw_mpl		ldw_f_object,ldw_t_object,ldw_item,ldw_currency,ldw_value,ldw_item_lot,ldw_main
t_ds_db			lds_stream
c_string			lc_str
u_item			lu_item

double			ldb_item_id,ldb_dwitem_ID, ldb_doc_id
string				ls_doc_type, ls_item_ref_table
string				las_item_col[],las_item_col_sv[],las_f_obj_col[],las_f_obj_col_sv[],ls_samecol_string, ls_item_column_sv
string				las_t_obj_col[],las_t_obj_col_sv[],las_cur_col[],las_cur_col_sv[],las_value_col[],las_value_col_sv[],ls_item_code
string				ls_lot_yn,ls_serial_y,las_item_lot_col[],las_item_lot_col_sv[],ls_filter_lot 
long				ll_row
int					li_idx,li_idx2,li_idx3,li_rtn
date				ld_trans_date


this.iw_display.f_get_transaction( lt_transaction)
lds_stream = create t_ds_db
lds_stream.dataobject = 'ds_streamvalue'
lds_stream.f_settransobject( lt_transaction)
lu_item = create u_item
//-- Lấy các thông tin document chung --//
ldw_main = iw_display.f_get_dwmain( )
this.f_get_Trans_date(ld_trans_date )
ldb_doc_id = ldw_main.getitemnumber( ldw_main.getrow() , 'ID') 
ls_doc_type	= upper(ldw_main.getitemstring( ldw_main.getrow( ) , 'doc_type'))
	
for li_idx = 1 to upperbound(istr_streamvalue)	
	ldw_f_object = iw_display.f_get_dw(istr_streamvalue[li_idx].s_f_obj_dwo)
	if not isvalid(ldw_f_object) then 
		gf_messagebox('m.b_doc.f_insert_streamvalue.01','Thông báo','Không tìm thấy DW đối tượng FROM trong cài đặt stream value structure:@'+istr_streamvalue[li_idx].s_f_obj_dwo,'stop','ok',1)
		return -1
	end if
	ldw_t_object = iw_display.f_get_dw(istr_streamvalue[li_idx].s_t_obj_dwo)
	if not isvalid(ldw_t_object) then 
		gf_messagebox('m.b_doc.f_insert_streamvalue.02','Thông báo','Không tìm thấy DW đối tượng TO trong cài đặt stream value structure:@'+istr_streamvalue[li_idx].s_t_obj_dwo,'stop','ok',1)
		return -1
	end if	
	if istr_streamvalue[li_idx].s_item_dwo <> 'none' then 
		ldw_item = iw_display.f_get_dw(istr_streamvalue[li_idx].s_item_dwo)
		if not isvalid(ldw_item) then 
			gf_messagebox('m.b_doc.f_insert_streamvalue.03','Thông báo','Không tìm thấy DW ITEM trong cài đặt stream value structure:@'+istr_streamvalue[li_idx].s_item_dwo,'stop','ok',1)
			return -1
		end if		
	end if
	if istr_streamvalue[li_idx].s_item_lot_dwo <> '' then 
		ldw_item_lot = iw_display.f_get_dw(istr_streamvalue[li_idx].s_item_lot_dwo)
		if not isvalid(ldw_item_lot) then 
			gf_messagebox('m.b_doc.f_insert_streamvalue.04','Thông báo','Không tìm thấy DW ITEM LOT trong cài đặt stream value structure:@'+istr_streamvalue[li_idx].s_item_lot_dwo,'stop','ok',1)
			return -1
		end if		
	end if
	if istr_streamvalue[li_idx].s_currency_dwo <> '' then
		ldw_currency = iw_display.f_get_dw(istr_streamvalue[li_idx].s_currency_dwo)
		if not isvalid(ldw_currency) then 
			gf_messagebox('m.b_doc.f_insert_streamvalue.05','Thông báo','Không tìm thấy DW CURRENCY trong cài đặt stream value structure:@'+istr_streamvalue[li_idx].s_currency_dwo,'stop','ok',1)
			return -1
		end if		
	end if
	if istr_streamvalue[li_idx].s_value_dwo <> '' then
		ldw_value= iw_display.f_get_dw(istr_streamvalue[li_idx].s_value_dwo)
		if not isvalid(ldw_value) then 
			gf_messagebox('m.b_doc.f_insert_streamvalue.06','Thông báo','Không tìm thấy DW VALUE trong cài đặt stream value structure:@'+istr_streamvalue[li_idx].s_value_dwo,'stop','ok',1)
			return -1
		end if
	end if
	lc_str.f_stringtoarray( istr_streamvalue[li_idx].s_item_column, ';', las_item_col)
	lc_str.f_stringtoarray( istr_streamvalue[li_idx].s_item_column_sv, ';', las_item_col_sv)
	lc_str.f_stringtoarray( istr_streamvalue[li_idx].s_item_lot_column, ';', las_item_lot_col)
	lc_str.f_stringtoarray( istr_streamvalue[li_idx].s_item_lot_column_sv, ';', las_item_lot_col_sv)
	lc_str.f_stringtoarray( istr_streamvalue[li_idx].s_f_obj_column, ';', las_f_obj_col)
	lc_str.f_stringtoarray( istr_streamvalue[li_idx].s_f_column_sv, ';', las_f_obj_col_sv)
	lc_str.f_stringtoarray( istr_streamvalue[li_idx].s_t_obj_column, ';', las_t_obj_col)
	lc_str.f_stringtoarray( istr_streamvalue[li_idx].s_t_column_sv, ';', las_t_obj_col_sv)
	lc_str.f_stringtoarray( istr_streamvalue[li_idx].s_currency_column, ';', las_cur_col)
	lc_str.f_stringtoarray( istr_streamvalue[li_idx].s_currency_column_sv, ';', las_cur_col_sv)
	lc_str.f_stringtoarray( istr_streamvalue[li_idx].s_value_column, ';', las_value_col)
	lc_str.f_stringtoarray( istr_streamvalue[li_idx].s_value_column_sv, ';', las_value_col_sv)
	//-- Lấy các cột trùng nhau giữa dw lot và dw item --//
	ls_item_column_sv = istr_streamvalue[li_idx].s_item_column_sv
	ls_item_column_sv = lc_str.f_globalreplace(ls_item_column_sv , ' ', '')
	if right(ls_item_column_sv,1)<> ';' then ls_item_column_sv += ';'
	FOR li_idx2 = 1 to upperbound(las_item_lot_col_sv[])
		if pos(ls_item_column_sv, las_item_lot_col_sv[li_idx2]+';')> 0 then
			ls_samecol_string += las_item_lot_col_sv[li_idx2]+';'
		end if
	NEXT
	
	ls_item_ref_table = ldw_item.describe( "datawindow.table.updateTable")
	
	//giữ lại filter gốc
	if isvalid(ldw_item_lot) then 
		ls_filter_lot = ldw_item_lot.describe( "Datawindow.Table.filter")	
	end if
		
	//-- FOR duyệt dwITEM--//
	FOR li_idx2 = 1 to ldw_item.rowcount( )
		ldb_item_id=ldw_item.getitemnumber( li_idx2, las_item_col[1])
		ldb_dwitem_ID = ldw_item.getitemnumber( li_idx2, 'ID')
		if isnull(ldb_item_id) or ldb_item_id = 0  then continue
		if upper(this.f_get_object_type(ldb_item_id))<>'ITEM' THEN continue
		//-- Ghi sổ số lượng --//
		if upper(vs_qty_yn) = 'Y'  then
			if isvalid(ldw_item_lot) then 				
				lu_item.f_get_lot_or_serial_yn(ldb_item_id, ls_lot_yn,ls_serial_y)
			end if			
			
			if ls_serial_y = 'Y' or  ls_lot_yn  = 'Y' then
				//filter lại theo item id
				ldw_item_lot.setfilter( 'object_ref_id = '+string(ldb_dwitem_ID))
				ldw_item_lot.filter()
				if ldw_item_lot.rowcount( ) > 0 then
					for li_idx3 = 1 to ldw_item_lot.rowcount( )
						ll_row = lds_stream.event e_addrow( )			
						li_rtn = this.f_update_streamvalue( ldw_item, lds_stream, las_item_col[], las_item_col_sv[], ls_samecol_string, li_idx2,ll_row, ldw_f_object, las_f_obj_col[], las_f_obj_col_sv[], ldw_t_object,  las_t_obj_col[], las_t_obj_col_sv[] )						
						if li_rtn = 1 then
							li_rtn = this.f_update_streamvalue( ldw_item_lot, lds_stream, las_item_lot_col[], las_item_lot_col_sv[], '', li_idx3,ll_row) 
						end if
						if li_rtn = -1 then
							destroy lds_stream
							destroy lu_item
							rollback using lt_transaction;
							return -1
						end if	
						li_rtn = this.f_postinsert_streamvalue(lds_stream , ll_row, vs_value_yn,vs_qty_yn, ls_item_ref_table, ldb_dwitem_ID, ls_doc_type, ldb_doc_id, ld_trans_date)
						if li_rtn = -1 then 
							destroy lds_stream
							destroy lu_item
							rollback using lt_transaction;
							return -1
						end if
					next
				else
					ls_item_code = this.f_get_code(ldw_item.getitemnumber( li_idx2, 'ITEM_ID')) //-- Chú Ý ///--test
					gf_messagebox('m.c_dwservice.f_insert_streamvalue.01','Thông báo','Chưa nhập số serial cho mã hàng @: '+ls_item_code,'exclamation','ok',1)
					destroy lds_stream
					destroy lu_item
					rollback using lt_transaction;
					return -1
				end if				
			else
				ll_row = lds_stream.event e_addrow( )
//				this.f_update_streamvalue( ldw_item, lds_stream, las_item_col[], las_item_col_sv[], '', li_idx2,ll_row, ldw_f_object, las_f_obj_col[], las_f_obj_col_sv[], ldw_t_object,  las_t_obj_col[], las_t_obj_col_sv[] )
				if li_rtn = -1 then 
					destroy lds_stream
					destroy lu_item
					rollback using lt_transaction;
					return -1
				end if
				li_rtn = this.f_postinsert_streamvalue(lds_stream , ll_row, vs_value_yn,vs_qty_yn, ls_item_ref_table, ldb_dwitem_ID, ls_doc_type, ldb_doc_id, ld_trans_date)
				if li_rtn = -1 then 
					destroy lds_stream
					destroy lu_item
					rollback using lt_transaction;
					return -1
				end if
			end if					
		end if //-- Kết thúc ghi sổ số lượng --//	
		
		//-- Ghi sổ giá trị --//
		if  upper(vs_value_yn) = 'Y' then
			ll_row = lds_stream.event e_addrow( )
//			this.f_update_streamvalue( ldw_value, lds_stream, las_value_col[], las_value_col_sv[], '', li_idx2,ll_row, ldw_f_object, las_f_obj_col[], las_f_obj_col_sv[], ldw_t_object,  las_t_obj_col[], las_t_obj_col_sv[], ldw_currency, las_cur_col[], las_cur_col_sv[])
			if li_rtn = -1 then 
				destroy lds_stream
				destroy lu_item
				rollback using lt_transaction;
				return -1
			end if
			li_rtn = this.f_postinsert_streamvalue(lds_stream , ll_row, vs_value_yn,vs_qty_yn, ls_item_ref_table, ldb_dwitem_ID, ls_doc_type, ldb_doc_id, ld_trans_date)
			if li_rtn = -1 then 
				destroy lds_stream
				destroy lu_item
				rollback using lt_transaction;
				return -1
			end if
		end if //-- Kết thúc ghi sổ giá trị --//
	NEXT //-- kết thức FOR dwITEM --//
	
	//-- trả lại filter cho dw item LOT--//
	if ls_filter_lot <> "?" and isvalid(ldw_item_lot) then
		ls_filter_lot = lc_str.f_globalreplace( ls_filter_lot, '~~', "")				
		ldw_item_lot.setfilter(ls_filter_lot)
		ldw_item_lot.filter( )
	end if			
next

li_rtn = lds_stream.update(true,false )
if li_rtn = 1 then
	lds_stream.resetupdate( )
else
	messagebox('Lỗi','c_dwservice.f_insert_streamvalue(line:)')
	destroy lds_stream
	destroy lu_item
	Rollback using lt_transaction;
end if
destroy lds_stream
destroy lu_item
return 1
end function

public function integer f_postinsert_streamvalue (ref t_ds_db rds_stream, long vl_row, string vs_value_yn, string vs_qty_yn, string vs_item_ref_table, double vdb_item_ref_id, string vs_doc_ref_type, double vdb_doc_ref_id, date vd_trans_date);int	li_rtn

	li_rtn = rds_stream.setitem( vl_row, 'ID', this.f_create_id())
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

public function integer f_update_streamvalue (t_dw_mpl vdw_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row, t_dw_mpl vdw_f_object, string vas_f_object_col[], string vas_f_object_col_sv[], t_dw_mpl vdw_t_object, string vas_t_object_col[], string vas_t_object_col_sv[]);int				li_idx,li_rtn
long			ll_t_object_row, ll_f_object_row
double		ldb_object_ref_id, ldb_qty, ldb_sv_qty, ldb_f_object, ldb_t_object, ldb_tmp_object
t_dw_mpl	ldw_master

//-- update các giá trị của dw item/lot/value--//
for li_idx = 1 to upperbound(vas_data_col)
	if pos(upper(vs_pas_col), upper(vas_update_col[li_idx])+';' ) > 0  then continue
	
	if upper(vas_data_col[li_idx])= 'QTY' then 
		ldb_qty = vdw_data.dynamic f_getitemany( vl_data_row, vas_data_col[li_idx]+'_sku')
		if ldb_qty < 0 then
			ldb_sv_qty =-ldb_qty	
		else
			ldb_sv_qty =ldb_qty	
		end if
		li_rtn = rds_stream.setitem( vl_update_row,vas_update_col[li_idx], ldb_sv_qty  )
	else
		li_rtn = rds_stream.setitem( vl_update_row,vas_update_col[li_idx], vdw_data.dynamic f_getitemany( vl_data_row, vas_data_col[li_idx])  )
	end if
next

if li_rtn = -1 then
	gf_messagebox('m.b_doc.f_update_streamvalue.01','Thông báo','Lỗi setitem vào datastore rd_streamvalue: f_update_streamvalue(24)','stop','ok',1)
	return -1
end if

//-- update f_object và t_object --//
if vdw_f_object.dataobject = vdw_data.dataobject then
	ll_f_object_row = vl_data_row
else
	ldw_master = vdw_data.dynamic f_get_idw_master()
	if isvalid(ldw_master) then
		if ldw_master.dataobject = vdw_f_object.dataobject then
			ldb_object_ref_id = vdw_data.getitemnumber(vl_data_row, 'object_ref_id')
			ll_f_object_row = ldw_master.find('ID ='+string(ldb_object_ref_id), 1 , ldw_master.rowcount())
		end if
	end if
	if ll_f_object_row = 0 then ll_f_object_row = vdw_f_object.getrow()
end if

if vdw_t_object.dataobject = vdw_data.dataobject then
	ll_t_object_row = vl_data_row
else
	ldw_master = vdw_data.dynamic f_get_idw_master()
	if isvalid(ldw_master) then
		if ldw_master.dataobject = vdw_t_object.dataobject then
			ldb_object_ref_id = vdw_data.getitemnumber(vl_data_row, 'object_ref_id')
			ll_t_object_row = ldw_master.find('ID ='+string(ldb_object_ref_id), 1 , ldw_master.rowcount())
		end if
	end if
	if ll_t_object_row = 0 then ll_t_object_row = vdw_t_object.getrow()
end if

for li_idx = 1 to upperbound(vas_f_object_col[])
	ldb_f_object =  vdw_f_object.dynamic f_getitemany( ll_f_object_row, vas_f_object_col[li_idx] )
	ldb_t_object = vdw_t_object.dynamic f_getitemany( ll_t_object_row, vas_t_object_col[li_idx] )
	if  ldb_qty < 0 then //-- đảo object from/to --//
		ldb_tmp_object = ldb_f_object
		ldb_f_object = ldb_t_object
		ldb_t_object = ldb_tmp_object
	end if
	li_rtn = rds_stream.setitem( vl_update_row,vas_f_object_col_sv[li_idx], ldb_f_object)
	li_rtn = rds_stream.setitem( vl_update_row,vas_t_object_col_sv[li_idx], ldb_t_object)
next

if li_rtn = -1 then
	gf_messagebox('m.b_doc.f_update_streamvalue.02','Thông báo','Lỗi setitem vào datastore rd_streamvalue: f_update_streamvalue(68)','stop','ok',1)
	return -1
end if

return li_rtn
end function

public function integer f_doc_filter (string vs_dwo_filter, boolean vb_doc_filter_yn);

string			ls_filterStr
t_dw_mpl	ldw_master, ldw_handle

ldw_handle = iw_display.f_get_dw( vs_dwo_filter)
if isvalid(ldw_handle) then
	ldw_master = ldw_handle.dynamic f_get_idw_master()
	if vb_doc_filter_yn then
		ldw_handle.ib_doc_filter = true				
	else
		ldw_handle.ib_doc_filter = false
	end if
	ls_filterStr = ldw_master.dynamic f_get_detail_filterstring(ldw_handle, vb_doc_filter_yn )
	ldw_handle.setfilter( ls_filterStr)
	return ldw_handle.filter( )		
end if
return 0
end function

public function boolean f_is_related_doc_booked (double vdb_related_doc_id);string 		ls_ref_table, ls_doc_status, ls_doc_no
double		ldb_related_doc_id
boolean		lb_booked


lb_booked = true
//-- Nếu chứng từ liên quan là booked_slip thì kiểm tra tình trạng của chứng từ liên quan --//
if vdb_related_doc_id > 0 then
	ls_ref_table = this.f_get_ref_table(vdb_related_doc_id )
	if upper(ls_ref_table) = 'BOOKED_SLIP' then
		ls_doc_status = this.f_get_doc_status(vdb_related_doc_id )
		if isnull(ls_doc_status) then
			lb_booked = false
		else
		//	if upper(ls_doc_status) <> 'BOOKED' then lb_booked = false
			if pos('NEW;CANCELLED;FINALIZED',upper(ls_doc_status) ) > 0 then lb_booked = false
		end if
	end if
	if not lb_booked then
		ls_doc_no = this.f_get_code(vdb_related_doc_id)
		if isnull(ls_doc_no) then ls_doc_no = ''
		gf_messagebox('m.b_doc.f_is_related_doc_booked.02','Thông báo','Chứng từ liên quan sau chưa ghi sổ:@' + ls_doc_no,'exclamation','ok',1)
	end if
end if
return lb_booked
end function

public function integer f_get_t_doc_id (double vdb_f_doc_id, ref double radb_t_doc_id[]);t_ds_db		lds_matching
double		ldb_t_doc_id
long			ll_rtn,ll_find
any			laa_data[]
int				li_idx


laa_data[1] = vdb_f_doc_id
lds_matching = create t_ds_db
lds_matching.dataobject = 'ds_matching'
lds_matching.f_settransobject( SQLCA)
lds_matching.f_add_where( 'f_doc_id', laa_data)
ll_rtn = lds_matching.retrieve( )
if ll_rtn > 0 then
	lds_matching.setsort( "t_doc_id asc")
	lds_matching.sort( )	
	ldb_t_doc_id = lds_matching.getitemnumber( 1, 't_doc_id')
	radb_t_doc_id[upperbound(radb_t_doc_id) + 1] = ldb_t_doc_id
	ll_find = lds_matching.find( "t_doc_id <> " + string(ldb_t_doc_id), 1 , lds_matching.rowcount( ) )
	Do While ll_find > 0		
		ldb_t_doc_id = lds_matching.getitemnumber( ll_find, 't_doc_id')
		radb_t_doc_id[upperbound(radb_t_doc_id) + 1] = ldb_t_doc_id
		ll_find = lds_matching.find( "t_doc_id <> " + string(ldb_t_doc_id), ll_find + 1, lds_matching.rowcount( ) +1)
	Loop 
end if
destroy lds_matching
return upperbound(radb_t_doc_id)
end function

public function integer f_booking (double vdb_doc_id, string vs_doctype, string vs_qty_yn, string vs_value_yn, double vadb_related_doc_id[], ref t_transaction rt_transaction);//-- Hàm ghi sổ chứng từ
//-- Tham số: vl_doc_id :id của chứng từ (document)
t_ds_db 				lds_ledger_trans, lds_obj_post
c_dwservice			lc_dwsr

long 					ll_rtn
date					ld_trans_date


if this.f_get_trans_date( ld_trans_date) = -1 then return -1
if isnull(ld_trans_date) then
	gf_messagebox('m.b_doc.f_booking.01','Thông báo','Ngày giao dịch chưa có','exclamation','ok',1)
	return -1
end if

//-- Ghi sổ ledger_trans --//
lds_ledger_trans = create t_ds_db
if f_insert_ledger_trans(vdb_doc_id,vs_doctype, ld_trans_date, rt_transaction, lds_ledger_trans) <> 1 then
	destroy lds_ledger_trans
	return -1
end if

//-- Ghi sổ object_trans đối tượng Nợ--**//
lds_obj_post = create t_ds_db
lds_obj_post.dataobject = 'ds_obj_trans_post_dr'
if f_insert_object_trans(vdb_doc_id,vs_doctype, ld_trans_date, rt_transaction, lds_obj_post) <> 1 then
	destroy lds_obj_post
	return -1
end if
//-- Ghi sổ object_trans đối tượng Có--**//
lds_obj_post.dataobject = 'ds_obj_trans_post_cr'
if f_insert_object_trans(vdb_doc_id,vs_doctype, ld_trans_date, rt_transaction, lds_obj_post) <> 1 then
	destroy lds_obj_post
	return -1
end if
//-- update object_balance đối tượng Nợ--**//
lds_obj_post.dataobject = 'ds_obj_balance_post_dr'
if this.f_insert_object_balance( vdb_doc_id,  ld_trans_date, rt_transaction, lds_obj_post, 'post',gs_sob) <> 1 then
	destroy lds_obj_post
	return -1	
end if
//-- update ledger_balance đối tượng Nợ--//
lds_obj_post.dataobject = 'ds_ledger_balance_post_dr'
if this.f_insert_object_balance( vdb_doc_id,  ld_trans_date, rt_transaction, lds_obj_post, 'post',gs_sob) <> 1 then
	destroy lds_obj_post
	return -1	
end if
//-- update object_balance đối tượng Có--**//
lds_obj_post.dataobject = 'ds_obj_balance_post_cr'
if this.f_insert_object_balance( vdb_doc_id,  ld_trans_date, rt_transaction, lds_obj_post, 'post',gs_sob) <> 1 then
	destroy lds_obj_post
	return -1	
end if
//-- update ledger_balance đối tượng Có--//
lds_obj_post.dataobject = 'ds_ledger_balance_post_cr'
if this.f_insert_object_balance( vdb_doc_id,  ld_trans_date, rt_transaction, lds_obj_post, 'post',gs_sob) <> 1 then
	destroy lds_obj_post
	return -1	
end if
//-- upstream value --//
ll_rtn = upperbound(istr_streamvalue[])
if ll_rtn > 0 then
	if this.f_booking_item_ex(rt_transaction,ld_trans_date, 'post', vs_qty_yn,vs_value_yn, vadb_related_doc_id[]) = -1 then return -1

end if

destroy lds_ledger_trans
destroy lds_obj_post
return 1
end function

public function integer f_booking_item (ref t_transaction rt_transaction, date vd_trans_date, string vs_post_type, string vs_qty_yn, string vs_value_yn, double vadb_related_doc_id[]);/**************************************************************************************
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
int							li_rtn, li_cnt, li_idx
long						ll_row, ll_row2, ll_insertrow_sv,ll_count, ll_row_itemmaster
any						laa_data[]
string						ls_lot_yn,ls_serial_yn, ls_item_ref_table, ls_doc_type, ls_samecol_string,ls_item_column_sv
string						las_col_f_object[], las_col_f_object_sv[], las_col_t_object[], las_col_t_object_sv[], las_col_item[], las_col_item_sv[]
string						las_col_item_value[], las_col_item_value_sv[], las_col_item_lot[], las_col_item_lot_sv[], las_col_currency[], las_col_currency_sv[]
string						ls_where, ls_original_filter_lot,ls_original_filter_item, ls_ref_table,ls_manage_value_yn,ls_manage_qty_yn, ls_sv_value_yn, ls_sv_qty_yn
double					ldb_trans_uom, ldb_item_id, ldb_doc_id, ldb_dwitem_ID, ldb_value,ldb_base_value, ldb_qty, ldb_trans_charge_amt, ldb_base_charge_amt
double					ldb_itemmaster_ID
//boolean					lb_managed_qty, lb_manage_value

c_string					lc_string
t_dw_mpl				ldw_f_object,ldw_item,ldw_t_object,ldw_item_lot,ldw_item_value, ldw_currency, ldw_main, ldw_master
t_ds_db					lds_stream, lds_item_lot
b_obj_instantiate		lobj_ins

FOR li_idx = 1 to upperbound(this.istr_streamvalue[])
	ls_original_filter_item =''
	ls_original_filter_lot = ''	
	//-- Lấy dw --//
	li_rtn = this.f_get_dw_of_streamvalue(ldw_item, ldw_f_object,ldw_t_object, ldw_item_value,ldw_item_lot,ldw_currency,li_idx)
	if li_rtn = 0 then return 0
	if li_rtn = -1 then
		rollback using rt_transaction;
		return -1
	end if
	//-- Lấy dw col--//
	li_rtn = this.f_get_dwcol_of_streamvalue( las_col_f_object[], las_col_f_object_sv[], las_col_t_object[], las_col_t_object_sv[], las_col_item[], las_col_item_sv[],las_col_item_value[], las_col_item_value_sv[], las_col_item_lot[], las_col_item_lot_sv[], las_col_currency[], las_col_currency_sv[], li_idx)
	if li_rtn = 0 then return 0
	if li_rtn = -1 then
		rollback using rt_transaction;
		return -1
	end if
	
	//-- Thông tin để update streamvalue --//
	lds_stream = create t_ds_db
	lds_stream.dataobject = 'ds_streamvalue'
	lds_stream.f_settransobject( rt_transaction)
	//-- Lấy các thông tin document chung --//
	ldw_main = iw_display.f_get_dwmain( )
	ldb_doc_id = ldw_main.getitemnumber( ldw_main.getrow() , 'ID') 
	ls_doc_type	= upper(ldw_main.getitemstring( ldw_main.getrow( ) , 'doc_type'))
	ls_item_ref_table = upper(ldw_item.describe( "datawindow.table.updateTable"))
	
	//-- Lấy các cột trùng nhau giữa dw lot và dw item --//
	ls_item_column_sv = istr_streamvalue[li_idx].s_item_column_sv
	ls_item_column_sv = lc_string.f_globalreplace(ls_item_column_sv , ' ', '')
	if right(ls_item_column_sv,1)<> ';' then ls_item_column_sv += ';'	
	FOR li_cnt = 1 to upperbound(las_col_item_lot_sv[])
		if pos(ls_item_column_sv, las_col_item_lot_sv[li_cnt]+';')> 0 then
			ls_samecol_string += las_col_item_lot_sv[li_cnt]+';'
		end if
	NEXT
	
	//-- Lấy dw lot--//
	if upper(vs_qty_yn) = 'Y' then
		if isvalid(ldw_item_lot) then
			//-- ghi nhớ lại filter hiện tại --//
			ls_original_filter_lot = ldw_item_lot.describe( "datawindow.table.filter")
		end if
	end if	
	
	//-- xả filter nếu có --//
	if ldw_item.f_get_ib_detail( )  then
		ldw_master = ldw_item.dynamic f_get_idw_master( )
		ls_ref_table= upper(ldw_master.describe( "datawindow.table.updateTable"))
		if ls_ref_table = 'BOOKED_SLIP' then //--master của item là bookslip --//
			FOR ll_row = 1 to ldw_item.rowcount( )			///////////////-- duyệt từng item --/////////////
				ldb_item_id =  ldw_item.getitemnumber(ll_row,las_col_item[1])
				ldb_dwitem_ID = ldw_item.getitemnumber( ll_row,'ID')
				ldb_trans_uom = ldw_item.getitemnumber(ll_row,las_col_item[4])
				if upper(this.f_get_object_type(ldb_item_id)) <> 'ITEM' then continue
				if lobj_ins.f_get_item_managed_qty_value(ldb_item_id ,ls_manage_qty_yn, ls_manage_value_yn) = -1 then return -1
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
					ldb_value =  ldw_item.getitemnumber(ll_row,las_col_item_value[2]) //--trans value --//
					if isnull(ldb_value) then ldb_value =0			
					ldb_base_value =  ldw_item.getitemnumber(ll_row,las_col_item_value[3]) //--base value --//
					if isnull(ldb_base_value) then ldb_base_value =0			
					if las_col_item_value[3] = 'cogs' and ldb_base_value = 0 then
						ldb_base_value = lobj_ins.f_get_last_pur_price( ldb_item_id)	
						ldb_base_value = ldb_base_value * ldb_qty						
						ldb_value = ldb_base_value
					end if
					
					//-- Công thêm thuế nhập khẩu và phí mua hàng nếu có --//
					if this.classname( ) = 'u_pur_invoice' then
						SELECT sum(TRANS_AMT), sum(BASE_AMT) INTO :ldb_trans_charge_amt, :ldb_base_charge_amt
						FROM POST_LINE 
						WHERE DOC_ID = :ldb_doc_id AND DR_OBJECT_ID = :ldb_item_id AND SOB = :gs_sob AND OBJECT_REF_TABLE <> :ls_item_ref_table  USING rt_transaction;
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
				laa_data[4] = ldw_item.getitemnumber(ll_row,las_col_item[5]) 		//--Loc_ID--//
				laa_data[5] = datetime(vd_trans_date)										//--Trans_date--//
				laa_data[9] = gs_sob
				///-- kiểm tra item có quản lý số seri hoặc số lô không --//
				if lobj_ins.f_get_lot_or_serial_yn( laa_data[1], ls_lot_yn,ls_serial_yn) = -1 then
					gf_messagebox('m.b_doc.f_booking_item.01','Thông báo','Mã hàng không hợp lệ:@'+this.f_get_code(laa_data[1] ),'stop','ok',1)		
					rollback using rt_transaction;
					destroy lds_stream
					return -1
				end if
				
				//-- ghi sổ giá trị hoặc ghi sổ số lượng với mã hàng ko quản lý số  seri --//
				if (ls_serial_yn = 'N' and ls_lot_yn = 'N' and ( ls_sv_value_yn = 'Y' or ls_sv_qty_yn = 'Y' ) ) then  //-- (vs_value_yn = 'Y' and lb_managed_qty) OR and vs_qty_yn = 'Y' 
		
					laa_data[7] = '@'			//--Lot_no--//
					laa_data[8] = '@'			//--Serial_no--//
					//-- update item balance theo ngày --//
					ldb_qty = ldw_item.getitemnumber( ll_row,las_col_item[3])
					if isnull(ldb_qty) or ldb_qty = 0 then continue 
					
					if this.f_insert_item_balance_row( rt_transaction, ldw_item, ll_row, ldw_f_object, ldw_t_object, vd_trans_date, vs_post_type, las_col_item[], las_col_item_value[], las_col_f_object[], las_col_t_object[], laa_data[], ls_sv_qty_yn, ls_sv_value_yn, ldb_trans_uom, las_col_item[3], ldb_base_value, vs_qty_yn,vs_value_yn) = -1 then 
						destroy lds_stream
						rollback using rt_transaction;
						return -1
					end if
					
					//-- update streamvalue theo chứng từ --//
					if  upper(vs_post_type) = 'POST' then		
												
						if  ls_sv_qty_yn = 'Y'  and  ls_sv_value_yn = 'Y' then  //-- cập nhật stream_value GT --//
							ll_insertrow_sv = lds_stream.event e_addrow( ) /////////////////////--- insert stream_value --////////////
							if ll_insertrow_sv < 1 then 
								gf_messagebox('m.b_doc.f_booking_item.09','Thông báo','Không insert được stream','stop','ok',1)
								destroy lds_stream
								rollback using rt_transaction;
								return -1
							end if							
							li_rtn = this.f_update_streamvalue( ldw_item, lds_stream, las_col_item_value[], las_col_item_value_sv[], '', ll_row, ll_insertrow_sv,ldw_f_object, las_col_f_object[], las_col_f_object_sv[],ldw_t_object, las_col_t_object[], las_col_t_object_sv[], ldw_currency,las_col_currency[], las_col_currency_sv[], ldb_value, ldb_base_value)
							if li_rtn = -1 then 
								destroy lds_stream
								rollback using rt_transaction;
								return -1
							end if
							
							li_rtn = this.f_postinsert_streamvalue(lds_stream , ll_insertrow_sv, ls_sv_value_yn,ls_sv_qty_yn, ls_item_ref_table, ldb_dwitem_ID, ls_doc_type, ldb_doc_id, vd_trans_date)
							if li_rtn = -1 or li_rtn = 0 then 
								gf_messagebox('m.b_doc.f_booking_item.09','Thông báo','Không insert được stream','stop','ok',1)
								destroy lds_stream
								rollback using rt_transaction;
								return -1
							end if													
						elseif ls_sv_qty_yn = 'Y' and  ls_sv_value_yn = 'N' and vs_value_yn = 'N' then //-- cập nhật stream_value SL --//
							ll_insertrow_sv = lds_stream.event e_addrow( ) /////////////////////--- insert stream_value --////////////
							if ll_insertrow_sv < 1 then 
								gf_messagebox('m.b_doc.f_booking_item.09','Thông báo','Không insert được stream','stop','ok',1)
								destroy lds_stream
								rollback using rt_transaction;
								return -1
							end if							
							li_rtn = this.f_update_streamvalue( ldw_item, lds_stream, las_col_item[], las_col_item_sv[], '', ll_row,ll_insertrow_sv, ldw_f_object, las_col_f_object[], las_col_f_object_sv[],ldw_t_object, las_col_t_object[], las_col_t_object_sv[])								
							if li_rtn = -1 then 
								destroy lds_stream
								rollback using rt_transaction;
								return -1
							end if					
							
							li_rtn = this.f_postinsert_streamvalue(lds_stream , ll_insertrow_sv, ls_sv_value_yn,ls_sv_qty_yn, ls_item_ref_table, ldb_dwitem_ID, ls_doc_type, ldb_doc_id, vd_trans_date)
							if li_rtn = -1 or li_rtn = 0 then 
								gf_messagebox('m.b_doc.f_booking_item.09','Thông báo','Không insert được stream','stop','ok',1)
								destroy lds_stream
								rollback using rt_transaction;
								return -1
							end if													
						end if
					
					end if			
					
				elseif (ls_serial_yn = 'Y'  or ls_lot_yn = 'Y') and ( ls_sv_value_yn = 'Y' or ls_sv_qty_yn = 'Y' )   then //-- mặt hàng có quản lý seri/lot --//
					if not isvalid(ldw_item_lot) then
						if ls_sv_qty_yn = 'Y'   then
							gf_messagebox('m.b_doc.f_booking_item.03','Thông báo','DW item_lot trong streamvalue structure không hợp lệ','stop','ok',1)		
							destroy lds_stream
							rollback using rt_transaction;
							return -1
						elseif ls_sv_value_yn = 'Y'   then
							lds_item_lot = create t_ds_db
							lds_item_lot.dataobject = 'ds_lot_line_4booking'
							ls_where = " matching.t_doc_id = "+string(ldb_doc_id)
							lds_item_lot.f_add_where( ls_where, 'AND')
							lds_item_lot.f_settransobject(rt_transaction )
							lds_item_lot.retrieve( )
		
							lds_item_lot.setfilter( "t_ref_id = "+string(ldb_dwitem_ID ))
							lds_item_lot.filter( )			
							//-- tính tổng số lượng các lot/seri --//
							if  lds_item_lot.rowcount( )	 > 0 then ldb_qty = double(lds_item_lot.describe("Evaluate('Sum("+las_col_item_lot[1]+")', 0)"))	
							
							this.f_booking_item_lot( rt_transaction,lds_stream ,ldw_item, ll_row, lds_item_lot, laa_data[], vd_trans_date, ls_lot_yn, ls_serial_yn, vs_qty_yn, vs_value_yn, &
														vs_post_type, ldb_value,ldb_base_value, ldb_qty, ldw_f_object, ldw_t_object, las_col_item[], las_col_item_lot[], las_col_item_value[], las_col_f_object[], las_col_t_object[],&								
														ldb_trans_uom,las_col_f_object_sv[], las_col_t_object_sv[],las_col_item_sv[], las_col_item_lot_sv[],las_col_item_value_sv[], ls_item_ref_table, &
														ls_samecol_string, ls_doc_type, ldb_dwitem_id, ldb_doc_id, ldw_currency,las_col_currency[], las_col_currency_sv[])							
						end if
					else
						ldw_item_lot.setfilter( "object_ref_id = "+string(ldb_dwitem_ID ))
						ldw_item_lot.filter( )					
						//-- tính tổng số lượng các lot/seri --//
						if  ldw_item_lot.rowcount( )	 > 0 then ldb_qty = double(ldw_item_lot.describe("Evaluate('Sum("+las_col_item_lot[1]+")', 0)"))		
						
						this.f_booking_item_lot( rt_transaction,lds_stream ,ldw_item, ll_row, ldw_item_lot, laa_data[], vd_trans_date, ls_lot_yn, ls_serial_yn, vs_qty_yn, vs_value_yn, &
													vs_post_type, ldb_value,ldb_base_value, ldb_qty, ldw_f_object, ldw_t_object, las_col_item[], las_col_item_lot[], las_col_item_value[], las_col_f_object[], las_col_t_object[],&								
													ldb_trans_uom,las_col_f_object_sv[], las_col_t_object_sv[],las_col_item_sv[], las_col_item_lot_sv[],las_col_item_value_sv[], ls_item_ref_table, &
													ls_samecol_string, ls_doc_type, ldb_dwitem_id, ldb_doc_id, ldw_currency,las_col_currency[], las_col_currency_sv[])								
					end if					
		
					
				end if
			NEXT			
		else	//////////////--nếu dw master của item không phải booked_slip: lệnh sản xuất --//////////////////////		
			ls_original_filter_item =  ldw_item.describe( "datawindow.table.filter")	
			FOR ll_row_itemmaster = 1 to ldw_master.rowcount( )
				ldb_itemmaster_ID = ldw_master.getitemnumber( ll_row_itemmaster, 'id')
				ldw_item.setfilter( "object_ref_id = "+string(ldb_itemmaster_ID ))
				ldw_item.filter( )
				FOR ll_row = 1 to ldw_item.rowcount( )			
					ldb_item_id =  ldw_item.getitemnumber(ll_row,las_col_item[1])
					ldb_dwitem_ID = ldw_item.getitemnumber( ll_row,'ID')
					ldb_trans_uom = ldw_item.getitemnumber(ll_row,las_col_item[4])
					if upper(this.f_get_object_type(ldb_item_id)) <> 'ITEM' then continue
					if lobj_ins.f_get_item_managed_qty_value(ldb_item_id ,ls_manage_qty_yn, ls_manage_value_yn) = -1 then return -1
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
					if ls_sv_value_yn = 'Y'  then
						ldb_value =  ldw_item.getitemnumber(ll_row,las_col_item_value[2]) //--trans value --//
						if isnull(ldb_value) then ldb_value =0			
						ldb_base_value =  ldw_item.getitemnumber(ll_row,las_col_item_value[3]) //--base value --//
						if isnull(ldb_base_value) then ldb_base_value =0			
						//-- Công thêm thuế nhập khẩu và phí mua hàng nếu có --//
						if this.classname( ) = 'u_pur_invoice' then
							SELECT sum(TRANS_AMT), sum(BASE_AMT) INTO :ldb_trans_charge_amt, :ldb_base_charge_amt
							FROM POST_LINE 
							WHERE DOC_ID = :ldb_doc_id AND DR_OBJECT_ID = :ldb_item_id AND SOB = :gs_sob AND OBJECT_REF_TABLE <> :ls_item_ref_table  USING rt_transaction;
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
					laa_data[4] = ldw_item.getitemnumber(ll_row,las_col_item[5]) 		//--Loc_ID--//
					laa_data[5] = datetime(vd_trans_date)										//--Trans_date--//
					laa_data[9] = gs_sob
					///-- kiểm tra item có quản lý số seri hoặc số lô không --//
					if lobj_ins.f_get_lot_or_serial_yn( laa_data[1], ls_lot_yn,ls_serial_yn) = -1 then
						gf_messagebox('m.b_doc.f_booking_item.01','Thông báo','Mã hàng không hợp lệ:@'+this.f_get_code(laa_data[1] ),'stop','ok',1)		
						rollback using rt_transaction;
						destroy lds_stream
						return -1
					end if
					
					//-- ghi sổ giá trị hoặc ghi sổ số lượng với mã hàng ko quản lý số  seri --//
					if (ls_serial_yn = 'N' and ls_lot_yn = 'N' and ( ls_sv_value_yn = 'Y' or ls_sv_qty_yn = 'Y' ) ) then  //-- (vs_value_yn = 'Y' and lb_managed_qty) OR and vs_qty_yn = 'Y' 
			
						laa_data[7] = '@'			//--Lot_no--//
						laa_data[8] = '@'			//--Serial_no--//
						//-- update item balance theo ngày --//
						ldb_qty = ldw_item.getitemnumber( ll_row,las_col_item[3])
						if isnull(ldb_qty) or ldb_qty = 0 then continue 
						if this.f_insert_item_balance_row( rt_transaction, ldw_item, ll_row, ldw_f_object, ldw_t_object, vd_trans_date, vs_post_type, las_col_item[], las_col_item_value[], las_col_f_object[], las_col_t_object[], laa_data[], ls_sv_qty_yn, ls_sv_value_yn, ldb_trans_uom, las_col_item[3], ldb_base_value, vs_qty_yn,vs_value_yn) = -1 then 
							destroy lds_stream
							rollback using rt_transaction;
							return -1
						end if
						
						//-- update streamvalue theo chứng từ --//
						if  upper(vs_post_type) = 'POST' then		
							

							if ls_sv_qty_yn = 'Y'  and  ls_sv_value_yn = 'Y' then  //-- cập nhật stream_value GT --//
								ll_insertrow_sv = lds_stream.event e_addrow( )  /////////////-- insert tream_value --////////////
								if ll_insertrow_sv < 1 then 
									gf_messagebox('m.b_doc.f_booking_item.09','Thông báo','Không insert được stream','stop','ok',1)
									destroy lds_stream
									rollback using rt_transaction;
									return -1
								end if							
								li_rtn = this.f_update_streamvalue( ldw_item, lds_stream, las_col_item_value[], las_col_item_value_sv[], '', ll_row, ll_insertrow_sv,ldw_f_object, las_col_f_object[], las_col_f_object_sv[],ldw_t_object, las_col_t_object[], las_col_t_object_sv[], ldw_currency,las_col_currency[], las_col_currency_sv[], ldb_value, ldb_base_value)
								if li_rtn = -1 then 
									destroy lds_stream
									rollback using rt_transaction;
									return -1
								end if		
								
								li_rtn = this.f_postinsert_streamvalue(lds_stream , ll_insertrow_sv, ls_sv_value_yn,ls_sv_qty_yn, ls_item_ref_table, ldb_dwitem_ID, ls_doc_type, ldb_doc_id, vd_trans_date)
								if li_rtn = -1 or li_rtn = 0 then 
									gf_messagebox('m.b_doc.f_booking_item.09','Thông báo','Không insert được stream','stop','ok',1)
									destroy lds_stream
									rollback using rt_transaction;
									return -1
								end if														
							elseif  ls_sv_qty_yn = 'Y' and  ls_sv_value_yn = 'N' and vs_value_yn = 'N' then //-- cập nhật stream_value SL --//
								ll_insertrow_sv = lds_stream.event e_addrow( )  /////////////-- insert tream_value --////////////
								if ll_insertrow_sv < 1 then 
									gf_messagebox('m.b_doc.f_booking_item.09','Thông báo','Không insert được stream','stop','ok',1)
									destroy lds_stream
									rollback using rt_transaction;
									return -1
								end if												
								li_rtn = this.f_update_streamvalue( ldw_item, lds_stream, las_col_item[], las_col_item_sv[], '', ll_row,ll_insertrow_sv, ldw_f_object, las_col_f_object[], las_col_f_object_sv[],ldw_t_object, las_col_t_object[], las_col_t_object_sv[])								
								if li_rtn = -1 then 
									destroy lds_stream
									rollback using rt_transaction;
									return -1
								end if		
									
								li_rtn = this.f_postinsert_streamvalue(lds_stream , ll_insertrow_sv, ls_sv_value_yn,ls_sv_qty_yn, ls_item_ref_table, ldb_dwitem_ID, ls_doc_type, ldb_doc_id, vd_trans_date)
								if li_rtn = -1 or li_rtn = 0 then 
									gf_messagebox('m.b_doc.f_booking_item.09','Thông báo','Không insert được stream','stop','ok',1)
									destroy lds_stream
									rollback using rt_transaction;
									return -1
								end if														
							end if						
									
						end if			
						
					elseif (ls_serial_yn = 'Y'  or ls_lot_yn = 'Y') and ( ls_sv_value_yn = 'Y' or ls_sv_qty_yn = 'Y' ) then //-- mặt hàng có quản lý seri/lot --//
						if not isvalid(ldw_item_lot) then
							if ls_sv_qty_yn = 'Y'    then
								gf_messagebox('m.b_doc.f_booking_item.03','Thông báo','DW item_lot trong streamvalue structure không hợp lệ','stop','ok',1)		
								destroy lds_stream
								rollback using rt_transaction;
								return -1
							elseif ls_sv_value_yn = 'Y'  then
								lds_item_lot = create t_ds_db
								lds_item_lot.dataobject = 'ds_lot_line_4booking'
								ls_where = " matching.t_doc_id = "+string(ldb_doc_id)
								lds_item_lot.f_add_where( ls_where, 'AND')
								lds_item_lot.f_settransobject(rt_transaction )
								lds_item_lot.retrieve( )
			
								lds_item_lot.setfilter( "t_ref_id = "+string(ldb_dwitem_ID ))
								lds_item_lot.filter( )			
								//-- tính tổng số lượng các lot/seri --//
								if  lds_item_lot.rowcount( )	 > 0 then ldb_qty = double(lds_item_lot.describe("Evaluate('Sum("+las_col_item_lot[1]+")', 0)"))	
								
								this.f_booking_item_lot( rt_transaction,lds_stream ,ldw_item, ll_row, lds_item_lot, laa_data[], vd_trans_date, ls_lot_yn, ls_serial_yn, vs_qty_yn, vs_value_yn, &
															vs_post_type, ldb_value,ldb_base_value, ldb_qty, ldw_f_object, ldw_t_object, las_col_item[], las_col_item_lot[], las_col_item_value[], las_col_f_object[], las_col_t_object[],&								
															ldb_trans_uom,las_col_f_object_sv[], las_col_t_object_sv[],las_col_item_sv[], las_col_item_lot_sv[],las_col_item_value_sv[], ls_item_ref_table, &
															ls_samecol_string, ls_doc_type, ldb_dwitem_id, ldb_doc_id, ldw_currency,las_col_currency[], las_col_currency_sv[])							
							end if
						else
							ldw_item_lot.setfilter( "object_ref_id = "+string(ldb_dwitem_ID ))
							ldw_item_lot.filter( )					
							//-- tính tổng số lượng các lot/seri --//
							if  ldw_item_lot.rowcount( )	 > 0 then ldb_qty = double(ldw_item_lot.describe("Evaluate('Sum("+las_col_item_lot[1]+")', 0)"))		
							
							this.f_booking_item_lot( rt_transaction,lds_stream ,ldw_item, ll_row, ldw_item_lot, laa_data[], vd_trans_date, ls_lot_yn, ls_serial_yn, vs_qty_yn, vs_value_yn, &
														vs_post_type, ldb_value,ldb_base_value, ldb_qty, ldw_f_object, ldw_t_object, las_col_item[], las_col_item_lot[], las_col_item_value[], las_col_f_object[], las_col_t_object[],&								
														ldb_trans_uom,las_col_f_object_sv[], las_col_t_object_sv[],las_col_item_sv[], las_col_item_lot_sv[],las_col_item_value_sv[], ls_item_ref_table, &
														ls_samecol_string, ls_doc_type, ldb_dwitem_id, ldb_doc_id, ldw_currency,las_col_currency[], las_col_currency_sv[])								
						end if					
			
						
					end if
				NEXT									
				if ls_original_filter_item <> '?' and ls_original_filter_item <> '' then
					lc_string.f_globalreplace(ls_original_filter_item ,'~~','')
					ldw_item.setfilter( ls_original_filter_item)
					ldw_item.filter( )
				end if				
			NEXT														
		end if
	end if
		
	//-- update cot sku ,cogs--//
	if ldw_item.update(true,false) = -1 then
		gf_messagebox('m.b_doc.f_booking_item.07','Thông báo','Không cập nhật được số lượng theo đơn vị tồn kho:@' +rt_transaction.sqlerrtext ,'exclamation','ok',1)
		rollback using rt_transaction;
		destroy lds_stream

		return -1
	end if	
	ldw_item.resetupdate()
	
	if lds_stream.update(true,false ) = -1 then
		gf_messagebox('m.b_doc.f_booking_item.08','Thông báo','Không cập nhật được steamvalue:@' +rt_transaction.sqlerrtext ,'exclamation','ok',1)
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
		Where stream_value.doc_ref_id = :ldb_doc_id using rt_transaction;
		if ll_count = 0 and ls_manage_qty_yn ='Y' and vs_qty_yn = 'Y' and upper(vs_post_type) = 'POST'  then
			gf_messagebox('m.b_doc.f_bookig_item.10','Thông báo','Cập nhật ghi sổ không thành công f_bookig_item(252)','exclamation','ok',1)
			Rollback using rt_transaction;
			return -1
		end if
//----------------------------------------------------------------------------//

destroy lds_stream
return 1
end function

public function integer f_get_dw_of_streamvalue (ref t_dw_mpl rdw_item, ref t_dw_mpl rdw_f_object, ref t_dw_mpl rdw_t_object, ref t_dw_mpl rdw_item_value, ref t_dw_mpl rdw_item_lot, ref t_dw_mpl rdw_currency, integer vi_idx);//-- Lấy dw trên form theo cài đặt streamvalue structure: để thực hiện update item balance --//

c_string					lc_string


//-- Lấy dw --//
if lower(this.istr_streamvalue[vi_idx].s_item_dwo) = 'none' then return 0
rdw_item = iw_display.dynamic f_get_dw(this.istr_streamvalue[vi_idx].s_item_dwo)
if not isvalid(rdw_item) then
	gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.01','Thông báo','DW mã hàng trong streamvalue structure không hợp lệ','stop','ok',1)		
	return -1
end if
if rdw_item.rowcount() = 0 then rdw_item.event e_retrieve()

if this.istr_streamvalue[vi_idx].s_f_obj_dwo = this.istr_streamvalue[vi_idx].s_item_dwo then
	rdw_f_object = rdw_item
else
	rdw_f_object = iw_display.dynamic f_get_dw(this.istr_streamvalue[vi_idx].s_f_obj_dwo)
	if not isvalid(rdw_f_object) then
		gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.02','Thông báo','DW đối tượng FROM trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if	
	if rdw_f_object.rowcount() = 0 then rdw_f_object.event e_retrieve()
end if

if this.istr_streamvalue[vi_idx].s_t_obj_dwo = this.istr_streamvalue[vi_idx].s_item_dwo then
	rdw_t_object = rdw_item
else
	rdw_t_object =  iw_display.dynamic f_get_dw(this.istr_streamvalue[vi_idx].s_t_obj_dwo)
	if not isvalid(rdw_t_object) then
		gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.03','Thông báo','DW đối tượng TO trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if	
	if rdw_t_object.rowcount() = 0 then rdw_t_object.event e_retrieve()
end if
//-- lây dw giá trị --//

if this.istr_streamvalue[vi_idx].s_item_dwo = this.istr_streamvalue[vi_idx].s_value_dwo then
	rdw_item_value = rdw_item
elseif this.istr_streamvalue[vi_idx].s_value_dwo <> '' then
	rdw_item_value = iw_display.dynamic f_get_dw(this.istr_streamvalue[vi_idx].s_value_dwo)
	if not isvalid(rdw_item_value) then
		gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.04','Thông báo','DW giá trị hàng trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if			
end if

//-- Lấy dw lot--//
if this.istr_streamvalue[vi_idx].s_item_lot_dwo <> '' and left(this.istr_streamvalue[vi_idx].s_item_lot_dwo, 3) <> 'ds_' then
	rdw_item_lot = iw_display.dynamic f_get_dw(this.istr_streamvalue[vi_idx].s_item_lot_dwo)
	if not isvalid(rdw_item_lot) then
		gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.05','Thông báo','DW item_lot trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if
end if

//-- lấy dw currency --//
if this.istr_streamvalue[vi_idx].s_currency_dwo <> '' then
	rdw_currency = iw_display.dynamic f_get_dw(this.istr_streamvalue[vi_idx].s_currency_dwo)
	if not isvalid(rdw_currency) then
		gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.06','Thông báo','DW currency trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if
end if
//-- Kết thúc lấy dw --//
return 1
end function

public function integer f_get_dwcol_of_streamvalue (ref string ras_col_f_object[], ref string ras_col_f_object_sv[], ref string ras_col_t_object[], ref string ras_col_t_object_sv[], ref string ras_col_item[], ref string ras_col_item_sv[], ref string ras_col_item_value[], ref string ras_col_item_value_sv[], ref string ras_col_item_lot[], ref string ras_col_item_lot_sv[], ref string ras_col_currency[], ref string ras_col_currency_sv[], integer vi_idx);//-- Lấy dw trên form theo cài đặt streamvalue structure: để thực hiện update item balance --//

c_string					lc_string

	lc_string.f_stringtoarray( istr_streamvalue[vi_idx].s_item_column, ';', ras_col_item)
	lc_string.f_stringtoarray( istr_streamvalue[vi_idx].s_item_column_sv, ';', ras_col_item_sv)
	lc_string.f_stringtoarray( istr_streamvalue[vi_idx].s_item_lot_column, ';', ras_col_item_lot)
	lc_string.f_stringtoarray( istr_streamvalue[vi_idx].s_item_lot_column_sv, ';', ras_col_item_lot_sv)
	
	lc_string.f_stringtoarray( istr_streamvalue[vi_idx].s_f_obj_column, ';', ras_col_f_object)
	lc_string.f_stringtoarray( istr_streamvalue[vi_idx].s_f_lot_column, ';', ras_col_f_object, true) // lấy thêm colname f_lot	
	lc_string.f_stringtoarray( istr_streamvalue[vi_idx].s_f_column_sv, ';', ras_col_f_object_sv)
	lc_string.f_stringtoarray( istr_streamvalue[vi_idx].s_t_obj_column, ';', ras_col_t_object)
	lc_string.f_stringtoarray( istr_streamvalue[vi_idx].s_t_lot_column, ';', ras_col_t_object, true) // lấy thêm colname f_lot	
	lc_string.f_stringtoarray( istr_streamvalue[vi_idx].s_t_column_sv, ';', ras_col_t_object_sv)
	
	lc_string.f_stringtoarray( istr_streamvalue[vi_idx].s_currency_column, ';', ras_col_currency)
	lc_string.f_stringtoarray( istr_streamvalue[vi_idx].s_currency_column_sv, ';', ras_col_currency_sv)
	lc_string.f_stringtoarray( istr_streamvalue[vi_idx].s_value_column, ';', ras_col_item_value)
	lc_string.f_stringtoarray( istr_streamvalue[vi_idx].s_value_column_sv, ';', ras_col_item_value_sv)

//-- Kết thúc lấy dw --//
return 1
end function

public function integer f_get_item_columns_of_streamvalue (string vs_item_dwo, ref string ras_col_item[]);int					li_idx
c_string			lc_string

FOR li_idx = 1 to upperbound(istr_streamvalue[])
	if left(this.istr_streamvalue[li_idx].s_item_dwo, len(this.istr_streamvalue[li_idx].s_item_dwo)-5) = left(vs_item_dwo, len(vs_item_dwo) -5) then
		lc_string.f_stringtoarray( istr_streamvalue[li_idx].s_item_column, ';', ras_col_item[])
	end if										
NEXT
return upperbound(ras_col_item[])

end function

public function decimal f_get_remain_qty_matching_1 (double vdb_f_doc_id);/*********************
trả về số lượng chưa kết hết
**********************/
t_ds_db		lds_matching
decimal		ldc_qty,ldc_f_qty,ldc_remain
long			ll_rtn
any			laa_data[]
int				li_idx

lds_matching = create t_ds_db
lds_matching.dataobject = 'ds_matching'
lds_matching.f_settransobject( SQLCA) 
laa_data[1] = vdb_f_doc_id
lds_matching.f_add_where( 'f_doc_id', laa_data)
ll_rtn = lds_matching.retrieve()
for li_idx = 1 to ll_rtn
	ldc_f_qty += lds_matching.getitemnumber( li_idx, 'f_qty')
	ldc_qty += lds_matching.getitemnumber( li_idx, 'qty')
next
destroy lds_matching
return ldc_f_qty - ldc_qty
end function

public function double f_get_return_price (double vdb_line_id, string vs_col_get_price, string vs_col_get_qty, string vs_dwo_get_price);double				ldb_id, ldb_price, ldb_round_id, ldb_object_ref_id, vdb_unit_id
long					ll_qty, ll_rtn
any     				la_id[]
t_ds_db	 			lds_dw_price
t_transaction		lt_transaction

//tim id dong co gia ban, gia mua can lay
if pos(vs_dwo_get_price,'sal') >0 then //lay gia hoa don ban
	select max(temp.id) into  :ldb_id
	from
		(select sal.id 
			from sal_invoice_line sal
			join matching mat1 on mat1.t_ref_id = sal.id
			join inventory_line ivl on ivl.id = mat1.f_ref_id
			join matching mat2 on mat2.t_ref_id = ivl.id
			join so_line so on so.id = mat2.f_ref_id and upper(mat2.t_ref_table) = 'INVENTORY_LINE'
			join matching mat3 on mat3.f_ref_id = so.id and upper(mat3.t_ref_table) = 'SO_LINE'
			join so_line so1 on so1.id = mat3.t_ref_id
			join matching mat4 on mat4.f_ref_id = so1.id
		where mat4.t_ref_id = :vdb_line_id
		union
		select sal.id
		from sal_invoice_line sal 
			join matching mat1 on mat1.t_ref_id = sal.id
			join so_line so on so.id = mat1.f_ref_id 
			join matching mat2 on mat2.f_ref_id = so.id                 
		where mat2.t_ref_id = :vdb_line_id
		union
		select id from SAL_INVOICE_LINE where id= :vdb_line_id)
	temp using sqlca ;
else //lay gia hoa don mua
	select max(temp.id) into  :ldb_id
	from
		(select pur.id from pur_invoice_line pur
		join matching mat1 on mat1.t_ref_id = pur.id
		join inventory_line ivl on ivl.id = mat1.f_ref_id
		join matching mat2 on mat2.t_ref_id = ivl.id
		join po_line po on po.id = mat2.f_ref_id and upper(mat2.t_ref_table) = 'INVENTORY_LINE'
		join matching mat3 on mat3.f_ref_id = po.id and upper(mat3.t_ref_table) = 'PO_LINE'
		join po_line po1 on po1.id = mat3.t_ref_id
		join matching mat4 on mat4.f_ref_id = po1.id
		where mat4.t_ref_id = :vdb_line_id
	union
	select pur.id from pur_invoice_line pur 
		join matching mat1 on mat1.t_ref_id = pur.id
		join po_line po on po.id = mat1.f_ref_id 
		join matching mat2 on mat2.f_ref_id = po.id                 
	where mat2.t_ref_id = :vdb_line_id
	union
		select id from PUR_INVOICE_LINE where id= :vdb_line_id)
	temp using sqlca ;
end if
// get cot can lay gia
if sqlca.sqlcode=0 then
	if not isnull(ldb_id) then 
		lds_dw_price=create t_ds_db
		la_id[1]=ldb_id
		lds_dw_price.dataobject=vs_dwo_get_price
		lds_dw_price.f_add_where('id',la_id[])
		iw_display.f_get_transaction(lt_transaction)
		lds_dw_price.f_settransobject(lt_transaction)
		ll_rtn=lds_dw_price.retrieve( )
		ldb_price=lds_dw_price.getitemnumber(ll_rtn, vs_col_get_price)
		if isnull(ldb_price) then ldb_price=0
		if vs_col_get_qty='' then
			destroy lds_dw_price
			return ldb_price
		else
			ll_qty=lds_dw_price.getitemnumber(ll_rtn, vs_col_get_qty)
			if isnull(ll_qty) then ll_qty=0 
			ldb_price=ldb_price / ll_qty
			//xu ly lam tron
			ldb_object_ref_id=lds_dw_price.getitemnumber(ll_rtn,'OBJECT_REF_ID')
			select currency_id into:vdb_unit_id from  booked_slip where id=:ldb_object_ref_id using sqlca;
			if sqlca.sqlcode=0 then
				if isnull(vdb_unit_id) then vdb_unit_id=0
				ldb_round_id=this.ic_unit_instance.f_get_round_id( vdb_unit_id, 0, 'price')
				ldb_price=this.ic_unit_instance.f_round(lt_transaction, ldb_round_id, ldb_price)
			end if
			destroy lds_dw_price
			return ldb_price 
		end  if
	else
		destroy lds_dw_price
		return 0
	end if
else
	destroy lds_dw_price
	return 0
end if
return 0
end function

public function integer f_insert_matching (powerobject vpo_f_copy, powerobject vpo_t_copy, string vas_match_col[], string vas_match_f_col[], string vs_match_type, double vdb_doc_f_id, double vdb_doc_t_id, ref t_ds_db rds_matching, datetime vdt_match_date, long vl_f_row, long vl_t_row);datetime		ldt_sysdate
double		ldb_ID
long			ll_row
int 			li_idx,li_rtn

ll_row = rds_matching.event e_addrow( )
if ll_row = -1 then return -1
ldb_ID = this.f_create_id( )
if ldb_ID = -1 then return -1
li_rtn = rds_matching.setitem(ll_row,'ID',ldb_ID)
li_rtn = rds_matching.setitem(ll_row,'F_REF_ID',vpo_f_copy.dynamic f_getitemany(vl_f_row,'ID'))
li_rtn = rds_matching.setitem(ll_row,'F_REF_TABLE',upper(vpo_f_copy.dynamic describe( "DataWindow.Table.UpdateTable")))
li_rtn = rds_matching.setitem(ll_row,'T_REF_ID',vpo_t_copy.dynamic f_getitemany(vl_t_row,'ID'))
li_rtn = rds_matching.setitem(ll_row,'T_REF_TABLE',upper(vpo_t_copy.dynamic describe( "DataWindow.Table.UpdateTable")))
li_rtn = rds_matching.setitem(ll_row,'MATCH_TYPE',upper(vs_match_type))
li_rtn = rds_matching.setitem(ll_row,'MATCHING_DATE',vdt_match_date)
li_rtn = rds_matching.setitem(ll_row,'F_DOC_ID',vdb_doc_f_id)
li_rtn = rds_matching.setitem(ll_row,'T_DOC_ID',vdb_doc_t_id)
li_rtn = rds_matching.setitem(ll_row,'F_BRANCH_ID',vpo_f_copy.dynamic f_getitemany(vl_f_row,'BRANCH_ID'))
li_rtn = rds_matching.setitem(ll_row,'T_BRANCH_ID',vpo_t_copy.dynamic f_getitemany(vl_t_row,'BRANCH_ID'))
for li_idx = 1 to upperbound(vas_match_col)
	li_rtn = rds_matching.setitem(ll_row, vas_match_col[li_idx], vpo_f_copy.dynamic  f_getitemany(vl_f_row,vas_match_f_col[li_idx]))
	//-- set thêm giá trị cấn trừ nếu có --//
//	dw1.Describe(vas_match_f_col[li_idx] + "_settle" + ".Visible")
	if IsNumber(vpo_f_copy.dynamic describe(vas_match_f_col[li_idx] + "_settle" + ".Visible")) then
		li_rtn = rds_matching.setitem(ll_row, vas_match_col[li_idx] + '_settle', vpo_f_copy.dynamic  f_getitemany(vl_f_row,vas_match_f_col[li_idx] + '_settle'))
	end if
next

return li_rtn

end function

public function double f_get_doc_id (double vdb_detail_id, string vs_detail_table);double	ldb_doc_id

choose case upper(vs_detail_table)
	case 'SO_LINE'
		select doc.id into :ldb_doc_id from document doc join so_line on so_line.object_ref_id = doc.version_id where so_line.id = :vdb_detail_id using SQLCA;
	case 'PO_LINE'
		select doc.id into :ldb_doc_id from document doc join PO_LINE on PO_LINE.object_ref_id = doc.version_id where PO_LINE.id = :vdb_detail_id using SQLCA;
	case 'PR_LINE'
		select doc.id into :ldb_doc_id from document doc join PR_LINE on PR_LINE.object_ref_id = doc.version_id where PR_LINE.id = :vdb_detail_id using SQLCA;
	case 'INVENTORY_LINE'
		select doc.id into :ldb_doc_id from document doc join INVENTORY_LINE on INVENTORY_LINE.object_ref_id = doc.version_id where INVENTORY_LINE.id = :vdb_detail_id and doc.sob = :gs_sob using SQLCA;
	case 'SAL_INVOICE_LINE'
		select doc.id into :ldb_doc_id from document doc join SAL_INVOICE_LINE on SAL_INVOICE_LINE.object_ref_id = doc.version_id where SAL_INVOICE_LINE.id = :vdb_detail_id and doc.sob = :gs_sob using SQLCA;
	case 'PUR_INVOICE_LINE'
		select doc.id into :ldb_doc_id from document doc join PUR_INVOICE_LINE on PUR_INVOICE_LINE.object_ref_id = doc.version_id where PUR_INVOICE_LINE.id = :vdb_detail_id and doc.sob = :gs_sob using SQLCA;
	case 'PAYMENT_LINE'
		select doc.id into :ldb_doc_id from document doc join PAYMENT_LINE on PAYMENT_LINE.object_ref_id = doc.version_id where PAYMENT_LINE.id = :vdb_detail_id and doc.sob = :gs_sob using SQLCA;
	case 'ORDER_CATCH'
		// chưa viết view cho order_catch
	case 'ITEM_CATCH'
		//view chưa lấy đc doc_id
	case 'POST_LINE'
		select pos.doc_id into :ldb_doc_id from post_line pos where pos.id = :vdb_detail_id using SQLCA;
	case 'LEDGER_LINE'
	//	select V_LEDGER_LINE.doc_id into :ldb_doc_id from V_LEDGER_LINE where V_LEDGER_LINE.id = :vdb_detail_id using SQLCA;
		ldb_doc_id = 0
	case 'QT_LINE'
		SELECT DOC.ID INTO :ldb_doc_id FROM QT_LINE JOIN DOCUMENT DOC ON DOC.VERSION_ID = QT_LINE.OBJECT_REF_ID WHERE QT_LINE.ID = :vdb_detail_id USING SQLCA;
end choose
if SQLCA.sqlcode = -1 then
	return -1
elseif SQLCA.sqlcode = 100 then //mới kết chưa lưu nên doc_id chưa có dưới db
	return 0
else
	if isnull(ldb_doc_id) then ldb_doc_id = 0
	return ldb_doc_id
end if
return 0
end function

public function integer f_update_matching (datawindow vdw_modifing, long vl_row_editing, dwbuffer v_dwbuffer);b_obj_instantiate	lc_obj
s_str_dwo_related	lstr_related[]
t_transaction			lt_transaction
c_dwservice				lc_dwsr
c_datetime				lc_dt
t_ds_db 					lds_matching,lds_temp
c_string					lc_string
double					ldc_remain_matching[], ldc_qty_doc,ldb_object_id,ldc_rtn,ldb_value_return, ldb_value_matching, ldb_value_matched[], ldb_matching
double					ldb_t_ref_id, ldb_match_id, ladb_f_ref_id[], ldb_total_remain, ldb_total_matched, ldb_empty[],ldb_f_ref_id,ldb_doc_id, ldb_value_matching_diff
string						las_match_f_column[],las_match_t_column[],las_match_column[],ls_t_ref_table,ls_object_code,ls_f_ref_table,ls_update_table
string						las_rf_dwo[],ls_sql,ls_f_table,ls_table_rtn,ls_collabel,ls_doc_type,ls_dwo_matched_f,las_col_matched_f[],ls_col_matched_f,las_minus_dwo[]
any						laa_data[], la_data, ls_filter
long						ll_remain_idx, li_count,li_idx,li_idx1,li_count1,li_idx2,li_rtn,li_row,li_remain_cnt,ll_row,ll_find
boolean					lb_check_f_ref_id,lb_confirm,lb_check_value = false

li_count = this.f_get_dwo_related( lstr_related)
iw_display.f_get_transaction( lt_transaction)
lds_matching = create t_ds_db
lds_matching.dataobject = 'ds_matching'
lds_matching.f_settransobject( lt_transaction)
ldb_match_id = vdw_modifing.getitemnumber(vl_row_editing,'id', v_dwbuffer,false)
//ldb_doc_id = this.f_get_doc_id( ldb_match_id, vdw_modifing.describe('datawindow.table.update') )
ldb_doc_id = lt_transaction.f_get_doc_id(ldb_match_id , vdw_modifing.describe('datawindow.table.update'))
if ids_matching.rowcount( ) >0 then
	for ll_row=1 to ids_matching.rowcount( )
		ls_f_table=ids_matching.getitemstring(ll_row,'f_ref_table')
		ldb_f_ref_id=ids_matching.getitemnumber(ll_row,'f_ref_id')
		if isnull(ldb_f_ref_id) then ldb_f_ref_id=0
		//kiem tra f_ref_id co  ton tai hay khong
		lb_check_f_ref_id=lt_transaction.f_check_id_exists_table(ldb_f_ref_id,ls_f_table)
		if lb_check_f_ref_id=false then
			gf_messagebox('m.b_doc.f_update_matching.01','Thông báo','Dữ liệu đã được thay đổi bởi user khác,vui lòng kết lại phiếu','stop','ok',1)	
			return -1
		end if
	next
end if

redo:
for li_idx = 1 to li_count
	if lstr_related[li_idx].b_t_matching then // có cập nhật bản match và nằm bên To
		for li_idx1 = 1 to upperbound(lstr_related[li_idx].s_match_t_dwo)
			if lb_check_value then continue
			if li_idx1 > 1 then 
				if lstr_related[li_idx].s_match_t_dwo[li_idx1] = lstr_related[li_idx].s_match_t_dwo[li_idx1 -1] and lstr_related[li_idx].s_match_f_dwo[li_idx1] = lstr_related[li_idx].s_match_f_dwo[li_idx1 -1] then continue
			end if
			if lstr_related[li_idx].s_match_t_dwo[li_idx1] <> vdw_modifing.dataobject then continue
			ls_filter=ids_matching.describe( "Datawindow.Table.filter")
			if ls_filter<> '?' then
				ids_matching.setfilter( "")
				ids_matching.filter()
			end if	
			if ids_matching.rowcount( ) = 0 then
				laa_data[1] = ldb_match_id
				lds_matching.f_add_where( 't_ref_id', laa_data[])
				if lds_matching.retrieve( ) = 0 then return 0
				ldb_doc_id = lds_matching.getitemnumber( lds_matching.rowcount(), 'f_doc_id')
			else
				li_row = ids_matching.find( 't_ref_id =' +string(ldb_match_id), 1, ids_matching.rowcount( ))
				if li_row = 0 then return 0
				ldb_doc_id = ids_matching.getitemnumber( li_row, 'f_doc_id')
			end if
			ls_doc_type = this.f_get_doc_type_ex( ldb_doc_id, lt_transaction )
			if pos(lower(ls_doc_type),'demo') > 0 then ls_doc_type = left(ls_doc_type,len(ls_doc_type) - 5)
			if 'u_' + trim(lower(ls_doc_type)) <> trim(lower(lstr_related[li_idx].s_related_obj_name)) & 
				and 'u_' + trim(lower(ls_doc_type)) +'_all' <> trim(lower(lstr_related[li_idx].s_related_obj_name))  &
				and 'u_' + trim(lower(ls_doc_type)) +'_total' <> trim(lower(lstr_related[li_idx].s_related_obj_name)) then  continue
			li_count1 = lc_string.f_stringtoarray(lstr_related[li_idx].s_match_t_column[li_idx1] , ';', las_match_t_column)
			li_count1 = lc_string.f_stringtoarray(lstr_related[li_idx].s_match_f_column[li_idx1] , ';', las_match_f_column)
			if upperbound(lstr_related[li_idx].s_match_minus_dwo[]) > 0 then	li_count1 = lc_string.f_stringtoarray(lstr_related[li_idx].s_match_minus_dwo[li_idx1] , ';', las_minus_dwo)
			if upperbound(lstr_related[li_idx].s_dwo_matched_f_dwo) >= li_idx1 then ls_dwo_matched_f=  lstr_related[li_idx].s_dwo_matched_f_dwo[li_idx1]
			if upperbound(lstr_related[li_idx].s_column_matched_f_dwo) >= li_idx1 then  lc_string.f_stringtoarray( lstr_related[li_idx].s_column_matched_f_dwo[li_idx1], ';', las_col_matched_f)
			if upperbound(lstr_related[li_idx].s_match_rf_dwo[]) > 0 then	li_count1 = lc_string.f_stringtoarray(lstr_related[li_idx].s_match_rf_dwo[li_idx1] , ';', las_rf_dwo) 
			li_count1 = lc_string.f_stringtoarray(lstr_related[li_idx].s_match_column[li_idx1] , ';', las_match_column)
			
			for li_idx2 = 1 to li_count1
				if upperbound(las_col_matched_f) > 0 then
					ls_col_matched_f = las_col_matched_f[li_idx2]
				end if
				ldb_value_matched[]  = ldb_empty[]
				ldc_remain_matching[] = ldb_empty[]
				ladb_f_ref_id[]  = ldb_empty[]
				ldb_total_remain = 0
				ldb_total_matched = 0
				ldb_matching=0
				ldb_value_matching= vdw_modifing.dynamic f_getitemany(vl_row_editing , las_match_t_column[li_idx2])	
				li_remain_cnt = this.f_get_remain_and_matched_value(vdw_modifing,lstr_related[li_idx].s_match_f_dwo[li_idx1], lstr_related[li_idx].s_match_t_dwo[li_idx1], las_rf_dwo, las_match_f_column[li_idx2], las_match_column[li_idx2], ldc_remain_matching[], ldb_value_matched[],ladb_f_ref_id[],ldb_total_remain, ldb_total_matched,vl_row_editing,ldb_matching,ldb_doc_id,ls_dwo_matched_f,ls_col_matched_f,las_minus_dwo)
				if li_remain_cnt = 0 then exit
				if lstr_related[li_idx].b_return then
					if ldb_value_matching > (ldb_total_remain+ ldb_total_matched) then
						if vdw_modifing.describe("object_id.X") <> "!" then
							ldb_object_id = vdw_modifing.getitemnumber(vl_row_editing,'object_id')
						else
							ldb_object_id = vdw_modifing.getitemnumber(vl_row_editing,'item_id')
						end if
						//-- tạm thời khóa --//
//						ls_object_code = lc_dwsr.f_get_object_code( ldb_object_id)				
//						if gf_messagebox('m.b_doc.f_update_matching.02','Xác nhận', ls_object_code+' @Có giá trị thay đổi lớn hơn giá trị chứng từ gốc được kết. Bạn có muốn tiếp tục thực hiện không?','question','yesno',2) = 2 then
//							return -1
//						end if
					end if
				else
					if ldb_value_matching+(ldb_total_matched - ldb_matching) > (ldb_total_remain+ ldb_total_matched) and pos('qty;', las_match_column[li_idx2] +';')>0 then
//						if not lb_check_value and li_idx1 < upperbound(lstr_related[li_idx].s_match_t_dwo) then continue
						if vdw_modifing.describe("object_id.X") <> "!" then
							ldb_object_id = vdw_modifing.getitemnumber(vl_row_editing,'object_id')
						else
							ldb_object_id = vdw_modifing.getitemnumber(vl_row_editing,'item_id')
						end if
						
						lb_confirm = false
						ls_object_code = lc_obj.f_get_object_code( ldb_object_id)				
						gf_messagebox('m.b_doc.f_update_matching.02','Thông báo', ls_object_code+' @ -> Có giá trị thay đổi lớn hơn giá trị chứng từ gốc được kết: @' +string(ldb_total_remain+ ldb_total_matched),'exclamation','ok',1)
						return -1
						 //-- tạm thời khóa --//
//						if gf_messagebox('m.b_doc.f_update_matching.02','Thông báo', ls_object_code+' @Có giá trị thay đổi lớn hơn giá trị chứng từ gốc được kết. Bạn có muốn tiếp tục thực hiện không?: @' +string(ldb_total_remain+ ldb_total_matched),'exclamation','ok',1) = 1 then
//							return -1
//						else
//							lb_confirm = true
//						end if
					else
						lb_check_value = true
					end if
				end if
				//-- tính giá trị thay đổi --//
//				ldb_value_matching -= ldb_matching
				ldb_value_matching_diff = ldb_value_matching - ldb_matching
				if ids_matching.rowcount( ) > 0 and li_idx2 = 1 then		
					ids_matching.rowscopy( 1 , ids_matching.rowcount() , Primary!, lds_matching, lds_matching.rowcount() + 1, Primary!)
				end if		
				//-- nếu kết hơn giá trị bên from thì không cần tính lại mà lấy giá trị nhỏ nhất để matching( giá trị bên from) hoặc kết bằng giá trị cũng ko tính lại--//
//				if lb_confirm or ldb_value_matching = 0 then continue 
				if ldb_value_matching_diff = 0 then continue 
				//-- trường hợp đã matched hết giá trị --//
				if  upperbound(ladb_f_ref_id[]) = 0 then
					li_row = lds_matching.find( las_match_column[li_idx2]+" >= "+string(abs(ldb_value_matching))+ " and t_ref_id =" +string(ldb_match_id), 1, lds_matching.rowcount())
					if li_row > 0 then
						if ids_matching.rowcount( ) > 0 and ldb_value_matching_diff > 0 then
							li_rtn = lds_matching.setitem(li_row , las_match_column[li_idx2], ldb_value_matching)
//						elseif ids_matching.rowcount( ) > 0 and ldb_value_matching > 0 and lb_confirm then //-- kết nhiều hơn --//
//							ldb_value_matched[1] = lds_matching.getitemnumber(lds_matching.rowcount() , las_match_column[li_idx2])
//							li_rtn = lds_matching.setitem(li_row , las_match_column[li_idx2], ldb_value_matched[1])
						else
							ldb_value_matched[1] = lds_matching.getitemnumber(li_row , las_match_column[li_idx2])
							li_rtn = lds_matching.setitem(li_row , las_match_column[li_idx2], ldb_value_matching_diff +  ldb_value_matched[1])
						end if
					else //-- sau khi kết, user nhập thêm mới hoặc xoá record matching--//
						if ldb_value_matching_diff > 0 then
							ldb_value_matched[1] = lds_matching.getitemnumber(lds_matching.rowcount() , las_match_column[li_idx2])
							if isnull(ldb_value_matched[1] ) then ldb_value_matched[1] = 0
							li_rtn = lds_matching.setitem(lds_matching.rowcount( ) , las_match_column[li_idx2], ldb_value_matching_diff +  ldb_value_matched[1])
						else
							FOR li_row = 1 to lds_matching.rowcount( )
								ldb_value_matched[1] = lds_matching.getitemnumber(li_row , las_match_column[li_idx2])		
								if isnull(ldb_value_matched[1] ) then ldb_value_matched[1] = 0
								ldb_value_matching += ldb_value_matched[1]
								li_rtn = lds_matching.setitem(li_row , las_match_column[li_idx2], max(ldb_value_matching,0))
								if  ldb_value_matching >= 0 then exit
							NEXT
							Do
								ll_find = lds_matching.find(las_match_column[li_idx2] + " = 0", ll_find, lds_matching.rowcount( ) + 1 )
								if ll_find > 0 then lds_matching.deleterow( ll_find)
							Loop While ll_find > 0
						end if
					end if
					lds_matching.setitem( li_row, 'MATCHING_DATE', lc_dt.f_getsysdate( ))
					if li_idx2 =li_count1 then li_idx = li_count
				end if
				//-- Trường hợp có những record ở bảng match chưa matched hết giá trị --//
				FOR ll_remain_idx = 1 to upperbound(ladb_f_ref_id[])
					li_row = lds_matching.find( 'f_ref_id =' +string(ladb_f_ref_id[ll_remain_idx]), 1, lds_matching.rowcount( ))
					if li_row > 0 then
						if ll_remain_idx = upperbound(ladb_f_ref_id[]) then
							li_rtn = lds_matching.setitem( li_row, las_match_column[li_idx2], ldb_value_matching_diff + ldb_value_matched[ll_remain_idx] )
						else
							if ldb_value_matching > ldc_remain_matching[ll_remain_idx] then
								li_rtn = lds_matching.setitem( li_row, las_match_column[li_idx2], ldc_remain_matching[ll_remain_idx] + ldb_value_matched[ll_remain_idx])
								ldb_value_matching -= ldc_remain_matching[ll_remain_idx]
							else
								li_rtn = lds_matching.setitem( li_row, las_match_column[li_idx2], ldb_value_matching + ldb_value_matched[ll_remain_idx])
								ldb_value_matching = 0
							end if
							if ldb_value_matching = 0 then exit
						end if		
						lds_matching.setitem( li_row, 'MATCHING_DATE', lc_dt.f_getsysdate( ))
						if li_idx2 =li_count1 then li_idx = li_count
					end if
				NEXT	
			next
		next
	elseif lstr_related[li_idx].b_f_matching then // sửa bên from
		lds_temp = create t_ds_db
		for li_idx1 = 1 to upperbound(lstr_related[li_idx].s_match_t_dwo)
			if lstr_related[li_idx].s_match_t_dwo[li_idx1] <> vdw_modifing.dataobject then continue
			ldb_match_id = vdw_modifing.getitemnumber(vl_row_editing,'id', v_dwbuffer,false)
			if upperbound(lstr_related[li_idx].s_match_rf_dwo[]) > 0 then
				li_count1 = lc_string.f_stringtoarray(lstr_related[li_idx].s_match_rf_dwo[li_idx1] , ';', las_rf_dwo) 
				for li_idx2 = 1 to li_count1
					lds_temp.dataobject = las_rf_dwo[li_idx2]
					if ls_table_rtn <> '' then ls_table_rtn = ls_table_rtn + ';'
					ls_table_rtn = lds_temp.describe( "datawindow.table.update")
				next
			end if
			li_count1 = lc_string.f_stringtoarray(lstr_related[li_idx].s_match_f_column[li_idx1] , ';', las_match_f_column)
			li_count1 = lc_string.f_stringtoarray(lstr_related[li_idx].s_match_column[li_idx1] , ';', las_match_column)
			for li_idx2 = 1 to li_count1
//				if this.f_get_values_matching_and_return(ldb_match_id,ls_table_rtn, ldb_value_matching, ldb_value_return, las_match_column[li_idx2]) > 0 then
//					if vdw_modifing.getitemnumber(vl_row_editing,las_match_f_column[li_idx2]) < (ldb_value_matching + ldb_value_return) then
//						ls_collabel = lc_dwsr.f_getcolumnlabel( las_match_f_column[li_idx2], vdw_modifing.dataobject, this.classname())
//						gf_messagebox('m.b_doc.f_update_matching.03','Thông báo','Cột "'+ls_collabel+'" có giá trị nhỏ hơn giá trị được kết','stop','ok',1)	
//						return -1
//					end if
//				end if
			next			
		next
	end if
next

if lds_matching.update(true,false ) = -1 then
	if  lds_matching.ii_dberrorcode = -3 then 
		lds_matching.ii_dberrorcode = 0
		goto redo
	end if
	gf_messagebox('m.b_doc.f_update_matching.03','Thông báo', lt_transaction.SQLErrText ,'stop','ok',1)	
	rollback using lt_transaction;
	destroy lds_matching
	return -1
end if

lds_matching.resetupdate( )
destroy lds_matching
return 1
end function

public function integer f_booking_sob (double vdb_doc_id, double vdb_trans_hdr_id, string vs_doctype);u_trans_setup	lc_trans_setup
b_popup_data	lb_popup_input
b_multithread	lb_booked_tax
t_transaction	lt_transaction
t_dw_mpl		ldw_main
t_ds_db			lds_return
string				ls_dwo,ls_respond,ls_sob_yn

lc_trans_setup = create u_trans_setup
if not iw_display.dynamic f_exist_second_sob( vdb_doc_id) then // kiểm tra xem đã có ghi sổ phụ chưa
	ldw_main = iw_display.f_get_dwmain( )
	if ldw_main.describe( "sob_yn.x") <> "!" then
		ls_sob_yn = ldw_main.getitemstring( ldw_main.getrow(), 'sob_yn')
		if isnull(ls_sob_yn) then ls_sob_yn = 'N'
	end if
	
	
	if ls_sob_yn = 'Y' then //-- kiểm tra ghi sổ trên document --//
//	if lc_trans_setup.f_get_trans_setup_sob( vs_doctype, vdb_trans_hdr_id) = 'Y' then // kiểm tra xem có cài đặt ghi sổ phụ không
		if lc_trans_setup.f_get_trans_setup_sob_popup(vs_doctype,vdb_trans_hdr_id) = 'Y' then // hiển thị form chọn ghi sổ hay không
			lb_popup_input = create b_popup_data
			if gs_sob = 'F' then
				ls_dwo = 'd_sob_f_form'
			else
				ls_dwo = 'd_sob_t_form'
			end if
			lb_popup_input.is_display_column = 'sob'  //cột cần set mặc định
			lb_popup_input.iaa_default_data[1] = gs_sob // giá trị set mặc định
			lb_popup_input.f_init_popup_display( '1d', ls_dwo, 2000, 1000)
			openwithparm(s_wr_multi,lb_popup_input)
			lds_return = message.powerobjectparm
			if isvalid(lds_return) then
				setnull(message.powerobjectparm)
				ls_respond = lds_return.f_getitemany( lds_return.rowcount( ) , 'sob')
//				if isnull(ls_respond) then ls_respond = //-- thông báo chưa chọn sổ phụ??
			end if
			destroy lb_popup_input
		else
			if gs_sob = 'F' then
				ls_respond = 'T'
			else
				ls_respond = 'F'
			end if
		end if
		if ls_respond <> gs_sob and ls_respond <> '' then
			lb_booked_tax = create b_multithread
			iw_display.f_get_transaction( lt_transaction)
				///---- mở ra để debug --//
//			lb_booked_tax.event e_window_e_post( vdb_doc_id, ls_respond, this.classname( ),lt_transaction.servername,lt_transaction.logid ,lt_transaction.logpass,gi_userid )
			
			//-- khoá lại để debug --//
			if sharedobjectregister("b_multithread","i_multithread_booked") = Success! then
				if sharedobjectGet("i_multithread_booked", lb_booked_tax) = Success! then
					lb_booked_tax.post event e_window_e_post( vdb_doc_id, ls_respond, this.classname( ),lt_transaction.servername,lt_transaction.logid ,lt_transaction.logpass,gi_userid , gi_user_comp_id, gdb_branch )
				else 
					gf_messagebox('m.b_doc.f_booking_sob.01','Thông báo','Lỗi ghi sổ phụ!','exclamation','ok',1)
				end if
				SharedobjectUnregister("i_multithread_booked")
			else
				gf_messagebox('m.b_doc.f_booking_sob.01','Thông báo','Lỗi ghi sổ phụ!','exclamation','ok',1)
				destroy lc_trans_setup
				return -1
			end if	  //-- khoá lại để debug --//


		end if
	end if
	
end if
destroy lc_trans_setup
return 1
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
u_account		lu_account


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
		lu_account = create u_account
		ls_balance_control = lu_account.f_get_balance_control( ldb_object_id)
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
					destroy lu_account					
					return -1
				end if
			end if
			ll_insertrow = lds_object_balance.event e_addrow()	
			ldb_id = this.f_create_id( )
			lds_object_balance.setitem(ll_insertrow,'id', ldb_id)				
		elseif ll_row_prev_bal = 0 then
			ldb_open_amt = 0
			ldb_open_base_amt = 0
			ll_insertrow = lds_object_balance.event e_addrow()	
			ldb_id = this.f_create_id( )
			lds_object_balance.setitem(ll_insertrow,'id', ldb_id)	
		else
			gf_messagebox('m.b_doc.f_insert_object_balance.01','Thông báo','Không lấy được số dư đầu do bảng balance có nhiều dòng trong 1 ngày:b_doc.f_insert_object_balance:line 86','stop','ok',1)
			destroy lds_object_open_bal
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
		gf_messagebox('m.b_doc.f_insert_object_balance.01','Thông báo','Không lấy được số dư đầu do bảng balance có nhiều dòng trong 1 ngày:b_doc.f_insert_object_balance:line 86','stop','ok',1)
		destroy lds_object_open_bal
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
			ls_account_code= lu_account.f_get_code( ldb_object_id)
			gf_messagebox('m.b_doc.f_insert_object_balance.02','Thông báo', 'Tài khoản sau không được dư bên Có:@'+ls_account_code ,'exclamation','ok',1)			
			rollback using rt_transaction;
			destroy lds_object_balance	
			destroy lu_account
			return -1
		end if
	elseif  ls_balance_control = 'cr' then
		if ldb_close_base_amt  > 0 or ldb_close_amt > 0 then 
			ls_account_code= lu_account.f_get_code( ldb_object_id)
			gf_messagebox('m.b_doc.f_insert_object_balance.03','Thông báo', 'Tài khoản sau không được dư bên Nợ:@'+ls_account_code ,'exclamation','ok',1)			
			rollback using rt_transaction;
			destroy lds_object_balance	
			destroy lu_account
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
			gf_messagebox('m.b_doc.f_insert_object_balance.04','Thông báo', rt_transaction.SQLErrText ,'stop','ok',1)
			return -1				
		end if
		gf_messagebox('m.b_doc.f_insert_object_balance.04','Thông báo', rt_transaction.SQLErrText ,'stop','ok',1)
		rollback using rt_transaction;
		destroy lds_object_balance	
		destroy lds_object_open_bal
		destroy lu_account
		return -1
	end if	
	
	//-- update object balance những ngày sau trans_date các ngày tiếp theo --//
	SELECT max(balance_date) into :ld_max_date from object_balance 
	where  sob =:vs_sob and object_id= :ldb_object_id and company_id = :gi_user_comp_id	and branch_id = :ldb_branch_id
	and trans_currency = :ldb_trans_currency	and control_account = :ldb_account_id	and nvl(subaccount,0) = nvl(:ldb_subaccount,0)	using sqlca;
	
	
	if daysafter(vd_trans_date, ld_max_date) > 0 then
		lds_object_balance.dataobject = 'ds_object_balance_after'
		lds_object_balance.f_settransobject(rt_transaction)						
		li_rtn = this.f_update_object_balance(vs_sob,ldb_branch_id, ldb_object_id, ls_object_type, ldb_trans_currency,ldb_account_id,ldb_subaccount, ls_not_accept, & 
											ldb_close_amt,ldb_close_base_amt,rt_transaction,ls_balance_control,vd_trans_date, ld_max_date, lds_object_balance)
		if li_rtn = -1 then
			rollback using rt_transaction;
			destroy lds_object_balance	
			destroy lu_account					
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
				gf_messagebox('m.b_doc.f_insert_object_balance.04','Thông báo', rt_transaction.SQLErrText ,'stop','ok',1)
				return -1				
			end if
			gf_messagebox('m.b_doc.f_insert_object_balance.04','Thông báo', rt_transaction.SQLErrText ,'stop','ok',1)
			rollback using rt_transaction;
			destroy lds_object_balance	
			destroy lds_object_open_bal
			destroy lu_account
			return -1
		end if
	end if
	
NEXT

destroy lds_object_balance
destroy lds_object_open_bal
destroy lu_account
return 1
	
end function

public function integer f_insert_exrate_post_line (ref t_ds_db rds_post_line, s_str_post_account vstr_post_account, double vdb_diff_amount, double vdb_settle_currency, double vdb_exrate, date vd_trans_date, double vdb_doc_id, double vdb_object_ref_id, string vs_object_ref_table);long			ll_insert_row
double		ldba_exchange_account[]
string			ls_exrate_method, ls_trans_text, ls_posting_type

if vdb_settle_currency = 0 or isnull(vdb_settle_currency) then return 0
if vdb_doc_id = 0 or isnull(vdb_doc_id) then return 0
if vdb_diff_amount = 0 or isnull(vdb_diff_amount) then return 0

if this.ic_unit_instance.f_get_exchange_account_info( vdb_settle_currency, ldba_exchange_account[], ls_exrate_method, ls_trans_text) = -1 then return -1

if vdb_diff_amount > 0 then //-- lỗ --//
	if isnull(ldba_exchange_account[1]) or ldba_exchange_account[1] = 0 then
		gf_messagebox('m.b_doc.f_insert_exrate_post_line.01','Thông báo','Chưa cài đặt tài khoản lỗ chênh lệch tỷ giá','exclamation','ok',1)
		return -1
	end if
	vstr_post_account.db_dr_account = ldba_exchange_account[1]
	vstr_post_account.s_dr_object_type = 'ACCOUNT'
	setnull(vstr_post_account.db_dr_object_id)
	ls_posting_type = 'realized_loss'
else //-- lãi --//
	if isnull(ldba_exchange_account[2]) or ldba_exchange_account[2] = 0 then
		gf_messagebox('m.b_doc.f_insert_exrate_post_line.01','Thông báo','Chưa cài đặt tài khoản lãi chênh lệch tỷ giá','exclamation','ok',1)
		return -1
	end if	
	vstr_post_account.db_cr_account = ldba_exchange_account[2]
	vstr_post_account.s_cr_object_type = 'ACCOUNT'
	setnull(vstr_post_account.db_cr_object_id)	
	ls_posting_type = 'realized_profit'
	vdb_diff_amount = -vdb_diff_amount
end if
//--insert post_line--//
ll_insert_row = rds_post_line.event e_addrow()
rds_post_line.setitem(ll_insert_row,'id', this.f_create_id( ) )
rds_post_line.setitem(ll_insert_row,'dr_object_type', upper(vstr_post_account.s_dr_object_type))
rds_post_line.setitem(ll_insert_row,'dr_object_id', vstr_post_account.db_dr_object_id)
rds_post_line.setitem(ll_insert_row,'trans_text', ls_trans_text )
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
rds_post_line.setitem(ll_insert_row,'EX_RATE', 0)
rds_post_line.setitem(ll_insert_row,'trans_date', vd_trans_date)

return ll_insert_row
end function

public function integer f_get_f_doc_id (double vdb_t_doc_id, ref double radb_f_doc_id[]);t_ds_db		lds_matching
double		ldb_f_doc_id
long			ll_rtn, ll_found
any			laa_data[]


laa_data[1] = vdb_t_doc_id
lds_matching = create t_ds_db
lds_matching.dataobject = 'ds_matching'
lds_matching.f_settransobject( SQLCA)
lds_matching.f_add_where( 't_doc_id', laa_data)
ll_rtn = lds_matching.retrieve( )
if ll_rtn > 0 then
	lds_matching.setsort('f_doc_id a' )
	lds_matching.sort( )
	ldb_f_doc_id =  lds_matching.getitemnumber( 1, 'f_doc_id')
	radb_f_doc_id[upperbound(radb_f_doc_id)+1] = ldb_f_doc_id
	ll_found = lds_matching.find( "f_doc_id <> " + string(ldb_f_doc_id),1, lds_matching.rowcount())
	DO while ll_found > 0
		ldb_f_doc_id =  lds_matching.getitemnumber( ll_found, 'f_doc_id')
		radb_f_doc_id[upperbound(radb_f_doc_id)+1]  = ldb_f_doc_id
		ll_found = lds_matching.find( "f_doc_id <> " + string(ldb_f_doc_id), ll_found+1, lds_matching.rowcount()+1)
	LOOP
end if
destroy lds_matching
return upperbound(radb_f_doc_id[])
end function

public function integer f_post_tax (double vdb_trans_hdr_id, double vdb_master_id, string vs_dw_binding);//Hàm post thuế lên chứng từ

s_str_dwo_related	lstr_retaled[]

c_dwservice	lc_dwser
t_dw_mpl 	ldw_binding,ldw_dr_cr_object, ldw_creteria
c_string		lc_str
b_rule 		lb_rule
double		ldb_obj_id
string			ls_obj_type,ls_filter,ls_col_criterial,ls_dw_criterial,ls_val_criterial,ls_col_type,ls_trans_id, ls_creterial_data
long 			ll_idx, ll_row,ll_find
any 			la_value[], la_retrieve_arg[], la_null[]
int				li_idx
boolean		lb_ok

ll_find = ids_trans_setup.find( " dr_obj_type = 'TAX_AUTHORITY' or cr_obj_type = 'TAX_AUTHORITY' ", 1, ids_trans_setup.rowcount())
if ll_find > 0 then
	this.f_get_data_related( lstr_retaled[])
	if upperbound(lstr_retaled[]) > 0 then
		for li_idx = 1 to upperbound(lstr_retaled[])
			if lstr_retaled[li_idx].s_related_obj_name = this.classname( ) then
				ldb_obj_id =  lstr_retaled[li_idx].db_dr_cr_object
			end if
			if ldb_obj_id > 0 then 
				ls_obj_type = this.f_get_object_type( ldb_obj_id) 
				exit
			end if
		next
	end if
	if ldb_obj_id = 0 then
		ldw_dr_cr_object = iw_display.f_get_dw(istr_dwo[2].s_dwo_default )
		if ldw_dr_cr_object.describe( "invoice_object.coltype") = 'number' then
			ldb_obj_id = ldw_dr_cr_object.getitemnumber( ldw_dr_cr_object.getrow(), 'invoice_object')
		elseif ldw_dr_cr_object.describe( "bill_to_object.coltype") = 'number' then
			ldb_obj_id = ldw_dr_cr_object.getitemnumber( ldw_dr_cr_object.getrow(), 'bill_to_object')
		end if
		if ldb_obj_id > 0 then
			ls_obj_type = this.f_get_object_type( ldb_obj_id)
		end if
	end if
	if isnull(ls_obj_type) then ls_obj_type =''
	
	//-- Thuế bến Nợ --//
	ls_filter = " and (cr_obj_type = '" + ls_obj_type + "' or cr_obj_type = 'ITEM' or cr_obj_type = 'ACCOUNT')"
	if ls_obj_type = '' then ls_filter = ''
	ids_trans_setup.setfilter("lower(dr_obj_type) ='tax_authority'" + ls_filter)
	ids_trans_setup.filter()
	
	if ids_trans_setup.rowcount( ) > 0 then
		for ll_idx = 1 to ids_trans_setup.rowcount( )
			ls_dw_criterial = ids_trans_setup.getitemstring( ll_idx, 'CR_DW_CRITERIAL')
			if not isnull(ls_dw_criterial) and ls_dw_criterial <> '' then
				ls_col_criterial = ids_trans_setup.getitemstring( ll_idx, 'CR_COL_CRITERIAL')
				ls_val_criterial = ids_trans_setup.getitemstring( ll_idx, 'CR_VALUE_CRITERIAL')												
			else
				ls_dw_criterial = ids_trans_setup.getitemstring( ll_idx, 'DR_DW_CRITERIAL')
				if not isnull(ls_dw_criterial) and ls_dw_criterial <> '' then
					ls_col_criterial = ids_trans_setup.getitemstring( ll_idx, 'CR_COL_CRITERIAL')
					ls_val_criterial = ids_trans_setup.getitemstring( ll_idx, 'CR_VALUE_CRITERIAL')								
				end if
			end if
			if isnull(ls_dw_criterial) or ls_dw_criterial ='' then
				ls_trans_id += string(ids_trans_setup.getitemnumber(ll_idx,'id')) +','
			else
				ldw_creteria =  iw_display.f_get_dw(ls_dw_criterial+'_grid')
				if isvalid(ldw_creteria) then
					ls_creterial_data = string(ldw_creteria.dynamic f_getitemany(ldw_creteria.getrow( ) , ls_col_criterial))
					lc_dwser.f_get_build_column( ldw_creteria, ls_col_criterial, ls_col_type)
					lb_ok =  lb_rule.f_is_criteria_ok( ls_creterial_data, ls_val_criterial, ls_col_type)
					if lb_ok then
						ls_trans_id += string(ids_trans_setup.getitemnumber(ll_idx,'id')) +','
					end if
				else 
					gf_messagebox('m.b_doc.f_post_tax.02','Thông báo','Datawindow cài đặt điều kiện không tìm thấy:@'+ls_dw_criterial ,'exclamation','ok',1)
					return -1
				end if				
			end if
		next				
		//-- filter lại các dòng thuế cần insert --//
		if ls_trans_id <> '' then
			ls_trans_id = left(ls_trans_id,len(ls_trans_id)-1)
			ids_trans_setup.setfilter( "id in (" + ls_trans_id + ')')
			ids_trans_setup.filter( )
			
			ldw_binding = iw_display.f_get_dw(vs_dw_binding)
			for ll_idx = 1 to ids_trans_setup.rowcount()
				la_value[1] = ids_trans_setup.getitemnumber(ll_idx,'dr_obj_instance_id')
				ll_find = ldw_binding.find( 'tax_id = '+string(la_value[1]) + ' AND object_ref_id = '+string(vdb_master_id) , 1, ldw_binding.rowcount( ) )
				if ll_find > 0 then continue
				ll_row = ldw_binding.event e_addrow()
				ldw_binding.setitem(ll_row,'tax_id',ids_trans_setup.getitemnumber(ll_idx,'dr_obj_instance_id'))
				ldw_binding.setitem(ll_row,'object_code',ids_trans_setup.getitemstring(ll_idx,'dr_object_code'))
				ldw_binding.setitem(ll_row,'object_name',ids_trans_setup.getitemstring(ll_idx,'dr_object_name'))
				ldw_binding.setitem(ll_row,'tax_type',ids_trans_setup.getitemstring(ll_idx,'dr_object_code'))
				ldw_binding.setitem(ll_row,'uprow_yn',ids_trans_setup.getitemstring(ll_idx,'dr_uprow_yn'))
				ldw_binding.setitem(ll_row,'INCLUDE_YN',ids_trans_setup.getitemstring(ll_idx,'dr_INCLUDE_YN'))
				ldw_binding.setitem(ll_row,'tax_report_group',ids_trans_setup.getitemnumber(ll_idx,'tax_report_group'))
				ldw_binding.setitem(ll_row,'tax_report_group_code',ids_trans_setup.getitemstring(ll_idx,'tax_report_group_code'))
				if ids_currency.rowcount() > 0 then
					ldw_binding.setitem(ll_row,'trans_currency',ids_currency.getitemnumber(1,'id'))
					ldw_binding.setitem(ll_row,'uom_code',ids_currency.getitemstring(1,'code'))
					ldw_binding.setitem(ll_row,'exchange_rate',1)
				end if
//				la_value[1] = ids_trans_setup.getitemnumber(ll_idx,'dr_obj_instance_id')
				ids_tax_authority.setfilter( "object_ref_id = " + string(la_value[1]))
				ids_tax_authority.filter( )
				if ids_tax_authority.rowcount() > 0 then
					ldw_binding.setitem(ll_row,'tax_pct',ids_tax_authority.getitemnumber(1,'default_pct') )
				end if
			next		
		else
			ids_trans_setup.setfilter('' )
			ids_trans_setup.filter( )							
			return 0
		end if		
	else 
		//-- Thuế bên Có --//
		ls_filter = " and (dr_obj_type = '" + ls_obj_type + "' or dr_obj_type = 'ITEM' or dr_obj_type = 'ACCOUNT')"
		if ls_obj_type = '' then ls_filter = ''
		ids_trans_setup.setfilter("lower(cr_obj_type) ='tax_authority'" + ls_filter)
		ids_trans_setup.filter()
		if ids_trans_setup.rowcount( ) > 0 then
			for ll_idx = 1 to ids_trans_setup.rowcount( )
				ls_dw_criterial = ids_trans_setup.getitemstring( ll_idx, 'CR_DW_CRITERIAL')
				if not isnull(ls_dw_criterial) and ls_dw_criterial <> '' then
					ls_col_criterial = ids_trans_setup.getitemstring( ll_idx, 'CR_COL_CRITERIAL')
					ls_val_criterial = ids_trans_setup.getitemstring( ll_idx, 'CR_VALUE_CRITERIAL')												
				else
					ls_dw_criterial = ids_trans_setup.getitemstring( ll_idx, 'DR_DW_CRITERIAL')
					if not isnull(ls_dw_criterial) and ls_dw_criterial <> '' then
						ls_col_criterial = ids_trans_setup.getitemstring( ll_idx, 'CR_COL_CRITERIAL')
						ls_val_criterial = ids_trans_setup.getitemstring( ll_idx, 'CR_VALUE_CRITERIAL')								
					end if
				end if
				if isnull(ls_dw_criterial) or ls_dw_criterial ='' then
					ls_trans_id += string(ids_trans_setup.getitemnumber(ll_idx,'id')) +','
				else
					ldw_creteria =  iw_display.f_get_dw(ls_dw_criterial+'_grid')
					if isvalid(ldw_creteria) then
						ls_creterial_data = string(ldw_creteria.dynamic f_getitemany(ldw_creteria.getrow( ) , ls_col_criterial))
						lc_dwser.f_get_build_column( ldw_creteria, ls_col_criterial, ls_col_type)
						lb_ok =  lb_rule.f_is_criteria_ok( ls_creterial_data, ls_val_criterial, ls_col_type)
						if lb_ok then
							ls_trans_id += string(ids_trans_setup.getitemnumber(ll_idx,'id')) +','
						end if
					else 
						gf_messagebox('m.b_doc.f_post_tax.02','Thông báo','Datawindow cài đặt điều kiện không tìm thấy:@'+ls_dw_criterial ,'exclamation','ok',1)
						return -1
					end if				
				end if
			next							
			if ls_trans_id <> '' then
				ls_trans_id = left(ls_trans_id,len(ls_trans_id)-1)
				ids_trans_setup.setfilter( "id in (" + ls_trans_id + ')')
				ids_trans_setup.filter( )
				
				ldw_binding = iw_display.f_get_dw(vs_dw_binding)
				for ll_idx = 1 to ids_trans_setup.rowcount()
					la_value[1] = ids_trans_setup.getitemnumber(ll_idx,'cr_obj_instance_id')
					ll_find = ldw_binding.find( 'tax_id = '+string(la_value[1]) + ' AND object_ref_id = '+string(vdb_master_id) , 1, ldw_binding.rowcount( ))
					if ll_find > 0 then continue
					ll_row = ldw_binding.event e_addrow()
					ldw_binding.setitem(ll_row,'tax_id',ids_trans_setup.getitemnumber(ll_idx,'cr_obj_instance_id'))
					ldw_binding.setitem(ll_row,'object_code',ids_trans_setup.getitemstring(ll_idx,'cr_object_code'))
					ldw_binding.setitem(ll_row,'object_name',ids_trans_setup.getitemstring(ll_idx,'cr_object_name'))
					ldw_binding.setitem(ll_row,'tax_type',ids_trans_setup.getitemstring(ll_idx,'cr_object_code'))
					ldw_binding.setitem(ll_row,'uprow_yn',ids_trans_setup.getitemstring(ll_idx,'cr_uprow_yn'))
					ldw_binding.setitem(ll_row,'INCLUDE_YN',ids_trans_setup.getitemstring(ll_idx,'cr_INCLUDE_YN'))
					ldw_binding.setitem(ll_row,'tax_report_group',ids_trans_setup.getitemnumber(ll_idx,'tax_report_group'))
					ldw_binding.setitem(ll_row,'tax_report_group_code',ids_trans_setup.getitemstring(ll_idx,'tax_report_group_code'))
					if ids_currency.rowcount() > 0 then
						ldw_binding.setitem(ll_row,'trans_currency',ids_currency.getitemnumber(1,'id'))
						ldw_binding.setitem(ll_row,'uom_code',ids_currency.getitemstring(1,'code'))
						ldw_binding.setitem(ll_row,'exchange_rate',1)
					end if
//					la_value[1] = ids_trans_setup.getitemnumber(ll_idx,'cr_obj_instance_id')
					ids_tax_authority.setfilter( "object_ref_id = " + string(la_value[1]))
					ids_tax_authority.filter( )
					if ids_tax_authority.rowcount() > 0 then
						ldw_binding.setitem(ll_row,'tax_pct',ids_tax_authority.getitemnumber(1,'default_pct') )
					end if
				next
			else
				ids_trans_setup.setfilter('' )
				ids_trans_setup.filter( )					
				return 0
			end if		
		else
			ids_trans_setup.setfilter('' )
			ids_trans_setup.filter( )					
			return 0		
		end if
	end if
	
	ids_trans_setup.setfilter('' )
	ids_trans_setup.filter( )	
	return 1
end if
return 0

/*
//Hàm post thuế lên chứng từ
u_tax_authority 	lc_tax
u_trans_setup 		lc_trans_setup
u_currency 			lc_currency
t_dw_mpl 			ldw_binding
t_ds_db 				lds_trans_setup, lds_tax_authority, lds_currency
double				ldb_obj_id
string 				ls_object_name, ls_dr_dw_object, ls_cr_dw_object
long 					ll_idx, ll_row,ll_find
any 					la_value[], la_retrieve_arg[], la_null[]

lds_trans_setup = create t_ds_db
lds_tax_authority = create t_ds_db
lds_currency = create t_ds_db
lc_currency = create u_currency
la_value[1] = '=Y'
lc_currency.f_init_object_table(lds_currency, 'd_currency_grid', 'base_yn',la_value, la_null)
ls_object_name = this.classname()
ldw_binding = iw_display.f_get_dw(vs_dw_binding)
lc_trans_setup = create u_trans_setup
lc_tax = create u_tax_authority
la_value[1] = vdb_trans_hdr_id
//la_retrieve_arg[1] = mid(ls_object_name,3)
lc_trans_setup.f_init_object_table(lds_trans_setup, 'd_trans_setup_grid','object_ref_id;',la_value[],la_null[])
lds_trans_setup.setfilter("lower(dr_obj_type) ='tax_authority'")
lds_trans_setup.filter()
for ll_idx = 1 to lds_trans_setup.rowcount()
	ll_row = ldw_binding.event e_addrow()
	ldw_binding.setitem(ll_row,'tax_id',lds_trans_setup.getitemnumber(ll_idx,'dr_obj_instance_id'))
	ldw_binding.setitem(ll_row,'object_code',lds_trans_setup.getitemstring(ll_idx,'dr_object_code'))
	ldw_binding.setitem(ll_row,'object_name',lds_trans_setup.getitemstring(ll_idx,'dr_object_name'))
	ldw_binding.setitem(ll_row,'tax_type',lds_trans_setup.getitemstring(ll_idx,'dr_object_code'))
	ldw_binding.setitem(ll_row,'uprow_yn',lds_trans_setup.getitemstring(ll_idx,'dr_uprow_yn'))
	ldw_binding.setitem(ll_row,'INCLUDE_YN',lds_trans_setup.getitemstring(ll_idx,'dr_INCLUDE_YN'))
	ldw_binding.setitem(ll_row,'tax_report_group',lds_trans_setup.getitemnumber(ll_idx,'tax_report_group'))
	ldw_binding.setitem(ll_row,'tax_report_group_code',lds_trans_setup.getitemstring(ll_idx,'tax_report_group_code'))
	if lds_currency.rowcount() > 0 then
		ldw_binding.setitem(ll_row,'trans_currency',lds_currency.getitemnumber(1,'id'))
		ldw_binding.setitem(ll_row,'uom_code',lds_currency.getitemstring(1,'code'))
		ldw_binding.setitem(ll_row,'exchange_rate',1)
	end if
	la_value[1] =  lds_trans_setup.getitemnumber(ll_idx,'dr_obj_instance_id')
	lc_tax.f_init_object_table(lds_tax_authority, 'd_tax_authority_form', 'object_ref_id',la_value[],la_null[])
	if lds_tax_authority.rowcount() > 0 then
		ldw_binding.setitem(ll_row,'tax_pct',lds_tax_authority.getitemnumber(1,'default_pct') )
	end if
next
lds_trans_setup.setfilter("lower(cr_obj_type) ='tax_authority'") 
lds_trans_setup.filter()
for ll_idx = 1 to lds_trans_setup.rowcount( )
	ldb_obj_id = lds_trans_setup.getitemnumber(ll_idx,'cr_obj_instance_id')
	ll_find = ldw_binding.find( 'tax_id = '+string(ldb_obj_id), 1, ldw_binding.rowcount( ) )
	if ll_find > 0 then continue
	ll_row = ldw_binding.event e_addrow()
	ldw_binding.setitem(ll_row,'tax_id',lds_trans_setup.getitemnumber(ll_idx,'cr_obj_instance_id') )
	ldw_binding.setitem(ll_row,'object_code',lds_trans_setup.getitemstring(ll_idx,'cr_object_code') )
	ldw_binding.setitem(ll_row,'tax_type',lds_trans_setup.getitemstring(ll_idx,'cr_object_code'))
	ldw_binding.setitem(ll_row,'object_name',lds_trans_setup.getitemstring(ll_idx,'cr_object_name'))
	ldw_binding.setitem(ll_row,'uprow_yn',lds_trans_setup.getitemstring(ll_idx,'cr_uprow_yn'))
	ldw_binding.setitem(ll_row,'INCLUDE_YN',lds_trans_setup.getitemstring(ll_idx,'cr_INCLUDE_YN'))
	ldw_binding.setitem(ll_row,'tax_report_group',lds_trans_setup.getitemnumber(ll_idx,'tax_report_group'))
	ldw_binding.setitem(ll_row,'tax_report_group_code',lds_trans_setup.getitemstring(ll_idx,'tax_report_group_code'))
	if lds_currency.rowcount() > 0 then
		ldw_binding.setitem(ll_row,'trans_currency',lds_currency.getitemnumber(1,'id'))
		ldw_binding.setitem(ll_row,'uom_code',lds_currency.getitemstring(1,'code'))
		ldw_binding.setitem(ll_row,'exchange_rate',1)
	end if
	la_value[1] =  lds_trans_setup.getitemnumber(ll_idx,'cr_obj_instance_id')
	lc_tax.f_init_object_table(lds_tax_authority, 'd_tax_authority_form', 'object_ref_id',la_value[],la_null[])
	if lds_tax_authority.rowcount() > 0 then
		ldw_binding.setitem(ll_row,'tax_pct',lds_tax_authority.getitemnumber(1,'default_pct') )
	end if
next
destroy lc_trans_setup
destroy lc_tax
destroy lc_currency
destroy lds_trans_setup
destroy lds_currency
destroy lds_tax_authority
*/
//return 1
end function

public subroutine f_retrieve_dw_post_line ();
s_str_dwo					las_str_dwo[]
s_str_dwo_tabpage		las_str_dwo_tabpage[]
t_dw_mpl						ldw_post_line
int								li_idx, li_idx1


this.f_get_dwo(las_str_dwo[])
for li_idx=1 to upperbound(las_str_dwo[])
	if pos(las_str_dwo[li_idx].s_dwo_default,'d_post_line')>0 then
		ldw_post_line=iw_display.f_get_dw(las_str_dwo[li_idx].s_dwo_default)
		ldw_post_line.retrieve()
	end if
next

this.f_get_dwo_tabpage(las_str_dwo_tabpage[])
for li_idx=1 to upperbound(las_str_dwo_tabpage[])
	for li_idx1=1 to upperbound(las_str_dwo_tabpage[li_idx].str_dwo[])
		if pos(las_str_dwo_tabpage[li_idx].str_dwo[li_idx1].s_dwo_default,'d_post_line')>0 then
			ldw_post_line=iw_display.f_get_dw(las_str_dwo_tabpage[li_idx].str_dwo[li_idx1].s_dwo_default)
			ldw_post_line.retrieve()
		end if
	next
next
end subroutine

public function boolean f_check_id_exists_table (double vdb_id, string vs_table);/* ham kt id co trong table khong
	tham so dau vao 
		- vdb_id: id can kiem tra
		- vs_table: bang cam kiem tra
Tham so tra ra
tra ve true: neu id co trong bang
		false: id khong co trong bang
*/

string			ls_sql
double		ldb_id


DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;
ldb_id = 0
ls_sql = "SELECT ID FROM "+vs_table + "  WHERE id = " + string(vdb_id)
PREPARE SQLSA FROM :ls_sql ;
OPEN DYNAMIC my_cursor;
FETCH my_cursor INTO :ldb_id ;
CLOSE my_cursor;
if isnull(ldb_id) then ldb_id = 0
if ldb_id=0 then
	return false
else
	return true
end if





end function

public function double f_get_assemble_doc_id (string vs_t_ref_table, double vdb_t_doc_id);double 		ldb_doc_id

if upper(vs_t_ref_table) = 'INVENTORY_LINE' then
		// INVEN -> INVEN
	SELECT DISTINCT MAT1.F_DOC_ID into :ldb_doc_id 
	FROM DOCUMENT DOC //INVEN
		 JOIN MATCHING MAT1 ON MAT1.T_DOC_ID = DOC.ID AND MAT1.F_REF_TABLE = 'INVENTORY_LINE' //INVEN
		 JOIN DOCUMENT DOC1 ON DOC1.ID = MAT1.F_DOC_ID
	WHERE DOC.ID = :vdb_t_doc_id AND DOC1.DOC_TYPE = 'ASSEMBLE' and rownum < 2 using SQLCA;
end if
if isnull(ldb_doc_id) then ldb_doc_id = 0
if SQLCA.sqlcode = -1 then ldb_doc_id = -1
return ldb_doc_id
end function

public function double f_get_values_settle (double vdb_f_doc_id, string vs_col_matching);t_ds_db	lds_matching,lds
any		laa_data[]
long		ll_retrieve,ll_idx
double	ldb_rtn,ldb_settled

lds_matching = create t_ds_db
lds_matching.dataobject = 'ds_matching'
laa_data[1] = vdb_f_doc_id
laa_data[2] = '=SETTLE'
laa_data[3] = '=OBJECT_TRANS'
lds_matching.f_add_where( 'F_DOC_ID;MATCH_TYPE;T_REF_TABLE', laa_data[])
lds_matching.f_settransobject( SQLCA)
ll_retrieve = lds_matching.retrieve()
if ll_retrieve = 0 then return 0
for ll_idx = 1 to ll_retrieve
	ldb_settled = lds_matching.getitemnumber(ll_idx,vs_col_matching)
	if isnull(ldb_settled) then ldb_settled = 0
	ldb_rtn += ldb_settled
next
destroy lds_matching
return ldb_rtn
end function

public function integer f_update_streamvalue (t_dw_mpl vdw_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row, t_dw_mpl vdw_f_object, string vas_f_object_col[], string vas_f_object_col_sv[], t_dw_mpl vdw_t_object, string vas_t_object_col[], string vas_t_object_col_sv[], t_dw_mpl vdw_currency, string vas_cur_col[], string vas_cur_col_sv[], double vdb_trans_value, double vdb_base_value);int				li_idx,li_rtn
long			ll_t_object_row, ll_f_object_row, ll_currency_row
double		ldb_object_ref_id, ldb_qty, ldb_sv_qty, ldb_f_object, ldb_t_object, ldb_tmp_object
t_dw_mpl	ldw_master

//-- update các giá trị của dw item/lot/value--//
for li_idx = 1 to upperbound(vas_data_col)
	if pos(upper(vs_pas_col), upper(vas_update_col[li_idx])+';' ) > 0  then continue
	
	if upper(vas_data_col[li_idx])= 'QTY' then 
		ldb_qty = vdw_data.dynamic f_getitemany( vl_data_row, vas_data_col[li_idx]+'_sku')
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
		li_rtn = rds_stream.setitem( vl_update_row,vas_update_col[li_idx], vdw_data.dynamic f_getitemany( vl_data_row, vas_data_col[li_idx])  )
	end if
next

if li_rtn = -1 then
	gf_messagebox('m.b_doc.f_update_streamvalue.01','Thông báo','Lỗi setitem vào datastore rd_streamvalue: f_update_streamvalue(28)','stop','ok',1)
	return -1
end if

//-- update f_object và t_object --//
if vdw_f_object.dataobject = vdw_data.dataobject then
	ll_f_object_row = vl_data_row
else
	ldw_master = vdw_data.dynamic f_get_idw_master()
	if isvalid(ldw_master) then
		if ldw_master.dataobject = vdw_f_object.dataobject then
			ldb_object_ref_id = vdw_data.getitemnumber(vl_data_row, 'object_ref_id')
			ll_f_object_row = ldw_master.find('ID ='+string(ldb_object_ref_id), 1 , ldw_master.rowcount())
		end if
	end if
	if ll_f_object_row = 0 then ll_f_object_row = vdw_f_object.getrow()
end if

if vdw_t_object.dataobject = vdw_data.dataobject then
	ll_t_object_row = vl_data_row
else
	ldw_master = vdw_data.dynamic f_get_idw_master()
	if isvalid(ldw_master) then
		if ldw_master.dataobject = vdw_t_object.dataobject then
			ldb_object_ref_id = vdw_data.getitemnumber(vl_data_row, 'object_ref_id')
			ll_t_object_row = ldw_master.find('ID ='+string(ldb_object_ref_id), 1 , ldw_master.rowcount())
		end if
	end if
	if ll_t_object_row = 0 then ll_t_object_row = vdw_t_object.getrow()
end if
for li_idx = 1 to upperbound(vas_f_object_col[])
	 ldb_f_object = vdw_f_object.dynamic f_getitemany( ll_f_object_row, vas_f_object_col[li_idx] )
	 ldb_t_object = vdw_t_object.dynamic f_getitemany( ll_t_object_row, vas_t_object_col[li_idx] )
	 if ldb_qty < 0 then //-- đảo đối tượng from/to --//
		ldb_tmp_object = ldb_f_object
		ldb_f_object = ldb_t_object
		ldb_t_object = ldb_tmp_object
	end if
	li_rtn = rds_stream.setitem( vl_update_row,vas_f_object_col_sv[li_idx], ldb_f_object)
	li_rtn = rds_stream.setitem( vl_update_row,vas_t_object_col_sv[li_idx], ldb_t_object)
next
if li_rtn = -1 then
	gf_messagebox('m.b_doc.f_update_streamvalue.02','Thông báo','Lỗi setitem vào datastore rd_streamvalue: f_update_streamvalue(70)','stop','ok',1)
	return -1
end if

//-- update currency --//
if isvalid(vdw_currency) then
	if vdw_currency.dataobject = vdw_data.dataobject then
		ll_currency_row = vl_data_row
	else
	//	ldw_master = vdw_data.f_get_idw_master()
	//	if isvalid(ldw_master) then
	//		if ldw_master.dataobject = vdw_currency.dataobject then
	//			ldb_object_ref_id = vdw_data.getitemnumber(vl_data_row, 'object_ref_id')
	//			ll_currency_row = ldw_master.find('ID ='+string(ldb_object_ref_id), 1 , ldw_master.rowcount())
	//		end if
	//	end if
		if ll_currency_row = 0 then ll_currency_row = vdw_currency.getrow()
	end if
	for li_idx = 1 to upperbound(vas_cur_col[])
		li_rtn = rds_stream.setitem( vl_update_row,vas_cur_col_sv[li_idx], vdw_currency.dynamic f_getitemany( ll_currency_row, vas_cur_col[li_idx] ))
	next
	if li_rtn = -1 then
		gf_messagebox('m.b_doc.f_update_streamvalue.03','Thông báo','Lỗi setitem vào datastore rd_streamvalue: f_update_streamvalue(91)','stop','ok',1)
		return -1
	end if
end if
return li_rtn
end function

public function integer f_booking_item_lot (ref t_transaction rt_transaction, ref t_ds_db rds_stream, t_dw_mpl vdw_item, long vl_item_row, ref powerobject rpo_item_lot, any vaa_data[], date vd_trans_date, string vs_lot_yn, string vs_serial_yn, string vs_qty_yn, string vs_value_yn, string vs_post_type, double vdb_item_value, double vdb_item_base_value, double vdb_item_qty, t_dw_mpl vdw_f_object, t_dw_mpl vdw_t_object, string vas_col_item[], string vas_col_item_lot[], string vas_col_item_value[], string vas_col_f_object[], string vas_col_t_object[], double vdb_trans_uom, string vas_col_f_object_sv[], string vas_col_t_object_sv[], string vas_col_item_sv[], string vas_col_item_lot_sv[], string vas_col_item_value_sv[], string vs_item_ref_table, string vs_samecol_string, string vs_doc_type, double vdb_dwitem_id, double vdb_doc_id, t_dw_mpl vdw_currency, string vas_col_currency[], string vas_col_currency_sv[]);/**************************************************************************************
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
int							li_rtn, li_cnt, li_idx
long						ll_row, ll_insertrow_sv
string						ls_original_filter, ls_sv_qty_yn, ls_sv_value_yn, ls_manage_qty_yn, ls_manage_value_yn
string						ls_base_curr_code, ls_base_curr_name
double					ldb_value_lot_seri,ldb_base_value_lot_seri, ldb_qty_lot_seri,  ldb_base_curr, ldb_invoiced_qty, ldb_invoicing_qty
double					ldb_round_id_trans, ldb_round_id_base
b_obj_instantiate		lobj_ins


if lobj_ins.f_get_item_managed_qty_value(vaa_data[1] ,ls_manage_qty_yn, ls_manage_value_yn) = -1 then return -1
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
	this.ic_unit_instance.f_get_base_cur(ldb_base_curr, ls_base_curr_code, ls_base_curr_name)	
	ldb_round_id_base = this.ic_unit_instance.f_get_round_id( ldb_round_id_base, 0, 'bc')		
	ldb_round_id_trans = vdw_currency.dynamic f_getitemany( vdw_currency.getrow(), vas_col_currency[1] )
	ldb_round_id_trans = this.ic_unit_instance.f_get_round_id( ldb_round_id_trans, 0, 'amount')	
end if

if vs_lot_yn = 'Y' then rpo_item_lot.dynamic setsort("lot_no a")
if vs_serial_yn = 'Y'  then rpo_item_lot.dynamic setsort("serial_no a")
rpo_item_lot.dynamic sort()

for ll_row = 1 to rpo_item_lot.dynamic rowcount( )				
	vaa_data[7] = rpo_item_lot.dynamic getitemstring( ll_row, vas_col_item_lot[2])
	vaa_data[8] = rpo_item_lot.dynamic getitemstring( ll_row, vas_col_item_lot[3])
	if isnull(vaa_data[7]) and  vs_lot_yn = 'Y'  then
		gf_messagebox('m.b_doc.f_booking_item.04','Thông báo','Mã hàng sau chưa nhập số lô:@'+this.f_get_code(vaa_data[1] ),'stop','ok',1)		
		rollback using rt_transaction;
		destroy rds_stream
		return -1					
	end if
	if isnull(vaa_data[8]) and  vs_serial_yn = 'Y'  then
		gf_messagebox('m.b_doc.f_booking_item.05','Thông báo','Mã hàng sau chưa nhập số seri:@'+this.f_get_code(vaa_data[1] ),'stop','ok',1)		
		rollback using rt_transaction;
		destroy rds_stream
		return -1						
	end if			
	//-- tính giá trị của một lot/seri --//
	if ls_sv_value_yn = 'Y' then
		ldb_qty_lot_seri = rpo_item_lot.dynamic getitemnumber( ll_row, vas_col_item_lot[1])
		if isnull(ldb_qty_lot_seri) or ldb_qty_lot_seri = 0 then continue
		ldb_invoiced_qty = rpo_item_lot.dynamic getitemnumber( ll_row, 'invoiced_qty')
		if isnull(ldb_invoiced_qty) then  ldb_invoiced_qty = 0 
		if ldb_invoiced_qty > 0 then ldb_qty_lot_seri -= ldb_invoiced_qty
		if ll_row < rpo_item_lot.dynamic rowcount( ) and vdb_item_qty > 0	then
			if ldb_qty_lot_seri < vdb_item_qty then
				ldb_value_lot_seri = vdb_item_value/vdb_item_qty * ldb_qty_lot_seri
				ldb_value_lot_seri = this.ic_unit_instance.f_round( rt_transaction, ldb_round_id_trans,ldb_value_lot_seri)
				
				ldb_base_value_lot_seri =  vdb_item_base_value/vdb_item_qty * ldb_qty_lot_seri
				ldb_base_value_lot_seri = this.ic_unit_instance.f_round( rt_transaction, ldb_round_id_base,ldb_base_value_lot_seri)
				
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
		rpo_item_lot.dynamic setitem(ll_row, 'invoiced_qty', ldb_invoiced_qty)
	end if
	
	//-- insert row --//
	this.f_insert_item_balance_row( rt_transaction, rpo_item_lot, ll_row, vdw_f_object, vdw_t_object, vd_trans_date, vs_post_type, vas_col_item_lot[], vas_col_item_value[], vas_col_f_object[], vas_col_t_object[], vaa_data[],  ls_sv_qty_yn, ls_sv_value_yn, vdb_trans_uom, vas_col_item_lot[1], ldb_base_value_lot_seri, vs_qty_yn, vs_value_yn)

	//-- update steamvalue --//
	if upper(vs_post_type) = 'POST' then
			
		if  ls_sv_qty_yn = 'Y' and  ls_sv_value_yn = 'Y' then //-- cập nhật stream_value GT --//
			ll_insertrow_sv = rds_stream.event e_addrow( )	
			li_rtn = this.f_update_streamvalue( vdw_item, rds_stream, vas_col_item_value[], vas_col_item_value_sv[], vs_samecol_string, vl_item_row, ll_insertrow_sv,vdw_f_object, vas_col_f_object[], vas_col_f_object_sv[],vdw_t_object, vas_col_t_object[], vas_col_t_object_sv[], vdw_currency,vas_col_currency[], vas_col_currency_sv[], ldb_value_lot_seri, ldb_base_value_lot_seri)
			
			if li_rtn = 1 then
				 li_rtn = this.f_update_streamvalue(rpo_item_lot, rds_stream, vas_col_item_lot[], vas_col_item_lot_sv[], '', ll_row,ll_insertrow_sv)
			end if			
			if li_rtn = -1 then
				destroy rds_stream
				rollback using rt_transaction;
				return -1
			end if					
			
			li_rtn = this.f_postinsert_streamvalue(rds_stream , ll_insertrow_sv,ls_sv_value_yn,  ls_sv_qty_yn, vs_item_ref_table, vdb_dwitem_ID, vs_doc_type, vdb_doc_id, vd_trans_date)
			if li_rtn = -1 then 
				destroy rds_stream
				rollback using rt_transaction;
				return -1
			end if			
		elseif ls_sv_qty_yn = 'Y' and  ls_sv_value_yn = 'N' and vs_value_yn = 'N' then  //-- cập nhật stream_value ST --//
			ll_insertrow_sv = rds_stream.event e_addrow( )	
			li_rtn = this.f_update_streamvalue(vdw_item, rds_stream, vas_col_item[], vas_col_item_sv[], vs_samecol_string, vl_item_row,ll_insertrow_sv, vdw_f_object, vas_col_f_object[], vas_col_f_object_sv[], vdw_t_object, vas_col_t_object[], vas_col_t_object_sv[])				
			
			if li_rtn = 1 then
				 li_rtn = this.f_update_streamvalue(rpo_item_lot, rds_stream, vas_col_item_lot[], vas_col_item_lot_sv[], '', ll_row,ll_insertrow_sv)
			end if			
			if li_rtn = -1 then
				destroy rds_stream
				rollback using rt_transaction;
				return -1
			end if					
			
			li_rtn = this.f_postinsert_streamvalue(rds_stream , ll_insertrow_sv,ls_sv_value_yn,  ls_sv_qty_yn, vs_item_ref_table, vdb_dwitem_ID, vs_doc_type, vdb_doc_id, vd_trans_date)
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
if rpo_item_lot.dynamic update(true,false) = -1 then
	gf_messagebox('m.b_doc.f_booking_item.06','Thông báo','Không cập nhật được số lượng theo đơn vị tồn kho:@' +rt_transaction.sqlerrtext ,'exclamation','ok',1)
	destroy rds_stream
	rollback using rt_transaction;
	return -1
end if	
rpo_item_lot.dynamic resetupdate()		

return 1
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
c_string				lc_string


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
li_rtn = this.ic_unit_instance.f_get_data_4_conversion_unit( vdb_trans_uom, vdb_item_id, ldb_qty, ldba_convert_data[])

//-- cập nhật chênh lệch quy đổi --//
if li_rtn = 0 then
	rpo_item.dynamic setitem(vdb_row,vs_qty_column+'_sku', ldb_qty)
	rdb_qty_sku = ldb_qty
elseif li_rtn = 1 then

	ldb_round_diff = ic_unit_instance.f_get_round_diff( vdb_item_id)
	if isnull(ldb_round_diff) then ldb_round_diff =0
	if upper(vs_in_out) = 'OUT' then
		ldb_qty_sku = ldba_convert_data[1] + ldba_convert_data[2] - ldb_round_diff
	else
		ldb_qty_sku = ldba_convert_data[1] + ldba_convert_data[2] + ldb_round_diff
	end if
	rdb_qty_sku = this.ic_unit_instance.f_round( rt_transaction,  ldba_convert_data[4], ldb_qty_sku)
	
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
	return -1
end if

return 1
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

u_item				lu_item
c_unit_instance	lc_unit_instance

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
lu_item = create u_item
ldb_round_diff = lu_item.f_get_round_diff( vdb_item_id)
if isnull(ldb_round_diff) then ldb_round_diff =0
destroy lu_item	

//-- tính số lượng quy đổi đơn vị --//
li_rtn = lc_unit_instance.f_get_data_4_conversion_unit( vdb_trans_uom, vdb_item_id, ldb_qty, ldba_convert_data[])
ldb_round_diff =  ldba_convert_data[1] + ldba_convert_data[2] + ldb_round_diff - ldb_qty_sku
rdb_round_diff = ldb_round_diff

return 1
end function

public function integer f_update_streamvalue (powerobject vpo_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row);int				li_idx,li_rtn
long			ll_t_object_row, ll_f_object_row
double		ldb_object_ref_id, ldb_qty
t_dw_mpl	ldw_master

//-- update các giá trị của dw item/lot/value--//
for li_idx = 1 to upperbound(vas_data_col)
	if pos(upper(vs_pas_col), upper(vas_update_col[li_idx])+';' ) > 0  then continue
	
	if upper(vas_data_col[li_idx])= 'QTY' then 
		ldb_qty = vpo_data.dynamic f_getitemany( vl_data_row, vas_data_col[li_idx]+'_sku') 
		if ldb_qty < 0 then ldb_qty = -ldb_qty
		li_rtn = rds_stream.setitem( vl_update_row,vas_update_col[li_idx], ldb_qty )
	else
		li_rtn = rds_stream.setitem( vl_update_row,vas_update_col[li_idx], vpo_data.dynamic f_getitemany( vl_data_row, vas_data_col[li_idx])  )
	end if
next

if li_rtn = -1 then
	gf_messagebox('m;b_doc.f_update_streamvalue.01','Thông báo','Lỗi setitem vào datastore rd_streamvalue: f_update_streamvalue(l11)','stop','ok',1)
	return -1
end if

return li_rtn
end function

public function integer f_create_exrate_post_line (t_ds_db vds_f_post_line, double vdb_trans_amount, double vdb_base_amount, double vdb_settle_curr, double vdb_settle_exrate, date vd_trans_date, double vdb_doc_id, double vdb_object_ref_id, string vs_object_ref_table, s_str_post_account vstr_post_account, ref t_ds_db rds_post_line);/**********************************************************
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
			//-- xác định số tiền chênh lệch : ldb_exrate_diff_amt--//
			if upper(vstr_post_account.s_dr_object_type) = 'VENDOR' OR upper(vstr_post_account.s_dr_object_type) = 'CUSTOMER' OR upper(vstr_post_account.s_dr_object_type) = 'STAFF' THEN
				ldb_exrate_diff_amt =  ldb_settle_trans_amt * vdb_settle_exrate - ldb_f_base_amt  // dr - cr //
			else
				ldb_exrate_diff_amt =  ldb_f_base_amt - ldb_settle_trans_amt * vdb_settle_exrate // cr - dr //
			end if					
			if ldb_exrate_diff_amt = 0 then continue
			if this.f_insert_exrate_post_line( rds_post_line,vstr_post_account, ldb_exrate_diff_amt, vdb_settle_curr, vdb_settle_exrate, vd_trans_date, vdb_doc_id, vdb_object_ref_id, vs_object_ref_table) = -1 then 				
				return -1		
			end if
		else
			gf_messagebox('m.b_doc.f_create_exrate_post_line.02','Thống báo','Ngoại tệ khác nhau không thể cấn trừ công nợ','exclamation','ok',1)
			return -1
		end if

	NEXT


return 1
end function

public function string f_get_previous_doc_status (string vs_doc_type, string vs_doc_status);long			ll_row_found
string 		ls_status
t_ds_db		lds_doc_status

//-- tìm trạng thái trước khi cấn trừ --//
lds_doc_status = create t_ds_db 
lds_doc_status.dataobject = 'ds_doc_status'
lds_doc_status.f_settransobject( sqlca)
if lds_doc_status.retrieve(vs_doc_type) > 0 then
	ll_row_found = lds_doc_status.find( "match(doc_status, '"+vs_doc_status +"')", 1, lds_doc_status.rowcount())
	if ll_row_found > 1 then
		ls_status = lds_doc_status.getitemstring(ll_row_found -1 , 'doc_status')
	elseif ll_row_found = 1 then 
		ls_status = lds_doc_status.getitemstring(ll_row_found , 'doc_status')
	else
		gf_messagebox('m.b_doc.f_get_previous_doc_status.01','Thông báo','Chưa cài đặt trạng thái trước khi cấn trừ của loại chứng từ:@'+vs_doc_type,'stop','ok',1)
		setnull(ls_status);
	end if
else
	gf_messagebox('m.b_doc.f_get_previous_doc_status.02','Thông báo','Chưa cài đặt trạng thái của loại chứng từ:@'+vs_doc_type,'stop','ok',1)
	setnull(ls_status)
end if
destroy lds_doc_status
return ls_status
end function

public function integer f_create_post_line (double vdb_doc_id, double vdb_branch_id, double vdb_trans_hdr_id, ref t_ds_db rds_post_line);/**********************************************************
KHÔNG CÒN DÙNG
Chức năng: Tạo định khoản cho chứng từ theo cài đặt ngiệp vụ ghi sổ
--------------------------------------------------------------------------------------------
Tham số: vdb_doc_id : ID của chứng từ cần ghi sổ
---------------------------------------------------------------------
Return: 	 1 -> Thành công
			-1 -> Lỗi
==============================TrevietSoftware.com*/
t_ds_db				lds_trans_setup
t_dw_mpl				ldw_get_amount, ldw_dr_object, ldw_cr_object
c_string				lc_string
long					ll_row, ll_cnt, ll_rtn
string					ls_dw_get_mount,ls_dw_get_mount_tmp, ls_col_get_base_amount, ls_col_get_amount, ls_original_filter, ls_source_filter
string					ls_posting_type[], ls_posting_type_tmp, ls_findString, ls_empty[]
double				ldb_currency_id
decimal				ldc_exrate

//-- Kiểm tra tham số truyền vào --//
if vdb_doc_id = 0 or isnull(vdb_doc_id) then 
	gf_messagebox('m.b_doc.f_create_post_line.01','Thông báo','Tham số ID chứng từ không hợp lệ !','exclamation','ok',1)
	return -1
end if
if vdb_trans_hdr_id = 0 or isnull(vdb_trans_hdr_id) then
	gf_messagebox('m.b_doc.f_create_post_line.03','Thông báo','Chứng từ chưa có giao dịch','exclamation','ok',1)
	return -1	
end if
//-- Lấy tỷ giá và loại tiền của chứng từ --//
this.f_get_currency_exrate_of_doc( ldb_currency_id, ldc_exrate)
if isnull(ldb_currency_id) or ldb_currency_id = 0 then 
	gf_messagebox('m.b_doc.f_create_post_line.04','Thông báo','Chứng từ chưa có loại tiền','exclamation','ok',1)
	return -1
end if
if isnull(ldc_exrate) or ldc_exrate = 0 then
	gf_messagebox('m.b_doc.f_create_post_line.05','Thông báo','Chứng từ chưa có tỷ giá','exclamation','ok',1)
	return -1
end if
//-- Lấy toàn bộ thông tin cài đặt nghiệp vụ của chứng từ --//
lds_trans_setup = create t_ds_db
if this.f_get_trans_setup(vdb_trans_hdr_id, lds_trans_setup) < 1 then
	gf_messagebox('m.b_doc.f_create_post_line.06','Thông báo','Giao dịch ghi sổ chưa cài đặt','exclamation','ok',1)
	destroy lds_trans_setup
	return -1		
end if

//-- Duyệt theo dw_get_amount --//
ll_row = 1
DO
	ls_posting_type_tmp = lds_trans_setup.getitemstring( ll_row, 'posting_type')
	if isnull(ls_posting_type_tmp) then  ls_posting_type_tmp= 'NULL' 
	ls_dw_get_mount_tmp = lds_trans_setup.getitemstring( ll_row, 'dw_get_amount')
	if isnull(ls_dw_get_mount_tmp) or ls_dw_get_mount_tmp=''  then
		gf_messagebox('m.b_doc.f_create_post_line.07','Thông báo','Giao dịch ghi sổ chưa cài đặt dw giá trị','exclamation','ok',1)
		return -1		
	end if	
	if upperbound(ls_posting_type) = 0 then ls_posting_type[1] = ls_posting_type_tmp
	if ls_dw_get_mount_tmp <> ls_dw_get_mount or ls_posting_type_tmp <> ls_posting_type[upperbound(ls_posting_type)] then //-- thay đổi dw chứa giá trị ghi sổ --//
		//-- insert dw post_line --//
		if ls_dw_get_mount <> '' and  ls_dw_get_mount_tmp <> ls_dw_get_mount then
			//-- bỏ filter --//
			ls_original_filter = ldw_get_amount.describe( "datawindow.table.filter")
			if ls_original_filter <> '?' then
				this.f_doc_filter( ldw_get_amount.dataobject, true)				
			end if	
	
			ll_rtn = this.f_insert_post_line( rds_post_line, vdb_doc_id,vdb_branch_id,lds_trans_setup, ldw_get_amount, ls_posting_type[], ldb_currency_id,ldc_exrate)
			//--** trả lại filter gốc --//
			if ls_original_filter <> '?' then
			ls_source_filter=lc_string.f_globalreplace(ls_original_filter,'~~','')
				ldw_get_amount.setfilter(ls_source_filter)
				ldw_get_amount.filter( )
			end if			
			if ll_rtn = -1 then return -1
			ls_posting_type[] = ls_empty[]
			ls_posting_type[1] = ls_posting_type_tmp
			ls_dw_get_mount = ''
			ll_cnt=0
		end if
		//-- lưu posting type --//
		ll_cnt++
		if  ll_cnt > 1 then	ls_posting_type[ll_cnt]= ls_posting_type_tmp
		//-- Lấy dw chứa giá trị ghi sổ --//
		if ls_dw_get_mount_tmp <> ls_dw_get_mount then
			ls_dw_get_mount = ls_dw_get_mount_tmp	
			ldw_get_amount = this.iw_display.dynamic f_get_dw(ls_dw_get_mount + '_grid'	)
			if isnull(ldw_get_amount) or not isvalid(ldw_get_amount) then
				gf_messagebox('m.b_doc.f_create_post_line.08','Thông báo','Không tìm dw giá trị trên chứng từ:@'+ls_dw_get_mount,'exclamation','ok',1)
				return -1				
			end if			
		end if

	end if
	if upperbound(ls_posting_type) > 0 then
		if ls_posting_type[upperbound(ls_posting_type)] = 'NULL' then
			ls_findString = "dw_get_amount <> '"+ls_dw_get_mount_tmp+"' OR not isnull(posting_type)"
		else
			ls_findString = "dw_get_amount <> '"+ls_dw_get_mount_tmp+"' OR posting_type <>'"+ ls_posting_type[upperbound(ls_posting_type)] +"'"
		end if
	else
		ls_findString = "dw_get_amount <> '"+ls_dw_get_mount_tmp+"'"
	end if		
	ll_row = lds_trans_setup.find(ls_findString ,ll_row+1, lds_trans_setup.rowcount()+1)
LOOP while ll_row > 0
//-- insert dw post_line sau cùng hoặc duy nhất--//
if ls_dw_get_mount <> '' and  ls_dw_get_mount_tmp = ls_dw_get_mount then
	//-- bỏ filter --//
	ls_original_filter = ldw_get_amount.describe( "datawindow.table.filter")
	if ls_original_filter <> '?' then
		this.f_doc_filter( ldw_get_amount.dataobject, true)	
	end if		

	ll_rtn = this.f_insert_post_line( rds_post_line, vdb_doc_id,vdb_branch_id,lds_trans_setup, ldw_get_amount, ls_posting_type[], ldb_currency_id,ldc_exrate) 
	//--** trả lại filter gốc --//
	if ls_original_filter <> '?' then
	ls_source_filter=lc_string.f_globalreplace(ls_original_filter,'~~','')
		ldw_get_amount.setfilter(ls_source_filter)
		ldw_get_amount.filter( )	
	end if	
	if ll_rtn = -1 then return -1
end if

return 1
end function

public function integer f_insert_post_line (ref t_ds_db rds_post_line, double vdb_doc_id, double vdb_branch_id, t_ds_db vds_trans_setup, t_dw_mpl vdw_get_amount, string vs_posting_type[], double vdb_currency_id, decimal vdc_exrate);//-- Không c òn dùng : 20Feb18--//


long				ll_row, ll_insert_row, ll_rtn_row, ll_rtn
int					li_row, li_idx
string				ls_col_get_amount, ls_col_get_base_amount, ls_not_accept_col, ls_posting_type, ls_posting_type_error, ls_dr_obj_type, ls_cr_obj_type, las_col_item[]
string				ls_base_curr_code, ls_base_curr_name, ls_object_ref_table, ls_base_currcode, ls_base_currname, ls_f_post_line_str
double			ldb_amount, ldb_base_amount, ldb_dr_object_id, ldb_cr_object_id, ldb_round_diff, ldb_act_qty_sku, ldb_trans_uom, ldb_base_settled_amt
double			ldb_base_curr, ldb_object_ref_id, ldb_base_curr_id, ldb_basecurr_round_id,  ldb_post_line_id[], ldb_invoice_exrate,ldb_round_id,ldb_exrate_amt
double 			ldb_dr_subacct_id, ldb_cr_subacct_id
boolean			lb_ok, lb_found, lb_update_sku
date				ld_trans_date
any				laa_data[] , laa_data_postline[]

s_str_post_account		lstr_post_account
u_item						lu_item
t_transaction				lt_transaction
c_string						lc_string
t_ds_db						lds_matching, lds_f_post_line
c_unit_instance				lc_unit

ldb_exrate_amt = vdc_exrate
if isnull(vdb_currency_id) or vdb_currency_id = 0 then return -1
if isnull(ldb_exrate_amt) or ldb_exrate_amt = 0 then return -1
if this.f_get_trans_date( ld_trans_date) = -1 then return -1
this.iw_display.f_get_transaction(lt_transaction )

lds_matching = create t_ds_db
lds_matching.dataobject = 'ds_matching'
lds_matching.f_settransobject( lt_transaction)
lds_f_post_line = create t_ds_db
lds_f_post_line.dataobject = 'd_post_line_grid'
lds_f_post_line.f_settransobject(lt_transaction)
 
FOR li_idx = 1 to upperbound(vs_posting_type[])
	ls_posting_type_error += vs_posting_type[li_idx]+'; '
	lb_update_sku = false
	FOR ll_row = 1 to vdw_get_amount.rowcount()
		lstr_post_account.s_trans_text =''
		//-- Lấy tài khoản và tiểu mục ghi sổ --//		
		ll_rtn_row = this.f_get_Trans_setup_account( vds_trans_setup, vs_posting_type[li_idx], vdw_get_amount, ll_row, lstr_post_account)
		if ll_rtn_row = -1 then return -1		
		if ll_rtn_row = 0 then continue
		if ll_rtn_row > 0 then lb_found = true
		
		//-- Lấy số tiền định khoản --//
		ls_col_get_amount =  vds_trans_setup.getitemstring( ll_rtn_row, 'col_get_amount')
		if isnull(ls_col_get_amount) or ls_col_get_amount = '' then
			gf_messagebox('m.b_doc.f_insert_post_line.01','Thông báo','Giao dịch ghi sổ chưa cài đặt cột giá trị','exclamation','ok',1)
			return -1	
		end if		
		ls_col_get_base_amount =  vds_trans_setup.getitemstring( ll_rtn_row, 'col_get_base_amount')
		if isnull(ls_col_get_base_amount) or ls_col_get_base_amount='' then
			gf_messagebox('m.b_doc.f_insert_post_line.02','Thông báo','Giao dịch ghi sổ chưa cài đặt cột giá trị quy đổi','exclamation','ok',1)
			return -1		
		end if				
		
		ldb_base_amount = vdw_get_amount.getitemnumber(ll_row, ls_col_get_base_amount)
		if isnull(ldb_base_amount) then ldb_base_amount = 0
				
		if lower(lstr_post_account.s_cr_object_type) = 'item' then // and lower(ls_col_get_base_amount) = 'cogs' 
			lb_update_sku = true
			//-- set số lượng SKU --//
			lu_item = create u_item
			this.f_get_item_columns_of_streamvalue( vdw_get_amount.dataobject, las_col_item[])
			if upperbound(las_col_item[]) > 0 then				
				ldb_trans_uom = vdw_get_amount.getitemnumber(ll_row,las_col_item[4])				
				ll_rtn = this.f_set_Qty_sku(lt_transaction, vdw_get_amount, ll_row,lstr_post_account.db_cr_object_id,ldb_trans_uom, las_col_item[3], 'OUT', ldb_act_qty_sku, ldb_round_diff)
				if ll_rtn = -1 then
					vdw_get_amount.resetupdate()
					destroy lu_item
					return -1
				end if
				lu_item.f_update_round_diff( lstr_post_account.db_cr_object_id, ldb_round_diff, lt_transaction)
			end if
			
			//-- set cogs vào hóa đơn bán --//		
			if lower(ls_col_get_base_amount) = 'cogs' then
				if this.ib_doc_return_yn then
					ldb_base_amount = this.f_get_return_unit_cogs(  vdw_get_amount.getitemnumber(ll_row, 'id'))
					if ldb_base_amount = -1 then
						vdw_get_amount.resetupdate()
						destroy lu_item	
						return -1
					end if
				else
					ldb_base_amount = lu_item.f_get_moving_avg(lstr_post_account.db_cr_object_id)
					this.ic_unit_instance.f_get_base_cur( ldb_base_curr, ls_base_curr_code, ls_base_curr_name)
					ldb_round_id = lc_unit.f_get_round_id( ldb_base_curr, 0, 'amount')
					if ldb_act_qty_sku < 0 then ldb_act_qty_sku = -ldb_act_qty_sku //-- kiểm kê thiếu hàng : ghi âm sku--//
					ldb_base_amount = this.ic_unit_instance.f_round(vdw_get_amount, ldb_round_id, ldb_base_amount * ldb_act_qty_sku)
				end if
				destroy lu_item			
				vdw_get_amount.setitem(ll_row,ls_col_get_base_amount, ldb_base_amount)
			end if
		elseif lower(lstr_post_account.s_dr_object_type) = 'item' and lower(lstr_post_account.s_cr_object_type) <> 'tax_authority'  and lower(lstr_post_account.s_cr_object_type) <> 'charge_object' then
			//-- set số lượng SKU --//
			lu_item = create u_item
			this.f_get_item_columns_of_streamvalue( vdw_get_amount.dataobject, las_col_item[])
			if upperbound(las_col_item[]) > 0 then
				lb_update_sku = true
				ldb_trans_uom = vdw_get_amount.getitemnumber(ll_row,las_col_item[4])
				ll_rtn = this.f_set_Qty_sku(lt_transaction, vdw_get_amount, ll_row,lstr_post_account.db_dr_object_id,ldb_trans_uom, las_col_item[3], 'OUT', ldb_act_qty_sku, ldb_round_diff)
				if ll_rtn = -1 then
					vdw_get_amount.resetupdate()
					destroy lu_item	
					return -1
				end if
				lu_item.f_update_round_diff( lstr_post_account.db_dr_object_id, ldb_round_diff, lt_transaction)
			end if
			destroy lu_item	
		end if
		
		if vs_posting_type[li_idx] <> 'cogs' and ldb_base_amount = 0 and ls_col_get_base_amount <> 'cogs' then continue 
		if ls_col_get_base_amount = 'cogs' and lower(lstr_post_account.s_dr_object_type) <> 'item' and lower(lstr_post_account.s_cr_object_type) <> 'item' then continue
		if (ldb_base_amount = 0 or isnull(ldb_base_amount)) then
			if lower(lstr_post_account.s_dr_object_type) <> 'item' then
				if lower(lstr_post_account.s_cr_object_type) <> 'item' then
					if ll_row = vdw_get_amount.rowcount() then exit
					continue
				end if
			end if
		end if
		
		
		if lower(ls_col_get_base_amount) = 'cogs' then
			ldb_amount = ldb_base_amount
		else
			ldb_amount = vdw_get_amount.getitemnumber(ll_row, ls_col_get_amount)
		end if
		
		//-- Xứ lý ngoại tệ tiền thuế và chênh lệch tỷ giá --//
		
		ic_unit_instance.f_get_base_cur( ldb_base_curr_id,ls_base_currcode, ls_base_currname)
		if  ldb_base_curr_id <> vdb_currency_id then 
			//-- xử lý thuế: quy đổi tiền thuế ngược lại ngoại tệ --//
			if vs_posting_type[li_idx] = 'tax' then
				ldb_round_id = ic_unit_instance.f_get_round_id( vdb_currency_id, 0, 'amount') 
				ldb_exrate_amt = ic_unit_instance.f_round( lt_transaction, ldb_round_id,  ldb_base_amount/ldb_amount)
//				ldb_amount = ic_unit_instance.f_round( lt_transaction, ldb_basecurr_round_id,  ldb_base_amount/ldb_exrate_amt)								
			end if	
			//-- xử lý base_amount khi có chênh lẹch tỷ giá --//
			if upper(vdw_get_amount.describe( "DataWindow.Table.UpdateTable")) = 'PAYMENT_LINE' then
				laa_data[1] = vdw_get_amount.getitemnumber(ll_row, 'id')
				laa_data[2] = 'PAYMENT_LINE'
				lds_matching.f_add_where( 't_ref_id;t_ref_table', laa_data[])				
				if lds_matching.retrieve( ) > 0 then
					ldb_post_line_id[] = lds_matching.object.f_ref_id.Primary.Current
					
					lc_string.f_arraytostring( ldb_post_line_id[], ';', ls_f_post_line_str)
					laa_data_postline[1] = '('+ls_f_post_line_str+')'					
					lds_f_post_line.f_add_where( 'ID', laa_data_postline[])
					if lds_f_post_line.retrieve( ) > 0 then						
						ldb_object_ref_id = vdw_get_amount.getitemnumber(ll_row, 'id')
						ls_object_ref_table =  upper(vdw_get_amount.describe( "DataWindow.Table.UpdateTable"))	
						if this.f_create_exrate_post_line(lds_f_post_line, ldb_amount,ldb_base_amount, vdb_currency_id,ldb_exrate_amt, ld_trans_date, vdb_doc_id, ldb_object_ref_id, ls_object_ref_table, lstr_post_account, rds_post_line) = -1 then
							rollback using lt_transaction;
							destroy lu_item	
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
		rds_post_line.setitem(ll_insert_row,'id', this.f_create_id( ) )
		rds_post_line.setitem(ll_insert_row,'branch_id', vdb_branch_id )
		rds_post_line.setitem(ll_insert_row,'dr_object_type', upper(ls_dr_obj_type))
		rds_post_line.setitem(ll_insert_row,'dr_object_id', lstr_post_account.db_dr_object_id)
		rds_post_line.setitem(ll_insert_row,'trans_text', lstr_post_account.s_trans_text )
		rds_post_line.setitem(ll_insert_row,'post_type_text', lstr_post_account.s_post_type_text )
		rds_post_line.setitem(ll_insert_row,'dr_account_id', lstr_post_account.db_dr_account)
		rds_post_line.setitem(ll_insert_row,'dr_subaccount', lstr_post_account.db_dr_subaccount)
		rds_post_line.setitem(ll_insert_row,'cr_object_type', upper(ls_cr_obj_type))
		rds_post_line.setitem(ll_insert_row,'cr_object_id', lstr_post_account.db_cr_object_id)
		rds_post_line.setitem(ll_insert_row,'cr_account_id', lstr_post_account.db_cr_account)
		rds_post_line.setitem(ll_insert_row,'cr_subaccount', lstr_post_account.db_cr_subaccount)
		ls_posting_type = vs_posting_type[li_idx] 
		if ls_posting_type= 'NULL' then  setnull(ls_posting_type)		
		rds_post_line.setitem(ll_insert_row,'post_type', ls_posting_type)
		rds_post_line.setitem(ll_insert_row,'doc_id', vdb_doc_id)		
		rds_post_line.setitem(ll_insert_row,'object_ref_id',  vdw_get_amount.getitemnumber(ll_row, 'id'))
		rds_post_line.setitem(ll_insert_row,'object_ref_table', upper(vdw_get_amount.describe( "DataWindow.Table.UpdateTable")))
		rds_post_line.setitem(ll_insert_row,'trans_amt', ldb_amount)
		rds_post_line.setitem(ll_insert_row,'base_amt',  ldb_base_amount)
		rds_post_line.setitem(ll_insert_row,'TRANS_CUR_ID', vdb_currency_id)
		rds_post_line.setitem(ll_insert_row,'EX_RATE', ldb_exrate_amt)
		rds_post_line.setitem(ll_insert_row,'trans_date', ld_trans_date)

		if not isnull(ls_not_accept_col) and ls_not_accept_col<>'' then
			rds_post_line.setitem(ll_insert_row,'not_accept',  vdw_get_amount.getitemstring(ll_row,ls_not_accept_col))
		end if
	NEXT

	//-- update cot sku ,cogs--//
	if  vdw_get_amount.rowcount()> 0 and lb_update_sku then
		if vdw_get_amount.update(true,false) = -1 then
			gf_messagebox('m.b_doc.f_insert_post_line.03','Thông báo','Không cập nhật được số lượng theo đơn vị tồn kho:@' +lt_transaction.sqlerrtext ,'exclamation','ok',1)
			rollback using lt_transaction;
			destroy lu_item	
			return -1
		end if	
		vdw_get_amount.resetupdate()	
	end if
NEXT

destroy lds_matching

if not lb_found and  vdw_get_amount.rowcount()> 0 then
	gf_messagebox('m.b_doc.f_insert_post_line.04','Thông báo','Không tìm thấy tài khoản cài đặt của nghiệp vụ:@' + ls_posting_type_error ,'exclamation','ok',1)
	destroy lu_item	
	return -1
end if
return 1
end function

public function integer f_add_link_item_catch (double vdb_item_id, double vdb_qty, string ls_item_id, string ls_item_code, string ls_item_name, t_dw_mpl rdw_object);double			ladb_lnk_item[], ladb_lnk_spec[], ladb_lnk_qty[], ldb_qty, ldb_stock_id, ldb_item_id
double			ladb_lnk_item1[], ladb_lnk_spec1[], ladb_lnk_qty1[],ldb_qty1, ldb_count
int					li_cnt, li_idx, li_idx1, li_cnt1,li_idx2
string				ls_findstr, ls_obj_code, ls_obj_name, ls_uom_code,ls_findstr1
long				ll_row,ll_row1,ll_row2
u_item			lu_item
t_transaction	lt_transaction

//-- add link item --//
lu_item = create u_item
this.iw_display.f_get_transaction( lt_transaction)
li_cnt = lu_item.f_get_link_item( vdb_item_id,  ladb_lnk_item[], ladb_lnk_spec[], ladb_lnk_qty[], lt_transaction)

if li_cnt > 0 then
	FOR li_idx = 1 to li_cnt
		if isnull(ladb_lnk_spec[li_idx]) or ladb_lnk_spec[li_idx] = 0 then
			ls_findStr = ls_item_id + " = "+string(ladb_lnk_item[li_idx])
		else
			ls_findStr = ls_item_id +" = "+string(ladb_lnk_item[li_idx]) + " AND SPEC_ID ="+string(ladb_lnk_spec[li_idx])
		end if
		ll_row = rdw_object.find( ls_findStr, 1, rdw_object.rowcount( ) )	
		if ll_row > 0 then
			ldb_count = 0
			FOR li_idx1 = 1 to rdw_object.rowcount( )
				ldb_item_id = rdw_object.getitemnumber( li_idx1, 'item_id')
				li_cnt1 = lu_item.f_get_link_item( ldb_item_id,  ladb_lnk_item1[], ladb_lnk_spec1[], ladb_lnk_qty1[], lt_transaction)
				if li_cnt1 > 0 then
					FOR li_idx2 = 1 to li_cnt1
						if ladb_lnk_item1[li_idx2] = ladb_lnk_item[li_idx] then
							if isnull(ladb_lnk_spec1[li_idx2]) or ladb_lnk_spec1[li_idx2] = 0 then
								ls_findStr1 = ls_item_id + " = "+string(ladb_lnk_item1[li_idx2])
							else
								ls_findStr1 = ls_item_id +" = "+string(ladb_lnk_item1[li_idx2]) + " AND SPEC_ID ="+string(ladb_lnk_spec1[li_idx2])
							end if
							ll_row1 = rdw_object.find( ls_findStr1, 1, rdw_object.rowcount( ) )	
							if ll_row1 > 0 then
								ls_findStr1 = ls_item_id +" = "+string(ldb_item_id)
								ll_row2 = rdw_object.find( ls_findStr1, 1, rdw_object.rowcount( ) )	
								ldb_qty1 = rdw_object.getitemnumber( ll_row2, 'qty')
								if isnull(ldb_qty1) then ldb_qty1 = 0
								ldb_count += ldb_qty1 * ladb_lnk_qty1[li_idx2]
							end if
						end if
					NEXT
				end if
			NEXT
			rdw_object.setitem( ll_row, 'qty', ldb_count)
			rdw_object.setitem( ll_row, 'act_qty', ldb_count)
		else
			if ladb_lnk_item[li_idx] <> 0 then
				select obj.code,obj.name, ite.stock_uom, uom.code
					into :ls_obj_code,:ls_obj_name, :ldb_stock_id, :ls_uom_code
				  from item ite 
						join uom on uom.id = ite.stock_uom
						join object obj on ite.object_ref_id=obj.id
				 where obj.id= :ladb_lnk_item[li_idx] using sqlca;		
				ll_row = rdw_object.event e_addrow( )	
				rdw_object.setitem( ll_row, ls_item_id ,  ladb_lnk_item[li_idx])
				rdw_object.setitem( ll_row, ls_item_code, ls_obj_code )
				rdw_object.setitem( ll_row, ls_item_name, ls_obj_name )
				rdw_object.setitem( ll_row, 'line_text', ls_obj_name )
				rdw_object.setitem( ll_row, 'uom_code', ls_uom_code )
				rdw_object.setitem( ll_row, 'trans_uom', ldb_stock_id )
				rdw_object.setitem( ll_row, 'spec_id', ladb_lnk_spec[li_idx] )
				rdw_object.setitem( ll_row, 'qty', ladb_lnk_qty[li_idx] * vdb_qty)
				rdw_object.setitem( ll_row, 'act_qty', ladb_lnk_qty[li_idx] * vdb_qty)
			end if				
		end if
	NEXT
end if
destroy lu_item
return li_cnt
end function

public function string f_get_trans_id_4copy ();
double       		ldb_trans_id[]
string				ls_doc_type, ls_trans_group, ls_trans_id
int					li_idx, li_row
any				laa_value[]

t_ds_db			lds_trans_hdr

select trans_group into :ls_trans_group 
from trans_setup_hdr where id = :idb_trans_id using sqlca;
if sqlca.sqlcode = 0 then
	if isnull(ls_trans_group) then return ''
	lds_trans_hdr = create t_ds_db
	lds_trans_hdr.dataobject = 'd_trans_setup_hdr_grid'
	ls_doc_type=upper(mid(this.classname( ) ,3))
	laa_value[1]= ls_trans_group
	lds_trans_hdr.f_add_where('trans_group;',laa_value[])
	lds_trans_hdr.settransobject( sqlca)
	lds_trans_hdr.retrieve(ls_doc_type)
	li_row = lds_trans_hdr.rowcount()
	if li_row > 0 then
		for li_idx = 1 to li_row
			ldb_trans_id[li_idx] = lds_trans_hdr.getitemnumber(li_idx,'id')
			ls_trans_id += string(ldb_trans_id[li_idx])+','
		next
	end if
	destroy lds_trans_hdr
	return left(ls_trans_id,len(ls_trans_id) - 1)
else
	return ''
end if
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
		ldb_id = this.f_create_id( )
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

public function integer f_update_object_balance (string vs_sob, double vdb_branch_id, double vdb_object_id, string vs_object_type, double vdb_currency_id, double vdb_account_id, double vdb_subaccount, string vs_not_accept, double vdc_close_amt, double vdc_close_base_amt, ref t_transaction rt_transaction, string vs_balance_control, date vd_trans_date, date vd_max_date, ref t_ds_db rds_object_balance_after);//Hàm cập nhật bảng Object trans từ Post_line
long  				ll_idx, ll_rowinsert, ll_row_cnt, ll_rowfound
double 			ldb_trans_amt, ldb_base_amt, ldb_ex_rate, ldb_open_amt, ldb_open_base_amt, ldb_id
double			ldb_dr_amt, ldb_dr_base_amt, ldb_cr_amt, ldb_cr_base_amt, ldb_close_amt, ldb_close_base_amt
string 			ls_not_accept, ls_where_column, ls_account_code
any 				la_value[]
date				ld_balance_date
int					li_waiting_cnt, li_date_cnt, li_insert_cnt
u_account		lu_account
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
				lu_account = create u_account
				ls_account_code= lu_account.f_get_code( vdb_object_id)
				destroy lu_account
				gf_messagebox('m.b_doc.f_update_object_balance.01','Thông báo', 'Tài khoản sau không được dư bên Có vào ngày-@'+string(ld_balance_date,gs_w_date_format)+':@'+ls_account_code,'exclamation','ok',1)			
				rollback using rt_transaction;
				destroy rds_object_balance_after	
				return -1
			end if
		elseif  vs_balance_control = 'cr' then
			if ldb_close_base_amt  > 0 or ldb_close_amt > 0 then 
				lu_account = create u_account
				ls_account_code= lu_account.f_get_code( vdb_object_id)
				destroy lu_account
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
			 ldb_id = this.f_create_id( )
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

public function integer f_insert_item_balance (ref t_ds_db rds_item_balance, any vaa_arg[], date vd_balance_date, string vs_in_out, double vdb_in_out_qty, double vdb_in_out_base_value, double vdb_open_qty, double vdb_open_value, double vdb_close_qty, double vdb_close_value);
long			ll_insertrow
string			ls_tmpStr

ll_insertrow = rds_item_balance.insertrow(0)
rds_item_balance.setitem(ll_insertrow,'id', this.f_create_id( ))	

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
	lds_item_balance.setitem(ll_insertrow,'id', this.f_create_id( ))	
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

public function integer f_get_doc_info (double vdb_doc_id, ref string rs_doctype, ref date rd_bookeddate, ref string rs_status, ref string rs_doc_code);date			ld_date
long			ll_count_or,ll_count_bk

select count(booked_slip.id) into :ll_count_bk
from booked_slip join document on document.version_id = booked_slip.id
where document.id = :vdb_doc_id using SQLCA;

select count(orders.id) into :ll_count_or
from orders join document on document.version_id = orders.id
where document.id = :vdb_doc_id using SQLCA;

if ll_count_or > 0 then
	select document.document_date, document.doc_type, document.code ,document.status into :rd_bookeddate, :rs_doctype, :rs_doc_code, :rs_status
	from orders join document on document.version_id = orders.id
	where document.id = :vdb_doc_id using SQLCA;
elseif ll_count_bk > 0 then
	select booked_slip.trans_date, document.doc_type, document.code ,document.status into :rd_bookeddate, :rs_doctype, :rs_doc_code, :rs_status
	from booked_slip join document on document.version_id = booked_slip.id
	where document.id = :vdb_doc_id using SQLCA;
else
	//-- chứng từ không kết với orders hoặc booked --//
end if

if sqlca.sqlcode = -1 then
	gf_messagebox('m.b_doc.f_get_doc_booked_date.01','Thông báo','Lỗi SQL:@'+sqlca.sqlerrtext,'stop','ok',1)
	return -1
end if

return 1
end function

public function integer f_update_related_status (double vdb_doc_id, string vs_doctype, string vs_post_status, boolean vb_post, ref string rs_doc_id_updated);/********************************************************************
Chức năng: cập nhật status của các chưng từ liên quan trực tiếp.
			- khi post : trạng thái chứng từ liên quan có thể là trạng thái 1 (full) hoặc 2 (partial) 
			- Khi unpost: trạng thái chứng từ có thể là 2 (partial) hoặc là trạng thái trước đó.	
			- Khi ghi sổ chứng từ thanh toán ( phiếu thu/chi, sổ phụ ngân hàng):
				//--+ Nếu có kết với hóa đơn thì cập nhất trạng thái hóa đơn là "PAID" hoặc "PARTIAL_PAID"và chứng từ thanh toán là "SETTLED" hoặc "PARTIAL_SETTLED'--//
				+ Nếu có kết với hóa đơn thì cập nhất trạng thái hóa đơn là "PAID" hoặc "PARTIAL_PAID"và chứng từ thanh toán là "SETTLED" hoặc "PARTIAL_SETTLED' (Long 26/07/2016)
				+ Nếu không kết hóa đơn thì trạng thái của chứng từ thanh toán vẫn là "BOOKED"
			- Khi dùng chức năng cấn trừ:
				+ Cấn trừ 2 hóa đơn với nhau: cập nhật trạng thái của 2 hóa đơn thành "SETTLED" hoặc "PARTIAL_SETTLED'
				//--+ Cấn trừ 1 hóa đơn với 1 chứng từ thanh toán: cập nhật trạng thái hóa đơn thành "PAID", chứng từ thanh toán thành "SETTLED"--//
				+Cấn trừ 1 hóa đơn với 1 chứng từ thanh toán: cập nhật trạng thái hóa đơn thành "SETTLED", chứng từ thanh toán thành "SETTLED" (Long 26/07/2016)
-------------------------------------------------------------------------------------------------------------
Tham số: vdb_doc_id: Id chứng từ thay đổi status
			 vs_post_status : trang thái post của chứng từ
			 vb_post: true : nghĩa là đang post chứng từ, false nghĩa là đang unpost chứng từ
			 rs_doc_id_updated: các doc_id đã được cập nhật trạng thái
------------------------------------------------------------------------------------------------------------
return: 1 thành công
		- 1 lỗi
====================================================TrevietSoftware.com*/
int				li_rtn
long			ll_cnt, ll_row, ll_pos
double		ldb_related_doc_id, ldb_mat_qty, ldb_remain_qty, ldb_remain_amount, ldb_object_id,ldb_mat_amount
double		ldb_bal_amount_TO, ldb_bal_amount_FR, ldb_mat_amount_TO, ldb_mat_amount_FR
string			ls_doctype, ls_related_doctype, ls_f_ref_table, ls_sql , ls_where,ls_status,  ls_status_partial, ls_related_status, ls_related_status_partial
string			ls_status_list,ls_dwo_minus

t_ds_db 			lds_related_doc, lds_line, lds_related_status
c_string			lc_string
t_transaction	lt_transaction

s_str_dwo_related	lstr_data_related[]

//t_dw_mpl		ldw_main
//
//ldw_main = iw_display.f_get_dwmain( )
lds_line = create t_ds_db
lds_related_status = create t_ds_db
lds_related_status.dataobject = 'ds_related_doc_status'
lds_related_status.f_settransobject( sqlca)

this.iw_display.f_get_transaction(lt_transaction)
ls_status_list = " (~~'booked~~', ~~'invoiced~~',~~'partial_invoice~~',~~'full_issue~~', ~~'partial_issue~~', ~~'full_receive~~', ~~'partial_receive~~',~~'approved~~' ) "

ls_doctype = vs_doctype

lds_related_doc = create t_ds_db 
lds_related_doc.dataobject = 'ds_related_doc'
lds_related_doc.settransobject( lt_transaction)
ll_cnt = lds_related_doc.retrieve(vdb_doc_id )
if ll_cnt > 0 then
	
	//- Lấy object_id nếu là chứng từ ghi sổ --//
	if vs_doctype = 'BANK_VOUCHER' & 
	or vs_doctype = 'RECEIPT' & 
	or vs_doctype = 'BANK_VOUCHER_PAYMENT' & 
	or vs_doctype = 'PAYMENT' then
		select object_id into :ldb_object_id from  payment_line 
		join document on document.version_id = payment_line.object_ref_id 
		join object on object.id = payment_line.object_id and object.object_ref_table in ('VENDOR','CUSTOMER','STAFF')
		where document.id = :vdb_doc_id  using lt_transaction;
		
		if lt_transaction.sqlcode = -1 then
			gf_messagebox('m.b_doc.f_update_related_status.01','Thông báo','Không được thanh toán 2 đối tượng cùng một phiếu:@'+lt_transaction.sqlerrtext ,'stop','ok',1)
			rollback using lt_transaction;
			return -1
		end if
		
	elseif (vs_doctype = 'PUR_INVOICE' and vs_post_status = 'settled') &
	or (vs_doctype = 'SAL_INVOICE_RETURN' and vs_post_status = 'settled') then
	
		select dr_cr_object into :ldb_object_id from  booked_slip join document on document.version_id = booked_slip.id 
		where document.id = :vdb_doc_id using lt_transaction;
	end if
	if isnull(ldb_object_id) then ldb_object_id = 0 
end if

FOR ll_row = 1 to ll_cnt
	ldb_related_doc_id = lds_related_doc.getitemnumber(ll_row, 'related_doc_id')
	ls_f_ref_table = lds_related_doc.getitemstring(ll_row, 'f_ref_table')
	ls_related_doctype = lds_related_doc.getitemstring(ll_row, 'related_doc_type')
	
	if lds_related_status.retrieve(vs_doctype,vs_post_status, ls_related_doctype ) = 0 then continue //-- không cai đặt trạng thái liên quan thì bỏ qua--//
	
	//-- lấy str_related  --//
	if ll_row = 1 then
		li_rtn = this.f_get_data_related("u_"+lower(lds_related_status.getitemstring(1, 'related_doc_code')), lstr_data_related[])
		if li_rtn > 0 then
			if upperbound( lstr_data_related[li_rtn].s_match_minus_dwo[] )> 0 then
				if lstr_data_related[li_rtn].s_match_minus_dwo[1] <> '' then
					lds_line.dataobject =lc_string.f_globalreplace(  lstr_data_related[li_rtn].s_match_minus_dwo[1], ';', '')
					ls_dwo_minus = upper(lds_line.describe( "datawindow.table.update"))
				else
					//-- trường hợp match 2 bảng và có 2 dwo minus --//
				end if
			end if
		end if
	end if
	
	//----------------------------------------------------------------------------//
	//-- trường hợp thanh toán: phải cập nhật trạng thái chứng từ TO --//
	//---------------------------------------------------------------------------//
	if (vs_doctype = 'BANK_VOUCHER' and (vb_post or (vs_post_status =  'settled' and not vb_post)))  & 
	or (vs_doctype = 'RECEIPT' and (vb_post or (vs_post_status =  'settled' and not vb_post))) & 
	or (vs_doctype = 'BANK_VOUCHER_PAYMENT' and (vb_post or (vs_post_status =  'settled' and not vb_post))) & 
	or (vs_doctype = 'PAYMENT' and (vb_post or (vs_post_status =  'settled' and not vb_post))) &
	or (vs_doctype = 'PUR_INVOICE' and vs_post_status = 'settled') &
	or (vs_doctype = 'SAL_INVOICE_RETURN' and vs_post_status = 'settled') then
		//-------------------------------------//
		//--Tính toán amount đã match --//
		//------------------------------------//

		//-- Lấy tổng công nợ của chứng từ liên quan (FROM) --//
		SELECT SUM(NVL(DR_AMOUNT,0))+ SUM(NVL(CR_AMOUNT,0)) INTO :ldb_bal_amount_FR
		FROM OBJECT_TRANS 
		WHERE DOC_REF_ID = :ldb_related_doc_id AND OBJECT_ID = :ldb_object_id USING lt_transaction;			
		if isnull(ldb_bal_amount_FR) then ldb_bal_amount_FR = 0
		
		//-- Lấy tổng công nợ của chứng từ cấn trừ (TO) --//
		SELECT SUM(NVL(DR_AMOUNT,0))+ SUM(NVL(CR_AMOUNT,0)) INTO :ldb_bal_amount_TO
		FROM OBJECT_TRANS 
		WHERE DOC_REF_ID = :vdb_doc_id AND OBJECT_ID = :ldb_object_id USING lt_transaction;	
		if isnull(ldb_bal_amount_TO) then ldb_bal_amount_TO = 0
		
		//-- Lấy tổng đã matched của chứng từ liên quan (FROM)--//
		if ls_related_doctype = 'BANK_VOUCHER_PAYMENT' or ls_related_doctype = 'PAYMENT'  then
			//-- amount matched khi cấn trừ --//
			SELECT SUM(NVL(TRANS_VALUE,0)) INTO :ldb_mat_amount_FR
			FROM MATCHING 
			JOIN document on document.id = matching.t_doc_id and document.status in ('booked','settled','partial_settled','paid','partial_paid')
			WHERE F_DOC_ID = :ldb_related_doc_id USING lt_transaction;	
			if isnull(ldb_mat_amount_FR) then ldb_mat_amount_FR = 0
			//-- amount matched khi thanh toán bình thường --//
			SELECT SUM(NVL(TRANS_VALUE,0)) INTO :ldb_mat_amount_TO
			FROM MATCHING 
			JOIN document on document.id = matching.f_doc_id and document.status in ('booked','settled','partial_settled','paid','partial_paid')
			WHERE T_DOC_ID = :ldb_related_doc_id USING lt_transaction;	
			if isnull(ldb_mat_amount_TO) then ldb_mat_amount_TO = 0
			ldb_mat_amount_FR = ldb_mat_amount_FR + ldb_mat_amount_TO
			ldb_mat_amount_TO = 0
		else 
			SELECT SUM(NVL(TRANS_VALUE,0)) INTO :ldb_mat_amount_FR
			FROM MATCHING 
			JOIN document on document.id = matching.t_doc_id and document.status in ('booked','settled','partial_settled','paid','partial_paid') //thêm status
			WHERE F_DOC_ID = :ldb_related_doc_id USING lt_transaction;				
			if isnull(ldb_mat_amount_FR) then ldb_mat_amount_FR = 0
		end if
		
		
		//-- Lấy tổng đã matched của chứng từ cấn trừ (TO) --//
		if ls_doctype = 'PUR_INVOICE' or ls_related_doctype = 'SAL_INVOICE_RETURN'  then
			//-- amount matched khi cấn trừ --//
			SELECT SUM(NVL(TRANS_VALUE,0)) INTO :ldb_mat_amount_TO
			FROM MATCHING 
			JOIN document on document.id = matching.f_doc_id and document.status in ('booked','settled','partial_settled','paid','partial_paid')
			WHERE T_DOC_ID = :vdb_doc_id USING lt_transaction;		
			if isnull(ldb_mat_amount_TO) then ldb_mat_amount_TO = 0
			
			//-- amount matched khi thanh toán bình thường --//
			SELECT SUM(NVL(TRANS_VALUE,0)) INTO :ldb_mat_amount_FR
			FROM MATCHING 
			JOIN document on document.id = matching.t_doc_id and document.status in ('booked','settled','partial_settled','paid','partial_paid')
			WHERE F_DOC_ID = :vdb_doc_id USING lt_transaction;			
			
			if isnull(ldb_mat_amount_FR) then ldb_mat_amount_FR = 0
			ldb_mat_amount_TO = ldb_mat_amount_FR + ldb_mat_amount_TO		
			ldb_mat_amount_FR = 0
		else
			SELECT SUM(NVL(TRANS_VALUE,0)) INTO :ldb_mat_amount_TO
			FROM MATCHING 
			JOIN document on document.id = matching.f_doc_id and document.status in ('booked','settled','partial_settled','paid','partial_paid')
			WHERE T_DOC_ID = :vdb_doc_id USING lt_transaction;			
			if isnull(ldb_mat_amount_TO) then ldb_mat_amount_TO = 0
		end if
		//--------------------------------//
		//-- Lấy trạng thái phù hợp --//
		//-------------------------------//
		if vb_post then		//-- trường hợp post --//								
			/* //-- cập nhật trạng thái chứng từ TO --//
			if ldb_bal_amount_TO > ldb_mat_amount_TO then  //-- partial --//		
				if ls_doctype = 'BANK_VOUCHER' or ls_doctype = 'RECEIPT' or ls_doctype = 'PAYMENT' or ls_doctype = 'BANK_VOUCHER_PAYMENT' then
					ls_status = 'partial_settled'
				else
					ls_status = 'partial_paid'	//-- chứng tứ TO là invoice --//						
				end if
			else //-- full --//												
				if ls_doctype = 'BANK_VOUCHER' or ls_doctype = 'RECEIPT' or ls_doctype = 'PAYMENT' or ls_doctype = 'BANK_VOUCHER_PAYMENT' then
					ls_status = 'settled'
				else
					ls_status = 'paid' 	//-- chứng tứ TO là invoice --//
				end if
			end if 
			Long đóng ngày 26/07/2016, xem xét dùng đoạn này hay không*/
			
			//-- cập nhật trạng thái chứng từ TO --//
			if ldb_bal_amount_TO > ldb_mat_amount_TO then  //-- partial --//		
				if ls_doctype = 'BANK_VOUCHER' or ls_doctype = 'RECEIPT' or ls_doctype = 'PAYMENT' or ls_doctype = 'BANK_VOUCHER_PAYMENT' then
					if vs_post_status = 'settled' then
						ls_status = 'partial_settled'
					else
						ls_status = 'partial_paid'
					end if
				else
					ls_status = 'partial_paid'	//-- chứng tứ TO là invoice --//						
				end if
			else //-- full --//												
				if ls_doctype = 'BANK_VOUCHER' or ls_doctype = 'RECEIPT' or ls_doctype = 'PAYMENT' or ls_doctype = 'BANK_VOUCHER_PAYMENT' then
					if vs_post_status = 'settled' then
						ls_status = 'settled'
					else
						ls_status = 'paid'
					end if
				else
					ls_status = 'paid' 	//-- chứng tứ TO là invoice --//
				end if
			end if
			
			//-- cập nhật trạng thái chứng từ FROM --//
			if ldb_bal_amount_FR > ldb_mat_amount_FR then //-- partial --//				
				ls_related_status = lds_related_status.getitemstring(1, 'related_partial_status')
			else //-- full --//
				ls_related_status = lds_related_status.getitemstring(1, 'related_full_status')
			end if					

		else //-- trường hơp unpost --//
			//-- cập nhật trạng thái chứng từ TO --//
			if ldb_bal_amount_TO > ldb_mat_amount_TO then  //-- partial match--//		
				if ls_doctype = 'BANK_VOUCHER' or ls_doctype = 'RECEIPT' or ls_doctype = 'PAYMENT' or ls_doctype = 'BANK_VOUCHER_PAYMENT' then
					if vs_post_status = 'settled' then
						ls_status = 'partial_settled'
					else
						ls_status = 'partial_paid'
					end if
				else
					ls_status = 'partial_paid'	//-- chứng tứ TO là invoice --//						
				end if				
			else //-- chứng từ chưa matched --//
				//-- tìm trạng thái trước khi cấn trừ --//
				ls_status = this.f_get_previous_doc_status( ls_doctype, vs_post_status)
				if isnull(ls_status) then
					rollback using lt_transaction;
					return -1
				end if				
			end if	
	
			//-- cập nhật trạng thái chứng từ FROM --//
			if ldb_bal_amount_FR > ldb_mat_amount_FR then //-- partial --//				
				ls_related_status = lds_related_status.getitemstring(1, 'related_partial_status')						
			else //-- chưa match --//
				//-- tìm trạng thái trước khi cấn trừ 
				SELECT status INTO :ls_related_status FROM document WHERE id = :ldb_related_doc_id USING lt_transaction;
				if left(ls_related_status, 7) = 'partial' then ls_related_status = mid(ls_related_status, 9)
				ls_related_status = this.f_get_previous_doc_status( ls_related_doctype, ls_related_status)
				if isnull(ls_related_status) then
					rollback using lt_transaction;
					return -1
				end if				
			end if								
		end if		
		//-- update related document (t_doc_id) --//
		UPDATE DOCUMENT SET STATUS = :ls_status WHERE ID = :vdb_doc_id USING lt_transaction;		
		   //--------------------------------------------------------------------------------------------//
	else //-- trường hợp kết copy chứng từ khác: không cập nhật trạng thái chứng từ TO --//
		  //-------------------------------------------------------------------------------------------//
		
		lds_line.dataobject = 'ds_related_remain_value'		
		lds_line.f_getcurrentsql( ls_sql , ls_where)
		if pos(ls_f_ref_table,'POST_LINE') > 0 then
			ls_sql = ''
			ls_sql = 'SELECT line.id,' &
									+ 'm.qty mat_qty,' &
									+ 'm.trans_value mat_amount,' &
									+ '0 ori_qty,' &
									+ 'line.trans_amt ori_amount,' &
									+ '0 remain_qty,' &
									+ 'NVL (line.trans_amt, 0) - NVL (m.trans_value, 0) remain_amount FROM '
			
			ls_where = ' '+ls_f_ref_table + '  line join document on document.id = line.doc_id ' &
													 +" left join  ( select match.f_ref_id,  sum(match.qty) qty, sum(nvl(match.trans_value,0)) trans_value from matching match " &
													 +" join document doc on doc.id = match.t_doc_id and doc.status in "+ ls_status_list &
													 +" group by match.f_ref_id) m on line.id = m.f_ref_id " &
													 +" where document.id = " + string(ldb_related_doc_id) 
		else
			if ls_dwo_minus <> '' then
				ls_where = ' '+ls_f_ref_table + '  line join document on document.version_id = line.object_ref_id ' &
														 +" left join  ( select match.f_ref_id,  sum(match.qty) qty, sum(nvl(match.trans_value,0)) trans_value from matching match " &
														 +" join document doc on doc.id = match.t_doc_id and doc.status in "+ ls_status_list &
														 + " where match.T_REF_TABLE <> ~~'"+ls_dwo_minus+"~~'"&
														 +" group by match.f_ref_id) m on line.id = m.f_ref_id " &
														 +" where document.id = " + string(ldb_related_doc_id) 
			else
				ls_where = ' '+ls_f_ref_table + '  line join document on document.version_id = line.object_ref_id ' &
														 +" left join  ( select match.f_ref_id,  sum(match.qty) qty, sum(nvl(match.trans_value,0)) trans_value from matching match " &
														 +" join document doc on doc.id = match.t_doc_id and doc.status in "+ ls_status_list &
														 +" group by match.f_ref_id) m on line.id = m.f_ref_id " &
														 +" where document.id = " + string(ldb_related_doc_id) 
			end if
		end if
		ll_pos = pos(ls_sql, 'FROM')
		ls_sql = left(ls_sql, ll_pos + 4)
		ls_sql = ls_sql + ls_where
		
		ls_where = lds_line.modify( "Datawindow.Table.Select= '" + ls_sql +"'")
		if ls_where <> '' then
			rollback using lt_transaction;
			gf_messagebox('m.b_doc.f_update_related_status.01','Thông báo','Lỗi MODIFY DW line 177','stop','ok',1)
			return -1					
		end if
		lds_line.f_settransobject( lt_transaction)
		if lds_line.retrieve( ) > 0 then
			ldb_remain_qty = double(lds_line.Describe("Evaluate('Sum(remain_qty)', 0)"))
			ldb_mat_qty = double(lds_line.Describe("Evaluate('Sum(mat_qty)', 0)"))
			ldb_remain_amount = double(lds_line.Describe("Evaluate('Sum(remain_amount)', 0)")) 
			ldb_mat_amount = double(lds_line.Describe("Evaluate('Sum(mat_amount)', 0)"))
		end if			
		//-- lấy trạng thái phù hợp --//
		if vb_post then
			if ldb_remain_qty > 0 and ldb_mat_qty >  0 then //-- match 1 phần --//
				ls_related_status = lds_related_status.getitemstring(1, 'related_partial_status')
			else //-- match hoàn toàn --//
				ls_related_status = lds_related_status.getitemstring(1, 'related_full_status')
			end if
		else //-- trường hợp unpost --//
			if (ldb_mat_qty > 0 and ldb_remain_qty > 0) or (ldb_remain_amount > 0 and ldb_mat_amount> 0 ) then //-- match 1 phần --//
				ls_related_status = lds_related_status.getitemstring(1, 'related_partial_status')
			else //-- chưa match hoàn toàn --//
				//-- tìm trạng thái trước khi cấn trừ 
				SELECT status INTO :ls_related_status FROM document WHERE id = :ldb_related_doc_id USING lt_transaction;
				if left(ls_related_status, 7) = 'partial' then ls_related_status = mid(ls_related_status, 9)
				ls_related_status = this.f_get_previous_doc_status( ls_related_doctype, ls_related_status)				
				if isnull(ls_related_status) then
					rollback using lt_transaction;
					return -1
				end if
			end if			
		end if
	end if
		
	//-- update related document (f_doc_id) --//
	if pos(rs_doc_id_updated, string(ldb_related_doc_id)+';') = 0 then
		//--kiểm tra tránh trường hợp 1 chứng từ cập nhật trạng thái 2 lần--//
		UPDATE DOCUMENT SET STATUS = :ls_related_status WHERE ID = :ldb_related_doc_id USING lt_transaction;	
		if lt_transaction.sqlcode = 0 then rs_doc_id_updated += string(ldb_related_doc_id)+';'
	end if
	//-- trước khi gọi truy hồi thì lấy lại trạng thái cài đặt( trạng thái full)--//
	ls_related_status = lds_related_status.getitemstring(1, 'related_full_status')
	//-- gọi truy hồi --//
	if this.f_update_related_status( ldb_related_doc_id, ls_related_doctype, ls_related_status,  vb_post,rs_doc_id_updated) = -1 then 
		return -1
	end if
NEXT

destroy lds_line
destroy lds_related_doc

return 1
end function

public function double f_get_values_matched_from (string vs_dwo_matched_f, string vs_col_matched_f, double vdb_f_ref_id, double vdb_doc_id);/*************************************
Lấy giá trị đã kết của f_ref_id. Trường hợp làm đơn
mua hàng cho đơn bán hàng thì lấy số lượng đã kết 
xuất của đơn bán hàng
*************************************/

t_ds_db		lds_matched_f
double		ldb_values,ldb_matched_values
long			ll_find,ll_retrieve

lds_matched_f = create t_ds_db
lds_matched_f.dataobject = vs_dwo_matched_f
lds_matched_f.f_settransobject( it_transaction )
ll_retrieve = lds_matched_f.retrieve(vdb_doc_id )
if ll_retrieve <= 0 then
	destroy lds_matched_f
	return 0
end if
Do
	ll_find = lds_matched_f.find( "ID = " + string(vdb_f_ref_id), ll_find + 1, lds_matched_f.rowcount( ) + 1)
	if ll_find > 0 then
		ldb_matched_values = lds_matched_f.f_getitemany( ll_find, vs_col_matched_f)
		if isnull(ldb_matched_values) then ldb_matched_values = 0
		ldb_values += ldb_matched_values
	end if
Loop While ll_find > 0
destroy lds_matched_f
return ldb_values
end function

public function integer f_get_values_matching_and_return (double vdb_f_ref_id, string vs_ref_table_return, ref double rdb_values_matching, ref double rdb_values_rtn, string vs_col_matching, double vdb_doc_id, string vs_t_ref_table, string vs_ref_table_minus);/**********************************************************
Chức năng: lấy giá trị đã match và giá trị return
--------------------------------------------------------------
Tham số:
----------------
Return: 0 (Chưa có trong bảng match)
		   1 (Đã có match)
=====================================================*/
t_transaction	lt_transaction
t_ds_db			lds_matching
c_string			lc_string
string				ls_t_ref_table,las_table_return[],ls_f_ref_table,ls_status
long				ll_rowcount, ll_row
any				laa_data[],laa_empty[]
int					li_idx
double			ldb_matching_value,ldb_settle_value,ldb_f_ref_id,ldb_t_doc_id

lds_matching = create t_ds_db
lds_matching.dataobject = 'ds_matching'
lds_matching.f_settransobject( it_transaction)

laa_data[1] = vdb_f_ref_id
lds_matching.f_add_where( 'f_ref_id', laa_data)
ll_rowcount = lds_matching.retrieve( )
laa_data = laa_empty
if ll_rowcount = 0 and this.ids_matching.rowcount( ) = 0 and vs_ref_table_return = '' then return 0
if right(trim(vs_ref_table_minus),1) <>';' then vs_ref_table_minus = upper(trim(vs_ref_table_minus) +';')
if ll_rowcount > 0 and vs_ref_table_return <> '' then //trường hợp nhập kho trả hàng trực tiếp từ phiếu xuất kho
	if right(trim(vs_ref_table_return),1) <>';' then vs_ref_table_return = upper(trim(vs_ref_table_return) +';')
	for ll_row = 1 to ll_rowcount
		ls_t_ref_table = lds_matching.getitemstring(ll_row , 't_ref_table')
		ldb_matching_value = lds_matching.getitemnumber( ll_row, vs_col_matching)
		if isnull(ldb_matching_value) then ldb_matching_value = 0
		if pos(upper(vs_ref_table_return), upper(ls_t_ref_table+';')) > 0  then //số lượng trả hàng
			rdb_values_rtn += ldb_matching_value
		else //số lượng đã kết dưới bảng matching 
			if pos(upper(vs_ref_table_minus), upper(ls_t_ref_table+';')) = 0 or trim(ls_t_ref_table) = ''  then // loại những ref_table không phải là đã match
				rdb_values_matching += ldb_matching_value
			end if
		end if
	next
elseif ll_rowcount > 0 and vs_ref_table_return = '' and this.ids_matching.rowcount( ) = 0 then	//vs_t_ref_table
		for ll_row = 1 to ll_rowcount
			ls_t_ref_table = lds_matching.getitemstring(ll_row , 't_ref_table')
			if upper(vs_t_ref_table) <> upper(ls_t_ref_table) then continue
			ldb_matching_value = lds_matching.getitemnumber( ll_row, vs_col_matching)
			if isnull(ldb_matching_value) then ldb_matching_value = 0
			if pos(upper(vs_ref_table_minus), upper(ls_t_ref_table+';')) = 0  then // loại những ref_table không phải là đã match
				rdb_values_matching += ldb_matching_value
			end if
		next
elseif ll_rowcount = 0 then // chưa kết lần nào
end if

lds_matching.dataobject = 'ds_matching'
lds_matching.f_settransobject( it_transaction)
laa_data[1] = vdb_f_ref_id
lds_matching.f_add_where( 't_ref_id', laa_data)
ll_rowcount = lds_matching.retrieve( )
laa_data = laa_empty
if ll_rowcount > 0 and vs_ref_table_return <> '' then // trường hợp trả hàng kết qua đề xuất trả
	lc_string.f_stringtoarray( vs_ref_table_return, ';', las_table_return[])
	ldb_f_ref_id = lds_matching.getitemnumber( ll_rowcount, 'f_ref_id')
	lds_matching.dataobject = 'ds_matching'
	lds_matching.f_settransobject( it_transaction)
	laa_data[1] = ldb_f_ref_id
	laa_data[2] = '<>'+string(vdb_doc_id)
	lds_matching.f_add_where( 'f_ref_id;t_doc_id', laa_data)
	ll_rowcount = lds_matching.retrieve( )
	laa_data = laa_empty
	if ll_rowcount > 0 then
		ldb_t_doc_id = lds_matching.getitemnumber(ll_rowcount , 't_ref_id')
		Select document.status into :ls_status
		From document
		Where document.id = :ldb_t_doc_id using it_transaction;
		lds_matching.setfilter( "f_ref_table = '"+upper(las_table_return[1])+"' and t_ref_table  = '"+upper(las_table_return[1])+"'")
		lds_matching.filter( )
		for ll_row = 1 to lds_matching.rowcount( )
//			ls_t_ref_table = lds_matching.getitemstring(ll_row , 't_ref_table')
//			ls_f_ref_table = lds_matching.getitemstring(ll_row , 'f_ref_table')
			ldb_matching_value = lds_matching.getitemnumber( ll_row, vs_col_matching)
			if isnull(ldb_matching_value) then ldb_matching_value = 0
//			if ls_f_ref_table = upper(las_table_return[1]) and ls_t_ref_table = upper(las_table_return[1]) then
				rdb_values_rtn += ldb_matching_value
//			else
//				rdb_values_matching += ldb_matching_value
//			end if
		next
	end if
end if

destroy lds_matching

if this.ids_matching.rowcount( ) > 0 then
	ll_row = ids_matching.find( "f_ref_id = "+string(vdb_f_ref_id), 1, ids_matching.rowcount( ))
	if ll_row > 0 then
		ldb_matching_value = ids_matching.getitemnumber( ll_row, vs_col_matching)
		if isnull(ldb_matching_value) then ldb_matching_value = 0
		rdb_values_matching += ldb_matching_value	
		if IsNumber(ids_matching.describe(vs_col_matching + "_settle" + ".Visible")) then
			ldb_settle_value = ids_matching.getitemnumber( ll_row, vs_col_matching + "_settle")
			if isnull(ldb_settle_value) then ldb_settle_value = 0
			rdb_values_matching += ldb_settle_value
		end if
	end if
end if

return 1

end function

public function integer f_get_remain_and_matched_value (t_dw_mpl vdw_f_matching, string vs_dwo_match_to, string vas_dwo_return[], string vs_f_match_column, string vs_match_column, ref double rdb_total_remain, ref double rdb_total_matched, long vl_row, double vdb_doc_id, string vs_dwo_matched_f, string vs_col_matched_f, string vas_dwo_minus[]);/**********************************************************
Chức năng: lấy giá trị còn lại chưa match của chứng từ FROM
-----------------------------------------------------------------------
Tham số:
----------------
Return: 0 (Chưa có trong bảng match)
		   1 (Đã có match)
=====================================================*/

int					li_idx, li_rtn,li_retrieve
string				ls_table_return, ls_f_table,ls_t_ref_table,ls_table_minus
double			ldb_f_ref_id,ldb_t_ref_id
double			ldb_values_matching,ldb_doc_values,ldb_values_return,ldb_values_matched_f
any				laa_data[]
t_ds_db			lds_temp, lds_matching


ldb_f_ref_id = vdw_f_matching.getitemnumber( vl_row, 'ID')
laa_data[1] = ldb_f_ref_id
laa_data[2] = upper(vdw_f_matching.describe("Datawindow.table.update"))
lds_matching = create t_ds_db
lds_matching.dataobject = 'ds_matching'
lds_matching.f_settransobject( it_transaction )
lds_matching.f_add_where( 'f_ref_id;f_ref_table', laa_data[])
li_retrieve = lds_matching.retrieve( )
if li_retrieve = 0 and upperbound(vas_dwo_return) = 0 then 
	destroy lds_temp
	destroy lds_matching
	return 0
end if
lds_temp = create t_ds_db
for li_idx = 1 to upperbound(vas_dwo_return)
	lds_temp.dataobject = vas_dwo_return[li_idx]
	ls_table_return += lds_temp.describe("Datawindow.table.update") +';'	
next
for li_idx = 1 to upperbound(vas_dwo_minus)
	lds_temp.dataobject = vas_dwo_minus[li_idx]
	ls_table_minus += lds_temp.describe("Datawindow.table.update") +';'	
next

lds_temp.dataobject = vs_dwo_match_to
ls_t_ref_table = lds_temp.describe("Datawindow.table.update")

ldb_doc_values = vdw_f_matching.getitemnumber( vl_row, vs_f_match_column)
if isnull(ldb_doc_values) then ldb_doc_values = 0

li_rtn = this.f_get_values_matching_and_return(ldb_f_ref_id, ls_table_return, ldb_values_matching, ldb_values_return,vs_match_column,vdb_doc_id,ls_t_ref_table,ls_table_minus)
if li_rtn = 0 then 
	destroy lds_temp
	destroy lds_matching
	return 0
end if
if li_retrieve = 0 and ldb_values_matching = 0 and ldb_values_return > 0 then
	rdb_total_matched = ldb_values_return
else
	rdb_total_matched = ldb_values_matching - ldb_values_return
end if
// lấy số lượng đã kết với f_ref_id //
if vs_dwo_matched_f <> '' then ldb_values_matched_f = this.f_get_values_matched_from(vs_dwo_matched_f,vs_col_matched_f, ldb_f_ref_id,vdb_doc_id)
rdb_total_matched += ldb_values_matched_f
rdb_total_remain = ldb_doc_values - rdb_total_matched

destroy lds_temp
destroy lds_matching
return 1
end function

public function integer f_get_remain_and_matched_value (t_dw_mpl vdw_handling, string vs_dwo_match_from, string vs_dwo_match_to, string vas_dwo_return[], string vs_f_match_column, string vs_match_column, ref double rdb_remain_value[], ref double rdb_matched_value[], ref double rdb_f_ref_id[], ref double rdb_total_remain, ref double rdb_total_matched, long vl_row, ref double rdb_matching, double vdb_doc_id, string vs_dwo_matched_f, string vs_col_matched_f, string vas_dwo_minus[]);/**********************************************************
Chức năng: lấy giá trị còn lại chưa match của chứng từ FROM
-----------------------------------------------------------------------
Tham số:
----------------
Return: 0 (Chưa có trong bảng match)
		   1 (Đã có match)
=====================================================*/

int					li_idx, li_rtn, li_cnt
string				ls_table_return, ls_f_table, ls_sql, ls_id,ls_from_table,ls_t_ref_table,ls_table_minus, lsa_dwo_match_from[]
double			ldb_f_ref_id,ldb_t_ref_id,ldb_values_matched_f
double			ldb_values_matching,ldb_doc_values,ldb_values_return, ldb_doc_cnt, ldb_doc_cnt_total, ldb_matching_tmp
any				laa_data[]
long				ll_rtn
t_ds_db			lds_temp, lds_matching
t_transaction	lt_transaction
c_string			lc_string


this.iw_display.f_get_transaction(lt_transaction )
lds_temp=create t_ds_db
lds_temp.dataobject = vs_dwo_match_from
ls_from_table= upper(lds_temp.describe("Datawindow.table.update"))
laa_data[1] = vdw_handling.getitemnumber( vl_row, 'ID')
laa_data[2] = '=' + upper(vdw_handling.describe("Datawindow.table.update"))
laa_data[3]= '=' + upper(ls_from_table)
lds_matching = create t_ds_db
lds_matching.dataobject = 'ds_matching'
lds_matching.f_settransobject( lt_transaction)
lds_matching.f_add_where( 't_ref_id;t_ref_table;f_ref_table', laa_data[])
ll_rtn=lds_matching.retrieve( )
if ll_rtn=0 and this.ids_matching.rowcount( ) = 0 then 
	destroy lds_matching
	return 0
end if
if upperbound(vas_dwo_return) > 0 then lds_temp = create t_ds_db
for li_idx = 1 to upperbound(vas_dwo_minus)
	lds_temp.dataobject = vas_dwo_minus[li_idx]
	ls_table_minus += lds_temp.describe("Datawindow.table.update") +';'	
next
for li_idx = 1 to upperbound(vas_dwo_return)
	lds_temp.dataobject = vas_dwo_return[li_idx]
	ls_table_return += lds_temp.describe("Datawindow.table.update") +';'	
next
lds_temp.dataobject = vs_dwo_match_to
ls_t_ref_table = lds_temp.describe("Datawindow.table.update")

if isvalid(lds_temp) then destroy lds_temp

//DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;	

ids_matching.setfilter( "t_ref_id="+string(laa_data[1]))
ids_matching.filter()
if lds_matching.rowcount( ) = 0 then
	ids_matching.rowscopy( 1 , ids_matching.rowcount() , Primary!, lds_matching, lds_matching.rowcount() + 1, Primary!)
end if
rdb_matching=0
FOR li_idx = 1 to lds_matching.rowcount()
	ldb_doc_values = 0
	ldb_values_matching = 0
	ldb_values_return = 0
	ldb_f_ref_id = lds_matching.getitemnumber( li_idx, 'f_ref_id')
	ls_f_table = lds_matching.getitemstring( li_idx, 'f_ref_table')
	li_rtn = this.f_get_values_matching_and_return(ldb_f_ref_id, ls_table_return, ldb_values_matching, ldb_values_return,vs_match_column,vdb_doc_id,ls_t_ref_table,ls_table_minus)
	if li_rtn = 0 then continue
	if ls_from_table <> ls_f_table then
		if ll_rtn>0 then
			continue
		else
			destroy lds_matching
			return 0
		end if
	end if
	
	/*
	ls_sql = "SELECT count(ID)  FROM "+ls_f_table + "  WHERE id = " + string(ldb_f_ref_id)
	PREPARE SQLSA FROM :ls_sql ;
	OPEN DYNAMIC my_cursor;
	FETCH my_cursor INTO :ldb_doc_cnt ;
	CLOSE my_cursor;
	if isnull(ldb_doc_cnt) then ldb_doc_cnt = 0
	ldb_doc_cnt_total += ldb_doc_cnt */
	ldb_doc_cnt_total = lt_transaction.f_match_doc_count( ldb_f_ref_id, ls_f_table)
	
	/*
	ls_sql = "SELECT " + vs_f_match_column+ " FROM "+ls_f_table + "  WHERE id = " + string(ldb_f_ref_id)
	PREPARE SQLSA FROM :ls_sql ;
	OPEN DYNAMIC my_cursor;
	FETCH my_cursor INTO :ldb_doc_values ;
	CLOSE my_cursor; */
	ldb_doc_values = lt_transaction.f_match_doc_value( vs_f_match_column, ldb_f_ref_id, ls_f_table)
	
//	if isnull(ldb_doc_values) then ldb_doc_values = 0

	if ldb_doc_values - (ldb_values_matching - ldb_values_return) > 0 then
		rdb_matched_value[upperbound(rdb_matched_value[])+1] = ldb_values_matching - ldb_values_return		
		rdb_remain_value[upperbound(rdb_remain_value[])+1] = ldb_doc_values - (ldb_values_matching - ldb_values_return)			
		rdb_f_ref_id[upperbound(rdb_f_ref_id[])+1] = ldb_f_ref_id
	end if
	if vs_dwo_matched_f <> '' then ldb_values_matched_f = this.f_get_values_matched_from(vs_dwo_matched_f,vs_col_matched_f, ldb_f_ref_id,vdb_doc_id)
	rdb_total_matched += (ldb_values_matching - ldb_values_return)	 + ldb_values_matched_f
	if not isnull(ldb_doc_values) then
		rdb_total_remain +=  ldb_doc_values - ((ldb_values_matching + ldb_values_matched_f) - ldb_values_return)	
	end if
	ldb_matching_tmp = lds_matching.getitemnumber(li_idx,vs_match_column)
	if isnull(ldb_matching_tmp) then ldb_matching_tmp = 0
	rdb_matching+=ldb_matching_tmp
//	if rdb_total_matched > rdb_matching then rdb_matching = rdb_total_matched
NEXT

if ldb_doc_cnt_total = 0 then return 0 // kiêm tra đúng DW matching: ldb_doc_values_total = 0 -> khác DW match --//

destroy lds_matching
return 1

end function

public function integer f_get_values_matching_and_return (double vdb_f_ref_id, string vs_ref_table_return, ref double rdb_values_matching, ref double rdb_values_rtn, string vs_col_matching, double vdb_doc_id, string vs_t_ref_table);/**********************************************************
Chức năng: lấy giá trị đã match và giá trị return
--------------------------------------------------------------
Tham số:
----------------
Return: 0 (Chưa có trong bảng match)
		   1 (Đã có match)
=====================================================*/
t_transaction	lt_transaction
t_ds_db			lds_matching
c_string			lc_string
string				ls_t_ref_table,las_table_return[],ls_f_ref_table,ls_status
long				ll_rowcount, ll_row
any				laa_data[],laa_empty[]
int					li_idx
double			ldb_matching_value,ldb_settle_value,ldb_f_ref_id,ldb_t_doc_id

lds_matching = create t_ds_db
lds_matching.dataobject = 'ds_matching'
lds_matching.f_settransobject( it_transaction)

laa_data[1] = vdb_f_ref_id
lds_matching.f_add_where( 'f_ref_id', laa_data)
ll_rowcount = lds_matching.retrieve( )
laa_data = laa_empty
if ll_rowcount = 0 and this.ids_matching.rowcount( ) = 0 and vs_ref_table_return = '' then return 0

if ll_rowcount > 0 and vs_ref_table_return <> '' then //trường hợp nhập kho trả hàng trực tiếp từ phiếu xuất kho
	if right(trim(vs_ref_table_return),1) <>';' then vs_ref_table_return = upper(trim(vs_ref_table_return) +';')
	for ll_row = 1 to ll_rowcount
		ls_t_ref_table = lds_matching.getitemstring(ll_row , 't_ref_table')
		if pos(upper(vs_ref_table_return), upper(ls_t_ref_table+';')) > 0  then //số lượng trả hàng
			ldb_matching_value = lds_matching.getitemnumber( ll_row, vs_col_matching)
			if isnull(ldb_matching_value) then ldb_matching_value = 0
			rdb_values_rtn += ldb_matching_value
		else //số lượng đã kết dưới bảng matching 
			ldb_matching_value = lds_matching.getitemnumber( ll_row, vs_col_matching)
			if isnull(ldb_matching_value) then ldb_matching_value = 0
			rdb_values_matching += ldb_matching_value
		end if
	next
elseif ll_rowcount > 0 and vs_ref_table_return = '' and this.ids_matching.rowcount( ) = 0 then	//vs_t_ref_table
		for ll_row = 1 to ll_rowcount
			ls_t_ref_table = lds_matching.getitemstring(ll_row , 't_ref_table')
			if upper(vs_t_ref_table) <> upper(ls_t_ref_table) then continue
			ldb_matching_value = lds_matching.getitemnumber( ll_row, vs_col_matching)
			if isnull(ldb_matching_value) then ldb_matching_value = 0
			rdb_values_matching += ldb_matching_value
		next
elseif ll_rowcount = 0 then // chưa kết lần nào
//	if this.ids_matching.rowcount( ) > 0 then
//		ll_row = ids_matching.find( "f_ref_id = "+string(vdb_f_ref_id), 1, ids_matching.rowcount( ))
//		if ll_row > 0 then
//			ldb_matching_value = ids_matching.getitemnumber( ll_row, vs_col_matching)
//			if isnull(ldb_matching_value) then ldb_matching_value = 0
//			rdb_values_matching += ldb_matching_value	
//			if IsNumber(ids_matching.describe(vs_col_matching + "_settle" + ".Visible")) then
//				ldb_settle_value = ids_matching.getitemnumber( ll_row, vs_col_matching + "_settle")
//				if isnull(ldb_settle_value) then ldb_settle_value = 0
//				rdb_values_matching += ldb_settle_value
//			end if
//		end if
//	end if
end if

lds_matching.dataobject = 'ds_matching'
lds_matching.f_settransobject( it_transaction)
laa_data[1] = vdb_f_ref_id
lds_matching.f_add_where( 't_ref_id', laa_data)
ll_rowcount = lds_matching.retrieve( )
laa_data = laa_empty
if ll_rowcount > 0 and vs_ref_table_return <> '' then // trường hợp trả hàng kết qua đề xuất trả
	lc_string.f_stringtoarray( vs_ref_table_return, ';', las_table_return[])
	ldb_f_ref_id = lds_matching.getitemnumber( ll_rowcount, 'f_ref_id')
	lds_matching.dataobject = 'ds_matching'
	lds_matching.f_settransobject( it_transaction)
	laa_data[1] = ldb_f_ref_id
	laa_data[2] = '<>'+string(vdb_doc_id)
	lds_matching.f_add_where( 'f_ref_id;t_doc_id', laa_data)
//	lds_matching.f_add_where( 'f_ref_id', laa_data)
	ll_rowcount = lds_matching.retrieve( )
	laa_data = laa_empty
	if ll_rowcount > 0 then
		ldb_t_doc_id = lds_matching.getitemnumber(ll_rowcount , 't_ref_id')
		Select document.status into :ls_status
		From document
		Where document.id = :ldb_t_doc_id using it_transaction;
//		ll_row = lds_matching.find( "f_ref_table = '"+upper(las_table_return[1])+"' and t_ref_table  = '"+upper(las_table_return[1])+"'", 1, ll_rowcount)
//		if ll_row = 0 then return 0
		lds_matching.setfilter( "f_ref_table = '"+upper(las_table_return[1])+"' and t_ref_table  = '"+upper(las_table_return[1])+"'")
		lds_matching.filter( )
		for ll_row = 1 to lds_matching.rowcount( )
//			ls_t_ref_table = lds_matching.getitemstring(ll_row , 't_ref_table')
//			ls_f_ref_table = lds_matching.getitemstring(ll_row , 'f_ref_table')
			ldb_matching_value = lds_matching.getitemnumber( ll_row, vs_col_matching)
			if isnull(ldb_matching_value) then ldb_matching_value = 0
//			if ls_f_ref_table = upper(las_table_return[1]) and ls_t_ref_table = upper(las_table_return[1]) then
				rdb_values_rtn += ldb_matching_value
//			else
//				rdb_values_matching += ldb_matching_value
//			end if
		next
	end if
end if

destroy lds_matching

	if this.ids_matching.rowcount( ) > 0 then
		ll_row = ids_matching.find( "f_ref_id = "+string(vdb_f_ref_id), 1, ids_matching.rowcount( ))
		if ll_row > 0 then
			ldb_matching_value = ids_matching.getitemnumber( ll_row, vs_col_matching)
			if isnull(ldb_matching_value) then ldb_matching_value = 0
			rdb_values_matching += ldb_matching_value	
			if IsNumber(ids_matching.describe(vs_col_matching + "_settle" + ".Visible")) then
				ldb_settle_value = ids_matching.getitemnumber( ll_row, vs_col_matching + "_settle")
				if isnull(ldb_settle_value) then ldb_settle_value = 0
				rdb_values_matching += ldb_settle_value
			end if
		end if
	end if

return 1

end function

public function integer f_set_dw_tax_transfer (ref t_dw_mpl rdw_ledger_transfer_line, t_dw_mpl dw_master);string				ls_acctcode, ls_acctname, ls_code, ls_name, ls_sub_code, ls_sub_name
double 			ldb_outtax_acct_id, ldb_trans_currency, ldb_id_dr_cr, ldb_sub_id, ldb_id, ldb_object_ref_id
double      		ldb_settled_base_sum, ldb_settled_sum, ldb_base_amount, ldb_amount, ldb_settled_amt,ldb_settled_base_amt
long				ll_rtn, ll_rownum, ll_row
date     			ld_trans_date

t_transaction	lt_transaction
t_ds_db		 	lds_ledger_transfer

ld_trans_date = date( dw_master.getitemdatetime(dw_master.getrow(),'trans_date'))
//ldb_trans_currency = dw_master.getitemnumber(dw_master.getrow(),'CURRENCY_ID')


select count(obj.id) 
	into :ll_rtn
from object obj,account act 
where obj.id = act.object_ref_id and act.account_type = 'SETTLE_TAX' using sqlca;	
if ll_rtn = 0 then
	gf_messagebox('m.b_doc.f_set_dw_tax_transfer.01','Thông báo','Không tìm thấy TK kết chuyển thuế','exclamation','ok',1)
	return -1		
elseif  ll_rtn > 1 then
	gf_messagebox('m.b_doc.f_set_dw_tax_transfer.02','Thông báo','Có nhiều hơn 1 tài khoản kết chuyển thuế','exclamation','ok',1)
	return -1				
end if

select obj.id, obj.code, obj.name into :ldb_outtax_acct_id, :ls_acctcode, :ls_acctname
from object obj,account act 
where obj.id = act.object_ref_id and act.account_type = 'SETTLE_TAX' using sqlca;	

lds_ledger_transfer = create t_ds_db
lds_ledger_transfer.dataobject = 'ds_tax_transfer'
lds_ledger_transfer.settransobject(SQLCA)
ld_trans_date = date( dw_master.getitemdatetime(dw_master.getrow(),'trans_date'))
ldb_trans_currency = dw_master.getitemnumber(dw_master.getrow(),'CURRENCY_ID')
ll_rtn = lds_ledger_transfer.retrieve(ld_trans_date, ldb_trans_currency, gs_sob)

if ll_rtn >0 then
	ll_row = lds_ledger_transfer.find( " ID = "+string(ldb_outtax_acct_id), 1, ll_rtn)
	if ll_row > 0 then
		ldb_settled_base_sum = lds_ledger_transfer.getitemnumber( ll_row,'close_base_amount')
		if ldb_settled_base_sum < 0 then ldb_settled_base_sum = -ldb_settled_base_sum
		ldb_settled_sum = lds_ledger_transfer.getitemnumber( ll_row,'close_trans_amount')
		if ldb_settled_sum < 0 then ldb_settled_sum = -ldb_settled_sum
	else
		gf_messagebox('m.b_doc.f_set_dw_tax_transfer.03','Thông báo','Số dư thuế đầu ra = 0','exclamation','ok',1)
		return 0
	end if
	//nếu dw đã có dữ liệu thì xóa, insert lại
	if rdw_ledger_transfer_line.f_get_ib_editing()=false then iw_display.event e_modify( )
	if rdw_ledger_transfer_line.rowcount() > 0 then rdw_ledger_transfer_line.event e_delete_all()
	for  ll_row=1 to  ll_rtn
		if ldb_settled_base_sum <= 0 then exit
		
		ldb_id_dr_cr=lds_ledger_transfer.getitemnumber( ll_row,'ID')
		if ldb_outtax_acct_id = ldb_id_dr_cr then continue 			
		
		ldb_base_amount = lds_ledger_transfer.getitemnumber( ll_row,'close_base_amount')			
		if ldb_base_amount <> 0 then
			
			ls_code=lds_ledger_transfer.getitemstring( ll_row,'code')
			ls_name=lds_ledger_transfer.getitemstring( ll_row,'name')
			ldb_amount = lds_ledger_transfer.getitemnumber( ll_row,'close_trans_amount')
			ldb_sub_id=lds_ledger_transfer.getitemnumber( ll_row,'subaccount')
			ls_sub_code=lds_ledger_transfer.getitemstring( ll_row,'object_code')
			ls_sub_name=lds_ledger_transfer.getitemstring( ll_row,'object_name')
			
			ll_rownum=rdw_ledger_transfer_line.event e_addrow( )
			ldb_id=this.f_create_id( )
			rdw_ledger_transfer_line.setitem(ll_rownum,'ID',ldb_id)
			ldb_object_ref_id=dw_master.getitemnumber(dw_master.getrow(),'ID')
			rdw_ledger_transfer_line.setitem(ll_rownum,'OBJECT_REF_ID',ldb_object_ref_id)
			if ldb_base_amount > 0 then
				if ldb_base_amount <= ldb_settled_base_sum then
					ldb_settled_amt = ldb_amount
					ldb_settled_base_amt = ldb_base_amount
					ldb_settled_sum -= ldb_amount
					ldb_settled_base_sum -= ldb_base_amount
				else
					ldb_settled_amt = ldb_settled_sum
					ldb_settled_base_amt = ldb_settled_base_sum
					ldb_settled_sum = 0 
					ldb_settled_base_sum = 0
				end if
				
				rdw_ledger_transfer_line.setitem(ll_rownum,'CR_ACCOUNT_ID',ldb_id_dr_cr)
				rdw_ledger_transfer_line.setitem(ll_rownum,'cr_account_code',ls_code)
				rdw_ledger_transfer_line.setitem(ll_rownum,'cr_account_name',ls_name)
				rdw_ledger_transfer_line.setitem(ll_rownum,'AMOUNT',ldb_settled_amt)
				rdw_ledger_transfer_line.setitem(ll_rownum,'BASE_AMOUNT',ldb_settled_base_amt)
				rdw_ledger_transfer_line.setitem(ll_rownum,'DR_ACCOUNT_ID',ldb_outtax_acct_id)
				rdw_ledger_transfer_line.setitem(ll_rownum,'dr_account_code',ls_acctcode)
				rdw_ledger_transfer_line.setitem(ll_rownum,'dr_account_name',ls_acctname)
				rdw_ledger_transfer_line.setitem(ll_rownum,'CR_SUBACCOUNT',ldb_sub_id)
				rdw_ledger_transfer_line.setitem(ll_rownum,'cr_subaccount_code',ls_sub_code)
				rdw_ledger_transfer_line.setitem(ll_rownum,'cr_subaccount_name',ls_sub_name)

			end if
			
		end if
	NEXT 
end if



if rdw_ledger_transfer_line.update(true, false) = 1 then
	commit using lt_transaction;
	rdw_ledger_transfer_line.event e_retrieve()
else
	gf_messagebox('m.b_doc.f_set_dw_tax_transfer.04','Thông báo','Lỗi update:@'+lt_transaction.sqlerrtext ,'stop','ok',1)
	rollback using  lt_transaction;
	this.iw_display.setredraw( true)
	destroy lds_ledger_transfer	
	return -1
end if
this.iw_display.setredraw( true)
destroy lds_ledger_transfer

return 1

 


end function

public function integer f_set_dw_ledger_transfer_line (ref t_dw_mpl rdw_ledger_transfer_line, t_dw_mpl vdw_master, string vs_transfer_type);

if lower(vs_transfer_type) = 'tax' then
	return this.f_set_dw_tax_transfer( rdw_ledger_transfer_line, vdw_master)
elseif lower(vs_transfer_type) = 'profit' then
	return this.f_set_dw_profit_transfer( rdw_ledger_transfer_line, vdw_master)
end if
return 1

 


end function

public function integer f_set_dw_profit_transfer (ref t_dw_mpl rdw_ledger_transfer_line, t_dw_mpl vdw_master);
double 			ldb_transfer_acct_id, ldb_earning_acct_id , ldb_id_dr_cr, ldb_sub_id, ldb_trans_currency
double      		ldb_base_amount, ldb_total_transfer, ldb_total_base_transfer, ldb_amount
long				ll_rtn, ll_rownum, ll_row
any				laa_value []
date     			ld_trans_date
t_transaction	lt_transaction
t_ds_db		 	lds_ledger_transfer

ld_trans_date = date( vdw_master.getitemdatetime(vdw_master.getrow(),'trans_date'))
ldb_trans_currency = vdw_master.getitemnumber(vdw_master.getrow(),'CURRENCY_ID')

select count(obj.id) into :ll_rtn
from object obj, account act 
where obj.id = act.object_ref_id and act.account_type = 'IS_TRANSFER' using sqlca;
if ll_rtn = 0 then
	gf_messagebox('m.b_doc.f_set_dw_profit_transfer.01','Thông báo','Không tìm thấy TK kết chuyển lãi lỗ','exclamation','ok',1)
	return -1		
elseif  ll_rtn > 1 then
	gf_messagebox('m.b_doc.f_set_dw_profit_transfer.02','Thông báo','Cài đặt TK kết chuyển lãi lỗ nhiều hơn 1','exclamation','ok',1)
	return -1		
end if
select obj.id into :ldb_transfer_acct_id
from object obj,account act 
where obj.id = act.object_ref_id and act.account_type = 'IS_TRANSFER' using sqlca;

select count(obj.id) into  :ll_rtn
from object obj,account act 
where obj.id = act.object_ref_id and act.account_type = 'PREV_EARNING' using sqlca;
if ll_rtn = 0 then
	gf_messagebox('m.b_doc.f_set_dw_profit_transfer.03','Thông báo','Không tìm thấy TK lãi lỗ năm trước','exclamation','ok',1)
	return -1		
elseif  ll_rtn > 1 then
	gf_messagebox('m.b_doc.f_set_dw_ledger_transfer_line.03','Thông báo','Cài đặt TK lãi lỗ năm trước nhiều hơn 1','exclamation','ok',1)
	return -1		
end if	
select obj.id into :ldb_earning_acct_id
from object obj,account act 
where obj.id = act.object_ref_id and act.account_type = 'PREV_EARNING' using sqlca;

laa_value [1] = gs_sob
laa_value [2] = gi_user_comp_id
laa_value [3] = "(COST;REVENUE)"	
laa_value [4] = ld_trans_date
laa_value [5] = ldb_trans_currency

this.iw_display.f_get_transaction( lt_transaction)
this.iw_display.setredraw( false)
lds_ledger_transfer = create t_ds_db
lds_ledger_transfer.dataobject = 'ds_ledger_transfer'	
lds_ledger_transfer.f_add_where('sob;company_id;account_type;balance_date;trans_currency',laa_value [])
lds_ledger_transfer.settransobject(SQLCA)
ll_rtn = lds_ledger_transfer.retrieve()

if ll_rtn >0 then
	//nếu dw đã có dữ liệu thì xóa, insert lại
	if rdw_ledger_transfer_line.f_get_ib_editing()=false then iw_display.event e_modify( )
	if rdw_ledger_transfer_line.rowcount() > 0 then rdw_ledger_transfer_line.event e_delete_all()
	for  ll_row=1 to  ll_rtn		
		ldb_amount = lds_ledger_transfer.getitemnumber( ll_row,'CLOSE_TRANS_AMOUNT')
		ldb_base_amount = lds_ledger_transfer.getitemnumber( ll_row,'close_base_amount')
		if ldb_base_amount <> 0 then
			ldb_total_transfer += ldb_amount
			ldb_total_base_transfer += ldb_base_amount
			
			ldb_id_dr_cr=lds_ledger_transfer.getitemnumber( ll_row,'object_ID')
			ldb_sub_id=lds_ledger_transfer.getitemnumber( ll_row,'subaccount')
			
			ll_rownum=rdw_ledger_transfer_line.event e_addrow( )
			if ldb_base_amount > 0 then 
				rdw_ledger_transfer_line.setitem(ll_rownum,'CR_ACCOUNT_ID',ldb_id_dr_cr)
				rdw_ledger_transfer_line.setitem(ll_rownum,'AMOUNT',ldb_amount)
				rdw_ledger_transfer_line.setitem(ll_rownum,'BASE_AMOUNT',ldb_base_amount)
				rdw_ledger_transfer_line.setitem(ll_rownum,'DR_ACCOUNT_ID',ldb_transfer_acct_id)
				rdw_ledger_transfer_line.setitem(ll_rownum,'CR_SUBACCOUNT',ldb_sub_id)
			else
				rdw_ledger_transfer_line.setitem(ll_rownum,'CR_ACCOUNT_ID',ldb_transfer_acct_id)
				rdw_ledger_transfer_line.setitem(ll_rownum,'AMOUNT',ldb_amount * (-1))
				rdw_ledger_transfer_line.setitem(ll_rownum,'BASE_AMOUNT',ldb_base_amount * (-1))
				rdw_ledger_transfer_line.setitem(ll_rownum,'DR_ACCOUNT_ID',ldb_id_dr_cr)
				rdw_ledger_transfer_line.setitem(ll_rownum,'DR_SUBACCOUNT',ldb_sub_id)
			end if
		end if
	next 
	

	ll_rownum=rdw_ledger_transfer_line.event e_addrow( )
	if ldb_total_transfer > 0 then //-- Lỗ --//
		rdw_ledger_transfer_line.setitem(ll_rownum,'CR_ACCOUNT_ID',ldb_transfer_acct_id)
		rdw_ledger_transfer_line.setitem(ll_rownum,'AMOUNT',ldb_total_transfer )
		rdw_ledger_transfer_line.setitem(ll_rownum,'BASE_AMOUNT',ldb_total_base_transfer )
		rdw_ledger_transfer_line.setitem(ll_rownum,'DR_ACCOUNT_ID',ldb_earning_acct_id)
	else //-- Lãi --//
		rdw_ledger_transfer_line.setitem(ll_rownum,'CR_ACCOUNT_ID',ldb_earning_acct_id)
		rdw_ledger_transfer_line.setitem(ll_rownum,'AMOUNT',ldb_total_transfer*-1)
		rdw_ledger_transfer_line.setitem(ll_rownum,'BASE_AMOUNT',ldb_total_base_transfer *-1)
		rdw_ledger_transfer_line.setitem(ll_rownum,'DR_ACCOUNT_ID',ldb_transfer_acct_id)				
	end if				

end if

if rdw_ledger_transfer_line.update(true, false) = 1 then
	commit using lt_transaction;
	rdw_ledger_transfer_line.event e_retrieve()
else
	gf_messagebox('m.b_doc.f_set_dw_profit_transfer.04','Thông báo','Lỗi update:@'+lt_transaction.sqlerrtext ,'stop','ok',1)
	rollback using  lt_transaction;
	this.iw_display.setredraw( true)
	destroy lds_ledger_transfer	
	return -1
end if
this.iw_display.setredraw( true)
destroy lds_ledger_transfer

return 1

 


end function

public function integer f_insert_loyalty_trans (double vdb_object_id, string vs_doctype, double vdb_doc_id);
return 0
end function

public function integer f_insert_measurement_balance (double vdb_doc_id, date vd_trans_date, ref t_transaction rt_transaction, t_ds_db vds_obj_balance_post, string vs_post_unpost, string vs_sob);//Hàm cập nhật bảng Object trans từ Post_line
long  				ldb_idx, ll_row, ll_row_cnt, ll_insertrow, ll_row_prev_bal
double			ldb_object_id, ldb_trans_currency, ldb_id, ldb_account_id, ldb_subaccount, ldb_branch_id
double 			ldb_up_amt, ldb_down_amt, ldb_open_base_amt,ldb_open_amt
double			ldb_dr_amt, ldb_dr_base_amt, ldb_cr_amt, ldb_cr_base_amt, ldb_close_amt, ldb_close_base_amt
string 			ls_not_accept, ls_where_column,ls_object_type, ls_balance_control, ls_account_code
any 				la_value[], la_empty[]
int 				li_waiting_cnt, li_rtn
date				ld_prev_bal_date, ld_max_date

t_ds_db			lds_object_balance, lds_object_open_bal



lds_object_balance = create t_ds_db


lds_object_open_bal = create t_ds_db
lds_object_open_bal.dataobject =  'ds_object_balance_preday'
lds_object_open_bal.f_settransobject(rt_transaction )


la_value[1] = vdb_doc_id
vds_obj_balance_post.f_add_where( 'DOC_REF_ID', la_value[])
vds_obj_balance_post.f_settransobject( rt_transaction)
ll_row_cnt = vds_obj_balance_post.retrieve( )

FOR ldb_idx = 1 to ll_row_cnt
	ls_balance_control = 'dr'
	ldb_branch_id = vds_obj_balance_post.getitemnumber(ldb_idx,'branch_id')
	ldb_account_id = vds_obj_balance_post.getitemnumber(ldb_idx,'MEASUREMENT_ID')
	setnull(ldb_subaccount)
	ldb_trans_currency = vds_obj_balance_post.getitemnumber(ldb_idx,'UOM_ID')
	setnull(ls_not_accept)
	ldb_object_id = vds_obj_balance_post.getitemnumber(ldb_idx,'OBJECT_ID')
	ls_object_type = 'MEASUREMENT_HDR'	
	ldb_up_amt = vds_obj_balance_post.getitemnumber(ldb_idx,'UP_VALUE')
	if isnull(ldb_up_amt) then ldb_up_amt = 0
	if lower(vs_post_unpost) = 'unpost' then
		ldb_up_amt = - ldb_up_amt
	end if	
	ldb_down_amt = vds_obj_balance_post.getitemnumber(ldb_idx,'DOWN_VALUE')
	if isnull(ldb_down_amt) then ldb_down_amt = 0
	if lower(vs_post_unpost) = 'unpost' then
		ldb_down_amt = - ldb_down_amt
	end if	
	
	//-- Set các biến về 0 --//
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
					return -1
				end if
			end if
			ll_insertrow = lds_object_balance.event e_addrow()	
			ldb_id = this.f_create_id( )
			lds_object_balance.setitem(ll_insertrow,'id', ldb_id)				
		elseif ll_row_prev_bal = 0 then
			ldb_open_amt = 0
			ldb_open_base_amt = 0
			ll_insertrow = lds_object_balance.event e_addrow()	
			ldb_id = this.f_create_id( )
			lds_object_balance.setitem(ll_insertrow,'id', ldb_id)	
		else
			gf_messagebox('m.b_doc.f_insert_measurement_balance.01','Thông báo','Không lấy được số dư đầu do bảng balance có nhiều dòng trong 1 ngày','stop','ok',1)
			destroy lds_object_open_bal
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
		gf_messagebox('m.b_doc.f_insert_measurement_balance.01','Thông báo','Không lấy được số dư đầu do bảng balance có nhiều dòng trong 1 ngày','stop','ok',1)
		destroy lds_object_open_bal
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
		lds_object_balance.setitem( ll_insertrow, 'OBJECT_REF_TYPE', 'MEASUREMENT_HDR')

	end if
	
	lds_object_balance.setitem( ll_insertrow, 'DR_TRANS_AMOUNT', ldb_dr_amt + ldb_up_amt)
	lds_object_balance.setitem( ll_insertrow, 'DR_BASE_AMOUNT', ldb_dr_base_amt +ldb_up_amt )
	lds_object_balance.setitem( ll_insertrow, 'CR_TRANS_AMOUNT', ldb_cr_amt + ldb_down_amt)
	lds_object_balance.setitem( ll_insertrow, 'CR_BASE_AMOUNT', ldb_cr_base_amt +ldb_down_amt)
	ldb_close_amt = ldb_open_amt +  (ldb_dr_amt+ ldb_up_amt)  -  (ldb_cr_amt + ldb_down_amt)
	ldb_close_base_amt = ldb_open_base_amt + ( ldb_dr_base_amt+ ldb_up_amt) -  (ldb_cr_base_amt + ldb_down_amt)

		
	//-- kiểm tra ghi sổ âm --//
	if ls_balance_control = 'dr' then
		if ldb_close_base_amt <0 or ldb_close_amt < 0 then 
			ls_account_code= this.f_get_object_code( ldb_object_id)
			gf_messagebox('m.b_doc.f_insert_measurement_balance.02','Thông báo', 'Đối tượng sau không được có số tồn âm:@'+ls_account_code ,'exclamation','ok',1)			
			rollback using rt_transaction;
			destroy lds_object_balance	
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
			gf_messagebox('m.b_doc.f_insert_measurement_balance.03','Thông báo', rt_transaction.SQLErrText ,'stop','ok',1)
			return -1				
		end if
		gf_messagebox('m.b_doc.f_insert_measurement_balance.03','Thông báo', rt_transaction.SQLErrText ,'stop','ok',1)
		rollback using rt_transaction;
		destroy lds_object_balance	
		destroy lds_object_open_bal

		return -1
	end if	
	
	//-- update object balance những ngày sau trans_date các ngày tiếp theo --//
	SELECT max(balance_date) into :ld_max_date from object_balance where object_ref_type = :ls_object_type and sob =:vs_sob using sqlca;
	if daysafter(vd_trans_date, ld_max_date) > 0 then
		lds_object_balance.dataobject = 'ds_object_balance_after'
		lds_object_balance.f_settransobject(rt_transaction)						
		li_rtn = this.f_update_object_balance(vs_sob,ldb_branch_id, ldb_object_id, ls_object_type, ldb_trans_currency,ldb_account_id,ldb_subaccount, ls_not_accept, & 
											ldb_close_amt,ldb_close_base_amt,rt_transaction,ls_balance_control,vd_trans_date, ld_max_date, lds_object_balance)
		if li_rtn = -1 then
			rollback using rt_transaction;
			destroy lds_object_balance	
			
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
				gf_messagebox('m.b_doc.f_insert_measurement_balance.03','Thông báo', rt_transaction.SQLErrText ,'stop','ok',1)
				return -1				
			end if
			gf_messagebox('m.b_doc.f_insert_measurement_balance.03','Thông báo', rt_transaction.SQLErrText ,'stop','ok',1)
			rollback using rt_transaction;
			destroy lds_object_balance	
			destroy lds_object_open_bal

			return -1
		end if
	end if
	
NEXT

destroy lds_object_balance
destroy lds_object_open_bal

return 1
	
end function

public function string f_get_object_code (long vl_object_id);string ls_object_code
int		li_cnt

select count(id)  into :li_cnt from object where id = :vl_object_id using sqlca;

if li_cnt = 1 then
	select code into :ls_object_code from object where id = :vl_object_id using sqlca;
	return ls_object_code
else
	gf_messagebox('m.b_doc.f_get_object_code.01','Thông báo','Không tìm thấy đối tượng có ID:@'+string(vl_object_id),'stop','ok',1)
	return ''
end if



end function

public function integer f_insert_post_line (double vdb_doc_id, double vdb_branch_id, t_ds_db vds_trans_setup, t_dw_mpl vdw_get_amount, string vs_posting_type[], double vdb_currency_id, decimal vdc_exrate);//-- Không c òn dùng : 20Feb18--//

long				ll_row, ll_insert_row, ll_rtn_row, ll_rtn
int					li_row, li_idx 
string				ls_col_get_amount, ls_col_get_base_amount, ls_not_accept_col, ls_posting_type, ls_posting_type_error, ls_dr_obj_type, ls_cr_obj_type, las_col_item[]
string				ls_base_curr_code, ls_base_curr_name, ls_object_ref_table, ls_base_currcode, ls_base_currname, ls_f_post_line_str
double			ldb_amount, ldb_base_amount, ldb_dr_object_id, ldb_cr_object_id, ldb_round_diff, ldb_act_qty_sku, ldb_trans_uom, ldb_base_settled_amt
double			ldb_base_curr, ldb_object_ref_id, ldb_base_curr_id, ldb_basecurr_round_id,  ldb_post_line_id[], ldb_invoice_exrate,ldb_round_id,ldb_exrate_amt
boolean			lb_ok, lb_found, lb_update_sku
date				ld_trans_date
any				laa_data[] , laa_data_postline[]

s_str_post_account		lstr_post_account
b_obj_instantiate			lu_item
t_transaction				lt_transaction
c_string						lc_string
t_ds_db						lds_matching, lds_f_post_line, rds_post_line
//c_unit_instance				lc_unit

ldb_exrate_amt = vdc_exrate
if isnull(vdb_currency_id) or vdb_currency_id = 0 then return -1
if isnull(ldb_exrate_amt) or ldb_exrate_amt = 0 then return -1
if this.f_get_trans_date( ld_trans_date) = -1 then return -1
this.iw_display.f_get_transaction(lt_transaction )

lds_matching = create t_ds_db
lds_matching.dataobject = 'ds_matching'
lds_matching.f_settransobject( lt_transaction)
lds_f_post_line = create t_ds_db
lds_f_post_line.dataobject = 'd_post_line_grid'
lds_f_post_line.f_settransobject(lt_transaction)

FOR li_idx = 1 to upperbound(vs_posting_type[])
	ls_posting_type_error += vs_posting_type[li_idx]+'; '
	lb_update_sku = false
	
	rds_post_line = create t_ds_db 
	rds_post_line.dataobject = 'd_post_line_grid' 
	rds_post_line.f_settransobject(lt_transaction)	
	
	FOR ll_row = 1 to vdw_get_amount.rowcount()
		lstr_post_account.s_trans_text =''
		//-- Lấy tài khoản và tiểu mục ghi sổ --//		
		ll_rtn_row = this.f_get_Trans_setup_account( vds_trans_setup, vs_posting_type[li_idx], vdw_get_amount, ll_row, lstr_post_account)
		
		//-- xử lý mã hàng không quản lý số lượng --//
//		if lstr_post_account.s_cr_object_type = 'ITEM' and vs_posting_type[li_idx] = 'cogs'  then
//			if not lu_item.f_is_managed_qty( lstr_post_account.db_cr_object_id ) then continue
//		elseif lstr_post_account.s_dr_object_type = 'ITEM' and vs_posting_type[li_idx] = 'cogs' then
//			if not lu_item.f_is_managed_qty( lstr_post_account.db_dr_object_id ) then continue
//		end if
		
		if ll_rtn_row = -1 then return -1		
		if ll_rtn_row = 0 then continue
		if ll_rtn_row > 0 then lb_found = true
		
		//-- Lấy số tiền định khoản --//
		ls_col_get_amount =  vds_trans_setup.getitemstring( ll_rtn_row, 'col_get_amount')
		if isnull(ls_col_get_amount) or ls_col_get_amount = '' then
			gf_messagebox('m.b_doc.f_insert_post_line.01','Thông báo','Giao dịch ghi sổ chưa cài đặt cột giá trị','exclamation','ok',1)
			return -1	
		end if		
		ls_col_get_base_amount =  vds_trans_setup.getitemstring( ll_rtn_row, 'col_get_base_amount')
		if isnull(ls_col_get_base_amount) or ls_col_get_base_amount='' then
			gf_messagebox('m.b_doc.f_insert_post_line.02','Thông báo','Giao dịch ghi sổ chưa cài đặt cột giá trị quy đổi','exclamation','ok',1)
			return -1		
		end if				
		
		ldb_base_amount = vdw_get_amount.getitemnumber(ll_row, ls_col_get_base_amount)
		if isnull(ldb_base_amount) then ldb_base_amount = 0
				
		if lower(lstr_post_account.s_cr_object_type) = 'item' then // and lower(ls_col_get_base_amount) = 'cogs' 
			lb_update_sku = true
			//-- set số lượng SKU --//
//			lu_item = create u_item
			this.f_get_item_columns_of_streamvalue( vdw_get_amount.dataobject, las_col_item[])
			if upperbound(las_col_item[]) > 0 then				
				ldb_trans_uom = vdw_get_amount.getitemnumber(ll_row,las_col_item[4])				
				ll_rtn = this.f_set_Qty_sku(lt_transaction, vdw_get_amount, ll_row,lstr_post_account.db_cr_object_id,ldb_trans_uom, las_col_item[3], 'OUT', ldb_act_qty_sku, ldb_round_diff)
				if ll_rtn = -1 then
					vdw_get_amount.resetupdate()
//					destroy lu_item
					return -1
				end if
				lu_item.f_update_round_diff( lstr_post_account.db_cr_object_id, ldb_round_diff, lt_transaction)
			end if
			
			//-- set cogs vào hóa đơn bán --//		
			if lower(ls_col_get_base_amount) = 'cogs' then
				//-- kiểm tra quản lý số lượng --//
				if lu_item.f_is_managed_qty( lstr_post_account.db_cr_object_id ) then
					if this.ib_doc_return_yn then
						ldb_base_amount = this.f_get_return_unit_cogs(  vdw_get_amount.getitemnumber(ll_row, 'id'))
						if ldb_base_amount = -1 then
							vdw_get_amount.resetupdate()
	//						destroy lu_item	
							return -1
						end if
					else
						ldb_base_amount = lu_item.f_get_moving_avg(lstr_post_account.db_cr_object_id)
						//ldb_base_amount = ldb_base_amount * ldb_act_qty_sku
						this.ic_unit_instance.f_get_base_cur( ldb_base_curr, ls_base_curr_code, ls_base_curr_name)
						ldb_round_id = ic_unit_instance.f_get_round_id( ldb_base_curr, 0, 'amount')
						if ldb_act_qty_sku < 0 then ldb_act_qty_sku = -ldb_act_qty_sku //-- kiểm kê thiếu hàng : ghi âm sku--//
						ldb_base_amount = this.ic_unit_instance.f_round(vdw_get_amount, ldb_round_id, ldb_base_amount * ldb_act_qty_sku)
					end if
	//				destroy lu_item			
					vdw_get_amount.setitem(ll_row,ls_col_get_base_amount, ldb_base_amount)
				else
					ldb_base_amount = 0
				end if
			end if
		elseif lower(lstr_post_account.s_dr_object_type) = 'item' and lower(lstr_post_account.s_cr_object_type) <> 'tax_authority'  and lower(lstr_post_account.s_cr_object_type) <> 'charge_object' then
			//-- set số lượng SKU --//
//			lu_item = create u_item
			this.f_get_item_columns_of_streamvalue( vdw_get_amount.dataobject, las_col_item[])
			if upperbound(las_col_item[]) > 0 then
				lb_update_sku = true
				ldb_trans_uom = vdw_get_amount.getitemnumber(ll_row,las_col_item[4])
				ll_rtn = this.f_set_Qty_sku(lt_transaction, vdw_get_amount, ll_row,lstr_post_account.db_dr_object_id,ldb_trans_uom, las_col_item[3], 'OUT', ldb_act_qty_sku, ldb_round_diff)
				if ll_rtn = -1 then
					vdw_get_amount.resetupdate()
//					destroy lu_item	
					return -1
				end if
				lu_item.f_update_round_diff( lstr_post_account.db_dr_object_id, ldb_round_diff, lt_transaction)
			end if
//			destroy lu_item	
		end if
		
		if vs_posting_type[li_idx] <> 'cogs' and ldb_base_amount = 0 and ls_col_get_base_amount <> 'cogs' then continue 
		if ls_col_get_base_amount = 'cogs' and lower(lstr_post_account.s_dr_object_type) <> 'item' and lower(lstr_post_account.s_cr_object_type) <> 'item' then continue
		if (ldb_base_amount = 0 or isnull(ldb_base_amount)) then
			if lower(lstr_post_account.s_dr_object_type) <> 'item' then
				if lower(lstr_post_account.s_cr_object_type) <> 'item' then
					if ll_row = vdw_get_amount.rowcount() then exit
					continue
				end if
			end if
		end if
		
		
		if lower(ls_col_get_base_amount) = 'cogs' then
			ldb_amount = ldb_base_amount
		else
			ldb_amount = vdw_get_amount.getitemnumber(ll_row, ls_col_get_amount)
		end if
		
		//-- Xứ lý ngoại tệ tiền thuế và chênh lệch tỷ giá --//
		
		ic_unit_instance.f_get_base_cur( ldb_base_curr_id,ls_base_currcode, ls_base_currname)
		if  ldb_base_curr_id <> vdb_currency_id then 
			//-- xử lý thuế: quy đổi tiền thuế ngược lại ngoại tệ --//
			if vs_posting_type[li_idx] = 'tax' then
				ldb_round_id = ic_unit_instance.f_get_round_id( vdb_currency_id, 0, 'amount') 
				ldb_exrate_amt = ic_unit_instance.f_round( lt_transaction, ldb_round_id,  ldb_base_amount/ldb_amount)
//				ldb_amount = ic_unit_instance.f_round( lt_transaction, ldb_basecurr_round_id,  ldb_base_amount/ldb_exrate_amt)								
			end if	
			//-- xử lý base_amount khi có chênh lẹch tỷ giá --//
			if upper(vdw_get_amount.describe( "DataWindow.Table.UpdateTable")) = 'PAYMENT_LINE' then
				laa_data[1] = vdw_get_amount.getitemnumber(ll_row, 'id')
				laa_data[2] = 'PAYMENT_LINE'
				lds_matching.f_add_where( 't_ref_id;t_ref_table', laa_data[])				
				if lds_matching.retrieve( ) > 0 then
					ldb_post_line_id[] = lds_matching.object.f_ref_id.Primary.Current
					
					lc_string.f_arraytostring( ldb_post_line_id[], ';', ls_f_post_line_str)
					laa_data_postline[1] = '('+ls_f_post_line_str+')'					
					lds_f_post_line.f_add_where( 'ID', laa_data_postline[])
					if lds_f_post_line.retrieve( ) > 0 then						
						ldb_object_ref_id = vdw_get_amount.getitemnumber(ll_row, 'id')
						ls_object_ref_table =  upper(vdw_get_amount.describe( "DataWindow.Table.UpdateTable"))	
						if this.f_create_exrate_post_line(lds_f_post_line, ldb_amount,ldb_base_amount, vdb_currency_id,ldb_exrate_amt, ld_trans_date, vdb_doc_id, ldb_object_ref_id, ls_object_ref_table, lstr_post_account, rds_post_line) = -1 then
							rollback using lt_transaction;
//							destroy lu_item	
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
		rds_post_line.setitem(ll_insert_row,'id', this.f_create_id( ) )
		rds_post_line.setitem(ll_insert_row,'branch_id', vdb_branch_id )
		rds_post_line.setitem(ll_insert_row,'dr_object_type', upper(ls_dr_obj_type))
		rds_post_line.setitem(ll_insert_row,'dr_object_id', lstr_post_account.db_dr_object_id)
		rds_post_line.setitem(ll_insert_row,'trans_text', lstr_post_account.s_trans_text )
		rds_post_line.setitem(ll_insert_row,'post_type_text', lstr_post_account.s_post_type_text )
		rds_post_line.setitem(ll_insert_row,'dr_account_id', lstr_post_account.db_dr_account)
		rds_post_line.setitem(ll_insert_row,'dr_subaccount', lstr_post_account.db_dr_subaccount)
		rds_post_line.setitem(ll_insert_row,'cr_object_type', upper(ls_cr_obj_type))
		rds_post_line.setitem(ll_insert_row,'cr_object_id', lstr_post_account.db_cr_object_id)
		rds_post_line.setitem(ll_insert_row,'cr_account_id', lstr_post_account.db_cr_account)
		rds_post_line.setitem(ll_insert_row,'cr_subaccount', lstr_post_account.db_cr_subaccount)
		ls_posting_type = vs_posting_type[li_idx] 
		if ls_posting_type= 'NULL' then  setnull(ls_posting_type)		
		rds_post_line.setitem(ll_insert_row,'post_type', ls_posting_type)
		rds_post_line.setitem(ll_insert_row,'doc_id', vdb_doc_id)		
		rds_post_line.setitem(ll_insert_row,'object_ref_id',  vdw_get_amount.getitemnumber(ll_row, 'id'))
		rds_post_line.setitem(ll_insert_row,'object_ref_table', upper(vdw_get_amount.describe( "DataWindow.Table.UpdateTable")))
		rds_post_line.setitem(ll_insert_row,'trans_amt', ldb_amount)
		rds_post_line.setitem(ll_insert_row,'base_amt',  ldb_base_amount)
		rds_post_line.setitem(ll_insert_row,'TRANS_CUR_ID', vdb_currency_id)
		rds_post_line.setitem(ll_insert_row,'EX_RATE', ldb_exrate_amt)
		rds_post_line.setitem(ll_insert_row,'trans_date', ld_trans_date)

		if not isnull(ls_not_accept_col) and ls_not_accept_col<>'' then
			rds_post_line.setitem(ll_insert_row,'not_accept',  vdw_get_amount.getitemstring(ll_row,ls_not_accept_col))
		end if
		
		if mod(ll_insert_row, 20) = 0 then
			if rds_post_line.update(true,false) = -1 then
				gf_messagebox('m.b_doc.f_insert_post_line.03','Thông báo','Không cập nhật được post line:@' +lt_transaction.sqlerrtext ,'exclamation','ok',1)
				rollback using lt_transaction;
				return -1
			end if	
			rds_post_line.reset()
			
		end if
	NEXT

	//-- destroy ds--//
	if rds_post_line.update(true,false) = -1 then
		gf_messagebox('m.b_doc.f_insert_post_line.03','Thông báo','Không cập nhật được postline :@' +lt_transaction.sqlerrtext ,'exclamation','ok',1)
		rollback using lt_transaction;
		return -1
	end if	
	destroy rds_post_line
	GarbageCollect ( )
	
	//-- update cot sku ,cogs--//
	if  vdw_get_amount.rowcount()> 0 and lb_update_sku then
		if vdw_get_amount.update(true,false) = -1 then
			gf_messagebox('m.b_doc.f_insert_post_line.04','Thông báo','Không cập nhật được số lượng theo đơn vị tồn kho:@' +lt_transaction.sqlerrtext ,'exclamation','ok',1)
			rollback using lt_transaction;
//			destroy lu_item	
			return -1
		end if	
		vdw_get_amount.resetupdate()	
	end if
NEXT

destroy lds_matching

if not lb_found and  vdw_get_amount.rowcount()> 0 then
	gf_messagebox('m.b_doc.f_insert_post_line.05','Thông báo','Không tìm thấy tài khoản cài đặt của nghiệp vụ:@' + ls_posting_type_error ,'exclamation','ok',1)
//	destroy lu_item	
	return -1
end if
return 1
end function

public function integer f_create_post_line (double vdb_doc_id, double vdb_branch_id, double vdb_trans_hdr_id);/**********************************************************
KHÔNG CÒN DÙNG
Chức năng: Tạo định khoản cho chứng từ theo cài đặt ngiệp vụ ghi sổ
--------------------------------------------------------------------------------------------
Tham số: vdb_doc_id : ID của chứng từ cần ghi sổ
---------------------------------------------------------------------
Return: 	 1 -> Thành công
			-1 -> Lỗi
==============================TrevietSoftware.com*/
t_ds_db				lds_trans_setup
t_dw_mpl				ldw_get_amount, ldw_dr_object, ldw_cr_object
c_string				lc_string
long					ll_row, ll_cnt, ll_rtn
string					ls_dw_get_mount,ls_dw_get_mount_tmp, ls_col_get_base_amount, ls_col_get_amount, ls_original_filter, ls_source_filter
string					ls_posting_type[], ls_posting_type_tmp, ls_findString, ls_empty[]
double				ldb_currency_id
decimal				ldc_exrate

//-- Kiểm tra tham số truyền vào --//
if vdb_doc_id = 0 or isnull(vdb_doc_id) then 
	gf_messagebox('m.b_doc.f_create_post_line.01','Thông báo','Tham số ID chứng từ không hợp lệ !','exclamation','ok',1)
	return -1
end if
if vdb_trans_hdr_id = 0 or isnull(vdb_trans_hdr_id) then
	gf_messagebox('m.b_doc.f_create_post_line.03','Thông báo','Chứng từ chưa có giao dịch','exclamation','ok',1)
	return -1	
end if
//-- Lấy tỷ giá và loại tiền của chứng từ --//
this.f_get_currency_exrate_of_doc( ldb_currency_id, ldc_exrate)
if isnull(ldb_currency_id) or ldb_currency_id = 0 then 
	gf_messagebox('m.b_doc.f_create_post_line.04','Thông báo','Chứng từ chưa có loại tiền','exclamation','ok',1)
	return -1
end if
if isnull(ldc_exrate) or ldc_exrate = 0 then
	gf_messagebox('m.b_doc.f_create_post_line.05','Thông báo','Chứng từ chưa có tỷ giá','exclamation','ok',1)
	return -1
end if
//-- Lấy toàn bộ thông tin cài đặt nghiệp vụ của chứng từ --//
lds_trans_setup = create t_ds_db
if this.f_get_trans_setup(vdb_trans_hdr_id, lds_trans_setup) < 1 then
	gf_messagebox('m.b_doc.f_create_post_line.06','Thông báo','Giao dịch ghi sổ chưa cài đặt','exclamation','ok',1)
	destroy lds_trans_setup
	return -1		
end if

//-- Duyệt theo dw_get_amount --//
ll_row = 1
DO
	ls_posting_type_tmp = lds_trans_setup.getitemstring( ll_row, 'posting_type')
	if isnull(ls_posting_type_tmp) then  ls_posting_type_tmp= 'NULL' 
	ls_dw_get_mount_tmp = lds_trans_setup.getitemstring( ll_row, 'dw_get_amount')
	if isnull(ls_dw_get_mount_tmp) or ls_dw_get_mount_tmp=''  then
		gf_messagebox('m.b_doc.f_create_post_line.07','Thông báo','Giao dịch ghi sổ chưa cài đặt dw giá trị','exclamation','ok',1)
		return -1		
	end if	
	if upperbound(ls_posting_type) = 0 then ls_posting_type[1] = ls_posting_type_tmp
	if ls_dw_get_mount_tmp <> ls_dw_get_mount or ls_posting_type_tmp <> ls_posting_type[upperbound(ls_posting_type)] then //-- thay đổi dw chứa giá trị ghi sổ --//
		//-- insert dw post_line --//
		if ls_dw_get_mount <> '' and  ls_dw_get_mount_tmp <> ls_dw_get_mount then
			//-- bỏ filter --//
			ls_original_filter = ldw_get_amount.describe( "datawindow.table.filter")
			if ls_original_filter <> '?' then
				this.f_doc_filter( ldw_get_amount.dataobject, true)				
			end if	
	
			ll_rtn = this.f_insert_post_line(  vdb_doc_id,vdb_branch_id,lds_trans_setup, ldw_get_amount, ls_posting_type[], ldb_currency_id,ldc_exrate)
			//--** trả lại filter gốc --//
			if ls_original_filter <> '?' then
			ls_source_filter=lc_string.f_globalreplace(ls_original_filter,'~~','')
				ldw_get_amount.setfilter(ls_source_filter)
				ldw_get_amount.filter( )
			end if			
			if ll_rtn = -1 then return -1
			ls_posting_type[] = ls_empty[]
			ls_posting_type[1] = ls_posting_type_tmp
			ls_dw_get_mount = ''
			ll_cnt=0
		end if
		//-- lưu posting type --//
		ll_cnt++
		if  ll_cnt > 1 then	ls_posting_type[ll_cnt]= ls_posting_type_tmp
		//-- Lấy dw chứa giá trị ghi sổ --//
		if ls_dw_get_mount_tmp <> ls_dw_get_mount then
			ls_dw_get_mount = ls_dw_get_mount_tmp	
			ldw_get_amount = this.iw_display.dynamic f_get_dw(ls_dw_get_mount + '_grid'	)
			if isnull(ldw_get_amount) or not isvalid(ldw_get_amount) then
				gf_messagebox('m.b_doc.f_create_post_line.08','Thông báo','Không tìm dw giá trị trên chứng từ:@'+ls_dw_get_mount,'exclamation','ok',1)
				return -1				
			end if			
		end if

	end if
	if upperbound(ls_posting_type) > 0 then
		if ls_posting_type[upperbound(ls_posting_type)] = 'NULL' then
			ls_findString = "dw_get_amount <> '"+ls_dw_get_mount_tmp+"' OR not isnull(posting_type)"
		else
			ls_findString = "dw_get_amount <> '"+ls_dw_get_mount_tmp+"' OR posting_type <>'"+ ls_posting_type[upperbound(ls_posting_type)] +"'"
		end if
	else
		ls_findString = "dw_get_amount <> '"+ls_dw_get_mount_tmp+"'"
	end if		
	ll_row = lds_trans_setup.find(ls_findString ,ll_row+1, lds_trans_setup.rowcount()+1)
LOOP while ll_row > 0
//-- insert dw post_line sau cùng hoặc duy nhất--//
if ls_dw_get_mount <> '' and  ls_dw_get_mount_tmp = ls_dw_get_mount then
	//-- bỏ filter --//
	ls_original_filter = ldw_get_amount.describe( "datawindow.table.filter")
	if ls_original_filter <> '?' then
		this.f_doc_filter( ldw_get_amount.dataobject, true)	
	end if		

	ll_rtn = this.f_insert_post_line(  vdb_doc_id,vdb_branch_id,lds_trans_setup, ldw_get_amount, ls_posting_type[], ldb_currency_id,ldc_exrate) 
	//--** trả lại filter gốc --//
	if ls_original_filter <> '?' then
	ls_source_filter=lc_string.f_globalreplace(ls_original_filter,'~~','')
		ldw_get_amount.setfilter(ls_source_filter)
		ldw_get_amount.filter( )	
	end if	
	if ll_rtn = -1 then return -1
end if

return 1
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

public function integer f_insert_post_line (double vdb_doc_id, double vdb_branch_id, t_dw_mpl vdw_get_amount, double vdb_currency_id, double vdc_exrate, s_str_post_account vstr_spec_acct[], s_str_post_account vstr_grp_acct[], s_str_post_account vstr_all_acct[], s_str_post_info vstr_post_info);/******************************************************************************
Hàm mới (Dev. 17 Feb 18): dùng strutrure lưu giữ posting account.

=============================================TrevietSoftware*/

long				ll_row, ll_insert_row, ll_rtn_row, ll_rtn, ll_master_row
int					li_row, li_idx, li_cnt, li_response
string				ls_trans_text_dw, ls_not_accept_col, ls_posting_type,  las_col_item[], ls_condition_val, ls_condition_coltype, ls_subacct_yn, ls_acct_type
string				ls_base_curr_code, ls_base_curr_name, ls_object_ref_table, ls_base_currcode, ls_base_currname, ls_f_post_line_str
double			ldb_amount, ldb_base_amount, ldb_dr_object_id, ldb_cr_object_id, ldb_round_diff, ldb_act_qty_sku, ldb_trans_uom, ldb_base_settled_amt
double			ldb_base_curr, ldb_object_ref_id, ldb_post_line_id[], ldb_invoice_exrate,ldb_round_id,ldb_exrate_amt
double			ldb_dr_subacct_id, ldb_cr_subacct_id, ldb_dr_account_id, ldb_cr_account_id, ldb_del_ID
boolean			lb_found, lb_update_sku, lb_managed_value, lb_accounted , lb_create_account, lb_insert_tmp
date				ld_trans_date
any				laa_data[] , laa_data_postline[]

s_str_post_account		lstr_post_account
b_obj_instantiate			lb_obj

t_transaction				lt_transaction
c_string						lc_string
t_ds_db						lds_matching, lds_f_post_line, rds_post_line
t_dw_mpl					ldw_master

ldb_exrate_amt = vdc_exrate
if isnull(vdb_currency_id) or vdb_currency_id = 0 then return -1
if isnull(ldb_exrate_amt) or ldb_exrate_amt = 0 then return -1
if this.f_get_trans_date( ld_trans_date) = -1 then return -1
this.iw_display.f_get_transaction(lt_transaction )

lds_matching = create t_ds_db
lds_matching.dataobject = 'ds_matching'
lds_matching.f_settransobject( lt_transaction)
lds_f_post_line = create t_ds_db
lds_f_post_line.dataobject = 'd_post_line_grid'
lds_f_post_line.f_settransobject(lt_transaction)


lb_update_sku = false

rds_post_line = create t_ds_db
rds_post_line.dataobject = 'd_post_line_grid'
rds_post_line.f_settransobject(lt_transaction)	


select count(id) into :li_cnt from post_line where doc_id = :vdb_doc_id using sqlca; 
if li_cnt > 0 then
	lb_accounted = true
else
	lb_create_account = true
end if
//--lấy round_id--//
this.ic_unit_instance.f_get_base_cur( ldb_base_curr, ls_base_curr_code, ls_base_curr_name)
ldb_round_id = ic_unit_instance.f_get_round_id( ldb_base_curr, 0, 'amount')

FOR ll_row = 1 to vdw_get_amount.rowcount()
	
	
	//-- Lấy conditional value --//
	if vstr_post_info.s_dw_criterial = left(vdw_get_amount.dataobject, len(vdw_get_amount.dataobject) - 5) then 
		ls_condition_val = string(vdw_get_amount.dynamic f_getitemany( ll_row ,vstr_post_info.s_col_criterial))
		ls_condition_coltype = vdw_get_amount.Describe( vstr_post_info.s_col_criterial+".ColType")
	elseif not isnull(vstr_post_info.s_dw_criterial) and vstr_post_info.s_dw_criterial <> '' then
		ldw_master = vdw_get_amount.dynamic f_get_idw_master()
		if isvalid(ldw_master) then
			ldb_object_ref_id =  vdw_get_amount.getitemnumber(ll_row, 'object_ref_id')
			ll_master_row = ldw_master.find( "id = "+string(ldb_object_ref_id) , 1, ldw_master.rowcount())		
			if ll_master_row = 0 then ll_master_row = ldw_master.getrow()		
			if vstr_post_info.s_dw_criterial = left(ldw_master.dataobject, len(ldw_master.dataobject) - 5) then 		
				ls_condition_val = string(ldw_master.dynamic f_getitemany( ll_master_row, vstr_post_info.s_col_criterial))	
				ls_condition_coltype = ldw_master.Describe( vstr_post_info.s_col_criterial+".ColType")
			else
				ldb_object_ref_id =  ldw_master.dynamic getitemnumber(ll_master_row, 'object_ref_id')
				ldw_master = ldw_master.dynamic f_get_idw_master()
				if isvalid(ldw_master) then
					if vstr_post_info.s_dw_criterial = left(ldw_master.dataobject, len(ldw_master.dataobject) - 5) then
						ll_master_row = ldw_master.find( "id = "+string(ldb_object_ref_id) , 1, ldw_master.rowcount())	
						if ll_master_row = 0 then ll_master_row = ldw_master.getrow()										
						ls_condition_val = string(ldw_master.dynamic f_getitemany( ll_master_row, vstr_post_info.s_col_criterial))	
						ls_condition_coltype = ldw_master.Describe( vstr_post_info.s_col_criterial+".ColType")		
					end if
				end if
			end if
		end if
	end if

	//-- Lấy object id DR/CR --//
	if this.f_get_posting_object( vstr_post_info, vdw_get_amount, ll_row, ldb_dr_object_id,ldb_cr_object_id,lt_transaction, ldb_dr_subacct_id, ldb_cr_subacct_id) = -1 then
		return -1
	end if
	
	//-- Lấy tài khoản và tiểu mục ghi sổ --//		
	if ll_rtn_row < 2 or lstr_post_account.s_posting_type = 'ledger'  or ls_condition_val <>'' then
		ll_rtn_row = this.f_get_Trans_setup_account( ldb_dr_object_id, ldb_cr_object_id,ls_condition_val,ls_condition_coltype, vstr_spec_acct[],vstr_grp_acct[], vstr_all_acct[], vstr_post_info,  lstr_post_account)
	end if
	if ll_rtn_row = -1 then return -1				
	if ll_rtn_row = 0 then continue //-- Đối tượng ko cần định khoản --//
	
	//-- Lấy lại object id DR/CR sau khi có structure --//
	if ll_rtn_row = 3 then
		if this.f_get_posting_object( lstr_post_account, vdw_get_amount, ll_row, ldb_dr_object_id,ldb_cr_object_id,lt_transaction, ldb_dr_subacct_id, ldb_cr_subacct_id) = -1 then
			return -1
		end if		
	end if
			
	//-- set số lượng SKU --//
	if lower(lstr_post_account.s_cr_object_type) = 'item' then // and lower(ls_col_get_base_amount) = 'cogs' 
		lb_update_sku = true
		//-- set số lượng SKU --//
		this.f_get_item_columns_of_streamvalue( vdw_get_amount.dataobject, las_col_item[])
		if upperbound(las_col_item[]) > 0 then				
			ldb_trans_uom = vdw_get_amount.getitemnumber(ll_row,las_col_item[4])				
			ll_rtn = this.f_set_Qty_sku(lt_transaction, vdw_get_amount, ll_row, ldb_cr_object_id ,ldb_trans_uom, las_col_item[3], 'OUT', ldb_act_qty_sku, ldb_round_diff)
			if ll_rtn = -1 then
				vdw_get_amount.resetupdate()
				return -1
			end if
			lb_obj.f_update_round_diff( ldb_cr_object_id, ldb_round_diff, lt_transaction)
		end if		
		lb_managed_value = lb_obj.f_is_managed_value( ldb_cr_object_id)
		if  vdw_get_amount.dataobject = 'd_inventory_line_counting_grid' then			
			if not lb_managed_value then continue  //-- kiểm kê mặt hàng ko quản lý giá trị, ko ghi sổ tài khoản --//
		end if
		//-- set cogs vào hóa đơn bán --//		
		if lower(lstr_post_account.s_col_base_amt) = 'cogs' then
			if not lb_managed_value then continue //-- Mã hàng ko quản lý giá trị, khi bán không ghi sổ giá vốn --//
			if this.ib_doc_return_yn then
				ldb_base_amount = this.f_get_return_unit_cogs(  vdw_get_amount.getitemnumber(ll_row, 'id'))
				if ldb_base_amount = -1 then
					vdw_get_amount.resetupdate()
					return -1
				end if
			else
				ldb_base_amount = lb_obj.f_get_last_pur_price(ldb_cr_object_id)
				if ldb_act_qty_sku < 0 then ldb_act_qty_sku = -ldb_act_qty_sku //-- kiểm kê thiếu hàng : ghi âm sku--//
				ldb_base_amount = this.ic_unit_instance.f_round(vdw_get_amount, ldb_round_id, ldb_base_amount * ldb_act_qty_sku)
			end if		
			vdw_get_amount.setitem(ll_row,lstr_post_account.s_col_base_amt, ldb_base_amount)
		end if				
	elseif lower(lstr_post_account.s_dr_object_type) = 'item' and lower(lstr_post_account.s_cr_object_type) <> 'tax_authority'  and lower(lstr_post_account.s_cr_object_type) <> 'charge_object' then
		//-- set số lượng SKU --//
		this.f_get_item_columns_of_streamvalue( vdw_get_amount.dataobject, las_col_item[])
		if upperbound(las_col_item[]) > 0 then
			lb_update_sku = true
			ldb_trans_uom = vdw_get_amount.getitemnumber(ll_row,las_col_item[4])
			ll_rtn = this.f_set_Qty_sku(lt_transaction, vdw_get_amount, ll_row, ldb_dr_object_id, ldb_trans_uom, las_col_item[3], 'OUT', ldb_act_qty_sku, ldb_round_diff)
			if ll_rtn = -1 then
				vdw_get_amount.resetupdate()
				return -1
			end if
			lb_obj.f_update_round_diff( ldb_dr_object_id, ldb_round_diff, lt_transaction)
		end if
		if  vdw_get_amount.dataobject = 'd_inventory_line_counting_grid' then
			lb_managed_value = lb_obj.f_is_managed_value( ldb_dr_object_id)
			if not lb_managed_value then continue  //-- kiểm kê mặt hàng ko quản lý giá trị, ko ghi sổ tài khoản --//
		end if
	end if			

	//-- lấy ldb_base_amount ; ldb_amount --//
	ldb_base_amount = vdw_get_amount.getitemnumber(ll_row, lstr_post_account.s_col_base_amt )
	if isnull(ldb_base_amount) then ldb_base_amount = 0
	if lower(lstr_post_account.s_col_base_amt) = 'cogs' and ldb_base_amount = 0 then
		if lower(lstr_post_account.s_dr_object_type) = 'item' then
			ldb_base_amount = lb_obj.f_get_last_pur_price(ldb_dr_object_id)
			ldb_base_amount = this.ic_unit_instance.f_round(vdw_get_amount, ldb_round_id, ldb_base_amount * ldb_act_qty_sku)
		elseif  lower(lstr_post_account.s_cr_object_type) = 'item' then
			ldb_base_amount = lb_obj.f_get_last_pur_price(ldb_cr_object_id)
			ldb_base_amount = this.ic_unit_instance.f_round(vdw_get_amount, ldb_round_id, ldb_base_amount * ldb_act_qty_sku)
		end if
		ldb_amount = ldb_base_amount
	else
		ldb_amount = vdw_get_amount.getitemnumber(ll_row, lstr_post_account.s_col_amt)
	end if	
	if isnull(ldb_amount) then ldb_amount = 0
	//-- Đảo dấu số tiền tren form kiểm kê khi thiếu hàng --//
	if vdw_get_amount.dataobject = 'd_inventory_line_counting_grid' and ldb_amount < 0 then
		ldb_amount = - ldb_amount
	end if
	//-- Đảo dấu số tiền tren form kiểm kê khi thiếu hàng --//
	if vdw_get_amount.dataobject = 'd_inventory_line_counting_grid' and ldb_base_amount < 0 then
		ldb_base_amount = - ldb_base_amount
	end if
	
	//-- kiểm tra  ldb_base_amount ; ldb_amount --//
	if lstr_post_account.s_posting_type <> 'cogs' and ldb_base_amount = 0 & 
		and lstr_post_account.s_col_base_amt <> 'cogs' and pos(lstr_post_account.s_col_base_amt , 'base_amount') = 0 then continue 
	if lstr_post_account.s_col_base_amt = 'cogs' and lower(lstr_post_account.s_dr_object_type) <> 'item' and lower(lstr_post_account.s_cr_object_type) <> 'item' then continue
	if (ldb_base_amount = 0 or isnull(ldb_base_amount)) then
		if lower(lstr_post_account.s_dr_object_type) <> 'item' then
			if lower(lstr_post_account.s_cr_object_type) <> 'item' then
				if ll_row = vdw_get_amount.rowcount() then exit
				continue
			end if
		end if
	end if	
	
	//-- Lấy trans_text --//
	if vstr_post_info.s_dw_trans_text = left(vdw_get_amount.dataobject, len(vdw_get_amount.dataobject) - 5) then 
		ls_trans_text_dw = vdw_get_amount.getitemstring( ll_row ,vstr_post_info.s_col_trans_text)
	elseif not isnull(vstr_post_info.s_dw_trans_text) and vstr_post_info.s_dw_trans_text <> '' then
		ldw_master = vdw_get_amount.dynamic f_get_idw_master()
		if isvalid(ldw_master) then
			ldb_object_ref_id =  vdw_get_amount.getitemnumber(ll_row, 'object_ref_id')
			ll_master_row = ldw_master.find( "id = "+string(ldb_object_ref_id) , 1, ldw_master.rowcount())			
			if ll_master_row = 0 then ll_master_row = ldw_master.getrow()						
			if vstr_post_info.s_dw_trans_text = left(ldw_master.dataobject, len(ldw_master.dataobject) - 5) then 
				ls_trans_text_dw = ldw_master.getitemstring( ll_master_row, vstr_post_info.s_col_trans_text)	
			else
				ldb_object_ref_id =  ldw_master.getitemnumber(ll_master_row, 'object_ref_id')
				ldw_master = ldw_master.dynamic f_get_idw_master()
				if isvalid(ldw_master) then
					if vstr_post_info.s_dw_trans_text = left(ldw_master.dataobject, len(ldw_master.dataobject) - 5) then
						ll_master_row = ldw_master.find( "id = "+string(ldb_object_ref_id) , 1, ldw_master.rowcount())	
						if ll_master_row = 0 then ll_master_row = ldw_master.getrow()								
						ls_trans_text_dw = ldw_master.getitemstring( ll_master_row, vstr_post_info.s_col_trans_text)
					end if
				end if
			end if
		end if
	end if
	if isnull(ls_trans_text_dw) then ls_trans_text_dw =''		
	//-- kiểm tra tài khoản nợ--//
	if (  lstr_post_account.s_dr_object_type = 'ACCOUNT') and ldb_dr_object_id > 0 then
		//-- Kiểm tra TK quản lý đối trượng --//
		if lb_obj.f_get_object_control_yn( ldb_dr_object_id) = 'Y' then
			gf_messagebox('m.b_doc.f_insert_post_line.05','Thông báo','TK có quản lý đối tượng không được ghi sổ trực tiếp: @' + lb_obj.f_get_object_code( ldb_dr_object_id)  ,'exclamation','ok',1)
			rollback using lt_transaction;				
			return -1
		end if		
		//-- lấy acct trên v_dw_get_amt --//
		ldb_dr_account_id = ldb_dr_object_id
	else
		ldb_dr_account_id = lstr_post_account.db_dr_account
		if lstr_post_account.s_dr_object_type = 'ACCOUNT'  and ldb_dr_object_id = 0 or isnull(ldb_dr_object_id) then
			ldb_dr_object_id = ldb_dr_account_id
		end if
	end if	
	//-- kiểm tra TK Nợ bắt quản lý tiếu khoản --//
	lb_obj.f_get_account_info_yn( ldb_dr_account_id, ls_subacct_yn, ls_acct_type)
	
	if ls_subacct_yn = 'Y'  then
		if isnull(ldb_dr_subacct_id) or ldb_dr_subacct_id = 0 then
			gf_messagebox('m.b_doc.f_insert_post_line.06','Thông báo','Tài khoản sau bắt buộc có tiểu khoản: @' + lb_obj.f_get_object_code( ldb_dr_account_id)  ,'exclamation','ok',1)
			rollback using lt_transaction;				
			return -1			
		end if
	end if	
	if ls_acct_type = 'TOTAL'  then
		gf_messagebox('m.b_doc.f_insert_post_line.07','Thông báo','Tài khoản sau là loại TK tổng: không được định khoản: @' + lb_obj.f_get_object_code( ldb_dr_account_id)  ,'exclamation','ok',1)
		rollback using lt_transaction;				
		return -1			
	end if	
	
	//-- kiểm tra tài khoản có--//
	if ( lstr_post_account.s_cr_object_type = 'ACCOUNT' ) and ldb_cr_object_id > 0  then
		//-- Kiểm tra TK quản lý đối trượng --//
		if lb_obj.f_get_object_control_yn( ldb_cr_object_id) = 'Y' then
			gf_messagebox('m.b_doc.f_insert_post_line.05','Thông báo','Tài khoản có quản lý đối tượng không được ghi sổ trực tiếp: @' + lb_obj.f_get_object_code( ldb_cr_object_id)  ,'exclamation','ok',1)
			rollback using lt_transaction;				
			return -1
		end if			
		//-- lấy acct trên v_dw_get_amt --//
		ldb_cr_account_id = ldb_cr_object_id
	else
		ldb_cr_account_id = lstr_post_account.db_cr_account
		if lstr_post_account.s_cr_object_type = 'ACCOUNT'  and ldb_cr_object_id = 0 or isnull(ldb_cr_object_id) then
			ldb_cr_object_id = ldb_cr_account_id
		end if		
	end if	
	ls_posting_type = lstr_post_account.s_posting_type
	//-- kiểm tra TK Có bắt quản lý tiếu khoản --//
	ls_subacct_yn = ''
	ls_acct_type = ''
	lb_obj.f_get_account_info_yn( ldb_cr_object_id, ls_subacct_yn, ls_acct_type)
	if ls_subacct_yn = 'Y'  then
		if isnull(ldb_cr_subacct_id) or ldb_cr_subacct_id = 0 then
			gf_messagebox('m.b_doc.f_insert_post_line.06','Thông báo','Tài khoản sau bắt buộc có tiểu khoản: @' + lb_obj.f_get_object_code( ldb_cr_object_id)  ,'exclamation','ok',1)
			rollback using lt_transaction;				
			return -1			
		end if
	end if
	if ls_acct_type = 'TOTAL'  then
		gf_messagebox('m.b_doc.f_insert_post_line.07','Thông báo','Tài khoản sau là loại TK tổng: không được định khoản: @' + lb_obj.f_get_object_code( ldb_cr_object_id)  ,'exclamation','ok',1)
		rollback using lt_transaction;				
		return -1			
	end if		
	//-- kiểm tra xem user có sửa tài khoản trực tiếp trên post_line không ? --//
	// Nếu user thay đổi tài khoản khác với cài đặt popup câu hỏi xác nhận với user? --//
	if lb_accounted	and not lb_create_account then
		if ls_posting_type= 'NULL' then //// or isnull(ls_posting_type)
			select count(id) into :li_cnt from post_line
			where post_type is null 
			and dr_account_id = :ldb_dr_account_id 
			and cr_account_id = :ldb_cr_account_id 
			and DR_OBJECT_ID = :ldb_dr_object_id
			and CR_OBJECT_ID = :ldb_cr_object_id
			and TRANS_AMT = :ldb_amount 
			and doc_id = :vdb_doc_id
			using sqlca;
			if li_cnt = 0 then
				li_response = gf_messagebox('m.b_doc.f_insert_post_line.01','Thông báo','Tài khoản hoặc số tiền đã được thay đổi khác với cài đặt, ban có muốn tạo lại không?','question','yesno',2)
				if li_response = 1 then					
					delete post_line where doc_id =:vdb_doc_id using sqlca;
					commit using sqlca ;		
					lb_create_account = true
				else
					destroy rds_post_line
					destroy lds_matching
					return 0
				end if				
			end if
		else	
			select count(id) into :li_cnt from post_line
			where post_type = :ls_posting_type
			and dr_account_id = :ldb_dr_account_id 
			and cr_account_id = :ldb_cr_account_id 
			and DR_OBJECT_ID = :ldb_dr_object_id
			and CR_OBJECT_ID = :ldb_cr_object_id			
			and TRANS_AMT = :ldb_amount 
			and doc_id = :vdb_doc_id
			using sqlca;
			if li_cnt = 0 then
				li_response = gf_messagebox('m.b_doc.f_insert_post_line.01','Thông báo','Tài khoản hoặc số đã được thay đổi khác với cài đặt, ban có muốn tạo lại không?','question','yesno',2)
				if li_response = 1 then					
					delete post_line where doc_id =:vdb_doc_id using sqlca;
					commit using sqlca ;		
					lb_create_account = true
				else
					destroy rds_post_line
					destroy lds_matching
					return 0
				end if				
			end if			
		end if
	end if
	

	//-- Xứ lý ngoại tệ tiền thuế và chênh lệch tỷ giá --//	
	if  ldb_base_curr <> vdb_currency_id then 
		//-- xử lý thuế: quy đổi tiền thuế ngược lại ngoại tệ --//
		if lstr_post_account.s_posting_type = 'tax' then
			if ldb_amount > 0 then
				ldb_exrate_amt = ic_unit_instance.f_round( lt_transaction, ldb_round_id,  ldb_base_amount/ldb_amount)
			else
				ldb_exrate_amt = 0
			end if
		end if	
		//-- xử lý base_amount khi có chênh lẹch tỷ giá --//
		if upper(vdw_get_amount.describe( "DataWindow.Table.UpdateTable")) = 'PAYMENT_LINE' then
			laa_data[1] = vdw_get_amount.getitemnumber(ll_row, 'id')
			laa_data[2] = 'PAYMENT_LINE'
			lds_matching.f_add_where( 't_ref_id;t_ref_table', laa_data[])				
			if lds_matching.retrieve( ) > 0 then
				ldb_post_line_id[] = lds_matching.object.f_ref_id.Primary.Current
				
				lc_string.f_arraytostring( ldb_post_line_id[], ';', ls_f_post_line_str)
				laa_data_postline[1] = '('+ls_f_post_line_str+')'					
				lds_f_post_line.f_add_where( 'ID', laa_data_postline[])
				if lds_f_post_line.retrieve( ) > 0 then						
					ldb_object_ref_id = vdw_get_amount.getitemnumber(ll_row, 'id')
					ls_object_ref_table =  upper(vdw_get_amount.describe( "DataWindow.Table.UpdateTable"))	
					if this.f_create_exrate_post_line_ex(ldb_dr_object_id,ldb_cr_object_id,lds_f_post_line, ldb_amount,ldb_base_amount, vdb_currency_id,ldb_exrate_amt, ld_trans_date, vdb_doc_id, ldb_object_ref_id, ls_object_ref_table, lstr_post_account, rds_post_line) = -1 then
						rollback using lt_transaction;
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
	rds_post_line.setitem(ll_insert_row,'id', this.f_create_id( ) )
	rds_post_line.setitem(ll_insert_row,'branch_id', vdb_branch_id )
	rds_post_line.setitem(ll_insert_row,'dr_object_type', upper(lstr_post_account.s_dr_object_type ))
	rds_post_line.setitem(ll_insert_row,'dr_object_id', ldb_dr_object_id)
	rds_post_line.setitem(ll_insert_row,'trans_text', lstr_post_account.s_trans_text +'-'+ ls_trans_text_dw)
//	if lstr_post_account.s_post_type_text =''  then lstr_post_account.s_post_type_text = ls_trans_text_dw
	if lstr_post_account.s_post_type_text =''  then
		rds_post_line.setitem(ll_insert_row,'post_type_text', ls_trans_text_dw )
	else
		rds_post_line.setitem(ll_insert_row,'post_type_text', lstr_post_account.s_post_type_text )
	end if	
//	rds_post_line.setitem(ll_insert_row,'post_type_text', lstr_post_account.s_post_type_text )
	rds_post_line.setitem(ll_insert_row,'dr_account_id', ldb_dr_account_id)
	rds_post_line.setitem(ll_insert_row,'dr_subaccount', ldb_dr_subacct_id )	
	rds_post_line.setitem(ll_insert_row,'cr_object_type', upper(lstr_post_account.s_cr_object_type ))
	rds_post_line.setitem(ll_insert_row,'cr_object_id', ldb_cr_object_id)
	rds_post_line.setitem(ll_insert_row,'cr_account_id',ldb_cr_account_id)
	rds_post_line.setitem(ll_insert_row,'cr_subaccount',ldb_cr_subacct_id )
	if ls_posting_type= 'NULL' then  setnull(ls_posting_type)		
	rds_post_line.setitem(ll_insert_row,'post_type', ls_posting_type)
	rds_post_line.setitem(ll_insert_row,'doc_id', vdb_doc_id)		
	rds_post_line.setitem(ll_insert_row,'object_ref_id',  vdw_get_amount.getitemnumber(ll_row, 'id'))
	rds_post_line.setitem(ll_insert_row,'object_ref_table', upper(vdw_get_amount.describe( "DataWindow.Table.UpdateTable")))
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
		rds_post_line.setitem(ll_insert_row,'not_accept',  vdw_get_amount.getitemstring(ll_row,ls_not_accept_col))
	end if	
	//-- kiểm tra xem user có sửa tài khoản trực tiếp trên post_line không ? --//
	
	
	if mod(ll_insert_row, 20) = 0  AND lb_create_account then
		if rds_post_line.update(true,false) = -1 then
			gf_messagebox('m.b_doc.f_insert_post_line.03','Thông báo','Không cập nhật được post line:@' +lt_transaction.sqlerrtext ,'exclamation','ok',1)
			rollback using lt_transaction;
			return -1
		end if	
		rds_post_line.reset()
		
	end if
	
NEXT
if lb_create_account then
	//-- destroy ds--//
	if rds_post_line.update(true,false) = -1 then
		gf_messagebox('m.b_doc.f_insert_post_line.03','Thông báo','Không cập nhật được postline :@' +lt_transaction.sqlerrtext ,'exclamation','ok',1)
		rollback using lt_transaction;
		return -1
	end if	
	destroy rds_post_line
	GarbageCollect ( )
	return 0
	
	//-- update cot sku ,cogs--//
	if  vdw_get_amount.rowcount()> 0 and lb_update_sku then
		if vdw_get_amount.update(true,false) = -1 then
			gf_messagebox('m.b_doc.f_insert_post_line.04','Thông báo','Không cập nhật được số lượng theo đơn vị tồn kho:@' +lt_transaction.sqlerrtext ,'exclamation','ok',1)
			rollback using lt_transaction;
			return -1
		end if	
		vdw_get_amount.resetupdate()	
	end if
	destroy lds_matching

	return 1
end if

destroy lds_matching
return 0
end function

public function integer f_create_post_line (double vdb_doc_id, double vdb_branch_id, double vdb_trans_hdr_id, string vs_new);/**********************************************************
Chức năng: Tạo định khoản cho chứng từ theo cài đặt ngiệp vụ ghi sổ
--------------------------------------------------------------------------------------------
Tham số: vdb_doc_id : ID của chứng từ cần ghi sổ
			 vs_new: hàm được viết optimize lại
---------------------------------------------------------------------
Return: 	 1 -> Thành công
			-1 -> Lỗi
==============================TrevietSoftware.com*/
t_ds_db						lds_trans_setup
t_dw_mpl					ldw_get_amount
c_string						lc_string
s_str_post_info				lstr_post_info, lstr_post_info_empty
s_str_post_account		lstr_post_acct_spec[], lstr_post_acct_group[], lstr_post_acct_all[] , lstrs_post_acct_empty[]

long					ll_row, ll_cnt, ll_rtn, ll_idx
string					ls_dw_get_mount,ls_dw_get_mount_tmp, ls_col_get_base_amount, ls_col_get_amount, ls_original_filter, ls_source_filter
string					ls_posting_type, ls_posting_type_tmp, ls_findString, ls_empty[], ls_rtn, ls_col_base_amt[]
double				ldb_currency_id
decimal				ldc_exrate
boolean				lb_skip

//-- Kiểm tra tham số truyền vào --//
if vdb_doc_id = 0 or isnull(vdb_doc_id) then 
	gf_messagebox('m.b_doc.f_create_post_line.01','Thông báo','Tham số ID chứng từ không hợp lệ !','exclamation','ok',1)
	return -1
end if
if vdb_trans_hdr_id = 0 or isnull(vdb_trans_hdr_id) then
	gf_messagebox('m.b_doc.f_create_post_line.03','Thông báo','Chứng từ chưa có giao dịch','exclamation','ok',1)
	return -1	
end if
//-- Lấy tỷ giá và loại tiền của chứng từ --//
this.f_get_currency_exrate_of_doc( ldb_currency_id, ldc_exrate)
if isnull(ldb_currency_id) or ldb_currency_id = 0 then 
	gf_messagebox('m.b_doc.f_create_post_line.04','Thông báo','Chứng từ chưa có loại tiền','exclamation','ok',1)
	return -1
end if
if isnull(ldc_exrate) or ldc_exrate = 0 then
	gf_messagebox('m.b_doc.f_create_post_line.05','Thông báo','Chứng từ chưa có tỷ giá','exclamation','ok',1)
	return -1
end if
//-- Lấy toàn bộ thông tin cài đặt nghiệp vụ của chứng từ --//
lds_trans_setup = create t_ds_db
if this.f_get_trans_setup(vdb_trans_hdr_id, lds_trans_setup) < 1 then
	gf_messagebox('m.b_doc.f_create_post_line.06','Thông báo','Giao dịch ghi sổ chưa cài đặt','exclamation','ok',1)
	destroy lds_trans_setup
	return -1		
end if

//-- Duyệt theo dw_get_amount --//
ll_row = 1
DO
	ls_posting_type_tmp = lds_trans_setup.getitemstring( ll_row, 'posting_type')
	if isnull(ls_posting_type_tmp) then  ls_posting_type_tmp= 'NULL' 
	ls_dw_get_mount_tmp = lds_trans_setup.getitemstring( ll_row, 'dw_get_amount')
	if isnull(ls_dw_get_mount_tmp) or ls_dw_get_mount_tmp=''  then
		gf_messagebox('m.b_doc.f_create_post_line.07','Thông báo','Giao dịch ghi sổ chưa cài đặt dw giá trị','exclamation','ok',1)
		return -1		
	end if	

	if ls_dw_get_mount_tmp <> ls_dw_get_mount or ls_posting_type_tmp <> ls_posting_type then //-- thay đổi dw chứa giá trị ghi sổ --//		
		
		if ls_dw_get_mount_tmp <> ls_dw_get_mount then
			ls_dw_get_mount = ls_dw_get_mount_tmp
			//--** trả lại filter gốc --//
			if ls_original_filter <> '?' and ls_original_filter <> '' then
				ls_source_filter=lc_string.f_globalreplace(ls_original_filter,'~~','')
				ldw_get_amount.setfilter(ls_source_filter)
				ldw_get_amount.filter( )
				ls_original_filter = ''
			end if			
			
			ldw_get_amount = this.iw_display.dynamic f_get_dw(ls_dw_get_mount + '_grid'	)
			if isnull(ldw_get_amount) or not isvalid(ldw_get_amount) then
				gf_messagebox('m.b_doc.f_create_post_line.08','Thông báo','Không tìm dw giá trị trên chứng từ:@'+ls_dw_get_mount,'exclamation','ok',1)
				return -1				
			end if			
			//-- bỏ filter --//
			ls_original_filter = ldw_get_amount.describe( "datawindow.table.filter")
			if ls_original_filter <> '?' then
				this.f_doc_filter( ldw_get_amount.dataobject, true)				
			end if					
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
				ls_rtn = ldw_get_amount.Describe("Evaluate('Sum("+ ls_col_base_amt[ll_idx]+")', 0)")
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
			if ls_posting_type_tmp = 'NULL' then
				ls_findString = "dw_get_amount <> '"+ls_dw_get_mount_tmp+"' OR not isnull(posting_type)"
			else
				ls_findString = "dw_get_amount <> '"+ls_dw_get_mount_tmp+"' OR posting_type <>'"+ ls_posting_type_tmp +"'"
			end if
			
			ll_row = lds_trans_setup.find(ls_findString ,ll_row+1, lds_trans_setup.rowcount()+1)			
			continue //-- nhảy qua posting type tiếp theo--//
		end if
		
		//-- insert dw post_line --//			
		ll_rtn = this.f_insert_post_line( vdb_doc_id,vdb_branch_id,ldw_get_amount, ldb_currency_id,ldc_exrate, lstr_post_acct_spec[],lstr_post_acct_group[],lstr_post_acct_all[] ,lstr_post_info)

		if ll_rtn = -1 then return -1

	end if	

	if ls_posting_type = 'NULL' then
		ls_findString = "dw_get_amount <> '"+ls_dw_get_mount_tmp+"' OR not isnull(posting_type)"
	else
		ls_findString = "dw_get_amount <> '"+ls_dw_get_mount_tmp+"' OR posting_type <>'"+ ls_posting_type +"'"
	end if
	
	ll_row = lds_trans_setup.find(ls_findString ,ll_row+1, lds_trans_setup.rowcount()+1)
LOOP while ll_row > 0

//--** trả lại filter gốc --//
if ls_original_filter <> '?' and ls_original_filter <> '' then
	ls_source_filter=lc_string.f_globalreplace(ls_original_filter,'~~','')
	ldw_get_amount.setfilter(ls_source_filter)
	ldw_get_amount.filter( )
end if			

return 1
end function

public function integer f_get_trans_setup_account (double vdb_dr_object, double vdb_cr_object, string vs_condition_val, string vs_condition_coltype, s_str_post_account vstr_post_account_spec[], s_str_post_account vstr_post_account_grp[], s_str_post_account vstr_post_account_all[], s_str_post_info vstr_post_info, ref s_str_post_account rstr_post_account);/**********************
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
b_rule                lb_rule
b_obj_instantiate    lbo_instance

if isnull(vs_condition_val) then vs_condition_val = ''

if vdb_dr_object > 0 then
    ls_dr_objtype = this.f_get_object_type(vdb_dr_object )
    ls_dr_objtype_other = this.f_get_obj_type_other( vdb_dr_object, ls_dr_objtype)
elseif vdb_dr_object = 0 or isnull(vdb_dr_object) then
    ls_dr_objtype = vstr_post_info.s_dr_obj_type
end if
if vdb_cr_object > 0 then 
    ls_cr_objtype = this.f_get_object_type(vdb_cr_object )
    ls_cr_objtype_other = this.f_get_obj_type_other( vdb_cr_object, ls_cr_objtype)
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
            ldb_posting_grp = lbo_instance.f_get_posting_group(vdb_cr_object )
            ls_find_dr = ';'+ls_dr_objtype+';'+ ls_cr_objtype +';'+string(vdb_dr_object)+';' + string(ldb_posting_grp)+';'+ vs_condition_val+'['
		elseif vstr_post_account_spec[1].s_setup_type = 'specific;specific;' and vdb_dr_object > 0 and vdb_cr_object > 0  then
			ls_find_dr = ';'+ls_dr_objtype+';'+ ls_cr_objtype + ';'+string(vdb_dr_object)+';' +string(vdb_cr_object)+';' + vs_condition_val+'['
        	end if
        
        if vstr_post_account_spec[1].s_setup_type = 'all;specific;' then
            ls_find_cr = ';'+ls_dr_objtype+';'+ ls_cr_objtype + ';'+string(vdb_cr_object)+';' + vs_condition_val+'['
        elseif vstr_post_account_spec[1].s_setup_type = 'group;specific;' and  vdb_dr_object > 0 then
            ldb_posting_grp = lbo_instance.f_get_posting_group(vdb_dr_object )
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
                ldb_posting_grp = lbo_instance.f_get_posting_group(vdb_cr_object )
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
                    ldb_posting_grp = lbo_instance.f_get_posting_group(vdb_dr_object )
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
                ldb_posting_grp = lbo_instance.f_get_posting_group(vdb_cr_object )
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
                ldb_posting_grp = lbo_instance.f_get_posting_group(vdb_dr_object )
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
            lb_ok =  lb_rule.f_is_criteria_ok( vs_condition_val, ls_criteria_value_tmp, vs_condition_coltype)
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
            ldb_posting_grp = lbo_instance.f_get_posting_group(vdb_dr_object )
            if ldb_posting_grp < 1 then
                ls_obj_code = lbo_instance.f_get_code(vdb_dr_object)
                gf_messagebox('m.b_doc.f_get_setup_account.01.3','Thông báo','Đối tượng chưa được khai báo nhóm ghi sổ@'+ ls_obj_code,'stop','ok',1)
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
            ldb_posting_grp_offset = lbo_instance.f_get_posting_group(vdb_cr_object )
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
                ldb_posting_grp_offset = lbo_instance.f_get_posting_group(vdb_cr_object )
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
                ldb_posting_grp_offset = lbo_instance.f_get_posting_group(vdb_cr_object )
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
                ldb_posting_grp_offset = lbo_instance.f_get_posting_group(vdb_cr_object )
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
        ldb_posting_grp = lbo_instance.f_get_posting_group(vdb_cr_object )
            if ldb_posting_grp < 1 then
                ls_obj_code = lbo_instance.f_get_code(vdb_dr_object)
                gf_messagebox('m.b_doc.f_get_setup_account.01.3','Thông báo','Đối tượng chưa được khai báo nhóm ghi sổ@'+ ls_obj_code,'stop','ok',1)
                return -1            
            end if        
        end if
                
        if vstr_post_account_grp[li_grp_idx].s_setup_type = 'all;group;' then
            ls_find_cr = ';'+ls_dr_objtype+';'+ ls_cr_objtype +';'+string(ldb_posting_grp)+';' + vs_condition_val+'['
        elseif  vstr_post_account_grp[li_grp_idx].s_setup_type = 'group;group;' and  vdb_dr_object > 0 then
            ldb_posting_grp_offset = lbo_instance.f_get_posting_group(vdb_dr_object )
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
                ldb_posting_grp_offset = lbo_instance.f_get_posting_group(vdb_dr_object )
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
                ldb_posting_grp_offset = lbo_instance.f_get_posting_group(vdb_dr_object )
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
                ldb_posting_grp_offset = lbo_instance.f_get_posting_group(vdb_dr_object )
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
            ldb_posting_grp = lbo_instance.f_get_posting_group(vdb_dr_object )
            if ldb_posting_grp < 1 then
                ls_obj_code = lbo_instance.f_get_code(vdb_dr_object)
                gf_messagebox('m.b_doc.f_get_setup_account.01.3','Thông báo','Đối tượng chưa được khai báo nhóm ghi sổ@'+ ls_obj_code,'stop','ok',1)
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
                lb_ok =  lb_rule.f_is_criteria_ok( vs_condition_val, ls_criteria_value_tmp, vs_condition_coltype )
                
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
            ldb_posting_grp = lbo_instance.f_get_posting_group(vdb_cr_object )
            if ldb_posting_grp < 1 then
                ls_obj_code = lbo_instance.f_get_code(vdb_dr_object)
                gf_messagebox('m.b_doc.f_get_setup_account.01.3','Thông báo','Đối tượng chưa được khai báo nhóm ghi sổ@'+ ls_obj_code,'stop','ok',1)
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
                lb_ok =  lb_rule.f_is_criteria_ok( vs_condition_val, ls_criteria_value_tmp, vs_condition_coltype )

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
            lb_ok =  lb_rule.f_is_criteria_ok( vs_condition_val, ls_criteria_value_tmp, vs_condition_coltype )

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
gf_messagebox('m.b_doc.f_get_setup_account.01.3','Thông báo','Chưa cài đặt tài khoản ghi sổ','stop','ok',1)
return -1

end function

public function integer f_create_ds_4_posting (t_dw_mpl vdw_main, ref s_str_ds_4_posting rstr_ds_4_posting);string					ls_ref_table, ls_join_master1, ls_join_master2, ls_join_master3
string					ls_detail_ref_id_col, ls_detail_ref_table_col, ls_coltype, ls_ref_table_detail
int						li_cnt, li_idx1,li_idx2,li_idx3,li_idx4, li_idx
t_dw_mpl			ladw_details1[], ladw_details2[], ladw_details3[], ladw_details4[], ldw_bookslip, ladw_details[]
c_dwservice			ldw_serv


//ldw_bookslip = ladw_details[li_idx1] 
rstr_ds_4_posting.ds_details[1] = create t_ds_db
rstr_ds_4_posting.ds_details[1].dataobject =  vdw_main.dataobject	
rstr_ds_4_posting.ds_details[1].is_originalwhereClause =vdw_main.is_originalwhereClause
rstr_ds_4_posting.s_dataobject_str += left(vdw_main.dataobject,len(vdw_main.dataobject) - 5) +'['+string(1)+']'
rstr_ds_4_posting.ds_master[1] = create t_ds_db
rstr_ds_4_posting.ds_master[1].dataobject = vdw_main.dataobject
rstr_ds_4_posting.ds_master[1].is_originalwhereClause = vdw_main.is_originalwhereClause		
rstr_ds_4_posting.s_join_detail[1] =''

li_cnt = vdw_main.f_getdwdetails(ladw_details[])
FOR li_idx1 = 1 to li_cnt
	IF upper(ladw_details[li_idx1].describe("DataWindow.Table.UpdateTable")) = 'BOOKED_SLIP' THEN
		li_idx = upperbound(rstr_ds_4_posting.ds_details[]) + 1
		ldw_bookslip = ladw_details[li_idx1] 
		rstr_ds_4_posting.ds_details[li_idx] = create t_ds_db
		rstr_ds_4_posting.ds_details[li_idx].dataobject =  ldw_bookslip.dataobject	
		rstr_ds_4_posting.ds_details[li_idx].is_originalwhereClause =ldw_bookslip.is_originalwhereClause
		rstr_ds_4_posting.s_dataobject_str += left(ldw_bookslip.dataobject,len(ldw_bookslip.dataobject) - 5) +'['+string(li_idx)+']'
		rstr_ds_4_posting.ds_master[li_idx] = create t_ds_db
		rstr_ds_4_posting.ds_master[li_idx].dataobject = vdw_main.dataobject
		rstr_ds_4_posting.ds_master[li_idx].is_originalwhereClause = vdw_main.is_originalwhereClause		
		rstr_ds_4_posting.s_join_detail[li_idx] =''
		
		exit
	END IF
NEXT


li_cnt = ldw_bookslip.f_getdwdetails(ladw_details1[])

FOR li_idx1 = 1 TO li_cnt
	li_idx = upperbound(rstr_ds_4_posting.ds_details[]) + 1
	rstr_ds_4_posting.ds_details[li_idx] = create t_ds_db
	rstr_ds_4_posting.ds_details[li_idx].dataobject =  ladw_details1[li_idx1].dataobject	
	rstr_ds_4_posting.ds_details[li_idx].is_originalwhereClause = ladw_details1[li_idx1].is_originalwhereClause
	rstr_ds_4_posting.s_dataobject_str += left(ladw_details1[li_idx1].dataobject,len(ladw_details1[li_idx1].dataobject) - 5) +'['+string(li_idx)+']'
	rstr_ds_4_posting.ds_master[li_idx] = create t_ds_db
	rstr_ds_4_posting.ds_master[li_idx].dataobject = ldw_bookslip.dataobject
	rstr_ds_4_posting.ds_master[li_idx].is_originalwhereClause = ldw_bookslip.is_originalwhereClause
	ls_ref_table =  upper(ldw_bookslip.describe("DataWindow.Table.UpdateTable"))
	ls_detail_ref_id_col =  'object_ref_id'
	ls_detail_ref_table_col = 'object_ref_table'
	ldw_serv.f_get_build_column( ladw_details1[li_idx1],ls_detail_ref_id_col, ls_coltype)
	ldw_serv.f_get_build_column( ladw_details1[li_idx1],ls_detail_ref_table_col, ls_coltype)	
	ls_ref_table_detail = upper(ladw_details1[li_idx1].describe("DataWindow.Table.UpdateTable"))
	
	rstr_ds_4_posting.s_join_detail[li_idx] = " JOIN " + ls_ref_table + " ON " + ls_ref_table + ".id = "+ ls_detail_ref_id_col + " AND " + ls_detail_ref_table_col + " = ~~'"+ls_ref_table+"~~'"
	ls_join_master1 = " JOIN " + ls_ref_table + " ON " + ls_ref_table + ".id = "+ ls_ref_table_detail+".object_ref_id  AND " + ls_ref_table_detail + ".object_ref_table = ~~'"+ls_ref_table+"~~'"

	
	if ladw_details1[li_idx1].f_get_ib_master( ) then
		ladw_details1[li_idx1].f_getdwdetails(ladw_details2[])
		FOR li_idx2 = 1 to upperbound(ladw_details2[])
			li_idx = upperbound(rstr_ds_4_posting.ds_details[]) + 1
			
			rstr_ds_4_posting.ds_details[li_idx] = create t_ds_db
			rstr_ds_4_posting.ds_details[li_idx].dataobject =  ladw_details2[li_idx2].dataobject	
			rstr_ds_4_posting.ds_details[li_idx].is_originalwhereClause =  ladw_details2[li_idx2].is_originalwhereClause	
			rstr_ds_4_posting.s_dataobject_str += left(ladw_details2[li_idx2].dataobject, len(ladw_details2[li_idx2].dataobject) - 5) +'['+string(li_idx)+']'
			rstr_ds_4_posting.ds_master[li_idx] = create t_ds_db
			rstr_ds_4_posting.ds_master[li_idx].dataobject = ladw_details1[li_idx1].dataobject
			rstr_ds_4_posting.ds_master[li_idx].is_originalwhereClause = ladw_details1[li_idx1].is_originalwhereClause
			ls_ref_table =  upper(ladw_details1[li_idx1].describe("DataWindow.Table.UpdateTable"))
			ls_detail_ref_id_col =  'object_ref_id'
			ls_detail_ref_table_col = 'object_ref_table'
			ldw_serv.f_get_build_column( ladw_details2[li_idx2],ls_detail_ref_id_col, ls_coltype)
			ldw_serv.f_get_build_column( ladw_details2[li_idx2],ls_detail_ref_table_col, ls_coltype)
			ls_ref_table_detail = upper(ladw_details2[li_idx2].describe("DataWindow.Table.UpdateTable"))
			
			rstr_ds_4_posting.s_join_detail[li_idx] =  " JOIN " + ls_ref_table + " ON " + ls_ref_table + ".id = "+ ls_detail_ref_id_col + " AND " + ls_detail_ref_table_col +  " = ~~'"+ls_ref_table+"~~' " + ls_join_master1
			ls_join_master2 = " JOIN " + ls_ref_table + " ON " + ls_ref_table + ".id = "+ ls_ref_table_detail+".object_ref_id  AND " + ls_ref_table_detail + ".object_ref_table = ~~'"+ls_ref_table+"~~' " + ls_join_master1		
					
			if ladw_details2[li_idx2].f_get_ib_master( ) then								
				ladw_details2[li_idx2].f_getdwdetails(ladw_details3[])
				FOR li_idx3 = 1  to upperbound(ladw_details3[])
					li_idx = upperbound(rstr_ds_4_posting.ds_details[]) + 1
					
					rstr_ds_4_posting.ds_details[li_idx] = create t_ds_db
					rstr_ds_4_posting.ds_details[li_idx].dataobject =  ladw_details3[li_idx3].dataobject	
					rstr_ds_4_posting.ds_details[li_idx].is_originalwhereClause =  ladw_details3[li_idx3].is_originalwhereClause	
					rstr_ds_4_posting.s_dataobject_str += left(ladw_details3[li_idx3].dataobject, len(ladw_details3[li_idx3].dataobject) - 5)+'['+string(li_idx)+']'
					rstr_ds_4_posting.ds_master[li_idx] = create t_ds_db
					rstr_ds_4_posting.ds_master[li_idx].dataobject = ladw_details2[li_idx2].dataobject
					rstr_ds_4_posting.ds_master[li_idx].is_originalwhereClause = ladw_details2[li_idx2].is_originalwhereClause
					ls_ref_table =  upper(ladw_details2[li_idx2].describe("DataWindow.Table.UpdateTable"))
					
					ls_detail_ref_id_col =  'object_ref_id'
					ls_detail_ref_table_col = 'object_ref_table'
					ldw_serv.f_get_build_column( ladw_details3[li_idx3],ls_detail_ref_id_col, ls_coltype)
					ldw_serv.f_get_build_column( ladw_details3[li_idx3],ls_detail_ref_table_col, ls_coltype)
					ls_ref_table_detail = upper(ladw_details3[li_idx3].describe("DataWindow.Table.UpdateTable"))
				
					rstr_ds_4_posting.s_join_detail[li_idx] =  " JOIN " + ls_ref_table + " ON " + ls_ref_table + ".id = "+ ls_detail_ref_id_col + " AND " + ls_detail_ref_table_col + " = ~~'"+ls_ref_table+"~~' " + ls_join_master2 
					ls_join_master3 = " JOIN " + ls_ref_table + " ON " + ls_ref_table + ".id = "+ ls_ref_table_detail+".object_ref_id  AND " + ls_ref_table_detail + ".object_ref_table = ~~'"+ls_ref_table+"~~' " + ls_join_master2		

					if ladw_details3[li_idx3].f_get_ib_master( ) then
						ladw_details3[li_idx3].f_getdwdetails(ladw_details4[])
						FOR  li_idx4 = 1 to upperbound(ladw_details4[])
							li_idx = upperbound(rstr_ds_4_posting.ds_details[]) + 1
							
							rstr_ds_4_posting.ds_details[li_idx] = create t_ds_db
							rstr_ds_4_posting.ds_details[li_idx].dataobject =  ladw_details4[li_idx4].dataobject	
							rstr_ds_4_posting.ds_details[li_idx].is_originalwhereClause =  ladw_details4[li_idx4].is_originalwhereClause	
							rstr_ds_4_posting.s_dataobject_str += left(ladw_details4[li_idx4].dataobject, len(ladw_details4[li_idx4].dataobject) - 5) +'['+string(li_idx)+']'
							rstr_ds_4_posting.ds_master[li_idx] = create t_ds_db
							rstr_ds_4_posting.ds_master[li_idx].dataobject = ladw_details3[li_idx3].dataobject
							rstr_ds_4_posting.ds_master[li_idx].is_originalwhereClause = ladw_details3[li_idx3].is_originalwhereClause
							ls_ref_table =  upper(ladw_details3[li_idx3].describe("DataWindow.Table.UpdateTable"))
							
							ls_detail_ref_id_col =  'object_ref_id'
							ls_detail_ref_table_col = 'object_ref_table'
							ldw_serv.f_get_build_column( ladw_details4[li_idx4],ls_detail_ref_id_col, ls_coltype)
							ldw_serv.f_get_build_column( ladw_details4[li_idx4],ls_detail_ref_table_col, ls_coltype)

							rstr_ds_4_posting.s_join_detail[li_idx] =  " JOIN " + ls_ref_table + " ON " + ls_ref_table + ".id = "+ ls_detail_ref_id_col + " AND " + ls_detail_ref_table_col +  " = ~~'"+ls_ref_table+"~~' " + ls_join_master3 
													
						NEXT
					end if
				NEXT
			end if
		NEXT
	end if	
NEXT

return upperbound(rstr_ds_4_posting.ds_details[])
end function

protected function integer f_get_posting_trans_text_multi (double vdb_doc_version, s_str_post_info vstr_post_info, t_ds_db vds_get_amount, long vl_handle_row, ref string rs_trans_text_dw, ref t_transaction rt_transaction, ref s_str_ds_4_posting rstr_ds_4_posting);long			ll_master_row
double		ldb_object_ref_id
string			ls_dwo_master, ls_colname, ls_coltype
int				li_chr_nbr, li_idx_master, li_pos_s, li_pos_e

c_dwservice		l_dwservice

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

protected function integer f_get_posting_condition_multi (double vdb_doc_version, s_str_post_info vstr_post_info, t_ds_db vds_get_amount, long vl_handle_row, ref string rs_condition_val, ref string rs_condition_coltype, ref t_transaction rt_transaction, ref s_str_ds_4_posting rstr_ds_4_posting);long			ll_master_row
double		ldb_object_ref_id
string			ls_dwo_master, ls_colname, ls_coltype, ls_updTable
int				li_chr_nbr, li_idx_master, li_pos_s, li_pos_e
c_dwservice		l_dwservice

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

public function integer f_get_ds_of_streamvalue (double vdb_doc_version, ref t_ds_db rdw_item, ref t_ds_db rdw_f_object, ref t_ds_db rdw_t_object, ref t_ds_db rdw_item_value, ref t_ds_db rdw_item_lot, ref t_ds_db rdw_currency, integer vi_idx, ref s_str_ds_4_posting rstr_ds_4_posting, ref t_transaction rt_transaction);//-- Lấy dw trên form theo cài đặt streamvalue structure: để thực hiện update item balance --//
string						ls_colname, ls_coltype
int							li_idx, li_pos_s, li_pos_e, li_chr_nbr
c_string					lc_string
c_dwservice				l_dwservice	

//-- Lấy dw --//
if lower(this.istr_streamvalue[vi_idx].s_item_dwo) = 'none' then return 0

li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(this.istr_streamvalue[vi_idx].s_item_dwo, len(this.istr_streamvalue[vi_idx].s_item_dwo) - 5 ) + '[')
li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
li_chr_nbr = li_pos_e - (li_pos_s + len(this.istr_streamvalue[vi_idx].s_item_dwo ) - 4 )
li_idx = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(this.istr_streamvalue[vi_idx].s_item_dwo ) - 4 , li_chr_nbr ))

rdw_item = rstr_ds_4_posting.ds_details[li_idx]						

if not isvalid(rdw_item) then
	gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.01','Thông báo','DW mã hàng trong streamvalue structure không hợp lệ','stop','ok',1)		
	return -1
end if
if rdw_item.rowcount() = 0 then 
	IF upper(rdw_item.describe("DataWindow.Table.UpdateTable")) <> 'BOOKED_SLIP' THEN		
		rdw_item.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " booked_slip.ID = " + string(vdb_doc_version) , " AND " )
	else
		ls_colname = 'ID'
		l_dwservice.f_get_build_column(rdw_item, ls_colname, ls_coltype)
		rdw_item.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " "+ ls_colname+" = " + string(vdb_doc_version) , " AND " )
	end if
	rdw_item.f_settransobject(rt_transaction)								
	rdw_item.event e_retrieve()
end if 
if this.istr_streamvalue[vi_idx].s_f_obj_dwo = this.istr_streamvalue[vi_idx].s_item_dwo then
	rdw_f_object = rdw_item
else	
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(this.istr_streamvalue[vi_idx].s_f_obj_dwo, len(this.istr_streamvalue[vi_idx].s_f_obj_dwo) - 5) + '[')
	li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
	li_chr_nbr = li_pos_e - (li_pos_s + len(this.istr_streamvalue[vi_idx].s_f_obj_dwo ) - 4 )
	li_idx = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(this.istr_streamvalue[vi_idx].s_f_obj_dwo) - 4 , li_chr_nbr ))
	
	rdw_f_object = rstr_ds_4_posting.ds_details[li_idx]					
	if not isvalid(rdw_f_object) then
		gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.02','Thông báo','DW đối tượng FROM trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if	
	if rdw_f_object.rowcount() = 0 then 
		IF upper(rdw_f_object.describe("DataWindow.Table.UpdateTable")) <> 'BOOKED_SLIP' THEN		
			rdw_f_object.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " booked_slip.ID = " + string(vdb_doc_version) , " AND " )
		else
			ls_colname = 'ID'
			l_dwservice.f_get_build_column(rdw_f_object, ls_colname, ls_coltype)
			rdw_f_object.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " "+ ls_colname+" = " + string(vdb_doc_version) , " AND " )
		end if		
		
		rdw_f_object.f_settransobject(rt_transaction)			
		rdw_f_object.event e_retrieve()
	end if
end if

if this.istr_streamvalue[vi_idx].s_t_obj_dwo = this.istr_streamvalue[vi_idx].s_item_dwo then
	rdw_t_object = rdw_item
else
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(this.istr_streamvalue[vi_idx].s_t_obj_dwo, len(this.istr_streamvalue[vi_idx].s_t_obj_dwo) - 5) + '[')
	li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
	li_chr_nbr = li_pos_e - ( li_pos_s + len(this.istr_streamvalue[vi_idx].s_t_obj_dwo ) - 4 )
	li_idx = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(this.istr_streamvalue[vi_idx].s_t_obj_dwo ) - 4 , li_chr_nbr ))
	
	rdw_t_object = rstr_ds_4_posting.ds_details[li_idx]						
	if not isvalid(rdw_t_object) then
		gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.03','Thông báo','DW đối tượng TO trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if	
	if rdw_t_object.rowcount() = 0 then 
		IF upper(rdw_t_object.describe("DataWindow.Table.UpdateTable")) <> 'BOOKED_SLIP' THEN	
			rdw_t_object.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " booked_slip.ID = " + string(vdb_doc_version) , " AND " )
		else
			ls_colname = 'ID'
			l_dwservice.f_get_build_column(rdw_t_object, ls_colname, ls_coltype)			
			rdw_t_object.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " "+ ls_colname+" = "  + string(vdb_doc_version) , " AND " )
		end if
		rdw_t_object.f_settransobject(rt_transaction)			
		rdw_t_object.event e_retrieve()
	end if
end if
//-- lây dw giá trị --//

if this.istr_streamvalue[vi_idx].s_item_dwo = this.istr_streamvalue[vi_idx].s_value_dwo then
	rdw_item_value = rdw_item
elseif this.istr_streamvalue[vi_idx].s_value_dwo <> '' then	
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(this.istr_streamvalue[vi_idx].s_value_dwo, len(this.istr_streamvalue[vi_idx].s_value_dwo) - 5) + '[')
	li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
	li_chr_nbr = li_pos_e - (li_pos_s + len(this.istr_streamvalue[vi_idx].s_value_dwo) - 4 )
	li_idx = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(this.istr_streamvalue[vi_idx].s_value_dwo ) - 4 , li_chr_nbr ))
	
	rdw_item_value = rstr_ds_4_posting.ds_details[li_idx]			

	if not isvalid(rdw_item_value) then
		gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.04','Thông báo','DW giá trị hàng trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if			
	if rdw_item_value.rowcount() = 0 then 
		IF upper(rdw_item_value.describe("DataWindow.Table.UpdateTable")) <> 'BOOKED_SLIP' THEN	
			rdw_item_value.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " booked_slip.ID = " + string(vdb_doc_version) , " AND " )
		else 
			ls_colname = 'ID'
			l_dwservice.f_get_build_column(rdw_item_value, ls_colname, ls_coltype)				
			rdw_item_value.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " "+ ls_colname+" = " + string(vdb_doc_version) , " AND " )
		end if
		rdw_item_value.f_settransobject(rt_transaction)			
		rdw_item_value.event e_retrieve()
	end if	
	
end if

//-- Lấy dw lot--//
if this.istr_streamvalue[vi_idx].s_item_lot_dwo <> '' and left(this.istr_streamvalue[vi_idx].s_item_lot_dwo, 3) <> 'ds_' then
	
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(this.istr_streamvalue[vi_idx].s_item_lot_dwo, len(this.istr_streamvalue[vi_idx].s_item_lot_dwo) - 5) + '[')
	li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
	li_chr_nbr = li_pos_e -( li_pos_s + len(this.istr_streamvalue[vi_idx].s_item_lot_dwo ) - 4)
	li_idx = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(this.istr_streamvalue[vi_idx].s_item_lot_dwo) - 4 , li_chr_nbr ))
	
	rdw_item_lot = rstr_ds_4_posting.ds_details[li_idx]			
	
	if not isvalid(rdw_item_lot) then
		gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.05','Thông báo','DW item_lot trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if
	if rdw_item_lot.rowcount() = 0 then 
		IF upper(rdw_item_lot.describe("DataWindow.Table.UpdateTable")) <> 'BOOKED_SLIP' THEN	
			rdw_item_lot.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " booked_slip.ID = " + string(vdb_doc_version) , " AND " )
		else
			ls_colname = 'ID'
			l_dwservice.f_get_build_column(rdw_item_lot, ls_colname, ls_coltype)					
			rdw_item_lot.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " "+ ls_colname+" = " + string(vdb_doc_version) , " AND " )
		end if
		rdw_item_lot.f_settransobject(rt_transaction)			
		rdw_item_lot.event e_retrieve()
	end if		
	
end if

//-- lấy dw currency --//
if this.istr_streamvalue[vi_idx].s_currency_dwo <> '' then
	
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(this.istr_streamvalue[vi_idx].s_currency_dwo, len(this.istr_streamvalue[vi_idx].s_currency_dwo) - 5) + '[')
	li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
	li_chr_nbr = li_pos_e - (li_pos_s + len(this.istr_streamvalue[vi_idx].s_currency_dwo ) - 4 )
	li_idx = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(this.istr_streamvalue[vi_idx].s_currency_dwo ) - 4 , li_chr_nbr ))
	
	rdw_currency = rstr_ds_4_posting.ds_details[li_idx]		
	
	if not isvalid(rdw_currency) then
		gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.06','Thông báo','DW currency trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if
	if rdw_currency.rowcount() = 0 then 
		IF upper(rdw_currency.describe("DataWindow.Table.UpdateTable")) <> 'BOOKED_SLIP' THEN
			rdw_currency.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " booked_slip.ID = " + string(vdb_doc_version) , " AND " )
		else
			ls_colname = 'ID'
			l_dwservice.f_get_build_column(rdw_currency, ls_colname, ls_coltype)							
			rdw_currency.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " "+ ls_colname+" = "  + string(vdb_doc_version) , " AND " )
		end if
		rdw_currency.f_settransobject(rt_transaction)			
		rdw_currency.event e_retrieve()
	end if			
end if
//-- Kết thúc lấy dw --//
return 1
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

public function integer f_booking_item_lot_multi (ref t_transaction rt_transaction, ref t_ds_db rds_stream, t_ds_db vdw_item, long vl_item_row, ref t_ds_db rpo_item_lot, any vaa_data[], date vd_trans_date, string vs_lot_yn, string vs_serial_yn, string vs_qty_yn, string vs_value_yn, string vs_post_type, double vdb_item_value, double vdb_item_base_value, double vdb_item_qty, t_ds_db vdw_f_object, t_ds_db vdw_t_object, string vas_col_item[], string vas_col_item_lot[], string vas_col_item_value[], string vas_col_f_object[], string vas_col_t_object[], double vdb_trans_uom, string vas_col_f_object_sv[], string vas_col_t_object_sv[], string vas_col_item_sv[], string vas_col_item_lot_sv[], string vas_col_item_value_sv[], string vs_item_ref_table, string vs_samecol_string, string vs_doc_type, double vdb_dwitem_id, double vdb_doc_id, t_ds_db vdw_currency, string vas_col_currency[], string vas_col_currency_sv[], ref s_str_ds_4_posting rstr_ds_4_posting);/**************************************************************************************
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
string						ls_original_filter, ls_sv_value_yn, ls_sv_qty_yn, ls_manage_qty_yn, ls_manage_value_yn
string						ls_base_curr_code, ls_base_curr_name
double					ldb_value_lot_seri,ldb_base_value_lot_seri, ldb_qty_lot_seri,  ldb_base_curr, ldb_invoiced_qty, ldb_invoicing_qty
double					ldb_round_id_trans, ldb_round_id_base

b_obj_instantiate		lobj_ins


if lobj_ins.f_get_item_managed_qty_value(vaa_data[1] ,ls_manage_qty_yn, ls_manage_value_yn) = -1 then return -1
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
	this.ic_unit_instance.f_get_base_cur(ldb_base_curr, ls_base_curr_code, ls_base_curr_name)	
	ldb_round_id_base = this.ic_unit_instance.f_get_round_id( ldb_round_id_base, 0, 'bc')		
	ldb_round_id_trans = vdw_currency.f_getitemany( vdw_currency.getrow(), vas_col_currency[1] )
	ldb_round_id_trans = this.ic_unit_instance.f_get_round_id( ldb_round_id_trans, 0, 'amount')	
end if

if vs_lot_yn = 'Y' then rpo_item_lot.setsort("lot_no a")
if vs_serial_yn = 'Y'  then rpo_item_lot.setsort("serial_no a")
rpo_item_lot.sort()

for ll_row = 1 to rpo_item_lot.rowcount( )				
	vaa_data[7] = rpo_item_lot.getitemstring( ll_row, vas_col_item_lot[2])
	vaa_data[8] = rpo_item_lot.getitemstring( ll_row, vas_col_item_lot[3])
	if isnull(vaa_data[7]) and  vs_lot_yn = 'Y'  then
		gf_messagebox('m.b_doc.f_booking_item.04','Thông báo','Mã hàng sau chưa nhập số lô:@'+this.f_get_code(vaa_data[1] ),'stop','ok',1)		
		rollback using rt_transaction;
		destroy rds_stream
		return -1					
	end if
	if isnull(vaa_data[8]) and  vs_serial_yn = 'Y'  then
		gf_messagebox('m.b_doc.f_booking_item.05','Thông báo','Mã hàng sau chưa nhập số seri:@'+this.f_get_code(vaa_data[1] ),'stop','ok',1)		
		rollback using rt_transaction;
		destroy rds_stream
		return -1						
	end if			
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
				ldb_value_lot_seri = this.ic_unit_instance.f_round( rt_transaction, ldb_round_id_trans,ldb_value_lot_seri)
				
				ldb_base_value_lot_seri =  vdb_item_base_value/vdb_item_qty * ldb_qty_lot_seri
				ldb_base_value_lot_seri = this.ic_unit_instance.f_round( rt_transaction, ldb_round_id_base,ldb_base_value_lot_seri)
				
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
	this.f_insert_item_balance_row_multi( rt_transaction, rpo_item_lot, ll_row, vdw_f_object, vdw_t_object, vd_trans_date, vs_post_type, vas_col_item_lot[], vas_col_item_value[], vas_col_f_object[], vas_col_t_object[], vaa_data[],  ls_sv_qty_yn, ls_sv_value_yn, vdb_trans_uom, vas_col_item_lot[1], ldb_base_value_lot_seri,  rstr_ds_4_posting,  vs_qty_yn, vs_value_yn )
//	this.f_insert_item_balance_row( rt_transaction, rpo_item_lot, ll_row, vdw_f_object, vdw_t_object, vd_trans_date, vs_post_type, vas_col_item_lot[], vas_col_item_value[], vas_col_f_object[], vas_col_t_object[], vaa_data[],  vs_qty_yn, vs_value_yn, vdb_trans_uom, vas_col_item_lot[1], ldb_base_value_lot_seri)

	//-- update steamvalue --//
	if upper(vs_post_type) = 'POST' then
		ll_insertrow_sv = rds_stream.event e_addrow( )		
		
		if  ls_sv_qty_yn = 'Y' and  ls_sv_value_yn = 'Y' then  //-- cập nhật stream_value GT --//
			li_rtn = this.f_update_streamvalue_multi( vdw_item, rds_stream, vas_col_item_value[], vas_col_item_value_sv[], vs_samecol_string, vl_item_row, ll_insertrow_sv,vdw_f_object, vas_col_f_object[], vas_col_f_object_sv[],vdw_t_object, vas_col_t_object[], vas_col_t_object_sv[], vdw_currency,vas_col_currency[], vas_col_currency_sv[], ldb_value_lot_seri, ldb_base_value_lot_seri, rstr_ds_4_posting)
//			li_rtn = this.f_update_streamvalue( vdw_item, rds_stream, vas_col_item_value[], vas_col_item_value_sv[], vs_samecol_string, vl_item_row, ll_insertrow_sv,vdw_f_object, vas_col_f_object[], vas_col_f_object_sv[],vdw_t_object, vas_col_t_object[], vas_col_t_object_sv[], vdw_currency,vas_col_currency[], vas_col_currency_sv[], ldb_value_lot_seri, ldb_base_value_lot_seri)

			if li_rtn = 1 then
				 li_rtn = this.f_update_streamvalue_multi(rpo_item_lot, rds_stream, vas_col_item_lot[], vas_col_item_lot_sv[], '', ll_row,ll_insertrow_sv)
			end if			
			if li_rtn = -1 then
				destroy rds_stream
				rollback using rt_transaction;
				return -1
			end if					
			
			li_rtn = this.f_postinsert_streamvalue(rds_stream , ll_insertrow_sv, ls_sv_value_yn,ls_sv_qty_yn, vs_item_ref_table, vdb_dwitem_ID, vs_doc_type, vdb_doc_id, vd_trans_date)
			if li_rtn = -1 then 
				destroy rds_stream
				rollback using rt_transaction;
				return -1
			end if
		elseif  ls_sv_qty_yn = 'Y' and  ls_sv_value_yn = 'N' and vs_value_yn = 'N' then  //-- cập nhật stream_value SL --//
			li_rtn = this.f_update_streamvalue_multi( vdw_item, rds_stream, vas_col_item[], vas_col_item_sv[], vs_samecol_string, vl_item_row,ll_insertrow_sv, vdw_f_object, vas_col_f_object[], vas_col_f_object_sv[], vdw_t_object, vas_col_t_object[], vas_col_t_object_sv[], rstr_ds_4_posting)
//			li_rtn = this.f_update_streamvalue(vdw_item, rds_stream, vas_col_item[], vas_col_item_sv[], vs_samecol_string, vl_item_row,ll_insertrow_sv, vdw_f_object, vas_col_f_object[], vas_col_f_object_sv[], vdw_t_object, vas_col_t_object[], vas_col_t_object_sv[])				

			if li_rtn = 1 then
				 li_rtn = this.f_update_streamvalue_multi(rpo_item_lot, rds_stream, vas_col_item_lot[], vas_col_item_lot_sv[], '', ll_row,ll_insertrow_sv)
			end if			
			if li_rtn = -1 then
				destroy rds_stream
				rollback using rt_transaction;
				return -1
			end if					
			
			li_rtn = this.f_postinsert_streamvalue(rds_stream , ll_insertrow_sv, ls_sv_value_yn,ls_sv_qty_yn, vs_item_ref_table, vdb_dwitem_ID, vs_doc_type, vdb_doc_id, vd_trans_date)
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

public function integer f_booking_item_multi (double vdb_doc_id, double vdb_doc_version, string vs_doctype, ref t_transaction rt_transaction, date vd_trans_date, string vs_post_type, string vs_qty_yn, string vs_value_yn, double vadb_related_doc_id[], ref s_str_ds_4_posting rstr_ds_4_posting);/**************************************************************************************
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
int							li_rtn, li_cnt, li_idx, li_pos_s, li_pos_e, li_chr_nbr, li_idx_master
long						ll_row, ll_row2, ll_insertrow_sv,ll_count, ll_row_itemmaster
any						laa_data[]
string						ls_lot_yn,ls_serial_yn, ls_item_ref_table, ls_samecol_string,ls_item_column_sv, ls_sv_qty_yn, ls_sv_value_yn
string						las_col_f_object[], las_col_f_object_sv[], las_col_t_object[], las_col_t_object_sv[], las_col_item[], las_col_item_sv[]
string						las_col_item_value[], las_col_item_value_sv[], las_col_item_lot[], las_col_item_lot_sv[], las_col_currency[], las_col_currency_sv[]
string						ls_where, ls_original_filter_lot,ls_original_filter_item, ls_ref_table, ls_manage_qty_yn, ls_manage_value_yn
double					ldb_trans_uom, ldb_item_id, ldb_dwitem_ID, ldb_value,ldb_base_value, ldb_qty, ldb_trans_charge_amt, ldb_base_charge_amt
double					ldb_itemmaster_ID


c_string					lc_string
t_ds_db					ldw_f_object,ldw_item,ldw_t_object,ldw_item_lot,ldw_item_value, ldw_currency
t_ds_db					lds_stream, lds_item_lot, ldw_master
b_obj_instantiate		lobj_ins

FOR li_idx = 1 to upperbound(this.istr_streamvalue[])
	ls_original_filter_item =''
	ls_original_filter_lot = ''	
	//-- Lấy ds --//
	li_rtn = this.f_get_ds_of_streamvalue(vdb_doc_version, ldw_item, ldw_f_object,ldw_t_object, ldw_item_value,ldw_item_lot,ldw_currency,li_idx, rstr_ds_4_posting, rt_transaction)
	if li_rtn = 0 then return 0
	if li_rtn = -1 then
		rollback using rt_transaction;
		return -1
	end if
	//-- Lấy dw col--//
	li_rtn = this.f_get_dwcol_of_streamvalue( las_col_f_object[], las_col_f_object_sv[], las_col_t_object[], las_col_t_object_sv[], las_col_item[], las_col_item_sv[],las_col_item_value[], las_col_item_value_sv[], las_col_item_lot[], las_col_item_lot_sv[], las_col_currency[], las_col_currency_sv[], li_idx)
	if li_rtn = 0 then return 0
	if li_rtn = -1 then
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
	ls_item_column_sv = istr_streamvalue[li_idx].s_item_column_sv
	ls_item_column_sv = lc_string.f_globalreplace(ls_item_column_sv , ' ', '')
	if right(ls_item_column_sv,1)<> ';' then ls_item_column_sv += ';'	
	FOR li_cnt = 1 to upperbound(las_col_item_lot_sv[])
		if pos(ls_item_column_sv, las_col_item_lot_sv[li_cnt]+';')> 0 then
			ls_samecol_string += las_col_item_lot_sv[li_cnt]+';'
		end if
	NEXT
	
	//-- Lấy dw lot--//
	if upper(vs_qty_yn) = 'Y' then
		if isvalid(ldw_item_lot) then
			//-- ghi nhớ lại filter hiện tại --//
			ls_original_filter_lot = ldw_item_lot.describe( "datawindow.table.filter")
		end if
	end if	
	
		li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(ldw_item.dataobject, len(ldw_item.dataobject) - 5) + '[')
		li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
		li_chr_nbr = li_pos_e - (li_pos_s + len(ldw_item.dataobject) - 4)
		li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(ldw_item.dataobject) - 4 , li_chr_nbr ))
		
		ldw_master = rstr_ds_4_posting.ds_master[li_idx_master]						
		ls_ref_table= upper(ldw_master.describe( "datawindow.table.updateTable"))
		if ls_ref_table = 'BOOKED_SLIP' then
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
				
				if ls_sv_value_yn = 'Y'  then
					ldb_value =  ldw_item.getitemnumber(ll_row,las_col_item_value[2]) //--trans value --//
					if isnull(ldb_value) then ldb_value =0			
					ldb_base_value =  ldw_item.getitemnumber(ll_row,las_col_item_value[3]) //--base value --//
					if isnull(ldb_base_value) then ldb_base_value =0		
					if las_col_item_value[3] = 'cogs' and ldb_base_value = 0 then
						ldb_base_value = lobj_ins.f_get_last_pur_price( ldb_item_id)	
						ldb_base_value = ldb_base_value * ldb_qty						
						ldb_value = ldb_base_value
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
				laa_data[4] = ldw_item.getitemnumber(ll_row,las_col_item[5]) 		//--Loc_ID--//
				laa_data[5] = datetime(vd_trans_date)										//--Trans_date--//
				laa_data[9] = gs_sob
				///-- kiểm tra item có quản lý số seri hoặc số lô không --//
				if lobj_ins.f_get_lot_or_serial_yn( laa_data[1], ls_lot_yn,ls_serial_yn) = -1 then
					gf_messagebox('m.b_doc.f_booking_item.01','Thông báo','Mã hàng không hợp lệ:@'+this.f_get_code(laa_data[1] ),'stop','ok',1)		
					rollback using rt_transaction;
					destroy lds_stream
					return -1
				end if
				
				//-- ghi sổ giá trị hoặc ghi sổ số lượng với mã hàng ko quản lý số  seri --//
				if (ls_serial_yn = 'N' and ls_lot_yn = 'N'  and (ls_sv_qty_yn ='Y' or ls_sv_value_yn ='Y' ) ) then  //-- (vs_value_yn = 'Y' and lb_managed_qty) OR and vs_qty_yn = 'Y' 
		
					laa_data[7] = '@'			//--Lot_no--//
					laa_data[8] = '@'			//--Serial_no--//
					//-- update item balance theo ngày --//
					ldb_qty = ldw_item.getitemnumber( ll_row,las_col_item[3])
					if isnull(ldb_qty) or ldb_qty = 0 then continue 
					if this.f_insert_item_balance_row_multi( rt_transaction, ldw_item, ll_row, ldw_f_object, ldw_t_object, vd_trans_date, vs_post_type, las_col_item[], las_col_item_value[], las_col_f_object[], las_col_t_object[], laa_data[], ls_sv_qty_yn, ls_sv_value_yn, ldb_trans_uom, las_col_item[3], ldb_base_value, rstr_ds_4_posting,vs_qty_yn, vs_value_yn ) = -1 then 
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
							li_rtn = this.f_update_streamvalue_multi( ldw_item, lds_stream, las_col_item_value[], las_col_item_value_sv[], '', ll_row, ll_insertrow_sv,ldw_f_object, las_col_f_object[], las_col_f_object_sv[],ldw_t_object, las_col_t_object[], las_col_t_object_sv[], ldw_currency,las_col_currency[], las_col_currency_sv[], ldb_value, ldb_base_value, rstr_ds_4_posting)
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
						elseif ls_sv_qty_yn = 'Y' and  ls_sv_value_yn = 'N' and vs_value_yn = 'N' then //-- cập nhật stream_value SL --//
							ll_insertrow_sv = lds_stream.event e_addrow( )
							if ll_insertrow_sv < 1 then 
								gf_messagebox('m.b_doc.f_booking_item.09','Thông báo','Không insert được stream','stop','ok',1)
								destroy lds_stream
								rollback using rt_transaction;
								return -1
							end if										
							li_rtn = this.f_update_streamvalue_multi( ldw_item, lds_stream, las_col_item[], las_col_item_sv[], '', ll_row,ll_insertrow_sv, ldw_f_object, las_col_f_object[], las_col_f_object_sv[],ldw_t_object, las_col_t_object[], las_col_t_object_sv[], rstr_ds_4_posting)								
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
					
				elseif (ls_serial_yn = 'Y'  or ls_lot_yn = 'Y') and (ls_sv_qty_yn ='Y' or ls_sv_value_yn ='Y' ) then //-- mặt hàng có quản lý seri/lot --//
					if not isvalid(ldw_item_lot) then
						if ls_sv_qty_yn = 'Y'     then
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
							
							this.f_booking_item_lot_multi( rt_transaction,lds_stream ,ldw_item, ll_row, lds_item_lot, laa_data[], vd_trans_date, ls_lot_yn, ls_serial_yn, vs_qty_yn, vs_value_yn, &
														vs_post_type, ldb_value,ldb_base_value, ldb_qty, ldw_f_object, ldw_t_object, las_col_item[], las_col_item_lot[], las_col_item_value[], las_col_f_object[], las_col_t_object[],&								
														ldb_trans_uom,las_col_f_object_sv[], las_col_t_object_sv[],las_col_item_sv[], las_col_item_lot_sv[],las_col_item_value_sv[], ls_item_ref_table, &
														ls_samecol_string, vs_doctype, ldb_dwitem_id, vdb_doc_id, ldw_currency,las_col_currency[], las_col_currency_sv[], rstr_ds_4_posting)							
														
						end if
					else
						ldw_item_lot.setfilter( "object_ref_id = "+string(ldb_dwitem_ID ))
						ldw_item_lot.filter( )					
						//-- tính tổng số lượng các lot/seri --//
						if  ldw_item_lot.rowcount( )	 > 0 then ldb_qty = double(ldw_item_lot.describe("Evaluate('Sum("+las_col_item_lot[1]+")', 0)"))		
						
						this.f_booking_item_lot_multi( rt_transaction,lds_stream ,ldw_item, ll_row, ldw_item_lot, laa_data[], vd_trans_date, ls_lot_yn, ls_serial_yn, vs_qty_yn, vs_value_yn, &
													vs_post_type, ldb_value,ldb_base_value, ldb_qty, ldw_f_object, ldw_t_object, las_col_item[], las_col_item_lot[], las_col_item_value[], las_col_f_object[], las_col_t_object[],&								
													ldb_trans_uom,las_col_f_object_sv[], las_col_t_object_sv[],las_col_item_sv[], las_col_item_lot_sv[],las_col_item_value_sv[], ls_item_ref_table, &
													ls_samecol_string, vs_doctype, ldb_dwitem_id, vdb_doc_id, ldw_currency,las_col_currency[], las_col_currency_sv[], rstr_ds_4_posting)	
						
					end if					
		
					
				end if
			NEXT			
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
					if ls_sv_value_yn = 'Y'  then
						ldb_value =  ldw_item.getitemnumber(ll_row,las_col_item_value[2]) //--trans value --//
						if isnull(ldb_value) then ldb_value =0			
						ldb_base_value =  ldw_item.getitemnumber(ll_row,las_col_item_value[3]) //--base value --//
						if isnull(ldb_base_value) then ldb_base_value =0	
						
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
					laa_data[4] = ldw_item.getitemnumber(ll_row,las_col_item[5]) 		//--Loc_ID--//
					laa_data[5] = datetime(vd_trans_date)										//--Trans_date--//
					laa_data[9] = gs_sob
					///-- kiểm tra item có quản lý số seri hoặc số lô không --//
					if lobj_ins.f_get_lot_or_serial_yn( laa_data[1], ls_lot_yn,ls_serial_yn) = -1 then
						gf_messagebox('m.b_doc.f_booking_item.01','Thông báo','Mã hàng không hợp lệ:@'+this.f_get_code(laa_data[1] ),'stop','ok',1)		
						rollback using rt_transaction;
						destroy lds_stream
						return -1
					end if
					
					//-- ghi sổ giá trị hoặc ghi sổ số lượng với mã hàng ko quản lý số  seri --//
					if (ls_serial_yn = 'N' and ls_lot_yn = 'N' and (ls_sv_qty_yn ='Y' or ls_sv_value_yn ='Y' ) ) then  //-- (vs_value_yn = 'Y' and lb_managed_qty) OR and vs_qty_yn = 'Y' 
			
						laa_data[7] = '@'			//--Lot_no--//
						laa_data[8] = '@'			//--Serial_no--//
						//-- update item balance theo ngày --//
						ldb_qty = ldw_item.getitemnumber( ll_row,las_col_item[3])
						if isnull(ldb_qty) or ldb_qty = 0 then continue 
						if this.f_insert_item_balance_row_multi( rt_transaction, ldw_item, ll_row, ldw_f_object, ldw_t_object, vd_trans_date, vs_post_type, las_col_item[], las_col_item_value[], las_col_f_object[], las_col_t_object[], laa_data[], ls_sv_qty_yn, ls_sv_value_yn, ldb_trans_uom, las_col_item[3], ldb_base_value, rstr_ds_4_posting,vs_qty_yn, vs_value_yn) = -1 then 
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
								li_rtn = this.f_update_streamvalue_multi( ldw_item, lds_stream, las_col_item_value[], las_col_item_value_sv[], '', ll_row, ll_insertrow_sv,ldw_f_object, las_col_f_object[], las_col_f_object_sv[],ldw_t_object, las_col_t_object[], las_col_t_object_sv[], ldw_currency,las_col_currency[], las_col_currency_sv[], ldb_value, ldb_base_value, rstr_ds_4_posting)
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
								
							elseif  ls_sv_qty_yn = 'Y' and  ls_sv_value_yn = 'N' and vs_value_yn = 'N' then //-- cập nhật stream_value SL --//
								ll_insertrow_sv = lds_stream.event e_addrow( )
								if ll_insertrow_sv < 1 then 
									gf_messagebox('m.b_doc.f_booking_item.09','Thông báo','Không insert được stream','stop','ok',1)
									destroy lds_stream
									rollback using rt_transaction;
									return -1
								end if								
								li_rtn = this.f_update_streamvalue_multi( ldw_item, lds_stream, las_col_item[], las_col_item_sv[], '', ll_row,ll_insertrow_sv, ldw_f_object, las_col_f_object[], las_col_f_object_sv[],ldw_t_object, las_col_t_object[], las_col_t_object_sv[], rstr_ds_4_posting)								
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
								
								this.f_booking_item_lot_multi( rt_transaction,lds_stream ,ldw_item, ll_row, lds_item_lot, laa_data[], vd_trans_date, ls_lot_yn, ls_serial_yn, vs_qty_yn, vs_value_yn, &
															vs_post_type, ldb_value,ldb_base_value, ldb_qty, ldw_f_object, ldw_t_object, las_col_item[], las_col_item_lot[], las_col_item_value[], las_col_f_object[], las_col_t_object[],&								
															ldb_trans_uom,las_col_f_object_sv[], las_col_t_object_sv[],las_col_item_sv[], las_col_item_lot_sv[],las_col_item_value_sv[], ls_item_ref_table, &
															ls_samecol_string, vs_doctype, ldb_dwitem_id, vdb_doc_id, ldw_currency,las_col_currency[], las_col_currency_sv[], rstr_ds_4_posting)															
								
							end if
						else
							ldw_item_lot.setfilter( "object_ref_id = "+string(ldb_dwitem_ID ))
							ldw_item_lot.filter( )					
							//-- tính tổng số lượng các lot/seri --//
							if  ldw_item_lot.rowcount( )	 > 0 then ldb_qty = double(ldw_item_lot.describe("Evaluate('Sum("+las_col_item_lot[1]+")', 0)"))		

							this.f_booking_item_lot_multi( rt_transaction,lds_stream ,ldw_item, ll_row, ldw_item_lot, laa_data[], vd_trans_date, ls_lot_yn, ls_serial_yn, vs_qty_yn, vs_value_yn, &
														vs_post_type, ldb_value,ldb_base_value, ldb_qty, ldw_f_object, ldw_t_object, las_col_item[], las_col_item_lot[], las_col_item_value[], las_col_f_object[], las_col_t_object[],&								
														ldb_trans_uom,las_col_f_object_sv[], las_col_t_object_sv[],las_col_item_sv[], las_col_item_lot_sv[],las_col_item_value_sv[], ls_item_ref_table, &
														ls_samecol_string, vs_doctype, ldb_dwitem_id, vdb_doc_id, ldw_currency,las_col_currency[], las_col_currency_sv[], rstr_ds_4_posting)																						
						end if														
					end if
				NEXT									
													
		end if
		
	//-- update cot sku ,cogs--//
	if ldw_item.update(true,false) = -1 then
		gf_messagebox('m.b_doc.f_booking_item.07','Thông báo','Không cập nhật được số lượng theo đơn vị tồn kho:@' +rt_transaction.sqlerrtext ,'exclamation','ok',1)
		rollback using rt_transaction;
		destroy lds_stream
		return -1
	end if	
	ldw_item.resetupdate()
	
	if lds_stream.update(true,false ) = -1 then
		gf_messagebox('m.b_doc.f_booking_item.08','Thông báo','Không cập nhật được steamvalue:@' +rt_transaction.sqlerrtext ,'exclamation','ok',1)
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
			gf_messagebox('m.b_doc.f_bookig_item.10','Thông báo','Cập nhật ghi sổ không thành công f_bookig_item(252)','exclamation','ok',1)
			Rollback using rt_transaction;
			return -1
		end if
//----------------------------------------------------------------------------//
destroy lds_stream
return 1
end function

public function integer f_booking_multi (double vdb_doc_id, double vdb_doc_version, date vd_trans_date, string vs_doctype, string vs_qty_yn, string vs_value_yn, double vadb_related_doc_id[], ref t_transaction rt_transaction, ref s_str_ds_4_posting rstr_ds_4_posting);//-- Hàm ghi sổ chứng từ
//-- Tham số: vl_doc_id :id của chứng từ (document)
t_ds_db 				lds_ledger_trans, lds_obj_post
c_dwservice			lc_dwsr

long 					ll_rtn


//-- Ghi sổ ledger_trans --//
lds_ledger_trans = create t_ds_db
if f_insert_ledger_trans(vdb_doc_id,vs_doctype, vd_trans_Date, rt_transaction, lds_ledger_trans) <> 1 then
	destroy lds_ledger_trans
	return -1
end if

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
lds_obj_post.dataobject = 'ds_ledger_balance_post_dr'
if this.f_insert_object_balance( vdb_doc_id,  vd_trans_Date, rt_transaction, lds_obj_post, 'post',gs_sob) <> 1 then
	destroy lds_obj_post
	return -1	
end if
//-- update object_balance đối tượng Có--**//
lds_obj_post.dataobject = 'ds_obj_balance_post_cr'
if this.f_insert_object_balance( vdb_doc_id,  vd_trans_Date, rt_transaction, lds_obj_post, 'post',gs_sob) <> 1 then
	destroy lds_obj_post
	return -1	
end if
//-- update ledger_balance đối tượng Có--//
lds_obj_post.dataobject = 'ds_ledger_balance_post_cr'
if this.f_insert_object_balance( vdb_doc_id,  vd_trans_Date, rt_transaction, lds_obj_post, 'post',gs_sob) <> 1 then
	destroy lds_obj_post
	return -1	
end if
//-- upstream value --//
ll_rtn = upperbound(istr_streamvalue[])
if ll_rtn > 0 then
	
	if this.f_booking_item_multi_ex(vdb_doc_id, vdb_doc_version, vs_doctype, rt_transaction,vd_trans_Date, 'post', vs_qty_yn,vs_value_yn, vadb_related_doc_id[], rstr_ds_4_posting) = -1 then return -1
end if

destroy lds_ledger_trans
destroy lds_obj_post
return 1
end function

public function integer f_reset_ds_4_posting (ref s_str_ds_4_posting rstr_ds_4_posting);
int						li_idx

FOR li_idx = 1 to upperbound(rstr_ds_4_posting.ds_details[])

	rstr_ds_4_posting.ds_details[li_idx].reset()
	rstr_ds_4_posting.ds_master[li_idx].reset()
NEXT

return upperbound(rstr_ds_4_posting.ds_details[])
end function

public function integer f_update_related_status_multi (double vdb_doc_id, string vs_doctype, string vs_post_status, boolean vb_post, ref string rs_doc_id_updated, ref t_transaction rt_transaction);/********************************************************************
Chức năng: cập nhật status của các chưng từ liên quan trực tiếp.
			- khi post : trạng thái chứng từ liên quan có thể là trạng thái 1 (full) hoặc 2 (partial) 
			- Khi unpost: trạng thái chứng từ có thể là 2 (partial) hoặc là trạng thái trước đó.	
			- Khi ghi sổ chứng từ thanh toán ( phiếu thu/chi, sổ phụ ngân hàng):
				//--+ Nếu có kết với hóa đơn thì cập nhất trạng thái hóa đơn là "PAID" hoặc "PARTIAL_PAID"và chứng từ thanh toán là "SETTLED" hoặc "PARTIAL_SETTLED'--//
				+ Nếu có kết với hóa đơn thì cập nhất trạng thái hóa đơn là "PAID" hoặc "PARTIAL_PAID"và chứng từ thanh toán là "SETTLED" hoặc "PARTIAL_SETTLED' (Long 26/07/2016)
				+ Nếu không kết hóa đơn thì trạng thái của chứng từ thanh toán vẫn là "BOOKED"
			- Khi dùng chức năng cấn trừ:
				+ Cấn trừ 2 hóa đơn với nhau: cập nhật trạng thái của 2 hóa đơn thành "SETTLED" hoặc "PARTIAL_SETTLED'
				//--+ Cấn trừ 1 hóa đơn với 1 chứng từ thanh toán: cập nhật trạng thái hóa đơn thành "PAID", chứng từ thanh toán thành "SETTLED"--//
				+Cấn trừ 1 hóa đơn với 1 chứng từ thanh toán: cập nhật trạng thái hóa đơn thành "SETTLED", chứng từ thanh toán thành "SETTLED" (Long 26/07/2016)
-------------------------------------------------------------------------------------------------------------
Tham số: vdb_doc_id: Id chứng từ thay đổi status
			 vs_post_status : trang thái post của chứng từ
			 vb_post: true : nghĩa là đang post chứng từ, false nghĩa là đang unpost chứng từ
			 rs_doc_id_updated: các doc_id đã được cập nhật trạng thái
------------------------------------------------------------------------------------------------------------
return: 1 thành công
		- 1 lỗi
====================================================TrevietSoftware.com*/
int				li_rtn
long			ll_cnt, ll_row, ll_pos
double		ldb_related_doc_id, ldb_mat_qty, ldb_remain_qty, ldb_remain_amount, ldb_object_id,ldb_mat_amount
double		ldb_bal_amount_TO, ldb_bal_amount_FR, ldb_mat_amount_TO, ldb_mat_amount_FR
string			ls_doctype, ls_related_doctype, ls_f_ref_table, ls_sql , ls_where,ls_status,  ls_status_partial, ls_related_status, ls_related_status_partial
string			ls_status_list,ls_dwo_minus

t_ds_db 			lds_related_doc, lds_line, lds_related_status
c_string			lc_string


s_str_dwo_related	lstr_data_related[]


lds_line = create t_ds_db
lds_related_status = create t_ds_db
lds_related_status.dataobject = 'ds_related_doc_status'
lds_related_status.f_settransobject( sqlca)

//this.iw_display.f_get_transaction(rt_transaction)
ls_status_list = " (~~'booked~~', ~~'invoiced~~',~~'partial_invoice~~',~~'full_issue~~', ~~'partial_issue~~', ~~'full_receive~~', ~~'partial_receive~~',~~'approved~~' ) "

ls_doctype = vs_doctype

lds_related_doc = create t_ds_db 
lds_related_doc.dataobject = 'ds_related_doc'
lds_related_doc.settransobject( rt_transaction)
ll_cnt = lds_related_doc.retrieve(vdb_doc_id )
if ll_cnt > 0 then
	
	//- Lấy object_id nếu là chứng từ ghi sổ --//
	if vs_doctype = 'BANK_VOUCHER' & 
	or vs_doctype = 'RECEIPT' & 
	or vs_doctype = 'BANK_VOUCHER_PAYMENT' & 
	or vs_doctype = 'PAYMENT' then
		select object_id into :ldb_object_id from  payment_line 
		join document on document.version_id = payment_line.object_ref_id 
		join object on object.id = payment_line.object_id and object.object_ref_table in ('VENDOR','CUSTOMER','STAFF')
		where document.id = :vdb_doc_id  using rt_transaction;
		
		if rt_transaction.sqlcode = -1 then
			gf_messagebox('m.b_doc.f_update_related_status.01','Thông báo','Không được thanh toán 2 đối tượng cùng một phiếu:@'+rt_transaction.sqlerrtext ,'stop','ok',1)
			rollback using rt_transaction;
			return -1
		end if
		
	elseif (vs_doctype = 'PUR_INVOICE' and vs_post_status = 'settled') &
	or (vs_doctype = 'SAL_INVOICE_RETURN' and vs_post_status = 'settled') then
	
		select dr_cr_object into :ldb_object_id from  booked_slip join document on document.version_id = booked_slip.id 
		where document.id = :vdb_doc_id using rt_transaction;
	end if
	if isnull(ldb_object_id) then ldb_object_id = 0 
end if

FOR ll_row = 1 to ll_cnt
	ldb_related_doc_id = lds_related_doc.getitemnumber(ll_row, 'related_doc_id')
	ls_f_ref_table = lds_related_doc.getitemstring(ll_row, 'f_ref_table')
	ls_related_doctype = lds_related_doc.getitemstring(ll_row, 'related_doc_type')
	
	if lds_related_status.retrieve(vs_doctype,vs_post_status, ls_related_doctype ) = 0 then continue //-- không cai đặt trạng thái liên quan thì bỏ qua--//
	
	//-- lấy str_related  --//
	if ll_row = 1 then
		li_rtn = this.f_get_data_related("u_"+lower(lds_related_status.getitemstring(1, 'related_doc_code')), lstr_data_related[])
		if li_rtn > 0 then
			if upperbound( lstr_data_related[li_rtn].s_match_minus_dwo[] )> 0 then
				if lstr_data_related[li_rtn].s_match_minus_dwo[1] <> '' then
					lds_line.dataobject =lc_string.f_globalreplace(  lstr_data_related[li_rtn].s_match_minus_dwo[1], ';', '')
					ls_dwo_minus = upper(lds_line.describe( "datawindow.table.update"))
				else
					//-- trường hợp match 2 bảng và có 2 dwo minus --//
				end if
			end if
		end if
	end if
	
	//----------------------------------------------------------------------------//
	//-- trường hợp thanh toán: phải cập nhật trạng thái chứng từ TO --//
	//---------------------------------------------------------------------------//
	if (vs_doctype = 'BANK_VOUCHER' and (vb_post or (vs_post_status =  'settled' and not vb_post)))  & 
	or (vs_doctype = 'RECEIPT' and (vb_post or (vs_post_status =  'settled' and not vb_post))) & 
	or (vs_doctype = 'BANK_VOUCHER_PAYMENT' and (vb_post or (vs_post_status =  'settled' and not vb_post))) & 
	or (vs_doctype = 'PAYMENT' and (vb_post or (vs_post_status =  'settled' and not vb_post))) &
	or (vs_doctype = 'PUR_INVOICE' and vs_post_status = 'settled') &
	or (vs_doctype = 'SAL_INVOICE_RETURN' and vs_post_status = 'settled') then
		//-------------------------------------//
		//--Tính toán amount đã match --//
		//------------------------------------//

		//-- Lấy tổng công nợ của chứng từ liên quan (FROM) --//
		SELECT SUM(NVL(DR_AMOUNT,0))+ SUM(NVL(CR_AMOUNT,0)) INTO :ldb_bal_amount_FR
		FROM OBJECT_TRANS 
		WHERE DOC_REF_ID = :ldb_related_doc_id AND OBJECT_ID = :ldb_object_id USING rt_transaction;			
		if isnull(ldb_bal_amount_FR) then ldb_bal_amount_FR = 0
		
		//-- Lấy tổng công nợ của chứng từ cấn trừ (TO) --//
		SELECT SUM(NVL(DR_AMOUNT,0))+ SUM(NVL(CR_AMOUNT,0)) INTO :ldb_bal_amount_TO
		FROM OBJECT_TRANS 
		WHERE DOC_REF_ID = :vdb_doc_id AND OBJECT_ID = :ldb_object_id USING rt_transaction;	
		if isnull(ldb_bal_amount_TO) then ldb_bal_amount_TO = 0
		
		//-- Lấy tổng đã matched của chứng từ liên quan (FROM)--//
		if ls_related_doctype = 'BANK_VOUCHER_PAYMENT' or ls_related_doctype = 'PAYMENT'  then
			//-- amount matched khi cấn trừ --//
			SELECT SUM(NVL(TRANS_VALUE,0)) INTO :ldb_mat_amount_FR
			FROM MATCHING 
			JOIN document on document.id = matching.t_doc_id and document.status in ('booked','settled','partial_settled','paid','partial_paid')
			WHERE F_DOC_ID = :ldb_related_doc_id USING rt_transaction;	
			if isnull(ldb_mat_amount_FR) then ldb_mat_amount_FR = 0
			//-- amount matched khi thanh toán bình thường --//
			SELECT SUM(NVL(TRANS_VALUE,0)) INTO :ldb_mat_amount_TO
			FROM MATCHING 
			JOIN document on document.id = matching.f_doc_id and document.status in ('booked','settled','partial_settled','paid','partial_paid')
			WHERE T_DOC_ID = :ldb_related_doc_id USING rt_transaction;	
			if isnull(ldb_mat_amount_TO) then ldb_mat_amount_TO = 0
			ldb_mat_amount_FR = ldb_mat_amount_FR + ldb_mat_amount_TO
			ldb_mat_amount_TO = 0
		else 
			SELECT SUM(NVL(TRANS_VALUE,0)) INTO :ldb_mat_amount_FR
			FROM MATCHING 
			JOIN document on document.id = matching.t_doc_id and document.status in ('booked','settled','partial_settled','paid','partial_paid') //thêm status
			WHERE F_DOC_ID = :ldb_related_doc_id USING rt_transaction;				
			if isnull(ldb_mat_amount_FR) then ldb_mat_amount_FR = 0
		end if
		
		
		//-- Lấy tổng đã matched của chứng từ cấn trừ (TO) --//
		if ls_doctype = 'PUR_INVOICE' or ls_related_doctype = 'SAL_INVOICE_RETURN'  then
			//-- amount matched khi cấn trừ --//
			SELECT SUM(NVL(TRANS_VALUE,0)) INTO :ldb_mat_amount_TO
			FROM MATCHING 
			JOIN document on document.id = matching.f_doc_id and document.status in ('booked','settled','partial_settled','paid','partial_paid')
			WHERE T_DOC_ID = :vdb_doc_id USING rt_transaction;		
			if isnull(ldb_mat_amount_TO) then ldb_mat_amount_TO = 0
			
			//-- amount matched khi thanh toán bình thường --//
			SELECT SUM(NVL(TRANS_VALUE,0)) INTO :ldb_mat_amount_FR
			FROM MATCHING 
			JOIN document on document.id = matching.t_doc_id and document.status in ('booked','settled','partial_settled','paid','partial_paid')
			WHERE F_DOC_ID = :vdb_doc_id USING rt_transaction;			
			
			if isnull(ldb_mat_amount_FR) then ldb_mat_amount_FR = 0
			ldb_mat_amount_TO = ldb_mat_amount_FR + ldb_mat_amount_TO		
			ldb_mat_amount_FR = 0
		else
			SELECT SUM(NVL(TRANS_VALUE,0)) INTO :ldb_mat_amount_TO
			FROM MATCHING 
			JOIN document on document.id = matching.f_doc_id and document.status in ('booked','settled','partial_settled','paid','partial_paid')
			WHERE T_DOC_ID = :vdb_doc_id USING rt_transaction;			
			if isnull(ldb_mat_amount_TO) then ldb_mat_amount_TO = 0
		end if
		//--------------------------------//
		//-- Lấy trạng thái phù hợp --//
		//-------------------------------//
		if vb_post then		//-- trường hợp post --//								
			/* //-- cập nhật trạng thái chứng từ TO --//
			if ldb_bal_amount_TO > ldb_mat_amount_TO then  //-- partial --//		
				if ls_doctype = 'BANK_VOUCHER' or ls_doctype = 'RECEIPT' or ls_doctype = 'PAYMENT' or ls_doctype = 'BANK_VOUCHER_PAYMENT' then
					ls_status = 'partial_settled'
				else
					ls_status = 'partial_paid'	//-- chứng tứ TO là invoice --//						
				end if
			else //-- full --//												
				if ls_doctype = 'BANK_VOUCHER' or ls_doctype = 'RECEIPT' or ls_doctype = 'PAYMENT' or ls_doctype = 'BANK_VOUCHER_PAYMENT' then
					ls_status = 'settled'
				else
					ls_status = 'paid' 	//-- chứng tứ TO là invoice --//
				end if
			end if 
			Long đóng ngày 26/07/2016, xem xét dùng đoạn này hay không*/
			
			//-- cập nhật trạng thái chứng từ TO --//
			if ldb_bal_amount_TO > ldb_mat_amount_TO then  //-- partial --//		
				if ls_doctype = 'BANK_VOUCHER' or ls_doctype = 'RECEIPT' or ls_doctype = 'PAYMENT' or ls_doctype = 'BANK_VOUCHER_PAYMENT' then
					if vs_post_status = 'settled' then
						ls_status = 'partial_settled'
					else
						ls_status = 'partial_paid'
					end if
				else
					ls_status = 'partial_paid'	//-- chứng tứ TO là invoice --//						
				end if
			else //-- full --//												
				if ls_doctype = 'BANK_VOUCHER' or ls_doctype = 'RECEIPT' or ls_doctype = 'PAYMENT' or ls_doctype = 'BANK_VOUCHER_PAYMENT' then
					if vs_post_status = 'settled' then
						ls_status = 'settled'
					else
						ls_status = 'paid'
					end if
				else
					ls_status = 'paid' 	//-- chứng tứ TO là invoice --//
				end if
			end if
			
			//-- cập nhật trạng thái chứng từ FROM --//
			if ldb_bal_amount_FR > ldb_mat_amount_FR then //-- partial --//				
				ls_related_status = lds_related_status.getitemstring(1, 'related_partial_status')
			else //-- full --//
				ls_related_status = lds_related_status.getitemstring(1, 'related_full_status')
			end if					

		else //-- trường hơp unpost --//
			//-- cập nhật trạng thái chứng từ TO --//
			if ldb_bal_amount_TO > ldb_mat_amount_TO then  //-- partial match--//		
				if ls_doctype = 'BANK_VOUCHER' or ls_doctype = 'RECEIPT' or ls_doctype = 'PAYMENT' or ls_doctype = 'BANK_VOUCHER_PAYMENT' then
					if vs_post_status = 'settled' then
						ls_status = 'partial_settled'
					else
						ls_status = 'partial_paid'
					end if
				else
					ls_status = 'partial_paid'	//-- chứng tứ TO là invoice --//						
				end if				
			else //-- chứng từ chưa matched --//
				//-- tìm trạng thái trước khi cấn trừ --//
				ls_status = this.f_get_previous_doc_status( ls_doctype, vs_post_status)
				if isnull(ls_status) then
					rollback using rt_transaction;
					return -1
				end if				
			end if	
	
			//-- cập nhật trạng thái chứng từ FROM --//
			if ldb_bal_amount_FR > ldb_mat_amount_FR then //-- partial --//				
				ls_related_status = lds_related_status.getitemstring(1, 'related_partial_status')						
			else //-- chưa match --//
				//-- tìm trạng thái trước khi cấn trừ 
				SELECT status INTO :ls_related_status FROM document WHERE id = :ldb_related_doc_id USING rt_transaction;
				if left(ls_related_status, 7) = 'partial' then ls_related_status = mid(ls_related_status, 9)
				ls_related_status = this.f_get_previous_doc_status( ls_related_doctype, ls_related_status)
				if isnull(ls_related_status) then
					rollback using rt_transaction;
					return -1
				end if				
			end if								
		end if		
		//-- update related document (t_doc_id) --//
		UPDATE DOCUMENT SET STATUS = :ls_status WHERE ID = :vdb_doc_id USING rt_transaction;		
		   //--------------------------------------------------------------------------------------------//
	else //-- trường hợp kết copy chứng từ khác: không cập nhật trạng thái chứng từ TO --//
		  //-------------------------------------------------------------------------------------------//
		
		lds_line.dataobject = 'ds_related_remain_value'		
		lds_line.f_getcurrentsql( ls_sql , ls_where)
		if pos(ls_f_ref_table,'POST_LINE') > 0 then
			ls_sql = ''
			ls_sql = 'SELECT line.id,' &
									+ 'm.qty mat_qty,' &
									+ 'm.trans_value mat_amount,' &
									+ '0 ori_qty,' &
									+ 'line.trans_amt ori_amount,' &
									+ '0 remain_qty,' &
									+ 'NVL (line.trans_amt, 0) - NVL (m.trans_value, 0) remain_amount FROM '
			
			ls_where = ' '+ls_f_ref_table + '  line join document on document.id = line.doc_id ' &
													 +" left join  ( select match.f_ref_id,  sum(match.qty) qty, sum(nvl(match.trans_value,0)) trans_value from matching match " &
													 +" join document doc on doc.id = match.t_doc_id and doc.status in "+ ls_status_list &
													 +" group by match.f_ref_id) m on line.id = m.f_ref_id " &
													 +" where document.id = " + string(ldb_related_doc_id) 
		else
			if ls_dwo_minus <> '' then
				ls_where = ' '+ls_f_ref_table + '  line join document on document.version_id = line.object_ref_id ' &
														 +" left join  ( select match.f_ref_id,  sum(match.qty) qty, sum(nvl(match.trans_value,0)) trans_value from matching match " &
														 +" join document doc on doc.id = match.t_doc_id and doc.status in "+ ls_status_list &
														 + " where match.T_REF_TABLE <> ~~'"+ls_dwo_minus+"~~'"&
														 +" group by match.f_ref_id) m on line.id = m.f_ref_id " &
														 +" where document.id = " + string(ldb_related_doc_id) 
			else
				ls_where = ' '+ls_f_ref_table + '  line join document on document.version_id = line.object_ref_id ' &
														 +" left join  ( select match.f_ref_id,  sum(match.qty) qty, sum(nvl(match.trans_value,0)) trans_value from matching match " &
														 +" join document doc on doc.id = match.t_doc_id and doc.status in "+ ls_status_list &
														 +" group by match.f_ref_id) m on line.id = m.f_ref_id " &
														 +" where document.id = " + string(ldb_related_doc_id) 
			end if
		end if
		ll_pos = pos(ls_sql, 'FROM')
		ls_sql = left(ls_sql, ll_pos + 4)
		ls_sql = ls_sql + ls_where
		
		ls_where = lds_line.modify( "Datawindow.Table.Select= '" + ls_sql +"'")
		if ls_where <> '' then
			rollback using rt_transaction;
			gf_messagebox('m.b_doc.f_update_related_status.01','Thông báo','Lỗi MODIFY DW line 177','stop','ok',1)
			return -1					
		end if
		lds_line.f_settransobject( rt_transaction)
		if lds_line.retrieve( ) > 0 then
			ldb_remain_qty = double(lds_line.Describe("Evaluate('Sum(remain_qty)', 0)"))
			ldb_mat_qty = double(lds_line.Describe("Evaluate('Sum(mat_qty)', 0)"))
			ldb_remain_amount = double(lds_line.Describe("Evaluate('Sum(remain_amount)', 0)")) 
			ldb_mat_amount = double(lds_line.Describe("Evaluate('Sum(mat_amount)', 0)"))
		end if			
		//-- lấy trạng thái phù hợp --//
		if vb_post then
			if ldb_remain_qty > 0 and ldb_mat_qty >  0 then //-- match 1 phần --//
				ls_related_status = lds_related_status.getitemstring(1, 'related_partial_status')
			else //-- match hoàn toàn --//
				ls_related_status = lds_related_status.getitemstring(1, 'related_full_status')
			end if
		else //-- trường hợp unpost --//
			if (ldb_mat_qty > 0 and ldb_remain_qty > 0) or (ldb_remain_amount > 0 and ldb_mat_amount> 0 ) then //-- match 1 phần --//
				ls_related_status = lds_related_status.getitemstring(1, 'related_partial_status')
			else //-- chưa match hoàn toàn --//
				//-- tìm trạng thái trước khi cấn trừ 
				SELECT status INTO :ls_related_status FROM document WHERE id = :ldb_related_doc_id USING rt_transaction;
				if left(ls_related_status, 7) = 'partial' then ls_related_status = mid(ls_related_status, 9)
				ls_related_status = this.f_get_previous_doc_status( ls_related_doctype, ls_related_status)				
				if isnull(ls_related_status) then
					rollback using rt_transaction;
					return -1
				end if
			end if			
		end if
	end if
		
	//-- update related document (f_doc_id) --//
	if pos(rs_doc_id_updated, string(ldb_related_doc_id)+';') = 0 then
		//--kiểm tra tránh trường hợp 1 chứng từ cập nhật trạng thái 2 lần--//
		UPDATE DOCUMENT SET STATUS = :ls_related_status WHERE ID = :ldb_related_doc_id USING rt_transaction;	
		if rt_transaction.sqlcode = 0 then rs_doc_id_updated += string(ldb_related_doc_id)+';'
	end if
	//-- trước khi gọi truy hồi thì lấy lại trạng thái cài đặt( trạng thái full)--//
	ls_related_status = lds_related_status.getitemstring(1, 'related_full_status')
	//-- gọi truy hồi --//
	if this.f_update_related_status( ldb_related_doc_id, ls_related_doctype, ls_related_status,  vb_post,rs_doc_id_updated) = -1 then 
		return -1
	end if
NEXT

destroy lds_line
destroy lds_related_doc

return 1
end function

public function integer f_insert_post_line_multi (double vdb_doc_id, date vd_trans_date, double vdb_doc_version, double vdb_branch_id, t_ds_db vds_get_amount, double vdb_currency_id, double vdc_exrate, s_str_post_account vstr_spec_acct[], s_str_post_account vstr_grp_acct[], s_str_post_account vstr_all_acct[], s_str_post_info vstr_post_info, ref s_str_ds_4_posting vstr_ds_4_posting, ref t_transaction rt_transaction);/******************************************************************************
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
b_obj_instantiate			lb_obj_ins
c_string						lc_string
t_ds_db						lds_matching, lds_f_post_line, rds_post_line, lds_master


ldb_exrate_amt = vdc_exrate
if isnull(vdb_currency_id) or vdb_currency_id = 0 then return -1
if isnull(ldb_exrate_amt) or ldb_exrate_amt = 0 then return -1
ld_trans_date = vd_trans_date
//if this.f_get_trans_date( ld_trans_date) = -1 then return -1
//this.iw_display.f_get_transaction(lt_transaction )

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

select count(id) into :li_cnt from post_line where doc_id = :vdb_doc_id using sqlca; 
if li_cnt > 0 then
	lb_accounted = true
else 
	lb_create_account = true
end if
//--Lấy round_id --//
this.ic_unit_instance.f_get_base_cur( ldb_base_curr, ls_base_curr_code, ls_base_curr_name)
ldb_round_id = ic_unit_instance.f_get_round_id( ldb_base_curr, 0, 'amount')

FOR ll_row = 1 to vds_get_amount.rowcount()
		
	//-- Lấy conditional value --//
	this.f_get_posting_condition_multi(vdb_doc_version, vstr_post_info, vds_get_amount, ll_row, ls_condition_val, ls_condition_coltype, rt_transaction, vstr_ds_4_posting)

	//-- Lấy object id DR/CR --//
	ldb_dr_subacct_id=0
	ldb_cr_subacct_id=0
	ldb_dr_object_id =0
	ldb_cr_object_id =0	
	if this.f_get_posting_object_multi(vdb_doc_version, vstr_post_info, vds_get_amount, ll_row, ldb_dr_object_id,ldb_cr_object_id,rt_transaction,vstr_ds_4_posting, ldb_dr_subacct_id, ldb_cr_subacct_id) = -1 then
		return -1
	end if
	

	
	//-- Lấy tài khoản và tiểu mục ghi sổ --//		
	if ll_rtn_row < 2  or lstr_post_account.s_posting_type = 'ledger'  or ls_condition_val <>'' then
		ll_rtn_row = this.f_get_Trans_setup_account( ldb_dr_object_id, ldb_cr_object_id,ls_condition_val,ls_condition_coltype, vstr_spec_acct[],vstr_grp_acct[], vstr_all_acct[], vstr_post_info,  lstr_post_account)
	end if
	if ll_rtn_row = -1 then return -1		
	if ll_rtn_row = 0 then continue //-- Đối tượng ko cần định khoản --//
	
	//-- Lấy lại object id DR/CR sau khi có structure --//
	if ll_rtn_row = 3 then
		if this.f_get_posting_object_multi(vdb_doc_version, lstr_post_account, vds_get_amount, ll_row, ldb_dr_object_id,ldb_cr_object_id,rt_transaction,vstr_ds_4_posting, ldb_dr_subacct_id, ldb_cr_subacct_id) = -1 then
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
		this.f_get_item_columns_of_streamvalue( vds_get_amount.dataobject, las_col_item[])
		if upperbound(las_col_item[]) > 0 then				
			ldb_trans_uom = vds_get_amount.getitemnumber(ll_row,las_col_item[4])				
			ll_rtn = this.f_set_Qty_sku(rt_transaction, vds_get_amount, ll_row, ldb_cr_object_id ,ldb_trans_uom, las_col_item[3], 'OUT', ldb_act_qty_sku, ldb_round_diff)
			if ll_rtn = -1 then
				vds_get_amount.resetupdate()
				return -1
			end if
			lb_obj_ins.f_update_round_diff( ldb_cr_object_id, ldb_round_diff, rt_transaction)
		end if
		lb_managed_value = lb_obj_ins.f_is_managed_value( ldb_cr_object_id)
		if vds_get_amount.dataobject = 'd_inventory_line_counting_grid' then			
			if not lb_managed_value then	continue //-- mã hàng ko quản lý giá trị , xuất kho kiểm kê  ko ghi sổ tài khoản --//
		end if
		//-- set cogs vào hóa đơn bán --//		
		if lower(lstr_post_account.s_col_base_amt) = 'cogs' then		
			if not lb_managed_value then	continue //-- mã hàng ko quản lý giá trị , xuất kho bán  ko ghi giá vốn --//
			if this.ib_doc_return_yn then
				ldb_base_amount = this.f_get_return_unit_cogs(  vds_get_amount.getitemnumber(ll_row, 'id'))
				if ldb_base_amount = -1 then
					vds_get_amount.resetupdate()
					return -1
				end if
			else
				ldb_base_amount = lb_obj_ins.f_get_last_pur_price(ldb_cr_object_id)
				if ldb_act_qty_sku < 0 then ldb_act_qty_sku = -ldb_act_qty_sku //-- kiểm kê thiếu hàng : ghi âm sku--//
				ldb_base_amount = this.ic_unit_instance.f_round(rt_transaction, ldb_round_id, ldb_base_amount * ldb_act_qty_sku)
			end if		
			vds_get_amount.setitem(ll_row,lstr_post_account.s_col_base_amt, ldb_base_amount)
		end if
	elseif lower(lstr_post_account.s_dr_object_type) = 'item' and lower(lstr_post_account.s_cr_object_type) <> 'tax_authority'  and lower(lstr_post_account.s_cr_object_type) <> 'charge_object' then
		//-- set số lượng SKU --//
		this.f_get_item_columns_of_streamvalue( vds_get_amount.dataobject, las_col_item[])
		if upperbound(las_col_item[]) > 0 then
			lb_update_sku = true
			ldb_trans_uom = vds_get_amount.getitemnumber(ll_row,las_col_item[4])
			ll_rtn = this.f_set_Qty_sku(rt_transaction, vds_get_amount, ll_row, ldb_dr_object_id, ldb_trans_uom, las_col_item[3], 'OUT', ldb_act_qty_sku, ldb_round_diff)
			if ll_rtn = -1 then
				vds_get_amount.resetupdate()
				return -1
			end if
			lb_obj_ins.f_update_round_diff( ldb_dr_object_id, ldb_round_diff, rt_transaction)
		end if
		if vds_get_amount.dataobject = 'd_inventory_line_counting_grid' then
			lb_managed_value = lb_obj_ins.f_is_managed_value( ldb_dr_object_id)  //-- Kiểmm kê mã hàng ko quản lý giá trị , ko ghi sổ tài khoản --//
			if not lb_managed_value then	continue 
		end if
	end if				

	//-- lấy ldb_base_amount ; ldb_amount --//
	ldb_base_amount = vds_get_amount.getitemnumber(ll_row, lstr_post_account.s_col_base_amt )
	if isnull(ldb_base_amount) then ldb_base_amount = 0
	if lower(lstr_post_account.s_col_base_amt) = 'cogs' and ldb_base_amount = 0 then
		if lower(lstr_post_account.s_dr_object_type) = 'item' then
			ldb_cogs = lb_obj_ins.f_get_last_pur_price(ldb_dr_object_id)
			ldb_base_amount = this.ic_unit_instance.f_round(rt_transaction, ldb_round_id, ldb_cogs * ldb_act_qty_sku)
		elseif  lower(lstr_post_account.s_cr_object_type) = 'item' then
			ldb_cogs = lb_obj_ins.f_get_last_pur_price(ldb_cr_object_id)
			ldb_base_amount = this.ic_unit_instance.f_round(rt_transaction, ldb_round_id, ldb_cogs * ldb_act_qty_sku)
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
		if lb_obj_ins.f_get_object_control_yn( ldb_dr_object_id) = 'Y' then
			gf_messagebox('m.b_doc.f_insert_post_line_multi.05','Thông báo','TK có quản lý đối tượng không được ghi sổ trực tiếp: @' + lb_obj_ins.f_get_object_code( ldb_dr_object_id)  ,'exclamation','ok',1)
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
		if lb_obj_ins.f_get_object_control_yn( ldb_cr_object_id) = 'Y' then
			gf_messagebox('m.b_doc.f_insert_post_line_multi.05','Thông báo','Tài khoản có quản lý đối tượng không được ghi sổ trực tiếp: @' + lb_obj_ins.f_get_object_code( ldb_cr_object_id)  ,'exclamation','ok',1)
			rollback using rt_transaction;				
			return -1
		end if			
		//-- lấy acct trên v_dwt --//
		ldb_cr_account_id = ldb_cr_object_id
	else
		ldb_cr_account_id = lstr_post_account.db_cr_account
	end if		
	//-- kiểm tra xem user có sửa tài khoản trực tiếp trên post_line không ? --//
	// Nếu user thay đổi tài khoản khác với cài đặt popup câu hỏi xác nhận với user? --//
	if lb_accounted	and not lb_create_account then
		if isnull(ls_posting_type) then
			select count(id) into :li_cnt from post_line
			where post_type is null 
			and dr_account_id = :ldb_cr_account_id 
			and cr_account_id = :ldb_cr_account_id 
			and DR_OBJECT_ID = :ldb_dr_object_id
			and CR_OBJECT_ID = :ldb_cr_object_id
			and TRANS_AMT = :ldb_amount 			
			and doc_id = :vdb_doc_id
			using sqlca;
			if li_cnt = 0 then
				li_response = gf_messagebox('m.b_doc.f_insert_post_line.01','Thông báo','Tài khoản đã được thay đổi khác với cài đặt, ban có muốn tạo lại không?','question','yesno',2)
				if li_response = 1 then
					delete post_line where doc_id =:vdb_doc_id using sqlca;
					commit using sqlca ;		
					lb_create_account = true
				else
					destroy rds_post_line
					destroy lds_matching
					return 0										
				end if				
			end if
		else	
			select count(id) into :li_cnt from post_line
			where post_type = :ls_posting_type
			and dr_account_id = :ldb_cr_account_id 
			and cr_account_id = :ldb_cr_account_id 
			and DR_OBJECT_ID = :ldb_dr_object_id
			and CR_OBJECT_ID = :ldb_cr_object_id
			and TRANS_AMT = :ldb_amount 			
			and doc_id = :vdb_doc_id
			using sqlca;
			if li_cnt = 0 then
				li_response = gf_messagebox('m.b_doc.f_insert_post_line.01','Thông báo','Tài khoản đã được thay đổi khác với cài đặt, ban có muốn tạo lại không?','question','yesno',2)
				if li_response = 1 then
					delete post_line where doc_id =:vdb_doc_id using sqlca;
					commit using sqlca ;		
					lb_create_account = true
				else
					destroy rds_post_line
					destroy lds_matching
					return 0									
				end if				
			end if			
		end if
	end if
	

	//-- Xứ lý ngoại tệ tiền thuế và chênh lệch tỷ giá --//	
//	ic_unit_instance.f_get_base_cur( ldb_base_curr_id,ls_base_currcode, ls_base_currname)
	if  ldb_base_curr <> vdb_currency_id then 
		//-- xử lý thuế: quy đổi tiền thuế ngược lại ngoại tệ --//
		if lstr_post_account.s_posting_type = 'tax' then
//			ldb_round_id = ic_unit_instance.f_get_round_id( vdb_currency_id, 0, 'amount') 
			if ldb_amount > 0 then
				ldb_exrate_amt = ic_unit_instance.f_round( rt_transaction, ldb_round_id,  ldb_base_amount/ldb_amount)				
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
					if this.f_create_exrate_post_line_ex( ldb_dr_object_id, ldb_cr_object_id, lds_f_post_line, ldb_amount,ldb_base_amount, vdb_currency_id,ldb_exrate_amt, ld_trans_date, vdb_doc_id, ldb_object_ref_id, ls_object_ref_table, lstr_post_account, rds_post_line) = -1 then
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
	rds_post_line.setitem(ll_insert_row,'id', this.f_create_id( ) )
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
		gf_messagebox('m.b_doc.f_insert_post_line_multi.03','Thông báo','Không cập nhật được postline :@' +rt_transaction.sqlerrtext ,'exclamation','ok',1)
		rollback using rt_transaction;
		return -1
	end if	
	destroy rds_post_line
	GarbageCollect ( )
	
	
	//-- update cot sku ,cogs--//
	if  vds_get_amount.rowcount()> 0 and lb_update_sku then
		if vds_get_amount.update(true,false) = -1 then
			gf_messagebox('m.b_doc.f_insert_post_line_multi.04','Thông báo','Không cập nhật được số lượng theo đơn vị tồn kho:@' +rt_transaction.sqlerrtext ,'exclamation','ok',1)
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

public function integer f_create_post_line_multi (double vdb_doc_id, date vd_trans_date, double vdb_doc_version, double vdb_branch_id, double vdb_trans_hdr_id, ref s_str_ds_4_posting vstr_ds_4_posting, ref t_transaction rt_transaction);	/**********************************************************
Chức năng: Tạo định khoản cho chứng từ theo cài đặt ngiệp vụ ghi sổ
--------------------------------------------------------------------------------------------
Tham số: vdb_doc_id : ID của chứng từ cần ghi sổ
			 vs_new: hàm được viết optimize lại
---------------------------------------------------------------------
Return: 	 1 -> Thành công
			-1 -> Lỗi
==============================TrevietSoftware.com*/
t_ds_db						lds_trans_setup, lds_get_amount
c_string						lc_string
c_dwservice					l_dwservice
s_str_post_info				lstr_post_info, lstr_post_info_empty
s_str_post_account		lstr_post_acct_spec[], lstr_post_acct_group[], lstr_post_acct_all[] , lstrs_post_acct_empty[]

long					ll_row, ll_cnt, ll_rtn, ll_idx
string					ls_dw_get_mount,ls_dw_get_mount_tmp, ls_col_get_base_amount, ls_col_get_amount, ls_original_filter, ls_source_filter
string					ls_posting_type, ls_posting_type_tmp, ls_findString, ls_empty[], ls_rtn, ls_col_base_amt[]
double				ldb_currency_id
decimal				ldc_exrate
boolean				lb_skip
int						li_idx, li_pos_s, li_pos_e, li_chr_nbr
string					ls_colname, ls_coltype

//-- Kiểm tra tham số truyền vào --//
if vdb_doc_id = 0 or isnull(vdb_doc_id) then 
	gf_messagebox('m.b_doc.f_create_post_line.01','Thông báo','Tham số ID chứng từ không hợp lệ !','exclamation','ok',1)
	return -1
end if
if vdb_trans_hdr_id = 0 or isnull(vdb_trans_hdr_id) then
	gf_messagebox('m.b_doc.f_create_post_line.03','Thông báo','Chứng từ chưa có giao dịch','exclamation','ok',1)
	return -1	
end if
//-- Lấy tỷ giá và loại tiền của chứng từ --//
this.f_get_currency_exrate_of_doc( ldb_currency_id, ldc_exrate)
if isnull(ldb_currency_id) or ldb_currency_id = 0 then 
	gf_messagebox('m.b_doc.f_create_post_line.04','Thông báo','Chứng từ chưa có loại tiền','exclamation','ok',1)
	return -1
end if
if isnull(ldc_exrate) or ldc_exrate = 0 then
	gf_messagebox('m.b_doc.f_create_post_line.05','Thông báo','Chứng từ chưa có tỷ giá','exclamation','ok',1)
	return -1
end if
//-- Lấy toàn bộ thông tin cài đặt nghiệp vụ của chứng từ --//
lds_trans_setup = create t_ds_db
if this.f_get_trans_setup(vdb_trans_hdr_id, lds_trans_setup) < 1 then
	gf_messagebox('m.b_doc.f_create_post_line.06','Thông báo','Giao dịch ghi sổ chưa cài đặt','exclamation','ok',1)
	destroy lds_trans_setup
	return -1		
end if

//-- Duyệt theo dw_get_amount --//
ll_row = 1
DO
	ls_posting_type_tmp = lds_trans_setup.getitemstring( ll_row, 'posting_type')
	if isnull(ls_posting_type_tmp) then  ls_posting_type_tmp= 'NULL' 
	ls_dw_get_mount_tmp = lds_trans_setup.getitemstring( ll_row, 'dw_get_amount')
	if isnull(ls_dw_get_mount_tmp) or ls_dw_get_mount_tmp=''  then
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
			
			IF upper(lds_get_amount.describe("DataWindow.Table.UpdateTable")) <> 'BOOKED_SLIP' THEN
				lds_get_amount.f_build_join_where_4_posting(vstr_ds_4_posting.s_join_detail[li_idx] , " booked_slip.ID = " + string(vdb_doc_version) , " AND " )
			else
				ls_colname = 'ID'
				l_dwservice.f_get_build_column(lds_get_amount, ls_colname, ls_coltype)		
				lds_get_amount.f_build_join_where_4_posting(vstr_ds_4_posting.s_join_detail[li_idx] ," "+ ls_colname+" = "+ string(vdb_doc_version) , " AND " )
			end if
			lds_get_amount.f_settransobject(rt_transaction)
			lds_get_amount.retrieve()			
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
		ll_rtn = this.f_insert_post_line_multi( vdb_doc_id,vd_trans_date,vdb_doc_version, vdb_branch_id,lds_get_amount, ldb_currency_id,ldc_exrate, lstr_post_acct_spec[],lstr_post_acct_group[],lstr_post_acct_all[] ,lstr_post_info, vstr_ds_4_posting, rt_transaction)
		if ll_rtn = -1 then return -1

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

protected function integer f_get_posting_object (s_str_post_account vstr_post_account, t_dw_mpl vdw_get_amount, long vl_handle_row, ref double rdb_dr_object_id, ref double rdb_cr_object_id, ref t_transaction rt_transaction, ref double rdb_dr_subacct_id, ref double rdb_cr_subacct_id);long			ll_master_row
double		ldb_object_ref_id
t_dw_mpl		ldw_master

		if not isnull(vstr_post_account.s_dr_dw_object) and vstr_post_account.s_dr_dw_object <> '' then
			if vstr_post_account.s_dr_dw_object = left(vdw_get_amount.dataobject, len(vdw_get_amount.dataobject) - 5) then 
				rdb_dr_object_id = vdw_get_amount.getitemnumber( vl_handle_row ,vstr_post_account.s_dr_object_col)
				/////////////////////////////////////////////-subacct-/////////////////////////////////////////
				if vdw_get_amount.dataobject <> 'd_gl_journal_line_grid' then
					rdb_dr_subacct_id = vdw_get_amount.getitemnumber( vl_handle_row ,'subaccount')
				else
					rdb_dr_subacct_id = vdw_get_amount.getitemnumber( vl_handle_row ,'DR_SUBACCOUNT')
				end if					

			else
				ldw_master = vdw_get_amount.dynamic f_get_idw_master()
				if isvalid(ldw_master) then
					if vstr_post_account.s_dr_dw_object = left(ldw_master.dataobject, len(ldw_master.dataobject) - 5) then 
						ldb_object_ref_id =  vdw_get_amount.getitemnumber(vl_handle_row, 'object_ref_id')
						ll_master_row = ldw_master.find( "id = "+string(ldb_object_ref_id) , 1, ldw_master.rowcount())			
						if ll_master_row = 0 then ll_master_row = ldw_master.getrow()			
						rdb_dr_object_id = ldw_master.getitemnumber( ll_master_row, vstr_post_account.s_dr_object_col)		
						/////////////////////////////////////////////-subacct-/////////////////////////////////////////
						if ldw_master.dataobject <> 'd_gl_journal_line_grid' then
							rdb_dr_subacct_id = ldw_master.getitemnumber( ll_master_row ,'SUBACCOUNT')
						else
							rdb_dr_subacct_id = ldw_master.getitemnumber( ll_master_row ,'DR_SUBACCOUNT')
						end if			
						
//						rdb_dr_subacct_id = ldw_master.getitemnumber( ll_master_row ,'SUBACCOUNT')
					else
						ldb_object_ref_id =  vdw_get_amount.getitemnumber(vl_handle_row, 'object_ref_id')
						ll_master_row = ldw_master.find( "id = "+string(ldb_object_ref_id) , 1, ldw_master.rowcount())			
						if ll_master_row = 0 then ll_master_row = ldw_master.getrow()									
						ldb_object_ref_id =  ldw_master.getitemnumber(ll_master_row, 'object_ref_id')
						
						ldw_master = ldw_master.dynamic f_get_idw_master()
						if isvalid(ldw_master) then
							if vstr_post_account.s_dr_dw_object = left(ldw_master.dataobject, len(ldw_master.dataobject) - 5) then 
								ll_master_row = ldw_master.find( "id = "+string(ldb_object_ref_id) , 1, ldw_master.rowcount())			
								if ll_master_row = 0 then ll_master_row = ldw_master.getrow()			
								rdb_dr_object_id = ldw_master.getitemnumber( ll_master_row, vstr_post_account.s_dr_object_col)			
								/////////////////////////////////////////////-subacct-/////////////////////////////////////////
								if ldw_master.dataobject <> 'd_gl_journal_line_grid' then
									rdb_dr_subacct_id = ldw_master.getitemnumber( ll_master_row ,'SUBACCOUNT')
								else
									rdb_dr_subacct_id = ldw_master.getitemnumber( ll_master_row ,'DR_SUBACCOUNT')
								end if				
								
//								rdb_dr_subacct_id = ldw_master.getitemnumber( ll_master_row ,'SUBACCOUNT')								
							end if
						end if
					end if
				end if
			end if	
		else
			rdb_dr_object_id = vstr_post_account.db_dr_object_id
		end if
		
		if ( isnull(rdb_dr_object_id) or rdb_dr_object_id =0 ) and vstr_post_account.s_dr_obj_type <> 'ACCOUNT'  then
			gf_messagebox('m.b_doc.f_insert_post_line.03.01','Thông báo','Đối tượng NỢ chưa được nhập' ,'exclamation','ok',1)
			rollback using rt_transaction;		
			return -1
		end if
	
		if 	not isnull(vstr_post_account.s_cr_dw_object) and vstr_post_account.s_cr_dw_object <> ''  then
			if vstr_post_account.s_cr_dw_object = left(vdw_get_amount.dataobject, len(vdw_get_amount.dataobject) - 5) then 
				rdb_cr_object_id = vdw_get_amount.getitemnumber( vl_handle_row ,vstr_post_account.s_cr_object_col)
				/////////////////////////////////////////////-subacct-/////////////////////////////////////////
				if vdw_get_amount.dataobject <> 'd_gl_journal_line_grid' then
					rdb_cr_subacct_id = vdw_get_amount.getitemnumber( vl_handle_row ,'subaccount')
				else
					rdb_cr_subacct_id = vdw_get_amount.getitemnumber( vl_handle_row ,'CR_SUBACCOUNT')
				end if					
				
//				rdb_cr_subacct_id = vdw_get_amount.getitemnumber( vl_handle_row ,'SUBACCOUNT')								
			else
				ldw_master = vdw_get_amount.dynamic f_get_idw_master()
				if isvalid(ldw_master) then
					if vstr_post_account.s_cr_dw_object = left(ldw_master.dataobject, len(ldw_master.dataobject) - 5) then 
						ldb_object_ref_id =  vdw_get_amount.getitemnumber(vl_handle_row, 'object_ref_id')
						ll_master_row = ldw_master.find( "id = "+string(ldb_object_ref_id) , 1, ldw_master.rowcount())			
						if ll_master_row = 0 then ll_master_row = ldw_master.getrow()			
						rdb_cr_object_id = ldw_master.getitemnumber( ll_master_row, vstr_post_account.s_cr_object_col)			
						/////////////////////////////////////////////-subacct-/////////////////////////////////////////
						if ldw_master.dataobject <> 'd_gl_journal_line_grid' then
							rdb_cr_subacct_id = ldw_master.getitemnumber( ll_master_row ,'SUBACCOUNT')
						else
							rdb_cr_subacct_id = ldw_master.getitemnumber( ll_master_row ,'CR_SUBACCOUNT')
						end if								
						
//						rdb_cr_subacct_id = ldw_master.getitemnumber( ll_master_row ,'SUBACCOUNT')									
					else
						ldb_object_ref_id =  vdw_get_amount.getitemnumber(vl_handle_row, 'object_ref_id')
						ll_master_row = ldw_master.find( "id = "+string(ldb_object_ref_id) , 1, ldw_master.rowcount())			
						if ll_master_row = 0 then ll_master_row = ldw_master.getrow()									
						ldb_object_ref_id =  ldw_master.getitemnumber(ll_master_row, 'object_ref_id')
						
						ldw_master = ldw_master.dynamic f_get_idw_master()
						if isvalid(ldw_master) then
							if vstr_post_account.s_cr_dw_object = left(ldw_master.dataobject, len(ldw_master.dataobject) - 5) then 
								ll_master_row = ldw_master.find( "id = "+string(ldb_object_ref_id) , 1, ldw_master.rowcount())			
								if ll_master_row = 0 then ll_master_row = ldw_master.getrow()			
								rdb_cr_object_id = ldw_master.getitemnumber( ll_master_row, vstr_post_account.s_cr_object_col)			
								/////////////////////////////////////////////-subacct-/////////////////////////////////////////
								if ldw_master.dataobject <> 'd_gl_journal_line_grid' then
									rdb_cr_subacct_id = ldw_master.getitemnumber( ll_master_row ,'SUBACCOUNT')
								else
									rdb_cr_subacct_id = ldw_master.getitemnumber( ll_master_row ,'CR_SUBACCOUNT')
								end if								
								
//								rdb_cr_subacct_id = ldw_master.getitemnumber( ll_master_row ,'SUBACCOUNT')																	
							end if
						end if
					end if
				end if
			end if	
		else 
			rdb_cr_object_id = vstr_post_account.db_cr_object_id
		end if
		
		if (isnull(rdb_cr_object_id) or rdb_cr_object_id =0 ) and vstr_post_account.s_cr_obj_type <> 'ACCOUNT'	then
			gf_messagebox('m.b_doc.f_insert_post_line.03.02','Thông báo','Đối tượng CÓ chưa được nhập' ,'exclamation','ok',1)
			rollback using rt_transaction;				
			return -1
		end if

return 1
end function

protected function integer f_get_posting_object (s_str_post_info vstr_post_info, t_dw_mpl vdw_get_amount, long vl_handle_row, ref double rdb_dr_object_id, ref double rdb_cr_object_id, ref t_transaction rt_transaction, ref double rdb_dr_subacct_id, ref double rdb_cr_subacct_id);long			ll_master_row
double		ldb_object_ref_id
t_dw_mpl	ldw_master

		if not isnull(vstr_post_info.s_dr_dw_object) and vstr_post_info.s_dr_dw_object <> '' then
			if vstr_post_info.s_dr_dw_object = left(vdw_get_amount.dataobject, len(vdw_get_amount.dataobject) - 5) then 
				rdb_dr_object_id = vdw_get_amount.getitemnumber( vl_handle_row ,vstr_post_info.s_dr_object_col)
				////////////////////////////////////////////////////////////////-subacct-////////////////////////////////////////
				if vdw_get_amount.dataobject <> 'd_gl_journal_line_grid' then
					rdb_dr_subacct_id = vdw_get_amount.getitemnumber( vl_handle_row ,'subaccount')
				else
					rdb_dr_subacct_id = vdw_get_amount.getitemnumber( vl_handle_row ,'DR_SUBACCOUNT')
				end if				
			else
				ldw_master = vdw_get_amount.dynamic f_get_idw_master()
				if isvalid(ldw_master) then
					if vstr_post_info.s_dr_dw_object = left(ldw_master.dataobject, len(ldw_master.dataobject) - 5) then 
						ldb_object_ref_id =  vdw_get_amount.getitemnumber(vl_handle_row, 'object_ref_id')
						ll_master_row = ldw_master.find( "id = "+string(ldb_object_ref_id) , 1, ldw_master.rowcount())			
						if ll_master_row = 0 then ll_master_row = ldw_master.getrow()			
						rdb_dr_object_id = ldw_master.getitemnumber( ll_master_row, vstr_post_info.s_dr_object_col)		
						////////////////////////////////////////////////////////////////-subacct-////////////////////////////////////////
						if ldw_master.dataobject <> 'd_gl_journal_line_grid' then
							rdb_dr_subacct_id = ldw_master.getitemnumber( ll_master_row ,'SUBACCOUNT')
						else
							rdb_dr_subacct_id = ldw_master.getitemnumber( ll_master_row ,'DR_SUBACCOUNT')
						end if																
					else
						ldb_object_ref_id =  vdw_get_amount.getitemnumber(vl_handle_row, 'object_ref_id')
						ll_master_row = ldw_master.find( "id = "+string(ldb_object_ref_id) , 1, ldw_master.rowcount())			
						if ll_master_row = 0 then ll_master_row = ldw_master.getrow()									
						ldb_object_ref_id =  ldw_master.getitemnumber(ll_master_row, 'object_ref_id')
						
						ldw_master = ldw_master.dynamic f_get_idw_master()
						if isvalid(ldw_master) then
							if vstr_post_info.s_dr_dw_object = left(ldw_master.dataobject, len(ldw_master.dataobject) - 5) then 
								ll_master_row = ldw_master.find( "id = "+string(ldb_object_ref_id) , 1, ldw_master.rowcount())			
								if ll_master_row = 0 then ll_master_row = ldw_master.getrow()			
								rdb_dr_object_id = ldw_master.getitemnumber( ll_master_row, vstr_post_info.s_dr_object_col)		
								////////////////////////////////////////////////////////////////-subacct-////////////////////////////////////////
								if ldw_master.dataobject <> 'd_gl_journal_line_grid' then
									rdb_dr_subacct_id = ldw_master.getitemnumber( ll_master_row ,'SUBACCOUNT')
								else
									rdb_dr_subacct_id = ldw_master.getitemnumber( ll_master_row ,'DR_SUBACCOUNT')
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
			gf_messagebox('m.b_doc.f_insert_post_line.03.01','Thông báo','Đối tượng NỢ chưa được nhập' ,'exclamation','ok',1)
			rollback using rt_transaction;		
			return -1
		end if
	
		if 	not isnull(vstr_post_info.s_cr_dw_object) and vstr_post_info.s_cr_dw_object <> ''  then
			if vstr_post_info.s_cr_dw_object = left(vdw_get_amount.dataobject, len(vdw_get_amount.dataobject) - 5) then 
				rdb_cr_object_id = vdw_get_amount.getitemnumber( vl_handle_row ,vstr_post_info.s_cr_object_col)
				////////////////////////////////////////////////////////////////-subacct-////////////////////////////////////////
				if vdw_get_amount.dataobject <> 'd_gl_journal_line_grid' then
					rdb_cr_subacct_id = vdw_get_amount.getitemnumber( vl_handle_row ,'SUBACCOUNT')
				else
					rdb_cr_subacct_id = vdw_get_amount.getitemnumber( vl_handle_row ,'CR_SUBACCOUNT')
				end if														
			else
				ldw_master = vdw_get_amount.dynamic f_get_idw_master()
				if isvalid(ldw_master) then
					if vstr_post_info.s_cr_dw_object = left(ldw_master.dataobject, len(ldw_master.dataobject) - 5) then 
						ldb_object_ref_id =  vdw_get_amount.getitemnumber(vl_handle_row, 'object_ref_id')
						ll_master_row = ldw_master.find( "id = "+string(ldb_object_ref_id) , 1, ldw_master.rowcount())			
						if ll_master_row = 0 then ll_master_row = ldw_master.getrow()			
						rdb_cr_object_id = ldw_master.getitemnumber( ll_master_row, vstr_post_info.s_cr_object_col)			
						////////////////////////////////////////////////////////////////-subacct-////////////////////////////////////////
						if ldw_master.dataobject <> 'd_gl_journal_line_grid' then
							rdb_cr_subacct_id = ldw_master.getitemnumber( ll_master_row ,'SUBACCOUNT')
						else
							rdb_cr_subacct_id = ldw_master.getitemnumber( ll_master_row ,'CR_SUBACCOUNT')
						end if																										
					else
						ldb_object_ref_id =  vdw_get_amount.getitemnumber(vl_handle_row, 'object_ref_id')
						ll_master_row = ldw_master.find( "id = "+string(ldb_object_ref_id) , 1, ldw_master.rowcount())			
						if ll_master_row = 0 then ll_master_row = ldw_master.getrow()									
						ldb_object_ref_id =  ldw_master.getitemnumber(ll_master_row, 'object_ref_id')
						
						ldw_master = ldw_master.dynamic f_get_idw_master()
						if isvalid(ldw_master) then
							if vstr_post_info.s_cr_dw_object = left(ldw_master.dataobject, len(ldw_master.dataobject) - 5) then 
								ll_master_row = ldw_master.find( "id = "+string(ldb_object_ref_id) , 1, ldw_master.rowcount())			
								if ll_master_row = 0 then ll_master_row = ldw_master.getrow()			
								rdb_cr_object_id = ldw_master.getitemnumber( ll_master_row, vstr_post_info.s_cr_object_col)			
								////////////////////////////////////////////////////////////////-subacct-////////////////////////////////////////
								if ldw_master.dataobject <> 'd_gl_journal_line_grid' then
									rdb_cr_subacct_id = ldw_master.getitemnumber( ll_master_row ,'SUBACCOUNT')
								else
									rdb_cr_subacct_id = ldw_master.getitemnumber( ll_master_row ,'CR_SUBACCOUNT')
								end if																																										
							end if
						end if
					end if
				end if
			end if	
		else
			rdb_cr_object_id = vstr_post_info.db_cr_object_id
		end if
		
		if (isnull(rdb_cr_object_id) or rdb_cr_object_id =0 ) and vstr_post_info.s_cr_obj_type <> 'ACCOUNT'	then
			gf_messagebox('m.b_doc.f_insert_post_line.03.02','Thông báo','Đối tượng CÓ chưa được nhập' ,'exclamation','ok',1)
			rollback using rt_transaction;				
			return -1
		end if

return 1
end function

protected function integer f_get_posting_object_multi (double vdb_doc_version, s_str_post_info vstr_post_info, t_ds_db vds_get_amount, long vl_handle_row, ref double rdb_dr_object_id, ref double rdb_cr_object_id, ref t_transaction rt_transaction, ref s_str_ds_4_posting rstr_ds_4_posting, ref double rdb_dr_subacct_id, ref double rdb_cr_subacct_id);long			ll_master_row
double		ldb_object_ref_id
string			ls_dwo_master, ls_colname, ls_coltype
int				li_chr_nbr, li_idx_master, li_pos_s, li_pos_e
c_dwservice			l_dwservice

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

public function integer f_insert_item_balance_row (ref t_transaction rt_transaction, ref powerobject rpo_item, ref long vl_item_row, t_dw_mpl rdw_f_object, t_dw_mpl rdw_t_object, date vd_trans_date, string vs_post_type, string vas_col_item[], string vas_col_item_value[], string vas_f_col_object[], string vas_t_col_object[], any vaa_data[], string vs_qty_yn, string vs_value_yn, double vdb_trans_uom, string vs_qty_column, double vdb_value, string vs_trans_qty_yn, string vs_trans_val_yn);/**************************************************************************************
Chức năng: Cập nhật 1 record giao dịch vào bảng item balance. 
	 # mặt hàng không quản lý số lượng thì bỏ qua
	 # Mặt hàng không quản lý số lot/seri: cập số lượng và giá trị tồn kho trên cùng record
	 # mặt hàng có quản lý số lot/seri: 
	 		- Cập nhật số lượng tồn kho theo lot/seri, mỗi lot/seri 1 record tồn kho Số lượng.
			- Cập nhật giá trị tồn kho theo mã hàng ( tổng giá trị của các lot/seri), mỗi mã hàng 1 record giá trịn tồn kho.
-------------------------------------
Tham số:	- rt_transaction : transacion của document
				- rdw_item : dw giao dịch chứa item cần ghi sổ, dw có chứa column giá trị ghi sổ trong trường hợp vs_value = 'Y'
				- rdw_f_object: dw chứa đối tượng FROM
				- rdw_t_object: dw chứa đối tượng TO
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
								  vaa_data[9](sob),vaa_data[10](value_yn), vaa_data[11](branch_id)
--------------------------------------
return:	0: chứng từ không cập nhật tồn kho
			1: cập nhật tồn kho thành công
		   -1: Lỗi
=============================================================================*/
int							li_rtn			
long						ll_f_object_row, ll_t_object_row
string						ls_balance_control, ls_warehouse_trans_type, ls_lot_yn,ls_serial_yn, ls_trans_qty_yn, ls_trans_val_yn
string						ls_f_object_type,ls_t_object_type, ls_tmp_object_type
double					ldb_qty_sku, ldb_trans_qty, ldb_trans_uom, ldb_round_diff, ldb_object_ref_id
double					ldb_f_object_id, ldb_t_object_id, ldb_tmp_object_id
boolean					lb_is_manage_value
t_dw_mpl				ldw_master
b_obj_instantiate		lobj_ins

//--Lấy Id của đối tượng --//
if rdw_f_object.dataobject = rpo_item.dynamic f_get_dataobject() then 
	ldb_f_object_id = rdw_f_object.getitemnumber( vl_item_row, vas_f_col_object[1])
else
	ldw_master = rdw_f_object.dynamic f_get_idw_master()
	if isvalid(ldw_master) then
		if ldw_master.dataobject = rpo_item.dynamic f_get_dataobject() then
			ldb_object_ref_id =  rpo_item.dynamic getitemnumber( vl_item_row, 'ID')
			ll_f_object_row = rdw_f_object.find("object_ref_id ="+string(ldb_object_ref_id),1,rdw_f_object.rowcount())
		end if
	end if
	if ll_f_object_row = 0 then ll_f_object_row = rdw_f_object.getrow( )
	if ll_f_object_row > 0 then
		ldb_f_object_id = rdw_f_object.getitemnumber( ll_f_object_row, vas_f_col_object[1])
	end if
end if		
if rdw_t_object.dataobject = rpo_item.dynamic f_get_dataobject() then 
	ldb_t_object_id = rdw_t_object.getitemnumber( vl_item_row, vas_t_col_object[1])
else
	ldw_master = rdw_t_object.dynamic f_get_idw_master()
	if isvalid(ldw_master) then
		if ldw_master.dataobject = rpo_item.dynamic f_get_dataobject() then
			ldb_object_ref_id =  rpo_item.dynamic getitemnumber( vl_item_row, 'ID')
			ll_t_object_row = rdw_t_object.find("object_ref_id ="+string(ldb_object_ref_id),1,rdw_t_object.rowcount())
		end if
	end if
	if ll_t_object_row = 0 then ll_t_object_row = rdw_t_object.getrow( )	
	if ll_t_object_row > 0 then
		ldb_t_object_id = rdw_t_object.getitemnumber( ll_t_object_row, vas_t_col_object[1])
	end if
end if		
if isnull(ldb_f_object_id) or ldb_f_object_id = 0 then 
	gf_messagebox('m.b_doc.f_insert_item_balance_row.01','Thông báo','Đối tượng ghi số xuất nhập kho chưa được nhập NULL','stop','ok',1)
	return -1
end if
if isnull(ldb_t_object_id) or ldb_t_object_id = 0 then 
	gf_messagebox('m.b_doc.f_insert_item_balance_row.01','Thông báo','Đối tượng ghi số xuất nhập kho chưa được nhập NULL','stop','ok',1)
	return -1
end if
ls_f_object_type = this.f_get_object_type(ldb_f_object_id )		
ls_t_object_type = this.f_get_object_type(ldb_t_object_id )		
if upper(ls_f_object_type) = 'WAREHOUSE' then
	ls_warehouse_trans_type = 'OUT'	
else
	ls_warehouse_trans_type = 'IN'
end if

lobj_ins.f_get_lot_or_serial_yn(vaa_data[1],  ls_lot_yn,ls_serial_yn)
lb_is_manage_value =  lobj_ins.f_is_managed_value( vaa_data[1])
//-- set sku_qty khi POST --//	
	if upper(vs_post_type) = 'POST' then
		if upper(vs_value_yn) = 'N' or  (upper(vs_value_yn) = 'Y' and (ls_lot_yn ='Y' or ls_serial_yn = 'Y') )  then  // nếu quản lý lot/seri ghi sổ gia trị chưa tình sku của lot/seri
			//-- Lây sku_qty và round diff --//		
			if this.f_set_Qty_sku(rt_transaction, rpo_item, vl_item_row,vaa_data[1],vdb_trans_uom, vs_qty_column, ls_warehouse_trans_type, ldb_qty_sku, ldb_round_diff) = -1 then return -1
		elseif upper(vs_value_yn) = 'Y' then			
			if not lb_is_manage_value then
				//-- Lây sku_qty và round diff --//		
				if this.f_set_Qty_sku(rt_transaction, rpo_item, vl_item_row,vaa_data[1],vdb_trans_uom, vs_qty_column, ls_warehouse_trans_type, ldb_qty_sku, ldb_round_diff) = -1 then return -1				
			else
				ldb_qty_sku = rpo_item.dynamic getitemnumber(vl_item_row,vs_qty_column+'_sku')
			end if
		else	
			ldb_qty_sku = rpo_item.dynamic getitemnumber(vl_item_row,vs_qty_column+'_sku')
		end if
	else //-- Lấy sku_qty khi UNPOST hoặc ghi sổ vừa SL vừa Giá trị--//
		ldb_qty_sku = rpo_item.dynamic getitemnumber(vl_item_row,vs_qty_column+'_sku')
		if isnull(ldb_qty_sku) then ldb_qty_sku = 0		
		//-- Lấy round diff --//
		if this.f_get_round_diff( rt_transaction, rpo_item, vl_item_row, vaa_data[1], vdb_trans_uom,vs_qty_column, ldb_round_diff) = -1 then return -1
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
		lobj_ins.f_update_round_diff( ldb_f_object_id, ldb_round_diff, rt_transaction)
	else
		lobj_ins.f_update_round_diff( ldb_t_object_id, ldb_round_diff, rt_transaction)
	end if	


//-- Lấy giá trị ghi sổ --//
if upper(vs_value_yn) = 'Y' then
	if upper(vs_post_type) = 'UNPOST' then vdb_value = - vdb_value
end if	
	
//-- Cập nhật đối tượng FROM --//
if upper(ls_f_object_type) = 'WAREHOUSE' then
	ls_balance_control  = lobj_ins.f_get_warehouse_negative(ldb_f_object_id )
else
	ls_balance_control = 'negative_allow'
end if			
vaa_data[6] = ldb_f_object_id	
	
//-- Cập nhật ghi sổ SL khi chứng từ chọn vừa ghi sổ SL vừa GT--//
if vs_qty_yn = 'Y'  and vs_trans_val_yn = 'N' then  //-- ghi sổ balance SL--//
	vaa_data[10] = 'N'
	vaa_data[11] = gdb_branch
	if this.f_update_item_balance(rt_transaction, vaa_data, vd_trans_date, ldb_qty_sku,0,'OUT',ls_balance_control, 'N' , 'N' ,ls_t_object_type) = -1 then
		return -1
	end if	
end if
if vs_value_yn = 'Y' and vs_qty_yn = 'Y'   then  //-- ghi sổ balance GT--//
	vaa_data[10] = vs_value_yn
	vaa_data[11] = gdb_branch
	if this.f_update_item_balance(rt_transaction, vaa_data, vd_trans_date, ldb_qty_sku,vdb_value,'OUT',ls_balance_control, 'N' , vs_value_yn,ls_t_object_type) = -1 then
		return -1
	end if
end if

//-- Cập nhật đối tượng TO --//
if upper(ls_t_object_type) = 'WAREHOUSE' then
	ls_balance_control  = lobj_ins.f_get_warehouse_negative(ldb_t_object_id )
else
	ls_balance_control = 'negative_allow'
end if
vaa_data[6] = ldb_t_object_id
//-- Cập nhật ghi sổ SL khi chứng từ chọn vừa ghi sổ SL vừa GT--//
if vs_qty_yn = 'Y'  and vs_trans_val_yn = 'N' then //-- ghi sổ balance SL--//
	vaa_data[10] = 'N'
	vaa_data[11] = gdb_branch
	if this.f_update_item_balance(rt_transaction, vaa_data, vd_trans_date, ldb_qty_sku,0,'IN',ls_balance_control, 'N' , 'N',ls_t_object_type) = -1 then
		return -1
	end if
end if
if vs_value_yn = 'Y' and  vs_qty_yn = 'Y'  then  //-- ghi sổ balance GT--//
	vaa_data[10] = vs_value_yn
	vaa_data[11] = gdb_branch
	if this.f_update_item_balance(rt_transaction, vaa_data, vd_trans_date, ldb_qty_sku,vdb_value,'IN',ls_balance_control, 'N' , vs_value_yn,ls_t_object_type) = -1 then
		return -1
	end if
end if

return 1

end function

public function integer f_insert_item_balance_row_multi (ref t_transaction rt_transaction, ref t_ds_db rds_item, ref long rl_item_row, t_ds_db vds_f_object, t_ds_db vds_t_object, date vd_trans_date, string vs_post_type, string vas_col_item[], string vas_col_item_value[], string vas_f_col_object[], string vas_t_col_object[], any vaa_data[], string vs_qty_yn, string vs_value_yn, double vdb_trans_uom, string vs_qty_column, double vdb_value, ref s_str_ds_4_posting rstr_ds_4_posting, string vs_trans_qty_yn, string vs_trans_val_yn);/**************************************************************************************
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
int							li_rtn, li_pos_s, li_pos_e, li_chr_nbr, li_idx_master			
long						ll_f_object_row, ll_t_object_row
string						ls_balance_control, ls_warehouse_trans_type, ls_lot_yn,ls_serial_yn
string						ls_f_object_type,ls_t_object_type, ls_tmp_object_type
double					ldb_qty_sku, ldb_trans_qty, ldb_trans_uom, ldb_round_diff, ldb_object_ref_id
double					ldb_f_object_id, ldb_t_object_id, ldb_tmp_object_id
boolean					lb_is_manage_value
b_obj_instantiate		lobj_ins


//--Lấy Id của đối tượng --//
if vds_f_object.dataobject = rds_item.dataobject then 
	ldb_f_object_id = vds_f_object.getitemnumber( rl_item_row, vas_f_col_object[1])
else
	ldb_object_ref_id =  rds_item.getitemnumber( rl_item_row, 'ID')
	 
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(vds_f_object.dataobject,len(vds_f_object.dataobject) -5) + '[')
	li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
	li_chr_nbr = li_pos_e - (li_pos_s + len(vds_f_object.dataobject) - 4)
	li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(vds_f_object.dataobject) - 4 , li_chr_nbr ))
	
	if rds_item.dataobject = rstr_ds_4_posting.ds_master[li_idx_master].dataobject then
		ll_f_object_row = vds_f_object.find("object_ref_id ="+string(ldb_object_ref_id),1,vds_f_object.rowcount())
		if ll_f_object_row > 0 then
			ldb_f_object_id = vds_f_object.getitemnumber( ll_f_object_row, vas_f_col_object[1])
		end if
	else
		ldb_object_ref_id =  rds_item.getitemnumber( rl_item_row, 'object_ref_id')
		 
		li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(rds_item.dataobject,len(rds_item.dataobject) -5) + '[')
		li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
		li_chr_nbr = li_pos_e - (li_pos_s + len(rds_item.dataobject) - 4)
		li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(rds_item.dataobject) - 4 , li_chr_nbr ))		
		if vds_f_object.dataobject = rstr_ds_4_posting.ds_master[li_idx_master].dataobject then
			ll_f_object_row = vds_f_object.find(" ID ="+string(ldb_object_ref_id),1,vds_f_object.rowcount())
			if ll_f_object_row > 0 then
				ldb_f_object_id = vds_f_object.getitemnumber( ll_f_object_row, vas_f_col_object[1])
			end if			
		elseif vds_f_object.rowcount() = 1 then
			ldb_f_object_id = vds_f_object.getitemnumber( 1, vas_f_col_object[1])
		end if
	end if
end if		


if vds_t_object.dataobject = rds_item.dataobject then 
	ldb_t_object_id = vds_t_object.getitemnumber( rl_item_row, vas_t_col_object[1])
else
	ldb_object_ref_id =  rds_item.getitemnumber( rl_item_row, 'ID')
	 
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(vds_t_object.dataobject, len(vds_t_object.dataobject) -5) + '[')
	li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
	li_chr_nbr = li_pos_e - (li_pos_s + len(vds_t_object.dataobject ) - 4)
	li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(vds_t_object.dataobject) - 4 , li_chr_nbr ))
	
	if rds_item.dataobject = rstr_ds_4_posting.ds_master[li_idx_master].dataobject then
		ll_t_object_row = vds_t_object.find("object_ref_id ="+string(ldb_object_ref_id),1,vds_t_object.rowcount())
		if ll_t_object_row > 0 then
			ldb_t_object_id = vds_t_object.getitemnumber( ll_t_object_row, vas_t_col_object[1])
		end if
	else
		ldb_object_ref_id =  rds_item.getitemnumber( rl_item_row, 'object_ref_id')
		 
		li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(rds_item.dataobject,len(rds_item.dataobject) -5) + '[')
		li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
		li_chr_nbr = li_pos_e - (li_pos_s + len(rds_item.dataobject) - 4)
		li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(rds_item.dataobject) - 4 , li_chr_nbr ))		
		if vds_t_object.dataobject = rstr_ds_4_posting.ds_master[li_idx_master].dataobject then
			ll_t_object_row = vds_t_object.find(" ID ="+string(ldb_object_ref_id),1,vds_t_object.rowcount())
			if ll_t_object_row > 0 then
				ldb_t_object_id = vds_t_object.getitemnumber( ll_t_object_row, vas_t_col_object[1])
			end if			
		elseif vds_t_object.rowcount() =1 then
			ldb_t_object_id = vds_t_object.getitemnumber( 1, vas_t_col_object[1])
		end if		
	end if		
end if		


if isnull(ldb_f_object_id) or ldb_f_object_id = 0 then 
	gf_messagebox('m.b_doc.f_insert_item_balance_row_multi.01','Thông báo','Đối tượng ghi sổ xuất nhập kho chưa được nhập NULL','stop','ok',1)
	return -1
end if
if isnull(ldb_t_object_id) or ldb_t_object_id = 0 then 
	gf_messagebox('m.b_doc.f_insert_item_balance_row_multi.01','Thông báo','Đối tượng ghi số xuất nhập kho chưa được nhập NULL','stop','ok',1)
	return -1
end if
ls_f_object_type = this.f_get_object_type(ldb_f_object_id )		
ls_t_object_type = this.f_get_object_type(ldb_t_object_id )		
if upper(ls_f_object_type) = 'WAREHOUSE' then
	ls_warehouse_trans_type = 'OUT'
else
	ls_warehouse_trans_type = 'IN'
end if

lobj_ins.f_get_lot_or_serial_yn(vaa_data[1],  ls_lot_yn,ls_serial_yn)
lb_is_manage_value =  lobj_ins.f_is_managed_value( vaa_data[1])

//-- set sku_qty khi POST --//	
//if upper(vs_qty_yn) = 'Y' then
	if upper(vs_post_type) = 'POST' then
		if upper(vs_value_yn) = 'N' or  (upper(vs_value_yn) = 'Y' and (ls_lot_yn ='Y' or ls_serial_yn = 'Y') ) then  // nếu quản lý lot/seri ghi sổ gia trị chưa tình sku của lot/seri
			//-- Lây sku_qty và round diff --//		
			if this.f_set_Qty_sku(rt_transaction, rds_item, rl_item_row,vaa_data[1],vdb_trans_uom, vs_qty_column, ls_warehouse_trans_type, ldb_qty_sku, ldb_round_diff) = -1 then return -1
		else
			ldb_qty_sku = rds_item.dynamic getitemnumber(rl_item_row,vs_qty_column+'_sku')
		end if
	else //-- Lấy sku_qty khi UNPOST hoặc ghi sổ vừa SL vừa Giá trị--//
		ldb_qty_sku = rds_item.dynamic getitemnumber(rl_item_row,vs_qty_column+'_sku')
		if isnull(ldb_qty_sku) then ldb_qty_sku = 0		
		//-- Lấy round diff --//
		if this.f_get_round_diff( rt_transaction, rds_item, rl_item_row, vaa_data[1], vdb_trans_uom,vs_qty_column, ldb_round_diff) = -1 then return -1
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
		lobj_ins.f_update_round_diff( ldb_f_object_id, ldb_round_diff, rt_transaction)
	else
		lobj_ins.f_update_round_diff( ldb_t_object_id, ldb_round_diff, rt_transaction)
	end if	
//end if

//-- Lấy giá trị ghi sổ --//
if upper(vs_value_yn) = 'Y' then
	if upper(vs_post_type) = 'UNPOST' then vdb_value = - vdb_value
end if	
	
//-- Cập nhật đối tượng FROM --//
if upper(ls_f_object_type) = 'WAREHOUSE' then
	ls_balance_control  = lobj_ins.f_get_warehouse_negative(ldb_f_object_id )

else
	ls_balance_control = 'negative_allow'
end if			
vaa_data[6] = ldb_f_object_id	
	
//-- Cập nhật ghi sổ SL khi chứng từ chọn vừa ghi sổ SL vừa GT--//
if vs_qty_yn = 'Y'  and vs_trans_val_yn = 'N'   then  //--Ghi số balance SL--//
	vaa_data[10] = 'N'
	vaa_data[11] = gdb_branch
	if this.f_update_item_balance(rt_transaction, vaa_data, vd_trans_date, ldb_qty_sku,0,'OUT',ls_balance_control, 'N' , 'N' ,ls_t_object_type) = -1 then
		return -1
	end if	
end if
if vs_value_yn = 'Y' and  vs_qty_yn = 'Y'  then   //--Ghi số balance GT--//
	vaa_data[10] = vs_value_yn
	vaa_data[11] = gdb_branch
	if this.f_update_item_balance(rt_transaction, vaa_data, vd_trans_date, ldb_qty_sku,vdb_value,'OUT',ls_balance_control, 'N' , vs_value_yn,ls_t_object_type) = -1 then
		return -1
	end if
end if

//-- Cập nhật đối tượng TO --//
if upper(ls_t_object_type) = 'WAREHOUSE' then
	ls_balance_control  = lobj_ins.f_get_warehouse_negative(ldb_t_object_id )
else
	ls_balance_control = 'negative_allow'
end if
vaa_data[6] = ldb_t_object_id
//-- Cập nhật ghi sổ SL khi chứng từ chọn vừa ghi sổ SL vừa GT--//
if vs_qty_yn = 'Y'  and vs_trans_val_yn = 'N'    then  //--Ghi số balance SL--//
	vaa_data[10] = 'N'
	vaa_data[11] = gdb_branch
	if this.f_update_item_balance(rt_transaction, vaa_data, vd_trans_date, ldb_qty_sku,0,'IN',ls_balance_control, 'N' , 'N',ls_t_object_type) = -1 then
		return -1
	end if
end if
if vs_value_yn = 'Y'  and  vs_qty_yn = 'Y'  then   //--Ghi số balance GT--//
	vaa_data[10] = vs_value_yn
	vaa_data[11] = gdb_branch
	if this.f_update_item_balance(rt_transaction, vaa_data, vd_trans_date, ldb_qty_sku,vdb_value,'IN',ls_balance_control, 'N' , vs_value_yn,ls_t_object_type) = -1 then
		return -1
	end if
end if

return 1

end function

public function integer f_b4_post_tax ();//Kiểm tra trước khi add dòng thuế --//

s_str_dwo_related	lstr_retaled[]

t_dw_mpl 	ldw_dr_cr_object, ldw_main
double		ldb_obj_id, ldb_trans_id, ldb_curr_id
long 			ll_find, li_idx

if not this.ib_copying then
	ldw_main =  iw_display.f_get_dw(istr_dwo[1].s_dwo_default )
	if ldw_main.getrow( ) > 0 then
		ldb_trans_id = ldw_main.getitemnumber( ldw_main.getrow( )  , 'TRANS_HDR_ID') 
		if isnull(ldb_trans_id) or ldb_trans_id = 0 then
			gf_messagebox('m.b_doc.f_post_tax.01','Thông báo','Chưa chọn giao dịch của chứng từ','exclamation','ok',1)
			ib_tax_error =true				
			return -1
		end if
	end if	
	
//	ll_find = ids_trans_setup.find( " dr_obj_type = 'TAX_AUTHORITY' or cr_obj_type = 'TAX_AUTHORITY' ", 1, ids_trans_setup.rowcount())
//	if ll_find > 0 then		
		this.f_get_data_related( lstr_retaled[])
		if upperbound(lstr_retaled[]) > 0 then
			for li_idx = 1 to upperbound(lstr_retaled[])
				if lstr_retaled[li_idx].s_related_obj_name = this.classname( ) then
					ldb_obj_id =  lstr_retaled[li_idx].db_dr_cr_object
				end if
				if ldb_obj_id > 0 then  exit
			next
		else
			ldw_dr_cr_object = iw_display.f_get_dw(istr_dwo[2].s_dwo_default )
			if ldw_dr_cr_object.describe( "invoice_object.coltype") = 'number' then
				ldb_obj_id = ldw_dr_cr_object.getitemnumber( ldw_dr_cr_object.getrow(), 'invoice_object')
			elseif ldw_dr_cr_object.describe( "bill_to_object.coltype") = 'number' then
				ldb_obj_id = ldw_dr_cr_object.getitemnumber( ldw_dr_cr_object.getrow(), 'bill_to_object')
			end if
			ldb_curr_id = ldw_dr_cr_object.getitemnumber( ldw_dr_cr_object.getrow(), 'CURRENCY_ID')
		end if
		
		if isnull(ldb_obj_id) or ldb_obj_id = 0 then
			gf_messagebox('m.b_doc.f_post_tax.02','Thông báo','Chưa nhập dữ liệu đối tượng (NCC/KH)','exclamation','ok',1)
			ib_tax_error =true
			return -1
		end if
		if isnull(ldb_curr_id) or ldb_curr_id = 0 then
			gf_messagebox('m.b_doc.f_post_tax.03','Thông báo','Chưa chọn loại tiền giao dịch','exclamation','ok',1)
			ib_tax_error =true
			return -1
		end if		
		return 1
//	end if
end if
return 0

end function

public function integer f_update_tax_after_copy (string vs_dw_binding, double vdb_master_id);//--Hàm update lại thuế trường hợp kết phiếu không chọn copy thuế--//

s_str_dwo_related	lstr_retaled[]

c_dwservice	lc_dwser
t_dw_mpl 	ldw_binding,ldw_dr_cr_object
c_string		lc_str
double		ldb_obj_id
string			ls_obj_type,ls_filter,ls_col_criterial,ls_dw_criterial,ls_val_criterial,ls_col_type,ls_trans_id
long 			ll_idx, ll_row,ll_find
any 			la_value[], la_retrieve_arg[], la_null[]
int				li_idx

ll_find = ids_trans_setup.find( " dr_obj_type = 'TAX_AUTHORITY' or cr_obj_type = 'TAX_AUTHORITY' ", 1, ids_trans_setup.rowcount())
if ll_find > 0 then
	ldw_dr_cr_object = iw_display.f_get_dw(istr_dwo[2].s_dwo_default )
	if ldw_dr_cr_object.describe( "invoice_object.coltype") = 'number' then
		ldb_obj_id = ldw_dr_cr_object.getitemnumber( ldw_dr_cr_object.getrow(), 'invoice_object')
	elseif ldw_dr_cr_object.describe( "bill_to_object.coltype") = 'number' then
		ldb_obj_id = ldw_dr_cr_object.getitemnumber( ldw_dr_cr_object.getrow(), 'bill_to_object')
	end if
	if ldb_obj_id > 0 then	ls_obj_type = this.f_get_object_type( ldb_obj_id)

	ls_filter = " and (cr_obj_type = '" + ls_obj_type + "' or cr_obj_type = 'ITEM' or cr_obj_type = 'ACCOUNT')"
	if ls_obj_type = '' then ls_filter = ''
	ids_trans_setup.setfilter("lower(dr_obj_type) ='tax_authority'" + ls_filter)
	ids_trans_setup.filter()
	if ids_trans_setup.rowcount( ) > 0 then
		for ll_idx = 1 to ids_trans_setup.rowcount( )
			ls_dw_criterial = ids_trans_setup.getitemstring( ll_idx, 'CR_DW_CRITERIAL')
			ls_col_criterial = ids_trans_setup.getitemstring( ll_idx, 'CR_COL_CRITERIAL')
			ls_val_criterial = ids_trans_setup.getitemstring( ll_idx, 'CR_VALUE_CRITERIAL')
			if isvalid(ldw_dr_cr_object) then
				lc_dwser.f_get_build_column( ldw_dr_cr_object, ls_col_criterial, ls_col_type)
				ls_filter = lc_str.f_get_expression( ls_val_criterial, ls_col_type, ls_col_criterial, 'filter')
				ll_find = ldw_dr_cr_object.find( ls_filter, 1, ldw_dr_cr_object.rowcount())
				if ll_find > 0 then
					ls_trans_id += string(ids_trans_setup.getitemnumber(ll_idx,'id')) +','
				end if
			end if
		next
		if ls_trans_id <> '' then
			ls_trans_id = left(ls_trans_id,len(ls_trans_id)-1)
			ids_trans_setup.setfilter( "id in (" + ls_trans_id + ')')
			ids_trans_setup.filter( )
			ls_trans_id = ''
		end if
	end if
	ldw_binding = iw_display.f_get_dw(vs_dw_binding)
	for ll_idx = 1 to ids_trans_setup.rowcount()
		la_value[1] = ids_trans_setup.getitemnumber(ll_idx,'dr_obj_instance_id')
		ll_find = ldw_binding.find( 'tax_id = '+string(la_value[1]) + ' AND object_ref_id = '+string(vdb_master_id) , 1, ldw_binding.rowcount( ) )
		if ll_find > 0 then 
			ll_row = ll_find
		else
			ll_row = ldw_binding.event e_addrow()
		end if
		ldw_binding.setitem(ll_row,'tax_id',ids_trans_setup.getitemnumber(ll_idx,'dr_obj_instance_id'))
		ldw_binding.setitem(ll_row,'object_code',ids_trans_setup.getitemstring(ll_idx,'dr_object_code'))
		ldw_binding.setitem(ll_row,'object_name',ids_trans_setup.getitemstring(ll_idx,'dr_object_name'))
		ldw_binding.setitem(ll_row,'tax_type',ids_trans_setup.getitemstring(ll_idx,'dr_object_code'))
		ldw_binding.setitem(ll_row,'uprow_yn',ids_trans_setup.getitemstring(ll_idx,'dr_uprow_yn'))
		ldw_binding.setitem(ll_row,'INCLUDE_YN',ids_trans_setup.getitemstring(ll_idx,'dr_INCLUDE_YN'))
		ldw_binding.setitem(ll_row,'tax_report_group',ids_trans_setup.getitemnumber(ll_idx,'tax_report_group'))
		ldw_binding.setitem(ll_row,'tax_report_group_code',ids_trans_setup.getitemstring(ll_idx,'tax_report_group_code'))
		if ids_currency.rowcount() > 0 then
			ldw_binding.setitem(ll_row,'trans_currency',ids_currency.getitemnumber(1,'id'))
			ldw_binding.setitem(ll_row,'uom_code',ids_currency.getitemstring(1,'code'))
			ldw_binding.setitem(ll_row,'exchange_rate',1)
		end if
		la_value[1] = ids_trans_setup.getitemnumber(ll_idx,'dr_obj_instance_id')
		ids_tax_authority.setfilter( "object_ref_id = " + string(la_value[1]))
		ids_tax_authority.filter( )
		if ids_tax_authority.rowcount() > 0 then
			ldw_binding.setitem(ll_row,'tax_pct',ids_tax_authority.getitemnumber(1,'default_pct') )
		end if
	next
	
	
	ls_filter = " and (dr_obj_type = '" + ls_obj_type + "' or dr_obj_type = 'ITEM' or dr_obj_type = 'ACCOUNT')"
	if ls_obj_type = '' then ls_filter = ''
	ids_trans_setup.setfilter("lower(cr_obj_type) ='tax_authority'" + ls_filter)
	ids_trans_setup.filter()
	if ids_trans_setup.rowcount( ) > 0 then
		for ll_idx = 1 to ids_trans_setup.rowcount( )
			ls_dw_criterial = ids_trans_setup.getitemstring( ll_idx, 'DR_DW_CRITERIAL')
			ls_col_criterial = ids_trans_setup.getitemstring( ll_idx, 'DR_COL_CRITERIAL')
			ls_val_criterial = ids_trans_setup.getitemstring( ll_idx, 'DR_VALUE_CRITERIAL')
			if isvalid(ldw_dr_cr_object) then
				lc_dwser.f_get_build_column( ldw_dr_cr_object, ls_col_criterial, ls_col_type)
				ls_filter = lc_str.f_get_expression( ls_val_criterial, ls_col_type, ls_col_criterial, 'filter')
				ll_find = ldw_dr_cr_object.find( ls_filter, 1, ldw_dr_cr_object.rowcount())
				if ll_find > 0 then
					ls_trans_id += string(ids_trans_setup.getitemnumber(ll_idx,'id')) +','
				end if
			end if
		next
		if ls_trans_id <> '' then
			ls_trans_id = left(ls_trans_id,len(ls_trans_id)-1)
			ids_trans_setup.setfilter( "id in (" + ls_trans_id + ')')
			ids_trans_setup.filter( )
			ls_trans_id = ''
		end if
	end if
	for ll_idx = 1 to ids_trans_setup.rowcount()
		la_value[1] = ids_trans_setup.getitemnumber(ll_idx,'cr_obj_instance_id')
		ll_find = ldw_binding.find( 'tax_id = '+string(la_value[1]) + ' AND object_ref_id = '+string(vdb_master_id) , 1, ldw_binding.rowcount( ))
		if ll_find > 0 then 
			ll_row = ll_find
		else
			ll_row = ldw_binding.event e_addrow()
		end if
		ldw_binding.setitem(ll_row,'tax_id',ids_trans_setup.getitemnumber(ll_idx,'cr_obj_instance_id'))
		ldw_binding.setitem(ll_row,'object_code',ids_trans_setup.getitemstring(ll_idx,'cr_object_code'))
		ldw_binding.setitem(ll_row,'object_name',ids_trans_setup.getitemstring(ll_idx,'cr_object_name'))
		ldw_binding.setitem(ll_row,'tax_type',ids_trans_setup.getitemstring(ll_idx,'cr_object_code'))
		ldw_binding.setitem(ll_row,'uprow_yn',ids_trans_setup.getitemstring(ll_idx,'cr_uprow_yn'))
		ldw_binding.setitem(ll_row,'INCLUDE_YN',ids_trans_setup.getitemstring(ll_idx,'cr_INCLUDE_YN'))
		ldw_binding.setitem(ll_row,'tax_report_group',ids_trans_setup.getitemnumber(ll_idx,'tax_report_group'))
		ldw_binding.setitem(ll_row,'tax_report_group_code',ids_trans_setup.getitemstring(ll_idx,'tax_report_group_code'))
		if ids_currency.rowcount() > 0 then
			ldw_binding.setitem(ll_row,'trans_currency',ids_currency.getitemnumber(1,'id'))
			ldw_binding.setitem(ll_row,'uom_code',ids_currency.getitemstring(1,'code'))
			ldw_binding.setitem(ll_row,'exchange_rate',1)
		end if
		la_value[1] = ids_trans_setup.getitemnumber(ll_idx,'cr_obj_instance_id')
		ids_tax_authority.setfilter( "object_ref_id = " + string(la_value[1]))
		ids_tax_authority.filter( )
		if ids_tax_authority.rowcount() > 0 then
			ldw_binding.setitem(ll_row,'tax_pct',ids_tax_authority.getitemnumber(1,'default_pct') )
		end if
	next
	return 1
end if
return 0
end function

public function integer f_update_streamvalue_multi_ex (t_ds_db vdw_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row, t_ds_db vdw_f_object, string vas_f_object_col[], string vas_f_object_col_sv[], t_ds_db vdw_t_object, string vas_t_object_col[], string vas_t_object_col_sv[], ref s_str_ds_4_posting rstr_ds_4_posting, s_str_data vstr_data_from_to);int				li_idx,li_rtn, li_pos_s, li_pos_e, li_chr_nbr, li_idx_master
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

if li_rtn = -1 then
	gf_messagebox('m.b_doc.f_update_streamvalue_multi.021','Thông báo','Lỗi setitem vào datastore rd_streamvalue: f_update_streamvalue(68)','stop','ok',1)
	return -1
end if

return li_rtn
end function

public function integer f_update_streamvalue_multi_ex (t_ds_db vdw_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row, t_ds_db vdw_f_object, string vas_f_object_col[], string vas_f_object_col_sv[], t_ds_db vdw_t_object, string vas_t_object_col[], string vas_t_object_col_sv[], t_ds_db vdw_currency, string vas_cur_col[], string vas_cur_col_sv[], double vdb_trans_value, double vdb_base_value, ref s_str_ds_4_posting rstr_ds_4_posting, s_str_data vstr_data_from_to);int				li_idx,li_rtn, li_pos_s, li_pos_e, li_chr_nbr, li_idx_master
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

public function integer f_update_streamvalue_ex (t_dw_mpl vdw_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row, t_dw_mpl vdw_f_object, string vas_f_object_col[], string vas_f_object_col_sv[], t_dw_mpl vdw_t_object, string vas_t_object_col[], string vas_t_object_col_sv[], t_dw_mpl vdw_currency, string vas_cur_col[], string vas_cur_col_sv[], double vdb_trans_value, double vdb_base_value, s_str_data vstr_data_from_to);int				li_idx,li_rtn
long			ll_t_object_row, ll_f_object_row, ll_currency_row
double		ldb_object_ref_id, ldb_qty, ldb_sv_qty, ldb_f_object, ldb_t_object, ldb_tmp_object
t_dw_mpl	ldw_master

//-- update các giá trị của dw item/lot/value--//
for li_idx = 1 to upperbound(vas_data_col)
	if pos(upper(vs_pas_col), upper(vas_update_col[li_idx])+';' ) > 0  then continue
	
	if upper(vas_data_col[li_idx])= 'QTY' then 
		ldb_qty = vdw_data.dynamic f_getitemany( vl_data_row, vas_data_col[li_idx]+'_sku')
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
		li_rtn = rds_stream.setitem( vl_update_row,vas_update_col[li_idx], vdw_data.dynamic f_getitemany( vl_data_row, vas_data_col[li_idx])  )
	end if
next

if li_rtn = -1 then
	gf_messagebox('m.b_doc.f_update_streamvalue.01','Thông báo','Lỗi setitem vào datastore rd_streamvalue: f_update_streamvalue(28)','stop','ok',1)
	return -1
end if

//-- update f_object và t_object --//
if vdw_f_object.dataobject = vdw_data.dataobject then
	ll_f_object_row = vl_data_row
else
	ldw_master = vdw_data.dynamic f_get_idw_master()
	if isvalid(ldw_master) then
		if ldw_master.dataobject = vdw_f_object.dataobject then
			ldb_object_ref_id = vdw_data.getitemnumber(vl_data_row, 'object_ref_id')
			ll_f_object_row = ldw_master.find('ID ='+string(ldb_object_ref_id), 1 , ldw_master.rowcount())
		end if
	end if
	if ll_f_object_row = 0 then ll_f_object_row = vdw_f_object.getrow()
end if

if vdw_t_object.dataobject = vdw_data.dataobject then
	ll_t_object_row = vl_data_row
else
	ldw_master = vdw_data.dynamic f_get_idw_master()
	if isvalid(ldw_master) then
		if ldw_master.dataobject = vdw_t_object.dataobject then
			ldb_object_ref_id = vdw_data.getitemnumber(vl_data_row, 'object_ref_id')
			ll_t_object_row = ldw_master.find('ID ='+string(ldb_object_ref_id), 1 , ldw_master.rowcount())
		end if
	end if
	if ll_t_object_row = 0 then ll_t_object_row = vdw_t_object.getrow()
end if
for li_idx = 1 to upperbound(vas_f_object_col[])
	if li_idx = 1 then
		 ldb_f_object = vdw_f_object.dynamic f_getitemany( ll_f_object_row, vas_f_object_col[li_idx] )
		 ldb_t_object = vdw_t_object.dynamic f_getitemany( ll_t_object_row, vas_t_object_col[li_idx] )
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
	gf_messagebox('m.b_doc.f_update_streamvalue.02','Thông báo','Lỗi setitem vào datastore rd_streamvalue: f_update_streamvalue(70)','stop','ok',1)
	return -1
end if

//-- update currency --//
if isvalid(vdw_currency) then
	if vdw_currency.dataobject = vdw_data.dataobject then
		ll_currency_row = vl_data_row
	else
	//	ldw_master = vdw_data.f_get_idw_master()
	//	if isvalid(ldw_master) then
	//		if ldw_master.dataobject = vdw_currency.dataobject then
	//			ldb_object_ref_id = vdw_data.getitemnumber(vl_data_row, 'object_ref_id')
	//			ll_currency_row = ldw_master.find('ID ='+string(ldb_object_ref_id), 1 , ldw_master.rowcount())
	//		end if
	//	end if
		if ll_currency_row = 0 then ll_currency_row = vdw_currency.getrow()
	end if
	for li_idx = 1 to upperbound(vas_cur_col[])
		li_rtn = rds_stream.setitem( vl_update_row,vas_cur_col_sv[li_idx], vdw_currency.dynamic f_getitemany( ll_currency_row, vas_cur_col[li_idx] ))
	next 
	if li_rtn = -1 then
		gf_messagebox('m.b_doc.f_update_streamvalue.03','Thông báo','Lỗi setitem vào datastore rd_streamvalue: f_update_streamvalue(91)','stop','ok',1)
		return -1
	end if
end if
return li_rtn
end function

public function integer f_update_streamvalue_ex (t_dw_mpl vdw_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row, t_dw_mpl vdw_f_object, string vas_f_object_col[], string vas_f_object_col_sv[], t_dw_mpl vdw_t_object, string vas_t_object_col[], string vas_t_object_col_sv[], s_str_data vstr_data_from_to);int				li_idx,li_rtn
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
	gf_messagebox('m.b_doc.f_update_streamvalue.01','Thông báo','Lỗi setitem vào datastore rd_streamvalue: f_update_streamvalue(24)','stop','ok',1)
	return -1
end if

//-- update f_object và t_object --//
if vdw_f_object.dataobject = vdw_data.dataobject then
	ll_f_object_row = vl_data_row
else
	ldw_master = vdw_data.f_get_idw_master()
	if isvalid(ldw_master) then
		if ldw_master.dataobject = vdw_f_object.dataobject then
			ldb_object_ref_id = vdw_data.getitemnumber(vl_data_row, 'object_ref_id')
			ll_f_object_row = ldw_master.find('ID ='+string(ldb_object_ref_id), 1 , ldw_master.rowcount())
		end if
	end if
	if ll_f_object_row = 0 then ll_f_object_row = vdw_f_object.getrow()
end if

if vdw_t_object.dataobject = vdw_data.dataobject then
	ll_t_object_row = vl_data_row
else
	ldw_master = vdw_data.f_get_idw_master()
	if isvalid(ldw_master) then
		if ldw_master.dataobject = vdw_t_object.dataobject then
			ldb_object_ref_id = vdw_data.getitemnumber(vl_data_row, 'object_ref_id')
			ll_t_object_row = ldw_master.find('ID ='+string(ldb_object_ref_id), 1 , ldw_master.rowcount())
		end if
	end if
	if ll_t_object_row = 0 then ll_t_object_row = vdw_t_object.getrow()
end if

for li_idx = 1 to upperbound(vas_f_object_col[])
	if  li_idx = 1 then
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


if li_rtn = -1 then
	gf_messagebox('m.b_doc.f_update_streamvalue.02','Thông báo','Lỗi setitem vào datastore rd_streamvalue: f_update_streamvalue(68)','stop','ok',1)
	return -1
end if

return li_rtn
end function

public function integer f_get_dw_of_streamvalue_ex (ref t_dw_mpl rdw_item, ref t_dw_mpl rdw_f_object, ref t_dw_mpl rdw_t_object, t_dw_mpl rdw_f_lot, t_dw_mpl rdw_t_lot, ref t_dw_mpl rdw_item_value, ref t_dw_mpl rdw_item_lot, ref t_dw_mpl rdw_currency, integer vi_idx);//-- Lấy dw trên form theo cài đặt streamvalue structure: để thực hiện update item balance --//

c_string					lc_string


//-- Lấy dw --//
if lower(this.istr_streamvalue[vi_idx].s_item_dwo) = 'none' then return 0
rdw_item = iw_display.dynamic f_get_dw(this.istr_streamvalue[vi_idx].s_item_dwo)
if not isvalid(rdw_item) then
	gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.01','Thông báo','DW mã hàng trong streamvalue structure không hợp lệ','stop','ok',1)		
	return -1
end if
if rdw_item.rowcount() = 0 then rdw_item.event e_retrieve()

if this.istr_streamvalue[vi_idx].s_f_obj_dwo = this.istr_streamvalue[vi_idx].s_item_dwo then
	rdw_f_object = rdw_item
else
	rdw_f_object = iw_display.dynamic f_get_dw(this.istr_streamvalue[vi_idx].s_f_obj_dwo)
	if not isvalid(rdw_f_object) then
		gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.02','Thông báo','DW đối tượng FROM trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if	
	if rdw_f_object.rowcount() = 0 then rdw_f_object.event e_retrieve()
end if

if this.istr_streamvalue[vi_idx].s_t_obj_dwo = this.istr_streamvalue[vi_idx].s_item_dwo then
	rdw_t_object = rdw_item
else
	rdw_t_object =  iw_display.dynamic f_get_dw(this.istr_streamvalue[vi_idx].s_t_obj_dwo)
	if not isvalid(rdw_t_object) then
		gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.03','Thông báo','DW đối tượng TO trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if	
	if rdw_t_object.rowcount() = 0 then rdw_t_object.event e_retrieve()
end if
//-- lây dw giá trị --//

if this.istr_streamvalue[vi_idx].s_item_dwo = this.istr_streamvalue[vi_idx].s_value_dwo then
	rdw_item_value = rdw_item
elseif this.istr_streamvalue[vi_idx].s_value_dwo <> '' then
	rdw_item_value = iw_display.dynamic f_get_dw(this.istr_streamvalue[vi_idx].s_value_dwo)
	if not isvalid(rdw_item_value) then
		gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.04','Thông báo','DW giá trị hàng trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if			
end if

//-- Lấy dw lot--//
if this.istr_streamvalue[vi_idx].s_item_lot_dwo <> '' and left(this.istr_streamvalue[vi_idx].s_item_lot_dwo, 3) <> 'ds_' then
	rdw_item_lot = iw_display.dynamic f_get_dw(this.istr_streamvalue[vi_idx].s_item_lot_dwo)
	if not isvalid(rdw_item_lot) then
		gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.05','Thông báo','DW item_lot trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if
end if
if this.istr_streamvalue[vi_idx].s_f_lot_dwo <> '' and left(this.istr_streamvalue[vi_idx].s_f_lot_dwo, 3) <> 'ds_' then
	rdw_f_lot = iw_display.dynamic f_get_dw(this.istr_streamvalue[vi_idx].s_f_lot_dwo)
	if not isvalid(rdw_f_lot) then
		gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.07','Thông báo','DW F_LOT trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if
end if
if this.istr_streamvalue[vi_idx].s_t_lot_dwo <> '' and left(this.istr_streamvalue[vi_idx].s_t_lot_dwo, 3) <> 'ds_' then
	rdw_t_lot = iw_display.dynamic f_get_dw(this.istr_streamvalue[vi_idx].s_t_lot_dwo)
	if not isvalid(rdw_t_lot) then
		gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.08','Thông báo','DW T_LOT trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if
end if

//-- lấy dw currency --//
if this.istr_streamvalue[vi_idx].s_currency_dwo <> '' then
	rdw_currency = iw_display.dynamic f_get_dw(this.istr_streamvalue[vi_idx].s_currency_dwo)
	if not isvalid(rdw_currency) then
		gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.06','Thông báo','DW currency trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if
end if
//-- Kết thúc lấy dw --//
return 1
end function

public function integer f_get_ds_of_streamvalue_ex (double vdb_doc_version, ref t_ds_db rdw_item, ref t_ds_db rdw_f_object, ref t_ds_db rdw_t_object, ref t_ds_db rdw_f_lot, ref t_ds_db rdw_t_lot, ref t_ds_db rdw_item_value, ref t_ds_db rdw_item_lot, ref t_ds_db rdw_currency, integer vi_idx, ref s_str_ds_4_posting rstr_ds_4_posting, ref t_transaction rt_transaction);//-- Lấy dw trên form theo cài đặt streamvalue structure: để thực hiện update item balance --//
string						ls_colname, ls_coltype
int							li_idx, li_pos_s, li_pos_e, li_chr_nbr
c_string					lc_string
c_dwservice				l_dwservice	

//-- Lấy dw --//
if lower(this.istr_streamvalue[vi_idx].s_item_dwo) = 'none' then return 0

li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(this.istr_streamvalue[vi_idx].s_item_dwo, len(this.istr_streamvalue[vi_idx].s_item_dwo) - 5 ) + '[')
li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
li_chr_nbr = li_pos_e - (li_pos_s + len(this.istr_streamvalue[vi_idx].s_item_dwo ) - 4 )
li_idx = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(this.istr_streamvalue[vi_idx].s_item_dwo ) - 4 , li_chr_nbr ))

rdw_item = rstr_ds_4_posting.ds_details[li_idx]						

if not isvalid(rdw_item) then
	gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.01','Thông báo','DW mã hàng trong streamvalue structure không hợp lệ','stop','ok',1)		
	return -1
end if
if rdw_item.rowcount() = 0 then 
	IF upper(rdw_item.describe("DataWindow.Table.UpdateTable")) <> 'BOOKED_SLIP' THEN		
		rdw_item.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " booked_slip.ID = " + string(vdb_doc_version) , " AND " )
	else
		ls_colname = 'ID'
		l_dwservice.f_get_build_column(rdw_item, ls_colname, ls_coltype)
		rdw_item.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " "+ ls_colname+" = " + string(vdb_doc_version) , " AND " )
	end if
	rdw_item.f_settransobject(rt_transaction)								
	rdw_item.event e_retrieve()
end if 
if this.istr_streamvalue[vi_idx].s_f_obj_dwo = this.istr_streamvalue[vi_idx].s_item_dwo then
	rdw_f_object = rdw_item
else	
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(this.istr_streamvalue[vi_idx].s_f_obj_dwo, len(this.istr_streamvalue[vi_idx].s_f_obj_dwo) - 5) + '[')
	li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
	li_chr_nbr = li_pos_e - (li_pos_s + len(this.istr_streamvalue[vi_idx].s_f_obj_dwo ) - 4 )
	li_idx = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(this.istr_streamvalue[vi_idx].s_f_obj_dwo) - 4 , li_chr_nbr ))
	
	rdw_f_object = rstr_ds_4_posting.ds_details[li_idx]					
	if not isvalid(rdw_f_object) then
		gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.02','Thông báo','DW đối tượng FROM trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if	
	if rdw_f_object.rowcount() = 0 then 
		IF upper(rdw_f_object.describe("DataWindow.Table.UpdateTable")) <> 'BOOKED_SLIP' THEN		
			rdw_f_object.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " booked_slip.ID = " + string(vdb_doc_version) , " AND " )
		else
			ls_colname = 'ID'
			l_dwservice.f_get_build_column(rdw_f_object, ls_colname, ls_coltype)
			rdw_f_object.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " "+ ls_colname+" = " + string(vdb_doc_version) , " AND " )
		end if		
		
		rdw_f_object.f_settransobject(rt_transaction)			
		rdw_f_object.event e_retrieve()
	end if
end if

if this.istr_streamvalue[vi_idx].s_t_obj_dwo = this.istr_streamvalue[vi_idx].s_item_dwo then
	rdw_t_object = rdw_item
else
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(this.istr_streamvalue[vi_idx].s_t_obj_dwo, len(this.istr_streamvalue[vi_idx].s_t_obj_dwo) - 5) + '[')
	li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
	li_chr_nbr = li_pos_e - ( li_pos_s + len(this.istr_streamvalue[vi_idx].s_t_obj_dwo ) - 4 )
	li_idx = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(this.istr_streamvalue[vi_idx].s_t_obj_dwo ) - 4 , li_chr_nbr ))
	
	rdw_t_object = rstr_ds_4_posting.ds_details[li_idx]						
	if not isvalid(rdw_t_object) then
		gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.03','Thông báo','DW đối tượng TO trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if	
	if rdw_t_object.rowcount() = 0 then 
		IF upper(rdw_t_object.describe("DataWindow.Table.UpdateTable")) <> 'BOOKED_SLIP' THEN	
			rdw_t_object.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " booked_slip.ID = " + string(vdb_doc_version) , " AND " )
		else
			ls_colname = 'ID'
			l_dwservice.f_get_build_column(rdw_t_object, ls_colname, ls_coltype)			
			rdw_t_object.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " "+ ls_colname+" = "  + string(vdb_doc_version) , " AND " )
		end if
		rdw_t_object.f_settransobject(rt_transaction)			
		rdw_t_object.event e_retrieve()
	end if
end if
//-- lây dw giá trị --//

if this.istr_streamvalue[vi_idx].s_item_dwo = this.istr_streamvalue[vi_idx].s_value_dwo then
	rdw_item_value = rdw_item
elseif this.istr_streamvalue[vi_idx].s_value_dwo <> '' then	
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(this.istr_streamvalue[vi_idx].s_value_dwo, len(this.istr_streamvalue[vi_idx].s_value_dwo) - 5) + '[')
	li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
	li_chr_nbr = li_pos_e - (li_pos_s + len(this.istr_streamvalue[vi_idx].s_value_dwo) - 4 )
	li_idx = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(this.istr_streamvalue[vi_idx].s_value_dwo ) - 4 , li_chr_nbr ))
	
	rdw_item_value = rstr_ds_4_posting.ds_details[li_idx]			

	if not isvalid(rdw_item_value) then
		gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.04','Thông báo','DW giá trị hàng trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if			
	if rdw_item_value.rowcount() = 0 then 
		IF upper(rdw_item_value.describe("DataWindow.Table.UpdateTable")) <> 'BOOKED_SLIP' THEN	
			rdw_item_value.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " booked_slip.ID = " + string(vdb_doc_version) , " AND " )
		else 
			ls_colname = 'ID'
			l_dwservice.f_get_build_column(rdw_item_value, ls_colname, ls_coltype)				
			rdw_item_value.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " "+ ls_colname+" = " + string(vdb_doc_version) , " AND " )
		end if
		rdw_item_value.f_settransobject(rt_transaction)			
		rdw_item_value.event e_retrieve()
	end if	
	
end if

//-- Lấy dw lot--//
if this.istr_streamvalue[vi_idx].s_item_lot_dwo <> '' and left(this.istr_streamvalue[vi_idx].s_item_lot_dwo, 3) <> 'ds_' then	
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(this.istr_streamvalue[vi_idx].s_item_lot_dwo, len(this.istr_streamvalue[vi_idx].s_item_lot_dwo) - 5) + '[')
	li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
	li_chr_nbr = li_pos_e -( li_pos_s + len(this.istr_streamvalue[vi_idx].s_item_lot_dwo ) - 4)
	li_idx = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(this.istr_streamvalue[vi_idx].s_item_lot_dwo) - 4 , li_chr_nbr ))
	
	rdw_item_lot = rstr_ds_4_posting.ds_details[li_idx]			
	
	if not isvalid(rdw_item_lot) then
		gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.05','Thông báo','DW item_lot trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if
	if rdw_item_lot.rowcount() = 0 then 
		IF upper(rdw_item_lot.describe("DataWindow.Table.UpdateTable")) <> 'BOOKED_SLIP' THEN	
			rdw_item_lot.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " booked_slip.ID = " + string(vdb_doc_version) , " AND " )
		else
			ls_colname = 'ID'
			l_dwservice.f_get_build_column(rdw_item_lot, ls_colname, ls_coltype)					
			rdw_item_lot.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " "+ ls_colname+" = " + string(vdb_doc_version) , " AND " )
		end if
		rdw_item_lot.f_settransobject(rt_transaction)			
		rdw_item_lot.event e_retrieve()
	end if			
end if
//--ds f_lot --//
if this.istr_streamvalue[vi_idx].s_f_lot_dwo = this.istr_streamvalue[vi_idx].s_item_lot_dwo then
	rdw_f_lot = rdw_item_lot
elseif this.istr_streamvalue[vi_idx].s_f_lot_dwo <> '' then	
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(this.istr_streamvalue[vi_idx].s_f_lot_dwo, len(this.istr_streamvalue[vi_idx].s_f_lot_dwo) - 5) + '[')
	li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
	li_chr_nbr = li_pos_e -( li_pos_s + len(this.istr_streamvalue[vi_idx].s_f_lot_dwo ) - 4)
	li_idx = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(this.istr_streamvalue[vi_idx].s_f_lot_dwo) - 4 , li_chr_nbr ))
	
	rdw_f_lot = rstr_ds_4_posting.ds_details[li_idx]			
	
	if not isvalid(rdw_f_lot) then
		gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.07','Thông báo','DW f_lot trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if
	if rdw_f_lot.rowcount() = 0 then 
		IF upper(rdw_f_lot.describe("DataWindow.Table.UpdateTable")) <> 'BOOKED_SLIP' THEN	
			rdw_f_lot.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " booked_slip.ID = " + string(vdb_doc_version) , " AND " )
		else
			ls_colname = 'ID'
			l_dwservice.f_get_build_column(rdw_f_lot, ls_colname, ls_coltype)					
			rdw_f_lot.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " "+ ls_colname+" = " + string(vdb_doc_version) , " AND " )
		end if
		rdw_f_lot.f_settransobject(rt_transaction)			
		rdw_f_lot.event e_retrieve()
	end if		
end if
//--ds t_lot --/
if this.istr_streamvalue[vi_idx].s_t_lot_dwo = this.istr_streamvalue[vi_idx].s_t_obj_dwo then
	rdw_t_lot = rdw_t_object
elseif this.istr_streamvalue[vi_idx].s_t_lot_dwo <> '' then	
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(this.istr_streamvalue[vi_idx].s_t_lot_dwo, len(this.istr_streamvalue[vi_idx].s_t_lot_dwo) - 5) + '[')
	li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
	li_chr_nbr = li_pos_e -( li_pos_s + len(this.istr_streamvalue[vi_idx].s_t_lot_dwo ) - 4)
	li_idx = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(this.istr_streamvalue[vi_idx].s_t_lot_dwo) - 4 , li_chr_nbr ))
	
	rdw_t_lot = rstr_ds_4_posting.ds_details[li_idx]			
	
	if not isvalid(rdw_t_lot) then
		gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.08','Thông báo','DW T_lot trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if
	if rdw_t_lot.rowcount() = 0 then 
		IF upper(rdw_f_lot.describe("DataWindow.Table.UpdateTable")) <> 'BOOKED_SLIP' THEN	
			rdw_t_lot.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " booked_slip.ID = " + string(vdb_doc_version) , " AND " )
		else
			ls_colname = 'ID'
			l_dwservice.f_get_build_column(rdw_t_lot, ls_colname, ls_coltype)					
			rdw_t_lot.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " "+ ls_colname+" = " + string(vdb_doc_version) , " AND " )
		end if
		rdw_t_lot.f_settransobject(rt_transaction)			
		rdw_t_lot.event e_retrieve()
	end if		
end if

//-- lấy dw currency --//
if this.istr_streamvalue[vi_idx].s_currency_dwo <> '' then
	
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(this.istr_streamvalue[vi_idx].s_currency_dwo, len(this.istr_streamvalue[vi_idx].s_currency_dwo) - 5) + '[')
	li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
	li_chr_nbr = li_pos_e - (li_pos_s + len(this.istr_streamvalue[vi_idx].s_currency_dwo ) - 4 )
	li_idx = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(this.istr_streamvalue[vi_idx].s_currency_dwo ) - 4 , li_chr_nbr ))
	
	rdw_currency = rstr_ds_4_posting.ds_details[li_idx]		
	
	if not isvalid(rdw_currency) then
		gf_messagebox('m.b_doc.f_get_dw_of_streamvalue.06','Thông báo','DW currency trong streamvalue structure không hợp lệ','stop','ok',1)		
		return -1
	end if
	if rdw_currency.rowcount() = 0 then 
		IF upper(rdw_currency.describe("DataWindow.Table.UpdateTable")) <> 'BOOKED_SLIP' THEN
			rdw_currency.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " booked_slip.ID = " + string(vdb_doc_version) , " AND " )
		else
			ls_colname = 'ID'
			l_dwservice.f_get_build_column(rdw_currency, ls_colname, ls_coltype)							
			rdw_currency.f_build_join_where_4_posting(rstr_ds_4_posting.s_join_detail[li_idx] , " "+ ls_colname+" = "  + string(vdb_doc_version) , " AND " )
		end if
		rdw_currency.f_settransobject(rt_transaction)			
		rdw_currency.event e_retrieve()
	end if			
end if
//-- Kết thúc lấy dw --//
return 1
end function

public function integer f_booking_item_multi_ex (double vdb_doc_id, double vdb_doc_version, string vs_doctype, ref t_transaction rt_transaction, date vd_trans_date, string vs_post_type, string vs_qty_yn, string vs_value_yn, double vadb_related_doc_id[], ref s_str_ds_4_posting rstr_ds_4_posting);/**************************************************************************************
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
int							li_rtn, li_cnt, li_idx, li_pos_s, li_pos_e, li_chr_nbr, li_idx_master
long						ll_row, ll_row2, ll_insertrow_sv,ll_count, ll_row_itemmaster
any						laa_data[]
string						ls_lot_yn,ls_serial_yn, ls_item_ref_table, ls_samecol_string,ls_item_column_sv, ls_sv_qty_yn, ls_sv_value_yn, ls_related_doc_qty_yn
string						las_col_f_object[], las_col_f_object_sv[], las_col_t_object[], las_col_t_object_sv[], las_col_item[], las_col_item_sv[]
string						las_col_item_value[], las_col_item_value_sv[], las_col_item_lot[], las_col_item_lot_sv[], las_col_currency[], las_col_currency_sv[]
string						ls_where, ls_original_filter_lot,ls_original_filter_item, ls_ref_table, ls_manage_qty_yn, ls_manage_value_yn
double					ldb_trans_uom, ldb_item_id, ldb_dwitem_ID, ldb_value,ldb_base_value, ldb_qty, ldb_trans_charge_amt, ldb_base_charge_amt
double					ldb_itemmaster_ID


c_string					lc_string
t_ds_db					ldw_f_object,ldw_item,ldw_t_object,ldw_item_lot,ldw_item_value, ldw_currency
t_ds_db					lds_stream, lds_item_lot, ldw_master , lds_f_lot, lds_t_lot
b_inventory				lobj_ins
s_str_data				lstr_data_from_to, lstr_data_null


ls_related_doc_qty_yn = lobj_ins.f_get_related_doc_qty_yn(vdb_doc_id )

FOR li_idx = 1 to upperbound(this.istr_streamvalue[])
	ls_original_filter_item =''
	ls_original_filter_lot = ''	
	//-- Lấy ds --//
	li_rtn = this.f_get_ds_of_streamvalue_ex(vdb_doc_version, ldw_item, ldw_f_object,ldw_t_object , lds_f_lot, lds_t_lot, ldw_item_value,ldw_item_lot,ldw_currency,li_idx, rstr_ds_4_posting, rt_transaction)
	if li_rtn = 0 then return 0
	if li_rtn = -1 then
		rollback using rt_transaction;
		return -1
	end if
	//-- Lấy dw col--//
	li_rtn = this.f_get_dwcol_of_streamvalue( las_col_f_object[], las_col_f_object_sv[], las_col_t_object[], las_col_t_object_sv[], las_col_item[], las_col_item_sv[],las_col_item_value[], las_col_item_value_sv[], las_col_item_lot[], las_col_item_lot_sv[], las_col_currency[], las_col_currency_sv[], li_idx)
	if li_rtn = 0 then return 0
	if li_rtn = -1 then
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
	ls_item_column_sv = istr_streamvalue[li_idx].s_item_column_sv
	ls_item_column_sv = lc_string.f_globalreplace(ls_item_column_sv , ' ', '')
	if right(ls_item_column_sv,1)<> ';' then ls_item_column_sv += ';'	
	FOR li_cnt = 1 to upperbound(las_col_item_lot_sv[])
		if pos(ls_item_column_sv, las_col_item_lot_sv[li_cnt]+';')> 0 then
			ls_samecol_string += las_col_item_lot_sv[li_cnt]+';'
		end if
	NEXT
	
	//-- Lấy dw lot--//
	if upper(vs_qty_yn) = 'Y' then
		if isvalid(ldw_item_lot) then
			//-- ghi nhớ lại filter hiện tại --//
			ls_original_filter_lot = ldw_item_lot.describe( "datawindow.table.filter")
		end if
	end if	
	
		li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(ldw_item.dataobject, len(ldw_item.dataobject) - 5) + '[')
		li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
		li_chr_nbr = li_pos_e - (li_pos_s + len(ldw_item.dataobject) - 4)
		li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(ldw_item.dataobject) - 4 , li_chr_nbr ))
		
		ldw_master = rstr_ds_4_posting.ds_master[li_idx_master]						
		ls_ref_table= upper(ldw_master.describe( "datawindow.table.updateTable"))
		if ls_ref_table = 'BOOKED_SLIP' then
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
					if las_col_item_value[3] = 'cogs' and ldb_base_value = 0 then
						ldb_base_value = lobj_ins.f_get_last_pur_price( ldb_item_id)	
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
				if pos(this.istr_streamvalue[li_idx].s_f_obj_column, 'loc_id' )> 0 and this.istr_streamvalue[li_idx].s_f_obj_dwo = ldw_item.dataobject then
					lstr_data_from_to.aa_data_from[3] = ldw_item.getitemnumber(ll_row,las_col_f_object[4]) 
				elseif pos(this.istr_streamvalue[li_idx].s_t_obj_column, 'loc_id' )> 0 and this.istr_streamvalue[li_idx].s_t_obj_dwo = ldw_item.dataobject then
					lstr_data_from_to.aa_data_to[3] = ldw_item.getitemnumber(ll_row,las_col_t_object[4]) 
				end if				
//				laa_data[4] = ldw_item.getitemnumber(ll_row,las_col_item[5]) 		//--Loc_ID--//				
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
						elseif ls_sv_qty_yn = 'Y' and  ls_sv_value_yn = 'N' and ( vs_value_yn = 'N' or ls_related_doc_qty_yn = 'N') then //-- cập nhật stream_value SL --//
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
					
				elseif (ls_serial_yn = 'Y'  or ls_lot_yn = 'Y') and (ls_sv_qty_yn ='Y' or ls_sv_value_yn ='Y' ) then //-- mặt hàng có quản lý seri/lot --//
					if not isvalid(ldw_item_lot) then
						if ls_sv_qty_yn = 'Y'     then
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
					if pos(this.istr_streamvalue[li_idx].s_f_obj_column, 'loc_id' )> 0 and this.istr_streamvalue[li_idx].s_f_obj_dwo = ldw_item.dataobject then
						lstr_data_from_to.aa_data_from[3] = ldw_item.getitemnumber(ll_row,las_col_f_object[4]) 
					elseif pos(this.istr_streamvalue[li_idx].s_t_obj_column, 'loc_id' )> 0 and this.istr_streamvalue[li_idx].s_t_obj_dwo = ldw_item.dataobject then
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
		
	//-- update cot sku ,cogs--//
	if ldw_item.update(true,false) = -1 then
		gf_messagebox('m.b_doc.f_booking_item.07','Thông báo','Không cập nhật được số lượng theo đơn vị tồn kho:@' +rt_transaction.sqlerrtext ,'exclamation','ok',1)
		rollback using rt_transaction;
		destroy lds_stream
		return -1
	end if	
	ldw_item.resetupdate()
	
	if lds_stream.update(true,false ) = -1 then
		gf_messagebox('m.b_doc.f_booking_item.08','Thông báo','Không cập nhật được steamvalue:@' +rt_transaction.sqlerrtext ,'exclamation','ok',1)
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
			gf_messagebox('m.b_doc.f_bookig_item.10','Thông báo','Cập nhật ghi sổ không thành công f_bookig_item(252)','exclamation','ok',1)
			Rollback using rt_transaction;
			return -1
		end if
//----------------------------------------------------------------------------//
destroy lds_stream
return 1
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

b_inventory				lobj_ins
s_str_data				lstr_data_from_to, lstr_data_null

ls_related_doc_qty_yn = lobj_ins.f_get_related_doc_qty_yn(vdb_doc_id )
if lobj_ins.f_get_item_managed_qty_value(vaa_data[1] ,ls_manage_qty_yn, ls_manage_value_yn) = -1 then return -1
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
	this.ic_unit_instance.f_get_base_cur(ldb_base_curr, ls_base_curr_code, ls_base_curr_name)	
	ldb_round_id_base = this.ic_unit_instance.f_get_round_id( ldb_round_id_base, 0, 'bc')		
	ldb_round_id_trans = vdw_currency.f_getitemany( vdw_currency.getrow(), vas_col_currency[1] )
	ldb_round_id_trans = this.ic_unit_instance.f_get_round_id( ldb_round_id_trans, 0, 'amount')	
end if

if vs_lot_yn = 'Y' then rpo_item_lot.setsort("lot_no a")
if vs_serial_yn = 'Y'  then rpo_item_lot.setsort("serial_no a")
rpo_item_lot.sort()

for ll_row = 1 to rpo_item_lot.rowcount( )				
	lstr_data_from_to = lstr_data_null
	ls_data = rpo_item_lot.dynamic getitemstring( ll_row, vas_col_f_object[2])	
	if isnull(ls_data) and  vs_lot_yn = 'Y'  then
		gf_messagebox('m.b_doc.f_booking_item_lot_multi_ex.04','Thông báo','Mã hàng sau chưa nhập số lô:@'+lobj_ins.f_get_object_code( vaa_data[1] ),'stop','ok',1)		
		rollback using rt_transaction;
		destroy rds_stream
		return -1					
	end if
	lstr_data_from_to.aa_data_from[1] = ls_data

	ls_data = rpo_item_lot.dynamic getitemstring( ll_row, vas_col_f_object[3])	
	if isnull(ls_data) and  vs_serial_yn = 'Y'  then
		gf_messagebox('m.b_doc.f_booking_item_lot_multi_ex.05','Thông báo','Mã hàng sau chưa nhập số seri:@'+lobj_ins.f_get_object_code( vaa_data[1] ),'stop','ok',1)		
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
				ldb_value_lot_seri = this.ic_unit_instance.f_round( rt_transaction, ldb_round_id_trans,ldb_value_lot_seri)
				
				ldb_base_value_lot_seri =  vdb_item_base_value/vdb_item_qty * ldb_qty_lot_seri
				ldb_base_value_lot_seri = this.ic_unit_instance.f_round( rt_transaction, ldb_round_id_base,ldb_base_value_lot_seri)
				
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
			
			li_rtn = this.f_postinsert_streamvalue(rds_stream , ll_insertrow_sv, ls_sv_value_yn,ls_sv_qty_yn, vs_item_ref_table, vdb_dwitem_ID, vs_doc_type, vdb_doc_id, vd_trans_date)
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
			
			li_rtn = this.f_postinsert_streamvalue(rds_stream , ll_insertrow_sv, ls_sv_value_yn,ls_sv_qty_yn, vs_item_ref_table, vdb_dwitem_ID, vs_doc_type, vdb_doc_id, vd_trans_date)
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

public function integer f_booking_item_lot_ex (ref t_transaction rt_transaction, ref t_ds_db rds_stream, t_dw_mpl vdw_item, long vl_item_row, ref powerobject rpo_item_lot, any vaa_data[], date vd_trans_date, string vs_lot_yn, string vs_serial_yn, string vs_qty_yn, string vs_value_yn, string vs_post_type, double vdb_item_value, double vdb_item_base_value, double vdb_item_qty, t_dw_mpl vdw_f_object, t_dw_mpl vdw_t_object, string vas_col_item[], string vas_col_item_lot[], string vas_col_item_value[], string vas_col_f_object[], string vas_col_t_object[], double vdb_trans_uom, string vas_col_f_object_sv[], string vas_col_t_object_sv[], string vas_col_item_sv[], string vas_col_item_lot_sv[], string vas_col_item_value_sv[], string vs_item_ref_table, string vs_samecol_string, string vs_doc_type, double vdb_dwitem_id, double vdb_doc_id, t_dw_mpl vdw_currency, string vas_col_currency[], string vas_col_currency_sv[]);/**************************************************************************************
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
int							li_rtn, li_cnt, li_idx
long						ll_row, ll_insertrow_sv
string						ls_original_filter, ls_sv_qty_yn, ls_sv_value_yn, ls_manage_qty_yn, ls_manage_value_yn, ls_data, ls_related_doc_qty_yn
string						ls_base_curr_code, ls_base_curr_name
double					ldb_value_lot_seri,ldb_base_value_lot_seri, ldb_qty_lot_seri,  ldb_base_curr, ldb_invoiced_qty, ldb_invoicing_qty
double					ldb_round_id_trans, ldb_round_id_base
b_inventory				lobj_ins
s_str_data				lstr_data_from_to, lstr_data_null


ls_related_doc_qty_yn = lobj_ins.f_get_related_doc_qty_yn(vdb_doc_id )
if lobj_ins.f_get_item_managed_qty_value(vaa_data[1] ,ls_manage_qty_yn, ls_manage_value_yn) = -1 then return -1
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
	this.ic_unit_instance.f_get_base_cur(ldb_base_curr, ls_base_curr_code, ls_base_curr_name)	
	ldb_round_id_base = this.ic_unit_instance.f_get_round_id( ldb_round_id_base, 0, 'bc')		
	ldb_round_id_trans = vdw_currency.f_getitemany( vdw_currency.getrow(), vas_col_currency[1] )
	ldb_round_id_trans = this.ic_unit_instance.f_get_round_id( ldb_round_id_trans, 0, 'amount')	
end if

if vs_lot_yn = 'Y' then rpo_item_lot.dynamic setsort("lot_no a")
if vs_serial_yn = 'Y'  then rpo_item_lot.dynamic setsort("serial_no a")
rpo_item_lot.dynamic sort()

for ll_row = 1 to rpo_item_lot.dynamic rowcount( )				
	lstr_data_from_to = lstr_data_null
	ls_data = rpo_item_lot.dynamic getitemstring( ll_row, vas_col_f_object[2])	
	if isnull(ls_data) and  vs_lot_yn = 'Y'  then
		gf_messagebox('m.b_doc.f_booking_item_lot_ex.04','Thông báo','Mã hàng sau chưa nhập số lô:@'+lobj_ins.f_get_object_code( vaa_data[1] ),'stop','ok',1)		
		rollback using rt_transaction;
		destroy rds_stream
		return -1					
	end if
	lstr_data_from_to.aa_data_from[1] = ls_data

	ls_data = rpo_item_lot.dynamic getitemstring( ll_row, vas_col_f_object[3])	
	if isnull(ls_data) and  vs_serial_yn = 'Y'  then
		gf_messagebox('m.b_doc.f_booking_item_lot_ex.05','Thông báo','Mã hàng sau chưa nhập số seri:@'+lobj_ins.f_get_object_code( vaa_data[1] ),'stop','ok',1)		
		rollback using rt_transaction;
		destroy rds_stream
		return -1						
	end if			
	lstr_data_from_to.aa_data_from[2] = ls_data
	
	//-- tính giá trị của một lot/seri --//
	if ls_sv_value_yn = 'Y' then
		ldb_qty_lot_seri = rpo_item_lot.dynamic getitemnumber( ll_row, vas_col_item_lot[1])
		if isnull(ldb_qty_lot_seri) or ldb_qty_lot_seri = 0 then continue
		ldb_invoiced_qty = rpo_item_lot.dynamic getitemnumber( ll_row, 'invoiced_qty')
		if isnull(ldb_invoiced_qty) then  ldb_invoiced_qty = 0 
		if ldb_invoiced_qty > 0 then ldb_qty_lot_seri -= ldb_invoiced_qty
		if ll_row < rpo_item_lot.dynamic rowcount( ) and vdb_item_qty > 0	then
			if ldb_qty_lot_seri < vdb_item_qty then
				ldb_value_lot_seri = vdb_item_value/vdb_item_qty * ldb_qty_lot_seri
				ldb_value_lot_seri = this.ic_unit_instance.f_round( rt_transaction, ldb_round_id_trans,ldb_value_lot_seri)
				
				ldb_base_value_lot_seri =  vdb_item_base_value/vdb_item_qty * ldb_qty_lot_seri
				ldb_base_value_lot_seri = this.ic_unit_instance.f_round( rt_transaction, ldb_round_id_base,ldb_base_value_lot_seri)
				
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
		rpo_item_lot.dynamic setitem(ll_row, 'invoiced_qty', ldb_invoiced_qty)
	end if
	
	//-- insert row --//
	if this.f_insert_item_balance_row_ex( rt_transaction, rpo_item_lot, ll_row, vdw_f_object, vdw_t_object, vd_trans_date, vs_post_type, vas_col_item_lot[], vas_col_item_value[], vas_col_f_object[], vas_col_t_object[], vaa_data[],  ls_sv_qty_yn, ls_sv_value_yn, vdb_trans_uom, vas_col_item_lot[1], ldb_base_value_lot_seri, vs_qty_yn, vs_value_yn, lstr_data_from_to, vdb_doc_id, ls_related_doc_qty_yn) = -1 then		
		rollback using rt_transaction;
		return -1
	end if

	//-- update steamvalue --//
	if upper(vs_post_type) = 'POST' then
			
		if  ls_sv_qty_yn = 'Y' and  ls_sv_value_yn = 'Y' then //-- cập nhật stream_value GT --//
			ll_insertrow_sv = rds_stream.event e_addrow( )	
			li_rtn = this.f_update_streamvalue_ex( vdw_item, rds_stream, vas_col_item_value[], vas_col_item_value_sv[], vs_samecol_string, vl_item_row, ll_insertrow_sv,vdw_f_object, vas_col_f_object[], vas_col_f_object_sv[],vdw_t_object, vas_col_t_object[], vas_col_t_object_sv[], vdw_currency,vas_col_currency[], vas_col_currency_sv[], ldb_value_lot_seri, ldb_base_value_lot_seri, lstr_data_from_to)
			
			if li_rtn = 1 then
				 li_rtn = this.f_update_streamvalue(rpo_item_lot, rds_stream, vas_col_item_lot[], vas_col_item_lot_sv[], '', ll_row,ll_insertrow_sv)
			end if			
			if li_rtn = -1 then
				destroy rds_stream
				rollback using rt_transaction;
				return -1
			end if					
			
			li_rtn = this.f_postinsert_streamvalue(rds_stream , ll_insertrow_sv,ls_sv_value_yn,  ls_sv_qty_yn, vs_item_ref_table, vdb_dwitem_ID, vs_doc_type, vdb_doc_id, vd_trans_date)
			if li_rtn = -1 then 
				destroy rds_stream
				rollback using rt_transaction;
				return -1
			end if			
		elseif ls_sv_qty_yn = 'Y' and  ls_sv_value_yn = 'N' and  ( vs_value_yn = 'N' or ls_related_doc_qty_yn = 'N' ) then  //-- cập nhật stream_value SL --//
			ll_insertrow_sv = rds_stream.event e_addrow( )	
			li_rtn = this.f_update_streamvalue_ex(vdw_item, rds_stream, vas_col_item[], vas_col_item_sv[], vs_samecol_string, vl_item_row,ll_insertrow_sv, vdw_f_object, vas_col_f_object[], vas_col_f_object_sv[], vdw_t_object, vas_col_t_object[], vas_col_t_object_sv[], lstr_data_from_to)				
			
			if li_rtn = 1 then
				 li_rtn = this.f_update_streamvalue(rpo_item_lot, rds_stream, vas_col_item_lot[], vas_col_item_lot_sv[], '', ll_row,ll_insertrow_sv)
			end if			
			if li_rtn = -1 then
				destroy rds_stream
				rollback using rt_transaction;
				return -1
			end if					
			
			li_rtn = this.f_postinsert_streamvalue(rds_stream , ll_insertrow_sv,ls_sv_value_yn,  ls_sv_qty_yn, vs_item_ref_table, vdb_dwitem_ID, vs_doc_type, vdb_doc_id, vd_trans_date)
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
if rpo_item_lot.dynamic update(true,false) = -1 then
	gf_messagebox('m.b_doc.f_booking_item.06','Thông báo','Không cập nhật được số lượng theo đơn vị tồn kho:@' +rt_transaction.sqlerrtext ,'exclamation','ok',1)
	destroy rds_stream
	rollback using rt_transaction;
	return -1
end if	
rpo_item_lot.dynamic resetupdate()		

return 1
end function

public function integer f_booking_item_ex (ref t_transaction rt_transaction, date vd_trans_date, string vs_post_type, string vs_qty_yn, string vs_value_yn, double vadb_related_doc_id[]);/**************************************************************************************
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
int							li_rtn, li_cnt, li_idx
long						ll_row, ll_row2, ll_insertrow_sv,ll_count, ll_row_itemmaster
any						laa_data[]
string						ls_lot_yn,ls_serial_yn, ls_item_ref_table, ls_doc_type, ls_samecol_string,ls_item_column_sv, ls_related_doc_qty_yn
string						las_col_f_object[], las_col_f_object_sv[], las_col_t_object[], las_col_t_object_sv[], las_col_item[], las_col_item_sv[]
string						las_col_item_value[], las_col_item_value_sv[], las_col_item_lot[], las_col_item_lot_sv[], las_col_currency[], las_col_currency_sv[]
string						ls_where, ls_original_filter_lot,ls_original_filter_item, ls_ref_table,ls_manage_value_yn,ls_manage_qty_yn, ls_sv_value_yn, ls_sv_qty_yn
double					ldb_trans_uom, ldb_item_id, ldb_doc_id, ldb_dwitem_ID, ldb_value,ldb_base_value, ldb_qty, ldb_trans_charge_amt, ldb_base_charge_amt
double					ldb_itemmaster_ID, ldb_qty_chk
//boolean					lb_managed_qty, lb_manage_value

c_string					lc_string
t_dw_mpl				ldw_f_object,ldw_item,ldw_t_object,ldw_item_lot,ldw_item_value, ldw_currency, ldw_main, ldw_master, ldw_f_lot, ldw_t_lot
t_ds_db					lds_stream, lds_item_lot
b_inventory				lobj_ins
s_str_data				lstr_data_from_to, lstr_data_null

FOR li_idx = 1 to upperbound(this.istr_streamvalue[])
	ls_original_filter_item =''
	ls_original_filter_lot = ''	
	//-- Lấy dw --//
//	li_rtn = this.f_get_dw_of_streamvalue(ldw_item, ldw_f_object,ldw_t_object, ldw_item_value,ldw_item_lot,ldw_currency,li_idx)
	li_rtn = this.f_get_dw_of_streamvalue_ex(ldw_item, ldw_f_object,ldw_t_object, ldw_f_lot, ldw_t_lot, ldw_item_value,ldw_item_lot,ldw_currency,li_idx)
	if li_rtn = 0 then return 0
	if li_rtn = -1 then
		rollback using rt_transaction;
		return -1
	end if
	//-- Lấy dw col--//
	li_rtn = this.f_get_dwcol_of_streamvalue( las_col_f_object[], las_col_f_object_sv[], las_col_t_object[], las_col_t_object_sv[], las_col_item[], las_col_item_sv[],las_col_item_value[], las_col_item_value_sv[], las_col_item_lot[], las_col_item_lot_sv[], las_col_currency[], las_col_currency_sv[], li_idx)
	if li_rtn = 0 then return 0
	if li_rtn = -1 then
		rollback using rt_transaction;
		return -1
	end if
	
	//-- Thông tin để update streamvalue --//
	lds_stream = create t_ds_db
	lds_stream.dataobject = 'ds_streamvalue'
	lds_stream.f_settransobject( rt_transaction)
	//-- Lấy các thông tin document chung --//
	ldw_main = iw_display.f_get_dwmain( )
	ldb_doc_id = ldw_main.getitemnumber( ldw_main.getrow() , 'ID') 
	ls_related_doc_qty_yn = lobj_ins.f_get_related_doc_qty_yn(ldb_doc_id )
	ls_doc_type	= upper(ldw_main.getitemstring( ldw_main.getrow( ) , 'doc_type'))
	ls_item_ref_table = upper(ldw_item.describe( "datawindow.table.updateTable"))
	
	//-- Lấy các cột trùng nhau giữa dw lot và dw item --//
	ls_item_column_sv = istr_streamvalue[li_idx].s_item_column_sv
	ls_item_column_sv = lc_string.f_globalreplace(ls_item_column_sv , ' ', '')
	if right(ls_item_column_sv,1)<> ';' then ls_item_column_sv += ';'	
	FOR li_cnt = 1 to upperbound(las_col_item_lot_sv[])
		if pos(ls_item_column_sv, las_col_item_lot_sv[li_cnt]+';')> 0 then
			ls_samecol_string += las_col_item_lot_sv[li_cnt]+';'
		end if
	NEXT
	
	//-- Lấy dw lot--//
	if upper(vs_qty_yn) = 'Y' then
		if isvalid(ldw_item_lot) then
			//-- ghi nhớ lại filter hiện tại --//
			ls_original_filter_lot = ldw_item_lot.describe( "datawindow.table.filter")
		end if
	end if	
	
	//-- xả filter nếu có --//
	if ldw_item.f_get_ib_detail( )  then
		ldw_master = ldw_item.f_get_idw_master( )
		ls_ref_table= upper(ldw_master.describe( "datawindow.table.updateTable"))
		if ls_ref_table = 'BOOKED_SLIP' then //--master của item là bookslip --//
			FOR ll_row = 1 to ldw_item.rowcount( )			///////////////-- duyệt từng item --/////////////
				ldb_item_id =  ldw_item.getitemnumber(ll_row,las_col_item[1])
				ldb_dwitem_ID = ldw_item.getitemnumber( ll_row,'ID')
				ldb_trans_uom = ldw_item.getitemnumber(ll_row,las_col_item[4])
				lstr_data_from_to = lstr_data_null
				
				if upper(this.f_get_object_type(ldb_item_id)) <> 'ITEM' then continue
				if lobj_ins.f_get_item_managed_qty_value(ldb_item_id ,ls_manage_qty_yn, ls_manage_value_yn) = -1 then return -1
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
				//-- update item balance theo ngày --//
				ldb_qty = ldw_item.getitemnumber( ll_row,las_col_item[3])
				if isnull(ldb_qty) or ldb_qty = 0 then continue 		
				
//				if ls_sv_value_yn = 'Y' then //-- mở để cập nhật giá last pur cho tất cả item  --//
					ldb_value =  ldw_item.getitemnumber(ll_row,las_col_item_value[2]) //--trans value --//
					if isnull(ldb_value) then ldb_value =0			
					ldb_base_value =  ldw_item.getitemnumber(ll_row,las_col_item_value[3]) //--base value --//
					if isnull(ldb_base_value) then ldb_base_value =0		
					if las_col_item_value[3] = 'cogs' and ldb_base_value = 0 then
						ldb_base_value = lobj_ins.f_get_last_pur_price( ldb_item_id)	
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
					if this.classname( ) = 'u_pur_invoice' then
						SELECT sum(TRANS_AMT), sum(BASE_AMT) INTO :ldb_trans_charge_amt, :ldb_base_charge_amt
						FROM POST_LINE 
						WHERE DOC_ID = :ldb_doc_id AND DR_OBJECT_ID = :ldb_item_id AND SOB = :gs_sob AND OBJECT_REF_TABLE <> :ls_item_ref_table  USING rt_transaction;
						if isnull(ldb_trans_charge_amt) then ldb_trans_charge_amt = 0
						if isnull(ldb_base_charge_amt) then ldb_base_charge_amt = 0
						ldb_value += ldb_trans_charge_amt
						ldb_base_value += ldb_base_charge_amt
					
						//-- cập nhật giá mua sau cùng --//
						UPDATE item set last_pur_price = round(:ldb_base_value/:ldb_qty,0) where object_ref_id = :ldb_item_id using rt_transaction;
						
					end if
//				end if
		
				//-- set các biến cho update item balance --//
				laa_data[1] = ldb_item_id														//-- Item_ID--//
				laa_data[2] = ldw_item.getitemnumber(ll_row,'COMPANY_ID')			//--Company_ID--//
				laa_data[3] = ldw_item.getitemnumber(ll_row,las_col_item[2])		//--Spec_ID--//
				//-- kiểm tra mã hàng có spec: cảnh báo --//
				if isnull(laa_data[3]) or laa_data[3] = 0 then
					if lobj_ins.f_is_managed_spec(ldb_item_id ) = TRUE then
						gf_messagebox('m.b_doc.f_booking_item.12','Thông báo','Mã hàng có Quy Cách nhưng chưa đươc nhập trong giao dịch:@'+lobj_ins.f_get_object_code(laa_data[1] ),'stop','ok',1)		
						rollback using rt_transaction;
						return -1
					end if
				end if	
				
				//-- loc_id của ldw_item nhập kho hoặc xuất tùy vào khai báo stream_value struct--//
				if pos(this.istr_streamvalue[li_idx].s_f_obj_column, 'loc_id' )> 0 and this.istr_streamvalue[li_idx].s_f_obj_dwo = ldw_item.dataobject then
					lstr_data_from_to.aa_data_from[3] = ldw_item.getitemnumber(ll_row,las_col_f_object[4]) 
				elseif pos(this.istr_streamvalue[li_idx].s_t_obj_column, 'loc_id' )> 0 and this.istr_streamvalue[li_idx].s_t_obj_dwo = ldw_item.dataobject then
					lstr_data_from_to.aa_data_to[3] = ldw_item.getitemnumber(ll_row,las_col_t_object[4]) 
				end if				
//				laa_data[4] = ldw_item.getitemnumber(ll_row,las_col_item[5]) 		//--Loc_ID--//
				laa_data[5] = datetime(vd_trans_date)										//--Trans_date--//
				laa_data[9] = gs_sob
				///-- kiểm tra item có quản lý số seri hoặc số lô không --//
				if lobj_ins.f_get_lot_or_serial_yn( laa_data[1], ls_lot_yn,ls_serial_yn) = -1 then
					gf_messagebox('m.b_doc.f_booking_item.01','Thông báo','Mã hàng không hợp lệ:@'+lobj_ins.f_get_object_code(laa_data[1] ),'stop','ok',1)		
					rollback using rt_transaction;
					destroy lds_stream
					return -1
				end if
				
				//-- ghi sổ giá trị hoặc ghi sổ số lượng với mã hàng ko quản lý số  seri --//
				if (ls_serial_yn = 'N' and ls_lot_yn = 'N' and ( ls_sv_value_yn = 'Y' or ls_sv_qty_yn = 'Y' ) ) then  //-- (vs_value_yn = 'Y' and lb_managed_qty) OR and vs_qty_yn = 'Y' 
		
//					laa_data[7] = '@'			//--Lot_no--//
//					laa_data[8] = '@'			//--Serial_no--//
					lstr_data_from_to.aa_data_from[1] ='@'
					lstr_data_from_to.aa_data_from[2] ='@'
					
					if this.f_insert_item_balance_row_ex( rt_transaction, ldw_item, ll_row, ldw_f_object, ldw_t_object, vd_trans_date, vs_post_type, las_col_item[], las_col_item_value[], las_col_f_object[], las_col_t_object[], laa_data[], ls_sv_qty_yn, ls_sv_value_yn, ldb_trans_uom, las_col_item[3], ldb_base_value, vs_qty_yn,vs_value_yn, lstr_data_from_to, ldb_doc_id, ls_related_doc_qty_yn) = -1 then 
						destroy lds_stream
						rollback using rt_transaction;
						return -1
					end if
					
					//-- update streamvalue theo chứng từ --//
					if  upper(vs_post_type) = 'POST' then		
												
						if  ls_sv_qty_yn = 'Y'  and  ls_sv_value_yn = 'Y' then  //-- cập nhật stream_value GT --//
							ll_insertrow_sv = lds_stream.event e_addrow( ) /////////////////////--- insert stream_value --////////////
							if ll_insertrow_sv < 1 then 
								gf_messagebox('m.b_doc.f_booking_item.09','Thông báo','Không insert được stream','stop','ok',1)
								destroy lds_stream
								rollback using rt_transaction;
								return -1
							end if							
							li_rtn = this.f_update_streamvalue_ex( ldw_item, lds_stream, las_col_item_value[], las_col_item_value_sv[], '', ll_row, ll_insertrow_sv,ldw_f_object, las_col_f_object[], las_col_f_object_sv[],ldw_t_object, las_col_t_object[], las_col_t_object_sv[], ldw_currency,las_col_currency[], las_col_currency_sv[], ldb_value, ldb_base_value,lstr_data_from_to)
							if li_rtn = -1 then 
								destroy lds_stream
								rollback using rt_transaction;
								return -1
							end if
							
							li_rtn = this.f_postinsert_streamvalue(lds_stream , ll_insertrow_sv, ls_sv_value_yn,ls_sv_qty_yn, ls_item_ref_table, ldb_dwitem_ID, ls_doc_type, ldb_doc_id, vd_trans_date)
							if li_rtn = -1 or li_rtn = 0 then 
								gf_messagebox('m.b_doc.f_booking_item.09','Thông báo','Không insert được stream','stop','ok',1)
								destroy lds_stream
								rollback using rt_transaction;
								return -1
							end if													
						elseif ls_sv_qty_yn = 'Y' and  ls_sv_value_yn = 'N' and ( vs_value_yn = 'N' or ls_related_doc_qty_yn = 'N' )then //-- cập nhật stream_value SL --//
							ll_insertrow_sv = lds_stream.event e_addrow( ) /////////////////////--- insert stream_value --////////////
							if ll_insertrow_sv < 1 then 
								gf_messagebox('m.b_doc.f_booking_item.09','Thông báo','Không insert được stream','stop','ok',1)
								destroy lds_stream
								rollback using rt_transaction;
								return -1
							end if							
							li_rtn = this.f_update_streamvalue_ex( ldw_item, lds_stream, las_col_item[], las_col_item_sv[], '', ll_row,ll_insertrow_sv, ldw_f_object, las_col_f_object[], las_col_f_object_sv[],ldw_t_object, las_col_t_object[], las_col_t_object_sv[], lstr_data_from_to)								
							if li_rtn = -1 then 
								destroy lds_stream
								rollback using rt_transaction;
								return -1
							end if					
							
							li_rtn = this.f_postinsert_streamvalue(lds_stream , ll_insertrow_sv, ls_sv_value_yn,ls_sv_qty_yn, ls_item_ref_table, ldb_dwitem_ID, ls_doc_type, ldb_doc_id, vd_trans_date)
							if li_rtn = -1 or li_rtn = 0 then 
								gf_messagebox('m.b_doc.f_booking_item.09','Thông báo','Không insert được stream','stop','ok',1)
								destroy lds_stream
								rollback using rt_transaction;
								return -1
							end if													
						end if					
					end if			
					
				elseif (ls_serial_yn = 'Y'  or ls_lot_yn = 'Y') and ( ls_sv_value_yn = 'Y' or ls_sv_qty_yn = 'Y' )   then //-- mặt hàng có quản lý seri/lot --//
					if not isvalid(ldw_item_lot) then
						if ls_sv_qty_yn = 'Y'   then
							gf_messagebox('m.b_doc.f_booking_item.03','Thông báo','DW item_lot trong streamvalue structure không hợp lệ','stop','ok',1)		
							destroy lds_stream
							rollback using rt_transaction;
							return -1
						elseif ls_sv_value_yn = 'Y'   then
							
							lds_item_lot = create t_ds_db
							lds_item_lot.dataobject = 'ds_lot_line_4booking'
							ls_where = " matching.t_doc_id = "+string(ldb_doc_id)
							lds_item_lot.f_add_where( ls_where, 'AND')
							lds_item_lot.f_settransobject(rt_transaction )
							lds_item_lot.retrieve( )
		
							lds_item_lot.setfilter( "t_ref_id = "+string(ldb_dwitem_ID ))
							lds_item_lot.filter( )			
							//-- tính tổng số lượng các lot/seri --//
							if  lds_item_lot.rowcount( )	 > 0 then ldb_qty = double(lds_item_lot.describe("Evaluate('Sum("+las_col_item_lot[1]+")', 0)"))	
							ldb_qty_chk  = ldw_item.getitemnumber( ll_row,las_col_item[3])
							if ldb_qty <> ldb_qty_chk then
								gf_messagebox('m.b_doc.f_booking_item.11','Thông báo','Số lượng chi tiết  theo LOT/SERIAL khác số lượng của mã hàng'+ lobj_ins.f_get_object_code( laa_data[1]),'stop','ok',1)		
								rollback using rt_transaction;								
								return -1
							end if
//							lstr_data_from_to.aa_data_from[1] = ldw_f_lot.
							
							li_rtn = this.f_booking_item_lot_ex( rt_transaction,lds_stream ,ldw_item, ll_row, lds_item_lot, laa_data[], vd_trans_date, ls_lot_yn, ls_serial_yn, vs_qty_yn, vs_value_yn, &
														vs_post_type, ldb_value,ldb_base_value, ldb_qty, ldw_f_object, ldw_t_object, las_col_item[], las_col_item_lot[], las_col_item_value[], las_col_f_object[], las_col_t_object[],&								
														ldb_trans_uom,las_col_f_object_sv[], las_col_t_object_sv[],las_col_item_sv[], las_col_item_lot_sv[],las_col_item_value_sv[], ls_item_ref_table, &
														ls_samecol_string, ls_doc_type, ldb_dwitem_id, ldb_doc_id, ldw_currency,las_col_currency[], las_col_currency_sv[])			
							if li_rtn = -1 then return -1
						end if
					else
						ldw_item_lot.setfilter( "object_ref_id = "+string(ldb_dwitem_ID ))
						ldw_item_lot.filter( )					
						//-- tính tổng số lượng các lot/seri --//
						if  ldw_item_lot.rowcount( )	 > 0 then ldb_qty = double(ldw_item_lot.describe("Evaluate('Sum("+las_col_item_lot[1]+")', 0)"))		
						ldb_qty_chk  = ldw_item.getitemnumber( ll_row,las_col_item[3])
						if ldb_qty <> ldb_qty_chk then
							gf_messagebox('m.b_doc.f_booking_item.11','Thông báo','Số lượng chi tiết  theo LOT/SERIAL khác số lượng của mã hàng'+ lobj_ins.f_get_object_code( laa_data[1]),'stop','ok',1)		
							rollback using rt_transaction;								
							return -1
						end if
						
						li_rtn = this.f_booking_item_lot_ex( rt_transaction,lds_stream ,ldw_item, ll_row, ldw_item_lot, laa_data[], vd_trans_date, ls_lot_yn, ls_serial_yn, vs_qty_yn, vs_value_yn, &
													vs_post_type, ldb_value,ldb_base_value, ldb_qty, ldw_f_object, ldw_t_object, las_col_item[], las_col_item_lot[], las_col_item_value[], las_col_f_object[], las_col_t_object[],&								
													ldb_trans_uom,las_col_f_object_sv[], las_col_t_object_sv[],las_col_item_sv[], las_col_item_lot_sv[],las_col_item_value_sv[], ls_item_ref_table, &
													ls_samecol_string, ls_doc_type, ldb_dwitem_id, ldb_doc_id, ldw_currency,las_col_currency[], las_col_currency_sv[])								
						if li_rtn = -1 then return -1
					end if					
		
					
				end if
			NEXT			
		else	//////////////--nếu dw master của item không phải booked_slip: lệnh sản xuất --//////////////////////		
			ls_original_filter_item =  ldw_item.describe( "datawindow.table.filter")	
			FOR ll_row_itemmaster = 1 to ldw_master.rowcount( )
				ldb_itemmaster_ID = ldw_master.getitemnumber( ll_row_itemmaster, 'id')
				ldw_item.setfilter( "object_ref_id = "+string(ldb_itemmaster_ID ))
				ldw_item.filter( )
				FOR ll_row = 1 to ldw_item.rowcount( )			
					ldb_item_id =  ldw_item.getitemnumber(ll_row,las_col_item[1])
					ldb_dwitem_ID = ldw_item.getitemnumber( ll_row,'ID')
					ldb_trans_uom = ldw_item.getitemnumber(ll_row,las_col_item[4])
					if upper(this.f_get_object_type(ldb_item_id)) <> 'ITEM' then continue
					if lobj_ins.f_get_item_managed_qty_value(ldb_item_id ,ls_manage_qty_yn, ls_manage_value_yn) = -1 then return -1
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
							WHERE DOC_ID = :ldb_doc_id AND DR_OBJECT_ID = :ldb_item_id AND SOB = :gs_sob AND OBJECT_REF_TABLE <> :ls_item_ref_table  USING rt_transaction;
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
					if pos(this.istr_streamvalue[li_idx].s_f_obj_column, 'loc_id' )> 0 and this.istr_streamvalue[li_idx].s_f_obj_dwo = ldw_item.dataobject then
						lstr_data_from_to.aa_data_from[3] = ldw_item.getitemnumber(ll_row,las_col_f_object[4]) 
					elseif pos(this.istr_streamvalue[li_idx].s_t_obj_column, 'loc_id' )> 0 and this.istr_streamvalue[li_idx].s_t_obj_dwo = ldw_item.dataobject then
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
					if (ls_serial_yn = 'N' and ls_lot_yn = 'N' and ( ls_sv_value_yn = 'Y' or ls_sv_qty_yn = 'Y' ) ) then  //-- (vs_value_yn = 'Y' and lb_managed_qty) OR and vs_qty_yn = 'Y' 
			
//						laa_data[7] = '@'			//--Lot_no--//
//						laa_data[8] = '@'			//--Serial_no--//
						lstr_data_from_to.aa_data_from[1] ='@'
						lstr_data_from_to.aa_data_from[2] ='@'
						

						if this.f_insert_item_balance_row_ex( rt_transaction, ldw_item, ll_row, ldw_f_object, ldw_t_object, vd_trans_date, vs_post_type, las_col_item[], las_col_item_value[], las_col_f_object[], las_col_t_object[], laa_data[], ls_sv_qty_yn, ls_sv_value_yn, ldb_trans_uom, las_col_item[3], ldb_base_value, vs_qty_yn,vs_value_yn, lstr_data_from_to, ldb_doc_id, ls_related_doc_qty_yn) = -1 then 
							destroy lds_stream
							rollback using rt_transaction;
							return -1
						end if
						
						//-- update streamvalue theo chứng từ --//
						if  upper(vs_post_type) = 'POST' then		
							

							if ls_sv_qty_yn = 'Y'  and  ls_sv_value_yn = 'Y' then  //-- cập nhật stream_value GT --//
								ll_insertrow_sv = lds_stream.event e_addrow( )  /////////////-- insert tream_value --////////////
								if ll_insertrow_sv < 1 then 
									gf_messagebox('m.b_doc.f_booking_item.09','Thông báo','Không insert được stream','stop','ok',1)
									destroy lds_stream
									rollback using rt_transaction;
									return -1
								end if							
								li_rtn = this.f_update_streamvalue_ex( ldw_item, lds_stream, las_col_item_value[], las_col_item_value_sv[], '', ll_row, ll_insertrow_sv,ldw_f_object, las_col_f_object[], las_col_f_object_sv[],ldw_t_object, las_col_t_object[], las_col_t_object_sv[], ldw_currency,las_col_currency[], las_col_currency_sv[], ldb_value, ldb_base_value, lstr_data_from_to)
								if li_rtn = -1 then 
									destroy lds_stream
									rollback using rt_transaction;
									return -1
								end if		
								
								li_rtn = this.f_postinsert_streamvalue(lds_stream , ll_insertrow_sv, ls_sv_value_yn,ls_sv_qty_yn, ls_item_ref_table, ldb_dwitem_ID, ls_doc_type, ldb_doc_id, vd_trans_date)
								if li_rtn = -1 or li_rtn = 0 then 
									gf_messagebox('m.b_doc.f_booking_item.09','Thông báo','Không insert được stream','stop','ok',1)
									destroy lds_stream
									rollback using rt_transaction;
									return -1
								end if														
							elseif  ls_sv_qty_yn = 'Y' and  ls_sv_value_yn = 'N' and  ( vs_value_yn = 'N' or ls_related_doc_qty_yn = 'N' )  then //-- cập nhật stream_value SL --//
								ll_insertrow_sv = lds_stream.event e_addrow( )  /////////////-- insert tream_value --////////////
								if ll_insertrow_sv < 1 then 
									gf_messagebox('m.b_doc.f_booking_item.09','Thông báo','Không insert được stream','stop','ok',1)
									destroy lds_stream
									rollback using rt_transaction;
									return -1
								end if												
								li_rtn = this.f_update_streamvalue_ex( ldw_item, lds_stream, las_col_item[], las_col_item_sv[], '', ll_row,ll_insertrow_sv, ldw_f_object, las_col_f_object[], las_col_f_object_sv[],ldw_t_object, las_col_t_object[], las_col_t_object_sv[],lstr_data_from_to)								
								if li_rtn = -1 then 
									destroy lds_stream
									rollback using rt_transaction;
									return -1
								end if		
									
								li_rtn = this.f_postinsert_streamvalue(lds_stream , ll_insertrow_sv, ls_sv_value_yn,ls_sv_qty_yn, ls_item_ref_table, ldb_dwitem_ID, ls_doc_type, ldb_doc_id, vd_trans_date)
								if li_rtn = -1 or li_rtn = 0 then 
									gf_messagebox('m.b_doc.f_booking_item.09','Thông báo','Không insert được stream','stop','ok',1)
									destroy lds_stream
									rollback using rt_transaction;
									return -1
								end if														
							end if						
									
						end if			
						
					elseif (ls_serial_yn = 'Y'  or ls_lot_yn = 'Y') and ( ls_sv_value_yn = 'Y' or ls_sv_qty_yn = 'Y' ) then //-- mặt hàng có quản lý seri/lot --//
						if not isvalid(ldw_item_lot) then
							if ls_sv_qty_yn = 'Y'    then
								gf_messagebox('m.b_doc.f_booking_item.03','Thông báo','DW item_lot trong streamvalue structure không hợp lệ','stop','ok',1)		
								destroy lds_stream
								rollback using rt_transaction;
								return -1
							elseif ls_sv_value_yn = 'Y'  then
								lds_item_lot = create t_ds_db
								lds_item_lot.dataobject = 'ds_lot_line_4booking'
								ls_where = " matching.t_doc_id = "+string(ldb_doc_id)
								lds_item_lot.f_add_where( ls_where, 'AND')
								lds_item_lot.f_settransobject(rt_transaction )
								lds_item_lot.retrieve( )
			
								lds_item_lot.setfilter( "t_ref_id = "+string(ldb_dwitem_ID ))
								lds_item_lot.filter( )			
								//-- tính tổng số lượng các lot/seri --//
								if  lds_item_lot.rowcount( )	 > 0 then ldb_qty = double(lds_item_lot.describe("Evaluate('Sum("+las_col_item_lot[1]+")', 0)"))	
								ldb_qty_chk  = ldw_item.getitemnumber( ll_row,las_col_item[3])
								if ldb_qty <> ldb_qty_chk then
									gf_messagebox('m.b_doc.f_booking_item.11','Thông báo','Số lượng chi tiết  theo LOT/SERIAL khác số lượng của mã hàng'+ lobj_ins.f_get_object_code( laa_data[1]),'stop','ok',1)		
									rollback using rt_transaction;								
									return -1
								end if
								
								li_rtn = this.f_booking_item_lot_ex( rt_transaction,lds_stream ,ldw_item, ll_row, lds_item_lot, laa_data[], vd_trans_date, ls_lot_yn, ls_serial_yn, vs_qty_yn, vs_value_yn, &
															vs_post_type, ldb_value,ldb_base_value, ldb_qty, ldw_f_object, ldw_t_object, las_col_item[], las_col_item_lot[], las_col_item_value[], las_col_f_object[], las_col_t_object[],&								
															ldb_trans_uom,las_col_f_object_sv[], las_col_t_object_sv[],las_col_item_sv[], las_col_item_lot_sv[],las_col_item_value_sv[], ls_item_ref_table, &
															ls_samecol_string, ls_doc_type, ldb_dwitem_id, ldb_doc_id, ldw_currency,las_col_currency[], las_col_currency_sv[])		
								if li_rtn = -1 then return -1
							end if
						else
							ldw_item_lot.setfilter( "object_ref_id = "+string(ldb_dwitem_ID ))
							ldw_item_lot.filter( )					
							//-- tính tổng số lượng các lot/seri --//
							if  ldw_item_lot.rowcount( )	 > 0 then ldb_qty = double(ldw_item_lot.describe("Evaluate('Sum("+las_col_item_lot[1]+")', 0)"))		
							ldb_qty_chk  = ldw_item.getitemnumber( ll_row,las_col_item[3])
							if ldb_qty <> ldb_qty_chk then
								gf_messagebox('m.b_doc.f_booking_item.11','Thông báo','Số lượng chi tiết  theo LOT/SERIAL khác số lượng của mã hàng'+ lobj_ins.f_get_object_code( laa_data[1]),'stop','ok',1)		
								rollback using rt_transaction;								
								return -1
							end if
							
							li_rtn = this.f_booking_item_lot_ex( rt_transaction,lds_stream ,ldw_item, ll_row, ldw_item_lot, laa_data[], vd_trans_date, ls_lot_yn, ls_serial_yn, vs_qty_yn, vs_value_yn, &
														vs_post_type, ldb_value,ldb_base_value, ldb_qty, ldw_f_object, ldw_t_object, las_col_item[], las_col_item_lot[], las_col_item_value[], las_col_f_object[], las_col_t_object[],&								
														ldb_trans_uom,las_col_f_object_sv[], las_col_t_object_sv[],las_col_item_sv[], las_col_item_lot_sv[],las_col_item_value_sv[], ls_item_ref_table, &
														ls_samecol_string, ls_doc_type, ldb_dwitem_id, ldb_doc_id, ldw_currency,las_col_currency[], las_col_currency_sv[])		
							if li_rtn = -1 then return -1
						end if					
			
						
					end if
				NEXT									
				if ls_original_filter_item <> '?' and ls_original_filter_item <> '' then
					lc_string.f_globalreplace(ls_original_filter_item ,'~~','')
					ldw_item.setfilter( ls_original_filter_item)
					ldw_item.filter( )
				end if				
			NEXT														
		end if
	end if
		
	//-- update cot sku ,cogs--//
	if ldw_item.update(true,false) = -1 then
		gf_messagebox('m.b_doc.f_booking_item.07','Thông báo','Không cập nhật được số lượng theo đơn vị tồn kho:@' +rt_transaction.sqlerrtext ,'exclamation','ok',1)
		rollback using rt_transaction;
		destroy lds_stream

		return -1
	end if	
	ldw_item.resetupdate()
	
	if lds_stream.update(true,false ) = -1 then
		gf_messagebox('m.b_doc.f_booking_item.08','Thông báo','Không cập nhật được steamvalue:@' +rt_transaction.sqlerrtext ,'exclamation','ok',1)
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
		Where stream_value.doc_ref_id = :ldb_doc_id using rt_transaction;
		if ll_count = 0 and ls_manage_qty_yn ='Y' and vs_qty_yn = 'Y' and upper(vs_post_type) = 'POST'  then
			gf_messagebox('m.b_doc.f_bookig_item.10','Thông báo','Cập nhật ghi sổ không thành công f_bookig_item(252)','exclamation','ok',1)
			Rollback using rt_transaction;
			return -1
		end if
//----------------------------------------------------------------------------//

destroy lds_stream
return 1
end function

public function long f_unbooking_ex (double vdb_doc_id, string vs_qty_yn, string vs_value_yn);//Hàm sửa ghi sổ chứng từ
//Tham số: vl_doc_id :id của chứng từ (document)
t_transaction	lt_transaction
t_ds_db 			lds_tmp, lds_obj_post
long				ll_rtn
date				ld_trans_date
double			ladb_related_doc_id[]

this.iw_display.f_get_transaction( lt_transaction)
if this.f_get_trans_date( ld_trans_date) = -1 then return -1
if isnull(ld_trans_date) then
	gf_messagebox('m.b_doc.f_booking.02','Thông báo','Ngày giao dịch chưa có','exclamation','ok',1)
	return -1
end if
//B3: Xóa bảng Trans
delete stream_value where doc_ref_id =:vdb_doc_id using lt_transaction;
if lt_transaction.sqlcode = -1 then
	gf_messagebox('m.b_doc.f_unbooking.01','Thông báo','Lỗi xóa dữ liệu:@'+lt_transaction.sqlerrtext,'stop','ok',1)
	rollback using lt_transaction;
	return -1
end if

delete ledger_trans where doc_ref_id =:vdb_doc_id using lt_transaction;
if lt_transaction.sqlcode = -1 then 
	gf_messagebox('m.b_doc.f_unbooking.01','Thông báo','Lỗi xóa dữ liệu:@'+lt_transaction.sqlerrtext,'stop','ok',1)
	rollback using lt_transaction;
	return -1
end if

delete object_trans where doc_ref_id =:vdb_doc_id using lt_transaction;
if lt_transaction.sqlcode = -1 then 
	gf_messagebox('m.b_doc.f_unbooking.01','Thông báo','Lỗi xóa dữ liệu:@'+lt_transaction.sqlerrtext,'stop','ok',1)
	rollback using lt_transaction;
	return -1
end if


//-- cập nhật object balance --//
//-- update object_balance đối tượng Nợ--//
lds_obj_post = create t_ds_db
lds_obj_post.dataobject = 'ds_obj_balance_post_dr'
if this.f_insert_object_balance( vdb_doc_id,  ld_trans_date, lt_transaction, lds_obj_post, 'unpost',gs_sob) <> 1 then
	destroy lds_obj_post
	return -1	
end if
//-- update ledger_balance đối tượng Nợ--//
lds_obj_post.dataobject = 'ds_ledger_balance_post_dr'
if this.f_insert_object_balance( vdb_doc_id,  ld_trans_date, lt_transaction, lds_obj_post, 'unpost',gs_sob) <> 1 then
	destroy lds_obj_post
	return -1	
end if
//-- update object_balance đối tượng Có--//
lds_obj_post.dataobject = 'ds_obj_balance_post_cr'
if this.f_insert_object_balance( vdb_doc_id,  ld_trans_date, lt_transaction, lds_obj_post, 'unpost',gs_sob) <> 1 then
	destroy lds_obj_post
	return -1	
end if
//-- update ledger_balance đối tượng Có--//
lds_obj_post.dataobject = 'ds_ledger_balance_post_cr'
if this.f_insert_object_balance( vdb_doc_id,  ld_trans_date, lt_transaction, lds_obj_post, 'unpost',gs_sob) <> 1 then
	destroy lds_obj_post
	return -1	
end if

//-- cập nhật lại bảng item_balance --//
if this.f_booking_item_ex(lt_transaction, ld_trans_date, 'unpost', vs_qty_yn, vs_value_yn, ladb_related_doc_id[]) = -1 then
	return -1
end if
//-- xóa post line --//
delete post_line where doc_id =:vdb_doc_id using lt_transaction;
if lt_transaction.sqlcode = -1 then
	gf_messagebox('m.b_doc.f_unbooking.01','Thông báo','Lỗi xóa dữ liệu:@'+lt_transaction.sqlerrtext,'stop','ok',1)
	rollback using lt_transaction;
	return -1
end if

destroy lds_tmp
destroy lds_obj_post
return ll_rtn
end function

public function integer f_insert_item_balance_row_ex (ref t_transaction rt_transaction, ref powerobject rpo_item, ref long vl_item_row, t_dw_mpl rdw_f_object, t_dw_mpl rdw_t_object, date vd_trans_date, string vs_post_type, string vas_col_item[], string vas_col_item_value[], string vas_f_col_object[], string vas_t_col_object[], any vaa_data[], string vs_qty_yn, string vs_value_yn, double vdb_trans_uom, string vs_qty_column, double vdb_value, string vs_trans_qty_yn, string vs_trans_val_yn, ref s_str_data rstr_data_from_to, double vdb_doc_id, string vs_related_doc_qty_yn);/**************************************************************************************
Chức năng: Cập nhật 1 record giao dịch vào bảng item balance. 
	 # mặt hàng không quản lý số lượng thì bỏ qua
	 # Mặt hàng không quản lý số lot/seri: cập số lượng và giá trị tồn kho trên cùng record
	 # mặt hàng có quản lý số lot/seri: 
	 		- Cập nhật số lượng tồn kho theo lot/seri, mỗi lot/seri 1 record tồn kho Số lượng.
			- Cập nhật giá trị tồn kho theo mã hàng ( tổng giá trị của các lot/seri), mỗi mã hàng 1 record giá trịn tồn kho.
-------------------------------------
Tham số:	- rt_transaction : transacion của document
				- rdw_item : dw giao dịch chứa item cần ghi sổ, dw có chứa column giá trị ghi sổ trong trường hợp vs_value = 'Y'
				- rdw_f_object: dw chứa đối tượng FROM
				- rdw_t_object: dw chứa đối tượng TO
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
								  vaa_data[9](sob),vaa_data[10](value_yn), vaa_data[11](branch_id)
--------------------------------------
return:	0: chứng từ không cập nhật tồn kho
			1: cập nhật tồn kho thành công
		   -1: Lỗi
=============================================================================*/
int							li_rtn	, li_idx		
long						ll_f_object_row, ll_t_object_row
string						ls_balance_control, ls_warehouse_trans_type, ls_lot_yn,ls_serial_yn, ls_trans_qty_yn, ls_trans_val_yn
string						ls_f_object_type,ls_t_object_type, ls_tmp_object_type
double					ldb_qty_sku, ldb_trans_qty, ldb_trans_uom, ldb_round_diff, ldb_object_ref_id
double					ldb_f_object_id, ldb_t_object_id, ldb_tmp_object_id, ldb_null
boolean					lb_is_manage_value
any						la_tmp
t_dw_mpl				ldw_master
b_inventory				lobj_ins

//--Lấy Id của đối tượng --//
if rdw_f_object.dataobject = rpo_item.dynamic f_get_dataobject() then 
	ldb_f_object_id = rdw_f_object.getitemnumber( vl_item_row, vas_f_col_object[1])
	if  upperbound(vas_f_col_object[]) = 4 then
		rstr_data_from_to.aa_data_from[3] =  rdw_f_object.getitemnumber( vl_item_row, vas_f_col_object[4])
	end if
else
	ldw_master = rdw_f_object.f_get_idw_master()
	if isvalid(ldw_master) then
		if ldw_master.dataobject = rpo_item.dynamic f_get_dataobject() then
			ldb_object_ref_id =  rpo_item.dynamic getitemnumber( vl_item_row, 'ID')
			ll_f_object_row = rdw_f_object.find("object_ref_id ="+string(ldb_object_ref_id),1,rdw_f_object.rowcount())
		end if
	end if
	if ll_f_object_row = 0 then ll_f_object_row = rdw_f_object.getrow( )
	if ll_f_object_row > 0 then
		ldb_f_object_id = rdw_f_object.getitemnumber( ll_f_object_row, vas_f_col_object[1])
		if  upperbound(vas_f_col_object[]) = 4 then
			rstr_data_from_to.aa_data_from[3] =  rdw_f_object.getitemnumber( ll_f_object_row, vas_f_col_object[4])
		end if		
	end if
end if		
if rdw_t_object.dataobject = rpo_item.dynamic f_get_dataobject() then 
	ldb_t_object_id = rdw_t_object.getitemnumber( vl_item_row, vas_t_col_object[1])
	if ldb_t_object_id = ldb_f_object_id then //-- từ kho = đến kho: cho phép đổi lot/serial trong cùng kho --//
		FOR li_idx = 2 to upperbound(vas_t_col_object[]) 
			la_tmp = rdw_t_object.f_getitemany( vl_item_row, vas_t_col_object[li_idx])
			if isnull(la_tmp) and li_idx < 4 then
				rstr_data_from_to.aa_data_to[li_idx -1]  = rstr_data_from_to.aa_data_from[li_idx -1] 
			else
				rstr_data_from_to.aa_data_to[li_idx -1] =  rdw_t_object.f_getitemany( vl_item_row, vas_t_col_object[li_idx])
			end if
		NEXT		
	else
		if upperbound(rstr_data_from_to.aa_data_to[]) = 3 then
			rstr_data_from_to.aa_data_to[1] = rstr_data_from_to.aa_data_from[1] 
			rstr_data_from_to.aa_data_to[2] = rstr_data_from_to.aa_data_from[2] 
		elseif upper(this.f_get_object_type(ldb_t_object_id )) = 'WAREHOUSE'  then
			rstr_data_from_to.aa_data_to[1] = rstr_data_from_to.aa_data_from[1] 
			rstr_data_from_to.aa_data_to[2] = rstr_data_from_to.aa_data_from[2] 		
			if upperbound(vas_t_col_object[]) = 4  then
				rstr_data_from_to.aa_data_to[3] =  rdw_t_object.f_getitemany( vl_item_row, vas_t_col_object[4])
			end if
		else
			rstr_data_from_to.aa_data_to[1] = rstr_data_from_to.aa_data_from[1] 
			rstr_data_from_to.aa_data_to[2] = rstr_data_from_to.aa_data_from[2] 											
		end if	
	end if
else
	ldw_master = rdw_t_object.f_get_idw_master()
	if isvalid(ldw_master) then
		if ldw_master.dataobject = rpo_item.dynamic f_get_dataobject() then
			ldb_object_ref_id =  rpo_item.dynamic getitemnumber( vl_item_row, 'ID')
			ll_t_object_row = rdw_t_object.find("object_ref_id ="+string(ldb_object_ref_id),1,rdw_t_object.rowcount())
		end if
	end if
	if ll_t_object_row = 0 then ll_t_object_row = rdw_t_object.getrow( )	
	if ll_t_object_row > 0 then
		ldb_t_object_id = rdw_t_object.getitemnumber( ll_t_object_row, vas_t_col_object[1])
		if ldb_t_object_id = ldb_f_object_id then //-- từ kho = đến kho: cho phép đổi lot/serial trong cùng kho --//
			FOR li_idx = 2 to upperbound(vas_t_col_object[]) 
				la_tmp = rdw_t_object.f_getitemany( ll_t_object_row, vas_t_col_object[li_idx])
				if isnull(la_tmp) and li_idx < 4 then
					rstr_data_from_to.aa_data_to[li_idx -1]  = rstr_data_from_to.aa_data_from[li_idx -1] 
				else
					rstr_data_from_to.aa_data_to[li_idx -1] =  rdw_t_object.f_getitemany( ll_t_object_row, vas_t_col_object[li_idx])
				end if
			NEXT						
		else
			if upperbound(rstr_data_from_to.aa_data_to[]) = 3 then
				rstr_data_from_to.aa_data_to[1] = rstr_data_from_to.aa_data_from[1] 
				rstr_data_from_to.aa_data_to[2] = rstr_data_from_to.aa_data_from[2] 
			elseif upper(this.f_get_object_type(ldb_t_object_id )) = 'WAREHOUSE'  then
				rstr_data_from_to.aa_data_to[1] = rstr_data_from_to.aa_data_from[1] 
				rstr_data_from_to.aa_data_to[2] = rstr_data_from_to.aa_data_from[2] 				
				if upperbound(vas_t_col_object[]) = 4  then
					rstr_data_from_to.aa_data_to[3] =  rdw_t_object.f_getitemany( ll_t_object_row, vas_t_col_object[4])
				end if
			else
				rstr_data_from_to.aa_data_to[1] = rstr_data_from_to.aa_data_from[1] 
				rstr_data_from_to.aa_data_to[2] = rstr_data_from_to.aa_data_from[2] 								
			end if				
		end if				
	end if
end if		
if isnull(ldb_f_object_id) or ldb_f_object_id = 0 then 
	gf_messagebox('m.b_doc.f_insert_item_balance_row.01','Thông báo','Đối tượng ghi số xuất nhập kho chưa được nhập NULL','stop','ok',1)
	return -1
end if
if isnull(ldb_t_object_id) or ldb_t_object_id = 0 then 
	gf_messagebox('m.b_doc.f_insert_item_balance_row.01','Thông báo','Đối tượng ghi số xuất nhập kho chưa được nhập NULL','stop','ok',1)
	return -1
end if
ls_f_object_type = this.f_get_object_type(ldb_f_object_id )		
ls_t_object_type = this.f_get_object_type(ldb_t_object_id )	
if upper(ls_f_object_type) = 'WAREHOUSE' then
	ls_warehouse_trans_type = 'OUT'	
else
	ls_warehouse_trans_type = 'IN'
end if

lobj_ins.f_get_lot_or_serial_yn(vaa_data[1],  ls_lot_yn,ls_serial_yn)
lb_is_manage_value =  lobj_ins.f_is_managed_value( vaa_data[1])
//-- set sku_qty khi POST --//	
	if upper(vs_post_type) = 'POST' then
		if upper(vs_value_yn) = 'N' or  (upper(vs_value_yn) = 'Y' and (ls_lot_yn ='Y' or ls_serial_yn = 'Y') )  then  // nếu quản lý lot/seri ghi sổ gia trị chưa tình sku của lot/seri
			//-- Lây sku_qty và round diff --//		
			if this.f_set_Qty_sku(rt_transaction, rpo_item, vl_item_row,vaa_data[1],vdb_trans_uom, vs_qty_column, ls_warehouse_trans_type, ldb_qty_sku, ldb_round_diff) = -1 then return -1
		elseif upper(vs_value_yn) = 'Y' then			
			if not lb_is_manage_value then
				//-- Lây sku_qty và round diff --//		
				if this.f_set_Qty_sku(rt_transaction, rpo_item, vl_item_row,vaa_data[1],vdb_trans_uom, vs_qty_column, ls_warehouse_trans_type, ldb_qty_sku, ldb_round_diff) = -1 then return -1				
			else
				ldb_qty_sku = rpo_item.dynamic getitemnumber(vl_item_row,vs_qty_column+'_sku')
			end if
		else	
			ldb_qty_sku = rpo_item.dynamic getitemnumber(vl_item_row,vs_qty_column+'_sku')
		end if
	else //-- Lấy sku_qty khi UNPOST hoặc ghi sổ vừa SL vừa Giá trị--//
		ldb_qty_sku = rpo_item.dynamic getitemnumber(vl_item_row,vs_qty_column+'_sku')
		if isnull(ldb_qty_sku) then ldb_qty_sku = 0		
		//-- Lấy round diff --//
		if this.f_get_round_diff( rt_transaction, rpo_item, vl_item_row, vaa_data[1], vdb_trans_uom,vs_qty_column, ldb_round_diff) = -1 then return -1
	end if
	if ldb_qty_sku < 0 then //-- Đảo giao dịch IN<->OUT   khi nhập form kiểm kê--// 
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
		lobj_ins.f_update_round_diff( ldb_f_object_id, ldb_round_diff, rt_transaction)
	else
		lobj_ins.f_update_round_diff( ldb_t_object_id, ldb_round_diff, rt_transaction)
	end if	


//-- Lấy giá trị ghi sổ --//
if upper(vs_value_yn) = 'Y' then
	if upper(vs_post_type) = 'UNPOST' then vdb_value = - vdb_value
end if	
	
//-- Cập nhật đối tượng FROM --//
if upper(ls_f_object_type) = 'WAREHOUSE' then
	//-- kiểm tra lock xuât kho khi đang kiểm kê --//
	if lobj_ins.f_is_counting_locked( vdb_doc_id, vaa_data[1], ldb_f_object_id, 'OUT', date(vaa_data[5])) then
		rollback using rt_transaction;
		return -1
	end if
	ls_balance_control  = lobj_ins.f_get_warehouse_negative(ldb_f_object_id )			
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
if vs_qty_yn = 'Y'  and ( vs_trans_val_yn = 'N'  or vs_related_doc_qty_yn = 'N' )  then  //-- ghi sổ balance SL--//
	vaa_data[10] = 'N'
	vaa_data[11] = gdb_branch
	if this.f_update_item_balance(rt_transaction, vaa_data, vd_trans_date, ldb_qty_sku,0,'OUT',ls_balance_control, 'N' , 'N' ,ls_t_object_type) = -1 then
		return -1
	end if	
end if
if vs_value_yn = 'Y' and ( vs_qty_yn = 'Y' or vs_related_doc_qty_yn = 'Y')   then  //-- ghi sổ balance GT--//
	vaa_data[10] = vs_value_yn
	vaa_data[11] = gdb_branch
	if this.f_update_item_balance(rt_transaction, vaa_data, vd_trans_date, ldb_qty_sku,vdb_value,'OUT',ls_balance_control, 'N' , vs_value_yn,ls_t_object_type) = -1 then
		return -1
	end if
end if

//-- Cập nhật đối tượng TO --//
if upper(ls_t_object_type) = 'WAREHOUSE' then
	//-- kiểm tra lock xuât kho khi đang kiểm kê --//
	if lobj_ins.f_is_counting_locked(vdb_doc_id, vaa_data[1], ldb_t_object_id, 'IN', date(vaa_data[5])) then
		rollback using rt_transaction;
		return -1
	end if	
	ls_balance_control  = lobj_ins.f_get_warehouse_negative(ldb_t_object_id )	
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
if vs_qty_yn = 'Y'  and ( vs_trans_val_yn = 'N' or vs_related_doc_qty_yn = 'N') then //-- ghi sổ balance SL--//
	vaa_data[10] = 'N'
	vaa_data[11] = gdb_branch
	if this.f_update_item_balance(rt_transaction, vaa_data, vd_trans_date, ldb_qty_sku,0,'IN',ls_balance_control, 'N' , 'N',ls_t_object_type) = -1 then
		return -1
	end if
end if
if vs_value_yn = 'Y' and ( vs_qty_yn = 'Y' or vs_related_doc_qty_yn = 'Y')  then  //-- ghi sổ balance GT--//
	vaa_data[10] = vs_value_yn
	vaa_data[11] = gdb_branch
	if this.f_update_item_balance(rt_transaction, vaa_data, vd_trans_date, ldb_qty_sku,vdb_value,'IN',ls_balance_control, 'N' , vs_value_yn,ls_t_object_type) = -1 then
		return -1
	end if
end if

return 1

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
string						ls_f_object_type,ls_t_object_type, ls_tmp_object_type
double					ldb_qty_sku, ldb_trans_qty, ldb_trans_uom, ldb_round_diff, ldb_object_ref_id
double					ldb_f_object_id, ldb_t_object_id, ldb_tmp_object_id, ldb_null
boolean					lb_is_manage_value
any						la_tmp
b_obj_instantiate		lobj_ins


//--Lấy Id của đối tượng --//
if vds_f_object.dataobject = rds_item.dataobject then 
	ldb_f_object_id = vds_f_object.getitemnumber( rl_item_row, vas_f_col_object[1])
	if  upperbound(vas_f_col_object[]) = 4 then
		rstr_data_from_to.aa_data_from[3] = vds_f_object.getitemnumber( rl_item_row, vas_f_col_object[4])
	end if	
else
	ldb_object_ref_id =  rds_item.getitemnumber( rl_item_row, 'ID')
	 
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(vds_f_object.dataobject,len(vds_f_object.dataobject) -5) + '[')
	li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
	li_chr_nbr = li_pos_e - (li_pos_s + len(vds_f_object.dataobject) - 4)
	li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(vds_f_object.dataobject) - 4 , li_chr_nbr ))
	
	if rds_item.dataobject = rstr_ds_4_posting.ds_master[li_idx_master].dataobject then
		ll_f_object_row = vds_f_object.find("object_ref_id ="+string(ldb_object_ref_id),1,vds_f_object.rowcount())
		if ll_f_object_row > 0 then
			ldb_f_object_id = vds_f_object.getitemnumber( ll_f_object_row, vas_f_col_object[1])
			if  upperbound(vas_f_col_object[]) = 4 then
				rstr_data_from_to.aa_data_from[3] = vds_f_object.getitemnumber( ll_f_object_row, vas_f_col_object[4])
			end if				
		end if
	else
		ldb_object_ref_id =  rds_item.getitemnumber( rl_item_row, 'object_ref_id')
		 
		li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(rds_item.dataobject,len(rds_item.dataobject) -5) + '[')
		li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
		li_chr_nbr = li_pos_e - (li_pos_s + len(rds_item.dataobject) - 4)
		li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(rds_item.dataobject) - 4 , li_chr_nbr ))		
		if vds_f_object.dataobject = rstr_ds_4_posting.ds_master[li_idx_master].dataobject then
			ll_f_object_row = vds_f_object.find(" ID ="+string(ldb_object_ref_id),1,vds_f_object.rowcount())
			if ll_f_object_row > 0 then
				ldb_f_object_id = vds_f_object.getitemnumber( ll_f_object_row, vas_f_col_object[1])
				if  upperbound(vas_f_col_object[]) = 4 then
					rstr_data_from_to.aa_data_from[3] = vds_f_object.getitemnumber( ll_f_object_row, vas_f_col_object[4])
				end if						
			end if		
		elseif vds_f_object.rowcount() = 1 then
			ldb_f_object_id = vds_f_object.getitemnumber( 1, vas_f_col_object[1])
			if  upperbound(vas_f_col_object[]) = 4 then
				rstr_data_from_to.aa_data_from[3] = vds_f_object.getitemnumber( 1, vas_f_col_object[4])
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
		elseif upper(this.f_get_object_type(ldb_t_object_id )) = 'WAREHOUSE'  then
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
	ldb_object_ref_id =  rds_item.getitemnumber( rl_item_row, 'ID')
	 
	li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(vds_t_object.dataobject, len(vds_t_object.dataobject) -5) + '[')
	li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
	li_chr_nbr = li_pos_e - (li_pos_s + len(vds_t_object.dataobject ) - 4)
	li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(vds_t_object.dataobject) - 4 , li_chr_nbr ))
	
	if rds_item.dataobject = rstr_ds_4_posting.ds_master[li_idx_master].dataobject then
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
				elseif upper(this.f_get_object_type(ldb_t_object_id )) = 'WAREHOUSE'  then
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
	else
		ldb_object_ref_id =  rds_item.getitemnumber( rl_item_row, 'object_ref_id')
		 
		li_pos_s = pos(rstr_ds_4_posting.s_dataobject_str,  left(rds_item.dataobject,len(rds_item.dataobject) -5) + '[')
		li_pos_e = pos(rstr_ds_4_posting.s_dataobject_str,  ']',li_pos_s)
		li_chr_nbr = li_pos_e - (li_pos_s + len(rds_item.dataobject) - 4)
		li_idx_master = integer(mid(rstr_ds_4_posting.s_dataobject_str, li_pos_s + len(rds_item.dataobject) - 4 , li_chr_nbr ))		
		if vds_t_object.dataobject = rstr_ds_4_posting.ds_master[li_idx_master].dataobject then
			ll_t_object_row = vds_t_object.find(" ID ="+string(ldb_object_ref_id),1,vds_t_object.rowcount())
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
					elseif upper(this.f_get_object_type(ldb_t_object_id )) = 'WAREHOUSE'  then
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
		elseif vds_t_object.rowcount() = 1 then
			ldb_t_object_id = vds_t_object.getitemnumber( 1, vas_t_col_object[1])
			if ldb_t_object_id = ldb_f_object_id then //-- từ kho = đến kho: cho phép đổi lot/serial trong cùng kho --//
				FOR li_idx = 2 to upperbound(vas_t_col_object[]) 
					la_tmp = vds_t_object.f_getitemany( 1, vas_t_col_object[li_idx])
					if isnull(la_tmp) and li_idx < 4 then
						rstr_data_from_to.aa_data_to[li_idx -1]  = rstr_data_from_to.aa_data_from[li_idx -1] 
					else
						rstr_data_from_to.aa_data_to[li_idx -1] =  vds_t_object.f_getitemany( 1, vas_t_col_object[li_idx])
					end if																			
				NEXT	
			else
				if upperbound(rstr_data_from_to.aa_data_to[]) = 3 then
					rstr_data_from_to.aa_data_to[1] = rstr_data_from_to.aa_data_from[1] 
					rstr_data_from_to.aa_data_to[2] = rstr_data_from_to.aa_data_from[2] 
				elseif upper(this.f_get_object_type(ldb_t_object_id )) = 'WAREHOUSE'  then
					rstr_data_from_to.aa_data_to[1] = rstr_data_from_to.aa_data_from[1] 
					rstr_data_from_to.aa_data_to[2] = rstr_data_from_to.aa_data_from[2] 	
					if upperbound(vas_t_col_object[]) = 4 then
						rstr_data_from_to.aa_data_to[3] =  vds_t_object.f_getitemany( 1, vas_t_col_object[4])
					end if
				else
					rstr_data_from_to.aa_data_to[1] = rstr_data_from_to.aa_data_from[1] 
					rstr_data_from_to.aa_data_to[2] = rstr_data_from_to.aa_data_from[2] 									
				end if	
			end if						
		end if		
	end if		
end if		


if isnull(ldb_f_object_id) or ldb_f_object_id = 0 then 
	gf_messagebox('m.b_doc.f_insert_item_balance_row_multi.01','Thông báo','Đối tượng ghi sổ xuất nhập kho chưa được nhập NULL','stop','ok',1)
	return -1
end if
if isnull(ldb_t_object_id) or ldb_t_object_id = 0 then 
	gf_messagebox('m.b_doc.f_insert_item_balance_row_multi.01','Thông báo','Đối tượng ghi số xuất nhập kho chưa được nhập NULL','stop','ok',1)
	return -1
end if
ls_f_object_type = this.f_get_object_type(ldb_f_object_id )		
ls_t_object_type = this.f_get_object_type(ldb_t_object_id )		
if upper(ls_f_object_type) = 'WAREHOUSE' then
	ls_warehouse_trans_type = 'OUT'
else
	ls_warehouse_trans_type = 'IN'
end if

lobj_ins.f_get_lot_or_serial_yn(vaa_data[1],  ls_lot_yn,ls_serial_yn)
lb_is_manage_value =  lobj_ins.f_is_managed_value( vaa_data[1])

//-- set sku_qty khi POST --//	
//if upper(vs_qty_yn) = 'Y' then
	if upper(vs_post_type) = 'POST' then
		if upper(vs_value_yn) = 'N' or  (upper(vs_value_yn) = 'Y' and (ls_lot_yn ='Y' or ls_serial_yn = 'Y') ) then  // nếu quản lý lot/seri ghi sổ gia trị chưa tình sku của lot/seri
			//-- Lây sku_qty và round diff --//		
			if this.f_set_Qty_sku(rt_transaction, rds_item, rl_item_row,vaa_data[1],vdb_trans_uom, vs_qty_column, ls_warehouse_trans_type, ldb_qty_sku, ldb_round_diff) = -1 then return -1
		else
			ldb_qty_sku = rds_item.dynamic getitemnumber(rl_item_row,vs_qty_column+'_sku')
		end if
	else //-- Lấy sku_qty khi UNPOST hoặc ghi sổ vừa SL vừa Giá trị--//
		ldb_qty_sku = rds_item.dynamic getitemnumber(rl_item_row,vs_qty_column+'_sku')
		if isnull(ldb_qty_sku) then ldb_qty_sku = 0		
		//-- Lấy round diff --//
		if this.f_get_round_diff( rt_transaction, rds_item, rl_item_row, vaa_data[1], vdb_trans_uom,vs_qty_column, ldb_round_diff) = -1 then return -1
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
		lobj_ins.f_update_round_diff( ldb_f_object_id, ldb_round_diff, rt_transaction)
	else
		lobj_ins.f_update_round_diff( ldb_t_object_id, ldb_round_diff, rt_transaction)
	end if	
//end if

//-- Lấy giá trị ghi sổ --//
if upper(vs_value_yn) = 'Y' then
	if upper(vs_post_type) = 'UNPOST' then vdb_value = - vdb_value
end if	
	
//-- Cập nhật đối tượng FROM --//
if upper(ls_f_object_type) = 'WAREHOUSE' then
	ls_balance_control  = lobj_ins.f_get_warehouse_negative(ldb_f_object_id )

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
		return -1
	end if	
end if
if vs_value_yn = 'Y' and  (vs_qty_yn = 'Y' or vs_related_doc_qty_yn ='Y') then   //--Ghi số balance GT--//
	vaa_data[10] = vs_value_yn
	vaa_data[11] = gdb_branch
	if this.f_update_item_balance(rt_transaction, vaa_data, vd_trans_date, ldb_qty_sku,vdb_value,'OUT',ls_balance_control, 'N' , vs_value_yn,ls_t_object_type) = -1 then
		return -1
	end if
end if

//-- Cập nhật đối tượng TO --//
if upper(ls_t_object_type) = 'WAREHOUSE' then
	ls_balance_control  = lobj_ins.f_get_warehouse_negative(ldb_t_object_id )
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
		return -1
	end if
end if
if vs_value_yn = 'Y'  and  (vs_qty_yn = 'Y' or vs_related_doc_qty_yn ='Y')  then   //--Ghi số balance GT--//
	vaa_data[10] = vs_value_yn
	vaa_data[11] = gdb_branch
	if this.f_update_item_balance(rt_transaction, vaa_data, vd_trans_date, ldb_qty_sku,vdb_value,'IN',ls_balance_control, 'N' , vs_value_yn,ls_t_object_type) = -1 then
		return -1
	end if
end if

return 1

end function

protected function integer f_get_posting_object_multi (double vdb_doc_version, s_str_post_account vstr_post_info, t_ds_db vds_get_amount, long vl_handle_row, ref double rdb_dr_object_id, ref double rdb_cr_object_id, ref t_transaction rt_transaction, ref s_str_ds_4_posting rstr_ds_4_posting, ref double rdb_dr_subacct_id, ref double rdb_cr_subacct_id);long			ll_master_row
double		ldb_object_ref_id
string			ls_dwo_master, ls_colname, ls_coltype
int				li_chr_nbr, li_idx_master, li_pos_s, li_pos_e
c_dwservice			l_dwservice

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

public function integer f_create_exrate_post_line_ex (double vdb_dr_object_id, double vdb_cr_object_id, t_ds_db vds_f_post_line, double vdb_trans_amount, double vdb_base_amount, double vdb_settle_curr, double vdb_settle_exrate, date vd_trans_date, double vdb_doc_id, double vdb_object_ref_id, string vs_object_ref_table, s_str_post_account vstr_post_account, ref t_ds_db rds_post_line);/**********************************************************
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
			//-- xác định số tiền chênh lệch : ldb_exrate_diff_amt--//
			if upper(vstr_post_account.s_dr_object_type) = 'VENDOR' OR upper(vstr_post_account.s_dr_object_type) = 'CUSTOMER' OR upper(vstr_post_account.s_dr_object_type) = 'STAFF' THEN
				ldb_exrate_diff_amt =  ldb_settle_trans_amt * vdb_settle_exrate - ldb_f_base_amt  // dr - cr //
			else
				ldb_exrate_diff_amt =  ldb_f_base_amt - ldb_settle_trans_amt * vdb_settle_exrate // cr - dr //
			end if					
			if ldb_exrate_diff_amt = 0 then continue
			if this.f_insert_exrate_post_line_ex( rds_post_line,vstr_post_account, ldb_exrate_diff_amt, vdb_settle_curr, vdb_settle_exrate, vd_trans_date, vdb_doc_id, vdb_object_ref_id, vs_object_ref_table, vdb_dr_object_id, vdb_cr_object_id) = -1 then 				
				return -1		
			end if
		else
			gf_messagebox('m.b_doc.f_create_exrate_post_line_ex.01','Thống báo','Ngoại tệ khác nhau không thể cấn trừ công nợ','exclamation','ok',1)
			return -1
		end if

	NEXT


return 1
end function

public function integer f_insert_exrate_post_line_ex (ref t_ds_db rds_post_line, s_str_post_account vstr_post_account, double vdb_diff_amount, double vdb_settle_currency, double vdb_exrate, date vd_trans_date, double vdb_doc_id, double vdb_object_ref_id, string vs_object_ref_table, double vdb_dr_object_id, double vdb_cr_object_id);long			ll_insert_row
double		ldba_exchange_account[]
string			ls_exrate_method, ls_trans_text, ls_posting_type, ls_doc_type
b_obj_instantiate		lbo_inst


if vdb_settle_currency = 0 or isnull(vdb_settle_currency) then return 0
if vdb_doc_id = 0 or isnull(vdb_doc_id) then return 0
if vdb_diff_amount = 0 or isnull(vdb_diff_amount) then return 0

if this.ic_unit_instance.f_get_exchange_account_info( vdb_settle_currency, ldba_exchange_account[], ls_exrate_method, ls_trans_text) = -1 then return -1
ls_doc_type = lbo_inst.f_get_doc_type( vdb_doc_id)
if ls_doc_type = '' then
	gf_messagebox('m.b_doc.f_insert_exrate_post_line_ex.02','Thông báo','Không xác định được loại chứng từ của ID:@'+string(vdb_doc_id),'exclamation','ok',1)
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
rds_post_line.setitem(ll_insert_row,'id', this.f_create_id( ) )
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

public function integer f_get_dfl_trans_info (string vs_doctype, double vdb_branch_id, ref s_str_data rstr_data, ref t_transaction rt_transaction);//------------------------------------------------------------------//
// vdb_branch_id = 0 : cài cặt ghi sổ ko phân biệt chi nhanh --//
//--------------------------------------------------------------------//
int			li_cnt

if vdb_branch_id > 0 then
	select count(id) into :li_cnt from trans_setup_hdr 
	where branch_id = :vdb_branch_id
	and coalesce(DEFAULT_YN, 'N') = 'Y' 
	and DOC_TYPE = :vs_doctype
	and company_id = :gi_user_comp_id
	using rt_transaction;
	if li_cnt = 1 then
		select id, TRANS_DESC, coalesce(QUANTITY_YN,'N'), coalesce(VALUE_YN,'N') ,  coalesce(sob_yn,'N') 
		into :rstr_data.db_data, :rstr_data.as_data[1], :rstr_data.as_data[2], :rstr_data.as_data[3], :rstr_data.as_data[4]
		from trans_setup_hdr 
		where branch_id = :vdb_branch_id
		and coalesce(DEFAULT_YN, 'N') = 'Y' 
		and DOC_TYPE = :vs_doctype
		and company_id = :gi_user_comp_id
		using rt_transaction;
	elseif  li_cnt > 1 then
		select id, TRANS_DESC, coalesce(QUANTITY_YN,'N'), coalesce(VALUE_YN,'N')  ,  coalesce(sob_yn,'N') 
		into :rstr_data.db_data, :rstr_data.as_data[1], :rstr_data.as_data[2], :rstr_data.as_data[3], :rstr_data.as_data[4]
		from trans_setup_hdr 
		where branch_id = :vdb_branch_id
		and coalesce(DEFAULT_YN, 'N') = 'Y' 
		and DOC_TYPE = :vs_doctype
		and company_id = :gi_user_comp_id
		and rownum = 1
		using rt_transaction;		
		gf_messagebox('m.b_doc.f_get_dfl_trans_info.02','Thông báo','Giao dịch mặc định nhiều > 1','exclamation','ok',1)
		return 2				
	else
		gf_messagebox('m.b_doc.f_get_dfl_trans_info.01','Thông báo','Chưa cài đặt giao dịch mặc định','exclamation','ok',1)
		return 0
	end if
else
	select count(id) into :li_cnt from trans_setup_hdr 
	where 
	 coalesce(DEFAULT_YN, 'N') = 'Y' 
	and DOC_TYPE = :vs_doctype
	and company_id = :gi_user_comp_id
	using rt_transaction;
	if li_cnt = 1 then
		select id, TRANS_DESC, coalesce(QUANTITY_YN,'N'), coalesce(VALUE_YN,'N')  ,  coalesce(sob_yn,'N') 
		into :rstr_data.db_data, :rstr_data.as_data[1], :rstr_data.as_data[2], :rstr_data.as_data[3], :rstr_data.as_data[4]
		from trans_setup_hdr 
		where
		 coalesce(DEFAULT_YN, 'N') = 'Y' 
		and DOC_TYPE = :vs_doctype
		and company_id = :gi_user_comp_id
		using rt_transaction;
	elseif  li_cnt > 1 then
		select id, TRANS_DESC, coalesce(QUANTITY_YN,'N'), coalesce(VALUE_YN,'N')  ,  coalesce(sob_yn,'N') 
		into :rstr_data.db_data, :rstr_data.as_data[1], :rstr_data.as_data[2], :rstr_data.as_data[3], :rstr_data.as_data[4]
		from trans_setup_hdr 
		where
		 coalesce(DEFAULT_YN, 'N') = 'Y' 
		and DOC_TYPE = :vs_doctype
		and company_id = :gi_user_comp_id
		and rownum = 1
		using rt_transaction;		
		gf_messagebox('m.b_doc.f_get_dfl_trans_info.02','Thông báo','Giao dịch mặc định nhiều > 1','exclamation','ok',1)
		return 2		
	else
		gf_messagebox('m.b_doc.f_get_dfl_trans_info.01','Thông báo','Chưa cài đặt giao dịch mặc định','exclamation','ok',1)
		return 0		
	end if
end if
return 1
end function

public function string f_get_doc_type_ex (double vdb_doc_id, ref t_transaction rt_transaction);string			ls_doc_type

if vdb_doc_id = 0 then return ''
select doc.doc_type into :ls_doc_type
from document doc
where doc.id = :vdb_doc_id using rt_transaction;

if rt_transaction.sqlcode <> 0 then
	gf_messagebox('m.b_doc.f_get_doc_type.01','Thông báo','Lỗi SQL:@'+rt_transaction.sqlerrtext,'stop','ok',1)
	return ''
end if
if isnull(ls_doc_type) then ls_doc_type = ''
return ls_doc_type
end function

public function integer f_set_ds_4_posting ();return 0
end function

public function integer f_get_ds_4_posting (ref s_str_ds_4_posting rstr_ds_4_posting);rstr_ds_4_posting = istr_ds_4_posting
return 1
end function

on b_doc.create
call super::create
end on

on b_doc.destroy
call super::destroy
end on

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;int					li_rtn,li_idx,li_tax_pct
any 				laa_data[], laa_retrieve[],laa_null[]
long				ll_row,ll_line_no,ll_idx,ll_find
string				ls_trans_desc,ls_update_table,ls_QUANTITY_YN,ls_VALUE_YN, ls_int_string
double			ldb_f_ref_id, ldb_branch
datetime			ldt_sysdate
datawindow		ladw_detail[],ldw_detail
//t_ds_db			lds_trans_setup_hdr
c_datetime		lc_dt
s_str_data		lstr_data
b_obj_instantiate 	lobj_ins

if pos(rpo_dw.dataobject,'d_document') > 0 or pos(rpo_dw.dataobject,'d_doc_') > 0 then
	//Set người phụ trách và trạng thái
	rpo_dw.setitem(vl_currentrow,'handled_by',gi_userid)
	rpo_dw.setitem(vl_currentrow,'object_name', g_user.f_get_name_of_userid_ex(gi_userid, it_transaction ) )
	rpo_dw.setitem(vl_currentrow,'status','new')
	rpo_dw.setitem(vl_currentrow,'document_date',date(gd_session_date))
	li_rtn = rpo_dw.dynamic f_getdwdetails(ladw_detail)
	for li_idx = 1 to li_rtn
		ls_update_table = upper(ladw_detail[li_idx].describe( "DataWindow.Table.UpdateTable"))
		if ls_update_table = 'BOOKED_SLIP' or ls_update_table = 'ORDERS' then
			ll_row = ladw_detail[li_idx].dynamic event e_addrow()
			if ll_row > 0 then
				ldw_detail = ladw_detail[li_idx]
				ldw_detail.setitem( ll_row, 'version_no', 1)
				if ldw_detail.describe( "dept_code.x") <> '!' then
					ldw_detail.setitem( ll_row, 'dept_code', g_user.dept_code )
				end if
//				ldt_sysdate = lc_dt.f_getsysdate( )
				if ls_update_table = 'BOOKED_SLIP' then ldw_detail.setitem( ll_row,'TRANS_DATE',date(gd_session_date))
			end if
		end if
	next
	
	laa_retrieve[1] = upper(mid(this.classname(),3))
	if not this.ib_copying then
		//post giao dịch mặc định
//		laa_data[1] = '=Y'
//		ls_int_string = 'default_yn;'
		if  lobj_ins.f_is_branch_yn_ex('u_trans_setup', it_transaction )then
//			laa_data[2] = gdb_branch
//			ls_int_string = 'default_yn;branch_id;'
			ldb_branch = gdb_branch
		else
			ldb_branch = 0
		end if			

//		lds_trans_setup_hdr = create t_ds_db
//		this.f_init_object_table(lds_trans_setup_hdr, 'd_trans_setup_hdr_grid', ls_int_string, laa_data[],laa_retrieve[])
		
		if this.f_get_dfl_trans_info(laa_retrieve[1]  , ldb_branch, lstr_data,it_transaction ) > 0 then
//		if lds_trans_setup_hdr.rowcount() > 0 then
//			idb_trans_id = lds_trans_setup_hdr.getitemnumber(lds_trans_setup_hdr.rowcount(),'id')
			idb_trans_id = lstr_data.db_data
			if not isnull(idb_trans_id) and idb_trans_id > 0 then 
				laa_data[1] = idb_trans_id
				this.f_init_object_table(ids_trans_setup, 'd_trans_setup_grid', 'object_ref_id;',laa_data[],laa_retrieve[], it_transaction)
				rpo_dw.setitem(vl_currentrow,'trans_hdr_id',idb_trans_id)
				rpo_dw.setitem(vl_currentrow,'trans_desc',lstr_data.as_data[1] )
				if rpo_dw.describe('QUANTITY_YN.coltype') <> '!' then
					rpo_dw.setitem( vl_currentrow,'QUANTITY_YN',lstr_data.as_data[2] )
					rpo_dw.setitem( vl_currentrow,'VALUE_YN',lstr_data.as_data[3] )	
				elseif ls_update_table = 'BOOKED_SLIP' then
					ldw_detail.setitem( ll_row,'QUANTITY_YN',lstr_data.as_data[2] )
					ldw_detail.setitem( ll_row,'VALUE_YN',lstr_data.as_data[3] )							
				end if
			else
				// không có giao dịch mặc định
			end if
		end if
		//-- set cài đặt ghi sổ phụ mặc định cho chứng từ --//
		if rpo_dw.describe( "sob_yn.x") <> "!" and idb_trans_id > 0 then
			rpo_dw.setitem(vl_currentrow,'sob_yn', lstr_data.as_data[4])
		end if
	else
		select TRANS_DESC,QUANTITY_YN,VALUE_YN into :ls_trans_desc,:ls_QUANTITY_YN,:ls_VALUE_YN from trans_setup_hdr where id = :idb_trans_id using it_transaction ;
		if it_transaction.sqlcode = 0 then
			laa_data[1] = idb_trans_id
			this.f_init_object_table(ids_trans_setup, 'd_trans_setup_grid', 'object_ref_id',laa_data[],laa_retrieve[], it_transaction)
			rpo_dw.setitem(vl_currentrow,'trans_hdr_id',idb_trans_id)
			rpo_dw.setitem(vl_currentrow,'trans_desc',ls_trans_desc)
			if ls_update_table = 'BOOKED_SLIP' then
				ldw_detail.setitem( ll_row,'QUANTITY_YN',ls_QUANTITY_YN)
				ldw_detail.setitem( ll_row,'VALUE_YN',ls_VALUE_YN)
			end if
		else
//			messagebox('Lỗi','b_doc.e_dw_e_postinsertrow(line:44)')
		end if
	end if
	
elseif mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_tax_line' then
	if vl_currentrow = 1 then
		ll_line_no = 1
	else
		ll_line_no = vl_currentrow
		for ll_idx = vl_currentrow + 1 to rpo_dw.rowcount()
			rpo_dw.setitem(ll_idx,'line_no',ll_idx)
		next
	end if
end if 

return vl_currentrow
end event

event e_window_e_postopen_child;call super::e_window_e_postopen_child;s_object_display			lc_obj_parent,	lc_obj_handling
window						lw_parent
s_str_dwo_related			lstr_dwo_related[],lstr_dwo_related_tmp[]
t_dw_mpl						ldw_match, ldw_main
c_dwservice					lc_dwservice
string							ls_where, ls_where_trans, ls_colname,ls_coltype, ls_join
string							ls_currentSQL, ls_currentWhere,ls_join_cancelled,ls_modify,ls_rtn,ls_trans_id
int								li_cnt, li_rtn			
any							laa_data[]

//-- add where matching nếu copy from --//
if ib_copying then
	lw_parent = iw_display.dynamic f_getparentwindow()
	if isvalid(lw_parent) then //-- là window con --//
		lc_obj_parent = lw_parent.dynamic f_get_obj_handling()
		lc_obj_handling=iw_display.dynamic f_get_obj_handling()
		if 	lc_obj_parent.classname( )=lc_obj_handling.classname( ) then return 0 //dùng trong trường hợp nhân bản
		li_cnt = this.f_get_data_related( lc_obj_parent.classname( ) , lstr_dwo_related_tmp[])
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
			ldw_match = this.iw_display.dynamic f_get_dw( lstr_dwo_related[1].s_match_f_dwo[1])
			if not isvalid(ldw_match) or ldw_match.dataobject = '' then
				//--Lỗi khai báo str copy bị sai tên dw
				messagebox('Lỗi','b_doc.e_window_e_postopen_child(line:20)')
				return -1
			end if
			li_rtn = lc_dwservice.f_buildwhere_4_copy(lstr_dwo_related[1] , ldw_match,ls_join, ls_where)
			if li_rtn = -1 then return -1
			
			ldw_main = iw_display.dynamic f_get_dwmain()
			ldw_main.is_join_match = ls_join
			/* xu ly loc phieu theo giao dich*/
			ls_trans_id=lc_obj_handling.dynamic f_get_trans_id_4copy()
			if ls_trans_id <> '' then
				ls_colname='trans_hdr_id'
				lc_dwservice.f_get_build_column( ldw_main, ls_colname,ls_coltype)
				ls_where_trans=ls_colname+' in('+ls_trans_id+')'
				ldw_main.f_add_where(ls_where_trans, 'AND') //add where loc giao dich
			end if 
			/*** đóng lại bởi Long ngày 16/10/2015***********
					lý do: khi build where copy nếu gắn điều kiện where này vào sẽ làm câu select chạy rất chậm
			//--xỷ lý các phiếu Hủy--//
			laa_data[1] = '<>cancelled'
			ldw_main.f_add_where( 'status', laa_data)
			ldw_main.f_add_where(ls_where, 'AND')
			*******************************************/
			
			//--xỷ lý các phiếu Hủy--//
			ldw_main.f_getcurrentSQL( ls_currentSQL, ls_currentWhere)
			ls_currentWhere += ' AND '+ldw_main.describe( "datawindow.table.update")+".status <> ~~'cancelled~~' AND "+ ls_where
			ls_modify = "Datawindow.Table.Select= '" + ls_currentSQL + ' WHERE '+ ls_currentWhere +"'"
			ls_rtn =ldw_main.modify(ls_modify )
		else
			gf_messagebox('m.b_doc.e_window_postopen_child.01','Thông báo','Cấu trúc related dwo không có đúng 1 đối tượng liên quan: b_doc.e_window_postopen_child.01, line12','exclamation','ok',1)
			return -1
		end if
	end if
end if
return 0
end event

event e_dw_updatestart;call super::e_dw_updatestart;/*s_str_dwo_related		lstr_related[]

double		ldb_t_ref_id,ldb_item_id
string			ls_coltype,ls_line_text
long			ll_find,ll_retrieve
any			laa_data[]
int 			li_idx,li_rtn,li_count,li_idx1
t_ds_db		lds_matching
t_dw_mpl	ldw_main



if rdw_requester.dynamic f_get_ib_detail( ) then
	li_count = this.f_get_dwo_related( lstr_related)
	for li_idx = 1 to li_count
		if lstr_related[li_idx].b_t_matching then 
			for li_idx1 = 1 to upperbound(lstr_related[li_idx].s_match_t_dwo)
				if lstr_related[li_idx].s_match_t_dwo[li_idx1] <> rdw_requester.dataobject then 
					li_rtn = 0
				else
					li_rtn = 1
					exit
				end if
			next
		end if
		if li_rtn = 1 then exit
	next
end if
if li_rtn = 0 then return 0
ldw_main = iw_display.f_get_dwmain( )
laa_data[1] = ldw_main.getitemnumber( ldw_main.getrow( ) , 'ID')
lds_matching = create t_ds_db
lds_matching.dataobject = 'ds_matching'
lds_matching.f_add_where( "t_doc_id", laa_data)
lds_matching.f_settransobject( SQLCA)
ll_retrieve = lds_matching.retrieve( )
if ll_retrieve > 0 or ids_matching.rowcount( ) > 0 then 
	for li_idx = 1 to rdw_requester.rowcount()
		ldb_t_ref_id = rdw_requester.getitemnumber(li_idx,'ID')
		ls_line_text = rdw_requester.getitemstring(li_idx,'line_text')
		ls_coltype = rdw_requester.describe("item_id.coltype")
		if ls_coltype = '?' or ls_coltype = '!' then
			ldb_item_id = rdw_requester.getitemnumber(li_idx,'object_id')
		else
			ldb_item_id = rdw_requester.getitemnumber(li_idx,'item_id')
		end if
		ll_find = lds_matching.find( "t_ref_id = "+string(ldb_t_ref_id), 1, lds_matching.rowcount())
		if ll_find = 0 then
			if ids_matching.rowcount( ) > 0 then
				ll_find = ids_matching.find( "t_ref_id = "+string(ldb_t_ref_id), 1, ids_matching.rowcount())
				if ll_find = 0 then
					Select count(object.ID) into :li_count
					From object
					Where object.id = :ldb_item_id and object.object_ref_table = 'ITEM' Using SQLCA;
					if SQLCA.sqlcode = 0 then
						if li_count > 0 then
							gf_messagebox('m.b_doc.e_dw_e_updatestart.01','Thông báo','Không lưu được vì mặt hàng "'+ls_line_text+'" không được kết ' ,'exclamation','ok',1)
							destroy lds_matching
							return -1
						end if
					end if
				end if
			end if
		end if
	next
end if
destroy lds_matching*/
return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;double   			ldc_amount,ldc_exc,ldc_tax,ldc_price,ldc_qty,ldc_amount_ex
string   				ls_include_tax_yn, ls_qty_yn, ls_value_yn, ls_ref_table,ls_update_table
double				ldb_trans_id
long 					ll_find
int 					li_count,li_idx
t_dw_mpl       		ldw_tmp,ldw_master,ladw_detail[]
u_trans_setup		lu_trans_setup

if AncestorReturnValue = 1 then return 1
if isnull(vs_editdata) then vs_editdata =''

if pos(rpo_dw.dataobject,'d_tax_line') > 0 then
	if vs_colname = 'tax_pct' then
		ldw_tmp = rpo_dw.dynamic f_get_idw_master()
		ll_find = ldw_tmp.find( 'ID = '+string(rpo_dw.getitemnumber(vl_currentrow,'object_ref_id')), 1, ldw_tmp.rowcount( ) )
		ldc_amount = ldw_tmp.getitemnumber(ll_find,'amount')
		ldc_amount_ex = ldw_tmp.getitemnumber(ll_find,'amount_ex_tax')
		ldc_price = ldw_tmp.getitemnumber(ll_find,'price')
		ldc_qty = ldw_tmp.getitemnumber(ll_find,'qty')
		
		ldw_master = ldw_tmp.dynamic f_get_idw_master()
		ls_include_tax_yn = ldw_master.getitemstring(ldw_master.getrow( ) ,'include_tax_yn')
		ldc_exc = ldw_master.getitemnumber(ldw_master.getrow( ),'exchange_rate')

		ldc_tax = this.f_calculation_tax( ldc_amount,ldc_amount_ex,ldc_price,ldc_qty, ldc_exc, dec(vs_editdata), ls_include_tax_yn)
		rpo_dw.setitem(vl_currentrow,'tax_amt', ldc_tax)
		rpo_dw.setitem(vl_currentrow,'tax_correction', ldc_tax)	
	end if
elseif pos(rpo_dw.dataobject,'d_document') > 0 then
	if vs_colname = 'trans_desc' then
		ldb_trans_id = rpo_dw.getitemnumber(vl_currentrow,'trans_hdr_id')
		if isnull(ldb_trans_id) then ldb_trans_id = 0
		if ldb_trans_id > 0  then
			li_count = rpo_dw.dynamic f_getdwdetails( ladw_detail)
			if li_count = 1 then
				if ladw_detail[li_count].f_get_ib_relation_1_1() then
					ls_update_table = upper(ladw_detail[li_count].describe( "DataWindow.Table.UpdateTable"))
//					if ls_update_table = 'BOOKED_SLIP' or ls_update_table = 'ORDERS' then
//						li_count = ladw_detail[li_count].f_getdwdetails( ladw_detail)
//						for li_idx = 1 to li_count
//							if ladw_detail[li_idx].rowcount( ) > 0 then
//								gf_messagebox('m.b_doc.e_dw_e_itemchanged.01','Thông báo','Không được thay đổi giao dịch khi chưa xóa hết chi tiết mặt hàng ','exclamation','ok',1)
//								return 1
//							else
//								if li_idx = li_count then
//									li_count = rpo_dw.dynamic f_getdwdetails( ladw_detail)
//									exit
//								end if
//							end if
//						next
//					end if
					if  ls_update_table = 'BOOKED_SLIP' then
						lu_trans_setup= create u_trans_setup
						lu_trans_setup.f_get_qty_and_value_yn(ldb_trans_id, ls_qty_yn, ls_value_yn)
						ladw_detail[li_count].setitem(ladw_detail[li_count].getrow(), 'quantity_yn',ls_qty_yn)
						ladw_detail[li_count].setitem(ladw_detail[li_count].getrow(), 'value_yn',ls_value_yn)
						destroy u_trans_setup
					end if
				end if
			end if
		end if
	end if
end if

return AncestorReturnValue


end event

event e_window_e_copy_form;call super::e_window_e_copy_form;double				ldb_trans_id
c_string				lc_string
u_choose_trans	lpo_choose_trans


lpo_choose_trans = create u_choose_trans
lpo_choose_trans.is_object_type = lc_string.f_globalreplace( this.classname( ) , 'u_', '')
openwithparm( s_wr_multi, lpo_choose_trans)
// lấy trans_id trả về
ldb_trans_id = message.doubleparm
if ldb_trans_id > 0 then
	setnull(message.doubleparm)
	this.f_set_idb_trans_id( ldb_trans_id)
	return 1
else
	return 0
end if
end event

event e_window_e_copy_to;//--override--//

double				ldb_trans_id
c_string				lc_string
u_choose_trans	lpo_choose_trans


lpo_choose_trans = create u_choose_trans
lpo_choose_trans.is_object_type = lc_string.f_globalreplace( this.classname( ) , 'u_', '')
openwithparm( s_wr_multi, lpo_choose_trans)
// lấy trans_id trả về
ldb_trans_id = message.doubleparm
if ldb_trans_id > 0 then
	setnull(message.doubleparm)	
	this.f_set_idb_trans_id( ldb_trans_id)
	return 1
end if
return 0
end event

event e_window_e_postopen;call super::e_window_e_postopen;//this.iw_display.event e_filteron_new( )
this.iw_display.dynamic event e_filteron_rb( )
return 0
end event

event e_dw_clicked;call super::e_dw_clicked;//
//string		ls_selected
//c_string	lc_string
//
//if vs_colname = 'view_all' then
//	ls_selected = rdw_handling.getitemstring(rdw_handling.rowcount(),vs_colname)
//	if ls_selected = '' or isnull(ls_selected) or ls_selected = 'N' then
//		is_filter_view_all = rdw_handling.describe("DataWindow.Table.Filter")
//		is_filter_view_all = lc_string.f_globalreplace( is_filter_view_all, "~~'", "'")
//		rdw_handling.setfilter("")
//		rdw_handling.filter()
//		rdw_handling.setitem(rdw_handling.rowcount(),'view_all','Y')
//	elseif ls_selected = 'Y' then
//		rdw_handling.setfilter(is_filter_view_all)
//		rdw_handling.filter()
//		is_filter_view_all = ''
//		rdw_handling.setitem(rdw_handling.rowcount(),'view_all','N')
//	end if
//end if
return 0
end event

event destructor;call super::destructor;if isvalid(ids_matching) then destroy ids_matching
if isvalid(ids_trans_setup) then destroy ids_trans_setup
if isvalid(ids_tax_authority) then destroy ids_tax_authority
if isvalid(ids_currency) then destroy ids_currency
end event

event constructor;call super::constructor;ids_matching = create t_ds_db
ids_trans_setup = create t_ds_db
ids_tax_authority = create t_ds_db
ids_currency = create t_ds_db

this.f_set_ds_4_posting( )
end event

event e_window_e_cancel;call super::e_window_e_cancel;s_str_dwo_related	lastr_related[]
t_ds_db  				lds_matching
t_dw_mpl				ldw_main, ldw_line
b_obj_instantiate		lbo_ins
string 					ls_doc_cde,ls_dataobject_line, ls_f_doctype
any						la_data[]
long						ll_rtn
int 						li_idx
double					ldb_doc_id

ldw_main=iw_display.f_get_dwmain( )
ldb_doc_id = ldw_main.getitemnumber( ldw_main.getrow(),'id')
If this.classname( ) = 'u_goods_receipt' then
	lbo_ins.f_upd_related_status_del(ldb_doc_id ,'cancelled', 'inventory_line', ldb_doc_id, 0, it_transaction )
elseif this.classname( ) = 'u_goods_delivery' then
	lbo_ins.f_upd_related_status_del(ldb_doc_id ,'cancelled', 'inventory_line', ldb_doc_id, 0, it_transaction )
elseif this.classname( ) = 'u_pur_invoice' then
	lbo_ins.f_upd_related_status_del(ldb_doc_id ,'cancelled', 'pur_invoice_line', ldb_doc_id, 0, it_transaction )
elseif this.classname( ) = 'u_sal_invoice' then
	lbo_ins.f_upd_related_status_del(ldb_doc_id ,'cancelled', 'sal_invoice_line', ldb_doc_id, 0, it_transaction )
elseif this.classname( ) = 'u_payment' then
	lbo_ins.f_upd_related_status_del(ldb_doc_id ,'cancelled', 'payment_line', ldb_doc_id, 0, it_transaction )
elseif this.classname( ) = 'u_receipt' then
	lbo_ins.f_upd_related_status_del(ldb_doc_id ,'cancelled', 'payment_line', ldb_doc_id, 0, it_transaction )
elseif this.classname( ) = 'u_bank_voucher' then
	lbo_ins.f_upd_related_status_del(ldb_doc_id ,'cancelled', 'payment_line', ldb_doc_id, 0, it_transaction )
elseif this.classname( ) = 'u_bank_voucher_payment' then	
	lbo_ins.f_upd_related_status_del(ldb_doc_id ,'cancelled', 'payment_line', ldb_doc_id, 0, it_transaction )
end if
return 1
//la_data[1]=ldw_main.getitemnumber( ldw_main.getrow(),'id')
//lds_matching = create t_ds_db
//lds_matching.dataobject='ds_matching'
//lds_matching.f_add_where('t_doc_id' , la_data[])
//lds_matching.settransobject( it_transaction )
//ll_rtn=lds_matching.retrieve( )
//if ll_rtn =0 then
//	destroy lds_matching
//	return 1
//else
//	ll_rtn=this.f_delete_matching( ldw_main, ldw_main.getrow())
//	destroy lds_matching
//	return ll_rtn
//end if

end event

event e_dw_e_preinsertrow;call super::e_dw_e_preinsertrow;/*
s_str_dwo_related		lstr_related[]

t_dw_mpl	ldw_main
boolean		lb_check = false
double		ldb_doc_id,ldb_f_doc_id
string			ls_t_doc_code,ls_f_doc_code
int				li_count,li_idx,li_idx1

if not this.ib_copying then
	if rpo_dw.dynamic f_get_ib_detail( ) then
		li_count = this.f_get_dwo_related( lstr_related)
		for li_idx = 1 to li_count
			if lstr_related[li_idx].b_t_matching then 
				for li_idx1 = 1 to upperbound(lstr_related[li_idx].s_match_t_dwo)
					if lstr_related[li_idx].s_match_t_dwo[li_idx1] <> rpo_dw.dataobject then 
						continue
					else
						lb_check = true
						exit
					end if
				next
			end if
		next
		if not lb_check then return 0
		ldw_main = iw_display.f_get_dwmain( )
		ldb_doc_id = ldw_main.getitemnumber( ldw_main.getrow(), 'ID')
		ls_t_doc_code = ldw_main.getitemstring( ldw_main.getrow(), 'CODE')
		if ids_matching.rowcount( ) > 0 then 
			ldb_f_doc_id = ids_matching.getitemnumber( ids_matching.rowcount( ), 'f_doc_id')
			SELECT DOCUMENT.CODE INTO :ls_f_doc_code
			FROM DOCUMENT
			WHERE DOCUMENT.ID = :ldb_f_doc_id USING SQLCA;
			if SQLCA.sqlcode <> 0 then
				return -1
			end if
			gf_messagebox('m.b_doc.e_dw_e_preinsertrow.01','Thông báo','Phiếu '+ls_t_doc_code+' đã kết với phiếu '+ls_f_doc_code+' nên không được thêm mới chi tiết ' ,'exclamation','ok',1)
			return -1
		else
			SELECT DOCUMENT.CODE INTO :ls_f_doc_code
			FROM MATCHING JOIN DOCUMENT ON DOCUMENT.ID = MATCHING.F_DOC_ID
			WHERE MATCHING.T_DOC_ID = :ldb_doc_id  USING SQLCA;
			if SQLCA.sqlcode = 0 then
				gf_messagebox('m.b_doc.e_dw_e_preinsertrow.01','Thông báo','Phiếu '+ls_t_doc_code+' đã kết với phiếu '+ls_f_doc_code+' nên không được thêm mới chi tiết ' ,'exclamation','ok',1)
				return -1
			elseif SQLCA.sqlcode = 100 then
				return 0
			else
				return -1
			end if
		end if
	end if
end if
*/
return 0
end event

event e_dw_e_beforeitemchanged;call super::e_dw_e_beforeitemchanged;double				ldb_trans_id
string   				ls_update_table
int 					li_count,li_idx
t_dw_mpl       		ladw_detail[]

if AncestorReturnValue = 1 then return 1
if isnull(vs_editdata) then vs_editdata =''

if pos(rpo_dw.dataobject,'d_document') > 0 then
	if vs_colname = 'trans_desc' then
		ldb_trans_id = rpo_dw.getitemnumber(vl_currentrow,'trans_hdr_id')
		if isnull(ldb_trans_id) then ldb_trans_id = 0
		if ldb_trans_id > 0  then
			li_count = rpo_dw.dynamic f_getdwdetails( ladw_detail)
			if li_count = 1 then
				if ladw_detail[li_count].f_get_ib_relation_1_1() then
					ls_update_table = upper(ladw_detail[li_count].describe( "DataWindow.Table.UpdateTable"))
					if ls_update_table = 'BOOKED_SLIP' or ls_update_table = 'ORDERS' then
						li_count = ladw_detail[li_count].f_getdwdetails( ladw_detail)
						for li_idx = 1 to li_count
							if ladw_detail[li_idx].rowcount( ) > 0 then
								rpo_dw.settext(rpo_dw.getitemstring( rpo_dw.getrow(), vs_colname))
								gf_messagebox('m.b_doc.e_dw_e_itemchanged.01','Thông báo','Không được thay đổi giao dịch khi chưa xóa hết chi tiết mặt hàng ','exclamation','ok',1)
								return 1
							else
								if li_idx = li_count then
									li_count = rpo_dw.dynamic f_getdwdetails( ladw_detail)
									exit
								end if
							end if
						next
					end if
				end if
			end if
		end if
	end if
end if
return AncestorReturnValue
end event

event e_statuschanged;call super::e_statuschanged;/**********************************************************
Chức năng: Thay đổi status của chứng từ khi ghi sổ hoặc sữa ghi sổ.
				Gọi hàm cập nhật status của các chứng từ liên quan
--------------------------------------------------------------------------------
Tham số: vs_new_status: trãng thái mới của chứng từ.
---------------------------------------------------------------------------------
return : 1 thành công
		   -1 lỗi
=============================================TrevietSoftware.com*/
string					ls_where,ls_doc_id_updated
double				ldb_dr_cr_object
t_transaction		lt_transaction
t_ds_db				lds_related_doc

this.iw_display.f_get_transaction(lt_transaction )


//-- Gọi hàm cập nhật chứng từ liên quan --//
if this.f_update_related_status( vdb_doc_id, vs_doctype, vs_post_status, vb_post,ls_doc_id_updated) = -1 then
	rollback using lt_transaction;
	return -1
end if

return 1
end event

event e_statuschanged_multi;call super::e_statuschanged_multi;/**********************************************************
Chức năng: Thay đổi status của chứng từ khi ghi sổ hoặc sữa ghi sổ.
				Gọi hàm cập nhật status của các chứng từ liên quan
--------------------------------------------------------------------------------
Tham số: vs_new_status: trãng thái mới của chứng từ.
---------------------------------------------------------------------------------
return : 1 thành công
		   -1 lỗi
=============================================TrevietSoftware.com*/
string					ls_where,ls_doc_id_updated
double				ldb_dr_cr_object

t_ds_db				lds_related_doc


//-- Gọi hàm cập nhật chứng từ liên quan --//
if this.f_update_related_status_multi( vdb_doc_id, vs_doctype, vs_post_status, vb_post,ls_doc_id_updated, rt_transaction) = -1 then
	rollback using rt_transaction;
	return -1
end if

return 1
end event

event e_dw_updateend;call super::e_dw_updateend;idb_previous_exrate = 0
idb_previous_uom = 0

return ancestorreturnvalue
end event

