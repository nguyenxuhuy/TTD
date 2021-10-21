$PBExportHeader$c_legal_entity.sru
forward
global type c_legal_entity from s_object_display
end type
end forward

global type c_legal_entity from s_object_display
boolean ib_filter = false
boolean ib_refresh = false
boolean ib_trace = false
boolean ib_keyboardlocked = false
boolean ib_query = false
boolean ib_update = false
boolean ib_insert = false
boolean ib_delete = false
boolean ib_query_ctx = false
boolean ib_update_ctx = false
boolean ib_insert_ctx = false
boolean ib_delete_ctx = false
boolean ib_trace_ctx = false
event type integer e_action_crt_pwd ( )
end type
global c_legal_entity c_legal_entity

type variables

protected:
long							il_tv_insert_hdl, il_delete_hdl_item, il_modify_hdl
boolean						ib_add_branch


end variables

forward prototypes
public function string f_get_enter_colname (string vs_dwo)
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_dwo_related ()
public subroutine f_set_actionpane ()
end prototypes

event type integer e_action_crt_pwd();string						ls_comp_code, ls_tax, ls_pwdstr
t_dw_mpl				ldw_legal, ldw_org
c_connect_srv			lc_conn


ldw_legal= this.iw_display.f_get_dw( 'd_legal_entity_form')

if isvalid(ldw_legal) then
	if ldw_legal.getrow( ) > 0 then
		ls_comp_code = ldw_legal.getitemstring( ldw_legal.getrow( )  ,'code')
		ls_pwdstr = lc_conn.f_crt_pwd( ls_comp_code)
		ldw_legal.setitem(  ldw_legal.getrow( ) , 'db_password',ls_pwdstr)
	end if
end if

return 1
end event

public function string f_get_enter_colname (string vs_dwo);//
//if vs_dwo = 'd_menu_item' then
//	return 'sort_number'
//else
//	return 'text'
//end if
return ''
end function

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_legal_entity_form'
istr_dwo[1].s_dwo_form = 'd_legal_entity_form'
istr_dwo[1].s_dwo_grid = ''
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_organization_form;d_representative_form;d_address_grid;d_dept_grid;'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Công ty'

istr_dwo[2].s_dwo_default =  'd_organization_form'
istr_dwo[2].s_dwo_form = 'd_organization_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_detail = true
istr_dwo[2].s_dwo_master = 'd_legal_entity_form'
istr_dwo[2].s_master_keycol = 'ID'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[2].b_ref_table_yn  = false
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_focus_master = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_description = 'Tổ chức'
istr_dwo[2].s_pic_ref_table = 'LEGAL_ENTITY'
istr_dwo[2].s_pic_ref_field = 'object_ref_id'
istr_dwo[2].s_pic_ref_colname = 'LOGO'

istr_dwo[3].s_dwo_default =  'd_representative_form'
istr_dwo[3].s_dwo_form = 'd_representative_form'
istr_dwo[3].s_dwo_grid = ''
istr_dwo[3].b_detail = true
istr_dwo[3].s_dwo_master = 'd_legal_entity_form'
istr_dwo[3].s_master_keycol = 'ID'
istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[3].b_ref_table_yn  = false
istr_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[3].b_insert = true
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = true
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_excel = true
istr_dwo[3].b_traceable = true
istr_dwo[3].b_focus_master = true
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].s_description = 'Người đại diện'
end subroutine

public subroutine f_set_dwo_tabpage ();
iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1dgb_2dfxgb'
iastr_dwo_tabpage[1].i_leftpart_width = 1300
iastr_dwo_tabpage[1].i_fixedpart1_height = 280
iastr_dwo_tabpage[1].i_index = 1
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_address_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_address_grid'
iastr_dwo_tabpage[1].str_dwo[1].b_master = true
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_legal_entity_form;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = 'd_main_contact_form;d_contact_grid;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = 'd_address_form;'
iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol = 'ID'
iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID'
iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE'
iastr_dwo_tabpage[1].str_dwo[1].b_insert = true
iastr_dwo_tabpage[1].str_dwo[1].b_update = true
iastr_dwo_tabpage[1].str_dwo[1].b_delete = true
iastr_dwo_tabpage[1].str_dwo[1].b_query = true
iastr_dwo_tabpage[1].str_dwo[1].b_print = true
iastr_dwo_tabpage[1].str_dwo[1].b_excel = true
iastr_dwo_tabpage[1].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Trụ sở'
iastr_dwo_tabpage[1].str_dwo[1].s_gb_name = 'gb_6'

