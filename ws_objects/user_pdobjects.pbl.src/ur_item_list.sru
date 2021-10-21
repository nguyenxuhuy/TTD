$PBExportHeader$ur_item_list.sru
forward
global type ur_item_list from b_report
end type
end forward

global type ur_item_list from b_report
end type
global ur_item_list ur_item_list

forward prototypes
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_dwo_window ()
end prototypes

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default = 'dr_item_list_thm_form'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = 'dr_item_list_thm_form'
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
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Danh mục hàng hoá'
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

istr_dwo[2].s_dwo_default = 'dp_item_list_form'
istr_dwo[2].s_dwo_form = 'dp_item_list_form'
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

on ur_item_list.create
call super::create
end on

on ur_item_list.destroy
call super::destroy
end on

event constructor;call super::constructor;//is_table = 'OBJECT'
ib_changed_dwo_4edit = false
is_display_model = '1ddlb_2d_1tp'
ib_display_text = true
is_object_title = 'Danh muc hàng hoá'

istr_actionpane[1].s_description = is_object_title

istr_report.s_dwo_report = 'dr_item_list_thm_form'
istr_report.b_multi_thread = false

end event

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.f_set_ii_leftpart_width(3/4)
iw_display.f_set_ii_upperpart_height(1/10)
return 0
end event

event e_dw_e_preretrieve;call super::e_dw_e_preretrieve;t_dw_mpl	ldw_report,ldw_parm
string			ls_filter
date			ld_f_date,ld_t_date


if iw_display.f_get_ib_opening( ) then return 0
ldw_report = iw_display.f_get_dw( iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default)
ldw_parm =  iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
ld_f_date = date(ldw_parm.getitemdatetime( 1, 'f_date'))
if isnull(ld_f_date) then ld_f_date = date('01/01/1990')
ld_t_date = date(ldw_parm.getitemdatetime( 1, 't_date'))
if isnull(ld_t_date) then ld_t_date = date('01/01/1990')
if ld_f_date > date('01/01/1990') and ld_t_date > date('01/01/1990') then
	ls_filter = "f_date between date('"+ string(ld_f_date)+"') and date('"+string(ld_t_date)+"')"
end if
ldw_report.setfilter( ls_filter)
return 0
end event

