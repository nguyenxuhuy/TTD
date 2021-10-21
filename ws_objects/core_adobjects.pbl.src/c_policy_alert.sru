$PBExportHeader$c_policy_alert.sru
forward
global type c_policy_alert from c_policy_setup
end type
end forward

global type c_policy_alert from c_policy_setup
end type
global c_policy_alert c_policy_alert

forward prototypes
public subroutine f_set_dwo_window ()
public function integer f_get_setup_objectname (ref string rs_objectname)
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_policy_alert_grid'
istr_dwo[1].s_dwo_form = 'd_policy_alert_form'
istr_dwo[1].s_dwo_grid = 'd_policy_alert_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_alert_rule_constraint_grid;d_business_rule_grid;'
istr_dwo[1].s_dwo_shared = ''
istr_dwo[1].s_dwo_master = ''
istr_dwo[1].s_master_keycol = ''
istr_dwo[1].s_detail_keycol = ''
istr_dwo[1].b_ref_table_yn  = false
istr_dwo[1].s_ref_table_field = ''
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Cài đặt Alert'

istr_dwo[2].s_dwo_default =  'd_alert_rule_constraint_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_alert_rule_constraint_grid'
istr_dwo[2].b_detail = true
istr_dwo[2].s_dwo_master = 'd_policy_alert_grid;'
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
istr_dwo[2].b_focus_master = false
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_description = 'Điều kiện dữ liệu Alert'

istr_dwo[3].s_dwo_default =  'd_applicable_rule_hdr_grid'
istr_dwo[3].s_dwo_form = ''
istr_dwo[3].s_dwo_grid = 'd_applicable_rule_hdr_grid'
istr_dwo[3].b_master = true
istr_dwo[3].b_detail = true
istr_dwo[3].b_cascade_del = true
istr_dwo[3].s_dwo_details = 'd_applicable_rule_line_grid;'
istr_dwo[3].s_dwo_master = 'd_business_rule_grid'
istr_dwo[3].s_master_keycol = 'ID;'
istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[3].b_ref_table_yn  = true
istr_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[3].b_insert = true
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = true
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].b_excel = true
istr_dwo[3].s_description = 'Cài đặt đối tượng nhận Alert'

istr_dwo[4].s_dwo_default =  'd_applicable_rule_line_grid'
istr_dwo[4].s_dwo_form = ''
istr_dwo[4].s_dwo_grid = 'd_applicable_rule_line_grid'
istr_dwo[4].b_detail = true
istr_dwo[4].b_cascade_del = false
istr_dwo[4].b_shared = false
istr_dwo[4].s_dwo_master = 'd_applicable_rule_hdr_grid;'
istr_dwo[4].s_master_keycol = 'ID;'
istr_dwo[4].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[4].b_ref_table_yn  = false
istr_dwo[4].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[4].b_insert = true
istr_dwo[4].b_update = true
istr_dwo[4].b_delete = true
istr_dwo[4].b_query = true
istr_dwo[4].b_print = true
istr_dwo[4].b_excel = true
istr_dwo[4].b_traceable = true
istr_dwo[4].b_focus_master = false
istr_dwo[4].b_keyboardlocked = true
istr_dwo[4].s_description = 'Điều kiện đối tượng nhận Alert '
istr_dwo[4].s_pic_ref_table = ''
istr_dwo[4].s_pic_ref_field = ''

istr_dwo[5].s_dwo_default =  'd_business_rule_grid'
istr_dwo[5].s_dwo_form = ''
istr_dwo[5].s_dwo_grid = 'd_business_rule_grid'
istr_dwo[5].b_detail = true
istr_dwo[5].b_master = true
istr_dwo[5].s_dwo_master = 'd_policy_alert_grid;'
istr_dwo[5].s_dwo_details = 'd_applicable_rule_hdr_grid;'
istr_dwo[5].s_master_keycol = 'ID;'
istr_dwo[5].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[5].b_ref_table_yn  = false
istr_dwo[5].s_ref_table_field = 'OBJECT_REF_TABLE' //OBJECT_REF_TABLE
istr_dwo[5].b_insert = true
istr_dwo[5].b_update = true
istr_dwo[5].b_delete = true
istr_dwo[5].b_query = true
istr_dwo[5].b_print = true
istr_dwo[5].b_excel = true
istr_dwo[5].b_traceable = true
istr_dwo[5].b_focus_master = false
istr_dwo[5].b_keyboardlocked = true
istr_dwo[5].s_description = ''
istr_dwo[5].s_pic_ref_table = ''
istr_dwo[5].s_pic_ref_field = ''
end subroutine

public function integer f_get_setup_objectname (ref string rs_objectname);c_menu lc_menu
c_identification_initial		lc_identification_initial
treeview						ltv_idkey
treeviewitem					l_tvi
c_string						lc_string

string							ls_identification_code, lsa_code[]
long							ll_cur_hdl
lc_menu = create c_menu
ltv_idkey = iw_display.dynamic f_get_tv()
ll_cur_hdl = ltv_idkey.finditem(currenttreeitem!, 0)
if ll_cur_hdl = -1 then
	ll_cur_hdl = ltv_idkey.finditem( roottreeitem!, 0)
end if	
if ll_cur_hdl = -1 then 
	gf_messagebox('m.c_policy_alert.f_get_setup_objectname.01','Thông báo','Không tìm thấy mã phân quyền: identification_ID','exclamation','ok',1)
	return -1
end if
ltv_idkey.getitem( ll_cur_hdl, l_tvi)	
ipo_tv = l_tvi.data	

