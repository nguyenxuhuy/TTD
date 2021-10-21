$PBExportHeader$c_w_message.srw
$PBExportComments$Core window message
forward
global type c_w_message from t_w_response
end type
type cb_3 from t_cb within c_w_message
end type
type cb_2 from t_cb within c_w_message
end type
type cb_1 from t_cb within c_w_message
end type
type lv_bmp from t_lv within c_w_message
end type
type mle_message from t_mle within c_w_message
end type
type cb_4 from t_cb within c_w_message
end type
end forward

global type c_w_message from t_w_response
integer width = 2190
integer height = 916
string icon = "pics\bamboo2.ico"
boolean toolbarvisible = false
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
lv_bmp lv_bmp
mle_message mle_message
cb_4 cb_4
end type
global c_w_message c_w_message

forward prototypes
public function integer f_paint_window ()
end prototypes

public function integer f_paint_window ();// Default value for the number of chars to replace a tab character.
Integer	li_tabchars = 5

// Default value for the max number of lines in the Message portion. 
// (used for sizing and not the actual number of lines displayed)
Integer 	li_maxlines = 9

// Default value for the number of chars per line in the Message portion.
Integer 	ii_maxlinelen = 60

// Default value for the number of units each char takes.
Integer	li_charwidth = 33
Integer	ii_lineheight = 65

Integer	li_titlelen = 0, li_textlen = 0, li_longestlen = 0, li_startpoint = 1
Integer 	li_msglinelength, li_widthmidpoint, li_msglinecount, li_msgline, li_tabcharlen, li_x, li_y
Long 		ll_counttabs, ll_pos
String 	ls_textline
Window	lw_parent
constant Integer SEPARATOR =50
Constant String TAB='~t'

lv_bmp.X = 43
lv_bmp.Y = 52
lv_bmp.Width = 250
lv_bmp.Height = 164
mle_message.X = 293
mle_message.Y = 52

// Get the number of lines on the Message Text
li_msglinecount = mle_message.LineCount()

// Get the longest Message Text Line Length (li_textlen). 
li_tabcharlen = Len(TAB)

For li_msgline = 1 to li_msglinecount
	// Set the starting position on the next line,
	// loop until the cursor is confirmed on the next line.
	mle_message.SelectText(li_startpoint, 0)	
	Do While mle_message.selectedline() < li_msgline
		li_startpoint++
		mle_message.SelectText(li_startpoint, 0)
	LOOP
	
	// Get the text on the Current Line.
	ls_textline = mle_message.TextLine()

	// Set the starting point to the end of the current line or start of next line..
	li_startpoint += Len(ls_textline) + 1

	// Determine the number of occurrences of the Tab Character.
	ll_counttabs = 0
	ll_Pos = Pos(ls_textline, TAB)
	Do While ll_Pos > 0
		ll_counttabs ++
		ll_Pos = Pos(ls_textline, TAB, (ll_Pos + li_tabcharlen))
	Loop

	// Keep only the longest line length.
	li_msglinelength = mle_message.LineLength()+ (ll_counttabs * li_tabchars)
	If li_msglinelength > li_textlen Then
		li_textlen = li_msglinelength
	End If
Next

// Keep the longest of the Title or Message length.
If li_titlelen > li_textlen Then
	li_longestlen = li_titlelen
Else
	li_longestlen = li_textlen
End If

// Depending on the number of BottomSide buttons visible,
// prevent the window width from getting too small.
If cb_1.Visible And cb_2.Visible=False And cb_3.Visible=False Then
	If li_longestlen < 10 Then
		li_longestlen = 10
	End If
ElseIf cb_1.Visible And cb_2.Visible And cb_3.Visible=False Then
	If li_longestlen < 20 Then
		li_longestlen = 20
	End If
Else
	If li_longestlen < 30 Then
		li_longestlen = 30
	End If
End If

// Set the appropriate attributes for the Message MLE.
If li_msglinecount > li_maxlines Then 
	mle_message.VScrollbar = True
	li_longestlen += 4
End If

// According to the text inside the Message Text, 
// resize the Message control.  (Check for predefined min/max)
If li_msglinecount < 2 Then
	// Prevent BottomSide control from moving up too much.
	li_msglinecount = 2
End If
If li_longestlen > ii_maxlinelen Then
	// Prevent the width from going over the set max.
//	li_longestlen = ii_maxlinelen
End If
If li_msglinecount > li_maxlines Then
	// Prevent the Height from going over the set max.	
	li_msglinecount = li_maxlines