iastr_dwo_tabpage[1].str_dwo[2].s_dwo_default =  'd_address_form'
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_form = 'd_address_form'
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_grid = ''
iastr_dwo_tabpage[1].str_dwo[2].b_master = false
iastr_dwo_tabpage[1].str_dwo[2].b_detail = false
iastr_dwo_tabpage[1].str_dwo[2].b_shared = true
iastr_dwo_tabpage[1].str_dwo[2].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_master = 'd_address_grid'
iastr_dwo_tabpage[1].str_dwo[2].s_master_keycol = ''
iastr_dwo_tabpage[1].str_dwo[2].s_detail_keycol = ''
iastr_dwo_tabpage[1].str_dwo[2].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[2].s_ref_table_field = ''
iastr_dwo_tabpage[1].str_dwo[2].b_insert = true
iastr_dwo_tabpage[1].str_dwo[2].b_update = true
iastr_dwo_tabpage[1].str_dwo[2].b_delete = true
iastr_dwo_tabpage[1].str_dwo[2].b_query = true
iastr_dwo_tabpage[1].str_dwo[2].b_print = true
iastr_dwo_tabpage[1].str_dwo[2].b_excel = true
iastr_dwo_tabpage[1].str_dwo[2].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[2].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[2].s_description ='Địa chỉ trụ sở'
iastr_dwo_tabpage[1].str_dwo[2].s_gb_name = 'gb_7'

iastr_dwo_tabpage[1].str_dwo[3].s_dwo_default =  'd_main_contact_form'
iastr_dwo_tabpage[1].str_dwo[3].s_dwo_form = 'd_main_contact_form'
iastr_dwo_tabpage[1].str_dwo[3].s_dwo_grid = ''
iastr_dwo_tabpage[1].str_dwo[3].b_master = false
iastr_dwo_tabpage[1].str_dwo[3].b_detail = true
iastr_dwo_tabpage[1].str_dwo[3].b_shared = false
iastr_dwo_tabpage[1].str_dwo[3].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[3].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[3].s_dwo_master = 'd_address_grid;'
iastr_dwo_tabpage[1].str_dwo[3].s_master_keycol = 'ID'
iastr_dwo_tabpage[1].str_dwo[3].s_detail_keycol = 'OBJECT_REF_ID'
iastr_dwo_tabpage[1].str_dwo[3].b_ref_table_yn  = true
iastr_dwo_tabpage[1].str_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE'
iastr_dwo_tabpage[1].str_dwo[3].b_insert = true
iastr_dwo_tabpage[1].str_dwo[3].b_update = true
iastr_dwo_tabpage[1].str_dwo[3].b_delete = true
iastr_dwo_tabpage[1].str_dwo[3].b_query = true
iastr_dwo_tabpage[1].str_dwo[3].b_print = true
iastr_dwo_tabpage[1].str_dwo[3].b_excel = true
iastr_dwo_tabpage[1].str_dwo[3].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[3].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[3].s_description ='Người liên hệ chính'

iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_display_model = '1d'
iastr_dwo_tabpage[2].i_index = 2
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_contact_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = 'd_contact_form'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = 'd_contact_grid'
iastr_dwo_tabpage[2].str_dwo[1].b_master = false
iastr_dwo_tabpage[2].str_dwo[1].b_detail = true
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_address_grid;'
iastr_dwo_tabpage[2].str_dwo[1].s_master_keycol = 'ID'
iastr_dwo_tabpage[2].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID'
iastr_dwo_tabpage[2].str_dwo[1].b_ref_table_yn  = true
iastr_dwo_tabpage[2].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE'
iastr_dwo_tabpage[2].str_dwo[1].b_insert = true
iastr_dwo_tabpage[2].str_dwo[1].b_update = true
iastr_dwo_tabpage[2].str_dwo[1].b_delete = true
iastr_dwo_tabpage[2].str_dwo[1].b_query = true
iastr_dwo_tabpage[2].str_dwo[1].b_print = true
iastr_dwo_tabpage[2].str_dwo[1].b_excel = true
iastr_dwo_tabpage[2].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[2].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[2].str_dwo[1].s_description ='Người liên hệ'

