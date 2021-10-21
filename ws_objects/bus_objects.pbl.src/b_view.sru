$PBExportHeader$b_view.sru
forward
global type b_view from s_object_display
end type
end forward

global type b_view from s_object_display
end type
global b_view b_view

forward prototypes
public function datawindow f_get_dw_print ()
public subroutine f_set_dwo_window ()
public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[])
public subroutine f_set_actionpane ()
end prototypes

public function datawindow f_get_dw_print ();string				ls_dwo_main
datawindow	ldw_main

ls_dwo_main = this.f_get_main_dwo( )
ldw_main = iw_display.dynamic f_get_dw(ls_dwo_main)
return ldw_main
end function

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  ''
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = ''
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = false
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = false
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = ''
end subroutine

public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[]);any laa_args[]

ra_args = laa_args
return upperbound(ra_args)
end function

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name =  'b_pr;b_so_return;b_goods_delivery;b_sal_invoice;'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

on b_view.create
call super::create
end on

on b_view.destroy
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
						istr_actionpane[li_idx].s_visible_buttons = 'b_modify;b_saveas;b_refresh;b_print;b_sendmail;b_firstpage;b_previouspage;b_nextpage;b_lastpage;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_modify;b_saveas;b_refresh;b_print;b_sendmail;b_firstpage;b_previouspage;b_nextpage;b_lastpage;'
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_modify;b_saveas;b_refresh;b_print;b_sendmail;b_firstpage;b_previouspage;b_nextpage;b_lastpage;'
					else
						istr_actionpane[li_idx].s_visible_buttons ='b_modify;b_saveas;b_refresh;b_print;b_sendmail;b_firstpage;b_previouspage;b_nextpage;b_lastpage;'
					end if
				end if
			else				
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_modify;b_saveas;b_refresh;b_print;b_sendmail;b_firstpage;b_previouspage;b_nextpage;b_lastpage;'
				else
					istr_actionpane[li_idx].s_visible_buttons='b_modify;b_saveas;b_refresh;b_print;b_sendmail;b_firstpage;b_previouspage;b_nextpage;b_lastpage;'
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
			istr_actionpane[li_idx].s_visible_buttons =   ''
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
			istr_actionpane[li_idx].s_visible_buttons =  'b_book;b_attach;b_doc_trace;b_user_trace;'
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

event constructor;call super::constructor;ib_changed_dwo_4edit = false
is_display_model = '1d'
ib_display_text = true
is_object_title = 'In Phiếu'
istr_actionpane[1].s_button_name = 'b_modify;b_saveclose;b_saveas;b_refresh;b_print;b_sendmail;b_firstpage;b_previouspage;b_nextpage;b_lastpage;'
istr_actionpane[1].s_description = is_object_title

istr_report.s_pic_ref_table = 'legal_entity'
istr_report.s_pic_ref_field = 'id'
istr_report.s_pic_ref_colname = 'logo'
end event

event e_window_e_firstpage;call super::e_window_e_firstpage;t_dw_mpl		ldw_form

ldw_form = iw_display.f_get_dwmain( )
ldw_form.event e_firstpage( )
end event

event e_window_e_lastpage;call super::e_window_e_lastpage;t_dw_mpl		ldw_form

ldw_form = iw_display.f_get_dwmain( )
ldw_form.event e_lastpage( )
end event

event e_window_e_nextpage;call super::e_window_e_nextpage;t_dw_mpl		ldw_form

ldw_form = iw_display.f_get_dwmain( )
ldw_form.event e_nextpage( )
end event

event e_window_e_previouspage;call super::e_window_e_previouspage;t_dw_mpl		ldw_form

ldw_form = iw_display.f_get_dwmain( )
ldw_form.event e_previouspage( )
end event

