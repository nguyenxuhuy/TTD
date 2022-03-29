$PBExportHeader$c_connect_srv.sru
$PBExportComments$user object, kế thừa từ c_obj_service
forward
global type c_connect_srv from c_obj_service
end type
end forward

global type c_connect_srv from c_obj_service
end type

forward prototypes
public function boolean f_isvalid_pwd (string vs_username, string vs_password)
public function integer f_logon ()
public function integer f_connection (string vs_connectionstring)
public function integer f_connection_import ()
public function integer f_connect_ws (ref t_transaction rt_transaction)
public function boolean f_isvalid_pwd_ws (string vs_username, string vs_password)
public function string f_crt_pwd (string vs_code)
end prototypes

public function boolean f_isvalid_pwd (string vs_username, string vs_password);string ls_password_entered,ls_password, ls_date_format
long ll_userid, ll_company_id

b_obj_instantiate		lb_obj
c_string					lc_string


//messagebox('valid','hchk')	

select ad.encrypt(:vs_password) into :ls_password_entered from dual;
g_user = create c_user_instance

//messagebox('2',ls_password_entered)	

if g_user.f_init( vs_username)  <> -1 then
//	messagebox('init ok1',vs_username)	
	
	if ls_password_entered = g_user.password then
		gi_user_comp_id = g_user.default_comp
		gdb_branch = g_user.default_branch
		gi_userid	= g_user.id
//		messagebox('init ok2',vs_username)	
//		lc_legal_entity = create c_legal_entity
		gs_company = lb_obj.f_get_object_code(gi_user_comp_id)
		gs_branch =  lb_obj.f_get_object_code(gdb_branch)
		gs_sob = g_user.default_sob
		if isnull(gs_sob) or gs_sob = '' then gs_sob = 'F'
		
		RegistryGet("HKEY_CURRENT_USER\Control Panel\International","sShortDate",RegString!, gs_w_date_format)
		if pos(gs_w_date_format,'-' ) > 0 and  upper(left(gs_w_date_format,1)) = 'M'  then
			gs_w_date_format = 'mm-dd-yyyy'
		elseif  upper(left(gs_w_date_format,4)) = 'M/D/' then
			gs_w_date_format = lc_string.f_globalreplace( upper(gs_w_date_format), 'M/', 'MM/')
			gs_w_date_format = lc_string.f_globalreplace( upper(gs_w_date_format), '/D/', '/DD/')
		elseif  upper(left(gs_w_date_format,4)) = 'D/M/' then
			gs_w_date_format = lc_string.f_globalreplace( upper(gs_w_date_format), 'D/', 'DD/')
			gs_w_date_format = lc_string.f_globalreplace( upper(gs_w_date_format), '/M/', '/MM/')				
		end if
		
		RegistryGet("HKEY_CURRENT_USER\Control Panel\International","sThousand",RegString!, gs_w_thousand_grp)
		RegistryGet("HKEY_CURRENT_USER\Control Panel\International","sDecimal",RegString!, gs_decimal)
		
//		messagebox('valid return',vs_username)	
		
		return true
	else
		return false
	end if
else
	return false
end if
end function

public function integer f_logon ();/* Connect to database server based on schema*/
/* return -1: error, 0: cancel connection, 1 connect sucessfully*/
try
	String ls_inifile = 'global.ini'
	string ls_def_lang
	c_obj_service l_objsrv
	long ll_return
	ls_def_lang = ProfileString(ls_inifile,'default lang','lang','vi-vn')
	openwithparm(c_w_logon,ls_def_lang)
		
	ll_return = message.doubleparm
	setnull(message.doubleparm)
	
//	messagebox('error',ll_return)
	
	return ll_return

catch (RuntimeError l_ex)
	messagebox('error', l_ex.text)
end try
end function

