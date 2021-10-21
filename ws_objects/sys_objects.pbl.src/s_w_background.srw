$PBExportHeader$s_w_background.srw
forward
global type s_w_background from t_w_main
end type
type tv_4 from t_tv within s_w_background
end type
type tv_3 from t_tv within s_w_background
end type
type tv_2 from t_tv within s_w_background
end type
type tv_1 from t_tv within s_w_background
end type
type adbu_report from t_gb within s_w_background
end type
type adbu_daily from t_gb within s_w_background
end type
type adbu_periodic from t_gb within s_w_background
end type
type adbu_setup from t_gb within s_w_background
end type
type p_1 from picture within s_w_background
end type
end forward

global type s_w_background from t_w_main
integer width = 4421
integer height = 3288
string title = ""
string icon = "Pics\app.ico"
boolean clientedge = false
integer animationtime = 2000
tv_4 tv_4
tv_3 tv_3
tv_2 tv_2
tv_1 tv_1
adbu_report adbu_report
adbu_daily adbu_daily
adbu_periodic adbu_periodic
adbu_setup adbu_setup
p_1 p_1
end type
global s_w_background s_w_background

forward prototypes
public function integer f_resize (string vs_display_model)
end prototypes

public function integer f_resize (string vs_display_model);////
p_1.move(0, 0)
p_1.width =this.workspacewidth( )
p_1.height = this.workspaceheight( ) 

adbu_daily.move( 276, 60)
adbu_daily.width = (this.workspacewidth( ) - 276*2 - 80*2)/3
adbu_daily.height = this.workspaceheight() - 180

tv_1.move( adbu_daily.x + 25, adbu_daily.y + 85)
tv_1.width = (this.workspacewidth( ) - 276*2 - 80*2)/3 - 50
tv_1.height = adbu_daily.height - 60

adbu_report.move( adbu_daily.x+adbu_daily.width + 80, 60)
adbu_report.width = (this.workspacewidth( ) - 276*2 - 80*2)/3
adbu_report.height = this.workspaceheight( )  - 180

tv_2.move( adbu_report.x+25 , adbu_report.y + 85)
tv_2.width = (this.workspacewidth( ) - 276*2 - 80*2)/3 - 50
tv_2.height = adbu_report.height - 60

adbu_periodic.move( adbu_report.x+adbu_report.width + 80, 60)
adbu_periodic.width = (this.workspacewidth( ) - 276*2 - 80*2)/3
adbu_periodic.height = (this.workspaceheight( )  - 180) /2 - 30

tv_3.move( adbu_periodic.x + 25, adbu_periodic.y + 85)
tv_3.width = (this.workspacewidth( ) - 276*2 - 80*2)/3 - 50
tv_3.height =  adbu_periodic.height - 60
//tv_3.setposition( toTop!)

adbu_setup.move( adbu_periodic.x, adbu_periodic.y + adbu_periodic.height + 60)
adbu_setup.width = (this.workspacewidth( ) - 276*2 - 80*2)/3
adbu_setup.height =  (this.workspaceheight( )  - 180) /2 - 30

tv_4.move( adbu_setup.x + 25,  adbu_setup.y + 85)
tv_4.width = (this.workspacewidth( ) - 276*2 - 80*2)/3 - 50
tv_4.height =   adbu_setup.height - 60
//tv_4.setposition( toTop!)

//p_1.setposition( toTop!)
this.setredraw( true)
return 1
end function

on s_w_background.create
int iCurrent
call super::create
this.tv_4=create tv_4
this.tv_3=create tv_3
this.tv_2=create tv_2
this.tv_1=create tv_1
this.adbu_report=create adbu_report
this.adbu_daily=create adbu_daily
this.adbu_periodic=create adbu_periodic
this.adbu_setup=create adbu_setup
this.p_1=create p_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tv_4
this.Control[iCurrent+2]=this.tv_3
this.Control[iCurrent+3]=this.tv_2
this.Control[iCurrent+4]=this.tv_1
this.Control[iCurrent+5]=this.adbu_report
this.Control[iCurrent+6]=this.adbu_daily
this.Control[iCurrent+7]=this.adbu_periodic
this.Control[iCurrent+8]=this.adbu_setup
this.Control[iCurrent+9]=this.p_1
end on

on s_w_background.destroy
call super::destroy
destroy(this.tv_4)
destroy(this.tv_3)
destroy(this.tv_2)
destroy(this.tv_1)
destroy(this.adbu_report)
destroy(this.adbu_daily)
destroy(this.adbu_periodic)
destroy(this.adbu_setup)
destroy(this.p_1)
end on

