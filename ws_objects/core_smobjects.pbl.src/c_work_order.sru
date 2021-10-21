$PBExportHeader$c_work_order.sru
forward
global type c_work_order from b_doc
end type
end forward

global type c_work_order from b_doc
end type
global c_work_order c_work_order

forward prototypes
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_related ()
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_str_unit ()
public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[])
end prototypes

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name =  'b_pr;b_so_return;b_goods_delivery;b_sal_invoice;'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_document_orders_grid'
istr_dwo[1].s_dwo_form = 'd_document_orders_form'
istr_dwo[1].s_dwo_grid = 'd_document_orders_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_work_order_form;'
istr_dwo[1].s_dwo_shared = ''
istr_dwo[1].s_dwo_master = ''
istr_dwo[1].s_master_keycol = ''
istr_dwo[1].s_detail_keycol = ''
istr_dwo[1].b_ref_table_yn  = true
istr_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;DOC_TYPE;VERSION_ID'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Danh sách chứng từ'

istr_dwo[2].s_dwo_default =  'd_work_order_form'
istr_dwo[2].s_dwo_form = 'd_work_order_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = true
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_master = 'd_document_orders_grid;'
istr_dwo[2].s_dwo_details = 'd_work_order_line_form;d_so_line_grid;'
istr_dwo[2].s_master_keycol = 'ID;'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[2].b_ref_table_yn  = true
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE;DOC_TYPE;ID'
istr_dwo[2].b_relation_1_1 = true
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_gb_name = 'gb_6'
istr_dwo[2].b_focus_master = true
istr_dwo[2].s_description = 'Thông tin khách hàng'

istr_dwo[3].s_dwo_default =  'd_work_order_line_form'
istr_dwo[3].s_dwo_form = 'd_work_order_line_form'
istr_dwo[3].s_dwo_grid = ''
istr_dwo[3].b_master = false
istr_dwo[3].b_detail = true
istr_dwo[3].b_cascade_del = false
istr_dwo[3].s_dwo_master = 'd_work_order_form;'
istr_dwo[3].s_dwo_details = ''
istr_dwo[3].s_master_keycol = 'ID;'
istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[3].b_ref_table_yn  = false
istr_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[3].b_insert = true
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = true
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_excel = true
istr_dwo[3].b_traceable = true
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].b_focus_master = true
istr_dwo[3].s_gb_name = 'gb_7'
istr_dwo[3].s_description = 'Phương hướng giải quyết'
end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'b_view'				// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = 'd_document_orders_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'dv_work_order_form'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].s_relatedtext_column = 'code'					
istr_dwo_related[1].s_text = 'In phiếu YCDV'
// Đối tượng liên quan
istr_dwo_related[2].s_related_obj_name = 'u_so'					// đối tượng copy đến
istr_dwo_related[2].s_main_obj_dwo = 'd_document_orders_grid'		//datawindow quan hệ main
istr_dwo_related[2].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[2].s_related_obj_dwo = 'd_document_orders_grid'	// datawindow quan hệ đến
istr_dwo_related[2].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[2].b_f_matching = true
istr_dwo_related[2].b_copy_tax = false
istr_dwo_related[2].s_relatedtext_column = 'doc_code'					
istr_dwo_related[2].s_text = 'Đề xuất bán hàng từ: '

istr_dwo_related[2].s_main_obj_dwo_copy[1] = 'd_so_line_grid' // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[1] =  'ITEM_ID;object_code;object_name;LINE_TEXT;NOTE;QTY;act_qty;price;act_price;amount;act_amount;markup_pct;markup_amt;comm_pct;comm_amt;not_invoice;foc_yn;'+&
																			'uom_code;TRANS_UOM;markup_return;SALES_PERSON;staff_name;TAX_PCT;TAX_AMT;TAX_CORRECTION' // cột copy từ
istr_dwo_related[2].s_related_obj_dwo_copy[1] = 'd_so_line_grid' // datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[1] = 'ITEM_ID;object_code;object_name;LINE_TEXT;NOTE;QTY;act_qty;price;act_price;amount;act_amount;markup_pct;markup_amt;comm_pct;comm_amt;not_invoice;foc_yn;'+&
																		'uom_code;TRANS_UOM;markup_return;SALES_PERSON;staff_name;TAX_PCT;TAX_AMT;TAX_CORRECTION' // cột copy từ // cột copy đến
