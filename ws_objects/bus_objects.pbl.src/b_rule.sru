$PBExportHeader$b_rule.sru
forward
global type b_rule from s_object_instantiate
end type
end forward

global type b_rule from s_object_instantiate
end type

type variables

end variables

forward prototypes
public function double f_get_rule_id (string vs_code, double vdb_company_id, double vdb_branch_id)
public function double f_insert_policy_rule_code (string vs_code)
public function integer f_get_rule_type_ref (string vs_ruletype, ref string rs_ruletype_table_ref, ref string rs_ruletype_column_ref, ref string rs_coltype)
public function boolean f_is_rule_id (string vs_dwo, string vs_col_of_id, string vs_crite_of_col_for_dwo[], string vs_dwcol_for_dwo[], string vs_role_user_id)
public function integer f_get_struture_policy_attr (datastore vds_policy, long vl_row_handle, ref s_str_policy_attr rstr_policy_attr)
public function integer f_get_attribute_rule_dwctrl (string vs_identification_code, datastore vds_policy_rule, ref window rw_display, ref s_str_policy_attr rstr_policy_attr)
public function integer f_get_attribute_security_dwctrl (string vs_identification_code, datastore vds_policy_security, ref window rw_display, ref s_str_policy_attr rstr_policy_attr)
public function integer f_get_security_action_bttn (string vs_identification_code, datastore vds_policy_security, ref window rw_display, ref s_str_actionpane rstr_actionpane, ref boolean rb_independent_data, ref boolean rb_enable)
public function boolean f_is_criteria_ok (string vs_data, string vs_criteria, string vs_coltype)
public function integer f_get_appli_rule_id (ref double rdb_rule_id[], double vdb_user_id, string vs_object, string vs_ruletype, string vs_obj_name)
public function integer f_get_appli_rule_id (ref double rdb_rule_id[], double vdb_user_id, string vs_object, string vs_ruletype)
public function integer f_get_appli_rule_id_all (ref double rdb_rule_id[], string vs_object, string vs_ruletype, string vs_obj_name)
public function integer f_get_appli_rule_id_dwo (ref double rdb_rule_id[], string vs_role_user_id, string vs_object, string vs_ruletype, string vs_obj_name)
public function integer f_get_appli_rule_id_table (ref double rdb_rule_id[], string vs_role_user_id, string vs_object, string vs_ruletype, string vs_obj_name)
public function integer f_get_appli_deligate_rule_id (ref double rdb_rule_id[], double vdb_user_id, string vs_object, string vs_ruletype, string vs_obj_name)
public function boolean f_is_policy_applied (datastore vds_policy, long vl_row, window vw_display)
public function double f_get_role_user_id (double vdb_business_rule)
public function string f_get_type_role_user_id (double vdb_role_user_id)
public function integer f_get_appli_rule_id_union (ref double rdb_rule_id[], double vdb_user_id, string vs_object, string vs_ruletype, string vs_obj_name)
public function integer f_get_appli_rule_id_union (ref double rdb_rule_id[], double vdb_user_id, string vs_object, string vs_ruletype)
public function double f_get_business_rule_id (double vdb_identify_id, window vw_display)
public function integer f_set_policy_dwctrl (s_object_display vod_handle, t_dw vdw_handle)
public function boolean f_is_criteria_ok (t_dw_mpl vdw_constraint, string vs_col_constraint, string vs_criteria)
public function integer f_get_user_id (double vdb_role_id, ref double radb_user_id[])
public function integer f_get_role_user_id (double vdb_business_rule, ref string rsa_string_id[])
public function integer f_get_appli_rule_id_all_ex (ref double rdb_rule_id[], string vs_object, string vs_ruletype, string vs_obj_name, ref t_transaction rt_transaction)
public function integer f_get_appli_rule_id_table_ex (ref double rdb_rule_id[], string vs_role_user_id, string vs_object, string vs_ruletype, string vs_obj_name, ref t_transaction rt_transaction)
public function integer f_get_appli_rule_id_union_ex (ref double rdb_rule_id[], double vdb_user_id, string vs_object, string vs_ruletype, string vs_obj_name, ref t_transaction rt_transaction)
public function integer f_get_appli_rule_id_dwo_ex (ref double rdb_rule_id[], string vs_role_user_id, string vs_object, string vs_ruletype, string vs_obj_name, ref t_transaction rt_transaction)
public function integer f_get_appli_rule_id_union_ex (ref double rdb_rule_id[], double vdb_user_id, string vs_object, string vs_ruletype, ref t_transaction rt_transaction)
public function integer f_get_appli_rule_id_ex (ref double rdb_rule_id[], double vdb_user_id, string vs_object, string vs_ruletype, string vs_obj_name, ref t_transaction rt_transaction)
public function integer f_get_appli_rule_id_ex (ref double rdb_rule_id[], double vdb_user_id, string vs_object, string vs_ruletype, ref t_transaction rt_transaction)
public function integer f_get_appli_deligate_rule_id_ex (ref double rdb_rule_id[], double vdb_user_id, string vs_object, string vs_ruletype, string vs_obj_name, ref t_transaction rt_transaction)
public function double f_get_rule_id_ex (string vs_code, double vdb_company_id, double vdb_branch_id, ref t_transaction rt_transaction)
public function double f_insert_policy_rule_code_ex (string vs_code, ref t_transaction rt_transaction)
public function integer f_set_policy_dwctrl_ex (s_object_display vod_handle, t_dw vdw_handle)
end prototypes

public function double f_get_rule_id (string vs_code, double vdb_company_id, double vdb_branch_id);double		ldb_ID

setnull(ldb_ID)
if isnull(vs_code) then return ldb_ID
if isnull(vdb_company_id) then return ldb_ID
if isnull(vdb_branch_id) then return ldb_ID

select id 
into :ldb_ID 
from business_rule
where code = :vs_code and company_id = :vdb_company_id and nvl(branch_id,0) = :vdb_branch_id
using sqlca;

if sqlca.sqlcode = 0 then
	return ldb_ID
elseif sqlca.sqlcode = 100 then
	return 0
else
	gf_messagebox('m.b_rule.f_get_rule_id.01','Thông báo','b_rule.f_get_rule_id(vs_code,vdb_company_id,vdb_branch_id): Lỗi select dữ liệu từ database: @'+sqlca.sqlerrtext,'exclamation','ok',1)
	return -1
end if
end function

public function double f_insert_policy_rule_code (string vs_code);
t_ds_db	lds_business_rule
long		ll_insertrow
double	ldb_ruleID

lds_business_rule = create t_ds_db
lds_business_rule.dataobject = 'd_business_rule_grid'
lds_business_rule.f_settransobject(sqlca)
ll_insertrow =  lds_business_rule.insertrow( 0)
ldb_ruleID =  this.f_create_id( ) 
lds_business_rule.setitem( ll_insertrow, 'ID',ldb_ruleID)
lds_business_rule.setitem( ll_insertrow, 'code', vs_code )
lds_business_rule.setitem( ll_insertrow, 'company_id', gi_user_comp_id )
lds_business_rule.setitem( ll_insertrow, 'branch_id', gdb_branch )

if lds_business_rule.update(true,false ) = 1 then
	commit using sqlca;
	destroy lds_business_rule
	return ldb_ruleID
else
	gf_messagebox('m.b_rule.f_insert_policy_rule_code.01','Thông báo','Không tạo được mã chính sách:@'+sqlca.sqlerrtext,'exclamation','ok',1)
	rollback using sqlca;
	destroy lds_business_rule
	return -1
end if
end function

public function integer f_get_rule_type_ref (string vs_ruletype, ref string rs_ruletype_table_ref, ref string rs_ruletype_column_ref, ref string rs_coltype);
choose case vs_ruletype
	case 'record'
		rs_ruletype_table_ref = 'RECORD_ACCESS_HDR'
		rs_ruletype_column_ref = 'DWO'
		rs_coltype = 'char()'
	case 'policy'
		rs_ruletype_table_ref = 'POLICY_HDR'
		rs_ruletype_column_ref = 'IDENTIFICATION_ID'
		rs_coltype = 'number()'		
end choose
return 1
end function

public function boolean f_is_rule_id (string vs_dwo, string vs_col_of_id, string vs_crite_of_col_for_dwo[], string vs_dwcol_for_dwo[], string vs_role_user_id);t_ds_db			lds_temp
string				ls_coltype,ls_where,ls_cur_where,ls_cur_sql,ls_modify,ls_rtn,ls_dbname
string				ls_dwcol_for_dwo[],ls_crite_of_col_for_dwo[],ls_role_user_id[],ls_dwcolumns
int					li_idx
long				ll_rtn,ll_find
boolean			lb_check_rule = false
c_string			lc_string
c_dwservice	lc_dw_ser
c_sql				lc_sql

ls_crite_of_col_for_dwo = vs_crite_of_col_for_dwo
ls_dwcol_for_dwo = vs_dwcol_for_dwo
lc_string.f_stringtoarray( vs_role_user_id, ';', ls_role_user_id)

lds_temp = create t_ds_db
lds_temp.dataobject = vs_dwo + '_grid'
lds_temp.settransobject( SQLCA)
lds_temp.f_getcurrentsql( ls_cur_sql, ls_cur_where)
if ls_cur_where <> '' then ls_cur_where += ' and '

for li_idx = 1 to upperbound(ls_crite_of_col_for_dwo)	
	ls_dwcolumns = ls_dwcol_for_dwo[li_idx]
	lc_dw_ser.f_get_build_column( lds_temp, ls_dwcolumns, ls_colType)
	if ls_where <> '' then ls_where += ' and '
	ls_where += lc_string.f_get_expression( ls_crite_of_col_for_dwo[li_idx], ls_coltype, ls_dwcolumns, 'buildwhere') 
next
if ls_where <> '' then
	ls_where =  ls_cur_where + ls_where
	lc_sql.f_addtowhereclause( ls_cur_sql, ls_Where, " AND ")
end if
if ls_cur_where <> ls_Where then
	ls_modify = 'Datawindow.Table.Select= "' + ls_cur_sql +'"'
	ls_rtn =lds_temp.modify(ls_modify )
end if
ll_rtn = lds_temp.retrieve( )
if ll_rtn > 0 then
	ls_coltype = lds_temp.describe( vs_col_of_id+".ColType")
	if ls_coltype <> "!" then
		if left(ls_coltype,5) = 'numbe' or left(ls_coltype,5) = 'decim' then
			for li_idx = upperbound(ls_role_user_id) to 1 step -1
				ll_find = lds_temp.find( vs_col_of_id + ' = ' + ls_role_user_id[li_idx], 1,lds_temp.rowcount( ))
				if ll_find > 0 then
					lb_check_rule = true
					exit
				end if
			next
		else
			gf_messagebox('m.b_rule.f_check_rule_id.01','Lỗi','Cột chứa user id sai','stopsign','ok',1)
		end if
	else
		gf_messagebox('m.b_rule.f_check_rule_id.02','Lỗi','Cột chứa user id không tồn tại','stopsign','ok',1)
	end if
end if

return lb_check_rule
end function

public function integer f_get_struture_policy_attr (datastore vds_policy, long vl_row_handle, ref s_str_policy_attr rstr_policy_attr);string					ls_delete, ls_insert,ls_update,ls_query, ls_print,ls_excel, ls_access

rstr_policy_attr.b_delete= true
rstr_policy_attr.b_insert =true
rstr_policy_attr.b_update =true
rstr_policy_attr.b_query =true
rstr_policy_attr.b_excel =true
rstr_policy_attr.b_print =true
rstr_policy_attr.b_access =true

ls_excel = vds_policy.getitemstring(vl_row_handle, 'excel_yn')
if ls_excel = 'N' or isnull(ls_excel) then
	rstr_policy_attr.b_excel = false
end if
ls_print = vds_policy.getitemstring(vl_row_handle, 'print_yn')
if ls_print = 'N' or isnull(ls_print) then
	rstr_policy_attr.b_print = false
end if		
ls_access = vds_policy.getitemstring(vl_row_handle, 'access_yn')
if ls_access = 'N' or isnull(ls_access) then
	rstr_policy_attr.b_access = false
end if		
ls_query = vds_policy.getitemstring(vl_row_handle, 'query_yn')
if ls_query = 'N' or isnull(ls_query) then
	rstr_policy_attr.b_query = false
	rstr_policy_attr.b_update = false
	rstr_policy_attr.b_insert = false
	rstr_policy_attr.b_delete = false
end if	
ls_update = vds_policy.getitemstring(vl_row_handle, 'update_yn')
if ls_update = 'N' or isnull(ls_update) then
	rstr_policy_attr.b_update = false
	rstr_policy_attr.b_insert = false
	rstr_policy_attr.b_delete = false
end if		
ls_insert = vds_policy.getitemstring(vl_row_handle, 'delete_yn')
if ls_insert = 'N' or isnull(ls_insert) then
	rstr_policy_attr.b_insert = false
	rstr_policy_attr.b_delete = false
end if				
ls_delete = vds_policy.getitemstring(vl_row_handle, 'insert_yn')
if ls_delete = 'N' or isnull(ls_delete) then
	rstr_policy_attr.b_delete = false
end if			
return 1
end function

public function integer f_get_attribute_rule_dwctrl (string vs_identification_code, datastore vds_policy_rule, ref window rw_display, ref s_str_policy_attr rstr_policy_attr);
string					ls_full_inherit, ls_dwobject_constraint , ls_idkey_code
int						li_dotCount	
long					ll_row_found
boolean				lb_policy_applied
double				ldb_rule_id
c_string				lc_string
s_str_policy_attr	lstr_policy_attr

lstr_policy_attr.b_delete= true
lstr_policy_attr.b_insert =true
lstr_policy_attr.b_update =true
lstr_policy_attr.b_query =true
lstr_policy_attr.b_excel =true
lstr_policy_attr.b_access = true
lstr_policy_attr.b_full_inherit =true

if gi_userid = 0 then
	return 0
end if

if vs_identification_code = '' or isnull(vs_identification_code) then return 0

