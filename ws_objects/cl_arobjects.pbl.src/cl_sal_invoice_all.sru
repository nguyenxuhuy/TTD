$PBExportHeader$cl_sal_invoice_all.sru
forward
global type cl_sal_invoice_all from c_sal_invoice
end type
end forward

global type cl_sal_invoice_all from c_sal_invoice
end type
global cl_sal_invoice_all cl_sal_invoice_all

forward prototypes
public subroutine f_set_dwo_related ()
end prototypes

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_goods_delivery_all'					// đối tượng quan hệ đến
istr_dwo_related[1].s_main_obj_dwo = 'd_document_ar_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'd_document_inventory_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].b_t_matching = true
istr_dwo_related[1].s_relatedtext_column = 'doc_code'					
istr_dwo_related[1].s_text = 'Hóa đơn bán từ: '
istr_dwo_related[1].s_match_f_dwo[1] = 'd_inventory_line_delivery_grid'
istr_dwo_related[1].s_match_t_dwo[1] = 'd_sal_invoice_line_grid' 
istr_dwo_related[1].s_match_rf_dwo[1] = 'd_so_line_grid;d_inventory_line_delivery_grid'
istr_dwo_related[1].s_match_f_column[1] = 'qty'
istr_dwo_related[1].s_match_t_column[1] = 'act_qty'
istr_dwo_related[1].s_match_column[1] = 'qty'

istr_dwo_related[2].s_related_obj_name = 'b_view'					// đối tượng liên quan
istr_dwo_related[2].s_main_obj_dwo = 'd_document_ar_grid'		//datawindow quan hệ main
istr_dwo_related[2].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[2].s_related_obj_dwo = 'dv_sal_invoice_form'	// datawindow quan hệ đến
istr_dwo_related[2].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[2].s_relatedtext_column = 'code'					
istr_dwo_related[2].s_text = 'In hóa đơn bán hàng '

istr_dwo_related[3].s_related_obj_name = 'u_receipt_all'					// đối tượng liên quan
istr_dwo_related[3].s_main_obj_dwo = 'd_document_ar_grid'		//datawindow quan hệ main
istr_dwo_related[3].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[3].s_related_obj_dwo = 'd_document_ar_grid'	// datawindow quan hệ đến
istr_dwo_related[3].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[3].b_f_matching = true
istr_dwo_related[3].s_relatedtext_column = 'doc_code'					
istr_dwo_related[3].s_text = 'Phiếu thu từ:'

istr_dwo_related[3].s_main_obj_dwo_copy[1] = 'd_post_line_invoice_grid' // datawindow copy từ
istr_dwo_related[3].s_related_obj_dwo_copy[1] = 'd_payment_line_grid' // datawindow copy đến
istr_dwo_related[3].s_main_obj_column_copy[1] ='DR_OBJECT_ID;trans_amt;base_amt' // cột copy từ
istr_dwo_related[3].s_related_obj_column_copy[1] = 'OBJECT_ID;amount;base_amount'  // cột copy đến
istr_dwo_related[3].s_main_dr_cr_obj_dwo_sum[1]='d_invoice_sal_form' //dw chứa đối tượng công nợ
istr_dwo_related[3].s_main_dr_cr_obj_column_sum[1]='dr_cr_object' // cột chứa đối tượng công nợ
istr_dwo_related[3].s_main_obj_column_sum[1] = 'trans_amt;base_amt' // cột cộng tổng
istr_dwo_related[3].s_f_obj_column_chk[1] = 'DR_OBJECT_ID'
istr_dwo_related[3].s_t_obj_column_chk[1] = 'OBJECT_ID'
istr_dwo_related[3].s_main_obj_column_chk[1] = ''
istr_dwo_related[3].s_related_obj_column_chk[1] = ''
istr_dwo_related[3].b_f_sum[1] = true
istr_dwo_related[3].b_copy_line[1] = true
istr_dwo_related[3].s_match_f_dwo[1] = 'd_post_line_invoice_grid'
istr_dwo_related[3].s_match_t_dwo[1] = 'd_payment_line_grid'
istr_dwo_related[3].s_match_f_column[1] = 'trans_amt;base_amt'
istr_dwo_related[3].s_match_t_column[1] = 'amount;base_amount'
istr_dwo_related[3].s_match_column[1] = 'trans_value;base_value'

