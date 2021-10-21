$PBExportHeader$c_so_appr.sru
forward
global type c_so_appr from b_doc
end type
end forward

global type c_so_appr from b_doc
end type
global c_so_appr c_so_appr

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_str_unit ()
public subroutine f_set_dwo_related ()
public subroutine f_set_actionpane ()
public function integer f_resize_fixedpart_grid ()
public function integer f_resize_fixedpart_form ()
public function integer f_reset_fixedpart_grid ()
public function integer f_get_item_can_not_sale (double vdb_obj_ref_id, ref string rs_item_code, ref t_ds_db rds_so_line, t_transaction vt_transaction)
public function integer f_set_other_note_so_line (t_ds_db vds_so_line, string vs_text)
public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[])
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_document_orders_grid'
istr_dwo[1].s_dwo_form = 'd_document_orders_form'
istr_dwo[1].s_dwo_grid = 'd_document_orders_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_order_so_form;'
istr_dwo[1].s_dwo_shared = ''
istr_dwo[1].s_dwo_master = ''
istr_dwo[1].s_master_keycol = ''
istr_dwo[1].s_detail_keycol = ''
istr_dwo[1].b_ref_table_yn  = true
istr_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;DOC_TYPE;VERSION_ID'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_gb_name = 'gb_6'
istr_dwo[1].s_description = 'Danh sách chứng từ'

istr_dwo[2].s_dwo_default =  'd_order_so_form'
istr_dwo[2].s_dwo_form = 'd_order_so_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = true
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_master = 'd_document_orders_grid;'
istr_dwo[2].s_dwo_details = 'd_so_line_grid;d_so_tech_grid;'
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
istr_dwo[2].s_description = 'Chi tiết chứng từ'

istr_dwo[3].s_dwo_default =  'd_so_line_grid'
istr_dwo[3].s_dwo_form = ''
istr_dwo[3].s_dwo_grid = 'd_so_line_grid'
istr_dwo[3].b_master = true
istr_dwo[3].b_detail = true
istr_dwo[3].b_cascade_del = true
istr_dwo[3].s_dwo_master = 'd_order_so_form;'
istr_dwo[3].s_dwo_details = 'd_order_catch_grid;d_tax_line_grid;'
istr_dwo[3].s_master_keycol = 'ID;'
istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[3].b_ref_table_yn  = false
istr_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[3].b_insert = true
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = true
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_excel = true
istr_dwo[3].b_traceable = true
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].s_gb_name = 'gb_7'
istr_dwo[3].s_description = 'Danh mục hàng hóa'

istr_dwo[4].s_dwo_default =  'd_tax_line_grid'
istr_dwo[4].s_dwo_form = ''
istr_dwo[4].s_dwo_grid = 'd_tax_line_grid'
istr_dwo[4].b_detail = true
istr_dwo[4].s_dwo_master = 'd_so_line_grid;'
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
istr_dwo[4].s_description = 'Thuế'

istr_dwo[5].s_dwo_default =  'd_order_catch_grid'
istr_dwo[5].s_dwo_form = ''
istr_dwo[5].s_dwo_grid = 'd_order_catch_grid'
istr_dwo[5].b_detail = true
istr_dwo[5].s_dwo_master = 'd_so_line_grid;'
istr_dwo[5].s_dwo_details = ''
istr_dwo[5].s_master_keycol = 'ID;'
istr_dwo[5].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[5].b_ref_table_yn  = false
istr_dwo[5].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[5].b_insert = true
istr_dwo[5].b_update = true
istr_dwo[5].b_delete = true
istr_dwo[5].b_query = true
istr_dwo[5].b_print = true
istr_dwo[5].b_excel = true
istr_dwo[5].b_traceable = true
istr_dwo[5].b_keyboardlocked = true
istr_dwo[5].s_gb_name = 'gb_8'
istr_dwo[5].s_description = 'Kiểm đếm chi tiết'

istr_dwo[6].s_dwo_default =  'd_so_tech_grid'
istr_dwo[6].s_dwo_form = ''
istr_dwo[6].s_dwo_grid = 'd_so_tech_grid'
istr_dwo[6].b_detail = true
istr_dwo[6].s_dwo_details = ''
istr_dwo[6].s_dwo_master = 'd_order_so_form'
istr_dwo[6].s_master_keycol = 'ID;'
istr_dwo[6].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[6].b_ref_table_yn  = false
istr_dwo[6].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[6].b_insert = true
istr_dwo[6].b_update = true
istr_dwo[6].b_delete = true
istr_dwo[6].b_query = true
istr_dwo[6].b_print = true
istr_dwo[6].b_excel = true
istr_dwo[6].b_traceable = true
istr_dwo[6].b_keyboardlocked = true
istr_dwo[6].s_gb_name = 'gb_9'
istr_dwo[6].s_description = 'Phân công nhân viên kỹ thuật '




end subroutine

public subroutine f_set_str_unit ();//--datawindow chứa các cột cần làm tròn--//
istr_unit[1].s_dwo_handing = 'd_so_line_grid'
//--các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = 'qty;price;amount;bc;ex'
//--nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[1].s_dwo_unit = 'd_so_line_grid;d_order_so_form;d_order_so_form;d_order_so_form;d_order_so_form'
//--tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = 'uom_code;uom_code;uom_code;uom_code;exchange_rate'
//--loại làm tròn --//
istr_unit[1].s_type = 'item;price;amount;bc;ex'
//--datawindow của cột chứa mã hàng--//
istr_unit[1].s_dwo_object = 'd_so_line_grid'
//--cột chứa mã hàng--//
istr_unit[1].s_colname_object = 'object_code'
end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_pr'					// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = 'd_so_line_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'd_pr_line_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].b_f_matching = true
istr_dwo_related[1].s_relatedtext_column = 'doc_code'					
istr_dwo_related[1].s_text = 'Yêu cầu mua hàng từ: '
// datawindow copy từ
istr_dwo_related[1].s_main_obj_dwo_copy[1] = 'd_so_line_grid' 
// cột copy từ
istr_dwo_related[1].s_main_obj_column_copy[1] = 'object_code;item_name;LINE_TEXT;NOTE;QTY;spec_code;spec_name;uom_code;TRANS_UOM;ITEM_ID;SPEC_ID;'
//datawindow copy đến
istr_dwo_related[1].s_related_obj_dwo_copy[1] = 'd_pr_line_grid'
// cột copy đến
istr_dwo_related[1].s_related_obj_column_copy[1] = 'item_code;item_name;LINE_TEXT;NOTE;QTY;spec_code;spec_name;uom_code;TRANS_UOM;ITEM_ID;SPEC_ID;'
// cột check cùng loại thường dùng cho master
istr_dwo_related[1].s_main_obj_column_chk[1] = ''
istr_dwo_related[1].s_related_obj_column_chk[1] = ''
istr_dwo_related[1].s_f_obj_column_chk[1] = 'ITEM_ID'
istr_dwo_related[1].s_t_obj_column_chk[1] = 'ITEM_ID'
istr_dwo_related[1].b_copy_line[1] = true
istr_dwo_related[1].s_match_f_dwo[1] = 'd_so_line_grid'
istr_dwo_related[1].s_match_t_dwo[1] = 'd_pr_line_grid'
istr_dwo_related[1].s_match_f_column[1] = 'qty'
istr_dwo_related[1].s_match_t_column[1] = 'qty'
istr_dwo_related[1].s_match_column[1] = 'qty'

