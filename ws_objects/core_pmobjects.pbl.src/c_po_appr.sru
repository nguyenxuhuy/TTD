$PBExportHeader$c_po_appr.sru
forward
global type c_po_appr from b_doc
end type
end forward

global type c_po_appr from b_doc
end type
global c_po_appr c_po_appr

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_related ()
public subroutine f_set_str_unit ()
public subroutine f_set_actionpane ()
public function integer f_resize_fixedpart_grid ()
public function integer f_resize_fixedpart_form ()
public function integer f_reset_fixedpart_grid ()
public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[])
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_document_pm_grid'
istr_dwo[1].s_dwo_form = 'd_document_pm_form'
istr_dwo[1].s_dwo_grid = 'd_document_pm_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_order_form;' 
istr_dwo[1].b_ref_table_yn  = true
istr_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;DOC_TYPE;VERSION_ID;'
//istr_dwo[1].b_relation_1_1 = true
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_gb_name = 'gb_6'
istr_dwo[1].s_description = 'Đơn đặt mua'

istr_dwo[2].s_dwo_default =  'd_order_form'
istr_dwo[2].s_dwo_form = 'd_order_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = true
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_details = 'd_po_line_grid;'
istr_dwo[2].s_dwo_master = 'd_document_pm_grid;'
istr_dwo[2].s_master_keycol = 'ID;'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[2].b_ref_table_yn  = true
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE;DOC_TYPE;ID'
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
istr_dwo[2].s_description = 'Mua hàng'

istr_dwo[3].s_dwo_default =  'd_po_line_grid'
istr_dwo[3].s_dwo_form = 'd_po_line_form'
istr_dwo[3].s_dwo_grid = 'd_po_line_grid'
istr_dwo[3].b_detail = true
istr_dwo[3].b_master = true
istr_dwo[3].b_cascade_del = true
istr_dwo[3].s_dwo_master = 'd_order_form;'
istr_dwo[3].s_dwo_details = 'd_order_catch_grid;d_tax_line_grid;'
istr_dwo[3].s_master_keycol = 'ID;'
istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[3].b_ref_table_yn  = false
istr_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[3].b_insert = true
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = true
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_excel = true
istr_dwo[3].b_traceable = true
istr_dwo[3].b_focus_master = false
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].s_gb_name = 'gb_7'
istr_dwo[3].s_description = 'Chi tiết đặt mua'

istr_dwo[4].s_dwo_default =  'd_tax_line_grid'
istr_dwo[4].s_dwo_form = ''
istr_dwo[4].s_dwo_grid = 'd_tax_line_grid'
istr_dwo[4].b_detail = true
istr_dwo[4].s_dwo_master = 'd_po_line_grid;'
istr_dwo[4].s_dwo_details = ''
istr_dwo[4].s_master_keycol = 'ID;'
istr_dwo[4].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[4].b_ref_table_yn  = false
istr_dwo[4].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[4].b_relation_1_1 = true
istr_dwo[4].b_insert = false
istr_dwo[4].b_update = true
istr_dwo[4].b_delete = false
istr_dwo[4].b_query = true
istr_dwo[4].b_print = true
istr_dwo[4].b_excel = true
istr_dwo[4].b_traceable = true
istr_dwo[4].b_keyboardlocked = true
istr_dwo[4].s_gb_name = 'gb_8'
istr_dwo[4].s_description = 'Thuế'

istr_dwo[5].s_dwo_default =  'd_order_catch_grid'
istr_dwo[5].s_dwo_form = ''
istr_dwo[5].s_dwo_grid = 'd_order_catch_grid'
istr_dwo[5].b_detail = true
istr_dwo[5].s_dwo_master = 'd_po_line_grid;'
istr_dwo[5].s_master_keycol = 'ID;'
istr_dwo[5].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[5].b_ref_table_yn  = false
istr_dwo[5].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[5].b_insert = true
istr_dwo[5].b_update = true
istr_dwo[5].b_delete = true
istr_dwo[5].b_query = true
istr_dwo[5].b_print = true
istr_dwo[5].b_excel = true
istr_dwo[5].b_traceable = true
istr_dwo[5].b_focus_master = false 
istr_dwo[5].b_keyboardlocked = true
istr_dwo[5].s_gb_name = 'gb_9'
istr_dwo[5].s_description = 'Chi tiết kiểm đếm'
end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_po_return'					// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = 'd_po_line_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'd_po_line_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].b_f_matching = true
istr_dwo_related[1].b_return = true //la doi duong tra hang
istr_dwo_related[1].s_relatedtext_column = 'doc_code'					
istr_dwo_related[1].s_text = 'Đơn trả hàng từ: '

