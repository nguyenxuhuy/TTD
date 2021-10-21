$PBExportHeader$c_w_alert_popup.srw
forward
global type c_w_alert_popup from window
end type
type dw_2 from datawindow within c_w_alert_popup
end type
type dw_1 from datawindow within c_w_alert_popup
end type
end forward

global type c_w_alert_popup from window
integer width = 1623
integer height = 868
boolean titlebar = true
boolean controlmenu = true
boolean resizable = true
long backcolor = 134217728
string icon = "UserObject5!"
windowanimationstyle openanimation = fadeanimation!
windowanimationstyle closeanimation = fadeanimation!
event tray_event pbm_custom01
dw_2 dw_2
dw_1 dw_1
end type
global c_w_alert_popup c_w_alert_popup

type variables
int ii_timer, il_interval_minute
systray in_tray
b_callback		ic_callback
b_multithread	ic_multithread
t_transaction lt_transaction
boolean ib_show = false, ib_pined= false
t_ds_db 	ids_popup_data
end variables

forward prototypes
public subroutine f_show_down ()
public subroutine f_show_up ()
public function boolean f_check_user_alert (long vl_user_id)
end prototypes

event tray_event;//Event tray event map voi event is laf pbm_custom01
systray lm_systray
ulong l_handle
string ls_win
rect	lstr_rect

// process tray events
CHOOSE CASE lparam
	CASE in_tray.WM_LBUTTONDBLCLK
	CASE in_tray.WM_RBUTTONDOWN
	CASE in_tray.WM_LBUTTONUP
		this.f_show_up( )
END CHOOSE
end event

public subroutine f_show_down ();this.move(this.x, 5000)
//set timer
if ii_timer >= 6 then ii_timer = 0
ib_show = false
end subroutine

public subroutine f_show_up ();long 	ll_row, ll_interval_minute,ll_idx
int 	li_rectRight, li_rectBottom, li_rectLeft, li_rectTop
ulong l_handle
string ls_win,ls_alert_id
rect 	lstr_rec
//environment le_env

//set timer
ii_timer = 0
ib_show = true
// window name of system tray
ls_win = "Shell_TrayWnd"
l_handle = in_tray.FindWindow(ls_win,"")
// get the dimensions of the system tray
in_tray.GetWindowRect(l_handle, lstr_rec)
if lstr_rec.left < 0 then lstr_rec.left = 0
// Get screen size from environment
//GetEnvironment( le_env )
// convert sys tray rectangle coordinates to PB units
li_rectRight = PixelsToUnits( lstr_rec.right, XPixelsToUnits! )
li_rectBottom = PixelsToUnits(lstr_rec.bottom, YPixelsToUnits! )
li_rectLeft = PixelsToUnits( lstr_rec.left , XPixelsToUnits! )
li_rectTop = PixelsToUnits(lstr_rec.top, YPixelsToUnits! )
IF lstr_rec.left =  lstr_rec.top THEN
	IF lstr_rec.right > lstr_rec.bottom THEN
		// top position
		// open in upper right corner
		this.openanimation = Topslide!
		this.Move( ( li_rectRight - this.Width ), ( li_rectBottom ) )
	ELSE
		// left side position
		this.openanimation = Leftslide!
		this.Move( ( li_rectRight ), ( li_rectBottom - this.Height) )
		
	END IF
ELSEIF (lstr_rec.left = 0 AND lstr_rec.top > 0) THEN
	//bottom position
	this.openanimation = Bottomslide!
	this.Move( ( li_rectRight - this.Width), ( li_rectTop - this.Height ) )
ELSEIF lstr_rec.left > 0 AND lstr_rec.top = 0 THEN
	// right side position
	this.openanimation = Rightslide!
	this.Move( ( li_rectLeft - this.Width ), ( li_rectBottom - this.Height) )
	
END IF

if ids_popup_data.rowcount() > 0 then
	for ll_idx = 1 to ids_popup_data.rowcount()
		if ls_alert_id <> '' then ls_alert_id += ','
		ls_alert_id += string(ids_popup_data.getitemnumber( ll_idx, 'id'))
	next
	if ls_alert_id <> '' then ls_alert_id = '(' + ls_alert_id + ')'
	dw_2.setfilter( "ID not in " + ls_alert_id)
	dw_2.filter( )
