$PBExportHeader$b_hr_instantiate.sru
forward
global type b_hr_instantiate from b_obj_instantiate
end type
end forward

global type b_hr_instantiate from b_obj_instantiate
end type

type variables
w_xls_service_progress iw_progress
end variables

forward prototypes
public function integer f_calc_timesheet_1 (date vd_fdate, date vd_tdate, string vs_staff_code, string vs_dept_code, ref t_transaction rt_transaction)
public function integer f_get_paid_workingtime (double vdb_staff_id, t_ds_db vds_time_sheet, ref c_str_paid_workingtime rstr_workingtime)
public function double f_get_base_workingtime (double vdb_staff_id, t_ds_db vds_payroll, date vd_fdate, date vd_tdate)
public function integer f_calc_payroll (date vd_fdate, date vd_tdate, ref t_transaction rt_transaction, ref t_dw_mpl rdw_salary_line)
public function double f_insert_salary_line (double vdb_staff_id, t_ds_db vds_payroll, t_ds_db vds_insurance, t_ds_db vds_sal_advance, c_str_paid_workingtime vstr_timesheet, double vdb_base_day, ref t_dw_mpl rdw_salary_line)
public function integer f_get_workinghour_per_day (double vdb_shift_id)
public function integer f_calc_timesheet (date vd_fdate, date vd_tdate, string vs_staff_code, string vs_dept_code, ref t_transaction rt_transaction)
public function integer f_get_daywork (integer vi_latecome_tolerance_min, integer vi_earlyleave_tolerance_min, integer vi_hour_per_day, ref double rdb_work_hour, ref double rdb_work_count)
public function integer f_get_shift_time (string vs_staff_code, date vd_trans_date, ref t_ds_db rds_shfit_time, ref datetime rdt_f_time, ref datetime rdt_t_time, ref integer ri_latecome_tolerance_min, ref integer ri_earlyleave_tolerance_min, ref integer ri_hour_per_day, ref integer ri_shift_coefficient, ref integer ri_checkout_early_min, ref integer ri_checkout_late_min, ref integer ri_checkin_early_min, ref integer ri_checkin_late_min)
public function integer of_show_progress (integer ai_progress)
public function integer f_insert_timesheet (ref t_ds_db rds_timesheet, double vdb_staff_id, date vd_workdate, double vdb_shift_id, integer vi_late_minute, integer vi_early_minute, double vdb_shift_coefficient, datetime vdt_shift_in, datetime vdt_shift_out, datetime vdt_chkin_time, datetime vdt_chkout_time, double vdb_work_hour, double vdb_work_count, double vdb_ot_hour, double vdb_ot_coefficient, string vs_note)
public function integer f_calc_timesheet_gopak (t_ds_db vds_staff, date vd_fdate, date vd_tdate, ref t_transaction rt_transaction)
public function integer of_set_progress_text (string vs_text)
public function integer f_calc_timesheet_aia (double vdb_dept_id, date vd_fdate, date vd_tdate, ref t_transaction rt_transaction)
public function string f_get_staff_name (long vl_acctno)
public function integer f_get_staff_code_n_name (long vl_acctno, ref string rs_code, ref string rs_name)
public function integer f_calc_timesheet_tm (double vdb_dept_id, double vdb_staff_id, date vd_fdate, date vd_tdate, ref t_transaction rt_transaction)
end prototypes

public function integer f_calc_timesheet_1 (date vd_fdate, date vd_tdate, string vs_staff_code, string vs_dept_code, ref t_transaction rt_transaction);int					li_cnt, li_row, li_row_found, li_ts_row, li_late_minute, li_latecome_tolerance_min, li_nbr_of_chk_att
datetime			ldt_chk_time, ldt_shift_in, ldt_shift_out, ldt_chk_time_next
date				ld_workdate, ld_workdate_tmp
string				ls_where, ls_chk_time, ls_staff_code, ls_staff_code_tmp,ls_findStr, ls_shift_code
double			ldb_staff_id, ldb_staff_id_tmp, ldb_shift_tmp, ldb_shift, ldb_hour_per_day
boolean			lb_skipped_row

t_ds_db			lds_shift, lds_data, lds_timesheet
c_datetime		lc_datetime

//-- Xóa dữ liệu tính công cũ --//

DELETE timesheet_line WHERE work_Date BETWEEN :vd_fdate AND :vd_tdate AND nvl(manual_yn,'N') = 'N' using rt_transaction;

//-- lấy dữ liệu tính công manual --//
lds_timesheet = create t_ds_db 
lds_timesheet.dataobject = 'd_timesheet_grid'
ls_where = "  to_char(work_Date,~~'yyyymmdd~~') BETWEEN ~~'" + string(vd_fdate,'yyyymmdd') + "~~' AND ~~'" + string(vd_tdate,'yyyymmdd') + "~~'"
lds_timesheet.f_add_where( ls_where, " AND ")
lds_timesheet.f_settransobject( rt_transaction)
li_cnt = lds_timesheet.retrieve( )

//-- lấy dữ liệu ca --//
lds_shift = create t_ds_db 
lds_shift.dataobject = 'ds_shift'
lds_shift.f_settransobject( rt_transaction)
li_cnt = lds_shift.retrieve( )

//-- lấy dữ liệu chấm công --//
lds_data = create t_ds_db 
lds_data.dataobject = 'd_finger_scan_data_grid'
ls_where = "  to_char(check_time,~~'yyyymmdd~~') BETWEEN ~~'" + string(vd_fdate,'yyyymmdd') + "~~' AND ~~'" + string(vd_tdate,'yyyymmdd') + "~~'"
if not isnull(vs_staff_code) and vs_staff_code <> '' then
	ls_where += " AND code = ~~'" + vs_staff_code +"~~'"
end if
lds_data.f_add_where( ls_where, " AND ")
lds_data.setsort( " ACCTNO asc, check_time asc")
lds_data.f_settransobject( rt_transaction)
li_cnt = lds_data.retrieve( )

li_row = 1
DO while li_row <= li_cnt //-- sửa thành DO While ngay mai
//	if lb_skipped_row then 
//		lb_skipped_row = false
//		continue //-- ca quy định chấm công 2 lần--//
//	end if
	ls_staff_code = lds_data.getitemstring( li_row, 'code')
	ldb_staff_id_tmp =  lds_data.getitemnumber( li_row, 'object_id')
	ldt_chk_time = lds_data.getitemdatetime( li_row, 'check_time')
	ld_workdate_tmp = date(ldt_chk_time)
	ls_chk_time = string(time(ldt_chk_time),'hhmmss')
	li_row_found = lds_shift.find( "'" + ls_chk_time + "' BETWEEN chkin_from AND chkin_to ", 1, lds_shift.rowcount() )
	IF li_row_found > 0 then
		li_latecome_tolerance_min =  lds_shift.getitemnumber( li_row_found,'latecome_tolerance_min')		
		if isnull(li_latecome_tolerance_min) then li_latecome_tolerance_min = 0
		ldb_shift_tmp = lds_shift.getitemnumber( li_row_found,'hdr_id')
		li_nbr_of_chk_att =  lds_shift.getitemnumber( li_row_found,'nbr_of_chk_att')
		ldb_hour_per_day = lds_shift.getitemnumber( li_row_found,'hour_per_day')
		if isnull(li_nbr_of_chk_att) or li_nbr_of_chk_att = 0 then			
			ls_shift_code =  lds_shift.getitemstring( li_row_found,'shift_code')
			gf_messagebox('m.b_hr_timesheet.01','Thông báo','Ca sau chưa cài đặt số lần chấm công:@ '+ls_shift_code,'stop','ok',1)
			rollback using rt_transaction;
			return -1
		end if
		
		if ldb_staff_id_tmp = ldb_staff_id and ld_workdate_tmp = ld_workdate and ldb_shift_tmp = ldb_shift then
			li_row++
			continue //-- bỏ các lần chấm công sau mà có cùng ca --//
		else
			ldb_staff_id = ldb_staff_id_tmp
			ld_workdate = ld_workdate_tmp
			ldb_shift = ldb_shift_tmp
			//-- tìm work_date cò manual ko --//
			ls_findStr = " staff_id = "+ string(ldb_staff_id) + " AND  string(work_date,'yyyymmdd') = '"+ string(ld_workdate,'yyyymmdd')+"' AND shift_id = "+string(ldb_shift)
			li_ts_row = lds_timesheet.find(ls_findStr, 1, lds_timesheet.rowcount( ) )
			if li_ts_row = 0 then
				ldt_shift_in =  lds_shift.getitemdatetime( li_row_found,'F_TIME')				
				ldt_shift_in = datetime(ld_workdate, time(ldt_shift_in))
				ldt_shift_out =  lds_shift.getitemdatetime( li_row_found,'T_TIME')
				ldt_shift_out = datetime(ld_workdate, time(ldt_shift_out))				
				li_late_minute = lc_datetime.f_minuteafter( ldt_shift_in, ldt_chk_time)
				if li_latecome_tolerance_min >= li_late_minute then li_late_minute = 0	
				
				li_ts_row = lds_timesheet.event e_addrow( )
				lds_timesheet.setitem( li_ts_row, 'ID', this.f_create_id( )  )
				lds_timesheet.setitem( li_ts_row, 'staff_id', ldb_staff_id)
				lds_timesheet.setitem( li_ts_row, 'work_date', ld_workdate )
				lds_timesheet.setitem( li_ts_row, 'shift_id', ldb_shift )				
				lds_timesheet.setitem( li_ts_row, 'IN_LATE_MINUTE', li_late_minute)				
				lds_timesheet.setitem( li_ts_row, 'SHIFT_COEFFICIENT', lds_shift.getitemnumber( li_row_found,'SHIFT_COEFFICIENT') )
				lds_timesheet.setitem( li_ts_row, 'SHIFT_IN_TIME', ldt_shift_in)
				lds_timesheet.setitem( li_ts_row, 'CHECKIN_TIME', ldt_chk_time)
				if li_nbr_of_chk_att = 1 then
					
					lds_timesheet.setitem( li_ts_row, 'SHIFT_OUT_TIME', ldt_shift_out )										
					lds_timesheet.setitem( li_ts_row, 'WORK_HOUR',  lds_shift.getitemnumber( li_row_found,'WORKING_HOURS') )
					lds_timesheet.setitem( li_ts_row, 'WORK_COUNT', lds_shift.getitemnumber( li_row_found,'WORKING_COUNT')  )
					
				elseif li_nbr_of_chk_att = 2 then //-- chấm công 2 lần  --//
					ldt_shift_out =  lds_shift.getitemdatetime( li_row_found,'T_TIME')
					
					if isnull(ldt_shift_out) or string(ldt_shift_out,'yyyymmdd') = '19000101' then //-- lần chấm công sau không cố định trước--//
						if li_row < lds_data.rowcount( ) then
							li_row++
							ls_staff_code = lds_data.getitemstring( li_row  , 'code')
							ldb_staff_id_tmp =  lds_data.getitemnumber( li_row , 'object_id')
							ldt_chk_time_next = lds_data.getitemdatetime( li_row, 'check_time')
							ld_workdate_tmp = date(ldt_chk_time_next)
							
							Do while  lc_datetime.f_minuteafter( ldt_chk_time, ldt_chk_time_next) < 10 and ldb_staff_id = ldb_staff_id_tmp  and  ld_workdate = ld_workdate_tmp
								li_row++
								ls_staff_code = lds_data.getitemstring( li_row  , 'code')
								ldb_staff_id_tmp =  lds_data.getitemnumber( li_row , 'object_id')
								ldt_chk_time_next = lds_data.getitemdatetime( li_row, 'check_time')
								ld_workdate_tmp = date(ldt_chk_time_next)									
								ldt_chk_time_next = lds_data.getitemdatetime( li_row, 'check_time')
							LOOP
							
							if ldb_staff_id = ldb_staff_id_tmp and ld_workdate = ld_workdate_tmp and ldb_shift = ldb_shift_tmp	 then
								lds_timesheet.setitem( li_ts_row, 'SHIFT_OUT_TIME', ldt_chk_time_next )							
								lds_timesheet.setitem( li_ts_row, 'WORK_HOUR',  round(lc_datetime.f_hourafter( ldt_shift_in, ldt_chk_time_next),3) )
								lds_timesheet.setitem( li_ts_row, 'WORK_COUNT', round(lc_datetime.f_hourafter( ldt_shift_in, ldt_chk_time_next) / ldb_hour_per_day,3) )		
								li_row++
								continue
							else
								lds_timesheet.setitem( li_ts_row, 'NOTE', 'Không chấm công ra về' )						
								continue							
							end if
						end if
					end if
				end if
			else
				li_row++
				continue //-- bỏ các lần chấm công mà đã có thông tin chấm công nhập tay --//
			end if
		end if
		//--
	else

		ldb_staff_id = ldb_staff_id_tmp
		ld_workdate = ld_workdate_tmp
		ldb_shift = 0
		
		li_ts_row = lds_timesheet.event e_addrow( )
		lds_timesheet.setitem( li_ts_row, 'ID', this.f_create_id( )  )
		lds_timesheet.setitem( li_ts_row, 'staff_id', ldb_staff_id)
		lds_timesheet.setitem( li_ts_row, 'work_date', ld_workdate )	
		lds_timesheet.setitem( li_ts_row, 'CHECKIN_TIME', ldt_chk_time)
		lds_timesheet.setitem( li_ts_row, 'NOTE', 'Chấm công không đúng quy định' )

	end if
	li_row++
