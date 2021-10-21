$PBExportHeader$c_transfer_empl_infor.sru
forward
global type c_transfer_empl_infor from s_object_display
end type
end forward

global type c_transfer_empl_infor from s_object_display
event e_action_show_userinfo ( )
event e_action_push_to_software ( )
event e_action_push_to_device ( )
end type
global c_transfer_empl_infor c_transfer_empl_infor

type variables
t_ds_db		ids_staff_finger
end variables

forward prototypes
public subroutine f_set_dwo_window ()
public function integer f_get_finger_data (string rs_enrollnumber, ref string ras_tmpdata[], ref long rl_finger, ref olecustomcontrol role_zkem)
public function integer f_set_finger_data (long vl_staff_id, long vl_staff_acctno, long vl_finger_idx, string vas_finger_data[], string vs_zkversion, t_transaction lt_transaction)
public function integer f_push_to_device (ref t_dw_mpl rdw_handling, long vl_row, ref olecustomcontrol ro_czkem)
public function integer f_show_user_device (ref olecustomcontrol role_zkem, string vs_ip_address)
public function integer f_pull_to_db (ref olecustomcontrol role_zkem, string vs_firmware_ver, t_dw_mpl vdw_empl_device, string vs_ip_address)
end prototypes

event e_action_show_userinfo();OLECustomControl		lo_czkem

t_dw_mpl		ldw_device,ldw_empl_devi
string				ls_ip_address,ls_enrollnumber,las_ras_tmpdata[]
long				ll_finger
int					li_find,li_port

ldw_device = iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
//ldw_empl_devi = iw_display.f_get_dw( istr_dwo[3].s_dwo_default)
li_find = ldw_device.find( "gutter = 'Y'", 1,ldw_device.rowcount( ) )
if li_find = 0 then
		gf_messagebox('m.c_transfer_empl_infor.e_action_show_userinfo.01','Thông báo','Chưa chọn máy chấm công cần lấy thấy thông tin nhân viên' ,'stop','ok',1)
		return 
else
	lo_czkem = iw_display.dynamic f_get_czkem()
	Do While li_find > 0 				
			ls_ip_address = ldw_device.getitemstring( li_find, 'ip_address')
			li_port = ldw_device.getitemnumber( li_find, 'ip_port')
			if lo_czkem.object.Connect_Net(ls_ip_address, li_port ) then
	//			if ldw_empl_devi.rowcount( ) > 0 then ldw_empl_devi.reset( )
				this.f_show_user_device(lo_czkem, ls_ip_address )			
				lo_czkem.object.disconnect()			
			end if
		li_find = ldw_device.find( "gutter = 'Y'", li_find + 1,ldw_device.rowcount( ) +1 )
	Loop
	gf_messagebox('m.c_transfer_empl_infor.e_action_show_userinfo.03','Thông báo','Hoàn tất' ,'information','ok',1)
end if

//
//if lo_czkem.object.getsysoption(1,"~~ZKFPVersion",ref ls_data) then
//	if ls_data = '10' then
//		ls_data = 'IntercorpFinger10.0'
//	else
//		ls_data = 'IntercorpFinger9.0.'
//	end if
//	ldw_info.setitem( 1, 'finger_version', ls_data)
//end if

return 
end event

event e_action_push_to_software();OLECustomControl		lo_czkem


t_dw_mpl		ldw_device,ldw_empl_devi, ldw_empl_soft
string				ls_ip_address,ls_enrollnumber,las_ras_tmpdata[],las_tmp[],ls_data
long				ll_finger
int					li_idx,li_find,li_port

ldw_device = iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
ldw_empl_devi = iw_display.f_get_dw( istr_dwo[3].s_dwo_default)

li_find = ldw_device.find( "gutter = 'Y'", 1,ldw_device.rowcount( ) )
if li_find = 0 then
		gf_messagebox('m.c_transfer_empl_infor.e_action_push_to_software.01','Thông báo','Chưa chọn máy chấm công cần lấy thấy thông tin nhân viên' ,'stop','ok',1)
		return 
