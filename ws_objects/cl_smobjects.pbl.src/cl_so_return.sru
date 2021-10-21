$PBExportHeader$cl_so_return.sru
forward
global type cl_so_return from c_so_return
end type
end forward

global type cl_so_return from c_so_return
end type
global cl_so_return cl_so_return

forward prototypes
public subroutine f_set_dwo_related ()
end prototypes

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_goods_receipt'					// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = 'd_document_orders_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'd_document_inventory_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].b_f_matching = true
istr_dwo_related[1].s_relatedtext_column = 'doc_code'				
istr_dwo_related[1].s_text = 'Phiếu xuất kho từ : '

istr_dwo_related[1].s_main_obj_dwo_copy[1] = 'd_so_line_grid' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[1] = 'ITEM_ID;object_code;item_name;LINE_TEXT;NOTE;QTY;QTY;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;sales_person;price;act_price;amount;act_amount' // cột copy từ
istr_dwo_related[1].s_related_obj_dwo_copy[1] = 'd_inventory_line_receipt_grid' // datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[1] = 'ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;doc_qty;QTY;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;sales_person;price;act_price;amount;act_amount' // cột copy đến
istr_dwo_related[1].s_main_obj_column_chk[1] = ''
istr_dwo_related[1].s_related_obj_column_chk[1] = ''
istr_dwo_related[1].s_f_obj_column_chk[1] = 'ITEM_ID'
istr_dwo_related[1].s_t_obj_column_chk[1] = 'ITEM_ID'
istr_dwo_related[1].b_copy_line[1] = true
// khai báo cập nhật bản matching
istr_dwo_related[1].s_match_f_dwo[1] = 'd_so_line_grid'
istr_dwo_related[1].s_match_f_col_obj[1] = 'item_id'
istr_dwo_related[1].s_match_t_dwo[1] = 'd_inventory_line_receipt_grid'
istr_dwo_related[1].s_match_f_column[1] = 'qty'
istr_dwo_related[1].s_match_t_column[1] = 'qty'
istr_dwo_related[1].s_match_column[1] = 'qty'

istr_dwo_related[1].s_main_obj_dwo_copy[2] = 'd_order_so_form' 
istr_dwo_related[1].s_main_obj_column_copy[2] = 'bill_to_object;object_code_1;object_name_1;'
istr_dwo_related[1].s_related_obj_dwo_copy[2] = 'd_goods_receipt_form'
istr_dwo_related[1].s_related_obj_column_copy[2] ='invoice_object;object_code;object_name;'
//istr_dwo_related[1].s_related_obj_column_copy[2] = 'object_id;vendor_code;vendor_name;'
//istr_dwo_related[1].s_main_obj_column_chk[2] = 'object_id;object_code;object_name'
//istr_dwo_related[1].s_related_obj_column_chk[2] = 'object_id;cus_code;cus_name;'



istr_dwo_related[1].s_main_obj_dwo_copy[3] = 'd_order_so_form' 
istr_dwo_related[1].s_main_obj_column_copy[3] = 'payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate;delivery_mode;delivery_mode_code;delivery_mode_name;ship_to_addtext;bill_to_addtext;note;include_tax_yn;'
istr_dwo_related[1].s_related_obj_dwo_copy[3] = 'd_goods_receipt_form'
istr_dwo_related[1].s_related_obj_column_copy[3] = 'payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate;delivery_mode;delivery_mode_code;delivery_mode_name;trans_address;invoice_address;note;include_tax_yn'