istr_dwo_related[3].s_main_obj_dwo_copy[2] = 'd_post_line_tax_grid' // datawindow copy từ
istr_dwo_related[3].s_related_obj_dwo_copy[2] = 'd_payment_line_grid' // datawindow copy đến
istr_dwo_related[3].s_main_obj_column_copy[2] = 'DR_OBJECT_ID;trans_amt;base_amt' // cột copy từ
istr_dwo_related[3].s_related_obj_column_copy[2] = 'OBJECT_ID;amount;base_amount'
istr_dwo_related[3].s_main_dr_cr_obj_dwo_sum[2]='d_invoice_sal_form' //dw chứa đối tượng công nợ
istr_dwo_related[3].s_main_dr_cr_obj_column_sum[2]='dr_cr_object' // cột chứa đối tượng công nợ
istr_dwo_related[3].s_main_obj_column_sum[2] = 'trans_amt;base_amt' // cột cộng tổng
istr_dwo_related[3].s_f_obj_column_chk[2] = 'DR_OBJECT_ID'
istr_dwo_related[3].s_t_obj_column_chk[2] = 'OBJECT_ID'
istr_dwo_related[3].s_main_obj_column_chk[2] = ''
istr_dwo_related[3].s_related_obj_column_chk[2] = ''
istr_dwo_related[3].b_f_sum[2] = true
istr_dwo_related[3].b_copy_line[2] = true
istr_dwo_related[3].s_match_f_dwo[2] = 'd_post_line_tax_grid'
istr_dwo_related[3].s_match_t_dwo[2] = 'd_payment_line_grid'
istr_dwo_related[3].s_match_f_column[2] = 'trans_amt;base_amt'
istr_dwo_related[3].s_match_t_column[2] = 'amount;base_amount'
istr_dwo_related[3].s_match_column[2] = 'trans_value;base_value'

istr_dwo_related[3].s_main_obj_dwo_copy[3] = 'd_invoice_sal_form' // datawindow copy từ
istr_dwo_related[3].s_main_obj_column_copy[3] ='dr_cr_object_type;dr_cr_object_code;dr_cr_object_name;' // cột copy từ
istr_dwo_related[3].s_related_obj_dwo_copy[3] = 'd_payment_line_grid' // datawindow copy đến
istr_dwo_related[3].s_related_obj_column_copy[3] = 'object_type;object_code;object_name'  // cột copy đến
istr_dwo_related[3].s_main_obj_column_chk[3] = 'dr_cr_object'
istr_dwo_related[3].s_related_obj_column_chk[3] = 'OBJECT_ID'
istr_dwo_related[3].b_copy_line[3] = true

istr_dwo_related[3].s_main_obj_dwo_copy[4] = 'd_invoice_sal_form' // datawindow copy từ
istr_dwo_related[3].s_main_obj_column_copy[4] ='currency_id;uom_code;exchange_rate;dr_cr_object;' // cột copy từ
istr_dwo_related[3].s_related_obj_dwo_copy[4] = 'd_receipt_form' // datawindow copy đến
istr_dwo_related[3].s_related_obj_column_copy[4] = 'currency_id;uom_code;exchange_rate;invoice_object'  // cột copy đến
istr_dwo_related[3].s_main_obj_column_chk[4] = ''
istr_dwo_related[3].s_related_obj_column_chk[4] = ''
istr_dwo_related[3].s_match_f_dwo[4] = ''
istr_dwo_related[3].s_match_t_dwo[4] = ''
istr_dwo_related[3].s_match_f_column[4] = ''
istr_dwo_related[3].s_match_t_column[4] = ''
istr_dwo_related[3].s_match_column[4] = ''
istr_dwo_related[3].s_main_obj_column_sum[4] = ''
istr_dwo_related[3].s_related_obj_column_sum[4] = ''
istr_dwo_related[3].s_f_obj_column_chk[4] = ''
istr_dwo_related[3].s_t_obj_column_chk[4] = ''
istr_dwo_related[3].b_f_sum[4] = false
istr_dwo_related[3].b_copy_line[4] = false

