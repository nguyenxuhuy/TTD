$PBExportHeader$b_interface.sru
forward
global type b_interface from s_object_display
end type
end forward

global type b_interface from s_object_display
end type
global b_interface b_interface

forward prototypes
public function integer f_load_excelfile (ref oleobject role_excel)
public function integer f_load_worksheet2datastore (oleobject vole_worksheet, ref t_ds_db rds_interface, long vl_startrow, long vl_startcolumn)
public function integer f_chk_interface_duplicated_data (ref t_dw_mpl rdw_interface, string vs_chk_colname, t_ds_db vds_source_data, string vs_source_colname)
public function integer f_chk_interface_foreignkey (ref t_dw_mpl rdw_interface, string vs_chk_colname, t_ds_db vds_source_data, string vs_source_colname)
public function integer f_set_check_text (ref t_dw_mpl rdw_interface, string vs_chk_colname, long vl_row, string vs_chk_text)
public function integer f_chk_interface_must_data (ref t_dw_mpl rdw_interface)
public function double f_insert_table (string vs_table, string vs_colnames, string vs_values, ref t_transaction rt_transaction)
public function integer f_update_m_ref_value (string vs_m_table, string vs_m_ref_col, string vs_ref_coltype, string vs_ref_values, double vdb_id, ref t_transaction rt_transaction)
public function integer f_get_interface_values (ref t_dw_mpl rdw_interface, long vl_row, string vs_colnames, string vs_fk_col, string vs_pk_col, t_ds_db vds_fk_data[], ref string rs_values, string vs_ref_col, ref string rs_ref_values, ref string rs_ref_coltype)
public function string f_get_interface_fk_value (string vs_fk_col, string vs_pk_col, t_ds_db vds_fk_data[], string vs_colname, string vs_value)
public function long f_import_data (ref t_transaction rt_transaction, ref t_dw_mpl rdw_interface, string vs_m_table, string vs_m_colnames, string vs_mt_colnames, string vs_m_refcol, string vs_m_fk_col, string vs_m_pk_col, t_ds_db vds_m_fk_data[], string vs_d1_table, string vs_d1_colnames, string vs_d1t_colnames, string vs_d1_ref_col, string vs_d1_fk_col, string vs_d1_pk_col, t_ds_db vds_d1_fk_data[], string vs_d2_table, string vs_d2_colnames, string vs_d2t_colnames, string vs_d2_fk_col, string vs_d2_pk_col, t_ds_db vds_d2_fk_data[], string vs_d3_table, string vs_d3_colnames, string vs_d3t_colnames, string vs_d3_fk_col, string vs_d3_pk_col, t_ds_db vds_d3_fk_data[])
public function double f_update_table (string vs_table, string vs_dw_colnames, string vs_dw_unique_colnames, string vs_table_colnames, string vs_values, ref t_transaction rt_transaction)
public function integer f_get_interface_values (ref t_dw_mpl rdw_interface, long vl_row, ref s_str_import rstr_import)
public function long f_import_data (ref t_transaction rt_transaction, ref t_dw_mpl rdw_interface, long vl_row, ref s_str_import rstr_master, ref s_str_import rstr_detail[], boolean vb_imp_master, ref string rs_m_values, ref string ras_d_values[])
public function integer f_chk_interface_exists_data (ref t_dw_mpl rdw_interface, string vs_chk_colname, t_ds_db vds_source_data, string vs_source_colname)
public function integer f_update_data (ref t_transaction rt_transaction, t_dw_mpl vdw_interface, long vl_importrow, s_str_import vstr_update, s_str_import vstr_master, double vdb_master_id, string vs_obj_type)
end prototypes

public function integer f_load_excelfile (ref oleobject role_excel);string 	ls_path_name, ls_file_name, ls_excelversion, ls_curdir
integer 	li_rtn

if not isvalid(role_excel) then return 0

ls_curdir = GetCurrentDirectory()
li_rtn = GetFileOpenName("Open File",ls_path_name, ls_file_name, "XLS", "Excel Files (*.xls),*.xls,"+ "Excel Files (*.xlsx),*.xlsx")

If li_rtn < 1 Then return -1
ChangeDirectory(ls_curdir)


RegistryGet("HKEY_CLASSES_ROOT\Excel.Application\CurVer","",RegString!,ls_excelversion) // lấy version hiện tại của office
li_rtn = role_excel.ConnectToNewObject(ls_excelversion)
if li_rtn <> 0 then
		MessageBox( "Error", 'Error running MS Excel api.')
		destroy role_excel
		return -1
end if
 role_excel.WorkBooks.Open(ls_path_name)


return 1
end function

public function integer f_load_worksheet2datastore (oleobject vole_worksheet, ref t_ds_db rds_interface, long vl_startrow, long vl_startcolumn);
int				li_colCnt, l_i
string			ls_excelVal, ls_col_type, ls_col_name, ls_col_title
long			ll_insertrow, ll_xlsrow, ll_xlscol
boolean		lb_EOF
c_string		lc_string
t_ds_db		lds_user_profile


ll_xlsrow = vl_startrow
ll_xlscol = vl_startcolumn

lds_user_profile= create t_ds_db
lds_user_profile.dataobject = 'ds_user_profile'
lds_user_profile.f_add_where(" dwobject =  ~~'"+rds_interface.dataobject+"~~'" + " AND user_id = " + string(gi_userid) , ' AND ')
lds_user_profile.f_settransobject( sqlca)
lds_user_profile.setsort("TABSEQ A" )
li_colCnt = lds_user_profile.retrieve( )
if li_colCnt = 0 then
	gf_messagebox('m.b_interface.f_load_worksheet2datastore.01','Thông báo','Chưa lưu user profile của bảng nạp liệu','exclamation','ok',1)
	return -1
