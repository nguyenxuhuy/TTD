$PBExportHeader$c_p_proposal.sru
forward
global type c_p_proposal from b_doc
end type
end forward

global type c_p_proposal from b_doc
end type
global c_p_proposal c_p_proposal

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_related ()
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_str_unit ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_document_pay_proposal_grid'
istr_dwo[1].s_dwo_form = 'd_document_pay_proposal_form'
istr_dwo[1].s_dwo_grid = 'd_document_pay_proposal_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_order_pay_proposal_form;'
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
istr_dwo[1].s_gb_name = 'gb_6'
istr_dwo[1].s_description = 'Danh sách chứng từ'

istr_dwo[2].s_dwo_default =  'd_order_pay_proposal_form'
istr_dwo[2].s_dwo_form = 'd_order_pay_proposal_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = true
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_master = 'd_document_pay_proposal_grid;'
istr_dwo[2].s_dwo_details = 'd_pay_proposal_line_grid;'
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
istr_dwo[2].b_focus_master = true
istr_dwo[2].s_description = 'Chi tiết chứng từ'
end subroutine

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_dwo_related ();//istr_dwo_related[1].s_related_obj_name = 'u_so'					// đối tượng copy đến
//istr_dwo_related[1].s_main_obj_dwo = 'd_document_qt_grid'		//datawindow quan hệ main
//istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
//istr_dwo_related[1].s_related_obj_dwo = 'd_document_orders_grid'	// datawindow quan hệ đến
//istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
//istr_dwo_related[1].b_f_matching = true
////istr_dwo_related[1].b_return = true //la doi duong tra hang
//istr_dwo_related[1].s_relatedtext_column = 'doc_code'					
//istr_dwo_related[1].s_text = 'Đề xuất bán hàng từ: '
//
//istr_dwo_related[1].s_main_obj_dwo_copy[1] = 'd_qt_line_grid' // datawindow copy từ
//istr_dwo_related[1].s_main_obj_column_copy[1] =  'ITEM_ID;item_code;LINE_TEXT;NOTE;other_note;act_qty;act_qty;act_price;act_price;act_amount;act_amount;markup_pct;markup_amt;comm_pct;comm_amt;not_invoice;foc_yn;'+&
//																			'uom_code;TRANS_UOM;markup_return;SALES_PERSON;staff_name;base_price;base_amount' // cột copy từ
//istr_dwo_related[1].s_related_obj_dwo_copy[1] = 'd_so_line_grid' // datawindow copy đến
//istr_dwo_related[1].s_related_obj_column_copy[1] = 'ITEM_ID;object_code;LINE_TEXT;NOTE;other_note;QTY;act_qty;price;act_price;amount;act_amount;markup_pct;markup_amt;comm_pct;comm_amt;not_invoice;foc_yn;'+&
//																		'uom_code;TRANS_UOM;markup_return;SALES_PERSON;staff_name;base_price;base_amount' // cột copy từ // cột copy đến
//istr_dwo_related[1].s_main_obj_column_chk[1] = ''
//istr_dwo_related[1].s_related_obj_column_chk[1] = ''
//istr_dwo_related[1].s_f_obj_column_chk[1] = 'ITEM_ID;PRICE;NOT_INVOICE;foc_yn;'
//istr_dwo_related[1].s_t_obj_column_chk[1] = 'ITEM_ID;PRICE;NOT_INVOICE;foc_yn;'
//istr_dwo_related[1].b_copy_line[1] = true
//// khai báo cập nhật bản matching
//istr_dwo_related[1].s_match_f_dwo[1] = 'd_qt_line_grid'
////istr_dwo_related[1].s_match_f_col_obj[1] = 'item_id' --cho phép hàng hóa dịch vụ
//istr_dwo_related[1].s_match_t_dwo[1] = 'd_so_line_grid'
//istr_dwo_related[1].s_match_f_column[1] = 'act_qty'
//istr_dwo_related[1].s_match_t_column[1] = 'act_qty'
//istr_dwo_related[1].s_match_column[1] = 'qty'
//
//
//istr_dwo_related[1].s_main_obj_dwo_copy[2] = 'd_order_qt_form' // datawindow copy từ
//istr_dwo_related[1].s_main_obj_column_copy[2] = 'object_id;object_code;object_name;ship_to_addtext;bill_to_object;object_name_1;object_code_1;bill_to_addtext;'
//istr_dwo_related[1].s_main_obj_column_copy[2] += 'due_date;payment_term_code;payment_term_name;payment_method_code;payment_method_name;'
//istr_dwo_related[1].s_main_obj_column_copy[2] += 'uom_code;currency_id;exchange_rate;include_tax_yn;note;payment_term;payment_method;delivery_mode_code;delivery_mode_name;delivery_mode;contact_name;contact_id'
//istr_dwo_related[1].s_related_obj_dwo_copy[2] = 'd_order_so_form' // datawindow copy đến
//istr_dwo_related[1].s_related_obj_column_copy[2]= 'object_id;object_code;object_name;ship_to_addtext;bill_to_object;object_name_1;object_code_1;bill_to_addtext;'
//istr_dwo_related[1].s_related_obj_column_copy[2] += 'due_date;payment_term_code;payment_term_name;payment_method_code;payment_method_name;'
//istr_dwo_related[1].s_related_obj_column_copy[2] += 'uom_code;currency_id;exchange_rate;include_tax_yn;note;payment_term;payment_method;delivery_mode_code;delivery_mode_name;delivery_mode;contact_name;contact_id'
//
//istr_dwo_related[1].s_main_obj_dwo_copy[3] = 'd_charge_line_grid' // datawindow copy từ
//istr_dwo_related[1].s_main_obj_column_copy[3] = 'object_code;object_name;charge_id;charge_amt;charge_pct;uom_code;exchange_rate;CHARGE_CURRENCY;beneficiary_name;beneficiary_id'
//istr_dwo_related[1].s_related_obj_dwo_copy[3] = 'd_charge_line_grid' // datawindow copy đến
//istr_dwo_related[1].s_related_obj_column_copy[3] = 'object_code;object_name;charge_id;charge_amt;charge_pct;uom_code;exchange_rate;CHARGE_CURRENCY;beneficiary_name;beneficiary_id'
//istr_dwo_related[1].s_main_obj_column_chk[3] = ''
//istr_dwo_related[1].s_related_obj_column_chk[3] = ''
//istr_dwo_related[1].s_match_f_dwo[3] = ''
//istr_dwo_related[1].s_match_t_dwo[3] = ''
//istr_dwo_related[1].s_main_obj_column_sum[3] = ''
//istr_dwo_related[1].s_related_obj_column_sum[3] = ''
//istr_dwo_related[1].s_f_obj_column_chk[3] = ''
//istr_dwo_related[1].s_t_obj_column_chk[3] = ''
//istr_dwo_related[1].b_f_sum[3] = false
//istr_dwo_related[1].b_copy_line[3] = false

