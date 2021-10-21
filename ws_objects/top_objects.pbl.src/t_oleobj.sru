$PBExportHeader$t_oleobj.sru
$PBExportComments$top oleobject class
forward
global type t_oleobj from oleobject
end type
end forward

global type t_oleobj from oleobject
end type
global t_oleobj t_oleobj

forward prototypes
public function string f_get_accessible_name ()
end prototypes

public function string f_get_accessible_name ();return this.AccessibleName
end function

event constructor;//
end event

on t_oleobj.create
call super::create
TriggerEvent( this, "constructor" )
end on

on t_oleobj.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