//-- xét rule của datawindow --//
li_dotCount = lc_string.f_countoccurrences(vs_identification_code, '.')
ls_idkey_code = mid(vs_identification_code,1, lc_string.f_pos_ex(vs_identification_code, '.', li_dotCount) -1 )

if left(ls_idkey_code,2) <> 'u_' then return 0

ll_row_found = vds_policy_rule.find( "identification_code ='" + ls_idkey_code + "'", 1, vds_policy_rule.rowcount( ) )
if ll_row_found > 0 then	
	ls_full_inherit = vds_policy_rule.getitemstring(ll_row_found, 'full_inherit_yn')
	if ls_full_inherit = 'Y' then
		return 0
	else //-- trường hợp policy áp dụng riêng từng cột --//
		lstr_policy_attr.b_full_inherit =false
		this.f_get_struture_policy_attr(vds_policy_rule , ll_row_found, lstr_policy_attr) 
		ll_row_found = vds_policy_rule.find( "identification_code ='" + vs_identification_code + "'", 1, vds_policy_rule.rowcount( ) )
		if ll_row_found > 0 then					
			ls_dwobject_constraint = vds_policy_rule.getitemstring(ll_row_found, 'dwobject_constraint')
			if isnull(ls_dwobject_constraint) or trim(ls_dwobject_constraint) = '' then				
				this.f_get_struture_policy_attr(vds_policy_rule , ll_row_found, lstr_policy_attr)
				rstr_policy_attr= lstr_policy_attr
				return 1
			else
				ldb_rule_id = vds_policy_rule.getitemnumber(ll_row_found, 'ID')
				if this.f_is_policy_applied(vds_policy_rule, ldb_rule_id, rw_display) then
					this.f_get_struture_policy_attr(vds_policy_rule , ll_row_found, lstr_policy_attr) 
					rstr_policy_attr= lstr_policy_attr
					return 1
				else
					ll_row_found = vds_policy_rule.find( "identification_code ='" + vs_identification_code + "'", ll_row_found+1, vds_policy_rule.rowcount( )+1 )
					DO WHILE ll_row_found > 0 
						ldb_rule_id = vds_policy_rule.getitemnumber(ll_row_found, 'ID')
						if this.f_is_policy_applied(vds_policy_rule, ldb_rule_id, rw_display) then
							this.f_get_struture_policy_attr(vds_policy_rule , ll_row_found, lstr_policy_attr) 
							rstr_policy_attr= lstr_policy_attr
							return 1
						end if
						ll_row_found = vds_policy_rule.find( "identification_code ='" + vs_identification_code + "'", ll_row_found+1, vds_policy_rule.rowcount( )+1 )
					LOOP
				end if
			end if	
			rstr_policy_attr= lstr_policy_attr
			return 1
		end if
	end if
end if
rstr_policy_attr= lstr_policy_attr
return 1

end function

public function integer f_get_attribute_security_dwctrl (string vs_identification_code, datastore vds_policy_security, ref window rw_display, ref s_str_policy_attr rstr_policy_attr);/************************************************************
chức năng: lấy thuộc tính cài đặt phân quyền phụ thuộc data hiện hành
-----------------------------------------------------------------------------------------------
Tham số:
--------------------------
return:
============================================*/

string					ls_full_inherit, ls_dwobject_constraint , ls_idkey_code, ls_indentification_id
int						li_dotCount, li_ruleCount, li_idx
long					ll_row_found
double				ldba_rule_id[]
c_string				lc_string
s_str_policy_attr	lstr_policy_attr


lstr_policy_attr.b_delete = false
lstr_policy_attr.b_insert = false
lstr_policy_attr.b_update = false
lstr_policy_attr.b_query = false
lstr_policy_attr.b_excel = false
lstr_policy_attr.b_access = false
lstr_policy_attr.b_full_inherit = false

if gi_userid = 0 then
	return 0
end if

if vs_identification_code = '' or isnull(vs_identification_code) then return 0
if  lc_string.f_countoccurrences(vs_identification_code, '.') = 0 and left(vs_identification_code,2) = 'u_' then
	ll_row_found = vds_policy_security.find( "object_ref_code ='" + vs_identification_code + "'", 1, vds_policy_security.rowcount( ) )
else
	ll_row_found = vds_policy_security.find( "identification_code ='" + vs_identification_code + "'", 1, vds_policy_security.rowcount( ) )
end if
if ll_row_found > 0 then	//-- có cài đặt field --//
	//-- kiểm tra user có được phân quyền không --//
	ls_indentification_id = string(vds_policy_security.getitemnumber(ll_row_found, 'identification_id'))
	li_ruleCount = this.f_get_appli_rule_id(ldba_rule_id[] , gi_userid, ls_indentification_id, 'policy')	
	if li_ruleCount = 0 then
		 //-- không cài đặt field -> lấy cài đặt cấp trên --//
		li_dotCount = lc_string.f_countoccurrences(vs_identification_code, '.')
		ls_idkey_code = mid(vs_identification_code,1, lc_string.f_pos(vs_identification_code, '.', li_dotCount) -1 )		
		return this.f_get_attribute_security_dwctrl( ls_idkey_code, vds_policy_security, rw_display, rstr_policy_attr)								
	end if
	//-------------------------------------------------------------------------------------//
	// Nếu ko phụ thuộc dữ liệu thì 1 idkey chỉ cài đặt 1 policy security //
	//-------------------------------------------------------------------------------------//	
	FOR li_idx = 1 to li_ruleCount
		ll_row_found = vds_policy_security.find( "ID =" + string(ldba_rule_id[li_idx]), 1, vds_policy_security.rowcount( ) )
		ls_dwobject_constraint = vds_policy_security.getitemstring(ll_row_found, 'dwobject_constraint')
		if isnull(ls_dwobject_constraint) or trim(ls_dwobject_constraint) = '' then
			this.f_get_struture_policy_attr(vds_policy_security , ll_row_found, lstr_policy_attr)
			rstr_policy_attr = lstr_policy_attr
			return 1				
		else
			if this.f_is_policy_applied(vds_policy_security, ldba_rule_id[li_idx],rw_display) then
				this.f_get_struture_policy_attr(vds_policy_security , ll_row_found, lstr_policy_attr)
				rstr_policy_attr = lstr_policy_attr
				return 1		
			end if
			if li_idx = li_ruleCount then
				 //-- không cài đặt field -> lấy cài đặt cấp trên --//
				li_dotCount = lc_string.f_countoccurrences(vs_identification_code, '.')
				ls_idkey_code = mid(vs_identification_code,1, lc_string.f_pos(vs_identification_code, '.', li_dotCount) -1 )		
				return this.f_get_attribute_security_dwctrl( ls_idkey_code, vds_policy_security, rw_display, rstr_policy_attr)									
			end if
		end if																							
	NEXT
else //-- không cài đặt field -> lấy cài đặt cấp dwo --//
	li_dotCount = lc_string.f_countoccurrences(vs_identification_code, '.')
	ls_idkey_code = mid(vs_identification_code,1, lc_string.f_pos(vs_identification_code, '.', li_dotCount) -1 )		
	return this.f_get_attribute_security_dwctrl( ls_idkey_code, vds_policy_security, rw_display, rstr_policy_attr)								
end if

end function

public function integer f_get_security_action_bttn (string vs_identification_code, datastore vds_policy_security, ref window rw_display, ref s_str_actionpane rstr_actionpane, ref boolean rb_independent_data, ref boolean rb_enable);/************************************************************
chức năng: lấy thuộc tính cài đặt phân quyền phụ thuộc data hiện hành
-----------------------------------------------------------------------------------------------
Tham số:
--------------------------
return:
============================================*/

string					ls_full_inherit, ls_dwobject_constraint , ls_idkey_code, ls_indentification_id
int						li_dotCount, li_ruleCount, li_idx
long					ll_row_found
double				ldba_rule_id[]
c_string				lc_string

if gi_userid = 0 then
	rstr_actionpane.b_full_inherit = true
	rstr_actionpane.b_access = true
	rstr_actionpane.b_independent_data = true
	rb_enable = true
	rb_independent_data = true
	return 0
end if
if vs_identification_code = '' or isnull(vs_identification_code) then return 0

if  lc_string.f_countoccurrences(vs_identification_code, '.') = 0 and left(vs_identification_code,2) = 'u_' then
	ll_row_found = vds_policy_security.find( "object_ref_code ='" + vs_identification_code + "'", 1, vds_policy_security.rowcount( ) )
	if ll_row_found = 0 then
		rstr_actionpane.b_full_inherit = true
		rstr_actionpane.b_access = false
		rstr_actionpane.b_independent_data = true
		rb_enable = false
		rb_independent_data = true		
		return 0
	end if
else
	ll_row_found = vds_policy_security.find( "identification_code ='" + vs_identification_code + "'", 1, vds_policy_security.rowcount( ) )
end if

if ll_row_found > 0 then	//-- có cài đặt field --//
	//-- kiểm tra user có được phân quyền không --//
	ls_indentification_id = string(vds_policy_security.getitemnumber(ll_row_found, 'identification_id'))
	li_ruleCount = this.f_get_appli_rule_id(ldba_rule_id[] , gi_userid, ls_indentification_id, 'policy')	
	if li_ruleCount = 0 then
		 //-- không cài đặt field -> lấy cài đặt cấp trên --//
		li_dotCount = lc_string.f_countoccurrences(vs_identification_code, '.')
		ls_idkey_code = mid(vs_identification_code,1, lc_string.f_pos(vs_identification_code, '.', li_dotCount) -1 )		
		return this.f_get_security_action_bttn( ls_idkey_code, vds_policy_security, rw_display, rstr_actionpane, rb_independent_data, rb_enable )								
	end if
	//-------------------------------------------------------------------------------------//
	// Nếu ko phụ thuộc dữ liệu thì 1 idkey chỉ cài đặt 1 policy security //
	//-------------------------------------------------------------------------------------//	
	FOR li_idx = 1 to li_ruleCount
		ll_row_found = vds_policy_security.find( "ID =" + string(ldba_rule_id[li_idx]), 1, vds_policy_security.rowcount( ) )
		ls_dwobject_constraint = vds_policy_security.getitemstring(ll_row_found, 'dwobject_constraint')
		if isnull(ls_dwobject_constraint) or trim(ls_dwobject_constraint) = '' then
			rb_independent_data = true
			if vds_policy_security.getitemstring(ll_row_found, 'access_yn') = 'Y' then
				rb_enable = true				
				if li_dotCount < 2 then
					if vds_policy_security.getitemstring(ll_row_found, 'full_inherit_yn') = 'Y' then
						rstr_actionpane.b_full_inherit = true
						rstr_actionpane.b_access = true				
						rstr_actionpane.b_independent_data = true
					end if
				end if
			else
				rb_enable = false
				if li_dotCount < 2 then
					if vds_policy_security.getitemstring(ll_row_found, 'full_inherit_yn') = 'Y' then
						rstr_actionpane.b_full_inherit = true
						rstr_actionpane.b_access = false				
						rstr_actionpane.b_independent_data = true
					end if
				end if								
			end if
			return 1				
		else
			if this.f_is_policy_applied(vds_policy_security, ldba_rule_id[li_idx],rw_display) then
				rb_independent_data = false
				if vds_policy_security.getitemstring(ll_row_found, 'access_yn') = 'Y' then
					rb_enable = true				
					if li_dotCount < 2 then
						if vds_policy_security.getitemstring(ll_row_found, 'full_inherit_yn') = 'Y' then
							rstr_actionpane.b_full_inherit = true
							rstr_actionpane.b_access = true			
							rstr_actionpane.b_independent_data = false
						end if
					end if
				else
					rb_enable = false
					if li_dotCount < 2 then
						if vds_policy_security.getitemstring(ll_row_found, 'full_inherit_yn') = 'Y' then
							rstr_actionpane.b_full_inherit = true
							rstr_actionpane.b_access = false			
							rstr_actionpane.b_independent_data = false
						end if
					end if					
				end if				
				return 1		
			end if
			if li_idx = li_ruleCount then
				 //-- không cài đặt field -> lấy cài đặt cấp trên --//
				li_dotCount = lc_string.f_countoccurrences(vs_identification_code, '.')
				ls_idkey_code = mid(vs_identification_code,1, lc_string.f_pos(vs_identification_code, '.', li_dotCount) -1 )		
				return this.f_get_security_action_bttn( ls_idkey_code, vds_policy_security, rw_display, rstr_actionpane, rb_independent_data, rb_enable )										
			end if
		end if																							
	NEXT
else //-- không cài đặt field -> lấy cài đặt cấp dwo --//
	li_dotCount = lc_string.f_countoccurrences(vs_identification_code, '.')
	ls_idkey_code = mid(vs_identification_code,1, lc_string.f_pos(vs_identification_code, '.', li_dotCount) -1 )		
	return this.f_get_security_action_bttn( ls_idkey_code, vds_policy_security, rw_display, rstr_actionpane, rb_independent_data, rb_enable )									
end if

end function

public function boolean f_is_criteria_ok (string vs_data, string vs_criteria, string vs_coltype);c_string		lc_string
t_ds			lds_check
c_sql			lc_sql
string			ls_where, ls_currentSQL, ls_currentWhere, ls_rtn

if left(vs_coltype,5) = 'char(' then
	if vs_data = '' then vs_data = ' '
	vs_data = "~~'"+vs_data+"~~'"
elseif left(vs_coltype,5) = 'date(' or  left(vs_coltype,5) = 'datet' then
	if vs_data = '()' then 
		vs_data = string(date('01/01/1900'),gs_w_date_format)
	else
		vs_data = string(date(vs_data),gs_w_date_format)
	end if
	vs_data = "to_date('" + vs_data + "','"+ gs_w_date_format + "')"
elseif left(vs_coltype,5) = 'numbe' then
	if vs_data = '()' then vs_data = '0'
end if
ls_where = lc_string.f_get_expression(vs_criteria, vs_coltype, vs_data, 'build where')

