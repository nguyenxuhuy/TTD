$PBExportHeader$ur_account_book_detail.sru
forward
global type ur_account_book_detail from b_report
end type
end forward

global type ur_account_book_detail from b_report
end type
global ur_account_book_detail ur_account_book_detail

forward prototypes
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_related ()
end prototypes

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default = 'dr_account_book_detail_form'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = 'dr_account_book_detail_form'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = ''
iastr_dwo_tabpage[1].str_dwo[1].b_master = false
iastr_dwo_tabpage[1].str_dwo[1].b_detail = false
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = false
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol = ''
iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol = ''
iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[1].s_pic_ref_table = 'legal_entity'
iastr_dwo_tabpage[1].str_dwo[1].s_pic_ref_field = 'id'
iastr_dwo_tabpage[1].str_dwo[1].s_pic_ref_colname = 'logo'
iastr_dwo_tabpage[1].str_dwo[1].b_insert = false
iastr_dwo_tabpage[1].str_dwo[1].b_update = false
iastr_dwo_tabpage[1].str_dwo[1].b_delete = false
iastr_dwo_tabpage[1].str_dwo[1].b_query = true
iastr_dwo_tabpage[1].str_dwo[1].b_print = true
iastr_dwo_tabpage[1].str_dwo[1].b_excel = true
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Sổ chi tiết tài khoản'
iastr_dwo_tabpage[1].str_dwo[1].s_gb_name = ''
end subroutine

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_report_parm_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_report_parm_grid'
istr_dwo[1].b_master = false
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = false
istr_dwo[1].b_excel = false
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].b_traceable = true
istr_dwo[1].s_description = 'Xem báo cáo theo điều kiện: '

istr_dwo[2].s_dwo_default = 'dp_account_book_detail_form'
istr_dwo[2].s_dwo_form = 'dp_account_book_detail_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = false
istr_dwo[2].b_insert = false
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = false
istr_dwo[2].b_query = true
istr_dwo[2].b_print = false
istr_dwo[2].b_excel = false
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = false
istr_dwo[2].s_description = 'Tham số của báo cáo: '
end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_payment'					// đối tượng liên quan
istr_dwo_related[1].s_main_obj_dwo = 'dr_account_book_detail_form'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'doc_code'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'd_document_ap_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'code'			// cột quan hệ đến
istr_dwo_related[1].s_relatedtext_column = 'doc_code'					
istr_dwo_related[1].s_text = 'Phiếu chi'


istr_dwo_related[2].s_related_obj_name = 'u_receipt'					// đối tượng liên quan
istr_dwo_related[2].s_main_obj_dwo = 'dr_account_book_detail_form'		//datawindow quan hệ main
istr_dwo_related[2].s_main_obj_column = 'doc_code'			// cột quan hệ của main
istr_dwo_related[2].s_related_obj_dwo = 'd_document_ar_grid'	// datawindow quan hệ đến
istr_dwo_related[2].s_related_obj_column = 'code'			// cột quan hệ đến
istr_dwo_related[2].s_relatedtext_column = 'doc_code'					
istr_dwo_related[2].s_text = 'Phiếu thu'


istr_dwo_related[3].s_related_obj_name = 'u_bank_voucher'					// đối tượng liên quan
istr_dwo_related[3].s_main_obj_dwo = 'dr_account_book_detail_form'		//datawindow quan hệ main
istr_dwo_related[3].s_main_obj_column = 'doc_code'			// cột quan hệ của main
istr_dwo_related[3].s_related_obj_dwo = 'd_document_ar_grid'	// datawindow quan hệ đến
istr_dwo_related[3].s_related_obj_column = 'code'			// cột quan hệ đến
istr_dwo_related[3].s_relatedtext_column = 'doc_code'					
istr_dwo_related[3].s_text = 'Sổ phụ ngân hàng thu'


istr_dwo_related[4].s_related_obj_name = 'u_bank_voucher_payment'					// đối tượng liên quan
istr_dwo_related[4].s_main_obj_dwo = 'dr_account_book_detail_form'		//datawindow quan hệ main
istr_dwo_related[4].s_main_obj_column = 'doc_code'			// cột quan hệ của main
istr_dwo_related[4].s_related_obj_dwo = 'd_document_ap_grid'	// datawindow quan hệ đến
istr_dwo_related[4].s_related_obj_column = 'code'			// cột quan hệ đến
istr_dwo_related[4].s_relatedtext_column = 'doc_code'					
istr_dwo_related[4].s_text = 'Sổ phụ ngân hàng chi'

istr_dwo_related[5].s_related_obj_name = 'u_gl_journal'					// đối tượng liên quan
istr_dwo_related[5].s_main_obj_dwo = 'dr_account_book_detail_form'		//datawindow quan hệ main
istr_dwo_related[5].s_main_obj_column = 'doc_code'			// cột quan hệ của main
istr_dwo_related[5].s_related_obj_dwo = 'd_document_grid'	// datawindow quan hệ đến
istr_dwo_related[5].s_related_obj_column = 'code'			// cột quan hệ đến
istr_dwo_related[5].s_relatedtext_column = 'doc_code'					
istr_dwo_related[5].s_text = 'Phiếu hạch toán tổng hợp'

