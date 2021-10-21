$PBExportHeader$c_policy_setup.sru
forward
global type c_policy_setup from s_object_display
end type
end forward

global type c_policy_setup from s_object_display
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
end type
global c_policy_setup c_policy_setup

type variables
double		idb_object_ref_id
end variables

forward prototypes
public function integer f_get_setup_objectname (ref string rs_objectname)
public function integer f_create_identification_key (datastore vds_load_key)
public function integer f_upd_object_policy (string vs_idkey_code, datawindow vdw_policy, long vl_row_modifed, dwbuffer vbf_modifed)
public function integer f_create_identification_key (t_s_tv vstr_tv)
public function integer f_create_identification_key_ex (datastore vds_load_key, ref t_transaction rt_transaction)
public function integer f_create_identification_key_ex (t_s_tv vstr_tv, ref t_transaction rt_transaction)
end prototypes

public function integer f_get_setup_objectname (ref string rs_objectname);
c_identification_initial		lc_identification_initial
treeview						ltv_idkey
treeviewitem					l_tvi
c_string						lc_string

string							ls_identification_code, lsa_code[]
long							ll_cur_hdl

ltv_idkey = iw_display.dynamic f_get_tv()
ll_cur_hdl = ltv_idkey.finditem(currenttreeitem!, 0)
if ll_cur_hdl = -1 then
	ll_cur_hdl = ltv_idkey.finditem( roottreeitem!, 0)
end if	
if ll_cur_hdl = -1 then 
	gf_messagebox('m.c_policy_setup.f_get_setup_objectname.01','Thông báo','Không tìm thấy mã phân quyền: identification_ID','exclamation','ok',1)
	return -1
end if
ltv_idkey.getitem( ll_cur_hdl, l_tvi)	
ipo_tv = l_tvi.data	

ls_identification_code = lc_identification_initial.f_get_code(ipo_tv.istr_tv.db_id )
lc_string.f_stringtoarray(ls_identification_code , '.', lsa_code[])
if pos(lsa_code[1], 'u_')> 0 then	
	rs_objectname = lsa_code[1]
	return 1
elseif pos(lsa_code[upperbound(lsa_code[])], 'u_')> 0 then
	rs_objectname = lsa_code[upperbound(lsa_code[])]
	return 1
else
	gf_messagebox('m.c_policy_setup.f_get_setup_objectname.01','Thông báo','Không tìm thấy đối tượng cài đặt cua datawindow:@'+ls_identification_code,'exclamation','ok',1)	
	return 0
end if

end function

public function integer f_create_identification_key (datastore vds_load_key);long						ll_row, ll_insert
double					ldb_up_id
string						ls_code
t_ds_db					lds_identification
t_transaction			lt_transaction
c_identification_initial	lc_identification_initial

if vds_load_key.rowcount() = 0 then return 0

lds_identification = create t_ds_db
lds_identification.dataobject = 'ds_identification'
iw_display.dynamic f_get_transaction(lt_transaction)
lds_identification.f_settransobject(lt_transaction )

FOR ll_row = 1 to vds_load_key.rowcount()
	ll_insert = lds_identification.insertrow(0)
	lds_identification.setitem( ll_insert, 'ID', lc_identification_initial.f_create_id_ex(lt_transaction) )
	lds_identification.setitem( ll_insert, 'object_ref_code',vds_load_key.getitemstring(ll_row, 'code') )
	lds_identification.setitem( ll_insert, 'object_ref_table', 'MENU' )
	ls_code =  lc_identification_initial.f_combine_code(vds_load_key , ll_row) 
	lds_identification.setitem( ll_insert, 'code', ls_code)
	ldb_up_id = lc_identification_initial.f_get_up_id(lds_identification,ls_code)
	if isnull(ldb_up_id) or ldb_up_id <> -1 then
		lds_identification.setitem( ll_insert, 'UP_ID',ldb_up_id)
	else
		destroy lds_identification
		return -1
	end if
NEXT
if lds_identification.update(true,false) = -1 then
	gf_messagebox('m.c_policy_rule.f_create_identification_key.01','Thông báo','Không cập nhật được mã phân quyền:@'+lt_transaction.sqlerrtext,'exclamation','ok',1)
	rollback using lt_transaction;
	destroy lds_identification
	return -1
end if
destroy lds_identification
return 1
end function