event activate;call super::activate;//this.windowstate = maximized!

//this.event e_query( )
//this.f_resize('' )
end event

event resize;call super::resize;string		ls_display_model
//
//this.setredraw( false)
//if sizetype = 0  then return
//this.windowstate = maximized!
this.post f_resize(ls_display_model )


end event

event key;//-- override //
end event

event e_query;call super::e_query;
long 					ll_row, ll_root_hdl, ll_row_cnt
int						li_rtn
double				ldb_module_id
string					ls_role_user, ls_module_name

c_string					lc_string
c_menu_mdi			lc_menu_mdi
t_transaction			lt_transaction

lt_transaction = create t_transaction
lt_transaction.dbms =	SQLCA.DBMS
lt_transaction.ServerName	 = SQLCA.ServerName
lt_transaction.LogId	 = SQLCA.LogId
lt_transaction.LogPass 	 = SQLCA.LogPass 
lt_transaction.AutoCommit 	 = false 
lt_transaction.DBParm	 = SQLCA.DBParm
connect using	lt_transaction;	

lc_menu_mdi = create c_menu_mdi
ldb_module_id = t_w_mdi.idb_menu_id
if isnull(ldb_module_id) or ldb_module_id = 0 then
	ldb_module_id = g_user.default_mod
	c_menu_item			lc_menu_item
	t_w_mdi.is_menu_code  = lc_menu_item.f_get_menu_code(ldb_module_id )
end if
ls_module_name = t_w_mdi.ids_lang_text.f_get_lang_text( t_w_mdi.is_menu_code )

this.title = ls_module_name

ls_role_user = g_user.f_get_current_role_user_string( )
ls_role_user = lc_string.f_globalreplace( ls_role_user, ';', ';)|(;')
ls_role_user = "(;"+ls_role_user+";)"

lc_menu_mdi.ids_menu_all.dataobject =  'ds_module_daily'
lc_menu_mdi.ids_menu_all.settransobject( lt_transaction)		
ll_row_cnt = lc_menu_mdi.ids_menu_all.retrieve(gi_user_comp_id, gi_userid, ls_role_user, ldb_module_id ,gs_user_lang)
tv_1.f_delete_all_items( )
if ll_row_cnt > 0 then	
	lc_menu_mdi.f_populate_tv_item( tv_1)
end if

lc_menu_mdi.ids_menu_all.dataobject =  'ds_module_report'
lc_menu_mdi.ids_menu_all.settransobject( lt_transaction)		
ll_row_cnt = lc_menu_mdi.ids_menu_all.retrieve(gi_user_comp_id, gi_userid,ls_role_user,  ldb_module_id ,gs_user_lang)
tv_2.f_delete_all_items( )
if ll_row_cnt > 0 then	
	lc_menu_mdi.f_populate_tv_item( tv_2)
end if

lc_menu_mdi.ids_menu_all.dataobject =  'ds_module_periodic'
lc_menu_mdi.ids_menu_all.settransobject( lt_transaction)		
ll_row_cnt = lc_menu_mdi.ids_menu_all.retrieve(gi_user_comp_id, gi_userid, ls_role_user, ldb_module_id ,gs_user_lang)
tv_3.f_delete_all_items( )
if ll_row_cnt > 0 then
	lc_menu_mdi.f_populate_tv_item( tv_3)
end if

lc_menu_mdi.ids_menu_all.dataobject =  'ds_module_setup'
lc_menu_mdi.ids_menu_all.settransobject( lt_transaction)		
ll_row_cnt = lc_menu_mdi.ids_menu_all.retrieve(gi_user_comp_id, gi_userid, ls_role_user, ldb_module_id ,gs_user_lang)
tv_4.f_delete_all_items( )
if ll_row_cnt > 0 then	
	lc_menu_mdi.f_populate_tv_item( tv_4)
end if

disconnect using lt_transaction;
destroy lt_transaction
destroy lc_menu_mdi
return 1
end event

event open;call super::open;
this.event e_query( )

end event

event rbuttondown;//--Override--//
end event

event clicked;//-- Override --//
end event

