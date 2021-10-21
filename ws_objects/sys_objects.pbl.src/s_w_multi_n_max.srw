$PBExportHeader$s_w_multi_n_max.srw
forward
global type s_w_multi_n_max from s_w_multi
end type
end forward

global type s_w_multi_n_max from s_w_multi
integer width = 3081
integer height = 1860
end type
global s_w_multi_n_max s_w_multi_n_max

forward prototypes
public subroutine f_set_st_1_text (string vs_text, string vs_dwo_name)
end prototypes

public subroutine f_set_st_1_text (string vs_text, string vs_dwo_name);this.st_1.text = vs_text + ' '+ vs_dwo_name
end subroutine

on s_w_multi_n_max.create
call super::create
end on

on s_w_multi_n_max.destroy
call super::destroy
end on

type dw_filter from s_w_multi`dw_filter within s_w_multi_n_max
end type

type st_1 from s_w_multi`st_1 within s_w_multi_n_max
end type

type tab_action from s_w_multi`tab_action within s_w_multi_n_max
end type

type gb_filter from s_w_multi`gb_filter within s_w_multi_n_max
end type

type dw_2 from s_w_multi`dw_2 within s_w_multi_n_max
end type

type tab_1 from s_w_multi`tab_1 within s_w_multi_n_max
end type

type dw_4 from s_w_multi`dw_4 within s_w_multi_n_max
end type

type tv_1 from s_w_multi`tv_1 within s_w_multi_n_max
end type

type dw_5 from s_w_multi`dw_5 within s_w_multi_n_max
end type

type dw_6 from s_w_multi`dw_6 within s_w_multi_n_max
end type

type ddlb_1 from s_w_multi`ddlb_1 within s_w_multi_n_max
end type

type ddlb_2 from s_w_multi`ddlb_2 within s_w_multi_n_max
end type

type cbx_1 from s_w_multi`cbx_1 within s_w_multi_n_max
end type

type htb_1 from s_w_multi`htb_1 within s_w_multi_n_max
end type

type cbx_2 from s_w_multi`cbx_2 within s_w_multi_n_max
end type

type sle_1 from s_w_multi`sle_1 within s_w_multi_n_max
end type

type st_2 from s_w_multi`st_2 within s_w_multi_n_max
end type

type gb_2 from s_w_multi`gb_2 within s_w_multi_n_max
end type

type gb_1 from s_w_multi`gb_1 within s_w_multi_n_max
end type

type gb_3 from s_w_multi`gb_3 within s_w_multi_n_max
end type

type gb_4 from s_w_multi`gb_4 within s_w_multi_n_max
end type

type gb_5 from s_w_multi`gb_5 within s_w_multi_n_max
end type

type gb_6 from s_w_multi`gb_6 within s_w_multi_n_max
end type

type gb_8 from s_w_multi`gb_8 within s_w_multi_n_max
end type

type gb_9 from s_w_multi`gb_9 within s_w_multi_n_max
end type

type gb_10 from s_w_multi`gb_10 within s_w_multi_n_max
end type

type gb_11 from s_w_multi`gb_11 within s_w_multi_n_max
end type

type gb_12 from s_w_multi`gb_12 within s_w_multi_n_max
end type

type dw_1 from s_w_multi`dw_1 within s_w_multi_n_max
end type

type gb_7 from s_w_multi`gb_7 within s_w_multi_n_max
end type

type dw_3 from s_w_multi`dw_3 within s_w_multi_n_max
end type

type rb_1 from s_w_multi`rb_1 within s_w_multi_n_max
end type

type rb_2 from s_w_multi`rb_2 within s_w_multi_n_max
end type

type rb_3 from s_w_multi`rb_3 within s_w_multi_n_max
end type

type czkem from s_w_multi`czkem within s_w_multi_n_max
end type

