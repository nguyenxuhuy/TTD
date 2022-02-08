$PBExportHeader$c_menu_mdi.sru
forward
global type c_menu_mdi from s_object
end type
end forward

global type c_menu_mdi from s_object
end type
global c_menu_mdi c_menu_mdi

type variables
double					idb_menu_id
datastore					ids_menu_all
protected:


c_menu_item			ic_menu_item


end variables

forward prototypes
public function integer f_set_menuitem_structure (long vl_row)
public function integer f_set_menuitem_structure (double vdb_id)
public function integer f_insert_tv_item (double vdb_id, ref treeview r_tv)
public function integer f_set_menuitem_structure (double vdb_up_id, string vs_label)
public function integer f_get_mod_submod_code (ref string rs_mod_code, ref string rs_submod_code)
public function double f_get_module_id ()
public function integer f_display_on_tv (t_tv r_tv)
public function integer f_populate_tv_item (t_tv r_tv)
public function integer f_insert_tv_item (c_menu_item vpo_tv, ref treeview r_tv)
public function integer f_display_on_tv_ex (t_tv r_tv)
public function integer f_display_on_tv_ex (ref t_tv r_tv, t_transaction rt_transaction)
end prototypes

public function integer f_set_menuitem_structure (long vl_row);int li_rtn

if not isvalid(ids_menu_all) then return -1
if vl_row < 1 or vl_row > ids_menu_all.rowcount( ) then return -1

ic_menu_item.istr_tv.db_id = ids_menu_all.getitemnumber(vl_row, 'menu_id')
ic_menu_item.istr_tv.s_menu_code = ids_menu_all.getitemstring(vl_row, 'menu_code')
ic_menu_item.istr_tv.db_menu_id = ids_menu_all.getitemnumber(vl_row, 'menu_menu_id')
ic_menu_item.istr_tv.db_up_id = ids_menu_all.getitemnumber(vl_row, 'menu_up_menu_id')
ic_menu_item.istr_tv.i_sort = ids_menu_all.getitemnumber(vl_row, 'menu_sort_number')
ic_menu_item.istr_tv.s_object = ids_menu_all.getitemstring(vl_row, 'menu_obj_name')
ic_menu_item.istr_tv.s_label = ids_menu_all.getitemstring(vl_row, 'label_text')
ic_menu_item.istr_tv.i_type =  ids_menu_all.getitemnumber(vl_row, 'menu_type')
ic_menu_item.istr_tv.i_pic_idx =  ids_menu_all.getitemnumber(vl_row, 'menu_type')
ic_menu_item.istr_tv.i_sel_pic_idx =  ids_menu_all.getitemnumber(vl_row, 'menu_type') + 1

return 1
end function

public function integer f_set_menuitem_structure (double vdb_id);long	ll_row

ll_row = ids_menu_all.find( "ID =" + string(vdb_id), 1, ids_menu_all.rowcount( ) )
if ll_row > 0 then
	return this.f_set_menuitem_structure( ll_row)
end if
return ll_row

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

public function integer f_get_mod_submod_code (ref string rs_mod_code, ref string rs_submod_code);return 0
end function

public function double f_get_module_id ();long		ll_row_cnt
double	lb_module_id

if this.idb_menu_id = 0 then 
	lb_module_id = g_user.default_mod 
else
	lb_module_id = this.idb_menu_id 
end if

ids_menu_all.dataobject = 'd_submodule'
ids_menu_all.settransobject( sqlca)
ll_row_cnt = ids_menu_all.retrieve(gi_user_comp_id, gdb_branch, gi_userid,  lb_module_id ,gs_user_lang)

if ll_row_cnt > 0 then
	lb_module_id = ids_menu_all.getitemnumber( 1, 'menu_id')
end if

return lb_module_id

end function

public function integer f_display_on_tv (t_tv r_tv);
long 		ll_row, ll_root_hdl, ll_row_cnt
int			li_rtn
double	ldb_module_id
string		ls_role_user
c_string	lc_string

//-- Xóa treeview để load lại --//
r_tv.f_delete_all_items( )

ldb_module_id = this.f_get_module_id( )

ls_role_user = g_user.f_get_current_role_user_string( )
ls_role_user = lc_string.f_globalreplace( ls_role_user, ';', ';)|(;')
ls_role_user = "(;"+ls_role_user+";)"
if gi_userid > 0 then
	ids_menu_all.dataobject = 'd_menu'	
	ids_menu_all.settransobject( sqlca)		
	ll_row_cnt = ids_menu_all.retrieve(gi_user_comp_id, gi_userid, ls_role_user, ldb_module_id ,gs_user_lang, gdb_branch)
