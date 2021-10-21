$PBExportHeader$u_w_briefbill.srw
forward
global type u_w_briefbill from cl_w_briefbill
end type
end forward

global type u_w_briefbill from cl_w_briefbill
string tag = " "
end type
global u_w_briefbill u_w_briefbill

on u_w_briefbill.create
call super::create
end on

on u_w_briefbill.destroy
call super::destroy
end on

type cb_cancel from cl_w_briefbill`cb_cancel within u_w_briefbill
end type

type cb_ok from cl_w_briefbill`cb_ok within u_w_briefbill
end type

type dw_briefbill from cl_w_briefbill`dw_briefbill within u_w_briefbill
end type

