$PBExportHeader$c_rec_security.sru
forward
global type c_rec_security from s_object_display
end type
end forward

global type c_rec_security from s_object_display
end type
global c_rec_security c_rec_security

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
end prototypes

public subroutine f_set_dwo_window ();//--master của tất cả các dw--//
istr_dwo[1].s_dwo_default =  'd_rec_security_hdr_grid'
istr_dwo[1].s_dwo_form = 'd_rec_security_hdr_form'
istr_dwo[1].s_dwo_grid = 'd_rec_security_hdr_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_rec_security_line_grid;d_business_rule_grid;'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Phân quyền record của'
//--có master là business rule, detail là applicable line--//
istr_dwo[2].s_dwo_default =  'd_applicable_rule_hdr_grid'
istr_dwo[2].s_dwo_form =     'd_applicable_rule_hdr_form'
istr_dwo[2].s_dwo_grid = 'd_applicable_rule_hdr_grid'
istr_dwo[2].b_master = true
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_master = 'd_business_rule_grid;'
istr_dwo[2].s_dwo_details = 'd_applicable_rule_line_grid;'
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
istr_dwo[2].s_description = 'Đối tượng áp dụng'
//--có master là security hdr--//
istr_dwo[3].s_dwo_default =  'd_rec_security_line_grid'
istr_dwo[3].s_dwo_form = ''
istr_dwo[3].s_dwo_grid = 'd_rec_security_line_grid'
istr_dwo[3].b_detail = true
istr_dwo[3].s_dwo_master = 'd_rec_security_hdr_grid;'
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
istr_dwo[3].s_description = 'Cài đặt điều kiện phân quyền'
//--có master là applicable hdr--//
istr_dwo[4].s_dwo_default =  'd_applicable_rule_line_grid'
istr_dwo[4].s_dwo_form = ''
istr_dwo[4].s_dwo_grid = 'd_applicable_rule_line_grid'
istr_dwo[4].b_detail = true
istr_dwo[4].s_dwo_master = 'd_applicable_rule_hdr_grid;'
istr_dwo[4].s_master_keycol = 'ID;APPLICABLE_REF_TABLE;'
istr_dwo[4].s_detail_keycol = 'OBJECT_REF_ID;APPLICABLE_REF_STRING;'
istr_dwo[4].b_ref_table_yn  = true
istr_dwo[4].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[4].b_insert = true
istr_dwo[4].b_update = true
istr_dwo[4].b_delete = true
istr_dwo[4].b_query = true
istr_dwo[4].b_print = true
istr_dwo[4].b_excel = true
istr_dwo[4].b_traceable = true
istr_dwo[4].b_focus_master = false
istr_dwo[4].b_keyboardlocked = true
istr_dwo[4].s_description = 'Điều kiện chia nhóm áp dụng'
//--có master là security hdr, detail là applicable hdr--//
istr_dwo[5].s_dwo_default =  'd_business_rule_grid'
istr_dwo[5].s_dwo_form = ''
istr_dwo[5].s_dwo_grid = 'd_business_rule_grid'
istr_dwo[5].b_master = true
istr_dwo[5].b_detail = true
istr_dwo[5].b_cascade_del = true
istr_dwo[5].s_dwo_master = 'd_rec_security_hdr_grid;'
istr_dwo[5].s_dwo_details = 'd_applicable_rule_hdr_grid;'
istr_dwo[5].s_master_keycol = 'ID'
istr_dwo[5].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[5].b_ref_table_yn  = true
istr_dwo[5].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[5].b_insert = true
istr_dwo[5].b_update = true
istr_dwo[5].b_delete = false
istr_dwo[5].b_query = true
istr_dwo[5].b_print = true
istr_dwo[5].b_excel = true
istr_dwo[5].b_traceable = true
istr_dwo[5].b_focus_master = false
istr_dwo[5].b_keyboardlocked = true
istr_dwo[5].s_description = ''
end subroutine

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'

end subroutine