lds_check = create t_ds
lds_check.dataobject = 'ds_replace_syntax'
if lds_check.f_getcurrentSQL( ls_currentSQL, ls_currentWhere) =1 then
	if ls_where <> "" then
		if ls_currentWhere <> '' then ls_currentWhere += ' AND '
		ls_currentWhere += ls_where
		lc_sql.f_addtowhereclause( ls_currentSQL, ls_currentWhere, " AND ")
		ls_rtn =lds_check.modify( 'Datawindow.Table.Select= "' + ls_currentSQL +'"' )		
	end if
end if
lds_check.settransobject( sqlca)
if lds_check.retrieve( ) = 1 then
	return true
end if
return false
end function

public function integer f_get_appli_rule_id (ref double rdb_rule_id[], double vdb_user_id, string vs_object, string vs_ruletype, string vs_obj_name);/***************************
Tìm rule_id của user khi biết dwo
return 	1: table
			2: dwo
			3: all
			0: không bị phân quyền record
***************************/

double				ldb_role_id[],ldb_rule_id[]
int						li_idx
string					ls_ruletype_table_ref,ls_ruletype_column_ref,ls_role_user_id
c_user_instance		lc_user

if vs_object = '' or isnull(vs_object) then return 0
if vdb_user_id <> gi_userid then
	lc_user.f_init( vdb_user_id)
	ldb_role_id = lc_user.idb_role_id
else
	ldb_role_id = g_user.idb_role_id
end if
for li_idx=1 to upperbound(ldb_role_id)
	ls_role_user_id += string(ldb_role_id[li_idx])+';'
next
ls_role_user_id = ';' + ls_role_user_id+ string(vdb_user_id)+';'
this.f_get_appli_rule_id_table( ldb_rule_id, ls_role_user_id, vs_object, vs_ruletype,vs_obj_name)
if upperbound(ldb_rule_id) = 0 then
	this.f_get_appli_rule_id_dwo( ldb_rule_id, ls_role_user_id, vs_object, vs_ruletype,vs_obj_name)
	if upperbound(ldb_rule_id) = 0 then
		this.f_get_appli_rule_id_all(ldb_rule_id ,vs_object, vs_ruletype,vs_obj_name)
		if upperbound(ldb_rule_id) = 0 then
			return 0
		else
			rdb_rule_id = ldb_rule_id
			return upperbound(rdb_rule_id)
		end if
	else
		rdb_rule_id = ldb_rule_id
		return upperbound(rdb_rule_id)
	end if
else
	rdb_rule_id = ldb_rule_id
	return upperbound(rdb_rule_id)
end if

end function

public function integer f_get_appli_rule_id (ref double rdb_rule_id[], double vdb_user_id, string vs_object, string vs_ruletype);return this.f_get_appli_rule_id( rdb_rule_id[], vdb_user_id, vs_object, vs_ruletype, '')
end function

public function integer f_get_appli_rule_id_all (ref double rdb_rule_id[], string vs_object, string vs_ruletype, string vs_obj_name);datastore		lds_appli_all
c_string			lc_string
string				ls_sql,ls_rtn,ls_modify
string				ls_ruletype_table_ref,ls_ruletype_column_ref,ls_coltype,ls_where_vs_object
long 				ll_rtn
int					li_idx

if vs_object <> "" and not isnull(vs_object) then
	this.f_get_rule_type_ref( vs_ruletype, ls_ruletype_table_ref, ls_ruletype_column_ref, ls_coltype)
	if left(ls_coltype,5) = 'char(' then
		vs_object = '='+vs_object
	end if		
	ls_where_vs_object = lc_string.f_get_expression(vs_object, ls_coltype, ls_ruletype_table_ref +"."+ ls_ruletype_column_ref, 'build where')
	if lower(vs_ruletype)  = 'record' then
		ls_sql = " select BUSINESS_RULE.ID as ID, '' as criteria_col ,'' as criteria_val,'' as ref_table,'' as col_of_id"+&
					" from BUSINESS_RULE join APPLICABLE_RULE_HDR on BUSINESS_RULE.ID =  APPLICABLE_RULE_HDR.OBJECT_REF_ID"+&
													" join "+ ls_ruletype_table_ref +" on "+ ls_ruletype_table_ref +".ID = BUSINESS_RULE.OBJECT_REF_ID"+&
					" where APPLICABLE_RULE_HDR.APPLICABLE_TYPE = 'all'"+&
						" and "+ ls_where_vs_object + " and "+ls_ruletype_table_ref+".OBJECT = "+"'"+vs_obj_name+"'"
	elseif lower(vs_ruletype)  = 'policy' then
		ls_sql = " select POLICY_HDR.OBJECT_REF_ID as ID, '' as criteria_col ,'' as criteria_val,'' as ref_table,'' as col_of_id"+&
					" from POLICY_HDR join BUSINESS_RULE on POLICY_HDR.OBJECT_REF_ID = BUSINESS_RULE.ID"+&
											" join APPLICABLE_RULE_HDR on BUSINESS_RULE.OBJECT_REF_ID =  APPLICABLE_RULE_HDR.ID"+&											
					" where APPLICABLE_RULE_HDR.APPLICABLE_TYPE = 'all'"+&
						" and "+ ls_where_vs_object
	end if
else
	return -1
end if

if ls_sql <> '' then
	lds_appli_all = create datastore
	lds_appli_all.dataobject = 'ds_replace_syntax'
	ls_modify = 'Datawindow.Table.Select= "' + ls_sql +'"'
	ls_rtn =lds_appli_all.modify(ls_modify )
	lds_appli_all.settransobject( SQLCA)
	ll_rtn = lds_appli_all.retrieve( )
	if ll_rtn >0 then
		rdb_rule_id[] = lds_appli_all.object.ID.primary
	else
		//----//
	end if
	destroy lds_appli_all
	return ll_rtn
else
	return -1
end if
end function

public function integer f_get_appli_rule_id_dwo (ref double rdb_rule_id[], string vs_role_user_id, string vs_object, string vs_ruletype, string vs_obj_name);datastore		lds_appli_dwo
c_string			lc_string
string				ls_sql,ls_dwo,ls_col_of_id,ls_filter,ls_id,ls_ref_table,ls_modify,ls_rtn
string				ls_crite_of_col_for_dwo[],ls_dwcol_for_dwo[]
string				ls_ruletype_table_ref,ls_ruletype_column_ref,ls_coltype,ls_where_vs_object
long 				ll_rtn
int					li_idx,li_idx2


if vs_object <> '' and not isnull(vs_object) then 
	this.f_get_rule_type_ref( vs_ruletype, ls_ruletype_table_ref, ls_ruletype_column_ref, ls_coltype)
	if left(ls_coltype,5) = 'char(' then
		vs_object = '='+vs_object
	end if	
	ls_where_vs_object = lc_string.f_get_expression( vs_object, ls_coltype, ls_ruletype_table_ref +"."+ ls_ruletype_column_ref, 'build where')
	if lower(vs_ruletype) = 'record' then
		ls_sql = "select BUSINESS_RULE.ID as ID,APPLICABLE_RULE_LINE.APPLICABLE_CRITERIA_COL as criteria_col,APPLICABLE_RULE_LINE.APPLICABLE_CRITERIA_VAL as criteria_val,"+&
					" APPLICABLE_RULE_HDR.APPLICABLE_REF_TABLE as ref_table,APPLICABLE_RULE_HDR.APPLICABLE_REF_ID_STRING as col_of_id"+&
					" from BUSINESS_RULE join "+ ls_ruletype_table_ref +" on "+ ls_ruletype_table_ref +".ID = BUSINESS_RULE.OBJECT_REF_ID"+&
													" join APPLICABLE_RULE_HDR on BUSINESS_RULE.ID = APPLICABLE_RULE_HDR.OBJECT_REF_ID"+&
													" join APPLICABLE_RULE_LINE on APPLICABLE_RULE_HDR.ID = APPLICABLE_RULE_LINE.OBJECT_REF_ID"+&
					" where "+ ls_where_vs_object+&
					"and APPLICABLE_RULE_HDR.APPLICABLE_TYPE = 'dwo'" + " and "+ls_ruletype_table_ref+".OBJECT = "+"'"+vs_obj_name+"'"
	elseif lower(vs_ruletype) = 'policy' then
		ls_sql = " select POLICY_HDR.OBJECT_REF_ID as ID, '' as criteria_col ,'' as criteria_val,'' as ref_table,'' as col_of_id"+&
					" from POLICY_HDR join BUSINESS_RULE on POLICY_HDR.OBJECT_REF_ID = BUSINESS_RULE.ID"+&
											" join APPLICABLE_RULE_HDR on BUSINESS_RULE.OBJECT_REF_ID =  APPLICABLE_RULE_HDR.ID"+&		
											" join APPLICABLE_RULE_LINE on APPLICABLE_RULE_HDR.ID = APPLICABLE_RULE_LINE.OBJECT_REF_ID"+&
					" where "+ ls_where_vs_object+&
					"and APPLICABLE_RULE_HDR.APPLICABLE_TYPE = 'dwo'"
	end if		
else
	return -1
end if

if ls_sql <> '' then
	lds_appli_dwo = create datastore
	lds_appli_dwo.dataobject = 'ds_replace_syntax'
	ls_modify = 'Datawindow.Table.Select= "' + ls_sql +'"'
	ls_rtn =lds_appli_dwo.modify(ls_modify )
	lds_appli_dwo.settransobject( SQLCA)
	ll_rtn = lds_appli_dwo.retrieve( )
	if ll_rtn >0 then
		for li_idx = 1 to ll_rtn
			if pos(ls_id,string(lds_appli_dwo.getitemnumber( li_idx, 'id'))+';') = 0 or pos(ls_ref_table,lds_appli_dwo.getitemstring( li_idx, 'ref_table')+';') = 0 then
				ls_id += string(lds_appli_dwo.getitemnumber( li_idx, 'id'))+';'
				ls_ref_table += lds_appli_dwo.getitemstring( li_idx, 'ref_table')+';'
				ls_filter = "id = "+ string(lds_appli_dwo.getitemnumber( li_idx, 'ID')) + ' and ref_table = ' + lds_appli_dwo.getitemstring( li_idx, 'ref_table')
				lds_appli_dwo.setfilter( ls_filter)
				lds_appli_dwo.filter( )
				if lds_appli_dwo.rowcount( ) > 0 then
					ls_col_of_id = lds_appli_dwo.getitemstring( 1, 'col_of_id')
					ls_dwo = lds_appli_dwo.getitemstring( 1, 'ref_table')
					for li_idx2 = 1 to lds_appli_dwo.rowcount( )
						ls_crite_of_col_for_dwo[li_idx2] = lds_appli_dwo.getitemstring( li_idx2, 'criteria_val')
						ls_dwcol_for_dwo[li_idx2] = lds_appli_dwo.getitemstring( li_idx2, 'criteria_col')
					next
					if f_is_rule_id( ls_dwo, ls_col_of_id, ls_crite_of_col_for_dwo, ls_dwcol_for_dwo,vs_role_user_id) then
						rdb_rule_id[upperbound(rdb_rule_id) + 1] = lds_appli_dwo.getitemnumber( li_idx, 'ID')
					end if
				end if
			end if
		next
	end if
	destroy lds_appli_dwo
	return ll_rtn
else
	return -1
end if
end function

public function integer f_get_appli_rule_id_table (ref double rdb_rule_id[], string vs_role_user_id, string vs_object, string vs_ruletype, string vs_obj_name);/*************************************
	Lấy rule_id được áp dụng cho user và role
	khi có loại áp dụng là table(cụ thể)
**************************************/
datastore		lds_appli_table
c_string 			lc_string
string				ls_sql,ls_REGEXP,ls_modify,ls_rtn,ls_where_vs_object
string				ls_ruletype_table_ref,ls_ruletype_column_ref,ls_coltype
long 				ll_rtn
int					li_idx

if vs_object <> '' and not isnull(vs_object) then
	this.f_get_rule_type_ref( vs_ruletype, ls_ruletype_table_ref, ls_ruletype_column_ref, ls_coltype)

	ls_REGEXP = lc_string.f_get_expression( vs_role_user_id, 'char()', 'APPLICABLE_RULE_HDR.APPLICABLE_REF_ID_STRING', 'build where')
	if left(ls_coltype,5) = 'char(' then
		vs_object = '='+vs_object
	end if
	ls_where_vs_object = lc_string.f_get_expression( vs_object, ls_coltype, ls_ruletype_table_ref +"."+ ls_ruletype_column_ref, 'build where')
	if lower(vs_ruletype) = 'record' then
		ls_sql = "select BUSINESS_RULE.ID as ID, '' as criteria_col ,'' as criteria_val,'' as ref_table,'' as col_of_id"+&
					" from BUSINESS_RULE join "+ ls_ruletype_table_ref +" on "+ ls_ruletype_table_ref +".ID = BUSINESS_RULE.OBJECT_REF_ID"+&
													" join APPLICABLE_RULE_HDR on BUSINESS_RULE.ID = APPLICABLE_RULE_HDR.OBJECT_REF_ID"+&
					" where "+ ls_where_vs_object +&
						" and APPLICABLE_RULE_HDR.APPLICABLE_TYPE = 'table'"+&
						" and "+ ls_REGEXP + " and "+ls_ruletype_table_ref+".OBJECT = "+"'"+vs_obj_name+"'"
	elseif lower(vs_ruletype) = 'policy' then
		ls_sql = " select POLICY_HDR.OBJECT_REF_ID as ID, '' as criteria_col ,'' as criteria_val,'' as ref_table,'' as col_of_id"+&
					" from POLICY_HDR join BUSINESS_RULE on POLICY_HDR.OBJECT_REF_ID = BUSINESS_RULE.ID"+&
											" join APPLICABLE_RULE_HDR on BUSINESS_RULE.OBJECT_REF_ID =  APPLICABLE_RULE_HDR.ID"+&											
					" where "+ ls_where_vs_object +&
						" and APPLICABLE_RULE_HDR.APPLICABLE_TYPE = 'table'"+&
						" and "+ ls_REGEXP
	end if
else
	return -1
end if

