$PBExportHeader$u_total_so.sru
forward
global type u_total_so from b_total
end type
end forward

global type u_total_so from b_total
end type
global u_total_so u_total_so

forward prototypes
public subroutine f_set_dwo_window ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_total_so_line_form'
istr_dwo[1].s_dwo_form = 'd_total_so_line_form'
istr_dwo[1].s_dwo_grid = ''
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = false
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = false
istr_dwo[1].s_description = 'Tính tổng'
end subroutine

on u_total_so.create
call super::create
end on

on u_total_so.destroy
call super::destroy
end on

