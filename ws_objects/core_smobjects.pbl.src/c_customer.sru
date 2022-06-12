$PBExportHeader$c_customer.sru
forward
global type c_customer from s_object_display
end type
end forward

global type c_customer from s_object_display
boolean ib_filter = false
boolean ib_refresh = false
boolean ib_trace = false
boolean ib_keyboardlocked = false
boolean ib_query = false
boolean ib_update = false
boolean ib_insert = false
boolean ib_delete = false
boolean ib_query_ctx = false
boolean ib_update_ctx = false
boolean ib_insert_ctx = false
boolean ib_delete_ctx = false
boolean ib_trace_ctx = false
end type
global c_customer c_customer

type variables

protected:
long							il_tv_insert_hdl, il_delete_hdl_item, il_modify_hdl
boolean						ib_add_branch


end variables

forward prototypes
public function string f_get_enter_colname (string vs_dwo)
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_related ()
end prototypes

public function string f_get_enter_colname (string vs_dwo);//
//if vs_dwo = 'd_menu_item' then
//	return 'sort_number'
//else
//	return 'text'
//end if
return ''
end function

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_objects_customer_grid'
istr_dwo[1].s_dwo_form = 'd_objects_customer_form'
istr_dwo[1].s_dwo_grid = 'd_objects_customer_grid'
istr_dwo[1].b_master = false
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_details = ''
istr_dwo[1].s_dwo_shared = ''
istr_dwo[1].b_ref_table_yn  = false
istr_dwo[1].s_ref_table_field = ''
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Khách hàng'

/*
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
istr_dwo[2].b_traceable = true
istr_dwo[2].b_focus_master = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_description = 'Thông tin nhà cung cấp'
istr_dwo[2].s_pic_ref_table = ''
istr_dwo[2].s_pic_ref_field = ''

istr_dwo[3].s_dwo_default =  'd_organizations_vendor_form'
istr_dwo[3].s_dwo_form = 'd_organizations_vendor_form'
istr_dwo[3].s_dwo_grid = ''
istr_dwo[3].b_detail = true
istr_dwo[3].s_dwo_master = 'd_vendor_form;'
istr_dwo[3].s_master_keycol = 'ID'
istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[3].b_ref_table_yn  = false
istr_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[3].s_pic_ref_colname = ''
istr_dwo[3].s_pic_ref_field = ''
istr_dwo[3].s_pic_ref_table = ''
istr_dwo[3].b_insert = true
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = true
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_excel = true
istr_dwo[3].b_traceable = true
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].b_focus_master = true
istr_dwo[3].b_relation_1_1 = true
istr_dwo[3].s_description = 'Thông tin đăng ký nhà cung cấp'

istr_dwo[4].s_dwo_default =  'd_vendor_form'
istr_dwo[4].s_dwo_form = 'd_vendor_form'
istr_dwo[4].s_dwo_grid = ''
istr_dwo[4].b_detail = true
istr_dwo[4].b_master = true
istr_dwo[4].b_cascade_del = true
istr_dwo[4].s_dwo_master = 'd_objects_grid;'
//istr_dwo[4].s_dwo_shared = 'd_vendor_bank_form;'
istr_dwo[4].s_dwo_details = 'd_organizations_vendor_form;d_representative_form;d_address_grid;'
istr_dwo[4].s_master_keycol = 'ID;'
istr_dwo[4].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[4].b_ref_table_yn  = true
istr_dwo[4].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[4].b_insert = true
istr_dwo[4].b_update = true
istr_dwo[4].b_delete = true
istr_dwo[4].b_query = true
istr_dwo[4].b_print = true
istr_dwo[4].b_excel = true
istr_dwo[4].b_traceable = true
istr_dwo[4].b_keyboardlocked = true
istr_dwo[4].b_focus_master = true
istr_dwo[4].b_relation_1_1 = true
istr_dwo[4].s_description = 'Thộng tin chi tiết nhà cung cấp'

istr_dwo[5].s_dwo_default =  'd_representative_form'
istr_dwo[5].s_dwo_form = 'd_representative_form'
istr_dwo[5].s_dwo_grid = ''
istr_dwo[5].b_detail = true
istr_dwo[5].s_dwo_master = 'd_vendor_form;'
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
istr_dwo[5].b_traceable = true
istr_dwo[5].b_keyboardlocked = true
istr_dwo[5].b_focus_master = false
istr_dwo[5].b_relation_1_1 = true
istr_dwo[5].s_description = 'Người đại diện'
*/
end subroutine