if ls_sql <> '' then
	lds_appli_table = create datastore
	lds_appli_table.dataobject = 'ds_replace_syntax'
	ls_modify = 'Datawindow.Table.Select= "' + ls_sql +'"'
	ls_rtn =lds_appli_table.modify(ls_modify )
	lds_appli_table.settransobject( SQLCA)
	ll_rtn = lds_appli_table.retrieve( )
	if ll_rtn >0 then
		rdb_rule_id[] = lds_appli_table.object.ID.primary
	end if
	destroy lds_appli_table
	return ll_rtn
else
	return -1
end if
end function

public function integer f_get_appli_deligate_rule_id (ref double rdb_rule_id[], double vdb_user_id, string vs_object, string vs_ruletype, string vs_obj_name);datastore		lds_appli_deligate
string				ls_sql,ls_modify,ls_rtn,ls_where_vs_object
long 				ll_rtn
double			ldb_rule_id[]
int					li_idx
string				ls_ruletype_table_ref,ls_ruletype_column_ref, ls_coltype
c_string			lc_string

if vs_object <> '' and not isnull(vs_object) then
	this.f_get_rule_type_ref( vs_ruletype, ls_ruletype_table_ref, ls_ruletype_column_ref, ls_coltype)
	if left(ls_coltype,5) = 'char(' then
		vs_object = '='+vs_object
	end if	
	ls_where_vs_object = lc_string.f_get_expression( vs_object, ls_coltype, ls_ruletype_table_ref +"."+ ls_ruletype_column_ref, 'build where')
	
	if lower(vs_ruletype) = 'record' then
		ls_sql = "select BUSINESS_RULE.ID as id,'' as criteria_col,'' as criteria_val,'' as ref_table,'' as col_of_id "+&
					" from APPLICABLE_RULE_HDR left join BUSINESS_RULE on BUSINESS_RULE.ID = APPLICABLE_RULE_HDR.OBJECT_REF_ID"+&
																" join "+ls_ruletype_table_ref+" on "+ls_ruletype_table_ref+".ID = BUSINESS_RULE.OBJECT_REF_ID"+&
					" where   "+ ls_where_vs_object+&
					" and sysdate between APPLICABLE_RULE_HDR.DELIGATE_SDATE and nvl(APPLICABLE_RULE_HDR.DELIGATE_EDATE,to_date('30/12/3000','dd/mm/yyyy'))"+&
					" and REGEXP_LIKE(APPLICABLE_RULE_HDR.DELIGATE_ID_STRING,';"+string(vdb_user_id)+";"+"')"	+ " and "+ls_ruletype_table_ref+".OBJECT = "+"'"+vs_obj_name+"'"
					
	elseif lower(vs_ruletype) = 'policy' then
		ls_sql = "select BUSINESS_RULE.ID as id,'' as criteria_col,'' as criteria_val,'' as ref_table,'' as col_of_id "+&
				" from APPLICABLE_RULE_HDR left join BUSINESS_RULE on BUSINESS_RULE.OBJECT_REF_ID = APPLICABLE_RULE_HDR.ID"+&
															" join "+ls_ruletype_table_ref+" on "+ls_ruletype_table_ref+".OBJECT_REF_ID = BUSINESS_RULE.ID"+&
				" where   "+ ls_where_vs_object+&
				" and sysdate between APPLICABLE_RULE_HDR.DELIGATE_SDATE and nvl(APPLICABLE_RULE_HDR.DELIGATE_EDATE,to_date('31/12/3000','dd/mm/yyyy'))"+&
				" and REGEXP_LIKE(APPLICABLE_RULE_HDR.DELIGATE_ID_STRING,';"+string(vdb_user_id)+";"+"')"
	end if
else
	return -1
end if

if ls_sql <> '' then
	lds_appli_deligate = create datastore
	lds_appli_deligate.dataobject = 'ds_replace_syntax'
	ls_modify = 'Datawindow.Table.Select= "' + ls_sql +'"'
	ls_rtn =lds_appli_deligate.modify(ls_modify )
	lds_appli_deligate.settransobject( SQLCA)
	ll_rtn = lds_appli_deligate.retrieve( )
	if ll_rtn > 0 then
		for li_idx=1 to ll_rtn
			ldb_rule_id[upperbound(ldb_rule_id)+1] = lds_appli_deligate.getitemnumber( li_idx, 'ID')
		next
	end if
	rdb_rule_id = ldb_rule_id
	return ll_rtn
else
	return -1
end if
end function

public function boolean f_is_policy_applied (datastore vds_policy, long vl_row, window vw_display);boolean		lb_rtn, lb_querymode
long			ll_row_found
string			ls_const_type, ls_dwobject_constraint,ls_dwcolumn_constraint, ls_criteria_data, ls_coltype, ls_findStr
string			ls_dwobject_criteria, ls_dwcolumn_criteria, ls_objname,ls_parm, ls_operand, ls_keycode
any			la_data, la_data_criteria, la_call_value
double		ldb_business_rule_id, ldb_policy_id

t_dw_mpl			ldw_handle
s_object_display	lpo_handle


if vds_policy.rowcount() = 0 then
	gf_messagebox('m.b_rule.f_is_policy_applied.01','Thông báo','b_rule.f_is_policy_applied: không có dữ liệu:@'+vds_policy.dataobject,'exclamation','ok',1)
	setnull(lb_rtn)
	return lb_rtn
end if

lb_rtn = true

ls_keycode = vds_policy.getitemstring(vl_row, 'identification_code')
ldb_business_rule_id = vds_policy.getitemnumber(vl_row, 'object_ref_id')
ldb_policy_id = vds_policy.getitemnumber(vl_row, 'id')
ll_row_found = vl_row
//vds_policy.setfilter('object_ref_id = ' + string(ldb_business_rule_id))
//vds_policy.filter()
//ll_row_found = vds_policy.find('object_ref_id = ' + string(ldb_business_rule_id),1,vds_policy.rowcount())
DO WHILE ll_row_found > 0
	ls_const_type =  vds_policy.getitemstring(ll_row_found, 'criteria_type')
	ls_dwobject_constraint = vds_policy.getitemstring(ll_row_found, 'dwobject_constraint')
	if not isnull(ls_dwobject_constraint) then
		ls_dwobject_constraint += '_grid'
		ldw_handle = vw_display.dynamic f_get_dw(ls_dwobject_constraint)
		if isvalid(ldw_handle) then
			//-- Kiểm tra query mode --//
			lb_querymode = ldw_handle.inv_QueryMode.f_GetEnabled()
			if lb_querymode then return true
			
			ls_dwcolumn_constraint =  vds_policy.getitemstring(ll_row_found, 'dwcolumn_constraint')
			if ls_dwcolumn_constraint = '' or isnull(ls_dwcolumn_constraint) then
				gf_messagebox('m.b_rule.f_is_policy_applied.02','Thông báo','Chưa chọn cột ràng buộc dữ liệu trong cài đặt phân quyền hoặc chính sách của DW:@'+ls_dwcolumn_constraint, 'stop','ok',1)
				setnull(lb_rtn)
				return lb_rtn										
			end if
			ls_criteria_data =  vds_policy.getitemstring(ll_row_found, 'criteria_constraint')			
			if ldw_handle.getrow( ) > 0 then			
				ls_coltype = ldw_handle.describe(ls_dwcolumn_constraint+ '.coltype')
				if ls_coltype ='!' or ls_coltype = '?' then
					gf_messagebox('m.b_rule.f_is_policy_applied.03','Thông báo','Cột ràng buộc dữ liệu của trong cài đặt phân quyền hoặc chính sách không có trong DW:@'+ls_dwcolumn_constraint, 'stop','ok',1)
					setnull(lb_rtn)
					return lb_rtn															
				end if
				la_data = ldw_handle.f_getitemany(ldw_handle.getrow( ), ls_dwcolumn_constraint)
				if pos(ls_coltype,'char') > 0 and isnull(la_data) then la_data = '()'
				if pos(ls_coltype,'numbe') > 0 and isnull(la_data) then la_data = 0
				if ls_const_type = 'fixed' or isnull(ls_const_type) then		
					//--kết quả áp dụng là giao (AND) của các điều kiện ràng buộc trên cùng 1 rule cài đặt --//
					if vds_policy.getitemstring(vl_row, 'object_ref_code') = 'd_action_edit.b_approve' and ldw_handle.f_get_ib_detail() and not ldw_handle.f_get_ib_relation_1_1( ) then
						lb_rtn = lb_rtn AND this.f_is_criteria_ok( ldw_handle,ls_dwcolumn_constraint, ls_criteria_data)
					else
						lb_rtn = lb_rtn AND this.f_is_criteria_ok(string(la_data), ls_criteria_data,ls_coltype) 
					end if
				elseif ls_const_type = 'vardwo' then
					ls_dwobject_criteria = vds_policy.getitemstring(ll_row_found, 'dwobject_criteria')
					ldw_handle = vw_display.dynamic f_get_dw(ls_dwobject_criteria)
					if isvalid(ldw_handle) then
						if ldw_handle.getrow( ) > 0 then
							ls_dwcolumn_criteria = vds_policy.getitemstring(ll_row_found, 'dwcolumn_criteria')
							la_data_criteria = ldw_handle.f_getitemany(ldw_handle.getrow( ), ls_dwcolumn_criteria)	
							if  isnull(la_data_criteria) then la_data_criteria = '()'
							lb_rtn = lb_rtn and  this.f_is_criteria_ok(string(la_data), ls_criteria_data,ls_coltype) 
						else
							gf_messagebox('m.b_rule.f_is_policy_applied.04','Thông báo','DW dữ liệu điều kiện trong cài đặt phân quyền hoặc chính sách không có dữ liệu:@'+ls_dwobject_criteria, 'exclamation','ok',1)
							return true							
						end if
					else
						gf_messagebox('m.b_rule.f_is_policy_applied.05','Thông báo','DW dữ liệu điều kiện trong cài đặt phân quyền hoặc chính sách không có trên window:@'+ls_dwobject_criteria, 'stop','ok',1)
						setnull(lb_rtn)
						return lb_rtn						
					end if
				elseif ls_const_type = 'varobj' then
					ls_objname  = vds_policy.getitemstring(ll_row_found, 'dwobject_criteria')
					ls_operand = vds_policy.getitemstring(ll_row_found, 'dwcolumn_criteria')
					ls_coltype = ldw_handle.describe(ls_criteria_data+ '.coltype')
					lpo_handle = create using ls_objname
	
	//				la_call_value = lpo_handle.f_call(la_data, ls_criteria_data)
					la_data_criteria =  ldw_handle.f_getitemany(ldw_handle.getrow( ), ls_criteria_data)
					choose case ls_operand
						case '='
							lb_rtn = lb_rtn and la_call_value = la_data_criteria
						case '>'
							lb_rtn = lb_rtn and la_call_value > la_data_criteria					
						case '<'
							lb_rtn = lb_rtn and la_call_value < la_data_criteria	
						case '>='
							lb_rtn = lb_rtn and la_call_value >= la_data_criteria
						case '<='
							lb_rtn = lb_rtn and la_call_value <= la_data_criteria					
					end choose
				end if
			else
				return true
			end if
		else
			gf_messagebox('m.b_rule.f_is_policy_applied.07','Thông báo','DW ràng buộc dữ liệu trong cài đặt phân quyền hoặc chính sách không có trên window:@'+ls_dwobject_constraint, 'stop','ok',1)
			setnull(lb_rtn)
			return lb_rtn
		end if
	end if
	// Tìm các điều kiện ràng buộc khác của cùng 1 rule cài đặt nếu có : kết quả áp dụng là giao (AND) của các điều kiện--//
	ls_findStr = "identification_code = '"+ls_keycode+"' AND object_ref_id ="+string(ldb_business_rule_id) + " AND id ="+string(ldb_policy_id)
	ll_row_found = vds_policy.find(ls_findStr,ll_row_found+1, vds_policy.rowcount()+1 )
LOOP
//vds_policy.setfilter('')
//vds_policy.filter()
return lb_rtn
end function

public function double f_get_role_user_id (double vdb_business_rule);string 				ls_sql,ls_modify,ls_rtn
long					ll_rtn
double				ldb_role_user_id
c_string				lc_string
datastore			lds_applicable_rule

lds_applicable_rule = create datastore
lds_applicable_rule.dataobject = 'ds_replace_syntax'

ls_sql = "select 0 as ID, '' as criteria_col ,applicable_rule_hdr.APPLICABLE_REF_ID_STRING as criteria_val,'' as ref_table,'' as col_of_id"+&
			" from applicable_rule_hdr"+&
			" join business_rule on business_rule.object_ref_id = applicable_rule_hdr.id"+&
			" where business_rule.id = "+string(vdb_business_rule) +&
			" AND applicable_rule_hdr.applicable_type = 'table'" 
			
ls_modify = 'Datawindow.Table.Select= "' + ls_sql +'"'
ls_rtn =lds_applicable_rule.modify(ls_modify )
lds_applicable_rule.settransobject( SQLCA)
ll_rtn = lds_applicable_rule.retrieve( )
if ll_rtn > 0 then
	ldb_role_user_id = double(lc_string.f_globalreplace( lds_applicable_rule.getitemstring(1,'criteria_val') , ';', ''))
	return ldb_role_user_id
elseif ll_rtn = -1 then
	messagebox('Lỗi','b_rule.f_get_role_user_id(line:23)')
	return -1
else
	ls_sql = "select 0 as ID, '' as criteria_col ,applicable_rule_hdr.APPLICABLE_REF_ID_STRING as criteria_val,'' as ref_table,'' as col_of_id"+&
			" from applicable_rule_hdr"+&
			" join business_rule on business_rule.id = applicable_rule_hdr.object_ref_id"+&
			" where business_rule.id = "+string(vdb_business_rule) +&
			" AND applicable_rule_hdr.applicable_type = 'table'" 
			ls_modify = 'Datawindow.Table.Select= "' + ls_sql +'"'
			ls_rtn =lds_applicable_rule.modify(ls_modify )
			lds_applicable_rule.settransobject( SQLCA)
			ll_rtn = lds_applicable_rule.retrieve( )
			if ll_rtn > 0 then
				ldb_role_user_id = double(lc_string.f_globalreplace( lds_applicable_rule.getitemstring(1,'criteria_val') , ';', ''))
				return ldb_role_user_id
			elseif ll_rtn = -1 then
				messagebox('Lỗi','b_rule.f_get_role_user_id(line:40)')
				return -1
			else
				return 0
			end if
	return 0
