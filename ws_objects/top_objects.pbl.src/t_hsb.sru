$PBExportHeader$t_hsb.sru
$PBExportComments$top horizontal scroll bar
forward
global type t_hsb from hscrollbar
end type
end forward

global type t_hsb from hscrollbar
string tag = "top"
integer width = 311
integer height = 67
end type
global t_hsb t_hsb

forward prototypes
public function string f_get_accessible_name ()
public function boolean f_set_visible (boolean vb_visible)
end prototypes

public function string f_get_accessible_name ();return this.AccessibleName
end function

public function boolean f_set_visible (boolean vb_visible);this.visible = vb_visible
return this.visible
end function

on t_hsb.create
end on

on t_hsb.destroy
end on

event rbuttondown;//c_popmenu_srv lc_popmenu_srv
t_w_main lw_parent
//lc_popmenu_srv.f_getparentwindow(this, lw_parent)
//lc_popmenu_srv.f_popup_menu( this, lw_parent.parentwindow().pointerX(), lw_parent.parentwindow().pointerY())
end event

