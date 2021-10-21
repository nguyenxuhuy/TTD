$PBExportHeader$c_pur_invoice_return.sru
forward
global type c_pur_invoice_return from c_pur_invoice
end type
end forward

global type c_pur_invoice_return from c_pur_invoice
boolean ib_amortizing = true
end type
global c_pur_invoice_return c_pur_invoice_return

forward prototypes
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_related ()
public subroutine f_set_str_streamvalue ()
end prototypes

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name =  'b_po_return;b_goods_delivery;b_receipt;b_bank_voucher;'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_goods_delivery'					// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = 'd_document_ap_grid' 		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'd_document_inventory_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].b_t_matching = true
istr_dwo_related[1].s_relatedtext_column = 'doc_code'					
istr_dwo_related[1].s_text = 'Hóa đơn bán từ: '
istr_dwo_related[1].s_match_f_dwo[1] = 'd_inventory_line_delivery_grid'
istr_dwo_related[1].s_match_t_dwo[1] = 'd_pur_invoice_line_grid' 
istr_dwo_related[1].s_match_f_column[1] = 'qty'
istr_dwo_related[1].s_match_t_column[1] = 'qty'
istr_dwo_related[1].s_match_column[1] = 'qty'

istr_dwo_related[2].s_related_obj_name = 'u_bank_voucher'					// đối tượng liên quan
istr_dwo_related[2].s_main_obj_dwo = 'd_document_ap_grid'		//datawindow quan hệ main
istr_dwo_related[2].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[2].s_related_obj_dwo = 'd_document_ap_grid'	// datawindow quan hệ đến
istr_dwo_related[2].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[2].b_f_matching = true
istr_dwo_related[2].s_relatedtext_column = 'doc_code'					
istr_dwo_related[2].s_text = 'Sổ phụ ngân hàng từ:'

istr_dwo_related[2].s_main_obj_dwo_copy[1] = 'd_post_line_invoice_grid' // datawindow copy từ
istr_dwo_related[2].s_main_dr_cr_obj_dwo_sum[1]='d_invoice_pur_form'
istr_dwo_related[2].s_main_dr_cr_obj_column_sum[1]='dr_cr_object'
istr_dwo_related[2].s_main_obj_column_sum[1]='amount;base_amount'
istr_dwo_related[2].s_main_obj_column_copy[1] ='amount;base_amount' // cột copy từ
istr_dwo_related[2].s_related_obj_dwo_copy[1] = 'd_payment_line_grid' // datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[1] = 'amount;base_amount'  // cột copy đến
istr_dwo_related[2].s_main_obj_column_chk[1] = ''
istr_dwo_related[2].s_related_obj_column_chk[1] = ''
istr_dwo_related[2].b_f_sum[1] = true
istr_dwo_related[2].b_copy_line[1] = true
istr_dwo_related[2].s_main_obj_column_sum[1] = 'trans_amt;base_amt'
istr_dwo_related[2].s_match_f_dwo[1] = 'd_post_line_invoice_grid'
istr_dwo_related[2].s_match_t_dwo[1] = 'd_payment_line_grid'
istr_dwo_related[2].s_match_f_column[1] = 'trans_amt;base_amt'
istr_dwo_related[2].s_match_t_column[1] = 'amount;base_amount'
istr_dwo_related[2].s_match_column[1] = 'trans_value;base_value'

istr_dwo_related[2].s_main_obj_dwo_copy[2] = 'd_invoice_pur_form' // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[2] ='currency_id;uom_code;exchange_rate' // cột copy từ
istr_dwo_related[2].s_related_obj_dwo_copy[2] = 'd_bank_voucher_form' // datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[2] = 'currency_id;uom_code;exchange_rate'  // cột copy đến

istr_dwo_related[2].b_f_sum[3] = true
istr_dwo_related[2].s_match_f_column[3] = 'trans_amt;base_amt'
istr_dwo_related[2].s_main_obj_dwo_copy[3] = 'd_post_line_tax_grid'
istr_dwo_related[2].s_main_obj_column_copy[3] =''
istr_dwo_related[2].s_related_obj_dwo_copy[3] = 'd_payment_line_grid' 
istr_dwo_related[2].s_related_obj_column_copy[3] ='amount;base_amount'

