$PBExportHeader$c_trans_setup.sru
forward
global type c_trans_setup from c_policy_setup
end type
end forward

global type c_trans_setup from c_policy_setup
end type
global c_trans_setup c_trans_setup

forward prototypes
public subroutine f_set_dwo_window ()
public function integer f_get_setup_objectname (ref string rs_objectname)
public function string f_get_trans_setup_visible (string ls_doc_type, double vdb_trans_hdr_id)
public function string f_get_trans_setup_sob (string ls_doc_type, double vdb_trans_hdr_id)
public function string f_get_trans_setup_sob_popup (string ls_doc_type, double vdb_trans_hdr_id)
public function string f_get_post_message_yn (string ls_doc_type, double vdb_trans_hdr_id)
public function string f_get_unpost_message_yn (string ls_doc_type, double vdb_trans_hdr_id)
public function integer f_get_qty_and_value_yn (double vdb_trans_hdr_id, ref string rs_qty, ref string rs_value)
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_trans_setup_hdr_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_trans_setup_hdr_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_trans_setup_grid;'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Danh mục giao dịch trên chứng từ'

istr_dwo[2].s_dwo_default =  'd_trans_setup_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_trans_setup_grid'
istr_dwo[2].b_detail = true
istr_dwo[2].b_master = true
istr_dwo[2].s_dwo_master = 'd_trans_setup_hdr_grid;'
istr_dwo[2].s_dwo_details = ''
istr_dwo[2].s_dwo_shared = 'd_trans_setup_form;'
istr_dwo[2].s_master_keycol = 'ID;'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
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
istr_dwo[2].b_focus_master = false
istr_dwo[2].s_description = 'Danh mục ghi sổ'
istr_dwo[2].s_pic_ref_table = ''
istr_dwo[2].s_pic_ref_field = ''

istr_dwo[3].s_dwo_default =  'd_trans_setup_form'
istr_dwo[3].s_dwo_form = 'd_trans_setup_form'
istr_dwo[3].s_dwo_grid = ''
istr_dwo[3].b_shared = true
istr_dwo[3].b_master = false
istr_dwo[3].s_dwo_master = 'd_trans_setup_grid;'
istr_dwo[3].s_dwo_details = ''
istr_dwo[3].s_master_keycol = ''
istr_dwo[3].s_detail_keycol = ''
istr_dwo[3].b_ref_table_yn  = false
istr_dwo[3].s_ref_table_field = ''
istr_dwo[3].b_insert = true
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = true
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_excel = true
istr_dwo[3].b_traceable = true
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].b_focus_master = false
istr_dwo[3].s_description = 'Chi tiết'
istr_dwo[3].s_pic_ref_table = ''
istr_dwo[3].s_pic_ref_field = ''
end subroutine

public function integer f_get_setup_objectname (ref string rs_objectname);c_menu							lc_menu
c_identification_initial			lc_identification_initial
treeview							ltv_idkey
treeviewitem					l_tvi
c_string							lc_string
string								ls_identification_code, lsa_code[]
long								ll_cur_hdl

lc_menu = create c_menu
ltv_idkey = iw_display.dynamic f_get_tv()
ll_cur_hdl = ltv_idkey.finditem(currenttreeitem!, 0)
if ll_cur_hdl = -1 then
	ll_cur_hdl = ltv_idkey.finditem( roottreeitem!, 0)
end if	
if ll_cur_hdl = -1 then 
	gf_messagebox('m.c_policy_alert.f_get_setup_objectname.01','Thông báo','Không tìm thấy mã phân quyền: identification_ID','exclamation','ok',1)
	destroy lc_menu
	return -1
end if
ltv_idkey.getitem( ll_cur_hdl, l_tvi)	
ipo_tv = l_tvi.data	

ls_identification_code = lc_menu.f_get_code(ipo_tv.istr_tv.db_id )
lc_string.f_stringtoarray(ls_identification_code , '.', lsa_code[])
if pos(lsa_code[1], 'u_')> 0 then	
	rs_objectname = lsa_code[1]
	destroy lc_menu
	return 1
