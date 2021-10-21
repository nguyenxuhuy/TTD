$PBExportHeader$t_dw_mpl_ex.sru
$PBExportComments$Datawindow for manipulating external data, inherited from t_dw_mpl
forward
global type t_dw_mpl_ex from t_dw_mpl
end type
end forward

global type t_dw_mpl_ex from t_dw_mpl
string title = "top datawindow external"
end type
global t_dw_mpl_ex t_dw_mpl_ex

on t_dw_mpl_ex.create
call super::create
end on

on t_dw_mpl_ex.destroy
call super::destroy
end on

