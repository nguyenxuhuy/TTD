$PBExportHeader$s_wr_input.srw
forward
global type s_wr_input from t_w_main
end type
type sle_1 from t_sle within s_wr_input
end type
type p_1 from t_p within s_wr_input
end type
type cb_ok from t_cb within s_wr_input
end type
type cb_cancel from t_cb within s_wr_input
end type
end forward

global type s_wr_input from t_w_main
integer width = 2139
integer height = 508
string title = ""
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
boolean center = true
sle_1 sle_1
p_1 p_1
cb_ok cb_ok
cb_cancel cb_cancel
end type
global s_wr_input s_wr_input

on s_wr_input.create
int iCurrent
call super::create
this.sle_1=create sle_1
this.p_1=create p_1
this.cb_ok=create cb_ok
this.cb_cancel=create cb_cancel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_1
this.Control[iCurrent+2]=this.p_1
this.Control[iCurrent+3]=this.cb_ok
this.Control[iCurrent+4]=this.cb_cancel
end on

on s_wr_input.destroy
call super::destroy
destroy(this.sle_1)
destroy(this.p_1)
destroy(this.cb_ok)
destroy(this.cb_cancel)
end on

event open;//-- override --//

/*******************************************************
Chức năng:
	- Tạo object chính
	- gọi pre-open
	- gọi post-open: chỉ chạy e_postopen khi mở window thành công
------------------------------------------------------------------------------------------------*/

int 						li_rtn
string					ls_parm


ls_parm = message.stringparm
setnull(message.stringparm)

sle_1.text = ls_parm
end event

event e_preopen;call super::e_preopen;int			li_rtn

//-- thông báo đến object --//
li_rtn = ic_obj_main.dynamic event e_window( 'e_preopen')
if li_rtn = -1 then 
	return -1
end if

return li_rtn
end event

type sle_1 from t_sle within s_wr_input
event e_keydown pbm_keydown
integer x = 480
integer y = 108
integer width = 1618
integer taborder = 20
string text = ""
boolean border = false
borderstyle borderstyle = stylebox!
end type

type p_1 from t_p within s_wr_input
integer x = 23
integer y = 32
integer width = 425
integer height = 332
boolean bringtotop = true
boolean originalsize = false
string picturename = "Pics\question2.png"
end type

type cb_ok from t_cb within s_wr_input
integer x = 891
integer y = 264
integer taborder = 10
boolean bringtotop = true
string text = "OK"
boolean default = true
end type

event clicked;call super::clicked;closewithreturn(parent, sle_1.text )
end event

type cb_cancel from t_cb within s_wr_input
integer x = 1294
integer y = 264
integer taborder = 30
boolean bringtotop = true
string text = "Thoát"
end type

event clicked;call super::clicked;closewithreturn(parent, ';exit;' )
end event

