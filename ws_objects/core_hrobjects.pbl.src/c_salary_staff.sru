$PBExportHeader$c_salary_staff.sru
forward
global type c_salary_staff from s_object_display
end type
end forward

global type c_salary_staff from s_object_display
end type
global c_salary_staff c_salary_staff

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_related ()
public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[])
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_object_staff_salary_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_object_staff_salary_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_document_salary_grid;d_labor_contract_form;'
istr_dwo[1].b_ref_table_yn  = false
istr_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].b_traceable = true
istr_dwo[1].s_description = 'Nhân viên'
istr_dwo[1].s_gb_name = ''


istr_dwo[2].s_dwo_default =  'd_document_salary_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_document_salary_grid'
istr_dwo[2].b_detail = true
istr_dwo[2].b_master = true
istr_dwo[2].s_dwo_master = 'd_object_staff_salary_grid;'
istr_dwo[2].s_dwo_details = 'd_payroll_line_grid'
istr_dwo[2].b_relation_1_1 = false
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
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].b_focus_master = false
istr_dwo[2].s_description = 'Lược sử lương'
istr_dwo[2].s_gb_name = ''
//istr_dwo[2].s_pic_ref_table = 'LEGAL_ENTITY'
//istr_dwo[2].s_pic_ref_field = 'object_ref_id'
//istr_dwo[2].s_pic_ref_colname = 'LOGO'

istr_dwo[3].s_dwo_default =  'd_labor_contract_form'
istr_dwo[3].s_dwo_form = 'd_labor_contract_form'
istr_dwo[3].s_dwo_grid = ''
istr_dwo[3].b_detail = false
istr_dwo[3].b_master = false
istr_dwo[3].s_dwo_master = ''
istr_dwo[3].s_dwo_details = ''
istr_dwo[3].b_relation_1_1 = true
istr_dwo[3].s_master_keycol = ''
istr_dwo[3].s_detail_keycol = ''
istr_dwo[3].b_ref_table_yn  = false
istr_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[3].b_insert = false
istr_dwo[3].b_update = false
istr_dwo[3].b_delete = false
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_excel = true
istr_dwo[3].b_traceable = true
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].s_description = 'Thông tin hợp đồng'
istr_dwo[3].s_gb_name = ''

istr_dwo[4].s_dwo_default =  'd_payroll_line_grid'
istr_dwo[4].s_dwo_form = ''
istr_dwo[4].s_dwo_grid = 'd_payroll_line_grid'
istr_dwo[4].b_detail = true
istr_dwo[4].b_master = false
istr_dwo[4].s_dwo_master = 'd_document_salary_grid;'
istr_dwo[4].s_dwo_details = ''
istr_dwo[4].b_relation_1_1 = false
istr_dwo[4].s_master_keycol = 'ID'
istr_dwo[4].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[4].b_ref_table_yn  = false
istr_dwo[4].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[4].b_insert = true
istr_dwo[4].b_update = true
istr_dwo[4].b_delete = true
istr_dwo[4].b_query = true
istr_dwo[4].b_print = true
istr_dwo[4].b_excel = true
istr_dwo[4].b_traceable = true
istr_dwo[4].b_keyboardlocked = true
istr_dwo[4].s_description = 'Chi tiết lương'
istr_dwo[4].s_gb_name = ''
end subroutine

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'

end subroutine

public subroutine f_set_dwo_related ();//istr_dwo_related[1].s_related_obj_name = 'u_unit_class'
//istr_dwo_related[1].s_main_obj_dwo = 'd_uom_grid'
//istr_dwo_related[1].s_main_obj_column = 'class_id'
//istr_dwo_related[1].s_related_obj_dwo = 'd_unit_class_grid'
//istr_dwo_related[1].s_related_obj_column = 'id'
//istr_dwo_related[1].s_relatedtext_column = 'code;name'
//istr_dwo_related[1].s_text = 'Lớp đơn vị của:'
//
//istr_dwo_related[2].s_related_obj_name = 'u_unit_conversion'
//istr_dwo_related[2].s_main_obj_dwo = 'd_uom_grid'
//istr_dwo_related[2].s_main_obj_column = 'id'
//istr_dwo_related[2].s_related_obj_dwo = 'd_unit_conversion_grid'
//istr_dwo_related[2].s_related_obj_column = 'FROM_UNIT_ID'
//istr_dwo_related[2].s_relatedtext_column = 'code;name'
//istr_dwo_related[2].s_text = 'Quy đổi đơn vị của:'
end subroutine

public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[]);t_dw_mpl			ldw_main
double				ldb_ref_id
if rdw_focus.dataobject = 'd_labor_contract_form' then
	ldw_main = iw_display.f_get_dw( istr_dwo[1].s_dwo_default )
	ldb_ref_id = ldw_main.getitemnumber(ldw_main.getrow( ) , 'ext_id')
	ra_args[1] = ldb_ref_id
	return 1
end if
return 0
end function

on c_salary_staff.create
call super::create
end on

on c_salary_staff.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'UOM'
ib_changed_dwo_4edit = false
is_display_model = '1d_3d'
ib_display_text = false
is_object_title = 'Khai báo lương và các chế độ'

istr_actionpane[1].s_description = is_object_title
end event

event e_action_ctrl_bttn;t_dw_mpl				ldw_focus
int							li_idx

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
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify; b_filteron;b_query;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_filteron;b_query;b_refresh;b_delete;'
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query; b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query; b_refresh;b_delete;'
					end if
				end if
			else				
				if  ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;'
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;'
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
			
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;
iw_display.f_set_ii_leftpart_width( iw_display.ii_resize_width*1/5 )
iw_display.f_set_ii_upperpart_height(iw_display.ii_resize_height*1/4 )
iw_display.f_set_ii_fixedpart1_height( iw_display.ii_resize_height*1/5)


return 0
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;t_dw_mpl			ldw_labor_contract

if rpo_dw.dataobject = 'd_document_salary_grid' then
	ldw_labor_contract = this.iw_display.f_get_dw( 'd_labor_contract_form')
	if ldw_labor_contract.rowcount( ) = 0 then
		ldw_labor_contract.event e_addrow( )
	end if
end if

return vl_currentrow
end event

event e_dw_rowfocuschanged;call super::e_dw_rowfocuschanged;t_dw_mpl			ldw_contract

if rpo_dw.dataobject = istr_dwo[1].s_dwo_default  then
	ldw_contract = iw_display.f_get_dw( 'd_labor_contract_form')
	ldw_contract.event e_retrieve( )
end if
return ancestorreturnvalue
end event