istr_dwo_related[1].s_main_obj_dwo_copy[2] = 'd_order_catch_grid' 
istr_dwo_related[1].s_main_obj_column_copy[2] =  'object_code;object_name;uom_code;CATCH_UOM;CATCH_QTY;CATCH_TEXT;CATCH_ITEM;'
istr_dwo_related[1].s_related_obj_dwo_copy[2] = 'd_order_catch_grid'
istr_dwo_related[1].s_related_obj_column_copy[2] =  'object_code;object_name;uom_code;CATCH_UOM;CATCH_QTY;CATCH_TEXT;CATCH_ITEM;'
istr_dwo_related[1].s_main_obj_column_chk[2] = ''
istr_dwo_related[1].s_related_obj_column_chk[2] = ''
istr_dwo_related[1].s_match_f_dwo[2] = 'd_order_catch_grid'
istr_dwo_related[1].s_match_t_dwo[2] = 'd_order_catch_grid'
istr_dwo_related[1].s_match_f_column[2] = 'catch_qty'
istr_dwo_related[1].s_match_t_column[2] = 'catch_qty'
istr_dwo_related[1].s_match_column[2] = 'qty'
istr_dwo_related[1].s_main_obj_column_sum[2] = ''
istr_dwo_related[1].s_related_obj_column_sum[2] = ''
istr_dwo_related[1].s_f_obj_column_chk[2] = ''
istr_dwo_related[1].s_t_obj_column_chk[2] = ''
istr_dwo_related[1].b_f_sum[2] = false
istr_dwo_related[1].b_copy_line[2] = true

istr_dwo_related[2].s_related_obj_name = 'b_view'				// đối tượng copy đến
istr_dwo_related[2].s_main_obj_dwo = 'd_document_orders_grid'		//datawindow quan hệ main
istr_dwo_related[2].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[2].s_related_obj_dwo = 'dv_so_form'	// datawindow quan hệ đến
istr_dwo_related[2].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[2].s_relatedtext_column = 'code'					
istr_dwo_related[2].s_text = 'In đề xuất bán hàng'

istr_dwo_related[3].s_related_obj_name = 'u_goods_delivery'					// đối tượng copy đến
istr_dwo_related[3].s_main_obj_dwo = 'd_so_line_grid'		//datawindow quan hệ main
istr_dwo_related[3].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[3].s_related_obj_dwo = 'd_inventory_line_delivery_grid'	// datawindow quan hệ đến
istr_dwo_related[3].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[3].b_f_matching = true
istr_dwo_related[3].s_relatedtext_column = 'doc_code'					
istr_dwo_related[3].s_text = 'Phiếu xuất kho từ : '

istr_dwo_related[3].s_main_obj_dwo_copy[1] = 'd_so_line_grid' // datawindow copy từ
istr_dwo_related[3].s_main_obj_column_copy[1] = 'ITEM_ID;object_code;item_name;LINE_TEXT;NOTE;QTY;act_qty;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;PRICE;AMOUNT;' + &
																		'ACT_PRICE;ACT_AMOUNT;MARKUP_QTY;MARKUP_AMT;MARKUP_PCT;COMM_AMT;COMM_PCT;MARKUP_RETURN;sales_person;NOT_INVOICE;foc_yn;'
istr_dwo_related[3].s_related_obj_dwo_copy[1] = 'd_inventory_line_delivery_grid' // datawindow copy đến
istr_dwo_related[3].s_related_obj_column_copy[1] = 'ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;doc_qty;QTY;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;PRICE;AMOUNT;' + &
																		'ACT_PRICE;ACT_AMOUNT;MARKUP_QTY;MARKUP_AMT;MARKUP_PCT;COMM_AMT;COMM_PCT;MARKUP_RETURN;sales_person;NOT_INVOICE;foc_yn;'
istr_dwo_related[3].s_main_obj_column_chk[1] = ''
istr_dwo_related[3].s_related_obj_column_chk[1] = ''
istr_dwo_related[3].s_f_obj_column_chk[1] = 'ITEM_ID;PRICE;NOT_INVOICE;foc_yn;'
istr_dwo_related[3].s_t_obj_column_chk[1] = 'ITEM_ID;PRICE;NOT_INVOICE;foc_yn;'
istr_dwo_related[3].b_copy_line[1] = true
// khai báo cập nhật bản matching
istr_dwo_related[3].s_match_f_dwo[1] = 'd_so_line_grid'
//khai bao dw tra hang
istr_dwo_related[3].s_match_rf_dwo[1] = 'd_so_line_grid'
//istr_dwo_related[3].s_match_f_col_obj[1] = 'item_id' //-- đóng lại vì cho phép phiếu xuất kho kết với đơn hàng dịch vụ
istr_dwo_related[3].s_match_t_dwo[1] = 'd_inventory_line_delivery_grid'
istr_dwo_related[3].s_match_f_column[1] = 'act_qty'
istr_dwo_related[3].s_match_t_column[1] = 'qty'
istr_dwo_related[3].s_match_column[1] = 'qty'

