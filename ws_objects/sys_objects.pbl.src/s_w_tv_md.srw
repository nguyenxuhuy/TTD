$PBExportHeader$s_w_tv_md.srw
forward
global type s_w_tv_md from s_w_main
end type
type dw_2 from t_dw_mpl within s_w_tv_md
end type
type tv_1 from t_tv within s_w_tv_md
end type
type dw_1 from t_dw_mpl within s_w_tv_md
end type
type gb_1 from t_g_line within s_w_tv_md
end type
type gb_2 from t_g_line within s_w_tv_md
end type
end forward

global type s_w_tv_md from s_w_main
integer width = 4055
integer height = 2020
integer ii_tv_width = 900
dw_2 dw_2
tv_1 tv_1
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global s_w_tv_md s_w_tv_md

type variables

int				ii_dw_2_height = 600
end variables

forward prototypes
public function treeview f_get_tv ()
public function datawindow f_get_dwmain ()
public function datawindow f_get_dw_2 ()
public function integer f_update_userprofile ()
end prototypes

public function treeview f_get_tv ();return tv_1
end function

public function datawindow f_get_dwmain ();return dw_1
end function

public function datawindow f_get_dw_2 ();return dw_2
end function

public function integer f_update_userprofile ();
c_dwservice			lc_dwservice

if lc_dwservice.f_update_dwtabseq_ex( ic_obj_handling, dw_1, iadw_none_md[], it_transaction) = -1 then
	return -1
end if
if lc_dwservice.f_update_resize_parm_ex( ic_obj_handling, it_transaction) = -1 then
	return -1
end if

return 1
end function

on s_w_tv_md.create
int iCurrent
call super::create
this.dw_2=create dw_2
this.tv_1=create tv_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_2
this.Control[iCurrent+2]=this.tv_1
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.gb_1
this.Control[iCurrent+5]=this.gb_2
end on

on s_w_tv_md.destroy
call super::destroy
destroy(this.dw_2)
destroy(this.tv_1)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event resize;call super::resize;
//-- resize treeview --//
tv_1.move( tab_action.x , tab_action.y + tab_action.height )
tv_1.width = ii_tv_width
tv_1.height = newheight - tab_action.y - tab_action.height

//-- resize vertical line --//
gb_1.move( tv_1.x + tv_1.width , tab_action.y + tab_action.height )
gb_1.height = newheight - tab_action.y - tab_action.height

//-- resize dw_1 --//
dw_1.move( gb_1.x + gb_1.width , tab_action.y + tab_action.height )
dw_1.width = newwidth - gb_1.x - gb_1.width
dw_1.height = newheight - tab_action.y - tab_action.height - ii_dw_2_height - gb_2.height


//-- resize horizontal line --//
gb_2.move( dw_1.x , dw_1.y + dw_1.height )
gb_2.width = dw_1.width 

//-- resize dw_2 --//
dw_2.move( dw_1.x , gb_2.y + gb_2.height )
dw_2.width = dw_1.width
dw_2.height = ii_dw_2_height



end event

event closequery;//-- OVERRIDE --//
string					ls_object
int						li_response
c_string				lc_string

if this.enabled = false then return 1 //-- khi đang open window child ko được đóng win parent --//

//-- kiểm tra tình trạng edit --//
if idw_focus.dynamic f_get_ib_editing() then
	li_response = gf_messagebox('m.s_w_main.closequery.01','Xác nhận lưu','Bạn có muốn lưu dữ liệu đang soạn thảo không?','question', 'yesnocancel',1)
	if  li_response = 1 then
		if this.event e_save( ) = -1 then
			return 1
		end if
	elseif li_response = 2 then
		close(this)
	else
		return 1
	end if
end if

//-- đóng window child trở về window cha --//
if this.ib_child and this.windowtype <> response! then
	if isvalid(this.iw_parent) then 
		this.iw_parent.enabled = true
		this.iw_parent.windowstate = Maximized!
	end if
end if

//-- Cập nhật picture index cua menu --//
//if not this.ib_child then
//	t_w_menu.f_change_pic_idx(ic_obj_main, 'close')
//end if

//-- xoa biến is_mainobject --//
//ls_object = ic_obj_main.f_get_menu_code( )
//if ls_object<> '' and not isnull(ls_object) then
//	t_w_mdi.is_menu_code = lc_string.f_globalreplace( t_w_mdi.is_menu_code, ic_obj_main.f_get_menu_code( ) +";" , "")
//end if

