$PBExportHeader$c_w_logon.srw
$PBExportComments$Core window logon
forward
global type c_w_logon from t_w_response
end type
type st_4 from t_st within c_w_logon
end type
type st_2 from t_st within c_w_logon
end type
type st_1 from statictext within c_w_logon
end type
type sle_usr from t_sle within c_w_logon
end type
type sle_pwd from t_sle within c_w_logon
end type
type ddlb_lang from t_ddlb within c_w_logon
end type
type p_1 from picture within c_w_logon
end type
end forward

global type c_w_logon from t_w_response
integer width = 1687
integer height = 1108
string title = "Đăng nhập"
string icon = "Pics\app.ico"
boolean clientedge = true
st_4 st_4
st_2 st_2
st_1 st_1
sle_usr sle_usr
sle_pwd sle_pwd
ddlb_lang ddlb_lang
p_1 p_1
end type
global c_w_logon c_w_logon

type variables
//
string		is_update_date
end variables
forward prototypes
public function string f_get_compile_str ()
end prototypes

public function string f_get_compile_str ();
string		ls_string


ls_string = " BEGIN "+&
"  FOR cur_rec IN (SELECT owner, "+&
"                         object_name, "+&
"                         object_type,  "+&
"                         DECODE(object_type, ~'PACKAGE~', 1, "+&
"                                             ~'PACKAGE BODY~', 2, 2) AS recompile_order "+&
"                  FROM   dba_objects "+&
"                  WHERE  object_type IN (~'PACKAGE~', ~'PACKAGE BODY~',~'VIEW~') "+&
"                  AND    status != ~'VALID~' "+&
"                  ORDER BY 4) "+&
"  LOOP "+&
"    BEGIN "+&
"      IF cur_rec.object_type = ~'PACKAGE~' or cur_rec.object_type = ~'VIEW~' THEN "+&
"        EXECUTE IMMEDIATE ~'ALTER ~' || cur_rec.object_type || "+&
"            ~'~"~' || cur_rec.owner || ~'~".~"' || cur_rec.object_name || ~'~" COMPILE~'; "+&
"      ELSE "+&
"        EXECUTE IMMEDIATE ~'ALTER PACKAGE ~' || cur_rec.owner ||  "+&
"            ~'~".~"~' || cur_rec.object_name || ~'~" COMPILE BODY~'; "+&
"      END IF; "+&
"    EXCEPTION "+&
"      WHEN OTHERS THEN "+&
"        DBMS_OUTPUT.put_line(cur_rec.object_type || ~' : ~' || cur_rec.owner ||  "+&
"                             ~' : ~' || cur_rec.object_name); "+&
"    END; "+&
"  END LOOP; "+&
" END; "

return ls_string
end function

on c_w_logon.create
int iCurrent
call super::create
this.st_4=create st_4
this.st_2=create st_2
this.st_1=create st_1
this.sle_usr=create sle_usr
this.sle_pwd=create sle_pwd
this.ddlb_lang=create ddlb_lang
this.p_1=create p_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_4
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.sle_usr
this.Control[iCurrent+5]=this.sle_pwd
this.Control[iCurrent+6]=this.ddlb_lang
this.Control[iCurrent+7]=this.p_1
end on

on c_w_logon.destroy
call super::destroy
destroy(this.st_4)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_usr)
destroy(this.sle_pwd)
destroy(this.ddlb_lang)
destroy(this.p_1)
end on

event open;call super::open;string 			ls_def_lang, ls_def_schema, lsa_lang[], lsa_schema[], ls_lang, ls_schema,ls_inifile
int 				li_idx
string 			ls_path, ls_multi_lang, ls_import

c_obj_service 	lc_objsrv
c_file 				cc_file 


this.setredraw( false)


ls_inifile ='global.ini'
ls_def_schema = ProfileString(ls_inifile,'default schema','schema','appbb')
ls_import =  ProfileString(ls_inifile,'default schema','import','No')
ls_multi_lang  =  ProfileString(ls_inifile,'default lang','multi','No')
ls_lang = ProfileString(ls_inifile,'lang','lang','vn')
ls_schema = 'TTD' 
lc_objsrv.f_stringtoarray( ls_lang, ';', lsa_lang)
lc_objsrv.f_stringtoarray( ls_schema, ';', lsa_schema)




	
	