istr_dwo_related[2].s_main_obj_column_chk[1] = 'bill_to_object;'
istr_dwo_related[2].s_related_obj_column_chk[1] = 'object_id;'
istr_dwo_related[2].s_f_obj_column_chk[1] = 'ITEM_ID;'
istr_dwo_related[2].s_t_obj_column_chk[1] = 'ITEM_ID;'
istr_dwo_related[2].b_copy_line[1] = true
// khai báo cập nhật bản matching
istr_dwo_related[2].s_match_f_dwo[1] = 'd_so_line_grid'
istr_dwo_related[2].s_match_f_col_obj[1] = 'item_id'
istr_dwo_related[2].s_match_t_dwo[1] = 'd_so_line_grid'
istr_dwo_related[2].s_match_f_column[1] = 'act_qty'
istr_dwo_related[2].s_match_t_column[1] = 'act_qty'
istr_dwo_related[2].s_match_column[1] = 'qty'

istr_dwo_related[2].s_main_obj_dwo_copy[2] = 'd_work_order_form' // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[2] = 'bill_to_object;object_code_1;object_name_1;bill_to_addtext;bill_to_object;object_name_1;object_code_1;bill_to_addtext;'
istr_dwo_related[2].s_main_obj_column_copy[2] += 'payment_term_code;payment_term_name;payment_method_code;payment_method_name;'
istr_dwo_related[2].s_main_obj_column_copy[2] += 'uom_code;currency_id;exchange_rate;include_tax_yn;note;payment_term;payment_method;delivery_mode_code;delivery_mode_name;delivery_mode;contact_name;contact_id'
istr_dwo_related[2].s_related_obj_dwo_copy[2] = 'd_order_so_form' // datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[2]= 'object_id;object_code;object_name;ship_to_addtext;bill_to_object;object_name_1;object_code_1;bill_to_addtext;'
istr_dwo_related[2].s_related_obj_column_copy[2] += 'payment_term_code;payment_term_name;payment_method_code;payment_method_name;'
istr_dwo_related[2].s_related_obj_column_copy[2] += 'uom_code;currency_id;exchange_rate;include_tax_yn;note;payment_term;payment_method;delivery_mode_code;delivery_mode_name;delivery_mode;contact_name;contact_id'



//istr_dwo_related[2].s_main_obj_dwo_copy[3] = 'd_tax_line_grid' // datawindow copy từ
//istr_dwo_related[2].s_main_obj_column_copy[3] = 'object_code;object_name;tax_id;tax_type;tax_pct;tax_amt;tax_correction;uom_code;exchange_rate;uprow_yn;include_yn'
//istr_dwo_related[2].s_related_obj_dwo_copy[3] = 'd_tax_line_grid' // datawindow copy đến
//istr_dwo_related[2].s_related_obj_column_copy[3] = 'object_code;object_name;tax_id;tax_type;tax_pct;tax_amt;tax_correction;uom_code;exchange_rate;uprow_yn;include_yn'
istr_dwo_related[2].s_main_obj_column_chk[2] = ''
istr_dwo_related[2].s_related_obj_column_chk[2] = ''
istr_dwo_related[2].s_f_obj_column_chk[2] = ''
istr_dwo_related[2].s_t_obj_column_chk[2] = ''
istr_dwo_related[2].s_match_f_dwo[2] = ''
istr_dwo_related[2].s_match_t_dwo[2] = ''
istr_dwo_related[2].s_match_f_column[2] = ''
istr_dwo_related[2].s_match_t_column[2] = ''
istr_dwo_related[2].s_match_column[2]=''
istr_dwo_related[2].s_main_obj_column_sum[2] = ''
istr_dwo_related[2].s_related_obj_column_sum[2] = ''
istr_dwo_related[2].b_f_sum[2] = false
istr_dwo_related[2].b_copy_line[2] = false
// Đối tượng liên quan
istr_dwo_related[3].s_related_obj_name = 'u_goods_receipt'					// đối tượng copy đến
istr_dwo_related[3].s_main_obj_dwo = 'd_document_orders_grid'		//datawindow quan hệ main
istr_dwo_related[3].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[3].s_related_obj_dwo = 'd_d_document_inventory_grid'	// datawindow quan hệ đến
istr_dwo_related[3].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[3].b_f_matching = true
istr_dwo_related[3].s_relatedtext_column = 'doc_code'					
istr_dwo_related[3].s_text = 'Phiếu nhập kho từ : '