end if
return 0


end function

public function string f_get_type_role_user_id (double vdb_role_user_id);string 				ls_sql,ls_modify,ls_rtn
long					ll_rtn
double				ldb_role_user_id
c_string				lc_string
datastore			lds_role_user

ls_sql = "select 0 as ID, '' as criteria_col ,role_user.type as criteria_val,'' as ref_table,'' as col_of_id"+&
			" from role_user"+&
			" where role_user.id = "+string(vdb_role_user_id)
			
	lds_role_user = create datastore
	lds_role_user.dataobject = 'ds_replace_syntax'
	ls_modify = 'Datawindow.Table.Select= "' + ls_sql +'"'
	ls_rtn =lds_role_user.modify(ls_modify )
	lds_role_user.settransobject( SQLCA)
	ll_rtn = lds_role_user.retrieve( )
	if ll_rtn > 0 then
		return lds_role_user.getitemstring( 1, 'criteria_val')
	elseif ll_rtn = -1 then
		messagebox('Lỗi','b_rule.f_get_type_role_user_id(line:20)')
		setnull(ls_rtn)
		return ls_rtn
	else
		return ''
	end if
end function

public function integer f_get_appli_rule_id_union (ref double rdb_rule_id[], double vdb_user_id, string vs_object, string vs_ruletype, string vs_obj_name);/***************************
Tìm rule_id của user khi biết dwo
return 	1: table
			2: dwo
			3: all
			0: không bị phân quyền record
***************************/

double				ldb_role_id[],ldb_rule_id[], ldb_emty[]
int						li_idx
string					ls_ruletype_table_ref,ls_ruletype_column_ref,ls_role_user_id
c_user_instance		lc_user

if vs_object = '' or isnull(vs_object) then return 0
if vdb_user_id <> gi_userid then
	lc_user.f_init( vdb_user_id)
	ldb_role_id = lc_user.idb_role_id
else
	ldb_role_id = g_user.idb_role_id
end if
for li_idx=1 to upperbound(ldb_role_id)
	ls_role_user_id += string(ldb_role_id[li_idx])+';'
next
ls_role_user_id = ls_role_user_id+ string(vdb_user_id)+';'
//-- rule id table --//
this.f_get_appli_rule_id_table( ldb_rule_id, ls_role_user_id, vs_object, vs_ruletype,vs_obj_name)
if upperbound(ldb_rule_id) > 0 then
	rdb_rule_id[] = ldb_rule_id[]
end if
//-- rule id dwo --//
ldb_rule_id[]= ldb_emty[]
this.f_get_appli_rule_id_dwo( ldb_rule_id, ls_role_user_id, vs_object, vs_ruletype,vs_obj_name)

if upperbound(rdb_rule_id[]) = 0 then
	rdb_rule_id[] = ldb_rule_id[]
else
	FOR li_idx = 1 to  upperbound(ldb_rule_id[])
		rdb_rule_id[upperbound(rdb_rule_id[])+1] = ldb_rule_id[li_idx]
	NEXT
end if

//-- rule id all --//
ldb_rule_id[]= ldb_emty[]
this.f_get_appli_rule_id_all( ldb_rule_id, vs_object, vs_ruletype,vs_obj_name)
if upperbound(rdb_rule_id[]) = 0 then
	rdb_rule_id[] = ldb_rule_id[]
else
	FOR li_idx = 1 to  upperbound(ldb_rule_id[])
		rdb_rule_id[upperbound(rdb_rule_id[])+1] = ldb_rule_id[li_idx]
	NEXT
end if
return upperbound(rdb_rule_id[])

end function

public function integer f_get_appli_rule_id_union (ref double rdb_rule_id[], double vdb_user_id, string vs_object, string vs_ruletype);return this.f_get_appli_rule_id_union( rdb_rule_id[], vdb_user_id, vs_object, vs_ruletype, '')
end function

public function double f_get_business_rule_id (double vdb_identify_id, window vw_display);s_object_display	lod_handling
t_ds_db				lds_policy
b_rule				lc_rule
double				ldb_business_id,ldb_object_ref_id
long					ll_rtn,ll_idx
any					laa_data[]
			
	lds_policy = create t_ds_db
	lds_policy.dataobject = 'ds_policy_security'
	laa_data[1] = vdb_identify_id
	lds_policy.f_add_where( 'identification_id', laa_data)
	lds_policy.f_settransobject( SQLCA)
	lds_policy.setfilter("query_yn = 'Y' and access_yn = 'Y'")
	lds_policy.filter()
	lds_policy.setsort('object_ref_id asc')
	lds_policy.sort()
	ll_rtn = lds_policy.retrieve( )
	
	if ll_rtn = 1 then
		ldb_business_id = lds_policy.getitemnumber( 1, 'object_ref_id')
	elseif ll_rtn > 1 then
		ll_idx = 1
		DO while  ll_idx > 0
			if lc_rule.f_is_policy_applied( lds_policy, ll_idx, vw_display) then
				ldb_business_id = lds_policy.getitemnumber( ll_idx, 'object_ref_id')
				exit
			end if
			ldb_object_ref_id = lds_policy.getitemnumber( ll_idx, 'object_ref_id')
			ll_idx = lds_policy.find('object_ref_id <> ' + string(ldb_object_ref_id),ll_idx + 1,lds_policy.rowcount()+1)
		Loop 
//		for ll_idx = 1 to ll_rtn
//			if lc_rule.f_is_policy_applied( lds_policy, ll_idx, vw_display) then
//				ldb_business_id = lds_policy.getitemnumber( ll_idx, 'object_ref_id')
//				exit
//			end if
//		next
	else
		lod_handling = vw_display.dynamic f_get_obj_handling()
		laa_data[1] = '=' + lod_handling.classname( )
		lds_policy.f_remove_where( )
		lds_policy.f_add_where( 'object_ref_code', laa_data[])
		ll_rtn = lds_policy.retrieve( )
		if ll_rtn = 1 then
			ldb_business_id = lds_policy.getitemnumber( 1, 'object_ref_id')
		elseif ll_rtn > 0 then
			lds_policy.setfilter("branch_id = "+ string(gdb_branch))
			lds_policy.filter()
			if lds_policy.rowcount() = 0 then
				lds_policy.setfilter("")
				lds_policy.filter()				
			end if
			for ll_idx = 1 to ll_rtn
				if lc_rule.f_is_policy_applied( lds_policy, ll_idx, vw_display) then
					ldb_business_id = lds_policy.getitemnumber( ll_idx, 'object_ref_id')
					exit
				end if
			next
		else
			messagebox('Lỗi','b_rule.f_get_business_rule_id(line:37)')
			ldb_business_id = -1
		end if
	end if
	destroy lds_policy
return ldb_business_id
end function

public function integer f_set_policy_dwctrl (s_object_display vod_handle, t_dw vdw_handle);/****************************************************************************************
chức năng: set thuộc tính datawindow theo chính sách và phần quyền, 
			   khi tất cả các fields được áp dụng chúng 1 chính sách và không phụ thuộc dữ liệu
----------------------------------------------------------------------------------------------------------------------------------------------
Tham số: vod_handle: object hiện hành
			 vdw_handle: dw hiện hành
----------------------------------------------------------------------------------------------------------------------------------------------
return:
================================================================*/

string								ls_idKey_code, ls_dwobject_constraint, ls_role_user_id, ls_findString
long								ll_found_obj, ll_found_dwo
int									li_ruleCount, li_idx
double							ldb_idkey_id, ldba_rule_id[], ldb_rule_id
boolean							lb_found
c_string							lc_string
s_str_policy_attr				lstr_policy_attr, lstr_policy_attr_combine

//-- Nếu là user admin thì không phân quyền --//
if gi_userid = 0 or vod_handle.classname() = 'b_view' or vod_handle.classname() = 'b_popup_data' then
	vdw_handle.f_set_security_attr( vod_handle.ids_policy_security, 0)
	vdw_handle.f_set_rule_attr( vod_handle.ids_policy_security, 0)
	return 1
end if
if isvalid(vod_handle.ids_policy_rule) then
	if left(vdw_handle.dataobject,8) <> 'd_action' then
		ls_idKey_code = vod_handle.classname( )+'.'+left(vdw_handle.dataobject,len(vdw_handle.dataobject)-5) 
	else
		ls_idKey_code = vod_handle.classname( )+'.'+vdw_handle.dataobject
	end if
	//-- xét các chính sách áp dụng chung tất cả user : nguyên tắc Không cấm thì được dùng --//
	ll_found_dwo = vod_handle.ids_policy_rule.find("identification_code ='"+ls_idKey_code +"'",1 ,vod_handle.ids_policy_rule.rowcount() )
	if ll_found_dwo= 0 then
		
		vdw_handle.f_set_rule_attr( vod_handle.ids_policy_rule, 0)
	else
		ls_idKey_code = '.'+ vod_handle.classname( )
		ls_findString = lc_string.f_get_expression( ls_idKey_code, 'char()', 'identification_code', 'filter')
		ll_found_dwo = vod_handle.ids_policy_rule.find(ls_findString,1 ,vod_handle.ids_policy_rule.rowcount() )
		if ll_found_dwo >=0 then
			vdw_handle.f_set_rule_attr( vod_handle.ids_policy_rule, ll_found_dwo)
		else
			gf_messagebox('m.b_rule.f_set_policy_dwctrl.01','Thông báo','Lỗi: rule.f_set_policy_dwctrl:line(42) @'+vdw_handle.dataobject,'exclamation','ok',1)
			return -1		
		end if
	end if
	
	//-- xét Phân quyền đối tượng của user đang đăng nhập --//	
	if left(vdw_handle.dataobject,8) <> 'd_action' then
		ls_idKey_code = vod_handle.classname( )+'.'+left(vdw_handle.dataobject,len(vdw_handle.dataobject)-5) 
	else
		ls_idKey_code = vod_handle.classname( )+'.'+vdw_handle.dataobject
	end if
	//-- tìm cài đặt security của dwo --//
	ll_found_dwo = vod_handle.ids_policy_security.find("identification_code ='"+ls_idKey_code +"'",1 ,vod_handle.ids_policy_security.rowcount() )
	DO while ll_found_dwo > 0 //-- Nếu user có nhiều role thì lấy hợp (OR) của các quyền --/
		lb_found = true
		vdw_handle.f_get_policy_attr(vod_handle.ids_policy_security,ll_found_dwo, lstr_policy_attr)
		lstr_policy_attr_combine.b_access = lstr_policy_attr_combine.b_access or lstr_policy_attr.b_access
		lstr_policy_attr_combine.b_delete = lstr_policy_attr_combine.b_delete or lstr_policy_attr.b_delete
		lstr_policy_attr_combine.b_insert = lstr_policy_attr_combine.b_insert or lstr_policy_attr.b_insert
		lstr_policy_attr_combine.b_update = lstr_policy_attr_combine.b_update or lstr_policy_attr.b_update
		lstr_policy_attr_combine.b_query = lstr_policy_attr_combine.b_query or lstr_policy_attr.b_query	
		lstr_policy_attr_combine.b_excel = lstr_policy_attr_combine.b_excel or lstr_policy_attr.b_excel
		lstr_policy_attr_combine.b_print = lstr_policy_attr_combine.b_print or lstr_policy_attr.b_print
		lstr_policy_attr_combine.b_full_inherit = lstr_policy_attr_combine.b_full_inherit or lstr_policy_attr.b_full_inherit	
		ll_found_dwo = vod_handle.ids_policy_security.find("identification_code ='"+ls_idKey_code +"'",ll_found_dwo+1 ,vod_handle.ids_policy_security.rowcount() +1)
	LOOP 
	//-- Tìm cài đặt security của đối tượng: khi không tìm thấy cài đặt security của dwo --//
	if not lb_found then
		ls_idKey_code = '.'+ vod_handle.classname( )
		ls_findString = lc_string.f_get_expression( ls_idKey_code, 'char()', 'identification_code', 'filter')	
		ll_found_dwo = vod_handle.ids_policy_security.find(ls_findString,1 ,vod_handle.ids_policy_security.rowcount() )
		DO while ll_found_dwo > 0 //-- Nếu user có nhiều role thì lấy hợp (OR) của các quyền --/
			vdw_handle.f_get_policy_attr(vod_handle.ids_policy_security,ll_found_dwo, lstr_policy_attr)
			lstr_policy_attr_combine.b_access = lstr_policy_attr_combine.b_access or lstr_policy_attr.b_access
			lstr_policy_attr_combine.b_delete = lstr_policy_attr_combine.b_delete or lstr_policy_attr.b_delete
			lstr_policy_attr_combine.b_insert = lstr_policy_attr_combine.b_insert or lstr_policy_attr.b_insert
			lstr_policy_attr_combine.b_update = lstr_policy_attr_combine.b_update or lstr_policy_attr.b_update
			lstr_policy_attr_combine.b_query = lstr_policy_attr_combine.b_query or lstr_policy_attr.b_query	
			lstr_policy_attr_combine.b_excel = lstr_policy_attr_combine.b_excel or lstr_policy_attr.b_excel
			lstr_policy_attr_combine.b_print = lstr_policy_attr_combine.b_print or lstr_policy_attr.b_print
			lstr_policy_attr_combine.b_full_inherit = lstr_policy_attr_combine.b_full_inherit or lstr_policy_attr.b_full_inherit			
			ll_found_dwo = vod_handle.ids_policy_security.find(ls_findString,ll_found_dwo+1 ,vod_handle.ids_policy_security.rowcount() +1)
		LOOP	
	end if	
	//-- Tìm cài đặt security theo menu code: khi không tìm thấy theo đối tượng --//
	if not lb_found then
		ls_idKey_code = vod_handle.f_get_menu_code()
		ls_findString = lc_string.f_get_expression( ls_idKey_code, 'char()', 'identification_code', 'filter')	
		ll_found_dwo = vod_handle.ids_policy_security.find(ls_findString,1 ,vod_handle.ids_policy_security.rowcount() )
		DO while ll_found_dwo > 0 //-- Nếu user có nhiều role thì lấy hợp (OR) của các quyền --/
			vdw_handle.f_get_policy_attr(vod_handle.ids_policy_security,ll_found_dwo, lstr_policy_attr)
			lstr_policy_attr_combine.b_access = lstr_policy_attr_combine.b_access or lstr_policy_attr.b_access
			lstr_policy_attr_combine.b_delete = lstr_policy_attr_combine.b_delete or lstr_policy_attr.b_delete
			lstr_policy_attr_combine.b_insert = lstr_policy_attr_combine.b_insert or lstr_policy_attr.b_insert
			lstr_policy_attr_combine.b_update = lstr_policy_attr_combine.b_update or lstr_policy_attr.b_update
			lstr_policy_attr_combine.b_query = lstr_policy_attr_combine.b_query or lstr_policy_attr.b_query	
			lstr_policy_attr_combine.b_excel = lstr_policy_attr_combine.b_excel or lstr_policy_attr.b_excel
			lstr_policy_attr_combine.b_print = lstr_policy_attr_combine.b_print or lstr_policy_attr.b_print
			lstr_policy_attr_combine.b_full_inherit = lstr_policy_attr_combine.b_full_inherit or lstr_policy_attr.b_full_inherit			
			ll_found_dwo = vod_handle.ids_policy_security.find(ls_findString,ll_found_dwo+1 ,vod_handle.ids_policy_security.rowcount() +1)
		LOOP	
	end if		
	vdw_handle.f_set_security_attr( lstr_policy_attr_combine)