istr_dwo_related[2].s_match_f_dwo[3] = 'd_post_line_tax_grid'
istr_dwo_related[2].s_match_t_dwo[3] = 'd_payment_line_grid'
istr_dwo_related[2].s_match_f_column[3] = 'trans_amt;base_amt'
istr_dwo_related[2].s_match_t_column[3] = 'amount;base_amount'
istr_dwo_related[2].s_match_column[3] = 'trans_value;base_value'

istr_dwo_related[2].s_main_obj_dwo_copy[4] = 'd_invoice_pur_form' // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[4] ='dr_cr_object;dr_cr_object_type;dr_cr_object_code;dr_cr_object_name' // cột copy từ
istr_dwo_related[2].s_related_obj_dwo_copy[4] = 'd_payment_line_grid' // datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[4] = 'object_id;object_type;object_code;object_name'  // cột copy đến
istr_dwo_related[2].s_main_obj_column_chk[4] = ''
istr_dwo_related[2].s_related_obj_column_chk[4] = ''
istr_dwo_related[2].s_match_f_dwo[4] = ''
istr_dwo_related[2].s_match_t_dwo[4] = ''
istr_dwo_related[2].s_main_obj_column_sum[4] = ''
istr_dwo_related[2].s_related_obj_column_sum[4] = ''
istr_dwo_related[2].s_f_obj_column_chk[4]=''
istr_dwo_related[2].s_t_obj_column_chk[4]=''
istr_dwo_related[2].b_f_sum[4] = false
istr_dwo_related[2].b_copy_line[4] = false

istr_dwo_related[3].s_related_obj_name = 'u_receipt'					// đối tượng liên quan
istr_dwo_related[3].s_main_obj_dwo = 'd_document_ap_grid'		//datawindow quan hệ main
istr_dwo_related[3].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[3].s_related_obj_dwo = 'd_document_ar_grid'	// datawindow quan hệ đến
istr_dwo_related[3].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[3].b_f_matching = true
istr_dwo_related[3].s_relatedtext_column = 'doc_code'					
istr_dwo_related[3].s_text = 'Phiếu thu:'

istr_dwo_related[3].s_main_obj_dwo_copy[1] = 'd_post_line_invoice_grid' // datawindow copy từ
istr_dwo_related[3].s_main_dr_cr_obj_dwo_sum[1]='d_invoice_pur_form'
istr_dwo_related[3].s_main_dr_cr_obj_column_sum[1]='dr_cr_object'
istr_dwo_related[3].s_main_obj_column_sum[1]='trans_amt;base_amt'
istr_dwo_related[3].s_main_obj_column_copy[1] ='amount;base_amount' // cột copy từ
istr_dwo_related[3].s_related_obj_dwo_copy[1] = 'd_payment_line_grid' // datawindow copy đến
istr_dwo_related[3].s_related_obj_column_copy[1] = 'amount;base_amount'  // cột copy đến
istr_dwo_related[3].s_main_obj_column_chk[1] = ''
istr_dwo_related[3].s_related_obj_column_chk[1] = ''
istr_dwo_related[3].b_copy_line[1] = true
istr_dwo_related[3].b_f_sum[1] = true
istr_dwo_related[3].s_main_obj_column_sum[1] = 'trans_amt;base_amt'
istr_dwo_related[3].s_match_f_dwo[1] = 'd_post_line_invoice_grid'
//istr_dwo_related[3].s_match_f_col_obj[1] = 'object_id'
istr_dwo_related[3].s_match_t_dwo[1] = 'd_payment_line_grid'
istr_dwo_related[3].s_match_f_column[1] ='trans_amt;base_amt'
istr_dwo_related[3].s_match_t_column[1] = 'amount;base_amount'
istr_dwo_related[3].s_match_column[1] = 'trans_value;base_value'

