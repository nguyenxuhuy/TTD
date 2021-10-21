$PBExportHeader$t_rb.sru
$PBExportComments$top radio button
forward
global type t_rb from radiobutton
end type
end forward

global type t_rb from radiobutton
integer width = 402
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "top rb"
end type
global t_rb t_rb

forward prototypes
public function string f_get_accessible_description ()
public function string f_get_accessible_name ()
public function string f_gettext ()
public function boolean f_set_visible (boolean vb_visible)
end prototypes

public function string f_get_accessible_description ();return this.accessibledescription
end function

public function string f_get_accessible_name ();return this.AccessibleName
end function

public function string f_gettext ();return this.text
end function

public function boolean f_set_visible (boolean vb_visible);this.visible = vb_visible
return this.visible
end function

on t_rb.create
end on

on t_rb.destroy
end on

event constructor;
string 			ls_label_code
s_object_display			ls_object_display

// set language
if gs_user_lang <> 'vi-vn' then
//	ls_label_code = ls_object_display.f_get_path_classname( this) 
	if not isnull(ls_label_code) then
		if isvalid(t_w_mdi) then 
			this.text = t_w_mdi.ids_lang_text.f_get_lang_text( ls_label_code, '')
		end if 
	end if
end if


// set user profile

end event

event getfocus;s_object_display			ls_object_display
string 			ls_label_code

//ls_label_code = ls_object_display.f_get_path_classname( this)
if isvalid(t_w_mdi) then 
	t_w_mdi.ids_lang_text.f_set_ttdhelp(ls_label_code,'')
end if 
end event

event rbuttondown;//c_popmenu_srv lc_popmenu_srv
t_w_main lw_parent
//lc_popmenu_srv.f_getparentwindow(this, lw_parent)
//lc_popmenu_srv.f_popup_menu( this, lw_parent.parentwindow().pointerX(), lw_parent.parentwindow().pointerY())
end event

