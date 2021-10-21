$PBExportHeader$c_prospect.sru
forward
global type c_prospect from s_object_display
end type
end forward

global type c_prospect from s_object_display
end type
global c_prospect c_prospect

forward prototypes
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_related ()
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_dwo_window ()
public function integer f_update_customer_yn_prospect (double vdb_prospect_id, t_transaction vt_transaction)
public function integer f_convert_to_customer ()
public function integer f_convert_to_customer (double vdb_prospect_id, t_transaction vt_transaction)
public function string f_get_info_customer (powerobject vpo_handle, ref string rs_cus_code, ref string rs_cus_tax_number)
public function integer f_change_ref_id (string vs_dwo, double vdb_master_id, string vs_master_table, t_transaction vt_transaction)
end prototypes

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name =  'b_qt;'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

//istr_actionpane[3].s_dwo_action = 'd_action_related_report'
//istr_actionpane[3].s_button_name =  'br_customer_balance;br_customer_balance_detail;'
//istr_actionpane[3].s_objname_handling = this.classname( )
//istr_actionpane[3].s_description = 'Báo cáo liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_map'
istr_dwo_related[1].s_main_obj_dwo = 'd_address_form'
istr_dwo_related[1].s_main_obj_column = 'ID'
istr_dwo_related[1].s_related_obj_dwo = 'd_address_map_form'
istr_dwo_related[1].s_related_obj_column = 'ID'

istr_dwo_related[2].s_related_obj_name = 'u_qt'	
istr_dwo_related[2].s_main_obj_dwo = 'd_objects_grid'	
istr_dwo_related[2].s_main_obj_column = 'id'		
istr_dwo_related[2].s_related_obj_dwo = 'd_order_qt_form'	
istr_dwo_related[2].s_related_obj_column = 'object_id'			
istr_dwo_related[2].s_relatedtext_column = 'code'			
istr_dwo_related[2].s_text = 'Chào giá từ KH tiềm năng: '

istr_dwo_related[2].s_main_obj_dwo_copy[1] = 'd_objects_grid' // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[1] = 'id;code;name;id;code;name;'
istr_dwo_related[2].s_related_obj_dwo_copy[1] = 'd_order_qt_form' //datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[1] = 'object_id;object_code;object_name;bill_to_object;object_code_1;object_name_1;'

istr_dwo_related[2].s_main_obj_dwo_copy[2] = 'd_address_form' // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[2] = 'address;address'
istr_dwo_related[2].s_related_obj_dwo_copy[2] = 'd_order_qt_form' //datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[2] = 'ship_to_addtext;bill_to_addtext;'

istr_dwo_related[2].s_main_obj_dwo_copy[3] = 'd_prospect_form' 
istr_dwo_related[2].s_main_obj_column_copy[3] = 'payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;default_currency;currency_code'
istr_dwo_related[2].s_related_obj_dwo_copy[3] = 'd_order_qt_form' 
istr_dwo_related[2].s_related_obj_column_copy[3] = 'payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;currency_id;uom_code'

istr_dwo_related[2].s_main_obj_column_chk[4] = ''
istr_dwo_related[2].s_related_obj_column_chk[4] = ''
istr_dwo_related[2].s_f_obj_column_chk[4] = ''
istr_dwo_related[2].s_t_obj_column_chk[4] = ''
istr_dwo_related[2].s_main_obj_column_sum[4] = ''
istr_dwo_related[2].s_related_obj_column_sum[4] = ''
istr_dwo_related[2].b_copy_line[4] = false
istr_dwo_related[2].b_f_sum[4] = false
istr_dwo_related[2].s_match_f_dwo[4] = ''
istr_dwo_related[2].s_match_f_col_obj[4] = ''
istr_dwo_related[2].s_match_t_dwo[4] = ''
istr_dwo_related[2].s_match_f_column[4] = ''
istr_dwo_related[2].s_match_t_column[4] = ''
istr_dwo_related[2].s_match_column[4] = ''

istr_dwo_related[3].s_related_obj_name = 'u_customer'	
istr_dwo_related[3].s_main_obj_dwo = 'd_objects_grid'	
istr_dwo_related[3].s_main_obj_column = 'id'		
istr_dwo_related[3].s_related_obj_dwo = 'd_objects_grid'	
istr_dwo_related[3].s_related_obj_column = 'id'			
istr_dwo_related[3].s_relatedtext_column = 'code'					
istr_dwo_related[3].s_text = 'Khách hàng từ KH tiềm năng: '

istr_dwo_related[3].s_main_obj_dwo_copy[1] = 'd_objects_grid' 
istr_dwo_related[3].s_main_obj_column_copy[1] = 'code;name;short_name;manage_group;posting_group;active_yn;group_code;group_name;posting_code;posting_name;id'
istr_dwo_related[3].s_related_obj_dwo_copy[1] = 'd_objects_grid'
istr_dwo_related[3].s_related_obj_column_copy[1] = 'code;name;short_name;manage_group;posting_group;active_yn;group_code;group_name;posting_code;posting_name;prospect_id'

istr_dwo_related[3].s_main_obj_dwo_copy[2] = 'd_prospect_form' 
istr_dwo_related[3].s_main_obj_column_copy[2] = 'payment_term;payment_term_code;payment_term_name;default_currency;currency_code;delivery_mode;delivery_mode_code;delivery_mode_name;'+&
																	'payment_method;payment_method_code;payment_method_name;city;city_code;city_name;district;district_code;district_name;type_company;type_company_code;'+&
																	'type_company_name;type_business;type_business_code;type_business_name;age;scale;scale_code;scale_name;type_customer;type_customer_code;type_customer_name;'