Loop 

if lds_timesheet.update( true, false) = 1 then
	commit using rt_transaction;
else
	rollback using rt_transaction;
	gf_messagebox('m.b_hr_timesheet.02','Thông báo','Không cập nhật được dữ liệu:v@'+rt_transaction.sqlerrtext,'stop','ok',1)
	return -1
end if
return 1
end function

public function integer f_get_paid_workingtime (double vdb_staff_id, t_ds_db vds_time_sheet, ref c_str_paid_workingtime rstr_workingtime);int					li_row, li_late_min
double			ldb_work_hour, ldb_work_count,ldb_ot_rate,  ldba_ot_rate[], ldb_offtype_id

vds_time_sheet.setfilter(" staff_id = " + string(vdb_staff_id) )
vds_time_sheet.filter()
FOR li_row = 1 to vds_time_sheet.rowcount()
	ldb_work_hour = vds_time_sheet.getitemnumber(li_row, 'work_hour' )
	ldb_work_count = vds_time_sheet.getitemnumber(li_row, 'work_count' )
	ldb_offtype_id = vds_time_sheet.getitemnumber(li_row, 'off_type_id' )
	ldb_ot_rate = vds_time_sheet.getitemnumber(li_row, 'shift_coefficient' )
	li_late_min = vds_time_sheet.getitemnumber(li_row, 'in_late_minute' )
	
	rstr_workingtime.late_min = li_late_min
	if ldb_ot_rate = 1 then
		if ldb_offtype_id =  0 then
			rstr_workingtime.working_day = ldb_work_count
			rstr_workingtime.working_hour = ldb_work_hour	
		else
			rstr_workingtime.unpaid_day = ldb_work_count
			rstr_workingtime.unpaid_hour = ldb_work_hour
		end if		
	else
		ldba_ot_rate[upperbound( ldba_ot_rate[]) + 1 ] =  ldb_ot_rate
		if upperbound( ldba_ot_rate[]) = 1 then
			rstr_workingtime.ot_hour_1 = ldb_work_hour
			rstr_workingtime.ot_rate_1 = ldb_ot_rate
		elseif upperbound( ldba_ot_rate[]) = 2 then
			rstr_workingtime.ot_hour_2 = ldb_work_hour
			rstr_workingtime.ot_rate_2 =ldb_ot_rate			
		elseif upperbound( ldba_ot_rate[]) = 3 then
			rstr_workingtime.ot_hour_3 = ldb_work_hour
			rstr_workingtime.ot_rate_3 =ldb_ot_rate			
		end if
	end if

NEXT



vds_time_sheet.setfilter('' )
vds_time_sheet.filter()

return 1
end function

public function double f_get_base_workingtime (double vdb_staff_id, t_ds_db vds_payroll, date vd_fdate, date vd_tdate);double					ldb_base_day
string						ls_basetime

vds_payroll.setfilter(" staff_id = " + string(vdb_staff_id) )
vds_payroll.filter()

if vds_payroll.rowcount() > 0 then
	ls_basetime = vds_payroll.getitemstring(1,'basetime')
	if ls_basetime = 'fixed' then
		ldb_base_day =  vds_payroll.getitemnumber(1,'base_value')
		return  ldb_base_day
	elseif  ls_basetime = 'calendar' then
		
	elseif  ls_basetime = 'workingtime' then
		
	end if
end if

return -1
end function

public function integer f_calc_payroll (date vd_fdate, date vd_tdate, ref t_transaction rt_transaction, ref t_dw_mpl rdw_salary_line);double							ldb_staff_id, ldb_base_workdate
long								ll_cnt, ll_idx
string								ls_staff_name
t_ds_db							lds_payroll, lds_timesheet, lds_staff_salary, lds_insurance, lds_sal_advance
c_str_paid_workingtime 		lstr_workingtime, lstr_workingtime_empty

setpointer(hourglass!)

lds_staff_salary = create t_Ds_db 
lds_staff_salary.dataobject = 'd_object_staff_salary_grid'
lds_staff_salary.f_settransobject(rt_transaction )
ll_cnt = lds_staff_salary.retrieve( )

lds_timesheet = create t_Ds_db 
lds_timesheet.dataobject = 'ds_month_timesheet'
lds_timesheet.f_settransobject(rt_transaction )
lds_timesheet.setsort("staff_id a, shift_coefficient a" )
lds_timesheet.retrieve( vd_fdate, vd_tdate)

lds_payroll = create t_Ds_db 
lds_payroll.dataobject = 'ds_current_payroll'
lds_payroll.f_settransobject(rt_transaction )
lds_payroll.setsort("object_note a " )
lds_payroll.retrieve( vd_tdate)

lds_insurance = create t_ds_db
lds_insurance.dataobject = 'ds_insurance'
lds_insurance.f_settransobject( rt_transaction)
lds_insurance.retrieve( )

lds_sal_advance = create t_ds_db
lds_sal_advance.dataobject = 'ds_sal_advance_remain'
lds_sal_advance.f_settransobject( rt_transaction)
lds_sal_advance.retrieve(vd_fdate,vd_tdate )

FOR ll_idx = 1 to ll_cnt
	
	lstr_workingtime = lstr_workingtime_empty
	ldb_staff_id = lds_staff_salary.getitemnumber( ll_idx,'id')
	
	//-- Tính công hưởng lương --//
	this.f_get_paid_workingtime( ldb_staff_id, lds_timesheet, lstr_workingtime)
	//-- lấy thông tin lương và chế độ của kỳ tính lương của tất cả nhân viên --//
	ldb_base_workdate = this.f_get_base_workingtime( ldb_staff_id, lds_payroll, vd_fdate, vd_tdate)
	if isnull(ldb_base_workdate) or ldb_base_workdate = 0 then 
		ls_staff_name = this.f_get_name(ldb_staff_id)
		gf_messagebox('m.b_hr_instantiate.f_calc_payroll.01','Thông báo','Nhân viên chưa cài đặt số ngày làm việc quy định trong tháng:@'+ls_staff_name, 'exclamation','ok',1)
		return 0
	elseif ldb_base_workdate = -1 then
		ls_staff_name = this.f_get_name(ldb_staff_id)
		gf_messagebox('m.b_hr_instantiate.f_calc_payroll.01','Thông báo','Nhân viên chưa có bảng lương:@'+ls_staff_name, 'exclamation','ok',1)
		setpointer(hourglass!)
		continue 
	end if	
	//--tính lương theo ngày công --//
	if this.f_insert_salary_line( ldb_staff_id, lds_payroll, lds_insurance , lds_sal_advance, lstr_workingtime, ldb_base_workdate, rdw_salary_line) = -1 then
		rollback using rt_transaction;
		return -1
	end if
		
NEXT
return 1
end function

public function double f_insert_salary_line (double vdb_staff_id, t_ds_db vds_payroll, t_ds_db vds_insurance, t_ds_db vds_sal_advance, c_str_paid_workingtime vstr_timesheet, double vdb_base_day, ref t_dw_mpl rdw_salary_line);int				li_row, li_rtn, li_idx
long			ll_insertrow
double		ldb_sal_OT, ldb_sal_SI, ldb_ins_amt , ldb_sal_amt, ldb_sal_adv_amt
double		ldb_component_id, ldb_SI_pct_staff, ldb_SI_pct_comp, ldb_HI_pct_staff, ldb_HI_pct_comp, ldb_sal_amt_4_calc
string			ls_income_yn, ls_based_on_working_yn, ls_social_yn, ls_staff_name, ls_sal_adv_line, ls_sal_adv_doc
boolean		lb_first_component



