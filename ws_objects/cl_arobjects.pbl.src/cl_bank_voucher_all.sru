$PBExportHeader$cl_bank_voucher_all.sru
forward
global type cl_bank_voucher_all from c_bank_voucher
end type
end forward

global type cl_bank_voucher_all from c_bank_voucher
end type
global cl_bank_voucher_all cl_bank_voucher_all

forward prototypes
public subroutine f_set_dwo_related ()
end prototypes

public subroutine f_set_dwo_related ();// Đối tượng liên quan
istr_dwo_related[1].s_related_obj_name = 'u_sal_invoice_all'					// đối tượng liên quan
istr_dwo_related[1].s_main_obj_dwo = 'd_document_ar_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'd_document_ar_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].b_t_matching = true
istr_dwo_related[1].s_relatedtext_column = 'doc_code'					
istr_dwo_related[1].s_text = 'Hóa đơn bán từ:'
istr_dwo_related[1].b_f_sum[1] = true
istr_dwo_related[1].s_main_obj_column_sum[1] = 'trans_amt;base_amt'
istr_dwo_related[1].s_match_f_dwo[1] = 'd_post_line_invoice_grid'
istr_dwo_related[1].s_match_t_dwo[1] = 'd_payment_line_grid'
istr_dwo_related[1].s_match_f_column[1] ='trans_amt;base_amt'
istr_dwo_related[1].s_match_t_column[1] = 'amount;base_amount'
istr_dwo_related[1].s_match_column[1] = 'trans_value;base_value'
end subroutine

on cl_bank_voucher_all.create
call super::create
end on

on cl_bank_voucher_all.destroy
call super::destroy
end on

