$PBExportHeader$c_w_message_reg.srw
forward
global type c_w_message_reg from c_w_md
end type
type ddlb_1 from t_ddlb within c_w_message_reg
end type
type ddlb_2 from t_ddlb within c_w_message_reg
end type
end forward

global type c_w_message_reg from c_w_md
ddlb_1 ddlb_1
ddlb_2 ddlb_2
end type
global c_w_message_reg c_w_message_reg

on c_w_message_reg.create
int iCurrent
call super::create
this.ddlb_1=create ddlb_1
this.ddlb_2=create ddlb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ddlb_1
this.Control[iCurrent+2]=this.ddlb_2
end on

on c_w_message_reg.destroy
call super::destroy
destroy(this.ddlb_1)
destroy(this.ddlb_2)
end on

event e_preopen;call super::e_preopen;
//-- settransobject cho dw_1,dw_2 --//
dw_1.settransobject( it_transaction)
dw_2.settransobject( it_transaction)

//-- Gán idw_focus = dw_1, retrieve dữ liệu idw_focus --//
idw_focus = dw_1
dw_1.event e_retrieve( )

return 0
end event

event resize;call super::resize;ddlb_1.height = 110
ddlb_1.width = tab_action.width /5
ddlb_1.move( tab_action.x , dw_filter.y - ddlb_1.height )

ddlb_2.height = 110
ddlb_2.width = tab_action.width /5
ddlb_2.move( ddlb_1.x + ddlb_1.width , dw_filter.y - ddlb_1.height )

end event

event e_postopen;call super::e_postopen;t_dw_mpl ldw_detail[]

//-- Cài đặt master-detail cho dw --//
ldw_detail[1] =  dw_2
dw_1.f_set_dwmaster( ldw_detail)
dw_2.f_set_dwdetail( dw_1, 'code', true)

//-- retrieve dw_2 --//
dw_2.event e_retrieve( )

//-- setfocus cho idw_focus --//
dw_1.setfocus( )
return 0

end event

type tab_action from c_w_md`tab_action within c_w_message_reg
end type

type tabpage_1 from c_w_md`tabpage_1 within tab_action
end type

type dw_file from c_w_md`dw_file within tabpage_1
end type

type tabpage_2 from c_w_md`tabpage_2 within tab_action
end type

type dw_b1 from c_w_md`dw_b1 within tabpage_2
end type

type dw_1 from c_w_md`dw_1 within c_w_message_reg
integer width = 919
string dataobject = "d_c_w_message_reg_dw1"
end type

event dw_1::constructor;call super::constructor;ib_insert = false
ib_update = false
ib_delete = false
end event

type dw_2 from c_w_md`dw_2 within c_w_message_reg
string dataobject = "d_c_w_message_reg_dw2"
end type

type dw_filter from c_w_md`dw_filter within c_w_message_reg
end type

type gb_1 from c_w_md`gb_1 within c_w_message_reg
end type

type ddlb_1 from t_ddlb within c_w_message_reg
integer x = 1006
integer y = 1092
integer width = 800
integer height = 100
integer taborder = 50
boolean bringtotop = true
end type

type ddlb_2 from t_ddlb within c_w_message_reg
integer x = 1815
integer y = 1088
integer width = 800
integer height = 100
integer taborder = 50
boolean bringtotop = true
end type

