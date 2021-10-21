$PBExportHeader$c_user_instance.sru
forward
global type c_user_instance from s_object
end type
end forward

global type c_user_instance from s_object
end type
global c_user_instance c_user_instance

type prototypes

end prototypes

type variables
b_rule		i_rule
t_ds_db	ids_security_module
double  	ID
double 	OBJECT_ID
string  	CODE    
string  	NAME   
string		PASSWORD
double  	DEFAULT_COMP
double  	DEFAULT_BRANCH 
double  	DEFAULT_MOD
string  	NBR_FORMAT     
string  	GROUP_SYMBOL   
string  	DATE_FORMAT  
string	   	FULL_NAME
string		PHONE
string		EMAIL
string		MANAGER_CODE
string		MANAGER_NAME
string		DEPT_CODE
string		DEPT_NAME
string		DEFAULT_SOB

double	idb_role_id[]

end variables

forward prototypes
public function integer f_init (double vdb_id)
public function integer f_init (string vs_code)
public function integer f_set_role (double vdb_user_id)
public function integer f_init_policy_datastore ()
public function string f_get_name_of_userid (double vdb_userid)
public function string f_get_current_role_user_string ()
public function integer f_get_security_module (string vs_identification_code, ref boolean rb_access)
public function double f_get_default_module (double vdb_user_id)
public function string f_get_name_of_userid_ex (double vdb_userid, ref t_transaction rt_transaction)
public function integer f_init_ex (double vdb_id, ref t_transaction rt_transaction)
public function integer f_init_ex (string vs_code, ref t_transaction rt_transaction)
public function integer f_init_policy_datastore_ex (ref t_transaction rt_transaction)
public function integer f_set_role_ex (double vdb_user_id, ref t_transaction rt_transaction)
end prototypes

public function integer f_init (double vdb_id);select 
  RU.ID   ,
  OBJ.ID,
  OBJ.CODE  ,
  OBJ.NAME   ,
   RU.PASSWORD,
   RU.DEFAULT_COMP ,
   RU.DEFAULT_BRANCH ,
   RU.DEFAULT_MOD  ,
   RU.DEFAULT_SOB  ,
   RU.NBR_FORMAT ,
   RU.GROUP_SYMBOL ,
   RU.DATE_FORMAT   ,
  P.LAST_NAME ||' '|| P.FIRST_NAME,
  P.PHONE          ,
  P.EMAIL   ,
  MG.CODE,
  MG.NAME,
  DEP.CODE,
  DEP.NAME
  into
  :ID   ,
  :OBJECT_ID,
  :CODE  ,
  :NAME   ,
  :PASSWORD,
  :DEFAULT_COMP ,
  :DEFAULT_BRANCH ,
  :DEFAULT_MOD  ,
  :DEFAULT_SOB  ,  
  :NBR_FORMAT ,
  :GROUP_SYMBOL ,
  :DATE_FORMAT   ,
  :FULL_NAME,
  :PHONE          ,
  :EMAIL   ,
    :MANAGER_CODE,
    :MANAGER_NAME,
    :DEPT_CODE,
    :DEPT_NAME
from role_user ru 
left join object obj on RU.OBJECT_STAFF = OBJ.ID
 left join staff s on OBJ.ID = S.OBJECT_REF_ID
 LEFT JOIN OBJECT MG ON MG.ID = S.MANAGER_ID
 LEFT JOIN OBJECT DEP ON DEP.ID = S.DEPT_ID
 left join people p on S.ID = P.OBJECT_REF_ID
where RU.ID = :vdb_ID 
and ru.active_yn = 'Y'
using sqlca;

if sqlca.sqlcode <> 0 then
	return -1
end if
return this.f_set_role( ID)
end function

public function integer f_init (string vs_code);select 
  RU.ID   ,
  OBJ.ID,
  OBJ.CODE  ,
  OBJ.NAME   ,
   RU.PASSWORD,
   RU.DEFAULT_COMP ,
   RU.DEFAULT_BRANCH ,
   RU.DEFAULT_MOD  ,
   RU.DEFAULT_SOB  ,	
   RU.NBR_FORMAT ,
   RU.GROUP_SYMBOL ,
   RU.DATE_FORMAT   ,
  P.LAST_NAME ||' '|| P.FIRST_NAME,
  P.PHONE          ,
  P.EMAIL   ,
  MG.CODE,
  MG.NAME,
  DEP.CODE,
  DEP.NAME
  into
  :ID   ,
  :OBJECT_ID,
  :CODE  ,
  :NAME   ,
  :PASSWORD,
  :DEFAULT_COMP ,
  :DEFAULT_BRANCH ,
  :DEFAULT_MOD  ,
  :DEFAULT_SOB  ,  
  :NBR_FORMAT ,
  :GROUP_SYMBOL ,
  :DATE_FORMAT   ,
  :FULL_NAME,
  :PHONE          ,
  :EMAIL   ,
    :MANAGER_CODE,
    :MANAGER_NAME,
    :DEPT_CODE,
    :DEPT_NAME
