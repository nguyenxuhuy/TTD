$PBExportHeader$c_menu.sru
forward
global type c_menu from s_object_display
end type
end forward

global type c_menu from s_object_display
end type
global c_menu c_menu

type variables

protected:
long							il_tv_insert_hdl,il_tv_insert_hdl_label, il_delete_hdl_item, il_delete_hdl_label, il_modify_hdl
boolean						ib_add_submenu
c_menu_item				ic_menu_item

end variables

forward prototypes
public function integer f_set_menuitem_structure (long vl_row)
public function integer f_set_menuitem_structure (double vdb_id)
public function integer f_display_on_tv (ref treeview r_tv)
public function integer f_insert_tv_item (double vdb_id, ref treeview r_tv)
public function integer f_insert_tv_item (powerobject vpo_tv, ref treeview r_tv)
public function integer f_set_menuitem_structure (double vdb_up_id, string vs_label)
public function integer f_get_mod_submod_code (ref string rs_mod_code, ref string rs_submod_code)
public function integer f_set_menuitem_structure (datawindow vdw_menu_item, string vs_label)
public function string f_get_enter_colname (string vs_dwo)
public subroutine f_set_dwo_window ()
end prototypes

public function integer f_set_menuitem_structure (long vl_row);int 			li_rtn
string		ls_label
if not isvalid(istr_tvo[1].ds_tv_item) then return -1
if vl_row < 1 or vl_row > istr_tvo[1].ds_tv_item.rowcount( ) then return -1

ic_menu_item.istr_tv.db_id = istr_tvo[1].ds_tv_item.getitemnumber(vl_row, 'tv_id')
ic_menu_item.istr_tv.db_menu_id = istr_tvo[1].ds_tv_item.getitemnumber(vl_row, 'menu_id')
ic_menu_item.istr_tv.db_up_id = istr_tvo[1].ds_tv_item.getitemnumber(vl_row, 'tv_up_id')
ic_menu_item.istr_tv.i_sort = istr_tvo[1].ds_tv_item.getitemnumber(vl_row, 'tv_sort')
ic_menu_item.istr_tv.s_object = istr_tvo[1].ds_tv_item.getitemstring(vl_row, 'code')
ic_menu_item.istr_tv.s_submod_yn = istr_tvo[1].ds_tv_item.getitemstring(vl_row, 'submod_yn')
ls_label = istr_tvo[1].ds_tv_item.getitemstring(vl_row, 'tv_label')
if ls_label='' or isnull(ls_label) then ls_label = ' _ _ _ _ _ '
ic_menu_item.istr_tv.s_label = string( istr_tvo[1].ds_tv_item.getitemnumber(vl_row, 'tv_sort')) +'-'+ ls_label
ic_menu_item.istr_tv.i_pic_idx =  istr_tvo[1].ds_tv_item.getitemnumber(vl_row, 'tv_pic_idx')
ic_menu_item.istr_tv.i_sel_pic_idx =  istr_tvo[1].ds_tv_item.getitemnumber(vl_row, 'tv_sel_pic_idx')

return 1
end function

public function integer f_set_menuitem_structure (double vdb_id);long	ll_row

ll_row =  istr_tvo[1].ds_tv_item.find( "tv_ID =" + string(vdb_id), 1,  istr_tvo[1].ds_tv_item.rowcount( ) )
if ll_row > 0 then
	return this.f_set_menuitem_structure( ll_row)
end if
return ll_row

end function

public function integer f_display_on_tv (ref treeview r_tv);transaction		lt_transaction
long 				ll_row, ll_root_hdl
int					li_rtn, li_cnt

//-- xóa treeview để load lại --//
if isvalid(iw_display) then
	iw_display.dynamic f_get_transaction(lt_transaction)
	if isvalid(lt_transaction) then
		istr_tvo[1].ds_tv_item.settransobject( lt_transaction)
	else 
		return -1
	end if
	r_tv.dynamic f_delete_all_items()
end if
//-- load treeview items--//
li_cnt =  istr_tvo[1].ds_tv_item.retrieve(gs_user_lang , gi_user_comp_id, gdb_branch ) 
if li_cnt > 0 then
	FOR ll_row = 1 to li_cnt
		li_rtn = this.f_set_menuitem_structure( ll_row)
		if li_rtn = 1 then
			if r_tv.dynamic f_find_item_hdl(ic_menu_item.f_get_tv_findstring( )) = -1 then
				li_rtn = this.f_insert_tv_item( ic_menu_item, r_tv)
			else
				continue
			end if
		else
			return -1
		end if
	NEXT
	ll_root_hdl = r_tv.FindItem(RootTreeItem! , 0)
	r_tv.setredraw(false)
	r_tv.SortAll(ll_root_hdl , userdefinedsort!)
	r_tv.selectitem(ll_root_hdl)
	r_tv.expanditem(ll_root_hdl)
	
	r_tv.setredraw(true)	