istr_dwo_related[3].s_main_obj_dwo_copy[1] = 'd_so_line_grid' // datawindow copy từ
istr_dwo_related[3].s_main_obj_column_copy[1] = 'ITEM_ID;object_code;item_name;LINE_TEXT;NOTE;QTY;QTY;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;sales_person;price;act_price;amount;act_amount' // cột copy từ
istr_dwo_related[3].s_related_obj_dwo_copy[1] = 'd_inventory_line_receipt_grid' // datawindow copy đến
istr_dwo_related[3].s_related_obj_column_copy[1] = 'ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;doc_qty;QTY;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;sales_person;price;act_price;amount;act_amount' // cột copy đến
istr_dwo_related[3].s_main_obj_column_chk[1] = ''
istr_dwo_related[3].s_related_obj_column_chk[1] = ''
istr_dwo_related[3].s_f_obj_column_chk[1] = 'ITEM_ID'
istr_dwo_related[3].s_t_obj_column_chk[1] = 'ITEM_ID'
istr_dwo_related[3].b_copy_line[1] = true
// khai báo cập nhật bản matching
istr_dwo_related[3].s_match_f_dwo[1] = 'd_so_line_grid'
istr_dwo_related[3].s_match_f_col_obj[1] = 'item_id'
istr_dwo_related[3].s_match_t_dwo[1] = 'd_inventory_line_receipt_grid'
istr_dwo_related[3].s_match_f_column[1] = 'qty'
istr_dwo_related[3].s_match_t_column[1] = 'qty'
istr_dwo_related[3].s_match_column[1] = 'qty'

istr_dwo_related[3].s_main_obj_dwo_copy[2] = 'd_work_order_form' 
istr_dwo_related[3].s_main_obj_column_copy[2] = 'bill_to_object;object_code_1;object_name_1;'
istr_dwo_related[3].s_related_obj_dwo_copy[2] = 'd_inventory_line_receipt_grid'
istr_dwo_related[3].s_related_obj_column_copy[2] = 'object_id;vendor_code;vendor_name;'

istr_dwo_related[3].s_main_obj_column_chk[2] = ''
istr_dwo_related[3].s_related_obj_column_chk[2] = ''
istr_dwo_related[3].s_match_f_dwo[2] = ''
istr_dwo_related[3].s_match_t_dwo[2] = ''
istr_dwo_related[3].s_match_f_column[2] =''
istr_dwo_related[3].s_match_t_column[2] =''
istr_dwo_related[3].s_match_column[2] = ''
istr_dwo_related[3].s_main_obj_column_sum[2] = ''
istr_dwo_related[3].s_related_obj_column_sum[2] = ''
istr_dwo_related[3].s_f_obj_column_chk[2] = ''
istr_dwo_related[3].s_t_obj_column_chk[2] = ''
istr_dwo_related[3].b_f_sum[2] = false
end subroutine

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_so_line_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_so_line_grid'
iastr_dwo_tabpage[1].str_dwo[1].b_master = true
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_work_order_form;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = 'd_tax_line_grid;'
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
iastr_dwo_tabpage[1].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[1].i_index = 1
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Chi tiết dịch vụ'

iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_display_model = '1d'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_tax_line_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = 'd_tax_line_grid'
//iastr_dwo_tabpage[2].str_dwo[1].b_master = true
iastr_dwo_tabpage[2].str_dwo[1].b_detail = true
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_so_line_grid;'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[2].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[2].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[2].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[2].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[2].str_dwo[1].b_insert = true
iastr_dwo_tabpage[2].str_dwo[1].b_update = true
iastr_dwo_tabpage[2].str_dwo[1].b_delete = true
iastr_dwo_tabpage[2].str_dwo[1].b_query = true
iastr_dwo_tabpage[2].str_dwo[1].b_print = true
iastr_dwo_tabpage[2].str_dwo[1].b_excel = true
iastr_dwo_tabpage[2].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[2].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[2].str_dwo[1].b_relation_1_1 = true
iastr_dwo_tabpage[2].i_index = 2
iastr_dwo_tabpage[2].str_dwo[1].s_description ='Thuế'
end subroutine

