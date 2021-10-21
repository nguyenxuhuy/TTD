$PBExportHeader$u_goods_receiving.sru
forward
global type u_goods_receiving from cl_goods_receiving
end type
end forward

global type u_goods_receiving from cl_goods_receiving
end type
global u_goods_receiving u_goods_receiving

on u_goods_receiving.create
call super::create
end on

on u_goods_receiving.destroy
call super::destroy
end on

