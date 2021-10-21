$PBExportHeader$t_vsb.sru
$PBExportComments$top vertical scroll bar
forward
global type t_vsb from vscrollbar
end type
end forward

global type t_vsb from vscrollbar
string tag = "top"
integer width = 77
integer height = 272
end type
global t_vsb t_vsb

forward prototypes
public function string f_get_accessible_name ()
public function boolean f_set_visible (boolean vb_visible)
end prototypes

public function string f_get_accessible_name ();return this.AccessibleName
end function

public function boolean f_set_visible (boolean vb_visible);this.visible = vb_visible
return this.visible
end function

on t_vsb.create
end on

on t_vsb.destroy
end on

