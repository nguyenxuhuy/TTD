$PBExportHeader$c_goods_transfer.sru
forward
global type c_goods_transfer from c_goods_delivery
end type
end forward

global type c_goods_transfer from c_goods_delivery
end type
global c_goods_transfer c_goods_transfer

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_str_unit ()
public subroutine f_set_dwo_related ()
public subroutine f_set_str_streamvalue ()
public function integer f_set_ds_4_posting ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_doc_goods_transfer_grid'
istr_dwo[1].s_dwo_form = 'd_doc_goods_transfer_form'
istr_dwo[1].s_dwo_grid = 'd_doc_goods_transfer_grid'
istr_dwo[1].b_master = false
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_details = '' 
istr_dwo[1].b_ref_table_yn  = false
istr_dwo[1].s_ref_table_field = ''
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_gb_name = 'gb_6'
istr_dwo[1].s_description = 'Phiếu chuyển kho'

/*
istr_dwo[2].s_dwo_default =  'd_goods_transfer_form'
istr_dwo[2].s_dwo_form = 'd_goods_transfer_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = true
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_details = 'd_inventory_line_transfer_grid;'
istr_dwo[2].s_dwo_master = 'd_document_inventory_grid;'
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
istr_dwo[2].s_description = 'Nhập kho'

istr_dwo[3].s_dwo_default =  'd_scan_barcode_form'
istr_dwo[3].s_dwo_form = 'd_scan_barcode_form'
istr_dwo[3].s_dwo_grid = ''
istr_dwo[3].b_detail = false
istr_dwo[3].b_master = false
istr_dwo[3].b_cascade_del = false
istr_dwo[3].s_dwo_master = ''
istr_dwo[3].s_dwo_details = ''
istr_dwo[3].s_master_keycol = ''
istr_dwo[3].s_detail_keycol = ''
istr_dwo[3].b_ref_table_yn  = false
istr_dwo[3].s_ref_table_field = ''
istr_dwo[3].b_insert = false
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = false
istr_dwo[3].b_query = true
istr_dwo[3].b_print = false
istr_dwo[3].b_excel = false
istr_dwo[3].b_traceable = false
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].b_focus_master = false
istr_dwo[3].s_gb_name = 'gb_7'
istr_dwo[3].s_description = 'Chi tiết chuyển kho'

istr_dwo[4].s_dwo_default =  'd_inventory_catch_grid'
istr_dwo[4].s_dwo_form = ''
istr_dwo[4].s_dwo_grid = 'd_inventory_catch_grid'
istr_dwo[4].b_detail = true
istr_dwo[4].s_dwo_master = 'd_inventory_line_transfer_grid;'
istr_dwo[4].s_dwo_details = ''
istr_dwo[4].s_master_keycol = 'ID;'
istr_dwo[4].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[4].b_ref_table_yn  = false
istr_dwo[4].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[4].b_insert = true
istr_dwo[4].b_update = true
istr_dwo[4].b_delete = true
istr_dwo[4].b_query = true
istr_dwo[4].b_print = true
istr_dwo[4].b_excel = true
istr_dwo[4].b_traceable = true
istr_dwo[4].b_keyboardlocked = true
istr_dwo[4].s_gb_name = 'gb_8'
istr_dwo[4].s_description = 'Chi tiết kiểm đếm'

istr_dwo[5].s_dwo_default =  'd_post_line_invoice_grid'
istr_dwo[5].s_dwo_form = ''
istr_dwo[5].s_dwo_grid = 'd_post_line_invoice_grid'
istr_dwo[5].b_master = false
istr_dwo[5].b_detail = true
istr_dwo[5].b_cascade_del = true
istr_dwo[5].s_dwo_master = 'd_inventory_line_transfer_grid;'
istr_dwo[5].s_dwo_details = ''
istr_dwo[5].s_dwo_shared = ''
istr_dwo[5].s_master_keycol = 'ID;'
istr_dwo[5].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[5].b_ref_table_yn  = false
istr_dwo[5].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[5].b_insert = false
istr_dwo[5].b_update = true
istr_dwo[5].b_delete = true
istr_dwo[5].b_query = true
istr_dwo[5].b_print = true
istr_dwo[5].b_excel = true
istr_dwo[5].b_traceable = true
istr_dwo[5].b_keyboardlocked = true
istr_dwo[5].s_description ='Định khoản'
istr_dwo[5].s_gb_name = 'gb_9'
*/
end subroutine

