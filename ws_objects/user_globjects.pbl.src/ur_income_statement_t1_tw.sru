$PBExportHeader$ur_income_statement_t1_tw.sru
forward
global type ur_income_statement_t1_tw from b_report
end type
end forward

global type ur_income_statement_t1_tw from b_report
end type
global ur_income_statement_t1_tw ur_income_statement_t1_tw

forward prototypes
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_dwo_window ()
end prototypes

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default = 'dr_income_statement_t1_tw_form'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = 'dr_income_statement_t1_tw_form'
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
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Báo cáo kết quả hoạt động kinh doanh'
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

istr_dwo[2].s_dwo_default = 'dp_income_statement_t1_tw_form'
istr_dwo[2].s_dwo_form = 'dp_income_statement_t1_tw_form'
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

on ur_income_statement_t1_tw.create
call super::create
end on

on ur_income_statement_t1_tw.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'BALANCE_SHEET_TEMP'
ib_changed_dwo_4edit = false
is_display_model = '1ddlb_2d_1tp'
ib_display_text = true
is_object_title = 'Báo cáo kết quả hoạt động kinh doanh'

istr_actionpane[1].s_description = is_object_title

istr_report.s_dwo_report = 'dr_income_statement_t1_tw_form'
istr_report.s_pro_name = 'pkg_income_statement_t1_tw.pro_income_statement'
istr_report.sa_parm_name[1] = 'p_f_date_1'
istr_report.sa_parm_name[2] = 'p_t_date_1'
istr_report.sa_parm_name[3] = 'p_f_date_2'
istr_report.sa_parm_name[4] = 'p_t_date_2'
istr_report.sa_parm_name[5] = 'p_f_date_3'
istr_report.sa_parm_name[6] = 'p_t_date_3'
istr_report.sa_parm_name[7] = 'p_f_date_4'
istr_report.sa_parm_name[8] = 'p_t_date_4'
istr_report.sa_parm_name[9] = 'gs_sob'
istr_report.sa_parm_name[10] = 'gi_user_id'
istr_report.sa_parm_value[10] = gi_userid
istr_report.b_multi_thread = false

end event

event e_window_e_postopen;call super::e_window_e_postopen;t_dw_mpl	ldw_parm

ldw_parm = iw_display.f_get_dw(istr_dwo[2].s_dwo_default)
ldw_parm.setitem( ldw_parm.getrow(), 'a_user_id', gi_userid)
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.dynamic f_set_ii_leftpart_width(3800)
iw_display.dynamic f_set_ii_upperpart_height(300)
return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;string		ls_day, ls_month, ls_year, ls_date
int			li_year,li_day, li_month
date		ld_year
datetime	ldt_date
if AncestorReturnValue = 1 then return 1

if mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'dp_income_statement_t1_tw' then
	if vs_colname = 'p_f_date_1' then
		// Tháng này năm trước
		li_year = int(year(date(vs_editdata))) - 1
		li_month = int(month(date(vs_editdata)))
		li_day = int(day(date(vs_editdata)))
		ld_year = date(li_year,li_month,li_day)
		rpo_dw.setitem(vl_currentrow,'p_f_date_2',ld_year)
		// Lũy kế năm nay
		li_year = int(year(date(vs_editdata)))
		li_month = 01
		li_day = 01
		ld_year = date(li_year,li_month,li_day)
		rpo_dw.setitem(vl_currentrow,'p_f_date_3',ld_year)
		// Lũy kế năm trước
		li_year = int(year(date(vs_editdata))) - 1
		li_month = 01
		li_day = 01
		ld_year = date(li_year,li_month,li_day)
		rpo_dw.setitem(vl_currentrow,'p_f_date_4',ld_year)
		
	elseif vs_colname = 'p_t_date_1' then
		// Tháng này năm trước
		li_year = int(year(date(vs_editdata))) - 1
		li_month = int(month(date(vs_editdata)))
		li_day = int(day(date(vs_editdata)))
		ld_year = date(li_year,li_month,li_day)
		rpo_dw.setitem(vl_currentrow,'p_t_date_2',ld_year)
		// Lũy kế năm nay
		li_year = int(year(date(vs_editdata)))
		li_month = int(month(date(vs_editdata)))
		li_day = int(day(date(vs_editdata)))
		ld_year = date(li_year,li_month,li_day)
		rpo_dw.setitem(vl_currentrow,'p_t_date_3',ld_year)
		// Lũy kế năm trước
		li_year = int(year(date(vs_editdata))) - 1
		li_month = int(month(date(vs_editdata)))
		li_day = int(day(date(vs_editdata)))
		ld_year = date(li_year,li_month,li_day)
		rpo_dw.setitem(vl_currentrow,'p_t_date_4',ld_year)
		
	elseif vs_colname = 'view_1' then
		ldt_date = rpo_dw.getitemdatetime(vl_currentrow,'p_f_date_1')
		// Tháng này năm trước
		li_year = int(year(date(ldt_date))) - 1
		li_month = int(month(date(ldt_date)))
		li_day = int(day(date(ldt_date)))
		ld_year = date(li_year,li_month,li_day)
		rpo_dw.setitem(vl_currentrow,'p_f_date_2',ld_year)
		// Lũy kế năm nay
		li_year = int(year(date(ldt_date)))
		li_month = 01
		li_day = 01
		ld_year = date(li_year,li_month,li_day)
		rpo_dw.setitem(vl_currentrow,'p_f_date_3',ld_year)
		// Lũy kế năm trước
		li_year = int(year(date(ldt_date))) - 1
		li_month = 01
		li_day = 01
		ld_year = date(li_year,li_month,li_day)
		rpo_dw.setitem(vl_currentrow,'p_f_date_4',ld_year)
		
		ldt_date = rpo_dw.getitemdatetime(vl_currentrow,'p_t_date_1')
		// Tháng này năm trước
		li_year = int(year(date(ldt_date))) - 1
		li_month = int(month(date(ldt_date)))
		li_day = int(day(date(ldt_date)))
		ld_year = date(li_year,li_month,li_day)
		rpo_dw.setitem(vl_currentrow,'p_t_date_2',ld_year)
		// Lũy kế năm nay
		li_year = int(year(date(ldt_date)))
		li_month = int(month(date(ldt_date)))
		li_day = int(day(date(ldt_date)))
		ld_year = date(li_year,li_month,li_day)
		rpo_dw.setitem(vl_currentrow,'p_t_date_3',ld_year)
		// Lũy kế năm trước
		li_year = int(year(date(ldt_date))) - 1
		li_month = int(month(date(ldt_date)))
		li_day = int(day(date(ldt_date)))
		ld_year = date(li_year,li_month,li_day)
		rpo_dw.setitem(vl_currentrow,'p_t_date_4',ld_year)
	end if
end if
return AncestorReturnValue
end event