istr_dwo_related[3].s_related_obj_dwo_copy[2] = 'd_customer_form'
istr_dwo_related[3].s_related_obj_column_copy[2] = 'payment_term;payment_term_code;payment_term_name;default_currency;currency_code;delivery_mode;delivery_mode_code;delivery_mode_name;'+&
																	'payment_method;payment_method_code;payment_method_name;city;city_code;city_name;district;district_code;district_name;type_company;type_company_code;'+&
																	'type_company_name;type_business;type_business_code;type_business_name;age;scale;scale_code;scale_name;type_customer;type_customer_code;type_customer_name;'

istr_dwo_related[3].s_main_obj_dwo_copy[3] = 'd_organizations_form' 
istr_dwo_related[3].s_main_obj_column_copy[3] = 'code;name;tax_number;register_number;register_date;website;'
istr_dwo_related[3].s_related_obj_dwo_copy[3] = 'd_organizations_form'
istr_dwo_related[3].s_related_obj_column_copy[3] = 'code;name;tax_number;register_number;register_date;website;'

istr_dwo_related[3].s_main_obj_dwo_copy[4] = 'd_representative_form' 
istr_dwo_related[3].s_main_obj_column_copy[4] = 'last_name;first_name;title;phone;email;date_of_birth;'
istr_dwo_related[3].s_related_obj_dwo_copy[4] = 'd_representative_form'
istr_dwo_related[3].s_related_obj_column_copy[4] = 'last_name;first_name;title;phone;email;date_of_birth;'

istr_dwo_related[3].s_main_obj_dwo_copy[5] = 'd_address_grid' 
istr_dwo_related[3].s_main_obj_column_copy[5] = 'name;tel;fax;address;purpose;tax_code;active_yn;'
istr_dwo_related[3].s_related_obj_dwo_copy[5] = 'd_address_grid'
istr_dwo_related[3].s_related_obj_column_copy[5] = 'name;tel;fax;address;purpose;tax_code;active_yn;'

istr_dwo_related[3].s_main_obj_dwo_copy[6] = 'd_main_contact_form' 
istr_dwo_related[3].s_main_obj_column_copy[6] = 'last_name;first_name;title;phone;email;main_yn;'
istr_dwo_related[3].s_related_obj_dwo_copy[6] = 'd_main_contact_form'
istr_dwo_related[3].s_related_obj_column_copy[6] = 'last_name;first_name;title;phone;email;main_yn;'

//istr_dwo_related[3].s_main_obj_dwo_copy[7] = 'd_address_form' 
//istr_dwo_related[3].s_main_obj_column_copy[7] = 'address;'
//istr_dwo_related[3].s_related_obj_dwo_copy[7] = 'd_address_form'
//istr_dwo_related[3].s_related_obj_column_copy[7] = 'address'

istr_dwo_related[3].s_main_obj_column_chk[6] = ''
istr_dwo_related[3].s_related_obj_column_chk[6] = ''
istr_dwo_related[3].s_main_obj_column_sum[6] = ''
istr_dwo_related[3].s_related_obj_column_sum[6] = ''
istr_dwo_related[3].s_f_obj_column_chk[6] = ''
istr_dwo_related[3].s_t_obj_column_chk[6] = ''
istr_dwo_related[3].b_f_sum[6] = false
istr_dwo_related[3].b_copy_line[6] = false
istr_dwo_related[3].s_match_f_dwo[6] = ''
istr_dwo_related[3].s_match_t_dwo[6] = ''
istr_dwo_related[3].s_match_column[6] = ''
end subroutine

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1dgb_2dfxgb'
iastr_dwo_tabpage[1].i_leftpart_width = 1300
iastr_dwo_tabpage[1].i_fixedpart1_height = 380
iastr_dwo_tabpage[1].i_index = 1
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_address_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_address_grid'
iastr_dwo_tabpage[1].str_dwo[1].b_master = true
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_prospect_form;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = 'd_main_contact_form;d_contact_grid;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = 'd_address_form;'
iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol = 'ID'
iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID'
iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE'
iastr_dwo_tabpage[1].str_dwo[1].b_insert = true
iastr_dwo_tabpage[1].str_dwo[1].b_update = true
iastr_dwo_tabpage[1].str_dwo[1].b_delete = true
iastr_dwo_tabpage[1].str_dwo[1].b_query = true
iastr_dwo_tabpage[1].str_dwo[1].b_print = true
iastr_dwo_tabpage[1].str_dwo[1].b_excel = true
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Trụ sở'
iastr_dwo_tabpage[1].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[1].s_gb_name = 'gb_6'

iastr_dwo_tabpage[1].str_dwo[2].s_dwo_default =  'd_address_form'
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_form = 'd_address_form'
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_grid = ''
iastr_dwo_tabpage[1].str_dwo[2].b_master = false
iastr_dwo_tabpage[1].str_dwo[2].b_detail = false
iastr_dwo_tabpage[1].str_dwo[2].b_shared = true
iastr_dwo_tabpage[1].str_dwo[2].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[2].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_master = 'd_address_grid;'
iastr_dwo_tabpage[1].str_dwo[2].s_master_keycol = ''
iastr_dwo_tabpage[1].str_dwo[2].s_detail_keycol = ''
iastr_dwo_tabpage[1].str_dwo[2].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[2].s_ref_table_field = ''
iastr_dwo_tabpage[1].str_dwo[2].b_insert = true
iastr_dwo_tabpage[1].str_dwo[2].b_update = true
iastr_dwo_tabpage[1].str_dwo[2].b_delete = true
iastr_dwo_tabpage[1].str_dwo[2].b_query = true
iastr_dwo_tabpage[1].str_dwo[2].b_print = true
iastr_dwo_tabpage[1].str_dwo[2].b_excel = true
//iastr_dwo_tabpage[1].str_dwo[2].b_focus_master = true
iastr_dwo_tabpage[1].str_dwo[2].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[2].s_description ='Địa chỉ trụ sở'
iastr_dwo_tabpage[1].str_dwo[2].s_gb_name = 'gb_7'