ls_path = getcurrentdirectory()
gdt_appUpdate_date =  cc_file.f_getdetailof(ls_path+'\'+'bamboo-100.exe')
is_update_date = string(gdt_appUpdate_date)

ls_def_lang = ProfileString(ls_inifile,'default lang','lang','vi-vn')

if ls_def_lang = 'en-us' then
	st_1.text = 'Username'
	st_2.text = 'Password'
//	st_3.text = 'Database'
	st_4.text = 'Language'
	this.title = 'Logon'
//	st_5.text = 'Updated on ' + string(day(date(is_update_date))) + ' / ' +string(month(date(is_update_date))) +' /' + string(year(date(is_update_date)))	
elseif ls_def_lang = 'vi-vn' then
//	st_5.text = 'Cập nhật ngày ' + string(day(date(is_update_date))) + ' tháng ' +string(month(date(is_update_date))) +' năm ' + string(year(date(is_update_date)))		
end if



ddlb_lang.additem(ls_def_lang)
for li_idx = 1 to upperbound(lsa_lang)
	if lsa_lang[li_idx] = ls_def_lang then continue
	ddlb_lang.additem( lsa_lang[li_idx])
next
ddlb_lang.selectitem( 1)

if ls_multi_lang = 'No' then
	ddlb_lang.enabled = false
end if
//if ls_import = 'No' then
//	st_3.enabled = false
//end if

this.sle_usr.text = ProfileString(ls_inifile,'login','username','')
this.sle_usr.setposition( Totop!)
this.sle_pwd.setposition( totop!)
this.cb_ok.setposition( toTop!)
this.cb_cancel.setposition( Totop!)
this.ddlb_lang.setposition( toTop!)

this.st_1.setposition( Totop!)
this.st_2.setposition( totop!)
//this.st_3.setposition( toTop!)
this.st_4.setposition( toTop!)
//this.st_5.setposition( toTop!)
this.setredraw( true)
this.sle_usr.setfocus( )
this.sle_usr.selecttext( 1, len(sle_usr.text ))
return 0
end event

type cb_cancel from t_w_response`cb_cancel within c_w_logon
string accessibledescription = "logcancel"
integer x = 1074
integer y = 568
integer width = 306
integer taborder = 50
integer textsize = -9
end type

event cb_cancel::constructor;//
end event

event cb_cancel::getfocus;//
end event

event cb_cancel::clicked;call super::clicked;close(parent)
end event

type cb_ok from t_w_response`cb_ok within c_w_logon
string accessibledescription = "logok"
integer x = 741
integer y = 568
integer width = 306
integer taborder = 40
integer textsize = -9
boolean default = true
end type

event cb_ok::clicked;call super::clicked;string ls_connectionstring, ls_inifile = 'global.ini', ls_def_schema
c_connect_srv lc_connect_srv
//if isnull(ddlb_schema.text) or trim(ddlb_schema.text)=''  then
//	messagebox('information','Chưa chọn CSDL - database not yet selected')
//	
//	return -1
//end if
if isnull(ddlb_lang.text) or trim(ddlb_lang.text)=''  then
	messagebox('information','Chưa chọn ngôn ngữ - language not yet selected')
	ddlb_lang.setfocus( )
	return -1
end if
if isnull(sle_usr.text) or trim(sle_usr.text)=''  then
	messagebox('information','Chưa có tên đăng nhập - Username not yet entered')
	sle_usr.setfocus( )
	return -1
end if
if isnull(sle_pwd.text) or trim(sle_pwd.text) ='' then
	messagebox('information','Chưa nhập mật mã - Password not yet entered')
	sle_pwd.setfocus( )
	return -1
end if

ls_def_schema = ProfileString(ls_inifile,'default schema','schema','ttd')
ls_connectionstring = ls_def_schema + ';'+sle_usr.text+';' +sle_pwd.text
gs_user_lang = ddlb_lang.text

if lc_connect_srv.f_connection(ls_connectionstring) = 1 then
//	messagebox('connect','OK')
	
	SetProfileString("global.ini",  "default lang", "lang", ddlb_lang.text)
	SetProfileString("global.ini",  "login", "username", sle_usr.text)
//	SetProfileString("global.ini",  "default schema", "schema", ddlb_schema.text)
	gs_user_lang = ddlb_lang.text	
	closewithreturn(parent, 1)
	
//	messagebox('close','OK')
	
else
	sle_usr.setfocus( )
end if

end event

event cb_ok::constructor;//
end event

event cb_ok::getfocus;//
end event

type st_4 from t_st within c_w_logon
string accessibledescription = "loglang"
integer x = 197
integer y = 412
integer width = 439
integer height = 96
integer textsize = -9
long backcolor = 553648127
string text = "ngôn ngữ"
end type

event constructor;//--override --//

end event

event getfocus;//
end event

type st_2 from t_st within c_w_logon
string accessibledescription = "logpasword"
integer x = 197
integer y = 316
integer width = 439
integer height = 96
integer textsize = -9
long backcolor = 553648127
string text = "Mật mã"
end type

event constructor;//override

end event

event getfocus;//
end event

type st_1 from statictext within c_w_logon
integer x = 197
integer y = 220
integer width = 393
integer height = 92
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Tên đăng nhập"
boolean focusrectangle = false
end type

type sle_usr from t_sle within c_w_logon
event e_keydown pbm_keydown
integer x = 741
integer y = 220
integer width = 640
integer height = 96
integer taborder = 10
boolean bringtotop = true
integer textsize = -9
string text = ""
boolean border = false
textcase textcase = upper!
borderstyle borderstyle = stylebox!
end type

event e_keydown;if key = keyenter! then 
	Send( Handle(This), 256, 9, long(0,0) )
	return 1
end if
end event

event constructor;//

end event

event getfocus;//

end event

type sle_pwd from t_sle within c_w_logon
event e_keydown pbm_keydown
integer x = 741
integer y = 316
integer width = 640
integer height = 96
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
boolean border = false
boolean password = true
borderstyle borderstyle = stylebox!
boolean hideselection = false
end type

event e_keydown;if key = keyenter! then 
	Send( Handle(This), 256, 9, long(0,0) )
	return 1
end if
end event

event constructor;//
end event

event getfocus;//
this.SelectText(1, Len(this.Text))
end event

type ddlb_lang from t_ddlb within c_w_logon
event e_keydown pbm_keydown
integer x = 741
integer y = 412
integer width = 640
integer height = 260
integer taborder = 30
boolean bringtotop = true
boolean allowedit = true
boolean border = false
boolean sorted = false
boolean hscrollbar = true
boolean vscrollbar = true
string item[] = {""}
end type

event e_keydown;if key = keyenter! then 
	Send( Handle(This), 256, 9, long(0,0) )
	return 1
end if
end event

event constructor;//


end event

event getfocus;//
this.selecttext( 1, len(this.text))
end event

event selectionchanged;//-- Override --//

string	ls_def_lang

parent.setredraw(false)
st_1.setredraw( false)
st_2.setredraw( false)
st_4.setredraw( false)
//st_5.setredraw( false)
ls_def_lang = this.text(index)
if ls_def_lang = 'en-us' then
	st_1.text = 'Username'
	st_2.text = 'Password'
//	st_3.text = 'Database'
	st_4.text = 'Language'
	parent.title = 'Logon'
//	parent.st_5.text = 'Updated on ' + string(day(date(is_update_date))) + ' / ' +string(month(date(is_update_date))) +' /' + string(year(date(is_update_date)))		
elseif ls_def_lang = 'vi-vn' then
	st_1.text = 'Người dùng'
	st_2.text = 'Mật mã'
//	st_3.text = 'Database'
	st_4.text = 'Ngôn ngữ'	
	parent.title = 'Đăng nhập'
//	st_5.text = 'Cập nhật ngày ' + string(day(date(is_update_date))) + ' tháng ' +string(month(date(is_update_date))) +' năm ' + string(year(date(is_update_date)))		
end if
//parent.st_1.setposition( Totop!)
//parent.st_2.setposition( totop!)
//parent.st_4.setposition( toTop!)
st_1.setredraw( true)
st_2.setredraw( true)
st_4.setredraw( true)
//st_5.setredraw( true)
parent.setredraw( true)




parent.sle_usr.setfocus( )
end event

type p_1 from picture within c_w_logon
event e_mousemove pbm_mousemove
integer y = 8
integer width = 1673
integer height = 1008
integer transparency = 80
string picturename = "Pics\bamboo-2.png"
boolean focusrectangle = false
end type

event e_mousemove;
//st_3.textcolor = rgb(0,0,0)
end event

event clicked;this.post setredraw( false)
end event

