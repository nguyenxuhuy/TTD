$PBExportHeader$s_w_1d.srw
forward
global type s_w_1d from s_w_main
end type
type dw_1 from t_dw_mpl within s_w_1d
end type
end forward

global type s_w_1d from s_w_main
dw_1 dw_1
end type
global s_w_1d s_w_1d

forward prototypes
public function datawindow f_get_dwmain ()
end prototypes

public function datawindow f_get_dwmain ();return dw_1
end function

on s_w_1d.create
int iCurrent
call super::create
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
end on

on s_w_1d.destroy
call super::destroy
destroy(this.dw_1)
end on

type dw_filter from s_w_main`dw_filter within s_w_1d
end type

type tab_action from s_w_main`tab_action within s_w_1d
end type

type gb_filter from s_w_main`gb_filter within s_w_1d
end type

type dw_1 from t_dw_mpl within s_w_1d
integer y = 376
integer width = 3095
integer height = 1428
integer taborder = 20
boolean bringtotop = true
end type

