$PBExportHeader$t_w_mdi.srw
forward
global type t_w_mdi from window
end type
type mdi_1 from mdiclient within t_w_mdi
end type
type rbb_1 from u_rbb within t_w_mdi
end type
type p_1 from picture within t_w_mdi
end type
end forward

global type t_w_mdi from window
integer width = 3241
integer height = 1604
boolean titlebar = true
string title = "TTD"
string menuname = "m_mdi_none"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
windowtype windowtype = mdidock!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "Pics\app.ico"
boolean toolbarvisible = false
boolean center = true
windowanimationstyle openanimation = toproll!
windowanimationstyle closeanimation = bottomroll!
integer animationtime = 500
windowdockstate windowdockstate = windowdockstatetabbeddocument!
long titlebaractivecolor = 23853775
long titlebarinactivetextcolor = 16777215
windowdocktabshape tabbeddocumenttabshape = windowdocktabsingleslanted!
boolean tabbeddocumenttabscroll = true
windowdocktabshape tabbedwindowtabshape = windowdocktabsingleslanted!
boolean tabbedwindowtabicon = false
boolean tabbeddocumenttabcolorsusetheme = false
long tabbeddocumentactivetabbackcolor = 23853775
long tabbeddocumentactivetabgradientbackcolor = 134217730
long tabbeddocumentinactivetabtextcolor = 16777215
boolean tabbedwindowtabcolorsusetheme = false
long tabbedwindowactivetabtextcolor = 8388608
long tabbedwindowinactivetabtextcolor = 16777215
event destructor pbm_destructor
mdi_1 mdi_1
rbb_1 rbb_1
p_1 p_1
end type
global t_w_mdi t_w_mdi

type variables
Public:
string							is_mainObject, is_menu_code
boolean						ib_opening
double						idb_menu_id
c_ds_lang 					ids_lang_text
s_w_search					iw_search
t_w_main 					w[]
c_menu_mdi			ic_menu
Protected:

Private:
end variables

forward prototypes
public subroutine f_resize_w_menu ()
public subroutine f_resize_client_workspace ()
public function integer f_set_security (menu vm_menu)
public function integer f_sheetcount ()
public function window f_get_existed_sheet (string vs_window_sheet)
public function boolean f_issheetopening (window aw_sheet, string as_classname)
public subroutine f_open_w_background ()
public subroutine f_open_w_menu ()
public subroutine f_open_systray ()
public function integer wf_restore_sheets ()
public function window wf_get_sheet_win (string as_window)
public function window wf_get_sheet_doc (string vs_name)
public function window wf_get_sheet_grp (string as_group)
public function integer wf_get_sheet_max (string as_wintype)
public function integer wf_active_win (string as_window)
public function window wf_check_win_opened (string as_window)
public subroutine wf_close_sheet_win (string as_window)
public subroutine wf_close_sheet_grp (string as_group)
public subroutine wf_initialize_winproperty ()
public subroutine wf_initialize_windows ()
public function integer wf_open_sheet_doc (string as_win_param)
public function integer wf_open_sheet_win (string as_win_param, string as_position)
public subroutine f_create_win_menu (double vdb_module_id)
public function integer f_query_background (double vdb_menu_id, string vs_title)
public subroutine wf_reset_w_menu ()
public function double f_get_menu_id (string vs_object_name)
public function string f_get_menu_label (string vs_object_name)
public function integer wf_open_sheet_doc (s_object_display vpo_win_param, string vs_win_class)
public function integer f_resize_logo ()
public function integer f_show_logo (boolean vb_show)
public function integer f_delete_user_profile (string vs_object_name)
public function integer f_disconnect_sqlca ()
public function integer f_delete_user_profile_ex (string vs_object_name)
public subroutine f_resize ()
public function integer f_create_menu_json ()
public function integer f_create_ribbonbar ()
public function integer f_change_branch ()
public function integer f_change_company ()
end prototypes

event destructor;destroy g_user
destroy ids_lang_text
end event

public subroutine f_resize_w_menu ();integer li_x, li_y

try
	
	if isvalid(t_w_menu) then
		this.setredraw( false)
		t_w_menu.move(0, 0)
		t_w_menu.height = this.workspaceheight( )
		this.setredraw( true)
	end if
catch( RuntimeError lre)
//	openwithparm(c_w_err, lre.text)
end try
end subroutine

public subroutine f_resize_client_workspace ();integer lw, lh
t_w_main lw_sheet
// Get the current workspace measurements
lw = This.WorkSpaceWidth()
lh = This.WorkSpaceHeight()

rbb_1.width = lw

// Subtract the logo, MicroHelp from the height
lh = lh - (rbb_1.Y + rbb_1.Height)
//lh = lh - MDI_1.MicroHelpHeight
 
// Add the distance between the top of the frame
// (just below the menu bar or toolbar, if any)
// and top of the workspace.
lh = lh + This.WorkspaceY( )
 
// Move the client area below the picture control
MDI_1.Move(This.WorkspaceX( ),rbb_1.Y + rbb_1.Height)
 
// Resize the client area using the calculated dims
mdi_1.Resize(lw, lh)
mdi_1.setredraw( true)
this.setredraw( true)
try
	lw_sheet = this.getfirstsheet()
	DO while isvalid(lw_sheet)
		lw_sheet.setredraw( false)
		lw_sheet.hide( )
		lw_sheet.show( )
		lw_sheet.setredraw( true)
//		lw_sheet.move(This.WorkspaceX( ),rbb_1.y+ rbb_1.height)
//		
//		lw_sheet.resize(lw, lh)		
//		lw_sheet.setredraw( true)
		lw_sheet = this.getnextsheet(lw_sheet)
				
	LOOP
catch (runtimeerror lre)
//	openwithparm (c_w_err, lre.text)
end try

end subroutine

public function integer f_set_security (menu vm_menu);/* set security cho các module trên menu bar
	return -1: error
			 0: do nothing
			 1: succeed
*/
int li_m_items, li_idx, li_access_right, li_admin
string ls_m_name
try
	// check user admin ( khong set security)