istr_dwo_related[4].s_related_obj_name = 'u_bank_voucher_all'					// đối tượng liên quan
istr_dwo_related[4].s_main_obj_dwo = 'd_document_ar_grid'		//datawindow quan hệ main
istr_dwo_related[4].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[4].s_related_obj_dwo = 'd_document_ar_grid'	// datawindow quan hệ đến
istr_dwo_related[4].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[4].b_f_matching = true
istr_dwo_related[4].s_relatedtext_column = 'doc_code'					
istr_dwo_related[4].s_text = 'Sổ phụ ngân hàng từ:'

istr_dwo_related[4].s_main_obj_dwo_copy[1] = 'd_post_line_invoice_grid' // datawindow copy từ
istr_dwo_related[4].s_related_obj_dwo_copy[1] = 'd_payment_line_grid' // datawindow copy đến
istr_dwo_related[4].s_main_obj_column_copy[1] ='DR_OBJECT_ID;trans_amt;base_amt' // cột copy từ
istr_dwo_related[4].s_related_obj_column_copy[1] = 'OBJECT_ID;amount;base_amount'  // cột copy đến
istr_dwo_related[4].s_main_dr_cr_obj_dwo_sum[1]='d_invoice_sal_form' //dw chứa đối tượng công nợ
istr_dwo_related[4].s_main_dr_cr_obj_column_sum[1]='dr_cr_object' // cột chứa đối tượng công nợ
istr_dwo_related[4].s_main_obj_column_sum[1] = 'trans_amt;base_amt' // cột cộng tổng
istr_dwo_related[4].s_f_obj_column_chk[1] = 'DR_OBJECT_ID'
istr_dwo_related[4].s_t_obj_column_chk[1] = 'OBJECT_ID'
istr_dwo_related[4].s_main_obj_column_chk[1] = ''
istr_dwo_related[4].s_related_obj_column_chk[1] = ''
istr_dwo_related[4].b_f_sum[1] = true
istr_dwo_related[4].b_copy_line[1] = true
istr_dwo_related[4].s_match_f_dwo[1] = 'd_post_line_invoice_grid'
istr_dwo_related[4].s_match_t_dwo[1] = 'd_payment_line_grid'
istr_dwo_related[4].s_match_f_column[1] = 'trans_amt;base_amt'
istr_dwo_related[4].s_match_t_column[1] = 'amount;base_amount'
istr_dwo_related[4].s_match_column[1] = 'trans_value;base_value'

istr_dwo_related[4].s_main_obj_dwo_copy[2] = 'd_post_line_tax_grid' // datawindow copy từ
istr_dwo_related[4].s_related_obj_dwo_copy[2] = 'd_payment_line_grid' // datawindow copy đến
istr_dwo_related[4].s_main_obj_column_copy[2] ='DR_OBJECT_ID;trans_amt;base_amt' // cột copy từ
istr_dwo_related[4].s_related_obj_column_copy[2] = 'OBJECT_ID;amount;base_amount'
istr_dwo_related[4].s_main_dr_cr_obj_dwo_sum[2]='d_invoice_sal_form' //dw chứa đối tượng công nợ
istr_dwo_related[4].s_main_dr_cr_obj_column_sum[2]='dr_cr_object' // cột chứa đối tượng công nợ
istr_dwo_related[4].s_main_obj_column_sum[2] = 'trans_amt;base_amt' // cột cộng tổng
istr_dwo_related[4].s_f_obj_column_chk[2] = 'DR_OBJECT_ID'
istr_dwo_related[4].s_t_obj_column_chk[2] = 'OBJECT_ID'
istr_dwo_related[4].s_main_obj_column_chk[2] = ''
istr_dwo_related[4].s_related_obj_column_chk[2] = ''
istr_dwo_related[4].b_f_sum[2] = true
istr_dwo_related[4].b_copy_line[2] = true
istr_dwo_related[4].s_match_f_dwo[2] = 'd_post_line_tax_grid'
istr_dwo_related[4].s_match_t_dwo[2] = 'd_payment_line_grid'
istr_dwo_related[4].s_match_f_column[2] = 'trans_amt;base_amt'
istr_dwo_related[4].s_match_t_column[2] = 'amount;base_amount'
istr_dwo_related[4].s_match_column[2] = 'trans_value;base_value'