public subroutine f_set_dwo_tabpage ();/*
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
iastr_dwo_tabpage[3].str_dwo[2].s_master_keycol = 'ID;'
iastr_dwo_tabpage[3].str_dwo[2].s_detail_keycol = 'object_ref_id;'
iastr_dwo_tabpage[3].str_dwo[2].b_ref_table_yn  = false
iastr_dwo_tabpage[3].str_dwo[2].s_ref_table_field = 'object_ref_table'
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

iastr_dwo_tabpage[4].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[4].s_display_model = '1d'
iastr_dwo_tabpage[4].i_index = 4
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_default =  'd_purchase_price_grid'
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_grid = 'd_purchase_price_grid'
iastr_dwo_tabpage[4].str_dwo[1].b_master = false
iastr_dwo_tabpage[4].str_dwo[1].b_detail = true
iastr_dwo_tabpage[4].str_dwo[1].b_cascade_del = false
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_master = 'd_objects_grid;'
iastr_dwo_tabpage[4].str_dwo[1].s_master_keycol = 'ID'
iastr_dwo_tabpage[4].str_dwo[1].s_detail_keycol = 'APPLIED_OBJECT_ID'
iastr_dwo_tabpage[4].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[4].str_dwo[1].s_ref_table_field = ''
iastr_dwo_tabpage[4].str_dwo[1].b_insert = true
iastr_dwo_tabpage[4].str_dwo[1].b_update = true
iastr_dwo_tabpage[4].str_dwo[1].b_delete = true
iastr_dwo_tabpage[4].str_dwo[1].b_query = true
iastr_dwo_tabpage[4].str_dwo[1].b_print = true
iastr_dwo_tabpage[4].str_dwo[1].b_excel = true
iastr_dwo_tabpage[4].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[4].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[4].str_dwo[1].s_description ='Giá mua'
*/
end subroutine

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name = 'b_po;b_po_return;b_goods_receipt;b_goods_delivery;b_pur_invoice;b_pur_invoice_return;b_pur_invoice_replace;b_bank_voucher;b_receipt;b_payment;'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'

end subroutine

public subroutine f_set_dwo_related ();
istr_dwo_related[1].s_related_obj_name = 'c_map_n'
istr_dwo_related[1].s_main_obj_dwo = 'd_address_form'
istr_dwo_related[1].s_main_obj_column = 'ID'
istr_dwo_related[1].s_related_obj_dwo = 'd_address_map_form'
istr_dwo_related[1].s_related_obj_column = 'id'
//khai bao doi tuong lien quan va copy  den cac chung tu

istr_dwo_related[2].s_related_obj_name = 'u_po'	
istr_dwo_related[2].s_main_obj_dwo = 'd_objects_grid'	
istr_dwo_related[2].s_main_obj_column = 'id'		
istr_dwo_related[2].s_related_obj_dwo = 'd_order_form'	
istr_dwo_related[2].s_related_obj_column = 'object_id'			
istr_dwo_related[2].s_relatedtext_column = 'code'			
istr_dwo_related[2].s_text = 'Đơn đặt mua từ NCC: '

istr_dwo_related[2].s_main_obj_dwo_copy[1] = 'd_objects_grid' // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[1] = 'id;code;name;id;code;name;'
istr_dwo_related[2].s_related_obj_dwo_copy[1] = 'd_order_form' //datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[1] = 'object_id;object_code;object_name;bill_to_object;object_code_1;object_name_1;'
//istr_dwo_related[2].s_main_obj_column_chk[1] = 'code;name'
//istr_dwo_related[2].s_related_obj_column_chk[1] = 'object_code;object_name'

istr_dwo_related[2].s_main_obj_dwo_copy[2] = 'd_address_grid' // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[2] = 'address;address'
istr_dwo_related[2].s_related_obj_dwo_copy[2] = 'd_order_form' //datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[2] = 'ship_to_addtext;bill_to_addtext'

istr_dwo_related[2].s_main_obj_dwo_copy[3] ='d_vendor_form'
istr_dwo_related[2].s_main_obj_column_copy[3] = 'payment_method_code;payment_method_name;payment_term_name;payment_term_code;'
istr_dwo_related[2].s_related_obj_dwo_copy[3] = 'd_order_form' 
istr_dwo_related[2].s_related_obj_column_copy[3] =  'payment_method_code;payment_method_name;payment_term_name;payment_term_code;'

istr_dwo_related[2].s_main_obj_column_chk[3] = ''
istr_dwo_related[2].s_related_obj_column_chk[3] = ''
istr_dwo_related[2].s_f_obj_column_chk[3] = ''
istr_dwo_related[2].s_t_obj_column_chk[3] = ''
istr_dwo_related[2].s_main_obj_column_sum[3] = ''
istr_dwo_related[2].s_related_obj_column_sum[3] = ''
istr_dwo_related[2].b_copy_line[3] = false
istr_dwo_related[2].b_f_sum[3] = false
istr_dwo_related[2].s_match_f_dwo[3] = ''
istr_dwo_related[2].s_match_f_col_obj[3] = ''
istr_dwo_related[2].s_match_t_dwo[3] = ''
istr_dwo_related[2].s_match_f_column[3] = ''
istr_dwo_related[2].s_match_t_column[3] = ''
istr_dwo_related[2].s_match_column[3] = ''


istr_dwo_related[3].s_related_obj_name = 'u_po_return'	
istr_dwo_related[3].s_main_obj_dwo = 'd_objects_grid'	
istr_dwo_related[3].s_main_obj_column = 'id'		
istr_dwo_related[3].s_related_obj_dwo = 'd_order_form'	
istr_dwo_related[3].s_related_obj_column = 'object_id'			
istr_dwo_related[3].s_relatedtext_column = 'code'					
istr_dwo_related[3].s_text = 'Đơn trả hàng từ NCC: '

