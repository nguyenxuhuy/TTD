$PBExportHeader$c_goods_delivery_none_invoice.sru
forward
global type c_goods_delivery_none_invoice from c_goods_delivery
end type
end forward

global type c_goods_delivery_none_invoice from c_goods_delivery
end type
global c_goods_delivery_none_invoice c_goods_delivery_none_invoice

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_dwo_related ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_document_inven_none_invoice_grid'
istr_dwo[1].s_dwo_form = 'd_documnet_inven_none_invoice_form'
istr_dwo[1].s_dwo_grid = 'd_document_inven_none_invoice_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_goods_delivery_form;' 
istr_dwo[1].b_ref_table_yn  = true
istr_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;doc_type;VERSION_ID;'
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = false
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_gb_name = 'gb_6'
istr_dwo[1].s_description = 'Phiếu xuất kho'

istr_dwo[2].s_dwo_default =  'd_goods_delivery_form'
istr_dwo[2].s_dwo_form = 'd_goods_delivery_form'
istr_dwo[2].s_dwo_grid = 'd_goods_delivery_grid'
istr_dwo[2].b_master = true
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_details = 'd_inventory_line_delivery_grid;'
istr_dwo[2].s_dwo_master = 'd_document_inven_none_invoice_grid;'
istr_dwo[2].s_master_keycol = 'ID;'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[2].b_ref_table_yn  = true
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE;doc_type;id'
istr_dwo[2].b_relation_1_1 = true
istr_dwo[2].b_insert = false
istr_dwo[2].b_update = false
istr_dwo[2].b_delete = false
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].b_focus_master = true
istr_dwo[2].s_description = 'Xuất kho'

istr_dwo[3].s_dwo_default =  'd_scan_barcode_form'
istr_dwo[3].s_dwo_form = 'd_scan_barcode_form'
istr_dwo[3].s_dwo_grid = ''
istr_dwo[3].b_detail = false
istr_dwo[3].b_master = false
istr_dwo[3].b_cascade_del = false
istr_dwo[3].s_dwo_master = ''
istr_dwo[3].s_dwo_details = ''
istr_dwo[3].s_master_keycol = ''
istr_dwo[3].s_detail_keycol = ''
istr_dwo[3].b_ref_table_yn  = false
istr_dwo[3].s_ref_table_field = ''
istr_dwo[3].b_insert = false
istr_dwo[3].b_update = false
istr_dwo[3].b_delete = false
istr_dwo[3].b_query = true
istr_dwo[3].b_print = false
istr_dwo[3].b_excel = false
istr_dwo[3].b_traceable = false
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].b_focus_master = false
istr_dwo[3].s_gb_name = 'gb_7'
istr_dwo[3].s_description = 'Chi tiết xuất kho'

istr_dwo[4].s_dwo_default =  'd_inventory_catch_grid'
istr_dwo[4].s_dwo_form = ''
istr_dwo[4].s_dwo_grid = 'd_inventory_catch_grid'
istr_dwo[4].b_detail = true
istr_dwo[4].s_dwo_master = 'd_inventory_line_delivery_grid;'
istr_dwo[4].s_dwo_details = ''
istr_dwo[4].s_master_keycol = 'ID;'
istr_dwo[4].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[4].b_ref_table_yn  = false
istr_dwo[4].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[4].b_insert = false
istr_dwo[4].b_update = false
istr_dwo[4].b_delete = false
istr_dwo[4].b_query = true
istr_dwo[4].b_print = true
istr_dwo[4].b_excel = true
istr_dwo[4].b_traceable = true
istr_dwo[4].b_keyboardlocked = true
istr_dwo[4].s_gb_name = 'gb_8'
istr_dwo[4].s_description = 'Chi tiết kiểm đếm'