public subroutine f_set_dwo_tabpage ();/*
iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_inventory_line_transfer_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_inventory_line_transfer_grid'
iastr_dwo_tabpage[1].str_dwo[1].b_master = true
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_goods_transfer_form;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = 'd_inventory_catch_grid;d_lot_line_grid;d_post_line_invoice_grid;'
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
iastr_dwo_tabpage[1].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[1].i_index = 1
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Chi tiết chuyển kho'

iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_display_model = '1d'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_lot_line_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = 'd_lot_line_grid'
iastr_dwo_tabpage[2].str_dwo[1].b_master = true
iastr_dwo_tabpage[2].str_dwo[1].b_detail = true
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_inventory_line_transfer_grid;'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_details = ''
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
iastr_dwo_tabpage[2].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[2].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[2].i_index = 2
iastr_dwo_tabpage[2].str_dwo[1].s_description ='Chi tiết barcode'
*/
end subroutine

public subroutine f_set_str_unit ();//--Datawindow chứa các cột cần làm tròn--//
istr_unit[1].s_dwo_handing = 'd_inventory_line_transfer_grid;"";"";d_inventory_line_transfer_grid;d_goods_delivery_form;'
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = 'qty;"";"";bc;ex'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[1].s_dwo_unit = 'd_inventory_line_transfer_grid;"";"";d_goods_delivery_form;d_goods_delivery_form;'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = 'uom_code;"";"";uom_code;exchange_rate;'
//--Loại làm tròn --//
istr_unit[1].s_type = 'item;"";"";bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[1].s_dwo_object = 'd_inventory_line_transfer_grid'
//--Cột chứa mã hàng--//
istr_unit[1].s_colname_object = 'item_code'
end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'b_view'				// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = 'd_doc_goods_transfer_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'dv_transfer_form'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].s_relatedtext_column = 'code'					
istr_dwo_related[1].s_text = 'In phiếu XK kiêm VC-NB'

istr_dwo_related[2].s_related_obj_name = 'b_view'				// đối tượng copy đến
istr_dwo_related[2].s_main_obj_dwo = 'd_doc_goods_transfer_grid'		//datawindow quan hệ main
istr_dwo_related[2].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[2].s_related_obj_dwo = 'dv_goods_transfer_form'	// datawindow quan hệ đến
istr_dwo_related[2].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[2].s_relatedtext_column = 'code'					
istr_dwo_related[2].s_text = 'In phiếu chuyển kho'

istr_dwo_related[3].s_related_obj_name = 'u_map_delivery'
istr_dwo_related[3].s_main_obj_dwo = 'd_inventory_line_transfer_form'
istr_dwo_related[3].s_main_obj_column = 'object_id'
istr_dwo_related[3].s_related_obj_dwo = 'd_address_map_form'
istr_dwo_related[3].s_related_obj_column = 'object_id'

istr_dwo_related[4].s_related_obj_name = 'u_goods_transfer_all'					// đối tượng copy đến
istr_dwo_related[4].s_main_obj_dwo = 	'd_document_inventory_grid'	//datawindow quan hệ main
istr_dwo_related[4].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[4].s_related_obj_dwo =  'd_document_inventory_grid'	// datawindow quan hệ đến
istr_dwo_related[4].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[4].b_t_matching = true
istr_dwo_related[4].s_relatedtext_column = 'code'					
istr_dwo_related[4].s_text = 'Phiếu chuyển kho : '
istr_dwo_related[4].s_main_obj_dwo_copy[1] ='d_inventory_line_transfer_grid' // datawindow copy từ
istr_dwo_related[4].s_related_obj_dwo_copy[1] = 'd_inventory_line_transfer_grid'  // datawindow copy đến
istr_dwo_related[4].s_main_obj_column_chk[1] = ''
istr_dwo_related[4].s_related_obj_column_chk[1] = ''
istr_dwo_related[4].s_match_f_dwo[1] = 'd_inventory_line_transfer_grid'
istr_dwo_related[4].s_match_f_col_obj[1] = 'item_id'
istr_dwo_related[4].s_match_t_dwo[1] = 'd_inventory_line_transfer_grid'
istr_dwo_related[4].s_match_f_column[1] = 'qty'
istr_dwo_related[4].s_match_t_column[1] = 'qty'
istr_dwo_related[4].s_match_column[1] = 'qty'

istr_dwo_related[5].s_related_obj_name = 'b_view'				// đối tượng copy đến
istr_dwo_related[5].s_main_obj_dwo = 'd_document_inventory_grid'		//datawindow quan hệ main
istr_dwo_related[5].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[5].s_related_obj_dwo = 'dv_attribute_form'	// datawindow quan hệ đến
istr_dwo_related[5].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[5].s_relatedtext_column = 'code'					
istr_dwo_related[5].s_text = 'In lệnh điều động nội bộ'


istr_dwo_related[6].s_related_obj_name = 'u_sal_invoice'					// đối tượng copy đến
istr_dwo_related[6].s_main_obj_dwo = 'd_document_inventory_grid'		//datawindow quan hệ main
istr_dwo_related[6].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[6].s_related_obj_dwo = 'd_document_ar_grid'	// datawindow quan hệ đến
istr_dwo_related[6].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[6].b_f_matching = true
//istr_dwo_related[6].b_copy_tax = true
istr_dwo_related[6].s_relatedtext_column = 'code'					
istr_dwo_related[6].s_text = 'Hóa đơn bán từ PCK: '

