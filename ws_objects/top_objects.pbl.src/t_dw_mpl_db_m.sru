$PBExportHeader$t_dw_mpl_db_m.sru
$PBExportComments$Datawindow master in master-detail relation, inherited from t_dw_mpl_db
forward
global type t_dw_mpl_db_m from t_dw_mpl_db
end type
end forward

global type t_dw_mpl_db_m from t_dw_mpl_db
string title = "top datawindow master"
end type
global t_dw_mpl_db_m t_dw_mpl_db_m

on t_dw_mpl_db_m.create
call super::create
end on

on t_dw_mpl_db_m.destroy
call super::destroy
end on

