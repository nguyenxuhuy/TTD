﻿$PBExportHeader$s_w_tv_md_rb.srw
forward
global type s_w_tv_md_rb from s_w_main
end type
type dw_2 from t_dw_mpl within s_w_tv_md_rb
end type
type tv_1 from t_tv within s_w_tv_md_rb
end type
type dw_1 from t_dw_mpl within s_w_tv_md_rb
end type
type gb_1 from t_g_line within s_w_tv_md_rb
end type
type gb_2 from t_g_line within s_w_tv_md_rb
end type
end forward

global type s_w_tv_md_rb from s_w_main
integer width = 4055
integer height = 2020
integer ii_tv_width = 900
dw_2 dw_2
tv_1 tv_1
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global s_w_tv_md_rb s_w_tv_md_rb

type variables
boolean		ib_saving
int				ii_dw_2_height = 600
end variables

forward prototypes
public function treeview f_get_tv ()
public function datawindow f_get_dwmain ()
public function datawindow f_get_dw_2 ()
public function integer f_update_userprofile ()
public function integer f_ctrl_enable_button (t_dw_mpl vdw_focus)
end prototypes

public function treeview f_get_tv ();return tv_1
end function

public function datawindow f_get_dwmain ();return dw_1
end function

public function datawindow f_get_dw_2 ();return dw_2
end function

public function integer f_update_userprofile ();c_dwservice			lc_dwservice
connect using it_transaction;
if lc_dwservice.f_update_dwtabseq_ex( ic_obj_handling, dw_1, iadw_none_md[], it_transaction ) = -1 then
	disconnect using it_transaction;
	return -1
end if
if lc_dwservice.f_update_resize_parm_ex( ic_obj_handling, it_transaction) = -1 then
	disconnect using it_transaction;
	return -1
end if
disconnect using it_transaction;
return 1
end function

public function integer f_ctrl_enable_button (t_dw_mpl vdw_focus);

this.ic_obj_handling.f_ctrl_enable_button( t_w_mdi.rbb_1, vdw_focus)
return 1
end function

on s_w_tv_md_rb.create
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

on s_w_tv_md_rb.destroy
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

event open;/*******************************************************
Chức năng:
	- Tạo object chính
	- Gọi control action pane
	- gọi pre-open
	- gọi post-open: chỉ chạy e_postopen khi mở window thành công
-----------------------------
Override
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

//this.setredraw( false)
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
	ic_obj_main.f_init_policy_datastore_exx(it_transaction )

elseif not isnull(message.powerobjectparm ) then
	ic_obj_main = message.powerobjectparm
	setnull(message.powerobjectparm)

	ic_obj_main.f_init_policy_datastore_exx(it_transaction )
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

event e_postopen;/*****************************************************************
Chức năng: Thống báo đến object
===================================================*/
int				li_rtn, li_idx
long			ll_row_found
string		ls_display_model,ls_select_SQL
s_str_drilldown_data 		lstr_drilldown_data

//this.f_set_resize() khoá vì đã gọi trong event resize
ls_display_model = ic_obj_handling.dynamic f_get_display_model()
this.f_resize(ls_display_model )	
//--kiẻm tra open drilldown --//
if ic_obj_handling.f_get_drilldown_data( lstr_drilldown_data) > 1 then	
	li_rtn = ic_obj_handling.dynamic event e_window('e_postopen')
	ic_obj_handling.f_open_drilldown_rpt( )
	idw_focus.setfocus( )
	this.f_ctrl_enable_button(  idw_focus)
//	this.event e_display_actionbutton( )
	ib_opening = false
//	this.setredraw( true)
	return li_rtn