from role_user ru 
left join object obj on RU.OBJECT_STAFF = OBJ.ID
 left join staff s on OBJ.ID = S.OBJECT_REF_ID
 LEFT JOIN OBJECT MG ON MG.ID = S.MANAGER_ID
 LEFT JOIN OBJECT DEP ON DEP.ID = S.DEPT_ID
 left join people p on S.ID = P.OBJECT_REF_ID
where upper(RU.CODE) = upper(:vs_CODE) 
AND ru.active_yn = 'Y'
and rownum=1
using sqlca;


if sqlca.sqlcode <> 0 then
	return -1
end if

return this.f_set_role( ID)
end function

public function integer f_set_role (double vdb_user_id);
string		ls_sql, ls_sql_syntax, ls_err
long			ll_row
datastore	lds_datastore

//------------------//

if vdb_user_id < 0 then return -1

lds_datastore = create datastore
ls_sql = "select ROLE_ID from role_assign where user_id = " + string(vdb_user_id) 

ls_sql_syntax = sqlca.syntaxfromsql(ls_sql, "", ls_err)
if len(ls_err) > 0 then
	 MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_err)
	 Destroy lds_datastore
	 return -1
end if

lds_datastore.create( ls_sql_syntax, ls_err)
if len(ls_err) > 0 then
	 MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_err)
	 Destroy lds_datastore
	 return -1
end if

lds_datastore.settrans( sqlca)
ll_row = lds_datastore.retrieve( )
if ll_row > 0 then
	idb_role_id[] = lds_datastore.object.role_id.current
end if

Destroy lds_datastore
return ll_row
end function

public function integer f_init_policy_datastore ();any						laa_value[]
string						ls_role_user,ls_dbname, ls_colType, ls_Where, ls_where1, ls_where2
int							li_cnt
c_string					lc_string
c_dwservice				lc_dwservice

this.ids_security_module =  create t_ds_db
this.ids_security_module.dataobject = 'ds_security_module'

ls_role_user = this.f_get_current_role_user_string( )
ls_role_user = ";"+ls_role_user+";"

laa_value[1] = '<>(*.*)'
laa_value[2] = gi_user_comp_id
this.ids_security_module.f_add_where( 'identification_code;company_id;', laa_value[])
ls_dbname = 'applicable_ref_id_string'
if lc_dwservice.f_get_build_column( ids_security_module,ls_dbname, ls_colType) = -1 then
	return -1			
end if
ls_Where =  lc_string.f_get_expression( ls_role_user, ls_colType, ls_dbname, 'build where')
ls_where1 =  lc_string.f_get_expression( '()', ls_colType, ls_dbname, 'build where')

ls_dbname = 'APPLICABLE_TYPE'
lc_dwservice.f_get_build_column( ids_security_module,ls_dbname, ls_colType) 
ls_where2 =  lc_string.f_get_expression( '=all', ls_colType, ls_dbname, 'build where')

ls_Where = '('+ls_Where + " OR ("+ls_where1+" and "+ ls_where2 +")) "

this.ids_security_module.f_add_where(ls_Where , 'AND')
this.ids_security_module.settransobject( sqlca)
li_cnt = this.ids_security_module.retrieve( )
 
//ids_policy_alert
return 1


end function

public function string f_get_name_of_userid (double vdb_userid);string		ls_name

select object.name into :ls_name 
from object join role_user ru on ru.object_staff = object.id 
where ru.id = :vdb_userid using SQLCA;
if SQLCA.sqlcode = 0 then
	return ls_name
elseif SQLCA.sqlcode = 100 then
	return ''
end if
end function

public function string f_get_current_role_user_string ();c_string		lc_string
string			ls_role_user_id

if upperbound(idb_role_id[]) > 0 then
	lc_string.f_arraytostring( idb_role_id[], ';', ls_role_user_id)
	ls_role_user_id = string(gi_userid)+';'+ls_role_user_id
