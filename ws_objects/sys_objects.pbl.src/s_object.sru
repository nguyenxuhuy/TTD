$PBExportHeader$s_object.sru
forward
global type s_object from nonvisualobject
end type
end forward

global type s_object from nonvisualobject
end type
global s_object s_object

type variables
string 				is_table
t_ds_db			ids_policy_rule, ids_policy_security, ids_policy_alert, ids_attribute
powerobject		ipo_parm

end variables

forward prototypes
public function double f_create_id ()
public function string f_get_code (double vdb_id)
public function double f_get_id (string vs_code)
public function string f_get_name (double vdb_id)
public function string f_get_name (string vs_code)
public function integer f_init_object (double vdb_id)
public function integer f_init_object (string vs_code)
public function integer f_init_object (string vs_col_name, decimal vdc_col_value)
public function integer f_init_object (string vs_col_name, string vs_col_value)
public function integer f_init_object_table (ref t_ds_db rds_rtn_table, string vs_dw_object, string vs_cols_name, any vs_cols_criteria[], any va_retrieve_arg[])
public function integer f_init_object_table (ref t_ds_db rds_rtn_table, string vs_dw_object, string vs_cols_name, any vs_cols_criteria[], any va_retrieve_arg[], ref t_transaction vt_transaction)
public function double f_create_id_ex (ref t_transaction rt_transaction)
end prototypes

public function double f_create_id ();/************************************************************************
Chức năng: Tạo ID cho 1 đối tượng
------------------------------------------------------------------------------
Tham số:
--------------------
Return (Double): Số dùng làm primary key của đối tượng
				     : -1 Nếu có lỗi
=================================================================*/

double		ldb_id

select SEQ_TABLE_ID.nextval into :ldb_id from dual using sqlca;

if sqlca.sqlcode = 0 then
	return ldb_id
else
	return -1
end if

end function

public function string f_get_code (double vdb_id);/************************************************************************
Chức năng: Lấy code khi biết ID của một đối tượng
------------------------------------------------------------------------------
Tham số: vdb_id: ID của đối tượng
--------------------
Return (string): Giá trị code của đối tượng
				   : "" không tìm thấy đối tượng
				   : Null nếu bị lỗi
=================================================================*/
string			ls_sql, ls_modify, ls_rtn,ls_code
t_ds_db		lds_datastore

//------------------//

lds_datastore = create t_ds_db
lds_datastore.dataobject = 'ds_get_id_code_name'
lds_datastore.f_settransobject( SQLCA)
ls_sql = "select 0 as ID,Code,'' as Name from " + is_table + " where ID = "+ string(vdb_id)
ls_modify = 'Datawindow.Table.Select= "' + ls_sql +'"'
ls_rtn =lds_datastore.modify(ls_modify )
lds_datastore.retrieve( )
ls_code = lds_datastore.getitemstring( 1, 'CODE')
destroy lds_datastore
if isnull(ls_code) then
	return ""
else
	return ls_code
end if
end function

public function double f_get_id (string vs_code);/************************************************************************
Chức năng: Lấy ID của đối tượng khi biết code
------------------------------------------------------------------------------
Tham số: vs_code-> code của đối tượng
--------------------
Return (double) : Giá trị ID của đối tượng
					 : 0 Không tìm thấy đối tượng
				     : -1 Chỗi rỗng khi bị lỗi hoặc không tìm thấy đối tượng
=================================================================*/
string			ls_sql, ls_modify, ls_rtn
double		ldb_ID
t_ds_db		lds_datastore

//------------------//

lds_datastore = create t_ds_db
lds_datastore.dataobject = 'ds_get_id_code_name'
lds_datastore.f_settransobject( SQLCA)
ls_sql = "select ID,'' as Code,'' as Name from " + is_table + " where upper(CODE) = '"+ upper(vs_code) +"'"
ls_modify = 'Datawindow.Table.Select= "' + ls_sql +'"'
ls_rtn =lds_datastore.modify(ls_modify )
if lds_datastore.retrieve( ) > 0 then
	ldb_ID = lds_datastore.getitemnumber( 1, 'ID')
else
	ldb_ID = -1
end if