istr_dwo_related[1].s_main_obj_dwo_copy[4] = 'd_order_catch_grid' 
istr_dwo_related[1].s_main_obj_column_copy[4] = 'CATCH_ITEM;object_code;object_name;uom_code;CATCH_UOM;CATCH_QTY;CATCH_QTY;CATCH_TEXT'
istr_dwo_related[1].s_related_obj_dwo_copy[4] = 'd_inventory_catch_grid'
istr_dwo_related[1].s_related_obj_column_copy[4] = 'CATCH_ITEM;item_code;item_name;uom_code;CATCH_UOM;CATCH_doc_QTY;CATCH_QTY;CATCH_TEXT'
istr_dwo_related[1].s_match_f_dwo[4] = 'd_order_catch_grid'
istr_dwo_related[1].s_match_t_dwo[4] = 'd_inventory_catch_grid'
istr_dwo_related[1].s_match_f_column[4] = 'catch_qty'
istr_dwo_related[1].s_match_t_column[4] = 'catch_qty'
istr_dwo_related[1].s_match_column[4] = 'qty'
istr_dwo_related[1].s_main_obj_column_chk[4] = ''
istr_dwo_related[1].s_related_obj_column_chk[4] = ''
istr_dwo_related[1].s_main_obj_column_sum[4] = ''
istr_dwo_related[1].s_related_obj_column_sum[4] = ''
istr_dwo_related[1].s_f_obj_column_chk[4] = ''
istr_dwo_related[1].s_t_obj_column_chk[4] = ''
istr_dwo_related[1].b_f_sum[4] = false
istr_dwo_related[1].b_copy_line[4] = false

/*
// Đối tượng liên quan
istr_dwo_related[1].s_related_obj_name = 'u_goods_receipt'					// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = 'd_document_orders_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'd_document_inventory_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].b_f_matching = true
istr_dwo_related[1].s_relatedtext_column = 'doc_code'					
istr_dwo_related[1].s_text = 'Phiếu xuất kho từ : '

istr_dwo_related[1].s_main_obj_dwo_copy[1] = 'd_so_line_grid' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[1] = 'ITEM_ID;object_code;object_name;LINE_TEXT;NOTE;QTY;QTY;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;sales_person;price;act_price;amount;act_amount;base_price;' // cột copy từ
istr_dwo_related[1].s_related_obj_dwo_copy[1] = 'd_inventory_line_receipt_grid' // datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[1] = 'ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;doc_qty;QTY;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;sales_person;price;act_price;amount;act_amount;base_price;' // cột copy đến
istr_dwo_related[1].s_main_obj_column_chk[1] = ''
istr_dwo_related[1].s_related_obj_column_chk[1] = ''
istr_dwo_related[1].s_f_obj_column_chk[1] = 'ITEM_ID'
istr_dwo_related[1].s_t_obj_column_chk[1] = 'ITEM_ID'
istr_dwo_related[1].b_copy_line[1] = true
// khai báo cập nhật bản matching
istr_dwo_related[1].s_match_f_dwo[1] = 'd_so_line_grid'
istr_dwo_related[1].s_match_f_col_obj[1] = 'item_id'
istr_dwo_related[1].s_match_t_dwo[1] = 'd_inventory_line_receipt_grid'
istr_dwo_related[1].s_match_f_column[1] = 'qty'
istr_dwo_related[1].s_match_t_column[1] = 'qty'
istr_dwo_related[1].s_match_column[1] = 'qty'

//istr_dwo_related[1].s_main_obj_dwo_copy[2] = 'd_order_so_form' 
//istr_dwo_related[1].s_main_obj_column_copy[2] = 'bill_to_object;object_code_1;object_name_1;'
//istr_dwo_related[1].s_related_obj_dwo_copy[2] = 'd_goods_receip_form'
//istr_dwo_related[1].s_related_obj_column_copy[2] = 'invoice_object;object_code;object_name;'
//istr_dwo_related[1].s_main_obj_column_chk[2] = 'object_id;object_code;object_name'
//istr_dwo_related[1].s_related_obj_column_chk[2] = 'object_id;cus_code;cus_name;'

istr_dwo_related[1].s_main_obj_dwo_copy[2] = 'd_order_so_form' 
istr_dwo_related[1].s_main_obj_column_copy[2] = 'bill_to_object;object_code_1;object_name_1;payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate;delivery_mode;delivery_mode_code;delivery_mode_name;'+&
																	'ship_to_addtext;bill_to_addtext;note;include_tax_yn;'
istr_dwo_related[1].s_related_obj_dwo_copy[2] = 'd_goods_receipt_form'
istr_dwo_related[1].s_related_obj_column_copy[2] = 'invoice_object;object_code;object_name;payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate;delivery_mode;delivery_mode_code;delivery_mode_name;'+&
																	'trans_address;invoice_address;note;include_tax_yn;'
istr_dwo_related[1].s_main_obj_column_chk[2] = 'object_code_1;bill_to_object;'
istr_dwo_related[1].s_related_obj_column_chk[2] = 'object_code;invoice_object;'
istr_dwo_related[1].b_copy_line[2] = true																	

istr_dwo_related[1].s_main_obj_dwo_copy[3] = 'd_order_catch_grid' 
istr_dwo_related[1].s_main_obj_column_copy[3] = 'CATCH_ITEM;object_code;object_name;uom_code;CATCH_UOM;CATCH_QTY;CATCH_QTY;CATCH_TEXT'
istr_dwo_related[1].s_related_obj_dwo_copy[4] = 'd_inventory_catch_grid'
istr_dwo_related[1].s_related_obj_column_copy[3] = 'CATCH_ITEM;item_code;item_name;uom_code;CATCH_UOM;CATCH_doc_QTY;CATCH_QTY;CATCH_TEXT'
istr_dwo_related[1].s_match_f_dwo[3] = 'd_order_catch_grid'
istr_dwo_related[1].s_match_t_dwo[3] = 'd_inventory_catch_grid'
istr_dwo_related[1].s_match_f_column[3] = 'catch_qty'
istr_dwo_related[1].s_match_t_column[3] = 'catch_qty'
istr_dwo_related[1].s_match_column[3] = 'qty'
istr_dwo_related[1].s_main_obj_column_chk[3] = ''
istr_dwo_related[1].s_related_obj_column_chk[3] = ''
istr_dwo_related[1].s_main_obj_column_sum[3] = ''
istr_dwo_related[1].s_related_obj_column_sum[3] = ''
istr_dwo_related[1].s_f_obj_column_chk[3] = ''
istr_dwo_related[1].s_t_obj_column_chk[3] = ''
istr_dwo_related[1].b_f_sum[3] = false
istr_dwo_related[1].b_copy_line[3] = false
*/

