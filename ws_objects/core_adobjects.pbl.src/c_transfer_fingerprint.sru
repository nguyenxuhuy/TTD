$PBExportHeader$c_transfer_fingerprint.sru
forward
global type c_transfer_fingerprint from s_object_display
end type
end forward

global type c_transfer_fingerprint from s_object_display
event e_action_show_userinfo ( )
event e_action_push_to_device ( )
event e_action_push_to_software ( )
event e_action_del_data_device ( )
end type
global c_transfer_fingerprint c_transfer_fingerprint

type variables

end variables

forward prototypes
public subroutine f_set_dwo_window ()
end prototypes

event e_action_show_userinfo();boolean		lb_enable
string			ls_ip_add,ls_platform,ls_name,ls_pwd,ls_cardnumber,las_tmpdata[],ls_EnrollNumber,ls_tmpdata
long			ll_ip_port,ll_EnrollNumber,ll_Privilege,ll_TmpLength,ll_find,ll_machinenumber,ll_flag
int				li_fin_idx,li_row,li_finger

OLECustomControl		lo_czkem
t_dw_mpl				ldw_device,ldw_user,ldw_object


ldw_device = iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
ldw_object = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
ldw_user = iw_display.f_get_dw( istr_dwo[3].s_dwo_default)
ls_ip_add = ldw_device.getitemstring( ldw_device.getrow(), 'ip_address')
ll_ip_port = ldw_device.getitemnumber( ldw_device.getrow(), 'ip_port')
lo_czkem = iw_display.dynamic f_get_czkem()
if isnull(ls_ip_add) or ls_ip_add = '' or isnull(ll_ip_port) or ll_ip_port = 0 then
else
	if lo_czkem.object.Connect_Net(ls_ip_add, ll_ip_port ) then
		ldw_user.reset( )
		if  lo_czkem.object.getplatform(1,ref ls_platform) then
			lo_czkem.object.ReadAllUserID(1) 
			lo_czkem.object.ReadAllTemplate(1)
			if pos(ls_platform, 'TFT') > 0 then
				Do While  lo_czkem.object.SSR_GetAllUserInfo(ref ll_machinenumber,ref ls_EnrollNumber,ref ls_name,ref ls_pwd,ref ll_Privilege,ref lb_enable)
					lo_czkem.object.GetStrCardNumber(ref ls_cardnumber)
					ll_EnrollNumber = long(ls_EnrollNumber)
					for li_fin_idx = 0 to 9
						lo_czkem.object.GetUserTmpExStr(1, ls_EnrollNumber, li_fin_idx,ref ll_flag, ref ls_tmpdata, ref ll_TmpLength) // B&W version ZK10.0
						if ls_tmpdata = '' then //không có vân tay or không dang ký hết 10 vân tay
//							li_fin_idx = 10
						else
							li_finger=li_finger+1
							las_tmpdata[li_fin_idx+1] = ls_tmpdata
						end if
					next
					li_row = ldw_user.insertrow( 0)
					ldw_user.setitem( li_row, 'enroll_code', ls_EnrollNumber)
					ldw_user.setitem( li_row, 'name', ls_name)
					ldw_user.setitem( li_row, 'card', ls_cardnumber)
					ldw_user.setitem( li_row, 'fingers', li_finger)
					ldw_user.setitem( li_row, 'privilege', ll_Privilege)
					ldw_user.setitem( li_row, 'enroll_number', ll_EnrollNumber)
					if ls_pwd <> '' then ldw_user.setitem( li_row, 'password_yn', 'Y')
					ldw_user.setitem( li_row, 'pass', ls_pwd)
					ll_find = ldw_object.find( "staff_acctno = " + string(ll_EnrollNumber), 1, ldw_object.rowcount())
					li_finger = 0
					if ll_find = 0 then ldw_user.setitem( li_row, 'gutter', 'Y')
				Loop
			else
				Do While  lo_czkem.object.GetAllUserInfo( ref ll_machinenumber,ref ll_EnrollNumber,ref ls_name,ref ls_pwd,ref ll_Privilege,ref lb_enable)
					lo_czkem.object.GetStrCardNumber(ref ls_cardnumber)
					ls_EnrollNumber = string(ll_EnrollNumber)
					for li_fin_idx = 0 to 9
						lo_czkem.object.GetUserTmpExStr(1, ls_EnrollNumber, li_fin_idx,ref ll_flag, ref ls_tmpdata, ref ll_TmpLength) // B&W version ZK10.0
						if ls_tmpdata = '' then //không có vân tay or không dang ký hết 10 vân tay
