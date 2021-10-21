$PBExportHeader$b_timing.sru
forward
global type b_timing from t_timing
end type
end forward

global type b_timing from t_timing
end type
global b_timing b_timing

type variables
datetime idt_start
double	idb_device_id
OLECustomControl		iole_czkem
t_ds_db					ids_device
t_transaction			it_transaction

end variables

forward prototypes
public function integer f_get_attlog ()
end prototypes

public function integer f_get_attlog ();
c_datetime		lc_dt
b_obj_instantiate		lbo_ins

t_ds_db		lds_updatedata,lds_checkdata
datetime		ldt_checktime,ldt_sysdate,ldt_max_date
date			ld_lastdate,ld_max_date
double		ldb_ref_id, ldb_branch_id, ldb_company_id
string			ls_machine_name,ls_ip_address,ls_type,ls_platform,ls_enrolnum,ls_checktime,ls_ref_table, ls_date, ls_time, ls_update,ls_mess
long			ll_find,ll_port,ll_verifymode,ll_inoutmode,ll_year,ll_month,ll_day,ll_hour,ll_minute,ll_second, ll_workCode,ll_rowcount,ll_count,ll_row
long			ll_enrollnum,ll_find1,ll_cnt,ll_data,ll_idx,ll_idx1, ll_commkey
any			laa_data[]



if ids_device.rowcount( ) = 0 then return 0

ldt_sysdate = lc_dt.f_getsysdate( )
ld_lastdate = RelativeDate ( date(ldt_sysdate), 1 )


lds_updatedata = create t_ds_db
lds_checkdata = create t_ds_db

FOR ll_find = 1 to  ids_device.rowcount( )
	
	lds_updatedata.dataobject = 'd_finger_scan_data_grid'
	lds_updatedata.f_settransobject( it_transaction)
	
	ls_machine_name += ids_device.getitemstring( ll_find, 'MACHINE_NAME') +', '
	ls_ip_address = ids_device.getitemstring( ll_find, 'ip_address')
	ls_type = ids_device.getitemstring( ll_find, 'in_out')
	ll_port = ids_device.getitemnumber( ll_find, 'ip_port')
	ll_commkey = ids_device.getitemnumber( ll_find, 'commkey')
	ldb_ref_id = ids_device.getitemnumber( ll_find, 'id')
	ls_ref_table = upper(ids_device.describe("datawindow.table.update"))
	ldb_company_id =ids_device.getitemnumber( ll_find, 'company_id')
	ldb_branch_id =ids_device.getitemnumber( ll_find, 'branch_id')
	
	lds_checkdata.dataobject = 'ds_finger_scan_data_grid'
	lds_checkdata.f_settransobject( it_transaction)
	laa_data[1] = '(' + string(lc_dt.f_add_months( date(ldt_sysdate) , -1)) + ':'+ string(lc_dt.f_add_date( date(ldt_sysdate), 1)) + ')'
	laa_data[2] = ls_ip_address
	lds_checkdata.f_add_where( 'CHECK_TIME;IP_ADDRESS', laa_data)
	ll_rowcount = lds_checkdata.retrieve( )
	if ll_rowcount > 0 then
		ld_max_date = date(lds_checkdata.getitemdatetime( 1, 'check_time'))
		ldt_max_date = lds_checkdata.getitemdatetime( 1, 'check_time')
	else
		ld_max_date = lc_dt.f_add_months( date(ldt_sysdate) , -12)
	end if
	if isnull(ls_ip_address) or ls_ip_address = '' or isnull(ll_port) or ll_port = 0 then continue
	
	if iole_czkem.object.Connect_Net(ls_ip_address, ll_port ) then
		iole_czkem.object.GetDeviceStatus(1,6,ref ll_data)
		////////////////////--//////////////////
		if ll_commkey > 0 then
			iole_czkem.object.SetCommPassword(ll_commkey)
			iole_czkem.object.RefreshData(1)
		end if
		////////////////////--//////////////////
		
		iole_czkem.object.getplatform(1,ref ls_platform) 
		if iole_czkem.object.ReadGeneralLogData(1) then 
			if pos(ls_platform,'TFT') > 0 then //-- máy màn hình màu --//
				Do While iole_czkem.object.ssr_GetGeneralLogData(1, ref ls_enrolnum, ref ll_verifymode, ref ll_inoutmode, ref ll_year, ref ll_month, ref ll_day, ref ll_hour, ref ll_minute, ref ll_second, ref ll_workCode)
