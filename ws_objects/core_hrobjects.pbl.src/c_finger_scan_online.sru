$PBExportHeader$c_finger_scan_online.sru
forward
global type c_finger_scan_online from s_object_display
end type
end forward

global type c_finger_scan_online from s_object_display
event type integer e_action_connect ( )
event type integer e_action_disconnect ( )
event type integer e_action_device_info ( )
event type integer e_action_syn_date_device ( )
event type integer e_action_restart_device ( )
event type integer e_action_shutdown_device ( )
event e_action_del_attdata ( )
event e_action_get_att ( )
end type
global c_finger_scan_online c_finger_scan_online

type variables
//string				ias_online_ip[]
//double			iadb_machine_id[]
t_ds_db			ids_device_data,ids_staff,ids_device_setup


end variables

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
public function integer f_insert_att_data (datetime vdt_checktime, long vl_enrollnbr, double vdb_machine_id, string vs_ip, string vs_type)
end prototypes

event type integer e_action_connect();OLECustomControl		lo_czkem
t_dw_mpl				ldw_device

double		ldb_m_id
string			ls_ip,ls_err,ls_tmp,ls_sus
long			ll_ip_port,ll_find,ll_idx,ll_find1


ldw_device = iw_display.f_get_dw(istr_dwo[1].s_dwo_default)
ll_find = ldw_device.find( "gutter = 'Y'", 1, ldw_device.rowcount())
if ll_find = 0 then ll_find = ldw_device.getrow()
Do
	ll_idx ++
	lo_czkem = iw_display.dynamic f_get_czkem(ll_idx)
	ls_ip = ldw_device.getitemstring( ll_find, 'ip_address')
	if isnull(ls_ip) then ls_ip = ''
	ll_ip_port = ldw_device.getitemnumber(ll_find , 'ip_port')
	if isnull(ll_ip_port) then ll_ip_port = 0
	ldb_m_id = ldw_device.getitemnumber( ll_find,'ID')
	ls_tmp = ldw_device.getitemstring( ll_find, 'machine_name')
	if isnull(ls_tmp) then ls_tmp = ''
	if ls_ip = '' or ll_ip_port = 0 then
		if ls_tmp <> '' then ls_err += ls_tmp + '; '
	else
		if lo_czkem.object.Connect_Net(ls_ip, ll_ip_port ) then
			ldw_device.setitem(ll_find ,'status', 'Y')
			if lo_czkem.object.Regevent(1,65535) then
				lo_czkem.object.ReadRTlog(1)
				lo_czkem.object.GetRTlog(1)
				if ls_tmp <> '' then ls_sus += ls_tmp +'; '
				ll_find1 = ids_device_setup.find( "ID = " + string(ldb_m_id), 1, ids_device_setup.rowcount())
				if ll_find1 > 0 then 
					ids_device_setup.setitem(ll_find1 ,'status', 'Y')
					ids_device_setup.setitem(ll_find1 ,'commkey',ll_idx) // giữ lại số thứ tự của zk đã kết nối thành công //
				end if
			end if
		end if
	end if
	ll_find = ldw_device.find( "gutter = 'Y'", ll_find+1, ldw_device.rowcount()+1)
Loop While ll_find > 0
if ls_err <> '' then
	gf_messagebox('m.c_finger_scan_setup.e_action_connect.02','Thông báo','Lỗi kết nối các máy : ' + ls_err + ' Vui lòng kiểm tra đường truyền LAN , IP hoặc cổng kết nối.','exclamation','ok',1)
end if
if ls_sus <> '' then
	gf_messagebox('m.c_finger_scan_setup.e_action_connect.01','Thông báo','Kết nối REALTIME thành công các máy : '+ ls_sus,'exclamation','ok',1)	
end if	
return 0
end event

event type integer e_action_disconnect();OLECustomControl		lo_czkem
t_dw_mpl				ldw_device

