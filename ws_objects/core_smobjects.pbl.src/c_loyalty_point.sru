$PBExportHeader$c_loyalty_point.sru
forward
global type c_loyalty_point from s_object_display
end type
end forward

global type c_loyalty_point from s_object_display
end type
global c_loyalty_point c_loyalty_point

forward prototypes
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_window ()
end prototypes

public subroutine f_set_actionpane ();

istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_button_name =  'b_book;b_note;b_doc_trace;b_user_trace;'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'

end subroutine

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_loyalty_hdr_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_loyalty_hdr_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_loyalty_line_grid;'
istr_dwo[1].s_dwo_shared = ''
istr_dwo[1].s_dwo_master = ''
istr_dwo[1].s_master_keycol = ''
istr_dwo[1].s_detail_keycol = ''
istr_dwo[1].b_ref_table_yn  = true
istr_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_gb_name = ''
istr_dwo[1].s_description = 'Điềm thưởng khách hàng thân thiết'

istr_dwo[2].s_dwo_default =  'd_loyalty_line_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_loyalty_line_grid'
istr_dwo[2].b_detail = true
istr_dwo[2].b_master = false
istr_dwo[2].b_cascade_del = false
istr_dwo[2].b_shared = false
istr_dwo[2].s_dwo_master = 'd_loyalty_hdr_grid;'
istr_dwo[2].s_dwo_details = ''
istr_dwo[2].s_master_keycol = 'ID;'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[2].b_ref_table_yn  = true
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[2].b_relation_1_1 = false
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].b_focus_master = false
istr_dwo[2].s_description = 'Quy định điểm thưởng'
istr_dwo[2].s_pic_ref_table = ''
istr_dwo[2].s_pic_ref_field = ''

end subroutine

on c_loyalty_point.create
call super::create
end on

on c_loyalty_point.destroy
call super::destroy
end on

event constructor;call super::constructor;ib_changed_dwo_4edit = false
is_display_model = '2d'
ib_display_text = false
is_object_title = 'Điểm thưởng khách hàng thân thiết'
istr_actionpane[1].s_button_name = 'b_add;b_insert;b_modify;b_save;b_query;b_execquery;b_filteron;b_refresh;b_delete;'
istr_actionpane[1].s_button_has_sub = ''
istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title

end event

event e_action_ctrl_bttn;//-- Override --//
datawindow				ldw_focus
int								li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	if not this.ib_copying then
		//-- control d_action_edit --//
		FOR li_idx = 1 to upperbound(istr_actionpane[]) 
			if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
				if ldw_focus.dynamic f_get_ib_shared() then
					ldw_focus = ldw_focus.dynamic f_getdwmaster()
				end if			
				if ldw_focus.dynamic f_get_ib_detail() then
					if ib_changed_dwo_4edit then
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_query;b_filteron;b_refresh;b_blank;b_delete;b_blank;b_item_barcode;b_blank;b_inventory_multi;b_purchase_multi;b_sales_multi;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_blank;b_item_barcode;b_blank;b_inventory_multi;b_purchase_multi;b_sales_multi;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query; b_refresh;b_blank;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_blank;b_item_barcode;b_blank;b_inventory_multi;b_purchase_multi;b_sales_multi;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_blank;b_item_barcode;b_blank;b_inventory_multi;b_purchase_multi;b_sales_multi;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
				istr_actionpane[li_idx].s_visible_buttons =  'b_book; b_attach; b_note;b_doc_trace_on;b_user_trace;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
				
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0


//
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;//--resize parm --//

iw_display.dynamic f_set_ii_upperpart_height(1500)

return 0
end event

