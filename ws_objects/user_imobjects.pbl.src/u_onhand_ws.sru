$PBExportHeader$u_onhand_ws.sru
forward
global type u_onhand_ws from u_onhand
end type
end forward

global type u_onhand_ws from u_onhand
end type
global u_onhand_ws u_onhand_ws

on u_onhand_ws.create
call super::create
end on

on u_onhand_ws.destroy
call super::destroy
end on

event constructor;call super::constructor;c_connect_srv		lc_connect_srv


lc_connect_srv.f_connect_ws( it_transaction) 

this.f_init_ds_data( )

this.f_arrange_dwdetail( this.iads_detail[] )

this.f_arrage_dwshared( this.iads_share )

this.f_set_md_ms( )
end event