end if
return li_cnt
end function

public function integer f_insert_tv_item (double vdb_id, ref treeview r_tv);int					li_rtn
double			ldb_ID

if vdb_id < 1 then return -1
if not isvalid(r_tv) then return -1

if this.f_set_menuitem_structure( vdb_id) = 1 then
	li_rtn = r_tv.dynamic f_populate_item(ic_menu_item)
	if li_rtn = 1 then
		return 1
	else
		ldb_ID = double(ic_menu_item.f_get_tv_parentstring( ))
		if ldb_ID > 0 then
			li_rtn = this.f_insert_tv_item( ldb_id, r_tv)
			if li_rtn = 1 then return 1
		else
			return -1
		end if
	end if
else
	return -1
end if
return 1
end function

public function integer f_insert_tv_item (powerobject vpo_tv, ref treeview r_tv);int				li_rtn
double		ldb_id

li_rtn =  r_tv.dynamic f_populate_item(vpo_tv)
if li_rtn = -1 then
	ldb_id = double(ic_menu_item.f_get_tv_parentstring( ))
	if ldb_id > 0 then
		li_rtn = this.f_insert_tv_item( ldb_id, r_tv)
	end if
end if
return li_rtn
end function

public function integer f_set_menuitem_structure (double vdb_up_id, string vs_label);
string 		ls_null
double		ldb_null

setnull(ls_null)
setnull(ldb_null)

ic_menu_item.istr_tv.db_id = ldb_null
ic_menu_item.istr_tv.db_menu_id =ldb_null
ic_menu_item.istr_tv.db_up_id = vdb_up_id
ic_menu_item.istr_tv.i_sort = ldb_null
ic_menu_item.istr_tv.s_object = ls_null
ic_menu_item.istr_tv.s_submod_yn = ls_null
ic_menu_item.istr_tv.s_label = vs_label

return 1
end function

public function integer f_get_mod_submod_code (ref string rs_mod_code, ref string rs_submod_code);/*****************************************
Chức năng: tìm module code của menu id
------------------------------------------------------------------------
Tham số: vdb_id (Id của menu cần tìm submodule)
------------------------------------------------------------------------
Return:  module code
=================================*/
string			ls_cur_mod_code, ls_cur_submod_code, ls_submod_yn, ls_cur_row_code
long				ll_row
double			ldb_id

if  ic_menu_item.istr_tv.db_menu_id = 0 or isnull(ic_menu_item.istr_tv.db_menu_id) then
	ll_row = istr_tvo[1].ds_tv_item.find("tv_id="+ string(ic_menu_item.istr_tv.db_id),1,istr_tvo[1].ds_tv_item.rowcount())
	if ll_row > 0 then
		ls_cur_row_code = istr_tvo[1].ds_tv_item.getitemstring(ll_row,"code")
	else
		return -1
	end if
else
	ll_row = istr_tvo[1].ds_tv_item.find("tv_id="+ string(ic_menu_item.istr_tv.db_menu_id ),1,istr_tvo[1].ds_tv_item.rowcount())
	if ll_row > 0 then
		//-- truong hop menu_id hien tai la sub-module --//
		if ic_menu_item.f_is_submodule_ex(ic_menu_item.istr_tv.db_menu_id , it_transaction ) then
			ls_cur_submod_code = istr_tvo[1].ds_tv_item.getitemstring(ll_row,"code")
			ldb_id = istr_tvo[1].ds_tv_item.getitemnumber(ll_row,"menu_id")
			ll_row = istr_tvo[1].ds_tv_item.find("tv_id="+ string(ldb_id ),1,istr_tvo[1].ds_tv_item.rowcount())
			if ll_row > 0 then
				ls_cur_mod_code = istr_tvo[1].ds_tv_item.getitemstring(ll_row,"code")
			else
				return -1
			end if				
		else //-- truong hop menu_id hien tai la module --//
			ls_cur_mod_code = istr_tvo[1].ds_tv_item.getitemstring(ll_row,"code")
			ls_cur_submod_code =''
		end if
	else
		return -1
	end if	
end if

