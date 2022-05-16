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


lw_parent = iw_display.dynamic f_getparentwindow()
ldw_focus = lw_parent.dynamic f_get_idwfocus()
if  ldw_focus.f_get_ib_traceable( ) then
	ldt_created = ldw_focus.getitemdatetime(ldw_focus.getrow(),'created_date' )
	ldt_last_mdf = ldw_focus.getitemdatetime(ldw_focus.getrow(),'last_mdf_date' )
	ldb_created_by = ldw_focus.getitemnumber(ldw_focus.getrow(),'created_by' )
	ldb_last_mdf_by = ldw_focus.getitemnumber(ldw_focus.getrow(),'last_mdf_by' )
	ls_created_by =  g_user.f_get_usercode_ex( ldb_created_by, it_transaction)	
	ls_last_mdf_by = g_user.f_get_usercode_ex(ldb_last_mdf_by, it_transaction)	
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

istr_actionpane[1].s_button_name = 'e_close;'
//istr_actionpane[1].s_button_name += 'b_doc_trace;e_add;e_modify;e_delete;'
//istr_actionpane[1].s_button_has_sub ='b_update;'
//istr_actionpane[1].sa_sub_button[1]='e_action_load_file;e_action_link;e_action_open_file;'
//istr_actionpane[1].sa_subbutton_name[1]='Nạp file;Nạp link;Mở file;'

//istr_actionpane[1].s_button_has_sub ='b_related_object;b_update;b_approve;b_view;b_copyt;b_copyf;'
//istr_actionpane[1].sa_sub_button[1]='u_so;'
//istr_actionpane[1].sa_subbutton_name[1]='Đơn bán hàng(SO);'
//istr_actionpane[1].sa_sub_button[2]='b_complete;b_lose;b_excel;'
//istr_actionpane[1].sa_subbutton_name[2]='Thành công;Không thành;Excel;'
//istr_actionpane[1].sa_sub_button[3]=''	//'b_send_2_approve;b_approve;b_reject;'
//istr_actionpane[1].sa_subbutton_name[3]=''	//'Gửi duyệt;Duyệt;Trả duyệt'
//istr_actionpane[1].sa_sub_button[4]='b_view_qt;b_view_qt_kni_eng;'
//istr_actionpane[1].sa_subbutton_name[4]='Chào giá;Chào giá ENG;'
//istr_actionpane[1].sa_sub_button[5]=''
//istr_actionpane[1].sa_subbutton_name[5]=''
//istr_actionpane[1].sa_sub_button[6]=''
//istr_actionpane[1].sa_subbutton_name[6]=''
end event

