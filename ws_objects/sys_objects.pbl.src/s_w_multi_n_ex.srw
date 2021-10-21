$PBExportHeader$s_w_multi_n_ex.srw
forward
global type s_w_multi_n_ex from s_w_multi_ex
end type
end forward

global type s_w_multi_n_ex from s_w_multi_ex
integer width = 3081
integer height = 1860
windowstate windowstate = normal!
end type
global s_w_multi_n_ex s_w_multi_n_ex

forward prototypes
public subroutine f_set_st_1_text (string vs_text, string vs_dwo_name)
end prototypes

public subroutine f_set_st_1_text (string vs_text, string vs_dwo_name);this.st_1.text = vs_text + ' '+ vs_dwo_name
end subroutine

on s_w_multi_n_ex.create
call super::create
end on

on s_w_multi_n_ex.destroy
call super::destroy
end on

type dw_filter from s_w_multi_ex`dw_filter within s_w_multi_n_ex
end type

type st_1 from s_w_multi_ex`st_1 within s_w_multi_n_ex
end type

type tab_action from s_w_multi_ex`tab_action within s_w_multi_n_ex
end type

type gb_filter from s_w_multi_ex`gb_filter within s_w_multi_n_ex
end type

type dw_2 from s_w_multi_ex`dw_2 within s_w_multi_n_ex
end type

type tab_1 from s_w_multi_ex`tab_1 within s_w_multi_n_ex
end type

type dw_4 from s_w_multi_ex`dw_4 within s_w_multi_n_ex
end type

type tv_1 from s_w_multi_ex`tv_1 within s_w_multi_n_ex
end type

type dw_5 from s_w_multi_ex`dw_5 within s_w_multi_n_ex
end type

type dw_6 from s_w_multi_ex`dw_6 within s_w_multi_n_ex
end type

type ddlb_1 from s_w_multi_ex`ddlb_1 within s_w_multi_n_ex
integer taborder = 250
end type

type ddlb_2 from s_w_multi_ex`ddlb_2 within s_w_multi_n_ex
integer taborder = 400
end type

type cbx_1 from s_w_multi_ex`cbx_1 within s_w_multi_n_ex
end type

type htb_1 from s_w_multi_ex`htb_1 within s_w_multi_n_ex
end type

type cbx_2 from s_w_multi_ex`cbx_2 within s_w_multi_n_ex
end type

type sle_1 from s_w_multi_ex`sle_1 within s_w_multi_n_ex
integer taborder = 460
end type

type st_2 from s_w_multi_ex`st_2 within s_w_multi_n_ex
end type

type gb_2 from s_w_multi_ex`gb_2 within s_w_multi_n_ex
end type

type gb_1 from s_w_multi_ex`gb_1 within s_w_multi_n_ex
end type

type gb_3 from s_w_multi_ex`gb_3 within s_w_multi_n_ex
end type

type gb_4 from s_w_multi_ex`gb_4 within s_w_multi_n_ex
end type

type gb_5 from s_w_multi_ex`gb_5 within s_w_multi_n_ex
end type

type gb_6 from s_w_multi_ex`gb_6 within s_w_multi_n_ex
end type

type gb_8 from s_w_multi_ex`gb_8 within s_w_multi_n_ex
end type

type gb_9 from s_w_multi_ex`gb_9 within s_w_multi_n_ex
end type

type gb_10 from s_w_multi_ex`gb_10 within s_w_multi_n_ex
integer taborder = 170
end type

type gb_11 from s_w_multi_ex`gb_11 within s_w_multi_n_ex
integer taborder = 330
end type

type gb_12 from s_w_multi_ex`gb_12 within s_w_multi_n_ex
integer taborder = 110
end type

type dw_1 from s_w_multi_ex`dw_1 within s_w_multi_n_ex
end type

type gb_7 from s_w_multi_ex`gb_7 within s_w_multi_n_ex
end type

type dw_3 from s_w_multi_ex`dw_3 within s_w_multi_n_ex
end type

type czkem_1 from s_w_multi_ex`czkem_1 within s_w_multi_n_ex
integer taborder = 100
string binarykey = "s_w_multi.win"
end type

type czkem_2 from s_w_multi_ex`czkem_2 within s_w_multi_n_ex
integer taborder = 120
string binarykey = "s_w_multi.win"
end type

type czkem_3 from s_w_multi_ex`czkem_3 within s_w_multi_n_ex
integer taborder = 130
string binarykey = "s_w_multi.win"
end type

type czkem_4 from s_w_multi_ex`czkem_4 within s_w_multi_n_ex
integer taborder = 180
string binarykey = "s_w_multi.win"
end type

type czkem_5 from s_w_multi_ex`czkem_5 within s_w_multi_n_ex
integer taborder = 190
string binarykey = "s_w_multi.win"
end type

type czkem_6 from s_w_multi_ex`czkem_6 within s_w_multi_n_ex
integer taborder = 140
string binarykey = "s_w_multi.win"
end type

type czkem_7 from s_w_multi_ex`czkem_7 within s_w_multi_n_ex
integer taborder = 150
string binarykey = "s_w_multi.win"
end type

