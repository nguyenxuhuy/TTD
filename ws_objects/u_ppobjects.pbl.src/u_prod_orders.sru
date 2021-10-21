$PBExportHeader$u_prod_orders.sru
forward
global type u_prod_orders from cl_prod_orders
end type
end forward

global type u_prod_orders from cl_prod_orders
end type
global u_prod_orders u_prod_orders

on u_prod_orders.create
call super::create
end on

on u_prod_orders.destroy
call super::destroy
end on

