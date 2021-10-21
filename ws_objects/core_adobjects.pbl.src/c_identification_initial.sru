$PBExportHeader$c_identification_initial.sru
forward
global type c_identification_initial from s_object_instantiate
end type
end forward

global type c_identification_initial from s_object_instantiate
end type

forward prototypes
public function string f_combine_code (datastore vds_indentification, long vl_row)
public function double f_get_up_id (datastore vds_indentification, string vs_code)
public function double f_get_idkey_id (string vs_menu_code)
public function double f_get_idkey_id_ex (string vs_menu_code, ref t_transaction rt_transaction)
public function string f_get_code_ex (double vdb_id, ref t_transaction rt_transaction)
public function double f_get_up_id_ex (datastore vds_indentification, string vs_code, ref t_transaction rt_transaction)
end prototypes

public function string f_combine_code (datastore vds_indentification, long vl_row);string			ls_upcode, ls_code, ls_combine_code
long			ll_uprow
any			la_value[]
t_ds_db		lds_identification

if vl_row = 0 or vds_indentification.rowcount() = 0 then return ''
//if vds_indentification.dataobject <> 'ds_identification' then
ls_code = vds_indentification.getitemstring(vl_row,'code')

if ls_combine_code <> '' then ls_combine_code = '.'+ls_combine_code
ls_combine_code = ls_code+ls_combine_code

ls_upcode = vds_indentification.getitemstring(vl_row,'up_code')
//end if
if isnull(ls_upcode) or ls_upcode = '' then 	
	return ls_combine_code
else	
	ll_uprow = vds_indentification.find("code ='"+ls_upcode+"'", 1, vds_indentification.rowcount())
	if ll_uprow > 0 then	
		ls_code = this.f_combine_code(vds_indentification , ll_uprow)
		if ls_combine_code <> '' then ls_combine_code = '.'+ls_combine_code
		ls_combine_code = ls_code +ls_combine_code
		return ls_combine_code
	else
		if vds_indentification.dataobject <> 'ds_identification' then
			lds_identification = create t_ds_db
			lds_identification.dataobject = 'ds_identification'
			la_value[1] = '=MENU'
			lds_identification.f_add_where( 'object_ref_table', la_value)
			lds_identification.settrans( sqlca)
			if lds_identification.retrieve( ) > 0 then
				ll_uprow = lds_identification.find("object_ref_code ='"+ls_upcode+"'", 1, lds_identification.rowcount())
				if ll_uprow > 0 then
					ls_code = lds_identification.getitemstring(ll_uprow,'code')
					if ls_combine_code <> '' then ls_combine_code = '.'+ls_combine_code
					ls_combine_code = ls_code + ls_combine_code
					return ls_combine_code
				end if
			else
				gf_messagebox('m.c_identification_initial.01','Thông báo','Không tìm thấy mã phân quyền cấp cha:@'+ls_upcode,'exclamation','ok',1)
				return ''
			end if
		else
			gf_messagebox('m.c_identification_initial.01','Thông báo','Không tìm thấy mã phân quyền cấp cha:@'+ls_upcode,'exclamation','ok',1)
			return ''			
		end if
	end if
end if

end function

public function double f_get_up_id (datastore vds_indentification, string vs_code);double				ldb_upID
long					ll_uprow
string					ls_up_code
int						li_dotCnt
t_ds_db		lds_identification
c_string				lc_string

if isnull(vs_code) or vs_code = '' then
	return -1
elseif pos(vs_code,'.') = 0 then
	setnull(ldb_upID)
	return ldb_upID
else
	ls_up_code = mid(vs_code,1,lastpos(vs_code,'.')-1)
end if

ll_uprow = vds_indentification.find("code = '"+ls_up_code+"'", 1, vds_indentification.rowcount())
if ll_uprow > 0 then	
	ldb_upID = vds_indentification.getitemnumber(ll_uprow,'ID')
	return ldb_upID
else
	lds_identification = create t_ds_db
	lds_identification.dataobject = 'ds_identification'
	lds_identification.settrans( sqlca)
	if lds_identification.retrieve( ) > 0 then
		ll_uprow = lds_identification.find("code = '"+ls_up_code+"'"  , 1, lds_identification.rowcount())
		if ll_uprow > 0 then
			ldb_upID = lds_identification.getitemnumber(ll_uprow,'ID')
			return ldb_upID
		else
			gf_messagebox('m.c_identification_initial.01','Thông báo','Không tìm thấy mã phân quyền cấp cha:@'+ls_up_code,'exclamation','ok',1)
			return -1			
		end if
	else
		gf_messagebox('m.c_identification_initial.01','Thông báo','Không tìm thấy mã phân quyền cấp cha:@'+ls_up_code,'exclamation','ok',1)
		return -1
	end if	
end if


end function

public function double f_get_idkey_id (string vs_menu_code);string			ls_sql, ls_modify, ls_rtn, ls_ref_code
double		ldb_ID
int				li_rtn
t_ds_db		lds_datastore

//------------------//

lds_datastore = create t_ds_db
lds_datastore.dataobject = 'ds_get_id_code_name'
lds_datastore.f_settransobject( SQLCA)