public function integer f_upd_object_policy (string vs_idkey_code, datawindow vdw_policy, long vl_row_modifed, dwbuffer vbf_modifed);double		ldb_business_rule_id, ldb_identification_id
string			ls_excel_yn, ls_print_yn, ls_insert_yn, ls_update_yn, ls_delete_yn, ls_query_yn, ls_access_yn, ls_full_inherit_yn
string			ls_code, ls_name, ls_object_ref_table, ls_originalFilter
any			la_value[]
long			ll_cnt, ll_row, ll_found, ll_insertrow
t_ds			lds_identification
c_string		lc_string

ldb_business_rule_id = vdw_policy.getitemnumber(vl_row_modifed, 'object_ref_id', vbf_modifed, false)
ls_excel_yn =  vdw_policy.getitemstring(vl_row_modifed, 'excel_yn', vbf_modifed, false)
ls_print_yn =  vdw_policy.getitemstring(vl_row_modifed, 'print_yn', vbf_modifed, false)
ls_insert_yn =  vdw_policy.getitemstring(vl_row_modifed, 'insert_yn', vbf_modifed, false)
ls_update_yn =  vdw_policy.getitemstring(vl_row_modifed, 'update_yn', vbf_modifed, false)
ls_delete_yn =  vdw_policy.getitemstring(vl_row_modifed, 'delete_yn', vbf_modifed, false)
ls_query_yn =  vdw_policy.getitemstring(vl_row_modifed, 'query_yn', vbf_modifed, false)
ls_access_yn =  vdw_policy.getitemstring(vl_row_modifed, 'access_yn', vbf_modifed, false)
ls_full_inherit_yn =  vdw_policy.getitemstring(vl_row_modifed, 'full_inherit_yn', vbf_modifed, false)
ls_code = vdw_policy.getitemstring(vl_row_modifed, 'code', vbf_modifed, false)
ls_name = vdw_policy.getitemstring(vl_row_modifed, 'name', vbf_modifed, false)
ls_object_ref_table = vdw_policy.getitemstring(vl_row_modifed, 'object_ref_table', vbf_modifed, false)

ls_originalFilter = vdw_policy.describe("datawindow.table.filter")
vdw_policy.setfilter("object_ref_id = "+string(ldb_business_rule_id))
vdw_policy.filter()

lds_identification = create t_ds
lds_identification.dataobject = 'ds_identification'
la_value[1] = vs_idkey_code + '.*'
lds_identification.f_add_where( 'code', la_value)

lds_identification.settransobject( it_transaction )
ll_cnt = lds_identification.retrieve( )

FOR ll_row = 1 to ll_cnt
	ldb_identification_id = lds_identification.getitemnumber( ll_row, 'id')
	ll_found = vdw_policy.find('identification_id='+string(ldb_identification_id), 1, vdw_policy.rowcount() )
	if ll_found = 0 then
		ll_insertrow = vdw_policy.dynamic event e_addrow()
		vdw_policy.setitem(ll_insertrow, 'object_ref_id', ldb_business_rule_id)
		vdw_policy.setitem(ll_insertrow, 'excel_yn', ls_excel_yn)
		vdw_policy.setitem(ll_insertrow, 'print_yn', ls_print_yn)
		vdw_policy.setitem(ll_insertrow, 'insert_yn', ls_insert_yn)
		vdw_policy.setitem(ll_insertrow, 'update_yn', ls_update_yn)
		vdw_policy.setitem(ll_insertrow, 'delete_yn', ls_delete_yn)
		vdw_policy.setitem(ll_insertrow, 'query_yn', ls_query_yn)
		vdw_policy.setitem(ll_insertrow, 'access_yn',ls_access_yn)
		vdw_policy.setitem(ll_insertrow, 'full_inherit_yn',ls_full_inherit_yn )
		vdw_policy.setitem(ll_insertrow, 'code', ls_code)
		vdw_policy.setitem(ll_insertrow, 'name',ls_name)
		vdw_policy.setitem(ll_insertrow, 'object_ref_table', upper(ls_object_ref_table))		
		vdw_policy.setitem(ll_insertrow, 'identification_id',ldb_identification_id)		
		vdw_policy.setitem(ll_insertrow, 'down_update_yn','Y')	
	elseif ll_found > 0 then
		vdw_policy.setitem(ll_found, 'excel_yn', ls_excel_yn)
		vdw_policy.setitem(ll_found, 'print_yn', ls_print_yn)
		vdw_policy.setitem(ll_found, 'insert_yn', ls_insert_yn)
		vdw_policy.setitem(ll_found, 'update_yn', ls_update_yn)
		vdw_policy.setitem(ll_found, 'delete_yn', ls_delete_yn)
		vdw_policy.setitem(ll_found, 'query_yn', ls_query_yn)
		vdw_policy.setitem(ll_found, 'access_yn',ls_access_yn)
		vdw_policy.setitem(ll_found, 'full_inherit_yn',ls_full_inherit_yn )	
		vdw_policy.setitem(ll_insertrow, 'down_update_yn','Y')	
	else
		gf_messagebox('m.c_policy_setup.f_upd_object_policy.01','Thông báo','Lỗi làm find:c_policy_setup.f_upd_object_policy, line34', 'exclamtion','ok',1)
		return -1
	end if