else		
	//-- Neu open object return 0 thi thuc hien retrieve idw_focus --//
	if vi_preopen_return = 0 then
		//-- retrieve ds_book --//
		if not ic_obj_handling.ib_copying then ic_obj_handling.dynamic f_book(0,false)
		//-- retrieve dw_focus --//
		if ic_obj_handling.classname() = 'u_onhand' then
			idw_focus = this.f_get_dw( 'd_onhand_grid')
		end if
		if idw_focus.dynamic event e_refresh() = -9 or idw_focus.dynamic event e_refresh() = 0  then
//			this.f_ctrl_enable_button(  idw_focus)
//			ic_obj_handling.f_ctrl_actionbuttons(idw_focus)
		end if
		
		//-- scroll đến record được chọn trong window search --//
	//	if idw_focus.rowcount( ) > 0 then
	//		if t_w_mdi.iw_search.idb_object_id > 0 then
	//			ll_row_found = idw_focus.find("ID =" + string(t_w_mdi.iw_search.idb_object_id), 1,  idw_focus.rowcount( ))
	//			t_w_mdi.iw_search.idb_object_id = 0
	//			if ll_row_found > 0 then
	//				idw_focus.scrolltorow(ll_row_found)
	//			end if
	//		end if
	//	end if
	
		//-- retrieve các DW độc lập --//
		FOR li_idx = 1 to upperbound(iadw_none_md[] )
			ls_select_SQL = iadw_none_md[li_idx].describe("Datawindow.Table.Select")
			if ls_select_SQL<>'' and ls_select_SQL <> '!' and left(iadw_none_md[li_idx].dataobject,3) <> 'dr_' and  iadw_none_md[li_idx].dataobject <> idw_focus.dataobject then
				iadw_none_md[li_idx].dynamic event e_refresh( ) 
			end if
		NEXT	
	else
//		this.f_ctrl_enable_button(  idw_focus)
//		ic_obj_handling.f_ctrl_actionbuttons(idw_focus)
	end if
end if

li_rtn = ic_obj_handling.dynamic event e_window('e_postopen')
idw_focus.setfocus( )
this.f_ctrl_enable_button(  idw_focus)
//this.event e_display_actionbutton( )
ib_opening = false
disconnect using it_transaction;
return li_rtn

end event

event e_postmodify;//-- override --//
//-- Set focus và goi object điều khiển action --//

int				li_rtn

li_rtn = ic_obj_handling.dynamic event e_window( 'e_postmodify')
if li_rtn = -1 then 
	return -1
end if
//ic_obj_handling.f_ctrl_actionbuttons( idw_focus)
//this.event e_display_actionbutton( )
return idw_focus.setfocus( )
end event

event e_postsave;
/******************************************************
chức năng: - setfocus cho control
				 - Thông báo object
				 - gọi điều khiển action button
OVERRIDE
---------------------------------------------------------------------------------------*/

int				li_rtn


//li_rtn = ic_obj_handling.dynamic event e_window( 'e_postsave')
li_rtn = ic_obj_handling.event e_window_e_postsave(vi_save_return )
if li_rtn = -1 then 
	return -1
end if
//--nếu đang copy thì sau khi save tắt chế độ copy--//
if ic_obj_handling.f_get_ib_copying( ) then ic_obj_handling.f_set_ib_copying( false)
this.f_ctrl_enable_button(  idw_focus)
//ic_obj_handling.f_ctrl_actionbuttons( idw_focus)
//this.event e_display_actionbutton( )
return idw_focus.setfocus( )

end event

event activate;call super::activate;this.f_ctrl_enable_button(  idw_focus)
end event

event e_postadd;//-- Thực hiện sau khi tạo mớ: set focus cho control và gọi điều khiển action --//
//-- Override --//

int				li_rtn

li_rtn = ic_obj_handling.dynamic event e_window( 'e_postadd')
if li_rtn = -1 then 
	return -1
end if
//ic_obj_handling.f_ctrl_actionbuttons( idw_focus)
//this.event e_display_actionbutton( )
 this.f_ctrl_enable_button(  idw_focus)
return idw_focus.setfocus( )
end event

