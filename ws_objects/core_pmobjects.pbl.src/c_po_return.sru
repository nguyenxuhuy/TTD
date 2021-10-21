$PBExportHeader$c_po_return.sru
forward
global type c_po_return from c_po
end type
end forward

global type c_po_return from c_po
end type
global c_po_return c_po_return

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_related ()
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
istr_dwo[1].s_description = 'Đơn trả hàng'

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
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE;doc_type;id'
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
istr_dwo[2].s_description = 'Trả hàng'

istr_dwo[3].s_dwo_default =  'd_po_line_grid'
istr_dwo[3].s_dwo_form = 'd_po_line_form'
istr_dwo[3].s_dwo_grid = 'd_po_line_grid'
istr_dwo[3].b_detail = true
istr_dwo[3].b_master = true
istr_dwo[3].b_cascade_del = true
istr_dwo[3].s_dwo_master = 'd_order_form;'
istr_dwo[3].s_dwo_details = 'd_order_catch_grid;d_tax_line_grid;'
istr_dwo[3].s_master_keycol = 'ID;'
istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID;'
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
istr_dwo[3].s_description = 'Chi tiết trả hàng'

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
istr_dwo[5].b_keyboardlocked = true
istr_dwo[5].b_focus_master = false 
istr_dwo[5].s_gb_name = 'gb_9'
istr_dwo[5].s_description = 'Chi tiết kiểm đếm'
end subroutine

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_dwo_related ();// Đối tượng liên quan
istr_dwo_related[1].s_related_obj_name = 'u_po'					// đối tượng quan hệ đến
istr_dwo_related[1].s_main_obj_dwo = 'd_document_pm_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'd_document_pm_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].b_t_matching = true
istr_dwo_related[1].b_return = true
istr_dwo_related[1].s_relatedtext_column = 'doc_code'					
istr_dwo_related[1].s_text = 'Đơn trả hàng từ: '
istr_dwo_related[1].s_match_f_dwo[1] = 'd_po_line_grid'
istr_dwo_related[1].s_match_f_col_obj[1] = 'item_id'
istr_dwo_related[1].s_match_t_dwo[1] = 'd_po_line_grid'
istr_dwo_related[1].s_match_f_column[1] = 'qty'
istr_dwo_related[1].s_match_t_column[1] = 'qty'
istr_dwo_related[1].s_match_column[1] = 'qty'

istr_dwo_related[1].s_match_f_dwo[2] = 'd_order_catch_grid'
istr_dwo_related[1].s_match_t_dwo[2] = 'd_order_catch_grid'
istr_dwo_related[1].s_match_f_column[2] = 'catch_qty'
istr_dwo_related[1].s_match_t_column[2] = 'catch_qty'
istr_dwo_related[1].s_match_column[2] = 'qty'

istr_dwo_related[2].s_related_obj_name = 'b_view'					// đối tượng liên quan
istr_dwo_related[2].s_main_obj_dwo = 'd_document_pm_grid'		//datawindow quan hệ main
istr_dwo_related[2].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[2].s_related_obj_dwo = 'dv_po_return_form'	// datawindow quan hệ đến
istr_dwo_related[2].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[2].s_relatedtext_column = 'code'					
istr_dwo_related[2].s_text = 'In đơn trả hàng '
// Đối tượng liên quan
istr_dwo_related[3].s_related_obj_name = 'u_goods_delivery'					// 
istr_dwo_related[3].s_main_obj_dwo = 'd_document_pm_grid'		//datawindow quan 
istr_dwo_related[3].s_main_obj_column = 'id'			//  main
istr_dwo_related[3].s_related_obj_dwo = 'd_document_inventory_grid'	// datawindow quan 
istr_dwo_related[3].s_related_obj_column = 'id'			// 
istr_dwo_related[3].b_f_matching = true
istr_dwo_related[3].s_relatedtext_column = 'doc_code'					
istr_dwo_related[3].s_text = 'Phiều xuất kho từ đề xuất trả hàng: '