//							li_fin_idx = 10
						else
							li_finger=li_finger+1
							las_tmpdata[li_fin_idx+1] = ls_tmpdata
						end if
					next
					li_row = ldw_user.insertrow( 0)
					ldw_user.setitem( li_row, 'enroll_code', ls_EnrollNumber)
					ldw_user.setitem( li_row, 'name', ls_name)
					ldw_user.setitem( li_row, 'card', ls_cardnumber)
					ldw_user.setitem( li_row, 'fingers', li_finger)
					ldw_user.setitem( li_row, 'privilege', ll_Privilege)
					ldw_user.setitem( li_row, 'enroll_number', ll_EnrollNumber)
					if ls_pwd <> '' then ldw_user.setitem( li_row, 'password_yn', 'Y')
					ldw_user.setitem( li_row, 'pass', ls_pwd)
					ll_find = ldw_object.find( "acctno = " + string(ll_EnrollNumber), 1, ldw_object.rowcount())
					li_finger = 0
					if ll_find = 0 then ldw_user.setitem( li_row, 'gutter', 'Y')
				Loop
			end if
		end if
	end if
end if
ldw_user.sort( )
iw_display.event e_refresh( )
end event

event e_action_push_to_device();OLECustomControl		lo_czkem
t_transaction			lt_transaction
t_dw_mpl				ldw_device,ldw_object
t_ds_db					lds_finger
c_string					lc_str

boolean		lb_enable
double		ldb_staff_id
string			ls_ip_add,ls_name,ls_pwd,ls_EnrollNumber,ls_cardnumber,ls_tmpdata,ls_mess,ls_platform
long			ll_ip_port,ll_idx,ll_EnrollNumber,ll_Privilege,ll_flag,ll_find,ll_count,ll_machinenumber,ll_find_m
int				li_fin_idx

