$PBExportHeader$c_w_menu_reg.srw
forward
global type c_w_menu_reg from c_w_tv_md
end type
end forward

global type c_w_menu_reg from c_w_tv_md
integer width = 4142
integer height = 1972
end type
global c_w_menu_reg c_w_menu_reg

type variables
datastore 		ids_menu
boolean 			ib_child_flag

end variables

forward prototypes
public function integer f_upd_sort_number (double vdb_up_menu_id)
end prototypes

public function integer f_upd_sort_number (double vdb_up_menu_id);/****************************************************************************
Chức năng: update lại sort number có cùng up_menu_id theo thứ tự tăng dần 5, 10, 15...
----------------------------------------------------------------------------------------------------------
Tham số: vdb_up_id (up_menu_id)
----------------------------------------------------------------------------------------------------------
Return:
	  1 thành công
	  0 Không update
	- 1 Lỗi
*****************************************************************************/
int				li_idx
double		ldb_id
datastore		lds_menu
string 			ls_sql,ls_err,ls_syntaxSql

if isnull(vdb_up_menu_id) then vdb_up_menu_id = 0
//-- Tạo datastore động lấy toàn bộ ID có cùng up_menu_id và sort tăng dần theo sort_number --//
ls_sql = 'select ID from menu where nvl(up_menu_id,0) =' + string(vdb_up_menu_id) + ' order by sort_number'
ls_syntaxSql = sqlca.syntaxfromsql( ls_sql, '', ls_err)
if ls_err= '' then
	lds_menu = create datastore
	lds_menu.create(ls_syntaxSql,ls_err )
	if ls_err = '' then
		lds_menu.settransobject( it_transaction)
		if lds_menu.retrieve( ) = 0 then return 0
	else
		messagebox('Lỗi','Không tạo được datastore',StopSign!)
		return -1
	end if
else
	messagebox('Lỗi','Không kết nối được',StopSign!)
	return -1
end if

//-- Duyệt từng dòng của datastore để update trường sort_number cùa table menu tăng dần : 5,10,15.... --//
for li_idx=1 to lds_menu.rowcount( )
	ldb_id = lds_menu.getitemnumber( li_idx, 'ID')
	Update  menu
	Set		sort_number = 5 * :li_idx
	Where	ID = :ldb_id using it_transaction;
	 if it_transaction.sqlcode = -1 then
		rollback using it_transaction;
		messagebox('Lỗi','Không update được',StopSign!)
		return -1
	end if
next
return 1


end function

on c_w_menu_reg.create
call super::create
end on

on c_w_menu_reg.destroy
call super::destroy
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

event closequery;call super::closequery;destroy ids_menu
end event

type tab_action from c_w_tv_md`tab_action within c_w_menu_reg
end type

type tabpage_1 from c_w_tv_md`tabpage_1 within tab_action
end type

