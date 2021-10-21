$PBExportHeader$u_sob.sru
forward
global type u_sob from s_object_display
end type
end forward

global type u_sob from s_object_display
end type
global u_sob u_sob

forward prototypes
public subroutine f_set_dwo_window ()
end prototypes

public subroutine f_set_dwo_window ();if gs_sob = 'F' then
	istr_dwo[1].s_dwo_default = 'd_sob_f_form'
	istr_dwo[1].s_dwo_grid = 'd_sob_f_form'
else
	istr_dwo[1].s_dwo_default = 'd_sob_t_form'
	istr_dwo[1].s_dwo_grid = 'd_sob_t_form'
end if
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].b_master = false
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_details = ''
istr_dwo[1].s_dwo_shared = ''
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = false
istr_dwo[1].b_excel = false
istr_dwo[1].b_keyboardlocked = false
istr_dwo[1].s_description = 'Chọn Sổ kế toán '


end subroutine

on u_sob.create
call super::create
end on

on u_sob.destroy
call super::destroy
end on

event constructor;call super::constructor;ib_changed_dwo_4edit = false
ib_keyboardlocked = false
is_display_model ='1d'
is_object_title = 'Chọn sổ '
istr_actionpane[1].s_description = is_object_title
end event

event e_action_ctrl_bttn;//-- override --//
datawindow				ldw_focus
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify; b_saveclose;b_filteron;b_query;b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_saveclose;b_filteron;b_query;b_refresh;b_delete;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_save;b_filteron;b_query; b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_save;b_filteron;b_query; b_refresh;b_delete;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_saveclose;b_filteron;b_query;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_okclose;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then				
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
				
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_open;call super::e_window_open;//-- override --//
datawindow				ldw_focus
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify; b_saveclose;b_filteron;b_query;b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_saveclose;b_filteron;b_query;b_refresh;b_delete;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_save;b_filteron;b_query; b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_save;b_filteron;b_query; b_refresh;b_delete;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_saveclose;b_filteron;b_query;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_okclose;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then				
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
				
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 1
end event

event e_window_e_postopen;call super::e_window_e_postopen;t_dw_mpl		ldw_main

ldw_main = iw_display.f_get_dwmain( )
ldw_main.insertrow( 1)
ldw_main.setitem( 1, 'sob',gs_sob )
//iw_display.event e_modify( )
return 0
end event

event e_window_e_okclose;call super::e_window_e_okclose;string					ls_name_sob,ls_code_sob,ls_rtn
datawindow			ldw_main

ldw_main = iw_display.dynamic f_get_dwmain()
ls_rtn = ldw_main.getitemstring(ldw_main.getrow( ), 'sob' )
if isnull(ls_rtn) then ls_rtn = ''
 closewithreturn(iw_display, ls_rtn)
end event