istr_dwo_related[4].s_main_obj_dwo_copy[3] = 'd_invoice_sal_form' // datawindow copy từ
istr_dwo_related[4].s_main_obj_column_copy[3] ='dr_cr_object_type;dr_cr_object_code;dr_cr_object_name' // cột copy từ
istr_dwo_related[4].s_related_obj_dwo_copy[3] = 'd_payment_line_grid' // datawindow copy đến
istr_dwo_related[4].s_related_obj_column_copy[3] = 'object_type;object_code;object_name'  // cột copy đến
istr_dwo_related[4].s_main_obj_column_chk[3] = 'dr_cr_object'
istr_dwo_related[4].s_related_obj_column_chk[3] = 'OBJECT_ID'

istr_dwo_related[4].s_main_obj_dwo_copy[4] = 'd_invoice_sal_form' // datawindow copy từ
istr_dwo_related[4].s_main_obj_column_copy[4] ='currency_id;uom_code;exchange_rate;dr_cr_object' // cột copy từ
istr_dwo_related[4].s_related_obj_dwo_copy[4] = 'd_bank_voucher_form' // datawindow copy đến
istr_dwo_related[4].s_related_obj_column_copy[4] = 'currency_id;uom_code;exchange_rate;invoice_object'  // cột copy đến
istr_dwo_related[4].s_main_obj_column_chk[4] = ''
istr_dwo_related[4].s_related_obj_column_chk[4] = ''
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
end subroutine

on cl_sal_invoice_all.create
call super::create
end on

on cl_sal_invoice_all.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = true
is_display_model = '2dgb_1tp_tax'
ib_display_text = false
if not this.idwsetup_initial.f_is_branch_yn( istr_dwo[1].s_dwo_default) then
	is_object_title = 'Hóa đơn bán tổng hợp'
else
	is_object_title = 'Hóa đơn bán'
end if
is_exrate_type = 'buy'
istr_actionpane[1].s_button_name = 'b_add_multi;b_copyt_multi;b_join_multi;b_insert;b_modify;b_save; b_saveclose;b_delete;b_view_sal_invoice;b_view_invoice_goods_delivery;b_post;b_unpost;b_send_2_approve;b_request_2_change;b_total;b_approve;b_reject;b_account_view;b_cancel;b_importfile;'
istr_actionpane[1].s_button_has_sub = 'b_add_multi;b_copyt_multi;b_join_multi;'
istr_actionpane[1].sa_sub_button[1]='b_add;b_copyf_so;b_copyf_goods_delivery_all;b_copyf_goods_transfer;b_copyt_seft;'
istr_actionpane[1].sa_sub_button[2]='b_copyt_sal_invoice_replace;b_copyt_bank_voucher;b_copyt_receipt;b_copyt_sal_invoice_return;'
istr_actionpane[1].sa_sub_button[3]='b_copyl_so;b_copyl_goods_delivery;b_copyl_goods_transfer;'
istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_description = is_object_title

this.is_m_popup = 'm_spec_identified_cogs'


end event

event e_window_e_copy_form;double				ldb_trans_id
c_string				lc_string
u_choose_trans	lpo_choose_trans


lpo_choose_trans = create u_choose_trans
lpo_choose_trans.is_object_type = lc_string.f_globalreplace( 'u_sal_invoice' , 'u_', '')
openwithparm( s_wr_multi, lpo_choose_trans)
// lấy trans_id trả về
ldb_trans_id = message.doubleparm
if ldb_trans_id > 0 then
	setnull(message.doubleparm)
	this.f_set_idb_trans_id( ldb_trans_id)
	return 1
else
	return 0
end if
end event