elseif li_find > 0 then
	li_idx = li_find
	li_find = ldw_device.find( "gutter = 'Y'", li_find + 1,ldw_device.rowcount( ) +1 )
	if li_find > 0 then
		gf_messagebox('m.c_transfer_empl_infor.e_action_push_to_software.02','Thông báo','Chỉ được chọn 1 máy chấm công để lấy thông tin' ,'stop','ok',1)
		return
	else		
		ls_ip_address = ldw_device.getitemstring( li_idx, 'ip_address')
		li_port = ldw_device.getitemnumber( li_idx, 'ip_port')
		lo_czkem = iw_display.dynamic f_get_czkem()
		if lo_czkem.object.Connect_Net(ls_ip_address, li_port ) then
			if lo_czkem.object.getsysoption(1,"~~ZKFPVersion",ref ls_data) then
				if ls_data = '10' then
					ls_data = 'ZKFinger10.0'
				else
					ls_data = 'ZKFinger9.0'
				end if
			end if
			// hàm get dữ liệu vân tay và set vào datastore//
			if this.f_pull_to_db(lo_czkem , ls_data, ldw_empl_devi, ls_ip_address)= 1 then
				gf_messagebox('m.c_transfer_empl_infor.e_action_push_to_software.03','Thông báo','Hoàn tất kéo dấu vân tay' ,'stop','ok',1)
				ldw_empl_soft = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
				ldw_empl_soft.event e_refresh( )
			end if
			lo_czkem.object.disconnect()
		end if
	end if
end if

return 
end event

event e_action_push_to_device();OLECustomControl		lo_czkem

t_dw_mpl	ldw_empl_soft,ldw_device
string			ls_ip_add,ls_machine_name,ls_err
long			ll_find,ll_find1,ll_ip_port,ll_count

ldw_empl_soft = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
ldw_device = iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
lo_czkem = iw_display.dynamic f_get_czkem()
setpointer(hourglass!)

ll_find = ldw_device.find( "gutter = '" + "Y'", 1, ldw_device.rowcount( ) )
if ll_find > 0 then	
	Do While ll_find > 0
		ls_ip_add = ldw_device.getitemstring( ll_find, 'ip_address')
		ll_ip_port = ldw_device.getitemnumber( ll_find, 'ip_port')
		
		if isnull(ls_ip_add) or ls_ip_add = '' or isnull(ll_ip_port) or ll_ip_port = 0 then
			gf_messagebox('m.c_transfer_empl_infor.e_action_push_to_device.01','Thông báo','Máy chấm công chưa khai báo IP hoặc PORT' ,'stop','ok',1)
		else
			if lo_czkem.object.Connect_Net(ls_ip_add, ll_ip_port ) then
				ll_find1 = ldw_empl_soft.find( "gutter = '" + "Y'", 1, ldw_empl_soft.rowcount( ) )
				if ll_find1 > 0 then
					Do While ll_find1 > 0
						if this.f_push_to_device( ldw_empl_soft, ll_find1, lo_czkem) <> 1 then
							return
						else
							ll_count ++
						end if
						//-- tiếp tực chuyển nhân viên khác--//
						ll_find1 = ldw_empl_soft.find( "gutter = '" + "Y'", ll_find1 + 1, ldw_empl_soft.rowcount( ) + 1)
					Loop
				else
					gf_messagebox('m.c_transfer_empl_infor.e_action_push_to_device.02','Thông báo','Chưa chọn nhân viên' ,'stop','ok',1)
				end if
				lo_czkem.object.disconnect()
			end if
		end if
		if ll_count > 0 then
			ls_machine_name += ldw_device.getitemstring( ll_find, 'machine_name') + ', '
		end if
		//-- tiếp tực chuyển vào máy khác--//
		ll_find = ldw_device.find( "gutter = '" + "Y'", ll_find+1, ldw_device.rowcount( ) +1)	
	Loop
else
	gf_messagebox('m.c_transfer_empl_infor.e_action_push_to_device.03','Thông báo','Chưa chọn máy chấm công' ,'stop','ok',1)
end if
if ls_machine_name <> '' or ls_err <> '' then
	gf_messagebox('m.c_transfer_empl_infor.e_action_push_to_device.04','Thông báo','Số nhân viên chuyển vân tay thành công: '+ string(ll_count) + ' ~t . Các máy thành công: ' + ls_machine_name + ', ~t các máy thất bại do khác version: '+ ls_err ,'stop','ok',1)