end if
DO while not lb_EOF	
	lb_EOF = true   //--là dòng sau cùng --//	
	ll_xlsrow++
	FOR l_i = 1 to li_colCnt
		ll_xlscol = vl_startrow + l_i
		ls_excelVal = string(vole_worksheet.cells(ll_xlsrow,ll_xlscol).value)
		ls_excelVal = lc_string.f_removespecialchar( ls_excelVal)
		ls_excelVal = lc_string.f_remove_doublewhitespace(ls_excelVal )
		
		if ls_excelVal <>'' and not isnull(ls_excelVal) then
			if lb_EOF then
				lb_EOF = false // không phải là dòng cuối --//	
				ll_insertrow = rds_interface.event e_addrow()
				rds_interface.setitem(ll_insertrow, 'ID', this.f_create_id( ) )
			end if				 		 
		else
			continue 
		end if
		ls_col_name = lds_user_profile.getitemstring( l_i, 'DWCONTROL')
		ls_col_type = lower(rds_interface.describe(ls_col_name + ".coltype"))
		ls_col_type = left(ls_col_type,5)
			
		choose case ls_col_type
			case "date"
				if not isdate(ls_excelVal) then
					ls_col_title = rds_interface.describe(ls_col_name+'_t.text')	
					gf_messagebox('m.b_interface.f_load_worksheet2datastore.02','Thông báo','Lỗi dữ liệu: dữ liệu sau không phải là ngày tháng:@'+ls_col_title+'@-'+ls_excelVal, 'exclamtion','ok',1)
					return -1
				end if
				rds_interface.setitem( ll_insertrow,ls_col_name, date(ls_excelVal))
			case "datet"
				rds_interface.setitem( ll_insertrow, ls_col_name, datetime(ls_excelVal))
			case "char","char("
				rds_interface.setitem( ll_insertrow, ls_col_name, ls_excelVal)
			case "numbe"
				if not isnumber(ls_excelVal) then
					ls_col_title = rds_interface.describe(ls_col_name+'_t.text')						
					gf_messagebox('m.b_interface.f_load_worksheet2datastore.03','Thông báo','Lỗi dữ liệu: dữ liệu sau không phải là số:@'+ls_col_title+'@-'+ls_excelVal, 'exclamtion','ok',1)
					return -1
				end if
				rds_interface.setitem( ll_insertrow,ls_col_name,double(ls_excelVal))
		end choose	
	NEXT
	
LOOP
destroy lds_user_profile

return 1
end function

public function integer f_chk_interface_duplicated_data (ref t_dw_mpl rdw_interface, string vs_chk_colname, t_ds_db vds_source_data, string vs_source_colname);
long		ll_chk_row, ll_duplicate_row
string		ls_error, ls_coltext, ls_data, ls_coltype, ls_data_prev, ls_colname

ls_coltype = rdw_interface.describe(vs_chk_colname+".coltype")
if left(ls_coltype,4) <> 'char' then
	gf_messagebox('m.b_interface.f_chk_interface_duplicated_data.01','Thông báo','Cột kiểm tra trùng dữ liệu không phải kiểu chuỗi:@'+vs_chk_colname, 'exclamtion','ok',1)
	return -1
end if
rdw_interface.setsort(vs_chk_colname +" A")
rdw_interface.sort()

FOR ll_chk_row =1 to rdw_interface.rowcount()
	ls_data = rdw_interface.getitemstring(ll_chk_row, vs_chk_colname)
//	if ls_data_prev = ls_data then
//		this.f_set_check_text( rdw_interface,vs_chk_colname, ll_chk_row, "Trùng dữ liệu, cột ")
//	else
		ll_duplicate_row = vds_source_data.find(vs_source_colname+" = '"+ls_data+"'", 1, vds_source_data.rowcount() )
		if ll_duplicate_row > 0 then
			this.f_set_check_text( rdw_interface,vs_chk_colname, ll_chk_row, "Trùng với dữ liệu đã có, cột ")
		else
			this.f_set_check_text( rdw_interface,vs_chk_colname, ll_chk_row, "OK")
		end if
//	end if
	ls_data_prev = ls_data
NEXT

return 1
end function

public function integer f_chk_interface_foreignkey (ref t_dw_mpl rdw_interface, string vs_chk_colname, t_ds_db vds_source_data, string vs_source_colname);
long		ll_chk_row, ll_found_row
string		ls_error, ls_coltext, ls_data, ls_coltype

ls_coltype = rdw_interface.describe(vs_chk_colname+".coltype")
if left(ls_coltype,4) <> 'char' then
	gf_messagebox('m.b_interface.f_chk_interface_duplicated_data.01','Thông báo','Cột kiểm tra dữ liệu foreignkey không phải kiểu chuỗi:@'+vs_chk_colname, 'exclamtion','ok',1)
	return -1
end if

FOR ll_chk_row =1 to rdw_interface.rowcount()
	ls_data = rdw_interface.getitemstring(ll_chk_row, vs_chk_colname)

	ll_found_row = vds_source_data.find(vs_source_colname+" = '"+ls_data+"'", 1, vds_source_data.rowcount() )
	if ll_found_row = 0 then
		this.f_set_check_text( rdw_interface,vs_chk_colname, ll_chk_row, "Chưa có dữ liệu master, cột")
	else		
		this.f_set_check_text( rdw_interface,vs_chk_colname, ll_chk_row, "OK")
	end if

NEXT

return 1
end function

public function integer f_set_check_text (ref t_dw_mpl rdw_interface, string vs_chk_colname, long vl_row, string vs_chk_text);

string		ls_error, ls_coltext, ls_chk_text


