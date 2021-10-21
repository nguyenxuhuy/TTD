$PBExportHeader$b_flexibledata.sru
forward
global type b_flexibledata from s_object_instantiate
end type
end forward

global type b_flexibledata from s_object_instantiate
end type

forward prototypes
public function double f_insert_flexible_code (string vs_code)
public function double f_get_id (string vs_code, string vs_ref_type)
public function double f_get_id (string vs_code, ref t_transaction rt_transaction)
public function double f_insert_flexible_code_ex (string vs_code, ref t_transaction rt_transaction)
public function double f_get_id (string vs_code, string vs_ref_type, ref t_transaction rt_transaction)
end prototypes

public function double f_insert_flexible_code (string vs_code);
t_ds_db	lds_flexibledata
long		ll_insertrow
double	ldb_ID

lds_flexibledata = create t_ds_db
lds_flexibledata.dataobject = 'd_flexible_data_grid'
lds_flexibledata.f_settransobject(sqlca)
ll_insertrow =  lds_flexibledata.insertrow( 0)
ldb_ID =  this.f_create_id( ) 
lds_flexibledata.setitem( ll_insertrow, 'ID',ldb_ID)
lds_flexibledata.setitem( ll_insertrow, 'code', vs_code )


if lds_flexibledata.update(true,false ) = 1 then
	commit using sqlca;
	destroy lds_flexibledata
	return ldb_ID
else
	gf_messagebox('m.b_rule.f_insert_flexible_code.01','Thông báo','Không tạo được mã flexible Data:@'+sqlca.sqlerrtext,'exclamation','ok',1)
	rollback using sqlca;
	destroy lds_flexibledata
	return -1
end if
end function

public function double f_get_id (string vs_code, string vs_ref_type);int		li_cnt
double			ldb_id

select count(id) into :li_cnt from flexible_data where lower(code) =  lower(:vs_code) and object_ref_table = upper(:vs_ref_type) using sqlca;

if li_cnt = 1 then
	select id into :ldb_id from flexible_data where lower(code) =  lower(:vs_code) and object_ref_table = upper(:vs_ref_type) using sqlca;
	return ldb_id
else	
	return -1
end if
end function

public function double f_get_id (string vs_code, ref t_transaction rt_transaction);int		li_cnt
double			ldb_id

select count(id) into :li_cnt from flexible_data where lower(code) =  lower(:vs_code)  using rt_transaction;

if li_cnt = 1 then
	select id into :ldb_id from flexible_data where lower(code) =  lower(:vs_code)  using rt_transaction;
	return ldb_id
else	
	return -1
end if
end function

public function double f_insert_flexible_code_ex (string vs_code, ref t_transaction rt_transaction);
t_ds_db	lds_flexibledata
long		ll_insertrow
double	ldb_ID

lds_flexibledata = create t_ds_db
lds_flexibledata.dataobject = 'd_flexible_data_grid'
lds_flexibledata.f_settransobject(rt_transaction)
ll_insertrow =  lds_flexibledata.insertrow( 0)
ldb_ID =  this.f_create_id_ex( rt_transaction) 
lds_flexibledata.setitem( ll_insertrow, 'ID',ldb_ID)
lds_flexibledata.setitem( ll_insertrow, 'code', vs_code )


if lds_flexibledata.update(true,false ) = 1 then
	commit using rt_transaction;
	destroy lds_flexibledata
	return ldb_ID
else
	gf_messagebox('m.b_rule.f_insert_flexible_code.01','Thông báo','Không tạo được mã flexible Data:@'+sqlca.sqlerrtext,'exclamation','ok',1)
	rollback using rt_transaction;
	destroy lds_flexibledata
	return -1
end if
end function

public function double f_get_id (string vs_code, string vs_ref_type, ref t_transaction rt_transaction);int		li_cnt
double			ldb_id

select count(id) into :li_cnt from flexible_data where lower(code) =  lower(:vs_code) and object_ref_table = upper(:vs_ref_type) using rt_transaction;

if li_cnt = 1 then
	select id into :ldb_id from flexible_data where lower(code) =  lower(:vs_code) and object_ref_table = upper(:vs_ref_type) using rt_transaction;
	return ldb_id
else	
	return -1
end if
end function

on b_flexibledata.create
call super::create
end on

on b_flexibledata.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'FLEXIBLE_DATA'
end event