iastr_dwo_tabpage[3].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[3].s_display_model = '1d'
iastr_dwo_tabpage[3].i_index = 3
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_default =  'd_dept_grid'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_grid = 'd_dept_grid'
iastr_dwo_tabpage[3].str_dwo[1].b_master = false
iastr_dwo_tabpage[3].str_dwo[1].b_detail = true
iastr_dwo_tabpage[3].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_master = 'd_legal_entity_form;'
iastr_dwo_tabpage[3].str_dwo[1].s_master_keycol = 'ID'
iastr_dwo_tabpage[3].str_dwo[1].s_detail_keycol = 'object_ref_id'
iastr_dwo_tabpage[3].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[3].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE'
iastr_dwo_tabpage[3].str_dwo[1].b_insert = true
iastr_dwo_tabpage[3].str_dwo[1].b_update = true
iastr_dwo_tabpage[3].str_dwo[1].b_delete = true
iastr_dwo_tabpage[3].str_dwo[1].b_query = true
iastr_dwo_tabpage[3].str_dwo[1].b_print = true
iastr_dwo_tabpage[3].str_dwo[1].b_excel = true
iastr_dwo_tabpage[3].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[3].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[3].str_dwo[1].s_description ='Phòng ban'

end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_business_group'
istr_dwo_related[1].s_main_obj_dwo = 'd_legal_entity_form'
istr_dwo_related[1].s_main_obj_column = 'bus_grp_ID'
istr_dwo_related[1].s_related_obj_dwo = 'd_business_group_form'
istr_dwo_related[1].s_related_obj_column = 'id'
istr_dwo_related[1].s_relatedtext_column = 'code;name'
istr_dwo_related[1].s_text = 'Công ty mẹ của:'

istr_dwo_related[2].s_related_obj_name = 'c_map_n'
istr_dwo_related[2].s_main_obj_dwo = 'd_address_form'
istr_dwo_related[2].s_main_obj_column = 'ID'
istr_dwo_related[2].s_related_obj_dwo = 'd_address_map_form'
istr_dwo_related[2].s_related_obj_column = 'id'

end subroutine

public subroutine f_set_actionpane ();

istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name =  'b_business_group;b_staff;'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'

end subroutine

on c_legal_entity.create
call super::create
end on

on c_legal_entity.destroy
call super::destroy
end on

event constructor;call super::constructor;
is_table = 'LEGAL_ENTITY'
ib_changed_dwo_4edit = false
this.ib_keyboardlocked = true
is_display_model = 'up_1tv_fx3dfx_lo_tb'
is_object_title = 'Đăng ký công ty'


istr_actionpane[1].s_button_name = 'b_add;b_insert;b_modify;b_save;b_query;b_execquery;b_filteron;b_refresh;b_delete;b_print;b_view_report;b_crt_pwd;'
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title

istr_tvo[1].ds_tv_item = create datastore
istr_tvo[1].ds_tv_item.dataobject = 'ds_legal_entity'
istr_tvo[1].s_popmenu_items = 'm_add_branch'

end event

event e_dw_e_preretrieve;call super::e_dw_e_preretrieve;
window					lw_display
treeview					ltv_handling
treeviewitem			l_tvi
datawindow				ldw_main
long						ll_cur_hdl
any						laa_retrieve_arg[]
ldw_main = iw_display.dynamic f_get_dwmain()
if rpo_dw =  ldw_main then
	if not isvalid(iw_display) then return -1
	ltv_handling = iw_display.dynamic f_get_tv()
	if isvalid(ltv_handling) then
		ll_cur_hdl = ltv_handling.finditem( currenttreeitem!, 0)
		if ll_cur_hdl = -1 then
			ll_cur_hdl = ltv_handling.finditem( roottreeitem!, 0)
			if ll_cur_hdl = -1 then return -1
		end if
		ltv_handling.getitem( ll_cur_hdl, l_tvi)
		ipo_tv = l_tvi.data
		laa_retrieve_arg[1] = double(ipo_tv.f_get_id( ) )
		ldw_main.dynamic f_set_retrieve_args(laa_retrieve_arg[])
	else
		return -1
	end if
end if
return 0
end event

event e_tv_selectionchanged;call super::e_tv_selectionchanged;long				ll_cur_hdl
datawindow		ldw_handling

if idb_main_ID > 0 then 
	ll_cur_hdl = rpo_tv.dynamic f_find_item_hdl(string(idb_main_ID))
	if ll_cur_hdl > 0 then
		rpo_tv.selectitem(ll_cur_hdl)
	end if
	idb_main_ID = 0 
	return 1
end if
if isvalid(iw_display) then
	ldw_handling = iw_display.dynamic f_get_dwmain()
	if isvalid(ldw_handling) then
		iw_display.dynamic f_set_idwfocus(ldw_handling)
		if not iw_display.ib_opening then 
			connect using it_transaction;
		end if
		ll_cur_hdl = ldw_handling.dynamic event e_retrieve()	
		if not iw_display.ib_opening then 
			disconnect using it_transaction;
		end if		
	else
		return -1
	end if
