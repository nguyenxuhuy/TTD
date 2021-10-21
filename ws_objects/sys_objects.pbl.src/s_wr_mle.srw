$PBExportHeader$s_wr_mle.srw
forward
global type s_wr_mle from t_w_main
end type
type p_1 from t_p within s_wr_mle
end type
type mle_1 from t_mle within s_wr_mle
end type
type cb_1 from t_cb within s_wr_mle
end type
type cb_2 from t_cb within s_wr_mle
end type
type cb_3 from t_cb within s_wr_mle
end type
type cb_4 from t_cb within s_wr_mle
end type
end forward

global type s_wr_mle from t_w_main
integer width = 2139
integer height = 884
string title = ""
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
windowstate windowstate = normal!
boolean center = true
p_1 p_1
mle_1 mle_1
cb_1 cb_1
cb_2 cb_2
cb_3 cb_3
cb_4 cb_4
end type
global s_wr_mle s_wr_mle

on s_wr_mle.create
int iCurrent
call super::create
this.p_1=create p_1
this.mle_1=create mle_1
this.cb_1=create cb_1
this.cb_2=create cb_2
this.cb_3=create cb_3
this.cb_4=create cb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.p_1
this.Control[iCurrent+2]=this.mle_1
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.cb_2
this.Control[iCurrent+5]=this.cb_3
this.Control[iCurrent+6]=this.cb_4
end on

on s_wr_mle.destroy
call super::destroy
destroy(this.p_1)
destroy(this.mle_1)
destroy(this.cb_1)
destroy(this.cb_2)
destroy(this.cb_3)
destroy(this.cb_4)
end on

event open;//-- override --//

/*******************************************************
Chức năng:
	- Tạo object chính
	- gọi pre-open
	- gọi post-open: chỉ chạy e_postopen khi mở window thành công
------------------------------------------------------------------------------------------------*/

int 						li_rtn
string						ls_object, ls_parm, las_parm[]
window					lw_requester
error						lerr_system
c_obj_service			lc_obj_service

this.setredraw( false)

ls_parm = message.stringparm
setnull(message.stringparm)
if isnull(ls_parm) or ls_parm='' then
	lerr_system = message.powerobjectparm
	setnull(message.powerobjectparm)
end if

//-- create main object --//
lw_requester = this
if pos(ls_parm,'#') > 0  then
	ic_obj_main = create using 'c_err_message'
	ic_obj_main.dynamic f_init_message(ls_parm)
elseif isvalid(lerr_system) then
	ic_obj_main = create using 'c_err_message'
	ic_obj_main.dynamic f_init_message(lerr_system)	
end if
if isvalid(ic_obj_main) then
	ic_obj_main.dynamic f_set_wdisplay(lw_requester)

	//-- pre-open --//
	if li_rtn <> -1 then
		li_rtn = this.event e_preopen( )
	else		
		//-- message --//
	end if
	
	//-- post open --//
	if li_rtn <> -1 then this.post event e_postopen( li_rtn)
else
	//-- message --//
end if
end event

event e_preopen;call super::e_preopen;int			li_rtn

//-- thông báo đến object --//
li_rtn = ic_obj_main.dynamic event e_window( 'e_preopen')
if li_rtn = -1 then 
	return -1
end if

return li_rtn
end event

type p_1 from t_p within s_wr_mle
integer x = 23
integer y = 32
integer width = 457
integer height = 584
boolean bringtotop = true
boolean originalsize = false
string picturename = "Pics\question2.jpg"
end type

type mle_1 from t_mle within s_wr_mle
integer x = 489
integer y = 32
integer width = 1605
integer height = 584
integer taborder = 10
boolean bringtotop = true
integer textsize = -14
long backcolor = 67108864
boolean autohscroll = true
boolean autovscroll = true
alignment alignment = center!
boolean displayonly = true
end type

type cb_1 from t_cb within s_wr_mle
integer x = 489
integer y = 656
integer taborder = 30
boolean bringtotop = true
end type

event clicked;call super::clicked;closewithreturn(parent,1)
end event

type cb_2 from t_cb within s_wr_mle
integer x = 891
integer y = 656
integer taborder = 40
boolean bringtotop = true
end type

event clicked;call super::clicked;closewithreturn(parent,2)
end event

type cb_3 from t_cb within s_wr_mle
integer x = 1294
integer y = 656
integer taborder = 50
boolean bringtotop = true
end type

event clicked;call super::clicked;closewithreturn(parent,3)
end event

type cb_4 from t_cb within s_wr_mle
integer x = 1696
integer y = 656
integer taborder = 60
boolean bringtotop = true
end type

event clicked;call super::clicked;closewithreturn(parent,4)
end event

