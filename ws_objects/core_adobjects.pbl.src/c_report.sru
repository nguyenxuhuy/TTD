$PBExportHeader$c_report.sru
forward
global type c_report from b_report
end type
end forward

global type c_report from b_report
end type
global c_report c_report

on c_report.create
call super::create
end on

on c_report.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'RECORD_ACCESS_HDR'
ib_changed_dwo_4edit = false
is_display_model = '1ddlb_1d_1tp'
ib_display_text = true
is_object_title = 'Báo cáo'

istr_actionpane[1].s_description = is_object_title




end event

