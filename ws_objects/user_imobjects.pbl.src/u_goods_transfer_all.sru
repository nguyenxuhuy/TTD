$PBExportHeader$u_goods_transfer_all.sru
forward
global type u_goods_transfer_all from cl_goods_transfer_all
end type
end forward

global type u_goods_transfer_all from cl_goods_transfer_all
end type
global u_goods_transfer_all u_goods_transfer_all

forward prototypes
public subroutine f_set_dwo_related ()
end prototypes

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'b_view'				// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = 'd_document_inventory_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'dv_transfer_form'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].s_relatedtext_column = 'code'					
istr_dwo_related[1].s_text = 'In phiếu XK kiêm VC-NB'

istr_dwo_related[2].s_related_obj_name = 'b_view'				// đối tượng copy đến
istr_dwo_related[2].s_main_obj_dwo = 'd_document_inventory_grid'		//datawindow quan hệ main
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

istr_dwo_related[4].s_related_obj_name = 'u_goods_transfer'					// đối tượng copy đến
istr_dwo_related[4].s_main_obj_dwo = 	'd_inventory_line_transfer_grid'	//datawindow quan hệ main
istr_dwo_related[4].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[4].s_related_obj_dwo =  'd_inventory_line_transfer_grid'	// datawindow quan hệ đến
istr_dwo_related[4].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[4].b_f_matching = true
istr_dwo_related[4].s_relatedtext_column = 'doc_code'					
istr_dwo_related[4].s_text = 'Phiếu chuyển kho : '

istr_dwo_related[4].s_main_obj_dwo_copy[1] ='d_inventory_line_transfer_grid' // datawindow copy từ
istr_dwo_related[4].s_main_obj_column_copy[1] = 'line_no;object_type;item_id;item_code;line_text;doc_qty;qty;uom_code;foc_yn;note;spec_name;subaccount_code;TRANS_UOM' // cột copy từ
istr_dwo_related[4].s_related_obj_dwo_copy[1] = 'd_inventory_line_transfer_grid'  // datawindow copy đến
istr_dwo_related[4].s_related_obj_column_copy[1] ='line_no;object_type;item_id;item_code;line_text;doc_qty;qty;uom_code;foc_yn;note;spec_name;subaccount_code;TRANS_UOM'  // cột copy đến
istr_dwo_related[4].s_main_obj_column_chk[1] = ''
istr_dwo_related[4].s_related_obj_column_chk[1] = ''
istr_dwo_related[4].s_match_f_dwo[1] = 'd_inventory_line_transfer_grid'
istr_dwo_related[4].s_match_f_col_obj[1] = 'item_id'
istr_dwo_related[4].s_match_t_dwo[1] = 'd_inventory_line_transfer_grid'
istr_dwo_related[4].s_match_f_column[1] = 'qty'
istr_dwo_related[4].s_match_t_column[1] = 'qty'
istr_dwo_related[4].s_match_column[1] = 'qty'

istr_dwo_related[4].s_main_obj_dwo_copy[2] = 'd_goods_delivery_form' 
istr_dwo_related[4].s_main_obj_column_copy[2] = 'delivery_person;receipt_person;DELIVERY_MODE;delivery_mode_code;delivery_mode_name;note;description;trans_address'
istr_dwo_related[4].s_related_obj_dwo_copy[2] = 'd_goods_delivery_form'
istr_dwo_related[4].s_related_obj_column_copy[2] = 'delivery_person;receipt_person;DELIVERY_MODE;delivery_mode_code;delivery_mode_name;note;description;trans_address'

istr_dwo_related[4].s_main_obj_dwo_copy[3] = 'd_inventory_catch_grid' 
istr_dwo_related[4].s_main_obj_column_copy[3] =  'CATCH_ITEM;item_code;item_name;uom_code;CATCH_doc_QTY;CATCH_QTY;CATCH_TEXT'
istr_dwo_related[4].s_related_obj_dwo_copy[3] = 'd_inventory_catch_grid'
istr_dwo_related[4].s_related_obj_column_copy[3] = 'CATCH_ITEM;item_code;item_name;uom_code;CATCH_doc_QTY;CATCH_QTY;CATCH_TEXT'


istr_dwo_related[4].s_main_obj_column_chk[3] = ''
istr_dwo_related[4].s_related_obj_column_chk[3] = ''
istr_dwo_related[4].s_match_f_dwo[3] = ''
istr_dwo_related[4].s_match_t_dwo[3] =''
istr_dwo_related[4].s_match_f_column[3] =''
istr_dwo_related[4].s_match_t_column[3] = ''
istr_dwo_related[4].s_match_column[3] =''
istr_dwo_related[4].s_main_obj_column_sum[3] = ''
istr_dwo_related[4].s_related_obj_column_sum[3] = ''
istr_dwo_related[4].s_f_obj_column_chk[3] =''
istr_dwo_related[4].s_t_obj_column_chk[3] = ''
istr_dwo_related[4].b_f_sum[3] = false

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
istr_dwo_related[6].s_relatedtext_column = 'doc_code'					
istr_dwo_related[6].s_text = 'Hóa đơn bán từ: '

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
end subroutine

on u_goods_transfer_all.create
call super::create
end on

on u_goods_transfer_all.destroy
call super::destroy
end on

