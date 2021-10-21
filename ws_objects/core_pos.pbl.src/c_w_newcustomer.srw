$PBExportHeader$c_w_newcustomer.srw
forward
global type c_w_newcustomer from window
end type
type cb_cancel from t_cb within c_w_newcustomer
end type
type cb_ok from t_cb within c_w_newcustomer
end type
type dw_newcust from t_dw_pos within c_w_newcustomer
end type
end forward

global type c_w_newcustomer from window
integer width = 1961
integer height = 948
boolean titlebar = true
string title = "Khách hàng"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_cancel cb_cancel
cb_ok cb_ok
dw_newcust dw_newcust
end type
global c_w_newcustomer c_w_newcustomer

on c_w_newcustomer.create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.dw_newcust=create dw_newcust
this.Control[]={this.cb_cancel,&
this.cb_ok,&
this.dw_newcust}
end on

on c_w_newcustomer.destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.dw_newcust)
end on

event open;string			ls_data

ls_data = message.stringparm
setnull(message.stringparm)

dw_newcust.insertrow( 0)
dw_newcust.setitem( 1, 'code', ls_data)
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

type cb_cancel from t_cb within c_w_newcustomer
integer x = 855
integer y = 732
integer taborder = 30
string text = "&Hủy"
end type

event clicked;call super::clicked;c_str_pos		lc_str_pos

lc_str_pos.s_response = 'cancel'

closewithreturn(parent, lc_str_pos)
end event

type cb_ok from t_cb within c_w_newcustomer
integer x = 375
integer y = 732
integer taborder = 20
string text = "&OK"
end type

event clicked;call super::clicked;string			ls_code, ls_name, ls_member
date			ld_dob
decimal 		ldc_age
c_str_pos		lc_str_pos
//-- add item to bill--//

parent.dw_newcust.accepttext( )

ls_code = parent.dw_newcust.getitemstring(1, 'code')
ls_name = parent.dw_newcust.getitemstring(1, 'name')
ls_member = parent.dw_newcust.getitemstring(1, 'member_card')
ldc_age =parent.dw_newcust.getitemnumber(1, 'age')
ld_dob = date(parent.dw_newcust.getitemdatetime(1, 'dob'))
if isnull(ls_code) then ls_code = ''
if isnull(ls_name) then ls_name = '' 
if isnull(ls_member) then ls_member = '' 

if ls_code = '' and ls_name = '' then
	lc_str_pos.s_response = 'cancel'
else
	lc_str_pos.s_data[1] = ls_code 
	lc_str_pos.s_data[2] = ls_name
	lc_str_pos.s_data[3] = ls_member
	lc_str_pos.db_data = ldc_age
	lc_str_pos.d_date  = ld_dob
	lc_str_pos.s_response = 'ok'
end if 
closewithreturn(parent, lc_str_pos)
end event

type dw_newcust from t_dw_pos within c_w_newcustomer
integer width = 1943
integer height = 640
integer taborder = 10
string dataobject = "d_newcust_form"
end type

event e_dwnkey;call super::e_dwnkey;if key= keyEnter! then
	this.accepttext( )
	Send(Handle(this),256,9,Long(0,0))
	RETURN 1

end if
end event

