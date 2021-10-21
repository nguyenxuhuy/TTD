$PBExportHeader$c_customer_vendor.sru
forward
global type c_customer_vendor from s_object_display
end type
end forward

global type c_customer_vendor from s_object_display
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
global c_customer_vendor c_customer_vendor

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
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_objects_customer_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].b_traceable = true
istr_dwo[1].s_dwo_details = 'd_customer_form;'
istr_dwo[1].s_dwo_shared = 'd_objects_customer_form;'
istr_dwo[1].b_ref_table_yn  = true
istr_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Khách hàng'

istr_dwo[2].s_dwo_default =  'd_objects_customer_form'
istr_dwo[2].s_dwo_form = 'd_objects_customer_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_shared = true
istr_dwo[2].s_dwo_master = 'd_objects_customer_grid;'
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
istr_dwo[2].s_description = 'Khách hàng'
istr_dwo[2].s_pic_ref_table = ''
istr_dwo[2].s_pic_ref_field = ''

istr_dwo[3].s_dwo_default =  'd_customer_form'
istr_dwo[3].s_dwo_form = 'd_customer_form'
istr_dwo[3].s_dwo_grid = ''
istr_dwo[3].b_detail = true
istr_dwo[3].b_master = true
istr_dwo[3].s_dwo_master = 'd_objects_customer_grid;'
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
istr_dwo[3].s_description = 'Thộng tin khách hàng'

istr_dwo[4].s_dwo_default =  'd_organizations_form'
istr_dwo[4].s_dwo_form = 'd_organizations_form'
istr_dwo[4].s_dwo_grid = ''
istr_dwo[4].b_detail = true
istr_dwo[4].s_dwo_master = 'd_customer_form;'
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
istr_dwo[5].s_dwo_master = 'd_customer_form;'
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
iastr_dwo_tabpage[1].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_customer_form;'
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

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name =  'b_so;b_so_return;b_goods_delivery;b_goods_receipt;b_sal_invoice;b_sal_invoice_return;b_sal_invoice_replace;b_bank_voucher;b_receipt;b_payment;'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_related_report'
istr_actionpane[3].s_button_name =  'b_cust_balance;b_cust_bal_detail;'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Báo cáo liên quan'

istr_actionpane[4].s_dwo_action = 'd_action_manage'
istr_actionpane[4].s_objname_handling = this.classname( )
istr_actionpane[4].s_description = 'Menu quản lý'


end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'c_map_n'
istr_dwo_related[1].s_main_obj_dwo = 'd_address_form'
istr_dwo_related[1].s_main_obj_column = 'ID'
istr_dwo_related[1].s_related_obj_dwo = 'd_address_map_form'
istr_dwo_related[1].s_related_obj_column = 'id'

//istr_dwo_related[2].s_related_obj_name = 'u_sal_invoice'					// đối tượng quan hệ đến
//istr_dwo_related[2].s_main_obj_dwo = 'd_objects_grid'		//datawindow quan hệ main
//istr_dwo_related[2].s_main_obj_column = 'id'			// cột quan hệ của main
//istr_dwo_related[2].s_related_obj_dwo = 'd_invoice_form'	// datawindow quan hệ đến
//istr_dwo_related[2].s_related_obj_column = 'dr_cr_object'			// cột quan hệ đến
//istr_dwo_related[2].b_t_matching = false
//istr_dwo_related[2].s_relatedtext_column = 'doc_code'					
//istr_dwo_related[2].s_text = 'Hóa đơn bán của: '
//
istr_dwo_related[2].s_related_obj_name = 'u_sal_invoice'
istr_dwo_related[2].s_main_obj_dwo = 'd_objects_customer_grid'
istr_dwo_related[2].s_main_obj_column = 'id'
istr_dwo_related[2].s_related_obj_dwo = 'd_invoice_form'
istr_dwo_related[2].s_related_obj_column = 'dr_cr_object'
istr_dwo_related[2].s_relatedtext_column = 'doc_code'
istr_dwo_related[2].s_text = 'Hóa đơn bán của: '
end subroutine

on c_customer_vendor.create
call super::create
end on

on c_customer_vendor.destroy
call super::destroy
end on

event constructor;call super::constructor;
is_table = 'object'
ib_changed_dwo_4edit = false
this.ib_keyboardlocked = true
is_display_model = 'up_1d_4d_lo_tb'
is_object_title = 'Khách hàng vừa là nhà cung cấp'
istr_actionpane[1].s_button_name = 'b_add;b_insert;b_modify;b_save;b_query;b_execquery;b_filteron;b_refresh;b_delete;b_copyt_so;b_copyt_goods_delivery; b_copyt_sal_invoice;b_copyt_receipt;b_copyt_payment; b_copyt_bank_voucher;'
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title



end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;string						ls_code,ls_name
decimal					ldc_id
t_dw_mpl				ldw_handle