on c_rec_security.create
call super::create
end on

on c_rec_security.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'RECORD_ACCESS_HDR'
ib_changed_dwo_4edit = false
is_display_model = '1d_1dup_2d'
ib_display_text = true
is_object_title = 'Phân quyền record'

istr_actionpane[1].s_description = is_object_title
end event

event e_window_e_postopen;call super::e_window_e_postopen;	//--gán text cho form Phân quyền record--//
	window 			lw_parent
	powerobject	lc_object_handle_parent
	s_str_dwo		ls_str_dwo[]
	long				ll_idx
	string 			ls_dwo,ls_dwo_name
	
	ls_dwo = iw_display.dynamic f_get_rightcliked_objname()
	ls_dwo = mid(ls_dwo,1,len(ls_dwo)-5)
	ls_dwo_name = t_w_mdi.ids_lang_text.f_get_lang_text( ls_dwo )
	if ls_dwo_name = '' then
		lw_parent = iw_display.dynamic f_getparentwindow()
		lc_object_handle_parent = lw_parent.dynamic f_get_obj_handling()
		lc_object_handle_parent.dynamic f_get_dwo(ls_str_dwo[])
		for ll_idx = 1 to upperbound(ls_str_dwo[])
			if ls_str_dwo[ll_idx].s_dwo_default = iw_display.dynamic f_get_rightcliked_objname() then
				iw_display.dynamic f_set_st_1_text(istr_dwo[1].s_description ,ls_str_dwo[ll_idx].s_description)
			end if
		next
	else
		iw_display.dynamic f_set_st_1_text(istr_dwo[1].s_description ,ls_dwo_name)
	end if
//	iw_display.dynamic f_set_visible_st_1(true)
//	iw_display.event resize(1,iw_display.workspacewidth( ),iw_display.workspaceheight( ) )
return 1
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;/***************************************
	insert dwo và type cho dwmain
	insert tất cả các cột của form được phân quyền
	inset 1 dòng vào bảng business rule
****************************************/

datawindow	ldw_main,ldw_detail[],ldw_main_parent,ldw_current,ldw_detail_of_detail[]
window			lw_parent
powerobject	lc_object_handle_parent
string 			ls_columns[],ls_code,ls_text,ls_dwo,ls_object_name
int					li_idx,li_idx_detail

ldw_main = iw_display.dynamic f_get_dwmain()
if ldw_main.getitemstring(ldw_main.rowcount( ) , 'dwo') = '' or isnull(ldw_main.getitemstring(ldw_main.rowcount( ) , 'dwo')) then
	lw_parent = iw_display.dynamic f_getparentwindow()
	lc_object_handle_parent = lw_parent.dynamic f_get_obj_handling()
	ls_object_name = iw_display.dynamic f_get_rightcliked_objname()
	ls_object_name = mid(ls_object_name,1,len(ls_object_name)-5)
	ldw_main.setitem( ldw_main.rowcount( ) , 'dwo', ls_object_name )
	ldw_main.setitem( ldw_main.rowcount( ) , 'type', 'record' )
	ldw_main.setitem( ldw_main.rowcount( ) , 'object', upper(lc_object_handle_parent.classname( )) )
	ldw_main_parent = lw_parent.dynamic f_get_dwmain()
	for li_idx = 1 to ldw_main.dynamic f_getdwdetails(ldw_detail)
		if ldw_detail[li_idx].dataobject = 'd_rec_security_line_grid' then
			ldw_current = lw_parent.dynamic f_get_dw(iw_display.dynamic f_get_rightcliked_objname())
			ldw_current.dynamic f_getcolumns(ls_columns[])
			for li_idx_detail=1 to upperbound(ls_columns[])
				//--không insert cột giả gutter--//
				if lower(ls_columns[li_idx_detail]) = 'gutter' then continue
				ls_dwo = ldw_main.getitemstring(ldw_main.rowcount( ), 'dwo')
				ls_code = ls_object_name + '.' + ls_columns[li_idx_detail] + '_t'
				ls_text = t_w_mdi.ids_lang_text.f_get_lang_text( ls_code)
				ldw_detail[li_idx].dynamic event e_addrow()
				ldw_detail[li_idx].setitem( ldw_detail[li_idx].rowcount( ) , 'dwcolumn', ls_columns[li_idx_detail])
				ldw_detail[li_idx].setitem( ldw_detail[li_idx].rowcount( ) , 'text', ls_text)
				ldw_detail[li_idx].setitem( ldw_detail[li_idx].rowcount( ) , 'dwobject', ls_object_name)
			next
		elseif ldw_detail[li_idx].dataobject = 'd_business_rule_grid' then
			ldw_detail[li_idx].dynamic event e_addrow()
			ldw_detail[li_idx].dynamic f_getdwdetails(ldw_detail_of_detail)
			ldw_detail_of_detail[1].dynamic event e_addrow()
		end if
	next
