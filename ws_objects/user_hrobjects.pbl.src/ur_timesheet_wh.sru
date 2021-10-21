$PBExportHeader$ur_timesheet_wh.sru
forward
global type ur_timesheet_wh from b_report
end type
end forward

global type ur_timesheet_wh from b_report
end type
global ur_timesheet_wh ur_timesheet_wh

forward prototypes
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_dwo_window ()
public function integer f_set_detail_working_day ()
end prototypes

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default = 'dr_timesheet_hrs_aia_form'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = 'dr_timesheet_hrs_aia_form'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = ''
iastr_dwo_tabpage[1].str_dwo[1].b_master = false
iastr_dwo_tabpage[1].str_dwo[1].b_detail = false
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = false
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol = ''
iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol = ''
iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[1].s_pic_ref_table = 'legal_entity'
iastr_dwo_tabpage[1].str_dwo[1].s_pic_ref_field = 'id'
iastr_dwo_tabpage[1].str_dwo[1].s_pic_ref_colname = 'logo'
iastr_dwo_tabpage[1].str_dwo[1].b_insert = false
iastr_dwo_tabpage[1].str_dwo[1].b_update = false
iastr_dwo_tabpage[1].str_dwo[1].b_delete = false
iastr_dwo_tabpage[1].str_dwo[1].b_query = true
iastr_dwo_tabpage[1].str_dwo[1].b_print = true
iastr_dwo_tabpage[1].str_dwo[1].b_excel = true
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Bảng công tháng'
iastr_dwo_tabpage[1].str_dwo[1].s_gb_name = ''
end subroutine

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_report_parm_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_report_parm_grid'
istr_dwo[1].b_master = false
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = false
istr_dwo[1].b_excel = false
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].b_traceable = true
istr_dwo[1].s_description = 'Xem báo cáo theo điều kiện: '

istr_dwo[2].s_dwo_default = 'dp_timesheet_form'
istr_dwo[2].s_dwo_form = 'dp_timesheet_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = false
istr_dwo[2].b_insert = false
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = false
istr_dwo[2].b_query = true
istr_dwo[2].b_print = false
istr_dwo[2].b_excel = false
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = false
istr_dwo[2].s_description = 'Tham số của báo cáo: '
end subroutine

public function integer f_set_detail_working_day ();t_dw_mpl			ldw_parm, ldw_report
t_ds_db				lds_staff_working_day
b_obj_instantiate	lbo_Ins
c_datetime			lc_datetime
string				ls_staff_code, ls_where, ls_dept_code
date				ld_trans_date,ld_f_date,ld_t_date, ld_last, ld_s_date
any				laa_data[]
long				li_idx,li_ins_row,li_cnt, ll_fisrtmonth, ll_day_of_first_month, ll_idx1

ldw_parm = iw_display.f_get_dw(istr_dwo[2].s_dwo_default)
ldw_report =  iw_display.f_get_dw(iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default)

ls_staff_code = ldw_parm.getitemstring( ldw_parm.getrow(), 'p_staff_code')
ls_dept_code = ldw_parm.getitemstring( ldw_parm.getrow(), 'p_dept_code')
ld_f_date = date(ldw_parm.getitemdatetime(ldw_parm.getrow(),'p_s_date')) 
ld_s_date = ld_f_date
ld_t_date = date(ldw_parm.getitemdatetime(ldw_parm.getrow(),'p_e_date'))

if isnull(ld_f_date) or string(ld_f_date,'ddmmyyyy') = '01011900' or isnull(ld_t_date) or string(ld_t_date,'ddmmyyyy') = '01011900'  then
	gf_messagebox('m.ur_timesheet_wh.f_set_detail_working_day.01','Thông báo','Chưa chọn ngày xem báo cáo','exclamation','ok',1)
	return 0
else
	ls_where = 'work_date'
	laa_data[upperbound(laa_data) + 1 ] = '('+string(ld_f_date,gs_w_date_format ) + ':'+string(ld_t_date,gs_w_date_format ) +')'
end if

if lbo_Ins.f_is_branch_yn( this.classname()) then
	laa_data[upperbound(laa_data) + 1 ] = gdb_branch
	ls_where += ';branch_id'
end if
if ls_dept_code <> '' and not isnull(ls_dept_code) then
	laa_data[upperbound(laa_data) + 1 ] = ls_dept_code
	ls_where += ';dept_code'  
end if
if ls_staff_code <> '' and not isnull(ls_staff_code) then
	laa_data[upperbound(laa_data) + 1 ] = ls_staff_code
	ls_where += ';object_code'  
end if


lds_staff_working_day = create t_ds_db
lds_staff_working_day.dataobject = 'ds_timesheet_with_branch_rpt'
lds_staff_working_day.f_add_where(ls_where, laa_data[])
lds_staff_working_day.f_settransobject( it_transaction )
lds_staff_working_day.retrieve( )
lds_staff_working_day.setsort("branch_id a, dept_code a, object_code a , work_date a")
lds_staff_working_day.sort( )

ld_last = 	lc_datetime.f_lastdayofmonth(ld_s_date )
ll_fisrtmonth = month(ld_s_date)
ll_day_of_first_month = DaysAfter(ld_s_date, ld_last) 

