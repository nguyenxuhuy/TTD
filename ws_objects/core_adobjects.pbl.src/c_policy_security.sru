$PBExportHeader$c_policy_security.sru
forward
global type c_policy_security from c_policy_setup
end type
end forward

global type c_policy_security from c_policy_setup
end type
global c_policy_security c_policy_security

type variables

end variables

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_applicable_rule_hdr_grid'
istr_dwo[1].s_dwo_form = 'd_applicable_rule_hdr_form'
istr_dwo[1].s_dwo_grid = 'd_applicable_rule_hdr_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_applicable_rule_line_grid;d_business_rule_grid;'
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
istr_dwo[1].s_description = 'Vai trò được phân quyền'

istr_dwo[2].s_dwo_default =  'd_applicable_rule_line_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_applicable_rule_line_grid'
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = false
istr_dwo[2].b_shared = false
istr_dwo[2].s_dwo_master = 'd_applicable_rule_hdr_grid;'
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
istr_dwo[2].s_description = 'Điều kiện được phân quyền '
istr_dwo[2].s_pic_ref_table = ''
istr_dwo[2].s_pic_ref_field = ''

istr_dwo[3].s_dwo_default =  'd_policy_security_grid'
istr_dwo[3].s_dwo_form = ''
istr_dwo[3].s_dwo_grid = 'd_policy_security_grid'
istr_dwo[3].b_detail = true
istr_dwo[3].b_master = true
istr_dwo[3].b_cascade_del = true
istr_dwo[3].s_dwo_master = 'd_business_rule_grid;'
istr_dwo[3].s_dwo_details = 'd_policy_rule_constraint_grid;'
istr_dwo[3].s_dwo_shared = 'd_policy_security_form;'
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
istr_dwo[3].s_description = 'Các quyền truy xuất dữ liệu '
istr_dwo[3].s_pic_ref_table = ''
istr_dwo[3].s_pic_ref_field = ''

istr_dwo[4].s_dwo_default =  'd_policy_security_form'
istr_dwo[4].s_dwo_form = 'd_policy_security_form'
istr_dwo[4].s_dwo_grid = ''
istr_dwo[4].b_shared = true
istr_dwo[4].b_master = false
istr_dwo[4].b_cascade_del = false
istr_dwo[4].s_dwo_master = 'd_policy_security_grid;'
istr_dwo[4].s_dwo_details = ''
istr_dwo[4].s_master_keycol = ''
istr_dwo[4].s_detail_keycol = ''
istr_dwo[4].b_ref_table_yn  = false
istr_dwo[4].s_ref_table_field = ''
istr_dwo[4].b_insert = true
istr_dwo[4].b_update = true
istr_dwo[4].b_delete = true
istr_dwo[4].b_query = true
istr_dwo[4].b_print = true
istr_dwo[4].b_excel = true
istr_dwo[4].b_traceable = true
istr_dwo[4].b_focus_master = true
istr_dwo[4].b_keyboardlocked = true
istr_dwo[4].s_description = 'Các quyền truy xuất dữ liệu '
istr_dwo[4].s_pic_ref_table = ''
istr_dwo[4].s_pic_ref_field = ''

istr_dwo[5].s_dwo_default =  'd_policy_rule_constraint_grid'
istr_dwo[5].s_dwo_form = 'd_policy_rule_constraint_form'
istr_dwo[5].s_dwo_grid = 'd_policy_rule_constraint_grid'
istr_dwo[5].b_detail = true
istr_dwo[5].s_dwo_master = 'd_policy_security_grid;'
istr_dwo[5].s_master_keycol = 'ID;'
istr_dwo[5].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[5].b_ref_table_yn  = true
istr_dwo[5].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[5].b_insert = true
istr_dwo[5].b_update = true
istr_dwo[5].b_delete = true
istr_dwo[5].b_query = true
istr_dwo[5].b_print = true
istr_dwo[5].b_excel = true
istr_dwo[5].b_traceable = true
istr_dwo[5].b_focus_master = false
istr_dwo[5].b_keyboardlocked = true
istr_dwo[5].s_description = 'Điều kiện thực hiện phân quyền'
istr_dwo[5].s_pic_ref_table = ''
istr_dwo[5].s_pic_ref_field = ''