long			ll_find,ll_idx,ll_find1
double		ldb_m_id

//lo_czkem = iw_display.dynamic f_get_czkem()
ldw_device = iw_display.f_get_dw(istr_dwo[1].s_dwo_default)
ll_find = ldw_device.find( "gutter = 'Y'", 1, ldw_device.rowcount())
if ll_find = 0 then ll_find = ldw_device.getrow( )
Do
	ldb_m_id = ldw_device.getitemnumber( ll_find, 'ID')
	ll_find1 = ids_device_setup.find( "ID = " + string(ldb_m_id) +" and status = 'Y'", 1, ids_device_setup.rowcount())
	ll_idx = ids_device_setup.getitemnumber( ll_find1, 'commkey')
	lo_czkem = iw_display.dynamic f_get_czkem(ll_idx)
	lo_czkem.object.disconnect()
	ldw_device.setitem(ll_find ,'status', 'N')
	ll_find = ldw_device.find( "gutter = 'Y'",ll_find + 1, ldw_device.rowcount()+1)
Loop While ll_find > 0

//lo_czkem.object.disconnect()
//ldw_device.setitem(ldw_device.getrow() ,'status', 'N')
	
return 0
end event

event type integer e_action_device_info();OLECustomControl		lo_czkem
t_dw_mpl				ldw_info
datetime					ldt_dev_date
string						ls_data
long						ll_machinenumber,ll_Tmachinenumber,ll_Emachinenumber,ll_EnrollNumbe,ll_VerifyMode,ll_InOutMode
long						ll_Year,ll_Month,ll_Day, ll_Hour, ll_Minute,ll_second,ll_data

lo_czkem = iw_display.dynamic f_get_czkem() 
ldw_info = iw_display.f_get_dw(istr_dwo[2].s_dwo_default)
if lo_czkem.object.getfirmwareversion(1,ref ls_data) then
	ldw_info.setitem( 1, 'firmware', ls_data)
end if
if lo_czkem.object.getplatform(1,ref ls_data) then
	ldw_info.setitem( 1, 'platform', ls_data)
end if
if lo_czkem.object.getsdkversion(ref ls_data) then
	ldw_info.setitem( 1, 'version_sdk', ls_data)
end if
if lo_czkem.object.getsysoption(1,"~~ZKFPVersion",ref ls_data) then
	if ls_data = '10' then
		ls_data = 'IntercorpFinger10.0'
	else
		ls_data = 'IntercorpFinger9.0.'
	end if
	ldw_info.setitem( 1, 'finger_version', ls_data)
end if
if lo_czkem.object.getserialnumber(1,ref ls_data) then
	ldw_info.setitem( 1, 'serial', ls_data)
end if
if lo_czkem.object.getproductcode(1,ref ls_data) then
	ldw_info.setitem( 1, 'name', ls_data)
end if
if lo_czkem.object.getdevicemac(1,ref ls_data) then
	ldw_info.setitem( 1, 'mac_address', ls_data)
end if
if lo_czkem.object.getdeviceip(1,ref ls_data) then
	ldw_info.setitem( 1, 'ip_address', ls_data)
end if
if lo_czkem.object.GetGeneralLogData( 1,ref ll_Tmachinenumber, ref ll_EnrollNumbe, ref ll_Emachinenumber, &
				ref ll_VerifyMode, ref ll_InOutMode, ref ll_Year, ref ll_Month, ref ll_Day, ref ll_Hour, ref ll_Minute) then
	if ll_InOutMode = 0 then
		ls_data = 'Vào'
	elseif ll_InOutMode = 1 then
		ls_data = 'Ra'
	elseif ll_InOutMode = 2 then
		ls_data = 'Break - Ra'
	elseif ll_InOutMode = 3 then
		ls_data = 'Break - Vào'
	elseif ll_InOutMode = 4 then
		ls_data = 'OT - Vào'
	elseif ll_InOutMode = 5 then
		ls_data = 'OT - Ra'
	end if			
	ldw_info.setitem( 1, 'in_out', ls_data)