istr_dwo_related[3].s_main_obj_dwo_copy[2] = 'd_order_so_form' 
istr_dwo_related[3].s_main_obj_column_copy[2] = 'bill_to_object;object_code_1;object_name_1;'
istr_dwo_related[3].s_related_obj_dwo_copy[2] = 'd_inventory_line_delivery_grid'
istr_dwo_related[3].s_related_obj_column_copy[2] = 'object_id;cus_code;cus_name;'
istr_dwo_related[3].s_main_obj_column_chk[2] = 'object_id;object_code;object_name'
istr_dwo_related[3].s_related_obj_column_chk[2] = 'object_id;cus_code;cus_name;'

istr_dwo_related[3].s_main_obj_dwo_copy[3] = 'd_order_so_form' 
istr_dwo_related[3].s_main_obj_column_copy[3] = 'payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate;ship_to_addtext;bill_to_addtext;invoice_request;note;include_tax_yn;'
istr_dwo_related[3].s_related_obj_dwo_copy[3] = 'd_goods_delivery_form'
istr_dwo_related[3].s_related_obj_column_copy[3] = 'payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate;trans_address;invoice_address;invoice_request;note;include_tax_yn;'


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

istr_dwo_related[4].s_related_obj_name = 'u_sal_invoice'					// đối tượng copy đến
istr_dwo_related[4].s_main_obj_dwo = 'd_so_line_grid'		//datawindow quan hệ main
istr_dwo_related[4].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[4].s_related_obj_dwo = 'd_sal_invoice_line_grid'	// datawindow quan hệ đến
istr_dwo_related[4].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[4].b_f_matching = true
istr_dwo_related[4].s_relatedtext_column = 'doc_code'					
istr_dwo_related[4].s_text = 'Hóa đơn bán từ: '

istr_dwo_related[4].s_main_obj_dwo_copy[1] = 'd_so_line_grid' // datawindow copy từ
istr_dwo_related[4].s_main_obj_column_copy[1] =  'ITEM_ID;object_code;object_name;LINE_TEXT;NOTE;QTY;act_qty;price;act_price;amount;act_amount;markup_pct;markup_return;markup_amt;comm_pct;comm_amt;not_invoice;foc_yn;sales_name;sales_person;'+&
																			'uom_code;TRANS_UOM;warehouse_id;wh_code;wh_name;SPEC_ID;spec_code;spec_name;' // cột copy từ
istr_dwo_related[4].s_related_obj_dwo_copy[1] = 'd_sal_invoice_line_grid' // datawindow copy đến
istr_dwo_related[4].s_related_obj_column_copy[1] = 'object_ID;object_code;object_name;LINE_TEXT;NOTE;QTY;act_qty;price;act_price;amount;act_amount;markup_pct;markup_return;markup_amt;comm_pct;comm_amt;not_invoice;foc_yn;sales_name;sales_person;'+&
																			'uom_code;TRANS_UOM;warehouse_id;warehouse_code;warehouse_name;SPEC_ID;spec_code;spec_name;' // cột copy đến
istr_dwo_related[4].s_main_obj_column_chk[1] = ''
istr_dwo_related[4].s_related_obj_column_chk[1] = ''
istr_dwo_related[4].s_f_obj_column_chk[1] = 'ITEM_ID'
istr_dwo_related[4].s_t_obj_column_chk[1] = 'object_ID'
istr_dwo_related[4].b_copy_line[1] = true
//khai bao dw tra hang
istr_dwo_related[4].s_match_rf_dwo[1] = 'd_so_line_grid'
// khai báo cập nhật bản matching
istr_dwo_related[4].s_match_f_dwo[1] = 'd_so_line_grid'
//istr_dwo_related[4].s_match_f_col_obj[1] = 'item_id'
istr_dwo_related[4].s_match_t_dwo[1] = 'd_sal_invoice_line_grid'
istr_dwo_related[4].s_match_f_column[1] = 'act_qty'
istr_dwo_related[4].s_match_t_column[1] = 'act_qty'
istr_dwo_related[4].s_match_column[1] = 'qty'

istr_dwo_related[4].s_main_obj_dwo_copy[2] = 'd_tax_line_grid' // datawindow copy từ
istr_dwo_related[4].s_main_obj_column_copy[2] =  'tax_correction;tax_amt;tax_pct;tax_type;'					
istr_dwo_related[4].s_related_obj_dwo_copy[2] = 'd_sal_invoice_line_grid' // datawindow copy đến
istr_dwo_related[4].s_related_obj_column_copy[2] = 'tax_correction;tax_amt;tax_pct;tax_type;'
istr_dwo_related[4].s_main_obj_column_chk[2] = ''
istr_dwo_related[4].s_related_obj_column_chk[2] = ''

istr_dwo_related[4].s_main_obj_dwo_copy[3] = 'd_tax_line_grid' // datawindow copy từ
istr_dwo_related[4].s_main_obj_column_copy[3] =  'TAX_ID;TAX_PCT;UPROW_YN;INCLUDE_YN;TAX_AMT;TAX_CORRECTION;TRANS_CURRENCY;EXCHANGE_RATE;TRANS_TAX_AMOUNT;'					
istr_dwo_related[4].s_related_obj_dwo_copy[3] = 'd_tax_line_grid' // datawindow copy đến
istr_dwo_related[4].s_related_obj_column_copy[3] = 'TAX_ID;TAX_PCT;UPROW_YN;INCLUDE_YN;TAX_AMT;TAX_CORRECTION;TRANS_CURRENCY;EXCHANGE_RATE;TRANS_TAX_AMOUNT;'
istr_dwo_related[4].s_main_obj_column_chk[3] = ''
istr_dwo_related[4].s_related_obj_column_chk[3] = ''