istr_dwo[6].s_dwo_default =  'd_business_rule_grid'
istr_dwo[6].s_dwo_form = ''
istr_dwo[6].s_dwo_grid = 'd_business_rule_grid'
istr_dwo[6].b_detail = true
istr_dwo[6].b_master = true
istr_dwo[6].s_dwo_master = 'd_applicable_rule_hdr_grid;'
istr_dwo[6].s_dwo_details = 'd_policy_security_grid;'
istr_dwo[6].s_master_keycol = 'ID;'
istr_dwo[6].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[6].b_ref_table_yn  = true
istr_dwo[6].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[6].b_insert = true
istr_dwo[6].b_update = true
istr_dwo[6].b_delete = true
istr_dwo[6].b_query = true
istr_dwo[6].b_print = true
istr_dwo[6].b_excel = true
istr_dwo[6].b_traceable = true
istr_dwo[6].b_focus_master = false
istr_dwo[6].b_keyboardlocked = true
istr_dwo[6].s_description = 'Phân quyền'
istr_dwo[6].s_pic_ref_table = ''
istr_dwo[6].s_pic_ref_field = ''


end subroutine

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'

end subroutine

on c_policy_security.create
call super::create
end on

on c_policy_security.destroy
call super::destroy
end on

event constructor;call super::constructor;ib_changed_dwo_4edit = true
this.ib_keyboardlocked = true
is_display_model = '1tv_up1d1d_mid1d1d_lo1d'
is_object_title = 'Phân quyền'

istr_actionpane[1].s_button_name = 'e_add;e_delete;e_modify;b_save;b_query;b_execquery;b_filteron;b_refresh;b_print;b_view_report;'
istr_actionpane[1].s_description = is_object_title

istr_tvo[1].ds_tv_item = create datastore
istr_tvo[1].ds_tv_item.dataobject = 'ds_identification_start_tv'

end event

event e_tv_selectionchanged;call super::e_tv_selectionchanged;t_dw_mpl		ldw_security,ldw_master
treeviewitem		l_tvi
c_string			lc_string
string				ls_filter, ls_coltype,ls_Filter_md
int					li_dwoCnt
long				ll_cur_hdl
any				laa_retrieve_arg[]

//-- set identification key --//
ll_cur_hdl = rpo_tv.finditem(currenttreeitem!, 0)
if ll_cur_hdl = -1 then
	ll_cur_hdl = rpo_tv.finditem( roottreeitem!, 0)
end if	
if ll_cur_hdl = -1 then 
	gf_messagebox('m.c_policy.e_tv_selectionchanged.01','Thông báo','Không tìm thấy mã phân quyền: identification_ID','exclamation','ok',1)
	return -1
end if
rpo_tv.getitem( ll_cur_hdl, l_tvi)	
ipo_tv = l_tvi.data	
ldw_security = iw_display.f_get_dw('d_policy_security_grid')
ls_coltype = ldw_security.describe( 'identification_id.coltype')
ldw_master = ldw_security.f_get_idw_master( )
ls_Filter_md = ldw_master.f_get_detail_filterString( ldw_security,ldw_security.ib_doc_filter )
ls_filter = lc_string.f_Get_expression( string(ipo_tv.istr_tv.db_id), ls_coltype, 'identification_id','filter')
if ls_Filter_md <> "" then
		ls_filter = ls_filter + ' and ' + ls_Filter_md
end if
ldw_security.setfilter( ls_filter)
ldw_security.filter( )

//-- load menu vao treeview --//
if pos(ipo_tv.istr_tv.s_object,'.u_')> 0  or  lc_string.f_countoccurrences( ipo_tv.istr_tv.s_object,'.') > 1 or left(ipo_tv.istr_tv.s_object,2) = 'u_' &
	or pos(ipo_tv.istr_tv.s_object,'.ur_')> 0 or left(ipo_tv.istr_tv.s_object,3) = 'ur_'  then
	connect using iw_display.it_transaction;
	this.f_create_identification_key_ex( ipo_tv.istr_tv, iw_display.it_transaction) 