NEXT

////-- trả lại filter --//
vdw_policy.setfilter(ls_originalFilter)
vdw_policy.filter()
return 1
end function

public function integer f_create_identification_key (t_s_tv vstr_tv);long						ll_idx,ll_idx2,ll_idx3, ll_insert, ll_count
double					ldb_up_id
string						ls_up_code, lsa_dwo[], ls_code, ls_object, ls_object4create, ls_object_ref_code
string						lsa_popup[], ls_popup,ls_bttnname, ls_action_bttns, lsa_bttnname[], ls_ctrlname
int							li_buttnCnt, li_cnt, li_idx
boolean					lb_ignore
t_ds_db					lds_identification, lds_identification_load
t_transaction			lt_transaction
c_identification_initial	lc_identification_initial
s_str_dwo				lstr_dwo[]
s_str_dwo_tabpage	lstr_dwo_tabpage[]
s_str_actionpane		lstr_actionpane[]
s_object_display		lobj_handling
c_string					lc_string

iw_display.dynamic f_get_transaction(lt_transaction)
lds_identification_load = create t_ds_db
if (pos(vstr_tv.s_object , '.u_') >0  and pos(vstr_tv.s_object , '.') = lastpos(vstr_tv.s_object , '.') ) &
		or (pos(vstr_tv.s_object , '.ur_') >0 and left(vstr_tv.s_object,3) <> 'ur_')  then	
	ls_object = mid(vstr_tv.s_object,lastpos(vstr_tv.s_object,'.')+1)
	ls_ctrlname = mid(vstr_tv.s_object,pos(vstr_tv.s_object,'.')+1)
	if pos(ls_object,'@')>0 then
		ls_object4create = mid(ls_object,1,pos(ls_object,'@') - 1)
	elseif  left(ls_object,2) = 'u_' or left(ls_object,3) = 'ur_' then
		ls_object4create = upper(ls_object)
	else
		return 0
	end if
	if left(ls_object4create, 4) = 'U_W_' then return 0
	
	lobj_handling = create using ls_object4create
	//-- lay cac dw tren window --//
	ll_count = lobj_handling.dynamic f_get_dwo(lstr_dwo[])
	FOR ll_idx = 1 to ll_count
		if lstr_dwo[ll_idx].b_shared then continue
		lsa_dwo[upperbound(lsa_dwo[])+1] = left(lstr_dwo[ll_idx].s_dwo_default,len(lstr_dwo[ll_idx].s_dwo_default)-5)		
	NEXT
	//-- lay cac dw tren tabpage --//
	ll_count = lobj_handling.dynamic f_get_dwo_tabpage(lstr_dwo_tabpage[])
	FOR ll_idx = 1 to ll_count
		FOR ll_idx2 =1 to upperbound(lstr_dwo_tabpage[ll_idx].str_dwo[])
			if lstr_dwo_tabpage[ll_idx].str_dwo[ll_idx2].b_shared then continue
			lsa_dwo[upperbound(lsa_dwo[])+1] = left(lstr_dwo_tabpage[ll_idx].str_dwo[ll_idx2].s_dwo_default,len(lstr_dwo_tabpage[ll_idx].str_dwo[ll_idx2].s_dwo_default)-5)
		NEXT
	NEXT	
	//-- lay cac dw chuc nang --//
	ll_count = lobj_handling.dynamic f_get_actionpane_structure(lstr_actionpane[])
	FOR ll_idx = 1 to ll_count
		lsa_dwo[upperbound(lsa_dwo[])+1] = lstr_actionpane[ll_idx].s_dwo_action
	NEXT	
	lds_identification_load.dataobject = 'ds_identification_load_object'
	
	lds_identification_load.f_settransobject(lt_transaction )
	ll_count = lds_identification_load.retrieve(gs_user_lang,vstr_tv.s_object, ls_object4create, lsa_dwo[])
	ls_up_code = vstr_tv.s_object