end if
if lo_czkem.object.GetDeviceTime(1,ref ll_year,ref ll_month,ref ll_day,ref ll_Hour,ref ll_minute,ref ll_second) then
	ldt_dev_date = datetime(string(ll_year)+'/'+string(ll_month)+'/'+string(ll_day)+'  '+string(ll_hour)+':'+string(ll_minute)+':'+string(ll_second))
	ldw_info.setitem( 1, 'device_date', ldt_dev_date)
end if
if lo_czkem.object.GetDeviceStatus(1,9,ref ll_data) then
	ldw_info.setitem( 1, 'total_attendance', string(ll_data))
end if
if lo_czkem.object.GetDeviceStatus(1,6,ref ll_data) then
	ldw_info.setitem( 1, 'total_attendanced', string(ll_data))
end if
if lo_czkem.object.GetDeviceStatus(1,12,ref ll_data) then
	ldw_info.setitem( 1, 'total_attendance_remain', string(ll_data))
end if
if lo_czkem.object.GetDeviceStatus(1,8,ref ll_data) then
	ldw_info.setitem( 1, 'total_staff_can_reg', string(ll_data))
end if
if lo_czkem.object.GetDeviceStatus(1,2,ref ll_data) then
	ldw_info.setitem( 1, 'total_staff_on_device', string(ll_data))
end if
if lo_czkem.object.GetDeviceStatus(1,11,ref ll_data) then
	ldw_info.setitem( 1, 'total_staff_remain', string(ll_data))
end if
if lo_czkem.object.GetDeviceStatus(1,7,ref ll_data) then
	ldw_info.setitem( 1, 'total_finger_can_reg', string(ll_data))
end if
if lo_czkem.object.GetDeviceStatus(1,3,ref ll_data) then
	ldw_info.setitem( 1, 'total_finger_on_device', string(ll_data))
end if
if lo_czkem.object.GetDeviceStatus(1,10,ref ll_data) then
	ldw_info.setitem( 1, 'total_finger_remain', string(ll_data))
end if
lo_czkem.object.RefreshData(1)
return 0
end event

event type integer e_action_syn_date_device();OLECustomControl		lo_czkem

lo_czkem = iw_display.dynamic f_get_czkem()
lo_czkem.object.setdevicetime(1)
	
return 0
end event

event type integer e_action_restart_device();OLECustomControl		lo_czkem
t_dw_mpl				ldw_device

lo_czkem = iw_display.dynamic f_get_czkem()
lo_czkem.object.restartdevice(1)
ldw_device = iw_display.f_get_dw(istr_dwo[1].s_dwo_default)
ldw_device.setitem( ldw_device.getrow( ) , 'status', 'N')
	
return 0
end event

event type integer e_action_shutdown_device();OLECustomControl		lo_czkem
t_dw_mpl				ldw_device

lo_czkem = iw_display.dynamic f_get_czkem()
lo_czkem.object.poweroffdevice(1)
ldw_device = iw_display.f_get_dw(istr_dwo[1].s_dwo_default)
ldw_device.setitem( ldw_device.getrow( ) , 'status', 'N')
	
return 0
end event

event e_action_del_attdata();OLECustomControl		lo_czkem

t_dw_mpl	ldw_device
string			ls_ip,ls_machine_name
long			ll_find,ll_port