ls_chk_text = upper(trim(vs_chk_text))
if ls_chk_text = 'OK' then
	ls_error = rdw_interface.getitemstring(vl_row, 'chk_text')
	if isnull(ls_error) or ls_error ='' then
		rdw_interface.setitem(vl_row, 'chk_text', 'OK')
	end if	
else
	ls_coltext = rdw_interface.describe(vs_chk_colname+"_t.text")		
	ls_error = rdw_interface.getitemstring(vl_row, 'chk_text')
	if isnull(ls_error) then ls_error =''
	if ls_error <> '' then ls_error += ';'		
	ls_error = vs_chk_text +':'+ls_coltext
	rdw_interface.setitem(vl_row, 'chk_text', ls_error)
end if

return 1
end function

public function integer f_chk_interface_must_data (ref t_dw_mpl rdw_interface);int			li_cnt, li_idx
long		ll_chk_row
string		ls_must_save_string, lsa_colname[], ls_coltype


li_cnt = rdw_interface.f_get_visiblecolumns(lsa_colname[])

FOR li_idx =1 to li_cnt
	ls_must_save_string =  this.idwsetup_initial.f_get_must_save_string(rdw_interface.dataobject, lsa_colname[li_idx], ls_coltype)			
	if ls_must_save_string = 'yes' then		
		ll_chk_row = rdw_interface.find("isnull("+ lsa_colname[li_idx]+")", 1, rdw_interface.rowcount())
		DO while ll_chk_row > 0
			this.f_set_check_text( rdw_interface,lsa_colname[li_idx], ll_chk_row, "Chưa có dữ liệu, cột ")			
			ll_chk_row = rdw_interface.find(" isnull(" + lsa_colname[li_idx]+")", ll_chk_row+1, rdw_interface.rowcount()+1)
		LOOP
	end if
NEXT

return 1
end function

public function double f_insert_table (string vs_table, string vs_colnames, string vs_values, ref t_transaction rt_transaction);int			li_colCnt, li_idx
string		ls_insertSQL, lsa_colname[], lsa_value[], ls_SETclause, ls_WHEREclause, ls_unique_colnames

c_string	lc_string

//-- update--//
vs_values = lc_string.f_globalreplace( vs_values, ';', ',')
//vs_values = lc_string.f_globalreplace( vs_values, "'", ' ')
ls_insertSQL = " INSERT INTO "+vs_table+"("+ vs_colnames +")" +&
					"VALUES ("+ vs_values +")"

EXECUTE IMMEDIATE :ls_insertSQL using rt_transaction;

if rt_transaction.sqlcode < 0 then
	gf_messagebox('m.b_interface.f_insert_table.01','Thông báo','Lỗi insert dữ liệu:@'+rt_transaction.sqlerrtext,'stop','ok',1)
	rollback using rt_transaction;
	return -1
end if
return 1
end function

public function integer f_update_m_ref_value (string vs_m_table, string vs_m_ref_col, string vs_ref_coltype, string vs_ref_values, double vdb_id, ref t_transaction rt_transaction);int			li_cnt, li_idx
string		ls_updateSQL, lsa_colname[], lsa_value[], ls_set_clause, lsa_ref_coltype[]


c_string	lc_string

li_cnt = lc_string.f_stringtoarray(vs_m_ref_col , ',', lsa_colname[])
li_cnt = lc_string.f_stringtoarray(vs_ref_coltype , ',', lsa_ref_coltype[])
li_cnt = lc_string.f_stringtoarray(vs_ref_values , ';', lsa_value[])

FOR li_idx = 1 to li_cnt
	if ls_set_clause <> '' then ls_set_clause +=','
	if left(lsa_ref_coltype[li_idx],5) = 'numbe' then
		ls_set_clause +=  lsa_colname[li_idx] +" = " + lsa_value[li_idx]	
	elseif  left(lsa_ref_coltype[li_idx],5) = 'char(' then
		ls_set_clause +=  lsa_colname[li_idx] +" = '" + lsa_value[li_idx]+ "'"
	end if
NEXT

ls_updateSQL = " UPDATE "+vs_m_table+" SET " + ls_set_clause + " WHERE ID = " + string(vdb_id)
				
EXECUTE IMMEDIATE :ls_updateSQL using rt_transaction;

if rt_transaction.sqlcode < 0 then
	gf_messagebox('m.b_interface.f_update_m_ref_value.01','Thông báo','Lỗi insert dữ liệu:@'+rt_transaction.sqlerrtext,'stop','ok',1)
	rollback using rt_transaction;
	return -1
end if

return 1
end function

public function integer f_get_interface_values (ref t_dw_mpl rdw_interface, long vl_row, string vs_colnames, string vs_fk_col, string vs_pk_col, t_ds_db vds_fk_data[], ref string rs_values, string vs_ref_col, ref string rs_ref_values, ref string rs_ref_coltype);
string			lsa_colname[], ls_value, ls_fk_col, ls_fk_value, ls_ref_col, ls_coltype, ls_coltag
int				li_colCnt, li_idx, li_ref_colCnt

c_string		lc_string

ls_fk_col = lc_string.f_removesqlwhitespace(vs_fk_col )
if right(ls_fk_col,1) <> ',' then ls_fk_col += ','

if vs_ref_col <> '' then
	ls_ref_col =  lc_string.f_removesqlwhitespace(vs_ref_col )
	if right(ls_ref_col,1) <> ',' then ls_ref_col += ','
end if

li_colCnt = lc_string.f_stringtoarray( vs_colnames, ',', lsa_colname[])

