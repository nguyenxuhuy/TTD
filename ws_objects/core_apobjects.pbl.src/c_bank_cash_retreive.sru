$PBExportHeader$c_bank_cash_retreive.sru
forward
global type c_bank_cash_retreive from b_doc
end type
end forward

global type c_bank_cash_retreive from b_doc
end type
global c_bank_cash_retreive c_bank_cash_retreive

forward prototypes
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_str_unit ()
public subroutine f_set_dwo_related ()
public subroutine f_set_str_streamvalue ()
public function integer f_resize_fixedpart_grid ()
public function integer f_resize_fixedpart_form ()
public function integer f_reset_fixedpart_grid ()
public function integer f_get_allocation_info (ref string ras_allocation_info[])
public function integer f_set_ds_4_posting ()
end prototypes

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name =  'b_po;b_so_return;b_goods_receipt;b_payment;b_bank_voucher;'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_doc_bank_cash_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_doc_bank_cash_grid'
istr_dwo[1].b_master = false
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_details = '' 
istr_dwo[1].b_ref_table_yn  = false
istr_dwo[1].s_ref_table_field = ''
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = false
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_gb_name = 'gb_6'
istr_dwo[1].s_description = 'Truy vấn thu/chi'

/*
istr_dwo[2].s_dwo_default =  'd_document_ap_form'
istr_dwo[2].s_dwo_form = 'd_document_ap_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = false
istr_dwo[2].b_detail = false
istr_dwo[2].b_cascade_del = false
istr_dwo[2].s_dwo_details = ''
istr_dwo[2].s_dwo_master = ''
istr_dwo[2].s_dwo_shared = ''
istr_dwo[2].s_master_keycol = ''
istr_dwo[2].s_detail_keycol = ''
istr_dwo[2].b_ref_table_yn  = false
istr_dwo[2].s_ref_table_field = ''
istr_dwo[2].b_relation_1_1 = true
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].b_focus_master = true
istr_dwo[2].s_gb_name = 'gb_7'
istr_dwo[2].s_description = 'Hoá đơn mua'


istr_dwo[3].s_dwo_default =  'd_pur_tax_desc_form'
istr_dwo[3].s_dwo_form = 'd_pur_tax_desc_form'
istr_dwo[3].s_dwo_grid = ''
istr_dwo[3].b_shared = true
istr_dwo[3].s_dwo_master = 'd_invoice_pur_form;'
istr_dwo[3].s_master_keycol = ''
istr_dwo[3].s_detail_keycol = ''
istr_dwo[3].b_ref_table_yn  = false
istr_dwo[3].s_ref_table_field = ''
istr_dwo[3].b_insert = true
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = true
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_excel = true
istr_dwo[3].b_cascade_del = true
istr_dwo[3].b_traceable = true
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].b_focus_master = true
istr_dwo[3].s_description = 'Thông tin khai báo thuế'
*/
end subroutine

public subroutine f_set_dwo_tabpage ();/*
iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '2d'
iastr_dwo_tabpage[1].i_upperpart_height  =2/3
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_pur_invoice_line_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_pur_invoice_line_grid'
iastr_dwo_tabpage[1].str_dwo[1].b_master = true
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_invoice_pur_form;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = 'd_post_line_invoice_grid;d_charge_line_grid;d_tax_line_grid;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[1].str_dwo[1].b_insert = true
iastr_dwo_tabpage[1].str_dwo[1].b_update = true
iastr_dwo_tabpage[1].str_dwo[1].b_delete = true
iastr_dwo_tabpage[1].str_dwo[1].b_query = true
iastr_dwo_tabpage[1].str_dwo[1].b_print = true
iastr_dwo_tabpage[1].str_dwo[1].b_excel = true
iastr_dwo_tabpage[1].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Chi tiết hóa đơn'

iastr_dwo_tabpage[1].str_dwo[2].s_dwo_default =  'd_post_line_invoice_grid'
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_grid = 'd_post_line_invoice_grid'
iastr_dwo_tabpage[1].str_dwo[2].b_master = false
iastr_dwo_tabpage[1].str_dwo[2].b_detail = true
iastr_dwo_tabpage[1].str_dwo[2].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_master = 'd_pur_invoice_line_grid;'
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_shared = ''
iastr_dwo_tabpage[1].str_dwo[2].s_master_keycol = 'ID;'
iastr_dwo_tabpage[1].str_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[1].str_dwo[2].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[1].str_dwo[2].b_insert = false
iastr_dwo_tabpage[1].str_dwo[2].b_update = true
iastr_dwo_tabpage[1].str_dwo[2].b_delete = true
iastr_dwo_tabpage[1].str_dwo[2].b_query = true
iastr_dwo_tabpage[1].str_dwo[2].b_print = true
iastr_dwo_tabpage[1].str_dwo[2].b_excel = true
iastr_dwo_tabpage[1].str_dwo[2].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[2].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[2].s_description ='Định khoản hóa đơn'
iastr_dwo_tabpage[1].i_index = 1

iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_display_model = '2d'
iastr_dwo_tabpage[2].i_upperpart_height  =2/3
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_charge_line_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = 'd_charge_line_form'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = 'd_charge_line_grid'
iastr_dwo_tabpage[2].str_dwo[1].b_master = true
iastr_dwo_tabpage[2].str_dwo[1].b_detail = true
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_pur_invoice_line_grid;'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_details = 'd_post_line_charge_grid;'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[2].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[2].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[2].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[2].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[2].str_dwo[1].b_insert = true
iastr_dwo_tabpage[2].str_dwo[1].b_update = true
iastr_dwo_tabpage[2].str_dwo[1].b_delete = true
iastr_dwo_tabpage[2].str_dwo[1].b_query = true
iastr_dwo_tabpage[2].str_dwo[1].b_print = true
iastr_dwo_tabpage[2].str_dwo[1].b_excel = true
iastr_dwo_tabpage[2].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[2].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[2].str_dwo[1].s_description ='Chi phí'

iastr_dwo_tabpage[2].str_dwo[2].s_dwo_default =  'd_post_line_charge_grid'
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_form = ''
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_grid = 'd_post_line_charge_grid'
iastr_dwo_tabpage[2].str_dwo[2].b_master = false
iastr_dwo_tabpage[2].str_dwo[2].b_detail = true
iastr_dwo_tabpage[2].str_dwo[2].b_cascade_del = true
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_master = 'd_charge_line_grid;'
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_details = ''
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_shared = ''
iastr_dwo_tabpage[2].str_dwo[2].s_master_keycol = 'ID;'
iastr_dwo_tabpage[2].str_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[2].str_dwo[2].b_ref_table_yn  = false
iastr_dwo_tabpage[2].str_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[2].str_dwo[2].b_insert = false
iastr_dwo_tabpage[2].str_dwo[2].b_update = true
iastr_dwo_tabpage[2].str_dwo[2].b_delete = true
iastr_dwo_tabpage[2].str_dwo[2].b_query = true
iastr_dwo_tabpage[2].str_dwo[2].b_print = true
iastr_dwo_tabpage[2].str_dwo[2].b_excel = true
iastr_dwo_tabpage[2].str_dwo[2].b_traceable = true
iastr_dwo_tabpage[2].str_dwo[2].b_keyboardlocked = true
iastr_dwo_tabpage[2].str_dwo[2].s_description ='Định khoản chi phí'
iastr_dwo_tabpage[2].i_index = 2

iastr_dwo_tabpage[3].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[3].s_display_model = '2d'
iastr_dwo_tabpage[3].i_upperpart_height  =2/3
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_default =  'd_tax_line_grid'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_grid = 'd_tax_line_grid'
iastr_dwo_tabpage[3].str_dwo[1].b_master = true
iastr_dwo_tabpage[3].str_dwo[1].b_detail = true
iastr_dwo_tabpage[3].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_master = 'd_pur_invoice_line_grid;'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_details = 'd_post_line_tax_grid;'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[3].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[3].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[3].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[3].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[3].str_dwo[1].b_insert = true
iastr_dwo_tabpage[3].str_dwo[1].b_update = true
iastr_dwo_tabpage[3].str_dwo[1].b_delete = true
iastr_dwo_tabpage[3].str_dwo[1].b_query = true
iastr_dwo_tabpage[3].str_dwo[1].b_print = true
iastr_dwo_tabpage[3].str_dwo[1].b_excel = true
iastr_dwo_tabpage[3].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[3].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[3].str_dwo[1].s_description ='Thuế'

iastr_dwo_tabpage[3].str_dwo[2].s_dwo_default =  'd_post_line_tax_grid'
iastr_dwo_tabpage[3].str_dwo[2].s_dwo_form = ''
iastr_dwo_tabpage[3].str_dwo[2].s_dwo_grid = 'd_post_line_tax_grid'
iastr_dwo_tabpage[3].str_dwo[2].b_master = false
iastr_dwo_tabpage[3].str_dwo[2].b_detail = true
iastr_dwo_tabpage[3].str_dwo[2].b_cascade_del = true
iastr_dwo_tabpage[3].str_dwo[2].s_dwo_master = 'd_tax_line_grid;'
iastr_dwo_tabpage[3].str_dwo[2].s_dwo_details = ''
iastr_dwo_tabpage[3].str_dwo[2].s_dwo_shared = ''
iastr_dwo_tabpage[3].str_dwo[2].s_master_keycol = 'ID;'
iastr_dwo_tabpage[3].str_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[3].str_dwo[2].b_ref_table_yn  = false
iastr_dwo_tabpage[3].str_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[3].str_dwo[2].b_insert = false
iastr_dwo_tabpage[3].str_dwo[2].b_update = true
iastr_dwo_tabpage[3].str_dwo[2].b_delete = true
iastr_dwo_tabpage[3].str_dwo[2].b_query = true
iastr_dwo_tabpage[3].str_dwo[2].b_print = true
iastr_dwo_tabpage[3].str_dwo[2].b_excel = true
iastr_dwo_tabpage[3].str_dwo[2].b_traceable = true
iastr_dwo_tabpage[3].str_dwo[2].b_keyboardlocked = true
iastr_dwo_tabpage[3].str_dwo[2].s_description ='Định khoản thuế'
iastr_dwo_tabpage[3].i_index = 3

*/
end subroutine