Destroy lds_datastore
return ldb_ID
end function

public function string f_get_name (double vdb_id);/************************************************************************
Chức năng: Lấy name khi biết ID của một đối tượng
------------------------------------------------------------------------------
Tham số:
--------------------
Return (string): Giá trị Name của đối tượng
				   : "" không tìm thấy đối tượng
				   : Null nếu bị lỗi
=================================================================*/
					
string			ls_sql, ls_modify, ls_rtn,ls_name
t_ds_db		lds_datastore

//------------------//

lds_datastore = create t_ds_db
lds_datastore.dataobject = 'ds_get_id_code_name'
lds_datastore.f_settransobject( SQLCA)
ls_sql = "select 0 as ID, '' as Code,Name from " + is_table + " where ID = "+ string(vdb_ID)
ls_modify = 'Datawindow.Table.Select= "' + ls_sql +'"'
ls_rtn =lds_datastore.modify(ls_modify )
lds_datastore.retrieve( )
ls_name = lds_datastore.getitemstring( 1, 'NAME')

Destroy lds_datastore
if isnull(ls_name) then
	return ''
else
	return ls_name
end if
end function

public function string f_get_name (string vs_code);/************************************************************************
Chức năng: Lấy name khi biết code của một đối tượng
------------------------------------------------------------------------------
Tham số: vs_code (Mã đối tượng
--------------------
Return (string): Giá trị Name của đối tượng
				   : "" không tìm thấy đối tượng
				   : Null nếu bị lỗi
=================================================================*/
					
string			ls_sql, ls_modify, ls_rtn,ls_name
t_ds_db		lds_datastore

//------------------//

lds_datastore = create t_ds_db
lds_datastore.dataobject = 'ds_get_id_code_name'
lds_datastore.f_settransobject( SQLCA)
ls_sql = "select 0 as ID,'' as Code,Name from " + is_table + " where uppercase(code) = '"+ upper(string(vs_code))+"'"
ls_modify = 'Datawindow.Table.Select= "' + ls_sql +'"'
ls_rtn =lds_datastore.modify(ls_modify )
lds_datastore.retrieve( )
ls_name = lds_datastore.getitemstring( 1, 'NAME')
if isnull(ls_name) then
	return ''
else
	return ls_name
end if
destroy lds_datastore
end function

public function integer f_init_object (double vdb_id);/************************************************************************
Chức năng: Lấy dữ liệu của record đối tượng trong databse khi biết ID của một đối tượng
------------------------------------------------------------------------------
Tham số: vdb_id: ID của đối tượng
--------------------
Return (string): 1 Có dữ liệu đối tượng
				   : 0 không tìm thấy đối tượng
				   : -1 nếu bị lỗi
=================================================================*/
					
any		la_data[]

if not isvalid(ids_attribute) then
	ids_attribute = create t_ds_db
	ids_attribute.dataobject = 'ds_object'
end if
if isnull(vdb_id) or vdb_id = 0 then
	return -1
end if
la_data[1] = vdb_id
ids_attribute.f_add_where( 'id', la_data[])
ids_attribute.f_settransobject( SQLCA)
if ids_attribute.retrieve( ) = 0 then 
	gf_messagebox('m.s_object.f_init_object.01','Thông báo','Không tìm thấy đối tượng có ID:@'+string(vdb_id),'exclamation','ok',1)
	return 0
end if

return 1