istr_dwo_related[4].s_related_obj_name = 'u_goods_receipt'	  ///////
istr_dwo_related[4].s_main_obj_dwo = 'd_objects_grid'	
istr_dwo_related[4].s_main_obj_column = 'id'		
istr_dwo_related[4].s_related_obj_dwo = 'd_inventory_line_receipt_grid'	
istr_dwo_related[4].s_related_obj_column = 'object_id'			
istr_dwo_related[4].s_relatedtext_column = 'code'					
istr_dwo_related[4].s_text = 'Phiếu nhâp kho từ NCC: '

istr_dwo_related[4].s_main_obj_dwo_copy[1] = 'd_objects_grid' // datawindow copy từ
istr_dwo_related[4].s_main_obj_column_copy[1] = 'id;code;name'
istr_dwo_related[4].s_related_obj_dwo_copy[1] = 'd_inventory_line_receipt_grid' //datawindow copy đến
istr_dwo_related[4].s_related_obj_column_copy[1] = 'object_id;vendor_code;vendor_name'
istr_dwo_related[4].s_main_obj_column_chk[1] = ''
istr_dwo_related[4].s_related_obj_column_chk[1] = ''
istr_dwo_related[4].s_f_obj_column_chk[1] = ''
istr_dwo_related[4].s_t_obj_column_chk[1] = ''
istr_dwo_related[4].s_main_obj_column_sum[1] = ''
istr_dwo_related[4].s_related_obj_column_sum[1] = ''
istr_dwo_related[4].b_copy_line[1] = false
istr_dwo_related[4].b_f_sum[1] = false
istr_dwo_related[4].s_match_f_dwo[1] = ''
istr_dwo_related[4].s_match_f_col_obj[1] = ''
istr_dwo_related[4].s_match_t_dwo[1] = ''
istr_dwo_related[4].s_match_f_column[1] = ''
istr_dwo_related[4].s_match_t_column[1] = ''
istr_dwo_related[4].s_match_column[1] = ''

istr_dwo_related[5].s_related_obj_name = 'u_goods_delivery'	
istr_dwo_related[5].s_main_obj_dwo = 'd_objects_grid'	
istr_dwo_related[5].s_main_obj_column = 'id'		
istr_dwo_related[5].s_related_obj_dwo = 'd_inventory_line_delivery_grid'	
istr_dwo_related[5].s_related_obj_column = 'object_id'			
istr_dwo_related[5].s_relatedtext_column = 'code'					
istr_dwo_related[5].s_text = 'Phiếu xuất kho từ NCC: '

istr_dwo_related[6].s_related_obj_name = 'u_pur_invoice'	
istr_dwo_related[6].s_main_obj_dwo = 'd_objects_grid'	
istr_dwo_related[6].s_main_obj_column = 'id'		
istr_dwo_related[6].s_related_obj_dwo = 'd_invoice_pur_form'	
istr_dwo_related[6].s_related_obj_column = 'invoice_object'			
istr_dwo_related[6].s_relatedtext_column = 'code'					
istr_dwo_related[6].s_text = 'Hóa đơn mua từ NCC: '

istr_dwo_related[6].s_main_obj_dwo_copy[1] = 'd_objects_grid' // datawindow copy từ
istr_dwo_related[6].s_main_obj_column_copy[1] = 'id;code;name;id;code;name;'
istr_dwo_related[6].s_related_obj_dwo_copy[1] = 'd_invoice_pur_form' //datawindow copy đến
istr_dwo_related[6].s_related_obj_column_copy[1] = 'invoice_object;invoice_object_code;invoice_object_name;dr_cr_object;dr_cr_object_code;dr_cr_object_name;'

istr_dwo_related[6].s_main_obj_dwo_copy[2] = 'd_address_grid' 
istr_dwo_related[6].s_main_obj_column_copy[2] = 'address;address'
istr_dwo_related[6].s_related_obj_dwo_copy[2] = 'd_invoice_pur_form' 
istr_dwo_related[6].s_related_obj_column_copy[2] = 'invoice_address;trans_address'

istr_dwo_related[6].s_main_obj_dwo_copy[3] = 'd_vendor_form' 
istr_dwo_related[6].s_main_obj_column_copy[3] = 'payment_method_code;payment_method_name'
istr_dwo_related[6].s_related_obj_dwo_copy[3] = 'd_invoice_pur_form' 
istr_dwo_related[6].s_related_obj_column_copy[3] = 'payment_method_code;payment_method_name'

istr_dwo_related[6].s_main_obj_dwo_copy[4] = 'd_organizations_vendor_form' 
istr_dwo_related[6].s_main_obj_column_copy[4] = 'tax_number;invoice_sign'
istr_dwo_related[6].s_related_obj_dwo_copy[4] = 'd_invoice_pur_form' 
istr_dwo_related[6].s_related_obj_column_copy[4] = 'ven_tax_num;invoice_sign'