elseif  pos(vstr_tv.s_object, '.u_') = 0 and left(vstr_tv.s_object,2) <> 'u_' and pos(vstr_tv.s_object, '.ur_') = 0 and left(vstr_tv.s_object,3) <> 'ur_'  then	
	return 0
elseif  (pos(vstr_tv.s_object , '.u_') >0  and pos(vstr_tv.s_object , '.') < lastpos(vstr_tv.s_object , '.') )  or &
	(pos(vstr_tv.s_object , '.ur_') >0  and pos(vstr_tv.s_object , '.') < lastpos(vstr_tv.s_object , '.') )  then		
//	if lc_string.f_countoccurrences( vstr_tv.s_object, '.') > 1 then return 0	
	ls_up_code =  left(vstr_tv.s_object, lastpos(vstr_tv.s_object,'.')-1) 
	ls_object4create = mid(ls_up_code,lastpos(ls_up_code,'.')+1)
	ls_ctrlname = mid(vstr_tv.s_object,lastpos(vstr_tv.s_object,'.')+1)
	if pos(ls_object4create,'@')>0 then
		ls_object4create = left(ls_object4create, pos(ls_object4create,'@') - 1)
	end if			
	
	if (left(ls_ctrlname,2) = 'd_' or left(ls_ctrlname,3) = 'dp_' or left(ls_ctrlname,3) = 'dr_') and left(ls_ctrlname,9) <> 'd_action_' then
		lds_identification_load.dataobject = 'ds_identification_load_dw'
		ls_popup =  'm_excel;m_go_to_main_window;m_setup_user_access;m_setup_deligate;m_setup_alert;m_edit_window_label;m_setup_dw;'
		lc_string.f_stringtoarray( ls_popup, ';',lsa_popup[])
		lds_identification_load.f_settransobject(lt_transaction )
		ll_count = lds_identification_load.retrieve(gs_user_lang, ls_object4create, ls_up_code, ls_ctrlname, lsa_popup[])
		
	elseif left(ls_ctrlname,9) = 'd_action_' then
		lds_identification_load.dataobject = 'ds_identification_load_action'
		lds_identification_load.f_settransobject(lt_transaction )
		ll_count = lds_identification_load.retrieve(ls_up_code, ls_ctrlname )
	else
		return 0
	end if
	
end if
lds_identification = create t_ds_db
lds_identification.dataobject = 'ds_identification'
lds_identification.f_settransobject(lt_transaction )
if  left(ls_ctrlname,9) <> 'd_action_' and ll_count > 0 then		
	FOR ll_idx = 1 to ll_count
		ls_object_ref_code = lds_identification_load.getitemstring(ll_idx, 'object_ref_code')
		ll_insert = lds_identification.insertrow(0)
		lds_identification.setitem( ll_insert, 'ID', lc_identification_initial.f_create_id_ex(lt_transaction) )
		lds_identification.setitem( ll_insert, 'object_ref_code', ls_object_ref_code )
		lds_identification.setitem( ll_insert, 'object_ref_table', 'LABEL' )
		//ls_code = lds_identification_load.getitemstring(ll_idx, 'code')
		ls_code = ls_up_code + '.' + ls_object_ref_code
		if ls_popup <> '' and pos (ls_code,vstr_tv.s_object+'.') = 0 then
			ls_code = left(ls_code,pos(ls_code,'.')) + vstr_tv.s_object + mid(ls_code,pos(ls_code,'.'))
		end if
		lds_identification.setitem( ll_insert, 'code', ls_code)
		ldb_up_id = lc_identification_initial.f_get_up_id_ex(lds_identification, ls_code, lt_transaction)
		if isnull(ldb_up_id) or ldb_up_id <> -1 then
			lds_identification.setitem( ll_insert, 'UP_ID', ldb_up_id)
		else
			gf_messagebox('m.c_policy_rule.f_create_identification_key.03','Thông báo','Không tìm thấy mã phân quyền cấp cha:@'+ls_up_code,'exclamation','ok',1)
			destroy lds_identification
			destroy lds_identification_load			
			if isvalid(lobj_handling) then destroy lobj_handling
			return -1
		end if
	NEXT