public subroutine f_set_str_unit ();//--datawindow chứa các cột cần làm tròn--//
istr_unit[1].s_dwo_handing = 'd_payment_line_grid;d_payment_line_grid;d_payment_line_grid;d_payment_line_grid;d_document_payment_form;'
//--các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = 'qty;price;amount;base_amount;exchange_rate;'
//--nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[1].s_dwo_unit = 'd_payment_line_grid;d_document_payment_form;d_document_payment_form;d_document_payment_form;d_document_payment_form;'
//--tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = 'uom_code;uom_code;uom_code;uom_code;exchange_rate;'
//--loại làm tròn --//
istr_unit[1].s_type = 'item;price;amount;bc;ex'
//--datawindow của cột chứa object--//
istr_unit[1].s_dwo_object = 'd_pur_invoice_line_grid'
//--cột chứa mã object--//
istr_unit[1].s_colname_object = 'object_code'

end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_po'					// đối tượng quan hệ đến
istr_dwo_related[1].s_main_obj_dwo = 'd_document_ap_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'd_document_pm_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].b_t_matching = true
istr_dwo_related[1].s_relatedtext_column = 'code'					
istr_dwo_related[1].s_text = 'Đơn đặt mua từ: '
istr_dwo_related[1].s_match_f_dwo[1] = 'd_po_line_grid'
istr_dwo_related[1].s_match_t_dwo[1] = 'd_pur_invoice_line_grid'
istr_dwo_related[1].s_match_f_column[1] = 'qty'
istr_dwo_related[1].s_match_t_column[1] = 'qty'
istr_dwo_related[1].s_match_column[1] = 'qty'
istr_dwo_related[1].s_match_rf_dwo[1] = 'd_po_line_grid'

istr_dwo_related[2].s_related_obj_name = 'u_pur_invoice_replace'					// đối tượng liên quan
istr_dwo_related[2].s_main_obj_dwo = 'd_document_ap_grid'		//datawindow quan hệ main
istr_dwo_related[2].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[2].s_related_obj_dwo = 'd_document_ap_grid'	// datawindow quan hệ đến
istr_dwo_related[2].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[2].b_f_matching = true
istr_dwo_related[2].s_relatedtext_column = 'code'					
istr_dwo_related[2].s_text = 'Hóa đơn mua:'

istr_dwo_related[2].s_main_obj_dwo_copy[1] = 'd_pur_invoice_line_grid' // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[1] ='object_id;warehouse_id;spec_id;TRANS_UOM;line_no;object_type;object_code;line_text;qty;warehouse_code;warehouse_name;uom_code;price;amount;base_amount;'
istr_dwo_related[2].s_main_obj_column_copy[1]+='disc_amt;disc_pct;tax_type;tax_pct;tax_amt;tax_correction;spec_code;spec_name;foc_yn;note;alloc_code;alloc_name;'
istr_dwo_related[2].s_main_obj_column_copy[1]+='start_alloc_date;alloc_amount;nbr_of_alloc_period;auto_alloc_yn;subaccount_code;subaccount_name;subaccount'
istr_dwo_related[2].s_related_obj_dwo_copy[1] = 'd_pur_invoice_line_grid' // datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[1]='object_id;warehouse_id;spec_id;TRANS_UOM;line_no;object_type;object_code;line_text;qty;warehouse_code;warehouse_name;uom_code;price;amount;base_amount;'
istr_dwo_related[2].s_related_obj_column_copy[1]+='disc_amt;disc_pct;tax_type;tax_pct;tax_amt;tax_correction;spec_code;spec_name;foc_yn;note;alloc_code;alloc_name;'
istr_dwo_related[2].s_related_obj_column_copy[1]+='start_alloc_date;alloc_amount;nbr_of_alloc_period;auto_alloc_yn;subaccount_code;subaccount_name;subaccount'
istr_dwo_related[2].s_main_obj_column_chk[1] = ''
istr_dwo_related[2].s_related_obj_column_chk[1] = ''
istr_dwo_related[2].s_f_obj_column_chk[1] = 'object_id'
istr_dwo_related[2].s_t_obj_column_chk[1] = 'object_id'
istr_dwo_related[2].b_copy_line[1] = true
istr_dwo_related[2].s_match_f_dwo[1] = 'd_pur_invoice_line_grid'
istr_dwo_related[2].s_match_f_col_obj[1] = 'object_id'
istr_dwo_related[2].s_match_t_dwo[1] = 'd_pur_invoice_line_grid'
istr_dwo_related[2].s_match_f_column[1] = 'qty'
istr_dwo_related[2].s_match_t_column[1] = 'qty'
istr_dwo_related[2].s_match_column[1] = 'qty'

