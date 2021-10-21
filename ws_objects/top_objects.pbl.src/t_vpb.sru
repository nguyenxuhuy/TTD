$PBExportHeader$t_vpb.sru
$PBExportComments$top vertical progress bar
forward
global type t_vpb from vprogressbar
end type
end forward

global type t_vpb from vprogressbar
string tag = "top"
integer width = 77
integer height = 544
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type
global t_vpb t_vpb

forward prototypes
public function string f_get_accessible_name ()
public function boolean f_set_visible (boolean vb_visible)
end prototypes

public function string f_get_accessible_name ();return this.AccessibleName
end function

public function boolean f_set_visible (boolean vb_visible);this.visible = vb_visible
return this.visible
end function

on t_vpb.create
end on

on t_vpb.destroy
end on