end if
return
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
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = false
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_gb_name = ''
istr_dwo[1].s_description = 'Khai báo kết nối thiết bị'

istr_dwo[2].s_dwo_default =  'd_empl_soft_infor_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = ''
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
istr_dwo[2].s_description = 'Thông tin nhân viên từ phần mềm'

istr_dwo[3].s_dwo_default =  'd_empl_devi_infor_grid'
istr_dwo[3].s_dwo_form = ''
istr_dwo[3].s_dwo_grid = ''
istr_dwo[3].b_master = false
istr_dwo[3].b_detail = false
istr_dwo[3].b_cascade_del = false
istr_dwo[3].s_dwo_details = ''
istr_dwo[3].s_dwo_shared = ''
istr_dwo[3].s_dwo_master = ''
istr_dwo[3].s_master_keycol = ''
istr_dwo[3].s_detail_keycol = ''
istr_dwo[3].b_ref_table_yn  = false
istr_dwo[3].s_ref_table_field = ''
istr_dwo[3].b_insert = false
istr_dwo[3].b_update = false
istr_dwo[3].b_delete = false
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_excel = true
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].s_gb_name = ''
istr_dwo[3].s_description = 'Thông tin nhân viên thiết bị'
end subroutine

public function integer f_get_finger_data (string rs_enrollnumber, ref string ras_tmpdata[], ref long rl_finger, ref olecustomcontrol role_zkem);long 		FINGER_INDEX,li_flag,ll_TmpLength,li_finger,ll,ll_count,ll1,ll_count1
string 	ls_tmpdata
boolean 	lb_connected,lb_flag	

role_zkem.object.ReadAllUserID(1) 
role_zkem.object.ReadAllTemplate(1)
for FINGER_INDEX=0 to 9
	role_zkem.object.GetUserTmpExStr(1, rs_enrollnumber, FINGER_INDEX,ref li_flag, ref ls_tmpdata, ref ll_TmpLength)
	if ls_tmpdata='' then //không có vân tay or không đang ký hết 10 vân tay
		if FINGER_INDEX=0 then
			ras_tmpdata[1]=''
		end if
		FINGER_INDEX=10
	else
		li_finger=li_finger+1
		ras_tmpdata[li_finger]=ls_tmpdata
	end if
next
if ras_tmpdata[1] = '' then
	return 0
else
	rl_finger=li_finger
	return 1
end if
end function

public function integer f_set_finger_data (long vl_staff_id, long vl_staff_acctno, long vl_finger_idx, string vas_finger_data[], string vs_zkversion, t_transaction lt_transaction);int		li_idx,li_row
long	ll_s_row
double	ldb_staff_id

t_ds_db		lds_finger

if vl_staff_id = 0 then
	select staff.object_ref_id into :ldb_staff_id
	from staff 
	where staff.staff_acctno = :vl_staff_acctno using sqlca;
else
	ldb_staff_id = vl_staff_id
end if
delete FINGERPRINT where object_ref_id = :ldb_staff_id using lt_transaction;	
lds_finger = create t_ds_db
lds_finger.dataobject = 'ds_finger_data'
lds_finger.f_settransobject(lt_transaction )
for li_idx=1 to vl_finger_idx
	li_row = lds_finger.insertrow(0 )
	lds_finger.setitem(li_row,'id',this.f_create_id( ) )
	lds_finger.setitem(li_row,'object_ref_id',ldb_staff_id)
	lds_finger.setitem(li_row,'object_ref_table','OBJECT')
	lds_finger.setitem(li_row,'finger_index',li_idx)
	lds_finger.setitem(li_row,'finger_tmpstr',vas_finger_data[li_idx])
	lds_finger.setitem(li_row,'company_id',gi_user_comp_id)
	lds_finger.setitem(li_row,'branch_id',gdb_branch)
	lds_finger.setitem( li_row, 'zkfp_version', vs_zkversion)
next
if lds_finger.update(true,false ) = 1 then
	lds_finger.resetupdate( )
	commit using lt_transaction;
end if
destroy lds_finger
return 1
end function