else
	ls_role_user_id = string(gi_userid)
end if

return ls_role_user_id
end function

public function integer f_get_security_module (string vs_identification_code, ref boolean rb_access);/************************************************************
chức năng: lấy thuộc tính cài đặt phân quyền phụ thuộc data hiện hành
-----------------------------------------------------------------------------------------------
Tham số:
--------------------------
return:
============================================*/


int							li_ruleCount, li_idx
long						ll_row_found
double					ldba_rule_id[], ldb_idkey_id
c_string					lc_string

if gi_userid = 0 then
	rb_access = true
	return 0
end if
if vs_identification_code = '' or isnull(vs_identification_code) then return 0

if  lc_string.f_countoccurrences(vs_identification_code, '.') > 0 then return 0


ll_row_found = ids_security_module.find( "identification_code ='" + vs_identification_code+"'", 1, ids_security_module.rowcount( ) )
if ll_row_found > 0 then
	rb_access = true
else
	rb_access = false	
end if

return 1
end function

public function double f_get_default_module (double vdb_user_id);double		ldb_module

select 
   RU.DEFAULT_MOD  into :ldb_module
from role_user ru 
where RU.ID = :vdb_user_id 
and ru.company_id = :gi_user_comp_id
and ru.branch_id = :gdb_branch
using sqlca;

if sqlca.sqlcode = -1 then
	return -1
end if
return ldb_module
end function

public function string f_get_name_of_userid_ex (double vdb_userid, ref t_transaction rt_transaction);string		ls_name

select object.name into :ls_name 
from object join role_user ru on ru.object_staff = object.id 
where ru.id = :vdb_userid using rt_transaction;
if rt_transaction.sqlcode = 0 then
	return ls_name
elseif rt_transaction.sqlcode = 100 then
	return ''
end if
end function

public function integer f_init_ex (double vdb_id, ref t_transaction rt_transaction);select 
  RU.ID   ,
  OBJ.ID,
  OBJ.CODE  ,
  OBJ.NAME   ,
   RU.PASSWORD,
   RU.DEFAULT_COMP ,
   RU.DEFAULT_BRANCH ,
   RU.DEFAULT_MOD  ,
   RU.DEFAULT_SOB  ,
   RU.NBR_FORMAT ,
   RU.GROUP_SYMBOL ,
   RU.DATE_FORMAT   ,
  P.LAST_NAME ||' '|| P.FIRST_NAME,
  P.PHONE          ,
  P.EMAIL   ,
  MG.CODE,
  MG.NAME,
  DEP.CODE,
  DEP.NAME
  into
  :ID   ,
  :OBJECT_ID,
  :CODE  ,
  :NAME   ,
  :PASSWORD,
  :DEFAULT_COMP ,
  :DEFAULT_BRANCH ,
  :DEFAULT_MOD  ,
  :DEFAULT_SOB  ,  
  :NBR_FORMAT ,
  :GROUP_SYMBOL ,
  :DATE_FORMAT   ,
  :FULL_NAME,
  :PHONE          ,
  :EMAIL   ,
    :MANAGER_CODE,
    :MANAGER_NAME,
    :DEPT_CODE,
    :DEPT_NAME
from role_user ru 
left join object obj on RU.OBJECT_STAFF = OBJ.ID
 left join staff s on OBJ.ID = S.OBJECT_REF_ID
 LEFT JOIN OBJECT MG ON MG.ID = S.MANAGER_ID
 LEFT JOIN OBJECT DEP ON DEP.ID = S.DEPT_ID
 left join people p on S.ID = P.OBJECT_REF_ID
where RU.ID = :vdb_ID 
and ru.active_yn = 'Y'
using rt_transaction;

if rt_transaction.sqlcode <> 0 then
	return -1
end if
return this.f_set_role_ex( ID, rt_transaction)
end function