istr_dwo_related[1].s_main_obj_dwo_copy[1] = 'd_po_line_grid' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[1] = 'line_no;object_type;ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;QTY;PRICE;AMOUNT;amount_ex_tax;base_amount_ex_tax;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;disc_amt;disc_pct;foc_yn;price;amount;amount_ex_tax;base_amount_ex_tax;' // cột copy từ
istr_dwo_related[1].s_related_obj_dwo_copy[1] = 'd_po_line_grid' //datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[1] = 'line_no;object_type;ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;QTY;PRICE;AMOUNT;amount_ex_tax;base_amount_ex_tax;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;disc_amt;disc_pct;foc_yn;price;amount;amount_ex_tax;base_amount_ex_tax;' // cột copy đến
istr_dwo_related[1].s_main_obj_column_chk[1] = ''
istr_dwo_related[1].s_related_obj_column_chk[1] = ''
istr_dwo_related[1].s_f_obj_column_chk[1] = ''
istr_dwo_related[1].s_t_obj_column_chk[1] = ''
istr_dwo_related[1].b_copy_line[1] = true
// khai báo cập nhật bản matching
istr_dwo_related[1].s_match_f_dwo[1] = 'd_po_line_grid'
istr_dwo_related[1].s_match_f_col_obj[1] = 'item_id'
istr_dwo_related[1].s_match_t_dwo[1] = 'd_po_line_grid'
istr_dwo_related[1].s_match_f_column[1] = 'qty'
istr_dwo_related[1].s_match_t_column[1] = 'qty'
istr_dwo_related[1].s_match_column[1] = 'qty'

istr_dwo_related[1].s_main_obj_dwo_copy[2] = 'd_order_form' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[2] = 'object_id;bill_to_object;object_code;object_name;ship_to_addtext;contact_name;contact_id;object_name_1;object_code_1;bill_to_addtext;'
istr_dwo_related[1].s_main_obj_column_copy[2] += 'request_ship_date;request_receive_date;base_date;confirm_ship_date;confirm_receive_date;due_date;'
istr_dwo_related[1].s_main_obj_column_copy[2] += 'payment_term_code;payment_term_name;payment_method_code;payment_method_name;delivery_mode_code;delivery_mode_name;'
istr_dwo_related[1].s_main_obj_column_copy[2] += 'uom_code;currency_id;exchange_rate;invoice_request;include_tax_yn;note;payment_term;payment_method;delivery_mode'
istr_dwo_related[1].s_related_obj_dwo_copy[2] = 'd_order_form' //datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[2] = 'object_id;bill_to_object;object_code;object_name;ship_to_addtext;contact_name;contact_id;object_name_1;object_code_1;bill_to_addtext;'
istr_dwo_related[1].s_related_obj_column_copy[2] += 'request_ship_date;request_receive_date;base_date;confirm_ship_date;confirm_receive_date;due_date;'
istr_dwo_related[1].s_related_obj_column_copy[2] += 'payment_term_code;payment_term_name;payment_method_code;payment_method_name;delivery_mode_code;delivery_mode_name;'
istr_dwo_related[1].s_related_obj_column_copy[2] += 'uom_code;currency_id;exchange_rate;invoice_request;include_tax_yn;note;payment_term;payment_method;delivery_mode'

istr_dwo_related[1].s_main_obj_dwo_copy[3] = 'd_tax_line_grid' 
istr_dwo_related[1].s_main_obj_column_copy[3] = 'tax_pct;tax_amt;tax_correction;exchange_rate'
istr_dwo_related[1].s_related_obj_dwo_copy[3] = 'd_tax_line_grid'
istr_dwo_related[1].s_related_obj_column_copy[3] ='tax_pct;tax_amt;tax_correction;exchange_rate'

