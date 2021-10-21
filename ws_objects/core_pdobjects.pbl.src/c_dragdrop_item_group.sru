$PBExportHeader$c_dragdrop_item_group.sru
forward
global type c_dragdrop_item_group from s_object_display
end type
end forward

global type c_dragdrop_item_group from s_object_display
end type
global c_dragdrop_item_group c_dragdrop_item_group

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_related ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_valueset_entry_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_valueset_entry_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_master = ''
istr_dwo[1].s_dwo_details = 'd_objects_item_grid;'
istr_dwo[1].s_dwo_shared = ''
istr_dwo[1].s_master_keycol = ''
istr_dwo[1].s_detail_keycol = ''
istr_dwo[1].b_ref_table_yn  = false
istr_dwo[1].s_ref_table_field = ''
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = false
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Nhóm thuốc'

istr_dwo[2].s_dwo_default =  'd_item_w_group_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_item_w_group_grid'
istr_dwo[2].b_master = false
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_master = 'd_valueset_entry_grid;'
istr_dwo[2].s_dwo_details = ''
istr_dwo[2].s_dwo_shared = ''
istr_dwo[2].s_master_keycol = 'id'
istr_dwo[2].s_detail_keycol = 'manage_group'
istr_dwo[2].b_ref_table_yn  = false
istr_dwo[2].s_ref_table_field = ''
istr_dwo[2].b_insert = false
istr_dwo[2].b_update = false
istr_dwo[2].b_delete = false
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_drag = true
istr_dwo[2].b_traceable = false
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_description = 'Mã hàng thuộc nhóm'
istr_dwo[2].s_gb_name = ''


istr_dwo[3].s_dwo_default =  'd_item_wo_group_grid'
istr_dwo[3].s_dwo_form = ''
istr_dwo[3].s_dwo_grid = 'd_item_wo_group_grid'
istr_dwo[3].b_master = false
istr_dwo[3].b_detail = false
istr_dwo[3].b_cascade_del = true
istr_dwo[3].s_dwo_master = ''
istr_dwo[3].s_dwo_details = ''
istr_dwo[3].s_dwo_shared = ''
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
istr_dwo[3].b_drag = true
istr_dwo[3].b_traceable = false
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].s_description = 'Mã hàng chưa có nhóm'
istr_dwo[3].s_gb_name = ''


istr_dwo[4].s_dwo_default =  'd_filter_new_form'
istr_dwo[4].s_dwo_form = 'd_filter_new_form'
istr_dwo[4].s_dwo_grid = ''
istr_dwo[4].b_master = false
istr_dwo[4].b_detail = false
istr_dwo[4].b_cascade_del = true
istr_dwo[4].s_dwo_master = ''
istr_dwo[4].s_dwo_details = ''
istr_dwo[4].s_dwo_shared = ''
istr_dwo[4].s_master_keycol = ''
istr_dwo[4].s_detail_keycol = ''
istr_dwo[4].b_ref_table_yn  = false
istr_dwo[4].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[4].b_insert = false
istr_dwo[4].b_update = true
istr_dwo[4].b_delete = false
istr_dwo[4].b_query = true
istr_dwo[4].b_print = true
istr_dwo[4].b_excel = true
istr_dwo[4].b_drag = false
istr_dwo[4].b_traceable = false
istr_dwo[4].b_keyboardlocked = false
istr_dwo[4].s_description = 'lọc'
istr_dwo[4].s_gb_name = ''


istr_dwo[5].s_dwo_default =  'd_filter_new_form'
istr_dwo[5].s_dwo_form = 'd_filter_new_form'
istr_dwo[5].s_dwo_grid = ''
istr_dwo[5].b_master = false
istr_dwo[5].b_detail = false
istr_dwo[5].b_cascade_del = false
istr_dwo[5].s_dwo_master = ''
istr_dwo[5].s_dwo_details = ''
istr_dwo[5].s_dwo_shared = ''
istr_dwo[5].s_master_keycol = ''
istr_dwo[5].s_detail_keycol = ''
istr_dwo[5].b_ref_table_yn  = false
istr_dwo[5].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[5].b_insert = false
istr_dwo[5].b_update = true
istr_dwo[5].b_delete = false
istr_dwo[5].b_query = true
istr_dwo[5].b_print = true
istr_dwo[5].b_excel = true
istr_dwo[5].b_drag = false
istr_dwo[5].b_traceable = false
istr_dwo[5].b_keyboardlocked = false
istr_dwo[5].s_description = 'Lọc'
istr_dwo[5].s_gb_name = ''
end subroutine

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'

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

on c_dragdrop_item_group.create
call super::create
end on

on c_dragdrop_item_group.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'UOM'
ib_changed_dwo_4edit = false
is_display_model = '1d_1df_1df'
ib_display_text = false
is_object_title = 'Gán nhóm thuốc'

istr_actionpane[1].s_description = is_object_title
end event

event e_action_ctrl_e_postmodifyrow;return 0
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
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify; b_filteron;b_refresh;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_filteron;b_refresh;'
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron; b_refresh;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron; b_refresh;'
					end if
				end if
			else				
				if  ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_refresh;'
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_refresh;'
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

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.dynamic f_set_ii_leftpart_width(1/3)
iw_display.dynamic f_set_ii_midpart_width(1/3)
return 0
end event

event e_window_open;call super::e_window_open;
any				laa_value[]
t_dw_mpl		ldw_main
b_flexibledata	lb_flexibledata