istr_dwo_related[3].s_main_obj_dwo_copy[1] = 'd_po_line_grid' // datawindow copy 
istr_dwo_related[3].s_main_obj_column_copy[1] ='ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;QTY;QTY;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;price;amount;disc_amt;disc_pct' 
istr_dwo_related[3].s_related_obj_dwo_copy[1] = 'd_inventory_line_delivery_grid' // datawindow copy 
istr_dwo_related[3].s_related_obj_column_copy[1] = 'ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;QTY;QTY;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;price;amount;disc_amt;disc_pct' 
istr_dwo_related[3].s_main_obj_column_chk[1] = ''
istr_dwo_related[3].s_related_obj_column_chk[1] = ''
istr_dwo_related[3].s_f_obj_column_chk[1] = 'ITEM_ID'
istr_dwo_related[3].s_t_obj_column_chk[1] = 'ITEM_ID'
istr_dwo_related[3].b_copy_line[1] = true
// khai  matching
istr_dwo_related[3].s_match_f_dwo[1] = 'd_po_line_grid'
istr_dwo_related[3].s_match_f_col_obj[1] = 'item_id'
istr_dwo_related[3].s_match_t_dwo[1] = 'd_inventory_line_delivery_grid'
istr_dwo_related[3].s_match_f_column[1] = 'qty'
istr_dwo_related[3].s_match_t_column[1] = 'qty'
istr_dwo_related[3].s_match_column[1] = 'qty'

istr_dwo_related[3].s_main_obj_dwo_copy[2] = 'd_order_form' 
istr_dwo_related[3].s_main_obj_column_copy[2] = 'object_id;object_code;object_name;'
istr_dwo_related[3].s_related_obj_dwo_copy[2] = 'd_goods_delivery_form'
istr_dwo_related[3].s_related_obj_column_copy[2] = 'invoice_object;object_code;object_name;'
istr_dwo_related[3].s_main_obj_column_chk[2] = 'object_id;object_code;object_name'
istr_dwo_related[3].s_related_obj_column_chk[2] = 'invoice_object;object_code;object_name;'
//istr_dwo_related[3].s_related_obj_column_copy[2] = 'object_id;cus_code;cus_name;'
//istr_dwo_related[3].s_main_obj_column_chk[2] = 'object_id;object_code;object_name'
//istr_dwo_related[3].s_related_obj_column_chk[2] = 'object_id;cus_code;cus_name;'

istr_dwo_related[3].s_main_obj_dwo_copy[3] = 'd_order_form' 
istr_dwo_related[3].s_main_obj_column_copy[3] = 'payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate;ship_to_addtext;bill_to_addtext;note;'
istr_dwo_related[3].s_related_obj_dwo_copy[3] = 'd_goods_delivery_form'
istr_dwo_related[3].s_related_obj_column_copy[3] = 'payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate;trans_address;invoice_address;note;'

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
// Đối tượng liên quan
istr_dwo_related[4].s_related_obj_name = 'u_pur_invoice_return'					// đối tượng copy đến
istr_dwo_related[4].s_main_obj_dwo = 'd_document_pm_grid'		//datawindow quan hệ main
istr_dwo_related[4].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[4].s_related_obj_dwo = 'd_document_ap_grid'	// datawindow quan hệ đến
istr_dwo_related[4].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[4].b_f_matching = true
istr_dwo_related[4].s_relatedtext_column = 'doc_code'					
istr_dwo_related[4].s_text = 'Đơn trả hàng từ: '

istr_dwo_related[4].s_main_obj_dwo_copy[1] = 'd_po_line_grid' // datawindow copy từ
istr_dwo_related[4].s_main_obj_column_copy[1] = 'ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;QTY;price;amount;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;disc_amt;disc_pct;foc_yn' // cột copy từ
istr_dwo_related[4].s_related_obj_dwo_copy[1] = 'd_pur_invoice_line_grid' // datawindow copy đến
istr_dwo_related[4].s_related_obj_column_copy[1] = 'OBJECT_ID;object_code;object_name;LINE_TEXT;NOTE;QTY;price;amount;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;disc_amt;disc_pct;foc_yn' // cột copy đến
istr_dwo_related[4].s_main_obj_column_chk[1] = ''
istr_dwo_related[4].s_related_obj_column_chk[1] = ''
istr_dwo_related[4].s_f_obj_column_chk[1] = 'ITEM_ID'
istr_dwo_related[4].s_t_obj_column_chk[1] = 'OBJECT_ID'
istr_dwo_related[4].b_copy_line[1] = true
// khai báo cập nhật bản matching
istr_dwo_related[4].s_match_f_dwo[1] = 'd_po_line_grid'
istr_dwo_related[4].s_match_f_col_obj[1] = 'item_id'
istr_dwo_related[4].s_match_t_dwo[1] = 'd_pur_invoice_line_grid'
istr_dwo_related[4].s_match_f_column[1] = 'qty'
istr_dwo_related[4].s_match_t_column[1] = 'qty'
istr_dwo_related[4].s_match_column[1] = 'qty'