istr_dwo_related[4].s_main_obj_dwo_copy[4] = 'd_order_so_form'
istr_dwo_related[4].s_main_obj_column_copy[4] = 'object_id;object_code;object_name;bill_to_addtext;bill_to_object;object_name_1;object_code_1;bill_to_addtext;'
istr_dwo_related[4].s_main_obj_column_copy[4] += 'due_date;payment_term_code;payment_term_name;payment_method_code;payment_method_name;'
istr_dwo_related[4].s_main_obj_column_copy[4] += 'uom_code;currency_id;exchange_rate;include_tax_yn;note;payment_term;payment_method;invoice_request;tax_number;include_tax_yn;'
istr_dwo_related[4].s_related_obj_dwo_copy[4] = 'd_invoice_sal_form'
istr_dwo_related[4].s_related_obj_column_copy[4] = 'invoice_object;invoice_object_code;invoice_object_name;invoice_address;dr_cr_object;dr_cr_object_name;dr_cr_object_code;trans_address;'
istr_dwo_related[4].s_related_obj_column_copy[4] +='due_date;payment_term_code;payment_term_name;payment_method_code;payment_method_name;'
istr_dwo_related[4].s_related_obj_column_copy[4] += 'uom_code;currency_id;exchange_rate;include_tax_yn;note;payment_term;payment_method;invoice_request;cus_tax_num;include_tax_yn;'														
istr_dwo_related[4].s_main_obj_column_chk[4] = 'object_id;bill_to_object;currency_id;'
istr_dwo_related[4].s_related_obj_column_chk[4] = 'invoice_object;dr_cr_object;currency_id'
istr_dwo_related[4].s_match_f_dwo[4] = ''
istr_dwo_related[4].s_match_t_dwo[4] = ''
istr_dwo_related[4].s_match_f_column[4] = ''
istr_dwo_related[4].s_match_t_column[4] = ''
istr_dwo_related[4].s_match_column[4] = ''
istr_dwo_related[4].s_main_obj_column_sum[4] = ''
istr_dwo_related[4].s_related_obj_column_sum[4] = ''
istr_dwo_related[4].s_f_obj_column_chk[4] = ''
istr_dwo_related[4].s_t_obj_column_chk[4] = ''
istr_dwo_related[4].b_f_sum[4] = false
istr_dwo_related[4].b_copy_line[4] = false

istr_dwo_related[5].s_related_obj_name = 'u_so_return'					// đối tượng copy đến
istr_dwo_related[5].s_main_obj_dwo = 'd_so_line_grid'		//datawindow quan hệ main
istr_dwo_related[5].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[5].s_related_obj_dwo = 'd_so_line_grid'	// datawindow quan hệ đến
istr_dwo_related[5].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[5].b_f_matching = true
istr_dwo_related[5].b_return = true //la doi duong tra hang
istr_dwo_related[5].s_relatedtext_column = 'doc_code'					
istr_dwo_related[5].s_text = 'Đề xuất bán hàng từ: '

istr_dwo_related[5].s_main_obj_dwo_copy[1] = 'd_so_line_grid' // datawindow copy từ
istr_dwo_related[5].s_main_obj_column_copy[1] =  'ITEM_ID;object_code;object_name;LINE_TEXT;NOTE;QTY;act_qty;price;act_price;amount;act_amount;markup_pct;markup_amt;comm_pct;comm_amt;not_invoice;foc_yn;'+&
																			'uom_code;TRANS_UOM;markup_return;SALES_PERSON;staff_name' // cột copy từ
istr_dwo_related[5].s_related_obj_dwo_copy[1] = 'd_so_line_grid' // datawindow copy đến
istr_dwo_related[5].s_related_obj_column_copy[1] = 'ITEM_ID;object_code;object_name;LINE_TEXT;NOTE;QTY;act_qty;price;act_price;amount;act_amount;markup_pct;markup_amt;comm_pct;comm_amt;not_invoice;foc_yn;'+&
																		'uom_code;TRANS_UOM;markup_return;SALES_PERSON;staff_name' // cột copy từ // cột copy đến
istr_dwo_related[5].s_main_obj_column_chk[1] = ''
istr_dwo_related[5].s_related_obj_column_chk[1] = ''
istr_dwo_related[5].s_f_obj_column_chk[1] = 'ITEM_ID'
istr_dwo_related[5].s_t_obj_column_chk[1] = 'ITEM_ID'
istr_dwo_related[5].b_copy_line[1] = true
// khai báo cập nhật bản matching
istr_dwo_related[5].s_match_f_dwo[1] = 'd_so_line_grid'
istr_dwo_related[5].s_match_f_col_obj[1] = 'item_id'
istr_dwo_related[5].s_match_t_dwo[1] = 'd_so_line_grid'
istr_dwo_related[5].s_match_f_column[1] = 'act_qty'
istr_dwo_related[5].s_match_t_column[1] = 'act_qty'
istr_dwo_related[5].s_match_column[1] = 'qty'


istr_dwo_related[5].s_main_obj_dwo_copy[2] = 'd_order_so_form' // datawindow copy từ
istr_dwo_related[5].s_main_obj_column_copy[2] = 'object_id;object_code;object_name;ship_to_addtext;bill_to_object;object_name_1;object_code_1;bill_to_addtext;'
istr_dwo_related[5].s_main_obj_column_copy[2] += 'due_date;payment_term_code;payment_term_name;payment_method_code;payment_method_name;'
istr_dwo_related[5].s_main_obj_column_copy[2] += 'uom_code;currency_id;exchange_rate;include_tax_yn;note;payment_term;payment_method;delivery_mode_code;delivery_mode_name;delivery_mode;contact_name;contact_id'
istr_dwo_related[5].s_related_obj_dwo_copy[2] = 'd_order_so_form' // datawindow copy đến
istr_dwo_related[5].s_related_obj_column_copy[2]= 'object_id;object_code;object_name;ship_to_addtext;bill_to_object;object_name_1;object_code_1;bill_to_addtext;'
istr_dwo_related[5].s_related_obj_column_copy[2] += 'due_date;payment_term_code;payment_term_name;payment_method_code;payment_method_name;'
istr_dwo_related[5].s_related_obj_column_copy[2] += 'uom_code;currency_id;exchange_rate;include_tax_yn;note;payment_term;payment_method;delivery_mode_code;delivery_mode_name;delivery_mode;contact_name;contact_id'

