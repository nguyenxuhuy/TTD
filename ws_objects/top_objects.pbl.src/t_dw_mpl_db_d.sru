$PBExportHeader$t_dw_mpl_db_d.sru
$PBExportComments$Detail datawindow, in master-detail relation, inherited from t_dw_mpl_db
forward
global type t_dw_mpl_db_d from t_dw_mpl_db
end type
end forward

global type t_dw_mpl_db_d from t_dw_mpl_db
string title = "top datawindow detail"
end type
global t_dw_mpl_db_d t_dw_mpl_db_d

on t_dw_mpl_db_d.create
call super::create
end on

on t_dw_mpl_db_d.destroy
call super::destroy
end on

