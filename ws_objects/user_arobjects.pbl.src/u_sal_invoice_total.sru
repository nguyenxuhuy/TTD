$PBExportHeader$u_sal_invoice_total.sru
forward
global type u_sal_invoice_total from b_copy
end type
end forward

global type u_sal_invoice_total from b_copy
end type
global u_sal_invoice_total u_sal_invoice_total

forward prototypes
public subroutine f_set_dwo_related ()
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_window_copy ()
end prototypes

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_receipt'					// đối tượng liên quan
istr_dwo_related[1].s_main_obj_dwo = 'd_document_ar_total_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'd_document_ar_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].b_f_matching = true
istr_dwo_related[1].s_relatedtext_column = 'doc_code'					
istr_dwo_related[1].s_text = 'Phiếu thu từ:'
////////////////////////////////////////
istr_dwo_related[1].s_main_obj_dwo_copy[1] = 'd_post_line_invoice_grid' // datawindow copy từ
istr_dwo_related[1].s_related_obj_dwo_copy[1] = 'd_payment_line_grid' // datawindow copy đến
istr_dwo_related[1].s_main_obj_column_copy[1] ='DR_OBJECT_ID;trans_amt;base_amt' // cột copy từ
istr_dwo_related[1].s_related_obj_column_copy[1] = 'OBJECT_ID;amount;base_amount'  // cột copy đến
istr_dwo_related[1].s_main_dr_cr_obj_dwo_sum[1]='d_invoice_sal_form' //dw chứa đối tượng công nợ
istr_dwo_related[1].s_main_dr_cr_obj_column_sum[1]='dr_cr_object' // cột chứa đối tượng công nợ
istr_dwo_related[1].s_main_obj_column_sum[1] = 'trans_amt;base_amt' // cột cộng tổng
istr_dwo_related[1].s_f_obj_column_chk[1] = 'DR_OBJECT_ID'
istr_dwo_related[1].s_t_obj_column_chk[1] = 'OBJECT_ID'
istr_dwo_related[1].s_main_obj_column_chk[1] = ''
istr_dwo_related[1].s_related_obj_column_chk[1] = ''
istr_dwo_related[1].b_f_sum[1] = true
istr_dwo_related[1].b_copy_line[1] = true
istr_dwo_related[1].s_match_f_dwo[1] = 'd_post_line_invoice_grid'
istr_dwo_related[1].s_match_t_dwo[1] = 'd_payment_line_grid'
istr_dwo_related[1].s_match_f_column[1] = 'trans_amt;base_amt'
istr_dwo_related[1].s_match_t_column[1] = 'amount;base_amount'
istr_dwo_related[1].s_match_column[1] = 'trans_value;base_value'

istr_dwo_related[1].s_main_obj_dwo_copy[2] = 'd_post_line_tax_grid' // datawindow copy từ
istr_dwo_related[1].s_related_obj_dwo_copy[2] = 'd_payment_line_grid' // datawindow copy đến
istr_dwo_related[1].s_main_obj_column_copy[2] = 'DR_OBJECT_ID;trans_amt;base_amt' // cột copy từ
istr_dwo_related[1].s_related_obj_column_copy[2] = 'OBJECT_ID;amount;base_amount'
istr_dwo_related[1].s_main_dr_cr_obj_dwo_sum[2]='d_invoice_sal_form' //dw chứa đối tượng công nợ
istr_dwo_related[1].s_main_dr_cr_obj_column_sum[2]='dr_cr_object' // cột chứa đối tượng công nợ
istr_dwo_related[1].s_main_obj_column_sum[2] = 'trans_amt;base_amt' // cột cộng tổng
istr_dwo_related[1].s_f_obj_column_chk[2] = 'DR_OBJECT_ID'
istr_dwo_related[1].s_t_obj_column_chk[2] = 'OBJECT_ID'
istr_dwo_related[1].s_main_obj_column_chk[2] = ''
istr_dwo_related[1].s_related_obj_column_chk[2] = ''
istr_dwo_related[1].b_f_sum[2] = true
istr_dwo_related[1].b_copy_line[2] = true
istr_dwo_related[1].s_match_f_dwo[2] = 'd_post_line_tax_grid'
istr_dwo_related[1].s_match_t_dwo[2] = 'd_payment_line_grid'
istr_dwo_related[1].s_match_f_column[2] = 'trans_amt;base_amt'
istr_dwo_related[1].s_match_t_column[2] = 'amount;base_amount'
istr_dwo_related[1].s_match_column[2] = 'trans_value;base_value'