iw_display.f_get_transaction( lt_transaction)
ldw_device = iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
ldw_object = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
//ls_ip_add = ldw_device.getitemstring( ldw_device.getrow(), 'ip_address')
//ll_ip_port = ldw_device.getitemnumber( ldw_device.getrow(), 'ip_port')
lo_czkem = iw_display.dynamic f_get_czkem()
lds_finger =  create t_ds_db 
lds_finger.dataobject = 'ds_fingerprint_grid'
lds_finger.f_settransobject(lt_transaction )
ll_machinenumber = 1
ll_flag = 1
ls_pwd = ''
ll_Privilege = 0
lb_enable = true
ll_find_m = ldw_device.find( "gutter = 'Y'", 1, ldw_device.rowcount())
if ll_find_m = 0 then
	ls_ip_add = ldw_device.getitemstring( ldw_device.getrow(), 'ip_address')
	ll_ip_port = ldw_device.getitemnumber( ldw_device.getrow(), 'ip_port')
	if isnull(ls_ip_add) or ls_ip_add = '' or isnull(ll_ip_port) or ll_ip_port = 0 then
		
	else
		if lo_czkem.object.Connect_Net(ls_ip_add, ll_ip_port ) then
			ll_find = ldw_object.find( "gutter = 'Y'", 1, ldw_object.rowcount())
			lds_finger.retrieve( )
			if   lo_czkem.object.getplatform(1,ref ls_platform) then
				 lo_czkem.object.RefreshData(1)
			end if
			Do While ll_find > 0
				ll_EnrollNumber = ldw_object.getitemnumber( ll_find, 'staff_acctno') 
				if not isnull(ll_EnrollNumber) and ll_EnrollNumber > 0 then
					ldb_staff_id = ldw_object.getitemnumber( ll_find, 'staff_id') 
					ls_name = ldw_object.getitemstring( ll_find, 'name')
					ls_name = lc_str.f_convert_name( ls_name)
					ls_pwd = ldw_object.getitemstring( ll_find, 'password_finger')
					if isnull(ls_pwd) then ls_pwd = ''
					ll_Privilege = ldw_object.getitemnumber( ll_find, 'Privilege_finger') 
					ls_EnrollNumber = string(ll_EnrollNumber)
					ls_cardnumber = string(ldw_object.getitemnumber( ll_find, 'cardnumber'))
					if isnull(ls_cardnumber) then ls_cardnumber = ''
					lds_finger.setfilter( "object_ref_id = " + string(ldb_staff_id))
					lds_finger.filter( )
					lo_czkem.object.SetStrCardNumber(ls_cardnumber)
					lo_czkem.object.BeginBatchUpdate(1, ll_flag)
					if pos(ls_platform, 'TFT') > 0 then
						if lo_czkem.object.SSR_SetUserInfo(1,ls_EnrollNumber,ls_name,ls_pwd,ll_Privilege,lb_enable) then
							for ll_idx = 1 to lds_finger.rowcount( )
								li_fin_idx = lds_finger.getitemnumber( ll_idx, 'finger_index')
								li_fin_idx = li_fin_idx - 1
								ls_tmpdata = lds_finger.getitemstring( ll_idx, 'finger_tmpstr')
								if lo_czkem.object.SetUserTmpExStr(1,ls_EnrollNumber, li_fin_idx,ll_flag,ls_tmpdata) = false then
									ls_mess += ls_name +', '
								end if
							next
							ll_count += 1
						end if
					else
						if lo_czkem.object.SetUserInfo(1,ll_EnrollNumber,ls_name,ls_pwd,ll_Privilege,lb_enable) then
							for ll_idx = 1 to lds_finger.rowcount( )
								li_fin_idx = lds_finger.getitemnumber( ll_idx, 'finger_index')
								li_fin_idx = li_fin_idx - 1
								ls_tmpdata = lds_finger.getitemstring( ll_idx, 'finger_tmpstr')
								if lo_czkem.object.SetUserTmpExStr(1,ls_EnrollNumber, li_fin_idx,ll_flag,ls_tmpdata) = false then
									ls_mess += ls_name +', '
								end if
							next
							ll_count += 1
						end if
					end if
					lo_czkem.object.BatchUpdate(1)
				end if
				ll_find = ldw_object.find( "gutter = 'Y'", ll_find + 1, ldw_object.rowcount() + 1)	
				ls_pwd = ''
				ll_Privilege = 0
			Loop
			lo_czkem.object.disconnect()
			gf_messagebox('m.c_transfer_fingerprint.e_action_push_to_device.01','Thông báo','~t Đã nạp xong ~t~t Tổng số đối tượng đã nạp: '+string(ll_count),'exclamation','ok',1)
			if ls_mess <> '' then
				gf_messagebox('m.c_transfer_fingerprint.e_action_push_to_device.02','Thông báo','Các đối tượng '+ls_mess+' không đưa được vân tay vào máy. Có thể do trùng dấu vân tay nhưng khác mã vân tay '+string(ll_count),'exclamation','ok',1)
			end if
		end if
		this.event e_action_show_userinfo( )
	end if