//-- gán code --//
if ib_add_submenu then
	if  ic_menu_item.istr_tv.db_menu_id = 0 or isnull(ic_menu_item.istr_tv.db_menu_id) then
		rs_mod_code = ls_cur_row_code
		rs_submod_code = ''
	else
		rs_mod_code = ls_cur_mod_code
		rs_submod_code = ls_cur_submod_code
	end if
else
	rs_mod_code = ls_cur_mod_code
	rs_submod_code =	ls_cur_submod_code
end if
return 1

end function

public function integer f_set_menuitem_structure (datawindow vdw_menu_item, string vs_label);

if not isvalid(vdw_menu_item) then return -1
if vdw_menu_item.rowcount( ) = 0 then return 0

ic_menu_item.istr_tv.db_id = vdw_menu_item.getitemnumber(vdw_menu_item.getrow(), 'id')
ic_menu_item.istr_tv.db_menu_id = vdw_menu_item.getitemnumber(vdw_menu_item.getrow(), 'menu_id')
ic_menu_item.istr_tv.db_up_id = vdw_menu_item.getitemnumber(vdw_menu_item.getrow(), 'up_menu_id')
ic_menu_item.istr_tv.i_sort = vdw_menu_item.getitemnumber(vdw_menu_item.getrow(), 'sort_number')
ic_menu_item.istr_tv.s_object = vdw_menu_item.getitemstring(vdw_menu_item.getrow(), 'code')
ic_menu_item.istr_tv.s_submod_yn = vdw_menu_item.getitemstring(vdw_menu_item.getrow(), 'submod_yn')
if isnull(ic_menu_item.istr_tv.i_sort) then
	ic_menu_item.istr_tv.s_label =  vs_label
else
	ic_menu_item.istr_tv.s_label = string(ic_menu_item.istr_tv.i_sort) +'-'+ vs_label
end if
ic_menu_item.istr_tv.i_pic_idx =  vdw_menu_item.getitemnumber(vdw_menu_item.getrow(), 'type')
ic_menu_item.istr_tv.i_sel_pic_idx =  vdw_menu_item.getitemnumber(vdw_menu_item.getrow(), 'type') + 1

return 1


end function

public function string f_get_enter_colname (string vs_dwo);
if vs_dwo = 'd_menu_item' then
	return 'sort_number'
else
	return 'text'
end if
end function

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_menu_item_form'
istr_dwo[1].s_dwo_form = 'd_menu_item_form'
istr_dwo[1].s_dwo_grid = ''
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_menu_item_label_grid'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Đăng ký menu'

istr_dwo[2].s_dwo_default =  'd_menu_item_label_grid'
istr_dwo[2].s_dwo_form = 'd_menu_item_label_form'
istr_dwo[2].s_dwo_grid = 'd_menu_item_label_grid'
istr_dwo[2].b_detail = true
istr_dwo[2].s_dwo_master = 'd_menu_item_form'
istr_dwo[2].s_master_keycol = 'code'
istr_dwo[2].s_detail_keycol = 'code'
istr_dwo[2].b_ref_table_yn  = false
istr_dwo[2].s_ref_table_field = 'subcode'
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_description = 'Tên nhãn của menu'

end subroutine

on c_menu.create
call super::create
end on

on c_menu.destroy
call super::destroy
end on

event constructor;call super::constructor;
is_table = 'MENU'
ib_changed_dwo_4edit = false
ib_keyboardlocked = true
is_object_title = 'Đăng ký menu'

istr_actionpane[1].s_button_name = 'e_add;e_delete;e_modify;'
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title

istr_tvo[1].ds_tv_item = create datastore
istr_tvo[1].ds_tv_item.dataobject = 'ds_menu_all'
istr_tvo[1].s_popmenu_items = 'm_add_submenu'



end event

event e_window_e_preopen;call super::e_window_e_preopen;
treeview			ltv_display
datawindow		ldw_focus
int						li_rtn

if not isvalid(iw_display) then return -1

//-- load menu vao treeview --//
ltv_display = iw_display.dynamic f_get_tv()
if isvalid(ltv_display) then
	li_rtn = this.f_display_on_tv( ltv_display)
else
	return -1
end if

return 1

end event

event e_dw_e_preretrieve;call super::e_dw_e_preretrieve;
window					lw_display
treeview					ltv_handling
treeviewitem			l_tvi
c_menu_item			lc_menu_item
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
		lc_menu_item = l_tvi.data
		laa_retrieve_arg[1] = double(lc_menu_item.f_get_tv_findstring( ))
		return rpo_dw.dynamic f_set_retrieve_args(laa_retrieve_arg)				
	else
		return -1
	end if
