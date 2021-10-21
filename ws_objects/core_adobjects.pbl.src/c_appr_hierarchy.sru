$PBExportHeader$c_appr_hierarchy.sru
forward
global type c_appr_hierarchy from s_object_display
end type
end forward

global type c_appr_hierarchy from s_object_display
end type
global c_appr_hierarchy c_appr_hierarchy

forward prototypes
public subroutine f_set_dwo_window ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_appr_hierarchy_grid'
istr_dwo[1].s_dwo_form = 'd_appr_hierarchy_form'
istr_dwo[1].s_dwo_grid = 'd_appr_hierarchy_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_appr_level_grid;'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Cây duyệt'

istr_dwo[2].s_dwo_default =  'd_appr_level_grid'
istr_dwo[2].s_dwo_form = 'd_appr_level_form'
istr_dwo[2].s_dwo_grid = 'd_appr_level_grid'
istr_dwo[2].b_detail = true
istr_dwo[2].s_dwo_master = 'd_appr_hierarchy_grid'
istr_dwo[2].s_master_keycol = 'ID'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[2].b_ref_table_yn  = true
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_focus_master = false
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_description = 'Cấp duyệt'

istr_dwo[3].s_dwo_default =  'd_applicable_rule_line_grid'
istr_dwo[3].s_dwo_form = ''
istr_dwo[3].s_dwo_grid = 'd_applicable_rule_line_grid'
istr_dwo[3].b_detail = true
istr_dwo[3].s_dwo_master = 'd_appr_level_grid'
istr_dwo[3].s_master_keycol = 'ID'
istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[3].b_ref_table_yn  = true
istr_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[3].b_insert = true
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = true
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_excel = true
istr_dwo[3].b_traceable = true
istr_dwo[3].b_focus_master = false
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].s_description = 'Điều kiện nhóm duyệt'

end subroutine

on c_appr_hierarchy.create
call super::create
end on

on c_appr_hierarchy.destroy
call super::destroy
end on

event constructor;call super::constructor;
is_table = 'POLICY_HDR'
ib_changed_dwo_4edit = true
this.ib_keyboardlocked = true
is_display_model = '3d'
is_object_title = 'Đăng ký cây duyệt'
istr_actionpane[1].s_description = is_object_title

end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;if left(rpo_dw.dataobject, 16) = 'd_appr_hierarchy' then
	return rpo_dw.setitem(vl_currentrow, 'type','appr')
end if
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;//--resize parm --//
iw_display.dynamic f_set_ii_upperpart_height(750)
iw_display.dynamic f_set_ii_gb_3_height(700)
return 0
end event