public subroutine f_set_str_unit ();//--Datawindow chứa các cột cần làm tròn--//
istr_unit[1].s_dwo_handing = 'd_so_line_grid;d_so_line_grid;d_so_line_grid;d_so_line_grid;d_work_order_form;'
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = 'qty;price;amount;bc;ex'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[1].s_dwo_unit = 'd_so_line_grid;d_work_order_form;d_work_order_form;d_work_order_form;d_work_order_form'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = 'uom_code;uom_code;uom_code;uom_code;exchange_rate'
//--Loại làm tròn --//
istr_unit[1].s_type = 'item;price;amount;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[1].s_dwo_object = 'd_so_line_grid'
//--Cột chứa mã hàng--//
istr_unit[1].s_colname_object = 'object_code'
end subroutine

public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[]);if mid(rdw_focus.dataobject,1,len(rdw_focus.dataobject)-5) = 'd_document_orders' then
	ra_args[1] = gi_userid
end if
return upperbound(ra_args)
end function

on c_work_order.create
call super::create
end on

on c_work_order.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = true
is_display_model = '3d_1tp'
is_object_title = 'Yêu cầu dịch vụ'
istr_actionpane[1].s_button_name = 'b_add;b_copyt_multi;b_view_work_order;b_send_2_approve;b_request_2_change;b_approve;b_reject' //
istr_actionpane[1].s_button_has_sub = 'b_copyt_multi;'
istr_actionpane[1].sa_sub_button[1]='b_add;'
istr_actionpane[1].sa_sub_button[1]='b_copyt_so;b_copyt_goods_receipt;'
istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_description = is_object_title
is_exrate_type = 'buy'
end event

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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_view_work_order;b_blank;b_total;b_detail;b_blank;b_send_2_approve;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_view_work_order;b_blank;b_total;b_detail;b_blank;b_send_2_approve;b_approve;b_reject;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_view_work_order;b_blank;b_total;b_detail;b_blank;b_send_2_approve;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_view_work_order;b_blank;b_total;b_detail;b_blank;b_send_2_approve;b_approve;b_reject;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_view_work_order;b_blank;b_total;b_detail;b_blank; b_copyt_multi;b_blank;b_send_2_approve;b_approve;b_reject;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_view_work_order;b_blank;b_total;b_detail;b_blank; b_copyt_multi;b_blank;b_send_2_approve;b_approve;b_reject;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =   'b_so;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
				istr_actionpane[li_idx].s_visible_buttons =  'b_book; b_attach; b_note;b_doc_trace_on;b_user_trace;b_appr_trace;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_open;call super::e_window_open;t_dw_mpl			ldw_main
any				laa_value[]
//--form parm--//
ldw_main = iw_display.f_get_dwmain()
laa_value[1] = '=WORK_ORDER'
ldw_main.f_add_where('doc_type;',laa_value[])
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.f_set_ii_fixedpart1_height(450)
iw_display.f_set_ii_upperpart_height(1100)
iw_display.f_set_ii_fixedpart2_height(750)
return 0
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;t_dw_mpl			ldw_tmp,ldw_handle
string					ls_staff_name
double 				ldb_staff_id,ldb_line_id
long 					ll_line_no,ll_idx,ll_trans_hdr_id

if pos(rpo_dw.dataobject,'d_document') > 0 then
	rpo_dw.setitem(vl_currentrow,'doc_type','WORK_ORDER')
elseif rpo_dw.dataobject = 'd_work_order_form' then
	rpo_dw.setitem(vl_currentrow,'version_no',1)
	rpo_dw.setitem(vl_currentrow,'doc_type','WORK_ORDER')
	ldw_tmp = iw_display.f_get_dw( 'd_work_order_line_form')
	if isvalid(ldw_tmp) then ldw_tmp.event e_addrow()
