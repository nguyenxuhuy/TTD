$PBExportHeader$t_g_line.sru
$PBExportComments$Top groupbox for making lines
forward
global type t_g_line from groupbox
end type
end forward

global type t_g_line from groupbox
integer width = 782
integer height = 52
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "SizeNS!"
long textcolor = 33554432
long backcolor = 16776960
string text = "^"
borderstyle borderstyle = styleraised!
event e_mousemove pbm_mousemove
event e_left_mouseup pbm_lbuttonup
event e_rbuttondown pbm_rbuttondown
event e_leftclicked pbm_lbuttonclk
event e_left_mousedown pbm_lbuttondown
end type
global t_g_line t_g_line

type variables
protected:
int ii_click_y, ii_click_x
end variables

forward prototypes
public function string f_get_accessible_description ()
public function string f_get_accessible_name ()
public function string f_gettext ()
public function boolean f_set_visible (boolean vb_visible)
end prototypes

event e_mousemove;if xpos > 25 and xpos < 80 and ypos > 0 and ypos < 50 then
	setpointer(hyperlink!)
end if
end event

event e_left_mouseup;string				ls_display_model
powerobject		lpo_handling

if parent.typeof() = window! then
	lpo_handling = parent.dynamic f_get_obj_handling()	
	if isvalid(lpo_handling) then
		ls_display_model = lpo_handling.dynamic f_get_display_model()
	end if
else
	ls_display_model = parent.dynamic f_get_display_model()
end if
if ls_display_model <> '' then
	parent.dynamic f_resize( ls_display_model)
end if

end event

public function string f_get_accessible_description ();return this.accessibledescription
end function

public function string f_get_accessible_name ();return this.AccessibleName
end function

public function string f_gettext ();return this.text
end function

public function boolean f_set_visible (boolean vb_visible);this.visible = vb_visible
return this.visible
end function

on t_g_line.create
end on

on t_g_line.destroy
end on