elseif left(ls_ctrlname,9) = 'd_action_' then
	if not isvalid(lobj_handling) then
		lobj_handling = create using ls_object4create		
	end if
	li_cnt = lobj_handling.f_get_actionpane_structure(lstr_actionpane[] )
	FOR li_idx=1 to li_cnt		
		if lstr_actionpane[li_idx].s_dwo_action = ls_ctrlname then
			ls_action_bttns = lstr_actionpane[li_idx].s_button_name
			ls_action_bttns = lc_string.f_globalreplace(ls_action_bttns,' ' , '') //-- Bỏ khoảng trắng --//
			if lastpos(ls_action_bttns,';') < len(ls_action_bttns) then ls_action_bttns +=';' //-- thêm dấu ';' cuối --//
			//-- tạo key cho các nút con ( subbutton) --//
			FOR ll_idx2 = 1 to upperbound(lstr_actionpane[li_idx].sa_sub_button[])
				if lastpos(ls_action_bttns,';') < len(ls_action_bttns) then ls_action_bttns +=';'
				ls_action_bttns += lstr_actionpane[li_idx].sa_sub_button[ll_idx2]							
			NEXT			
			if ll_count > 0 then
				// loại bỏ các nút đạ tao key rồi --//
				FOR ll_idx2 = 1 to ll_count
					ls_object_ref_code = lds_identification_load.getitemstring(ll_idx2, 'object_ref_code')
					ls_bttnname = mid(ls_object_ref_code,pos(ls_object_ref_code,'.')+1)	
					ls_action_bttns = lc_string.f_globalreplace(ls_action_bttns,ls_bttnname+';' , '')				
				NEXT
			end if
			//-- tạo key cho các nút mới --//
			li_buttnCnt = lc_string.f_stringtoarray( ls_action_bttns, ';', lsa_bttnname[])
			FOR ll_idx2 = 1 to li_buttnCnt
				ls_object_ref_code =  lstr_actionpane[li_idx].s_dwo_action+'.'+lsa_bttnname[ll_idx2] 
				ll_insert = lds_identification.insertrow(0)
				lds_identification.setitem( ll_insert, 'ID', lc_identification_initial.f_create_id_ex(lt_transaction) )
				lds_identification.setitem( ll_insert, 'object_ref_code', ls_object_ref_code)
				lds_identification.setitem( ll_insert, 'object_ref_table', 'LABEL' )
				ls_code = ls_up_code + '.' + ls_object_ref_code
				lds_identification.setitem( ll_insert, 'code', ls_code)
				ldb_up_id = lc_identification_initial.f_get_up_id_ex(lds_identification, ls_code, lt_transaction)
				if isnull(ldb_up_id) or ldb_up_id <> -1 then
					lds_identification.setitem( ll_insert, 'UP_ID', ldb_up_id)
				else
					gf_messagebox('m.c_policy_rule.f_create_identification_key.03','Thông báo','Không tìm thấy mã phân quyền cấp cha:@'+ls_up_code,'exclamation','ok',1)
					destroy lds_identification
					destroy lds_identification_load			
					if isvalid(lobj_handling) then destroy lobj_handling
					return -1
				end if				
			NEXT
		end if
	NEXT		
else
	destroy lds_identification
	destroy lds_identification_load	
	if isvalid(lobj_handling) then destroy lobj_handling
	return 0
end if
if lds_identification.update(true,false) = -1 then
	gf_messagebox('m.c_policy_rule.f_create_identification_key.04','Thông báo','Không cập nhật được mã phân quyền:@'+lt_transaction.sqlerrtext,'exclamation','ok',1)
	rollback using lt_transaction;
	destroy lds_identification
	if isvalid(lobj_handling) then destroy lobj_handling
	return -1
end if
destroy lds_identification
destroy lds_identification_load
if isvalid(lobj_handling) then destroy lobj_handling
return 1
end function

public function integer f_create_identification_key_ex (datastore vds_load_key, ref t_transaction rt_transaction);long						ll_row, ll_insert
double					ldb_up_id
string						ls_code
t_ds_db					lds_identification
//t_transaction			lt_transaction
c_identification_initial	lc_identification_initial

if vds_load_key.rowcount() = 0 then return 0

lds_identification = create t_ds_db
lds_identification.dataobject = 'ds_identification'
lds_identification.f_settransobject(rt_transaction )

FOR ll_row = 1 to vds_load_key.rowcount()
	ll_insert = lds_identification.insertrow(0)
	lds_identification.setitem( ll_insert, 'ID', lc_identification_initial.f_create_id_ex(rt_transaction) )
	lds_identification.setitem( ll_insert, 'object_ref_code',vds_load_key.getitemstring(ll_row, 'code') )
	lds_identification.setitem( ll_insert, 'object_ref_table', 'MENU' )
	ls_code =  lc_identification_initial.f_combine_code(vds_load_key , ll_row) 
	lds_identification.setitem( ll_insert, 'code', ls_code)
	ldb_up_id = lc_identification_initial.f_get_up_id(lds_identification,ls_code)
	if isnull(ldb_up_id) or ldb_up_id <> -1 then
		lds_identification.setitem( ll_insert, 'UP_ID',ldb_up_id)
	else
		destroy lds_identification
		return -1
	end if