//	SELECT count(*) into :li_admin
//	  FROM erp_role_user
//	WHERE user_id = :gi_userid and role_id = 1;
	
	if li_admin = 1 then
		return 0
	end if
	
	// neu không phải là user admin thi set security
	li_m_items = upperbound(vm_menu.item[1].item)
	FOR li_idx = 1 to li_m_items
		ls_m_name =vm_menu.item[1].item[li_idx].classname()
		
//		SELECT count(*) into :li_admin
//		  FROM erp_user_security
//		WHERE user_id = :gi_userid
//			AND company_id = :gi_user_comp_id
//			AND security_id = :ls_m_name;
		
		if li_admin > 0 then
//			SELECT access_right into :li_access_right
//			  FROM erp_user_security
//			WHERE user_id = :gi_userid
//				AND company_id = :gi_user_comp_id
//				AND security_id = :ls_m_name;
		else
//			SELECT max(access_right) into :li_access_right
//			  FROM erp_role_security
//			WHERE role_id in (select role_id from erp_role_user where user_id = :gi_userid)
//				AND company_id = :gi_user_comp_id
//				AND security_id = :ls_m_name
//			GROUP BY security_id;
		end if		
			
		If sqlca.sqlcode = 100 then
			li_access_right = 0
		elseif sqlca.sqlcode = -1 then
//			gf_messagebox('sql_select_error')
		end if
		if li_access_right = 0 then vm_menu.item[1].item[li_idx].enabled = false
	NEXT
	return 1
catch (runtimeerror lre)
//	openwithparm(c_w_err, lre.text)
end try

end function

public function integer f_sheetcount ();int li_sheet_count
t_w_main lw_sheet
try
	lw_sheet = this.getfirstsheet()
	DO while isvalid(lw_sheet)
		if lw_sheet.is_win_grp = 'DOC' then	li_sheet_count++
		lw_sheet = this.getnextsheet(lw_sheet)
	LOOP
	return li_sheet_count
catch (runtimeerror lre)
//	openwithparm (c_w_err, lre.text)
end try

end function

public function window f_get_existed_sheet (string vs_window_sheet);/* return null if no existed sheet, return window if existed */

window lw_sheet
powerobject			lpo_main

lw_sheet = this.getfirstsheet()
DO while isvalid(lw_sheet)
	lpo_main = lw_sheet.dynamic f_get_main_object()
	if lpo_main.classname() = vs_window_sheet then
		return lw_sheet
	end if
	lw_sheet = this.getnextsheet(lw_sheet)
LOOP

return lw_sheet

end function

public function boolean f_issheetopening (window aw_sheet, string as_classname);window	lw_sheet
boolean	lb_open

lw_sheet = this.GetFirstSheet()
if IsValid (lw_sheet) then
	do
		if ClassName (lw_sheet) = as_classname then
			lb_open = true
			aw_sheet = lw_sheet
			exit
		end if
		lw_sheet = this.GetNextSheet (lw_sheet)
	loop until IsNull(lw_sheet) Or not IsValid (lw_sheet)
end if

return lb_open
end function

public subroutine f_open_w_background ();//opensheet(s_w_background , t_w_mdi,0, Original!)
try 
//	w[1].resize(mdi_1.width, mdi_1.height)
	wf_open_sheet_doc( 'background;s_w_background;0;0')	
//	OpenSheetDocked ( w[1] , 's_w_background', t_w_mdi, WindowDockLeft!, 'iw_background' )
catch ( runtimeerror  l_rte )
	messagebox('Error', l_rte.text)
end try

// w[1].resize(mdi_1.width, mdi_1.height)
//wf_open_sheet_doc( 'background;s_w_background;0;0')

//OpenSheetAsDocument ( w[1], 's_w_background', t_w_mdi, 'iw_background' )

//li_open_rtn = OpenSheetwithParmAsDocument( w[li_win_num], vpo_win_param,vs_win_class, lw_refer, ls_id  )
end subroutine

public subroutine f_open_w_menu ();open(t_w_menu)
end subroutine

public subroutine f_open_systray ();//open window tray
Open(c_w_alert_popup)
end subroutine

public function integer wf_restore_sheets ();string s1[], s2[], ls_parm
integer li_start, li_end, li_i, li_rtn, li_pos
window 		lw_window


if gf_messagebox('m.t_w_mdi.wf_restore_sheets.01', 'Thông báo','Bạn muốn mở lại các màn hình đang làm việc lần trước không?','question','yesno',1) = 1 then

	li_rtn = LoadDockingState(gs_registry,s1,s2)
	
	if li_rtn < 0 then return li_rtn
	
	
	li_start = lowerbound(s1)
	li_end = upperbound(s2)
	
	if li_start > li_end then return -1
	
	for li_i = li_start to li_end
		li_pos = pos(s2[li_i],";")+1
		ls_parm = Mid(s2[li_i],li_pos)
		opensheetWithParmFromDockingState(lw_window,ls_parm,s1[li_i], this, s2[li_i])
	next
	
	return CommitDocking() 
else 
	return -1
end if

end function

public function window wf_get_sheet_win (string as_window);
//Get a TabbedDocument window in DockMDI window
// * If can't get a TabbedDocument window, DockMDI window would be returned

t_w_main 		win


win = this.getfirstsheet()
do while isvalid( win )
	if win.is_sheet_type = "WIN" and win.is_win_name = as_window then
		return win
	end if
	win = this.getnextsheet( win )
loop
setnull(win)
return win

end function

public function window wf_get_sheet_doc (string vs_name);
//Get a TabbedDocument window in DockMDI window
// * If can't get a TabbedDocument window, DockMDI window would be returned

t_w_main 		win

win = this.getfirstsheet()
do while isvalid( win )
	if win.is_win_name = vs_name  then
		return win
	end if
	win = this.getnextsheet( win )
loop
setnull(win)
return win

end function

public function window wf_get_sheet_grp (string as_group);
//Get a TabbedDocument window in DockMDI window
// * If can't get a TabbedDocument window, DockMDI window would be returned

t_w_main 		win


win = this.getfirstsheet()
do while isvalid( win )
	if win.is_win_grp = as_group then
		return win
	end if
	win = this.getnextsheet( win )
loop

return this

end function

public function integer wf_get_sheet_max (string as_wintype);integer li_win_cnt
choose case upper(as_wintype)
	case "DOC"
		
	case "TYPE"
		
	case "ALL"
		li_win_cnt = upperbound( w[] )
		