istr_dwo_related[6].s_main_obj_column_chk[4] = ''
istr_dwo_related[6].s_related_obj_column_chk[4] = ''
istr_dwo_related[6].s_f_obj_column_chk[4] = ''
istr_dwo_related[6].s_t_obj_column_chk[4] = ''
istr_dwo_related[6].s_main_obj_column_sum[4] = ''
istr_dwo_related[6].s_related_obj_column_sum[4] = ''
istr_dwo_related[6].b_copy_line[4] = false
istr_dwo_related[6].b_f_sum[4] = false
istr_dwo_related[6].s_match_f_dwo[4] = ''
istr_dwo_related[6].s_match_f_col_obj[4] = ''
istr_dwo_related[6].s_match_t_dwo[4] = ''
istr_dwo_related[6].s_match_f_column[4] = ''
istr_dwo_related[6].s_match_t_column[4] = ''
istr_dwo_related[6].s_match_column[4] = ''

istr_dwo_related[7].s_related_obj_name = 'u_pur_invoice_return'	
istr_dwo_related[7].s_main_obj_dwo = 'd_objects_grid'	
istr_dwo_related[7].s_main_obj_column = 'id'		
istr_dwo_related[7].s_related_obj_dwo = 'd_invoice_pur_form'	
istr_dwo_related[7].s_related_obj_column = 'invoice_object'			
istr_dwo_related[7].s_relatedtext_column = 'code'					
istr_dwo_related[7].s_text = 'Hóa trả hàng HĐM từ NCC: '

istr_dwo_related[8].s_related_obj_name = 'u_pur_invoice_replace'	
istr_dwo_related[8].s_main_obj_dwo = 'd_objects_grid'	
istr_dwo_related[8].s_main_obj_column = 'id'		
istr_dwo_related[8].s_related_obj_dwo = 'd_invoice_pur_form'	
istr_dwo_related[8].s_related_obj_column = 'invoice_object'			
istr_dwo_related[8].s_relatedtext_column = 'code'					
istr_dwo_related[8].s_text = 'Hóa thay thế HĐM từ NCC: '

istr_dwo_related[9].s_related_obj_name = 'u_bank_voucher'	
istr_dwo_related[9].s_main_obj_dwo = 'd_objects_grid'	
istr_dwo_related[9].s_main_obj_column = 'id'		
istr_dwo_related[9].s_related_obj_dwo = 'd_payment_line_grid'	
istr_dwo_related[9].s_related_obj_column = 'object_id'			
istr_dwo_related[9].s_relatedtext_column = 'code'					
istr_dwo_related[9].s_text = 'Sổ phụ thu từ NCC: '

istr_dwo_related[9].s_main_obj_dwo_copy[1] = 'd_objects_grid' // datawindow copy từ
istr_dwo_related[9].s_main_obj_column_copy[1] = 'id;code;name;'
istr_dwo_related[9].s_related_obj_dwo_copy[1] = 'd_payment_line_grid' //datawindow copy đến
istr_dwo_related[9].s_related_obj_column_copy[1] = 'object_id;object_code;object_name;'
istr_dwo_related[9].s_main_obj_column_chk[1] = ''
istr_dwo_related[9].s_related_obj_column_chk[1] = ''
istr_dwo_related[9].s_f_obj_column_chk[1] = ''
istr_dwo_related[9].s_t_obj_column_chk[1] = ''
istr_dwo_related[9].s_main_obj_column_sum[1] = ''
istr_dwo_related[9].s_related_obj_column_sum[1] = ''
istr_dwo_related[9].b_copy_line[1] = false
istr_dwo_related[9].b_f_sum[1] = false
istr_dwo_related[9].s_match_f_dwo[1] = ''
istr_dwo_related[9].s_match_f_col_obj[1] = ''
istr_dwo_related[9].s_match_t_dwo[1] = ''
istr_dwo_related[9].s_match_f_column[1] = ''
istr_dwo_related[9].s_match_t_column[1] = ''
istr_dwo_related[9].s_match_column[1] = ''


istr_dwo_related[10].s_related_obj_name = 'u_bank_voucher_payment'	
istr_dwo_related[10].s_main_obj_dwo = 'd_objects_grid'	
istr_dwo_related[10].s_main_obj_column = 'id'		
istr_dwo_related[10].s_related_obj_dwo = 'd_payment_line_grid'	
istr_dwo_related[10].s_related_obj_column = 'object_id'			
istr_dwo_related[10].s_relatedtext_column = 'code'					
istr_dwo_related[10].s_text = 'Sổ phụ chi từ NCC: '

istr_dwo_related[10].s_main_obj_dwo_copy[1] = 'd_objects_grid' // datawindow copy từ
istr_dwo_related[10].s_main_obj_column_copy[1] = 'id;code;name;'
istr_dwo_related[10].s_related_obj_dwo_copy[1] = 'd_payment_line_grid' //datawindow copy đến
istr_dwo_related[10].s_related_obj_column_copy[1] = 'object_id;object_code;object_name;'
istr_dwo_related[10].s_main_obj_column_chk[1] = ''
istr_dwo_related[10].s_related_obj_column_chk[1] = ''
istr_dwo_related[10].s_f_obj_column_chk[1] = ''
istr_dwo_related[10].s_t_obj_column_chk[1] = ''
istr_dwo_related[10].s_main_obj_column_sum[1] = ''
istr_dwo_related[10].s_related_obj_column_sum[1] = ''
istr_dwo_related[10].b_copy_line[1] = false
istr_dwo_related[10].b_f_sum[1] = false
istr_dwo_related[10].s_match_f_dwo[1] = ''
istr_dwo_related[10].s_match_f_col_obj[1] = ''
istr_dwo_related[10].s_match_t_dwo[1] = ''
istr_dwo_related[10].s_match_f_column[1] = ''
istr_dwo_related[10].s_match_t_column[1] = ''
istr_dwo_related[10].s_match_column[1] = ''