//if vdb_base_day > vstr_timesheet.working_day + vstr_timesheet.unpaid_day then
//	ls_staff_name = this.f_get_name( vdb_staff_id)
//	li_rtn = gf_messagebox('m.b_hr_instantiate.f_insert_salary_line.02','Thông báo','Ngày làm việc của nhân viên nhỏ hơn ngày quy định nhưng không có khai báo nghỉ. Bạn có muốn dừng lại để kiểm tra?'+ls_staff_name, 'exclamation','yesno', 1)
//	if li_rtn = 1 then
//		return -1
//	end if
//end if

vds_payroll.setfilter(" staff_id = " + string(vdb_staff_id) )
vds_payroll.filter()
if vds_payroll.rowcount() > 0 then
	vds_payroll.setfilter(" staff_id = " + string(vdb_staff_id) + " AND ot_yn = 'Y' ")
	vds_payroll.filter()
	if vds_payroll.rowcount() > 0 then
		ldb_sal_OT = double(vds_payroll.Describe("Evaluate('Sum( amount )', 0)"))
	end if
	vds_payroll.setfilter(" staff_id = " + string(vdb_staff_id) )
	vds_payroll.filter()	
	
	li_row = vds_insurance.find("insurance_type = 'SI' and insurance_obj = 'staff'", 1, vds_insurance.rowcount())
	if li_row > 0 then
		ldb_SI_pct_staff = vds_insurance.getitemnumber(li_row, 'insurance_pct')
		if isnull(ldb_SI_pct_staff) then ldb_SI_pct_staff = 0
	end if
	li_row = vds_insurance.find("insurance_type = 'SI' and insurance_obj = 'company'", 1, vds_insurance.rowcount())
	if li_row > 0 then
		ldb_SI_pct_comp = vds_insurance.getitemnumber(li_row, 'insurance_pct')
		if isnull(ldb_SI_pct_comp) then ldb_SI_pct_comp = 0
	end if
	li_row = vds_insurance.find("insurance_type = 'HI' and insurance_obj = 'staff'", 1, vds_insurance.rowcount())
	if li_row > 0 then
		ldb_HI_pct_staff = vds_insurance.getitemnumber(li_row, 'insurance_pct')
		if isnull(ldb_HI_pct_staff) then ldb_HI_pct_staff = 0
	end if
	li_row = vds_insurance.find("insurance_type = 'HI' and insurance_obj = 'company'", 1, vds_insurance.rowcount())
	if li_row > 0 then
		ldb_HI_pct_comp = vds_insurance.getitemnumber(li_row, 'insurance_pct')
		if isnull(ldb_HI_pct_comp) then ldb_HI_pct_comp = 0
	end if
	
	lb_first_component = true
	FOR li_row =1 to vds_payroll.rowcount()
		ldb_component_id = vds_payroll.getitemnumber(li_row, 'component_id')
		ls_social_yn = vds_payroll.getitemstring(li_row, 'social_yn')
		if isnull(ls_social_yn) then ls_social_yn = 'N'
		ls_income_yn = vds_payroll.getitemstring(li_row, 'income_yn')
		if isnull(ls_income_yn) then ls_income_yn = 'N'
		ls_based_on_working_yn =  vds_payroll.getitemstring(li_row, 'based_on_working_yn')
		if isnull(ls_based_on_working_yn) then ls_based_on_working_yn = 'N'
		ldb_sal_amt_4_calc =  vds_payroll.getitemnumber(li_row, 'amount')
		if isnull(ldb_sal_amt) then ldb_sal_amt = 0
		
		if ls_income_yn = 'Y' then			
			if ls_based_on_working_yn = 'Y' then
				ldb_sal_amt = round(ldb_sal_amt_4_calc*vstr_timesheet.working_day /vdb_base_day,0) //-- cần làm tròn theo loại tiền--//
			end if
			
			ll_insertrow = rdw_salary_line.event e_addrow()
			
			rdw_salary_line.setitem(ll_insertrow, 'staff_id', vdb_staff_id)
			rdw_salary_line.setitem(ll_insertrow, 'component_id', ldb_component_id)		
			rdw_salary_line.setitem(ll_insertrow, 'income_amt', ldb_sal_amt)
			rdw_salary_line.setitem(ll_insertrow, 'working_count', vstr_timesheet.working_day)
			rdw_salary_line.setitem(ll_insertrow, 'working_hours', vstr_timesheet.working_hour )
			rdw_salary_line.setitem(ll_insertrow, 'shift_coefficient', 1)
			rdw_salary_line.setitem(ll_insertrow, 'sal_type', 'plus')
			rdw_salary_line.setitem(ll_insertrow, 'amt_4_calc', ldb_sal_amt_4_calc)
			
			//-- lương bảo hiểm và lương thu nhập cùng nhau --//
			if ls_social_yn = 'Y' then
				//-- chưa dùng --//
			end if
			
			//-- insert tăng ca dùng component đầu tiên đầu tiên, trừ tạm ứng--//
			if lb_first_component then
				//-- trừ tạm ứng nếu có : update vào record cùa component đầu tiên --//
					vds_sal_advance.setfilter(" object_id = " + string(vdb_staff_id) )
					vds_sal_advance.filter()	
					
					if vds_sal_advance.rowcount() > 0 then
						FOR li_idx = 1 to vds_sal_advance.rowcount()
							ldb_sal_adv_amt  += vds_sal_advance.getitemnumber(li_idx, 'amount')
							if li_idx = 1 then
								ls_sal_adv_line  = ';'+ string(vds_sal_advance.getitemnumber(li_idx, 'ID'))+';'
								ls_sal_adv_doc  =  ';'+ string(vds_sal_advance.getitemnumber(li_idx, 'document_id'))+';'		
							else
								ls_sal_adv_line  += string(vds_sal_advance.getitemnumber(li_idx, 'ID'))+';'
								ls_sal_adv_doc  +=  string(vds_sal_advance.getitemnumber(li_idx, 'document_id'))+';'									
							end if
						NEXT

						rdw_salary_line.setitem(ll_insertrow, 'MINUS_SAL_ADV', ldb_sal_adv_amt)
						rdw_salary_line.setitem(ll_insertrow, 'REF_LINE_CHAR', ls_sal_adv_line)
						rdw_salary_line.setitem(ll_insertrow, 'REF_DOC_CHAR', ls_sal_adv_doc)
					end if							
				//-- tính tăng ca: in sert record mới--//	
				if vstr_timesheet.ot_hour_1 > 0 then
					ll_insertrow = rdw_salary_line.event e_addrow()
					ldb_sal_amt = round(round(ldb_sal_OT/vdb_base_day/8,0)*vstr_timesheet.ot_hour_1*vstr_timesheet.ot_rate_1  ,0)
					
					rdw_salary_line.setitem(ll_insertrow, 'staff_id', vdb_staff_id)
					rdw_salary_line.setitem(ll_insertrow, 'component_id', ldb_component_id)		
					rdw_salary_line.setitem(ll_insertrow, 'income_amt', ldb_sal_amt)
					rdw_salary_line.setitem(ll_insertrow, 'working_count', round(vstr_timesheet.ot_hour_1/8,0))
					rdw_salary_line.setitem(ll_insertrow, 'working_hours', vstr_timesheet.ot_hour_1)
					rdw_salary_line.setitem(ll_insertrow, 'shift_coefficient', vstr_timesheet.ot_rate_1)		
					rdw_salary_line.setitem(ll_insertrow, 'sal_type', 'plus')
					rdw_salary_line.setitem(ll_insertrow, 'amt_4_calc', ldb_sal_OT)
				end if
				
				if vstr_timesheet.ot_hour_2 > 0 then
					ll_insertrow = rdw_salary_line.event e_addrow()
					ldb_sal_amt = round(round(ldb_sal_OT/vdb_base_day/8,0)*vstr_timesheet.ot_hour_2*vstr_timesheet.ot_rate_2 ,0) 
					
					rdw_salary_line.setitem(ll_insertrow, 'staff_id', vdb_staff_id)
					rdw_salary_line.setitem(ll_insertrow, 'component_id', ldb_component_id)		
					rdw_salary_line.setitem(ll_insertrow, 'income_amt', ldb_sal_amt)
					rdw_salary_line.setitem(ll_insertrow, 'working_count', round(vstr_timesheet.ot_hour_2/8,0))
					rdw_salary_line.setitem(ll_insertrow, 'working_hours', vstr_timesheet.ot_hour_2)
					rdw_salary_line.setitem(ll_insertrow, 'shift_coefficient', vstr_timesheet.ot_rate_2)			
					rdw_salary_line.setitem(ll_insertrow, 'sal_type', 'plus')
					rdw_salary_line.setitem(ll_insertrow, 'amt_4_calc', ldb_sal_OT)
				end if				

				if vstr_timesheet.ot_hour_3 > 0 then
					ll_insertrow = rdw_salary_line.event e_addrow()
					ldb_sal_amt = round(round(ldb_sal_OT/vdb_base_day/8,0)*vstr_timesheet.ot_hour_3*vstr_timesheet.ot_rate_3,0)  
					
					rdw_salary_line.setitem(ll_insertrow, 'staff_id', vdb_staff_id)
					rdw_salary_line.setitem(ll_insertrow, 'component_id', ldb_component_id)		
					rdw_salary_line.setitem(ll_insertrow, 'income_amt', ldb_sal_amt)
					rdw_salary_line.setitem(ll_insertrow, 'working_count', round(vstr_timesheet.ot_hour_3/8,0))
					rdw_salary_line.setitem(ll_insertrow, 'working_hours', vstr_timesheet.ot_hour_3)
					rdw_salary_line.setitem(ll_insertrow, 'shift_coefficient', vstr_timesheet.ot_rate_3)		
					rdw_salary_line.setitem(ll_insertrow, 'sal_type', 'plus')
					rdw_salary_line.setitem(ll_insertrow, 'amt_4_calc', ldb_sal_OT)
				end if								
				
	
				//-- tắt biến cờ --//
				lb_first_component = false
			end if
		elseif ls_social_yn = 'Y' and ls_income_yn = 'N' then //-- lương bảo hiểm riêng với lương thu nhập --//
			vds_payroll.setfilter(" staff_id = " + string(vdb_staff_id) + " AND social_yn = 'Y' ")
			vds_payroll.filter()
			if vds_payroll.rowcount() > 0 then
				ldb_sal_SI = double(vds_payroll.Describe("Evaluate('Sum( amount )', 0)"))
			end if
			vds_payroll.setfilter(" staff_id = " + string(vdb_staff_id) )
			vds_payroll.filter()				
			
			
			ll_insertrow = rdw_salary_line.event e_addrow()
			
			rdw_salary_line.setitem(ll_insertrow, 'staff_id', vdb_staff_id)
			rdw_salary_line.setitem(ll_insertrow, 'component_id', ldb_component_id)		
			rdw_salary_line.setitem(ll_insertrow, 'amt_4_calc', ldb_sal_SI)
			ldb_ins_amt = ldb_sal_SI*ldb_SI_pct_staff/100
			rdw_salary_line.setitem(ll_insertrow, 'staff_si_amt', ldb_ins_amt)
			ldb_ins_amt = ldb_sal_SI*ldb_SI_pct_comp/100
			rdw_salary_line.setitem(ll_insertrow, 'comp_si_amt', ldb_ins_amt)
			ldb_ins_amt = ldb_sal_SI*ldb_HI_pct_staff/100
			rdw_salary_line.setitem(ll_insertrow, 'staff_hi_amt', ldb_ins_amt)
			ldb_ins_amt = ldb_sal_SI*ldb_HI_pct_comp/100
			rdw_salary_line.setitem(ll_insertrow, 'comp_hi_amt', ldb_ins_amt)	
			rdw_salary_line.setitem(ll_insertrow, 'sal_type', 'minus')
		end if
	NEXT

	//-- Cộng khen thưởng nếu có--//
	
