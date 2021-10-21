$PBExportHeader$t_p.sru
$PBExportComments$top picture control
forward
global type t_p from picture
end type
end forward

global type t_p from picture
integer width = 229
integer height = 204
boolean originalsize = true
boolean focusrectangle = false
end type
global t_p t_p

forward prototypes
public function string f_get_accessible_name ()
public function string f_get_accessible_description ()
public function boolean f_set_visible (boolean vb_visible)
public function string f_gettext ()
end prototypes

public function string f_get_accessible_name ();return this.AccessibleName
end function

public function string f_get_accessible_description ();return this.accessibledescription
end function

public function boolean f_set_visible (boolean vb_visible);this.visible = vb_visible
return this.visible
end function

public function string f_gettext ();return this.tag
end function

on t_p.create
end on

on t_p.destroy
end on

event getfocus;s_object_display			ls_object_display
string 			ls_label_code

//ls_label_code = ls_object_display.f_get_path_classname( this)
if isvalid(t_w_mdi) then 
	t_w_mdi.ids_lang_text.f_set_ttdhelp(ls_label_code,'')
end if 
end event

event constructor;// set user profile

end event

event rbuttondown;//c_popmenu_srv lc_popmenu_srv
t_w_main lw_parent
//lc_popmenu_srv.f_getparentwindow(this, lw_parent)
//lc_popmenu_srv.f_popup_menu( this, lw_parent.parentwindow().pointerX(), lw_parent.parentwindow().pointerY())
end event