//	if this.f_create_identification_key( ipo_tv.istr_tv) >0 then 
//		if not ldw_security.f_get_ib_editing() then
//			disconnect using iw_display.it_transaction;
//			iw_display.event e_save()
//			connect using iw_display.it_transaction;
//		end if
//	end if
	laa_retrieve_arg[1] = gs_user_lang
	laa_retrieve_arg[2] = ipo_tv.istr_tv.db_id
	if this.f_display_on_tv( rpo_tv, laa_retrieve_arg[]) = -1 then return -1	
	rpo_tv.selectitem(ll_cur_hdl)
	rpo_tv.expanditem(ll_cur_hdl)	
	disconnect using iw_display.it_transaction;
end if
RETURN 1


end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;treeview				ltv_handling
treeviewitem		l_tvi
datawindow			ldw_busines_rule, ldw_main
t_ds_db				lds_identification
c_String				lc_string
b_obj_instantiate	lbo_ins

long				ll_cur_hdl, ll_insertrow, ll_cnt, ll_row
any				laa_data[]
string				ls_code, ls_name, ls_filter, ls_coltype, ls_where
double			ldb_ident_id, ldb_rule_id

if rpo_dw.dataobject = 'd_applicable_rule_hdr_form' or rpo_dw.dataobject = 'd_applicable_rule_hdr_grid' then
	ldw_busines_rule = iw_display.dynamic f_get_dw('d_business_rule_grid')
	ll_insertrow = ldw_busines_rule.dynamic event e_addrow()
	
