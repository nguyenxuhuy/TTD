$PBExportHeader$b_obj_instantiate.sru
forward
global type b_obj_instantiate from s_object_instantiate
end type
end forward

global type b_obj_instantiate from s_object_instantiate
event e_send_2_approve ( datawindow vdw_focus,  s_object_display vc_obj_handling,  s_w_multi vw_multi )
event e_approve ( datawindow vdw_focus,  s_object_display vc_obj_handling,  s_w_multi vw_multi )
event e_rb_clicked ( radiobutton vrb_handling,  s_object_display vod_handling )
end type

type variables

end variables

forward prototypes
public function integer f_get_overdue_invoice (double vdb_object_id, ref string vs_invoice_no[], ref date vd_invoice_date[], ref date vd_due_date[], ref double vdb_invoice_amt[])
public function integer f_get_cust_overdue_invoice (double vdb_object_id, date vd_trans_date, ref string rs_invoice_no[], ref date rd_invoice_date[], ref date rd_due_date[])
public function integer f_update_ex_tax (double vdb_curr_id, double vdb_exrate, string vs_include_tax_yn, ref t_dw_mpl rdw_update, long vl_row, string vs_event_colnames, string vs_event_act_colnames, string vs_changed_colname, double vdb_change_val)
public function integer f_update_ex_tax (double vdb_curr_id, double vdb_exrate, string vs_include_tax_yn, t_dw_mpl rdw_update, long vl_row, string vs_event_colnames, string vs_changed_colname, double vdb_change_val)
public function integer f_get_stock_uom (string vs_item_code, ref double rdb_stock_uom, ref string rs_uom_code)
public function integer f_get_stock_uom (double vdb_item_id, ref double rdb_stock_uom, ref string rs_uom_code)
public function integer f_update_tax (double vdb_curr_id, double vdb_exrate, t_dw_mpl rdw_master, long vl_row_master, t_dw_mpl rdw_tax_line, long vl_row_tax_line, double vdb_object_ref_id, string vs_changed_colname, integer vi_tax_pct)
public function string f_get_staff_dept_code (double vdb_object_id, string vs_type)
public function integer f_get_item_wholesales_price (double vdb_item_id, double vdb_item_manage_group, string vs_item_applied_type, double vdb_object_id, double vdb_object_manage_group, string vs_object_applied_type, double vdb_object_staff, double vdb_staff_manage_group, string vs_staff_applied_type, string vs_price_type, ref double rdb_wholesales_price)
public function string f_get_trans_setup_sob (string vs_doc_type, double vdb_trans_hdr_id)
public function long f_get_ds_settled_revenue_period (ref t_ds_db rds_settled_revenue_period, date vd_fdate, date vd_tdate)
public function long f_get_ds_sales_revenue_period (ref t_ds_db rds_settled_revenue_period, date vd_fdate, date vd_tdate)
public function integer f_get_salesperson_comm (double vdb_staff_id, double vdb_dept_id, ref t_ds_db rds_sales_revenue_period, ref t_ds_db rds_settled_revenue_period, ref t_ds_db rds_objsales_objcomm, ref t_ds_db rds_comm_rate, ref double rdb_comm[])
public function integer f_get_salesperson_outstanding_comm (double vdb_staff_id, ref t_ds_db rds_comm_line, ref double rdb_outstanding_sales, ref double rdb_outstanding_comm)
public function integer f_get_object_and_subaccount (string vs_dw_object, string vs_object_col, t_dw_mpl vdw_get_amount, long vl_get_amount_row, ref double rdb_object_id, ref double rdb_subaccount)
public function integer f_get_support_person_comm (double vdb_staff_id, double vdb_dept_id, ref t_ds_db rds_sales_revenue_period, ref t_ds_db rds_settled_revenue_period, ref t_ds_db rds_objsales_objcomm, ref t_dw_mpl rdw_comm_line, ref t_ds_db rds_comm_rate, ref double rdb_comm[])
public function integer f_caculation_disc (double vdb_sales_price, ref double rdb_discount_amount, ref integer ri_discount_pct, ref double rdb_discount_price)
public function integer f_caculation_disc (double vdb_sales_price, ref double rdb_discount_amount, ref integer ri_discount_pct, ref double rdb_discount_price, boolean vb_increase_price, double vdb_round_id, t_dw_mpl vdw_transaction)
public function boolean f_check_base_currency (double vdb_currency_id)
public function boolean f_check_base_currency (string vs_currency_code)
public function integer f_get_applied_object_price (double vdb_item_id, double vdb_qty, ref double rdb_object_id, date vd_trans_date, string vs_dwo_price, string vs_object_type, string vs_price_type)
public function integer f_get_wholesales_price (double vdb_item_id, double vdb_qty, double vdb_currency_id, string vs_dwo_price, string vs_price_type, date vd_trans_date, double vdb_object_id, double vdb_sales_person, ref double rdb_wholesales_price)
public function double f_get_cust_balance (double vdb_cust_id, double vdb_curr_id, date vd_date)
public function integer f_get_link_item (double vdb_item_id, double vdb_spec_id, ref double vadb_lnk_item[], ref double vadb_lnk_spec[], ref double vadb_lnk_qty[], ref t_transaction rt_transaction)
public function integer f_get_link_item (double vdb_item_id, ref double vadb_lnk_item[], ref double vadb_lnk_spec[], ref double vadb_lnk_qty[], ref t_transaction rt_transaction)
public function long f_get_bonus_point (string vs_objtype, double vdb_object_id, readonly string vs_doctype, double vb_amount)
public function double f_convert_loyalty_point2amount (string vs_objtype, double vdb_object_id, readonly string vs_doctype, long vl_point)
public function long f_get_balance_point (string vs_objtype, double vdb_object_id)
public function boolean f_isvalid_date_range_itemchanged (t_dw_mpl vdw_handle, long vl_row, string vs_editdata, string vs_editcolname, string vs_fdate_colname, string vs_tdate_colname)
public function boolean f_isvalid_date_range_updatestart (t_dw_mpl vdw_handle, string vs_fdate_colname, string vs_tdate_colname)
public function integer f_get_cus_info (long vl_acctno, ref double rdb_cus_id, ref string rs_cus_name, ref double rdb_payment_method, ref string rs_payment_method_name, ref double rdb_currency_id, ref string rs_currency_code, ref string rs_cardnumber, ref string rs_rt_tel_no, ref string rs_address, ref double rdb_credit_limit)
public function integer f_get_retail_price_dev (double vdb_item_id, double vdb_qty, double vdb_currency_id, string vs_dwo_price, string vs_price_type, date vd_trans_date, double vdb_object_id, double vdb_sales_person, ref double rdb_retail_price, ref double rdb_disc_pct)
public function integer f_get_retail_price (double vdb_item_id, double vdb_qty, double vdb_currency_id, string vs_dwo_price, string vs_price_type, date vd_trans_date, double vdb_object_id, double vdb_sales_person, ref double rdb_retail_price, ref double rdb_disc_pct)
public function boolean f_isvalid_qty_range_itemchanged (t_dw_mpl vdw_handle, long vl_row, string vs_editdata, string vs_editcolname, string vs_fqty_colname, string vs_tqty_colname)
public function boolean f_isvalid_qty_range_updatestart (t_dw_mpl vdw_handle, string vs_fqty_colname, string vs_tqty_colname)
public function double f_get_bom_line (double vdb_bom_id, double vdb_qty, date vd_trans_date)
public function double f_get_bom_product (double vdb_bom_id)
public function double f_get_bom_version_id (double vdb_bom_id)
public function string f_get_bom_type (double vdb_bom_id)
public function boolean f_is_period_closed (string vs_stop_type, date vd_trans_date, string vs_period_type)
public function integer f_get_period_first_last_date (date v_trans_date, ref date rd_firstdate, ref date rd_lastdate, string vs_priod_type)
public function double f_get_doc_id (double vdb_detail_id, string vs_detail_table)
public function integer f_stop_period (date vd_sdate, date vd_edate, string vs_period_type, string vs_stop_type)
public function integer f_get_period_info (date vd_sdate, date vd_edate, string vs_period_type, ref double rdb_id[], ref date rd_firstdate[], ref date rd_lastdate[])
public function integer f_open_period (date vd_sdate, date vd_edate, string vs_period_type, string vs_stop_type)
public function boolean f_exists_transaction (double vdb_object_id)
public function integer f_get_cus_info (double vdb_f_branch_id, double vdb_t_branch_id, double vdb_company_id, ref any raa_info[])
public function double f_calculation_tax (double vdb_amount, integer vi_tax_pct, double vdb_exc_rate, string vs_include_tax_yn, t_dw_mpl vdw_handled)
public function double f_calculation_tax (double vdb_amount, integer vi_tax_pct, double vdb_exc_rate, string vs_include_tax_yn)
public function integer f_update_tax (double vdb_curr_id, double vdb_exc_rate, t_dw_mpl vdw_master, long vl_row_master, t_dw_mpl vdw_tax_line, long vl_row_tax_line, integer vi_tax_pct, double vdb_amt_ex_tax, double vdb_base_amt_ex_tax, string vs_include_tax_yn, double vdb_amount)
public function integer f_update_tax_all (double vdb_curr_id, double vdb_exc_rate, t_dw_mpl vdw_master, t_dw_mpl vdw_tax_line, string vs_col_amt_ex_tax, string vs_col_base_amt_ex_tax, string vs_include_tax_yn, string vs_col_amt)
public function integer f_update_amt_ex_markup_comm_disc (double vdb_curr_id, double vdb_exc_rate, t_dw_mpl vdw_line, t_dw_mpl vdw_tax_line, string vs_include_tax_yn)
public function boolean f_is_matched (s_object_display vod_handling, string vs_colname, t_dw_mpl vdw_handling, string vs_origin_data, string vs_new_data)
public function integer f_open_drilldown_rpt (string vs_object_name, any va_click_data, s_str_dwo_related vstr_dwo_related, long vl_cur_row)
public function integer f_update_round_diff (double vdb_item_id, double vdb_round_diff, ref t_transaction rt_transaction)
public function double f_get_round_diff (double vdb_item_id)
public function integer f_update_moving_avg (double vdb_item_id, double vdb_moving_avg, ref t_transaction rt_transaction)
public function double f_get_moving_avg (double vdb_item_id)
public function integer f_get_qty_and_value_yn (double vdb_trans_hdr_id, ref string rs_qty, ref string rs_value)
public function string f_get_trans_setup_visible (string ls_doc_type, double vdb_trans_hdr_id)
public function string f_get_post_message_yn (string ls_doc_type, double vdb_trans_hdr_id)
public function integer f_load_excelfile (ref oleobject role_excel, string vs_patch)
public function integer f_get_ds_barcode (string vs_file_type, string vs_patch, string vs_file_name, string vs_colnumber, ref t_ds_db rds_barcode)
public function integer f_load_excel2datastore (oleobject vole_excel, ref t_ds_db rds_barcode, long vl_startrow, long vl_endcol)
public subroutine f_caculation_ex_tax (double vdc_qty, double vdc_price, double vdc_act_price, integer vi_tax_percent, string vs_include_tax_yn, double vdc_exc, double vdb_currency_id, ref double rdc_price_ex, ref double rdc_act_price_ex, ref double rdc_amt_ex, ref double rdc_act_amt_ex, ref double rdc_base_amt_ex, ref double rdc_act_base_amt_ex, t_dw_mpl vdw_handling, double vdb_base_price)
public function boolean f_is_managed_qty (double vdb_item_id)
public function integer f_load_worksheet2datastore (oleobject vole_worksheet, ref t_ds_db rds_interface, long vl_startrow, long vl_startcolumn, long vl_colnumber)
public function string f_get_path_pic (string vs_obj_type, string vs_obj_ref_name, string vs_pic_name)
public function integer f_get_object_sales_info (double vdb_object_id, string vs_object_code, ref any raa_info[])
public function integer f_get_item_info (double vdb_item_id, string vs_item_code, ref any raa_info[])
public function double f_get_posting_group (double vdb_object_id)
public function integer f_load_excelfile (oleobject role_excel, boolean vb_open_dir, string vs_path_name)
public function integer f_get_lot_or_serial_yn (double vdb_item_id, ref string rs_lot_yn, ref string rs_serial_yn)
public function string f_get_warehouse_negative (double vdb_id)
public function string f_get_object_code (double vdb_id)
public function boolean f_is_objects (string vs_object_code, string vs_object_type)
public function integer f_update_tax (double vdb_curr_id, double vdb_exrate, t_dw_mpl rdw_master, long vl_row_master, t_dw_mpl rdw_tax_line, long vl_row_tax_line, double vdb_object_ref_id, string vs_changed_colname, integer vi_tax_pct, string vs_filter_org)
public function integer f_update_pic (string vs_pic_ref_table, string vs_pic_ref_field, string vs_pic_ref_colname, blob vblb_picture, long vl_row, ref datawindow rdw_handling)
public function boolean f_is_managed_value (double vdb_item_id)
public subroutine f_get_data_copied (ref t_ds_db rads_copied[], ref s_str_dwo_related rstr_dwo_related[], t_ds_db vads_handling[], string vs_type_copy, string vs_obj_related)
public function integer f_calculator_sal_invoice (string vs_colname, string vs_editdata, long vl_currentrow, any vaa_data[], ref datawindow rdw_handling)
public function integer f_calculation_disc (double vdb_price, integer vi_discount_pct, ref double rdb_discounted_prices, string vs_price_type)
public function double f_get_objects_id (string vs_code, ref double radb_id[])
public function string f_get_balance_control (double vdb_id)
public function string f_get_object_control_yn (double vdb_id)
public function integer f_get_ds_import (string vs_file_type, string vs_patch, string vs_file_name, string vs_colnumber, ref t_ds_db rds_import)
public function string f_get_autonumber (t_dw_mpl vdw_handle, string vs_colname, ref t_ds_db rds_insert, long vl_row, s_object_display vs_obj_display)
public function integer f_get_employ_info (string vs_employ_code, ref string ras_infor[])
public function string f_get_filterstring (t_dw_mpl vdw_filter, string vs_text)
public function boolean f_is_branch_yn (string vs_object)
public function integer f_get_fiscal_period_id (date vd_transdate, string vs_period_type)
public function integer f_get_item_managed_qty_value (double vdb_item, ref string rs_qty_yn, ref string rs_value_yn)
public function double f_get_manage_group (double vdb_object_id)
public function string f_get_uom_code (double vdb_id)
public function integer f_update_hdr_itemchanged (string vs_edit_colname, string vs_editdata, string vs_upd_colname, long vl_line_row, t_dw_mpl vdw_line, t_dw_mpl vdw_currency, t_dw_mpl vdw_tax, double vdb_prevous_exrate)
public function integer f_update_line_itemchanged (string vs_edit_colname, string vs_editdata, string vs_upd_colname, long vl_line_row, t_dw_mpl vdw_line, t_dw_mpl vdw_currency, t_dw_mpl vdw_tax, double vdb_previous_exrate, double vdb_previous_uom)
public function integer f_get_item_price_disc (double vdb_item_id, double vdb_spec_id, double vdb_qty, ref double rdb_currency_id, string vs_dwo_price, string vs_price_type, date vd_trans_date, double vdb_object_id, double vdb_sales_person, ref double rdb_wholesales_price, ref double rdb_disc_amt, ref double rdb_disc_pct)
private function integer f_get_item_price_disc_purchase (double vdb_item_id, double vdb_spec_id, double vdb_qty, ref double rdb_currency_id, string vs_dwo_price, string vs_price_type, date vd_trans_date, double vdb_object_id, double vdb_sales_person, ref double rdb_wholesales_price, ref double rdb_disc_amt, ref double rdb_disc_pct)
public function integer f_get_scrap_pct (double vdb_item_id, double vdb_length, double vdb_width, double vdb_depth, double vdb_bom_id, double rdb_scr_pct)
public function integer f_update_hdr_itemchanged (string vs_edit_colname, string vs_editdata, string vs_upd_colname, long vl_line_row, t_dw_mpl vdw_line, t_dw_mpl vdw_currency, double vdb_prevous_exrate)
public function integer f_update_tax_appeon (double vdb_curr_id, double vdb_exrate, t_dw_mpl rdw_tax_line, double vdb_object_ref_id, double vdb_tax_pct, double vdb_amount_ex_tax, double vdb_base_amount_ex_tax, double vdb_tax_correction)
public function integer f_get_ds_material (double vdb_product_id, ref t_ds_db rds_material)
public function integer f_get_bom_material (double vdb_bom_id, double vdb_route_id, ref t_ds_db rds_material)
public function integer f_get_bom_material (double vdb_bom_line_id, ref t_ds_db rds_material)
public function integer f_update_line_itemchanged (string vs_edit_colname, string vs_editdata, string vs_upd_colname, long vl_line_row, t_dw_mpl vdw_line, t_dw_mpl vdw_currency, double vdb_previous_exrate, double vdb_previous_uom)
public function integer f_calculate_material (double vdb_ref_id, double vdb_bom_id, double vdb_plan_qty, double vdb_act_qty, ref t_ds_db rds_material, string vs_upd_type)
public function integer f_get_valueset (double vdb_up_id, ref double radb_valueset_id[], ref string ras_valueset_code[], ref string ras_valueset_name[], t_transaction vt_transaction)
public function double f_get_object_branch_id (double vdb_object_id)
public function integer f_send_2_approve (t_dw_mpl vdw_focus, s_object_display vc_obj_handling, s_w_multi vw_multi, long ll_find)
public function boolean f_is_managed_spec (double vdb_item_id)
public function integer f_delete_appr_profile (double vdb_doc_id, t_transaction vt_transaction)
public function boolean f_is_user_alert (double vdb_user_id, t_transaction vt_transaction, ref string rs_applicable_alet_id)
public function integer f_send_2_approve (t_dw_mpl vdw_focus, s_object_display vc_obj_handling, s_w_multi vw_multi)
public function integer f_approved (t_dw_mpl vdw_focus, s_object_display vc_obj_handling, s_w_multi vw_multi)
public function integer f_reject (t_dw_mpl vdw_focus, s_object_display vc_obj_handling, s_w_multi vw_multi)
public function string f_get_subaccount_yn (double vdb_id)
public function integer f_get_account_info_yn (double vdb_id, ref string rs_subaccount_req_yn, ref string rs_acct_type)
public function string f_get_filterstring (datawindowchild vdw_filter, string vs_text)
public function string f_get_doc_type (string vs_doc_code)
public function integer f_get_currency_of_bank (double vdb_bank_id, ref double rdb_curr_id)
public function integer f_get_currency_of_bank (double vdb_bank_id, ref string rs_curr_code)
public function double f_get_object_id (string vs_code, string vs_obj_type, double vdb_company_id, double vdb_branch_id)
public function string f_get_doc_type (double vdb_doc_id)
public function integer f_get_sinvoice_json_general (double vdb_document_id, string vs_document_code)
public function integer f_get_object_close_balance (double vdb_object_id, double vdb_curr_id, date vd_trans_date, double vdb_company_id, double vdb_branch_id, string vs_sob, ref double rdb_close_trans_amount, ref double rdb_close_base_amount)
public function integer f_evaluate_exchange (double vdb_doc_id, double vdb_branch_id, double vdb_account_id, double vdb_curr_id, date vd_f_date, date vd_t_date, ref t_dw_mpl rdw_line)
public function integer f_get_json_generalinvoice (double vdb_doc_id, boolean vb_paymentstatus, string vs_type, t_transaction vt_transaction, ref string rs_json_generalinvoice)
public function integer f_get_json_buyerinfo (double vdb_doc_id, t_transaction vt_transaction, ref string rs_json_buyerinfo)
public function integer f_get_json_payments (double vdb_doc_id, t_transaction vt_transaction, ref string rs_json_payments)
public function integer f_get_json_iteminfo (double vdb_doc_id, string vs_type, t_transaction vt_transaction, ref string rs_json_iteminfo)
public function integer f_get_json_summarizeinfo (double vdb_doc_id, string vs_type, t_transaction vt_transaction, ref string rs_json_summarizeinfo)
public function integer f_get_json_taxbreakdowns (double vdb_doc_id, t_transaction vt_transaction, ref string rs_json_taxbreakdowns)
public function integer f_init_sinvoice (double vdb_doc_id, datetime vdt_invoiceissueddate, datetime vdt_invoicesigneddate, boolean vb_paymentstatus, boolean vb_cusgetinvoiceright, string vs_susername, string vs_spassword, t_transaction vt_transaction, string vs_url)
public function integer f_get_json_sellerinfo (double vdb_branch_id, t_transaction vt_transaction, ref string rs_json_sellerinfo)
public function integer f_calculate_utilization_n_product (double vdb_product_spec[], double vdb_mat_spec[], string vs_base, ref double rdb_product_qty, ref double rdb_mat_qty, ref double rdb_scrap_pct)
public function integer f_calculate_utilization_n_product (t_ds_db vds_material, double vdb_mat_spec[], string vs_base, ref double rdb_product_qty, ref double rdb_scrap_pct)
public function integer f_calculate_utilization_n_product (double vdb_product_spec[], double vdb_mat_spec[], string vs_base, double vdb_factor_fg, double vdb_factor_mat, ref double rdb_product_qty, ref double rdb_mat_qty, ref double rdb_scrap_pct)
public function integer f_update_bom_line (string vs_edit_colname, string vs_editdata, string vs_upd_colname, long vl_line_row, t_dw_mpl vdw_line, double vdb_prod_spec[], double vdb_factor_fg)
public function integer f_calculate_utilization_n_product (double vdb_product_spec[], double vdb_mat_spec[], string vs_base, double vdb_factor_fg, double vdb_factor_mat, double vdb_multiplied_mat, ref double rdb_product_qty, ref double rdb_mat_qty, ref double rdb_scrap_pct)
public function integer f_calculate_utilization_n_product (t_ds_db vds_material, double vdb_mat_spec[], string vs_base, double vdb_factor, double vdb_multiplied, ref double rdb_product_qty, ref double rdb_scrap_pct)
public function integer f_importclipboard_dw (ref t_dw_mpl rdw_handle, long vl_start_row, string vs_start_colname)
public function double f_get_last_pur_price (double vdb_item_id)
public function integer f_get_object_code_n_name (double vdb_id, ref string rs_code, ref string rs_name)
public function integer f_join_dwh_search (string vs_dwo, string vs_filtertext, ref string rs_sql)
public function double f_get_flexible_id (string vs_code)
public function integer f_get_struct_id_n_combchar (string vs_code, ref double rdb_id, ref string rs_char)
public function string f_get_filterstring (datawindowchild vdw_filter, string vs_text, string vs_colname)
public function integer f_left_join_dwh_search (string vs_dwo, ref string rs_sql)
public function integer f_join_dwh_search (string vs_filtertext, ref string rs_sql)
public function integer f_add_where_dwh_search (string vs_filtertext, ref string rs_sql)
public function integer f_get_item_code_n_name_spec (double vdb_id, ref string rs_code, ref string rs_name, ref string rs_spec)
public function integer f_get_item_code_n_name_uom (double vdb_id, ref string rs_code, ref string rs_name, ref string rs_unit_code, ref double rdb_unit_id)
public function double f_get_object_id (string vs_code, string vs_obj_type, double vdb_company_id, double vdb_branch_id, ref t_transaction rt_transaction)
public function integer f_get_object_code_n_name (double vdb_id, ref string rs_code, ref string rs_name, ref t_transaction rt_transaction)
public function string f_get_filterstring (datawindow vdw_filter, string vs_text, string vs_colname)
public function integer f_get_object_id_n_name (string vs_code, string vs_obj_type, double vdb_company_id, double vdb_branch_id, ref double rdb_obj_id, ref string rs_obj_name)
public function integer f_get_object_id_name_n_point (string vs_code, string vs_obj_type, double vdb_company_id, double vdb_branch_id, ref double rdb_obj_id, ref string rs_obj_name, ref long rl_point)
public function integer f_upd_cust_point (double vdb_doc_id, date vd_transdate, double vdb_cust_id, double vdb_measurement_id, long vl_used_point, long vl_cust_point, ref t_transaction rt_transaction)
public function integer f_upd_cust_point (t_dw_pos vdw_bill_line, t_dw_pos vdw_doc_hdr, t_ds_db vds_bonus_point, long vl_bal_point, ref t_transaction rt_transaction)
public function integer f_get_object_id_name_n_point (string vs_code, string vs_obj_type, double vdb_company_id, double vdb_branch_id, ref double rdb_obj_id, ref string rs_obj_name, ref long rl_point, ref t_transaction rt_transaction)
public function integer f_upd_bonus_point (t_dw_pos vdw_bill_line, t_dw_pos vdw_doc_hdr, t_ds_db vds_bonus_point, t_ds_db vds_bonus_point_staff, double vdb_staff_id, long vl_bal_point, long vl_bal_point_staff, ref t_transaction rt_transaction)
public function boolean f_is_branch_yn_ex (string vs_object, ref t_transaction rt_transaction)
public function string f_get_branch_name_ex (double vdb_branch_id)
public function string f_get_branch_name (double vdb_branch_id)
public function string f_get_menu_code (double vdb_id, ref t_transaction rt_transaction)
public function integer f_get_item_code_n_name_spec_ex (double vdb_id, ref string rs_code, ref string rs_name, ref string rs_spec, ref t_transaction rt_transaction)
public function integer f_get_stock_uom_ex (double vdb_item_id, ref double rdb_stock_uom, ref string rs_uom_code, ref t_transaction rt_transaction)
public function integer f_get_stock_uom_ex (string vs_item_code, ref double rdb_stock_uom, ref string rs_uom_code, ref t_transaction rt_transaction)
public function integer f_get_object_code_n_name_ex (double vdb_id, ref string rs_code, ref string rs_name, ref t_transaction rt_transaction)
public function integer f_get_item_code_n_name_uom_ex (double vdb_id, ref string rs_code, ref string rs_name, ref string rs_unit_code, ref double rdb_unit_id, ref t_transaction rt_transaction)
public function integer f_update_line_itemchanged_ex (string vs_edit_colname, string vs_editdata, string vs_upd_colname, long vl_line_row, ref t_dw_mpl rdw_line, ref t_transaction rt_transaction, s_str_data vstr_currency)
public function string f_get_object_code_ex (double vdb_id, ref t_transaction rt_transaction)
public function double f_copy_to_po (s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial)
public function integer f_upd_cust_point_ex (double vdb_doc_id, date vd_transdate, double vdb_cust_id, long vl_used_point, long vl_cust_point, ref t_transaction rt_transaction)
public function integer f_upd_bonus_point_ex (t_dw_pos vdw_bill_line, t_dw_pos vdw_doc_hdr, double vdb_cust_id, double vdb_staff_id, long vl_bal_point, long vl_bal_point_staff, ref t_transaction rt_transaction, ref long rl_bill_staff_point, ref long rl_bill_cust_point)
public function integer f_get_object_point (double vdb_obj_id, string vs_obj_type, double vdb_company_id, double vdb_branch_id, ref long rl_point, ref t_transaction rt_transaction)
public function integer f_upd_bonus_point_ex (t_ds_db vds_bill_line, t_ds_db vds_doc_hdr, double vdb_cust_id, double vdb_staff_id, long vl_bal_point, long vl_bal_point_staff, ref t_transaction rt_transaction, ref long rl_bill_staff_point, ref long rl_bill_cust_point)
public function integer f_get_vend_info (double vdb_vend_id, ref double rdb_info[4], ref t_transaction rt_transaction)
public function double f_split_po (s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial)
public function double f_copy_to_pur_invoice (s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial)
public function long f_upd_link_id_fr_web (ref t_transaction rt_transaction)
public function long f_upd_prodnm_fr_web (string vsa_prod_ids[], ref t_transaction rt_transaction)
public function long f_get_nbr_of_bill_in_period (double vdb_cust_id, integer vi_nbr_of_month, date vd_date, string vs_backward_forward, string vs_booked_yn, ref t_transaction rt_transacion)
public function double f_get_bill_amount_in_period (double vdb_cust_id, integer vi_nbr_of_month, date vd_date, string vs_backward_forward, string vs_booked_yn, ref t_transaction rt_transacion)
public function string f_get_doc_code (double vdb_doc_id, ref t_transaction rt_transaction)
public function integer f_importclipboard_dw_ex (ref t_transaction rt_transaction, ref t_dw_mpl rdw_handle, long vl_start_row, string vs_start_colname)
protected function integer f_calc_update_column ()
public function long f_update_line_no (t_dw_mpl rdw_handle)
public function double f_get_user_staff_id (double vdb_user_id, ref t_transaction rt_transaction)
public function integer f_update_hdr_itemchanged_ex (string vs_edit_colname, string vs_editdata, string vs_upd_colname, ref t_ds_db rds_line, ref t_transaction rt_transaction, s_str_data vstr_currency)
public function double f_copy_to_so (s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial)
public function integer f_update_line_itemchanged_ex (string vs_edit_colname, string vs_editdata, string vs_upd_colname, long vl_line_row, ref t_dw_mpl rdw_line, s_str_data vstr_currency)
public function integer f_get_struct_id_n_combchar_ex (string vs_code, ref double rdb_id, ref string rs_char, ref t_transaction rt_transaction)
public function double f_copy_to_goods_delivery (s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial)
public function decimal f_get_match_remain (double vdb_t_ref_id, string vs_t_ref_table, decimal vdc_adj_qty, string vs_f_match_colname, ref t_transaction rt_transaction)
public function double f_copy_to_goods_receipt (s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial)
public function integer f_copy_version (double vdb_doc_id, s_str_ds_4_posting vstr_ds_4_posting, ref t_transaction rt_transaction)
public function integer f_get_qty_and_value_yn_ex (double vdb_trans_hdr_id, ref string rs_qty, ref string rs_value, ref t_transaction rt_transaction)
public function integer f_get_doc_qty_and_value_yn (double vdb_doc_id, ref string rs_qty, ref string rs_value, ref t_transaction rt_transaction)
public function boolean f_is_period_closed_ex (string vs_stop_type, date vd_trans_date, string vs_period_type, ref t_transaction rt_transaction)
public function string f_get_doc_status (double vdb_doc_id, ref t_transaction rt_transaction)
public function string f_get_existed_promotion (double vdb_object_id, ref t_transaction rt_transaction)
public function integer f_get_gift (t_ds_db vds_buy_get_the_same, double vdb_cust_id, double vdb_doc_id, ref s_str_data rstr_data, ref t_transaction rt_transaction)
public function long f_upd_web_price (t_ds_db vds_item)
public function double f_copy_to_inter_so (double vdb_t_branch_id, s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial)
public function double f_copy_to_inter (double vdb_t_branch_id, string vs_objname, s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial)
public function double f_copy_to_so_return (s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial)
public function long f_upd_web_new_item (t_ds_db vds_item, ref t_transaction rt_transaction)
public function decimal f_get_pur_price (double vdb_item_id, double vdb_currency, ref t_transaction rt_transaction)
public function integer f_update_line_itemchanged_ex (string vs_edit_colname, string vs_editdata, string vs_upd_colname, string vs_line_table, double vdb_line_id, ref t_transaction rt_transaction, s_str_data vstr_currency)
public function double f_copy_to (string vs_f_objname, string vs_t_objname, s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial)
public function double f_copy_to_qt (string vs_f_objname, s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial)
public function double f_copy_to_pur_invoice (string vs_f_objname, s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial)
public function double f_copy_to_payment (string vs_f_objname, s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial)
public function integer f_upd_related_status_1_1 (double vdb_t_doc_id, string vs_f_upd_status, t_transaction rt_transaction)
public function integer f_upd_related_status (double vdb_t_doc_id, string vs_t_upd_status, t_transaction rt_transaction)
public function string f_get_doc_type_ex (double vdb_doc_id, ref t_transaction rt_transaction)
public function integer f_upd_related_status (double vdb_t_doc_id, string vs_t_upd_status, string vs_t_ref_table, ref t_transaction rt_transaction)
public function integer f_upd_related_status_del (double vdb_t_doc_id, string vs_t_upd_status, string vs_t_ref_table, double vdb_doc_id, double vdb_t_ref_id, ref t_transaction rt_transaction)
public function double f_copy_to_bank_voucher_payment (string vs_f_objname, s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial)
public function double f_copy_to_sal_invoice (string vs_f_objname, s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial)
public function double f_copy_to_receipt (string vs_f_objname, s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial)
public function double f_copy_to_bank_voucher (string vs_f_objname, s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial)
public function string f_get_branch_code (double vdb_branch_id)
public function double f_get_doc_id (t_dw_mpl vdw_handling, ref t_transaction rt_transaction)
public function boolean f_check_id_exists_table (double vdb_id, string vs_table, ref t_transaction rt_transaction)
public function integer f_get_cust_info (string vs_key, double vdb_cust_id, string vs_col_string, ref jsonpackage rjpk_info, ref t_transaction rt_transaction)
public function integer f_get_cust_info (string vs_key, double vdb_cust_id, string vs_col_string, ref jsonparser rjpsr_info, ref t_transaction rt_transaction)
public function integer f_get_cust_info (double vdb_cust_id, string vs_col_string, ref datastore rds_cust_info, ref t_transaction rt_transaction)
public function integer f_get_cust_info (double vdb_cust_id, string vs_col_string, ref string rsa_values[], ref t_transaction rt_transaction)
end prototypes

event e_send_2_approve(datawindow vdw_focus, s_object_display vc_obj_handling, s_w_multi vw_multi);
int								li_idx,li_row,li_idx1,li_upperbound,li_rtn
any							laa_data[]
long							ll_rtn,ll_currentrow
string							ls_identify_code,ls_type_role_user_id,ls_updatetable,ls_role_user_id,las_role_user_id[]
double						ldb_identify_id,ldb_business_id,ldb_role_user_id,ldb_doc_id
b_rule						lc_rule
c_string						lc_string
t_ds_db						lds_appr_level,lds_appr_profile
t_dw_mpl					ldw_document
t_transaction 				lt_transaction
c_appr_profile				lc_appr
c_identification_initial		lc_iden_ini

//if gi_userid = 0 then return
vw_multi.f_get_transaction( lt_transaction)
ldw_document = vw_multi.f_get_dwmain( )
if pos(ldw_document.dataobject,'d_document') = 0 then ldw_document = vdw_focus
lc_appr = create c_appr_profile
ll_currentrow = ldw_document.getrow( )
ldb_doc_id = ldw_document.getitemnumber( ll_currentrow , 'ID')
ls_updatetable = ldw_document.describe( "DataWindow.Table.UpdateTable")
lds_appr_profile = create t_ds_db
lds_appr_profile.dataobject = 'ds_appr_profile_grid'
lds_appr_profile.f_settransobject( lt_transaction)
lds_appr_level = create t_ds_db
lds_appr_level.dataobject = 'ds_appr_level'
lds_appr_level.f_settransobject(lt_transaction)
//if pos(ldw_document.dataobject,'d_document') > 0 then
	ls_identify_code = vc_obj_handling.classname( ) +'.'+ 'd_action_edit' +'.'+lc_string.f_globalreplace('e_approve', 'e_', 'b_')
	ldb_identify_id = lc_iden_ini.f_get_id( ls_identify_code)
	if ldb_identify_id > 0 then
		ldb_business_id = lc_rule.f_get_business_rule_id( ldb_identify_id,vw_multi)
		if ldb_business_id > 0 then
			ldb_role_user_id = lc_rule.f_get_role_user_id( ldb_business_id)
			if ldb_role_user_id > 0 then
				ls_type_role_user_id = lc_rule.f_get_type_role_user_id( ldb_role_user_id)
				if not isnull(ls_type_role_user_id) then
					if ls_type_role_user_id = 'appr' then
						//--Duyệt nhiều cấp--//
						laa_data[1] = ldb_role_user_id
						lds_appr_level.f_add_where( 'object_ref_id',laa_data[] )
						li_row = lds_appr_level.retrieve( )
						if li_row = -1 then return
						ll_rtn = lc_appr.f_insert_appr_profile(ldb_doc_id,ls_updatetable,lds_appr_profile, lds_appr_level)
					else
						ll_rtn = lc_appr.f_insert_appr_profile( ldb_doc_id, ls_updatetable,ldb_role_user_id, 1,lds_appr_profile)
					end if
					if ll_rtn = 1 then 
						ll_rtn = lds_appr_profile.update(true,false )
						if ll_rtn = 1 then
							lds_appr_profile.resetupdate( )
							ldw_document.setitem( ldw_document.getrow( ) , 'status', 'req_approve')
							if ldw_document.describe("status_name.x") <> '!' then ldw_document.setitem( ldw_document.getrow(), 'status_name', 'Yêu cầu duyệt')
						else 
							messagebox('Lỗi','s_w_multi.e_sent_2_approve(line:57)')
						end if
					end if
				else
					ll_rtn = -1
				end if
			else
				ll_rtn = -1
			end if
		else
			ll_rtn = -1
		end if
	else
		ll_rtn = -1
	end if
	if ll_rtn = 1 then
		ll_rtn = ldw_document.update(true,false )	
		if ll_rtn = 1 then
			//--cảnh báo hàng đã đặt bán hết nếu có--//
			ll_rtn = vc_obj_handling.event e_window_e_send_2_approve( )
			if ll_rtn = -1 then
				Rollback using lt_transaction;
			else
				ldw_document.resetupdate( )
				commit using lt_transaction;
			end if
		else
			messagebox('Lỗi','s_w_multi.e_sent_2_approve(line:80)')
		end if
	end if
	if ll_rtn = -1 then
		Rollback using lt_transaction;
	end if
	destroy lds_appr_profile
	destroy lds_appr_level
	destroy lc_appr
	if ll_rtn <> -1 then
		if vc_obj_handling.f_is_auto_appr( ) then vw_multi.f_auto_approve(ldb_doc_id )
		vc_obj_handling.f_ctrl_actionbuttons( vdw_focus)
		vw_multi.event e_display_actionbutton( )
	end if

end event

event e_approve(datawindow vdw_focus, s_object_display vc_obj_handling, s_w_multi vw_multi);int						li_idx,li_appr_level
any					laa_data[]
long					ll_rtn,ll_row,ll_currentrow,ll_find,ll_find1
string					las_t_ref_table[],ls_status,ls_username,ls_doctype
double				ldb_doc_id,ladb_t_ref_id[],ldb_userid
datetime				ldt_sysdate
t_ds_db				lds_appr_profile
t_dw_mpl			ldw_document,ladw_details[]
c_datetime			lc_dt
t_transaction 		lt_transaction
c_appr_profile		lc_appr

if gi_userid = 0 then return
vw_multi.f_get_transaction( lt_transaction)
ldw_document = vw_multi.f_get_dwmain( )
if pos(ldw_document.dataobject,'d_document') = 0 then ldw_document = vdw_focus
lc_appr = create c_appr_profile
lds_appr_profile = create t_ds_db
lds_appr_profile.dataobject = 'ds_appr_profile_grid'
//if pos(ldw_document.dataobject,'d_document') > 0 then
	ll_currentrow = ldw_document.find("gutter = 'Y'", 1, ldw_document.rowcount( ) )
	if ll_currentrow = 0 then ll_currentrow = ldw_document.getrow( )
	Do While ll_currentrow > 0
		ldb_doc_id = ldw_document.getitemnumber( ll_currentrow , 'ID')
		ldt_sysdate = lc_dt.f_getsysdate( )
		lds_appr_profile.dataobject = 'ds_appr_profile_grid'
		lds_appr_profile.f_settransobject(lt_transaction)
		laa_data[1] = ldb_doc_id
		lds_appr_profile.f_add_where( 'object_ref_id', laa_data[])
		ll_row = lds_appr_profile.event e_retrieve( )
		if ll_row = 0 then 
			gf_messagebox('m.s_w_multi.e_approve.03','Thông báo','Bạn không có quyền duyệt phiếu ','exclamation','ok',1)
			exit
		end if
		li_appr_level = lds_appr_profile.getitemnumber(ll_row,'appr_level')
		if li_appr_level > 1 then
			//--trường hợp cây duyệt--//
			ll_find = lds_appr_profile.find( "APPR_ASSIGNED ="+string(gi_userid),1, ll_row)
			if ll_find = 0 then
				ll_rtn = -1
				gf_messagebox('m.s_w_multi.e_approve.03','Thông báo','Bạn không có quyền duyệt phiếu '+ldw_document.getitemstring(ll_currentrow, 'code'),'exclamation','ok',1)
				exit
			end if
			li_appr_level = lds_appr_profile.getitemnumber(ll_find,'appr_level')
			if li_appr_level = 1 then //--duyệt cấp 1--//
				if lds_appr_profile.getitemstring( ll_find, 'status') = 'approved' then
					gf_messagebox('m.s_w_multi.e_approve.02','Thông báo','Phiếu '+ldw_document.getitemstring(ll_currentrow, 'code') + ' đã được duyệt cấp ' +string(li_appr_level),'exclamation','ok',1)
				else
					ll_rtn = lc_appr.f_update_appr_profile( lds_appr_profile,ll_find, 'approved', gi_userid,ldb_doc_id, ldt_sysdate,'normal')
				end if
			elseif li_appr_level > 1 then //--duyệt từ cấp 2 trở đi--//
				ll_find1 = lds_appr_profile.find( "status = 'approved' and appr_level = "+string(li_appr_level - 1),1, ll_row)
				if ll_find1 > 0 then
					ll_rtn = lc_appr.f_update_appr_profile( lds_appr_profile,ll_find, 'approved', gi_userid,ldb_doc_id, ldt_sysdate,'normal')
					if ll_rtn = 1 then
						//--nếu là cấp duyệt cuối thì cập nhật trạng thái--//
						if lds_appr_profile.getitemnumber( ll_find, 'APPR_LEVEL') = lds_appr_profile.getitemnumber(lds_appr_profile.rowcount( ), 'APPR_LEVEL') then
							ldw_document.setitem( ll_currentrow , 'status', 'approved')
							if ldw_document.describe("status_name.x") <> '!' then ldw_document.setitem( ldw_document.getrow(), 'status_name', 'Đã duyệt')
						end if
					end if
				else
					ldb_userid = lds_appr_profile.getitemnumber( ll_find - 1, 'APPR_ASSIGNED')
					select obj.name into :ls_username  
					from object obj join role_user rol on rol.object_staff = obj.id 
					where rol.id = :ldb_userid using SQLCA;
					gf_messagebox('m.s_w_multi.e_approve.01','Thông báo','Nhân viên : '+ls_username+ ' chưa duyệt','exclamation','ok',1)
					ll_rtn = 0
				end if
			end if
		elseif li_appr_level = 1 then
			ll_find = lds_appr_profile.find( "APPR_ASSIGNED ="+string(gi_userid),1, ll_row)
			if ll_find > 0 then
				ll_rtn = lc_appr.f_update_appr_profile( lds_appr_profile,ll_find, 'approved', gi_userid,ldb_doc_id, ldt_sysdate,'normal')
				if ll_rtn = 1 then
					ldw_document.setitem( ll_currentrow , 'status', 'approved')
					if ldw_document.describe("status_name.x") <> '!' then ldw_document.setitem( ldw_document.getrow(), 'status_name', 'Đã duyệt')
				end if
			else
				for li_idx = 1 to upperbound(g_user.idb_role_id)
					ll_find = lds_appr_profile.find( "APPR_ASSIGNED ="+string(g_user.idb_role_id[li_idx] ),1, ll_row)
					if ll_find > 0 then exit
				next
				if ll_find > 0 then
					ll_rtn = lc_appr.f_update_appr_profile( lds_appr_profile,ll_find, 'approved', gi_userid,ldb_doc_id, ldt_sysdate,'normal')
					if ll_rtn = 1 then
						ldw_document.setitem( ll_currentrow , 'status', 'approved')
						if ldw_document.describe("status_name.x") <> '!' then ldw_document.setitem( ldw_document.getrow(), 'status_name', 'Đã duyệt')
					end if
				else
					ll_rtn = -1
					gf_messagebox('m.s_w_multi.e_approve.03','Thông báo','Bạn không có quyền duyệt phiếu '+ldw_document.getitemstring(ll_currentrow, 'code'),'exclamation','ok',1)
					exit
				end if
			end if
		end if
		if ll_rtn = 1 then
			ll_currentrow = ldw_document.find("gutter = 'Y'", ll_currentrow+1, ldw_document.rowcount( )+1 )
		else
			ll_currentrow = 0
		end if
	Loop
	if ll_rtn = 1 then
		ll_rtn = ldw_document.update(true,false )
		if ll_rtn = 1 then
			if pos(ldw_document.dataobject,'d_document') > 0 then
				//-- Cập nhật trạng thái chứng từ liên quan --//
				ls_doctype = ldw_document.getitemstring(ll_currentrow , 'doc_type')
				if vc_obj_handling.event e_statuschanged( 'approved', ldb_doc_id, ls_doctype, true) = -1 then
					Rollback using lt_transaction;
					ldw_document.event e_refresh( )
					gf_messagebox('m.s_w_multi.e_approve.04','Thông báo','Không cập nhật được trạng thái chứng từ liên quan','exclamation','ok',1)
					return
				end if
			end if
			ldw_document.resetupdate( )
			commit using lt_transaction;
			gf_messagebox('m.s_w_multi.e_approve.03','Thông báo','Duyệt thành công','exclamation','ok',1)
			ll_currentrow = ldw_document.find( "ID = " + string(ldb_doc_id), 1, ldw_document.rowcount())
			ldw_document.scrolltorow( ll_currentrow)				
		else
			Rollback using lt_transaction;
			messagebox('Lỗi','s_w_multi.e_approve(line:69)')
		end if
	end if
//end if
destroy lds_appr_profile
destroy lc_appr
vc_obj_handling.event e_window_e_approved( )
vc_obj_handling.f_ctrl_actionbuttons( vdw_focus)
vw_multi.event e_display_actionbutton( )
end event

event e_rb_clicked(radiobutton vrb_handling, s_object_display vod_handling);
if isnull(vrb_handling) then return
vod_handling.dynamic event e_window_e_rb_clicked(vrb_handling)
end event

public function integer f_get_overdue_invoice (double vdb_object_id, ref string vs_invoice_no[], ref date vd_invoice_date[], ref date vd_due_date[], ref double vdb_invoice_amt[]);int		li_rtn


return li_rtn
end function

public function integer f_get_cust_overdue_invoice (double vdb_object_id, date vd_trans_date, ref string rs_invoice_no[], ref date rd_invoice_date[], ref date rd_due_date[]);/***********************************************************8

return: Số hóa đơn quá hạn chưa thanh toán
		 -1 lỗi
		 0 : không có hóa đơn nào quá hạn.
------------------------------------------------------------------------------------------------*/

int		li_rtn, li_row

t_ds_db		lds_overdue

lds_overdue = create t_ds_db
lds_overdue.dataobject = 'ds_cust_overdue_invoice'
lds_overdue.settransobject( sqlca)
li_rtn = lds_overdue.retrieve( vdb_object_id,vd_trans_date )

if li_rtn < 0 then
	gf_messagebox('m.b_obj_instantiate.f_get_cust_overdue_invoice.01','Thông báo','Lỗi retrieve dữ liệu:@'+ sqlca.sqlerrtext, 'stop','ok',1)	
	return -1	
end if

FOR li_row =1 to li_rtn
	rs_invoice_no[li_row] = lds_overdue.getitemstring( li_row, 'code')
	rd_invoice_date[li_row] = date(lds_overdue.getitemdatetime( li_row, 'document_date'))
	rd_due_date[li_row] = date(lds_overdue.getitemdatetime( li_row, 'due_date'))
NEXT

return li_rtn
end function

public function integer f_update_ex_tax (double vdb_curr_id, double vdb_exrate, string vs_include_tax_yn, ref t_dw_mpl rdw_update, long vl_row, string vs_event_colnames, string vs_event_act_colnames, string vs_changed_colname, double vdb_change_val);double				ldb_base_round_id,ldb_round_id
int						li_idx, li_cnt, li_cnt_act
string					lsa_event_colname[], lsa_event_act_colname[]
double 				ldb_qty, ldb_price, ldb_amount, ldb_base_amount, ldb_price_ex_tax, ldb_amount_ex_tax, ldb_base_amount_ex_Tax
double				ldb_act_qty, ldb_act_price, ldb_act_amount, ldb_act_base_amount
double				ldb_act_price_ex_tax, ldb_act_amount_ex_tax, ldb_act_base_amount_ex_Tax
int						li_tax_pct
c_unit_instance		lc_unit
c_string 				lc_string


ldb_round_id = lc_unit.f_get_round_id( vdb_curr_id, 0, 'amount')
ldb_base_round_id = lc_unit.f_get_round_id( 0, 0, 'bc')

li_cnt = lc_string.f_stringtoarray( vs_event_colnames, ';', lsa_event_colname[])
FOR li_idx = 1 to li_cnt
	if upper(vs_changed_colname) = 'TAX_PCT' and vs_include_tax_yn = 'N' then continue 
	if upper(lsa_event_colname[li_idx]) = upper(vs_changed_colname) then continue 
	if li_idx = 1 then
		//--qty--//
		ldb_qty = rdw_update.getitemnumber(vl_row, lsa_event_colname[1] )
		if isnull(ldb_qty) then ldb_qty = 0
	elseif li_idx = 2 then
		//--price--//
		ldb_price = rdw_update.getitemnumber(vl_row, lsa_event_colname[2] )
		if isnull(ldb_price) then ldb_price = 0
	elseif li_idx = 3 then
		//--amount--//
		ldb_amount = rdw_update.getitemnumber(vl_row, lsa_event_colname[3] )
		if isnull(ldb_amount) then ldb_amount = 0
	elseif  li_idx = 4 then
		//-- VAT tax_pct --//
		li_tax_pct = rdw_update.getitemnumber(vl_row, lsa_event_colname[4] )
		if isnull(li_tax_pct) then li_tax_pct = 0
	end if
NEXT

li_cnt_act = lc_string.f_stringtoarray( vs_event_act_colnames, ';', lsa_event_act_colname[])
FOR li_idx = 1 to li_cnt_act
	if upper(vs_changed_colname) = 'TAX_PCT' and vs_include_tax_yn = 'N' then continue 
	if upper(lsa_event_act_colname[li_idx]) = upper(vs_changed_colname) then continue 
	if li_idx = 1 then
		//--act_qty--//
		ldb_act_qty = rdw_update.getitemnumber(vl_row, lsa_event_act_colname[1] )
		if isnull(ldb_qty) then ldb_qty = 0
	elseif li_idx = 2 then
		//--act_price--//
		ldb_act_price = rdw_update.getitemnumber(vl_row, lsa_event_act_colname[2] )
		if isnull(ldb_price) then ldb_price = 0
	elseif li_idx = 3 then
		//--act_amount--//
		ldb_act_amount = rdw_update.getitemnumber(vl_row, lsa_event_act_colname[3] )
		if isnull(ldb_amount) then ldb_amount = 0
	elseif  li_idx = 4 then
		//-- VAT tax_pct --//
		li_tax_pct = rdw_update.getitemnumber(vl_row, lsa_event_act_colname[4] )
		if isnull(li_tax_pct) then li_tax_pct = 0
	end if
NEXT

if vs_include_tax_yn = 'N' then
	if upper(vs_changed_colname) = 'QTY' then
		ldb_qty = vdb_change_val
	elseif  upper(vs_changed_colname) = 'PRICE' then
		ldb_price = vdb_change_val
	elseif   upper(vs_changed_colname) = 'AMOUNT' then
		ldb_amount = vdb_change_val
	elseif  upper(vs_changed_colname) = 'ACT_QTY' then
		ldb_act_qty = vdb_change_val
	elseif  upper(vs_changed_colname) = 'ACT_PRICE' then
		ldb_act_price = vdb_change_val
	elseif  upper(vs_changed_colname) = 'ACT_AMOUNT' then
		ldb_act_amount = vdb_change_val
	elseif upper(vs_changed_colname) = 'TAX_PCT' then
		li_tax_pct = vdb_change_val
	end if
	ldb_price_ex_tax = ldb_price
	ldb_amount_ex_tax = lc_unit.f_round(rdw_update, ldb_round_id,ldb_qty * ldb_price_ex_tax)
	ldb_base_amount_ex_Tax = lc_unit.f_round(rdw_update, ldb_base_round_id,ldb_qty * ldb_price_ex_tax* vdb_exrate)	
	ldb_act_price_ex_tax = ldb_act_price 
	ldb_act_amount_ex_tax =  lc_unit.f_round(rdw_update, ldb_round_id, ldb_act_amount)
//	ldb_act_base_amount_ex_Tax
	
	ldb_base_amount = lc_unit.f_round(rdw_update, ldb_base_round_id, ldb_amount*vdb_exrate)	
	ldb_act_base_amount =  lc_unit.f_round(rdw_update, ldb_base_round_id, ldb_act_amount*vdb_exrate)	
else
	if upper(vs_changed_colname) = 'QTY' then
		ldb_qty = vdb_change_val
	elseif  upper(vs_changed_colname) = 'PRICE' then
		ldb_price = vdb_change_val
	elseif   upper(vs_changed_colname) = 'AMOUNT' then
		ldb_amount = vdb_change_val
	elseif  upper(vs_changed_colname) = 'ACT_QTY' then
		ldb_act_qty = vdb_change_val
	elseif  upper(vs_changed_colname) = 'ACT_PRICE' then
		ldb_act_price = vdb_change_val
	elseif  upper(vs_changed_colname) = 'ACT_AMOUNT' then
		ldb_act_amount = vdb_change_val		
	elseif upper(vs_changed_colname) = 'TAX_PCT' then
		li_tax_pct = vdb_change_val
	end if
	ldb_price_ex_tax = lc_unit.f_round(rdw_update, ldb_round_id,ldb_price * 100/(100 + li_tax_pct))
	ldb_amount_ex_tax = lc_unit.f_round(rdw_update, ldb_round_id,ldb_qty * ldb_price_ex_tax)
	ldb_base_amount_ex_Tax = lc_unit.f_round(rdw_update, ldb_base_round_id,ldb_qty * ldb_price_ex_tax* vdb_exrate)
end if
rdw_update.setitem(vl_row,'price_ex_tax',ldb_price_ex_tax)
rdw_update.setitem(vl_row,'AMOUNT_EX_TAX',ldb_amount_ex_tax)
rdw_update.setitem(vl_row,'BASE_AMOUNT_EX_TAX',ldb_base_amount_ex_Tax)

	
return 1
end function

public function integer f_update_ex_tax (double vdb_curr_id, double vdb_exrate, string vs_include_tax_yn, t_dw_mpl rdw_update, long vl_row, string vs_event_colnames, string vs_changed_colname, double vdb_change_val);double				ldb_base_round_id,ldb_round_id
int						li_idx, li_cnt
string					lsa_event_colname[], lsa_upd_colname[]
double 				ldb_qty, ldb_price, ldb_amount, ldb_base_amount, ldb_price_ex_tax, ldb_amount_ex_tax, ldb_base_amount_ex_Tax
int						li_tax_pct
c_unit_instance		lc_unit
c_string 				lc_string


ldb_round_id = lc_unit.f_get_round_id( vdb_curr_id, 0, 'amount')
ldb_base_round_id = lc_unit.f_get_round_id( 0, 0, 'bc')

if upper(vs_changed_colname) = 'TAX_PCT' and vs_include_tax_yn = 'N' then return 0

li_cnt = lc_string.f_stringtoarray( vs_event_colnames, ';', lsa_event_colname[])
FOR li_idx = 1 to li_cnt	
	if upper(lsa_event_colname[li_idx]) = upper(vs_changed_colname) then continue 
	if li_idx = 1 then
		//--qty--//
		ldb_qty = rdw_update.getitemnumber(vl_row, lsa_event_colname[1] )
		if isnull(ldb_qty) then ldb_qty = 0
	elseif li_idx = 2 then
		//--price--//
		ldb_price = rdw_update.getitemnumber(vl_row, lsa_event_colname[2] )
		if isnull(ldb_price) then ldb_price = 0
	elseif li_idx = 3 then
		//--amount--//
		ldb_amount = rdw_update.getitemnumber(vl_row, lsa_event_colname[3] )
		if isnull(ldb_amount) then ldb_amount = 0
	elseif  li_idx = 4 then
		//-- VAT tax_pct --//
		li_tax_pct = rdw_update.getitemnumber(vl_row, lsa_event_colname[4] )
		if isnull(li_tax_pct) then li_tax_pct = 0
	end if
NEXT

if vs_include_tax_yn = 'N' then
	if upper(vs_changed_colname) = 'QTY' then
		ldb_qty = vdb_change_val
		rdw_update.setitem(vl_row,'AMOUNT', ldb_qty*ldb_price)
	elseif  upper(vs_changed_colname) = 'PRICE' then
		ldb_price = vdb_change_val
		rdw_update.setitem(vl_row,'AMOUNT', ldb_qty*ldb_price)
	elseif   upper(vs_changed_colname) = 'AMOUNT' then
		ldb_amount = vdb_change_val
	elseif upper(vs_changed_colname) = 'TAX_PCT' then
		li_tax_pct = vdb_change_val
	end if
	ldb_price_ex_tax = ldb_price
	ldb_amount_ex_tax = lc_unit.f_round(rdw_update, ldb_round_id,ldb_qty * ldb_price_ex_tax)
	ldb_base_amount_ex_Tax = lc_unit.f_round(rdw_update, ldb_base_round_id,ldb_qty * ldb_price_ex_tax* vdb_exrate)	
else
	if upper(vs_changed_colname) = 'QTY' then
		ldb_qty = vdb_change_val
	elseif  upper(vs_changed_colname) = 'PRICE' then
		ldb_price = vdb_change_val
	elseif   upper(vs_changed_colname) = 'AMOUNT' then
		ldb_amount = vdb_change_val
	elseif upper(vs_changed_colname) = 'TAX_PCT' then //-- chỉ tính thuế xuất VAT--//
		li_tax_pct = vdb_change_val
	end if
	ldb_price_ex_tax = lc_unit.f_round(rdw_update, ldb_round_id,ldb_price * 100/(100 + li_tax_pct))
	ldb_amount_ex_tax = lc_unit.f_round(rdw_update, ldb_round_id,ldb_qty * ldb_price_ex_tax)
	ldb_base_amount_ex_Tax = lc_unit.f_round(rdw_update, ldb_base_round_id,ldb_qty * ldb_price_ex_tax* vdb_exrate)
end if
ldb_base_amount =  lc_unit.f_round(rdw_update, ldb_base_round_id,ldb_qty*ldb_price* vdb_exrate)

rdw_update.setitem(vl_row,'price_ex_tax',ldb_price_ex_tax)
rdw_update.setitem(vl_row,'AMOUNT_EX_TAX',ldb_amount_ex_tax)
rdw_update.setitem(vl_row,'BASE_AMOUNT_EX_TAX',ldb_base_amount_ex_Tax)
rdw_update.setitem(vl_row,'BASE_AMOUNT', ldb_base_amount)

return 1
end function

public function integer f_get_stock_uom (string vs_item_code, ref double rdb_stock_uom, ref string rs_uom_code);
int			li_cnt

select count (object.id) into :li_cnt
from object join item on item.object_ref_id = object.id
where lower(object.code) = lower(:vs_item_code) using sqlca;

if li_cnt > 1 then
	gf_messagebox('m.b_obj_instantiate.f_get_stock_uom2.01','Thống báo','Lỗi: Bảng ITEM có nhiều hơn 1 record cho mã hàng:@'+vs_item_code,'stop','ok',1)
	return -1
elseif li_cnt = 0 then
	gf_messagebox('m.b_obj_instantiate.f_get_stock_uom2.02','Thống báo','Không có mã hàng có mã:@'+vs_item_code,'stop','ok',1)
	return -1	
end if

select item.stock_uom, uom.code into :rdb_stock_uom, :rs_uom_code
from object 
join item on item.object_ref_id = object.id
join uom on uom.id = item.stock_uom
where lower(object.code) = lower(:vs_item_code) using sqlca;

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

public function integer f_update_tax (double vdb_curr_id, double vdb_exrate, t_dw_mpl rdw_master, long vl_row_master, t_dw_mpl rdw_tax_line, long vl_row_tax_line, double vdb_object_ref_id, string vs_changed_colname, integer vi_tax_pct);double				ldb_base_round_id,ldb_round_id, ldb_object_ref_id, ldb_tax_id
double 				ldb_amount_ex_tax, ldb_base_amount_ex_Tax, ldb_tmp_amt, ldb_tax_include_amt, ldb_trans_tax_include_amt
int						li_tax_pct, li_row, li_uprow
string					ls_filter,ls_filter_org,  ls_uprow_yn, ls_include_yn
c_unit_instance		lc_unit


ldb_round_id = lc_unit.f_get_round_id( vdb_curr_id, 0, 'amount')
ldb_base_round_id = lc_unit.f_get_round_id( 0, 0, 'bc')

//-- tính record thuế hiện tại --//
if vl_row_tax_line > 0 then ldb_tax_id = rdw_tax_line.getitemnumber(vl_row_tax_line,'tax_id')
ls_filter_org = rdw_tax_line.describe("DataWindow.Table.Filter")
if vdb_object_ref_id > 0 then 
	ldb_object_ref_id = vdb_object_ref_id
else
	if vl_row_tax_line = 0 then return 0 //-- không có thuế --//
	ldb_object_ref_id = rdw_tax_line.getitemnumber(vl_row_tax_line,'object_ref_id')
end if

ls_filter = "object_ref_id="+string(ldb_object_ref_id)
rdw_tax_line.setfilter(ls_filter)
rdw_tax_line.filter()
if rdw_tax_line.rowcount() = 0 then return 0  //-- không có thuế --//

if vl_row_master = 0 then
	vl_row_master = rdw_master.find(" ID="+string(ldb_object_ref_id), 1 ,rdw_master.rowcount())
	if vl_row_master < 1 then return -1
end if
ldb_amount_ex_tax = rdw_master.getitemnumber(vl_row_master,'AMOUNT_EX_TAX')
ldb_base_amount_ex_Tax = rdw_master.getitemnumber(vl_row_master,'BASE_AMOUNT_EX_TAX')

FOR li_row = 1 to rdw_tax_line.rowcount()
	if ldb_tax_id = rdw_tax_line.getitemnumber(li_row,'tax_id') and vi_tax_pct > 0 then
		li_tax_pct = vi_tax_pct
	else
		li_tax_pct = rdw_tax_line.getitemnumber(li_row,'tax_pct')
		ldb_tax_id =  rdw_tax_line.getitemnumber(li_row,'tax_id')
	end if
	
	rdw_tax_line.setitem(li_row,'TRANS_CURRENCY', vdb_curr_id)
	rdw_tax_line.setitem(li_row,'EXCHANGE_RATE', vdb_exrate)
	
	ls_uprow_yn =  rdw_tax_line.getitemstring(li_row,'UPROW_YN')
	if isnull(ls_uprow_yn) then ls_uprow_yn = 'N'	
	if ls_uprow_yn = 'Y' then
		li_uprow = li_row
		continue
	end if		
	ls_include_yn =  rdw_tax_line.getitemstring(li_row,'INCLUDE_YN')
	if isnull(ls_include_yn) then ls_include_yn = 'N'
	
	ldb_tmp_amt = lc_unit.f_round( rdw_tax_line, ldb_round_id, ldb_amount_ex_tax*li_tax_pct/100)
	rdw_tax_line.setitem(li_row,'TRANS_TAX_AMOUNT', ldb_tmp_amt)	
	if ls_include_yn = 'Y' then
		ldb_trans_tax_include_amt += ldb_tmp_amt
	end if	
	
	ldb_tmp_amt = lc_unit.f_round( rdw_tax_line, ldb_base_round_id,  ldb_base_amount_ex_Tax*li_tax_pct/100)
	rdw_tax_line.setitem(li_row,'TAX_AMT', ldb_tmp_amt)
	rdw_tax_line.setitem(li_row,'TAX_CORRECTION',  ldb_tmp_amt)		
	if ls_include_yn = 'Y' then
		ldb_tax_include_amt += ldb_tmp_amt
	end if

NEXT

if li_uprow > 0 then
	ldb_tmp_amt = lc_unit.f_round( rdw_tax_line, ldb_round_id, (ldb_amount_ex_tax+ldb_trans_tax_include_amt)*li_tax_pct/100)
	rdw_tax_line.setitem(li_uprow,'TRANS_TAX_AMOUNT', ldb_tmp_amt)			
	ldb_tmp_amt = lc_unit.f_round( rdw_tax_line, ldb_base_round_id, (ldb_base_amount_ex_Tax + ldb_tax_include_amt)*li_tax_pct/100)
	rdw_tax_line.setitem(li_uprow,'TAX_AMT', ldb_tmp_amt)
	rdw_tax_line.setitem(li_uprow,'TAX_CORRECTION',  ldb_tmp_amt)		
end if

if ls_filter_org <> '?' then
	rdw_tax_line.setfilter(ls_filter_org)
	rdw_tax_line.filter()
end if

return 1
end function

public function string f_get_staff_dept_code (double vdb_object_id, string vs_type);/**********************************************
Hàm lấy mã phòng ban của người phụ trách hoặc NV KD
vdb_object_id : id của user hoặc của object(ref_table = STAFF)
vs_type :			USER 
					STAFF
**********************************************/
string		ls_dept_code,ls_dept_name

if upper(vs_type) = 'USER' then
	Select dept.code,dept.name into :ls_dept_code, :ls_dept_name
	From object dept join staff on staff.dept_id = dept.id
							join role_user rol on rol.object_staff = staff.object_ref_id
	Where rol.id = :vdb_object_id using SQLCA;
else
	Select dept.code,dept.name into :ls_dept_code, :ls_dept_name
	From object dept join staff on staff.dept_id = dept.id
	Where staff.object_ref_id = :vdb_object_id using SQLCA;
end if
if SQLCA.sqlcode <> 0 then
	setnull(ls_dept_code)
end if
return ls_dept_code
end function

public function integer f_get_item_wholesales_price (double vdb_item_id, double vdb_item_manage_group, string vs_item_applied_type, double vdb_object_id, double vdb_object_manage_group, string vs_object_applied_type, double vdb_object_staff, double vdb_staff_manage_group, string vs_staff_applied_type, string vs_price_type, ref double rdb_wholesales_price);/*******************************************
Chức năng: Lấy giá WHOLESALES mặc định của hàng hóa

vs_item_applied_type: loại áp áp dụng mã hàng( riêng biệt, tất cả,theo nhóm)

*******************************************/
return 0
end function

public function string f_get_trans_setup_sob (string vs_doc_type, double vdb_trans_hdr_id);t_ds_db       		lds_tmp
string 				ls_yn
long					ll_found_row

lds_tmp = create t_ds_db
lds_tmp.dataobject = 'd_trans_setup_hdr_grid'
lds_tmp.f_settransobject( SQLCA)
lds_tmp.retrieve(vs_doc_type)
ll_found_row = lds_tmp.find("id = "+string(vdb_trans_hdr_id),1,lds_tmp.rowcount())
ls_yn = lds_tmp.getitemstring(ll_found_row,'sob_yn')
if ll_found_row = 0 then ls_yn = 'N'
if isnull(ls_yn) then ls_yn = 'N'
destroy lds_tmp
return ls_yn
end function

public function long f_get_ds_settled_revenue_period (ref t_ds_db rds_settled_revenue_period, date vd_fdate, date vd_tdate);
rds_settled_revenue_period.dataobject = 'ds_settled_revenue_period'
rds_settled_revenue_period.f_settransobject(sqlca)
return rds_settled_revenue_period.retrieve(vd_fdate, vd_tdate)
end function

public function long f_get_ds_sales_revenue_period (ref t_ds_db rds_settled_revenue_period, date vd_fdate, date vd_tdate);
rds_settled_revenue_period.dataobject = 'ds_sales_revenue_period'
rds_settled_revenue_period.f_settransobject(sqlca)
return rds_settled_revenue_period.retrieve(vd_fdate, vd_tdate)
end function

public function integer f_get_salesperson_comm (double vdb_staff_id, double vdb_dept_id, ref t_ds_db rds_sales_revenue_period, ref t_ds_db rds_settled_revenue_period, ref t_ds_db rds_objsales_objcomm, ref t_ds_db rds_comm_rate, ref double rdb_comm[]);/************************************************************************
Chức năng tính: doanh số, hoa hồng của NVKD theo chính sách
-------------------------------------------------------------------------------------------------------------------
Tham số:
	rdb_comm[1] : doanh số trong kỳ
	rdb_comm[2] : tiền thu được trong kỳ
	rdb_comm[3] : hoa tính theo chính sách
------------------------------------------------

================================================================================================*/
double		ldb_sales, ldb_sales_charge, ldb_sales_return, ldb_sales_settled, ldb_sales_staff, ldb_sales_dept, ldb_id
double 		ldb_min_amt, ldb_max_amt, ldb_pct, ldb_comm, ldb_sales_comm, ldb_sales_not_comm
long			ll_row
string			ls_minus_cust_comm_yn


rds_objsales_objcomm.setfilter("comm_object_id =" +string(vdb_staff_id) )
rds_objsales_objcomm.filter()
if rds_objsales_objcomm.rowcount() = 0 then
	rds_objsales_objcomm.setfilter("comm_object_group =" +string(vdb_dept_id) )
	if rds_objsales_objcomm.rowcount() = 0 then return 0
end if
ldb_id = rds_objsales_objcomm.getitemnumber(1, 'ID')

FOR ll_row = 1 to rds_objsales_objcomm.rowcount()

	ldb_sales_dept =  rds_objsales_objcomm.getitemnumber(ll_row, 'sales_object_group')
	if isnull(ldb_sales_dept) then
		ldb_sales_dept = vdb_dept_id 
	end if
	rds_sales_revenue_period.setfilter("DEPT_ID = " + string(ldb_sales_dept))
	rds_sales_revenue_period.filter()
	
	rds_settled_revenue_period.setfilter("DEPT_ID = " + string(ldb_sales_dept))
	rds_settled_revenue_period.filter()				
	
	ldb_sales += double(rds_sales_revenue_period.describe("Evaluate('Sum(BASE_REVENUE)', 0)"))	
	ldb_sales_charge += double(rds_sales_revenue_period.describe("Evaluate('Sum(CHARGE_BASE_AMT)', 0)"))
	ldb_sales_return += double(rds_sales_revenue_period.describe("Evaluate('Sum(BASE_REVENUE_RTN)', 0)"))	
	ldb_sales_settled += double(rds_settled_revenue_period.describe("Evaluate('Sum(SETTLED_BASE_AMOUNT)', 0)"))	
	ldb_sales_not_comm += double(rds_sales_revenue_period.describe("Evaluate('Sum(if(NOT_COMM_YN = 'Y', BASE_REVENUE, 0))', 0)"))	
	
NEXT

rds_comm_rate.setfilter( "ID ="+string(ldb_id))
rds_comm_rate.filter()
if rds_comm_rate.rowcount() > 0 then
	ls_minus_cust_comm_yn = rds_comm_rate.getitemstring(1, 'minus_cust_comm_yn')
//	ls_minus_sales_comm_yn = rds_comm_rate.getitemstring(1, 'minus_sales_comm_yn')
//	if isnull(ls_minus_sales_comm_yn) then ls_minus_sales_comm_yn = 'N'
	if ls_minus_cust_comm_yn = 'Y'  then 
		ldb_sales = ldb_sales - ldb_sales_return - ldb_sales_charge
	else
		ldb_sales = ldb_sales - ldb_sales_return
	end if
	rds_comm_rate.setfilter( "ID ="+string(ldb_id) + " AND f_total_sales <=" + string(ldb_sales) + " AND f_total_sales >= "+string(ldb_sales))
	rds_comm_rate.filter()	
	ldb_sales_comm = ldb_sales - ldb_sales_not_comm
	FOR ll_row = 1 to rds_comm_rate.rowcount()
		ldb_min_amt = rds_comm_rate.getitemnumber(ll_row, 'f_detail_sales')
		if isnull(ldb_min_amt) then ldb_min_amt = 0
		ldb_max_amt = rds_comm_rate.getitemnumber(ll_row, 't_detail_sales')
		if isnull(ldb_max_amt) then ldb_max_amt = 999999999999999
		ldb_pct = rds_comm_rate.getitemnumber(ll_row, 'comm_rate')
		if isnull(ldb_pct) then ldb_pct = 0
		ldb_comm += min( ldb_sales_comm - ldb_min_amt, ldb_max_amt - ldb_min_amt) * ldb_pct / 100
	NEXT
	
	rdb_comm[1] = ldb_sales
	rdb_comm[2] = ldb_sales_settled
	rdb_comm[3] = ldb_comm
end if

return 1
end function

public function integer f_get_salesperson_outstanding_comm (double vdb_staff_id, ref t_ds_db rds_comm_line, ref double rdb_outstanding_sales, ref double rdb_outstanding_comm);/************************************************************************
Chức năng tính: lấy doanh số chưa settled và hoa hồng chưa nhân của ký trước
-------------------------------------------------------------------------------------------------------------------

================================================================================================*/
long		ll_found
double	ldb_rec_comm, ldb_open_comm, ldb_period_comm
double	ldb_settled_sales, ldb_open_sales, ldb_period_sales

ll_found = rds_comm_line.find(" CR_ACCOUNT_ID =" + string(vdb_staff_id), 1 , rds_comm_line.rowcount())

if ll_found > 0 then
	ldb_rec_comm = rds_comm_line.getitemnumber(ll_found, 'base_amount')
	if isnull(ldb_rec_comm) then ldb_rec_comm = 0
	ldb_open_comm =  rds_comm_line.getitemnumber(ll_found, 'open_base_comm')
	if isnull(ldb_open_comm) then ldb_open_comm = 0
	ldb_period_comm = rds_comm_line.getitemnumber(ll_found, 'COMM_BASE_AMT') 
	if isnull(ldb_period_comm) then ldb_period_comm = 0
	rdb_outstanding_comm = ldb_open_comm + ldb_period_comm - ldb_rec_comm
	
	ldb_settled_sales = rds_comm_line.getitemnumber(ll_found, 'SETTLED_BASE_AMT')
	if isnull(ldb_settled_sales) then ldb_settled_sales = 0
	ldb_open_sales =  rds_comm_line.getitemnumber(ll_found, 'OPEN_BASE_SALES')
	if isnull(ldb_open_sales) then ldb_open_sales = 0
	ldb_period_sales = rds_comm_line.getitemnumber(ll_found, 'SALES_BASE_AMT') 
	if isnull(ldb_period_sales) then ldb_period_sales = 0
	rdb_outstanding_sales = ldb_open_sales + ldb_period_sales - ldb_settled_sales
elseif ll_found = 0 then
	return 0
else
	gf_messagebox('m.b_obj_instantiate.f_get_salesperson_outstanding_comm.01','Thông báo','Lỗi tìm kiếm: @'+string(ll_found), 'stop','ok',1)
	return -1
end if
return 1
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
//	ldw_object = this.iw_display.dynamic f_get_dw(vs_dw_object+ '_grid')
	if not isvalid(ldw_object) then
		gf_messagebox('m.b_doc.f_get_object_and_subaccount.01','Thông báo','Không tìm thấy DW OBJECT trong cài đặt ghi sổ:@'+ vs_dw_object,'stop','ok',1)
		return -1
	end if
	ldw_master = vdw_get_amount.f_get_idw_master()
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

public function integer f_get_support_person_comm (double vdb_staff_id, double vdb_dept_id, ref t_ds_db rds_sales_revenue_period, ref t_ds_db rds_settled_revenue_period, ref t_ds_db rds_objsales_objcomm, ref t_dw_mpl rdw_comm_line, ref t_ds_db rds_comm_rate, ref double rdb_comm[]);/************************************************************************
Chức năng tính: doanh số, hoa hồng của NVKD theo chính sách
-------------------------------------------------------------------------------------------------------------------
Tham số:
	rdb_comm[1] : doanh số trong kỳ
	rdb_comm[2] : tiền thu được trong kỳ
	rdb_comm[3] : hoa tính theo chính sách
------------------------------------------------

================================================================================================*/
double		ldb_sales, ldb_sales_charge, ldb_sales_return, ldb_sales_settled, ldb_sales_staff, ldb_sales_dept, ldb_id
double 		ldb_min_amt, ldb_max_amt, ldb_pct, ldb_comm , ldb_comm_minus
long			ll_row
string			ls_minus_cust_comm_yn


rds_objsales_objcomm.setfilter("comm_object_id =" +string(vdb_staff_id) )
rds_objsales_objcomm.filter()
if rds_objsales_objcomm.rowcount() = 0 then
	rds_objsales_objcomm.setfilter("comm_object_group =" +string(vdb_dept_id) )
	if rds_objsales_objcomm.rowcount() = 0 then return 0
end if
ldb_id = rds_objsales_objcomm.getitemnumber(1, 'ID')

FOR ll_row = 1 to rds_objsales_objcomm.rowcount()

	ldb_sales_dept =  rds_objsales_objcomm.getitemnumber(ll_row, 'sales_object_group')
	if isnull(ldb_sales_dept) then continue
	rds_sales_revenue_period.setfilter("DEPT_ID = " + string(ldb_sales_dept))
	rds_sales_revenue_period.filter()
	
	rds_settled_revenue_period.setfilter("DEPT_ID = " + string(ldb_sales_dept))
	rds_settled_revenue_period.filter()				
	
	rdw_comm_line.setfilter("DEPT_ID = " + string(ldb_sales_dept))
	rdw_comm_line.filter()								

	ldb_sales += double(rds_sales_revenue_period.describe("Evaluate('Sum(BASE_REVENUE)', 0)"))	
	ldb_sales_charge += double(rds_sales_revenue_period.describe("Evaluate('Sum(CHARGE_BASE_AMT)', 0)"))
	ldb_sales_return += double(rds_sales_revenue_period.describe("Evaluate('Sum(BASE_REVENUE_RTN)', 0)"))	
	ldb_sales_settled += double(rds_settled_revenue_period.describe("Evaluate('Sum(SETTLED_BASE_AMOUNT)', 0)"))	
	ldb_comm_minus += double(rdw_comm_line.describe("Evaluate('Sum(BASE_AMOUNT)', 0)"))	
NEXT

rds_comm_rate.setfilter( "ID ="+string(ldb_id))
rds_comm_rate.filter()
if rds_comm_rate.rowcount() > 0 then
	ls_minus_cust_comm_yn = rds_comm_rate.getitemstring(1, 'minus_cust_comm_yn')
//	ls_minus_sales_comm_yn = rds_comm_rate.getitemstring(1, 'minus_sales_comm_yn')
//	if isnull(ls_minus_sales_comm_yn) then ls_minus_sales_comm_yn = 'N'
	if ls_minus_cust_comm_yn = 'Y'  then 
		ldb_sales = ldb_sales - ldb_sales_return - ldb_sales_charge - ldb_comm_minus
	else
		ldb_sales = ldb_sales - ldb_sales_return - ldb_comm_minus
	end if
	rds_comm_rate.setfilter( "ID ="+string(ldb_id) + " AND f_total_sales <=" + string(ldb_sales) + " AND f_total_sales >= "+string(ldb_sales))
	rds_comm_rate.filter()	
	FOR ll_row = 1 to rds_comm_rate.rowcount()
		ldb_min_amt = rds_comm_rate.getitemnumber(ll_row, 'f_detail_sales')
		if isnull(ldb_min_amt) then ldb_min_amt = 0
		ldb_max_amt = rds_comm_rate.getitemnumber(ll_row, 't_detail_sales')
		if isnull(ldb_max_amt) then ldb_max_amt = 999999999999999
		ldb_pct = rds_comm_rate.getitemnumber(ll_row, 'comm_rate')
		if isnull(ldb_pct) then ldb_pct = 0
		ldb_comm += min( ldb_sales - ldb_min_amt, ldb_max_amt - ldb_min_amt) * ldb_pct / 100
	NEXT
	
	rdb_comm[1] = ldb_sales
	rdb_comm[2] = ldb_sales_settled
	rdb_comm[3] = ldb_comm
end if

return 1
end function

public function integer f_caculation_disc (double vdb_sales_price, ref double rdb_discount_amount, ref integer ri_discount_pct, ref double rdb_discount_price);/*
vdb_sales_price 			giá bán 
rdb_discount_amount		tiền chiết khấu
ri_discount_pct				% chiết khấu
rdb_discount_price		giá đã chiết khấu
*/
if vdb_sales_price = 0 then
	rdb_discount_amount = 0
	ri_discount_pct = 0
	rdb_discount_price = 0
elseif rdb_discount_amount = 0 then // chiết khấu bằng tiền
	rdb_discount_price= vdb_sales_price / (1 + (ri_discount_pct/100))
	rdb_discount_amount = vdb_sales_price - rdb_discount_price
elseif ri_discount_pct = 0 then // chiết khấu bằng %
	rdb_discount_price = vdb_sales_price - rdb_discount_amount
	ri_discount_pct = ((vdb_sales_price/rdb_discount_price) - 1) * 100
elseif rdb_discount_price = 0 then // nhập giá đã chiết khấu tính lại % và tiền chiết khấu
	rdb_discount_amount =  vdb_sales_price - rdb_discount_price
	ri_discount_pct = ((vdb_sales_price/rdb_discount_price) - 1) * 100
end if
return 0
end function

public function integer f_caculation_disc (double vdb_sales_price, ref double rdb_discount_amount, ref integer ri_discount_pct, ref double rdb_discount_price, boolean vb_increase_price, double vdb_round_id, t_dw_mpl vdw_transaction);/*
vdb_sales_price 			giá bán 
rdb_discount_amount		tiền chiết khấu
ri_discount_pct				% chiết khấu
rdb_discount_price		giá đã chiết khấu
vb_increase_price			true nêu tăng giá, false là giảm giá
vdw_transaction			lấy transaction khi làm tròn
*/
c_unit_instance		lc_unit

this.f_caculation_disc( vdb_sales_price, rdb_discount_amount, ri_discount_pct, rdb_discount_price)
rdb_discount_price = lc_unit.f_round(vdw_transaction, vdb_round_id,rdb_discount_price)
rdb_discount_amount = lc_unit.f_round(vdw_transaction, vdb_round_id,rdb_discount_amount)
if vb_increase_price then 
	rdb_discount_price = vdb_sales_price + rdb_discount_amount
	rdb_discount_amount =  rdb_discount_amount * -1
	ri_discount_pct = ri_discount_pct * -1
end if
return 0
end function

public function boolean f_check_base_currency (double vdb_currency_id);int			li_count

select count(UOM.CODE) into :li_count 
from UOM join UNIT_CLASS on UNIT_CLASS.ID = UOM.CLASS_ID 
                                                and UNIT_CLASS.CURRENCY_YN = 'Y' 
                                                and UOM.BASE_YN = 'Y'
										   and UOM.ID = :vdb_currency_id USING SQLCA;
if li_count > 0 then
	return true
else
	return false
end if
end function

public function boolean f_check_base_currency (string vs_currency_code);int			li_count

select count(UOM.CODE) into :li_count 
from UOM join UNIT_CLASS on UNIT_CLASS.ID = UOM.CLASS_ID 
                                                and UNIT_CLASS.CURRENCY_YN = 'Y' 
                                                and UOM.BASE_YN = 'Y'
										   and UOM.CODE = :vs_currency_code USING SQLCA;
if li_count > 0 then
	return true
else
	return false
end if
end function

public function integer f_get_applied_object_price (double vdb_item_id, double vdb_qty, ref double rdb_object_id, date vd_trans_date, string vs_dwo_price, string vs_object_type, string vs_price_type);t_ds_db	lds_dwo_price
boolean	lb_check_filter
string		ls_obj_appl_type,ls_filter
long		ll_retrieve
date		ld_f_date,ld_t_date
any		laa_data[]

if vdb_item_id = 0 then return 0

laa_data[1] = vdb_item_id
laa_data[2] = vs_object_type
laa_data[3] = vs_price_type
lds_dwo_price = create t_ds_db
lds_dwo_price.dataobject = vs_dwo_price
lds_dwo_price.f_add_where( 'item_id;object_type;price_type', laa_data)
lds_dwo_price.f_settransobject( SQLCA)
ll_retrieve = lds_dwo_price.retrieve( )
//-- không cài đặt giá mua--//
if ll_retrieve = 0 then return 0
//-- không cài phụ thuộc theo số lượng và ngày --//
ls_filter = "isnull(from_qty) and isnull(to_qty) and isnull(f_date) and isnull(t_date)"
lds_dwo_price.setfilter( ls_filter)
lds_dwo_price.filter( )
if lds_dwo_price.rowcount( ) > 0 then lb_check_filter = true
//-- lọc theo số lượng --//
if not lb_check_filter then
	ls_filter = string(vdb_qty) +" between from_qty and to_qty and isnull(f_date) and isnull(t_date)"
	lds_dwo_price.setfilter( ls_filter)
	lds_dwo_price.filter( )
	if lds_dwo_price.rowcount( ) > 0 then lb_check_filter = true
end if
//-- lọc theo ngày giao dịch --//
if not lb_check_filter then
	ls_filter = string(vd_trans_date) +" between f_date and t_date and isnull(from_qty) and isnull(to_qty)"
	lds_dwo_price.setfilter( ls_filter)
	lds_dwo_price.filter( )
	if lds_dwo_price.rowcount( ) > 0 then lb_check_filter = true
end if
//-- lọc theo số lượng và ngày giao dịch--//
if not lb_check_filter then
	ls_filter = string(vd_trans_date) +" between f_date and t_date  and "+ string(vdb_qty) +" between from_qty and to_qty "
	lds_dwo_price.setfilter( ls_filter)
	lds_dwo_price.filter( )
	if lds_dwo_price.rowcount( ) > 0 then lb_check_filter = true
end if
//--lấy mặc định 1 nhà CC --//
//ls_obj_appl_type = lds_dwo_price.getitemstring( ll_retrieve, 'object_applied_type')
//if ls_obj_appl_type = 'spec' then
//	rdb_object_id = lds_dwo_price.getitemnumber( ll_retrieve,'APPLIED_OBJECT_ID')
//end if
if lb_check_filter then
	ls_obj_appl_type = lds_dwo_price.getitemstring( lds_dwo_price.rowcount( ), 'object_applied_type')
	if ls_obj_appl_type = 'spec' then
		rdb_object_id = lds_dwo_price.getitemnumber( lds_dwo_price.rowcount( ),'APPLIED_OBJECT_ID')
	elseif ls_obj_appl_type = 'group' then
		return 0
	end if
	return 1
else
	return 0
end if
end function

public function integer f_get_wholesales_price (double vdb_item_id, double vdb_qty, double vdb_currency_id, string vs_dwo_price, string vs_price_type, date vd_trans_date, double vdb_object_id, double vdb_sales_person, ref double rdb_wholesales_price);t_ds_db		lds_sales_price,lds_setup_dw
c_datetime	lc_datetime
boolean		lb_got_price = false
double		ldb_staff_group,ldb_staff_id,ldb_customer_id
string			ls_filter,ls_filter_staff,ls_filter_customer,ls_cols
long			ll_retrieve,ll_find_staff,ll_find_customer,ll_idx,ll_find
any			laa_data[]

//-- Phân biệt chi nhánh khi lấy gia --//
lds_setup_dw = create t_ds_db
if upper(vs_price_type) = 'SALES' then
	laa_data[1]  = '=d_item_sales_price'
else
	laa_data[1]  = '=d_item_purchase_price'
end if
laa_data[2] = '=U_ITEM'
laa_data[3] = 'Y'
ls_cols = 'DWOBJECT;OBJECT;BRANCH_YN'
lds_setup_dw.dataobject = 'ds_setup_dw'
lds_setup_dw.f_settransobject( SQLCA)
lds_setup_dw.f_add_where( ls_cols , laa_data)
ll_retrieve = lds_setup_dw.retrieve( )
//-- lấy nhóm nhân viên --//
select staff.dept_id into :ldb_staff_group
from object join staff on staff.object_ref_id = object.id
				join object obj1 on obj1.id = staff.dept_id
where object.id = :vdb_sales_person using SQLCA;
//-- lấy nhóm khách hàng(chưa lấy) --//
laa_data[1] = vdb_item_id
laa_data[2] = upper(vs_price_type)
laa_data[3] = vdb_currency_id
lds_sales_price = create t_ds_db
if ll_retrieve > 0 then
	ls_cols = 'item_id;price_type;currency_id;branch_id'
	laa_data[4] = gdb_branch
else
	ls_cols = 'item_id;price_type;currency_id'
end if
lds_sales_price.dataobject = vs_dwo_price
lds_sales_price.f_settransobject( SQLCA)
lds_sales_price.f_add_where( ls_cols, laa_data)
ll_retrieve = lds_sales_price.retrieve( )
if ll_retrieve = 0 then return 0 //-- không có cài đặt giá bán cho mặt hàng --//
//-- lọc không theo giới hạn số lượng và ngày tháng--//
//ls_filter = "if(isnull(from_qty),0,from_qty ) = 0 and if(isnull(to_qty),0,to_qty ) = 0 and if(isnull(f_date),0,if(f_date = date('01/01/1990',0,1))) = 0 and if(isnull(t_date),0,if(t_date = date('01/01/1990',0,1)))"
//lds_sales_price.setfilter( ls_filter)
//lds_sales_price.filter( )

if upper(vs_price_type) = 'SALES' then
	//-- lọc theo khách hàng cụ thể và có giới hạn số lượng ngày tháng--//
	if isnull(vdb_qty) then vdb_qty = 0
	if isnull(vdb_object_id) then vdb_object_id = 0
	ls_filter = string(vdb_qty) + " between from_qty and to_qty and date('" + string(vd_trans_date) + "') between f_date and t_date "
	ls_filter_customer = " and APPLIED_OBJECT_ID = " + string(vdb_object_id) + " and object_applied_type = "+"'"+"spec"+"'" //+ " and (APPLIED_OBJECT_STAFF = " + string(vdb_sales_person) + " or STAFF_MANAGE_GROUP = " + string(ldb_staff_group) + ")"
	lds_sales_price.setfilter( ls_filter + ls_filter_customer)
	lds_sales_price.filter( )
	if lds_sales_price.rowcount( ) > 0 then
		if isnull(vdb_sales_person) then vdb_sales_person = 0
		//-- lấy giá bán theo nhân viên --//
		ll_find_staff = lds_sales_price.find( "APPLIED_OBJECT_STAFF = " + string(vdb_sales_person), 1, lds_sales_price.rowcount( ))
		if ll_find_staff = 0 then
			//-- lấy giá bán theo nhóm nhân viên --//
			ll_find_staff = lds_sales_price.find( "STAFF_MANAGE_GROUP = " + string(ldb_staff_group), 1, lds_sales_price.rowcount( ))
			if ll_find_staff = 0 then
				//-- lấy giá theo tất cả nhân viên--//
				ll_find_staff = lds_sales_price.find( "staff_applied_type = 'all'", 1, lds_sales_price.rowcount( ))
			end if
		end if
		if ll_find_staff > 0 then 
			rdb_wholesales_price = lds_sales_price.getitemnumber( ll_find_staff, 'wholesales_price')
			lb_got_price = true
		end if
	else
		//-- lọc theo nhóm khách hàng --//
		ls_filter_customer = " and object_applied_type = 'group'"
		lds_sales_price.setfilter( ls_filter + ls_filter_customer)
		lds_sales_price.filter( )
		if lds_sales_price.rowcount( ) > 0 then
			//-- chưa xử lý nhóm khách hàng--//
		else
			//-- lọc theo tất cả khách hàng --//
			ls_filter_customer = " and object_applied_type = 'all'"
			lds_sales_price.setfilter( ls_filter + ls_filter_customer)
			lds_sales_price.filter( )
			if lds_sales_price.rowcount( ) > 0 then
				//-- lấy giá bán theo nhân viên --//
				ll_find_staff = lds_sales_price.find( "APPLIED_OBJECT_STAFF = " + string(vdb_sales_person), 1, lds_sales_price.rowcount( ))
				if ll_find_staff = 0 then
					//-- lấy giá bán theo nhóm nhân viên --//
					ll_find_staff = lds_sales_price.find( "STAFF_MANAGE_GROUP = " + string(ldb_staff_group), 1, lds_sales_price.rowcount( ))
					if ll_find_staff = 0 then
						//-- lấy giá theo tất cả nhân viên--//
						ll_find_staff = lds_sales_price.find( "staff_applied_type = 'all'", 1, lds_sales_price.rowcount( ))
					end if
					//-- chưa xử lý trường hợp lấy giá bán theo nhân viên trong khoảng thời gian từ ngày đến ngày--//
				end if 
				if ll_find_staff > 0 then 
					rdb_wholesales_price = lds_sales_price.getitemnumber( ll_find_staff, 'wholesales_price')
					lb_got_price = true
				end if
			end if
		end if
	end if
	lds_sales_price.setsort( " f_date desc")
	lds_sales_price.sort( )
	//-- lọc theo tự̀ ngày đến ngày , áp dụng tất cả, khổng theo số lượng --//
	if not lb_got_price then
		ls_filter = "if(isnull(from_qty),0,from_qty ) = 0 and if(isnull(to_qty),0,to_qty ) = 0  and if(isnull(f_date),0,if(f_date = date('01/01/1900'),0,1)) = 1 and if(isnull(t_date),0,if(t_date = date('01/01/1900'),0,1)) = 1  "
		lds_sales_price.setfilter( ls_filter)
		lds_sales_price.filter( )
		if lds_sales_price.rowcount( ) > 0 then
			ls_filter =  "staff_applied_type = 'all' and  object_applied_type = 'all ' and date('" + string(vd_trans_date) + "') between f_date and t_date"
			ll_find = lds_sales_price.find( ls_filter, 1, lds_sales_price.rowcount( ))
			if ll_find > 0 then
				rdb_wholesales_price = lds_sales_price.getitemnumber( ll_find, 'wholesales_price')
				lb_got_price = true
			end if
		end if
	end if
	//-- loc theo từ ngày chưa biết ngày hết hạn , áp dụng tất cả, không theo số lượng  --//
	if not lb_got_price then
		ls_filter = "if(isnull(from_qty),0,from_qty ) = 0 and if(isnull(to_qty),0,to_qty ) = 0  and if(isnull(f_date),0,if(f_date = date('01/01/1900'),0,1)) = 1 and if(isnull(t_date),0,if(t_date = date('01/01/1900'),0,1)) = 0  "
		lds_sales_price.setfilter( ls_filter)
		lds_sales_price.filter( )
		if lds_sales_price.rowcount( ) > 0 then
			ls_filter =  "staff_applied_type = 'all' and  object_applied_type = 'all ' and date('" + string(vd_trans_date) + "') between f_date and date('" +lc_datetime.f_getsysdate('dd/mm/yyyy' ) + "')"
			ll_find = lds_sales_price.find( ls_filter, 1, lds_sales_price.rowcount( ))
			if ll_find > 0 then
				rdb_wholesales_price = lds_sales_price.getitemnumber( ll_find, 'wholesales_price')
				lb_got_price = true
			end if
		end if
	end if
	//-- loc theo từ ngày chưa biết ngày hết hạn , áp dụng cụ thể object, không theo số lượng  --//
	if not lb_got_price then
		ls_filter = "if(isnull(from_qty),0,from_qty ) = 0 and if(isnull(to_qty),0,to_qty ) = 0  and if(isnull(f_date),0,if(f_date = date('01/01/1900'),0,1)) = 1 and if(isnull(t_date),0,if(t_date = date('01/01/1900'),0,1)) = 0  "
		lds_sales_price.setfilter( ls_filter)
		lds_sales_price.filter( )
		if lds_sales_price.rowcount( ) > 0 then
			ls_filter =  "staff_applied_type = 'all' and date('" + string(vd_trans_date) + "') between f_date and date('" +lc_datetime.f_getsysdate('dd/mm/yyyy' ) + "')" 
			ls_filter_customer = " and APPLIED_OBJECT_ID = " + string(vdb_object_id) + " and object_applied_type = "+"'"+"spec"+"'"
			ll_find = lds_sales_price.find( ls_filter + ls_filter_customer, 1, lds_sales_price.rowcount( ))
			if ll_find > 0 then
				rdb_wholesales_price = lds_sales_price.getitemnumber( ll_find, 'wholesales_price')
				lb_got_price = true
			end if
		end if
	end if
	//-- lọc theo từ số lượng chưa biết đến số lượng giới hạn, áp dụng tất cả, không theo ngày áp dụng --//
	if not lb_got_price then
		//-- chưa xử lý --//
	end if
	//-- lọc không theo giới hạn số lượng và ngày tháng và áp dụng cho tất cả--//
	if not lb_got_price then
		ls_filter = "if(isnull(from_qty),0,from_qty ) = 0 and if(isnull(to_qty),0,to_qty ) = 0 and if(isnull(f_date),0,if(f_date = date('01/01/1900'),0,1)) = 0 and if(isnull(t_date),0,if(t_date = date('01/01/1900'),0,1)) = 0"
		lds_sales_price.setfilter( ls_filter)
		lds_sales_price.filter( )
		if lds_sales_price.rowcount( ) > 0 then
			ll_find = lds_sales_price.find( "staff_applied_type = 'all' and  object_applied_type = 'all'", 1, lds_sales_price.rowcount( ))
			if ll_find > 0 then
				rdb_wholesales_price = lds_sales_price.getitemnumber( ll_find, 'wholesales_price')
				lb_got_price = true
			end if
		end if
	end if
elseif upper(vs_price_type) = 'PURCHASE' then
	if ll_retrieve > 0 then
		//--lọc theo từ ngày--//
		lds_sales_price.setfilter( "if(isnull(f_date),0,1) = 1 ")
		lds_sales_price.filter( )
		if lds_sales_price.rowcount( ) = 0 then
			//-- không có giới hạn ngày --//
			lds_sales_price.setfilter( "if(isnull(f_date),0,1) = 0 ")
			lds_sales_price.filter( )
			rdb_wholesales_price = lds_sales_price.getitemnumber( lds_sales_price.rowcount( ), 'wholesales_price')
		else
			lds_sales_price.setfilter( " f(isnull(f_date),0,1) = 1  and APPLIED_OBJECT_ID = " + string(vdb_object_id) + " and object_applied_type = "+"'"+"spec"+"'")
			lds_sales_price.filter( )
			if lds_sales_price.rowcount( ) > 0 then
				lds_sales_price.setsort("F_DATE asc")
				lds_sales_price.sort( )
				rdb_wholesales_price = lds_sales_price.getitemnumber( lds_sales_price.rowcount( ), 'wholesales_price')
			end if
		end if
	end if
end if
destroy lds_sales_price
destroy lds_setup_dw
return 0
end function

public function double f_get_cust_balance (double vdb_cust_id, double vdb_curr_id, date vd_date);double	ldb_amout
int 		li_cnt


select count(ob.id) into :li_cnt
 from object_balance ob 
 where ob.object_id = :vdb_cust_id 
 and ob.balance_date = :vd_date 
 and ob.TRANS_CURRENCY = :vdb_curr_id using sqlca;
 
 if li_cnt = 1 then
	select nvl(ob.open_trans_amount, 0) + nvl(DR_TRANS_AMOUNT, 0) -  nvl(CR_TRANS_AMOUNT, 0)
	into :ldb_amout
	 from object_balance ob 
	 where ob.object_id = :vdb_cust_id 
	 and ob.balance_date = :vd_date 
	 and ob.TRANS_CURRENCY = :vdb_curr_id using sqlca;
	
	return ldb_amout
else
//	gf_messagebox('m.b_
	return 0
end if
end function

public function integer f_get_link_item (double vdb_item_id, double vdb_spec_id, ref double vadb_lnk_item[], ref double vadb_lnk_spec[], ref double vadb_lnk_qty[], ref t_transaction rt_transaction);any					laa_data[]
long					ll_cnt, ll_row
double				ldb_object_ref_id, ldb_item_qty, ldb_catch_qty, ldb_catch_uom, ldb_round_id
t_ds_db				lds_item_link
c_unit_instance		lc_unit_instance

if isnull(vdb_item_id) or vdb_item_id = 0 then
	gf_messagebox('m.c_item.f_get_link_item.01','Thông báo','ID mã sản phẩm (dịch vụ) la 0 hoặc rỗng','exclamation','ok',1)
	return -1
end if
select id into :ldb_object_ref_id from item where object_ref_id = :vdb_item_id using sqlca;

if sqlca.sqlcode = 100 then 
	gf_messagebox('m.c_item.f_get_link_item.02','Thông báo','Không tìm thấy Mã SP/DV có ID:@'+string(vdb_item_id),'exclamation','ok',1)
	return 0
elseif sqlca.sqlcode = -1 then
	gf_messagebox('m.c_item.f_get_link_item.03','Thông báo','Lõi truy vấn database:@'+ sqlca.sqlerrtext ,'exclamation','ok',1)
	return -1	
end if

lds_item_link = create t_ds_db
lds_item_link.dataobject = 'd_item_catch_grid'
lds_item_link.f_settransobject( sqlca)
laa_data[1] = ldb_object_ref_id
if vdb_spec_id > 0 then laa_data[2] = vdb_spec_id
lds_item_link.f_add_where( 'object_ref_id', laa_data[])

ll_cnt = lds_item_link.retrieve( )
FOR ll_row = 1 to ll_cnt
	vadb_lnk_item[ll_row] = lds_item_link.getitemnumber( ll_row, 'catch_item')
	vadb_lnk_spec[ll_row] = lds_item_link.getitemnumber( ll_row, 'catch_spec')
	ldb_item_qty =  lds_item_link.getitemnumber( ll_row, 'item_qty')
	if isnull(ldb_item_qty) then ldb_item_qty =1
	ldb_catch_qty =  lds_item_link.getitemnumber( ll_row, 'catch_qty')
	if isnull(ldb_catch_qty) then ldb_catch_qty = 0
	ldb_catch_uom =  lds_item_link.getitemnumber( ll_row, 'catch_uom')
	ldb_round_id = lc_unit_instance.f_get_round_id( ldb_catch_uom, vadb_lnk_item[ll_row], 'item')
	if ldb_round_id = -1 then return -1
	vadb_lnk_qty[ll_row] = lc_unit_instance.f_round( rt_transaction,ldb_round_id , ldb_catch_qty/ldb_item_qty)
NEXT
destroy lds_item_link
return ll_cnt
end function

public function integer f_get_link_item (double vdb_item_id, ref double vadb_lnk_item[], ref double vadb_lnk_spec[], ref double vadb_lnk_qty[], ref t_transaction rt_transaction);
return this.f_get_link_item( vdb_item_id,0, vadb_lnk_item[], vadb_lnk_spec[], vadb_lnk_qty[], rt_transaction)

end function

public function long f_get_bonus_point (string vs_objtype, double vdb_object_id, readonly string vs_doctype, double vb_amount);long		ll_point, ll_cnt
string		ls_objtype
double	ldb_f_level_num , ldb_t_level_num

ls_objtype = vs_objtype
if ls_objtype = '' or ls_objtype <> 'CUSTOMER' then return 0
if vb_amount = 0 or isnull(vb_amount) then return 0

//-- kiểm tra có cài đặt loyalty chưa --//
select count(id) into :ll_cnt from measurement_hdr 
where object_type = :ls_objtype 
and code = 'KHTT'
and doc_type = :vs_doctype using sqlca;
if ll_cnt <> 1 then return 0

select f_level_num, t_level_num into :ldb_f_level_num , :ldb_t_level_num
from measurement_hdr 
left join measurement_line on measurement_line.object_ref_id = measurement_hdr.id and measurement_line.leveltype = 'bonus_point'
where measurement_hdr.object_type = :ls_objtype 
and measurement_hdr.code = 'KHTT'
and measurement_hdr.doc_type = :vs_doctype using sqlca;

if ldb_f_level_num = 0 or isnull(ldb_f_level_num) then return 0
if ldb_t_level_num = 0 or isnull(ldb_t_level_num) then return 0

ll_point = round(vb_amount*ldb_t_level_num/ldb_f_level_num,0 )

return ll_point
end function

public function double f_convert_loyalty_point2amount (string vs_objtype, double vdb_object_id, readonly string vs_doctype, long vl_point);long		ll_cnt
string		ls_objtype
double	ldb_f_level_num , ldb_t_level_num, ldb_amt

ls_objtype = vs_objtype
if ls_objtype = '' or ls_objtype <> 'CUSTOMER' then return 0
if vl_point = 0 or isnull(vl_point) then return 0

//-- kiểm tra có cài đặt loyalty chưa --//
select count(id) into :ll_cnt from measurement_hdr 
where object_type = :ls_objtype 
and code = 'KHTT'
and doc_type = :vs_doctype using sqlca;
if ll_cnt <> 1 then return 0

select f_level_num, t_level_num into :ldb_f_level_num , :ldb_t_level_num
from measurement_hdr 
left join measurement_line on measurement_line.object_ref_id = measurement_hdr.id and measurement_line.leveltype = 'used_point'
where measurement_hdr.object_type = :ls_objtype 
and measurement_hdr.code = 'KHTT'
and measurement_hdr.doc_type = :vs_doctype using sqlca;

if ldb_f_level_num = 0 or isnull(ldb_f_level_num) then return 0
if ldb_t_level_num = 0 or isnull(ldb_t_level_num) then return 0

ldb_amt = round(vl_point*ldb_t_level_num/ldb_f_level_num,0 )

return ldb_amt
end function

public function long f_get_balance_point (string vs_objtype, double vdb_object_id);long		ll_point, ll_cnt
string		ls_objtype
double	ldb_f_level_num , ldb_t_level_num
date		ld_today
ls_objtype = vs_objtype
if ls_objtype = '' or ls_objtype <> 'CUSTOMER' then return 0


ld_today = today()
select count(vmb.close_base_amount)  into :ll_cnt 
from V_MEASUREMENT_BAL vmb
 where vmb.OBJECT_ID = :vdb_object_id
	  and vmb.BALANCE_DATE = :ld_today
	  and vmb.company_id = :gi_user_comp_id
	  and vmb.branch_id = :gdb_branch
	  and vmb.CODE = 'KHTT'   using sqlca;
	  
if ll_cnt = 1 then
	select close_base_amount into :ll_point 
	from V_MEASUREMENT_BAL vmb
	 where vmb.OBJECT_ID = :vdb_object_id
		  and vmb.BALANCE_DATE = :ld_today
		  and vmb.company_id = :gi_user_comp_id
		  and vmb.branch_id = :gdb_branch
		  and vmb.CODE = 'KHTT'   using sqlca;
		  
  return ll_point
else
	return 0
end if

end function

public function boolean f_isvalid_date_range_itemchanged (t_dw_mpl vdw_handle, long vl_row, string vs_editdata, string vs_editcolname, string vs_fdate_colname, string vs_tdate_colname);/************************************************************************************
Chức năng: dùng trong sự kiện itemchanged , kiểm tra ngày nhập vào có hợp lệ theo logic thời gian từ ngày tời ngày
				- từ ngày phải <= tới ngày
===========================================================================*/

date		ld_fdate, ld_tdate



if not isvalid(vdw_handle) or vdw_handle.rowcount() = 0 then return true
if vs_editcolname <> vs_fdate_colname and vs_editcolname <> vs_tdate_colname then 
	gf_messagebox('m.b_obj_instantiate.f_isvalid_date_range_itemchanged.01','Thông báo','Cột ngày kiểm tra phải là cốt <Từ ngày> hoặc <Tới ngày>:@'+&
						 vs_editcolname,'exclamation','ok',1) 
	return false 
end if
//-- lấy dữ liệu --//
if vs_editdata = '' or isnull(vs_editdata) then
	if vs_editcolname = vs_fdate_colname then
		setnull(ld_fdate)
		ld_tdate = date(vdw_handle.getitemdatetime(vl_row,vs_tdate_colname))
	else
		setnull(ld_tdate)
		ld_fdate = date(vdw_handle.getitemdatetime(vl_row,vs_fdate_colname))			
	end if
else
	if vs_editcolname = vs_fdate_colname then
		ld_fdate = date( vs_editdata)
		ld_tdate = date(vdw_handle.getitemdatetime(vl_row,vs_tdate_colname))
	else
		ld_tdate = date( vs_editdata)
		ld_fdate = date(vdw_handle.getitemdatetime(vl_row,vs_fdate_colname))			
	end if		
end if


//-- check --//
if isnull(ld_fdate) and  isnull(ld_tdate) then 
	return true
elseif not isnull(ld_fdate) and  isnull(ld_tdate) then
	return true
elseif ld_fdate <= ld_tdate then
	return true
else
	gf_messagebox('m.b_obj_instantiate.f_isvalid_date_range_itemchanged.02','Thông báo','<@'+vs_fdate_colname+'@> phải lớn hơn <@'+ vs_tdate_colname+'@>','exclamation','ok',1) 		
	return false
end if


end function

public function boolean f_isvalid_date_range_updatestart (t_dw_mpl vdw_handle, string vs_fdate_colname, string vs_tdate_colname);/************************************************************************************
Chức năng: dùng trong sự kiện updatestart , kiểm tra ngày nhập vào có hợp lệ theo logic thời gian từ ngày tời ngày
				- trong range ngày nhập vào không có có dòng nào chồng lấn ngày
===========================================================================*/
long		ll_row,ll_null_cnt
date		ld_tdate, ld_fdate
t_ds_db	lds_handle


if not isvalid(vdw_handle) or vdw_handle.rowcount() <= 1 then return true
lds_handle = create t_ds_db
lds_handle.dataobject  = vdw_handle.dataobject 
vdw_handle.RowsCopy(1,  vdw_handle.RowCount(), Primary!, lds_handle, 1, Primary!)

lds_handle.setsort(vs_fdate_colname + ' asc' )
lds_handle.sort( )

For ll_row = 1 to lds_handle.rowcount()
	ld_fdate = date(lds_handle.getitemdatetime( ll_row, vs_fdate_colname))
	ld_tdate = date(lds_handle.getitemdatetime( ll_row, vs_tdate_colname))	
	if isnull(ld_tdate) and not isnull(ld_fdate) then ll_null_cnt++
	if ll_null_cnt > 1 then 
		gf_messagebox('m.b_obj_instantiate.f_isvalid_date_range_updatestart.01','Thông báo','Không được bỏ trống 2 dòng cột <tới ngày>','exclamation','ok',1) 		
		return false		
	end if
	if ll_row <   lds_handle.rowcount() then
		ld_fdate = date(lds_handle.getitemdatetime( ll_row+1, vs_fdate_colname))
		if isnull(ld_fdate) and isnull(ld_tdate) then
			if not isnull(date(lds_handle.getitemdatetime( ll_row+1, vs_tdate_colname))) then
				gf_messagebox('m.b_obj_instantiate.f_isvalid_date_range_updatestart.02','Thông báo','Ngày hiệu lực bỏ trống không hợp lệ','exclamation','ok',1) 		
				return false		
			end if
		end if
		if not isnull(ld_fdate) and isnull(ld_tdate) then
			gf_messagebox('m.b_obj_instantiate.f_isvalid_date_range_updatestart.02','Thông báo','Ngày hiệu lực bỏ trống không hợp lệ','exclamation','ok',1) 		
			return false						
		end if			
		if isnull(ld_fdate) and not isnull(ld_tdate) then
			gf_messagebox('m.b_obj_instantiate.f_isvalid_date_range_updatestart.02','Thông báo','Ngày hiệu lực bỏ trống không hợp lệ','exclamation','ok',1) 		
			return false						
		end if		
		if ld_fdate <= ld_tdate then
			gf_messagebox('m.b_obj_instantiate.f_isvalid_date_range_updatestart.03','Thông báo','Ngày hiệu lực bị chồng lấn vào nhau','exclamation','ok',1) 		
			return false
		end if
	end if
next
return true
end function

public function integer f_get_cus_info (long vl_acctno, ref double rdb_cus_id, ref string rs_cus_name, ref double rdb_payment_method, ref string rs_payment_method_name, ref double rdb_currency_id, ref string rs_currency_code, ref string rs_cardnumber, ref string rs_rt_tel_no, ref string rs_address, ref double rdb_credit_limit);long		ll_cnt

if vl_acctno > 0 then
	
	select count(obj.id) into :ll_cnt   
	from object obj 
	left join customer cus on cus.object_ref_id = obj.id
	left join customer_link on customer_link.object_ref_id = obj.id
	left join valueset_value vv on vv.id = cus.PAYMENT_METHOD
	left join uom on uom.id = cus.DEFAULT_CURRENCY
	left join business_address addr on addr.object_ref_id = cus.id 
	where cus.acctno = :vl_acctno and obj.active_yn = 'Y' using SQLCA;
	
	if ll_cnt = 1 then
		select obj.id, obj.name,  vv.id, vv.name,uom.id, uom.code,cus.CARDNUMBER,cus.RT_TEL_NO,addr.address, customer_link.CREDIT_LIMIT
			into :rdb_cus_id, :rs_cus_name, :rdb_PAYMENT_METHOD, :rs_PAYMENT_METHOD_name, :rdb_currency_id, :rs_currency_code, :rs_CARDNUMBER, :rs_RT_TEL_NO, :rs_address, :rdb_credit_limit
		from object obj 
		left join customer cus on cus.object_ref_id = obj.id
		left join customer_link on customer_link.object_ref_id = obj.id
		left join valueset_value vv on vv.id = cus.PAYMENT_METHOD
		left join uom on uom.id = cus.DEFAULT_CURRENCY
		left join business_address addr on addr.object_ref_id = cus.id 
		where cus.acctno = :vl_acctno and obj.active_yn = 'Y' using SQLCA;
	else
		return -1
	end if
end if
return 0
end function

public function integer f_get_retail_price_dev (double vdb_item_id, double vdb_qty, double vdb_currency_id, string vs_dwo_price, string vs_price_type, date vd_trans_date, double vdb_object_id, double vdb_sales_person, ref double rdb_retail_price, ref double rdb_disc_pct);long				ll_row_cnt, ll_found
any				laa_data[]
string				ls_findstr_date, ls_findStr_cust
double			ldb_manage_grp_cust, ldb_price_cust, ldb_disc_cust, ldb_price_qty, ldb_disc_qty, ldb_t_qty
date				ld_tdate
boolean			lb_found_price_cust, lb_found_price_qty
t_ds_db			lds_sales_price


//-- lấy nhóm khách hàng(chưa lấy) --//
laa_data[1] = vdb_item_id
laa_data[2] = upper(vs_price_type)
laa_data[3] = vdb_currency_id
lds_sales_price = create t_ds_db
lds_sales_price.dataobject = vs_dwo_price
lds_sales_price.f_settransobject( SQLCA)
lds_sales_price.f_add_where( 'item_id;price_type;currency_id', laa_data)
ll_row_cnt = lds_sales_price.retrieve( )

if ll_row_cnt = 0 then return 0
if isnull(vd_trans_date) then return 0

if upper(vs_price_type) = 'SALES' then

	//-- giá theo khách hàng --//
	ls_findStr_cust =  " APPLIED_OBJECT_ID = " + string(vdb_object_id) + " and object_applied_type = 'spec' "
	ll_found = lds_sales_price.find( ls_findStr_cust, 1, ll_row_cnt)
	DO while ll_found > 0 
		ld_tdate = date(lds_sales_price.getitemdatetime( ll_found, 'T_DATE'))
		if isnull(ld_tdate) or ld_tdate >= vd_trans_date  then
			ldb_t_qty =  lds_sales_price.getitemnumber( ll_found, 'TO_QTY')
			if isnull(ldb_t_qty) or ldb_t_qty = 0 or ldb_t_qty >= vdb_qty then
				ldb_price_cust = lds_sales_price.getitemnumber( ll_found, 'RETAIL_PRICE')
				ldb_disc_cust = lds_sales_price.getitemnumber( ll_found, 'DISCOUNT_PCT')
				if isnull(ldb_disc_cust) then ldb_disc_cust = 0
				lb_found_price_cust = true
				exit
			end if
		end if
		
		ll_found = lds_sales_price.find( ls_findStr_cust, ll_found, ll_row_cnt+1)
	LOOP
	
	
	if not lb_found_price_cust then
		if this.f_init_object(vdb_object_id) = 1 then
			ldb_manage_grp_cust = this.ids_attribute.getitemnumber( 1, 'MANAGE_GROUP')
			if isnull(ldb_manage_grp_cust) then ldb_manage_grp_cust = 0
		end if
		ls_findStr_cust =  " APPLIED_OBJECT_ID = " + string(ldb_manage_grp_cust) + " and object_applied_type = 'group' "	
		ll_found = lds_sales_price.find( ls_findStr_cust, 1, ll_row_cnt)
		
		DO while ll_found > 0 
			ld_tdate = date(lds_sales_price.getitemdatetime( ll_found, 'T_DATE'))
			if isnull(ld_tdate) or ld_tdate >= vd_trans_date  then
				ldb_t_qty =  lds_sales_price.getitemnumber( ll_found, 'TO_QTY')
				if isnull(ldb_t_qty) or ldb_t_qty = 0 or ldb_t_qty >= vdb_qty then
					ldb_price_cust = lds_sales_price.getitemnumber( ll_found, 'RETAIL_PRICE')
					ldb_disc_cust = lds_sales_price.getitemnumber( ll_found, 'DISCOUNT_PCT')
					if isnull(ldb_disc_cust) then ldb_disc_cust = 0
					lb_found_price_cust = true
					exit
				end if
			end if
			
			ll_found = lds_sales_price.find( ls_findStr_cust, ll_found, ll_row_cnt+1)
		LOOP
	end if		
	
	//-- giá theo số lượng và không phụ thuộc khách hàng--//
	ls_findStr_cust =  "object_applied_type = 'all' or isnull(object_applied_type) "
	ll_found = lds_sales_price.find( ls_findStr_cust, 1, ll_row_cnt)
	DO while ll_found > 0 
		ld_tdate = date(lds_sales_price.getitemdatetime( ll_found, 'T_DATE'))
		if isnull(ld_tdate) or ld_tdate >= vd_trans_date  then
			ldb_t_qty =  lds_sales_price.getitemnumber( ll_found, 'TO_QTY')
			if isnull(ldb_t_qty) or ldb_t_qty = 0 or ldb_t_qty >= vdb_qty then
				ldb_price_qty = lds_sales_price.getitemnumber( ll_found, 'RETAIL_PRICE')
				ldb_disc_qty = lds_sales_price.getitemnumber( ll_found, 'DISCOUNT_PCT')
				if isnull(ldb_disc_qty) then ldb_disc_qty = 0
				lb_found_price_qty = true
				exit
			end if
		end if
		
		ll_found = lds_sales_price.find( ls_findStr_cust, ll_found, ll_row_cnt+1)
	LOOP

	//-- giá áp dụng --//
	if lb_found_price_cust and lb_found_price_qty then
		if ldb_price_qty - ldb_price_qty*ldb_disc_qty >  ldb_price_cust - ldb_price_qty*ldb_disc_cust then
			rdb_retail_price = ldb_price_cust
			rdb_disc_pct = ldb_disc_cust
		else
			rdb_retail_price = ldb_price_qty
			rdb_disc_pct = ldb_disc_qty			
		end if
		return 1
	elseif lb_found_price_cust then
		rdb_retail_price = ldb_price_cust
		rdb_disc_pct = ldb_disc_cust		
		return 1
	elseif lb_found_price_qty then
		rdb_retail_price = ldb_price_qty
		rdb_disc_pct = ldb_disc_qty				
		return 1
	else
		return 0
	end if
elseif upper(vs_price_type) = 'PURCHASE' then
	return 1
end if


end function

public function integer f_get_retail_price (double vdb_item_id, double vdb_qty, double vdb_currency_id, string vs_dwo_price, string vs_price_type, date vd_trans_date, double vdb_object_id, double vdb_sales_person, ref double rdb_retail_price, ref double rdb_disc_pct);long				ll_row_cnt, ll_found, ll_found_qty
any				laa_data[]
string				ls_findstr_qty, ls_findStr_cust, ls_findStr_date, ls_findStr
double			ldb_manage_grp_cust, ldb_price_cust, ldb_disc_cust, ldb_price_qty, ldb_disc_qty, ldb_t_qty
date				ld_tdate
boolean			lb_found_price_cust, lb_found_price_qty
t_ds_db			lds_sales_price


//-- lấy nhóm khách hàng(chưa lấy) --//
laa_data[1] = vdb_item_id
laa_data[2] = upper(vs_price_type)
laa_data[3] = vdb_currency_id
lds_sales_price = create t_ds_db
lds_sales_price.dataobject = vs_dwo_price
lds_sales_price.f_settransobject( SQLCA)
lds_sales_price.f_add_where( 'item_id;price_type;currency_id', laa_data)
ll_row_cnt = lds_sales_price.retrieve( )

if ll_row_cnt = 0 then return 0
if isnull(vd_trans_date) then return 0

if upper(vs_price_type) = 'SALES' then
	
	//-- giá theo khách hàng --//
	ls_findStr_date =  "( '"+string(vd_trans_date ,'yyyymmdd') + "' between string(F_DATE,'yyyymmdd') and string(T_DATE,'yyyymmdd') OR "+&
						  "( isnull(T_DATE) and  string(F_DATE,'yyyymmdd') <= '"+string(vd_trans_date ,'yyyymmdd') +"' ) OR "+&
						  "( isnull(F_DATE)  and isnull(T_DATE) ))"
	ls_findstr_qty = "( "+ string(vdb_qty) + " between if(isnull(FROM_QTY),0, FROM_QTY)   and  TO_QTY  OR "+&
						"( (isnull(FROM_QTY) or FROM_QTY= 0)  and (isnull(TO_QTY) or  TO_QTY =0) ) )" 
	
	ls_findStr_cust =  "( APPLIED_OBJECT_ID = " + string(vdb_object_id) + " and object_applied_type = 'spec' )"
	ls_findStr = ls_findStr_cust +" and " + ls_findstr_qty +" and "+ ls_findStr_date
	ll_found = lds_sales_price.find( ls_findStr, 1, ll_row_cnt)
	
	if  ll_found > 0 then
		ldb_price_cust = lds_sales_price.getitemnumber( ll_found, 'RETAIL_PRICE')
		if isnull(ldb_price_cust) then ldb_price_cust = 0
		ldb_disc_cust = lds_sales_price.getitemnumber( ll_found, 'DISCOUNT_PCT')
		if isnull(ldb_disc_cust) then ldb_disc_cust = 0		
		lb_found_price_cust = true
	else
		if this.f_init_object(vdb_object_id) = 1 then
			ldb_manage_grp_cust = this.ids_attribute.getitemnumber( 1, 'MANAGE_GROUP')
			if isnull(ldb_manage_grp_cust) then ldb_manage_grp_cust = 0
		end if
		ls_findStr_cust =  "( APPLIED_OBJECT_ID = " + string(ldb_manage_grp_cust) + " and object_applied_type = 'group' )"	
		ls_findStr =ls_findStr_cust +" and " + ls_findstr_qty +" and "+ ls_findStr_date
		ll_found = lds_sales_price.find( ls_findStr, 1, ll_row_cnt)
		if  ll_found > 0 then
			ldb_price_cust = lds_sales_price.getitemnumber( ll_found, 'RETAIL_PRICE')
			if isnull(ldb_price_cust) then ldb_price_cust = 0
			ldb_disc_cust = lds_sales_price.getitemnumber( ll_found, 'DISCOUNT_PCT')
			if isnull(ldb_disc_cust) then ldb_disc_cust = 0		
			lb_found_price_cust = true
		end if 
	end if
	
	//-- giá theo số lượng và không phụ thuộc khách hàng--//
	ls_findStr_cust =  "(object_applied_type = 'all' or isnull(object_applied_type) )"
	ls_findStr = ls_findStr_cust + " and " + ls_findstr_qty + " and " + ls_findStr_date
	ll_found = lds_sales_price.find( ls_findStr, 1, ll_row_cnt)
	if ll_found > 0 then
		ldb_price_qty = lds_sales_price.getitemnumber( ll_found, 'RETAIL_PRICE')
		if isnull(ldb_price_qty) then ldb_price_qty = 0
		ldb_disc_qty = lds_sales_price.getitemnumber( ll_found, 'DISCOUNT_PCT')
		if isnull(ldb_disc_qty) then ldb_disc_qty = 0
		lb_found_price_qty = true		
	end if 
	
	//-- giá áp dụng --//
	if lb_found_price_cust and lb_found_price_qty then
		if ldb_price_qty - ldb_price_qty*ldb_disc_qty >  ldb_price_cust - ldb_price_qty*ldb_disc_cust then
			rdb_retail_price = ldb_price_cust
			rdb_disc_pct = ldb_disc_cust
		else
			rdb_retail_price = ldb_price_qty
			rdb_disc_pct = ldb_disc_qty			
		end if
		return 1
	elseif lb_found_price_cust then
		rdb_retail_price = ldb_price_cust
		rdb_disc_pct = ldb_disc_cust		
		return 1
	elseif lb_found_price_qty then
		rdb_retail_price = ldb_price_qty
		rdb_disc_pct = ldb_disc_qty				
		return 1
	else
		return 0
	end if
elseif upper(vs_price_type) = 'PURCHASE' then
	return 1
end if


end function

public function boolean f_isvalid_qty_range_itemchanged (t_dw_mpl vdw_handle, long vl_row, string vs_editdata, string vs_editcolname, string vs_fqty_colname, string vs_tqty_colname);/************************************************************************************
Chức năng: dùng trong sự kiện itemchanged , kiểm tra số lượng nhập vào có hợp lệ theo logic từ nhỏ tới lớn
				- từ SL phải < tới SL
===========================================================================*/

double		ldb_fqty, ldb_tqty



if not isvalid(vdw_handle) or vdw_handle.rowcount() = 0 then return true
if vs_editcolname <> vs_fqty_colname and vs_editcolname <> vs_tqty_colname then 
	gf_messagebox('m.b_obj_instantiate.f_isvalid_date_range_itemchanged.01','Thông báo','Cột ngày kiểm tra phải là cốt <Từ SL> hoặc <Tới SL>:@'+&
						 vs_editcolname,'exclamation','ok',1) 
	return false 
end if
//-- lấy dữ liệu --//
if vs_editdata = '' or isnull(vs_editdata) then
	if vs_editcolname = vs_fqty_colname then
		ldb_tqty = vdw_handle.getitemnumber(vl_row,vs_tqty_colname)
		if isnull(ldb_tqty) then ldb_tqty = 0
	else
		ldb_fqty = vdw_handle.getitemnumber(vl_row,vs_fqty_colname)		
		if isnull(ldb_fqty) then ldb_fqty = 0
	end if
else
	if vs_editcolname = vs_fqty_colname then
		ldb_fqty = double( vs_editdata)
		ldb_tqty = vdw_handle.getitemnumber(vl_row,vs_tqty_colname)
		if isnull(ldb_tqty) then ldb_tqty = 0
	else
		ldb_tqty = double( vs_editdata)
		ldb_fqty = vdw_handle.getitemnumber(vl_row,vs_fqty_colname)		
		if isnull(ldb_fqty) then ldb_fqty = 0
	end if		
end if


//-- check --//
if  ldb_fqty=0 and  ldb_tqty = 0 then 
	return true
elseif   ldb_fqty > 0 and  ldb_tqty = 0 then 
	return true
elseif ldb_fqty < ldb_tqty then
	return true
else
	gf_messagebox('m.b_obj_instantiate.f_isvalid_date_range_itemchanged.02','Thông báo','<@'+vs_fqty_colname+'@> phải lớn hơn <@'+ vs_tqty_colname+'@>','exclamation','ok',1) 		
	return false
end if


end function

public function boolean f_isvalid_qty_range_updatestart (t_dw_mpl vdw_handle, string vs_fqty_colname, string vs_tqty_colname);/************************************************************************************
Chức năng: dùng trong sự kiện updatestart , kiểm tra ngày nhập vào có hợp lệ theo logic thời gian từ ngày tời ngày
				- trong range ngày nhập vào không có có dòng nào chồng lấn ngày
===========================================================================*/
long		ll_row
double		ldb_tqty, ldb_fqty
t_ds_db	lds_handle


if not isvalid(vdw_handle) or vdw_handle.rowcount() <= 1 then return true
lds_handle = create t_ds_db
lds_handle.dataobject  = vdw_handle.dataobject 
vdw_handle.RowsCopy(1,  vdw_handle.RowCount(), Primary!, lds_handle, 1, Primary!)

lds_handle.setsort(vs_tqty_colname + ' asc' )
lds_handle.sort( )

For ll_row = 1 to lds_handle.rowcount()
	ldb_fqty = lds_handle.getitemnumber( ll_row, vs_fqty_colname)
	if isnull(ldb_fqty) then ldb_fqty = 0
	ldb_tqty = lds_handle.getitemnumber( ll_row, vs_tqty_colname)
	if isnull(ldb_tqty) then ldb_tqty = 0
	if ldb_fqty > ldb_tqty then
		gf_messagebox('m.b_obj_instantiate.f_isvalid_date_range_updatestart.01','Thông báo','<Từ SL> phải nhỏ hơn <Tới SL>','exclamation','ok',1) 		
		return false
	end if

	if ll_row <   lds_handle.rowcount() then
		ldb_fqty = lds_handle.getitemnumber( ll_row+1, vs_fqty_colname) 
		if isnull(ldb_fqty) then ldb_fqty = 0
		
		if ldb_fqty <= ldb_tqty then
			if lds_handle.getitemnumber( ll_row+1, vs_tqty_colname) > 0 then
				gf_messagebox('m.b_obj_instantiate.f_isvalid_date_range_updatestart.02','Thông báo','Số lượng hiệu lực bị chồng lấn vào nhau','exclamation','ok',1) 		
				return false
			end if
		end if
	end if
next
end function

public function double f_get_bom_line (double vdb_bom_id, double vdb_qty, date vd_trans_date);double	ldb_id

select count(object.id) into :ldb_id 
from bom_line 
join object on bom_line.object_ref_id = object.version_id
where object.id = :vdb_bom_id using sqlca;

if ldb_id > 0 then
	select bom_line.id into :ldb_id 
	from bom_line 
	join object on bom_line.object_ref_id = object.version_id
	where object.id = :vdb_bom_id using sqlca;	
end if

return ldb_id
end function

public function double f_get_bom_product (double vdb_bom_id);double	ldb_id

select count(object.id) into :ldb_id 
from item 
join object on item.id = object.version_id and item.ITEM_TYPE = 'ITEM'
where object.id = :vdb_bom_id using sqlca;

if ldb_id > 0 then
	select item.item_id into :ldb_id 
	from item 
	join object on item.id = object.version_id and item.ITEM_TYPE = 'ITEM'
	where object.id = :vdb_bom_id using sqlca;	
end if

return ldb_id
end function

public function double f_get_bom_version_id (double vdb_bom_id);double	ldb_id

select count(object.id) into :ldb_id 
from item 
join object on item.id = object.version_id 
where object.id = :vdb_bom_id using sqlca;

if ldb_id > 0 then
	select object.version_id into :ldb_id 
	from item 
	join object on item.id = object.version_id 
	where object.id = :vdb_bom_id using sqlca;	
end if

return ldb_id
end function

public function string f_get_bom_type (double vdb_bom_id);int			li_cnt
string		ls_type
select count(object.id) into :li_cnt 
from item 
join object on item.id = object.version_id 
where object.id = :vdb_bom_id using sqlca;

if li_cnt > 0 then
	select item.ITEM_TYPE into :ls_type 
	from item 
	join object on item.id = object.version_id 
	where object.id = :vdb_bom_id using sqlca;	
end if

return ls_type
end function

public function boolean f_is_period_closed (string vs_stop_type, date vd_trans_date, string vs_period_type);int					li_cnt
string				ls_role_user_id,  ls_currentSQL, ls_currentWhere, ls_join, ls_where,   ls_modifySQL, ls_modifyWhere, ls_rtn
any				laa_value[]
c_string			lc_string
c_sql				lc_sql
t_ds_db			lds_period_control
 

select count(id) into :li_cnt from fiscal_period where :vd_trans_date between from_date and to_date using sqlca;

if li_cnt = 0 then
	return true 
end if

select count(ID) into :li_cnt
from fiscal_period
where period_type = upper(:vs_period_type)
	and nvl(closed_yn,'N') = 'Y'
    and  :vd_trans_date between from_date and to_date using sqlca;

if li_cnt = 1 then return true

select count(fpc.ID) into :li_cnt
from fiscal_period_control fpc join fiscal_period on fiscal_period.id = fpc.object_ref_id and fiscal_period.period_type = upper(:vs_period_type)
where fpc.stop_type = 'ALL'
    and  :vd_trans_date between fpc.from_date and fpc.to_date 
	and nvl(fpc.STOP_YN,'N') = 'Y'
	and fpc.ROLE_USER_ID is null using sqlca;
	
if li_cnt = 1 then return true

select count(fpc.ID) into :li_cnt
from fiscal_period_control fpc join fiscal_period on fiscal_period.id = fpc.object_ref_id and fiscal_period.period_type = upper(:vs_period_type)
where stop_type = upper(:vs_stop_type)
    and  :vd_trans_date between fpc.from_date and fpc.to_date 
	and nvl(fpc.STOP_YN,'N') = 'Y'
	and fpc.ROLE_USER_ID is null using sqlca;
	
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
lds_period_control.f_settransobject( sqlca)

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

public function integer f_get_period_first_last_date (date v_trans_date, ref date rd_firstdate, ref date rd_lastdate, string vs_priod_type);int			li_cnt

select count(from_Date)
into :li_cnt
from fiscal_period 
where :v_trans_date between from_date and to_date 
and period_type = upper(:vs_priod_type) using sqlca;

if li_cnt > 0 then
	select from_Date, to_date 
	into :rd_firstdate, :rd_lastdate
	from fiscal_period 
	where :v_trans_date between from_date and to_date 
	and period_type = upper(:vs_priod_type) using sqlca;
	return 1
else
	gf_messagebox('m.c_fiscal_priod.f_get_period_first_last_date.01','Thông báo','Chưa có tạo kỳ  cho ngày:@'+string(v_trans_date),'exclamation','ok',1)
	return -1
end if
end function

public function double f_get_doc_id (double vdb_detail_id, string vs_detail_table);datastore	lds_temp
double		ldb_doc_id
string			ls_sql,ls_modify,ls_rtn,ls_ref_id,ls_ref_table
long			ll_rtn

lds_temp = create datastore
lds_temp.dataobject = 'ds_replace_syntax'
ls_ref_id = string(vdb_detail_id)
ls_ref_table = vs_detail_table
Do 
	ls_sql = "SELECT OBJECT_REF_ID AS ID, '' as criteria_col,'' criteria_val, OBJECT_REF_TABLE AS ref_table, '' as col_of_id" +&
				" FROM "+ls_ref_table+" WHERE ID = "+ls_ref_id
	ls_modify = 'Datawindow.Table.Select= "' + ls_sql +'"'
	ls_rtn = lds_temp.modify(ls_modify )
	lds_temp.settransobject( SQLCA)
	ll_rtn = lds_temp.retrieve( )
	if ll_rtn > 0 then
		ls_ref_id = string(lds_temp.getitemnumber( ll_rtn, 'ID'))
		if isnull(ls_ref_id) or ls_ref_id = '' then exit
		ls_ref_table = lds_temp.getitemstring( ll_rtn, 'ref_table')
	end if
Loop While upper(ls_ref_table) <> 'DOCUMENT' and ll_rtn > 0
if upper(ls_ref_table) = 'DOCUMENT' then
	ldb_doc_id = double(ls_ref_id)
elseif  upper(ls_ref_table) = 'OBJECT'  then
	ldb_doc_id = vdb_detail_id
end if
destroy lds_temp
return ldb_doc_id
end function

public function integer f_stop_period (date vd_sdate, date vd_edate, string vs_period_type, string vs_stop_type);/******************************************************************************************
Chức năng: tạo ra record khóa kỳ (stop) theo tham số :vd_sdate, vd_edate
-----------------------------------------------------------------------------------------

===============================================================================*/
int			li_cnt, li_row, li_insertrow
double	ldb_peroid_id[], ldb_ctrl_id
date		ld_firstdate[], ld_lastdate[]
string		ls_stop
t_ds_db	lds_control


li_cnt =  this.f_get_period_info(vd_sdate , vd_edate, vs_period_type, ldb_peroid_id[], ld_firstdate[],  ld_lastdate[])
if li_cnt > 0 then
	lds_control = create t_ds_db 
	lds_control.dataobject = 'd_fiscal_period_control_grid'
	lds_control.f_settransobject( sqlca)
	
end if
if li_cnt = 1 then
	//-- kiểm tra đã stop kỳ chưa --//
	select count(fpc.ID) into :li_cnt
	from fiscal_period_control fpc join fiscal_period on fiscal_period.id = fpc.object_ref_id and fiscal_period.period_type = upper(:vs_period_type)
	where fpc.stop_type = 'ALL'
		and  fpc.from_date = :vd_sdate
		and  fpc.to_date = :vd_edate
		and fpc.ROLE_USER_ID is null using sqlca;
	if li_cnt = 0 then
		li_insertrow = lds_control.event e_addrow( )
		lds_control.setitem( li_insertrow,'ID', this.f_create_id( ) )
		lds_control.setitem( li_insertrow,'OBJECT_REF_ID', ldb_peroid_id[1])
		lds_control.setitem( li_insertrow,'OBJECT_REF_TABLE', 'FISCAL_PERIOD')
		lds_control.setitem( li_insertrow,'FROM_DATE',vd_sdate)
		lds_control.setitem( li_insertrow,'TO_DATE', vd_edate)
		lds_control.setitem( li_insertrow,'STOP_YN', 'Y')
		lds_control.setitem( li_insertrow,'STOP_TYPE', 'ALL')
		if lds_control.update(true,false ) <> 1 then
			gf_messagebox('m.b_obj_instantiate.f_stop_period.01','Thông báo','Lỗ khi thêm record đóng kỳ','exclamation','ok',1)
			rollback using sqlca;
			return -1
		end if
	elseif li_cnt = 1 then
		select nvl(fpc.STOP_YN,'N'), fpc.ID into :ls_stop, :ldb_ctrl_id
		from fiscal_period_control fpc join fiscal_period on fiscal_period.id = fpc.object_ref_id and fiscal_period.period_type = upper(:vs_period_type)
		where fpc.stop_type = 'ALL'
			and  fpc.from_date = :vd_sdate
			and  fpc.to_date = :vd_edate
			and fpc.ROLE_USER_ID is null using sqlca;		
			
		if ls_stop = 'N' then
			update fiscal_period_control t set t.stop_yn = 'Y' where t.ID = :ldb_ctrl_id using sqlca;
		end if
	end if
	
	destroy lds_control
	commit using sqlca;
	return 1
elseif  li_cnt > 1 then
	For li_row = 1 to  upperbound(ldb_peroid_id[])
		
		if li_row = 1 then
			select count(fpc.ID) into :li_cnt
				from fiscal_period_control fpc join fiscal_period on fiscal_period.id = fpc.object_ref_id and fiscal_period.period_type = upper(:vs_period_type)
				where fpc.stop_type = 'ALL'
					and  fiscal_period.id = :ldb_peroid_id[li_row]
					and fpc.from_date = :vd_sdate
					and fpc.to_date = :ld_lastdate[li_row]
					and fpc.ROLE_USER_ID is null using sqlca;	
					
					if li_cnt > 0 then
						select nvl(fpc.STOP_YN,'N'), fpc.ID into :ls_stop, :ldb_ctrl_id
						from fiscal_period_control fpc join fiscal_period on fiscal_period.id = fpc.object_ref_id and fiscal_period.period_type = upper(:vs_period_type)
						where fpc.stop_type = 'ALL'
							and  fiscal_period.id = :ldb_peroid_id[li_row]
							and fpc.from_date = :vd_sdate
							and fpc.to_date = :ld_lastdate[li_row]
							and fpc.ROLE_USER_ID is null using sqlca;
					end if
		elseif  li_row = upperbound(ldb_peroid_id[]) then
			select count(fpc.ID) into :li_cnt
				from fiscal_period_control fpc join fiscal_period on fiscal_period.id = fpc.object_ref_id and fiscal_period.period_type = upper(:vs_period_type)
				where fpc.stop_type = 'ALL'
					and  fiscal_period.id = :ldb_peroid_id[li_row]
					and fpc.from_date = :ld_firstdate[li_row]
					and fpc.to_date = :vd_edate
					and fpc.ROLE_USER_ID is null using sqlca;	
					
			if li_cnt > 0 then
				select nvl(fpc.STOP_YN,'N'), fpc.ID into :ls_stop, :ldb_ctrl_id
				from fiscal_period_control fpc join fiscal_period on fiscal_period.id = fpc.object_ref_id and fiscal_period.period_type = upper(:vs_period_type)
				where fpc.stop_type = 'ALL'
					and  fiscal_period.id = :ldb_peroid_id[li_row]
					and fpc.from_date = :ld_firstdate[li_row]
					and fpc.to_date = :vd_edate
					and fpc.ROLE_USER_ID is null using sqlca;
			end if
		else
			select count(fpc.ID) into :li_cnt
				from fiscal_period_control fpc join fiscal_period on fiscal_period.id = fpc.object_ref_id and fiscal_period.period_type = upper(:vs_period_type)
				where fpc.stop_type = 'ALL'
					and  fiscal_period.id = :ldb_peroid_id[li_row]
					and fpc.from_date = :ld_firstdate[li_row]
					and fpc.to_date = :ld_lastdate[li_row]
					and fpc.ROLE_USER_ID is null using sqlca;
					
			if li_cnt > 0 then
				select nvl(fpc.STOP_YN,'N'), fpc.ID into :ls_stop, :ldb_ctrl_id
				from fiscal_period_control fpc join fiscal_period on fiscal_period.id = fpc.object_ref_id and fiscal_period.period_type = upper(:vs_period_type)
				where fpc.stop_type = 'ALL'
					and  fiscal_period.id = :ldb_peroid_id[li_row]
					and fpc.from_date = :ld_firstdate[li_row]
					and fpc.to_date = :ld_lastdate[li_row]
					and fpc.ROLE_USER_ID is null using sqlca;
			end if
		end if
		if li_cnt = 0 then
			li_insertrow = lds_control.event e_addrow( )
			lds_control.setitem( li_insertrow,'ID', this.f_create_id( ) )
			lds_control.setitem( li_insertrow,'OBJECT_REF_ID', ldb_peroid_id[li_row])
			lds_control.setitem( li_insertrow,'OBJECT_REF_TABLE', 'FISCAL_PERIOD')
			lds_control.setitem( li_insertrow,'STOP_YN', 'Y')
			lds_control.setitem( li_insertrow,'STOP_TYPE', 'ALL')				
			if li_row = 1 then
				lds_control.setitem( li_insertrow,'FROM_DATE',vd_sdate)
			else
				lds_control.setitem( li_insertrow,'FROM_DATE', ld_firstdate[li_row])
			end if
			
			if li_row =  upperbound(ldb_peroid_id[]) then
				lds_control.setitem( li_insertrow,'TO_DATE', vd_edate)
			ELSE
				 lds_control.setitem( li_insertrow,'TO_DATE',  ld_lastdate[li_row])
			end if
		else
			if ls_stop = 'N' then
				update fiscal_period_control t set t.stop_yn = 'Y' where t.ID = :ldb_ctrl_id using sqlca;
			end if			
		end if
	NEXT
	
	if lds_control.update(true,false ) <> 1 then
		gf_messagebox('m.b_obj_instantiate.f_stop_period.01','Thông báo','Lỗ khi thêm record đóng kỳ','exclamation','ok',1)
		rollback using sqlca;
		return -1
	end if
	commit using sqlca;
	destroy lds_control
	return 1	
elseif li_cnt = 0 then 
	gf_messagebox('m.b_obj_instantiate.f_stop_period.01','Thông báo','Chưa tạo kỳ trong lịch năm','exclamation','ok',1)
	return -1
else
	gf_messagebox('m.b_obj_instantiate.f_stop_period.01','Thông báo','Lỗi retrieve DW period','exclamation','ok',1)
	return -1	
end if
end function

public function integer f_get_period_info (date vd_sdate, date vd_edate, string vs_period_type, ref double rdb_id[], ref date rd_firstdate[], ref date rd_lastdate[]);int					li_cnt, li_row
double			ldb_id
string				ls_currentSQL, ls_currentWhere, ls_rtn

t_ds_db			lds_period
c_sql 				lc_sql

lds_period = create t_ds_db
lds_period.dataobject = 'd_fiscal_period_grid'
lds_period.f_settransobject( sqlca)

lds_period.f_getcurrentSQL( ls_currentSQL, ls_currentWhere)
ls_currentWhere = " fiscal_period.period_type = ~~'" + upper(vs_period_type) +"~~'"
ls_currentWhere += " AND  ~~'"+string(vd_sdate,'yyyymmdd') +"~~' <= to_char(fiscal_period.to_date, 'yyyymmdd') " 
ls_currentWhere += " AND ~~'"+string(vd_edate,'yyyymmdd') +"~~' >= to_char(fiscal_period.from_date, 'yyyymmdd') " 


lc_sql.f_addtowhereclause( ls_currentSQL, ls_currentWhere, ' AND ')
ls_rtn =lds_period.modify('Datawindow.Table.Select= "' + ls_currentSQL +'"' )
lds_period.setsort( " from_date a")
li_cnt = lds_period.retrieve( )
if li_cnt = 0 then
	return 0
elseif li_cnt = 1 then
	rdb_id[1] = lds_period.getitemnumber(1,'id')
	rd_firstdate[1] = date(lds_period.getitemdatetime(1,'from_date'))
	rd_lastdate[1] = date(lds_period.getitemdatetime(1,'to_date'))
	return 1
elseif li_cnt > 1 then
	FOR li_row = 1 to li_cnt
		rdb_id[li_row] = lds_period.getitemnumber(li_row,'id')
		rd_firstdate[li_row] = date(lds_period.getitemdatetime(li_row,'from_date'))
		rd_lastdate[li_row] = date(lds_period.getitemdatetime(li_row,'to_date'))		
	NEXT
	return upperbound(rdb_id[])
end if


end function

public function integer f_open_period (date vd_sdate, date vd_edate, string vs_period_type, string vs_stop_type);/******************************************************************************************
Chức năng: tạo ra record khóa kỳ (stop) theo tham số :vd_sdate, vd_edate
-----------------------------------------------------------------------------------------

===============================================================================*/
int			li_cnt, li_row, li_insertrow
double	ldb_peroid_id[], ldb_ctrl_id
date		ld_firstdate[], ld_lastdate[]
string		ls_stop



li_cnt =  this.f_get_period_info(vd_sdate , vd_edate, vs_period_type, ldb_peroid_id[], ld_firstdate[],  ld_lastdate[])

if li_cnt = 1 then
	//-- kiểm tra đã stop kỳ chưa --//
	select count(fpc.ID) into :li_cnt
	from fiscal_period_control fpc join fiscal_period on fiscal_period.id = fpc.object_ref_id and fiscal_period.period_type = upper(:vs_period_type)
	where fpc.stop_type = 'ALL'
		and  fpc.from_date = :vd_sdate
		and  fpc.to_date = :vd_edate
		and fpc.ROLE_USER_ID is null using sqlca;
		
	if li_cnt = 1 then
		select nvl(fpc.STOP_YN,'N'), fpc.ID into :ls_stop, :ldb_ctrl_id
		from fiscal_period_control fpc join fiscal_period on fiscal_period.id = fpc.object_ref_id and fiscal_period.period_type = upper(:vs_period_type)
		where fpc.stop_type = 'ALL'
			and  fpc.from_date = :vd_sdate
			and  fpc.to_date = :vd_edate
			and fpc.ROLE_USER_ID is null using sqlca;		
			
		if ls_stop = 'Y' then
			update fiscal_period_control t set t.stop_yn = 'N' where t.ID = :ldb_ctrl_id using sqlca;
		end if
	end if
	
	commit using sqlca;
	return 1
elseif  li_cnt > 1 then
	For li_row = 1 to  upperbound(ldb_peroid_id[])
		
		if li_row = 1 then
			select count(fpc.ID) into :li_cnt
				from fiscal_period_control fpc join fiscal_period on fiscal_period.id = fpc.object_ref_id and fiscal_period.period_type = upper(:vs_period_type)
				where fpc.stop_type = 'ALL'
					and  fiscal_period.id = :ldb_peroid_id[li_row]
					and fpc.from_date = :vd_sdate
					and fpc.to_date = :ld_lastdate[li_row]
					and fpc.ROLE_USER_ID is null using sqlca;	
					
					if li_cnt > 0 then
						select nvl(fpc.STOP_YN,'N'), fpc.ID into :ls_stop, :ldb_ctrl_id
						from fiscal_period_control fpc join fiscal_period on fiscal_period.id = fpc.object_ref_id and fiscal_period.period_type = upper(:vs_period_type)
						where fpc.stop_type = 'ALL'
							and  fiscal_period.id = :ldb_peroid_id[li_row]
							and fpc.from_date = :vd_sdate
							and fpc.to_date = :ld_lastdate[li_row]
							and fpc.ROLE_USER_ID is null using sqlca;
					end if
		elseif  li_row = upperbound(ldb_peroid_id[]) then
			select count(fpc.ID) into :li_cnt
				from fiscal_period_control fpc join fiscal_period on fiscal_period.id = fpc.object_ref_id and fiscal_period.period_type = upper(:vs_period_type)
				where fpc.stop_type = 'ALL'
					and  fiscal_period.id = :ldb_peroid_id[li_row]
					and fpc.from_date = :ld_firstdate[li_row]
					and fpc.to_date = :vd_edate
					and fpc.ROLE_USER_ID is null using sqlca;	
					
			if li_cnt > 0 then
				select nvl(fpc.STOP_YN,'N'), fpc.ID into :ls_stop, :ldb_ctrl_id
				from fiscal_period_control fpc join fiscal_period on fiscal_period.id = fpc.object_ref_id and fiscal_period.period_type = upper(:vs_period_type)
				where fpc.stop_type = 'ALL'
					and  fiscal_period.id = :ldb_peroid_id[li_row]
					and fpc.from_date = :ld_firstdate[li_row]
					and fpc.to_date = :vd_edate
					and fpc.ROLE_USER_ID is null using sqlca;
			end if
		else
			select count(fpc.ID) into :li_cnt
				from fiscal_period_control fpc join fiscal_period on fiscal_period.id = fpc.object_ref_id and fiscal_period.period_type = upper(:vs_period_type)
				where fpc.stop_type = 'ALL'
					and  fiscal_period.id = :ldb_peroid_id[li_row]
					and fpc.from_date = :ld_firstdate[li_row]
					and fpc.to_date = :ld_lastdate[li_row]
					and fpc.ROLE_USER_ID is null using sqlca;
					
			if li_cnt > 0 then
				select nvl(fpc.STOP_YN,'N'), fpc.ID into :ls_stop, :ldb_ctrl_id
				from fiscal_period_control fpc join fiscal_period on fiscal_period.id = fpc.object_ref_id and fiscal_period.period_type = upper(:vs_period_type)
				where fpc.stop_type = 'ALL'
					and  fiscal_period.id = :ldb_peroid_id[li_row]
					and fpc.from_date = :ld_firstdate[li_row]
					and fpc.to_date = :ld_lastdate[li_row]
					and fpc.ROLE_USER_ID is null using sqlca;
			end if
		end if
		if li_cnt = 1 then
			if ls_stop = 'Y' then
				update fiscal_period_control t set t.stop_yn = 'N' where t.ID = :ldb_ctrl_id using sqlca;
			end if			
		end if
	NEXT
	
	commit using sqlca;
	return 1	
elseif li_cnt = 0 then 
	gf_messagebox('m.b_obj_instantiate.f_stop_period.01','Thông báo','Chưa tạo kỳ trong lịch năm','exclamation','ok',1)
	return -1
else
	gf_messagebox('m.b_obj_instantiate.f_stop_period.01','Thông báo','Lỗi retrieve DW period','exclamation','ok',1)
	return -1	
end if
end function

public function boolean f_exists_transaction (double vdb_object_id);long		ll_cnt


select count (id) into :ll_cnt 
from stream_value
where item_id = :vdb_object_id
and sob = :gs_sob  
and company_id = :gi_user_comp_id
using sqlca;

if ll_cnt > 0 then
	return true
else
	select count (id) into :ll_cnt
	from object_Trans 
	where object_id = :vdb_object_id
	and sob = :gs_sob  
	and company_id = :gi_user_comp_id
	using sqlca;
	
	if ll_cnt > 0 then
		return true
	else
		return false
	end if
end if
end function

public function integer f_get_cus_info (double vdb_f_branch_id, double vdb_t_branch_id, double vdb_company_id, ref any raa_info[]);/**************************************
Hàm lấy thông tin khách hàng khi kết khác chi nhánh
vdb_f_branch_id: chi nhánh bên from
vdb_t_branch_id: chi nhánh bên to
vdb_company_id: công ty hiện tại
raa_info[]:			thông tin khách hàng
raa_info[1]:	id khách hàng					;	raa_info[8]: 	Tiền giao dịch
raa_info[2]:	Mã KH							;	raa_info[9]: 	id phương thức t.toán
raa_info[3]:	Tên KH							;	raa_info[10]:	Mã pt t.toán
raa_info[4]: Địa chỉ							;	raa_info[11]:	Tên pt t.toán
raa_info[5]:	id người liên hệ					;	raa_info[12]:	id thời hàn t.toán
raa_info[6]: Tên người lh					;	raa_info[13]:	Mã th t.toán
raa_info[7]:	id tiền giao dịch				;	raa_info[14]:	Tên th t.toán
raa_info[15]: ID nv phụ trách kh
return 0 : không có khách hàng
**************************************/
t_ds_db	lds_object_sales
any		laa_data[]
long		ll_cnt

//-- viết cứng tạm thời cho Hiệp Phát --//
//if vdb_f_branch_id = 9440443 and vdb_t_branch_id = 11006119 and vdb_company_id = 5508 then
	lds_object_sales = create t_ds_db
	lds_object_sales.dataobject = 'dd_object_sales'
	lds_object_sales.f_settransobject( SQLCA)
	laa_data[1] = vdb_f_branch_id
	laa_data[2] = 'Y'
	lds_object_sales.f_add_where( 'OBJECT_LINK_ID;active_yn', laa_data)
	ll_cnt = lds_object_sales.retrieve( )
	if ll_cnt > 0 then
		raa_info[1] = lds_object_sales.getitemnumber( ll_cnt, 'ID')
		raa_info[2] = lds_object_sales.getitemstring( ll_cnt, 'code')
		raa_info[3] = lds_object_sales.getitemstring( ll_cnt, 'name')
		raa_info[4] = lds_object_sales.getitemstring( ll_cnt, 'address')
		raa_info[5] = lds_object_sales.getitemnumber( ll_cnt, 'contact_id')
		raa_info[6] = lds_object_sales.getitemstring( ll_cnt, 'contact_name')
		raa_info[7] = lds_object_sales.getitemnumber( ll_cnt, 'currency_id')
		raa_info[8] = lds_object_sales.getitemstring( ll_cnt, 'currency_code')
		raa_info[9] = lds_object_sales.getitemnumber( ll_cnt, 'payment_method_id')
		raa_info[10] = lds_object_sales.getitemstring( ll_cnt, 'payment_method_code')
		raa_info[11] = lds_object_sales.getitemstring( ll_cnt, 'payment_method_name')
		raa_info[12] = lds_object_sales.getitemnumber( ll_cnt, 'payment_term_id')
		raa_info[13] = lds_object_sales.getitemstring( ll_cnt, 'payment_term_code')
		raa_info[14] = lds_object_sales.getitemstring( ll_cnt, 'payment_term_name')
		raa_info[15] = lds_object_sales.getitemnumber( ll_cnt, 'handled_by')
	end if
	destroy lds_object_sales
//end if
return ll_cnt
end function

public function double f_calculation_tax (double vdb_amount, integer vi_tax_pct, double vdb_exc_rate, string vs_include_tax_yn, t_dw_mpl vdw_handled);/*********************************
Hàm tính thuế và làm tròn theo tiền hạch toán
vdw_handled: dw get transaction để làm tròn
*********************************/
double			ldb_tax
double			ldb_round_id,ldb_base_amount
c_unit_instance	lc_unit

ldb_round_id = lc_unit.f_get_round_id( 0, 0, 'bc')
ldb_base_amount = vdb_amount * vdb_exc_rate
if trim(upper(vs_include_tax_yn)) = 'N' or isnull(vs_include_tax_yn) then
	ldb_tax = lc_unit.f_round( vdw_handled, ldb_round_id, (ldb_base_amount * vi_tax_pct) / 100)
	return ldb_tax
elseif trim(upper(vs_include_tax_yn)) = 'Y' then
	ldb_tax = lc_unit.f_round( vdw_handled, ldb_round_id, (ldb_base_amount * vi_tax_pct) / (100+ vi_tax_pct))
	return ldb_tax
end if
return 0
end function

public function double f_calculation_tax (double vdb_amount, integer vi_tax_pct, double vdb_exc_rate, string vs_include_tax_yn);/*************************
Hàm tính thuế theo tiền hạch toán
**************************/
double			ldb_tax
double			ldb_round_id,ldb_base_amount
c_unit_instance	lc_unit

ldb_round_id = lc_unit.f_get_round_id( 0, 0, 'bc')
ldb_base_amount = vdb_amount * vdb_exc_rate
if trim(upper(vs_include_tax_yn)) = 'N' or isnull(vs_include_tax_yn) then
	ldb_tax = (ldb_base_amount * vi_tax_pct) / 100
	return ldb_tax
elseif trim(upper(vs_include_tax_yn)) = 'Y' then
	ldb_tax = (ldb_base_amount * vi_tax_pct) / (100+ vi_tax_pct)
	return ldb_tax
end if
return 0
end function

public function integer f_update_tax (double vdb_curr_id, double vdb_exc_rate, t_dw_mpl vdw_master, long vl_row_master, t_dw_mpl vdw_tax_line, long vl_row_tax_line, integer vi_tax_pct, double vdb_amt_ex_tax, double vdb_base_amt_ex_tax, string vs_include_tax_yn, double vdb_amount);double				ldb_tax_amt,ldb_tax_correction,ldb_trans_tax_amount
double				ldb_base_round_id,ldb_round_id, ldb_object_ref_id, ldb_tax_id
double 				ldb_amount_ex_tax, ldb_base_amount_ex_Tax, ldb_tmp_amt, ldb_tax_include_amt, ldb_trans_tax_include_amt
int						li_tax_pct, li_row, li_uprow
string					ls_filter,ls_filter_org,  ls_uprow_yn, ls_include_yn
c_unit_instance		lc_unit


ldb_round_id = lc_unit.f_get_round_id( vdb_curr_id, 0, 'amount')
ldb_base_round_id = lc_unit.f_get_round_id( 0, 0, 'bc')


//-- tính record thuế hiện tại --//
if vl_row_tax_line > 0 then ldb_tax_id = vdw_tax_line.getitemnumber(vl_row_tax_line,'tax_id')
ls_filter_org = vdw_tax_line.describe("DataWindow.Table.Filter")
ldb_object_ref_id = vdw_master.getitemnumber(vl_row_master,'ID')

ls_filter = "object_ref_id="+string(ldb_object_ref_id)
vdw_tax_line.setfilter(ls_filter)
vdw_tax_line.filter()
if vdw_tax_line.rowcount() = 0 then return 0  //-- không có thuế --//
if vdw_tax_line.rowcount() = 1 then
	//-- 1 loại thuế (VAT) --//
	ldb_tax_amt = this.f_calculation_tax( vdb_amount, vi_tax_pct, vdb_exc_rate, vs_include_tax_yn, vdw_tax_line)
	ldb_trans_tax_amount = this.f_calculation_tax( vdb_amount, vi_tax_pct, 1, vs_include_tax_yn, vdw_tax_line)
	ldb_tax_correction = ldb_tax_amt
	vdw_tax_line.setitem(vdw_tax_line.rowcount(),'TAX_AMT',ldb_tax_amt)
	vdw_tax_line.setitem(vdw_tax_line.rowcount(),'TAX_CORRECTION',ldb_tax_correction)
	vdw_tax_line.setitem(vdw_tax_line.rowcount(),'TRANS_TAX_AMOUNT',ldb_trans_tax_amount)
	vdw_tax_line.setitem(vdw_tax_line.rowcount(),'TRANS_CURRENCY', vdb_curr_id)
	vdw_tax_line.setitem(vdw_tax_line.rowcount(),'EXCHANGE_RATE', vdb_exc_rate)
else
	ls_uprow_yn =  vdw_tax_line.getitemstring(li_row,'UPROW_YN')
	if isnull(ls_uprow_yn) then ls_uprow_yn = 'N'
	for li_row = 1 to vdw_tax_line.rowcount()
		if ldb_tax_id = vdw_tax_line.getitemnumber(li_row,'tax_id') then
			li_tax_pct = vi_tax_pct
		else
			li_tax_pct = vdw_tax_line.getitemnumber(li_row,'tax_pct')
		end if
	next
end if
//if vl_row_master = 0 then
//	vl_row_master = vdw_master.find(" ID="+string(ldb_object_ref_id), 1 ,vdw_master.rowcount())
//	if vl_row_master < 1 then return -1
//end if
//ldb_amount_ex_tax = vdw_master.getitemnumber(vl_row_master,'AMOUNT_EX_TAX')
//ldb_base_amount_ex_Tax = vdw_master.getitemnumber(vl_row_master,'BASE_AMOUNT_EX_TAX')
//
//FOR li_row = 1 to vdw_tax_line.rowcount()
//	if ldb_tax_id = vdw_tax_line.getitemnumber(li_row,'tax_id') and vi_tax_pct > 0 then
//		li_tax_pct = vi_tax_pct
//	else
//		li_tax_pct = vdw_tax_line.getitemnumber(li_row,'tax_pct')
//		ldb_tax_id =  vdw_tax_line.getitemnumber(li_row,'tax_id')
//	end if
//	
//	vdw_tax_line.setitem(li_row,'TRANS_CURRENCY', vdb_curr_id)
//	vdw_tax_line.setitem(li_row,'EXCHANGE_RATE', vdb_exrate)
//	
//	ls_uprow_yn =  vdw_tax_line.getitemstring(li_row,'UPROW_YN')
//	if isnull(ls_uprow_yn) then ls_uprow_yn = 'N'	
//	if ls_uprow_yn = 'Y' then
//		li_uprow = li_row
//		continue
//	end if		
//	ls_include_yn =  vdw_tax_line.getitemstring(li_row,'INCLUDE_YN')
//	if isnull(ls_include_yn) then ls_include_yn = 'N'
//	
//	ldb_tmp_amt = lc_unit.f_round( vdw_tax_line, ldb_round_id, ldb_amount_ex_tax*li_tax_pct/100)
//	vdw_tax_line.setitem(li_row,'TRANS_TAX_AMOUNT', ldb_tmp_amt)	
//	if ls_include_yn = 'Y' then
//		ldb_trans_tax_include_amt += ldb_tmp_amt
//	end if	
//	
//	ldb_tmp_amt = lc_unit.f_round( vdw_tax_line, ldb_base_round_id,  ldb_base_amount_ex_Tax*li_tax_pct/100)
//	vdw_tax_line.setitem(li_row,'TAX_AMT', ldb_tmp_amt)
//	vdw_tax_line.setitem(li_row,'TAX_CORRECTION',  ldb_tmp_amt)		
//	if ls_include_yn = 'Y' then
//		ldb_tax_include_amt += ldb_tmp_amt
//	end if
//
//NEXT
//
//if li_uprow > 0 then
//	ldb_tmp_amt = lc_unit.f_round( vdw_tax_line, ldb_round_id, (ldb_amount_ex_tax+ldb_trans_tax_include_amt)*li_tax_pct/100)
//	vdw_tax_line.setitem(li_uprow,'TRANS_TAX_AMOUNT', ldb_tmp_amt)			
//	ldb_tmp_amt = lc_unit.f_round( vdw_tax_line, ldb_base_round_id, (ldb_base_amount_ex_Tax + ldb_tax_include_amt)*li_tax_pct/100)
//	vdw_tax_line.setitem(li_uprow,'TAX_AMT', ldb_tmp_amt)
//	vdw_tax_line.setitem(li_uprow,'TAX_CORRECTION',  ldb_tmp_amt)		
//end if

if ls_filter_org <> '?' then
	vdw_tax_line.setfilter(ls_filter_org)
	vdw_tax_line.filter()
end if

return 1
end function

public function integer f_update_tax_all (double vdb_curr_id, double vdb_exc_rate, t_dw_mpl vdw_master, t_dw_mpl vdw_tax_line, string vs_col_amt_ex_tax, string vs_col_base_amt_ex_tax, string vs_include_tax_yn, string vs_col_amt);double				ldb_tax_amt,ldb_tax_correction,ldb_trans_tax_amount
double				ldb_base_round_id,ldb_round_id, ldb_object_ref_id, ldb_tax_id
double 				ldb_amount_ex_tax, ldb_base_amount_ex_tax,ldb_amount, ldb_tmp_amt, ldb_tax_include_amt, ldb_trans_tax_include_amt
int						li_tax_pct, li_row, li_uprow
string					ls_filter,ls_filter_org,  ls_uprow_yn, ls_include_yn
c_unit_instance		lc_unit

long		ll_row,ll_find

for ll_row = 1 to vdw_master.rowcount()
	ldb_amount_ex_tax = vdw_master.getitemnumber(ll_row,vs_col_amt_ex_tax)
	ldb_base_amount_ex_tax = vdw_master.getitemnumber(ll_row,vs_col_base_amt_ex_tax)
	ldb_amount = vdw_master.getitemnumber(ll_row,vs_col_amt)
	ll_find = vdw_tax_line.find("object_ref_id = "+string(vdw_master.getitemnumber(ll_row,'ID')),1,vdw_tax_line.rowcount())
	if ll_find > 0 then
		li_tax_pct = vdw_tax_line.getitemnumber(ll_find,'tax_pct')
	else
		li_tax_pct = 0
	end if
	this.f_update_tax( vdb_curr_id, vdb_exc_rate, vdw_master, ll_row, vdw_tax_line, ll_find, li_tax_pct, ldb_amount_ex_tax,ldb_base_amount_ex_tax,vs_include_tax_yn, ldb_amount)
next

/*

ldb_round_id = lc_unit.f_get_round_id( vdb_curr_id, 0, 'amount')
ldb_base_round_id = lc_unit.f_get_round_id( 0, 0, 'bc')


//-- tính record thuế hiện tại --//
if vl_row_tax_line > 0 then ldb_tax_id = vdw_tax_line.getitemnumber(vl_row_tax_line,'tax_id')
ls_filter_org = vdw_tax_line.describe("DataWindow.Table.Filter")
ldb_object_ref_id = vdw_master.getitemnumber(vl_row_master,'ID')

ls_filter = "object_ref_id="+string(ldb_object_ref_id)
vdw_tax_line.setfilter(ls_filter)
vdw_tax_line.filter()
if vdw_tax_line.rowcount() = 0 then return 0  //-- không có thuế --//
if vdw_tax_line.rowcount() = 1 then
	//-- 1 loại thuế (VAT) --//
	ldb_tax_amt = this.f_calculation_tax( vdb_amount, vi_tax_pct, vdb_exc_rate, vs_include_tax_yn, vdw_tax_line)
	ldb_trans_tax_amount = this.f_calculation_tax( vdb_amount, vi_tax_pct, 1, vs_include_tax_yn, vdw_tax_line)
	ldb_tax_correction = ldb_tax_amt
	vdw_tax_line.setitem(vdw_tax_line.rowcount(),'TAX_AMT',ldb_tax_amt)
	vdw_tax_line.setitem(vdw_tax_line.rowcount(),'TAX_CORRECTION',ldb_tax_correction)
	vdw_tax_line.setitem(vdw_tax_line.rowcount(),'TRANS_TAX_AMOUNT',ldb_trans_tax_amount)
	vdw_tax_line.setitem(vdw_tax_line.rowcount(),'TRANS_CURRENCY', vdb_curr_id)
	vdw_tax_line.setitem(vdw_tax_line.rowcount(),'EXCHANGE_RATE', vdb_exc_rate)
else
	ls_uprow_yn =  vdw_tax_line.getitemstring(li_row,'UPROW_YN')
	if isnull(ls_uprow_yn) then ls_uprow_yn = 'N'
	for li_row = 1 to vdw_tax_line.rowcount()
		if ldb_tax_id = vdw_tax_line.getitemnumber(li_row,'tax_id') then
			li_tax_pct = vi_tax_pct
		else
			li_tax_pct = vdw_tax_line.getitemnumber(li_row,'tax_pct')
		end if
	next
end if
*/
//if vl_row_master = 0 then
//	vl_row_master = vdw_master.find(" ID="+string(ldb_object_ref_id), 1 ,vdw_master.rowcount())
//	if vl_row_master < 1 then return -1
//end if
//ldb_amount_ex_tax = vdw_master.getitemnumber(vl_row_master,'AMOUNT_EX_TAX')
//ldb_base_amount_ex_Tax = vdw_master.getitemnumber(vl_row_master,'BASE_AMOUNT_EX_TAX')
//
//FOR li_row = 1 to vdw_tax_line.rowcount()
//	if ldb_tax_id = vdw_tax_line.getitemnumber(li_row,'tax_id') and vi_tax_pct > 0 then
//		li_tax_pct = vi_tax_pct
//	else
//		li_tax_pct = vdw_tax_line.getitemnumber(li_row,'tax_pct')
//		ldb_tax_id =  vdw_tax_line.getitemnumber(li_row,'tax_id')
//	end if
//	
//	vdw_tax_line.setitem(li_row,'TRANS_CURRENCY', vdb_curr_id)
//	vdw_tax_line.setitem(li_row,'EXCHANGE_RATE', vdb_exrate)
//	
//	ls_uprow_yn =  vdw_tax_line.getitemstring(li_row,'UPROW_YN')
//	if isnull(ls_uprow_yn) then ls_uprow_yn = 'N'	
//	if ls_uprow_yn = 'Y' then
//		li_uprow = li_row
//		continue
//	end if		
//	ls_include_yn =  vdw_tax_line.getitemstring(li_row,'INCLUDE_YN')
//	if isnull(ls_include_yn) then ls_include_yn = 'N'
//	
//	ldb_tmp_amt = lc_unit.f_round( vdw_tax_line, ldb_round_id, ldb_amount_ex_tax*li_tax_pct/100)
//	vdw_tax_line.setitem(li_row,'TRANS_TAX_AMOUNT', ldb_tmp_amt)	
//	if ls_include_yn = 'Y' then
//		ldb_trans_tax_include_amt += ldb_tmp_amt
//	end if	
//	
//	ldb_tmp_amt = lc_unit.f_round( vdw_tax_line, ldb_base_round_id,  ldb_base_amount_ex_Tax*li_tax_pct/100)
//	vdw_tax_line.setitem(li_row,'TAX_AMT', ldb_tmp_amt)
//	vdw_tax_line.setitem(li_row,'TAX_CORRECTION',  ldb_tmp_amt)		
//	if ls_include_yn = 'Y' then
//		ldb_tax_include_amt += ldb_tmp_amt
//	end if
//
//NEXT
//
//if li_uprow > 0 then
//	ldb_tmp_amt = lc_unit.f_round( vdw_tax_line, ldb_round_id, (ldb_amount_ex_tax+ldb_trans_tax_include_amt)*li_tax_pct/100)
//	vdw_tax_line.setitem(li_uprow,'TRANS_TAX_AMOUNT', ldb_tmp_amt)			
//	ldb_tmp_amt = lc_unit.f_round( vdw_tax_line, ldb_base_round_id, (ldb_base_amount_ex_Tax + ldb_tax_include_amt)*li_tax_pct/100)
//	vdw_tax_line.setitem(li_uprow,'TAX_AMT', ldb_tmp_amt)
//	vdw_tax_line.setitem(li_uprow,'TAX_CORRECTION',  ldb_tmp_amt)		
//end if
//
//if ls_filter <> '?' then
//	vdw_tax_line.setfilter(ls_filter)
//	vdw_tax_line.filter()
//end if

return 1
end function

public function integer f_update_amt_ex_markup_comm_disc (double vdb_curr_id, double vdb_exc_rate, t_dw_mpl vdw_line, t_dw_mpl vdw_tax_line, string vs_include_tax_yn);c_unit_instance			lc_unit
//datawindow				ldw_main
double					ldc_amt_ex,ldc_act_amt_ex,ldc_markup_return,ldc_comm_amt,ldc_markup_amt
double					ldc_base_amt_ex,ldc_act_base_amt_ex,ldc_disc_amt,ldc_qty,ldc_price,ldc_act_price,ldc_price_ex,ldc_act_price_ex
double					ldb_round_id
int							li_idx,li_markup_pct,li_comm_pct,li_disc_pct
string						ls_filter_org

//ldw_main = iw_display.dynamic f_get_dwmain()
ldb_round_id = lc_unit.f_get_round_id(vdb_curr_id, 0, 'amount')
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
//	if vdw_line.describe("PRICE_EX_TAX.x") <> '!' then
//		this.f_caculation_ex_tax(ldc_qty,ldc_price,ldc_act_price,vi_tax_percent,vs_include_tax_yn,vdc_exc,vdb_curr_id,ldc_price_ex, ldc_act_price_ex,ldc_amt_ex,ldc_act_amt_ex,ldc_base_amt_ex,ldc_act_base_amt_ex)
//		vdw_line.setitem(li_idx,'price_ex_tax',ldc_price_ex)
//		vdw_line.setitem(li_idx,'amount_ex_tax',ldc_amt_ex)
//		vdw_line.setitem(li_idx,'base_amount_ex_tax',ldc_base_amt_ex)
//	end if
//	if vdw_line.describe("act_amount_ex_tax.x") <> '!' then
//		this.f_caculation_ex_tax(ldc_qty,ldc_price,ldc_act_price,vi_tax_percent,vs_include_tax_yn,vdc_exc,vdb_curr_id,ldc_price_ex, ldc_act_price_ex,ldc_amt_ex,ldc_act_amt_ex,ldc_base_amt_ex,ldc_act_base_amt_ex)
//		vdw_line.setitem(li_idx,'act_price_ex_tax',ldc_act_price_ex)
//		vdw_line.setitem(li_idx,'act_amount_ex_tax',ldc_act_amt_ex)
//		vdw_line.setitem(li_idx,'act_base_amount_ex_tax',ldc_act_base_amt_ex)
//	end if
//	if vdw_line.describe("comm_pct.x") <> '!' then
//		li_comm_pct = vdw_line.getitemnumber(li_idx,'comm_pct')
//		if li_comm_pct > 0 then
//			this.f_caculation_comm( ldc_act_amt_ex,li_comm_pct, vdb_curr_id,ldc_comm_amt)
//			vdw_line.setitem(li_idx,'comm_amt',ldc_comm_amt)
//		end if
//	end if
//	if vdw_line.describe("comm_pct.x") <> '!' then
//		li_markup_pct = vdw_line.getitemnumber(li_idx,'markup_pct')
//		if li_markup_pct > 0 then
//			this.f_caculation_markup(ldc_amt_ex, ldc_act_amt_ex, li_markup_pct,vdb_curr_id,ldc_markup_amt, ldc_markup_return)
//				vdw_line.setitem(li_idx,'markup_return',ldc_markup_return)
//				vdw_line.setitem(li_idx,'markup_amt',ldc_markup_amt)
//		end if
//	end if
//	if vdw_line.describe("DISC_PCT.x") <> '!' then
//		li_disc_pct = vdw_line.getitemnumber(li_idx,'disc_pct')
//		if li_disc_pct > 0 then
//			this.f_caculation_disc(ldc_act_amt_ex,li_disc_pct,vdb_curr_id,ldc_disc_amt)
//			vdw_line.setitem(li_idx,'disc_amt',ldc_disc_amt)
//		end if
//	end if
next
return 0


//double				ldb_tax_amt,ldb_tax_correction,ldb_trans_tax_amount
//double				ldb_base_round_id,ldb_round_id, ldb_object_ref_id, ldb_tax_id
//double 				ldb_amount_ex_tax, ldb_base_amount_ex_Tax, ldb_tmp_amt, ldb_tax_include_amt, ldb_trans_tax_include_amt
//int						li_tax_pct, li_row, li_uprow
//string					ls_filter,ls_filter_org,  ls_uprow_yn, ls_include_yn
//c_unit_instance		lc_unit


//ldb_round_id = lc_unit.f_get_round_id( vdb_curr_id, 0, 'amount')
//ldb_base_round_id = lc_unit.f_get_round_id( 0, 0, 'bc')
//
//
////-- tính record thuế hiện tại --//
//if vl_row_tax_line > 0 then ldb_tax_id = vdw_tax_line.getitemnumber(vl_row_tax_line,'tax_id')
//ls_filter_org = vdw_tax_line.describe("DataWindow.Table.Filter")
//ldb_object_ref_id = vdw_master.getitemnumber(vl_row_master,'ID')
//
//ls_filter = "object_ref_id="+string(ldb_object_ref_id)
//vdw_tax_line.setfilter(ls_filter)
//vdw_tax_line.filter()
//if vdw_tax_line.rowcount() = 0 then return 0  //-- không có thuế --//
//if vdw_tax_line.rowcount() = 1 then
//	//-- 1 loại thuế (VAT) --//
//	ldb_tax_amt = this.f_calculation_tax( vdb_amount, vi_tax_pct, vdb_exc_rate, vs_include_tax_yn, vdw_tax_line)
//	ldb_trans_tax_amount = this.f_calculation_tax( vdb_amount, vi_tax_pct, 1, vs_include_tax_yn, vdw_tax_line)
//	ldb_tax_correction = ldb_tax_amt
//	vdw_tax_line.setitem(vdw_tax_line.rowcount(),'TAX_AMT',ldb_tax_amt)
//	vdw_tax_line.setitem(vdw_tax_line.rowcount(),'TAX_CORRECTION',ldb_tax_correction)
//	vdw_tax_line.setitem(vdw_tax_line.rowcount(),'TRANS_TAX_AMOUNT',ldb_trans_tax_amount)
//	vdw_tax_line.setitem(vdw_tax_line.rowcount(),'TRANS_CURRENCY', vdb_curr_id)
//	vdw_tax_line.setitem(vdw_tax_line.rowcount(),'EXCHANGE_RATE', vdb_exc_rate)
//else
//	ls_uprow_yn =  vdw_tax_line.getitemstring(li_row,'UPROW_YN')
//	if isnull(ls_uprow_yn) then ls_uprow_yn = 'N'
//	for li_row = 1 to vdw_tax_line.rowcount()
//		if ldb_tax_id = vdw_tax_line.getitemnumber(li_row,'tax_id') then
//			li_tax_pct = vi_tax_pct
//		else
//			li_tax_pct = vdw_tax_line.getitemnumber(li_row,'tax_pct')
//		end if
//	next
//end if
//if vl_row_master = 0 then
//	vl_row_master = vdw_master.find(" ID="+string(ldb_object_ref_id), 1 ,vdw_master.rowcount())
//	if vl_row_master < 1 then return -1
//end if
//ldb_amount_ex_tax = vdw_master.getitemnumber(vl_row_master,'AMOUNT_EX_TAX')
//ldb_base_amount_ex_Tax = vdw_master.getitemnumber(vl_row_master,'BASE_AMOUNT_EX_TAX')
//
//FOR li_row = 1 to vdw_tax_line.rowcount()
//	if ldb_tax_id = vdw_tax_line.getitemnumber(li_row,'tax_id') and vi_tax_pct > 0 then
//		li_tax_pct = vi_tax_pct
//	else
//		li_tax_pct = vdw_tax_line.getitemnumber(li_row,'tax_pct')
//		ldb_tax_id =  vdw_tax_line.getitemnumber(li_row,'tax_id')
//	end if
//	
//	vdw_tax_line.setitem(li_row,'TRANS_CURRENCY', vdb_curr_id)
//	vdw_tax_line.setitem(li_row,'EXCHANGE_RATE', vdb_exrate)
//	
//	ls_uprow_yn =  vdw_tax_line.getitemstring(li_row,'UPROW_YN')
//	if isnull(ls_uprow_yn) then ls_uprow_yn = 'N'	
//	if ls_uprow_yn = 'Y' then
//		li_uprow = li_row
//		continue
//	end if		
//	ls_include_yn =  vdw_tax_line.getitemstring(li_row,'INCLUDE_YN')
//	if isnull(ls_include_yn) then ls_include_yn = 'N'
//	
//	ldb_tmp_amt = lc_unit.f_round( vdw_tax_line, ldb_round_id, ldb_amount_ex_tax*li_tax_pct/100)
//	vdw_tax_line.setitem(li_row,'TRANS_TAX_AMOUNT', ldb_tmp_amt)	
//	if ls_include_yn = 'Y' then
//		ldb_trans_tax_include_amt += ldb_tmp_amt
//	end if	
//	
//	ldb_tmp_amt = lc_unit.f_round( vdw_tax_line, ldb_base_round_id,  ldb_base_amount_ex_Tax*li_tax_pct/100)
//	vdw_tax_line.setitem(li_row,'TAX_AMT', ldb_tmp_amt)
//	vdw_tax_line.setitem(li_row,'TAX_CORRECTION',  ldb_tmp_amt)		
//	if ls_include_yn = 'Y' then
//		ldb_tax_include_amt += ldb_tmp_amt
//	end if
//
//NEXT
//
//if li_uprow > 0 then
//	ldb_tmp_amt = lc_unit.f_round( vdw_tax_line, ldb_round_id, (ldb_amount_ex_tax+ldb_trans_tax_include_amt)*li_tax_pct/100)
//	vdw_tax_line.setitem(li_uprow,'TRANS_TAX_AMOUNT', ldb_tmp_amt)			
//	ldb_tmp_amt = lc_unit.f_round( vdw_tax_line, ldb_base_round_id, (ldb_base_amount_ex_Tax + ldb_tax_include_amt)*li_tax_pct/100)
//	vdw_tax_line.setitem(li_uprow,'TAX_AMT', ldb_tmp_amt)
//	vdw_tax_line.setitem(li_uprow,'TAX_CORRECTION',  ldb_tmp_amt)		
//end if

if ls_filter_org <> '?' then
	vdw_tax_line.setfilter(ls_filter_org)
	vdw_tax_line.filter()
end if

return 1
end function

public function boolean f_is_matched (s_object_display vod_handling, string vs_colname, t_dw_mpl vdw_handling, string vs_origin_data, string vs_new_data);boolean		lb_not_modify
long			ll_row
t_ds_db		lds_tmp

if vs_origin_data <> vs_new_data and right(vs_new_data,1) <> '-' then
	lb_not_modify = vod_handling.idwsetup_initial.f_is_match_not_modify(vdw_handling.dataobject, vs_colname)
	if lb_not_modify then
		lds_tmp = vod_handling.dynamic f_get_ids_matching()
		ll_row = lds_tmp.rowcount( )
		if ll_row > 0 then
			return true
		else
			return false
		end if
	end if
end if
return false
end function

public function integer f_open_drilldown_rpt (string vs_object_name, any va_click_data, s_str_dwo_related vstr_dwo_related, long vl_cur_row);
return 0
end function

public function integer f_update_round_diff (double vdb_item_id, double vdb_round_diff, ref t_transaction rt_transaction);double			ldb_moving_avg
string				ls_item_code

if isnull(vdb_item_id) or vdb_item_id = 0 then return 0
if isnull(vdb_round_diff) then vdb_round_diff = 0

update item set round_diff = :vdb_round_diff where object_ref_id = :vdb_item_id using rt_transaction;

if rt_transaction.sqlcode = -1 then
	rollback using rt_transaction;
	ls_item_code = this.f_get_code(vdb_item_id )
	gf_messagebox('m.c_item.f_update_round_diff.01','Thông báo','Không cập nhật được chênh lệch làm tròn quy đổi đơn vị của mặt hàng:@'+ls_item_code,'stop','ok',1)
	return -1
else
	return 1
end if
end function

public function double f_get_round_diff (double vdb_item_id);/**********************************************************************************
Chức năng: Lấy số chênh lệch làm tròn khi quy đổi đơn vị giao dịch sang đơn vị tốn kho, khi sửa ghi sồ (UNPOST)
 				 # Chênh lệch =  Số lược thực tế theo SKU chưa làm tròn - SL SKU đã làm tròn 
				 # Chênh lệch âm: thể hiện tồn kho hiện tại > hơn thực tế
				 # Chênh lệch dương: thể hiện tồn kho hiện tại < hơn thực tế
------------------------------------------------------------------------------------------------------------------------------------
Tham số: vdb_item_id: ID của mặt hàng
------------------
Return: số chênh lệch hiện tại của mã hàng.
==============================================================*/
double			ldb_round_diff

if isnull(vdb_item_id) or vdb_item_id = 0 then return 0

select round_diff into :ldb_round_diff from item where object_ref_id = :vdb_item_id using sqlca;

if sqlca.sqlcode = 0 then
	return ldb_round_diff
else
	return 0
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

public function double f_get_moving_avg (double vdb_item_id);double			ldb_moving_avg


if isnull(vdb_item_id) or vdb_item_id = 0 then return -1

select moving_avg into :ldb_moving_avg from item where object_ref_id = :vdb_item_id using sqlca;

if isnull(ldb_moving_avg) then ldb_moving_avg = 0

return ldb_moving_avg
end function

public function integer f_get_qty_and_value_yn (double vdb_trans_hdr_id, ref string rs_qty, ref string rs_value);/************************************************************************
Chức năng: Trả về ghi sổ số lượng và ghi sổ giá trị

=================================================================*/

select nvl(quantity_yn,'N') , nvl(value_yn,'N') into :rs_qty, :rs_value 
from TRANS_SETUP_HDR
where id = :vdb_trans_hdr_id and COMPANY_ID = :gi_user_comp_id using sqlca; 

if sqlca.sqlcode = 0 then
	return 1
else
	return -1
end if
end function

public function string f_get_trans_setup_visible (string ls_doc_type, double vdb_trans_hdr_id);/************************************************************************
Chức năng: Kiểm tra cài đặt có mở form xem định khoản không
------------------------------------------------------------------------------
Tham số:
--------------------
Return (string): Y - Có mở from
				     N - Không mở form
=================================================================*/
t_ds_db       		lds_tmp
string 				ls_yn
long					ll_found_row

lds_tmp = create t_ds_db
lds_tmp.dataobject = 'd_trans_setup_hdr_grid'
lds_tmp.f_settransobject( SQLCA)
lds_tmp.retrieve(ls_doc_type)
ll_found_row = lds_tmp.find("id = "+string(vdb_trans_hdr_id),1,lds_tmp.rowcount())
ls_yn = lds_tmp.getitemstring(ll_found_row,'visible_yn')
if isnull(ls_yn) then ls_yn = 'N'
destroy lds_tmp
return ls_yn
end function

public function string f_get_post_message_yn (string ls_doc_type, double vdb_trans_hdr_id);/************************************************************************
Chức năng: Kiểm tra cài đặt có bật thông báo ghi sổ thành công hay không
------------------------------------------------------------------------------
Tham số:
--------------------
Return (string): Y - Có
				     N - Không
=================================================================*/
t_ds_db       		lds_tmp
string 				ls_yn
long					ll_found_row

lds_tmp = create t_ds_db
lds_tmp.dataobject = 'd_trans_setup_hdr_grid'
lds_tmp.f_settransobject( SQLCA)
lds_tmp.retrieve(ls_doc_type)
ll_found_row = lds_tmp.find("id = "+string(vdb_trans_hdr_id),1,lds_tmp.rowcount())
ls_yn = lds_tmp.getitemstring(ll_found_row,'post_message_yn')
if isnull(ls_yn) then ls_yn = 'N'
destroy lds_tmp
return ls_yn
end function

public function integer f_load_excelfile (ref oleobject role_excel, string vs_patch);string 	ls_path_name, ls_file_name, ls_excelversion, ls_curdir
integer 	li_rtn

if not isvalid(role_excel) then return 0

if vs_patch = '' or isnull(vs_patch) then
	ls_curdir = GetCurrentDirectory()
	li_rtn = GetFileOpenName("Open File",ls_path_name, ls_file_name, "XLS", "Excel Files (*.xls),*.xls,"+ "Excel Files (*.xlsx),*.xlsx")
	
	If li_rtn < 1 Then return -1
	ChangeDirectory(ls_curdir)
else
	ls_path_name = vs_patch
end if


RegistryGet("HKEY_CLASSES_ROOT\Excel.Application\CurVer","",RegString!,ls_excelversion) // lấy version hiện tại của office
li_rtn = role_excel.ConnectToNewObject(ls_excelversion)
if li_rtn <> 0 then
		MessageBox( "Error", 'Error running MS Excel api.')
		destroy role_excel
		return -1
end if
 role_excel.WorkBooks.Open(ls_path_name)


return 1
end function

public function integer f_get_ds_barcode (string vs_file_type, string vs_patch, string vs_file_name, string vs_colnumber, ref t_ds_db rds_barcode);/***********************************************************
Hàm lấy chi tiết barcode từ thư mục khai báo sẳng(global) hoặc truyền vào.
vs_file_type:		Loại file cần lấy data (csv hoặc xls, xlsx).
vs_patch:			đường dẫn thư mục chứa file.
vs_file_name: 		tên file.
rds_barcode:		dataobject 
***********************************************************/
OLEobject	lole_excel, lole_worksheet
string			ls_file_type,ls_filename,ls_path,ls_inifile = 'global.ini',ls_colnum
long			ll_startrow,ll_sartcol,ll_endcol
int				li_rtn

//-- kiểm tra đường dẫn--//
if isnull(vs_patch) or vs_patch = '' then
	ls_path = ProfileString(ls_inifile,'path file','path',gs_path_pic)
else
	ls_path = vs_patch
end if
//--kiểm tra tên file--//
if isnull(vs_file_name) or vs_file_name = '' then
	ls_filename = ProfileString(ls_inifile,'path file','filename','invoice_imp')
else
	ls_filename = vs_file_name
end if
//--kiểm tra loại file--//
if isnull(vs_file_type) or vs_file_type = '' then
	ls_file_type = ProfileString(ls_inifile,'path file','filetype','csv')
else
	ls_file_type = vs_file_type
end if
if ls_path <> '' and ls_filename <> '' then 
	ls_path = ls_path + '\' + ls_filename + '.' + ls_file_type
else
	return 0
end if
if vs_colnumber = '' or isnull(vs_colnumber) then
	ls_colnum = ProfileString(ls_inifile,'path file','colnumber','1')
else
	ls_colnum = vs_colnumber
end if
if pos(ls_file_type,'xls') > 0 then
	lole_excel = create OLEobject
	if this.f_load_excelfile( lole_excel,ls_path) = -1 then return -1
	lole_worksheet = lole_excel.ActiveWorkbook.ActiveSheet
	this.f_load_excel2datastore( lole_worksheet, rds_barcode, 2, long(ls_colnum))
	
	lole_Excel.DisplayAlerts = false
	lole_Excel.application.quit()
	lole_Excel.DisconnectObject()
	destroy lole_Excel
else
	li_rtn = rds_barcode.importfile(ls_path)
end if

return rds_barcode.rowcount()





//ls_path = ProfileString(ls_inifile,'path file','path',gs_path_pic)
//ls_filename = ProfileString(ls_inifile,'path file','filenamein','PXK_IN')
//li_rtn = lds_lot_line.importfile( ls_path + '\' + ls_filename + '.csv')
////ldw_main = iw_display.f_get_dwmain( )
//if li_rtn > 0 then
////	ib_importing = true
//	lds_lot_line.setsort( "lot_no asc")
//	lds_lot_line.sort( )
////	iw_display.event e_modify( )
////	ldw_lot_line = iw_display.f_get_dw( 'd_lot_line_grid')
//	ldw_inven_line = ldw_lot_line.f_get_idw_master( )
//	for li_idx = 1 to ldw_inven_line.rowcount( )
//		if ls_item_code_1 <> '' then ls_item_code_1 += ';'
//		ls_item_code_1 += ldw_inven_line.getitemstring( li_idx, 'item_code')
//		if ls_ivn_id <> '' then ls_ivn_id += ','
//		ls_ivn_id += string(ldw_inven_line.getitemnumber( li_idx, 'id') )
//	next
//	laa_data[1] = '('+ls_item_code_1+')'
//	lds_item_lot.f_add_where( 'item_code', laa_data)
//	lds_item_lot.retrieve( )
//	ls_org_filter = ldw_lot_line.describe( "datawindow.table.filter")
//	ldw_lot_line.setfilter( "object_ref_id IN (" + ls_ivn_id + ")")
//	ldw_lot_line.filter( )
//	for li_idx = 1 to lds_lot_line.rowcount( )
//		ls_serial = lds_lot_line.getitemstring( li_idx , 'lot_no')
//		if isnull(ls_serial) then ls_serial = ''
//		ll_find_lot = lds_item_lot.find( "lot_no = '" + ls_serial + "'", 1,lds_item_lot.rowcount())
//		if ll_find_lot = 0 then continue
//		li_qty = lds_lot_line.getitemnumber( li_idx, 'qty')
//		if isnull(li_qty) then li_qty = 0
//		if ls_item_code <> left(ls_serial,5) then ls_item_code = left(ls_serial,5)
////		ldb_version_id = vdw_main.getitemnumber( ldw_main.getrow( ) , 'version_id')
//		ll_find_item = ldw_inven_line.find( "item_code = '"+ls_item_code+"' and object_ref_id = " + string(ldb_version_id), 1, ldw_inven_line.rowcount( ) )
//		//set tổng số lượng
//		if ll_find_item > 0 then
//			if (ldb_ivn_id > 0 and ldb_ivn_id <> ldw_inven_line.getitemnumber( ll_find_item, 'ID')) or li_idx = lds_lot_line.rowcount( ) then
//				ldw_lot_line.setfilter( "object_ref_id IN (" + string(ldb_ivn_id) + ")")
//				ldw_lot_line.filter( )
//				ll_count = ldw_lot_line.rowcount( )
//				if li_idx = lds_lot_line.rowcount( ) then ll_count ++
//				ldw_inven_line.setitem( ldw_inven_line.find( "ID = "+string(ldb_ivn_id), 1, ldw_inven_line.rowcount( )) , 'qty', ll_count)
//				ldw_lot_line.setfilter( "object_ref_id IN (" + ls_ivn_id + ")")
//				ldw_lot_line.filter( )
//			end if
//			ldb_ivn_id = ldw_inven_line.getitemnumber( ll_find_item, 'ID')
//		else
//			continue
//		end if
//		ll_find = ldw_lot_line.find( "lot_no = '"+trim(ls_serial)+"'", 1, ldw_lot_line.rowcount( ) )
//		if ll_find > 0 then continue
//		if li_qty > 0 and ls_serial <> '' then
//			ll_row = ldw_lot_line.event e_addrow( )
//			ldw_lot_line.setitem( ll_row, 'lot_no', ls_serial)
//			ldw_lot_line.setitem( ll_row, 'out_qty', li_qty)
//			ldw_lot_line.setitem( ll_row, 'object_ref_id', ldb_ivn_id)
//		end if
//	next
////	iw_display.event e_saveclose( )
////	ib_importing = false
//	filedelete(ls_path + '\' + ls_filename + '.csv')
//	ldw_lot_line.setfilter( ls_org_filter)
//	ldw_lot_line.filter( )
//end if
//destroy lds_item_lot
//destroy lds_lot_line
return 1
end function

public function integer f_load_excel2datastore (oleobject vole_excel, ref t_ds_db rds_barcode, long vl_startrow, long vl_endcol);c_string	lc_string
string 	ls_excelVal
long		ll_xrow,ll_xcol,ll_insertrow
any		la_xval

if vl_startrow > 0 then
	ll_xrow = vl_startrow
else
	ll_xrow = 1
end if
Do While ll_xrow > 0
	for ll_xcol = 1 to vl_endcol
		la_xval = vole_excel.cells(ll_xrow,ll_xcol).value
		if string(la_xval) <>'' and not isnull(la_xval) then
			if ll_xcol = 1 then 
				ll_insertrow = rds_barcode.event e_addrow()
			end if
			rds_barcode.setitem(ll_insertrow,ll_xcol,la_xval)
		else
			if ll_xcol =  1 then 
				ll_insertrow = 0
				exit
			else
				continue
			end if
		end if
	next
	if ll_insertrow > 0 then 
		ll_xrow++
	else
		ll_xrow = 0
	end if
Loop
return rds_barcode.rowcount()
end function

public subroutine f_caculation_ex_tax (double vdc_qty, double vdc_price, double vdc_act_price, integer vi_tax_percent, string vs_include_tax_yn, double vdc_exc, double vdb_currency_id, ref double rdc_price_ex, ref double rdc_act_price_ex, ref double rdc_amt_ex, ref double rdc_act_amt_ex, ref double rdc_base_amt_ex, ref double rdc_act_base_amt_ex, t_dw_mpl vdw_handling, double vdb_base_price);double				ldb_base_round_id,ldb_round_id,ldb_price_round_id,ldb_base_price_ex_tax
decimal				ldc_tmp
c_unit_instance		lc_unit

ldb_round_id = lc_unit.f_get_round_id( vdb_currency_id, 0, 'amount')
ldb_price_round_id = lc_unit.f_get_round_id( vdb_currency_id, 0, 'price')
ldb_base_round_id = lc_unit.f_get_round_id( 0, 0, 'bc')
if trim(upper(vs_include_tax_yn)) = 'N' or isnull(vs_include_tax_yn) or vs_include_tax_yn = "" then
	rdc_price_ex = vdc_price
	rdc_act_price_ex = vdc_act_price
	rdc_amt_ex = lc_unit.f_round(vdw_handling, ldb_round_id,vdc_qty * vdc_price)
	rdc_act_amt_ex = lc_unit.f_round(vdw_handling, ldb_round_id,vdc_qty * vdc_act_price)
	if vdb_base_price > 0 then
		rdc_base_amt_ex = lc_unit.f_round(vdw_handling, ldb_base_round_id,vdc_qty * vdb_base_price)
		rdc_act_base_amt_ex =  lc_unit.f_round(vdw_handling, ldb_base_round_id,vdc_qty * vdb_base_price)
	else
		rdc_base_amt_ex = lc_unit.f_round(vdw_handling, ldb_base_round_id,vdc_qty * vdc_price * vdc_exc)
		rdc_act_base_amt_ex =  lc_unit.f_round(vdw_handling, ldb_base_round_id,vdc_qty * vdc_act_price * vdc_exc)
	end if
elseif trim(upper(vs_include_tax_yn)) = 'Y' then
	if vi_tax_percent = 0 then
		ldc_tmp = 1
	end if
	ldc_tmp = 100/(100 + vi_tax_percent)
	rdc_price_ex = lc_unit.f_round(vdw_handling, ldb_price_round_id,vdc_price * ldc_tmp)
	rdc_act_price_ex = lc_unit.f_round(vdw_handling, ldb_price_round_id,vdc_act_price * ldc_tmp)
	rdc_amt_ex = lc_unit.f_round(vdw_handling, ldb_round_id,vdc_qty * rdc_price_ex)
	rdc_act_amt_ex = lc_unit.f_round(vdw_handling, ldb_round_id,vdc_qty * rdc_act_price_ex)
	if vdb_base_price > 0 then
		ldb_base_price_ex_tax = vdb_base_price * ldc_tmp
		rdc_base_amt_ex = lc_unit.f_round(vdw_handling, ldb_base_round_id,vdc_qty * ldb_base_price_ex_tax)
		rdc_act_base_amt_ex =  lc_unit.f_round(vdw_handling, ldb_base_round_id,vdc_qty * ldb_base_price_ex_tax)
	else
		rdc_base_amt_ex = lc_unit.f_round(vdw_handling, ldb_base_round_id,vdc_qty * rdc_price_ex * vdc_exc)
		rdc_act_base_amt_ex =  lc_unit.f_round(vdw_handling, ldb_base_round_id,vdc_qty * rdc_act_price_ex * vdc_exc)
	end if
end if
end subroutine

public function boolean f_is_managed_qty (double vdb_item_id);boolean			lb_ok
string				ls_qty_yn

setnull(lb_ok)
if isnull(vdb_item_id) or vdb_item_id = 0 then	return lb_ok

select quantity_yn into :ls_qty_yn from item where object_ref_id = :vdb_item_id  using sqlca;

if sqlca.sqlcode = 0 then
	if ls_qty_yn = 'Y' then return true
	return false
else
	gf_messagebox('m.c_item.f_is_managed_qty.01','Thông báo','Lôi Select table:'+sqlca.sqlerrtext,'stop','ok',1)
	return lb_ok
end if
end function

public function integer f_load_worksheet2datastore (oleobject vole_worksheet, ref t_ds_db rds_interface, long vl_startrow, long vl_startcolumn, long vl_colnumber);int				li_colCnt, l_i
string			ls_excelVal, ls_col_type, ls_col_name, ls_col_title
long			ll_insertrow, ll_xlsrow, ll_xlscol
boolean		lb_EOF
c_string		lc_string
t_ds_db		lds_user_profile


ll_xlsrow = vl_startrow
ll_xlscol = vl_startcolumn

DO while not lb_EOF	
	lb_EOF = true   //--là dòng sau cùng --//	
	ll_xlsrow++
	FOR l_i = 1 to vl_colnumber
		ll_xlscol = l_i
		ls_excelVal = string(vole_worksheet.cells(ll_xlsrow,ll_xlscol).value)
		ls_excelVal = lc_string.f_removespecialchar( ls_excelVal)
		ls_excelVal = lc_string.f_remove_doublewhitespace(ls_excelVal )
		
		if ls_excelVal <>'' and not isnull(ls_excelVal) then
			if lb_EOF then
				lb_EOF = false // không phải là dòng cuối --//	
				ll_insertrow = rds_interface.event e_addrow()
			end if				 		 
		else
			continue 
		end if
		if rds_interface.dataobject = 'ds_invoice_excel_nt_grid' then
			choose case ll_xlscol
				case 1,2,3,4,7
					rds_interface.setitem( ll_insertrow, ll_xlscol, ls_excelVal)
				case 5,6,8
					rds_interface.setitem( ll_insertrow,ll_xlscol,double(ls_excelVal))
				case 9
					rds_interface.setitem( ll_insertrow,ll_xlscol, date(ls_excelVal))
			end choose
		elseif rds_interface.dataobject = 'ds_receipt_excel_nt_grid' then
			choose case ll_xlscol
				case 1,2,3,5
					rds_interface.setitem( ll_insertrow, ll_xlscol, ls_excelVal)
				case 6
					rds_interface.setitem( ll_insertrow,ll_xlscol,double(ls_excelVal))
				case 4
					rds_interface.setitem( ll_insertrow,ll_xlscol, date(ls_excelVal))
			end choose
		end if
	NEXT
	
LOOP
return 1
end function

public function string f_get_path_pic (string vs_obj_type, string vs_obj_ref_name, string vs_pic_name);string		ls_patch

if vs_obj_type <> '' then
	select valueset_value.name into :ls_patch
	from valueset_value join FLEXIBLE_DATA on valueset_value.object_ref_id = FLEXIBLE_DATA.id
	where valueset_value.code = :vs_obj_type and FLEXIBLE_DATA.code = 'u_valueset_entry@pat_pic_obj' using sqlca;
	if not isnull(ls_patch) then
		ls_patch = vs_pic_name + '.filename=' + "'" + ls_patch + vs_obj_ref_name + ".png'"
	end if
end if
if isnull(ls_patch) then ls_patch = ''
return ls_patch
end function

public function integer f_get_object_sales_info (double vdb_object_id, string vs_object_code, ref any raa_info[]);/**************************************
Hàm lấy thông tin khách hàng khi kết khác chi nhánh
vdb_f_branch_id: chi nhánh bên from
vdb_t_branch_id: chi nhánh bên to
vdb_company_id: công ty hiện tại
raa_info[]:			thông tin khách hàng
raa_info[1]:	id khách hàng					;	raa_info[8]: 	Tiền giao dịch
raa_info[2]:	Mã KH							;	raa_info[9]: 	id phương thức t.toán
raa_info[3]:	Tên KH							;	raa_info[10]:	Mã pt t.toán
raa_info[4]: Địa chỉ							;	raa_info[11]:	Tên pt t.toán
raa_info[5]:	id người liên hệ					;	raa_info[12]:	id thời hàn t.toán
raa_info[6]: Tên người lh					;	raa_info[13]:	Mã th t.toán
raa_info[7]:	id tiền giao dịch				;	raa_info[14]:	Tên th t.toán
raa_info[15]: id nv phụ trách kh
return 0 : không có khách hàng
**************************************/
t_ds_db	lds_object_sales
any		laa_data[]
long		ll_cnt

lds_object_sales = create t_ds_db
lds_object_sales.dataobject = 'dd_object_sales'
lds_object_sales.f_settransobject( SQLCA)

if vdb_OBJECT_id = 0 and vs_object_code <> '' then
	laa_data[1] = '=' + vs_object_code
	laa_data[2] = 'Y'
	lds_object_sales.f_add_where( 'code;active_yn', laa_data)
elseif vdb_OBJECT_id > 0  then
	laa_data[1] = vdb_object_id
	laa_data[2] = 'Y'
	lds_object_sales.f_add_where( 'ID;active_yn', laa_data)
elseif vdb_OBJECT_id = 0 and vs_object_code = '' then
	return 0
end if

ll_cnt = lds_object_sales.retrieve( )
if ll_cnt > 0 then
	raa_info[1] = lds_object_sales.getitemnumber( ll_cnt, 'ID')
	raa_info[2] = lds_object_sales.getitemstring( ll_cnt, 'code')
	raa_info[3] = lds_object_sales.getitemstring( ll_cnt, 'name')
	raa_info[4] = lds_object_sales.getitemstring( ll_cnt, 'address')
	raa_info[5] = lds_object_sales.getitemnumber( ll_cnt, 'contact_id')
	raa_info[6] = lds_object_sales.getitemstring( ll_cnt, 'contact_name')
	raa_info[7] = lds_object_sales.getitemnumber( ll_cnt, 'currency_id')
	raa_info[8] = lds_object_sales.getitemstring( ll_cnt, 'currency_code')
	raa_info[9] = lds_object_sales.getitemnumber( ll_cnt, 'payment_method_id')
	raa_info[10] = lds_object_sales.getitemstring( ll_cnt, 'payment_method_code')
	raa_info[11] = lds_object_sales.getitemstring( ll_cnt, 'payment_method_name')
	raa_info[12] = lds_object_sales.getitemnumber( ll_cnt, 'payment_term_id')
	raa_info[13] = lds_object_sales.getitemstring( ll_cnt, 'payment_term_code')
	raa_info[14] = lds_object_sales.getitemstring( ll_cnt, 'payment_term_name')
	raa_info[15] = lds_object_sales.getitemnumber( ll_cnt, 'handled_by')
end if
destroy lds_object_sales
return ll_cnt
end function

public function integer f_get_item_info (double vdb_item_id, string vs_item_code, ref any raa_info[]);/**************************************
Hàm lấy thông tin mã hàng khi biết id hoặc mã hàng
vdb_item_id: id hàng hóa
vs_item_code: mã hàng hóa
raa_info[]:			thông tin hàng hóa
raa_info[1]:	id hàng hóa					;	raa_info[8]: 	id quy cách
raa_info[2]:	Mã hàng							
raa_info[3]:	Tên hàng					
raa_info[4]: đơn vị						
raa_info[5]:	id đơn vị					
raa_info[6]: quy cách					
raa_info[7]: tên quy cách			
return 0 : không có khách hàng
**************************************/
t_ds_db	lds_object_sales
any		laa_data[]
long		ll_cnt

lds_object_sales = create t_ds_db
lds_object_sales.dataobject = 'dd_object_item'
lds_object_sales.f_settransobject( SQLCA)

if vdb_item_id = 0 and vs_item_code <> '' then
	laa_data[1] = '=' +vs_item_code
	laa_data[2] = 'Y'
	lds_object_sales.f_add_where( 'code;active_yn', laa_data)
elseif vdb_item_id > 0  then
	laa_data[1] = vdb_item_id
	laa_data[2] = 'Y'
	lds_object_sales.f_add_where( 'ID;active_yn', laa_data)
elseif vdb_item_id = 0 and vs_item_code = '' then
	return 0
end if
ll_cnt = lds_object_sales.retrieve( )
if ll_cnt > 0 then
	raa_info[1] = lds_object_sales.getitemnumber( ll_cnt, 'ID')
	raa_info[2] = lds_object_sales.getitemstring( ll_cnt, 'code')
	raa_info[3] = lds_object_sales.getitemstring( ll_cnt, 'name')
	raa_info[4] = lds_object_sales.getitemstring( ll_cnt, 'uom_code')
	raa_info[5] = lds_object_sales.getitemnumber( ll_cnt, 'stock_uom')
	raa_info[6] = lds_object_sales.getitemstring( ll_cnt, 'spec_code')
	raa_info[7] = lds_object_sales.getitemstring( ll_cnt, 'spec_name')
	raa_info[8] = lds_object_sales.getitemnumber( ll_cnt, 'spec_id')
end if
destroy lds_object_sales
return ll_cnt
end function

public function double f_get_posting_group (double vdb_object_id);double		ldb_id
string			ls_sqlnowhere

if not isvalid(ids_attribute) then
	ids_attribute = create t_ds_db
	ids_attribute.dataobject = 'ds_object'
	ids_attribute.f_getcurrentsql(ls_sqlnowhere , ids_attribute.is_originalwhereclause )
end if

if isnull(vdb_object_id) or vdb_object_id = 0 then
	return -1
end if

ids_attribute.f_add_originalwhere( 'o.id= '+string(vdb_object_id), ' AND ')
ids_attribute.f_settransobject( SQLCA)
if ids_attribute.retrieve( ) = 0 then 
	gf_messagebox('m.s_object.f_get_posting_group.01','Thông báo','Không tìm thấy đối tượng có ID:@'+string(vdb_object_id),'exclamation','ok',1)
	return 0
end if

ldb_id = ids_attribute.getitemnumber( 1, 'posting_group')
return ldb_id
end function

public function integer f_load_excelfile (oleobject role_excel, boolean vb_open_dir, string vs_path_name);string 	ls_path_name, ls_file_name, ls_excelversion, ls_curdir,ls_filetype,ls_path,ls_inifile = 'global.ini'
integer 	li_rtn

if not isvalid(role_excel) then return 0

if vb_open_dir then
	ls_curdir = GetCurrentDirectory()
	li_rtn = GetFileOpenName("Open File",ls_path_name, ls_file_name, "XLS", "Excel Files (*.xls),*.xls,"+ "Excel Files (*.xlsx),*.xlsx")
	
	If li_rtn < 1 Then return -1
	ChangeDirectory(ls_curdir)
else
	ls_path = ProfileString(ls_inifile,vs_path_name,'path',gs_path_pic)
	ls_file_name = ProfileString(ls_inifile,vs_path_name,'filename','invoice_imp')
	ls_filetype = ProfileString(ls_inifile,vs_path_name,'filetype','xlsx')
	ls_path_name = ls_path + '\' + ls_file_name + '.' + ls_filetype
end if


RegistryGet("HKEY_CLASSES_ROOT\Excel.Application\CurVer","",RegString!,ls_excelversion) // lấy version hiện tại của office
li_rtn = role_excel.ConnectToNewObject(ls_excelversion)
if li_rtn <> 0 then
		MessageBox( "Error", 'Error running MS Excel api.')
		destroy role_excel
		return -1
end if
 role_excel.WorkBooks.Open(ls_path_name)


return 1
end function

public function integer f_get_lot_or_serial_yn (double vdb_item_id, ref string rs_lot_yn, ref string rs_serial_yn);
select nvl(item.lot_yn,'N'),nvl(item.serial_yn,'N') into :rs_lot_yn,:rs_serial_yn 
from item 
where item.object_ref_id = :vdb_item_id using SQLCA;
if SQLCA.sqlcode = 0 then
	return 1
else
	return -1
end if
end function

public function string f_get_warehouse_negative (double vdb_id);int					li_cnt 
string				ls_yn

select count(id) into :li_cnt  from object where id = :vdb_id using sqlca;

if li_cnt = 0 then
	return 'negative_allow'
else
	select nvl(negative_allow_yn,'N') into :ls_yn  from object where id = :vdb_id using sqlca;
	
	if  ls_yn = 'Y' then
		return  'negative_allow'
	else
		return  'negative_not_allow'
	end if
end if
end function

public function string f_get_object_code (double vdb_id);int		li_cnt
string	ls_code

//setnull(ls_code)
if isnull(vdb_id) then return ls_code

select count(code) into :li_cnt from object where id = :vdb_id using sqlca;
if li_cnt = 1 then 
	select code into :ls_code from object where id = :vdb_id using sqlca;
else
	select count(code) into :li_cnt from legal_entity where id = :vdb_id using sqlca;
	if li_cnt = 1 then
		select code into :ls_code from legal_entity where id = :vdb_id using sqlca;
	else
		select count(code) into :li_cnt from valueset_value where id = :vdb_id using sqlca;
		if  li_cnt = 1 then
			select code into :ls_code from valueset_value where id = :vdb_id using sqlca;
		else
			select count(code) into :li_cnt from uom where id = :vdb_id using sqlca;
			if li_cnt = 1 then
				select code into :ls_code from uom where id = :vdb_id using sqlca;
			else
				gf_messagebox('m.b_obj_instantiate.f_get_object_code.01','Thông báo','Không tìm thấy mã đối tượng có ID:@'+string(vdb_id),'exclamation','ok',1) 	
			end if
		end if
	end if
end if

return ls_code

end function

public function boolean f_is_objects (string vs_object_code, string vs_object_type);/*********************************************
hàm kiểm tra code truyền vào có phải là đối tượng theo 
object_type hay không
vs_object_code: 	mã đối tượng muốn kiểm tra
vs_object_type: 	loại của đối tượng cần kiểm tra
các loại đối tượng có thể kiểm tra gồm: STAFF, CUSTOMER, VENDOR, ITEM, BANK, ACCOUNT
*********************************************/
string ls_object_type
int		li_count

ls_object_type = upper(vs_object_type)

select count(code) into :li_count from object 
where code = :vs_object_code and object_ref_table = :ls_object_type and nvl(active_yn,'N') = 'Y' using SQLCA;

if li_count <> 0 then
	return true
else
	return false
end if


end function

public function integer f_update_tax (double vdb_curr_id, double vdb_exrate, t_dw_mpl rdw_master, long vl_row_master, t_dw_mpl rdw_tax_line, long vl_row_tax_line, double vdb_object_ref_id, string vs_changed_colname, integer vi_tax_pct, string vs_filter_org);double				ldb_base_round_id,ldb_round_id, ldb_object_ref_id, ldb_tax_id
double 				ldb_amount_ex_tax, ldb_base_amount_ex_Tax, ldb_tmp_amt, ldb_tax_include_amt, ldb_trans_tax_include_amt
int						li_tax_pct, li_row, li_uprow
string					ls_filter,  ls_uprow_yn, ls_include_yn
c_unit_instance		lc_unit


ldb_round_id = lc_unit.f_get_round_id( vdb_curr_id, 0, 'amount')
ldb_base_round_id = lc_unit.f_get_round_id( 0, 0, 'bc')

//-- tính record thuế hiện tại --//
if vl_row_tax_line > 0 then ldb_tax_id = rdw_tax_line.getitemnumber(vl_row_tax_line,'tax_id')

if vdb_object_ref_id > 0 then 
	ldb_object_ref_id = vdb_object_ref_id
else
	if vl_row_tax_line = 0 then return 0 //-- không có thuế --//
	ldb_object_ref_id = rdw_tax_line.getitemnumber(vl_row_tax_line,'object_ref_id')
end if

ls_filter = "object_ref_id="+string(ldb_object_ref_id)
rdw_tax_line.setfilter(ls_filter)
rdw_tax_line.filter()
if rdw_tax_line.rowcount() = 0 then return 0  //-- không có thuế --//

if vl_row_master = 0 then
	vl_row_master = rdw_master.find(" ID="+string(ldb_object_ref_id), 1 ,rdw_master.rowcount())
	if vl_row_master < 1 then return -1
end if
ldb_amount_ex_tax = rdw_master.getitemnumber(vl_row_master,'AMOUNT_EX_TAX')
ldb_base_amount_ex_Tax = rdw_master.getitemnumber(vl_row_master,'BASE_AMOUNT_EX_TAX')

FOR li_row = 1 to rdw_tax_line.rowcount()
	if ldb_tax_id = rdw_tax_line.getitemnumber(li_row,'tax_id') and vi_tax_pct > 0 then
		li_tax_pct = vi_tax_pct
	else
		li_tax_pct = rdw_tax_line.getitemnumber(li_row,'tax_pct')
		ldb_tax_id =  rdw_tax_line.getitemnumber(li_row,'tax_id')
	end if
	
	rdw_tax_line.setitem(li_row,'TRANS_CURRENCY', vdb_curr_id)
	rdw_tax_line.setitem(li_row,'EXCHANGE_RATE', vdb_exrate)
	
	ls_uprow_yn =  rdw_tax_line.getitemstring(li_row,'UPROW_YN')
	if isnull(ls_uprow_yn) then ls_uprow_yn = 'N'	
	if ls_uprow_yn = 'Y' then
		li_uprow = li_row
		continue
	end if		
	ls_include_yn =  rdw_tax_line.getitemstring(li_row,'INCLUDE_YN')
	if isnull(ls_include_yn) then ls_include_yn = 'N'
	
	ldb_tmp_amt = lc_unit.f_round( rdw_tax_line, ldb_round_id, ldb_amount_ex_tax*li_tax_pct/100)
	rdw_tax_line.setitem(li_row,'TRANS_TAX_AMOUNT', ldb_tmp_amt)	
	if ls_include_yn = 'Y' then
		ldb_trans_tax_include_amt += ldb_tmp_amt
	end if	
	
	ldb_tmp_amt = lc_unit.f_round( rdw_tax_line, ldb_base_round_id,  ldb_base_amount_ex_Tax*li_tax_pct/100)
	rdw_tax_line.setitem(li_row,'TAX_AMT', ldb_tmp_amt)
	rdw_tax_line.setitem(li_row,'TAX_CORRECTION',  ldb_tmp_amt)		
	if ls_include_yn = 'Y' then
		ldb_tax_include_amt += ldb_tmp_amt
	end if

NEXT

if li_uprow > 0 then
	ldb_tmp_amt = lc_unit.f_round( rdw_tax_line, ldb_round_id, (ldb_amount_ex_tax+ldb_trans_tax_include_amt)*li_tax_pct/100)
	rdw_tax_line.setitem(li_uprow,'TRANS_TAX_AMOUNT', ldb_tmp_amt)			
	ldb_tmp_amt = lc_unit.f_round( rdw_tax_line, ldb_base_round_id, (ldb_base_amount_ex_Tax + ldb_tax_include_amt)*li_tax_pct/100)
	rdw_tax_line.setitem(li_uprow,'TAX_AMT', ldb_tmp_amt)
	rdw_tax_line.setitem(li_uprow,'TAX_CORRECTION',  ldb_tmp_amt)		
end if

if vs_filter_org <> '?' then
	rdw_tax_line.setfilter(vs_filter_org)
	rdw_tax_line.filter()
end if

return 1
end function

public function integer f_update_pic (string vs_pic_ref_table, string vs_pic_ref_field, string vs_pic_ref_colname, blob vblb_picture, long vl_row, ref datawindow rdw_handling);long 		ll_rtn,ll_ref_id
string 		ls_sql
	
//	this.f_getparentwindow( lw_parent)
//	lc_object_handle_parent = lw_parent.dynamic f_get_obj_handling()
//	lc_object_handle_parent.dynamic f_get_dwo(lc_s_str_dwo)
//	
//	for ll_idx = 1 to upperbound(lc_s_str_dwo)
//		if lc_s_str_dwo[ll_idx].s_dwo_default = this.dataobject then
//			ls_pic_ref_table = lc_s_str_dwo[ll_idx].s_pic_ref_table
//			ls_pic_ref_field = lc_s_str_dwo[ll_idx].s_pic_ref_field
//			exit
//		end if
//	next
	ll_ref_id = rdw_handling.getitemnumber( vl_row, vs_pic_ref_field)
	ls_sql = 'UPDATE '+vs_pic_ref_table+' SET ' + vs_pic_ref_colname+ ' = ? WHERE ID = ? '
	
	//--Tạo sql động cú pháp 2--//
	PREPARE SQLSA         
		FROM  :ls_sql
		using SQLCA;
	EXECUTE SQLSA        
		USING :vblb_picture,:ll_ref_id ;
	
	ll_rtn = SQLCA.sqlcode
	if ll_rtn = 0 then
		COMMIT USING SQLCA ;
	end if
	return ll_rtn
end function

public function boolean f_is_managed_value (double vdb_item_id);boolean			lb_ok
string				ls_value_yn

setnull(lb_ok)
if isnull(vdb_item_id) or vdb_item_id = 0 then	return lb_ok

select value_yn into :ls_value_yn from item where object_ref_id = :vdb_item_id  using sqlca;

if sqlca.sqlcode = 0 then
	if ls_value_yn = 'Y' then return true
	return false
else
	gf_messagebox('m.c_item.f_is_managed_qty.01','Thông báo','Lôi Select table:'+sqlca.sqlerrtext,'stop','ok',1)
	return lb_ok
end if
end function

public subroutine f_get_data_copied (ref t_ds_db rads_copied[], ref s_str_dwo_related rstr_dwo_related[], t_ds_db vads_handling[], string vs_type_copy, string vs_obj_related);int			li_idx,li_count_dwo_copy,li_idx1
t_ds_db	lds_temp

lds_temp = create t_ds_db
for li_idx = 1 to upperbound(rstr_dwo_related[])
	if vs_obj_related <> rstr_dwo_related[li_idx].s_related_obj_name then continue //--nếu không phải obj cần copy thì bỏ qua--/
	li_count_dwo_copy = upperbound(rstr_dwo_related[li_idx].s_main_obj_dwo_copy)
	if li_count_dwo_copy > 0 then
		for li_idx1 = 1 to li_count_dwo_copy
//			rads_copied[li_idx1] = create t_ds_db

		next
	end if
next
destroy lds_temp
return 
end subroutine

public function integer f_calculator_sal_invoice (string vs_colname, string vs_editdata, long vl_currentrow, any vaa_data[], ref datawindow rdw_handling);/******************************************************************************************
Hàm tính toán item_change của c_sal_invoice
tham số vaa_data[] gồm:
vaa_data[1]:	item_id là ID của hàng hóa
vaa_data[2]:	object_id là ID của đối tượng( khách hàng, nhà cung cấp, tài khoản )
vaa_data[3]:	trans_date là ngày chứng từ lấy từ document
vaa_data[4]:	currency_id là ID loại tiền giao dịch ở booked_lip
vaa_data[5]:	exc là tỷ giá của loại tiền 
vaa_data[6]:	sales_persion là ID nhân viên kinh doanh lấy ở bảng sal_invoice_line
vaa_data[7]:	round_id là ID làm tròn theo loại tiền giao dịch currency_id, lấy ở booked_lip 
vaa_data[8]:	base_round_id là ID làm tròn theo tiền hạch toán (là VNĐ)
vaa_data[9]:	include_tax_yn là dấu bao gồm thuế lấy ở booked_slip
vaa_data[10]:	tax_pct phần trăm thuế
******************************************************************************************/

c_unit_instance		lc_unit

choose case vs_colname
	case 'amount'
		if rdw_handling.getitemstring(vl_currentrow,'object_type') = 'ACCOUNT' then
//			ldc_base_amount = lc_unit.f_round(rdw_handling, ldb_base_round_id,double(vs_editdata) * ldc_exc)
//			rpo_dw.setitem(vl_currentrow,'base_amount',ldc_base_amount)
//			rpo_dw.setitem(vl_currentrow,'act_amount',double(vs_editdata))
//			rpo_dw.setitem(vl_currentrow,'act_base_amount',ldc_base_amount)
//			rpo_dw.setitem(vl_currentrow,'amount_ex_tax',double(vs_editdata))
//			rpo_dw.setitem(vl_currentrow,'act_amount_ex_tax',double(vs_editdata))
//			rpo_dw.setitem(vl_currentrow,'base_amount_ex_tax',ldc_base_amount)
//			rpo_dw.setitem(vl_currentrow,'act_base_amount_ex_tax',ldc_base_amount)
		end if
end choose
return 0
end function

public function integer f_calculation_disc (double vdb_price, integer vi_discount_pct, ref double rdb_discounted_prices, string vs_price_type);/**************************************
vdb_price 					giá gốc 
vi_discount_pct				% chiết khấu
rdb_discounted_prices		giá đã chiết khấu
vs_price_type				loại giá
**************************************/
if vdb_price = 0 then
	return 0
else
	if vs_price_type = 'SALES' then
		rdb_discounted_prices = vdb_price * (1 + (vi_discount_pct/100))
	else
		rdb_discounted_prices = vdb_price * (1 - (vi_discount_pct/100))
	end if
	return 1
end if
return 0
end function

public function double f_get_objects_id (string vs_code, ref double radb_id[]);string		ls_select
double	ladb_id[]


select obj.id , cus.id, org.id, peo.id, ba.id,  peo2.id
		into :ladb_id[1], :ladb_id[2], :ladb_id[3], :ladb_id[4], :ladb_id[5], :ladb_id[6]
from object obj join customer cus on cus.object_ref_id = obj.id
                       join ORGANIZATION org on org.object_ref_id = cus.id
                       Left join PEOPLE peo on peo.object_ref_id = cus.id
                       join BUSINESS_ADDRESS ba on ba.object_ref_id = cus.id
                       left join (select max(people.id) id,PEOPLE.object_ref_id
                                    from PEOPLE
                                    where PEOPLE.main_yn = 'Y'
                                    group by PEOPLE.object_ref_id) peo2 on peo2.object_ref_id = ba.id
Where obj.code = :vs_code and obj.object_ref_id = :is_table using SQLCA;
radb_id[] = ladb_id[]
return upperbound(radb_id[])
end function

public function string f_get_balance_control (double vdb_id);string			ls_balance_control

SELECT balance_control into :ls_balance_control
FROM ACCOUNT
where object_ref_id = :vdb_id using sqlca;

if sqlca.sqlcode = 0 then
	return ls_balance_control
else
	return ''
end if
end function

public function string f_get_object_control_yn (double vdb_id);string			ls_obj_control

SELECT OBJ_CONTROL_YN into :ls_obj_control
FROM ACCOUNT
where object_ref_id = :vdb_id using sqlca;

if sqlca.sqlcode = 0 then
	if isnull(ls_obj_control) then ls_obj_control ='N'
	return ls_obj_control
else
	return ''
end if
end function

public function integer f_get_ds_import (string vs_file_type, string vs_patch, string vs_file_name, string vs_colnumber, ref t_ds_db rds_import);/***********************************************************
Hàm lấy chi tiết barcode từ thư mục khai báo sẳng(global) hoặc truyền vào.
vs_file_type:		Loại file cần lấy data (csv hoặc xls, xlsx).
vs_patch:			đường dẫn thư mục chứa file.
vs_file_name: 		tên file.
rds_import:		dataobject 
***********************************************************/
OLEobject	lole_excel, lole_worksheet
string			ls_file_type,ls_filename,ls_path,ls_inifile = 'global.ini',ls_colnum
long			ll_startrow,ll_sartcol,ll_endcol
int				li_rtn

//-- kiểm tra đường dẫn--//
if isnull(vs_patch) or vs_patch = '' then
	ls_path = ProfileString(ls_inifile,'path file','path',gs_path_pic)
else
	ls_path = vs_patch
end if
//--kiểm tra tên file--//
if isnull(vs_file_name) or vs_file_name = '' then
	ls_filename = ProfileString(ls_inifile,'path file','filename','invoice_imp')
else
	ls_filename = vs_file_name
end if
//--kiểm tra loại file--//
if isnull(vs_file_type) or vs_file_type = '' then
	ls_file_type = ProfileString(ls_inifile,'path file','filetype','csv')
else
	ls_file_type = vs_file_type
end if
//-- lấy dòng bắt đầu import --//
ll_startrow = long(ProfileString(ls_inifile,'path file','startrow','2'))

if ls_path <> '' and ls_filename <> '' then 
	ls_path = ls_path + '\' + ls_filename + '.' + ls_file_type
else
	return 0
end if
if vs_colnumber = '' or isnull(vs_colnumber) then
	ls_colnum = ProfileString(ls_inifile,'path file','colnumber','1')
else
	ls_colnum = vs_colnumber
end if
if pos(ls_file_type,'xls') > 0 then
	lole_excel = create OLEobject
	if this.f_load_excelfile( lole_excel,ls_path) = -1 then return -1
	lole_worksheet = lole_excel.ActiveWorkbook.ActiveSheet
	this.f_load_excel2datastore( lole_worksheet, rds_import, ll_startrow, long(ls_colnum))
	
	lole_Excel.DisplayAlerts = false
	lole_Excel.application.quit()
	lole_Excel.DisconnectObject()
	destroy lole_Excel
else
	li_rtn = rds_import.importfile(ls_path)
end if

return rds_import.rowcount()





//ls_path = ProfileString(ls_inifile,'path file','path',gs_path_pic)
//ls_filename = ProfileString(ls_inifile,'path file','filenamein','PXK_IN')
//li_rtn = lds_lot_line.importfile( ls_path + '\' + ls_filename + '.csv')
////ldw_main = iw_display.f_get_dwmain( )
//if li_rtn > 0 then
////	ib_importing = true
//	lds_lot_line.setsort( "lot_no asc")
//	lds_lot_line.sort( )
////	iw_display.event e_modify( )
////	ldw_lot_line = iw_display.f_get_dw( 'd_lot_line_grid')
//	ldw_inven_line = ldw_lot_line.f_get_idw_master( )
//	for li_idx = 1 to ldw_inven_line.rowcount( )
//		if ls_item_code_1 <> '' then ls_item_code_1 += ';'
//		ls_item_code_1 += ldw_inven_line.getitemstring( li_idx, 'item_code')
//		if ls_ivn_id <> '' then ls_ivn_id += ','
//		ls_ivn_id += string(ldw_inven_line.getitemnumber( li_idx, 'id') )
//	next
//	laa_data[1] = '('+ls_item_code_1+')'
//	lds_item_lot.f_add_where( 'item_code', laa_data)
//	lds_item_lot.retrieve( )
//	ls_org_filter = ldw_lot_line.describe( "datawindow.table.filter")
//	ldw_lot_line.setfilter( "object_ref_id IN (" + ls_ivn_id + ")")
//	ldw_lot_line.filter( )
//	for li_idx = 1 to lds_lot_line.rowcount( )
//		ls_serial = lds_lot_line.getitemstring( li_idx , 'lot_no')
//		if isnull(ls_serial) then ls_serial = ''
//		ll_find_lot = lds_item_lot.find( "lot_no = '" + ls_serial + "'", 1,lds_item_lot.rowcount())
//		if ll_find_lot = 0 then continue
//		li_qty = lds_lot_line.getitemnumber( li_idx, 'qty')
//		if isnull(li_qty) then li_qty = 0
//		if ls_item_code <> left(ls_serial,5) then ls_item_code = left(ls_serial,5)
////		ldb_version_id = vdw_main.getitemnumber( ldw_main.getrow( ) , 'version_id')
//		ll_find_item = ldw_inven_line.find( "item_code = '"+ls_item_code+"' and object_ref_id = " + string(ldb_version_id), 1, ldw_inven_line.rowcount( ) )
//		//set tổng số lượng
//		if ll_find_item > 0 then
//			if (ldb_ivn_id > 0 and ldb_ivn_id <> ldw_inven_line.getitemnumber( ll_find_item, 'ID')) or li_idx = lds_lot_line.rowcount( ) then
//				ldw_lot_line.setfilter( "object_ref_id IN (" + string(ldb_ivn_id) + ")")
//				ldw_lot_line.filter( )
//				ll_count = ldw_lot_line.rowcount( )
//				if li_idx = lds_lot_line.rowcount( ) then ll_count ++
//				ldw_inven_line.setitem( ldw_inven_line.find( "ID = "+string(ldb_ivn_id), 1, ldw_inven_line.rowcount( )) , 'qty', ll_count)
//				ldw_lot_line.setfilter( "object_ref_id IN (" + ls_ivn_id + ")")
//				ldw_lot_line.filter( )
//			end if
//			ldb_ivn_id = ldw_inven_line.getitemnumber( ll_find_item, 'ID')
//		else
//			continue
//		end if
//		ll_find = ldw_lot_line.find( "lot_no = '"+trim(ls_serial)+"'", 1, ldw_lot_line.rowcount( ) )
//		if ll_find > 0 then continue
//		if li_qty > 0 and ls_serial <> '' then
//			ll_row = ldw_lot_line.event e_addrow( )
//			ldw_lot_line.setitem( ll_row, 'lot_no', ls_serial)
//			ldw_lot_line.setitem( ll_row, 'out_qty', li_qty)
//			ldw_lot_line.setitem( ll_row, 'object_ref_id', ldb_ivn_id)
//		end if
//	next
////	iw_display.event e_saveclose( )
////	ib_importing = false
//	filedelete(ls_path + '\' + ls_filename + '.csv')
//	ldw_lot_line.setfilter( ls_org_filter)
//	ldw_lot_line.filter( )
//end if
//destroy lds_item_lot
//destroy lds_lot_line
return 1
end function

public function string f_get_autonumber (t_dw_mpl vdw_handle, string vs_colname, ref t_ds_db rds_insert, long vl_row, s_object_display vs_obj_display);b_sequences		lb_sequences
//c_dwsetup_initial	lc_dwsetup
double				ldb_seq_id
string					ls_seq_reset_colname, ls_seq_reset_coltext, ls_autonumber, ls_current_autonumber
//date					ld_origin_date, ld_current_date
any					la_origin_reset_data, la_current_reset_data

//-- Kiểm tra cột auto-sequence --//
vs_obj_display.idwsetup_initial.f_get_sequence_info(vdw_handle, vs_colname,ldb_seq_id, ls_seq_reset_colname)

if ldb_seq_id = 0 then return ls_autonumber

if lb_sequences.f_init(ldb_seq_id) = 1 then
	if lb_sequences.is_type = 'manual' then return ls_autonumber
	setnull(ls_current_autonumber)
//	ls_current_autonumber = vdw_handle.getitemstring(vl_row, vs_colname)
	if isnull(ls_current_autonumber) then //-- chưa tạo số --//
		if lb_sequences.is_reset_type = 'none' then
			ls_autonumber = lb_sequences.f_create_autonumber(ldb_seq_id)
		else
			if ls_seq_reset_colname = '' or isnull(ls_seq_reset_colname) then
				gf_messagebox('m.c_dwsetup_initial.f_set_autonumber.01','Thông báo','Chưa cài đặt cột ngày tạo số tự động cho cách đánh số:@'+&
										lb_sequences.is_seq_code + '-' + lb_sequences.is_seq_name, 'exclamation','ok',1)
				return ls_autonumber
			end if		
			if lower(trim(ls_seq_reset_colname)) = 'session_date' then
				la_current_reset_data = gd_session_date
			else
				if vdw_handle.rowcount() > 0 then
					la_current_reset_data = vdw_handle.f_getitemany(vl_row, ls_seq_reset_colname)
				else
					la_current_reset_data = rds_insert.f_getitemany(vl_row, ls_seq_reset_colname)
				end if
			end if
			if isnull(la_current_reset_data) then
//				ls_seq_reset_coltext = vdw_handle.describe(ls_seq_reset_colname+'_t.text')
//				gf_messagebox('m.c_dwsetup_initial.f_set_autonumber.02','Thông báo','Chưa nhập dữ liệu :@'+ls_seq_reset_coltext, 'exclamation','ok',1)			
//				vdw_handle.setitem(vl_row, vs_colname, ls_autonumber)
				return ls_autonumber
			end if
			if lb_sequences.is_reset_type = 'structure' then
				ls_autonumber = lb_sequences.f_create_autonumber(string(la_current_reset_data))			
			else
				ls_autonumber = lb_sequences.f_create_autonumber(date(la_current_reset_data))
			end if
		end if
	else
//		if lb_sequences.is_reset_type = 'none' then return 0		
//		la_origin_reset_data = vdw_handle.f_getitemany(vl_row, ls_seq_reset_colname, primary!, true)
//		la_current_reset_data = vdw_handle.f_getitemany(vl_row, ls_seq_reset_colname, primary!, false)
//		if isnull(la_current_reset_data) then
//			ls_seq_reset_coltext = vdw_handle.describe(ls_seq_reset_colname+'_t.text')
//			gf_messagebox('m.c_dwsetup_initial.f_set_autonumber.02','Thông báo','Chưa nhập dữ liệu :@'+ls_seq_reset_coltext, 'exclamation','ok',1)			
//			return -1
//		end if
//		choose case lb_sequences.is_reset_type 
//			case 'monthly'
//				if month(date(la_current_reset_data)) = month(date(la_origin_reset_data)) then return 0					
//			case 'yearly'
//				if year(date(la_current_reset_data)) = year(date(la_origin_reset_data)) then return 0						
//			case 'daily'
//				if day(date(la_current_reset_data)) = day(date(la_origin_reset_data)) then return 0				
//			case 'structure'
//				if string(la_current_reset_data) = string(la_origin_reset_data) then return 0
//		end choose		
//		
//		if lb_sequences.is_reset_type = 'structure' then
//			//-- xóa seq cũ --//
//			lb_sequences.f_delete_autonumber(ls_current_autonumber, string(la_origin_reset_data))
//			//--tạo seq mới --//
//			ls_autonumber = lb_sequences.f_create_autonumber(string(la_current_reset_data))
//		else
//			//-- xóa seq cũ --//
//			lb_sequences.f_delete_autonumber(ls_current_autonumber, date(la_origin_reset_data))
//			//--tạo seq mới --//
//			ls_autonumber = lb_sequences.f_create_autonumber(date(la_current_reset_data))
//		end if			
	end if
else
	return ls_autonumber
end if

return ls_autonumber

end function

public function integer f_get_employ_info (string vs_employ_code, ref string ras_infor[]);string		lsa_info[]

select obj.code,obj.name,obj1.code,obj1.name,peo.email,peo.master_password,peo.user_password
	into :lsa_info[1], :lsa_info[2], :lsa_info[3], :lsa_info[4], :lsa_info[5], :lsa_info[6], :lsa_info[7]
from object obj join staff on staff.object_ref_id = obj.id
                       join people peo on peo.object_ref_id = staff.id
                       join object obj1 on obj1.id = staff.dept_id
where obj.code = :vs_employ_code using sqlca;
 ras_infor = lsa_info
return upperbound(ras_infor[])
end function

public function string f_get_filterstring (t_dw_mpl vdw_filter, string vs_text);string			ls_filterString, ls_colname[], ls_colType, ls_operator,ls_value,ls_text
string			ls_rtn,ls_ref_expression,ls_ref_data,ls_ref_format,ls_editType
int				li_idx, li_colCnt,li_i
boolean		lb_isnumber = true
c_string		lc_string

if vs_text = '' or isnull(vs_text) then return ''
ls_text = vs_text

li_colCnt = vdw_filter.f_getcolumns(ls_colname[] )

FOR li_idx = 1 to li_colCnt
	if ls_colname[li_idx] = 'gutter' then continue
	ls_colType = vdw_filter.describe(ls_colname[li_idx]+ ".colType")
	ls_editType = vdw_filter.describe(ls_colname[li_idx] + ".Edit.Style")
	If left(ls_colType,5) = 'char(' then
		
		if ls_filterString <> '' then ls_filterString += " OR "
//		ls_text = f_convert_uni2unsign(ls_text)
		ls_filterString += lc_string.f_get_expression( ls_text, ls_colType,ls_colname[li_idx], 'filter')
		
	elseif left(ls_colType,5) = 'numbe' or  left(ls_colType,5) = 'decim' then		
		if lc_string.f_check_data_number(ls_text ) = true then
			ls_value = lc_string.f_get_expression( ls_text, ls_colType,ls_colname[li_idx], 'filter')		
			if pos(ls_value , ' = -1') > 0 and ls_text <> '-1' then continue 
			if ls_filterString <> '' then ls_filterString += " OR "
			ls_filterString += ls_value
		end if
	elseif left(ls_colType,5) = 'date' or  left(ls_colType,5) = 'datet' then

		if ls_filterString <> '' then ls_filterString += " OR "
		ls_filterString += lc_string.f_get_expression( ls_text, ls_colType,ls_colname[li_idx], 'filter')
	end if
NEXT 

return ls_filterString
end function

public function boolean f_is_branch_yn (string vs_object);
int			li_cnt


select count(ID) into :li_cnt
from DWCOLUMN_SETUP_HDR 
where branch_yn = 'Y' and lower(object) = 'u_dwcolumn_setup'  using sqlca;

if li_cnt > 0 then //-- cài đặt bảng phân biệt chi nhánh
	select count(ID) into :li_cnt
	from DWCOLUMN_SETUP_HDR 
	where branch_yn = 'Y' and upper(object) = upper(:vs_object) and branch_id = :gdb_branch using sqlca;	
	if li_cnt > 0 then
		return true
	else
		return false
	end if 
else //-- cài đặt bảng KHÔNG phân biệt chi nhánh
	select count(ID) into :li_cnt
	from DWCOLUMN_SETUP_HDR 
	where branch_yn = 'Y' and upper(object) = upper(:vs_object)  using sqlca;	
	if li_cnt > 0 then
		return true
	else
		return false
	end if 		
end if



end function

public function integer f_get_fiscal_period_id (date vd_transdate, string vs_period_type);int		li_cnt
double		ldb_id
select count(ID) into :li_cnt from FISCAL_PERIOD 
where PERIOD_TYPE = upper(:vs_period_type) and :vd_transdate between FROM_DATE and TO_DATE using sqlca;

if li_cnt = 1 then
	select ID into :ldb_id from FISCAL_PERIOD 
	where PERIOD_TYPE = upper(:vs_period_type) and :vd_transdate between FROM_DATE and TO_DATE using sqlca;

	return ldb_id
else
	return 0
end if
	

end function

public function integer f_get_item_managed_qty_value (double vdb_item, ref string rs_qty_yn, ref string rs_value_yn);/************************************************************************
Chức năng: Trả về ghi sổ số lượng và ghi sổ giá trị

=================================================================*/

int			li_cnt

select count(id) into :li_cnt from  ITEM where object_ref_id = :vdb_item and COMPANY_ID = :gi_user_comp_id and branch_id = :gdb_branch  using sqlca; 

if li_cnt = 1 then
	select nvl(quantity_yn,'N') , nvl(value_yn,'N') into :rs_qty_yn, :rs_value_yn 
	from ITEM
	where object_ref_id = :vdb_item and COMPANY_ID = :gi_user_comp_id and branch_id = :gdb_branch  using sqlca; 
	return 1
else
	gf_messagebox('m.b_obj_instantiate.f_get_item_managed_qty_value.01','Thông báo','Không tìm thấy mã hàng có ID:@'+string(vdb_item),'stop','ok',1)		
	return -1
end if
end function

public function double f_get_manage_group (double vdb_object_id);int			li_cnt
double	ldb_id


if isnull(vdb_object_id) or vdb_object_id = 0 then return 0

select count(id) into :li_cnt from object where id = :vdb_object_id using sqlca;
if li_cnt > 0 then
	select manage_group into :ldb_id from object where id = :vdb_object_id using sqlca;
	return ldb_id
end if
return 0
end function

public function string f_get_uom_code (double vdb_id);
string	ls_code

select code into :ls_code from uom where id = :vdb_id using sqlca;

if sqlca.sqlcode = 0 then
	return ls_code
else
	gf_messagebox('m.b_obj_instantiate.f_get_object_code.01','Thông báo','Không tìm thấy mã đối tượng có ID:@'+string(vdb_id),'exclamation','ok',1) 		
	setnull(ls_code)
	return ls_code
end if
end function

public function integer f_update_hdr_itemchanged (string vs_edit_colname, string vs_editdata, string vs_upd_colname, long vl_line_row, t_dw_mpl vdw_line, t_dw_mpl vdw_currency, t_dw_mpl vdw_tax, double vdb_prevous_exrate);		/*--------------------------------------------------------------------------///
		Mô tả chức năng:
		---------------------------------
								 
			#Thay đổi (currency):
					- Tính lại: price, act_price, PRICE_EX_TAX, ACT_PRICE_EX_TAX
								amount, amount_ex_tax, 
								  base_amount, base_amount_ex_tax, 
								  act_amount, act_amount_ex_tax, 
								  ACT_BASE_AMOUNT_EX_TAX ( không có act_base_amount : do ko cần ghi sổ )
			# thay đổi (ex_rate):
						- Tính lại:
								amount, amount_ex_tax, 
								  base_amount, base_amount_ex_tax, 
								  act_amount, act_amount_ex_tax, 
								  ACT_BASE_AMOUNT_EX_TAX ( không có act_base_amount : do ko cần ghi sổ )			
			#Thay đổi (tax_include)
				tính lại : PRICE_EX_TAX, ACT_PRICE_EX_TAX, ACT_BASE_AMOUNT_EX_TAX, act_amount_ex_tax, amount_ex_tax, base_amount_ex_tax

			@thay đổi (object_code :vendor / customer)
				- Tính lại: price, act_price, PRICE_EX_TAX, ACT_PRICE_EX_TAX
							 amount, amount_ex_tax, 
								  base_amount, base_amount_ex_tax, 
								  act_amount, act_amount_ex_tax, 
								  ACT_BASE_AMOUNT_EX_TAX ( không có act_base_amount : do ko cần ghi sổ )
--------------------------------------
vdw_tax: trường hợp không cập nhất thuế -> truyền NULL 
-----------------------------------------------------------------------------------------
Hàm này đươc gọi sau khi đã cập nhật giá từ bảng giá cho dw-line
================================================	*/	
double		ldb_price,ldb_act_price,  ldb_qty, ldb_act_qty, ldb_ex_rate_old, ldb_ex_rate_cur, ldb_ex_rate_convert, ldb_tax_pct
double 		ldb_amount, ldb_base_amount, ldb_act_amount, ldb_amount_ex_tax, ldb_base_amount_ex_tax, ldb_act_amount_ex_tax
double		ldb_ACT_BASE_AMOUNT_EX_TAX, ldb_act_price_ex_tax, ldb_price_ex_tax, ldb_item_id, ldb_unit_id, ldb_round_id, ldb_cur_id
double		ldb_disc_price,ldb_disc_act_price, ldb_discount_pct, ldb_disc_price_ex_tax, ldb_disc_act_price_ex_tax, ldb_discount_amt
double		ldb_markup_amt, ldb_MARKUP_RETURN, ldb_object_ref_id, ldb_round_id_price, ldb_round_id_amt
double		ldb_round_id_base_amt, ldb_base_cur, ldb_act_base_amount, ldb_comm_pct, ldb_comm_amt
int				li_colCnt, li_idx, li_row
string			lsa_colname[], ls_included_tax_yn, ls_filter_org, ls_filter, ls_base_curcode,ls_base_curname, ls_disc_amt, ls_disc_pct
boolean		lb_upd_dw_cur

c_string				lc_string
c_unit_instance		lc_unit

//-- kiểm tra tên cột discount ở line --//
if vdw_line.dataobject = 'd_qt_line_grid' then
	ls_disc_amt = 'discount'
	ls_disc_pct=  'discount_pct'
else 
	ls_disc_amt = 'disc_amt'
	ls_disc_pct=  'disc_pct'
end if

//-- tính toán lại giá trị các cột liên quan--//
if vs_edit_colname = 'uom_code' then //-- currency --//
	ldb_ex_rate_cur = vdw_currency.getitemnumber( vdw_currency.getrow(), 'exchange_rate' ,primary!, false)	
	if vdb_prevous_exrate = 0 then vdb_prevous_exrate = vdw_currency.getitemnumber( vdw_currency.getrow(), 'exchange_rate' ,primary!, true)	
	if ldb_ex_rate_cur > 0 then	ldb_ex_rate_convert = vdb_prevous_exrate/ldb_ex_rate_cur

	
	ldb_cur_id = vdw_currency.getitemnumber( vdw_currency.getrow(), 'CURRENCY_ID' )
	ls_included_tax_yn = vdw_currency.getitemstring(vdw_currency.getrow(), 'include_tax_yn')
	if isnull(ls_included_tax_yn) then ls_included_tax_yn ='N'	
	 //-- chuẩn bị cho làm tròn  --//
	lc_unit.f_get_base_cur(ldb_base_cur,  ls_base_curcode,ls_base_curname)
	if ldb_base_cur > 0 then ldb_round_id_base_amt =  lc_unit.f_get_round_id( ldb_base_cur, 0, 'amount')
	if ldb_cur_id > 0 then ldb_round_id_amt = lc_unit.f_get_round_id( ldb_cur_id, 0, 'amount')	
	if ldb_cur_id > 0 then ldb_round_id_price = lc_unit.f_get_round_id( ldb_cur_id, 0, 'price')	
	
	li_colCnt = lc_string.f_stringtoarray( vs_upd_colname, ';', lsa_colname[])
	FOR  li_row = 1 to vdw_line.rowcount()
		ldb_price = vdw_line.getitemnumber(li_row, 'price')
		if  vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid'  then
			ldb_act_price = vdw_line.getitemnumber(li_row, 'act_price')		
		end if		
		if vdw_line.dataobject <> 'd_po_line_grid'  then ldb_tax_pct =  vdw_line.getitemnumber(li_row, 'tax_pct')				
		if isnull(ldb_tax_pct) then ldb_tax_pct = 0
		//-- kiểm tra disc --//	
		ldb_discount_pct =  vdw_line.getitemnumber(vl_line_row, ls_disc_pct)
		if isnull(ldb_discount_pct) then ldb_discount_pct = 0
		ldb_discount_amt = vdw_line.getitemnumber(vl_line_row, ls_disc_amt)
		if isnull(ldb_discount_amt) then ldb_discount_amt = 0
		if  ldb_discount_amt > 0 and ldb_discount_pct = 0  then
			if (ldb_price - ldb_discount_amt) <= 0 then
				gf_messagebox('m.b_obj_instantiate.f_update_line_edit_change.01','Thông báo','Số tiền chiết khấu phải nhỏ hơn hơn đơn giá','stop','ok',1) 
				return -1
			end if					
			ldb_discount_pct  = round(ldb_discount_amt/ (ldb_price - ldb_discount_amt) * 100, 2)
		end if		
		if ldb_ex_rate_convert > 0 then ldb_price = ldb_price * ldb_ex_rate_convert
		if ldb_round_id_price > 0 then  ldb_price = lc_unit.f_round( vdw_line, ldb_round_id_price, ldb_price)
		
		if ldb_ex_rate_convert > 0 then ldb_act_price = ldb_act_price * ldb_ex_rate_convert
		if ldb_round_id_price > 0 then  ldb_act_price = lc_unit.f_round( vdw_line, ldb_round_id_price, ldb_act_price)
		
		//-- tính act_price , price_ex_tax, act_price_ax_tax --//
		if ls_included_tax_yn ='N' or ldb_tax_pct <= 0 then
			ldb_price_ex_tax = ldb_price
			ldb_act_price_ex_tax = ldb_act_price
		else
			ldb_price_ex_tax = ldb_price * (1/ldb_tax_pct)
			if ldb_round_id_price > 0 then  ldb_price_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_price, ldb_price_ex_tax)
			ldb_act_price_ex_tax = ldb_act_price * (1/ldb_tax_pct)
			if ldb_round_id_price > 0 then  ldb_act_price_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_price, ldb_act_price_ex_tax)
		end if
		//-- tính amount liên quan--//
		ldb_qty = vdw_line.getitemnumber(li_row, 'qty')
		if  vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid'  then
			ldb_act_qty =  vdw_line.getitemnumber(li_row, 'act_qty')	
		end if
		if 	ldb_discount_pct > 0 then  //-- tính giá sâu khi trừ discount_pct --//
			ldb_disc_price = ldb_price *(1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))		
			ldb_amount = ldb_qty * ldb_disc_price  
			if ldb_round_id_amt > 0 then  ldb_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount)
		else
			ldb_amount = ldb_qty * ldb_price 
			if ldb_round_id_amt > 0 then  ldb_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount)
		end if		
		
		ldb_base_amount = ldb_amount * ldb_ex_rate_cur 
		if ldb_round_id_base_amt > 0 then  ldb_base_amount = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_base_amount)
		if 	ldb_discount_pct > 0 then  //-- tính giá sâu khi trừ discount_pct --//
			ldb_disc_price_ex_tax = ldb_price_ex_tax *(1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100)) //-- giá đã triết khấu ko làm tròn --//
			ldb_amount_ex_tax = ldb_qty * ldb_disc_price_ex_tax   
			if ldb_round_id_amt > 0 then  ldb_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount_ex_tax)
		else
			ldb_amount_ex_tax = ldb_qty * ldb_price_ex_tax 
			if ldb_round_id_amt > 0 then  ldb_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount_ex_tax)
		end if				
		
		ldb_base_amount_ex_tax = ldb_amount_ex_tax * ldb_ex_rate_cur
		if 	ldb_discount_pct > 0 then  //-- tính giá sâu khi trừ discount_pct --//
			ldb_disc_act_price = ldb_act_price *(1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))		 //-- giá đã triết khấu ko làm tròn --//
			ldb_act_amount = ldb_act_qty * ldb_disc_act_price  
			if ldb_round_id_amt > 0 then  ldb_act_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount)
		else
			ldb_act_amount = ldb_act_qty * ldb_act_price
			if ldb_round_id_amt > 0 then  ldb_act_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount)
		end if					
		ldb_act_base_amount = ldb_act_amount * ldb_ex_rate_cur	
		if ldb_round_id_base_amt > 0 then ldb_act_base_amount = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_act_base_amount)
		 	
		if 	ldb_discount_pct > 0 then  //-- tính giá sâu khi trừ discount_pct --//
			ldb_disc_act_price_ex_tax = ldb_act_price_ex_tax *(1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))		
			ldb_act_amount_ex_tax =  ldb_act_qty * ldb_disc_act_price_ex_tax 
			if ldb_round_id_amt > 0 then  ldb_act_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount_ex_tax)
			if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
				ldb_comm_pct =  vdw_line.getitemnumber(li_row,'comm_pct')
				if ldb_comm_pct > 0 then
					ldb_comm_amt = ldb_act_amount_ex_tax * ldb_comm_pct/100 / ( 1 + ldb_comm_pct/100)
					if ldb_round_id_amt > 0 then ldb_comm_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_comm_amt)
				end if			
			end if
		else
			ldb_act_amount_ex_tax =  ldb_act_qty * ldb_act_price_ex_tax
			if ldb_round_id_amt > 0 then  ldb_act_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount_ex_tax)
			if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
				ldb_comm_pct =  vdw_line.getitemnumber(li_row,'comm_pct') // tinh lai hoa hong --//
				if ldb_comm_pct > 0 then
					ldb_comm_amt = ldb_act_amount_ex_tax * ldb_comm_pct/100 / ( 1 + ldb_comm_pct/100)
					if ldb_round_id_amt > 0 then ldb_comm_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_comm_amt)
				end if		
			end if
		end if						
		 	
		ldb_ACT_BASE_AMOUNT_EX_TAX = ldb_act_amount_ex_tax * ldb_ex_rate_cur 			
		if ldb_round_id_base_amt > 0 then  ldb_ACT_BASE_AMOUNT_EX_TAX = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_ACT_BASE_AMOUNT_EX_TAX)
		//-- tính thuế --//	
		ldb_object_ref_id = vdw_line.getitemnumber(li_row, 'id')
		this.f_update_tax_appeon( ldb_cur_id, ldb_ex_rate_cur, vdw_tax, ldb_object_ref_id, ldb_tax_pct, ldb_amount_ex_tax, ldb_base_amount_ex_tax, 0)	
		
		//-- Cập nhật lại line --//
		FOR li_idx = 1 to li_colCnt
			if lsa_colname[li_idx] = 'amount' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_amount)
			elseif lsa_colname[li_idx] = 'base_amount' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_base_amount)
			elseif lsa_colname[li_idx] = 'act_amount' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_act_amount)
			elseif lsa_colname[li_idx] = 'amount_ex_tax' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_amount_ex_tax)
			elseif lsa_colname[li_idx] = 'base_amount_ex_tax' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_base_amount_ex_tax)
			elseif lsa_colname[li_idx] = 'act_amount_ex_tax' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_act_amount_ex_tax)
			elseif lsa_colname[li_idx] = 'act_base_amount_ex_tax' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_act_base_amount_ex_tax)
			elseif lsa_colname[li_idx] = 'price' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_price)
			elseif lsa_colname[li_idx] = 'act_price' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_act_price)
			elseif lsa_colname[li_idx] = 'price_ex_tax' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_price_ex_tax)
			elseif lsa_colname[li_idx] = 'act_price_ex_tax' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_act_price_ex_tax)		
			elseif lsa_colname[li_idx] = 'markup_return' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_markup_return)				
			elseif lsa_colname[li_idx] = 'act_qty' then
				vdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_act_qty)		
			elseif lsa_colname[li_idx] = 'act_base_amount' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_act_base_amount)				
			elseif lsa_colname[li_idx] = 'comm_pct' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_comm_pct)				
			elseif lsa_colname[li_idx] = 'comm_amt' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_comm_amt)						
			end if						
		NEXT		
	NEXT	
elseif vs_edit_colname = 'exchange_rate' then
	ldb_ex_rate_cur = double(vs_editdata)
	
	ldb_cur_id = vdw_currency.getitemnumber( vdw_currency.getrow(), 'CURRENCY_ID' )
	 //-- chuẩn bị cho làm tròn  --//
	lc_unit.f_get_base_cur(ldb_base_cur,  ls_base_curcode,ls_base_curname)
	if ldb_base_cur > 0 then ldb_round_id_base_amt =  lc_unit.f_get_round_id( ldb_base_cur, 0, 'amount')
	
	li_colCnt = lc_string.f_stringtoarray( vs_upd_colname, ';', lsa_colname[])
	FOR  li_row = 1 to vdw_line.rowcount()
		
		ldb_amount = vdw_line.getitemnumber(li_row, 'amount')
		ldb_base_amount = ldb_amount * ldb_ex_rate_cur 
		if ldb_round_id_base_amt > 0 then  ldb_base_amount = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_base_amount)
		ldb_amount_ex_tax = vdw_line.getitemnumber(li_row, 'amount_ex_tax')
		ldb_base_amount_ex_tax = ldb_amount_ex_tax * ldb_ex_rate_cur
		if ldb_round_id_base_amt > 0 then  ldb_base_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_base_amount_ex_tax)
		if  vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid'  then
			ldb_act_amount_ex_tax =  vdw_line.getitemnumber(li_row, 'act_amount_ex_tax')
		end if
		ldb_ACT_BASE_AMOUNT_EX_TAX = ldb_act_amount_ex_tax * ldb_ex_rate_cur 			
		if ldb_round_id_base_amt > 0 then  ldb_ACT_BASE_AMOUNT_EX_TAX = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_ACT_BASE_AMOUNT_EX_TAX)
		//-- tính thuế --//	
		if vdw_line.dataobject <> 'd_po_line_grid'  then ldb_tax_pct = vdw_line.getitemnumber(li_row, 'tax_pct')
		ldb_object_ref_id = vdw_line.getitemnumber(li_row, 'id')

		this.f_update_tax_appeon( ldb_cur_id, ldb_ex_rate_cur, vdw_tax, ldb_object_ref_id, ldb_tax_pct, ldb_amount_ex_tax, ldb_base_amount_ex_tax,0)	
		
		//-- Cập nhật lại line --//
		FOR li_idx = 1 to li_colCnt
			if lsa_colname[li_idx] = 'amount' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_amount)
			elseif lsa_colname[li_idx] = 'base_amount' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_base_amount)
			elseif lsa_colname[li_idx] = 'act_amount' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_act_amount)
			elseif lsa_colname[li_idx] = 'amount_ex_tax' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_amount_ex_tax)
			elseif lsa_colname[li_idx] = 'base_amount_ex_tax' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_base_amount_ex_tax)
			elseif lsa_colname[li_idx] = 'act_amount_ex_tax' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_act_amount_ex_tax)
			elseif lsa_colname[li_idx] = 'act_base_amount_ex_tax' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_act_base_amount_ex_tax)
			elseif lsa_colname[li_idx] = 'price' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_price)
			elseif lsa_colname[li_idx] = 'act_price' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_act_price)
			elseif lsa_colname[li_idx] = 'price_ex_tax' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_price_ex_tax)
			elseif lsa_colname[li_idx] = 'act_price_ex_tax' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_act_price_ex_tax)		
			elseif lsa_colname[li_idx] = 'markup_return' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_markup_return)		
			elseif lsa_colname[li_idx] = 'act_qty' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_act_qty)		
			elseif lsa_colname[li_idx] = 'comm_pct' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_comm_pct)				
			elseif lsa_colname[li_idx] = 'comm_amt' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_comm_amt)									
			end if						
		NEXT		
	NEXT		
	
elseif vs_edit_colname = 'include_tax_yn' then
	if isnull(vs_editdata) then vs_editdata = 'N'
	ls_included_tax_yn =  vdw_currency.getitemstring( vdw_currency.getrow(), 'include_tax_yn' ,primary!, true)
	if isnull(ls_included_tax_yn) then ls_included_tax_yn = 'N'
	li_colCnt = lc_string.f_stringtoarray( vs_upd_colname, ';', lsa_colname[])
	ldb_cur_id = vdw_currency.getitemnumber( vdw_currency.getrow(), 'CURRENCY_ID' )
	ldb_ex_rate_cur = vdw_currency.getitemnumber( vdw_currency.getrow(), 'exchange_rate' )
	 //-- chuẩn bị cho làm tròn  --//
	lc_unit.f_get_base_cur(ldb_base_cur,  ls_base_curcode,ls_base_curname)
	if ldb_base_cur > 0 then ldb_round_id_base_amt =  lc_unit.f_get_round_id( ldb_base_cur, 0, 'amount')
	if ldb_cur_id > 0 then ldb_round_id_amt = lc_unit.f_get_round_id( ldb_cur_id, 0, 'amount')	
	if ldb_cur_id > 0 then ldb_round_id_price = lc_unit.f_get_round_id( ldb_cur_id, 0, 'price')		
	
	FOR  li_row = 1 to vdw_line.rowcount()
		if vs_editdata = 'N' and  ls_included_tax_yn = 'Y' then
			lb_upd_dw_cur = true
			
			ldb_price = vdw_line.getitemnumber(li_row, 'price')		
			if  vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid'  then
				ldb_act_price = vdw_line.getitemnumber(li_row, 'act_price')	
				ldb_act_amount =  vdw_line.getitemnumber(li_row, 'act_amount')	
			end if
			ldb_amount = vdw_line.getitemnumber(li_row, 'amount')
			ldb_base_amount = vdw_line.getitemnumber(li_row, 'base_amount')			
			ldb_price_ex_tax = ldb_price
			ldb_act_price_ex_tax = ldb_act_price
			ldb_amount_ex_tax = ldb_amount
			ldb_base_amount_ex_tax = ldb_base_amount
			ldb_act_amount_ex_tax = ldb_act_amount
			ldb_ACT_BASE_AMOUNT_EX_TAX = ldb_act_amount_ex_tax * ldb_ex_rate_cur
			if ldb_round_id_base_amt > 0 then  ldb_ACT_BASE_AMOUNT_EX_TAX = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_ACT_BASE_AMOUNT_EX_TAX)		
		elseif vs_editdata = 'Y' and  ls_included_tax_yn = 'N' then
			lb_upd_dw_cur = true
			
			ldb_price = vdw_line.getitemnumber(li_row, 'price')		
			if  vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid'  then
				ldb_act_price = vdw_line.getitemnumber(li_row, 'act_price')	
				ldb_act_amount =  vdw_line.getitemnumber(li_row, 'act_amount')		
			end if
			ldb_amount = vdw_line.getitemnumber(li_row, 'amount')
			ldb_base_amount = vdw_line.getitemnumber(li_row, 'base_amount')
			
			if vdw_line.dataobject <> 'd_po_line_grid'  then ldb_tax_pct =  vdw_line.getitemnumber(li_row, 'tax_pct')
			if isnull(ldb_tax_pct)   then ldb_tax_pct = 0
			
			if ldb_tax_pct <= 0 then
				ldb_price_ex_tax = ldb_price
				ldb_act_price_ex_tax = ldb_act_price
				ldb_amount_ex_tax = ldb_amount
				ldb_base_amount_ex_tax = ldb_base_amount
				ldb_act_amount_ex_tax = ldb_act_amount
				ldb_ACT_BASE_AMOUNT_EX_TAX = ldb_act_amount_ex_tax * ldb_ex_rate_cur
				if ldb_round_id_base_amt > 0 then  ldb_ACT_BASE_AMOUNT_EX_TAX = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_ACT_BASE_AMOUNT_EX_TAX)		
			else
				ldb_price_ex_tax = ldb_price * (1/ldb_tax_pct)
				if ldb_round_id_price > 0 then  ldb_price_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_price, ldb_price_ex_tax)		
				ldb_act_price_ex_tax = ldb_act_price * (1/ldb_tax_pct)
				if ldb_round_id_price > 0 then  ldb_act_price_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_price, ldb_act_price_ex_tax)		
				ldb_amount_ex_tax = ldb_amount * (1/ldb_tax_pct)
				if ldb_round_id_amt > 0 then  ldb_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount_ex_tax)	
				ldb_base_amount_ex_tax = ldb_base_amount * (1/ldb_tax_pct)
				if ldb_round_id_base_amt > 0 then  ldb_base_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_base_amount_ex_tax)		
				ldb_act_amount_ex_tax = ldb_act_amount * (1/ldb_tax_pct)				
				if ldb_round_id_amt > 0 then  ldb_act_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount_ex_tax)	
				if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
					ldb_comm_pct =  vdw_line.getitemnumber(li_row,'comm_pct') // tinh lai hoa hong --//
					if ldb_comm_pct > 0 then
						ldb_comm_amt = ldb_act_amount_ex_tax * ldb_comm_pct/100 / ( 1 + ldb_comm_pct/100)
						if ldb_round_id_amt > 0 then ldb_comm_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_comm_amt)
					end if		
				end if
				ldb_ACT_BASE_AMOUNT_EX_TAX = ldb_act_amount_ex_tax * ldb_ex_rate_cur
				if ldb_round_id_base_amt > 0 then  ldb_ACT_BASE_AMOUNT_EX_TAX = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_ACT_BASE_AMOUNT_EX_TAX)		
			end if				
		end if
		//-- tính thuế --//	
		if vdw_line.dataobject <> 'd_po_line_grid'  then ldb_tax_pct = vdw_line.getitemnumber(li_row, 'tax_pct')
		ldb_object_ref_id = vdw_line.getitemnumber(li_row, 'id')
		this.f_update_tax_appeon( ldb_cur_id, ldb_ex_rate_cur, vdw_tax, ldb_object_ref_id, ldb_tax_pct, ldb_amount_ex_tax, ldb_base_amount_ex_tax,0)	
		
		//-- Cập nhật lại line --//
		if lb_upd_dw_cur  then
			FOR li_idx = 1 to li_colCnt
				if lsa_colname[li_idx] = 'amount' then
					vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_amount)
				elseif lsa_colname[li_idx] = 'base_amount' then
					vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_base_amount)
				elseif lsa_colname[li_idx] = 'act_amount' then
					vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_act_amount)
				elseif lsa_colname[li_idx] = 'amount_ex_tax' then
					vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_amount_ex_tax)
				elseif lsa_colname[li_idx] = 'base_amount_ex_tax' then
					vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_base_amount_ex_tax)
				elseif lsa_colname[li_idx] = 'act_amount_ex_tax' then
					vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_act_amount_ex_tax)
				elseif lsa_colname[li_idx] = 'act_base_amount_ex_tax' then
					vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_act_base_amount_ex_tax)
				elseif lsa_colname[li_idx] = 'price' then
					vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_price)
				elseif lsa_colname[li_idx] = 'act_price' then
					vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_act_price)
				elseif lsa_colname[li_idx] = 'price_ex_tax' then
					vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_price_ex_tax)
				elseif lsa_colname[li_idx] = 'act_price_ex_tax' then
					vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_act_price_ex_tax)		
				elseif lsa_colname[li_idx] = 'markup_return' then
					vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_markup_return)		
				elseif lsa_colname[li_idx] = 'act_qty' then
					vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_act_qty)		
				elseif lsa_colname[li_idx] = 'comm_pct' then
					vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_comm_pct)				
				elseif lsa_colname[li_idx] = 'comm_amt' then
					vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_comm_amt)												
				end if						
			NEXT		
			
			lb_upd_dw_cur = false
		end if
	NEXT		
elseif  pos(vs_edit_colname, 'object_code') > 0 then
	//-- tương đương với đổi price --//
	ldb_ex_rate_cur = vdw_currency.getitemnumber( vdw_currency.getrow(), 'exchange_rate' ,primary!, false)
	ldb_cur_id = vdw_currency.getitemnumber( vdw_currency.getrow(), 'CURRENCY_ID' )
	ls_included_tax_yn = vdw_currency.getitemstring(vdw_currency.getrow(), 'include_tax_yn')
	if isnull(ls_included_tax_yn) then ls_included_tax_yn ='N'	
	 //-- chuẩn bị cho làm tròn  --//
	lc_unit.f_get_base_cur(ldb_base_cur,  ls_base_curcode,ls_base_curname)
	if ldb_base_cur > 0 then ldb_round_id_base_amt =  lc_unit.f_get_round_id( ldb_base_cur, 0, 'amount')
	if ldb_cur_id > 0 then ldb_round_id_amt = lc_unit.f_get_round_id( ldb_cur_id, 0, 'amount')	
	if ldb_cur_id > 0 then ldb_round_id_price = lc_unit.f_get_round_id( ldb_cur_id, 0, 'price')	
	
	li_colCnt = lc_string.f_stringtoarray( vs_upd_colname, ';', lsa_colname[])
	FOR  li_row = 1 to vdw_line.rowcount()
		ldb_price = vdw_line.getitemnumber(li_row, 'price')
		if  vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid'  then
			ldb_act_price = vdw_line.getitemnumber(li_row, 'act_price')		
		end if			
		if vdw_line.dataobject <> 'd_po_line_grid'  then ldb_tax_pct =  vdw_line.getitemnumber(li_row, 'tax_pct')				
		if isnull(ldb_tax_pct) then ldb_tax_pct = 0
		//-- kiểm tra disc --//	
		ldb_discount_pct =  vdw_line.getitemnumber(vl_line_row, ls_disc_pct)
		if isnull(ldb_discount_pct) then ldb_discount_pct = 0
		ldb_discount_amt = vdw_line.getitemnumber(vl_line_row, ls_disc_amt)
		if isnull(ldb_discount_amt) then ldb_discount_amt = 0
		if  ldb_discount_amt > 0 and ldb_discount_pct = 0  then
			if (ldb_price - ldb_discount_amt) <= 0 then
				gf_messagebox('m.b_obj_instantiate.f_update_line_edit_change.01','Thông báo','Số tiền chiết khấu phải nhỏ hơn hơn đơn giá','stop','ok',1) 
				return -1
			end if					
			ldb_discount_pct = round ( ldb_discount_amt/ (ldb_price - ldb_discount_amt) * 100, 2)
		end if		

		//-- tính act_price , price_ex_tax, act_price_ax_tax --//
		if ls_included_tax_yn ='N' or ldb_tax_pct <= 0 then
			ldb_price_ex_tax = ldb_price
			ldb_act_price_ex_tax = ldb_act_price
		else
			ldb_price_ex_tax = ldb_price * (1/ldb_tax_pct)
			if ldb_round_id_price > 0 then  ldb_price_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_price, ldb_price_ex_tax)
			ldb_act_price_ex_tax = ldb_act_price * (1/ldb_tax_pct)
			if ldb_round_id_price > 0 then  ldb_act_price_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_price, ldb_act_price_ex_tax)
		end if
		//-- tính amount liên quan--//
		ldb_qty = vdw_line.getitemnumber(li_row, 'qty')
		if  vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid'  then
			ldb_act_qty =  vdw_line.getitemnumber(li_row, 'act_qty')	
		end if
		if 	ldb_discount_pct > 0 then  //-- tính giá sâu khi trừ discount_pct --//
			ldb_disc_price = ldb_price*(1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))		
			ldb_amount = ldb_qty * ldb_disc_price  
			if ldb_round_id_amt > 0 then  ldb_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount)
		else
			ldb_amount = ldb_qty * ldb_price 
			if ldb_round_id_amt > 0 then  ldb_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount)
		end if		
		
		ldb_base_amount = ldb_amount * ldb_ex_rate_cur 
		if ldb_round_id_base_amt > 0 then  ldb_base_amount = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_base_amount)
		if 	ldb_discount_pct > 0 then  //-- tính giá sâu khi trừ discount_pct --//
			ldb_disc_price_ex_tax = ldb_price_ex_tax *(1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100)) //-- giá đã triết khấu ko làm tròn --//
			ldb_amount_ex_tax = ldb_qty * ldb_disc_price_ex_tax   
			if ldb_round_id_amt > 0 then  ldb_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount_ex_tax)
		else
			ldb_amount_ex_tax = ldb_qty * ldb_price_ex_tax 
			if ldb_round_id_amt > 0 then  ldb_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount_ex_tax)
		end if				
		
		ldb_base_amount_ex_tax = ldb_amount_ex_tax * ldb_ex_rate_cur
		if 	ldb_discount_pct > 0 then  //-- tính giá sâu khi trừ discount_pct --//
			ldb_disc_act_price = ldb_act_price *(1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))		 //-- giá đã triết khấu ko làm tròn --//
			ldb_act_amount = ldb_act_qty * ldb_disc_act_price  
			if ldb_round_id_amt > 0 then  ldb_act_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount)
		else
			ldb_act_amount = ldb_act_qty * ldb_act_price
			if ldb_round_id_amt > 0 then  ldb_act_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount)
		end if					
		 	
		if 	ldb_discount_pct > 0 then  //-- tính giá sâu khi trừ discount_pct --//
			ldb_disc_act_price_ex_tax = ldb_act_price_ex_tax *(1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))		
			ldb_act_amount_ex_tax =  ldb_act_qty * ldb_disc_act_price_ex_tax 
			if ldb_round_id_amt > 0 then  ldb_act_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount_ex_tax)
			if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
				ldb_comm_pct =  vdw_line.getitemnumber(li_row,'comm_pct') // tinh lai hoa hong --//
				if ldb_comm_pct > 0 then
					ldb_comm_amt = ldb_act_amount_ex_tax * ldb_comm_pct/100 / ( 1 + ldb_comm_pct/100)
					if ldb_round_id_amt > 0 then ldb_comm_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_comm_amt)
				end if				
			end if
		else
			ldb_act_amount_ex_tax =  ldb_act_qty * ldb_act_price_ex_tax
			if ldb_round_id_amt > 0 then  ldb_act_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount_ex_tax)
			if  vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid'  then
				ldb_comm_pct =  vdw_line.getitemnumber(li_row,'comm_pct') // tinh lai hoa hong --//
				if ldb_comm_pct > 0 then
					ldb_comm_amt = ldb_act_amount_ex_tax * ldb_comm_pct/100 / ( 1 + ldb_comm_pct/100)
					if ldb_round_id_amt > 0 then ldb_comm_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_comm_amt)
				end if						
			end if
		end if						
		 	
		ldb_ACT_BASE_AMOUNT_EX_TAX = ldb_act_amount_ex_tax * ldb_ex_rate_cur 			
		if ldb_round_id_base_amt > 0 then  ldb_ACT_BASE_AMOUNT_EX_TAX = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_ACT_BASE_AMOUNT_EX_TAX)
		//-- tính thuế --//	
		ldb_object_ref_id = vdw_line.getitemnumber(li_row, 'id')
		this.f_update_tax_appeon( ldb_cur_id, ldb_ex_rate_cur, vdw_tax, ldb_object_ref_id, ldb_tax_pct, ldb_amount_ex_tax, ldb_base_amount_ex_tax,0)	
		
		//-- Cập nhật lại line --//
		FOR li_idx = 1 to li_colCnt
			if lsa_colname[li_idx] = 'amount' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_amount)
			elseif lsa_colname[li_idx] = 'base_amount' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_base_amount)
			elseif lsa_colname[li_idx] = 'act_amount' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_act_amount)
			elseif lsa_colname[li_idx] = 'amount_ex_tax' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_amount_ex_tax)
			elseif lsa_colname[li_idx] = 'base_amount_ex_tax' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_base_amount_ex_tax)
			elseif lsa_colname[li_idx] = 'act_amount_ex_tax' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_act_amount_ex_tax)
			elseif lsa_colname[li_idx] = 'act_base_amount_ex_tax' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_act_base_amount_ex_tax)
			elseif lsa_colname[li_idx] = 'price' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_price)
			elseif lsa_colname[li_idx] = 'act_price' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_act_price)
			elseif lsa_colname[li_idx] = 'price_ex_tax' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_price_ex_tax)
			elseif lsa_colname[li_idx] = 'act_price_ex_tax' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_act_price_ex_tax)		
			elseif lsa_colname[li_idx] = 'markup_return' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_markup_return)				
			elseif lsa_colname[li_idx] = 'act_qty' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_act_qty)		
			elseif lsa_colname[li_idx] = 'comm_pct' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_comm_pct)				
			elseif lsa_colname[li_idx] = 'comm_amt' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_comm_amt)													
			end if						
		NEXT		
	NEXT		
end if

return 1
end function

public function integer f_update_line_itemchanged (string vs_edit_colname, string vs_editdata, string vs_upd_colname, long vl_line_row, t_dw_mpl vdw_line, t_dw_mpl vdw_currency, t_dw_mpl vdw_tax, double vdb_previous_exrate, double vdb_previous_uom);		/*--------------------------------------------------------------------------///
		Mô tả chức năng:
		---------------------------------
		//$Thay đổi (qty)
					- copy : act_qty (thay đổi act thì không copy ngược lại)
					- tính lại: amount, amount_ex_tax, price_ex_tax, act_price_ex_tax  
							     base_amount, base_amount_ex_tax, 
							     act_amount, act_amount_ex_tax, 
							     ACT_BASE_AMOUNT_EX_TAX ( không có act_base_amount : do ko cần ghi sổ )
		   $ Thay đổi (act_qty)
					- Tính lại: act_amount, act_amount_ex_tax, ACT_BASE_AMOUNT_EX_TAX ( không có act_base_amount : do ko cần ghi sổ )
		   $ Thay đổi ( price)
					- copy :act_price (thay đổi act thì không copy ngược lại)
					- Tính lại : amount, amount_ex_tax, 
								  base_amount, base_amount_ex_tax, 
								  act_amount, act_amount_ex_tax, 
								  ACT_BASE_AMOUNT_EX_TAX ( không có act_base_amount : do ko cần ghi sổ )
								  PRICE_EX_TAX, ACT_PRICE_EX_TAX
			$ Thay đổi (act_price)
					-Tính lại: act_amount, act_amount_ex_tax, ACT_BASE_AMOUNT_EX_TAX ( không có act_base_amount : do ko cần ghi sổ )
					- Tính lại : act_price_ex_tax
			$ Thay đổi (amount)
					- Copy : act_amount (thay đổi act thì không copy ngược lại)
					Tính lại: price, act_price, PRICE_EX_TAX, ACT_PRICE_EX_TAX
								amount_ex_tax,
								base_amount, base_amount_ex_tax, 
								act_amount_ex_tax, ACT_BASE_AMOUNT_EX_TAX ( không có act_base_amount : do ko cần ghi sổ )								
			$ Thay đổi (act_amount)
					Tính lại:  act_price,ACT_PRICE_EX_TAX
								act_amount_ex_tax, ACT_BASE_AMOUNT_EX_TAX ( không có act_base_amount : do ko cần ghi sổ )		
			@ Thay đổi (item_code, spec_code)
					- Cập nhật lại: giá từ item_price : price
					- copy :act_price (thay đổi act thì không copy ngược lại)
					- Tính lại : amount, amount_ex_tax, 
								  base_amount, base_amount_ex_tax, 
								  act_amount, act_amount_ex_tax, 
								  ACT_BASE_AMOUNT_EX_TAX ( không có act_base_amount : do ko cần ghi sổ )
								  PRICE_EX_TAX, ACT_PRICE_EX_TAX	
			@ thay đổi đơn vị của item
					- tính lại : qty, act_qty (quy đổi số lượng)
								 price, act_price, price_ex_tax, act_pric_ex_tax  (quy đổi giá)
								 amount, amount_ex_tax, 
								  base_amount, base_amount_ex_tax, 
								  act_amount, act_amount_ex_tax, 
								  ACT_BASE_AMOUNT_EX_TAX ( không có act_base_amount : do ko cần ghi sổ )								 
			@thay đổi (disc_amt, pct)
				- Tính lại: 
							 amount, amount_ex_tax, 
								  base_amount, base_amount_ex_tax, 
								  act_amount, act_amount_ex_tax, 
								  ACT_BASE_AMOUNT_EX_TAX ( không có act_base_amount : do ko cần ghi sổ )
	
		    @ thay đổi (markup_amt, pct)
			 		- Tính lại: price, PRICE_EX_TAX
					 			amount, amount_ex_tax, 
					 			base_amount, base_amount_ex_tax, 
-----------------------------------------------------------------------------------------
Hàm này đươc gọi sau khi đã cập nhật giá từ bảng giá cho dw-line
================================================	*/	
double		ldb_price,ldb_act_price,  ldb_qty, ldb_act_qty, ldb_ex_rate_old, ldb_ex_rate_cur, ldb_ex_rate_convert, ldb_tax_pct
double 		ldb_amount, ldb_base_amount, ldb_act_amount, ldb_amount_ex_tax, ldb_base_amount_ex_tax, ldb_act_amount_ex_tax
double		ldb_ACT_BASE_AMOUNT_EX_TAX, ldb_act_price_ex_tax, ldb_price_ex_tax, ldb_item_id, ldb_unit_id, ldb_round_id, ldb_cur_id
double		ldb_disc_price,ldb_disc_act_price, ldb_discount_pct, ldb_disc_price_ex_tax, ldb_disc_act_price_ex_tax, ldb_discount_amt
double		ldb_markup_amt, ldb_MARKUP_RETURN, ldb_object_ref_id, ldb_round_id_price, ldb_round_id_amt, ldb_act_base_amount
double		ldb_round_id_base_amt, ldb_base_cur, ldb_stock_unit_id, ldba_data_conver[], ldb_tax_correction, ldb_comm_pct, ldb_comm_amt
int				li_colCnt, li_idx, li_row
string			lsa_colname[], ls_included_tax_yn, ls_filter_org, ls_filter, ls_base_curcode,ls_base_curname, ls_disc_amt, ls_disc_pct, ls_object_colname

c_string				lc_string
c_unit_instance		lc_unit

//-- kiểm tra tên cột discount ở line --//
if vdw_line.dataobject = 'd_qt_line_grid' then
	ls_disc_amt = 'discount'
	ls_disc_pct=  'discount_pct'
	ls_object_colname = 'item_id'
elseif vdw_line.dataobject = 'd_so_line_grid' OR vdw_line.dataobject = 'd_po_line_grid' then
	ls_disc_amt = 'disc_amt'
	ls_disc_pct=  'disc_pct'
	ls_object_colname = 'item_id'	
elseif vdw_line.dataobject = 'd_sal_invoice_line_grid' OR vdw_line.dataobject = 'd_pur_invoice_line_grid'  then
	ls_disc_amt = 'disc_amt'
	ls_disc_pct=  'disc_pct'
	ls_object_colname = 'object_id'
end if
 
//-- tính toán lại giá trị các cột liên quan--//
if vs_edit_colname = 'qty'  then //-- user edit qty --/
	ldb_qty = double(vs_editdata)	
	
	ldb_item_id = vdw_line.getitemnumber(vl_line_row, ls_object_colname)
	ldb_unit_id =  vdw_line.getitemnumber(vl_line_row, 'TRANS_UOM')
	ldb_cur_id = vdw_currency.getitemnumber( vdw_currency.getrow(), 'CURRENCY_ID' )
	ldb_price = vdw_line.getitemnumber(vl_line_row, 'price')	
	if vdw_line.dataobject <> 'd_po_line_grid' then
		ldb_tax_pct = vdw_line.getitemnumber(vl_line_row, 'tax_pct')	
	end if
	ldb_ex_rate_cur = vdw_currency.getitemnumber(vdw_currency.getrow(), 'exchange_rate')
	ls_included_tax_yn = vdw_currency.getitemstring(vdw_currency.getrow(), 'include_tax_yn')
	if isnull(ls_included_tax_yn) then ls_included_tax_yn ='N'
	
	if ldb_unit_id > 0 then //-- làm tròn qty --//
		ldb_round_id = lc_unit.f_get_round_id( ldb_unit_id, ldb_item_id, 'item')
		if ldb_round_id > 0 then ldb_qty = lc_unit.f_round( vdw_line, ldb_round_id, ldb_qty)
	end if
	if ldb_cur_id > 0 then ldb_round_id_price = lc_unit.f_get_round_id( ldb_cur_id, 0, 'price')
	if ldb_cur_id > 0 then ldb_round_id_amt = lc_unit.f_get_round_id( ldb_cur_id, 0, 'amount')
	lc_unit.f_get_base_cur(ldb_base_cur,  ls_base_curcode,ls_base_curname)
	ldb_round_id_base_amt =  lc_unit.f_get_round_id( ldb_base_cur, 0, 'amount')
	
	//-- kiểm tra disc --//	
	ldb_discount_pct =  vdw_line.getitemnumber(vl_line_row, ls_disc_pct)
	if isnull(ldb_discount_pct) then ldb_discount_pct = 0
	ldb_discount_amt = vdw_line.getitemnumber(vl_line_row,ls_disc_amt)
	if isnull(ldb_discount_amt) then ldb_discount_amt = 0
	if  ldb_discount_amt > 0 and ldb_discount_pct = 0  then
		if (ldb_price - ldb_discount_amt) <= 0 then
			gf_messagebox('m.b_obj_instantiate.f_update_line_edit_change.01','Thông báo','Số tiền chiết khấu phải nhỏ hơn hơn đơn giá','stop','ok',1) 
			return -1
		end if
		ldb_discount_pct  = round(ldb_discount_amt/ (ldb_price - ldb_discount_amt) * 100, 2)
	end if
		
	if 	ldb_discount_pct > 0 then  //-- tính giá sau khi trừ discount_pct --//	
		ldb_disc_price = ldb_price *(1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))				
		ldb_amount = ldb_disc_price * ldb_qty	
		if ldb_round_id_amt > 0 then ldb_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount)
	else
		ldb_amount = ldb_price * ldb_qty	
		if ldb_round_id_amt > 0 then ldb_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount)
	end if
	
	ldb_base_amount =  ldb_amount * ldb_ex_rate_cur	
	if ldb_round_id_base_amt > 0 then ldb_base_amount = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_base_amount)
	if ls_included_tax_yn = 'N' or ldb_tax_pct <= 0 then
		ldb_price_ex_tax = ldb_price
		ldb_amount_ex_tax = ldb_amount
		ldb_base_amount_ex_tax = ldb_base_amount
	else
		ldb_price_ex_tax = ldb_price / (1+ ldb_tax_pct/100)
		if ldb_round_id_price > 0 then ldb_price_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_price, ldb_price_ex_tax)
		if 	ldb_discount_pct > 0 then  //-- tính giá sâu khi trừ discount_pct --//
			ldb_disc_price_ex_tax = ldb_price_ex_tax * (1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))		
			ldb_amount_ex_tax = ldb_disc_price_ex_tax * ldb_qty	
			if ldb_round_id_amt > 0 then ldb_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount_ex_tax)
		else
			ldb_amount_ex_tax = ldb_price_ex_tax * ldb_qty
			if ldb_round_id_amt > 0 then ldb_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount_ex_tax)
		end if				
		ldb_base_amount_ex_tax = ldb_amount_ex_tax * ldb_ex_rate_cur
		if ldb_round_id_base_amt > 0 then ldb_base_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_base_amount_ex_tax)
	end if
	
	//-- sửa qty thì copy lại act_qty--//
	ldb_act_qty = ldb_qty
	if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
		ldb_act_price = vdw_line.getitemnumber(vl_line_row, 'act_price')
	end if
	if 	ldb_discount_pct > 0 then  //-- tính giá sâu khi trừ discount_pct --//
		ldb_disc_act_price =  ldb_act_price *( 1 - ldb_discount_pct/100 ) / (1 + (ldb_discount_pct/100))			
		ldb_act_amount = ldb_disc_act_price*ldb_act_qty
		if ldb_round_id_amt > 0 then ldb_act_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount)
	else
		ldb_act_amount = ldb_act_qty*ldb_act_price
		if ldb_round_id_amt > 0 then ldb_act_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount)
	end if	
	ldb_act_base_amount = ldb_act_amount * ldb_ex_rate_cur	
	if ldb_round_id_base_amt > 0 then ldb_act_base_amount = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_act_base_amount)
	
	if ls_included_tax_yn = 'N' or ldb_tax_pct <= 0  then
		ldb_price_ex_tax = ldb_act_price
		ldb_act_amount_ex_tax = ldb_act_amount	
		if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
			ldb_comm_pct =  vdw_line.getitemnumber(vl_line_row,'comm_pct')
			if ldb_comm_pct > 0 then
				ldb_comm_amt = ldb_act_amount_ex_tax * ldb_comm_pct/100 / ( 1 + ldb_comm_pct/100)
				if ldb_round_id_amt > 0 then ldb_comm_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_comm_amt)
			end if
		end if
		ldb_ACT_BASE_AMOUNT_EX_TAX = ldb_act_amount * ldb_ex_rate_cur
		if ldb_round_id_base_amt > 0 then ldb_ACT_BASE_AMOUNT_EX_TAX = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_ACT_BASE_AMOUNT_EX_TAX)
	else
		ldb_act_price_ex_tax = ldb_act_price / (1 + ldb_tax_pct/100)
		if ldb_round_id_price > 0 then ldb_act_price_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_price, ldb_act_price_ex_tax)
		if 	ldb_discount_pct > 0 then  //-- tính giá sâu khi trừ discount_pct --//
			ldb_disc_act_price_ex_tax =  ldb_act_price_ex_tax *( 1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))			
			ldb_act_amount_ex_tax = ldb_disc_act_price_ex_tax * ldb_act_qty
			if ldb_round_id_amt > 0 then ldb_act_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount_ex_tax)
			if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
				ldb_comm_pct =  vdw_line.getitemnumber(vl_line_row,'comm_pct') //-- tinh lai hoa hong neu co--//
				if ldb_comm_pct > 0 then
					ldb_comm_amt = ldb_act_amount_ex_tax * ldb_comm_pct/100 / ( 1 + ldb_comm_pct/100)
					if ldb_round_id_amt > 0 then ldb_comm_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_comm_amt)
				end if			
			end if
		else
			ldb_act_amount_ex_tax = ldb_act_price_ex_tax * ldb_act_qty
			if ldb_round_id_amt > 0 then ldb_act_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount_ex_tax)
			if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
				ldb_comm_pct =  vdw_line.getitemnumber(vl_line_row,'comm_pct') //-- tinh lai hoa hong neu co--//
				if ldb_comm_pct > 0 then
					ldb_comm_amt = ldb_act_amount_ex_tax * ldb_comm_pct/100 / ( 1 + ldb_comm_pct/100)
					if ldb_round_id_amt > 0 then ldb_comm_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_comm_amt)
				end if			
			end if
		end if			
		ldb_ACT_BASE_AMOUNT_EX_TAX =  ldb_act_amount_ex_tax * ldb_ex_rate_cur	
		if ldb_round_id_base_amt > 0 then ldb_ACT_BASE_AMOUNT_EX_TAX = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_ACT_BASE_AMOUNT_EX_TAX)
	end if		
	//-- tính thuế --//	
	ldb_object_ref_id = vdw_line.getitemnumber(vl_line_row, 'id')
	this.f_update_tax_appeon( ldb_cur_id, ldb_ex_rate_cur, vdw_tax, ldb_object_ref_id, ldb_tax_pct, ldb_amount_ex_tax, ldb_base_amount_ex_tax,0)	
elseif  vs_edit_colname = 'act_qty'  then //-- user edit act_qty --//
	ldb_act_qty = double(vs_editdata)	
	
	ldb_item_id = vdw_line.getitemnumber(vl_line_row, ls_object_colname)
	ldb_unit_id =  vdw_line.getitemnumber(vl_line_row, 'TRANS_UOM')
	ldb_price  = vdw_line.getitemnumber(vl_line_row, 'price')		
	if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
		ldb_act_price = vdw_line.getitemnumber(vl_line_row, 'act_price')	
	end if
	ldb_ex_rate_cur = vdw_currency.getitemnumber(vdw_currency.getrow(), 'exchange_rate')
	ldb_cur_id = vdw_currency.getitemnumber( vdw_currency.getrow(), 'CURRENCY_ID' )
	ls_included_tax_yn = vdw_currency.getitemstring(vdw_currency.getrow(), 'include_tax_yn')
	if isnull(ls_included_tax_yn) then ls_included_tax_yn ='N'
	//-- kiểm tra disc --//	
	ldb_discount_pct =  vdw_line.getitemnumber(vl_line_row, ls_disc_pct)
	if isnull(ldb_discount_pct) then ldb_discount_pct = 0
	ldb_discount_amt = vdw_line.getitemnumber(vl_line_row,ls_disc_amt)
	if isnull(ldb_discount_amt) then ldb_discount_amt = 0
	if  ldb_discount_amt > 0 and ldb_discount_pct = 0  then
		if (ldb_price - ldb_discount_amt) <= 0 then
			gf_messagebox('m.b_obj_instantiate.f_update_line_edit_change.01','Thông báo','Số tiền chiết khấu phải nhỏ hơn hơn đơn giá','stop','ok',1) 
			return -1
		end if		
		ldb_discount_pct  = round(ldb_discount_amt/ (ldb_price - ldb_discount_amt) * 100, 2)
	end if
			
	if ldb_unit_id > 0 then //-- làm tròn act_qty --//
		ldb_round_id = lc_unit.f_get_round_id( ldb_unit_id, ldb_item_id, 'item')
		if ldb_round_id > 0 then ldb_act_qty = lc_unit.f_round( vdw_line, ldb_round_id, ldb_act_qty)
	end if
	if ldb_cur_id > 0 then ldb_round_id_price = lc_unit.f_get_round_id( ldb_cur_id, 0, 'price')
	if ldb_cur_id > 0 then ldb_round_id_amt = lc_unit.f_get_round_id( ldb_cur_id, 0, 'amount')
	lc_unit.f_get_base_cur(ldb_base_cur,  ls_base_curcode,ls_base_curname)
	ldb_round_id_base_amt =  lc_unit.f_get_round_id( ldb_base_cur, 0, 'amount')

	if 	ldb_discount_pct > 0 then  //-- tính giá sâu khi trừ discount_pct --//
		ldb_disc_act_price = ldb_act_price* ( 1 -  ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))		
		ldb_act_amount = ldb_disc_price * ldb_act_qty	
		if ldb_round_id_amt > 0 then ldb_act_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount)
	else
		ldb_act_amount = ldb_act_qty*ldb_act_price
		if ldb_round_id_amt > 0 then ldb_act_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount)
	end if			
	ldb_act_base_amount = ldb_act_amount * ldb_ex_rate_cur	
	if ldb_round_id_base_amt > 0 then ldb_act_base_amount = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_act_base_amount)
	
	if ls_included_tax_yn = 'N' then
		ldb_act_amount_ex_tax = ldb_act_amount
		if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
			ldb_comm_pct =  vdw_line.getitemnumber(vl_line_row,'comm_pct') //-- tinh lai hoa hong neu co--//
			if ldb_comm_pct > 0 then
				ldb_comm_amt = ldb_act_amount_ex_tax * ldb_comm_pct/100 / ( 1 + ldb_comm_pct/100)
				if ldb_round_id_amt > 0 then ldb_comm_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_comm_amt)
			end if			
		end if
		ldb_ACT_BASE_AMOUNT_EX_TAX = ldb_act_amount * ldb_ex_rate_cur
		if ldb_round_id_base_amt > 0 then ldb_ACT_BASE_AMOUNT_EX_TAX = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_ACT_BASE_AMOUNT_EX_TAX)
	else
		if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
			ldb_act_price_ex_tax = vdw_line.getitemnumber(vl_line_row, 'act_price_ex_tax')
		end if
		if 	ldb_discount_pct > 0 then  //-- tính giá sâu khi trừ discount_pct --//
			ldb_disc_act_price_ex_tax = ldb_act_price_ex_tax *( 1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))		
			ldb_act_amount_ex_tax = ldb_disc_act_price_ex_tax * ldb_act_qty	
			if ldb_round_id_amt > 0 then ldb_act_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount_ex_tax)
			if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
				ldb_comm_pct =  vdw_line.getitemnumber(vl_line_row,'comm_pct') //-- tinh lai hoa hong neu co--//
				if ldb_comm_pct > 0 then
					ldb_comm_amt = ldb_act_amount_ex_tax * ldb_comm_pct/100 / ( 1 + ldb_comm_pct/100)
					if ldb_round_id_amt > 0 then ldb_comm_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_comm_amt)
				end if				
			end if
		else
			ldb_act_amount_ex_tax = ldb_act_price_ex_tax * ldb_act_qty
			if ldb_round_id_amt > 0 then ldb_act_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount_ex_tax)
			if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
				ldb_comm_pct =  vdw_line.getitemnumber(vl_line_row,'comm_pct') //-- tinh lai hoa hong neu co--//
				if ldb_comm_pct > 0 then
					ldb_comm_amt = ldb_act_amount_ex_tax * ldb_comm_pct/100 / ( 1 + ldb_comm_pct/100)
					if ldb_round_id_amt > 0 then ldb_comm_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_comm_amt)
				end if			
			end if
		end if							
		
		ldb_ACT_BASE_AMOUNT_EX_TAX =  ldb_act_amount_ex_tax * ldb_ex_rate_cur	
		if ldb_round_id_base_amt > 0 then ldb_ACT_BASE_AMOUNT_EX_TAX = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_ACT_BASE_AMOUNT_EX_TAX)
	end if	
elseif vs_edit_colname = 'price' then
	ldb_price = double(vs_editdata)
	
	ldb_cur_id = vdw_currency.getitemnumber( vdw_currency.getrow(), 'CURRENCY_ID' )
	ls_included_tax_yn = vdw_currency.getitemstring(vdw_currency.getrow(), 'include_tax_yn')
	if isnull(ls_included_tax_yn) then ls_included_tax_yn ='N'	
	if vdw_line.dataobject <> 'd_po_line_grid' then
		ldb_tax_pct =  vdw_line.getitemnumber(vl_line_row, 'tax_pct')
	end if
	if isnull(ldb_tax_pct) then ldb_tax_pct = 0
	//-- kiểm tra disc --//	
	ldb_discount_pct =  vdw_line.getitemnumber(vl_line_row, ls_disc_pct)
	if isnull(ldb_discount_pct) then ldb_discount_pct = 0
	ldb_discount_amt = vdw_line.getitemnumber(vl_line_row, ls_disc_amt)
	if isnull(ldb_discount_amt) then ldb_discount_amt = 0
	if  ldb_discount_amt > 0 and ldb_discount_pct = 0  then
		if (ldb_price - ldb_discount_amt) <= 0 then
			gf_messagebox('m.b_obj_instantiate.f_update_line_edit_change.01','Thông báo','Số tiền chiết khấu phải nhỏ hơn hơn đơn giá','stop','ok',1) 
			return -1
		end if				
		ldb_discount_pct  =  round(ldb_discount_amt/ (ldb_price - ldb_discount_amt) * 100, 2)
	end if

	 //-- chuẩn bị cho làm tròn  --//
	lc_unit.f_get_base_cur(ldb_base_cur,  ls_base_curcode,ls_base_curname)
	if ldb_base_cur > 0 then ldb_round_id_base_amt =  lc_unit.f_get_round_id( ldb_base_cur, 0, 'amount')
	if ldb_cur_id > 0 then ldb_round_id_price = lc_unit.f_get_round_id( ldb_cur_id, 0, 'price')
	if ldb_cur_id > 0 then ldb_round_id_amt = lc_unit.f_get_round_id( ldb_cur_id, 0, 'amount')
	
	IF ldb_round_id_price> 0 THEN ldb_price = lc_unit.f_round( vdw_line, ldb_round_id_price, ldb_price)
	
	//-- tính act_price , price_ex_tax, act_price_ax_tax --//
	ldb_act_price = ldb_price 
	if ls_included_tax_yn ='N' or ldb_tax_pct <= 0 then
		ldb_price_ex_tax = ldb_price
		ldb_act_price_ex_tax = ldb_act_price
	else
		ldb_price_ex_tax = ldb_price / (1 + ldb_tax_pct/100)
		if ldb_round_id_price > 0 then ldb_price_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_price, ldb_price_ex_tax)
		ldb_act_price_ex_tax = ldb_act_price / (1 + ldb_tax_pct/100)
		if ldb_round_id_price > 0 then ldb_act_price_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_price, ldb_act_price_ex_tax)
	end if
	//-- tính amount liên quan--//
	ldb_qty = vdw_line.getitemnumber(vl_line_row, 'qty')
	if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
		ldb_act_qty =  vdw_line.getitemnumber(vl_line_row, 'act_qty')	
	end if
	ldb_ex_rate_cur = vdw_currency.getitemnumber(vdw_currency.getrow(), 'exchange_rate')	
	if 	ldb_discount_pct > 0 then  //-- tính giá sâu khi trừ discount_pct --//
		ldb_disc_price  = ldb_price *( 1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))		
		ldb_amount = ldb_qty * ldb_disc_price 
		if ldb_round_id_amt > 0 then ldb_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount)
	else
		ldb_amount = ldb_qty * ldb_price 
		if ldb_round_id_amt > 0 then ldb_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount)
	end if								
	
	ldb_base_amount = ldb_amount * ldb_ex_rate_cur 
	if ldb_round_id_base_amt > 0 then ldb_base_amount = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_base_amount)
	if 	ldb_discount_pct > 0 then  //-- tính giá sâu khi trừ discount_pct --//
		ldb_disc_price_ex_tax  = ldb_price_ex_tax * ( 1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))		
		ldb_amount_ex_tax = ldb_qty * ldb_disc_price_ex_tax
		if ldb_round_id_amt > 0 then ldb_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount_ex_tax)
	else
		ldb_amount_ex_tax = ldb_qty * ldb_price_ex_tax
		if ldb_round_id_amt > 0 then ldb_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount_ex_tax)
	end if										 
	ldb_base_amount_ex_tax = ldb_amount_ex_tax * ldb_ex_rate_cur
	if ldb_round_id_base_amt > 0 then ldb_base_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_base_amount_ex_tax)
	if 	ldb_discount_pct > 0 then  //-- tính giá sâu khi trừ discount_pct --//
		ldb_disc_act_price = ldb_act_price *(1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))		
		ldb_act_amount = ldb_act_qty * ldb_disc_act_price 	
		if ldb_round_id_amt > 0 then ldb_act_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount)
	else
		ldb_act_amount = ldb_act_qty * ldb_act_price 	
		if ldb_round_id_amt > 0 then ldb_act_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount)
	end if		
	ldb_act_base_amount = ldb_act_amount * ldb_ex_rate_cur	
	if ldb_round_id_base_amt > 0 then ldb_act_base_amount = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_act_base_amount)
	
	if 	ldb_discount_pct > 0 then  //-- tính giá sâu khi trừ discount_pct --//
		ldb_disc_act_price_ex_tax = ldb_act_price_ex_tax * (1 -  ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))		
		ldb_act_amount_ex_tax =  ldb_act_qty * ldb_disc_act_price_ex_tax 	
		if ldb_round_id_amt > 0 then ldb_act_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount_ex_tax)
		if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
			ldb_comm_pct =  vdw_line.getitemnumber(vl_line_row,'comm_pct') //-- tinh lai hoa hong neu co--//
			if ldb_comm_pct > 0 then
				ldb_comm_amt = ldb_act_amount_ex_tax * ldb_comm_pct/100 / ( 1 + ldb_comm_pct/100)
				if ldb_round_id_amt > 0 then ldb_comm_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_comm_amt)
			end if				
		end if
	else
		ldb_act_amount_ex_tax =  ldb_act_qty * ldb_act_price_ex_tax 	
		if ldb_round_id_amt > 0 then ldb_act_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount_ex_tax)
		if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
			ldb_comm_pct =  vdw_line.getitemnumber(vl_line_row,'comm_pct') //-- tinh lai hoa hong neu co--//
			if ldb_comm_pct > 0 then
				ldb_comm_amt = ldb_act_amount_ex_tax * ldb_comm_pct/100 / ( 1 + ldb_comm_pct/100)
				if ldb_round_id_amt > 0 then ldb_comm_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_comm_amt)
			end if				
		end if 
	end if				
	ldb_ACT_BASE_AMOUNT_EX_TAX = ldb_act_amount_ex_tax * ldb_ex_rate_cur 
	if ldb_round_id_base_amt > 0 then ldb_ACT_BASE_AMOUNT_EX_TAX = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_ACT_BASE_AMOUNT_EX_TAX)
	//-- tính thuế --//	
	ldb_object_ref_id = vdw_line.getitemnumber(vl_line_row, 'id')
	this.f_update_tax_appeon( ldb_cur_id, ldb_ex_rate_cur, vdw_tax, ldb_object_ref_id, ldb_tax_pct, ldb_amount_ex_tax, ldb_base_amount_ex_tax,0)	
		
elseif vs_edit_colname = 'act_price' then
	ldb_act_price = double(vs_editdata)
	
	ldb_cur_id = vdw_currency.getitemnumber( vdw_currency.getrow(), 'CURRENCY_ID' )
	ls_included_tax_yn = vdw_currency.getitemstring(vdw_currency.getrow(), 'include_tax_yn')
	if isnull(ls_included_tax_yn) then ls_included_tax_yn ='N'	
	if vdw_line.dataobject <> 'd_po_line_grid' then
		ldb_tax_pct =  vdw_line.getitemnumber(vl_line_row, 'tax_pct')
	end if
	if isnull(ldb_tax_pct) then ldb_tax_pct = 0
	//-- kiểm tra disc --//	
	ldb_discount_pct =  vdw_line.getitemnumber(vl_line_row, ls_disc_pct)
	if isnull(ldb_discount_pct) then ldb_discount_pct = 0
	ldb_discount_amt = vdw_line.getitemnumber(vl_line_row, ls_disc_amt)
	if isnull(ldb_discount_amt) then ldb_discount_amt = 0
	if  ldb_discount_amt > 0 and ldb_discount_pct = 0  then
		if (ldb_price - ldb_discount_amt) <= 0 then
			gf_messagebox('m.b_obj_instantiate.f_update_line_edit_change.01','Thông báo','Số tiền chiết khấu phải nhỏ hơn hơn đơn giá','stop','ok',1) 
			return -1
		end if				
		ldb_discount_pct  =  round(ldb_discount_amt/ (ldb_price - ldb_discount_amt) * 100, 2)
	end if

	 //-- chuẩn bị cho làm tròn  --//
	lc_unit.f_get_base_cur(ldb_base_cur,  ls_base_curcode,ls_base_curname)
	if ldb_base_cur > 0 then ldb_round_id_base_amt =  lc_unit.f_get_round_id( ldb_base_cur, 0, 'amount')
	if ldb_cur_id > 0 then ldb_round_id_price = lc_unit.f_get_round_id( ldb_cur_id, 0, 'price')
	if ldb_cur_id > 0 then ldb_round_id_amt = lc_unit.f_get_round_id( ldb_cur_id, 0, 'amount')
	
	IF ldb_round_id_price> 0 THEN ldb_act_price = lc_unit.f_round( vdw_line, ldb_round_id_price, ldb_act_price)
	
	//-- tính act_price , price_ex_tax, act_price_ax_tax --//
	if ls_included_tax_yn ='N' or ldb_tax_pct <= 0 then
		ldb_act_price_ex_tax = ldb_act_price
	else
		ldb_act_price_ex_tax = ldb_act_price * (1/ldb_tax_pct)
		IF ldb_round_id_price> 0 THEN ldb_act_price_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_price, ldb_act_price_ex_tax)
	end if
	//-- tính amount liên quan--//
	if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
		ldb_act_qty =  vdw_line.getitemnumber(vl_line_row, 'act_qty')	
	end if
	ldb_ex_rate_cur = vdw_currency.getitemnumber(vdw_currency.getrow(), 'exchange_rate')	
	if 	ldb_discount_pct > 0 then  //-- tính giá sâu khi trừ discount_pct --//
		ldb_disc_act_price = ldb_act_price *(1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))		
		ldb_act_amount = ldb_act_qty * ldb_disc_act_price 	
		IF ldb_round_id_amt > 0 THEN ldb_act_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount)
	else
		ldb_act_amount = ldb_act_qty * ldb_act_price 		
		IF ldb_round_id_amt > 0 THEN ldb_act_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount)
	end if				
	ldb_act_base_amount = ldb_act_amount * ldb_ex_rate_cur	
	if ldb_round_id_base_amt > 0 then ldb_act_base_amount = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_act_base_amount)	
	
	if 	ldb_discount_pct > 0 then  //-- tính giá sâu khi trừ discount_pct --//
		ldb_disc_act_price_ex_tax = ldb_act_price_ex_tax * (1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))		
		ldb_act_amount_ex_tax =  ldb_act_qty * ldb_disc_act_price_ex_tax 
		IF ldb_round_id_amt > 0 THEN ldb_act_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount_ex_tax)
		if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
			ldb_comm_pct =  vdw_line.getitemnumber(vl_line_row,'comm_pct') //-- tinh lai hoa hong neu co--//
			if ldb_comm_pct > 0 then
				ldb_comm_amt = ldb_act_amount_ex_tax * ldb_comm_pct/100 / ( 1 + ldb_comm_pct/100)
				if ldb_round_id_amt > 0 then ldb_comm_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_comm_amt)
			end if			
		end if
	else
		ldb_act_amount_ex_tax =  ldb_act_qty * ldb_act_price_ex_tax 	
		IF ldb_round_id_amt > 0 THEN ldb_act_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount_ex_tax)
		if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
			ldb_comm_pct =  vdw_line.getitemnumber(vl_line_row,'comm_pct') //-- tinh lai hoa hong neu co--//
			if ldb_comm_pct > 0 then
				ldb_comm_amt = ldb_act_amount_ex_tax * ldb_comm_pct/100 / ( 1 + ldb_comm_pct/100)
				if ldb_round_id_amt > 0 then ldb_comm_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_comm_amt)
			end if				
		end if
	end if				
		
	ldb_ACT_BASE_AMOUNT_EX_TAX = ldb_act_amount_ex_tax * ldb_ex_rate_cur 		
	IF ldb_round_id_base_amt > 0 THEN ldb_ACT_BASE_AMOUNT_EX_TAX = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_ACT_BASE_AMOUNT_EX_TAX)
	
elseif vs_edit_colname = 'amount' then
	ldb_amount = double(vs_editdata)
	ldb_discount_pct = 0 		//-- khi sửa amount thì xoá disc nếu có--//
	ldb_discount_amt = 0		//-- khi sửa amount thì xoá disc nếu có--//
	ldb_cur_id = vdw_currency.getitemnumber( vdw_currency.getrow(), 'CURRENCY_ID' )
	ldb_ex_rate_cur = vdw_currency.getitemnumber(vdw_currency.getrow(), 'exchange_rate')	
	ls_included_tax_yn = vdw_currency.getitemstring(vdw_currency.getrow(), 'include_tax_yn')
	if isnull(ls_included_tax_yn) then ls_included_tax_yn ='N'	
	if vdw_line.dataobject <> 'd_po_line_grid' then  ldb_tax_pct =  vdw_line.getitemnumber(vl_line_row, 'tax_pct')
	if isnull(ldb_tax_pct) then ldb_tax_pct = 0

	 //-- chuẩn bị cho làm tròn  --//
	lc_unit.f_get_base_cur(ldb_base_cur,  ls_base_curcode,ls_base_curname)
	if ldb_base_cur > 0 then ldb_round_id_base_amt =  lc_unit.f_get_round_id( ldb_base_cur, 0, 'amount')
	if ldb_cur_id > 0 then ldb_round_id_price = lc_unit.f_get_round_id( ldb_cur_id, 0, 'price')
	if ldb_cur_id > 0 then ldb_round_id_amt = lc_unit.f_get_round_id( ldb_cur_id, 0, 'amount')
	
	IF ldb_round_id_amt> 0 THEN ldb_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount)
		
	//-- copy act_amt--//
	ldb_act_amount = ldb_amount 
	ldb_base_amount = ldb_amount * ldb_ex_rate_cur 
	IF ldb_round_id_base_amt> 0 THEN ldb_base_amount = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_base_amount)
	ldb_act_base_amount = ldb_act_amount * ldb_ex_rate_cur	
	if ldb_round_id_base_amt > 0 then ldb_act_base_amount = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_act_base_amount)
	
	//-- tính price, amount liên quan --//
	ldb_qty = vdw_line.getitemnumber(vl_line_row, 'qty')
	if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
		ldb_act_qty =  vdw_line.getitemnumber(vl_line_row, 'act_qty')		
	end if
	
	if ldb_qty > 0 then	ldb_price = ldb_amount / ldb_qty  //-- giá tính ngược sẽ không làm tròn --//
	if ldb_act_qty > 0 then	ldb_act_price = ldb_act_amount / ldb_act_qty //-- giá tính ngược sẽ không làm tròn --//
	
	if ls_included_tax_yn ='N' or ldb_tax_pct <= 0 then
		ldb_price_ex_tax = ldb_price 
		ldb_act_price_ex_tax =  ldb_act_price 		
		ldb_amount_ex_tax = ldb_amount 
		ldb_base_amount_ex_tax = ldb_base_amount 
		ldb_act_amount_ex_tax = ldb_act_amount 
		if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
			ldb_comm_pct =  vdw_line.getitemnumber(vl_line_row,'comm_pct') //-- tinh lai hoa hong neu co--//
			if ldb_comm_pct > 0 then
				ldb_comm_amt = ldb_act_amount_ex_tax * ldb_comm_pct/100 / ( 1 + ldb_comm_pct/100)
				if ldb_round_id_amt > 0 then ldb_comm_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_comm_amt)
			end if			
		end if
		ldb_ACT_BASE_AMOUNT_EX_TAX = ldb_act_amount_ex_tax * ldb_ex_rate_cur
		IF ldb_round_id_base_amt> 0 THEN ldb_ACT_BASE_AMOUNT_EX_TAX = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_ACT_BASE_AMOUNT_EX_TAX)
	else
		ldb_amount_ex_tax = ldb_amount  * ( 1/ldb_tax_pct)
		IF ldb_round_id_amt> 0 THEN ldb_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount_ex_tax)
		ldb_base_amount_ex_tax = ldb_base_amount  * ( 1/ldb_tax_pct)
		IF ldb_round_id_base_amt> 0 THEN ldb_base_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_base_amount_ex_tax)
		ldb_act_amount_ex_tax = ldb_act_amount * ( 1/ldb_tax_pct)
		IF ldb_round_id_amt> 0 THEN ldb_act_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount_ex_tax)
		if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
			ldb_comm_pct =  vdw_line.getitemnumber(vl_line_row,'comm_pct') //-- tinh lai hoa hong neu co--//
			if ldb_comm_pct > 0 then
				ldb_comm_amt = ldb_act_amount_ex_tax * ldb_comm_pct/100 / ( 1 + ldb_comm_pct/100)
				if ldb_round_id_amt > 0 then ldb_comm_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_comm_amt)
			end if			
		end if
		ldb_ACT_BASE_AMOUNT_EX_TAX = ldb_act_amount_ex_tax * ldb_ex_rate_cur
		if ldb_qty > 0 then	ldb_price_ex_tax = ldb_amount_ex_tax / ldb_qty  //-- giá tính ngược sẽ không làm tròn --//
		if ldb_act_qty > 0 then	ldb_act_price_ex_tax = ldb_act_amount_ex_tax / ldb_act_qty		 //-- giá tính ngược sẽ không làm tròn --//			
	end if
	//-- tính thuế --//	
	ldb_object_ref_id = vdw_line.getitemnumber(vl_line_row, 'id')
	this.f_update_tax_appeon( ldb_cur_id, ldb_ex_rate_cur, vdw_tax, ldb_object_ref_id, ldb_tax_pct, ldb_amount_ex_tax, ldb_base_amount_ex_tax,0)	
	
elseif vs_edit_colname = 'act_amount' then
	ldb_act_amount = double(vs_editdata)
	
	ldb_cur_id = vdw_currency.getitemnumber( vdw_currency.getrow(), 'CURRENCY_ID' )
	ls_included_tax_yn = vdw_currency.getitemstring(vdw_currency.getrow(), 'include_tax_yn')
	if isnull(ls_included_tax_yn) then ls_included_tax_yn ='N'	
	if vdw_line.dataobject <> 'd_po_line_grid' then	ldb_tax_pct =  vdw_line.getitemnumber(vl_line_row, 'tax_pct')
	if isnull(ldb_tax_pct) then ldb_tax_pct = 0

	 //-- chuẩn bị cho làm tròn  --//
	lc_unit.f_get_base_cur(ldb_base_cur,  ls_base_curcode,ls_base_curname)
	if ldb_base_cur > 0 then ldb_round_id_base_amt =  lc_unit.f_get_round_id( ldb_base_cur, 0, 'amount')
	if ldb_cur_id > 0 then ldb_round_id_price = lc_unit.f_get_round_id( ldb_cur_id, 0, 'price')
	if ldb_cur_id > 0 then ldb_round_id_amt = lc_unit.f_get_round_id( ldb_cur_id, 0, 'amount')
	
	IF ldb_round_id_amt> 0 THEN ldb_act_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount)
		
	//-- tính price, amount liên quan --//
	if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
		ldb_act_qty =  vdw_line.getitemnumber(vl_line_row, 'act_qty')	
	end if
	ldb_ex_rate_cur = vdw_currency.getitemnumber(vdw_currency.getrow(), 'exchange_rate')	
	if ldb_act_qty > 0 then	ldb_act_price = ldb_act_amount / ldb_act_qty //-- giá tính ngược từ amt không làm tròn --//
	ldb_act_base_amount = ldb_act_amount * ldb_ex_rate_cur	
	if ldb_round_id_base_amt > 0 then ldb_act_base_amount = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_act_base_amount)
	
	if ls_included_tax_yn ='N' or ldb_tax_pct <= 0 then
		ldb_act_price_ex_tax =  ldb_act_price 		
		ldb_act_amount_ex_tax = ldb_act_amount 
		if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
			ldb_comm_pct =  vdw_line.getitemnumber(vl_line_row,'comm_pct') //-- tinh lai hoa hong neu co--//
			if ldb_comm_pct > 0 then
				ldb_comm_amt = ldb_act_amount_ex_tax * ldb_comm_pct/100 / ( 1 + ldb_comm_pct/100)
				if ldb_round_id_amt > 0 then ldb_comm_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_comm_amt)
			end if			
		end if
		ldb_ACT_BASE_AMOUNT_EX_TAX = ldb_act_amount_ex_tax * ldb_ex_rate_cur
		IF ldb_round_id_base_amt> 0 THEN ldb_ACT_BASE_AMOUNT_EX_TAX = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_ACT_BASE_AMOUNT_EX_TAX)
		ldb_act_price_ex_tax = ldb_act_price
	else
		ldb_act_amount_ex_tax = ldb_act_amount * ( 1/ldb_tax_pct)
		IF ldb_round_id_amt> 0 THEN ldb_act_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount_ex_tax)
		if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
			ldb_comm_pct =  vdw_line.getitemnumber(vl_line_row,'comm_pct') //-- tinh lai hoa hong neu co--//
			if ldb_comm_pct > 0 then
				ldb_comm_amt = ldb_act_amount_ex_tax * ldb_comm_pct/100 / ( 1 + ldb_comm_pct/100)
				if ldb_round_id_amt > 0 then ldb_comm_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_comm_amt)
			end if		
		end if
		ldb_ACT_BASE_AMOUNT_EX_TAX = ldb_act_amount_ex_tax * ldb_ex_rate_cur
		IF ldb_round_id_base_amt> 0 THEN ldb_ACT_BASE_AMOUNT_EX_TAX = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_ACT_BASE_AMOUNT_EX_TAX)
		if ldb_act_qty > 0 then	ldb_act_price_ex_tax = ldb_act_amount_ex_tax / ldb_act_qty	//-- giá tính ngược từ amt không làm tròn --//				
	end if	
				
elseif vs_edit_colname = 'item_code' or vs_edit_colname = 'spec_code' or vs_edit_colname = 'object_code' then
	
	ldb_price = vdw_line.getitemnumber(vl_line_row, 'price')
	ldb_unit_id =  vdw_line.getitemnumber(vl_line_row, 'TRANS_UOM')
	ldb_item_id =  vdw_line.getitemnumber(vl_line_row, ls_object_colname)
	ldb_cur_id = vdw_currency.getitemnumber( vdw_currency.getrow(), 'CURRENCY_ID' )	
	ls_included_tax_yn = vdw_currency.getitemstring(vdw_currency.getrow(), 'include_tax_yn')
	if isnull(ls_included_tax_yn) then ls_included_tax_yn ='N'	
	if vdw_line.dataobject <> 'd_po_line_grid' then	ldb_tax_pct =  vdw_line.getitemnumber(vl_line_row, 'tax_pct')
	if isnull(ldb_tax_pct) then ldb_tax_pct = 0
	//-- kiểm tra disc --//	
	ldb_discount_pct =  vdw_line.getitemnumber(vl_line_row, ls_disc_pct)
	if isnull(ldb_discount_pct) then ldb_discount_pct = 0
	ldb_discount_amt = vdw_line.getitemnumber(vl_line_row, ls_disc_amt)
	if isnull(ldb_discount_amt) then ldb_discount_amt = 0
	if  ldb_discount_amt > 0 and ldb_discount_pct = 0  then
		if (ldb_price - ldb_discount_amt) <= 0 then
			gf_messagebox('m.b_obj_instantiate.f_update_line_edit_change.01','Thông báo','Số tiền chiết khấu phải nhỏ hơn hơn đơn giá','stop','ok',1) 
			return -1
		end if				
		ldb_discount_pct  = round( ldb_discount_amt/ (ldb_price - ldb_discount_amt) * 100 ,2)
	end if
	
	 //-- chuẩn bị cho làm tròn  --//
	lc_unit.f_get_base_cur(ldb_base_cur,  ls_base_curcode,ls_base_curname)
	if ldb_base_cur > 0 then ldb_round_id_base_amt =  lc_unit.f_get_round_id( ldb_base_cur, 0, 'amount')
	if ldb_cur_id > 0 then ldb_round_id_price = lc_unit.f_get_round_id( ldb_cur_id, 0, 'price')
	if ldb_cur_id > 0 then ldb_round_id_amt = lc_unit.f_get_round_id( ldb_cur_id, 0, 'amount')
	if ldb_unit_id > 0 then ldb_round_id = lc_unit.f_get_round_id( ldb_unit_id, ldb_item_id, 'item')
	
	//-- tính act_price , price_ex_tax, act_price_ax_tax --//
	ldb_act_price = ldb_price 
	if ls_included_tax_yn ='N' or ldb_tax_pct <= 0 then
		ldb_price_ex_tax = ldb_price
		ldb_act_price_ex_tax = ldb_act_price
	else
		ldb_price_ex_tax = ldb_price * (1/ldb_tax_pct)
		IF ldb_round_id_price> 0 THEN ldb_price_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_price, ldb_price_ex_tax)
		ldb_act_price_ex_tax = ldb_act_price * (1/ldb_tax_pct)
		IF ldb_round_id_price> 0 THEN ldb_act_price_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_price, ldb_act_price_ex_tax)
	end if
	//-- tính amount liên quan--//
	ldb_qty = vdw_line.getitemnumber(vl_line_row, 'qty')
	IF ldb_round_id> 0 THEN ldb_qty = lc_unit.f_round( vdw_line, ldb_round_id, ldb_qty)
	if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
		ldb_act_qty =  vdw_line.getitemnumber(vl_line_row, 'act_qty')	
	end if
	IF ldb_round_id> 0 THEN ldb_act_qty = lc_unit.f_round( vdw_line, ldb_round_id, ldb_act_qty)
	ldb_ex_rate_cur = vdw_currency.getitemnumber(vdw_currency.getrow(), 'exchange_rate')	
	if 	ldb_discount_pct > 0 then  //-- tính giá sau khi trừ discount_pct --//
		ldb_disc_price = ldb_price *(1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))		
		ldb_amount = ldb_qty * ldb_disc_price 
		IF ldb_round_id_amt> 0 THEN ldb_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount)
	else
		ldb_amount = ldb_qty * ldb_price 
		IF ldb_round_id_amt> 0 THEN ldb_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount)
	end if				
	
	ldb_base_amount = ldb_amount * ldb_ex_rate_cur 
	IF ldb_round_id_base_amt> 0 THEN ldb_base_amount = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_base_amount)
	if 	ldb_discount_pct > 0 then  //-- tính giá sau khi trừ discount_pct --//
		ldb_disc_price_ex_tax = ldb_price_ex_tax* (1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))		
		ldb_amount_ex_tax = ldb_qty * ldb_disc_price_ex_tax 	
		IF ldb_round_id_amt> 0 THEN ldb_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount_ex_tax)
	else
		ldb_amount_ex_tax = ldb_qty * ldb_price_ex_tax  
		IF ldb_round_id_amt> 0 THEN ldb_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount_ex_tax)
	end if						
	ldb_base_amount_ex_tax = ldb_amount_ex_tax * ldb_ex_rate_cur
	IF ldb_round_id_base_amt> 0 THEN ldb_base_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_base_amount_ex_tax)
	if 	ldb_discount_pct > 0 then  //-- tính giá sau khi trừ discount_pct --//
		ldb_disc_act_price = ldb_act_price* (1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))		
		ldb_act_amount = ldb_act_qty * ldb_disc_act_price
		IF ldb_round_id_amt> 0 THEN ldb_act_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount)
	else
		ldb_act_amount = ldb_act_qty * ldb_act_price
		IF ldb_round_id_amt> 0 THEN ldb_act_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount)
	end if			
	ldb_act_base_amount = ldb_act_amount * ldb_ex_rate_cur	
	if ldb_round_id_base_amt > 0 then ldb_act_base_amount = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_act_base_amount)
	
	if 	ldb_discount_pct > 0 then  //-- tính giá sau khi trừ discount_pct --//
		ldb_disc_act_price_ex_tax = ldb_act_price_ex_tax*(1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))		
		ldb_act_amount_ex_tax =  ldb_act_qty * ldb_disc_act_price_ex_tax 
		IF ldb_round_id_amt> 0 THEN ldb_act_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount_ex_tax)
		if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
			ldb_comm_pct =  vdw_line.getitemnumber(vl_line_row,'comm_pct') //-- tinh lai hoa hong neu co--//
			if ldb_comm_pct > 0 then
				ldb_comm_amt = ldb_act_amount_ex_tax * ldb_comm_pct/100 / ( 1 + ldb_comm_pct/100)
				if ldb_round_id_amt > 0 then ldb_comm_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_comm_amt)
			end if		
		end if
	else
		ldb_act_amount_ex_tax =  ldb_act_qty * ldb_act_price_ex_tax 
		IF ldb_round_id_amt> 0 THEN ldb_act_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount_ex_tax)
		if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
			ldb_comm_pct =  vdw_line.getitemnumber(vl_line_row,'comm_pct') //-- tinh lai hoa hong neu co--//
			if ldb_comm_pct > 0 then
				ldb_comm_amt = ldb_act_amount_ex_tax * ldb_comm_pct/100 / ( 1 + ldb_comm_pct/100)
				if ldb_round_id_amt > 0 then ldb_comm_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_comm_amt)
			end if					
		end if
	end if								 				
	ldb_ACT_BASE_AMOUNT_EX_TAX = ldb_act_amount_ex_tax * ldb_ex_rate_cur 	
	IF ldb_round_id_base_amt> 0 THEN ldb_ACT_BASE_AMOUNT_EX_TAX = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_ACT_BASE_AMOUNT_EX_TAX)
	//-- tính thuế --//	
	ldb_object_ref_id = vdw_line.getitemnumber(vl_line_row, 'id')
	this.f_update_tax_appeon( ldb_cur_id, ldb_ex_rate_cur, vdw_tax, ldb_object_ref_id, ldb_tax_pct, ldb_amount_ex_tax, ldb_base_amount_ex_tax,0)	

elseif vs_edit_colname = ls_disc_pct   then
	ldb_discount_pct =  double(vs_editdata)

	if  isnull(ldb_discount_pct) then ldb_discount_pct = 0
	ldb_ex_rate_cur = vdw_currency.getitemnumber(vdw_currency.getrow(), 'exchange_rate')	
	ldb_cur_id = vdw_currency.getitemnumber( vdw_currency.getrow(), 'CURRENCY_ID' )
	
	 //-- chuẩn bị cho làm tròn  --//
	lc_unit.f_get_base_cur(ldb_base_cur,  ls_base_curcode,ls_base_curname)
	if ldb_base_cur > 0 then ldb_round_id_base_amt =  lc_unit.f_get_round_id( ldb_base_cur, 0, 'amount')
	if ldb_cur_id > 0 then ldb_round_id_amt = lc_unit.f_get_round_id( ldb_cur_id, 0, 'amount')
	if ldb_cur_id > 0 then ldb_round_id_price = lc_unit.f_get_round_id( ldb_cur_id, 0, 'price')
	
	//-- tính disc price--//
	ldb_price = vdw_line.getitemnumber(vl_line_row, 'price')
	if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
		ldb_act_price = vdw_line.getitemnumber(vl_line_row, 'act_price')
		ldb_act_price_ex_tax =  vdw_line.getitemnumber(vl_line_row, 'act_price_ex_tax')
	end if
	ldb_price_ex_tax =  vdw_line.getitemnumber(vl_line_row, 'price_ex_tax')
	
	
	ldb_disc_price =  ldb_price * ( 1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))		
	ldb_disc_act_price =  ldb_act_price * ( 1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))	
	ldb_disc_price_ex_tax =  ldb_price_ex_tax *( 1 -  ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))	
	ldb_disc_act_price_ex_tax =  ldb_act_price_ex_tax*(1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))	
	ldb_discount_amt =  ldb_price - ldb_disc_price
	if ldb_round_id_price > 0 then ldb_discount_amt = lc_unit.f_round( vdw_line, ldb_round_id_price, ldb_discount_amt)
	
	//-- Tính lại amount liên quan --//
	ldb_qty = vdw_line.getitemnumber(vl_line_row, 'qty')
	if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
		ldb_act_qty = vdw_line.getitemnumber(vl_line_row, 'act_qty')
	end if
	
	ldb_amount =  ldb_qty * ldb_disc_price	
	if ldb_round_id_amt > 0 then ldb_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount)
	ldb_base_amount = ldb_amount * ldb_ex_rate_cur 		
	if ldb_round_id_base_amt > 0 then ldb_base_amount = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_base_amount)
	ldb_amount_ex_tax =  ldb_qty * ldb_disc_price_ex_tax 	
	if ldb_round_id_amt > 0 then ldb_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount_ex_tax)
	ldb_base_amount_ex_tax = ldb_amount_ex_tax * ldb_ex_rate_cur			
	if ldb_round_id_base_amt > 0 then	ldb_base_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_base_amount_ex_tax)
	
	ldb_act_amount =  ldb_act_qty * ldb_disc_act_price 		
	if ldb_round_id_amt > 0 then	ldb_act_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount)
	ldb_act_base_amount = ldb_act_amount * ldb_ex_rate_cur	
	if ldb_round_id_base_amt > 0 then ldb_act_base_amount = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_act_base_amount)
	
	ldb_act_amount_ex_tax =  ldb_act_qty * ldb_disc_act_price_ex_tax 		
	if ldb_round_id_amt > 0 then	ldb_act_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount_ex_tax)
	if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
		ldb_comm_pct =  vdw_line.getitemnumber(vl_line_row,'comm_pct') //-- tinh lai hoa hong neu co--//
		if ldb_comm_pct > 0 then
			ldb_comm_amt = ldb_act_amount_ex_tax * ldb_comm_pct/100 / ( 1 + ldb_comm_pct/100)
			if ldb_round_id_amt > 0 then ldb_comm_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_comm_amt)
		end if			
	end if
	ldb_ACT_BASE_AMOUNT_EX_TAX = ldb_act_amount_ex_tax * ldb_ex_rate_cur 
	if ldb_round_id_base_amt > 0 then	ldb_ACT_BASE_AMOUNT_EX_TAX = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_ACT_BASE_AMOUNT_EX_TAX)
	//-- tính thuế --//	
	ldb_object_ref_id = vdw_line.getitemnumber(vl_line_row, 'id')
	if vdw_line.dataobject <> 'd_po_line_grid' then ldb_tax_pct = vdw_line.getitemnumber(vl_line_row, 'tax_pct')	
	this.f_update_tax_appeon( ldb_cur_id, ldb_ex_rate_cur, vdw_tax, ldb_object_ref_id, ldb_tax_pct, ldb_amount_ex_tax, ldb_base_amount_ex_tax,0)	
			
elseif vs_edit_colname = ls_disc_amt then
	ldb_discount_amt =  double(vs_editdata)

	if  isnull(ldb_discount_amt) then ldb_discount_amt = 0
	ldb_ex_rate_cur = vdw_currency.getitemnumber(vdw_currency.getrow(), 'exchange_rate')	
	ldb_cur_id = vdw_currency.getitemnumber( vdw_currency.getrow(), 'CURRENCY_ID' )
	
	 //-- chuẩn bị cho làm tròn  --//
	lc_unit.f_get_base_cur(ldb_base_cur,  ls_base_curcode,ls_base_curname)
	if ldb_base_cur > 0 then ldb_round_id_base_amt =  lc_unit.f_get_round_id( ldb_base_cur, 0, 'amount')
	if ldb_cur_id > 0 then ldb_round_id_amt = lc_unit.f_get_round_id( ldb_cur_id, 0, 'amount')
	
	//-- tính % disc, disc_price--//
	ldb_price = vdw_line.getitemnumber(vl_line_row, 'price')
	if (ldb_price - ldb_discount_amt) <= 0 then
		gf_messagebox('m.b_obj_instantiate.f_update_line_edit_change.01','Thông báo','Số tiền chiết khấu phải nhỏ hơn hơn đơn giá','stop','ok',1) 
		return -1
	end if		
	ldb_discount_pct = round( ldb_discount_amt/ (ldb_price - ldb_discount_amt) * 100 , 2)
	if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
		ldb_act_price = vdw_line.getitemnumber(vl_line_row, 'act_price')
		ldb_act_price_ex_tax =  vdw_line.getitemnumber(vl_line_row, 'act_price_ex_tax')
	end if
	ldb_price_ex_tax =  vdw_line.getitemnumber(vl_line_row, 'price_ex_tax')
	
	ldb_disc_price = ldb_price - ldb_discount_amt	
	ldb_disc_act_price =  ldb_act_price* (1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))	
	ldb_disc_price_ex_tax =  ldb_price_ex_tax *(1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))	
	ldb_disc_act_price_ex_tax =  ldb_act_price_ex_tax *(1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))	
	
	//-- Tính lại amount liên quan --//
	ldb_qty = vdw_line.getitemnumber(vl_line_row, 'qty')
	if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
		ldb_act_qty = vdw_line.getitemnumber(vl_line_row, 'act_qty')
	end if
	
	ldb_amount = ldb_qty * ldb_disc_price	
	if ldb_round_id_amt > 0 then	ldb_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount)
	ldb_base_amount = ldb_amount * ldb_ex_rate_cur 		
	if ldb_round_id_base_amt > 0 then	ldb_base_amount = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_base_amount)
	ldb_amount_ex_tax = ldb_qty * ldb_disc_price_ex_tax 	
	if ldb_round_id_amt > 0 then	ldb_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount_ex_tax)
	ldb_base_amount_ex_tax = ldb_amount_ex_tax * ldb_ex_rate_cur			
	if ldb_round_id_amt > 0 then	ldb_base_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_base_amount_ex_tax)
	
	ldb_act_amount =  ldb_act_qty * ldb_disc_act_price 		
	if ldb_round_id_amt > 0 then	ldb_act_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount)
	ldb_act_base_amount = ldb_act_amount * ldb_ex_rate_cur	
	if ldb_round_id_base_amt > 0 then ldb_act_base_amount = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_act_base_amount)
	
	ldb_act_amount_ex_tax = ldb_act_qty * ldb_disc_act_price_ex_tax 		
	if ldb_round_id_amt > 0 then	ldb_act_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount_ex_tax)
	if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
		ldb_comm_pct =  vdw_line.getitemnumber(vl_line_row,'comm_pct') //-- tinh lai hoa hong neu co--//
		if ldb_comm_pct > 0 then
			ldb_comm_amt = ldb_act_amount_ex_tax * ldb_comm_pct/100 / ( 1 + ldb_comm_pct/100)
			if ldb_round_id_amt > 0 then ldb_comm_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_comm_amt)
		end if			
	end if
	ldb_ACT_BASE_AMOUNT_EX_TAX = ldb_act_amount_ex_tax * ldb_ex_rate_cur 
	if ldb_base_amount_ex_tax > 0 then	ldb_ACT_BASE_AMOUNT_EX_TAX = lc_unit.f_round( vdw_line, ldb_base_amount_ex_tax, ldb_ACT_BASE_AMOUNT_EX_TAX)
	//-- tính thuế --//	
	ldb_object_ref_id = vdw_line.getitemnumber(vl_line_row, 'id')
	if vdw_line.dataobject <> 'd_po_line_grid' then ldb_tax_pct = vdw_line.getitemnumber(vl_line_row, 'tax_pct')	
	this.f_update_tax_appeon( ldb_cur_id, ldb_ex_rate_cur, vdw_tax, ldb_object_ref_id, ldb_tax_pct, ldb_amount_ex_tax, ldb_base_amount_ex_tax,0)	
				
elseif vs_edit_colname = 'markup_amt' then
	ldb_markup_amt = double(vs_editdata)

	ldb_cur_id = vdw_currency.getitemnumber( vdw_currency.getrow(), 'CURRENCY_ID' )
	ldb_ex_rate_cur = vdw_currency.getitemnumber( vdw_currency.getrow(), 'exchange_rate' )
	ls_included_tax_yn = vdw_currency.getitemstring(vdw_currency.getrow(), 'include_tax_yn')
	if isnull(ls_included_tax_yn) then ls_included_tax_yn ='N'	
	if vdw_line.dataobject <> 'd_po_line_grid' then ldb_tax_pct =  vdw_line.getitemnumber(vl_line_row, 'tax_pct')
	if isnull(ldb_tax_pct) then ldb_tax_pct = 0
	
	 //-- chuẩn bị cho làm tròn  --//
	lc_unit.f_get_base_cur(ldb_base_cur,  ls_base_curcode,ls_base_curname)
	if ldb_base_cur > 0 then ldb_round_id_base_amt =  lc_unit.f_get_round_id( ldb_base_cur, 0, 'amount')
	if ldb_cur_id > 0 then ldb_round_id_amt = lc_unit.f_get_round_id( ldb_cur_id, 0, 'amount')
	
	if isnull(ldb_markup_amt) then ldb_markup_amt = 0
	ldb_MARKUP_RETURN = ldb_markup_amt * 0.2
	
	if ldb_round_id_amt > 0 then  ldb_MARKUP_RETURN = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_MARKUP_RETURN)
	if ldb_round_id_amt > 0 then  ldb_markup_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_markup_amt)
	
	//-- copy act_amt --//
	if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
		ldb_act_amount = vdw_line.getitemnumber(vl_line_row, 'act_amount')
	end if
	ldb_amount = ldb_act_amount + ldb_markup_amt
	ldb_base_amount = ldb_amount * ldb_ex_rate_cur 
	if ldb_round_id_base_amt > 0 then  ldb_base_amount = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_base_amount)
	
	//-- tính price, amount liên quan --//
	ldb_qty = vdw_line.getitemnumber(vl_line_row, 'qty')
	if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
		ldb_act_qty =  vdw_line.getitemnumber(vl_line_row, 'act_qty')		
	end if
	if ldb_qty > 0 then	ldb_price = ldb_amount / ldb_qty //-- price tính ngược không làm tròn --//
	
	if ls_included_tax_yn ='N' or ldb_tax_pct <= 0 then
		ldb_price_ex_tax = ldb_price 	
		ldb_amount_ex_tax = ldb_amount 
		ldb_base_amount_ex_tax = ldb_base_amount 
	else
		ldb_amount_ex_tax = ldb_amount  * ( 1/ldb_tax_pct)
		if ldb_round_id_amt > 0 then  ldb_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount_ex_tax)
		ldb_base_amount_ex_tax = ldb_base_amount  * ( 1/ldb_tax_pct)
		if ldb_round_id_base_amt > 0 then  ldb_base_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_base_amount_ex_tax)
		if ldb_qty > 0 then	ldb_price_ex_tax = ldb_amount_ex_tax / ldb_qty	 //-- price tính ngược không làm tròn --//
	end if
	//-- tính thuế --//	
	ldb_object_ref_id = vdw_line.getitemnumber(vl_line_row, 'id')
	this.f_update_tax_appeon( ldb_cur_id, ldb_ex_rate_cur, vdw_tax, ldb_object_ref_id, ldb_tax_pct, ldb_amount_ex_tax, ldb_base_amount_ex_tax,0)	
	
elseif vs_edit_colname = 'uom_code' then //-- item unit --//
	ldb_ex_rate_cur = vdw_currency.getitemnumber( vdw_currency.getrow(), 'exchange_rate' ,primary!, false)	
	ldb_cur_id = vdw_currency.getitemnumber( vdw_currency.getrow(), 'CURRENCY_ID' )
	if vdb_previous_exrate = 0 then vdb_previous_exrate = vdw_currency.getitemnumber( vdw_currency.getrow(), 'exchange_rate' ,primary!, true)	
	if ldb_ex_rate_cur > 0 then	ldb_ex_rate_convert = vdb_previous_exrate/ldb_ex_rate_cur
	ls_included_tax_yn = vdw_currency.getitemstring(vdw_currency.getrow(), 'include_tax_yn')
	if isnull(ls_included_tax_yn) then ls_included_tax_yn ='N'	
	
	ldb_unit_id =  vdw_line.getitemnumber(vl_line_row, 'trans_uom')		
	ldb_item_id =  vdw_line.getitemnumber(vl_line_row, ls_object_colname)			
	
	 //-- chuẩn bị cho làm tròn  --//
	lc_unit.f_get_base_cur(ldb_base_cur,  ls_base_curcode,ls_base_curname)
	if ldb_base_cur > 0 then ldb_round_id_base_amt =  lc_unit.f_get_round_id( ldb_base_cur, 0, 'amount')
	if ldb_cur_id > 0 then ldb_round_id_amt = lc_unit.f_get_round_id( ldb_cur_id, 0, 'amount')	
	if ldb_cur_id > 0 then ldb_round_id_price = lc_unit.f_get_round_id( ldb_cur_id, 0, 'price')	
	if ldb_unit_id > 0 then ldb_round_id = lc_unit.f_get_round_id( ldb_unit_id, ldb_item_id, 'item')
	//-- kiểm tra disc --//	
	ldb_discount_pct =  vdw_line.getitemnumber(vl_line_row, ls_disc_pct)
	if isnull(ldb_discount_pct) then ldb_discount_pct = 0
	ldb_discount_amt = vdw_line.getitemnumber(vl_line_row, ls_disc_amt)
	if isnull(ldb_discount_amt) then ldb_discount_amt = 0
	if  ldb_discount_amt > 0 and ldb_discount_pct = 0  then
		if (ldb_price - ldb_discount_amt) <= 0 then
			gf_messagebox('m.b_obj_instantiate.f_update_line_edit_change.01','Thông báo','Số tiền chiết khấu phải nhỏ hơn hơn đơn giá','stop','ok',1) 
			return -1
		end if
		ldb_discount_pct  = round(ldb_discount_amt/ (ldb_price - ldb_discount_amt) * 100, 2)
	end if
			
	ldb_qty = vdw_line.getitemnumber(vl_line_row, 'qty')		
	if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
		ldb_act_qty = vdw_line.getitemnumber(vl_line_row, 'act_qty')	
		ldb_act_price = vdw_line.getitemnumber(vl_line_row, 'act_price')
		ldb_act_price_ex_tax =  vdw_line.getitemnumber(vl_line_row, 'act_price_ex_tax')	
	end if
	//-- tính disc price--//
	ldb_price = vdw_line.getitemnumber(vl_line_row, 'price')
	ldb_price_ex_tax =  vdw_line.getitemnumber(vl_line_row, 'price_ex_tax')
		
	//-- Quy đổi đơn vị--//
	ldb_stock_unit_id = lc_unit.f_get_unit_inventory_id(ldb_item_id )	
	if ldb_unit_id <> vdb_previous_uom  then  //-- Quy đổi đơn vị--//
		if ldb_unit_id <> ldb_stock_unit_id then
			if lc_unit.f_get_data_4_conversion_unit( ldb_unit_id, ldb_item_id, ldb_qty, ldba_data_conver[]) = -1 then return -1
			if  upperbound(ldba_data_conver[]) = 3 then
				if  ldba_data_conver[3] > 0 then
					//-- quy đổi số lượng --//
					ldb_qty = ldb_qty / ldba_data_conver[3]
					ldb_act_qty =  ldb_act_qty / ldba_data_conver[3]
					
					//-- quy đổi đơn giá--//
					ldb_price = ldb_price* ldba_data_conver[3]
					ldb_act_price = ldb_act_price *ldba_data_conver[3]
					ldb_price_ex_tax =  ldb_price_ex_tax *ldba_data_conver[3]
					ldb_act_price_ex_tax = ldb_act_price_ex_tax * ldba_data_conver[3]
				end if		
			end if			
		else
			if vdb_previous_uom = 0 then vdb_previous_uom =  vdw_line.getitemnumber(vl_line_row, 'trans_uom', primary!, true)						
			if lc_unit.f_get_data_4_conversion_unit( vdb_previous_uom, ldb_item_id, ldb_qty, ldba_data_conver[]) = -1 then return -1					
			if  upperbound(ldba_data_conver[]) = 3 then
				if  ldba_data_conver[3] > 0 then
					//-- quy đổi số lượng --//
					ldb_qty = ldb_qty * ldba_data_conver[3]
					ldb_act_qty =  ldb_act_qty* ldba_data_conver[3]
					
					//-- quy đổi đơn giá--//
					ldb_price = ldb_price / ldba_data_conver[3]
					ldb_act_price = ldb_act_price / ldba_data_conver[3]
					ldb_price_ex_tax =  ldb_price_ex_tax /ldba_data_conver[3]
					ldb_act_price_ex_tax = ldb_act_price_ex_tax / ldba_data_conver[3]
				end if		
			end if			
		end if
	end if
	//-- làm tròn --//
	if ldb_round_id > 0 then
		ldb_qty =  lc_unit.f_round( vdw_line, ldb_round_id, ldb_qty)
		ldb_act_qty =  lc_unit.f_round( vdw_line, ldb_round_id, ldb_act_qty)	
	end if
	if ldb_round_id_price > 0 then
		 ldb_price =  lc_unit.f_round( vdw_line, ldb_round_id_price, ldb_price)	
		 ldb_act_price =  lc_unit.f_round( vdw_line, ldb_round_id_price, ldb_act_price)	
		 ldb_price_ex_tax =  lc_unit.f_round( vdw_line, ldb_round_id_price, ldb_price_ex_tax)	
		 ldb_act_price_ex_tax =  lc_unit.f_round( vdw_line, ldb_round_id_price, ldb_act_price_ex_tax)	
	end if
	//-- tính amount liên quan--//
	if 	ldb_discount_pct > 0 then  //-- tính giá sau khi trừ discount_pct --//
		ldb_disc_price  = ldb_price *(1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))		
		ldb_amount = ldb_qty * ldb_disc_price 
		if ldb_round_id_amt > 0 then ldb_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount)
	else
		ldb_amount = ldb_qty * ldb_price 
		if ldb_round_id_amt > 0 then ldb_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount)
	end if								
	
	ldb_base_amount = ldb_amount * ldb_ex_rate_cur 
	if ldb_round_id_base_amt > 0 then ldb_base_amount = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_base_amount)
	if 	ldb_discount_pct > 0 then  //-- tính giá sau khi trừ discount_pct --//
		ldb_disc_price_ex_tax  = ldb_price_ex_tax*(1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))		
		ldb_amount_ex_tax = ldb_qty * ldb_disc_price_ex_tax
		if ldb_round_id_amt > 0 then ldb_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount_ex_tax)
	else
		ldb_amount_ex_tax = ldb_qty * ldb_price_ex_tax
		if ldb_round_id_amt > 0 then ldb_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount_ex_tax)
	end if										 
	ldb_base_amount_ex_tax = ldb_amount_ex_tax * ldb_ex_rate_cur
	if ldb_round_id_base_amt > 0 then ldb_base_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_base_amount_ex_tax)
	if 	ldb_discount_pct > 0 then  //-- tính giá sau khi trừ discount_pct --//
		ldb_disc_act_price = ldb_act_price*(1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))		
		ldb_act_amount = ldb_act_qty * ldb_disc_act_price 	
		if ldb_round_id_amt > 0 then ldb_act_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount)
	else
		ldb_act_amount = ldb_act_qty * ldb_act_price 	
		if ldb_round_id_amt > 0 then ldb_act_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount)
	end if						
	ldb_act_base_amount = ldb_act_amount * ldb_ex_rate_cur	
	if ldb_round_id_base_amt > 0 then ldb_act_base_amount = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_act_base_amount)
	
	if 	ldb_discount_pct > 0 then  //-- tính giá sau khi trừ discount_pct --//
		ldb_disc_act_price_ex_tax = ldb_act_price_ex_tax *(1 - ldb_discount_pct/100)/ (1 + (ldb_discount_pct/100))		
		ldb_act_amount_ex_tax =  ldb_act_qty * ldb_disc_act_price_ex_tax 	
		if ldb_round_id_amt > 0 then ldb_act_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount_ex_tax)
		if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
			ldb_comm_pct =  vdw_line.getitemnumber(vl_line_row,'comm_pct') //-- tinh lai hoa hong neu co--//
			if ldb_comm_pct > 0 then
				ldb_comm_amt = ldb_act_amount_ex_tax * ldb_comm_pct/100 / ( 1 + ldb_comm_pct/100)
				if ldb_round_id_amt > 0 then ldb_comm_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_comm_amt)
			end if			
		end if
	else
		ldb_act_amount_ex_tax =  ldb_act_qty * ldb_act_price_ex_tax 	
		if ldb_round_id_amt > 0 then ldb_act_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_act_amount_ex_tax)
		if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
			ldb_comm_pct =  vdw_line.getitemnumber(vl_line_row,'comm_pct') //-- tinh lai hoa hong neu co--//
			if ldb_comm_pct > 0 then
				ldb_comm_amt = ldb_act_amount_ex_tax * ldb_comm_pct/100 / ( 1 + ldb_comm_pct/100)
				if ldb_round_id_amt > 0 then ldb_comm_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_comm_amt)
			end if			
		end if
	end if				
	ldb_ACT_BASE_AMOUNT_EX_TAX = ldb_act_amount_ex_tax * ldb_ex_rate_cur 
	if ldb_round_id_base_amt > 0 then ldb_ACT_BASE_AMOUNT_EX_TAX = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_ACT_BASE_AMOUNT_EX_TAX)
	//-- tính thuế --//	
	ldb_object_ref_id = vdw_line.getitemnumber(vl_line_row, 'id')
	this.f_update_tax_appeon( ldb_cur_id, ldb_ex_rate_cur, vdw_tax, ldb_object_ref_id, ldb_tax_pct, ldb_amount_ex_tax, ldb_base_amount_ex_tax,0)		
elseif vs_edit_colname = 'tax_pct' then //--cột %tax bên so_line --//	
	ldb_tax_pct = double(vs_editdata)
	if isnull(ldb_tax_pct) then ldb_tax_pct = 0

	ldb_ex_rate_cur = vdw_currency.getitemnumber(vdw_currency.getrow(), 'exchange_rate')	
	ldb_cur_id = vdw_currency.getitemnumber( vdw_currency.getrow(), 'CURRENCY_ID' )
	ls_included_tax_yn = vdw_currency.getitemstring(vdw_currency.getrow(), 'include_tax_yn')
	if isnull(ls_included_tax_yn) then ls_included_tax_yn ='N'	
	
	 //-- chuẩn bị cho làm tròn  --//
	lc_unit.f_get_base_cur(ldb_base_cur,  ls_base_curcode,ls_base_curname)
	if ldb_base_cur > 0 then ldb_round_id_base_amt =  lc_unit.f_get_round_id( ldb_base_cur, 0, 'amount')
	if ldb_cur_id > 0 then ldb_round_id_amt = lc_unit.f_get_round_id( ldb_cur_id, 0, 'amount')	
	
	if ls_included_tax_yn ='N' or ldb_tax_pct <= 0 then
		ldb_amount_ex_tax = vdw_line.getitemnumber(vl_line_row, 'amount_ex_tax')
		ldb_base_amount_ex_tax = vdw_line.getitemnumber(vl_line_row, 'base_amount_ex_tax')
	else
		ldb_amount = vdw_line.getitemnumber(vl_line_row, 'amount')
		ldb_amount_ex_tax = ldb_amount  * ( 1/ldb_tax_pct)
		IF ldb_round_id_amt> 0 THEN ldb_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount_ex_tax)
		ldb_base_amount = vdw_line.getitemnumber(vl_line_row, 'base_amount')
		ldb_base_amount_ex_tax = ldb_base_amount  * ( 1/ldb_tax_pct)
		IF ldb_round_id_base_amt> 0 THEN ldb_base_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_base_amount_ex_tax)
	end if
	//-- tính thuế --//	
	ldb_object_ref_id = vdw_line.getitemnumber(vl_line_row, 'id')
	this.f_update_tax_appeon( ldb_cur_id, ldb_ex_rate_cur, vdw_tax, ldb_object_ref_id, ldb_tax_pct, ldb_amount_ex_tax, ldb_base_amount_ex_tax,0)		
elseif vs_edit_colname = 'tax_correction' then //--cột %tax bên so_line --//	
	ldb_tax_correction = double(vs_editdata)
	if isnull(ldb_tax_correction) then ldb_tax_correction = 0

	ldb_ex_rate_cur = vdw_currency.getitemnumber(vdw_currency.getrow(), 'exchange_rate')	
	ldb_cur_id = vdw_currency.getitemnumber( vdw_currency.getrow(), 'CURRENCY_ID' )
	ls_included_tax_yn = vdw_currency.getitemstring(vdw_currency.getrow(), 'include_tax_yn')
	if isnull(ls_included_tax_yn) then ls_included_tax_yn ='N'	
	
	 //-- chuẩn bị cho làm tròn  --//
	lc_unit.f_get_base_cur(ldb_base_cur,  ls_base_curcode,ls_base_curname)
	if ldb_base_cur > 0 then ldb_round_id_base_amt =  lc_unit.f_get_round_id( ldb_base_cur, 0, 'amount')
	if ldb_cur_id > 0 then ldb_round_id_amt = lc_unit.f_get_round_id( ldb_cur_id, 0, 'amount')	
	
	if ls_included_tax_yn ='N' or ldb_tax_pct <= 0 then
//		ldb_amount_ex_tax = vdw_line.getitemnumber(vl_line_row, 'amount_ex_tax')
		ldb_base_amount_ex_tax = vdw_line.getitemnumber(vl_line_row, 'base_amount_ex_tax')
	else
//		ldb_amount = vdw_line.getitemnumber(vl_line_row, 'amount')
//		ldb_amount_ex_tax = ldb_amount  * ( 1/ldb_tax_pct)
//		IF ldb_round_id_amt> 0 THEN ldb_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount_ex_tax)
		ldb_base_amount = vdw_line.getitemnumber(vl_line_row, 'base_amount')
		ldb_base_amount_ex_tax = ldb_base_amount  - ldb_tax_correction
		IF ldb_round_id_base_amt> 0 THEN ldb_base_amount_ex_tax = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_base_amount_ex_tax)
	end if
	//-- tính thuế --//	
//	ldb_object_ref_id = vdw_line.getitemnumber(vl_line_row, 'id')
//	this.f_update_tax_appeon( ldb_cur_id, ldb_ex_rate_cur, vdw_tax, ldb_object_ref_id, ldb_tax_pct, ldb_amount_ex_tax, ldb_base_amount_ex_tax, ldb_tax_correction)			
elseif vs_edit_colname = 'comm_pct' then //--cột %tax bên so_line --//	
	ldb_comm_pct = double(vs_editdata)
	if isnull(ldb_comm_pct) then ldb_comm_pct = 0
	ldb_cur_id = vdw_currency.getitemnumber( vdw_currency.getrow(), 'CURRENCY_ID' )
		
	 //-- chuẩn bị cho làm tròn  --//
	lc_unit.f_get_base_cur(ldb_base_cur,  ls_base_curcode,ls_base_curname)
	if ldb_base_cur > 0 then ldb_round_id_base_amt =  lc_unit.f_get_round_id( ldb_base_cur, 0, 'amount')
	if ldb_cur_id > 0 then ldb_round_id_amt = lc_unit.f_get_round_id( ldb_cur_id, 0, 'amount')	
	if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
		ldb_act_amount = vdw_line.getitemnumber(vl_line_row, 'act_amount_ex_tax')		
	end if	
	ldb_comm_amt =  ldb_act_amount * ldb_comm_pct/100/ (1 + (ldb_comm_pct/100))	
	IF ldb_round_id_amt> 0 THEN ldb_comm_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_comm_amt)
elseif vs_edit_colname = 'comm_amt'  then
	ldb_comm_amt = double(vs_editdata)
	if isnull(ldb_comm_amt) then ldb_comm_amt = 0

	ldb_cur_id = vdw_currency.getitemnumber( vdw_currency.getrow(), 'CURRENCY_ID' )		
	 //-- chuẩn bị cho làm tròn  --//
	if ldb_cur_id > 0 then ldb_round_id_amt = lc_unit.f_get_round_id( ldb_cur_id, 0, 'amount')	
	if vdw_line.dataobject <> 'd_pur_invoice_line_grid' AND vdw_line.dataobject <> 'd_po_line_grid' then
		ldb_act_amount = vdw_line.getitemnumber(vl_line_row, 'act_amount_ex_tax')
	end if
	ldb_comm_pct =  round( ldb_comm_amt/ (ldb_act_amount - ldb_comm_amt)  * 100 , 2)
end if

//-- Cập nhật lại line --//
li_colCnt = lc_string.f_stringtoarray( vs_upd_colname, ';', lsa_colname[])
FOR li_idx = 1 to li_colCnt
	if lsa_colname[li_idx] = 'amount' then
		vdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_amount)
	elseif lsa_colname[li_idx] = 'base_amount' then
		vdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_base_amount)
	elseif lsa_colname[li_idx] = 'act_amount' then
		vdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_act_amount)
	elseif lsa_colname[li_idx] = 'amount_ex_tax' then
		vdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_amount_ex_tax)
	elseif lsa_colname[li_idx] = 'base_amount_ex_tax' then
		vdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_base_amount_ex_tax)
	elseif lsa_colname[li_idx] = 'act_amount_ex_tax' then
		vdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_act_amount_ex_tax)
	elseif lsa_colname[li_idx] = 'act_base_amount_ex_tax' then
		vdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_act_base_amount_ex_tax)
	elseif lsa_colname[li_idx] = 'price' then
		vdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_price)
	elseif lsa_colname[li_idx] = 'act_price' then
		vdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_act_price)
	elseif lsa_colname[li_idx] = 'price_ex_tax' then
		vdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_price_ex_tax)
	elseif lsa_colname[li_idx] = 'act_price_ex_tax' then
		vdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_act_price_ex_tax)		
	elseif lsa_colname[li_idx] = ls_disc_amt then
		vdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_discount_amt)		
	elseif lsa_colname[li_idx] = ls_disc_pct then
		vdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_discount_pct)		
	elseif lsa_colname[li_idx] = 'markup_return' then
		vdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_markup_return)		
	elseif lsa_colname[li_idx] = 'act_qty' then
		vdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_act_qty)		
	elseif lsa_colname[li_idx] = 'qty' then
		vdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_qty)		
	elseif lsa_colname[li_idx] = 'act_base_amount' then
		vdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_act_base_amount)			
	elseif lsa_colname[li_idx] = 'tax_pct' then
		vdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_tax_pct)				
	elseif lsa_colname[li_idx] = 'tax_correction' then
		vdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_tax_correction)			
	elseif lsa_colname[li_idx] = 'comm_pct' then
		vdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_comm_pct)				
	elseif lsa_colname[li_idx] = 'comm_amt' then
		vdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_comm_amt)									
	end if						
NEXT


return 1
end function

public function integer f_get_item_price_disc (double vdb_item_id, double vdb_spec_id, double vdb_qty, ref double rdb_currency_id, string vs_dwo_price, string vs_price_type, date vd_trans_date, double vdb_object_id, double vdb_sales_person, ref double rdb_wholesales_price, ref double rdb_disc_amt, ref double rdb_disc_pct);/*Lấy giá của item từ bảng giá theo đơn vị tồn kho và loại tiền cài đặt
		- Nếu giá cài đặt có spec_yn = Y thì sẽ lấy giá theo spec, ngược lại ko lấy theo spec.
				+ lấy giá theo vdb_spec_id > 0 truyền vào
						# nếu ko tìm thấy giá theo spec -> kiểm tra bảng giá có spec_yn = 'Y' -> trả về giá = 0
						# nếu spec_yn = 'N' -. tìm giá không theo spec
				+ nếu spec_id = 0 hoặc null, -> tìm giá với đk spec_yn = 'Y'
		- Nếu tham số rdb_currency_id truyền vào không có trong bảng giá:
				+ lấy giá theo loại tiền rdb_currency_id
						# Nếu ko tìm thấy -> kiểm tra bảng giá currency_yn = 'Y' -> trả về giá = 0
						# Nếu currency_yn = 'N' -> tìm giá của bất cứ loại tiền nào khác có trong bảng giá.
				+ trả ngước lại Id của loại tiền trong bảng giá tìm thấy
-------------------------------------------------------------------------------------------------
	ĐK: bảng giá phải nhập số lượng: from_qty - to_qty và ngày bắt đầu		
=====================================================*/

t_ds_db		lds_sales_price,lds_setup_dw
c_datetime	lc_datetime
boolean		lb_got_price = false
double		ldb_staff_group,ldb_staff_id,ldb_customer_id, ldb_mange_group
string			ls_filter,ls_filter_staff,ls_filter_customer,ls_cols, ls_curr_id, ls_find, ls_filter_qty, ls_filter_date1, ls_filter_date2, ls_curr_yn = 'N'
long			ll_retrieve,ll_find_staff,ll_find_customer,ll_idx,ll_find
any			laa_data[], laa_empty[], laa_data_fix[]
int				li_cnt, li_rtn

//-- Phân biệt chi nhánh khi lấy gia --//

if upper(vs_price_type) = 'SALES' then
	laa_data[1]  = '=d_item_sales_price'
	laa_data[2] = '=U_ITEM'
	laa_data[3] = '=Y'
	ls_cols = 'DWOBJECT;OBJECT;BRANCH_YN'
	lds_setup_dw = create t_ds_db
	lds_setup_dw.dataobject = 'ds_setup_dw'
	lds_setup_dw.f_settransobject( SQLCA)
	lds_setup_dw.f_add_where( ls_cols , laa_data)
	ll_find = lds_setup_dw.retrieve( )

	
	//-- lấy nhóm khách hàng(chưa lấy) --//
	laa_data[] = laa_empty[]
	laa_data[1] = vdb_item_id
	laa_data[2] = upper(vs_price_type)
	ls_cols = 'item_id;price_type;'
	
	if ll_find > 0 then
		laa_data[upperbound(laa_data[]) + 1] =  gdb_branch
		ls_cols += 'branch_id;'
	end if

	lds_sales_price = create t_ds_db
	lds_sales_price.dataobject = vs_dwo_price
	lds_sales_price.f_settransobject( SQLCA)
	lds_sales_price.f_add_where( ls_cols, laa_data)
	ll_retrieve = lds_sales_price.retrieve( )
	
	if ll_retrieve = 0 then  //-- không có cài đặt giá bán cho mặt hàng --//
		rdb_wholesales_price = 0
		rdb_disc_amt = 0
		rdb_disc_pct =0
		return 0
	end if
	
	//-- lấy nhóm nhân viên --//
	if isnull(vdb_sales_person) then vdb_sales_person = 0
	select count(staff.dept_id) into :li_cnt
	from object join staff on staff.object_ref_id = object.id
					join object obj1 on obj1.id = staff.dept_id
	where object.id = :vdb_sales_person using SQLCA;
	
	if li_cnt > 0 then
		select staff.dept_id into :ldb_staff_group
		from object join staff on staff.object_ref_id = object.id
						join object obj1 on obj1.id = staff.dept_id
		where object.id = :vdb_sales_person using SQLCA;
	end if
	
	if vdb_spec_id <= 0 or isnull(vdb_spec_id) then  //-- mã hàng ko có spec --//
		ls_find =  " spec_yn = 'Y' "
		ll_find = lds_sales_price.find( ls_find, 1, ll_retrieve)
		if ll_find > 0 then
			rdb_wholesales_price = 0
			rdb_disc_amt = 0
			rdb_disc_pct =0
			return 0			
		end if
		ls_filter =   ""
	else 
		//-- mã hàng có spec : bảng giá theo spec --//
		ls_find =  " spec_yn = 'Y' "
		ll_find = lds_sales_price.find( ls_find, 1, ll_retrieve)
		if ll_find > 0 then
			ls_filter = " spec_id = " + string(vdb_spec_id) 
		else
		//-- mã hàng có spec: bảng giá ko spec --//
			ls_filter = ""
		end if		
	end if
	
	if rdb_currency_id > 0 then 
		ls_curr_id = " currency_id =" + string(rdb_currency_id)
		//-- bảng giá theo curr --//
		ls_find =  " currency_yn = 'Y' "
		ll_find = lds_sales_price.find( ls_find, 1, ll_retrieve)
		if ll_find > 0 then
			ls_curr_yn = 'Y'
		end if		
	else
		rdb_wholesales_price = 0
		rdb_disc_amt = 0
		rdb_disc_pct =0
		destroy lds_sales_price
		destroy lds_setup_dw										
		return 0					
	end if		

	//-- lọc theo khách hàng cụ thể và có giới hạn số lượng ngày tháng --//
	if isnull(vdb_qty) then vdb_qty = 0
	if isnull(vdb_object_id) then vdb_object_id = 0
	ls_filter_qty =  string(vdb_qty) + " between from_qty and to_qty "
	ls_filter_date1 = " date('" + string(vd_trans_date) + "') between f_date and t_date "	
	ls_filter_date2 = " date('" + string(vd_trans_date) + "') >= f_date "	
	if ls_filter <> '' then ls_filter += ' and '
	ls_filter += ls_filter_qty 	
	ls_filter_customer = " and APPLIED_OBJECT_ID = " + string(vdb_object_id) + " and object_applied_type = 'spec' " //+ " and (APPLIED_OBJECT_STAFF = " + string(vdb_sales_person) + " or STAFF_MANAGE_GROUP = " + string(ldb_staff_group) + ")"
	li_rtn = lds_sales_price.setfilter( ls_filter + ls_filter_customer + ' and ' +  ls_curr_id + ' and' + ls_filter_date1 )
	li_rtn= lds_sales_price.filter( )
	if lds_sales_price.rowcount( ) = 0 then		
		lds_sales_price.setfilter( ls_filter + ls_filter_customer + ' and ' + ls_curr_id + ' and' +ls_filter_date2 )
		lds_sales_price.filter( )		
		
	end if
	if lds_sales_price.rowcount( ) > 0 then
		lds_sales_price.setsort( " f_date desc ")
		lds_sales_price.sort( )
		//-- lấy giá bán theo nhân viên --//
		ll_find_staff = lds_sales_price.find( "APPLIED_OBJECT_STAFF = " + string(vdb_sales_person), 1, lds_sales_price.rowcount( ))
		if ll_find_staff = 0 then
			//-- lấy giá bán theo nhóm nhân viên --//
			ll_find_staff = lds_sales_price.find( "STAFF_MANAGE_GROUP = " + string(ldb_staff_group), 1, lds_sales_price.rowcount( ))
			if ll_find_staff = 0 then
				//-- lấy giá theo tất cả nhân viên --//
				ll_find_staff = lds_sales_price.find( "staff_applied_type = 'all'", 1, lds_sales_price.rowcount( ))
			end if
		end if
		if ll_find_staff > 0 then 
			rdb_wholesales_price = lds_sales_price.getitemnumber( ll_find_staff, 'wholesales_price')
			rdb_disc_amt = lds_sales_price.getitemnumber( ll_find_staff, 'discount_amount')
			rdb_disc_pct = lds_sales_price.getitemnumber( ll_find_staff, 'discount_pct')
			rdb_currency_id = lds_sales_price.getitemnumber( ll_find_staff, 'currency_id')
			destroy lds_sales_price
			destroy lds_setup_dw											
			return 1		
		else
			rdb_wholesales_price = 0
			rdb_disc_amt = 0
			rdb_disc_pct =0
			destroy lds_sales_price
			destroy lds_setup_dw								
			return 0					
		end if
	else
		//-- lọc theo nhóm khách hàng --//
		ldb_mange_group = this.f_get_manage_group(vdb_object_id )
		ls_filter_customer = " and OBJECT_MANAGE_GROUP = " + string(ldb_mange_group) + " and object_applied_type = 'group' "
		lds_sales_price.setfilter( ls_filter + ls_filter_customer + ' and ' +ls_curr_id + ' and' + ls_filter_date1 )
		lds_sales_price.filter( )
		if lds_sales_price.rowcount( ) = 0 then		
			lds_sales_price.setfilter( ls_filter + ls_filter_customer + ' and ' + ls_curr_id + ' and' +ls_filter_date2 )
			lds_sales_price.filter( )		
		end if
		if lds_sales_price.rowcount( ) > 0 then
			lds_sales_price.setsort( " f_date desc ")
			lds_sales_price.sort( )
			
			//-- lấy giá bán theo nhân viên --//
			ll_find_staff = lds_sales_price.find( "APPLIED_OBJECT_STAFF = " + string(vdb_sales_person), 1, lds_sales_price.rowcount( ))
			if ll_find_staff = 0 then
				//-- lấy giá bán theo nhóm nhân viên --//
				ll_find_staff = lds_sales_price.find( "STAFF_MANAGE_GROUP = " + string(ldb_staff_group), 1, lds_sales_price.rowcount( ))
				if ll_find_staff = 0 then
					//-- lấy giá theo tất cả nhân viên--//
					ll_find_staff = lds_sales_price.find( "staff_applied_type = 'all'", 1, lds_sales_price.rowcount( ))
				end if
			end if
			if ll_find_staff > 0 then 
				rdb_wholesales_price = lds_sales_price.getitemnumber( ll_find_staff, 'wholesales_price')
				rdb_disc_amt = lds_sales_price.getitemnumber( ll_find_staff, 'discount_amount')
				rdb_disc_pct = lds_sales_price.getitemnumber( ll_find_staff, 'discount_pct')
				rdb_currency_id = lds_sales_price.getitemnumber( ll_find_staff, 'currency_id')
				destroy lds_sales_price
				destroy lds_setup_dw									
				return 1		
			else
				rdb_wholesales_price = 0
				rdb_disc_amt = 0
				rdb_disc_pct =0
				destroy lds_sales_price
				destroy lds_setup_dw					
				return 0							
			end if
		else
			//-- lọc theo tất cả khách hàng --//
			ls_filter_customer = " and object_applied_type = 'all'"
			lds_sales_price.setfilter( ls_filter + ls_filter_customer + ' and ' + ls_curr_id + ' and' +ls_filter_date1 )
			lds_sales_price.filter( )
			if lds_sales_price.rowcount( ) = 0 then		
				lds_sales_price.setfilter( ls_filter + ls_filter_customer + ' and ' +ls_curr_id + ' and' + ls_filter_date2 )
				lds_sales_price.filter( )		
			end if
			if lds_sales_price.rowcount( ) > 0 then
				lds_sales_price.setsort( " f_date desc ")
				lds_sales_price.sort( )
				
				//-- lấy giá bán theo nhân viên --//
				ll_find_staff = lds_sales_price.find( "APPLIED_OBJECT_STAFF = " + string(vdb_sales_person), 1, lds_sales_price.rowcount( ))
				if ll_find_staff = 0 then
					//-- lấy giá bán theo nhóm nhân viên --//
					ll_find_staff = lds_sales_price.find( "STAFF_MANAGE_GROUP = " + string(ldb_staff_group), 1, lds_sales_price.rowcount( ))
					if ll_find_staff = 0 then
						//-- lấy giá theo tất cả nhân viên--//
						ll_find_staff = lds_sales_price.find( "staff_applied_type = 'all'", 1, lds_sales_price.rowcount( ))
					end if
					//-- chưa xử lý trường hợp lấy giá bán theo nhân viên trong khoảng thời gian từ ngày đến ngày --//
				end if 
				if ll_find_staff > 0 then 
					rdb_wholesales_price = lds_sales_price.getitemnumber( ll_find_staff, 'wholesales_price')
					rdb_disc_amt = lds_sales_price.getitemnumber( ll_find_staff, 'discount_amount')
					rdb_disc_pct = lds_sales_price.getitemnumber( ll_find_staff, 'discount_pct')
					rdb_currency_id = lds_sales_price.getitemnumber( ll_find_staff, 'currency_id')
					destroy lds_sales_price
					destroy lds_setup_dw						
					return 1
				else
					rdb_wholesales_price = 0
					rdb_disc_amt = 0
					rdb_disc_pct =0
					destroy lds_sales_price
					destroy lds_setup_dw						
					return 0							
				end if
			elseif ls_curr_yn = 'N' then //-- tìm ngược lại với loại tiền khác
				ls_filter_customer = " and APPLIED_OBJECT_ID = " + string(vdb_object_id) + " and object_applied_type = 'spec' " //+ " and (APPLIED_OBJECT_STAFF = " + string(vdb_sales_person) + " or STAFF_MANAGE_GROUP = " + string(ldb_staff_group) + ")"
				lds_sales_price.setfilter( ls_filter + ls_filter_customer + ' and ' + ls_filter_date1 )
				lds_sales_price.filter( )
				if lds_sales_price.rowcount( ) = 0 then		
					lds_sales_price.setfilter( ls_filter + ls_filter_customer + ' and ' + ls_filter_date2 )
					lds_sales_price.filter( )		
				end if
				if lds_sales_price.rowcount( ) > 0 then
					lds_sales_price.setsort( " f_date desc ")
					lds_sales_price.sort( )
					
					//-- lấy giá bán theo nhân viên --//
					ll_find_staff = lds_sales_price.find( "APPLIED_OBJECT_STAFF = " + string(vdb_sales_person), 1, lds_sales_price.rowcount( ))
					if ll_find_staff = 0 then
						//-- lấy giá bán theo nhóm nhân viên --//
						ll_find_staff = lds_sales_price.find( "STAFF_MANAGE_GROUP = " + string(ldb_staff_group), 1, lds_sales_price.rowcount( ))
						if ll_find_staff = 0 then
							//-- lấy giá theo tất cả nhân viên--//
							ll_find_staff = lds_sales_price.find( "staff_applied_type = 'all'", 1, lds_sales_price.rowcount( ))
						end if
					end if
					if ll_find_staff > 0 then 
						rdb_wholesales_price = lds_sales_price.getitemnumber( ll_find_staff, 'wholesales_price')
						rdb_disc_amt = lds_sales_price.getitemnumber( ll_find_staff, 'discount_amount')
						rdb_disc_pct = lds_sales_price.getitemnumber( ll_find_staff, 'discount_pct')
						rdb_currency_id = lds_sales_price.getitemnumber( ll_find_staff, 'currency_id')
						destroy lds_sales_price
						destroy lds_setup_dw							
						return 1		
					else
						rdb_wholesales_price = 0
						rdb_disc_amt = 0
						rdb_disc_pct =0
						destroy lds_sales_price
						destroy lds_setup_dw							
						return 0							
					end if
				else
					//-- lọc theo nhóm khách hàng --//
					ldb_mange_group = this.f_get_manage_group(vdb_object_id )
					ls_filter_customer = " and OBJECT_MANAGE_GROUP = " + string(ldb_mange_group) + " and object_applied_type = 'group' "
					lds_sales_price.setfilter( ls_filter + ls_filter_customer + ' and ' + ls_filter_date1 )
					lds_sales_price.filter( )
					if lds_sales_price.rowcount( ) = 0 then		
						lds_sales_price.setfilter( ls_filter + ls_filter_customer + ' and ' +ls_filter_date2 )
						lds_sales_price.filter( )		
					end if
					if lds_sales_price.rowcount( ) > 0 then
						lds_sales_price.setsort( " f_date desc ")
						lds_sales_price.sort( )
						
						//-- lấy giá bán theo nhân viên --//
						ll_find_staff = lds_sales_price.find( "APPLIED_OBJECT_STAFF = " + string(vdb_sales_person), 1, lds_sales_price.rowcount( ))
						if ll_find_staff = 0 then
							//-- lấy giá bán theo nhóm nhân viên --//
							ll_find_staff = lds_sales_price.find( "STAFF_MANAGE_GROUP = " + string(ldb_staff_group), 1, lds_sales_price.rowcount( ))
							if ll_find_staff = 0 then
								//-- lấy giá theo tất cả nhân viên--//
								ll_find_staff = lds_sales_price.find( "staff_applied_type = 'all'", 1, lds_sales_price.rowcount( ))
							end if
						end if
						if ll_find_staff > 0 then 
							rdb_wholesales_price = lds_sales_price.getitemnumber( ll_find_staff, 'wholesales_price')
							rdb_disc_amt = lds_sales_price.getitemnumber( ll_find_staff, 'discount_amount')
							rdb_disc_pct = lds_sales_price.getitemnumber( ll_find_staff, 'discount_pct')
							rdb_currency_id = lds_sales_price.getitemnumber( ll_find_staff, 'currency_id')
							destroy lds_sales_price
							destroy lds_setup_dw								
							return 1		
						else
							rdb_wholesales_price = 0
							rdb_disc_amt = 0
							rdb_disc_pct =0
							destroy lds_sales_price
							destroy lds_setup_dw								
							return 0							
						end if					
					else
						//-- lọc theo tất cả khách hàng --//
						ls_filter_customer = " and object_applied_type = 'all'"
						lds_sales_price.setfilter( ls_filter + ls_filter_customer + ' and ' +ls_filter_date1 )
						lds_sales_price.filter( )
						if lds_sales_price.rowcount( ) = 0 then		
							lds_sales_price.setfilter( ls_filter + ls_filter_customer + ' and ' + ls_filter_date2 )
							lds_sales_price.filter( )		
						end if
						if lds_sales_price.rowcount( ) > 0 then
							lds_sales_price.setsort( " f_date desc ")
							lds_sales_price.sort( )
							
							//-- lấy giá bán theo nhân viên --//
							ll_find_staff = lds_sales_price.find( "APPLIED_OBJECT_STAFF = " + string(vdb_sales_person), 1, lds_sales_price.rowcount( ))
							if ll_find_staff = 0 then
								//-- lấy giá bán theo nhóm nhân viên --//
								ll_find_staff = lds_sales_price.find( "STAFF_MANAGE_GROUP = " + string(ldb_staff_group), 1, lds_sales_price.rowcount( ))
								if ll_find_staff = 0 then
									//-- lấy giá theo tất cả nhân viên--//
									ll_find_staff = lds_sales_price.find( "staff_applied_type = 'all'", 1, lds_sales_price.rowcount( ))
								end if
								//-- chưa xử lý trường hợp lấy giá bán theo nhân viên trong khoảng thời gian từ ngày đến ngày --//
							end if 
							if ll_find_staff > 0 then 
								rdb_wholesales_price = lds_sales_price.getitemnumber( ll_find_staff, 'wholesales_price')
								rdb_disc_amt = lds_sales_price.getitemnumber( ll_find_staff, 'discount_amount')
								rdb_disc_pct = lds_sales_price.getitemnumber( ll_find_staff, 'discount_pct')
								rdb_currency_id = lds_sales_price.getitemnumber( ll_find_staff, 'currency_id')
								destroy lds_sales_price
								destroy lds_setup_dw								
								return 1
							else
								rdb_wholesales_price = 0
								rdb_disc_amt = 0
								rdb_disc_pct =0
								destroy lds_sales_price
								destroy lds_setup_dw								
								return 0							
							end if					
						else
							rdb_wholesales_price = 0
							rdb_disc_amt = 0
							rdb_disc_pct =0
							destroy lds_sales_price
							destroy lds_setup_dw							
							return 0														
						end if
					end if
				end if				
			else
				rdb_wholesales_price = 0
				rdb_disc_amt = 0
				rdb_disc_pct =0
				destroy lds_sales_price
				destroy lds_setup_dw
				
				return 0														
				
			end if
		end if
	end if
elseif upper(vs_price_type) = 'PURCHASE' then
	return this.f_get_item_price_disc_purchase( vdb_item_id,vdb_spec_id, vdb_qty, rdb_currency_id, vs_dwo_price, vs_price_type, vd_trans_date, vdb_object_id, vdb_sales_person, rdb_wholesales_price, rdb_disc_amt, rdb_disc_pct)
end if	
destroy lds_sales_price
destroy lds_setup_dw
return 0	

/*
	//-- lọc theo tự̀ ngày đến ngày , áp dụng tất cả, khổng theo số lượng --//
	if not lb_got_price and lds_sales_price.rowcount()> 0 then
		lds_sales_price.setsort( " f_date desc")
		lds_sales_price.sort( )		
		ls_filter = "if(isnull(from_qty),0,from_qty ) = 0 and if(isnull(to_qty),0,to_qty ) = 0  and if(isnull(f_date),0,if(f_date = date('01/01/1900'),0,1)) = 1 and if(isnull(t_date),0,if(t_date = date('01/01/1900'),0,1)) = 1  "
		lds_sales_price.setfilter( ls_filter)
		lds_sales_price.filter( )
		if lds_sales_price.rowcount( ) > 0 then
			ls_filter =  "staff_applied_type = 'all' and  object_applied_type = 'all ' and date('" + string(vd_trans_date) + "') between f_date and t_date"
			ll_find = lds_sales_price.find( ls_filter, 1, lds_sales_price.rowcount( ))
			if ll_find > 0 then
				rdb_wholesales_price = lds_sales_price.getitemnumber( ll_find_staff, 'wholesales_price')
				rdb_disc_amt = lds_sales_price.getitemnumber( ll_find_staff, 'discount_amount')
				rdb_disc_pct = lds_sales_price.getitemnumber( ll_find_staff, 'discount_pct')
				rdb_currency_id = lds_sales_price.getitemnumber( ll_find_staff, 'currency_id')
				return 1
			end if
		end if
	end if
	
	//-- loc theo từ ngày chưa biết ngày hết hạn , áp dụng tất cả, không theo số lượng  --//
	if not lb_got_price then		
		ls_filter = "if(isnull(from_qty),0,from_qty ) = 0 and if(isnull(to_qty),0,to_qty ) = 0  and if(isnull(f_date),0,if(f_date = date('01/01/1900'),0,1)) = 1 and if(isnull(t_date),0,if(t_date = date('01/01/1900'),0,1)) = 0  "
		lds_sales_price.setfilter( ls_filter)
		lds_sales_price.filter( )
		if lds_sales_price.rowcount( ) > 0 then
			ls_filter =  "staff_applied_type = 'all' and  object_applied_type = 'all ' and date('" + string(vd_trans_date) + "') between f_date and date('" +lc_datetime.f_getsysdate('dd/mm/yyyy' ) + "')"
			ll_find = lds_sales_price.find( ls_filter, 1, lds_sales_price.rowcount( ))
			if ll_find > 0 then
				rdb_wholesales_price = lds_sales_price.getitemnumber( ll_find_staff, 'wholesales_price')
				rdb_disc_amt = lds_sales_price.getitemnumber( ll_find_staff, 'discount_amount')
				rdb_disc_pct = lds_sales_price.getitemnumber( ll_find_staff, 'discount_pct')
				rdb_currency_id = lds_sales_price.getitemnumber( ll_find_staff, 'currency_id')
				return 1
			end if
		end if
	end if
	
	//-- loc theo từ ngày chưa biết ngày hết hạn , áp dụng cụ thể object, không theo số lượng  --//
	if not lb_got_price then
		ls_filter = "if(isnull(from_qty),0,from_qty ) = 0 and if(isnull(to_qty),0,to_qty ) = 0  and if(isnull(f_date),0,if(f_date = date('01/01/1900'),0,1)) = 1 and if(isnull(t_date),0,if(t_date = date('01/01/1900'),0,1)) = 0  "
		lds_sales_price.setfilter( ls_filter)
		lds_sales_price.filter( )
		if lds_sales_price.rowcount( ) > 0 then
			ls_filter =  "staff_applied_type = 'all' and date('" + string(vd_trans_date) + "') between f_date and date('" +lc_datetime.f_getsysdate('dd/mm/yyyy' ) + "')" 
			ls_filter_customer = " and APPLIED_OBJECT_ID = " + string(vdb_object_id) + " and object_applied_type = "+"'"+"spec"+"'"
			ll_find = lds_sales_price.find( ls_filter + ls_filter_customer, 1, lds_sales_price.rowcount( ))
			if ll_find > 0 then
				rdb_wholesales_price = lds_sales_price.getitemnumber( ll_find_staff, 'wholesales_price')
				rdb_disc_amt = lds_sales_price.getitemnumber( ll_find_staff, 'discount_amount')
				rdb_disc_pct = lds_sales_price.getitemnumber( ll_find_staff, 'discount_pct')
				rdb_currency_id = lds_sales_price.getitemnumber( ll_find_staff, 'currency_id')
				return 1
			end if
		end if
	end if
	//-- lọc theo từ số lượng chưa biết đến số lượng giới hạn, áp dụng tất cả, không theo ngày áp dụng --//
	if not lb_got_price then
		//-- chưa xử lý --//
	end if
	//-- lọc không theo giới hạn số lượng và ngày tháng và áp dụng cho tất cả--//
	if not lb_got_price then
		ls_filter = "if(isnull(from_qty),0,from_qty ) = 0 and if(isnull(to_qty),0,to_qty ) = 0 and if(isnull(f_date),0,if(f_date = date('01/01/1900'),0,1)) = 0 and if(isnull(t_date),0,if(t_date = date('01/01/1900'),0,1)) = 0"
		lds_sales_price.setfilter( ls_filter)
		lds_sales_price.filter( )
		if lds_sales_price.rowcount( ) > 0 then
			ll_find = lds_sales_price.find( "staff_applied_type = 'all' and  object_applied_type = 'all'", 1, lds_sales_price.rowcount( ))
			if ll_find > 0 then
				rdb_wholesales_price = lds_sales_price.getitemnumber( ll_find_staff, 'wholesales_price')
				rdb_disc_amt = lds_sales_price.getitemnumber( ll_find_staff, 'discount_amount')
				rdb_disc_pct = lds_sales_price.getitemnumber( ll_find_staff, 'discount_pct')
				rdb_currency_id = lds_sales_price.getitemnumber( ll_find_staff, 'currency_id')
				return 1
			end if
		end if
	end if
elseif upper(vs_price_type) = 'PURCHASE' then
	return this.f_get_item_price_disc_purchase( vdb_item_id, vdb_qty, rdb_currency_id, vs_dwo_price, vs_price_type, vd_trans_date, vdb_object_id, vdb_sales_person, rdb_wholesales_price, rdb_disc_amt, rdb_disc_pct)
end if

destroy lds_sales_price
destroy lds_setup_dw
return 0
*/
end function

private function integer f_get_item_price_disc_purchase (double vdb_item_id, double vdb_spec_id, double vdb_qty, ref double rdb_currency_id, string vs_dwo_price, string vs_price_type, date vd_trans_date, double vdb_object_id, double vdb_sales_person, ref double rdb_wholesales_price, ref double rdb_disc_amt, ref double rdb_disc_pct);/*Lấy giá của item từ bảng giá theo đơn vị tồn kho và loại tiền cài đặt
		- Nếu giá cài đặt có spec_yn = Y thì sẽ lấy giá theo spec, ngược lại ko lấy theo spec.
				+ lấy giá theo vdb_spec_id > 0 truyền vào
						# nếu ko tìm thấy giá theo spec -> kiểm tra bảng giá có spec_yn = 'Y' -> trả về giá = 0
						# nếu spec_yn = 'N' -. tìm giá không theo spec
				+ nếu spec_id = 0 hoặc null, -> tìm giá với đk spec_yn = 'Y'
		- Nếu tham số rdb_currency_id truyền vào không có trong bảng giá:
				+ lấy giá theo loại tiền rdb_currency_id
						# Nếu ko tìm thấy -> kiểm tra bảng giá currency_yn = 'Y' -> trả về giá = 0
						# Nếu currency_yn = 'N' -> tìm giá của bất cứ loại tiền nào khác có trong bảng giá.
				+ trả ngước lại Id của loại tiền trong bảng giá tìm thấy
-------------------------------------------------------------------------------------------------
	ĐK: bảng giá phải nhập số lượng: from_qty - to_qty và ngày bắt đầu		
=====================================================*/

t_ds_db		lds_pur_price,lds_setup_dw
c_datetime	lc_datetime
boolean		lb_got_price = false
double		ldb_staff_group,ldb_staff_id,ldb_customer_id, ldb_mange_group
string			ls_filter,ls_filter_vendor,ls_cols, ls_curr_id, ls_find, ls_filter_qty, ls_filter_date1, ls_filter_date2, ls_curr_yn = 'N'
long			ll_retrieve,ll_idx,ll_find
any			laa_data[], laa_empty[], laa_data_fix[]
int				li_cnt

//-- Phân biệt chi nhánh khi lấy gia --//

if upper(vs_price_type) = 'PURCHASE' then
	laa_data[1]  = '=d_item_purchase_price'
	laa_data[2] = '=U_ITEM'
	laa_data[3] = '=Y'
	ls_cols = 'DWOBJECT;OBJECT;BRANCH_YN'
	lds_setup_dw = create t_ds_db
	lds_setup_dw.dataobject = 'ds_setup_dw'
	lds_setup_dw.f_settransobject( SQLCA)
	lds_setup_dw.f_add_where( ls_cols , laa_data)
	ll_find = lds_setup_dw.retrieve( )

	
	//-- lấy nhóm khách hàng(chưa lấy) --//
	laa_data[] = laa_empty[]
	laa_data[1] = vdb_item_id
	laa_data[2] = upper(vs_price_type)
	ls_cols = 'item_id;price_type;'
	
	if ll_find > 0 then
		laa_data[upperbound(laa_data[]) + 1] =  gdb_branch
		ls_cols += 'branch_id;'
	end if

	lds_pur_price = create t_ds_db
	lds_pur_price.dataobject = vs_dwo_price
	lds_pur_price.f_settransobject( SQLCA)
	lds_pur_price.f_add_where( ls_cols, laa_data)
	ll_retrieve = lds_pur_price.retrieve( )
	
	if ll_retrieve = 0 then  //-- không có cài đặt giá bán cho mặt hàng --//
		rdb_wholesales_price = 0
		rdb_disc_amt = 0
		rdb_disc_pct =0
		return 0
	end if
	
	if vdb_spec_id <= 0 or isnull(vdb_spec_id) then  //-- mã hàng ko có spec --//
		ls_find =  " spec_yn = 'N' "
		ll_find = lds_pur_price.find( ls_find, 1, ll_retrieve)
		if ll_find > 0 then
			rdb_wholesales_price = 0
			rdb_disc_amt = 0
			rdb_disc_pct =0
			return 0			
		end if
		ls_filter =   ""
	else 
		//-- mã hàng có spec : bảng giá theo spec --//
		ls_find =  " spec_yn = 'Y' "
		ll_find = lds_pur_price.find( ls_find, 1, ll_retrieve)
		if ll_find > 0 then
			ls_filter = " spec_id = " + string(vdb_spec_id) 
		else
		//-- mã hàng có spec: bảng giá ko spec --//
			ls_filter = ""
		end if		
	end if
	
	if rdb_currency_id > 0 then 
		ls_curr_id = " currency_id =" + string(rdb_currency_id)
		//-- bảng giá theo curr --//
		ls_find =  " currency_yn = 'Y' "
		ll_find = lds_pur_price.find( ls_find, 1, ll_retrieve)
		if ll_find > 0 then
			ls_curr_yn = 'Y'
		end if		
	else
		rdb_wholesales_price = 0
		rdb_disc_amt = 0
		rdb_disc_pct =0
		destroy lds_pur_price
		destroy lds_setup_dw										
		return 0					
	end if		

	//-- lọc theo khách hàng cụ thể và có giới hạn số lượng ngày tháng --//
	if isnull(vdb_qty) then vdb_qty = 0
	if isnull(vdb_object_id) then vdb_object_id = 0
	ls_filter_qty =  string(vdb_qty) + " between from_qty and to_qty "
	ls_filter_date1 = " date('" + string(vd_trans_date) + "') between f_date and t_date "	
	ls_filter_date2 = " date('" + string(vd_trans_date) + "') >= f_date "	
	if ls_filter <> '' then ls_filter += ' and '
	ls_filter += ls_filter_qty 	
	ls_filter_vendor = " and APPLIED_OBJECT_ID = " + string(vdb_object_id) + " and object_applied_type = 'spec' " //+ " and (APPLIED_OBJECT_STAFF = " + string(vdb_sales_person) + " or STAFF_MANAGE_GROUP = " + string(ldb_staff_group) + ")"
	lds_pur_price.setfilter( ls_filter + ls_filter_vendor + ' and ' +  ls_curr_id + ' and' + ls_filter_date1 )
	lds_pur_price.filter( )
	if lds_pur_price.rowcount( ) = 0 then		
		lds_pur_price.setfilter( ls_filter + ls_filter_vendor + ' and ' + ls_curr_id + ' and' +ls_filter_date2 )
		lds_pur_price.filter( )		
		
	end if
	if lds_pur_price.rowcount( ) > 0 then
		lds_pur_price.setsort( " f_date desc ")
		lds_pur_price.sort( )

		rdb_wholesales_price = lds_pur_price.getitemnumber( 1, 'wholesales_price')
		rdb_disc_amt = lds_pur_price.getitemnumber( 1, 'discount_amount')
		rdb_disc_pct = lds_pur_price.getitemnumber( 1, 'discount_pct')
		rdb_currency_id = lds_pur_price.getitemnumber( 1, 'currency_id')
		destroy lds_pur_price
		destroy lds_setup_dw											
		return 1		

	else
		//-- lọc theo nhóm khách hàng --//
		ldb_mange_group = this.f_get_manage_group(vdb_object_id )
		ls_filter_vendor = " and OBJECT_MANAGE_GROUP = " + string(ldb_mange_group) + " and object_applied_type = 'group' "
		lds_pur_price.setfilter( ls_filter + ls_filter_vendor + ' and ' +ls_curr_id + ' and' + ls_filter_date1 )
		lds_pur_price.filter( )
		if lds_pur_price.rowcount( ) = 0 then		
			lds_pur_price.setfilter( ls_filter + ls_filter_vendor + ' and ' + ls_curr_id + ' and' +ls_filter_date2 )
			lds_pur_price.filter( )		
		end if
		if lds_pur_price.rowcount( ) > 0 then
			lds_pur_price.setsort( " f_date desc ")
			lds_pur_price.sort( )
			
			rdb_wholesales_price = lds_pur_price.getitemnumber( 1, 'wholesales_price')
			rdb_disc_amt = lds_pur_price.getitemnumber( 1, 'discount_amount')
			rdb_disc_pct = lds_pur_price.getitemnumber( 1, 'discount_pct')
			rdb_currency_id = lds_pur_price.getitemnumber( 1, 'currency_id')
			destroy lds_pur_price
			destroy lds_setup_dw									
			return 1		

		else
			//-- lọc theo tất cả khách hàng --//
			ls_filter_vendor = " and object_applied_type = 'all'"
			lds_pur_price.setfilter( ls_filter + ls_filter_vendor + ' and ' + ls_curr_id + ' and' +ls_filter_date1 )
			lds_pur_price.filter( )
			if lds_pur_price.rowcount( ) = 0 then		
				lds_pur_price.setfilter( ls_filter + ls_filter_vendor + ' and ' +ls_curr_id + ' and' + ls_filter_date2 )
				lds_pur_price.filter( )		
			end if
			if lds_pur_price.rowcount( ) > 0 then
				lds_pur_price.setsort( " f_date desc ")
				lds_pur_price.sort( )

				rdb_wholesales_price = lds_pur_price.getitemnumber( 1, 'wholesales_price')
				rdb_disc_amt = lds_pur_price.getitemnumber( 1, 'discount_amount')
				rdb_disc_pct = lds_pur_price.getitemnumber( 1, 'discount_pct')
				rdb_currency_id = lds_pur_price.getitemnumber( 1, 'currency_id')
				destroy lds_pur_price
				destroy lds_setup_dw						
				return 1

			elseif ls_curr_yn = 'N' then //-- tìm ngược lại với loại tiền khác
				ls_filter_vendor = " and APPLIED_OBJECT_ID = " + string(vdb_object_id) + " and object_applied_type = 'spec' " //+ " and (APPLIED_OBJECT_STAFF = " + string(vdb_sales_person) + " or STAFF_MANAGE_GROUP = " + string(ldb_staff_group) + ")"
				lds_pur_price.setfilter( ls_filter + ls_filter_vendor + ' and ' + ls_filter_date1 )
				lds_pur_price.filter( )
				if lds_pur_price.rowcount( ) = 0 then		
					lds_pur_price.setfilter( ls_filter + ls_filter_vendor + ' and ' + ls_filter_date2 )
					lds_pur_price.filter( )		
				end if
				if lds_pur_price.rowcount( ) > 0 then
					lds_pur_price.setsort( " f_date desc ")
					lds_pur_price.sort( )
					
					rdb_wholesales_price = lds_pur_price.getitemnumber( 1, 'wholesales_price')
					rdb_disc_amt = lds_pur_price.getitemnumber( 1, 'discount_amount')
					rdb_disc_pct = lds_pur_price.getitemnumber( 1, 'discount_pct')
					rdb_currency_id = lds_pur_price.getitemnumber( 1, 'currency_id')
					destroy lds_pur_price
					destroy lds_setup_dw							
					return 1		

				else
					//-- lọc theo nhóm khách hàng --//
					ldb_mange_group = this.f_get_manage_group(vdb_object_id )
					ls_filter_vendor = " and OBJECT_MANAGE_GROUP = " + string(ldb_mange_group) + " and object_applied_type = 'group' "
					lds_pur_price.setfilter( ls_filter + ls_filter_vendor + ' and ' + ls_filter_date1 )
					lds_pur_price.filter( )
					if lds_pur_price.rowcount( ) = 0 then		
						lds_pur_price.setfilter( ls_filter + ls_filter_vendor + ' and ' +ls_filter_date2 )
						lds_pur_price.filter( )		
					end if
					if lds_pur_price.rowcount( ) > 0 then
						lds_pur_price.setsort( " f_date desc ")
						lds_pur_price.sort( )
						 
						rdb_wholesales_price = lds_pur_price.getitemnumber( 1, 'wholesales_price')
						rdb_disc_amt = lds_pur_price.getitemnumber( 1, 'discount_amount')
						rdb_disc_pct = lds_pur_price.getitemnumber( 1, 'discount_pct')
						rdb_currency_id = lds_pur_price.getitemnumber( 1, 'currency_id')
						destroy lds_pur_price
						destroy lds_setup_dw								
						return 1		
				
					else
						//-- lọc theo tất cả khách hàng --//
						ls_filter_vendor = " and object_applied_type = 'all'"
						lds_pur_price.setfilter( ls_filter + ls_filter_vendor + ' and ' +ls_filter_date1 )
						lds_pur_price.filter( )
						if lds_pur_price.rowcount( ) = 0 then		
							lds_pur_price.setfilter( ls_filter + ls_filter_vendor + ' and ' + ls_filter_date2 )
							lds_pur_price.filter( )		
						end if
						if lds_pur_price.rowcount( ) > 0 then
							lds_pur_price.setsort( " f_date desc ")
							lds_pur_price.sort( )

							rdb_wholesales_price = lds_pur_price.getitemnumber( 1, 'wholesales_price')
							rdb_disc_amt = lds_pur_price.getitemnumber( 1, 'discount_amount')
							rdb_disc_pct = lds_pur_price.getitemnumber( 1, 'discount_pct')
							rdb_currency_id = lds_pur_price.getitemnumber( 1, 'currency_id')
							destroy lds_pur_price
							destroy lds_setup_dw								
							return 1
			
						else
							rdb_wholesales_price = 0
							rdb_disc_amt = 0
							rdb_disc_pct =0
							destroy lds_pur_price
							destroy lds_setup_dw							
							return 0														
						end if
					end if
				end if				
			else
				rdb_wholesales_price = 0
				rdb_disc_amt = 0
				rdb_disc_pct =0
				destroy lds_pur_price
				destroy lds_setup_dw
				
				return 0														
				
			end if
		end if
	end if
end if	
destroy lds_pur_price
destroy lds_setup_dw
return 0	

/*
	//-- lọc theo tự̀ ngày đến ngày , áp dụng tất cả, khổng theo số lượng --//
	if not lb_got_price and lds_pur_price.rowcount()> 0 then
		lds_pur_price.setsort( " f_date desc")
		lds_pur_price.sort( )		
		ls_filter = "if(isnull(from_qty),0,from_qty ) = 0 and if(isnull(to_qty),0,to_qty ) = 0  and if(isnull(f_date),0,if(f_date = date('01/01/1900'),0,1)) = 1 and if(isnull(t_date),0,if(t_date = date('01/01/1900'),0,1)) = 1  "
		lds_pur_price.setfilter( ls_filter)
		lds_pur_price.filter( )
		if lds_pur_price.rowcount( ) > 0 then
			ls_filter =  "staff_applied_type = 'all' and  object_applied_type = 'all ' and date('" + string(vd_trans_date) + "') between f_date and t_date"
			ll_find = lds_pur_price.find( ls_filter, 1, lds_pur_price.rowcount( ))
			if ll_find > 0 then
				rdb_wholesales_price = lds_pur_price.getitemnumber( ll_find_staff, 'wholesales_price')
				rdb_disc_amt = lds_pur_price.getitemnumber( ll_find_staff, 'discount_amount')
				rdb_disc_pct = lds_pur_price.getitemnumber( ll_find_staff, 'discount_pct')
				rdb_currency_id = lds_pur_price.getitemnumber( ll_find_staff, 'currency_id')
				return 1
			end if
		end if
	end if
	
	//-- loc theo từ ngày chưa biết ngày hết hạn , áp dụng tất cả, không theo số lượng  --//
	if not lb_got_price then		
		ls_filter = "if(isnull(from_qty),0,from_qty ) = 0 and if(isnull(to_qty),0,to_qty ) = 0  and if(isnull(f_date),0,if(f_date = date('01/01/1900'),0,1)) = 1 and if(isnull(t_date),0,if(t_date = date('01/01/1900'),0,1)) = 0  "
		lds_pur_price.setfilter( ls_filter)
		lds_pur_price.filter( )
		if lds_pur_price.rowcount( ) > 0 then
			ls_filter =  "staff_applied_type = 'all' and  object_applied_type = 'all ' and date('" + string(vd_trans_date) + "') between f_date and date('" +lc_datetime.f_getsysdate('dd/mm/yyyy' ) + "')"
			ll_find = lds_pur_price.find( ls_filter, 1, lds_pur_price.rowcount( ))
			if ll_find > 0 then
				rdb_wholesales_price = lds_pur_price.getitemnumber( ll_find_staff, 'wholesales_price')
				rdb_disc_amt = lds_pur_price.getitemnumber( ll_find_staff, 'discount_amount')
				rdb_disc_pct = lds_pur_price.getitemnumber( ll_find_staff, 'discount_pct')
				rdb_currency_id = lds_pur_price.getitemnumber( ll_find_staff, 'currency_id')
				return 1
			end if
		end if
	end if
	
	//-- loc theo từ ngày chưa biết ngày hết hạn , áp dụng cụ thể object, không theo số lượng  --//
	if not lb_got_price then
		ls_filter = "if(isnull(from_qty),0,from_qty ) = 0 and if(isnull(to_qty),0,to_qty ) = 0  and if(isnull(f_date),0,if(f_date = date('01/01/1900'),0,1)) = 1 and if(isnull(t_date),0,if(t_date = date('01/01/1900'),0,1)) = 0  "
		lds_pur_price.setfilter( ls_filter)
		lds_pur_price.filter( )
		if lds_pur_price.rowcount( ) > 0 then
			ls_filter =  "staff_applied_type = 'all' and date('" + string(vd_trans_date) + "') between f_date and date('" +lc_datetime.f_getsysdate('dd/mm/yyyy' ) + "')" 
			ls_filter_vendor = " and APPLIED_OBJECT_ID = " + string(vdb_object_id) + " and object_applied_type = "+"'"+"spec"+"'"
			ll_find = lds_pur_price.find( ls_filter + ls_filter_vendor, 1, lds_pur_price.rowcount( ))
			if ll_find > 0 then
				rdb_wholesales_price = lds_pur_price.getitemnumber( ll_find_staff, 'wholesales_price')
				rdb_disc_amt = lds_pur_price.getitemnumber( ll_find_staff, 'discount_amount')
				rdb_disc_pct = lds_pur_price.getitemnumber( ll_find_staff, 'discount_pct')
				rdb_currency_id = lds_pur_price.getitemnumber( ll_find_staff, 'currency_id')
				return 1
			end if
		end if
	end if
	//-- lọc theo từ số lượng chưa biết đến số lượng giới hạn, áp dụng tất cả, không theo ngày áp dụng --//
	if not lb_got_price then
		//-- chưa xử lý --//
	end if
	//-- lọc không theo giới hạn số lượng và ngày tháng và áp dụng cho tất cả--//
	if not lb_got_price then
		ls_filter = "if(isnull(from_qty),0,from_qty ) = 0 and if(isnull(to_qty),0,to_qty ) = 0 and if(isnull(f_date),0,if(f_date = date('01/01/1900'),0,1)) = 0 and if(isnull(t_date),0,if(t_date = date('01/01/1900'),0,1)) = 0"
		lds_pur_price.setfilter( ls_filter)
		lds_pur_price.filter( )
		if lds_pur_price.rowcount( ) > 0 then
			ll_find = lds_pur_price.find( "staff_applied_type = 'all' and  object_applied_type = 'all'", 1, lds_pur_price.rowcount( ))
			if ll_find > 0 then
				rdb_wholesales_price = lds_pur_price.getitemnumber( ll_find_staff, 'wholesales_price')
				rdb_disc_amt = lds_pur_price.getitemnumber( ll_find_staff, 'discount_amount')
				rdb_disc_pct = lds_pur_price.getitemnumber( ll_find_staff, 'discount_pct')
				rdb_currency_id = lds_pur_price.getitemnumber( ll_find_staff, 'currency_id')
				return 1
			end if
		end if
	end if
elseif upper(vs_price_type) = 'PURCHASE' then
	return this.f_get_item_price_disc_purchase( vdb_item_id, vdb_qty, rdb_currency_id, vs_dwo_price, vs_price_type, vd_trans_date, vdb_object_id, vdb_sales_person, rdb_wholesales_price, rdb_disc_amt, rdb_disc_pct)
end if

destroy lds_pur_price
destroy lds_setup_dw
return 0
*/
end function

public function integer f_get_scrap_pct (double vdb_item_id, double vdb_length, double vdb_width, double vdb_depth, double vdb_bom_id, double rdb_scr_pct);/*
Hàm tính toán tỷ lệ bỏ phí của nguyên liệu theo thể tích sủ dụng
----------------------------
vdb_item_id : ID của chi tiết/bán thành phẩm cần tính
vdb_length, vdb_width, vdb_depth: quy cách : dài rộng cao của chi tiết
vdb_bom_id: ID của công thức tạo chi tiết
*/

return 1
end function

public function integer f_update_hdr_itemchanged (string vs_edit_colname, string vs_editdata, string vs_upd_colname, long vl_line_row, t_dw_mpl vdw_line, t_dw_mpl vdw_currency, double vdb_prevous_exrate);		/*--------------------------------------------------------------------------///
		Mô tả chức năng:
		---------------------------------
								 
			#Thay đổi (currency):
					- Tính lại: price, act_price, PRICE_EX_TAX, ACT_PRICE_EX_TAX
								amount, amount_ex_tax, 
								  base_amount, base_amount_ex_tax, 
								  act_amount, act_amount_ex_tax, 
								  ACT_BASE_AMOUNT_EX_TAX ( không có act_base_amount : do ko cần ghi sổ )
			# thay đổi (ex_rate):
						- Tính lại:
								amount, amount_ex_tax, 
								  base_amount, base_amount_ex_tax, 
								  act_amount, act_amount_ex_tax, 
								  ACT_BASE_AMOUNT_EX_TAX ( không có act_base_amount : do ko cần ghi sổ )			

			@thay đổi (object_code :vendor / customer)
				- Tính lại: price, act_price, PRICE_EX_TAX, ACT_PRICE_EX_TAX
							 amount, amount_ex_tax, 
								  base_amount, base_amount_ex_tax, 
								  act_amount, act_amount_ex_tax, 
								  ACT_BASE_AMOUNT_EX_TAX ( không có act_base_amount : do ko cần ghi sổ )
--------------------------------------
vdw_tax: trường hợp không cập nhất thuế -> truyền NULL 
-----------------------------------------------------------------------------------------
Hàm này đươc gọi sau khi đã cập nhật giá từ bảng giá cho dw-line
================================================	*/	
double		ldb_price,  ldb_qty, ldb_ex_rate_old, ldb_ex_rate_cur, ldb_ex_rate_convert
double 		ldb_amount, ldb_base_amount, ldb_act_amount, ldb_amount_ex_tax, ldb_base_amount_ex_tax
double		ldb_price_ex_tax, ldb_item_id, ldb_unit_id, ldb_round_id, ldb_cur_id
double		ldb_disc_price, ldb_discount_pct, ldb_disc_price_ex_tax, ldb_discount_amt
double		ldb_object_ref_id, ldb_round_id_price, ldb_round_id_amt
double		ldb_round_id_base_amt, ldb_base_cur, ldb_act_base_amount
int				li_colCnt, li_idx, li_row
string			lsa_colname[], ls_filter_org, ls_filter, ls_base_curcode,ls_base_curname, ls_disc_amt, ls_disc_pct
boolean		lb_upd_dw_cur

c_string				lc_string
c_unit_instance		lc_unit

//-- kiểm tra tên cột discount ở line --//
//if vdw_line.dataobject = 'd_qt_line_grid' then
//	ls_disc_amt = 'discount'
//	ls_disc_pct=  'discount_pct'
//elseif vdw_line.dataobject = 'd_so_line_grid' or vdw_line.dataobject = 'd_sal_invoice_line_grid' or vdw_line.dataobject = 'd_payment_line_grid'then
	ls_disc_amt = 'disc_amt'
	ls_disc_pct=  'disc_pct'
//end if

//-- tính toán lại giá trị các cột liên quan--//
if vs_edit_colname = 'uom_code' then //-- currency --//
	ldb_ex_rate_cur = vdw_currency.getitemnumber( vdw_currency.getrow(), 'exchange_rate' ,primary!, false)	
	if vdb_prevous_exrate = 0 then vdb_prevous_exrate = vdw_currency.getitemnumber( vdw_currency.getrow(), 'exchange_rate' ,primary!, true)	
	if isnull(vdb_prevous_exrate) then vdb_prevous_exrate = 0
	if ldb_ex_rate_cur > 0 then	ldb_ex_rate_convert = vdb_prevous_exrate/ldb_ex_rate_cur

	
	ldb_cur_id = vdw_currency.getitemnumber( vdw_currency.getrow(), 'CURRENCY_ID' )
	 //-- chuẩn bị cho làm tròn  --//
	lc_unit.f_get_base_cur(ldb_base_cur,  ls_base_curcode,ls_base_curname)
	if ldb_base_cur > 0 then ldb_round_id_base_amt =  lc_unit.f_get_round_id( ldb_base_cur, 0, 'amount')
	if ldb_cur_id > 0 then ldb_round_id_amt = lc_unit.f_get_round_id( ldb_cur_id, 0, 'amount')	
	
	li_colCnt = lc_string.f_stringtoarray( vs_upd_colname, ';', lsa_colname[])
	FOR  li_row = 1 to vdw_line.rowcount()
		ldb_amount = vdw_line.getitemnumber(li_row, 'amount')
		if ldb_ex_rate_convert <> 0 then
			ldb_amount = ldb_amount * ldb_ex_rate_convert
			if ldb_round_id_amt > 0 then  ldb_amount = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_amount)
		end if
		//-- kiểm tra disc --//	
		ldb_discount_pct =  vdw_line.getitemnumber(vl_line_row, ls_disc_pct)
		if isnull(ldb_discount_pct) then ldb_discount_pct = 0
		ldb_discount_amt = vdw_line.getitemnumber(vl_line_row, ls_disc_amt)
		if isnull(ldb_discount_amt) then ldb_discount_amt = 0
		//-- tính amount liên quan--//
		if 	ldb_discount_pct > 0 and ldb_discount_amt = 0 then 
			ldb_discount_amt = ldb_amount*(1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))			
			if ldb_round_id_amt > 0 then  ldb_discount_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_discount_amt)
		end if		
		ldb_amount = ldb_amount - ldb_discount_amt
		ldb_base_amount = ldb_amount * ldb_ex_rate_cur 
		 			 			
		//-- Cập nhật lại line --//
		FOR li_idx = 1 to li_colCnt
			if lsa_colname[li_idx] = 'amount' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_amount)
			elseif lsa_colname[li_idx] = 'base_amount' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_base_amount)
			elseif lsa_colname[li_idx] = 'disc_pct' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_discount_pct)
			elseif lsa_colname[li_idx] = 'disc_amt' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_discount_amt)
			end if						
		NEXT		
	NEXT	
elseif vs_edit_colname = 'exchange_rate' then
	ldb_ex_rate_cur = double(vs_editdata)
	
	ldb_cur_id = vdw_currency.getitemnumber( vdw_currency.getrow(), 'CURRENCY_ID' )
	 //-- chuẩn bị cho làm tròn  --//
	lc_unit.f_get_base_cur(ldb_base_cur,  ls_base_curcode,ls_base_curname)
	if ldb_base_cur > 0 then ldb_round_id_base_amt =  lc_unit.f_get_round_id( ldb_base_cur, 0, 'amount')
	
	li_colCnt = lc_string.f_stringtoarray( vs_upd_colname, ';', lsa_colname[])
	FOR  li_row = 1 to vdw_line.rowcount()				
		//-- kiểm tra disc --//	
		ldb_discount_pct =  vdw_line.getitemnumber(vl_line_row, ls_disc_pct)
		if isnull(ldb_discount_pct) then ldb_discount_pct = 0
		ldb_discount_amt = vdw_line.getitemnumber(vl_line_row, ls_disc_amt)
		if isnull(ldb_discount_amt) then ldb_discount_amt = 0
		//-- tính amount liên quan--//
		if 	ldb_discount_pct > 0 and ldb_discount_amt = 0 then 
			ldb_discount_amt = ldb_amount *(1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))			
			if ldb_round_id_amt > 0 then  ldb_discount_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_discount_amt)
		end if		
		ldb_amount = vdw_line.getitemnumber(li_row, 'amount')
		ldb_amount = ldb_amount - ldb_discount_amt
		ldb_base_amount = ldb_amount * ldb_ex_rate_cur 
		 			 			
		//-- Cập nhật lại line --//
		FOR li_idx = 1 to li_colCnt
			if lsa_colname[li_idx] = 'amount' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_amount)
			elseif lsa_colname[li_idx] = 'base_amount' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_base_amount)
			elseif lsa_colname[li_idx] = 'disc_pct' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_discount_pct)
			elseif lsa_colname[li_idx] = 'disc_amt' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_discount_amt)
			end if						
		NEXT		
	NEXT		

elseif  pos(vs_edit_colname, 'object_code') > 0 then
	//-- tương đương với đổi price --//
	ldb_ex_rate_cur = vdw_currency.getitemnumber( vdw_currency.getrow(), 'exchange_rate' ,primary!, false)
	ldb_cur_id = vdw_currency.getitemnumber( vdw_currency.getrow(), 'CURRENCY_ID' )
	 //-- chuẩn bị cho làm tròn  --//
	lc_unit.f_get_base_cur(ldb_base_cur,  ls_base_curcode,ls_base_curname)
	if ldb_base_cur > 0 then ldb_round_id_base_amt =  lc_unit.f_get_round_id( ldb_base_cur, 0, 'amount')
	if ldb_cur_id > 0 then ldb_round_id_amt = lc_unit.f_get_round_id( ldb_cur_id, 0, 'amount')	
	
	li_colCnt = lc_string.f_stringtoarray( vs_upd_colname, ';', lsa_colname[])
	FOR  li_row = 1 to vdw_line.rowcount()
		//-- kiểm tra disc --//	
		ldb_discount_pct =  vdw_line.getitemnumber(vl_line_row, ls_disc_pct)
		if isnull(ldb_discount_pct) then ldb_discount_pct = 0
		ldb_discount_amt = vdw_line.getitemnumber(vl_line_row, ls_disc_amt)
		if isnull(ldb_discount_amt) then ldb_discount_amt = 0
		//-- tính amount liên quan--//
		if 	ldb_discount_pct > 0 and ldb_discount_amt = 0 then 
			ldb_discount_amt = ldb_amount *(1 - ldb_discount_pct/100) / (1 + (ldb_discount_pct/100))			
			if ldb_round_id_amt > 0 then  ldb_discount_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_discount_amt)
		end if		
		ldb_amount = vdw_line.getitemnumber(li_row, 'amount')
		ldb_amount = ldb_amount - ldb_discount_amt
		ldb_base_amount = ldb_amount * ldb_ex_rate_cur 
		 			 			
		//-- Cập nhật lại line --//
		FOR li_idx = 1 to li_colCnt
			if lsa_colname[li_idx] = 'amount' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_amount)
			elseif lsa_colname[li_idx] = 'base_amount' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_base_amount)
			elseif lsa_colname[li_idx] = 'disc_pct' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_discount_pct)
			elseif lsa_colname[li_idx] = 'disc_amt' then
				vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_discount_amt)
			end if						
		NEXT		
	NEXT		
end if

return 1
end function

public function integer f_update_tax_appeon (double vdb_curr_id, double vdb_exrate, t_dw_mpl rdw_tax_line, double vdb_object_ref_id, double vdb_tax_pct, double vdb_amount_ex_tax, double vdb_base_amount_ex_tax, double vdb_tax_correction);double				ldb_base_round_id,ldb_round_id, ldb_tax_id
double 				ldb_amount_ex_tax, ldb_base_amount_ex_Tax, ldb_tmp_amt, ldb_tax_include_amt, ldb_trans_tax_include_amt
int						li_tax_pct, li_row, li_uprow
string					ls_filter,ls_filter_org,  ls_uprow_yn, ls_include_yn, ls_tax_type, ls_curr_code
c_unit_instance		lc_unit


ldb_round_id = lc_unit.f_get_round_id( vdb_curr_id, 0, 'amount')
ldb_base_round_id = lc_unit.f_get_round_id( 0, 0, 'bc')

//-- trường hợp không có cập nhật thuế --//
if isnull(rdw_tax_line) or not isvalid(rdw_tax_line) then return 0


//-- tính record thuế hiện tại --//
ls_filter_org = rdw_tax_line.describe("DataWindow.Table.Filter")
ls_filter = "object_ref_id="+string(vdb_object_ref_id)
rdw_tax_line.setfilter(ls_filter)
rdw_tax_line.filter()
if rdw_tax_line.rowcount() = 0 then return 0  //-- không có thuế --//

FOR li_row = 1 to rdw_tax_line.rowcount()
	ls_tax_type =  rdw_tax_line.getitemstring(li_row,'tax_type')
	ldb_tax_id =  rdw_tax_line.getitemnumber(li_row,'tax_id')
	ls_uprow_yn =  rdw_tax_line.getitemstring(li_row,'UPROW_YN')
	if isnull(ls_uprow_yn) then ls_uprow_yn = 'N'	
	ls_include_yn =  rdw_tax_line.getitemstring(li_row,'INCLUDE_YN')
	if isnull(ls_include_yn) then ls_include_yn = 'N'
	
	if ls_tax_type = 'VAT' then
		if vdb_tax_pct > 0 then
			li_tax_pct = vdb_tax_pct
			rdw_tax_line.setitem(li_row,'tax_pct',li_tax_pct)
		else
			li_tax_pct = rdw_tax_line.getitemnumber(li_row,'tax_pct')
		end if
	else
		li_tax_pct = rdw_tax_line.getitemnumber(li_row,'tax_pct')
	end if
	
	rdw_tax_line.setitem(li_row,'TRANS_CURRENCY', vdb_curr_id)
	ls_curr_code = this.f_get_uom_code(vdb_curr_id )
	rdw_tax_line.setitem(li_row,'uom_code', ls_curr_code)
	rdw_tax_line.setitem(li_row,'EXCHANGE_RATE', vdb_exrate)
			
	if ls_uprow_yn = 'Y' then
		li_uprow = li_row
		continue
	end if		
			
	if ldb_round_id > 0 then ldb_tmp_amt = lc_unit.f_round( rdw_tax_line, ldb_round_id, vdb_amount_ex_tax*li_tax_pct/100)
	rdw_tax_line.setitem(li_row,'TRANS_TAX_AMOUNT', ldb_tmp_amt)	
	if ls_include_yn = 'Y' then
		ldb_trans_tax_include_amt += ldb_tmp_amt
	end if	
	
	if ldb_base_round_id > 0 then ldb_tmp_amt = lc_unit.f_round( rdw_tax_line, ldb_base_round_id,  vdb_base_amount_ex_Tax*li_tax_pct/100)
	rdw_tax_line.setitem(li_row,'TAX_AMT', ldb_tmp_amt)
	rdw_tax_line.setitem(li_row,'TAX_CORRECTION',  ldb_tmp_amt)		
	if ls_include_yn = 'Y' then
		ldb_tax_include_amt += ldb_tmp_amt
	end if

NEXT

if li_uprow > 0 then
	if ldb_round_id > 0 then ldb_tmp_amt = lc_unit.f_round( rdw_tax_line, ldb_round_id, (vdb_amount_ex_tax+ldb_trans_tax_include_amt)*li_tax_pct/100)
	rdw_tax_line.setitem(li_uprow,'TRANS_TAX_AMOUNT', ldb_tmp_amt)			
	if ldb_base_round_id > 0 then ldb_tmp_amt = lc_unit.f_round( rdw_tax_line, ldb_base_round_id, (vdb_base_amount_ex_Tax + ldb_tax_include_amt)*li_tax_pct/100)
	rdw_tax_line.setitem(li_uprow,'TAX_AMT', ldb_tmp_amt)
	if vdb_tax_correction = 0 or isnull(vdb_tax_correction) then
		rdw_tax_line.setitem(li_uprow,'TAX_CORRECTION',  ldb_tmp_amt)		
	else
		rdw_tax_line.setitem(li_uprow,'TAX_CORRECTION',  vdb_tax_correction)		
	end if
end if

if ls_filter_org <> '?' then
	rdw_tax_line.setfilter(ls_filter_org)
	rdw_tax_line.filter()
end if

return 1
end function

public function integer f_get_ds_material (double vdb_product_id, ref t_ds_db rds_material);/*
Chức năng: tính tỷ lệ sử dụng theo diện tích, thể tích (vs_base): diện tích thành phẩm/ diện thích vật liệu 
------------------------------------------------------------------------------------------------------------------------
vs_base: 'area', 'volumn'
vdb_product_spec[1] : chiếu dài sp
vdb_product_spec[2] : chiếu rộng sp
vdb_product_spec[3] : chiếu cáo sp

vdb_mat_spec[1] : chiếu dài vật liệu
vdb_mat_spec[2] : chiếu rộng vật liệu
vdb_mat_spec[3] : chiếu cáo vật liệu
*/
//if lower(vs_base) = 'area' then
//	if isnull( vdb_product_spec[1]) or  vdb_product_spec[1] = 0 then return 0
//	if isnull( vdb_product_spec[2]) or  vdb_product_spec[2] = 0 then return 0
//	if isnull( vdb_product_qty) or  vdb_product_qty = 0 then return 0
////	rdb_percent = round((vdb_mat_spec[1]*vdb_mat_spec[2]*vdb_mat_qty) / (vdb_product_spec[1]*vdb_product_spec[2]*vdb_product_qty) * 100, 2)
//	return 1
//elseif  lower(vs_base) = 'volumn' then
//	if isnull( vdb_product_spec[1]) or  vdb_product_spec[1] = 0 then return 0
//	if isnull( vdb_product_spec[2]) or  vdb_product_spec[2] = 0 then return 0
//	if isnull( vdb_product_spec[3]) or  vdb_product_spec[3] = 0 then return 0
//	if isnull( vdb_product_qty) or  vdb_product_qty = 0 then return 0
////	rdb_percent = round((vdb_mat_spec[1]*vdb_mat_spec[2]*vdb_mat_spec[3]*vdb_mat_qty) / (vdb_product_spec[1]*vdb_product_spec[2]*vdb_product_spec[3]*vdb_product_qty) * 100, 2)
//	return 1	
//end if

return 0
end function

public function integer f_get_bom_material (double vdb_bom_id, double vdb_route_id, ref t_ds_db rds_material);
string				ls_where 
any				laa_data[]
int					li_rtn
double			ldb_bom_line_id

select BOM_LINE.ID into :ldb_bom_line_id
from BOM_LINE
join ITEM on ITEM.ID = BOM_LINE.object_ref_id
WHERE item.object_ref_id = :vdb_bom_id
and (BOM_LINE.route_id = :vdb_route_id or :vdb_route_id = 0)
using sqlca;

if sqlca.sqlcode = 0 then
	ls_where = ' BOM_INOUT_PUT.object_ref_id = '+string(ldb_bom_line_id)
	ls_where += " AND BOM_INOUT_PUT.item_type <> ~~'LABOUR~~' "
//	laa_data[1] = ldb_bom_line_id
	rds_material.f_add_originalwhere( ls_where, ' AND ')
	li_rtn = rds_material.retrieve( )
	return li_rtn
elseif sqlca.sqlcode = 100 then		
	gf_messagebox('m.b_obj_instantiate.f_get_bom_material.01','Thông báo','Không tìm thấy quy trình SX (Route) của BOM', 'stop','ok',1)
	return 0
else
	gf_messagebox('m.b_obj_instantiate.f_get_bom_material.01','Thông báo',sqlca.sqlerrtext , 'stop','ok',1)
	return -1
end if



end function

public function integer f_get_bom_material (double vdb_bom_line_id, ref t_ds_db rds_material);
t_ds_db			lds_material
any				laa_data[]
int					li_rtn


lds_material = create t_ds_db
lds_material.dataobject = 'd_bom_input_grid'
lds_material.f_settransobject( sqlca)
laa_data[1] = vdb_bom_line_id
lds_material.f_add_where( 'object_ref_id', laa_data[])
li_rtn = lds_material.retrieve( )
rds_material = lds_material
return li_rtn
end function

public function integer f_update_line_itemchanged (string vs_edit_colname, string vs_editdata, string vs_upd_colname, long vl_line_row, t_dw_mpl vdw_line, t_dw_mpl vdw_currency, double vdb_previous_exrate, double vdb_previous_uom);		/*--------------------------------------------------------------------------///
		Mô tả chức năng:
		---------------------------------
		//$Thay đổi (qty)
					- copy : act_qty (thay đổi act thì không copy ngược lại)
					- tính lại: amount, amount_ex_tax, price_ex_tax, act_price_ex_tax  
							     base_amount, base_amount_ex_tax, 
							     act_amount, act_amount_ex_tax, 
							     ACT_BASE_AMOUNT_EX_TAX ( không có act_base_amount : do ko cần ghi sổ )
		   $ Thay đổi (act_qty)
					- Tính lại: act_amount, act_amount_ex_tax, ACT_BASE_AMOUNT_EX_TAX ( không có act_base_amount : do ko cần ghi sổ )
		   $ Thay đổi ( price)
					- copy :act_price (thay đổi act thì không copy ngược lại)
					- Tính lại : amount, amount_ex_tax, 
								  base_amount, base_amount_ex_tax, 
								  act_amount, act_amount_ex_tax, 
								  ACT_BASE_AMOUNT_EX_TAX ( không có act_base_amount : do ko cần ghi sổ )
								  PRICE_EX_TAX, ACT_PRICE_EX_TAX
			$ Thay đổi (act_price)
					-Tính lại: act_amount, act_amount_ex_tax, ACT_BASE_AMOUNT_EX_TAX ( không có act_base_amount : do ko cần ghi sổ )
					- Tính lại : act_price_ex_tax
			$ Thay đổi (amount)
					- Copy : act_amount (thay đổi act thì không copy ngược lại)
					Tính lại: price, act_price, PRICE_EX_TAX, ACT_PRICE_EX_TAX
								amount_ex_tax,
								base_amount, base_amount_ex_tax, 
								act_amount_ex_tax, ACT_BASE_AMOUNT_EX_TAX ( không có act_base_amount : do ko cần ghi sổ )								
			$ Thay đổi (act_amount)
					Tính lại:  act_price,ACT_PRICE_EX_TAX
								act_amount_ex_tax, ACT_BASE_AMOUNT_EX_TAX ( không có act_base_amount : do ko cần ghi sổ )		
			@ Thay đổi (item_code, spec_code)
					- Cập nhật lại: giá từ item_price : price
					- copy :act_price (thay đổi act thì không copy ngược lại)
					- Tính lại : amount, amount_ex_tax, 
								  base_amount, base_amount_ex_tax, 
								  act_amount, act_amount_ex_tax, 
								  ACT_BASE_AMOUNT_EX_TAX ( không có act_base_amount : do ko cần ghi sổ )
								  PRICE_EX_TAX, ACT_PRICE_EX_TAX	
			@ thay đổi đơn vị của item
					- tính lại : qty, act_qty (quy đổi số lượng)
								 price, act_price, price_ex_tax, act_pric_ex_tax  (quy đổi giá)
								 amount, amount_ex_tax, 
								  base_amount, base_amount_ex_tax, 
								  act_amount, act_amount_ex_tax, 
								  ACT_BASE_AMOUNT_EX_TAX ( không có act_base_amount : do ko cần ghi sổ )								 
			@thay đổi (disc_amt, pct)
				- Tính lại: 
							 amount, amount_ex_tax, 
								  base_amount, base_amount_ex_tax, 
								  act_amount, act_amount_ex_tax, 
								  ACT_BASE_AMOUNT_EX_TAX ( không có act_base_amount : do ko cần ghi sổ )
	
		    @ thay đổi (markup_amt, pct)
			 		- Tính lại: price, PRICE_EX_TAX
					 			amount, amount_ex_tax, 
					 			base_amount, base_amount_ex_tax, 
-----------------------------------------------------------------------------------------
Hàm này đươc gọi sau khi đã cập nhật giá từ bảng giá cho dw-line
================================================	*/	
double		ldb_price,  ldb_qty, ldb_ex_rate_old, ldb_ex_rate_cur, ldb_ex_rate_convert
double 		ldb_amount, ldb_base_amount, ldb_amount_ex_tax, ldb_base_amount_ex_tax, ldb_act_amount_ex_tax
double		ldb_price_ex_tax, ldb_item_id, ldb_unit_id, ldb_round_id, ldb_cur_id
double		ldb_disc_price,ldb_disc_act_price, ldb_discount_pct, ldb_disc_price_ex_tax, ldb_disc_act_price_ex_tax, ldb_discount_amt
double		ldb_object_ref_id, ldb_round_id_price, ldb_round_id_amt, ldb_act_base_amount
double		ldb_round_id_base_amt, ldb_base_cur, ldb_stock_unit_id, ldba_data_conver[]
int				li_colCnt, li_idx, li_row
string			lsa_colname[], ls_filter_org, ls_filter, ls_base_curcode,ls_base_curname, ls_disc_amt, ls_disc_pct, ls_object_colname

c_string				lc_string
c_unit_instance		lc_unit

//-- kiểm tra tên cột discount ở line --//
//if vdw_line.dataobject = 'd_qt_line_grid' then
//	ls_disc_amt = 'discount'
//	ls_disc_pct=  'discount_pct'
//	ls_object_colname = 'item_id'
//elseif vdw_line.dataobject = 'd_payment_line_grid' then
	ls_disc_amt = 'disc_amt'
	ls_disc_pct=  'disc_pct'
	ls_object_colname = 'object_id'
//end if

//-- tính toán lại giá trị các cột liên quan--//
	
if vs_edit_colname = 'amount' then
	ldb_amount = double(vs_editdata)
	
	ldb_cur_id = vdw_currency.getitemnumber( vdw_currency.getrow(), 'CURRENCY_ID' )
	ldb_ex_rate_cur = vdw_currency.getitemnumber(vdw_currency.getrow(), 'exchange_rate')	

	 //-- chuẩn bị cho làm tròn  --//
	lc_unit.f_get_base_cur(ldb_base_cur,  ls_base_curcode,ls_base_curname)
	if ldb_base_cur > 0 then ldb_round_id_base_amt =  lc_unit.f_get_round_id( ldb_base_cur, 0, 'amount')
	if ldb_cur_id > 0 then ldb_round_id_amt = lc_unit.f_get_round_id( ldb_cur_id, 0, 'amount')	
		
	//-- kiểm tra disc --//	
//	ldb_discount_pct =  vdw_line.getitemnumber(vl_line_row, ls_disc_pct)
//	if isnull(ldb_discount_pct) then ldb_discount_pct = 0
//	ldb_discount_amt = vdw_line.getitemnumber(vl_line_row, ls_disc_amt)
//	if isnull(ldb_discount_amt) then ldb_discount_amt = 0
	//-- tính amount liên quan--//
//	if 	ldb_discount_pct > 0 and ldb_discount_amt = 0 then 
//		ldb_discount_amt = ldb_amount * ldb_discount_pct/100 / (1 + (ldb_discount_pct/100))			
//		if ldb_round_id_amt > 0 then  ldb_discount_amt = lc_unit.f_round( vdw_line, ldb_round_id_amt, ldb_discount_amt)
//	end if			
	
	ldb_base_amount = ldb_amount * ldb_ex_rate_cur 
	IF ldb_round_id_base_amt> 0 THEN ldb_base_amount = lc_unit.f_round( vdw_line, ldb_round_id_base_amt, ldb_base_amount)
	
	
end if

//-- Cập nhật lại line --//
li_colCnt = lc_string.f_stringtoarray( vs_upd_colname, ';', lsa_colname[])
FOR li_idx = 1 to li_colCnt
	if lsa_colname[li_idx] = 'amount' then
		vdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_amount)
	elseif lsa_colname[li_idx] = 'base_amount' then
		vdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_base_amount)
	end if						
NEXT


return 1
end function

public function integer f_calculate_material (double vdb_ref_id, double vdb_bom_id, double vdb_plan_qty, double vdb_act_qty, ref t_ds_db rds_material, string vs_upd_type);double					ldb_bomline_id, ldb_mat_id, ldb_mat_qty, ldb_fg_qty, ldb_mat_uom, ldb_mat_round, ldb_ref_id
double					ldb_mat_wh, ldb_spec_id, ldb_formular_qty_plan, ldb_formular_qty_act
any						laa_args[]
long						ll_row, ll_cnt, ll_row_found
string						ls_code, ls_ref_table, ls_itemtype
boolean					lb_new
t_ds_db					lds_bom
b_obj_instantiate		lbo_inst
c_datetime				ldt_inst
c_unit_instance			lc_unit_ins


ls_ref_table = upper(rds_material.describe("DataWindow.Table.UpdateTable"))
rds_material.setfilter("object_ref_id = "+string(vdb_ref_id))
rds_material.filter()

lds_bom = create t_ds_db
lds_bom.dataobject = 'd_bom_input_grid'
lds_bom.f_settransobject( sqlca)

if vs_upd_type = 'actual' then
	ldb_bomline_id = lbo_inst.f_get_bom_line(vdb_bom_id , vdb_act_qty, date(ldt_inst.f_getsysdate( )) )
else
	ldb_bomline_id = lbo_inst.f_get_bom_line(vdb_bom_id , vdb_plan_qty, date(ldt_inst.f_getsysdate( )) )
end if
laa_args[1] = ldb_bomline_id
lds_bom.f_add_where( 'object_ref_id', laa_args[])


ll_cnt = lds_bom.retrieve( ) 
FOR ll_row = 1 to ll_cnt
	ldb_mat_id = lds_bom.getitemnumber( ll_row, 'ITEM_ID')
	if ldb_mat_id =0  or isnull(ldb_mat_id) then continue 
	ldb_mat_wh = lds_bom.getitemnumber( ll_row, 'MAT_WH')
	ldb_spec_id = lds_bom.getitemnumber( ll_row, 'spec_id')
	ldb_mat_qty = lds_bom.getitemnumber( ll_row, 'MAT_QTY')
	if ldb_mat_qty = 0 or isnull(ldb_mat_qty) then
		ls_code = lbo_inst.f_get_code(ldb_mat_id )
		gf_messagebox('m.c_prod_orders.f_update_material.01','Thông báo','Nguyên liệu sau trong công thức có số lượng = 0:@'+ls_code,'information','ok',1)
		continue
	end if
	ldb_fg_qty = lds_bom.getitemnumber( ll_row, 'FG_QTY')
	if ldb_fg_qty = 0 or isnull(ldb_fg_qty) then
		ls_code = lbo_inst.f_get_code(ldb_mat_id )
		gf_messagebox('m.c_prod_orders.f_update_material.02','Thông báo','Nguyên liệu sau trong công thức có số lượng sản phẩm = 0:@'+ls_code,'information','ok',1)
		continue
	end if	
	ldb_mat_uom = lds_bom.getitemnumber( ll_row, 'MAT_UOM')
	if ldb_mat_uom = 0 or isnull(ldb_mat_uom) then
		ls_code = lbo_inst.f_get_code(ldb_mat_id )
		gf_messagebox('m.c_prod_orders.f_update_material.03','Thông báo','Nguyên liệu sau trong công thức không có đơn vị tính:@'+ls_code,'information','ok',1)
		continue
	end if		
	ldb_mat_round = lc_unit_ins.f_get_round_id(ldb_mat_uom, ldb_mat_id, 'item')
	if ldb_mat_round = -1 then return -1
	
	ls_itemtype = lds_bom.getitemstring( ll_row, 'ITEM_TYPE')	
	//-- kiểm tra item BOM --//
	if ls_itemtype = 'BOM' then
		ldb_formular_qty_plan = lc_unit_ins.f_round( sqlca, ldb_mat_round,vdb_plan_qty*ldb_mat_qty/ldb_fg_qty )
		ldb_formular_qty_act = lc_unit_ins.f_round( sqlca, ldb_mat_round,vdb_act_qty*ldb_mat_qty/ldb_fg_qty )
//		this.f_update_formula( vdb_ref_id, ldb_mat_id, ldb_formular_qty_plan, ldb_formular_qty_act , rds_material, vs_upd_type)
		continue 
	end if	
	
	lb_new = false
	if vs_upd_type = 'actual' then
		ll_row_found = rds_material.find(" OBJECT_REF_ID="+string(vdb_ref_id) +" AND  ITEM_ID = "+string(ldb_mat_id) ,1 , rds_material.rowcount() )
		if ll_row_found = 0 then
			lb_new= true
			ll_row_found = rds_material.insertrow(0)
		end if
	else
		ll_row_found = rds_material.insertrow(0)
		lb_new= true
	end if
	if lb_new then
		rds_material.setitem(ll_row_found, 'ITEM_ID', ldb_mat_id )	
		rds_material.setitem(ll_row_found, 'ACT_QTY', lc_unit_ins.f_round( sqlca, ldb_mat_round,vdb_act_qty*ldb_mat_qty/ldb_fg_qty ))
		rds_material.setitem(ll_row_found, 'BOM_QTY', lc_unit_ins.f_round( sqlca, ldb_mat_round,vdb_plan_qty*ldb_mat_qty/ldb_fg_qty ) )
		rds_material.setitem(ll_row_found, 'UOM_ID', ldb_mat_uom)
		rds_material.setitem(ll_row_found, 'OBJECT_REF_ID', vdb_ref_id)
		rds_material.setitem(ll_row_found, 'OBJECT_REF_TABLE', 'PRODUCTION_LINE')
		rds_material.setitem(ll_row_found, 'INPUT_OUTPUT', 'I')
		rds_material.setitem(ll_row_found, 'ID', this.f_create_id( ) )
		rds_material.setitem(ll_row_found, 'COMPANY_ID', gi_user_comp_id )
		rds_material.setitem(ll_row_found, 'BRANCH_ID', gdb_branch )
		rds_material.setitem(ll_row_found, 'LINE_NO', ll_row_found )
		rds_material.setitem(ll_row_found, 'WH_ID', ldb_mat_wh )
		rds_material.setitem(ll_row_found, 'spec_id', ldb_spec_id )
		rds_material.setitem(ll_row_found, 'bom_ref_id', vdb_bom_id )
	else
		rds_material.setitem(ll_row_found, 'ACT_QTY', lc_unit_ins.f_round( sqlca, ldb_mat_round,vdb_act_qty*ldb_mat_qty/ldb_fg_qty ))
	end if
NEXT

rds_material.setfilter('')
rds_material.filter()

return 1
end function

public function integer f_get_valueset (double vdb_up_id, ref double radb_valueset_id[], ref string ras_valueset_code[], ref string ras_valueset_name[], t_transaction vt_transaction);t_ds_db	lds_valueset
any		laa_data[]
int			li_ret,li_idx

if isnull(vdb_up_id) or vdb_up_id = 0 then return 0
lds_valueset = create t_ds_db
lds_valueset.dataobject = 'd_valueset_entry_grid'
lds_valueset.f_settransobject(vt_transaction )
laa_data[1] = vdb_up_id
lds_valueset.f_add_where( 'UP_ID', laa_data)
lds_valueset.setsort( 'line_no asc')
lds_valueset.sort( )
li_ret = lds_valueset.retrieve( )
for li_idx = 1 to li_ret
	radb_valueset_id[upperbound(radb_valueset_id) + 1] = lds_valueset.getitemnumber( li_idx, 'ID')
	ras_valueset_code[upperbound(ras_valueset_code) + 1] = lds_valueset.getitemstring( li_idx, 'code')
	ras_valueset_name[upperbound(ras_valueset_name) + 1] = lds_valueset.getitemstring( li_idx, 'name')
next
return upperbound(radb_valueset_id)
end function

public function double f_get_object_branch_id (double vdb_object_id);
double	ldb_id

select branch_Id into :ldb_id from object where id = :vdb_object_id using sqlca;

if sqlca.sqlcode = 0 then
	return ldb_id
else
	gf_messagebox('m.b_obj_instantiate.f_get_object_branch_id.01','Thông báo','Không tìm thấy chi nhánh đối tượng có ID:@'+string(vdb_object_id),'exclamation','ok',1) 		
	setnull(ldb_id)
	return ldb_id
end if
end function

public function integer f_send_2_approve (t_dw_mpl vdw_focus, s_object_display vc_obj_handling, s_w_multi vw_multi, long ll_find);
int								li_idx,li_row,li_idx1,li_upperbound,li_rtn
any							laa_data[]
long							ll_rtn
string							ls_identify_code,ls_type_role_user_id,ls_updatetable,ls_role_user_id,las_role_user_id[]
double						ldb_identify_id,ldb_business_id,ldb_role_user_id,ldb_doc_id
b_rule						lc_rule
c_string						lc_string
t_ds_db						lds_appr_level,lds_appr_profile
t_dw_mpl					ldw_document
t_transaction 				lt_transaction
c_appr_profile				lc_appr
c_identification_initial		lc_iden_ini

//if gi_userid = 0 then return
vw_multi.f_get_transaction( lt_transaction)
//ldw_document = vw_multi.f_get_dwmain( )
//if pos(ldw_document.dataobject,'d_document') = 0 then ldw_document = vdw_focus
ldw_document = vdw_focus
lc_appr = create c_appr_profile
ldb_doc_id = ldw_document.getitemnumber( ll_find , 'ID')
ls_updatetable = ldw_document.describe( "DataWindow.Table.UpdateTable")
lds_appr_profile = create t_ds_db
lds_appr_profile.dataobject = 'ds_appr_profile_grid'
lds_appr_profile.f_settransobject( lt_transaction)
lds_appr_level = create t_ds_db
lds_appr_level.dataobject = 'ds_appr_level'
lds_appr_level.f_settransobject(lt_transaction)
//if pos(ldw_document.dataobject,'d_document') > 0 then
	ls_identify_code = vc_obj_handling.classname( ) +'.'+ 'd_action_edit' +'.'+lc_string.f_globalreplace('e_approve', 'e_', 'b_')
	ldb_identify_id = lc_iden_ini.f_get_id( ls_identify_code)
	if ldb_identify_id > 0 then
		ldb_business_id = lc_rule.f_get_business_rule_id( ldb_identify_id,vw_multi)
		if ldb_business_id > 0 then
			ldb_role_user_id = lc_rule.f_get_role_user_id( ldb_business_id)
			if ldb_role_user_id > 0 then
				ls_type_role_user_id = lc_rule.f_get_type_role_user_id( ldb_role_user_id)
				if not isnull(ls_type_role_user_id) then
					if ls_type_role_user_id = 'appr' then
						//--Duyệt nhiều cấp--//
						laa_data[1] = ldb_role_user_id
						lds_appr_level.f_add_where( 'object_ref_id',laa_data[] )
						li_row = lds_appr_level.retrieve( )
						if li_row = -1 then return -1
						ll_rtn = lc_appr.f_insert_appr_profile(ldb_doc_id,ls_updatetable,lds_appr_profile, lds_appr_level)
					else
						ll_rtn = lc_appr.f_insert_appr_profile( ldb_doc_id, ls_updatetable,ldb_role_user_id, 1,lds_appr_profile)
					end if
					if ll_rtn = 1 then 
						ll_rtn = lds_appr_profile.update(true,false )
						if ll_rtn = 1 then
							lds_appr_profile.resetupdate( )
							ldw_document.setitem( ll_find , 'status', 'req_approve')
							if ldw_document.describe("status_name.x") <> '!' then ldw_document.setitem( ll_find, 'status_name', 'Yêu cầu duyệt')
						else 
							messagebox('Lỗi','b_obj_instantiate.f_send_2_approved(line:57)')
						end if
					end if
				else
					ll_rtn = -1
				end if
			else
				ll_rtn = -1
			end if
		else
			ll_rtn = -1
		end if
	else
		ll_rtn = -1
	end if
	if ll_rtn = 1 then
		ll_rtn = ldw_document.update(true,false )	
		if ll_rtn = 1 then
			//--cảnh báo hàng đã đặt bán hết nếu có--//
			ll_rtn = vc_obj_handling.event e_window_e_send_2_approve( )
			if ll_rtn = -1 then
				Rollback using lt_transaction;
			else
				ldw_document.resetupdate( )
				commit using lt_transaction;
			end if
		else
			messagebox('Lỗi','s_w_multi.e_sent_2_approve(line:80)')
		end if
	end if
	if ll_rtn = -1 then
		Rollback using lt_transaction;
	end if
	destroy lds_appr_profile
	destroy lds_appr_level
	destroy lc_appr
	if ll_rtn <> -1 then
		if vc_obj_handling.f_is_auto_appr( ) then vw_multi.f_auto_approve(ldb_doc_id )
		vc_obj_handling.f_ctrl_actionbuttons( vdw_focus)
		vw_multi.event e_display_actionbutton( )
	end if

end function

public function boolean f_is_managed_spec (double vdb_item_id);boolean			lb_ok
int					li_cnt				

setnull(lb_ok)
if isnull(vdb_item_id) or vdb_item_id = 0 then	return lb_ok

select count(ID) into :li_cnt from item_spec where object_ref_id = :vdb_item_id  using sqlca;

if li_cnt > 0 then
	return true
else
	return false
end if
end function

public function integer f_delete_appr_profile (double vdb_doc_id, t_transaction vt_transaction);delete appr_profile
where object_ref_id = :vdb_doc_id using vt_transaction;
if vt_transaction.sqlcode <> 0 then
	return -1
end if
return 1
end function

public function boolean f_is_user_alert (double vdb_user_id, t_transaction vt_transaction, ref string rs_applicable_alet_id);t_ds_db		lds_alert
b_rule		lc_rule
boolean		lb_rtn = false
double		ldb_role_user_id,ladb_user_id[]
string			ls_col,ls_type_role_user_id
long			ll_retrieve,ll_idx,ll_rtn,ll_idx1
any			laa_data[]

if isnull(rs_applicable_alet_id) then rs_applicable_alet_id = ''
lds_alert = create t_ds_db
lds_alert.dataobject = 'ds_alert_hdr_grid'
lds_alert.f_settransobject( vt_transaction)
laa_data[1] = gi_user_comp_id
laa_data[2] = gdb_branch
laa_data[3] = 'Y'
ls_col = 'company_id;branch_id;popup_yn'
lds_alert.f_add_where(ls_col,laa_data)
ll_retrieve = lds_alert.retrieve( )
for ll_idx = 1 to ll_retrieve
	ldb_role_user_id = double(lds_alert.getitemstring(ll_idx,'applicable_ref_id_string'))
	ll_rtn = lc_rule.f_get_user_id( ldb_role_user_id,ladb_user_id)
	for ll_idx1 = 1 to ll_rtn
		if vdb_user_id = ladb_user_id[ll_idx1] then
			rs_applicable_alet_id += string(lds_alert.getitemnumber(ll_idx,'alert_hdr_id')) + ';'
			lb_rtn =  true
		end if
	next
//	ls_type_role_user_id = lc_rule.f_get_type_role_user_id( ldb_role_user_id)
//	if pos(string(vdb_user_id),ls_type_role_user_id) > 0 then
//		rs_applicable_alet_id += string(lds_alert.getitemnumber(ll_idx,'alert_hdr_id')) + ';'
//		lb_rtn =  true
//	end if
next
destroy lds_alert
return lb_rtn
end function

public function integer f_send_2_approve (t_dw_mpl vdw_focus, s_object_display vc_obj_handling, s_w_multi vw_multi);
int								li_idx,li_row,li_idx1,li_upperbound,li_rtn
any							laa_data[]
long							ll_rtn,ll_currentrow
string							ls_identify_code,ls_type_role_user_id,ls_updatetable,ls_role_user_id,las_role_user_id[]
double						ldb_identify_id,ldb_business_id,ldb_role_user_id,ldb_doc_id
b_rule						lc_rule
c_string						lc_string
t_ds_db						lds_appr_level,lds_appr_profile
t_dw_mpl					ldw_document
t_transaction 				lt_transaction
c_appr_profile				lc_appr
c_identification_initial		lc_iden_ini

//if gi_userid = 0 then return
vw_multi.f_get_transaction( lt_transaction)
ldw_document = vw_multi.f_get_dwmain( )
if pos(ldw_document.dataobject,'d_document') = 0 then ldw_document = vdw_focus
lc_appr = create c_appr_profile
ll_currentrow = ldw_document.getrow( )
ldb_doc_id = ldw_document.getitemnumber( ll_currentrow , 'ID')
ls_updatetable = ldw_document.describe( "DataWindow.Table.UpdateTable")
lds_appr_profile = create t_ds_db
lds_appr_profile.dataobject = 'ds_appr_profile_grid'
lds_appr_profile.f_settransobject( lt_transaction)
lds_appr_level = create t_ds_db
lds_appr_level.dataobject = 'ds_appr_level'
lds_appr_level.f_settransobject(lt_transaction)
//if pos(ldw_document.dataobject,'d_document') > 0 then
	ls_identify_code = vc_obj_handling.classname( ) +'.'+ 'd_action_edit' +'.'+lc_string.f_globalreplace('e_approve', 'e_', 'b_')
	ldb_identify_id = lc_iden_ini.f_get_id( ls_identify_code)
	if ldb_identify_id > 0 then
		ldb_business_id = lc_rule.f_get_business_rule_id( ldb_identify_id,vw_multi)
		if ldb_business_id > 0 then
//			ldb_role_user_id = lc_rule.f_get_role_user_id( ldb_business_id)
			li_rtn = lc_rule.f_get_role_user_id( ldb_business_id, las_role_user_id[])
			if li_rtn > 0 then
//				ls_type_role_user_id = lc_rule.f_get_type_role_user_id( ldb_role_user_id)
				FOR li_idx = 1 to li_rtn
					if las_role_user_id[li_idx] = '' then continue 
					ls_type_role_user_id = lc_rule.f_get_type_role_user_id(  double(las_role_user_id[li_idx]))
					if not isnull(ls_type_role_user_id) then
						if ls_type_role_user_id = 'appr' then
							//--Duyệt nhiều cấp--//
							laa_data[1] = double(las_role_user_id[li_idx])
							lds_appr_level.f_add_where( 'object_ref_id',laa_data[] )
							li_row = lds_appr_level.retrieve( )
							if li_row = -1 then return -1
							ll_rtn = lc_appr.f_insert_appr_profile(ldb_doc_id,ls_updatetable,lds_appr_profile, lds_appr_level)
						else
							ll_rtn = lc_appr.f_insert_appr_profile( ldb_doc_id, ls_updatetable, double(las_role_user_id[li_idx]), 1,lds_appr_profile)
						end if
						if ll_rtn = 1 then 
							ll_rtn = lds_appr_profile.update(true,false )
							if ll_rtn = 1 then
								lds_appr_profile.resetupdate( )
								ldw_document.setitem( ldw_document.getrow( ) , 'status', 'req_approve')
								if ldw_document.describe("status_name.x") <> '!' then ldw_document.setitem( ldw_document.getrow(), 'status_name', 'Yêu cầu duyệt')
							else 
								messagebox('Lỗi','s_w_multi.e_sent_2_approve(line:57)')
							end if
						end if
					else
						ll_rtn = -1
					end if
				NEXT
			else
				ll_rtn = -1
			end if
		else
			ll_rtn = -1
		end if
	else
		ll_rtn = -1
	end if
	if ll_rtn = 1 then
		ll_rtn = ldw_document.update(true,false )	
		if ll_rtn = 1 then
			//--cảnh báo hàng đã đặt bán hết nếu có--//
			ll_rtn = vc_obj_handling.event e_window_e_send_2_approve( )
			if ll_rtn = -1 then
				Rollback using lt_transaction;
			else
				ldw_document.resetupdate( )
				commit using lt_transaction;
			end if
		else
			messagebox('Lỗi','s_w_multi.e_sent_2_approve(line:80)')
		end if
	end if
	if ll_rtn = -1 then
		Rollback using lt_transaction;
	end if
	destroy lds_appr_profile
	destroy lds_appr_level
	destroy lc_appr
	if ll_rtn <> -1 then
		if vc_obj_handling.f_is_auto_appr( ) then vw_multi.f_auto_approve(ldb_doc_id )
		vc_obj_handling.f_ctrl_actionbuttons( vdw_focus)
		vw_multi.event e_display_actionbutton( )
	end if
return 0
end function

public function integer f_approved (t_dw_mpl vdw_focus, s_object_display vc_obj_handling, s_w_multi vw_multi);int						li_idx,li_appr_level
any					laa_data[]
long					ll_rtn,ll_row,ll_currentrow,ll_find,ll_find1
string					las_t_ref_table[],ls_status,ls_username,ls_doctype
double				ldb_doc_id,ladb_t_ref_id[],ldb_userid
datetime				ldt_sysdate
t_ds_db				lds_appr_profile
t_dw_mpl			ldw_document,ladw_details[]
c_datetime			lc_dt
t_transaction 		lt_transaction
c_appr_profile		lc_appr

if gi_userid = 0 then return 0
vw_multi.f_get_transaction( lt_transaction)
ldw_document = vw_multi.f_get_dwmain( )
if pos(ldw_document.dataobject,'d_document') = 0 then ldw_document = vdw_focus
lc_appr = create c_appr_profile
lds_appr_profile = create t_ds_db
lds_appr_profile.dataobject = 'ds_appr_profile_grid'
//if pos(ldw_document.dataobject,'d_document') > 0 then
	ll_currentrow = ldw_document.find("gutter = 'Y'", 1, ldw_document.rowcount( ) )
	if ll_currentrow = 0 then ll_currentrow = ldw_document.getrow( )
	Do While ll_currentrow > 0
		ldb_doc_id = ldw_document.getitemnumber( ll_currentrow , 'ID')
		ldt_sysdate = lc_dt.f_getsysdate( )
		lds_appr_profile.dataobject = 'ds_appr_profile_grid'
		lds_appr_profile.f_settransobject(lt_transaction)
		laa_data[1] = ldb_doc_id
		lds_appr_profile.f_add_where( 'object_ref_id', laa_data[])
		ll_row = lds_appr_profile.event e_retrieve( )
		if ll_row = 0 then 
			gf_messagebox('m.s_w_multi.e_approve.03','Thông báo','Bạn không có quyền duyệt phiếu ','exclamation','ok',1)
			exit
		end if
		li_appr_level = lds_appr_profile.getitemnumber(ll_row,'appr_level')
		if li_appr_level > 1 then
			//--trường hợp cây duyệt--//
			ll_find = lds_appr_profile.find( "APPR_ASSIGNED ="+string(gi_userid),1, ll_row)
			if ll_find = 0 then
				ll_rtn = -1
				gf_messagebox('m.s_w_multi.e_approve.03','Thông báo','Bạn không có quyền duyệt phiếu '+ldw_document.getitemstring(ll_currentrow, 'code'),'exclamation','ok',1)
				exit
			end if
			li_appr_level = lds_appr_profile.getitemnumber(ll_find,'appr_level')
			if li_appr_level = 1 then //--duyệt cấp 1--//
				if lds_appr_profile.getitemstring( ll_find, 'status') = 'approved' then
					gf_messagebox('m.s_w_multi.e_approve.02','Thông báo','Phiếu '+ldw_document.getitemstring(ll_currentrow, 'code') + ' đã được duyệt cấp ' +string(li_appr_level),'exclamation','ok',1)
				else
					ll_rtn = lc_appr.f_update_appr_profile( lds_appr_profile,ll_find, 'approved', gi_userid,ldb_doc_id, ldt_sysdate,'normal')
				end if
			elseif li_appr_level > 1 then //--duyệt từ cấp 2 trở đi--//
				ll_find1 = lds_appr_profile.find( "status = 'approved' and appr_level = "+string(li_appr_level - 1),1, ll_row)
				if ll_find1 > 0 then
					ll_rtn = lc_appr.f_update_appr_profile( lds_appr_profile,ll_find, 'approved', gi_userid,ldb_doc_id, ldt_sysdate,'normal')
					if ll_rtn = 1 then
						//--nếu là cấp duyệt cuối thì cập nhật trạng thái--//
						if lds_appr_profile.getitemnumber( ll_find, 'APPR_LEVEL') = lds_appr_profile.getitemnumber(lds_appr_profile.rowcount( ), 'APPR_LEVEL') then
							ldw_document.setitem( ll_currentrow , 'status', 'approved')
							if ldw_document.describe("status_name.x") <> '!' then ldw_document.setitem( ldw_document.getrow(), 'status_name', 'Đã duyệt')
						end if
					end if
				else
					ldb_userid = lds_appr_profile.getitemnumber( ll_find - 1, 'APPR_ASSIGNED')
					select obj.name into :ls_username  
					from object obj join role_user rol on rol.object_staff = obj.id 
					where rol.id = :ldb_userid using SQLCA;
					gf_messagebox('m.s_w_multi.e_approve.01','Thông báo','Nhân viên : '+ls_username+ ' chưa duyệt','exclamation','ok',1)
					ll_rtn = 0
				end if
			end if
		elseif li_appr_level = 1 then
			ll_find = lds_appr_profile.find( "APPR_ASSIGNED ="+string(gi_userid),1, ll_row)
			if ll_find > 0 then
				ll_rtn = lc_appr.f_update_appr_profile( lds_appr_profile,ll_find, 'approved', gi_userid,ldb_doc_id, ldt_sysdate,'normal')
				if ll_rtn = 1 then
					ldw_document.setitem( ll_currentrow , 'status', 'approved')
					if ldw_document.describe("status_name.x") <> '!' then ldw_document.setitem( ldw_document.getrow(), 'status_name', 'Đã duyệt')
				end if
			else
				for li_idx = 1 to upperbound(g_user.idb_role_id)
					ll_find = lds_appr_profile.find( "APPR_ASSIGNED ="+string(g_user.idb_role_id[li_idx] ),1, ll_row)
					if ll_find > 0 then exit
				next
				if ll_find > 0 then
					ll_rtn = lc_appr.f_update_appr_profile( lds_appr_profile,ll_find, 'approved', gi_userid,ldb_doc_id, ldt_sysdate,'normal')
					if ll_rtn = 1 then
						ldw_document.setitem( ll_currentrow , 'status', 'approved')
						if ldw_document.describe("status_name.x") <> '!' then ldw_document.setitem( ldw_document.getrow(), 'status_name', 'Đã duyệt')
					end if
				else
					ll_rtn = -1
					gf_messagebox('m.s_w_multi.e_approve.03','Thông báo','Bạn không có quyền duyệt phiếu '+ldw_document.getitemstring(ll_currentrow, 'code'),'exclamation','ok',1)
					exit
				end if
			end if
		end if
		if ll_rtn = 1 then
			ll_currentrow = ldw_document.find("gutter = 'Y'", ll_currentrow+1, ldw_document.rowcount( )+1 )
		else
			ll_currentrow = 0
		end if
	Loop
	if ll_rtn = 1 then
		ll_rtn = ldw_document.update(true,false )
		if ll_rtn = 1 then
			if pos(ldw_document.dataobject,'d_document') > 0 then
				//-- Cập nhật trạng thái chứng từ liên quan --//
				ls_doctype = ldw_document.getitemstring(ll_currentrow , 'doc_type')
				if vc_obj_handling.event e_statuschanged( 'approved', ldb_doc_id, ls_doctype, true) = -1 then
					Rollback using lt_transaction;
					ldw_document.event e_refresh( )
					gf_messagebox('m.s_w_multi.e_approve.04','Thông báo','Không cập nhật được trạng thái chứng từ liên quan','exclamation','ok',1)
					return -1
				end if
			end if
			ldw_document.resetupdate( )
			commit using lt_transaction;
			gf_messagebox('m.s_w_multi.e_approve.03','Thông báo','Duyệt thành công','exclamation','ok',1)
			ll_currentrow = ldw_document.find( "ID = " + string(ldb_doc_id), 1, ldw_document.rowcount())
			ldw_document.scrolltorow( ll_currentrow)				
		else
			Rollback using lt_transaction;
			messagebox('Lỗi','s_w_multi.e_approve(line:69)')
		end if
	end if
//end if
destroy lds_appr_profile
destroy lc_appr
vc_obj_handling.event e_window_e_approved( )
vc_obj_handling.f_ctrl_actionbuttons( vdw_focus)
vw_multi.event e_display_actionbutton( )
return 1
end function

public function integer f_reject (t_dw_mpl vdw_focus, s_object_display vc_obj_handling, s_w_multi vw_multi);int						li_idx
any					laa_data[]
long					ll_rtn,ll_row,ll_currentrow
string					las_t_ref_table[],ls_doc_code
double				ldb_doc_id,ldb_user_id,ladb_t_ref_id[]
datetime				ldt_sysdate
t_ds_db				lds_appr_profile
t_dw_mpl			ldw_document
c_datetime			lc_dt
t_transaction 		lt_transaction
c_appr_profile		lc_appr

if gi_userid = 0 then return 0
vw_multi.f_get_transaction( lt_transaction)
ldw_document = vw_multi.f_get_dwmain( )
lc_appr = create c_appr_profile
if pos(ldw_document.dataobject,'d_document') = 0 then ldw_document = vdw_focus
	ll_currentrow = ldw_document.getrow( )
	ldb_doc_id = ldw_document.getitemnumber( ll_currentrow , 'ID')
	ldt_sysdate = lc_dt.f_getsysdate( )
	lds_appr_profile = create t_ds_db
	lds_appr_profile.dataobject = 'ds_appr_profile_grid'
	lds_appr_profile.f_settransobject(lt_transaction)
	laa_data[1] = ldb_doc_id
	lds_appr_profile.f_add_where( 'object_ref_id', laa_data[])
	ll_row = lds_appr_profile.event e_retrieve( )
	ll_rtn = lc_appr.f_update_appr_profile( lds_appr_profile,ll_row, 'rejected', gi_userid,ldb_doc_id, ldt_sysdate,'') 
	if ll_rtn =1 then
		ldw_document.setitem( ldw_document.getrow() , 'status', 'rejected')
		if ldw_document.describe("status_name.x") <> '!' then ldw_document.setitem( ldw_document.getrow(), 'status_name', 'Trả duyệt')
	end if
	if ll_rtn = 1 then
		ll_rtn = ldw_document.update(true,false )
		if ll_rtn = 1 then
			ldw_document.resetupdate( )
			commit using lt_transaction;
			ll_currentrow = ldw_document.find( "ID = " + string(ldb_doc_id), 1, ldw_document.rowcount())
			ldw_document.scrolltorow( ll_currentrow)									
		else
			Rollback using lt_transaction;
			messagebox('Lỗi','b_obj_instantaite.f_reject(line:42)')
		end if
	end if
destroy lds_appr_profile
destroy lc_appr
vc_obj_handling.event e_window_e_reject( )
vc_obj_handling.f_ctrl_actionbuttons( vdw_focus)
vw_multi.event e_display_actionbutton( )
end function

public function string f_get_subaccount_yn (double vdb_id);string			ls_obj_control

SELECT SUBACCOUNT_REQ_YN into :ls_obj_control
FROM ACCOUNT
where object_ref_id = :vdb_id using sqlca;

if sqlca.sqlcode = 0 then
	if isnull(ls_obj_control) then ls_obj_control ='N'
	return ls_obj_control
else
	return ''
end if
end function

public function integer f_get_account_info_yn (double vdb_id, ref string rs_subaccount_req_yn, ref string rs_acct_type);string			ls_subacct_yn, ls_acct_type

SELECT nvl(SUBACCOUNT_REQ_YN,'N') , nvl(ACCOUNT_TYPE,'N#A') into :rs_SUBACCOUNT_REQ_YN, :rs_acct_type
FROM ACCOUNT
where object_ref_id = :vdb_id using sqlca;

if sqlca.sqlcode = 0 then
	return 1
else
	return -1
end if
end function

public function string f_get_filterstring (datawindowchild vdw_filter, string vs_text);string			ls_filterString, ls_colname[], ls_colType, ls_operator,ls_value,ls_text
string			ls_rtn,ls_ref_expression,ls_ref_data,ls_ref_format,ls_editType, ls_column
int				li_idx, li_colCnt,li_i
boolean		lb_isnumber = true
c_string		lc_string
c_dwservice			l_dwservice

if vs_text = '' or isnull(vs_text) then return ''
ls_text = vs_text

li_colCnt = l_dwservice.f_getcolumns( vdw_filter, ls_colname[])
//li_colCnt = vdw_filter.f_getcolumns(ls_colname[] )

FOR li_idx = 1 to li_colCnt
	if ls_colname[li_idx] = 'gutter' then continue
	ls_colType = vdw_filter.describe(ls_colname[li_idx]+ ".colType")
	ls_editType = vdw_filter.describe(ls_colname[li_idx] + ".Edit.Style")
	If left(ls_colType,5) = 'char(' then
		
		if ls_filterString <> '' then ls_filterString += " OR "
//		ls_text = f_convert_uni2unsign(ls_text)
		ls_filterString += lc_string.f_get_expression( ls_text, ls_colType,ls_colname[li_idx], 'filter')
		
	elseif left(ls_colType,5) = 'numbe' or  left(ls_colType,5) = 'decim' then

		if ls_filterString <> '' then ls_filterString += " OR "
		ls_filterString += lc_string.f_get_expression( ls_text, ls_colType,ls_colname[li_idx], 'filter')
		
	elseif left(ls_colType,5) = 'date' or  left(ls_colType,5) = 'datet' then

		if ls_filterString <> '' then ls_filterString += " OR "
		ls_filterString += lc_string.f_get_expression( ls_text, ls_colType,ls_colname[li_idx], 'filter')
	end if
NEXT 

return ls_filterString
end function

public function string f_get_doc_type (string vs_doc_code);string			ls_data

select doc_type into :ls_data
	from document 
		where code = :vs_doc_code 
		and company_id = :gi_user_comp_id 
		and branch_id = :gdb_branch 
		and sob = :gs_sob using sqlca;
		
if sqlca.sqlcode = 0 then
	return ls_data
else 
	return ''
end if
end function

public function integer f_get_currency_of_bank (double vdb_bank_id, ref double rdb_curr_id);

select CURRENCY_ID into :rdb_curr_id from bank where object_ref_id = :vdb_bank_id using sqlca;

if sqlca.sqlcode = 0 then
	return 1
else
	setnull(rdb_curr_id)
	return -1
end if
end function

public function integer f_get_currency_of_bank (double vdb_bank_id, ref string rs_curr_code);

select uom.code into :rs_curr_code 
from bank join uom on uom.id = bank.CURRENCY_ID
where bank.object_ref_id = :vdb_bank_id using sqlca;

if sqlca.sqlcode = 0 then
	return 1
else
	setnull(rs_curr_code)
	return -1
end if
end function

public function double f_get_object_id (string vs_code, string vs_obj_type, double vdb_company_id, double vdb_branch_id);
double	ldb_id
setnull(ldb_id)

if isnull(vs_code) then return ldb_id
	 
select count(id)	 into :ldb_id 
from object 
where lower(code) = lower(:vs_code )
and lower(object_ref_Table) = lower(:vs_obj_type)
and company_id = :vdb_company_id
and branch_id = :vdb_branch_id
using sqlca;

if ldb_id = 0 then return 0
	
select id into :ldb_id 
from object 
where lower(code) = lower(:vs_code )
and lower(object_ref_Table) = lower(:vs_obj_type)
and company_id = :vdb_company_id
and branch_id = :vdb_branch_id
using sqlca;


if sqlca.sqlcode = 0 then
	return ldb_id
else
	gf_messagebox('m.b_obj_instantiate.f_get_object_id.01','Thông báo','Không tìm thấy ID đối tượng có MÃ là:@'+string(vs_code),'exclamation','ok',1) 		
	return -1
end if
end function

public function string f_get_doc_type (double vdb_doc_id);string			ls_data

select doc_type into :ls_data
	from document 
		where id = :vdb_doc_id 
		and company_id = :gi_user_comp_id 
		and branch_id = :gdb_branch 
		and sob = :gs_sob using sqlca;
		
if sqlca.sqlcode = 0 then
	return ls_data
else 
	return ''
end if
end function

public function integer f_get_sinvoice_json_general (double vdb_document_id, string vs_document_code);return 0
end function

public function integer f_get_object_close_balance (double vdb_object_id, double vdb_curr_id, date vd_trans_date, double vdb_company_id, double vdb_branch_id, string vs_sob, ref double rdb_close_trans_amount, ref double rdb_close_base_amount);/*************************************************
vdb_branch_id = 0: Lấy số dư không phân biệt chi nhánh
vdb_branch_id > 0: lấy số dư theo chi nhánh
------------------------------------------------------------------------------*/

select sum(t.CLOSE_TRANS_AMOUNT), sum(t.CLOSE_BASE_AMOUNT)
into :rdb_close_trans_amount, :rdb_close_base_amount
from object_balance t 
where t.object_id = :vdb_object_id
and t.TRANS_CURRENCY = :vdb_curr_id
and t.BALANCE_DATE = :vd_trans_date
and t.COMPANY_ID = :vdb_company_id
and (t.BRANCH_ID = :vdb_branch_id or :vdb_branch_id = 0)
and t.SOB = :vs_sob
using sqlca;

if sqlca.sqlcode = 0 then
	return 1
else
	return 0
end if
end function

public function integer f_evaluate_exchange (double vdb_doc_id, double vdb_branch_id, double vdb_account_id, double vdb_curr_id, date vd_f_date, date vd_t_date, ref t_dw_mpl rdw_line);/**************************************************************************8
Đánh giá chênh lệch tý giá theo thông tu 200
-------------------------------------------------------------------------------
vdb_branch_id = 0: không phân biệt chi nhánh

====================================================================*/

long			ll_row_cnt, ll_row, ll_insertrow
string			ls_where, ls_exrate_method, ls_trans_text,ls_base_currcode, ls_base_currname
double		ldb_in_amt, ldb_in_base_amt, ldb_adj_doc_id, ldb_adj_base_amt, ldb_out_amt, ldb_out_base_amt, ldb_out_base_amt_total, ldb_out_amt_total
double		ldb_close_amt, ldb_close_base_amt, ldb_exrate, ldba_exchange_account[], ldb_bank_id, ldb_base_curr_id, ldb_round_base_amt_id
date			ld_trans_date

t_ds_db				lds_dr_trans, lds_cr_trans
c_unit_instance		lunit_instance


lds_dr_trans = create t_ds_db
lds_dr_trans.dataobject = 'ds_exchange_trans'
if vdb_branch_id = 0 or isnull(vdb_branch_id) then
	ls_where = " ledger_trans.dr_account_id =" + string(vdb_account_id) &
					+ " AND ledger_trans.TRANS_CURRENCY = " + string(vdb_curr_id) &
					+ " AND ledger_trans.trans_date between to_date(~~'" + string(vd_f_date,'ddmmyyyy')+"~~',~~'ddmmyyyy~~') and to_date(~~'" + string(vd_t_date,'ddmmyyyy')+"~~',~~'ddmmyyyy~~') " &
					+ " AND ledger_trans.company_id =" + string( gi_user_comp_id) + " AND ledger_trans.sob = ~~'" + gs_sob +"~~'"
else
	ls_where = " ledger_trans.dr_account_id =" + string(vdb_account_id) &
					+ " AND ledger_trans.TRANS_CURRENCY = " + string(vdb_curr_id) &
					+ " AND ledger_trans.trans_date between to_date(~~'" + string(vd_f_date,'ddmmyyyy')+"~~',~~'ddmmyyyy~~') and to_date(~~'" + string(vd_t_date,'ddmmyyyy')+"~~',~~'ddmmyyyy~~') " &
					+ " AND ledger_trans.company_id =" + string( gi_user_comp_id) + " AND ledger_trans.sob = ~~'" + gs_sob +"~~' AND ledger_trans.branch_id = " + string( vdb_branch_id)
	
end if
lds_dr_trans.f_add_where( ls_where, ' AND ')
lds_dr_trans.f_settransobject( sqlca)
ll_row_cnt = lds_dr_trans.retrieve()

lds_cr_trans = create t_ds_db
lds_cr_trans.dataobject = 'ds_exchange_trans'
if vdb_branch_id = 0 or isnull(vdb_branch_id) then
	ls_where = " ledger_trans.cr_account_id =" + string(vdb_account_id) &
					+ " AND ledger_trans.TRANS_CURRENCY = " + string(vdb_curr_id) &
					+ " AND ledger_trans.trans_date between to_date(~~'" + string(vd_f_date,'ddmmyyyy')+"~~',~~'ddmmyyyy~~') and to_date(~~'" + string(vd_t_date,'ddmmyyyy')+"~~',~~'ddmmyyyy~~') " &
					+ " AND ledger_trans.company_id =" + string( gi_user_comp_id) + " AND ledger_trans.sob = ~~'" + gs_sob +"~~'"
else
	ls_where = " ledger_trans.cr_account_id =" + string(vdb_account_id) &
					+ " AND ledger_trans.TRANS_CURRENCY = " + string(vdb_curr_id) &
					+ " AND ledger_trans.trans_date between to_date(~~'" + string(vd_f_date,'ddmmyyyy')+"~~',~~'ddmmyyyy~~') and to_date(~~'" + string(vd_t_date,'ddmmyyyy')+"~~',~~'ddmmyyyy~~') " &
					+ " AND ledger_trans.company_id =" + string( gi_user_comp_id) + " AND ledger_trans.sob = ~~'" + gs_sob +"~~' AND ledger_trans.branch_id = " + string( gdb_branch)
	
end if
lds_cr_trans.f_add_where( ls_where, ' AND ')
lds_cr_trans.f_settransobject( sqlca)
ll_row_cnt = lds_cr_trans.retrieve()
if ll_row_cnt = 0 then
	gf_messagebox('m.b_obj_instantiate.f_evaluate_exchange.01','Thông báo','Không có giao dịch xuất dùng ngoại tệ của TK:@' + this.f_get_object_code(vdb_account_id ) ,'stop','ok',1) 
	return 0
end if

this.f_get_object_close_balance( vdb_account_id, vdb_curr_id, vd_f_date, gi_user_comp_id, vdb_branch_id, gs_sob, ldb_close_amt, ldb_close_base_amt)
if isnull(ldb_close_amt) then ldb_close_amt = 0
if isnull(ldb_close_base_amt) then ldb_close_base_amt = 0
if lunit_instance.f_get_exchange_account_info( vdb_curr_id, ldba_exchange_account[], ls_exrate_method, ls_trans_text) = -1 then return -1

if lunit_instance.f_get_base_cur( ldb_base_curr_id, ls_base_currcode, ls_base_currname) = -1 then
	gf_messagebox('m.b_obj_instantiate.f_evaluate_exchange.02','Thông báo','Không tìm thấy Tiền hạch toán' ,'stop','ok',1) 
	return -1
end if
ldb_round_base_amt_id = lunit_instance.f_get_round_id( ldb_base_curr_id,0, 'amount')
if ldb_round_base_amt_id = -1 then return -1

FOR ll_row = 1 to ll_row_cnt
	ld_trans_date = date(lds_cr_trans.getitemdatetime( ll_row, 'trans_date'))
	ldb_adj_doc_id = lds_cr_trans.getitemnumber( ll_row, 'doc_ref_id')
	ldb_bank_id = lds_cr_trans.getitemnumber( ll_row, 'dr_cr_object')
	ldb_out_amt = lds_cr_trans.getitemnumber( ll_row, 'amount')
	ldb_out_base_amt = lds_cr_trans.getitemnumber( ll_row, 'base_amount')
	
	ldb_in_amt = double( lds_dr_trans.describe("Evaluate('Sum( if (trans_date <= date(~~'" + string(ld_trans_date)  + "~~'), amount , 0) )', 0)"))
	ldb_in_amt = ldb_in_amt - ldb_out_amt_total
	
	ldb_in_base_amt = double( lds_dr_trans.describe("Evaluate('Sum( if (trans_date <= date(~~'" + string(ld_trans_date)  + "~~'), base_amount , 0) )', 0)"))
	ldb_in_base_amt = ldb_in_base_amt - ldb_out_base_amt_total
	
	ldb_exrate = (ldb_close_base_amt + ldb_in_base_amt ) / (ldb_close_amt + ldb_in_amt )
	ldb_exrate = lunit_instance.f_round( rdw_line, ldb_round_base_amt_id, ldb_exrate)
	ldb_adj_base_amt = ldb_out_base_amt - ldb_out_amt * ldb_exrate  
	ldb_adj_base_amt =  lunit_instance.f_round( rdw_line, ldb_round_base_amt_id, ldb_adj_base_amt)
	
	ll_insertrow = rdw_line.event e_addrow()
	if ldb_adj_base_amt > 0 then //-- Lãi tỷ giá --//
		ls_trans_text = 'Lãi đánh giá chệnh lệch tỷ giá'		
		rdw_line.setitem(ll_insertrow,'dr_object_id', ldb_bank_id )
		rdw_line.setitem(ll_insertrow,'cr_object_id', ldba_exchange_account[2] )
		rdw_line.setitem(ll_insertrow,'dr_account_id', vdb_account_id )
		rdw_line.setitem(ll_insertrow,'cr_account_id', ldba_exchange_account[2] )						
	elseif ldb_adj_base_amt < 0 then //-- Lỗ tỷ giá --//
		ls_trans_text = 'Lỗ đánh giá chệnh lệch tỷ giá'
		ldb_adj_base_amt = - ldb_adj_base_amt
		rdw_line.setitem(ll_insertrow,'dr_object_id', ldba_exchange_account[1] )
		rdw_line.setitem(ll_insertrow,'cr_object_id', ldb_bank_id )
		rdw_line.setitem(ll_insertrow,'dr_account_id', ldba_exchange_account[1] )
		rdw_line.setitem(ll_insertrow,'cr_account_id', vdb_account_id )				
	end if		
	rdw_line.setitem(ll_insertrow,'TRANS_CUR_ID', vdb_curr_id )	
	rdw_line.setitem(ll_insertrow,'EX_RATE', ldb_exrate )	
	rdw_line.setitem(ll_insertrow,'DOC_ID', vdb_doc_id )
	rdw_line.setitem(ll_insertrow,'ADJ_DOC_ID', ldb_adj_doc_id )
	rdw_line.setitem(ll_insertrow,'TRANS_DATE', ld_trans_date )
	rdw_line.setitem(ll_insertrow,'ADJ_TRANS_DATE', vd_t_date )		
	rdw_line.setitem(ll_insertrow,'TRANS_AMT', 0 )	
	rdw_line.setitem(ll_insertrow,'BASE_AMT', ldb_adj_base_amt )
	rdw_line.setitem(ll_insertrow,'POST_TYPE', 'ledger' )
	rdw_line.setitem(ll_insertrow,'TRANS_TEXT', ls_trans_text )
	rdw_line.setitem(ll_insertrow,'POST_TYPE_TEXT', ls_trans_text )
	
	ldb_out_amt_total += ldb_out_amt
	ldb_out_base_amt_total += ldb_adj_base_amt + ldb_out_base_amt 
	
NEXT
if rdw_line.update() = -1 then
	gf_messagebox('m.b_obj_instantiate.f_evaluate_exchange.03','Thông báo','Không cập nhật được DW chi tiết, lỗi dữ liệu','stop','ok',1) 
	return -1
end if
return 1

end function

public function integer f_get_json_generalinvoice (double vdb_doc_id, boolean vb_paymentstatus, string vs_type, t_transaction vt_transaction, ref string rs_json_generalinvoice);/*Lấy chuỗi Json cho tab generalInvoiceInfo
vdb_doc_id:				ID của hóa đơn bán
vb_paymentStatus:	True là đã thanh toán, mặc định là true
vs_type:					create là tạo mới, adjusted điều chỉnh, replace là thay thế
*/

t_ds_db		lds_general
c_string		lc_str
string			ls_json
int				li_retrieve

lds_general = create t_ds_db
if vs_type = 'create' then
	lds_general.dataobject = 'ds_sinvoice_general_crea_grid'
elseif vs_type = 'adjustment' then
	lds_general.dataobject = 'ds_sinvoice_general_adju_grid'
elseif vs_type = 'replace' then
	lds_general.dataobject = 'ds_sinvoice_general_repl_grid'
end if
lds_general.f_settransobject(vt_transaction )
li_retrieve = lds_general.retrieve(vdb_doc_id )
if li_retrieve > 0 then
	if not vb_paymentStatus then lds_general.setitem(li_retrieve,'paymentstatus', 'false')
	ls_json = lds_general.exportjson( )
	ls_json = lc_str.f_globalreplace( ls_json, ':"true"', ':true')
	ls_json = lc_str.f_globalreplace( ls_json, ':"false"', ':false')
	ls_json = lc_str.f_globalreplace( ls_json, '[', '')
	ls_json = lc_str.f_globalreplace( ls_json, ']', '')
	
	ls_json = lc_str.f_globalreplace( ls_json, 'invoicetype', 'invoiceType',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'templatecode', 'templateCode',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'currencycode', 'currencyCode',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'adjustmenttype', 'adjustmentType',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'paymentstatus', 'paymentStatus',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'paymenttype', 'paymentType',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'paymentTypename', 'paymentTypeName',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'cusgetinvoiceright', 'cusGetInvoiceRight',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'invoiceseries', 'invoiceSeries',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'username', 'userName',false)
	
end if
destroy lds_general
if ls_json <> '' then
	rs_json_generalInvoice = ls_json
	return 1
else
	return 0
end if
end function

public function integer f_get_json_buyerinfo (double vdb_doc_id, t_transaction vt_transaction, ref string rs_json_buyerinfo);t_ds_db		lds_buyerInfo
c_string		lc_str
string			ls_json
int				li_retrieve


lds_buyerInfo = create t_ds_db
lds_buyerInfo.dataobject = 'ds_sinvoice_buyerinfo_grid'
lds_buyerInfo.f_settransobject(vt_transaction)
li_retrieve = lds_buyerInfo.retrieve(vdb_doc_id )
if li_retrieve > 0 then
	ls_json = lds_buyerInfo.exportjson( )
	ls_json = lc_str.f_globalreplace( ls_json, ':"true"', ':true')
	ls_json = lc_str.f_globalreplace( ls_json, ':"false"', ':false')
	ls_json = lc_str.f_globalreplace( ls_json, '[', '')
	ls_json = lc_str.f_globalreplace( ls_json, ']', '')
	
	ls_json = lc_str.f_globalreplace( ls_json, 'buyername', 'buyerName',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'buyertaxcode', 'buyerTaxCode',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'buyerlegalname', 'buyerLegalName',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'buyertaxcode', 'buyerTaxCode',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'buyeraddressline', 'buyerAddressLine',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'buyerphonenumber', 'buyerPhoneNumber',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'buyeremail', 'buyerEmail',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'buyeridno', 'buyerIdNo',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'buyeridtype', 'buyerIdType',false)
	
	       
end if
destroy lds_buyerInfo
if ls_json <> '' then
	rs_json_buyerinfo = ls_json
	return 1
else
	return 0
end if

end function

public function integer f_get_json_payments (double vdb_doc_id, t_transaction vt_transaction, ref string rs_json_payments);t_ds_db		lds_payments
c_string		lc_str
string			ls_json
int				li_retrieve


lds_payments = create t_ds_db
lds_payments.dataobject = 'ds_sinvoice_payments_grid'
lds_payments.f_settransobject(vt_transaction)
li_retrieve = lds_payments.retrieve(vdb_doc_id )
if li_retrieve > 0 then
	ls_json = lds_payments.exportjson( )
	ls_json = lc_str.f_globalreplace( ls_json, ':"true"', ':true')
	ls_json = lc_str.f_globalreplace( ls_json, ':"false"', ':false')
	
	ls_json = lc_str.f_globalreplace( ls_json, 'paymentmethodname', 'paymentMethodName',false)	
end if
destroy lds_payments
if ls_json <> '' then
	rs_json_payments = ls_json
	return 1
else
	return 0
end if

end function

public function integer f_get_json_iteminfo (double vdb_doc_id, string vs_type, t_transaction vt_transaction, ref string rs_json_iteminfo);t_ds_db		lds_iteminfo
c_string		lc_str
string			ls_json
int				li_retrieve


lds_iteminfo = create t_ds_db
if vs_type = 'create' then
	lds_iteminfo.dataobject = 'ds_sinvoice_iteminfo_crea_grid'
else
	lds_iteminfo.dataobject = 'ds_sinvoice_iteminfo_adju_grid'
end if
lds_iteminfo.f_settransobject(vt_transaction)
li_retrieve = lds_iteminfo.retrieve(vdb_doc_id )
if li_retrieve > 0 then
	ls_json = lds_iteminfo.exportjson( )
	ls_json = lc_str.f_globalreplace( ls_json, ':"true"', ':true')
	ls_json = lc_str.f_globalreplace( ls_json, ':"false"', ':false')
	
	ls_json = lc_str.f_globalreplace( ls_json, 'linenumber', 'lineNumber',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'itemcode', 'itemCode',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'itemname', 'itemName',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'unitname', 'unitName',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'unitprice', 'unitPrice',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'itemtotalamountwithouttax', 'itemTotalAmountWithoutTax',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'taxpercentage', 'taxPercentage',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'taxamount', 'taxAmount',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'itemdiscount', 'itemDiscount',false)
	
end if

destroy lds_iteminfo
if ls_json <> '' then
	rs_json_iteminfo = ls_json
	return 1
else
	return 0
end if

end function

public function integer f_get_json_summarizeinfo (double vdb_doc_id, string vs_type, t_transaction vt_transaction, ref string rs_json_summarizeinfo);t_ds_db		lds_summarizeInfo
c_string		lc_str
string			ls_json,ls_total,ls_totalAmountWithTaxInWords
int				li_retrieve


lds_summarizeInfo = create t_ds_db
if vs_type = 'create' then
	lds_summarizeInfo.dataobject = 'ds_sinvoice_summarizeinfo_crea_grid'
else
	lds_summarizeInfo.dataobject = 'ds_sinvoice_summarizeinfo_adju_grid'
end if
lds_summarizeInfo.f_settransobject(vt_transaction)
li_retrieve = lds_summarizeInfo.retrieve(vdb_doc_id )
if li_retrieve > 0 then
	ls_total = string(lds_summarizeInfo.getitemnumber( li_retrieve, 'totalamountwithtax'))
	ls_totalAmountWithTaxInWords = gf_readmoney(ls_total)
	lds_summarizeInfo.setitem( li_retrieve, 'totalamountwithtaxinwords', ls_totalAmountWithTaxInWords)
	ls_json = lds_summarizeInfo.exportjson( )
	ls_json = lc_str.f_globalreplace( ls_json, ':"true"', ':true')
	ls_json = lc_str.f_globalreplace( ls_json, ':"false"', ':false')
	ls_json = lc_str.f_globalreplace( ls_json, '[', '')
	ls_json = lc_str.f_globalreplace( ls_json, ']', '')
	
	ls_json = lc_str.f_globalreplace( ls_json, 'sumoftotallineamountwithouttax', 'sumOfTotalLineAmountWithoutTax',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'totalamountwithouttax', 'totalAmountWithoutTax',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'totaltaxamount', 'totalTaxAmount',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'totalamountwithtax', 'totalAmountWithTax',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'totalAmountWithTaxinwords', 'totalAmountWithTaxInWords',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'discountamount', 'discountAmount',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'settlementdiscountAmount', 'settlementDiscountAmount',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'taxpercentage', 'taxPercentage',false)
end if
destroy lds_summarizeInfo
if ls_json <> '' then
	rs_json_summarizeInfo = ls_json
	return 1
else
	return 0
end if

end function

public function integer f_get_json_taxbreakdowns (double vdb_doc_id, t_transaction vt_transaction, ref string rs_json_taxbreakdowns);t_ds_db		lds_taxBreakdowns
c_string		lc_str
string			ls_json
int				li_retrieve


lds_taxBreakdowns = create t_ds_db
lds_taxBreakdowns.dataobject = 'ds_sinvoice_taxbreakdowns_grid'
lds_taxBreakdowns.f_settransobject(vt_transaction)
li_retrieve = lds_taxBreakdowns.retrieve(vdb_doc_id )
if li_retrieve > 0 then
	ls_json = lds_taxBreakdowns.exportjson( )
	ls_json = lc_str.f_globalreplace( ls_json, ':"true"', ':true')
	ls_json = lc_str.f_globalreplace( ls_json, ':"false"', ':false')
	
	ls_json = lc_str.f_globalreplace( ls_json, 'taxpercentage', 'taxPercentage',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'taxableamount', 'taxableAmount',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'taxamount', 'taxAmount',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'taxableAmountpos', 'taxableAmountPos',false)
end if
destroy lds_taxBreakdowns
if ls_json <> '' then
	rs_json_taxBreakdowns = ls_json
	return 1
else
	return 0
end if

end function

public function integer f_init_sinvoice (double vdb_doc_id, datetime vdt_invoiceissueddate, datetime vdt_invoicesigneddate, boolean vb_paymentstatus, boolean vb_cusgetinvoiceright, string vs_susername, string vs_spassword, t_transaction vt_transaction, string vs_url);/*Tạo hóa đơn điện tử
vdb_doc_id:					ID của hóa đơn bán
vdt_invoiceIssuedDate:	Ngày lập hóa đơn điện tử, nếu để null thì sẽ lấy theo ngày hệ thống
vb_paymentStatus:		True là trạng thái đã thanh toán
vb_cusGetInvoiceRight:	True là khách hàng có lấy hóa đơn
*/
HttpClient		lnv_HttpClient
JsonPackage 	lnv_package
CoderObject		lnv_Coder

string		ls_authe,ls_url,ls_generalInvoiceInfo,ls_sellerinfo,ls_payments,ls_iteminfo,ls_summarizeInfo,ls_taxBreakdowns,ls_buyerinfo,ls_json,ls_status
Blob		lblb_data
int			li_rtn

lnv_HttpClient = create HttpClient
lnv_package = create JsonPackage
lnv_Coder = create CoderObject

if vs_susername ='' and vs_spassword = '' then
	ls_authe = '0100109106-999_test32:12345aVT@'
else
	ls_authe = vs_susername +':'+ vs_spassword
end if 
if vs_url = '' then
	ls_url = 'https://demo-sinvoice.viettel.vn:8443/InvoiceAPI/InvoiceWS/createInvoice/0100109106-999'
else
	ls_url = vs_url
end if

lblb_data = Blob(ls_authe, EncodingANSI!)
ls_authe = lnv_Coder.base64encode( lblb_data)
lnv_HttpClient.timeout = 60
li_rtn = lnv_HttpClient.setrequestheader( 'Authorization','Basic '+ls_authe)
li_rtn = lnv_HttpClient.SetRequestHeader("Content-Type", "application/json;charset=UTF-8")

this.f_get_json_generalinvoice( vdb_doc_id, true, 'create', vt_transaction, ls_generalInvoiceInfo)
this.f_get_json_buyerinfo( vdb_doc_id, vt_transaction,ls_buyerinfo)
this.f_get_json_sellerinfo( gdb_branch, vt_transaction, ls_sellerinfo)
this.f_get_json_payments( vdb_doc_id,vt_transaction, ls_payments)
this.f_get_json_iteminfo(vdb_doc_id, 'create',vt_transaction, ls_iteminfo)
this.f_get_json_summarizeinfo( vdb_doc_id, 'create', vt_transaction, ls_summarizeInfo)
this.f_get_json_taxbreakdowns( vdb_doc_id, vt_transaction, ls_taxBreakdowns)

lnv_package.setvalue( 'generalInvoiceInfo', ls_generalInvoiceInfo)
lnv_package.setvalue( 'buyerInfo', ls_buyerinfo)
lnv_package.setvalue( 'sellerinfo', ls_sellerinfo)
lnv_package.setvalue( 'payments', ls_payments)
lnv_package.setvalue( 'itemInfo', ls_iteminfo)
lnv_package.setvalue( 'summarizeInfo', ls_summarizeInfo)
lnv_package.setvalue( 'taxBreakdowns', ls_taxBreakdowns)
ls_json = lnv_package.getjsonstring( )

lnv_HttpClient.sendrequest( 'POST', ls_url,ls_json)
lnv_HttpClient.GetResponseBody(ls_status, EncodingUTF8!) 

destroy lnv_HttpClient
destroy lnv_package
return 0
end function

public function integer f_get_json_sellerinfo (double vdb_branch_id, t_transaction vt_transaction, ref string rs_json_sellerinfo);t_ds_db		lds_sellerInfo
c_string		lc_str
string			ls_json
int				li_retrieve


lds_sellerInfo = create t_ds_db
lds_sellerInfo.dataobject = 'ds_sinvoice_sellerinfo_grid'
lds_sellerInfo.f_settransobject(vt_transaction)
li_retrieve = lds_sellerInfo.retrieve(vdb_branch_id )
if li_retrieve > 0 then
	ls_json = lds_sellerInfo.exportjson( )
	ls_json = lc_str.f_globalreplace( ls_json, ':"true"', ':true')
	ls_json = lc_str.f_globalreplace( ls_json, ':"false"', ':false')
	ls_json = lc_str.f_globalreplace( ls_json, '[', '')
	ls_json = lc_str.f_globalreplace( ls_json, ']', '')
	
	ls_json = lc_str.f_globalreplace( ls_json, 'sellerlegalname', 'sellerLegalName',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'sellertaxcode', 'sellerTaxCode',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'selleraddressline', 'sellerAddressLine',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'sellerphonenumber', 'sellerPhoneNumber',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'selleremail', 'sellerEmail',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'sellerbankname', 'sellerBankName',false)
	ls_json = lc_str.f_globalreplace( ls_json, 'sellerbankaccount', 'sellerBankAccount',false)
	
end if
destroy lds_sellerInfo
if ls_json <> '' then
	rs_json_sellerInfo = ls_json
	return 1
else
	return 0
end if

end function

public function integer f_calculate_utilization_n_product (double vdb_product_spec[], double vdb_mat_spec[], string vs_base, ref double rdb_product_qty, ref double rdb_mat_qty, ref double rdb_scrap_pct);/*
Chức năng: tính tỷ lệ sử dụng theo diện tích, thể tích (vs_base): diện tích thành phẩm/ diện tích vật liệu 
------------------------------------------------------------------------------------------------------------------------
vs_base: 'area_util', 'volumn_util', volumn_fg , area_fg , sum_semi_fg
vdb_product_spec[1] : chiếu dài sp
vdb_product_spec[2] : chiếu rộng sp
vdb_product_spec[3] : chiếu cáo sp

vdb_mat_spec[1] : chiếu dài vật liệu
vdb_mat_spec[2] : chiếu rộng vật liệu
vdb_mat_spec[3] : chiếu cáo vật liệu
*/
if lower(vs_base) = 'area_util' then
	if isnull( vdb_product_spec[1]) or  vdb_product_spec[1] = 0 then return 0
	if isnull( vdb_product_spec[2]) or  vdb_product_spec[2] = 0 then return 0
	if isnull( rdb_product_qty) or  rdb_product_qty = 0 then return 0
	rdb_scrap_pct = round((vdb_product_spec[1]*vdb_product_spec[2]*rdb_product_qty) / (vdb_mat_spec[1]*vdb_mat_spec[2]*rdb_mat_qty) * 100, 2)
	return 1
elseif  lower(vs_base) = 'volumn_util' then
	if isnull( vdb_product_spec[1]) or  vdb_product_spec[1] = 0 then return 0
	if isnull( vdb_product_spec[2]) or  vdb_product_spec[2] = 0 then return 0
	if isnull( vdb_product_spec[3]) or  vdb_product_spec[3] = 0 then return 0
	if isnull( rdb_product_qty) or  rdb_product_qty = 0 then return 0
	rdb_scrap_pct = round((vdb_product_spec[1]*vdb_product_spec[2]*vdb_product_spec[3]*rdb_product_qty) / (vdb_mat_spec[1]*vdb_mat_spec[2]*vdb_mat_spec[3]*rdb_mat_qty) * 100, 2)
	return 1	
elseif  lower(vs_base) = 'volumn_fg' then
	if isnull( vdb_mat_spec[1]) or  vdb_mat_spec[1] = 0 then return 0
	if isnull( vdb_mat_spec[2]) or  vdb_mat_spec[2] = 0 then return 0
	if isnull( vdb_mat_spec[3]) or  vdb_mat_spec[3] = 0 then return 0	
	rdb_product_qty = vdb_mat_spec[1]*vdb_mat_spec[2]*vdb_mat_spec[3]*rdb_mat_qty
	return 1
elseif  lower(vs_base) = 'area_fg' then
	if isnull( vdb_mat_spec[1]) or  vdb_mat_spec[1] = 0 then return 0
	if isnull( vdb_mat_spec[2]) or  vdb_mat_spec[2] = 0 then return 0
	rdb_product_qty = vdb_mat_spec[1]*vdb_mat_spec[2]*rdb_mat_qty
	return 1
elseif  lower(vs_base) = 'sum_semi_fg' then
	
end if

return 0

end function

public function integer f_calculate_utilization_n_product (t_ds_db vds_material, double vdb_mat_spec[], string vs_base, ref double rdb_product_qty, ref double rdb_scrap_pct);/*
Chức năng: tính tỷ lệ sử dụng theo diện tích, thể tích (vs_base): diện tích thành phẩm/ diện tích vật liệu 
------------------------------------------------------------------------------------------------------------------------
vs_base: 'area_util', 'volumn_util', volumn_fg , area_fg , sum_semi_fg
vdb_product_spec[1] : chiếu dài sp
vdb_product_spec[2] : chiếu rộng sp
vdb_product_spec[3] : chiếu cáo sp

vdb_mat_spec[1] : chiếu dài vật liệu
vdb_mat_spec[2] : chiếu rộng vật liệu
vdb_mat_spec[3] : chiếu cáo vật liệu
*/
if  lower(vs_base) = 'sum_semi_fg' then
	rdb_product_qty =  double(vds_material.describe("Evaluate('Sum(fg_qty)', 0)") )
	return 1
elseif lower(vs_base) = 'area_util' then
	return 1
elseif  lower(vs_base) = 'volumn_util' then

	return 1	
elseif  lower(vs_base) = 'volumn_fg' then

	return 1
elseif  lower(vs_base) = 'area_fg' then

	return 1
	
end if

return 0

end function

public function integer f_calculate_utilization_n_product (double vdb_product_spec[], double vdb_mat_spec[], string vs_base, double vdb_factor_fg, double vdb_factor_mat, ref double rdb_product_qty, ref double rdb_mat_qty, ref double rdb_scrap_pct);/*
Chức năng: tính tỷ lệ sử dụng theo diện tích, thể tích (vs_base): diện tích thành phẩm/ diện tích vật liệu 
------------------------------------------------------------------------------------------------------------------------
vs_base: 'area_util', 'volumn_util', volumn_fg , area_fg , sum_semi_fg
vdb_product_spec[1] : chiếu dài sp
vdb_product_spec[2] : chiếu rộng sp
vdb_product_spec[3] : chiếu cáo sp

vdb_mat_spec[1] : chiếu dài vật liệu
vdb_mat_spec[2] : chiếu rộng vật liệu
vdb_mat_spec[3] : chiếu cao vật liệu
vdb_mat_spec[4] : trọng lượng riêng (density)
*/
if lower(vs_base) = 'area_util' then
	if isnull( vdb_product_spec[1]) or  vdb_product_spec[1] = 0 then return 0
	if isnull( vdb_product_spec[2]) or  vdb_product_spec[2] = 0 then return 0
	if isnull( rdb_product_qty) or  rdb_product_qty = 0 then return 0
	rdb_scrap_pct = round((vdb_product_spec[1]*vdb_product_spec[2]*rdb_product_qty) / (vdb_mat_spec[1]*vdb_mat_spec[2]*rdb_mat_qty) * 100, 2)
	return 1
elseif  lower(vs_base) = 'volumn_util' then
	if isnull( vdb_product_spec[1]) or  vdb_product_spec[1] = 0 then return 0
	if isnull( vdb_product_spec[2]) or  vdb_product_spec[2] = 0 then return 0
	if isnull( vdb_product_spec[3]) or  vdb_product_spec[3] = 0 then return 0
	if isnull( rdb_product_qty) or  rdb_product_qty = 0 then return 0
	rdb_scrap_pct = round((vdb_product_spec[1]*vdb_product_spec[2]*vdb_product_spec[3]*rdb_product_qty) / (vdb_mat_spec[1]*vdb_mat_spec[2]*vdb_mat_spec[3]*rdb_mat_qty) * 100, 2)
	return 1	
elseif  lower(vs_base) = 'volumn_fg' then
	if isnull( vdb_product_spec[1]) or  vdb_product_spec[1] = 0 then return 0
	if isnull( vdb_product_spec[2]) or  vdb_product_spec[2] = 0 then return 0
	if isnull( vdb_product_spec[3]) or  vdb_product_spec[3] = 0 then return 0
	rdb_product_qty = vdb_product_spec[1]*vdb_product_spec[2]*vdb_product_spec[3] * vdb_factor_fg
	rdb_mat_qty= rdb_product_qty * vdb_factor_mat
	return 1
elseif  lower(vs_base) = 'volumn_mat' then
	if isnull( vdb_mat_spec[1]) or  vdb_mat_spec[1] = 0 then return 0
	if isnull( vdb_mat_spec[2]) or  vdb_mat_spec[2] = 0 then return 0
	if isnull( vdb_mat_spec[3]) or  vdb_mat_spec[3] = 0 then return 0	
	rdb_product_qty = vdb_mat_spec[1]*vdb_mat_spec[2]*vdb_mat_spec[3]*rdb_mat_qty * vdb_factor_mat
	return 1	
elseif  lower(vs_base) = 'coffa_pillar_mat' then
	if isnull( vdb_mat_spec[1]) or  vdb_mat_spec[1] = 0 then return 0
	if isnull( vdb_mat_spec[2]) or  vdb_mat_spec[2] = 0 then return 0
	if isnull( vdb_mat_spec[3]) or  vdb_mat_spec[3] = 0 then return 0	
	rdb_product_qty = (vdb_mat_spec[1]+vdb_mat_spec[2])*2*vdb_mat_spec[3]*rdb_mat_qty * vdb_factor_mat
	return 1	
elseif  lower(vs_base) = 'coffa_pillar_fg' then
	if isnull( vdb_product_spec[1]) or  vdb_product_spec[1] = 0 then return 0
	if isnull( vdb_product_spec[2]) or  vdb_product_spec[2] = 0 then return 0
	if isnull( vdb_product_spec[3]) or  vdb_product_spec[3] = 0 then return 0
	rdb_product_qty = (vdb_product_spec[1]+vdb_product_spec[2])*2*vdb_product_spec[3]*rdb_mat_qty * vdb_factor_fg
	rdb_mat_qty = rdb_product_qty * vdb_factor_mat
	return 1		
elseif  lower(vs_base) = 'coffa_beam_mat' then
	if isnull( vdb_mat_spec[1]) or  vdb_mat_spec[1] = 0 then return 0
	if isnull( vdb_mat_spec[2]) or  vdb_mat_spec[2] = 0 then return 0
	if isnull( vdb_mat_spec[3]) or  vdb_mat_spec[3] = 0 then return 0	
	rdb_product_qty = vdb_mat_spec[1]*(vdb_mat_spec[2] + 2*vdb_mat_spec[3])*rdb_mat_qty * vdb_factor_mat
	return 1		
elseif  lower(vs_base) = 'coffa_beam_fg' then
	if isnull( vdb_product_spec[1]) or  vdb_product_spec[1] = 0 then return 0
	if isnull( vdb_product_spec[2]) or  vdb_product_spec[2] = 0 then return 0
	if isnull( vdb_product_spec[3]) or  vdb_product_spec[3] = 0 then return 0	
	rdb_product_qty = vdb_product_spec[1]*(vdb_product_spec[2] + 2*vdb_product_spec[3]) * vdb_factor_fg
	rdb_mat_qty = rdb_product_qty * vdb_factor_mat
	return 1			
elseif  lower(vs_base) = 'weight_length_mat' then
	if isnull( vdb_mat_spec[1]) or  vdb_mat_spec[1] = 0 then return 0
	if isnull( vdb_mat_spec[4]) or  vdb_mat_spec[4] = 0 then return 0
//	rdb_product_qty = vdb_mat_spec[1]*vdb_mat_spec[4]*rdb_mat_qty * vdb_factor_mat
	rdb_mat_qty = vdb_mat_spec[1]*vdb_mat_spec[4]* vdb_factor_mat
	return 1			
elseif  lower(vs_base) = 'weight_length_fg' then
	if isnull( vdb_product_spec[1]) or  vdb_product_spec[1] = 0 then return 0
	if isnull( vdb_product_spec[4]) or  vdb_product_spec[4] = 0 then return 0
	rdb_product_qty = vdb_mat_spec[1]*vdb_mat_spec[4]*rdb_mat_qty * vdb_factor_fg
	rdb_mat_qty = rdb_product_qty * vdb_factor_mat
	return 1				
elseif  lower(vs_base) = 'area_fg' then
	if isnull( vdb_product_spec[1]) or  vdb_product_spec[1] = 0 then return 0
	if isnull( vdb_product_spec[2]) or  vdb_product_spec[2] = 0 then return 0
	rdb_product_qty = vdb_product_spec[1]*vdb_product_spec[2]* vdb_factor_fg
	rdb_mat_qty = rdb_product_qty * vdb_factor_mat
	return 1
elseif  lower(vs_base) = 'area_mat' then
	if isnull( vdb_mat_spec[1]) or  vdb_mat_spec[1] = 0 then return 0
	if isnull( vdb_mat_spec[2]) or  vdb_mat_spec[2] = 0 then return 0
	rdb_product_qty = vdb_mat_spec[1]*vdb_mat_spec[2]*rdb_mat_qty * vdb_factor_mat
	return 1	
elseif  lower(vs_base) = 'sum_semi_fg' then
	
end if

return 0

end function

public function integer f_update_bom_line (string vs_edit_colname, string vs_editdata, string vs_upd_colname, long vl_line_row, t_dw_mpl vdw_line, double vdb_prod_spec[], double vdb_factor_fg);/*--------------------------------------------------------------------------///
		Mô tả chức năng:
			- thay đổi dài, rộng, cao của bom_line -> cập nhật scrap_pct
			- Thay đổi cạnh : cập nhật dài rộng cao, scrap_pct
			- thay đổi số lượng: NVL, TP: cập nhật scrap_pct
			- thay đổi đơn vị: (chưa thực hiện coding)
		---------------------------------
		vl_line_row: số dòng cần update, nếu vl_line_row = 0 thì update toàn bộ dw


-----------------------------------------------------------------------------------------
Hàm này đươc gọi sau khi đã cập nhật giá từ bảng giá cho dw-line
================================================	*/	

int				li_colCnt, li_idx, li_row, li_row_cnt, li_row_start
string			lsa_colname[], ls_base, ls_item_type
double		ldb_scrap_pct_next, ldb_scrap_pct, ldb_product_qty, ldb_mat_qty, ldb_mat_spec[]
double		ldb_round_id, ldb_item_id, ldb_unit_id, ldb_bom_id, ldb_route_id, ldb_factor, ldb_multiplied

c_string				lc_string
c_unit_instance		lc_unit
t_ds_db 				lds_material

//-- tính toán lại giá trị các cột liên quan--//
	

//if ldb_item_id > 0 then ldb_round_id =  lc_unit.f_get_round_id( ldb_unit_id, ldb_item_id, 'item')

//-- Cập nhật lại line --//
if vl_line_row = 0 then
	li_row_cnt = vdw_line.rowcount()
	li_row_start = 1	
elseif vdw_line.ib_itemchanged_all_row then
	li_row_cnt = vdw_line.rowcount()
	li_row_start = vl_line_row
else
	li_row_cnt= vl_line_row
	li_row_start = vl_line_row	
end if 

lds_material = create t_ds_db
lds_material.dataobject = 'd_bom_input_grid'
lds_material.f_settransobject( sqlca)

FOR li_row = li_row_start  to li_row_cnt
	ls_base = vdw_line.getitemstring(li_row, 'BASE_TYPE')
	if isnull(ls_base) and vs_edit_colname <> 'base_type' then return 0 
	ls_item_type = vdw_line.getitemstring(li_row, 'item_type')
	ldb_product_qty = vdw_line.getitemnumber(li_row, 'fg_qty')
	if isnull(ldb_product_qty) then ldb_product_qty = 0
	ldb_mat_qty = vdw_line.getitemnumber(li_row, 'mat_qty')	
	if isnull(ldb_mat_qty) then ldb_mat_qty = 0	
	ldb_factor =  vdw_line.getitemnumber(li_row, 'factor')	
	if isnull(ldb_factor) or ldb_factor = 0 then ldb_factor = 1
	ldb_multiplied = vdw_line.getitemnumber(li_row, 'multiplied_by')	
	if isnull(ldb_multiplied) or ldb_multiplied = 0 then ldb_multiplied = 1
	ldb_scrap_pct = 0	
				
	if vs_edit_colname = 'length' then
		ldb_mat_spec[1] = double(vs_editdata)
		ldb_mat_spec[2] = vdw_line.getitemnumber(li_row, 'width')
		ldb_mat_spec[3] = vdw_line.getitemnumber(li_row, 'depth')
		ldb_mat_spec[4] = vdw_line.getitemnumber(li_row, 'density')
	elseif  vs_edit_colname = 'width' then
		ldb_mat_spec[1] = vdw_line.getitemnumber(li_row, 'length')
		ldb_mat_spec[2] = double(vs_editdata)
		ldb_mat_spec[3] = vdw_line.getitemnumber(li_row, 'depth')
		ldb_mat_spec[4] = vdw_line.getitemnumber(li_row, 'density')
	elseif  vs_edit_colname = 'depth' then		
		ldb_mat_spec[1] = vdw_line.getitemnumber(li_row, 'length')
		ldb_mat_spec[2] = vdw_line.getitemnumber(li_row, 'width')		
		ldb_mat_spec[3] = double(vs_editdata)
		ldb_mat_spec[4] = vdw_line.getitemnumber(li_row, 'density')
	elseif vs_edit_colname = 'density' then
		ldb_mat_spec[1] = vdw_line.getitemnumber(li_row, 'length')
		ldb_mat_spec[2] = vdw_line.getitemnumber(li_row, 'width')		
		ldb_mat_spec[3] =  vdw_line.getitemnumber(li_row, 'depth')
		ldb_mat_spec[4] =  double(vs_editdata)	
	end if
	choose case vs_edit_colname
		case 'mat_qty' ,'fg_qty', 'header',  'base_type', 'factor', 'multiplied_by'
			ldb_mat_spec[1] = vdw_line.getitemnumber(li_row, 'length')
			ldb_mat_spec[2] =  vdw_line.getitemnumber(li_row, 'width')	
			ldb_mat_spec[3] = vdw_line.getitemnumber(li_row, 'depth')	
			ldb_mat_spec[4] = vdw_line.getitemnumber(li_row, 'density')			
			if vs_edit_colname = 'mat_qty' then
				ldb_mat_qty =  double(vs_editdata)
				if isnull(ldb_mat_qty) then ldb_mat_qty = 0		
			elseif vs_edit_colname = 'fg_qty' then		
				ldb_product_qty =  double(vs_editdata)
				if isnull(ldb_product_qty) then ldb_product_qty = 0		
			elseif vs_edit_colname =  'base_type' then
				ls_base = vs_editdata
				if isnull(ls_base) then return 0 
			elseif vs_edit_colname =  'factor' then
				ldb_factor =  double(vs_editdata)
				if isnull(ldb_factor) or ldb_factor = 0 then ldb_factor = 1
			elseif vs_edit_colname =  'multiplied_by' then
				ldb_multiplied =  double(vs_editdata)
				if isnull(ldb_multiplied) or ldb_multiplied = 0 then ldb_multiplied = 1
			end if		
	end choose
	
	//-- Tính current BOM--//
	if this.f_calculate_utilization_n_product( vdb_prod_spec[],  ldb_mat_spec[], ls_base,vdb_factor_fg, ldb_factor,ldb_multiplied , ldb_product_qty, ldb_mat_qty, ldb_scrap_pct) = -1 then return -1
	
	//-- Tính child BOM--//
	if ls_item_type = 'BOM' then
		ldb_bom_id = vdw_line.getitemnumber(li_row, 'item_id')	
		if isnull(ldb_bom_id) then return 0
//		ldb_route_id = vdw_line.getitemnumber(li_row, 'route_id')	
		if isnull(ldb_route_id) then ldb_route_id = 0
		lds_material.reset( )
		if this.f_get_bom_material( ldb_bom_id, ldb_route_id, lds_material) = -1 then return -1
		if not isvalid(lds_material) then return 0
		if ls_base = 'sum_semi_fg' then
			if this.f_calculate_utilization_n_product(  lds_material,ldb_mat_spec[], ls_base,ldb_factor, ldb_multiplied, ldb_product_qty , ldb_scrap_pct_next) = -1 then return -1
			ldb_mat_qty = ldb_product_qty
		else
			if this.f_calculate_utilization_n_product( vdb_prod_spec[],  ldb_mat_spec[], ls_base,vdb_factor_fg, ldb_factor,ldb_multiplied , ldb_product_qty, ldb_mat_qty, ldb_scrap_pct) = -1 then return -1
		end if
	end if
	
	li_colCnt = lc_string.f_stringtoarray( vs_upd_colname, ';', lsa_colname[])		
	FOR li_idx = 1 to li_colCnt
		if lsa_colname[li_idx] = 'scrap_pct_next' then
			vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_scrap_pct_next)
		elseif lsa_colname[li_idx] = 'scrap_pct' then
			vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_scrap_pct)
		elseif lsa_colname[li_idx] = 'length' then
			vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_mat_spec[1])
		elseif lsa_colname[li_idx] = 'width' then
			vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_mat_spec[2])
		elseif lsa_colname[li_idx] = 'depth' then
			vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_mat_spec[3])		
		elseif lsa_colname[li_idx] = 'fg_qty' then
			vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_product_qty)	
		elseif  lsa_colname[li_idx] = 'mat_qty' then
			vdw_line.setitem(li_row,  lsa_colname[li_idx] , ldb_mat_qty)	
		end if						
	NEXT	
NEXT

destroy lds_material
return 1
end function

public function integer f_calculate_utilization_n_product (double vdb_product_spec[], double vdb_mat_spec[], string vs_base, double vdb_factor_fg, double vdb_factor_mat, double vdb_multiplied_mat, ref double rdb_product_qty, ref double rdb_mat_qty, ref double rdb_scrap_pct);/*
Chức năng: tính tỷ lệ sử dụng theo diện tích, thể tích (vs_base): diện tích thành phẩm/ diện tích vật liệu 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Args: vdb_product_spec[] , vdb_mat_spec[], vs_base, vdb_factor_fg, vdb_factor_mat, vdb_multiplied_mat, rdb_product_qty, rdb_mat_qty, rdb_scrap_pct
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
vs_base: 'area_util', 'volumn_util', volumn_fg , area_fg , sum_semi_fg
vdb_product_spec[1] : chiếu dài sp
vdb_product_spec[2] : chiếu rộng sp
vdb_product_spec[3] : chiếu cáo sp

vdb_mat_spec[1] : chiếu dài vật liệu
vdb_mat_spec[2] : chiếu rộng vật liệu
vdb_mat_spec[3] : chiếu cao vật liệu
vdb_mat_spec[4] : trọng lượng riêng (density)
*/


if  lower(vs_base) = 'volumn_fg' then
	if upperbound(vdb_product_spec[]) = 0 then 
		gf_messagebox('m.b_obj_instantiate.f_calculate_utilization_n_product.01','Thông báo','Hạng mục/Công thức không có quy cách','information','ok',1)
		return 0
	end if	
	if isnull( vdb_product_spec[1]) or  vdb_product_spec[1] = 0 then return 0
	if isnull( vdb_product_spec[2]) or  vdb_product_spec[2] = 0 then return 0
	if isnull( vdb_product_spec[3]) or  vdb_product_spec[3] = 0 then return 0
	rdb_product_qty = vdb_product_spec[1]*vdb_product_spec[2]*vdb_product_spec[3] * vdb_factor_fg
	rdb_mat_qty= rdb_product_qty * vdb_factor_mat * vdb_multiplied_mat
	rdb_product_qty = rdb_mat_qty
	
	return 1
elseif  lower(vs_base) = 'volumn_mat' then	
	if isnull( vdb_mat_spec[1]) or  vdb_mat_spec[1] = 0 then return 0
	if isnull( vdb_mat_spec[2]) or  vdb_mat_spec[2] = 0 then return 0
	if isnull( vdb_mat_spec[3]) or  vdb_mat_spec[3] = 0 then return 0	
	rdb_product_qty = vdb_mat_spec[1]*vdb_mat_spec[2]*vdb_mat_spec[3]*rdb_mat_qty * vdb_factor_mat * vdb_multiplied_mat
	return 1	
elseif  lower(vs_base) = 'coffa_pillar_mat' then
	if isnull( vdb_mat_spec[1]) or  vdb_mat_spec[1] = 0 then return 0
	if isnull( vdb_mat_spec[2]) or  vdb_mat_spec[2] = 0 then return 0
	if isnull( vdb_mat_spec[3]) or  vdb_mat_spec[3] = 0 then return 0	
	rdb_product_qty = (vdb_mat_spec[1]+vdb_mat_spec[2])*2*vdb_mat_spec[3]*rdb_mat_qty * vdb_factor_mat * vdb_multiplied_mat
	return 1	
elseif  lower(vs_base) = 'coffa_pillar_fg' then
	if upperbound(vdb_product_spec[]) = 0 then 
		gf_messagebox('m.b_obj_instantiate.f_calculate_utilization_n_product.01','Thông báo','Hạng mục/Công thức không có quy cách','information','ok',1)
		return 0
	end if
	if isnull( vdb_product_spec[1]) or  vdb_product_spec[1] = 0 then return 0
	if isnull( vdb_product_spec[2]) or  vdb_product_spec[2] = 0 then return 0
	if isnull( vdb_product_spec[3]) or  vdb_product_spec[3] = 0 then return 0
	
	rdb_product_qty = (vdb_product_spec[1]+vdb_product_spec[2])*2*vdb_product_spec[3]* vdb_factor_fg
	rdb_mat_qty = rdb_product_qty * vdb_factor_mat * vdb_multiplied_mat
	rdb_product_qty = rdb_mat_qty
	
	return 1		
elseif  lower(vs_base) = 'coffa_beam_mat' then
	if isnull( vdb_mat_spec[1]) or  vdb_mat_spec[1] = 0 then return 0
	if isnull( vdb_mat_spec[2]) or  vdb_mat_spec[2] = 0 then return 0
	if isnull( vdb_mat_spec[3]) or  vdb_mat_spec[3] = 0 then return 0	
	rdb_product_qty = vdb_mat_spec[1]*(vdb_mat_spec[2] + 2*vdb_mat_spec[3])*rdb_mat_qty * vdb_factor_mat* vdb_multiplied_mat
	return 1		
elseif  lower(vs_base) = 'coffa_beam_fg' then
	if upperbound(vdb_product_spec[]) = 0 then 
		gf_messagebox('m.b_obj_instantiate.f_calculate_utilization_n_product.01','Thông báo','Hạng mục/Công thức không có quy cách','information','ok',1)
		return 0
	end if	
	if isnull( vdb_product_spec[1]) or  vdb_product_spec[1] = 0 then return 0
	if isnull( vdb_product_spec[2]) or  vdb_product_spec[2] = 0 then return 0
	if isnull( vdb_product_spec[3]) or  vdb_product_spec[3] = 0 then return 0	
	
	rdb_product_qty = vdb_product_spec[1]*(vdb_product_spec[2] + 2*vdb_product_spec[3]) * vdb_factor_fg
	rdb_mat_qty = rdb_product_qty * vdb_factor_mat * vdb_multiplied_mat
	rdb_product_qty = rdb_mat_qty
	
	return 1			
elseif  lower(vs_base) = 'weight_length_mat' then
	if isnull( vdb_mat_spec[1]) or  vdb_mat_spec[1] = 0 then return 0
	if isnull( vdb_mat_spec[4]) or  vdb_mat_spec[4] = 0 then return 0
//	rdb_product_qty = vdb_mat_spec[1]*vdb_mat_spec[4]*rdb_mat_qty * vdb_factor_mat
	rdb_mat_qty = vdb_mat_spec[1]*vdb_mat_spec[4]* vdb_factor_mat * vdb_multiplied_mat
	return 1			
elseif  lower(vs_base) = 'weight_length_fg' then
	if upperbound(vdb_product_spec[]) = 0 then 
		gf_messagebox('m.b_obj_instantiate.f_calculate_utilization_n_product.01','Thông báo','Hạng mục/Công thức không có quy cách','information','ok',1)
		return 0
	end if	
	if isnull( vdb_product_spec[1]) or  vdb_product_spec[1] = 0 then return 0
	if isnull( vdb_product_spec[4]) or  vdb_product_spec[4] = 0 then return 0
	
	rdb_product_qty = vdb_mat_spec[1]*vdb_mat_spec[4]* vdb_factor_fg
	rdb_mat_qty = rdb_product_qty * vdb_factor_mat * vdb_multiplied_mat
	rdb_product_qty = rdb_mat_qty
	return 1				
elseif  lower(vs_base) = 'area_fg' then
	if upperbound(vdb_product_spec[]) = 0 then 
		gf_messagebox('m.b_obj_instantiate.f_calculate_utilization_n_product.01','Thông báo','Hạng mục/Công thức không có quy cách','information','ok',1)
		return 0
	end if	
	if isnull( vdb_product_spec[1]) or  vdb_product_spec[1] = 0 then return 0
	if isnull( vdb_product_spec[2]) or  vdb_product_spec[2] = 0 then return 0
	
	rdb_product_qty = vdb_product_spec[1]*vdb_product_spec[2]* vdb_factor_fg
	rdb_mat_qty = rdb_product_qty * vdb_factor_mat * vdb_multiplied_mat
	rdb_product_qty = rdb_mat_qty
	
	return 1
elseif  lower(vs_base) = 'area_mat' then
	if isnull( vdb_mat_spec[1]) or  vdb_mat_spec[1] = 0 then return 0
	if isnull( vdb_mat_spec[2]) or  vdb_mat_spec[2] = 0 then return 0
	rdb_product_qty = vdb_mat_spec[1]*vdb_mat_spec[2]*rdb_mat_qty * vdb_factor_mat * vdb_multiplied_mat
	return 1	
elseif  lower(vs_base) = 'sum_semi_fg' then
	
end if

return 0

end function

public function integer f_calculate_utilization_n_product (t_ds_db vds_material, double vdb_mat_spec[], string vs_base, double vdb_factor, double vdb_multiplied, ref double rdb_product_qty, ref double rdb_scrap_pct);/*
Chức năng: tính tỷ lệ sử dụng theo diện tích, thể tích (vs_base): diện tích thành phẩm/ diện tích vật liệu 
------------------------------------------------------------------------------------------------------------------------
Args:vds_material, vdb_mat_spec[], vs_base, vdb_factor,vdb_multiplied, rdb_product_qty, rdb_scrap_pct
--------------------------------------------------------------------------------------------
vs_base: 'area_util', 'volumn_util', volumn_fg , area_fg , sum_semi_fg
vdb_product_spec[1] : chiếu dài sp
vdb_product_spec[2] : chiếu rộng sp
vdb_product_spec[3] : chiếu cáo sp

vdb_mat_spec[1] : chiếu dài vật liệu
vdb_mat_spec[2] : chiếu rộng vật liệu
vdb_mat_spec[3] : chiếu cáo vật liệu
*/
string			ls_base_mat

if  lower(vs_base) = 'sum_semi_fg' then
	ls_base_mat = vds_material.getitemstring(1 , 'base_type')
	if ls_base_mat = 'volumn_fg' then
		rdb_product_qty = vds_material.getitemnumber(1 , 'fg_qty') * vdb_factor*vdb_multiplied
	elseif ls_base_mat = 'volumn_mat' or ls_base_mat = 'sum_semi_fg' then
		rdb_product_qty =  double(vds_material.describe("Evaluate('Sum(fg_qty)', 0)") ) * vdb_factor*vdb_multiplied
	end if
	return 1
elseif lower(vs_base) = 'area_util' then
	return 1
elseif  lower(vs_base) = 'volumn_util' then

	return 1	
elseif  lower(vs_base) = 'volumn_fg' then

	return 1
elseif  lower(vs_base) = 'area_fg' then

	return 1
	
end if

return 0

end function

public function integer f_importclipboard_dw (ref t_dw_mpl rdw_handle, long vl_start_row, string vs_start_colname);int					li_rtn,li_row, li_colCnt, li_col, ll_rowCnt, ll_insertrow, li_start_col
string				lsa_colname[], ls_coltype, ls_sql, ls_modify, ls_rtn, ls_data
t_ds_db					lds_clipboard
c_string					lc_string
s_object_display		lod_hdl
s_w_main				lw_hdl

if isvalid(rdw_handle) = false then return 0
if rdw_handle.f_isgrid() = false then return 0
if vs_start_colname = '' or isnull(vs_start_colname) then
	gf_messagebox('m.b_obj_instantiate.f_importclipboard_dw.01','Thông báo','Chưa chọn cột bắt đầu copy', 'stop','ok',1)
	return -1
end if

if vl_start_row = 0 or isnull(vl_start_row) then
	gf_messagebox('m.b_obj_instantiate.f_importclipboard_dw.02','Thông báo','Chưa chọn dòng bắt đầu copy', 'stop','ok',1)
	return -2
end if

rdw_handle.f_getparentwindow(lw_hdl)
lod_hdl = lw_hdl.f_get_obj_handling()

ls_sql = "SELECT "

li_colCnt = rdw_handle.f_get_object_in_taborder_visible(lsa_colname[]) 
FOR li_col = 1 to li_colCnt
	if vs_start_colname = lsa_colname[li_col] then li_start_col = li_col
	ls_coltype = rdw_handle.describe(lsa_colname[li_col]+'.coltype')
	CHOOSE CASE Lower ( Left ( ls_coltype , 5 ) )
	
			CASE "char(", "char"		//  CHARACTER DATATYPE
				ls_sql += " '' as col"+string(li_col) + ',' 		
			CASE "date"					//  DATE DATATYPE
				ls_sql += " sysdate as col"+string(li_col)+ ',' 	
			CASE "datet"				//  DATETIME DATATYPE
				ls_sql += " sysdate as col"+string(li_col) + ',' 		
			CASE "decim"				//  DECIMAL DATATYPE
				ls_sql += " 0 as col"+string(li_col) + ',' 				
			CASE "numbe", "long", "ulong", "real", "int"				//  NUMBER DATATYPE	
				ls_sql += " 0 as col"+string(li_col) + ',' 			
			CASE "time", "times"		//  TIME DATATYPE
				ls_sql += " sysdate as col"+string(li_col) + ',' 	
	END CHOOSE
NEXT
ls_sql = left(ls_sql, len(ls_sql) - 1) + ' FROM DUAL'
ls_sql = sqlca.SyntaxFromSQL( ls_sql,"", ls_rtn)
if ls_rtn ="" then
	lds_clipboard = create t_ds_db
	lds_clipboard.Create( ls_sql, ls_rtn)
	IF Len(ls_rtn) > 0 THEN
		gf_messagebox('m.b_obj_instantiate.f_importclipboard_dw.03','Thông báo',ls_rtn, 'stop','ok',1)
		RETURN -1
	END IF	
end if 

li_rtn = lds_clipboard.importclipboard(1,0,0,0,li_start_col)
if li_rtn = -1 then return -1
clipboard('')

yield()
lod_hdl.of_show_progress( 1, 'Đang copy .........')

ll_rowCnt = rdw_handle.rowcount()
FOR li_row = 1 to li_rtn
	lod_hdl.of_show_progress( int(li_row/li_rtn*100), 'Đang copy .........')
	lod_hdl.iw_progress.st_remain.text = string(li_row)+'/'+string(li_rtn)		
	
	if ll_rowCnt >= vl_start_row + li_row -1 then
		ll_insertrow =  vl_start_row + li_row -1 
	else
		ll_insertrow = rdw_handle.event e_addrow()
	end if
	FOR li_col = li_start_col to li_colCnt
		ls_data =  string(lds_clipboard.f_getitemany( li_row, li_col)) 
		if isnull(ls_data) then continue 
		if rdw_handle.Event e_itemchanged_ex(ll_insertrow, lsa_colname[ li_col ] , ls_data) = 1 then return -1
		rdw_handle.setitem( ll_insertrow,lsa_colname[ li_col ] , lds_clipboard.f_getitemany( li_row, li_col))
		if li_col = li_colCnt then exit
	NEXT
	rdw_handle.event e_presave()
	
NEXT
rdw_handle.f_set_ib_saving(false)
lod_hdl.of_show_progress( 101, 'Đang copy .........')
return 1
end function

public function double f_get_last_pur_price (double vdb_item_id);double			ldb_last_pur_price

if isnull(vdb_item_id) or vdb_item_id = 0 then return -1

select last_pur_price into :ldb_last_pur_price from item where object_ref_id = :vdb_item_id using sqlca;

if isnull(ldb_last_pur_price) or ldb_last_pur_price = 0 then
	
	ldb_last_pur_price = this.f_get_moving_avg( vdb_item_id)
end if

return ldb_last_pur_price
end function

public function integer f_get_object_code_n_name (double vdb_id, ref string rs_code, ref string rs_name);

//setnull(ls_code)
if isnull(vdb_id) then return 0

select code, name into :rs_code , :rs_name from object where id = :vdb_id using sqlca;
if sqlca.sqlcode = 100 then
	select code, name into :rs_code , :rs_name from legal_entity where id = :vdb_id using sqlca;
end if

if sqlca.sqlcode = 100 then
	select code, name into :rs_code , :rs_name from valueset_value where id = :vdb_id using sqlca;
end if

if sqlca.sqlcode = 100 then
	select code, name into :rs_code , :rs_name from uom where id = :vdb_id using sqlca;
end if

if sqlca.sqlcode = 0 then
	return 1
else
	gf_messagebox('m.b_obj_instantiate.f_get_object_code_n_name.01','Thông báo','Không tìm thấy mã đối tượng có ID:@'+string(vdb_id),'exclamation','ok',1) 			
	return 0
end if
end function

public function integer f_join_dwh_search (string vs_dwo, string vs_filtertext, ref string rs_sql);
string				ls_table_m, ls_table_alias_m, ls_join_m, ls_where_m, ls_filter_join
int					li_idx
t_ds_db			lds_handle
c_dwservice		lc_dwservice
c_string			lc_string
c_sql				lc_sql
t_s_sql_attr		lstr_sql_attr[]

lds_handle = create t_ds_db
lds_handle.dataobject = vs_dwo

//-- add/remove join với dwh_search --//
if pos(lower(rs_sql),'left join dwh_search') > 0 then
	rs_sql = left(rs_sql , pos(lower(rs_sql),'left join dwh_search') -1)
end if	
//if vs_filterText <> '' and not isnull(vs_filterText) then
	if lc_dwservice.f_parse_fromwhere_clause(lds_handle ,ls_table_m, ls_table_alias_m, ls_join_m, ls_where_m) = -1 then return -1
	lc_sql.f_parse(rs_sql , lstr_sql_attr[])
	if lower(ls_table_m) = 'object' or lower(ls_table_m) = 'valueset_value' then
		if ls_table_alias_m = '' then
			ls_filter_join = ' JOIN dwh_search ON '+ ls_table_m +'.id = dwh_search.object_id AND '
		else
			ls_filter_join = ' JOIN dwh_search ON '+ ls_table_alias_m +'.id = dwh_search.object_id AND '
		end if
		for li_idx = 1 to upperbound(lstr_sql_attr[])
			lstr_sql_attr[li_idx].s_columns += ', dwh_search.obj_search '
		next
	elseif ls_table_m = 'document' then
		return 0
	else
		return 0
	end if
	ls_filter_join += lc_string.f_get_expression( vs_filterText, 'char(', 'dwh_search.obj_search', 'build where')
	
	rs_sql = lc_sql.f_assemble( lstr_sql_attr[])	
	rs_sql += ls_filter_join
//else
//	return 0
//end if
return 1
end function

public function double f_get_flexible_id (string vs_code);double		vdb_id

//setnull(ls_code)
if isnull(vs_code) or vs_code = '' then return 0

select id   into :vdb_id  from flexible_data where code = :vs_code using sqlca;

if sqlca.sqlcode = 0 then
	return vdb_id
else
	gf_messagebox('m.b_obj_instantiate.vdb_id.01','Thông báo','Không tìm thấy FLAXIBLE DATA có Mã:@'+vs_code,'exclamation','ok',1) 			
	return 0
end if
end function

public function integer f_get_struct_id_n_combchar (string vs_code, ref double rdb_id, ref string rs_char);

//setnull(ls_code)
if isnull(vs_code) then return 0

select id, combine_char into :rdb_id , :rs_char from flexible_data where code = :vs_code using sqlca;

if sqlca.sqlcode = 0 then
	return 1
else
	gf_messagebox('m.b_obj_instantiate.f_get_struct_id_n_combChar.01','Thông báo','Không tìm thấy mã cấu trúc có Mã:@'+vs_code,'exclamation','ok',1) 			
	return 0
end if
end function

public function string f_get_filterstring (datawindowchild vdw_filter, string vs_text, string vs_colname);string			ls_filterString, ls_colType, ls_text
string			ls_rtn,ls_ref_expression,ls_ref_data,ls_ref_format,ls_editType
c_string		lc_string

if vs_text = '' or isnull(vs_text) then return ''
ls_text = vs_text
 
if vs_colname= 'gutter' then return ''
ls_colType = vdw_filter.describe(vs_colname+ ".colType")
ls_editType = vdw_filter.describe(vs_colname + ".Edit.Style")
If left(ls_colType,5) = 'char(' then
	
	if vs_colname = 'obj_search' or vs_colname = 'doc_search' then
		ls_text = f_convert_uni2unsign(ls_text)
	else
		ls_text = f_convert_uni2unsign(ls_text)
		vs_colname = 'f_convert_uni2unsign('+vs_colname+')'
	end if	

	ls_filterString += lc_string.f_get_expression( ls_text, ls_colType,vs_colname, 'filter')
	
elseif left(ls_colType,5) = 'numbe' or  left(ls_colType,5) = 'decim' then

	ls_filterString += lc_string.f_get_expression( ls_text, ls_colType,vs_colname, 'filter')
	
elseif left(ls_colType,5) = 'date' or  left(ls_colType,5) = 'datet' then
	ls_filterString += lc_string.f_get_expression( ls_text, ls_colType,vs_colname, 'filter')
end if


return ls_filterString
end function

public function integer f_left_join_dwh_search (string vs_dwo, ref string rs_sql);
string				ls_table_m, ls_table_alias_m, ls_join_m, ls_where_m, ls_filter_join

t_ds_db			lds_handle
c_dwservice		lc_dwservice
c_string			lc_string


lds_handle = create t_ds_db
lds_handle.dataobject = vs_dwo

//-- add/remove join với dwh_search --//
if pos(lower(rs_sql),'left join dwh_search' ) > 0 then
	rs_sql = left(rs_sql , pos(lower(rs_sql),'left join dwh_search') -1)
end if	
if lds_handle.describe( 'id.coltype') <> '!' then
	if lc_dwservice.f_parse_fromwhere_clause(lds_handle ,ls_table_m, ls_table_alias_m, ls_join_m, ls_where_m) = -1 then return -1
	if lower(ls_table_m) = 'object' or lower(ls_table_m) = 'valueset_value' then
		if ls_table_alias_m = '' then
			ls_filter_join = ' LEFT JOIN dwh_search ON '+ ls_table_m +'.id = dwh_search.object_id '
		else
			ls_filter_join = ' LEFT JOIN dwh_search ON '+ ls_table_alias_m +'.id = dwh_search.object_id '
		end if
	elseif ls_table_m = 'document' then
		return 0
	else
		return 0
	end if
	rs_sql += ls_filter_join
else
	return 0
end if
return 1
end function

public function integer f_join_dwh_search (string vs_filtertext, ref string rs_sql);
string				ls_join , ls_sql
int					li_pos
t_ds_db			lds_handle
c_dwservice		lc_dwservice
c_string			lc_string
c_sql				lc_sql
t_s_sql_attr		lstr_sql_attr[]


ls_sql = lower(rs_sql)
li_pos =  pos(ls_sql ,'join dwh_search')

if li_pos > 0 then
	ls_join = mid(ls_sql, li_pos )
	ls_sql = left(ls_sql , li_pos -1)
	if pos(ls_join,' and ') > 0 then
		ls_join = left (ls_join, pos(ls_join,' and ') -1 )
	end if
	if vs_filterText <> '' and not isnull(vs_filterText) then
		if pos(ls_sql, 'dwh_search.obj_search') > 0 then 
			ls_join += " AND " + lc_string.f_get_expression( vs_filterText, 'char(', 'dwh_search.obj_search', 'build where')
		elseif  pos(ls_sql, 'dwh_search.doc_search') > 0 then 
			ls_join +=  " AND " +lc_string.f_get_expression( vs_filterText, 'char(', 'dwh_search.doc_search', 'build where')
		end if
	end if
	rs_sql = ls_sql + ls_join
	return 1
else
	return 0
end if	

end function

public function integer f_add_where_dwh_search (string vs_filtertext, ref string rs_sql);
string				ls_sql, ls_where
int					li_pos
t_ds_db			lds_handle
c_dwservice		lc_dwservice
c_string			lc_string
c_sql				lc_sql
t_s_sql_attr		lstr_sql_attr[]


li_pos =  pos(lower(rs_sql) ,' dwh_search.obj_search=')
if li_pos = 0 then li_pos =  pos(lower(rs_sql) ,' dwh_search.doc_search=')
if li_pos = 0 and ( vs_filterText = '' or isnull(vs_filterText) ) then return 0
if li_pos > 0 then 
	ls_sql = left(rs_sql , li_pos -1) //-- cắt từ rs_sql để giữ nguyên string--//
else
	ls_sql = rs_sql
end if

if vs_filterText <> '' and not isnull(vs_filterText) then
	if pos(ls_sql, 'dwh_search.obj_search') > 0 then 
		ls_where =  lc_string.f_get_expression( vs_filterText, 'char(', 'dwh_search.obj_search', 'build where')
	elseif  pos(ls_sql, 'dwh_search.doc_search') > 0 then 
		ls_where =  lc_string.f_get_expression( vs_filterText, 'char(', 'dwh_search.doc_search', 'build where')
	end if
	lc_sql.f_addtowhereclause(ls_sql , ls_where, ' AND ')
end if
rs_sql = ls_sql
return 1



end function

public function integer f_get_item_code_n_name_spec (double vdb_id, ref string rs_code, ref string rs_name, ref string rs_spec);

//setnull(ls_code)
if isnull(vdb_id) then return 0

select object.code, object.name, item.spec_desc into :rs_code , :rs_name , :rs_spec
from object join item on item.object_ref_id = object.id
where object.id = :vdb_id using sqlca;

if sqlca.sqlcode = 0 then
	return 1
else
	gf_messagebox('m.b_obj_instantiate.f_get_object_code_n_name.01','Thông báo','Không tìm thấy mã đối tượng có ID:@'+string(vdb_id),'exclamation','ok',1) 			
	return 0
end if
end function

public function integer f_get_item_code_n_name_uom (double vdb_id, ref string rs_code, ref string rs_name, ref string rs_unit_code, ref double rdb_unit_id);

//setnull(ls_code)
if isnull(vdb_id) then return 0

select object.code, object.name, uom.code, uom.id into :rs_code , :rs_name , :rs_unit_code , :rdb_unit_id 
from object join item on item.object_ref_id = object.id
				join uom on uom.id= item.stock_uom
where object.id = :vdb_id using sqlca;

if sqlca.sqlcode = 0 then
	return 1
else
	gf_messagebox('m.b_obj_instantiate.f_get_object_code_n_name.01','Thông báo','Không tìm thấy mã đối tượng có ID:@'+string(vdb_id),'exclamation','ok',1) 			
	return 0
end if
end function

public function double f_get_object_id (string vs_code, string vs_obj_type, double vdb_company_id, double vdb_branch_id, ref t_transaction rt_transaction);
double	ldb_id
setnull(ldb_id)

if isnull(vs_code) then return ldb_id
	 
select count(id)	 into :ldb_id 
from object 
where lower(code) = lower(:vs_code )
and lower(object_ref_Table) = lower(:vs_obj_type)
and company_id = :vdb_company_id
and branch_id = :vdb_branch_id
using rt_transaction;

if ldb_id = 0 then return 0
	
select id into :ldb_id 
from object 
where lower(code) = lower(:vs_code )
and lower(object_ref_Table) = lower(:vs_obj_type)
and company_id = :vdb_company_id
and branch_id = :vdb_branch_id
using rt_transaction;


if rt_transaction.sqlcode = 0 then
	return ldb_id
else
	gf_messagebox('m.b_obj_instantiate.f_get_object_id.01','Thông báo','Không tìm thấy ID đối tượng có MÃ là:@'+string(vs_code),'exclamation','ok',1) 		
	return -1
end if
end function

public function integer f_get_object_code_n_name (double vdb_id, ref string rs_code, ref string rs_name, ref t_transaction rt_transaction);

//setnull(ls_code)
if isnull(vdb_id) then return 0

select code, name into :rs_code , :rs_name from object where id = :vdb_id using rt_transaction;
if rt_transaction.sqlcode = 100 then
	select code, name into :rs_code , :rs_name from legal_entity where id = :vdb_id using rt_transaction;
end if

if rt_transaction.sqlcode = 100 then
	select code, name into :rs_code , :rs_name from valueset_value where id = :vdb_id using rt_transaction;
end if

if rt_transaction.sqlcode = 100 then
	select code, name into :rs_code , :rs_name from uom where id = :vdb_id using rt_transaction;
end if

if rt_transaction.sqlcode = 0 then
	return 1
else
	gf_messagebox('m.b_obj_instantiate.f_get_object_code_n_name.01','Thông báo','Không tìm thấy mã đối tượng có ID:@'+string(vdb_id),'exclamation','ok',1) 			
	return 0
end if
end function

public function string f_get_filterstring (datawindow vdw_filter, string vs_text, string vs_colname);string			ls_filterString, ls_colType, ls_text
string			ls_rtn,ls_ref_expression,ls_ref_data,ls_ref_format,ls_editType
c_string		lc_string

if vs_text = '' or isnull(vs_text) then return ''
ls_text = vs_text

if vs_colname= 'gutter' then return ''
ls_colType = vdw_filter.describe(vs_colname+ ".colType")
ls_editType = vdw_filter.describe(vs_colname + ".Edit.Style")
If left(ls_colType,5) = 'char(' then
	if vs_colname = 'obj_search' or vs_colname = 'doc_search' then
		ls_text = f_convert_uni2unsign(ls_text)
	else
		ls_text = f_convert_uni2unsign(ls_text)
		vs_colname = 'f_convert_uni2unsign('+vs_colname+')'
	end if
	ls_filterString += lc_string.f_get_expression( ls_text, ls_colType,vs_colname, 'filter')
	
elseif left(ls_colType,5) = 'numbe' or  left(ls_colType,5) = 'decim' then

	ls_filterString += lc_string.f_get_expression( ls_text, ls_colType,vs_colname, 'filter')
	
elseif left(ls_colType,5) = 'date' or  left(ls_colType,5) = 'datet' then
	ls_filterString += lc_string.f_get_expression( ls_text, ls_colType,vs_colname, 'filter')
end if


return ls_filterString
end function

public function integer f_get_object_id_n_name (string vs_code, string vs_obj_type, double vdb_company_id, double vdb_branch_id, ref double rdb_obj_id, ref string rs_obj_name);
double	ldb_id
setnull(ldb_id)

if isnull(vs_code) then return ldb_id
	 
select count(id)	 into :ldb_id 
from object 
where lower(code) = lower(:vs_code )
and lower(object_ref_Table) = lower(:vs_obj_type)
and company_id = :vdb_company_id
and branch_id = :vdb_branch_id
using sqlca;

if ldb_id = 0 then return 0
	
select id, name into :rdb_obj_id,  :rs_obj_name
from object 
where lower(code) = lower(:vs_code )
and lower(object_ref_Table) = lower(:vs_obj_type)
and company_id = :vdb_company_id
and branch_id = :vdb_branch_id
using sqlca;


if sqlca.sqlcode = 0 then
	return ldb_id
else
	gf_messagebox('m.b_obj_instantiate.f_get_object_id.01','Thông báo','Không tìm thấy ID đối tượng có MÃ là:@'+string(vs_code),'exclamation','ok',1) 		
	return -1
end if
end function

public function integer f_get_object_id_name_n_point (string vs_code, string vs_obj_type, double vdb_company_id, double vdb_branch_id, ref double rdb_obj_id, ref string rs_obj_name, ref long rl_point);
double	ldb_id
setnull(ldb_id)

if isnull(vs_code) then return ldb_id
	 
select count(id)	 into :ldb_id 
from object 
where lower(code) = lower(:vs_code )
and lower(object_ref_Table) = lower(:vs_obj_type)
and company_id = :vdb_company_id
and branch_id = :vdb_branch_id
using sqlca;

if ldb_id = 0 then return 0
	
select t.id, t.name, v.bal_value into :rdb_obj_id,  :rs_obj_name, :rl_point
from object t 
left join v_cust_bal_point v on v.object_id = t.id
where lower(t.code) = lower(:vs_code )
and lower(t.object_ref_Table) = lower(:vs_obj_type)
and t.company_id = :vdb_company_id
and t.branch_id = :vdb_branch_id
using sqlca;


if sqlca.sqlcode = 0 then
	return ldb_id
else
	gf_messagebox('m.b_obj_instantiate.f_get_object_id.01','Thông báo','Không tìm thấy ID đối tượng có MÃ là:@'+string(vs_code),'exclamation','ok',1) 		
	return -1
end if
end function

public function integer f_upd_cust_point (double vdb_doc_id, date vd_transdate, double vdb_cust_id, double vdb_measurement_id, long vl_used_point, long vl_cust_point, ref t_transaction rt_transaction);
// insert vào measuremetn_trans --//
insert into MEASUREMENT_TRANS ( ID ,
											  OBJECT_ID     ,
											  TRANS_DATE  ,
											  DOC_REF_ID  ,
											  DOC_REF_TYPE  ,
											  DOWN_VALUE  ,
											  MEASUREMENT_ID  ,
											  BAL_VALUE  ,
											  SOB  ,											 
											  COMPANY_ID    ,
											  BRANCH_ID  ,
											  CREATED_BY   ,
											  CREATED_DATE ,
											  LAST_MDF_BY  ,
											  LAST_MDF_DATE  )
select seq_table_id.nextval,:vdb_cust_id, :vd_transdate,:vdb_doc_id, 'RETAIL' , :vl_used_point,:vdb_measurement_id, 
		:vl_cust_point - :vl_used_point, :gs_sob, :gi_user_comp_id, :gdb_branch, :gi_userid, sysdate, :gi_userid, sysdate 
from dual
using rt_transaction;

return rt_transaction.sqlcode
end function

public function integer f_upd_cust_point (t_dw_pos vdw_bill_line, t_dw_pos vdw_doc_hdr, t_ds_db vds_bonus_point, long vl_bal_point, ref t_transaction rt_transaction);int			li_row, ll_bonus_row
long		ll_point, ll_bal_point
decimal	ldc_amt, ldc_point_qty, ldc_point_amt, ldc_bonus_pct
double	ldb_item_id, ldb_cust_id, ldb_bonus_id, ldb_doc_id
//string		ls_idStr
date		ld_transdate

if vds_bonus_point.rowcount() = 0 then return 0
if isnull(vl_bal_point) then vl_bal_point = 0
ldb_cust_id = vdw_doc_hdr.getitemnumber(1,'dr_cr_object')
if isnull(ldb_cust_id) or ldb_cust_id = 0 then return 0
ldb_bonus_id = vds_bonus_point.getitemnumber(1, 'id')

//-- tính số điểm của bill --//
For li_row =1 to vdw_bill_line.rowcount()
	ldb_item_id = vdw_bill_line.getitemnumber(li_row, 'ITEM_ID')	
	ll_bonus_row = vds_bonus_point.find(" pos(item_id_str, ';"+string(ldb_item_id)+";'", 1, vds_bonus_point.rowcount() ) 
	if ll_bonus_row > 0 then	
		ldc_bonus_pct = vds_bonus_point.getitemnumber(ll_bonus_row , 'get_pct')
		if isnull(ldc_bonus_pct) then ldc_bonus_pct = 0
		ldc_point_amt = vds_bonus_point.getitemnumber(1, 'F_LEVEL_NUM')
		if isnull(ldc_point_amt) or ldc_point_amt = 0 then ldc_point_amt = 1	
		ldc_point_qty = vds_bonus_point.getitemnumber(1, 'T_LEVEL_NUM')
		if isnull(ldc_point_qty) or ldc_point_qty = 0 then ldc_point_amt = 1		
		
		
		ldc_amt =  vdw_bill_line.getitemnumber(li_row, 'amount')
		if isnull(ldc_amt) then ldc_amt = 0
		ll_point += truncate((ldc_amt *ldc_bonus_pct /100) / ldc_point_amt*ldc_point_qty , 0)
	end if
NEXT
if ll_point = 0 then return 0
ll_bal_point = ll_point + vl_bal_point
ldb_doc_id = vdw_doc_hdr.getitemnumber(1, 'id')
ld_transdate = date(vdw_doc_hdr.getitemdatetime(1, 'document_date'))
// insert vào measuremetn_trans --//
insert into MEASUREMENT_TRANS ( ID ,
											  OBJECT_ID     ,
											  TRANS_DATE  ,
											  DOC_REF_ID  ,
											  DOC_REF_TYPE  ,
											  UP_VALUE  ,
											  MEASUREMENT_ID  ,
											  BAL_VALUE  ,
											  SOB  ,											 
											  COMPANY_ID    ,
											  BRANCH_ID  ,
											  CREATED_BY   ,
											  CREATED_DATE ,
											  LAST_MDF_BY  ,
											  LAST_MDF_DATE  )
select seq_table_id.nextval,:ldb_cust_id, :ld_transdate,:ldb_doc_id, 'RETAIL' , :ll_point,:ldb_bonus_id, :ll_bal_point, :gs_sob, :gi_user_comp_id, :gdb_branch, :gi_userid, sysdate, :gi_userid, sysdate 
from dual
using rt_transaction;

return rt_transaction.sqlcode
end function

public function integer f_get_object_id_name_n_point (string vs_code, string vs_obj_type, double vdb_company_id, double vdb_branch_id, ref double rdb_obj_id, ref string rs_obj_name, ref long rl_point, ref t_transaction rt_transaction);
double	ldb_id
setnull(ldb_id)

if isnull(vs_code) then return ldb_id
	 
select count(id)	 into :ldb_id 
from object 
where lower(code) = lower(:vs_code )
and lower(object_ref_Table) = lower(:vs_obj_type)
and company_id = :vdb_company_id
and branch_id = :vdb_branch_id
using rt_transaction;

if ldb_id = 0 then return 0

if lower(vs_obj_type) = 'customer' then
	select t.id, t.name, v.bal_value into :rdb_obj_id,  :rs_obj_name, :rl_point
	from object t 
	left join v_cust_bal_point v on v.object_id = t.id
	where lower(t.code) = lower(:vs_code )
	and lower(t.object_ref_Table) = lower(:vs_obj_type)
	and t.company_id = :vdb_company_id
	and t.branch_id = :vdb_branch_id
	using rt_transaction;
elseif lower(vs_obj_type) = 'staff' then
	select t.id, t.name, v.bal_value into :rdb_obj_id,  :rs_obj_name, :rl_point
	from object t 
	left join v_staff_bal_point v on v.object_id = t.id
	where lower(t.code) = lower(:vs_code )
	and lower(t.object_ref_Table) = lower(:vs_obj_type)
	and t.company_id = :vdb_company_id
	and t.branch_id = :vdb_branch_id
	using rt_transaction;	
end if

if rt_transaction.sqlcode = 0 then
	return ldb_id
else
	gf_messagebox('m.b_obj_instantiate.f_get_object_id.01','Thông báo','Không tìm thấy ID đối tượng có MÃ là:@'+string(vs_code),'exclamation','ok',1) 		
	return -1
end if
end function

public function integer f_upd_bonus_point (t_dw_pos vdw_bill_line, t_dw_pos vdw_doc_hdr, t_ds_db vds_bonus_point, t_ds_db vds_bonus_point_staff, double vdb_staff_id, long vl_bal_point, long vl_bal_point_staff, ref t_transaction rt_transaction);int			li_row, ll_bonus_row
long		ll_point, ll_bal_point, ll_point_staff, ll_bal_point_staff
decimal	ldc_amt, ldc_point_qty, ldc_point_amt, ldc_bonus_pct
double	ldb_item_id, ldb_cust_id, ldb_bonus_id, ldb_doc_id, ldb_bonus_id_staff
//string		ls_idStr
date		ld_transdate

if vds_bonus_point.rowcount() = 0 and vds_bonus_point_staff.rowcount()=0 then return 0
if isnull(vl_bal_point) then vl_bal_point = 0
if isnull(vl_bal_point_staff) then vl_bal_point_staff = 0

ldb_cust_id = vdw_doc_hdr.getitemnumber(1,'dr_cr_object')
if (isnull(ldb_cust_id) or ldb_cust_id = 0) and vdb_staff_id = 0 then return 0


//-- tính số điểm của bill --//

For li_row =1 to vdw_bill_line.rowcount()
	ldb_item_id = vdw_bill_line.getitemnumber(li_row, 'ITEM_ID')	
	
	//-- calc cust point --//
	if ldb_cust_id > 0 and  vds_bonus_point.rowcount() > 0 then
		ll_bonus_row = vds_bonus_point.find(" pos(item_id_str, ';"+string(ldb_item_id)+";')>0", 1, vds_bonus_point.rowcount() ) 
		if ll_bonus_row > 0 then	
			ldb_bonus_id = vds_bonus_point.getitemnumber(1, 'id')
			ldc_bonus_pct = vds_bonus_point.getitemnumber(ll_bonus_row , 'get_pct')
			if isnull(ldc_bonus_pct) then ldc_bonus_pct = 0
			ldc_point_amt = vds_bonus_point.getitemnumber(1, 'F_LEVEL_NUM')
			if isnull(ldc_point_amt) or ldc_point_amt = 0 then ldc_point_amt = 1	
			ldc_point_qty = vds_bonus_point.getitemnumber(1, 'T_LEVEL_NUM')
			if isnull(ldc_point_qty) or ldc_point_qty = 0 then ldc_point_amt = 1				
			
			ldc_amt =  vdw_bill_line.getitemnumber(li_row, 'amount')
			if isnull(ldc_amt) then ldc_amt = 0
			ll_point += truncate((ldc_amt *ldc_bonus_pct /100) / ldc_point_amt*ldc_point_qty , 0)
		end if
	end if
	//-- calc staff point --//
	if vdb_staff_id > 0 and vds_bonus_point_staff.rowcount() > 0 then
		ll_bonus_row = vds_bonus_point_staff.find(" pos(item_id_str, ';"+string(ldb_item_id)+";')>0", 1, vds_bonus_point_staff.rowcount() ) 
		if ll_bonus_row > 0 then	
			ldb_bonus_id_staff = vds_bonus_point_staff.getitemnumber(1, 'id')
			ldc_bonus_pct = vds_bonus_point_staff.getitemnumber(ll_bonus_row , 'get_pct')
			if isnull(ldc_bonus_pct) then ldc_bonus_pct = 0
			ldc_point_amt = vds_bonus_point_staff.getitemnumber(1, 'F_LEVEL_NUM')
			if isnull(ldc_point_amt) or ldc_point_amt = 0 then ldc_point_amt = 1	
			ldc_point_qty = vds_bonus_point_staff.getitemnumber(1, 'T_LEVEL_NUM')
			if isnull(ldc_point_qty) or ldc_point_qty = 0 then ldc_point_amt = 1				
			
			ldc_amt =  vdw_bill_line.getitemnumber(li_row, 'amount')
			if isnull(ldc_amt) then ldc_amt = 0
			ll_point_staff += truncate((ldc_amt *ldc_bonus_pct /100) / ldc_point_amt*ldc_point_qty , 0)
		end if	
	end if
NEXT
if ll_point = 0 and ll_point_staff = 0 then return 0

ll_bal_point = ll_point + vl_bal_point
ll_bal_point_staff = ll_point_staff + vl_bal_point_staff

ldb_doc_id = vdw_doc_hdr.getitemnumber(1, 'id')
ld_transdate = date(vdw_doc_hdr.getitemdatetime(1, 'document_date'))
// insert vào measuremetn_trans : cust point--//
if ll_point > 0 then
	insert into MEASUREMENT_TRANS ( ID ,
												  OBJECT_ID     ,
												  TRANS_DATE  ,
												  DOC_REF_ID  ,
												  DOC_REF_TYPE  ,
												  UP_VALUE  ,
												  MEASUREMENT_ID  ,
												  BAL_VALUE  ,
												  SOB  ,											 
												  COMPANY_ID    ,
												  BRANCH_ID  ,
												  CREATED_BY   ,
												  CREATED_DATE ,
												  LAST_MDF_BY  ,
												  LAST_MDF_DATE  )
	select seq_table_id.nextval,:ldb_cust_id, :ld_transdate,:ldb_doc_id, 'RETAIL' , :ll_point,:ldb_bonus_id, :ll_bal_point, :gs_sob, :gi_user_comp_id, :gdb_branch, :gi_userid, sysdate, :gi_userid, sysdate 
	from dual
	using rt_transaction;
end if

// insert vào measuremetn_trans : staff point--//
if ll_point_staff > 0 then
	insert into MEASUREMENT_TRANS ( ID ,
												  OBJECT_ID     ,
												  TRANS_DATE  ,
												  DOC_REF_ID  ,
												  DOC_REF_TYPE  ,
												  UP_VALUE  ,
												  MEASUREMENT_ID  ,
												  BAL_VALUE  ,
												  SOB  ,											 
												  COMPANY_ID    ,
												  BRANCH_ID  ,
												  CREATED_BY   ,
												  CREATED_DATE ,
												  LAST_MDF_BY  ,
												  LAST_MDF_DATE  )
	select seq_table_id.nextval,:vdb_staff_id, :ld_transdate,:ldb_doc_id, 'RETAIL' , :ll_point_staff,:ldb_bonus_id_staff, :ll_bal_point_staff, :gs_sob, :gi_user_comp_id, :gdb_branch, :gi_userid, sysdate, :gi_userid, sysdate 
	from dual
	using rt_transaction;
end if

return rt_transaction.sqlcode
end function

public function boolean f_is_branch_yn_ex (string vs_object, ref t_transaction rt_transaction);
int			li_cnt


select count(ID) into :li_cnt
from DWCOLUMN_SETUP_HDR 
where branch_yn = 'Y' and lower(object) = 'u_dwcolumn_setup'  using rt_transaction;

if li_cnt > 0 then //-- cài đặt bảng phân biệt chi nhánh
	select count(ID) into :li_cnt
	from DWCOLUMN_SETUP_HDR 
	where branch_yn = 'Y' and upper(object) = upper(:vs_object) and branch_id = :gdb_branch using rt_transaction;	
	if li_cnt > 0 then
		return true
	else
		return false
	end if 
else //-- cài đặt bảng KHÔNG phân biệt chi nhánh
	select count(ID) into :li_cnt
	from DWCOLUMN_SETUP_HDR 
	where branch_yn = 'Y' and upper(object) = upper(:vs_object)  using rt_transaction;	
	if li_cnt > 0 then
		return true
	else
		return false
	end if 		
end if



end function

public function string f_get_branch_name_ex (double vdb_branch_id);int			li_cnt
string		ls_name

t_transaction		lt_transaction

//-- Tạo connection voi database --//
lt_transaction = create t_transaction
lt_transaction.dbms =	SQLCA.DBMS
lt_transaction.ServerName	 = SQLCA.ServerName
lt_transaction.LogId	 = SQLCA.LogId
lt_transaction.LogPass 	 = SQLCA.LogPass 
lt_transaction.AutoCommit 	 = false 
lt_transaction.DBParm	 = SQLCA.DBParm
connect using	lt_transaction;	

select count(id) into :li_cnt from legal_entity where id = :vdb_branch_id using lt_transaction;
if li_cnt <> 1 then return ''

select name into :ls_name from legal_entity where id = :vdb_branch_id using lt_transaction;

disconnect using	lt_transaction;	
destroy lt_transaction

return ls_name

end function

public function string f_get_branch_name (double vdb_branch_id);int			li_cnt
string		ls_name
	

select count(id) into :li_cnt from legal_entity where id = :vdb_branch_id using sqlca;
if li_cnt <> 1 then return ''

select name into :ls_name from legal_entity where id = :vdb_branch_id using sqlca;


return ls_name

end function

public function string f_get_menu_code (double vdb_id, ref t_transaction rt_transaction);
string	ls_code

//setnull(ls_code)
if isnull(vdb_id) then return ls_code

select code into :ls_code from menu where id = :vdb_id using rt_transaction;


if rt_transaction.sqlcode = 0 then
	return ls_code
else
	gf_messagebox('m.b_obj_instantiate.f_get_object_code.01','Thông báo','Không tìm thấy MENU có ID:@'+string(vdb_id),'exclamation','ok',1) 			
	return ls_code
end if
end function

public function integer f_get_item_code_n_name_spec_ex (double vdb_id, ref string rs_code, ref string rs_name, ref string rs_spec, ref t_transaction rt_transaction);

//setnull(ls_code)
if isnull(vdb_id) then return 0

select object.code, object.name, item.spec_desc into :rs_code , :rs_name , :rs_spec
from object join item on item.object_ref_id = object.id
where object.id = :vdb_id using rt_transaction;

if rt_transaction.sqlcode = 0 then
	return 1
else
	gf_messagebox('m.b_obj_instantiate.f_get_object_code_n_name.01','Thông báo','Không tìm thấy mã đối tượng có ID:@'+string(vdb_id),'exclamation','ok',1) 			
	return 0
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

public function integer f_get_stock_uom_ex (string vs_item_code, ref double rdb_stock_uom, ref string rs_uom_code, ref t_transaction rt_transaction);
int			li_cnt

select count (object.id) into :li_cnt
from object join item on item.object_ref_id = object.id
where lower(object.code) = lower(:vs_item_code) using rt_transaction;

if li_cnt > 1 then
	gf_messagebox('m.b_obj_instantiate.f_get_stock_uom2.01','Thống báo','Lỗi: Bảng ITEM có nhiều hơn 1 record cho mã hàng:@'+vs_item_code,'stop','ok',1)
	return -1
elseif li_cnt = 0 then
	gf_messagebox('m.b_obj_instantiate.f_get_stock_uom2.02','Thống báo','Không có mã hàng có mã:@'+vs_item_code,'stop','ok',1)
	return -1	
end if

select item.stock_uom, uom.code into :rdb_stock_uom, :rs_uom_code
from object 
join item on item.object_ref_id = object.id
join uom on uom.id = item.stock_uom
where lower(object.code) = lower(:vs_item_code) using rt_transaction;

return 1
end function

public function integer f_get_object_code_n_name_ex (double vdb_id, ref string rs_code, ref string rs_name, ref t_transaction rt_transaction);

//setnull(ls_code)
if isnull(vdb_id) then return 0

select code, name into :rs_code , :rs_name from object where id = :vdb_id using rt_transaction;
if rt_transaction.sqlcode = 100 then
	select code, name into :rs_code , :rs_name from legal_entity where id = :vdb_id using rt_transaction;
end if

if rt_transaction.sqlcode = 100 then
	select code, name into :rs_code , :rs_name from valueset_value where id = :vdb_id using rt_transaction;
end if

if rt_transaction.sqlcode = 100 then
	select code, name into :rs_code , :rs_name from uom where id = :vdb_id using rt_transaction;
end if

if rt_transaction.sqlcode = 0 then
	return 1
else
	gf_messagebox('m.b_obj_instantiate.f_get_object_code_n_name.01','Thông báo','Không tìm thấy mã đối tượng có ID:@'+string(vdb_id),'exclamation','ok',1) 			
	return 0
end if
end function

public function integer f_get_item_code_n_name_uom_ex (double vdb_id, ref string rs_code, ref string rs_name, ref string rs_unit_code, ref double rdb_unit_id, ref t_transaction rt_transaction);

//setnull(ls_code)
if isnull(vdb_id) then return 0

select object.code, object.name, uom.code, uom.id into :rs_code , :rs_name , :rs_unit_code , :rdb_unit_id 
from object join item on item.object_ref_id = object.id
				join uom on uom.id= item.stock_uom
where object.id = :vdb_id using rt_transaction;

if rt_transaction.sqlcode = 0 then
	return 1
else
	gf_messagebox('m.b_obj_instantiate.f_get_object_code_n_name.01','Thông báo','Không tìm thấy mã đối tượng có ID:@'+string(vdb_id),'exclamation','ok',1) 			
	return 0
end if
end function

public function integer f_update_line_itemchanged_ex (string vs_edit_colname, string vs_editdata, string vs_upd_colname, long vl_line_row, ref t_dw_mpl rdw_line, ref t_transaction rt_transaction, s_str_data vstr_currency);		/*--------------------------------------------------------------------------///
		Mô tả chức năng:1
		---------------------------------

-----------------------------------------------------------------------------------------
Hàm này đươc gọi sau khi đã cập nhật giá từ bảng giá cho dw-line
================================================	*/	
double				ldb_base_cur, ldb_round_id_base_amt, ldb_round_id_base_price, ldb_round_id_amt, ldb_round_id_price
dec					ldb_amount, ldb_base_amount, ldc_qty, ldc_price, ldc_vat_amt, ldc_vat_pct, ldc_disc_amt, ldc_disc_pct, ldb_amount_tmp
dec					ldc_base_price, ldc_act_qty, ldc_act_price, ldc_act_amount, ldc_PRICE_EX_TAX, ldc_AMOUNT_EX_TAX, ldc_BASE_AMOUNT_EX_TAX
dec					ldc_ACT_PRICE_EX_TAX, ldc_ACT_AMOUNT_EX_TAX, ldc_ACT_BASE_AMOUNT_EX_TAX, ldc_qty_tmp
string					ls_base_curcode,ls_base_curname, lsa_colname[]
int						li_colCnt, li_idx
c_string				lc_string
c_unit_instance		lc_unit

if not rdw_line.ib_excel_copying then
	connect using rt_transaction;
end if
 //-- chuẩn bị cho làm tròn  --//
lc_unit.f_get_base_cur_ex(ldb_base_cur,  ls_base_curcode,ls_base_curname, rt_transaction)
if ldb_base_cur > 0 then 
	ldb_round_id_base_amt =  lc_unit.f_get_round_id_ex( ldb_base_cur, 0, 'amount', rt_transaction)
	ldb_round_id_base_price =  lc_unit.f_get_round_id_ex( ldb_base_cur, 0, 'price', rt_transaction)
end if
if vstr_currency.adb_data[1] <> ldb_base_cur then
	ldb_round_id_amt =  lc_unit.f_get_round_id_ex( vstr_currency.adb_data[1], 0, 'amount', rt_transaction)
	ldb_round_id_price =  lc_unit.f_get_round_id_ex( vstr_currency.adb_data[1], 0, 'price', rt_transaction)	
else
	ldb_round_id_amt = ldb_round_id_base_amt
	ldb_round_id_price = ldb_round_id_base_price
end if
//-- tính toán lại giá trị các cột liên quan--//	
if vs_edit_colname = 'qty' then
	ldc_qty = dec(vs_editdata)
	ldc_price = rdw_line.getitemnumber(vl_line_row, 'price')		
	
	if rdw_line.describe('discount_pct.coltype') = 'number' then		
		ldc_disc_pct  = rdw_line.getitemnumber(vl_line_row, 'discount_pct')	
	elseif rdw_line.describe('disc_pct.coltype') = 'number' then	
		ldc_disc_pct  = rdw_line.getitemnumber(vl_line_row, 'disc_pct')	
	end if
	if isnull(ldc_disc_pct) then ldc_disc_pct = 0
	
	//-- amount --//
	ldb_amount = lc_unit.f_round( rt_transaction, ldb_round_id_amt, ldc_price*ldc_qty)	
	//--act_price --//
	if ldc_disc_pct = 0 and ldc_disc_amt = 0 and ldc_price > 0 then	
		ldc_act_price = ldc_price
	elseif ldc_price > 0 then
		ldc_act_price= lc_unit.f_round( rt_transaction, ldb_round_id_price, ldc_price/(1 + ldc_disc_pct/100))
	else
		if rdw_line.dataobject <> 'd_po_line_grid' and rdw_line.dataobject <> 'd_pur_invoice_line_grid'  then //PO không có act_price--//
			ldc_act_price =  rdw_line.getitemnumber(vl_line_row, 'act_price')	 
			if isnull(ldc_act_price) then ldc_act_price = 0
		end if
	end if
	//--  act_amount--//
	ldc_act_amount = lc_unit.f_round( rt_transaction, ldb_round_id_amt, ldc_act_price*ldc_qty)
	//-- disc amount --//	
	if ldc_price > 0 then
		ldc_disc_amt = ldb_amount -  ldc_act_amount
	else
		ldc_disc_amt = 0
	end if
	
	//-- base_amount--//
	if vstr_currency.adb_data[1] = ldb_base_cur then
		ldb_base_amount = ldc_act_amount	
	else
		ldc_base_price =  rdw_line.getitemnumber(vl_line_row, 'base_price')	
		ldb_base_amount = ldc_base_price * ldc_qty
		ldb_base_amount = lc_unit.f_round( rt_transaction, ldb_round_id_base_amt, ldb_base_amount)
	end if
	//--vat--//
	if rdw_line.describe('vat.coltype') = 'number' then
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'vat')					
	elseif rdw_line.describe('tax_pct.coltype') = 'number' then
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'tax_pct')	
	end if
	if isnull(ldc_vat_pct) then ldc_vat_pct = 0
	ldc_vat_amt = lc_unit.f_round( rt_transaction, ldb_round_id_base_amt, ldb_base_amount*ldc_vat_pct/100) 
	//--amount_ex_tax--//
	ldc_AMOUNT_EX_TAX = ldc_act_amount
	//--base_amount_ex_tax--//
	ldc_BASE_AMOUNT_EX_TAX = ldb_base_amount
	//-- act_qty--//
	ldc_act_qty = ldc_qty	
	//--act_amount_ex_tax--//
	ldc_ACT_AMOUNT_EX_TAX = ldc_AMOUNT_EX_TAX
	//--act_base_amount_ex_tax--//
	ldc_ACT_BASE_AMOUNT_EX_TAX = ldc_BASE_AMOUNT_EX_TAX
elseif vs_edit_colname = 'price' then
	
	ldc_price = double(vs_editdata)
	ldc_price_ex_tax = ldc_price
	ldc_qty = rdw_line.getitemnumber(vl_line_row, 'qty')	
	
	//-- reset disc--//
	ldc_disc_pct = 0
	ldc_disc_amt = 0
	
	//-- act_price --//
	ldc_act_price = ldc_price
	//-- base_price--//
	if vstr_currency.adb_data[1] = ldb_base_cur then
		ldc_base_price = ldc_price
	else
		ldc_base_price = ldc_price * vstr_currency.adb_data[2]
		ldc_base_price = lc_unit.f_round( rt_transaction, ldb_round_id_base_price, ldc_base_price)
	end if
	//--act_amount --//
	ldc_act_amount =  lc_unit.f_round( rt_transaction, ldb_round_id_amt, ldc_act_price*ldc_qty)
	//-- amount--//
	if ldc_disc_pct = 0 and ldc_disc_amt = 0 then
		ldb_amount = lc_unit.f_round( rt_transaction, ldb_round_id_amt, ldc_price*ldc_qty)
	else
		ldb_amount= lc_unit.f_round( rt_transaction, ldb_round_id_amt, ldc_price*ldc_qty/(1 + ldc_disc_pct/100))
	end if	
	//-- base_amount--//
	if vstr_currency.adb_data[1] = ldb_base_cur then
		ldb_base_amount = ldb_amount	
	else
		ldb_base_amount = ldb_amount * vstr_currency.adb_data[2]
		ldb_base_amount = lc_unit.f_round( rt_transaction, ldb_round_id_base_amt, ldb_base_amount)
	end if
	//--vat--//
	if rdw_line.describe('vat.coltype') = 'number' then
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'vat')				
	else
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'tax_pct')	
	end if
	if isnull(ldc_vat_pct) then ldc_vat_pct = 0
	ldc_vat_amt = lc_unit.f_round( rt_transaction, ldb_round_id_base_amt, ldb_base_amount*ldc_vat_pct/100) 
	//--amount_ex_tax--//
	ldc_AMOUNT_EX_TAX = ldc_act_amount
	//--base_amount_ex_tax--//
	ldc_BASE_AMOUNT_EX_TAX = ldb_base_amount
	//-- act_qty--//
	ldc_act_qty = ldc_qty	
	//--act_amount_ex_tax--//
	ldc_ACT_AMOUNT_EX_TAX = ldc_AMOUNT_EX_TAX
	//--act_base_amount_ex_tax--//
	ldc_ACT_BASE_AMOUNT_EX_TAX = ldc_BASE_AMOUNT_EX_TAX
	
elseif vs_edit_colname = 'amount' then
	ldb_amount = double(vs_editdata)
	ldc_qty = rdw_line.getitemnumber(vl_line_row, 'qty')	
	if isnull(ldc_qty) or ldc_qty = 0 then ldc_qty = 1	

	//-- reset discount: nếu có--//
	ldc_disc_pct  = 0
	ldc_disc_amt  =  0
	//-- price--//
	ldc_price = lc_unit.f_round( rt_transaction, ldb_round_id_base_price, ldb_amount/ldc_qty)
	ldc_price_ex_tax = ldc_price
	//--base_price--//
	if vstr_currency.adb_data[1] = ldb_base_cur then
		ldc_base_price = ldc_price
	else
		ldc_base_price = ldc_price * vstr_currency.adb_data[2]
		ldc_base_price = lc_unit.f_round( rt_transaction, ldb_round_id_price, ldc_base_price)
	end if	
	//-- base_amount--//
	if vstr_currency.adb_data[1] = ldb_base_cur then
		ldb_base_amount = ldb_amount	
	else
		ldb_base_amount = ldb_amount * vstr_currency.adb_data[2]
		ldb_base_amount = lc_unit.f_round( rt_transaction, ldb_round_id_base_amt, ldb_base_amount)
	end if
	//--vat--//
	if rdw_line.describe('vat.coltype') = 'number' then
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'vat')				
	elseif rdw_line.describe('tax_pct.coltype') = 'number' then
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'tax_pct')	
	end if
	if isnull(ldc_vat_pct) then ldc_vat_pct = 0
	ldc_vat_amt = lc_unit.f_round( rt_transaction, ldb_round_id_base_amt, ldb_base_amount*ldc_vat_pct/100) 
	//--amount_ex_tax--//
	ldc_AMOUNT_EX_TAX = ldb_amount
	//--base_amount_ex_tax--//
	ldc_BASE_AMOUNT_EX_TAX = ldb_base_amount
	//-- act_qty--//
//	ldc_act_qty = ldc_qty	
	//--act_amount--//
//	ldc_act_amount = ldb_amount
	//--act_amount_ex_tax--//
//	ldc_ACT_AMOUNT_EX_TAX = ldc_AMOUNT_EX_TAX
	//--act_base_amount_ex_tax--//
//	ldc_ACT_BASE_AMOUNT_EX_TAX = ldc_BASE_AMOUNT_EX_TAX 	
elseif vs_edit_colname = 'base_amount' then	
	ldb_base_amount = double(vs_editdata)
	ldc_qty = rdw_line.getitemnumber(vl_line_row, 'qty')	
	if isnull(ldc_qty) then ldc_qty = 0 
	ldc_price = rdw_line.getitemnumber(vl_line_row, 'price')	
	if isnull(ldc_price) then ldc_price = 0
	
	//-- reset discount: nếu có--//
	if ldc_price > 0 then
		if  ldb_base_amount > 0 then
			ldc_disc_pct  = round(( ldc_qty *ldc_price *   vstr_currency.adb_data[2] -  ldb_base_amount ) / ldb_base_amount *100, 0)		
		else 
			ldc_disc_pct = 100
		end if			
	else
		ldc_disc_pct = 0
	end if
	
	//-- base_price--//
	if ldc_qty <> 0 then
		ldc_base_price = lc_unit.f_round( rt_transaction, ldb_round_id_base_price, ldb_base_amount/ldc_qty) 
	else
		ldc_base_price = ldb_base_amount
	end if
	//-- act_price--//
	if ldc_disc_pct <> -100 and ldc_price > 0 then //-- tính act_price theo price và discount --//
		ldc_act_price =  lc_unit.f_round( rt_transaction, ldb_round_id_price, ldc_price/(1 + ldc_disc_pct/100))	
	else
		ldc_act_price =  lc_unit.f_round( rt_transaction, ldb_round_id_price, ldb_base_amount / vstr_currency.adb_data[2])	
	end if
	

	//-- disc_amount --//
	if ldc_price > 0 then
		if  ldb_base_amount > 0 then
			ldc_disc_amt  =  ldc_qty *ldc_price  -  ldc_act_price *ldc_qty 
		else
			ldc_disc_amt =  ldc_qty *ldc_price 
		end if
	else
		ldc_disc_amt = 0
	end if
	//--vat--//
	if rdw_line.describe('vat.coltype') = 'number' then
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'vat')				
	else
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'tax_pct')	
	end if
	if isnull(ldc_vat_pct) then ldc_vat_pct = 0
	ldc_vat_amt = lc_unit.f_round( rt_transaction, ldb_round_id_base_amt, ldb_base_amount*ldc_vat_pct/100) 
	//--amount_ex_tax--//
//	ldc_AMOUNT_EX_TAX = ldb_amount
	//--base_amount_ex_tax--//
	ldc_BASE_AMOUNT_EX_TAX = ldb_base_amount
	//-- act_qty--//
//	ldc_act_qty = ldc_qty	
	//--act_amount--//
//	ldc_act_amount = ldb_amount
	//--act_amount_ex_tax--//
//	ldc_ACT_AMOUNT_EX_TAX = ldc_AMOUNT_EX_TAX
	//--act_base_amount_ex_tax--//
//	ldc_ACT_BASE_AMOUNT_EX_TAX = ldc_BASE_AMOUNT_EX_TAX 		
elseif vs_edit_colname = 'act_amount' then
	ldc_act_amount = double(vs_editdata)
	ldc_qty = rdw_line.getitemnumber(vl_line_row, 'qty')	
	if isnull(ldc_qty) then ldc_qty = 0
	ldc_price = rdw_line.getitemnumber(vl_line_row, 'price')	

	//-- act_price--//
	if ldc_qty <> 0 then
		ldc_act_price = lc_unit.f_round( rt_transaction, ldb_round_id_base_price, ldc_act_amount/ldc_qty)
	else
		ldc_act_price = ldc_act_amount
	end if
	ldc_price_ex_tax = ldc_act_price
	//--base_price--//
	if vstr_currency.adb_data[1] = ldb_base_cur then
		ldc_base_price = ldc_act_price
	else
		ldc_base_price = ldc_act_price * vstr_currency.adb_data[2]
		ldc_base_price = lc_unit.f_round( rt_transaction, ldb_round_id_base_price, ldc_base_price)
	end if	
	//-- base_amount--//
	if vstr_currency.adb_data[1] = ldb_base_cur then
		ldb_base_amount = ldc_act_amount	
	else
		ldb_base_amount = ldc_act_amount * vstr_currency.adb_data[2]
		ldb_base_amount = lc_unit.f_round( rt_transaction, ldb_round_id_base_amt, ldb_base_amount)
	end if

	//-- reset discount: nếu có--//
	if ldc_price > 0 then
		if  ldb_base_amount > 0 then
			ldc_disc_pct  = round(( ldc_qty *ldc_price   -  ldc_act_amount ) / ldc_act_amount *100, 0)
			ldc_disc_amt  =   (  ldc_qty *ldc_price  -  ldc_act_amount )
		else 
			ldc_disc_pct = 100
			ldc_disc_amt  =    ldc_qty *ldc_price
		end if
	else
		ldc_disc_pct = 0
		ldc_disc_amt = 0
	end if
	//--vat--//
	if rdw_line.describe('vat.coltype') = 'number' then
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'vat')				
	else
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'tax_pct')	
	end if
	if isnull(ldc_vat_pct) then ldc_vat_pct = 0
	ldc_vat_amt = lc_unit.f_round( rt_transaction, ldb_round_id_base_amt, ldb_base_amount*ldc_vat_pct/100) 
	//--amount_ex_tax--//
	ldc_AMOUNT_EX_TAX = ldc_act_amount
	//--base_amount_ex_tax--//
	ldc_BASE_AMOUNT_EX_TAX = ldb_base_amount
	//-- act_qty--//
//	ldc_act_qty = ldc_qty	
	//--act_amount--//
//	ldc_act_amount = ldb_amount
	//--act_amount_ex_tax--//
//	ldc_ACT_AMOUNT_EX_TAX = ldc_AMOUNT_EX_TAX
	//--act_base_amount_ex_tax--//
//	ldc_ACT_BASE_AMOUNT_EX_TAX = ldc_BASE_AMOUNT_EX_TAX 	

elseif vs_edit_colname = 'base_price' then	
	ldc_base_price = double(vs_editdata)
	ldc_qty = rdw_line.getitemnumber(vl_line_row, 'qty')		
	ldc_price = rdw_line.getitemnumber(vl_line_row, 'price')		
	//-- base_amount--//
	ldb_base_amount = ldc_base_price*	ldc_qty
	ldb_base_amount = lc_unit.f_round( rt_transaction, ldb_round_id_base_amt, ldb_base_amount) 
	//--vat--//
	if rdw_line.describe('vat.coltype') = 'number' then
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'vat')				
	else
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'tax_pct')	
	end if
	if isnull(ldc_vat_pct) then ldc_vat_pct = 0
		
	//-- reset discount: nếu có--//	
	if ldc_price > 0 then
		if  ldb_base_amount > 0 then		
			ldc_disc_pct  = round((ldc_price* ldc_qty* vstr_currency.adb_data[2] -  ldb_base_amount ) / ldb_base_amount *100, 0)
		else 
			ldc_disc_pct = 100
		end if
	else
		ldc_disc_pct = 0
	end if
	//-- act_price --//
	if ldc_disc_pct <> -100 and ldc_price > 0 then //-- tính act_price theo discount và price --//
		ldc_act_price =  lc_unit.f_round( rt_transaction, ldb_round_id_price, ldc_price/(1 + ldc_disc_pct/100))		
	else //-- tính act_price theo base_price --//
		ldc_act_price =   lc_unit.f_round( rt_transaction, ldb_round_id_price, ldc_base_price/ vstr_currency.adb_data[2])	
	end if
	//-- act_amount --//
	ldc_act_amount =  lc_unit.f_round( rt_transaction, ldb_round_id_amt, ldc_act_price * ldc_qty)
	//-- disc_amount--//
	if ldc_price > 0 then
		if  ldb_base_amount > 0 then
			ldc_disc_amt  =  ldc_qty *ldc_price  -  ldc_act_price *ldc_qty 
		else
			ldc_disc_amt =  ldc_qty *ldc_price 
		end if
	else
		ldc_disc_amt = 0
	end if
	ldc_vat_amt = lc_unit.f_round( rt_transaction, ldb_round_id_base_amt, ldb_base_amount*ldc_vat_pct/100) 
	//--amount_ex_tax--//
//	ldc_AMOUNT_EX_TAX = ldb_amount
	//--base_amount_ex_tax--//
	ldc_BASE_AMOUNT_EX_TAX = ldb_base_amount	
	
elseif vs_edit_colname = 'act_qty' then	
elseif vs_edit_colname = 'act_price' then
	ldc_act_price = double(vs_editdata)
	ldc_PRICE_EX_TAX = ldc_act_price
	ldc_qty = rdw_line.getitemnumber(vl_line_row, 'qty')	
	ldc_price = rdw_line.getitemnumber(vl_line_row, 'price')	
		
	//-- act_amount--//
	ldc_act_amount = lc_unit.f_round( rt_transaction, ldb_round_id_amt, ldc_act_price*ldc_qty)
	//-- base_amount--//
	if vstr_currency.adb_data[1] = ldb_base_cur then
		ldb_base_amount = ldc_act_amount	
	else
		ldb_base_amount = ldc_act_amount * vstr_currency.adb_data[2]
		ldb_base_amount = lc_unit.f_round( rt_transaction, ldb_round_id_base_amt, ldb_base_amount)
	end if
	//-- reset discount: nếu có--//	
	if ldc_price > 0 then
		if  ldc_act_amount > 0 then
			ldc_disc_pct  = round(( ldc_qty *ldc_price -  ldc_act_amount ) / ldc_act_amount *100, 0)
			ldc_disc_amt  =   (  ldc_qty *ldc_price   -  ldc_act_amount )
		else 
			ldc_disc_pct = 100
			ldc_disc_amt  =   ldc_qty *ldc_price
		end if		
	else
		ldc_disc_pct = 0
		ldc_disc_amt = 0
	end if
	//-- base_price --//
	ldc_base_price = ldc_act_price* vstr_currency.adb_data[2]
	ldc_base_price = lc_unit.f_round( rt_transaction, ldb_round_id_base_price, ldc_base_price)
	
	//--vat--//
	if rdw_line.describe('vat.coltype') = 'number' then
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'vat')				
	else
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'tax_pct')	
	end if
	if isnull(ldc_vat_pct) then ldc_vat_pct = 0
	ldc_vat_amt = lc_unit.f_round( rt_transaction, ldb_round_id_base_amt, ldb_base_amount*ldc_vat_pct/100) 
	//--amount_ex_tax--//
	ldc_AMOUNT_EX_TAX = ldc_act_amount
	//--base_amount_ex_tax--//
	ldc_BASE_AMOUNT_EX_TAX = ldb_base_amount
	//-- act_qty--//
	ldc_act_qty = ldc_qty	
	//--act_amount_ex_tax--//
	ldc_ACT_AMOUNT_EX_TAX = ldc_AMOUNT_EX_TAX
	//--act_base_amount_ex_tax--//
	ldc_ACT_BASE_AMOUNT_EX_TAX = ldc_BASE_AMOUNT_EX_TAX	
elseif vs_edit_colname = 'vat' then
	ldb_amount =  rdw_line.getitemnumber(vl_line_row, 'amount')	
	ldc_vat_pct = dec(vs_editdata )
	ldc_vat_amt = lc_unit.f_round( rt_transaction, ldb_round_id_base_amt, ldb_amount*ldc_vat_pct/100) 
elseif vs_edit_colname = 'tax_pct' then
	ldc_vat_pct = dec(vs_editdata )
	ldc_BASE_AMOUNT_EX_TAX = rdw_line.getitemnumber(vl_line_row, 'base_amount_ex_tax')	
	ldc_vat_amt = lc_unit.f_round( rt_transaction, ldb_round_id_base_amt, ldc_BASE_AMOUNT_EX_TAX*ldc_vat_pct/100) 
elseif vs_edit_colname = 'discount_pct' then
	ldc_disc_pct = dec(vs_editdata )
	ldc_qty = rdw_line.getitemnumber(vl_line_row, 'qty')	
	ldc_price = rdw_line.getitemnumber(vl_line_row, 'price')	
	
	if ldc_price = 0 or isnull(ldc_price) then
		gf_messagebox('m.b_obj_instantiate.f_update_line_itemchange_ex.01','Thông báo','Giá cài đặt = 0, không áp dụng CK','exclamation','ok',1)
		if not rdw_line.ib_excel_copying then
			disconnect using rt_transaction;
		end if		
		return -1
	end if
	ldb_amount_tmp =  ldc_qty * ldc_price
	//-- act_price--//
	ldc_act_price =  lc_unit.f_round( rt_transaction, ldb_round_id_price, ldc_price/(1 + ldc_disc_pct/100))	
	//-- act_amount--//
	ldc_act_amount = lc_unit.f_round( rt_transaction, ldb_round_id_amt, ldc_qty * ldc_act_price)
	//-- discount--//
	if ldc_price > 0 then
		ldc_disc_amt = ldb_amount_tmp - ldc_act_amount
	else
		ldc_disc_amt = 0
	end if
	//-- base_amount--//
	if vstr_currency.adb_data[1] = ldb_base_cur then
		ldb_base_amount = ldc_act_amount	
	else
		ldb_base_amount = ldc_act_amount * vstr_currency.adb_data[2]
		ldb_base_amount = lc_unit.f_round( rt_transaction, ldb_round_id_base_amt, ldb_base_amount)
	end if
	//-- base_price--//
	ldc_base_price = lc_unit.f_round( rt_transaction, ldb_round_id_base_price, ldc_act_price *  vstr_currency.adb_data[2])	
	//--vat--//
	if rdw_line.describe('vat.coltype') = 'number' then
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'vat')				
	else
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'tax_pct')	
	end if
	if isnull(ldc_vat_pct) then ldc_vat_pct = 0
	ldc_vat_amt = lc_unit.f_round( rt_transaction, ldb_round_id_base_amt, ldb_base_amount*ldc_vat_pct/100) 
	//--amount_ex_tax--//
	ldc_AMOUNT_EX_TAX = ldc_act_amount
	//--base_amount_ex_tax--//
	ldc_BASE_AMOUNT_EX_TAX = ldb_base_amount
	//-- act_qty--//
	ldc_act_qty = ldc_qty	
	//--act_amount_ex_tax--//
	ldc_ACT_AMOUNT_EX_TAX = ldc_AMOUNT_EX_TAX
	//--act_base_amount_ex_tax--//
	ldc_ACT_BASE_AMOUNT_EX_TAX = ldc_BASE_AMOUNT_EX_TAX	
elseif vs_edit_colname = 'discount' then	
	ldc_disc_amt  = dec(vs_editdata )
	ldc_qty = rdw_line.getitemnumber(vl_line_row, 'qty')		
	ldc_price = rdw_line.getitemnumber(vl_line_row, 'price')	
	if ldc_price = 0 or isnull(ldc_price) then
		gf_messagebox('m.b_obj_instantiate.f_update_line_itemchange_ex.01','Thông báo','Giá cài đặt = 0, không áp dụng CK','exclamation','ok',1)
		if not rdw_line.ib_excel_copying then
			disconnect using rt_transaction;
		end if			
		return -1
	end if	
	ldb_amount_tmp =  ldc_qty * ldc_price	
	
	//-- act_amount--//
	ldc_act_amount =  ldb_amount_tmp - ldc_disc_amt
	//-- discount_pct--//
	if ldc_price > 0 then
		ldc_disc_pct = round( ldc_disc_amt/ldc_act_amount *100, 0)
	else
		ldc_disc_pct = 0
	end if
	//-- act_price--//
	ldc_act_price =  lc_unit.f_round( rt_transaction, ldb_round_id_price, ldc_price/(1 + ldc_disc_pct/100))			
	//-- base_amount--//
	if vstr_currency.adb_data[1] = ldb_base_cur then
		ldb_base_amount = ldc_act_amount	
	else
		ldb_base_amount = ldc_act_amount * vstr_currency.adb_data[2]
		ldb_base_amount = lc_unit.f_round( rt_transaction, ldb_round_id_base_amt, ldb_base_amount)
	end if
	//-- base_price--//
	ldc_base_price = lc_unit.f_round( rt_transaction, ldb_round_id_base_price, ldc_act_price * vstr_currency.adb_data[2])

	//--vat--//
	if rdw_line.describe('vat.coltype') = 'number' then
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'vat')				
	else
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'tax_pct')	
	end if
	if isnull(ldc_vat_pct) then ldc_vat_pct = 0
	ldc_vat_amt = lc_unit.f_round( rt_transaction, ldb_round_id_base_amt, ldb_base_amount*ldc_vat_pct/100) 
	//--amount_ex_tax--//
	ldc_AMOUNT_EX_TAX = ldc_act_amount
	//--base_amount_ex_tax--//
	ldc_BASE_AMOUNT_EX_TAX = ldb_base_amount
	//-- act_qty--//
	ldc_act_qty = ldc_qty	
	//--act_amount_ex_tax--//
	ldc_ACT_AMOUNT_EX_TAX = ldc_AMOUNT_EX_TAX
	//--act_base_amount_ex_tax--//
	ldc_ACT_BASE_AMOUNT_EX_TAX = ldc_BASE_AMOUNT_EX_TAX		
elseif vs_edit_colname = 'disc_pct' then
	ldc_qty = rdw_line.getitemnumber(vl_line_row, 'qty')	
	ldc_price = rdw_line.getitemnumber(vl_line_row, 'price')		
	ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'vat')	
	ldc_disc_pct = dec(vs_editdata )
	if isnull(ldc_disc_pct) then ldc_disc_pct = 0
	ldc_disc_amt =  lc_unit.f_round( rt_transaction, ldb_round_id_base_price,  ldc_price*ldc_qty*ldc_disc_pct/100) 
	ldb_amount = ldc_price*ldc_qty - ldc_disc_amt
	ldb_base_amount = ldb_amount	
	ldc_vat_amt = lc_unit.f_round( rt_transaction, ldb_round_id_base_price, ldb_amount*ldc_vat_pct/100) 	
elseif vs_edit_colname = 'disc_amt' then
	ldc_qty = rdw_line.getitemnumber(vl_line_row, 'qty')	
	ldc_price = rdw_line.getitemnumber(vl_line_row, 'price')	
	ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'vat')	
	ldc_disc_amt = dec(vs_editdata )
	if isnull(ldc_disc_pct) then ldc_disc_pct = 0	
	ldb_amount = ldc_price*ldc_qty - ldc_disc_amt
	ldc_disc_pct =  round(ldc_disc_amt / (ldc_price*ldc_qty)*100,0)
	ldb_base_amount = ldb_amount	
	ldc_vat_amt = lc_unit.f_round( rt_transaction, ldb_round_id_base_price, ldb_amount*ldc_vat_pct/100) 
end if

//-- Cập nhật lại line --//
li_colCnt = lc_string.f_stringtoarray( vs_upd_colname, ';', lsa_colname[])
FOR li_idx = 1 to li_colCnt
	if  lsa_colname[li_idx] = 'price' then
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_price)
	elseif lsa_colname[li_idx] = 'amount' then
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_amount)
	elseif lsa_colname[li_idx] = 'base_amount' then
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_base_amount)
	elseif lsa_colname[li_idx] = 'base_price' then
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_base_price)	
	elseif lsa_colname[li_idx] = 'act_qty' then
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_act_qty)
	elseif lsa_colname[li_idx] = 'act_price' then
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_act_price)
	elseif lsa_colname[li_idx] = 'act_amount' then
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_act_amount)
	elseif  lsa_colname[li_idx] = 'price_ex_tax' then
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_price_ex_tax)
	elseif  lsa_colname[li_idx] = 'amount_ex_tax' then
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_amount_ex_tax)
	elseif  lsa_colname[li_idx] = 'base_amount_ex_tax' then
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_base_amount_ex_tax)	
	elseif  lsa_colname[li_idx] = 'act_price_ex_tax' then
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_act_price_ex_tax)
	elseif  lsa_colname[li_idx] = 'act_amount_ex_tax' then
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_act_amount_ex_tax)
	elseif  lsa_colname[li_idx] = 'act_base_amount_ex_tax' then
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_act_base_amount_ex_tax)
	elseif lsa_colname[li_idx] = 'vat_amount' then	
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_vat_amt)
	elseif lsa_colname[li_idx] = 'tax_correction' then	
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_vat_amt)
	elseif lsa_colname[li_idx] = 'tax_amt' then	
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_vat_amt)		
	elseif  lsa_colname[li_idx] = 'disc_pct' then	
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_disc_pct)
	elseif  lsa_colname[li_idx] = 'disc_amt' then	
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_disc_amt)		
	elseif  lsa_colname[li_idx] = 'discount' then	
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_disc_amt)
	elseif  lsa_colname[li_idx] = 'discount_pct' then	
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_disc_pct)
	end if						
NEXT

if not rdw_line.ib_excel_copying then
	disconnect using rt_transaction;
end if
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
	gf_messagebox('m.b_obj_instantiate.f_get_object_code.01','Thông báo','Không tìm thấy mã đối tượng có ID:@'+string(vdb_id),'exclamation','ok',1) 			
	return ls_code
end if
end function

public function double f_copy_to_po (s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial);string				ls_sql, ls_code, ls_currCode, ls_currName, ls_sql_cols, ls_update_table, ls_related_data, las_related_data[], ls_f_ref_table
string				ls_main_chk_cols, las_main_chk_cols[], ls_related_chk_cols, las_related_chk_cols[], ls_data_tmp, ls_f_versions
string				ls_sortString, ls_sqlUpdate, ls_sqlUpdate_where, ls_chkSum_val, ls_chkSum_tmp, ls_price, ls_updateCol
string				lsa_f_obj_column_chk[], lsa_t_obj_column_chk[],lsa_main_obj_column_sum[] , lsa_related_obj_column_sum[]
string				las_from_cols[], ls_from_cols, ls_sql_values, ls_coltype, ls_sql_exec, ls_from_match_cols, las_from_match_cols[], ls_mat_cols, las_mat_cols[]
double			ldb_id,ldb_f_doc_id, ldb_t_doc_id, ldb_version_id, ldb_trans_id, ldb_base_currID, ldb_mat_val, ldb_matched_val, ldb_f_ref_id, ldb_f_branch_id
double			ldb_f_version_id, ldb_branch, ldb_item_id
int					li_idx, li_idx1, li_idx2, li_row, li_colnbr, li_colCnt, li_pos, li_cnt, li_idx3, li_idx4
boolean			lb_found, lb_copied, lb_update_orders
any				laa_value[], laa_chk_data[]
t_ds_db					lds_handle
c_string					lc_string
c_unit_instance 		lc_unit_ins
u_choose_trans_po	lpo_choose_trans	
s_str_data				lstr_data, lstr_curr
c_unit_instance			l_unit

//--------------------------//
// lấy giao dịch của PO //
//-------------------------//
li_pos =  pos( vstr_dwo_related[1].s_data[1] , "(" )
if li_pos > 0 then
	ls_related_data = mid(vstr_dwo_related[1].s_data[1], li_pos +1, pos(vstr_dwo_related[1].s_data[1] , ')') - (li_pos +1) )
	li_cnt = lc_string.f_Stringtoarray( ls_related_data, ',', las_related_data[])
	FOR li_idx =1 to li_cnt
		ldb_f_doc_id = double(las_related_data[li_idx])
		select version_id into :ldb_f_version_id
		from document
		where id = :ldb_f_doc_id
		using rt_transaction;
		if ls_f_versions <> '' then ls_f_versions += ';'
		ls_f_versions += string(ldb_f_version_id)
	NEXT		
else
	las_related_data[1] = vstr_dwo_related[1].s_data[1]
end if
ldb_id = double(las_related_data[1] )



lds_handle = create t_ds_db
lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo
ls_update_table = lds_handle.describe( "datawindow.table.update")
if lower(ls_update_table) = 'document' then
	//--get doc version --//
	select t.version_id, t.branch_id into  :ldb_f_version_id, :ldb_branch
	from document t
	join trans_setup_hdr t1 on t1.id = t.trans_hdr_id		
	where t.company_id = :gi_user_comp_id
	and t.id =  :ldb_id
	using rt_transaction;		
	if ls_f_versions = '' then ls_f_versions = string(ldb_f_version_id)
	
	//-- copy header --//
	ldb_f_doc_id = ldb_id
	select count(t2.id) into :li_cnt
	from document t
	join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
	join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
	where t.company_id = :gi_user_comp_id
//	and t.branch_id = :gdb_branch
	and t.id =  :ldb_id
	using rt_transaction;
	if li_cnt = 1 then
		select t2.id, t.version_id, t.branch_id into :ldb_trans_id, :ldb_f_version_id, :ldb_branch
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
		where t.company_id = :gi_user_comp_id
//		and t.branch_id = :gdb_branch
		and t.id =  :ldb_id
		using rt_transaction;
	else			
		ldb_trans_id = 0
		ldb_branch = gdb_branch
	end if
else //-- copy line --//
	//--get doc version --//
	if vstr_dwo_related[1].s_main_obj_dwo = 'd_pr_line_grid' then
		select object_ref_id, branch_id into :ldb_f_version_id, :ldb_branch
		from pr_line t
		where t.id = :ldb_id
		and  t.company_id = :gi_user_comp_id
		using rt_transaction;
	elseif vstr_dwo_related[1].s_main_obj_dwo = 'd_so_line_grid' then
		select object_ref_id, branch_id into :ldb_f_version_id, :ldb_branch
		from so_line t
		where t.id = :ldb_id
		and  t.company_id = :gi_user_comp_id
		using rt_transaction;		
		
		ls_f_versions = string(ldb_f_version_id)
	end if
	
	select count(t2.id) 
	into :li_cnt
	from document t
	join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
	join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
	where t.company_id = :gi_user_comp_id
	and t.branch_id = :ldb_branch
	and t.version_id = :ldb_f_version_id
	using rt_transaction;
	
	if li_cnt = 1 then
		select t2.id, t.id into :ldb_trans_id, :ldb_f_doc_id
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
		where t.company_id = :gi_user_comp_id
		and t.branch_id = :ldb_branch
		and t.version_id =  :ldb_f_version_id
		using rt_transaction;
	else			
		ldb_trans_id = 0
		ldb_branch = gdb_branch
		select id into :ldb_f_doc_id from document t where t.version_id = :ldb_f_version_id using rt_transaction;
	end if	
end if

lpo_choose_trans = create u_choose_trans_po
lpo_choose_trans.is_object_type = 'PO'
lpo_choose_trans.f_set_main_id(ldb_trans_id )
lpo_choose_trans.idb_branch_id = ldb_branch
lpo_choose_trans.is_id_list = ls_f_versions
openwithparm( s_wr_multi_max, lpo_choose_trans)
// lấy trans_id trả về
lstr_data = message.powerobjectparm		
if not isvalid(lstr_data) then return 0
if lstr_data.s_data = 'cancel' then return 0

ldb_trans_id = lstr_data.adb_data[1]
lstr_curr.adb_data[1] = lstr_data.adb_data[3]

//---------------------//
// insert document  //
//--------------------//
ldb_t_doc_id = this.f_create_id_ex( rt_transaction)
ldb_version_id =  this.f_create_id_ex( rt_transaction)
ls_code = rdwsetup_initial.f_get_autonumber_ex('code','d_document_po_grid', rt_transaction)
ls_sql = "INSERT into DOCUMENT(id,company_id, branch_id,object_ref_table, created_by, created_date,last_mdf_by, last_mdf_date,"+&
									" doc_type, version_id, SOB, handled_by, CODE, document_date, TRANS_HDR_ID,status)" +&
			" VALUES("+string(ldb_t_doc_id)+ "," + string( gi_user_comp_id ) + "," + string( ldb_branch ) + ",'ORDERS' ," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate, " +&
						"'PO',"+string(ldb_version_id) +", 'F',"+string(gi_userid) + ",'"+ls_code +"', trunc(sysdate)"+ ","+string(ldb_trans_id) +", 'new')"
EXECUTE immediate :ls_sql using rt_transaction;

//--------------------//
// insert table  //
//--------------------//

FOR li_idx = 1 to upperbound(vstr_dwo_related[1].s_related_obj_dwo_copy[] )	
	lds_handle.dataobject = vstr_dwo_related[1].s_related_obj_dwo_copy[li_idx]
	ls_update_table = lds_handle.describe( "datawindow.table.update")	

	ls_sql = "INSERT into "+ls_update_table +"(company_id, branch_id, created_by, created_date,last_mdf_by, last_mdf_date,"				
	ls_sql_cols = vstr_dwo_related[1].s_related_obj_column_copy[li_idx]
	ls_sql_cols= trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))
	if right(ls_sql_cols,1) = ',' then 
		if upper(ls_update_table) = 'ORDERS' then
			ls_sql += ls_sql_cols + "version_no,doc_type,object_ref_table, object_ref_id,ID)"
		else
			ls_sql += ls_sql_cols + "object_ref_table, object_ref_id,ID)"
		end if		
	else
		if upper(ls_update_table) = 'ORDERS' then
			ls_sql += ls_sql_cols + ",version_no,doc_type,object_ref_table, object_ref_id,ID)"
		else
			ls_sql += ls_sql_cols + ",object_ref_table, object_ref_id,ID)"
		end if				
	end if
	ls_sql += " VALUES("+string( gi_user_comp_id ) + "," + string( ldb_branch ) + "," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate " 
	ls_from_cols = vstr_dwo_related[1].s_main_obj_column_copy[li_idx]
	li_colCnt = lc_string.f_stringtoarray( ls_from_cols, ';', las_from_cols[])
	//-- lấy mat cols--//
	if vstr_dwo_related[1].s_match_f_dwo[li_idx] = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
		ls_from_match_cols = vstr_dwo_related[1].s_match_f_column[li_idx]
		if pos(ls_from_match_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_from_match_cols , ';', las_from_match_cols[])
			ls_from_match_cols = las_from_match_cols[1]
		end if
		ls_mat_cols = vstr_dwo_related[1].s_match_column[li_idx]
		if pos(ls_mat_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_mat_cols , ';', las_mat_cols[])
			ls_mat_cols = las_mat_cols[1]
		end if			
	end if
	//-- lấy chk cols for update destination--//
	if  vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
		ls_related_chk_cols = vstr_dwo_related[1].s_related_obj_column_chk[li_idx]
		lc_string.f_stringtoarray( ls_related_chk_cols, ';', las_related_chk_cols[])
	end if
	//-- lấy chk cols source--//
	if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
		ls_main_chk_cols = vstr_dwo_related[1].s_main_obj_column_chk[li_idx]
		lc_string.f_stringtoarray( ls_main_chk_cols, ';', las_main_chk_cols[] )
	end if
	
	FOR li_idx1 = 1 to upperbound(vads_copied[])
		if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
			lb_found = true
			lb_update_orders = false
			FOR li_row = 1 to vads_copied[li_idx1].rowcount()
				//-- check match full--//
				if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_mat_val = vads_copied[li_idx1].getitemnumber(li_row, ls_from_match_cols)
					if isnull(ldb_mat_val) then ldb_mat_val = 0
					ldb_f_ref_id = vads_copied[li_idx1].getitemnumber(li_row, 'id')
					ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
					if isnull(ldb_matched_val) then ldb_matched_val = 0
					if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết--//
					if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
						 if isnull(vads_copied[li_idx1].getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
					end if								
				end if //-- kết thúc: check match full--//
				//-- check common values --//
				if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
					lb_update_orders = true
					for li_idx2 = 1 to upperbound(las_main_chk_cols[])
						if li_row = 1 then
							if lower(las_main_chk_cols[li_idx2]) = 'object_id' or lower(las_main_chk_cols[li_idx2]) = 'bill_to_object' then
								laa_chk_data[li_idx2] = lstr_data.adb_data[2]
							elseif lower(las_main_chk_cols[li_idx2]) = 'exchange_rate' then
								laa_chk_data[li_idx2] = l_unit.f_get_exchange_rate(lstr_data.adb_data[3] , gd_session_date , rt_transaction)
							elseif lower(las_main_chk_cols[li_idx2]) = 'currency_id' then
								laa_chk_data[li_idx2] = lstr_data.adb_data[3]
							else
								laa_chk_data[li_idx2] = vads_copied[li_idx1].f_getitemany(li_row, las_main_chk_cols[li_idx2])
							end if
						end if						
					next					
				end if
				
				//-- insert--//
				ldb_id = this.f_create_id_ex( rt_transaction)
				FOR li_colnbr= 1 to li_colCnt
					//-- get price from price list --//
					if vads_copied[li_idx1].dataobject =  vstr_dwo_related[1].s_dwo_get_price then
						if not vstr_dwo_related[1].b_get_price then 
							if pos(vstr_dwo_related[1].s_col_get_price[li_idx], las_from_cols[li_colnbr]+';') > 0 then
								ldb_item_id = vads_copied[li_idx1].getitemnumber(li_row,'item_id')
								ls_price =  string(this.f_get_pur_price(ldb_item_id, lstr_curr.adb_data[1], rt_transaction))
								if isnull(ls_price) then ls_price = 'NULL'
								ls_sql_values +="," + ls_price
								continue
							end if
						end if
					end if							
					
					ls_coltype = vads_copied[li_idx1].describe(las_from_cols[li_colnbr]+".coltype")
					if left(ls_coltype, 5) = 'numbe' then
						if las_from_cols[li_colnbr] = ls_from_match_cols then
							ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
						else
							if isnull(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr])) then
								ls_sql_values +=",NULL"
							else	
								ls_sql_values += "," + string(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr]))
							end if
						end if
					elseif left(ls_coltype, 5) = 'char(' then
						if isnull(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else						
							ls_sql_values += ",'" + string(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
						end if
					elseif  left(ls_coltype, 5) = 'datet' then
						if isnull(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else	
							ls_sql_values += ",to_date('" + string(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
						end if
					end if
				NEXT
				
				
				if upper(ls_update_table) = 'ORDERS' then					
					ls_sql_values += ",1,'PO','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) + ")"
				else
					ls_sql_values += ",'ORDERS',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
				end if				
				
				ls_sql_exec = ls_sql + ls_sql_values
				EXECUTE immediate :ls_sql_exec using rt_transaction;				
				ls_sql_values =''
				//-- update line itemchange khi get price from price list--//
				if not vstr_dwo_related[1].b_get_price and  vads_copied[li_idx1].dataobject =  vstr_dwo_related[1].s_dwo_get_price then
					ls_updateCol =  'base_price;amount;base_amount;base_amountex_tax;vat_amount;'
					this.f_update_line_itemchanged_ex( 'price', ls_price, ls_updateCol, 'po_line', ldb_id, rt_transaction, lstr_curr )
				end if				
				
				//-- update matching --//
				if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_f_branch_id =vads_copied[li_idx1].getitemnumber(li_row, 'branch_id')
					ls_f_ref_table = upper(vads_copied[li_idx1].describe( "datawindow.table.update"))
					ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
										"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
										"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE,"+ls_mat_cols+")" +&
							" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
							","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+string(ldb_f_doc_id) +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
							",'"+ls_f_ref_table+"','COPY','"+ ls_update_table +"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
										
					EXECUTE immediate :ls_sql_exec using rt_transaction;
					lb_copied = true
				end if
			NEXT
			if lb_update_orders then
				ls_sql_exec = "UPDATE orders set "
				for li_idx2 = 1 to upperbound(las_related_chk_cols[])
					
					ls_data_tmp = string(laa_chk_data[li_idx2])
					if pos(ls_data_tmp,';') > 0 then
						ls_data_tmp = left(ls_data_tmp,pos(ls_data_tmp,';') -1)
					end if
					if li_idx2 = 1 then
						ls_sql_exec += las_related_chk_cols[li_idx2] + "=" + ls_data_tmp
					else
						ls_sql_exec += ","+ las_related_chk_cols[li_idx2] + "=" + ls_data_tmp
					end if
				next
				ls_sql_exec += ' where id = '+string(ldb_version_id)
				EXECUTE immediate :ls_sql_exec using rt_transaction;
			end if
			exit //-- chỉ có 1 dw source -> 1 dw dest --//
		end if		
	NEXT
	//-- ko có datastore dữ iệu copy--//		
	if not lb_found then 
		lb_update_orders = false
		lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] 
		ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))
		laa_value[1] = ldb_f_version_id
		if ls_f_ref_table = 'ORDERS' then
			lds_handle.f_add_where( "id", laa_value[])
		else
//			if upperbound(las_related_data[]) > 1 then
//				laa_value[1] = '('+ls_f_versions +')'				
//			end if
//			lds_handle.f_add_where( "object_ref_id", laa_value[])
			if pos(lstr_data.as_data[1],';') >0 then
				laa_value[1] = '('+lstr_data.as_data[1] +')'		
			else
				laa_value[1] = lstr_data.as_data[1]
			end if			
			lds_handle.f_add_where( "id", laa_value[])
		end if
		if vstr_dwo_related[1].s_f_obj_column_chk[li_idx] <>'' then
			lc_string.f_stringtoarray( vstr_dwo_related[1].s_main_obj_column_sum[li_idx] , ';', lsa_main_obj_column_sum[] )
			lc_string.f_stringtoarray( vstr_dwo_related[1].s_related_obj_column_sum[li_idx] , ';', lsa_related_obj_column_sum[] )
			lc_string.f_stringtoarray( vstr_dwo_related[1].s_t_obj_column_chk[li_idx] , ';', lsa_t_obj_column_chk[] )
			lc_string.f_stringtoarray( vstr_dwo_related[1].s_f_obj_column_chk[li_idx] , ';', lsa_f_obj_column_chk[] )
			FOR li_idx3 = 1 to upperbound( lsa_f_obj_column_chk[])
				if ls_sortString<>'' then ls_sortString += ','
				ls_sortString +=  lsa_f_obj_column_chk[li_idx3] + ' a '
			NEXT
			lds_handle.setsort( ls_sortString)
		end if
		lds_handle.settransobject( rt_transaction)
		lds_handle.retrieve( )
		FOR li_row = 1 to lds_handle.rowcount()
			//-- check match full--//
			if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
				ldb_mat_val = lds_handle.getitemnumber(li_row, ls_from_match_cols)
				if isnull(ldb_mat_val) then ldb_mat_val = 0
				ldb_f_ref_id = lds_handle.getitemnumber(li_row, 'id')
				ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
				if isnull(ldb_matched_val) then ldb_matched_val = 0
				if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết --//
				if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
					 if isnull(lds_handle.getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
				end if				
			end if //-- kết thúc: check match full--//			
			
			//-- check common values --//
			if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
				lb_update_orders = true
				if li_row = 1 then
					for li_idx2 = 1 to upperbound(las_main_chk_cols[])
					
						if lower(las_main_chk_cols[li_idx2]) = 'object_id' or lower(las_main_chk_cols[li_idx2]) = 'bill_to_object' then
							laa_chk_data[li_idx2] = lstr_data.adb_data[2]
						elseif lower(las_main_chk_cols[li_idx2]) = 'exchange_rate' then
							laa_chk_data[li_idx2] = l_unit.f_get_exchange_rate(lstr_data.adb_data[3] , gd_session_date , rt_transaction)
							lstr_curr.adb_data[2]  = laa_chk_data[li_idx2] 
						elseif lower(las_main_chk_cols[li_idx2]) = 'currency_id' then
							laa_chk_data[li_idx2] = lstr_data.adb_data[3]
						else
							laa_chk_data[li_idx2] = lds_handle.f_getitemany(li_row, las_main_chk_cols[li_idx2])
						end if					
					next			
				end if
			end if			
			
			//-- check sum--//
			if  upperbound( lsa_f_obj_column_chk[]) > 0 then
				FOR li_idx3 = 1 to upperbound( lsa_f_obj_column_chk[])
					if ls_chkSum_tmp <> '' then ls_chkSum_tmp +=';'
					ls_chkSum_tmp += string(lds_handle.getitemnumber(li_row ,lsa_f_obj_column_chk[li_idx3]))
					ls_sqlUpdate_where += ' AND '+ lsa_t_obj_column_chk[li_idx3] +' = '+ string(lds_handle.getitemnumber(li_row ,lsa_t_obj_column_chk[li_idx3]))
				NEXT
				if ls_chkSum_tmp <> ls_chkSum_val then
					ls_chkSum_val = ls_chkSum_tmp
					ls_chkSum_tmp = ''
				else
					//-- update sum columns --//
					ls_sqlUpdate = 'Update '+ls_update_table + ' SET '
					for li_idx4 = 1 to upperbound(lsa_related_obj_column_sum[])
						if  li_idx4 < upperbound(lsa_related_obj_column_sum[]) then 
							ls_sqlUpdate += lsa_related_obj_column_sum[li_idx4] + " = " +  lsa_related_obj_column_sum[li_idx4]  +  "+"  + string(lds_handle.getitemnumber(li_row ,lsa_main_obj_column_sum[li_idx4])) + ","
						else 
							ls_sqlUpdate += lsa_related_obj_column_sum[li_idx4] + "= " +  lsa_related_obj_column_sum[li_idx4]  + "+" + string(lds_handle.getitemnumber(li_row ,lsa_main_obj_column_sum[li_idx4]))
						end if
					next
					if upper(ls_update_table) <> 'TAX_LINE' and  upper(ls_update_table) <> 'LOT_LINE' then
						ls_sqlUpdate += ' WHERE object_ref_id = '+string(ldb_version_id)
						ls_sqlUpdate += ls_sqlUpdate_where
					end if
					EXECUTE immediate :ls_sqlUpdate using rt_transaction;	
					continue
				end if
				
			end  if
			//-- insert--//
			ldb_id = this.f_create_id_ex( rt_transaction)			
			FOR li_colnbr= 1 to li_colCnt
				
				//-- get price from price list --//
				if lds_handle.dataobject =  vstr_dwo_related[1].s_dwo_get_price then
					if not vstr_dwo_related[1].b_get_price then 
						if pos(vstr_dwo_related[1].s_col_get_price[li_idx], las_from_cols[li_colnbr]+';') > 0 then
							ldb_item_id = lds_handle.getitemnumber(li_row,'item_id')
							ls_price =  string(this.f_get_pur_price(ldb_item_id, lstr_curr.adb_data[1], rt_transaction))
							if isnull(ls_price) then ls_price = 'NULL'
							ls_sql_values +="," + ls_price
							continue
						end if
					end if
				end if		
				
				//-- copy các col khác--//
				ls_coltype = lds_handle.describe(las_from_cols[li_colnbr]+".coltype")
				if left(ls_coltype, 5) = 'numbe' then
					if las_from_cols[li_colnbr] = ls_from_match_cols then
						ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
					else
						if isnull(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else
							ls_sql_values += "," + string(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr]))
						end if
					end if
				elseif left(ls_coltype, 5) = 'char(' then
					if isnull(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",'" + string(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
					end if
				elseif  left(ls_coltype, 5) = 'datet' then
					if isnull(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",to_date('" + string(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
					end if
				end if				
			NEXT
			
			
			if upper(ls_update_table) = 'ORDERS' then
				ls_sql_values += ",1,'PO','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) + ")"
			else
				ls_sql_values += ",'ORDERS',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
			end if				
			
			
			ls_sql_exec = ls_sql + ls_sql_values
			EXECUTE immediate :ls_sql_exec using rt_transaction;		
			ls_sql_values =''	
			//-- update line itemchange khi get price from price list--//
			if not vstr_dwo_related[1].b_get_price and  lds_handle.dataobject =  vstr_dwo_related[1].s_dwo_get_price then
				ls_updateCol =  'base_price;amount;base_amount;base_amountex_tax;vat_amount;'
				this.f_update_line_itemchanged_ex( 'price', ls_price, ls_updateCol, 'po_line', ldb_id, rt_transaction, lstr_curr )
			end if
											
			//-- update matching --//
			if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
				ldb_f_branch_id =lds_handle.getitemnumber(li_row, 'branch_id')
				ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))
				ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
									"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
									"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE ,"+ls_mat_cols+")" +&
						" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
						","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+string(ldb_f_doc_id) +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
						",'"+ls_f_ref_table+"','COPY','"+ ls_update_table+"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
									
				EXECUTE immediate :ls_sql_exec using rt_transaction;			
				lb_copied = true
			end if
		NEXT				
		if lb_update_orders then  //-- update giá trị : n SOURCE -> 1 PO --//
			ls_sql_exec = "UPDATE orders set "
			for li_idx2 = 1 to upperbound(las_related_chk_cols[])
				
				ls_data_tmp = string(laa_chk_data[li_idx2])
				if isnull(ls_data_tmp) then
					ls_data_tmp = 'NULL'
				elseif pos(ls_data_tmp,';') > 0 then
					ls_data_tmp = left(ls_data_tmp,pos(ls_data_tmp,';') -1)
				end if
				if li_idx2 = 1 then
					ls_sql_exec += las_related_chk_cols[li_idx2] + "=" + ls_data_tmp
				else
					ls_sql_exec += ","+ las_related_chk_cols[li_idx2] + "=" + ls_data_tmp
				end if
			next
			ls_sql_exec += ' where id = '+string(ldb_version_id)
			EXECUTE immediate :ls_sql_exec using rt_transaction;
		end if		
	end if //--kết thúc: ko có datastore dữ iệu copy--//	
NEXT
destroy lds_handle
if lb_copied then
	commit using rt_transaction;
else
	rollback using rt_transaction;
	gf_messagebox('m.b_obj_instantiate.f_copy_to_po.02','Thông báo','Phiếu đã kết hết','stop','ok',1)
	return 0
end if

return ldb_t_doc_id
end function

public function integer f_upd_cust_point_ex (double vdb_doc_id, date vd_transdate, double vdb_cust_id, long vl_used_point, long vl_cust_point, ref t_transaction rt_transaction);
// insert vào measuremetn_trans --//
insert into MEASUREMENT_TRANS ( ID ,
											  OBJECT_ID     ,
											  TRANS_DATE  ,
											  DOC_REF_ID  ,
											  DOC_REF_TYPE  ,
											  DOWN_VALUE  ,											  
											  BAL_VALUE  ,
											  SOB  ,											 
											  COMPANY_ID    ,
											  BRANCH_ID  ,
											  CREATED_BY   ,
											  CREATED_DATE ,
											  LAST_MDF_BY  ,
											  LAST_MDF_DATE  )
select seq_table_id.nextval,:vdb_cust_id, :vd_transdate,:vdb_doc_id, 'RETAIL' , :vl_used_point,
		:vl_cust_point - :vl_used_point, :gs_sob, :gi_user_comp_id, :gdb_branch, :gi_userid, sysdate, :gi_userid, sysdate 
from dual
using rt_transaction;

return rt_transaction.sqlcode
end function

public function integer f_upd_bonus_point_ex (t_dw_pos vdw_bill_line, t_dw_pos vdw_doc_hdr, double vdb_cust_id, double vdb_staff_id, long vl_bal_point, long vl_bal_point_staff, ref t_transaction rt_transaction, ref long rl_bill_staff_point, ref long rl_bill_cust_point);int			li_row, ll_bonus_row
long		ll_bal_point, ll_bal_point_staff
decimal	ldc_amt, ldc_point_qty, ldc_point_amt, ldc_bonus_pct
double	ldb_item_id, ldb_cust_id, ldb_bonus_id, ldb_doc_id, ldb_bonus_id_staff
//string		ls_idStr
date		ld_transdate


if isnull(vl_bal_point) then vl_bal_point = 0
if isnull(vl_bal_point_staff) then vl_bal_point_staff = 0

ldb_cust_id = vdb_cust_id
if (isnull(ldb_cust_id) or ldb_cust_id = 0) and vdb_staff_id = 0 then return 0


//-- tính số điểm của bill --//

//-- calc cust point --//
if ldb_cust_id > 0 then
	rl_bill_cust_point = long(vdw_bill_line.Describe("Evaluate('Sum(cust_point)', 0)"))
end if
//-- calc staff point --//
if vdb_staff_id > 0 then
	rl_bill_staff_point = long(vdw_bill_line.Describe("Evaluate('Sum(staff_point)', 0)"))
end if

if rl_bill_cust_point = 0 and rl_bill_staff_point = 0 then return 0

ll_bal_point = rl_bill_cust_point + vl_bal_point
ll_bal_point_staff = rl_bill_staff_point + vl_bal_point_staff

ldb_doc_id = vdw_doc_hdr.getitemnumber(1, 'id')
ld_transdate = date(vdw_doc_hdr.getitemdatetime(1, 'document_date'))
// insert vào measuremetn_trans : cust point--//
if rl_bill_cust_point <> 0 then
	insert into MEASUREMENT_TRANS ( ID ,
												  OBJECT_ID     ,
												  TRANS_DATE  ,
												  DOC_REF_ID  ,
												  DOC_REF_TYPE  ,
												  UP_VALUE  ,
												  BAL_VALUE  ,
												  SOB  ,											 
												  COMPANY_ID    ,
												  BRANCH_ID  ,
												  CREATED_BY   ,
												  CREATED_DATE ,
												  LAST_MDF_BY  ,
												  LAST_MDF_DATE  )
	select seq_table_id.nextval,:ldb_cust_id, :ld_transdate,:ldb_doc_id, 'RETAIL' , :rl_bill_cust_point,:ll_bal_point, :gs_sob, :gi_user_comp_id, :gdb_branch, :gi_userid, sysdate, :gi_userid, sysdate 
	from dual
	using rt_transaction;
end if

// insert vào measuremetn_trans : staff point--//
if rl_bill_staff_point <> 0 then
	insert into MEASUREMENT_TRANS ( ID ,
												  OBJECT_ID     ,
												  TRANS_DATE  ,
												  DOC_REF_ID  ,
												  DOC_REF_TYPE  ,
												  UP_VALUE  ,
												  BAL_VALUE  ,
												  SOB  ,											 
												  COMPANY_ID    ,
												  BRANCH_ID  ,
												  CREATED_BY   ,
												  CREATED_DATE ,
												  LAST_MDF_BY  ,
												  LAST_MDF_DATE  )
	select seq_table_id.nextval,:vdb_staff_id, :ld_transdate,:ldb_doc_id, 'RETAIL' , :rl_bill_staff_point, :ll_bal_point_staff, :gs_sob, :gi_user_comp_id, :gdb_branch, :gi_userid, sysdate, :gi_userid, sysdate 
	from dual
	using rt_transaction;
end if

return rt_transaction.sqlcode
end function

public function integer f_get_object_point (double vdb_obj_id, string vs_obj_type, double vdb_company_id, double vdb_branch_id, ref long rl_point, ref t_transaction rt_transaction);int			li_cnt

if isnull(vdb_obj_id) then return 0
	 
select count(object_id)	 into :li_cnt 
from v_cust_bal_point 
where object_id = :vdb_obj_id
and company_id = :vdb_company_id
and branch_id = :vdb_branch_id
using rt_transaction;

if li_cnt = 0 then return 0

if lower(vs_obj_type) = 'customer' then
	select  v.bal_value into  :rl_point
	from v_cust_bal_point v
	where  v.company_id = :vdb_company_id
	and v.branch_id = :vdb_branch_id
	and v.object_id = :vdb_obj_id
	using rt_transaction;
elseif lower(vs_obj_type) = 'staff' then
	select v.bal_value into  :rl_point
	from v_staff_bal_point v  
	where  v.company_id = :vdb_company_id
	and v.branch_id = :vdb_branch_id
	and v.object_id = :vdb_obj_id
	using rt_transaction;
end if

if rt_transaction.sqlcode = 0 then
	return 1
else
	gf_messagebox('m.b_obj_instantiate.f_get_object_id.01','Thông báo','Không tìm thấy ID đối tượng có ID là:@'+string(vdb_obj_id),'exclamation','ok',1) 		
	return -1
end if
end function

public function integer f_upd_bonus_point_ex (t_ds_db vds_bill_line, t_ds_db vds_doc_hdr, double vdb_cust_id, double vdb_staff_id, long vl_bal_point, long vl_bal_point_staff, ref t_transaction rt_transaction, ref long rl_bill_staff_point, ref long rl_bill_cust_point);int			li_row, ll_bonus_row
long		ll_bal_point, ll_bal_point_staff
decimal	ldc_amt, ldc_point_qty, ldc_point_amt, ldc_bonus_pct
double	ldb_item_id, ldb_cust_id, ldb_bonus_id, ldb_doc_id, ldb_bonus_id_staff
//string		ls_idStr
date		ld_transdate


if isnull(vl_bal_point) then vl_bal_point = 0
if isnull(vl_bal_point_staff) then vl_bal_point_staff = 0

ldb_cust_id = vdb_cust_id
if (isnull(ldb_cust_id) or ldb_cust_id = 0) and vdb_staff_id = 0 then return 0


//-- tính số điểm của bill --//

//-- calc cust point --//
if ldb_cust_id > 0 then
	rl_bill_cust_point = long(vds_bill_line.Describe("Evaluate('Sum(cust_point)', 0)"))
end if
//-- calc staff point --//
if vdb_staff_id > 0 then
	rl_bill_staff_point = long(vds_bill_line.Describe("Evaluate('Sum(staff_point)', 0)"))
end if

if rl_bill_cust_point = 0 and rl_bill_staff_point = 0 then return 0

ll_bal_point = rl_bill_cust_point + vl_bal_point
ll_bal_point_staff = rl_bill_staff_point + vl_bal_point_staff

ldb_doc_id = vds_doc_hdr.getitemnumber(1, 'id')
ld_transdate = date(vds_doc_hdr.getitemdatetime(1, 'document_date'))
// insert vào measuremetn_trans : cust point--//
if rl_bill_cust_point <> 0 then
	insert into MEASUREMENT_TRANS ( ID ,
												  OBJECT_ID     ,
												  TRANS_DATE  ,
												  DOC_REF_ID  ,
												  DOC_REF_TYPE  ,
												  UP_VALUE  ,
												  BAL_VALUE  ,
												  SOB  ,											 
												  COMPANY_ID    ,
												  BRANCH_ID  ,
												  CREATED_BY   ,
												  CREATED_DATE ,
												  LAST_MDF_BY  ,
												  LAST_MDF_DATE  )
	select seq_table_id.nextval,:ldb_cust_id, :ld_transdate,:ldb_doc_id, 'RETAIL' , :rl_bill_cust_point,:ll_bal_point, :gs_sob, :gi_user_comp_id, :gdb_branch, :gi_userid, sysdate, :gi_userid, sysdate 
	from dual
	using rt_transaction;
end if

// insert vào measuremetn_trans : staff point--//
if rl_bill_staff_point <> 0 then
	insert into MEASUREMENT_TRANS ( ID ,
												  OBJECT_ID     ,
												  TRANS_DATE  ,
												  DOC_REF_ID  ,
												  DOC_REF_TYPE  ,
												  UP_VALUE  ,
												  BAL_VALUE  ,
												  SOB  ,											 
												  COMPANY_ID    ,
												  BRANCH_ID  ,
												  CREATED_BY   ,
												  CREATED_DATE ,
												  LAST_MDF_BY  ,
												  LAST_MDF_DATE  )
	select seq_table_id.nextval,:vdb_staff_id, :ld_transdate,:ldb_doc_id, 'RETAIL' , :rl_bill_staff_point, :ll_bal_point_staff, :gs_sob, :gi_user_comp_id, :gdb_branch, :gi_userid, sysdate, :gi_userid, sysdate 
	from dual
	using rt_transaction;
end if

return rt_transaction.sqlcode
end function

public function integer f_get_vend_info (double vdb_vend_id, ref double rdb_info[4], ref t_transaction rt_transaction);/**************************************

raa_info[]:	lưu thông tin
raa_info[1]:	currency
raa_info[2]:	payment_term
raa_info[3]:	payment_method
raa_info[4]: delivery_mode

return 0 : không có khách hàng
**************************************/
t_ds_db	lds_object_sales
any		laa_data[]
long		ll_cnt

select count(id) into :ll_cnt from vendor where object_ref_id = :vdb_vend_id using rt_transaction;

if ll_cnt = 1 then
	select  default_currency, payment_term, payment_method, delivery_mode
	into :rdb_info[1] , :rdb_info[2], :rdb_info[3], :rdb_info[4]
	from vendor 
	where object_ref_id = :vdb_vend_id
	using rt_transaction;
else
	return 0
end if

return ll_cnt
end function

public function double f_split_po (s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial);string				ls_sql, ls_code, ls_currCode, ls_currName, ls_sql_cols, ls_update_table, ls_related_data, las_related_data[], ls_f_ref_table
string				ls_main_chk_cols, las_main_chk_cols[], ls_related_chk_cols, las_related_chk_cols[], ls_data_tmp
string				las_from_cols[], ls_from_cols, ls_sql_values, ls_coltype, ls_sql_exec, ls_from_match_cols, las_from_match_cols[], ls_mat_cols, las_mat_cols[]
string				ls_payterm, ls_paymethod, ls_delivery_mode
double			ldb_id,ldb_f_doc_id, ldb_t_doc_id, ldb_version_id, ldb_trans_id, ldb_base_currID, ldb_mat_val, ldb_matched_val, ldb_f_ref_id, ldb_f_branch_id
double			ldb_f_version_id, ldb_branch , ldb_vend_id, ladb_vend_info[4]
int					li_idx, li_idx1, li_idx2, li_row, li_colnbr, li_colCnt, li_pos, li_cnt
boolean			lb_found, lb_copied, lb_update_orders
any				laa_value[], laa_chk_data[]
t_ds_db				lds_handle
c_string				lc_string
c_unit_instance 	lc_unit_ins


//--------------------------//
// lấy giao dịch của PO //
//-------------------------//
li_pos =  pos( vstr_dwo_related[1].s_data[1] , "(" )
if li_pos > 0 then
	ls_related_data = mid(vstr_dwo_related[1].s_data[1], li_pos +1, pos(vstr_dwo_related[1].s_data[1] , ')') - 1 )
	li_cnt = lc_string.f_Stringtoarray( ls_related_data, ',', las_related_data[])
else
	las_related_data[1] = vstr_dwo_related[1].s_data[1]
end if
ldb_id = double(las_related_data[1] )

lds_handle = create t_ds_db
lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo
ls_update_table = lds_handle.describe( "datawindow.table.update")

//-- split line --//
select object_ref_id, branch_id into :ldb_f_version_id, :ldb_branch
from po_line t
where t.id = :ldb_id
and  t.company_id = :gi_user_comp_id
using rt_transaction;

select count(t.id) 
into :li_cnt
from document t
where t.company_id = :gi_user_comp_id
and t.branch_id = :ldb_branch
and t.version_id = :ldb_f_version_id
using rt_transaction;

if li_cnt = 1 then
	select t.trans_hdr_id, t.id into :ldb_trans_id, :ldb_f_doc_id
	from document t
	where t.company_id = :gi_user_comp_id
	and t.branch_id = :ldb_branch
	and t.version_id =  :ldb_f_version_id
	using rt_transaction;
else
	gf_messagebox('m.b_obj_instantiate.f_split_po.01','Thông báo','Không tìm thấy Chứng từ','stop','ok',1)
	return -1
end if	


//---------------------//
// insert document  //
//--------------------//
ldb_t_doc_id = this.f_create_id_ex( rt_transaction)
ldb_version_id =  this.f_create_id_ex( rt_transaction)
ls_code = rdwsetup_initial.f_get_autonumber_ex('code','d_document_po_grid', rt_transaction)
ls_sql = "INSERT into DOCUMENT(id,company_id, branch_id,object_ref_table, created_by, created_date,last_mdf_by, last_mdf_date,"+&
									" doc_type, version_id, SOB, handled_by, CODE, document_date, TRANS_HDR_ID,status)" +&
			" VALUES("+string(ldb_t_doc_id)+ "," + string( gi_user_comp_id ) + "," + string( ldb_branch ) + ",'ORDERS' ," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate, " +&
						"'PO',"+string(ldb_version_id) +", 'F',"+string(gi_userid) + ",'"+ls_code +"', trunc(sysdate)"+ ","+string(ldb_trans_id) +", 'new')"
EXECUTE immediate :ls_sql using rt_transaction;

//--------------------//
// insert table  //
//--------------------//

FOR li_idx = 1 to upperbound(vstr_dwo_related[1].s_related_obj_dwo_copy[] )	
	lds_handle.dataobject = vstr_dwo_related[1].s_related_obj_dwo_copy[li_idx]
	ls_update_table = lds_handle.describe( "datawindow.table.update")	

	ls_sql = "INSERT into "+ls_update_table +"(company_id, branch_id, created_by, created_date,last_mdf_by, last_mdf_date,"				
	ls_sql_cols = vstr_dwo_related[1].s_related_obj_column_copy[li_idx]
	ls_sql_cols = trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))
	if vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
		ls_sql_cols += vstr_dwo_related[1].s_related_obj_column_chk[li_idx]
		ls_sql_cols = trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))
	end if
	
	if right(ls_sql_cols,1) = ',' then 
		if upper(ls_update_table) = 'ORDERS' then
			ls_sql += ls_sql_cols + "doc_type,object_ref_table, object_ref_id,ID)"
		else
			ls_sql += ls_sql_cols + "object_ref_table, object_ref_id,ID)"
		end if
	else
		if upper(ls_update_table) = 'ORDERS' then
			ls_sql += ls_sql_cols + ",doc_type,object_ref_table, object_ref_id,ID)"
		else		
			ls_sql += ls_sql_cols + ",object_ref_table, object_ref_id,ID)"
		end if
	end if
	
	//-- lấy chk cols source--//
	if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
		ls_main_chk_cols = vstr_dwo_related[1].s_main_obj_column_chk[li_idx]
//		lc_string.f_stringtoarray( ls_main_chk_cols, ';', las_main_chk_cols[] )
	end if
	if  vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
		ls_from_match_cols = vstr_dwo_related[1].s_match_f_col_obj[li_idx] 
	end if
	
	ls_sql += " VALUES("+string( gi_user_comp_id ) + "," + string( ldb_branch ) + "," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate " 
	ls_from_cols = vstr_dwo_related[1].s_main_obj_column_copy[li_idx]
	li_colCnt = lc_string.f_stringtoarray( ls_from_cols, ';', las_from_cols[])

	FOR li_idx1 = 1 to upperbound(vads_copied[])
		if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
			lb_found = true
			FOR li_row = 1 to vads_copied[li_idx1].rowcount()
				//-- insert--//
				ldb_id = this.f_create_id_ex( rt_transaction)
				if pos(ls_from_cols , ls_main_chk_cols+';') > 0 then
					if li_row > 1 then exit
					FOR li_colnbr= 1 to li_colCnt							
						ls_coltype = vads_copied[li_idx1].describe(las_from_cols[li_colnbr]+".coltype")
						if left(ls_coltype, 5) = 'numbe' then
							if las_from_cols[li_colnbr] = ls_from_match_cols then
								ldb_vend_id = vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr])
							end if
							if isnull(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr])) then
								ls_sql_values +=",NULL"
							else	
								ls_sql_values += "," + string(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr]))
							end if
						elseif left(ls_coltype, 5) = 'char(' then
							if isnull(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr])) then
								ls_sql_values +=",NULL"
							else						
								ls_sql_values += ",'" + string(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
							end if
						elseif  left(ls_coltype, 5) = 'datet' then
							if isnull(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
								ls_sql_values +=",NULL"
							else	
								ls_sql_values += ",to_date('" + string(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
							end if
						end if						
					NEXT
					//-- default values --//			
					this.f_get_vend_info( ldb_vend_id, ladb_vend_info[], rt_transaction )
					//-- currency --//
					if ladb_vend_info[1] = 0 or isnull(ladb_vend_info[1]) then
						lc_unit_ins.f_get_base_cur_ex(ldb_base_currID,  ls_currCode, ls_currName, rt_transaction )
					else
						ldb_base_currID = ladb_vend_info[1]
					end if
					ls_sql_values += ","+string(ldb_base_currID) + ",1"
					
					//-- ls_payterm --//
					if ladb_vend_info[2] = 0 or isnull(ladb_vend_info[2]) then
						ls_payterm = 'NULL'
					else
						ls_payterm = string(ladb_vend_info[2])
					end if		
					ls_sql_values += ","+ls_payterm
					//-- ls_paymethod --//
					if ladb_vend_info[3] = 0 or isnull(ladb_vend_info[3]) then
						ls_paymethod = 'NULL'
					else
						ls_paymethod = string(ladb_vend_info[3])
					end if		
					ls_sql_values += ","+ls_paymethod
					//-- ls_delivery_mode --//
					if ladb_vend_info[4] = 0 or isnull(ladb_vend_info[4]) then
						ls_delivery_mode = 'NULL'
					else
						ls_delivery_mode = string(ladb_vend_info[4])
					end if					
					ls_sql_values += ","+ls_delivery_mode
				else
					FOR li_colnbr= 1 to li_colCnt
							
						ls_coltype = vads_copied[li_idx1].describe(las_from_cols[li_colnbr]+".coltype")
						if left(ls_coltype, 5) = 'numbe' then
							if las_from_cols[li_colnbr] = ls_from_match_cols then
								ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
							else
								if isnull(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr])) then
									ls_sql_values +=",NULL"
								else	
									ls_sql_values += "," + string(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr]))
								end if
							end if
						elseif left(ls_coltype, 5) = 'char(' then
							if isnull(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr])) then
								ls_sql_values +=",NULL"
							else						
								ls_sql_values += ",'" + string(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
							end if
						elseif  left(ls_coltype, 5) = 'datet' then
							if isnull(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
								ls_sql_values +=",NULL"
							else	
								ls_sql_values += ",to_date('" + string(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
							end if
						end if	
					NEXT								
				end if
				
				if upper(ls_update_table) = 'ORDERS' then
					ls_sql_values += ",'PO','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) + ")"
				else
					ls_sql_values += ",'ORDERS',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
				end if				
				ls_sql_exec = ls_sql + ls_sql_values
				EXECUTE immediate :ls_sql_exec using rt_transaction;				
				ls_sql_values =''		
				if upper(ls_update_table) = 'PO_LINE' then
					lb_copied = true
				end if				
			NEXT
			exit //-- chỉ có 1 dw source -> 1 dw dest --//
		end if		
	NEXT
	//-- ko có datastore dữ iệu copy--//		
	if not lb_found then 
		lb_update_orders = false
		lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] 
		ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))
		laa_value[1] = ldb_f_version_id
		if ls_f_ref_table = 'ORDERS' then
			lds_handle.f_add_where( "id", laa_value[])
		else
			lds_handle.f_add_where( "object_ref_id", laa_value[])
		end if
		lds_handle.settransobject( rt_transaction)
		lds_handle.retrieve( )
		FOR li_row = 1 to lds_handle.rowcount()
	
			//-- check common values --//
			if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
				lb_update_orders = true
				for li_idx2 = 1 to upperbound(las_main_chk_cols[])
					if li_row = 1 then
						laa_chk_data[li_idx2] = lds_handle.f_getitemany(li_row, las_main_chk_cols[li_idx2])
					end if
				next					
			end if			
			//-- insert--//
			ldb_id = this.f_create_id_ex( rt_transaction)			
			FOR li_colnbr= 1 to li_colCnt
				ls_coltype = lds_handle.describe(las_from_cols[li_colnbr]+".coltype")
				if left(ls_coltype, 5) = 'numbe' then
					if las_from_cols[li_colnbr] = ls_from_match_cols then
						ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
					else
						if isnull(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else
							ls_sql_values += "," + string(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr]))
						end if
					end if
				elseif left(ls_coltype, 5) = 'char(' then
					if isnull(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",'" + string(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
					end if
				elseif  left(ls_coltype, 5) = 'datet' then
					if isnull(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",to_date('" + string(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
					end if
				end if				
			NEXT
			if upper(ls_update_table) = 'ORDERS' then
				ls_sql_values += ",'PO','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) + ")"
			else
				ls_sql_values += ",'ORDERS',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
			end if				
			ls_sql_exec = ls_sql + ls_sql_values
			EXECUTE immediate :ls_sql_exec using rt_transaction;			
			ls_sql_values =''			
			if upper(ls_update_table) = 'PO_LINE' and rt_transaction.sqlnrows > 0  then
				lb_copied = true
			end if
		NEXT				

	end if //--kết thúc: ko có datastore dữ iệu copy--//	
NEXT
destroy lds_handle
if lb_copied then
	commit using rt_transaction;
else
	rollback using rt_transaction;
	gf_messagebox('m.b_obj_instantiate.f_copy_to_po.02','Thông báo','Phiếu đã kết hết','stop','ok',1)
	return 0
end if

return ldb_t_doc_id
end function

public function double f_copy_to_pur_invoice (s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial);string				ls_sql, ls_code, ls_currCode, ls_currName, ls_sql_cols, ls_update_table, ls_related_data, las_related_data[], ls_f_ref_table
string				ls_main_chk_cols, las_main_chk_cols[], ls_related_chk_cols, las_related_chk_cols[], ls_data_tmp, las_initvalue_cols[], ls_qty_yn, ls_val_yn
string				las_from_cols[], ls_from_cols, ls_sql_values, ls_coltype, ls_sql_exec, ls_from_match_cols, las_from_match_cols[], ls_mat_cols, las_mat_cols[]
double			ldb_id,ldb_f_doc_id, ldb_t_doc_id, ldb_version_id, ldb_trans_id, ldb_base_currID, ldb_mat_val, ldb_matched_val, ldb_f_ref_id, ldb_f_branch_id
double			ldb_f_version_id, ldb_branch
int					li_idx, li_idx1, li_idx2, li_row, li_colnbr, li_colCnt, li_pos, li_cnt
boolean			lb_found, lb_copied, lb_update_orders
any				laa_value[], laa_chk_data[], la_initvalue
t_ds_db				lds_handle
c_string				lc_string
c_unit_instance 	lc_unit_ins
c_dwsetup_initial	lc_dwsetup_initial

//--------------------------//
// lấy giao dịch của PO //
//-------------------------//
li_pos =  pos( vstr_dwo_related[1].s_data[1] , "(" )
if li_pos > 0 then
	ls_related_data = mid(vstr_dwo_related[1].s_data[1], li_pos +1, pos(vstr_dwo_related[1].s_data[1] , ')') - (li_pos +1) )
	li_cnt = lc_string.f_Stringtoarray( ls_related_data, ',', las_related_data[])
else
	las_related_data[1] = vstr_dwo_related[1].s_data[1]
end if
ldb_id = double(las_related_data[1] )

lds_handle = create t_ds_db
lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo
ls_update_table = lds_handle.describe( "datawindow.table.update")
if lower(ls_update_table) = 'document' then
	//-- copy header --//
	ldb_f_doc_id = ldb_id
	select count(t2.id) into :li_cnt
	from document t
	join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
	join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
	where t.company_id = :gi_user_comp_id
//	and t.branch_id = :gdb_branch
	and t.id =  :ldb_id
	using rt_transaction;
	if li_cnt = 1 then
		select t2.id, t.version_id, t.branch_id , t2.quantity_yn, t1.value_yn
		into :ldb_trans_id, :ldb_f_version_id, :ldb_branch , :ls_qty_yn, :ls_val_yn
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
		where t.company_id = :gi_user_comp_id
//		and t.branch_id = :gdb_branch
		and t.id =  :ldb_id
		using rt_transaction;
		if isnull(ls_qty_yn) then ls_qty_yn = 'N'
		if isnull(ls_val_yn) then ls_val_yn = 'N'		
	else
		gf_messagebox('m.b_obj_instantiate.f_copy_to_po.01','Thông báo','Chưa cài đặt giao dịch cho PO thuộc nhóm copy','stop','ok',1)
		return -1
	end if
else
	//-- copy line --//
	select object_ref_id, branch_id into :ldb_f_version_id, :ldb_branch
	from pr_line t
	where t.id = :ldb_id
//	and t.branch_id = :gdb_branch
	and  t.company_id = :gi_user_comp_id
	using rt_transaction;
	
	select count(t2.id) 
	into :li_cnt
	from document t
	join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
	join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
	where t.company_id = :gi_user_comp_id
	and t.branch_id = :ldb_branch
	and t.version_id = :ldb_f_version_id
	using rt_transaction;
	
	if li_cnt = 1 then
		select t2.id, t.id into :ldb_trans_id, :ldb_f_doc_id
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
		where t.company_id = :gi_user_comp_id
		and t.branch_id = :ldb_branch
		and t.version_id =  :ldb_f_version_id
		using rt_transaction;
	else
		gf_messagebox('m.b_obj_instantiate.f_copy_to_po.01','Thông báo','Chưa cài đặt giao dịch cho PO thuộc nhóm copy','stop','ok',1)
		return -1
	end if	
end if

//---------------------//
// insert document  //
//--------------------//
ldb_t_doc_id = this.f_create_id_ex( rt_transaction)
ldb_version_id =  this.f_create_id_ex( rt_transaction)
ls_code = rdwsetup_initial.f_get_autonumber_ex('code','d_document_ap_grid', rt_transaction)
ls_sql = "INSERT into DOCUMENT(id,company_id, branch_id,object_ref_table, created_by, created_date,last_mdf_by, last_mdf_date,"+&
									" doc_type, version_id, SOB, handled_by, CODE, document_date, TRANS_HDR_ID,status)" +&
			" VALUES("+string(ldb_t_doc_id)+ "," + string( gi_user_comp_id ) + "," + string( ldb_branch ) + ",'BOOKED_SLIP' ," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate, " +&
						"'PUR_INVOICE',"+string(ldb_version_id) +", 'F',"+string(gi_userid) + ",'"+ls_code +"', trunc(sysdate)"+ ","+string(ldb_trans_id) +", 'new')"
EXECUTE immediate :ls_sql using rt_transaction;



//--------------------//
// insert table  //
//--------------------//

FOR li_idx = 1 to upperbound(vstr_dwo_related[1].s_related_obj_dwo_copy[] )	
	lds_handle.dataobject = vstr_dwo_related[1].s_related_obj_dwo_copy[li_idx]
	ls_update_table = lds_handle.describe( "datawindow.table.update")	

	ls_sql = "INSERT into "+ls_update_table +"(company_id, branch_id, created_by, created_date,last_mdf_by, last_mdf_date,"				
	ls_sql_cols = vstr_dwo_related[1].s_related_obj_column_copy[li_idx]
	ls_sql_cols= trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))
	if vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
		ls_sql_cols += vstr_dwo_related[1].s_related_obj_column_chk[li_idx]
		ls_sql_cols = trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))
		lc_string.f_stringtoarray( vstr_dwo_related[1].s_related_obj_column_chk[li_idx], ';', las_initvalue_cols[])		
	end if	
	
	if right(ls_sql_cols,1) = ',' then 
		if upper(ls_update_table) = 'BOOKED_SLIP' then
			ls_sql += ls_sql_cols + "version_no,doc_type,object_ref_table, object_ref_id,ID,quantity_yn,value_yn)"
		else
			ls_sql += ls_sql_cols + "object_ref_table, object_ref_id,ID)"
		end if
	else
		if upper(ls_update_table) = 'BOOKED_SLIP' then
			ls_sql += ls_sql_cols + ",version_no,doc_type,object_ref_table, object_ref_id,ID)"
		else
			ls_sql += ls_sql_cols + ",object_ref_table, object_ref_id,ID)"
		end if
	end if
	ls_sql += " VALUES("+string( gi_user_comp_id ) + "," + string( ldb_branch ) + "," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate " 
	ls_from_cols = vstr_dwo_related[1].s_main_obj_column_copy[li_idx]
	li_colCnt = lc_string.f_stringtoarray( ls_from_cols, ';', las_from_cols[])
	//-- lấy mat cols--//
	if vstr_dwo_related[1].s_match_f_dwo[li_idx] = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
		ls_from_match_cols = vstr_dwo_related[1].s_match_f_column[li_idx]
		if pos(ls_from_match_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_from_match_cols , ';', las_from_match_cols[])
			ls_from_match_cols = las_from_match_cols[1]
		end if
		ls_mat_cols = vstr_dwo_related[1].s_match_column[li_idx]
		if pos(ls_mat_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_mat_cols , ';', las_mat_cols[])
			ls_mat_cols = las_mat_cols[1]
		end if			
	end if
//	//-- lấy chk cols for update destination--//
//	if  vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
//		ls_related_chk_cols = vstr_dwo_related[1].s_related_obj_column_chk[li_idx]
//		lc_string.f_stringtoarray( ls_related_chk_cols, ';', las_related_chk_cols[])
//	end if
	//-- lấy chk cols source--//
	if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
		ls_main_chk_cols = vstr_dwo_related[1].s_main_obj_column_chk[li_idx]
		lc_string.f_stringtoarray( ls_main_chk_cols, ';', las_main_chk_cols[] )
	end if
	
	FOR li_idx1 = 1 to upperbound(vads_copied[])
		if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
			lb_found = true
			lb_update_orders = false
			FOR li_row = 1 to vads_copied[li_idx1].rowcount()
				//-- check match full--//
				if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_mat_val = vads_copied[li_idx1].getitemnumber(li_row, ls_from_match_cols)
					if isnull(ldb_mat_val) then ldb_mat_val = 0
					ldb_f_ref_id = vads_copied[li_idx1].getitemnumber(li_row, 'id')
					ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
					if isnull(ldb_matched_val) then ldb_matched_val = 0
					if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết--//
					if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
						 if isnull(vads_copied[li_idx1].getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
					end if								
				end if //-- kết thúc: check match full--//
				//-- check common values --//
				if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
					lb_update_orders = true
					for li_idx2 = 1 to upperbound(las_main_chk_cols[])
						if li_row = 1 then
							laa_chk_data[li_idx2] = vads_copied[li_idx1].f_getitemany(li_row, las_main_chk_cols[li_idx2])
						end if
					next					
				end if
				//-- insert--//
				ldb_id = this.f_create_id_ex( rt_transaction)
				FOR li_colnbr= 1 to li_colCnt
					ls_coltype = vads_copied[li_idx1].describe(las_from_cols[li_colnbr]+".coltype")
					if left(ls_coltype, 5) = 'numbe' then
						if las_from_cols[li_colnbr] = ls_from_match_cols then
							ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
						else
							if isnull(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr])) then
								ls_sql_values +=",NULL"
							else	
								ls_sql_values += "," + string(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr]))
							end if
						end if
					elseif left(ls_coltype, 5) = 'char(' then
						if isnull(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else						
							ls_sql_values += ",'" + string(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
						end if
					elseif  left(ls_coltype, 5) = 'datet' then
						if isnull(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else	
							ls_sql_values += ",to_date('" + string(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
						end if
					end if
				NEXT
				//-- default values --//		
				if upperbound(las_initvalue_cols[]) > 0 then
					FOR li_colnbr = 1 to upperbound(las_initvalue_cols[])
						if las_initvalue_cols[li_colnbr] = 'trans_date'  then
							ls_sql_values += ",to_date('" + string(gd_session_date ,gs_w_date_format )+"','"+gs_w_date_format+"')"
						else
							lc_dwsetup_initial.f_init_ids_setup_dw_ex( ldb_branch , 'u_detail_pur_invoice', rt_transaction)
							lc_dwsetup_initial.f_get_initvalue('d_pur_invoice_line_grid',las_initvalue_cols[li_colnbr],ldb_branch ,la_initvalue )	
							ls_sql_values += "," + string(la_initvalue)
						end if
					NEXT
				end if
				//-values khác--//
				if upper(ls_update_table) = 'BOOKED_SLIP' then
					ls_sql_values += ",1,'PUR_INVOICE','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) +",'"+ls_qty_yn+"','"+ls_val_yn + "')"
				else
					ls_sql_values += ",'BOOKED_SLIP',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
				end if				
				ls_sql_exec = ls_sql + ls_sql_values
				EXECUTE immediate :ls_sql_exec using rt_transaction;				
				ls_sql_values =''
				//-- update matching --//
				if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_f_branch_id =vads_copied[li_idx1].getitemnumber(li_row, 'branch_id')
					ls_f_ref_table = upper(vads_copied[li_idx1].describe( "datawindow.table.update"))
					ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
										"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
										"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE,"+ls_mat_cols+")" +&
							" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
							","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+string(ldb_f_doc_id) +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
							",'"+ls_f_ref_table+"','COPY','"+ ls_update_table +"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
										
					EXECUTE immediate :ls_sql_exec using rt_transaction;
					lb_copied = true
				end if
			NEXT
			exit //-- chỉ có 1 dw source -> 1 dw dest --//
		end if		
	NEXT
	//-- ko có datastore dữ iệu copy--//		
	if not lb_found then 
		lb_update_orders = false
		lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] 
		ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))
		laa_value[1] = ldb_f_version_id
		if ls_f_ref_table = 'BOOKED_SLIP' or  ls_f_ref_table = 'ORDERS' then
			lds_handle.f_add_where( "id", laa_value[])
		else
			lds_handle.f_add_where( "object_ref_id", laa_value[])
		end if
		lds_handle.settransobject( rt_transaction)
		lds_handle.retrieve( )
		FOR li_row = 1 to lds_handle.rowcount()
			//-- check match full--//
			if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
				ldb_mat_val = lds_handle.getitemnumber(li_row, ls_from_match_cols)
				if isnull(ldb_mat_val) then ldb_mat_val = 0
				ldb_f_ref_id = lds_handle.getitemnumber(li_row, 'id')
				ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
				if isnull(ldb_matched_val) then ldb_matched_val = 0
				if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết --//
				if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
					 if isnull(lds_handle.getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
				end if				
			end if //-- kết thúc: check match full--//			
			//-- check common values --//
			if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
				lb_update_orders = true
				for li_idx2 = 1 to upperbound(las_main_chk_cols[])
					if li_row = 1 then
						laa_chk_data[li_idx2] = lds_handle.f_getitemany(li_row, las_main_chk_cols[li_idx2])
					end if
				next					
			end if			
			//-- insert--//
			ldb_id = this.f_create_id_ex( rt_transaction)			
			FOR li_colnbr= 1 to li_colCnt
				ls_coltype = lds_handle.describe(las_from_cols[li_colnbr]+".coltype")
				if left(ls_coltype, 5) = 'numbe' then
					if las_from_cols[li_colnbr] = ls_from_match_cols then
						ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
					else
						if isnull(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else
							ls_sql_values += "," + string(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr]))
						end if
					end if
				elseif left(ls_coltype, 5) = 'char(' then
					if isnull(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",'" + string(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
					end if
				elseif  left(ls_coltype, 5) = 'datet' then
					if isnull(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",to_date('" + string(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
					end if
				end if				
			NEXT
			//-- default values --//		
			if upperbound(las_initvalue_cols[]) > 0 then
				FOR li_colnbr = 1 to upperbound(las_initvalue_cols[])
					if las_initvalue_cols[li_colnbr] = 'trans_date'  then
						ls_sql_values += ",to_date('" + string(gd_session_date ,gs_w_date_format )+"','"+gs_w_date_format+"')"
					else
						lc_dwsetup_initial.f_init_ids_setup_dw_ex( ldb_branch , 'u_detail_pur_invoice', rt_transaction)
						lc_dwsetup_initial.f_get_initvalue('d_pur_invoice_line_grid',las_initvalue_cols[li_colnbr],ldb_branch ,la_initvalue )	
						ls_sql_values += "," + string(la_initvalue)
					end if
				NEXT
			end if
			//-values khác--//			
			if upper(ls_update_table) = 'BOOKED_SLIP' then
				ls_sql_values += ",1,'PUR_INVOICE','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) + ",'"+ls_qty_yn+"','"+ls_val_yn + "')"
			else
				ls_sql_values += ",'BOOKED_SLIP',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
			end if				
			ls_sql_exec = ls_sql + ls_sql_values
			EXECUTE immediate :ls_sql_exec using rt_transaction;			
			ls_sql_values =''			
			//-- update matching --//
			if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
				ldb_f_branch_id =lds_handle.getitemnumber(li_row, 'branch_id')
				ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))
				ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
									"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
									"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE ,"+ls_mat_cols+")" +&
						" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
						","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+string(ldb_f_doc_id) +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
						",'"+ls_f_ref_table+"','COPY','"+ ls_update_table+"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
									
				EXECUTE immediate :ls_sql_exec using rt_transaction;			
				lb_copied = true
			end if
		NEXT				

	end if //--kết thúc: ko có datastore dữ iệu copy--//	
NEXT
destroy lds_handle
if lb_copied then
	commit using rt_transaction;
else
	rollback using rt_transaction;
	gf_messagebox('m.b_obj_instantiate.f_copy_to_po.02','Thông báo','Phiếu đã kết hết','stop','ok',1)
	return 0
end if

return ldb_t_doc_id
end function

public function long f_upd_link_id_fr_web (ref t_transaction rt_transaction);long				ll_rtn, ll_product, ll_idx, ll_item_var, ll_item, ll_root, ll_var, ll_cnt, ll_prodCnt, ll_page_cnt, ll_page, ll_progress_cnt
string				ls_response, ls_rtn, ls_sku, ls_sql
double			ldb_prouct_id, ldb_variant_id

RestClient 		lrc_sku
jsonparser 		l_jsonparser


lrc_sku = Create RestClient
ll_rtn = lrc_sku.setrequestheader( 'Authorization',"Bearer 819B9F8C7D3384D15C38FD26FBE8D021C6A7A196B2118A0FA4BCFADE2A05F186")
ll_rtn = lrc_sku.SetRequestHeader("Content-Type", "application/json;charset=UTF-8")

l_jsonparser = Create jsonparser

lrc_sku.SendGetRequest( "https://apis.haravan.com/com/products/count.json", ls_response)

If lrc_sku.GetResponseStatusCode() = 200 Then
	ls_rtn = l_jsonparser.loadstring( ls_response)
	if len(trim(ls_rtn)) > 0 then
		gf_messagebox('m.b_obj_instantiate.f_upd_link_id_fr_web.01','Thống báo',ls_rtn, 'stop','ok',1)
		return -1
	end if
	ll_root = l_jsonparser.getrootitem()	
	ll_prodCnt =  l_jsonparser.getitemnumber(ll_root, 'count')
	if mod(ll_prodCnt,50 ) = 0 then
		ll_page_cnt = ll_prodCnt/50 
	else
		ll_page_cnt = int(ll_prodCnt/50) +1
	end if
end if

FOR ll_page = 1 to ll_page_cnt
	lrc_sku.SendGetRequest( "https://apis.haravan.com/com/products.json", ls_response)
	
//	lrc_sku.SendGetRequest( "https://apis.haravan.com/com/products.json?fields=id,variants&page="+string(ll_page), ls_response)
	If lrc_sku.GetResponseStatusCode() = 200 Then
		ls_rtn = l_jsonparser.loadstring( ls_response)
		if len(trim(ls_rtn)) > 0 then
			this.of_show_progress(101,'Đang cập nhật ...')
			gf_messagebox('m.b_obj_instantiate.f_upd_link_id_fr_web.01','Thống báo',ls_rtn, 'stop','ok',1)			
			return -1
		end if
		ll_root = l_jsonparser.getrootitem()
		ll_product = l_jsonparser.getchilditem(ll_root, 1)
		ll_cnt =  l_jsonparser.getchildcount(ll_product)						
		for ll_idx = 1 to ll_cnt  //-- số products--//		
			yield()
			ll_progress_cnt++
						
			this.of_show_progress( int(ll_progress_cnt/ll_prodCnt*100),'Đang cập nhật ...')
			if ll_progress_cnt < ll_prodCnt then
				this.of_set_progress_text( string(ll_progress_cnt)+'/'+string(ll_prodCnt))
			end if
			ll_item =  l_jsonparser.getchilditem(ll_product, ll_idx) //- 1 product --//
			
			ll_var = l_jsonparser.getchilditem(ll_item,2)
			ll_item_var = l_jsonparser.getchilditem(ll_var,1)
			ls_sku = l_jsonparser.getitemstring(ll_item_var, 'sku')
			ldb_variant_id = l_jsonparser.getitemnumber( ll_item_var, 'id')
			if isnull(ls_sku) then 
				continue 	
			end if
			
			ldb_prouct_id = l_jsonparser.getitemnumber(ll_item_var, 'product_id')
			ls_sql = "Update object set object_ref_id = "+string(ldb_prouct_id) + ", version_id= " + string(ldb_variant_id) + &
						" Where object_ref_table = 'ITEM' AND code = '"+ls_sku+"' AND company_id = "+string(gi_user_comp_id)
			execute immediate :ls_sql using rt_transaction;
			commit using rt_transaction;
		next
	Else
		//Checks if any error according to the value of ResponseStatuscode and ls_Response
		this.of_show_progress(101,'Đang cập nhật ...')
		gf_messagebox('m.b_obj_instantiate.f_upd_link_id_fr_web.02','Thống báo','SendGetRequest error', 'stop','ok',1)
		return -1
	End If		
NEXT

this.of_show_progress(101,'Đang cập nhật ...')
gf_messagebox('m.b_obj_instantiate.f_upd_link_id_fr_web.03','Thống báo','Cập nhật hoàn tất', 'information','ok',1)
return ll_rtn
end function

public function long f_upd_prodnm_fr_web (string vsa_prod_ids[], ref t_transaction rt_transaction);/*----------------------------------------

vsa_prod_ids[]: tối đa 50 phần tử

---------------------------------------------*/
long				ll_rtn, ll_product, ll_idx, ll_root, ll_prodCnt, ll_item
string				ls_response, ls_rtn, ls_ids, ls_sql, ls_prodnm
double			ldb_prouct_id

RestClient 		lrc_sku
jsonparser 		l_jsonparser
c_string			lc_string


if  upperbound(vsa_prod_ids[]) = 0 then return 0

ll_rtn = lc_string.f_arraytostring( vsa_prod_ids[], ',', ls_ids)

lrc_sku = Create RestClient
ll_rtn = lrc_sku.setrequestheader("Authorization", "Bearer 819B9F8C7D3384D15C38FD26FBE8D021C6A7A196B2118A0FA4BCFADE2A05F186")
ll_rtn = lrc_sku.SetRequestHeader("Content-Type", "application/json;charset=UTF-8")

lrc_sku.SendGetRequest( "https://apis.haravan.com/com/products.json?fields=title&ids="+ls_ids, ls_response)
//lrc_sku.SendGetRequest( "https://apis.haravan.com/com/products.json?&ids="+ls_ids, ls_response)
If lrc_sku.GetResponseStatusCode() = 200 Then
	l_jsonparser = Create jsonparser
	ls_rtn = l_jsonparser.loadstring( ls_response)
	if len(trim(ls_rtn)) > 0 then
		gf_messagebox('m.b_obj_instantiate.f_upd_prodnm_fr_web.01','Thống báo',ls_rtn, 'stop','ok',1)
		return -1
	end if
	ll_root = l_jsonparser.getrootitem()
	ll_product = l_jsonparser.getchilditem(ll_root, 1)
	ll_prodCnt =  l_jsonparser.getchildcount(ll_product)		
	for ll_idx = 1 to ll_prodCnt  //-- số products--//	
		yield()
		this.of_show_progress( int(ll_idx/ll_prodCnt*100),'Đang cập nhật ...')
		if ll_idx < ll_prodCnt then
			this.of_set_progress_text( string(ll_idx)+'/'+string(ll_prodCnt))
		end if
		ll_item =  l_jsonparser.getchilditem(ll_product, ll_idx) //- 1 product --//
		ls_prodnm = l_jsonparser.getitemstring(ll_item, 'title')
		ldb_prouct_id = l_jsonparser.getitemnumber(ll_item, 'id')
		if isnull(ls_prodnm) then 
			continue 	
		end if
		
		ls_sql = "Update object set name = '"+string(ls_prodnm)+"'" +&
					" Where object_ref_table = 'ITEM' AND object_ref_id = "+string(ldb_prouct_id)+" AND company_id = "+string(gi_user_comp_id)
		execute immediate :ls_sql using rt_transaction;
		commit using rt_transaction;
	next		
Else
	//Checks if any error according to the value of ResponseStatuscode and ls_Response
	this.of_show_progress(101,'Đang cập nhật ...')
	gf_messagebox('m.b_obj_instantiate.f_upd_prodnm_fr_web.02','Thống báo','SendGetRequest error', 'stop','ok',1)
	return -1	
end if

this.of_show_progress(101,'Đang cập nhật ...')
return 1

end function

public function long f_get_nbr_of_bill_in_period (double vdb_cust_id, integer vi_nbr_of_month, date vd_date, string vs_backward_forward, string vs_booked_yn, ref t_transaction rt_transacion);long		ll_cnt, ll_rtn_cnt
int			li_nbr_of_mon

setnull(ll_cnt)
if string(vd_date ,'yyyymmdd') = '19000101' or isnull(vd_date) then
	return ll_cnt
end if
if vs_backward_forward = '' or isnull(vs_backward_forward) then
	return ll_cnt
end if
if vdb_cust_id = 0 or isnull(vdb_cust_id) then
	return ll_cnt
end if
if vdb_cust_id = 0 or isnull(vi_nbr_of_month) then
	return ll_cnt
end if

if lower(vs_backward_forward) = 'backward' then  // -- Tính backward --//
	li_nbr_of_mon = vi_nbr_of_month
else // -- Tính Forward --//
	li_nbr_of_mon = -vi_nbr_of_month
end if


if upper(vs_booked_yn) = 'Y' then		// Tính phiếu đã ghi sổ--//
	select count(doc_ref_id) 
	into :ll_cnt
	from object_trans 
	where sob = :gs_sob
	and company_id = :gi_user_comp_id
	and object_id = :vdb_cust_id
	and DR_AMOUNT> 0
	and DOC_REF_TYPE = 'RETAIL'
	and trans_date between :vd_date and add_months(:vd_date , :li_nbr_of_mon)
	using rt_transacion;
	
	select count(doc_ref_id) 
	into :ll_rtn_cnt
	from object_trans 
	where sob = :gs_sob
	and company_id = :gi_user_comp_id
	and object_id = :vdb_cust_id
	and DR_AMOUNT< 0
	and DOC_REF_TYPE = 'RETAIL'
	and trans_date between :vd_date and add_months(:vd_date , :li_nbr_of_mon)
	using rt_transacion;	
else		// Tính phiếu chưa ghi sổ--//
	select count(d.id) 
	into :ll_cnt
	from document  d
	join booked_slip bs on bs.id = d.version_id
	where d.sob = :gs_sob
	and d.company_id = :gi_user_comp_id
	and d.doc_type = 'RETAIL'
	and d.object_ref_id is null
	and bs.dr_cr_object = :vdb_cust_id
	and bs.trans_date between :vd_date and add_months(:vd_date , :li_nbr_of_mon)
	using rt_transacion;		
	
	select count(d.id) 
	into :ll_rtn_cnt
	from document  d
	join booked_slip bs on bs.id = d.version_id
	where d.sob = :gs_sob
	and d.company_id = :gi_user_comp_id
	and d.doc_type = 'RETAIL'
	and d.object_ref_id is not null
	and bs.dr_cr_object = :vdb_cust_id
	and bs.trans_date between :vd_date and add_months(:vd_date , :li_nbr_of_mon)
	using rt_transacion;				
end if

ll_cnt = ll_cnt - ll_rtn_cnt


return ll_cnt
end function

public function double f_get_bill_amount_in_period (double vdb_cust_id, integer vi_nbr_of_month, date vd_date, string vs_backward_forward, string vs_booked_yn, ref t_transaction rt_transacion);double		ldb_sum
int				li_nbr_of_mon

setnull(ldb_sum)
if string(vd_date ,'yyyymmdd') = '19000101' or isnull(vd_date) then
	return ldb_sum
end if
if vs_backward_forward = '' or isnull(vs_backward_forward) then
	return ldb_sum
end if
if vdb_cust_id = 0 or isnull(vdb_cust_id) then
	return ldb_sum
end if
if vdb_cust_id = 0 or isnull(vi_nbr_of_month) then
	return ldb_sum
end if

if lower(vs_backward_forward) = 'backward' then  // -- Tính backward --//
	li_nbr_of_mon = vi_nbr_of_month
else // -- Tính Forward --//
	li_nbr_of_mon = -vi_nbr_of_month
end if


if upper(vs_booked_yn) = 'Y' then		// Tính phiếu đã ghi sổ--//
	select sum(DR_AMOUNT) 
	into :ldb_sum
	from object_trans 
	where sob = :gs_sob
	and company_id = :gi_user_comp_id
	and object_id = :vdb_cust_id
	and DOC_REF_TYPE = 'RETAIL'
	and DR_AMOUNT> 0
	and trans_date between :vd_date and add_months(:vd_date , :li_nbr_of_mon)
	using rt_transacion;
	
else		// Tính phiếu chưa ghi sổ--//
	select sum(sl.amount)
	into :ldb_sum
	from document  d
	join booked_slip bs on bs.id = d.version_id
	join so_line sl on sl.object_ref_id = bs.id
	where d.sob = :gs_sob
	and d.company_id = :gi_user_comp_id
	and d.doc_type = 'RETAIL'
	and d.object_ref_id is null
	and bs.dr_cr_object = :vdb_cust_id
	and bs.trans_date between :vd_date and add_months(:vd_date , :li_nbr_of_mon)
	using rt_transacion;		
		
end if

return ldb_sum
end function

public function string f_get_doc_code (double vdb_doc_id, ref t_transaction rt_transaction);string			ls_data

select code into :ls_data
	from document 
		where id = :vdb_doc_id 
		and company_id = :gi_user_comp_id 
		and branch_id = :gdb_branch 
		and sob = :gs_sob using rt_transaction;
		
if rt_transaction.sqlcode = 0 then
	return ls_data
else 
	return ''
end if
end function

public function integer f_importclipboard_dw_ex (ref t_transaction rt_transaction, ref t_dw_mpl rdw_handle, long vl_start_row, string vs_start_colname);int					li_rtn,li_row, li_colCnt, li_col, ll_rowCnt, ll_insertrow, li_start_col
string				lsa_colname[], ls_coltype, ls_sql, ls_modify, ls_rtn, ls_data
t_ds_db					lds_clipboard
c_string					lc_string
s_object_display		lod_hdl
s_w_main				lw_hdl

if isvalid(rdw_handle) = false then return 0
if rdw_handle.f_isgrid() = false then return 0
if vs_start_colname = '' or isnull(vs_start_colname) then
	gf_messagebox('m.b_obj_instantiate.f_importclipboard_dw.01','Thông báo','Chưa chọn cột bắt đầu copy', 'stop','ok',1)
	return -1
end if

if vl_start_row = 0 or isnull(vl_start_row) then
	gf_messagebox('m.b_obj_instantiate.f_importclipboard_dw.02','Thông báo','Chưa chọn dòng bắt đầu copy', 'stop','ok',1)
	return -2
end if

rdw_handle.f_getparentwindow(lw_hdl)
lod_hdl = lw_hdl.f_get_obj_handling()

ls_sql = "SELECT "

li_colCnt = rdw_handle.f_get_object_in_taborder_visible(lsa_colname[]) 
FOR li_col = 1 to li_colCnt
	if vs_start_colname = lsa_colname[li_col] then li_start_col = li_col
	ls_coltype = rdw_handle.describe(lsa_colname[li_col]+'.coltype')
	CHOOSE CASE Lower ( Left ( ls_coltype , 5 ) )
	
			CASE "char(", "char"		//  CHARACTER DATATYPE
				ls_sql += " '' as col"+string(li_col) + ',' 		
			CASE "date"					//  DATE DATATYPE
				ls_sql += " sysdate as col"+string(li_col)+ ',' 	
			CASE "datet"				//  DATETIME DATATYPE
				ls_sql += " sysdate as col"+string(li_col) + ',' 		
			CASE "decim"				//  DECIMAL DATATYPE
				ls_sql += " 0 as col"+string(li_col) + ',' 				
			CASE "numbe", "long", "ulong", "real", "int"				//  NUMBER DATATYPE	
				ls_sql += " 0 as col"+string(li_col) + ',' 			
			CASE "time", "times"		//  TIME DATATYPE
				ls_sql += " sysdate as col"+string(li_col) + ',' 	
	END CHOOSE
NEXT
ls_sql = left(ls_sql, len(ls_sql) - 1) + ' FROM DUAL'
ls_sql = rt_transaction.SyntaxFromSQL( ls_sql,"", ls_rtn)
if ls_rtn ="" then
	lds_clipboard = create t_ds_db
	lds_clipboard.Create( ls_sql, ls_rtn)
	IF Len(ls_rtn) > 0 THEN
		gf_messagebox('m.b_obj_instantiate.f_importclipboard_dw.03','Thông báo',ls_rtn, 'stop','ok',1)
		RETURN -1
	END IF	
end if 

li_rtn = lds_clipboard.importclipboard(1,0,0,0,li_start_col)
if li_rtn = -1 then return -1
clipboard('')

yield()
lod_hdl.of_show_progress( 1, 'Đang copy .........')

ll_rowCnt = rdw_handle.rowcount()
FOR li_row = 1 to li_rtn
	lod_hdl.of_show_progress( int(li_row/li_rtn*100), 'Đang copy .........')
	lod_hdl.iw_progress.st_remain.text = string(li_row)+'/'+string(li_rtn)		
	
	if ll_rowCnt >= vl_start_row + li_row -1 then
		ll_insertrow =  vl_start_row + li_row -1 
	else
		ll_insertrow = rdw_handle.event e_addrow()
	end if
	FOR li_col = li_start_col to li_colCnt
		ls_data =  string(lds_clipboard.f_getitemany( li_row, li_col)) 
		if isnull(ls_data) then continue 
		if rdw_handle.Event e_itemchanged_ex(ll_insertrow, lsa_colname[ li_col ] , ls_data) = 1 then
			lod_hdl.of_show_progress( 101, 'Đang copy .........')
			return -1
		end if
		rdw_handle.setitem( ll_insertrow,lsa_colname[ li_col ] , lds_clipboard.f_getitemany( li_row, li_col))
		if li_col = li_colCnt then exit
	NEXT
	rdw_handle.event e_presave()
	
NEXT

rdw_handle.f_set_ib_saving(false)
lod_hdl.of_show_progress( 101, 'Đang copy .........')
return 1
end function

protected function integer f_calc_update_column ();return 0
end function

public function long f_update_line_no (t_dw_mpl rdw_handle);long			ll_row, ll_line_no

IF rdw_handle.rowcount() = 0 then return 0
IF rdw_handle.describe('line_no.coltype') = '!' then return 0
IF rdw_handle.describe('no.coltype') = '!' then return 0

FOR ll_row = 1 to rdw_handle.rowcount()
	ll_line_no = rdw_handle.getitemnumber(ll_row, 'no')
	rdw_handle.setitem(ll_row, 'line_no', ll_line_no)
NEXT
return rdw_handle.rowcount()
end function

public function double f_get_user_staff_id (double vdb_user_id, ref t_transaction rt_transaction);/**********************************************

**********************************************/

double	ldb_staff_id

	Select object_staff into :ldb_staff_id
	From role_user 
	Where role_user.id = :vdb_user_id using rt_transaction;

if rt_transaction.sqlcode = 0 then
	return ldb_staff_id
end if
return 0
end function

public function integer f_update_hdr_itemchanged_ex (string vs_edit_colname, string vs_editdata, string vs_upd_colname, ref t_ds_db rds_line, ref t_transaction rt_transaction, s_str_data vstr_currency);		/*--------------------------------------------------------------------------///
		Mô tả chức năng:
		---------------------------------

-----------------------------------------------------------------------------------------
Hàm này đươc gọi sau khi đã cập nhật giá từ bảng giá cho dw-line
================================================	*/	
double				ldb_base_cur, ldb_round_id_base_amt, ldb_round_id_base_price, ldb_round_id_amt, ldb_round_id_price, ldb_line_id
dec					ldb_amount, ldb_base_amount, ldc_qty, ldc_price, ldc_vat_amt, ldc_vat_pct, ldc_disc_amt, ldc_disc_pct, ldb_amount_tmp
dec					ldc_base_price, ldc_act_qty, ldc_act_price, ldc_act_amount, ldc_PRICE_EX_TAX, ldc_AMOUNT_EX_TAX, ldc_BASE_AMOUNT_EX_TAX
dec					ldc_ACT_PRICE_EX_TAX, ldc_ACT_AMOUNT_EX_TAX, ldc_ACT_BASE_AMOUNT_EX_TAX
string					ls_base_curcode,ls_base_curname, lsa_colname[],  lsa_edit_colname[], ls_sql
int						li_colCnt, li_idx1, li_rowCnt, li_row, li_EditcolCnt, li_idx2, li_tax_line_cnt
c_string				lc_string
c_unit_instance		lc_unit


yield()
this.of_show_progress( 1/100, 'Đang cập nhật......')
connect using rt_transaction;
rds_line.f_settransobject(rt_transaction)
li_rowCnt = rds_line.retrieve()

 //-- chuẩn bị cho làm tròn  --//
lc_unit.f_get_base_cur_ex(ldb_base_cur,  ls_base_curcode,ls_base_curname, rt_transaction)
if ldb_base_cur > 0 then 
	ldb_round_id_base_amt =  lc_unit.f_get_round_id_ex( ldb_base_cur, 0, 'amount', rt_transaction)
	ldb_round_id_base_price =  lc_unit.f_get_round_id_ex( ldb_base_cur, 0, 'price', rt_transaction)
end if
if vstr_currency.adb_data[1] <> ldb_base_cur then
	ldb_round_id_amt =  lc_unit.f_get_round_id_ex( vstr_currency.adb_data[1], 0, 'amount', rt_transaction)
	ldb_round_id_price =  lc_unit.f_get_round_id_ex( vstr_currency.adb_data[1], 0, 'price', rt_transaction)	
else
	ldb_round_id_amt =  ldb_round_id_base_amt
	ldb_round_id_price =  ldb_round_id_base_price
end if

li_EditcolCnt = lc_string.f_stringtoarray( vs_edit_colname, ';', lsa_edit_colname[])
li_colCnt = lc_string.f_stringtoarray( vs_upd_colname, ';', lsa_colname[])
//-- re-calc line --//
FOR li_row =1 to li_rowCnt
	this.of_show_progress((int(li_row/li_rowCnt)*100), 'Đang cập nhật......')
	this.of_set_progress_text( string(li_row)+'/'+string(li_rowCnt))
	//-- tính toán lại giá trị các cột liên quan--//	
	for li_idx1 = 1 to li_EditcolCnt
		if lsa_edit_colname[li_idx1] = 'qty' then
			ldc_qty = rds_line.getitemnumber(li_row, 'qty')	
		elseif lsa_edit_colname[li_idx1] = 'price' then
			ldc_price = rds_line.getitemnumber(li_row, 'price')
		elseif lsa_edit_colname[li_idx1] = 'vat' then
			ldc_vat_pct = rds_line.getitemnumber(li_row, 'vat')
			if isnull(ldc_vat_pct) then ldc_vat_pct = 0
		elseif lsa_edit_colname[li_idx1] = 'tax_pct' then
			ldc_vat_pct = rds_line.getitemnumber(li_row, 'tax_pct')
			if isnull(ldc_vat_pct) then ldc_vat_pct = 0
		elseif lsa_edit_colname[li_idx1] = 'disc_pct' then
			ldc_disc_pct = rds_line.getitemnumber(li_row, 'disc_pct')
			if isnull(ldc_disc_pct) then ldc_disc_pct = 0
		elseif lsa_edit_colname[li_idx1] = 'discount_pct' then
			ldc_disc_pct = rds_line.getitemnumber(li_row, 'discount_pct')
			if isnull(ldc_disc_pct) then ldc_disc_pct = 0
		end if
	next
	//-- base_price--//
	if vstr_currency.adb_data[1] = ldb_base_cur then
		ldc_base_price = ldc_price
	else
		ldc_base_price = ldc_price * vstr_currency.adb_data[2]
		ldc_base_price = lc_unit.f_round( rt_transaction, ldb_round_id_base_price, ldc_base_price)
	end if
	//-- amount--//
	if ldc_disc_pct = 0 and ldc_disc_amt = 0 then
		ldb_amount = lc_unit.f_round( rt_transaction, ldb_round_id_amt, ldc_price*ldc_qty)
	else
		ldb_amount= lc_unit.f_round( rt_transaction, ldb_round_id_amt, ldc_price*ldc_qty/(1 + ldc_disc_pct/100))
	end if	
	//-- base_amount--//
	if vstr_currency.adb_data[1] = ldb_base_cur then
		ldb_base_amount = ldb_amount	
	else
		ldb_base_amount = ldb_amount * vstr_currency.adb_data[2]
		ldb_base_amount = lc_unit.f_round( rt_transaction, ldb_round_id_base_amt, ldb_base_amount)
	end if
	//--vat--//
	ldc_vat_amt = lc_unit.f_round( rt_transaction, ldb_round_id_base_amt, ldb_base_amount*ldc_vat_pct/100) 
	//--amount_ex_tax--//
	ldc_AMOUNT_EX_TAX = ldb_amount
	//--base_amount_ex_tax--//
	ldc_BASE_AMOUNT_EX_TAX = ldb_base_amount
	//-- act_qty--//
	ldc_act_qty = ldc_qty	
	//--act_amount--//
	ldc_act_amount = ldb_amount
	//--act_amount_ex_tax--//
	ldc_ACT_AMOUNT_EX_TAX = ldc_AMOUNT_EX_TAX
	//--act_base_amount_ex_tax--//
	ldc_ACT_BASE_AMOUNT_EX_TAX = ldc_BASE_AMOUNT_EX_TAX
	
	
	//-- Cập nhật lại line --//
	ldb_line_id =  rds_line.getitemnumber(li_row, 'id')
	FOR li_idx2 = 1 to li_colCnt
		if  lsa_colname[li_idx2] = 'price' then
			rds_line.setitem(li_row,  lsa_colname[li_idx2] , ldc_price)
		elseif lsa_colname[li_idx2] = 'amount' then
			rds_line.setitem(li_row,  lsa_colname[li_idx2] , ldb_amount)
		elseif lsa_colname[li_idx2] = 'base_amount' then
			rds_line.setitem(li_row,  lsa_colname[li_idx2] , ldb_base_amount)
		elseif lsa_colname[li_idx2] = 'base_price' then
			rds_line.setitem(li_row,  lsa_colname[li_idx2] , ldc_base_price)	
		elseif lsa_colname[li_idx2] = 'act_qty' then
			rds_line.setitem(li_row,  lsa_colname[li_idx2] , ldc_act_qty)
		elseif lsa_colname[li_idx2] = 'act_price' then
			rds_line.setitem(li_row,  lsa_colname[li_idx2] , ldc_act_price)
		elseif lsa_colname[li_idx2] = 'act_amount' then
			rds_line.setitem(li_row,  lsa_colname[li_idx2] , ldc_act_amount)
		elseif  lsa_colname[li_idx2] = 'price_ex_tax' then
			rds_line.setitem(li_row,  lsa_colname[li_idx2] , ldc_price_ex_tax)
		elseif  lsa_colname[li_idx2] = 'amount_ex_tax' then
			rds_line.setitem(li_row,  lsa_colname[li_idx2] , ldc_amount_ex_tax)
		elseif  lsa_colname[li_idx2] = 'base_amount_ex_tax' then
			rds_line.setitem(li_row,  lsa_colname[li_idx2] , ldc_base_amount_ex_tax)	
		elseif  lsa_colname[li_idx2] = 'act_price_ex_tax' then
			rds_line.setitem(li_row,  lsa_colname[li_idx2] , ldc_act_price_ex_tax)
		elseif  lsa_colname[li_idx2] = 'act_amount_ex_tax' then
			rds_line.setitem(li_row,  lsa_colname[li_idx2] , ldc_act_amount_ex_tax)
		elseif  lsa_colname[li_idx2] = 'act_base_amount_ex_tax' then
			rds_line.setitem(li_row,  lsa_colname[li_idx2] , ldc_act_base_amount_ex_tax)
		elseif lsa_colname[li_idx2] = 'vat_amount' then	
			rds_line.setitem(li_row,  lsa_colname[li_idx2] , ldc_vat_amt)
		elseif lsa_colname[li_idx2] = 'tax_correction' then	
			rds_line.setitem(li_row,  lsa_colname[li_idx2] , ldc_vat_amt)
			//-- update tax_line --//			
			select count(id) into :li_tax_line_cnt from tax_line where object_ref_id = :ldb_line_id using rt_transaction;			
			if li_tax_line_cnt > 0 then			
				ls_sql = "Update tax_line set tax_correction =" + string(ldc_vat_amt) + " where object_ref_id ="+string(ldb_line_id)
				execute immediate :ls_sql using rt_transaction;
			end if			
		elseif  lsa_colname[li_idx2] = 'disc_pct' then	
			rds_line.setitem(li_row,  lsa_colname[li_idx2] , ldc_disc_pct)
		elseif  lsa_colname[li_idx2] = 'disc_amt' then	
			rds_line.setitem(li_row,  lsa_colname[li_idx2] , ldc_disc_amt)		
		elseif  lsa_colname[li_idx2] = 'discount' then	
			rds_line.setitem(li_row,  lsa_colname[li_idx2] , ldc_disc_amt)
		elseif  lsa_colname[li_idx2] = 'discount_pct' then	
			rds_line.setitem(li_row,  lsa_colname[li_idx2] , ldc_disc_pct)
		end if						
	NEXT
	
NEXT
if rds_line.update() = 1 then
	commit using rt_transaction;
	this.of_show_progress(101, 'Đang cập nhật......')
	disconnect  using rt_transaction;
	return 1
else
	this.of_show_progress(101, 'Đang cập nhật......')
	gf_messagebox('m.b_obj_instantiate.f_update_hdr_itemchanged_ex.01','Thông báo','Lỗi Cập nhật tỷ giá cho chi tiết@'+rt_transaction.sqlerrtext,'stop','ok',1)
	rollback using rt_transaction;	
	disconnect  using rt_transaction;
	return -1
end if


end function

public function double f_copy_to_so (s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial);string				ls_sql, ls_code, ls_currCode, ls_currName, ls_sql_cols, ls_update_table, ls_related_data, las_related_data[], ls_f_ref_table
string				ls_main_chk_cols, las_main_chk_cols[], ls_related_chk_cols, las_related_chk_cols[], ls_data_tmp
string				las_from_cols[], ls_from_cols, ls_sql_values, ls_coltype, ls_sql_exec, ls_from_match_cols, las_from_match_cols[], ls_mat_cols, las_mat_cols[]
string				ls_sql_detail, ls_from_cols_detail, las_from_cols_detail[]
double			ldb_id,ldb_f_doc_id, ldb_t_doc_id, ldb_version_id, ldb_trans_id, ldb_base_currID, ldb_mat_val, ldb_matched_val, ldb_f_ref_id, ldb_f_branch_id
double			ldb_f_version_id, ldb_branch, ldb_id_detail, ldb_manage_group
int					li_idx, li_idx1, li_idx2, li_row, li_colnbr, li_colCnt, li_pos, li_cnt, li_colCnt_detail, li_row_detail
boolean			lb_found, lb_copied, lb_update_orders
any				laa_value[], laa_chk_data[]
t_ds_db				lds_handle, lds_handle_detail
c_string				lc_string
c_unit_instance 	lc_unit_ins


//--------------------------//
// lấy giao dịch của SO //
//-------------------------//
li_pos =  pos( vstr_dwo_related[1].s_data[1] , "(" )
if li_pos > 0 then
	ls_related_data = mid(vstr_dwo_related[1].s_data[1], li_pos +1, pos(vstr_dwo_related[1].s_data[1] , ')') - (li_pos +1) )
	li_cnt = lc_string.f_Stringtoarray( ls_related_data, ',', las_related_data[])
else
	las_related_data[1] = vstr_dwo_related[1].s_data[1]
end if
ldb_id = double(las_related_data[1] )

lds_handle_detail = create t_ds_db
lds_handle = create t_ds_db
lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo
ls_update_table = lds_handle.describe( "datawindow.table.update")
if lower(ls_update_table) = 'document' then
	//-- copy header --//
	ldb_f_doc_id = ldb_id
	select count(t2.id) into :li_cnt
	from document t
	join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
	join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'SO'
	where t.company_id = :gi_user_comp_id
//	and t.branch_id = :gdb_branch
	and t.id =  :ldb_id
	using rt_transaction;
	if li_cnt = 1 then
		select t2.id, t.version_id, t.branch_id , t.manage_group  into :ldb_trans_id, :ldb_f_version_id, :ldb_branch, :ldb_manage_group
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'SO'
		where t.company_id = :gi_user_comp_id
//		and t.branch_id = :gdb_branch
		and t.id =  :ldb_id
		using rt_transaction;
		if isnull(ldb_manage_group) then ldb_manage_group = 0
	else
		gf_messagebox('m.b_obj_instantiate.f_copy_to_so.01','Thông báo','Chưa cài đặt giao dịch cho SO thuộc nhóm copy','stop','ok',1)
		return -1
	end if
else
	//-- copy line --//
	select object_ref_id, branch_id into :ldb_f_version_id, :ldb_branch
	from pr_line t
	where t.id = :ldb_id
//	and t.branch_id = :gdb_branch
	and  t.company_id = :gi_user_comp_id
	using rt_transaction;
	
	select count(t2.id) 
	into :li_cnt
	from document t
	join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
	join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
	where t.company_id = :gi_user_comp_id
	and t.branch_id = :ldb_branch
	and t.version_id = :ldb_f_version_id
	using rt_transaction;
	
	if li_cnt = 1 then
		select t2.id, t.id into :ldb_trans_id, :ldb_f_doc_id
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
		where t.company_id = :gi_user_comp_id
		and t.branch_id = :ldb_branch
		and t.version_id =  :ldb_f_version_id
		using rt_transaction;
	else
		gf_messagebox('m.b_obj_instantiate.f_copy_to_so.01','Thông báo','Chưa cài đặt giao dịch cho SO thuộc nhóm copy','stop','ok',1)
		return -1
	end if	
end if

//---------------------//
// insert document  //
//--------------------//
ldb_t_doc_id = this.f_create_id_ex( rt_transaction)
ldb_version_id =  this.f_create_id_ex( rt_transaction)
ls_code = rdwsetup_initial.f_get_autonumber_ex('code','d_document_so_grid', rt_transaction)
ls_sql = "INSERT into DOCUMENT(id,company_id, branch_id,object_ref_table, created_by, created_date,last_mdf_by, last_mdf_date,"+&
									" doc_type, version_id, SOB, handled_by, CODE, document_date, TRANS_HDR_ID,status, manage_group)" +&
			" VALUES("+string(ldb_t_doc_id)+ "," + string( gi_user_comp_id ) + "," + string( ldb_branch ) + ",'ORDERS' ," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate, " +&
						"'SO',"+string(ldb_version_id) +",'"+ gs_sob +"',"+string(gi_userid) + ",'"+ls_code +"', trunc(sysdate)"+ ","+string(ldb_trans_id) +", 'new',"+ string(ldb_manage_group)+ ")"
EXECUTE immediate :ls_sql using rt_transaction;



//--------------------//
// insert table  //
//--------------------//

FOR li_idx = 1 to upperbound(vstr_dwo_related[1].s_related_obj_dwo_copy[] ) - 1

	lds_handle.dataobject = vstr_dwo_related[1].s_related_obj_dwo_copy[li_idx]
	ls_update_table = lds_handle.describe( "datawindow.table.update")		
	if lower(ls_update_table) = 'document' then ls_update_table = 'ORDERS'
	
	ls_sql = "INSERT into "+ls_update_table +"(company_id, branch_id, created_by, created_date,last_mdf_by, last_mdf_date,"				
	ls_sql_cols = vstr_dwo_related[1].s_related_obj_column_copy[li_idx]
	ls_sql_cols= trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))
	if right(ls_sql_cols,1) = ',' then 
		if upper(ls_update_table) = 'ORDERS' then
			ls_sql += ls_sql_cols + "version_no,doc_type,object_ref_table, object_ref_id,ID)"
		elseif upper(ls_update_table) = 'SO_LINE' then
			ls_sql += ls_sql_cols + "object_ref_table, object_ref_id,ID)"
			ls_sql_detail = "INSERT into TAX_LINE (company_id, branch_id, created_by, created_date,last_mdf_by, last_mdf_date,"	
			ls_sql_cols = vstr_dwo_related[1].s_related_obj_column_copy[li_idx + 1]
			ls_sql_cols= trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))			
			if right(ls_sql_cols,1) = ',' then 
				ls_sql_detail += ls_sql_cols + "object_ref_table, object_ref_id,ID, doc_version)"
			else
				ls_sql_detail += ls_sql_cols + ",object_ref_table, object_ref_id,ID, doc_version)"
			end if
			ls_sql_detail += " VALUES("+string( gi_user_comp_id ) + "," + string( ldb_branch ) + "," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate " 
			ls_from_cols_detail = vstr_dwo_related[1].s_main_obj_column_copy[li_idx+1]
			li_colCnt_detail = lc_string.f_stringtoarray( ls_from_cols_detail, ';', las_from_cols_detail[])		
		end if		
	else
		if upper(ls_update_table) = 'ORDERS' then
			ls_sql += ls_sql_cols + ",version_no,doc_type,object_ref_table, object_ref_id,ID)"
		elseif upper(ls_update_table) = 'SO_LINE' then
			ls_sql += ls_sql_cols + ",object_ref_table, object_ref_id,ID)"
			ls_sql_detail = "INSERT into  TAX_LINE (company_id, branch_id, created_by, created_date,last_mdf_by, last_mdf_date,"	
			ls_sql_cols = vstr_dwo_related[1].s_related_obj_column_copy[li_idx + 1]
			ls_sql_cols= trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))			
			if right(ls_sql_cols,1) = ',' then 
				ls_sql_detail += ls_sql_cols + "object_ref_table, object_ref_id,ID, doc_version)"
			else
				ls_sql_detail += ls_sql_cols + ",object_ref_table, object_ref_id,ID, doc_version)"
			end if	
			ls_sql_detail += " VALUES("+string( gi_user_comp_id ) + "," + string( ldb_branch ) + "," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate " 
			ls_from_cols_detail = vstr_dwo_related[1].s_main_obj_column_copy[li_idx+1]
			li_colCnt_detail = lc_string.f_stringtoarray( ls_from_cols_detail, ';', las_from_cols_detail[])		
		end if				
	end if
	ls_sql += " VALUES("+string( gi_user_comp_id ) + "," + string( ldb_branch ) + "," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate " 
	ls_from_cols = vstr_dwo_related[1].s_main_obj_column_copy[li_idx]
	li_colCnt = lc_string.f_stringtoarray( ls_from_cols, ';', las_from_cols[])
	//-- lấy mat cols--//
	if vstr_dwo_related[1].s_match_f_dwo[li_idx] = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
		ls_from_match_cols = vstr_dwo_related[1].s_match_f_column[li_idx]
		if pos(ls_from_match_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_from_match_cols , ';', las_from_match_cols[])
			ls_from_match_cols = las_from_match_cols[1]
		end if
		ls_mat_cols = vstr_dwo_related[1].s_match_column[li_idx]
		if pos(ls_mat_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_mat_cols , ';', las_mat_cols[])
			ls_mat_cols = las_mat_cols[1]
		end if			
	end if
	//-- lấy chk cols for update destination--//
	if  vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
		ls_related_chk_cols = vstr_dwo_related[1].s_related_obj_column_chk[li_idx]
		lc_string.f_stringtoarray( ls_related_chk_cols, ';', las_related_chk_cols[])
	end if
	//-- lấy chk cols source--//
	if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
		ls_main_chk_cols = vstr_dwo_related[1].s_main_obj_column_chk[li_idx]
		lc_string.f_stringtoarray( ls_main_chk_cols, ';', las_main_chk_cols[] )
	end if
	
	FOR li_idx1 = 1 to upperbound(vads_copied[])
		if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
			lb_found = true
			lb_update_orders = false
			FOR li_row = 1 to vads_copied[li_idx1].rowcount()
				//-- check match full--//
				if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_mat_val = vads_copied[li_idx1].getitemnumber(li_row, ls_from_match_cols)
					if isnull(ldb_mat_val) then ldb_mat_val = 0
					ldb_f_ref_id = vads_copied[li_idx1].getitemnumber(li_row, 'id')
					ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
					if isnull(ldb_matched_val) then ldb_matched_val = 0
					if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết--//
					if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
						 if isnull(vads_copied[li_idx1].getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
					end if								
				end if //-- kết thúc: check match full--//
				//-- check common values --//
				if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
					lb_update_orders = true
					for li_idx2 = 1 to upperbound(las_main_chk_cols[])
						if li_row = 1 then
							laa_chk_data[li_idx2] = vads_copied[li_idx1].f_getitemany(li_row, las_main_chk_cols[li_idx2])
						end if
					next					
				end if
				//-- insert--//
				ldb_id = this.f_create_id_ex( rt_transaction)
				FOR li_colnbr= 1 to li_colCnt
					ls_coltype = vads_copied[li_idx1].describe(las_from_cols[li_colnbr]+".coltype")
					if left(ls_coltype, 5) = 'numbe' then
						if las_from_cols[li_colnbr] = ls_from_match_cols then
							ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
						else
							if isnull(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr])) then
								ls_sql_values +=",NULL"
							else	
								ls_sql_values += "," + string(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr]))
							end if
						end if
					elseif left(ls_coltype, 5) = 'char(' then
						if isnull(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else						
							ls_sql_values += ",'" + string(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
						end if
					elseif  left(ls_coltype, 5) = 'datet' then
						if isnull(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else	
							ls_sql_values += ",to_date('" + string(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
						end if
					end if
				NEXT
				if upper(ls_update_table) = 'ORDERS' then					
					ls_sql_values += ",1,'SO','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) + ")"
				elseif upper(ls_update_table) = 'SO_LINE' then
					ls_sql_values += ",'ORDERS',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
				end if				
				ls_sql_exec = ls_sql + ls_sql_values
				EXECUTE immediate :ls_sql_exec using rt_transaction;				
				ls_sql_values =''
				//-- update matching --//
				if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_f_branch_id =vads_copied[li_idx1].getitemnumber(li_row, 'branch_id')
					ls_f_ref_table = upper(vads_copied[li_idx1].describe( "datawindow.table.update"))
					ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
										"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
										"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE,"+ls_mat_cols+")" +&
							" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
							","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+string(ldb_f_doc_id) +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
							",'"+ls_f_ref_table+"','COPY','"+ ls_update_table +"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
										
					EXECUTE immediate :ls_sql_exec using rt_transaction;
					lb_copied = true
				end if
			NEXT
			if lb_update_orders then
				ls_sql_exec = "UPDATE orders set "
				for li_idx2 = 1 to upperbound(las_related_chk_cols[])
					
					ls_data_tmp = string(laa_chk_data[li_idx2])
					if pos(ls_data_tmp,';') > 0 then
						ls_data_tmp = left(ls_data_tmp,pos(ls_data_tmp,';') -1)
					end if
					if li_idx2 = 1 then
						ls_sql_exec += las_related_chk_cols[li_idx2] + "=" + ls_data_tmp
					else
						ls_sql_exec += ","+ las_related_chk_cols[li_idx2] + "=" + ls_data_tmp
					end if
				next
				ls_sql_exec += ' where id = '+string(ldb_version_id)
				EXECUTE immediate :ls_sql_exec using rt_transaction;
			end if
			exit //-- chỉ có 1 dw source -> 1 dw dest --//
		end if		
	NEXT
	//-- ko có datastore dữ iệu copy--//		
	if not lb_found then 
		
		lb_update_orders = false
		lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] 
		ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))

		laa_value[1] = ldb_f_version_id
		if lower(ls_f_ref_table) = 'document' then
			lds_handle.f_add_where( "version_id", laa_value[])
		elseif upper(ls_f_ref_table) = 'ORDERS' then
			lds_handle.f_add_where( "id", laa_value[])
		else
			lds_handle.f_add_where( "object_ref_id", laa_value[])			
			lds_handle_detail.dataobject = 'd_tax_line_grid'
			lds_handle_detail.f_add_where( "doc_version", laa_value[])	
			lds_handle_detail.settransobject( rt_transaction)
			lds_handle_detail.retrieve( )
		end if
		lds_handle.settransobject( rt_transaction)
		lds_handle.retrieve( )
		FOR li_row = 1 to lds_handle.rowcount()
			ldb_f_ref_id = lds_handle.getitemnumber(li_row, 'id')
			//-- check match full--//
			if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
				ldb_mat_val = lds_handle.getitemnumber(li_row, ls_from_match_cols)
				if isnull(ldb_mat_val) then ldb_mat_val = 0				
				ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
				if isnull(ldb_matched_val) then ldb_matched_val = 0
				if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết --//
				if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
					 if isnull(lds_handle.getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
				end if				
			end if //-- kết thúc: check match full--//			
			//-- check common values --//
			if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
				lb_update_orders = true
				for li_idx2 = 1 to upperbound(las_main_chk_cols[])
					if li_row = 1 then
						laa_chk_data[li_idx2] = lds_handle.f_getitemany(li_row, las_main_chk_cols[li_idx2])
					end if
				next					
			end if			
			//-- insert--//
			ldb_id = this.f_create_id_ex( rt_transaction)			
			FOR li_colnbr= 1 to li_colCnt
				ls_coltype = lds_handle.describe(las_from_cols[li_colnbr]+".coltype")
				if left(ls_coltype, 5) = 'numbe' then
					if las_from_cols[li_colnbr] = ls_from_match_cols then
						ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
					else
						if isnull(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else
							ls_sql_values += "," + string(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr]))
						end if
					end if
				elseif left(ls_coltype, 5) = 'char(' then
					if isnull(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",'" + string(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
					end if
				elseif  left(ls_coltype, 5) = 'datet' then
					if isnull(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",to_date('" + string(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
					end if
				end if				
			NEXT
			if upper(ls_update_table) = 'ORDERS' then
				ls_sql_values += ",1,'SO','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) + ")"
			else
				ls_sql_values += ",'ORDERS',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
			end if				
			ls_sql_exec = ls_sql + ls_sql_values
			EXECUTE immediate :ls_sql_exec using rt_transaction;			
			ls_sql_values =''			
			//-- update matching --//
			if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
				ldb_f_branch_id =lds_handle.getitemnumber(li_row, 'branch_id')
				ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))
				ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
									"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
									"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE ,"+ls_mat_cols+")" +&
						" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
						","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+string(ldb_f_doc_id) +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
						",'"+ls_f_ref_table+"','COPY','"+ ls_update_table+"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
									
				EXECUTE immediate :ls_sql_exec using rt_transaction;			
				lb_copied = true
			end if
			//-- insert TAX Line --//
			if upper(ls_update_table) = 'SO_LINE' then

				lds_handle_detail.setfilter( "object_ref_id="+string(ldb_f_ref_id))
				lds_handle_detail.filter( )
				FOR li_row_detail = 1 to lds_handle_detail.rowcount( )
					ldb_id_detail = this.f_create_id_ex( rt_transaction)			
					FOR li_colnbr= 1 to li_colCnt_detail
						ls_coltype = lds_handle_detail.describe(las_from_cols_detail[li_colnbr]+".coltype")
						if left(ls_coltype, 5) = 'numbe' then
			
							if isnull(lds_handle_detail.getitemnumber(li_row_detail ,las_from_cols_detail[li_colnbr])) then
								ls_sql_values +=",NULL"
							else
								ls_sql_values += "," + string(lds_handle_detail.getitemnumber(li_row_detail ,las_from_cols_detail[li_colnbr]))
							end if

						elseif left(ls_coltype, 5) = 'char(' then
							if isnull(lds_handle_detail.getitemstring(li_row_detail ,las_from_cols_detail[li_colnbr])) then
								ls_sql_values +=",NULL"
							else
								ls_sql_values += ",'" + string(lds_handle_detail.getitemstring(li_row_detail ,las_from_cols_detail[li_colnbr]))+"'"
							end if
						elseif  left(ls_coltype, 5) = 'datet' then
							if isnull(lds_handle_detail.getitemdatetime(li_row_detail ,las_from_cols_detail[li_colnbr])) then
								ls_sql_values +=",NULL"
							else
								ls_sql_values += ",to_date('" + string(lds_handle_detail.getitemdatetime(li_row_detail ,las_from_cols_detail[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
							end if
						end if				
					NEXT

					ls_sql_values += ",'SO_LINE',"+string(ldb_id) + "," +string(ldb_id_detail) + "," + string(ldb_version_id) +")"
		
					ls_sql_exec = ls_sql_detail + ls_sql_values
					EXECUTE immediate :ls_sql_exec using rt_transaction;		
				NEXT
				ls_sql_values = ''
			end if //-- kết thúc inser TAX_line --//
		NEXT				
		if lb_update_orders then
			ls_sql_exec = "UPDATE orders set "
			for li_idx2 = 1 to upperbound(las_related_chk_cols[])
				
				ls_data_tmp = string(laa_chk_data[li_idx2])
				if pos(ls_data_tmp,';') > 0 then
					ls_data_tmp = left(ls_data_tmp,pos(ls_data_tmp,';') -1)
				end if
				if li_idx2 = 1 then
					ls_sql_exec += las_related_chk_cols[li_idx2] + "=" + ls_data_tmp
				else
					ls_sql_exec += ","+ las_related_chk_cols[li_idx2] + "=" + ls_data_tmp
				end if
			next
			ls_sql_exec += ' where id = '+string(ldb_version_id)
			EXECUTE immediate :ls_sql_exec using rt_transaction;
		end if		
	end if //--kết thúc: ko có datastore dữ iệu copy--//	
NEXT
destroy lds_handle
if lb_copied then
	commit using rt_transaction;
else
	rollback using rt_transaction;
	gf_messagebox('m.b_obj_instantiate.f_copy_to_so.02','Thông báo','Phiếu đã kết hết','stop','ok',1)
	return 0
end if

return ldb_t_doc_id
end function

public function integer f_update_line_itemchanged_ex (string vs_edit_colname, string vs_editdata, string vs_upd_colname, long vl_line_row, ref t_dw_mpl rdw_line, s_str_data vstr_currency);		/*--------------------------------------------------------------------------///
		Mô tả chức năng:2
		---------------------------------

-----------------------------------------------------------------------------------------
Hàm này đươc gọi sau khi đã cập nhật giá từ bảng giá cho dw-line
================================================	*/	
double				ldb_base_cur, ldb_round_id_base_amt, ldb_round_id_base_price, ldb_round_id_amt, ldb_round_id_price
dec					ldb_amount, ldb_base_amount, ldc_qty, ldc_price, ldc_vat_amt, ldc_vat_pct, ldc_disc_amt, ldc_disc_pct, ldb_amount_tmp
dec					ldc_base_price, ldc_act_qty, ldc_act_price, ldc_act_amount, ldc_PRICE_EX_TAX, ldc_AMOUNT_EX_TAX, ldc_BASE_AMOUNT_EX_TAX
dec					ldc_ACT_PRICE_EX_TAX, ldc_ACT_AMOUNT_EX_TAX, ldc_ACT_BASE_AMOUNT_EX_TAX, ldc_qty_tmp
string					ls_base_curcode,ls_base_curname, lsa_colname[]
int						li_colCnt, li_idx
c_string				lc_string
c_unit_instance		lc_unit

t_transaction		lt_transaction

//-- Tạo connection voi database --//
lt_transaction = create t_transaction
lt_transaction.dbms =	SQLCA.DBMS
lt_transaction.ServerName	 = SQLCA.ServerName
lt_transaction.LogId	 = SQLCA.LogId
lt_transaction.LogPass 	 = SQLCA.LogPass 
lt_transaction.AutoCommit 	 = false 
lt_transaction.DBParm	 = SQLCA.DBParm

connect using lt_transaction;
 //-- chuẩn bị cho làm tròn  --//
lc_unit.f_get_base_cur_ex(ldb_base_cur,  ls_base_curcode,ls_base_curname, lt_transaction)
if ldb_base_cur > 0 then 
	ldb_round_id_base_amt =  lc_unit.f_get_round_id_ex( ldb_base_cur, 0, 'amount', lt_transaction)
	ldb_round_id_base_price =  lc_unit.f_get_round_id_ex( ldb_base_cur, 0, 'price', lt_transaction)
end if
if vstr_currency.adb_data[1] <> ldb_base_cur then
	ldb_round_id_amt =  lc_unit.f_get_round_id_ex( vstr_currency.adb_data[1], 0, 'amount', lt_transaction)
	ldb_round_id_price =  lc_unit.f_get_round_id_ex( vstr_currency.adb_data[1], 0, 'price', lt_transaction)	
else
	ldb_round_id_amt = ldb_round_id_base_amt
	ldb_round_id_price = ldb_round_id_base_price
end if
//-- tính toán lại giá trị các cột liên quan--//	
if vs_edit_colname = 'qty' then
	ldc_qty = dec(vs_editdata)
	ldc_price = rdw_line.getitemnumber(vl_line_row, 'price')	
	ldc_disc_pct  = rdw_line.getitemnumber(vl_line_row, 'discount_pct')	
	if isnull(ldc_disc_pct) then ldc_disc_pct = 0
	ldc_disc_amt  =  rdw_line.getitemnumber(vl_line_row, 'discount')	
	if isnull(ldc_disc_amt) then ldc_disc_amt = 0
	
	//-- amount--//
	if ldc_disc_pct = 0 and ldc_disc_amt = 0 then
		ldb_amount = lc_unit.f_round( lt_transaction, ldb_round_id_amt, ldc_price*ldc_qty)
	else
		ldb_amount= lc_unit.f_round( lt_transaction, ldb_round_id_amt, ldc_price*ldc_qty/(1 + ldc_disc_pct/100))
	end if
	//-- base_amount--//
	if vstr_currency.adb_data[1] = ldb_base_cur then
		ldb_base_amount = ldb_amount	
	else
		ldb_base_amount = ldb_amount * vstr_currency.adb_data[2]
		ldb_base_amount = lc_unit.f_round( lt_transaction, ldb_round_id_base_amt, ldb_base_amount)
	end if
	//--vat--//
	if rdw_line.describe('vat.coltype') = 'number' then
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'vat')					
	else
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'tax_pct')	
	end if
	if isnull(ldc_vat_pct) then ldc_vat_pct = 0
	ldc_vat_amt = lc_unit.f_round( lt_transaction, ldb_round_id_base_amt, ldb_base_amount*ldc_vat_pct/100) 
	//--amount_ex_tax--//
	ldc_AMOUNT_EX_TAX = ldb_amount
	//--base_amount_ex_tax--//
	ldc_BASE_AMOUNT_EX_TAX = ldb_base_amount
	//-- act_qty--//
	ldc_act_qty = ldc_qty	
	//--act_amount--//
	ldc_act_amount = ldb_amount
	//--act_amount_ex_tax--//
	ldc_ACT_AMOUNT_EX_TAX = ldc_AMOUNT_EX_TAX
	//--act_base_amount_ex_tax--//
	ldc_ACT_BASE_AMOUNT_EX_TAX = ldc_BASE_AMOUNT_EX_TAX
elseif vs_edit_colname = 'price' then
	ldc_price = double(vs_editdata)
	ldc_price_ex_tax = ldc_price
	ldc_qty = rdw_line.getitemnumber(vl_line_row, 'qty')	
	ldc_disc_pct  = rdw_line.getitemnumber(vl_line_row, 'discount_pct')	
	if isnull(ldc_disc_pct) then ldc_disc_pct = 0
	ldc_disc_amt  =  rdw_line.getitemnumber(vl_line_row, 'discount')	
	if isnull(ldc_disc_amt) then ldc_disc_amt = 0
	
	//-- base_price--//
	if vstr_currency.adb_data[1] = ldb_base_cur then
		ldc_base_price = ldc_price
	else
		ldc_base_price = ldc_price * vstr_currency.adb_data[2]
		ldc_base_price = lc_unit.f_round( lt_transaction, ldb_round_id_base_price, ldc_base_price)
	end if
	//-- amount--//
	if ldc_disc_pct = 0 and ldc_disc_amt = 0 then
		ldb_amount = lc_unit.f_round( lt_transaction, ldb_round_id_amt, ldc_price*ldc_qty)
	else
		ldb_amount= lc_unit.f_round( lt_transaction, ldb_round_id_amt, ldc_price*ldc_qty/(1 + ldc_disc_pct/100))
	end if	
	//-- base_amount--//
	if vstr_currency.adb_data[1] = ldb_base_cur then
		ldb_base_amount = ldb_amount	
	else
		ldb_base_amount = ldb_amount * vstr_currency.adb_data[2]
		ldb_base_amount = lc_unit.f_round( lt_transaction, ldb_round_id_base_amt, ldb_base_amount)
	end if
	//--vat--//
	if rdw_line.describe('vat.coltype') = 'number' then
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'vat')				
	else
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'tax_pct')	
	end if
	if isnull(ldc_vat_pct) then ldc_vat_pct = 0
	ldc_vat_amt = lc_unit.f_round( lt_transaction, ldb_round_id_base_amt, ldb_base_amount*ldc_vat_pct/100) 
	//--amount_ex_tax--//
	ldc_AMOUNT_EX_TAX = ldb_amount
	//--base_amount_ex_tax--//
	ldc_BASE_AMOUNT_EX_TAX = ldb_base_amount
	//-- act_qty--//
	ldc_act_qty = ldc_qty	
	//--act_amount--//
	ldc_act_amount = ldb_amount
	//--act_amount_ex_tax--//
	ldc_ACT_AMOUNT_EX_TAX = ldc_AMOUNT_EX_TAX
	//--act_base_amount_ex_tax--//
	ldc_ACT_BASE_AMOUNT_EX_TAX = ldc_BASE_AMOUNT_EX_TAX
elseif vs_edit_colname = 'amount' then
	ldb_amount = double(vs_editdata)
	ldc_qty = rdw_line.getitemnumber(vl_line_row, 'qty')	
	if isnull(ldc_qty) or ldc_qty = 0 then ldc_qty = 1	

	//-- reset discount: nếu có--//
	ldc_disc_pct  = 0
	ldc_disc_amt  =  0
	//-- price--//
	ldc_price = lc_unit.f_round( lt_transaction, ldb_round_id_base_price, ldb_amount/ldc_qty)
	ldc_price_ex_tax = ldc_price
	//--base_price--//
	if vstr_currency.adb_data[1] = ldb_base_cur then
		ldc_base_price = ldc_price
	else
		ldc_base_price = ldc_price * vstr_currency.adb_data[2]
		ldc_base_price = lc_unit.f_round( lt_transaction, ldb_round_id_price, ldc_base_price)
	end if	
	//-- base_amount--//
	if vstr_currency.adb_data[1] = ldb_base_cur then
		ldb_base_amount = ldb_amount	
	else
		ldb_base_amount = ldb_amount * vstr_currency.adb_data[2]
		ldb_base_amount = lc_unit.f_round( lt_transaction, ldb_round_id_base_amt, ldb_base_amount)
	end if
	//--vat--//
	if rdw_line.describe('vat.coltype') = 'number' then
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'vat')				
	else
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'tax_pct')	
	end if
	if isnull(ldc_vat_pct) then ldc_vat_pct = 0
	ldc_vat_amt = lc_unit.f_round( lt_transaction, ldb_round_id_base_amt, ldb_base_amount*ldc_vat_pct/100) 
	//--amount_ex_tax--//
	ldc_AMOUNT_EX_TAX = ldb_amount
	//--base_amount_ex_tax--//
	ldc_BASE_AMOUNT_EX_TAX = ldb_base_amount
	//-- act_qty--//
//	ldc_act_qty = ldc_qty	
	//--act_amount--//
//	ldc_act_amount = ldb_amount
	//--act_amount_ex_tax--//
//	ldc_ACT_AMOUNT_EX_TAX = ldc_AMOUNT_EX_TAX
	//--act_base_amount_ex_tax--//
//	ldc_ACT_BASE_AMOUNT_EX_TAX = ldc_BASE_AMOUNT_EX_TAX 	
elseif vs_edit_colname = 'base_amount' then	
elseif vs_edit_colname = 'base_price' then	
	ldc_base_price = double(vs_editdata)
	ldc_qty = rdw_line.getitemnumber(vl_line_row, 'qty')	
	
	//-- base_amount--//
	ldb_base_amount = ldc_base_price*	ldc_qty
	//--vat--//
	if rdw_line.describe('vat.coltype') = 'number' then
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'vat')				
	else
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'tax_pct')	
	end if
	if isnull(ldc_vat_pct) then ldc_vat_pct = 0
	ldc_vat_amt = lc_unit.f_round( lt_transaction, ldb_round_id_base_amt, ldb_base_amount*ldc_vat_pct/100) 
	//--amount_ex_tax--//
//	ldc_AMOUNT_EX_TAX = ldb_amount
	//--base_amount_ex_tax--//
	ldc_BASE_AMOUNT_EX_TAX = ldb_base_amount	
elseif vs_edit_colname = 'act_qty' then	
elseif vs_edit_colname = 'act_price' then
	
elseif vs_edit_colname = 'act_amount' then
elseif vs_edit_colname = 'vat' then
	ldb_amount =  rdw_line.getitemnumber(vl_line_row, 'amount')	
	ldc_vat_pct = dec(vs_editdata )
	ldc_vat_amt = lc_unit.f_round( lt_transaction, ldb_round_id_base_amt, ldb_amount*ldc_vat_pct/100) 
elseif vs_edit_colname = 'tax_pct' then
	ldc_vat_pct = dec(vs_editdata )
	ldc_BASE_AMOUNT_EX_TAX = rdw_line.getitemnumber(vl_line_row, 'base_amount_ex_tax')	
	ldc_vat_amt = lc_unit.f_round( lt_transaction, ldb_round_id_base_amt, ldc_BASE_AMOUNT_EX_TAX*ldc_vat_pct/100) 
elseif vs_edit_colname = 'discount_pct' then
	ldc_disc_pct = dec(vs_editdata )
	ldc_qty = rdw_line.getitemnumber(vl_line_row, 'qty')	
	ldc_price = rdw_line.getitemnumber(vl_line_row, 'price')	
	ldb_amount_tmp =  ldc_qty * ldc_price
	
	//-- amount--//
	ldb_amount = lc_unit.f_round( lt_transaction, ldb_round_id_amt, ldb_amount_tmp/(1 + ldc_disc_pct/100))
	//-- discount--//
	ldc_disc_amt = ldb_amount_tmp - ldb_amount
	//-- base_amount--//
	if vstr_currency.adb_data[1] = ldb_base_cur then
		ldb_base_amount = ldb_amount	
	else
		ldb_base_amount = ldb_amount * vstr_currency.adb_data[2]
		ldb_base_amount = lc_unit.f_round( lt_transaction, ldb_round_id_base_amt, ldb_base_amount)
	end if
	//-- base_price--//
	ldc_qty_tmp = ldc_qty
	if ldc_qty_tmp = 0 or isnull(ldc_qty_tmp) then ldc_qty_tmp = 1
	ldc_base_price = lc_unit.f_round( lt_transaction, ldb_round_id_base_price, ldb_base_amount /ldc_qty_tmp)	
	//--vat--//
	if rdw_line.describe('vat.coltype') = 'number' then
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'vat')				
	else
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'tax_pct')	
	end if
	if isnull(ldc_vat_pct) then ldc_vat_pct = 0
	ldc_vat_amt = lc_unit.f_round( lt_transaction, ldb_round_id_base_amt, ldb_base_amount*ldc_vat_pct/100) 
	//--amount_ex_tax--//
	ldc_AMOUNT_EX_TAX = ldb_amount
	//--base_amount_ex_tax--//
	ldc_BASE_AMOUNT_EX_TAX = ldb_base_amount
	//-- act_qty--//
	ldc_act_qty = ldc_qty	
	//--act_amount--//
	ldc_act_amount = ldb_amount
	//--act_amount_ex_tax--//
	ldc_ACT_AMOUNT_EX_TAX = ldc_AMOUNT_EX_TAX
	//--act_base_amount_ex_tax--//
	ldc_ACT_BASE_AMOUNT_EX_TAX = ldc_BASE_AMOUNT_EX_TAX	
elseif vs_edit_colname = 'discount' then	
	ldc_disc_amt  = dec(vs_editdata )
	ldc_qty = rdw_line.getitemnumber(vl_line_row, 'qty')		
	ldc_price = rdw_line.getitemnumber(vl_line_row, 'price')	
	ldb_amount_tmp =  ldc_qty * ldc_price	
	
	//-- amount--//
	ldb_amount =  ldb_amount_tmp - ldc_disc_amt
	//-- discount_pct--//
	ldc_disc_pct = round( ldc_disc_amt/ldb_amount *100, 0)
	//-- base_amount--//
	if vstr_currency.adb_data[1] = ldb_base_cur then
		ldb_base_amount = ldb_amount	
	else
		ldb_base_amount = ldb_amount * vstr_currency.adb_data[2]
		ldb_base_amount = lc_unit.f_round( lt_transaction, ldb_round_id_base_amt, ldb_base_amount)
	end if
	//-- base_price--//
	ldc_qty_tmp = ldc_qty
	if ldc_qty_tmp = 0 or isnull(ldc_qty_tmp) then ldc_qty_tmp = 1
	ldc_base_price = lc_unit.f_round( lt_transaction, ldb_round_id_base_price, ldb_base_amount /ldc_qty_tmp)

	//--vat--//
	if rdw_line.describe('vat.coltype') = 'number' then
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'vat')				
	else
		ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'tax_pct')	
	end if
	if isnull(ldc_vat_pct) then ldc_vat_pct = 0
	ldc_vat_amt = lc_unit.f_round( lt_transaction, ldb_round_id_base_amt, ldb_base_amount*ldc_vat_pct/100) 
	//--amount_ex_tax--//
	ldc_AMOUNT_EX_TAX = ldb_amount
	//--base_amount_ex_tax--//
	ldc_BASE_AMOUNT_EX_TAX = ldb_base_amount
	//-- act_qty--//
	ldc_act_qty = ldc_qty	
	//--act_amount--//
	ldc_act_amount = ldb_amount
	//--act_amount_ex_tax--//
	ldc_ACT_AMOUNT_EX_TAX = ldc_AMOUNT_EX_TAX
	//--act_base_amount_ex_tax--//
	ldc_ACT_BASE_AMOUNT_EX_TAX = ldc_BASE_AMOUNT_EX_TAX		
elseif vs_edit_colname = 'disc_pct' then
	ldc_qty = rdw_line.getitemnumber(vl_line_row, 'qty')	
	ldc_price = rdw_line.getitemnumber(vl_line_row, 'price')		
	ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'vat')	
	ldc_disc_pct = dec(vs_editdata )
	if isnull(ldc_disc_pct) then ldc_disc_pct = 0
	ldc_disc_amt =  lc_unit.f_round( lt_transaction, ldb_round_id_base_price,  ldc_price*ldc_qty*ldc_disc_pct/100) 
	ldb_amount = ldc_price*ldc_qty - ldc_disc_amt
	ldb_base_amount = ldb_amount	
	ldc_vat_amt = lc_unit.f_round( lt_transaction, ldb_round_id_base_price, ldb_amount*ldc_vat_pct/100) 	
elseif vs_edit_colname = 'disc_amt' then
	ldc_qty = rdw_line.getitemnumber(vl_line_row, 'qty')	
	ldc_price = rdw_line.getitemnumber(vl_line_row, 'price')	
	ldc_vat_pct = rdw_line.getitemnumber(vl_line_row, 'vat')	
	ldc_disc_amt = dec(vs_editdata )
	if isnull(ldc_disc_pct) then ldc_disc_pct = 0	
	ldb_amount = ldc_price*ldc_qty - ldc_disc_amt
	ldc_disc_pct =  round(ldc_disc_amt / (ldc_price*ldc_qty)*100,0)
	ldb_base_amount = ldb_amount	
	ldc_vat_amt = lc_unit.f_round( lt_transaction, ldb_round_id_base_price, ldb_amount*ldc_vat_pct/100) 
end if

//-- Cập nhật lại line --//
li_colCnt = lc_string.f_stringtoarray( vs_upd_colname, ';', lsa_colname[])
FOR li_idx = 1 to li_colCnt
	if  lsa_colname[li_idx] = 'price' then
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_price)
	elseif lsa_colname[li_idx] = 'amount' then
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_amount)
	elseif lsa_colname[li_idx] = 'base_amount' then
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldb_base_amount)
	elseif lsa_colname[li_idx] = 'base_price' then
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_base_price)	
	elseif lsa_colname[li_idx] = 'act_qty' then
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_act_qty)
	elseif lsa_colname[li_idx] = 'act_price' then
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_act_price)
	elseif lsa_colname[li_idx] = 'act_amount' then
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_act_amount)
	elseif  lsa_colname[li_idx] = 'price_ex_tax' then
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_price_ex_tax)
	elseif  lsa_colname[li_idx] = 'amount_ex_tax' then
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_amount_ex_tax)
	elseif  lsa_colname[li_idx] = 'base_amount_ex_tax' then
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_base_amount_ex_tax)	
	elseif  lsa_colname[li_idx] = 'act_price_ex_tax' then
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_act_price_ex_tax)
	elseif  lsa_colname[li_idx] = 'act_amount_ex_tax' then
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_act_amount_ex_tax)
	elseif  lsa_colname[li_idx] = 'act_base_amount_ex_tax' then
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_act_base_amount_ex_tax)
	elseif lsa_colname[li_idx] = 'vat_amount' then	
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_vat_amt)
	elseif lsa_colname[li_idx] = 'tax_correction' then	
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_vat_amt)
	elseif  lsa_colname[li_idx] = 'disc_pct' then	
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_disc_pct)
	elseif  lsa_colname[li_idx] = 'disc_amt' then	
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_disc_amt)		
	elseif  lsa_colname[li_idx] = 'discount' then	
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_disc_amt)
	elseif  lsa_colname[li_idx] = 'discount_pct' then	
		rdw_line.setitem(vl_line_row,  lsa_colname[li_idx] , ldc_disc_pct)
	end if						
NEXT

disconnect  using lt_transaction;
destroy lt_transaction

return 1
end function

public function integer f_get_struct_id_n_combchar_ex (string vs_code, ref double rdb_id, ref string rs_char, ref t_transaction rt_transaction);

//setnull(ls_code)
if isnull(vs_code) then return 0

select id, combine_char into :rdb_id , :rs_char from flexible_data where code = :vs_code using rt_transaction;

if rt_transaction.sqlcode = 0 then
	return 1
else
	gf_messagebox('m.b_obj_instantiate.f_get_struct_id_n_combChar.01','Thông báo','Không tìm thấy mã cấu trúc có Mã:@'+vs_code,'exclamation','ok',1) 			
	return 0
end if
end function

public function double f_copy_to_goods_delivery (s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial);string				ls_sql, ls_code, ls_currCode, ls_currName, ls_sql_cols, ls_update_table, ls_related_data, las_f_doc_id[], ls_f_ref_table, ls_f_versions
string				ls_main_chk_cols, las_main_chk_cols[], ls_related_chk_cols, las_related_chk_cols[], ls_data_tmp, las_initvalue_cols[], ls_qty_yn, ls_val_yn
string				las_from_cols[], ls_from_cols, ls_sql_values, ls_coltype, ls_sql_exec, ls_from_match_cols, las_from_match_cols[], ls_mat_cols, las_mat_cols[]
double			ldb_id,ldb_f_doc_id, ldb_t_doc_id, ldb_version_id, ldb_trans_id, ldb_base_currID, ldb_mat_val, ldb_matched_val, ldb_f_ref_id, ldb_f_branch_id
double			ldb_f_version_id, ldb_branch, ldb_manage_group, ladb_f_version[]
int					li_idx, li_idx1, li_idx2, li_row, li_colnbr, li_colCnt, li_pos, li_cnt, li_idx_version, li_pos2
boolean			lb_found, lb_copied, lb_update_orders
any				laa_value[], laa_chk_data[], la_initvalue
t_ds_db				lds_handle
c_string				lc_string
c_unit_instance 	lc_unit_ins
c_dwsetup_initial	lc_dwsetup_initial

//--------------------------//
// lấy giao dịch của SO //
//-------------------------//
li_pos =  pos( vstr_dwo_related[1].s_data[1] , "(" )
if li_pos > 0 then
	ls_related_data = mid(vstr_dwo_related[1].s_data[1], li_pos +1, pos(vstr_dwo_related[1].s_data[1] , ')') - (li_pos + 1)  )
	li_cnt = lc_string.f_Stringtoarray( ls_related_data, ',', las_f_doc_id[])
else
	las_f_doc_id[1] = vstr_dwo_related[1].s_data[1]
	li_cnt =1
end if

ldb_id = double(las_f_doc_id[1] )
FOR li_idx =1 to li_cnt
	ldb_f_doc_id = double(las_f_doc_id[li_idx])
	select version_id into :ladb_f_version[li_idx]
	from document
	where id = :ldb_f_doc_id
	using rt_transaction;
	ls_f_versions += string(ladb_f_version[li_idx])+'['+string(li_idx)+']'
NEXT

lds_handle = create t_ds_db
lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo
ls_update_table = lds_handle.describe( "datawindow.table.update")
if lower(ls_update_table) = 'document' then
	//-- copy header --//
	ldb_f_doc_id = ldb_id
	select count(t2.id) into :li_cnt
	from document t
	join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
	join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'GOODS_DELIVERY'
	where t.company_id = :gi_user_comp_id
//	and t.branch_id = :gdb_branch
	and t.id =  :ldb_id
	using rt_transaction;
	if li_cnt = 1 then
		select t2.id, t.version_id, t.branch_id , t.manage_group, t2.QUANTITY_YN, t2.VALUE_YN
		into :ldb_trans_id, :ldb_f_version_id, :ldb_branch, :ldb_manage_group, :ls_qty_yn, :ls_val_yn
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'GOODS_DELIVERY'
		where t.company_id = :gi_user_comp_id
//		and t.branch_id = :gdb_branch
		and t.id =  :ldb_id
		using rt_transaction;
		
		if isnull(ldb_manage_group) then ldb_manage_group = 0
		if isnull(ls_qty_yn) then ls_qty_yn = 'N'
		if isnull(ls_val_yn) then ls_val_yn = 'N'
	else
		gf_messagebox('m.b_obj_instantiate.f_copy_to_goods_delivery.01','Thông báo','Chưa cài đặt giao dịch cho SO thuộc nhóm copy','stop','ok',1)
		return -1
	end if
else
	//-- copy line --//
	select object_ref_id, branch_id into :ldb_f_version_id, :ldb_branch
	from pr_line t
	where t.id = :ldb_id
//	and t.branch_id = :gdb_branch
	and  t.company_id = :gi_user_comp_id
	using rt_transaction;
	
	select count(t2.id) 
	into :li_cnt
	from document t
	join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
	join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'GOODS_DELIVERY'
	where t.company_id = :gi_user_comp_id
	and t.branch_id = :ldb_branch
	and t.version_id = :ldb_f_version_id
	using rt_transaction;
	
	if li_cnt = 1 then
		select t2.id, t.id into :ldb_trans_id, :ldb_f_doc_id
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'GOODS_DELIVERY'
		where t.company_id = :gi_user_comp_id
		and t.branch_id = :ldb_branch
		and t.version_id =  :ldb_f_version_id
		using rt_transaction;
	else
		gf_messagebox('m.b_obj_instantiate.f_copy_to_goods_delivery.01','Thông báo','Chưa cài đặt giao dịch cho SO thuộc nhóm copy','stop','ok',1)
		return -1
	end if	
end if

//---------------------//
// insert document  //
//--------------------//
ldb_t_doc_id = this.f_create_id_ex( rt_transaction)
ldb_version_id =  this.f_create_id_ex( rt_transaction)
ls_code = rdwsetup_initial.f_get_autonumber_ex('code','d_doc_goods_delivery_grid', rt_transaction)
ls_sql = "INSERT into DOCUMENT(id,company_id, branch_id,object_ref_table, created_by, created_date,last_mdf_by, last_mdf_date,"+&
									" doc_type, version_id, SOB, handled_by, CODE, document_date, TRANS_HDR_ID,status, manage_group)" +&
			" VALUES("+string(ldb_t_doc_id)+ "," + string( gi_user_comp_id ) + "," + string( ldb_branch ) + ",'BOOKED_SLIP' ," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate, " +&
						"'GOODS_DELIVERY',"+string(ldb_version_id) +", 'F',"+string(gi_userid) + ",'"+ls_code +"', trunc(sysdate)"+ ","+string(ldb_trans_id) +", 'new',"+ string(ldb_manage_group)+ ")"
EXECUTE immediate :ls_sql using rt_transaction;



//--------------------//
// insert table  //
//--------------------//

FOR li_idx = 1 to upperbound(vstr_dwo_related[1].s_related_obj_dwo_copy[] )	
	lds_handle.dataobject = vstr_dwo_related[1].s_related_obj_dwo_copy[li_idx]
	ls_update_table = lds_handle.describe( "datawindow.table.update")	

	ls_sql = "INSERT into "+ls_update_table +"(company_id, branch_id, created_by, created_date,last_mdf_by, last_mdf_date,"				
	ls_sql_cols = vstr_dwo_related[1].s_related_obj_column_copy[li_idx]
	ls_sql_cols= trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))
	if vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then //-- công thêm các column lấy giá trị default --//
		ls_sql_cols += vstr_dwo_related[1].s_related_obj_column_chk[li_idx]
		ls_sql_cols = trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))
		lc_string.f_stringtoarray( vstr_dwo_related[1].s_related_obj_column_chk[li_idx], ';', las_initvalue_cols[])		
	end if	
	
	if right(ls_sql_cols,1) = ',' then 
		if upper(ls_update_table) = 'BOOKED_SLIP' then
			ls_sql += ls_sql_cols + "version_no,doc_type,object_ref_table, object_ref_id,ID,QUANTITY_YN,VALUE_YN)"
		else
			ls_sql += ls_sql_cols + "object_ref_table, object_ref_id,ID)"
		end if
	else
		if upper(ls_update_table) = 'BOOKED_SLIP' then
			ls_sql += ls_sql_cols + ",version_no,doc_type,object_ref_table, object_ref_id,ID)"
		else
			ls_sql += ls_sql_cols + ",object_ref_table, object_ref_id,ID)"
		end if
	end if
	ls_sql += " VALUES("+string( gi_user_comp_id ) + "," + string( ldb_branch ) + "," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate " 
	ls_from_cols = vstr_dwo_related[1].s_main_obj_column_copy[li_idx]
	li_colCnt = lc_string.f_stringtoarray( ls_from_cols, ';', las_from_cols[])
	//-- lấy mat cols--//
	if vstr_dwo_related[1].s_match_f_dwo[li_idx] = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
		ls_from_match_cols = vstr_dwo_related[1].s_match_f_column[li_idx]
		if pos(ls_from_match_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_from_match_cols , ';', las_from_match_cols[])
			ls_from_match_cols = las_from_match_cols[1]
		end if
		ls_mat_cols = vstr_dwo_related[1].s_match_column[li_idx]
		if pos(ls_mat_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_mat_cols , ';', las_mat_cols[])
			ls_mat_cols = las_mat_cols[1]
		end if			
	end if
//	//-- lấy chk cols for update destination--//
//	if  vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
//		ls_related_chk_cols = vstr_dwo_related[1].s_related_obj_column_chk[li_idx]
//		lc_string.f_stringtoarray( ls_related_chk_cols, ';', las_related_chk_cols[])
//	end if
	//-- lấy chk cols source--//
	if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
		ls_main_chk_cols = vstr_dwo_related[1].s_main_obj_column_chk[li_idx]
		lc_string.f_stringtoarray( ls_main_chk_cols, ';', las_main_chk_cols[] )
	end if
	
	FOR li_idx1 = 1 to upperbound(vads_copied[])
		if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
			lb_found = true
			lb_update_orders = false
			FOR li_row = 1 to vads_copied[li_idx1].rowcount()
				//-- check match full--//
				if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_mat_val = vads_copied[li_idx1].getitemnumber(li_row, ls_from_match_cols)
					if isnull(ldb_mat_val) then ldb_mat_val = 0
					ldb_f_ref_id = vads_copied[li_idx1].getitemnumber(li_row, 'id')
					ldb_f_version_id = vads_copied[li_idx1].getitemnumber(li_row, 'object_ref_id')
					li_pos = pos(ls_f_versions,string(ldb_f_version_id)+'[') 
					li_pos2 =  pos(ls_f_versions,']', li_pos) 					
					li_idx_version = integer(mid( ls_f_versions, li_pos + len(string(ldb_f_version_id))+1, li_pos2 - ( li_pos + len(string(ldb_f_version_id))+1) ))
					
					if vstr_dwo_related[1].b_chk_matched_qty then
						ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
						if isnull(ldb_matched_val) then ldb_matched_val = 0
					else
						ldb_matched_val = 0
					end if						
					if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết--//
					if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
						 if isnull(vads_copied[li_idx1].getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
					end if								
				end if 			//-- kết thúc: check match full--//	
				//-- check common values --//
				if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
					lb_update_orders = true
					for li_idx2 = 1 to upperbound(las_main_chk_cols[])
						if li_row = 1 then
							laa_chk_data[li_idx2] = vads_copied[li_idx1].f_getitemany(li_row, las_main_chk_cols[li_idx2])
						end if
					next					
				end if
				//-- insert--//
				ldb_id = this.f_create_id_ex( rt_transaction)
				FOR li_colnbr= 1 to li_colCnt
					ls_coltype = vads_copied[li_idx1].describe(las_from_cols[li_colnbr]+".coltype")
					if left(ls_coltype, 5) = 'numbe' then
						if las_from_cols[li_colnbr] = ls_from_match_cols then
							ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
						else
							if isnull(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr])) then
								ls_sql_values +=",NULL"
							else	
								ls_sql_values += "," + string(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr]))
							end if
						end if
					elseif left(ls_coltype, 5) = 'char(' then
						if isnull(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else						
							ls_sql_values += ",'" + string(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
						end if
					elseif  left(ls_coltype, 5) = 'datet' then
						if isnull(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else	
							ls_sql_values += ",to_date('" + string(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
						end if
					end if
				NEXT
				//-- default values --//		
				if upperbound(las_initvalue_cols[]) > 0 then
					FOR li_colnbr = 1 to upperbound(las_initvalue_cols[])
						if las_initvalue_cols[li_colnbr] = 'trans_date'  then
							ls_sql_values += ",to_date('" + string(gd_session_date ,gs_w_date_format )+"','"+gs_w_date_format+"')"
						else
							lc_dwsetup_initial.f_init_ids_setup_dw_ex( ldb_branch , 'u_detail_goods_delivery', rt_transaction)
							lc_dwsetup_initial.f_get_initvalue('d_inventory_line_delivery_grid',las_initvalue_cols[li_colnbr],ldb_branch ,la_initvalue )	
							ls_sql_values += "," + string(la_initvalue)
						end if
					NEXT
				end if
				//-values khác--//
				if upper(ls_update_table) = 'BOOKED_SLIP' then
					ls_sql_values += ",1,'GOODS_DELIVERY','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id)+",'"+ls_qty_yn+"','"+ls_val_yn + "')"
				else
					ls_sql_values += ",'BOOKED_SLIP',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
					
				end if				
				ls_sql_exec = ls_sql + ls_sql_values
				EXECUTE immediate :ls_sql_exec using rt_transaction;				
				ls_sql_values =''
				//-- update matching --//
				if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_f_branch_id =vads_copied[li_idx1].getitemnumber(li_row, 'branch_id')
					ls_f_ref_table = upper(vads_copied[li_idx1].describe( "datawindow.table.update"))
					ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
										"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
										"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE,"+ls_mat_cols+")" +&
							" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
							","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+las_f_doc_id[li_idx_version] +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
							",'"+ls_f_ref_table+"','COPY','"+ ls_update_table +"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
										
					EXECUTE immediate :ls_sql_exec using rt_transaction;
					lb_copied = true
				end if
			NEXT
			exit //-- chỉ có 1 dw source -> 1 dw dest --//
		end if		
	NEXT
	//-- ko có datastore dữ iệu copy--//		
	if not lb_found then 
		lb_update_orders = false
		lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] 
		ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))
		FOR li_idx1 = 1 to upperbound(ladb_f_version[])
			laa_value[1] = ladb_f_version[li_idx1]
			if ls_f_ref_table = 'BOOKED_SLIP' or  ls_f_ref_table = 'ORDERS' then
				if li_idx1 > 1 then continue //-- booked_slip /orders chỉ cần insert 1 lần --//
				lds_handle.f_add_where( "id", laa_value[])
			else
				lds_handle.f_add_where( "object_ref_id", laa_value[])
			end if
			lds_handle.settransobject( rt_transaction)
			lds_handle.retrieve( )
			FOR li_row = 1 to lds_handle.rowcount()
				//-- check match full--//
				if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_mat_val = lds_handle.getitemnumber(li_row, ls_from_match_cols)
					if isnull(ldb_mat_val) then ldb_mat_val = 0
					ldb_f_ref_id = lds_handle.getitemnumber(li_row, 'id')
					if vstr_dwo_related[1].b_chk_matched_qty then
						ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
						if isnull(ldb_matched_val) then ldb_matched_val = 0
					else
						ldb_matched_val = 0
					end if		
					if isnull(ldb_matched_val) then ldb_matched_val = 0
					if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết --//
					if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
						 if isnull(lds_handle.getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
					end if				
				end if //-- kết thúc: check match full--//			
				
				//-- check common values --//
				if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
					lb_update_orders = true
					for li_idx2 = 1 to upperbound(las_main_chk_cols[])
						if li_row = 1 then
							laa_chk_data[li_idx2] = lds_handle.f_getitemany(li_row, las_main_chk_cols[li_idx2])
						end if
					next					
				end if			
				//-- insert--//
				ldb_id = this.f_create_id_ex( rt_transaction)			
				FOR li_colnbr= 1 to li_colCnt
					ls_coltype = lds_handle.describe(las_from_cols[li_colnbr]+".coltype")
					if left(ls_coltype, 5) = 'numbe' then
						if las_from_cols[li_colnbr] = ls_from_match_cols then
							ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
						else
							if isnull(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr])) then
								ls_sql_values +=",NULL"
							else
								ls_sql_values += "," + string(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr]))
							end if
						end if
					elseif left(ls_coltype, 5) = 'char(' then
						if isnull(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else
							ls_sql_values += ",'" + string(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
						end if
					elseif  left(ls_coltype, 5) = 'datet' then
						if isnull(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else
							ls_sql_values += ",to_date('" + string(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
						end if
					end if				
				NEXT
				//-- default values --//		
				if upperbound(las_initvalue_cols[]) > 0 then
					FOR li_colnbr = 1 to upperbound(las_initvalue_cols[])
						if las_initvalue_cols[li_colnbr] = 'trans_date'  then
							ls_sql_values += ",to_date('" + string(gd_session_date ,gs_w_date_format )+"','"+gs_w_date_format+"')"
						else
							lc_dwsetup_initial.f_init_ids_setup_dw_ex( ldb_branch , 'u_detail_pur_invoice', rt_transaction)
							lc_dwsetup_initial.f_get_initvalue('d_pur_invoice_line_grid',las_initvalue_cols[li_colnbr],ldb_branch ,la_initvalue )	
							ls_sql_values += "," + string(la_initvalue)
						end if
					NEXT
				end if
				//-values khác--//			
				if upper(ls_update_table) = 'BOOKED_SLIP' then
					ls_sql_values += ",1,'GOODS_DELIVERY','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) +",'"+ls_qty_yn+"','"+ls_val_yn + "')"
				else
					ls_sql_values += ",'BOOKED_SLIP',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
				end if				
				ls_sql_exec = ls_sql + ls_sql_values
				EXECUTE immediate :ls_sql_exec using rt_transaction;			
				ls_sql_values =''			
				//-- update matching --//
				if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_f_branch_id =lds_handle.getitemnumber(li_row, 'branch_id')
					ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))
					ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
										"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
										"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE ,"+ls_mat_cols+")" +&
							" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
							","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+las_f_doc_id[li_idx1] +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
							",'"+ls_f_ref_table+"','COPY','"+ ls_update_table+"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
										
					EXECUTE immediate :ls_sql_exec using rt_transaction;			
					lb_copied = true
				end if
			NEXT							
		NEXT

	end if //--kết thúc: ko có datastore dữ iệu copy--//	
NEXT
destroy lds_handle
if lb_copied then
	commit using rt_transaction;
else
	rollback using rt_transaction;
	gf_messagebox('m.b_obj_instantiate.f_copy_to_goods_delivery.02','Thông báo','Phiếu đã kết hết','stop','ok',1)
	return 0
end if

return ldb_t_doc_id
end function

public function decimal f_get_match_remain (double vdb_t_ref_id, string vs_t_ref_table, decimal vdc_adj_qty, string vs_f_match_colname, ref t_transaction rt_transaction);double		ldb_f_ref_id
dec			ldc_rtn, ldc_matched_qty, ldb_doc_qty
int				li_cnt
string			ls_f_ref_table
setnull(ldc_rtn)
if vdb_t_ref_id > 0 then
	select count(f_ref_id) into :li_cnt 
	from matching 
	where t_ref_id = :vdb_t_ref_id
	using rt_transaction;
	
	if li_cnt > 0 then 		
		select f_ref_id, f_ref_table into :ldb_f_ref_id , :ls_f_ref_table
		from matching 
		where t_ref_id = :vdb_t_ref_id and rownum = 1 
		using rt_transaction;
		
		select sum(qty) into :ldc_matched_qty  
		from matching 
		where f_ref_id = :ldb_f_ref_id 
		and t_ref_table = :vs_t_ref_table
		using rt_transaction;
		
		ldb_doc_qty = rt_transaction.f_match_doc_value(vs_f_match_colname,ldb_f_ref_id, ls_f_ref_table)
		
		ldc_rtn = ldb_doc_qty - (ldc_matched_qty + vdc_adj_qty)
	end if
end if

return ldc_rtn

end function

public function double f_copy_to_goods_receipt (s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial);string				ls_sql, ls_code, ls_currCode, ls_currName, ls_sql_cols, ls_update_table, ls_related_data, las_related_data[], ls_f_ref_table
string				ls_main_chk_cols, las_main_chk_cols[], ls_related_chk_cols, las_related_chk_cols[], ls_data_tmp, las_initvalue_cols[], ls_qty_yn, ls_val_yn
string				las_from_cols[], ls_from_cols, ls_sql_values, ls_coltype, ls_sql_exec, ls_from_match_cols, las_from_match_cols[], ls_mat_cols, las_mat_cols[]
double			ldb_id,ldb_f_doc_id, ldb_t_doc_id, ldb_version_id, ldb_trans_id, ldb_base_currID, ldb_mat_val, ldb_matched_val, ldb_f_ref_id, ldb_f_branch_id
double			ldb_f_version_id, ldb_branch, ldb_manage_group
int					li_idx, li_idx1, li_idx2, li_row, li_colnbr, li_colCnt, li_pos, li_cnt
boolean			lb_found, lb_copied, lb_update_orders
any				laa_value[], laa_chk_data[], la_initvalue
t_ds_db				lds_handle
c_string				lc_string
c_unit_instance 	lc_unit_ins
c_dwsetup_initial	lc_dwsetup_initial

//--------------------------//
// lấy giao dịch của PO //
//-------------------------//
li_pos =  pos( vstr_dwo_related[1].s_data[1] , "(" )
if li_pos > 0 then
	ls_related_data = mid(vstr_dwo_related[1].s_data[1], li_pos +1, pos(vstr_dwo_related[1].s_data[1] , ')') - (li_pos +1) )
	li_cnt = lc_string.f_Stringtoarray( ls_related_data, ',', las_related_data[])
else
	las_related_data[1] = vstr_dwo_related[1].s_data[1]
end if
ldb_id = double(las_related_data[1] )

lds_handle = create t_ds_db
lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo
ls_update_table = lds_handle.describe( "datawindow.table.update")
if lower(ls_update_table) = 'document' then
	//-- copy header --//
	ldb_f_doc_id = ldb_id
	select count(t2.id) into :li_cnt
	from document t
	join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
	join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'GOODS_RECEIPT'
	where t.company_id = :gi_user_comp_id
//	and t.branch_id = :gdb_branch
	and t.id =  :ldb_id
	using rt_transaction;
	if li_cnt = 1 then
		select t2.id, t.version_id, t.branch_id , t.manage_group, t2.quantity_yn , t2.value_yn
		into :ldb_trans_id, :ldb_f_version_id, :ldb_branch, :ldb_manage_group, :ls_qty_yn, :ls_val_yn
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'GOODS_RECEIPT'
		where t.company_id = :gi_user_comp_id
//		and t.branch_id = :gdb_branch
		and t.id =  :ldb_id
		using rt_transaction;
		
		if isnull(ldb_manage_group) then ldb_manage_group = 0
		if isnull(ls_qty_yn) then ls_qty_yn = 'N'
		if isnull(ls_val_yn) then ls_val_yn = 'N'		
	else
		gf_messagebox('m.b_obj_instantiate.f_copy_to_goods_receipt.01','Thông báo','Chưa cài đặt giao dịch cho SO thuộc nhóm copy','stop','ok',1)
		return -1
	end if
else
	//-- copy line --//
	select object_ref_id, branch_id into :ldb_f_version_id, :ldb_branch
	from pr_line t
	where t.id = :ldb_id
//	and t.branch_id = :gdb_branch
	and  t.company_id = :gi_user_comp_id
	using rt_transaction;
	
	select count(t2.id) 
	into :li_cnt
	from document t
	join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
	join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'GOODS_RECEIPT'
	where t.company_id = :gi_user_comp_id
	and t.branch_id = :ldb_branch
	and t.version_id = :ldb_f_version_id
	using rt_transaction;
	
	if li_cnt = 1 then
		select t2.id, t.id into :ldb_trans_id, :ldb_f_doc_id
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'GOODS_RECEIPT'
		where t.company_id = :gi_user_comp_id
		and t.branch_id = :ldb_branch
		and t.version_id =  :ldb_f_version_id
		using rt_transaction;
	else
		gf_messagebox('m.b_obj_instantiate.f_copy_to_goods_receipt.01','Thông báo','Chưa cài đặt giao dịch cho PO thuộc nhóm copy','stop','ok',1)
		return -1
	end if	
end if

//---------------------//
// insert document  //
//--------------------//
ldb_t_doc_id = this.f_create_id_ex( rt_transaction)
ldb_version_id =  this.f_create_id_ex( rt_transaction)
ls_code = rdwsetup_initial.f_get_autonumber_ex('code','d_doc_goods_receipt_grid', rt_transaction)
ls_sql = "INSERT into DOCUMENT(id,company_id, branch_id,object_ref_table, created_by, created_date,last_mdf_by, last_mdf_date,"+&
									" doc_type, version_id, SOB, handled_by, CODE, document_date, TRANS_HDR_ID,status, manage_group)" +&
			" VALUES("+string(ldb_t_doc_id)+ "," + string( gi_user_comp_id ) + "," + string( ldb_branch ) + ",'BOOKED_SLIP' ," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate, " +&
						"'GOODS_RECEIPT',"+string(ldb_version_id) +", 'F',"+string(gi_userid) + ",'"+ls_code +"', trunc(sysdate)"+ ","+string(ldb_trans_id) +", 'new',"+ string(ldb_manage_group)+ ")"
EXECUTE immediate :ls_sql using rt_transaction;



//--------------------//
// insert table  //
//--------------------//

FOR li_idx = 1 to upperbound(vstr_dwo_related[1].s_related_obj_dwo_copy[] )	
	lds_handle.dataobject = vstr_dwo_related[1].s_related_obj_dwo_copy[li_idx]
	ls_update_table = lds_handle.describe( "datawindow.table.update")	

	ls_sql = "INSERT into "+ls_update_table +"(company_id, branch_id, created_by, created_date,last_mdf_by, last_mdf_date,"				
	ls_sql_cols = vstr_dwo_related[1].s_related_obj_column_copy[li_idx]
	ls_sql_cols= trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))
	if vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
		ls_sql_cols += vstr_dwo_related[1].s_related_obj_column_chk[li_idx]
		ls_sql_cols = trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))
		lc_string.f_stringtoarray( vstr_dwo_related[1].s_related_obj_column_chk[li_idx], ';', las_initvalue_cols[])		
	end if	
	
	if right(ls_sql_cols,1) = ',' then 
		if upper(ls_update_table) = 'BOOKED_SLIP' then
			ls_sql += ls_sql_cols + "version_no,doc_type,object_ref_table, object_ref_id,ID,quantity_yn,value_yn)"
		else
			ls_sql += ls_sql_cols + "object_ref_table, object_ref_id,ID)"
		end if
	else
		if upper(ls_update_table) = 'BOOKED_SLIP' then
			ls_sql += ls_sql_cols + ",version_no,doc_type,object_ref_table, object_ref_id,ID)"
		else
			ls_sql += ls_sql_cols + ",object_ref_table, object_ref_id,ID)"
		end if
	end if
	ls_sql += " VALUES("+string( gi_user_comp_id ) + "," + string( ldb_branch ) + "," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate " 
	ls_from_cols = vstr_dwo_related[1].s_main_obj_column_copy[li_idx]
	li_colCnt = lc_string.f_stringtoarray( ls_from_cols, ';', las_from_cols[])
	//-- lấy mat cols--//
	if vstr_dwo_related[1].s_match_f_dwo[li_idx] = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
		ls_from_match_cols = vstr_dwo_related[1].s_match_f_column[li_idx]
		if pos(ls_from_match_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_from_match_cols , ';', las_from_match_cols[])
			ls_from_match_cols = las_from_match_cols[1]
		end if
		ls_mat_cols = vstr_dwo_related[1].s_match_column[li_idx]
		if pos(ls_mat_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_mat_cols , ';', las_mat_cols[])
			ls_mat_cols = las_mat_cols[1]
		end if			
	end if
//	//-- lấy chk cols for update destination--//
//	if  vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
//		ls_related_chk_cols = vstr_dwo_related[1].s_related_obj_column_chk[li_idx]
//		lc_string.f_stringtoarray( ls_related_chk_cols, ';', las_related_chk_cols[])
//	end if
	//-- lấy chk cols source--//
	if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
		ls_main_chk_cols = vstr_dwo_related[1].s_main_obj_column_chk[li_idx]
		lc_string.f_stringtoarray( ls_main_chk_cols, ';', las_main_chk_cols[] )
	end if
	
	FOR li_idx1 = 1 to upperbound(vads_copied[])
		if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
			lb_found = true
			lb_update_orders = false
			FOR li_row = 1 to vads_copied[li_idx1].rowcount()
				//-- check match full--//
				if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_mat_val = vads_copied[li_idx1].getitemnumber(li_row, ls_from_match_cols)
					if isnull(ldb_mat_val) then ldb_mat_val = 0
					ldb_f_ref_id = vads_copied[li_idx1].getitemnumber(li_row, 'id')
					ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
					if isnull(ldb_matched_val) then ldb_matched_val = 0
					if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết--//
					if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
						 if isnull(vads_copied[li_idx1].getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
					end if								
				end if //-- kết thúc: check match full--//
				//-- check common values --//
				if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
					lb_update_orders = true
					for li_idx2 = 1 to upperbound(las_main_chk_cols[])
						if li_row = 1 then
							laa_chk_data[li_idx2] = vads_copied[li_idx1].f_getitemany(li_row, las_main_chk_cols[li_idx2])
						end if
					next					
				end if
				//-- insert--//
				ldb_id = this.f_create_id_ex( rt_transaction)
				FOR li_colnbr= 1 to li_colCnt
					ls_coltype = vads_copied[li_idx1].describe(las_from_cols[li_colnbr]+".coltype")
					if left(ls_coltype, 5) = 'numbe' then
						if las_from_cols[li_colnbr] = ls_from_match_cols then
							ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
						else
							if isnull(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr])) then
								ls_sql_values +=",NULL"
							else	
								ls_sql_values += "," + string(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr]))
							end if
						end if
					elseif left(ls_coltype, 5) = 'char(' then
						if isnull(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else						
							ls_sql_values += ",'" + string(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
						end if
					elseif  left(ls_coltype, 5) = 'datet' then
						if isnull(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else	
							ls_sql_values += ",to_date('" + string(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
						end if
					end if
				NEXT
				//-- default values --//		
				if upperbound(las_initvalue_cols[]) > 0 then
					FOR li_colnbr = 1 to upperbound(las_initvalue_cols[])
						if las_initvalue_cols[li_colnbr] = 'trans_date'  then
							ls_sql_values += ",to_date('" + string(gd_session_date ,gs_w_date_format )+"','"+gs_w_date_format+"')"
						else
							lc_dwsetup_initial.f_init_ids_setup_dw_ex( ldb_branch , 'u_detail_goods_delivery', rt_transaction)
							lc_dwsetup_initial.f_get_initvalue('d_inventory_line_delivery_grid',las_initvalue_cols[li_colnbr],ldb_branch ,la_initvalue )	
							ls_sql_values += "," + string(la_initvalue)
						end if
					NEXT
				end if
				//-values khác--//
				if upper(ls_update_table) = 'BOOKED_SLIP' then
					ls_sql_values += ",1,'GOODS_RECEIPT','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) +",'"+ls_qty_yn+"','"+ls_val_yn + "')"
				else
					ls_sql_values += ",'BOOKED_SLIP',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
				end if				
				ls_sql_exec = ls_sql + ls_sql_values
				EXECUTE immediate :ls_sql_exec using rt_transaction;				
				ls_sql_values =''
				//-- update matching --//
				if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_f_branch_id =vads_copied[li_idx1].getitemnumber(li_row, 'branch_id')
					ls_f_ref_table = upper(vads_copied[li_idx1].describe( "datawindow.table.update"))
					ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
										"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
										"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE,"+ls_mat_cols+")" +&
							" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
							","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+string(ldb_f_doc_id) +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
							",'"+ls_f_ref_table+"','COPY','"+ ls_update_table +"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
										
					EXECUTE immediate :ls_sql_exec using rt_transaction;
					lb_copied = true
				end if
			NEXT
			exit //-- chỉ có 1 dw source -> 1 dw dest --//
		end if		
	NEXT
	//-- ko có datastore dữ iệu copy--//		
	if not lb_found then 
		lb_update_orders = false
		lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] 
		ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))
		laa_value[1] = ldb_f_version_id
		if ls_f_ref_table = 'BOOKED_SLIP' or  ls_f_ref_table = 'ORDERS' then
			lds_handle.f_add_where( "id", laa_value[])
		else
			lds_handle.f_add_where( "object_ref_id", laa_value[])
		end if
		lds_handle.settransobject( rt_transaction)
		lds_handle.retrieve( )
		FOR li_row = 1 to lds_handle.rowcount()
			//-- check match full--//
			if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
				ldb_mat_val = lds_handle.getitemnumber(li_row, ls_from_match_cols)
				if isnull(ldb_mat_val) then ldb_mat_val = 0
				ldb_f_ref_id = lds_handle.getitemnumber(li_row, 'id')
				ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
				if isnull(ldb_matched_val) then ldb_matched_val = 0
				if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết --//
				if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
					 if isnull(lds_handle.getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
				end if				
			end if //-- kết thúc: check match full--//			
			//-- check common values --//
			if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
				lb_update_orders = true
				for li_idx2 = 1 to upperbound(las_main_chk_cols[])
					if li_row = 1 then
						laa_chk_data[li_idx2] = lds_handle.f_getitemany(li_row, las_main_chk_cols[li_idx2])
					end if
				next					
			end if			
			//-- insert--//
			ldb_id = this.f_create_id_ex( rt_transaction)			
			FOR li_colnbr= 1 to li_colCnt
				ls_coltype = lds_handle.describe(las_from_cols[li_colnbr]+".coltype")
				if left(ls_coltype, 5) = 'numbe' then
					if las_from_cols[li_colnbr] = ls_from_match_cols then
						ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
					else
						if isnull(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else
							ls_sql_values += "," + string(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr]))
						end if
					end if
				elseif left(ls_coltype, 5) = 'char(' then
					if isnull(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",'" + string(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
					end if
				elseif  left(ls_coltype, 5) = 'datet' then
					if isnull(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",to_date('" + string(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
					end if
				end if				
			NEXT
			//-- default values --//		
			if upperbound(las_initvalue_cols[]) > 0 then
				FOR li_colnbr = 1 to upperbound(las_initvalue_cols[])
					if las_initvalue_cols[li_colnbr] = 'trans_date'  then
						ls_sql_values += ",to_date('" + string(gd_session_date ,gs_w_date_format )+"','"+gs_w_date_format+"')"
					else
						lc_dwsetup_initial.f_init_ids_setup_dw_ex( ldb_branch , 'u_detail_pur_invoice', rt_transaction)
						lc_dwsetup_initial.f_get_initvalue('d_pur_invoice_line_grid',las_initvalue_cols[li_colnbr],ldb_branch ,la_initvalue )	
						ls_sql_values += "," + string(la_initvalue)
					end if
				NEXT
			end if
			//-values khác--//			
			if upper(ls_update_table) = 'BOOKED_SLIP' then
				ls_sql_values += ",1,'GOODS_RECEIPT','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) + ",'"+ls_qty_yn+"','"+ls_val_yn + "')"
			else
				ls_sql_values += ",'BOOKED_SLIP',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
			end if				
			ls_sql_exec = ls_sql + ls_sql_values
			EXECUTE immediate :ls_sql_exec using rt_transaction;			
			ls_sql_values =''			
			//-- update matching --//
			if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
				ldb_f_branch_id =lds_handle.getitemnumber(li_row, 'branch_id')
				ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))
				ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
									"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
									"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE ,"+ls_mat_cols+")" +&
						" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
						","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+string(ldb_f_doc_id) +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
						",'"+ls_f_ref_table+"','COPY','"+ ls_update_table+"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
									
				EXECUTE immediate :ls_sql_exec using rt_transaction;			
				lb_copied = true
			end if
		NEXT				

	end if //--kết thúc: ko có datastore dữ iệu copy--//	
NEXT
destroy lds_handle
if lb_copied then
	commit using rt_transaction;
else
	rollback using rt_transaction;
	gf_messagebox('m.b_obj_instantiate.f_copy_to_goods_receipt.02','Thông báo','Phiếu đã kết hết','stop','ok',1)
	return 0
end if

return ldb_t_doc_id
end function

public function integer f_copy_version (double vdb_doc_id, s_str_ds_4_posting vstr_ds_4_posting, ref t_transaction rt_transaction);double		ldb_version_id, ldb_new_ver, ldb_id
int				li_idx, li_colCnt
string			ls_updateTable, ls_colUpdate[], ls_object_ref_table, las_table_line[]
string			ls_sql, ls_col_list, ls_trace_cols_insrt, ls_trace_cols_val, ls_sqlMatch

c_string		lc_string


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
//		ls_object_ref_table = rt_transaction.f_get_ref_Table(ldb_version_id,  ls_updateTable)
		if ls_object_ref_table <> '' then
			ls_sql = "UPDATE " + ls_updateTable + " t set t.object_ref_id = "
			ls_sql += "( select u.id from "+ls_object_ref_table + " u where u.last_mdf_by = t.object_ref_id)"
			ls_sql += " WHERE t.doc_version = "+ string(ldb_new_ver)
			EXECUTE immediate :ls_sql  using rt_transaction;			
			
			//-- update last_mdf_by cua table LINE --//
			ls_sql = "UPDATE " + ls_object_ref_table + " t set t.last_mdf_by = "+string(gi_userid)
			ls_sql += " WHERE t.object_ref_id = "+ string(ldb_new_ver)
			EXECUTE immediate :ls_sql  using rt_transaction;	
		end if
	else
		ls_col_list =  lc_string.f_globalreplace( ls_col_list, 'id_table', 'seq_table_id.nextval')
//		ls_col_list =  lc_string.f_globalreplace( ls_col_list, 'last_mdf_by', 'id')  //-- last_mdf_by : lưu lại ID của version cũ --//
		ls_col_list =  lc_string.f_globalreplace( ls_col_list, 'object_ref_id',  string(ldb_new_ver))
		ls_sql += " SELECT "+ ls_col_list + ls_trace_cols_val +", id , sysdate from "+ ls_updateTable + " where object_ref_id ="+ string(ldb_version_id)				
		EXECUTE immediate :ls_sql using rt_transaction;	

		ls_object_ref_table = ls_updateTable   // ghi nhớ lại table_LINE --//
		
		//-- update matching: t_ref_id --//
		ls_sqlMatch = "UPDATE matching t "
		ls_sqlMatch += " set t.t_ref_id = (select u.id from "+ls_updateTable + " u where u.last_mdf_by = t.t_ref_id and u.object_ref_id = "+  string(ldb_new_ver)+")"
		ls_sqlMatch += " where t.t_doc_id = "+string(vdb_doc_id)
		EXECUTE immediate :ls_sqlMatch using rt_transaction;	
	end if			
NEXT

commit using rt_transaction;		

return 0
end function

public function integer f_get_qty_and_value_yn_ex (double vdb_trans_hdr_id, ref string rs_qty, ref string rs_value, ref t_transaction rt_transaction);/************************************************************************
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

public function integer f_get_doc_qty_and_value_yn (double vdb_doc_id, ref string rs_qty, ref string rs_value, ref t_transaction rt_transaction);/************************************************************************
Chức năng: Trả về ghi sổ số lượng và ghi sổ giá trị

=================================================================*/

select nvl(quantity_yn,'N') , nvl(value_yn,'N') into :rs_qty, :rs_value 
from booked_slip join document on document.version_id = booked_slip.id
where document.id = :vdb_doc_id and document.COMPANY_ID = :gi_user_comp_id using rt_transaction; 

if rt_transaction.sqlcode = 0 then
	return 1
else
	return -1
end if
end function

public function boolean f_is_period_closed_ex (string vs_stop_type, date vd_trans_date, string vs_period_type, ref t_transaction rt_transaction);int					li_cnt
string				ls_role_user_id,  ls_currentSQL, ls_currentWhere, ls_join, ls_where,   ls_modifySQL, ls_modifyWhere, ls_rtn
any				laa_value[]
c_string			lc_string
c_sql				lc_sql
t_ds_db			lds_period_control
 

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

public function string f_get_doc_status (double vdb_doc_id, ref t_transaction rt_transaction);string			ls_data

select status into :ls_data
	from document 
		where id = :vdb_doc_id 
		and company_id = :gi_user_comp_id 
		and branch_id = :gdb_branch 
		and sob = :gs_sob using rt_transaction;
		
if rt_transaction.sqlcode = 0 then
	return ls_data
else 
	return ''
end if
end function

public function string f_get_existed_promotion (double vdb_object_id, ref t_transaction rt_transaction);int		li_cnt
string	ls_rtn

select count(t.id) into :li_cnt 
from measurement_hdr t
where  trunc(sysdate) between t.f_date and coalesce(t.t_date,sysdate)
and exists  (select null from  measurement_line u where u.object_ref_id = t.id and u.object_id = :vdb_object_id)
using rt_transaction;

if li_cnt > 0 then	
	select coalesce(t.code,'')||';'||coalesce(t.name,'') into :ls_rtn
	from measurement_hdr t
	where  trunc(sysdate) between t.f_date and coalesce(t.t_date,sysdate)
	and exists  (select null from  measurement_line u where u.object_ref_id = t.id and u.object_id = :vdb_object_id)
	using rt_transaction;
	
	return ls_rtn
else 
	return ''
end if
end function

public function integer f_get_gift (t_ds_db vds_buy_get_the_same, double vdb_cust_id, double vdb_doc_id, ref s_str_data rstr_data, ref t_transaction rt_transaction);int					li_cnt, li_cnt2, li_row, li_rtn, li_row2, li_row_gift
string				ls_where
double			ldb_promote_id1, ldb_promote_id2, ldb_object_id, ldb_promote_id, ldb_item_id
dec				ldc_qty, ldc_amount

t_ds_db			lds_gift, lds_buy_get_bill_item, lds_buy_get_bill_m, lds_buy_get_bill_d

//--lấy gift --//
lds_gift = create t_ds_db
lds_gift.dataobject = 'ds_gift'
lds_gift.f_settransobject(rt_transaction)
lds_gift.setsort("object_id a")

//-- Kiểm tra bill: đạt CT tặng quà (Loại mix item)--//
lds_buy_get_bill_m = create t_ds_db
lds_buy_get_bill_m.dataobject = 'ds_buy_get_bill_m'

//-- Kiểm tra bill: đạt CT tặng quà (Loại single item)--//
lds_buy_get_bill_item = create t_ds_db
lds_buy_get_bill_item.dataobject = 'ds_buy_get_bill_item'
ls_where = 'v_buy_get_bill_item.doc_id = '+string(vdb_doc_id)+' AND v_buy_get_bill_item.buy_amt_total <= v_buy_get_bill_item.amount'
lds_buy_get_bill_item.f_add_where(ls_where, ' AND ' )
lds_buy_get_bill_item.f_settransobject(rt_transaction)
lds_buy_get_bill_item.setsort("item_id a, BUY_AMT_TOTAL d")
li_cnt = lds_buy_get_bill_item.retrieve()	
if li_cnt = 0 then
	//-- Kiểm tra bill: đạt CT tặng quà (Loại mix item)--//
	ls_where = 'v_buy_get_bill_m.doc_id = '+string(vdb_doc_id)+' AND v_buy_get_bill_m.buy_amt_total <= v_buy_get_bill_m.amount'
	lds_buy_get_bill_m.f_add_where(ls_where, ' AND ' )
	lds_buy_get_bill_m.f_settransobject(rt_transaction)
	lds_buy_get_bill_m.setsort("BUY_AMT_TOTAL d")
	li_cnt = lds_buy_get_bill_m.retrieve()	
	if li_cnt = 0 then
		return  0  //-- ko có CT quà --//
	elseif li_cnt = 1 then
		//-- Kiêm tra trùng CTKM loại 1 --//
		lds_buy_get_bill_d = create t_ds_db
		lds_buy_get_bill_d.dataobject = 'ds_buy_get_bill_d'
		ls_where = 'v_buy_get_bill_d.doc_id = '+string(vdb_doc_id)
		lds_buy_get_bill_d.f_add_where(ls_where, ' AND ' )
		lds_buy_get_bill_d.f_settransobject(rt_transaction)
		li_cnt2 = lds_buy_get_bill_d.retrieve()		
		for li_row2 = 1 to 	li_cnt2
			ldb_item_id = lds_buy_get_bill_d.getitemnumber(li_row2, 'ITEM_ID')
			if vds_buy_get_the_same.find("object_id = "+ string(ldb_item_id)+ " AND buy_qty <= "+string(ldc_qty), 1, vds_buy_get_the_same.rowcount()) > 0 then
				return 0 //-- Đã được ap dụng CTKM loại 1 , ko ap dụng thêm--//
			end if			
		next
		ldb_promote_id1 = lds_buy_get_bill_m.getitemnumber(1,'id')
		lds_gift.retrieve(ldb_promote_id1 )
		FOR li_row_gift = 1 to lds_gift.rowcount()
			if rstr_data.s_data <> '' and not isnull( rstr_data.s_data) then rstr_data.s_data +=';~r'
			if li_row_gift = 1 then
				rstr_data.s_data += lds_buy_get_bill_m.getitemstring(1,'name')
			end if
			rstr_data.as_data[upperbound(rstr_data.as_data)+1] = lds_gift.getitemstring( li_row_gift, 'short_name')
			rstr_data.aa_data[upperbound(rstr_data.aa_data)+1] = lds_gift.getitemnumber( li_row_gift, 'stock_uom')
			rstr_data.adb_data[upperbound(rstr_data.adb_data[])+1] = lds_gift.getitemnumber( li_row_gift, 'object_id')
			rstr_data.adb_data[upperbound(rstr_data.adb_data[])+1] = lds_gift.getitemnumber( li_row_gift, 'get_qty')			
		NEXT
		return upperbound(rstr_data.adb_data[])
	elseif  li_cnt = 2 then
		//-- Kiêm tra trùng CTKM loại 1 --//
		lds_buy_get_bill_d = create t_ds_db
		lds_buy_get_bill_d.dataobject = 'd_buy_get_bill_d'
		ls_where = 'v_buy_get_bill_d.doc_id = '+string(vdb_doc_id)
		lds_buy_get_bill_d.f_add_where(ls_where, ' AND ' )
		lds_buy_get_bill_d.f_settransobject(rt_transaction)
		li_cnt2 = lds_buy_get_bill_d.retrieve()				
		for li_row2 = 1 to 	li_cnt2
			ldb_item_id = lds_buy_get_bill_d.getitemnumber(li_row2, 'ITEM_ID')
			if vds_buy_get_the_same.find("object_id = "+ string(ldb_item_id)+ " AND buy_qty <= "+string(ldc_qty), 1, vds_buy_get_the_same.rowcount()) > 0 then
				return 0 //-- Đã được ap dụng CTKM loại 1 , ko ap dụng thêm--//
			end if			
		next		
		ldb_promote_id1 = lds_buy_get_bill_m.getitemnumber(1,'promote_id')
		ldb_promote_id2 = lds_buy_get_bill_m.getitemnumber(2,'promote_id')
		
		select count(promote_id) into :li_cnt2
		from(
				SELECT v_buy_get_bill_d.promote_id,   
						v_buy_get_bill_d.doc_id,   
						v_buy_get_bill_d.item_id,   
						v_buy_get_bill_d.qty,   
						v_buy_get_bill_d.amount  
				 FROM v_buy_get_bill_d   
				 where v_buy_get_bill_d.promote_id = :ldb_promote_id1
					and v_buy_get_bill_d.doc_id = :vdb_doc_id
				MINUS
				SELECT v_buy_get_bill_d.promote_id,   
						v_buy_get_bill_d.doc_id,   
						v_buy_get_bill_d.item_id,   
						v_buy_get_bill_d.qty,   
						v_buy_get_bill_d.amount  
				 FROM v_buy_get_bill_d   
				 where v_buy_get_bill_d.promote_id = :ldb_promote_id2
					and v_buy_get_bill_d.doc_id = :vdb_doc_id
					 ) using rt_transaction;
		if li_cnt2 = 0 then //-- cùng CTKM: -> chỉ lấy 1 CT giá trị lớn --//
			ldb_promote_id1 = lds_buy_get_bill_m.getitemnumber(1,'id')
			lds_gift.retrieve(ldb_promote_id1 )
			FOR li_row_gift = 1 to lds_gift.rowcount()
				if rstr_data.s_data <> '' and not isnull( rstr_data.s_data) then rstr_data.s_data +=';~r'
				if li_row_gift = 1 then
					rstr_data.s_data += lds_buy_get_bill_m.getitemstring(1,'name')
				end if
				rstr_data.as_data[upperbound(rstr_data.as_data)+1] = lds_gift.getitemstring( li_row_gift, 'short_name')
				rstr_data.aa_data[upperbound(rstr_data.aa_data)+1] = lds_gift.getitemnumber( li_row_gift, 'stock_uom')
				rstr_data.adb_data[upperbound(rstr_data.adb_data[])+1] = lds_gift.getitemnumber( li_row_gift, 'object_id')
				rstr_data.adb_data[upperbound(rstr_data.adb_data[])+1] = lds_gift.getitemnumber( li_row_gift, 'get_qty')		
			NEXT
			return upperbound(rstr_data.adb_data[])	
		else //-- Lấy cả 2 CTKM --//
			ldb_promote_id1 = lds_buy_get_bill_m.getitemnumber(1,'id')
			lds_gift.retrieve(ldb_promote_id1 )
			FOR li_row_gift = 1 to lds_gift.rowcount()
				if rstr_data.s_data <> ''  and not isnull( rstr_data.s_data) then rstr_data.s_data +=';~r'
				if li_row_gift = 1 then
					rstr_data.s_data += lds_buy_get_bill_m.getitemstring(1,'name')
				end if
				rstr_data.as_data[upperbound(rstr_data.as_data)+1] = lds_gift.getitemstring( li_row_gift, 'short_name')
				rstr_data.aa_data[upperbound(rstr_data.aa_data)+1] = lds_gift.getitemnumber( li_row_gift, 'stock_uom')
				rstr_data.adb_data[upperbound(rstr_data.adb_data[])+1] = lds_gift.getitemnumber( li_row_gift, 'object_id')
				rstr_data.adb_data[upperbound(rstr_data.adb_data[])+1] = lds_gift.getitemnumber( li_row_gift, 'get_qty')		
			NEXT
			ldb_promote_id2 = lds_buy_get_bill_m.getitemnumber(2,'id')
			lds_gift.retrieve(ldb_promote_id2 )		
			FOR li_row_gift = 1 to lds_gift.rowcount()
				if rstr_data.s_data <> '' and not isnull( rstr_data.s_data) then rstr_data.s_data +=';~r'
				if li_row_gift = 1 then
					rstr_data.s_data += lds_buy_get_bill_m.getitemstring(1,'name')
				end if
				rstr_data.as_data[upperbound(rstr_data.as_data)+1] = lds_gift.getitemstring( li_row_gift, 'short_name')
				rstr_data.aa_data[upperbound(rstr_data.aa_data)+1] = lds_gift.getitemnumber( li_row_gift, 'stock_uom')
				rstr_data.adb_data[upperbound(rstr_data.adb_data[])+1] = lds_gift.getitemnumber( li_row_gift, 'object_id')
				rstr_data.adb_data[upperbound(rstr_data.adb_data[])+1] = lds_gift.getitemnumber( li_row_gift, 'get_qty')		
			NEXT		
			return upperbound(rstr_data.adb_data[])		
		end if
	else
		//-- chưa xử lý --//
		return li_rtn
	end if
else
	
	//-- Kiểm tra bill: đạt CT tặng quà (Loại mix item)--//
	ls_where = 'v_buy_get_bill_m.doc_id = '+string(vdb_doc_id)+' AND v_buy_get_bill_m.buy_amt_total <= v_buy_get_bill_m.amount'
	lds_buy_get_bill_m.f_add_where(ls_where, ' AND ' )
	lds_buy_get_bill_m.f_settransobject(rt_transaction)
	lds_buy_get_bill_m.setsort("BUY_AMT_TOTAL d")
	li_cnt2 = lds_buy_get_bill_m.retrieve()		
	//-- Kiểm tra từng item: có trùng CTKM không ? --//	
	FOR li_row = 1 to li_cnt
//		ldb_promote_id =  lds_buy_get_bill_item.getitemnumber( li_row, 'id')
		if ldb_item_id <> lds_buy_get_bill_item.getitemnumber( li_row, 'item_id') then
			ldb_item_id = lds_buy_get_bill_item.getitemnumber( li_row, 'item_id')
			ldc_qty = lds_buy_get_bill_item.getitemnumber( li_row, 'qty')
			if isnull(ldc_qty) then ldc_qty = 0
			//-- Kiêm tra trùng CTKM loại 1 --//
			if vds_buy_get_the_same.find("object_id = "+ string(ldb_item_id)+ " AND buy_qty <= "+string(ldc_qty), 1, vds_buy_get_the_same.rowcount()) > 0 then
				continue //-- Đã được ap dụng CTKM loại 1 , ko ap dụng thêm--//
			end if

			//-- Kiểm tra trùng CTKM mix item --//
			if li_cnt2 = 0 then
				if ldb_promote_id <>  lds_buy_get_bill_item.getitemnumber( li_row, 'id') then
					if rstr_data.s_data <> '' and not isnull( rstr_data.s_data) then rstr_data.s_data +=';~r'
					rstr_data.s_data += lds_buy_get_bill_item.getitemstring(li_row,'name')
					ldb_promote_id =  lds_buy_get_bill_item.getitemnumber( li_row, 'id') 
					lds_gift.retrieve(ldb_promote_id )																		
					FOR li_row_gift = 1 to lds_gift.rowcount()
						if ldb_object_id <> lds_gift.getitemnumber( li_row_gift, 'object_id') then
							ldb_object_id = lds_gift.getitemnumber( li_row_gift, 'object_id')	
							rstr_data.as_data[ upperbound(rstr_data.as_data[]) + 1] = lds_gift.getitemstring( li_row_gift, 'short_name')
							rstr_data.aa_data[ upperbound(rstr_data.as_data[]) + 1] = lds_gift.getitemnumber( li_row_gift, 'stock_uom')			
							rstr_data.adb_data[upperbound(rstr_data.adb_data[])+1] = lds_gift.getitemnumber( li_row_gift, 'object_id')
							ldc_qty =  lds_gift.getitemnumber( li_row_gift, 'get_qty')*li_cnt	
							if isnull(ldc_qty) then ldc_qty = 0			
							rstr_data.adb_data[upperbound(rstr_data.adb_data[])+1] = ldc_qty
						else
							ldc_qty =  lds_gift.getitemnumber( li_row, 'get_qty')*li_cnt	
							if isnull(ldc_qty) then ldc_qty = 0
							rstr_data.adb_data[upperbound(rstr_data.adb_data[])] = rstr_data.adb_data[upperbound(rstr_data.adb_data[])] + ldc_qty
						end if
						li_rtn = upperbound(rstr_data.adb_data[])
					NEXT				
				end if		
			elseif li_cnt2 > 0 then
				ldc_amount = lds_buy_get_bill_item.getitemnumber( li_row, 'BUY_AMT_TOTAL')
				for li_row2 = 1 to li_cnt2
					if ldc_amount < lds_buy_get_bill_m.getitemnumber( li_row2, 'BUY_AMT_TOTAL') then
						if rstr_data.s_data <> '' and not isnull( rstr_data.s_data) then rstr_data.s_data +=';~r'
						rstr_data.s_data += lds_buy_get_bill_m.getitemstring(li_row2,'name')					
						ldb_promote_id =  lds_buy_get_bill_m.getitemnumber( li_row2, 'id')			
						lds_gift.retrieve(ldb_promote_id )
						FOR li_row_gift = 1 to lds_gift.rowcount()
							
							if ldb_object_id <> lds_gift.getitemnumber( li_row_gift, 'object_id') then
								ldb_object_id = lds_gift.getitemnumber( li_row_gift, 'object_id')	
								rstr_data.as_data[ upperbound(rstr_data.as_data[]) + 1] = lds_gift.getitemstring( li_row_gift, 'short_name')
								rstr_data.aa_data[ upperbound(rstr_data.as_data[]) + 1] = lds_gift.getitemnumber( li_row_gift, 'stock_uom')			
								rstr_data.adb_data[upperbound(rstr_data.adb_data[])+1] = lds_gift.getitemnumber( li_row_gift, 'object_id')
								ldc_qty =  lds_gift.getitemnumber( li_row_gift, 'get_qty')
								if isnull(ldc_qty) then ldc_qty = 0			
								rstr_data.adb_data[upperbound(rstr_data.adb_data[])+1] = ldc_qty
							else
								ldc_qty =  lds_gift.getitemnumber( li_row, 'get_qty')
								if isnull(ldc_qty) then ldc_qty = 0
								rstr_data.adb_data[upperbound(rstr_data.adb_data[])] = rstr_data.adb_data[upperbound(rstr_data.adb_data[])] + ldc_qty
							end if
						NEXT
						return upperbound(rstr_data.adb_data[])
					end if
				next
				//-- khi max item có amount < single item --//
				if ldb_promote_id <>  lds_buy_get_bill_item.getitemnumber( li_row, 'id') then
					if rstr_data.s_data <> '' and not isnull( rstr_data.s_data) then rstr_data.s_data +=';~r'
					rstr_data.s_data += lds_buy_get_bill_item.getitemstring(li_row,'name')
					ldb_promote_id =  lds_buy_get_bill_item.getitemnumber( li_row, 'id') 
					lds_gift.retrieve(ldb_promote_id )																		
					FOR li_row_gift = 1 to lds_gift.rowcount()
						if ldb_object_id <> lds_gift.getitemnumber( li_row_gift, 'object_id') then
							ldb_object_id = lds_gift.getitemnumber( li_row_gift, 'object_id')	
							rstr_data.as_data[ upperbound(rstr_data.as_data[]) + 1] = lds_gift.getitemstring( li_row_gift, 'short_name')
							rstr_data.aa_data[ upperbound(rstr_data.as_data[]) + 1] = lds_gift.getitemnumber( li_row_gift, 'stock_uom')			
							rstr_data.adb_data[upperbound(rstr_data.adb_data[])+1] = lds_gift.getitemnumber( li_row_gift, 'object_id')
							ldc_qty =  lds_gift.getitemnumber( li_row_gift, 'get_qty')*li_cnt	
							if isnull(ldc_qty) then ldc_qty = 0			
							rstr_data.adb_data[upperbound(rstr_data.adb_data[])+1] = ldc_qty
						else
							ldc_qty =  lds_gift.getitemnumber( li_row, 'get_qty')*li_cnt	
							if isnull(ldc_qty) then ldc_qty = 0
							rstr_data.adb_data[upperbound(rstr_data.adb_data[])] = rstr_data.adb_data[upperbound(rstr_data.adb_data[])] + ldc_qty
						end if
						li_rtn = upperbound(rstr_data.adb_data[])
					NEXT				
				end if						
			end if
		else
			continue //-- bỏ qua CT có giá trị nhỏ hơn theo cách sort --//
		end if
	NEXT
end if

return li_rtn
end function

public function long f_upd_web_price (t_ds_db vds_item);/*----------------------------------------

vsa_prod_ids[]: tối đa 50 phần tử

---------------------------------------------*/
long				ll_rtn, ll_variant, ll_productChild, ll_row, ll_root, ll_sku, ll_skuChild
string				ls_response,  ls_sku, ls_Json
double			ldb_product_id, ldb_variant_id
dec				ldc_price
JsonGenerator 	l_JsonGenerator
RestClient 		lrc_sku
c_string			lc_string


lrc_sku = Create RestClient
ll_rtn = lrc_sku.setrequestheader("Authorization", "Bearer 819B9F8C7D3384D15C38FD26FBE8D021C6A7A196B2118A0FA4BCFADE2A05F186")
ll_rtn = lrc_sku.SetRequestHeader("Content-Type", "application/json;charset=UTF-8")


FOR ll_row = 1 to vds_item.rowcount()
	
	yield()
	this.of_show_progress( int(ll_row/vds_item.rowcount()*100),'Đang cập nhật ...')	
	this.of_set_progress_text( string(ll_row)+'/'+string(vds_item.rowcount()))
	
	l_JsonGenerator = create JsonGenerator
	// Create an object root item
	ll_root = l_JsonGenerator.CreateJsonObject ()
	ldb_product_id = vds_item.getitemnumber(ll_row, 'web_id')
	if isnull(ldb_product_id) then ldb_product_id = 0
	ldb_variant_id = vds_item.getitemnumber(ll_row, 'version_id')
	if isnull(ldb_variant_id) then ldb_variant_id = 0
	ldc_price = vds_item.getitemnumber(ll_row, 'retail_price')
	if isnull(ldc_price) then ldc_price = 0
	
	ll_variant = l_JsonGenerator.additemobject( ll_root, "variant")
	l_JsonGenerator.AddItemNumber( ll_variant, 'id', ldb_variant_id)
	l_JsonGenerator.AddItemNumber( ll_variant,'price', ldc_price)
	ls_Json = l_JsonGenerator.GetJsonString()
	destroy l_JsonGenerator
	
	ll_rtn = lrc_sku.sendputrequest("https://apis.haravan.com/com/variants/"+string(ldb_variant_id)+".json", ls_Json, ls_response)
	If lrc_sku.GetResponseStatusCode()<>200 Then
		//Checks if any error according to the value of ResponseStatuscode and ls_Response
	//	this.of_show_progress(101,'Đang cập nhật ...')
		gf_messagebox('m.b_obj_instantiate.f_upd_web_price.01','Thống báo','sendputrequest error:@'+ls_response, 'stop','ok',1)
		continue 
	end if	
next

this.of_show_progress(101,'Đang cập nhật ...')
return 1

end function

public function double f_copy_to_inter_so (double vdb_t_branch_id, s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial);string				ls_sql, ls_code, ls_currCode, ls_currName, ls_sql_cols, ls_update_table, ls_related_data, las_related_data[], ls_f_ref_table
string				ls_main_chk_cols, las_main_chk_cols[], ls_related_chk_cols, las_related_chk_cols[], ls_data_tmp
string				las_from_cols[], ls_from_cols, ls_sql_values, ls_coltype, ls_sql_exec, ls_from_match_cols, las_from_match_cols[], ls_mat_cols, las_mat_cols[]
string				ls_sql_detail, ls_from_cols_detail, las_from_cols_detail[], las_initvalue_cols[]
double			ldb_id,ldb_f_doc_id, ldb_t_doc_id, ldb_version_id, ldb_trans_id, ldb_base_currID, ldb_mat_val, ldb_matched_val, ldb_f_ref_id, ldb_f_branch_id
double			ldb_f_version_id, ldb_branch, ldb_id_detail, ldb_manage_group, ldb_inter_customer
int					li_idx, li_idx1, li_idx2, li_row, li_colnbr, li_colCnt, li_pos, li_cnt, li_colCnt_detail, li_row_detail, li_idx3
boolean			lb_found, lb_copied, lb_update_orders
any				laa_value[], laa_chk_data[]
t_ds_db				lds_handle, lds_handle_detail
c_string				lc_string
c_unit_instance 	lc_unit_ins


//--------------------------//
// lấy giao dịch của SO //
//-------------------------//
li_pos =  pos( vstr_dwo_related[1].s_data[1] , "(" )
if li_pos > 0 then
	ls_related_data = mid(vstr_dwo_related[1].s_data[1], li_pos +1, pos(vstr_dwo_related[1].s_data[1] , ')') - (li_pos +1) )
	li_cnt = lc_string.f_Stringtoarray( ls_related_data, ',', las_related_data[])
else
	las_related_data[1] = vstr_dwo_related[1].s_data[1]
end if
ldb_id = double(las_related_data[1] )

lds_handle_detail = create t_ds_db
lds_handle = create t_ds_db
lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo
ls_update_table = lds_handle.describe( "datawindow.table.update")
if lower(ls_update_table) = 'document' then
	//-- copy header --//
	ldb_f_doc_id = ldb_id
	select count(t2.id) into :li_cnt
	from document t
	join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
	join trans_setup_hdr t2 on t2.company_id= t1.company_id 
								and t2.doc_type = 'SO'
//								and coalesce(t2.INTER_BRANCH_ID,0) = t1.branch_id
								and t2.branch_id = :vdb_t_branch_id
	where t.company_id = :gi_user_comp_id
	and t.id =  :ldb_id
	using rt_transaction;
	
	if li_cnt = 1 then
		select t2.id, t.version_id, t2.branch_id , t.manage_group  into :ldb_trans_id, :ldb_f_version_id, :ldb_branch, :ldb_manage_group
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.company_id= t1.company_id 
									and t2.doc_type = 'SO'
//									and coalesce(t2.INTER_BRANCH_ID,0) = t1.branch_id
									and t2.branch_id = :vdb_t_branch_id 
		where t.company_id = :gi_user_comp_id
		and t.id =  :ldb_id
		using rt_transaction;
		if isnull(ldb_manage_group) then ldb_manage_group = 0
		
		select count(DR_OBJ_INSTANCE_ID) into :li_cnt from trans_setup where object_ref_id = :ldb_trans_id using  rt_transaction;
		if li_cnt > 0 then
			select DR_OBJ_INSTANCE_ID into :ldb_inter_customer from trans_setup where object_ref_id = :ldb_trans_id using  rt_transaction;
			if isnull(ldb_inter_customer) then ldb_inter_customer = 0
		end if		
		if ldb_inter_customer = 0 then
			gf_messagebox('m.b_obj_instantiate.f_copy_to_inter_so.01','Thông báo','Chưa cài đặt khách hàng mặc định cho giao dịch nội bộ','stop','ok',1)
			return -1			
		end if
	else
		gf_messagebox('m.b_obj_instantiate.f_copy_to_inter_so.02','Thông báo','Chưa cài đặt giao dịch cho SO thuộc nhóm copy','stop','ok',1)
		return -1
	end if
else
	/*
	//-- copy line --//
	select object_ref_id, branch_id into :ldb_f_version_id, :ldb_branch
	from pr_line t
	where t.id = :ldb_id
//	and t.branch_id = :gdb_branch
	and  t.company_id = :gi_user_comp_id
	using rt_transaction;
	
	select count(t2.id) 
	into :li_cnt
	from document t
	join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
	join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
	where t.company_id = :gi_user_comp_id
	and t.branch_id = :ldb_branch
	and t.version_id = :ldb_f_version_id
	using rt_transaction;
	
	if li_cnt = 1 then
		select t2.id, t.id into :ldb_trans_id, :ldb_f_doc_id
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
		where t.company_id = :gi_user_comp_id
		and t.branch_id = :ldb_branch
		and t.version_id =  :ldb_f_version_id
		using rt_transaction;
	else
		gf_messagebox('m.b_obj_instantiate.f_copy_to_so.01','Thông báo','Chưa cài đặt giao dịch cho SO thuộc nhóm copy','stop','ok',1)
		return -1
	end if	
	*/
end if

//---------------------//
// insert document  //
//--------------------//
ldb_t_doc_id = this.f_create_id_ex( rt_transaction)
ldb_version_id =  this.f_create_id_ex( rt_transaction)
ls_code = rdwsetup_initial.f_get_autonumber_ex('code','d_document_so_grid', rt_transaction)
ls_sql = "INSERT into DOCUMENT(id,company_id, branch_id,object_ref_table, created_by, created_date,last_mdf_by, last_mdf_date,"+&
									" doc_type, version_id, SOB, handled_by, CODE, document_date, TRANS_HDR_ID,status, manage_group)" +&
			" VALUES("+string(ldb_t_doc_id)+ "," + string( gi_user_comp_id ) + "," + string( ldb_branch ) + ",'ORDERS' ," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate, " +&
						"'SO',"+string(ldb_version_id) +",'"+ gs_sob +"',"+string(gi_userid) + ",'"+ls_code +"', trunc(sysdate)"+ ","+string(ldb_trans_id) +", 'new',"+ string(ldb_manage_group)+ ")"
EXECUTE immediate :ls_sql using rt_transaction;



//--------------------//
// insert table  //
//--------------------//

FOR li_idx = 1 to upperbound(vstr_dwo_related[1].s_related_obj_dwo_copy[] ) - 1

	lds_handle.dataobject = vstr_dwo_related[1].s_related_obj_dwo_copy[li_idx]
	ls_update_table = lds_handle.describe( "datawindow.table.update")		
	if lower(ls_update_table) = 'document' then ls_update_table = 'ORDERS'
	
	ls_sql = "INSERT into "+ls_update_table +"(company_id, branch_id, created_by, created_date,last_mdf_by, last_mdf_date,"				
	ls_sql_cols = vstr_dwo_related[1].s_related_obj_column_copy[li_idx]
	ls_sql_cols= trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))
	if vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then //-- công thêm các column lấy giá trị default --//
		ls_sql_cols += vstr_dwo_related[1].s_related_obj_column_chk[li_idx]
		ls_sql_cols = trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))
		lc_string.f_stringtoarray( vstr_dwo_related[1].s_related_obj_column_chk[li_idx], ';', las_initvalue_cols[])		
	end if	
	
	if right(ls_sql_cols,1) = ',' then 
		if upper(ls_update_table) = 'ORDERS' then
			ls_sql += ls_sql_cols + "version_no,doc_type,object_ref_table, object_ref_id,ID)"
		elseif upper(ls_update_table) = 'SO_LINE' then
			ls_sql += ls_sql_cols + "object_ref_table, object_ref_id,ID)"
			ls_sql_detail = "INSERT into TAX_LINE (company_id, branch_id, created_by, created_date,last_mdf_by, last_mdf_date,"	
			ls_sql_cols = vstr_dwo_related[1].s_related_obj_column_copy[li_idx + 1]
			ls_sql_cols= trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))			
			if right(ls_sql_cols,1) = ',' then 
				ls_sql_detail += ls_sql_cols + "object_ref_table, object_ref_id,ID, doc_version)"
			else
				ls_sql_detail += ls_sql_cols + ",object_ref_table, object_ref_id,ID, doc_version)"
			end if
			ls_sql_detail += " VALUES("+string( gi_user_comp_id ) + "," + string( ldb_branch ) + "," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate " 
			ls_from_cols_detail = vstr_dwo_related[1].s_main_obj_column_copy[li_idx+1]
			li_colCnt_detail = lc_string.f_stringtoarray( ls_from_cols_detail, ';', las_from_cols_detail[])		
		end if		
	else
		if upper(ls_update_table) = 'ORDERS' then
			ls_sql += ls_sql_cols + ",version_no,doc_type,object_ref_table, object_ref_id,ID)"
		elseif upper(ls_update_table) = 'SO_LINE' then
			ls_sql += ls_sql_cols + ",object_ref_table, object_ref_id,ID)"
			ls_sql_detail = "INSERT into  TAX_LINE (company_id, branch_id, created_by, created_date,last_mdf_by, last_mdf_date,"	
			ls_sql_cols = vstr_dwo_related[1].s_related_obj_column_copy[li_idx + 1]
			ls_sql_cols= trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))			
			if right(ls_sql_cols,1) = ',' then 
				ls_sql_detail += ls_sql_cols + "object_ref_table, object_ref_id,ID, doc_version)"
			else
				ls_sql_detail += ls_sql_cols + ",object_ref_table, object_ref_id,ID, doc_version)"
			end if	
			ls_sql_detail += " VALUES("+string( gi_user_comp_id ) + "," + string( ldb_branch ) + "," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate " 
			ls_from_cols_detail = vstr_dwo_related[1].s_main_obj_column_copy[li_idx+1]
			li_colCnt_detail = lc_string.f_stringtoarray( ls_from_cols_detail, ';', las_from_cols_detail[])		
		end if				
	end if
	ls_sql += " VALUES("+string( gi_user_comp_id ) + "," + string( ldb_branch ) + "," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate " 
	ls_from_cols = vstr_dwo_related[1].s_main_obj_column_copy[li_idx]
	li_colCnt = lc_string.f_stringtoarray( ls_from_cols, ';', las_from_cols[])
	//-- lấy mat cols--//
	if vstr_dwo_related[1].s_match_f_dwo[li_idx] = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
		ls_from_match_cols = vstr_dwo_related[1].s_match_f_column[li_idx]
		if pos(ls_from_match_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_from_match_cols , ';', las_from_match_cols[])
			ls_from_match_cols = las_from_match_cols[1]
		end if
		ls_mat_cols = vstr_dwo_related[1].s_match_column[li_idx]
		if pos(ls_mat_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_mat_cols , ';', las_mat_cols[])
			ls_mat_cols = las_mat_cols[1]
		end if			
	end if
	//-- lấy chk cols for update destination/ default values--//
	if  vstr_dwo_related[1].s_main_dr_cr_obj_column_sum[li_idx] <> '' then
		ls_related_chk_cols = vstr_dwo_related[1].s_main_dr_cr_obj_column_sum[li_idx]  //-- dối tượng công nợ mặc định inter copy --//
	end if
	//-- lấy chk cols source--//
	if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
		ls_main_chk_cols = vstr_dwo_related[1].s_main_obj_column_chk[li_idx]
		lc_string.f_stringtoarray( ls_main_chk_cols, ';', las_main_chk_cols[] )
	end if
	
	FOR li_idx1 = 1 to upperbound(vads_copied[])
		if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
			lb_found = true
			lb_update_orders = false
			FOR li_row = 1 to vads_copied[li_idx1].rowcount()
				//-- check match full--//
				if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_mat_val = vads_copied[li_idx1].getitemnumber(li_row, ls_from_match_cols)
					if isnull(ldb_mat_val) then ldb_mat_val = 0
					ldb_f_ref_id = vads_copied[li_idx1].getitemnumber(li_row, 'id')
					ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
					if isnull(ldb_matched_val) then ldb_matched_val = 0
					if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết--//
					if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
						 if isnull(vads_copied[li_idx1].getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
					end if								
				end if //-- kết thúc: check match full--//
				//-- check common values --//
				if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
					lb_update_orders = true
					for li_idx2 = 1 to upperbound(las_main_chk_cols[])
						if li_row = 1 then
							laa_chk_data[li_idx2] = vads_copied[li_idx1].f_getitemany(li_row, las_main_chk_cols[li_idx2])
						end if
					next					
				end if
				//-- insert--//
				ldb_id = this.f_create_id_ex( rt_transaction)
				FOR li_colnbr= 1 to li_colCnt
					
					ls_coltype = vads_copied[li_idx1].describe(las_from_cols[li_colnbr]+".coltype")
					if left(ls_coltype, 5) = 'numbe' then
						if las_from_cols[li_colnbr] = ls_from_match_cols then
							ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
						else
							if isnull(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr])) then
								ls_sql_values +=",NULL"
							else	
								ls_sql_values += "," + string(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr]))
							end if
						end if
					elseif left(ls_coltype, 5) = 'char(' then
						if isnull(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else						
							ls_sql_values += ",'" + string(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
						end if
					elseif  left(ls_coltype, 5) = 'datet' then
						if isnull(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else	
							ls_sql_values += ",to_date('" + string(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
						end if
					end if
				NEXT
				//--//
				
				
				if upper(ls_update_table) = 'ORDERS' then					
					ls_sql_values += ",1,'SO','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) + ")"
				elseif upper(ls_update_table) = 'SO_LINE' then
					ls_sql_values += ",'ORDERS',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
				end if				
				ls_sql_exec = ls_sql + ls_sql_values
				EXECUTE immediate :ls_sql_exec using rt_transaction;				
				ls_sql_values =''
				//-- update matching --//
				if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_f_branch_id =vads_copied[li_idx1].getitemnumber(li_row, 'branch_id')
					ls_f_ref_table = upper(vads_copied[li_idx1].describe( "datawindow.table.update"))
					ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
										"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
										"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE,"+ls_mat_cols+")" +&
							" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
							","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+string(ldb_f_doc_id) +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
							",'"+ls_f_ref_table+"','COPY','"+ ls_update_table +"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
										
					EXECUTE immediate :ls_sql_exec using rt_transaction;
					lb_copied = true
				end if
			NEXT
			if lb_update_orders then
				ls_sql_exec = "UPDATE orders set "
				for li_idx2 = 1 to upperbound(las_related_chk_cols[])
					
					ls_data_tmp = string(laa_chk_data[li_idx2])
					if pos(ls_data_tmp,';') > 0 then
						ls_data_tmp = left(ls_data_tmp,pos(ls_data_tmp,';') -1)
					end if
					if li_idx2 = 1 then
						ls_sql_exec += las_related_chk_cols[li_idx2] + "=" + ls_data_tmp
					else
						ls_sql_exec += ","+ las_related_chk_cols[li_idx2] + "=" + ls_data_tmp
					end if
				next
				ls_sql_exec += ' where id = '+string(ldb_version_id)
				EXECUTE immediate :ls_sql_exec using rt_transaction;
			end if
			exit //-- chỉ có 1 dw source -> 1 dw dest --//
		end if		
	NEXT
	//-- ko có datastore dữ iệu copy--//		
	if not lb_found then 
		
		lb_update_orders = false
		lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] 
		ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))

		laa_value[1] = ldb_f_version_id
		if lower(ls_f_ref_table) = 'document' then
			lds_handle.f_add_where( "version_id", laa_value[])
		elseif upper(ls_f_ref_table) = 'ORDERS' then
			lds_handle.f_add_where( "id", laa_value[])
		else
			lds_handle.f_add_where( "object_ref_id", laa_value[])			
			lds_handle_detail.dataobject = 'd_tax_line_grid'
			lds_handle_detail.f_add_where( "doc_version", laa_value[])	
			lds_handle_detail.settransobject( rt_transaction)
			lds_handle_detail.retrieve( )
		end if
		lds_handle.settransobject( rt_transaction)
		lds_handle.retrieve( )
		FOR li_row = 1 to lds_handle.rowcount()
			ldb_f_ref_id = lds_handle.getitemnumber(li_row, 'id')
			//-- check match full--//
			if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
				ldb_mat_val = lds_handle.getitemnumber(li_row, ls_from_match_cols)
				if isnull(ldb_mat_val) then ldb_mat_val = 0				
				ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
				if isnull(ldb_matched_val) then ldb_matched_val = 0
				if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết --//
				if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
					 if isnull(lds_handle.getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
				end if				
			end if //-- kết thúc: check match full--//			
			//-- check common values --//
			if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
				lb_update_orders = true
				for li_idx2 = 1 to upperbound(las_main_chk_cols[])
					if li_row = 1 then
						laa_chk_data[li_idx2] = lds_handle.f_getitemany(li_row, las_main_chk_cols[li_idx2])
					end if
				next					
			end if			
			//-- insert--//
			ldb_id = this.f_create_id_ex( rt_transaction)			
			FOR li_colnbr= 1 to li_colCnt
				ls_coltype = lds_handle.describe(las_from_cols[li_colnbr]+".coltype")

				 //-- thấy thế giá trị copy bằng giá trị mặc dịnh inter copy--//
				if pos(ls_related_chk_cols, las_from_cols[li_colnbr]) > 0 then
					ls_sql_values += "," + string(ldb_inter_customer)					
					continue 
				end if
			
				if left(ls_coltype, 5) = 'numbe' then
					if las_from_cols[li_colnbr] = ls_from_match_cols then
						ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
					else
						if isnull(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else
							ls_sql_values += "," + string(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr]))
						end if
					end if
				elseif left(ls_coltype, 5) = 'char(' then
					if isnull(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",'" + string(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
					end if
				elseif  left(ls_coltype, 5) = 'datet' then
					if isnull(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",to_date('" + string(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
					end if
				end if				
			NEXT
						
			//-values khác--//			
			if upper(ls_update_table) = 'ORDERS' then
				ls_sql_values += ",1,'SO','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) + ")"
			else
				ls_sql_values += ",'ORDERS',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
			end if				
			ls_sql_exec = ls_sql + ls_sql_values
			EXECUTE immediate :ls_sql_exec using rt_transaction;			
			ls_sql_values =''			
			//-- update matching --//
			if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
				ldb_f_branch_id =lds_handle.getitemnumber(li_row, 'branch_id')
				ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))
				ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
									"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
									"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE ,"+ls_mat_cols+")" +&
						" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
						","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+string(ldb_f_doc_id) +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
						",'"+ls_f_ref_table+"','COPY','"+ ls_update_table+"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
									
				EXECUTE immediate :ls_sql_exec using rt_transaction;			
				lb_copied = true
			end if
			//-- insert TAX Line --//
			if upper(ls_update_table) = 'SO_LINE' then

				lds_handle_detail.setfilter( "object_ref_id="+string(ldb_f_ref_id))
				lds_handle_detail.filter( )
				FOR li_row_detail = 1 to lds_handle_detail.rowcount( )
					ldb_id_detail = this.f_create_id_ex( rt_transaction)			
					FOR li_colnbr= 1 to li_colCnt_detail
						ls_coltype = lds_handle_detail.describe(las_from_cols_detail[li_colnbr]+".coltype")
						if left(ls_coltype, 5) = 'numbe' then
			
							if isnull(lds_handle_detail.getitemnumber(li_row_detail ,las_from_cols_detail[li_colnbr])) then
								ls_sql_values +=",NULL"
							else
								ls_sql_values += "," + string(lds_handle_detail.getitemnumber(li_row_detail ,las_from_cols_detail[li_colnbr]))
							end if

						elseif left(ls_coltype, 5) = 'char(' then
							if isnull(lds_handle_detail.getitemstring(li_row_detail ,las_from_cols_detail[li_colnbr])) then
								ls_sql_values +=",NULL"
							else
								ls_sql_values += ",'" + string(lds_handle_detail.getitemstring(li_row_detail ,las_from_cols_detail[li_colnbr]))+"'"
							end if
						elseif  left(ls_coltype, 5) = 'datet' then
							if isnull(lds_handle_detail.getitemdatetime(li_row_detail ,las_from_cols_detail[li_colnbr])) then
								ls_sql_values +=",NULL"
							else
								ls_sql_values += ",to_date('" + string(lds_handle_detail.getitemdatetime(li_row_detail ,las_from_cols_detail[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
							end if
						end if				
					NEXT

					ls_sql_values += ",'SO_LINE',"+string(ldb_id) + "," +string(ldb_id_detail) + "," + string(ldb_version_id) +")"
		
					ls_sql_exec = ls_sql_detail + ls_sql_values
					EXECUTE immediate :ls_sql_exec using rt_transaction;		
				NEXT
				ls_sql_values = ''
			end if //-- kết thúc inser TAX_line --//
		NEXT				
		if lb_update_orders then
			ls_sql_exec = "UPDATE orders set "
			for li_idx2 = 1 to upperbound(las_related_chk_cols[])
				
				ls_data_tmp = string(laa_chk_data[li_idx2])
				if pos(ls_data_tmp,';') > 0 then
					ls_data_tmp = left(ls_data_tmp,pos(ls_data_tmp,';') -1)
				end if
				if li_idx2 = 1 then
					ls_sql_exec += las_related_chk_cols[li_idx2] + "=" + ls_data_tmp
				else
					ls_sql_exec += ","+ las_related_chk_cols[li_idx2] + "=" + ls_data_tmp
				end if
			next
			ls_sql_exec += ' where id = '+string(ldb_version_id)
			EXECUTE immediate :ls_sql_exec using rt_transaction;
		end if		
	end if //--kết thúc: ko có datastore dữ iệu copy--//	
NEXT
destroy lds_handle
if lb_copied then
	commit using rt_transaction;
else
	rollback using rt_transaction;
	gf_messagebox('m.b_obj_instantiate.f_copy_to_inter_so.03','Thông báo','Phiếu đã kết hết','stop','ok',1)
	return 0
end if

return ldb_t_doc_id
end function

public function double f_copy_to_inter (double vdb_t_branch_id, string vs_objname, s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial);
if vs_objname = 'u_so' then
	return this.f_copy_to_inter_so(vdb_t_branch_id, vstr_dwo_related[], vads_copied[], rt_transaction, rdwsetup_initial)
end if
return 0
end function

public function double f_copy_to_so_return (s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial);string				ls_sql, ls_code, ls_currCode, ls_currName, ls_sql_cols, ls_update_table, ls_related_data, las_related_data[], ls_f_ref_table
string				ls_main_chk_cols, las_main_chk_cols[], ls_related_chk_cols, las_related_chk_cols[], ls_data_tmp
string				las_from_cols[], ls_from_cols, ls_sql_values, ls_coltype, ls_sql_exec, ls_from_match_cols, las_from_match_cols[], ls_mat_cols, las_mat_cols[]
string				ls_sql_detail, ls_from_cols_detail, las_from_cols_detail[]
double			ldb_id,ldb_f_doc_id, ldb_t_doc_id, ldb_version_id, ldb_trans_id, ldb_base_currID, ldb_mat_val, ldb_matched_val, ldb_f_ref_id, ldb_f_branch_id
double			ldb_f_version_id, ldb_branch, ldb_id_detail, ldb_manage_group
int					li_idx, li_idx1, li_idx2, li_row, li_colnbr, li_colCnt, li_pos, li_cnt, li_colCnt_detail, li_row_detail
boolean			lb_found, lb_copied, lb_update_orders
any				laa_value[], laa_chk_data[]
t_ds_db				lds_handle, lds_handle_detail
c_string				lc_string
c_unit_instance 	lc_unit_ins


//--------------------------//
// lấy giao dịch của SO //
//-------------------------//
li_pos =  pos( vstr_dwo_related[1].s_data[1] , "(" )
if li_pos > 0 then
	ls_related_data = mid(vstr_dwo_related[1].s_data[1], li_pos +1, pos(vstr_dwo_related[1].s_data[1] , ')') - (li_pos +1) )
	li_cnt = lc_string.f_Stringtoarray( ls_related_data, ',', las_related_data[])
else
	las_related_data[1] = vstr_dwo_related[1].s_data[1]
end if
ldb_id = double(las_related_data[1] )

lds_handle_detail = create t_ds_db
lds_handle = create t_ds_db
lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo
ls_update_table = lds_handle.describe( "datawindow.table.update")
if lower(ls_update_table) = 'document' then
	//-- copy header --//
	ldb_f_doc_id = ldb_id
	select count(t2.id) into :li_cnt
	from document t
	join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
	join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'SO_RETURN'
	where t.company_id = :gi_user_comp_id
//	and t.branch_id = :gdb_branch
	and t.id =  :ldb_id
	using rt_transaction;
	if li_cnt = 1 then
		select t2.id, t.version_id, t.branch_id , t.manage_group , t.code into :ldb_trans_id, :ldb_f_version_id, :ldb_branch, :ldb_manage_group, :ls_code
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'SO_RETURN'
		where t.company_id = :gi_user_comp_id
//		and t.branch_id = :gdb_branch
		and t.id =  :ldb_id
		using rt_transaction;
		if isnull(ldb_manage_group) then ldb_manage_group = 0
	else
		gf_messagebox('m.b_obj_instantiate.f_copy_to_so.01','Thông báo','Chưa cài đặt giao dịch cho SO thuộc nhóm copy','stop','ok',1)
		return -1
	end if
else
	/*
	//-- copy line --//
	select object_ref_id, branch_id into :ldb_f_version_id, :ldb_branch
	from pr_line t
	where t.id = :ldb_id
//	and t.branch_id = :gdb_branch
	and  t.company_id = :gi_user_comp_id
	using rt_transaction;
	
	select count(t2.id) 
	into :li_cnt
	from document t
	join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
	join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
	where t.company_id = :gi_user_comp_id
	and t.branch_id = :ldb_branch
	and t.version_id = :ldb_f_version_id
	using rt_transaction;
	
	if li_cnt = 1 then
		select t2.id, t.id into :ldb_trans_id, :ldb_f_doc_id
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
		where t.company_id = :gi_user_comp_id
		and t.branch_id = :ldb_branch
		and t.version_id =  :ldb_f_version_id
		using rt_transaction;
	else
		gf_messagebox('m.b_obj_instantiate.f_copy_to_so.01','Thông báo','Chưa cài đặt giao dịch cho SO thuộc nhóm copy','stop','ok',1)
		return -1
	end if	
	*/
end if

//---------------------//
// insert document  //
//--------------------//
ldb_t_doc_id = this.f_create_id_ex( rt_transaction)
ldb_version_id =  this.f_create_id_ex( rt_transaction)
if isnull(ls_code) or ls_code = '' then
	ls_code = rdwsetup_initial.f_get_autonumber_ex('code','d_document_so_return_grid', rt_transaction)
end if
ls_sql = "INSERT into DOCUMENT(id,company_id, branch_id,object_ref_table, created_by, created_date,last_mdf_by, last_mdf_date,"+&
									" doc_type, version_id, SOB, handled_by, CODE, document_date, TRANS_HDR_ID,status, manage_group)" +&
			" VALUES("+string(ldb_t_doc_id)+ "," + string( gi_user_comp_id ) + "," + string( ldb_branch ) + ",'ORDERS' ," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate, " +&
						"'SO_RETURN',"+string(ldb_version_id) +",'"+ gs_sob +"',"+string(gi_userid) + ",'"+ls_code +"', trunc(sysdate)"+ ","+string(ldb_trans_id) +", 'new',"+ string(ldb_manage_group)+ ")"
EXECUTE immediate :ls_sql using rt_transaction;



//--------------------//
// insert table  //
//--------------------//

FOR li_idx = 1 to upperbound(vstr_dwo_related[1].s_related_obj_dwo_copy[] ) - 1

	lds_handle.dataobject = vstr_dwo_related[1].s_related_obj_dwo_copy[li_idx]
	ls_update_table = lds_handle.describe( "datawindow.table.update")		
	if lower(ls_update_table) = 'document' then ls_update_table = 'ORDERS'
	
	ls_sql = "INSERT into "+ls_update_table +"(company_id, branch_id, created_by, created_date,last_mdf_by, last_mdf_date,"				
	ls_sql_cols = vstr_dwo_related[1].s_related_obj_column_copy[li_idx]
	ls_sql_cols= trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))
	if right(ls_sql_cols,1) = ',' then 
		if upper(ls_update_table) = 'ORDERS' then
			ls_sql += ls_sql_cols + "version_no,doc_type,object_ref_table, object_ref_id,ID)"
		elseif upper(ls_update_table) = 'SO_LINE' then
			ls_sql += ls_sql_cols + "object_ref_table, object_ref_id,ID)"
			ls_sql_detail = "INSERT into TAX_LINE (company_id, branch_id, created_by, created_date,last_mdf_by, last_mdf_date,"	
			ls_sql_cols = vstr_dwo_related[1].s_related_obj_column_copy[li_idx + 1]
			ls_sql_cols= trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))			
			if right(ls_sql_cols,1) = ',' then 
				ls_sql_detail += ls_sql_cols + "object_ref_table, object_ref_id,ID, doc_version)"
			else
				ls_sql_detail += ls_sql_cols + ",object_ref_table, object_ref_id,ID, doc_version)"
			end if
			ls_sql_detail += " VALUES("+string( gi_user_comp_id ) + "," + string( ldb_branch ) + "," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate " 
			ls_from_cols_detail = vstr_dwo_related[1].s_main_obj_column_copy[li_idx+1]
			li_colCnt_detail = lc_string.f_stringtoarray( ls_from_cols_detail, ';', las_from_cols_detail[])		
		end if		
	else
		if upper(ls_update_table) = 'ORDERS' then
			ls_sql += ls_sql_cols + ",version_no,doc_type,object_ref_table, object_ref_id,ID)"
		elseif upper(ls_update_table) = 'SO_LINE' then
			ls_sql += ls_sql_cols + ",object_ref_table, object_ref_id,ID)"
			ls_sql_detail = "INSERT into  TAX_LINE (company_id, branch_id, created_by, created_date,last_mdf_by, last_mdf_date,"	
			ls_sql_cols = vstr_dwo_related[1].s_related_obj_column_copy[li_idx + 1]
			ls_sql_cols= trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))			
			if right(ls_sql_cols,1) = ',' then 
				ls_sql_detail += ls_sql_cols + "object_ref_table, object_ref_id,ID, doc_version)"
			else
				ls_sql_detail += ls_sql_cols + ",object_ref_table, object_ref_id,ID, doc_version)"
			end if	
			ls_sql_detail += " VALUES("+string( gi_user_comp_id ) + "," + string( ldb_branch ) + "," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate " 
			ls_from_cols_detail = vstr_dwo_related[1].s_main_obj_column_copy[li_idx+1]
			li_colCnt_detail = lc_string.f_stringtoarray( ls_from_cols_detail, ';', las_from_cols_detail[])		
		end if				
	end if
	ls_sql += " VALUES("+string( gi_user_comp_id ) + "," + string( ldb_branch ) + "," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate " 
	ls_from_cols = vstr_dwo_related[1].s_main_obj_column_copy[li_idx]
	li_colCnt = lc_string.f_stringtoarray( ls_from_cols, ';', las_from_cols[])
	//-- lấy mat cols--//
	if vstr_dwo_related[1].s_match_f_dwo[li_idx] = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
		ls_from_match_cols = vstr_dwo_related[1].s_match_f_column[li_idx]
		if pos(ls_from_match_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_from_match_cols , ';', las_from_match_cols[])
			ls_from_match_cols = las_from_match_cols[1]
		end if
		ls_mat_cols = vstr_dwo_related[1].s_match_column[li_idx]
		if pos(ls_mat_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_mat_cols , ';', las_mat_cols[])
			ls_mat_cols = las_mat_cols[1]
		end if			
	end if
	//-- lấy chk cols for update destination--//
	if  vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
		ls_related_chk_cols = vstr_dwo_related[1].s_related_obj_column_chk[li_idx]
		lc_string.f_stringtoarray( ls_related_chk_cols, ';', las_related_chk_cols[])
	end if
	//-- lấy chk cols source--//
	if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
		ls_main_chk_cols = vstr_dwo_related[1].s_main_obj_column_chk[li_idx]
		lc_string.f_stringtoarray( ls_main_chk_cols, ';', las_main_chk_cols[] )
	end if
	
	FOR li_idx1 = 1 to upperbound(vads_copied[])
		if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
			lb_found = true
			lb_update_orders = false
			FOR li_row = 1 to vads_copied[li_idx1].rowcount()
				//-- check match full--//
				if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_mat_val = vads_copied[li_idx1].getitemnumber(li_row, ls_from_match_cols)
					if isnull(ldb_mat_val) then ldb_mat_val = 0
					ldb_f_ref_id = vads_copied[li_idx1].getitemnumber(li_row, 'id')
					ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
					if isnull(ldb_matched_val) then ldb_matched_val = 0
					if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết--//
					if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
						 if isnull(vads_copied[li_idx1].getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
					end if								
				end if //-- kết thúc: check match full--//
				//-- check common values --//
				if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
					lb_update_orders = true
					for li_idx2 = 1 to upperbound(las_main_chk_cols[])
						if li_row = 1 then
							laa_chk_data[li_idx2] = vads_copied[li_idx1].f_getitemany(li_row, las_main_chk_cols[li_idx2])
						end if
					next					
				end if
				//-- insert--//
				ldb_id = this.f_create_id_ex( rt_transaction)
				FOR li_colnbr= 1 to li_colCnt
					ls_coltype = vads_copied[li_idx1].describe(las_from_cols[li_colnbr]+".coltype")
					if left(ls_coltype, 5) = 'numbe' then
						if las_from_cols[li_colnbr] = ls_from_match_cols then
							ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
						else
							if isnull(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr])) then
								ls_sql_values +=",NULL"
							else	
								ls_sql_values += "," + string(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr]))
							end if
						end if
					elseif left(ls_coltype, 5) = 'char(' then
						if isnull(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else						
							ls_sql_values += ",'" + string(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
						end if
					elseif  left(ls_coltype, 5) = 'datet' then
						if isnull(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else	
							ls_sql_values += ",to_date('" + string(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
						end if
					end if
				NEXT
				if upper(ls_update_table) = 'ORDERS' then					
					ls_sql_values += ",1,'SO_RETURN','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) + ")"
				elseif upper(ls_update_table) = 'SO_LINE' then
					ls_sql_values += ",'ORDERS',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
				end if				
				ls_sql_exec = ls_sql + ls_sql_values
				EXECUTE immediate :ls_sql_exec using rt_transaction;				
				ls_sql_values =''
				//-- update matching --//
				if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_f_branch_id =vads_copied[li_idx1].getitemnumber(li_row, 'branch_id')
					ls_f_ref_table = upper(vads_copied[li_idx1].describe( "datawindow.table.update"))
					ls_update_table = upper(ls_update_table)
					ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
										"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
										"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE,"+ls_mat_cols+")" +&
							" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
							","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+string(ldb_f_doc_id) +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
							",'"+ls_f_ref_table+"','COPY','"+ ls_update_table +"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
										
					EXECUTE immediate :ls_sql_exec using rt_transaction;
					lb_copied = true
				end if
			NEXT
			if lb_update_orders then
				ls_sql_exec = "UPDATE orders set "
				for li_idx2 = 1 to upperbound(las_related_chk_cols[])
					
					ls_data_tmp = string(laa_chk_data[li_idx2])
					if pos(ls_data_tmp,';') > 0 then
						ls_data_tmp = left(ls_data_tmp,pos(ls_data_tmp,';') -1)
					end if
					if li_idx2 = 1 then
						ls_sql_exec += las_related_chk_cols[li_idx2] + "=" + ls_data_tmp
					else
						ls_sql_exec += ","+ las_related_chk_cols[li_idx2] + "=" + ls_data_tmp
					end if
				next
				ls_sql_exec += ' where id = '+string(ldb_version_id)
				EXECUTE immediate :ls_sql_exec using rt_transaction;
			end if
			exit //-- chỉ có 1 dw source -> 1 dw dest --//
		end if		
	NEXT
	//-- ko có datastore dữ iệu copy--//		
	if not lb_found then 
		
		lb_update_orders = false
		lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] 
		ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))

		laa_value[1] = ldb_f_version_id
		if lower(ls_f_ref_table) = 'document' then
			lds_handle.f_add_where( "version_id", laa_value[])
		elseif upper(ls_f_ref_table) = 'ORDERS' then
			lds_handle.f_add_where( "id", laa_value[])
		else
			lds_handle.f_add_where( "object_ref_id", laa_value[])			
			lds_handle_detail.dataobject = 'd_tax_line_grid'
			lds_handle_detail.f_add_where( "doc_version", laa_value[])	
			lds_handle_detail.settransobject( rt_transaction)
			lds_handle_detail.retrieve( )
		end if
		lds_handle.settransobject( rt_transaction)
		lds_handle.retrieve( )
		FOR li_row = 1 to lds_handle.rowcount()
			ldb_f_ref_id = lds_handle.getitemnumber(li_row, 'id')
			//-- check match full--//
			if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
				ldb_mat_val = lds_handle.getitemnumber(li_row, ls_from_match_cols)
				if isnull(ldb_mat_val) then ldb_mat_val = 0				
				ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
				if isnull(ldb_matched_val) then ldb_matched_val = 0
				if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết --//
				if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
					 if isnull(lds_handle.getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
				end if				
			end if //-- kết thúc: check match full--//			
			//-- check common values --//
			if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
				lb_update_orders = true
				for li_idx2 = 1 to upperbound(las_main_chk_cols[])
					if li_row = 1 then
						laa_chk_data[li_idx2] = lds_handle.f_getitemany(li_row, las_main_chk_cols[li_idx2])
					end if
				next					
			end if			
			//-- insert--//
			ldb_id = this.f_create_id_ex( rt_transaction)			
			FOR li_colnbr= 1 to li_colCnt
				ls_coltype = lds_handle.describe(las_from_cols[li_colnbr]+".coltype")
				if left(ls_coltype, 5) = 'numbe' then
					if las_from_cols[li_colnbr] = ls_from_match_cols then
						ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
					else
						if isnull(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else
							ls_sql_values += "," + string(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr]))
						end if
					end if
				elseif left(ls_coltype, 5) = 'char(' then
					if isnull(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",'" + string(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
					end if
				elseif  left(ls_coltype, 5) = 'datet' then
					if isnull(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",to_date('" + string(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
					end if
				end if				
			NEXT
			if upper(ls_update_table) = 'ORDERS' then
				ls_sql_values += ",1,'SO_RETURN','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) + ")"
			else
				ls_sql_values += ",'ORDERS',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
			end if				
			ls_sql_exec = ls_sql + ls_sql_values
			EXECUTE immediate :ls_sql_exec using rt_transaction;			
			ls_sql_values =''			
			//-- update matching --//
			if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
				ldb_f_branch_id =lds_handle.getitemnumber(li_row, 'branch_id')
				ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))
				ls_update_table = upper(ls_update_table)
				ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
									"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
									"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE ,"+ls_mat_cols+")" +&
						" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
						","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+string(ldb_f_doc_id) +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
						",'"+ls_f_ref_table+"','COPY','"+ ls_update_table+"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
									
				EXECUTE immediate :ls_sql_exec using rt_transaction;			
				lb_copied = true
			end if
			//-- insert TAX Line --//
			if upper(ls_update_table) = 'SO_LINE' then

				lds_handle_detail.setfilter( "object_ref_id="+string(ldb_f_ref_id))
				lds_handle_detail.filter( )
				FOR li_row_detail = 1 to lds_handle_detail.rowcount( )
					ldb_id_detail = this.f_create_id_ex( rt_transaction)			
					FOR li_colnbr= 1 to li_colCnt_detail
						ls_coltype = lds_handle_detail.describe(las_from_cols_detail[li_colnbr]+".coltype")
						if left(ls_coltype, 5) = 'numbe' then
			
							if isnull(lds_handle_detail.getitemnumber(li_row_detail ,las_from_cols_detail[li_colnbr])) then
								ls_sql_values +=",NULL"
							else
								ls_sql_values += "," + string(lds_handle_detail.getitemnumber(li_row_detail ,las_from_cols_detail[li_colnbr]))
							end if

						elseif left(ls_coltype, 5) = 'char(' then
							if isnull(lds_handle_detail.getitemstring(li_row_detail ,las_from_cols_detail[li_colnbr])) then
								ls_sql_values +=",NULL"
							else
								ls_sql_values += ",'" + string(lds_handle_detail.getitemstring(li_row_detail ,las_from_cols_detail[li_colnbr]))+"'"
							end if
						elseif  left(ls_coltype, 5) = 'datet' then
							if isnull(lds_handle_detail.getitemdatetime(li_row_detail ,las_from_cols_detail[li_colnbr])) then
								ls_sql_values +=",NULL"
							else
								ls_sql_values += ",to_date('" + string(lds_handle_detail.getitemdatetime(li_row_detail ,las_from_cols_detail[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
							end if
						end if				
					NEXT

					ls_sql_values += ",'SO_LINE',"+string(ldb_id) + "," +string(ldb_id_detail) + "," + string(ldb_version_id) +")"
		
					ls_sql_exec = ls_sql_detail + ls_sql_values
					EXECUTE immediate :ls_sql_exec using rt_transaction;		
				NEXT
				ls_sql_values = ''
			end if //-- kết thúc inser TAX_line --//
		NEXT				
		if lb_update_orders then
			ls_sql_exec = "UPDATE orders set "
			for li_idx2 = 1 to upperbound(las_related_chk_cols[])
				
				ls_data_tmp = string(laa_chk_data[li_idx2])
				if pos(ls_data_tmp,';') > 0 then
					ls_data_tmp = left(ls_data_tmp,pos(ls_data_tmp,';') -1)
				end if
				if li_idx2 = 1 then
					ls_sql_exec += las_related_chk_cols[li_idx2] + "=" + ls_data_tmp
				else
					ls_sql_exec += ","+ las_related_chk_cols[li_idx2] + "=" + ls_data_tmp
				end if
			next
			ls_sql_exec += ' where id = '+string(ldb_version_id)
			EXECUTE immediate :ls_sql_exec using rt_transaction;
		end if		
	end if //--kết thúc: ko có datastore dữ iệu copy--//	
NEXT
destroy lds_handle
if lb_copied then
	commit using rt_transaction;
else
	rollback using rt_transaction;
	gf_messagebox('m.b_obj_instantiate.f_copy_to_so.02','Thông báo','Phiếu đã kết hết','stop','ok',1)
	return 0
end if

return ldb_t_doc_id
end function

public function long f_upd_web_new_item (t_ds_db vds_item, ref t_transaction rt_transaction);/*----------------------------------------

vsa_prod_ids[]: tối đa 50 phần tử

---------------------------------------------*/
long				ll_rtn, ll_variant, ll_productChild, ll_row, ll_root, ll_sku, ll_skuChild
string				ls_response,  ls_sku, ls_Json, ls_objName, ls_prodType, ls_rtn, ls_sql, ls_manufacturer
double			ldb_product_id, ldb_variant_id, ldb_obj_id
dec				ldc_price
JsonGenerator 	l_JsonGenerator
RestClient 		lrc_sku
c_string			lc_string
jsonparser 		l_jsonparser

lrc_sku = Create RestClient
ll_rtn = lrc_sku.setrequestheader("Authorization", "Bearer 819B9F8C7D3384D15C38FD26FBE8D021C6A7A196B2118A0FA4BCFADE2A05F186")
ll_rtn = lrc_sku.SetRequestHeader("Content-Type", "application/json;charset=UTF-8")

l_jsonparser = Create jsonparser

FOR ll_row = 1 to vds_item.rowcount()
	
	yield()
	this.of_show_progress( int(ll_row/vds_item.rowcount()*100),'Đang cập nhật ...')	
	this.of_set_progress_text( string(ll_row)+'/'+string(vds_item.rowcount()))
	
	
	//-- check trên web có chưa : sku --//
	//-- chưa xử lý --//
	//---------------------------------------//
	
	
	ldb_obj_id = vds_item.getitemnumber(ll_row, 'id')
	ls_objName = vds_item.getitemstring(ll_row, 'object_name')
	if isnull(ls_objName) then ls_objName = ''
	ls_sku = vds_item.getitemstring(ll_row, 'sku')
	if isnull(ls_sku) then ls_sku = ''
	ldc_price = vds_item.getitemnumber(ll_row, 'retail_price')
	if isnull(ldc_price) then ldc_price = 0
	ls_prodType = vds_item.getitemstring(ll_row, 'Product_type')
	if isnull(ls_prodType) then ls_prodType = 'Khác'
	ls_manufacturer =  vds_item.getitemstring(ll_row, 'manufacturers')
	if isnull(ls_manufacturer) then ls_manufacturer =''
	
	l_JsonGenerator = create JsonGenerator
	// Create an object root item
	ll_root = l_JsonGenerator.CreateJsonObject ()	
	ll_productChild = l_JsonGenerator.additemobject( ll_root, "product")
	
	l_JsonGenerator.additemstring( ll_productChild, "title", ls_objName)
	l_JsonGenerator.additemstring( ll_productChild, "product_type", ls_prodType)
	l_JsonGenerator.additemstring( ll_productChild, "vendor", ls_manufacturer)
	l_JsonGenerator.additemboolean( ll_productChild, "published", false)
	ll_variant = l_JsonGenerator.AddItemArray( ll_productChild, "variants")
	ll_skuChild = l_JsonGenerator.additemobject( ll_variant)
	l_JsonGenerator.additemstring( ll_skuChild,'title', "Default title")
	l_JsonGenerator.additemstring( ll_skuChild,'option1', "First")
	l_JsonGenerator.additemnumber( ll_skuChild,'price', ldc_price)
	l_JsonGenerator.additemstring( ll_skuChild, "sku", ls_sku)


	ls_Json = l_JsonGenerator.GetJsonString()
	destroy l_JsonGenerator
	
	ll_rtn = lrc_sku.sendpostrequest( "https://apis.haravan.com/com/products.json", ls_Json, ls_response)
//	ll_rtn = lrc_sku.sendputrequest("https://apis.haravan.com/com/variants/"+string(ldb_variant_id)+".json", ls_Json, ls_response)
	If lrc_sku.GetResponseStatusCode()<>201 or ll_rtn <> 1 Then
		//Checks if any error according to the value of ResponseStatuscode and ls_Response
	//	this.of_show_progress(101,'Đang cập nhật ...')
		gf_messagebox('m.b_obj_instantiate.f_upd_web_new_item.01','Thống báo','sendpostrequest error:@'+ls_response, 'stop','ok',1)
		continue 
	else
		//-- update web_link (object_ref_id, version_id) --//
		ls_rtn = l_jsonparser.loadstring( ls_response)
		if len(trim(ls_rtn)) > 0 then
			this.of_show_progress(101,'Đang cập nhật ...')
			gf_messagebox('m.b_obj_instantiate.f_upd_web_new_item.02','Thống báo',ls_rtn, 'stop','ok',1)			
			return -1
		end if
		ll_root = l_jsonparser.getrootitem()
		ll_productChild =  l_jsonparser.GetItemObject(ll_root, "product")
		ldb_product_id = l_jsonparser.GetItemNumber(ll_productChild, "id")
		ll_variant = l_jsonparser.GetItemArray(ll_productChild, "variants")
		ll_sku = l_jsonparser.GetChildItem(ll_variant, 1)
		ldb_variant_id = l_jsonparser.GetItemNumber(ll_sku, 'id')	
		
		ls_sql = "Update object set object_ref_id = "+string(ldb_product_id) + ", version_id= " + string(ldb_variant_id) + &
								" Where object_ref_table = 'ITEM' AND id = "+string(ldb_obj_id)
		execute immediate :ls_sql using rt_transaction;
		commit using rt_transaction;		
	end if	
next

destroy l_jsonparser

this.of_show_progress(101,'Đang cập nhật ...')
return 1

end function

public function decimal f_get_pur_price (double vdb_item_id, double vdb_currency, ref t_transaction rt_transaction);int				li_cnt
decimal		ldc_price

select count(o.id) into :li_cnt
from object o
left join V_MAX_UOM_ITEM v on v.item_id=o.id and v.company_id = o.company_id
left join  v_item_vendor_price ip on v.uom_id = ip.trans_uom 
                        and v.item_id = ip.item_id                        
join dwh_search dwh on dwh.object_id = o.id
left join item i on i.object_ref_id = o.id
where o.object_ref_table ='ITEM'
and o.active_yn = 'Y'
and o.id = :vdb_item_id
and ip.currency_id = :vdb_currency
using rt_transaction;

if li_cnt = 1 then
	select ip.wholesales_price into :ldc_price
	from object o
	left join V_MAX_UOM_ITEM v on v.item_id=o.id and v.company_id = o.company_id
	left join  v_item_vendor_price ip on v.uom_id = ip.trans_uom 
									and v.item_id = ip.item_id                        
	join dwh_search dwh on dwh.object_id = o.id
	left join item i on i.object_ref_id = o.id
	where o.object_ref_table ='ITEM'
	and o.active_yn = 'Y'
	and o.id = :vdb_item_id
	and ip.currency_id = :vdb_currency
	using rt_transaction;	
elseif li_cnt > 1 then
	select ip.wholesales_price into :ldc_price
	from object o
	left join V_MAX_UOM_ITEM v on v.item_id=o.id and v.company_id = o.company_id
	left join  v_item_vendor_price ip on v.uom_id = ip.trans_uom 
									and v.item_id = ip.item_id                        
	join dwh_search dwh on dwh.object_id = o.id
	left join item i on i.object_ref_id = o.id
	where o.object_ref_table ='ITEM'
	and o.active_yn = 'Y'
	and o.id = :vdb_item_id
	and ip.currency_id = :vdb_currency
	and rownum = 1
	using rt_transaction;	
else
	ldc_price = 0
end if
return ldc_price
end function

public function integer f_update_line_itemchanged_ex (string vs_edit_colname, string vs_editdata, string vs_upd_colname, string vs_line_table, double vdb_line_id, ref t_transaction rt_transaction, s_str_data vstr_currency);		/*--------------------------------------------------------------------------///
		Mô tả chức năng:1
		---------------------------------

-----------------------------------------------------------------------------------------
Hàm này đươc gọi sau khi đã cập nhật giá từ bảng giá cho dw-line
================================================	*/	
double				ldb_base_cur, ldb_round_id_base_amt, ldb_round_id_base_price, ldb_round_id_amt, ldb_round_id_price
dec					ldb_amount, ldb_base_amount, ldc_qty, ldc_price, ldc_vat_amt, ldc_vat_pct, ldc_disc_amt, ldc_disc_pct, ldb_amount_tmp
dec					ldc_base_price, ldc_act_qty, ldc_act_price, ldc_act_amount, ldc_PRICE_EX_TAX, ldc_AMOUNT_EX_TAX, ldc_BASE_AMOUNT_EX_TAX
dec					ldc_ACT_PRICE_EX_TAX, ldc_ACT_AMOUNT_EX_TAX, ldc_ACT_BASE_AMOUNT_EX_TAX, ldc_qty_tmp
string					ls_base_curcode,ls_base_curname, lsa_colname[], ls_sql
int						li_colCnt, li_idx
c_string				lc_string
c_unit_instance		lc_unit


 //-- chuẩn bị cho làm tròn  --//
lc_unit.f_get_base_cur_ex(ldb_base_cur,  ls_base_curcode,ls_base_curname, rt_transaction)
if ldb_base_cur > 0 then 
	ldb_round_id_base_amt =  lc_unit.f_get_round_id_ex( ldb_base_cur, 0, 'amount', rt_transaction)
	ldb_round_id_base_price =  lc_unit.f_get_round_id_ex( ldb_base_cur, 0, 'price', rt_transaction)
end if
if vstr_currency.adb_data[1] <> ldb_base_cur then
	ldb_round_id_amt =  lc_unit.f_get_round_id_ex( vstr_currency.adb_data[1], 0, 'amount', rt_transaction)
	ldb_round_id_price =  lc_unit.f_get_round_id_ex( vstr_currency.adb_data[1], 0, 'price', rt_transaction)	
else
	ldb_round_id_amt = ldb_round_id_base_amt
	ldb_round_id_price = ldb_round_id_base_price
end if
//-- tính toán lại giá trị các cột liên quan--//	
if vs_edit_colname = 'qty' then
elseif vs_edit_colname = 'price' then
	
	ldc_price =  dec(vs_editdata)
	ldc_price_ex_tax = ldc_price
	
	//-- ldc_qty --//
	select qty into :ldc_qty from po_line where id = :vdb_line_id using rt_transaction;

	
	//-- reset disc--//
	ldc_disc_pct = 0
	ldc_disc_amt = 0
	
	//-- act_price --//
	ldc_act_price = ldc_price
	//-- base_price--//
	if vstr_currency.adb_data[1] = ldb_base_cur then
		ldc_base_price = ldc_price
	else
		ldc_base_price = ldc_price * vstr_currency.adb_data[2]
		ldc_base_price = lc_unit.f_round( rt_transaction, ldb_round_id_base_price, ldc_base_price)
	end if
	//--act_amount --//
	ldc_act_amount =  lc_unit.f_round( rt_transaction, ldb_round_id_amt, ldc_act_price*ldc_qty)
	//-- amount--//
	if ldc_disc_pct = 0 and ldc_disc_amt = 0 then
		ldb_amount = lc_unit.f_round( rt_transaction, ldb_round_id_amt, ldc_price*ldc_qty)
	else
		ldb_amount= lc_unit.f_round( rt_transaction, ldb_round_id_amt, ldc_price*ldc_qty/(1 + ldc_disc_pct/100))
	end if	
	//-- base_amount--//
	if vstr_currency.adb_data[1] = ldb_base_cur then
		ldb_base_amount = ldb_amount	
	else
		ldb_base_amount = ldb_amount * vstr_currency.adb_data[2]
		ldb_base_amount = lc_unit.f_round( rt_transaction, ldb_round_id_base_amt, ldb_base_amount)
	end if
	//--vat--//
	if vs_line_table = 'po_line' then
		select vat into :ldc_vat_pct from po_line where id = :vdb_line_id using rt_transaction;				
	else
	end if	
	
	if isnull(ldc_vat_pct) then ldc_vat_pct = 0
	ldc_vat_amt = lc_unit.f_round( rt_transaction, ldb_round_id_base_amt, ldb_base_amount*ldc_vat_pct/100) 
	//--amount_ex_tax--//
	ldc_AMOUNT_EX_TAX = ldc_act_amount
	//--base_amount_ex_tax--//
	ldc_BASE_AMOUNT_EX_TAX = ldb_base_amount
	//-- act_qty--//
	ldc_act_qty = ldc_qty	
	//--act_amount_ex_tax--//
	ldc_ACT_AMOUNT_EX_TAX = ldc_AMOUNT_EX_TAX
	//--act_base_amount_ex_tax--//
	ldc_ACT_BASE_AMOUNT_EX_TAX = ldc_BASE_AMOUNT_EX_TAX
	
elseif vs_edit_colname = 'amount' then
elseif vs_edit_colname = 'base_amount' then		
elseif vs_edit_colname = 'act_amount' then
elseif vs_edit_colname = 'base_price' then	
	
elseif vs_edit_colname = 'act_qty' then	
elseif vs_edit_colname = 'act_price' then

elseif vs_edit_colname = 'vat' then
elseif vs_edit_colname = 'tax_pct' then
elseif vs_edit_colname = 'discount_pct' then
elseif vs_edit_colname = 'discount' then	
elseif vs_edit_colname = 'disc_pct' then
elseif vs_edit_colname = 'disc_amt' then

end if

//-- Cập nhật lại line --//
ls_sql = 'UPDATE '+ vs_line_table + ' set ' 
li_colCnt = lc_string.f_stringtoarray( vs_upd_colname, ';', lsa_colname[])
FOR li_idx = 1 to li_colCnt	
	if  lsa_colname[li_idx] = 'price' then
		ls_sql +=  lsa_colname[li_idx] + ' = ' + string(ldc_price) + ','
	elseif lsa_colname[li_idx] = 'amount' then
		ls_sql +=  lsa_colname[li_idx] + ' = ' +  string(ldb_amount)+ ','
	elseif lsa_colname[li_idx] = 'base_amount' then
		ls_sql +=  lsa_colname[li_idx] + ' = ' + string(ldb_base_amount)+ ','
	elseif lsa_colname[li_idx] = 'base_price' then
		ls_sql += lsa_colname[li_idx] +  ' = ' + string(ldb_base_amount)+ ','
	elseif lsa_colname[li_idx] = 'act_qty' then
		ls_sql += lsa_colname[li_idx] +  ' = ' + string(ldc_act_qty)+ ','
	elseif lsa_colname[li_idx] = 'act_price' then
		ls_sql += lsa_colname[li_idx] +  ' = ' + string(ldc_act_price)+ ','
	elseif lsa_colname[li_idx] = 'act_amount' then
		ls_sql += lsa_colname[li_idx] +  ' = ' + string(ldc_act_amount)+ ','
	elseif  lsa_colname[li_idx] = 'price_ex_tax' then
		ls_sql += lsa_colname[li_idx] +  ' = ' + string(ldc_price_ex_tax)+ ','
	elseif  lsa_colname[li_idx] = 'amount_ex_tax' then
		ls_sql += lsa_colname[li_idx] +  ' = ' + string(ldc_amount_ex_tax)+ ','
	elseif  lsa_colname[li_idx] = 'base_amount_ex_tax' then
		ls_sql += lsa_colname[li_idx] +  ' = ' + string(ldc_base_amount_ex_tax)+ ','
	elseif  lsa_colname[li_idx] = 'act_price_ex_tax' then
		ls_sql += lsa_colname[li_idx] +  ' = ' + string(ldc_act_price_ex_tax)+ ','
	elseif  lsa_colname[li_idx] = 'act_amount_ex_tax' then
		ls_sql += lsa_colname[li_idx] +  ' = ' + string(ldc_act_amount_ex_tax)+ ','
	elseif  lsa_colname[li_idx] = 'act_base_amount_ex_tax' then
		ls_sql += lsa_colname[li_idx] +  ' = ' + string(ldc_act_base_amount_ex_tax)+ ','
	elseif lsa_colname[li_idx] = 'vat_amount' then	
		ls_sql += lsa_colname[li_idx] +  ' = ' + string(ldc_vat_amt)+ ','
	elseif lsa_colname[li_idx] = 'tax_correction' then	
		ls_sql += lsa_colname[li_idx] +  ' = ' + string(ldc_vat_amt)+ ','
	elseif  lsa_colname[li_idx] = 'disc_pct' then	
		ls_sql += lsa_colname[li_idx] +  ' = ' + string(ldc_disc_pct)+ ','
	elseif  lsa_colname[li_idx] = 'disc_amt' then	
		ls_sql += lsa_colname[li_idx] +  ' = ' + string(ldc_disc_amt)+ ','
	elseif  lsa_colname[li_idx] = 'discount' then	
		ls_sql += lsa_colname[li_idx] +  ' = ' + string(ldc_disc_amt)+ ','
	elseif  lsa_colname[li_idx] = 'discount_pct' then	
		ls_sql += lsa_colname[li_idx] +  ' = ' + string(ldc_disc_pct)+ ','
	end if						
NEXT
ls_sql = mid(ls_sql, 1, len(ls_sql) -1)
ls_sql += ' WHERE ID = '+string(vdb_line_id) 
execute immediate :ls_sql using rt_transaction;

return 1
end function

public function double f_copy_to (string vs_f_objname, string vs_t_objname, s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial);
if vs_t_objname = 'u_po' then
	return this.f_copy_to_po(vstr_dwo_related[], vads_copied[], rt_transaction, rdwsetup_initial)
elseif vs_t_objname = 'u_so_return' then
	return this.f_copy_to_so_return(vstr_dwo_related[], vads_copied[], rt_transaction, rdwsetup_initial)
elseif vs_t_objname = 'u_qt' then
	return this.f_copy_to_qt(vs_f_objname , vstr_dwo_related[], vads_copied[], rt_transaction, rdwsetup_initial)
elseif pos(vs_t_objname, 'u_pur_invoice')>0 then
	return this.f_copy_to_pur_invoice(vs_f_objname , vstr_dwo_related[], vads_copied[], rt_transaction, rdwsetup_initial)
elseif pos(vs_t_objname, 'u_sal_invoice')>0 then
	return this.f_copy_to_sal_invoice(vs_f_objname , vstr_dwo_related[], vads_copied[], rt_transaction, rdwsetup_initial)	
elseif pos(vs_t_objname, 'u_payment')>0 then
	return this.f_copy_to_payment(vs_f_objname , vstr_dwo_related[], vads_copied[], rt_transaction, rdwsetup_initial)
elseif pos(vs_t_objname, 'u_bank_voucher_payment')>0 then
	return this.f_copy_to_bank_voucher_payment(vs_f_objname , vstr_dwo_related[], vads_copied[], rt_transaction, rdwsetup_initial)	
elseif pos(vs_t_objname, 'u_receipt')>0 then
	return this.f_copy_to_receipt(vs_f_objname , vstr_dwo_related[], vads_copied[], rt_transaction, rdwsetup_initial)	
elseif pos(vs_t_objname, 'u_bank_voucher')>0 then
	return this.f_copy_to_bank_voucher(vs_f_objname , vstr_dwo_related[], vads_copied[], rt_transaction, rdwsetup_initial)		
end if

return 0
end function

public function double f_copy_to_qt (string vs_f_objname, s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial);string				ls_sql, ls_code, ls_currCode, ls_currName, ls_sql_cols, ls_update_table, ls_related_data, las_related_data[], ls_f_ref_table
string				ls_main_chk_cols, las_main_chk_cols[], ls_related_chk_cols, las_related_chk_cols[], ls_data_tmp
string				las_from_cols[], ls_from_cols, ls_sql_values, ls_coltype, ls_sql_exec, ls_from_match_cols, las_from_match_cols[], ls_mat_cols, las_mat_cols[]
string				ls_sql_detail, ls_from_cols_detail, las_from_cols_detail[], las_to_dft_cols[], ls_main_dfl_obj_col
double			ldb_id,ldb_f_doc_id, ldb_t_doc_id, ldb_version_id, ldb_trans_id, ldb_base_currID, ldb_mat_val, ldb_matched_val, ldb_f_ref_id, ldb_f_branch_id
double			ldb_f_version_id, ldb_branch, ldb_id_detail, ldb_manage_group, ldb_dfl_obj
int					li_idx, li_idx1, li_idx2, li_row, li_colnbr, li_colCnt, li_pos, li_cnt, li_colCnt_detail, li_row_detail, li_dft_colCnt
boolean			lb_found, lb_copied, lb_update_orders
any				laa_value[], laa_chk_data[]
t_ds_db				lds_handle, lds_handle_detail, lds_cust_info
c_string				lc_string
c_unit_instance 	lc_unit_ins
JsonParser  			ljpsr_cust_info
JsonPackage		ljpk_cust_info

//--------------------------//
// lấy giao dịch của QT //
//-------------------------//
li_pos =  pos( vstr_dwo_related[1].s_data[1] , "(" )
if li_pos > 0 then
	ls_related_data = mid(vstr_dwo_related[1].s_data[1], li_pos +1, pos(vstr_dwo_related[1].s_data[1] , ')') - (li_pos +1) )
	li_cnt = lc_string.f_Stringtoarray( ls_related_data, ',', las_related_data[])
else
	las_related_data[1] = vstr_dwo_related[1].s_data[1]
end if
ldb_id = double(las_related_data[1] )

lds_handle_detail = create t_ds_db
lds_handle = create t_ds_db
lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo
ls_update_table = lds_handle.describe( "datawindow.table.update")
if lower(ls_update_table) = 'document' then  //-- copy header --//
	if vs_f_objname = 'u_qt' then		//-- nhân bản --//
		select t.trans_hdr_id, t.version_id, t.branch_id , t.manage_group  into :ldb_trans_id, :ldb_f_version_id, :ldb_branch, :ldb_manage_group
			from document t
			join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
			where t.company_id = :gi_user_comp_id
			and t.id =  :ldb_id
			using rt_transaction;
			if isnull(ldb_manage_group) then ldb_manage_group = 0		
	else
		ldb_f_doc_id = ldb_id
		select count(t2.id) into :li_cnt
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'QT'
		where t.company_id = :gi_user_comp_id
		and t.id =  :ldb_id
		using rt_transaction;
		if li_cnt = 1 then
			select t2.id, t.version_id, t.branch_id , t.manage_group  into :ldb_trans_id, :ldb_f_version_id, :ldb_branch, :ldb_manage_group
			from document t
			join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
			join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'QT'
			where t.company_id = :gi_user_comp_id
			and t.id =  :ldb_id
			using rt_transaction;
			if isnull(ldb_manage_group) then ldb_manage_group = 0
		else
			gf_messagebox('m.b_obj_instantiate.f_copy_to_so.01','Thông báo','Chưa cài đặt giao dịch cho SO thuộc nhóm copy','stop','ok',1)
			return -1
		end if
	end if
else
	//-- copy line --//
	select object_ref_id, branch_id into :ldb_f_version_id, :ldb_branch
	from pr_line t
	where t.id = :ldb_id
//	and t.branch_id = :gdb_branch
	and  t.company_id = :gi_user_comp_id
	using rt_transaction;
	
	select count(t2.id) 
	into :li_cnt
	from document t
	join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
	join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
	where t.company_id = :gi_user_comp_id
	and t.branch_id = :ldb_branch
	and t.version_id = :ldb_f_version_id
	using rt_transaction;
	
	if li_cnt = 1 then
		select t2.id, t.id into :ldb_trans_id, :ldb_f_doc_id
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
		where t.company_id = :gi_user_comp_id
		and t.branch_id = :ldb_branch
		and t.version_id =  :ldb_f_version_id
		using rt_transaction;
	else
		gf_messagebox('m.b_obj_instantiate.f_copy_to_so.01','Thông báo','Chưa cài đặt giao dịch cho SO thuộc nhóm copy','stop','ok',1)
		return -1
	end if	
end if

//---------------------//
// insert document  //
//--------------------//
ldb_t_doc_id = this.f_create_id_ex( rt_transaction)
ldb_version_id =  this.f_create_id_ex( rt_transaction)
ls_code = rdwsetup_initial.f_get_autonumber_ex('code','d_document_qt_grid', rt_transaction)
ls_sql = "INSERT into DOCUMENT(id,company_id, branch_id,object_ref_table, created_by, created_date,last_mdf_by, last_mdf_date,"+&
									" doc_type, version_id, SOB, handled_by, CODE, document_date, TRANS_HDR_ID,status, manage_group)" +&
			" VALUES("+string(ldb_t_doc_id)+ "," + string( gi_user_comp_id ) + "," + string( ldb_branch ) + ",'ORDERS' ," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate, " +&
						"'QT',"+string(ldb_version_id) +",'"+ gs_sob +"',"+string(gi_userid) + ",'"+ls_code +"', trunc(sysdate)"+ ","+string(ldb_trans_id) +", 'new',"+ string(ldb_manage_group)+ ")"
EXECUTE immediate :ls_sql using rt_transaction;



//--------------------//
// insert table  //
//--------------------//

FOR li_idx = 1 to upperbound(vstr_dwo_related[1].s_related_obj_dwo_copy[] ) - 1 //-- trừ dw tax_line --//

	lds_handle.dataobject = vstr_dwo_related[1].s_related_obj_dwo_copy[li_idx]
	ls_update_table = lds_handle.describe( "datawindow.table.update")		
	if lower(ls_update_table) = 'document' then ls_update_table = 'ORDERS'
	
	ls_sql = "INSERT into "+ls_update_table +"(company_id, branch_id, created_by, created_date,last_mdf_by, last_mdf_date,"				
	ls_sql_cols = vstr_dwo_related[1].s_related_obj_column_copy[li_idx]
	if upperbound(vstr_dwo_related[1].s_t_default_col[]) >= li_idx then
		ls_sql_cols += vstr_dwo_related[1].s_t_default_col[li_idx]
		ls_main_dfl_obj_col = vstr_dwo_related[1].s_main_dft_obj_col[li_idx]
	end if
	ls_sql_cols= trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))
	if right(ls_sql_cols,1) = ',' then 
		if upper(ls_update_table) = 'ORDERS' then
			ls_sql += ls_sql_cols + "version_no,doc_type,object_ref_table, object_ref_id,ID)"
		elseif upper(ls_update_table) = 'QT_LINE' then
			ls_sql += ls_sql_cols + "object_ref_table, object_ref_id,ID)"
			ls_sql_detail = "INSERT into TAX_LINE (company_id, branch_id, created_by, created_date,last_mdf_by, last_mdf_date,"	
			ls_sql_cols = vstr_dwo_related[1].s_related_obj_column_copy[li_idx + 1]
			ls_sql_cols= trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))			
			if right(ls_sql_cols,1) = ',' then 
				ls_sql_detail += ls_sql_cols + "object_ref_table, object_ref_id,ID, doc_version)"
			else
				ls_sql_detail += ls_sql_cols + ",object_ref_table, object_ref_id,ID, doc_version)"
			end if
			ls_sql_detail += " VALUES("+string( gi_user_comp_id ) + "," + string( ldb_branch ) + "," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate " 
			ls_from_cols_detail = vstr_dwo_related[1].s_main_obj_column_copy[li_idx+1]
			li_colCnt_detail = lc_string.f_stringtoarray( ls_from_cols_detail, ';', las_from_cols_detail[])		
		end if		
	else
		if upper(ls_update_table) = 'ORDERS' then
			ls_sql += ls_sql_cols + ",version_no,doc_type,object_ref_table, object_ref_id,ID)"
		elseif upper(ls_update_table) = 'QT_LINE' then
			ls_sql += ls_sql_cols + ",object_ref_table, object_ref_id,ID)"
			ls_sql_detail = "INSERT into  TAX_LINE (company_id, branch_id, created_by, created_date,last_mdf_by, last_mdf_date,"	
			ls_sql_cols = vstr_dwo_related[1].s_related_obj_column_copy[li_idx + 1]
			ls_sql_cols= trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))			
			if right(ls_sql_cols,1) = ',' then 
				ls_sql_detail += ls_sql_cols + "object_ref_table, object_ref_id,ID, doc_version)"
			else
				ls_sql_detail += ls_sql_cols + ",object_ref_table, object_ref_id,ID, doc_version)"
			end if	
			ls_sql_detail += " VALUES("+string( gi_user_comp_id ) + "," + string( ldb_branch ) + "," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate " 
			ls_from_cols_detail = vstr_dwo_related[1].s_main_obj_column_copy[li_idx+1]
			li_colCnt_detail = lc_string.f_stringtoarray( ls_from_cols_detail, ';', las_from_cols_detail[])		
		end if				
	end if
	ls_sql += " VALUES("+string( gi_user_comp_id ) + "," + string( ldb_branch ) + "," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate " 
	ls_from_cols = vstr_dwo_related[1].s_main_obj_column_copy[li_idx]
	li_colCnt = lc_string.f_stringtoarray( ls_from_cols, ';', las_from_cols[])
	//-- lấy mat cols--//
	if vstr_dwo_related[1].s_match_f_dwo[li_idx] = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
		ls_from_match_cols = vstr_dwo_related[1].s_match_f_column[li_idx]
		if pos(ls_from_match_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_from_match_cols , ';', las_from_match_cols[])
			ls_from_match_cols = las_from_match_cols[1]
		end if
		ls_mat_cols = vstr_dwo_related[1].s_match_column[li_idx]
		if pos(ls_mat_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_mat_cols , ';', las_mat_cols[])
			ls_mat_cols = las_mat_cols[1]
		end if			
	end if
	//-- lấy chk cols for update destination--//
	if  vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
		ls_related_chk_cols = vstr_dwo_related[1].s_related_obj_column_chk[li_idx]
		lc_string.f_stringtoarray( ls_related_chk_cols, ';', las_related_chk_cols[])
	end if
	//-- lấy chk cols source--//
	if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
		ls_main_chk_cols = vstr_dwo_related[1].s_main_obj_column_chk[li_idx]
		lc_string.f_stringtoarray( ls_main_chk_cols, ';', las_main_chk_cols[] )
	end if
	
	FOR li_idx1 = 1 to upperbound(vads_copied[])
		if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
			lb_found = true
			lb_update_orders = false
			FOR li_row = 1 to vads_copied[li_idx1].rowcount()
				//-- check match full--//
				if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] and vstr_dwo_related[1].b_chk_matched_qty then
					ldb_mat_val = vads_copied[li_idx1].getitemnumber(li_row, ls_from_match_cols)
					if isnull(ldb_mat_val) then ldb_mat_val = 0
					ldb_f_ref_id = vads_copied[li_idx1].getitemnumber(li_row, 'id')
					///////////////////////////////////////
//					ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
					/////////////////////////////////////////////////////////
					if isnull(ldb_matched_val) then ldb_matched_val = 0
					if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết--//
					if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
						 if isnull(vads_copied[li_idx1].getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
					end if								
				end if //-- kết thúc: check match full--//
				//-- check common values --//
				if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
					lb_update_orders = true
					for li_idx2 = 1 to upperbound(las_main_chk_cols[])
						if li_row = 1 then
							laa_chk_data[li_idx2] = vads_copied[li_idx1].f_getitemany(li_row, las_main_chk_cols[li_idx2])
						end if
					next					
				end if
				//-- insert--//
				ldb_id = this.f_create_id_ex( rt_transaction)
				FOR li_colnbr= 1 to li_colCnt
					ls_coltype = vads_copied[li_idx1].describe(las_from_cols[li_colnbr]+".coltype")
					if left(ls_coltype, 5) = 'numbe' then
						if las_from_cols[li_colnbr] = ls_from_match_cols  and vstr_dwo_related[1].b_chk_matched_qty then
							ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)						
						else
							if isnull(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr])) then
								ls_sql_values +=",NULL"
							else	
								ls_sql_values += "," + string(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr]))
							end if
						end if
						if  las_from_cols[li_colnbr] = ls_main_dfl_obj_col then
							ldb_dfl_obj = vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr])
						end if
					elseif left(ls_coltype, 5) = 'char(' then
						if isnull(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else						
							ls_sql_values += ",'" + vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr]) +"'"
						end if
					elseif  left(ls_coltype, 5) = 'datet' then
						if isnull(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else	
							ls_sql_values += ",to_date('" + string(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
						end if
					end if
				NEXT
				//-- default cols--//
				if upperbound(vstr_dwo_related[1].s_f_default_col[]) >= li_idx then				
					li_dft_colCnt =  lc_string.f_stringtoarray( vstr_dwo_related[1].s_t_default_col[li_idx], ';', las_to_dft_cols[])
					if li_dft_colCnt > 0 then
						lds_cust_info = create t_ds_db	
						string lsa_values[]
						if this.f_get_cust_info( ldb_dfl_obj , vstr_dwo_related[1].s_f_default_col[li_idx], lsa_values[] , rt_transaction )> 0 then		
//						if this.f_get_cust_info( ldb_dfl_obj , vstr_dwo_related[1].s_f_default_col[li_idx], lds_cust_info, rt_transaction )> 0 then							
							FOR li_colnbr= 1 to li_dft_colCnt  
								ls_coltype = lds_handle.describe(las_to_dft_cols[li_colnbr]+".coltype")
								if left(ls_coltype, 5) = 'numbe' then
									if  isnull(lsa_values[li_colnbr]) then
										ls_sql_values +=",NULL"
									else	
										ls_sql_values += "," + lsa_values[li_colnbr]
									end if									
								elseif left(ls_coltype, 5) = 'char(' then
									if isnull(lsa_values[li_colnbr])  then
										ls_sql_values +=",NULL"
									else	
										ls_sql_values += ",'" +  lsa_values[li_colnbr] + "'"
									end if											
								end if
							NEXT
						end if
						destroy lds_cust_info
					end if
				end if				
				/////////////////////////////////////////////////////////////
				
				//-- last cols--//
				if upper(ls_update_table) = 'ORDERS' then					
					ls_sql_values += ",1,'QT','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) + ")"
				elseif upper(ls_update_table) = 'QT_LINE' then
					ls_sql_values += ",'ORDERS',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
				end if				
				ls_sql_exec = ls_sql + ls_sql_values
				EXECUTE immediate :ls_sql_exec using rt_transaction;				
				ls_sql_values =''
				//-- update matching --//
				if vs_f_objname <> 'u_qt' then
					if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
						ldb_f_branch_id =vads_copied[li_idx1].getitemnumber(li_row, 'branch_id')
						ls_f_ref_table = upper(vads_copied[li_idx1].describe( "datawindow.table.update"))
						ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
											"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
											"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE,"+ls_mat_cols+")" +&
								" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
								","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+string(ldb_f_doc_id) +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
								",'"+upper(ls_f_ref_table)+"','COPY','"+ upper(ls_update_table) +"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
											
						EXECUTE immediate :ls_sql_exec using rt_transaction;
						lb_copied = true
					elseif vstr_dwo_related[1].s_match_f_dwo[li_idx] = '' then
						lb_copied = true
					end if
				else
					lb_copied = true
				end if
			NEXT
			if lb_update_orders then
				ls_sql_exec = "UPDATE orders set "
				for li_idx2 = 1 to upperbound(las_related_chk_cols[])
					
					ls_data_tmp = string(laa_chk_data[li_idx2])
					if pos(ls_data_tmp,';') > 0 then
						ls_data_tmp = left(ls_data_tmp,pos(ls_data_tmp,';') -1)
					end if
					if li_idx2 = 1 then
						ls_sql_exec += las_related_chk_cols[li_idx2] + "=" + ls_data_tmp
					else
						ls_sql_exec += ","+ las_related_chk_cols[li_idx2] + "=" + ls_data_tmp
					end if
				next
				ls_sql_exec += ' where id = '+string(ldb_version_id)
				EXECUTE immediate :ls_sql_exec using rt_transaction;
			end if
			exit //-- chỉ có 1 dw source -> 1 dw dest --//
		end if		
	NEXT
	//-- ko có datastore dữ iệu copy--//		
	if not lb_found then 
		
		lb_update_orders = false
		lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] 
		ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))

		laa_value[1] = ldb_f_version_id
		if lower(ls_f_ref_table) = 'document' then
			lds_handle.f_add_where( "version_id", laa_value[])
		elseif upper(ls_f_ref_table) = 'ORDERS' then
			lds_handle.f_add_where( "id", laa_value[])
		else
			lds_handle.f_add_where( "object_ref_id", laa_value[])			
			lds_handle_detail.dataobject = 'd_tax_line_grid'
			lds_handle_detail.f_add_where( "doc_version", laa_value[])	
			lds_handle_detail.settransobject( rt_transaction)
			lds_handle_detail.retrieve( )
		end if
		lds_handle.settransobject( rt_transaction)
		lds_handle.retrieve( )
		FOR li_row = 1 to lds_handle.rowcount()
			ldb_f_ref_id = lds_handle.getitemnumber(li_row, 'id')
			//-- check match full--//
			if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] and vstr_dwo_related[1].b_chk_matched_qty then
				ldb_mat_val = lds_handle.getitemnumber(li_row, ls_from_match_cols)
				if isnull(ldb_mat_val) then ldb_mat_val = 0			
				///////////////////////////////////////////////////////
//				ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
				////////////////////////////////////////////////////////////////////////////////
				if isnull(ldb_matched_val) then ldb_matched_val = 0
				if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết --//
				if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
					 if isnull(lds_handle.getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
				end if				
			end if //-- kết thúc: check match full--//			
			//-- check common values --//
			if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
				lb_update_orders = true
				for li_idx2 = 1 to upperbound(las_main_chk_cols[])
					if li_row = 1 then
						laa_chk_data[li_idx2] = lds_handle.f_getitemany(li_row, las_main_chk_cols[li_idx2])
					end if
				next					
			end if			
			//-- insert--//
			ldb_id = this.f_create_id_ex( rt_transaction)			
			FOR li_colnbr= 1 to li_colCnt
				ls_coltype = lds_handle.describe(las_from_cols[li_colnbr]+".coltype")
				if left(ls_coltype, 5) = 'numbe' then
					if las_from_cols[li_colnbr] = ls_from_match_cols  and vstr_dwo_related[1].b_chk_matched_qty then
						ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
					else
						if isnull(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else
							ls_sql_values += "," + string(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr]))
						end if
					end if
				elseif left(ls_coltype, 5) = 'char(' then
					if isnull(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",'" + string(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
					end if
				elseif  left(ls_coltype, 5) = 'datet' then
					if isnull(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",to_date('" + string(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
					end if
				end if				
			NEXT
			//-- default cols--//
			
			
			//-- last cols--//
			if upper(ls_update_table) = 'ORDERS' then
				ls_sql_values += ",1,'QT','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) + ")"
			else
				ls_sql_values += ",'ORDERS',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
			end if				
			ls_sql_exec = ls_sql + ls_sql_values
			EXECUTE immediate :ls_sql_exec using rt_transaction;			
			ls_sql_values =''			
			//-- update matching --//
			if vs_f_objname <> 'u_qt' then
				if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_f_branch_id =lds_handle.getitemnumber(li_row, 'branch_id')
					ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))
					ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
										"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
										"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE ,"+ls_mat_cols+")" +&
							" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
							","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+string(ldb_f_doc_id) +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
							",'"+upper(ls_f_ref_table)+"','COPY','"+ upper(ls_update_table)+"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
										
					EXECUTE immediate :ls_sql_exec using rt_transaction;			
					lb_copied = true
				elseif vstr_dwo_related[1].s_match_f_dwo[li_idx]  = '' then
					lb_copied = true
				end if
			else
				lb_copied = true
			end if
			//-- insert TAX Line --//
			if upper(ls_update_table) = 'QT_LINE' then

				lds_handle_detail.setfilter( "object_ref_id="+string(ldb_f_ref_id))
				lds_handle_detail.filter( )
				FOR li_row_detail = 1 to lds_handle_detail.rowcount( )
					ldb_id_detail = this.f_create_id_ex( rt_transaction)			
					FOR li_colnbr= 1 to li_colCnt_detail
						ls_coltype = lds_handle_detail.describe(las_from_cols_detail[li_colnbr]+".coltype")
						if left(ls_coltype, 5) = 'numbe' then
			
							if isnull(lds_handle_detail.getitemnumber(li_row_detail ,las_from_cols_detail[li_colnbr])) then
								ls_sql_values +=",NULL"
							else
								ls_sql_values += "," + string(lds_handle_detail.getitemnumber(li_row_detail ,las_from_cols_detail[li_colnbr]))
							end if

						elseif left(ls_coltype, 5) = 'char(' then
							if isnull(lds_handle_detail.getitemstring(li_row_detail ,las_from_cols_detail[li_colnbr])) then
								ls_sql_values +=",NULL"
							else
								ls_sql_values += ",'" + string(lds_handle_detail.getitemstring(li_row_detail ,las_from_cols_detail[li_colnbr]))+"'"
							end if
						elseif  left(ls_coltype, 5) = 'datet' then
							if isnull(lds_handle_detail.getitemdatetime(li_row_detail ,las_from_cols_detail[li_colnbr])) then
								ls_sql_values +=",NULL"
							else
								ls_sql_values += ",to_date('" + string(lds_handle_detail.getitemdatetime(li_row_detail ,las_from_cols_detail[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
							end if
						end if				
					NEXT

					ls_sql_values += ",'QT_LINE',"+string(ldb_id) + "," +string(ldb_id_detail) + "," + string(ldb_version_id) +")"
		
					ls_sql_exec = ls_sql_detail + ls_sql_values
					EXECUTE immediate :ls_sql_exec using rt_transaction;		
				NEXT
				ls_sql_values = ''
			end if //-- kết thúc inser TAX_line --//
		NEXT				
		if lb_update_orders then
			ls_sql_exec = "UPDATE orders set "
			for li_idx2 = 1 to upperbound(las_related_chk_cols[])
				
				ls_data_tmp = string(laa_chk_data[li_idx2])
				if pos(ls_data_tmp,';') > 0 then
					ls_data_tmp = left(ls_data_tmp,pos(ls_data_tmp,';') -1)
				end if
				if li_idx2 = 1 then
					ls_sql_exec += las_related_chk_cols[li_idx2] + "=" + ls_data_tmp
				else
					ls_sql_exec += ","+ las_related_chk_cols[li_idx2] + "=" + ls_data_tmp
				end if
			next
			ls_sql_exec += ' where id = '+string(ldb_version_id)
			EXECUTE immediate :ls_sql_exec using rt_transaction;
		end if		
	end if //--kết thúc: ko có datastore dữ iệu copy--//	
NEXT
destroy lds_handle
if lb_copied then
	commit using rt_transaction;
else
	rollback using rt_transaction;
	gf_messagebox('m.b_obj_instantiate.f_copy_to_so.02','Thông báo','Phiếu đã kết hết','stop','ok',1)
	return 0
end if

return ldb_t_doc_id
end function

public function double f_copy_to_pur_invoice (string vs_f_objname, s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial);string				ls_sql, ls_code, ls_currCode, ls_currName, ls_sql_cols, ls_update_table, ls_related_data, las_related_data[], ls_f_ref_table
string				ls_main_chk_cols, las_main_chk_cols[], ls_related_chk_cols, las_related_chk_cols[], ls_data_tmp, las_initvalue_cols[], ls_qty_yn, ls_val_yn
string				las_from_cols[], ls_from_cols, ls_sql_values, ls_coltype, ls_sql_exec, ls_from_match_cols, las_from_match_cols[], ls_mat_cols, las_mat_cols[]
double			ldb_id,ldb_f_doc_id, ldb_t_doc_id, ldb_version_id, ldb_trans_id, ldb_base_currID, ldb_mat_val, ldb_matched_val, ldb_f_ref_id, ldb_f_branch_id
double			ldb_f_version_id, ldb_branch, ldb_manage_group
int					li_idx, li_idx1, li_idx2, li_row, li_colnbr, li_colCnt, li_pos, li_cnt
boolean			lb_found, lb_copied, lb_update_orders
any				laa_value[], laa_chk_data[], la_initvalue
t_ds_db				lds_handle
c_string				lc_string
c_unit_instance 	lc_unit_ins
c_dwsetup_initial	lc_dwsetup_initial

//--------------------------//
// lấy giao dịch của PO //
//-------------------------//
li_pos =  pos( vstr_dwo_related[1].s_data[1] , "(" )
if li_pos > 0 then
	ls_related_data = mid(vstr_dwo_related[1].s_data[1], li_pos +1, pos(vstr_dwo_related[1].s_data[1] , ')') - (li_pos +1) )
	li_cnt = lc_string.f_Stringtoarray( ls_related_data, ',', las_related_data[])
else
	las_related_data[1] = vstr_dwo_related[1].s_data[1]
end if
ldb_id = double(las_related_data[1] )

lds_handle = create t_ds_db
lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo
ls_update_table = lds_handle.describe( "datawindow.table.update")
if lower(ls_update_table) = 'document' then
	//-- copy header --//
	if pos(vs_f_objname, 'u_pur_invoice')>0 then		//-- nhân bản --//
			select t.trans_hdr_id, t.version_id, t.branch_id , t.manage_group , t1.quantity_yn, t1.value_yn  
				into :ldb_trans_id, :ldb_f_version_id, :ldb_branch, :ldb_manage_group, :ls_qty_yn, :ls_val_yn
				from document t
				join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
				where t.company_id = :gi_user_comp_id
				and t.id =  :ldb_id
				using rt_transaction;
				if isnull(ldb_manage_group) then ldb_manage_group = 0		
				if isnull(ls_qty_yn) then ls_qty_yn = 'N'
				if isnull(ls_val_yn) then ls_val_yn = 'N'				
	else
	
		ldb_f_doc_id = ldb_id
		select count(t2.id) into :li_cnt
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
		where t.company_id = :gi_user_comp_id
	//	and t.branch_id = :gdb_branch
		and t.id =  :ldb_id
		using rt_transaction;
		if li_cnt = 1 then
			select t2.id, t.version_id, t.branch_id , t2.quantity_yn, t2.value_yn
			into :ldb_trans_id, :ldb_f_version_id, :ldb_branch , :ls_qty_yn, :ls_val_yn
			from document t
			join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
			join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
			where t.company_id = :gi_user_comp_id
	//		and t.branch_id = :gdb_branch
			and t.id =  :ldb_id
			using rt_transaction;
			if isnull(ls_qty_yn) then ls_qty_yn = 'N'
			if isnull(ls_val_yn) then ls_val_yn = 'N'		
		else
			gf_messagebox('m.b_obj_instantiate.f_copy_to_po.01','Thông báo','Chưa cài đặt giao dịch cho PO thuộc nhóm copy','stop','ok',1)
			return -1
		end if
	end if
else
	//-- copy line --//
	select object_ref_id, branch_id into :ldb_f_version_id, :ldb_branch
	from pr_line t
	where t.id = :ldb_id
//	and t.branch_id = :gdb_branch
	and  t.company_id = :gi_user_comp_id
	using rt_transaction;
	
	select count(t2.id) 
	into :li_cnt
	from document t
	join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
	join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
	where t.company_id = :gi_user_comp_id
	and t.branch_id = :ldb_branch
	and t.version_id = :ldb_f_version_id
	using rt_transaction;
	
	if li_cnt = 1 then
		select t2.id, t.id into :ldb_trans_id, :ldb_f_doc_id
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
		where t.company_id = :gi_user_comp_id
		and t.branch_id = :ldb_branch
		and t.version_id =  :ldb_f_version_id
		using rt_transaction;
	else
		gf_messagebox('m.b_obj_instantiate.f_copy_to_po.01','Thông báo','Chưa cài đặt giao dịch cho PO thuộc nhóm copy','stop','ok',1)
		return -1
	end if	
end if

//---------------------//
// insert document  //
//--------------------//
ldb_t_doc_id = this.f_create_id_ex( rt_transaction)
ldb_version_id =  this.f_create_id_ex( rt_transaction)
ls_code = rdwsetup_initial.f_get_autonumber_ex('code','d_document_ap_grid', rt_transaction)
ls_sql = "INSERT into DOCUMENT(id,company_id, branch_id,object_ref_table, created_by, created_date,last_mdf_by, last_mdf_date,"+&
									" doc_type, version_id, SOB, handled_by, CODE, document_date, TRANS_HDR_ID,status, manage_group)" +&
			" VALUES("+string(ldb_t_doc_id)+ "," + string( gi_user_comp_id ) + "," + string( ldb_branch ) + ",'BOOKED_SLIP' ," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate, " +&
						"'PUR_INVOICE',"+string(ldb_version_id) +", 'F',"+string(gi_userid) + ",'"+ls_code +"', trunc(sysdate)"+ ","+string(ldb_trans_id) +", 'new',"+string(ldb_manage_group)+ ")"
EXECUTE immediate :ls_sql using rt_transaction;



//--------------------//
// insert table  //
//--------------------//

FOR li_idx = 1 to upperbound(vstr_dwo_related[1].s_related_obj_dwo_copy[] )	
	lds_handle.dataobject = vstr_dwo_related[1].s_related_obj_dwo_copy[li_idx]
	ls_update_table = lds_handle.describe( "datawindow.table.update")	

	ls_sql = "INSERT into "+ls_update_table +"(company_id, branch_id, created_by, created_date,last_mdf_by, last_mdf_date,"				
	ls_sql_cols = vstr_dwo_related[1].s_related_obj_column_copy[li_idx]
	ls_sql_cols= trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))
	if vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
		ls_sql_cols += vstr_dwo_related[1].s_related_obj_column_chk[li_idx]
		ls_sql_cols = trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))
		lc_string.f_stringtoarray( vstr_dwo_related[1].s_related_obj_column_chk[li_idx], ';', las_initvalue_cols[])		
	end if	
	
	if right(ls_sql_cols,1) = ',' then 
		if upper(ls_update_table) = 'BOOKED_SLIP' then
			ls_sql += ls_sql_cols + "version_no,doc_type,object_ref_table, object_ref_id,ID,quantity_yn,value_yn)"
		else
			ls_sql += ls_sql_cols + "object_ref_table, object_ref_id,ID)"
		end if
	else
		if upper(ls_update_table) = 'BOOKED_SLIP' then
			ls_sql += ls_sql_cols + ",version_no,doc_type,object_ref_table, object_ref_id,ID)"
		else
			ls_sql += ls_sql_cols + ",object_ref_table, object_ref_id,ID)"
		end if
	end if
	ls_sql += " VALUES("+string( gi_user_comp_id ) + "," + string( ldb_branch ) + "," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate " 
	ls_from_cols = vstr_dwo_related[1].s_main_obj_column_copy[li_idx]
	li_colCnt = lc_string.f_stringtoarray( ls_from_cols, ';', las_from_cols[])
	//-- lấy mat cols--//
	if vstr_dwo_related[1].s_match_f_dwo[li_idx] = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
		ls_from_match_cols = vstr_dwo_related[1].s_match_f_column[li_idx]
		if pos(ls_from_match_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_from_match_cols , ';', las_from_match_cols[])
			ls_from_match_cols = las_from_match_cols[1]
		end if
		ls_mat_cols = vstr_dwo_related[1].s_match_column[li_idx]
		if pos(ls_mat_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_mat_cols , ';', las_mat_cols[])
			ls_mat_cols = las_mat_cols[1]
		end if			
	end if
//	//-- lấy chk cols for update destination--//
//	if  vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
//		ls_related_chk_cols = vstr_dwo_related[1].s_related_obj_column_chk[li_idx]
//		lc_string.f_stringtoarray( ls_related_chk_cols, ';', las_related_chk_cols[])
//	end if
	//-- lấy chk cols source--//
	if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
		ls_main_chk_cols = vstr_dwo_related[1].s_main_obj_column_chk[li_idx]
		lc_string.f_stringtoarray( ls_main_chk_cols, ';', las_main_chk_cols[] )
	end if
	
	FOR li_idx1 = 1 to upperbound(vads_copied[])
		if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
			lb_found = true
			lb_update_orders = false
			FOR li_row = 1 to vads_copied[li_idx1].rowcount()
				//-- check match full--//
				if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_mat_val = vads_copied[li_idx1].getitemnumber(li_row, ls_from_match_cols)
					if isnull(ldb_mat_val) then ldb_mat_val = 0
					ldb_f_ref_id = vads_copied[li_idx1].getitemnumber(li_row, 'id')
					ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
					if isnull(ldb_matched_val) then ldb_matched_val = 0
					if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết--//
					if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
						 if isnull(vads_copied[li_idx1].getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
					end if								
				end if //-- kết thúc: check match full--//
				//-- check common values --//
				if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
					lb_update_orders = true
					for li_idx2 = 1 to upperbound(las_main_chk_cols[])
						if li_row = 1 then
							laa_chk_data[li_idx2] = vads_copied[li_idx1].f_getitemany(li_row, las_main_chk_cols[li_idx2])
						end if
					next					
				end if
				//-- insert--//
				ldb_id = this.f_create_id_ex( rt_transaction)
				FOR li_colnbr= 1 to li_colCnt
					ls_coltype = vads_copied[li_idx1].describe(las_from_cols[li_colnbr]+".coltype")
					if left(ls_coltype, 5) = 'numbe' then
						if las_from_cols[li_colnbr] = ls_from_match_cols then
							ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
						else
							if isnull(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr])) then
								ls_sql_values +=",NULL"
							else	
								ls_sql_values += "," + string(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr]))
							end if
						end if
					elseif left(ls_coltype, 5) = 'char(' then
						if isnull(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else						
							ls_sql_values += ",'" + string(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
						end if
					elseif  left(ls_coltype, 5) = 'datet' then
						if isnull(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else	
							ls_sql_values += ",to_date('" + string(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
						end if
					end if
				NEXT
				//-- default values --//		
				if upperbound(las_initvalue_cols[]) > 0 and vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> ''  then
					FOR li_colnbr = 1 to upperbound(las_initvalue_cols[])
						if las_initvalue_cols[li_colnbr] = 'trans_date'  then
							ls_sql_values += ",to_date('" + string(gd_session_date ,gs_w_date_format )+"','"+gs_w_date_format+"')"
						else
							lc_dwsetup_initial.f_init_ids_setup_dw_ex( ldb_branch , 'u_detail_pur_invoice', rt_transaction)
							lc_dwsetup_initial.f_get_initvalue('d_pur_invoice_line_grid',las_initvalue_cols[li_colnbr],ldb_branch ,la_initvalue )	
							ls_sql_values += "," + string(la_initvalue)
						end if
					NEXT
				end if
				//-values khác--//
				if upper(ls_update_table) = 'BOOKED_SLIP' then
					ls_sql_values += ",1,'PUR_INVOICE','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) +",'"+ls_qty_yn+"','"+ls_val_yn + "')"
				else
					ls_sql_values += ",'BOOKED_SLIP',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
				end if				
				ls_sql_exec = ls_sql + ls_sql_values
				EXECUTE immediate :ls_sql_exec using rt_transaction;				
				ls_sql_values =''
				//-- update matching --//
				if pos(vs_f_objname, 'u_pur_invoice') = 0 then
					if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
						ldb_f_branch_id =vads_copied[li_idx1].getitemnumber(li_row, 'branch_id')
						ls_f_ref_table = upper(vads_copied[li_idx1].describe( "datawindow.table.update"))
						ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
											"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
											"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE,"+ls_mat_cols+")" +&
								" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
								","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+string(ldb_f_doc_id) +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
								",'"+ls_f_ref_table+"','COPY','"+ ls_update_table +"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
											
						EXECUTE immediate :ls_sql_exec using rt_transaction;
						lb_copied = true
					end if
				else
					lb_copied = true
				end if
			NEXT
			exit //-- chỉ có 1 dw source -> 1 dw dest --//
		end if		
	NEXT
	//-- ko có datastore dữ iệu copy--//		
	if not lb_found then 
		lb_update_orders = false
		lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] 
		ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))
		laa_value[1] = ldb_f_version_id
		if ls_f_ref_table = 'BOOKED_SLIP' or  ls_f_ref_table = 'ORDERS' then
			lds_handle.f_add_where( "id", laa_value[])
		else
			lds_handle.f_add_where( "object_ref_id", laa_value[])
		end if
		lds_handle.settransobject( rt_transaction)
		lds_handle.retrieve( )
		FOR li_row = 1 to lds_handle.rowcount()
			//-- check match full--//
			if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
				ldb_mat_val = lds_handle.getitemnumber(li_row, ls_from_match_cols)
				if isnull(ldb_mat_val) then ldb_mat_val = 0
				ldb_f_ref_id = lds_handle.getitemnumber(li_row, 'id')
				ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
				if isnull(ldb_matched_val) then ldb_matched_val = 0
				if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết --//
				if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
					 if isnull(lds_handle.getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
				end if				
			end if //-- kết thúc: check match full--//			
			//-- check common values --//
			if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
				lb_update_orders = true
				for li_idx2 = 1 to upperbound(las_main_chk_cols[])
					if li_row = 1 then
						laa_chk_data[li_idx2] = lds_handle.f_getitemany(li_row, las_main_chk_cols[li_idx2])
					end if
				next					
			end if			
			//-- insert--//
			ldb_id = this.f_create_id_ex( rt_transaction)			
			FOR li_colnbr= 1 to li_colCnt
				ls_coltype = lds_handle.describe(las_from_cols[li_colnbr]+".coltype")
				if left(ls_coltype, 5) = 'numbe' then
					if las_from_cols[li_colnbr] = ls_from_match_cols then
						ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
					else
						if isnull(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else
							ls_sql_values += "," + string(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr]))
						end if
					end if
				elseif left(ls_coltype, 5) = 'char(' then
					if isnull(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",'" + string(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
					end if
				elseif  left(ls_coltype, 5) = 'datet' then
					if isnull(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",to_date('" + string(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
					end if
				else
					ls_sql_values += ",'" + las_from_cols[li_colnbr] +"'"
				end if				
			NEXT
			//-- default values --//		
			if upperbound(las_initvalue_cols[]) > 0 and vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> ''  then
				FOR li_colnbr = 1 to upperbound(las_initvalue_cols[])
					if las_initvalue_cols[li_colnbr] = 'trans_date'  then
						ls_sql_values += ",to_date('" + string(gd_session_date ,gs_w_date_format )+"','"+gs_w_date_format+"')"
					else
						lc_dwsetup_initial.f_init_ids_setup_dw_ex( ldb_branch , 'u_detail_pur_invoice', rt_transaction)
						lc_dwsetup_initial.f_get_initvalue('d_pur_invoice_line_grid',las_initvalue_cols[li_colnbr],ldb_branch ,la_initvalue )	
						ls_sql_values += "," + string(la_initvalue)
					end if
				NEXT
			end if
			//-values khác--//			
			if upper(ls_update_table) = 'BOOKED_SLIP' then
				ls_sql_values += ",1,'PUR_INVOICE','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) + ",'"+ls_qty_yn+"','"+ls_val_yn + "')"
			else
				ls_sql_values += ",'BOOKED_SLIP',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
			end if				
			ls_sql_exec = ls_sql + ls_sql_values
			EXECUTE immediate :ls_sql_exec using rt_transaction;			
			ls_sql_values =''			
			//-- update matching --//
			if pos(vs_f_objname, 'u_pur_invoice') = 0  then
				if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_f_branch_id =lds_handle.getitemnumber(li_row, 'branch_id')
					ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))
					ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
										"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
										"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE ,"+ls_mat_cols+")" +&
							" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
							","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+string(ldb_f_doc_id) +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
							",'"+ls_f_ref_table+"','COPY','"+ ls_update_table+"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
										
					EXECUTE immediate :ls_sql_exec using rt_transaction;			
					lb_copied = true
				end if
			else
				lb_copied = true
			end if
		NEXT				

	end if //--kết thúc: ko có datastore dữ iệu copy--//	
NEXT
destroy lds_handle
if lb_copied then
	commit using rt_transaction;
else
	rollback using rt_transaction;
	gf_messagebox('m.b_obj_instantiate.f_copy_to_po.02','Thông báo','Phiếu đã kết hết','stop','ok',1)
	return 0
end if

return ldb_t_doc_id
end function

public function double f_copy_to_payment (string vs_f_objname, s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial);string				ls_sql, ls_code, ls_currCode, ls_currName, ls_sql_cols, ls_update_table, ls_related_data, las_related_data[], ls_f_ref_table
string				ls_main_chk_cols, las_main_chk_cols[], ls_related_chk_cols, las_related_chk_cols[], ls_data_tmp, las_initvalue_cols[], ls_qty_yn, ls_val_yn
string				las_from_cols[], ls_from_cols, ls_sql_values, ls_coltype, ls_sql_exec, ls_from_match_cols, las_from_match_cols[], ls_mat_cols, las_mat_cols[]
double			ldb_id,ldb_f_doc_id, ldb_t_doc_id, ldb_version_id, ldb_trans_id, ldb_base_currID, ldb_mat_val, ldb_matched_val, ldb_f_ref_id, ldb_f_branch_id
double			ldb_f_version_id, ldb_branch, ldb_manage_group
int					li_idx, li_idx1, li_idx2, li_row, li_colnbr, li_colCnt, li_pos, li_cnt
boolean			lb_found, lb_copied, lb_update_orders
any				laa_value[], laa_chk_data[], la_initvalue
t_ds_db				lds_handle
c_string				lc_string
c_unit_instance 	lc_unit_ins
c_dwsetup_initial	lc_dwsetup_initial

//--------------------------//
// lấy giao dịch của PO //
//-------------------------//
li_pos =  pos( vstr_dwo_related[1].s_data[1] , "(" )
if li_pos > 0 then
	ls_related_data = mid(vstr_dwo_related[1].s_data[1], li_pos +1, pos(vstr_dwo_related[1].s_data[1] , ')') - (li_pos +1) )
	li_cnt = lc_string.f_Stringtoarray( ls_related_data, ',', las_related_data[])
else
	las_related_data[1] = vstr_dwo_related[1].s_data[1]
end if
ldb_id = double(las_related_data[1] )

lds_handle = create t_ds_db
lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo
ls_update_table = lds_handle.describe( "datawindow.table.update")
if lower(ls_update_table) = 'document' then
	//-- copy header --//
	if pos(vs_f_objname, 'u_payment')>0 then		//-- nhân bản --//
			select t.trans_hdr_id, t.version_id, t.branch_id , t.manage_group , t1.quantity_yn, t1.value_yn  
				into :ldb_trans_id, :ldb_f_version_id, :ldb_branch, :ldb_manage_group, :ls_qty_yn, :ls_val_yn
				from document t
				join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
				where t.company_id = :gi_user_comp_id
				and t.id =  :ldb_id
				using rt_transaction;
				if isnull(ldb_manage_group) then ldb_manage_group = 0			
				if isnull(ls_qty_yn) then ls_qty_yn = 'N'
				if isnull(ls_val_yn) then ls_val_yn = 'N'
	else
	
		ldb_f_doc_id = ldb_id
		select count(t2.id) into :li_cnt
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PAYMENT'
		where t.company_id = :gi_user_comp_id
	//	and t.branch_id = :gdb_branch
		and t.id =  :ldb_id
		using rt_transaction;
		if li_cnt = 1 then
			select t2.id, t.version_id, t.branch_id , t2.quantity_yn, t2.value_yn
			into :ldb_trans_id, :ldb_f_version_id, :ldb_branch , :ls_qty_yn, :ls_val_yn
			from document t
			join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
			join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PAYMENT'
			where t.company_id = :gi_user_comp_id
	//		and t.branch_id = :gdb_branch
			and t.id =  :ldb_id
			using rt_transaction;
			if isnull(ls_qty_yn) then ls_qty_yn = 'N'
			if isnull(ls_val_yn) then ls_val_yn = 'N'		
		else
			gf_messagebox('m.b_obj_instantiate.f_copy_to_po.01','Thông báo','Chưa cài đặt giao dịch cho phiếu chi thuộc nhóm copy','stop','ok',1)
			return -1
		end if
	end if
else
	//-- copy line --//
	select object_ref_id, branch_id into :ldb_f_version_id, :ldb_branch
	from pr_line t
	where t.id = :ldb_id
//	and t.branch_id = :gdb_branch
	and  t.company_id = :gi_user_comp_id
	using rt_transaction;
	
	select count(t2.id) 
	into :li_cnt
	from document t
	join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
	join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
	where t.company_id = :gi_user_comp_id
	and t.branch_id = :ldb_branch
	and t.version_id = :ldb_f_version_id
	using rt_transaction;
	
	if li_cnt = 1 then
		select t2.id, t.id into :ldb_trans_id, :ldb_f_doc_id
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
		where t.company_id = :gi_user_comp_id
		and t.branch_id = :ldb_branch
		and t.version_id =  :ldb_f_version_id
		using rt_transaction;
	else
		gf_messagebox('m.b_obj_instantiate.f_copy_to_po.01','Thông báo','Chưa cài đặt giao dịch cho PO thuộc nhóm copy','stop','ok',1)
		return -1
	end if	
end if

//---------------------//
// insert document  //
//--------------------//
ldb_t_doc_id = this.f_create_id_ex( rt_transaction)
ldb_version_id =  this.f_create_id_ex( rt_transaction)
ls_code = rdwsetup_initial.f_get_autonumber_ex('code','d_document_payment_grid', rt_transaction)
ls_sql = "INSERT into DOCUMENT(id,company_id, branch_id,object_ref_table, created_by, created_date,last_mdf_by, last_mdf_date,"+&
									" doc_type, version_id, SOB, handled_by, CODE, document_date, TRANS_HDR_ID,status, manage_group)" +&
			" VALUES("+string(ldb_t_doc_id)+ "," + string( gi_user_comp_id ) + "," + string( ldb_branch ) + ",'BOOKED_SLIP' ," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate, " +&
						"'PAYMENT',"+string(ldb_version_id) +", 'F',"+string(gi_userid) + ",'"+ls_code +"', trunc(sysdate)"+ ","+string(ldb_trans_id) +", 'new',"+string(ldb_manage_group)+ ")"
EXECUTE immediate :ls_sql using rt_transaction;



//--------------------//
// insert table  //
//--------------------//

FOR li_idx = 1 to upperbound(vstr_dwo_related[1].s_related_obj_dwo_copy[] )	
	lb_found = false
	lds_handle.dataobject = vstr_dwo_related[1].s_related_obj_dwo_copy[li_idx]
	ls_update_table = lds_handle.describe( "datawindow.table.update")	
	if ls_update_table = 'DOCUMENT' then ls_update_table = 'BOOKED_SLIP'
	
	ls_sql = "INSERT into "+ls_update_table +"(company_id, branch_id, created_by, created_date,last_mdf_by, last_mdf_date,"				
	ls_sql_cols = vstr_dwo_related[1].s_related_obj_column_copy[li_idx]
	ls_sql_cols= trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))
	if vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
		ls_sql_cols += vstr_dwo_related[1].s_related_obj_column_chk[li_idx]
		ls_sql_cols = trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))
		lc_string.f_stringtoarray( vstr_dwo_related[1].s_related_obj_column_chk[li_idx], ';', las_initvalue_cols[])		
	end if	
	
	if right(ls_sql_cols,1) = ',' then 
		if upper(ls_update_table) = 'BOOKED_SLIP' then
			ls_sql += ls_sql_cols + "version_no,doc_type,object_ref_table, object_ref_id,ID,quantity_yn,value_yn)"
		else
			ls_sql += ls_sql_cols + "object_ref_table, object_ref_id,ID)"
		end if
	else
		if upper(ls_update_table) = 'BOOKED_SLIP' then
			ls_sql += ls_sql_cols + ",version_no,doc_type,object_ref_table, object_ref_id,ID,quantity_yn,value_yn)"
		else
			ls_sql += ls_sql_cols + ",object_ref_table, object_ref_id,ID)"
		end if
	end if
	ls_sql += " VALUES("+string( gi_user_comp_id ) + "," + string( ldb_branch ) + "," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate " 
	ls_from_cols = vstr_dwo_related[1].s_main_obj_column_copy[li_idx]
	li_colCnt = lc_string.f_stringtoarray( ls_from_cols, ';', las_from_cols[])
	//-- lấy mat cols--//
	if vstr_dwo_related[1].s_match_f_dwo[li_idx] = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
		ls_from_match_cols = vstr_dwo_related[1].s_match_f_column[li_idx]
		if pos(ls_from_match_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_from_match_cols , ';', las_from_match_cols[])
			ls_from_match_cols = las_from_match_cols[1]
		end if
		ls_mat_cols = vstr_dwo_related[1].s_match_column[li_idx]
		if pos(ls_mat_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_mat_cols , ';', las_mat_cols[])
			ls_mat_cols = las_mat_cols[1]
		end if			
	end if
//	//-- lấy chk cols for update destination--//
//	if  vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
//		ls_related_chk_cols = vstr_dwo_related[1].s_related_obj_column_chk[li_idx]
//		lc_string.f_stringtoarray( ls_related_chk_cols, ';', las_related_chk_cols[])
//	end if
	//-- lấy chk cols source--//
	if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
		ls_main_chk_cols = vstr_dwo_related[1].s_main_obj_column_chk[li_idx]
		lc_string.f_stringtoarray( ls_main_chk_cols, ';', las_main_chk_cols[] )
	end if
	
	FOR li_idx1 = 1 to upperbound(vads_copied[])
		if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
			lb_found = true
			lb_update_orders = false
			FOR li_row = 1 to vads_copied[li_idx1].rowcount()
				//-- check match full--//
				if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_mat_val = vads_copied[li_idx1].getitemnumber(li_row, ls_from_match_cols)
					if isnull(ldb_mat_val) then ldb_mat_val = 0
					ldb_f_ref_id = vads_copied[li_idx1].getitemnumber(li_row, 'id')
					ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
					if isnull(ldb_matched_val) then ldb_matched_val = 0
					if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết--//
					if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
						 if isnull(vads_copied[li_idx1].getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
					end if								
				end if //-- kết thúc: check match full--//
				//-- check common values --//
				if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
					lb_update_orders = true
					for li_idx2 = 1 to upperbound(las_main_chk_cols[])
						if li_row = 1 then
							laa_chk_data[li_idx2] = vads_copied[li_idx1].f_getitemany(li_row, las_main_chk_cols[li_idx2])
						end if
					next					
				end if
				//-- insert--//
				ldb_id = this.f_create_id_ex( rt_transaction)
				FOR li_colnbr= 1 to li_colCnt
					ls_coltype = vads_copied[li_idx1].describe(las_from_cols[li_colnbr]+".coltype")
					if left(ls_coltype, 5) = 'numbe' then
						if las_from_cols[li_colnbr] = ls_from_match_cols then
							ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
						else
							if isnull(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr])) then
								ls_sql_values +=",NULL"
							else	
								ls_sql_values += "," + string(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr]))
							end if
						end if
					elseif left(ls_coltype, 5) = 'char(' then
						if isnull(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else						
							ls_sql_values += ",'" + string(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
						end if
					elseif  left(ls_coltype, 5) = 'datet' then
						if isnull(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else	
							ls_sql_values += ",to_date('" + string(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
						end if
					end if
				NEXT
				//-- default values --//		
				if upperbound(las_initvalue_cols[]) > 0 and vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
					FOR li_colnbr = 1 to upperbound(las_initvalue_cols[])
						if las_initvalue_cols[li_colnbr] = 'trans_date'  then
							ls_sql_values += ",to_date('" + string(gd_session_date ,gs_w_date_format )+"','"+gs_w_date_format+"')"
						else
							lc_dwsetup_initial.f_init_ids_setup_dw_ex( ldb_branch , 'U_PAYMENT', rt_transaction)
							lc_dwsetup_initial.f_get_initvalue(vstr_dwo_related[1].s_related_obj_dwo_copy[li_idx] ,las_initvalue_cols[li_colnbr],ldb_branch ,la_initvalue )	
							ls_sql_values += "," + string(la_initvalue)
						end if
					NEXT
				end if
				//-values khác--//
				if upper(ls_update_table) = 'BOOKED_SLIP' then
					ls_sql_values += ",1,'PAYMENT','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) +",'"+ls_qty_yn+"','"+ls_val_yn + "')"
				else
					ls_sql_values += ",'BOOKED_SLIP',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
				end if				
				ls_sql_exec = ls_sql + ls_sql_values
				EXECUTE immediate :ls_sql_exec using rt_transaction;				
				ls_sql_values =''
				//-- update matching --//
				if pos(vs_f_objname, 'u_payment') = 0 then
					if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
						ldb_f_branch_id =vads_copied[li_idx1].getitemnumber(li_row, 'branch_id')
						ls_f_ref_table = upper(vads_copied[li_idx1].describe( "datawindow.table.update"))
						ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
											"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
											"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE,"+ls_mat_cols+")" +&
								" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
								","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+string(ldb_f_doc_id) +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
								",'"+ls_f_ref_table+"','COPY','"+ ls_update_table +"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
											
						EXECUTE immediate :ls_sql_exec using rt_transaction;
						lb_copied = true
					end if
				else
					lb_copied = true
				end if
			NEXT
			exit //-- chỉ có 1 dw source -> 1 dw dest --//
		end if		
	NEXT
	//-- ko có datastore dữ iệu copy--//		
	if not lb_found then 
		lb_update_orders = false
		lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] 
		ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))
		laa_value[1] = ldb_f_version_id
		if ls_f_ref_table = 'BOOKED_SLIP' or  ls_f_ref_table = 'ORDERS' then
			lds_handle.f_add_where( "id", laa_value[])
		elseif ls_f_ref_table = 'DOCUMENT' then
			lds_handle.f_add_where( "version_id", laa_value[])
		else
			lds_handle.f_add_where( "object_ref_id", laa_value[])
		end if
		lds_handle.settransobject( rt_transaction)
		lds_handle.retrieve( )
		FOR li_row = 1 to lds_handle.rowcount()
			//-- check match full--//
			if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
				ldb_mat_val = lds_handle.getitemnumber(li_row, ls_from_match_cols)
				if isnull(ldb_mat_val) then ldb_mat_val = 0
				ldb_f_ref_id = lds_handle.getitemnumber(li_row, 'id')
				ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
				if isnull(ldb_matched_val) then ldb_matched_val = 0
				if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết --//
				if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
					 if isnull(lds_handle.getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
				end if				
			end if //-- kết thúc: check match full--//			
			//-- check common values --//
			if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
				lb_update_orders = true
				for li_idx2 = 1 to upperbound(las_main_chk_cols[])
					if li_row = 1 then
						laa_chk_data[li_idx2] = lds_handle.f_getitemany(li_row, las_main_chk_cols[li_idx2])
					end if
				next					
			end if			
			//-- insert--//
			ldb_id = this.f_create_id_ex( rt_transaction)			
			FOR li_colnbr= 1 to li_colCnt
				ls_coltype = lds_handle.describe(las_from_cols[li_colnbr]+".coltype")
				if left(ls_coltype, 5) = 'numbe' then
					if las_from_cols[li_colnbr] = ls_from_match_cols then
						ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
					else
						if isnull(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else
							ls_sql_values += "," + string(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr]))
						end if
					end if
				elseif left(ls_coltype, 5) = 'char(' then
					if isnull(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",'" + string(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
					end if
				elseif  left(ls_coltype, 5) = 'datet' then
					if isnull(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",to_date('" + string(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
					end if
				else
					ls_sql_values += ",'" + las_from_cols[li_colnbr] +"'"
				end if				
			NEXT
			//-- default values --//		
			if upperbound(las_initvalue_cols[]) > 0 and vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
				FOR li_colnbr = 1 to upperbound(las_initvalue_cols[])
					if las_initvalue_cols[li_colnbr] = 'trans_date'  then
						ls_sql_values += ",to_date('" + string(gd_session_date ,gs_w_date_format )+"','"+gs_w_date_format+"')"
					else
						lc_dwsetup_initial.f_init_ids_setup_dw_ex( ldb_branch , 'u_detail_pur_invoice', rt_transaction)
						lc_dwsetup_initial.f_get_initvalue('d_pur_invoice_line_grid',las_initvalue_cols[li_colnbr],ldb_branch ,la_initvalue )	
						ls_sql_values += "," + string(la_initvalue)
					end if
				NEXT
			end if
			//-values khác--//			
			if upper(ls_update_table) = 'BOOKED_SLIP' then
				ls_sql_values += ",1,'PAYMENT','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) + ",'"+ls_qty_yn+"','"+ls_val_yn + "')"
			else
				ls_sql_values += ",'BOOKED_SLIP',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
			end if				
			ls_sql_exec = ls_sql + ls_sql_values
			EXECUTE immediate :ls_sql_exec using rt_transaction;			
			ls_sql_values =''			
			//-- update matching --//
			if pos(vs_f_objname, 'u_payment') = 0  then
				if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_f_branch_id =lds_handle.getitemnumber(li_row, 'branch_id')
					ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))
					ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
										"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
										"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE ,"+ls_mat_cols+")" +&
							" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
							","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+string(ldb_f_doc_id) +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
							",'"+ls_f_ref_table+"','COPY','"+ ls_update_table+"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
										
					EXECUTE immediate :ls_sql_exec using rt_transaction;			
					lb_copied = true
				end if
			else
				lb_copied = true
			end if
		NEXT				

	end if //--kết thúc: ko có datastore dữ iệu copy--//	
NEXT
destroy lds_handle
if lb_copied then
	commit using rt_transaction;
else
	rollback using rt_transaction;
	gf_messagebox('m.b_obj_instantiate.f_copy_to_po.02','Thông báo','Phiếu đã kết hết','stop','ok',1)
	return 0
end if

return ldb_t_doc_id
end function

public function integer f_upd_related_status_1_1 (double vdb_t_doc_id, string vs_f_upd_status, t_transaction rt_transaction);/*//////////////////////////////////////////////////////
- Luôn cập nhật trạng thái cùa Doc liền kề 
- Chỉ cập nhật trạng thai của DOC liên quan cấp 2, 3,... khi thoả mãn điều kiện quan lệ 1-1
=====================================*/
int			li_cnt, li_row, li_next_cnt, li_cnt2, li_row2,li_cnt3, li_row3
double	ldb_related_doc_id, ldb_f_doc_id
string		ls_related_doc_type, ls_related_status, ls_f_upd_status


ls_f_upd_status = vs_f_upd_status
ldb_related_doc_id = vdb_t_doc_id

////////////////////////////////////////////
// Kiểm tra doc liên quan cấp 2 //
///////////////////////////////////////////
select count(f_doc_id) into :li_next_cnt
from matching where t_doc_id = :ldb_related_doc_id
using rt_transaction;

if li_next_cnt = 1 then 		
	//-- check chiều ngược lại cũng là 1-1--//
	select m.f_doc_id, d.doc_type into :ldb_f_doc_id , :ls_related_doc_type
	from matching m
	join document d on d.id= m.f_doc_id
	 where m.t_doc_id = :ldb_related_doc_id
	using rt_transaction;	
	
	select count(t_doc_id) into :li_next_cnt
	from matching where f_doc_id = :ldb_f_doc_id
	using rt_transaction;		
	if li_next_cnt = 1 then //-- thoả đk quan hệ 1-1: cập nhật status --//
//		ls_related_doc_type = lds_relaled_doc.getitemstring( li_row, 'related_doc_type')
		select t1.RELATED_FULL_STATUS into :ls_related_status
		from doc_status t 
		join doc_related_status t1 on t1.object_ref_id = t.id
		where t.doc_type = :ls_related_doc_type and t.doc_status = :ls_f_upd_status
		using rt_transaction;
		
		////////////////////////////////////////////
		// Update status doc liên quan câp 2 //
		///////////////////////////////////////////	
		//-- đảo biến --//
		ls_f_upd_status = ls_related_status					
		UPDATE document set status = :ls_f_upd_status where id = :ldb_f_doc_id using rt_transaction;
		
		////////////////////////////////////////////
		// Kiểm tra doc liên quan cấp 3 //
		///////////////////////////////////////////			
		//-- đảo biến --//
		ldb_related_doc_id = ldb_f_doc_id
		return this.f_upd_related_status_1_1(ldb_related_doc_id, ls_f_upd_status, rt_transaction)
	else
		return 0
	end if
else
	return 0
end if
return 1
end function

public function integer f_upd_related_status (double vdb_t_doc_id, string vs_t_upd_status, t_transaction rt_transaction);/*//////////////////////////////////////////////////////
- Luôn cập nhật trạng thái cùa Doc liền kề 
- Chỉ cập nhật trạng thai của DOC liên quan cấp 2, 3,... khi thoả mãn điều kiện quan lệ 1-1
=====================================*/
int			li_cnt, li_row, li_next_cnt, li_cnt2, li_row2,li_cnt3, li_row3
double	ldb_related_doc_id, ldb_f_doc_id
string		ls_related_doc_type, ls_related_status, ls_f_upd_status
t_ds_db		lds_relaled_doc


ls_f_upd_status = vs_t_upd_status
//-- Lấy f_doc_id cần update --//
lds_relaled_doc = create t_ds_db
lds_relaled_doc.dataobject = 'ds_related_doc'
lds_relaled_doc.f_settransobject(rt_transaction )

li_cnt = lds_relaled_doc.retrieve(vdb_t_doc_id )
FOR li_row = 1 to li_cnt
	///////////////////////////////////
	// Update status doc liền kề //
	//////////////////////////////////
	//-- kiểm tra doc liền kề đã kết hết chưa --//
	ldb_related_doc_id = lds_relaled_doc.getitemnumber( li_row, 'related_doc_id')
	
	
	//-- lấy status tương ứng --//
	UPDATE document set status = :ls_f_upd_status where id = :ldb_related_doc_id using rt_transaction;
	
	////////////////////////////////////////////
	// Kiểm tra doc liên quan cấp 2 //
	///////////////////////////////////////////
	select count(f_doc_id) into :li_next_cnt
	from matching where t_doc_id = :ldb_related_doc_id
	using rt_transaction;
	
	if li_next_cnt = 1 then 		
		//-- check chiều ngược lại cũng là 1-1--//
		select f_doc_id into :ldb_f_doc_id
		from matching where t_doc_id = :ldb_related_doc_id
		using rt_transaction;	
		
		select count(t_doc_id) into :li_next_cnt
		from matching where f_doc_id = :ldb_f_doc_id
		using rt_transaction;		
		if li_next_cnt = 1 then //-- thoả đk quan hệ 1-1: cập nhật status --//
			ls_related_doc_type = lds_relaled_doc.getitemstring( li_row, 'related_doc_type')
			select t1.RELATED_FULL_STATUS into :ls_related_status
			from doc_status t 
			join doc_related_status t1 on t1.object_ref_id = t.id
			where t.doc_type = :ls_related_doc_type and t.doc_status = :ls_f_upd_status
			using rt_transaction;
			
			////////////////////////////////////////////
			// Update status doc liên quan câp 2 //
			///////////////////////////////////////////	
			//-- đảo biến --//
			ls_f_upd_status = ls_related_status					
			UPDATE document set status = :ls_f_upd_status where id = :ldb_f_doc_id using rt_transaction;
			
			////////////////////////////////////////////
			// Kiểm tra doc liên quan cấp 3 //
			///////////////////////////////////////////			
			//-- đảo biến --//
			ldb_related_doc_id = ldb_f_doc_id
			//-- lấy status (tiếp theo) cần update --//
			select count(f_doc_id) into :li_next_cnt
			from matching where t_doc_id = :ldb_related_doc_id
			using rt_transaction;
			
			if li_next_cnt = 1 then //-- related 1-1: tiếp tục cập nhật status --//		
				//-- check chiều ngược lại cũng là 1-1--//
				select f_doc_id into :ldb_f_doc_id
				from matching where t_doc_id = :ldb_related_doc_id
				using rt_transaction;	
				
				select count(t_doc_id) into :li_next_cnt
				from matching where f_doc_id = :ldb_f_doc_id
				using rt_transaction;				
				if li_next_cnt = 1 then  //-- thoả đk quan hệ 1-1: cập nhật status --//
					ls_related_doc_type = lds_relaled_doc.getitemstring( li_row, 'related_doc_type')
					select t1.RELATED_FULL_STATUS into :ls_related_status
					from doc_status t 
					join doc_related_status t1 on t1.object_ref_id = t.id
					where t.doc_type = :ls_related_doc_type and t.doc_status = :ls_f_upd_status
					using rt_transaction;
					
					////////////////////////////////////////////
					// Update status doc liên quan câp 3 //
					///////////////////////////////////////////	
					//-- đảo biến --//
					ls_f_upd_status = ls_related_status					
					UPDATE document set status = :ls_f_upd_status where id = :ldb_f_doc_id using rt_transaction;										
					/////////////////////////////////////////////////////
					// Kiểm tra doc liên quan cấp 4: gọi truy hồi //
					///////////////////////////////////////////	/////////		
					//-- đảo biến --//
					ldb_related_doc_id = ldb_f_doc_id
				else
					continue 
				end if
			else
				continue 
			end if
		else
			continue
		end if
	else
		continue 
	end if

NEXT
commit using rt_transaction;
destroy lds_relaled_doc
return li_cnt
end function

public function string f_get_doc_type_ex (double vdb_doc_id, ref t_transaction rt_transaction);string			ls_data

select doc_type into :ls_data
	from document 
		where id = :vdb_doc_id 
		and company_id = :gi_user_comp_id 
//		and branch_id = :gdb_branch 
		and sob = :gs_sob using rt_transaction;
		
if rt_transaction.sqlcode = 0 then
	return ls_data
else 
	return ''
end if
end function

public function integer f_upd_related_status (double vdb_t_doc_id, string vs_t_upd_status, string vs_t_ref_table, ref t_transaction rt_transaction);/*//////////////////////////////////////////////////////
- Luôn cập nhật trạng thái cùa Doc liền kề 
- Chỉ cập nhật trạng thai của DOC liên quan cấp 2, 3,... khi thoả mãn điều kiện quan lệ 1-1
=====================================*/
int			li_cnt, li_row, li_next_cnt, li_cnt2, li_row2,li_cnt3, li_row3
double	ldb_related_doc_id, ldb_f_doc_id
string		ls_related_doc_type, ls_related_status, ls_t_upd_status, ls_t_doctype, ls_t_ref_table
t_ds_db		lds_relaled_doc

 
ls_t_upd_status = vs_t_upd_status
ls_t_doctype = this.f_get_doc_type_ex( vdb_t_doc_id, rt_transaction)

//-- Lấy f_doc_id cần update --//
lds_relaled_doc = create t_ds_db
lds_relaled_doc.dataobject = 'ds_related_doc'
lds_relaled_doc.f_settransobject(rt_transaction )

li_cnt = lds_relaled_doc.retrieve(vdb_t_doc_id )

FOR li_row = 1 to li_cnt
	///////////////////////////////////
	// Update status doc liền kề //
	//////////////////////////////////
	//-- kiểm tra doc liền kề đã kết hết chưa --//
	ldb_related_doc_id = lds_relaled_doc.getitemnumber( li_row, 'related_doc_id')
	ls_related_doc_type = lds_relaled_doc.getitemstring( li_row, 'related_doc_type')
	choose case upper(ls_related_doc_type)+';'+upper(vs_t_ref_table)
		case 'PUR_INVOICE;PAYMENT_LINE'
			select count(d.id) into :li_next_cnt
				from v_pur_inv_amount d
				left join v_f_matching_line m on m.f_ref_id = d.id 
													and upper(m.T_REF_TABLE) = 'PAYMENT_LINE'	
													and m.f_doc_id = d.id 													
				where d.id = :ldb_related_doc_id
				and coalesce(m.mat_value,0) < d.amount
				using rt_transaction;	
		case 'SO;INVENTORY_LINE'
			select count(d.id) into :li_next_cnt
				from so_line d
				join document doc on doc.version_id = d.object_ref_id
				left join v_f_matching_line m on m.f_ref_id = d.id 
													and upper(m.T_REF_TABLE) = 'INVENTORY_LINE'	
													and m.f_doc_id = doc.id 													
				where doc.id = :ldb_related_doc_id
				and coalesce(m.mat_qty,0) < d.qty
				using rt_transaction;				
		CASE 'QT;SO_LINE'
			select count(d.id) into :li_next_cnt
				from qt_line d
				join document doc on doc.version_id = d.object_ref_id
				left join v_f_matching_line m on m.f_ref_id = d.id 
													and upper(m.T_REF_TABLE) = 'SO_LINE'	
													and m.f_doc_id = doc.id 													
				where doc.id = :ldb_related_doc_id			
				and coalesce(m.mat_qty,0) < d.qty
				using rt_transaction;					
		case 'PO;INVENTORY_LINE'
			select count(d.id) into :li_next_cnt
				from po_line d
				join document doc on doc.version_id = d.object_ref_id
				left join v_f_matching_line m on m.f_ref_id = d.id 
													and upper(m.T_REF_TABLE) = 'INVENTORY_LINE'	
													and m.f_doc_id = doc.id 
				where doc.id = :ldb_related_doc_id
				and coalesce(m.mat_qty,0) < d.qty
				using rt_transaction;						
		case 'PO;SO_LINE'
			select count(d.id) into :li_next_cnt
				from po_line d
				join document doc on doc.version_id = d.object_ref_id
				left join v_f_matching_line m on m.f_ref_id = d.id 
													and upper(m.T_REF_TABLE) = 'SO_LINE'	
													and m.f_doc_id = doc.id 													
				where doc.id = :ldb_related_doc_id				
				and coalesce(m.mat_qty,0) < d.qty
				using rt_transaction;					
		case else
			continue				
	end choose
	
	if li_next_cnt = 0 then  //-- kết hết --//	
		//-- lấy trạng thái full --//		
		select t1.RELATED_FULL_STATUS into :ls_related_status
			from doc_status t 
			join doc_related_status t1 on t1.object_ref_id = t.id and instr(t1.RELATED_DOC_CODE,:ls_related_doc_type)>0
			where t.doc_type = :ls_t_doctype 
			and t.doc_status = :ls_t_upd_status
			using rt_transaction;		
	else
		//-- lấy trạng thái partial --//
//		if ls_t_upd_status <> 'none' then
			select t1.RELATED_PARTIAL_STATUS	 into :ls_related_status
				from doc_status t 
				join doc_related_status t1 on t1.object_ref_id = t.id  and instr(t1.RELATED_DOC_CODE,:ls_related_doc_type)>0
				where t.doc_type = :ls_t_doctype and t.doc_status = :ls_t_upd_status
				using rt_transaction;		
//		else
//			select t1.RELATED_FULL_STATUS into :ls_related_status
//				from doc_status t 
//				join doc_related_status t1 on t1.object_ref_id = t.id and instr(t1.RELATED_DOC_CODE,:ls_related_doc_type)>0
//				where t.doc_type = :ls_t_doctype 
//				and t.doc_status = :ls_t_upd_status
//				using rt_transaction;	
//			//-- đảo biến --//
//			ls_t_upd_status = ls_related_status				
//			select t1.DOC_STATUS into :ls_related_status
//			from doc_status t 
//				join  doc_status t1 on t1.doc_type = t.doc_type and t1.line_no+1 = t.line_no
//				 where t.doc_type = :ls_related_doc_type
//				 and t.doc_status = :ls_t_upd_status				
//			 using rt_transaction;
//		end if
	end if
	// Update status doc liền kề //
	//-- đảo biến --//
	ls_t_upd_status = ls_related_status
	UPDATE document set status = :ls_t_upd_status where id = :ldb_related_doc_id using rt_transaction;
	
	////////////////////////////////////////////
	// Kiểm tra doc liên quan cấp 2 //
	///////////////////////////////////////////
	select count(distinct f_doc_id) into :li_next_cnt
	from matching where t_doc_id = :ldb_related_doc_id
	using rt_transaction;
	
	if li_next_cnt = 1 then 		
		//-- check chiều ngược lại cũng là 1-1--//
		select f_doc_id, t_ref_table into :ldb_f_doc_id, :ls_t_ref_table
		from matching where t_doc_id = :ldb_related_doc_id
		and rownum=1
		using rt_transaction;	
		
		select count(distinct t_doc_id) into :li_next_cnt
		from matching where f_doc_id = :ldb_f_doc_id
		using rt_transaction;		
		if li_next_cnt = 1 then //-- thoả đk quan hệ 1-1: cập nhật status --//
			ls_t_doctype =  this.f_get_doc_type_ex( ldb_related_doc_id, rt_transaction)
			ls_related_doc_type = this.f_get_doc_type_ex( ldb_f_doc_id, rt_transaction)			
			choose case upper(ls_related_doc_type)+';'+upper(ls_t_ref_table)
				case 'PUR_INVOICE;PAYMENT_LINE'
					select count(d.id) into :li_next_cnt
						from v_pur_inv_amount d
						left join v_f_matching_line m on m.f_ref_id = d.id 
															and upper(m.T_REF_TABLE) = 'PAYMENT_LINE'	
															and m.f_doc_id = d.id 															
						where d.id = :ldb_related_doc_id
						and coalesce(m.mat_value,0) < d.amount
						using rt_transaction;	
				case 'SO;INVENTORY_LINE'
					select count(d.id) into :li_next_cnt
						from so_line d
						join document doc on doc.version_id = d.object_ref_id
						left join v_f_matching_line m on m.f_ref_id = d.id 
															and upper(m.T_REF_TABLE) = 'INVENTORY_LINE'	
															and m.f_doc_id = doc.id 															
						where doc.id = :ldb_related_doc_id
						and coalesce(m.mat_qty,0) < d.qty
						using rt_transaction;				
				CASE 'QT;SO_LINE'
					select count(d.id) into :li_next_cnt
						from qt_line d
						join document doc on doc.version_id = d.object_ref_id
						left join v_f_matching_line m on m.f_ref_id = d.id 
															and upper(m.T_REF_TABLE) = 'SO_LINE'	
															and m.f_doc_id = doc.id 															
						where doc.id = :ldb_related_doc_id			
						and coalesce(m.mat_qty,0) < d.qty
						using rt_transaction;					
				case 'PO;INVENTORY_LINE'
					select count(d.id) into :li_next_cnt
						from po_line d
						join document doc on doc.version_id = d.object_ref_id
						left join v_f_matching_line m on m.f_ref_id = d.id 
															and upper(m.T_REF_TABLE) = 'INVENTORY_LINE'	
															and m.f_doc_id = doc.id 															
						where doc.id = :ldb_related_doc_id	
						and coalesce(m.mat_qty,0) < d.qty
						using rt_transaction;					
				case 'PO;SO_LINE'
					select count(d.id) into :li_next_cnt
						from po_line d
						join document doc on doc.version_id = d.object_ref_id
						left join v_f_matching_line m on m.f_ref_id = d.id 
															and upper(m.T_REF_TABLE) = 'SO_LINE'	
															and m.f_doc_id = doc.id 															
						where doc.id = :ldb_related_doc_id				
						and coalesce(m.mat_qty,0) < d.qty
						using rt_transaction;			
				case else
					continue						
			end choose
			if li_next_cnt = 0 then  //-- kết hết --//	
				//-- lấy trạng thái full --//		
				select t1.RELATED_FULL_STATUS into :ls_related_status
					from doc_status t 
					join doc_related_status t1 on t1.object_ref_id = t.id and instr(t1.RELATED_DOC_CODE,:ls_related_doc_type)>0
					where t.doc_type = :ls_t_doctype 
					and t.doc_status = :ls_t_upd_status
					using rt_transaction;		
			else
				//-- lấy trạng thái partial --//
				select t1.RELATED_PARTIAL_STATUS	 into :ls_related_status
					from doc_status t 
					join doc_related_status t1 on t1.object_ref_id = t.id  and instr(t1.RELATED_DOC_CODE,:ls_related_doc_type)>0
					where t.doc_type = :ls_t_doctype and t.doc_status = :ls_t_upd_status
					using rt_transaction;		
			end if
			////////////////////////////////////////////
			// Update status doc liên quan câp 2 //
			///////////////////////////////////////////				
			//-- đảo biến --//
			ls_t_upd_status = ls_related_status
			UPDATE document set status = :ls_t_upd_status where id = :ldb_f_doc_id using rt_transaction;
			
			////////////////////////////////////////////
			// Kiểm tra doc liên quan cấp 3 //
			///////////////////////////////////////////			
			//-- đảo biến --//
			ldb_related_doc_id = ldb_f_doc_id
			select count(distinct f_doc_id) into :li_next_cnt
			from matching where t_doc_id = :ldb_related_doc_id
			using rt_transaction;
			
			if li_next_cnt = 1 then //-- related 1-1: tiếp tục cập nhật status --//		
				//-- check chiều ngược lại cũng là 1-1--//
				select f_doc_id, t_ref_table into :ldb_f_doc_id, :ls_t_ref_table
				from matching where t_doc_id = :ldb_related_doc_id
				and rownum=1
				using rt_transaction;	
				
				select count(distinct t_doc_id) into :li_next_cnt
				from matching where f_doc_id = :ldb_f_doc_id
				using rt_transaction;				
				if li_next_cnt = 1 then  //-- thoả đk quan hệ 1-1: cập nhật status --//
					ls_related_doc_type = this.f_get_doc_type_ex( ldb_f_doc_id, rt_transaction)
					ls_t_doctype =  this.f_get_doc_type_ex( ldb_related_doc_id, rt_transaction)
					choose case upper(ls_related_doc_type)+';'+upper(ls_t_ref_table)
						case 'PUR_INVOICE;PAYMENT_LINE'
							select count(d.id) into :li_next_cnt
								from v_pur_inv_amount d
								left join v_f_matching_line m on m.f_ref_id = d.id 
																	and upper(m.T_REF_TABLE) = 'PAYMENT_LINE'	
																	and m.f_doc_id = d.id 															
								where d.id = :ldb_related_doc_id
								and coalesce(m.mat_value,0) < d.amount
								using rt_transaction;	
						case 'SO;INVENTORY_LINE'
							select count(d.id) into :li_next_cnt
								from so_line d
								join document doc on doc.version_id = d.object_ref_id
								left join v_f_matching_line m on m.f_ref_id = d.id 
																	and upper(m.T_REF_TABLE) = 'INVENTORY_LINE'	
																	and m.f_doc_id = doc.id 																	
								where doc.id = :ldb_related_doc_id
								and coalesce(m.mat_qty,0) < d.qty
								using rt_transaction;				
						CASE 'QT;SO_LINE'
							select count(d.id) into :li_next_cnt
								from qt_line d
								join document doc on doc.version_id = d.object_ref_id
								left join v_f_matching_line m on m.f_ref_id = d.id 
																	and upper(m.T_REF_TABLE) = 'SO_LINE'	
																	and m.f_doc_id = doc.id 																	
								where doc.id = :ldb_related_doc_id				
								and coalesce(m.mat_qty,0) < d.qty
								using rt_transaction;					
						case 'PO;INVENTORY_LINE'
							select count(d.id) into :li_next_cnt
								from po_line d
								join document doc on doc.version_id = d.object_ref_id
								left join v_f_matching_line m on m.f_ref_id = d.id 
																	and upper(m.T_REF_TABLE) = 'INVENTORY_LINE'	
																	and m.f_doc_id = doc.id 																	
								where doc.id = :ldb_related_doc_id				
								and coalesce(m.mat_qty,0) < d.qty
								using rt_transaction;				
						case 'PO;SO_LINE'
							select count(d.id) into :li_next_cnt
								from po_line d
								join document doc on doc.version_id = d.object_ref_id
								left join v_f_matching_line m on m.f_ref_id = d.id 
																	and upper(m.T_REF_TABLE) = 'SO_LINE'	
																	and m.f_doc_id = doc.id 																	
								where doc.id = :ldb_related_doc_id			
								and coalesce(m.mat_qty,0) < d.qty
								using rt_transaction;			
						case else
							continue									
					end choose
					if li_next_cnt = 0 then  //-- kết hết --//	
						//-- lấy trạng thái full --//		
						select t1.RELATED_FULL_STATUS into :ls_related_status
							from doc_status t 
							join doc_related_status t1 on t1.object_ref_id = t.id and instr(t1.RELATED_DOC_CODE,:ls_related_doc_type)>0
							where t.doc_type = :ls_t_doctype 
							and t.doc_status = :ls_t_upd_status
							using rt_transaction;		
					else
						//-- lấy trạng thái partial --//
						select t1.RELATED_PARTIAL_STATUS	 into :ls_related_status
							from doc_status t 
							join doc_related_status t1 on t1.object_ref_id = t.id  and instr(t1.RELATED_DOC_CODE,:ls_related_doc_type)>0
							where t.doc_type = :ls_t_doctype and t.doc_status = :ls_t_upd_status
							using rt_transaction;		
					end if				
								
					////////////////////////////////////////////
					// Update status doc liên quan câp 3 //
					///////////////////////////////////////////	
					//-- đảo biến --//
					ls_t_upd_status = ls_related_status					
					UPDATE document set status = :ls_t_upd_status where id = :ldb_f_doc_id using rt_transaction;										
					/////////////////////////////////////////////////////
					// Kiểm tra doc liên quan cấp 4: gọi truy hồi //
					///////////////////////////////////////////	/////////		
				else
					continue 
				end if
			else
				continue 
			end if
		else
			continue
		end if
	else
		continue 
	end if
NEXT
commit using rt_transaction;
destroy lds_relaled_doc
return li_cnt
end function

public function integer f_upd_related_status_del (double vdb_t_doc_id, string vs_t_upd_status, string vs_t_ref_table, double vdb_doc_id, double vdb_t_ref_id, ref t_transaction rt_transaction);/*//////////////////////////////////////////////////////
- Luôn cập nhật trạng thái cùa Doc liền kề 
- Chỉ cập nhật trạng thai của DOC liên quan cấp 2, 3,... khi thoả mãn điều kiện quan lệ 1-1
=====================================*/
int			li_cnt, li_row, li_next_cnt, li_cnt2, li_row2,li_cnt3, li_row3
double	ldb_related_doc_id, ldb_f_doc_id
string		ls_related_doc_type, ls_related_status, ls_t_upd_status, ls_t_doctype, ls_t_ref_table
t_ds_db		lds_relaled_doc


ls_t_upd_status = vs_t_upd_status
ls_t_doctype = this.f_get_doc_type_ex( vdb_t_doc_id, rt_transaction)

//-- Lấy f_doc_id cần update --//
lds_relaled_doc = create t_ds_db
lds_relaled_doc.dataobject = 'ds_related_doc'
lds_relaled_doc.f_settransobject(rt_transaction )

li_cnt = lds_relaled_doc.retrieve(vdb_t_doc_id )

if vdb_t_ref_id > 0 then
	delete matching where t_ref_id = :vdb_t_ref_id and upper(t_ref_table) = upper(:vs_t_ref_table) using rt_transaction;
else
	delete matching where t_doc_id = :vdb_t_doc_id  and upper(t_ref_table) = upper(:vs_t_ref_table) using rt_transaction;
end if

FOR li_row = 1 to li_cnt
	///////////////////////////////////
	// Update status doc liền kề //
	//////////////////////////////////
	//-- kiểm tra doc liền kề đã kết hết chưa --//
	ldb_related_doc_id = lds_relaled_doc.getitemnumber( li_row, 'related_doc_id')
	ls_related_doc_type = lds_relaled_doc.getitemstring( li_row, 'related_doc_type')
	choose case upper(ls_related_doc_type)+';'+upper(vs_t_ref_table)
		case 'PUR_INVOICE;PAYMENT_LINE'
			select count(d.id) into :li_next_cnt
				from v_pur_inv_amount d
				left join v_f_matching_line m on m.f_ref_id = d.id 
													and upper(m.T_REF_TABLE) = 'PAYMENT_LINE'	
													and m.f_doc_id = d.id 													
				where d.id = :ldb_related_doc_id
				and coalesce(m.mat_value,0) < d.amount
				using rt_transaction;	
		case 'SO;INVENTORY_LINE'
			select count(d.id) into :li_next_cnt
				from so_line d
				join document doc on doc.version_id = d.object_ref_id
				left join v_f_matching_line m on m.f_ref_id = d.id 
													and upper(m.T_REF_TABLE) = 'INVENTORY_LINE'	
													and m.f_doc_id = doc.id 													
				where doc.id = :ldb_related_doc_id
				and coalesce(m.mat_qty,0) < d.qty
				using rt_transaction;				
		CASE 'QT;SO_LINE'
			select count(d.id) into :li_next_cnt
				from qt_line d
				join document doc on doc.version_id = d.object_ref_id
				left join v_f_matching_line m on m.f_ref_id = d.id 
													and upper(m.T_REF_TABLE) = 'SO_LINE'	
													and m.f_doc_id = doc.id 													
				where doc.id = :ldb_related_doc_id			
				and coalesce(m.mat_qty,0) < d.qty
				using rt_transaction;					
		case 'PO;INVENTORY_LINE'
			select count(d.id) into :li_next_cnt
				from po_line d
				join document doc on doc.version_id = d.object_ref_id
				left join v_f_matching_line m on m.f_ref_id = d.id 
													and upper(m.T_REF_TABLE) = 'INVENTORY_LINE'	
													and m.f_doc_id = doc.id 													
				where doc.id = :ldb_related_doc_id						
				and coalesce(m.mat_qty,0) < d.qty
				using rt_transaction;	
		case 'PO;SO_LINE'
			select count(d.id) into :li_next_cnt
				from po_line d
				join document doc on doc.version_id = d.object_ref_id
				left join v_f_matching_line m on m.f_ref_id = d.id 
													and upper(m.T_REF_TABLE) = 'SO_LINE'	
													and m.f_doc_id = doc.id 													
				where doc.id = :ldb_related_doc_id			
				and coalesce(m.mat_qty,0) < d.qty
				using rt_transaction;					
		case else
			continue
	end choose
	
	if li_next_cnt = 0 then  //-- kết hết --//	
		//-- lấy trạng thái full --//
		select t1.RELATED_FULL_STATUS into :ls_related_status
			from doc_status t 
			join doc_related_status t1 on t1.object_ref_id = t.id and instr(t1.RELATED_DOC_CODE,:ls_related_doc_type)>0
			where t.doc_type = :ls_t_doctype 
			and t.doc_status = :ls_t_upd_status
			using rt_transaction;		
	else
		//-- lấy trạng thái partial --//
		if ls_t_upd_status <> 'none' then
			select t1.RELATED_PARTIAL_STATUS	 into :ls_related_status
				from doc_status t 
				join doc_related_status t1 on t1.object_ref_id = t.id  and instr(t1.RELATED_DOC_CODE,:ls_related_doc_type)>0
				where t.doc_type = :ls_t_doctype and t.doc_status = :ls_t_upd_status
				using rt_transaction;		
		else
			select t1.RELATED_FULL_STATUS into :ls_related_status
				from doc_status t 
				join doc_related_status t1 on t1.object_ref_id = t.id and instr(t1.RELATED_DOC_CODE,:ls_related_doc_type)>0
				where t.doc_type = :ls_t_doctype 
				and t.doc_status = 'new'
				using rt_transaction;	
			//-- đảo biến --//
			ls_t_upd_status = ls_related_status				
			select t1.DOC_STATUS into :ls_related_status
			from doc_status t 
				join  doc_status t1 on t1.doc_type = t.doc_type and t1.line_no+1 = t.line_no
				 where t.doc_type = :ls_related_doc_type
				 and t.doc_status = :ls_t_upd_status				
			 using rt_transaction;
		end if
	end if
	// Update status doc liền kề //
	//-- đảo biến --//
	ls_t_upd_status = ls_related_status
	UPDATE document set status = :ls_t_upd_status where id = :ldb_related_doc_id using rt_transaction;
	
	////////////////////////////////////////////
	// Kiểm tra doc liên quan cấp 2 //
	///////////////////////////////////////////
	select count(distinct f_doc_id) into :li_next_cnt
	from matching where t_doc_id = :ldb_related_doc_id
	using rt_transaction;
	
	if li_next_cnt = 1 then 		
		//-- check chiều ngược lại cũng là 1-1--//
		select f_doc_id, t_ref_table into :ldb_f_doc_id, :ls_t_ref_table
		from matching where t_doc_id = :ldb_related_doc_id
		and rownum=1
		using rt_transaction;	
		
		select count(distinct t_doc_id) into :li_next_cnt
		from matching where f_doc_id = :ldb_f_doc_id
		using rt_transaction;		
		if li_next_cnt = 1 then //-- thoả đk quan hệ 1-1: cập nhật status --//
			ls_t_doctype =  this.f_get_doc_type_ex( ldb_related_doc_id, rt_transaction)
			ls_related_doc_type = this.f_get_doc_type_ex( ldb_f_doc_id, rt_transaction)			
			choose case upper(ls_related_doc_type)+';'+upper(ls_t_ref_table)
				case 'PUR_INVOICE;PAYMENT_LINE'
					select count(d.id) into :li_next_cnt
						from v_pur_inv_amount d
						left join v_f_matching_line m on m.f_ref_id = d.id 
															and upper(m.T_REF_TABLE) = 'PAYMENT_LINE'	
															and m.f_doc_id = d.id 															
						where d.id = :ldb_related_doc_id
						and coalesce(m.mat_value,0) < d.amount
						using rt_transaction;	
				case 'SO;INVENTORY_LINE'
					select count(d.id) into :li_next_cnt
						from so_line d
						join document doc on doc.version_id = d.object_ref_id
						left join v_f_matching_line m on m.f_ref_id = d.id 
															and upper(m.T_REF_TABLE) = 'INVENTORY_LINE'	
															and m.f_doc_id = doc.id 															
						where doc.id = :ldb_related_doc_id
						and coalesce(m.mat_qty,0) < d.qty
						using rt_transaction;				
				CASE 'QT;SO_LINE'
					select count(d.id) into :li_next_cnt
						from qt_line d
						join document doc on doc.version_id = d.object_ref_id
						left join v_f_matching_line m on m.f_ref_id = d.id 
															and upper(m.T_REF_TABLE) = 'SO_LINE'	
															and m.f_doc_id = doc.id 															
						where doc.id = :ldb_related_doc_id				
						and coalesce(m.mat_qty,0) < d.qty
						using rt_transaction;					
				case 'PO;INVENTORY_LINE'
					select count(d.id) into :li_next_cnt
						from po_line d
						join document doc on doc.version_id = d.object_ref_id
						left join v_f_matching_line m on m.f_ref_id = d.id 
															and upper(m.T_REF_TABLE) = 'INVENTORY_LINE'	
															and m.f_doc_id = doc.id 															
						where doc.id = :ldb_related_doc_id			
						and coalesce(m.mat_qty,0) < d.qty
						using rt_transaction;		
				case 'PO;SO_LINE'
					select count(d.id) into :li_next_cnt
						from po_line d
						join document doc on doc.version_id = d.object_ref_id
						left join v_f_matching_line m on m.f_ref_id = d.id 
															and upper(m.T_REF_TABLE) = 'SO_LINE'	
															and m.f_doc_id = doc.id 															
						where doc.id = :ldb_related_doc_id				
						and coalesce(m.mat_qty,0) < d.qty
						using rt_transaction;		
				case else
					continue						
			end choose
	
			if li_next_cnt = 0 then  //-- kết hết --//	
				//-- lấy trạng thái full --//		
				select t1.RELATED_FULL_STATUS into :ls_related_status
					from doc_status t 
					join doc_related_status t1 on t1.object_ref_id = t.id and instr(t1.RELATED_DOC_CODE,:ls_related_doc_type)>0
					where t.doc_type = :ls_t_doctype 
					and t.doc_status = :ls_t_upd_status
					using rt_transaction;		
			else
				//-- lấy trạng thái partial --//
				select t1.RELATED_PARTIAL_STATUS	 into :ls_related_status
					from doc_status t 
					join doc_related_status t1 on t1.object_ref_id = t.id  and instr(t1.RELATED_DOC_CODE,:ls_related_doc_type)>0
					where t.doc_type = :ls_t_doctype and t.doc_status = :ls_t_upd_status
					using rt_transaction;		
			end if
			////////////////////////////////////////////
			// Update status doc liên quan câp 2 //
			///////////////////////////////////////////				
			//-- đảo biến --//
			ls_t_upd_status = ls_related_status
			UPDATE document set status = :ls_t_upd_status where id = :ldb_f_doc_id using rt_transaction;
			
			////////////////////////////////////////////
			// Kiểm tra doc liên quan cấp 3 //
			///////////////////////////////////////////			
			//-- đảo biến --//
			ldb_related_doc_id = ldb_f_doc_id
			select count(distinct f_doc_id) into :li_next_cnt
			from matching where t_doc_id = :ldb_related_doc_id
			using rt_transaction;
			
			if li_next_cnt = 1 then //-- related 1-1: tiếp tục cập nhật status --//		
				//-- check chiều ngược lại cũng là 1-1--//
				select f_doc_id, t_ref_table into :ldb_f_doc_id, :ls_t_ref_table
				from matching where t_doc_id = :ldb_related_doc_id
				and rownum=1
				using rt_transaction;	
				
				select count(distinct t_doc_id) into :li_next_cnt
				from matching where f_doc_id = :ldb_f_doc_id
				using rt_transaction;				
				if li_next_cnt = 1 then  //-- thoả đk quan hệ 1-1: cập nhật status --//
					ls_related_doc_type = this.f_get_doc_type_ex( ldb_f_doc_id, rt_transaction)
					ls_t_doctype =  this.f_get_doc_type_ex( ldb_related_doc_id, rt_transaction)
					choose case upper(ls_related_doc_type)+';'+upper(ls_t_ref_table)
						case 'PUR_INVOICE;PAYMENT_LINE'
							select count(d.id) into :li_next_cnt
								from v_pur_inv_amount d
								left join v_f_matching_line m on m.f_ref_id = d.id 
																	and upper(m.T_REF_TABLE) = 'PAYMENT_LINE'	
																	and m.f_doc_id = d.id 																	
								where d.id = :ldb_related_doc_id
								and coalesce(m.mat_value,0) < d.amount
								using rt_transaction;	
						case 'SO;INVENTORY_LINE'
							select count(d.id) into :li_next_cnt
								from so_line d
								join document doc on doc.version_id = d.object_ref_id
								left join v_f_matching_line m on m.f_ref_id = d.id 
																	and upper(m.T_REF_TABLE) = 'INVENTORY_LINE'	
																	and m.f_doc_id = doc.id 																	
								where doc.id = :ldb_related_doc_id
								and coalesce(m.mat_qty,0) < d.qty
								using rt_transaction;				
						CASE 'QT;SO_LINE'
							select count(d.id) into :li_next_cnt
								from qt_line d
								join document doc on doc.version_id = d.object_ref_id
								left join v_f_matching_line m on m.f_ref_id = d.id 
																	and upper(m.T_REF_TABLE) = 'SO_LINE'	
																	and m.f_doc_id = doc.id 																	
								where doc.id = :ldb_related_doc_id				
								and coalesce(m.mat_qty,0) < d.qty
								using rt_transaction;					
						case 'PO;INVENTORY_LINE'
							select count(d.id) into :li_next_cnt
								from po_line d
								join document doc on doc.version_id = d.object_ref_id
								left join v_f_matching_line m on m.f_ref_id = d.id 
																	and upper(m.T_REF_TABLE) = 'INVENTORY_LINE'	
																	and m.f_doc_id = doc.id 																	
								where doc.id = :ldb_related_doc_id			
								and coalesce(m.mat_qty,0) < d.qty
								using rt_transaction;				
						case 'PO;SO_LINE'
							select count(d.id) into :li_next_cnt
								from po_line d
								join document doc on doc.version_id = d.object_ref_id
								left join v_f_matching_line m on m.f_ref_id = d.id 
																	and upper(m.T_REF_TABLE) = 'SO_LINE'	
																	and m.f_doc_id = doc.id 																	
								where doc.id = :ldb_related_doc_id		
								and coalesce(m.mat_qty,0) < d.qty
								using rt_transaction;	
						case else
							continue							
					end choose
					if li_next_cnt = 0 then  //-- kết hết --//	
						//-- lấy trạng thái full --//		
						select t1.RELATED_FULL_STATUS into :ls_related_status
							from doc_status t 
							join doc_related_status t1 on t1.object_ref_id = t.id and instr(t1.RELATED_DOC_CODE,:ls_related_doc_type)>0
							where t.doc_type = :ls_t_doctype 
							and t.doc_status = :ls_t_upd_status
							using rt_transaction;		
					else
						//-- lấy trạng thái partial --//
						select t1.RELATED_PARTIAL_STATUS	 into :ls_related_status
							from doc_status t 
							join doc_related_status t1 on t1.object_ref_id = t.id  and instr(t1.RELATED_DOC_CODE,:ls_related_doc_type)>0
							where t.doc_type = :ls_t_doctype and t.doc_status = :ls_t_upd_status
							using rt_transaction;		
					end if				
								
					////////////////////////////////////////////
					// Update status doc liên quan câp 3 //
					///////////////////////////////////////////	
					//-- đảo biến --//
					ls_t_upd_status = ls_related_status					
					UPDATE document set status = :ls_t_upd_status where id = :ldb_f_doc_id using rt_transaction;										
					/////////////////////////////////////////////////////
					// Kiểm tra doc liên quan cấp 4: gọi truy hồi //
					///////////////////////////////////////////	/////////		
				else
					continue 
				end if
			else
				continue 
			end if
		else
			continue
		end if
	else
		continue 
	end if
NEXT
commit using rt_transaction;
destroy lds_relaled_doc
return li_cnt
end function

public function double f_copy_to_bank_voucher_payment (string vs_f_objname, s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial);string				ls_sql, ls_code, ls_currCode, ls_currName, ls_sql_cols, ls_update_table, ls_related_data, las_related_data[], ls_f_ref_table
string				ls_main_chk_cols, las_main_chk_cols[], ls_related_chk_cols, las_related_chk_cols[], ls_data_tmp, las_initvalue_cols[], ls_qty_yn, ls_val_yn
string				las_from_cols[], ls_from_cols, ls_sql_values, ls_coltype, ls_sql_exec, ls_from_match_cols, las_from_match_cols[], ls_mat_cols, las_mat_cols[]
double			ldb_id,ldb_f_doc_id, ldb_t_doc_id, ldb_version_id, ldb_trans_id, ldb_base_currID, ldb_mat_val, ldb_matched_val, ldb_f_ref_id, ldb_f_branch_id
double			ldb_f_version_id, ldb_branch, ldb_manage_group
int					li_idx, li_idx1, li_idx2, li_row, li_colnbr, li_colCnt, li_pos, li_cnt
boolean			lb_found, lb_copied, lb_update_orders
any				laa_value[], laa_chk_data[], la_initvalue
t_ds_db				lds_handle
c_string				lc_string
c_unit_instance 	lc_unit_ins
c_dwsetup_initial	lc_dwsetup_initial

//--------------------------//
// lấy giao dịch của PO //
//-------------------------//
li_pos =  pos( vstr_dwo_related[1].s_data[1] , "(" )
if li_pos > 0 then
	ls_related_data = mid(vstr_dwo_related[1].s_data[1], li_pos +1, pos(vstr_dwo_related[1].s_data[1] , ')') - (li_pos +1) )
	li_cnt = lc_string.f_Stringtoarray( ls_related_data, ',', las_related_data[])
else
	las_related_data[1] = vstr_dwo_related[1].s_data[1]
end if
ldb_id = double(las_related_data[1] )

lds_handle = create t_ds_db
lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo
ls_update_table = lds_handle.describe( "datawindow.table.update")
if lower(ls_update_table) = 'document' then
	//-- copy header --//
	if pos(vs_f_objname, 'u_bank_voucher_payment')>0 then		//-- nhân bản --//
			select t.trans_hdr_id, t.version_id, t.branch_id , t.manage_group , t1.quantity_yn, t1.value_yn  
				into :ldb_trans_id, :ldb_f_version_id, :ldb_branch, :ldb_manage_group, :ls_qty_yn, :ls_val_yn
				from document t
				join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
				where t.company_id = :gi_user_comp_id
				and t.id =  :ldb_id
				using rt_transaction;
				if isnull(ldb_manage_group) then ldb_manage_group = 0		
				if isnull(ls_qty_yn) then ls_qty_yn = 'N'
				if isnull(ls_val_yn) then ls_val_yn = 'N'				
	else
	
		ldb_f_doc_id = ldb_id
		select count(t2.id) into :li_cnt
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'BANK_VOUCHER_PAYMENT'
		where t.company_id = :gi_user_comp_id
	//	and t.branch_id = :gdb_branch
		and t.id =  :ldb_id
		using rt_transaction;
		if li_cnt = 1 then
			select t2.id, t.version_id, t.branch_id , t2.quantity_yn, t2.value_yn
			into :ldb_trans_id, :ldb_f_version_id, :ldb_branch , :ls_qty_yn, :ls_val_yn
			from document t
			join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
			join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'BANK_VOUCHER_PAYMENT'
			where t.company_id = :gi_user_comp_id
	//		and t.branch_id = :gdb_branch
			and t.id =  :ldb_id
			using rt_transaction;
			if isnull(ls_qty_yn) then ls_qty_yn = 'N'
			if isnull(ls_val_yn) then ls_val_yn = 'N'		
		else
			gf_messagebox('m.b_obj_instantiate.f_copy_to_po.01','Thông báo','Chưa cài đặt giao dịch cho phiếu chi thuộc nhóm copy','stop','ok',1)
			return -1
		end if
	end if
else
	//-- copy line --//
	select object_ref_id, branch_id into :ldb_f_version_id, :ldb_branch
	from pr_line t
	where t.id = :ldb_id
//	and t.branch_id = :gdb_branch
	and  t.company_id = :gi_user_comp_id
	using rt_transaction;
	
	select count(t2.id) 
	into :li_cnt
	from document t
	join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
	join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
	where t.company_id = :gi_user_comp_id
	and t.branch_id = :ldb_branch
	and t.version_id = :ldb_f_version_id
	using rt_transaction;
	
	if li_cnt = 1 then
		select t2.id, t.id into :ldb_trans_id, :ldb_f_doc_id
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
		where t.company_id = :gi_user_comp_id
		and t.branch_id = :ldb_branch
		and t.version_id =  :ldb_f_version_id
		using rt_transaction;
	else
		gf_messagebox('m.b_obj_instantiate.f_copy_to_po.01','Thông báo','Chưa cài đặt giao dịch cho PO thuộc nhóm copy','stop','ok',1)
		return -1
	end if	
end if

//---------------------//
// insert document  //
//--------------------//
ldb_t_doc_id = this.f_create_id_ex( rt_transaction)
ldb_version_id =  this.f_create_id_ex( rt_transaction)
ls_code = rdwsetup_initial.f_get_autonumber_ex('code','d_document_payment_grid', rt_transaction)
ls_sql = "INSERT into DOCUMENT(id,company_id, branch_id,object_ref_table, created_by, created_date,last_mdf_by, last_mdf_date,"+&
									" doc_type, version_id, SOB, handled_by, CODE, document_date, TRANS_HDR_ID,status, manage_group)" +&
			" VALUES("+string(ldb_t_doc_id)+ "," + string( gi_user_comp_id ) + "," + string( ldb_branch ) + ",'BOOKED_SLIP' ," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate, " +&
						"'BANK_VOUCHER_PAYMENT',"+string(ldb_version_id) +", 'F',"+string(gi_userid) + ",'"+ls_code +"', trunc(sysdate)"+ ","+string(ldb_trans_id) +", 'new',"+string(ldb_manage_group)+ ")"
EXECUTE immediate :ls_sql using rt_transaction;



//--------------------//
// insert table  //
//--------------------//

FOR li_idx = 1 to upperbound(vstr_dwo_related[1].s_related_obj_dwo_copy[] )	
	lb_found = false
	lds_handle.dataobject = vstr_dwo_related[1].s_related_obj_dwo_copy[li_idx]
	ls_update_table = lds_handle.describe( "datawindow.table.update")	
	if ls_update_table = 'DOCUMENT' then ls_update_table = 'BOOKED_SLIP'
	
	ls_sql = "INSERT into "+ls_update_table +"(company_id, branch_id, created_by, created_date,last_mdf_by, last_mdf_date,"				
	ls_sql_cols = vstr_dwo_related[1].s_related_obj_column_copy[li_idx]
	ls_sql_cols= trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))
	if vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
		ls_sql_cols += vstr_dwo_related[1].s_related_obj_column_chk[li_idx]
		ls_sql_cols = trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))
		lc_string.f_stringtoarray( vstr_dwo_related[1].s_related_obj_column_chk[li_idx], ';', las_initvalue_cols[])		
	end if	
	
	if right(ls_sql_cols,1) = ',' then 
		if upper(ls_update_table) = 'BOOKED_SLIP' then
			ls_sql += ls_sql_cols + "version_no,doc_type,object_ref_table, object_ref_id,ID,quantity_yn,value_yn)"
		else
			ls_sql += ls_sql_cols + "object_ref_table, object_ref_id,ID)"
		end if
	else
		if upper(ls_update_table) = 'BOOKED_SLIP' then
			ls_sql += ls_sql_cols + ",version_no,doc_type,object_ref_table, object_ref_id,ID,quantity_yn,value_yn)"
		else
			ls_sql += ls_sql_cols + ",object_ref_table, object_ref_id,ID)"
		end if
	end if
	ls_sql += " VALUES("+string( gi_user_comp_id ) + "," + string( ldb_branch ) + "," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate " 
	ls_from_cols = vstr_dwo_related[1].s_main_obj_column_copy[li_idx]
	li_colCnt = lc_string.f_stringtoarray( ls_from_cols, ';', las_from_cols[])
	//-- lấy mat cols--//
	if vstr_dwo_related[1].s_match_f_dwo[li_idx] = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
		ls_from_match_cols = vstr_dwo_related[1].s_match_f_column[li_idx]
		if pos(ls_from_match_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_from_match_cols , ';', las_from_match_cols[])
			ls_from_match_cols = las_from_match_cols[1]
		end if
		ls_mat_cols = vstr_dwo_related[1].s_match_column[li_idx]
		if pos(ls_mat_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_mat_cols , ';', las_mat_cols[])
			ls_mat_cols = las_mat_cols[1]
		end if			
	end if
//	//-- lấy chk cols for update destination--//
//	if  vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
//		ls_related_chk_cols = vstr_dwo_related[1].s_related_obj_column_chk[li_idx]
//		lc_string.f_stringtoarray( ls_related_chk_cols, ';', las_related_chk_cols[])
//	end if
	//-- lấy chk cols source--//
	if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
		ls_main_chk_cols = vstr_dwo_related[1].s_main_obj_column_chk[li_idx]
		lc_string.f_stringtoarray( ls_main_chk_cols, ';', las_main_chk_cols[] )
	end if
	
	FOR li_idx1 = 1 to upperbound(vads_copied[])
		if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
			lb_found = true
			lb_update_orders = false
			FOR li_row = 1 to vads_copied[li_idx1].rowcount()
				//-- check match full--//
				if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_mat_val = vads_copied[li_idx1].getitemnumber(li_row, ls_from_match_cols)
					if isnull(ldb_mat_val) then ldb_mat_val = 0
					ldb_f_ref_id = vads_copied[li_idx1].getitemnumber(li_row, 'id')
					ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
					if isnull(ldb_matched_val) then ldb_matched_val = 0
					if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết--//
					if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
						 if isnull(vads_copied[li_idx1].getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
					end if								
				end if //-- kết thúc: check match full--//
				//-- check common values --//
				if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
					lb_update_orders = true
					for li_idx2 = 1 to upperbound(las_main_chk_cols[])
						if li_row = 1 then
							laa_chk_data[li_idx2] = vads_copied[li_idx1].f_getitemany(li_row, las_main_chk_cols[li_idx2])
						end if
					next					
				end if
				//-- insert--//
				ldb_id = this.f_create_id_ex( rt_transaction)
				FOR li_colnbr= 1 to li_colCnt
					ls_coltype = vads_copied[li_idx1].describe(las_from_cols[li_colnbr]+".coltype")
					if left(ls_coltype, 5) = 'numbe' then
						if las_from_cols[li_colnbr] = ls_from_match_cols then
							ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
						else
							if isnull(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr])) then
								ls_sql_values +=",NULL"
							else	
								ls_sql_values += "," + string(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr]))
							end if
						end if
					elseif left(ls_coltype, 5) = 'char(' then
						if isnull(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else						
							ls_sql_values += ",'" + string(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
						end if
					elseif  left(ls_coltype, 5) = 'datet' then
						if isnull(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else	
							ls_sql_values += ",to_date('" + string(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
						end if
					end if
				NEXT
				//-- default values --//		
				if upperbound(las_initvalue_cols[]) > 0 and vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
					FOR li_colnbr = 1 to upperbound(las_initvalue_cols[])
						if las_initvalue_cols[li_colnbr] = 'trans_date'  then
							ls_sql_values += ",to_date('" + string(gd_session_date ,gs_w_date_format )+"','"+gs_w_date_format+"')"
						else
							lc_dwsetup_initial.f_init_ids_setup_dw_ex( ldb_branch , 'U_PAYMENT', rt_transaction)
							lc_dwsetup_initial.f_get_initvalue(vstr_dwo_related[1].s_related_obj_dwo_copy[li_idx] ,las_initvalue_cols[li_colnbr],ldb_branch ,la_initvalue )	
							ls_sql_values += "," + string(la_initvalue)
						end if
					NEXT
				end if
				//-values khác--//
				if upper(ls_update_table) = 'BOOKED_SLIP' then
					ls_sql_values += ",1,'BANK_VOUCHER_PAYMENT','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) +",'"+ls_qty_yn+"','"+ls_val_yn + "')"
				else
					ls_sql_values += ",'BOOKED_SLIP',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
				end if				
				ls_sql_exec = ls_sql + ls_sql_values
				EXECUTE immediate :ls_sql_exec using rt_transaction;				
				ls_sql_values =''
				//-- update matching --//
				if pos(vs_f_objname, 'u_bank_voucher_payment') = 0 then
					if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
						ldb_f_branch_id =vads_copied[li_idx1].getitemnumber(li_row, 'branch_id')
						ls_f_ref_table = upper(vads_copied[li_idx1].describe( "datawindow.table.update"))
						ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
											"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
											"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE,"+ls_mat_cols+")" +&
								" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
								","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+string(ldb_f_doc_id) +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
								",'"+ls_f_ref_table+"','COPY','"+ ls_update_table +"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
											
						EXECUTE immediate :ls_sql_exec using rt_transaction;
						lb_copied = true
					end if
				else
					lb_copied = true
				end if
			NEXT
			exit //-- chỉ có 1 dw source -> 1 dw dest --//
		end if		
	NEXT
	//-- ko có datastore dữ iệu copy--//		
	if not lb_found then 
		lb_update_orders = false
		lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] 
		ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))
		laa_value[1] = ldb_f_version_id
		if ls_f_ref_table = 'BOOKED_SLIP' or  ls_f_ref_table = 'ORDERS' then
			lds_handle.f_add_where( "id", laa_value[])
		elseif ls_f_ref_table = 'DOCUMENT' then
			lds_handle.f_add_where( "version_id", laa_value[])
		else
			lds_handle.f_add_where( "object_ref_id", laa_value[])
		end if
		lds_handle.settransobject( rt_transaction)
		lds_handle.retrieve( )
		FOR li_row = 1 to lds_handle.rowcount()
			//-- check match full--//
			if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
				ldb_mat_val = lds_handle.getitemnumber(li_row, ls_from_match_cols)
				if isnull(ldb_mat_val) then ldb_mat_val = 0
				ldb_f_ref_id = lds_handle.getitemnumber(li_row, 'id')
				ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
				if isnull(ldb_matched_val) then ldb_matched_val = 0
				if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết --//
				if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
					 if isnull(lds_handle.getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
				end if				
			end if //-- kết thúc: check match full--//			
			//-- check common values --//
			if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
				lb_update_orders = true
				for li_idx2 = 1 to upperbound(las_main_chk_cols[])
					if li_row = 1 then
						laa_chk_data[li_idx2] = lds_handle.f_getitemany(li_row, las_main_chk_cols[li_idx2])
					end if
				next					
			end if			
			//-- insert--//
			ldb_id = this.f_create_id_ex( rt_transaction)			
			FOR li_colnbr= 1 to li_colCnt
				ls_coltype = lds_handle.describe(las_from_cols[li_colnbr]+".coltype")
				if left(ls_coltype, 5) = 'numbe' then
					if las_from_cols[li_colnbr] = ls_from_match_cols then
						ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
					else
						if isnull(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else
							ls_sql_values += "," + string(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr]))
						end if
					end if
				elseif left(ls_coltype, 5) = 'char(' then
					if isnull(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",'" + string(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
					end if
				elseif  left(ls_coltype, 5) = 'datet' then
					if isnull(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",to_date('" + string(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
					end if
				else
					ls_sql_values += ",'" + las_from_cols[li_colnbr] +"'"
				end if				
			NEXT
			//-- default values --//		
			if upperbound(las_initvalue_cols[]) > 0 and vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
				FOR li_colnbr = 1 to upperbound(las_initvalue_cols[])
					if las_initvalue_cols[li_colnbr] = 'trans_date'  then
						ls_sql_values += ",to_date('" + string(gd_session_date ,gs_w_date_format )+"','"+gs_w_date_format+"')"
					else
						lc_dwsetup_initial.f_init_ids_setup_dw_ex( ldb_branch , 'u_detail_pur_invoice', rt_transaction)
						lc_dwsetup_initial.f_get_initvalue('d_pur_invoice_line_grid',las_initvalue_cols[li_colnbr],ldb_branch ,la_initvalue )	
						ls_sql_values += "," + string(la_initvalue)
					end if
				NEXT
			end if
			//-values khác--//			
			if upper(ls_update_table) = 'BOOKED_SLIP' then
				ls_sql_values += ",1,'BANK_VOUCHER_PAYMENT','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) + ",'"+ls_qty_yn+"','"+ls_val_yn + "')"
			else
				ls_sql_values += ",'BOOKED_SLIP',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
			end if				
			ls_sql_exec = ls_sql + ls_sql_values
			EXECUTE immediate :ls_sql_exec using rt_transaction;			
			ls_sql_values =''			
			//-- update matching --//
			if pos(vs_f_objname, 'u_bank_voucher_payment') = 0  then
				if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_f_branch_id =lds_handle.getitemnumber(li_row, 'branch_id')
					ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))
					ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
										"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
										"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE ,"+ls_mat_cols+")" +&
							" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
							","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+string(ldb_f_doc_id) +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
							",'"+ls_f_ref_table+"','COPY','"+ ls_update_table+"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
										
					EXECUTE immediate :ls_sql_exec using rt_transaction;			
					lb_copied = true
				end if
			else
				lb_copied = true
			end if
		NEXT				

	end if //--kết thúc: ko có datastore dữ iệu copy--//	
NEXT
destroy lds_handle
if lb_copied then
	commit using rt_transaction;
else
	rollback using rt_transaction;
	gf_messagebox('m.b_obj_instantiate.f_copy_to_po.02','Thông báo','Phiếu đã kết hết','stop','ok',1)
	return 0
end if

return ldb_t_doc_id
end function

public function double f_copy_to_sal_invoice (string vs_f_objname, s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial);string				ls_sql, ls_code, ls_currCode, ls_currName, ls_sql_cols, ls_update_table, ls_related_data, las_related_data[], ls_f_ref_table
string				ls_main_chk_cols, las_main_chk_cols[], ls_related_chk_cols, las_related_chk_cols[], ls_data_tmp, las_initvalue_cols[], ls_qty_yn, ls_val_yn
string				las_from_cols[], ls_from_cols, ls_sql_values, ls_coltype, ls_sql_exec, ls_from_match_cols, las_from_match_cols[], ls_mat_cols, las_mat_cols[]
double			ldb_id,ldb_f_doc_id, ldb_t_doc_id, ldb_version_id, ldb_trans_id, ldb_base_currID, ldb_mat_val, ldb_matched_val, ldb_f_ref_id, ldb_f_branch_id
double			ldb_f_version_id, ldb_branch, ldb_manage_group
int					li_idx, li_idx1, li_idx2, li_row, li_colnbr, li_colCnt, li_pos, li_cnt
boolean			lb_found, lb_copied, lb_update_orders
any				laa_value[], laa_chk_data[], la_initvalue
t_ds_db				lds_handle
c_string				lc_string
c_unit_instance 	lc_unit_ins
c_dwsetup_initial	lc_dwsetup_initial

//--------------------------//
// lấy giao dịch của PO //
//-------------------------//
li_pos =  pos( vstr_dwo_related[1].s_data[1] , "(" )
if li_pos > 0 then
	ls_related_data = mid(vstr_dwo_related[1].s_data[1], li_pos +1, pos(vstr_dwo_related[1].s_data[1] , ')') - (li_pos +1) )
	li_cnt = lc_string.f_Stringtoarray( ls_related_data, ',', las_related_data[])
else
	las_related_data[1] = vstr_dwo_related[1].s_data[1]
end if
ldb_id = double(las_related_data[1] )

lds_handle = create t_ds_db
lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo
ls_update_table = lds_handle.describe( "datawindow.table.update")
if lower(ls_update_table) = 'document' then
	//-- copy header --//
	if pos(vs_f_objname, 'u_sal_invoice')>0 then		//-- nhân bản --//
			select t.trans_hdr_id, t.version_id, t.branch_id , t.manage_group , t1.quantity_yn, t1.value_yn  
				into :ldb_trans_id, :ldb_f_version_id, :ldb_branch, :ldb_manage_group, :ls_qty_yn, :ls_val_yn
				from document t
				join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
				where t.company_id = :gi_user_comp_id
				and t.id =  :ldb_id
				using rt_transaction;
				if isnull(ldb_manage_group) then ldb_manage_group = 0		
				if isnull(ls_qty_yn) then ls_qty_yn = 'N'
				if isnull(ls_val_yn) then ls_val_yn = 'N'				
	else
	
		ldb_f_doc_id = ldb_id
		select count(t2.id) into :li_cnt
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'SAL_INVOICE'
		where t.company_id = :gi_user_comp_id
	//	and t.branch_id = :gdb_branch
		and t.id =  :ldb_id
		using rt_transaction;
		if li_cnt = 1 then
			select t2.id, t.version_id, t.branch_id , t2.quantity_yn, t2.value_yn
			into :ldb_trans_id, :ldb_f_version_id, :ldb_branch , :ls_qty_yn, :ls_val_yn
			from document t
			join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
			join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'SAL_INVOICE'
			where t.company_id = :gi_user_comp_id
	//		and t.branch_id = :gdb_branch
			and t.id =  :ldb_id
			using rt_transaction;
			if isnull(ls_qty_yn) then ls_qty_yn = 'N'
			if isnull(ls_val_yn) then ls_val_yn = 'N'		
		else
			gf_messagebox('m.b_obj_instantiate.f_copy_to_po.01','Thông báo','Chưa cài đặt giao dịch cho PO thuộc nhóm copy','stop','ok',1)
			return -1
		end if
	end if
else
	//-- copy line --//
	select object_ref_id, branch_id into :ldb_f_version_id, :ldb_branch
	from pr_line t
	where t.id = :ldb_id
//	and t.branch_id = :gdb_branch
	and  t.company_id = :gi_user_comp_id
	using rt_transaction;
	
	select count(t2.id) 
	into :li_cnt
	from document t
	join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
	join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
	where t.company_id = :gi_user_comp_id
	and t.branch_id = :ldb_branch
	and t.version_id = :ldb_f_version_id
	using rt_transaction;
	
	if li_cnt = 1 then
		select t2.id, t.id into :ldb_trans_id, :ldb_f_doc_id
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
		where t.company_id = :gi_user_comp_id
		and t.branch_id = :ldb_branch
		and t.version_id =  :ldb_f_version_id
		using rt_transaction;
	else
		gf_messagebox('m.b_obj_instantiate.f_copy_to_po.01','Thông báo','Chưa cài đặt giao dịch cho PO thuộc nhóm copy','stop','ok',1)
		return -1
	end if	
end if

//---------------------//
// insert document  //
//--------------------//
ldb_t_doc_id = this.f_create_id_ex( rt_transaction)
ldb_version_id =  this.f_create_id_ex( rt_transaction)
ls_code = rdwsetup_initial.f_get_autonumber_ex('code','d_document_ar_grid', rt_transaction)
ls_sql = "INSERT into DOCUMENT(id,company_id, branch_id,object_ref_table, created_by, created_date,last_mdf_by, last_mdf_date,"+&
									" doc_type, version_id, SOB, handled_by, CODE, document_date, TRANS_HDR_ID,status, manage_group)" +&
			" VALUES("+string(ldb_t_doc_id)+ "," + string( gi_user_comp_id ) + "," + string( ldb_branch ) + ",'BOOKED_SLIP' ," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate, " +&
						"'SAL_INVOICE',"+string(ldb_version_id) +", 'F',"+string(gi_userid) + ",'"+ls_code +"', trunc(sysdate)"+ ","+string(ldb_trans_id) +", 'new',"+string(ldb_manage_group)+ ")"
EXECUTE immediate :ls_sql using rt_transaction;



//--------------------//
// insert table  //
//--------------------//

FOR li_idx = 1 to upperbound(vstr_dwo_related[1].s_related_obj_dwo_copy[] )	
	lds_handle.dataobject = vstr_dwo_related[1].s_related_obj_dwo_copy[li_idx]
	ls_update_table = lds_handle.describe( "datawindow.table.update")	

	ls_sql = "INSERT into "+ls_update_table +"(company_id, branch_id, created_by, created_date,last_mdf_by, last_mdf_date,"				
	ls_sql_cols = vstr_dwo_related[1].s_related_obj_column_copy[li_idx]
	ls_sql_cols= trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))
	if vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
		ls_sql_cols += vstr_dwo_related[1].s_related_obj_column_chk[li_idx]
		ls_sql_cols = trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))
		lc_string.f_stringtoarray( vstr_dwo_related[1].s_related_obj_column_chk[li_idx], ';', las_initvalue_cols[])		
	end if	
	
	if right(ls_sql_cols,1) = ',' then 
		if upper(ls_update_table) = 'BOOKED_SLIP' then
			ls_sql += ls_sql_cols + "version_no,doc_type,object_ref_table, object_ref_id,ID,quantity_yn,value_yn)"
		else
			ls_sql += ls_sql_cols + "object_ref_table, object_ref_id,ID)"
		end if
	else
		if upper(ls_update_table) = 'BOOKED_SLIP' then
			ls_sql += ls_sql_cols + ",version_no,doc_type,object_ref_table, object_ref_id,ID)"
		else
			ls_sql += ls_sql_cols + ",object_ref_table, object_ref_id,ID)"
		end if
	end if
	ls_sql += " VALUES("+string( gi_user_comp_id ) + "," + string( ldb_branch ) + "," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate " 
	ls_from_cols = vstr_dwo_related[1].s_main_obj_column_copy[li_idx]
	li_colCnt = lc_string.f_stringtoarray( ls_from_cols, ';', las_from_cols[])
	//-- lấy mat cols--//
	if vstr_dwo_related[1].s_match_f_dwo[li_idx] = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
		ls_from_match_cols = vstr_dwo_related[1].s_match_f_column[li_idx]
		if pos(ls_from_match_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_from_match_cols , ';', las_from_match_cols[])
			ls_from_match_cols = las_from_match_cols[1]
		end if
		ls_mat_cols = vstr_dwo_related[1].s_match_column[li_idx]
		if pos(ls_mat_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_mat_cols , ';', las_mat_cols[])
			ls_mat_cols = las_mat_cols[1]
		end if			
	end if
//	//-- lấy chk cols for update destination--//
//	if  vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
//		ls_related_chk_cols = vstr_dwo_related[1].s_related_obj_column_chk[li_idx]
//		lc_string.f_stringtoarray( ls_related_chk_cols, ';', las_related_chk_cols[])
//	end if
	//-- lấy chk cols source--//
	if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
		ls_main_chk_cols = vstr_dwo_related[1].s_main_obj_column_chk[li_idx]
		lc_string.f_stringtoarray( ls_main_chk_cols, ';', las_main_chk_cols[] )
	end if
	
	FOR li_idx1 = 1 to upperbound(vads_copied[])
		if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
			lb_found = true
			lb_update_orders = false
			FOR li_row = 1 to vads_copied[li_idx1].rowcount()
				//-- check match full--//
				if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_mat_val = vads_copied[li_idx1].getitemnumber(li_row, ls_from_match_cols)
					if isnull(ldb_mat_val) then ldb_mat_val = 0
					ldb_f_ref_id = vads_copied[li_idx1].getitemnumber(li_row, 'id')
					ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
					if isnull(ldb_matched_val) then ldb_matched_val = 0
					if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết--//
					if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
						 if isnull(vads_copied[li_idx1].getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
					end if								
				end if //-- kết thúc: check match full--//
				//-- check common values --//
				if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
					lb_update_orders = true
					for li_idx2 = 1 to upperbound(las_main_chk_cols[])
						if li_row = 1 then
							laa_chk_data[li_idx2] = vads_copied[li_idx1].f_getitemany(li_row, las_main_chk_cols[li_idx2])
						end if
					next					
				end if
				//-- insert--//
				ldb_id = this.f_create_id_ex( rt_transaction)
				FOR li_colnbr= 1 to li_colCnt
					ls_coltype = vads_copied[li_idx1].describe(las_from_cols[li_colnbr]+".coltype")
					if left(ls_coltype, 5) = 'numbe' then
						if las_from_cols[li_colnbr] = ls_from_match_cols then
							ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
						else
							if isnull(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr])) then
								ls_sql_values +=",NULL"
							else	
								ls_sql_values += "," + string(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr]))
							end if
						end if
					elseif left(ls_coltype, 5) = 'char(' then
						if isnull(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else						
							ls_sql_values += ",'" + string(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
						end if
					elseif  left(ls_coltype, 5) = 'datet' then
						if isnull(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else	
							ls_sql_values += ",to_date('" + string(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
						end if
					end if
				NEXT
				//-- default values --//		
				if upperbound(las_initvalue_cols[]) > 0 and vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> ''  then
					FOR li_colnbr = 1 to upperbound(las_initvalue_cols[])
						if las_initvalue_cols[li_colnbr] = 'trans_date'  then
							ls_sql_values += ",to_date('" + string(gd_session_date ,gs_w_date_format )+"','"+gs_w_date_format+"')"
						else
							lc_dwsetup_initial.f_init_ids_setup_dw_ex( ldb_branch , 'u_detail_pur_invoice', rt_transaction)
							lc_dwsetup_initial.f_get_initvalue('d_pur_invoice_line_grid',las_initvalue_cols[li_colnbr],ldb_branch ,la_initvalue )	
							ls_sql_values += "," + string(la_initvalue)
						end if
					NEXT
				end if
				//-values khác--//
				if upper(ls_update_table) = 'BOOKED_SLIP' then
					ls_sql_values += ",1,'SAL_INVOICE','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) +",'"+ls_qty_yn+"','"+ls_val_yn + "')"
				else
					ls_sql_values += ",'BOOKED_SLIP',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
				end if				
				ls_sql_exec = ls_sql + ls_sql_values
				EXECUTE immediate :ls_sql_exec using rt_transaction;				
				ls_sql_values =''
				//-- update matching --//
				if pos(vs_f_objname, 'u_sal_invoice') = 0 then
					if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
						ldb_f_branch_id =vads_copied[li_idx1].getitemnumber(li_row, 'branch_id')
						ls_f_ref_table = upper(vads_copied[li_idx1].describe( "datawindow.table.update"))
						ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
											"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
											"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE,"+ls_mat_cols+")" +&
								" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
								","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+string(ldb_f_doc_id) +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
								",'"+ls_f_ref_table+"','COPY','"+ ls_update_table +"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
											
						EXECUTE immediate :ls_sql_exec using rt_transaction;
						lb_copied = true
					end if
				else
					lb_copied = true
				end if
			NEXT
			exit //-- chỉ có 1 dw source -> 1 dw dest --//
		end if		
	NEXT
	//-- ko có datastore dữ iệu copy--//		
	if not lb_found then 
		lb_update_orders = false
		lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] 
		ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))
		laa_value[1] = ldb_f_version_id
		if ls_f_ref_table = 'BOOKED_SLIP' or  ls_f_ref_table = 'ORDERS' then
			lds_handle.f_add_where( "id", laa_value[])
		else
			lds_handle.f_add_where( "object_ref_id", laa_value[])
		end if
		lds_handle.settransobject( rt_transaction)
		lds_handle.retrieve( )
		FOR li_row = 1 to lds_handle.rowcount()
			//-- check match full--//
			if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
				ldb_mat_val = lds_handle.getitemnumber(li_row, ls_from_match_cols)
				if isnull(ldb_mat_val) then ldb_mat_val = 0
				ldb_f_ref_id = lds_handle.getitemnumber(li_row, 'id')
				ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
				if isnull(ldb_matched_val) then ldb_matched_val = 0
				if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết --//
				if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
					 if isnull(lds_handle.getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
				end if				
			end if //-- kết thúc: check match full--//			
			//-- check common values --//
			if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
				lb_update_orders = true
				for li_idx2 = 1 to upperbound(las_main_chk_cols[])
					if li_row = 1 then
						laa_chk_data[li_idx2] = lds_handle.f_getitemany(li_row, las_main_chk_cols[li_idx2])
					end if
				next					
			end if			
			//-- insert--//
			ldb_id = this.f_create_id_ex( rt_transaction)			
			FOR li_colnbr= 1 to li_colCnt
				ls_coltype = lds_handle.describe(las_from_cols[li_colnbr]+".coltype")
				if left(ls_coltype, 5) = 'numbe' then
					if las_from_cols[li_colnbr] = ls_from_match_cols then
						ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
					else
						if isnull(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else
							ls_sql_values += "," + string(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr]))
						end if
					end if
				elseif left(ls_coltype, 5) = 'char(' then
					if isnull(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",'" + string(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
					end if
				elseif  left(ls_coltype, 5) = 'datet' then
					if isnull(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",to_date('" + string(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
					end if
				else
					ls_sql_values += ",'" + las_from_cols[li_colnbr] +"'"
				end if				
			NEXT
			//-- default values --//		
			if upperbound(las_initvalue_cols[]) > 0 and vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> ''  then
				FOR li_colnbr = 1 to upperbound(las_initvalue_cols[])
					if las_initvalue_cols[li_colnbr] = 'trans_date'  then
						ls_sql_values += ",to_date('" + string(gd_session_date ,gs_w_date_format )+"','"+gs_w_date_format+"')"
					else
						lc_dwsetup_initial.f_init_ids_setup_dw_ex( ldb_branch , 'u_detail_pur_invoice', rt_transaction)
						lc_dwsetup_initial.f_get_initvalue('d_pur_invoice_line_grid',las_initvalue_cols[li_colnbr],ldb_branch ,la_initvalue )	
						ls_sql_values += "," + string(la_initvalue)
					end if
				NEXT
			end if
			//-values khác--//			
			if upper(ls_update_table) = 'BOOKED_SLIP' then
				ls_sql_values += ",1,'SAL_INVOICE','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) + ",'"+ls_qty_yn+"','"+ls_val_yn + "')"
			else
				ls_sql_values += ",'BOOKED_SLIP',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
			end if				
			ls_sql_exec = ls_sql + ls_sql_values
			EXECUTE immediate :ls_sql_exec using rt_transaction;			
			ls_sql_values =''			
			//-- update matching --//
			if pos(vs_f_objname, 'u_sal_invoice') = 0  then
				if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_f_branch_id =lds_handle.getitemnumber(li_row, 'branch_id')
					ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))
					ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
										"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
										"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE ,"+ls_mat_cols+")" +&
							" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
							","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+string(ldb_f_doc_id) +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
							",'"+ls_f_ref_table+"','COPY','"+ ls_update_table+"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
										
					EXECUTE immediate :ls_sql_exec using rt_transaction;			
					lb_copied = true
				end if
			else
				lb_copied = true
			end if
		NEXT				

	end if //--kết thúc: ko có datastore dữ iệu copy--//	
NEXT
destroy lds_handle
if lb_copied then
	commit using rt_transaction;
else
	rollback using rt_transaction;
	gf_messagebox('m.b_obj_instantiate.f_copy_to_po.02','Thông báo','Phiếu đã kết hết','stop','ok',1)
	return 0
end if

return ldb_t_doc_id
end function

public function double f_copy_to_receipt (string vs_f_objname, s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial);string				ls_sql, ls_code, ls_currCode, ls_currName, ls_sql_cols, ls_update_table, ls_related_data, las_related_data[], ls_f_ref_table
string				ls_main_chk_cols, las_main_chk_cols[], ls_related_chk_cols, las_related_chk_cols[], ls_data_tmp, las_initvalue_cols[], ls_qty_yn, ls_val_yn
string				las_from_cols[], ls_from_cols, ls_sql_values, ls_coltype, ls_sql_exec, ls_from_match_cols, las_from_match_cols[], ls_mat_cols, las_mat_cols[]
double			ldb_id,ldb_f_doc_id, ldb_t_doc_id, ldb_version_id, ldb_trans_id, ldb_base_currID, ldb_mat_val, ldb_matched_val, ldb_f_ref_id, ldb_f_branch_id
double			ldb_f_version_id, ldb_branch, ldb_manage_group
int					li_idx, li_idx1, li_idx2, li_row, li_colnbr, li_colCnt, li_pos, li_cnt
boolean			lb_found, lb_copied, lb_update_orders
any				laa_value[], laa_chk_data[], la_initvalue
t_ds_db				lds_handle
c_string				lc_string
c_unit_instance 	lc_unit_ins
c_dwsetup_initial	lc_dwsetup_initial

//--------------------------//
// lấy giao dịch của PO //
//-------------------------//
li_pos =  pos( vstr_dwo_related[1].s_data[1] , "(" )
if li_pos > 0 then
	ls_related_data = mid(vstr_dwo_related[1].s_data[1], li_pos +1, pos(vstr_dwo_related[1].s_data[1] , ')') - (li_pos +1) )
	li_cnt = lc_string.f_Stringtoarray( ls_related_data, ',', las_related_data[])
else
	las_related_data[1] = vstr_dwo_related[1].s_data[1]
end if
ldb_id = double(las_related_data[1] )

lds_handle = create t_ds_db
lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo
ls_update_table = lds_handle.describe( "datawindow.table.update")
if lower(ls_update_table) = 'document' then
	//-- copy header --//
	if pos(vs_f_objname, 'u_receipt')>0 then		//-- nhân bản --//
			select t.trans_hdr_id, t.version_id, t.branch_id , t.manage_group , t1.quantity_yn, t1.value_yn  
				into :ldb_trans_id, :ldb_f_version_id, :ldb_branch, :ldb_manage_group, :ls_qty_yn, :ls_val_yn
				from document t
				join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
				where t.company_id = :gi_user_comp_id
				and t.id =  :ldb_id
				using rt_transaction;
				if isnull(ldb_manage_group) then ldb_manage_group = 0			
				if isnull(ls_qty_yn) then ls_qty_yn = 'N'
				if isnull(ls_val_yn) then ls_val_yn = 'N'
	else
	
		ldb_f_doc_id = ldb_id
		select count(t2.id) into :li_cnt
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'RECEIPT'
		where t.company_id = :gi_user_comp_id
	//	and t.branch_id = :gdb_branch
		and t.id =  :ldb_id
		using rt_transaction;
		if li_cnt = 1 then
			select t2.id, t.version_id, t.branch_id , t2.quantity_yn, t2.value_yn
			into :ldb_trans_id, :ldb_f_version_id, :ldb_branch , :ls_qty_yn, :ls_val_yn
			from document t
			join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
			join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'RECEIPT'
			where t.company_id = :gi_user_comp_id
	//		and t.branch_id = :gdb_branch
			and t.id =  :ldb_id
			using rt_transaction;
			if isnull(ls_qty_yn) then ls_qty_yn = 'N'
			if isnull(ls_val_yn) then ls_val_yn = 'N'		
		else
			gf_messagebox('m.b_obj_instantiate.f_copy_to_po.01','Thông báo','Chưa cài đặt giao dịch cho phiếu chi thuộc nhóm copy','stop','ok',1)
			return -1
		end if
	end if
else
	//-- copy line --//
	select object_ref_id, branch_id into :ldb_f_version_id, :ldb_branch
	from pr_line t
	where t.id = :ldb_id
//	and t.branch_id = :gdb_branch
	and  t.company_id = :gi_user_comp_id
	using rt_transaction;
	
	select count(t2.id) 
	into :li_cnt
	from document t
	join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
	join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
	where t.company_id = :gi_user_comp_id
	and t.branch_id = :ldb_branch
	and t.version_id = :ldb_f_version_id
	using rt_transaction;
	
	if li_cnt = 1 then
		select t2.id, t.id into :ldb_trans_id, :ldb_f_doc_id
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
		where t.company_id = :gi_user_comp_id
		and t.branch_id = :ldb_branch
		and t.version_id =  :ldb_f_version_id
		using rt_transaction;
	else
		gf_messagebox('m.b_obj_instantiate.f_copy_to_po.01','Thông báo','Chưa cài đặt giao dịch cho phiếu thu thuộc nhóm copy','stop','ok',1)
		return -1
	end if	
end if

//---------------------//
// insert document  //
//--------------------//
ldb_t_doc_id = this.f_create_id_ex( rt_transaction)
ldb_version_id =  this.f_create_id_ex( rt_transaction)
ls_code = rdwsetup_initial.f_get_autonumber_ex('code','d_document_payment_grid', rt_transaction)
ls_sql = "INSERT into DOCUMENT(id,company_id, branch_id,object_ref_table, created_by, created_date,last_mdf_by, last_mdf_date,"+&
									" doc_type, version_id, SOB, handled_by, CODE, document_date, TRANS_HDR_ID,status, manage_group)" +&
			" VALUES("+string(ldb_t_doc_id)+ "," + string( gi_user_comp_id ) + "," + string( ldb_branch ) + ",'BOOKED_SLIP' ," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate, " +&
						"'RECEIPT',"+string(ldb_version_id) +", 'F',"+string(gi_userid) + ",'"+ls_code +"', trunc(sysdate)"+ ","+string(ldb_trans_id) +", 'new',"+string(ldb_manage_group)+ ")"
EXECUTE immediate :ls_sql using rt_transaction;



//--------------------//
// insert table  //
//--------------------//

FOR li_idx = 1 to upperbound(vstr_dwo_related[1].s_related_obj_dwo_copy[] )	
	lb_found = false
	lds_handle.dataobject = vstr_dwo_related[1].s_related_obj_dwo_copy[li_idx]
	ls_update_table = lds_handle.describe( "datawindow.table.update")	
	if ls_update_table = 'DOCUMENT' then ls_update_table = 'BOOKED_SLIP'
	
	ls_sql = "INSERT into "+ls_update_table +"(company_id, branch_id, created_by, created_date,last_mdf_by, last_mdf_date,"				
	ls_sql_cols = vstr_dwo_related[1].s_related_obj_column_copy[li_idx]
	ls_sql_cols= trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))
	if vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
		ls_sql_cols += vstr_dwo_related[1].s_related_obj_column_chk[li_idx]
		ls_sql_cols = trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))
		lc_string.f_stringtoarray( vstr_dwo_related[1].s_related_obj_column_chk[li_idx], ';', las_initvalue_cols[])		
	end if	
	
	if right(ls_sql_cols,1) = ',' then 
		if upper(ls_update_table) = 'BOOKED_SLIP' then
			ls_sql += ls_sql_cols + "version_no,doc_type,object_ref_table, object_ref_id,ID,quantity_yn,value_yn)"
		else
			ls_sql += ls_sql_cols + "object_ref_table, object_ref_id,ID)"
		end if
	else
		if upper(ls_update_table) = 'BOOKED_SLIP' then
			ls_sql += ls_sql_cols + ",version_no,doc_type,object_ref_table, object_ref_id,ID,quantity_yn,value_yn)"
		else
			ls_sql += ls_sql_cols + ",object_ref_table, object_ref_id,ID)"
		end if
	end if
	ls_sql += " VALUES("+string( gi_user_comp_id ) + "," + string( ldb_branch ) + "," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate " 
	ls_from_cols = vstr_dwo_related[1].s_main_obj_column_copy[li_idx]
	li_colCnt = lc_string.f_stringtoarray( ls_from_cols, ';', las_from_cols[])
	//-- lấy mat cols--//
	if vstr_dwo_related[1].s_match_f_dwo[li_idx] = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
		ls_from_match_cols = vstr_dwo_related[1].s_match_f_column[li_idx]
		if pos(ls_from_match_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_from_match_cols , ';', las_from_match_cols[])
			ls_from_match_cols = las_from_match_cols[1]
		end if
		ls_mat_cols = vstr_dwo_related[1].s_match_column[li_idx]
		if pos(ls_mat_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_mat_cols , ';', las_mat_cols[])
			ls_mat_cols = las_mat_cols[1]
		end if			
	end if
//	//-- lấy chk cols for update destination--//
//	if  vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
//		ls_related_chk_cols = vstr_dwo_related[1].s_related_obj_column_chk[li_idx]
//		lc_string.f_stringtoarray( ls_related_chk_cols, ';', las_related_chk_cols[])
//	end if
	//-- lấy chk cols source--//
	if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
		ls_main_chk_cols = vstr_dwo_related[1].s_main_obj_column_chk[li_idx]
		lc_string.f_stringtoarray( ls_main_chk_cols, ';', las_main_chk_cols[] )
	end if
	
	FOR li_idx1 = 1 to upperbound(vads_copied[])
		if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
			lb_found = true
			lb_update_orders = false
			FOR li_row = 1 to vads_copied[li_idx1].rowcount()
				//-- check match full--//
				if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_mat_val = vads_copied[li_idx1].getitemnumber(li_row, ls_from_match_cols)
					if isnull(ldb_mat_val) then ldb_mat_val = 0
					ldb_f_ref_id = vads_copied[li_idx1].getitemnumber(li_row, 'id')
					ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
					if isnull(ldb_matched_val) then ldb_matched_val = 0
					if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết--//
					if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
						 if isnull(vads_copied[li_idx1].getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
					end if								
				end if //-- kết thúc: check match full--//
				//-- check common values --//
				if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
					lb_update_orders = true
					for li_idx2 = 1 to upperbound(las_main_chk_cols[])
						if li_row = 1 then
							laa_chk_data[li_idx2] = vads_copied[li_idx1].f_getitemany(li_row, las_main_chk_cols[li_idx2])
						end if
					next					
				end if
				//-- insert--//
				ldb_id = this.f_create_id_ex( rt_transaction)
				FOR li_colnbr= 1 to li_colCnt
					ls_coltype = vads_copied[li_idx1].describe(las_from_cols[li_colnbr]+".coltype")
					if left(ls_coltype, 5) = 'numbe' then
						if las_from_cols[li_colnbr] = ls_from_match_cols then
							ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
						else
							if isnull(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr])) then
								ls_sql_values +=",NULL"
							else	
								ls_sql_values += "," + string(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr]))
							end if
						end if
					elseif left(ls_coltype, 5) = 'char(' then
						if isnull(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else						
							ls_sql_values += ",'" + string(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
						end if
					elseif  left(ls_coltype, 5) = 'datet' then
						if isnull(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else	
							ls_sql_values += ",to_date('" + string(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
						end if
					end if
				NEXT
				//-- default values --//		
				if upperbound(las_initvalue_cols[]) > 0 and vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
					FOR li_colnbr = 1 to upperbound(las_initvalue_cols[])
						if las_initvalue_cols[li_colnbr] = 'trans_date'  then
							ls_sql_values += ",to_date('" + string(gd_session_date ,gs_w_date_format )+"','"+gs_w_date_format+"')"
						else
							lc_dwsetup_initial.f_init_ids_setup_dw_ex( ldb_branch , 'U_PAYMENT', rt_transaction)
							lc_dwsetup_initial.f_get_initvalue(vstr_dwo_related[1].s_related_obj_dwo_copy[li_idx] ,las_initvalue_cols[li_colnbr],ldb_branch ,la_initvalue )	
							ls_sql_values += "," + string(la_initvalue)
						end if
					NEXT
				end if
				//-values khác--//
				if upper(ls_update_table) = 'BOOKED_SLIP' then
					ls_sql_values += ",1,'RECEIPT','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) +",'"+ls_qty_yn+"','"+ls_val_yn + "')"
				else
					ls_sql_values += ",'BOOKED_SLIP',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
				end if				
				ls_sql_exec = ls_sql + ls_sql_values
				EXECUTE immediate :ls_sql_exec using rt_transaction;				
				ls_sql_values =''
				//-- update matching --//
				if pos(vs_f_objname, 'u_receipt') = 0 then
					if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
						ldb_f_branch_id =vads_copied[li_idx1].getitemnumber(li_row, 'branch_id')
						ls_f_ref_table = upper(vads_copied[li_idx1].describe( "datawindow.table.update"))
						ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
											"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
											"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE,"+ls_mat_cols+")" +&
								" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
								","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+string(ldb_f_doc_id) +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
								",'"+ls_f_ref_table+"','COPY','"+ ls_update_table +"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
											
						EXECUTE immediate :ls_sql_exec using rt_transaction;
						lb_copied = true
					end if
				else
					lb_copied = true
				end if
			NEXT
			exit //-- chỉ có 1 dw source -> 1 dw dest --//
		end if		
	NEXT
	//-- ko có datastore dữ iệu copy--//		
	if not lb_found then 
		lb_update_orders = false
		lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] 
		ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))
		laa_value[1] = ldb_f_version_id
		if ls_f_ref_table = 'BOOKED_SLIP' or  ls_f_ref_table = 'ORDERS' then
			lds_handle.f_add_where( "id", laa_value[])
		elseif ls_f_ref_table = 'DOCUMENT' then
			lds_handle.f_add_where( "version_id", laa_value[])
		else
			lds_handle.f_add_where( "object_ref_id", laa_value[])
		end if
		lds_handle.settransobject( rt_transaction)
		lds_handle.retrieve( )
		FOR li_row = 1 to lds_handle.rowcount()
			//-- check match full--//
			if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
				ldb_mat_val = lds_handle.getitemnumber(li_row, ls_from_match_cols)
				if isnull(ldb_mat_val) then ldb_mat_val = 0
				ldb_f_ref_id = lds_handle.getitemnumber(li_row, 'id')
				ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
				if isnull(ldb_matched_val) then ldb_matched_val = 0
				if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết --//
				if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
					 if isnull(lds_handle.getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
				end if				
			end if //-- kết thúc: check match full--//			
			//-- check common values --//
			if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
				lb_update_orders = true
				for li_idx2 = 1 to upperbound(las_main_chk_cols[])
					if li_row = 1 then
						laa_chk_data[li_idx2] = lds_handle.f_getitemany(li_row, las_main_chk_cols[li_idx2])
					end if
				next					
			end if			
			//-- insert--//
			ldb_id = this.f_create_id_ex( rt_transaction)			
			FOR li_colnbr= 1 to li_colCnt
				ls_coltype = lds_handle.describe(las_from_cols[li_colnbr]+".coltype")
				if left(ls_coltype, 5) = 'numbe' then
					if las_from_cols[li_colnbr] = ls_from_match_cols then
						ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
					else
						if isnull(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else
							ls_sql_values += "," + string(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr]))
						end if
					end if
				elseif left(ls_coltype, 5) = 'char(' then
					if isnull(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",'" + string(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
					end if
				elseif  left(ls_coltype, 5) = 'datet' then
					if isnull(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",to_date('" + string(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
					end if
				else
					ls_sql_values += ",'" + las_from_cols[li_colnbr] +"'"
				end if				
			NEXT
			//-- default values --//		
			if upperbound(las_initvalue_cols[]) > 0 and vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
				FOR li_colnbr = 1 to upperbound(las_initvalue_cols[])
					if las_initvalue_cols[li_colnbr] = 'trans_date'  then
						ls_sql_values += ",to_date('" + string(gd_session_date ,gs_w_date_format )+"','"+gs_w_date_format+"')"
					else
						lc_dwsetup_initial.f_init_ids_setup_dw_ex( ldb_branch , 'u_detail_pur_invoice', rt_transaction)
						lc_dwsetup_initial.f_get_initvalue('d_pur_invoice_line_grid',las_initvalue_cols[li_colnbr],ldb_branch ,la_initvalue )	
						ls_sql_values += "," + string(la_initvalue)
					end if
				NEXT
			end if
			//-values khác--//			
			if upper(ls_update_table) = 'BOOKED_SLIP' then
				ls_sql_values += ",1,'RECEIPT','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) + ",'"+ls_qty_yn+"','"+ls_val_yn + "')"
			else
				ls_sql_values += ",'BOOKED_SLIP',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
			end if				
			ls_sql_exec = ls_sql + ls_sql_values
			EXECUTE immediate :ls_sql_exec using rt_transaction;			
			ls_sql_values =''			
			//-- update matching --//
			if pos(vs_f_objname, 'u_receipt') = 0  then
				if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_f_branch_id =lds_handle.getitemnumber(li_row, 'branch_id')
					ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))
					ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
										"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
										"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE ,"+ls_mat_cols+")" +&
							" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
							","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+string(ldb_f_doc_id) +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
							",'"+ls_f_ref_table+"','COPY','"+ ls_update_table+"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
										
					EXECUTE immediate :ls_sql_exec using rt_transaction;			
					lb_copied = true
				end if
			else
				lb_copied = true
			end if
		NEXT				

	end if //--kết thúc: ko có datastore dữ iệu copy--//	
NEXT
destroy lds_handle
if lb_copied then
	commit using rt_transaction;
else
	rollback using rt_transaction;
	gf_messagebox('m.b_obj_instantiate.f_copy_to_po.02','Thông báo','Phiếu đã kết hết','stop','ok',1)
	return 0
end if

return ldb_t_doc_id
end function

public function double f_copy_to_bank_voucher (string vs_f_objname, s_str_dwo_related vstr_dwo_related[], t_ds_db vads_copied[], ref t_transaction rt_transaction, ref c_dwsetup_initial rdwsetup_initial);string				ls_sql, ls_code, ls_currCode, ls_currName, ls_sql_cols, ls_update_table, ls_related_data, las_related_data[], ls_f_ref_table
string				ls_main_chk_cols, las_main_chk_cols[], ls_related_chk_cols, las_related_chk_cols[], ls_data_tmp, las_initvalue_cols[], ls_qty_yn, ls_val_yn
string				las_from_cols[], ls_from_cols, ls_sql_values, ls_coltype, ls_sql_exec, ls_from_match_cols, las_from_match_cols[], ls_mat_cols, las_mat_cols[]
double			ldb_id,ldb_f_doc_id, ldb_t_doc_id, ldb_version_id, ldb_trans_id, ldb_base_currID, ldb_mat_val, ldb_matched_val, ldb_f_ref_id, ldb_f_branch_id
double			ldb_f_version_id, ldb_branch, ldb_manage_group
int					li_idx, li_idx1, li_idx2, li_row, li_colnbr, li_colCnt, li_pos, li_cnt
boolean			lb_found, lb_copied, lb_update_orders
any				laa_value[], laa_chk_data[], la_initvalue
t_ds_db				lds_handle
c_string				lc_string
c_unit_instance 	lc_unit_ins
c_dwsetup_initial	lc_dwsetup_initial

//--------------------------//
// lấy giao dịch của PO //
//-------------------------//
li_pos =  pos( vstr_dwo_related[1].s_data[1] , "(" )
if li_pos > 0 then
	ls_related_data = mid(vstr_dwo_related[1].s_data[1], li_pos +1, pos(vstr_dwo_related[1].s_data[1] , ')') - (li_pos +1) )
	li_cnt = lc_string.f_Stringtoarray( ls_related_data, ',', las_related_data[])
else
	las_related_data[1] = vstr_dwo_related[1].s_data[1]
end if
ldb_id = double(las_related_data[1] )

lds_handle = create t_ds_db
lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo
ls_update_table = lds_handle.describe( "datawindow.table.update")
if lower(ls_update_table) = 'document' then
	//-- copy header --//
	if pos(vs_f_objname, 'u_bank_voucher_payment')>0 then		//-- nhân bản --//
			select t.trans_hdr_id, t.version_id, t.branch_id , t.manage_group , t1.quantity_yn, t1.value_yn  
				into :ldb_trans_id, :ldb_f_version_id, :ldb_branch, :ldb_manage_group, :ls_qty_yn, :ls_val_yn
				from document t
				join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
				where t.company_id = :gi_user_comp_id
				and t.id =  :ldb_id
				using rt_transaction;
				if isnull(ldb_manage_group) then ldb_manage_group = 0		
				if isnull(ls_qty_yn) then ls_qty_yn = 'N'
				if isnull(ls_val_yn) then ls_val_yn = 'N'				
	else
	
		ldb_f_doc_id = ldb_id
		select count(t2.id) into :li_cnt
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'BANK_VOUCHER'
		where t.company_id = :gi_user_comp_id
	//	and t.branch_id = :gdb_branch
		and t.id =  :ldb_id
		using rt_transaction;
		if li_cnt = 1 then
			select t2.id, t.version_id, t.branch_id , t2.quantity_yn, t2.value_yn
			into :ldb_trans_id, :ldb_f_version_id, :ldb_branch , :ls_qty_yn, :ls_val_yn
			from document t
			join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
			join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'BANK_VOUCHER'
			where t.company_id = :gi_user_comp_id
	//		and t.branch_id = :gdb_branch
			and t.id =  :ldb_id
			using rt_transaction;
			if isnull(ls_qty_yn) then ls_qty_yn = 'N'
			if isnull(ls_val_yn) then ls_val_yn = 'N'		
		else
			gf_messagebox('m.b_obj_instantiate.f_copy_to_po.01','Thông báo','Chưa cài đặt giao dịch cho phiếu chi thuộc nhóm copy','stop','ok',1)
			return -1
		end if
	end if
else
	//-- copy line --//
	select object_ref_id, branch_id into :ldb_f_version_id, :ldb_branch
	from pr_line t
	where t.id = :ldb_id
//	and t.branch_id = :gdb_branch
	and  t.company_id = :gi_user_comp_id
	using rt_transaction;
	
	select count(t2.id) 
	into :li_cnt
	from document t
	join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
	join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
	where t.company_id = :gi_user_comp_id
	and t.branch_id = :ldb_branch
	and t.version_id = :ldb_f_version_id
	using rt_transaction;
	
	if li_cnt = 1 then
		select t2.id, t.id into :ldb_trans_id, :ldb_f_doc_id
		from document t
		join trans_setup_hdr t1 on t1.id = t.trans_hdr_id
		join trans_setup_hdr t2 on t2.TRANS_GROUP = t1.TRANS_GROUP and t2.company_id= t1.company_id and t2.branch_id= t1.branch_id and t2.doc_type = 'PO'
		where t.company_id = :gi_user_comp_id
		and t.branch_id = :ldb_branch
		and t.version_id =  :ldb_f_version_id
		using rt_transaction;
	else
		gf_messagebox('m.b_obj_instantiate.f_copy_to_po.01','Thông báo','Chưa cài đặt giao dịch cho PO thuộc nhóm copy','stop','ok',1)
		return -1
	end if	
end if

//---------------------//
// insert document  //
//--------------------//
ldb_t_doc_id = this.f_create_id_ex( rt_transaction)
ldb_version_id =  this.f_create_id_ex( rt_transaction)
ls_code = rdwsetup_initial.f_get_autonumber_ex('code','d_document_payment_grid', rt_transaction)
ls_sql = "INSERT into DOCUMENT(id,company_id, branch_id,object_ref_table, created_by, created_date,last_mdf_by, last_mdf_date,"+&
									" doc_type, version_id, SOB, handled_by, CODE, document_date, TRANS_HDR_ID,status, manage_group)" +&
			" VALUES("+string(ldb_t_doc_id)+ "," + string( gi_user_comp_id ) + "," + string( ldb_branch ) + ",'BOOKED_SLIP' ," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate, " +&
						"'BANK_VOUCHER',"+string(ldb_version_id) +", 'F',"+string(gi_userid) + ",'"+ls_code +"', trunc(sysdate)"+ ","+string(ldb_trans_id) +", 'new',"+string(ldb_manage_group)+ ")"
EXECUTE immediate :ls_sql using rt_transaction;



//--------------------//
// insert table  //
//--------------------//

FOR li_idx = 1 to upperbound(vstr_dwo_related[1].s_related_obj_dwo_copy[] )	
	lb_found = false
	lds_handle.dataobject = vstr_dwo_related[1].s_related_obj_dwo_copy[li_idx]
	ls_update_table = lds_handle.describe( "datawindow.table.update")	
	if ls_update_table = 'DOCUMENT' then ls_update_table = 'BOOKED_SLIP'
	
	ls_sql = "INSERT into "+ls_update_table +"(company_id, branch_id, created_by, created_date,last_mdf_by, last_mdf_date,"				
	ls_sql_cols = vstr_dwo_related[1].s_related_obj_column_copy[li_idx]
	ls_sql_cols= trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))
	if vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
		ls_sql_cols += vstr_dwo_related[1].s_related_obj_column_chk[li_idx]
		ls_sql_cols = trim(lc_string.f_globalreplace(ls_sql_cols , ';', ','))
		lc_string.f_stringtoarray( vstr_dwo_related[1].s_related_obj_column_chk[li_idx], ';', las_initvalue_cols[])		
	end if	
	
	if right(ls_sql_cols,1) = ',' then 
		if upper(ls_update_table) = 'BOOKED_SLIP' then
			ls_sql += ls_sql_cols + "version_no,doc_type,object_ref_table, object_ref_id,ID,quantity_yn,value_yn)"
		else
			ls_sql += ls_sql_cols + "object_ref_table, object_ref_id,ID)"
		end if
	else
		if upper(ls_update_table) = 'BOOKED_SLIP' then
			ls_sql += ls_sql_cols + ",version_no,doc_type,object_ref_table, object_ref_id,ID,quantity_yn,value_yn)"
		else
			ls_sql += ls_sql_cols + ",object_ref_table, object_ref_id,ID)"
		end if
	end if
	ls_sql += " VALUES("+string( gi_user_comp_id ) + "," + string( ldb_branch ) + "," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate " 
	ls_from_cols = vstr_dwo_related[1].s_main_obj_column_copy[li_idx]
	li_colCnt = lc_string.f_stringtoarray( ls_from_cols, ';', las_from_cols[])
	//-- lấy mat cols--//
	if vstr_dwo_related[1].s_match_f_dwo[li_idx] = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
		ls_from_match_cols = vstr_dwo_related[1].s_match_f_column[li_idx]
		if pos(ls_from_match_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_from_match_cols , ';', las_from_match_cols[])
			ls_from_match_cols = las_from_match_cols[1]
		end if
		ls_mat_cols = vstr_dwo_related[1].s_match_column[li_idx]
		if pos(ls_mat_cols, ';') > 0 then
			lc_string.f_stringtoarray(ls_mat_cols , ';', las_mat_cols[])
			ls_mat_cols = las_mat_cols[1]
		end if			
	end if
//	//-- lấy chk cols for update destination--//
//	if  vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
//		ls_related_chk_cols = vstr_dwo_related[1].s_related_obj_column_chk[li_idx]
//		lc_string.f_stringtoarray( ls_related_chk_cols, ';', las_related_chk_cols[])
//	end if
	//-- lấy chk cols source--//
	if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
		ls_main_chk_cols = vstr_dwo_related[1].s_main_obj_column_chk[li_idx]
		lc_string.f_stringtoarray( ls_main_chk_cols, ';', las_main_chk_cols[] )
	end if
	
	FOR li_idx1 = 1 to upperbound(vads_copied[])
		if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] then
			lb_found = true
			lb_update_orders = false
			FOR li_row = 1 to vads_copied[li_idx1].rowcount()
				//-- check match full--//
				if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_mat_val = vads_copied[li_idx1].getitemnumber(li_row, ls_from_match_cols)
					if isnull(ldb_mat_val) then ldb_mat_val = 0
					ldb_f_ref_id = vads_copied[li_idx1].getitemnumber(li_row, 'id')
					ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
					if isnull(ldb_matched_val) then ldb_matched_val = 0
					if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết--//
					if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
						 if isnull(vads_copied[li_idx1].getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
					end if								
				end if //-- kết thúc: check match full--//
				//-- check common values --//
				if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
					lb_update_orders = true
					for li_idx2 = 1 to upperbound(las_main_chk_cols[])
						if li_row = 1 then
							laa_chk_data[li_idx2] = vads_copied[li_idx1].f_getitemany(li_row, las_main_chk_cols[li_idx2])
						end if
					next					
				end if
				//-- insert--//
				ldb_id = this.f_create_id_ex( rt_transaction)
				FOR li_colnbr= 1 to li_colCnt
					ls_coltype = vads_copied[li_idx1].describe(las_from_cols[li_colnbr]+".coltype")
					if left(ls_coltype, 5) = 'numbe' then
						if las_from_cols[li_colnbr] = ls_from_match_cols then
							ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
						else
							if isnull(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr])) then
								ls_sql_values +=",NULL"
							else	
								ls_sql_values += "," + string(vads_copied[li_idx1].getitemnumber(li_row ,las_from_cols[li_colnbr]))
							end if
						end if
					elseif left(ls_coltype, 5) = 'char(' then
						if isnull(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else						
							ls_sql_values += ",'" + string(vads_copied[li_idx1].getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
						end if
					elseif  left(ls_coltype, 5) = 'datet' then
						if isnull(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else	
							ls_sql_values += ",to_date('" + string(vads_copied[li_idx1].getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
						end if
					end if
				NEXT
				//-- default values --//		
				if upperbound(las_initvalue_cols[]) > 0 and vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
					FOR li_colnbr = 1 to upperbound(las_initvalue_cols[])
						if las_initvalue_cols[li_colnbr] = 'trans_date'  then
							ls_sql_values += ",to_date('" + string(gd_session_date ,gs_w_date_format )+"','"+gs_w_date_format+"')"
						else
							lc_dwsetup_initial.f_init_ids_setup_dw_ex( ldb_branch , 'U_PAYMENT', rt_transaction)
							lc_dwsetup_initial.f_get_initvalue(vstr_dwo_related[1].s_related_obj_dwo_copy[li_idx] ,las_initvalue_cols[li_colnbr],ldb_branch ,la_initvalue )	
							ls_sql_values += "," + string(la_initvalue)
						end if
					NEXT
				end if
				//-values khác--//
				if upper(ls_update_table) = 'BOOKED_SLIP' then
					ls_sql_values += ",1,'BANK_VOUCHER','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) +",'"+ls_qty_yn+"','"+ls_val_yn + "')"
				else
					ls_sql_values += ",'BOOKED_SLIP',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
				end if				
				ls_sql_exec = ls_sql + ls_sql_values
				EXECUTE immediate :ls_sql_exec using rt_transaction;				
				ls_sql_values =''
				//-- update matching --//
				if pos(vs_f_objname, 'u_bank_voucher') = 0 then
					if vads_copied[li_idx1].dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
						ldb_f_branch_id =vads_copied[li_idx1].getitemnumber(li_row, 'branch_id')
						ls_f_ref_table = upper(vads_copied[li_idx1].describe( "datawindow.table.update"))
						ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
											"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
											"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE,"+ls_mat_cols+")" +&
								" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
								","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+string(ldb_f_doc_id) +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
								",'"+ls_f_ref_table+"','COPY','"+ ls_update_table +"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
											
						EXECUTE immediate :ls_sql_exec using rt_transaction;
						lb_copied = true
					end if
				else
					lb_copied = true
				end if
			NEXT
			exit //-- chỉ có 1 dw source -> 1 dw dest --//
		end if		
	NEXT
	//-- ko có datastore dữ iệu copy--//		
	if not lb_found then 
		lb_update_orders = false
		lds_handle.dataobject = vstr_dwo_related[1].s_main_obj_dwo_copy[li_idx] 
		ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))
		laa_value[1] = ldb_f_version_id
		if ls_f_ref_table = 'BOOKED_SLIP' or  ls_f_ref_table = 'ORDERS' then
			lds_handle.f_add_where( "id", laa_value[])
		elseif ls_f_ref_table = 'DOCUMENT' then
			lds_handle.f_add_where( "version_id", laa_value[])
		else
			lds_handle.f_add_where( "object_ref_id", laa_value[])
		end if
		lds_handle.settransobject( rt_transaction)
		lds_handle.retrieve( )
		FOR li_row = 1 to lds_handle.rowcount()
			//-- check match full--//
			if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
				ldb_mat_val = lds_handle.getitemnumber(li_row, ls_from_match_cols)
				if isnull(ldb_mat_val) then ldb_mat_val = 0
				ldb_f_ref_id = lds_handle.getitemnumber(li_row, 'id')
				ldb_matched_val = rt_transaction.f_get_matched_value(ls_mat_cols, ldb_f_ref_id, ls_update_table)
				if isnull(ldb_matched_val) then ldb_matched_val = 0
				if ldb_matched_val >= ldb_mat_val then continue //-- đã copy hết --//
				if vstr_dwo_related[1].s_match_f_col_obj[li_idx] <> '' then
					 if isnull(lds_handle.getitemnumber(li_row, vstr_dwo_related[1].s_match_f_col_obj[li_idx])) then continue //-- chưa có mã hàng: bỏ qua ko copy --//
				end if				
			end if //-- kết thúc: check match full--//			
			//-- check common values --//
			if  vstr_dwo_related[1].s_main_obj_column_chk[li_idx] <> '' then
				lb_update_orders = true
				for li_idx2 = 1 to upperbound(las_main_chk_cols[])
					if li_row = 1 then
						laa_chk_data[li_idx2] = lds_handle.f_getitemany(li_row, las_main_chk_cols[li_idx2])
					end if
				next					
			end if			
			//-- insert--//
			ldb_id = this.f_create_id_ex( rt_transaction)			
			FOR li_colnbr= 1 to li_colCnt
				ls_coltype = lds_handle.describe(las_from_cols[li_colnbr]+".coltype")
				if left(ls_coltype, 5) = 'numbe' then
					if las_from_cols[li_colnbr] = ls_from_match_cols then
						ls_sql_values += "," + string(ldb_mat_val - ldb_matched_val)
					else
						if isnull(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr])) then
							ls_sql_values +=",NULL"
						else
							ls_sql_values += "," + string(lds_handle.getitemnumber(li_row ,las_from_cols[li_colnbr]))
						end if
					end if
				elseif left(ls_coltype, 5) = 'char(' then
					if isnull(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",'" + string(lds_handle.getitemstring(li_row ,las_from_cols[li_colnbr]))+"'"
					end if
				elseif  left(ls_coltype, 5) = 'datet' then
					if isnull(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr])) then
						ls_sql_values +=",NULL"
					else
						ls_sql_values += ",to_date('" + string(lds_handle.getitemdatetime(li_row ,las_from_cols[li_colnbr]),gs_w_date_format )+"','"+gs_w_date_format+"')"
					end if
				else
					ls_sql_values += ",'" + las_from_cols[li_colnbr] +"'"
				end if				
			NEXT
			//-- default values --//		
			if upperbound(las_initvalue_cols[]) > 0 and vstr_dwo_related[1].s_related_obj_column_chk[li_idx] <> '' then
				FOR li_colnbr = 1 to upperbound(las_initvalue_cols[])
					if las_initvalue_cols[li_colnbr] = 'trans_date'  then
						ls_sql_values += ",to_date('" + string(gd_session_date ,gs_w_date_format )+"','"+gs_w_date_format+"')"
					else
						lc_dwsetup_initial.f_init_ids_setup_dw_ex( ldb_branch , 'u_detail_pur_invoice', rt_transaction)
						lc_dwsetup_initial.f_get_initvalue('d_pur_invoice_line_grid',las_initvalue_cols[li_colnbr],ldb_branch ,la_initvalue )	
						ls_sql_values += "," + string(la_initvalue)
					end if
				NEXT
			end if
			//-values khác--//			
			if upper(ls_update_table) = 'BOOKED_SLIP' then
				ls_sql_values += ",1,'BANK_VOUCHER','DOCUMENT',"+string(ldb_t_doc_id) + "," +string(ldb_version_id) + ",'"+ls_qty_yn+"','"+ls_val_yn + "')"
			else
				ls_sql_values += ",'BOOKED_SLIP',"+string(ldb_version_id) + "," +string(ldb_id) + ")"
			end if				
			ls_sql_exec = ls_sql + ls_sql_values
			EXECUTE immediate :ls_sql_exec using rt_transaction;			
			ls_sql_values =''			
			//-- update matching --//
			if pos(vs_f_objname, 'u_bank_voucher') = 0  then
				if lds_handle.dataobject = vstr_dwo_related[1].s_match_f_dwo[li_idx] then
					ldb_f_branch_id =lds_handle.getitemnumber(li_row, 'branch_id')
					ls_f_ref_table = upper(lds_handle.describe( "datawindow.table.update"))
					ls_sql_exec = "INSERT into MATCHING(id, company_id, branch_id,created_by, created_date,last_mdf_by, last_mdf_date," +&
										"F_REF_ID,T_REF_ID,MATCHING_DATE,F_DOC_ID,T_DOC_ID,F_BRANCH_ID,T_BRANCH_ID,"+&
										"F_REF_TABLE,MATCH_TYPE,T_REF_TABLE ,"+ls_mat_cols+")" +&
							" VALUES( seq_table_id.nextval," +string(gi_user_comp_id) +","+string(ldb_branch )+","+string(gi_userid )+",sysdate"+","+string(gi_userid )+",sysdate" +&
							","+string(ldb_f_ref_id )+","+string(ldb_id)+",sysdate,"+string(ldb_f_doc_id) +","+string(ldb_t_doc_id)+","+string(ldb_f_branch_id)+","+string(ldb_branch)+&
							",'"+ls_f_ref_table+"','COPY','"+ ls_update_table+"'," +string(ldb_mat_val - ldb_matched_val)+ ")"
										
					EXECUTE immediate :ls_sql_exec using rt_transaction;			
					lb_copied = true
				end if
			else
				lb_copied = true
			end if
		NEXT				

	end if //--kết thúc: ko có datastore dữ iệu copy--//	
NEXT
destroy lds_handle
if lb_copied then
	commit using rt_transaction;
else
	rollback using rt_transaction;
	gf_messagebox('m.b_obj_instantiate.f_copy_to_po.02','Thông báo','Phiếu đã kết hết','stop','ok',1)
	return 0
end if

return ldb_t_doc_id
end function

public function string f_get_branch_code (double vdb_branch_id);int			li_cnt
string		ls_name
	

select count(id) into :li_cnt from legal_entity where id = :vdb_branch_id using sqlca;
if li_cnt <> 1 then return ''

select code into :ls_name from legal_entity where id = :vdb_branch_id using sqlca;


return ls_name

end function

public function double f_get_doc_id (t_dw_mpl vdw_handling, ref t_transaction rt_transaction);
double		ldb_doc_id, ldb_version_id
string			ls_ref_table
long			ll_cnt


ls_ref_table = upper(vdw_handling.describe('datawindow.table.update'))
if ls_ref_table = 'DOCUMENT' then
	ldb_doc_id = vdw_handling.getitemnumber(vdw_handling.getrow(), 'ID')
elseif  ls_ref_table = 'BOOKED_SLIP' or ls_ref_table = 'ORDERS'  then
	ldb_doc_id = vdw_handling.getitemnumber(vdw_handling.getrow(), 'OBJECT_REF_ID')
else
	if vdw_handling.describe('doc_version.coltype') = '!' then
		ldb_version_id = vdw_handling.getitemnumber(vdw_handling.getrow(), 'object_ref_id')
	else
		ldb_version_id = vdw_handling.getitemnumber(vdw_handling.getrow(), 'doc_version')
	end if
	select count(id) into :ll_cnt  from document where version_id = :ldb_version_id using rt_transaction;
	if ll_cnt = 1 then
		select id into :ldb_doc_id from document where version_id = :ldb_version_id using rt_transaction;
	end if
end if

return ldb_doc_id
end function

public function boolean f_check_id_exists_table (double vdb_id, string vs_table, ref t_transaction rt_transaction);
string		ls_sql

ls_sql = 'Select  ID from ' +vs_table + ' where id = '+ string(vdb_id)

execute immediate :ls_sql using rt_transaction;

if rt_transaction.sqlnrows > 0 then
	return true
else
	return false
end if

end function

public function integer f_get_cust_info (string vs_key, double vdb_cust_id, string vs_col_string, ref jsonpackage rjpk_info, ref t_transaction rt_transaction);int				li_rtn
string			ls_sql, ls_sql_syntax, ls_rtn
t_ds_db		lds_datastore
c_string		lc_string
//------------------//

if right(trim(vs_col_string),1) = ';' then
	ls_sql = left(trim(vs_col_string), len(trim(vs_col_string))-1)
	
end if
ls_sql = lc_string.f_globalreplace( ls_sql, ';', ',')

ls_sql = "SELECT " + ls_sql  + " FROM customer c  " &
											+ " left join v_exchange_rate v on v.OBJECT_REF_ID = c.default_currency  " &
											+ " where c.object_ref_ID = "+ string(vdb_cust_id)
											
ls_sql_syntax = rt_transaction.syntaxfromsql(ls_sql, "", ls_rtn)
if len(ls_rtn) > 0 then
	 MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_rtn)
	 return -1
end if
//B2: Retrieve tên cột
lds_datastore = create t_ds_db
lds_datastore.create( ls_sql_syntax, ls_rtn)
if len(ls_rtn) > 0 then
	 MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_rtn)
	 destroy lds_datastore
	 return -1
end if

lds_datastore.f_settransobject( rt_transaction)
if lds_datastore.retrieve( ) = 1 then
	li_rtn = rjpk_info.SetValueByDataWindow ( vs_key, lds_datastore , false )
	ls_rtn = rjpk_info.GetJsonString()
else
	li_rtn = 0
end if 
destroy lds_datastore
return li_rtn
end function

public function integer f_get_cust_info (string vs_key, double vdb_cust_id, string vs_col_string, ref jsonparser rjpsr_info, ref t_transaction rt_transaction);int				li_rtn
string			ls_sql, ls_sql_syntax, ls_rtn, ls_json
t_ds_db			lds_datastore
c_string			lc_string
Jsonpackage	ljpk_cust		
//------------------//

if right(trim(vs_col_string),1) = ';' then
	ls_sql = left(trim(vs_col_string), len(trim(vs_col_string))-1)
	
end if
ls_sql = lc_string.f_globalreplace( ls_sql, ';', ',')

ls_sql = "SELECT " + ls_sql  + " FROM customer c  " &
											+ " left join v_exchange_rate v on v.OBJECT_REF_ID = c.default_currency  " &
											+ " where c.object_ref_ID = "+ string(vdb_cust_id)
											
ls_sql_syntax = rt_transaction.syntaxfromsql(ls_sql, "", ls_rtn)
if len(ls_rtn) > 0 then
	 MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_rtn)
	 return -1
end if
//B2: Retrieve tên cột
lds_datastore = create t_ds_db
lds_datastore.create( ls_sql_syntax, ls_rtn)
if len(ls_rtn) > 0 then
	 MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_rtn)
	 destroy lds_datastore
	 return -1
end if
lds_datastore.f_settransobject( rt_transaction)

if lds_datastore.retrieve( ) = 1 then
	ljpk_cust = create Jsonpackage
	li_rtn = ljpk_cust.SetValueByDataWindow ( vs_key, lds_datastore , false )
	if li_rtn = 1 then
		ls_json = ljpk_cust.getjsonstring( )
		ls_rtn = rjpsr_info.LoadString(ls_json)
	end if
else
	li_rtn = 0
end if 
destroy lds_datastore
return li_rtn
end function

public function integer f_get_cust_info (double vdb_cust_id, string vs_col_string, ref datastore rds_cust_info, ref t_transaction rt_transaction);int				li_rtn
string			ls_sql, ls_sql_syntax, ls_rtn, ls_json

c_string			lc_string
Jsonpackage	ljpk_cust		
//------------------//

if right(trim(vs_col_string),1) = ';' then
	ls_sql = left(trim(vs_col_string), len(trim(vs_col_string))-1)
	
end if
ls_sql = lc_string.f_globalreplace( ls_sql, ';', ',')

ls_sql = "SELECT " + ls_sql  + " FROM customer c  " &
											+ " left join v_exchange_rate v on v.OBJECT_REF_ID = c.default_currency  " &
											+ " where c.object_ref_ID = "+ string(vdb_cust_id)
											
ls_sql_syntax = rt_transaction.syntaxfromsql(ls_sql, "", ls_rtn)
if len(ls_rtn) > 0 then
	 MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_rtn)
	 return -1
end if
//B2: Retrieve tên cột
rds_cust_info.create( ls_sql_syntax, ls_rtn)
if len(ls_rtn) > 0 then
	 MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_rtn)
	 return -1
end if
rds_cust_info.settransobject( rt_transaction)
li_rtn =  rds_cust_info.retrieve( ) 

return li_rtn
end function

public function integer f_get_cust_info (double vdb_cust_id, string vs_col_string, ref string rsa_values[], ref t_transaction rt_transaction);int				li_cnt
string			ls_sql, lsa_cols[]
c_string					lc_string
DynamicStagingArea	ldsa_stage

//------------------//

li_cnt = lc_string.f_stringtoarray(vs_col_string, ';', lsa_cols[])

if right(trim(vs_col_string),1) = ';' then
	ls_sql = left(trim(vs_col_string), len(trim(vs_col_string))-1)	
end if
ls_sql = lc_string.f_globalreplace( ls_sql, ';', ',')

ls_sql = "SELECT " + ls_sql  + " FROM customer c  " &
											+ " left join v_exchange_rate v on v.OBJECT_REF_ID = c.default_currency  " &
											+ " where c.object_ref_ID = "+ string(vdb_cust_id)
connect using sqlca;											
DECLARE lcur_info DYNAMIC CURSOR FOR SQLSA ;
PREPARE SQLSA FROM :ls_sql ;
OPEN DYNAMIC lcur_info ;
	
if li_cnt = 5 then
	FETCH lcur_info INTO :rsa_values[1],:rsa_values[2],:rsa_values[3],:rsa_values[4],:rsa_values[5] ;
end if
CLOSE lcur_info ;
disconnect using sqlca;		

return li_cnt
end function

on b_obj_instantiate.create
call super::create
end on

on b_obj_instantiate.destroy
call super::destroy
end on

