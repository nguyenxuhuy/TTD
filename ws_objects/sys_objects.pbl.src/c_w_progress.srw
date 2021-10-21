$PBExportHeader$c_w_progress.srw
forward
global type c_w_progress from window
end type
type st_msg from statictext within c_w_progress
end type
type st_value from statictext within c_w_progress
end type
type st_remain from statictext within c_w_progress
end type
type cb_cancel from commandbutton within c_w_progress
end type
type r_value from rectangle within c_w_progress
end type
type st_max from rectangle within c_w_progress
end type
end forward

global type c_w_progress from window
integer x = 1056
integer y = 484
integer width = 1861
integer height = 356
boolean border = false
windowtype windowtype = popup!
long backcolor = 79741120
event type integer ue_show_progress ( integer ai_progress )
st_msg st_msg
st_value st_value
st_remain st_remain
cb_cancel cb_cancel
r_value r_value
st_max st_max
end type
global c_w_progress c_w_progress

type variables
public nonvisualobject parm
public time idt_start
public time idt_last
integer ii_last_value
integer li_step_width
end variables

forward prototypes
public subroutine f_set_st_remain (string vs_text)
end prototypes

event type integer ue_show_progress(integer ai_progress);
if ai_progress <> ii_last_value then
	ii_last_value = ai_progress
else
	RETURN 0
end if

st_value.width = ai_progress * li_step_width
st_msg.text = String(ai_progress) + "%"
return 1
end event

public subroutine f_set_st_remain (string vs_text);st_remain.text = vs_text
end subroutine

on c_w_progress.create
this.st_msg=create st_msg
this.st_value=create st_value
this.st_remain=create st_remain
this.cb_cancel=create cb_cancel
this.r_value=create r_value
this.st_max=create st_max
this.Control[]={this.st_msg,&
this.st_value,&
this.st_remain,&
this.cb_cancel,&
this.r_value,&
this.st_max}
end on

on c_w_progress.destroy
destroy(this.st_msg)
destroy(this.st_value)
destroy(this.st_remain)
destroy(this.cb_cancel)
destroy(this.r_value)
destroy(this.st_max)
end on

event open;environment l_env

parm = message.powerobjectparm

if getenvironment(l_env) <> 1 then
	return
end if

x = (pixelstounits(l_env.screenwidth,xpixelstounits!) - width) / 2
y = (pixelstounits(l_env.screenheight,ypixelstounits!) - height) / 2

idt_start = now()
idt_last = idt_start
li_step_width = st_max.width / 100
parm.postevent("ue_process_work")
return
end event

type st_msg from statictext within c_w_progress
integer x = 1641
integer y = 80
integer width = 183
integer height = 76
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type st_value from statictext within c_w_progress
integer x = 37
integer y = 76
integer width = 18
integer height = 92
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 8388608
boolean focusrectangle = false
end type

type st_remain from statictext within c_w_progress
integer x = 41
integer y = 204
integer width = 1166
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = gb2312charset!
fontpitch fontpitch = variable!
string facename = "Đóng"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type cb_cancel from commandbutton within c_w_progress
integer x = 1248
integer y = 188
integer width = 393
integer height = 108
integer taborder = 20
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Đóng"
boolean default = true
end type

event clicked;parm.triggerevent("ue_cancel")
close(parent)
return
end event

event constructor;text = "Đóng"
return
end event

type r_value from rectangle within c_w_progress
long linecolor = 33554432
linestyle linestyle = transparent!
long fillcolor = 8388608
integer x = 37
integer y = 76
integer width = 18
integer height = 92
end type

type st_max from rectangle within c_w_progress
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 16777215
integer x = 37
integer y = 76
integer width = 1600
integer height = 92
end type

