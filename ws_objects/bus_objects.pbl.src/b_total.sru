$PBExportHeader$b_total.sru
forward
global type b_total from s_object_display
end type
end forward

global type b_total from s_object_display
end type
global b_total b_total

forward prototypes
public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[])
end prototypes

public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[]);double			ldb_doc_id
window			lw_parent
datawindow	ldw_main

lw_parent = iw_display.dynamic f_getparentwindow()
ldw_main = lw_parent.dynamic f_get_dwmain()
ldb_doc_id = ldw_main.getitemnumber(ldw_main.getrow(),'id')
ra_args[1] = ldb_doc_id
return 1
end function

on b_total.create
call super::create
end on

on b_total.destroy
call super::destroy
end on

event constructor;call super::constructor;ib_changed_dwo_4edit = false
is_display_model = '1d'
ib_display_text = true
is_object_title = 'Xem tổng'

istr_actionpane[1].s_description = is_object_title
end event

event e_window_open;call super::e_window_open;int						li_width
t_dw_mpl				ldw_main
c_string				lc_string

ldw_main = this.iw_display.f_get_dwmain( )
//-- resize window --//
li_width = ldw_main.f_getwidth( )
this.f_set_resize_wdisplay( 2800,1600)
return 0
end event

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
						istr_actionpane[li_idx].s_visible_buttons = ''
					else
						istr_actionpane[li_idx].s_visible_buttons = ''
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons =''
					else
						istr_actionpane[li_idx].s_visible_buttons =''
					end if
				end if
			else				
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons=''
				else
					istr_actionpane[li_idx].s_visible_buttons=''
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
			
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
			
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then				
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

