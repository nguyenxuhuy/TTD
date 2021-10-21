$PBExportHeader$c_rounding.sru
forward
global type c_rounding from s_object_display
end type
end forward

global type c_rounding from s_object_display
end type
global c_rounding c_rounding

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_related ()
public subroutine f_set_actionpane ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_rounding_grid'
istr_dwo[1].s_dwo_form = 'd_rounding_form'
istr_dwo[1].s_dwo_grid = 'd_rounding_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_round_spec_grid'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Khai báo làm tròn'

istr_dwo[2].s_dwo_default =  'd_round_spec_grid'
istr_dwo[2].s_dwo_form = 'd_round_spec_form'
istr_dwo[2].s_dwo_grid = 'd_round_spec_grid'
istr_dwo[2].b_detail = true
istr_dwo[2].s_dwo_master = 'd_rounding_grid;'
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
istr_dwo[2].s_description = 'Cài đặt làm tròn đặc biệt'
end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_unit_conversion'
istr_dwo_related[1].s_main_obj_dwo = 'd_rounding_grid'
istr_dwo_related[1].s_main_obj_column = 'id'
istr_dwo_related[1].s_related_obj_dwo = 'd_unit_conversion_grid'
istr_dwo_related[1].s_related_obj_column = 'Round_id'
istr_dwo_related[1].s_relatedtext_column = 'code;name'
istr_dwo_related[1].s_text = 'Quy đổi đơn vị của:'

//istr_dwo_related[2].s_related_obj_name = 'u_rounding_copy'
//istr_dwo_related[2].s_main_obj_dwo = 'd_rounding_grid'
//istr_dwo_related[2].s_main_obj_column = 'CODE;NAME;DECIMAL_DIGIT;TYPE'
//istr_dwo_related[2].s_related_obj_dwo = 'd_rounding_copy_grid'
//istr_dwo_related[2].s_related_obj_column = 'CODE;NAME;DECIMAL_DIGIT;TYPE'
//istr_dwo_related[2].s_relatedtext_column = ''
//istr_dwo_related[2].s_text = ''
//istr_dwo_related[2].s_main_obj_dwo_copy[1] = 'd_rounding_grid' 
//istr_dwo_related[2].s_main_obj_column_copy[1] = 'CODE;NAME;DECIMAL_DIGIT;TYPE'
//istr_dwo_related[2].s_related_obj_dwo_copy[1] = 'd_rounding_copy_grid'
//istr_dwo_related[2].s_related_obj_column_copy[1] = 'CODE;NAME;DECIMAL_DIGIT;TYPE'
//istr_dwo_related[2].s_main_obj_column_chk[1] = 'type'
//istr_dwo_related[2].s_related_obj_column_chk[1] = 'type'
//
//istr_dwo_related[2].s_main_obj_dwo_copy[2] = 'd_round_spec_grid' 
//istr_dwo_related[2].s_main_obj_column_copy[2] = 'FROM_VALUE;TO_VALUE;ROUND_VALUE'
//istr_dwo_related[2].s_related_obj_dwo_copy[2] = 'd_round_spec_copy_grid'
//istr_dwo_related[2].s_related_obj_column_copy[2] = 'FROM_VALUE;TO_VALUE;ROUND_VALUE'
//istr_dwo_related[2].s_main_obj_column_chk[2] = ''
//istr_dwo_related[2].s_related_obj_column_chk[2] = ''

//istr_dwo_related[2].s_main_obj_dwo_copy[1] = 'd_round_spec_grid' 
//istr_dwo_related[2].s_main_obj_column_copy[1] = 'FROM_VALUE;TO_VALUE;ROUND_VALUE'
//istr_dwo_related[2].s_related_obj_dwo_copy[1] = 'd_round_spec_copy_grid'
//istr_dwo_related[2].s_related_obj_column_copy[1] = 'FROM_VALUE;TO_VALUE;ROUND_VALUE'
//istr_dwo_related[2].s_main_obj_column_chk[1] = ''
//istr_dwo_related[2].s_related_obj_column_chk[1] = ''
end subroutine

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'

end subroutine

on c_rounding.create
call super::create
end on

on c_rounding.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'ROUNDING'
ib_changed_dwo_4edit = true
is_display_model = '2d'
ib_display_text = false
is_object_title = 'Khai báo làm tròn'

istr_actionpane[1].s_description = is_object_title

end event

event e_action_ctrl_bttn;//-- override --//

datawindow				ldw_focus
int								li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	//-- control d_action_edit --//
	if not this.ib_copying then
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
					if ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =   'b_unit_class;b_unit_conversion;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
				istr_actionpane[li_idx].s_visible_buttons =  'b_book; b_attach; b_note;b_doc_trace;b_user_trace;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then				
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