end if
return 0
end event

event e_tv_selectionchanged;call super::e_tv_selectionchanged;int  li_rtn
datawindow		ldw_handling

if isvalid(iw_display) then
	ldw_handling = iw_display.dynamic f_get_dwmain()
	if isvalid(ldw_handling) then
		iw_display.dynamic f_set_idwfocus(ldw_handling)
		if not iw_display.ib_opening then 
			connect using it_transaction;
		end if
		li_rtn = ldw_handling.triggerevent('e_retrieve')		
		if not iw_display.ib_opening then 
			disconnect using it_transaction;
		end if
		return li_rtn
	else
		return -1
	end if
end if
return 1
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;treeview			ltv_handling
treeviewitem		l_tvi

long				ll_cur_hdl, ll_parent_hdl
double			ldb_up_menu_id
string			ls_mod_code, ls_submod_code

// -- lấy handle của treeview item hiện hành --//
if isvalid(iw_display) then
	ltv_handling = iw_display.dynamic f_get_tv()
	if isvalid(ltv_handling) then
		ll_cur_hdl = ltv_handling.finditem( currenttreeitem!, 0)
		if ll_cur_hdl = -1 then
			ll_cur_hdl = ltv_handling.finditem( roottreeitem!, 0)
		end if
	end if
end if
if ll_cur_hdl = -1 then
	return -1
end if

if rpo_dw.dataobject = 'd_menu_item_label_grid' or  rpo_dw.dataobject = 'd_menu_item_label_form' then
	il_tv_insert_hdl_label = ll_cur_hdl
//	return rpo_dw.setitem(vl_currentrow,'subcode','MENU')
elseif rpo_dw.dataobject = 'd_menu_item_form' then
	//-- lấy treeview item --//
	ltv_handling.getitem( ll_cur_hdl, l_tvi)	
	ic_menu_item = l_tvi.data

	//-- gán menu_id và up_menu_id --//
	if ib_add_submenu then
		rpo_dw.setitem(vl_currentrow, 'up_menu_ID', ic_menu_item.istr_tv.db_id )
		if ic_menu_item.istr_tv.db_up_id = 0 or isnull(ic_menu_item.istr_tv.db_up_id) then
			rpo_dw.setitem(vl_currentrow, 'menu_ID', ic_menu_item.istr_tv.db_id)
		else
			if ic_menu_item.istr_tv.s_submod_yn = 'Y' then
				rpo_dw.setitem(vl_currentrow, 'menu_ID', ic_menu_item.istr_tv.db_id)
			else
				rpo_dw.setitem(vl_currentrow, 'menu_ID', ic_menu_item.istr_tv.db_menu_id)
			end if
		end if
	else
		rpo_dw.setitem(vl_currentrow, 'up_menu_ID', ic_menu_item.istr_tv.db_up_id )		
		rpo_dw.setitem(vl_currentrow, 'menu_ID', ic_menu_item.istr_tv.db_menu_id)
	end if
	
	//-- gán module code và submodule code --//
	this.f_set_menuitem_structure(rpo_dw , '_ _ _ _ _ _' )
	if this.f_get_mod_submod_code(ls_mod_code, ls_submod_code) = 1 then
		rpo_dw.setitem(vl_currentrow, 'module', ls_mod_code )		
		rpo_dw.setitem(vl_currentrow, 'submodule', ls_submod_code)		
	else
		return -1
	end if
	
	//-- insertitem mới cho treeview với lablel "_ _ _ _ _ _" --//
	if ib_add_submenu then
		ldb_up_menu_id =  ic_menu_item.istr_tv.db_id
	else
		ldb_up_menu_id =  ic_menu_item.istr_tv.db_up_id
	end if
//	this.f_set_menuitem_structure(ldb_up_menu_id , '_ _ _ _ _ _' )
	
	// -- ghi nhớ treeview handle thêm vào --//
	il_tv_insert_hdl = ltv_handling.dynamic f_populate_item(ic_menu_item)	
	if il_tv_insert_hdl = -1 then 
		return -1
	end if
	
	ltv_handling.expanditem( ll_cur_hdl)
	ib_add_submenu = false
end if
return 0
end event

event e_pm_clicked;call super::e_pm_clicked;
datawindow		ldw_main

