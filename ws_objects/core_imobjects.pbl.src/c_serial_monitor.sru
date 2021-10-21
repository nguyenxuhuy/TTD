$PBExportHeader$c_serial_monitor.sru
forward
global type c_serial_monitor from s_object_display
end type
end forward

global type c_serial_monitor from s_object_display
end type
global c_serial_monitor c_serial_monitor

forward prototypes
public subroutine f_set_dwo_window ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_serial_monitor_form'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_serial_monitor_form'
istr_dwo[1].b_master = false
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = false
istr_dwo[1].b_excel = false
istr_dwo[1].b_keyboardlocked = false
istr_dwo[1].b_traceable = true
istr_dwo[1].s_description = 'Thông tin số serial'

istr_dwo[2].s_dwo_default =  'd_serial_monitor_receipt_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_serial_monitor_receipt_grid'
istr_dwo[2].b_master = false
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = false
istr_dwo[2].b_query = true
istr_dwo[2].b_print = false
istr_dwo[2].b_excel = false
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].b_traceable = true
istr_dwo[2].s_description = 'Thông tin nhập kho'

istr_dwo[3].s_dwo_default =  'd_serial_monitor_delivery_grid'
istr_dwo[3].s_dwo_form = ''
istr_dwo[3].s_dwo_grid = 'd_serial_monitor_delivery_grid'
istr_dwo[3].b_master = false
istr_dwo[3].b_insert = true
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = false
istr_dwo[3].b_query = true
istr_dwo[3].b_print = false
istr_dwo[3].b_excel = false
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].b_traceable = true
istr_dwo[3].s_description = 'Thông tin xuất kho'
end subroutine

on c_serial_monitor.create
call super::create
end on

on c_serial_monitor.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'STREAM_VALUE'
ib_changed_dwo_4edit = true
this.ib_keyboardlocked = true
is_display_model = 'up_1d_lo_1d_1d'
is_object_title = 'Quản lý số serial'
end event

event e_window_e_postopen;call super::e_window_e_postopen;t_dw_mpl	ldw_parm

ldw_parm = iw_display.f_get_dw(istr_dwo[1].s_dwo_default)
ldw_parm.insertrow(0)
return 0
end event

event e_action_ctrl_bttn;return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;string   				ls_serial_no
t_dw_mpl       		ldw_tmp

if AncestorReturnValue = 1 then return 1
	if pos(rpo_dw.dataobject,'d_serial_monitor') > 0 then
		if vs_colname = 'a_serial_no' then
			ldw_tmp = iw_display.f_get_dw('d_serial_monitor_delivery_grid')
			ldw_tmp.retrieve(vs_editdata)
			
			ldw_tmp = iw_display.f_get_dw('d_serial_monitor_receipt_grid')
			ldw_tmp.retrieve(vs_editdata)
		end if
end if
return AncestorReturnValue
end event

event e_window_e_preopen;call super::e_window_e_preopen;
iw_display.dynamic f_set_ii_upperpart_height(228)
iw_display.dynamic f_set_ii_leftpart_width(3100)
return 0
end event