FOR li_idx = 1 to li_colCnt
	ls_coltype = rdw_interface.describe(lsa_colname[li_idx] +'.coltype')
	if  left(ls_coltype,4) ='date' then
		ls_coltag =  rdw_interface.describe(lsa_colname[li_idx] +'.tag')
		if ls_coltag = 'date' then
			ls_value = string(date(rdw_interface.f_getitemany(vl_row,  lsa_colname[li_idx])))
		else
			ls_value = string(rdw_interface.f_getitemany(vl_row,  lsa_colname[li_idx]))
		end if
	else 
		ls_value = string(rdw_interface.f_getitemany(vl_row,  lsa_colname[li_idx]))
	end if
//	if left(ls_coltype,4) ='date' then
//	end if
	if isnull(ls_value) then ls_value = 'NULL'

	//-- lấy fk value --//
	if pos(ls_fk_col, lsa_colname[li_idx] + ',' ) > 0 and ls_value <> 'NULL' then 
		ls_value = this.f_get_interface_fk_value(ls_fk_col,vs_pk_col, vds_fk_data[],  lsa_colname[li_idx], ls_value)
	else 
		if ls_value <> 'NULL' then
			if  left(ls_coltype,4) ='char' then
				ls_value = lc_string.f_globalreplace( ls_value, "'", "''")
				ls_value = "~'"+ls_value +"~'"
			elseif left(ls_coltype,5) ='date' then
				ls_value = "to_date('"+ls_value+"','"+gs_w_date_format+"')"
			elseif left(ls_coltype,5) ='datet' then
				ls_coltag =  rdw_interface.describe(lsa_colname[li_idx] +'.tag')
				if ls_coltag = 'date' then
					ls_value = "to_date('"+ls_value+"','"+gs_w_date_format+"')"
				else
					ls_value = "to_date('"+ls_value+"','"+gs_w_date_format+" hh24:mi:ss')"
				end if
			end if		
		end if
	end if
	if ls_ref_col <> '' then
		if pos(ls_ref_col,lsa_colname[li_idx] + ',' ) > 0 then
			if rs_ref_values <> '' then rs_ref_values += ';'
			rs_ref_values += ls_value
			
			if rs_ref_coltype <> '' then rs_ref_coltype += ';'
			rs_ref_coltype += ls_coltype
		end if
	end if
	
	if rs_values <> '' then rs_values += ';'
	rs_values += ls_value
NEXT
return 1
end function

public function string f_get_interface_fk_value (string vs_fk_col, string vs_pk_col, t_ds_db vds_fk_data[], string vs_colname, string vs_value);
string			lsa_fk_col[],lsa_pk_col[], ls_value
int				li_idx, li_ref_colCnt
long			ll_found

c_string		lc_string

li_ref_colCnt = lc_string.f_stringtoarray( vs_pk_col, ',', lsa_pk_col[])
li_ref_colCnt = lc_string.f_stringtoarray( vs_fk_col, ',', lsa_fk_col[])

FOR li_idx = 1 to li_ref_colCnt
	if trim(vs_colname) = trim(lsa_fk_col[li_idx]) then
		ll_found = vds_fk_data[li_idx].find(lsa_pk_col[li_idx]+"= '"+vs_value +"'", 1, vds_fk_data[li_idx].rowcount())
		if ll_found > 0 then
			ls_value =  string(vds_fk_data[li_idx].getitemnumber(ll_found, 'ID' ))
			return ls_value
		end if		
	end if
NEXT
return 'NULL'
end function

public function long f_import_data (ref t_transaction rt_transaction, ref t_dw_mpl rdw_interface, string vs_m_table, string vs_m_colnames, string vs_mt_colnames, string vs_m_refcol, string vs_m_fk_col, string vs_m_pk_col, t_ds_db vds_m_fk_data[], string vs_d1_table, string vs_d1_colnames, string vs_d1t_colnames, string vs_d1_ref_col, string vs_d1_fk_col, string vs_d1_pk_col, t_ds_db vds_d1_fk_data[], string vs_d2_table, string vs_d2_colnames, string vs_d2t_colnames, string vs_d2_fk_col, string vs_d2_pk_col, t_ds_db vds_d2_fk_data[], string vs_d3_table, string vs_d3_colnames, string vs_d3t_colnames, string vs_d3_fk_col, string vs_d3_pk_col, t_ds_db vds_d3_fk_data[]);int			li_cnt, li_idx
long		ll_chk_row, ll_rowcnt, ll_rtn
string		ls_chk_text, lsa_colname[], ls_values, ls_ref_values, ls_ref_coltype, ls_m_values,ls_d1_values,ls_d2_values
string		ls_mt_colnames, ls_d1t_colnames, ls_d2t_colnames, ls_d3t_colnames, ls_m_colnames
string		ls_m_sortString, ls_d1_sortString,ls_d2_sortString,  lsa_empty[], ls_unique_colnames
double	ldb_id, ldb_object_ref_id, ldb_m_id
c_string	lc_string


if vs_d1_table <> '' then	
	li_cnt = lc_string.f_stringtoarray( vs_m_colnames, ',', lsa_colname[])
	for li_idx =1 to li_cnt
		if ls_m_sortString <> '' then ls_m_sortString +=','
		ls_m_sortString += lsa_colname[li_cnt] + ' a'
	next		
end if
if vs_d2_table <> '' then
	lsa_colname[] =  lsa_empty[]
	li_cnt = lc_string.f_stringtoarray( vs_d1_colnames, ',', lsa_colname[])
	for li_idx =1 to li_cnt
		if ls_d1_sortString <> '' then ls_d1_sortString +=','
		ls_d1_sortString += lsa_colname[li_cnt] + ' a'
	next
end if
if vs_d3_table <> '' then
	lsa_colname[] =  lsa_empty[]
	li_cnt = lc_string.f_stringtoarray( vs_d2_colnames, ',', lsa_colname[])
	for li_idx =1 to li_cnt
		if ls_d2_sortString <> '' then ls_d2_sortString +=','
		ls_d2_sortString += lsa_colname[li_cnt] + ' a'
	next
