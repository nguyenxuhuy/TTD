$PBExportHeader$c_asset.sru
forward
global type c_asset from s_object_display
end type
end forward

global type c_asset from s_object_display
end type
global c_asset c_asset

forward prototypes
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_related ()
public subroutine f_set_dwo_tabpage ()
end prototypes

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name =  'b_po;b_pur_invoice;'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_button_name =  'b_book;b_note;b_doc_trace;b_user_trace;'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'

end subroutine

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_object_grid'
istr_dwo[1].s_dwo_form = 'd_object_form'
istr_dwo[1].s_dwo_grid = 'd_object_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_asset_form;d_asset_profile_grid;d_depre_profile_grid;'
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
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_gb_name = 'gb_6'
istr_dwo[1].s_description = 'Khai báo tài sản'

istr_dwo[2].s_dwo_default =  'd_asset_form'
istr_dwo[2].s_dwo_form = 'd_asset_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_detail = true
istr_dwo[2].b_master = false
istr_dwo[2].b_cascade_del = false
istr_dwo[2].b_shared = false
istr_dwo[2].s_dwo_master = 'd_object_grid;'
istr_dwo[2].s_dwo_details = ''
istr_dwo[2].s_master_keycol = 'ID;'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
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
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].b_focus_master = true
istr_dwo[2].s_description = 'Thông tin tài sản'
istr_dwo[2].s_pic_ref_table = ''
istr_dwo[2].s_pic_ref_field = ''

end subroutine

public subroutine f_set_dwo_related ();//Nhân bản khai báo TSCĐ
istr_dwo_related[1].s_related_obj_name = 'u_asset'					// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = 	'd_object_grid'	//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo =  'd_object_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].s_relatedtext_column = 'code'					
istr_dwo_related[1].s_text = 'Nhân bản khai báo TSCĐ: '
istr_dwo_related[1].s_main_obj_dwo_copy[1] = 'd_object_grid' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[1] = 'code;short_name;name;active_yn;group_code;group_name;posting_code;posting_name;location_code;location_name;'+&
																																				'MANAGE_GROUP;POSTING_GROUP;location;' // cột copy từ
istr_dwo_related[1].s_related_obj_dwo_copy[1] = 'd_object_grid' // datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[1] = 'code;short_name;name;active_yn;group_code;group_name;posting_code;posting_name;location_code;location_name;'+&
																																				'MANAGE_GROUP;POSTING_GROUP;location;' // cột copy đến
istr_dwo_related[1].s_match_f_dwo[1] = 'd_object_grid'
istr_dwo_related[1].s_match_t_dwo[1] ='d_object_grid'

istr_dwo_related[1].s_main_obj_dwo_copy[2] = 'd_asset_form' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[2] = 'manafacturer;original_country;operation_status;maintain_status;insurance_policy;insurance_exp_date;'+&
																							'guarantee_exp_date;tech_note;usage_note;fixed_asset_yn;production_yn;estate_yn;'
istr_dwo_related[1].s_related_obj_dwo_copy[2] = 'd_asset_form' // datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[2] = 'manafacturer;original_country;operation_status;maintain_status;insurance_policy;insurance_exp_date;'+&
																							'guarantee_exp_date;tech_note;usage_note;fixed_asset_yn;production_yn;estate_yn;'
istr_dwo_related[1].s_main_obj_dwo_copy[3] = 'd_depre_profile_grid' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[3] =  'sob;depre_method;depre_stopping_yn;depre_start_date;depre_lifetime;depre_time_unit;depre_weighted_nbr;'+&
																	'depre_subaccount;asset_code;asset_name;operation_status;fixed_asset_yn;depreciated_period;depre_life_remain;'+&
																		'depre_object_code;depre_object_name;depre_subaccount_code;subaccount_name;'
istr_dwo_related[1].s_related_obj_dwo_copy[3] = 'd_depre_profile_grid' // datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[3] =  'sob;depre_method;depre_stopping_yn;depre_start_date;depre_lifetime;depre_time_unit;depre_weighted_nbr;'+&
																	'depre_subaccount;asset_code;asset_name;operation_status;fixed_asset_yn;depreciated_period;depre_life_remain;'+&
																		'depre_object_code;depre_object_name;depre_subaccount_code;subaccount_name;'