istr_dwo_related[1].s_main_obj_dwo_copy[3] = 'd_invoice_sal_form' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[3] ='dr_cr_object_type;dr_cr_object_code;dr_cr_object_name;' // cột copy từ
istr_dwo_related[1].s_related_obj_dwo_copy[3] = 'd_payment_line_grid' // datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[3] = 'object_type;object_code;object_name'  // cột copy đến
istr_dwo_related[1].s_main_obj_column_chk[3] = 'dr_cr_object'
istr_dwo_related[1].s_related_obj_column_chk[3] = 'OBJECT_ID'

istr_dwo_related[1].s_main_obj_dwo_copy[4] = 'd_invoice_sal_form' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[4] ='currency_id;uom_code;exchange_rate;dr_cr_object;' // cột copy từ
istr_dwo_related[1].s_related_obj_dwo_copy[4] = 'd_receipt_form' // datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[4] = 'currency_id;uom_code;exchange_rate;invoice_object'  // cột copy đến
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
/////////////////////////////////////////

//istr_dwo_related[1].s_main_obj_dwo_copy[1] = 'd_document_ar_total_grid' // datawindow copy từ
//istr_dwo_related[1].s_main_obj_column_copy[1] ='currency_id;uom_code;exchange_rate;dr_cr_object;' // cột copy từ
//istr_dwo_related[1].s_related_obj_dwo_copy[1] = 'd_receipt_form' // datawindow copy đến
//istr_dwo_related[1].s_related_obj_column_copy[1] = 'currency_id;uom_code;exchange_rate;invoice_object'  // cột copy đến
//istr_dwo_related[1].s_main_obj_column_chk[1] = ''
//istr_dwo_related[1].s_related_obj_column_chk[1] = ''
//istr_dwo_related[1].s_match_f_dwo[1] = ''
//istr_dwo_related[1].s_match_t_dwo[1] = ''
//istr_dwo_related[1].s_match_f_column[1] = ''
//istr_dwo_related[1].s_match_t_column[1] = ''
//istr_dwo_related[1].s_match_column[1] = ''
//istr_dwo_related[1].s_main_obj_column_sum[1] = ''
//istr_dwo_related[1].s_related_obj_column_sum[1] = ''
//istr_dwo_related[1].s_f_obj_column_chk[1] = ''
//istr_dwo_related[1].s_t_obj_column_chk[1] = ''
//istr_dwo_related[1].b_f_sum[1] = false
//istr_dwo_related[1].b_copy_line[1] = false

end subroutine

public subroutine f_set_dwo_window ();s_str_dwo lstr_dwo[]

istr_dwo = lstr_dwo

istr_dwo[1].s_dwo_default =  'd_document_ar_total_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_document_ar_total_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_invoice_sal_form;' 
istr_dwo[1].b_ref_table_yn  = true
istr_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;DOC_TYPE;VERSION_ID;'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_gb_name = 'gb_6'
istr_dwo[1].s_description = 'Hóa đơn bán tổng'

end subroutine

public subroutine f_set_dwo_window_copy ();istr_dwo[1].s_dwo_default =  'd_document_ar_total_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_document_ar_total_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_invoice_sal_form;' 
istr_dwo[1].b_ref_table_yn  = true
istr_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;DOC_TYPE;VERSION_ID;'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_gb_name = 'gb_6'
istr_dwo[1].s_description = 'Hóa đơn bán tổng'