else
	Do While ll_find_m > 0 
		ls_ip_add = ldw_device.getitemstring( ll_find_m, 'ip_address')
		ll_ip_port = ldw_device.getitemnumber( ll_find_m, 'ip_port')
		if isnull(ls_ip_add) or ls_ip_add = '' or isnull(ll_ip_port) or ll_ip_port = 0 then
		
		else
			if lo_czkem.object.Connect_Net(ls_ip_add, ll_ip_port ) then
				ll_find = ldw_object.find( "gutter = 'Y'", 1, ldw_object.rowcount())
				lds_finger.retrieve( )
				if   lo_czkem.object.getplatform(1,ref ls_platform) then
					 lo_czkem.object.RefreshData(1)
				end if
				Do While ll_find > 0
					ll_EnrollNumber = ldw_object.getitemnumber( ll_find, 'staff_acctno') 
					if not isnull(ll_EnrollNumber) and ll_EnrollNumber > 0 then
						ldb_staff_id = ldw_object.getitemnumber( ll_find, 'staff_id') 
						ls_name = ldw_object.getitemstring( ll_find, 'name')
						ls_name = lc_str.f_convert_name( ls_name)
						ls_pwd = ldw_object.getitemstring( ll_find, 'password_finger')
						if isnull(ls_pwd) then ls_pwd = ''
						ll_Privilege = ldw_object.getitemnumber( ll_find, 'Privilege_finger') 
						ls_EnrollNumber = string(ll_EnrollNumber)
						ls_cardnumber = string(ldw_object.getitemnumber( ll_find, 'cardnumber'))
						if isnull(ls_cardnumber) then ls_cardnumber = ''
						lds_finger.setfilter( "object_ref_id = " + string(ldb_staff_id))
						lds_finger.filter( )
						lo_czkem.object.SetStrCardNumber(ls_cardnumber)
						lo_czkem.object.BeginBatchUpdate(1, ll_flag)
						if pos(ls_platform, 'TFT') > 0 then
							if lo_czkem.object.SSR_SetUserInfo(1,ls_EnrollNumber,ls_name,ls_pwd,ll_Privilege,lb_enable) then
								for ll_idx = 1 to lds_finger.rowcount( )
									li_fin_idx = lds_finger.getitemnumber( ll_idx, 'finger_index')
									li_fin_idx = li_fin_idx - 1
									ls_tmpdata = lds_finger.getitemstring( ll_idx, 'finger_tmpstr')
									if lo_czkem.object.SetUserTmpExStr(1,ls_EnrollNumber, li_fin_idx,ll_flag,ls_tmpdata) = false then
										ls_mess += ls_name +', '
									end if
								next
								ll_count += 1
							end if
						else
							if lo_czkem.object.SetUserInfo(1,ll_EnrollNumber,ls_name,ls_pwd,ll_Privilege,lb_enable) then
								for ll_idx = 1 to lds_finger.rowcount( )
									li_fin_idx = lds_finger.getitemnumber( ll_idx, 'finger_index')
									li_fin_idx = li_fin_idx - 1
									ls_tmpdata = lds_finger.getitemstring( ll_idx, 'finger_tmpstr')
									if lo_czkem.object.SetUserTmpExStr(1,ls_EnrollNumber, li_fin_idx,ll_flag,ls_tmpdata) = false then
										ls_mess += ls_name +', '
									end if
								next
								ll_count += 1
							end if
						end if
						lo_czkem.object.BatchUpdate(1)
					end if
					ll_find = ldw_object.find( "gutter = 'Y'", ll_find + 1, ldw_object.rowcount() + 1)	
					ls_pwd = ''
					ll_Privilege = 0
				Loop
			end if	
		end if
		lo_czkem.object.disconnect()
		ll_find_m = ldw_device.find( "gutter = 'Y'",ll_find_m + 1, ldw_device.rowcount() + 1)
	Loop
	gf_messagebox('m.c_transfer_fingerprint.e_action_push_to_device.01','Thông báo','~t Đã nạp xong ~t~t Tổng số đối tượng đã nạp: '+string(ll_count),'exclamation','ok',1)
	if ls_mess <> '' then
		gf_messagebox('m.c_transfer_fingerprint.e_action_push_to_device.02','Thông báo','Các đối tượng '+ls_mess+' không đưa được vân tay vào máy. Có thể do trùng dấu vân tay nhưng khác mã vân tay '+string(ll_count),'exclamation','ok',1)
	end if
	this.event e_action_show_userinfo( )