//								ls_date = string(ll_day) + '/' + string(ll_month) + '/' + string(ll_year) 
//								ls_time = string(ll_hour) + ':' + string(ll_minute) + ':' + string(ll_second)	

					if lower(left(gs_w_date_format ,1)) = 'd' then
						ldt_checktime = datetime(date(string(ll_day) + '/' + string(ll_month) + '/' + string(ll_year) ), time(string(ll_hour) + ':' + string(ll_minute) + ':' + string(ll_second)	))
					elseif lower(left(gs_w_date_format ,1)) = 'm' then
						ldt_checktime = datetime(date(string(ll_month) + '/' + string(ll_day) + '/' + string(ll_year) ), time(string(ll_hour) + ':' + string(ll_minute) + ':' + string(ll_second)	))
					else
						ldt_checktime = datetime(date(string(ll_year) + '/' + string(ll_month) + '/' + string(ll_day) ), time(string(ll_hour) + ':' + string(ll_minute) + ':' + string(ll_second)	))
					end if

					ls_checktime = string(ldt_checktime)
					ll_enrollnum = long(ls_enrolnum)
//						ll_idx ++
//						if ll_idx <> ll_data then
//							ll_idx1 = mod(ll_idx,500)
//						else
//							ll_idx1 = mod(ll_idx,ll_data)
//						end if
					if ldt_checktime > ldt_max_date then
						ll_cnt ++
						ls_update = ' INSERT INTO FINGER_SCAN_DATA ( ID, OBJECT_REF_ID, ACCTNO, TYPE,IP_ADDRESS,CHECK_TIME ,OBJECT_REF_TABLE, COMPANY_ID,BRANCH_ID,CREATED_BY,CREATED_DATE,LAST_MDF_BY,LAST_MDF_DATE)' +&
										' VALUES ( '+ string(lbo_ins.f_create_id( )) + ', ' + string(ldb_ref_id) + ", "  + string(ll_enrollnum) + ', ' +string(ll_inoutmode) +&
										", '"+ls_ip_address+"', " +"to_date('"+string(ldt_checktime) +"', '"+ gs_w_date_format + " hh24:mi:ss'), '"+ls_ref_table+"' , " + string(ldb_company_id)+ & 
										", " +string(ldb_branch_id)+", "+string(gi_userid )+" , to_date('"+string(ldt_sysdate) +"', '" + gs_w_date_format +" hh24:mi:ss'),"+ &
										string(gi_userid ) + ", to_date('"+string(ldt_sysdate) +"', '"+ gs_w_date_format +" hh24:mi:ss')) " 
						EXECUTE IMMEDIATE :ls_update using it_transaction;
						ll_row = 1
					end if
				Loop
			else
				
				Do While iole_czkem.object.GetGeneralLogDataStr(1, ref ll_enrollnum, ref ll_verifymode, ref ll_inoutmode, ref ls_checktime)
					ldt_checktime = datetime(ls_checktime)
					if ll_rowcount = 0 then
						ll_find1 = 0
					else
						ll_find1 = lds_checkdata.find( "CHECK_TIME = datetime('" + ls_checktime + "') and ACCTNO = "+ ls_enrolnum, 1, ll_rowcount)
					end if
					if ll_find1 = 0 then
						ll_row = lds_updatedata.event e_addrow( )
						lds_updatedata.setitem( ll_row, 'ID', lbo_ins.f_create_id( ) )
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
			ls_mess += ids_device.getitemstring( ll_find, 'MACHINE_NAME') +', '
		end if
		
		iole_czkem.object.disconnect()
	end if
NEXT


//if ll_row > 0 then
//	if lds_updatedata.update( true,false) = 1 then
//		lds_updatedata.resetupdate( )
//		commit using lt_transaction;
//		gf_messagebox('m.c_finger_scan_setup.e_action_get_att.01','Thông báo','Các máy đã tải xong @: '+ls_machine_name + ' Tông số dòng đã tải: '+string(ll_cnt),'exclamation','ok',1)
//	else
//		rollback using lt_transaction;
//	end if
//else
//	gf_messagebox('m.c_finger_scan_setup.e_action_get_att.02','Thông báo', 'Không có dữ liệu mới' ,'exclamation','ok',1)
//end if
//if ls_mess <> '' then gf_messagebox('m.c_finger_scan_setup.e_action_get_att.03','Thông báo','không đọc được bộ nhớ đệm của máy chấm công của máy: ' + ls_mess,'exclamation','ok',1)
destroy lds_updatedata
destroy lds_checkdata

return 1
end function

on b_timing.create
call super::create
end on

on b_timing.destroy
call super::destroy
end on

event timer;call super::timer;

this.f_get_attlog( )
this.stop( )
this.start( 24*60*60)
end event