else
	vdw_handle.f_set_security_attr( vod_handle.ids_policy_security, 0)
	vdw_handle.f_set_rule_attr( vod_handle.ids_policy_security, 0)	
end if
return 1
end function

public function boolean f_is_criteria_ok (t_dw_mpl vdw_constraint, string vs_col_constraint, string vs_criteria);/****************************
dùng cho trường hợp dwo constraint là
detail và có nhiều dòng
****************************/
c_string		lc_string
t_ds			lds_check
c_sql			lc_sql
string			ls_where, ls_currentSQL, ls_currentWhere, ls_rtn,ls_data,ls_coltype
long			ll_idx
any			la_data

ls_coltype = vdw_constraint.describe(vs_col_constraint+ '.coltype')
for ll_idx = 1 to vdw_constraint.rowcount()
	la_data = vdw_constraint.f_getitemany( ll_idx, vs_col_constraint)
	if pos(ls_coltype,'char') > 0 and isnull(la_data) then la_data = '()'
	if pos(ls_coltype,'numbe') > 0 and isnull(la_data) then la_data = 0
	ls_data = string(la_data)
	
	if left(ls_coltype,5) = 'char(' then
		if ls_data ='' then ls_data = ' '
		ls_data = "~~'"+ls_data+"~~'"
	elseif left(ls_coltype,5) = 'date(' or  left(ls_coltype,5) = 'datet' then
		if ls_data = '()' then 
			ls_data = string(date('01/01/1900'),gs_w_date_format)
		else
			ls_data = string(date(ls_data),gs_w_date_format)
		end if
		ls_data = "to_date('" + ls_data + "','"+ gs_w_date_format + "')"
	elseif left(ls_coltype,5) = 'numbe' then
		if ls_data = '()' then ls_data = '0'
	end if
	if ls_where <> '' then ls_where += ' OR '
	ls_where += lc_string.f_get_expression(vs_criteria, ls_coltype, ls_data, 'build where')
next

lds_check = create t_ds
lds_check.dataobject = 'ds_replace_syntax'
if lds_check.f_getcurrentSQL( ls_currentSQL, ls_currentWhere) =1 then
	if ls_where <> "" then
		if ls_currentWhere <> '' then ls_currentWhere += ' AND '
		ls_currentWhere += ls_where
		lc_sql.f_addtowhereclause( ls_currentSQL, ls_currentWhere, " AND ")
		ls_rtn =lds_check.modify( 'Datawindow.Table.Select= "' + ls_currentSQL +'"' )		
	end if
end if
lds_check.settransobject( sqlca)
if lds_check.retrieve( ) = 1 then
	return true
end if
return false
end function

public function integer f_get_user_id (double vdb_role_id, ref double radb_user_id[]);t_ds_db		lds_role_user
long			ll_row,ll_idx

lds_role_user = create t_ds_db
lds_role_user.dataobject = 'd_role_assign_grid'
lds_role_user.f_settransobject( SQLCA)
ll_row = lds_role_user.retrieve( )
if ll_row > 0 then
	lds_role_user.setfilter( "role_id = "+ string(vdb_role_id))
	lds_role_user.filter( )
	for ll_idx = 1 to lds_role_user.rowcount( )
		radb_user_id[upperbound(radb_user_id) + 1] = lds_role_user.getitemnumber( ll_idx, 'user_id')
	next
end if
return upperbound(radb_user_id)
end function

public function integer f_get_role_user_id (double vdb_business_rule, ref string rsa_string_id[]);string 				ls_sql,ls_modify,ls_rtn, ls_APPLICABLE_REF_ID_STRING
long					ll_rtn
double				ldb_role_user_id
c_string				lc_string
datastore			lds_applicable_rule

lds_applicable_rule = create datastore
lds_applicable_rule.dataobject = 'ds_replace_syntax'

ls_sql = "select 0 as ID, '' as criteria_col ,applicable_rule_hdr.APPLICABLE_REF_ID_STRING as criteria_val,'' as ref_table,'' as col_of_id"+&
			" from applicable_rule_hdr"+&
			" join business_rule on business_rule.object_ref_id = applicable_rule_hdr.id"+&
			" where business_rule.id = "+string(vdb_business_rule) +&
			" AND applicable_rule_hdr.applicable_type = 'table'" 
			
ls_modify = 'Datawindow.Table.Select= "' + ls_sql +'"'
ls_rtn =lds_applicable_rule.modify(ls_modify )
lds_applicable_rule.settransobject( SQLCA)
ll_rtn = lds_applicable_rule.retrieve( )
if ll_rtn > 0 then
	ls_APPLICABLE_REF_ID_STRING =  lds_applicable_rule.getitemstring(1,'criteria_val')
	ll_rtn = lc_string.f_stringtoarray( ls_APPLICABLE_REF_ID_STRING, ';', rsa_string_id[])
	return ll_rtn
elseif ll_rtn = -1 then
	messagebox('Lỗi','b_rule.f_get_role_user_id(line:23)')
	return -1
else
	ls_sql = "select 0 as ID, '' as criteria_col ,applicable_rule_hdr.APPLICABLE_REF_ID_STRING as criteria_val,'' as ref_table,'' as col_of_id"+&
			" from applicable_rule_hdr"+&
			" join business_rule on business_rule.id = applicable_rule_hdr.object_ref_id"+&
			" where business_rule.id = "+string(vdb_business_rule) +&
			" AND applicable_rule_hdr.applicable_type = 'table'" 
			ls_modify = 'Datawindow.Table.Select= "' + ls_sql +'"'
			ls_rtn =lds_applicable_rule.modify(ls_modify )
			lds_applicable_rule.settransobject( SQLCA)
			ll_rtn = lds_applicable_rule.retrieve( )
			if ll_rtn > 0 then
				ls_APPLICABLE_REF_ID_STRING =  lds_applicable_rule.getitemstring(1,'criteria_val')
				ll_rtn = lc_string.f_stringtoarray( ls_APPLICABLE_REF_ID_STRING, ';', rsa_string_id[])
				return ll_rtn				
//				ldb_role_user_id = double(lc_string.f_globalreplace( lds_applicable_rule.getitemstring(1,'criteria_val') , ';', ''))
//				return ldb_role_user_id
			elseif ll_rtn = -1 then
				messagebox('Lỗi','b_rule.f_get_role_user_id(line:40)')
				return -1
			else
				return 0
			end if
	return 0
end if
return 0


end function

public function integer f_get_appli_rule_id_all_ex (ref double rdb_rule_id[], string vs_object, string vs_ruletype, string vs_obj_name, ref t_transaction rt_transaction);datastore		lds_appli_all
c_string			lc_string
string				ls_sql,ls_rtn,ls_modify
string				ls_ruletype_table_ref,ls_ruletype_column_ref,ls_coltype,ls_where_vs_object
long 				ll_rtn
int					li_idx

if vs_object <> "" and not isnull(vs_object) then
	this.f_get_rule_type_ref( vs_ruletype, ls_ruletype_table_ref, ls_ruletype_column_ref, ls_coltype)
	if left(ls_coltype,5) = 'char(' then
		vs_object = '='+vs_object
	end if		
	ls_where_vs_object = lc_string.f_get_expression(vs_object, ls_coltype, ls_ruletype_table_ref +"."+ ls_ruletype_column_ref, 'build where')
	if lower(vs_ruletype)  = 'record' then
		ls_sql = " select BUSINESS_RULE.ID as ID, '' as criteria_col ,'' as criteria_val,'' as ref_table,'' as col_of_id"+&
					" from BUSINESS_RULE join APPLICABLE_RULE_HDR on BUSINESS_RULE.ID =  APPLICABLE_RULE_HDR.OBJECT_REF_ID"+&
													" join "+ ls_ruletype_table_ref +" on "+ ls_ruletype_table_ref +".ID = BUSINESS_RULE.OBJECT_REF_ID"+&
					" where APPLICABLE_RULE_HDR.APPLICABLE_TYPE = 'all'"+&
						" and "+ ls_where_vs_object + " and "+ls_ruletype_table_ref+".OBJECT = "+"'"+vs_obj_name+"'"
	elseif lower(vs_ruletype)  = 'policy' then
		ls_sql = " select POLICY_HDR.OBJECT_REF_ID as ID, '' as criteria_col ,'' as criteria_val,'' as ref_table,'' as col_of_id"+&
					" from POLICY_HDR join BUSINESS_RULE on POLICY_HDR.OBJECT_REF_ID = BUSINESS_RULE.ID"+&
											" join APPLICABLE_RULE_HDR on BUSINESS_RULE.OBJECT_REF_ID =  APPLICABLE_RULE_HDR.ID"+&											
					" where APPLICABLE_RULE_HDR.APPLICABLE_TYPE = 'all'"+&
						" and "+ ls_where_vs_object
	end if
else
	return -1
end if

if ls_sql <> '' then
	lds_appli_all = create datastore
	lds_appli_all.dataobject = 'ds_replace_syntax'
	ls_modify = 'Datawindow.Table.Select= "' + ls_sql +'"'
	ls_rtn =lds_appli_all.modify(ls_modify )
	lds_appli_all.settransobject( rt_transaction)
	ll_rtn = lds_appli_all.retrieve( )
	if ll_rtn >0 then
		rdb_rule_id[] = lds_appli_all.object.ID.primary
	else
		//----//
	end if
	destroy lds_appli_all
	return ll_rtn
else
	return -1
end if
end function

public function integer f_get_appli_rule_id_table_ex (ref double rdb_rule_id[], string vs_role_user_id, string vs_object, string vs_ruletype, string vs_obj_name, ref t_transaction rt_transaction);/*************************************
	Lấy rule_id được áp dụng cho user và role
	khi có loại áp dụng là table(cụ thể)
**************************************/
datastore		lds_appli_table
c_string 			lc_string
string				ls_sql,ls_REGEXP,ls_modify,ls_rtn,ls_where_vs_object
string				ls_ruletype_table_ref,ls_ruletype_column_ref,ls_coltype
long 				ll_rtn
int					li_idx

if vs_object <> '' and not isnull(vs_object) then
	this.f_get_rule_type_ref( vs_ruletype, ls_ruletype_table_ref, ls_ruletype_column_ref, ls_coltype)

	ls_REGEXP = lc_string.f_get_expression( vs_role_user_id, 'char()', 'APPLICABLE_RULE_HDR.APPLICABLE_REF_ID_STRING', 'build where')
	if left(ls_coltype,5) = 'char(' then
		vs_object = '='+vs_object
	end if
	ls_where_vs_object = lc_string.f_get_expression( vs_object, ls_coltype, ls_ruletype_table_ref +"."+ ls_ruletype_column_ref, 'build where')
	if lower(vs_ruletype) = 'record' then
		ls_sql = "select BUSINESS_RULE.ID as ID, '' as criteria_col ,'' as criteria_val,'' as ref_table,'' as col_of_id"+&
					" from BUSINESS_RULE join "+ ls_ruletype_table_ref +" on "+ ls_ruletype_table_ref +".ID = BUSINESS_RULE.OBJECT_REF_ID"+&
													" join APPLICABLE_RULE_HDR on BUSINESS_RULE.ID = APPLICABLE_RULE_HDR.OBJECT_REF_ID"+&
					" where "+ ls_where_vs_object +&
						" and APPLICABLE_RULE_HDR.APPLICABLE_TYPE = 'table'"+&
						" and "+ ls_REGEXP + " and "+ls_ruletype_table_ref+".OBJECT = "+"'"+vs_obj_name+"'"
	elseif lower(vs_ruletype) = 'policy' then
		ls_sql = " select POLICY_HDR.OBJECT_REF_ID as ID, '' as criteria_col ,'' as criteria_val,'' as ref_table,'' as col_of_id"+&
					" from POLICY_HDR join BUSINESS_RULE on POLICY_HDR.OBJECT_REF_ID = BUSINESS_RULE.ID"+&
											" join APPLICABLE_RULE_HDR on BUSINESS_RULE.OBJECT_REF_ID =  APPLICABLE_RULE_HDR.ID"+&											
					" where "+ ls_where_vs_object +&
						" and APPLICABLE_RULE_HDR.APPLICABLE_TYPE = 'table'"+&
						" and "+ ls_REGEXP
	end if
else
	return -1
end if