iastr_dwo_tabpage[1].str_dwo[3].s_dwo_default =  'd_main_contact_form'
iastr_dwo_tabpage[1].str_dwo[3].s_dwo_form = 'd_main_contact_form'
iastr_dwo_tabpage[1].str_dwo[3].s_dwo_grid = ''
iastr_dwo_tabpage[1].str_dwo[3].b_master = false
iastr_dwo_tabpage[1].str_dwo[3].b_detail = true
iastr_dwo_tabpage[1].str_dwo[3].b_shared = false
iastr_dwo_tabpage[1].str_dwo[3].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[3].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[3].s_dwo_master = 'd_address_grid;'
iastr_dwo_tabpage[1].str_dwo[3].s_master_keycol = 'ID'
iastr_dwo_tabpage[1].str_dwo[3].s_detail_keycol = 'OBJECT_REF_ID'
iastr_dwo_tabpage[1].str_dwo[3].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE'
iastr_dwo_tabpage[1].str_dwo[3].b_insert = true
iastr_dwo_tabpage[1].str_dwo[3].b_update = true
iastr_dwo_tabpage[1].str_dwo[3].b_delete = true
iastr_dwo_tabpage[1].str_dwo[3].b_query = true
iastr_dwo_tabpage[1].str_dwo[3].b_print = true
iastr_dwo_tabpage[1].str_dwo[3].b_excel = true
iastr_dwo_tabpage[1].str_dwo[3].b_focus_master = true
iastr_dwo_tabpage[1].str_dwo[3].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[3].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[3].s_description ='Người liên hệ chính'

iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_display_model = '1d'
iastr_dwo_tabpage[2].i_index = 2
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_contact_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = 'd_contact_form'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = 'd_contact_grid'
iastr_dwo_tabpage[2].str_dwo[1].b_master = false
iastr_dwo_tabpage[2].str_dwo[1].b_detail = true
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_address_grid;'
iastr_dwo_tabpage[2].str_dwo[1].s_master_keycol = 'ID'
iastr_dwo_tabpage[2].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID'
iastr_dwo_tabpage[2].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[2].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE'
iastr_dwo_tabpage[2].str_dwo[1].b_insert = true
iastr_dwo_tabpage[2].str_dwo[1].b_update = true
iastr_dwo_tabpage[2].str_dwo[1].b_delete = true
iastr_dwo_tabpage[2].str_dwo[1].b_query = true
iastr_dwo_tabpage[2].str_dwo[1].b_print = true
iastr_dwo_tabpage[2].str_dwo[1].b_excel = true
iastr_dwo_tabpage[2].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[2].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[2].str_dwo[1].s_description ='Người liên hệ'
end subroutine

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_objects_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_objects_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].b_traceable = true
istr_dwo[1].s_dwo_details = 'd_prospect_form;'
istr_dwo[1].s_dwo_shared = 'd_objects_form;'
istr_dwo[1].b_ref_table_yn  = true
istr_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Khách hàng tiềm năng'

istr_dwo[2].s_dwo_default =  'd_objects_form'
istr_dwo[2].s_dwo_form = 'd_objects_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_shared = true
istr_dwo[2].s_dwo_master = 'd_objects_grid;'
istr_dwo[2].s_master_keycol = ''
istr_dwo[2].s_detail_keycol = ''
istr_dwo[2].b_ref_table_yn  = false
istr_dwo[2].s_ref_table_field = ''
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].b_focus_master = true
istr_dwo[2].s_description = 'Khách hàng tiềm năng'
istr_dwo[2].s_pic_ref_table = ''
istr_dwo[2].s_pic_ref_field = ''

istr_dwo[3].s_dwo_default =  'd_prospect_form'
istr_dwo[3].s_dwo_form = 'd_prospect_form'
istr_dwo[3].s_dwo_grid = ''
istr_dwo[3].b_detail = true
istr_dwo[3].b_master = true
istr_dwo[3].s_dwo_master = 'd_objects_grid;'
istr_dwo[3].s_dwo_details = 'd_organizations_form;d_representative_form;d_address_grid;'
istr_dwo[3].s_master_keycol = 'ID;'
istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[3].b_ref_table_yn  = true
istr_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[3].b_insert = true
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = true
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_excel = true
istr_dwo[3].b_cascade_del = true
istr_dwo[3].b_traceable = true
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].b_focus_master = true
istr_dwo[3].s_description = 'Thông tin khách hàng'

istr_dwo[4].s_dwo_default =  'd_organizations_form'
istr_dwo[4].s_dwo_form = 'd_organizations_form'
istr_dwo[4].s_dwo_grid = ''
istr_dwo[4].b_detail = true
istr_dwo[4].s_dwo_master = 'd_prospect_form;'
istr_dwo[4].s_master_keycol = 'ID'
istr_dwo[4].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[4].b_ref_table_yn  = false
istr_dwo[4].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[4].s_pic_ref_colname = ''
istr_dwo[4].s_pic_ref_field = ''
istr_dwo[4].s_pic_ref_table = ''
istr_dwo[4].b_insert = true
istr_dwo[4].b_update = true
istr_dwo[4].b_delete = true
istr_dwo[4].b_query = true
istr_dwo[4].b_print = true
istr_dwo[4].b_excel = true
istr_dwo[4].b_cascade_del = true
istr_dwo[4].b_traceable = true
istr_dwo[4].b_keyboardlocked = true
istr_dwo[4].b_focus_master = true
istr_dwo[4].s_description = 'Thông tin khách hàng'

