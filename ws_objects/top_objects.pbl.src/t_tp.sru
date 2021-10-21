$PBExportHeader$t_tp.sru
$PBExportComments$top tabpage
forward
global type t_tp from userobject
end type
end forward

global type t_tp from userobject
string tag = "tag"
integer width = 1454
integer height = 1128
boolean hscrollbar = true
boolean vscrollbar = true
long backcolor = 67108864
string text = "Tabpage"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event e_resize pbm_size
event e_mousemove pbm_mousemove
event type integer e_set_dwo ( )
event type datawindow e_get_dwmain ( )
event e_hscroll pbm_hscroll
end type
global t_tp t_tp

forward prototypes
public function string f_get_accessible_name ()
end prototypes

public function string f_get_accessible_name ();return this.AccessibleName
end function

on t_tp.create
end on

on t_tp.destroy
end on