istr_dwo_related[3].s_main_obj_dwo_copy[2] = 'd_invoice_pur_form' // datawindow copy từ
istr_dwo_related[3].s_main_obj_column_copy[2] ='currency_id;uom_code;exchange_rate' // cột copy từ
istr_dwo_related[3].s_related_obj_dwo_copy[2] = 'd_receipt_form' // datawindow copy đến
istr_dwo_related[3].s_related_obj_column_copy[2] = 'currency_id;uom_code;exchange_rate'  // cột copy đến

istr_dwo_related[3].b_f_sum[3] = true
istr_dwo_related[3].s_match_f_column[3] = 'trans_amt;base_amt'
istr_dwo_related[3].s_main_obj_dwo_copy[3] = 'd_post_line_tax_grid'
istr_dwo_related[3].s_main_obj_column_copy[3] =''
istr_dwo_related[3].s_related_obj_dwo_copy[3] = 'd_payment_line_grid' 
istr_dwo_related[3].s_related_obj_column_copy[3] =''

istr_dwo_related[3].s_match_f_dwo[3] = 'd_post_line_tax_grid'
istr_dwo_related[3].s_match_t_dwo[3] = 'd_payment_line_grid'
istr_dwo_related[3].s_match_f_column[3] = 'trans_amt;base_amt'
istr_dwo_related[3].s_match_t_column[3] = 'amount;base_amount'
istr_dwo_related[3].s_match_column[3] = 'trans_value;base_value'

istr_dwo_related[3].s_main_obj_dwo_copy[4] = 'd_invoice_pur_form' // datawindow copy từ
istr_dwo_related[3].s_main_obj_column_copy[4] ='dr_cr_object;dr_cr_object_type;dr_cr_object_code;dr_cr_object_name' // cột copy từ
istr_dwo_related[3].s_related_obj_dwo_copy[4] = 'd_payment_line_grid' // datawindow copy đến
istr_dwo_related[3].s_related_obj_column_copy[4] = 'object_id;object_type;object_code;object_name'  // cột copy đến
istr_dwo_related[3].s_main_obj_column_chk[4] = ''
istr_dwo_related[3].s_related_obj_column_chk[4] = ''
istr_dwo_related[3].s_match_f_dwo[4] = ''
istr_dwo_related[3].s_match_t_dwo[4] = ''
istr_dwo_related[3].s_main_obj_column_sum[4] = ''
istr_dwo_related[3].s_related_obj_column_sum[4] = ''
istr_dwo_related[3].s_f_obj_column_chk[4]=''
istr_dwo_related[3].s_t_obj_column_chk[4]=''
istr_dwo_related[3].b_f_sum[4] = false
istr_dwo_related[3].b_copy_line[4] = false

istr_dwo_related[4].s_related_obj_name = 'u_po_return'					// đối tượng copy đến
istr_dwo_related[4].s_main_obj_dwo = 'd_document_ap_grid'	//datawindow quan hệ main
istr_dwo_related[4].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[4].s_related_obj_dwo = 'd_document_pm_grid'	// datawindow quan hệ đến
istr_dwo_related[4].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[4].b_t_matching = true
istr_dwo_related[4].s_relatedtext_column = 'doc_code'					
istr_dwo_related[4].s_text = 'Đơn trả hàng từ: '

istr_dwo_related[4].s_main_obj_column_chk[1] = ''
istr_dwo_related[4].s_related_obj_column_chk[1] = ''
// khai báo cập nhật bản matching
istr_dwo_related[4].s_match_f_dwo[1] = 'd_po_line_grid'
istr_dwo_related[4].s_match_t_dwo[1] = 'd_pur_invoice_line_grid'
istr_dwo_related[4].s_match_f_column[1] = 'qty'
istr_dwo_related[4].s_match_t_column[1] = 'qty'
istr_dwo_related[4].s_match_column[1] = 'qty'
istr_dwo_related[4].s_main_obj_column_sum[1] = ''
istr_dwo_related[4].s_related_obj_column_sum[1] = ''
istr_dwo_related[4].b_f_sum[1] = false

