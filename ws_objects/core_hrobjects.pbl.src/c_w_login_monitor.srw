$PBExportHeader$c_w_login_monitor.srw
forward
global type c_w_login_monitor from window
end type
type dw_2 from t_dw within c_w_login_monitor
end type
type dw_1 from t_dw within c_w_login_monitor
end type
end forward

global type c_w_login_monitor from window
integer width = 3374
integer height = 1408
boolean titlebar = true
string title = "login_monitor"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_2 dw_2
dw_1 dw_1
end type
global c_w_login_monitor c_w_login_monitor

on c_w_login_monitor.create
this.dw_2=create dw_2
this.dw_1=create dw_1
this.Control[]={this.dw_2,&
this.dw_1}
end on

on c_w_login_monitor.destroy
destroy(this.dw_2)
destroy(this.dw_1)
end on

type dw_2 from t_dw within c_w_login_monitor
integer x = 2272
integer width = 1033
integer height = 1084
integer taborder = 20
string dataobject = "d_login_his_grid"
end type

type dw_1 from t_dw within c_w_login_monitor
integer width = 1623
integer height = 1084
integer taborder = 10
string dataobject = "d_login_monitor_form"
end type

