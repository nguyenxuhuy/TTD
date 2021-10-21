$PBExportHeader$ur_trial_balance.sru
forward
global type ur_trial_balance from b_report
end type
end forward

global type ur_trial_balance from b_report
end type
global ur_trial_balance ur_trial_balance

forward prototypes
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_related ()
end prototypes

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default = 'dr_trial_balance_form'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = 'dr_trial_balance_form'
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

istr_dwo[2].s_dwo_default = 'dp_trial_balance_form'
istr_dwo[2].s_dwo_form = 'dp_trial_balance_form'
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

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'ur_account_book_detail'					// đối tượng liên quan
istr_dwo_related[1].s_main_obj_dwo = 'dr_trial_balance_form'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'code'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'dp_account_book_detai_form'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'p_acc_code'			// cột quan hệ đến
istr_dwo_related[1].s_relatedtext_column = 'code'					
istr_dwo_related[1].s_text = 'Báo cáo chi tiết'
//-- set cho drilldown report--//
istr_dwo_related[1].s_main_obj_dwo_copy[1] = 'dp_trial_balance_form' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[1] ='p_s_date;p_e_date;p_f_account;'
istr_dwo_related[1].s_related_obj_dwo_copy[1] = 'dp_account_book_detail_form' 
istr_dwo_related[1].s_related_obj_column_copy[1]='p_s_date;p_e_date;p_acc_code;'
end subroutine

on ur_trial_balance.create
call super::create
end on

on ur_trial_balance.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'OBJECT_BALANCE'
ib_changed_dwo_4edit = false
is_display_model = '1ddlb_2d_1tp'
ib_display_text = true
is_object_title = 'Bảng cân đối số phát sinh'

istr_actionpane[1].s_description = is_object_title

istr_report.s_dwo_report = 'dr_trial_balance_form'
istr_report.s_pro_name = 'pkg_trial_balance.pro_insert_trial_balance'
istr_report.sa_parm_name[1] = 'p_s_date'
istr_report.sa_parm_name[2] = 'p_e_date'
istr_report.sa_parm_name[3] = 'p_branch_opt'
istr_report.sa_parm_name[4] = 'p_branch_id'
istr_report.sa_parm_name[5] = 'p_f_account'
istr_report.sa_parm_name[6] = 'p_t_account'
istr_report.sa_parm_name[7] = 'gi_user_id'
istr_report.sa_parm_name[8] = 'gs_sob'
istr_report.b_multi_thread = false

end event

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.dynamic f_set_ii_leftpart_width(3800)
iw_display.dynamic f_set_ii_upperpart_height(300)
return 0
end event