istr_dwo_related[6].s_main_obj_dwo_copy[1] = 'd_inventory_line_transfer_grid' // datawindow copy từ
istr_dwo_related[6].s_main_obj_column_copy[1] =  'ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;QTY;QTY;uom_code;TRANS_UOM;warehouse_id;wh_code;wh_name;SPEC_ID;spec_code;spec_name;PRICE;AMOUNT;' +&
																		'ACT_PRICE;ACT_AMOUNT;MARKUP_QTY;MARKUP_AMT;MARKUP_PCT;COMM_AMT;COMM_PCT;NOT_INVOICE;foc_yn;' +&
																		'TAX_PCT;TAX_AMT;TAX_CORRECTION;MARKUP_RETURN;sales_person;' // cột copy từ
istr_dwo_related[6].s_related_obj_dwo_copy[1] = 'd_sal_invoice_line_grid' // datawindow copy đến
istr_dwo_related[6].s_related_obj_column_copy[1] = 'object_ID;object_code;object_name;LINE_TEXT;NOTE;QTY;act_qty;uom_code;TRANS_UOM;warehouse_id;warehouse_code;warehouse_name;SPEC_ID;spec_code;spec_name;PRICE;AMOUNT;' +&
																			'ACT_PRICE;ACT_AMOUNT;MARKUP_QTY;MARKUP_AMT;MARKUP_PCT;COMM_AMT;COMM_PCT;NOT_INVOICE;foc_yn;'+&
																			'TAX_PCT;TAX_AMT;TAX_CORRECTION;MARKUP_RETURN;sales_person;' // cột copy đến
istr_dwo_related[6].b_copy_line[1] = true
//khai báo cộng dồn số lượng
istr_dwo_related[6].b_f_sum[1] = true
istr_dwo_related[6].s_main_obj_column_sum[1] = 'doc_qty;qty' 
istr_dwo_related[6].s_f_obj_column_chk[1] = 'ITEM_ID;PRICE;NOT_INVOICE;foc_yn;LINE_TEXT;'
istr_dwo_related[6].s_t_obj_column_chk[1] = 'object_ID;PRICE;NOT_INVOICE;foc_yn;LINE_TEXT;'
istr_dwo_related[6].s_main_dr_cr_obj_dwo_sum[1]=''
istr_dwo_related[6].s_main_dr_cr_obj_column_sum[1]=''
//khai bao dw tra hang
istr_dwo_related[6].s_match_rf_dwo[1] = ''
// khai báo cập nhật bản matching
istr_dwo_related[6].s_match_f_dwo[1] = 'd_inventory_line_transfer_grid'
//istr_dwo_related[6].s_match_f_col_obj[1] = 'item_id' //-- đóng lại vì cho phép phiếu xuất kho kết với đơn hàng dịch vụ
istr_dwo_related[6].s_match_t_dwo[1] = 'd_sal_invoice_line_grid' 
istr_dwo_related[6].s_match_f_column[1] = 'qty'
istr_dwo_related[6].s_match_t_column[1] = 'act_qty'
istr_dwo_related[6].s_match_column[1] = 'qty'

istr_dwo_related[6].s_main_obj_dwo_copy[2] =  'd_goods_delivery_form'// datawindow copy từ
istr_dwo_related[6].s_main_obj_column_copy[2] = 'note;description;trans_date;payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate;invoice_address;invoice_address;invoice_request;include_tax_yn;' // cột copy từ
istr_dwo_related[6].s_related_obj_dwo_copy[2] = 'd_invoice_sal_form' // datawindow copy đến
istr_dwo_related[6].s_related_obj_column_copy[2] ='note;description;trans_date;payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate;trans_address;invoice_address;invoice_request;include_tax_yn;'  // cột copy đến
istr_dwo_related[6].s_main_obj_column_chk[2] = 'include_tax_yn'
istr_dwo_related[6].s_related_obj_column_chk[2] = 'include_tax_yn'