event e_add;//--overide--//
//-- Tạo đối tượng mới, return row number , -1 lỗi --//
long			ll_rtn
t_dw_mpl	ldw_main


setpointer(appstarting!)

connect using it_transaction; 

ldw_main = this.f_get_dwmain( )
if idw_focus.classname( ) = 'dw_filter' then
	this.f_set_idwfocus(ldw_main )
end if
//-- Trước khi add: Thay đổi giao diện dw sang edit --//
ll_rtn = this.event e_preadd( )

if ll_rtn <> -1 then
	//-- add record --//
	ll_rtn = idw_focus.dynamic event e_addrow()

	//-- set focus và goi object điều khiễn nút --//
	this.event e_postadd( )
end if
setpointer(arrow!)

disconnect using it_transaction;

return ll_rtn
end event

event e_save;//-- OVERRIDE --//

//-- Thực hiện lưu dữ liệu, return 1 ok, -1 lỗi --//
int 		li_rtn
t_ds_db	lds_matching
t_dw_mpl	ldw_main

if ic_obj_handling.dynamic f_is_changed_dwo_4edit()  then
	
	return event e_saveclose( )
	
else
	connect using it_transaction;
	
	if idw_focus.classname( ) = 'dw_filter' then
		ldw_main = this.f_get_dwmain( )
		this.f_set_idwfocus(ldw_main )
	end if
	
	//-- Trước khi lưu --//
	li_rtn = this.event e_presave( )
	
	//-- Yêu cầu thực hiện lưu --//
	if li_rtn <> -1 then
		li_rtn = idw_focus.dynamic event e_save()
		if li_rtn <> -1 then
			li_rtn = idw_focus.dynamic event e_resetupdate()	
			if li_rtn = 1 then
				lds_matching = ic_obj_handling.dynamic f_get_ids_matching()
				if isvalid(lds_matching) then
	//				if lds_matching.rowcount( ) > 0 then
	//					li_rtn = lds_matching.update( true,false)
	//					if li_rtn = 1 then 
	//						lds_matching.resetupdate( )
	//					else
	//						rollback using it_transaction;
	//					end if
	//				end if
					lds_matching.reset()
					ic_obj_handling.ib_copying = false
					ic_obj_handling.ib_copy_tax = false
				end if
				if li_rtn = 1 then 
					commit using it_transaction;
				end if
				if it_transaction.sqlcode = 0 then
				else
					messagebox('ERROR','s_w_main.e_save(commit)')
				end if
			else
				rollback using it_transaction;
			end if
		else
			rollback using it_transaction;
		end if
		this.event e_postsave( li_rtn)
	end if
	
	disconnect using it_transaction;
	return li_rtn
end if
end event

type st_1 from s_w_main`st_1 within s_w_tv_md_rb
end type

type tab_action from s_w_main`tab_action within s_w_tv_md_rb
boolean visible = false
integer taborder = 0
long backcolor = 134217732
end type

event tab_action::selectionchanged;//-- override //
end event

event tab_action::selectionchanging;//-- override //
end event

type gb_filter from s_w_main`gb_filter within s_w_tv_md_rb
end type

type dw_filter from s_w_main`dw_filter within s_w_tv_md_rb
end type

type dw_2 from t_dw_mpl within s_w_tv_md_rb
integer x = 736
integer y = 1180
integer height = 400
integer taborder = 20
boolean bringtotop = true
end type

event constructor;call super::constructor;
this.ib_displaying = true
end event

type tv_1 from t_tv within s_w_tv_md_rb
integer y = 568
integer taborder = 30
boolean bringtotop = true
end type

type dw_1 from t_dw_mpl within s_w_tv_md_rb
integer x = 695
integer y = 416
integer width = 686
integer height = 392
integer taborder = 10
boolean bringtotop = true
end type

type gb_1 from t_g_line within s_w_tv_md_rb
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

type gb_2 from t_g_line within s_w_tv_md_rb
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