//connect using it_transaction;
li_response = ic_obj_handling.dynamic event e_window_closequery()

//-- release resource --//
//disconnect using it_transaction;
destroy it_transaction

//if li_response = 0 then
//	destroy this.ic_obj_main
//end if
//
ib_closing = true
return 0
end event

event e_resize_tab_action;call super::e_resize_tab_action;this.tab_action.move(0,0)
this.tab_action.width = 0
this.tab_action.height= 0

end event

event open;call super::open;/*******************************************************
Chức năng:
	- Tạo object chính
	- Gọi control action pane
	- gọi pre-open
	- gọi post-open: chỉ chạy e_postopen khi mở window thành công
------------------------------------------------------------------------------------------------*/

int 						li_rtn, li_width, li_height
string						ls_object, ls_parm, las_parm[], ls_display_model, ls_menu_code, ls_menu_text
window					lw_requester
c_obj_service			lc_obj_service
s_str_dw_md			lastr_dw_md_empty[]
s_str_dw_ms			lastr_dw_ms_empty[]
s_str_dwo_related		lstr_data_related[]	
datawindow				ldw_empty[]
c_menu_item			lc_menu_item

ib_opening = true
//-- Tạo connection voi database --//
it_transaction = create t_transaction
it_transaction.dbms =	SQLCA.DBMS
it_transaction.ServerName	 = SQLCA.ServerName
it_transaction.LogId	 = SQLCA.LogId
it_transaction.LogPass 	 = SQLCA.LogPass 
it_transaction.AutoCommit 	 = false 
it_transaction.DBParm	 = SQLCA.DBParm
connect using	it_transaction;	

if not isnull(message.stringparm) and message.stringparm <> '' then
	ls_parm = message.stringparm	
	setnull(message.stringparm)

	lc_obj_service.f_stringtoarray(ls_parm ,";",las_parm[])
	ic_obj_main = create using las_parm[1]
	ic_obj_main.f_set_menu_id(las_parm[2])	
	ls_menu_code = lc_menu_item.f_get_menu_code_ex( double(las_parm[2]), it_transaction)
	ic_obj_main.f_set_menu_code(ls_menu_code )
	//-- init dwsetup --//
	if upper(ic_obj_main.classname( )) = 'U_VALUESET_ENTRY' then
//		ic_obj_main.idwsetup_initial.f_init_ids_setup_dw( upper(ic_obj_main.classname( )) )
//	else
		ic_obj_main.idwsetup_initial.f_init_ids_setup_dw_ex( upper(ic_obj_main.f_get_menu_code( ) ), it_transaction )
	end if
	
	if las_parm[1] <> 'u_valueset_entry' then
		this.is_win_name = las_parm[1]
	else
		this.is_win_name = las_parm[1]+las_parm[2]
	end if

	if upperbound(las_parm[]) > 2 then
		this.title = las_parm[3]				
		this.is_win_grp = las_parm[4]
		this.is_sheet_type = las_parm[4]		
	else
		this.title = lc_menu_item.f_get_menu_label_ex(double(las_parm[2]), it_transaction )
	end if
	ic_obj_main.f_init_policy_datastore_ex(it_transaction )

elseif not isnull(message.powerobjectparm ) then
	ic_obj_main = message.powerobjectparm
	setnull(message.powerobjectparm)

	ic_obj_main.f_init_policy_datastore_ex(it_transaction )
	ls_menu_text = lc_menu_item.f_get_menu_label_ex(ic_obj_main.classname( ) ,it_transaction)
	if ls_menu_text <> '' then
		this.title  = ls_menu_text
	else
		this.title = ic_obj_main.is_object_title
	end if
	this.is_win_name = ic_obj_main.is_win_name
	this.is_win_grp = ic_obj_main.is_win_grp
	this.is_sheet_type = ic_obj_main.is_sheet_type
	
	//-- init dwsetup --//
	if upper(ic_obj_main.classname( )) = 'U_VALUESET_ENTRY' then
//		ic_obj_main.idwsetup_initial.f_init_ids_setup_dw( upper(ic_obj_main.classname( )) )
//	else
		ic_obj_main.idwsetup_initial.f_init_ids_setup_dw_ex( upper(ic_obj_main.f_get_menu_code( ) ), it_transaction )
	end if	
end if

is_popmenu = 'm_setup_user_access;m_edit_window_label;'
//-- create main object --//
lw_requester = this
ic_obj_main.dynamic f_set_wdisplay(lw_requester)

//-- ghi nhớ menu_id của window được open --//
ic_obj_handling = ic_obj_main