if ls_sql <> '' then
	lds_appli_table = create datastore
	lds_appli_table.dataobject = 'ds_replace_syntax'
	ls_modify = 'Datawindow.Table.Select= "' + ls_sql +'"'
	ls_rtn =lds_appli_table.modify(ls_modify )
	lds_appli_table.settransobject( rt_transaction)
	ll_rtn = lds_appli_table.retrieve( )
	if ll_rtn >0 then
		rdb_rule_id[] = lds_appli_table.object.ID.primary
	end if
	destroy lds_appli_table
	return ll_rtn
else
	return -1
end if
end function

public function integer f_get_appli_rule_id_union_ex (ref double rdb_rule_id[], double vdb_user_id, string vs_object, string vs_ruletype, string vs_obj_name, ref t_transaction rt_transaction);/***************************
Tìm rule_id của user khi biết dwo
return 	1: table
			2: dwo
			3: all
			0: không bị phân quyền record
***************************/

double				ldb_role_id[],ldb_rule_id[], ldb_emty[]
int						li_idx
string					ls_ruletype_table_ref,ls_ruletype_column_ref,ls_role_user_id
c_user_instance		lc_user

if vs_object = '' or isnull(vs_object) then return 0
if vdb_user_id <> gi_userid then
	lc_user.f_init( vdb_user_id)
	ldb_role_id = lc_user.idb_role_id
else
	ldb_role_id = g_user.idb_role_id
end if
for li_idx=1 to upperbound(ldb_role_id)
	ls_role_user_id += string(ldb_role_id[li_idx])+';'
next
ls_role_user_id = ls_role_user_id+ string(vdb_user_id)+';'
//-- rule id table --//
this.f_get_appli_rule_id_table_ex( ldb_rule_id, ls_role_user_id, vs_object, vs_ruletype,vs_obj_name, rt_transaction)
if upperbound(ldb_rule_id) > 0 then
	rdb_rule_id[] = ldb_rule_id[]
end if
//-- rule id dwo --//
ldb_rule_id[]= ldb_emty[]
this.f_get_appli_rule_id_dwo_ex( ldb_rule_id, ls_role_user_id, vs_object, vs_ruletype,vs_obj_name,rt_transaction)

if upperbound(rdb_rule_id[]) = 0 then
	rdb_rule_id[] = ldb_rule_id[]
else
	FOR li_idx = 1 to  upperbound(ldb_rule_id[])
		rdb_rule_id[upperbound(rdb_rule_id[])+1] = ldb_rule_id[li_idx]
	NEXT
end if

//-- rule id all --//
ldb_rule_id[]= ldb_emty[]
this.f_get_appli_rule_id_all_ex( ldb_rule_id, vs_object, vs_ruletype,vs_obj_name, rt_transaction)
if upperbound(rdb_rule_id[]) = 0 then
	rdb_rule_id[] = ldb_rule_id[]
else
	FOR li_idx = 1 to  upperbound(ldb_rule_id[])
		rdb_rule_id[upperbound(rdb_rule_id[])+1] = ldb_rule_id[li_idx]
	NEXT
end if
return upperbound(rdb_rule_id[])

end function

public function integer f_get_appli_rule_id_dwo_ex (ref double rdb_rule_id[], string vs_role_user_id, string vs_object, string vs_ruletype, string vs_obj_name, ref t_transaction rt_transaction);datastore		lds_appli_dwo
c_string			lc_string
string				ls_sql,ls_dwo,ls_col_of_id,ls_filter,ls_id,ls_ref_table,ls_modify,ls_rtn
string				ls_crite_of_col_for_dwo[],ls_dwcol_for_dwo[]
string				ls_ruletype_table_ref,ls_ruletype_column_ref,ls_coltype,ls_where_vs_object
long 				ll_rtn
int					li_idx,li_idx2


if vs_object <> '' and not isnull(vs_object) then 
	this.f_get_rule_type_ref( vs_ruletype, ls_ruletype_table_ref, ls_ruletype_column_ref, ls_coltype)
	if left(ls_coltype,5) = 'char(' then
		vs_object = '='+vs_object
	end if	
	ls_where_vs_object = lc_string.f_get_expression( vs_object, ls_coltype, ls_ruletype_table_ref +"."+ ls_ruletype_column_ref, 'build where')
	if lower(vs_ruletype) = 'record' then
		ls_sql = "select BUSINESS_RULE.ID as ID,APPLICABLE_RULE_LINE.APPLICABLE_CRITERIA_COL as criteria_col,APPLICABLE_RULE_LINE.APPLICABLE_CRITERIA_VAL as criteria_val,"+&
					" APPLICABLE_RULE_HDR.APPLICABLE_REF_TABLE as ref_table,APPLICABLE_RULE_HDR.APPLICABLE_REF_ID_STRING as col_of_id"+&
					" from BUSINESS_RULE join "+ ls_ruletype_table_ref +" on "+ ls_ruletype_table_ref +".ID = BUSINESS_RULE.OBJECT_REF_ID"+&
													" join APPLICABLE_RULE_HDR on BUSINESS_RULE.ID = APPLICABLE_RULE_HDR.OBJECT_REF_ID"+&
													" join APPLICABLE_RULE_LINE on APPLICABLE_RULE_HDR.ID = APPLICABLE_RULE_LINE.OBJECT_REF_ID"+&
					" where "+ ls_where_vs_object+&
					"and APPLICABLE_RULE_HDR.APPLICABLE_TYPE = 'dwo'" + " and "+ls_ruletype_table_ref+".OBJECT = "+"'"+vs_obj_name+"'"
	elseif lower(vs_ruletype) = 'policy' then
		ls_sql = " select POLICY_HDR.OBJECT_REF_ID as ID, '' as criteria_col ,'' as criteria_val,'' as ref_table,'' as col_of_id"+&
					" from POLICY_HDR join BUSINESS_RULE on POLICY_HDR.OBJECT_REF_ID = BUSINESS_RULE.ID"+&
											" join APPLICABLE_RULE_HDR on BUSINESS_RULE.OBJECT_REF_ID =  APPLICABLE_RULE_HDR.ID"+&		
											" join APPLICABLE_RULE_LINE on APPLICABLE_RULE_HDR.ID = APPLICABLE_RULE_LINE.OBJECT_REF_ID"+&
					" where "+ ls_where_vs_object+&
					"and APPLICABLE_RULE_HDR.APPLICABLE_TYPE = 'dwo'"
	end if		
else
	return -1
end if

if ls_sql <> '' then
	lds_appli_dwo = create datastore
	lds_appli_dwo.dataobject = 'ds_replace_syntax'
	ls_modify = 'Datawindow.Table.Select= "' + ls_sql +'"'
	ls_rtn =lds_appli_dwo.modify(ls_modify )
	lds_appli_dwo.settransobject( rt_transaction)
	ll_rtn = lds_appli_dwo.retrieve( )
	if ll_rtn >0 then
		for li_idx = 1 to ll_rtn
			if pos(ls_id,string(lds_appli_dwo.getitemnumber( li_idx, 'id'))+';') = 0 or pos(ls_ref_table,lds_appli_dwo.getitemstring( li_idx, 'ref_table')+';') = 0 then
				ls_id += string(lds_appli_dwo.getitemnumber( li_idx, 'id'))+';'
				ls_ref_table += lds_appli_dwo.getitemstring( li_idx, 'ref_table')+';'
				ls_filter = "id = "+ string(lds_appli_dwo.getitemnumber( li_idx, 'ID')) + ' and ref_table = ' + lds_appli_dwo.getitemstring( li_idx, 'ref_table')
				lds_appli_dwo.setfilter( ls_filter)
				lds_appli_dwo.filter( )
				if lds_appli_dwo.rowcount( ) > 0 then
					ls_col_of_id = lds_appli_dwo.getitemstring( 1, 'col_of_id')
					ls_dwo = lds_appli_dwo.getitemstring( 1, 'ref_table')
					for li_idx2 = 1 to lds_appli_dwo.rowcount( )
						ls_crite_of_col_for_dwo[li_idx2] = lds_appli_dwo.getitemstring( li_idx2, 'criteria_val')
						ls_dwcol_for_dwo[li_idx2] = lds_appli_dwo.getitemstring( li_idx2, 'criteria_col')
					next
					if f_is_rule_id( ls_dwo, ls_col_of_id, ls_crite_of_col_for_dwo, ls_dwcol_for_dwo,vs_role_user_id) then
						rdb_rule_id[upperbound(rdb_rule_id) + 1] = lds_appli_dwo.getitemnumber( li_idx, 'ID')
					end if
				end if
			end if
		next
	end if
	destroy lds_appli_dwo
	return ll_rtn
else
	return -1
end if
end function

public function integer f_get_appli_rule_id_union_ex (ref double rdb_rule_id[], double vdb_user_id, string vs_object, string vs_ruletype, ref t_transaction rt_transaction);return this.f_get_appli_rule_id_union_ex( rdb_rule_id[], vdb_user_id, vs_object, vs_ruletype, '', rt_transaction)
end function

public function integer f_get_appli_rule_id_ex (ref double rdb_rule_id[], double vdb_user_id, string vs_object, string vs_ruletype, string vs_obj_name, ref t_transaction rt_transaction);/***************************
Tìm rule_id của user khi biết dwo
return 	1: table
			2: dwo
			3: all
			0: không bị phân quyền record
***************************/

double				ldb_role_id[],ldb_rule_id[]
int						li_idx
string					ls_ruletype_table_ref,ls_ruletype_column_ref,ls_role_user_id
c_user_instance		lc_user

if vs_object = '' or isnull(vs_object) then return 0
if vdb_user_id <> gi_userid then
	lc_user.f_init_ex( vdb_user_id, rt_transaction)
//	lc_user.f_init
	ldb_role_id = lc_user.idb_role_id
else
	ldb_role_id = g_user.idb_role_id
end if
for li_idx=1 to upperbound(ldb_role_id)
	ls_role_user_id += string(ldb_role_id[li_idx])+';'
next
ls_role_user_id = ';' + ls_role_user_id+ string(vdb_user_id)+';'
this.f_get_appli_rule_id_table_ex( ldb_rule_id, ls_role_user_id, vs_object, vs_ruletype,vs_obj_name, rt_transaction)
if upperbound(ldb_rule_id) = 0 then
	this.f_get_appli_rule_id_dwo_ex( ldb_rule_id, ls_role_user_id, vs_object, vs_ruletype,vs_obj_name, rt_transaction)
	if upperbound(ldb_rule_id) = 0 then
		this.f_get_appli_rule_id_all_ex(ldb_rule_id ,vs_object, vs_ruletype,vs_obj_name, rt_transaction)
		if upperbound(ldb_rule_id) = 0 then
			return 0
		else
			rdb_rule_id = ldb_rule_id
			return upperbound(rdb_rule_id)
		end if
	else
		rdb_rule_id = ldb_rule_id
		return upperbound(rdb_rule_id)
	end if
else
	rdb_rule_id = ldb_rule_id
	return upperbound(rdb_rule_id)
end if

end function

public function integer f_get_appli_rule_id_ex (ref double rdb_rule_id[], double vdb_user_id, string vs_object, string vs_ruletype, ref t_transaction rt_transaction);return this.f_get_appli_rule_id_ex( rdb_rule_id[], vdb_user_id, vs_object, vs_ruletype, '', rt_transaction)
end function

public function integer f_get_appli_deligate_rule_id_ex (ref double rdb_rule_id[], double vdb_user_id, string vs_object, string vs_ruletype, string vs_obj_name, ref t_transaction rt_transaction);datastore		lds_appli_deligate
string				ls_sql,ls_modify,ls_rtn,ls_where_vs_object
long 				ll_rtn
double			ldb_rule_id[]
int					li_idx
string				ls_ruletype_table_ref,ls_ruletype_column_ref, ls_coltype
c_string			lc_string

if vs_object <> '' and not isnull(vs_object) then
	this.f_get_rule_type_ref( vs_ruletype, ls_ruletype_table_ref, ls_ruletype_column_ref, ls_coltype)
	if left(ls_coltype,5) = 'char(' then
		vs_object = '='+vs_object
	end if	
	ls_where_vs_object = lc_string.f_get_expression( vs_object, ls_coltype, ls_ruletype_table_ref +"."+ ls_ruletype_column_ref, 'build where')
	
	if lower(vs_ruletype) = 'record' then
		ls_sql = "select BUSINESS_RULE.ID as id,'' as criteria_col,'' as criteria_val,'' as ref_table,'' as col_of_id "+&
					" from APPLICABLE_RULE_HDR left join BUSINESS_RULE on BUSINESS_RULE.ID = APPLICABLE_RULE_HDR.OBJECT_REF_ID"+&
																" join "+ls_ruletype_table_ref+" on "+ls_ruletype_table_ref+".ID = BUSINESS_RULE.OBJECT_REF_ID"+&
					" where   "+ ls_where_vs_object+&
					" and sysdate between APPLICABLE_RULE_HDR.DELIGATE_SDATE and nvl(APPLICABLE_RULE_HDR.DELIGATE_EDATE,to_date('30/12/3000','dd/mm/yyyy'))"+&
					" and REGEXP_LIKE(APPLICABLE_RULE_HDR.DELIGATE_ID_STRING,';"+string(vdb_user_id)+";"+"')"	+ " and "+ls_ruletype_table_ref+".OBJECT = "+"'"+vs_obj_name+"'"
					
	elseif lower(vs_ruletype) = 'policy' then
		ls_sql = "select BUSINESS_RULE.ID as id,'' as criteria_col,'' as criteria_val,'' as ref_table,'' as col_of_id "+&
				" from APPLICABLE_RULE_HDR left join BUSINESS_RULE on BUSINESS_RULE.OBJECT_REF_ID = APPLICABLE_RULE_HDR.ID"+&
															" join "+ls_ruletype_table_ref+" on "+ls_ruletype_table_ref+".OBJECT_REF_ID = BUSINESS_RULE.ID"+&
				" where   "+ ls_where_vs_object+&
				" and sysdate between APPLICABLE_RULE_HDR.DELIGATE_SDATE and nvl(APPLICABLE_RULE_HDR.DELIGATE_EDATE,to_date('31/12/3000','dd/mm/yyyy'))"+&
				" and REGEXP_LIKE(APPLICABLE_RULE_HDR.DELIGATE_ID_STRING,';"+string(vdb_user_id)+";"+"')"
	end if
