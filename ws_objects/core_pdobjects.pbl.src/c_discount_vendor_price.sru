$PBExportHeader$c_discount_vendor_price.sru
forward
global type c_discount_vendor_price from c_valueset_entry
end type
end forward

global type c_discount_vendor_price from c_valueset_entry
end type
global c_discount_vendor_price c_discount_vendor_price

forward prototypes
public subroutine f_set_dwo_window ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_suppliers_discount_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_suppliers_discount_grid'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Nhóm chiết khấu'
end subroutine

on c_discount_vendor_price.create
call super::create
end on

on c_discount_vendor_price.destroy
call super::destroy
end on

event constructor;call super::constructor;is_object_title = 'Nhóm chiết khấu NCC'
istr_actionpane[1].s_description = is_object_title
end event

