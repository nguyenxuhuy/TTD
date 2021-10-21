$PBExportHeader$c_staff.sru
forward
global type c_staff from s_object_display
end type
end forward

global type c_staff from s_object_display
end type
global c_staff c_staff

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_tabpage ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_object_staff_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_object_staff_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_staff_form;'
istr_dwo[1].b_ref_table_yn  = true
istr_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[1].s_dwo_shared = ''
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Nhân viên'
istr_dwo[1].s_gb_name = 'gb_6'

istr_dwo[2].s_dwo_default =  'd_staff_form'
istr_dwo[2].s_dwo_form = 'd_staff_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = true
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_master = 'd_object_staff_grid;'
istr_dwo[2].s_dwo_details = 'd_role_user_people_form;d_experience_staff_grid;d_education_staff_grid;d_skill_staff_grid;d_contract_staff_grid;d_insurance_staff_grid;d_relatives_staff_grid'
istr_dwo[2].s_master_keycol = 'ID'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[2].b_ref_table_yn  = true
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[2].b_relation_1_1 = true
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_focus_master = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_description = 'Nhân viên'
end subroutine

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'

end subroutine

public subroutine f_set_dwo_tabpage ();
iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
iastr_dwo_tabpage[1].i_upperpart_height  =730
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_role_user_people_form'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = 'd_role_user_people_form'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_source = ''
iastr_dwo_tabpage[1].str_dwo[1].s_col_source = ''
iastr_dwo_tabpage[1].str_dwo[1].s_col_target = ''
iastr_dwo_tabpage[1].str_dwo[1].b_master = false
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_staff_form;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[1].str_dwo[1].b_insert = true
iastr_dwo_tabpage[1].str_dwo[1].b_update = true
iastr_dwo_tabpage[1].str_dwo[1].b_delete = true
iastr_dwo_tabpage[1].str_dwo[1].b_query = true
iastr_dwo_tabpage[1].str_dwo[1].b_print = true
iastr_dwo_tabpage[1].str_dwo[1].b_excel = true
iastr_dwo_tabpage[1].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Chi tiết nhân viên'
iastr_dwo_tabpage[1].str_dwo[1].s_pic_ref_table = 'STAFF'
iastr_dwo_tabpage[1].str_dwo[1].s_pic_ref_field = 'OBJECT_REF_ID'
iastr_dwo_tabpage[1].str_dwo[1].s_pic_ref_colname = 'photo'

iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_display_model = '1d'
iastr_dwo_tabpage[2].i_upperpart_height  =730
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_relatives_staff_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = 'd_relatives_staff_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_source = ''
iastr_dwo_tabpage[2].str_dwo[1].s_col_source = ''
iastr_dwo_tabpage[2].str_dwo[1].s_col_target = ''
iastr_dwo_tabpage[2].str_dwo[1].b_master = false
iastr_dwo_tabpage[2].str_dwo[1].b_detail = true
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_staff_form;'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[2].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[2].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[2].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[2].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[2].str_dwo[1].b_insert = true
iastr_dwo_tabpage[2].str_dwo[1].b_update = true
iastr_dwo_tabpage[2].str_dwo[1].b_delete = true
iastr_dwo_tabpage[2].str_dwo[1].b_query = true
iastr_dwo_tabpage[2].str_dwo[1].b_print = true
iastr_dwo_tabpage[2].str_dwo[1].b_excel = true
iastr_dwo_tabpage[2].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[2].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[2].str_dwo[1].s_description ='Nhân thân'

iastr_dwo_tabpage[3].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[3].s_display_model = '1d'
iastr_dwo_tabpage[3].i_upperpart_height  =730
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_default =  'd_experience_staff_grid'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_grid = 'd_experience_staff_grid'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_source = ''
iastr_dwo_tabpage[3].str_dwo[1].s_col_source = ''
iastr_dwo_tabpage[3].str_dwo[1].s_col_target = ''
iastr_dwo_tabpage[3].str_dwo[1].b_master = false
iastr_dwo_tabpage[3].str_dwo[1].b_detail = true
iastr_dwo_tabpage[3].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_master = 'd_staff_form;'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[3].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[3].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[3].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[3].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[3].str_dwo[1].b_insert = true
iastr_dwo_tabpage[3].str_dwo[1].b_update = true
iastr_dwo_tabpage[3].str_dwo[1].b_delete = true
iastr_dwo_tabpage[3].str_dwo[1].b_query = true
iastr_dwo_tabpage[3].str_dwo[1].b_print = true
iastr_dwo_tabpage[3].str_dwo[1].b_excel = true
iastr_dwo_tabpage[3].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[3].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[3].str_dwo[1].s_description ='Kinh nghiệm làm việc'