istr_dwo[5].s_dwo_default =  'd_representative_form'
istr_dwo[5].s_dwo_form = 'd_representative_form'
istr_dwo[5].s_dwo_grid = ''
istr_dwo[5].b_detail = true
istr_dwo[5].s_dwo_master = 'd_prospect_form;'
istr_dwo[5].s_master_keycol = 'ID'
istr_dwo[5].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[5].b_ref_table_yn  = true
istr_dwo[5].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[5].b_insert = true
istr_dwo[5].b_update = true
istr_dwo[5].b_delete = true
istr_dwo[5].b_query = true
istr_dwo[5].b_print = true
istr_dwo[5].b_excel = true
istr_dwo[5].b_cascade_del = true
istr_dwo[5].b_keyboardlocked = true
istr_dwo[5].b_traceable = true
istr_dwo[5].b_focus_master = false
istr_dwo[5].s_description = 'Người đại diện'
end subroutine

public function integer f_update_customer_yn_prospect (double vdb_prospect_id, t_transaction vt_transaction);/****************************************************************************
Cập nhật cột customer_yn của bản prospect khi chào giá thành công hoặc khi chuyển kh tiềm năng sang kh
tham số	vs_prospect_id: id của đối tượng khách hàng tiềm năng
			vt_transaction: session của form đang open
return 	1 update thành công
			-1 lỗi
			0 không làm gì
*****************************************************************************/
string		ls_object_code
double	ldb_ps_id,ldb_ps_object_ref_id,ldb_object_id

if isnull(ldb_object_id) or ldb_object_id = 0 then return 0
//iw_display.f_get_transaction( lt_transaction)
Select prospect.id,prospect.object_ref_id into :ldb_ps_id,:ldb_ps_object_ref_id
From prospect join object on object.id = prospect.object_ref_id
Where object.active_yn = 'Y' and (prospect.customer_yn = 'N' or prospect.customer_yn is null) and object.id = :vdb_prospect_id Using SQLCA;
if SQLCA.sqlcode = 0 then
	Update prospect
	Set prospect.customer_yn = 'Y'
	where prospect.id = :ldb_ps_id Using vt_transaction;
	if vt_transaction.sqlcode = 0 then
		Update object
		Set object.active_yn = 'N'
		Where object.id = :ldb_ps_object_ref_id Using vt_transaction;
		if vt_transaction.sqlcode = -1 then 
			return -1
		elseif vt_transaction.sqlcode = 0 then
			return 1
		end if
	else
		return -1
	end if
elseif SQLCA.sqlcode = 100 then
	return 0
else
	return -1
end if
return 0
end function

public function integer f_convert_to_customer ();/*******************************************
Chuyển khách hàng tiềm năng thành khách hàng
return 	1 thành công
			-1 lỗi
*******************************************/
t_transaction	lt_transaction
t_dw_mpl		ldw_temp
t_ds_db			lds_temp

double			ldb_id,ldb_master_id
string				ls_cus_code,ls_tax_number
int					li_row,li_rtn

iw_display.f_get_transaction( lt_transaction)
ldw_temp = iw_display.f_get_dw( 'd_objects_grid')

lds_temp = create t_ds_db
lds_temp.dataobject = 'd_objects_grid'
lds_temp.f_settransobject(lt_transaction)
//insert object
ldw_temp.rowscopy( ldw_temp.getrow(), ldw_temp.getrow(), primary!,lds_temp , 1, primary!)
lds_temp.event e_postinsertrow( 1)
ldb_master_id = this.f_create_id()
lds_temp.setitem( 1, 'ID',ldb_master_id )
lds_temp.setitem( 1, 'object_ref_table', 'CUSTOMER')
lds_temp.setitem( 1, 'HANDLED_BY', gi_userid)
lds_temp.setitem( lds_temp.getrow(), 'active_yn', 'Y')
this.f_get_info_customer( ldw_temp,ls_cus_code,ls_tax_number)
if ls_cus_code = '' or ls_tax_number = '' then 
	gf_messagebox('m.c_prospect.f_convert_to_customer.01','Thông báo','Chưa nhập mã khách hàng mới hoặc chưa khai báo mã số thuế','exclamation','ok',1)
	return -1
end if
lds_temp.setitem( 1, 'CODE',ls_cus_code )
if lds_temp.update(true,false) = 1 then
	lds_temp.resetupdate( )
else
	destroy lds_temp
	return -1
