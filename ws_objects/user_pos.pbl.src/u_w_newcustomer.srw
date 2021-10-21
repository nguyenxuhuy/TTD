$PBExportHeader$u_w_newcustomer.srw
forward
global type u_w_newcustomer from cl_w_newcustomer
end type
end forward

global type u_w_newcustomer from cl_w_newcustomer
end type
global u_w_newcustomer u_w_newcustomer

on u_w_newcustomer.create
call super::create
end on

on u_w_newcustomer.destroy
call super::destroy
end on

type cb_cancel from cl_w_newcustomer`cb_cancel within u_w_newcustomer
end type

type cb_ok from cl_w_newcustomer`cb_ok within u_w_newcustomer
end type

type dw_newcust from cl_w_newcustomer`dw_newcust within u_w_newcustomer
end type