istr_dwo_related[5].s_main_obj_dwo_copy[3] = 'd_order_catch_grid' // datawindow copy từ
istr_dwo_related[5].s_main_obj_column_copy[3] = 'catch_item;catch_uom;object_type;object_code;object_name;catch_qty;uom_code;catch_text'
istr_dwo_related[5].s_related_obj_dwo_copy[3] = 'd_order_catch_grid' // datawindow copy đến
istr_dwo_related[5].s_related_obj_column_copy[3] = 'catch_item;catch_uom;object_type;object_code;object_name;catch_qty;uom_code;catch_text'

// khai báo cập nhật bản matching
istr_dwo_related[5].s_match_f_dwo[3] = 'd_order_catch_grid'
istr_dwo_related[5].s_match_t_dwo[3] = 'd_order_catch_grid'
istr_dwo_related[5].s_match_f_column[3] = 'catch_qty'
istr_dwo_related[5].s_match_t_column[3] = 'catch_qty'
istr_dwo_related[5].s_match_column[3] = 'qty'

istr_dwo_related[5].s_main_obj_dwo_copy[4] = 'd_so_tech_grid' // datawindow copy từ
istr_dwo_related[5].s_main_obj_column_copy[4] = 'tech_staff;staff_code;staff_name;s_time;f_time;work_hour;actual_f_time;tech_note'
istr_dwo_related[5].s_related_obj_dwo_copy[4] = 'd_so_tech_grid' // datawindow copy đến
istr_dwo_related[5].s_related_obj_column_copy[4] = 'tech_staff;staff_code;staff_name;s_time;f_time;work_hour;actual_f_time;tech_note'
istr_dwo_related[5].s_main_obj_column_chk[4] = ''
istr_dwo_related[5].s_related_obj_column_chk[4] = ''
istr_dwo_related[5].s_match_f_dwo[4] = ''
istr_dwo_related[5].s_match_t_dwo[4] = ''
istr_dwo_related[5].s_main_obj_column_sum[4] = ''
istr_dwo_related[5].s_related_obj_column_sum[4] = ''
istr_dwo_related[5].s_f_obj_column_chk[4] = ''
istr_dwo_related[5].s_t_obj_column_chk[4] = ''
istr_dwo_related[5].b_f_sum[4] = false
istr_dwo_related[5].b_copy_line[4] = false

istr_dwo_related[6].s_related_obj_name = 'u_item'					// đối tượng copy đến
istr_dwo_related[6].s_main_obj_dwo = 	'd_so_line_grid'	//datawindow quan hệ main
istr_dwo_related[6].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[6].s_related_obj_dwo =  'd_object_grid'	// datawindow quan hệ đến
istr_dwo_related[6].s_related_obj_column = 'item_id'			// cột quan hệ đến
istr_dwo_related[6].s_relatedtext_column = 'code'					
istr_dwo_related[6].s_text = 'Đơn bán hàng của : '

istr_dwo_related[7].s_related_obj_name = 'u_so'					// đối tượng copy đến
istr_dwo_related[7].s_main_obj_dwo = 	'd_document_orders_grid'	//datawindow quan hệ main
istr_dwo_related[7].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[7].s_related_obj_dwo =  'd_document_orders_grid'	// datawindow quan hệ đến
istr_dwo_related[7].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[7].b_f_matching = true
istr_dwo_related[7].s_relatedtext_column = 'code'					
istr_dwo_related[7].s_text = 'Nhân bản từ đề xuất bán hàng : '

istr_dwo_related[7].s_main_obj_dwo_copy[1] = 'd_document_orders_grid' // datawindow copy từ
istr_dwo_related[7].s_main_obj_column_copy[1] =  'handled_by;trans_hdr_id;ship_to_object_code;object_name;trans_desc;group_name;req_appr_note;appr_note;doc_type;'
																		
istr_dwo_related[7].s_related_obj_dwo_copy[1] = 'd_document_orders_grid' // datawindow copy đến
istr_dwo_related[7].s_related_obj_column_copy[1] = 'handled_by;trans_hdr_id;ship_to_object_code;object_name;trans_desc;group_name;req_appr_note;appr_note;doc_type;'
istr_dwo_related[7].s_match_f_dwo[1] = 'd_document_orders_grid'
istr_dwo_related[7].s_match_t_dwo[1] = 'd_document_orders_grid'		

istr_dwo_related[7].s_main_obj_dwo_copy[2] = 'd_order_so_form' // datawindow copy từ
istr_dwo_related[7].s_main_obj_column_copy[2] = 'object_id;object_code;object_name;ship_to_addtext;bill_to_object;object_name_1;object_code_1;bill_to_addtext;'
istr_dwo_related[7].s_main_obj_column_copy[2] += 'due_date;payment_term_code;payment_term_name;payment_method_code;payment_method_name;doc_type;'
istr_dwo_related[7].s_main_obj_column_copy[2] += 'uom_code;currency_id;exchange_rate;include_tax_yn;note;payment_term;payment_method;delivery_mode_code;delivery_mode_name;delivery_mode;contact_name;contact_id'
istr_dwo_related[7].s_related_obj_dwo_copy[2] = 'd_order_so_form' // datawindow copy đến
istr_dwo_related[7].s_related_obj_column_copy[2]= 'object_id;object_code;object_name;ship_to_addtext;bill_to_object;object_name_1;object_code_1;bill_to_addtext;'
istr_dwo_related[7].s_related_obj_column_copy[2] += 'due_date;payment_term_code;payment_term_name;payment_method_code;payment_method_name;doc_type;'
istr_dwo_related[7].s_related_obj_column_copy[2] += 'uom_code;currency_id;exchange_rate;include_tax_yn;note;payment_term;payment_method;delivery_mode_code;delivery_mode_name;delivery_mode;contact_name;contact_id'

istr_dwo_related[7].s_main_obj_dwo_copy[3] = 'd_so_line_grid' // datawindow copy từ
istr_dwo_related[7].s_main_obj_column_copy[3] =  'line_no;ITEM_ID;object_code;object_name;LINE_TEXT;NOTE;QTY;act_qty;price;act_price;amount;act_amount;markup_pct;markup_amt;comm_pct;comm_amt;not_invoice;foc_yn;'+&
																			'uom_code;TRANS_UOM;markup_return;SALES_PERSON;staff_name;amount_ex_tax;markup_pct;markup_return;markup_amt;note;other_note;comm_pct;comm_amt;' // cột copy từ