end if

return 1
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
					if ldw_focus.dynamic f_get_ib_master() then
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_insert;b_modify; b_saveclose;b_refresh;b_delete;'
							istr_actionpane[li_idx].s_enabled_buttons = 'b_saveclose;b_refresh;b_delete;b_insert;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_insert;b_modify; b_saveclose;b_refresh;b_delete;'
							istr_actionpane[li_idx].s_enabled_buttons = 'b_saveclose;b_refresh;b_delete;b_insert;'						
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_insert;b_modify; b_saveclose;b_refresh;b_delete;'
							istr_actionpane[li_idx].s_enabled_buttons = 'b_saveclose;b_refresh;b_delete;b_insert;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_saveclose;b_refresh;b_delete;'
							istr_actionpane[li_idx].s_enabled_buttons = 'b_refresh;b_delete;'						
						end if
					end if
				else
				end if
			else				
				if  ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_saveclose;b_refresh;b_delete;'
					istr_actionpane[li_idx].s_enabled_buttons='b_saveclose;b_refresh;b_delete;'		
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_save;b_refresh;b_delete;'
					istr_actionpane[li_idx].s_enabled_buttons='b_save;b_refresh;b_delete;'							
				end if
			end if
		elseif istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then
			
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_action_ctrl_retrieveend;datawindow				ldw_focus
int							li_idx
string						ls_case

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
					istr_actionpane[li_idx].s_visible_buttons='b_modify;b_saveclose;b_query;b_filteron;b_refresh;b_delete;b_insert;'
					istr_actionpane[li_idx].s_enabled_buttons='b_modify;b_query;b_filteron;b_refresh;b_delete;'							
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_insert;b_modify;b_save;b_query;b_execquery;b_filteron;b_refresh;b_delete;'
					istr_actionpane[li_idx].s_enabled_buttons='b_modify;b_query;b_execquery;b_refresh;b_delete;'							
				end if
			else
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_saveclose;b_query;b_filteron;b_refresh;b_delete;'
					istr_actionpane[li_idx].s_enabled_buttons='b_add;b_modify;b_query;b_execquery;b_filteron;b_refresh;b_delete;'										
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_save;b_filteron;b_query;b_execquery;b_filteron;b_refresh;b_delete;'
					istr_actionpane[li_idx].s_enabled_buttons='b_modify;b_query;b_execquery;b_refresh;b_delete;'														
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_transaction' then	
		end if		
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;window			lw_parent
powerobject	lc_object_handle_parent

if AncestorReturnValue = 1 then return 1
if rpo_dw.dataobject = 'd_applicable_rule_hdr_grid' then
	if vs_colname = 'applicable_type' then
		lw_parent = iw_display.dynamic f_getparentwindow()
		lc_object_handle_parent = lw_parent.dynamic f_get_obj_handling() 
		if vs_editdata = 'table' then
			rpo_dw.setitem(rpo_dw.rowcount(),'APPLICABLE_REF_TABLE',lc_object_handle_parent.dynamic f_get_main_dwo())
		end if
	end if