end choose

if li_win_cnt <  0 or isnull(li_win_cnt) then
	li_win_cnt = 0
end if

return li_win_cnt
end function

public function integer wf_active_win (string as_window);
t_w_main		 	lw_refer
s_object_display 	lod_handling 

lw_refer = wf_check_win_opened( as_window )
if isvalid( lw_refer ) then
	if isvalid(message.powerobjectparm) then
		lod_handling = lw_refer.f_get_obj_handling( )
		lod_handling.ipo_parm = message.powerobjectparm
		setnull(message.powerobjectparm)
		lw_refer.dynamic f_set_obj_handling(lod_handling )
	end if

	lw_refer.triggerevent( activate! )	
	lw_refer.setfocus()
	lw_refer.show()
	return 1
else
	return 0
end if

end function

public function window wf_check_win_opened (string as_window);
t_w_main		 ww


ww = this.getfirstsheet()
do while isvalid(ww)
	if lower(ww.is_win_name) = lower(as_window) then
		return ww
	end if
	ww=this.getnextsheet( ww )
loop

return ww

end function

public subroutine wf_close_sheet_win (string as_window);
//Get a TabbedDocument window in DockMDI window
// * If can't get a TabbedDocument window, DockMDI window would be returned

t_w_main 		win


win = this.getfirstsheet()
do while isvalid( win )
	if win.is_sheet_type = "WIN" and win.is_win_name = as_window then
		close(win)
	end if
	win = this.getnextsheet( win )
loop



end subroutine

public subroutine wf_close_sheet_grp (string as_group);
//Get a TabbedDocument window in DockMDI window
// * If can't get a TabbedDocument window, DockMDI window would be returned

t_w_main 		win, win_close


win = this.getfirstsheet()
do while isvalid( win )
	if win.is_win_grp= as_group then
		win_close = win
		win = this.getnextsheet( win )
		if win_close.is_win_name <> 'background' then close(win_close)
	else		
		win = this.getnextsheet( win )
	end if
loop



end subroutine

public subroutine wf_initialize_winproperty ();gl_tabAreaColor = RGB(207,250,107)	
gl_ActiveBarColor = RGB(255,243,205)
gl_splitebackcolor= rgb(188, 199, 216 )

gl_tabAreaColor = RGB(128,0,64)	
gl_ActiveBarColor = RGB(255,231,99)
gl_splitebackcolor= rgb(188, 199, 216 )
 
this.TabbedDocumentTabsAreaColor = gl_tabAreaColor
this.TabbedDocumentTabsAreaGradientColor = gl_tabAreaColor
This.TabbedWindowTabsAreaColor =	gl_tabAreaColor
This.TabbedWindowTabsAreaGradientColor =	gl_tabAreaColor

this.TabbedDocumentInActiveTabBackColor = gl_tabAreaColor
this.TabbedDocumentInActiveTabGradientBackColor = gl_tabAreaColor
This.TabbedWindowInActiveTabBackColor =	gl_tabAreaColor
This.TabbedWindowInActiveTabGradientBackColor =	gl_tabAreaColor

this.TabbedDocumentActiveTabBackColor = gl_ActiveBarColor
this.TabbedDocumentActiveTabGradientBackColor = gl_ActiveBarColor
This.TabbedWindowActiveTabBackColor =	gl_ActiveBarColor
This.TabbedWindowActiveTabGradientBackColor =	gl_ActiveBarColor


This.titleBarInactiveColor = 	gl_tabAreaColor
This.titleBarInactiveGradientColor = 	gl_tabAreaColor
This.titleBarActiveColor = 	gl_ActiveBarColor
This.titleBarActiveGradientColor = 	gl_ActiveBarColor

gs_registry = "\TTD\Demo" // profilestring("dockwindow.ini", "registry", "RegistryName", "dockwindowtest")
gs_solution_data = "APP"


end subroutine

public subroutine wf_initialize_windows ();
int					li_idx
double			lb_module_id
string				ls_role_user, ls_menu_parm, ls_module_name, ls_menu_code
t_ds_db			lds_menu		
c_string			lc_string
c_menu_item	lc_menu_item


//-- open window background --//
//wf_open_sheet_doc("u_background;s_w_background;1;Start Page")

//-- open win menu --//
this.f_create_win_menu( g_user.default_mod)


//wf_open_sheet_win("OutPut", "Bottom")
//wf_open_sheet_win("ErrorList", "Bottom")



//wf_open_sheet_win("Properties", "Right")
//wf_open_sheet_win("PBObject", "Right")
//
//wf_open_sheet_doc("Start Page")
//

end subroutine

public function integer wf_open_sheet_doc (string as_win_param);/***********************************************************
Chức năng:
----------------------------
Parm: as_win_param: chuỗi thông tin: object_name+';'+win_name+';'+menu_id+';'+menu_Label
-----------------------------------------------------------------------------
Return:
====================================================*/

integer 				li_win_num, li_open_rtn
string 				ls_win_parm, ls_id , ls_parm[], ls_winname_chk
window	 			lw_refer
c_string 				lc_string


lc_string.f_stringtoarray( as_win_param , ';', ls_parm[])

ls_win_parm =  ls_parm[1]+';'+ ls_parm[3]+';'+ls_parm[4]+';DOC'

//Check document window has been opened or not
//if opened then active , else open it
if  ls_parm[1] <> 'u_valueset_entry' then
	ls_winname_chk = ls_parm[1]
else
	ls_winname_chk = ls_parm[1] + 	 ls_parm[3]
end if
if wf_active_win(ls_winname_chk) > 0 then
	return 1
end if


//open it
ls_id = f_getrand() + ";" + ls_win_parm
li_win_num = wf_get_sheet_max("ALL") + 1
if  ls_parm[2] = 's_w_background' then
	li_win_num = 1
elseif li_win_num = 1 then
	li_win_num = 2
end if
lw_refer = wf_get_sheet_grp('DOC')

if isvalid( lw_refer )  then	
	li_open_rtn = OpenSheetwithParmAsDocument( w[li_win_num], ls_win_parm, ls_parm[2], lw_refer, ls_id  )

