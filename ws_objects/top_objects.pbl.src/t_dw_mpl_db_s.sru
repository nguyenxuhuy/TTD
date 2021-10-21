$PBExportHeader$t_dw_mpl_db_s.sru
$PBExportComments$Datawindow for manipulating data singly, inherited from t_dw_mpl_db
forward
global type t_dw_mpl_db_s from t_dw_mpl_db
end type
end forward

global type t_dw_mpl_db_s from t_dw_mpl_db
string title = "top datawindow signle"
end type
global t_dw_mpl_db_s t_dw_mpl_db_s

on t_dw_mpl_db_s.create
call super::create
end on

on t_dw_mpl_db_s.destroy
call super::destroy
end on