end if

this.idwsetup_initial.f_get_unique_colnames(rdw_interface, ls_unique_colnames)

lsa_colname[] =  lsa_empty[]
li_cnt = rdw_interface.f_get_visiblecolumns(lsa_colname[])

ll_chk_row = rdw_interface.find(" chk_text = 'OK'", 1 ,rdw_interface.rowcount())
DO while ll_chk_row > 0
	//-- kiểm tra record mới của master --//
	//-- import master --//
	ls_values = ''
	if ls_m_sortString <> '' then 
		rdw_interface.setsort(ls_m_sortString)
		rdw_interface.sort()
	end if
	ldb_id = rdw_interface.getitemnumber(ll_chk_row, 'ID')	
	if this.f_get_interface_values( rdw_interface, ll_chk_row, vs_m_colnames, vs_m_fk_col,vs_m_pk_col, vds_m_fk_data[], ls_values,'',ls_ref_values, ls_ref_coltype ) = -1 then return -1
	if ls_m_values <> ls_values then 
		ls_m_values = ls_values
		//-- thêm id --//
		IF vs_d1_table = '' THEN
			ls_mt_colnames = 'ID, ' + vs_mt_colnames
			ls_m_colnames = 'ID, ' + vs_m_colnames
			ls_values = string(ldb_id) + ";" + ls_values			
		ELSE
			ls_mt_colnames = 'ID, OBJECT_REF_TABLE,' + vs_mt_colnames
			ls_m_colnames = 'ID, OBJECT_REF_TABLE,' + vs_m_colnames
			ls_values = string(ldb_id) + ";'"+vs_d1_table+"';" + ls_values	
		END IF
		if ls_unique_colnames = '' then
			if this.f_insert_table( vs_m_table, ls_mt_colnames, ls_values, rt_transaction) = -1 then return -1
		else
			ll_rtn = this.f_update_table( vs_m_table,ls_m_colnames, ls_unique_colnames, ls_mt_colnames, ls_values, rt_transaction)
			if ll_rtn = 0 then
				if this.f_insert_table( vs_m_table, ls_mt_colnames, ls_values, rt_transaction) = -1 then return -1
			elseif  ll_rtn = -1 then
				return -1
			end if
		end if		
		ldb_m_id = ldb_id
	end if
	
	//-- import d1 --//
	if vs_d1_table <> '' then
		ls_values = ''
		ls_ref_values = ''
		ldb_id = this.f_create_id( )		
		if ls_d1_sortString <> '' then 
			rdw_interface.setsort(ls_d1_sortString)
			rdw_interface.sort()
		end if		
		if this.f_get_interface_values( rdw_interface, ll_chk_row, vs_d1_colnames, vs_d1_fk_col,vs_d1_pk_col, vds_d1_fk_data[], ls_values, vs_d1_ref_col, ls_ref_values,ls_ref_coltype) = -1 then return -1
		//-- them id, object_ref_id và object_ref_table --//
		if ls_d1_values <> ls_values+';'+string(ldb_m_id) then 
			ls_d1_values = ls_values //-- ghi nhớ lại giá trị record --//
			ls_d1t_colnames = 'id, object_ref_id,object_ref_table,' + vs_d1t_colnames
			ls_values = string(ldb_id) + ','+ string(ldb_m_id) + ",'"+vs_m_table+"',"+ls_values
			if  this.f_insert_table( vs_d1_table, ls_d1t_colnames, ls_values, rt_transaction) = -1 then return -1			
			ldb_object_ref_id = ldb_id
			ls_d1_values += ';'+string(ldb_m_id) //-- cộng thêm id master để phân biệt với dòng kế
			//-- update master ref_col --//
			if vs_m_refcol <> '' then
				this.f_update_m_ref_value(vs_m_table , vs_m_refcol,ls_ref_coltype, ls_ref_values, ldb_m_id, rt_transaction)
			end if
		end if
	end if
	
	//-- import d2 --//
	if vs_d2_table <> '' then
		ls_values = ''
		ls_ref_values = ''
		ldb_id = this.f_create_id( )		
		if ls_d2_sortString <> '' then 
			rdw_interface.setsort(ls_d1_sortString)
			rdw_interface.sort()
		end if				
		if this.f_get_interface_values( rdw_interface, ll_chk_row, vs_d2_colnames, vs_d2_fk_col, vs_d2_pk_col, vds_d2_fk_data[], ls_values, '', ls_ref_values,ls_ref_coltype) = -1 then return -1
		//-- them id, object_ref_id và object_ref_table --//
		if ls_d2_values <> ls_values then 
			ls_d2_values = ls_values
			ls_d2t_colnames = 'id, object_ref_id,object_ref_table,' + vs_d2t_colnames
			ls_values = string(ldb_id) + ','+ string(ldb_object_ref_id) + ",'"+vs_d1_table+"',"+ls_values		
			if this.f_insert_table( vs_d2_table, ls_d2t_colnames, ls_values, rt_transaction) = -1 then return -1	
			ldb_object_ref_id = ldb_id
			ls_d2_values += ';'+string(ldb_m_id) //-- cộng thêm id master để phân biệt với dòng kế
		end if
	end if
	
	//-- import d3 --//
	if vs_d3_table <> '' then
		ls_values = ''
		ls_ref_values = ''
		ldb_id = this.f_create_id( )
		if this.f_get_interface_values( rdw_interface, ll_chk_row, vs_d3_colnames, vs_d3_fk_col,vs_d3_pk_col, vds_d3_fk_data[], ls_values, '', ls_ref_values,ls_ref_coltype) = -1 then return -1
		//-- them id, object_ref_id và object_ref_table --//
		ls_d3t_colnames = 'id, object_ref_id,object_ref_table,' + vs_d3t_colnames
		ls_values = string(ldb_id) + ','+ string(ldb_object_ref_id) + ",'"+vs_d2_table+"',"+ls_values
		if this.f_insert_table( vs_d3_table, ls_d3t_colnames, ls_values, rt_transaction) = -1 then return -1	
	//	ls_d2_values += ';'+string(ldb_m_id) //-- cộng thêm id master để phân biệt với dòng kế
	end if
	
	//--delete interface record đã import --//
	rdw_interface.deleterow(ll_chk_row)
	ll_rowcnt ++
	//-- tìm recod tiếp theo--//
	ll_chk_row = rdw_interface.find(" chk_text = 'OK'", ll_chk_row ,rdw_interface.rowcount()+1)