else
	Messagebox( "Parameter : " + as_win_param, "System can't find corresponding window !")
	li_open_rtn = -1
end if
p_1.visible = false
return li_win_num
end function

public function integer wf_open_sheet_win (string as_win_param, string as_position);/***********************************************************
Chức năng:
----------------------------
Parm: as_win_param: chuỗi thông tin: module_id+';'+win_name+';'+menu_Label
-----------------------------------------------------------------------------
Return:
====================================================*/

integer 				li_win_num, li_open_rtn
string 				ls_win_parm, ls_id , ls_parm[]
window					lw_refer
c_string 						lc_string
Windowdockposition		lwdp



lc_string.f_stringtoarray( as_win_param , ';', ls_parm[])

ls_win_parm =  ls_parm[1]+';'+ ls_parm[3]+';WIN'+';'+ upper( as_position )


if wf_active_win(ls_win_parm) > 0 then
	return 1
end if

// open it
ls_id = f_getrand() + ";" + ls_win_parm
choose case upper( as_position )
	case "TOP"
		lwdp = WindowDockTop!		
	case "BOTTOM"
		lwdp = WindowDockBottom!
	case "LEFT"
		lwdp = WindowDockLeft!	
	case "RIGHT"
		lwdp = WindowDockRight!
		
end choose

//  Get refer window whether open or not, 
//  if opened then open in tabgroup, 
//  else opened with new dock window
lw_refer = wf_get_sheet_grp( upper( as_position ) )

li_win_num = wf_get_sheet_max("ALL") + 1

if isvalid( lw_refer ) and lw_refer.windowtype <> mdidock! then
	li_open_rtn = OpenSheetwithParmInTabGroup( w[li_win_num], ls_win_parm, ls_parm[2], lw_refer, ls_id  )
else
	li_open_rtn = OpenSheetWithParmDocked( w[li_win_num], ls_win_parm, ls_parm[2], lw_refer, lwdp , ls_id  )
end if

return li_win_num
end function

public subroutine f_create_win_menu (double vdb_module_id);
int					li_idx
double			lb_module_id, lb_module_query
string				ls_role_user, ls_menu_parm, ls_module_name, ls_menu_code, ls_title_query
t_ds_db			lds_menu		
c_string			lc_string
c_menu_item	lc_menu_item

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

//-- xóa menu cũ --//
this.wf_close_sheet_grp( 'LEFT')

//-- open win menu --//
lds_menu = create t_ds_db
if gi_userid > 0 then
	ls_role_user = g_user.f_get_current_role_user_string( )
	ls_role_user = lc_string.f_globalreplace( ls_role_user, ';', ';)|(;')
	ls_role_user = "(;"+ls_role_user+";)"	
	lds_menu.dataobject = 'd_submodule'
	lds_menu.settransobject( lt_transaction)	
	lds_menu.retrieve(gi_user_comp_id, ls_role_user, vdb_module_id, gs_user_lang, gdb_branch)
else
	lds_menu.dataobject = 'd_submodule_admin'
	lds_menu.settransobject( lt_transaction)
	lds_menu.retrieve(vdb_module_id, gs_user_lang, gi_user_comp_id, gdb_branch )
end if
ls_menu_code = lc_menu_item.f_get_menu_code_ex(vdb_module_id, lt_transaction)
is_module_code = ls_menu_code
if lds_menu.rowcount( ) > 0 then
	
	FOR li_idx = 1 to  lds_menu.rowcount( )
		
		ls_menu_parm = ''
		lb_module_id = lds_menu.getitemnumber( li_idx, 'menu_id')
		ls_menu_parm += string(lb_module_id) +';'+'t_w_menu'+';'
		ls_module_name = lds_menu.getitemstring( li_idx, 'text')
		ls_title_query =  lds_menu.getitemstring( li_idx, 'ttdhelp')
		ls_menu_parm += ls_module_name +';' 
		wf_open_sheet_win(ls_menu_parm, "Left")
		lb_module_query = lb_module_id
//		ls_title_query = ls_module_name
	NEXT
else
	ls_menu_parm += string(vdb_module_id) +';'+'t_w_menu'+';'
	ls_module_name = this.ids_lang_text.f_get_lang_text( ls_menu_code )
	ls_menu_parm += ls_module_name +';'
	wf_open_sheet_win(ls_menu_parm, "Left")
	lb_module_query = vdb_module_id
//	ls_title_query = ls_module_name	
end if

disconnect using lt_transaction;
destroy lt_transaction

//this.f_query_background( lb_module_query, ls_title_query)


end subroutine

public function integer f_query_background (double vdb_menu_id, string vs_title);t_w_main 			lw_background

lw_background = this.wf_get_sheet_doc('background')
if isvalid(lw_background)  then
	lw_background.title =  vs_title
	lw_background.dynamic f_query(vdb_menu_id)
end if

return 1
end function

public subroutine wf_reset_w_menu ();
int					li_idx
string				ls_role_user
t_ds_db			lds_menu		
c_string			lc_string

//-- open window background --//
wf_open_sheet_doc("u_background;s_w_background;Start Page")

//-- open win menu --//
lds_menu = create t_ds_db
if gi_userid > 0 then
	ls_role_user = g_user.f_get_current_role_user_string( )
	ls_role_user = lc_string.f_globalreplace( ls_role_user, ';', ';)|(;')
	ls_role_user = "(;"+ls_role_user+";)"	
	lds_menu.dataobject = 'd_submodule'
	lds_menu.settransobject( sqlca)	
	lds_menu.retrieve(gi_user_comp_id, gi_userid, ls_role_user,  g_user.default_mod, gs_user_lang)
else
	lds_menu.dataobject = 'd_submodule_admin'
	lds_menu.settransobject( sqlca)
	lds_menu.retrieve(g_user.default_mod, gs_user_lang)
end if
if lds_menu.rowcount( ) > 0 then
	FOR li_idx = 1 to  lds_menu.rowcount( )
//		wf_open_sheet_win("Solution", "Left")
	NEXT
else
//	wf_open_sheet_win("Toolbox", "Left")
end if




//wf_open_sheet_win("OutPut", "Bottom")
//wf_open_sheet_win("ErrorList", "Bottom")