//khai bao lay gia hoa don mua
istr_dwo_related[4].b_get_price=true
istr_dwo_related[4].s_dwo_get_price='d_pur_invoice_line_grid'
istr_dwo_related[4].s_col_get_price[1]='price'
istr_dwo_related[4].s_col_get_qty[1]=''
istr_dwo_related[4].s_dwo_set_price='d_pur_invoice_line_grid'
istr_dwo_related[4].s_col_set_price[1]='price'
istr_dwo_related[4].s_col_set_qty[1]=''


istr_dwo_related[4].s_main_obj_dwo_copy[2] = 'd_tax_line_grid' 
istr_dwo_related[4].s_main_obj_column_copy[2] = 'tax_type;tax_pct;tax_amt;tax_correction;'																		
istr_dwo_related[4].s_related_obj_dwo_copy[2] = 'd_pur_invoice_line_grid'
istr_dwo_related[4].s_related_obj_column_copy[2] = 'tax_type;tax_pct;tax_amt;tax_correction;'																	
istr_dwo_related[4].s_main_obj_column_chk[2] = 'tax_type;tax_pct;'
istr_dwo_related[4].s_related_obj_column_chk[2] = 'tax_type;tax_pct;'

istr_dwo_related[4].s_main_obj_dwo_copy[3] = 'd_order_form' 
istr_dwo_related[4].s_main_obj_column_copy[3] = 'bill_to_object;object_code_1;object_name_1;bill_to_addtext;bill_to_object;object_code_1;object_name_1;bill_to_addtext;'+&
																		'payment_term_code;payment_term_name;payment_term;payment_method_code;payment_method_name;payment_method;'+&
																		'include_tax_yn;uom_code;exchange_rate;currency_id;note;'
istr_dwo_related[4].s_related_obj_dwo_copy[3] = 'd_invoice_pur_form'
istr_dwo_related[4].s_related_obj_column_copy[3] = 'invoice_object;invoice_object_code;invoice_object_name;invoice_address;dr_cr_object;dr_cr_object_code;dr_cr_object_name;trans_address;'+&
																		'PAYMENT_TERM;payment_term_code;payment_term_name;PAYMENT_METHOD;payment_method_code;payment_method_name;'+&
																		'include_tax_yn;uom_code;exchange_rate;currency_id;note;'
istr_dwo_related[4].s_main_obj_column_chk[3] = 'bill_to_object;object_code_1;object_name_1;'
istr_dwo_related[4].s_related_obj_column_chk[3] = 'dr_cr_object;dr_cr_object_code;dr_cr_object_name;'
istr_dwo_related[4].s_match_f_dwo[3] = ''
istr_dwo_related[4].s_match_t_dwo[3] = ''
istr_dwo_related[4].s_match_f_column[3] = ''
istr_dwo_related[4].s_match_t_column[3] = ''
istr_dwo_related[4].s_match_column[3] = ''
istr_dwo_related[4].s_main_obj_column_sum[3] = ''
istr_dwo_related[4].s_related_obj_column_sum[3] = ''
istr_dwo_related[4].s_f_obj_column_chk[3] = ''
istr_dwo_related[4].s_t_obj_column_chk[3] = ''
istr_dwo_related[4].b_f_sum[3] = false
istr_dwo_related[4].b_copy_line[3] = false


istr_dwo_related[5].s_related_obj_name = 'u_map_delivery'
istr_dwo_related[5].s_main_obj_dwo = 'd_order_form'
istr_dwo_related[5].s_main_obj_column = 'object_id'
istr_dwo_related[5].s_related_obj_dwo = 'd_address_map_form'
istr_dwo_related[5].s_related_obj_column = 'object_id'

istr_dwo_related[6].s_related_obj_name = 'u_map_invoice'
istr_dwo_related[6].s_main_obj_dwo = 'd_order_form'
istr_dwo_related[6].s_main_obj_column = 'bill_to_object'
istr_dwo_related[6].s_related_obj_dwo = 'd_address_map_form'
istr_dwo_related[6].s_related_obj_column = 'object_id'
// Đối tượng liên quan
istr_dwo_related[7].s_related_obj_name = 'u_po_return'					// đối tượng copy đến
istr_dwo_related[7].s_main_obj_dwo = 'd_document_pm_grid'		//datawindow quan hệ main
istr_dwo_related[7].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[7].s_related_obj_dwo = 'd_document_pm_grid'	// datawindow quan hệ đến
istr_dwo_related[7].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[7].b_f_matching = true
istr_dwo_related[7].s_relatedtext_column = 'doc_code'					
istr_dwo_related[7].s_text = 'Nhân bản đơn trả hàng: '