istr_dwo_related[7].s_related_obj_dwo_copy[3] = 'd_so_line_grid' // datawindow copy đến
istr_dwo_related[7].s_related_obj_column_copy[3] = 'line_no;ITEM_ID;object_code;object_name;LINE_TEXT;NOTE;QTY;act_qty;price;act_price;amount;act_amount;markup_pct;markup_amt;comm_pct;comm_amt;not_invoice;foc_yn;'+&
																		'uom_code;TRANS_UOM;markup_return;SALES_PERSON;staff_name;amount_ex_tax;markup_pct;markup_return;markup_amt;note;other_note;comm_pct;comm_amt;' 
					
istr_dwo_related[7].s_main_obj_dwo_copy[4] = 'd_tax_line_grid' // datawindow copy từ
istr_dwo_related[7].s_main_obj_column_copy[4] = 'object_code;object_name;tax_id;tax_type;tax_pct;tax_amt;tax_correction;uom_code;exchange_rate;uprow_yn;include_yn'
istr_dwo_related[7].s_related_obj_dwo_copy[4] = 'd_tax_line_grid' // datawindow copy đến
istr_dwo_related[7].s_related_obj_column_copy[4] = 'object_code;object_name;tax_id;tax_type;tax_pct;tax_amt;tax_correction;uom_code;exchange_rate;uprow_yn;include_yn'

istr_dwo_related[7].s_main_obj_dwo_copy[5] = 'd_order_catch_grid' // datawindow copy từ
istr_dwo_related[7].s_main_obj_column_copy[5] = 'catch_item;catch_uom;object_type;object_code;object_name;catch_qty;uom_code;catch_text'
istr_dwo_related[7].s_related_obj_dwo_copy[5] = 'd_order_catch_grid' // datawindow copy đến
istr_dwo_related[7].s_related_obj_column_copy[5] = 'catch_item;catch_uom;object_type;object_code;object_name;catch_qty;uom_code;catch_text'

istr_dwo_related[7].s_main_obj_dwo_copy[6] = 'd_so_tech_grid' // datawindow copy từ
istr_dwo_related[7].s_main_obj_column_copy[6] = 'tech_staff;staff_code;staff_name;s_time;f_time;work_hour;actual_f_time;tech_note'
istr_dwo_related[7].s_related_obj_dwo_copy[6] = 'd_so_tech_grid' // datawindow copy đến
istr_dwo_related[7].s_related_obj_column_copy[6] = 'tech_staff;staff_code;staff_name;s_time;f_time;work_hour;actual_f_time;tech_note'

istr_dwo_related[7].s_main_obj_column_chk[6] = ''
istr_dwo_related[7].s_related_obj_column_chk[6] = ''
istr_dwo_related[7].s_match_f_dwo[6] = ''
istr_dwo_related[7].s_match_t_dwo[6] = ''
istr_dwo_related[7].s_match_f_column[6] =''
istr_dwo_related[7].s_match_t_column[6] =''
istr_dwo_related[7].s_match_column[6] = ''
istr_dwo_related[7].s_main_obj_column_sum[6] = ''
istr_dwo_related[7].s_related_obj_column_sum[6] = ''
istr_dwo_related[7].s_f_obj_column_chk[6] = ''
istr_dwo_related[7].s_t_obj_column_chk[6] = ''
istr_dwo_related[7].b_f_sum[6] = false

istr_dwo_related[8].s_related_obj_name = 'b_view'				// đối tượng copy đến
istr_dwo_related[8].s_main_obj_dwo = 'd_document_orders_grid'		//datawindow quan hệ main
istr_dwo_related[8].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[8].s_related_obj_dwo = 'dv_delivery_note_form'	// datawindow quan hệ đến
istr_dwo_related[8].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[8].s_relatedtext_column = 'code'					
istr_dwo_related[8].s_text = 'In biên bản giao hàng'

istr_dwo_related[9].s_related_obj_name = 'b_view'				// đối tượng copy đến
istr_dwo_related[9].s_main_obj_dwo = 'd_document_orders_grid'		//datawindow quan hệ main
istr_dwo_related[9].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[9].s_related_obj_dwo = 'dv_so_demo_form'	// datawindow quan hệ đến
istr_dwo_related[9].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[9].s_relatedtext_column = 'code'					
istr_dwo_related[9].s_text = 'In đề xuất hàng demo'

istr_dwo_related[10].s_related_obj_name = 'u_map_invoice'
istr_dwo_related[10].s_main_obj_dwo = 'd_order_so_form'
istr_dwo_related[10].s_main_obj_column = 'bill_to_object'
istr_dwo_related[10].s_related_obj_dwo = 'd_address_map_form'
istr_dwo_related[10].s_related_obj_column = 'object_id'

istr_dwo_related[11].s_related_obj_name = 'u_map_delivery'
istr_dwo_related[11].s_main_obj_dwo = 'd_order_so_form'
istr_dwo_related[11].s_main_obj_column = 'object_id'
istr_dwo_related[11].s_related_obj_dwo = 'd_address_map_form'
istr_dwo_related[11].s_related_obj_column = 'object_id'

istr_dwo_related[12].s_related_obj_name = 'u_work_order'					// đối tượng copy đến
istr_dwo_related[12].s_main_obj_dwo = 'd_so_line_grid'		//datawindow quan hệ main
istr_dwo_related[12].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[12].s_related_obj_dwo = 'd_so_line_grid'	// datawindow quan hệ đến
istr_dwo_related[12].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[12].b_t_matching = true
istr_dwo_related[12].s_relatedtext_column = 'doc_code'					
istr_dwo_related[12].s_text = 'Đề xuất bán hàng từ: '