End If
mle_message.Resize(li_longestlen * li_charwidth , &
						 li_msglinecount * ii_lineheight+50)


// Set the width of the window according to the size of
// the Message and the RightSide buttons.
This.Width = mle_message.X + mle_message.Width + SEPARATOR + 30

// Move the BottomSide Buttons right under the Message.
cb_1.Y = mle_message.Y + mle_message.Height + SEPARATOR
cb_2.Y = mle_message.Y + mle_message.Height + SEPARATOR
cb_3.Y = mle_message.Y + mle_message.Height + SEPARATOR
cb_4.Y = mle_message.Y + mle_message.Height + SEPARATOR

// Center the BottomSide Buttton(s).  (if visible, offset some 
//	for the print and userinput buttons.)
li_widthmidpoint = This.Width / 2

If cb_1.Visible And cb_2.Visible=False And cb_3.Visible=False and  cb_4.Visible=False Then
	cb_1.x = li_widthmidpoint - (cb_1.Width / 2)
ElseIf cb_1.Visible And cb_2.Visible And cb_3.Visible=False and  cb_4.Visible=False Then
	cb_1.x = li_widthmidpoint - (cb_1.Width +20)
	cb_2.x = li_widthmidpoint +20
ElseIf cb_1.Visible And cb_2.Visible And cb_3.Visible and  cb_4.Visible=False Then
	cb_1.x = li_widthmidpoint - ((cb_1.Width +20) + (cb_1.width/2))
	cb_2.x = li_widthmidpoint - (cb_2.width/2)
	cb_3.x = li_widthmidpoint + (cb_3.width/2 +20)
else
	cb_1.x = li_widthmidpoint - ((cb_1.Width +20) + cb_2.width + 10 )
	cb_2.x = li_widthmidpoint - (cb_2.Width + 10)
	cb_3.x = li_widthmidpoint + 10
	cb_4.x = li_widthmidpoint + 10 + cb_3.width + 20
End If

// Adjust the Height of the window to hide the User Input space.
This.Height = cb_1.Y + cb_1.Height + 100 + SEPARATOR

// Center the window on the Parent window.
lw_parent = ParentWindow()
If IsValid (lw_parent) Then
	li_x = lw_parent.x + lw_parent.width/2  - This.width/2 - 100
	If li_x < 0 Then li_x = 0
	li_y = lw_parent.y + lw_parent.height/2 - This.height/2 - 100
	If li_y < 0 Then li_y = 0	
	This.Move(li_x, li_y)
End If

Return 1
end function

event open;call super::open;Integer	li_rc, li_index, li_bmp, li_count
String 	ls_msgid, ls_msgtitle, ls_msgtext, ls_msgicon, ls_msgbutton, ls_msgdefaultbutton, ls_language, ls_obj_name
String		ls_sublabel_id, ls_arg[]
ListViewItem	llvi_item
//c_ds_lang lnv_lang
//lnv_lang = create c_ds_lang 
c_obj_service lobj_srv

ls_sublabel_id ='msg'

ls_msgid = Message.StringParm
setnull(Message.StringParm)
li_count = lobj_srv.f_StringToArray(ls_msgid, ';', ls_arg)
If li_count > 1 Then
	ls_msgid = ls_arg[1]
End If

//Select el.microhelp, el.text, em.msg_icon, em.msg_button, em.msg_defaultbutton, em.obj_name
//	into :ls_msgtitle, :ls_msgtext, :ls_msgicon, :ls_msgbutton, :ls_msgdefaultbutton, :ls_obj_name
//		from erp_message em, erp_label el
//			where em.msg_id = el.label_id 
//			and em.msg_id=  :ls_msgid 
//			and el.lang_id = :gs_user_lang;
//			
If SQLCA.SQLCode <> 0 Then
//	Select el.microhelp, el.text, em.msg_icon, em.msg_button, em.msg_defaultbutton
//	into :ls_msgtitle, :ls_msgtext, :ls_msgicon, :ls_msgbutton, :ls_msgdefaultbutton
//		from erp_message em, erp_label el
//			where em.msg_id = el.label_id 
//			and em.msg_id=  'msg_not_defined'
//			and el.lang_id = :gs_user_lang;
	
	If SQLCA.SQLCode <> 0 Then
		MessageBox('Error','Message Error: ' + SQLCA.SQLErrText)
		close(this)
		Return
	End If
	ls_msgtext = ls_msgtext+': '+ls_msgid+'('+ls_obj_name+')'