else
	ids_menu_all.dataobject = 'd_menu_admin'	
	ids_menu_all.settransobject( sqlca)		
	ll_row_cnt = ids_menu_all.retrieve(ldb_module_id ,gs_user_lang, gi_user_comp_id, gdb_branch )	
end if


if ll_row_cnt > 0 then
	this.f_populate_tv_item( r_tv)

end if
return ll_row_cnt
end function

public function integer f_populate_tv_item (t_tv r_tv);
long 		ll_row, ll_root_hdl, ll_row_cnt
int			li_rtn

ll_row_cnt = ids_menu_all.rowcount() 
if ll_row_cnt > 0 then
	FOR ll_row = 1 to ll_row_cnt
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
	r_tv.setredraw(true)
end if
return ll_row_cnt
end function

public function integer f_insert_tv_item (c_menu_item vpo_tv, ref treeview r_tv);int				li_rtn
double		ldb_id

li_rtn =  r_tv.dynamic f_populate_item(vpo_tv)
if li_rtn = -1 then
	ldb_id = double(vpo_tv.f_get_tv_parentstring())
	if ldb_id > 0 then
		li_rtn = this.f_insert_tv_item( ldb_id, r_tv)
	end if
end if
return li_rtn
end function

public function integer f_display_on_tv_ex (t_tv r_tv);
long 		ll_row, ll_root_hdl, ll_row_cnt
int			li_rtn
double	ldb_module_id
string		ls_role_user
c_string	lc_string
t_transaction		lt_transaction

//-- Tạo connection voi database --//
lt_transaction = create t_transaction
lt_transaction.dbms =	SQLCA.DBMS
lt_transaction.ServerName	 = SQLCA.ServerName
lt_transaction.LogId	 = SQLCA.LogId
lt_transaction.LogPass 	 = SQLCA.LogPass 
lt_transaction.AutoCommit 	 = false 
lt_transaction.DBParm	 = SQLCA.DBParm
connect using	lt_transaction;	

//-- Xóa treeview để load lại --//
r_tv.f_delete_all_items( )

ldb_module_id = this.f_get_module_id( )

ls_role_user = g_user.f_get_current_role_user_string( )
ls_role_user = lc_string.f_globalreplace( ls_role_user, ';', ';)|(;')
ls_role_user = "(;"+ls_role_user+";)"
if gi_userid > 0 then
	ids_menu_all.dataobject = 'd_menu'	
	ids_menu_all.settransobject( lt_transaction)		
	ll_row_cnt = ids_menu_all.retrieve(gi_user_comp_id, gi_userid, ls_role_user, ldb_module_id ,gs_user_lang, gdb_branch)
else
	ids_menu_all.dataobject = 'd_menu_admin'	
	ids_menu_all.settransobject( lt_transaction)		
	ll_row_cnt = ids_menu_all.retrieve(ldb_module_id ,gs_user_lang, gi_user_comp_id, gdb_branch )	
end if


if ll_row_cnt > 0 then
	this.f_populate_tv_item( r_tv)

end if
disconnect  using	lt_transaction;	
destroy lt_transaction

return ll_row_cnt
end function

public function integer f_display_on_tv_ex (ref t_tv r_tv, t_transaction rt_transaction);
long 		ll_row, ll_root_hdl, ll_row_cnt
int			li_rtn
double	ldb_module_id
string		ls_role_user
c_string	lc_string
t_transaction		lt_transaction


//-- Xóa treeview để load lại --//
r_tv.f_delete_all_items( )

ldb_module_id = this.f_get_module_id( )

ls_role_user = g_user.f_get_current_role_user_string( )
ls_role_user = lc_string.f_globalreplace( ls_role_user, ';', ';)|(;')
ls_role_user = "(;"+ls_role_user+";)"
if gi_userid > 0 then
	ids_menu_all.dataobject = 'd_menu'	
	ids_menu_all.settransobject( rt_transaction)		
	ll_row_cnt = ids_menu_all.retrieve(gi_user_comp_id, gi_userid, ls_role_user, ldb_module_id ,gs_user_lang, gdb_branch)
else
	ids_menu_all.dataobject = 'd_menu_admin'	
	ids_menu_all.settransobject( rt_transaction)		
	ll_row_cnt = ids_menu_all.retrieve(ldb_module_id ,gs_user_lang, gi_user_comp_id, gdb_branch )	
end if


if ll_row_cnt > 0 then
	this.f_populate_tv_item( r_tv)

end if


return ll_row_cnt
end function

on c_menu_mdi.create
call super::create
end on

on c_menu_mdi.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'MENU'
ids_menu_all = create datastore

end event

event destructor;call super::destructor;destroy		ids_menu_all
end event

