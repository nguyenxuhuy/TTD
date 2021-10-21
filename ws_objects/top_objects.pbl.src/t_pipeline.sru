$PBExportHeader$t_pipeline.sru
forward
global type t_pipeline from pipeline
end type
end forward

global type t_pipeline from pipeline
end type
global t_pipeline t_pipeline

on t_pipeline.create
call super::create
TriggerEvent( this, "constructor" )
end on

on t_pipeline.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

