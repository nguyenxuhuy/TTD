$PBExportHeader$c_alert_data.sru
forward
global type c_alert_data from s_object_display
end type
end forward

global type c_alert_data from s_object_display
end type
global c_alert_data c_alert_data

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_alert_data_grid'
istr_dwo[1].s_dwo_form = 'd_alert_data_form'
istr_dwo[1].s_dwo_grid = 'd_alert_data_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
//istr_dwo[1].s_dwo_details = 'd_role_user_people_form;'
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = false
istr_dwo[1].b_excel = false
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Dữ liệu Alert'

//istr_dwo[2].s_dwo_default =  'd_alert_data_form'
//istr_dwo[2].s_dwo_form = 'd_alert_data_form'
//istr_dwo[2].s_dwo_grid = ''
//istr_dwo[2].b_detail = true
//istr_dwo[2].s_dwo_master = 'd_alert_data_grid;'
//istr_dwo[2].s_master_keycol = 'ID'
//istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID'
//istr_dwo[2].b_ref_table_yn  = true
//istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE'
//istr_dwo[2].b_insert = true
//istr_dwo[2].b_update = true
//istr_dwo[2].b_delete = true
//istr_dwo[2].b_query = true
//istr_dwo[2].b_print = true
//istr_dwo[2].b_excel = true
//istr_dwo[2].b_traceable = true
//istr_dwo[2].b_focus_master = true
//istr_dwo[2].s_description = 'Thông tin tham số'
end subroutine

public subroutine f_set_actionpane ();//istr_actionpane[2].s_dwo_action = 'd_action_manage'
//istr_actionpane[2].s_objname_handling = this.classname( )
//istr_actionpane[2].s_description = 'Menu quản lý'

end subroutine

event constructor;call super::constructor;is_table = 'ALERT_DATA'
ib_changed_dwo_4edit = false
is_display_model = '1d'
ib_display_text = false
is_object_title = 'Dữ liệu Alert'

istr_actionpane[1].s_description = is_object_title

end event

on c_alert_data.create
call super::create
end on

on c_alert_data.destroy
call super::destroy
end on

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;datawindow	ldw_main,ldw_detail[]

if rpo_dw.dataobject = 'd_staff_form' then
	ldw_main = iw_display.dynamic f_get_dwmain()
	ldw_main.dynamic f_getdwdetails(ldw_detail)
	ldw_detail[1].dynamic event e_addrow()
end if
return 0
end event

event e_action_ctrl_bttn;call super::e_action_ctrl_bttn;datawindow				ldw_focus
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_modify;b_filteron;b_query;b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_modify;b_filteron;b_query;b_refresh;b_delete;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_modify;b_filteron;b_query;b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_modify;b_filteron;b_query;b_refresh;b_delete;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons= 'b_modify;b_filteron;b_query;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons= 'b_modify;b_filteron;b_query;b_refresh;b_delete;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				
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