istr_dwo_related[11].s_related_obj_name = 'u_receipt'	
istr_dwo_related[11].s_main_obj_dwo = 'd_objects_grid'	
istr_dwo_related[11].s_main_obj_column = 'id'		
istr_dwo_related[11].s_related_obj_dwo = 'd_payment_line_grid'	
istr_dwo_related[11].s_related_obj_column = 'object_id'			
istr_dwo_related[11].s_relatedtext_column = 'code'					
istr_dwo_related[11].s_text = 'Phiếu thu từ NCC: '

istr_dwo_related[11].s_main_obj_dwo_copy[1] = 'd_objects_grid' // datawindow copy từ
istr_dwo_related[11].s_main_obj_column_copy[1] = 'id;code;name;'
istr_dwo_related[11].s_related_obj_dwo_copy[1] = 'd_payment_line_grid' //datawindow copy đến
istr_dwo_related[11].s_related_obj_column_copy[1] = 'object_id;object_code;object_name;'
istr_dwo_related[11].s_main_obj_column_chk[1] = ''
istr_dwo_related[11].s_related_obj_column_chk[1] = ''
istr_dwo_related[11].s_f_obj_column_chk[1] = ''
istr_dwo_related[11].s_t_obj_column_chk[1] = ''
istr_dwo_related[11].s_main_obj_column_sum[1] = ''
istr_dwo_related[11].s_related_obj_column_sum[1] = ''
istr_dwo_related[11].b_copy_line[1] = false
istr_dwo_related[11].b_f_sum[1] = false
istr_dwo_related[11].s_match_f_dwo[1] = ''
istr_dwo_related[11].s_match_f_col_obj[1] = ''
istr_dwo_related[11].s_match_t_dwo[1] = ''
istr_dwo_related[11].s_match_f_column[1] = ''
istr_dwo_related[11].s_match_t_column[1] = ''
istr_dwo_related[11].s_match_column[1] = ''


istr_dwo_related[12].s_related_obj_name = 'u_payment'	
istr_dwo_related[12].s_main_obj_dwo = 'd_objects_grid'	
istr_dwo_related[12].s_main_obj_column = 'id'		
istr_dwo_related[12].s_related_obj_dwo = 'd_payment_line_grid'	
istr_dwo_related[12].s_related_obj_column = 'object_id'			
istr_dwo_related[12].s_relatedtext_column = 'code'					
istr_dwo_related[12].s_text = 'Phiếu chi từ NCC: '

istr_dwo_related[12].s_main_obj_dwo_copy[1] = 'd_objects_grid' // datawindow copy từ
istr_dwo_related[12].s_main_obj_column_copy[1] = 'id;code;name;'
istr_dwo_related[12].s_related_obj_dwo_copy[1] = 'd_payment_line_grid' //datawindow copy đến
istr_dwo_related[12].s_related_obj_column_copy[1] = 'object_id;object_code;object_name;'
istr_dwo_related[12].s_main_obj_column_chk[1] = ''
istr_dwo_related[12].s_related_obj_column_chk[1] = ''
istr_dwo_related[12].s_f_obj_column_chk[1] = ''
istr_dwo_related[12].s_t_obj_column_chk[1] = ''
istr_dwo_related[12].s_main_obj_column_sum[1] = ''
istr_dwo_related[12].s_related_obj_column_sum[1] = ''
istr_dwo_related[12].b_copy_line[1] = false
istr_dwo_related[12].b_f_sum[1] = false
istr_dwo_related[12].s_match_f_dwo[1] = ''
istr_dwo_related[12].s_match_f_col_obj[1] = ''
istr_dwo_related[12].s_match_t_dwo[1] = ''
istr_dwo_related[12].s_match_f_column[1] = ''
istr_dwo_related[12].s_match_t_column[1] = ''
istr_dwo_related[12].s_match_column[1] = ''




end subroutine

on c_customer.create
call super::create
end on

on c_customer.destroy
call super::destroy
end on

event constructor;call super::constructor;
is_table = 'object'
ib_changed_dwo_4edit = true
this.ib_keyboardlocked = true
is_display_model = '1d'
is_object_title = 'Khách hàng'

istr_actionpane[1].s_description = is_object_title

