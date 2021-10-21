$PBExportHeader$c_w_adj_amount.srw
forward
global type c_w_adj_amount from window
end type
type cb_cancel from t_cb within c_w_adj_amount
end type
type cb_ok from t_cb within c_w_adj_amount
end type
type dw_adj_amount from t_dw_pos within c_w_adj_amount
end type
end forward

global type c_w_adj_amount from window
integer width = 1554
integer height = 656
boolean titlebar = true
string title = "Số tiền tăng/giảm"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_cancel cb_cancel
cb_ok cb_ok
dw_adj_amount dw_adj_amount
end type
global c_w_adj_amount c_w_adj_amount

on c_w_adj_amount.create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.dw_adj_amount=create dw_adj_amount
this.Control[]={this.cb_cancel,&
this.cb_ok,&
this.dw_adj_amount}
end on

on c_w_adj_amount.destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.dw_adj_amount)
end on

event open;dw_adj_amount.insertrow( 0)
end event

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

type cb_cancel from t_cb within c_w_adj_amount
integer x = 814
integer y = 404
integer taborder = 30
string text = "&Hủy"
end type

event clicked;call super::clicked;c_str_pos		lc_str_pos

lc_str_pos.s_response = 'cancel'

closewithreturn(parent, lc_str_pos)
end event

type cb_ok from t_cb within c_w_adj_amount
integer x = 393
integer y = 404
integer taborder = 20
string text = "&OK"
end type

event clicked;call super::clicked;double			ldb_adj_amt
c_str_pos		lc_str_pos
//-- add item to bill--//

dw_adj_amount.accepttext()

ldb_adj_amt = parent.dw_adj_amount.getitemnumber(1, 'adj_amt')

if isnull(ldb_adj_amt) then ldb_adj_amt = 0 


if ldb_adj_amt = 0 then
	lc_str_pos.s_response = 'cancel'
else
	lc_str_pos.db_Data = ldb_adj_amt
	lc_str_pos.s_response = 'ok'
end if 
closewithreturn(parent, lc_str_pos)
end event

type dw_adj_amount from t_dw_pos within c_w_adj_amount
integer width = 1531
integer height = 312
integer taborder = 10
string dataobject = "d_adj_amt_form"
end type

event e_dwnkey;call super::e_dwnkey;if key= keyEnter! then
	this.accepttext( )
	Send(Handle(this),256,9,Long(0,0))
	RETURN 1

end if
end event