//wf_open_sheet_win("Properties", "Right")
//wf_open_sheet_win("PBObject", "Right")
//
//wf_open_sheet_doc("Start Page")
//

end subroutine

public function double f_get_menu_id (string vs_object_name);int				ll_row
double		ldb_id

if isvalid(ic_menu.ids_menu_all) then
	ll_row = ic_menu.ids_menu_all.find("tv_object ='" + vs_object_name+"'", 1, ic_menu.ids_menu_all.rowcount())
	if ll_row > 0 then
		ldb_id =  ic_menu.ids_menu_all.getitemnumber( ll_row, 'menu_id')
		return ldb_id
	end if
end if
return 0
end function

public function string f_get_menu_label (string vs_object_name);int				ll_row
string			ls_label

if isvalid(ic_menu.ids_menu_all) then
	ll_row = ic_menu.ids_menu_all.find("tv_object ='" + vs_object_name+"'", 1, ic_menu.ids_menu_all.rowcount())
	if ll_row > 0 then
		ls_label =  ic_menu.ids_menu_all.getitemstring( ll_row, 'tv_label')
		return ls_label
	end if
end if
return ''
end function

public function integer wf_open_sheet_doc (s_object_display vpo_win_param, string vs_win_class);/***********************************************************
Chức năng:
----------------------------
Parm: as_win_param: chuỗi thông tin: object_name+';'+win_name+';'+menu_id+';'+menu_Label
-----------------------------------------------------------------------------
Return:
====================================================*/
double 				ldb_menu_id
integer 				li_win_num, li_open_rtn
string 				ls_win_parm, ls_id , ls_parm[], ls_title
window	 			lw_refer


ldb_menu_id = this.f_get_menu_id(vpo_win_param.classname() )

ls_title = mid(vpo_win_param.is_object_title,1, pos(vpo_win_param.is_object_title, ':') -1 )
//if 
ls_win_parm = vpo_win_param.classname()+';'+ string(ldb_menu_id) +';' + ls_title +';'+ 'DOC'  // ls_parm[1]+';'+ ls_parm[3]+';'+ls_parm[4]+';DOC'
//Check document window has been opened or not
//if opened then active , else open it
message.powerobjectparm = vpo_win_param.ipo_parm
if wf_active_win(vpo_win_param.is_object_title) > 0 then
	destroy vpo_win_param
	return 1
end if

setnull(message.powerobjectparm)

//open it
ls_id = f_getrand() + ";" + ls_win_parm
li_win_num = wf_get_sheet_max("ALL") + 1
if li_win_num = 1 then li_win_num = 2
lw_refer = wf_get_sheet_grp('DOC')

if isvalid( lw_refer )  then	
	li_open_rtn = OpenSheetwithParmAsDocument( w[li_win_num], vpo_win_param,vs_win_class, lw_refer, ls_id  )
else
	Messagebox( "Parameter : " + ls_win_parm, "System can't find corresponding window !")
	li_open_rtn = -1
end if

return li_win_num
end function

public function integer f_resize_logo ();
//if this.f_sheetcount( ) > 0 then
//	p_1.visible = false
//else
//	p_1.move(mdi_1.x, mdi_1.y)
//	p_1.width = mdi_1.width 
//	p_1.height = mdi_1.height - mdi_1.microhelpheight
//	p_1.visible = true
//end if

return 0
end function

public function integer f_show_logo (boolean vb_show);//
//if vb_show then
//	p_1.setposition( toTop!)
//else
//	p_1.setposition( toBottom!)
//end if

return 0
end function

public function integer f_delete_user_profile (string vs_object_name);int						li_rtn
t_transaction		lt_transaction

//-- Tạo connection voi database --//
lt_transaction = create t_transaction
lt_transaction.dbms =	SQLCA.DBMS
lt_transaction.ServerName	 = SQLCA.ServerName
lt_transaction.LogId	 = SQLCA.LogId
lt_transaction.LogPass 	 = SQLCA.LogPass 
lt_transaction.AutoCommit 	 = false 
lt_transaction.DBParm	 = SQLCA.DBParm
connect using	lt_transaction;	

delete user_profile where user_id = :gi_userid and lower(OBJECT_NAME) =  lower(:vs_object_name) using lt_transaction;
commit using lt_transaction;

li_rtn  = lt_transaction.sqlcode

disconnect  using lt_transaction;
destroy   lt_transaction;

return li_rtn
end function

public function integer f_disconnect_sqlca ();
disconnect using sqlca;
return 0
end function

public function integer f_delete_user_profile_ex (string vs_object_name);int						li_rtn
t_transaction		lt_transaction

//-- Tạo connection voi database --//
lt_transaction = create t_transaction
lt_transaction.dbms =	SQLCA.DBMS
lt_transaction.ServerName	 = SQLCA.ServerName
lt_transaction.LogId	 = SQLCA.LogId
lt_transaction.LogPass 	 = SQLCA.LogPass 
lt_transaction.AutoCommit 	 = false 
lt_transaction.DBParm	 = SQLCA.DBParm
connect using	lt_transaction;	

delete user_profile where user_id = :gi_userid and lower(OBJECT_NAME) =  lower(:vs_object_name) using lt_transaction;
commit using lt_transaction;

li_rtn  = lt_transaction.sqlcode

disconnect  using lt_transaction;
destroy   lt_transaction;

return li_rtn
end function

public subroutine f_resize ();
end subroutine

public function integer f_create_menu_json ();

return 1
end function

public function integer f_create_ribbonbar ();int					li_item_cnt, li_panel_cnt,li_lbtn_cnt, li_idx, li_idx1,li_idx2, li_found, li_del_cnt, li_del_item_cnt
string				ls_role_user
double			ldb_module_id
t_ds_db							lds_fm_sub, lds_ad_sub
c_string							lc_string
c_menu_item			lc_menu_item
RibbonCategoryItem			l_rci
RibbonPanelItem				l_rpi
RibbonLargeButtonItem 		l_rlbi
RibbonMenu						l_rMenu		
RibbonMenuItem				l_rmitem


