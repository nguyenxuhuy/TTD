$PBExportHeader$ur_customer_aging_balance.sru
forward
global type ur_customer_aging_balance from b_report
end type
end forward

global type ur_customer_aging_balance from b_report
end type
global ur_customer_aging_balance ur_customer_aging_balance

forward prototypes
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_dwo_window ()
end prototypes

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default = 'dr_customer_aging_balance_form'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = 'dr_customer_aging_balance_form'
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
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Báo cáo tuổi nợ khách hàng'
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

istr_dwo[2].s_dwo_default = 'dp_customer_aging_balance_form'
istr_dwo[2].s_dwo_form = 'dp_customer_aging_balance_form'
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

on ur_customer_aging_balance.create
call super::create
end on

on ur_customer_aging_balance.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'OBJECT_AGING_BALANCE_TMP'
ib_changed_dwo_4edit = false
is_display_model = '1ddlb_2d_1tp'
ib_display_text = true
is_object_title = 'Báo cáo tuổi nợ khách hàng'

istr_actionpane[1].s_description = is_object_title

istr_report.s_dwo_report = 'dr_customer_aging_balance_form'
istr_report.s_pro_name = 'pkg_customer_aging_balance.pro_insert_cus_aging_bal'
istr_report.sa_parm_name[1] = 'p_object_code'
istr_report.sa_parm_name[2] = 'p_date'
istr_report.sa_parm_name[3] = 'p_type'
istr_report.sa_parm_name[4] = 'p_step_age'
istr_report.sa_parm_name[5] = 'p_limit'
//istr_report.sa_parm_name[6] = 'p_account_number'
istr_report.sa_parm_name[6] = 'gs_sob'
istr_report.sa_parm_name[7] = 'gi_user_id'
istr_report.sa_parm_value[7] = gi_userid
istr_report.b_multi_thread = false

end event

event e_window_e_postopen;call super::e_window_e_postopen;t_dw_mpl	ldw_parm
string			ls_type
int 			li_step_age,li_limit
decimal 		ldc_user_id

ldw_parm = iw_display.f_get_dw(istr_dwo[2].s_dwo_default)

ldc_user_id = ldw_parm.getitemnumber(ldw_parm.getrow(),'a_user_id')
if isnull(ldc_user_id) then ldw_parm.setitem(ldw_parm.getrow(), 'a_user_id',gi_userid)

ls_type = ldw_parm.getitemstring(ldw_parm.getrow(),'p_type')
if isnull(ls_type) then ldw_parm.setitem(ldw_parm.getrow(), 'p_type','TRAN')

li_step_age = ldw_parm.getitemnumber(ldw_parm.getrow(),'p_step_age')
if isnull(li_step_age) then ldw_parm.setitem(ldw_parm.getrow(), 'p_step_age',7)

li_limit = ldw_parm.getitemnumber(ldw_parm.getrow(),'p_limit')
if isnull(li_step_age) then ldw_parm.setitem(ldw_parm.getrow(), 'p_limit',3)
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.dynamic f_set_ii_leftpart_width(3800)
iw_display.dynamic f_set_ii_upperpart_height(300)
return 0
end event

