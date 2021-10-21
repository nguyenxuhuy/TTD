$PBExportHeader$c_select_sob.sru
forward
global type c_select_sob from s_object_display
end type
end forward

global type c_select_sob from s_object_display
end type
global c_select_sob c_select_sob

forward prototypes
public subroutine f_set_dwo_window ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default = 'd_sob_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_sob_grid'
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
istr_dwo[1].s_description = 'Chọn Sổ kế toán '


end subroutine

on c_select_sob.create
call super::create
end on

on c_select_sob.destroy
call super::destroy
end on

event constructor;call super::constructor;ib_changed_dwo_4edit = false
is_display_model ='1d'
is_object_title = 'Chọn sổ kế toán'
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

event e_dw_clicked;call super::e_dw_clicked;
long	ll_row

if vs_colname = 'gutter' then
	
	ll_row = rdw_handling.find( "gutter = 'Y'", 1 , rdw_handling.rowcount())
	if ll_row = vl_currentrow then
		ll_row = rdw_handling.find( "gutter = 'Y'", ll_row+1 , rdw_handling.rowcount())
	end if
	rdw_handling.setitem(ll_row, 'gutter','N')
	rdw_handling.scrolltorow(vl_currentrow)
end if
return 0
end event

event e_window_e_postopen;call super::e_window_e_postopen;datawindow			lw_main
long					ll_row

lw_main = iw_display.dynamic f_get_dwmain()
ll_row = lw_main.insertrow( 0)
lw_main.setitem( ll_row, 'code', 'SOB_FISCAL')
lw_main.setitem( ll_row, 'name', 'Nội bộ')
ll_row = lw_main.insertrow( 0)
lw_main.setitem( ll_row, 'code', 'SOB_TAX')
lw_main.setitem( ll_row, 'name', 'Thuế')
if gs_sob = 'F' then
	lw_main.setitem( 1, 'gutter', 'Y')
else
	lw_main.setitem( 2, 'gutter', 'Y')
end if
return 0
end event

event e_window_e_okclose;call super::e_window_e_okclose;string					ls_name_sob,ls_code_sob,ls_rtn
datawindow			ldw_main

ldw_main = iw_display.dynamic f_get_dwmain()
ls_code_sob = ldw_main.getitemstring(ldw_main.getrow( ), 'code' )
ls_name_sob = ldw_main.getitemstring(ldw_main.getrow( ), 'name' )
if isnull(ls_name_sob) or isnull(ls_code_sob) then ls_rtn = '[]'
if ls_code_sob = 'SOB_FISCAL' then
	ls_code_sob = 'F'
else
	ls_code_sob = 'T'
end if
ls_rtn = ls_code_sob+';'+ls_name_sob
closewithreturn(iw_display, ls_rtn)
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
return 1
end event

event e_window_e_close;call super::e_window_e_close;return close(iw_display)
end event