end if

end subroutine

public function boolean f_check_user_alert (long vl_user_id);long 	ll_idx, ll_policy_alert_id, ll_rowcnt, ll_currow, ll_i, ll_user_tmp, ll_rtn
any 	lany_criterial_tmp[], lany_criteria_constraint[], lany_null[], va_data[]
string ls_originalsql_nowhere
string ls_subject, ls_display_data
string ls_user_code, ls_dwo, ls_column, ls_user_id, ls_array_userid[]

t_ds_db 			lds_apply_rule_hdr, lds_apply_rule_line, lds_data, lds_business_rule, lds_tmp			
u_policy_alert 	lc_policy_alert
u_role 			lc_role
u_user 			lc_user
c_dwservice 		ldw_service

lc_policy_alert = create u_policy_alert
if lc_policy_alert.f_init_object(0) <> 1 then return false
if lc_policy_alert.ids_attribute.rowcount( ) < 1 then return false

lc_role = create u_role
lc_user = create u_user
//Lay tat ca cac dong cai dat doi tuong ap dung
lds_apply_rule_hdr = create t_ds_db
lds_apply_rule_hdr.dataobject = 'd_applicable_rule_hdr_grid'
lds_apply_rule_hdr.settransobject(sqlca)
lds_business_rule = create t_ds_db
lds_business_rule.dataobject = 'd_business_rule_grid'
lds_business_rule.settransobject( sqlca)
lds_apply_rule_hdr.retrieve()
lds_business_rule.retrieve()
lds_tmp = create t_ds_db

for ll_rowcnt = 1 to lc_policy_alert.ids_attribute.rowcount()
	ll_idx = lds_business_rule.find("object_ref_id= "+string( lc_policy_alert.ids_attribute.getitemnumber(ll_rowcnt,'id')), 1, lds_business_rule.rowcount())
	if ll_idx <1 then continue
	lds_apply_rule_hdr.setfilter( 'object_ref_id = '+string(lds_business_rule.getitemnumber(ll_idx,'id')) )
	lds_apply_rule_hdr.filter()
	//duyet trường hợp ap dung cho Tất cả
	for ll_idx = 1 to lds_apply_rule_hdr.rowcount()
		if lds_apply_rule_hdr.getitemstring(ll_idx,'applicable_type') = 'all' then 
			destroy lc_policy_alert
			destroy lc_role
			destroy lc_user
			destroy lds_apply_rule_hdr
			destroy lds_business_rule
			destroy lds_tmp			
			return true
		end if
	next
	//duyet trường hợp ap dung cho User cụ thể hoặc Nhóm
	for ll_idx = 1 to lds_apply_rule_hdr.rowcount()
		if lds_apply_rule_hdr.getitemstring(ll_idx,'applicable_type') <> 'table' then continue
		ls_user_id =  lds_apply_rule_hdr.getitemstring(ll_idx,'APPLICABLE_REF_ID_STRING')			
		ldw_service.f_stringtoarray( ls_user_id,';', ls_array_userid)			
		for ll_i = 1 to upperbound(ls_array_userid)
			ll_user_tmp = long(ls_array_userid[ll_i])
			if ll_user_tmp = vl_user_id then 
				destroy lc_policy_alert
				destroy lc_role
				destroy lc_user
				destroy lds_apply_rule_hdr
				destroy lds_business_rule
				destroy lds_tmp
				return true
			else //Kiểm tra trong Nhóm
				va_data = lany_null
				va_data[1] = ll_user_tmp
				lc_role.f_init_object_table( lds_tmp, 'd_role_assign_grid', 'role_id',va_data, lany_null)
				if lds_tmp.find( 'user_id ='+string(vl_user_id), 1, lds_tmp.rowcount()) > 0 then
					destroy lc_policy_alert
					destroy lc_role
					destroy lc_user
					destroy lds_apply_rule_hdr
					destroy lds_business_rule
					destroy lds_tmp
					return true
				end if
			end if
		next
	next
	//duyet trường hợp ap dung cho DWO
	string vs_cols
	for ll_idx = 1 to lds_apply_rule_hdr.rowcount()
		if lds_apply_rule_hdr.getitemstring(ll_idx,'applicable_type') <> 'dwo' then continue
		ls_dwo =  lds_apply_rule_hdr.getitemstring(ll_idx,'APPLICABLE_REF_TABLE')
		ls_column =  lds_apply_rule_hdr.getitemstring(ll_idx,'APPLICABLE_REF_ID_STRING')
		if isnull(ls_dwo) or isnull(ls_column) then continue
		va_data = lany_null
		va_data[1] = lds_apply_rule_hdr.getitemnumber(ll_idx, 'ID')
		lc_policy_alert.f_init_object_table(lds_tmp,'d_applicable_rule_line_grid', 'OBJECT_REF_ID', va_data,lany_null)
		va_data = lany_null
		for ll_i =1 to lds_tmp.rowcount()
			if pos(lds_tmp.getitemstring(ll_i,'applicable_criteria_val'),'me') <> 1 then
				vs_cols += lds_tmp.getitemstring(ll_i,'applicable_criteria_col')+';'
				va_data[upperbound(va_data)+1]=lds_tmp.getitemstring(ll_i,'applicable_criteria_val')
			else
				//
			end if
		next
		//Lấy dữ liệu bảng chứa user_id
		lds_data = create t_ds_db
		lc_user.f_init_object_table(lds_data,ls_dwo, vs_cols, va_data, lany_null)
		va_data = lany_null
		for ll_i = 1 to lds_data.rowcount()
			ll_user_tmp  = lds_data.getitemnumber(ll_i,ls_column)
			if ll_user_tmp = vl_user_id then
				destroy lc_policy_alert
				destroy lc_user
				destroy lc_role
				destroy lds_apply_rule_hdr
				destroy lds_business_rule
				destroy lds_tmp
				destroy lds_data
				return true
			end if
		next
	next