//istr_dwo_related[6].s_main_obj_dwo_copy[4] = 'd_charge_line_grid' // datawindow copy từ
//istr_dwo_related[6].s_main_obj_column_copy[4] =  'CHARGE_ID;CHARGE_PCT;TAX_YN;CHARGE_AMT;CHARGE_CURRENCY;EXCHANGE_RATE;CHARGE_BASE_AMT;OBJECT_OFFSET_ID;OBJECT_OFFSET_TABLE;'&
//																	+ 'SUBACCOUNT;BENEFICIARY_ID;BENEFICIARY_NAME;OBJECT_CODE;OBJECT_NAME;UOM_CODE;object_offset_code;object_offset_name;'					
//istr_dwo_related[6].s_related_obj_dwo_copy[4] = 'd_charge_line_grid' // datawindow copy đến
//istr_dwo_related[6].s_related_obj_column_copy[4] = 'CHARGE_ID;CHARGE_PCT;TAX_YN;CHARGE_AMT;CHARGE_CURRENCY;EXCHANGE_RATE;CHARGE_BASE_AMT;OBJECT_OFFSET_ID;OBJECT_OFFSET_TABLE;'&
//																	+ 'SUBACCOUNT;BENEFICIARY_ID;BENEFICIARY_NAME;OBJECT_CODE;OBJECT_NAME;UOM_CODE;object_offset_code;object_offset_name'
istr_dwo_related[6].s_main_obj_column_chk[2] = ''
istr_dwo_related[6].s_related_obj_column_chk[2] = ''
istr_dwo_related[6].s_match_f_dwo[2] = ''
istr_dwo_related[6].s_match_t_dwo[2] = '' 
istr_dwo_related[6].s_match_f_column[2] = ''
istr_dwo_related[6].s_match_t_column[2] = ''
istr_dwo_related[6].s_match_column[2] = ''
istr_dwo_related[6].s_main_obj_column_sum[2] = ''
istr_dwo_related[6].s_related_obj_column_sum[2] = ''
istr_dwo_related[6].s_f_obj_column_chk[2] = ''
istr_dwo_related[6].s_t_obj_column_chk[2] = ''
istr_dwo_related[6].b_f_sum[2] = false
istr_dwo_related[6].b_copy_line[2] = false


istr_dwo_related[7].s_related_obj_name = 'u_goods_transfer'					// đối tượng copy đến
istr_dwo_related[7].s_main_obj_dwo =  'd_document_inventory_grid'		//datawindow quan hệ main
istr_dwo_related[7].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[7].s_related_obj_dwo = 'd_document_inventory_grid' // datawindow quan hệ đến
istr_dwo_related[7].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[7].b_f_matching = true
istr_dwo_related[7].s_relatedtext_column = 'code'					
istr_dwo_related[7].s_text = 'Nhân bản phiếu chuyển kho : '

istr_dwo_related[7].s_main_obj_dwo_copy[1] =  'd_document_inventory_grid'// datawindow copy từ
istr_dwo_related[7].s_main_obj_column_copy[1] = 'object_name;ship_to_object_code;ship_to_object_name;trans_hdr_id;trans_desc;group_name;req_appr_note;appr_note;doc_type;roster_yn;invoice_request;' // cột copy từ
istr_dwo_related[7].s_related_obj_dwo_copy[1] = 'd_document_inventory_grid' // datawindow copy đến
istr_dwo_related[7].s_related_obj_column_copy[1] ='object_name;ship_to_object_code;ship_to_object_name;trans_hdr_id;trans_desc;group_name;req_appr_note;appr_note;doc_type;roster_yn;invoice_request;'  // cột copy đến
istr_dwo_related[7].s_match_f_dwo[1] = 'd_document_inventory_grid'
istr_dwo_related[7].s_match_t_dwo[1] = 'd_document_inventory_grid'

istr_dwo_related[7].s_main_obj_dwo_copy[2] =  'd_inventory_line_transfer_grid' // datawindow copy từ
istr_dwo_related[7].s_main_obj_column_copy[2] = 'ITEM_ID;item_code;LINE_TEXT;price;amount;NOTE;doc_qty;QTY;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;warehouse_id;wh_code;wh_name;object_id;cus_code;cus_name;' // cột copy từ
istr_dwo_related[7].s_related_obj_dwo_copy[2] = 'd_inventory_line_transfer_grid' // datawindow copy đến
istr_dwo_related[7].s_related_obj_column_copy[2] = 'ITEM_ID;item_code;LINE_TEXT;price;amount;NOTE;doc_qty;QTY;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;warehouse_id;wh_code;wh_name;object_id;cus_code;cus_name;'  // cột copy đến

istr_dwo_related[7].s_main_obj_dwo_copy[3] =  'd_goods_delivery_form' // datawindow copy từ
istr_dwo_related[7].s_main_obj_column_copy[3] ='object_code;object_name;invoice_object;note;description;trans_date;payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate;trans_address;invoice_address;delivery_person;receipt_person;delivery_mode_code;delivery_mode_name;delivery_mode'  // cột copy từ
istr_dwo_related[7].s_related_obj_dwo_copy[3] = 'd_goods_delivery_form' // datawindow copy đến
istr_dwo_related[7].s_related_obj_column_copy[3] ='object_code;object_name;invoice_object;note;description;trans_date;payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate;trans_address;invoice_address;delivery_person;receipt_person;delivery_mode_code;delivery_mode_name;delivery_mode'  // cột copy đến

