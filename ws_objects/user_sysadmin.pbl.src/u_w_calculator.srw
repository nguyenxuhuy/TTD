$PBExportHeader$u_w_calculator.srw
forward
global type u_w_calculator from c_w_calculator
end type
end forward

global type u_w_calculator from c_w_calculator
string title = "Máy tính"
end type
global u_w_calculator u_w_calculator

on u_w_calculator.create
call super::create
end on

on u_w_calculator.destroy
call super::destroy
end on

type cb_cancel from c_w_calculator`cb_cancel within u_w_calculator
end type

type cb_ok from c_w_calculator`cb_ok within u_w_calculator
end type

type dw_calculator from c_w_calculator`dw_calculator within u_w_calculator
end type

type gb_calc from c_w_calculator`gb_calc within u_w_calculator
end type