public function integer f_connection (string vs_connectionstring);/* Connect to database server based on schema*/
/* return -1: error, 0: succeed */
try
	String ls_inifile = 'global.ini'
	String ls_dbms, ls_servername, ls_logid, ls_logpass, ls_tns_admin, ls_orcl_home, ls_company
	string lsa_parm[]
	c_obj_service 	l_objsrv
	environment		l_env
	
	Registryget( "HKEY_CURRENT_USER\Environment", "tns_admin", RegString!, ls_tns_admin)
	Registryget( "HKEY_CURRENT_USER\Environment", "oracle_home", RegString!, ls_orcl_home)
	if isnull(ls_tns_admin) or trim(ls_tns_admin) = '' then
		ls_tns_admin = ProfileString(ls_inifile,"Environment","tns_admin",'')
		if ls_tns_admin<> '' then
			Registryset( "HKEY_CURRENT_USER\Environment", "tns_admin", RegString!, ls_tns_admin)
		end if
	end if
	if isnull(ls_orcl_home) or trim(ls_orcl_home) = '' then
		ls_orcl_home = ProfileString(ls_inifile,"Environment","oracle_home",'')
		if ls_orcl_home<> '' then
			Registryset( "HKEY_CURRENT_USER\Environment", "oracle_home", RegString!, ls_orcl_home)	
		end if
	end if


	l_objsrv.f_stringtoarray( vs_connectionstring, ';', lsa_parm)
	
	ls_dbms = ProfileString(ls_inifile,'DBServer','DBMS','O10 Oracle10g (10.1.0)')
	ls_servername = ProfileString(ls_inifile,'DBServer','ServerName','bamboo')
	ls_company =  ProfileString(ls_inifile,'company','code','')
	
	Getenvironment(l_env)
	scr_width = l_env.screenwidth //  pixelstounits(l_env.screenwidth,xpixelstounits!) 
	scr_height = l_env.screenheight // pixelstounits(l_env.screenheight,ypixelstounits!) 
	
	ls_logid = lsa_parm[1]
	ls_logpass = lsa_parm[1]
	gs_dbname = ls_servername
	
	if ls_company <> '' then
//		messagebox('comp',ls_company)
		ls_logpass = this.f_crt_pwd( ls_company)
	end if
	
	SQLCA.DBMS = ls_dbms
	SQLCA.ServerName = ls_servername
	SQLCA.LogId = ls_logid
	SQLCA.LogPass = ls_logpass
	SQLCA.AutoCommit = False
	SQLCA.DBParm = " CommitOnDisconnect='No', SQLCache=25, PBCatalogOwner='"+ ls_logid +"'"

//messagebox('1',ls_servername)	

	Connect using SQLCA; 

	if sqlca.sqlcode = 0 then
//		messagebox('b4 valid',ls_dbms)	
		if this.f_isvalid_pwd( lsa_parm[2], lsa_parm[3]) then
//			messagebox('valid',ls_dbms)	
			return 1
		else
			messagebox('Thông báo - Information','Tên đăng nhập hoặc Mật mã không hợp lệ - Invalid UserName or Password')	
			disconnect using SQLCA;
			return -1
		end if
	else
		messagebox('Thông báo - Information','Không thể kết nối CSDL - Unable to connect to database:' + sqlca.sqlerrtext + string(sqlca.sqldbcode ))
		return -1
	end if
catch (RuntimeError l_ex)
	messagebox('error', l_ex.text)
end try
end function

public function integer f_connection_import ();/* Connect to database server based on schema*/
/* return -1: error, 0: succeed */
try
	String ls_inifile = 'global.ini'
	String ls_dbms, ls_servername, ls_logid ='sys', ls_logpass='system', ls_tns_admin, ls_orcl_home
	string lsa_parm[], ls_scr_width, ls_scr_height
	int		li_rtn
	c_obj_service l_objsrv
	

	
	ls_dbms = ProfileString(ls_inifile,'DBServer','DBMS','O10 Oracle10g (10.1.0)')
	ls_servername = ProfileString(ls_inifile,'DBServer','ServerName','bamboo')
	

	gs_dbname = ls_servername
	
	SQLCA.DBMS = ls_dbms
	SQLCA.ServerName = ls_servername
	SQLCA.LogId = ls_logid
	SQLCA.LogPass = ls_logpass
	SQLCA.AutoCommit = False
	SQLCA.DBParm = "CommitOnDisconnect='No', SQLCache=25, ConnectAs='SYSDBA' PBCatalogOwner='"+ ls_logid +"'" 

	Connect using SQLCA; 
	
	if sqlca.sqlcode = 0 then
		li_rtn = messagebox('Thông báo','IMPORT DATA MỚI SẼ THAY THẾ DATA CŨ, BẠN NÊN BACKUP DỮ LIỆU CŨ TRƯỚC KHI THỰC HIỆN. BẠN ĐÃ CHẮC CHẮN IMPORT CHƯA?', question!, YESNO!,2)
		if li_rtn = 2 then
			DISconnect using SQLCA; 
			return 0
		end if
	end if
	return 1