istr_dwo_related[1].s_main_obj_dwo_copy[4] = 'd_order_catch_grid' 
istr_dwo_related[1].s_main_obj_column_copy[4] = 'CATCH_ITEM;object_code;object_name;uom_code;CATCH_UOM;CATCH_QTY;CATCH_TEXT'
istr_dwo_related[1].s_related_obj_dwo_copy[4] = 'd_order_catch_grid'
istr_dwo_related[1].s_related_obj_column_copy[4] = 'CATCH_ITEM;object_code;object_name;uom_code;CATCH_UOM;CATCH_QTY;CATCH_TEXT'
istr_dwo_related[1].s_main_obj_column_chk[4] = ''
istr_dwo_related[1].s_related_obj_column_chk[4] = ''
istr_dwo_related[1].s_match_f_dwo[4] = 'd_order_catch_grid'
istr_dwo_related[1].s_match_t_dwo[4] = 'd_order_catch_grid'
istr_dwo_related[1].s_match_f_column[4] = 'catch_qty'
istr_dwo_related[1].s_match_t_column[4] = 'catch_qty'
istr_dwo_related[1].s_match_column[4] = 'qty'
istr_dwo_related[1].s_main_obj_column_sum[4] = ''
istr_dwo_related[1].s_related_obj_column_sum[4] = ''
istr_dwo_related[1].s_f_obj_column_chk[4] = ''
istr_dwo_related[1].s_t_obj_column_chk[4] = ''
istr_dwo_related[1].b_f_sum[4] = false
istr_dwo_related[1].b_copy_line[4] = false

istr_dwo_related[2].s_related_obj_name = 'b_view'					// đối tượng liên quan
istr_dwo_related[2].s_main_obj_dwo = 'd_document_pm_grid'		//datawindow quan hệ main
istr_dwo_related[2].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[2].s_related_obj_dwo = 'dv_po_form'	// datawindow quan hệ đến
istr_dwo_related[2].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[2].s_relatedtext_column = 'code'					
istr_dwo_related[2].s_text = 'In đơn đặt hàng '

istr_dwo_related[3].s_related_obj_name = 'u_goods_receipt'					// đối tượng copy đến
istr_dwo_related[3].s_main_obj_dwo = 'd_po_line_grid'		//datawindow quan hệ main
istr_dwo_related[3].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[3].s_related_obj_dwo = 'd_inventory_line_receipt_grid'	// datawindow quan hệ đến
istr_dwo_related[3].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[3].b_f_matching = true
istr_dwo_related[3].s_relatedtext_column = 'doc_code'					
istr_dwo_related[3].s_text = 'Phiếu nhập kho từ : '

istr_dwo_related[3].s_main_obj_dwo_copy[1] = 'd_po_line_grid' // datawindow copy từ
istr_dwo_related[3].s_main_obj_column_copy[1] = 'ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;QTY;QTY;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;price;amount;base_amount;disc_amt;disc_pct' // cột copy từ
istr_dwo_related[3].s_related_obj_dwo_copy[1] = 'd_inventory_line_receipt_grid' // datawindow copy đến
istr_dwo_related[3].s_related_obj_column_copy[1] = 'ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;doc_qty;QTY;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;price;amount;base_amount;disc_amt;disc_pct' // cột copy đến
istr_dwo_related[3].s_main_obj_column_chk[1] = ''
istr_dwo_related[3].s_related_obj_column_chk[1] = ''
istr_dwo_related[3].s_f_obj_column_chk[1] = 'ITEM_ID;PRICE;foc_yn;'
istr_dwo_related[3].s_t_obj_column_chk[1] = 'ITEM_ID;PRICE;foc_yn;'
istr_dwo_related[3].b_copy_line[1] = true
// khai báo cập nhật bản matching
istr_dwo_related[3].s_match_f_dwo[1] = 'd_po_line_grid'
istr_dwo_related[3].s_match_f_col_obj[1] = 'item_id'
istr_dwo_related[3].s_match_t_dwo[1] = 'd_inventory_line_receipt_grid'
istr_dwo_related[3].s_match_f_column[1] = 'qty'
istr_dwo_related[3].s_match_t_column[1] = 'qty'
istr_dwo_related[3].s_match_column[1] = 'qty'
//tra hang
istr_dwo_related[3].s_match_rf_dwo[1] = 'd_po_line_grid'