//-- add where vendor --//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = lb_flexibledata.f_get_id('NHT_THM', it_transaction )
ldw_main.f_add_where('object_ref_id;',laa_value[])
return  0
end event

event e_dw_e_save;call super::e_dw_e_save;
if rpo_dw.dataobject = 'd_filter_new_form' then
	return 0
end if
return ancestorreturnvalue
end event

event e_dw_dwnkey;call super::e_dw_dwnkey;string					ls_text, ls_filterStr
t_dw_mpl			ldw_filter
b_obj_instantiate	lbo_ins

if rpo_dw.dataobject = 'd_filter_new_form'  and v_keycode = KeyEnter! then
	rpo_dw.accepttext()
	ls_text = rpo_dw.getitemstring(1, 'filter_string')
	if  rpo_dw.classname() = 'dw_5' then
		ldw_filter = iw_display.f_get_dw( 'd_item_wo_group_grid')
	else
		ldw_filter = iw_display.f_get_dw( 'd_item_w_group_grid')
		
	end if
	ls_filterStr = lbo_ins.f_get_filterstring( ldw_filter, ls_text, 'obj_search')
	ldw_filter.setfilter( ls_filterStr)
	ldw_filter.filter( )
	ldw_filter.f_set_gutter_rowcount( )
	return 2
end if
return ancestorreturnvalue
end event

event e_dw_dragdrop;call super::e_dw_dragdrop;long			ll_row_found
double		ldb_loc_id
t_dw_mpl	ldw_group, ldw_retrieve
if rdw_handling.dataobject = 'd_item_w_group_grid' then
	if vdw_source.dataobject = 'd_item_wo_group_grid' then
		if rdw_handling.rowcount() > 0 then
			ldb_loc_id = rdw_handling.getitemnumber( 1, 'manage_group' )
		else
			ldw_group = iw_display.f_get_dw( 'd_valueset_entry_grid')
			if ldw_group.getrow( ) > 0 then
				ldb_loc_id = ldw_group.getitemnumber(  ldw_group.getrow( ), 'id' )
			else
				return 0
			end if
		end if
		ll_row_found = vdw_source.find(" gutter = 'Y' ", 1, vdw_source.rowcount())		
		if ll_row_found = 0 then
			//-- cập nhật dòng forcus --//
			vdw_source.setitem(vdw_source.getrow(), 'manage_group', ldb_loc_id)
		elseif ll_row_found > 0 then
			//-- cập nhật dòng chọn --//
			DO WHILE ll_row_found > 0
				vdw_source.setitem(ll_row_found, 'manage_group', ldb_loc_id)
				ll_row_found = vdw_source.find(" gutter = 'Y' ", ll_row_found + 1, vdw_source.rowcount() + 1)
			LOOP
		end if
		if vdw_source.update() = 1 then
			iw_display.event e_save( )
			vdw_source.dynamic event e_retrieve()
			rdw_handling.dynamic event e_retrieve()
		end if
	end if
elseif  rdw_handling.dataobject = 'd_item_wo_group_grid' then
	if vdw_source.dataobject = 'd_item_w_group_grid' then
		ll_row_found = vdw_source.find(" gutter = 'Y' ", 1, vdw_source.rowcount())		
		if ll_row_found = 0 then
			//-- cập nhật dòng forcus --//
			setnull(ldb_loc_id)
			vdw_source.setitem(vdw_source.getrow(), 'manage_group', ldb_loc_id)
		elseif ll_row_found > 0 then
			//-- cập nhật dòng chọn --//
			DO WHILE ll_row_found > 0
				setnull(ldb_loc_id)
				vdw_source.setitem(ll_row_found, 'manage_group', ldb_loc_id)
				ll_row_found = vdw_source.find(" gutter = 'Y' ", ll_row_found + 1, vdw_source.rowcount() + 1)
			LOOP
		end if
		if vdw_source.update() = 1 then
			iw_display.event e_save( )
			vdw_source.dynamic event e_retrieve()
			rdw_handling.dynamic event e_retrieve()
		end if		
	end if	
elseif  rdw_handling.dataobject = 'd_valueset_entry_grid' then
	if vl_row > 0 then
		ldb_loc_id = rdw_handling.getitemnumber( vl_row, 'ID' )
		if vdw_source.dataobject = 'd_item_w_group_grid' or vdw_source.dataobject = 'd_item_wo_group_grid' then
			
			ll_row_found = vdw_source.find(" gutter = 'Y' ", 1, vdw_source.rowcount())		
			if ll_row_found = 0 then
				//-- cập nhật dòng forcus --//
				vdw_source.setitem(vdw_source.getrow(), 'manage_group', ldb_loc_id)
			elseif ll_row_found > 0 then
				//-- cập nhật dòng chọn --//
				DO WHILE ll_row_found > 0
					vdw_source.setitem(ll_row_found, 'manage_group', ldb_loc_id)
					ll_row_found = vdw_source.find(" gutter = 'Y' ", ll_row_found + 1, vdw_source.rowcount() + 1)
				LOOP
			end if
			if vdw_source.update() = 1 then
				iw_display.event e_save( )
				rdw_handling.scrolltorow(vl_row)
				vdw_source.dynamic event e_retrieve()
				if vdw_source.dataobject = 'd_item_w_group_grid' then
					ldw_retrieve = iw_display.f_get_dw( 'd_item_wo_group_grid')
				else
					ldw_retrieve = iw_display.f_get_dw( 'd_item_w_group_grid')
				end if
				ldw_retrieve.event e_retrieve( )
			end if		
		end if		
	end if
end if
return ancestorreturnvalue
end event

