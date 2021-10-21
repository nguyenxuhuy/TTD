$PBExportHeader$c_role.sru
$PBExportComments$User class, kế thừa c_employee
forward
global type c_role from s_object_display
end type
end forward

global type c_role from s_object_display
end type
global c_role c_role

type variables
long 				il_old_id
end variables

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_related ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_role_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_role_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_shared = ''
istr_dwo[1].s_dwo_details = 'd_role_assign_grid'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Nhóm người dùng (Vai trò)'   

istr_dwo[2].s_dwo_default =  'd_role_assign_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_role_assign_grid'
istr_dwo[2].b_master = false
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = false
istr_dwo[2].s_dwo_master = 'd_role_grid'
istr_dwo[2].s_dwo_details = ''
istr_dwo[2].s_master_keycol = 'id;'
istr_dwo[2].s_detail_keycol = 'role_id;'
istr_dwo[2].b_ref_table_yn  = false
istr_dwo[2].s_ref_table_field = ''
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_description = 'Người dùng thuộc nhóm (Vai trò)'   

end subroutine

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name = 'b_user;b_role_assign;'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_button_name =  'b_book; b_attach; b_note;b_doc_trace_on;b_user_trace;'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'

end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_user'
istr_dwo_related[1].b_f_matching =true
istr_dwo_related[1].s_match_table = 'role_assign'
istr_dwo_related[1].s_main_obj_dwo = 'd_role_grid'
istr_dwo_related[1].s_main_obj_column = 'id;'
istr_dwo_related[1].s_match_column[1] = 'role_id'
istr_dwo_related[1].s_related_obj_dwo = 'd_role_user_grid'
istr_dwo_related[1].s_related_obj_column = 'id;'
istr_dwo_related[1].s_match_column[2] = 'user_id'
istr_dwo_related[1].s_relatedtext_column = 'code;name'
istr_dwo_related[1].s_text = 'Người dùng trong nhóm: '

end subroutine

event constructor;call super::constructor;is_table = 'ROLE_USER'
ib_changed_dwo_4edit = false
is_display_model = '1d_1d'
ib_display_text = false
is_object_title = 'Nhóm người dùng (Vai trò) '

istr_actionpane[1].s_description = is_object_title
end event

on c_role.create
call super::create
end on

on c_role.destroy
call super::destroy
end on

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;if rpo_dw.dataobject = 'd_role_grid' then
	rpo_dw.setitem(vl_currentrow,'type','role')
end if
return vl_currentrow
end event

event e_window_open;call super::e_window_open;datawindow		ldw_main
int						li_rtn
any					laa_data[]

laa_data[1] = '=role'
ldw_main = iw_display.dynamic f_get_dwmain()
li_rtn = ldw_main.dynamic f_add_where('type',laa_data)

//-- set resize parm --//
iw_display.dynamic f_set_ii_leftpart_width(1/2)

if li_rtn = 1 then
	return 0
else
	return 1
end if
end event

event e_action_ctrl_bttn;datawindow				ldw_focus
int								li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	if not this.ib_copying then
		//-- control d_action_edit --//
		FOR li_idx = 1 to upperbound(istr_actionpane[]) 
			if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
				if ldw_focus.dynamic f_get_ib_shared() then
					ldw_focus = ldw_focus.dynamic f_getdwmaster()
				end if			
				if ldw_focus.dynamic f_get_ib_detail() then
					if ib_changed_dwo_4edit then
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_filteron;b_query;b_refresh;b_delete;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query; b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query; b_refresh;b_delete;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_delete;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =  'b_user;b_role_assign;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
				istr_actionpane[li_idx].s_visible_buttons =  'b_book; b_attach; b_note;b_doc_trace_on;b_user_trace;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
				
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