istr_dwo[2].s_dwo_default =  'd_invoice_sal_form'
istr_dwo[2].s_dwo_form = 'd_invoice_sal_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = true
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_details = 'd_sal_invoice_line_grid;'
istr_dwo[2].s_dwo_master = 'd_document_ar_total_grid;'
istr_dwo[2].s_dwo_shared = 'd_sal_tax_desc_form;'
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
istr_dwo[2].s_description = 'Công nợ'
istr_dwo[2].s_gb_name = 'gb_7'
istr_dwo[2].s_description = 'Thông tin đối tượng công nợ'

istr_dwo[3].s_dwo_default =  'd_sal_tax_desc_form'
istr_dwo[3].s_dwo_form = 'd_sal_tax_desc_form'
istr_dwo[3].s_dwo_grid = ''
istr_dwo[3].b_shared = true
istr_dwo[3].s_dwo_master = 'd_invoice_sal_form;'
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

istr_dwo[4].s_dwo_default =  'd_sal_invoice_line_grid'
istr_dwo[4].s_dwo_form = 'd_sal_invoice_line_form'
istr_dwo[4].s_dwo_grid = 'd_sal_invoice_line_grid'
istr_dwo[4].s_popmenu_items = 'm_spec_identified_cogs'
istr_dwo[4].b_master = true
istr_dwo[4].b_detail = true
istr_dwo[4].b_cascade_del = true
istr_dwo[4].s_dwo_master = 'd_invoice_sal_form;'
istr_dwo[4].s_dwo_details = 'd_post_line_invoice_grid;d_charge_line_grid;d_tax_line_grid;'
istr_dwo[4].s_dwo_shared = ''
istr_dwo[4].s_master_keycol = 'ID;'
istr_dwo[4].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[4].b_ref_table_yn  = false
istr_dwo[4].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[4].b_insert = true
istr_dwo[4].b_update = true
istr_dwo[4].b_delete = true
istr_dwo[4].b_query = true
istr_dwo[4].b_print = true
istr_dwo[4].b_excel = true
istr_dwo[4].b_keyboardlocked = true
istr_dwo[4].b_traceable = true
istr_dwo[4].s_description ='Chi tiết hóa đơn'

istr_dwo[5].s_dwo_default =  'd_post_line_invoice_grid'
istr_dwo[5].s_dwo_form = ''
istr_dwo[5].s_dwo_grid = 'd_post_line_invoice_grid'
istr_dwo[5].b_master = false
istr_dwo[5].b_detail = true
istr_dwo[5].b_cascade_del = true
istr_dwo[5].s_dwo_master = 'd_sal_invoice_line_grid;'
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
istr_dwo[5].b_keyboardlocked = true
istr_dwo[5].b_traceable = true
istr_dwo[5].s_description ='Định khoản hóa đơn bán'

istr_dwo[6].s_dwo_default =  'd_charge_line_grid'
istr_dwo[6].s_dwo_form = 'd_charge_line_form'
istr_dwo[6].s_dwo_grid = 'd_charge_line_grid'
istr_dwo[6].b_master = true
istr_dwo[6].b_detail = true
istr_dwo[6].b_cascade_del = true
istr_dwo[6].s_dwo_master = 'd_sal_invoice_line_grid;'
istr_dwo[6].s_dwo_details = 'd_post_line_charge_grid;'
istr_dwo[6].s_dwo_shared = ''
istr_dwo[6].s_master_keycol = 'ID;'
istr_dwo[6].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[6].b_ref_table_yn  = false
istr_dwo[6].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[6].b_insert = true
istr_dwo[6].b_update = true
istr_dwo[6].b_delete = true
istr_dwo[6].b_query = true
istr_dwo[6].b_print = true
istr_dwo[6].b_excel = true
istr_dwo[6].b_keyboardlocked = true
istr_dwo[6].b_traceable = true
istr_dwo[6].s_description ='Chi phí'