LOOP

return ll_rowcnt
end function

public function double f_update_table (string vs_table, string vs_dw_colnames, string vs_dw_unique_colnames, string vs_table_colnames, string vs_values, ref t_transaction rt_transaction);int			li_colCnt, li_idx
string		ls_updateSQL, lsa_colname[], lsa_value[], ls_SETclause, ls_WHEREclause, lsa_dw_colname[]

c_string	lc_string

//-- update--//
vs_dw_unique_colnames = lc_string.f_removewhitespace( vs_dw_unique_colnames)
if right( vs_dw_unique_colnames,1) <> ';' then vs_dw_unique_colnames += ';'
vs_dw_unique_colnames = upper(vs_dw_unique_colnames)

li_colCnt = lc_string.f_stringtoarray( vs_dw_colnames, ',', lsa_dw_colname[])
li_colCnt = lc_string.f_stringtoarray( vs_table_colnames, ',', lsa_colname[])
li_colCnt = lc_string.f_stringtoarray( vs_values, ';', lsa_value[])
FOR li_idx = 1 to li_colCnt
	if upper(trim(lsa_colname[li_idx])) = 'ID' or  lower(trim(lsa_colname[li_idx])) = 'branch_id' then continue 
	if pos( vs_dw_unique_colnames, upper(lsa_dw_colname[li_idx]) + ';') > 0 then
		if ls_WHEREclause <> '' then 
			ls_WHEREclause += ' AND '
		else
			ls_WHEREclause =  ' WHERE '
		end if
		if  lsa_value[li_idx] = 'NULL' then
			ls_WHEREclause += lsa_colname[li_idx] + ' is ' + lsa_value[li_idx]
		else
			ls_WHEREclause += lsa_colname[li_idx] + ' = ' + lsa_value[li_idx]
		end if
	else		
		if ls_SETclause <> '' then 
			ls_SETclause += ', '
		else 
			ls_SETclause = ' SET '
		end if
		ls_SETclause +=  lsa_colname[li_idx] + ' = ' + lsa_value[li_idx]
	end if
NEXT

ls_updateSQL = " UPDATE  " + vs_table + ls_SETclause + ls_WHEREclause

EXECUTE IMMEDIATE :ls_updateSQL using rt_transaction;

if rt_transaction.sqlcode < 0 then
	gf_messagebox('m.b_interface.f_update_table.01','Thông báo','Lỗi update dữ liệu:@'+rt_transaction.sqlerrtext,'stop','ok',1)
	rollback using rt_transaction;
	return -1
end if
return rt_transaction.sqlnrows
end function

public function integer f_get_interface_values (ref t_dw_mpl rdw_interface, long vl_row, ref s_str_import rstr_import);
string			lsa_colname[], ls_value, ls_fk_col, ls_fk_value, ls_ref_col, ls_coltype, ls_coltag
int				li_colCnt, li_idx, li_ref_colCnt

c_string		lc_string

ls_fk_col = lc_string.f_removesqlwhitespace(rstr_import.s_fk_colnames )
if right(ls_fk_col,1) <> ',' then ls_fk_col += ','

if rstr_import.s_ref_d_col  <> '' then
	ls_ref_col =  lc_string.f_removesqlwhitespace(rstr_import.s_ref_d_col )
	if right(ls_ref_col,1) <> ',' then ls_ref_col += ','
end if

li_colCnt = lc_string.f_stringtoarray( rstr_import.s_dwi_colnames , ',', lsa_colname[])

FOR li_idx = 1 to li_colCnt
	ls_coltype = rdw_interface.describe(lsa_colname[li_idx] +'.coltype')
	if  left(ls_coltype,4) ='date' then
		ls_coltag =  rdw_interface.describe(lsa_colname[li_idx] +'.tag')
		if ls_coltag = 'date' then
			ls_value = string(date(rdw_interface.f_getitemany(vl_row,  lsa_colname[li_idx])))
		else
			ls_value = string(rdw_interface.f_getitemany(vl_row,  lsa_colname[li_idx]))
		end if
	else 
		ls_value = string(rdw_interface.f_getitemany(vl_row,  lsa_colname[li_idx]))
	end if
	if isnull(ls_value) then ls_value = 'NULL'

	//-- lấy fk value --//
	if pos(ls_fk_col, lsa_colname[li_idx] + ',' ) > 0 and ls_value <> 'NULL' then 
		ls_value = this.f_get_interface_fk_value(ls_fk_col,rstr_import.s_pk_colnames , rstr_import.ds_pk_data[],  lsa_colname[li_idx], ls_value)
	else 
		if ls_value <> 'NULL' then
			if  left(ls_coltype,4) ='char' then
				ls_value = "~'"+ls_value +"~'"
			elseif left(ls_coltype,5) ='date' then
				ls_value = "to_date('"+ls_value+"','"+gs_w_date_format+"')"
			elseif left(ls_coltype,5) ='datet' then
				ls_coltag =  rdw_interface.describe(lsa_colname[li_idx] +'.tag')
				if ls_coltag = 'date' then
					ls_value = "to_date('"+ls_value+"','"+gs_w_date_format+"')"
				else
					ls_value = "to_date('"+ls_value+"','"+gs_w_date_format+" hh24:mi:ss')"
				end if
			end if		
		end if
	end if
	if ls_ref_col <> '' then
		if pos(ls_ref_col,lsa_colname[li_idx] + ',' ) > 0 then
			if rstr_import.s_ref_val <> '' then rstr_import.s_ref_val += ';'
			rstr_import.s_ref_val += ls_value
			
			if rstr_import.s_ref_coltype <> '' then rstr_import.s_ref_coltype += ';'
			rstr_import.s_ref_coltype += ls_coltype
		end if
	end if
	
	if rstr_import.s_imported_val <> '' then rstr_import.s_imported_val += ';'
	rstr_import.s_imported_val += ls_value
	if pos( 'created_by;created_date;last_mdf_by;last_mdf_date;', lower(lsa_colname[li_idx])+';' ) = 0 then 
		if rstr_import.s_imported_master_chk <> '' then rstr_import.s_imported_master_chk += ';'
		rstr_import.s_imported_master_chk += ls_value
	end if
