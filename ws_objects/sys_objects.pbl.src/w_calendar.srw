$PBExportHeader$w_calendar.srw
$PBExportComments$( 0 )openwithparm(w_calendar,str_calendar) 西元年:strcalendar.date_type = "", 民國年: strcalendar.date_type = "chinese", 接收Structure : message.powerobjectParm
forward
global type w_calendar from window
end type
type cb_1 from commandbutton within w_calendar
end type
type hsb_month from hscrollbar within w_calendar
end type
type vsb_year from vscrollbar within w_calendar
end type
type cb_today from commandbutton within w_calendar
end type
type cb_ok from commandbutton within w_calendar
end type
type st_current from statictext within w_calendar
end type
type dw_month from datawindow within w_calendar
end type
type gb_1 from groupbox within w_calendar
end type
end forward

global type w_calendar from window
integer x = 1134
integer y = 664
integer width = 1207
integer height = 1080
boolean titlebar = true
windowtype windowtype = response!
long backcolor = 67108864
boolean center = true
event ue_setmonth ( )
event ue_returnday ( )
cb_1 cb_1
hsb_month hsb_month
vsb_year vsb_year
cb_today cb_today
cb_ok cb_ok
st_current st_current
dw_month dw_month
gb_1 gb_1
end type
global w_calendar w_calendar

type variables
protected integer  wi_i_year, wi_i_month, wi_i_day
protected integer  wi_i_year_prior, wi_i_month_prior
protected integer  wi_i_year_next, wi_i_month_next
protected integer  wi_i_beginpoint
protected integer  wi_i_totalday
protected integer  wi_i_currentpoint
protected integer  wi_i_dateformat = 0
end variables

forward prototypes
public subroutine wf_change_lange (string as_lang_no)
end prototypes

event ue_setmonth();date     ld_monthbegin, ld_day1 , ld_day2, ld_day0
integer  li_i, li_p, li_y, li_m, li_pp, li_totalday_prior
string   ls_dname, ls_day, ls_mod, ls_textcolor
ld_monthbegin = Date(wi_i_year, wi_i_month, 1)
wi_i_beginpoint = DayNumber(ld_monthbegin)
ld_day1 = Date(wi_i_year, wi_i_month, 1)
if wi_i_month = 12 then
   	li_y = wi_i_year + 1
   	li_m = 1
	wi_i_month_prior = 11
	wi_i_month_next = 1	
	wi_i_year_prior = wi_i_year
	wi_i_year_next = wi_i_year + 1
elseif wi_i_month = 1 then
	li_y = wi_i_year
   	li_m = wi_i_month + 1
	wi_i_month_prior = 12
	wi_i_month_next = 2
	wi_i_year_prior = wi_i_year - 1
	wi_i_year_next = wi_i_year 
else
   	li_y = wi_i_year
   	li_m = wi_i_month + 1
	wi_i_month_prior = wi_i_month -1
	wi_i_month_next = wi_i_month +1
	wi_i_year_prior = wi_i_year
	wi_i_year_next = wi_i_year 
end if


ld_day0 =  Date(wi_i_year_prior, wi_i_month_prior, 1)
li_totalday_prior = DaysAfter(ld_day0, ld_day1)

ld_day2 = Date(li_y, li_m, 1)
wi_i_totalday = DaysAfter(ld_day1, ld_day2)
li_p = wi_i_beginpoint
li_pp = wi_i_beginpoint + wi_i_totalday

dw_month.SetRedraw(false)
ls_day = ""
for li_i = 1 to 42	
    ls_mod = "d" + String(li_i)	
    if li_i < wi_i_beginpoint then
       	ls_textcolor = ls_mod+".color=~'0~~trgb(190,190,190)~' " +  "d" + String(li_i) + ".visible=1"
       	dw_month.Modify(ls_textcolor)	
		ls_day += String(li_totalday_prior - li_p + li_i + 1) + "~t"	
	elseif li_i < li_pp then
		if mod(li_i, 7) = 1 then
			ls_textcolor = ls_mod+".color=~'0~~trgb(255,0,0)~' " 
		elseif mod(li_i, 7) = 0 then
			ls_textcolor = ls_mod+".color=~'0~~trgb(0,0,255)~' " 
		else
			ls_textcolor = ls_mod+".color=~'0~~trgb(0,0,0)~' " 
		end if		
		ls_mod += ".border=0 " + "d" + String(li_i) + ".Edit.AutoSelect=NO " + &
						 "d" + String(li_i) + ".visible=1 " + ls_textcolor
		dw_month.Modify(ls_mod)
		ls_day += String(li_i - li_p + 1) + "~t"	
		
	else
      	ls_textcolor = ls_mod+".color=~'0~~trgb(190,190,190)~' " +  "d" + String(li_i) + ".visible=1"
       	dw_month.Modify(ls_textcolor)
		ls_day += String(li_i - li_pp + 1) + "~t"	
	 end if
