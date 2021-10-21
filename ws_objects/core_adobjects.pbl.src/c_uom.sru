$PBExportHeader$c_uom.sru
forward
global type c_uom from s_object_display
end type
end forward

global type c_uom from s_object_display
end type
global c_uom c_uom

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_related ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_uom_grid'
istr_dwo[1].s_dwo_form = 'd_uom_form'
istr_dwo[1].s_dwo_grid = 'd_uom_grid'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Khai báo đơn vị'
end subroutine

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'

end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_unit_class'
istr_dwo_related[1].s_main_obj_dwo = 'd_uom_grid'
istr_dwo_related[1].s_main_obj_column = 'class_id'
istr_dwo_related[1].s_related_obj_dwo = 'd_unit_class_grid'
istr_dwo_related[1].s_related_obj_column = 'id'
istr_dwo_related[1].s_relatedtext_column = 'code;name'
istr_dwo_related[1].s_text = 'Lớp đơn vị của:'

istr_dwo_related[2].s_related_obj_name = 'u_unit_conversion'
istr_dwo_related[2].s_main_obj_dwo = 'd_uom_grid'
istr_dwo_related[2].s_main_obj_column = 'id'
istr_dwo_related[2].s_related_obj_dwo = 'd_unit_conversion_grid'
istr_dwo_related[2].s_related_obj_column = 'FROM_UNIT_ID'
istr_dwo_related[2].s_relatedtext_column = 'code;name'
istr_dwo_related[2].s_text = 'Quy đổi đơn vị của:'
end subroutine

on c_uom.create
call super::create
end on

on c_uom.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'UOM'
ib_changed_dwo_4edit = false
is_display_model = '1d'
ib_display_text = false
is_object_title = 'Khai báo đơn vị'

istr_actionpane[1].s_description = is_object_title
end event

event e_action_ctrl_e_postmodifyrow;return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;double				ldb_class_id
long					ll_find
int						li_count
string					ls_find,ls_unit_code,ls_unit_name

if AncestorReturnValue = 1 then return 1
if vs_colname = 'base_yn' then
	if vs_editdata = 'Y' then
		ldb_class_id = rpo_dw.getitemnumber(vl_currentrow,'class_id')
		ls_find = 'class_id = ' + string(ldb_class_id) + ' and ' + vs_colname + " = 'Y'"
		ll_find = rpo_dw.find(ls_find,1,rpo_dw.rowcount())
		if ll_find > 0 then
			ls_unit_code = rpo_dw.getitemstring(ll_find,'code')
			ls_unit_name = rpo_dw.getitemstring(ll_find,'name')
			gf_messagebox('m.c_uom.e_dw_e_itemchanged.01','Thông báo','Đã có đơn vị chuẩn là @'+ls_unit_code+' - @'+ls_unit_name,'exclamation','ok',1)
			return 1
		end if
	else
		if ic_unit_instance.f_is_unit_conversion( rpo_dw.getitemnumber(vl_currentrow,'ID')) then
			gf_messagebox('m.c_uom.e_dw_e_itemchanged.03','Thông báo','Chưa xóa quy đổi đơn vị ','exclamation','ok',1)
			return 1
		else
			return 0
		end if
	end if
end if
return 0
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
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_blank;b_delete;'
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then
			istr_actionpane[li_idx].s_visible_buttons =  'b_attach;b_user_trace;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
			
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

