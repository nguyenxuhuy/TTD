$PBExportHeader$u_setup_fin_report.sru
forward
global type u_setup_fin_report from cl_setup_fin_report
end type
end forward

global type u_setup_fin_report from cl_setup_fin_report
end type
global u_setup_fin_report u_setup_fin_report

on u_setup_fin_report.create
call super::create
end on

on u_setup_fin_report.destroy
call super::destroy
end on

event e_window_open;call super::e_window_open;t_dw_mpl			ldw_main
any				laa_value[]

//-- add where customer --//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = 'ACCOUNT'
laa_value[2] = '>=A'
laa_value[3] = '<=Z'
ldw_main.f_add_where('object_ref_table;code;code;',laa_value[])
//--resize parm --//
iw_display.dynamic f_set_ii_upperpart_height(1000)
iw_display.dynamic f_set_ii_leftpart_width(1500)
return 0
end event