type dw_1 from c_w_tv_md`dw_1 within c_w_menu_reg
integer x = 1225
integer y = 384
integer width = 2665
string dataobject = "d_c_w_menu_dw1"
end type

event dw_1::e_preretrieve;call super::e_preretrieve;long				ll_cur_hdl
t_s_tv				lt_s_tv
treeviewitem	l_tvi

//-- Gán giá trị cho biến trước khi retrieve ia_retrieve_arg[1] --//
ll_cur_hdl = tv_1.finditem( currenttreeitem!, 0)
if ll_cur_hdl = -1 then
	ll_cur_hdl = tv_1.finditem( roottreeitem!, 0)
end if

tv_1.getitem( ll_cur_hdl, l_tvi)
lt_s_tv = l_tvi.data

this.ia_retrieve_arg[1] = lt_s_tv.db_id

return 1
end event

event dw_1::retrieveend;call super::retrieveend;
double	ldb_cur_id,ldb_menuid, ldb_up_menu_id
long		ll_row
string 		ls_submod_yn
//-- Gán module code và submodule code cho dòng mới --//
if rowcount > 0 then
	ldb_cur_id = this.getitemnumber( this.getrow( ) , 'id')	
	ll_row = ids_menu.find( "tv_id ="+string(ldb_cur_id), 1, ids_menu.rowcount( ) )
	if ll_row >0 then
		//-- Lưu vào biến --//
		ldb_menuid = ids_menu.getitemnumber( ll_row, 'menu_id')
		ldb_up_menu_id= ids_menu.getitemnumber( ll_row, 'tv_up_id')
		ls_submod_yn = ids_menu.getitemstring( ll_row, 'submod_yn')
		if isnull(ldb_up_menu_id) then
			//-- Gán phân hệ --//
			this.setitem( this.getrow( ) , 'module', ids_menu.getitemstring( ll_row, 'code')  )
		else
			if ls_submod_yn = 'Y' then
				//-- Gán phân hệ (trường hợp không có phân hệ con) --//
				ll_row = ids_menu.find( "tv_id ="+string(ldb_menuid), 1, ids_menu.rowcount( ) )
				this.setitem( this.getrow( ) , 'module', ids_menu.getitemstring( ll_row, 'code')  )							
			else
				ll_row = ids_menu.find( "tv_id ="+string(ldb_menuid), 1, ids_menu.rowcount( ) )
				this.setitem( this.getrow( ) , 'submodule', ids_menu.getitemstring( ll_row, 'code')  )
				ldb_up_menu_id= ids_menu.getitemnumber( ll_row, 'tv_up_id')
				ll_row = ids_menu.find( "tv_id ="+string(ldb_up_menu_id), 1, ids_menu.rowcount( ) )
				this.setitem( this.getrow( ) , 'module', ids_menu.getitemstring( ll_row, 'code')  )
			end if
		end if
	end if
end if
end event

event dw_1::updateend;call super::updateend;//-- update sort number và load lại treeview --//
double				ldb_up_menu_id, ldb_id
long					ll_parent_hdl, ll_current_hdl,ll_root_hdl,ll_rtn
t_s_tv					lt_s_tv
treeviewitem		l_tvi

//-- update sort_number --//
if rowsinserted + rowsupdated > 0 then
	//-- Lấy up_menu_id của record hiện tại --//
	ldb_up_menu_id = this.getitemnumber(this.getrow( ) , 'up_menu_id')
	//-- Update sort_number có cùng up_menu_id --//
	ll_rtn = parent.f_upd_sort_number(ldb_up_menu_id)	
end if

//-- Load lại treeview khi delete menu --//
if rowsdeleted > 0 then
	//-- Lấy handle của treeviewitem hiện tại --//
	ll_current_hdl = tv_1.finditem( currenttreeitem!, 0)
	ll_parent_hdl = tv_1.finditem( parenttreeitem!, ll_current_hdl)
	if ll_parent_hdl <> -1 then
		//-- Lấy id của treeviewitem tìm thấy --//
		tv_1.getitem( ll_parent_hdl, l_tvi)
		lt_s_tv = l_tvi.data
		ldb_id = lt_s_tv.db_id
		if isnull(ldb_id) then ldb_id = 0
		//-- update sort number có cùng up menu id --//
		parent.f_upd_sort_number(ldb_id )
		//-- xóa và load lại treeview --//
		tv_1.f_delete_all_items( )
		tv_1.event constructor( )	
		ll_root_hdl = tv_1.finditem( roottreeitem!, 0)
//		ll_current_hdl = tv_1.f_find_item_hdl( ldb_id, ll_root_hdl)
		tv_1.expandall( ll_current_hdl)
		tv_1.selectitem( ll_current_hdl)
	end if
end if
return 1
end event

event dw_1::e_itemchanged;call super::e_itemchanged;c_menu 	lc_menu
long 		ll_row
//-- Kiểm tra mã menu có bị trùng hay không  --//
choose case dwo.name
	case 'code'
			if lc_menu.f_is_code_existed( data) then
				if data = dw_1.object.code.primary.original[row]  then
					return 0
				else
					messagebox('Lỗi','Mã menu ' + data +' đã có',stopsign!)
					return 1
				end if
			end if
	//-- Kiểm tra các ràng buộc khi click chọn phân hệ con --//
	case 'submod_yn'
		if data = 'Y' then
			ll_row = ids_menu.find( "tv_id ="+string(dw_1.object.menu_id.primary.original[row]), 1, ids_menu.rowcount( ) )
			if ll_row > 0 then
				if ids_menu.getitemstring( ll_row, 'submod_yn') = 'Y' then
					messagebox('Lỗi','Đã có phân hệ con',stopsign!)
					return 1
				end if
			end if
		end if
//	case 'sort_number'
//		if isnumber(data) = false then
//			messagebox('Lỗi','Dữ liệu nhập phải là số',stopsign!)
//			return 1
//		end if
end choose
return 0
end event

event dw_1::e_postinsertrow;call super::e_postinsertrow;double 			ldb_menu_id,ldb_tv_up_id, ldb_module_id
long				ll_cur_hdl,ll_row,ll_parent_hdl
string				ls_submod_yn, ls_modcode, ls_submodcode
treeviewitem 	l_tvi
t_s_tv 			lt_s_tv

ll_cur_hdl = tv_1.finditem( currenttreeitem!, 0)
if ll_cur_hdl > 0 then
	tv_1.getitem(ll_cur_hdl , l_tvi)
	lt_s_tv = l_tvi.data
	//-- Gán giá trị cho fields : menu_id và tv_up_id --//
	if lt_s_tv.db_up_id > 0 then
		if ib_child_flag then
			ldb_tv_up_id = lt_s_tv.db_id
			if lt_s_tv.s_submod_yn = 'Y' then
				ldb_menu_id = lt_s_tv.db_id
			else
				ldb_menu_id = lt_s_tv.db_menu_id
			end if
		else
			//-- Lấy giá trị cho cột menu_id và up_menu_id --//
			ldb_menu_id = lt_s_tv.db_menu_id
			ldb_tv_up_id = lt_s_tv.db_up_id
		end if
		if lt_s_tv.s_submod_yn = 'Y' then
			//-- Lấy giá trị cho cột menu_id và up_menu_id --//
			ll_row = ids_menu.find( "tv_id ="+string(lt_s_tv.db_id ), 1, ids_menu.rowcount( ) )
			ls_submodcode = ids_menu.getitemstring( ll_row, 'code')
			ldb_module_id =  ids_menu.getitemnumber( ll_row, 'tv_up_id')
		else
			//-- Lấy giá trị cho cột menu_id và up_menu_id --//
			ll_row = ids_menu.find( "tv_id ="+string(lt_s_tv.db_menu_id), 1, ids_menu.rowcount( ) )
			ls_submodcode = ids_menu.getitemstring( ll_row, 'code')
			ldb_module_id =  ids_menu.getitemnumber( ll_row, 'tv_up_id')
		end if
		//-- lấy giá trị code cột module --//
		ll_row = ids_menu.find( "tv_id ="+string(ldb_module_id), 1, ids_menu.rowcount( ) )
		ls_modcode = ids_menu.getitemstring( ll_row, 'code')	
	else
		if ib_child_flag then
			//-- Lấy giá trị cho cột menu_id và up_menu_id --//
			ldb_menu_id = lt_s_tv.db_id 
			ldb_tv_up_id = lt_s_tv.db_id
			//-- lấy giá trị cột module và subcode --//
			ll_row = ids_menu.find( "tv_id ="+string(lt_s_tv.db_id ), 1, ids_menu.rowcount( ) )
			ls_modcode = ids_menu.getitemstring( ll_row, 'code')	
			setnull(ls_submodcode)
		else
			setnull(ldb_menu_id)
			setnull(ldb_tv_up_id)
			setnull(ls_submodcode)
			setnull(ls_modcode)			
		end if
	end if
	//-- setitem cho các filed --//
	this.setitem( al_row, 'menu_id', ldb_menu_id )
	this.setitem( al_row, 'up_menu_id', ldb_tv_up_id )
	this.setitem( al_row , 'module', ls_modcode )
	this.setitem( al_row, 'submodule', ls_submodcode)
end if
return 1
end event

event dw_1::updatestart;call super::updatestart;double 		ldb_menu_id
long 			ll_row
string 			ls_submod_yn

//-- Kiểm tra không tạo được menuitem trong module có submod --//
ldb_menu_id = dw_1.getitemnumber( this.getrow( ) , 'menu_id')
ls_submod_yn = dw_1.getitemstring( this.getrow( ) , 'submod_yn')
	if ls_submod_yn = 'N' or isnull(ls_submod_yn) then
		ll_row = ids_menu.find( "menu_id ="+string(ldb_menu_id) +" and submod_yn ='Y' " , 1, ids_menu.rowcount( ) )
		if ll_row > 0  then
			messagebox('Lỗi','Phân hệ con đã có hoặc đối tượng chưa có phân hệ con',stopsign!)
			return 1
		end if
	end if
return 0
end event

type dw_2 from c_w_tv_md`dw_2 within c_w_menu_reg
integer x = 1239
integer y = 904
integer width = 2715
integer height = 800
string dataobject = "d_c_w_menu_dw2"
end type