public function integer f_push_to_device (ref t_dw_mpl rdw_handling, long vl_row, ref olecustomcontrol ro_czkem);boolean		lb_enable
string			ls_data,ls_EnrollNumber,ls_cardnumber,ls_fp_version,ls_name,ls_pwd,TmpData, ls_enabled
long			ll_EnrollNumber,ll_Priviledge,ll_flag,ll_fingerindex, ll_errcode
any			laa_data[]
int				li_idx,ll_retrieve
t_ds_db		lds_finger

lds_finger = create t_ds_db
lds_finger.dataobject = 'ds_finger_data'
lds_finger.f_settransobject( SQLCA)
if ro_czkem.object.getsysoption(1,"~~ZKFPVersion",ref ls_data) then
	if ls_data = '10' then
		ls_data = 'ZKFinger10.0'
	else
		ls_data = 'ZKFinger9.0'
	end if
	
	ll_EnrollNumber = rdw_handling.getitemnumber(vl_row,'staff_acctno')
	ls_EnrollNumber = string(ll_EnrollNumber)
	ls_cardnumber = string(rdw_handling.getitemnumber( vl_row, 'cardnumber'))
	if isnull(ls_cardnumber) then ls_cardnumber =''
	ls_name = rdw_handling.getitemstring(vl_row,'object_name')
	ls_name = f_convert_uni2unsign(ls_name)	
	laa_data[1] = rdw_handling.getitemnumber(vl_row,'object_id')
	lds_finger.f_add_where( 'OBJECT_REF_ID', laa_data)
	
	ll_retrieve = lds_finger.event e_retrieve( )
	ls_fp_version = lds_finger.getitemstring(ll_retrieve , 'ZKFP_VERSION')
	if ls_data = ls_fp_version then		
		ro_czkem.object.EnableDevice(1, false)
		ro_czkem.object.SetStrCardNumber(ls_cardnumber)
		
		for li_idx = 1 to ll_retrieve			
			ll_fingerindex = lds_finger.getitemnumber(li_idx, 'finger_index')
			TmpData = lds_finger.getitemstring(li_idx, 'finger_tmpstr')
			ls_pwd =  lds_finger.getitemstring(li_idx, 'password')
			if isnull(ls_pwd) then ls_pwd = ''
			ls_enabled =  lds_finger.getitemstring(li_idx, 'enabled')
			ll_Priviledge =  lds_finger.getitemnumber(li_idx, 'Priviledge')
			ll_flag = lds_finger.getitemnumber(li_idx, 'flag')
			if lower(ls_enabled) = 'true' then
				lb_enable = true
			else
				lb_enable = false
			end if
			
			if ro_czkem.object.SSR_SetUserInfo(1,ls_EnrollNumber,ls_name,ls_pwd,ll_Priviledge,lb_enable) then
				ro_czkem.object.SetUserTmpExStr(1,ls_EnrollNumber, ll_fingerindex,ll_flag,TmpData)
			else
				ro_czkem.object.GetLastError(ref ll_errcode)
				ro_czkem.object.EnableDevice(1, true)
				gf_messagebox('m.c_transfer_empl_infor.f_push_to_device.01','Thông báo','Mã lỗi chuyển vân tay:@'+string(ll_errcode),'stop','ok',1)
				return -1
			end if
		next
		ro_czkem.object.EnableDevice(1, true)
	else
		gf_messagebox('m.c_transfer_empl_infor.f_push_to_device.02','Thông báo','Version SDK vân tay không đúng. Version trên phần mềm là: '+ ls_fp_version +' và Version của máy chấm công là: '+ ls_data +'. Kết thúc chuyển vân tay','stop','ok',1)
		return -2
	end if
end if
destroy lds_finger
return 1
end function

public function integer f_show_user_device (ref olecustomcontrol role_zkem, string vs_ip_address);boolean	lb_enable, lb_rtn
string		ls_platform,ls_EnrollNumber,ls_name,ls_pwd,ls_cardnumber,ls_tmpdata, ls_staff_code, ls_staff_name
long		ll_TmpLength,ll_row
long			li_Privilege,FINGER_INDEX,li_flag,li_finger,li_EnrollNumber
blob		lbt_tmpdata