//// khai báo cập nhật bản matching
//istr_dwo_related[1].s_match_f_dwo[3] = 'd_order_catch_grid'
//istr_dwo_related[1].s_match_t_dwo[3] = 'd_order_catch_grid'
//istr_dwo_related[1].s_match_f_column[3] = 'catch_qty'
//istr_dwo_related[1].s_match_t_column[3] = 'catch_qty'
//istr_dwo_related[1].s_match_column[3] = 'qty'

//istr_dwo_related[1].s_main_obj_dwo_copy[4] = 'd_so_tech_grid' // datawindow copy từ
//istr_dwo_related[1].s_main_obj_column_copy[4] = 'tech_staff;staff_code;staff_name;s_time;f_time;work_hour;actual_f_time;tech_note'
//istr_dwo_related[1].s_related_obj_dwo_copy[4] = 'd_so_tech_grid' // datawindow copy đến
//istr_dwo_related[1].s_related_obj_column_copy[4] = 'tech_staff;staff_code;staff_name;s_time;f_time;work_hour;actual_f_time;tech_note'
//istr_dwo_related[1].s_main_obj_column_chk[4] = ''
//istr_dwo_related[1].s_related_obj_column_chk[4] = ''
//istr_dwo_related[1].s_match_f_dwo[4] = ''
//istr_dwo_related[1].s_match_t_dwo[4] = ''
//istr_dwo_related[1].s_main_obj_column_sum[4] = ''
//istr_dwo_related[1].s_related_obj_column_sum[4] = ''
//istr_dwo_related[1].s_f_obj_column_chk[4] = ''
//istr_dwo_related[1].s_t_obj_column_chk[4] = ''
//istr_dwo_related[1].b_f_sum[4] = false
//istr_dwo_related[1].b_copy_line[4] = false

