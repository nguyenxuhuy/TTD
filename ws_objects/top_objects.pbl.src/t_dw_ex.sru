$PBExportHeader$t_dw_ex.sru
$PBExportComments$top datawindow extenal, inherited from t_dw
forward
global type t_dw_ex from t_dw_mpl
end type
end forward

global type t_dw_ex from t_dw_mpl
end type
global t_dw_ex t_dw_ex

type variables
//c_dwsrv_business inv_business
//boolean ib_cancelling, ib_deleting, ib_editing, ib_valuesetting, ib_tabstroke, ib_enterstroke
//c_dw_querymode inv_querymode

Protected:
//boolean ib_dataerror
//boolean ib_query, ib_update, ib_insert, ib_delete

end variables

on t_dw_ex.create
call super::create
end on

on t_dw_ex.destroy
call super::destroy
end on

event rowfocuschanged;//
end event

event losefocus;call super::losefocus;	if not ib_dataerror  then 
		this.accepttext( )
	end if

end event