istr_dwo_related[12].s_main_obj_column_chk[1] = ''
istr_dwo_related[12].s_related_obj_column_chk[1] = ''
// khai báo cập nhật bản matching
istr_dwo_related[12].s_match_f_dwo[1] = 'd_so_line_grid'
istr_dwo_related[12].s_match_f_col_obj[1] = 'item_id'
istr_dwo_related[12].s_match_t_dwo[1] = 'd_so_line_grid'
istr_dwo_related[12].s_match_f_column[1] = 'act_qty'
istr_dwo_related[12].s_match_t_column[1] = 'act_qty'
istr_dwo_related[12].s_match_column[1] = 'qty'
end subroutine

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name =  'b_pr;b_so_return;b_goods_delivery;b_sal_invoice;'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

public function integer f_resize_fixedpart_grid ();
this.iw_display.dynamic f_reset_ii_fixedpart2_height_grid(0)
this.iw_display.dynamic f_resize(is_display_model)
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

public function integer f_get_item_can_not_sale (double vdb_obj_ref_id, ref string rs_item_code, ref t_ds_db rds_so_line, t_transaction vt_transaction);/****************************************
- Chức năng lấy những mã hàng mà số lượng hàng 
được giữ đã lớn hơn hoặc bằng số lượng tồn
- return -1 Lỗi ko retrieve được chi tiết 
 			0 không làm gì hết
			>0 có mặt hàng vượt quá số lượng tồn 
- vdb_obj_ref_id là VERSION_ID của doc hoặc ID của orders
- vt_transaction là kết nối trên window
- rs_item_code: các mã hàng đã vượt số lg tồn
- rds_so_line: datastore line chứa các row đã vượt số lg tồn
****************************************/
any 			laa_data[]
int				li_row, li_idx,li_rtn
string			ls_item_id,ls_item_code
t_ds_db		lds_onhand

laa_data[1] = 'Tổng cộng'
lds_onhand = create t_ds_db
lds_onhand.dataobject = 'd_onhand_grid'
lds_onhand.f_add_where( 'warehouse_name', laa_data)
lds_onhand.f_settransobject(vt_transaction )
li_row = lds_onhand.event e_retrieve( )
laa_data[1] = vdb_obj_ref_id
rds_so_line.dataobject = 'd_so_line_grid'
rds_so_line.f_add_where('object_ref_id',laa_data)
rds_so_line.f_settransobject(vt_transaction)
li_row = rds_so_line.event e_retrieve()
if li_row = -1 then return -1
for li_idx = 1 to li_row
	lds_onhand.setfilter( "item_code = '"  + rds_so_line.getitemstring(li_idx,'object_code') +  "' AND qty_sales <= 0" )
	lds_onhand.filter( )
	if lds_onhand.rowcount( ) > 0 then
		if rs_item_code <> '' and li_idx < li_row then 
			rs_item_code = rs_item_code + ','
			ls_item_code = ls_item_code + ','
		end if
		rs_item_code = rs_item_code + rds_so_line.getitemstring(li_idx,'object_code')
		ls_item_code = ls_item_code + "'" + rds_so_line.getitemstring(li_idx,'object_code') + "'"
	end if	
next
if ls_item_code <> '' then
	rds_so_line.setfilter("object_code IN (" + ls_item_code + ")")
	rds_so_line.filter()
	li_rtn = rds_so_line.rowcount()
end if

destroy lds_onhand
return li_rtn
end function

public function integer f_set_other_note_so_line (t_ds_db vds_so_line, string vs_text);int			li_idx,li_rtn


for li_idx = 1 to vds_so_line.rowcount()
	if vs_text <> '' then
		li_rtn = vds_so_line.setitem(li_idx,'other_note',vds_so_line.getitemstring(li_idx,'object_code') + ' ' + vs_text )
	else
		li_rtn = vds_so_line.setitem(li_idx,'other_note','' )
	end if
	if li_rtn = -1 then return -1
next
if li_rtn = 1 then
	li_rtn = vds_so_line.update(true,false)
	if li_rtn = -1 then return -1
	vds_so_line.resetupdate()
end if
return li_rtn
end function

public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[]);if pos(rdw_focus.dataobject,'d_document_' ) > 0 then
	ra_args[1] = gi_userid
end if
return upperbound(ra_args)
end function

on c_so_appr.create
call super::create
end on

on c_so_appr.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = true
this.ib_keyboardlocked = true
is_display_model = '6dgb_ext'
is_object_title = 'Duyệt đề xuất bán hàng'
istr_actionpane[1].s_button_name = 'b_approve;b_reject;'
istr_actionpane[1].s_description = is_object_title
is_exrate_type = 'buy'
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;t_dw_mpl 			ldw_handle
any					la_data[],la_retrieve[]
string 				ls_doc_type,ls_staff_name
long 					ll_trans_hdr_id,ll_line_no,ll_idx
double				ldb_staff_id,ldb_trans_hdr_id,ldb_line_id

if pos(rpo_dw.dataobject,'d_document') > 0 then
	 rpo_dw.setitem(vl_currentrow,'doc_type','SO')
elseif  pos(rpo_dw.dataobject,'d_so_line') > 0 then
	rpo_dw.setitem(vl_currentrow,'object_type','item')
	if vl_currentrow = 1 and  rpo_dw.rowcount()=0 then
		ll_line_no = vl_currentrow
	else
		ll_line_no = vl_currentrow
			for ll_idx = vl_currentrow + 1 to rpo_dw.rowcount()
				rpo_dw.setitem(ll_idx,'line_no',ll_idx)
			next
	end if
	rpo_dw.setitem(vl_currentrow,'line_no',ll_line_no)
//	ldw_handle = iw_display.f_get_dwmain()
	ldw_handle = iw_display.f_get_dwmain()
	if vl_currentrow = 1 and rpo_dw.rowcount() = 1 then
		ldb_staff_id = g_user.Object_id
		ls_staff_name = g_user.name
	elseif vl_currentrow = 1 and rpo_dw.rowcount()>1 then
		ldb_staff_id = rpo_dw.getitemnumber(vl_currentrow + 1,'SALES_PERSON')
		ls_staff_name = rpo_dw.getitemstring(vl_currentrow + 1,'staff_name')
	else
		ldb_staff_id = rpo_dw.getitemnumber(vl_currentrow - 1,'SALES_PERSON')
		ls_staff_name = rpo_dw.getitemstring(vl_currentrow - 1,'staff_name')
	end if
	rpo_dw.setitem(vl_currentrow,'SALES_PERSON',ldb_staff_id)
	rpo_dw.setitem(vl_currentrow,'staff_name',ls_staff_name)
	ldw_handle = iw_display.dynamic f_get_dwmain()
	if ldw_handle.getrow() > 0 then
		ldb_trans_hdr_id = ldw_handle.getitemnumber(ldw_handle.getrow() , 'trans_hdr_id') 
		if idb_trans_id <> ldb_trans_hdr_id then
			la_data[1] = ldb_trans_hdr_id
			this.f_init_object_table(ids_trans_setup, 'd_trans_setup_grid', 'object_ref_id',la_data[],la_retrieve[])
			idb_trans_id = ldb_trans_hdr_id
		end if
		
		ldb_line_id = rpo_dw.getitemnumber(vl_currentrow,'id')
		f_post_tax(idb_trans_id,ldb_line_id, 'd_tax_line_grid')
		
	end if