/*
string			ls_sql, ls_sql_syntax, ls_err
long 			ll_row
t_ds_db		lds_datastore

//B1: Build sql lấy tên cột của bảng
ls_sql = "select column_name from ALL_TAB_COLUMNS where lower(table_name) = lower('"+ string(is_table)+"')"
ls_sql_syntax = sqlca.syntaxfromsql(ls_sql, "", ls_err)
if len(ls_err) > 0 then
	 //MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_err)
	 return -1
end if
//B2: Retrieve tên cột
lds_datastore = create t_ds_db
lds_datastore.create( ls_sql_syntax, ls_err)
if len(ls_err) > 0 then
	 MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_err)
	 destroy lds_datastore
	 return -1
end if
lds_datastore.f_settransobject( SQLCA)
lds_datastore.retrieve( )
ls_sql = 'select '
//B3: Build sql retrieve record của đối tượng
for ll_row = 1 to lds_datastore.rowcount()
	if ll_row = lds_datastore.rowcount() then
		ls_sql = ls_sql + lds_datastore.getitemstring(ll_row,'column_name')
	else
		ls_sql = ls_sql + lds_datastore.getitemstring(ll_row,'column_name')+','
	end if
next
ls_sql += ' from '+string(is_table) + ' where nvl('+string(vdb_id)+',0) = 0 or id = '+string(vdb_id)
ls_sql_syntax = sqlca.syntaxfromsql(ls_sql, "", ls_err)
if len(ls_err) > 0 then
	 MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_err)
	 return -1
end if
//B4: Retrieve record
if not isvalid(ids_attribute) then
	ids_attribute = create t_ds_db
end if
ids_attribute.create( ls_sql_syntax, ls_err)
if len(ls_err) > 0 then
	 MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_err)
	 destroy ids_attribute
	 return -1
end if

ids_attribute.f_settransobject( SQLCA)
ids_attribute.retrieve( )
if ids_attribute.rowcount( ) =0 then
	//MessageBox("Caution",  "s_object.f_init_object: Return 0 row" + ls_err)
	return 0
end if
return 1
*/
end function

public function integer f_init_object (string vs_code);/************************************************************************
Chức năng: Lấy dữ liệu của record đối tượng trong databse khi biết code của một đối tượng
------------------------------------------------------------------------------
Tham số: vdb_id: ID của đối tượng
--------------------
Return (string): 1 Có dữ liệu đối tượng
				   : 0 không tìm thấy đối tượng
				   : -1 nếu bị lỗi
=================================================================*/
					
string			ls_sql, ls_sql_syntax, ls_err
t_ds_db	lds_datastore
long ll_row
//B1: Build sql lấy tên cột của bảng
ls_sql = "select column_name from ALL_TAB_COLUMNS where lower(table_name) = lower('"+ string(is_table)+"')"
ls_sql_syntax = sqlca.syntaxfromsql(ls_sql, "", ls_err)
if len(ls_err) > 0 then
	 //MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_err)
	 return -1
end if
//B2: Retrieve tên cột
lds_datastore = create t_ds_db
lds_datastore.create( ls_sql_syntax, ls_err)
if len(ls_err) > 0 then
	 //MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_err)
	 destroy lds_datastore
	 return -1
end if
lds_datastore.f_settransobject( SQLCA)
lds_datastore.retrieve( )
ls_sql = 'select '
//B3: Build sql retrieve record của đối tượng
for ll_row = 1 to lds_datastore.rowcount()
	if ll_row = lds_datastore.rowcount() then
		ls_sql = ls_sql + lds_datastore.getitemstring(ll_row,'column_name')
	else
		ls_sql = ls_sql + lds_datastore.getitemstring(ll_row,'column_name')+','
	end if
next
ls_sql += ' from '+string(is_table) + " where nvl('"+vs_code+"','xxx') = 'xxx' or code = '"+vs_code+"'"
ls_sql_syntax = sqlca.syntaxfromsql(ls_sql, "", ls_err)
if len(ls_err) > 0 then
	 //MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_err)
	 return -1
end if
//B4: Retrieve record
if not isvalid(ids_attribute) then
	ids_attribute = create t_ds_db
end if
ids_attribute.create( ls_sql_syntax, ls_err)
if len(ls_err) > 0 then
	 //MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_err)
	 destroy ids_attribute
	 return -1
end if
ids_attribute.f_settransobject( SQLCA)
ids_attribute.retrieve( )
if ids_attribute.rowcount( ) =0 then
	//MessageBox("Caution",  "s_object: Return 0 row in function f_init_object " + ls_err)
	return 0
end if
return 1
end function

public function integer f_init_object (string vs_col_name, decimal vdc_col_value);/************************************************************************
Chức năng: Lấy dữ liệu của record đối tượng trong databse khi biết ID của một đối tượng
------------------------------------------------------------------------------
Tham số: vdb_id: ID của đối tượng
--------------------
Return (string): 1 Có dữ liệu đối tượng
				   : 0 không tìm thấy đối tượng
				   : -1 nếu bị lỗi
=================================================================*/
					