rbb_1.importfromjsonfile( "JsonFile1.json")
//-- category home - panel thường dùng  --//
//rbb_1.getcategorybyindex( 1, l_rci)
//rbb_1.getchilditembyindex( l_rci.itemhandle, 8, l_rpi)
//rbb_1.deletepanel(l_rpi.itemhandle )
//-- category home - panel đối tượng liên quan --//
//rbb_1.getchilditembyindex( l_rci.itemhandle, 7, l_rpi)
//rbb_1.deletepanel(l_rpi.itemhandle )

//-- category workspace --//
if gi_userid > 0 then
	g_user.f_init_policy_datastore_ex( sqlca)
	
	
	ls_role_user = g_user.f_get_current_role_user_string( )
	ls_role_user = lc_string.f_globalreplace( ls_role_user, ';', ';)|(;')
	ls_role_user = "(;"+ls_role_user+";)"	
	
	lds_fm_sub = create t_ds_db
	lds_fm_sub.dataobject = 'd_submodule'
	lds_fm_sub.settransobject( sqlca)	
	ldb_module_id = lc_menu_item.f_get_menu_id_ex( 'fm',sqlca)
	lds_fm_sub.retrieve(gi_user_comp_id, ls_role_user, ldb_module_id, gs_user_lang, gdb_branch)
	lds_ad_sub = create t_ds_db
	lds_ad_sub.dataobject = 'd_submodule'
	lds_ad_sub.settransobject( sqlca)	
	ldb_module_id = lc_menu_item.f_get_menu_id_ex( 'ad',sqlca)
	lds_ad_sub.retrieve(gi_user_comp_id, ls_role_user, ldb_module_id, gs_user_lang, gdb_branch)
		
	rbb_1.getcategorybyindex( 2, l_rci)
	li_panel_cnt = rbb_1.getchilditemcount(l_rci.itemhandle )
	FOR li_idx = li_panel_cnt to 1 step -1
		rbb_1.getchilditembyindex( l_rci.itemhandle, li_idx, l_rpi)
		li_lbtn_cnt = rbb_1.getchilditemcount(l_rpi.itemhandle )
		li_del_cnt = 0
		FOR li_idx1 = li_lbtn_cnt to 1 step -1
			rbb_1.getchilditembyindex( l_rpi.itemhandle, li_idx1, l_rlbi)			
			if l_rlbi.tag = 'ad' then
				rbb_1.getmenubybuttonhandle(l_rlbi.itemhandle , l_rMenu)
				li_item_cnt = l_rMenu.getitemcount( )
				FOR li_idx2 = li_item_cnt to 1 step -1
					l_rMenu.getitem( li_idx2 , l_rmitem)
					li_found = lds_ad_sub.find( " menu_code='"+l_rmitem.tag +"'", 1, lds_ad_sub.rowcount())	
					if li_found = 0 then
						l_rMenu.deleteitem(li_idx2 )			
						li_del_item_cnt++
					end if
				NEXT	
				if li_del_item_cnt = li_item_cnt then
					rbb_1.deletelargebutton(l_rlbi.itemhandle )
					li_del_cnt++
				end if				
			elseif left(l_rlbi.tag,2) = 'fm' then
				li_found = lds_fm_sub.find( " menu_code='"+l_rlbi.tag +"'", 1, lds_fm_sub.rowcount())		
				if li_found = 0 then
					rbb_1.deletelargebutton(l_rlbi.itemhandle )
					li_del_cnt++
				end if			
			else
				li_found = g_user.ids_security_module.find( " identification_code='"+l_rlbi.tag +"'", 1, g_user.ids_security_module.rowcount())		
				if li_found = 0 then
					rbb_1.deletelargebutton(l_rlbi.itemhandle )
					li_del_cnt++
				end if
			end if
		NEXT
		//-- delete panel --//
		if li_del_cnt = li_lbtn_cnt then
			rbb_1.deletepanel( l_rpi.itemhandle )
		end if
	NEXT
end if
return 1
end function

public function integer f_change_branch ();string					ls_rtn, ls_company_name,ls_branch_name
double				ldb_menu_id
c_string				lc_string
t_w_main				lw_handle
t_dw_mpl			ldw_main, ldw_focus
s_object_display	lc_obj_handling
u_select_branch	lc_select_branch
c_menu_item			lc_menu_item
b_obj_instantiate		lboi_handle

lw_handle = this.getactivesheet( )
do while isvalid(lw_handle)		
	if lw_handle.classname( ) <> 's_w_background' then
		//--nếu đang copy_line thì không đc chuyển chi nhánh( đến khi phát triển chức năng kết phiếu khác chi nhánh thì rào lại)--//
		lc_obj_handling = lw_handle.dynamic f_get_obj_handling( )
		if not isvalid(lc_obj_handling) then
			lw_handle =  this.getnextsheet(lw_handle)
			continue
		end if 
		if lc_obj_handling.ib_copy_line then
			gf_messagebox('m.t_m_mdi.m_branch.02','Thông báo','Đang kết chi tiết mặt hàng nên không được chuyển chi nhánh!','exclamation','ok',1)
			return -1
		end if
		ldw_focus = lw_handle.dynamic f_get_idwfocus( )
		if ldw_focus.f_get_ib_editing( ) then
			gf_messagebox('m.t_m_mdi.m_branch.01','Thông báo','Phải lưu dữ liệu đang soạn thảo trước khi chuyển chi nhánh:@'+ lw_handle.title,'exclamation','ok',1)
			return -1
		end if
	end if
	lw_handle =  this.getnextsheet(lw_handle)
loop

//openwithparm(s_wr_multi,'c_select_branch;0')
lc_select_branch = create using 'u_select_branch'
openwithparm(s_wr_multi,lc_select_branch)
ls_rtn = message.stringparm
setnull(message.stringparm)
if isnull(ls_rtn) or ls_rtn ='' then return 0
//this.text = ls_rtn

this.wf_close_sheet_grp('DOC')
//if isnull(is_module_code) or is_module_code =  '' then
//	ldb_menu_id = lc_menu_item.f_get_menu_id_ex( 'ad')
//else
//	ldb_menu_id = lc_menu_item.f_get_menu_id_ex( is_module_code)
//end if
//t_w_mdi.f_create_win_menu(ldb_menu_id )
ls_company_name =lboi_handle.f_get_branch_name_ex( gi_user_comp_id )
ls_branch_name =lboi_handle.f_get_branch_name_ex( gdb_branch )
this.title = ls_company_name + ' | '+ ls_branch_name + ' | ' + g_user.name +' | Phiên bản:'+string(gdt_appUpdate_date)
return 1
end function