end if
return 0
end function

public function integer f_get_workinghour_per_day (double vdb_shift_id);int				li_cnt
double		ldb_hour


select count(id) into :li_cnt 
from  MEASUREMENT_HDR where id = :vdb_shift_id using sqlca; 

if li_cnt > 0 then
	
	select hour_per_day  into :ldb_hour  from MEASUREMENT_HDR where id = :vdb_shift_id using sqlca; 
	
	return ldb_hour
else
	return 0
end if
end function

public function integer f_calc_timesheet (date vd_fdate, date vd_tdate, string vs_staff_code, string vs_dept_code, ref t_transaction rt_transaction);int					li_cnt, li_row, li_row_found, li_ts_row, li_nbr_of_chk_att
datetime			ldt_chk_time, ldt_chk_time_next
date				ld_workdate, ld_workdate_tmp,ld_f_date
string				ls_where, ls_chk_time, ls_staff_code, ls_staff_code_tmp,ls_findStr, ls_shift_code
double			ldb_staff_id, ldb_staff_id_tmp, ldb_shift_tmp, ldb_shift, ldb_hour_per_day
boolean			lb_skipped_row
any				laa_data[]

int					li_early_minute,li_late_minute,li_latecome_tolerance_min,li_earlyleave_tolerance_min,li_hour_per_day,li_shift_coefficient
int					li_checkout_early_min,li_checkout_late_min,li_checkin_early_min,li_checkin_late_min
double			ldb_work_hour,ldb_work_count,ldb_shift_id
boolean			lb_chkin,lb_chkout
datetime			ldt_chkin_time,ldt_chkout_time, ldt_shift_in, ldt_shift_out,ldt_shift_in_tmp,ldt_shift_out_tmp

t_ds_db			lds_shift, lds_data, lds_timesheet,lds_assign
c_datetime		lc_datetime

//-- Xóa dữ liệu tính công cũ --//

DELETE timesheet_line WHERE work_Date BETWEEN :vd_fdate AND :vd_tdate AND nvl(manual_yn,'N') = 'N' using rt_transaction;

//-- lấy dữ liệu tính công manual --//
lds_timesheet = create t_ds_db 
lds_timesheet.dataobject = 'd_timesheet_grid'
ls_where = "  to_char(work_Date,~~'yyyymmdd~~') BETWEEN ~~'" + string(vd_fdate,'yyyymmdd') + "~~' AND ~~'" + string(vd_tdate,'yyyymmdd') + "~~'"
lds_timesheet.f_add_where( ls_where, " AND ")
lds_timesheet.f_settransobject( rt_transaction)
li_cnt = lds_timesheet.retrieve( )

//-- lấy dữ liệu ca va phân công ca --//
lds_shift = create t_ds_db 
lds_shift.dataobject = 'ds_shift_time_grid'
laa_data[1] = '('+string(vd_fdate) + ':' + string(vd_tdate) + ')'
lds_shift.f_add_where( 'trans_date', laa_data)
lds_shift.f_settransobject( rt_transaction)
li_cnt = lds_shift.retrieve( )

//-- lấy dữ liệu chấm công --//
lds_data = create t_ds_db 
lds_data.dataobject = 'd_finger_scan_data_grid'
ls_where = "  to_char(check_time,~~'yyyymmdd~~') BETWEEN ~~'" + string(vd_fdate,'yyyymmdd') + "~~' AND ~~'" + string(vd_tdate,'yyyymmdd') + "~~'"
if not isnull(vs_staff_code) and vs_staff_code <> '' then
	ls_where += " AND code = ~~'" + vs_staff_code +"~~'"
end if
lds_data.f_add_where( ls_where, " AND ")
lds_data.setsort( " ACCTNO asc, check_time asc")
lds_data.f_settransobject( rt_transaction)
li_cnt = lds_data.retrieve( )

//-- lấy dữ liệu phân công ca --//
//lds_assign = create t_ds_db
//lds_assign.dataobject = 'd_staff_working_day_grid'
//laa_data[1] = '('+string(vd_fdate) + ':' + string(vd_tdate) + ')'
//lds_assign.f_add_where( 'trans_date', laa_data[])
//lds_assign.f_settransobject( rt_transaction)
//lds_assign.retrieve( )
//lds_assign.setsort( "staff_id asc, trans_date asc")
//lds_assign.sort( )

ld_f_date = vd_fdate
if vs_staff_code <> '' then
//	lds_assign.setfilter( "staff_code = '" +vs_staff_code + "'")
//	lds_assign.filter( )
	
	Do While ld_f_date <= vd_tdate
		this.f_get_shift_time( vs_staff_code, ld_f_date, lds_shift, ldt_shift_in, ldt_shift_out,li_latecome_tolerance_min,li_earlyleave_tolerance_min,li_hour_per_day,li_shift_coefficient,li_checkout_early_min,li_checkout_late_min,li_checkin_early_min,li_checkin_late_min)
		lds_data.setfilter( "code = '" + string(vs_staff_code) + "' and date(check_time) = " + string(ld_f_date))
		lds_data.filter( )
		lds_data.setsort( "check_time asc")
		lds_data.sort( )
		
		ldt_chkin_time = lds_data.getitemdatetime( 1, 'check_time')
		li_late_minute = lc_datetime.f_minuteafter( ldt_shift_in, ldt_chkin_time)
		if li_latecome_tolerance_min >= li_late_minute then li_late_minute = 0
		
		ldt_chkout_time =  lds_data.getitemdatetime( lds_data.rowcount(), 'check_time')
		li_early_minute = lc_datetime.f_minuteafter( ldt_shift_in, ldt_chkout_time)
		if li_earlyleave_tolerance_min >= abs(li_early_minute) then li_early_minute = 0
		
		ldb_staff_id =  lds_data.getitemnumber( 1, 'object_id')
		ldb_shift_id =  lds_data.getitemnumber( 1, 'shift_id')
		this.f_get_daywork( li_latecome_tolerance_min, abs(li_earlyleave_tolerance_min), li_hour_per_day, ldb_work_hour, ldb_work_count)
		
		li_ts_row = lds_timesheet.event e_addrow( )
		lds_timesheet.setitem( li_ts_row, 'ID', this.f_create_id( )  )
		lds_timesheet.setitem( li_ts_row, 'staff_id', ldb_staff_id)
		lds_timesheet.setitem( li_ts_row, 'work_date', ld_f_date )
		lds_timesheet.setitem( li_ts_row, 'shift_id', ldb_shift_id )				
		lds_timesheet.setitem( li_ts_row, 'IN_LATE_MINUTE', li_late_minute)				
		lds_timesheet.setitem( li_ts_row, 'out_early_minute', abs(li_early_minute))		
		lds_timesheet.setitem( li_ts_row, 'SHIFT_COEFFICIENT', li_shift_coefficient )
		lds_timesheet.setitem( li_ts_row, 'SHIFT_IN_TIME', ldt_shift_in)
		lds_timesheet.setitem( li_ts_row, 'shift_out_time', ldt_shift_out)
		lds_timesheet.setitem( li_ts_row, 'CHECKIN_TIME', ldt_chkin_time)
		lds_timesheet.setitem( li_ts_row, 'checkout_time', ldt_chkout_time)
		lds_timesheet.setitem( li_ts_row, 'WORKING_HOURS', ldb_work_hour)
		lds_timesheet.setitem( li_ts_row, 'WORKING_COUNT', ldb_work_count)
		if ldt_chkin_time = ldt_chkout_time then lds_timesheet.setitem( li_ts_row, 'NOTE', 'Không chấm công vào lại hoặc ra về' )	
		if li_late_minute > 0 and abs(li_early_minute) > 0 then
			if  li_checkout_late_min > 0 then ldt_shift_out = lc_datetime.f_add_datetime( ldt_shift_in, li_checkout_late_min / 60 / 24)
			if li_checkout_early_min >0 then ldt_shift_out_tmp = lc_datetime.f_add_datetime( ldt_shift_in, (li_checkout_early_min / 60 / 24) * -1)
			if  li_checkin_late_min > 0 then  ldt_shift_in = lc_datetime.f_add_datetime( ldt_shift_in, li_checkin_late_min / 60 / 24)
			if li_checkin_early_min > 0 then  ldt_shift_in_tmp = lc_datetime.f_add_datetime( ldt_shift_in, (li_checkin_early_min / 60 / 24) * -1)
			if (ldt_chkin_time > ldt_shift_in or ldt_chkin_time < ldt_shift_in_tmp) or (ldt_chkout_time > ldt_shift_out or ldt_shift_out < ldt_shift_out_tmp) then
				lds_timesheet.setitem( li_ts_row, 'WORKING_HOURS', 0)
				lds_timesheet.setitem( li_ts_row, 'WORKING_COUNT', 0)
				lds_timesheet.setitem( li_ts_row, 'NOTE', 'Chấm công không đúng quy định' )
			end if 
		end if
		
		ld_f_date = RelativeDate ( ld_f_date, 1 )
	Loop