string			ls_sql, ls_sql_syntax, ls_err
t_ds_db	lds_datastore
long ll_row
//B1: Build sql lấy tên cột của bảng
ls_sql = "select column_name from ALL_TAB_COLUMNS where lower(table_name) = lower('"+ string(is_table)+"')"
ls_sql_syntax = sqlca.syntaxfromsql(ls_sql, "", ls_err)
if len(ls_err) > 0 then
	 //MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_err)
	 return -1
end if
//B2: Retrieve tên cột
lds_datastore = create t_ds_db
lds_datastore.create( ls_sql_syntax, ls_err)
if len(ls_err) > 0 then
	 //MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_err)
	 destroy lds_datastore
	 return -1
end if
lds_datastore.f_settransobject( SQLCA)
lds_datastore.retrieve( )
ls_sql = 'select '
//B3: Build sql retrieve record của đối tượng
for ll_row = 1 to lds_datastore.rowcount()
	if ll_row = lds_datastore.rowcount() then
		ls_sql = ls_sql + lds_datastore.getitemstring(ll_row,'column_name')
	else
		ls_sql = ls_sql + lds_datastore.getitemstring(ll_row,'column_name')+','
	end if
next
ls_sql += ' from '+string(is_table) + ' where nvl('+string(vdc_col_value)+',0) = 0 or '+vs_col_name+' = '+string(vdc_col_value)
ls_sql_syntax = sqlca.syntaxfromsql(ls_sql, "", ls_err)
if len(ls_err) > 0 then
	 //MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_err)
	 return -1
end if
//B4: Retrieve record
ids_attribute = create t_ds_db
ids_attribute.create( ls_sql_syntax, ls_err)
if len(ls_err) > 0 then
	 //MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_err)
	 destroy ids_attribute
	 return -1
end if
ids_attribute.f_settransobject( SQLCA)
ids_attribute.retrieve( )
if ids_attribute.rowcount( ) =0 then
	//MessageBox("Caution",  "s_object: Return 0 row in function f_init_object " + ls_err)
	return 0
end if
return 1
end function

public function integer f_init_object (string vs_col_name, string vs_col_value);/************************************************************************
Chức năng: Lấy dữ liệu của record đối tượng trong databse khi biết ID của một đối tượng
------------------------------------------------------------------------------
Tham số: vdb_id: ID của đối tượng
--------------------
Return (string): 1 Có dữ liệu đối tượng
				   : 0 không tìm thấy đối tượng
				   : -1 nếu bị lỗi
=================================================================*/
					
string			ls_sql, ls_sql_syntax, ls_err
t_ds_db	lds_datastore
long ll_row
//B1: Build sql lấy tên cột của bảng
ls_sql = "select column_name from ALL_TAB_COLUMNS where lower(table_name) = lower('"+ string(is_table)+"')"
ls_sql_syntax = sqlca.syntaxfromsql(ls_sql, "", ls_err)
if len(ls_err) > 0 then
	 //MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_err)
	 return -1
end if
//B2: Retrieve tên cột
lds_datastore = create t_ds_db
lds_datastore.create( ls_sql_syntax, ls_err)
if len(ls_err) > 0 then
	 //MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_err)
	 destroy lds_datastore
	 return -1
end if
lds_datastore.f_settransobject( SQLCA)
lds_datastore.retrieve( )
ls_sql = 'select '
//B3: Build sql retrieve record của đối tượng
for ll_row = 1 to lds_datastore.rowcount()
	if ll_row = lds_datastore.rowcount() then
		ls_sql = ls_sql + lds_datastore.getitemstring(ll_row,'column_name')
	else
		ls_sql = ls_sql + lds_datastore.getitemstring(ll_row,'column_name')+','
	end if
next
ls_sql += ' from '+string(is_table) + " where nvl('"+string(vs_col_value)+"','xxx') = 'xxx' or "+vs_col_name+" = '"+string(vs_col_value)+"'"
ls_sql_syntax = sqlca.syntaxfromsql(ls_sql, "", ls_err)
if len(ls_err) > 0 then
	 //MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_err)
	 return -1