elseif  pos(rpo_dw.dataobject,'d_so_line') > 0 then
	rpo_dw.setitem(vl_currentrow,'object_type','item')
	if vl_currentrow = 1 and  rpo_dw.rowcount()=0 then
		ll_line_no = vl_currentrow
	else
		ll_line_no = vl_currentrow
			for ll_idx = vl_currentrow + 1 to rpo_dw.rowcount()
				rpo_dw.setitem(ll_idx,'line_no',ll_idx)
			next
	end if
	rpo_dw.setitem(vl_currentrow,'line_no',ll_line_no)
	ldw_handle = iw_display.f_get_dwmain()
	if vl_currentrow = 1 and rpo_dw.rowcount() = 1 then
		ldb_staff_id = g_user.Object_id
		ls_staff_name = g_user.name
	elseif vl_currentrow = 1 and rpo_dw.rowcount()>1 then
		ldb_staff_id = rpo_dw.getitemnumber(vl_currentrow + 1,'SALES_PERSON')
		ls_staff_name = rpo_dw.getitemstring(vl_currentrow + 1,'staff_name')
	else
		ldb_staff_id = rpo_dw.getitemnumber(vl_currentrow - 1,'SALES_PERSON')
		ls_staff_name = rpo_dw.getitemstring(vl_currentrow - 1,'staff_name')
	end if
	rpo_dw.setitem(vl_currentrow,'SALES_PERSON',ldb_staff_id)
	rpo_dw.setitem(vl_currentrow,'staff_name',ls_staff_name)
	if ldw_handle.getrow() > 0 then
		ll_trans_hdr_id = ldw_handle.getitemnumber(ldw_handle.getrow() , 'trans_hdr_id') 
		ldb_line_id = rpo_dw.getitemnumber(vl_currentrow,'id')
		f_post_tax(idb_trans_id,ldb_line_id, 'd_tax_line_grid')
	end if
end if
return vl_currentrow
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;double   			ldc_qty,ldc_price,ldc_act_price,ldc_comm_amt,ldc_markup_amt,ldc_markup_return,ldc_exc,ldc_tax
double   			ldc_amount,ldc_act_amount,ldc_amt_ex,ldc_act_amt_ex,ldc_base_amt_ex,ldc_act_base_amt_ex,ldc_act_price_ex,ldc_price_ex
double				ldb_object_id,ldb_round_id,ldb_currency_id
long     				ll_row
int 					li_rtn,li_markup_pct,li_comm_pct,li_tax_percent
string   				ls_include_tax_yn,ls_address,ls_doc_type
t_dw_mpl       		ldw_tmp,ldw_main
c_user_instance	lc_user