if pos(rpo_dw.dataobject, istr_dwo[1].s_dwo_default)> 0 then
	ls_code = rpo_dw.getitemstring(vl_currentrow,'posting_code')
	SELECT VALUESET_VALUE.ID,VALUESET_VALUE.NAME INTO :ldc_id,:ls_name
	FROM VALUESET_VALUE
	WHERE VALUESET_VALUE.CODE =:ls_code USING SQLCA;
	if SQLCA.sqlcode = 0 then
		rpo_dw.setitem(vl_currentrow,'posting_group',ldc_id)
		rpo_dw.setitem(vl_currentrow,'posting_name',ls_name)
	elseif SQLCA.sqlcode = 100 then
		gf_messagebox('m.c_customer.e_dw_e_postinsertrow.02','Thông báo','Chưa khai báo tài khoản này ','exclamation','ok',1)
		return -1
	else
		//--lỗi --//
		messagebox('Lỗi','c_customer.e_dw_e_postinsertrow(line:20)')
		return -1
	end if
	ldw_handle = iw_display.f_get_dw('d_customer_form')
	ldw_handle.event e_addrow( )
	ldw_handle = iw_display.f_get_dw('d_organizations_form')
	ldw_handle.event e_addrow( )	
	ldw_handle = iw_display.f_get_dw('d_representative_form')
	ldw_handle.event e_addrow( )
elseif pos(rpo_dw.dataobject, 'd_customer_') > 0 then
	ls_code = rpo_dw.getitemstring(vl_currentrow,'payment_method_code')
	SELECT ID,NAME INTO :ldc_id,:ls_name
	FROM VALUESET_VALUE
	WHERE CODE =:ls_code
    AND NVL(UP_ID,0) = 0
    AND NVL(ID_COMBINATION,'@') = '@' USING SQLCA;
	if SQLCA.sqlcode = 0 then
		rpo_dw.setitem(vl_currentrow,'payment_method',ldc_id)
		rpo_dw.setitem(vl_currentrow,'payment_method_name',ls_name)
	elseif SQLCA.sqlcode = 100 then
		gf_messagebox('m.c_customer.e_dw_e_postinsertrow.02','Thông báo','Chưa khai báo phương thức thanh toán này ','exclamation','ok',1)
		return -1
	else
		//--lỗi --//
		messagebox('Lỗi','c_customer.e_dw_e_postinsertrow(line:39)')
		return -1
	end if
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
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify; b_filteron;b_query;b_refresh;b_delete;b_blank;b_copyt_so;b_copyt_goods_delivery;b_blank; b_copyt_sal_invoice;b_copyt_bank_voucher;b_copyt_receipt;b_copyt_payment;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_filteron;b_query;b_refresh;b_delete;b_blank;b_copyt_so; b_copyt_goods_delivery;b_blank; b_copyt_sal_invoice;b_copyt_bank_voucher;b_copyt_receipt;b_copyt_payment;'
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query; b_refresh;b_delete;b_blank;b_copyt_so;b_copyt_goods_delivery;b_blank; b_copyt_sal_invoice;b_copyt_bank_voucher;b_copyt_receipt;b_copyt_payment;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query; b_refresh;b_delete;b_blank;b_copyt_so;b_copyt_goods_delivery;b_blank; b_copyt_sal_invoice;b_copyt_bank_voucher;b_copyt_receipt;b_copyt_payment;'
					end if
				end if
			else				
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_blank;b_copyt_so;b_copyt_goods_delivery;b_blank; b_copyt_sal_invoice;b_copyt_bank_voucher;b_copyt_receipt;b_copyt_payment;'
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_blank;b_copyt_so;b_copyt_goods_delivery;b_blank; b_copyt_sal_invoice;b_copyt_bank_voucher;b_copyt_receipt;b_copyt_payment;'
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
			istr_actionpane[li_idx].s_visible_buttons =   'b_so;b_so_return;b_blank;b_goods_delivery;b_goods_receipt;b_blank;b_sal_invoice;b_sal_invoice_return;b_sal_invoice_replace;b_blank;b_bank_voucher;b_receipt;b_payment;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
			istr_actionpane[li_idx].s_visible_buttons =  'b_attach;b_note;b_user_trace;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then		
			istr_actionpane[li_idx].s_visible_buttons =  'br_customer_balance;br_customer_balance_detail;'
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_open;call super::e_window_open;t_dw_mpl			ldw_main
any				laa_value[]

//-- add where customer --//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = 'CUSTOMER'
laa_value[2] = 'Y'
ldw_main.f_add_where('object_ref_table;vendor_yn;',laa_value[])

return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;//--resize parm --//
iw_display.dynamic f_set_ii_fixedpart1_height(350)
iw_display.dynamic f_set_ii_upperpart_height(1300)
iw_display.dynamic f_set_ii_leftpart_width(1400)
return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;long     				ll_find

if AncestorReturnValue = 1 then return 1
	if pos(rpo_dw.dataobject,'d_address') > 0 then
		if vs_colname = 'active_yn' then
			ll_find = rpo_dw.find( "active_yn = 'Y'", 1, rpo_dw.rowcount( ) )
			if ll_find > 0 then
				rpo_dw.setitem(ll_find,'active_yn','N')
			end if
		end if
	elseif pos(rpo_dw.dataobject,'d_contact_grid') > 0 then
		if vs_colname = 'main_yn' then
			ll_find = rpo_dw.find( "main_yn = 'Y'", 1, rpo_dw.rowcount( ) )
			if ll_find > 0 then
				rpo_dw.setitem(ll_find,'main_yn','N')
			end if
		end if
	end if
	return AncestorReturnValue
end event