next
dw_month.Reset()
//dw_month.ImportString(ls_day, 1, 1, 1, li_pp - 1, wi_i_beginpoint)
dw_month.ImportString(ls_day, 1, 1, 1,42, 1)
wi_i_currentpoint = wi_i_day + wi_i_beginpoint - 1
if wi_i_month < 10 then
   st_current.text = "0" + string(wi_i_month)
else
   st_current.text = string(wi_i_month)
end if
if wi_i_dateformat = 0 then
   st_current.text +=  "/" + String(wi_i_year)
else
   st_current.text +=  "/" + String(wi_i_year - 1911)
end if

ls_mod = "d" + String(wi_i_currentpoint) + ".border=5"
dw_month.Modify(ls_mod)
dw_month.SetRedraw(true)
end event

event ue_returnday();string ls_date
ls_date = String(wi_i_year)

	if wi_i_month < 10 then
		ls_date += "0" + String(wi_i_month) //+ "/"
	else
		ls_date += String(wi_i_month) //+ "/"
	end if
	if wi_i_day < 10 then
		ls_date += "0" + String(wi_i_day)
	else
		ls_date += String(wi_i_day)
	end if	

CloseWithReturn(this,ls_date)
end event

public subroutine wf_change_lange (string as_lang_no);if as_lang_no = 'CN' then
		dw_month.Object.a.text = '日'
		dw_month.Object.b.text = '一'
		dw_month.Object.c.text = '二'
		dw_month.Object.d.text = '三'
		dw_month.Object.e.text = '四'
		dw_month.Object.f.text  = '五' 
		dw_month.Object.g.text  = '六'  
		this.Title = '萬年 曆'
		cb_today.text ='今天日期'
		cb_ok.text ='確定'
		cb_1.text ='取消'
		
		dw_month.Modify("a.Font.Face= '標楷體'")
		dw_month.Modify("b.Font.Face= '標楷體'")
		dw_month.Modify("c.Font.Face= '標楷體'")
		dw_month.Modify("d.Font.Face= '標楷體'")
		dw_month.Modify("e.Font.Face= '標楷體'")
		dw_month.Modify("f.Font.Face= '標楷體'")
		dw_month.Modify("g.Font.Face= '標楷體'")
		cb_today.FaceName = '新細明體'
		cb_ok.FaceName = '新細明體'
		cb_1.FaceName = '新細明體'
		
		dw_month.Modify("a.font.height" + "="  + '-14' )
		dw_month.Modify("b.font.height" + "="  + '-14')
		dw_month.Modify("c.font.height" + "="  + '-14')
		dw_month.Modify("d.font.height" + "="  + '-14')
		dw_month.Modify("e.font.height" + "="  + '-14')
		dw_month.Modify("f.font.height" + "="  + '-14')
		dw_month.Modify("g.font.height" + "="  + '-14')
		cb_today.TextSize = 14
		cb_ok.TextSize = 14
		cb_1.TextSize = 14
	elseif as_lang_no = 'VN' then
		dw_month.Object.a.text = 'CN'
		dw_month.Object.b.text = 'Th.2'
		dw_month.Object.c.text = 'Th.3'
		dw_month.Object.d.text = 'Th.4'		
		dw_month.Object.e.text = 'Th.5'		
		dw_month.Object.f.text = 'Th.6'		
		dw_month.Object.g.text = 'Th.7'		
		this.Title = 'Lịch vạn niên'
		cb_today.text ='Ngày hiện tại'
		cb_ok.text ='Đồng ý'
		cb_1.text ='Hủy'
		
		dw_month.Modify("a.Font.Face= 'Tahoma'")
		dw_month.Modify("b.Font.Face= 'Tahoma'")
		dw_month.Modify("c.Font.Face= 'Tahoma'")
		dw_month.Modify("d.Font.Face= 'Tahoma'")
		dw_month.Modify("e.Font.Face= 'Tahoma'")
		dw_month.Modify("f.Font.Face= 'Tahoma'")
		dw_month.Modify("g.Font.Face= 'Tahoma'")
		
		cb_today.FaceName = 'Tahoma'
		cb_ok.FaceName = 'Tahoma'
		cb_1.FaceName = 'Tahoma'
		
		dw_month.Modify("a.font.height" + "="  + '-10')
		dw_month.Modify("b.font.height" + "="  + '-10')
		dw_month.Modify("c.font.height" + "="  + '-10')
		dw_month.Modify("d.font.height" + "="  + '-10')
		dw_month.Modify("e.font.height" + "="  + '-10')
		dw_month.Modify("f.font.height" + "="  + '-10')
		dw_month.Modify("g.font.height" + "="  + '-10')
		
		cb_today.TextSize = 12
		cb_ok.TextSize = 12
		cb_1.TextSize = 12
	elseif as_lang_no = 'EN' then
		dw_month.Object.a.text = 'SUN'
		dw_month.Object.b.text = 'MON'
		dw_month.Object.c.text = 'TUE'
		dw_month.Object.d.text = 'WED'		
		dw_month.Object.e.text = 'THU'		
		dw_month.Object.f.text = 'FRI'		
		dw_month.Object.g.text = 'SAT'		
		
		this.Title = 'Calendar'
		cb_today.text ='Today'
		cb_ok.text ='OK'
		cb_1.text ='Cancel'
		
		dw_month.Modify("a.Font.Face= 'Tahoma'")
		dw_month.Modify("b.Font.Face= 'Tahoma'")
		dw_month.Modify("c.Font.Face= 'Tahoma'")
		dw_month.Modify("d.Font.Face= 'Tahoma'")
		dw_month.Modify("e.Font.Face= 'Tahoma'")
		dw_month.Modify("f.Font.Face= 'Tahoma'")
		dw_month.Modify("g.Font.Face= 'Tahoma'")
		
		cb_today.FaceName = 'Tahoma'
		cb_ok.FaceName = 'Tahoma'
		cb_1.FaceName = 'Tahoma'
		
		dw_month.Modify("a.font.height" + "="  + '-10')
		dw_month.Modify("b.font.height" + "="  + '-10')
		dw_month.Modify("c.font.height" + "="  + '-10')
		dw_month.Modify("d.font.height" + "="  + '-10')
		dw_month.Modify("e.font.height" + "="  + '-10')
		dw_month.Modify("f.font.height" + "="  + '-10')
		dw_month.Modify("g.font.height" + "="  + '-10')
		
		cb_today.TextSize = 12
		cb_ok.TextSize = 12
		cb_1.TextSize = 12
	end if