elseif rpo_dw.dataobject = 'd_policy_security_grid' then
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
	ldw_main = iw_display.f_get_dwmain( )
	ldw_busines_rule = iw_display.dynamic f_get_dw('d_business_rule_grid')
	ls_code = ldw_main.getitemstring( ldw_main.getrow(), 'code')
	ls_name = ldw_main.getitemstring( ldw_main.getrow(), 'name')
	ldb_rule_id = ldw_busines_rule.getitemnumber(ldw_busines_rule.getrow() , 'id')
	if  lc_string.f_countoccurrences( ipo_tv.istr_tv.s_object , '.') = 2 then
		lds_identification = create t_ds_db 
		lds_identification.dataobject = 'ds_identification'		
		lds_identification.f_settransobject( it_transaction )
		ls_where = "identification_key.up_id = "+string( ipo_tv.istr_tv.db_up_id)
		ls_where += " and not exists (select null from policy_hdr ph where ph.identification_id = identification_key.id and ph.object_ref_id = "+string(ldb_rule_id)+")"
		lds_identification.f_add_originalwhere( ls_where, " AND ")
		ll_cnt = lds_identification.retrieve( )
		FOR ll_row = 1 to ll_cnt
			ldb_ident_id = lds_identification.getitemnumber( ll_row, 'id')
			if ll_row = 1 then
				rpo_dw.setitem(vl_currentrow, 'identification_id', ldb_ident_id )	
				rpo_dw.setitem(vl_currentrow, 'type', 'security' )		
				rpo_dw.setitem(vl_currentrow, 'code', ls_code)
				rpo_dw.setitem(vl_currentrow, 'name', ls_name)			
				rpo_dw.setitem(vl_currentrow, 'QUERY_YN', 'Y' )	
				rpo_dw.setitem(vl_currentrow, 'UPDATE_YN', 'Y' )		
				rpo_dw.setitem(vl_currentrow, 'ACCESS_YN', 'Y' )	
				rpo_dw.setitem(vl_currentrow, 'print_yn', 'Y' )	
				rpo_dw.setitem(vl_currentrow, 'excel_yn', 'Y' )	
				rpo_dw.setitem(vl_currentrow, 'delete_yn', 'Y' )	
				rpo_dw.setitem(vl_currentrow, 'insert_yn', 'Y' )			
			else
				ll_insertrow = rpo_dw.insertrow(0)
				rpo_dw.setitem(ll_insertrow, 'id', lbo_ins.f_create_id_ex( it_transaction ) )	
				rpo_dw.setitem(ll_insertrow, 'company_id', gi_user_comp_id )	
				rpo_dw.setitem(ll_insertrow, 'branch_id', gdb_branch )	
				rpo_dw.setitem(ll_insertrow, 'object_ref_id', ldb_rule_id )	
				rpo_dw.setitem(ll_insertrow, 'object_ref_table', 'BUSINESS_RULE' )	
				rpo_dw.setitem(ll_insertrow, 'QUERY_YN', 'Y' )	
				rpo_dw.setitem(ll_insertrow, 'UPDATE_YN', 'Y' )
				rpo_dw.setitem(ll_insertrow, 'ACCESS_YN', 'Y' )	
				rpo_dw.setitem(ll_insertrow, 'print_yn', 'Y' )	
				rpo_dw.setitem(ll_insertrow, 'excel_yn', 'Y' )	
				rpo_dw.setitem(ll_insertrow, 'delete_yn', 'Y' )	
				rpo_dw.setitem(ll_insertrow, 'insert_yn', 'Y' )						
				rpo_dw.setitem(ll_insertrow, 'identification_id', ldb_ident_id )	
				rpo_dw.setitem(ll_insertrow, 'type', 'security' )		
				rpo_dw.setitem(ll_insertrow, 'code', ls_code)
				rpo_dw.setitem(ll_insertrow, 'name', ls_name)								
			end if
		NEXT
		destroy lds_identification
		rpo_dw.filter( )		
	elseif  lc_string.f_countoccurrences( ipo_tv.istr_tv.s_object , '.') = 3 then
		lds_identification = create t_ds_db 
		lds_identification.dataobject = 'ds_identification'		
		lds_identification.f_settransobject( it_transaction )
		ls_where = "identification_key.up_id = "+string( ipo_tv.istr_tv.db_up_id)
		ls_where += " and not exists (select null from policy_hdr ph where ph.identification_id = identification_key.id and ph.object_ref_id = "+string(ldb_rule_id)+")"
		lds_identification.f_add_originalwhere( ls_where, " AND ")				
		ll_cnt = lds_identification.retrieve( )
		FOR ll_row = 1 to ll_cnt
			ldb_ident_id = lds_identification.getitemnumber( ll_row, 'id')
			if ll_row = 1 then
				rpo_dw.setitem(vl_currentrow, 'identification_id', ldb_ident_id )	
				rpo_dw.setitem(vl_currentrow, 'type', 'security' )		
				rpo_dw.setitem(vl_currentrow, 'code', ls_code)
				rpo_dw.setitem(vl_currentrow, 'name', ls_name)			
				rpo_dw.setitem(vl_currentrow, 'QUERY_YN', 'Y' )	
				rpo_dw.setitem(vl_currentrow, 'UPDATE_YN', 'Y' )					
			else
				ll_insertrow = rpo_dw.insertrow(0)
				rpo_dw.setitem(ll_insertrow, 'id', lbo_ins.f_create_id_ex( it_transaction ) )	
				rpo_dw.setitem(ll_insertrow, 'company_id', gi_user_comp_id )	
				rpo_dw.setitem(ll_insertrow, 'branch_id', gdb_branch )	
				rpo_dw.setitem(ll_insertrow, 'object_ref_id', ldb_rule_id )	
				rpo_dw.setitem(ll_insertrow, 'object_ref_table', 'BUSINESS_RULE' )	
				rpo_dw.setitem(ll_insertrow, 'QUERY_YN', 'Y' )	
				rpo_dw.setitem(ll_insertrow, 'UPDATE_YN', 'Y' )	
				rpo_dw.setitem(ll_insertrow, 'identification_id', ldb_ident_id )	
				rpo_dw.setitem(ll_insertrow, 'type', 'security' )		
				rpo_dw.setitem(ll_insertrow, 'code', ls_code)
				rpo_dw.setitem(ll_insertrow, 'name', ls_name)								
			end if
		NEXT
		destroy lds_identification
		rpo_dw.filter( )
	else
		rpo_dw.setitem(vl_currentrow, 'identification_id', ipo_tv.istr_tv.db_id )	
		rpo_dw.setitem(vl_currentrow, 'type', 'security' )	
		rpo_dw.setitem(vl_currentrow, 'code', ls_code)
		rpo_dw.setitem(vl_currentrow, 'name', ls_name)		
	end if