end if
return 1
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;treeview			ltv_handling
treeviewitem		l_tvi
datawindow		ldw_legal
long				ll_cur_hdl, ll_parent_hdl
double			ldb_up_id, ldb_Id
string				ls_branch_yn


if rpo_dw.dataobject = 'd_legal_entity_form' then
	//-- lấy handle của treeview item hiện hành --//
	if isvalid(iw_display) then
		ltv_handling = iw_display.dynamic f_get_tv()
		if isvalid(ltv_handling) then
			ll_cur_hdl = ltv_handling.finditem(currenttreeitem!, 0)
			if ll_cur_hdl = -1 then
				ll_cur_hdl = ltv_handling.finditem( roottreeitem!, 0)
			end if
		end if
	end if
	if ll_cur_hdl = -1 then
		return -1
	end if
	
	//-- lấy treeview item --//
	ltv_handling.getitem( ll_cur_hdl, l_tvi)	
	ipo_tv = l_tvi.data

	//-- gán menu_id và up_menu_id --//
	if ib_add_branch then
		ldb_up_id = ipo_tv.istr_tv.db_id
		rpo_dw.setitem(vl_currentrow, 'Up_ID', ldb_up_id )	
		rpo_dw.setitem(vl_currentrow, 'branch_yn','Y')
	end if

	// -- ghi nhớ treeview handle thêm vào --//
	this.f_set_tv_structure(ldb_up_id , '_ _ _ _ _ _' )
	il_tv_insert_hdl = ltv_handling.dynamic f_populate_item(ipo_tv)	
	if il_tv_insert_hdl = -1 then 
		return -1
	end if	
	
	ltv_handling.expanditem( ll_cur_hdl)
	ib_add_branch = false

end if

return 0
end event

event e_pm_clicked;call super::e_pm_clicked;
datawindow		ldw_main

if rm_popup.dynamic f_get_clickedmenu() = 'm_add_branch' then
	if isvalid(iw_display) then
		ldw_main = iw_display.dynamic f_get_dwmain()
		iw_display.dynamic f_set_idwfocus(ldw_main)
		this.ib_add_branch = true
		iw_display.dynamic event e_add()
		rm_popup.dynamic f_set_clickedmenu("")
	end if
end if
return 1
end event

event e_tv_rightclicked;call super::e_tv_rightclicked;
datawindow		ldw_focus


if isvalid(iw_display) then
	ldw_focus = iw_display.dynamic f_get_idwfocus()
	if isvalid(ldw_focus) then
		if not ldw_focus.dynamic f_get_ib_editing() then
			rtv_handling.selectitem(vl_clicked_handle)
		else
			return -1
		end if
	else
		return -1
	end if
end if
return 1
end event

event e_window_e_postdelete;call super::e_window_e_postdelete;
string					ls_label
long					ll_new_hdl, ll_row
treeview				ltv_handling
treeviewitem		l_tvi
datawindow			ldw_main, ldw_label

//-- Sau khi xóa refresh lại treeview --//
ltv_handling = iw_display.dynamic f_get_tv()
if isvalid(ltv_handling) then
	//-- Xoa menu item (header) --//
	if this.il_delete_hdl_item > 0 then
		ll_new_hdl = ltv_handling.finditem( parenttreeitem!, this.il_delete_hdl_item )
		ltv_handling.deleteitem( this.il_delete_hdl_item )
		this.il_delete_hdl_item = 0
		//-- rollback modify --//
		ldw_main = iw_display.dynamic f_get_dwmain()
		ldw_main.dynamic f_set_ib_inserting(false)
		ldw_main.triggerevent('e_rollback_modify')
		
		if ll_new_hdl = -1 then
			ll_new_hdl = ltv_handling.finditem( roottreeitem!, 0)
		end if
		ltv_handling.selectitem( ll_new_hdl)		
	end if
else
	return -1
end if
return 0
end event

event e_window_e_postsave;call super::e_window_e_postsave;
treeview			ltv_handling

//-- reset item treeview --//
if il_modify_hdl > 0 or  il_tv_insert_hdl > 0 then
	ltv_handling = iw_display.dynamic f_get_tv()
	if not isvalid(ltv_handling) then return -1
	if this.f_set_tv_structure( 'code') <> -1 then
		if il_tv_insert_hdl > 0 then
			ltv_handling.setredraw( false)
			ltv_handling.dynamic f_reset_item(ipo_tv, il_tv_insert_hdl)
			ltv_handling.selectitem(il_tv_insert_hdl)
			ltv_handling.setredraw( true)
			il_tv_insert_hdl = 0
		end if
		if il_modify_hdl > 0 then
			ltv_handling.setredraw( false)
			ltv_handling.dynamic f_reset_item(ipo_tv, il_modify_hdl)
			ltv_handling.selectitem(il_modify_hdl)
			ltv_handling.setredraw( true)
			il_modify_hdl = 0
		end if		
	end if