end if
end event

event e_action_push_to_software();OLECustomControl		lo_czkem
c_unit_instance			lc_unit
t_transaction			lt_transaction
t_dw_mpl				ldw_device,ldw_user,ldw_object
c_string					lc_str
t_ds_db					lds_staff_temp,lds_object,lds_finger,lds_staff_info_up

boolean		lb_enable,lb_update_obj
double		ldb_master_id,ldb_cur_id,ldb_staff_id
string			ls_ip_add,ls_object_ref_table,ls_cur_code,ls_cur_name,ls_gutter,ls_name,ls_pwd,ls_EnrollNumber,ls_cardnumber,ls_tmpdata,las_tmpdata[]
long			ll_ip_port,ll_idx,ll_row,ll_machinenumber,ll_EnrollNumber,ll_Privilege,ll_flag,ll_TmpLength,ll_find
any			laa_data[]
int				li_fin_idx

iw_display.f_get_transaction( lt_transaction)
ldw_device = iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
ldw_object = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
ldw_user = iw_display.f_get_dw( istr_dwo[3].s_dwo_default)
ls_ip_add = ldw_device.getitemstring( ldw_device.getrow(), 'ip_address')
ll_ip_port = ldw_device.getitemnumber( ldw_device.getrow(), 'ip_port')
lo_czkem = iw_display.dynamic f_get_czkem()
lds_object = create t_ds_db
lds_staff_temp = create t_ds_db
lds_finger =  create t_ds_db 
lds_staff_info_up = create t_ds_db
lds_object.dataobject = 'd_objects_grid'
lds_staff_temp.dataobject = 'ds_staff_temp'
lds_finger.dataobject = 'ds_fingerprint_grid'
lds_staff_info_up.dataobject = 'd_staff_form'
lds_object.f_settransobject(lt_transaction )
lds_staff_temp.f_settransobject(lt_transaction )
lds_finger.f_settransobject(lt_transaction )
lds_staff_info_up.f_settransobject(lt_transaction )
lc_unit.f_get_base_cur( ldb_cur_id,ls_cur_code,ls_cur_name)
if isnull(ls_ip_add) or ls_ip_add = '' or isnull(ll_ip_port) or ll_ip_port = 0 then
else
	if lo_czkem.object.Connect_Net(ls_ip_add, ll_ip_port ) then
		lo_czkem.object.ReadAllUserID(1) 
		lo_czkem.object.ReadAllTemplate(1)
		laa_data[1] = '> 0'
		lds_staff_info_up.f_add_where( 'staff_acctno',laa_data[])
		lds_staff_info_up.retrieve( )
		for ll_idx = 1 to ldw_user.rowcount( )
			ls_gutter = ldw_user.getitemstring( ll_idx, 'gutter')
			if isnull(ls_gutter) or ls_gutter = 'N' then continue
			ll_enrollnumber = ldw_user.getitemnumber( ll_idx, 'enroll_number')
			ls_pwd = ldw_user.getitemstring( ll_idx, 'pass')
			ll_Privilege = ldw_user.getitemnumber( ll_idx, 'privilege')
			ls_cardnumber = ldw_user.getitemstring( ll_idx, 'card')
			ll_find = ldw_object.find( "STAFF_ACCTNO = "+ string(ll_enrollnumber), 1, ldw_object.rowcount( ) )
			if ll_find = 0 then
				//-- thêm mới bảng tạm khi đối tượng chưa có --//
				ll_row = lds_staff_temp.event e_insertrow( 0)
				ldb_master_id = this.f_create_id( )
				lds_staff_temp.setitem( ll_row, 'id', ldb_master_id)
				lds_staff_temp.setitem( ll_row, 'STAFF_ACCTNO', ll_enrollnumber)
				lds_staff_temp.setitem( ll_row, 'ENROLL_CODE', string(ll_enrollnumber))
				lds_staff_temp.setitem( ll_row, 'ENROLL_NAME', string(ll_enrollnumber))
				lds_staff_temp.setitem( ll_row, 'CARDNUMBER', double(ls_cardnumber))
				lds_staff_temp.setitem( ll_row, 'PASSWORD_FINGER', ls_pwd)
				lds_staff_temp.setitem( ll_row, 'PRIVILEGE_FINGER', ll_Privilege)
				ls_object_ref_table = upper(lds_staff_temp.describe( "datawindow.table.update"))
				ls_object_ref_table = lc_str.f_globalreplace( ls_object_ref_table, '~~', '')
				ldb_staff_id = ldb_master_id
				ls_EnrollNumber = string(ll_enrollnumber)
				for li_fin_idx = 0 to 9
					lo_czkem.object.GetUserTmpExStr(1, ls_EnrollNumber, li_fin_idx,ref ll_flag, ref ls_tmpdata, ref ll_TmpLength) // B&W version ZK10.0
					if ls_tmpdata = '' then //không có vân tay or không dang ký hết 10 vân tay
					else
						ll_row = lds_finger.event e_insertrow( 0)
						lds_finger.setitem( ll_row, 'object_ref_id', ldb_staff_id)
						lds_finger.setitem( ll_row, 'object_ref_table', ls_object_ref_table)
						ldb_master_id = this.f_create_id( )
						lds_finger.setitem( ll_row, 'id', ldb_master_id)
						lds_finger.setitem( ll_row, 'FINGER_INDEX', li_fin_idx+1)
						lds_finger.setitem( ll_row, 'FINGER_TMPSTR', ls_tmpdata)
					end if
				next
			else
				//-- update lại vân tay và thẻ cho đối tượng đã có --//
				lb_update_obj = true
				ldb_staff_id = ldw_object.getitemnumber( ll_find, 'STAFF_ID')
				ls_object_ref_table = upper(lds_staff_info_up.describe( "datawindow.table.update"))
				ls_object_ref_table = lc_str.f_globalreplace( ls_object_ref_table, '~~', '')
				delete FINGERPRINT
				where object_ref_id = :ldb_staff_id using lt_transaction;
				ls_EnrollNumber = string(ll_EnrollNumber)
				ll_find = lds_staff_info_up.find( "ID = "+string(ldb_staff_id), 1, lds_staff_info_up.rowcount( ) )
				if ll_find > 0 then
					lds_staff_info_up.setitem( ll_find, 'cardnumber', double(ls_cardnumber))
					lds_staff_info_up.setitem( ll_find, 'password_finger', ls_pwd)
					lds_staff_info_up.setitem( ll_find, 'Privilege_finger', ll_Privilege)
				end if
				for li_fin_idx = 0 to 9
					lo_czkem.object.GetUserTmpExStr(1, ls_EnrollNumber, li_fin_idx,ref ll_flag, ref ls_tmpdata, ref ll_TmpLength) // B&W version ZK10.0
					if ls_tmpdata = '' then //không có vân tay or không dang ký hết 10 vân tay
					else
						ll_row = lds_finger.event e_insertrow( 0)
						lds_finger.setitem( ll_row, 'object_ref_id', ldb_staff_id)
						lds_finger.setitem( ll_row, 'object_ref_table', ls_object_ref_table)
						ldb_master_id = this.f_create_id( )
						lds_finger.setitem( ll_row, 'id', ldb_master_id)
						lds_finger.setitem( ll_row, 'FINGER_INDEX', li_fin_idx+1)
						lds_finger.setitem( ll_row, 'FINGER_TMPSTR', ls_tmpdata)
					end if
				next
			end if
		next
	end if