elseif pos(rpo_dw.dataobject,'d_order_so_form') > 0 then
	rpo_dw.setitem(vl_currentrow,'version_no',1)
	rpo_dw.setitem(vl_currentrow,'doc_type','SO')
elseif pos(rpo_dw.dataobject,'d_order_catch') > 0 then
	rpo_dw.setitem(vl_currentrow,'object_type','item')
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

event e_window_open;call super::e_window_open;

t_dw_mpl			ldw_main
any				laa_value[]
//--form parm--//
ldw_main = iw_display.f_get_dwmain()
laa_value[1] = '(SO;SO_DEMO)'
laa_value[2] = 'req_approve'
ldw_main.f_add_where('doc_type;status',laa_value[])
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;//--resize parm --//
iw_display.f_set_ii_upperpart_height(1200)
iw_display.f_set_ii_fixedpart2_height(520)
iw_display.f_set_ii_gb_3_height(650)
iw_display.f_set_ii_fixedpart3_height(180)
iw_display.f_set_ii_gb_4_height(300)
iw_display.f_set_ii_gb_5_height(500)
return 0
end event

event e_dw_e_postretrieve;call super::e_dw_e_postretrieve;t_dw_mpl ldw_handle

if pos(rpo_dw.dataobject,'d_order_so_form') > 0 then
	if isnull(rpo_dw.getitemstring(vl_rowcount,'object_type')) then
		rpo_dw.setitem(vl_rowcount,'object_type','customer')
	end if
end if 
return 1
end event

event e_dw_updatestart;call super::e_dw_updatestart;t_dw_mpl	ldw_tax,ldw_master_request
decimal		ldc_ex_rate,ldc_tax_amt
string			ls_include_tax_yn


if  pos(rdw_requester.dataobject,'d_so_line_grid') > 0 then
	ldw_tax = iw_display.f_get_dw('d_tax_line_grid')
//	ldc_tax_amt = ldw_tax.getitemnumber(ldw_tax.rowcount( ), 'tax_amt') 
//	if ldc_tax_amt = 0 or isnull(ldc_tax_amt) then
		ldw_master_request = rdw_requester.dynamic f_get_idw_master()
		ldc_ex_rate = ldw_master_request.getitemnumber(ldw_master_request.getrow( ) , 'exchange_rate')
		ls_include_tax_yn = ldw_master_request.getitemstring( ldw_master_request.getrow( ), 'include_tax_yn')
		this.f_update_tax( rdw_requester,'amount','amount_ex_tax',ldc_ex_rate, ls_include_tax_yn)
//	end if
end if
return 0
end event

event e_window_e_view;call super::e_window_e_view;t_dw_mpl	ldw_order
s_str_dwo	lstr_dwo[]
string			ls_doc_type


if rod_relation.classname() = 'b_view' then
	rod_relation.f_get_dwo(lstr_dwo[])
	if lstr_dwo[1].s_dwo_default = 'dv_so_form' or lstr_dwo[1].s_dwo_default = 'dv_so_demo_form' then
		ldw_order = iw_display.f_get_dwmain( )
		ls_doc_type =  ldw_order.getitemstring( ldw_order.getrow( ) , 'doc_type')
		if isnull(ls_doc_type) or ls_doc_type = '' then 
			gf_messagebox('m.c_so.e_window_e_view.01','Thống báo','Loại đơn hàng chưa được chọn','exclamation','ok',1)
			return -1
		end if
		rs_dwo_view = 'dv_'+lower(ls_doc_type)+'_form'		
		lstr_dwo[1].s_dwo_default =  rs_dwo_view
		lstr_dwo[1].s_dwo_form =rs_dwo_view
		rod_relation.f_set_dwo_structure(lstr_dwo )		
		return 1
	end if
end if
return 0
end event

event e_window_e_postopen;call super::e_window_e_postopen;//t_dw_mpl ldw_view_tax
//c_string lc_string
//
//ldw_view_tax = iw_display.f_get_dw( 'd_tax_line_grid')
//	if not isvalid(ldw_view_tax) then return -1
//	is_filter_view_all = ldw_view_tax.describe("DataWindow.Table.Filter")
//	is_filter_view_all = lc_string.f_globalreplace( is_filter_view_all, "~~'", "'")
//	
//	return 1
return 0
end event

event e_window_e_send_2_approve;call super::e_window_e_send_2_approve;int 				li_rtn
string				ls_item_code
double			ldb_version_id
t_ds_db			lds_so_line
t_dw_mpl		ldw_main
t_transaction	lt_transaction

lds_so_line = create t_ds_db
ldw_main = iw_display.f_get_dwmain( )
iw_display.f_get_transaction( lt_transaction)
ldb_version_id = ldw_main.getitemnumber( ldw_main.getrow( ) , 'version_id')
li_rtn = this.f_get_item_can_not_sale( ldb_version_id, ls_item_code, lds_so_line,lt_transaction)
if li_rtn > 0 then
	li_rtn = this.f_set_other_note_so_line( lds_so_line,'đã đặt bán hết')
	if li_rtn = 1 then gf_messagebox('m.c_so.e_window_e_send_2_approve.01','Thông báo','Các mã hàng : '+ls_item_code + ' đã được đặt bán hết','exclamation','ok',1)
	destroy lds_so_line
	return li_rtn
end if
destroy lds_so_line
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