istr_dwo_related[2].s_related_obj_name = 'b_view'				// đối tượng copy đến
istr_dwo_related[2].s_main_obj_dwo = 'd_document_orders_grid'		//datawindow quan hệ main
istr_dwo_related[2].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[2].s_related_obj_dwo = 'dv_so_return_form'	// datawindow quan hệ đến
istr_dwo_related[2].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[2].s_relatedtext_column = 'code'					
istr_dwo_related[2].s_text = 'In đề xuất trả hàng'

// Đối tượng liên quan
istr_dwo_related[3].s_related_obj_name = 'u_so'					// đối tượng liên quan
istr_dwo_related[3].s_main_obj_dwo = 'd_document_orders_grid'		//datawindow quan hệ main
istr_dwo_related[3].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[3].s_related_obj_dwo = 'd_document_orders_grid'	// datawindow quan hệ đến
istr_dwo_related[3].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[3].b_t_matching = true
istr_dwo_related[3].b_return = true
istr_dwo_related[3].s_relatedtext_column = 'doc_code'					
istr_dwo_related[3].s_text ='Đề xuất bán hàng từ: '
istr_dwo_related[3].s_match_f_dwo[1] = 'd_so_line_grid'
istr_dwo_related[3].s_match_t_dwo[1] = 'd_so_line_grid'
istr_dwo_related[3].s_match_f_column[1] = 'act_qty'
istr_dwo_related[3].s_match_t_column[1] = 'act_qty'
istr_dwo_related[3].s_match_column[1] = 'qty'