//istr_dwo_related[7].s_main_obj_dwo_copy[4] =  'd_lot_line_grid' // datawindow copy từ
//istr_dwo_related[7].s_main_obj_column_copy[4] = 'manufacture_date;best_b4_date;qty;out_qty;lot_no;serial_no'
//istr_dwo_related[7].s_related_obj_dwo_copy[4] = 'd_lot_line_grid' // datawindow copy đến
//istr_dwo_related[7].s_related_obj_column_copy[4] ='manufacture_date;best_b4_date;qty;out_qty;lot_no;serial_no'
istr_dwo_related[7].s_main_obj_column_chk[3] = ''
istr_dwo_related[7].s_related_obj_column_chk[3] = ''
istr_dwo_related[7].s_match_f_dwo[3] = ''
istr_dwo_related[7].s_match_t_dwo[3] = ''
istr_dwo_related[7].s_match_f_column[3] = ''
istr_dwo_related[7].s_match_t_column[3] = ''
istr_dwo_related[7].s_match_column[3] = ''
istr_dwo_related[7].s_main_obj_column_sum[3] = ''
istr_dwo_related[7].s_related_obj_column_sum[3] = ''
istr_dwo_related[7].s_f_obj_column_chk[3] = ''
istr_dwo_related[7].s_t_obj_column_chk[3] = ''
istr_dwo_related[7].b_f_sum[3] = false
istr_dwo_related[7].b_copy_line[3] = false


istr_dwo_related[8].s_related_obj_name = 'u_prod_orders'					// đối tượng copy đến
istr_dwo_related[8].s_main_obj_dwo = 'd_document_inventory_grid'		//datawindow quan hệ main
istr_dwo_related[8].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[8].s_related_obj_dwo = 'd_document_prod_grid'	// datawindow quan hệ đến
istr_dwo_related[8].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[8].b_f_matching = true
//istr_dwo_related[8].b_copy_tax = true
istr_dwo_related[8].s_relatedtext_column = 'code'					
istr_dwo_related[8].s_text = 'Lệnh SX cho PCK: '

istr_dwo_related[8].s_main_obj_dwo_copy[1] = 'd_inventory_line_transfer_grid' // datawindow copy từ
istr_dwo_related[8].s_main_obj_column_copy[1] =  'ITEM_ID;item_code;item_name;DOC_QTY;' // cột copy từ
istr_dwo_related[8].s_related_obj_dwo_copy[1] = 'd_prod_line_grid' // datawindow copy đến
istr_dwo_related[8].s_related_obj_column_copy[1] = 'object_ID;object_code;object_name;PLAN_QTY;' // cột copy đến
istr_dwo_related[8].b_copy_line[1] = true
//khai báo cộng dồn số lượng
istr_dwo_related[8].b_f_sum[1] = true
istr_dwo_related[8].s_main_obj_column_sum[1] = 'doc_qty' 
istr_dwo_related[8].s_f_obj_column_chk[1] = 'ITEM_ID;'
istr_dwo_related[8].s_t_obj_column_chk[1] = 'object_ID;'
istr_dwo_related[8].s_main_dr_cr_obj_dwo_sum[1]=''
istr_dwo_related[8].s_main_dr_cr_obj_column_sum[1]=''
//khai bao dw tra hang
istr_dwo_related[8].s_match_rf_dwo[1] = ''
// khai báo cập nhật bản matching
istr_dwo_related[8].s_match_f_dwo[1] = 'd_inventory_line_transfer_grid'
//istr_dwo_related[8].s_match_f_col_obj[1] = 'item_id' //-- đóng lại vì cho phép phiếu xuất kho kết với đơn hàng dịch vụ
istr_dwo_related[8].s_match_t_dwo[1] = 'd_prod_line_grid' 
istr_dwo_related[8].s_match_f_column[1] = 'doc_qty'
istr_dwo_related[8].s_match_t_column[1] = 'PLAN_QTY'
istr_dwo_related[8].s_match_column[1] = 'qty'

istr_dwo_related[8].s_main_obj_dwo_copy[2] =  'd_goods_transfer_form'// datawindow copy từ
istr_dwo_related[8].s_main_obj_column_copy[2] = 'note;trans_date;uom_code;currency_id;exchange_rate;dr_cr_object;object_code;object_name;' // cột copy từ
istr_dwo_related[8].s_related_obj_dwo_copy[2] = 'd_prod_hdr_from' // datawindow copy đến
istr_dwo_related[8].s_related_obj_column_copy[2] ='note;trans_date;uom_code;currency_id;exchange_rate;dr_cr_object;object_code;object_name;'  // cột copy đến
istr_dwo_related[8].s_main_obj_column_chk[2] = ''
istr_dwo_related[8].s_related_obj_column_chk[2] = ''

