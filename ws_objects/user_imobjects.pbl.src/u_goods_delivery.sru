$PBExportHeader$u_goods_delivery.sru
forward
global type u_goods_delivery from cl_goods_delivery
end type
end forward

global type u_goods_delivery from cl_goods_delivery
end type
global u_goods_delivery u_goods_delivery

on u_goods_delivery.create
call super::create
end on

on u_goods_delivery.destroy
call super::destroy
end on

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;if pos(rpo_dw.dataobject,'d_inventory_line') > 0 then
	rpo_dw.setitem(vl_currentrow,'created_by',gi_userid)
end if
return vl_currentrow
end event