istr_dwo_related[3].s_match_f_dwo[2] = 'd_order_catch_grid'
istr_dwo_related[3].s_match_t_dwo[2] = 'd_order_catch_grid'
istr_dwo_related[3].s_match_f_column[2] = 'catch_qty'
istr_dwo_related[3].s_match_t_column[2] = 'catch_qty'
istr_dwo_related[3].s_match_column[2] = 'qty'
istr_dwo_related[3].s_main_obj_column_sum[2] = ''
istr_dwo_related[3].s_related_obj_column_sum[2] = ''
istr_dwo_related[3].b_f_sum[2] = false

istr_dwo_related[4].s_related_obj_name = 'u_so_return'					// đối tượng copy đến
istr_dwo_related[4].s_main_obj_dwo = 	'd_document_orders_grid'	//datawindow quan hệ main
istr_dwo_related[4].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[4].s_related_obj_dwo =  'd_document_orders_grid'	// datawindow quan hệ đến
istr_dwo_related[4].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[4].s_relatedtext_column = 'code'					
istr_dwo_related[4].s_text = 'Nhân bản từ đề xuất trả hàng : '

istr_dwo_related[4].s_main_obj_dwo_copy[1] = 'd_document_orders_grid' // datawindow copy từ
istr_dwo_related[4].s_main_obj_column_copy[1] =  'handled_by;trans_hdr_id;ship_to_object_code;object_name;trans_desc;group_name;req_appr_note;appr_note;doc_type;'																	
istr_dwo_related[4].s_related_obj_dwo_copy[1] = 'd_document_orders_grid' // datawindow copy đến
istr_dwo_related[4].s_related_obj_column_copy[1] = 'handled_by;trans_hdr_id;ship_to_object_code;object_name;trans_desc;group_name;req_appr_note;appr_note;doc_type;'
istr_dwo_related[4].s_match_f_dwo[1] = 'd_document_orders_grid'
istr_dwo_related[4].s_match_t_dwo[1] = 'd_document_orders_grid'																			
istr_dwo_related[4].s_main_obj_dwo_copy[2] = 'd_order_so_form' // datawindow copy từ
istr_dwo_related[4].s_main_obj_column_copy[2] = 'object_id;object_code;object_name;ship_to_addtext;bill_to_object;object_name_1;object_code_1;bill_to_addtext;'
istr_dwo_related[4].s_main_obj_column_copy[2] += 'due_date;payment_term_code;payment_term_name;payment_method_code;payment_method_name;'
istr_dwo_related[4].s_main_obj_column_copy[2] += 'uom_code;currency_id;exchange_rate;include_tax_yn;note;payment_term;payment_method;delivery_mode_code;delivery_mode_name;delivery_mode;contact_name;contact_id'
istr_dwo_related[4].s_related_obj_dwo_copy[2] = 'd_order_so_form' // datawindow copy đến
istr_dwo_related[4].s_related_obj_column_copy[2]= 'object_id;object_code;object_name;ship_to_addtext;bill_to_object;object_name_1;object_code_1;bill_to_addtext;'
istr_dwo_related[4].s_related_obj_column_copy[2] += 'due_date;payment_term_code;payment_term_name;payment_method_code;payment_method_name;'
istr_dwo_related[4].s_related_obj_column_copy[2] += 'uom_code;currency_id;exchange_rate;include_tax_yn;note;payment_term;payment_method;delivery_mode_code;delivery_mode_name;delivery_mode;contact_name;contact_id'

istr_dwo_related[4].s_main_obj_dwo_copy[3] = 'd_so_line_grid' // datawindow copy từ
istr_dwo_related[4].s_main_obj_column_copy[3] =  'ITEM_ID;object_code;object_name;LINE_TEXT;NOTE;QTY;act_qty;price;act_price;amount;act_amount;markup_pct;markup_amt;comm_pct;comm_amt;not_invoice;foc_yn;'+&
																			'uom_code;TRANS_UOM;markup_return;SALES_PERSON;staff_name;amount_ex_tax;markup_pct;markup_return;markup_amt;note;other_note;comm_pct;comm_amt;' // cột copy từ
