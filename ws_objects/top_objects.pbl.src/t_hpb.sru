$PBExportHeader$t_hpb.sru
$PBExportComments$top horizontal progress bar
forward
global type t_hpb from hprogressbar
end type
end forward

global type t_hpb from hprogressbar
string tag = "top"
integer width = 622
integer height = 67
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type
global t_hpb t_hpb

forward prototypes
public function string f_get_accessible_name ()
public function boolean f_set_visible (boolean vb_visible)
end prototypes

public function string f_get_accessible_name ();return this.AccessibleName
end function

public function boolean f_set_visible (boolean vb_visible);this.visible = vb_visible
return this.visible
end function

on t_hpb.create
end on

on t_hpb.destroy
end on

event rbuttondown;//c_popmenu_srv lc_popmenu_srv
t_w_main lw_parent
//lc_popmenu_srv.f_getparentwindow(this, lw_parent)
//lc_popmenu_srv.f_popup_menu( this, lw_parent.parentwindow().pointerX(), lw_parent.parentwindow().pointerY())
end event