public function integer f_init_ex (string vs_code, ref t_transaction rt_transaction);select 
  RU.ID   ,
  OBJ.ID,
  OBJ.CODE  ,
  OBJ.NAME   ,
   RU.PASSWORD,
   RU.DEFAULT_COMP ,
   RU.DEFAULT_BRANCH ,
   RU.DEFAULT_MOD  ,
   RU.DEFAULT_SOB  ,	
   RU.NBR_FORMAT ,
   RU.GROUP_SYMBOL ,
   RU.DATE_FORMAT   ,
  P.LAST_NAME ||' '|| P.FIRST_NAME,
  P.PHONE          ,
  P.EMAIL   ,
  MG.CODE,
  MG.NAME,
  DEP.CODE,
  DEP.NAME
  into
  :ID   ,
  :OBJECT_ID,
  :CODE  ,
  :NAME   ,
  :PASSWORD,
  :DEFAULT_COMP ,
  :DEFAULT_BRANCH ,
  :DEFAULT_MOD  ,
  :DEFAULT_SOB  ,  
  :NBR_FORMAT ,
  :GROUP_SYMBOL ,
  :DATE_FORMAT   ,
  :FULL_NAME,
  :PHONE          ,
  :EMAIL   ,
    :MANAGER_CODE,
    :MANAGER_NAME,
    :DEPT_CODE,
    :DEPT_NAME
from role_user ru 
left join object obj on RU.OBJECT_STAFF = OBJ.ID
 left join staff s on OBJ.ID = S.OBJECT_REF_ID
 LEFT JOIN OBJECT MG ON MG.ID = S.MANAGER_ID
 LEFT JOIN OBJECT DEP ON DEP.ID = S.DEPT_ID
 left join people p on S.ID = P.OBJECT_REF_ID
where upper(RU.CODE) = upper(:vs_CODE) 
AND ru.active_yn = 'Y'
using rt_transaction;


if rt_transaction.sqlcode <> 0 then
	return -1
end if

return this.f_set_role_ex( ID, rt_transaction)
end function

public function integer f_init_policy_datastore_ex (ref t_transaction rt_transaction);any						laa_value[]
string						ls_role_user,ls_dbname, ls_colType, ls_Where, ls_where1, ls_where2
int							li_cnt
c_string					lc_string
c_dwservice				lc_dwservice

this.ids_security_module =  create t_ds_db
this.ids_security_module.dataobject = 'ds_security_module'

ls_role_user = this.f_get_current_role_user_string( )
ls_role_user = ";"+ls_role_user+";"

laa_value[1] = '<>(*.*)'
laa_value[2] = gi_user_comp_id
this.ids_security_module.f_add_where( 'identification_code;company_id;', laa_value[])
ls_dbname = 'applicable_ref_id_string'
if lc_dwservice.f_get_build_column( ids_security_module,ls_dbname, ls_colType) = -1 then
	return -1			
end if
ls_Where =  lc_string.f_get_expression( ls_role_user, ls_colType, ls_dbname, 'build where')
ls_where1 =  lc_string.f_get_expression( '()', ls_colType, ls_dbname, 'build where')

ls_dbname = 'APPLICABLE_TYPE'
lc_dwservice.f_get_build_column( ids_security_module,ls_dbname, ls_colType) 
ls_where2 =  lc_string.f_get_expression( '=all', ls_colType, ls_dbname, 'build where')

ls_Where = '('+ls_Where + " OR ("+ls_where1+" and "+ ls_where2 +")) "

this.ids_security_module.f_add_where(ls_Where , 'AND')
this.ids_security_module.settransobject( rt_transaction)
li_cnt = this.ids_security_module.retrieve( )
 
//ids_policy_alert
return 1


end function

public function integer f_set_role_ex (double vdb_user_id, ref t_transaction rt_transaction);
string		ls_sql, ls_sql_syntax, ls_err
long			ll_row
datastore	lds_datastore

//------------------//

if vdb_user_id < 0 then return -1

lds_datastore = create datastore
ls_sql = "select ROLE_ID from role_assign where user_id = " + string(vdb_user_id) 

ls_sql_syntax = rt_transaction.syntaxfromsql(ls_sql, "", ls_err)
if len(ls_err) > 0 then
	 MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_err)
	 Destroy lds_datastore
	 return -1
end if

lds_datastore.create( ls_sql_syntax, ls_err)
if len(ls_err) > 0 then
	 MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_err)
	 Destroy lds_datastore
	 return -1
end if

lds_datastore.settrans( rt_transaction)
ll_row = lds_datastore.retrieve( )
if ll_row > 0 then
	idb_role_id[] = lds_datastore.object.role_id.current
end if

Destroy lds_datastore
return ll_row
end function

on c_user_instance.create
call super::create
end on

on c_user_instance.destroy
call super::destroy
end on

event destructor;call super::destructor;
if isvalid(ids_security_module) then destroy ids_security_module
end event