istr_dwo_related[4].s_related_obj_dwo_copy[3] = 'd_so_line_grid' // datawindow copy đến
istr_dwo_related[4].s_related_obj_column_copy[3] = 'ITEM_ID;object_code;object_name;LINE_TEXT;NOTE;QTY;act_qty;price;act_price;amount;act_amount;markup_pct;markup_amt;comm_pct;comm_amt;not_invoice;foc_yn;'+&
																		'uom_code;TRANS_UOM;markup_return;SALES_PERSON;staff_name;amount_ex_tax;markup_pct;markup_return;markup_amt;note;other_note;comm_pct;comm_amt;' 
					
istr_dwo_related[4].s_main_obj_dwo_copy[4] = 'd_tax_line_grid' // datawindow copy từ
istr_dwo_related[4].s_main_obj_column_copy[4] = 'line_no;object_code;object_name;tax_id;tax_type;tax_pct;tax_amt;tax_correction;uom_code;exchange_rate;uprow_yn;include_yn'
istr_dwo_related[4].s_related_obj_dwo_copy[4] = 'd_tax_line_grid' // datawindow copy đến
istr_dwo_related[4].s_related_obj_column_copy[4] = 'line_no;object_code;object_name;tax_id;tax_type;tax_pct;tax_amt;tax_correction;uom_code;exchange_rate;uprow_yn;include_yn'

istr_dwo_related[4].s_main_obj_dwo_copy[5] = 'd_order_catch_grid' // datawindow copy từ
istr_dwo_related[4].s_main_obj_column_copy[5] = 'catch_item;catch_uom;object_type;object_code;object_name;catch_qty;uom_code;catch_text'
istr_dwo_related[4].s_related_obj_dwo_copy[5] = 'd_order_catch_grid' // datawindow copy đến
istr_dwo_related[4].s_related_obj_column_copy[5] = 'catch_item;catch_uom;object_type;object_code;object_name;catch_qty;uom_code;catch_text'
istr_dwo_related[4].s_main_obj_column_chk[5] = ''
istr_dwo_related[4].s_related_obj_column_chk[5] = ''	

istr_dwo_related[4].s_main_obj_dwo_copy[6] = 'd_so_tech_grid' // datawindow copy từ
istr_dwo_related[4].s_main_obj_column_copy[6] = 'tech_staff;staff_code;staff_name;s_time;f_time;work_hour;actual_f_time;tech_note'
istr_dwo_related[4].s_related_obj_dwo_copy[6] = 'd_so_tech_grid' // datawindow copy đến
istr_dwo_related[4].s_related_obj_column_copy[6] = 'tech_staff;staff_code;staff_name;s_time;f_time;work_hour;actual_f_time;tech_note'

istr_dwo_related[4].s_main_obj_column_chk[6] = ''
istr_dwo_related[4].s_related_obj_column_chk[6] = ''
istr_dwo_related[4].s_match_f_dwo[6] = ''
istr_dwo_related[4].s_match_t_dwo[6] = ''
istr_dwo_related[4].s_match_f_column[6] =''
istr_dwo_related[4].s_match_t_column[6] =''
istr_dwo_related[4].s_match_column[6] = ''
istr_dwo_related[4].s_main_obj_column_sum[6] = ''
istr_dwo_related[4].s_related_obj_column_sum[6] = ''
istr_dwo_related[4].s_f_obj_column_chk[6] = ''
istr_dwo_related[4].s_t_obj_column_chk[6] = ''
istr_dwo_related[4].b_f_sum[6] = false

// Đối tượng liên quan
istr_dwo_related[5].s_related_obj_name = 'u_sal_invoice_return'					// đối tượng copy đến
istr_dwo_related[5].s_main_obj_dwo = 'd_document_orders_grid'		//datawindow quan hệ main
istr_dwo_related[5].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[5].s_related_obj_dwo = 'd_document_ar_grid'	// datawindow quan hệ đến
istr_dwo_related[5].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[5].b_f_matching = true
istr_dwo_related[5].s_relatedtext_column = 'doc_code'					
istr_dwo_related[5].s_text = 'Hóa đơn KH trả hàng từ: '