//-- pre-open : resize nội bộ đối tượng hoặc window display--//
this.f_set_resize( )  
li_rtn = this.event e_preopen( ) 
if li_rtn = -1 then return -1

//-- tao actionpane --//
//if ic_obj_handling.dynamic f_create_actionpane(tab_action) = -1 then return -1


//-- gán dwo cho dw cùa window --//
iastr_dw_ms = lastr_dw_ms_empty[]
iastr_dw_md = lastr_dw_md_empty[]
this.iwdw_detail[]  = ldw_empty[]
this.iwdw_share[] = ldw_empty[]
this.iadw_none_md[] = ldw_empty[]
this.f_set_dwo( )

//-- tao tabpage detail nếu có --//
if ic_obj_handling.dynamic f_create_tabpage() = -1 then return -1

//-- set master detail share --//
this.f_arrange_dwdetail( this.iwdw_detail[] )
this.f_arrage_dwshared( this.iwdw_share[] )
this.f_set_md_ms()

//-- set record security --//
this.f_set_record_security_ex( it_transaction )

//-- thông báo đến object : add where cua object nếu có--//
li_rtn = ic_obj_handling.event e_window( 'open')
if li_rtn = -1 then 
	return -1
end if
//-- resize --//
ic_obj_handling.f_get_resize_wdisplay(li_width ,li_height)
if li_width > 0 and li_height > 0 then
	this.width = li_width
	this.height = li_height
end if

//-- post open --//
if li_rtn <> -1 then this.post event e_postopen(li_rtn )

end event

type dw_filter from s_w_main`dw_filter within s_w_tv_md
end type

type st_1 from s_w_main`st_1 within s_w_tv_md
end type

type tab_action from s_w_main`tab_action within s_w_tv_md
boolean visible = false
integer taborder = 0
long backcolor = 134217732
end type

type gb_filter from s_w_main`gb_filter within s_w_tv_md
end type

type dw_2 from t_dw_mpl within s_w_tv_md
integer x = 736
integer y = 1180
integer height = 400
integer taborder = 20
boolean bringtotop = true
end type

event constructor;call super::constructor;
this.ib_displaying = true
end event

type tv_1 from t_tv within s_w_tv_md
integer y = 568
integer taborder = 30
boolean bringtotop = true
end type

type dw_1 from t_dw_mpl within s_w_tv_md
integer x = 695
integer y = 416
integer width = 686
integer height = 392
integer taborder = 10
boolean bringtotop = true
end type

type gb_1 from t_g_line within s_w_tv_md
integer x = 530
integer y = 632
integer width = 27
integer height = 568
string pointer = "SizeWE!"
borderstyle borderstyle = stylelowered!
end type

event e_mousemove;call super::e_mousemove;

int				li_x

	
if flags = 1 then	
	li_x =  parent.pointerx( )
	if li_x >140 and li_x < parent.workspacewidth( ) - 200 then 
		this.move( li_x, this.y )
		this.setposition( ToTop!)
		ii_tv_width = li_x
	end if
end if

end event

event e_left_mouseup;call super::e_left_mouseup;

//-- resize tv_1 --//
tv_1.width = ii_tv_width

//-- resize dw_1 --//
dw_1.move( gb_1.x + gb_1.width , tab_action.y + tab_action.height )
dw_1.width = parent.workspacewidth( ) - gb_1.x - gb_1.width


//-- resize gb_2 --//
gb_2.move( dw_1.x , gb_2.y )
gb_2.width = dw_1.width


//-- resize dw_2 --//
dw_2.move( dw_1.x , dw_2.y )
dw_2.width = dw_1.width

end event

type gb_2 from t_g_line within s_w_tv_md
integer x = 1047
integer y = 940
end type

event e_mousemove;call super::e_mousemove;

int				li_y

	
if flags = 1 then	
	li_y =  parent.pointery( )
	if li_y > tab_action.height +300 and li_y < parent.workspaceheight( ) - 300 then 
		this.move( this.x, li_y )
		this.setposition( ToTop!)
		ii_dw_2_height = parent.workspaceheight( ) - li_y - this.height
	end if
end if

end event

event e_left_mouseup;call super::e_left_mouseup;

//-- resize dw_1 --//

dw_1.height = parent.workspaceheight( ) - tab_action.y - tab_action.height - ii_dw_2_height - gb_2.height

//-- resize dw_2 --//
dw_2.move( dw_1.x , gb_2.y + gb_2.height )
dw_2.height = ii_dw_2_height
end event