istr_dwo[5].s_dwo_default =  'd_post_line_invoice_grid'
istr_dwo[5].s_dwo_form = ''
istr_dwo[5].s_dwo_grid = 'd_post_line_invoice_grid'
istr_dwo[5].b_master = false
istr_dwo[5].b_detail = true
istr_dwo[5].b_cascade_del = true
istr_dwo[5].s_dwo_master = 'd_inventory_line_delivery_grid;'
istr_dwo[5].s_dwo_details = ''
istr_dwo[5].s_dwo_shared = ''
istr_dwo[5].s_master_keycol = 'ID;'
istr_dwo[5].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[5].b_ref_table_yn  = false
istr_dwo[5].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[5].b_insert = false
istr_dwo[5].b_update = false
istr_dwo[5].b_delete = false
istr_dwo[5].b_query = true
istr_dwo[5].b_print = true
istr_dwo[5].b_excel = true
istr_dwo[5].b_traceable = true
istr_dwo[5].b_keyboardlocked = true
istr_dwo[5].s_description ='Định khoản'
istr_dwo[5].s_gb_name = 'gb_9'
end subroutine

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_inventory_line_delivery_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = 'd_inventory_line_delivery_form'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_inventory_line_delivery_grid'
iastr_dwo_tabpage[1].str_dwo[1].b_master = true
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_goods_delivery_form;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = 'd_inventory_catch_grid;d_lot_line_grid;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[1].str_dwo[1].b_insert = false
iastr_dwo_tabpage[1].str_dwo[1].b_update = false
iastr_dwo_tabpage[1].str_dwo[1].b_delete = false
iastr_dwo_tabpage[1].str_dwo[1].b_query = true
iastr_dwo_tabpage[1].str_dwo[1].b_print = true
iastr_dwo_tabpage[1].str_dwo[1].b_excel = true
iastr_dwo_tabpage[1].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[1].i_index = 1
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Chi tiết nhập kho'

iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_display_model = '1d'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_lot_line_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = 'd_lot_line_grid'
iastr_dwo_tabpage[2].str_dwo[1].b_master = true
iastr_dwo_tabpage[2].str_dwo[1].b_detail = true
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_inventory_line_delivery_grid;'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[2].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[2].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[2].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[2].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[2].str_dwo[1].b_insert = false
iastr_dwo_tabpage[2].str_dwo[1].b_update = false
iastr_dwo_tabpage[2].str_dwo[1].b_delete = false
iastr_dwo_tabpage[2].str_dwo[1].b_query = true
iastr_dwo_tabpage[2].str_dwo[1].b_print = true
iastr_dwo_tabpage[2].str_dwo[1].b_excel = true
iastr_dwo_tabpage[2].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[2].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[2].i_index = 2
iastr_dwo_tabpage[2].str_dwo[1].s_description ='Chi tiết barcode'
end subroutine

public subroutine f_set_dwo_related ();//
end subroutine

on c_goods_delivery_none_invoice.create
call super::create
end on

on c_goods_delivery_none_invoice.destroy
call super::destroy
end on

event e_action_ctrl_bttn;call super::e_action_ctrl_bttn;datawindow				ldw_focus
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_copyt_goods_receipt;b_filteron;b_query;b_refresh;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_copyt_goods_receipt;b_filteron;b_query;b_refresh;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_copyt_goods_receipt;b_filteron;b_query;b_refresh;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_copyt_goods_receipt;b_filteron;b_query;b_refresh;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons=  'b_copyt_goods_receipt;b_filteron;b_query;b_refresh;'
					else
						istr_actionpane[li_idx].s_visible_buttons=  'b_copyt_goods_receipt;b_filteron;b_query;b_refresh;'
					end if
				end if
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event constructor;call super::constructor;//b_copyt_goods_receipt
is_table = 'DOCUMENT'
ib_changed_dwo_4edit = true
ib_display_text = false
is_display_model = '5dgb_1tp'
is_object_title = 'Phiếu xuất kho chưa kết hóa đơn, chưa trả hàng hay đã kết nhưng chưa hết số lượng'
istr_actionpane[1].s_button_name = 'b_copyt_goods_receipt;b_add_multi;b_join_multi;b_copyt_multi;b_insert;b_modify;b_save;b_query;b_execquery;b_filteron;b_refresh;b_delete;b_view_goods_delivery;b_post;b_unpost;b_send_2_approve;b_request_2_change;b_approve;b_reject;'
istr_actionpane[1].s_button_has_sub = 'b_add_multi;b_join_multi;b_copyt_multi;'
istr_actionpane[1].sa_sub_button[1]='b_add;b_copyf_so;b_copyf_po_return;b_copyf_goods_receipt;'
istr_actionpane[1].sa_sub_button[2]='b_copyl_so;b_copyl_po_return;b_copyf_goods_receipt;'
istr_actionpane[1].sa_sub_button[3]='b_copyt_sal_invoice;b_copyt_pur_invoice_return;b_copyt_goods_receipt;'
istr_actionpane[1].sa_enabled_subbutton[]= istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_description = is_object_title
end event