NEXT
if lds_identification.update(true,false) = -1 then
	gf_messagebox('m.c_policy_rule.f_create_identification_key.01','Thông báo','Không cập nhật được mã phân quyền:@'+rt_transaction.sqlerrtext,'exclamation','ok',1)
	rollback using rt_transaction;
	destroy lds_identification
	return -1
end if
commit using rt_transaction;
destroy lds_identification
return 1
end function

public function integer f_create_identification_key_ex (t_s_tv vstr_tv, ref t_transaction rt_transaction);long						ll_idx,ll_idx2,ll_idx3, ll_insert, ll_count
double					ldb_up_id
string						ls_up_code, lsa_dwo[], ls_code, ls_object, ls_object4create, ls_object_ref_code, ls_subcode
string						lsa_popup[], ls_popup,ls_bttnname, ls_action_bttns, lsa_bttnname[], ls_ctrlname, ls_buttons
int							li_buttnCnt, li_cnt, li_idx
boolean					lb_ignore
t_ds_db					lds_identification, lds_identification_load
c_identification_initial	lc_identification_initial
s_str_dwo				lstr_dwo[]
s_str_dwo_tabpage	lstr_dwo_tabpage[]
s_str_actionpane		lstr_actionpane[]
s_object_display		lobj_handling
c_string					lc_string


lds_identification_load = create t_ds_db
if (pos(vstr_tv.s_object , '.u_') >0  and pos(vstr_tv.s_object , '.') = lastpos(vstr_tv.s_object , '.') ) &
		or (pos(vstr_tv.s_object , '.ur_') >0 and left(vstr_tv.s_object,3) <> 'ur_')  then	
	ls_object = mid(vstr_tv.s_object,lastpos(vstr_tv.s_object,'.')+1)
	ls_ctrlname = mid(vstr_tv.s_object,pos(vstr_tv.s_object,'.')+1)
	if pos(ls_object,'@')>0 then
		ls_object4create = mid(ls_object,1,pos(ls_object,'@') - 1)
	elseif  left(ls_object,2) = 'u_' or left(ls_object,3) = 'ur_' then
		ls_object4create = upper(ls_object)
	else
		return 0
	end if
	if left(ls_object4create, 4) = 'U_W_' then return 0
	
	lobj_handling = create using ls_object4create
	//-- lay cac dw tren window --//
	ll_count = lobj_handling.dynamic f_get_dwo(lstr_dwo[])
	FOR ll_idx = 1 to ll_count
		if lstr_dwo[ll_idx].b_shared then continue
		lsa_dwo[upperbound(lsa_dwo[])+1] = left(lstr_dwo[ll_idx].s_dwo_default,len(lstr_dwo[ll_idx].s_dwo_default)-5)		
	NEXT
	//-- lay cac dw tren tabpage --//
	ll_count = lobj_handling.dynamic f_get_dwo_tabpage(lstr_dwo_tabpage[])
	FOR ll_idx = 1 to ll_count
		FOR ll_idx2 =1 to upperbound(lstr_dwo_tabpage[ll_idx].str_dwo[])
			if lstr_dwo_tabpage[ll_idx].str_dwo[ll_idx2].b_shared then continue
			lsa_dwo[upperbound(lsa_dwo[])+1] = left(lstr_dwo_tabpage[ll_idx].str_dwo[ll_idx2].s_dwo_default,len(lstr_dwo_tabpage[ll_idx].str_dwo[ll_idx2].s_dwo_default)-5)
		NEXT
	NEXT	
	//-- lay cac dw chuc nang --//
	ll_count = lobj_handling.dynamic f_get_actionpane_structure(lstr_actionpane[])
	ls_buttons = lstr_actionpane[1].s_button_name
//	FOR ll_idx = 1 to ll_count
//		lsa_dwo[upperbound(lsa_dwo[])+1] = lstr_actionpane[ll_idx].s_dwo_action
//	NEXT	
	lds_identification_load.dataobject = 'ds_identification_load_object_ex'
	
	lds_identification_load.f_settransobject(rt_transaction )
	ll_count = lds_identification_load.retrieve(gs_user_lang,vstr_tv.s_object, ls_object4create, lsa_dwo[])
	ls_up_code = vstr_tv.s_object