NEXT
return 1
end function

public function long f_import_data (ref t_transaction rt_transaction, ref t_dw_mpl rdw_interface, long vl_row, ref s_str_import rstr_master, ref s_str_import rstr_detail[], boolean vb_imp_master, ref string rs_m_values, ref string ras_d_values[]);double 			ldb_id
long				ll_rowcnt, ll_rtn
string				 ls_t_colnames, ls_dwi_colnames,ls_unique_colnames,ls_val_d,ls_val_m
int					li_idx

if  upperbound(rstr_detail[]) = 0 then 
	this.idwsetup_initial.f_get_unique_colnames(rdw_interface, ls_unique_colnames)
end if

//-- kiểm tra record mới của master --//
if vb_imp_master then
	ldb_id = rdw_interface.getitemnumber(vl_row, 'ID')	
	 rstr_master.s_imported_master_chk = ''
	if this.f_get_interface_values( rdw_interface, vl_row,rstr_master) = -1 then return -1

	if rs_m_values <> rstr_master.s_imported_master_chk then 
		rstr_master.s_changed_val = true
		rs_m_values = rstr_master.s_imported_master_chk
		//-- thêm id --//
		IF upperbound(rstr_detail[]) <> 1 THEN
			ls_t_colnames = 'ID, ' + rstr_master.s_t_colnames
			ls_dwi_colnames = 'ID, ' + rstr_master.s_dwi_colnames
			ls_val_m = string(ldb_id) + ";" +  rstr_master.s_imported_val			
		ELSE
			ls_t_colnames = 'ID, OBJECT_REF_TABLE,' + rstr_master.s_t_colnames
			ls_dwi_colnames = 'ID, OBJECT_REF_TABLE,' +rstr_master.s_dwi_colnames
			ls_val_m = string(ldb_id) + ",'"+rstr_detail[1].s_table+"'," + rstr_master.s_imported_val		
		END IF
		if ls_unique_colnames = '' then
			if this.f_insert_table( rstr_master.s_table, ls_t_colnames, ls_val_m, rt_transaction) = -1 then return -1
		else
			ll_rtn = this.f_update_table( rstr_master.s_table,ls_dwi_colnames, ls_unique_colnames, ls_t_colnames, ls_val_m, rt_transaction)
			if ll_rtn = 0 then
				if this.f_insert_table(  rstr_master.s_table, ls_t_colnames, ls_val_m, rt_transaction) = -1 then return -1
			elseif  ll_rtn = -1 then
				return -1
			end if
		end if		
		rstr_master.db_imported_id = ldb_id
	end if
end if

//-- import d1 --//
if upperbound(rstr_detail[]) > 0 then
	FOR li_idx = 1 to upperbound(rstr_detail[]) 
		if this.f_get_interface_values( rdw_interface, vl_row,rstr_detail[li_idx]) = -1 then return -1
		//-- them id, object_ref_id và object_ref_table --//	
		if ras_d_values[li_idx] <> rstr_detail[li_idx].s_imported_val + ';' + string(rstr_master.db_imported_id) then
			rstr_detail[li_idx].s_changed_val = true				
			ras_d_values[li_idx]  = rstr_detail[li_idx].s_imported_val //-- ghi nhớ lại giá trị record --//
			ldb_id = this.f_create_id( )
			ls_t_colnames = 'id, object_ref_id,object_ref_table,' + rstr_detail[li_idx].s_t_colnames
			ls_val_d = string(ldb_id) + ','+ string(rstr_master.db_imported_id) + ",'" + rstr_master.s_table+"',"+ras_d_values[li_idx]
			if  this.f_insert_table(  rstr_detail[li_idx].s_table, ls_t_colnames, ls_val_d, rt_transaction) = -1 then return -1			
			rstr_detail[li_idx].db_imported_id = ldb_id
			ras_d_values[li_idx] = ras_d_values[li_idx] + ';' +string(rstr_master.db_imported_id) //-- thêm object_ref_id vào chuổi value detail --//
		end if
		//-- update master ref_col --//
		if rstr_detail[li_idx].s_ref_m_col <> '' then
			this.f_update_m_ref_value(rstr_master.s_table , rstr_detail[li_idx].s_ref_m_col,rstr_detail[li_idx].s_ref_coltype, rstr_detail[li_idx].s_ref_val,rstr_master.db_imported_id , rt_transaction)
		end if
	NEXT
end if

return 1
end function