ldw_device = iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
lo_czkem = iw_display.dynamic f_get_czkem()
ll_find = ldw_device.find( "gutter = 'Y'", 1, ldw_device.rowcount( ) )
if ll_find > 0 then
	if gf_messagebox('m.c_finger_scan_setup.e_action_del_attdata.01','Thông báo','Bạn có chắc chắn xóa dữ liệu chấm vân tay của máy được chọn?','question','yesno',2) = 1 then
		Do While ll_find > 0
			ls_ip = ldw_device.getitemstring( ll_find, 'ip_address')
			ll_port = ldw_device.getitemnumber( ll_find, 'ip_port')
			if isnull(ls_ip) or ls_ip = '' or isnull(ll_port) or ll_port = 0 then
			else
				if lo_czkem.object.Connect_Net(ls_ip, ll_port ) then
					lo_czkem.object.ClearGLog(1)
					ls_machine_name += ldw_device.getitemstring( ll_find, 'machine_name') + ', '
				end if
			end if
			ll_find = ldw_device.find( "gutter = 'Y'",ll_find + 1, ldw_device.rowcount( ) +1)
		Loop
		if isnull(ls_machine_name) then ls_machine_name = ''
		gf_messagebox('m.c_finger_scan_setup.e_action_del_attdata.02','Thông báo','~t Đã xóa xong ~t~t Các máy đã xóa: '+ls_machine_name,'exclamation','ok',1)
	end if
end if


end event

event e_action_get_att();OLECustomControl		lo_czkem

t_transaction	lt_transaction
c_datetime		lc_dt

t_dw_mpl	ldw_device
t_ds_db		lds_updatedata,lds_checkdata
datetime		ldt_checktime,ldt_sysdate,ldt_max_date
date			ld_lastdate,ld_max_date
double		ldb_ref_id
string			ls_machine_name,ls_ip_address,ls_type,ls_platform,ls_enrolnum,ls_checktime,ls_ref_table, ls_date, ls_time, ls_update,ls_mess
long			ll_find,ll_port,ll_verifymode,ll_inoutmode,ll_year,ll_month,ll_day,ll_hour,ll_minute,ll_second, ll_workCode,ll_rowcount,ll_count,ll_row
long			ll_enrollnum,ll_find1,ll_cnt,ll_data,ll_idx,ll_idx1
any			laa_data[]

ldw_device = iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
if ldw_device.rowcount( ) = 0 then return
lo_czkem = iw_display.dynamic f_get_czkem()
iw_display.f_get_transaction( lt_transaction)
ldt_sysdate = lc_dt.f_getsysdate( )
ld_lastdate = RelativeDate ( date(ldt_sysdate), 1 )

setpointer(hourglass!)

lds_updatedata = create t_ds_db
lds_checkdata = create t_ds_db
ll_find = ldw_device.find( "gutter = 'Y'", 1, ldw_device.rowcount( ))
if ll_find > 0 then
		lds_updatedata.dataobject = 'd_finger_scan_data_grid'
		lds_updatedata.f_settransobject( lt_transaction)
		Do while ll_find > 0
			ls_machine_name += ldw_device.getitemstring( ll_find, 'MACHINE_NAME') +', '
			ls_ip_address = ldw_device.getitemstring( ll_find, 'ip_address')
			ls_type = ldw_device.getitemstring( ll_find, 'in_out')
			ll_port = ldw_device.getitemnumber( ll_find, 'ip_port')
			ldb_ref_id = ldw_device.getitemnumber( ll_find, 'id')
			ls_ref_table = upper(ldw_device.describe("datawindow.table.update"))
			lds_checkdata.dataobject = 'ds_finger_scan_data_grid'
			lds_checkdata.f_settransobject( lt_transaction)
			laa_data[1] = '(' + string(lc_dt.f_add_months( date(ldt_sysdate) , -1)) + ':'+ string(lc_dt.f_add_date( date(ldt_sysdate), 1)) + ')'
			laa_data[2] = ls_ip_address
			lds_checkdata.f_add_where( 'CHECK_TIME;IP_ADDRESS', laa_data)
			ll_rowcount = lds_checkdata.retrieve( )
			if ll_rowcount > 0 then
				ld_max_date = date(lds_checkdata.getitemdatetime( 1, 'check_time'))
			else
				ld_max_date = lc_dt.f_add_months( date(ldt_sysdate) , -12)
			end if
			if isnull(ls_ip_address) or ls_ip_address = '' or isnull(ll_port) or ll_port = 0 then
			else
				if lo_czkem.object.Connect_Net(ls_ip_address, ll_port ) then
					lo_czkem.object.GetDeviceStatus(1,6,ref ll_data)
					lo_czkem.object.getplatform(1,ref ls_platform) 
					if lo_czkem.object.ReadGeneralLogData(1) then 
						if pos(ls_platform,'TFT') > 0 then //-- máy màn hình màu --//
							Do While lo_czkem.object.ssr_GetGeneralLogData(1, ref ls_enrolnum, ref ll_verifymode, ref ll_inoutmode, ref ll_year, ref ll_month, ref ll_day, ref ll_hour, ref ll_minute, ref ll_second, ref ll_workCode)