end if
//insert customer
ldw_temp = iw_display.f_get_dw( 'd_prospect_form')
lds_temp.dataobject = 'd_customer_form'
lds_temp.f_settransobject(lt_transaction)
li_row = lds_temp.event e_addrow( )
ldb_id = this.f_create_id()
lds_temp.setitem( li_row, 'ID', ldb_id)
lds_temp.setitem( li_row, 'object_ref_id', ldb_master_id)
lds_temp.setitem( li_row, 'object_ref_table', 'OBJECT')
lds_temp.setitem( li_row, 'PAYMENT_TERM', ldw_temp.getitemnumber(ldw_temp.getrow(),'PAYMENT_TERM'))
lds_temp.setitem( li_row, 'DEFAULT_CURRENCY', ldw_temp.getitemnumber(ldw_temp.getrow(),'DEFAULT_CURRENCY'))
lds_temp.setitem( li_row, 'DELIVERY_MODE', ldw_temp.getitemnumber(ldw_temp.getrow(),'DELIVERY_MODE'))
lds_temp.setitem( li_row, 'TYPE_CUSTOMER', ldw_temp.getitemnumber(ldw_temp.getrow(),'TYPE_CUSTOMER'))
lds_temp.setitem( li_row, 'PAYMENT_METHOD', ldw_temp.getitemnumber(ldw_temp.getrow(),'PAYMENT_METHOD'))
lds_temp.setitem( li_row, 'CITY', ldw_temp.getitemnumber(ldw_temp.getrow(),'CITY'))
lds_temp.setitem( li_row, 'DISTRICT', ldw_temp.getitemnumber(ldw_temp.getrow(),'DISTRICT'))
lds_temp.setitem( li_row, 'TYPE_COMPANY', ldw_temp.getitemnumber(ldw_temp.getrow(),'TYPE_COMPANY'))
lds_temp.setitem( li_row, 'TYPE_BUSINESS', ldw_temp.getitemnumber(ldw_temp.getrow(),'TYPE_BUSINESS'))
lds_temp.setitem( li_row, 'AGE', ldw_temp.getitemnumber(ldw_temp.getrow(),'AGE'))
lds_temp.setitem( li_row, 'SCALE', ldw_temp.getitemnumber(ldw_temp.getrow(),'SCALE'))
if lds_temp.update(true,false ) = 1 then
	lds_temp.resetupdate( )
	ldb_master_id = ldb_id
else
	destroy lds_temp
	return -1
end if
//change d_organizations_form
ldw_temp = iw_display.f_get_dw( 'd_organizations_form')
ldw_temp.setitem( 1, 'object_ref_id', ldb_master_id)
ldw_temp.setitem( 1, 'object_ref_table', 'CUSTOMER')
ldw_temp.setitem( 1, 'tax_number', ls_tax_number)

//change d_representative_form
ldw_temp = iw_display.f_get_dw( 'd_representative_form')
ldw_temp.setitem( 1, 'object_ref_id', ldb_master_id)
ldw_temp.setitem( 1, 'object_ref_table', 'CUSTOMER')

//change address
ldw_temp = iw_display.f_get_dw( 'd_address_grid')
ldw_temp.setitem( 1, 'object_ref_id', ldb_master_id)
ldw_temp.setitem( 1, 'object_ref_table', 'CUSTOMER')

destroy lds_temp
return 1
end function

public function integer f_convert_to_customer (double vdb_prospect_id, t_transaction vt_transaction);/*******************************************
Chuyển khách hàng tiềm năng thành khách hàng
return 	1 thành công
			-1 lỗi
*******************************************/
t_ds_db			lds_temp,lds_prospect

double			ldb_id,ldb_master_id
string				ls_cus_code,ls_tax_number
any				laa_data[]
int					li_row,li_rtn


laa_data[1] = vdb_prospect_id
lds_temp = create t_ds_db
lds_prospect = create t_ds_db
lds_prospect.dataobject = 'ds_prospect_grid'
lds_prospect.f_add_where( 'object_id', laa_data)
lds_prospect.f_settransobject(vt_transaction)
li_rtn = lds_prospect.retrieve( )
if li_rtn <= 0 then 
	destroy lds_prospect
	destroy lds_temp
	return 0
end if
//insert object
lds_temp.dataobject = 'd_objects_grid'
lds_temp.f_settransobject(vt_transaction)
li_row = lds_temp.event e_addrow( )
ldb_master_id = this.f_create_id()
lds_temp.setitem( li_row, 'ID', ldb_master_id)
lds_temp.setitem( li_row, 'SHORT_NAME', lds_prospect.getitemstring(li_rtn, 'SHORT_NAME') )
lds_temp.setitem( li_row, 'OBJECT_REF_TABLE', 'CUSTOMER' )
lds_temp.setitem( li_row, 'NAME', lds_prospect.getitemstring(li_rtn,'name'))
lds_temp.setitem( li_row, 'ACTIVE_YN', 'Y')
lds_temp.setitem( li_row, 'ID', ldb_master_id)
lds_temp.setitem( li_row, 'POSTING_GROUP', lds_prospect.getitemnumber( li_rtn,'POSTING_GROUP' ) )
lds_temp.setitem( li_row, 'MANAGE_GROUP', lds_prospect.getitemnumber( li_rtn,'MANAGE_GROUP' ) )
lds_temp.setitem( li_row, 'HANDLED_BY', gi_userid )
this.f_get_info_customer( lds_prospect,ls_cus_code,ls_tax_number)
if ls_cus_code = '' or ls_tax_number = '' then
	gf_messagebox('m.c_prospect.f_convert_to_customer.01','Thông báo','Chưa nhập mã khách hàng mới hoặc chưa khai báo mã số thuế','exclamation','ok',1)
	return -1
end if
lds_temp.setitem( 1, 'CODE',ls_cus_code )
if lds_temp.update(true,false) = 1 then
	lds_temp.resetupdate( )
else
	destroy lds_prospect
	destroy lds_temp
	return -1
end if
//update object id
update orders
set bill_to_object = :ldb_master_id, object_id = :ldb_master_id
where bill_to_object = :vdb_prospect_id using vt_transaction;
if vt_transaction.sqlcode <> 0 then
	destroy lds_prospect
	destroy lds_temp
	return -1