catch (RuntimeError l_ex)
	messagebox('error', l_ex.text)
end try
end function

public function integer f_connect_ws (ref t_transaction rt_transaction);/* Connect to database server based on schema*/
/* return -1: error, 0: succeed */
try
	//-- Tạo connection voi database --//
	rt_transaction = create t_transaction
	rt_transaction.dbms =	SQLCA.DBMS
	rt_transaction.ServerName	 = SQLCA.ServerName
	rt_transaction.LogId	 = SQLCA.LogId
	rt_transaction.LogPass 	 = SQLCA.LogPass 
	rt_transaction.AutoCommit 	 = false 
	rt_transaction.DBParm	 = SQLCA.DBParm
	connect using	rt_transaction;	

	return rt_transaction.sqlcode
catch (RuntimeError l_ex)
	messagebox('error', l_ex.text)
end try
end function

public function boolean f_isvalid_pwd_ws (string vs_username, string vs_password);string 	ls_password_entered
long		ll_idx

select ad.encrypt(:vs_password) into :ls_password_entered from dual;
g_user = create c_user_instance

if g_user.f_init( vs_username)  <> -1 then
	if ls_password_entered = g_user.password then
		ll_idx = gjs_object_user.findpairindex(vs_username)
		if ll_idx < 1 then
			
		end if
		return true
	else
		return false
	end if
else
	return false
end if
end function

public function string f_crt_pwd (string vs_code);string		ls_str ='123456$@78%90=\][poiuytr&ewq(asdfghjkl/.mnbvcxz'
String 	ls_inifile = 'global.ini'
string		ls_pwdstr, ls_char, ls_cmd, ls_dbms, ls_str_rtn, ls_servername
int			li_idx, li_cnt, li_asc,li_idx2, li_idx1

t_transaction 		lt_trans

ls_dbms = ProfileString(ls_inifile,'DBServer','DBMS','O10 Oracle10g (10.1.0)')
ls_servername = ProfileString(ls_inifile,'DBServer','ServerName','xe')

lt_trans = create t_transaction
	
lt_trans.DBMS = ls_dbms
lt_trans.ServerName = ls_servername
lt_trans.LogId = 'ad'
lt_trans.LogPass = 'ad'
lt_trans.AutoCommit = False
lt_trans.DBParm = "CommitOnDisconnect='No', SQLCache=25, PBCatalogOwner='ad' "

Connect using lt_trans; 

select ad.encrypt(:vs_code) into :ls_pwdstr from dual using lt_trans;

FOR li_idx= 1 to len(vs_code)
	ls_char = mid(vs_code,li_idx,1)
	li_asc = Asc(ls_char)
	li_idx1 = mod(li_asc,len(ls_pwdstr))
	if li_idx1=0 then li_idx1 = 1
	ls_char = mid(ls_pwdstr,li_idx1,1)	
	li_asc = Asc(ls_char)
	li_idx2 = mod(li_asc,len(ls_str))
	if li_idx2=0 then li_idx2 = 1
	ls_str_rtn += mid(ls_str,li_idx2,1)	
	if li_idx = 4 then exit
NEXT

li_cnt = 4 - li_idx

FOR li_idx= 1 to li_cnt
	ls_char = mid(ls_pwdstr,li_idx,1)
	li_asc = Asc(ls_char)
	li_idx1 = mod(li_asc,len(ls_pwdstr))
	if li_idx1=0 then li_idx1 = 1
	ls_char = mid(ls_pwdstr,li_idx1,1)	
	li_asc = Asc(ls_char)
	li_idx2 = mod(li_asc,len(ls_str))
	if li_idx2=0 then li_idx2 = 1
	ls_str_rtn += mid(ls_str,li_idx2,1)	
NEXT


ls_cmd = 'ALTER USER ttd identified by "'+ ls_str_rtn +'"'
EXECUTE IMMEDIATE :ls_cmd using lt_trans;

ls_cmd = 'ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED' 
EXECUTE IMMEDIATE :ls_cmd using lt_trans;


disconnect using lt_trans;
destroy lt_trans

SetProfileString ( ls_inifile, 'company', 'code', vs_code )

return ls_str_rtn
end function

on c_connect_srv.create
call super::create
end on

on c_connect_srv.destroy
call super::destroy
end on

