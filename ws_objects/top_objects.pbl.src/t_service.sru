$PBExportHeader$t_service.sru
forward
global type t_service from service
end type
end forward

global type t_service from service
end type
global t_service t_service

on t_service.create
call super::create
TriggerEvent( this, "constructor" )
end on

on t_service.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