elseif  pos(vstr_tv.s_object, '.u_') = 0 and left(vstr_tv.s_object,2) <> 'u_' and pos(vstr_tv.s_object, '.ur_') = 0 and left(vstr_tv.s_object,3) <> 'ur_'  then	
	return 0
elseif  (pos(vstr_tv.s_object , '.u_') >0  and pos(vstr_tv.s_object , '.') < lastpos(vstr_tv.s_object , '.') )  or &
	(pos(vstr_tv.s_object , '.ur_') >0  and pos(vstr_tv.s_object , '.') < lastpos(vstr_tv.s_object , '.') )  then		
//	if lc_string.f_countoccurrences( vstr_tv.s_object, '.') > 1 then return 0	
	ls_up_code =  left(vstr_tv.s_object, lastpos(vstr_tv.s_object,'.')-1) 
	ls_object4create = mid(ls_up_code,lastpos(ls_up_code,'.')+1)
	ls_ctrlname = mid(vstr_tv.s_object,lastpos(vstr_tv.s_object,'.')+1)
	if pos(ls_object4create,'@')>0 then
		ls_object4create = left(ls_object4create, pos(ls_object4create,'@') - 1)
	end if			
	
	if left(ls_ctrlname,2) = 'd_' or left(ls_ctrlname,3) = 'dp_' or left(ls_ctrlname,3) = 'dr_' then
		lds_identification_load.dataobject = 'ds_identification_load_dw'
		ls_popup =  'm_excel;m_go_to_main_window;m_setup_user_access;m_setup_deligate;m_setup_alert;m_edit_window_label;m_setup_dw;'
		lc_string.f_stringtoarray( ls_popup, ';',lsa_popup[])
		lds_identification_load.f_settransobject(rt_transaction )
		ll_count = lds_identification_load.retrieve(gs_user_lang, ls_object4create, ls_up_code, ls_ctrlname, lsa_popup[])
	else
		return 0
	end if
	
end if
if  ll_count > 0 then		
	lds_identification = create t_ds_db
	lds_identification.dataobject = 'ds_identification'
	lds_identification.f_settransobject(rt_transaction )	
	FOR ll_idx = 1 to ll_count
		ls_object_ref_code = lds_identification_load.getitemstring(ll_idx, 'object_ref_code')
		ls_subcode =  lds_identification_load.getitemstring(ll_idx, 'subcode')
		if ls_subcode = 'button' then
			//-- check if button belong to object --//
			if pos(ls_buttons,ls_object_ref_code+';') = 0 then continue
		end if
		ll_insert = lds_identification.insertrow(0)
		lds_identification.setitem( ll_insert, 'ID', lc_identification_initial.f_create_id_ex(rt_transaction) )
		lds_identification.setitem( ll_insert, 'object_ref_code', ls_object_ref_code )
		lds_identification.setitem( ll_insert, 'object_ref_table', 'LABEL' )
		//ls_code = lds_identification_load.getitemstring(ll_idx, 'code')
		ls_code = ls_up_code + '.' + ls_object_ref_code
		if ls_popup <> '' and pos (ls_code,vstr_tv.s_object+'.') = 0 then
			ls_code = left(ls_code,pos(ls_code,'.')) + vstr_tv.s_object + mid(ls_code,pos(ls_code,'.'))
		end if
		lds_identification.setitem( ll_insert, 'code', ls_code)
		if ldb_up_id = 0 or isnull(ldb_up_id) then
			ldb_up_id = lc_identification_initial.f_get_up_id_ex(lds_identification, ls_code, rt_transaction)
		end if
		if isnull(ldb_up_id) or ldb_up_id <> -1 then
			lds_identification.setitem( ll_insert, 'UP_ID', ldb_up_id)
		else
			gf_messagebox('m.c_policy_rule.f_create_identification_key.03','Thông báo','Không tìm thấy mã phân quyền cấp cha:@'+ls_up_code,'exclamation','ok',1)
			destroy lds_identification
			destroy lds_identification_load			
			if isvalid(lobj_handling) then destroy lobj_handling
			return -1
		end if
	NEXT
else
	destroy lds_identification_load	
	if isvalid(lobj_handling) then destroy lobj_handling
	return 0
end if
if lds_identification.update(true,false) = -1 then
	gf_messagebox('m.c_policy_rule.f_create_identification_key.04','Thông báo','Không cập nhật được mã phân quyền:@'+rt_transaction.sqlerrtext,'exclamation','ok',1)
	rollback using rt_transaction;
	destroy lds_identification
	if isvalid(lobj_handling) then destroy lobj_handling
	return -1