istr_actionpane[1].s_button_name = 'b_send_2_approve;b_approve;b_reject;'
istr_actionpane[1].s_button_name += 'b_doc_trace;b_cancel;b_self_copy;e_add;e_modify;e_delete;'
//istr_actionpane[1].s_button_has_sub ='b_related_object;b_update;b_approve;b_view;b_copyt;b_copyf;'
//istr_actionpane[1].sa_sub_button[1]='u_so;'
//istr_actionpane[1].sa_subbutton_name[1]='Đơn bán hàng(SO);'
//istr_actionpane[1].sa_sub_button[2]='b_complete;b_lose;b_excel;'
//istr_actionpane[1].sa_subbutton_name[2]='Thành công;Không thành;Excel;'
//istr_actionpane[1].sa_sub_button[3]=''	//'b_send_2_approve;b_approve;b_reject;'
//istr_actionpane[1].sa_subbutton_name[3]=''	//'Gửi duyệt;Duyệt;Trả duyệt'
//istr_actionpane[1].sa_sub_button[4]='b_view_qt;b_view_qt_kni_eng;'
//istr_actionpane[1].sa_subbutton_name[4]='Chào giá;Chào giá ENG;'
//istr_actionpane[1].sa_sub_button[5]=''
//istr_actionpane[1].sa_subbutton_name[5]=''
//istr_actionpane[1].sa_sub_button[6]=''
//istr_actionpane[1].sa_subbutton_name[6]=''


end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;

if pos(rpo_dw.dataobject, 'd_objects_')> 0 then
	rpo_dw.setitem(vl_currentrow,'handled_by',gi_userid)	
	rpo_dw.setitem(vl_currentrow,'staff_name', g_user.f_get_name_of_userid_ex(gi_userid, it_transaction ))
	rpo_dw.setitem(vl_currentrow,'object_ref_table','CUSTOMER')
	rpo_dw.setitem(vl_currentrow,'object_link_table','OBJECT')
	
end if
return vl_currentrow
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
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify; b_filteron;b_refresh;b_delete;b_blank;b_copyt_po;b_copyt_goods_receipt;b_blank; b_copyt_pur_invoice;b_blank; b_copyt_bank_voucher;b_copyt_receipt;b_copyt_payment;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_filteron;b_refresh;b_delete;b_blank;b_copyt_po;b_copyt_goods_receipt;b_blank; b_copyt_pur_invoice;b_blank; b_copyt_bank_voucher;b_copyt_receipt;b_copyt_payment;'
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron; b_refresh;b_delete;b_blank;b_copyt_po;b_copyt_goods_receipt;b_blank; b_copyt_pur_invoice;b_blank; b_copyt_bank_voucher;b_copyt_receipt;b_copyt_payment;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron; b_refresh;b_delete;b_blank;b_copyt_po;b_copyt_goods_receipt;b_blank; b_copyt_pur_invoice;b_blank; b_copyt_bank_voucher;b_copyt_receipt;b_copyt_payment;'
					end if
				end if
			else				
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_refresh;b_delete;b_blank;b_copyt_po;b_copyt_goods_receipt;b_blank; b_copyt_pur_invoice;b_blank; b_copyt_bank_voucher;b_copyt_receipt;b_copyt_payment;'
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_refresh;b_delete;b_blank;b_copyt_po;b_copyt_goods_receipt;b_blank; b_copyt_pur_invoice;b_blank; b_copyt_bank_voucher;b_copyt_receipt;b_copyt_payment;'
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
			istr_actionpane[li_idx].s_visible_buttons =  'b_po;b_po_return;b_blank;b_goods_receipt;b_goods_delivery;b_blank;b_pur_invoice;b_pur_invoice_return;b_pur_invoice_replace;b_blank;b_bank_voucher;b_bank_voucher_payment;b_receipt;b_payment;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
			istr_actionpane[li_idx].s_visible_buttons =  'b_attach;b_note;b_doc_trace;b_user_trace;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then
			istr_actionpane[li_idx].s_visible_buttons =  'b_vendor_balance;b_vendor_bal_detail;'
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_open;call super::e_window_open;t_dw_mpl			ldw_main
any				laa_value[]

//-- add where vendor --//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '=CUSTOMER'
ldw_main.f_add_where('object_ref_table;',laa_value[])

iw_display.dynamic event e_filteron_rb( )
return 0
end event

event e_dw_e_postsave;call super::e_dw_e_postsave;double		ldb_customer_id, ldb_addr1, ldb_addr2, ldb_org, ldb_people, ldb_obj_id, ldb_branch
double		ldb_dfl_curr, ldb_paymentTerm, ldb_paymentMethod, ldb_deliveryMode, ldb_city, ldb_scrap_pct
string			ls_vend_yn, ls_taxnumber, ls_addr, ls_purpose, ls_firstname, ls_phone, ls_email, ls_title, ls_p_note, ls_city, ls_scrap_included_yn
date			ld_dob

b_obj_instantiate		lbo_ins