end if
return 1
end event

event e_dw_e_postdelete;call super::e_dw_e_postdelete;//-- Nhớ lại handle của item bị xóa --//

long					ll_cur_hdl
treeview			ltv_handling

if rpo_dw.dataobject = 'd_legal_entity_form' then
	if this.il_tv_insert_hdl > 0 then
		this.il_delete_hdl_item = this.il_tv_insert_hdl
		this.il_tv_insert_hdl = 0
	else
		if isvalid(iw_display) then
			ltv_handling = iw_display.dynamic f_get_tv()
			if isvalid(ltv_handling) then
				ll_cur_hdl = ltv_handling.finditem( currenttreeitem!, 0)
				if ll_cur_hdl > 0 then
					this.il_delete_hdl_item = ll_cur_hdl
					return 1
				end if
			end if
		end if			
	end if
end if
return 0
end event

event e_window_e_postmodify;call super::e_window_e_postmodify;
treeview			ltv_handling

//-- ghi nhớ lại handle hiện hành --//
ltv_handling = iw_display.dynamic f_get_tv()
if isvalid(ltv_handling) then
	il_modify_hdl = ltv_handling.finditem( currenttreeitem!, 0 )
end if
return 1
end event

event e_tv_selectionchanging;call super::e_tv_selectionchanging;
datawindow			ldw_focus

ldw_focus = iw_display.dynamic f_get_idwfocus()
if isvalid(ldw_focus) then
	if ldw_focus.dynamic f_get_ib_editing() then
		return 1
	end if
end if
return 0
end event

event e_window_e_refresh;call super::e_window_e_refresh;any			la_arg[5]

treeview		ltv_menu
ltv_menu = iw_display.dynamic f_get_tv()
if isvalid(ltv_menu) then
	return this.f_display_on_tv( ltv_menu, la_arg)
end if
return 0
end event

event e_action_ctrl_bttn;//-- override --//

datawindow				ldw_focus
int								li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	//-- control d_action_edit --//
	FOR li_idx = 1 to upperbound(istr_actionpane[]) 
		if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
			if ldw_focus.dynamic f_get_ib_shared() then
				ldw_focus = ldw_focus.dynamic f_getdwmaster()
			end if			
			if ldw_focus.dynamic f_get_ib_detail() then
				if ib_changed_dwo_4edit then
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify; b_filteron;b_query;b_refresh;b_delete;b_crt_pwd;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_filteron;b_query;b_refresh;b_delete;b_crt_pwd;'
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query; b_refresh;b_delete;b_crt_pwd;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query; b_refresh;b_delete;b_crt_pwd;'
					end if
				end if
			else				
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_crt_pwd;'
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_crt_pwd;'
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
			istr_actionpane[li_idx].s_visible_buttons =   'b_business_group;b_staff;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
			istr_actionpane[li_idx].s_visible_buttons =  'b_note;b_doc_trace;b_user_trace;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then				
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_open;call super::e_window_open;
treeview			ltv_display
int					li_rtn
any				la_arg[5]
long				ll_root_hdl

if not isvalid(iw_display) then return -1

//-- load menu vao treeview --//
ltv_display = iw_display.dynamic f_get_tv()
if isvalid(ltv_display) then
	li_rtn = this.f_display_on_tv( ltv_display,la_arg[])
	ll_root_hdl = ltv_display.FindItem(RootTreeItem! , 0)
	ltv_display.selectitem(ll_root_hdl)
	ltv_display.expanditem(ll_root_hdl)
else
	return -1
end if

return 1

end event

event e_window_e_preopen;call super::e_window_e_preopen;
iw_display.f_set_ii_upperpart_height(1200)
iw_display.f_set_ii_leftpart_width(600)
iw_display.f_set_ii_fixedpart1_height( 250)
iw_display.f_set_ii_fixedpart2_height( 450)
//iw_display.f_set_ii_fixedpart3_height( 250)
return 0
end event

event e_dw_e_postretrieve;call super::e_dw_e_postretrieve;if rpo_dw.dataobject = 'd_legal_entity_form' then
	rpo_dw.dynamic f_filter_detail( )
end if
return ancestorreturnvalue
end event