if AncestorReturnValue = 1 then return 1
	ldw_main = iw_display.f_get_dwmain( )
	if mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_document_orders' then
		if vs_colname = 'object_name' then
			lc_user = create c_user_instance
			lc_user.f_init( rpo_dw.getitemnumber(rpo_dw.getrow(),'HANDLED_BY'))
			ldw_tmp = iw_display.f_get_dw('d_so_line_form')
			if ldw_tmp.rowcount() > 0 then
				for ll_row = 1 to ldw_tmp.rowcount()
					ldw_tmp.setitem(ll_row,'SALES_PERSON',lc_user.Object_id)
					ldw_tmp.setitem(ll_row,'staff_name',lc_user.name)
				next
			else
				return AncestorReturnValue
			end if
		end if
	elseif pos(rpo_dw.dataobject,'d_so_line') > 0 then
		ldw_tmp = iw_display.f_get_dw('d_work_order_form')
		ldb_currency_id = ldw_tmp.getitemnumber( ldw_tmp.getrow(),'CURRENCY_ID') 
		if ldb_currency_id > 0 then
			ldb_round_id = ic_unit_instance.f_get_round_id( ldb_currency_id, 0, 'amount')
		end if
		choose case vs_colname
			case 'qty','price', 'act_price'
				if dec(vs_editdata) < 0 then
					gf_messagebox('m.e_dw_e_itemchanged.02','Thông báo','Không nhập số lượng/đơn giá nhỏ hơn 0','exclamation','ok',1)
					return 1
				end if
				if vs_colname = 'qty' then
					ldc_qty = dec(vs_editdata)
					rpo_dw.setitem(vl_currentrow,'act_qty',ldc_qty)
					ldc_price = rpo_dw.getitemnumber (vl_currentrow,'price')
					ldc_act_price=rpo_dw.getitemnumber(vl_currentrow,'act_price')
				elseif vs_colname = 'price' then
					ldc_price = dec(vs_editdata)
					ldc_act_price = dec(vs_editdata)
					rpo_dw.setitem(vl_currentrow,'act_price',ldc_price)
					ldc_qty = rpo_dw.getitemnumber (vl_currentrow,'qty')
				else 
					ldc_qty = rpo_dw.getitemnumber (vl_currentrow,'qty')
					ldc_price = rpo_dw.getitemnumber (vl_currentrow,'price')
					ldc_act_price = dec(vs_editdata)
				end if
				if isnull(ldc_act_price) then ldc_act_price = 0
				ldc_exc = ldw_tmp.getitemnumber( ldw_tmp.getrow( ) , 'exchange_rate')
				ls_include_tax_yn = ldw_tmp.getitemstring( ldw_tmp.getrow( ) , 'include_tax_yn') 
				ldc_act_amount = ic_unit_instance.f_round(ldw_main, ldb_round_id,ldc_act_price*ldc_qty)
				rpo_dw.setitem(vl_currentrow,'act_amount',ldc_act_amount)
				ldc_amount = rpo_dw.getitemnumber(vl_currentrow,'amount')
				ldw_tmp = iw_display.f_get_dw('d_tax_line_grid')
				li_tax_percent = ldw_tmp.getitemnumber( ldw_tmp.getrow( ) , 'tax_pct')
				//-- Tính đơn giá, thành tiền trước thuế --//
				this.f_caculation_ex_tax(ldc_qty,ldc_price,ldc_act_price,li_tax_percent,ls_include_tax_yn,ldc_exc,ldb_currency_id,ldc_price_ex, ldc_act_price_ex,ldc_amt_ex,ldc_act_amt_ex,ldc_base_amt_ex,ldc_act_base_amt_ex)
				rpo_dw.setitem(vl_currentrow,'price_ex_tax',ldc_amt_ex)
				rpo_dw.setitem(vl_currentrow,'act_price_ex_tax',ldc_act_price_ex)
				rpo_dw.setitem(vl_currentrow,'amount_ex_tax',ldc_amt_ex)
				rpo_dw.setitem(vl_currentrow,'act_amount_ex_tax',ldc_act_amt_ex)
				rpo_dw.setitem(vl_currentrow,'base_amount_ex_tax',ldc_base_amt_ex)
				rpo_dw.setitem(vl_currentrow,'act_base_amount_ex_tax',ldc_act_base_amt_ex)
				//-- Tính thuế --//
				ldc_tax = this.f_calculation_tax( ldc_amount,ldc_amt_ex,ldc_price,ldc_qty, ldc_exc, li_tax_percent, ls_include_tax_yn)
				ldw_tmp.setitem( ldw_tmp.getrow( ), 'tax_amt', ldc_tax)
				ldw_tmp.setitem( ldw_tmp.getrow( ), 'tax_correction', ldc_tax)
				ldw_tmp.setitem( ldw_tmp.getrow( ), 'exchange_rate', ldc_exc)  
				
				li_markup_pct=rpo_dw.getitemnumber(vl_currentrow,'markup_pct')
				li_comm_pct=rpo_dw.getitemnumber(vl_currentrow,'comm_pct')
				if li_markup_pct > 0 then
					this.f_caculation_markup(ldc_amt_ex ,ldc_act_amt_ex,li_markup_pct,ldb_currency_id,ldc_markup_amt,ldc_markup_return)
					rpo_dw.setitem(vl_currentrow,'markup_amt',ldc_markup_amt)
					rpo_dw.setitem(vl_currentrow,'markup_return',ldc_markup_return)
				end if
				if li_comm_pct > 0 then
					this.f_caculation_comm(ldc_act_amt_ex,li_comm_pct,ldb_currency_id,ldc_comm_amt)
					rpo_dw.setitem(vl_currentrow,'comm_amt',ldc_comm_amt)
				end if
			case 'markup_pct','markup_return'
				ldc_amt_ex = rpo_dw.getitemnumber(vl_currentrow,'amount_ex_tax')
				ldc_act_amt_ex=rpo_dw.getitemnumber(vl_currentrow,'act_amount_ex_tax')
				if ldc_amt_ex <= ldc_act_amt_ex then
					gf_messagebox('m.e_dw_e_itemchanged.04','Thông báo','Thành tiền HĐ phải lớn hơn thành tiền thực bán','exclamation','ok',1)
					return 1
				end if
				if vs_colname = 'markup_pct' then
					li_markup_pct = dec(vs_editdata)
				else
					li_markup_pct = ic_unit_instance.f_round(ldw_main,ldb_round_id,dec(vs_editdata)*100/(ldc_amt_ex - ldc_act_amt_ex))
					rpo_dw.setitem(vl_currentrow,'markup_pct',li_markup_pct)
				end if
				this.f_caculation_markup(ldc_amt_ex ,ldc_act_amt_ex,li_markup_pct,ldb_currency_id,ldc_markup_amt,ldc_markup_return)
				rpo_dw.setitem(vl_currentrow,'markup_amt',ldc_markup_amt)
				rpo_dw.setitem(vl_currentrow,'markup_return',ldc_markup_return)
			case 'comm_pct','comm_amt'
				ldc_act_amt_ex = rpo_dw.getitemnumber(vl_currentrow,'act_amount_ex_tax')
				if vs_colname = 'comm_pct' then 
					this.f_caculation_comm(ldc_act_amt_ex,dec(vs_editdata),ldb_currency_id,ldc_comm_amt)
					rpo_dw.setitem(vl_currentrow,'comm_amt',ldc_comm_amt)
				else
					li_comm_pct = ic_unit_instance.f_round(ldw_main,ldb_round_id,dec(vs_editdata) / ldc_act_amt_ex *100)
					rpo_dw.setitem(vl_currentrow,'comm_pct',li_comm_pct)  
				end if
		end choose
	elseif mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_work_order' then
		ldw_tmp = iw_display.f_get_dw('d_tax_line_grid')
		if ldw_tmp.rowcount() = 0 then return AncestorReturnValue
		ldb_currency_id = rpo_dw.getitemnumber(vl_currentrow,'CURRENCY_ID')
		if ldb_currency_id > 0 then
			ldb_round_id = ic_unit_instance.f_get_round_id( ldb_currency_id, 0, 'amount')
		end if
		choose case vs_colname
			case 'uom_code','exchange_rate','include_tax_yn'
				if vs_colname = 'uom_code' then 
					ldc_exc = rpo_dw.getitemnumber(vl_currentrow,'exchange_rate')
					ls_include_tax_yn = rpo_dw.getitemstring(vl_currentrow,'include_tax_yn')
				elseif vs_colname = 'exchange_rate' then 
					ldc_exc = dec(vs_editdata)
					ls_include_tax_yn = rpo_dw.getitemstring(vl_currentrow,'include_tax_yn')
				else
					ldc_exc = rpo_dw.getitemnumber(vl_currentrow,'exchange_rate')
					ls_include_tax_yn = vs_editdata
				end if
				ldw_tmp = iw_display.f_get_dw('d_tax_line_grid')
				li_tax_percent = ldw_tmp.getitemnumber( ldw_tmp.getrow( ) , 'tax_pct')
				ldw_tmp = iw_display.f_get_dw('d_so_line_grid')
				this.f_update_tax(ldw_tmp , 'amount','amount_ex_tax',ldc_exc, ls_include_tax_yn)
				this.f_update_amt_ex_markup_comm_disc(ldw_tmp ,ldb_currency_id,li_tax_percent,ls_include_tax_yn,ldc_exc)
		end choose
