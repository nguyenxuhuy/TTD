$PBExportHeader$u_vendor.sru
forward
global type u_vendor from cl_vendor
end type
end forward

global type u_vendor from cl_vendor
end type
global u_vendor u_vendor

forward prototypes
public subroutine f_set_dwo_tabpage ()
end prototypes

public subroutine f_set_dwo_tabpage ();
iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1dgb_2dfxgb'
iastr_dwo_tabpage[1].i_leftpart_width = 1300
iastr_dwo_tabpage[1].i_fixedpart1_height = 280
iastr_dwo_tabpage[1].i_index = 1
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_address_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_address_grid'
iastr_dwo_tabpage[1].str_dwo[1].b_master = true
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_vendor_form;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = 'd_main_contact_form;d_contact_grid;d_main_contact_form;'
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
iastr_dwo_tabpage[1].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Trụ sở'
iastr_dwo_tabpage[1].str_dwo[1].s_gb_name = 'gb_6'

iastr_dwo_tabpage[1].str_dwo[2].s_dwo_default =  'd_address_form'
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_form = 'd_address_form'
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_grid = ''
iastr_dwo_tabpage[1].str_dwo[2].b_master = false
iastr_dwo_tabpage[1].str_dwo[2].b_detail = false
iastr_dwo_tabpage[1].str_dwo[2].b_shared = true
iastr_dwo_tabpage[1].str_dwo[2].b_cascade_del = true
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
iastr_dwo_tabpage[1].str_dwo[2].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[2].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[2].s_description ='Địa chỉ trụ sở'
iastr_dwo_tabpage[1].str_dwo[2].s_gb_name = 'gb_7'

iastr_dwo_tabpage[1].str_dwo[3].s_dwo_default =  'd_main_contact_form'
iastr_dwo_tabpage[1].str_dwo[3].s_dwo_form = 'd_main_contact_form'
iastr_dwo_tabpage[1].str_dwo[3].s_dwo_grid = ''
iastr_dwo_tabpage[1].str_dwo[3].b_master = false
iastr_dwo_tabpage[1].str_dwo[3].b_detail = true
iastr_dwo_tabpage[1].str_dwo[3].b_shared = false
iastr_dwo_tabpage[1].str_dwo[3].b_cascade_del = false
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
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = false
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

iastr_dwo_tabpage[3].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[3].s_display_model ='2d'
iastr_dwo_tabpage[3].i_upperpart_height = 400
iastr_dwo_tabpage[3].i_index = 3
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_default =  'd_vendor_bank_grid'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_grid = 'd_vendor_bank_grid'
iastr_dwo_tabpage[3].str_dwo[1].b_master = true
iastr_dwo_tabpage[3].str_dwo[1].b_detail = true
iastr_dwo_tabpage[3].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_details = 'd_vendor_bank_add_form'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_master = 'd_objects_grid;'
iastr_dwo_tabpage[3].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[3].str_dwo[1].s_detail_keycol = 'object_ref_id;'
iastr_dwo_tabpage[3].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[3].str_dwo[1].s_ref_table_field = 'object_ref_table'
iastr_dwo_tabpage[3].str_dwo[1].b_insert = true
iastr_dwo_tabpage[3].str_dwo[1].b_update = true
iastr_dwo_tabpage[3].str_dwo[1].b_delete = true
iastr_dwo_tabpage[3].str_dwo[1].b_query = true
iastr_dwo_tabpage[3].str_dwo[1].b_print = true
iastr_dwo_tabpage[3].str_dwo[1].b_excel = true
iastr_dwo_tabpage[3].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[3].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[3].str_dwo[1].s_description ='Ngân hàng nhà cung cấp'

