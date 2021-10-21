$PBExportHeader$c_user_trace.sru
forward
global type c_user_trace from s_object_display
end type
end forward

global type c_user_trace from s_object_display
end type
global c_user_trace c_user_trace

forward prototypes
public subroutine f_set_dwo_window ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_user_trace_form'
istr_dwo[1].s_dwo_form = 'd_user_trace_form'
istr_dwo[1].s_dwo_grid = ''
istr_dwo[1].b_master = false
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_details = ''
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = false
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = false
istr_dwo[1].b_excel = false
istr_dwo[1].b_traceable = false
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'User cập nhật dữ liệu'
end subroutine

on c_user_trace.create
call super::create
end on

on c_user_trace.destroy
call super::destroy
end on

event e_window_e_postopen_child;call super::e_window_e_postopen_child;window		lw_parent
t_dw_mpl	ldw_focus, ldw_main
datetime		ldt_created, ldt_last_mdf
double		ldb_created_by, ldb_last_mdf_by
string			ls_created_by, ls_last_mdf_by
c_user		lc_user

lw_parent = iw_display.dynamic f_getparentwindow()
ldw_focus = lw_parent.dynamic f_get_idwfocus()
if  ldw_focus.f_get_ib_traceable( ) then
	ldt_created = ldw_focus.getitemdatetime(ldw_focus.getrow(),'created_date' )
	ldt_last_mdf = ldw_focus.getitemdatetime(ldw_focus.getrow(),'last_mdf_date' )
	ldb_created_by = ldw_focus.getitemnumber(ldw_focus.getrow(),'created_by' )
	ldb_last_mdf_by = ldw_focus.getitemnumber(ldw_focus.getrow(),'last_mdf_by' )

	lc_user = create c_user
	ls_created_by = lc_user.f_get_code(ldb_created_by)
	ls_last_mdf_by = lc_user.f_get_code(ldb_last_mdf_by)
	destroy	lc_user
end if
ldw_main = iw_display.dynamic f_get_dwmain()
ldw_main.insertrow(0)
ldw_main.setitem( 1,'created_date' , ldt_created)
ldw_main.setitem( 1,'last_mdf_date' , ldt_last_mdf)
ldw_main.setitem( 1,'created_by' , ls_created_by)
ldw_main.setitem( 1,'last_mdf_by' , ls_last_mdf_by)

return 1
end event

event e_window_open;call super::e_window_open;
return 1
end event

event constructor;call super::constructor;
ib_changed_dwo_4edit = false
is_display_model = '1d'
ib_display_text = false
is_object_title = 'User cập nhật dữ liệu'

istr_actionpane[1].s_description = is_object_title
end event

