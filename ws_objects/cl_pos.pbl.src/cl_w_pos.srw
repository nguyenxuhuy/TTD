$PBExportHeader$cl_w_pos.srw
forward
global type cl_w_pos from c_w_pos
end type
end forward

global type cl_w_pos from c_w_pos
end type
global cl_w_pos cl_w_pos

on cl_w_pos.create
call super::create
end on

on cl_w_pos.destroy
call super::destroy
end on

type dw_func from c_w_pos`dw_func within cl_w_pos
end type

type dw_online from c_w_pos`dw_online within cl_w_pos
end type

type dw_suspend from c_w_pos`dw_suspend within cl_w_pos
end type

type dw_doc from c_w_pos`dw_doc within cl_w_pos
end type

type dw_bill_line from c_w_pos`dw_bill_line within cl_w_pos
end type

type dw_scan_barcode from c_w_pos`dw_scan_barcode within cl_w_pos
end type

type gb_2 from c_w_pos`gb_2 within cl_w_pos
end type

type gb_1 from c_w_pos`gb_1 within cl_w_pos
end type

type st_suspend from c_w_pos`st_suspend within cl_w_pos
end type

type st_online from c_w_pos`st_online within cl_w_pos
end type