End If

This.title = ls_msgtitle
If li_count > 1 Then
	mle_message.Text =  ls_msgtext + ':~r~n' + ls_arg[2]
Else
	mle_message.Text =  ls_msgtext
End If

Choose Case Lower(ls_msgicon)
	Case 'information'
			li_bmp = 1
	Case 'stopsign'
			li_bmp = 2
	Case 'exclamation'
			li_bmp = 3
	Case 'question'
			li_bmp = 4
	Case Else
			li_bmp = 0
End Choose

If li_bmp > 0 Then
	llvi_item.PictureIndex = li_bmp
	li_Index = lv_bmp.AddItem(llvi_item)
	lv_bmp.SetItem(1, llvi_item)
	llvi_item.ItemX = -100
	llvi_item.ItemY = 5	
Else
	lv_bmp.Visible = False
End If


// As requested, display/enable the appropriate button(s).
ls_msgbutton = Lower(ls_msgbutton)
Choose Case ls_msgbutton
	Case 'ok'
//			cb_1.Text =t_w_mdi.ids_lang_text.f_get_lang_text( 'cb_ok', ls_sublabel_id)
			cb_1.Default = True
			cb_1.SetFocus()
			
			cb_1.Visible = True
			cb_2.Visible = False
			cb_3.Visible = False
			cb_4.Visible = False
	Case 'okcancel', 'yesno', 'retrycancel'
			If ls_msgbutton = 'okcancel' Then
//				cb_1.Text = t_w_mdi.ids_lang_text.f_get_lang_text( 'cb_ok', ls_sublabel_id)
				cb_2.Text = t_w_mdi.ids_lang_text.f_get_lang_text( 'cb_cancel', ls_sublabel_id)
			ElseIf ls_msgbutton = 'yesno' Then
				cb_1.Text = t_w_mdi.ids_lang_text.f_get_lang_text( 'cb_yes', ls_sublabel_id)
				cb_2.Text = t_w_mdi.ids_lang_text.f_get_lang_text( 'cb_no', ls_sublabel_id)
			Else
				cb_1.Text = t_w_mdi.ids_lang_text.f_get_lang_text( 'cb_retry', ls_sublabel_id)
				cb_2.Text = t_w_mdi.ids_lang_text.f_get_lang_text( 'cb_cancel', ls_sublabel_id)
			End If
			
			If ls_msgdefaultbutton = '2' Then
				cb_2.default = True
				cb_2.SetFocus()
			Else
				cb_1.default = True
				cb_1.SetFocus()				
			End If
			
			cb_1.visible = True
			cb_2.visible = True
			cb_3.Visible = False				
			cb_4.Visible = False
	Case 'yesnocancel', 'abortretryignore', 'yesyestoallno'
			If ls_msgbutton = 'yesnocancel' Then		
				cb_1.Text = t_w_mdi.ids_lang_text.f_get_lang_text( 'cb_yes', ls_sublabel_id)
				cb_2.Text = t_w_mdi.ids_lang_text.f_get_lang_text( 'cb_no', ls_sublabel_id)
				cb_3.Text = t_w_mdi.ids_lang_text.f_get_lang_text( 'cb_cancel', ls_sublabel_id)
			Elseif ls_msgbutton = 'abortretryignore' then
				cb_1.Text = t_w_mdi.ids_lang_text.f_get_lang_text( 'cb_abort', ls_sublabel_id)
				cb_2.Text = t_w_mdi.ids_lang_text.f_get_lang_text( 'cb_retry', ls_sublabel_id)
				cb_3.Text = t_w_mdi.ids_lang_text.f_get_lang_text( 'cb_ignore', ls_sublabel_id)
			elseif ls_msgbutton = 'yesyestoallno' then
				cb_1.Text = t_w_mdi.ids_lang_text.f_get_lang_text( 'cb_yes', ls_sublabel_id)
				cb_2.Text = t_w_mdi.ids_lang_text.f_get_lang_text( 'cb_yestoall', ls_sublabel_id)
				cb_3.Text = t_w_mdi.ids_lang_text.f_get_lang_text( 'cb_no', ls_sublabel_id)		
			End If
				
			If ls_msgdefaultbutton = '3' Then
				cb_3.default = True
				cb_3.SetFocus()
			ElseIf ls_msgdefaultbutton = '2' Then
				cb_2.default = True
				cb_2.SetFocus()
			Else
				cb_1.default = True
				cb_1.SetFocus()
			End If			

			cb_1.visible = True
			cb_2.visible = True
			cb_3.visible = True
			cb_4.Visible = False
	case 'yesyestoallnonotoall'
			cb_1.Text = t_w_mdi.ids_lang_text.f_get_lang_text( 'cb_yes', ls_sublabel_id)
			cb_2.Text = t_w_mdi.ids_lang_text.f_get_lang_text( 'cb_yestoall', ls_sublabel_id)
			cb_3.Text = t_w_mdi.ids_lang_text.f_get_lang_text( 'cb_no', ls_sublabel_id)		
			cb_4.Text = t_w_mdi.ids_lang_text.f_get_lang_text( 'cb_notoall', ls_sublabel_id)	
				
			If ls_msgdefaultbutton = '3' Then
				cb_3.default = True
				cb_3.SetFocus()
			ElseIf ls_msgdefaultbutton = '2' Then
				cb_2.default = True
				cb_2.SetFocus()
			ElseIf ls_msgdefaultbutton = '1' Then
				cb_1.default = True
				cb_1.SetFocus()
			ElseIf ls_msgdefaultbutton = '4' Then
				cb_4.default = True
				cb_4.SetFocus()				
			End If			

			cb_1.visible = True
			cb_2.visible = True
			cb_3.visible = True
			cb_4.Visible = True	
			