istr_dwo_related[2].s_main_obj_dwo_copy[2] = 'd_invoice_pur_form' // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[2] ='invoice_object;payment_term;payment_method;dr_cr_object;currency_id;company_id;cus_tax_num;invoice_object_code;invoice_object_name;invoice_address;dr_cr_object_code;dr_cr_object_name;'
istr_dwo_related[2].s_main_obj_column_copy[2]+='payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;exchange_rate;version_no;'
istr_dwo_related[2].s_main_obj_column_copy[2]+='include_tax_yn;invoice_yn;quantity_yn;value_yn;due_date;invoice_received_date;trans_address;description;note;'
istr_dwo_related[2].s_related_obj_dwo_copy[2] = 'd_invoice_pur_form' // datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[2]='invoice_object;payment_term;payment_method;dr_cr_object;currency_id;company_id;cus_tax_num;invoice_object_code;invoice_object_name;invoice_address;dr_cr_object_code;dr_cr_object_name;'
istr_dwo_related[2].s_related_obj_column_copy[2]+='payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;exchange_rate;version_no;'
istr_dwo_related[2].s_related_obj_column_copy[2]+='include_tax_yn;invoice_yn;quantity_yn;value_yn;due_date;invoice_received_date;trans_address;description;note;'
////chi phi
//istr_dwo_related[2].s_main_obj_dwo_copy[3] = 'd_charge_line_grid' // datawindow copy từ
//istr_dwo_related[2].s_main_obj_column_copy[3] ='line_no;object_code;object_name;charge_pct;charge_amt;uom_code;exchange_rate' // cột copy từ
//istr_dwo_related[2].s_related_obj_dwo_copy[3] = 'd_charge_line_grid' // datawindow copy đến
//istr_dwo_related[2].s_related_obj_column_copy[3] = 'line_no;object_code;object_name;charge_pct;charge_amt;uom_code;exchange_rate'   // cột copy đến
//
////dinh khoan
//istr_dwo_related[2].s_main_obj_dwo_copy[4] = 'd_post_line_invoice_grid' // datawindow copy từ
//istr_dwo_related[2].s_main_obj_column_copy[4] ='post_type;dr_object_type;dr_object_code;dr_account_code;cr_object_type;cr_object_code;cr_account_code;trans_amt;base_amt;uom_code;ex_rate' // cột copy từ
//istr_dwo_related[2].s_related_obj_dwo_copy[4] = 'd_post_line_invoice_grid' // datawindow copy đến
//istr_dwo_related[2].s_related_obj_column_copy[4] = 'post_type;dr_object_type;dr_object_code;dr_account_code;cr_object_type;cr_object_code;cr_account_code;trans_amt;base_amt;uom_code;ex_rate'   // cột copy đến
//
//istr_dwo_related[2].s_main_obj_dwo_copy[5] = 'd_post_line_charge_grid' // datawindow copy từ
//istr_dwo_related[2].s_main_obj_column_copy[5] ='post_type;dr_object_type;dr_object_code;dr_account_code;cr_object_type;cr_object_code;cr_account_code;trans_amt;base_amt;uom_code;ex_rate' // cột copy từ
//istr_dwo_related[2].s_related_obj_dwo_copy[5] = 'd_post_line_charge_grid' // datawindow copy đến
//istr_dwo_related[2].s_related_obj_column_copy[5] = 'post_type;dr_object_type;dr_object_code;dr_account_code;cr_object_type;cr_object_code;cr_account_code;trans_amt;base_amt;uom_code;ex_rate'   // cột copy đến
istr_dwo_related[2].s_main_obj_column_chk[2] = ''
istr_dwo_related[2].s_related_obj_column_chk[2] = ''
istr_dwo_related[2].s_match_f_dwo[2] = ''
istr_dwo_related[2].s_match_t_dwo[2] = ''
istr_dwo_related[2].s_match_column[2] = ''
istr_dwo_related[2].s_main_obj_column_sum[2] = ''
istr_dwo_related[2].s_related_obj_column_sum[2] = ''
istr_dwo_related[2].s_f_obj_column_chk[2] = ''
istr_dwo_related[2].s_t_obj_column_chk[2] = ''
istr_dwo_related[2].b_f_sum[2] = false
istr_dwo_related[2].b_copy_line[2] = false
/////////////////////////////
istr_dwo_related[3].s_related_obj_name = 'u_payment'					// đối tượng liên quan
istr_dwo_related[3].s_main_obj_dwo = 'd_document_payment_grid'		//datawindow quan hệ main
istr_dwo_related[3].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[3].s_related_obj_dwo = 'd_document_payment_grid'	// datawindow quan hệ đến
istr_dwo_related[3].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[3].b_f_matching = true
istr_dwo_related[3].s_relatedtext_column = 'code'					
istr_dwo_related[3].s_text = 'Phiếu chi:'

istr_dwo_related[3].s_main_obj_dwo_copy[1] = 'd_payment_form' // datawindow copy từ
istr_dwo_related[3].s_main_obj_column_copy[1] ='invoice_object;dr_cr_object;currency_id;exchange_rate;'
istr_dwo_related[3].s_related_obj_dwo_copy[1] = 'd_payment_form' // datawindow copy đến
istr_dwo_related[3].s_related_obj_column_copy[1]='invoice_object;dr_cr_object;currency_id;exchange_rate;'
istr_dwo_related[3].s_related_obj_column_chk[1] = 'trans_date;'

istr_dwo_related[3].s_main_obj_dwo_copy[2] = 'd_payment_line_grid' // datawindow copy từ
istr_dwo_related[3].s_related_obj_dwo_copy[2] = 'd_payment_line_grid' // datawindow copy đến
istr_dwo_related[3].s_main_obj_column_copy[2] ='OBJECT_ID;amount;base_amount'  // cột copy từ
istr_dwo_related[3].s_related_obj_column_copy[2] = 'OBJECT_ID;amount;base_amount'  // cột copy đến

istr_dwo_related[3].s_main_obj_column_chk[2] = ''
istr_dwo_related[3].s_related_obj_column_chk[2] = ''
istr_dwo_related[3].s_match_f_dwo[2] = ''
istr_dwo_related[3].s_match_t_dwo[2] = ''
istr_dwo_related[3].s_match_t_dwo[2] =''
istr_dwo_related[3].s_match_f_column[2] = ''
istr_dwo_related[3].s_match_column[2] =''
istr_dwo_related[3].s_main_obj_column_sum[2] = ''
istr_dwo_related[3].s_related_obj_column_sum[2] = ''
istr_dwo_related[3].s_f_obj_column_chk[2] = ''
istr_dwo_related[3].s_t_obj_column_chk[2] = ''
istr_dwo_related[3].b_f_sum[2] = false

istr_dwo_related[4].s_related_obj_name = 'u_pur_invoice_vtcn'					// đối tượng liên quan
istr_dwo_related[4].s_main_obj_dwo = 'd_document_payment_grid'		//datawindow quan hệ main
istr_dwo_related[4].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[4].s_related_obj_dwo = 'd_document_ap_grid'	// datawindow quan hệ đến
istr_dwo_related[4].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[4].b_t_matching = true
istr_dwo_related[4].b_copy_tax = true
istr_dwo_related[4].s_relatedtext_column = 'code'					
istr_dwo_related[4].s_text = 'hóa đơn mua:'

/////////////////////////////////////////////////////////////////////
istr_dwo_related[4].s_main_obj_dwo_copy[1] = 'd_invoice_pur_form' // datawindow copy từ
istr_dwo_related[4].s_main_obj_column_copy[1] ='invoice_object;payment_term;payment_method;dr_cr_object;currency_id;invoice_address;exchange_rate;'
istr_dwo_related[4].s_main_obj_column_copy[1]+='due_date;invoice_received_date;trans_address;description;note;invoice_code;invoice_sign;customs_declaration_no;allocation_yn;include_tax_yn;invoice_yn;'
istr_dwo_related[4].s_related_obj_dwo_copy[1] = 'd_invoice_pur_form' // datawindow copy đến
istr_dwo_related[4].s_related_obj_column_copy[1]='invoice_object;payment_term;payment_method;dr_cr_object;currency_id;invoice_address;exchange_rate;'
istr_dwo_related[4].s_related_obj_column_copy[1]+='due_date;invoice_received_date;trans_address;description;note;invoice_code;invoice_sign;customs_declaration_no;allocation_yn;include_tax_yn;invoice_yn;'

istr_dwo_related[4].s_main_obj_dwo_copy[2] = 'd_pur_invoice_line_grid' // datawindow copy từ
istr_dwo_related[4].s_main_obj_column_copy[2] ='object_id;warehouse_id;spec_id;TRANS_UOM;line_no;line_text;qty;price;amount;base_amount;disc_amount;disc_pct;foc_yn;note;'
istr_dwo_related[4].s_main_obj_column_copy[2]+='start_alloc_date;alloc_amount;nbr_of_alloc_period;auto_alloc_yn;subaccount;amount_ex_tax;base_amount_ex_tax;PRICE_EX_TAX;vat;vat_amount;'
istr_dwo_related[4].s_related_obj_dwo_copy[2] = 'd_pur_invoice_line_grid' // datawindow copy đến
istr_dwo_related[4].s_related_obj_column_copy[2]='object_id;warehouse_id;spec_id;TRANS_UOM;line_no;line_text;qty;price;amount;base_amount;disc_amount;disc_pct;foc_yn;note;'
istr_dwo_related[4].s_related_obj_column_copy[2]+='start_alloc_date;alloc_amount;nbr_of_alloc_period;auto_alloc_yn;subaccount;amount_ex_tax;base_amount_ex_tax;PRICE_EX_TAX;vat;vat_amount;'

istr_dwo_related[4].s_main_obj_column_chk[2] = ''
istr_dwo_related[4].s_related_obj_column_chk[2] = ''
istr_dwo_related[4].s_match_f_dwo[2] = ''
istr_dwo_related[4].s_match_t_dwo[2] = ''
istr_dwo_related[4].s_match_t_dwo[2] =''
istr_dwo_related[4].s_match_f_column[2] = ''
istr_dwo_related[4].s_match_column[2] =''
istr_dwo_related[4].s_main_obj_column_sum[2] = ''
istr_dwo_related[4].s_related_obj_column_sum[2] = ''
istr_dwo_related[4].s_f_obj_column_chk[2] = ''
istr_dwo_related[4].s_t_obj_column_chk[2] = ''
istr_dwo_related[4].b_f_sum[2] = false


istr_dwo_related[5].s_related_obj_name = 'u_goods_receipt'					// đối tượng copy đến
istr_dwo_related[5].s_main_obj_dwo = 'd_document_ap_grid'	 	//datawindow quan hệ main
istr_dwo_related[5].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[5].s_related_obj_dwo =	'd_document_inventory_grid' // datawindow quan hệ đến
istr_dwo_related[5].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[5].b_f_matching = true
istr_dwo_related[5].s_relatedtext_column = 'code'					
istr_dwo_related[5].s_text = 'Phiếu nhập kho của HĐ#: '