istr_dwo_related[6].s_related_obj_name = 'u_map_invoice'
istr_dwo_related[6].s_main_obj_dwo = 'd_invoice_pur_form'
istr_dwo_related[6].s_main_obj_column = 'invoice_object'
istr_dwo_related[6].s_related_obj_dwo = 'd_address_map_form'
istr_dwo_related[6].s_related_obj_column = 'object_id'

istr_dwo_related[5].s_related_obj_name = 'u_map_delivery'
istr_dwo_related[5].s_main_obj_dwo = 'd_invoice_pur_form'
istr_dwo_related[5].s_main_obj_column = 'dr_cr_object'
istr_dwo_related[5].s_related_obj_dwo = 'd_address_map_form'
istr_dwo_related[5].s_related_obj_column = 'object_id'

istr_dwo_related[6].s_related_obj_name = 'u_pur_invoice'					// đối tượng liên quan
istr_dwo_related[6].s_main_obj_dwo = 'd_document_ap_grid'		//datawindow quan hệ main
istr_dwo_related[6].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[6].s_related_obj_dwo = 'd_document_ap_grid'	// datawindow quan hệ đến
istr_dwo_related[6].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[6].b_t_matching = true
istr_dwo_related[6].s_relatedtext_column = 'code'					
istr_dwo_related[6].s_text = 'Hóa đơn mua:'
istr_dwo_related[6].s_match_f_dwo[1] = 'd_pur_invoice_line_grid'
istr_dwo_related[6].s_match_t_dwo[1] = 'd_pur_invoice_line_grid'
istr_dwo_related[6].s_match_f_column[1] = 'qty'
istr_dwo_related[6].s_match_t_column[1] = 'qty'
istr_dwo_related[6].s_match_column[1] = 'qty'

istr_dwo_related[7].s_related_obj_name = 'b_view'					// đối tượng liên quan
istr_dwo_related[7].s_main_obj_dwo = 'd_document_ap_grid'		//datawindow quan hệ main
istr_dwo_related[7].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[7].s_related_obj_dwo = 'dv_pur_invoice_return_form'	// datawindow quan hệ đến
istr_dwo_related[7].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[7].s_relatedtext_column = 'code'					
istr_dwo_related[7].s_text = 'In hóa đơn trả hàng '

istr_dwo_related[7].s_related_obj_name = 'b_view'					// đối tượng liên quan
istr_dwo_related[7].s_main_obj_dwo = 'd_document_ap_grid'		//datawindow quan hệ main
istr_dwo_related[7].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[7].s_related_obj_dwo = 'dv_accounting_form'	// datawindow quan hệ đến
istr_dwo_related[7].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[7].s_relatedtext_column = 'code'					
istr_dwo_related[7].s_text = 'Chứng từ kế toán '
end subroutine

public subroutine f_set_str_streamvalue ();istr_streamvalue[1].s_f_obj_dwo = 'd_pur_invoice_line_grid'
istr_streamvalue[1].s_f_obj_column = 'warehouse_id'
istr_streamvalue[1].s_f_column_sv = 'F_OBJECT_ID'

istr_streamvalue[1].s_t_obj_dwo = 'd_invoice_pur_form'
istr_streamvalue[1].s_t_obj_column = 'DR_CR_OBJECT'
istr_streamvalue[1].s_t_column_sv = 'T_OBJECT_ID'

istr_streamvalue[1].s_item_dwo = 'd_pur_invoice_line_grid'
istr_streamvalue[1].s_item_column = 'object_id;spec_id;qty;trans_uom; loc_id'
istr_streamvalue[1].s_item_column_sv = 'item_id;spec_id;qty;uom_id;loc_id'

istr_streamvalue[1].s_currency_dwo = 'd_invoice_pur_form'
istr_streamvalue[1].s_currency_column = 'currency_id;exchange_rate'
istr_streamvalue[1].s_currency_column_sv = 'trans_cur_id;exchange_rate'