//laa_data[1] = vs_staff_code
//laa_data[2] = vd_trans_date
//rds_shfit_time.f_add_where('staff_code;trans_date',laa_data)
//rds_shfit_time.retrieve()
//	lds_shift.f_add_where( "staff_code;trans_date", /*any va_data[] */)
//	Do While 
	
elseif vs_dept_code <> '' then
	
elseif vs_staff_code = '' and vs_dept_code = '' then
	
end if

//li_row = 1
//DO while li_row <= li_cnt //-- sửa thành DO While ngay mai
////	if lb_skipped_row then 
////		lb_skipped_row = false
////		continue //-- ca quy định chấm công 2 lần--//
////	end if
//	ls_staff_code = lds_data.getitemstring( li_row, 'code')
//	ldb_staff_id_tmp =  lds_data.getitemnumber( li_row, 'object_id')
//	ldt_chk_time = lds_data.getitemdatetime( li_row, 'check_time')
//	ld_workdate_tmp = date(ldt_chk_time)
//	ls_chk_time = string(time(ldt_chk_time),'hhmmss')
//	li_row_found = lds_shift.find( "'" + ls_chk_time + "' BETWEEN chkin_from AND chkin_to ", 1, lds_shift.rowcount() )
//	IF li_row_found > 0 then
//		li_latecome_tolerance_min =  lds_shift.getitemnumber( li_row_found,'latecome_tolerance_min')		
//		if isnull(li_latecome_tolerance_min) then li_latecome_tolerance_min = 0
//		ldb_shift_tmp = lds_shift.getitemnumber( li_row_found,'hdr_id')
//		li_nbr_of_chk_att =  lds_shift.getitemnumber( li_row_found,'nbr_of_chk_att')
//		ldb_hour_per_day = lds_shift.getitemnumber( li_row_found,'hour_per_day')
//		if isnull(li_nbr_of_chk_att) or li_nbr_of_chk_att = 0 then			
//			ls_shift_code =  lds_shift.getitemstring( li_row_found,'shift_code')
//			gf_messagebox('m.b_hr_timesheet.01','Thông báo','Ca sau chưa cài đặt số lần chấm công:@ '+ls_shift_code,'stop','ok',1)
//			rollback using rt_transaction;
//			return -1
//		end if
//		
//		if ldb_staff_id_tmp = ldb_staff_id and ld_workdate_tmp = ld_workdate and ldb_shift_tmp = ldb_shift then
//			li_row++
//			continue //-- bỏ các lần chấm công sau mà có cùng ca --//
//		else
//			ldb_staff_id = ldb_staff_id_tmp
//			ld_workdate = ld_workdate_tmp
//			ldb_shift = ldb_shift_tmp
//			//-- tìm work_date cò manual ko --//
//			ls_findStr = " staff_id = "+ string(ldb_staff_id) + " AND  string(work_date,'yyyymmdd') = '"+ string(ld_workdate,'yyyymmdd')+"' AND shift_id = "+string(ldb_shift)
//			li_ts_row = lds_timesheet.find(ls_findStr, 1, lds_timesheet.rowcount( ) )
//			if li_ts_row = 0 then
//				ldt_shift_in =  lds_shift.getitemdatetime( li_row_found,'F_TIME')				
//				ldt_shift_in = datetime(ld_workdate, time(ldt_shift_in))
//				ldt_shift_out =  lds_shift.getitemdatetime( li_row_found,'T_TIME')
//				ldt_shift_out = datetime(ld_workdate, time(ldt_shift_out))				
//				li_late_minute = lc_datetime.f_minuteafter( ldt_shift_in, ldt_chk_time)
//				if li_latecome_tolerance_min >= li_late_minute then li_late_minute = 0	
//				
//				li_ts_row = lds_timesheet.event e_addrow( )
//				lds_timesheet.setitem( li_ts_row, 'ID', this.f_create_id( )  )
//				lds_timesheet.setitem( li_ts_row, 'staff_id', ldb_staff_id)
//				lds_timesheet.setitem( li_ts_row, 'work_date', ld_workdate )
//				lds_timesheet.setitem( li_ts_row, 'shift_id', ldb_shift )				
//				lds_timesheet.setitem( li_ts_row, 'IN_LATE_MINUTE', li_late_minute)				
//				lds_timesheet.setitem( li_ts_row, 'SHIFT_COEFFICIENT', lds_shift.getitemnumber( li_row_found,'SHIFT_COEFFICIENT') )
//				lds_timesheet.setitem( li_ts_row, 'SHIFT_IN_TIME', ldt_shift_in)
//				lds_timesheet.setitem( li_ts_row, 'CHECKIN_TIME', ldt_chk_time)
//				if li_nbr_of_chk_att = 1 then
//					
//					lds_timesheet.setitem( li_ts_row, 'SHIFT_OUT_TIME', ldt_shift_out )										
//					lds_timesheet.setitem( li_ts_row, 'WORK_HOUR',  lds_shift.getitemnumber( li_row_found,'WORKING_HOURS') )
//					lds_timesheet.setitem( li_ts_row, 'WORK_COUNT', lds_shift.getitemnumber( li_row_found,'WORKING_COUNT')  )
//					
//				elseif li_nbr_of_chk_att = 2 then //-- chấm công 2 lần  --//
//					ldt_shift_out =  lds_shift.getitemdatetime( li_row_found,'T_TIME')
//					
//					if isnull(ldt_shift_out) or string(ldt_shift_out,'yyyymmdd') = '19000101' then //-- lần chấm công sau không cố định trước--//
//						if li_row < lds_data.rowcount( ) then
//							li_row++
//							ls_staff_code = lds_data.getitemstring( li_row  , 'code')
//							ldb_staff_id_tmp =  lds_data.getitemnumber( li_row , 'object_id')
//							ldt_chk_time_next = lds_data.getitemdatetime( li_row, 'check_time')
//							ld_workdate_tmp = date(ldt_chk_time_next)
//							
//							Do while  lc_datetime.f_minuteafter( ldt_chk_time, ldt_chk_time_next) < 10 and ldb_staff_id = ldb_staff_id_tmp  and  ld_workdate = ld_workdate_tmp
//								li_row++
//								ls_staff_code = lds_data.getitemstring( li_row  , 'code')
//								ldb_staff_id_tmp =  lds_data.getitemnumber( li_row , 'object_id')
//								ldt_chk_time_next = lds_data.getitemdatetime( li_row, 'check_time')
//								ld_workdate_tmp = date(ldt_chk_time_next)									
//								ldt_chk_time_next = lds_data.getitemdatetime( li_row, 'check_time')
//							LOOP
//							
//							if ldb_staff_id = ldb_staff_id_tmp and ld_workdate = ld_workdate_tmp and ldb_shift = ldb_shift_tmp	 then
//								lds_timesheet.setitem( li_ts_row, 'SHIFT_OUT_TIME', ldt_chk_time_next )							
//								lds_timesheet.setitem( li_ts_row, 'WORK_HOUR',  round(lc_datetime.f_hourafter( ldt_shift_in, ldt_chk_time_next),3) )
//								lds_timesheet.setitem( li_ts_row, 'WORK_COUNT', round(lc_datetime.f_hourafter( ldt_shift_in, ldt_chk_time_next) / ldb_hour_per_day,3) )		
//								li_row++
//								continue
//							else
//								lds_timesheet.setitem( li_ts_row, 'NOTE', 'Không chấm công ra về' )						
//								continue							
//							end if
//						end if
//					end if
//				end if
//			else
//				li_row++
//				continue //-- bỏ các lần chấm công mà đã có thông tin chấm công nhập tay --//
//			end if
//		end if
//		//--
//	else
//
//		ldb_staff_id = ldb_staff_id_tmp
//		ld_workdate = ld_workdate_tmp
//		ldb_shift = 0
//		
//		li_ts_row = lds_timesheet.event e_addrow( )
//		lds_timesheet.setitem( li_ts_row, 'ID', this.f_create_id( )  )
//		lds_timesheet.setitem( li_ts_row, 'staff_id', ldb_staff_id)
//		lds_timesheet.setitem( li_ts_row, 'work_date', ld_workdate )	
//		lds_timesheet.setitem( li_ts_row, 'CHECKIN_TIME', ldt_chk_time)
//		lds_timesheet.setitem( li_ts_row, 'NOTE', 'Chấm công không đúng quy định' )
//
//	end if
//	li_row++
//Loop 

if lds_timesheet.update( true, false) = 1 then
	commit using rt_transaction;
else
	rollback using rt_transaction;
	gf_messagebox('m.b_hr_timesheet.02','Thông báo','Không cập nhật được dữ liệu:v@'+rt_transaction.sqlerrtext,'stop','ok',1)
	return -1
end if
destroy lds_shift
destroy lds_data
destroy lds_timesheet 
destroy lds_assign
return 1
end function

public function integer f_get_daywork (integer vi_latecome_tolerance_min, integer vi_earlyleave_tolerance_min, integer vi_hour_per_day, ref double rdb_work_hour, ref double rdb_work_count);rdb_work_hour = round(((vi_hour_per_day * 60) - (vi_latecome_tolerance_min + vi_earlyleave_tolerance_min)) /60,1)
rdb_work_count = round(rdb_work_hour / vi_hour_per_day,3)
return 0
end function

