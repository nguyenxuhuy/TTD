$PBExportHeader$u_w_pos.srw
forward
global type u_w_pos from cl_w_pos
end type
end forward

global type u_w_pos from cl_w_pos
end type
global u_w_pos u_w_pos

on u_w_pos.create
call super::create
end on

on u_w_pos.destroy
call super::destroy
end on

type dw_func from cl_w_pos`dw_func within u_w_pos
end type

type dw_online from cl_w_pos`dw_online within u_w_pos
end type

type dw_suspend from cl_w_pos`dw_suspend within u_w_pos
end type

type dw_doc from cl_w_pos`dw_doc within u_w_pos
end type

type dw_bill_line from cl_w_pos`dw_bill_line within u_w_pos
end type

type dw_scan_barcode from cl_w_pos`dw_scan_barcode within u_w_pos
end type

type gb_2 from cl_w_pos`gb_2 within u_w_pos
end type

type gb_1 from cl_w_pos`gb_1 within u_w_pos
end type

type st_suspend from cl_w_pos`st_suspend within u_w_pos
end type

type st_online from cl_w_pos`st_online within u_w_pos
end type

