$PBExportHeader$cl_w_briefbill.srw
forward
global type cl_w_briefbill from c_w_briefbill
end type
end forward

global type cl_w_briefbill from c_w_briefbill
end type
global cl_w_briefbill cl_w_briefbill

on cl_w_briefbill.create
call super::create
end on

on cl_w_briefbill.destroy
call super::destroy
end on

type cb_cancel from c_w_briefbill`cb_cancel within cl_w_briefbill
end type

type cb_ok from c_w_briefbill`cb_ok within cl_w_briefbill
end type

type dw_briefbill from c_w_briefbill`dw_briefbill within cl_w_briefbill
string title = ""
end type