public function integer f_get_shift_time (string vs_staff_code, date vd_trans_date, ref t_ds_db rds_shfit_time, ref datetime rdt_f_time, ref datetime rdt_t_time, ref integer ri_latecome_tolerance_min, ref integer ri_earlyleave_tolerance_min, ref integer ri_hour_per_day, ref integer ri_shift_coefficient, ref integer ri_checkout_early_min, ref integer ri_checkout_late_min, ref integer ri_checkin_early_min, ref integer ri_checkin_late_min);
rds_shfit_time.setfilter("staff_code = '" + vs_staff_code + "' and trans_date = " + string(vd_trans_date))
rds_shfit_time.filter()
ri_latecome_tolerance_min =  rds_shfit_time.getitemnumber( rds_shfit_time.rowcount(),'latecome_tolerance_min')	
ri_earlyleave_tolerance_min =  rds_shfit_time.getitemnumber( rds_shfit_time.rowcount(),'earlyleave_tolerance_min')	
ri_hour_per_day =  rds_shfit_time.getitemnumber( rds_shfit_time.rowcount(),'hour_per_day')	
ri_shift_coefficient = rds_shfit_time.getitemnumber( rds_shfit_time.rowcount(),'shift_coefficient')	
rdt_f_time = datetime(vd_trans_date, time(rds_shfit_time.getitemdatetime(rds_shfit_time.rowcount(),'f_time')))
rdt_t_time = datetime(vd_trans_date, time(rds_shfit_time.getitemdatetime(rds_shfit_time.rowcount(),'t_time')))
ri_checkout_early_min = rds_shfit_time.getitemnumber( rds_shfit_time.rowcount(),'checkout_early_min')	
ri_checkout_late_min = rds_shfit_time.getitemnumber( rds_shfit_time.rowcount(),'checkout_late_min')	
ri_checkin_early_min = rds_shfit_time.getitemnumber( rds_shfit_time.rowcount(),'checkin_early_min')	
ri_checkin_late_min = rds_shfit_time.getitemnumber( rds_shfit_time.rowcount(),'checkin_late_min')	
return 0
end function

public function integer of_show_progress (integer ai_progress);if ai_progress > 100 then
	if isvalid(iw_progress) then
		close(iw_progress)
		setnull(iw_progress)
	end if
else
	if isvalid(iw_progress) then
	else
		openwithparm(iw_progress,this)
	end if
	iw_progress.event ue_show_progress(ai_progress)	
end if 

return 1
end function

public function integer f_insert_timesheet (ref t_ds_db rds_timesheet, double vdb_staff_id, date vd_workdate, double vdb_shift_id, integer vi_late_minute, integer vi_early_minute, double vdb_shift_coefficient, datetime vdt_shift_in, datetime vdt_shift_out, datetime vdt_chkin_time, datetime vdt_chkout_time, double vdb_work_hour, double vdb_work_count, double vdb_ot_hour, double vdb_ot_coefficient, string vs_note);long			li_ts_row

		li_ts_row = rds_timesheet.event e_addrow( )
		rds_timesheet.setitem( li_ts_row, 'ID', this.f_create_id( )  )
		rds_timesheet.setitem( li_ts_row, 'staff_id', vdb_staff_id)
		rds_timesheet.setitem( li_ts_row, 'work_date', vd_workdate )
		rds_timesheet.setitem( li_ts_row, 'shift_id', vdb_shift_id )				
		rds_timesheet.setitem( li_ts_row, 'IN_LATE_MINUTE', vi_late_minute)				
		rds_timesheet.setitem( li_ts_row, 'out_early_minute', vi_early_minute)		
		rds_timesheet.setitem( li_ts_row, 'SHIFT_COEFFICIENT', vdb_shift_coefficient )
		rds_timesheet.setitem( li_ts_row, 'SHIFT_IN_TIME', vdt_shift_in)
		rds_timesheet.setitem( li_ts_row, 'shift_out_time', vdt_shift_out)
		rds_timesheet.setitem( li_ts_row, 'CHECKIN_TIME', vdt_chkin_time)
		rds_timesheet.setitem( li_ts_row, 'checkout_time', vdt_chkout_time)
		rds_timesheet.setitem( li_ts_row, 'work_hour', vdb_work_hour)
		rds_timesheet.setitem( li_ts_row, 'work_count', vdb_work_count)
		rds_timesheet.setitem( li_ts_row, 'ot_coefficient', vdb_ot_coefficient)
		rds_timesheet.setitem( li_ts_row, 'ot_hour', vdb_ot_hour)
		rds_timesheet.setitem( li_ts_row, 'NOTE', vs_note )

return li_ts_row
end function

public function integer f_calc_timesheet_gopak (t_ds_db vds_staff, date vd_fdate, date vd_tdate, ref t_transaction rt_transaction);int					li_cnt, li_row, li_row_found, li_ts_row, li_nbr_of_chk_att, li_progress, li_rtn, li_come_tolerance_min, li_leave_tolerance_min
datetime			ldt_chk_time, ldt_chk_time_next
date				ld_workdate, ld_workdate_tmp
string				ls_where, ls_chk_time, ls_staff_code, ls_staff_code_tmp,ls_findStr, ls_shift_code, ls_note,ls_tmp
double			ldb_staff_id, ldb_shift_id, ldb_shift_coefficient,ldb_minute_b4_ot,ldb_minute_at_ot
boolean			lb_skipped_row
any				laa_data[]

int					li_late_minute, li_early_minute, li_chkin_early, li_chkout_early, li_chkin_late, li_chkout_late, li_break_min
double			ldb_work_hour,ldb_work_count, ldb_ot_hour, ldb_ot_coefficient
datetime			ldt_shift_in,ldt_shift_out, ldt_chkin_time,ldt_chkout_time, ldt_ot_b4, ldt_ot_after
datetime			ldt_shift_in_fr, ldt_shift_in_to, ldt_shift_out_fr, ldt_shift_out_to


t_ds_db			lds_shift, lds_data, lds_timesheet, lds_assign
c_datetime		lc_datetime

//-- Xóa dữ liệu tính công cũ --//
// --dữ liệu đã xác nhận (approved_yn=Y) thì không xóa,
//--hoặc dữ liệu nhập tay (manual_yn=Y) cũng không xóa --//
if vds_staff.rowcount() = 1 then
	ldb_staff_id = vds_staff.getitemnumber(1, 'id')
	DELETE timesheet_line 
	WHERE work_Date BETWEEN :vd_fdate AND :vd_tdate 
		AND nvl(manual_yn,'N') = 'N' 
		AND nvl(approved_yn,'N') = 'N'
		AND staff_id = :ldb_staff_id
		using rt_transaction;
else
	DELETE timesheet_line 
	WHERE work_Date BETWEEN :vd_fdate AND :vd_tdate 
		AND nvl(manual_yn,'N') = 'N' 
		AND nvl(approved_yn,'N') = 'N'
		using rt_transaction;	
end if

//-- lấy dữ liệu tính công manual --//
lds_timesheet = create t_ds_db 
lds_timesheet.dataobject = 'd_timesheet_grid'
lds_timesheet.f_settransobject( rt_transaction)


//-- lấy dữ liệu ca va phân công ca --//
lds_shift = create t_ds_db 
lds_shift.dataobject = 'ds_shift_time_grid'
laa_data[1] = '('+string(vd_fdate) + ':' + string(vd_tdate) + ')'
lds_shift.f_add_where( 'trans_date', laa_data)
lds_shift.f_settransobject( rt_transaction)
li_cnt = lds_shift.retrieve( )

//-- lấy dữ liệu chấm công --//
ld_workdate_tmp =  RelativeDate ( vd_tdate, 1 )
lds_data = create t_ds_db 
lds_data.dataobject = 'ds_scan_data_grid'
ls_where = "  to_char(check_time,~~'yyyymmdd~~') BETWEEN ~~'" + string(vd_fdate,'yyyymmdd') + "~~' AND ~~'" + string(ld_workdate_tmp,'yyyymmdd') + "~~'"
//if not isnull(vs_staff_code) and vs_staff_code <> '' then
//	ls_where += " AND code = ~~'" + vs_staff_code +"~~'"
//end if
lds_data.f_add_where( ls_where, " AND ")
lds_data.setsort( " ACCTNO asc, check_time asc")
lds_data.f_settransobject( rt_transaction)
li_cnt = lds_data.retrieve( )

//-- tính công từng nhân viên từ ngày , đến ngày--//
for li_cnt = 1 to vds_staff.rowcount()
	li_progress = integer((li_cnt/ vds_staff.rowcount())*100)
	this.of_show_progress( li_progress)
	this.of_set_progress_text( string(li_cnt)+'/'+string(vds_staff.rowcount()))
	ldb_staff_id = vds_staff.getitemnumber(li_cnt, 'id' )
	ld_workdate = vd_fdate
	ls_note = ''
	Do While ld_workdate <= vd_tdate
		ls_note = ''
		//-- nhân viên có cần chấm công không? --//
		
				/////-- GOPAK chưa áp dụng--/////
		 
		//--ngày ld_workdate, nhân viên ldb_staff_id có được phân công ko?--////
		//-- nếu không được phần công: cập nhật timesheet note: không được phân công và nhảy qua ngày khác --//			
			li_rtn = lds_shift.setfilter("staff_id = " + string(ldb_staff_id) + " and string(trans_date,'yyyymmdd') = '" + string(ld_workdate,'yyyymmdd') + "' " )
			li_rtn = lds_shift.filter()	
			if lds_shift.rowcount( ) = 0 then // -- không được phận công vào ngày ld_workdate//
				//-- kiểm tra ngày CN : bỏ qua --//
//				if DayNumber ( ld_workdate ) = 1  then 
//					ld_workdate = RelativeDate ( ld_workdate, 1 )
//					continue				
//				end if
				//-- insert timesheet với ghi chú ko được phân công --//
				setnull(ldb_work_hour)
				setnull(ldb_work_count)
				setnull(ldb_ot_hour)
				setnull(ldb_ot_coefficient)				
				setnull(li_late_minute)
				setnull(li_early_minute)
				setnull(ldb_shift_id)
				setnull(ldb_shift_coefficient)				
				setnull(ldt_shift_in)
				setnull(ldt_shift_out)
				setnull(ldt_chkin_time)
				setnull(ldt_chkout_time)				
				ls_note = 'Nhân viên không đuoc phân công'
				
				this.f_insert_timesheet(lds_timesheet, ldb_staff_id, ld_workdate, ldb_shift_id ,li_late_minute ,li_early_minute, ldb_shift_coefficient, ldt_shift_in, ldt_shift_out, ldt_chkin_time, ldt_chkout_time, ldb_work_hour, ldb_work_count, ldb_ot_hour, ldb_ot_coefficient, ls_note)
			else //-- được phân công
				//-- Duyệt các giờ quy định chấm công trong ca --//
