$PBExportHeader$c_w_expired_parm.srw
forward
global type c_w_expired_parm from window
end type
type cb_cancel from t_cb within c_w_expired_parm
end type
type cb_ok from t_cb within c_w_expired_parm
end type
type dw_1 from t_dw_pos within c_w_expired_parm
end type
end forward

global type c_w_expired_parm from window
integer width = 1669
integer height = 716
boolean titlebar = true
string title = "Khách hàng"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_cancel cb_cancel
cb_ok cb_ok
dw_1 dw_1
end type
global c_w_expired_parm c_w_expired_parm

on c_w_expired_parm.create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.dw_1=create dw_1
this.Control[]={this.cb_cancel,&
this.cb_ok,&
this.dw_1}
end on

on c_w_expired_parm.destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.dw_1)
end on

event open;

dw_1.insertrow( 0)
dw_1.setitem( 1, 'exp_day', 180)
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

type cb_cancel from t_cb within c_w_expired_parm
integer x = 855
integer y = 476
integer taborder = 30
string text = "&Hủy"
end type

event clicked;call super::clicked;s_str_data		lstr_data

lstr_data.s_data = 'cancel'

closewithreturn(parent, lstr_data)
end event

type cb_ok from t_cb within c_w_expired_parm
integer x = 375
integer y = 476
integer taborder = 20
string text = "&OK"
end type

event clicked;call super::clicked;
decimal ldc_day, ldc_salesoff, ldc_qty
s_str_data		lstr_data
//-- add item to bill--//

parent.dw_1.accepttext( )

ldc_day = parent.dw_1.getitemnumber(1, 'exp_day')
ldc_salesoff = parent.dw_1.getitemnumber(1, 'sales_off')
ldc_qty = parent.dw_1.getitemnumber(1, 'label_qty')

lstr_data.s_data = 'expired_day'
lstr_data.aa_data[1] = ldc_day
lstr_data.aa_data[2] = ldc_qty
lstr_data.aa_data[3] = ldc_salesoff

closewithreturn(parent, lstr_data)
end event

type dw_1 from t_dw_pos within c_w_expired_parm
integer width = 1650
integer height = 440
integer taborder = 10
string dataobject = "d_expired_parm_form"
end type

event e_dwnkey;call super::e_dwnkey;if key= keyEnter! then
	this.accepttext( )
	Send(Handle(this),256,9,Long(0,0))
	RETURN 1

end if
end event

