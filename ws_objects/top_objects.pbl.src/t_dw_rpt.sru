$PBExportHeader$t_dw_rpt.sru
$PBExportComments$Datawindow report inherit from t_dw
forward
global type t_dw_rpt from t_dw
end type
end forward

global type t_dw_rpt from t_dw
string tag = "  "
string title = "top datawindow report"
end type
global t_dw_rpt t_dw_rpt

on t_dw_rpt.create
call super::create
end on

on t_dw_rpt.destroy
call super::destroy
end on