//istr_dwo_related[2].s_related_obj_name = 'u_map_invoice'
//istr_dwo_related[2].s_main_obj_dwo = 'd_order_qt_form'
//istr_dwo_related[2].s_main_obj_column = 'bill_to_object'
//istr_dwo_related[2].s_related_obj_dwo = 'd_address_map_form'
//istr_dwo_related[2].s_related_obj_column = 'object_id'
//
//istr_dwo_related[3].s_related_obj_name = 'u_map_delivery'
//istr_dwo_related[3].s_main_obj_dwo = 'd_order_qt_form'
//istr_dwo_related[3].s_main_obj_column = 'object_id'
//istr_dwo_related[3].s_related_obj_dwo = 'd_address_map_form'
//istr_dwo_related[3].s_related_obj_column = 'object_id'
//
//istr_dwo_related[4].s_related_obj_name = 'b_view'
//istr_dwo_related[4].s_main_obj_dwo = 'd_document_qt_grid'
//istr_dwo_related[4].s_main_obj_column = 'id'
//istr_dwo_related[4].s_related_obj_dwo = 'dv_qt_form'
//istr_dwo_related[4].s_related_obj_column = 'id'
//istr_dwo_related[4].s_relatedtext_column = 'code'
//istr_dwo_related[4].s_text = 'In bảng báo giá'
//
end subroutine

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
iastr_dwo_tabpage[1].i_upperpart_height = 500
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_pay_proposal_line_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_pay_proposal_line_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_popmenu_items = ''
iastr_dwo_tabpage[1].str_dwo[1].b_master = true
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_order_pay_proposal_form;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = 'd_pay_proposal_detail_grid;'
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
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Các đối tượng đề nghị thanh toán'

iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_display_model = '1d'
iastr_dwo_tabpage[2].i_upperpart_height = 500
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_pay_proposal_detail_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = 'd_pay_proposal_detail_grid'
iastr_dwo_tabpage[2].str_dwo[1].b_master = false
iastr_dwo_tabpage[2].str_dwo[1].b_detail = true
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_pay_proposal_line_grid;'
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
iastr_dwo_tabpage[2].str_dwo[1].s_description ='Bảng kê chi tiết đề nghị'


end subroutine

public subroutine f_set_str_unit ();//--Datawindow chứa các cột cần làm tròn--//
istr_unit[1].s_dwo_handing = ';;d_pay_proposal_line_grid;d_pay_proposal_line_grid;d_order_pay_proposal_form;'
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = ';;amount;base_amount;exchange_rate'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[1].s_dwo_unit = ';;d_order_pay_proposal_form;d_order_pay_proposal_form;d_order_pay_proposal_form;'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = ';;uom_code;uom_code;exchange_rate'
//--Loại làm tròn --//
istr_unit[1].s_type = ';;amount;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[1].s_dwo_object = ''
//--Cột chứa mã hàng--//
istr_unit[1].s_colname_object = ''

