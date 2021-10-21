$PBExportHeader$u_report.sru
forward
global type u_report from cl_report
end type
end forward

global type u_report from cl_report
end type
global u_report u_report

forward prototypes
public subroutine f_set_dwo_tabpage ()
end prototypes

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_report_test_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_report_test_grid'
iastr_dwo_tabpage[1].str_dwo[1].b_master = false
iastr_dwo_tabpage[1].str_dwo[1].b_detail = false
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = false
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol = ''
iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol = ''
iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[1].s_ref_table_field = ''
iastr_dwo_tabpage[1].str_dwo[1].b_insert = false
iastr_dwo_tabpage[1].str_dwo[1].b_update = false
iastr_dwo_tabpage[1].str_dwo[1].b_delete = false
iastr_dwo_tabpage[1].str_dwo[1].b_query = true
iastr_dwo_tabpage[1].str_dwo[1].b_print = true
iastr_dwo_tabpage[1].str_dwo[1].b_excel = true
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Báo cáo test 1'
iastr_dwo_tabpage[1].str_dwo[1].s_gb_name = ''


//mid(iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default,1,len(iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default) - 5)
//istr_dwo[2].s_dwo_default =  'd_report_test_grid'
//istr_dwo[2].s_dwo_form = 'd_report_test_grid'
//istr_dwo[2].s_dwo_grid = ''
//istr_dwo[2].b_master = false
//istr_dwo[2].b_insert = false
//istr_dwo[2].b_update = false
//istr_dwo[2].b_delete = false
//istr_dwo[2].b_query = true
//istr_dwo[2].b_print = true
//istr_dwo[2].b_excel = true
//istr_dwo[2].b_traceable = false
//istr_dwo[2].s_description = 'Báo cáo test 1'
end subroutine

on u_report.create
call super::create
end on

on u_report.destroy
call super::destroy
end on

event constructor;call super::constructor;istr_report.s_dwo_report = 'd_report_test_grid'
istr_report.s_pro_name = ''
//istr_report[1].sa_parm_name[1]
//istr_report[1].sa_parm_value[1]
istr_report.b_multi_thread = true
end event