istr_streamvalue[1].s_value_dwo = 'd_pur_invoice_line_grid'
istr_streamvalue[1].s_value_column = 'object_id;amount;base_amount;spec_id;qty_sku'
istr_streamvalue[1].s_value_column_sv = 'item_id;trans_value;base_value;spec_id;qty'

istr_streamvalue[1].s_item_lot_dwo = 'ds_lot_line_4booking'
istr_streamvalue[1].s_item_lot_column = 'qty;lot_no;serial_no;'
istr_streamvalue[1].s_item_lot_column_sv = 'qty;LOT_NO;SERIAL_NO;'

end subroutine

on c_pur_invoice_return.create
call super::create
end on

on c_pur_invoice_return.destroy
call super::destroy
end on

event constructor;call super::constructor;is_object_title = 'Hóa đơn trả hàng NCC'
is_exrate_type = 'buy'

istr_actionpane[1].s_button_name = 'b_add_multi;b_join_multi;b_copyt_multi;b_insert;b_modify;b_save; b_saveclose;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_total;b_view_pur_invoice_return;b_post;b_unpost;b_send_2_approve;b_request_2_change;b_approve;b_reject;'
istr_actionpane[1].s_button_has_sub = 'b_add_multi;b_join_multi;b_copyt_multi;'
istr_actionpane[1].sa_sub_button[1]='b_add;b_copyf_goods_delivery;b_copyf_po_return;b_copyf_pur_invoice;'
istr_actionpane[1].sa_sub_button[2]='b_copyl_goods_delivery;b_copyl_po_return;b_copyl_pur_invoice;'
istr_actionpane[1].sa_sub_button[3]='b_copyt_receipt;b_copyt_bank_voucher;b_view_accounting;'
istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_description = is_object_title
end event

event e_action_ctrl_bttn;//-- override --//
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_blank;b_allocate;b_blank;b_copyt_multi;b_blank;b_post;b_account_view;b_blank;b_view_pur_invoice_return;b_blank;b_send_2_approve;b_blank;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_join_multi;b_modify;b_blank; b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_blank;b_allocate;b_blank;b_copyt_multi;b_blank;b_post;b_account_view;b_blank;b_view_pur_invoice_return;b_blank;b_send_2_approve;b_blank;b_approve;b_reject;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query; b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_blank;b_copyt_multi;b_blank;b_post;b_account_view;b_blank;b_view_pur_invoice_return;b_blank;b_send_2_approve;b_blank;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query; b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_blank;b_copyt_multi;b_blank;b_post;b_account_view;b_blank;b_view_pur_invoice_return;b_blank;b_send_2_approve;b_blank;b_approve;b_reject;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_blank;b_allocate;b_blank;b_copyt_multi;b_blank;b_post;b_account_view;b_blank;b_view_pur_invoice_return;b_blank;b_send_2_approve;b_blank;b_approve;b_reject;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_blank;b_allocate;b_blank;b_copyt_multi;b_blank;b_post;b_account_view;b_blank;b_view_pur_invoice_return;b_blank;b_send_2_approve;b_blank;b_approve;b_reject;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =   'b_po_return;b_goods_delivery;b_pur_invoice;b_receipt;b_bank_voucher;'
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

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;
if pos(rpo_dw.dataobject,'d_document') > 0 then
	 rpo_dw.setitem(vl_currentrow,'doc_type','PUR_INVOICE_RETURN')
elseif pos(rpo_dw.dataobject,'d_invoice_pur') > 0 then
	rpo_dw.setitem(vl_currentrow,'doc_type','PUR_INVOICE_RETURN')
end if
return vl_currentrow
end event

event e_window_open;//-- override --//
t_dw_mpl			ldw_main
b_obj_instantiate		lobj_ins
any				laa_value[],laa_null[]
string				ls_int_string