end if
if lds_object.update( true,false) = 1 then
	if lds_staff_temp.update( true,false) = 1 then
		if lb_update_obj then 
			if ldw_object.update( true,false) = 1 then
				ldw_object.resetupdate( )
			else
				lds_object.resetupdate( )
				lds_staff_temp.resetupdate( )
				rollback using lt_transaction;
				return
			end if
		end if
		if lds_staff_info_up.update( true,false) <> 1 then
			lds_object.resetupdate( )
			lds_staff_temp.resetupdate( )
			rollback using lt_transaction;
			return
		end if
		if lds_finger.update( true,false) = 1 then
			lds_object.resetupdate( )
			lds_staff_temp.resetupdate( )
			lds_finger.resetupdate( )
			lds_staff_info_up.resetupdate( )
			gf_messagebox('m.c_transfer_fingerprint.e_action_pus_to_software.01','Thông báo','Tải về phần mềm thành công','exclamation','ok',1)
			commit using lt_transaction;
		else
			lds_object.resetupdate( )
			lds_staff_temp.resetupdate( )
			rollback using lt_transaction;
		end if
	else
		lds_object.resetupdate( )
		rollback using lt_transaction;
	end if
else
	rollback using lt_transaction;
end if
destroy lds_object
destroy lds_staff_temp
destroy lds_finger
iw_display.event e_refresh( )
end event

