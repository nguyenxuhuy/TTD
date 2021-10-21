$PBExportHeader$t_timing.sru
forward
global type t_timing from timing
end type
end forward

global type t_timing from timing
end type
global t_timing t_timing

on t_timing.create
call super::create
TriggerEvent( this, "constructor" )
end on

on t_timing.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