//				li_nbr_of_chk_att =  lds_shift.getitemdatetime( 1,'nbr_of_chk_att')	
				FOR li_row =1 to lds_shift.rowcount( ) 
					ls_note = ''
					//-- tính ra giờ vào/ra của shift --//
					ldt_shift_in =  lds_shift.getitemdatetime( li_row,'F_TIME')									
					ldt_shift_out =  lds_shift.getitemdatetime( li_row,'T_TIME')
					if ldt_shift_in < ldt_shift_out then						
						ldt_shift_out = datetime(ld_workdate, time(ldt_shift_out))	
					else
						ldt_shift_out = datetime( RelativeDate( ld_workdate, 1 ), time(ldt_shift_out))	
					end if
					ldt_shift_in = datetime(ld_workdate, time(ldt_shift_in))
					
					//-- tính giờ vào/ra đuoc phép trễ/sớm --//
					li_chkin_early = lds_shift.getitemnumber( li_row,'checkin_early_min')
					if isnull(li_chkin_early) then li_chkin_early = 0
					ldt_shift_in_fr = lc_datetime.f_add_datetime( ldt_shift_in, li_chkin_early / 60 / 24*-1)
					 
					li_chkin_late =  lds_shift.getitemnumber( li_row,'checkin_late_min')
					if isnull(li_chkin_late) then li_chkin_late = 0
					ldt_shift_in_to = lc_datetime.f_add_datetime( ldt_shift_in, li_chkin_late / 60 / 24)
					
					li_chkout_early =  lds_shift.getitemnumber( li_row,'checkout_early_min')
					if isnull(li_chkout_early) then li_chkout_early = 0
					ldt_shift_out_fr = lc_datetime.f_add_datetime( ldt_shift_out, li_chkout_early / 60 / 24*-1)
					
					li_chkout_late =  lds_shift.getitemnumber( li_row,'checkout_late_min')
					if isnull(li_chkout_late) then li_chkout_late = 0
					ldt_shift_out_to = lc_datetime.f_add_datetime( ldt_shift_out, li_chkout_late / 60 / 24)
					
					//-- tìm giờ chấm công vào hợp lệ--//
					ls_findStr = "object_id = " + string(ldb_staff_id) + " and string(check_time,'yyyymmddhhmmss') >= '" + string(ldt_shift_in_fr,'yyyymmddhhmmss') + "' and string(check_time,'yyyymmddhhmmss') <=  '"  + string(ldt_shift_in_to,'yyyymmddhhmmss') + "'"
					lds_data.setfilter(ls_findStr )
					lds_data.filter( )	
					if lds_data.rowcount( ) > 0 then
						ldt_chkin_time = lds_data.getitemdatetime(  1, 'check_time') //-- lấy giờ chấm công đầu tiên--//
					else
						setnull(ldt_chkin_time)
						ls_note = 'Không tìm thấy giờ chấm công vào hợp lệ'
					end if
					//-- tìm giờ chấm công ra hợp lệ--//
					ls_findStr = "object_id = " + string(ldb_staff_id) + " and string(check_time,'yyyymmddhhmmss') >= '" + string(ldt_shift_out_fr,'yyyymmddhhmmss') + "' and string(check_time,'yyyymmddhhmmss') <=  '"  + string(ldt_shift_out_to,'yyyymmddhhmmss') + "'"
					lds_data.setfilter(ls_findStr )
					lds_data.filter( )	
					if lds_data.rowcount( ) > 0 then
						ldt_chkout_time = lds_data.getitemdatetime(  lds_data.rowcount( ), 'check_time') //-- lấy giờ quyết sau cùng --//
						if ldt_chkin_time = ldt_chkout_time then 
							setnull(ldt_chkout_time)
							ls_note = 'Không tìm thấy giờ chấm công ra hợp lệ'
						end if
					else
						setnull(ldt_chkout_time)
						if isnull(ldt_chkin_time) then 
							ls_note = 'Không tìm thấy giờ chấm công cả vào và ra hợp lệ'
						else
							ls_note = 'Không tìm thấy giờ chấm công ra hợp lệ'
						end if
					end if
					
					//-- OT time --//
					if ls_note = '' then //-- chấm công hợp lệ đủ đệ tính công --//
						ldt_ot_b4 = lds_shift.getitemdatetime( li_row,'ot_time_b4work')	
//						ls_tmp = string(ldt_ot_b4,'hh:mm:ss')
//						if not isnull(ldt_ot_b4) and ls_tmp <> '00:00:00' then
							ldt_ot_b4 = datetime(ld_workdate, time(ldt_ot_b4))	
							if ldt_chkin_time <= ldt_ot_b4 and ldt_ot_b4 < ldt_shift_in then
								ldb_minute_b4_ot = lc_datetime.f_minuteafter( ldt_ot_b4, ldt_shift_in)
								if ldb_minute_b4_ot > 50 then
									ldb_ot_hour = ldb_minute_b4_ot / 60
								end if
							else
								ldb_minute_b4_ot = lc_datetime.f_minuteafter( ldt_chkin_time, ldt_shift_in)
								if ldb_minute_b4_ot > 50 then
									ldb_ot_hour =  round(max(ldb_minute_b4_ot,0)/60, 1)
								end if
							end if							
//						end if
						ldt_ot_after = lds_shift.getitemdatetime( li_row,'ot_time_afterwork')	
//						ls_tmp = string(ldt_ot_after,'hh:mm:ss')
//						if not isnull(ldt_ot_after) and ls_tmp <> '00:00:00' then 
							if ldt_ot_after >= lds_shift.getitemdatetime( li_row,'T_TIME') then
								ldt_ot_after = datetime(ld_workdate, time(ldt_ot_after))	
							else
								ldt_ot_after = datetime( RelativeDate( ld_workdate, 1 ), time(ldt_ot_after))	
							end if
							
							if ldt_chkout_time >= ldt_ot_after and ldt_shift_out < ldt_ot_after  then
								ldb_minute_at_ot = lc_datetime.f_minuteafter( ldt_shift_out, ldt_ot_after)
								if ldb_minute_at_ot > 50 then
									ldb_ot_hour += ldb_minute_at_ot / 60
								end if
							else
								ldb_minute_at_ot = lc_datetime.f_minuteafter( ldt_shift_out, ldt_chkout_time)
								if ldb_minute_at_ot > 50 then
									ldb_ot_hour += round(max(ldb_minute_at_ot,0) / 60,0)
								end if
							end if							
//						end if
						li_late_minute = max(lc_datetime.f_minuteafter( ldt_shift_in, ldt_chkin_time),0)
						li_early_minute =  max(lc_datetime.f_minuteafter( ldt_chkout_time, ldt_shift_out),0)
						
						li_come_tolerance_min =  lds_shift.getitemnumber( li_row,'latecome_tolerance_min') 
						if isnull(li_come_tolerance_min) then li_come_tolerance_min = 0
						li_leave_tolerance_min =  lds_shift.getitemnumber( li_row,'earlyleave_tolerance_min') 
						if isnull(li_leave_tolerance_min) then li_leave_tolerance_min = 0
						
						if li_come_tolerance_min >= lc_datetime.f_minuteafter( ldt_shift_in, ldt_chkin_time)  &
							and  li_leave_tolerance_min >= lc_datetime.f_minuteafter( ldt_chkout_time, ldt_shift_out)  then							
								ldb_work_hour = lds_shift.getitemnumber( li_row,'working_hours')
								ldb_work_count = lds_shift.getitemnumber( li_row,'working_count')
						else
							if ldt_shift_in <= ldt_chkin_time  and ldt_chkout_time <= ldt_shift_out  then 
								ldb_work_hour = round( lc_datetime.f_minuteafter( ldt_chkin_time, ldt_chkout_time)  / 60 , 1)											
							elseif ldt_chkin_time < ldt_shift_in then
								ldb_work_hour = round( lc_datetime.f_minuteafter( ldt_shift_in, ldt_chkout_time)  / 60 , 1)										
							else
								ldb_work_hour = round( lc_datetime.f_minuteafter( ldt_chkin_time, ldt_shift_out) / 60 , 1)										
							end if
							if ldb_work_hour > 4 then //-- trừ giờ nghỉ trưa nếu làm quá nửa ngày --//
								li_break_min =  lds_shift.getitemnumber( li_row,'break_minute')
								if isnull(li_break_min) then li_break_min = 0														
								ldb_work_hour = ldb_work_hour - li_break_min/60
							end if
							ldb_work_count = round(ldb_work_hour / 8	, 3)	
						end if
						

					else //-- không đủ thông tin tính công--//
						setnull(ldb_work_hour)
						setnull(ldb_work_count)
						setnull(ldb_ot_hour)
						setnull(ldb_ot_coefficient)				
						setnull(li_late_minute)
						setnull(li_early_minute)
//						setnull(ldb_shift_id)
//						setnull(ldb_shift_coefficient)								
					end if
					ldb_shift_id = lds_shift.getitemnumber( li_row,'shift_id')
					ldb_shift_coefficient = lds_shift.getitemnumber( li_row,'shift_coefficient')
					ldb_ot_coefficient = lds_shift.getitemnumber( li_row,'ot_coefficient')
					//-- insert timesheet --//
					this.f_insert_timesheet(lds_timesheet, ldb_staff_id, ld_workdate, ldb_shift_id ,li_late_minute ,li_early_minute, ldb_shift_coefficient, ldt_shift_in, ldt_shift_out, ldt_chkin_time, ldt_chkout_time, ldb_work_hour, ldb_work_count, ldb_ot_hour, ldb_ot_coefficient, ls_note)
					ldb_ot_hour = 0
				NEXT						
			end if
		
		ld_workdate = RelativeDate ( ld_workdate, 1 )
	Loop	
next
//-- tắt thanh tình trạng-//

if lds_timesheet.update( true, false) = 1 then
	commit using rt_transaction;
else
	rollback using rt_transaction;
	destroy lds_shift
	destroy lds_data
	destroy lds_timesheet 
	
	gf_messagebox('m.b_hr_timesheet.02','Thông báo','Không cập nhật được dữ liệu:v@'+rt_transaction.sqlerrtext,'stop','ok',1)
	return -1
end if
destroy lds_shift
destroy lds_data
destroy lds_timesheet 

this.of_show_progress( 101)

return 1
end function

public function integer of_set_progress_text (string vs_text);iw_progress.f_set_text_progress( vs_text)
return 1
end function

public function integer f_calc_timesheet_aia (double vdb_dept_id, date vd_fdate, date vd_tdate, ref t_transaction rt_transaction);
If isnull(vdb_dept_id) then vdb_dept_id = 0