istr_dwo_related[5].s_match_f_dwo[1] = 'd_pur_invoice_line_grid'
istr_dwo_related[5].s_match_t_dwo[1] = 'd_inventory_line_receipt_grid'
istr_dwo_related[5].s_match_f_column[1] = 'qty'
istr_dwo_related[5].s_match_t_column[1] = 'qty'
istr_dwo_related[5].s_match_column[1] = 'qty'
istr_dwo_related[5].s_match_rf_dwo[1] = 'd_pur_invoice_line_grid;d_po_line_grid'
istr_dwo_related[5].s_match_f_col_obj[1] = 'object_id'
istr_dwo_related[5].s_match_t_col_obj[1] = 'item_id'

istr_dwo_related[5].s_main_obj_dwo_copy[1] = 'd_pur_invoice_line_grid' // datawindow copy đến
istr_dwo_related[5].s_main_obj_column_copy[1] ='OBJECT_ID;object_code;object_name;LINE_TEXT;NOTE;QTY;qty;price;amount;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;disc_amt;disc_pct;foc_yn;warehouse_id;warehouse_code;warehouse_name;subaccount_code;subaccount_name;SUBACCOUNT;'  // cột copy đến
istr_dwo_related[5].s_related_obj_dwo_copy[1] =  'd_inventory_line_receipt_grid'// datawindow copy từ
istr_dwo_related[5].s_related_obj_column_copy[1] = 'ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;QTY;doc_qty;price;amount;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;disc_amt;disc_pct;foc_yn;warehouse_id;wh_code;wh_name;subaccount_code;subaccount_name;SUBACCOUNT;' // cột copy từ

istr_dwo_related[5].b_copy_line[1] = true
istr_dwo_related[5].s_main_obj_column_chk[1] = ''
istr_dwo_related[5].s_related_obj_column_chk[1] = ''
istr_dwo_related[5].s_f_obj_column_chk[1] = 'OBJECT_ID'
istr_dwo_related[5].s_t_obj_column_chk[1] = 'ITEM_ID'

istr_dwo_related[5].s_main_obj_dwo_copy[2] = 'd_invoice_pur_form' // datawindow copy đến
istr_dwo_related[5].s_main_obj_column_copy[2] ='invoice_object;invoice_object_code;invoice_object_name;invoice_address;dr_cr_object;dr_cr_object_code;dr_cr_object_name;trans_address;' +&
																		'note;description;trans_date;payment_term;payment_term_code;payment_term_name;payment_method;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate;include_tax_yn;'	// cột copy đến

istr_dwo_related[5].s_related_obj_dwo_copy[2] =  'd_goods_receipt_form'// datawindow copy từ
istr_dwo_related[5].s_related_obj_column_copy[2] = 'invoice_object;object_code;object_name;trans_address;invoice_object;object_code;object_name;trans_address;' +&
																		'note;description;trans_date;payment_term;payment_term_code;payment_term_name;payment_method;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate;include_tax_yn;' // cột copy từ

istr_dwo_related[5].s_main_obj_column_chk[2] = 'invoice_object;dr_cr_object'  // 'invoice_object;dr_cr_object;warehouse_id'
istr_dwo_related[5].s_related_obj_column_chk[2] = 'invoice_object;invoice_object' // 'OBJECT_ID;OBJECT_ID;warehouse_id'

istr_dwo_related[5].s_match_f_dwo[2] = ''
istr_dwo_related[5].s_match_t_dwo[2] = ''
istr_dwo_related[5].s_match_f_column[2] = ''
istr_dwo_related[5].s_match_t_column[2] = ''
istr_dwo_related[5].s_match_column[2] = ''
istr_dwo_related[5].s_main_obj_column_sum[2] = ''
istr_dwo_related[5].s_related_obj_column_sum[2] = ''
istr_dwo_related[5].s_f_obj_column_chk[2] = ''
istr_dwo_related[5].s_t_obj_column_chk[2] = ''
istr_dwo_related[5].b_f_sum[2] = false
istr_dwo_related[5].b_copy_line[2] = false

istr_dwo_related[5].s_main_obj_dwo_copy[3] = 'd_document_ap_grid' // datawindow copy đến
istr_dwo_related[5].s_main_obj_column_copy[3] ='document_date;'	// cột copy đến

istr_dwo_related[5].s_related_obj_dwo_copy[3] =  'd_document_inventory_grid'// datawindow copy từ
istr_dwo_related[5].s_related_obj_column_copy[3] = 'document_date' // cột copy từ

istr_dwo_related[5].s_main_obj_column_chk[3] = ''  // 'invoice_object;dr_cr_object;warehouse_id'
istr_dwo_related[5].s_related_obj_column_chk[3] = '' // 'OBJECT_ID;OBJECT_ID;warehouse_id'
istr_dwo_related[5].s_match_f_dwo[3] = ''
istr_dwo_related[5].s_match_t_dwo[3] = ''
istr_dwo_related[5].s_match_f_column[3] = ''
istr_dwo_related[5].s_match_t_column[3] = ''
istr_dwo_related[5].s_match_column[3] = ''
istr_dwo_related[5].s_main_obj_column_sum[3] = ''
istr_dwo_related[5].s_related_obj_column_sum[3] = ''
istr_dwo_related[5].s_f_obj_column_chk[3] = ''
istr_dwo_related[5].s_t_obj_column_chk[3] = ''
istr_dwo_related[5].b_f_sum[3] = false
istr_dwo_related[5].b_copy_line[3] = false


istr_dwo_related[6].s_related_obj_name = 'u_item'					// đối tượng copy đến
istr_dwo_related[6].s_main_obj_dwo = 	'd_pur_invoice_line_grid'	//datawindow quan hệ main
istr_dwo_related[6].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[6].s_related_obj_dwo =  'd_object_grid'	// datawindow quan hệ đến
istr_dwo_related[6].s_related_obj_column = 'object_id'			// cột quan hệ đến
istr_dwo_related[6].s_relatedtext_column = 'code'					
istr_dwo_related[6].s_text = 'Hóa đơn mua của : '


istr_dwo_related[7].s_related_obj_name = 'u_bank_voucher_payment'					// đối tượng liên quan
istr_dwo_related[7].s_main_obj_dwo = 'd_document_ap_grid'		//datawindow quan hệ main
istr_dwo_related[7].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[7].s_related_obj_dwo = 'd_document_ap_grid'	// datawindow quan hệ đến
istr_dwo_related[7].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[7].b_f_matching = true
istr_dwo_related[7].s_relatedtext_column = 'doc_code'					
istr_dwo_related[7].s_text = 'Sổ phụ ngân hàng từ:'

istr_dwo_related[7].s_main_obj_dwo_copy[1] = 'd_post_line_invoice_grid' // datawindow copy từ
istr_dwo_related[7].s_related_obj_dwo_copy[1] = 'd_payment_line_grid' // datawindow copy đến
istr_dwo_related[7].s_main_obj_column_copy[1] ='CR_OBJECT_ID;trans_amt;base_amt'  // cột copy từ
istr_dwo_related[7].s_related_obj_column_copy[1] = 'OBJECT_ID;amount;base_amount'  // cột copy đến
istr_dwo_related[7].s_main_dr_cr_obj_dwo_sum[1]='d_invoice_pur_form'
istr_dwo_related[7].s_main_dr_cr_obj_column_sum[1]='dr_cr_object'
istr_dwo_related[7].s_main_obj_column_sum[1] = 'trans_amt;base_amt'
istr_dwo_related[7].s_f_obj_column_chk[1] = 'CR_OBJECT_ID'
istr_dwo_related[7].s_t_obj_column_chk[1] = 'OBJECT_ID'
istr_dwo_related[7].s_main_obj_column_chk[1] = ''
istr_dwo_related[7].s_related_obj_column_chk[1] = ''
istr_dwo_related[7].b_f_sum[1] = true
istr_dwo_related[7].b_copy_line[1] = true
istr_dwo_related[7].s_match_f_dwo[1] = 'd_post_line_invoice_grid'
istr_dwo_related[7].s_match_t_dwo[1] = 'd_payment_line_grid'
istr_dwo_related[7].s_match_f_column[1] =  'trans_amt;base_amt'
istr_dwo_related[7].s_match_t_column[1] = 'amount;base_amount'
istr_dwo_related[7].s_match_column[1] = 'trans_value;base_value'