//istr_dwo_related[8].s_main_obj_dwo_copy[4] = 'd_charge_line_grid' // datawindow copy từ
//istr_dwo_related[8].s_main_obj_column_copy[4] =  'CHARGE_ID;CHARGE_PCT;TAX_YN;CHARGE_AMT;CHARGE_CURRENCY;EXCHANGE_RATE;CHARGE_BASE_AMT;OBJECT_OFFSET_ID;OBJECT_OFFSET_TABLE;'&
//																	+ 'SUBACCOUNT;BENEFICIARY_ID;BENEFICIARY_NAME;OBJECT_CODE;OBJECT_NAME;UOM_CODE;object_offset_code;object_offset_name;'					
//istr_dwo_related[8].s_related_obj_dwo_copy[4] = 'd_charge_line_grid' // datawindow copy đến
//istr_dwo_related[8].s_related_obj_column_copy[4] = 'CHARGE_ID;CHARGE_PCT;TAX_YN;CHARGE_AMT;CHARGE_CURRENCY;EXCHANGE_RATE;CHARGE_BASE_AMT;OBJECT_OFFSET_ID;OBJECT_OFFSET_TABLE;'&
//																	+ 'SUBACCOUNT;BENEFICIARY_ID;BENEFICIARY_NAME;OBJECT_CODE;OBJECT_NAME;UOM_CODE;object_offset_code;object_offset_name'
istr_dwo_related[8].s_main_obj_column_chk[2] = ''
istr_dwo_related[8].s_related_obj_column_chk[2] = ''
istr_dwo_related[8].s_match_f_dwo[2] = ''
istr_dwo_related[8].s_match_t_dwo[2] = '' 
istr_dwo_related[8].s_match_f_column[2] = ''
istr_dwo_related[8].s_match_t_column[2] = ''
istr_dwo_related[8].s_match_column[2] = ''
istr_dwo_related[8].s_main_obj_column_sum[2] = ''
istr_dwo_related[8].s_related_obj_column_sum[2] = ''
istr_dwo_related[8].s_f_obj_column_chk[2] = ''
istr_dwo_related[8].s_t_obj_column_chk[2] = ''
istr_dwo_related[8].b_f_sum[2] = false
istr_dwo_related[8].b_copy_line[2] = false
end subroutine

public subroutine f_set_str_streamvalue ();//s_str_streamvalue	lstr_stream[]

istr_streamvalue[1].s_f_obj_dwo = 'd_goods_transfer_form'
istr_streamvalue[1].s_f_obj_column = 'dr_cr_object;LOT_NO;SERIAL_NO;loc_id'
istr_streamvalue[1].s_f_column_sv = 'F_OBJECT_ID;LOT_NO;SERIAL_NO;loc_id'

//istr_streamvalue[1].s_f_lot_dwo = 'd_lot_line_grid'
//istr_streamvalue[1].s_f_lot_column = 'LOT_NO;SERIAL_NO'

istr_streamvalue[1].s_t_obj_dwo = 'd_goods_transfer_form'
istr_streamvalue[1].s_t_obj_column = 'invoice_object;lot_no;serial_no;loc_id'
istr_streamvalue[1].s_t_column_sv = 'T_OBJECT_ID;t_lot_no;t_serial_no;t_loc_id'

istr_streamvalue[1].s_item_dwo = 'd_inventory_line_transfer_grid'
istr_streamvalue[1].s_item_column = 'item_id;spec_id;qty;trans_uom'
istr_streamvalue[1].s_item_column_sv = 'item_id;spec_id;qty;uom_id'

istr_streamvalue[1].s_item_lot_dwo = 'd_lot_line_grid'
istr_streamvalue[1].s_item_lot_column = 'out_qty'
istr_streamvalue[1].s_item_lot_column_sv = 'qty'

istr_streamvalue[1].s_currency_dwo = 'd_goods_transfer_form'
istr_streamvalue[1].s_currency_column = 'currency_id;exchange_rate;'
istr_streamvalue[1].s_currency_column_sv = 'trans_cur_id;exchange_rate;'

istr_streamvalue[1].s_value_dwo = 'd_inventory_line_transfer_grid'
istr_streamvalue[1].s_value_column = 'item_id;cogs;cogs;spec_id;qty_sku;'
istr_streamvalue[1].s_value_column_sv = 'item_id;trans_value;base_value;spec_id;qty;'



end subroutine

public function integer f_set_ds_4_posting ();int				li_idx


istr_ds_4_posting.ds_details[1] = create t_ds_db
istr_ds_4_posting.ds_details[1].dataobject =  'd_goods_transfer_form'
istr_ds_4_posting.s_dataobject_str += 'd_goods_transfer'+'['+string(1)+']'
istr_ds_4_posting.ds_master[1] = create t_ds_db
istr_ds_4_posting.ds_master[1].dataobject = 'd_doc_goods_transfer_form'
istr_ds_4_posting.s_join_detail[1] =''


