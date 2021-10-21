$PBExportHeader$c_alert_data_remind.sru
forward
global type c_alert_data_remind from s_object_display
end type
end forward

global type c_alert_data_remind from s_object_display
end type
global c_alert_data_remind c_alert_data_remind

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_policy_alert_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_policy_alert_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_business_rule_grid;'
istr_dwo[1].s_dwo_shared = ''
istr_dwo[1].s_dwo_master = ''
istr_dwo[1].s_master_keycol = ''
istr_dwo[1].s_detail_keycol = ''
istr_dwo[1].b_ref_table_yn  = false
istr_dwo[1].s_ref_table_field = ''
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Cài đặt thông báo'

istr_dwo[2].s_dwo_default =  'd_applicable_rule_hdr_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_applicable_rule_hdr_grid'
istr_dwo[2].b_master = true
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_details = 'd_applicable_rule_line_grid;'
istr_dwo[2].s_dwo_master = 'd_business_rule_grid'
istr_dwo[2].s_master_keycol = 'ID;'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[2].b_ref_table_yn  = true
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].b_excel = true
istr_dwo[2].s_description = 'Cài đặt đối tượng nhận thông báo'

istr_dwo[3].s_dwo_default =  'd_applicable_rule_line_grid'
istr_dwo[3].s_dwo_form = ''
istr_dwo[3].s_dwo_grid = 'd_applicable_rule_line_grid'
istr_dwo[3].b_detail = true
istr_dwo[3].b_cascade_del = false
istr_dwo[3].b_shared = false
istr_dwo[3].s_dwo_master = 'd_applicable_rule_hdr_grid;'
istr_dwo[3].s_master_keycol = 'ID;'
istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[3].b_ref_table_yn  = false
istr_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[3].b_insert = true
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = true
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_excel = true
istr_dwo[3].b_traceable = true
istr_dwo[3].b_focus_master = false
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].s_description = 'Điều kiện đối tượng nhận thông báo '
istr_dwo[3].s_pic_ref_table = ''
istr_dwo[3].s_pic_ref_field = ''

istr_dwo[4].s_dwo_default =  'd_business_rule_grid'
istr_dwo[4].s_dwo_form = ''
istr_dwo[4].s_dwo_grid = 'd_business_rule_grid'
istr_dwo[4].b_detail = true
istr_dwo[4].b_master = true
istr_dwo[4].s_dwo_master = 'd_policy_alert_grid;'
istr_dwo[4].s_dwo_details = 'd_applicable_rule_hdr_grid;'
istr_dwo[4].s_master_keycol = 'ID;'
istr_dwo[4].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[4].b_ref_table_yn  = false
istr_dwo[4].s_ref_table_field = 'OBJECT_REF_TABLE' //OBJECT_REF_TABLE
istr_dwo[4].b_insert = true
istr_dwo[4].b_update = true
istr_dwo[4].b_delete = true
istr_dwo[4].b_query = true
istr_dwo[4].b_print = true
istr_dwo[4].b_excel = true
istr_dwo[4].b_traceable = true
istr_dwo[4].b_focus_master = false
istr_dwo[4].b_keyboardlocked = true
istr_dwo[4].s_description = ''
istr_dwo[4].s_pic_ref_table = ''
istr_dwo[4].s_pic_ref_field = ''
end subroutine

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'

end subroutine

event constructor;call super::constructor;is_table = 'ALERT_DATA'
ib_changed_dwo_4edit = false
is_display_model = '3d'
ib_display_text = false
is_object_title = 'Thông báo công việc'

istr_actionpane[1].s_description = is_object_title

end event

on c_alert_data_remind.create
call super::create
end on

on c_alert_data_remind.destroy
call super::destroy
end on

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;t_dw_mpl	ldw_busines_rule
long			ll_insertrow


if rpo_dw.dataobject = istr_dwo[1].s_dwo_default then
	rpo_dw.setitem(vl_currentrow,'remind_yn','Y')
	rpo_dw.setitem(vl_currentrow,'popup_yn','Y')
	ldw_busines_rule = iw_display.dynamic f_get_dw('d_business_rule_grid')
	ll_insertrow = ldw_busines_rule.dynamic event e_addrow()
end if
return 0
end event

event e_window_open;call super::e_window_open;t_dw_mpl			ldw_main
any				laa_value[]
//--form parm--//
ldw_main = iw_display.f_get_dwmain()
laa_value[1] = '=Y'
ldw_main.f_add_where('remind_yn;',laa_value[])
return 0
end event