public function integer f_chk_interface_exists_data (ref t_dw_mpl rdw_interface, string vs_chk_colname, t_ds_db vds_source_data, string vs_source_colname);
long		ll_chk_row, ll_duplicate_row
string		ls_error, ls_coltext, ls_data, ls_coltype, ls_data_prev, ls_colname

ls_coltype = rdw_interface.describe(vs_chk_colname+".coltype")
if left(ls_coltype,4) <> 'char' then
	gf_messagebox('m.b_interface.f_chk_interface_duplicated_data.01','Thông báo','Cột kiểm tra trùng dữ liệu không phải kiểu chuỗi:@'+vs_chk_colname, 'exclamtion','ok',1)
	return -1
end if
rdw_interface.setsort(vs_chk_colname +" A")
rdw_interface.sort()

FOR ll_chk_row =1 to rdw_interface.rowcount()
	ls_data = rdw_interface.getitemstring(ll_chk_row, vs_chk_colname)
//	if ls_data_prev = ls_data then
//		this.f_set_check_text( rdw_interface,vs_chk_colname, ll_chk_row, "Trùng dữ liệu, cột ")
//	else
		ll_duplicate_row = vds_source_data.find(vs_source_colname+" = '"+ls_data+"'", 1, vds_source_data.rowcount() )
		if ll_duplicate_row > 0 then
			this.f_set_check_text( rdw_interface,vs_chk_colname, ll_chk_row, "OK")
		else
			this.f_set_check_text( rdw_interface,vs_chk_colname, ll_chk_row, "Dữ liệu chưa khai báo, cột")
		end if
//	end if
	ls_data_prev = ls_data
NEXT

return 1
end function

public function integer f_update_data (ref t_transaction rt_transaction, t_dw_mpl vdw_interface, long vl_importrow, s_str_import vstr_update, s_str_import vstr_master, double vdb_master_id, string vs_obj_type);c_string		lc_tr
double		ldb_fk_id,ldb_id
string			las_upd_colname[],las_dwu_colname[],ls_upd,ls_value,las_fk_colnames[],las_pk_colnames[],ls_code
int				li_idx,li_uppberbound

s_str_import		ls_trs

li_uppberbound = lc_tr.f_stringtoarray( vstr_update.s_upd_colname, ',', las_upd_colname[])
li_uppberbound = lc_tr.f_stringtoarray( vstr_update.s_dwu_colnames, ',', las_dwu_colname[])
//-- update thông tin của bảng master --//
for li_idx = 1 to li_uppberbound
	ls_value = vdw_interface.getitemstring(vl_importrow,las_dwu_colname[li_idx])
	if ls_value <> '' and not isnull(ls_value) then
		if li_idx <> li_uppberbound then ls_upd += las_upd_colname[li_idx] + " = '" + ls_value + "', "
		if li_idx = li_uppberbound then ls_upd += las_upd_colname[li_idx] + " = '" + ls_value + "'"
 	end if
next
//-- update khóa ngoại của bảng master --//
li_uppberbound = lc_tr.f_stringtoarray( vstr_update.s_fk_colnames, ',', las_fk_colnames[])
li_uppberbound = lc_tr.f_stringtoarray( vstr_update.s_pk_colnames, ',', las_pk_colnames[])
if li_uppberbound > 0 and not lastpos(trim(ls_upd),',') = len(trim(ls_upd)) then ls_upd += ', '
for li_idx = 1 to li_uppberbound
	ls_value = vdw_interface.getitemstring(vl_importrow,las_fk_colnames[li_idx])
	if isnull(ls_value) then continue
	vstr_update.ds_pk_data[li_idx].setfilter(las_pk_colnames[li_idx] + " = '" + ls_value + "'")
	vstr_update.ds_pk_data[li_idx].filter()
	ldb_fk_id = vstr_update.ds_pk_data[li_idx].getitemnumber(vstr_update.ds_pk_data[li_idx].rowcount(),'ID')
	if li_idx <> li_uppberbound then ls_upd += las_fk_colnames[li_idx] + " = " + string(ldb_fk_id) + ", "
	if li_idx = li_uppberbound then ls_upd += las_fk_colnames[li_idx] + " = " + string(ldb_fk_id)
next
if pos(ls_upd,',') = len(ls_upd) - 1 then ls_upd = left(ls_upd,len(ls_upd) - 2)
//-- sytax update --//
if ls_upd <> '' then
	if lastpos(trim(ls_upd),',') = len(trim(ls_upd)) then ls_upd = left(ls_upd,len(ls_upd) - (len(ls_upd) - lastpos(ls_upd,',')))
	ls_upd = "UPDATE "+ vstr_update.s_table +" SET " + ls_upd  //+ " WHERE ID = " + string(ldb_id)
//	if lastpos(trim(ls_upd),',') = len(trim(ls_upd)) then ls_upd = left(ls_upd,len(trim(ls_upd)) -1)
	if vdb_master_id <> 0 then
		ls_upd = ls_upd + " WHERE OBJECT_REF_ID IN (SELECT ID FROM " + vstr_master.s_table + " WHERE ID = " + string(vdb_master_id) + ")"
	else
		ls_code = vdw_interface.getitemstring(vl_importrow,'code')
		if upper(vs_obj_type) = 'CUSTOMER' then
			ls_upd = ls_upd + " WHERE ID = (SELECT t.ID FROM " + vstr_update.s_table + " t join customer on customer.id = t.object_ref_id  AND t.OBJECT_REF_TABLE = 'CUSTOMER' and t.active_yn = 'Y' " +&
						" join object  on object.id = customer.object_ref_id and object.code = '" + ls_code + "' )"
		else
		end if
	end if	
	EXECUTE IMMEDIATE :ls_upd using rt_transaction;
end if
return 0
end function

on b_interface.create
call super::create
end on

on b_interface.destroy
call super::destroy
end on