istr_dwo_related[3].s_main_obj_dwo_copy[2] = 'd_order_form' 
istr_dwo_related[3].s_main_obj_column_copy[2] = 'object_id;object_code;object_name;'
istr_dwo_related[3].s_related_obj_dwo_copy[2] = 'd_inventory_line_receipt_grid'
istr_dwo_related[3].s_related_obj_column_copy[2] = 'object_id;vendor_code;vendor_name;'
istr_dwo_related[3].s_main_obj_column_chk[2] = 'object_id;object_code;object_name'
istr_dwo_related[3].s_related_obj_column_chk[2] = 'object_id;vendor_code;vendor_name;'

istr_dwo_related[3].s_main_obj_dwo_copy[3] = 'd_order_form' 
istr_dwo_related[3].s_main_obj_column_copy[3] = 'payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate;ship_to_addtext;bill_to_addtext;note;include_tax_yn;'
istr_dwo_related[3].s_related_obj_dwo_copy[3] = 'd_goods_receipt_form'
istr_dwo_related[3].s_related_obj_column_copy[3] = 'payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate;trans_address;invoice_address;note;include_tax_yn;'


istr_dwo_related[3].s_main_obj_dwo_copy[4] = 'd_order_catch_grid' 
istr_dwo_related[3].s_main_obj_column_copy[4] = 'CATCH_ITEM;object_code;object_name;uom_code;CATCH_UOM;CATCH_QTY;CATCH_QTY;CATCH_TEXT'
istr_dwo_related[3].s_related_obj_dwo_copy[4] = 'd_inventory_catch_grid'
istr_dwo_related[3].s_related_obj_column_copy[4] = 'CATCH_ITEM;item_code;item_name;uom_code;CATCH_UOM;CATCH_doc_QTY;CATCH_QTY;CATCH_TEXT'
istr_dwo_related[3].s_main_obj_column_chk[4] = ''
istr_dwo_related[3].s_related_obj_column_chk[4] = ''
istr_dwo_related[3].s_match_f_dwo[4] = 'd_order_catch_grid'
istr_dwo_related[3].s_match_t_dwo[4] = 'd_inventory_catch_grid'
istr_dwo_related[3].s_match_f_column[4] = 'catch_qty'
istr_dwo_related[3].s_match_t_column[4] = 'catch_qty'
istr_dwo_related[3].s_match_column[4] = 'qty'
istr_dwo_related[3].s_main_obj_column_sum[4] = ''
istr_dwo_related[3].s_related_obj_column_sum[4] = ''
istr_dwo_related[3].s_f_obj_column_chk[4] = ''
istr_dwo_related[3].s_t_obj_column_chk[4] = ''
istr_dwo_related[3].b_f_sum[4] = false
istr_dwo_related[3].b_copy_line[4] = false

istr_dwo_related[4].s_related_obj_name = 'u_pr'					// đối tượng quan hệ đến
istr_dwo_related[4].s_main_obj_dwo = 'd_po_line_grid'		//datawindow quan hệ main
istr_dwo_related[4].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[4].s_related_obj_dwo = 'd_pr_line_grid'	// datawindow quan hệ đến
istr_dwo_related[4].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[4].b_t_matching = true
istr_dwo_related[4].s_relatedtext_column = 'doc_code'					
istr_dwo_related[4].s_text = 'Yêu cầu mua hàng từ: '
istr_dwo_related[4].s_match_f_dwo[1] = 'd_pr_line_grid'
istr_dwo_related[4].s_match_t_dwo[1] = 'd_po_line_grid'
istr_dwo_related[4].s_match_f_column[1] = 'qty'
istr_dwo_related[4].s_match_t_column[1] = 'qty'
istr_dwo_related[4].s_match_column[1] = 'qty'
istr_dwo_related[4].s_match_f_dwo[2] = 'd_order_catch_grid'
istr_dwo_related[4].s_match_t_dwo[2] = 'd_order_catch_grid'
istr_dwo_related[4].s_match_f_column[2] = 'catch_qty'
istr_dwo_related[4].s_match_t_column[2] = 'catch_qty'
istr_dwo_related[4].s_match_column[2] = 'qty'