type tv_4 from t_tv within s_w_background
integer x = 3136
integer y = 1848
integer taborder = 100
boolean bringtotop = true
integer textsize = -11
long backcolor = 553648127
boolean tooltips = false
boolean trackselect = true
boolean fullrowselect = true
string picturename[] = {"Window!","Cascade!","Custom039!","Project!","StyleLibraryList5!","StyleLibraryList5!","MonthCalendar!","monthcalendar!","OleGenReg!","OleGenReg!","Report!","Report!","copy!","copy!"}
end type

event clicked;call super::clicked;//s_w_multi_n_max					lw_retail
treeviewitem				l_tvi
c_menu_item				lc_menu_item
c_obj_service				lc_obj_service

string							ls_parm[]

if handle > 0 then
	this.getitem( handle, l_tvi)
	lc_menu_item = l_tvi.data
	lc_obj_service.f_stringtoarray(lc_menu_item.istr_tv.s_object , ";", ls_parm[])
	if upperbound(ls_parm) <2 then
		this.selectitem(handle)
		if not l_tvi.expanded then this.post expanditem(handle)										
		return 
	end if
	setpointer(hourglass!)
	this.selectitem(handle)			
	if left(ls_parm[1], 4) <> 'u_w_' then
		t_w_mdi.w[1].hide()
		t_w_mdi.wf_open_sheet_doc(ls_parm[1]+";"+ls_parm[2]+";"+ string(lc_menu_item.istr_tv.db_id)+';'+ lc_menu_item.istr_tv.s_label)	
		t_w_mdi.rbb_1.SetActiveCategoryByIndex ( 1 )
	elseif ls_parm[1] = 'u_w_pos' then
		open (u_w_pos)
		u_w_pos.setposition( TopMost!)
		u_w_pos.post setposition( noTopMost!)
	else
		open (c_w_purchase)
		c_w_purchase.setposition( TopMost!)
		c_w_purchase.post setposition( noTopMost!)
//		t_w_mdi.wf_open_sheet_doc(ls_parm[1]+";"+ls_parm[2]+";"+ string(lc_menu_item.istr_tv.db_id)+';'+ lc_menu_item.istr_tv.s_label)	
	end if
end if

/*
window						lw_sheet
treeviewitem					l_tvi
c_menu_item				lc_menu_item
c_obj_service				lc_obj_service
s_object_display			lpo_main
string							ls_parm[]

if handle > 0 then
	this.getitem( handle, l_tvi)
	lc_menu_item = l_tvi.data
	lc_obj_service.f_stringtoarray(lc_menu_item.istr_tv.s_object , ";", ls_parm[])
	if upperbound(ls_parm) <2 then
		return 
	end if
	if Pos(t_w_mdi.is_menu_code,lc_menu_item.istr_tv.s_menu_code +";",1) = 0 then
		t_w_mdi.is_menu_code +=lc_menu_item.istr_tv.s_menu_code +";"
		t_w_menu.is_menu_code = lc_menu_item.istr_tv.s_menu_code	
		setpointer(hourglass!)
		opensheetwithparm(lw_sheet, ls_parm[1]+";"+string(lc_menu_item.istr_tv.db_id), ls_parm[2],t_w_mdi,3, original!)		
	else
		lw_sheet = t_w_mdi.getfirstsheet()
		Do while isvalid(lw_sheet)
			if lw_sheet.classname() <> 's_w_background' then
				lpo_main = lw_sheet.dynamic f_get_obj_main()
				if lpo_main.f_get_menu_code( ) = lc_menu_item.istr_tv.s_menu_code then
					lw_sheet.setposition( totop!)
					return
				end if
			end if
			lw_sheet = t_w_mdi.getNextSheet(lw_sheet)
		Loop
	end if
end if
*/
end event

event key;//--override --//

end event

type tv_3 from t_tv within s_w_background
integer x = 3154
integer y = 464
integer taborder = 90
boolean bringtotop = true
integer textsize = -11
long backcolor = 553648127
boolean tooltips = false
boolean trackselect = true
boolean fullrowselect = true
string picturename[] = {"Window!","Cascade!","Custom039!","Project!","StyleLibraryList5!","StyleLibraryList5!","MonthCalendar!","monthcalendar!","OleGenReg!","OleGenReg!","Report!","Report!","copy!","copy!"}
end type

event clicked;call super::clicked;treeviewitem				l_tvi
c_menu_item				lc_menu_item
c_obj_service				lc_obj_service

string							ls_parm[]