istr_dwo_related[5].s_main_obj_dwo_copy[1] = 'd_so_line_grid' // datawindow copy từ
istr_dwo_related[5].s_main_obj_column_copy[1] =  'ITEM_ID;object_code;object_name;LINE_TEXT;NOTE;QTY;act_qty;price;act_price;amount;act_amount;markup_pct;markup_amt;comm_pct;comm_amt;not_invoice;foc_yn;sales_name;sales_person;'+&
																			'uom_code;TRANS_UOM;warehouse_id;wh_code;wh_name;SPEC_ID;spec_code;spec_name' // cột copy từ
istr_dwo_related[5].s_related_obj_dwo_copy[1] = 'd_sal_invoice_line_grid' // datawindow copy đến
istr_dwo_related[5].s_related_obj_column_copy[1] = 'object_ID;object_code;object_name;LINE_TEXT;NOTE;QTY;act_qty;price;act_price;amount;act_amount;markup_pct;markup_amt;comm_pct;comm_amt;not_invoice;foc_yn;sales_name;sales_person;'+&
																			'uom_code;TRANS_UOM;warehouse_id;warehouse_code;warehouse_name;SPEC_ID;spec_code;spec_name' // cột copy đến
istr_dwo_related[5].s_main_obj_column_chk[1] = ''
istr_dwo_related[5].s_related_obj_column_chk[1] = ''
istr_dwo_related[5].s_f_obj_column_chk[1] = 'ITEM_ID'
istr_dwo_related[5].s_t_obj_column_chk[1] = 'object_ID'
istr_dwo_related[5].b_copy_line[1] = true
// khai báo cập nhật bản matching
istr_dwo_related[5].s_match_f_dwo[1] = 'd_so_line_grid'
//istr_dwo_related[5].s_match_f_col_obj[1] = 'item_id'
istr_dwo_related[5].s_match_t_dwo[1] = 'd_sal_invoice_line_grid'
istr_dwo_related[5].s_match_f_column[1] = 'qty'
istr_dwo_related[5].s_match_t_column[1] = 'qty'
istr_dwo_related[5].s_match_column[1] = 'qty'

// khai báo struct lấy giá bán
istr_dwo_related[5].b_get_price=true
istr_dwo_related[5].s_dwo_get_price='d_sal_invoice_line_grid'
istr_dwo_related[5].s_col_get_price[1]='cogs'
istr_dwo_related[5].s_col_get_price[2]='price'
istr_dwo_related[5].s_col_get_qty[1]='qty'
istr_dwo_related[5].s_col_get_qty[2]=''
istr_dwo_related[5].s_dwo_set_price='d_sal_invoice_line_grid'
istr_dwo_related[5].s_col_set_price[1]='cogs'
istr_dwo_related[5].s_col_set_price[2]='price'
istr_dwo_related[5].s_col_set_qty[1]='qty'
istr_dwo_related[5].s_col_set_qty[2]=''

istr_dwo_related[5].s_main_obj_dwo_copy[2] = 'd_tax_line_grid' // datawindow copy từ
istr_dwo_related[5].s_main_obj_column_copy[2] =  'tax_correction;tax_amt;tax_pct;tax_type;'					
istr_dwo_related[5].s_related_obj_dwo_copy[2] = 'd_sal_invoice_line_grid' // datawindow copy đến
istr_dwo_related[5].s_related_obj_column_copy[2] = 'tax_correction;tax_amt;tax_pct;tax_type;'
istr_dwo_related[5].s_main_obj_column_chk[2] = ''
istr_dwo_related[5].s_related_obj_column_chk[2] = ''