istr_dwo[7].s_dwo_default =  'd_post_line_charge_grid'
istr_dwo[7].s_dwo_form = ''
istr_dwo[7].s_dwo_grid = 'd_post_line_charge_grid'
istr_dwo[7].b_master = false
istr_dwo[7].b_detail = true
istr_dwo[7].b_cascade_del = true
istr_dwo[7].s_dwo_master = 'd_charge_line_grid;'
istr_dwo[7].s_dwo_details = ''
istr_dwo[7].s_dwo_shared = ''
istr_dwo[7].s_master_keycol = 'ID;'
istr_dwo[7].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[7].b_ref_table_yn  = false
istr_dwo[7].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[7].b_insert = false
istr_dwo[7].b_update = true
istr_dwo[7].b_delete = true
istr_dwo[7].b_query = true
istr_dwo[7].b_print = true
istr_dwo[7].b_excel = true
istr_dwo[7].b_keyboardlocked = true
istr_dwo[7].b_traceable = true
istr_dwo[7].s_description ='Định khoản chi phí'

istr_dwo[8].s_dwo_default =  'd_tax_line_grid'
istr_dwo[8].s_dwo_form = ''
istr_dwo[8].s_dwo_grid = 'd_tax_line_grid'
istr_dwo[8].b_master = true
istr_dwo[8].b_detail = true
istr_dwo[8].b_cascade_del = true
istr_dwo[8].s_dwo_master = 'd_sal_invoice_line_grid;'
istr_dwo[8].s_dwo_details = 'd_post_line_tax_grid;'
istr_dwo[8].s_dwo_shared = ''
istr_dwo[8].s_master_keycol = 'ID;'
istr_dwo[8].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[8].b_ref_table_yn  = false
istr_dwo[8].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[8].b_insert = true
istr_dwo[8].b_update = true
istr_dwo[8].b_delete = true
istr_dwo[8].b_query = true
istr_dwo[8].b_print = true
istr_dwo[8].b_excel = true
istr_dwo[8].b_keyboardlocked = true
istr_dwo[8].b_traceable = true
istr_dwo[8].s_description ='Thuế'

istr_dwo[9].s_dwo_default =  'd_post_line_tax_grid'
istr_dwo[9].s_dwo_form = ''
istr_dwo[9].s_dwo_grid = 'd_post_line_tax_grid'
istr_dwo[9].b_master = false
istr_dwo[9].b_detail = true
istr_dwo[9].b_cascade_del = true
istr_dwo[9].s_dwo_master = 'd_tax_line_grid;'
istr_dwo[9].s_dwo_details = ''
istr_dwo[9].s_dwo_shared = ''
istr_dwo[9].s_master_keycol = 'ID;'
istr_dwo[9].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[9].b_ref_table_yn  = false
istr_dwo[9].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[9].b_insert = false
istr_dwo[9].b_update = true
istr_dwo[9].b_delete = true
istr_dwo[9].b_query = true
istr_dwo[9].b_print = true
istr_dwo[9].b_excel = true
istr_dwo[9].b_keyboardlocked = true
istr_dwo[9].b_traceable = true
istr_dwo[9].s_description ='Định khoản thuế'

end subroutine

on u_sal_invoice_total.create
call super::create
end on

on u_sal_invoice_total.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_display_text = false

is_object_title = 'Hóa đơn bán tổng'
istr_actionpane[1].s_description = is_object_title
end event

event e_window_e_postopen_child;call super::e_window_e_postopen_child;t_ds_db_ws		lds_post
string				ls_null
any				laa_data[]

setnull(ls_null)
laa_data[1] = '(broker;revenue;tax_return;tax)'
lds_post = this.f_get_ds( 'd_post_line_invoice_grid')
lds_post.f_add_where('POST_TYPE;',laa_data[])
lds_post.is_originalwhereClause = ls_null
lds_post = this.f_get_ds( 'd_post_line_charge_grid')
lds_post.f_add_where('POST_TYPE;',laa_data[])
lds_post.is_originalwhereClause = ls_null
lds_post = this.f_get_ds( 'd_post_line_tax_grid')
lds_post.f_add_where('POST_TYPE;',laa_data[])
lds_post.is_originalwhereClause = ls_null
return 1
end event