public function integer f_change_company ();string					ls_rtn, ls_return[], ls_company_name, ls_branch_name
double				ldb_menu_id
c_string				lc_string
window				lw_handle
t_dw_mpl			ldw_main, ldw_focus
s_object_display	lc_obj_handling
u_select_company	lc_select_company
c_menu_item		lc_menu_item
b_obj_instantiate		lboi_handle

if isvalid(this.getactivesheet( ) )  then
	lw_handle = this.getactivesheet( )
	do while isvalid(lw_handle)		
		if lw_handle.classname( ) <> 's_w_background' then
			//--nếu đang copy_line thì không đc chuyển công ty( đến khi phát triển chức năng kết phiếu khác công ty thì rào lại)--//
			lc_obj_handling = lw_handle.dynamic f_get_obj_handling( )
			if not isvalid(lc_obj_handling) then
				lw_handle =  this.getnextsheet(lw_handle)
				continue 
			end if
			if lc_obj_handling.ib_copy_line then
				gf_messagebox('m.t_m_mdi.m_company.02','Thông báo','Đang kết chi tiết mặt hàng nên không được chuyển công ty!','exclamation','ok',1)
				return -1
			end if
			ldw_focus = lw_handle.dynamic f_get_idwfocus( )
			if ldw_focus.f_get_ib_editing( ) then
				gf_messagebox('m.t_m_mdi.m_company.01','Thông báo','Phải lưu dữ liệu đang soạn thảo trước khi chuyển công ty:@'+ lw_handle.title,'exclamation','ok',1)
				return -1
			end if
		end if
		lw_handle =  this.getnextsheet(lw_handle)
	loop
end if


lc_select_company = create u_select_company
openwithparm(s_wr_multi,lc_select_company)
ls_rtn = message.stringparm
setnull(message.stringparm)
if isnull(ls_rtn) or ls_rtn ='' then return 0
lc_string.f_stringtoarray(ls_rtn, ';',  ls_return[])

this.wf_close_sheet_grp('DOC')
//this.text = ls_return[1]
//m_branch.text = ls_return[2]
//if isnull(is_module_code) or is_module_code =  '' then
//	ldb_menu_id = lc_menu_item.f_get_menu_id_ex( 'ad')
//else
//	ldb_menu_id = lc_menu_item.f_get_menu_id_ex( is_module_code)
//end if
//t_w_mdi.f_create_win_menu(ldb_menu_id )

ls_company_name =lboi_handle.f_get_branch_name_ex( gi_user_comp_id )
ls_branch_name =lboi_handle.f_get_branch_name_ex( gdb_branch )
this.title = ls_company_name + ' | '+ ls_branch_name + ' | ' + g_user.name +' | Phiên bản:'+string(gdt_appUpdate_date)
return 1
end function

on t_w_mdi.create
if this.MenuName = "m_mdi_none" then this.MenuID = create m_mdi_none
this.mdi_1=create mdi_1
this.rbb_1=create rbb_1
this.p_1=create p_1
this.Control[]={this.mdi_1,&
this.rbb_1,&
this.p_1}
end on

on t_w_mdi.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
destroy(this.rbb_1)
destroy(this.p_1)
end on

event open;//t_m_mdi 				lm_menu
b_obj_instantiate		lboi_handle
string						ls_company_code, ls_brand_code

//messagebox('tmdi_open',gi_userid)

//rbb_1.importfromxmlfile( "toolbar2.xml")
//rbb_1.importfromxmlfile( "XmlFile1.xml")

//rbb_1.importfromjsonfile( "JsonFile1.json")
this.f_create_ribbonbar( )
//wf_initialize_winproperty( )


ib_opening = true
//g_user.f_init(gi_userid) //-- đã init lúc đăng nhập --//
g_user.f_init_policy_datastore( )

//-- set language --//
ids_lang_text = create c_ds_lang
ids_lang_text.dataobject = 'ds_label_all'
ids_lang_text.settransobject( sqlca)
ids_lang_text.retrieve( gs_user_lang, gdb_industry_id)
//lm_menu = this.menuId

//-- open window search--//
//open(iw_search, 's_w_search')
//iw_search.show( )

//messagebox('2',gi_userid)

this.f_open_w_background( )

//messagebox('3',gi_userid)

//if gs_user_lang <> 'vi-vn' then 	 	
//	ids_lang_text.f_set_menu_lang(lm_menu)
//end if
//lm_menu.item[5].text = gs_company
//lm_menu.item[6].text = gs_branch
//if gs_sob = 'T' then lm_menu.item[8].text = '[Thuế]'
//lm_menu.f_set_security_module( )
//gd_session_date = today()
//
//if gs_user_lang = 'vi-vn' then 
//	lm_menu.m_sessiondate.text = '[Ngày giao dich: '+string(today(),gs_w_date_format)+']'
//elseif gs_user_lang = 'en-us' then 
//	lm_menu.m_sessiondate.text = '[Session date: '+string(today(),gs_w_date_format)+']'
//end if


ls_company_code =lboi_handle.f_get_branch_name( gi_user_comp_id )
ls_brand_code=lboi_handle.f_get_branch_name( gdb_branch )
if isnull(ls_brand_code) then ls_brand_code = '[Chi nhánh]'
if isnull(ls_company_code) then ls_company_code = '[Công ty]'
//-- set title window MDI --//
if gs_user_lang = 'vi-vn' then 	
	this.title = ls_company_code + ' | '+ ls_brand_code + ' | ' + g_user.name +' | Phiên bản: '+string(gdt_appUpdate_date)
elseif gs_user_lang = 'en-us' then 
	this.title = ls_company_code + ' | '+ ls_brand_code + ' | ' + g_user.name +' | Version: '+string(gdt_appUpdate_date)	
end if


//-- open systray --//
//this.post f_open_systray()

//lưu đường dẫn thư mục
//gs_path_pic = GetCurrentDirectory ( )
//-- tạo đối tượng menu --//
//ic_menu = create c_menu_mdi

//if wf_restore_sheets() < 0 then
//	wf_initialize_windows( )
//end if