iastr_dwo_tabpage[4].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[4].s_display_model = '1d'
iastr_dwo_tabpage[4].i_upperpart_height  =730
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_default =  'd_education_staff_grid'
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_grid = 'd_education_staff_grid'
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_source = ''
iastr_dwo_tabpage[4].str_dwo[1].s_col_source = ''
iastr_dwo_tabpage[4].str_dwo[1].s_col_target = ''
iastr_dwo_tabpage[4].str_dwo[1].b_master = false
iastr_dwo_tabpage[4].str_dwo[1].b_detail = true
iastr_dwo_tabpage[4].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_master = 'd_staff_form;'
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[4].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[4].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[4].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[4].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[4].str_dwo[1].b_insert = true
iastr_dwo_tabpage[4].str_dwo[1].b_update = true
iastr_dwo_tabpage[4].str_dwo[1].b_delete = true
iastr_dwo_tabpage[4].str_dwo[1].b_query = true
iastr_dwo_tabpage[4].str_dwo[1].b_print = true
iastr_dwo_tabpage[4].str_dwo[1].b_excel = true
iastr_dwo_tabpage[4].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[4].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[4].str_dwo[1].s_description ='Quá trình học tập'

iastr_dwo_tabpage[5].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[5].s_display_model = '1d'
iastr_dwo_tabpage[5].i_upperpart_height  =730
iastr_dwo_tabpage[5].str_dwo[1].s_dwo_default =  'd_skill_staff_grid'
iastr_dwo_tabpage[5].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[5].str_dwo[1].s_dwo_grid = 'd_skill_staff_grid'
iastr_dwo_tabpage[5].str_dwo[1].s_dwo_source = ''
iastr_dwo_tabpage[5].str_dwo[1].s_col_source = ''
iastr_dwo_tabpage[5].str_dwo[1].s_col_target = ''
iastr_dwo_tabpage[5].str_dwo[1].b_master = false
iastr_dwo_tabpage[5].str_dwo[1].b_detail = true
iastr_dwo_tabpage[5].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[5].str_dwo[1].s_dwo_master = 'd_staff_form;'
iastr_dwo_tabpage[5].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[5].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[5].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[5].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[5].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[5].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[5].str_dwo[1].b_insert = true
iastr_dwo_tabpage[5].str_dwo[1].b_update = true
iastr_dwo_tabpage[5].str_dwo[1].b_delete = true
iastr_dwo_tabpage[5].str_dwo[1].b_query = true
iastr_dwo_tabpage[5].str_dwo[1].b_print = true
iastr_dwo_tabpage[5].str_dwo[1].b_excel = true
iastr_dwo_tabpage[5].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[5].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[5].str_dwo[1].s_description ='Kỹ năng'

iastr_dwo_tabpage[6].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[6].s_display_model = '1d'
iastr_dwo_tabpage[6].i_upperpart_height  =730
iastr_dwo_tabpage[6].str_dwo[1].s_dwo_default =  'd_contract_staff_grid'
iastr_dwo_tabpage[6].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[6].str_dwo[1].s_dwo_grid = 'd_contract_staff_grid'
iastr_dwo_tabpage[6].str_dwo[1].s_dwo_source = ''
iastr_dwo_tabpage[6].str_dwo[1].s_col_source = ''
iastr_dwo_tabpage[6].str_dwo[1].s_col_target = ''
iastr_dwo_tabpage[6].str_dwo[1].b_master = false
iastr_dwo_tabpage[6].str_dwo[1].b_detail = true
iastr_dwo_tabpage[6].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[6].str_dwo[1].s_dwo_master = 'd_staff_form;'
iastr_dwo_tabpage[6].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[6].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[6].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[6].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[6].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[6].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[6].str_dwo[1].b_insert = true
iastr_dwo_tabpage[6].str_dwo[1].b_update = true
iastr_dwo_tabpage[6].str_dwo[1].b_delete = true
iastr_dwo_tabpage[6].str_dwo[1].b_query = true
iastr_dwo_tabpage[6].str_dwo[1].b_print = true
iastr_dwo_tabpage[6].str_dwo[1].b_excel = true
iastr_dwo_tabpage[6].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[6].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[6].str_dwo[1].s_description ='Hợp đồng'