end subroutine

event open;string ls_date
str_calendar lstr_calendar
lstr_calendar = Message.PowerObjectParm
setnull(Message.PowerObjectParm)
if Lower(lstr_calendar.date_type) = "chinese" then wi_i_dateformat = 1
ls_date = lstr_calendar.date_current
this.title = "Lịch vạn niên"
wi_i_year  = integer(left(ls_date,4))  //Year(ld_date)
wi_i_month = integer(mid(ls_date,5,2)) //Month(ld_date)
wi_i_day   = integer(right(ls_date,2)) //Day(ld_date)
this.TriggerEvent("ue_setmonth")
//wf_change_lange(gs_lang_no)
return 0


end event

on w_calendar.create
this.cb_1=create cb_1
this.hsb_month=create hsb_month
this.vsb_year=create vsb_year
this.cb_today=create cb_today
this.cb_ok=create cb_ok
this.st_current=create st_current
this.dw_month=create dw_month
this.gb_1=create gb_1
this.Control[]={this.cb_1,&
this.hsb_month,&
this.vsb_year,&
this.cb_today,&
this.cb_ok,&
this.st_current,&
this.dw_month,&
this.gb_1}
end on

on w_calendar.destroy
destroy(this.cb_1)
destroy(this.hsb_month)
destroy(this.vsb_year)
destroy(this.cb_today)
destroy(this.cb_ok)
destroy(this.st_current)
destroy(this.dw_month)
destroy(this.gb_1)
end on

type cb_1 from commandbutton within w_calendar
integer x = 713
integer y = 868
integer width = 261
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Thoát"
boolean cancel = true
end type

event clicked;string ls_date
//str_calendar lstr_calendar
//lstr_calendar = Message.PowerObjectParm
//ls_date = lstr_calendar.date_current
setnull(ls_date)
CloseWithReturn(parent,ls_date)

end event

type hsb_month from hscrollbar within w_calendar
integer x = 695
integer width = 169
integer height = 100
boolean stdheight = false
end type

event lineright;// Object: hsb_month in paf_w_calendar
// Event: lineright
// Parameter: (none)
// Return: long
// Writer: Kevin Wu
// Description:

date ld_d1, ld_d2
integer li_offset, li_oldyear, li_oldmonth

if wi_i_month = 12 then 
   if wi_i_year = 3000 then return 0
   wi_i_month = 1
   wi_i_year += 1
else
   wi_i_month += 1
end if
ld_d1 = Date(wi_i_year, wi_i_month, 1)
li_oldyear = wi_i_year
li_oldmonth = wi_i_month

if wi_i_month = 12 then
   if wi_i_year = 3000 then return 0
   wi_i_month = 1
   wi_i_year += 1