//								ls_date = string(ll_day) + '/' + string(ll_month) + '/' + string(ll_year) 
//								ls_time = string(ll_hour) + ':' + string(ll_minute) + ':' + string(ll_second)								
								ldt_checktime = datetime(date(string(ll_day) + '/' + string(ll_month) + '/' + string(ll_year) ), time(string(ll_hour) + ':' + string(ll_minute) + ':' + string(ll_second)	))
								ls_checktime = string(ldt_checktime)
								ll_enrollnum = long(ls_enrolnum)
								ll_idx ++
								if ll_idx <> ll_data then
									ll_idx1 = mod(ll_idx,500)
								else
									ll_idx1 = mod(ll_idx,ll_data)
								end if
								if ll_idx1 = 0 then
									this.of_show_progress( int((ll_idx/ll_data)*100),'Đang tải dữ liệu')
									this.of_set_progress_text( string(ll_idx)+'/'+string(ll_data))									
								end if
								if date(ldt_checktime) > ld_max_date then
									ll_cnt ++
									ls_update = ' INSERT INTO FINGER_SCAN_DATA ( ID, OBJECT_REF_ID, ACCTNO, TYPE,IP_ADDRESS,CHECK_TIME ,OBJECT_REF_TABLE)' +&
													' VALUES ( '+ string(this.f_create_id( )) + ', ' + string(ldb_ref_id) + ", "  + string(ll_enrollnum) + ', ' +string(ll_inoutmode) +&
													", '"+ls_ip_address+"', " +"to_date('"+string(ldt_checktime) +"', 'dd/mm/yyyy hh24:mi:ss'), '"+ls_ref_table+"'"+") " 
									EXECUTE IMMEDIATE :ls_update using lt_transaction;
									ll_row = 1
								end if
							Loop
						else
							Do While lo_czkem.object.GetGeneralLogDataStr(1, ref ll_enrollnum, ref ll_verifymode, ref ll_inoutmode, ref ls_checktime)
								ldt_checktime = datetime(ls_checktime)
								if ll_rowcount = 0 then
									ll_find1 = 0
								else
									ll_find1 = lds_checkdata.find( "CHECK_TIME = datetime('" + ls_checktime + "') and ACCTNO = "+ ls_enrolnum, 1, ll_rowcount)
								end if
								if ll_find1 = 0 then
									ll_row = lds_updatedata.event e_addrow( )
									lds_updatedata.setitem( ll_row, 'ID', this.f_create_id( ) )
									lds_updatedata.setitem( ll_row, 'OBJECT_REF_ID', ldb_ref_id)
									lds_updatedata.setitem( ll_row, 'OBJECT_REF_TABLE', ls_ref_table)
									lds_updatedata.setitem( ll_row, 'ACCTNO', ll_enrollnum)
									lds_updatedata.setitem( ll_row, 'IP_ADDRESS', ls_ip_address)
									lds_updatedata.setitem( ll_row, 'TYPE', ls_type)
									lds_updatedata.setitem( ll_row, 'CHECK_TIME', ldt_checktime)
								end if
							Loop
						end if
					else
						ls_mess += ldw_device.getitemstring( ll_find, 'MACHINE_NAME') +', '
					end if
				end if
			end if
			ll_find = ldw_device.find( "gutter = 'Y'", ll_find + 1, ldw_device.rowcount( ) + 1 )
			lo_czkem.object.disconnect()
			this.of_show_progress( 101,'')
		Loop
