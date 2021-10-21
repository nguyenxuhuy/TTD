$PBExportHeader$c_w_report_preview.srw
forward
global type c_w_report_preview from t_w_report
end type
type dw_1 from t_dw_mpl within c_w_report_preview
end type
type st_1 from t_st within c_w_report_preview
end type
type sle_zoom from t_sle within c_w_report_preview
end type
type htb_1 from t_htb within c_w_report_preview
end type
type cb_criteria from t_cb within c_w_report_preview
end type
type cb_close from t_cb within c_w_report_preview
end type
end forward

global type c_w_report_preview from t_w_report
dw_1 dw_1
st_1 st_1
sle_zoom sle_zoom
htb_1 htb_1
cb_criteria cb_criteria
cb_close cb_close
end type
global c_w_report_preview c_w_report_preview

type variables
t_s_report istr_report
int ii_old_zoom = 100
string is_pic_path
end variables

on c_w_report_preview.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.st_1=create st_1
this.sle_zoom=create sle_zoom
this.htb_1=create htb_1
this.cb_criteria=create cb_criteria
this.cb_close=create cb_close
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.sle_zoom
this.Control[iCurrent+4]=this.htb_1
this.Control[iCurrent+5]=this.cb_criteria
this.Control[iCurrent+6]=this.cb_close
end on

on c_w_report_preview.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.dw_1)
destroy(this.st_1)
destroy(this.sle_zoom)
destroy(this.htb_1)
destroy(this.cb_criteria)
destroy(this.cb_close)
end on

event resize;call super::resize;int li_newwidth, li_newheight
// li_newwidth 
 li_newheight = newheight - t_w_mdi.mdi_1.microhelpheight*2
dw_1.x = 0//ii_left_margin1
dw_1.y = 0//ii_top_margin1
dw_1.width= this.workspacewidth() - ii_left_margin1*2
dw_1.height=li_newheight - ii_top_margin1 - htb_1.height
htb_1.x = ii_left_margin1
htb_1.y = li_newheight - ii_top_margin1 - htb_1.height
sle_zoom.x = htb_1.x + htb_1.width + ii_top_margin1
sle_zoom.y = li_newheight - ii_top_margin1 - sle_zoom.height - 12
st_1.x = sle_zoom.x + sle_zoom.width + ii_top_margin1*2
st_1.y = sle_zoom.y
cb_close.x = this.workspacewidth() - ii_left_margin1 - cb_close.width
cb_close.y = li_newheight - ii_top_margin1 - cb_close.height
cb_criteria.x = this.workspacewidth() - ii_left_margin1*2 - cb_close.width*2
cb_criteria.y = cb_close.y

end event

event e_preopen;call super::e_preopen;If Not IsNull(Message.PowerObjectParm) and IsValid(Message.PowerObjectParm) Then
	istr_report = Message.PowerObjectParm
	IF istr_report.i_printsource <> 1 Then cb_criteria.visible = false
	SetNull( Message.PowerObjectParm)
End If
idw_focus = dw_1
return 0
end event

event closequery;call super::closequery;filedelete(this.is_pic_path)
end event

type dw_1 from t_dw_mpl within c_w_report_preview
integer x = 567
integer y = 196
integer width = 891
integer height = 684
integer taborder = 10
end type

event getfocus;//
end event

event losefocus;//
end event

event constructor;//
end event

event rowfocuschanged;//
end event

event rowfocuschanging;//
end event

type st_1 from t_st within c_w_report_preview
string accessibledescription = "rpt_percent"
integer x = 1344
integer y = 876
integer width = 78
integer height = 80
boolean bringtotop = true
string text = "%"
end type

event constructor;//
end event

type sle_zoom from t_sle within c_w_report_preview
string accessibledescription = "rpttxtpercent"
integer x = 1166
integer y = 876
integer width = 151
integer height = 80
integer taborder = 20
boolean bringtotop = true
string text = "100"
boolean righttoleft = true
end type

event getfocus;//
end event

event modified;call super::modified;int li_zoom

If Not IsNumber(This.Text) Then 
	This.Text = string(ii_old_zoom)
	Return 1
End If

li_zoom = Integer(This.Text)

If li_zoom < 25 Then li_zoom = 25
If li_zoom > 500 Then li_zoom = 500

//dw_1.f_SetZoom(li_zoom)
htb_1.Position = li_zoom - 25
This.Text = string(li_zoom)
ii_old_zoom = li_zoom
end event

type htb_1 from t_htb within c_w_report_preview
string accessibledescription = "rptzoom"
integer x = 238
integer y = 820
integer width = 910
integer height = 144
boolean bringtotop = true
integer maxposition = 475
integer position = 75
integer tickfrequency = 25
integer pagesize = 50
integer linesize = 10
htickmarks tickmarks = hticksontop!
end type

event moved;call super::moved;dw_1.f_SetZoom(this.Position + 25)
sle_zoom.text = string(this.Position + 25)
ii_old_zoom = this.Position + 25
end event

event lineleft;call super::lineleft;dw_1.f_SetZoom(this.Position + 25)
sle_zoom.text = string(this.Position + 25)
ii_old_zoom = this.Position + 25
end event

event lineright;call super::lineright;dw_1.f_SetZoom(this.Position + 25)
sle_zoom.text = string(this.Position + 25)
ii_old_zoom = this.Position + 25
end event

event pageleft;call super::pageleft;dw_1.f_SetZoom(this.Position + 25)
sle_zoom.text = string(this.Position + 25)
ii_old_zoom = this.Position + 25
end event

event pageright;call super::pageright;dw_1.f_SetZoom(this.Position + 25)
sle_zoom.text = string(this.Position + 25)
ii_old_zoom = this.Position + 25
end event

type cb_criteria from t_cb within c_w_report_preview
string accessibledescription = "rptcriteria"
integer x = 1586
integer y = 864
integer width = 389
integer height = 100
integer taborder = 30
boolean bringtotop = true
string text = "Criteria"
end type

event clicked;call super::clicked;//Post close(parent)
istr_report.b_keepscreen = true
//OpenWithParm(c_w_report_criteria,istr_report)

end event

type cb_close from t_cb within c_w_report_preview
string accessibledescription = "rptclose"
integer x = 2011
integer y = 864
integer width = 389
integer height = 100
integer taborder = 40
boolean bringtotop = true
string text = "Close"
end type

event clicked;call super::clicked;close(parent)
end event