end if
//insert customer
lds_temp.dataobject = 'd_customer_form'
lds_temp.f_settransobject(vt_transaction)
li_row = lds_temp.event e_addrow( )
lds_temp.setitem( li_row, 'OBJECT_REF_ID', ldb_master_id)
lds_temp.setitem( li_row, 'OBJECT_REF_TABLE', 'OBJECT')
ldb_master_id = this.f_create_id()
lds_temp.setitem( li_row, 'ID', ldb_master_id)
lds_temp.setitem( li_row, 'PAYMENT_TERM', lds_prospect.getitemnumber( li_rtn,'PAYMENT_TERM_ID' ) )
lds_temp.setitem( li_row, 'DEFAULT_CURRENCY', lds_prospect.getitemnumber( li_rtn,'CURRENCY_ID' ) )
lds_temp.setitem( li_row, 'DELIVERY_MODE', lds_prospect.getitemnumber( li_rtn,'DELIVERY_MODE_ID' ) )
lds_temp.setitem( li_row, 'PAYMENT_METHOD', lds_prospect.getitemnumber( li_rtn,'PAYMENT_METHOD_ID' ) )
lds_temp.setitem( li_row, 'CITY', lds_prospect.getitemnumber( li_rtn,'CITY' ) )
lds_temp.setitem( li_row, 'DISTRICT', lds_prospect.getitemnumber( li_rtn,'DISTRICT' ) )
lds_temp.setitem( li_row, 'TYPE_COMPANY', lds_prospect.getitemnumber( li_rtn,'TYPE_COMPANY' ) )
lds_temp.setitem( li_row, 'TYPE_BUSINESS', lds_prospect.getitemnumber( li_rtn,'TYPE_BUSINESS' ) )
lds_temp.setitem( li_row, 'SCALE', lds_prospect.getitemnumber( li_rtn,'SCALE' ) )
lds_temp.setitem( li_row, 'TYPE_CUSTOMER', lds_prospect.getitemnumber( li_rtn,'TYPE_CUSTOMER' ) )
if lds_temp.update(true,false ) = 1 then
	lds_temp.resetupdate( )
else
	destroy lds_prospect
	destroy lds_temp
	return -1
end if
// update tax number
ldb_id = lds_prospect.getitemnumber( li_rtn, 'ID')
update ORGANIZATION 
set tax_number = :ls_tax_number
where OBJECT_REF_ID = :ldb_id using vt_transaction;
if vt_transaction.sqlcode <> 0 then
	destroy lds_prospect
	destroy lds_temp
	return -1
end if
//change d_organizations_form
if this.f_change_ref_id( 'd_organizations_form', ldb_master_id, 'CUSTOMER', vt_transaction) = -1 then 
	destroy lds_prospect
	destroy lds_temp
	return -1
end if
//change d_representative_form
if this.f_change_ref_id( 'd_representative_form', ldb_master_id, 'CUSTOMER', vt_transaction) = -1 then
	destroy lds_prospect
	destroy lds_temp
	return -1
end if
//change address
if this.f_change_ref_id( 'd_address_grid', ldb_master_id, 'CUSTOMER', vt_transaction) = -1 then
	destroy lds_prospect
	destroy lds_temp
	return -1
end if
// bỏ tích active prospect
lds_temp.dataobject = 'd_objects_grid'
lds_temp.f_add_where( 'id', laa_data)
lds_temp.f_settransobject(vt_transaction)
li_rtn = lds_temp.retrieve( )
lds_temp.setitem( li_rtn, 'active_yn', 'N')
if lds_temp.update(true,false) = 1 then
	lds_temp.resetupdate( )
else
	destroy lds_prospect
	destroy lds_temp
	return -1
end if
// tích customer prospect lds_prospect
laa_data[1] = lds_prospect.getitemnumber(lds_prospect.getrow( ) , 'id')
lds_temp.dataobject = 'd_prospect_form'
lds_temp.f_add_where( 'id', laa_data)
lds_temp.f_settransobject(vt_transaction)
li_rtn = lds_temp.retrieve( )
lds_temp.setitem( li_rtn, 'customer_yn', 'Y')
if lds_temp.update(true,false) = 1 then
	lds_temp.resetupdate( )
else
	destroy lds_prospect
	destroy lds_temp
	return -1
end if
destroy lds_temp
destroy lds_prospect
return 1
end function

public function string f_get_info_customer (powerobject vpo_handle, ref string rs_cus_code, ref string rs_cus_tax_number);/****************************************
Kiểm tra cài đặt đánh số tự động của khách hàng khi chuyển
khách hàng tiềm năng sang khách hàng. Nếu không cài đăt
thì mở form lên nhập mã khách hàng
****************************************/
t_ds_db			lds_return
u_customer		u_cus
b_sequences	lb_sequences
b_popup_data	lb_popup_data

boolean			lb_popup
double			ldb_seq_id
string				ls_seq_reset_colname
int					li_rtn

//-- kiểm tra code có cài tự động tạo hay người dùng nhập --//
lb_popup_data = create b_popup_data
lb_popup_data.f_init_popup_display( '1d', 'dp_customer_form','Nhập mã khách hàng','Nhập mã khách hàng','Nhập mã khách hàng', 2200, 1000)
u_cus = create u_customer
li_rtn = u_cus.idwsetup_initial.f_get_sequence_info( vpo_handle, 'code', ldb_seq_id, ls_seq_reset_colname)
if li_rtn = 1 then
	//--cus có cài đặt tự đánh số--//
	if lb_sequences.f_init(ldb_seq_id) = 1 then
		if lb_sequences.is_type = 'manual' then 
			lb_popup = true
		else
			if lb_sequences.is_reset_type = 'none' then
				rs_cus_code = lb_sequences.f_create_autonumber(ldb_seq_id)
			else
				//--message khách hàng không cần reset theo date--//
			end if
		end if
	else
	end if
else
	//--cus không có cài đặt tự đánh số--//
	lb_popup = true