End Choose

// Size and Move controls around to	match the window information.
f_paint_window()


end event

on c_w_message.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.lv_bmp=create lv_bmp
this.mle_message=create mle_message
this.cb_4=create cb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.lv_bmp
this.Control[iCurrent+5]=this.mle_message
this.Control[iCurrent+6]=this.cb_4
end on

on c_w_message.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.lv_bmp)
destroy(this.mle_message)
destroy(this.cb_4)
end on

event resize;call super::resize;if cb_4.visible = true then
	cb_1.x = 4
	this.width = cb_1.x + 4*cb_1.width + 100
end if
end event

type cb_cancel from t_w_response`cb_cancel within c_w_message
boolean visible = false
integer taborder = 30
end type

event cb_cancel::constructor;//
end event

event cb_cancel::getfocus;//
end event

type cb_ok from t_w_response`cb_ok within c_w_message
boolean visible = false
end type

event cb_ok::constructor;//
end event

event cb_ok::getfocus;call super::getfocus;//
end event

type cb_3 from t_cb within c_w_message
integer x = 1175
integer y = 448
integer taborder = 3
end type

event clicked;call super::clicked;CloseWithReturn(parent, 3)
end event

event constructor;//
end event

event getfocus;//
end event

event rbuttondown;call super::rbuttondown;//
end event

type cb_2 from t_cb within c_w_message
integer x = 626
integer y = 448
integer taborder = 2
end type

event clicked;call super::clicked;CloseWithReturn(parent, 2)
end event

event constructor;//
end event

event getfocus;//
end event

event rbuttondown;call super::rbuttondown;//
end event

type cb_1 from t_cb within c_w_message
integer x = 183
integer y = 448
integer taborder = 1
end type

event clicked;call super::clicked;CloseWithReturn(parent, 1)
end event

event constructor;//
end event

event getfocus;//
end event

event rbuttondown;//
end event

type lv_bmp from t_lv within c_w_message
integer x = 105
integer y = 76
integer width = 306
integer height = 256
long backcolor = 67108864
boolean border = false
borderstyle borderstyle = stylebox!
boolean scrolling = false
string largepicturename[] = {"pics\info.bmp","pics\stop.bmp","pics\excl.bmp","pics\quest.bmp"}
long largepicturemaskcolor = 12632256
end type

event getfocus;//
end event

event constructor;//
end event

event rightclicked;call super::rightclicked;//
end event

type mle_message from t_mle within c_w_message
integer x = 466
integer y = 76
integer width = 1509
integer height = 332
long backcolor = 67108864
boolean border = false
boolean autohscroll = true
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylebox!
boolean hideselection = false
end type

event constructor;//
end event

event getfocus;//
end event

event rbuttondown;//
end event

type cb_4 from t_cb within c_w_message
integer x = 1627
integer y = 448
integer taborder = 4
boolean bringtotop = true
end type

event clicked;call super::clicked;CloseWithReturn(parent, 4)
end event

event constructor;call super::constructor;//
end event

event getfocus;//
end event

event rbuttondown;call super::rbuttondown;//
end event

