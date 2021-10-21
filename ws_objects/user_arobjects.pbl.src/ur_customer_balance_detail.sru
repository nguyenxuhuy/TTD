$PBExportHeader$ur_customer_balance_detail.sru
forward
global type ur_customer_balance_detail from b_report
end type
end forward

global type ur_customer_balance_detail from b_report
end type
global ur_customer_balance_detail ur_customer_balance_detail

forward prototypes
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_related ()
end prototypes

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default = 'dr_customer_balance_detail_form'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = 'dr_customer_balance_detail_form'
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
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Báo cáo chi tiết công nợ khách hàng'
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

istr_dwo[2].s_dwo_default = 'dp_customer_balance_detail_form'
istr_dwo[2].s_dwo_form = 'dp_customer_balance_detail_form'
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

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_sal_invoice'					// đối tượng liên quan
istr_dwo_related[1].s_main_obj_dwo = 'dr_customer_balance_detail_form'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'document_code'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'd_document_ar_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'code'			// cột quan hệ đến
istr_dwo_related[1].s_relatedtext_column = 'document_code'					
istr_dwo_related[1].s_text = 'Hoá đơn bán'


istr_dwo_related[2].s_related_obj_name = 'u_gl_journal'					// đối tượng liên quan
istr_dwo_related[2].s_main_obj_dwo = 'dr_customer_balance_detail_form'		//datawindow quan hệ main
istr_dwo_related[2].s_main_obj_column = 'document_code'			// cột quan hệ của main
istr_dwo_related[2].s_related_obj_dwo = 'd_document_grid'	// datawindow quan hệ đến
istr_dwo_related[2].s_related_obj_column = 'code'			// cột quan hệ đến
istr_dwo_related[2].s_relatedtext_column = 'document_code'					
istr_dwo_related[2].s_text = 'Phiếu hạch toán tổng hợp'
end subroutine

on ur_customer_balance_detail.create
call super::create
end on

on ur_customer_balance_detail.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'CUSTOMER_BALANCE_TMP'
ib_changed_dwo_4edit = false
is_display_model = '1ddlb_2d_1tp'
ib_display_text = true
is_object_title = 'Báo cáo chi tiết công nợ khách hàng'

istr_actionpane[1].s_description = is_object_title

istr_report.s_dwo_report = 'dr_customer_balance_detail_form'
istr_report.s_pro_name = 'pkg_customer_balance_detail.pro_cus_bal_detail'
istr_report.sa_parm_name[1] = 'p_s_date'
istr_report.sa_parm_name[2] = 'p_e_date'
istr_report.sa_parm_name[3] = 'p_branch_code'
istr_report.sa_parm_name[4] = 'p_object_code'
istr_report.sa_parm_name[5] = 'p_mana_code'
istr_report.sa_parm_name[6] = 'p_account_code'
istr_report.sa_parm_name[7] = 'p_currency_type'
istr_report.sa_parm_name[8] = 'p_options'
istr_report.sa_parm_name[9] = 'gs_sob'
istr_report.sa_parm_name[10] = 'gi_user_id'
istr_report.sa_parm_value[10] = gi_userid
istr_report.b_multi_thread = false

end event

event e_window_e_postopen;call super::e_window_e_postopen;t_dw_mpl		ldw_parm
long				vl_row
string 			ls_currency_type,ls_options

ldw_parm = iw_display.f_get_dw(istr_dwo[2].s_dwo_default)
ls_currency_type = ldw_parm.getitemstring(ldw_parm.getrow(), 'p_currency_type')
if isnull(ls_currency_type) or ls_currency_type = '' then 
	ldw_parm.setitem(ldw_parm.getrow(), 'p_currency_type','BASE')
end if
ls_options = ldw_parm.getitemstring(ldw_parm.getrow(), 'p_options')
if isnull(ls_currency_type) or ls_currency_type = '' then 
	ldw_parm.setitem(ldw_parm.getrow(), 'p_options','TOTAL')
end if
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.dynamic f_set_ii_leftpart_width(3/4)
iw_display.dynamic f_set_ii_upperpart_height(1/7)
return 0
end event

event e_window_open;call super::e_window_open;t_dw_mpl	ldw_parm

ldw_parm= this.iw_display.f_get_dw( 'dp_customer_balance_detail_form')
this.iw_display.idw_focus = ldw_parm

return 0
end event