//	li_rtn = this.idwsetup_initial.f_get_sequence_info( vdw_handle, 'code', ldb_seq_id, ls_seq_reset_colname)
//	if li_rtn = 0 then
//		//-- cả prospect cũng không cài đánh số tự động--//
//		//-- mở của sổ nhập cus_code hoặc lấy code của prospect qua cho cus --//
//	else
//		
//	end if
end if
//-- mở cửa sổ nhập cus code và tax_number --//
if lb_popup then
	lb_popup_data.is_display_column = 'cus_name;'
	lb_popup_data.iaa_default_data[1] = vpo_handle.dynamic getitemstring(vpo_handle.dynamic getrow(),'name')
	openwithparm(s_wr_multi, lb_popup_data)
	lds_return = message.powerobjectparm
	if isvalid(lds_return) then
		setnull( message.powerobjectparm)
		rs_cus_code = lds_return.getitemstring( 1, 'cus_code')
		rs_cus_tax_number = lds_return.getitemstring( 1, 'tax_number')
		if isnull(rs_cus_code) then rs_cus_code = ''
		if isnull(rs_cus_tax_number) then rs_cus_tax_number = ''
	end if
end if
destroy lds_return
destroy u_cus
destroy lb_popup_data
return rs_cus_code
end function

public function integer f_change_ref_id (string vs_dwo, double vdb_master_id, string vs_master_table, t_transaction vt_transaction);int			li_rtn,li_row
any		laa_data[]

t_ds_db	lds_temp

lds_temp = create t_ds_db
lds_temp.dataobject = vs_dwo
laa_data[1] = vdb_master_id
lds_temp.f_add_where( 'object_ref_id', laa_data)
lds_temp.f_settransobject(vt_transaction)
li_rtn = lds_temp.retrieve( )
for li_row = 1 to li_rtn
	lds_temp.setitem( li_row, 'object_ref_id', vdb_master_id)
	lds_temp.setitem( li_row, 'object_ref_table', vs_master_table)
next
if li_rtn > 0 then
	if lds_temp.update(true,false ) = 1 then
		lds_temp.resetupdate( )
	else
		destroy lds_temp
		return -1
	end if
end if
destroy lds_temp
return 1
end function

on c_prospect.create
call super::create
end on

on c_prospect.destroy
call super::destroy
end on

event constructor;call super::constructor;
is_table = 'object'
ib_changed_dwo_4edit = false
this.ib_keyboardlocked = true
is_display_model = 'up_1d_4d_lo_tb'
is_object_title = 'Khách hàng tiềm năng'
istr_actionpane[1].s_button_name = 'b_add;b_insert;b_modify;b_save;b_query;b_execquery;b_filteron;b_refresh;b_delete;b_copyt_qt;b_copyt_customer'
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title



end event

event e_action_ctrl_bttn;call super::e_action_ctrl_bttn;//-- override --//

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
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify; b_filteron;b_query;b_refresh;b_delete;b_blank;b_copyt_qt;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_filteron;b_query;b_refresh;b_delete;b_blank;b_copyt_qt;'
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query; b_refresh;b_delete;b_blank;b_copyt_qt;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query; b_refresh;b_delete;b_blank;b_copyt_qt;'
					end if
				end if
			else				
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_blank;b_copyt_qt;'
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_blank;b_copyt_qt;'
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
			istr_actionpane[li_idx].s_visible_buttons =   'b_qt;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
			istr_actionpane[li_idx].s_visible_buttons =  'b_attach;b_note;b_user_trace;'
	//	elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then		
	//		istr_actionpane[li_idx].s_visible_buttons =  'br_customer_balance;br_customer_balance_detail;'
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;long     				ll_find
t_dw_mpl			ldw_share

if AncestorReturnValue = 1 then return 1
	if pos(rpo_dw.dataobject,'d_address') > 0 then
		if vs_colname = 'active_yn' then
			ll_find = rpo_dw.find( "active_yn = 'Y'", 1, rpo_dw.rowcount( ) )
			if ll_find > 0 then
				rpo_dw.setitem(ll_find,'active_yn','N')
			end if
		end if
	elseif pos(rpo_dw.dataobject,'d_contact_grid') > 0 then
		ldw_share = iw_display.f_get_dw('d_main_contact_form' )
		//d_main_contact_form
		if vs_colname = 'main_yn' then
			ll_find = rpo_dw.find( "main_yn = 'Y'", 1, rpo_dw.rowcount( ) )
			if ll_find > 0 then
				rpo_dw.setitem(ll_find,'main_yn','N')
			end if
			ll_find = ldw_share.find( "main_yn = 'Y'",1, ldw_share.rowcount( ))
			if ll_find > 0 then
				ldw_share.setitem(ll_find,'main_yn','N')
			end if
		end if
	end if
	return AncestorReturnValue
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;string						ls_code,ls_name, ls_staff_name
decimal					ldc_id
double					ldb_staff_id
t_dw_mpl				ldw_handle

if pos(rpo_dw.dataobject, 'd_objects_')> 0 then
	ldw_handle = iw_display.f_get_dw('d_prospect_form')
	ldw_handle.event e_addrow( )
	ldw_handle = iw_display.f_get_dw('d_organizations_form')
	ldw_handle.event e_addrow( )	
	ldw_handle = iw_display.f_get_dw('d_representative_form')
	ldw_handle.event e_addrow( )
	// Gán user id khi tạo mới KH
	rpo_dw.setitem(vl_currentrow,'handled_by',gi_userid)
	rpo_dw.setitem(vl_currentrow,'active_yn','Y')
	rpo_dw.setitem(vl_currentrow,'staff_name', g_user.f_get_name_of_userid(gi_userid))