next
destroy lc_user
destroy lc_role
destroy lc_policy_alert
destroy lc_user
destroy lds_apply_rule_hdr
destroy lds_business_rule
destroy lds_tmp
destroy lds_data
return false

end function

on c_w_alert_popup.create
this.dw_2=create dw_2
this.dw_1=create dw_1
this.Control[]={this.dw_2,&
this.dw_1}
end on

on c_w_alert_popup.destroy
destroy(this.dw_2)
destroy(this.dw_1)
end on

event resize;dw_1.move(0,0)
dw_1.width = this.width
dw_1.height = 100
dw_2.move(0,dw_1.height)
dw_2.width = this.width
dw_2.height = this.height - dw_1.height

end event

event timer;ii_timer ++
if ib_show = true and ii_timer >= 4 then//sau 30s tat popup alert
	this.f_show_down( )
end if
//if ii_timer = 5 then debugbreak()
if ib_show = false and ii_timer >= 6 and dw_2.rowcount() > 0 then// sau 5* 30s neu co data thi hien len alert
	this.f_show_up( )
end if



end event

event open;b_obj_instantiate	lb_ins
string					ls_alert_id
long 					ll_row

//Khởi động timer
timer(30)
this.resize(2520,750)
//Ẩn trong task bar
SetWindowLongA(Handle(This), -20, 128)
//Đưa xuống system tray
this.in_tray.f_add_icon(c_w_alert_popup, 'Pics/app.ico')
// set window on top of any others
this.setposition( TopMost!)
this.f_show_down()
dw_1.insertrow(0)
//ic_multithread = create b_multithread
ids_popup_data = create t_ds_db
ids_popup_data.dataobject = dw_2.dataobject
if lb_ins.f_is_user_alert( gi_userid, SQLCA,ls_alert_id) then
//	//Tao tien trinh khac
	c_alert_parm lc_alert_parm
	lc_alert_parm = create c_alert_parm
	if lc_alert_parm.f_init_object(0) <> 1 then return
	il_interval_minute = long(lc_alert_parm.ids_attribute.f_getitemany(1,'interval_minute'))
	if isnull(il_interval_minute) or il_interval_minute = 0 then il_interval_minute = 1
	if sharedobjectregister("b_multithread","i_multithread") = Success! then
		//Step 1 (part 2) - Set up the instance variable in_shared to point to the shared object  refered to by the logical name "i_multithear"
		sharedobjectGet("i_multithread", ic_multithread)
		//Step 2 - set dw_report 
		ic_callback = create b_callback
		ic_callback.f_setdw( dw_2)	
		ic_callback.f_setw( this)
		//Step 3 - Call the f_multitheared method asynchronously (POST)	
		ic_multithread.post f_multitheared_popup( ic_callback, sqlca.servername, sqlca.logid, sqlca.logpass, il_interval_minute,dw_2.dataobject, gi_userid)
		