if ldw_report.rowcount( ) > 0 then ldw_report.reset( )
ls_staff_code =''
for li_idx = 1 to lds_staff_working_day.rowcount()
	if ls_staff_code <> lds_staff_working_day.getitemstring( li_idx, 'object_code') then
		li_ins_row = ldw_report.insertrow( 0)
		ld_trans_date = ld_f_date
		li_cnt = 0
		Do While ld_trans_date <= ld_t_date
			li_cnt ++
			if li_cnt <= 31 then
				ldw_report.setitem( li_ins_row, 'name_' + string(li_cnt) , ld_trans_date )
			end if
			ld_trans_date = RelativeDate ( ld_trans_date, 1 )
		Loop
		ldw_report.setitem( li_ins_row, 'staff_code', lds_staff_working_day.getitemstring( li_idx, 'object_code'))
		ldw_report.setitem( li_ins_row, 'staff_name', lds_staff_working_day.getitemstring( li_idx, 'object_name'))
		ldw_report.setitem( li_ins_row, 'dept_name', lds_staff_working_day.getitemstring( li_idx, 'dept_code'))
		ldw_report.setitem( li_ins_row, 'branch_name', lds_staff_working_day.getitemstring( li_idx, 'branch_name'))
	end if

	ld_trans_date = date(lds_staff_working_day.getitemdatetime( li_idx, 'work_date'))
	if month(ld_trans_date) = ll_fisrtmonth then
		ll_idx1 =  DaysAfter(ld_s_date, ld_trans_date) + 1
	else
		ll_idx1 =  DaysAfter(ld_last, ld_trans_date) + ll_day_of_first_month				
	end if
	if ll_idx1 > 31 then continue 
	ldw_report.setitem( li_ins_row, 'sh_code_' + string(ll_idx1), string(lds_staff_working_day.getitemnumber( li_idx, 'work_hour')))
	
	ls_staff_code = lds_staff_working_day.getitemstring( li_idx, 'object_code')
next
ldw_report.groupcalc( )
return 0
end function

on ur_timesheet_wh.create
call super::create
end on

on ur_timesheet_wh.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = ''
ib_changed_dwo_4edit = false
is_display_model = '1ddlb_2d_1tp'
ib_display_text = true
is_object_title = 'Bảng công tháng'

istr_actionpane[1].s_description = is_object_title

istr_report.s_dwo_report = 'dr_timesheet_gopak_wh_form'
istr_report.s_pro_name = 'pkg_timesheet.pro_insert_timesheet'
istr_report.sa_parm_name[1] ='p_s_date'
istr_report.sa_parm_name[2] ='p_e_date'
istr_report.sa_parm_name[3] ='p_staff_code'
istr_report.sa_parm_name[4] ='p_dept_code'
istr_report.sa_parm_name[5] = 'gi_user_id'
istr_report.sa_parm_value[5] = gi_userid
istr_report.b_multi_thread = false
istr_report.b_printpreview = true

istr_actionpane[1].s_button_name = 'b_saveas;b_add;b_insert;b_modify;b_save;b_query;b_execquery;b_filteron;b_refresh;b_delete;b_print;b_view_report;b_sendmail;'
//b_sendmail

end event

event e_window_e_postopen;call super::e_window_e_postopen;t_dw_mpl		ldw_parm
long				vl_row
string 			ls_currency_type,ls_options

ldw_parm = iw_display.f_get_dw(istr_dwo[2].s_dwo_default)
ldw_parm.setitem( ldw_parm.rowcount(), 'v_type', 'all')
//ls_currency_type = ldw_parm.getitemstring(ldw_parm.getrow(), 'p_currency_type')
//if isnull(ls_currency_type) or ls_currency_type = '' then 
//	ldw_parm.setitem(ldw_parm.getrow(), 'p_currency_type','BASE')
//end if
//ls_options = ldw_parm.getitemstring(ldw_parm.getrow(), 'p_options')
//if isnull(ls_currency_type) or ls_currency_type = '' then 
//	ldw_parm.setitem(ldw_parm.getrow(), 'p_options','TOTAL')
//end if
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.dynamic f_set_ii_leftpart_width(3800)
iw_display.dynamic f_set_ii_upperpart_height(300)
return 0
end event

event e_action_ctrl_bttn;//b_sendmail;
//-- override --//

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
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify; b_filteron;b_query;b_refresh;b_delete;b_view_report;b_print;b_sendmail;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_filteron;b_query;b_refresh;b_delete;b_view_report;b_print;b_sendmail;'
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query; b_refresh;b_delete;b_view_report;b_print;b_sendmail;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query; b_refresh;b_delete;b_view_report;b_print;b_sendmail;'
					end if
				end if
			else				
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_view_report;b_print;b_sendmail;'
				else
					if ldw_focus.dataobject = 'd_report_parm_grid' then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_view_report;b_print;b_sendmail;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_saveas;b_view_report;b_print;b_sendmail;'
					end if
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
			istr_actionpane[li_idx].s_visible_buttons =   'b_unit_class;b_unit_conversion;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
			istr_actionpane[li_idx].s_visible_buttons =  'b_book; b_attach; b_note;b_doc_trace;b_user_trace;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then				
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_e_sendmail;w_pdf		lw_pdf
t_dw_mpl	ldw_print

ldw_print = this.f_get_dw_print( )
if isvalid(ldw_print) or not isnull(ldw_print) then
	lw_pdf = create w_pdf
	lw_pdf.f_save_to_file_and_send_mail( ldw_print, 'datawindow.pdf','1','2', 'staff_name', 'kimlongpro88@gmail.com', '', 'Bảng công tháng', '')
end if
return 0
end event

event e_window_e_view_report;//-- Override --//

this.f_set_detail_working_day( )
return 1
end event

event e_window_open;call super::e_window_open;t_dw_mpl	ldw_parm

ldw_parm= this.iw_display.f_get_dw( 'dp_timesheet_form')
this.iw_display.idw_focus = ldw_parm

return 0
end event