istr_dwo_related[7].s_main_obj_dwo_copy[2] = 'd_post_line_tax_grid'
istr_dwo_related[7].s_related_obj_dwo_copy[2] = 'd_payment_line_grid'
istr_dwo_related[7].s_main_obj_column_copy[2] ='CR_OBJECT_ID;trans_amt;base_amt'
istr_dwo_related[7].s_related_obj_column_copy[2] = 'OBJECT_ID;amount;base_amount'
istr_dwo_related[7].s_main_dr_cr_obj_dwo_sum[2]='d_invoice_pur_form'
istr_dwo_related[7].s_main_dr_cr_obj_column_sum[2]='dr_cr_object'
istr_dwo_related[7].s_main_obj_column_sum[2] = 'trans_amt;base_amt'
istr_dwo_related[7].s_f_obj_column_chk[2] = 'CR_OBJECT_ID'
istr_dwo_related[7].s_t_obj_column_chk[2] = 'OBJECT_ID'
istr_dwo_related[7].s_main_obj_column_chk[2] = ''
istr_dwo_related[7].s_related_obj_column_chk[2] = ''
istr_dwo_related[7].b_f_sum[2] = true
istr_dwo_related[7].b_copy_line[2] = true
istr_dwo_related[7].s_match_f_dwo[2] = 'd_post_line_tax_grid'
istr_dwo_related[7].s_match_t_dwo[2] = 'd_payment_line_grid'
istr_dwo_related[7].s_match_f_column[2] = 'trans_amt;base_amt'
istr_dwo_related[7].s_match_t_column[2] = 'amount;base_amount'
istr_dwo_related[7].s_match_column[2] = 'trans_value;base_value'

istr_dwo_related[7].s_main_obj_dwo_copy[3] = 'd_pur_invoice_line_grid' // datawindow copy từ
istr_dwo_related[7].s_related_obj_dwo_copy[3] = 'd_payment_line_grid' // datawindow copy đến
istr_dwo_related[7].s_main_obj_column_copy[3] = 'subaccount_code;subaccount_name;SUBACCOUNT;' // cột copy từ
istr_dwo_related[7].s_related_obj_column_copy[3] = 'subaccount_code;subaccount_name;SUBACCOUNT;'
istr_dwo_related[7].b_copy_line[3] = true

istr_dwo_related[7].s_main_obj_dwo_copy[4] = 'd_invoice_pur_form' // datawindow copy từ
istr_dwo_related[7].s_main_obj_column_copy[4] ='dr_cr_object;dr_cr_object_type;dr_cr_object_code;dr_cr_object_name' // cột copy từ
istr_dwo_related[7].s_related_obj_dwo_copy[4] = 'd_payment_line_grid' // datawindow copy đến
istr_dwo_related[7].s_related_obj_column_copy[4] = 'object_id;object_type;object_code;object_name'  // cột copy đến

istr_dwo_related[7].s_main_obj_dwo_copy[5] = 'd_invoice_pur_form' // datawindow copy từ
istr_dwo_related[7].s_main_obj_column_copy[5] ='currency_id;uom_code;exchange_rate;dr_cr_object' // cột copy từ
istr_dwo_related[7].s_related_obj_dwo_copy[5] = 'd_bank_voucher_form' // datawindow copy đến
istr_dwo_related[7].s_related_obj_column_copy[5] = 'currency_id;uom_code;exchange_rate;invoice_object'  // cột copy đến
istr_dwo_related[7].s_f_obj_column_chk[5] = ''
istr_dwo_related[7].s_t_obj_column_chk[5] = ''
istr_dwo_related[7].s_main_obj_column_chk[5] = ''
istr_dwo_related[7].s_related_obj_column_chk[5] = ''
istr_dwo_related[7].s_match_f_dwo[5] = ''
istr_dwo_related[7].s_match_t_dwo[5] = ''
istr_dwo_related[7].s_match_f_column[5] = ''
istr_dwo_related[7].s_match_t_column[5] = ''
istr_dwo_related[7].s_main_obj_column_sum[5] = ''
istr_dwo_related[7].s_related_obj_column_sum[5] = ''
istr_dwo_related[7].s_match_column[5] = ''
istr_dwo_related[7].s_f_obj_column_chk[5] = ''
istr_dwo_related[7].s_t_obj_column_chk[5] = ''
istr_dwo_related[7].b_copy_line[5] = false
istr_dwo_related[7].b_f_sum[5] = false
istr_dwo_related[7].b_copy_line[5] = false

istr_dwo_related[8].s_related_obj_name = 'u_map_invoice'
istr_dwo_related[8].s_main_obj_dwo = 'd_invoice_pur_form'
istr_dwo_related[8].s_main_obj_column = 'invoice_object'
istr_dwo_related[8].s_related_obj_dwo = 'd_address_map_form'
istr_dwo_related[8].s_related_obj_column = 'object_id'

istr_dwo_related[9].s_related_obj_name = 'u_map_delivery'
istr_dwo_related[9].s_main_obj_dwo = 'd_invoice_pur_form'
istr_dwo_related[9].s_main_obj_column = 'dr_cr_object'
istr_dwo_related[9].s_related_obj_dwo = 'd_address_map_form'
istr_dwo_related[9].s_related_obj_column = 'object_id'

istr_dwo_related[10].s_related_obj_name = 'u_pur_invoice_return'					// đối tượng liên quan
istr_dwo_related[10].s_main_obj_dwo = 'd_document_ap_grid'		//datawindow quan hệ main
istr_dwo_related[10].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[10].s_related_obj_dwo = 'd_document_ap_grid'	// datawindow quan hệ đến
istr_dwo_related[10].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[10].b_f_matching = true
istr_dwo_related[10].s_relatedtext_column = 'code'					
istr_dwo_related[10].s_text = 'Hóa đơn mua:'

istr_dwo_related[10].s_main_obj_dwo_copy[1] = 'd_pur_invoice_line_grid' // datawindow copy từ
istr_dwo_related[10].s_main_obj_column_copy[1] ='object_id;warehouse_id;spec_id;TRANS_UOM;line_no;object_type;object_code;line_text;qty;warehouse_code;warehouse_name;uom_code;price;amount;base_amount;'
istr_dwo_related[10].s_main_obj_column_copy[1]+='disc_amt;disc_pct;tax_type;tax_pct;tax_amt;tax_correction;spec_code;spec_name;foc_yn;note;alloc_code;alloc_name;'
istr_dwo_related[10].s_main_obj_column_copy[1]+='start_alloc_date;alloc_amount;nbr_of_alloc_period;auto_alloc_yn;subaccount_code;subaccount_name;subaccount'
istr_dwo_related[10].s_related_obj_dwo_copy[1] = 'd_pur_invoice_line_grid' // datawindow copy đến
istr_dwo_related[10].s_related_obj_column_copy[1]='object_id;warehouse_id;spec_id;TRANS_UOM;line_no;object_type;object_code;line_text;qty;warehouse_code;warehouse_name;uom_code;price;amount;base_amount;'
istr_dwo_related[10].s_related_obj_column_copy[1]+='disc_amt;disc_pct;tax_type;tax_pct;tax_amt;tax_correction;spec_code;spec_name;foc_yn;note;alloc_code;alloc_name;'
istr_dwo_related[10].s_related_obj_column_copy[1]+='start_alloc_date;alloc_amount;nbr_of_alloc_period;auto_alloc_yn;subaccount_code;subaccount_name;subaccount'
istr_dwo_related[10].s_main_obj_column_chk[1] = ''
istr_dwo_related[10].s_related_obj_column_chk[1] = ''
istr_dwo_related[10].s_f_obj_column_chk[1] = 'object_id'
istr_dwo_related[10].s_t_obj_column_chk[1] = 'object_id'
istr_dwo_related[10].b_copy_line[1] = true
istr_dwo_related[10].s_match_f_dwo[1] = 'd_pur_invoice_line_grid'
istr_dwo_related[10].s_match_f_col_obj[1] = 'object_id'
istr_dwo_related[10].s_match_t_dwo[1] = 'd_pur_invoice_line_grid'
istr_dwo_related[10].s_match_f_column[1] = 'qty'
istr_dwo_related[10].s_match_t_column[1] = 'qty'
istr_dwo_related[10].s_match_column[1] = 'qty'
//khai bao lay gia hoa don mua
istr_dwo_related[10].b_get_price=true
istr_dwo_related[10].s_dwo_get_price='d_pur_invoice_line_grid'
istr_dwo_related[10].s_col_get_price[1]='price'
istr_dwo_related[10].s_col_get_qty[1]=''
istr_dwo_related[10].s_dwo_set_price='d_pur_invoice_line_grid'
istr_dwo_related[10].s_col_set_price[1]='price'
istr_dwo_related[10].s_col_set_qty[1]=''

