$PBExportHeader$cl_goods_delivery_all.sru
forward
global type cl_goods_delivery_all from c_goods_delivery
end type
end forward

global type cl_goods_delivery_all from c_goods_delivery
end type
global cl_goods_delivery_all cl_goods_delivery_all

forward prototypes
public subroutine f_set_dwo_related ()
end prototypes

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_sal_invoice_all'					// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = istr_dwo[1].s_dwo_default	//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'd_document_ar_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].b_f_matching = true
//istr_dwo_related[1].b_copy_tax = true
istr_dwo_related[1].s_relatedtext_column = 'doc_code'					
istr_dwo_related[1].s_text = 'Hóa đơn bán từ: '

istr_dwo_related[1].s_main_obj_dwo_copy[1] = iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[1] =  'ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;QTY;QTY;uom_code;TRANS_UOM;warehouse_id;wh_code;wh_name;SPEC_ID;spec_code;spec_name;PRICE;AMOUNT;' +&
																		'ACT_PRICE;ACT_AMOUNT;MARKUP_QTY;MARKUP_AMT;COMM_AMT;NOT_INVOICE;foc_yn;BRANCH_ID;' +&
																		'TAX_PCT;TAX_AMT;TAX_CORRECTION;MARKUP_RETURN;sales_person;MARKUP_PCT;disc_pct;disc_amt;' // cột copy từ
istr_dwo_related[1].s_related_obj_dwo_copy[1] = 'd_sal_invoice_line_grid' // datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[1] = 'object_ID;object_code;object_name;LINE_TEXT;NOTE;QTY;act_qty;uom_code;TRANS_UOM;warehouse_id;warehouse_code;warehouse_name;SPEC_ID;spec_code;spec_name;PRICE;AMOUNT;' +&
																			'ACT_PRICE;ACT_AMOUNT;MARKUP_QTY;MARKUP_AMT;COMM_AMT;NOT_INVOICE;foc_yn;BRANCH_ID;'+&
																			'TAX_PCT;TAX_AMT;TAX_CORRECTION;MARKUP_RETURN;sales_person;MARKUP_PCT;disc_pct;disc_amt;' // cột copy đến
istr_dwo_related[1].b_copy_line[1] = true
//khai báo cộng dồn số lượng
istr_dwo_related[1].b_f_sum[1] = true
istr_dwo_related[1].s_main_obj_column_sum[1] = 'qty;MARKUP_QTY;MARKUP_AMT;COMM_AMT;MARKUP_RETURN;' 
istr_dwo_related[1].s_f_obj_column_chk[1] = 'ITEM_ID;PRICE;NOT_INVOICE;foc_yn;LINE_TEXT;ACT_PRICE;'
istr_dwo_related[1].s_t_obj_column_chk[1] = 'object_ID;PRICE;NOT_INVOICE;foc_yn;LINE_TEXT;ACT_PRICE;'
istr_dwo_related[1].s_main_dr_cr_obj_dwo_sum[1]=''
istr_dwo_related[1].s_main_dr_cr_obj_column_sum[1]=''
//khai bao dw tra hang
istr_dwo_related[1].s_match_rf_dwo[1] = 'd_so_line_grid;d_inventory_line_delivery_grid'
// khai báo cập nhật bản matching
istr_dwo_related[1].s_match_f_dwo[1] = iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default
//istr_dwo_related[1].s_match_f_col_obj[1] = 'item_id' //-- đóng lại vì cho phép phiếu xuất kho kết với đơn hàng dịch vụ
istr_dwo_related[1].s_match_t_dwo[1] = 'd_sal_invoice_line_grid' 
istr_dwo_related[1].s_match_f_column[1] = 'qty'
istr_dwo_related[1].s_match_t_column[1] = 'act_qty'
istr_dwo_related[1].s_match_column[1] = 'qty'


