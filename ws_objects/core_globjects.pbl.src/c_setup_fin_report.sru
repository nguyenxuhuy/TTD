$PBExportHeader$c_setup_fin_report.sru
forward
global type c_setup_fin_report from s_object_display
end type
end forward

global type c_setup_fin_report from s_object_display
end type
global c_setup_fin_report c_setup_fin_report

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
public function string f_get_balance_control (double vdb_id)
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_object_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_object_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_accounts_form;d_account_total_line_grid;d_cashflow_setup_line_grid;'
istr_dwo[1].b_ref_table_yn  = true
istr_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Danh mục tài khoản kế toán'

istr_dwo[2].s_dwo_default =  'd_account_form'
istr_dwo[2].s_dwo_form = 'd_account_form'
istr_dwo[2].s_dwo_grid = ''
//istr_dwo[2].b_master = true
istr_dwo[2].b_detail = true
istr_dwo[2].s_dwo_details = ''
istr_dwo[2].s_dwo_master = 'd_object_grid;'
istr_dwo[2].s_master_keycol = 'ID'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[2].b_ref_table_yn  = true
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].b_focus_master = false
istr_dwo[2].s_description = 'Thông tin tài khoản'

istr_dwo[3].s_dwo_default =  'd_account_total_line_grid'
istr_dwo[3].s_dwo_form = ''
istr_dwo[3].s_dwo_grid = 'd_account_total_line_grid'
istr_dwo[3].b_detail = true
istr_dwo[3].s_dwo_master = 'd_object_grid;'
istr_dwo[3].s_master_keycol = 'ID'
istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[3].b_ref_table_yn  = false
istr_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[3].b_insert = true
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = true
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_excel = true
istr_dwo[3].b_traceable = true
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].b_focus_master = false
istr_dwo[3].s_description = 'Thông tin tài khoản'

istr_dwo[4].s_dwo_default =  'd_cashflow_setup_line_grid'
istr_dwo[4].s_dwo_form = ''
istr_dwo[4].s_dwo_grid = 'd_cashflow_setup_line_grid'
istr_dwo[4].b_detail = true
istr_dwo[4].s_dwo_master = 'd_object_grid;'
istr_dwo[4].s_master_keycol = 'ID'
istr_dwo[4].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[4].b_ref_table_yn  = false
istr_dwo[4].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[4].b_insert = true
istr_dwo[4].b_update = true
istr_dwo[4].b_delete = true
istr_dwo[4].b_query = true
istr_dwo[4].b_print = true
istr_dwo[4].b_excel = true
istr_dwo[4].b_traceable = true
istr_dwo[4].b_keyboardlocked = true
istr_dwo[4].b_focus_master = false
istr_dwo[4].s_description = 'Thông tin tài khoản'


end subroutine

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'

end subroutine

public function string f_get_balance_control (double vdb_id);string			ls_balance_control

SELECT balance_control into :ls_balance_control
FROM ACCOUNT
where object_ref_id = :vdb_id using sqlca;

if sqlca.sqlcode = 0 then
	return ls_balance_control
else
	return ''
end if
end function

event constructor;call super::constructor;is_table = 'object'
ib_changed_dwo_4edit = false
is_display_model = '1d_1dup_2d'
ib_display_text = false
is_object_title = 'Báo cáo tài chính'
istr_actionpane[1].s_description = is_object_title

end event

on c_setup_fin_report.create
call super::create
end on

on c_setup_fin_report.destroy
call super::destroy
end on

event e_action_ctrl_bttn;call super::e_action_ctrl_bttn;//-- override --//

datawindow				ldw_focus
int								li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	//-- control d_action_edit --//
	FOR li_idx = 1 to upperbound(istr_actionpane[]) 
		if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
			if ldw_focus.dynamic f_get_ib_shared() then
				ldw_focus = ldw_focus.dynamic f_getdwmaster()
			end if			
			if ldw_focus.dynamic f_get_ib_detail() then
				if ib_changed_dwo_4edit then
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify; b_filteron;b_query;b_refresh;b_delete;'
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
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_delete;'
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_delete;'
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
			istr_actionpane[li_idx].s_visible_buttons =   'b_business_group;b_staff;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
			istr_actionpane[li_idx].s_visible_buttons =  'b_note;b_doc_trace;b_user_trace;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then				
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;t_dw_mpl				ldw_handle
if pos(rpo_dw.dataobject, 'd_object_grid')> 0 then
	rpo_dw.setitem(vl_currentrow,'active_yn','Y')
	ldw_handle = iw_display.dynamic f_get_dw('d_account_form')
	ldw_handle.event e_addrow( )	
end if
return vl_currentrow
end event