li_idx = upperbound(istr_ds_4_posting.ds_details[]) + 1
istr_ds_4_posting.ds_details[li_idx] = create t_ds_db
istr_ds_4_posting.ds_details[li_idx].dataobject =  'd_inventory_line_transfer_grid'
istr_ds_4_posting.s_dataobject_str += 'd_inventory_line_transfer' +'['+string(li_idx)+']'
istr_ds_4_posting.ds_master[li_idx] = create t_ds_db
istr_ds_4_posting.ds_master[li_idx].dataobject = 'd_goods_transfer_form'	
istr_ds_4_posting.s_join_detail[li_idx] =''

//li_idx = upperbound(istr_ds_4_posting.ds_details[]) + 1
//istr_ds_4_posting.ds_details[li_idx] = create t_ds_db
//istr_ds_4_posting.ds_details[li_idx].dataobject =  'd_lot_line_grid'
//istr_ds_4_posting.s_dataobject_str +='d_lot_line_grid' +'['+string(li_idx)+']'
//istr_ds_4_posting.ds_master[li_idx] = create t_ds_db
//istr_ds_4_posting.ds_master[li_idx].dataobject = 'd_inventory_line_tansfer_grid'	
//istr_ds_4_posting.s_join_detail[li_idx] =''
return 1
end function

on c_goods_transfer.create
call super::create
end on

on c_goods_transfer.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = true
ib_display_text = false
is_display_model = '1d'
is_object_title = 'Phiếu chuyển kho'
istr_actionpane[1].s_button_name = 'b_add_multi;b_copyt_multi;b_insert;b_modify;b_save;b_delete;b_cancel;b_post;b_unpost;b_view_multi;b_send_2_approve;b_request_2_change;b_approve;b_reject;b_detail;'
istr_actionpane[1].s_button_has_sub = 'b_add_multi;b_view_multi;'
istr_actionpane[1].sa_sub_button[1]='b_add;b_copyt_seft;'
istr_actionpane[1].sa_sub_button[2]='b_view_transfer;b_view_goods_transfer;'

istr_actionpane[1].sa_enabled_subbutton[]= istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_description = is_object_title
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_join_multi;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_view_multi;b_blank;b_copyt_multi;b_post;b_blank;b_send_2_approve;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_view_multi;b_blank;b_copyt_multi;b_post;b_send_2_approve;b_approve;b_reject;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_view_multi;b_copyt_sal_invoice;b_blank;b_copyt_multi;b_blank;b_post;b_blank;b_send_2_approve;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_view_multi;b_blank;b_copyt_multi;b_blank;b_post;b_send_2_approve;b_approve;b_reject;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then ///this//
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_modify;b_filteron;b_refresh;b_delete;b_cancel;b_detail;b_view_multi;b_post;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_view_multi;b_copyt_multi;b_post;b_blank;b_send_2_approve;b_approve;b_reject;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =  ''
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

event e_dw_e_postinsertrow;//-- Override--/

double						ldb_version_id, ldb_branch
any							laa_retrieve[], laa_data[]
b_obj_instantiate			lbo_ins
s_str_data					lstr_data


ldb_version_id = lbo_ins.f_Create_id_ex( it_transaction )
rpo_dw.setitem(vl_currentrow,'doc_type','GOODS_TRANSFER')
rpo_dw.setitem(vl_currentrow,'object_ref_table','BOOKED_SLIP')
rpo_dw.setitem(vl_currentrow,'version_id',ldb_version_id)
rpo_dw.setitem(vl_currentrow,'handled_by',gi_userid)
//rpo_dw.setitem(vl_currentrow,'object_name', g_user.f_get_name_of_userid_ex(gi_userid, it_transaction ) )
rpo_dw.setitem(vl_currentrow,'status','new')
rpo_dw.setitem(vl_currentrow,'document_date',date(gd_session_date))
rpo_dw.setitem(vl_currentrow,'TRANS_DATE',date(gd_session_date))

if  lbo_ins.f_is_branch_yn_ex('u_trans_setup', it_transaction )then
	ldb_branch = gdb_branch
else
	ldb_branch = 0
end if			
if this.f_get_dfl_trans_info('GOODS_TRANSFER' , ldb_branch, lstr_data,it_transaction ) > 0 then
	idb_trans_id = lstr_data.db_data
	if not isnull(idb_trans_id) and idb_trans_id > 0 then 
		laa_data[1] = idb_trans_id
		laa_retrieve[1] = 'GOODS_TRANSFER'
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

event e_window_open;
//-- Override--//

t_dw_mpl			ldw_main
any				laa_value[]
//--form parm--//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '=GOODS_TRANSFER'
ldw_main.f_add_where('doc_type;',laa_value[])
return 0
end event

