$PBExportHeader$cl_w_newcustomer.srw
forward
global type cl_w_newcustomer from c_w_newcustomer
end type
end forward

global type cl_w_newcustomer from c_w_newcustomer
string title = "Khách hàng"
end type
global cl_w_newcustomer cl_w_newcustomer

on cl_w_newcustomer.create
call super::create
end on

on cl_w_newcustomer.destroy
call super::destroy
end on

type cb_cancel from c_w_newcustomer`cb_cancel within cl_w_newcustomer
end type

type cb_ok from c_w_newcustomer`cb_ok within cl_w_newcustomer
end type

type dw_newcust from c_w_newcustomer`dw_newcust within cl_w_newcustomer
end type