t_dw_mpl				ldw_empl_devi
b_hr_instantiate		lbo_hr


if role_zkem.object.getplatform(1,ref ls_platform) then
	role_zkem.object.EnableDevice(1, false)
	role_zkem.object.ReadAllUserID(1) 
	role_zkem.object.ReadAllTemplate(1)
	ldw_empl_devi = iw_display.f_get_dw( istr_dwo[3].s_dwo_default)
//	ldw_empl_devi.reset( )
	if pos(ls_platform, 'TFT') > 0 then

		Do While role_zkem.object.SSR_GetAllUserInfo(1,ref ls_EnrollNumber,ref ls_name,ref ls_pwd,ref li_Privilege,ref lb_enable)
			role_zkem.object.GetStrCardNumber(ref ls_cardnumber)
			for FINGER_INDEX = 0 to 9
				lb_rtn = role_zkem.object.GetUserTmpExStr(1, ls_EnrollNumber, FINGER_INDEX,ref li_flag, ref ls_tmpdata, ref ll_TmpLength)
				if lb_rtn = false then
					continue
				elseif li_flag > 0 then
					li_finger += 1
				end if
			next
			ll_row = ldw_empl_devi.insertrow( 0)
			ls_staff_code = ''
			ls_staff_name = ''
			if lbo_hr.f_get_staff_code_n_name(long(ls_EnrollNumber), ls_staff_code, ls_staff_name) = -1 then
				continue 
			end if
			ldw_empl_devi.setitem( ll_row, 'object_code', ls_staff_code)
			ldw_empl_devi.setitem( ll_row, 'object_name', ls_staff_name)
			ldw_empl_devi.setitem( ll_row, 'staff_acctno', ls_EnrollNumber)
			ldw_empl_devi.setitem( ll_row, 'cardnumber', ls_cardnumber)
			ldw_empl_devi.setitem( ll_row, 'finger', li_finger)
			ldw_empl_devi.setitem( ll_row, 'ip_address', vs_IP_address)
			ldw_empl_devi.setitem( ll_row, 'password', ls_pwd)
			ldw_empl_devi.setitem( ll_row, 'priviledge', li_Privilege)
			if lb_enable then
				ldw_empl_devi.setitem( ll_row, 'enabled', 'true')
			else
				ldw_empl_devi.setitem( ll_row, 'enabled', 'false')
			end if
			li_finger = 0
		Loop
		 role_zkem.object.EnableDevice(1, true)
		 
	else 
		Do While  role_zkem.object.GetAllUserInfo(1,ref li_EnrollNumber,ref ls_name,ref ls_pwd,ref li_Privilege,ref lb_enable)
			role_zkem.object.GetStrCardNumber(ref ls_cardnumber)
			ls_EnrollNumber = string(li_EnrollNumber)
			for FINGER_INDEX = 0 to 9
				role_zkem.object.GetUserTmpExStr(1, ls_EnrollNumber, FINGER_INDEX,ref li_flag, ref ls_tmpdata, ref ll_TmpLength)
				if li_flag = 0 then
					continue
				else
					li_finger += 1
				end if
			next
			ll_row = ldw_empl_devi.insertrow( 0)
//			ldw_empl_devi.setitem( ll_row, 'object_code', '')
			ldw_empl_devi.setitem( ll_row, 'object_name', ls_name)
			ldw_empl_devi.setitem( ll_row, 'staff_acctno', string(li_EnrollNumber))
			ldw_empl_devi.setitem( ll_row, 'cardnumber', ls_cardnumber)
			ldw_empl_devi.setitem( ll_row, 'finger', li_finger)
			
			li_finger = 0
		Loop
	end if
end if
return 1
end function

public function integer f_pull_to_db (ref olecustomcontrol role_zkem, string vs_firmware_ver, t_dw_mpl vdw_empl_device, string vs_ip_address);boolean	lb_enabled
string		ls_platform,ls_EnrollNumber,ls_name,ls_pwd,ls_cardnumber,ls_tmpdata, ls_enabled
long		ll_TmpLength,ll_row, ll_EnrollNumber, li_row
double	ldb_staff_id
long			li_Priviledge,FINGER_INDEX,li_flag, ll_data
t_ds_db	lds_finger