end if
return AncestorReturnValue
end event

event e_dw_updatestart;call super::e_dw_updatestart;t_dw_mpl	ldw_tax,ldw_master_request
decimal		ldc_ex_rate,ldc_tax_amt
string			ls_include_tax_yn
double		ldb_round_id

if AncestorReturnValue = -1 then return -1
if  pos(rdw_requester.dataobject,'d_so_line_grid') > 0 then
	ldw_tax = iw_display.f_get_dw('d_tax_line_grid')
//	ldc_tax_amt = ldw_tax.getitemnumber(ldw_tax.rowcount( ), 'tax_amt') 
//	if ldc_tax_amt = 0 or isnull(ldc_tax_amt) then
		ldw_master_request = rdw_requester.dynamic f_get_idw_master()
		ldc_ex_rate = ldw_master_request.getitemnumber(ldw_master_request.getrow( ) , 'exchange_rate')
		ls_include_tax_yn = ldw_master_request.getitemstring( ldw_master_request.getrow( ), 'include_tax_yn')
		ldb_round_id = ldw_master_request.getitemnumber( ldw_master_request.getrow( ), 'currency_id')
		this.f_update_tax( rdw_requester,'amount','amount_ex_tax', ldc_ex_rate, ls_include_tax_yn)
//	end if
end if
return 0
end event

