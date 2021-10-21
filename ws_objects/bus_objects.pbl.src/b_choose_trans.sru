$PBExportHeader$b_choose_trans.sru
forward
global type b_choose_trans from s_object_display
end type
end forward

global type b_choose_trans from s_object_display
end type
global b_choose_trans b_choose_trans

type variables
string		is_object_type
end variables

forward prototypes
public subroutine f_set_dwo_window ()
public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[])
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_trans_setup_hdr_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_trans_setup_hdr_grid'
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = false
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = false
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Chọn giao dịch'
end subroutine

public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[]);
if is_object_type <> '' then
	ra_args[1] = is_object_type
else
	ra_args[1] = '%'
end if
return 1
end function

on b_choose_trans.create
call super::create
end on

on b_choose_trans.destroy
call super::destroy
end on

event constructor;call super::constructor;ib_changed_dwo_4edit = false
is_display_model = '1d'
ib_display_text = true
is_object_title = 'Chọn giao dịch'

istr_actionpane[1].s_description = is_object_title
end event

event e_action_ctrl_bttn;//-- override --//

datawindow				ldw_focus
int								li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	//-- control d_action_edit --//
	FOR li_idx = 1 to upperbound(istr_actionpane[]) 
		if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit'then
			if ldw_focus.dynamic f_get_ib_shared() then
				ldw_focus = ldw_focus.dynamic f_getdwmaster()
			end if			
			if ldw_focus.dynamic f_get_ib_detail() then
				if ib_changed_dwo_4edit then
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_refresh;b_okclose;b_close;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_refresh;b_okclose;b_close;'
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_refresh;b_okclose;b_close;'
					else
						istr_actionpane[li_idx].s_visible_buttons ='b_refresh;b_okclose;b_close;'
					end if
				end if
			else				
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_refresh;b_okclose;b_close;'
				else
					istr_actionpane[li_idx].s_visible_buttons='b_refresh;b_okclose;b_close;'
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object'then
			
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage'then	
			
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report'then				
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_e_okclose;//--Override--//
string				ls_return,ls_trans_desc
double			ldb_trans_id
long				ll_row
datawindow 	ldw_main

ldw_main = iw_display.dynamic f_get_dwmain()
ll_row = ldw_main.find('gutter = "Y"', 1, ldw_main.rowcount())
if ll_row = 0 then
	ll_row = ldw_main.getrow()
end if
ldb_trans_id = ldw_main.getitemnumber(ll_row , 'id')
CloseWithReturn (iw_display,ldb_trans_id)
end event

event e_dw_clicked;call super::e_dw_clicked;long 					ll_find, ll_currr

if AncestorReturnValue = 1 then return 1
	if vs_colname = 'gutter' then
		ll_find = rdw_handling.find('gutter = "Y"', ll_find, rdw_handling.rowcount())
		DO while ll_find > 0
			if ll_find > 0 and ll_find <> vl_currentrow then
				rdw_handling.setitem(ll_find ,vs_colname, 'N')
			end if
			ll_find = rdw_handling.find('gutter = "Y"', ll_find + 1, rdw_handling.rowcount() + 1)
		LOOP
	end if
return AncestorReturnValue							
end event

event e_window_e_close;call super::e_window_e_close;return 0
end event