type czkem_8 from s_w_multi_ex`czkem_8 within s_w_multi_n_ex
integer taborder = 200
string binarykey = "s_w_multi.win"
end type

type czkem_9 from s_w_multi_ex`czkem_9 within s_w_multi_n_ex
integer taborder = 210
string binarykey = "s_w_multi.win"
end type

type czkem_10 from s_w_multi_ex`czkem_10 within s_w_multi_n_ex
integer taborder = 260
string binarykey = "s_w_multi.win"
end type

type czkem_11 from s_w_multi_ex`czkem_11 within s_w_multi_n_ex
integer taborder = 220
string binarykey = "s_w_multi.win"
end type

type czkem_12 from s_w_multi_ex`czkem_12 within s_w_multi_n_ex
integer taborder = 230
string binarykey = "s_w_multi.win"
end type

type czkem_13 from s_w_multi_ex`czkem_13 within s_w_multi_n_ex
integer taborder = 240
string binarykey = "s_w_multi.win"
end type

type czkem_14 from s_w_multi_ex`czkem_14 within s_w_multi_n_ex
integer taborder = 270
string binarykey = "s_w_multi.win"
end type

type czkem_15 from s_w_multi_ex`czkem_15 within s_w_multi_n_ex
integer taborder = 280
string binarykey = "s_w_multi.win"
end type

type czkem_16 from s_w_multi_ex`czkem_16 within s_w_multi_n_ex
integer taborder = 290
string binarykey = "s_w_multi.win"
end type

type czkem_17 from s_w_multi_ex`czkem_17 within s_w_multi_n_ex
integer taborder = 300
string binarykey = "s_w_multi.win"
end type

type czkem_18 from s_w_multi_ex`czkem_18 within s_w_multi_n_ex
integer taborder = 310
string binarykey = "s_w_multi.win"
end type

type czkem_19 from s_w_multi_ex`czkem_19 within s_w_multi_n_ex
integer taborder = 320
string binarykey = "s_w_multi.win"
end type

type czkem_20 from s_w_multi_ex`czkem_20 within s_w_multi_n_ex
integer taborder = 340
string binarykey = "s_w_multi.win"
end type

type czkem_21 from s_w_multi_ex`czkem_21 within s_w_multi_n_ex
integer taborder = 350
string binarykey = "s_w_multi.win"
end type

type czkem_22 from s_w_multi_ex`czkem_22 within s_w_multi_n_ex
integer taborder = 360
string binarykey = "s_w_multi.win"
end type

type czkem_23 from s_w_multi_ex`czkem_23 within s_w_multi_n_ex
integer taborder = 370
string binarykey = "s_w_multi.win"
end type

type czkem_24 from s_w_multi_ex`czkem_24 within s_w_multi_n_ex
integer taborder = 380
string binarykey = "s_w_multi.win"
end type

type czkem_25 from s_w_multi_ex`czkem_25 within s_w_multi_n_ex
integer taborder = 390
string binarykey = "s_w_multi.win"
end type

type czkem_26 from s_w_multi_ex`czkem_26 within s_w_multi_n_ex
integer taborder = 410
string binarykey = "s_w_multi.win"
end type

type czkem_27 from s_w_multi_ex`czkem_27 within s_w_multi_n_ex
integer taborder = 420
string binarykey = "s_w_multi.win"
end type

type czkem_28 from s_w_multi_ex`czkem_28 within s_w_multi_n_ex
integer taborder = 430
string binarykey = "s_w_multi.win"
end type

type czkem_29 from s_w_multi_ex`czkem_29 within s_w_multi_n_ex
integer taborder = 440
string binarykey = "s_w_multi.win"
end type

type czkem_30 from s_w_multi_ex`czkem_30 within s_w_multi_n_ex
integer taborder = 450
string binarykey = "s_w_multi.win"
end type

type czkem_31 from s_w_multi_ex`czkem_31 within s_w_multi_n_ex
integer taborder = 470
string binarykey = "s_w_multi.win"
end type

type czkem_32 from s_w_multi_ex`czkem_32 within s_w_multi_n_ex
integer taborder = 480
string binarykey = "s_w_multi.win"
end type

type czkem_33 from s_w_multi_ex`czkem_33 within s_w_multi_n_ex
integer taborder = 490
string binarykey = "s_w_multi.win"
end type

type czkem_34 from s_w_multi_ex`czkem_34 within s_w_multi_n_ex
integer taborder = 500
string binarykey = "s_w_multi.win"
end type

type czkem_35 from s_w_multi_ex`czkem_35 within s_w_multi_n_ex
integer taborder = 510
string binarykey = "s_w_multi.win"
end type

type rb_1 from s_w_multi_ex`rb_1 within s_w_multi_n_ex
end type

type rb_2 from s_w_multi_ex`rb_2 within s_w_multi_n_ex
end type

type rb_3 from s_w_multi_ex`rb_3 within s_w_multi_n_ex
end type

type czkem from s_w_multi_ex`czkem within s_w_multi_n_ex
integer taborder = 160
string binarykey = "s_w_multi.win"
end type