//--form parm--//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '=PUR_INVOICE_RETURN'
ldw_main.f_add_where('doc_type;',laa_value[])
iw_display.f_set_text_cbx_1( 'Xem tất cả các thuế', false)
if ids_tax_authority.rowcount() = 0 then
	laa_value[1] = '>0'
	
	ls_int_string = 'object_ref_id;'
	if lobj_ins.f_is_branch_yn('u_tax_authority') then
		laa_value[2] = gdb_branch
		ls_int_string = 'object_ref_id;branch_id;'
	end if			
	this.f_init_object_table(ids_tax_authority, 'd_tax_authority_form', ls_int_string,laa_value[],laa_null[])
end if
if ids_currency.rowcount( ) = 0 then
	laa_value[1] = '=Y'
	this.f_init_object_table(ids_currency, 'd_currency_grid', 'base_yn',laa_value, laa_null[])
end if

return 0
end event

event e_window_e_post;call super::e_window_e_post;double			ldb_f_doc_id,ldb_po_doc_id
t_dw_mpl		ldw_main
t_transaction	lt_transaction

iw_display.f_get_transaction(lt_transaction)
ldw_main = iw_display.f_get_dwmain( )
ldb_f_doc_id = ldw_main.getitemnumber( ldw_main.getrow( ) , 'id')
ldb_po_doc_id = this.f_get_po_doc_id( "PUR_INVOICE_LINE", ldb_f_doc_id)
if ldb_po_doc_id > 0 then
	UPDATE DOCUMENT SET STATUS = 'invoiced' WHERE ID = :ldb_po_doc_id using lt_transaction;
	if lt_transaction.sqlcode <> 0 then
		gf_messagebox('m.c_pur_invoice_return.e_window_e_post.01','Thông báo','Lỗi, Không cập nhật được trạng thái cho đơn đặt mua: @'+lt_transaction.sqlerrtext ,'stop','ok',1)
		rollback using lt_transaction;
		return -1
	end if
	return 1
end if
return 0
end event

event e_window_e_preunpost;call super::e_window_e_preunpost;any				laa_data[]
long				ll_rtn
double			ldb_po_doc_id,ldb_f_doc_id
t_ds_db 			lds_matching
t_dw_mpl		ldw_main
t_transaction	lt_transaction

iw_display.f_get_transaction(lt_transaction)
//-- Kiểm tra phiếu đã cấn trừ chưa? --//
lds_matching = create t_ds_db
lds_matching.dataobject = 'ds_check_matching'
lds_matching.f_settransobject(lt_transaction )

ldw_main = iw_display.f_get_dwmain( )
laa_data[1] = ldw_main.getitemnumber( ldw_main.getrow( ), 'id')
lds_matching.f_add_where( 'f_doc_id',laa_data )
ll_rtn = lds_matching.retrieve( )
if ll_rtn > 0 then
	gf_messagebox('m.c_pur_invoice_return.e_window_e_preunpost.01','Thông báo','Phiếu: '+ lds_matching.getitemstring( 1, 'f_doc_code') +' đã cấn trừ với phiếu: '+ lds_matching.getitemstring( 1, 't_doc_code') +' nên không được sửa ghi sổ!' ,'stop','ok',1)
	destroy lds_matching
	return -1
end if
destroy lds_matching
//-- Cập nhật lại trạng thái cho ĐĐM --//
ldw_main = iw_display.f_get_dwmain( )
ldb_f_doc_id = ldw_main.getitemnumber( ldw_main.getrow( ) , 'id')
ldb_po_doc_id = this.f_get_po_doc_id( "PUR_INVOICE_LINE", ldb_f_doc_id)
if ldb_po_doc_id > 0 then
	update document set status = 'full_issue' where id = :ldb_po_doc_id using lt_transaction ;
	if lt_transaction.sqlcode <> 0 then
		gf_messagebox('m.c_pur_invoice_return.e_window_e_preunpost.02','Thông báo','Lỗi, Không cập nhật được trạng thái cho đơn đặt mua: @'+lt_transaction.sqlerrtext ,'stop','ok',1)
			rollback using  lt_transaction;
			return -1
	end if
	return 1
end if
return 0
end event

