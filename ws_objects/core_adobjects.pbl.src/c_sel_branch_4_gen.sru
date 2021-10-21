$PBExportHeader$c_sel_branch_4_gen.sru
forward
global type c_sel_branch_4_gen from s_object_display
end type
end forward

global type c_sel_branch_4_gen from s_object_display
end type
global c_sel_branch_4_gen c_sel_branch_4_gen

forward prototypes
public subroutine f_set_dwo_window ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default = 'd_branch_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_branch_grid'
istr_dwo[1].b_master = false
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_details = ''
istr_dwo[1].s_dwo_shared = ''
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = false
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = false
istr_dwo[1].b_excel = false
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Chọn công ty '


end subroutine

on c_sel_branch_4_gen.create
call super::create
end on

on c_sel_branch_4_gen.destroy
call super::destroy
end on

event constructor;call super::constructor;ib_changed_dwo_4edit = false
is_display_model ='1d'
is_object_title = 'Chọn công ty'
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
						istr_actionpane[li_idx].s_visible_buttons='b_okclose;b_close;'
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

event e_window_e_okclose;call super::e_window_e_okclose;string					ls_branch
int						li_select
datawindow			ldw_main

ldw_main = iw_display.dynamic f_get_dwmain()

li_select = ldw_main.find( "gutter = 'Y'", 1, ldw_main.rowcount())
DO while li_select > 0 
	if ls_branch <> '' then ls_branch+=';'
	ls_branch += string(ldw_main.getitemnumber( li_select , 'ID'))
	li_select = ldw_main.find( "gutter = 'Y'", li_select+1, ldw_main.rowcount()+1)
LOOP

if ls_branch = '' then
	ls_branch = string(ldw_main.getitemnumber( ldw_main.getrow() , 'ID'))
end if

closewithreturn(iw_display, ls_branch)
end event

event e_window_open;call super::e_window_open;
t_dw_mpl			ldw_main
any					la_value[]

ldw_main = iw_display.dynamic f_get_dwmain()
la_value[1] = gi_user_comp_id
la_value[2] = 'Y'
ldw_main.f_add_where('up_id;branch_yn;',la_value[])
return 0
end event

