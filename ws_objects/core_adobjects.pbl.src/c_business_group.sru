$PBExportHeader$c_business_group.sru
forward
global type c_business_group from s_object_display
end type
end forward

global type c_business_group from s_object_display
end type
global c_business_group c_business_group

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

public function string f_get_enter_colname (string vs_dwo);//
//if vs_dwo = 'd_menu_item' then
//	return 'sort_number'
//else
//	return 'text'
//end if
return ''
end function

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_business_group_form'
istr_dwo[1].s_dwo_form = 'd_business_group_form'
istr_dwo[1].s_dwo_grid = ''
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_organization_form;d_representative_form;d_address_grid;'
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
istr_dwo[2].s_dwo_master = 'd_business_group_form'
istr_dwo[2].s_master_keycol = 'ID'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[2].b_ref_table_yn  = true
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].b_focus_master = true
istr_dwo[2].s_description = 'Tổ chức'
istr_dwo[2].s_pic_ref_table = 'LEGAL_ENTITY'
istr_dwo[2].s_pic_ref_field = 'object_ref_id'
istr_dwo[2].s_pic_ref_colname = 'LOGO'

istr_dwo[3].s_dwo_default =  'd_representative_form'
istr_dwo[3].s_dwo_form = 'd_representative_form'
istr_dwo[3].s_dwo_grid = ''
istr_dwo[3].b_detail = true
istr_dwo[3].s_dwo_master = 'd_business_group_form'
istr_dwo[3].s_master_keycol = 'ID'
istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[3].b_ref_table_yn  = true
istr_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[3].b_insert = true
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = true
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_excel = true
istr_dwo[3].b_traceable = true
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].s_description = 'Người đại diện'
end subroutine

public subroutine f_set_dwo_tabpage ();
iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1dgb_2dfxgb'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_address_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_address_grid'
iastr_dwo_tabpage[1].str_dwo[1].b_master = true
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_business_group_form;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = 'd_main_contact_form;d_contact_grid;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = 'd_address_form;'
iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol = 'ID'
iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID'
iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = true
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
iastr_dwo_tabpage[1].str_dwo[3].s_description ='Địa chỉ trụ sở'

iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_display_model = '1d'
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


end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_legal_entity'
istr_dwo_related[1].s_main_obj_dwo = 'd_business_group_form'
istr_dwo_related[1].s_main_obj_column = 'ID'
istr_dwo_related[1].s_related_obj_dwo = 'd_legal_entity_form'
istr_dwo_related[1].s_related_obj_column = 'bus_grp_id'
istr_dwo_related[1].s_text = 'Công ty con của: '

end subroutine

public subroutine f_set_actionpane ();istr_actionpane[2].s_button_name =  'b_legal_entity;b_staff;'
istr_actionpane[2].s_visible_buttons = 'b_legal_entity;b_staff;'
istr_actionpane[2].s_enabled_buttons = 'b_legal_entity;b_staff;'

istr_actionpane[1].s_description = 'Tổng công ty'

end subroutine

on c_business_group.create
call super::create
end on

on c_business_group.destroy
call super::destroy
end on

event constructor;call super::constructor;
is_table = 'BUSINESS_GROUP'
ib_changed_dwo_4edit = false
is_display_model = 'up_1tv_fx3dfx_lo_tb'
is_object_title = 'Tổng công ty'

istr_tvo[1].ds_tv_item = create datastore
istr_tvo[1].ds_tv_item.dataobject = 'ds_business_group_tv'
istr_tvo[1].s_popmenu_items = 'm_add_branch'
end event

event e_window_e_preopen;call super::e_window_e_preopen;
iw_display.f_set_ii_upperpart_height(1200)
iw_display.f_set_ii_leftpart_width(600)
iw_display.f_set_ii_fixedpart1_height( 250)
iw_display.f_set_ii_fixedpart2_height( 450)
//iw_display.f_set_ii_fixedpart3_height( 250)

return 0
end event

event e_tv_selectionchanged;call super::e_tv_selectionchanged;
t_dw_mpl		ldw_handling

if isvalid(iw_display) then
	ldw_handling = iw_display.dynamic f_get_dwmain()
	if isvalid(ldw_handling) then
		iw_display.dynamic f_set_idwfocus(ldw_handling)
		return ldw_handling.triggerevent('e_retrieve')		
	else
		return -1
	end if
end if
return 1
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;treeview				ltv_handling
treeviewitem		l_tvi
long					ll_cur_hdl, ll_parent_hdl
double				ldb_up_id


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


if rpo_dw.dataobject = 'd_legal_entity_form' then
	//-- lấy treeview item --//
	ltv_handling.getitem( ll_cur_hdl, l_tvi)	
	ipo_tv = l_tvi.data

	//-- gán menu_id và up_menu_id --//
	if ib_add_branch then
		ldb_up_id = ipo_tv.istr_tv.db_id
		rpo_dw.setitem(vl_currentrow, 'legal_entity_Company_ID', ldb_up_id )	
		rpo_dw.setitem(vl_currentrow, 'legal_entity_branch_yn','Y')
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
t_dw_mpl		ldw_main

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
t_dw_mpl		ldw_focus


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
t_dw_mpl			ldw_main, ldw_label

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
	if this.f_set_tv_structure( 'parent_code') <> -1 then
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
treeview				ltv_handling

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
t_dw_mpl			ldw_focus

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
	la_arg[1]= this.istr_data_related[1].s_data[1]
	return this.f_display_on_tv( ltv_menu, la_arg)
end if
return 0
end event

event e_dw_e_preretrieve;call super::e_dw_e_preretrieve;
window					lw_display
treeview					ltv_handling
treeviewitem			l_tvi
long						ll_cur_hdl
any						laa_retrieve_arg[]

if rpo_dw.classname() = 'dw_1' then
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
		return rpo_dw.dynamic f_set_retrieve_args(laa_retrieve_arg)				
	else
		return -1
	end if
end if
return 0
end event

event e_window_open;call super::e_window_open;treeview						ltv_display
t_dw_mpl					ldw_related
s_str_dwo_related			lstr_data_related_empty[]
int								li_rtn
any							la_arg[5]
string							ls_coltype

if not isvalid(iw_display) then return -1

//-- load menu vao treeview --//
ltv_display = iw_display.dynamic f_get_tv()
if isvalid(ltv_display) then
	la_arg[1]= double(this.istr_data_related[1].s_data[1])
//	this.istr_data_related[] = lstr_data_related_empty[]
	li_rtn = this.f_display_on_tv( ltv_display, la_arg)
else
	return -1
end if
return 1
end event