istr_dwo_related[1].s_main_obj_dwo_copy[2] =  istr_dwo[2].s_dwo_default // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[2] = 'invoice_object;object_code;object_name;trans_address;invoice_object;object_code;object_name;invoice_address;BRANCH_ID;' + &
												 'note;description;trans_date;payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate;invoice_address;invoice_address;invoice_request;include_tax_yn;' // cột copy từ
istr_dwo_related[1].s_related_obj_dwo_copy[2] = 'd_invoice_sal_form' // datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[2] = 'invoice_object;invoice_object_code;invoice_object_name;trans_address;dr_cr_object;dr_cr_object_code;dr_cr_object_name;invoice_address;BRANCH_ID;' + &
												'note;description;trans_date;payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate;trans_address;invoice_address;invoice_request;include_tax_yn;'  // cột copy đến
istr_dwo_related[1].s_main_obj_column_chk[2] = 'object_code;include_tax_yn'
istr_dwo_related[1].s_related_obj_column_chk[2] = 'invoice_object_code;include_tax_yn'

istr_dwo_related[1].s_main_obj_dwo_copy[3] = istr_dwo[6].s_dwo_default // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[3] =  'CHARGE_ID;CHARGE_PCT;TAX_YN;CHARGE_AMT;CHARGE_CURRENCY;EXCHANGE_RATE;CHARGE_BASE_AMT;OBJECT_OFFSET_ID;OBJECT_OFFSET_TABLE;'&
																	+ 'SUBACCOUNT;BENEFICIARY_ID;BENEFICIARY_NAME;OBJECT_CODE;OBJECT_NAME;UOM_CODE;object_offset_code;object_offset_name;BRANCH_ID;'					
istr_dwo_related[1].s_related_obj_dwo_copy[3] = 'd_charge_line_grid' // datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[3] = 'CHARGE_ID;CHARGE_PCT;TAX_YN;CHARGE_AMT;CHARGE_CURRENCY;EXCHANGE_RATE;CHARGE_BASE_AMT;OBJECT_OFFSET_ID;OBJECT_OFFSET_TABLE;'&
																	+ 'SUBACCOUNT;BENEFICIARY_ID;BENEFICIARY_NAME;OBJECT_CODE;OBJECT_NAME;UOM_CODE;object_offset_code;object_offset_name;BRANCH_ID;'

istr_dwo_related[1].s_main_obj_dwo_copy[4] =  istr_dwo[1].s_dwo_default // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[4] = 'BRANCH_ID;'  // cột copy từ
istr_dwo_related[1].s_related_obj_dwo_copy[4] = 'd_document_ar_grid' // datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[4] = 'BRANCH_ID;'  // cột copy đến
//istr_dwo_related[1].s_main_obj_column_chk[4] = 'object_code;include_tax_yn'
//istr_dwo_related[1].s_related_obj_column_chk[4] = 'invoice_object_code;include_tax_yn'

istr_dwo_related[1].s_main_obj_column_chk[4] = ''
istr_dwo_related[1].s_related_obj_column_chk[4] = ''
istr_dwo_related[1].s_match_f_dwo[4] = ''
istr_dwo_related[1].s_match_t_dwo[4] = '' 
istr_dwo_related[1].s_match_f_column[4] = ''
istr_dwo_related[1].s_match_t_column[4] = ''
istr_dwo_related[1].s_match_column[4] = ''
istr_dwo_related[1].s_main_obj_column_sum[4] = ''
istr_dwo_related[1].s_related_obj_column_sum[4] = ''
istr_dwo_related[1].s_f_obj_column_chk[4] = ''
istr_dwo_related[1].s_t_obj_column_chk[4] = ''
istr_dwo_related[1].b_f_sum[4] = false
istr_dwo_related[1].b_copy_line[4] = false
end subroutine

on cl_goods_delivery_all.create
call super::create
end on

on cl_goods_delivery_all.destroy
call super::destroy
end on

