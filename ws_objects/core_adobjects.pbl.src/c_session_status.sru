$PBExportHeader$c_session_status.sru
forward
global type c_session_status from s_object_display
end type
end forward

global type c_session_status from s_object_display
event e_action_killsession ( )
end type
global c_session_status c_session_status

forward prototypes
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_window ()
end prototypes

event e_action_killsession();//
messagebox('Ngoc','Ndasdhfahsdas')
end event

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'

end subroutine

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_session_status_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_session_status_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Truy vấn người dùng database'

end subroutine

on c_session_status.create
call super::create
end on

on c_session_status.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'ALERT_DATA'
ib_changed_dwo_4edit = false
is_display_model = '1d'
ib_display_text = false
is_object_title = 'Truy vấn người dùng database'

istr_actionpane[1].s_description = is_object_title
end event

event e_action_ctrl_bttn;call super::e_action_ctrl_bttn;datawindow				ldw_focus
int							li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	//-- control d_action_edit --//
	FOR li_idx = 1 to upperbound(istr_actionpane[]) 
		if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
			istr_actionpane[li_idx].s_visible_buttons='b_refresh;b_killsession;b_filteron;b_query;'
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

