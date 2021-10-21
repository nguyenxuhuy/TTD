$PBExportHeader$c_policy_rule.sru
forward
global type c_policy_rule from c_policy_setup
end type
end forward

global type c_policy_rule from c_policy_setup
end type
global c_policy_rule c_policy_rule

type variables

end variables

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_policy_rule_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_policy_rule_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_policy_rule_constraint_grid;'
istr_dwo[1].s_dwo_shared = 'd_policy_rule_form;'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Khai báo chính sách công ty'

istr_dwo[2].s_dwo_default =  'd_policy_rule_form'
istr_dwo[2].s_dwo_form = 'd_policy_rule_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_detail = false
istr_dwo[2].b_shared = true
istr_dwo[2].s_dwo_master = 'd_policy_rule_grid;'
istr_dwo[2].s_master_keycol = ''
istr_dwo[2].s_detail_keycol = ''
istr_dwo[2].b_ref_table_yn  = false
istr_dwo[2].s_ref_table_field = ''
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_focus_master = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_description = 'Khai báo chính sách công ty'
istr_dwo[2].s_pic_ref_table = ''
istr_dwo[2].s_pic_ref_field = ''

istr_dwo[3].s_dwo_default =  'd_policy_rule_constraint_grid'
istr_dwo[3].s_dwo_form = 'd_policy_rule_constraint_form'
istr_dwo[3].s_dwo_grid = 'd_policy_rule_constraint_grid'
istr_dwo[3].b_detail = true
istr_dwo[3].s_dwo_master = 'd_policy_rule_grid;'
istr_dwo[3].s_master_keycol = 'ID;'
istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[3].b_ref_table_yn  = true
istr_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[3].b_insert = true
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = true
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_excel = true
istr_dwo[3].b_traceable = true
istr_dwo[3].b_focus_master = false
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].s_description = 'Điều kiện thực hiện chính sách'
istr_dwo[3].s_pic_ref_table = ''
istr_dwo[3].s_pic_ref_field = ''
end subroutine

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'

end subroutine

on c_policy_rule.create
call super::create
end on

on c_policy_rule.destroy
call super::destroy
end on

event constructor;call super::constructor;
this.ib_keyboardlocked = true
is_display_model = '1tv_up1d_1d_lo1d'
is_object_title = 'Thiết lập chính sách'

istr_actionpane[1].s_description = is_object_title




end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;treeview			ltv_handling
treeviewitem		l_tvi
long				ll_cur_hdl

if rpo_dw.dataobject = 'd_policy_rule_grid' then
	rpo_dw.setitem(vl_currentrow,'object_ref_id',idb_object_ref_id)
	rpo_dw.setitem(vl_currentrow,'object_ref_table','BUSINESS_RULE')
	rpo_dw.setitem(vl_currentrow,'type','rule')
	//-- set identification key --//
	ltv_handling = iw_display.dynamic f_get_tv()
	ll_cur_hdl = ltv_handling.finditem(currenttreeitem!, 0)
	if ll_cur_hdl = -1 then
		ll_cur_hdl = ltv_handling.finditem( roottreeitem!, 0)
	end if	
	if ll_cur_hdl = -1 then 
		gf_messagebox('m.c_policy.e_dw_e_postinsertrow.01','Thông báo','Không tìm thấy mã phân quyền: identification_ID','exclamation','ok',1)
		return -1
	end if
	ltv_handling.getitem( ll_cur_hdl, l_tvi)	
	ipo_tv = l_tvi.data	
	rpo_dw.setitem(vl_currentrow, 'identification_id', ipo_tv.istr_tv.db_id )
end if
RETURN 1
end event

event e_tv_selectionchanged;call super::e_tv_selectionchanged;datawindow		ldw_main
treeviewitem		l_tvi
c_string			lc_string
int					li_dwoCnt
long				ll_cur_hdl
any				laa_retrieve_arg[]

//-- set identification key --//

ll_cur_hdl = rpo_tv.finditem(currenttreeitem!, 0)
if ll_cur_hdl = -1 then
	ll_cur_hdl = rpo_tv.finditem( roottreeitem!, 0)