ldb_obj_id =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'id') 
if ldb_obj_id > 0 then
	
	//-- CUSTOMER--//
	ldb_customer_id = rpo_dw.getitemnumber(rpo_dw.getrow(), 'customer_id') 
	ldb_dfl_curr = rpo_dw.getitemnumber(rpo_dw.getrow(), 'default_currency') 
	ldb_paymentTerm = rpo_dw.getitemnumber(rpo_dw.getrow(), 'payment_term') 
	ldb_paymentMethod = rpo_dw.getitemnumber(rpo_dw.getrow(), 'payment_method') 
	ldb_deliveryMode = rpo_dw.getitemnumber(rpo_dw.getrow(), 'delivery_mode') 
	ls_city = rpo_dw.getitemstring(rpo_dw.getrow(), 'city_text') 
	ls_vend_yn = rpo_dw.getitemstring(rpo_dw.getrow(), 'vendor_yn') 
	ls_scrap_included_yn = rpo_dw.getitemstring(rpo_dw.getrow(), 'scrap_included_yn') 
	ldb_scrap_pct = rpo_dw.getitemnumber(rpo_dw.getrow(), 'scrap_pct') 
	if ldb_customer_id > 0 then
		//-- update--//		
		UPDATE customer 
		set vendor_yn = :ls_vend_yn , default_currency = :ldb_dfl_curr, payment_term = :ldb_paymentTerm, scrap_included_yn = :ls_scrap_included_yn,
			 payment_method = :ldb_paymentMethod , delivery_mode = :ldb_deliveryMode, city_text = :ls_city, scrap_pct = :ldb_scrap_pct
		where object_ref_id = :ldb_obj_id using it_transaction;
	else
		//-- insert--//
		ldb_customer_id = lbo_ins.f_Create_id_ex( it_transaction )
		INSERT into customer (id, object_ref_id, object_ref_Table, company_id, branch_id, created_by, created_Date, last_mdf_by, last_mdf_date,
									vendor_yn, default_currency, payment_term, payment_method, delivery_mode, city_text, scrap_included_yn, scrap_pct)
		VALUES (:ldb_customer_id, :ldb_obj_id, 'OBJECT',:gi_user_comp_id, :gdb_branch, :gi_userid, sysdate, :gi_userid, sysdate,
					:ls_vend_yn, :ldb_dfl_curr, :ldb_paymentTerm, :ldb_paymentMethod, :ldb_deliveryMode, :ls_city, :ls_scrap_included_yn, :ldb_scrap_pct)
		using it_transaction;
	end if
	//--ORG--//
	ldb_org = rpo_dw.getitemnumber(rpo_dw.getrow(), 'organization_id') 
	ls_taxnumber = rpo_dw.getitemstring(rpo_dw.getrow(), 'tax_number') 
	//-- check unique --//
	if lbo_ins.f_is_branch_yn_ex(this.classname(), iw_display.it_transaction ) and rpo_dw.dynamic f_is_branch() then
		ldb_branch = gdb_branch
	else
		ldb_branch = 0
	end if
	if this.idwsetup_initial.f_is_duplicated_data_ex( rpo_dw, rpo_dw.getrow(), ldb_branch) then return -1
		
	if ldb_org > 0 then
		//-- update--//		
		UPDATE organization set tax_number = :ls_taxnumber where id = :ldb_org using it_transaction;
	else
		//-- insert--//
		ldb_org = lbo_ins.f_Create_id_ex( it_transaction )
		INSERT into organization (id, object_ref_id, object_ref_Table, company_id, branch_id, created_by, created_Date, last_mdf_by, last_mdf_date, tax_number)
		VALUES (:ldb_org, :ldb_customer_id, 'CUSTOMER',:gi_user_comp_id, :gdb_branch, :gi_userid, sysdate, :gi_userid, sysdate,:ls_taxnumber)
		using it_transaction;
	end if	
	//--BUSINESS_ADDRESS--//
	ldb_addr1 = rpo_dw.getitemnumber(rpo_dw.getrow(), 'address_id') 
	ls_addr = rpo_dw.getitemstring(rpo_dw.getrow(), 'address') 
	ls_purpose = rpo_dw.getitemstring(rpo_dw.getrow(), 'purpose') 	
	if ldb_addr1 > 0 then
		//-- update--//		
		UPDATE business_address 
		set address = :ls_addr ,
			purpose = :ls_purpose,
			name = 'addr1'
		where id = :ldb_addr1 using it_transaction;
	else
		//-- insert--//
		ldb_addr1 = lbo_ins.f_Create_id_ex( it_transaction )
		INSERT into business_address (id, object_ref_id, object_ref_Table, created_by, created_Date, last_mdf_by, last_mdf_date, address, purpose,name)
		VALUES (:ldb_addr1, :ldb_customer_id, 'CUSTOMER', :gi_userid, sysdate, :gi_userid, sysdate,:ls_addr, :ls_purpose, 'addr1')
		using it_transaction;
	end if		
	
	ldb_addr2 = rpo_dw.getitemnumber(rpo_dw.getrow(), 'address_id_1') 
	ls_addr = rpo_dw.getitemstring(rpo_dw.getrow(), 'address_1') 
	ls_purpose = rpo_dw.getitemstring(rpo_dw.getrow(), 'purpose_1') 
	if ldb_addr2 > 0 then
		//-- update--//		
		UPDATE business_address 
		set address = :ls_addr ,
			purpose = :ls_purpose,
			name = 'addr2'
		where id = :ldb_addr2 using it_transaction;
	else
		//-- insert--//
		ldb_addr2 = lbo_ins.f_Create_id_ex( it_transaction )
		INSERT into business_address (id, object_ref_id, object_ref_Table, created_by, created_Date, last_mdf_by, last_mdf_date, address, purpose,name)
		VALUES (:ldb_addr2, :ldb_customer_id, 'CUSTOMER', :gi_userid, sysdate, :gi_userid, sysdate,:ls_addr, :ls_purpose,'addr2')
		using it_transaction;
	end if			
	//--POEPLE--//	
	ldb_people = rpo_dw.getitemnumber(rpo_dw.getrow(), 'people_id')
	ls_firstname = rpo_dw.getitemstring(rpo_dw.getrow(), 'first_name') 
	ls_phone = rpo_dw.getitemstring(rpo_dw.getrow(), 'phone') 
	ls_email = rpo_dw.getitemstring(rpo_dw.getrow(), 'email') 
	ld_dob = date(rpo_dw.getitemdatetime(rpo_dw.getrow(), 'date_of_birth') )
	ls_title = rpo_dw.getitemstring(rpo_dw.getrow(), 'title') 
	if ldb_people > 0 then
		//-- update--//		
		UPDATE people 
		set first_name = :ls_firstname ,
			phone = :ls_phone,
			email = :ls_email,
			date_of_birth = :ld_dob,
			title = :ls_title
		where id = :ldb_people using it_transaction;
	else
		//-- insert--//
		ldb_people = lbo_ins.f_Create_id_ex( it_transaction )
		INSERT into people (id, object_ref_id, object_ref_Table, created_by, created_Date, last_mdf_by, last_mdf_date, first_name, phone,email, date_of_birth, title)
		VALUES (:ldb_people, :ldb_customer_id, 'CUSTOMER', :gi_userid, sysdate, :gi_userid, sysdate,:ls_firstname, :ls_phone, :ls_email, :ld_dob, :ls_title)
		using it_transaction;
	end if			
	