end if
if ll_row > 0 then
	if lds_updatedata.update( true,false) = 1 then
		lds_updatedata.resetupdate( )
		commit using lt_transaction;
		gf_messagebox('m.c_finger_scan_setup.e_action_get_att.01','Thông báo','Các máy đã tải xong @: '+ls_machine_name + ' Tông số dòng đã tải: '+string(ll_cnt),'exclamation','ok',1)
	else
		rollback using lt_transaction;
	end if
else
	gf_messagebox('m.c_finger_scan_setup.e_action_get_att.02','Thông báo', 'Không có dữ liệu mới' ,'exclamation','ok',1)
end if
if ls_mess <> '' then gf_messagebox('m.c_finger_scan_setup.e_action_get_att.03','Thông báo','không đọc được bộ nhớ đệm của máy chấm công của máy: ' + ls_mess,'exclamation','ok',1)
destroy lds_updatedata
destroy lds_checkdata



end event

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_finger_scan_setup_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_finger_scan_setup_grid'
istr_dwo[1].b_master = false
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_details = ''
istr_dwo[1].s_dwo_shared = ''
istr_dwo[1].s_dwo_master = ''
istr_dwo[1].s_master_keycol = ''
istr_dwo[1].s_detail_keycol = ''
istr_dwo[1].b_ref_table_yn  = false
istr_dwo[1].s_ref_table_field = ''
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_gb_name = ''
istr_dwo[1].s_description = 'Khai báo kết nối thiết bị'

istr_dwo[2].s_dwo_default =  'd_finger_scan_online_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_finger_scan_online_grid'
istr_dwo[2].b_master = false
istr_dwo[2].b_detail = false
istr_dwo[2].b_cascade_del = false
istr_dwo[2].s_dwo_details = ''
istr_dwo[2].s_dwo_shared = ''
istr_dwo[2].s_dwo_master = ''
istr_dwo[2].s_master_keycol = ''
istr_dwo[2].s_detail_keycol = ''
istr_dwo[2].b_ref_table_yn  = false
istr_dwo[2].s_ref_table_field = ''
istr_dwo[2].b_insert = false
istr_dwo[2].b_update = false
istr_dwo[2].b_delete = false
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_gb_name = ''
istr_dwo[2].s_description = 'Thông tin chấm công'
end subroutine

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

public function integer f_insert_att_data (datetime vdt_checktime, long vl_enrollnbr, double vdb_machine_id, string vs_ip, string vs_type);long					ll_row
t_transaction		lt_transaction


this.iw_display.f_get_transaction(lt_transaction )

ll_row = ids_device_data.event e_addrow( )
ids_device_data.setitem( ll_row, 'ID', this.f_create_id( ) )
ids_device_data.setitem( ll_row, 'OBJECT_REF_ID', vdb_machine_id)
ids_device_data.setitem( ll_row, 'ACCTNO', vl_enrollnbr)
ids_device_data.setitem( ll_row, 'IP_ADDRESS', vs_ip)
ids_device_data.setitem( ll_row, 'CHECK_TIME', vdt_checktime)
ids_device_data.setitem( ll_row, 'OBJECT_REF_TABLE', 'FINGER_SCAN_SETUP')
ids_device_data.setitem( ll_row, 'TYPE', vs_type)

if ids_device_data.update(true, false ) = 1 then
	commit using lt_transaction;
	ids_device_data.reset( )
else
	gf_messagebox('m.c_finger_scan_setup.f_insert_att_data.01','Thông báo','Lỗi cập nhật:@'+lt_transaction.sqlerrtext,'stop','ok',1)
	rollback using lt_transaction;
	return -1