end if
return 0
end event

event e_dw_e_preretrieve;call super::e_dw_e_preretrieve;string					ls_dwo,ls_columns,ls_dataobject
any					la_arg[]
window				lw_parent
powerobject		lc_object_handle_parent

ls_dataobject = rpo_dw.dataobject
if mid(ls_dataobject,1,len(ls_dataobject)-5) = 'd_rec_security_hdr' then
	lw_parent = iw_display.dynamic f_getparentwindow()
	lc_object_handle_parent = lw_parent.dynamic f_get_obj_handling()
	ls_dwo = iw_display.dynamic f_get_rightcliked_objname()
	ls_dwo = mid(ls_dwo,1,len(ls_dwo)-5)
	ls_columns = 'dwo;type;object'
	la_arg[1] = '='+ls_dwo
	la_arg[2] = '=record'
	la_arg[3] = '='+upper(lc_object_handle_parent.classname( ))
	rpo_dw.dynamic f_add_where(ls_columns,la_arg)
end if
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;string					ls_dwo,ls_columns,ls_dataobject
any					la_arg[]
datawindow		ldw_main

//ldw_main = iw_display.dynamic f_get_dwmain()
//ls_dataobject = ldw_main.dataobject
//if mid(ls_dataobject,1,len(ls_dataobject)-5) = 'd_rec_security_hdr' then
//	ls_dwo = iw_display.dynamic f_get_rightcliked_objname()
//	ls_dwo = mid(ls_dwo,1,len(ls_dwo)-5)
//	ls_columns = 'dwo;type'
//	la_arg[1] = '='+ls_dwo
//	la_arg[2] = '=record'
//	ldw_main.dynamic f_add_where(ls_columns,la_arg)
//end if
//iw_display.ii_resize_height = iw_display.ii_resize_height - 300

iw_display.f_set_ii_leftpart_width( 1/4)
iw_display.f_set_ii_upperpart_height( 1/2)
iw_display.f_set_ii_midpart_width( 1/3)
return 0
end event

event e_dw_updatestart;call super::e_dw_updatestart;//--chỉ insert dòng nào có điều kiện--//
long 				ll_row
int					li_idx
string				ls_criteria,ls_appli_ref_is_str

choose case rdw_requester.dataobject
	case 'd_rec_security_line_grid'
		for li_idx = rdw_requester.rowcount() to 1 step -1 
			if trim(rdw_requester.getitemstring( li_idx, 'criteria'))  = '' or isnull(rdw_requester.getitemstring( li_idx, 'criteria')) then
				rdw_requester.deleterow( li_idx)
			end if
		next
	case 'd_applicable_rule_line_grid'
		for li_idx = rdw_requester.rowcount() to 1 step -1 
			if trim(rdw_requester.getitemstring( li_idx, 'applicable_criteria_val'))  = '' or isnull(rdw_requester.getitemstring( li_idx, 'applicable_criteria_val')) then
				rdw_requester.deleterow( li_idx)
			end if
		next
	case 'd_applicable_rule_hdr_grid','d_applicable_rule_hdr_form'
		for li_idx = 1 to rdw_requester.rowcount()
			if rdw_requester.getitemstring(li_idx,'applicable_type') = 'table' then
				ls_appli_ref_is_str = rdw_requester.getitemstring(li_idx,'applicable_ref_id_string')
				if lastpos(ls_appli_ref_is_str,';') < len(ls_appli_ref_is_str) and pos(ls_appli_ref_is_str,';') > 1 then 
					ls_appli_ref_is_str = ';'+ls_appli_ref_is_str+';'
				elseif pos(ls_appli_ref_is_str,';') = 0 then
					ls_appli_ref_is_str = ';'+ls_appli_ref_is_str+';'
				end if
				rdw_requester.setitem(li_idx,'applicable_ref_id_string',ls_appli_ref_is_str)
			end if
		next
end choose
return 1
end event

