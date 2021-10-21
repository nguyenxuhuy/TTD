$PBExportHeader$c_unit_class.sru
forward
global type c_unit_class from s_object_display
end type
end forward

global type c_unit_class from s_object_display
end type
global c_unit_class c_unit_class

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_related ()
public subroutine f_set_actionpane ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_unit_class_grid'
istr_dwo[1].s_dwo_form = 'd_unit_class_form'
istr_dwo[1].s_dwo_grid = 'd_unit_class_grid'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Khai báo lớp đơn vị'
end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_uom'
istr_dwo_related[1].s_main_obj_dwo = 'd_unit_class_grid' 
istr_dwo_related[1].s_main_obj_column = 'id'
istr_dwo_related[1].s_related_obj_dwo =  'd_uom_grid'
istr_dwo_related[1].s_related_obj_column =  'class_id'
istr_dwo_related[1].s_relatedtext_column = 'code;name'
istr_dwo_related[1].s_text = 'Đơn vị của: '
end subroutine

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name =  'b_uom;'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_button_name =  'b_note;b_doc_trace;b_user_trace;'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'

end subroutine

on c_unit_class.create
call super::create
end on

on c_unit_class.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'UNIT_CLASS'
ib_changed_dwo_4edit = true
is_display_model = '1d'
ib_display_text = false
is_object_title = 'Khai báo lớp đơn vị'

istr_actionpane[1].s_description = is_object_title


end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;int					li_idx,li_count
double			ldb_class_id

if AncestorReturnValue = 1 then return 1
if upper(vs_colname) = 'CURRENCY_YN' then
	if vs_editdata = 'Y' then
		select count(CURRENCY_YN) into :li_count from UNIT_CLASS where  UNIT_CLASS.CURRENCY_YN = 'Y';
		if li_count > 0 then
			gf_messagebox('m.c_unit_class.e_dw_e_itemchanged.01','Thông báo','Đã có lớp đơn vị tiền tệ ','exclamation','ok',1)
			return 1
		end if
	else
		ldb_class_id = rpo_dw.getitemnumber(vl_currentrow,'ID')
		select count(ID) into :li_count from UOM where UOM.CLASS_ID = :ldb_class_id;
		if li_count > 0 then
			gf_messagebox('m.c_unit_class.e_dw_e_itemchanged.02','Thông báo','Chưa xóa đơn vị tiền tệ ','exclamation','ok',1)
			return 1
		end if
	end if
end if
return 0
end event

event e_action_ctrl_e_postmodifyrow;datawindow				ldw_focus
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
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify; b_saveclose;b_refresh;b_delete;'
						istr_actionpane[li_idx].s_enabled_buttons = 'b_add;b_insert;b_saveclose;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_saveclose;b_refresh;b_delete;'
						istr_actionpane[li_idx].s_enabled_buttons = 'b_add;b_saveclose;b_refresh;b_delete;'						
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_save; b_refresh;b_delete;'
						istr_actionpane[li_idx].s_enabled_buttons = 'b_add;b_insert;b_save;b_refresh;b_delete;'	
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_save; b_refresh;b_delete;'
						istr_actionpane[li_idx].s_enabled_buttons = 'b_add;b_save;b_refresh;b_delete;'							
					end if
				end if
			else				
				if  ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_saveclose;b_refresh;b_delete;'
					istr_actionpane[li_idx].s_enabled_buttons='b_saveclose;b_refresh;b_delete;'		
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_save;b_refresh;b_delete;'
					istr_actionpane[li_idx].s_enabled_buttons='b_add;b_save;b_refresh;b_delete;'							
				end if
			end if
		elseif istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then
			
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_action_ctrl_bttn;//-- override --//

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
			istr_actionpane[li_idx].s_visible_buttons =   'b_uom;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
			istr_actionpane[li_idx].s_visible_buttons =  'b_note;b_doc_trace;b_user_trace;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then				
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

