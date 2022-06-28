$PBExportHeader$c_doc_status.sru
$PBExportComments$User class, kế thừa c_employee
forward
global type c_doc_status from s_object_display
end type
end forward

global type c_doc_status from s_object_display
end type
global c_doc_status c_doc_status

type variables
long 				il_old_id
end variables

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_valueset_entry_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_valueset_entry_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_shared = ''
istr_dwo[1].s_dwo_details = 'd_doc_status_grid;'
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = false
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Chứng từ'   

istr_dwo[2].s_dwo_default =  'd_doc_status_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_doc_status_grid'
istr_dwo[2].b_master = true
istr_dwo[2].b_detail = true
istr_dwo[2].b_shared = false
istr_dwo[2].s_dwo_master = 'd_valueset_entry_grid;'
istr_dwo[2].s_dwo_details = 'd_doc_related_status_grid;'
istr_dwo[2].s_master_keycol = 'code'
istr_dwo[2].s_detail_keycol = 'doc_type'
istr_dwo[2].b_ref_table_yn  = false
istr_dwo[2].s_ref_table_field = ''
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_focus_master = false
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_description = 'Trạng thái chứng từ'

istr_dwo[3].s_dwo_default =  'd_doc_related_status_grid'
istr_dwo[3].s_dwo_form =''
istr_dwo[3].s_dwo_grid =  'd_doc_related_status_grid'
istr_dwo[3].b_master = false
istr_dwo[3].b_detail = true
istr_dwo[3].s_dwo_master = 'd_doc_status_grid;'
istr_dwo[3].s_dwo_details = ''
istr_dwo[3].s_master_keycol = 'id;'
istr_dwo[3].s_detail_keycol = 'object_ref_id;'
istr_dwo[3].b_ref_table_yn  = false
istr_dwo[3].s_ref_table_field = 'object_ref_table;'
istr_dwo[3].b_insert = true
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = true
istr_dwo[3].b_query = true
istr_dwo[3].b_print = false
istr_dwo[3].b_excel = true
istr_dwo[3].b_traceable = true
istr_dwo[3].b_focus_master = false
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].s_description = 'Trạng thái chứng từ liên quan'

end subroutine

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'

end subroutine

event constructor;call super::constructor;is_table = 'ROLE_USER'
ib_changed_dwo_4edit = false
is_display_model = '1d_2d'
ib_display_text = false
is_object_title = 'Cài đặt update trạng thái chứng từ'

istr_actionpane[1].s_description = is_object_title

istr_actionpane[1].s_button_name =  'e_add;e_modify;e_delete;'
istr_actionpane[1].s_button_name += 'b_related_object;b_update;b_approve;b_view;b_copyt;b_copyf;'
istr_actionpane[1].s_button_has_sub ='b_related_object;b_update;b_approve;b_view;b_copyt;b_copyf;'
istr_actionpane[1].sa_sub_button[1]=''
istr_actionpane[1].sa_subbutton_name[1]=''
istr_actionpane[1].sa_sub_button[2]=''
istr_actionpane[1].sa_subbutton_name[2]=''
istr_actionpane[1].sa_sub_button[3]=''	//'b_send_2_approve;b_approve;b_reject;'
istr_actionpane[1].sa_subbutton_name[3]=''	//'Gửi duyệt;Duyệt;Trả duyệt'
istr_actionpane[1].sa_sub_button[4]=''
istr_actionpane[1].sa_subbutton_name[4]=''
istr_actionpane[1].sa_sub_button[5]=''
istr_actionpane[1].sa_subbutton_name[5]=''
istr_actionpane[1].sa_sub_button[6]=''
istr_actionpane[1].sa_subbutton_name[6]=''

end event

on c_doc_status.create
call super::create
end on

on c_doc_status.destroy
call super::destroy
end on

event e_window_open;t_dw_mpl			ldw_main
any				laa_value[]

//-- add where active --//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '25202'
ldw_main.f_add_where('object_ref_id;',laa_value[])

return  0
end event

