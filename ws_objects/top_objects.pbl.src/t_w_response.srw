$PBExportHeader$t_w_response.srw
$PBExportComments$top window response
forward
global type t_w_response from window
end type
type cb_cancel from t_cb within t_w_response
end type
type cb_ok from t_cb within t_w_response
end type
end forward

global type t_w_response from window
integer width = 3141
integer height = 1712
boolean titlebar = true
string title = "top reponse"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "pics\bamboo100.ico"
boolean center = true
event e_resize ( integer vi_newwidth,  integer vi_newheight )
event type integer e_preopen ( )
event type integer e_postopen ( )
cb_cancel cb_cancel
cb_ok cb_ok
end type
global t_w_response t_w_response

type variables

Protected:
boolean 			ib_resize = true
int 				ii_left_margin1 = 5, ii_right_margin1 = 5, ii_top_margin1 = 2, ii_bottom_margin1 = 2
powerobject		ic_obj_main 
end variables

on t_w_response.create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.Control[]={this.cb_cancel,&
this.cb_ok}
end on

on t_w_response.destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
end on

type cb_cancel from t_cb within t_w_response
integer x = 1033
integer y = 1312
integer taborder = 20
string text = "Cancel"
end type

type cb_ok from t_cb within t_w_response
integer x = 1033
integer y = 1180
integer taborder = 10
string text = "OK"
end type

