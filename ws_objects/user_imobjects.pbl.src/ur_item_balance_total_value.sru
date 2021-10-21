$PBExportHeader$ur_item_balance_total_value.sru
forward
global type ur_item_balance_total_value from b_report
end type
end forward

global type ur_item_balance_total_value from b_report
end type
global ur_item_balance_total_value ur_item_balance_total_value

forward prototypes
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_dwo_window ()
end prototypes

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'dr_item_balance_total_value_form'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = 'dr_item_balance_total_value_form'
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
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Báo cáo xuất nhập tồn giá trị tổng hợp'
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

istr_dwo[2].s_dwo_default =  'dp_item_balance_total_value_form'
istr_dwo[2].s_dwo_form = 'dp_item_balance_total_value_form'
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

on ur_item_balance_total_value.create
call super::create
end on

on ur_item_balance_total_value.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'ITEM'
ib_changed_dwo_4edit = false
is_display_model = '1ddlb_2d_1tp'
ib_display_text = true
is_object_title = 'Báo cáo xuất nhập tồn giá trị tổng hợp'

istr_actionpane[1].s_description = is_object_title
/*******************************************************************************
Thứ tự của các parm[1]..[n]: phải trùng với thứ tự các parm truyền vào trong procedure trong Oracle
---------------------------------------------------------------------------------------------------------------------------*/
istr_report.s_dwo_report = 'dr_item_balance_total_value_form'
istr_report.s_pro_name = 'pkg_item_balance_value.pro_insert_item_bal_total_val'
istr_report.sa_parm_name[1] = 'p_s_date'
istr_report.sa_parm_name[2] = 'p_e_date'
istr_report.sa_parm_name[3] = 'P_BRANCH_OPT'
istr_report.sa_parm_name[4] = 'P_BRANCH_ID'
istr_report.sa_parm_name[5] = 'P_WH_OPT'
istr_report.sa_parm_name[6] = 'P_WH_CODE'
istr_report.sa_parm_name[7] = 'P_VALUESET_CODE'
istr_report.sa_parm_name[8] = 'P_ITEM_CODE'
istr_report.sa_parm_name[9] = 'gs_sob'
istr_report.sa_parm_name[10] = 'gi_user_id'
istr_report.sa_parm_value[10] = gi_userid
istr_report.b_multi_thread = false

end event

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.f_set_ii_leftpart_width(3/4)
iw_display.f_set_ii_upperpart_height(1/8)
iw_display.f_set_ii_midpart_width(1/8)
return 0
end event