iastr_dwo_tabpage[7].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[7].s_display_model = '1d'
iastr_dwo_tabpage[7].i_upperpart_height  =730
iastr_dwo_tabpage[7].str_dwo[1].s_dwo_default =  'd_insurance_staff_grid'
iastr_dwo_tabpage[7].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[7].str_dwo[1].s_dwo_grid = 'd_insurance_staff_grid'
iastr_dwo_tabpage[7].str_dwo[1].s_dwo_source = ''
iastr_dwo_tabpage[7].str_dwo[1].s_col_source = ''
iastr_dwo_tabpage[7].str_dwo[1].s_col_target = ''
iastr_dwo_tabpage[7].str_dwo[1].b_master = false
iastr_dwo_tabpage[7].str_dwo[1].b_detail = true
iastr_dwo_tabpage[7].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[7].str_dwo[1].s_dwo_master = 'd_staff_form;'
iastr_dwo_tabpage[7].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[7].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[7].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[7].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[7].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[7].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[7].str_dwo[1].b_insert = true
iastr_dwo_tabpage[7].str_dwo[1].b_update = true
iastr_dwo_tabpage[7].str_dwo[1].b_delete = true
iastr_dwo_tabpage[7].str_dwo[1].b_query = true
iastr_dwo_tabpage[7].str_dwo[1].b_print = true
iastr_dwo_tabpage[7].str_dwo[1].b_excel = true
iastr_dwo_tabpage[7].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[7].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[7].str_dwo[1].s_description ='Bảo hiểm'
end subroutine

event constructor;call super::constructor;is_table = 'staff'
ib_changed_dwo_4edit = false
is_display_model = '2dgb_1tp'
ib_display_text = false
is_object_title = 'Nhân viên'

istr_actionpane[1].s_description = is_object_title
end event

on c_staff.create
call super::create
end on

on c_staff.destroy
call super::destroy
end on

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;t_dw_mpl		ldw_handle

if pos(rpo_dw.dataobject, 'd_object_') > 0 then
	ldw_handle = iw_display.dynamic f_get_dw('d_staff_form')
	ldw_handle.event e_addrow()
//	ldw_handle = iw_display.dynamic f_get_dw('d_role_user_people_form')
//	ldw_handle.event e_addrow()
elseif rpo_dw.dataobject = 'd_staff_form' then
	
elseif rpo_dw.dataobject = iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default then
	rpo_dw.setitem(vl_currentrow,'RELATIVE_YN','N')
elseif rpo_dw.dataobject = iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default then
	rpo_dw.setitem(vl_currentrow,'RELATIVE_YN','Y')
end if
return 0
end event

event e_window_open;call super::e_window_open;t_dw_mpl			ldw_main
any				laa_value[]


ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '=STAFF'
ldw_main.f_add_where('object_ref_table;',laa_value[])

ldw_main = iw_display.f_get_dw(iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default)
laa_value[1] = 'Y'
ldw_main.f_add_where('RELATIVE_YN;',laa_value[])


return 0
end event

event e_dw_e_postitemchanged;call super::e_dw_e_postitemchanged;t_dw_mpl		ldw_handle
double			ldb_dept_id, ldb_post_id 
string				ls_deptcode, ls_deptname, ls_postCode
long					li_staff_acctno

if pos(rpo_dw.dataobject, 'd_object_') > 0 then
	ldw_handle = iw_display.dynamic f_get_dw('d_staff_form')
	
	if vs_colname = 'dept_code' then
		ldb_dept_id = rpo_dw.getitemnumber(vl_currentrow, 'dept_id')
		ls_deptcode = rpo_dw.getitemstring(vl_currentrow, 'dept_code')
		ls_deptname = rpo_dw.getitemstring(vl_currentrow, 'dept_name')
		li_staff_acctno = rpo_dw.getitemnumber(vl_currentrow, 'staff_acctno')
		
		ldw_handle.setitem(ldw_handle.getrow(), 'dept_id',ldb_dept_id)
		ldw_handle.setitem(ldw_handle.getrow(), 'dept_code',ls_deptcode)
		ldw_handle.setitem(ldw_handle.getrow(), 'dept_name',ls_deptname)
		ldw_handle.setitem(ldw_handle.getrow(), 'staff_acctno',li_staff_acctno)		
	elseif vs_colname = 'position_code' then
		ldb_post_id = rpo_dw.getitemnumber(vl_currentrow, 'position_id')
		ls_postCode = rpo_dw.getitemstring(vl_currentrow, 'position_code')
		
		ldw_handle.setitem(ldw_handle.getrow(), 'position_id',ldb_post_id)
		ldw_handle.setitem(ldw_handle.getrow(), 'position_code',ls_postCode)
	elseif vs_colname = 'staff_acctno' then
		ldw_handle.setitem(ldw_handle.getrow(), 'staff_acctno',long(vs_editdata))	
	end if
end if
return 0
end event

event e_dw_e_vscroll;call super::e_dw_e_vscroll;
if rpo_dw.dataobject = 'd_role_user_people_form' then
	return 0
end if
return ancestorreturnvalue
end event

event e_window_e_preopen;call super::e_window_e_preopen;//-- set resize parm --//
iw_display.F_SET_II_upperpart_height( 1/2)
iw_display.f_set_ii_fixedpart1_height(1/2*1/3)

return ancestorreturnvalue
end event