event e_action_del_data_device();OLECustomControl		lo_czkem
t_transaction			lt_transaction
t_dw_mpl				ldw_device,ldw_user
t_ds_db					lds_finger

boolean		lb_enable
double		ldb_cus_id
string			ls_ip_add,ls_name,ls_pwd,ls_EnrollNumber,ls_cardnumber,ls_tmpdata,ls_platform
long			ll_ip_port,ll_idx,ll_EnrollNumber,ll_Privilege,ll_flag,ll_find,ll_count
int				li_fin_idx

iw_display.f_get_transaction( lt_transaction)
ldw_device = iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
ldw_user = iw_display.f_get_dw( istr_dwo[3].s_dwo_default)
ls_ip_add = ldw_device.getitemstring( ldw_device.getrow(), 'ip_address')
ll_ip_port = ldw_device.getitemnumber( ldw_device.getrow(), 'ip_port')
lo_czkem = iw_display.dynamic f_get_czkem()
if isnull(ls_ip_add) or ls_ip_add = '' or isnull(ll_ip_port) or ll_ip_port = 0 then
	
else
	if lo_czkem.object.Connect_Net(ls_ip_add, ll_ip_port ) then
		ll_find = ldw_user.find( "gutter = 'Y'", 1, ldw_user.rowcount( ) )
		if ll_find > 0 then
			if gf_messagebox('m.c_transger_fingerprint.e_action_del_data_device.01','Thông báo','Bạn có chắc chắn xóa người dùng trên máy chấm vân tay?','question','yesno',2) = 1 then
				if  lo_czkem.object.getplatform(1,ref ls_platform) then
					if pos(ls_platform, 'TFT') > 0 then
						Do While ll_find > 0
							ll_EnrollNumber = ldw_user.getitemnumber( ll_find, 'enroll_number')
							ls_EnrollNumber = string(ll_EnrollNumber)
							if not isnull(ll_EnrollNumber) and ll_EnrollNumber > 0 then
