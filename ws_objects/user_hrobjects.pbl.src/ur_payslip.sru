$PBExportHeader$ur_payslip.sru
forward
global type ur_payslip from b_report
end type
end forward

global type ur_payslip from b_report
end type
global ur_payslip ur_payslip

forward prototypes
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_dwo_window ()
end prototypes

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default = 'dr_payslip_form'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = 'dr_payslip_form'
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
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Phiếu lương tháng'
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

istr_dwo[2].s_dwo_default = 'dp_payslip_form'
istr_dwo[2].s_dwo_form = 'dp_payslip_form'
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

on ur_payslip.create
call super::create
end on

on ur_payslip.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = ''
ib_changed_dwo_4edit = false
is_display_model = '1ddlb_2d_1tp'
ib_display_text = true
is_object_title = 'Phiếu lương'

istr_actionpane[1].s_description = is_object_title

istr_report.s_dwo_report = 'dr_payslip_form'
//istr_report.s_pro_name = 'pkg_month_payroll.pro_insert_month_payroll'
//istr_report.sa_parm_name[1] ='gs_sob'
//istr_report.sa_parm_name[2] = 'gi_user_id'
//istr_report.sa_parm_value[2] = gi_userid
istr_report.b_multi_thread = false
istr_report.b_printpreview = true

istr_actionpane[1].s_button_name = 'b_saveas;b_add;b_insert;b_modify;b_save;b_query;b_execquery;b_filteron;b_refresh;b_delete;b_print;b_view_report;b_sendmail;'
//b_sendmail

end event

event e_window_e_postopen;call super::e_window_e_postopen;t_dw_mpl		ldw_parm
long				vl_row
string 			ls_currency_type,ls_options

ldw_parm = iw_display.f_get_dw(istr_dwo[2].s_dwo_default)
ls_currency_type = ldw_parm.getitemstring(ldw_parm.getrow(), 'p_currency_type')
if isnull(ls_currency_type) or ls_currency_type = '' then 
	ldw_parm.setitem(ldw_parm.getrow(), 'p_currency_type','BASE')
end if
ls_options = ldw_parm.getitemstring(ldw_parm.getrow(), 'p_options')
if isnull(ls_currency_type) or ls_currency_type = '' then 
	ldw_parm.setitem(ldw_parm.getrow(), 'p_options','TOTAL')
end if
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

event e_window_e_sendmail;/*
b_obj_instantiate	lb_ins
c_dwservice			lc_dwser
t_dw_mpl	ldw_print
string			ls_path


ldw_print = this.f_get_dw_print( )
if isvalid(ldw_print) or not isnull(ldw_print) then
ls_path = lb_ins.f_save_file_pdf( '1','2', 1, 1, 1, '', ldw_print)
//ls_path = ldw_print.event e_printnodialog( )
	if isnull(ls_path)then
		//message
	else
		lc_dwser.f_send_mail( '', '', '', '',ls_path , '',true)
		filedelete(ls_path)
		//gf_messagebox('m.s_w_multi.e_sendmail.01','Thông báo','Gửi mail thành công','exclamation','ok',1)
	end if
end if
*/

w_pdf		lw_pdf
t_dw_mpl	ldw_print

ldw_print = this.f_get_dw_print( )
if isvalid(ldw_print) or not isnull(ldw_print) then
	lw_pdf = create w_pdf
	lw_pdf.f_save_to_file_and_send_mail( ldw_print, 'datawindow.pdf','1','2', 'staff_name', 'kimlongpro88@gmail.com', '', 'Bảng công tháng', '')
end if
return 0
end event

