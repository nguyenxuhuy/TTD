$PBExportHeader$s_w_mle.srw
forward
global type s_w_mle from t_w_main
end type
type cb_4 from t_cb within s_w_mle
end type
type cb_3 from t_cb within s_w_mle
end type
type cb_2 from t_cb within s_w_mle
end type
type cb_1 from t_cb within s_w_mle
end type
type mle_1 from t_mle within s_w_mle
end type
type p_1 from t_p within s_w_mle
end type
end forward

global type s_w_mle from t_w_main
integer width = 2153
integer height = 908
string title = ""
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowstate windowstate = normal!
boolean clientedge = false
boolean center = true
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
mle_1 mle_1
p_1 p_1
end type
global s_w_mle s_w_mle

on s_w_mle.create
int iCurrent
call super::create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.mle_1=create mle_1
this.p_1=create p_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_4
this.Control[iCurrent+2]=this.cb_3
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.mle_1
this.Control[iCurrent+6]=this.p_1
end on

on s_w_mle.destroy
call super::destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.mle_1)
destroy(this.p_1)
end on

event open;call super::open;/*******************************************************
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
is_popmenu = 'm_edit_window_label;'

//-- create main object --//
lw_requester = this
if pos(ls_parm,'#') > 0  then
	ic_obj_main = create using 'c_err_message'
	ic_obj_main.dynamic f_init_message(ls_parm)
elseif isvalid(lerr_system) then
	ic_obj_main = create using 'c_err_message'
	ic_obj_main.dynamic f_init_message(lerr_system)	
else
	lc_obj_service.f_stringtoarray(ls_parm ,";",las_parm[])
	ic_obj_main = create using las_parm[1]
	//-- ghi nhớ menu_id của window được open --//
	if las_parm[2] <> '0' then
		ic_obj_main.dynamic f_set_menu_id(las_parm[2])
		//-- Cập nhật picture index cua menu --//
		t_w_menu.f_change_pic_idx(ic_obj_main, 'open')
	end if	
end if
if isvalid(ic_obj_main) then
	ic_obj_handling = ic_obj_main
	ic_obj_main.dynamic f_set_wdisplay(lw_requester)

	//-- pre-open --//
	if li_rtn <> -1 then
		li_rtn = this.event e_preopen( )
	else		
		//-- message --//
	end if
	
	//-- post open --//
	if li_rtn <> -1 then this.post event e_postopen(li_rtn )
else
	//-- message --//
end if
end event

event e_preopen;call super::e_preopen;
int			li_rtn

//-- thông báo đến object --//
li_rtn = ic_obj_handling.dynamic event e_window( 'e_preopen')
if li_rtn = -1 then 
	return -1
end if

return li_rtn

end event

event e_postopen;call super::e_postopen;/*****************************************************************
Chức năng: Thống báo đến object
===================================================*/
int				li_rtn

//-- Neu preopen object return 0 thi thuc hien retrieve idw_focus --//
li_rtn = ic_obj_handling.dynamic event e_window( 'e_postopen')

this.setredraw( true)

if li_rtn = -1 then 
	return -1
end if
end event

event rbuttondown;int							li_rtn

t_m_popup_object		lm_popup
window					lw_request


//-- thong báo object rightclick truoc khi thực hiện-- //
lw_request = this
li_rtn = this.f_send_message_to_object(lw_request, 'rightclicked')
if li_rtn = -1 then 
	return -1
end if

lm_popup = create	t_m_popup_object
lm_popup.is_show_menu = is_popmenu
lm_popup.is_object_name = this.classname()

//-- Thông báo cho object popup --//
li_rtn = this.f_send_message_to_object(lm_popup, 'popup')
if li_rtn = -1 then 
	destroy lm_popup
	return -1
end if

//-- show popup menu --//
lm_popup.popmenu( this.pointerX() , this.pointerY() )

//-- xử lý khi user click chọn popmenu --//
if 'm_edit_window_label' = lm_popup.is_clicked_menu  then
	this.dynamic f_openchildwithparm('s_w_tv_md','c_label_window;0')
elseif 'm_setup_user_access'  = lm_popup.is_clicked_menu  then
elseif 'm_setup_alert' = lm_popup.is_clicked_menu  then
elseif 'm_setup_dw' = lm_popup.is_clicked_menu  then
end if

//-- Thông báo cho object menu duoc click--//
if lm_popup.is_clicked_menu <> '' then
	li_rtn = this.f_send_message_to_object(lm_popup, 'clicked')
end if


destroy lm_popup
end event

type cb_4 from t_cb within s_w_mle
integer x = 1691
integer y = 688
integer taborder = 50
end type

type cb_3 from t_cb within s_w_mle
integer x = 1289
integer y = 688
integer taborder = 40
end type

type cb_2 from t_cb within s_w_mle
integer x = 887
integer y = 688
integer taborder = 30
end type

type cb_1 from t_cb within s_w_mle
integer x = 485
integer y = 688
integer taborder = 20
end type

event clicked;call super::clicked;close(parent)
end event

type mle_1 from t_mle within s_w_mle
integer x = 485
integer y = 64
integer width = 1605
integer height = 584
integer taborder = 10
integer textsize = -14
long backcolor = 67108864
boolean autohscroll = true
boolean autovscroll = true
alignment alignment = center!
boolean displayonly = true
end type

type p_1 from t_p within s_w_mle
integer x = 18
integer y = 64
integer width = 457
integer height = 584
boolean originalsize = false
string picturename = "Pics\question2.jpg"
end type