istr_dwo_related[5].s_related_obj_name = 'u_pur_invoice'					// đối tượng copy đến
istr_dwo_related[5].s_main_obj_dwo = 'd_po_line_grid'		//datawindow quan hệ main
istr_dwo_related[5].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[5].s_related_obj_dwo = 'd_pur_invoice_line_grid'	// datawindow quan hệ đến
istr_dwo_related[5].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[5].b_f_matching = true
istr_dwo_related[5].s_relatedtext_column = 'doc_code'					
istr_dwo_related[5].s_text = 'Hóa đơn phải trả từ: '

istr_dwo_related[5].s_main_obj_dwo_copy[1] = 'd_po_line_grid' // datawindow copy từ
istr_dwo_related[5].s_main_obj_column_copy[1] = 'ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;QTY;price;amount;base_amount;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;disc_amt;disc_pct;foc_yn' // cột copy từ
istr_dwo_related[5].s_related_obj_dwo_copy[1] = 'd_pur_invoice_line_grid' // datawindow copy đến
istr_dwo_related[5].s_related_obj_column_copy[1] = 'OBJECT_ID;object_code;object_name;LINE_TEXT;NOTE;QTY;price;amount;base_amount;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;disc_amt;disc_pct;foc_yn' // cột copy đến
istr_dwo_related[5].s_main_obj_column_chk[1] = ''
istr_dwo_related[5].s_related_obj_column_chk[1] = ''
istr_dwo_related[5].s_f_obj_column_chk[1] = 'ITEM_ID'
istr_dwo_related[5].s_t_obj_column_chk[1] = 'OBJECT_ID'
istr_dwo_related[5].b_copy_line[1] = true
// khai báo cập nhật bản matching
istr_dwo_related[5].s_match_f_dwo[1] = 'd_po_line_grid'
istr_dwo_related[5].s_match_f_col_obj[1] = 'item_id'
istr_dwo_related[5].s_match_t_dwo[1] = 'd_pur_invoice_line_grid'
istr_dwo_related[5].s_match_f_column[1] = 'qty'
istr_dwo_related[5].s_match_t_column[1] = 'qty'
istr_dwo_related[5].s_match_column[1] = 'qty'
//tra hang
istr_dwo_related[5].s_match_rf_dwo[1] = 'd_po_line_grid'

istr_dwo_related[5].s_main_obj_dwo_copy[2] = 'd_tax_line_grid' 
istr_dwo_related[5].s_main_obj_column_copy[2] = 'tax_type;tax_pct;tax_amt;tax_correction;'																		
istr_dwo_related[5].s_related_obj_dwo_copy[2] = 'd_pur_invoice_line_grid'
istr_dwo_related[5].s_related_obj_column_copy[2] = 'tax_type;tax_pct;tax_amt;tax_correction;'																	
istr_dwo_related[5].s_main_obj_column_chk[2] = 'tax_type;tax_pct;'
istr_dwo_related[5].s_related_obj_column_chk[2] = 'tax_type;tax_pct;'

istr_dwo_related[5].s_main_obj_dwo_copy[3] = 'd_order_form' 
istr_dwo_related[5].s_main_obj_column_copy[3] = 'bill_to_object;object_code_1;object_name_1;bill_to_addtext;bill_to_object;object_code_1;object_name_1;bill_to_addtext;'+&
																		'payment_term_code;payment_term_name;payment_term;payment_method_code;payment_method_name;payment_method;'+&
																		'include_tax_yn;uom_code;exchange_rate;currency_id;note;'
istr_dwo_related[5].s_related_obj_dwo_copy[3] = 'd_invoice_pur_form'
istr_dwo_related[5].s_related_obj_column_copy[3] = 'invoice_object;invoice_object_code;invoice_object_name;invoice_address;dr_cr_object;dr_cr_object_code;dr_cr_object_name;trans_address;'+&
																		'PAYMENT_TERM;payment_term_code;payment_term_name;PAYMENT_METHOD;payment_method_code;payment_method_name;'+&
																		'include_tax_yn;uom_code;exchange_rate;currency_id;note;'
istr_dwo_related[5].s_main_obj_column_chk[3] = 'bill_to_object;object_code_1;object_name_1;'
istr_dwo_related[5].s_related_obj_column_chk[3] = 'dr_cr_object;dr_cr_object_code;dr_cr_object_name;'
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
istr_dwo_related[6].s_main_obj_dwo = 	'd_po_line_grid'	//datawindow quan hệ main
istr_dwo_related[6].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[6].s_related_obj_dwo =  'd_object_grid'	// datawindow quan hệ đến
istr_dwo_related[6].s_related_obj_column = 'item_id'			// cột quan hệ đến
istr_dwo_related[6].s_relatedtext_column = 'code'					
istr_dwo_related[6].s_text = 'Đơn bán hàng của : '