//								lo_czkem.object.ssr_DeleteEnrollData(1, ll_EnrollNumber, 1, 12)
								lo_czkem.object.SSR_DeleteEnrollDataExt(1 , ls_EnrollNumber, 12)
								ll_count += 1
							end if
							ll_find = ldw_user.find( "gutter = 'Y'", ll_find + 1, ldw_user.rowcount( ) +1 )
						Loop
					else
						Do While ll_find > 0
							ll_EnrollNumber = ldw_user.getitemnumber( ll_find, 'enroll_number')
							if not isnull(ll_EnrollNumber) and ll_EnrollNumber > 0 then
								lo_czkem.object.DeleteEnrollData(1, ll_EnrollNumber, 1, 12)
								ll_count += 1
							end if
							ll_find = ldw_user.find( "gutter = 'Y'", ll_find + 1, ldw_user.rowcount( ) +1 )
						Loop
					end if
				end if
			end if
		end if
	end if
	lo_czkem.object.disconnect()
	gf_messagebox('m.c_transfer_fingerprint.e_action_del_data_device.02','Thông báo','~t Đã xóa xong ~t~t Tổng số nhân viên đã xóa: '+string(ll_count),'exclamation','ok',1)
	this.event e_action_show_userinfo( )
end if
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

istr_dwo[2].s_dwo_default =  'd_staff_finger_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_staff_finger_grid'
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
istr_dwo[2].s_description = 'Thông tin đối tượng'
istr_dwo[2].s_popmenu_items = 'm_filter_detail'

istr_dwo[3].s_dwo_default =  'd_userinfo_device_grid'
istr_dwo[3].s_dwo_form = ''
istr_dwo[3].s_dwo_grid = 'd_userinfo_device_grid'
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
istr_dwo[3].s_description = 'Thông tin user máy vân tay'
end subroutine

on c_transfer_fingerprint.create
call super::create
end on

on c_transfer_fingerprint.destroy
call super::destroy
end on

event constructor;call super::constructor;
ib_changed_dwo_4edit = false
this.ib_keyboardlocked = true
is_display_model = '1d_2d'
is_object_title = 'Chuyển dấu vân tay'
istr_actionpane[1].s_button_name = 'b_add;b_insert;b_modify;b_save;b_query;b_execquery;b_filteron;b_show_userinfo;b_push_to_device;b_push_to_software;b_del_data_device;b_refresh;b_delete;'
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title


end event

event e_action_ctrl_bttn;call super::e_action_ctrl_bttn;//-- override --//

datawindow				ldw_focus
int								li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	//-- control d_action_edit --//
	FOR li_idx = 1 to upperbound(istr_actionpane[]) 
		if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
			if ldw_focus.dynamic f_get_ib_shared() then
				ldw_focus = ldw_focus.dynamic f_getdwmaster()
			end if			
			if ldw_focus.dynamic f_get_ib_detail() then
				if ib_changed_dwo_4edit then
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify; b_filteron;b_query;b_show_userinfo;b_push_to_device;b_push_to_software;b_del_data_device;b_refresh;b_delete;b_blank;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_filteron;b_query;b_show_userinfo;b_push_to_device;b_push_to_software;b_del_data_device;b_refresh;b_delete;b_blank;'
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query;b_show_userinfo;b_push_to_device;b_push_to_software;b_del_data_device; b_refresh;b_delete;b_blank;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query;b_show_userinfo;b_push_to_device;b_push_to_software;b_del_data_device; b_refresh;b_delete;b_blank;'
					end if
				end if
			else				
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_show_userinfo;b_push_to_device;b_push_to_software;b_del_data_device;b_refresh;b_delete;b_blank;'
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_show_userinfo;b_push_to_device;b_push_to_software;b_del_data_device;b_refresh;b_delete;b_blank;'
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
			
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
			
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then		
			
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;//-- resize parm --//

iw_display.dynamic f_set_ii_upperpart_height(1200)
return 0
end event

event e_window_e_postopen;call super::e_window_e_postopen;t_dw_mpl		ldw_info

ldw_info = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
if ldw_info.rowcount( ) = 0 then
	ldw_info.event e_retrieve( )
end if
ldw_info = iw_display.f_get_dw( istr_dwo[3].s_dwo_default)
if ldw_info.rowcount( ) = 0 then
	ldw_info.insertrow( 0)
end if
return 0
end event

event e_window_e_refresh;call super::e_window_e_refresh;t_dw_mpl	ldw_info

ldw_info = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
ldw_info.event e_retrieve( )
return 0
end event

