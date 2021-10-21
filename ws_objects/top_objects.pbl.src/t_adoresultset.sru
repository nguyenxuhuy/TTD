$PBExportHeader$t_adoresultset.sru
forward
global type t_adoresultset from adoresultset
end type
end forward

global type t_adoresultset from adoresultset
end type
global t_adoresultset t_adoresultset

on t_adoresultset.create
call super::create
TriggerEvent( this, "constructor" )
end on

on t_adoresultset.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