if rm_popup.dynamic f_get_clickedmenu() = 'm_add_submenu' then
	if isvalid(iw_display) then
		ldw_main = iw_display.dynamic f_get_dwmain()
		iw_display.dynamic f_set_idwfocus(ldw_main)
		this.ib_add_submenu = true
		t_w_mdi.rbb_1.f_change_action_button('e_add')
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
		ltv_handling.triggerevent( selectionchanged!)
		ltv_handling.getitem(ll_new_hdl, l_tvi)
		ic_menu_item = l_tvi.data
		this.f_upd_sort_number( ldw_main, 'sort_number', 'up_menu_id',ic_menu_item.istr_tv.db_id )
	end if
	//-- xoa label --//
	if this.il_delete_hdl_label > 0 then
		ldw_main = iw_display.dynamic f_get_dwmain()
		if not isvalid(ldw_main) then return -1
		ldw_label = iw_display.dynamic f_get_dw_2()
		if not isvalid(ldw_label) then return -1
		if ldw_label.rowcount( ) > 0 then
			ll_row = ldw_label.find( "lang= '"+ gs_user_lang + "'", 1, ldw_label.rowcount())
			if ll_row > 0 then
				ls_label = ldw_label.getitemstring( ll_row, 'text')	
			else
				ls_label =  '_ _ _ _ _ _'
			end if
		else
			ls_label =  '_ _ _ _ _ _'
		end if
		
		if this.f_set_menuitem_structure(ldw_main , ls_label) = 1 then
			ltv_handling.setredraw( false)
			ltv_handling.dynamic f_reset_item(ic_menu_item, il_delete_hdl_label)
			ltv_handling.setredraw( true)
		end if
		il_delete_hdl_label = 0
	end if	
else
	return -1
end if
return 0
end event

event e_window_e_postsave;call super::e_window_e_postsave;long					ll_cur_hdl, ll_row
string				ls_label
treeview			ltv_handling
treeviewitem		l_tvi
datawindow		ldw_main, ldw_label


//-- reset item treeview --//
if il_modify_hdl > 0 or  il_tv_insert_hdl > 0 then
	ltv_handling = iw_display.dynamic f_get_tv()
	if not isvalid(ltv_handling) then return -1
	ldw_main = iw_display.dynamic f_get_dwmain()
	if not isvalid(ldw_main) then return -1
	ldw_label = iw_display.dynamic f_get_dw_2()
	if not isvalid(ldw_label) then return -1

	ll_row = ldw_label.find( "lang= '"+ gs_user_lang + "'", 1, ldw_label.rowcount())
	if ll_row > 0 then
		ls_label = ldw_label.getitemstring( ll_row, 'text')
	else
		ls_label = '_ _ _ _ _ _'
	end if

	if this.f_set_menuitem_structure(ldw_main , ls_label) = 1 then
		if il_tv_insert_hdl > 0 then
			ltv_handling.setredraw( false)
			ltv_handling.dynamic f_reset_item(ic_menu_item, il_tv_insert_hdl)
			ltv_handling.selectitem(il_tv_insert_hdl)
			ltv_handling.setredraw( true)
			il_tv_insert_hdl = 0
		end if
		if il_modify_hdl > 0 then
			ltv_handling.setredraw( false)
			ltv_handling.dynamic f_reset_item(ic_menu_item, il_modify_hdl)
			ltv_handling.selectitem(il_modify_hdl)
			ltv_handling.setredraw( true)
			il_modify_hdl = 0
		end if		
	end if
elseif il_delete_hdl_item > 0 then
	this.event e_window_e_postdelete( )
end if
return 1
end event

event e_dw_e_postdelete;call super::e_dw_e_postdelete;//-- Nhớ lại handle của item bị xóa --//

long					ll_cur_hdl
treeview			ltv_handling

if rpo_dw.dataobject = 'd_menu_item_form' then
	if this.il_tv_insert_hdl > 0 then
		this.il_delete_hdl_item  = this.il_tv_insert_hdl
		this.il_tv_insert_hdl = 0
	else
		if isvalid(iw_display) then
			ltv_handling = iw_display.dynamic f_get_tv()
			if isvalid(ltv_handling) then
				ll_cur_hdl = ltv_handling.finditem( currenttreeitem!, 0)
				if ll_cur_hdl > 0 then
					if rpo_dw.dataobject = 'd_menu_item_form' then
						this.il_delete_hdl_item = ll_cur_hdl
						return 1
					end if
				end if
			end if
		end if			
	end if