if handle > 0 then
	this.getitem( handle, l_tvi)
	lc_menu_item = l_tvi.data
	lc_obj_service.f_stringtoarray(lc_menu_item.istr_tv.s_object , ";", ls_parm[])
	if upperbound(ls_parm) <2 then
		this.selectitem(handle)
		if not l_tvi.expanded then this.post expanditem(handle)										
		return 
	end if
	setpointer(hourglass!)
	this.selectitem(handle)			
	if left(ls_parm[1], 4) <> 'u_w_' then
		t_w_mdi.w[1].hide()
		t_w_mdi.wf_open_sheet_doc(ls_parm[1]+";"+ls_parm[2]+";"+ string(lc_menu_item.istr_tv.db_id)+';'+ lc_menu_item.istr_tv.s_label)	
		t_w_mdi.rbb_1.SetActiveCategoryByIndex ( 1 )
	elseif ls_parm[1] = 'u_w_pos' then
		open (u_w_pos)
		u_w_pos.setposition( TopMost!)
		u_w_pos.post setposition( noTopMost!)
	else
		open (c_w_purchase)
		c_w_purchase.setposition( TopMost!)
		c_w_purchase.post setposition( noTopMost!)
//		t_w_mdi.wf_open_sheet_doc(ls_parm[1]+";"+ls_parm[2]+";"+ string(lc_menu_item.istr_tv.db_id)+';'+ lc_menu_item.istr_tv.s_label)	
	end if
end if
end event

event key;//--override --//

end event

type tv_2 from t_tv within s_w_background
integer x = 1344
integer y = 276
integer taborder = 60
boolean bringtotop = true
integer textsize = -11
long backcolor = 553648127
boolean tooltips = false
boolean trackselect = true
boolean fullrowselect = true
string picturename[] = {"Window!","Cascade!","Custom039!","Project!","StyleLibraryList5!","StyleLibraryList5!","MonthCalendar!","monthcalendar!","OleGenReg!","OleGenReg!","Report!","Report!","copy!","copy!"}
end type

event selectionchanged;//-- override --//
end event

event selectionchanging;call super::selectionchanging;//-- override --//
end event

event clicked;call super::clicked;treeviewitem				l_tvi
c_menu_item				lc_menu_item
c_obj_service				lc_obj_service

string							ls_parm[]

if handle > 0 then
	this.getitem( handle, l_tvi)
	lc_menu_item = l_tvi.data
	lc_obj_service.f_stringtoarray(lc_menu_item.istr_tv.s_object , ";", ls_parm[])
	if upperbound(ls_parm) <2 then
		this.selectitem(handle)
		if not l_tvi.expanded then this.post expanditem(handle)										
		return 
	end if
	setpointer(hourglass!)
	this.selectitem(handle)			
	if left(ls_parm[1], 4) <> 'u_w_' then
		t_w_mdi.w[1].hide()		
		t_w_mdi.wf_open_sheet_doc(ls_parm[1]+";"+ls_parm[2]+";"+ string(lc_menu_item.istr_tv.db_id)+';'+ lc_menu_item.istr_tv.s_label)	
		t_w_mdi.rbb_1.SetActiveCategoryByIndex ( 1 )
	elseif ls_parm[1] = 'u_w_pos' then
		open (u_w_pos)
		u_w_pos.setposition( TopMost!)
		u_w_pos.post setposition( noTopMost!)
	else
		open (c_w_purchase)
		c_w_purchase.setposition( TopMost!)
		c_w_purchase.post setposition( noTopMost!)
//		t_w_mdi.wf_open_sheet_doc(ls_parm[1]+";"+ls_parm[2]+";"+ string(lc_menu_item.istr_tv.db_id)+';'+ lc_menu_item.istr_tv.s_label)	
	end if
end if
end event

event key;//-- override--//

end event

event rightclicked;//-- override--//

end event

type tv_1 from t_tv within s_w_background
integer x = 704
integer y = 448
integer taborder = 80
boolean bringtotop = true
integer textsize = -11
long backcolor = 553648127
boolean tooltips = false
boolean trackselect = true
boolean fullrowselect = true
string picturename[] = {"Window!","Cascade!","Custom039!","Project!","StyleLibraryList5!","StyleLibraryList5!","MonthCalendar!","monthcalendar!","OleGenReg!","OleGenReg!","Report!","Report!","copy!","copy!"}
end type

event clicked;call super::clicked;//s_w_multi_n_max					lw_retail
treeviewitem				l_tvi
c_menu_item				lc_menu_item
c_obj_service				lc_obj_service