istr_dwo_related[7].s_related_obj_name = 'u_map_invoice'
istr_dwo_related[7].s_main_obj_dwo = 'd_order_form'
istr_dwo_related[7].s_main_obj_column = 'bill_to_object'
istr_dwo_related[7].s_related_obj_dwo = 'd_address_map_form'
istr_dwo_related[7].s_related_obj_column = 'object_id'

istr_dwo_related[8].s_related_obj_name = 'u_map_delivery'
istr_dwo_related[8].s_main_obj_dwo = 'd_order_form'
istr_dwo_related[8].s_main_obj_column = 'object_id'
istr_dwo_related[8].s_related_obj_dwo = 'd_address_map_form'
istr_dwo_related[8].s_related_obj_column = 'object_id'

istr_dwo_related[9].s_related_obj_name = 'u_po'					// đối tượng copy đến
istr_dwo_related[9].s_main_obj_dwo = 'd_document_pm_grid'		//datawindow quan hệ main
istr_dwo_related[9].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[9].s_related_obj_dwo = 'd_document_pm_grid'	// datawindow quan hệ đến
istr_dwo_related[9].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[9].b_f_matching = true
istr_dwo_related[9].s_relatedtext_column = 'doc_code'					
istr_dwo_related[9].s_text = 'Nhân bản đơn đặt mua: '

istr_dwo_related[9].s_main_obj_dwo_copy[1] = 'd_document_pm_grid' // datawindow copy từ
istr_dwo_related[9].s_main_obj_column_copy[1] = 'lobject_name;ship_to_object_code;ship_to_object_name;trans_desc;group_name;req_appr_note;appr_note;doc_type;' // cột copy từ
istr_dwo_related[9].s_related_obj_dwo_copy[1] = 'd_document_pm_grid' //datawindow copy đến
istr_dwo_related[9].s_related_obj_column_copy[1] = 'object_name;ship_to_object_code;ship_to_object_name;trans_desc;group_name;req_appr_note;appr_note;doc_type;' // cột copy đến
istr_dwo_related[9].s_match_f_dwo[1] = 'd_document_pm_grid'
istr_dwo_related[9].s_match_t_dwo[1] = 'd_document_pm_grid'

istr_dwo_related[9].s_main_obj_dwo_copy[2] = 'd_po_line_grid' // datawindow copy từ
istr_dwo_related[9].s_main_obj_column_copy[2] = 'line_no;object_type;ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;QTY;PRICE;AMOUNT;amount_ex_tax;base_amount_ex_tax;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;disc_amt;disc_pct;foc_yn;price;amount;amount_ex_tax;base_amount_ex_tax;' // cột copy từ
istr_dwo_related[9].s_related_obj_dwo_copy[2] = 'd_po_line_grid' //datawindow copy đến
istr_dwo_related[9].s_related_obj_column_copy[2] = 'line_no;object_type;ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;QTY;PRICE;AMOUNT;amount_ex_tax;base_amount_ex_tax;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;disc_amt;disc_pct;foc_yn;price;amount;amount_ex_tax;base_amount_ex_tax;' // cột copy đến

