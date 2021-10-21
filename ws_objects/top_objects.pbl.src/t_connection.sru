$PBExportHeader$t_connection.sru
forward
global type t_connection from connection
end type
end forward

global type t_connection from connection
end type
global t_connection t_connection

on t_connection.create
call super::create
TriggerEvent( this, "constructor" )
end on

on t_connection.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