end if;
return 1
end function

on c_finger_scan_online.create
call super::create
end on

on c_finger_scan_online.destroy
call super::destroy
end on

event constructor;call super::constructor;any		laa_daa[]

ib_changed_dwo_4edit = false
is_display_model = '2d'
ib_display_text = false
this.ib_keyboardlocked = true
is_object_title = 'Kết nối thiết bị online và điều khiển khoá cửa'
istr_actionpane[1].s_button_name = 'b_add;b_insert;b_modify;b_save;b_query;b_execquery;b_filteron;b_connect;b_disconnect;b_device_info;b_syn_date_device;'
istr_actionpane[1].s_button_name += 'b_get_att;b_restart_device;b_shutdown_device;b_del_attdata;b_refresh;b_delete;'
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title


end event

event e_action_ctrl_bttn;call super::e_action_ctrl_bttn;datawindow				ldw_focus
int								li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	if not this.ib_copying then
		//-- control d_action_edit --//
		FOR li_idx = 1 to upperbound(istr_actionpane[]) 
			if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
				if ldw_focus.dynamic f_get_ib_shared() then
					ldw_focus = ldw_focus.dynamic f_getdwmaster()
				end if			
				if ldw_focus.dynamic f_get_ib_detail() then
					if ib_changed_dwo_4edit then
						if ldw_focus.dynamic f_isgrid() then			
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query;b_connect;b_disconnect;b_device_info;b_syn_date_device;b_get_att;b_restart_device;b_shutdown_device;b_del_attdata;b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query;b_connect;b_disconnect;b_device_info;b_syn_date_device;b_get_att;b_restart_device;b_shutdown_device;b_del_attdata;b_refresh;b_delete;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query;b_connect;b_disconnect;b_device_info;b_syn_date_device;b_get_att;b_restart_device;b_shutdown_device;b_del_attdata;b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query;b_connect;b_disconnect;b_device_info;b_syn_date_device;b_get_att;b_restart_device;b_shutdown_device;b_del_attdata;b_refresh;b_delete;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_insert;b_modify;b_filteron;b_query;b_connect;b_disconnect;b_device_info;b_syn_date_device;b_get_att;b_restart_device;b_shutdown_device;b_del_attdata;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_insert;b_modify;b_filteron;b_query;b_connect;b_disconnect;b_device_info;b_syn_date_device;b_get_att;b_restart_device;b_shutdown_device;b_del_attdata;b_refresh;b_delete;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
				istr_actionpane[li_idx].s_visible_buttons =  'b_book; b_attach; b_note;b_doc_trace_on;b_user_trace;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
				
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_e_postopen;call super::e_window_e_postopen;t_transaction		lt_transaction



iw_display.f_get_transaction( lt_transaction)
ids_device_data = create t_ds_db
ids_device_data.dataobject = 'd_finger_scan_data_grid'
ids_device_data.f_settransobject( lt_transaction)
		
return 0
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;
if rpo_dw.dataobject = istr_dwo[1].s_dwo_default then
	rpo_dw.setitem(vl_currentrow,'conn_type','1')
	rpo_dw.setitem(vl_currentrow,'ip_port',4370)
	rpo_dw.setitem(vl_currentrow,'in_out','in_out')
end if
return vl_currentrow
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;long		ll_ip_port

if rpo_dw.dataobject = istr_dwo[1].s_dwo_default then
	if vs_colname = 'conn_type' then
		if vs_editdata = '1' then
			ll_ip_port = 4730
		else
			setnull(ll_ip_port)
		end if
		rpo_dw.setitem(vl_currentrow,'ip_port',ll_ip_port)
	end if
end if
return AncestorReturnValue
end event

event e_window_e_preopen;call super::e_window_e_preopen;//--resize parm --//

iw_display.dynamic f_set_ii_upperpart_height(1350)
iw_display.dynamic f_set_ii_fixedpart2_height(750)

