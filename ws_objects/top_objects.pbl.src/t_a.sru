$PBExportHeader$t_a.sru
$PBExportComments$Top animation
forward
global type t_a from animation
end type
end forward

global type t_a from animation
string tag = "animation"
integer width = 688
integer height = 602
boolean border = true
end type
global t_a t_a

forward prototypes
public function string f_get_accessible_name ()
public function string f_gettext ()
end prototypes

public function string f_get_accessible_name ();return this.AccessibleName
end function

public function string f_gettext ();return this.tag
end function

on t_a.create
end on

on t_a.destroy
end on

event rbuttondown;//c_popmenu_srv lc_popmenu_srv
t_w_main lw_parent
//lc_popmenu_srv.f_getparentwindow(this, lw_parent)
//lc_popmenu_srv.f_popup_menu( this, lw_parent.parentwindow().pointerX(), lw_parent.parentwindow().pointerY())
end event