//-- Xoa dữ liệu cũ tính lại --//
if vdb_dept_id = 0 then
	DELETE timesheet_line where branch_id = :gdb_branch and work_date between :vd_fdate and :vd_tdate using rt_transaction;
	//-- insert dữ liệu mới --//
	INSERT INTO timesheet_line (  ID  ,
											  COMPANY_ID  ,
											  BRANCH_ID  ,
											  CREATED_BY    ,
											  CREATED_DATE  ,
											  LAST_MDF_BY    ,
											  LAST_MDF_DATE ,
											  STAFF_ID    ,
											  WORK_DATE   ,
											  WORK_HOUR      ,
											  CHECKIN_TIME   ,
											  CHECKOUT_TIME  ,
											  SHIFT_ID   ,
											  DEPT_ID  ,
											  SHIFT_IN_TIME ,
											  SHIFT_OUT_TIME  ,
											  NOTE )
	select  SEQ_TABLE_ID.nextval, :gi_user_comp_id, :gdb_branch,  :gi_userid, sysdate,  :gi_userid, sysdate, 
			staff_id, work_Date, work_hour,in_time, out_time, nvl(shift_id, shift_id_assign) , V_TIMESHEET_CALC.dept_id, f_time, t_time , note
	FROM V_TIMESHEET_CALC
	where V_TIMESHEET_CALC.branch_id = :gdb_branch
	using rt_transaction;		
elseif vdb_dept_id > 0 then
	DELETE timesheet_line where branch_id = :gdb_branch and work_date between :vd_fdate and :vd_tdate and dept_id = :vdb_dept_id using rt_transaction;
	//-- insert dữ liệu mới --//
	INSERT INTO timesheet_line (  ID  ,
											  COMPANY_ID  ,
											  BRANCH_ID  ,
											  CREATED_BY    ,
											  CREATED_DATE  ,
											  LAST_MDF_BY    ,
											  LAST_MDF_DATE ,
											  STAFF_ID    ,
											  WORK_DATE   ,
											  WORK_HOUR      ,
											  CHECKIN_TIME   ,
											  CHECKOUT_TIME  ,
											  SHIFT_ID   ,
											  DEPT_ID  ,
											  SHIFT_IN_TIME ,
											  SHIFT_OUT_TIME  ,
											  NOTE )
	select  SEQ_TABLE_ID.nextval, :gi_user_comp_id, :gdb_branch,  :gi_userid, sysdate,  :gi_userid, sysdate, 
			staff_id, work_Date, work_hour,in_time, out_time, nvl(shift_id, shift_id_assign) , V_TIMESHEET_CALC.dept_id, f_time, t_time , note
	FROM V_TIMESHEET_CALC
	where V_TIMESHEET_CALC.branch_id = :gdb_branch and V_TIMESHEET_CALC.dept_id = :vdb_dept_id
	using rt_transaction;	
end if
	


if rt_transaction.sqlcode = 0 then
	commit using rt_transaction;
else
	rollback using rt_transaction;
	return -1
end if
			
return 1
end function

public function string f_get_staff_name (long vl_acctno);
string	ls_name

SELECT name into :ls_name
from object join staff on staff.object_ref_id = object.id and staff.staff_acctno = :vl_acctno using sqlca;

if sqlca.sqlcode = 0 then
	return ls_name
else 
	return ''
end if
end function

public function integer f_get_staff_code_n_name (long vl_acctno, ref string rs_code, ref string rs_name);int		li_cnt
string	ls_name

select count(id) into :li_cnt
from  staff where staff.staff_acctno = :vl_acctno using sqlca;

if li_cnt = 1 then
	SELECT name , code into :rs_name, :rs_code
	from object join staff on staff.object_ref_id = object.id and staff.staff_acctno = :vl_acctno using sqlca;
	return 1
elseif li_cnt > 1 then
	gf_messagebox('m.b_hr_instantiate.f_get_staff_code_n_name.01','Thông báo','ID vân tay sau dùng chung cho nhiều nhân viên:@'+string(vl_acctno),'stop','ok',1)
	return -1
else 
	return  0
end if
end function

public function integer f_calc_timesheet_tm (double vdb_dept_id, double vdb_staff_id, date vd_fdate, date vd_tdate, ref t_transaction rt_transaction);
If isnull(vdb_dept_id) then vdb_dept_id = 0
If isnull(vdb_staff_id) then vdb_staff_id = 0

//-- Xoa dữ liệu cũ tính lại --//
if vdb_staff_id > 0 then
	DELETE timesheet_line where branch_id = :gdb_branch
									and work_date between :vd_fdate and :vd_tdate 
									and staff_id = :vdb_staff_id									
									and coalesce(manual_yn,'N') = 'N'
									and coalesce(APPROVED_YN,'N') = 'N'
									using rt_transaction;
	//-- insert dữ liệu mới --//
	INSERT INTO timesheet_line (  ID  ,
											  COMPANY_ID  ,
											  BRANCH_ID  ,
											  CREATED_BY    ,
											  CREATED_DATE  ,
											  LAST_MDF_BY    ,
											  LAST_MDF_DATE ,
											  STAFF_ID    ,
											  WORK_DATE   ,
											  WORK_HOUR      ,
											  CHECKIN_TIME   ,
											  CHECKOUT_TIME  ,
											  SHIFT_ID   ,
											  DEPT_ID  ,
											  SHIFT_IN_TIME ,
											  SHIFT_OUT_TIME  ,
											  NOTE )
	select  SEQ_TABLE_ID.nextval, :gi_user_comp_id, :gdb_branch,  :gi_userid, sysdate,  :gi_userid, sysdate, 
			staff_id, work_Date, work_hour,in_time, out_time, nvl(shift_id, shift_id_assign) , V_TIMESHEET_CALC.dept_id, f_time, t_time , note
	FROM V_TIMESHEET_CALC
	where V_TIMESHEET_CALC.branch_id = :gdb_branch
			and V_TIMESHEET_CALC.staff_id = :vdb_staff_id		
			and not exists (select null from timesheet_line t where t.staff_id = V_TIMESHEET_CALC.staff_id
																and t.work_Date = V_TIMESHEET_CALC.work_Date
																and t.DEPT_ID = V_TIMESHEET_CALC.dept_id
																and t.SHIFT_ID = coalesce(V_TIMESHEET_CALC.shift_id,V_TIMESHEET_CALC.shift_id_assign ))
	using rt_transaction;	
elseif vdb_dept_id > 0 then
	DELETE timesheet_line where branch_id = :gdb_branch
									and work_date between :vd_fdate and :vd_tdate 
									and dept_id = :vdb_dept_id
									and coalesce(manual_yn,'N') = 'N'
									and coalesce(APPROVED_YN,'N') = 'N'
									using rt_transaction;
	//-- insert dữ liệu mới --//
	INSERT INTO timesheet_line (  ID  ,
											  COMPANY_ID  ,
											  BRANCH_ID  ,
											  CREATED_BY    ,
											  CREATED_DATE  ,
											  LAST_MDF_BY    ,
											  LAST_MDF_DATE ,
											  STAFF_ID    ,
											  WORK_DATE   ,
											  WORK_HOUR      ,
											  CHECKIN_TIME   ,
											  CHECKOUT_TIME  ,
											  SHIFT_ID   ,
											  DEPT_ID  ,
											  SHIFT_IN_TIME ,
											  SHIFT_OUT_TIME  ,
											  NOTE )
	select  SEQ_TABLE_ID.nextval, :gi_user_comp_id, :gdb_branch,  :gi_userid, sysdate,  :gi_userid, sysdate, 
			staff_id, work_Date, work_hour,in_time, out_time, nvl(shift_id, shift_id_assign) , V_TIMESHEET_CALC.dept_id, f_time, t_time , note
	FROM V_TIMESHEET_CALC
	where V_TIMESHEET_CALC.branch_id = :gdb_branch
			and V_TIMESHEET_CALC.dept_id = :vdb_dept_id
			and not exists (select null from timesheet_line t where t.staff_id = V_TIMESHEET_CALC.staff_id
																and t.work_Date = V_TIMESHEET_CALC.work_Date
																and t.DEPT_ID = V_TIMESHEET_CALC.dept_id
																and t.SHIFT_ID = coalesce(V_TIMESHEET_CALC.shift_id,V_TIMESHEET_CALC.shift_id_assign ))
	using rt_transaction;	
else
	DELETE timesheet_line where branch_id = :gdb_branch 
									and work_date between :vd_fdate and :vd_tdate 
									and coalesce(manual_yn,'N') = 'N'
									and coalesce(APPROVED_YN,'N') = 'N'
									using rt_transaction;
	//-- insert dữ liệu mới --//
	INSERT INTO timesheet_line (  ID  ,
											  COMPANY_ID  ,
											  BRANCH_ID  ,
											  CREATED_BY    ,
											  CREATED_DATE  ,
											  LAST_MDF_BY    ,
											  LAST_MDF_DATE ,
											  STAFF_ID    ,
											  WORK_DATE   ,
											  WORK_HOUR      ,
											  CHECKIN_TIME   ,
											  CHECKOUT_TIME  ,
											  SHIFT_ID   ,
											  DEPT_ID  ,
											  SHIFT_IN_TIME ,
											  SHIFT_OUT_TIME  ,
											  NOTE )
	select  SEQ_TABLE_ID.nextval, :gi_user_comp_id, :gdb_branch,  :gi_userid, sysdate,  :gi_userid, sysdate, 
			staff_id, work_Date, work_hour,in_time, out_time, coalesce(shift_id, shift_id_assign) , V_TIMESHEET_CALC.dept_id, f_time, t_time , note
	FROM V_TIMESHEET_CALC
	where V_TIMESHEET_CALC.branch_id = :gdb_branch
	and not exists (select null from timesheet_line t where t.staff_id = V_TIMESHEET_CALC.staff_id
																and t.work_Date = V_TIMESHEET_CALC.work_Date
																and t.DEPT_ID = V_TIMESHEET_CALC.dept_id
																and t.SHIFT_ID = coalesce(V_TIMESHEET_CALC.shift_id,V_TIMESHEET_CALC.shift_id_assign ))
	using rt_transaction;		

end if
	


if rt_transaction.sqlcode = 0 then
	commit using rt_transaction;
else
	rollback using rt_transaction;
	return -1
end if
			
return 1
end function

on b_hr_instantiate.create
call super::create
end on

on b_hr_instantiate.destroy
call super::destroy
end on