istr_dwo_related[10].s_main_obj_dwo_copy[2] = 'd_invoice_pur_form' // datawindow copy từ
istr_dwo_related[10].s_main_obj_column_copy[2] ='invoice_object;payment_term;payment_method;dr_cr_object;currency_id;company_id;cus_tax_num;invoice_object_code;invoice_object_name;invoice_address;dr_cr_object_code;dr_cr_object_name;'
istr_dwo_related[10].s_main_obj_column_copy[2]+='payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;exchange_rate;version_no;'
istr_dwo_related[10].s_main_obj_column_copy[2]+='include_tax_yn;invoice_yn;quantity_yn;value_yn;due_date;invoice_received_date;trans_address;description;note;'
istr_dwo_related[10].s_related_obj_dwo_copy[2] = 'd_invoice_pur_form' // datawindow copy đến
istr_dwo_related[10].s_related_obj_column_copy[2]='invoice_object;payment_term;payment_method;dr_cr_object;currency_id;company_id;cus_tax_num;invoice_object_code;invoice_object_name;invoice_address;dr_cr_object_code;dr_cr_object_name;'
istr_dwo_related[10].s_related_obj_column_copy[2]+='payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;exchange_rate;version_no;'
istr_dwo_related[10].s_related_obj_column_copy[2]+='include_tax_yn;invoice_yn;quantity_yn;value_yn;due_date;invoice_received_date;trans_address;description;note;'
istr_dwo_related[10].s_main_obj_column_chk[2] = ''
istr_dwo_related[10].s_related_obj_column_chk[2] = ''
istr_dwo_related[10].s_match_f_dwo[2] = ''
istr_dwo_related[10].s_match_t_dwo[2] = ''
istr_dwo_related[10].s_match_column[2] =''
istr_dwo_related[10].s_main_obj_column_sum[2] = ''
istr_dwo_related[10].s_related_obj_column_sum[2] = ''
istr_dwo_related[10].s_f_obj_column_chk[2] = ''
istr_dwo_related[10].s_t_obj_column_chk[2] = ''
istr_dwo_related[10].b_f_sum[2] = false


istr_dwo_related[11].s_related_obj_name = 'b_view'					// đối tượng liên quan
istr_dwo_related[11].s_main_obj_dwo = 'd_document_ap_grid'		//datawindow quan hệ main
istr_dwo_related[11].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[11].s_related_obj_dwo = 'dv_detail_pur_inv_form'	// datawindow quan hệ đến
istr_dwo_related[11].s_related_obj_column = 'doc_id'			// cột quan hệ đến
istr_dwo_related[11].s_relatedtext_column = 'code'					
istr_dwo_related[11].s_text = 'In chi tiết'

istr_dwo_related[12].s_related_obj_name = 'b_view'					// đối tượng liên quan
istr_dwo_related[12].s_main_obj_dwo = 'd_document_ap_grid'		//datawindow quan hệ main
istr_dwo_related[12].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[12].s_related_obj_dwo = 'dv_invoice_goods_receipt_form'	// datawindow quan hệ đến
istr_dwo_related[12].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[12].s_relatedtext_column = 'code'					
istr_dwo_related[12].s_text = 'In phiếu nhập kho'

istr_dwo_related[13].s_related_obj_name = 'b_view'					// đối tượng liên quan
istr_dwo_related[13].s_main_obj_dwo = 'd_document_ap_grid'		//datawindow quan hệ main
istr_dwo_related[13].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[13].s_related_obj_dwo = 'dv_accounting_form'	// datawindow quan hệ đến
istr_dwo_related[13].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[13].s_relatedtext_column = 'code'					
istr_dwo_related[13].s_text = 'Chứng từ kế toán'

istr_dwo_related[14].s_related_obj_name = 'u_project'					// đối tượng copy đến
istr_dwo_related[14].s_main_obj_dwo = 'd_document_ap_grid'	 	//datawindow quan hệ main
istr_dwo_related[14].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[14].s_related_obj_dwo =	'd_document_proj_grid' // datawindow quan hệ đến
istr_dwo_related[14].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[14].b_t_matching = true
istr_dwo_related[14].s_relatedtext_column = 'doc_code'					
istr_dwo_related[14].s_text = 'Hóa đơn mua của : '
istr_dwo_related[14].s_match_f_dwo[1] = 'd_proj_material_grid'
istr_dwo_related[14].s_match_t_dwo[1] = 'd_pur_invoice_line_grid'
istr_dwo_related[14].s_match_f_column[1] = 'bom_qty;cogs'
istr_dwo_related[14].s_match_t_column[1] = 'qty;amount'
istr_dwo_related[14].s_match_column[1] = 'qty;trans_value'
istr_dwo_related[14].s_match_rf_dwo[1] = ''
istr_dwo_related[14].s_match_minus_dwo[1] = 'd_po_line_grid;' //dwo không tính là đã match

istr_dwo_related[14].s_match_f_dwo[2] = 'd_proj_resource_grid'
istr_dwo_related[14].s_match_t_dwo[2] = 'd_pur_invoice_line_grid'
istr_dwo_related[14].s_match_f_column[2] = 'qty;amount'
istr_dwo_related[14].s_match_t_column[2] = 'qty;amount'
istr_dwo_related[14].s_match_column[2] = 'qty;trans_value'
istr_dwo_related[14].s_match_rf_dwo[2] = ''
istr_dwo_related[14].s_match_minus_dwo[1] = 'd_po_line_grid;' //dwo không tính là đã match

istr_dwo_related[14].s_match_f_dwo[3] = 'd_proj_consumption_grid'
istr_dwo_related[14].s_match_t_dwo[3] = 'd_pur_invoice_line_grid'
istr_dwo_related[14].s_match_f_column[3] = 'BOM_QTY;cogs'
istr_dwo_related[14].s_match_t_column[3] = 'qty;amount'
istr_dwo_related[14].s_match_column[3] = 'qty;trans_value'
istr_dwo_related[14].s_match_rf_dwo[3] = ''
istr_dwo_related[14].s_match_minus_dwo[3] = 'd_po_line_grid;' //dwo không tính là đã match
end subroutine

public subroutine f_set_str_streamvalue ();istr_streamvalue[1].s_f_obj_dwo = 'd_invoice_pur_form'
istr_streamvalue[1].s_f_obj_column = 'DR_CR_OBJECT'
istr_streamvalue[1].s_f_column_sv = 'F_OBJECT_ID'

istr_streamvalue[1].s_t_obj_dwo = 'd_pur_invoice_line_grid'
istr_streamvalue[1].s_t_obj_column = 'warehouse_id'
istr_streamvalue[1].s_t_column_sv = 'T_OBJECT_ID'

istr_streamvalue[1].s_item_dwo = 'd_pur_invoice_line_grid'
istr_streamvalue[1].s_item_column = 'object_id;spec_id;qty;trans_uom'
istr_streamvalue[1].s_item_column_sv = 'item_id;spec_id;qty;uom_id'

istr_streamvalue[1].s_currency_dwo = 'd_invoice_pur_form'
istr_streamvalue[1].s_currency_column = 'currency_id;exchange_rate'
istr_streamvalue[1].s_currency_column_sv = 'trans_cur_id;exchange_rate'

istr_streamvalue[1].s_value_dwo = 'd_pur_invoice_line_grid'
istr_streamvalue[1].s_value_column = 'object_id;amount_ex_tax;base_amount_ex_tax;spec_id;qty_sku'
istr_streamvalue[1].s_value_column_sv = 'item_id;trans_value;base_value;spec_id;qty'

istr_streamvalue[1].s_item_lot_dwo = 'ds_lot_line_4booking'
istr_streamvalue[1].s_item_lot_column = 'qty;lot_no;serial_no;'
istr_streamvalue[1].s_item_lot_column_sv = 'qty;LOT_NO;SERIAL_NO;'

end subroutine

public function integer f_resize_fixedpart_grid ();
//this.iw_display.dynamic f_reset_ii_fixedpart2_height_grid(0)
//this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_resize_fixedpart_form ();
this.iw_display.dynamic f_reset_ii_fixedpart2_height_form()
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_reset_fixedpart_grid ();
this.iw_display.dynamic f_reset_ii_fixedpart2_height_grid()
this.iw_display.dynamic f_resize(is_display_model)
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

ras_allocation_info[1] = 'd_pur_invoice_line_grid'
ras_allocation_info[2] = 'qty'
ras_allocation_info[3] = 'base_amount'
ras_allocation_info[4] = 'd_charge_line_grid'

