$PBExportHeader$s_wr_multi.srw
forward
global type s_wr_multi from s_w_multi
end type
end forward

global type s_wr_multi from s_w_multi
integer width = 3191
integer height = 2548
boolean minbox = false
boolean maxbox = false
windowtype windowtype = response!
windowstate windowstate = normal!
end type
global s_wr_multi s_wr_multi

on s_wr_multi.create
call super::create
end on

on s_wr_multi.destroy
call super::destroy
end on

event resize;//-- override --//
string		ls_display_model

//if sizetype = 0 and this.ib_opening and not this.ib_child then return

this.setredraw( false)
//-- resize tab action --//
this.event e_resize_tab_action(newwidth,newheight)
//-- resize filter --//
if gb_filter.visible then
	this.event e_filter_resize( )
end if

if isvalid(ic_obj_handling) then
	ls_display_model = ic_obj_handling.dynamic f_get_display_model()
	this.f_set_visible_ctrl(ls_display_model)
//	this.f_resize(ls_display_model )
end if
end event

type dw_filter from s_w_multi`dw_filter within s_wr_multi
end type

type st_1 from s_w_multi`st_1 within s_wr_multi
end type

type tab_action from s_w_multi`tab_action within s_wr_multi
end type

type gb_filter from s_w_multi`gb_filter within s_wr_multi
end type

type dw_2 from s_w_multi`dw_2 within s_wr_multi
end type

type tab_1 from s_w_multi`tab_1 within s_wr_multi
end type

type dw_4 from s_w_multi`dw_4 within s_wr_multi
end type

type tv_1 from s_w_multi`tv_1 within s_wr_multi
end type

type dw_5 from s_w_multi`dw_5 within s_wr_multi
end type

type dw_6 from s_w_multi`dw_6 within s_wr_multi
end type

type ddlb_1 from s_w_multi`ddlb_1 within s_wr_multi
end type

type ddlb_2 from s_w_multi`ddlb_2 within s_wr_multi
end type

type cbx_1 from s_w_multi`cbx_1 within s_wr_multi
end type

type htb_1 from s_w_multi`htb_1 within s_wr_multi
end type

type cbx_2 from s_w_multi`cbx_2 within s_wr_multi
end type

type sle_1 from s_w_multi`sle_1 within s_wr_multi
end type

type st_2 from s_w_multi`st_2 within s_wr_multi
end type

type gb_2 from s_w_multi`gb_2 within s_wr_multi
end type

type gb_1 from s_w_multi`gb_1 within s_wr_multi
end type

type gb_3 from s_w_multi`gb_3 within s_wr_multi
end type

type gb_4 from s_w_multi`gb_4 within s_wr_multi
end type

type gb_5 from s_w_multi`gb_5 within s_wr_multi
end type

type gb_6 from s_w_multi`gb_6 within s_wr_multi
end type

type gb_8 from s_w_multi`gb_8 within s_wr_multi
end type

type gb_9 from s_w_multi`gb_9 within s_wr_multi
end type

type gb_10 from s_w_multi`gb_10 within s_wr_multi
end type

type gb_11 from s_w_multi`gb_11 within s_wr_multi
end type

type gb_12 from s_w_multi`gb_12 within s_wr_multi
end type

type dw_1 from s_w_multi`dw_1 within s_wr_multi
end type

type gb_7 from s_w_multi`gb_7 within s_wr_multi
end type

type dw_3 from s_w_multi`dw_3 within s_wr_multi
end type

type czkem_1 from s_w_multi`czkem_1 within s_wr_multi
end type

type czkem_2 from s_w_multi`czkem_2 within s_wr_multi
end type

type czkem_3 from s_w_multi`czkem_3 within s_wr_multi
end type

type czkem_4 from s_w_multi`czkem_4 within s_wr_multi
end type

type czkem_5 from s_w_multi`czkem_5 within s_wr_multi
end type

type czkem_6 from s_w_multi`czkem_6 within s_wr_multi
end type

type czkem_7 from s_w_multi`czkem_7 within s_wr_multi
end type

type czkem_8 from s_w_multi`czkem_8 within s_wr_multi
end type

type czkem_9 from s_w_multi`czkem_9 within s_wr_multi
end type

type czkem_10 from s_w_multi`czkem_10 within s_wr_multi
end type

type czkem_11 from s_w_multi`czkem_11 within s_wr_multi
end type

type czkem_12 from s_w_multi`czkem_12 within s_wr_multi
end type

type czkem_13 from s_w_multi`czkem_13 within s_wr_multi
end type

type czkem_14 from s_w_multi`czkem_14 within s_wr_multi
end type

type czkem_15 from s_w_multi`czkem_15 within s_wr_multi
end type

type czkem_16 from s_w_multi`czkem_16 within s_wr_multi
end type

type czkem_17 from s_w_multi`czkem_17 within s_wr_multi
end type

type czkem_18 from s_w_multi`czkem_18 within s_wr_multi
end type

type czkem_19 from s_w_multi`czkem_19 within s_wr_multi
end type

type czkem_20 from s_w_multi`czkem_20 within s_wr_multi
end type

type czkem_21 from s_w_multi`czkem_21 within s_wr_multi
end type

type czkem_22 from s_w_multi`czkem_22 within s_wr_multi
end type

type czkem_23 from s_w_multi`czkem_23 within s_wr_multi
end type

type czkem_24 from s_w_multi`czkem_24 within s_wr_multi
end type

type czkem_25 from s_w_multi`czkem_25 within s_wr_multi
end type

type czkem_26 from s_w_multi`czkem_26 within s_wr_multi
end type

type czkem_27 from s_w_multi`czkem_27 within s_wr_multi
end type

type czkem_28 from s_w_multi`czkem_28 within s_wr_multi
end type

type czkem_29 from s_w_multi`czkem_29 within s_wr_multi
end type

type czkem_30 from s_w_multi`czkem_30 within s_wr_multi
end type

type czkem_31 from s_w_multi`czkem_31 within s_wr_multi
end type

type czkem_32 from s_w_multi`czkem_32 within s_wr_multi
end type

type czkem_33 from s_w_multi`czkem_33 within s_wr_multi
end type

type czkem_34 from s_w_multi`czkem_34 within s_wr_multi
end type

type czkem_35 from s_w_multi`czkem_35 within s_wr_multi
end type

type rb_1 from s_w_multi`rb_1 within s_wr_multi
end type

type rb_2 from s_w_multi`rb_2 within s_wr_multi
end type

type rb_3 from s_w_multi`rb_3 within s_wr_multi
end type

type czkem from s_w_multi`czkem within s_wr_multi
end type