end if
commit using rt_transaction;
destroy lds_identification
destroy lds_identification_load
if isvalid(lobj_handling) then destroy lobj_handling
return 1
end function

on c_policy_setup.create
call super::create
end on

on c_policy_setup.destroy
call super::destroy
end on

event constructor;call super::constructor;
is_table = 'POLICY_HDR'
ib_changed_dwo_4edit = false


istr_tvo[1].ds_tv_item = create datastore
istr_tvo[1].ds_tv_item.dataobject = 'ds_identification_start_tv'


end event

event e_dw_updatestart;call super::e_dw_updatestart;long							ll_modified_row
double						ldb_id
string							ls_idkey_code, ls_down_update_yn
c_identification_initial		lc_identification_initial
c_string						lc_string

//-- cập nhật xống đối tượng cài đặt --//
if rdw_requester.dataobject= 'd_policy_rule_form' &
	OR rdw_requester.dataobject= 'd_policy_rule_grid' &
	OR rdw_requester.dataobject= 'd_policy_security_grid' &
	OR rdw_requester.dataobject= 'd_policy_security_form' then
	if rdw_requester.modifiedcount( ) > 0 then
		//-- kiem tra buffer primary --//
		ll_modified_row = rdw_requester.GetNextModified(0, Primary!)
		DO while ll_modified_row > 0 and ll_modified_row <= rdw_requester.rowcount( )			
			ls_down_update_yn = rdw_requester.getitemstring(ll_modified_row, 'down_update_yn', primary!, false)
			if isnull(ls_down_update_yn) then
				ldb_id = rdw_requester.getitemnumber(ll_modified_row, 'identification_id', primary!, false)
				ls_idkey_code = lc_identification_initial.f_get_code_ex( ldb_id, it_transaction )
				if left(ls_idkey_code,2) <> 'u_' and pos(ls_idkey_code, '.u_') = 0 then
					if this.f_upd_object_policy(ls_idkey_code, rdw_requester,ll_modified_row,primary!) = -1 then return -1
				end if
			end if
			ll_modified_row = rdw_requester.GetNextModified(ll_modified_row, Primary!)
		LOOP	
		
		//-- kiem tra buffer filter --//
		ll_modified_row = rdw_requester.GetNextModified(0, Filter!)
		DO while ll_modified_row > 0 and ll_modified_row <= rdw_requester.filteredcount()					
			ls_down_update_yn = rdw_requester.getitemstring(ll_modified_row, 'down_update_yn', filter!, false)
			if isnull(ls_down_update_yn) then			
				ldb_id = rdw_requester.getitemnumber(ll_modified_row, 'identification_id', filter!, false)
				ls_idkey_code = lc_identification_initial.f_get_code_ex( ldb_id, it_transaction )
				if left(ls_idkey_code,2) <> 'u_' and pos(ls_idkey_code, '.u_') = 0 then
					if this.f_upd_object_policy(ls_idkey_code, rdw_requester,ll_modified_row,filter!) = -1 then return -1
				end if
			end if
			ll_modified_row = rdw_requester.GetNextModified(ll_modified_row, filter!)
		LOOP			
				
	end if
end if
return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;if rpo_dw.dataobject = 'd_policy_rule_form' or rpo_dw.dataobject = 'd_policy_security_form' then
	choose case vs_colname
		case 'delete_yn'
			if vs_editdata = 'Y' then
				rpo_dw.setitem(vl_currentrow,'insert_yn','Y')
				rpo_dw.setitem(vl_currentrow,'update_yn','Y')
				rpo_dw.setitem(vl_currentrow,'query_yn','Y')
			end if
		case 'insert_yn'
			if vs_editdata = 'Y' then
				rpo_dw.setitem(vl_currentrow,'update_yn','Y')
				rpo_dw.setitem(vl_currentrow,'query_yn','Y')
			else
				rpo_dw.setitem(vl_currentrow,'delete_yn','N')
			end if			
		case 'update_yn'
			if vs_editdata = 'Y' then
				rpo_dw.setitem(vl_currentrow,'query_yn','Y')
			else
				rpo_dw.setitem(vl_currentrow,'delete_yn','N')
				rpo_dw.setitem(vl_currentrow,'insert_yn','N')
			end if			
		case 'query_yn'
			if vs_editdata = 'N' then
				rpo_dw.setitem(vl_currentrow,'insert_yn','N')
				rpo_dw.setitem(vl_currentrow,'update_yn','N')
				rpo_dw.setitem(vl_currentrow,'delete_yn','N')
			end if			
	end choose
end if
return 0
end event