end if
return 1

end event

event e_dw_e_preretrieve;call super::e_dw_e_preretrieve;/*  đóng lại bởi Long 07/04/2015
	chuyển qua sự kiện e_dw_e_rowfocuschanged
long				ll_cur_hdl
string				ls_coltype, ls_filter
treeviewitem		l_tvi
treeview			l_tv
c_string			lc_string

//-- set identification key --//
if rpo_dw.dataobject = 'd_policy_security_grid' then
	l_tv = iw_display.dynamic f_get_tv()
	ll_cur_hdl = l_tv.finditem(currenttreeitem!, 0)
	if ll_cur_hdl = -1 then
		ll_cur_hdl = l_tv.finditem( roottreeitem!, 0)
	end if	
	if ll_cur_hdl = -1 then 
		gf_messagebox('m.c_policy.e_dw_e_preretrieve.01','Thông báo','Không tìm thấy mã phân quyền: identification_ID','exclamation','ok',1)
		return -1
	end if
	l_tv.getitem( ll_cur_hdl, l_tvi)	
	ipo_tv = l_tvi.data	
	ls_coltype = rpo_dw.describe( 'identification_id.coltype')
	ls_filter = lc_string.f_Get_expression( string(ipo_tv.istr_tv.db_id), ls_coltype, 'identification_id','filter')
	rpo_dw.setfilter( ls_filter)
end if
*/
return 0
end event

event e_dw_updatestart;call super::e_dw_updatestart;int								li_idx
long							ll_modified_row
double						ldb_id
string							ls_appli_ref_id_str, ls_idkey_code
c_identification_initial		lc_identification_initial
c_string						lc_string

//-- Thêm ';' vào  chuôi ID --//
if rdw_requester.dataobject= 'd_applicable_rule_hdr_grid' or rdw_requester.dataobject= 'd_applicable_rule_hdr_form' then
	if rdw_requester.modifiedcount( ) > 0 then
		ll_modified_row = rdw_requester.GetNextModified(0, Primary!)
		DO while ll_modified_row > 0 and ll_modified_row <= rdw_requester.rowcount( )		
			if rdw_requester.getitemstring(ll_modified_row,'applicable_type') = 'table' then
				if rdw_requester.getitemstatus(ll_modified_row,'applicable_ref_id_string',primary!) = datamodified! &
					OR rdw_requester.getitemstatus(ll_modified_row, 'applicable_ref_id_string',primary!) = newmodified! then
					ls_appli_ref_id_str = rdw_requester.getitemstring(ll_modified_row, 'applicable_ref_id_string')
//					if lastpos(ls_appli_ref_id_str,';') < len(ls_appli_ref_id_str) and pos(ls_appli_ref_id_str,';') > 1 then 				
						ls_appli_ref_id_str = ';'+ls_appli_ref_id_str+';'
						rdw_requester.setitem(ll_modified_row,'applicable_ref_id_string',ls_appli_ref_id_str)
//					end if					 
				end if
			end if
			//-- tìm row modifief tiếp theo --//
			ll_modified_row = rdw_requester.GetNextModified(ll_modified_row, Primary!)
		LOOP
	end if	
end if

return 0
end event

event e_action_ctrl_bttn;//-- override --//

