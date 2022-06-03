$PBExportHeader$s_w_multi_n_rb.srw
forward
global type s_w_multi_n_rb from s_w_multi_rb
end type
type rbb_1 from u_rbb within s_w_multi_n_rb
end type
end forward

global type s_w_multi_n_rb from s_w_multi_rb
integer width = 3081
integer height = 1860
windowstate windowstate = normal!
rbb_1 rbb_1
end type
global s_w_multi_n_rb s_w_multi_n_rb

forward prototypes
public subroutine f_set_st_1_text (string vs_text, string vs_dwo_name)
public function integer f_ctrl_enable_button (t_dw_mpl vdw_focus)
end prototypes

public subroutine f_set_st_1_text (string vs_text, string vs_dwo_name);this.st_1.text = vs_text + ' '+ vs_dwo_name
end subroutine

public function integer f_ctrl_enable_button (t_dw_mpl vdw_focus);

this.ic_obj_handling.f_ctrl_enable_button( this.rbb_1, vdw_focus)
return 1
end function

on s_w_multi_n_rb.create
int iCurrent
call super::create
this.rbb_1=create rbb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rbb_1
end on

on s_w_multi_n_rb.destroy
call super::destroy
destroy(this.rbb_1)
end on

event e_resize_tab_action;rbb_1.width = vi_width

this.tab_action.move(0,0)
this.tab_action.width = 0
this.tab_action.height= rbb_1.height

end event

event open;/*******************************************************
OVERRIDE:
------------------
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
	if las_parm[2] <> '0' then
		ls_menu_code = lc_menu_item.f_get_menu_code_ex( double(las_parm[2]), it_transaction)
		ic_obj_main.f_set_menu_code(ls_menu_code )
	end if
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
		if las_parm[2] <> '0' then
			this.title = lc_menu_item.f_get_menu_label_ex(double(las_parm[2]), it_transaction )
		else 
			this.title = ic_obj_main.is_object_title
		end if		
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

//---------------------//
//-- TẠO RIBBON --//
//--------------------//
//if ic_obj_handling.dynamic f_create_actionpane(tab_action) = -1 then return -1
rbb_1.importfromxmlfile( "XmlFile2.xml")
ic_obj_handling.f_update_ribbonbar( this.rbb_1)


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

event activate;// overrid--// /
end event

type st_1 from s_w_multi_rb`st_1 within s_w_multi_n_rb
end type

type tab_action from s_w_multi_rb`tab_action within s_w_multi_n_rb
end type

type gb_filter from s_w_multi_rb`gb_filter within s_w_multi_n_rb
end type

type dw_filter from s_w_multi_rb`dw_filter within s_w_multi_n_rb
end type

type dw_2 from s_w_multi_rb`dw_2 within s_w_multi_n_rb
end type

type tab_1 from s_w_multi_rb`tab_1 within s_w_multi_n_rb
end type

type dw_4 from s_w_multi_rb`dw_4 within s_w_multi_n_rb
end type

type tv_1 from s_w_multi_rb`tv_1 within s_w_multi_n_rb
end type

type dw_5 from s_w_multi_rb`dw_5 within s_w_multi_n_rb
end type

type dw_6 from s_w_multi_rb`dw_6 within s_w_multi_n_rb
end type

type ddlb_1 from s_w_multi_rb`ddlb_1 within s_w_multi_n_rb
integer taborder = 250
end type

type ddlb_2 from s_w_multi_rb`ddlb_2 within s_w_multi_n_rb
integer taborder = 400
end type

type cbx_1 from s_w_multi_rb`cbx_1 within s_w_multi_n_rb
end type

type htb_1 from s_w_multi_rb`htb_1 within s_w_multi_n_rb
end type

type cbx_2 from s_w_multi_rb`cbx_2 within s_w_multi_n_rb
end type

type sle_1 from s_w_multi_rb`sle_1 within s_w_multi_n_rb
integer taborder = 460
end type

type st_2 from s_w_multi_rb`st_2 within s_w_multi_n_rb
end type

type gb_2 from s_w_multi_rb`gb_2 within s_w_multi_n_rb
end type

type gb_1 from s_w_multi_rb`gb_1 within s_w_multi_n_rb
end type

type gb_3 from s_w_multi_rb`gb_3 within s_w_multi_n_rb
end type

type gb_4 from s_w_multi_rb`gb_4 within s_w_multi_n_rb
end type

type gb_5 from s_w_multi_rb`gb_5 within s_w_multi_n_rb
end type

type gb_6 from s_w_multi_rb`gb_6 within s_w_multi_n_rb
end type

type gb_8 from s_w_multi_rb`gb_8 within s_w_multi_n_rb
end type

type gb_9 from s_w_multi_rb`gb_9 within s_w_multi_n_rb
end type

type gb_10 from s_w_multi_rb`gb_10 within s_w_multi_n_rb
integer taborder = 170
end type

type gb_11 from s_w_multi_rb`gb_11 within s_w_multi_n_rb
integer taborder = 330
end type

type gb_12 from s_w_multi_rb`gb_12 within s_w_multi_n_rb
integer taborder = 110
end type

type dw_1 from s_w_multi_rb`dw_1 within s_w_multi_n_rb
end type

type gb_7 from s_w_multi_rb`gb_7 within s_w_multi_n_rb
end type

type dw_3 from s_w_multi_rb`dw_3 within s_w_multi_n_rb
end type

type rb_1 from s_w_multi_rb`rb_1 within s_w_multi_n_rb
end type

type rb_2 from s_w_multi_rb`rb_2 within s_w_multi_n_rb
end type

type rb_3 from s_w_multi_rb`rb_3 within s_w_multi_n_rb
end type

type rbb_1 from u_rbb within s_w_multi_n_rb
integer x = 5
integer height = 308
boolean bringtotop = true
long backcolor = 14142144
integer builtintheme = 4
boolean hidetabheader = true
boolean #centralizedeventhandling = true
end type

event itemclicked;call super::itemclicked;int						li_rtn
//s_w_main				lw_active
s_object_display		lod_handle

choose case itemtag
	case 'e_add','e_modify','e_delete','e_save','e_first','e_next','e_prior','e_last','e_okclose','e_close','e_refresh'

		choose case itemtag
			case 'e_modify','e_save','e_post','e_unpost','e_add','e_insert'
				this.f_change_action_button( itemhandle, index, 0)
		end choose
		li_rtn = parent.triggerevent( itemtag)
	
	case 'e_filter'
			if parent.ib_filter_on then
				parent.triggerevent( 'e_filteroff')
			else
				parent.triggerevent( 'e_filteron_new')
			end if
//	case 'close'
//		close(parent)
	case 'e_action_load_file','e_action_link','e_action_open_file'
//		lw_active = parent.getactivesheet( )
//		if isvalid(lw_active) then
			lod_handle = parent.dynamic f_get_obj_handling( )
			lod_handle.triggerevent(itemtag )
//		end if				
	case else //-- e_change_object_appeon --//
//		lw_active = parent.getactivesheet( )
//		if isvalid(lw_active) then
//			lw_active.triggerevent(itemtag )
//		end if				
end choose
end event