string							ls_parm[]
int								li_rtn
if handle > 0 then
	this.getitem( handle, l_tvi)
	lc_menu_item = l_tvi.data
	lc_obj_service.f_stringtoarray(lc_menu_item.istr_tv.s_object , ";", ls_parm[])
	if upperbound(ls_parm) <2 then
		this.selectitem(handle)
		if not l_tvi.expanded then this.post expanditem(handle)										
		return 
	end if
	setpointer(hourglass!)
	this.selectitem(handle)			
	if left(ls_parm[1], 4) <> 'u_w_' then
		setpointer(hourglass!)
		t_w_mdi.setredraw(false)		
		t_w_mdi.w[1].hide()	
		t_w_mdi.setredraw(true)		
		t_w_mdi.post wf_open_sheet_doc(ls_parm[1]+";"+ls_parm[2]+";"+ string(lc_menu_item.istr_tv.db_id)+';'+ lc_menu_item.istr_tv.s_label)							
		li_rtn = t_w_mdi.rbb_1.SetActiveCategoryByIndex ( 1 )
	elseif ls_parm[1] = 'u_w_pos' then
		open (u_w_pos)
		u_w_pos.setposition( TopMost!)
		u_w_pos.post setposition( noTopMost!)
	else
		open (c_w_purchase)
		c_w_purchase.setposition( TopMost!)
		c_w_purchase.post setposition( noTopMost!)
//		t_w_mdi.wf_open_sheet_doc(ls_parm[1]+";"+ls_parm[2]+";"+ string(lc_menu_item.istr_tv.db_id)+';'+ lc_menu_item.istr_tv.s_label)	
	end if
end if




/*
window						lw_sheet
treeviewitem					l_tvi
c_menu_item				lc_menu_item
c_obj_service				lc_obj_service
s_object_display			lpo_main
string							ls_parm[]

if handle > 0 then
	this.getitem( handle, l_tvi)
	lc_menu_item = l_tvi.data
	lc_obj_service.f_stringtoarray(lc_menu_item.istr_tv.s_object , ";", ls_parm[])
	if upperbound(ls_parm) <2 then
		return 
	end if
	if Pos(t_w_mdi.is_menu_code,lc_menu_item.istr_tv.s_menu_code +";",1) = 0 then
		t_w_mdi.is_menu_code +=lc_menu_item.istr_tv.s_menu_code +";"
		t_w_menu.is_menu_code = lc_menu_item.istr_tv.s_menu_code	
		setpointer(hourglass!)
		opensheetwithparm(lw_sheet, ls_parm[1]+";"+string(lc_menu_item.istr_tv.db_id), ls_parm[2],t_w_mdi,3, original!)		
	else
		lw_sheet = t_w_mdi.getfirstsheet()
		Do while isvalid(lw_sheet)
			if lw_sheet.classname() <> 's_w_background' then
				lpo_main = lw_sheet.dynamic f_get_obj_main()
				if lpo_main.f_get_menu_code( ) = lc_menu_item.istr_tv.s_menu_code then
					lw_sheet.setposition( totop!)
					return
				end if
			end if
			lw_sheet = t_w_mdi.getNextSheet(lw_sheet)
		Loop
	end if
end if
*/
end event

event key;//--override --//

end event

type adbu_report from t_gb within s_w_background
integer x = 1573
integer y = 36
integer width = 1193
integer height = 2640
integer taborder = 30
integer textsize = -12
integer weight = 700
long backcolor = 553648127
string text = "Báo cáo"
end type

type adbu_daily from t_gb within s_w_background
integer x = 91
integer y = 40
integer width = 1193
integer height = 1720
integer taborder = 10
integer textsize = -12
integer weight = 700
long backcolor = 553648127
string text = "Chức năng chính"
end type

type adbu_periodic from t_gb within s_w_background
integer x = 2866
integer y = 176
integer width = 1193
integer height = 1328
integer taborder = 20
integer textsize = -12
integer weight = 700
long backcolor = 553648127
string text = "Công việc định kỳ"
end type

type adbu_setup from t_gb within s_w_background
integer x = 2857
integer y = 1544
integer width = 1193
integer height = 1552
integer taborder = 50
integer textsize = -12
integer weight = 700
long backcolor = 553648127
string text = "Thiết lập chính sách"
end type

type p_1 from picture within s_w_background
integer y = 280
integer width = 3781
integer height = 1344
integer transparency = 80
string picturename = "C:\Users\huyxnguyen\Documents\demo_19r3\Pics\bamboo-2.png"
boolean focusrectangle = false
end type