datawindow				ldw_focus
int								li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	if not this.ib_copying then
		//-- control d_action_edit --//
		FOR li_idx = 1 to upperbound(istr_actionpane[]) 
			if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
				if ldw_focus.dynamic f_get_ib_shared() then
					ldw_focus = ldw_focus.dynamic f_getdwmaster()
				end if			
				if ldw_focus.dynamic f_get_ib_detail() then
					if ib_changed_dwo_4edit then
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_filteron;b_query;b_refresh;b_delete;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;'
						end if
					end if
				else				
					if ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
				istr_actionpane[li_idx].s_visible_buttons =  'b_note;b_doc_trace;b_user_trace;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then				
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_open;call super::e_window_open;datawindow		ldw_main
datastore			lds_identification_load
treeview			ltv_display
any				la_args[]
long				ll_root_hdl

//-- add where cho dwmain --//
ldw_main = iw_display.dynamic f_get_dwmain()
la_args[1] = '()'
ldw_main.dynamic f_add_where('object_ref_table',la_args[])

//-- load identification key --//
lds_identification_load = create datastore
lds_identification_load.dataobject = 'ds_identification_load'
lds_identification_load.settransobject( it_transaction )

if lds_identification_load.retrieve( ) > 0 then
	lds_identification_load.setsort( "up_code asc")
	lds_identification_load.sort( )
	this.f_create_identification_key_ex(lds_identification_load, it_transaction )
//	if this.f_create_identification_key(lds_identification_load) > 0 then
//		iw_display.dynamic event e_save()
//	end if
end if

//-- load key vao treeview --//
ltv_display = iw_display.dynamic f_get_tv()
if isvalid(ltv_display) then
	la_args[1] =  gs_user_lang
	la_args[2] = 0
	if this.f_display_on_tv_new( ltv_display,la_args[]) = -1 then return -1
	ll_root_hdl = ltv_display.FindItem(RootTreeItem! , 0)
	ltv_display.selectitem(ll_root_hdl)
	ltv_display.expanditem(ll_root_hdl)
end if

return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;
//--resize parm --//
iw_display.f_set_ii_leftpart_width(1/4)
iw_display.f_set_ii_midpart_width(2/3)
iw_display.f_set_ii_gb_11_width(1/4)
iw_display.f_set_ii_upperpart_height(1/3)
iw_display.f_set_ii_gb_3_height(1/4)

return 0
end event

event e_dw_rowfocuschanged;call super::e_dw_rowfocuschanged;int					li_idx,li_rtn
long				ll_cur_hdl
string				ls_coltype, ls_filter,ls_Filter_md
treeviewitem	l_tvi
treeview			l_tv
c_string			lc_string
t_dw_mpl		ldw_security,ladw_detail[],ldw_master

//-- set identification key --//
if left(rpo_dw.dataobject,len(rpo_dw.dataobject) - 5) = 'd_applicable_rule_hdr' then
	ldw_security = iw_display.dynamic f_get_dw('d_policy_security_grid')
	ldw_master= ldw_security.f_get_idw_master( )
	ls_Filter_md = ldw_master.dynamic f_get_detail_filterString( ldw_security,ldw_security.ib_doc_filter )
	l_tv = iw_display.dynamic f_get_tv()
	ll_cur_hdl = l_tv.finditem(currenttreeitem!, 0)
	if ll_cur_hdl = -1 then
		ll_cur_hdl = l_tv.finditem( roottreeitem!, 0)
	end if	
	if ll_cur_hdl = -1 then 
		gf_messagebox('m.c_policy.e_dw_e_rowfocuschanged.01','Thông báo','Không tìm thấy mã phân quyền: identification_ID','exclamation','ok',1)
		return -1
	end if
	l_tv.getitem( ll_cur_hdl, l_tvi)	
	ipo_tv = l_tvi.data	
	ls_coltype = ldw_security.describe( 'identification_id.coltype')
	ls_filter = lc_string.f_Get_expression( string(ipo_tv.istr_tv.db_id), ls_coltype, 'identification_id','filter')
	if ls_Filter_md <> "" then
		ls_filter = ls_filter + ' and ' + ls_Filter_md
	end if
	ldw_security.setfilter( ls_filter)
	ldw_security.filter( )
	//--filter lại detail--//
	li_rtn = ldw_security.f_getdwdetails( ladw_detail)
	for li_idx = 1 to li_rtn
		ls_Filter_md = ldw_security.f_get_detail_filterstring( ladw_detail[li_idx], ladw_detail[li_idx].ib_doc_filter)
		ladw_detail[li_idx].setfilter( ls_Filter_md)
		ladw_detail[li_idx].filter( )
	next