event e_dw_dwnkey;//-- OVERRIDE--//

string					ls_colname

if v_keycode = KeyEnter! then
	ls_colname = rpo_dw.getcolumnname()
	if upper(ls_colname) = 'T_WH_CODE' then
		iw_display.dynamic event e_detail( )
		return 2
	end if
end if
return 0
end event

event e_dw_e_postsave;//-- overrdie--//

double		ldb_doc_id, ldb_extend_id, ldb_billto_id, ldb_dr_cr_object
double		ldb_base_curr_id, ldb_exrate
string			ls_currCode, ls_currName, ls_qty_yn, ls_value_yn
date			ld_trans_date

c_unit_instance			lc_unit_ins

ldb_doc_id =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'id') 
if ldb_doc_id > 0 then
	
	//-- booked_sliP--//
	ldb_extend_id = rpo_dw.getitemnumber(rpo_dw.getrow(), 'extend_id') 
	ldb_billto_id = rpo_dw.getitemnumber(rpo_dw.getrow(), 'invoice_object') 
	ldb_dr_cr_object= rpo_dw.getitemnumber(rpo_dw.getrow(), 'dr_cr_object') 
	ls_qty_yn =  rpo_dw.getitemstring(rpo_dw.getrow(), 'quantity_yn') 
	ls_value_yn =  rpo_dw.getitemstring(rpo_dw.getrow(), 'value_yn') 
	ld_trans_date =  date(rpo_dw.getitemdatetime(rpo_dw.getrow(), 'trans_date') )
	ldb_exrate = rpo_dw.getitemnumber(rpo_dw.getrow(), 'exchange_rate') 	
	ldb_base_curr_id = rpo_dw.getitemnumber(rpo_dw.getrow(), 'CURRENCY_ID') 	
	if ldb_base_curr_id = 0 or isnull(ldb_base_curr_id) then
		lc_unit_ins.f_get_base_cur_ex( ldb_base_curr_id,ls_currCode, ls_currName, it_transaction )
		ldb_exrate = 1
	end if
	
	if ldb_extend_id > 0 then
		//-- update--//		
		UPDATE booked_slip 
		set invoice_object = :ldb_billto_id , dr_cr_object = :ldb_dr_cr_object,								
								currency_id = :ldb_base_curr_id, exchange_rate = :ldb_exrate,
								quantity_yn = :ls_qty_yn, value_yn = :ls_value_yn,								
								trans_date = :ld_trans_date
		where id = :ldb_extend_id using it_transaction;
	else
		//-- insert--//
		ldb_extend_id =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'version_id') 
		INSERT into booked_slip (id, object_ref_id, object_ref_Table, company_id, branch_id, created_by, created_Date, last_mdf_by, last_mdf_date, doc_type,version_no,
								  invoice_object, dr_cr_object, currency_id, exchange_rate,
								  quantity_yn, value_yn, trans_date )
		VALUES(:ldb_extend_id, :ldb_doc_id, 'DOCUMENT',:gi_user_comp_id, :gdb_branch, :gi_userid, sysdate, :gi_userid, sysdate,'GOODS_TRANSFER', 1,
					:ldb_billto_id,:ldb_dr_cr_object,:ldb_base_curr_id,:ldb_exrate ,
					:ls_qty_yn, :ls_value_yn, :ld_trans_date)
		using it_transaction;
	end if

	return 1
end if
return 0
end event

event e_dw_e_predelete;call super::e_dw_e_predelete;double		ldb_extend_id, ldb_doc_id
int				li_cnt
	//-- check matching --//
	ldb_doc_id = rpo_dw.getitemnumber(vl_currentrow, 'id') 
	select count(id) into :li_cnt
	from matching where f_doc_id = :ldb_doc_id using it_transaction;
	if li_cnt > 0 then
		gf_messagebox('m.c_goods_transfer.e_dw_e_predelete.01','Thông báo','Phiếu đã kết với chứng từ khác nên không xoá được','stop','ok',1)
		return -1
	end if
	//-- delete matching--//
	select count(id) into :li_cnt
	from matching where t_doc_id = :ldb_doc_id using it_transaction;	
	if li_cnt > 0 then
		delete from matching where t_doc_id = :ldb_doc_id using it_transaction;	
	end if
	
	//-- delete detail--//
	ldb_extend_id = rpo_dw.getitemnumber(vl_currentrow, 'extend_id') 
	if ldb_extend_id > 0 then
		iw_display.f_get_transaction(it_transaction)
		DELETE  booked_slip where id = :ldb_extend_id using it_transaction;
		//-- PO_LINE--//
		DELETE  inventory_line where object_ref_id = :ldb_extend_id using it_transaction;
		
		return 1
	end if

return 0
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