elseif pos(lsa_code[upperbound(lsa_code[])], 'u_')> 0 then
	rs_objectname = lsa_code[upperbound(lsa_code[])]
	destroy lc_menu
	return 1
else
	gf_messagebox('m.c_policy_alert.f_get_setup_objectname.01','Thông báo','Không tìm thấy đối tượng cài đặt cua datawindow:@'+ls_identification_code,'exclamation','ok',1)
	destroy lc_menu
	return 0
end if
destroy lc_menu

end function

public function string f_get_trans_setup_visible (string ls_doc_type, double vdb_trans_hdr_id);/************************************************************************
Chức năng: Kiểm tra cài đặt có mở form xem định khoản không
------------------------------------------------------------------------------
Tham số:
--------------------
Return (string): Y - Có mở from
				     N - Không mở form
=================================================================*/
t_ds_db       		lds_tmp
string 				ls_yn
long					ll_found_row

lds_tmp = create t_ds_db
lds_tmp.dataobject = 'd_trans_setup_hdr_grid'
lds_tmp.f_settransobject( SQLCA)
lds_tmp.retrieve(ls_doc_type)
ll_found_row = lds_tmp.find("id = "+string(vdb_trans_hdr_id),1,lds_tmp.rowcount())
ls_yn = lds_tmp.getitemstring(ll_found_row,'visible_yn')
if isnull(ls_yn) then ls_yn = 'N'
destroy lds_tmp
return ls_yn
end function

public function string f_get_trans_setup_sob (string ls_doc_type, double vdb_trans_hdr_id);t_ds_db       		lds_tmp
string 				ls_yn
long					ll_found_row

lds_tmp = create t_ds_db
lds_tmp.dataobject = 'd_trans_setup_hdr_grid'
lds_tmp.f_settransobject( SQLCA)
lds_tmp.retrieve(ls_doc_type)
ll_found_row = lds_tmp.find("id = "+string(vdb_trans_hdr_id),1,lds_tmp.rowcount())
ls_yn = lds_tmp.getitemstring(ll_found_row,'sob_yn')
if isnull(ls_yn) then ls_yn = 'N'
destroy lds_tmp
return ls_yn
end function

public function string f_get_trans_setup_sob_popup (string ls_doc_type, double vdb_trans_hdr_id);t_ds_db       		lds_tmp
string 				ls_yn
long					ll_found_row

lds_tmp = create t_ds_db
lds_tmp.dataobject = 'd_trans_setup_hdr_grid'
lds_tmp.f_settransobject( SQLCA)
lds_tmp.retrieve(ls_doc_type)
ll_found_row = lds_tmp.find("id = "+string(vdb_trans_hdr_id),1,lds_tmp.rowcount())
ls_yn = lds_tmp.getitemstring(ll_found_row,'sob_popup')
if isnull(ls_yn) then ls_yn = 'N'
destroy lds_tmp
return ls_yn
end function

public function string f_get_post_message_yn (string ls_doc_type, double vdb_trans_hdr_id);/************************************************************************
Chức năng: Kiểm tra cài đặt có bật thông báo ghi sổ thành công hay không
------------------------------------------------------------------------------
Tham số:
--------------------
Return (string): Y - Có
				     N - Không
=================================================================*/
t_ds_db       		lds_tmp
string 				ls_yn
long					ll_found_row

lds_tmp = create t_ds_db
lds_tmp.dataobject = 'd_trans_setup_hdr_grid'
lds_tmp.f_settransobject( SQLCA)
lds_tmp.retrieve(ls_doc_type)
ll_found_row = lds_tmp.find("id = "+string(vdb_trans_hdr_id),1,lds_tmp.rowcount())
ls_yn = lds_tmp.getitemstring(ll_found_row,'post_message_yn')
if isnull(ls_yn) then ls_yn = 'N'
destroy lds_tmp
return ls_yn
end function