return upperbound(ras_allocation_info[])
end function

public function integer f_set_ds_4_posting ();int				li_idx


istr_ds_4_posting.ds_details[1] = create t_ds_db
istr_ds_4_posting.ds_details[1].dataobject =  'd_payment_form'
istr_ds_4_posting.s_dataobject_str += 'd_payment'+'['+string(1)+']'
istr_ds_4_posting.ds_master[1] = create t_ds_db
istr_ds_4_posting.ds_master[1].dataobject = 'd_document_payment_form'
istr_ds_4_posting.s_join_detail[1] =''


li_idx = upperbound(istr_ds_4_posting.ds_details[]) + 1
istr_ds_4_posting.ds_details[li_idx] = create t_ds_db
istr_ds_4_posting.ds_details[li_idx].dataobject =  'd_payment_line_grid'
istr_ds_4_posting.s_dataobject_str += 'd_payment_line' +'['+string(li_idx)+']'
istr_ds_4_posting.ds_master[li_idx] = create t_ds_db
istr_ds_4_posting.ds_master[li_idx].dataobject = 'd_payment_form'	
istr_ds_4_posting.s_join_detail[li_idx] =''
		
		
//li_idx = upperbound(istr_ds_4_posting.ds_details[]) + 1
//istr_ds_4_posting.ds_details[li_idx] = create t_ds_db
//istr_ds_4_posting.ds_details[li_idx].dataobject =  'd_tax_line_grid'
//istr_ds_4_posting.s_dataobject_str +='d_tax_line' +'['+string(li_idx)+']'
//istr_ds_4_posting.ds_master[li_idx] = create t_ds_db
//istr_ds_4_posting.ds_master[li_idx].dataobject = 'd_inventory_line_delivery_grid'	
//istr_ds_4_posting.s_join_detail[li_idx] =''
//
//li_idx = upperbound(istr_ds_4_posting.ds_details[]) + 1
//istr_ds_4_posting.ds_details[li_idx] = create t_ds_db
//istr_ds_4_posting.ds_details[li_idx].dataobject =  'd_lot_line_grid'
//istr_ds_4_posting.s_dataobject_str +='d_lot_line_grid' +'['+string(li_idx)+']'
//istr_ds_4_posting.ds_master[li_idx] = create t_ds_db
//istr_ds_4_posting.ds_master[li_idx].dataobject = 'd_inventory_line_delivery_grid'	
//istr_ds_4_posting.s_join_detail[li_idx] =''
return 1
end function

on c_bank_cash_retreive.create
call super::create
end on

on c_bank_cash_retreive.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = true
is_display_model = '1d'
ib_display_text = false
//if not this.idwsetup_initial.f_is_branch_yn( istr_dwo[1].s_dwo_default) then
//	is_object_title = 'Hóa đơn mua tổng hợp'
//else
	is_object_title = 'Truy vấn thu/chi'
//end if
is_exrate_type = 'sell'
istr_actionpane[1].s_button_name = 'b_add_multi;b_insert;b_modify;b_save; b_saveclose;b_delete;b_cancel;b_total;b_view_invoice_goods_receipt;b_copyt_multi;b_savepost;b_post;b_unpost;b_account_view;b_send_2_approve;b_request_2_change;b_approve;b_reject;b_allocate;b_view_multi;'
istr_actionpane[1].s_button_has_sub = 'b_view_multi;'
//istr_actionpane[1].sa_sub_button[1]='b_add;b_copyt_seft;'
//istr_actionpane[1].sa_sub_button[2]='b_copyt_payment;b_copyt_bank_voucher_payment'
istr_actionpane[1].sa_sub_button[1]='b_view_payment;b_view_receipt'

istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_description = is_object_title
end event

event e_action_ctrl_bttn;t_dw_mpl				ldw_focus
int							li_idx

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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;b_cancel;b_detail;b_allocate;b_copyt_multi;b_post;b_account_view;b_send_2_approve;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_refresh;b_delete;b_cancel;b_detail;b_allocate;b_copyt_multi;b_post;b_account_view;b_send_2_approve;b_approve;b_reject;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;b_cancel;b_detail;b_allocate;b_copyt_multi;b_post;b_account_view;b_send_2_approve;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_refresh;b_delete;b_cancel;b_detail;b_allocate;b_copyt_multi;b_post;b_account_view;b_send_2_approve;b_approve;b_reject;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons= 'b_add_multi;b_modify;b_filteron;b_refresh;b_delete;b_cancel;b_detail;b_post;b_account_view;b_view_multi;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_filteron;b_refresh;b_detail;b_account_view;b_view_multi;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =   'b_po;b_goods_receipt;b_payment;b_bank_voucher_payment;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
				istr_actionpane[li_idx].s_visible_buttons =  'b_book;b_attach;b_doc_trace_on;b_user_trace;b_appr_trace;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
				
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_dw_e_postinsertrow;//-- Override --//
any							laa_retrieve[], laa_data[]
double						ldb_version_id, ldb_branch
b_obj_instantiate			lbo_ins
s_str_data					lstr_data

ldb_version_id = lbo_ins.f_Create_id_ex( it_transaction )
rpo_dw.setitem(vl_currentrow,'doc_type','PAYMENT')
rpo_dw.setitem(vl_currentrow,'object_ref_table','BOOKED_SLIP')
rpo_dw.setitem(vl_currentrow,'version_id',ldb_version_id)
rpo_dw.setitem(vl_currentrow,'handled_by',gi_userid)
rpo_dw.setitem(vl_currentrow,'object_name', g_user.f_get_name_of_userid_ex(gi_userid, it_transaction ) )
rpo_dw.setitem(vl_currentrow,'status','new')
rpo_dw.setitem(vl_currentrow,'document_date',date(gd_session_date))
rpo_dw.setitem(vl_currentrow,'TRANS_DATE',date(gd_session_date))
//rpo_dw.setitem(vl_currentrow,'version_no',1)

laa_retrieve[1] = upper(mid(this.classname(),3))
if  lbo_ins.f_is_branch_yn_ex('u_trans_setup', it_transaction )then
	ldb_branch = gdb_branch
else
	ldb_branch = 0
end if			
if this.f_get_dfl_trans_info(laa_retrieve[1]  , ldb_branch, lstr_data,it_transaction ) > 0 then
	idb_trans_id = lstr_data.db_data
	if not isnull(idb_trans_id) and idb_trans_id > 0 then 
		laa_data[1] = idb_trans_id
		this.f_init_object_table(ids_trans_setup, 'd_trans_setup_grid', 'object_ref_id;',laa_data[],laa_retrieve[], it_transaction)
		rpo_dw.setitem(vl_currentrow,'trans_hdr_id',idb_trans_id)
		rpo_dw.setitem(vl_currentrow,'trans_desc',lstr_data.as_data[1] )
		rpo_dw.setitem( vl_currentrow,'QUANTITY_YN',lstr_data.as_data[2] )
		rpo_dw.setitem( vl_currentrow,'VALUE_YN',lstr_data.as_data[3] )
	else
		// không có giao dịch mặc định
	end if	
	//-- set cài đặt ghi sổ phụ mặc định cho chứng từ --//
	if rpo_dw.describe( "sob_yn.x") <> "!" and idb_trans_id > 0 then
		rpo_dw.setitem(vl_currentrow,'sob_yn', lstr_data.as_data[4])
	end if	
end if
return vl_currentrow

end event

event e_dw_e_itemchanged;//--OVERRIDE --//


string					ls_qty_yn,ls_value_yn
double				ldb_trans_id
u_trans_setup		lu_trans_setup



if vs_colname = 'trans_desc' then
	ldb_trans_id = rpo_dw.getitemnumber(vl_currentrow,'trans_hdr_id')		

	if isnull(ldb_trans_id) then ldb_trans_id = 0
	if ldb_trans_id > 0  then
		lu_trans_setup= create u_trans_setup
		lu_trans_setup.f_get_qty_and_value_yn(ldb_trans_id, ls_qty_yn, ls_value_yn)
		rpo_dw.setitem(vl_currentrow, 'quantity_yn',ls_qty_yn)
		rpo_dw.setitem(vl_currentrow, 'value_yn',ls_value_yn)
		destroy u_trans_setup
	end if
end if

return 0

end event

event e_dw_dwnkey;call super::e_dw_dwnkey;string					ls_colname

if v_keycode = KeyEnter! or v_keycode = KeyTab! then
	ls_colname = rpo_dw.getcolumnname()
	if lower(ls_colname) = 'payment_method_code' then
		iw_display.dynamic event e_detail( )
		return 2
	end if
end if
return 0