elseif mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_prospect' then
//	ls_code = rpo_dw.getitemstring(vl_currentrow,'payment_method_code')
//	SELECT ID,NAME INTO :ldc_id,:ls_name
//	FROM VALUESET_VALUE
//	WHERE CODE =:ls_code
//    AND NVL(UP_ID,0) = 0
//    AND NVL(ID_COMBINATION,'@') = '@' USING SQLCA;
//	if SQLCA.sqlcode = 0 then
//		rpo_dw.setitem(vl_currentrow,'payment_method',ldc_id)
//		rpo_dw.setitem(vl_currentrow,'payment_method_name',ls_name)
//	elseif SQLCA.sqlcode = 100 then
//		gf_messagebox('m.c_customer.e_dw_e_postinsertrow.02','Thông báo','Chưa khai báo phương thức thanh toán này ','exclamation','ok',1)
//		return -1
//	else
//		//--lỗi --//
//		messagebox('Lỗi','c_customer.e_dw_e_postinsertrow(line:39)')
//		return -1
//	end if
    SELECT uom.id, uom.code INTO :ldc_id,:ls_code
    FROM unit_class
    LEFT JOIN uom on uom.class_id = unit_class.id
    WHERE unit_class.currency_yn = 'Y' AND uom.base_yn = 'Y' USING SQLCA;
	if SQLCA.sqlcode = 0 then
		rpo_dw.setitem(vl_currentrow,'default_currency',ldc_id)
		rpo_dw.setitem(vl_currentrow,'currency_code',ls_code)
	elseif SQLCA.sqlcode = 100 then
		gf_messagebox('m.c_customer.e_dw_e_postinsertrow.02','Thông báo','Chưa khai báo đồng tiền hạch toán','exclamation','ok',1)
		return -1
	else
		//--lỗi --//
		messagebox('Lỗi','c_customer.e_dw_e_postinsertrow(line:54)')
		return -1
	end if
	ldw_handle = iw_display.dynamic f_get_dw('d_address_grid')
	ldw_handle.event e_addrow( )
elseif pos(rpo_dw.dataobject, 'd_address_') > 0 then
	if rpo_dw.rowcount() = 1 then
		rpo_dw.setitem(vl_currentrow,'purpose','invoice')
		rpo_dw.setitem(vl_currentrow,'name','VP')
		rpo_dw.setitem(vl_currentrow,'active_yn','Y')
	else
		rpo_dw.setitem(vl_currentrow,'purpose','delivery')
		rpo_dw.setitem(vl_currentrow,'name','GH')
	end if
	ldw_handle = iw_display.f_get_dw('d_main_contact_form')
	ldw_handle.event e_addrow( )
//elseif rpo_dw.dataobject= 'd_customer_bank_grid' then
//	ldw_handle = iw_display.dynamic f_get_dw('d_customer_bank_add_form')
//	ldw_handle.event e_addrow( )	
//elseif rpo_dw.dataobject= 'd_customer_bank_add_form' then
//	rpo_dw.setitem(vl_currentrow, 'purpose', 'bank')
end if
return vl_currentrow
end event

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.dynamic f_set_ii_fixedpart1_height(350)
iw_display.dynamic f_set_ii_upperpart_height(1130)
iw_display.dynamic f_set_ii_leftpart_width(1250)
iw_display.f_set_ii_fixedpart2_height( 490)
return 0
end event

event e_window_open;call super::e_window_open;t_dw_mpl			ldw_main
any				laa_value[]

//-- add where customer --//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = 'PROSPECT'
ldw_main.f_add_where('object_ref_table;',laa_value[])

return 0
end event

event e_dw_e_save;call super::e_dw_e_save;t_dw_mpl	ldw_temp
double		ldb_prospect_id
int				li_rtn

if rpo_dw.dataobject = 'd_prospect_form' then
	if rpo_dw.getitemstring(rpo_dw.getrow(),'customer_yn') = 'Y' then
		ldw_temp = iw_display.f_get_dwmain( )
		ldb_prospect_id = ldw_temp.getitemnumber( ldw_temp.getrow(), 'ID')
		li_rtn = this.f_convert_to_customer()
		if li_rtn = -1 then return -1
	end if
elseif rpo_dw.dataobject = 'd_objects_grid' then
	ldw_temp = iw_display.f_get_dw( 'd_prospect_form')
	if ldw_temp.getitemstring(ldw_temp.getrow(),'customer_yn') = 'Y' then
		rpo_dw.setitem( rpo_dw.getrow(), 'active_yn', 'N')
	end if
end if
return 1
end event

event e_dw_e_presave;call super::e_dw_e_presave;t_dw_mpl	ldw_temp

if rpo_dw.dataobject = 'd_objects_grid' then
	ldw_temp = iw_display.f_get_dw( 'd_prospect_form')
	if ldw_temp.getitemstring(ldw_temp.getrow(),'customer_yn') = 'Y' then
		rpo_dw.setitem( rpo_dw.getrow(), 'active_yn', 'N')
	end if
end if
return 1
end event

event e_dw_e_postsave;call super::e_dw_e_postsave;t_dw_mpl	ldw_temp
double		ldb_prospect_id
int				li_rtn

//if rpo_dw.dataobject = 'd_prospect_form' then
//	if rpo_dw.getitemstring(rpo_dw.getrow(),'customer_yn') = 'Y' then
//		ldw_temp = iw_display.f_get_dwmain( )
//		ldb_prospect_id = ldw_temp.getitemnumber( ldw_temp.getrow(), 'ID')
//		li_rtn = this.f_convert_to_customer()
//		if li_rtn = -1 then return -1
//	end if
//end if
return 1
end event