public function string f_get_unpost_message_yn (string ls_doc_type, double vdb_trans_hdr_id);/************************************************************************
Chức năng: Kiểm tra cài đặt có bật thông báo sửa ghi sổ thành công hay không
------------------------------------------------------------------------------
Tham số:
--------------------
Return (string): Y - Có
				     N - Không
=================================================================*/
t_ds_db       		lds_tmp
string 				ls_yn
long					ll_found_row

lds_tmp = create t_ds_db
lds_tmp.dataobject = 'd_trans_setup_hdr_grid'
lds_tmp.f_settransobject( SQLCA)
lds_tmp.retrieve(ls_doc_type)
ll_found_row = lds_tmp.find("id = "+string(vdb_trans_hdr_id),1,lds_tmp.rowcount())
ls_yn = lds_tmp.getitemstring(ll_found_row,'unpost_message_yn')
if isnull(ls_yn) then ls_yn = 'N'
destroy lds_tmp
return ls_yn
end function

public function integer f_get_qty_and_value_yn (double vdb_trans_hdr_id, ref string rs_qty, ref string rs_value);/************************************************************************
Chức năng: Trả về ghi sổ số lượng và ghi sổ giá trị

=================================================================*/

select nvl(quantity_yn,'N') , nvl(value_yn,'N') into :rs_qty, :rs_value 
from TRANS_SETUP_HDR
where id = :vdb_trans_hdr_id and COMPANY_ID = :gi_user_comp_id using sqlca; 

if sqlca.sqlcode = 0 then
	return 1
else
	return -1
end if
end function

on c_trans_setup.create
call super::create
end on

on c_trans_setup.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'trans_setup'
ib_changed_dwo_4edit = false
this.ib_keyboardlocked = true
is_display_model = '1tv_up1d_1d_lo1d'
is_object_title = 'Cài đặt giao dịch'

istr_actionpane[1].s_description = is_object_title

istr_tvo[1].ds_tv_item = create datastore
istr_tvo[1].ds_tv_item.dataobject = 'ds_document_start_tv'
end event

event e_window_e_preopen;call super::e_window_e_preopen;
//--resize parm --//
iw_display.f_set_ii_leftpart_width(1/4)
iw_display.f_set_ii_midpart_width(1/3)
iw_display.f_set_ii_upperpart_height(1/4)
return 0
end event

event e_window_e_refresh;call super::e_window_e_refresh;
long					ll_cur_hdl
any					laa_retrieve_arg[]
treeview				l_tv
treeviewitem		l_tvi

//-- load menu vao treeview --//
l_tv = iw_display.dynamic f_get_tv()
ll_cur_hdl = l_tv.finditem(currenttreeitem!, 0)
if ll_cur_hdl = -1 then
	ll_cur_hdl = l_tv.finditem( roottreeitem!, 0)
end if	
if ll_cur_hdl = -1 then 
	gf_messagebox('m.c_policy.e_dw_e_refresh.01','Thông báo','Không tìm thấy mã phân quyền: c_policy.e_dw_e_refresh.01:line11','exclamation','ok',1)
	return -1
end if
l_tv.getitem( ll_cur_hdl, l_tvi)	
ipo_tv = l_tvi.data	

if pos(ipo_tv.istr_tv.s_object,'u_')> 0 then
	
	if this.f_create_identification_key( ipo_tv.istr_tv) = -1 then return -1		
	iw_display.dynamic event e_save()
	laa_retrieve_arg[1] = gs_user_lang
	laa_retrieve_arg[2] = ipo_tv.istr_tv.db_id
	if this.f_display_on_tv( l_tv,laa_retrieve_arg[]) = -1 then return -1
end if
return 1
end event

event e_tv_selectionchanged;call super::e_tv_selectionchanged;t_dw_mpl			ldw_main
treeviewitem		l_tvi
c_string				lc_string
int						li_dwoCnt
long					ll_cur_hdl
any					laa_retrieve_arg[]