istr_dwo_related[7].s_main_obj_dwo_copy[1] = 'd_document_pm_grid' // datawindow copy từ
istr_dwo_related[7].s_main_obj_column_copy[1] = 'object_name;ship_to_object_code;ship_to_object_name;trans_desc;group_name;req_appr_note;appr_note;doc_type;' // cột copy từ
istr_dwo_related[7].s_related_obj_dwo_copy[1] = 'd_document_pm_grid' //datawindow copy đến
istr_dwo_related[7].s_related_obj_column_copy[1] = 'object_name;ship_to_object_code;ship_to_object_name;trans_desc;group_name;req_appr_note;appr_note;doc_type;' // cột copy đến
istr_dwo_related[7].s_match_f_dwo[1] = 'd_document_pm_grid'
istr_dwo_related[7].s_match_t_dwo[1] = 'd_document_pm_grid'

istr_dwo_related[7].s_main_obj_dwo_copy[2] = 'd_po_line_grid' // datawindow copy từ
istr_dwo_related[7].s_main_obj_column_copy[2] = 'line_no;object_type;ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;QTY;PRICE;AMOUNT;amount_ex_tax;base_amount_ex_tax;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;disc_amt;disc_pct;foc_yn;price;amount;amount_ex_tax;base_amount_ex_tax;' // cột copy từ
istr_dwo_related[7].s_related_obj_dwo_copy[2] = 'd_po_line_grid' //datawindow copy đến
istr_dwo_related[7].s_related_obj_column_copy[2] = 'line_no;object_type;ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;QTY;PRICE;AMOUNT;amount_ex_tax;base_amount_ex_tax;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;disc_amt;disc_pct;foc_yn;price;amount;amount_ex_tax;base_amount_ex_tax;' // cột copy đến

istr_dwo_related[7].s_main_obj_dwo_copy[3] = 'd_order_form' // datawindow copy từ
istr_dwo_related[7].s_main_obj_column_copy[3] = 'object_id;bill_to_object;object_code;object_name;ship_to_addtext;contact_name;contact_id;object_name_1;object_code_1;bill_to_addtext;'
istr_dwo_related[7].s_main_obj_column_copy[3] += 'request_ship_date;request_receive_date;base_date;confirm_ship_date;confirm_receive_date;due_date;'
istr_dwo_related[7].s_main_obj_column_copy[3] += 'payment_term_code;payment_term_name;payment_method_code;payment_method_name;delivery_mode_code;delivery_mode_name;'
istr_dwo_related[7].s_main_obj_column_copy[3] += 'uom_code;currency_id;exchange_rate;invoice_request;include_tax_yn;note;payment_term;payment_method;delivery_mode'
istr_dwo_related[7].s_related_obj_dwo_copy[3] = 'd_order_form' //datawindow copy đến
istr_dwo_related[7].s_related_obj_column_copy[3] = 'object_id;bill_to_object;object_code;object_name;ship_to_addtext;contact_name;contact_id;object_name_1;object_code_1;bill_to_addtext;'
istr_dwo_related[7].s_related_obj_column_copy[3] += 'request_ship_date;request_receive_date;base_date;confirm_ship_date;confirm_receive_date;due_date;'
istr_dwo_related[7].s_related_obj_column_copy[3] += 'payment_term_code;payment_term_name;payment_method_code;payment_method_name;delivery_mode_code;delivery_mode_name;'
istr_dwo_related[7].s_related_obj_column_copy[3] += 'uom_code;currency_id;exchange_rate;invoice_request;include_tax_yn;note;payment_term;payment_method;delivery_mode'

istr_dwo_related[7].s_main_obj_dwo_copy[4] = 'd_tax_line_grid' 
istr_dwo_related[7].s_main_obj_column_copy[4] = 'tax_pct;tax_amt;tax_correction;exchange_rate'
istr_dwo_related[7].s_related_obj_dwo_copy[4] = 'd_tax_line_grid'
istr_dwo_related[7].s_related_obj_column_copy[4] ='tax_pct;tax_amt;tax_correction;exchange_rate'

