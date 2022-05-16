$PBExportHeader$ttd.sra
$PBExportComments$Generated Application Object
forward
global type ttd from application
end type
global t_transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
string 	gs_user_lang, gs_dbname, gs_company, gs_branch ,gs_w_date_format, gs_w_thousand_grp, gs_decimal,gs_path_pic,gs_sob
string		is_module_code
double 	gi_user_comp_id
double	gi_userid
double 	gdb_branch
double	gdb_industry_id
date		gd_session_date
datetime	gdt_appUpdate_date
int								scr_width, scr_height

long 			gl_TabAreaColor, gl_ActiveBarColor, gl_splitebackcolor
string 		gs_solution_data, gs_registry
Boolean 		gbl_can_active = false
Boolean 		gbl_resize_old = false
Boolean 		gbl_default_layout =  false


c_user_instance			g_user
sailjson						gjs_object_user
end variables

global type ttd from application
string appname = "ttd"
string themepath = "theme"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = false
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 2
long richtexteditx64type = 3
long richtexteditversion = 1
string richtexteditkey = ""
string appicon = "Pics\cloud_ttd.ico"
string appruntimeversion = "21.0.0.1509"
boolean manualsession = false
boolean unsupportedapierror = true
end type
global ttd ttd

type prototypes
public function Long ShellExecute080(Long hwnd,String lpOperation,String lpFile,String lpParameters,String lpDirectory,Long nShowCmd) LIBRARY "shell32.dll" ALIAS FOR "ShellExecuteA"
public function Long ShellExecute100(Long hwnd,String lpOperation,String lpFile,String lpParameters,String lpDirectory,Long nShowCmd) LIBRARY "shell32.dll" ALIAS FOR "ShellExecuteA;ansi"
public FUNCTION ulong SetWindowLongA( ulong hWnd, int nIndex, long newValue ) LIBRARY "USER32.DLL"
end prototypes

type variables


end variables

on ttd.create
appname="ttd"
message=create message
sqlca=create t_transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on ttd.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;
int 					li_rtn
long 					ll_sessionid, ll_sid, ll_serial
string 				ls_service_name
c_connect_srv 		l_connect

li_rtn = l_connect.f_logon()
//messagebox('2',li_rtn)

If li_rtn = 1 then 
//	messagebox('3',gi_userid)
	open(t_w_mdi)
end if
end event

event close;//if isvalid(sqlca) then 
//	disconnect using sqlca;
//end if
halt close 
end event

event systemerror;long ll_return

rollback;
openwithparm(s_wr_mle, error)
ll_return = message.doubleparm
setnull(message.doubleparm)
if ll_return = 1 then
	halt close 
else
	return 
end if
end event