istr_dwo_related[5].s_main_obj_dwo_copy[3] = 'd_tax_line_grid' // datawindow copy từ
istr_dwo_related[5].s_main_obj_column_copy[3] =  'TAX_ID;TAX_PCT;UPROW_YN;INCLUDE_YN;TAX_AMT;TAX_CORRECTION;TRANS_CURRENCY;EXCHANGE_RATE;TRANS_TAX_AMOUNT;'					
istr_dwo_related[5].s_related_obj_dwo_copy[3] = 'd_tax_line_grid' // datawindow copy đến
istr_dwo_related[5].s_related_obj_column_copy[3] = 'TAX_ID;TAX_PCT;UPROW_YN;INCLUDE_YN;TAX_AMT;TAX_CORRECTION;TRANS_CURRENCY;EXCHANGE_RATE;TRANS_TAX_AMOUNT;'
istr_dwo_related[5].s_main_obj_column_chk[3] = ''
istr_dwo_related[5].s_related_obj_column_chk[3] = ''

istr_dwo_related[5].s_main_obj_dwo_copy[4] = 'd_order_so_form'
istr_dwo_related[5].s_main_obj_column_copy[4] = 'object_id;object_code;object_name;ship_to_addtext;bill_to_object;object_name_1;object_code_1;bill_to_addtext;'
istr_dwo_related[5].s_main_obj_column_copy[4] += 'due_date;payment_term_code;payment_term_name;payment_method_code;payment_method_name;'
istr_dwo_related[5].s_main_obj_column_copy[4] += 'uom_code;currency_id;exchange_rate;include_tax_yn;note;payment_term;payment_method;invoice_request;'
istr_dwo_related[5].s_related_obj_dwo_copy[4] = 'd_invoice_sal_form'
istr_dwo_related[5].s_related_obj_column_copy[4] = 'invoice_object;invoice_object_code;invoice_object_name;invoice_address;dr_cr_object;dr_cr_object_name;dr_cr_object_code;trans_address;'
istr_dwo_related[5].s_related_obj_column_copy[4] +='due_date;payment_term_code;payment_term_name;payment_method_code;payment_method_name;'
istr_dwo_related[5].s_related_obj_column_copy[4] += 'uom_code;currency_id;exchange_rate;include_tax_yn;note;payment_term;payment_method;invoice_request;'														
istr_dwo_related[5].s_main_obj_column_chk[4] = 'object_id;bill_to_object;currency_id;'
istr_dwo_related[5].s_related_obj_column_chk[4] = 'invoice_object;dr_cr_object;currency_id'
istr_dwo_related[5].s_match_f_dwo[4] = ''
istr_dwo_related[5].s_match_t_dwo[4] = ''
istr_dwo_related[5].s_match_f_column[4] = ''
istr_dwo_related[5].s_match_t_column[4] = ''
istr_dwo_related[5].s_match_column[4] = ''
istr_dwo_related[5].s_main_obj_column_sum[4] = ''
istr_dwo_related[5].s_related_obj_column_sum[4] = ''
istr_dwo_related[5].s_f_obj_column_chk[4] = ''
istr_dwo_related[5].s_t_obj_column_chk[4] = ''
istr_dwo_related[5].b_f_sum[4] = false
istr_dwo_related[5].b_copy_line[4] = false

istr_dwo_related[6].s_related_obj_name = 'u_map_invoice'
istr_dwo_related[6].s_main_obj_dwo = 'd_order_so_form'
istr_dwo_related[6].s_main_obj_column = 'bill_to_object'
istr_dwo_related[6].s_related_obj_dwo = 'd_address_map_form'
istr_dwo_related[6].s_related_obj_column = 'object_id'

istr_dwo_related[7].s_related_obj_name = 'u_map_delivery'
istr_dwo_related[7].s_main_obj_dwo = 'd_order_so_form'
istr_dwo_related[7].s_main_obj_column = 'object_id'
istr_dwo_related[7].s_related_obj_dwo = 'd_address_map_form'
istr_dwo_related[7].s_related_obj_column = 'object_id'
end subroutine

on cl_so_return.create
call super::create
end on

on cl_so_return.destroy
call super::destroy
end on

