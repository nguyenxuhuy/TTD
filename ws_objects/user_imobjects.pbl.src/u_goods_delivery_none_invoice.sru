$PBExportHeader$u_goods_delivery_none_invoice.sru
forward
global type u_goods_delivery_none_invoice from cl_goods_delivery_none_invoice
end type
end forward

global type u_goods_delivery_none_invoice from cl_goods_delivery_none_invoice
end type
global u_goods_delivery_none_invoice u_goods_delivery_none_invoice

on u_goods_delivery_none_invoice.create
call super::create
end on

on u_goods_delivery_none_invoice.destroy
call super::destroy
end on