iastr_dwo_tabpage[3].str_dwo[2].s_dwo_default = 'd_vendor_bank_add_form'
iastr_dwo_tabpage[3].str_dwo[2].s_dwo_form = 'd_vendor_bank_add_form'
iastr_dwo_tabpage[3].str_dwo[2].s_dwo_grid = ''
iastr_dwo_tabpage[3].str_dwo[2].b_shared = false
iastr_dwo_tabpage[3].str_dwo[2].b_detail = true
iastr_dwo_tabpage[3].str_dwo[2].b_cascade_del = false
iastr_dwo_tabpage[3].str_dwo[2].s_dwo_details = ''
iastr_dwo_tabpage[3].str_dwo[2].s_dwo_master = 'd_vendor_bank_grid;'
iastr_dwo_tabpage[3].str_dwo[2].s_master_keycol = 'ID;'
iastr_dwo_tabpage[3].str_dwo[2].s_detail_keycol = 'object_ref_id;'
iastr_dwo_tabpage[3].str_dwo[2].b_ref_table_yn  = false
iastr_dwo_tabpage[3].str_dwo[2].s_ref_table_field = 'object_ref_table'
iastr_dwo_tabpage[3].str_dwo[2].b_insert = true
iastr_dwo_tabpage[3].str_dwo[2].b_update = true
iastr_dwo_tabpage[3].str_dwo[2].b_delete = true
iastr_dwo_tabpage[3].str_dwo[2].b_query = true
iastr_dwo_tabpage[3].str_dwo[2].b_print = true
iastr_dwo_tabpage[3].str_dwo[2].b_excel = true
iastr_dwo_tabpage[3].str_dwo[2].b_traceable = true
iastr_dwo_tabpage[3].str_dwo[2].b_keyboardlocked = true
iastr_dwo_tabpage[3].str_dwo[2].s_description ='Địa chỉ ngân hàng nhà cung cấp'

//iastr_dwo_tabpage[3].s_tp_name = 's_tp_multi'
//iastr_dwo_tabpage[3].s_display_model = '1d'
//iastr_dwo_tabpage[3].i_index = 3
//iastr_dwo_tabpage[3].str_dwo[1].s_dwo_default =  'd_purchase_price_grid'
//iastr_dwo_tabpage[3].str_dwo[1].s_dwo_form = ''
//iastr_dwo_tabpage[3].str_dwo[1].s_dwo_grid = 'd_purchase_price_grid'
//iastr_dwo_tabpage[3].str_dwo[1].b_master = false
//iastr_dwo_tabpage[3].str_dwo[1].b_detail = true
//iastr_dwo_tabpage[3].str_dwo[1].b_cascade_del = false
//iastr_dwo_tabpage[3].str_dwo[1].s_dwo_details = ''
//iastr_dwo_tabpage[3].str_dwo[1].s_dwo_master = 'd_objects_grid;'
//iastr_dwo_tabpage[3].str_dwo[1].s_master_keycol = 'ID'
//iastr_dwo_tabpage[3].str_dwo[1].s_detail_keycol = 'APPLIED_OBJECT_ID'
//iastr_dwo_tabpage[3].str_dwo[1].b_ref_table_yn  = false
//iastr_dwo_tabpage[3].str_dwo[1].s_ref_table_field = ''
//iastr_dwo_tabpage[3].str_dwo[1].b_insert = true
//iastr_dwo_tabpage[3].str_dwo[1].b_update = true
//iastr_dwo_tabpage[3].str_dwo[1].b_delete = true
//iastr_dwo_tabpage[3].str_dwo[1].b_query = true
//iastr_dwo_tabpage[3].str_dwo[1].b_print = true
//iastr_dwo_tabpage[3].str_dwo[1].b_excel = true
//iastr_dwo_tabpage[3].str_dwo[1].b_traceable = true
//iastr_dwo_tabpage[3].str_dwo[1].b_keyboardlocked = true
//iastr_dwo_tabpage[3].str_dwo[1].s_description ='Giá mua'
end subroutine

on u_vendor.create
call super::create
end on

on u_vendor.destroy
call super::destroy
end on