event dw_2::updateend;call super::updateend;double				ldb_id
long					ll_cur_hdl,ll_rtn_hdl,ll_root_hdl

//-- update sort_number và load lại treeview --//
if rowsinserted + rowsupdated > 0 then
	tv_1.f_delete_all_items( )
//	if dw_1.ib_editing = false then
//		//-- Load lại treeview items --//
//		tv_1.event constructor( )
//		//-- Tìm và chọn lại item hiện hành trên treeview --//
//		ldb_id = dw_1.getitemnumber(dw_1.getrow( ) , 'ID')
//		ll_root_hdl = tv_1.finditem( roottreeitem!, 0)
////		ll_cur_hdl = tv_1.f_find_item_hdl( ldb_id, ll_root_hdl)
//		tv_1.expanditem(ll_cur_hdl)
//		tv_1.selectitem( ll_cur_hdl)
//	end if
end if
return 1
end event

event dw_2::e_postinsertrow;call super::e_postinsertrow;this.setitem( al_row, 'subcode', 'MENU' )
this.setitem( al_row,'lang' ,gs_user_lang )
return 1
end event

type tv_1 from c_w_tv_md`tv_1 within c_w_menu_reg
integer x = 27
integer y = 400
integer width = 928
integer height = 1320
end type

event tv_1::constructor;call super::constructor;
//-- Gán giá trị cho instance --//
is_popupMenu = 'm_add_submenu'

//-- Load treeview item --//
ids_menu= create datastore
ids_menu.dataobject = 'ds_menu_all'
if isvalid(parent.it_transaction) then
	ids_menu.settransobject( parent.it_transaction )
else
	ids_menu.settransobject( sqlca )
end if
ids_menu.retrieve( gs_user_lang)
this.setredraw( false)
if this.f_load_menu_items( ids_menu) = -1 then
	messagebox('Lỗi','Không Load được Treeview',StopSign!)
end if
this.setredraw( true)
end event

event tv_1::selectionchanged;call super::selectionchanged;dw_1.event e_retrieve( )
end event

event tv_1::rightclicked;call super::rightclicked;//-- Insert menu con nếu click chọn im_popup = m_add_submenu --//
//if im_popup.is_clicked_menu= 'm_add_submenu' then
//	ib_child_flag = true
//	dw_1.setfocus( )
//	dw_1.event e_addrow( )
//end if
//-- Destroy biến im_popup --//
//destroy im_popup

end event

type gb_1 from c_w_tv_md`gb_1 within c_w_menu_reg
integer x = 1015
integer y = 388
end type

type gb_2 from c_w_tv_md`gb_2 within c_w_menu_reg
integer x = 1230
integer y = 808
integer width = 914
integer height = 56
end type