istr_dwo_related[7].s_main_obj_dwo_copy[5] = 'd_order_catch_grid' 
istr_dwo_related[7].s_main_obj_column_copy[5] = 'CATCH_ITEM;object_code;object_name;uom_code;CATCH_UOM;CATCH_QTY;CATCH_TEXT'
istr_dwo_related[7].s_related_obj_dwo_copy[5] = 'd_order_catch_grid'
istr_dwo_related[7].s_related_obj_column_copy[5] = 'CATCH_ITEM;object_code;object_name;uom_code;CATCH_UOM;CATCH_QTY;CATCH_TEXT'
istr_dwo_related[7].s_main_obj_column_chk[5] = ''
istr_dwo_related[7].s_related_obj_column_chk[5] = ''
istr_dwo_related[7].s_match_f_dwo[5] = ''
istr_dwo_related[7].s_match_t_dwo[5] = ''
istr_dwo_related[7].s_match_f_column[5] = ''
istr_dwo_related[7].s_match_t_column[5] = ''
istr_dwo_related[7].s_match_column[5] = ''
istr_dwo_related[7].s_main_obj_column_sum[5] = ''
istr_dwo_related[7].s_related_obj_column_sum[5] = ''
istr_dwo_related[7].s_f_obj_column_chk[5] = ''
istr_dwo_related[7].s_t_obj_column_chk[5] = ''
istr_dwo_related[7].b_f_sum[5] = false
istr_dwo_related[7].b_copy_line[5] = false



end subroutine

on c_po_return.create
call super::create
end on

on c_po_return.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = true
is_display_model = '5dgb'
ib_display_text = false
is_object_title = 'Đơn trả hàng'
is_exrate_type = 'sell'
istr_actionpane[1].s_button_name = 'b_add_multi;b_join_multi;b_copyt_multi;b_insert;b_modify;b_save; b_saveclose;b_filteron;b_query;b_refresh;b_delete;b_view_po_return;b_send_2_approve;b_request_2_change;b_approve;b_reject;'
istr_actionpane[1].s_button_has_sub = 'b_add_multi;b_join_multi;b_copyt_multi;'
istr_actionpane[1].sa_sub_button[1]='b_add;b_copyf_po;b_copyt_seft;'
istr_actionpane[1].sa_sub_button[2]='b_copyl_po;'
istr_actionpane[1].sa_sub_button[3]='b_copyt_goods_delivery;b_copyt_pur_invoice_return;'
istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_description = is_object_title
end event

event e_dw_e_preretrieve;//string				ls_columns
//any				laa_arg[]
//
//if mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject) - 5) = 'd_document' then
//	ls_columns = 'doc_type'
//	laa_arg[1] = '=po_return'
//	rpo_dw.dynamic f_add_where(ls_columns,laa_arg)
//end if
return 1
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;
if pos(rpo_dw.dataobject,'d_document') > 0 then
	 rpo_dw.setitem(vl_currentrow,'doc_type','PO_RETURN')
elseif mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_order' then
	rpo_dw.setitem(vl_currentrow,'doc_type','PO_RETURN')
end if
return vl_currentrow

end event

event e_action_ctrl_bttn;datawindow				ldw_focus
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_join_multi;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_blank;b_copyt_multi;b_blank;b_view_po_return;b_blank;b_send_2_approve;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_blank;b_copyt_multi;b_blank;b_view_po_return;b_blank;b_send_2_approve;b_approve;b_reject;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_blank;b_copyt_multi;b_blank;b_view_po_return;b_blank;b_send_2_approve;b_total;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query; b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_blank;b_copyt_multi;b_blank;b_view_po_return;b_blank;b_send_2_approve;b_total;b_approve;b_reject;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons= 'b_add_multi;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_blank;b_copyt_multi;b_blank;b_view_po_return;b_blank;b_send_2_approve;b_approve;b_reject;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_copyt_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_cancel;b_blank;b_copyt_multi;b_blank;b_view_po_return;b_blank;b_send_2_approve;b_approve;b_reject;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =   'b_po;b_pur_invoice_return;b_goods_delivery;'
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

event e_window_open;t_dw_mpl			ldw_main
any				laa_value[]
//--form parm--//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '=PO_RETURN'
ldw_main.f_add_where('doc_type;',laa_value[])
return 0
end event