if pos(vs_menu_code,'@') > 0 and  left(vs_menu_code, 17) <> 'u_valueset_entry@' then
	ls_ref_code = mid(vs_menu_code,1, pos(vs_menu_code,'@'))
	ls_sql = "select ID,'' as Code,'' as Name from " + is_table + " where upper(object_ref_code) like '"+ upper(vs_menu_code) +"%'"
else
	ls_ref_code = vs_menu_code
	ls_sql = "select ID,'' as Code,'' as Name from " + is_table + " where upper(object_ref_code) = '"+ upper(vs_menu_code) +"'"
end if

ls_modify = 'Datawindow.Table.Select= "' + ls_sql +'"'
ls_rtn =lds_datastore.modify(ls_modify )
li_rtn = lds_datastore.retrieve( )
if li_rtn = 1 then
	ldb_ID = lds_datastore.getitemnumber( 1, 'ID')
elseif li_rtn > 1 then
	gf_messagebox('m.c_identification_initial.f_get_idkey_id.01','Thông báo','Có nhiêu hơn 1 IDKey_ID:@'+vs_menu_code,'exclamation','ok',1)
	ldb_ID = -1
elseif li_rtn = 0 then
	ldb_ID = 0
else
	gf_messagebox('m.c_identification_initial.f_get_idkey_id.02','Thông báo','Lỗi retrieve datastore:@'+vs_menu_code,'exclamation','ok',1)
	ldb_ID = -1
end if

Destroy lds_datastore
return ldb_ID
end function

public function double f_get_idkey_id_ex (string vs_menu_code, ref t_transaction rt_transaction);string			ls_sql, ls_modify, ls_rtn, ls_ref_code
double		ldb_ID
int				li_rtn
t_ds_db		lds_datastore

//------------------//

lds_datastore = create t_ds_db
lds_datastore.dataobject = 'ds_get_id_code_name'
lds_datastore.f_settransobject( rt_transaction)

if pos(vs_menu_code,'@') > 0 and  left(vs_menu_code, 17) <> 'u_valueset_entry@' then
	ls_ref_code = mid(vs_menu_code,1, pos(vs_menu_code,'@'))
	ls_sql = "select ID,'' as Code,'' as Name from " + is_table + " where upper(object_ref_code) like '"+ upper(vs_menu_code) +"%'"
else
	ls_ref_code = vs_menu_code
	ls_sql = "select ID,'' as Code,'' as Name from " + is_table + " where upper(object_ref_code) = '"+ upper(vs_menu_code) +"'"
end if

ls_modify = 'Datawindow.Table.Select= "' + ls_sql +'"'
ls_rtn =lds_datastore.modify(ls_modify )
li_rtn = lds_datastore.retrieve( )
if li_rtn = 1 then
	ldb_ID = lds_datastore.getitemnumber( 1, 'ID')
elseif li_rtn > 1 then
	gf_messagebox('m.c_identification_initial.f_get_idkey_id.01','Thông báo','Có nhiêu hơn 1 IDKey_ID:@'+vs_menu_code,'exclamation','ok',1)
	ldb_ID = -1
elseif li_rtn = 0 then
	ldb_ID = 0
else
	gf_messagebox('m.c_identification_initial.f_get_idkey_id.02','Thông báo','Lỗi retrieve datastore:@'+vs_menu_code,'exclamation','ok',1)
	ldb_ID = -1
end if

Destroy lds_datastore
return ldb_ID
end function

public function string f_get_code_ex (double vdb_id, ref t_transaction rt_transaction);string	ls_code

select code into :ls_code  from identification_key where id = :vdb_id using rt_transaction;

return ls_code
end function

public function double f_get_up_id_ex (datastore vds_indentification, string vs_code, ref t_transaction rt_transaction);double				ldb_upID
long					ll_uprow
string					ls_up_code
int						li_dotCnt
t_ds_db		lds_identification
c_string				lc_string

if isnull(vs_code) or vs_code = '' then
	return -1
elseif pos(vs_code,'.') = 0 then
	setnull(ldb_upID)
	return ldb_upID
else
	ls_up_code = mid(vs_code,1,lastpos(vs_code,'.')-1)
end if

ll_uprow = vds_indentification.find("code = '"+ls_up_code+"'", 1, vds_indentification.rowcount())
if ll_uprow > 0 then	
	ldb_upID = vds_indentification.getitemnumber(ll_uprow,'ID')
	return ldb_upID
else
	lds_identification = create t_ds_db
	lds_identification.dataobject = 'ds_identification'
	lds_identification.settrans( rt_transaction)
	if lds_identification.retrieve( ) > 0 then
		ll_uprow = lds_identification.find("code = '"+ls_up_code+"'"  , 1, lds_identification.rowcount())
		if ll_uprow > 0 then
			ldb_upID = lds_identification.getitemnumber(ll_uprow,'ID')
			return ldb_upID
		else
			gf_messagebox('m.c_identification_initial.01','Thông báo','Không tìm thấy mã phân quyền cấp cha:@'+ls_up_code,'exclamation','ok',1)
			return -1			
		end if
	else
		gf_messagebox('m.c_identification_initial.01','Thông báo','Không tìm thấy mã phân quyền cấp cha:@'+ls_up_code,'exclamation','ok',1)
		return -1
	end if	
end if


end function

on c_identification_initial.create
call super::create
end on

on c_identification_initial.destroy
call super::destroy
end on

event constructor;call super::constructor;
is_table = 'identification_key'
end event