//		ic_multithread.f_multitheared_popup( ic_callback, sqlca.servername, sqlca.logid, sqlca.logpass, il_interval_minute,dw_2.dataobject, gi_userid)
		
	else
		messagebox('Lỗi','c_w_alert.open.sharedobjectregister') 
	end if
end if



end event

event close;if sharedobjectGet("i_multithread", ic_multithread) = Success! then
	ic_multithread.post f_disconnect( )
end if
SharedobjectUnregister("i_multithread")
//xóa tray icon
in_tray.f_delete_icon( THIS, FALSE)
destroy ids_popup_data
end event

event closequery;ib_pined = false
f_show_down( )
return -1
end event

type dw_2 from datawindow within c_w_alert_popup
event tray_event pbm_custom01
integer y = 304
integer width = 1582
integer height = 268
integer taborder = 20
string title = "none"
string dataobject = "d_alert_data_popup"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;datastore 	lds_db
double		ldb_alert_id
string 		ls_id, ls_value,ls_remind_yn,ls_popup_yn,ls_alert_id
long			ll_find,ll_idx

lds_db = create datastore
lds_db.dataobject = this.dataobject
choose case dwo.name
//	case 'remind_yn'
//		this.rowscopy(1,this.rowcount(),Primary!,lds_db,1,Primary!)
//		if sharedobjectGet("i_multithread", ic_multithread) = Success! then
//			ls_id = string(this.getitemnumber(row,'id'))
//			ls_value = data
//			ic_multithread.post f_update_data(ls_id +';'+ls_value)
//		end if
	case 'remind_option'
		ls_remind_yn = this.getitemstring( row, 'remind_yn')
		ls_popup_yn = this.getitemstring( row, 'popup_yn')
		ldb_alert_id = this.getitemnumber( row, 'id')
		if string(data) = 'pause' then
			this.rowscopy( row, row, Primary!, ids_popup_data, ids_popup_data.rowcount( ) + 1, Primary!)
			ids_popup_data.setitem( ids_popup_data.rowcount(), 'remind_option', data)
//			for ll_idx = 1 to ids_popup_data.rowcount()
//				if ls_alert_id <> '' then ls_alert_id += ','
//				ls_alert_id += string(ids_popup_data.getitemnumber( ll_idx, 'id'))
//			next
//			if ls_alert_id <> '' then ls_alert_id = '(' + ls_alert_id + ')'
//			this.setfilter( "ID not in " + ls_alert_id)
//			this.filter( )
		else
			ll_find = ids_popup_data.find( "ID = " + string(ldb_alert_id), 1, ids_popup_data.rowcount( ))
			if ll_find > 0 then ids_popup_data.deleterow( ll_find)
		end if
		if sharedobjectGet("i_multithread", ic_multithread) = Success! then
			ls_id = string(ldb_alert_id)
			ls_value = data
			ic_multithread.post f_update_data(ls_id +';'+ls_value)
		end if
end choose
destroy lds_db
end event

type dw_1 from datawindow within c_w_alert_popup
event tray_event pbm_custom01
integer y = 84
integer width = 1591
integer height = 100
integer taborder = 10
string title = "none"
string dataobject = "d_alert_data_popup_ctrl"
boolean border = false
boolean livescroll = true
end type

event buttonclicked;choose case dwo.name
	case 'b_pin'
		if ib_pined=  false then
			ii_timer = 0
			timer(0)
			ib_pined = true
			this.modify( "b_pin.filename='Pics\pinned.gif'")
		else
			ii_timer = 0
			timer(30)
			ib_pined = false
			this.modify( "b_pin.filename='Pics\pin.gif'")
		end if
	case 'b_exit'
		ib_pined = false
		parent.f_show_down( )
end choose
end event