ls_identification_code = lc_menu.f_get_code(ipo_tv.istr_tv.db_id )
lc_string.f_stringtoarray(ls_identification_code , '.', lsa_code[])
if pos(lsa_code[1], 'u_')> 0 then	
	rs_objectname = lsa_code[1]
	return 1
elseif pos(lsa_code[upperbound(lsa_code[])], 'u_')> 0 then
	rs_objectname = lsa_code[upperbound(lsa_code[])]
	return 1
else
	gf_messagebox('m.c_policy_alert.f_get_setup_objectname.01','Thông báo','Không tìm thấy đối tượng cài đặt cua datawindow:@'+ls_identification_code,'exclamation','ok',1)	
	return 0
end if

end function

on c_policy_alert.create
call super::create
end on

on c_policy_alert.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'ALERT_HDR'
ib_changed_dwo_4edit = true
this.ib_keyboardlocked = true
is_display_model = '1tv_up1d_mid1d_lo1d1d'
is_object_title = 'Thiết lập Alert'

istr_actionpane[1].s_description = is_object_title

istr_tvo[1].ds_tv_item = create datastore
istr_tvo[1].ds_tv_item.dataobject = 'ds_menu_start_tv'
end event

event e_window_e_preopen;call super::e_window_e_preopen;//--resize parm --//
iw_display.dynamic f_set_ii_midpart_width(3500)
iw_display.dynamic f_set_ii_gb_11_width(1100)
iw_display.dynamic f_set_ii_upperpart_height(800)
iw_display.dynamic f_set_ii_gb_3_height(500)
return 0
end event

event e_window_e_refresh;call super::e_window_e_refresh;
//long				ll_cur_hdl
//any				laa_retrieve_arg[]
//treeview			l_tv
//treeviewitem		l_tvi
//
////-- load menu vao treeview --//
//l_tv = iw_display.dynamic f_get_tv()
//ll_cur_hdl = l_tv.finditem(currenttreeitem!, 0)
//if ll_cur_hdl = -1 then
//	ll_cur_hdl = l_tv.finditem( roottreeitem!, 0)
//end if	
//if ll_cur_hdl = -1 then 
//	gf_messagebox('m.c_policy.e_dw_e_refresh.01','Thông báo','Không tìm thấy mã phân quyền: c_policy.e_dw_e_refresh.01:line11','exclamation','ok',1)
//	return -1
//end if
//l_tv.getitem( ll_cur_hdl, l_tvi)	
//ipo_tv = l_tvi.data	
//
//if pos(ipo_tv.istr_tv.s_object,'u_')> 0 then
//	
//	if this.f_create_identification_key( ipo_tv.istr_tv) = -1 then return -1		
//	iw_display.dynamic event e_save()
//	laa_retrieve_arg[1] = gs_user_lang
//	laa_retrieve_arg[2] = ipo_tv.istr_tv.db_id
//	if this.f_display_on_tv( l_tv,laa_retrieve_arg[]) = -1 then return -1
//end if
return 1
end event

event e_tv_selectionchanged;call super::e_tv_selectionchanged;//treeviewitem	l_tvi
//t_dw_mpl		ldw_alert
//c_string			lc_string
//string				ls_filter,ls_coltype
//long				ll_cur_hdl
//any				la_args[]
//
////-- set identification key --//
//ll_cur_hdl = rpo_tv.finditem(currenttreeitem!, 0)
//if ll_cur_hdl = -1 then
//	ll_cur_hdl = rpo_tv.finditem( roottreeitem!, 0)
//end if	
//if ll_cur_hdl = -1 then 
//	gf_messagebox('m.c_policy_alert.e_tv_selectionchanged.01','Thông báo','Không tìm thấy mã đối tượng: identification_ID','exclamation','ok',1)
//	return -1
//end if
//
//rpo_tv.getitem( ll_cur_hdl, l_tvi)	
//ipo_tv = l_tvi.data	
//ldw_alert = iw_display.f_get_dw('d_policy_alert_grid')
//ls_coltype = ldw_alert.describe( 'object_alert.coltype')
//ls_filter = lc_string.f_Get_expression('='+ upper(string(ipo_tv.istr_tv.s_object)), ls_coltype, 'object_alert','filter')
//ldw_alert.setfilter( ls_filter)
//ldw_alert.filter( )

return 1
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;treeview			ltv_handling
treeviewitem		l_tvi
datawindow		ldw_busines_rule
long				ll_cur_hdl, ll_insertrow

if rpo_dw.dataobject = 'd_policy_alert_form' or rpo_dw.dataobject = 'd_policy_alert_grid' then
	ldw_busines_rule = iw_display.dynamic f_get_dw('d_business_rule_grid')
	ll_insertrow = ldw_busines_rule.dynamic event e_addrow()
	//-- set object_alert --//
//	ltv_handling = iw_display.dynamic f_get_tv()
//	ll_cur_hdl = ltv_handling.finditem(currenttreeitem!, 0)
//	if ll_cur_hdl = -1 then
//		ll_cur_hdl = ltv_handling.finditem( roottreeitem!, 0)
//	end if	
//	if ll_cur_hdl = -1 then 
//		gf_messagebox('m.c_policy_alert.e_dw_e_postinsertrow.01','Thông báo','Không tìm thấy đối tượng: s_object','exclamation','ok',1)
//		return -1
//	end if
//	ltv_handling.getitem( ll_cur_hdl, l_tvi)	
//	ipo_tv = l_tvi.data	
	rpo_dw.setitem(vl_currentrow, 'object_alert', upper(ipo_tv.istr_tv.s_object) )
end if
return 1

end event

event e_window_open;call super::e_window_open;treeview			ltv_display
any				la_args[]
long				ll_root_hdl

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