return 0
end event

event e_czkem_onatttransactionex;call super::e_czkem_onatttransactionex;long					ll_enrollnum,ll_find
string					ls_date, ls_time,ls_staff_code,ls_staff_name,ls_dept_name,ls_m_name,ls_ip,ls_tmp,ls_type
double				ldb_id
datetime				ldt_checktime

t_dw_mpl			ldw_onatt


ls_date = string(day) + '/' + string(month) + '/' + string(year) 
ls_time =  string(hour) + ':' + string(minute) + ':' + string(second)
ldt_checktime = datetime(date(ls_date), time(ls_time))
ll_enrollnum = long(enrollnumber)
//ls_tmp = mid(vs_czkem_name,pos(vs_czkem_name,'_')+1,len(vs_czkem_name) - pos(vs_czkem_name,'_'))
ll_find = ids_device_setup.find( "commkey = " + ls_tmp, 1, ids_device_setup.rowcount())
if ll_find > 0 then
	ls_m_name = ids_device_setup.getitemstring( ll_find, 'machine_name')
	ls_ip = ids_device_setup.getitemstring( ll_find, 'ip_address')
	ldb_id = ids_device_setup.getitemnumber(ll_find , 'ID')
	ls_type = ids_device_setup.getitemstring( ll_find, 'in_out')
	this.f_insert_att_data(ldt_checktime, ll_enrollnum,ldb_id,ls_ip,ls_type)
else
	return
end if


ldw_onatt = iw_display.f_get_dw(istr_dwo[2].s_dwo_default  )
ldw_onatt.insertrow( 1)
if ldw_onatt.rowcount( ) = 101 then ldw_onatt.deleterow( 101)
ll_find = ids_staff.find( "staff_acctno = " + string(ll_enrollnum), 1, ids_staff.rowcount( ) )
if ll_find > 0 then
	ls_staff_code = ids_staff.getitemstring( ll_find, 'code')
	ls_staff_name = ids_staff.getitemstring( ll_find, 'name')
	ls_dept_name = ids_staff.getitemstring( ll_find, 'dept_name')
	ldw_onatt.setitem(1, 'staff_code', ls_staff_code)
	ldw_onatt.setitem(1, 'staff_name', ls_staff_name)
	ldw_onatt.setitem(1, 'dept_name', ls_dept_name)
	ldw_onatt.setitem(1, 'machine_name', ls_m_name)
	ldw_onatt.setitem(1, 'ip_address', ls_ip)
	ldw_onatt.setitem(1, 'acctno', ll_enrollnum)
	ldw_onatt.setitem(1, 'check_time', ldt_checktime)
else
	ldw_onatt.setitem( 1, 'staff_code',string(ll_enrollnum))
	ldw_onatt.setitem( 1, 'staff_name', 'Người dùng chưa khai báo phần mềm')
end if

end event

event destructor;call super::destructor;destroy ids_staff
destroy ids_device_data
destroy ids_device_setup
end event

event e_dw_e_postretrieve;call super::e_dw_e_postretrieve;
if ids_device_setup.rowcount( ) > 0 then ids_device_setup.reset( )
if rpo_dw.dataobject = istr_dwo[1].s_dwo_default then
	rpo_dw.rowscopy( 1, rpo_dw.rowcount(),Primary! , ids_device_setup, 1, Primary!)
end if
return 0
end event

event e_window_open;call super::e_window_open;any		laa_daa[]


ids_staff = create t_ds_db
ids_staff.dataobject = 'ds_staff'
laa_daa[1] = 'Y'
ids_staff.f_add_where( 'active_yn', laa_daa)
ids_staff.f_settransobject( it_transaction)
ids_staff.retrieve( )

ids_device_setup = create t_ds_db
ids_device_setup.dataobject = 'd_finger_scan_setup_grid'
return ancestorreturnvalue
end event