lds_finger = create t_ds_db
lds_finger.dataobject = 'ds_finger_data'
lds_finger.f_settransobject(it_transaction )
	
if role_zkem.object.getplatform(1,ref ls_platform) then
	role_zkem.object.EnableDevice(1, false)
//	role_zkem.object.ReadAllUserID(1) 
	role_zkem.object.ReadAllTemplate(1)
	if pos(ls_platform, 'TFT') > 0 then
		//-- máy cc màn hình màu --//
		if vdw_empl_device.find(" ip_address= '"+ vs_ip_address+"'" , 1, vdw_empl_device.rowcount()) = 0 then
			role_zkem.object.GetDeviceStatus(1,3,ref ll_data) 
			
			
			Do While role_zkem.object.SSR_GetAllUserInfo(1,ref ls_EnrollNumber,ref ls_name,ref ls_pwd,ref li_Priviledge,ref lb_enabled)
				
				
				ll_EnrollNumber = long(ls_EnrollNumber)
				select staff.object_ref_id into :ldb_staff_id
				from staff 
				where staff.staff_acctno = :ll_EnrollNumber using sqlca;
				
				if ldb_staff_id = 0 then continue
				
				delete FINGERPRINT where object_ref_id = :ldb_staff_id using it_transaction ;		
				if lb_enabled then
					ls_enabled = 'true'
				else
					ls_enabled = 'false'
				end if
				
				for FINGER_INDEX = 0 to 9
					if role_zkem.object.GetUserTmpExStr(1, ls_EnrollNumber, FINGER_INDEX,ref li_flag, ref ls_tmpdata, ref ll_TmpLength) then			
						if li_flag > 0 then
							li_row = lds_finger.insertrow(0 )
							this.of_show_progress( int((li_row/ll_data)*100),'Đang tải dữ liệu')
							
							lds_finger.setitem(li_row,'id',this.f_create_id( ) )
							lds_finger.setitem(li_row,'object_ref_id',ldb_staff_id)
							lds_finger.setitem(li_row,'object_ref_table','OBJECT')
							lds_finger.setitem(li_row,'finger_index', FINGER_INDEX)
							lds_finger.setitem(li_row,'finger_tmpstr',ls_tmpdata)
							lds_finger.setitem(li_row,'company_id',gi_user_comp_id)
							lds_finger.setitem(li_row,'branch_id',gdb_branch)
							lds_finger.setitem( li_row, 'password', ls_pwd)			
							lds_finger.setitem( li_row, 'priviledge', li_Priviledge)	
							lds_finger.setitem( li_row, 'flag', li_flag)	
							lds_finger.setitem( li_row, 'enabled', ls_enabled)	
							lds_finger.setitem( li_row, 'zkfp_version', vs_firmware_ver)
						end if
					end if				
				next				
			LOOP
		else	
			
			FOR ll_row = 1 to vdw_empl_device.rowcount()
				this.of_show_progress( int((ll_row/vdw_empl_device.rowcount())*100),'Đang tải dữ liệu')
				
				ls_EnrollNumber = vdw_empl_device.getitemstring(ll_row , 'staff_acctno')
				ls_cardnumber = vdw_empl_device.getitemstring(ll_row , 'cardnumber')
				ls_pwd = vdw_empl_device.getitemstring(ll_row , 'password')
				li_Priviledge = vdw_empl_device.getitemnumber(ll_row , 'priviledge')
				ls_enabled = vdw_empl_device.getitemstring(ll_row , 'enabled')
				
				ll_EnrollNumber = long(ls_EnrollNumber)
				select staff.object_ref_id into :ldb_staff_id
				from staff 
				where staff.staff_acctno = :ll_EnrollNumber using sqlca;
				
				if ldb_staff_id = 0 then continue
				
				delete FINGERPRINT where object_ref_id = :ldb_staff_id using it_transaction ;		
				
				for FINGER_INDEX = 0 to 9
					if role_zkem.object.GetUserTmpExStr(1, ls_EnrollNumber, FINGER_INDEX,ref li_flag, ref ls_tmpdata, ref ll_TmpLength) then			
						if li_flag > 0 then
							li_row = lds_finger.insertrow(0 )
							lds_finger.setitem(li_row,'id',this.f_create_id( ) )
							lds_finger.setitem(li_row,'object_ref_id',ldb_staff_id)
							lds_finger.setitem(li_row,'object_ref_table','OBJECT')
							lds_finger.setitem(li_row,'finger_index', FINGER_INDEX)
							lds_finger.setitem(li_row,'finger_tmpstr',ls_tmpdata)
							lds_finger.setitem(li_row,'company_id',gi_user_comp_id)
							lds_finger.setitem(li_row,'branch_id',gdb_branch)
							lds_finger.setitem( li_row, 'password', ls_pwd)			
							lds_finger.setitem( li_row, 'priviledge', li_Priviledge)	
							lds_finger.setitem( li_row, 'flag', li_flag)	
							lds_finger.setitem( li_row, 'enabled', ls_enabled)	
						end if
					end if				
				next
			NEXT
		end if
		this.of_show_progress( 101,'Đang tải dữ liệu')
		if lds_finger.update( ) = 1 then
			commit using it_transaction;
			return 1
		else			
			rollback using it_transaction;
			gf_messagebox('m.c_transfer_empl_infor.f_pull_to_db.01','Thông báo','Không cập nhật được vào cơ sỡ dữ liệu@'+ it_transaction.sqlerrtext,'stop','ok',1)
			return -1
		end if
		role_zkem.object.EnableDevice(1, true)
		
	else
		/*
		Do While  role_zkem.object.GetAllUserInfo(1,ref li_EnrollNumber,ref ls_name,ref ls_pwd,ref li_Privilege,ref lb_enable)
			role_zkem.object.GetStrCardNumber(ref ls_cardnumber)
			ls_EnrollNumber = string(li_EnrollNumber)
			for FINGER_INDEX = 0 to 9
				role_zkem.object.GetUserTmpExStr(1, ls_EnrollNumber, FINGER_INDEX,ref li_flag, ref ls_tmpdata, ref ll_TmpLength)
				if ls_tmpdata = '' then
					exit
				else
					li_finger += 1
				end if
			next
			ll_row = ldw_empl_devi.insertrow( ldw_empl_devi.rowcount())
			ldw_empl_devi.setitem( ll_row, 'object_code', ls_EnrollNumber)
			ldw_empl_devi.setitem( ll_row, 'object_name', ls_name)
			ldw_empl_devi.setitem( ll_row, 'staff_acctno', long(ls_EnrollNumber))
			ldw_empl_devi.setitem( ll_row, 'cardnumber', ls_cardnumber)
			ldw_empl_devi.setitem( ll_row, 'finger', li_finger)
			li_finger = 0
		Loop
		*/
	end if