//--Datawindow chứa các cột cần làm tròn--//
istr_unit[2].s_dwo_handing = ';;d_pay_proposal_detail_grid;d_pay_proposal_detail_grid;d_order_pay_proposal_form;'
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[2].s_colname_data = ';;amount;base_amount;exchange_rate'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[2].s_colname_convert = ''
istr_unit[2].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[2].s_dwo_unit = ';;d_order_pay_proposal_form;d_order_pay_proposal_form;d_order_pay_proposal_form;'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[2].s_colname_unit = ';;uom_code;uom_code;exchange_rate'
//--Loại làm tròn --//
istr_unit[2].s_type = ';;amount;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[2].s_dwo_object = ''
//--Cột chứa mã hàng--//
istr_unit[2].s_colname_object = ''
end subroutine

on c_p_proposal.create
call super::create
end on

on c_p_proposal.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = true
this.ib_keyboardlocked = true
is_display_model = '2dgb_1tp'
is_object_title = 'Đề nghị thanh toán'
istr_actionpane[1].s_button_name = 'b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_copyt_so;b_send_2_approve;b_approve;b_reject;b_completed;b_lose;b_view_multi;'
istr_actionpane[1].s_button_has_sub = 'b_add_multi;b_view_multi;'
istr_actionpane[1].sa_sub_button[1]='b_add;b_copyt_seft;'
istr_actionpane[1].sa_sub_button[2]='b_view_qt;'
istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_description = is_object_title
is_exrate_type = 'buy'
end event

event e_action_ctrl_bttn;datawindow				ldw_focus
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_copyt_so;b_blank;b_view_multi;b_blank;b_send_2_approve;b_completed;b_lose;b_approve;b_reject;' //visible
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_view_multi;b_blank;b_total;b_detail;b_blank;b_send_2_approve;b_approve;b_reject;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_view_multi;b_blank;b_total;b_detail;b_blank;b_send_2_approve;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_view_multi;b_blank;b_total;b_detail;b_blank;b_send_2_approve;b_approve;b_reject;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_view_multi;b_blank;b_copyt_so;b_send_2_approve;b_completed;b_lose;b_approve;b_reject;' //visible
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_view_multi;b_blank;b_total;b_detail;b_blank; b_copyt_multi;b_blank;b_send_2_approve;b_approve;b_reject;'
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

//string				ls_where
any				laa_value[]

//--form parm--//
ldw_main = iw_display.f_get_dwmain()
laa_value[1] = 'P_PROPOSAL'
ldw_main.f_add_where('doc_type;',laa_value[])
iw_display.f_set_text_cbx_1( 'Xem tất', false)


return 0
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;
if pos(rpo_dw.dataobject,'d_document_') > 0 then
	 rpo_dw.setitem(vl_currentrow,'doc_type','P_PROPOSAL')
elseif  pos(rpo_dw.dataobject,'d_qt_line') > 0 then
	rpo_dw.setitem(vl_currentrow,'object_type','CUSTOMER')

elseif pos(rpo_dw.dataobject,'d_order_pay_proposal_form') > 0 then
	rpo_dw.setitem(vl_currentrow,'version_no',1)
	rpo_dw.setitem(vl_currentrow,'doc_type','P_PROPOSAL')
end if
return vl_currentrow
end event

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.f_set_ii_upperpart_height(1400)
iw_display.f_set_ii_fixedpart2_height(620)
iw_display.f_set_ii_gb_3_height(650)
return 0
end event

event e_cbx_clicked;if rcbx_handling.checked then
	this.f_doc_filter(  'd_tax_line_grid', true)			
	this.f_doc_filter(  'd_charge_line_grid', true)
else
	this.f_doc_filter(  'd_tax_line_grid', false)
	this.f_doc_filter(  'd_charge_line_grid', false)
end if
return 0
end event

