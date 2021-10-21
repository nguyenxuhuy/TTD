$PBExportHeader$c_post_line.sru
forward
global type c_post_line from s_object_display
end type
end forward

global type c_post_line from s_object_display
end type
global c_post_line c_post_line

type variables
protected:

double							idb_doc_id
end variables

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_doc_id (double vdb_doc_id)
public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[])
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_post_line_sum_view_grid'
istr_dwo[1].s_dwo_grid = 'd_post_line_sum_view_grid'
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_details = ''
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Tổng quan ghi sổ'
istr_dwo[1].s_popmenu_items = 'm_filter_detail'

istr_dwo[2].s_dwo_default =  'd_post_line_view_grid'
istr_dwo[2].s_dwo_grid = 'd_post_line_view_grid'
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_description = 'Chi tiết hạch toán ghi sổ'
istr_dwo[2].s_popmenu_items = 'm_filter_detail'

end subroutine

public subroutine f_set_doc_id (double vdb_doc_id);idb_doc_id = vdb_doc_id
end subroutine

public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[]);ra_args[1] = idb_doc_id

return 1
end function

event constructor;call super::constructor;is_table = 'post_line'
ib_changed_dwo_4edit = false
is_display_model = '2d'
ib_display_text = false
is_object_title = 'Xem hạch toán ghi sổ'
istr_actionpane[1].s_description = is_object_title


end event

on c_post_line.create
call super::create
end on

on c_post_line.destroy
call super::destroy
end on

event e_window_open;call super::e_window_open;t_dw_mpl			ldw_1, ldw_2
any				laa_value[]
//--form parm--//
ldw_1 = iw_display.f_get_dw('d_post_line_sum_view_grid')
//laa_value[1] = idb_doc_id
//ldw_1.f_add_where('doc_id;',laa_value[])



ldw_2 = iw_display.dynamic f_get_dw('d_post_line_view_grid')
//laa_value[1] = idb_doc_id
//ldw_2.f_add_where('doc_id;',laa_value[])
ldw_2.event e_retrieve( )
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;//--resize parm --//
iw_display.dynamic f_set_ii_upperpart_height(1000)
this.f_set_resize_wdisplay( 5500, 2500)
return 0
end event

event e_window_e_okclose;
 closewithreturn(iw_display,'booked')
end event

event e_action_ctrl_bttn;datawindow				ldw_focus
string						ls_wdisplay_name
int								li_idx

//ldw_focus = iw_display.dynamic f_get_idwfocus()

//if isvalid(ldw_focus) then
	if not this.ib_copying then
		ls_wdisplay_name = iw_display.classname( )
		//-- control d_action_edit --//
		FOR li_idx = 1 to upperbound(istr_actionpane[]) 
			if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
				if pos(ls_wdisplay_name,'_wr_') > 0 then
					istr_actionpane[li_idx].s_visible_buttons = 'b_okclose;b_close;'
				else
					istr_actionpane[li_idx].s_visible_buttons = 'b_close;'
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
				
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
				
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
//end if
return 0
end event

event e_window_e_close;call super::e_window_e_close;return close(iw_display)
end event

