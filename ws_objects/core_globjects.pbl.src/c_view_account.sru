$PBExportHeader$c_view_account.sru
forward
global type c_view_account from s_object_display
end type
end forward

global type c_view_account from s_object_display
end type
global c_view_account c_view_account

type variables
protected:

long							il_doc_id
end variables

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_doc_id (long vl_doc_id)
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_view_account_grid'
istr_dwo[1].s_dwo_grid = 'd_view_account_grid'
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_details = ''
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Bút toán ghi sổ'

end subroutine

public subroutine f_set_doc_id (long vl_doc_id);il_doc_id = vl_doc_id
end subroutine

event constructor;call super::constructor;is_table = 'ledger_trans'
ib_changed_dwo_4edit = false
is_display_model = '1d'
ib_display_text = false
is_object_title = 'Xem bút toán ghi sổ'
istr_actionpane[1].s_description = is_object_title

end event

on c_view_account.create
call super::create
end on

on c_view_account.destroy
call super::destroy
end on

event e_window_open;call super::e_window_open;t_dw_mpl			ldw_1, ldw_2
any				laa_value[]
//--form parm--//
ldw_1 = iw_display.dynamic f_get_dw('d_view_account_grid')
laa_value[1] = il_doc_id
ldw_1.f_add_where('doc_id;',laa_value[])
return 0
end event

event e_action_ctrl_bttn;datawindow				ldw_focus
int								li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	if not this.ib_copying then
		//-- control d_action_edit --//
		FOR li_idx = 1 to upperbound(istr_actionpane[]) 
			if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
				istr_actionpane[li_idx].s_visible_buttons = 'b_close'
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