//-- set identification key --//

ll_cur_hdl = rpo_tv.finditem(currenttreeitem!, 0)
if ll_cur_hdl = -1 then
	ll_cur_hdl = rpo_tv.finditem( roottreeitem!, 0)
end if	
if ll_cur_hdl = -1 then 
	gf_messagebox('m.c_trans_setup.e_tv_selectionchanged.01','Thông báo','Không tìm thấy mã đối tượng: identification_ID','exclamation','ok',1)
	return -1
end if
rpo_tv.getitem( ll_cur_hdl, l_tvi)	
ipo_tv = l_tvi.data

laa_retrieve_arg[1] = ipo_tv.istr_tv.s_object
ldw_main = iw_display.dynamic f_get_dwmain()
ldw_main.dynamic f_set_retrieve_args(laa_retrieve_arg[])
if not iw_display.ib_opening then 
	connect using it_transaction;
end if
ldw_main.dynamic event e_retrieve()
if not iw_display.ib_opening then 
	disconnect using it_transaction;
end if
RETURN 1
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;treeview				ltv_handling
treeviewitem		l_tvi
t_dw_mpl			ldw_busines_rule
long					ll_cur_hdl, ll_insertrow

if pos(rpo_dw.dataobject,'d_trans_setup_hdr') > 0 then
	ltv_handling = iw_display.dynamic f_get_tv()
	ll_cur_hdl = ltv_handling.finditem(currenttreeitem!, 0)
	if ll_cur_hdl = -1 then
		ll_cur_hdl = ltv_handling.finditem( roottreeitem!, 0)
	end if	
	if ll_cur_hdl = -1 then 
		gf_messagebox('m.c_policy_alert.e_dw_e_postinsertrow.01','Thông báo','Không tìm thấy đối tượng: s_object','exclamation','ok',1)
		return -1
	end if
	ltv_handling.getitem( ll_cur_hdl, l_tvi)	
	ipo_tv = l_tvi.data	
	rpo_dw.setitem(vl_currentrow, 'doc_type', upper(ipo_tv.istr_tv.s_object) )
end if
if pos(rpo_dw.dataobject,'d_trans_setup_form') > 0 or pos(rpo_dw.dataobject,'d_trans_setup_grid') > 0 then
	ltv_handling = iw_display.dynamic f_get_tv()
	ll_cur_hdl = ltv_handling.finditem(currenttreeitem!, 0)
	if ll_cur_hdl = -1 then
		ll_cur_hdl = ltv_handling.finditem( roottreeitem!, 0)
	end if	
	if ll_cur_hdl = -1 then 
		gf_messagebox('m.c_policy_alert.e_dw_e_postinsertrow.02','Thông báo','Không tìm thấy đối tượng: s_object','exclamation','ok',1)
		return -1
	end if
	ltv_handling.getitem( ll_cur_hdl, l_tvi)	
	ipo_tv = l_tvi.data
	rpo_dw.setitem(vl_currentrow, 'doc_type', upper(ipo_tv.istr_tv.s_object) )
	rpo_dw.setitem(vl_currentrow, 'object_name',upper('u_'+ ipo_tv.istr_tv.s_object))
end if
return 1

end event

event e_window_open;call super::e_window_open;treeview			ltv_display
any				la_args[]
long				ll_root_hdl

//-- load key vao treeview --//
ltv_display = iw_display.dynamic f_get_tv()
if isvalid(ltv_display) then
	la_args[1] =  gs_user_lang
	la_args[2] = 0
	if this.f_display_on_tv( ltv_display,la_args[]) = -1 then return -1
	ll_root_hdl = ltv_display.FindItem(RootTreeItem! , 0)
	ltv_display.selectitem(ll_root_hdl)
	ltv_display.expanditem(ll_root_hdl)
end if
return 0
end event

