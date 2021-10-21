$PBExportHeader$t_dw_mpl_db.sru
$PBExportComments$Datawindow for manipulating data with database, inherited from t_dw_mpl
forward
global type t_dw_mpl_db from t_dw_mpl
end type
end forward

global type t_dw_mpl_db from t_dw_mpl
string title = "top datawindow manipulate db"
end type
global t_dw_mpl_db t_dw_mpl_db

on t_dw_mpl_db.create
call super::create
end on

on t_dw_mpl_db.destroy
call super::destroy
end on

