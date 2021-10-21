$PBExportHeader$t_sle.sru
$PBExportComments$top single line edit
forward
global type t_sle from singlelineedit
end type
end forward

global type t_sle from singlelineedit
integer width = 402
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "t_sle"
borderstyle borderstyle = stylelowered!
end type
global t_sle t_sle

forward prototypes
public function string f_get_accessible_description ()
public function string f_get_accessible_name ()
public function boolean f_set_visible (boolean vb_visible)
public function string f_gettext ()
end prototypes

public function string f_get_accessible_description ();return this.accessibledescription
end function

public function string f_get_accessible_name ();return this.AccessibleName
end function

public function boolean f_set_visible (boolean vb_visible);this.visible = vb_visible
return this.visible
end function

public function string f_gettext ();return this.text
end function

on t_sle.create
end on

on t_sle.destroy
end on

event rbuttondown;//c_popmenu_srv lc_popmenu_srv
//t_w_main lw_parent
//lc_popmenu_srv.f_getparentwindow(this, lw_parent)
//lc_popmenu_srv.f_popup_menu( this, lw_parent.parentwindow().pointerX(), lw_parent.parentwindow().pointerY())
end event

event getfocus;s_object_display			ls_object_display
string 			ls_label_code

//ls_label_code = ls_object_display.f_get_path_classname( this)
if isvalid(t_w_mdi) then 
	t_w_mdi.ids_lang_text.f_set_ttdhelp(ls_label_code,'')
end if 
end event

event constructor;// set user profile

end event

