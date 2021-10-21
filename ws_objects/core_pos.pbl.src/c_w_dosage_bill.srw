$PBExportHeader$c_w_dosage_bill.srw
forward
global type c_w_dosage_bill from window
end type
type cb_cancel from t_cb within c_w_dosage_bill
end type
type cb_ok from t_cb within c_w_dosage_bill
end type
type dw_dosage_bill from t_dw_pos within c_w_dosage_bill
end type
end forward

global type c_w_dosage_bill from window
integer width = 2889
integer height = 1880
boolean titlebar = true
string title = "Liều dùng theo bill"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_cancel cb_cancel
cb_ok cb_ok
dw_dosage_bill dw_dosage_bill
end type
global c_w_dosage_bill c_w_dosage_bill

type variables
t_transaction 			it_transaction
double					idb_cust_id
end variables

on c_w_dosage_bill.create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.dw_dosage_bill=create dw_dosage_bill
this.Control[]={this.cb_cancel,&
this.cb_ok,&
this.dw_dosage_bill}
end on

on c_w_dosage_bill.destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.dw_dosage_bill)
end on

event key;if key= keyEnter! then
	if cb_ok.ib_focus then
		cb_ok.event clicked( )
		return 1
	elseif cb_cancel.ib_focus then
		cb_cancel.event clicked( )
		return 1
	else
		Send(Handle(this),256,9,Long(0,0))
		RETURN 1
	end if
end if
end event

event open;string						ls_uom_code
double					ldb_uom_id
c_str_pos				lc_str_pos
b_obj_instantiate		lbo_ins

lc_str_pos = message.powerobjectparm
setnull(message.powerobjectparm)

lbo_ins.f_get_stock_uom( lc_str_pos.dba_data[2] , ldb_uom_id, ls_uom_code)
dw_dosage_bill.insertrow( 0)
dw_dosage_bill.setitem( 1, 'id', lbo_ins.f_create_id( ) )
dw_dosage_bill.setitem( 1, 'object_ref_id', lc_str_pos.dba_data[1])
dw_dosage_bill.setitem( 1, 'object_ref_table', 'SO_LINE')
dw_dosage_bill.setitem( 1, 'uom_code', ls_uom_code)

end event

type cb_cancel from t_cb within c_w_dosage_bill
integer x = 1449
integer y = 1632
integer taborder = 30
string text = "&Hủy"
end type

event clicked;call super::clicked;

close(parent)
end event

type cb_ok from t_cb within c_w_dosage_bill
integer x = 969
integer y = 1632
integer taborder = 20
string text = "&OK"
end type

event clicked;call super::clicked;long				ll_row
t_ds_db			lds_return

dw_dosage_bill.accepttext()
lds_return = create t_ds_db
lds_return.dataobject = dw_dosage_bill.dataobject
dw_dosage_bill.rowscopy( 1, 1, primary!, lds_return, 1, primary!)
closewithreturn(parent, lds_return)
end event

type dw_dosage_bill from t_dw_pos within c_w_dosage_bill
integer x = 27
integer width = 2843
integer height = 1600
integer taborder = 10
string dataobject = "d_dosage_bill_grid"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event e_dwnkey;call super::e_dwnkey;if key= keyEnter! then
	this.accepttext( )
	Send(Handle(this),256,9,Long(0,0))
	RETURN 1

end if
end event

event clicked;call super::clicked;
long			ll_row
string			ls_code, ls_data

if dwo.name = 'gutter' then
	ls_data = this.getitemstring( row, 'gutter')
	if ls_data = 'N' or isnull(ls_data) then		
		ls_code =  this.getitemstring( row, 'code')
		if this.find( "gutter = 'Y'", 1, this.rowcount()) = 0 then
			ll_row = this.find( "code = '" + string(ls_code)+"'" , 1, this.rowcount()) 
			Do while ll_row > 0
				if ll_row <> row then	this.setitem( ll_row, 'gutter', 'Y')
				ll_row = this.find( "code = '" + string(ls_code)+"'" , ll_row + 1, this.rowcount() + 1) 
			loop
		end if
	end if
end if
end event