end event

event e_dw_e_postsave;call super::e_dw_e_postsave;double		ldb_doc_id, ldb_extend_id, ldb_billto_id, ldb_object_id, ldb_payment_term, ldb_payment_method, ldb_delivery_mode
double		ldb_base_curr_id, ldb_exrate, ldb_driver_id, ldb_transport_id
decimal		ldc_transport_amt
string			ls_currCode, ls_currName,ls_desc, ls_addr, ls_qty_yn, ls_value_yn, ls_invoice_yn, ls_alloc_yn,ls_tax_included, ls_vendor_delivery_no
date			ld_due_date, ld_trans_date, ld_rec_inv_date

c_unit_instance			lc_unit_ins

ldb_doc_id =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'id') 
if ldb_doc_id > 0 then
	
	//-- booked_sliP--//
	ldb_extend_id = rpo_dw.getitemnumber(rpo_dw.getrow(), 'extend_id') 
	ldb_billto_id = rpo_dw.getitemnumber(rpo_dw.getrow(), 'invoice_object') 
	ldb_object_id =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'dr_cr_object') 
	ldb_payment_term =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'payment_term') 
	ldb_payment_method =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'payment_method') 
	ldb_delivery_mode =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'delivery_mode') 
	ls_desc =  rpo_dw.getitemstring(rpo_dw.getrow(), 'description')
	ls_addr =  rpo_dw.getitemstring(rpo_dw.getrow(), 'invoice_address') 
	ls_qty_yn =  rpo_dw.getitemstring(rpo_dw.getrow(), 'quantity_yn') 
	ls_value_yn =  rpo_dw.getitemstring(rpo_dw.getrow(), 'value_yn') 
	ls_invoice_yn =  rpo_dw.getitemstring(rpo_dw.getrow(), 'invoice_yn') 
	ls_alloc_yn =  rpo_dw.getitemstring(rpo_dw.getrow(), 'allocation_yn') 
	ls_tax_included =  rpo_dw.getitemstring(rpo_dw.getrow(), 'include_tax_yn') 
	ls_vendor_delivery_no =  rpo_dw.getitemstring(rpo_dw.getrow(), 'vendor_delivery_no') 
	ld_due_date =  date(rpo_dw.getitemdatetime(rpo_dw.getrow(), 'due_date') )
	ld_trans_date =  date(rpo_dw.getitemdatetime(rpo_dw.getrow(), 'trans_date') )
	ld_rec_inv_date =  date(rpo_dw.getitemdatetime(rpo_dw.getrow(), 'invoice_received_date') )
	ldb_exrate = rpo_dw.getitemnumber(rpo_dw.getrow(), 'exchange_rate') 	
	ldb_base_curr_id = rpo_dw.getitemnumber(rpo_dw.getrow(), 'CURRENCY_ID') 	
	if ldb_base_curr_id = 0 or isnull(ldb_base_curr_id) then
		lc_unit_ins.f_get_base_cur_ex( ldb_base_curr_id,ls_currCode, ls_currName, it_transaction )
		ldb_exrate = 1
	end if
	
	if rpo_dw.describe('rt_staff_point.coltype') = 'number' then
		ldb_driver_id = rpo_dw.getitemnumber(rpo_dw.getrow(), 'rt_staff_point') 
	end if
	if rpo_dw.describe('loc_id.coltype') = 'number' then
		ldb_transport_id = rpo_dw.getitemnumber(rpo_dw.getrow(), 'loc_id') 
	end if
	if rpo_dw.describe('RT_PAY_AMT.coltype') = 'number' then
		ldc_transport_amt = rpo_dw.getitemnumber(rpo_dw.getrow(), 'RT_PAY_AMT') 
	end if	
	if ldb_extend_id > 0 then
		//-- update--//		
		UPDATE booked_slip 
		set invoice_object = :ldb_billto_id , dr_cr_object =:ldb_object_id, payment_term= :ldb_payment_term, 
								payment_method = :ldb_payment_method, delivery_mode = :ldb_delivery_mode,
								currency_id = :ldb_base_curr_id, exchange_rate = :ldb_exrate, description = :ls_desc,
								invoice_address = :ls_addr, quantity_yn = :ls_qty_yn, value_yn = :ls_value_yn,
								invoice_yn = :ls_invoice_yn, allocation_yn = :ls_alloc_yn, include_tax_yn= :ls_tax_included,
								vendor_delivery_no = :ls_vendor_delivery_no, due_date = :ld_due_date, trans_date = :ld_trans_date,
								invoice_received_date = :ld_rec_inv_date, rt_staff_point = :ldb_driver_id, loc_id = :ldb_transport_id, RT_PAY_AMT = :ldc_transport_amt
		where id = :ldb_extend_id using it_transaction;
	else
		//-- insert--//
		ldb_extend_id =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'version_id') 
		INSERT into booked_slip (id, object_ref_id, object_ref_Table, company_id, branch_id, created_by, created_Date, last_mdf_by, last_mdf_date, doc_type,version_no,
								  invoice_object, dr_cr_object, payment_term, payment_method, delivery_mode, currency_id, exchange_rate, description, invoice_address,
								  quantity_yn, value_yn, invoice_yn, allocation_yn, include_tax_yn, vendor_delivery_no,due_date, trans_date, invoice_received_date,
								  rt_staff_point, loc_id, RT_PAY_AMT)
		VALUES(:ldb_extend_id, :ldb_doc_id, 'DOCUMENT',:gi_user_comp_id, :gdb_branch, :gi_userid, sysdate, :gi_userid, sysdate,'PAYMENT', 1,
					:ldb_billto_id,:ldb_object_id,:ldb_payment_term, :ldb_payment_method,:ldb_delivery_mode, :ldb_base_curr_id,:ldb_exrate ,:ls_desc, :ls_addr,
					:ls_qty_yn, :ls_value_yn, :ls_invoice_yn, :ls_alloc_yn, :ls_tax_included, :ls_vendor_delivery_no, :ld_due_date, :ld_trans_date, :ld_rec_inv_date,
					:ldb_driver_id, :ldb_transport_id, :ldc_transport_amt)
		using it_transaction;
	end if

	return 1
end if
return 0
end event

event e_dw_e_predelete;call super::e_dw_e_predelete;double		ldb_extend_id, ldb_doc_id
int				li_cnt

b_obj_instantiate		lbo_ins

	//-- check matching --//
	ldb_doc_id = rpo_dw.getitemnumber(vl_currentrow, 'id') 
	select count(id) into :li_cnt
	from matching where f_doc_id = :ldb_doc_id using it_transaction;
	if li_cnt > 0 then
		gf_messagebox('m.c_po.e_dw_e_predelete.01','Thông báo','Phiếu đã kết với chứng từ khác nên không xoá được','stop','ok',1)
		return -1
	end if
	//-- delete matching--//
	select count(id) into :li_cnt
	from matching where t_doc_id = :ldb_doc_id using it_transaction;	
	if li_cnt > 0 then					
		lbo_ins.f_upd_related_status_del(ldb_doc_id, 'none','PAYMENT_LINE', ldb_doc_id, 0, it_transaction)
//		delete from matching where t_doc_id = :ldb_doc_id using it_transaction;
	end if
	
	//-- delete detail--//
	ldb_extend_id = rpo_dw.getitemnumber(vl_currentrow, 'extend_id') 
	if ldb_extend_id > 0 then
		iw_display.f_get_transaction(it_transaction)
		DELETE  booked_slip where id = :ldb_extend_id using it_transaction;
		//-- PO_LINE--//
		DELETE  payment_line where object_ref_id = :ldb_extend_id using it_transaction;
		
		return 1
	end if

return 0
end event

event e_window_e_change_object;call super::e_window_e_change_object;long				ll_found
t_dw_mpl		ldw_main

ldw_main = iw_display.f_get_dwmain( )

ll_found = ldw_main.find( "Id=" +string( idb_main_id ), 1, ldw_main.rowcount())
if ll_found > 0 then
	ldw_main.scrolltorow( ll_found)
end if
return 0
end event

event e_window_e_detail_start;call super::e_window_e_detail_start;
t_dw_mpl 			ldw_main
ldw_main = iw_display.f_get_dwmain( )
if ldw_main.rowcount( ) > 0 then
	if ldw_main.f_get_ib_editing( ) then
		if iw_display.event e_save( ) = -1 then return -1
		ldw_main.f_set_ib_editing( true)
	else
		return 0
	end if
else
	return -1
end if
end event

event e_window_e_postadd;call super::e_window_e_postadd;
iw_display.idw_focus.setcolumn( 'document_date')
return 0
end event

