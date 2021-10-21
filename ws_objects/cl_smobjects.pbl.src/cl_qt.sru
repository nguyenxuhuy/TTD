$PBExportHeader$cl_qt.sru
forward
global type cl_qt from c_qt
end type
end forward

global type cl_qt from c_qt
end type
global cl_qt cl_qt

type variables

end variables

forward prototypes
private function integer f_set_default_new_item (double vl_item_id, string vs_item_code)
end prototypes

private function integer f_set_default_new_item (double vl_item_id, string vs_item_code);long		ll_find

//ll_find = ids_item_interface_bk.find( "id = "+string(vl_item_id), 1, ids_item_interface_bk.rowcount())
//if ll_find > 0 then
//	ids_item_interface_bk.setitem( ll_find, 'short_name', vs_item_code)
////	ids_item_interface_bk.setitem( ll_find, 'manage_grp_code', /*any v */)
//	ids_item_interface_bk.setitem( ll_find, 'post_grp_code', 'HH')
//	ids_item_interface_bk.setitem( ll_find, 'active_yn', 'Y')
////	ids_item_interface_bk.setitem( ll_find, 'uom_code', /*any v */)
//	ids_item_interface_bk.setitem( ll_find, 'round_code', 'CH0')
//	ids_item_interface_bk.setitem( ll_find, 'qty_yn', 'Y')
//	ids_item_interface_bk.setitem( ll_find, 'value_yn', 'Y')
//	ids_item_interface_bk.setitem( ll_find, 'lot_yn', 'N')
//	ids_item_interface_bk.setitem( ll_find, 'serial_yn', 'N')
//	ids_item_interface_bk.setitem( ll_find, 'cost_method', 'periodic_avg') 
//	ids_item_interface_bk.setitem( ll_find, '', /*any v */)
//	ids_item_interface_bk.setitem( ll_find, '', /*any v */)
//	ids_item_interface_bk.setitem( ll_find, '', /*any v */)
//	ids_item_interface_bk.setitem( ll_find, '', /*any v */)
//	ids_item_interface_bk.setitem( ll_find, '', /*any v */)
//	ids_item_interface_bk.setitem( ll_find, '', /*any v */)
//	ids_item_interface_bk.setitem( ll_find, '', /*any v */)
//end if
return 0
end function

on cl_qt.create
call super::create
end on

on cl_qt.destroy
call super::destroy
end on