//--CONTACT--//	
	ldb_people = rpo_dw.getitemnumber(rpo_dw.getrow(), 'p_contact_id')
	ls_firstname = rpo_dw.getitemstring(rpo_dw.getrow(), 'contact_first_name') 
	ls_phone = rpo_dw.getitemstring(rpo_dw.getrow(), 'contact_phone') 
	ls_email = rpo_dw.getitemstring(rpo_dw.getrow(), 'contact_email') 
	ld_dob = date(rpo_dw.getitemdatetime(rpo_dw.getrow(), 'contact_date_of_birth') )
	ls_title = rpo_dw.getitemstring(rpo_dw.getrow(), 'contact_title') 
	ls_p_note = rpo_dw.getitemstring(rpo_dw.getrow(), 'contact_note') 
	if ldb_people > 0 then
		//-- update--//		
		UPDATE people 
		set first_name = :ls_firstname ,
			phone = :ls_phone,
			email = :ls_email,
			date_of_birth = :ld_dob,
			title = :ls_title,
			note = :ls_p_note
		where id = :ldb_people using it_transaction;
	else
		//-- insert--//
		ldb_people = lbo_ins.f_Create_id_ex( it_transaction )
		INSERT into people (id, object_ref_id, object_ref_Table, created_by, created_Date, last_mdf_by, last_mdf_date, first_name, phone,email, date_of_birth, title, note)
		VALUES (:ldb_people, :ldb_addr1, 'BUSINESS_ADDRESS', :gi_userid, sysdate, :gi_userid, sysdate,:ls_firstname, :ls_phone, :ls_email, :ld_dob, :ls_title, :ls_p_note)
		using it_transaction;
	end if				
	return 1
end if
return 0
end event

event e_dw_e_predelete;call super::e_dw_e_predelete;double		ldb_customer_id, ldb_object_id
int				li_cnt
	

	//-- VENDOR--//
	ldb_object_id = rpo_dw.getitemnumber(vl_currentrow, 'id') 
	select count(id) into :li_cnt from booked_slip where dr_cr_object = :ldb_object_id or invoice_object = :ldb_object_id using it_transaction;
	if li_cnt > 0 then
		gf_messagebox('m.c_customer.e_dw_e_predelete.01','Thông báo','Khách hàng đã có giao dịch, không thể xoá !','exclamation','ok',1)
		return -1
	end if
	select count(id) into :li_cnt from orders where bill_to_object = :ldb_object_id or OBJECT_ID = :ldb_object_id using it_transaction;
	if li_cnt > 0 then
		gf_messagebox('m.c_customer.e_dw_e_predelete.01','Thông báo','Khách hàng đã có giao dịch, không thể xoá !','exclamation','ok',1)
		return -1
	end if
	ldb_customer_id = rpo_dw.getitemnumber(vl_currentrow, 'customer_id') 
	if ldb_customer_id > 0 then
		iw_display.f_get_transaction(it_transaction)
		DELETE  customer where id = :ldb_customer_id using it_transaction;
		//--ORG--//	
		DELETE organization where object_ref_id = :ldb_customer_id using it_transaction;	
		//--BUSINESS_ADDRESS--//
		DELETE business_address 
		where object_ref_id = :ldb_customer_id using it_transaction;	
		//--POEPLE--//			
		DELETE people 
		where object_ref_id = :ldb_customer_id using it_transaction;		
		return 1
	end if

return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;string			ls_short_name
c_string		lc_string

if vs_colname = 'name' then	
	if rpo_dw.getitemstatus(vl_currentrow,0,primary!) = NewModified! then
		ls_short_name = rpo_dw.getitemstring(vl_currentrow, 'short_name')
		if isnull(ls_short_name) then		
			rpo_dw.setitem(vl_currentrow ,'short_name',left(lc_string.f_removewhitespace( vs_editdata),50))
		end if
	end if
end if
return ancestorreturnvalue
end event