istr_dwo_related[6].s_related_obj_name = 'u_goods_deivery_misc'					// đối tượng liên quan
istr_dwo_related[6].s_main_obj_dwo = 'dr_account_book_detail_form'		//datawindow quan hệ main
istr_dwo_related[6].s_main_obj_column = 'doc_code'			// cột quan hệ của main
istr_dwo_related[6].s_related_obj_dwo = 'd_document_grid'	// datawindow quan hệ đến
istr_dwo_related[6].s_related_obj_column = 'code'			// cột quan hệ đến
istr_dwo_related[6].s_relatedtext_column = 'doc_code'					
istr_dwo_related[6].s_text = 'Phiếu xuất kho khác'

istr_dwo_related[7].s_related_obj_name = 'u_goods_receipt_misc'					// đối tượng liên quan
istr_dwo_related[7].s_main_obj_dwo = 'dr_account_book_detail_form'		//datawindow quan hệ main
istr_dwo_related[7].s_main_obj_column = 'doc_code'			// cột quan hệ của main
istr_dwo_related[7].s_related_obj_dwo = 'd_document_grid'	// datawindow quan hệ đến
istr_dwo_related[7].s_related_obj_column = 'code'			// cột quan hệ đến
istr_dwo_related[7].s_relatedtext_column = 'doc_code'					
istr_dwo_related[7].s_text = 'Phiếu nhập kho khác'


istr_dwo_related[8].s_related_obj_name = 'u_counting'					// đối tượng liên quan
istr_dwo_related[8].s_main_obj_dwo = 'dr_account_book_detail_form'		//datawindow quan hệ main
istr_dwo_related[8].s_main_obj_column = 'doc_code'			// cột quan hệ của main
istr_dwo_related[8].s_related_obj_dwo = 'd_document_counting_grid'	// datawindow quan hệ đến
istr_dwo_related[8].s_related_obj_column = 'code'			// cột quan hệ đến
istr_dwo_related[8].s_relatedtext_column = 'doc_code'					
istr_dwo_related[8].s_text = 'Phiếu nhập kho khác'


istr_dwo_related[9].s_related_obj_name = 'u_pur_invoice'					// đối tượng liên quan
istr_dwo_related[9].s_main_obj_dwo = 'dr_account_book_detail_form'		//datawindow quan hệ main
istr_dwo_related[9].s_main_obj_column = 'doc_code'			// cột quan hệ của main
istr_dwo_related[9].s_related_obj_dwo = 'd_document_ap_grid'	// datawindow quan hệ đến
istr_dwo_related[9].s_related_obj_column = 'code'			// cột quan hệ đến
istr_dwo_related[9].s_relatedtext_column = 'doc_code'					
istr_dwo_related[9].s_text = 'Hoá đơn mua'


istr_dwo_related[10].s_related_obj_name = 'u_sal_invoice'					// đối tượng liên quan
istr_dwo_related[10].s_main_obj_dwo = 'dr_account_book_detail_form'		//datawindow quan hệ main
istr_dwo_related[10].s_main_obj_column = 'doc_code'			// cột quan hệ của main
istr_dwo_related[10].s_related_obj_dwo = 'd_document_ar_grid'	// datawindow quan hệ đến
istr_dwo_related[10].s_related_obj_column = 'code'			// cột quan hệ đến
istr_dwo_related[10].s_relatedtext_column = 'doc_code'					
istr_dwo_related[10].s_text = 'Hoá đơn bán'


end subroutine

on ur_account_book_detail.create
call super::create
end on

on ur_account_book_detail.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'LEDGER_TRANS'
ib_changed_dwo_4edit = false
is_display_model = '1ddlb_2d_1tp'
ib_display_text = true
is_object_title = 'Sổ chi tiết tài khoản'

istr_actionpane[1].s_description = is_object_title

istr_report.s_dwo_report = 'dr_account_book_detail_form'
istr_report.s_pro_name = 'pkg_account_book.pro_insert_account_book_detail'
istr_report.sa_parm_name[1] = 'p_s_date'
istr_report.sa_parm_name[2] = 'p_e_date'
istr_report.sa_parm_name[3] = 'p_branch_opt'
istr_report.sa_parm_name[4] = 'p_branch_id'
istr_report.sa_parm_name[5] = 'p_acc_code'
istr_report.sa_parm_name[6] = 'p_corr_code'
istr_report.sa_parm_name[7] = 'gi_user_id'
istr_report.sa_parm_name[8] = 'gs_sob'

istr_report.b_multi_thread = false

///////////////////////////////////////////////////////////////////////////////////////////////////////
//-- LƯU Ý:
//-- Thứ tự tham số [1].. [n]: phải theo đúng thứ tự tham số trong procedure ở oralce--//
/////////////////////////////////////////////////////////////////////////////////////////////////////

end event

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.dynamic f_set_ii_leftpart_width(3800)
iw_display.dynamic f_set_ii_upperpart_height(300)
return 0
end event

event e_window_open;call super::e_window_open;t_dw_mpl	ldw_parm

ldw_parm= this.iw_display.f_get_dw( 'dp_account_book_detail_form')
this.iw_display.idw_focus = ldw_parm

return 0
end event