gbl_can_active = true
//p_1.setredraw(false)

//this.post f_resize_logo( )

this.post f_disconnect_sqlca( )

//messagebox('4',gi_userid)
end event

event close;
integer li_rtn

destroy ids_lang_text
if not gbl_default_layout then
	li_rtn = this.SaveDockingState( gs_registry )
end if

halt 
end event

event resize;
integer lw, lh
// Get the current workspace measurements
lw = This.WorkSpaceWidth()
lh = This.WorkSpaceHeight()

rbb_1.width = lw

// Subtract the logo, MicroHelp from the height
lh = lh - (rbb_1.Y + rbb_1.Height)
//lh = lh - MDI_1.MicroHelpHeight
 
// Add the distance between the top of the frame
// (just below the menu bar or toolbar, if any)
// and top of the workspace.
lh = lh + This.WorkspaceY( )
 
// Move the client area below the picture control
MDI_1.Move(This.WorkspaceX( ), rbb_1.Y + rbb_1.Height)
 
// Resize the client area using the calculated dims
mdi_1.Resize(lw, lh)


//rbb_1.move(0, 0  )
//rbb_1.width = newwidth
////resize mdi_1 based on RibbonBar
//mdi_1.move (0, rbb_1.height)
//mdi_1.resize (newwidth, newheight - rbb_1.height )


/*
//resize RibbonBar
rbb_1.move(0, newheight - this.workspaceheight()  )
rbb_1.width = newwidth
//resize mdi_1 based on RibbonBar
mdi_1.move (0, rbb_1.height + newheight - this.workspaceheight())
mdi_1.resize (newwidth, newheight - rbb_1.height - ( newheight - this.workspaceheight()))
*/
end event

event closequery;int							li_cnt
errorReturn        		lret_rc
b_multithread			lb_multithread_post

lb_multithread_post = create b_multithread
FOR li_cnt = 0 to 9
	lret_rc = SharedObjectGet("doc_post"+string(li_cnt), lb_multithread_post)    
	if  (lret_rc = SUCCESS!) then
		gf_messagebox('m.t_dw_mdi.01','Thông báo','Chương trình còn đang xử lý ghi sổ. Tắt ứng dụng, có thể gây ra lỗi ghi sổ!','exclamation','ok',1)
		return 1
	end if
NEXT
destroy lb_multithread_post

if isvalid(c_w_alert_popup) then
	c_w_alert_popup.event close()
end if
end event

type mdi_1 from mdiclient within t_w_mdi
long BackColor=15780518
end type

type rbb_1 from u_rbb within t_w_mdi
boolean #centralizedeventhandling = true
end type

event itemclicked;call super::itemclicked;int					li_rtn
t_w_main		lw_handle, lw_sheet_close
s_w_main		lw_active
s_object_display		lod_handle

choose case itemtag
	case 'signout'
		close(parent)
	case 'Menu' 
		if isvalid(t_w_mdi.w[1]) then
			t_w_mdi.w[1].setfocus()
//			if t_w_mdi.w[1].visible = false then
//				t_w_mdi.w[1].show()
//				t_w_mdi.w[1].enabled = true
//			else
//				t_w_mdi.w[1].hide()
//				t_w_mdi.w[1].enabled = false
//			end if
		else
			parent.f_open_w_background( )
		end if
	case 'Company'
		parent.f_change_company( )
	Case 'Branch'
		parent.f_change_branch( )
	case 'closeall'
		lw_handle = parent.getfirstsheet( )
		do while isvalid(lw_handle)			
			lw_sheet_close = lw_handle
			lw_handle = parent.getnextsheet(lw_handle)
			if lw_sheet_close.classname() <> 's_w_background' then		
				close (lw_sheet_close)
			end if			
		loop
	case  'im' ,'adsy','adbu','sm','pm','pp','hr','fmap','fmar','fmfa','fmgl','fmbc','pd'
		c_menu_item			lc_menu_item
		t_w_mdi.idb_menu_id = lc_menu_item.f_get_menu_id_ex( itemtag)
		t_w_mdi.is_menu_code = itemtag
		if isvalid(t_w_mdi.w[1]) then
//			if t_w_mdi.w[1].visible = false then
//				t_w_mdi.w[1].show()
//				t_w_mdi.w[1].enabled = true
//			end if
			t_w_mdi.w[1].dynamic event e_query()
			t_w_mdi.w[1].setfocus()
		else
			parent.f_open_w_background( )
		end if
	case 'e_add','e_modify','e_delete','e_cancel','e_save','e_post','e_unpost','e_detail','e_refresh','e_book'
		lw_handle = parent.getactivesheet( )
		if isvalid(lw_handle) then
			li_rtn = lw_handle.triggerevent( itemtag)
		end if
		if li_rtn = 1 then
			choose case itemtag
				case 'e_modify','e_save','e_post','e_unpost','e_add','e_insert'
					this.f_change_action_button( itemhandle, index, 0)
			end choose
		end if
	case 'e_self_copy'
		lw_handle = parent.getactivesheet( )
		if isvalid(lw_handle) then
			lw_handle.dynamic event e_copy_to_new('b_copyt_self')
		end if		
	case 'e_copyt'
	case 'e_copyf'
	case 'e_filter'
		lw_handle = parent.getactivesheet( )
		if isvalid(lw_handle) then
			if lw_handle.classname( ) <> 's_w_background' then			
				lw_active = lw_handle
				if lw_active.ib_filter_on then
					lw_active.triggerevent( 'e_filteroff')
				else
					lw_active.triggerevent( 'e_filteron_rb')
				end if
			end if
		end if
	case 'e_action_attach'
		lw_handle = parent.getactivesheet( )
		if isvalid(lw_handle) then
			lod_handle = lw_handle.f_get_obj_handling( )
			lod_handle.triggerevent(itemtag )
		end if				
	case else //-- e_change_object_appeon --//
		lw_handle = parent.getactivesheet( )
		if isvalid(lw_handle) then
			lw_handle.triggerevent(itemtag )
		end if				
end choose
end event

type p_1 from picture within t_w_mdi
boolean visible = false
integer x = 1143
integer y = 144
integer width = 1006
integer height = 1084
boolean focusrectangle = false
end type