end if
//B4: Retrieve record
ids_attribute = create t_ds_db
ids_attribute.create( ls_sql_syntax, ls_err)
if len(ls_err) > 0 then
	 //MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_err)
	 destroy ids_attribute
	 return -1
end if
ids_attribute.f_settransobject( SQLCA)
ids_attribute.retrieve( )
if ids_attribute.rowcount( ) =0 then
	//MessageBox("Caution",  "s_object: Return 0 row in function f_init_object " + ls_err)
	return 0
end if
return 1
end function

public function integer f_init_object_table (ref t_ds_db rds_rtn_table, string vs_dw_object, string vs_cols_name, any vs_cols_criteria[], any va_retrieve_arg[]);/************************************************************************
Chức năng: retrieve dw khi biết cột và giá trị của một cột
------------------------------------------------------------------------------
Tham số: vdb_id: ID của đối tượng
--------------------
Return (string): 1 Có dữ liệu đối tượng
				   : 0 không tìm thấy đối tượng
				   : -1 nếu bị lỗi
=================================================================*/			

long ll_count
any la_retrieve_arg[10]

la_retrieve_arg[] = va_retrieve_arg[]

rds_rtn_table.dataobject = vs_dw_object
rds_rtn_table.f_settransobject( SQLCA)
rds_rtn_table.f_add_where(vs_cols_name,vs_cols_criteria)
ll_count = rds_rtn_table.retrieve(la_retrieve_arg[1],la_retrieve_arg[2],la_retrieve_arg[3],la_retrieve_arg[4],la_retrieve_arg[5],&
la_retrieve_arg[6],la_retrieve_arg[7],la_retrieve_arg[8],la_retrieve_arg[9],la_retrieve_arg[10])

if ll_count< 0 then 
	MessageBox("Caution",  "s_object: Error in function f_init_object_table " + sqlca.sqlerrtext)
	return -1
end if
return 1
end function

public function integer f_init_object_table (ref t_ds_db rds_rtn_table, string vs_dw_object, string vs_cols_name, any vs_cols_criteria[], any va_retrieve_arg[], ref t_transaction vt_transaction);/************************************************************************
Chức năng: retrieve dw khi biết cột và giá trị của một cột
------------------------------------------------------------------------------
Tham số: vdb_id: ID của đối tượng
--------------------
Return (string): 1 Có dữ liệu đối tượng
				   : 0 không tìm thấy đối tượng
				   : -1 nếu bị lỗi
=================================================================*/			

long  ll_count
any la_retrieve_arg[10]

la_retrieve_arg[] = va_retrieve_arg[]

//rds_rtn_table = create t_ds_db
rds_rtn_table.dataobject = vs_dw_object
rds_rtn_table.f_settransobject( vt_transaction)
rds_rtn_table.f_add_where(vs_cols_name,vs_cols_criteria)
ll_count = rds_rtn_table.retrieve(la_retrieve_arg[1],la_retrieve_arg[2],la_retrieve_arg[3],la_retrieve_arg[4],la_retrieve_arg[5],&
la_retrieve_arg[6],la_retrieve_arg[7],la_retrieve_arg[8],la_retrieve_arg[9],la_retrieve_arg[10])

if ll_count< 0 then 
	MessageBox("Caution",  "s_object: Error in function f_init_object_table " + vt_transaction.sqlerrtext)
	return -1
end if
return 1
end function

public function double f_create_id_ex (ref t_transaction rt_transaction);/************************************************************************
Chức năng: Tạo ID cho 1 đối tượng
------------------------------------------------------------------------------
Tham số:
--------------------
Return (Double): Số dùng làm primary key của đối tượng
				     : -1 Nếu có lỗi
=================================================================*/

double		ldb_id

select SEQ_TABLE_ID.nextval into :ldb_id from dual using rt_transaction;

if rt_transaction.sqlcode = 0 then
	return ldb_id
else
	return -1
end if

end function

on s_object.create
call super::create
TriggerEvent( this, "constructor" )
end on

on s_object.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;is_table = 'object'
end event