else
	if isvalid(iw_display) then
		ltv_handling = iw_display.dynamic f_get_tv()
		if isvalid(ltv_handling) then
			ll_cur_hdl = ltv_handling.finditem( currenttreeitem!, 0)
			if ll_cur_hdl > 0 then
				this.il_delete_hdl_label = ll_cur_hdl
				return 0
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

event e_dw_e_postsave;call super::e_dw_e_postsave;double		ldb_up_menu_id
long			ll_cur_row
int				li_rtn
if rpo_dw.dataobject = 'd_menu_item_form' then
	ll_cur_row = rpo_dw.getrow()
	if ll_cur_row > 0 then
		ldb_up_menu_id = rpo_dw.getitemnumber(ll_cur_row, 'up_menu_id')
		return this.f_upd_sort_number( rpo_dw, 'sort_number', 'up_menu_id', ldb_up_menu_id)
	end if
end if
return 0
end event

event e_dw_e_postretrieve;call super::e_dw_e_postretrieve;string			ls_mod_code,ls_submod_code
double			ldb_id


//-- gán module code và submodule code --//
if rpo_dw.dataobject = 'd_menu_item_form' then
	ldb_id = rpo_dw.getitemnumber(rpo_dw.getrow(),'id')
	this.f_set_menuitem_structure( ldb_id)
	if this.f_get_mod_submod_code(ls_mod_code, ls_submod_code) = 1 then
		rpo_dw.setitem(rpo_dw.getrow(), 'module', ls_mod_code )		
		rpo_dw.setitem(rpo_dw.getrow(), 'submodule', ls_submod_code)		
	else
		return -1
	end if
end if
return 1
end event

event e_window_e_refresh;call super::e_window_e_refresh;
treeview		ltv_menu
ltv_menu = iw_display.dynamic f_get_tv()
if isvalid(ltv_menu) then
	return this.f_display_on_tv( ltv_menu)
end if
return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;double				ldb_menu_id

if vs_colname  = 'submod_yn' then
	ldb_menu_id = rpo_dw.getitemnumber(vl_currentrow,'menu_ID')
	//-- không tạo item rieng le trong module có sub-module --//
	if vs_editdata = '' or vs_editdata = 'N' then
		if ic_menu_item.f_is_module_has_sub( ldb_menu_id) then
			gf_messagebox('m.c_menu.e_dw_e_itemchange.01','Lỗi', 'không tạo item riêng lẻ trong module có sub-modul','message','ok',1)
			return -1
		end if
	else
	//-- không tạo sub-module trong sub-module hoac trong item khong phai la module --//
		if isnull(ldb_menu_id) or ldb_menu_id = 0 then
			gf_messagebox('m.c_menu.e_dw_e_itemchange.02','Lỗi', 'không tạo sub-module  ma khong thuoc module','message','ok',1)
//			messagebox('Loi', 'không tạo sub-module  ma khong thuoc module')
			return -1
		end if
		if ic_menu_item.f_is_submodule( ldb_menu_id) then
			gf_messagebox('m.c_menu.e_dw_e_itemchange.03','Lỗi', 'không tạo sub-module trong sub-module hoac trong item khong phai la module','message','ok',1)
//			messagebox('Loi', 'không tạo sub-module trong sub-module hoac trong item khong phai la module')
			return -1
		end if
	end if
end if
		
return 0
end event

event e_dw_updatestart;call super::e_dw_updatestart;
string			ls_submod_yn
double		ldb_menu_id

//-- không cho lưu item trong module đã co sub --//
if rdw_requester.dataobject = 'd_menu_item' or rdw_requester.dataobject = 'd_menu_item_grid' then
	ls_submod_yn = rdw_requester.getitemstring(rdw_requester.getrow(),'submod_yn')
	if isnull(ls_submod_yn) or ls_submod_yn ='N' then
		ldb_menu_id = rdw_requester.getitemnumber(rdw_requester.getrow(),'menu_id')
		if ic_menu_item.f_is_module_has_sub( ldb_menu_id) then
			messagebox('loi',' không cho lưu item trong module đã co sub')
			return -1
		end if
	end if
end if
return 0
end event

event e_dw_e_predelete_start;call super::e_dw_e_predelete_start;string		ls_code
int			li_cnt
if vl_currentrow = 0 then
	if rpo_dw.getrow() > 0 then
		ls_code = rpo_dw.getitemstring(rpo_dw.getrow(), 'code')
		if ls_code <> '' then
			select count(branch_id) into :li_cnt from MENU where code = :ls_code using sqlca;
			if li_cnt > 1 then return 1
		end if
	end if
end if
return 0

end event

