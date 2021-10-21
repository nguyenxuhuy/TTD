$PBExportHeader$c_machine.sru
forward
global type c_machine from s_object_display
end type
end forward

global type c_machine from s_object_display
end type
global c_machine c_machine

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_object_grid'
istr_dwo[1].s_dwo_form = 'd_object_form'
istr_dwo[1].s_dwo_grid = 'd_object_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_machinery_form;'
istr_dwo[1].b_ref_table_yn  = true
istr_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[1].s_dwo_shared = ''
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Nhân viên'

istr_dwo[2].s_dwo_default =  'd_machinery_form'
istr_dwo[2].s_dwo_form = 'd_machinery_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = true
istr_dwo[2].b_detail = false
istr_dwo[2].b_cascade_del = false
istr_dwo[2].s_dwo_master = 'd_object_grid;'
istr_dwo[2].s_dwo_details = ';'
istr_dwo[2].s_master_keycol = 'ID'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[2].b_ref_table_yn  = true
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[2].b_relation_1_1 = true
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_focus_master = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_description = 'Máy móc'

//istr_dwo[3].s_dwo_default =  'd_role_user_people_form'
//istr_dwo[3].s_dwo_form = 'd_role_user_people_form'
//istr_dwo[3].s_dwo_grid = ''
//istr_dwo[3].b_detail = true
//istr_dwo[3].s_dwo_master = 'd_staff_form;'
//istr_dwo[3].s_master_keycol = 'ID'
//istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID'
//istr_dwo[3].b_ref_table_yn  = false
//istr_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE'
//istr_dwo[3].b_relation_1_1 = true
//istr_dwo[3].b_insert = true
//istr_dwo[3].b_update = true
//istr_dwo[3].b_delete = true
//istr_dwo[3].b_query = true
//istr_dwo[3].b_print = true
//istr_dwo[3].b_excel = true
//istr_dwo[3].b_traceable = true
//istr_dwo[3].b_focus_master = true
//istr_dwo[3].b_keyboardlocked = true
//istr_dwo[3].s_description = 'Thông tin nhân viên'
//
end subroutine

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'

end subroutine

event constructor;call super::constructor;
ib_changed_dwo_4edit = false
is_display_model = 'up_1d_lo_2d'
ib_display_text = false
is_object_title = 'Máy móc'

istr_actionpane[1].s_description = is_object_title
end event

on c_machine.create
call super::create
end on

on c_machine.destroy
call super::destroy
end on

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;t_dw_mpl		ldw_handle

if pos(rpo_dw.dataobject, 'd_object_') > 0 then
	ldw_handle = iw_display.dynamic f_get_dw('d_staff_form')
	ldw_handle.event e_addrow()
	ldw_handle = iw_display.dynamic f_get_dw('d_role_user_people_form')
	ldw_handle.event e_addrow()
end if
return 0
end event

event e_window_open;call super::e_window_open;t_dw_mpl			ldw_main
any				laa_value[]


ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '=MACHINE'
ldw_main.f_add_where('object_ref_table;',laa_value[])

//-- set resize parm --//
iw_display.dynamic f_set_ii_fixedpart1_height(300)

return 0
end event