else
   wi_i_month += 1
end if
ld_d2 = Date(wi_i_year, wi_i_month, 1)
wi_i_year = li_oldyear
wi_i_month = li_oldmonth

li_offset = DaysAfter(ld_d1, ld_d2)

if wi_i_day > li_offset then
   wi_i_day = li_offset 
end if

parent.PostEvent("ue_setmonth")

return 0
end event

event lineleft;// Object: hsb_month in paf_w_calendar
// Event: lineleft
// Parameter: (none)
// Return: long
// Writer: Kevin Wu
// Description:

date   ld_d1, ld_d2
integer li_offset

ld_d1 = Date(wi_i_year, wi_i_month, 1)
if wi_i_month = 1 then 
   if wi_i_year = 1900 then return 0
   wi_i_month = 12
   wi_i_year -= 1
else
   wi_i_month -= 1
end if

ld_d2 = Date(wi_i_year, wi_i_month, 1)
li_offset = DaysAfter(ld_d2, ld_d1)

if wi_i_day > li_offset then
   wi_i_day = li_offset
end if

parent.PostEvent("ue_setmonth")

return 0
end event

type vsb_year from vscrollbar within w_calendar
integer x = 9
integer width = 101
integer height = 132
boolean stdwidth = false
end type

event linedown;// Object: vsb_year in paf_w_calendar
// Event: linedown
// Parameter: (none)
// Return: long
// Writer: Kevin Wu
// Description:

date ld_d1, ld_d2
integer li_offset

if wi_i_year = 3000 then return 0
wi_i_year += 1

ld_d1 = Date(wi_i_year, wi_i_month, 1)
ld_d2 = Date(wi_i_year, wi_i_month + 1, 1)
li_offset = DaysAfter(ld_d1, ld_d2)

if wi_i_day > li_offset then
   wi_i_day = li_offset
end if

parent.PostEvent("ue_setmonth")

return 0
end event

event lineup;// Object: vsb_year in paf_w_calendar
// Event: lineup
// Parameter: (none)
// Return: long
// Writer: Kevin Wu
// Description:

date   ld_d1, ld_d2
integer li_offset

if wi_i_year = 1900 then return 0
wi_i_year -= 1

ld_d1 = Date(wi_i_year, wi_i_month, 1)
ld_d2 = Date(wi_i_year, wi_i_month + 1, 1)
li_offset = DaysAfter(ld_d1, ld_d2)

if wi_i_day > li_offset then
   wi_i_day = li_offset
end if

parent.PostEvent("ue_setmonth")

return 0
end event

type cb_today from commandbutton within w_calendar
integer x = 859
integer width = 315
integer height = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Hôm nay"
end type

event clicked;date ld_date
ld_date = Today()
wi_i_month = Month(ld_date)
wi_i_year = Year(ld_date)
wi_i_day  = Day(ld_date)
parent.TriggerEvent("ue_setmonth")

return 0
end event

type cb_ok from commandbutton within w_calendar
integer x = 201
integer y = 868
integer width = 288
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Đồng ý"
boolean default = true
end type

event clicked;parent.event trigger ue_returnday()
return 0
end event

type st_current from statictext within w_calendar
integer x = 123
integer y = 8
integer width = 562
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 134217742
boolean enabled = false
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_month from datawindow within w_calendar
event ue_downkey pbm_dwnkey
integer x = 27
integer y = 160
integer width = 1134
integer height = 644
string dataobject = "d_calendar"
boolean border = false
end type

event clicked;string  ls_mod
integer li_dwoname
Boolean lb_match

if String(dwo.Name) = "datawindow" then return 1

li_dwoname = len(trim(String(dwo.Name)))

if li_dwoname > 1   then
	ls_mod = "d" + String(wi_i_currentpoint) + ".border=0 " + &
        dwo.Name + ".border=5"
	dw_month.Modify(ls_mod)
	wi_i_currentpoint = Integer(dwo.ID)
	wi_i_day = wi_i_currentpoint - wi_i_beginpoint + 1
	
	if wi_i_day <= 0 then
		wi_i_day =  integer(this.getitemstring(row, string(dwo.name)))
		wi_i_month = wi_i_month_prior
		wi_i_year = wi_i_year_prior
	elseif wi_i_day > wi_i_totalday then
		wi_i_day = integer(this.getitemstring(row, string(dwo.name)))
		wi_i_month = wi_i_month_next
		wi_i_year = wi_i_year_next
	end if
	
	dw_month.SetRedraw(true)
end if

return 0
end event

event doubleclicked;parent.TriggerEvent("ue_returnday")
return 0
end event

type gb_1 from groupbox within w_calendar
integer x = 18
integer y = 112
integer width = 1152
integer height = 716
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
end type

