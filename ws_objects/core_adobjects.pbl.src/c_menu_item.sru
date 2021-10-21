$PBExportHeader$c_menu_item.sru
forward
global type c_menu_item from s_object_instantiate
end type
end forward

global type c_menu_item from s_object_instantiate
end type

type variables

end variables

forward prototypes
public function boolean f_is_module_has_sub (double vdb_moduel_id)
public function boolean f_is_submodule (double vdb_id)
public function any f_get_tv_sort_data ()
public function string f_get_menu_code (double vdb_menu_id)
public function double f_get_menu_id (string vs_code)
public function string f_get_menu_label (double vdb_menu_id)
public function string f_get_menu_label (string vs_object)
public function double f_get_menu_id_ex (string vs_code)
public function string f_get_menu_code_ex (double vdb_menu_id)
public function string f_get_menu_code_ex (double vdb_menu_id, ref t_transaction rt_transaction)
public function double f_get_menu_id_ex (string vs_code, ref t_transaction rt_transaction)
public function string f_get_menu_label_ex (double vdb_menu_id, ref t_transaction rt_transaction)
public function string f_get_menu_label_ex (string vs_object, ref t_transaction rt_transaction)
public function boolean f_is_submodule_ex (double vdb_id, ref t_transaction rt_transaction)
end prototypes

public function boolean f_is_module_has_sub (double vdb_moduel_id);int			li_cnt

select count(id) into :li_cnt from menu where menu_id = :vdb_moduel_id and submod_yn = 'Y'  and company_id = :gi_user_comp_id and branch_id = :gdb_branch ;

if li_cnt > 0 then
	return true
else
	return false
end if
end function

public function boolean f_is_submodule (double vdb_id);int			li_cnt

select count(id) into :li_cnt from menu where id = :vdb_id and submod_yn = 'Y';

if li_cnt > 0 then
	return true
else
	return false
end if
end function

public function any f_get_tv_sort_data ();return istr_tv.i_sort
end function

public function string f_get_menu_code (double vdb_menu_id);string				ls_code

if vdb_menu_id > 0 then
	select code into :ls_code from menu where id = :vdb_menu_id  and company_id = :gi_user_comp_id and branch_id = :gdb_branch  using sqlca;
	
	return ls_code
else
	return ''
end if
end function

public function double f_get_menu_id (string vs_code);double			ldb_id

if not isnull(vs_code)  then
	select id into :ldb_id from menu where code = :vs_code and company_id = :gi_user_comp_id and branch_id = :gdb_branch   using sqlca;
	
	return ldb_id
else
	return 0
end if
end function

public function string f_get_menu_label (double vdb_menu_id);string				ls_text

if vdb_menu_id > 0 then
	select label.text into :ls_text 
	from menu join label on label.code = menu.code
	where menu.id = :vdb_menu_id  
	and menu.company_id = :gi_user_comp_id 
	and menu.branch_id = :gdb_branch 
	and label.lang = :gs_user_lang
	using sqlca;
	
	return ls_text
else
	return string(vdb_menu_id)
end if
end function

public function string f_get_menu_label (string vs_object);string				ls_text

if vs_object <> ''  then
	select label.text into :ls_text 
	from menu join label on label.code = menu.code
	where menu.code = :vs_object  
	and menu.company_id = :gi_user_comp_id 
	and menu.branch_id = :gdb_branch 
	and label.lang = :gs_user_lang
	using sqlca;
	
	return ls_text
else
	return ''
end if
end function

public function double f_get_menu_id_ex (string vs_code);double			ldb_id

t_transaction 	lt_transaction

//-- Tạo connection voi database --//
lt_transaction = create t_transaction
lt_transaction.dbms =	SQLCA.DBMS
lt_transaction.ServerName	 = SQLCA.ServerName
lt_transaction.LogId	 = SQLCA.LogId
lt_transaction.LogPass 	 = SQLCA.LogPass 
lt_transaction.AutoCommit 	 = false 
lt_transaction.DBParm	 = SQLCA.DBParm
connect using	lt_transaction;	

if not isnull(vs_code)  then
	select id into :ldb_id from menu where code = :vs_code and company_id = :gi_user_comp_id and branch_id = :gdb_branch   using lt_transaction;
	
	disconnect using lt_transaction;
	destroy lt_transaction
	return ldb_id
else
	disconnect using lt_transaction;
	destroy lt_transaction
	return 0
end if
end function

public function string f_get_menu_code_ex (double vdb_menu_id);string				ls_code

t_transaction 	lt_transaction

//-- Tạo connection voi database --//
lt_transaction = create t_transaction
lt_transaction.dbms =	SQLCA.DBMS
lt_transaction.ServerName	 = SQLCA.ServerName
lt_transaction.LogId	 = SQLCA.LogId
lt_transaction.LogPass 	 = SQLCA.LogPass 
lt_transaction.AutoCommit 	 = false 
lt_transaction.DBParm	 = SQLCA.DBParm
connect using	lt_transaction;	

if vdb_menu_id > 0 then
	select code into :ls_code from menu where id = :vdb_menu_id  and company_id = :gi_user_comp_id and branch_id = :gdb_branch  using lt_transaction;
	disconnect using lt_transaction;
	destroy lt_transaction
	return ls_code
else
	disconnect using lt_transaction;
	destroy lt_transaction
	return ''
end if
end function

public function string f_get_menu_code_ex (double vdb_menu_id, ref t_transaction rt_transaction);string				ls_code



if vdb_menu_id > 0 then
	select code into :ls_code from menu where id = :vdb_menu_id  and company_id = :gi_user_comp_id and branch_id = :gdb_branch  using rt_transaction;
	return ls_code
else
	return ''
end if
end function

public function double f_get_menu_id_ex (string vs_code, ref t_transaction rt_transaction);double			ldb_id


if not isnull(vs_code)  then
	select id into :ldb_id from menu where code = :vs_code and company_id = :gi_user_comp_id and branch_id = :gdb_branch   using rt_transaction;
	return ldb_id
else
	return 0
end if
end function

public function string f_get_menu_label_ex (double vdb_menu_id, ref t_transaction rt_transaction);string				ls_text

if vdb_menu_id > 0 then
	select label.text into :ls_text 
	from menu join label on label.code = menu.code
	where menu.id = :vdb_menu_id  
	and menu.company_id = :gi_user_comp_id 
	and menu.branch_id = :gdb_branch 
	and label.lang = :gs_user_lang
	using rt_transaction;
	
	return ls_text
else
	return string(vdb_menu_id)
end if
end function

public function string f_get_menu_label_ex (string vs_object, ref t_transaction rt_transaction);string				ls_text

if vs_object <> ''  then
	select label.text into :ls_text 
	from menu join label on label.code = menu.code
	where menu.code = :vs_object  
	and menu.company_id = :gi_user_comp_id 
	and menu.branch_id = :gdb_branch 
	and label.lang = :gs_user_lang
	using rt_transaction;
	
	return ls_text
else
	return ''
end if
end function

public function boolean f_is_submodule_ex (double vdb_id, ref t_transaction rt_transaction);int			li_cnt

select count(id) into :li_cnt from menu where id = :vdb_id and submod_yn = 'Y' using rt_transaction;

if li_cnt > 0 then
	return true
else
	return false
end if
end function

on c_menu_item.create
call super::create
end on

on c_menu_item.destroy
call super::destroy
end on