istr_dwo_related[1].s_main_obj_column_chk[3] = ''
istr_dwo_related[1].s_related_obj_column_chk[3] = ''
istr_dwo_related[1].s_f_obj_column_chk[3] = ''
istr_dwo_related[1].s_t_obj_column_chk[3] = ''
istr_dwo_related[1].s_match_f_dwo[3] = '' 
istr_dwo_related[1].s_match_t_dwo[3] =''
istr_dwo_related[1].s_match_f_column[3] = ''
istr_dwo_related[1].s_match_t_column[3] = ''
istr_dwo_related[1].s_match_column[3] = ''
istr_dwo_related[1].s_main_obj_column_sum[3] = ''
istr_dwo_related[1].s_related_obj_column_sum[3] = ''
istr_dwo_related[1].b_f_sum[3] = false


end subroutine

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model ='1d'
//iastr_dwo_tabpage[1].i_upperpart_height  =730
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_depre_profile_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_depre_profile_grid'
iastr_dwo_tabpage[1].str_dwo[1].b_master = false
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_object_grid;'
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
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Cài đặt khấu hao'
iastr_dwo_tabpage[1].i_index = 1

iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_display_model = '1d'
//iastr_dwo_tabpage[2].i_upperpart_height  =730
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_asset_profile_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = 'd_asset_profile_grid'
iastr_dwo_tabpage[2].str_dwo[1].b_master = false
iastr_dwo_tabpage[2].str_dwo[1].b_detail = true
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_object_grid;'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[2].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[2].str_dwo[1].s_detail_keycol = 'ASSET_ID;'
iastr_dwo_tabpage[2].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[2].str_dwo[1].s_ref_table_field = ''
iastr_dwo_tabpage[2].str_dwo[1].b_insert = false
iastr_dwo_tabpage[2].str_dwo[1].b_update = false
iastr_dwo_tabpage[2].str_dwo[1].b_delete = false
iastr_dwo_tabpage[2].str_dwo[1].b_query = true
iastr_dwo_tabpage[2].str_dwo[1].b_print = true
iastr_dwo_tabpage[2].str_dwo[1].b_excel = true
iastr_dwo_tabpage[2].str_dwo[1].b_traceable = false
iastr_dwo_tabpage[2].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[2].str_dwo[1].s_description ='Lược sử tài sản'
iastr_dwo_tabpage[2].i_index = 2


end subroutine

on c_asset.create
call super::create
end on

on c_asset.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'item'
ib_changed_dwo_4edit = true
is_display_model = '2dgb_1tp'
ib_display_text = false
is_object_title = 'Khai báo tài sản'
istr_actionpane[1].s_button_name = 'b_add_multi;b_insert;b_modify;b_save;b_query;b_execquery;b_filteron;b_item_barcode;b_refresh;b_delete;b_purchase_multi;'
istr_actionpane[1].s_button_has_sub = 'b_add_multi;b_purchase_multi;'
istr_actionpane[1].sa_sub_button[1]='b_add;b_copyt_seft;'
istr_actionpane[1].sa_sub_button[2]='b_copyt_po;b_copyt_pur_invoice;'
istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title

end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;t_dw_mpl		ldw_item

if pos(rpo_dw.dataobject,'d_object_') > 0 then
	ldw_item = iw_display.dynamic f_get_dw('d_asset_form')
	ldw_item.event e_addrow()
	// Gán user id khi tạo mới KH
	rpo_dw.setitem(vl_currentrow,'handled_by',gi_userid)
	rpo_dw.setitem(vl_currentrow,'staff_name', g_user.f_get_name_of_userid(gi_userid))
end if
return vl_currentrow
end event

event e_window_open;call super::e_window_open;t_dw_mpl			ldw_main
any				laa_value[]

//-- add where vendor --//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '=ASSET'
ldw_main.f_add_where('object_ref_table;',laa_value[])

return  0
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_blank;b_item_barcode;b_purchase_multi;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_blank;b_item_barcode;b_purchase_multi;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_item_barcode;b_blank;b_inventory_multi;b_purchase_multi;b_sales_multi;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_query;b_refresh;b_blank;b_delete;b_item_barcode;b_blank;b_inventory_multi;b_purchase_multi;b_sales_multi;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_blank;b_item_barcode;b_purchase_multi;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_blank;b_item_barcode;b_purchase_multi;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =  'b_po;b_pur_invoice;'
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

event e_item_barcode;call super::e_item_barcode;c_string				lc_string
string					ls_obj_name

ls_obj_name = lc_string.f_globalreplace( vs_btn_name, 'b_', 'ur_')
iw_display.f_openchildwithparm( 's_w_multi_n', ls_obj_name+';0')
return 0
end event

event e_window_e_copy_form;call super::e_window_e_copy_form;return 2
end event

event e_window_e_preopen;call super::e_window_e_preopen;//--resize parm --//

iw_display.dynamic f_set_ii_upperpart_height(1400)
iw_display.dynamic f_set_ii_fixedpart2_height(620)

return 0
end event

