$PBExportHeader$c_discount_vendor_price_gr.sru
forward
global type c_discount_vendor_price_gr from c_valueset_entry
end type
end forward

global type c_discount_vendor_price_gr from c_valueset_entry
end type
global c_discount_vendor_price_gr c_discount_vendor_price_gr

forward prototypes
public subroutine f_set_dwo_window ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_suppliers_discount_gr_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_suppliers_discount_gr_grid'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Nhóm chiết khấu tổng'
end subroutine

on c_discount_vendor_price_gr.create
call super::create
end on

on c_discount_vendor_price_gr.destroy
call super::destroy
end on

event constructor;call super::constructor;is_object_title = 'Nhóm chiết khấu tổng'
istr_actionpane[1].s_description = is_object_title
end event