end if	
if ll_cur_hdl = -1 then 
	gf_messagebox('m.c_policy.e_dw_e_postinsertrow.01','Thông báo','Không tìm thấy mã phân quyền: identification_ID','exclamation','ok',1)
	return -1
end if
rpo_tv.getitem( ll_cur_hdl, l_tvi)	
ipo_tv = l_tvi.data	

laa_retrieve_arg[1] = ipo_tv.istr_tv.db_id
ldw_main = iw_display.dynamic f_get_dwmain()
ldw_main.dynamic f_set_retrieve_args(laa_retrieve_arg[])
if not iw_display.ib_opening then
	connect using it_transaction;
	ldw_main.settransobject( it_transaction)
end if
ldw_main.dynamic event e_retrieve()

//-- load menu vao treeview --//
if pos(ipo_tv.istr_tv.s_object,'.u_')> 0  or  lc_string.f_countoccurrences( ipo_tv.istr_tv.s_object,'.') > 1 or left(ipo_tv.istr_tv.s_object,2) = 'u_' then
//	if rpo_tv.finditem(childtreeitem!, ll_cur_hdl) = -1 then
		if this.f_create_identification_key( ipo_tv.istr_tv) >0 then 
			iw_display.dynamic event e_save()
		end if
		laa_retrieve_arg[1] = gs_user_lang
		laa_retrieve_arg[2] = ipo_tv.istr_tv.db_id
		if this.f_display_on_tv( rpo_tv,laa_retrieve_arg[]) = -1 then return -1
//	end if
	rpo_tv.selectitem(ll_cur_hdl)
	rpo_tv.expanditem(ll_cur_hdl)	
end if
if not iw_display.ib_opening then
	disconnect using it_transaction;
end if

RETURN 1


end event

event e_window_e_refresh;call super::e_window_e_refresh;
long				ll_cur_hdl
any				laa_retrieve_arg[]
treeview			l_tv
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

event e_window_open;call super::e_window_open;//c_menu			lc_menu
c_menu_item 	lc_menu_item
b_rule				lb_rule
datawindow		ldw_main
datastore			lds_identification_load
treeview			ltv_display
string				ls_business_rule_code
double			ldb_rule_id
any				la_value[], la_args[]
long				ll_root_hdl

//-- build where theo business rule code --//
//lc_menu = create c_menu
//ls_business_rule_code = lc_menu.f_get_code( double(this.is_menu_id) )
//destroy lc_menu

ls_business_rule_code =lc_menu_item.f_get_menu_code_ex( double(this.is_menu_id), it_transaction )

if isnull(ls_business_rule_code) or ls_business_rule_code = '' then 
	gf_messagebox('m.c_policy_rule.01','Thông báo','Không tìm thấy mã business rule, menu ID:@'+this.is_menu_id,'Exclamation','ok',1)
	return -1
end if
ldb_rule_id = lb_rule.f_get_rule_id_ex(ls_business_rule_code,gi_user_comp_id, gdb_branch, it_transaction)

if ldb_rule_id < 1 then
	//-- insert menu code vào business rule --//
	ldb_rule_id = lb_rule.f_insert_policy_rule_code_ex( ls_business_rule_code, it_transaction) 
	if ldb_rule_id = -1 then return -1
	idb_object_ref_id = ldb_rule_id
else
	idb_object_ref_id = ldb_rule_id
end if
la_value[1] = ldb_rule_id
ldw_main = iw_display.dynamic f_get_dwmain()
ldw_main.dynamic f_add_where('object_ref_id',la_value[])

//-- load identification key --//
lds_identification_load = create datastore
lds_identification_load.dataobject = 'ds_identification_load'
lds_identification_load.settrans( it_transaction)

if lds_identification_load.retrieve( ) > 0 then
	lds_identification_load.setsort( "up_code asc")
	lds_identification_load.sort( )
	if this.f_create_identification_key(lds_identification_load) > 0 then
		iw_display.dynamic event e_save()
	end if
end if

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

//--resize parm --//
iw_display.f_set_ii_leftpart_width(1/4)
iw_display.f_set_ii_midpart_width(1/3)
iw_display.f_set_ii_upperpart_height(1/2)
return 1
end event