istr_dwo_related[9].s_main_obj_dwo_copy[3] = 'd_order_form' // datawindow copy từ
istr_dwo_related[9].s_main_obj_column_copy[3] = 'object_id;bill_to_object;object_code;object_name;ship_to_addtext;contact_name;contact_id;object_name_1;object_code_1;bill_to_addtext;'
istr_dwo_related[9].s_main_obj_column_copy[3] += 'request_ship_date;request_receive_date;base_date;confirm_ship_date;confirm_receive_date;due_date;'
istr_dwo_related[9].s_main_obj_column_copy[3] += 'payment_term_code;payment_term_name;payment_method_code;payment_method_name;delivery_mode_code;delivery_mode_name;'
istr_dwo_related[9].s_main_obj_column_copy[3] += 'uom_code;currency_id;exchange_rate;invoice_request;include_tax_yn;note;payment_term;payment_method;delivery_mode'
istr_dwo_related[9].s_related_obj_dwo_copy[3] = 'd_order_form' //datawindow copy đến
istr_dwo_related[9].s_related_obj_column_copy[3] = 'object_id;bill_to_object;object_code;object_name;ship_to_addtext;contact_name;contact_id;object_name_1;object_code_1;bill_to_addtext;'
istr_dwo_related[9].s_related_obj_column_copy[3] += 'request_ship_date;request_receive_date;base_date;confirm_ship_date;confirm_receive_date;due_date;'
istr_dwo_related[9].s_related_obj_column_copy[3] += 'payment_term_code;payment_term_name;payment_method_code;payment_method_name;delivery_mode_code;delivery_mode_name;'
istr_dwo_related[9].s_related_obj_column_copy[3] += 'uom_code;currency_id;exchange_rate;invoice_request;include_tax_yn;note;payment_term;payment_method;delivery_mode'

istr_dwo_related[9].s_main_obj_dwo_copy[4] = 'd_tax_line_grid' 
istr_dwo_related[9].s_main_obj_column_copy[4] = 'tax_pct;tax_amt;tax_correction;exchange_rate'
istr_dwo_related[9].s_related_obj_dwo_copy[4] = 'd_tax_line_grid'
istr_dwo_related[9].s_related_obj_column_copy[4] ='tax_pct;tax_amt;tax_correction;exchange_rate'

istr_dwo_related[9].s_main_obj_dwo_copy[5] = 'd_order_catch_grid' 
istr_dwo_related[9].s_main_obj_column_copy[5] = 'CATCH_ITEM;object_code;object_name;uom_code;CATCH_UOM;CATCH_QTY;CATCH_TEXT'
istr_dwo_related[9].s_related_obj_dwo_copy[5] = 'd_order_catch_grid'
istr_dwo_related[9].s_related_obj_column_copy[5] = 'CATCH_ITEM;object_code;object_name;uom_code;CATCH_UOM;CATCH_QTY;CATCH_TEXT'
istr_dwo_related[9].s_main_obj_column_chk[5] = ''
istr_dwo_related[9].s_related_obj_column_chk[5] = ''
istr_dwo_related[9].s_match_f_dwo[5] = ''
istr_dwo_related[9].s_match_t_dwo[5] = ''
istr_dwo_related[9].s_match_f_column[5] = ''
istr_dwo_related[9].s_match_t_column[5] = ''
istr_dwo_related[9].s_match_column[5] = ''
istr_dwo_related[9].s_main_obj_column_sum[5] = ''
istr_dwo_related[9].s_related_obj_column_sum[5] = ''
istr_dwo_related[9].s_f_obj_column_chk[5] = ''
istr_dwo_related[9].s_t_obj_column_chk[5] = ''
istr_dwo_related[9].b_f_sum[5] = false
istr_dwo_related[9].b_copy_line[5] = false

end subroutine

public subroutine f_set_str_unit ();//--datawindow chứa các cột cần làm tròn--//
istr_unit[1].s_dwo_handing = 'd_po_line_grid'
//--các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = 'qty;price;amount;bc;ex'
//--nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[1].s_dwo_unit = 'd_po_line_grid;d_order_form;d_order_form;d_order_form;d_order_form'
//--tên cột hứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = 'uom_code;uom_code;uom_code;uom_code;exchange_rate'
//--loại làm tròn --//
istr_unit[1].s_type = 'item;price;amount;"";""'
//--datawindow của cột chứa mã hàng--//
istr_unit[1].s_dwo_object = 'd_po_line_grid'
//--cột chứa mã đơn vị--//
istr_unit[1].s_colname_object = 'item_code'
end subroutine

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

public function integer f_resize_fixedpart_grid ();this.iw_display.dynamic f_reset_ii_fixedpart2_height_grid(0)
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_resize_fixedpart_form ();this.iw_display.dynamic f_reset_ii_fixedpart2_height_form()
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_reset_fixedpart_grid ();this.iw_display.dynamic f_reset_ii_fixedpart2_height_grid()
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[]);if pos(rdw_focus.dataobject,'d_document_' ) > 0 then
	ra_args[1] = gi_userid
end if
return upperbound(ra_args)
end function