else
	return -1
end if

if ls_sql <> '' then
	lds_appli_deligate = create datastore
	lds_appli_deligate.dataobject = 'ds_replace_syntax'
	ls_modify = 'Datawindow.Table.Select= "' + ls_sql +'"'
	ls_rtn =lds_appli_deligate.modify(ls_modify )
	lds_appli_deligate.settransobject( rt_transaction)
	ll_rtn = lds_appli_deligate.retrieve( )
	if ll_rtn > 0 then
		for li_idx=1 to ll_rtn
			ldb_rule_id[upperbound(ldb_rule_id)+1] = lds_appli_deligate.getitemnumber( li_idx, 'ID')
		next
	end if
	rdb_rule_id = ldb_rule_id
	return ll_rtn
else
	return -1
end if
end function

public function double f_get_rule_id_ex (string vs_code, double vdb_company_id, double vdb_branch_id, ref t_transaction rt_transaction);double		ldb_ID

setnull(ldb_ID)
if isnull(vs_code) then return ldb_ID
if isnull(vdb_company_id) then return ldb_ID
if isnull(vdb_branch_id) then return ldb_ID

select id 
into :ldb_ID 
from business_rule
where code = :vs_code and company_id = :vdb_company_id and nvl(branch_id,0) = :vdb_branch_id
using rt_transaction;

if rt_transaction.sqlcode = 0 then
	return ldb_ID
elseif rt_transaction.sqlcode = 100 then
	return 0
else
	gf_messagebox('m.b_rule.f_get_rule_id.01','Thông báo','b_rule.f_get_rule_id(vs_code,vdb_company_id,vdb_branch_id): Lỗi select dữ liệu từ database: @'+rt_transaction.sqlerrtext,'exclamation','ok',1)
	return -1
end if
end function

public function double f_insert_policy_rule_code_ex (string vs_code, ref t_transaction rt_transaction);
t_ds_db	lds_business_rule
long		ll_insertrow
double	ldb_ruleID

lds_business_rule = create t_ds_db
lds_business_rule.dataobject = 'd_business_rule_grid'
lds_business_rule.f_settransobject(rt_transaction)
ll_insertrow =  lds_business_rule.insertrow( 0)
ldb_ruleID =  this.f_create_id( ) 
lds_business_rule.setitem( ll_insertrow, 'ID',ldb_ruleID)
lds_business_rule.setitem( ll_insertrow, 'code', vs_code )
lds_business_rule.setitem( ll_insertrow, 'company_id', gi_user_comp_id )
lds_business_rule.setitem( ll_insertrow, 'branch_id', gdb_branch )

if lds_business_rule.update(true,false ) = 1 then
	commit using rt_transaction;
	destroy lds_business_rule
	return ldb_ruleID
else
	gf_messagebox('m.b_rule.f_insert_policy_rule_code.01','Thông báo','Không tạo được mã chính sách:@'+rt_transaction.sqlerrtext,'exclamation','ok',1)
	rollback using rt_transaction;
	destroy lds_business_rule
	return -1
end if
end function

public function integer f_set_policy_dwctrl_ex (s_object_display vod_handle, t_dw vdw_handle);/****************************************************************************************
chức năng: set thuộc tính datawindow theo chính sách và phần quyền, 
			   khi tất cả các fields được áp dụng chúng 1 chính sách và không phụ thuộc dữ liệu
----------------------------------------------------------------------------------------------------------------------------------------------
Tham số: vod_handle: object hiện hành
			 vdw_handle: dw hiện hành
----------------------------------------------------------------------------------------------------------------------------------------------
return:
================================================================*/

string								ls_idKey_code, ls_dwobject_constraint, ls_role_user_id, ls_findString, ls_visible_fileds, ls_enable_fields, ls_fieldName
long								ll_found_obj, ll_found_dwo
int									li_ruleCount, li_idx
double							ldb_idkey_id, ldba_rule_id[], ldb_rule_id
boolean							lb_found
c_string							lc_string
s_str_policy_attr				lstr_policy_attr, lstr_policy_attr_combine

//-- Nếu là user admin thì không phân quyền --//
if gi_userid = 0 or vod_handle.classname() = 'b_view' or vod_handle.classname() = 'b_popup_data' then
	vdw_handle.f_set_security_attr( vod_handle.ids_policy_security, 0)
	vdw_handle.f_set_rule_attr( vod_handle.ids_policy_security, 0)
	return 1
end if
if isvalid(vod_handle.ids_policy_rule) then
//	if left(vdw_handle.dataobject,8) <> 'd_action' then
		ls_idKey_code = '.'+vod_handle.classname( )+'.'+left(vdw_handle.dataobject,len(vdw_handle.dataobject)-5) 
//	else
//		ls_idKey_code = vod_handle.classname( )+'.'+vdw_handle.dataobject
//	end if
	//-- xét các chính sách áp dụng chung tất cả user : nguyên tắc Không cấm thì được dùng --//
	ll_found_dwo = vod_handle.ids_policy_rule.find("identification_code ='"+ls_idKey_code +"'",1 ,vod_handle.ids_policy_rule.rowcount() )
	if ll_found_dwo= 0 then
		
		vdw_handle.f_set_rule_attr( vod_handle.ids_policy_rule, 0)
	else
		ls_idKey_code = '.'+ vod_handle.classname( )
		ls_findString = lc_string.f_get_expression( ls_idKey_code, 'char()', 'identification_code', 'filter')
		ll_found_dwo = vod_handle.ids_policy_rule.find(ls_findString,1 ,vod_handle.ids_policy_rule.rowcount() )
		if ll_found_dwo >=0 then
			vdw_handle.f_set_rule_attr( vod_handle.ids_policy_rule, ll_found_dwo)
		else
			gf_messagebox('m.b_rule.f_set_policy_dwctrl.01','Thông báo','Lỗi: rule.f_set_policy_dwctrl:line(42) @'+vdw_handle.dataobject,'exclamation','ok',1)
			return -1		
		end if
	end if
	
	//-- xét Phân quyền đối tượng của user đang đăng nhập --//	
//	if left(vdw_handle.dataobject,8) <> 'd_action' then
		ls_idKey_code = '.'+vod_handle.classname( )+'.'+left(vdw_handle.dataobject,len(vdw_handle.dataobject)-5) 
//	else
//		ls_idKey_code = vod_handle.classname( )+'.'+left(vdw_handle.dataobject,len(vdw_handle.dataobject) -5)
//	end if
	//-- tìm cài đặt security của dwo --//
	ll_found_dwo = vod_handle.ids_policy_security.find("identification_code ='"+ls_idKey_code +"'",1 ,vod_handle.ids_policy_security.rowcount() )
	DO while ll_found_dwo > 0 //-- Nếu user có nhiều role thì lấy hợp (OR) của các quyền --/
		lb_found = true
		vdw_handle.f_get_policy_attr(vod_handle.ids_policy_security,ll_found_dwo, lstr_policy_attr)
		lstr_policy_attr_combine.b_access = lstr_policy_attr_combine.b_access or lstr_policy_attr.b_access
		lstr_policy_attr_combine.b_delete = lstr_policy_attr_combine.b_delete or lstr_policy_attr.b_delete
		lstr_policy_attr_combine.b_insert = lstr_policy_attr_combine.b_insert or lstr_policy_attr.b_insert
		lstr_policy_attr_combine.b_update = lstr_policy_attr_combine.b_update or lstr_policy_attr.b_update
		lstr_policy_attr_combine.b_query = lstr_policy_attr_combine.b_query or lstr_policy_attr.b_query	
		lstr_policy_attr_combine.b_excel = lstr_policy_attr_combine.b_excel or lstr_policy_attr.b_excel
		lstr_policy_attr_combine.b_print = lstr_policy_attr_combine.b_print or lstr_policy_attr.b_print
		lstr_policy_attr_combine.b_full_inherit = lstr_policy_attr_combine.b_full_inherit or lstr_policy_attr.b_full_inherit	
		ll_found_dwo = vod_handle.ids_policy_security.find("identification_code ='"+ls_idKey_code +"'",ll_found_dwo+1 ,vod_handle.ids_policy_security.rowcount() +1)
	LOOP 
	//-- Tìm cài đặt security của đối tượng: khi không tìm thấy cài đặt security của dwo --//
	if not lb_found then
		ls_idKey_code = '.'+ vod_handle.classname( )
		ls_findString = lc_string.f_get_expression( ls_idKey_code, 'char()', 'identification_code', 'filter')	
		ll_found_dwo = vod_handle.ids_policy_security.find(ls_findString,1 ,vod_handle.ids_policy_security.rowcount() )
		DO while ll_found_dwo > 0 //-- Nếu user có nhiều role thì lấy hợp (OR) của các quyền --/
			vdw_handle.f_get_policy_attr(vod_handle.ids_policy_security,ll_found_dwo, lstr_policy_attr)
			lstr_policy_attr_combine.b_access = lstr_policy_attr_combine.b_access or lstr_policy_attr.b_access
			lstr_policy_attr_combine.b_delete = lstr_policy_attr_combine.b_delete or lstr_policy_attr.b_delete
			lstr_policy_attr_combine.b_insert = lstr_policy_attr_combine.b_insert or lstr_policy_attr.b_insert
			lstr_policy_attr_combine.b_update = lstr_policy_attr_combine.b_update or lstr_policy_attr.b_update
			lstr_policy_attr_combine.b_query = lstr_policy_attr_combine.b_query or lstr_policy_attr.b_query	
			lstr_policy_attr_combine.b_excel = lstr_policy_attr_combine.b_excel or lstr_policy_attr.b_excel
			lstr_policy_attr_combine.b_print = lstr_policy_attr_combine.b_print or lstr_policy_attr.b_print
			lstr_policy_attr_combine.b_full_inherit = lstr_policy_attr_combine.b_full_inherit or lstr_policy_attr.b_full_inherit			
			ll_found_dwo = vod_handle.ids_policy_security.find(ls_findString,ll_found_dwo+1 ,vod_handle.ids_policy_security.rowcount() +1)
		LOOP	
	end if	
	//-- Tìm cài đặt security theo menu code: khi không tìm thấy theo đối tượng --//
	if not lb_found then
		ls_idKey_code = vod_handle.f_get_menu_code()
		ls_findString = lc_string.f_get_expression( ls_idKey_code, 'char()', 'identification_code', 'filter')	
		ll_found_dwo = vod_handle.ids_policy_security.find(ls_findString,1 ,vod_handle.ids_policy_security.rowcount() )
		DO while ll_found_dwo > 0 //-- Nếu user có nhiều role thì lấy hợp (OR) của các quyền --/
			vdw_handle.f_get_policy_attr(vod_handle.ids_policy_security,ll_found_dwo, lstr_policy_attr)
			lstr_policy_attr_combine.b_access = lstr_policy_attr_combine.b_access or lstr_policy_attr.b_access
			lstr_policy_attr_combine.b_delete = lstr_policy_attr_combine.b_delete or lstr_policy_attr.b_delete
			lstr_policy_attr_combine.b_insert = lstr_policy_attr_combine.b_insert or lstr_policy_attr.b_insert
			lstr_policy_attr_combine.b_update = lstr_policy_attr_combine.b_update or lstr_policy_attr.b_update
			lstr_policy_attr_combine.b_query = lstr_policy_attr_combine.b_query or lstr_policy_attr.b_query	
			lstr_policy_attr_combine.b_excel = lstr_policy_attr_combine.b_excel or lstr_policy_attr.b_excel
			lstr_policy_attr_combine.b_print = lstr_policy_attr_combine.b_print or lstr_policy_attr.b_print
			lstr_policy_attr_combine.b_full_inherit = lstr_policy_attr_combine.b_full_inherit or lstr_policy_attr.b_full_inherit			
			ll_found_dwo = vod_handle.ids_policy_security.find(ls_findString,ll_found_dwo+1 ,vod_handle.ids_policy_security.rowcount() +1)
		LOOP	
	end if		
	vdw_handle.f_set_security_attr( lstr_policy_attr_combine)
	//-- set field security --//
	ls_idKey_code = '.'+vod_handle.classname( )+'.'+left(vdw_handle.dataobject,len(vdw_handle.dataobject)-5) +'.'
	ls_findString = lc_string.f_get_expression( ls_idKey_code, 'char()', 'identification_code', 'filter')	
	ll_found_dwo = vod_handle.ids_policy_security.find(ls_findString, 1 ,vod_handle.ids_policy_security.rowcount() )	
	if ll_found_dwo = 0 then
		setnull(ls_visible_fileds)
		setnull(ls_enable_fields)
	else		
		DO while ll_found_dwo > 0
			ls_fieldName = vod_handle.ids_policy_security.getitemstring(ll_found_dwo,'object_ref_code') 
			ls_fieldName = mid(ls_fieldName, pos(ls_fieldName,'.')+1)
			ls_fieldName = left(ls_fieldName, len(ls_fieldName) - 2)
			if vod_handle.ids_policy_security.getitemstring(ll_found_dwo,'QUERY_YN') = 'Y' then								
				ls_visible_fileds += ls_fieldName+';'
			end if
			if vod_handle.ids_policy_security.getitemstring(ll_found_dwo,'UPDATE_YN') = 'Y' then								
				ls_enable_fields += ls_fieldName+';'
			end if			
			ll_found_dwo = vod_handle.ids_policy_security.find(ls_findString,ll_found_dwo+1 ,vod_handle.ids_policy_security.rowcount() +1)	
		LOOP
	end if
	vdw_handle.f_set_security_fields( ls_visible_fileds, ls_enable_fields)
else
	vdw_handle.f_set_security_attr( vod_handle.ids_policy_security, 0)
	vdw_handle.f_set_rule_attr( vod_handle.ids_policy_security, 0)	
end if
return 1
end function

on b_rule.create
call super::create
end on

on b_rule.destroy
call super::destroy
end on