end if
return 1
end function

on c_transfer_empl_infor.create
call super::create
end on

on c_transfer_empl_infor.destroy
call super::destroy
end on

event constructor;call super::constructor;ib_changed_dwo_4edit = false
is_display_model = '3d'
ib_display_text = false
this.ib_keyboardlocked = true
is_object_title = 'Kéo/Đẩy dấu vân tay'
istr_actionpane[1].s_button_name = 'b_push_to_device;b_push_to_software;b_show_userinfo;'
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title
end event

event e_action_ctrl_bttn;datawindow				ldw_focus
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_show_userinfo;b_push_to_software;b_push_to_device;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_show_userinfo;b_push_to_software;b_push_to_device;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_show_userinfo;b_push_to_software;b_push_to_device;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_show_userinfo;b_push_to_software;b_push_to_device;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_show_userinfo;b_push_to_software;b_push_to_device;'
					else
						istr_actionpane[li_idx].s_visible_buttons= 'b_show_userinfo;b_push_to_software;b_push_to_device;'
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

event e_window_open;call super::e_window_open;t_dw_mpl	ldw1
t_transaction	lt_transaction

ldw1 = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
ldw1.event e_retrieve( )
iw_display.f_get_transaction( lt_transaction)
ids_staff_finger = create t_ds_db
ids_staff_finger.dataobject = 'ds_finger_data'
ids_staff_finger.f_settransobject(lt_transaction)
return 0
end event

event destructor;call super::destructor;destroy ids_staff_finger
end event