on c_po_appr.create
call super::create
end on

on c_po_appr.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = true
is_display_model = '5dgb'
ib_display_text = false
is_object_title = 'Duyệt đơn đặt mua'
istr_actionpane[1].s_button_name = 'b_approve;b_reject;'
istr_actionpane[1].s_description = is_object_title
end event

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.dynamic f_set_ii_fixedpart2_height(650 )
iw_display.dynamic f_set_ii_upperpart_height(1100)
iw_display.dynamic f_set_ii_gb_3_height( 520)
iw_display.dynamic f_set_ii_gb_4_height( 280)
return 0
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;double	ldb_trans_hdr_id,ldb_line_id
long		ll_row,ll_line_no,ll_idx
any		la_data[],la_retrieve[]
t_dw_mpl 	ldw_add_row,ldw_main

if mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_order' then
	rpo_dw.setitem(vl_currentrow,'doc_type','PO')
	rpo_dw.setitem(vl_currentrow,'object_type','VENDOR')
	rpo_dw.setitem( vl_currentrow, 'VERSION_NO', 1)
elseif pos(rpo_dw.dataobject,'d_po_line') > 0 then
	rpo_dw.setitem(vl_currentrow,'object_type','ITEM')
	if vl_currentrow = 1 then
		ll_line_no = 1
	else
		ll_line_no = vl_currentrow
		for ll_idx = vl_currentrow + 1 to rpo_dw.rowcount()
			rpo_dw.setitem(ll_idx,'line_no',ll_idx)
		next
	end if
	rpo_dw.setitem(vl_currentrow,'line_no',ll_line_no)
	ldw_main = iw_display.dynamic f_get_dwmain()
	if ldw_main.getrow() > 0 then
		ldb_trans_hdr_id = ldw_main.getitemnumber(ldw_main.getrow() , 'trans_hdr_id') 
		if idb_trans_id <> ldb_trans_hdr_id then
			la_data[1] = ldb_trans_hdr_id
			this.f_init_object_table(ids_trans_setup, 'd_trans_setup_grid', 'object_ref_id',la_data[],la_retrieve[])
			idb_trans_id = ldb_trans_hdr_id
		end if
		ldb_line_id = rpo_dw.getitemnumber(vl_currentrow,'id')
		f_post_tax(idb_trans_id,ldb_line_id, 'd_tax_line_grid')
	end if
elseif pos(rpo_dw.dataobject,'d_order_catch') > 0 then
	rpo_dw.setitem(vl_currentrow,'object_type','ITEM')
end if
return vl_currentrow
end event

event e_action_ctrl_bttn;call super::e_action_ctrl_bttn;datawindow				ldw_focus
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_filteron;b_query;b_refresh;b_blank;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_filteron;b_query;b_refresh;b_blank;b_approve;b_reject;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_filteron;b_query;b_refresh;b_blank;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_filteron;b_query;b_refresh;b_blank;b_approve;b_reject;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_filteron;b_query;b_refresh;b_blank;b_approve;b_reject;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_filteron;b_query;b_refresh;b_blank;b_approve;b_reject;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =   'b_pr;b_so_return;b_goods_delivery;b_sal_invoice;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
				istr_actionpane[li_idx].s_visible_buttons =  'b_book; b_attach; b_note;b_doc_trace_on;b_user_trace;b_appr_trace;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
				
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_open;call super::e_window_open;t_dw_mpl			ldw_main
any				laa_value[]
//--form parm--//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '=PO'
laa_value[2] = 'req_approve'
ldw_main.f_add_where('doc_type;status;',laa_value[])

return 0

end event

event e_window_e_approved;call super::e_window_e_approved;t_dw_mpl	ldw_main
string			ls_dwmain_filter,ls_filter

ldw_main = iw_display.f_get_dwmain( )
ls_dwmain_filter = this.is_dwmain_filter
ls_filter = "status = 'req_approve'"
if trim(ls_dwmain_filter) <> '' then ls_filter = ls_filter + ' AND ' + ls_dwmain_filter
ldw_main.setfilter( ls_filter)
ldw_main.filter( )
if ldw_main.getrow( ) = 1 or ldw_main.getrow( ) = ldw_main.rowcount( ) then
	ldw_main.f_filter_detail( )
end if
return 1
end event