end if

//if rpo_dw.dataobject = 'd_policy_security_grid' then
//	l_tv = iw_display.dynamic f_get_tv()
//	ll_cur_hdl = l_tv.finditem(currenttreeitem!, 0)
//	if ll_cur_hdl = -1 then
//		ll_cur_hdl = l_tv.finditem( roottreeitem!, 0)
//	end if	
//	if ll_cur_hdl = -1 then 
//		gf_messagebox('m.c_policy.e_dw_e_preretrieve.01','Thông báo','Không tìm thấy mã phân quyền: identification_ID','exclamation','ok',1)
//		return -1
//	end if
//	ls_originalFilter = rpo_dw.describe('datawindow.table.filter')
//	l_tv.getitem( ll_cur_hdl, l_tvi)	
//	ipo_tv = l_tvi.data	
//	ls_coltype = rpo_dw.describe( 'identification_id.coltype')
//	ls_filter = lc_string.f_Get_expression( string(ipo_tv.istr_tv.db_id), ls_coltype, 'identification_id','filter')
//	if pos(ls_originalFilter,ls_filter) = 0 then ls_filter = ls_filter + ' and ' + ls_originalFilter
//	rpo_dw.setfilter( ls_filter)
//	rpo_dw.filter()
//end if
return 0
end event

event e_dw_e_postretrieve;call super::e_dw_e_postretrieve;int 				li_rtn,li_idx
long				ll_cur_hdl
string				ls_coltype, ls_filter,ls_Filter_md
treeviewitem		l_tvi
treeview			l_tv
c_string			lc_string
t_dw_mpl		ldw_security,ldw_master,ladw_detail[]

//-- set identification key --//
if rpo_dw.dataobject = 'd_applicable_rule_hdr_grid' then
	ldw_security = iw_display.dynamic f_get_dw('d_policy_security_grid')
	ldw_master= ldw_security.f_get_idw_master( )
	ls_Filter_md = ldw_master.dynamic f_get_detail_filterString( ldw_security,ldw_security.ib_doc_filter )
	l_tv = iw_display.dynamic f_get_tv()
	ll_cur_hdl = l_tv.finditem(currenttreeitem!, 0)
	if ll_cur_hdl = -1 then
		ll_cur_hdl = l_tv.finditem( roottreeitem!, 0)
	end if	
	if ll_cur_hdl = -1 then 
		gf_messagebox('m.c_policy.e_dw_e_preretrieve.01','Thông báo','Không tìm thấy mã phân quyền: identification_ID','exclamation','ok',1)
		return -1
	end if
	l_tv.getitem( ll_cur_hdl, l_tvi)	
	ipo_tv = l_tvi.data	
	ls_coltype = ldw_security.describe( 'identification_id.coltype')
	ls_filter = lc_string.f_Get_expression( string(ipo_tv.istr_tv.db_id), ls_coltype, 'identification_id','filter')
	if ls_Filter_md <> "" then
		ls_filter = ls_filter + ' and ' + ls_Filter_md
	end if
	ldw_security.setfilter( ls_filter)
	ldw_security.filter( )
	li_rtn = ldw_security.f_getdwdetails( ladw_detail)
	for li_idx = 1 to li_rtn
		ls_Filter_md = ldw_security.f_get_detail_filterstring( ladw_detail[li_idx], ladw_detail[li_idx].ib_doc_filter)
		ladw_detail[li_idx].setfilter( ls_Filter_md)
		ladw_detail[li_idx].filter( )
	next
end if
return 0
end event

