$PBExportHeader$s_tp_1d.sru
forward
global type s_tp_1d from t_tp
end type
type dw_1 from t_dw_mpl within s_tp_1d
end type
end forward

global type s_tp_1d from t_tp
dw_1 dw_1
end type
global s_tp_1d s_tp_1d

on s_tp_1d.create
int iCurrent
call super::create
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
end on

on s_tp_1d.destroy
call super::destroy
destroy(this.dw_1)
end on

type dw_1 from t_dw_mpl within s_tp_1d
integer x = 192
integer y = 152
integer taborder = 10
end type

