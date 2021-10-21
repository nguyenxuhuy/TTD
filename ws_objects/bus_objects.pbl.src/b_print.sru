$PBExportHeader$b_print.sru
forward
global type b_print from s_object_display
end type
end forward

global type b_print from s_object_display
end type
global b_print b_print

on b_print.create
call super::create
end on

on b_print.destroy
call super::destroy
end on

event e_action_ctrl_bttn;//-- override --//

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
						istr_actionpane[li_idx].s_visible_buttons = 'b_modify; b_saveclose;b_refresh;b_print;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_modify; b_saveclose;b_refresh;b_print;'
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_modify; b_saveclose;b_refresh;b_print;'
					else
						istr_actionpane[li_idx].s_visible_buttons ='b_modify; b_saveclose;b_refresh;b_print;'
					end if
				end if
			else				
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_modify; b_saveclose;b_refresh;b_print;'
				else
					istr_actionpane[li_idx].s_visible_buttons='b_modify; b_saveclose;b_refresh;b_print;'
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
			istr_actionpane[li_idx].s_visible_buttons =   'b_unit_class;b_unit_conversion;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
			istr_actionpane[li_idx].s_visible_buttons =  'b_book; b_attach; b_note;b_doc_trace;b_user_trace;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then				
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_dw_e_postretrieve;call super::e_dw_e_postretrieve;datawindow 	ldw_main

ldw_main = iw_display.dynamic f_get_dwmain()
ldw_main.modify("DataWindow.Print.Preview= true")
return 0
end event

