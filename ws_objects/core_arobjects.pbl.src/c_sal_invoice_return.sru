$PBExportHeader$c_sal_invoice_return.sru
forward
global type c_sal_invoice_return from c_sal_invoice
end type
end forward

global type c_sal_invoice_return from c_sal_invoice
boolean ib_collecting = true
end type
global c_sal_invoice_return c_sal_invoice_return

forward prototypes
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_related ()
public subroutine f_set_str_streamvalue ()
end prototypes

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name =  'b_so_return;b_goods_receipt;b_payment;b_bank_voucher;'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_dwo_related ();
istr_dwo_related[1].s_related_obj_name = 'u_goods_receipt'					// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = 	'd_document_ar_grid'	//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo =  'd_document_inventory_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].b_t_matching = true
istr_dwo_related[1].s_relatedtext_column = 'doc_code'					
istr_dwo_related[1].s_text = 'Phiếu nhập kho của : '

istr_dwo_related[1].s_match_f_dwo[1] = 'd_inventory_line_receipt_grid'
istr_dwo_related[1].s_match_t_dwo[1] = 'd_sal_invoice_line_grid'
istr_dwo_related[1].s_match_f_column[1] = 'qty'
istr_dwo_related[1].s_match_t_column[1] = 'act_qty'
istr_dwo_related[1].s_match_column[1] = 'qty'

istr_dwo_related[2].s_related_obj_name = 'u_bank_voucher_payment'					// đối tượng liên quan
istr_dwo_related[2].s_main_obj_dwo = 'd_document_ar_grid'		//datawindow quan hệ main
istr_dwo_related[2].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[2].s_related_obj_dwo = 'd_document_ap_grid'	// datawindow quan hệ đến
istr_dwo_related[2].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[2].b_f_matching = true
istr_dwo_related[2].s_relatedtext_column = 'doc_code'					
istr_dwo_related[2].s_text = 'Sổ phụ ngân hàng từ:'

istr_dwo_related[2].s_main_obj_dwo_copy[1] = 'd_post_line_invoice_grid' // datawindow copy từ
istr_dwo_related[2].s_main_dr_cr_obj_dwo_sum[1]='d_invoice_sal_form'
istr_dwo_related[2].s_main_dr_cr_obj_column_sum[1]='dr_cr_object'
istr_dwo_related[2].s_main_obj_column_sum[1]= 'trans_amt;base_amt' 
istr_dwo_related[2].s_main_obj_column_copy[1] = 'trans_amt;base_amt' // cột copy từ
istr_dwo_related[2].s_related_obj_dwo_copy[1] = 'd_payment_line_grid' // datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[1] = 'amount;base_amount'  // cột copy đến
istr_dwo_related[2].s_main_obj_column_chk[1] = ''
istr_dwo_related[2].s_related_obj_column_chk[1] = ''
istr_dwo_related[2].b_copy_line[1] = true
istr_dwo_related[2].b_f_sum[1] = true
istr_dwo_related[2].s_main_obj_column_sum[1] = 'trans_amt;base_amt'
istr_dwo_related[2].s_match_f_dwo[1] = 'd_post_line_invoice_grid'
istr_dwo_related[2].s_match_t_dwo[1] = 'd_payment_line_grid'
istr_dwo_related[2].s_match_f_column[1] =  'trans_amt;base_amt'
istr_dwo_related[2].s_match_t_column[1] = 'amount;base_amount'
istr_dwo_related[2].s_match_column[1] = 'trans_value;base_value'

istr_dwo_related[2].s_main_obj_dwo_copy[2] = 'd_invoice_sal_form' // datawindow copy từ
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

istr_dwo_related[2].s_main_obj_dwo_copy[4] = 'd_invoice_sal_form' // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[4] ='dr_cr_object;dr_cr_object_type;dr_cr_object_code;dr_cr_object_name' // cột copy từ
istr_dwo_related[2].s_related_obj_dwo_copy[4] = 'd_payment_line_grid' // datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[4] = 'object_id;object_type;object_code;object_name'  // cột copy đến
istr_dwo_related[2].s_main_obj_column_chk[4] = ''
istr_dwo_related[2].s_related_obj_column_chk[4] = ''
istr_dwo_related[2].s_match_f_dwo[4] = ''
istr_dwo_related[2].s_match_t_dwo[4] = ''
istr_dwo_related[2].s_f_obj_column_chk[4]=''
istr_dwo_related[2].s_t_obj_column_chk[4]=''
istr_dwo_related[2].s_main_obj_column_sum[4] = ''
istr_dwo_related[2].s_related_obj_column_sum[4] = ''
istr_dwo_related[2].b_f_sum[4] = false
istr_dwo_related[2].b_copy_line[4] = false

istr_dwo_related[3].s_related_obj_name = 'u_payment'					// đối tượng liên quan
istr_dwo_related[3].s_main_obj_dwo = 'd_document_ar_grid'		//datawindow quan hệ main
istr_dwo_related[3].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[3].s_related_obj_dwo = 'd_document_ap_grid'	// datawindow quan hệ đến
istr_dwo_related[3].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[3].b_f_matching = true
istr_dwo_related[3].s_relatedtext_column = 'doc_code'					
istr_dwo_related[3].s_text = 'Phiếu chi từ:'

istr_dwo_related[3].s_main_obj_dwo_copy[1] = 'd_post_line_invoice_grid' // datawindow copy từ
istr_dwo_related[3].s_related_obj_dwo_copy[1] = 'd_payment_line_grid' // datawindow copy đến
istr_dwo_related[3].s_main_obj_column_copy[1] ='CR_OBJECT_ID;trans_amt;base_amt'  // cột copy từ
istr_dwo_related[3].s_related_obj_column_copy[1] = 'OBJECT_ID;amount;base_amount'  // cột copy đến
istr_dwo_related[3].s_main_dr_cr_obj_dwo_sum[1]='d_invoice_sal_form'
istr_dwo_related[3].s_main_dr_cr_obj_column_sum[1]='dr_cr_object'
istr_dwo_related[3].s_main_obj_column_sum[1] = 'trans_amt;base_amt'
istr_dwo_related[3].s_f_obj_column_chk[1] = 'CR_OBJECT_ID'
istr_dwo_related[3].s_t_obj_column_chk[1] = 'OBJECT_ID'
istr_dwo_related[3].s_main_obj_column_chk[1] = ''
istr_dwo_related[3].s_related_obj_column_chk[1] = ''
istr_dwo_related[3].b_f_sum[1] = true
istr_dwo_related[3].b_copy_line[1] = true
istr_dwo_related[3].s_match_f_dwo[1] = 'd_post_line_invoice_grid'
istr_dwo_related[3].s_match_t_dwo[1] = 'd_payment_line_grid'
istr_dwo_related[3].s_match_f_column[1] =  'trans_amt;base_amt'
istr_dwo_related[3].s_match_t_column[1] = 'amount;base_amount'
istr_dwo_related[3].s_match_column[1] = 'trans_value;base_value'

istr_dwo_related[3].s_main_obj_dwo_copy[2] = 'd_post_line_tax_grid'
istr_dwo_related[3].s_related_obj_dwo_copy[2] = 'd_payment_line_grid'
istr_dwo_related[3].s_main_obj_column_copy[2] ='CR_OBJECT_ID;trans_amt;base_amt'
istr_dwo_related[3].s_related_obj_column_copy[2] = 'OBJECT_ID;amount;base_amount'
istr_dwo_related[3].s_main_dr_cr_obj_dwo_sum[2]='d_invoice_sal_form'
istr_dwo_related[3].s_main_dr_cr_obj_column_sum[2]='dr_cr_object'
istr_dwo_related[3].s_main_obj_column_sum[2] = 'trans_amt;base_amt'
istr_dwo_related[3].s_f_obj_column_chk[2] = 'CR_OBJECT_ID'
istr_dwo_related[3].s_t_obj_column_chk[2] = 'OBJECT_ID'
istr_dwo_related[3].s_main_obj_column_chk[2] = ''
istr_dwo_related[3].s_related_obj_column_chk[2] = ''
istr_dwo_related[3].b_f_sum[2] = true
istr_dwo_related[3].b_copy_line[2] = true
istr_dwo_related[3].s_match_f_dwo[2] = 'd_post_line_tax_grid'
istr_dwo_related[3].s_match_t_dwo[2] = 'd_payment_line_grid'
istr_dwo_related[3].s_match_f_column[2] = 'trans_amt;base_amt'
istr_dwo_related[3].s_match_t_column[2] = 'amount;base_amount'
istr_dwo_related[3].s_match_column[2] = 'trans_value;base_value'

istr_dwo_related[3].s_main_obj_dwo_copy[3] = 'd_invoice_sal_form' // datawindow copy từ
istr_dwo_related[3].s_main_obj_column_copy[3] ='dr_cr_object;dr_cr_object_type;dr_cr_object_code;dr_cr_object_name' // cột copy từ
istr_dwo_related[3].s_related_obj_dwo_copy[3] = 'd_payment_line_grid' // datawindow copy đến
istr_dwo_related[3].s_related_obj_column_copy[3] = 'object_id;object_type;object_code;object_name'  // cột copy đến
istr_dwo_related[3].s_main_obj_column_chk[3] = 'dr_cr_object'
istr_dwo_related[3].s_related_obj_column_chk[3] = 'OBJECT_ID'
istr_dwo_related[3].b_copy_line[3] = true
/////// doan nay dung de cap nhat bang match khi update va xoa chagre line(phan bo phi)
istr_dwo_related[3].s_match_f_dwo[3] = 'd_payment_line_grid'
istr_dwo_related[3].s_match_t_dwo[3] = 'd_charge_line_grid'
istr_dwo_related[3].s_match_f_column[3] = 'amount;base_amount;'
istr_dwo_related[3].s_match_t_column[3] = 'CHARGE_AMT;CHARGE_BASE_AMT;'
istr_dwo_related[3].s_match_column[3] = 'trans_value;base_value;'
//////////////////////////////////////////////////////////////////////////////
istr_dwo_related[3].s_main_obj_dwo_copy[4] = 'd_invoice_sal_form' // datawindow copy từ
istr_dwo_related[3].s_main_obj_column_copy[4] ='currency_id;uom_code;exchange_rate;dr_cr_object' // cột copy từ
istr_dwo_related[3].s_related_obj_dwo_copy[4] = 'd_payment_form' // datawindow copy đến
istr_dwo_related[3].s_related_obj_column_copy[4] = 'currency_id;uom_code;exchange_rate;invoice_object'  // cột copy đến
istr_dwo_related[3].s_f_obj_column_chk[4] = ''
istr_dwo_related[3].s_t_obj_column_chk[4] = ''
istr_dwo_related[3].s_main_obj_column_chk[4] = ''
istr_dwo_related[3].s_related_obj_column_chk[4] = ''
istr_dwo_related[3].s_match_f_dwo[4] = ''
istr_dwo_related[3].s_match_t_dwo[4] = ''
istr_dwo_related[3].s_match_f_column[4] = ''
istr_dwo_related[3].s_match_t_column[4] = ''
istr_dwo_related[3].s_main_obj_column_sum[4] = ''
istr_dwo_related[3].s_related_obj_column_sum[4] = ''
istr_dwo_related[3].s_match_column[4] = ''
istr_dwo_related[3].s_f_obj_column_chk[4] = ''
istr_dwo_related[3].s_t_obj_column_chk[4] = ''
istr_dwo_related[3].b_copy_line[4] = false
istr_dwo_related[3].b_f_sum[4] = false
istr_dwo_related[3].b_copy_line[4] = false

istr_dwo_related[4].s_related_obj_name = 'u_so_return'					// đối tượng copy đến
istr_dwo_related[4].s_main_obj_dwo = 	'd_document_ar_grid'	//datawindow quan hệ main
istr_dwo_related[4].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[4].s_related_obj_dwo =  'd_document_orders_grid'	// datawindow quan hệ đến
istr_dwo_related[4].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[4].b_t_matching = true
istr_dwo_related[4].s_relatedtext_column = 'doc_code'					
istr_dwo_related[4].s_text = 'Đề xuất trả hàng : '

istr_dwo_related[4].s_match_f_dwo[1] = 'd_so_line_grid'
istr_dwo_related[4].s_match_t_dwo[1] = 'd_sal_invoice_line_grid'
istr_dwo_related[4].s_match_f_column[1] = 'qty'
istr_dwo_related[4].s_match_t_column[1] = 'qty'
istr_dwo_related[4].s_match_column[1] = 'qty'

istr_dwo_related[5].s_related_obj_name = 'u_map_invoice'
istr_dwo_related[5].s_main_obj_dwo = 'd_order_so_form'
istr_dwo_related[5].s_main_obj_column = 'bill_to_object'
istr_dwo_related[5].s_related_obj_dwo = 'd_address_map_form'
istr_dwo_related[5].s_related_obj_column = 'object_id'

istr_dwo_related[6].s_related_obj_name = 'u_map_delivery'
istr_dwo_related[6].s_main_obj_dwo = 'd_order_so_form'
istr_dwo_related[6].s_main_obj_column = 'object_id'
istr_dwo_related[6].s_related_obj_dwo = 'd_address_map_form'
istr_dwo_related[6].s_related_obj_column = 'object_id'

istr_dwo_related[7].s_related_obj_name = 'u_sal_invoice'					// đối tượng liên quan
istr_dwo_related[7].s_main_obj_dwo = 'd_document_ar_grid'		//datawindow quan hệ main
istr_dwo_related[7].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[7].s_related_obj_dwo = 'd_document_ar_grid'	// datawindow quan hệ đến
istr_dwo_related[7].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[7].b_t_matching = true
istr_dwo_related[7].s_relatedtext_column = 'doc_code'					
istr_dwo_related[7].s_text = 'Hóa đơn bán từ:'
istr_dwo_related[7].s_match_f_dwo[1] = 'd_sal_invoice_line_grid'
istr_dwo_related[7].s_match_t_dwo[1] = 'd_sal_invoice_line_grid'
istr_dwo_related[7].s_match_f_column[1] = 'act_qty'
istr_dwo_related[7].s_match_t_column[1] = 'act_qty'
istr_dwo_related[7].s_match_column[1] = 'qty'

istr_dwo_related[8].s_related_obj_name = 'b_view'					// đối tượng liên quan
istr_dwo_related[8].s_main_obj_dwo = 'd_document_ar_grid'		//datawindow quan hệ main
istr_dwo_related[8].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[8].s_related_obj_dwo = 'dv_accounting_form'	// datawindow quan hệ đến
istr_dwo_related[8].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[8].s_relatedtext_column = 'code'					
istr_dwo_related[8].s_text = 'Chứng từ kế toán '
end subroutine

public subroutine f_set_str_streamvalue ();istr_streamvalue[1].s_f_obj_dwo = 'd_invoice_sal_form'
istr_streamvalue[1].s_f_obj_column ='dr_cr_object'
istr_streamvalue[1].s_f_column_sv = 'F_OBJECT_ID'

istr_streamvalue[1].s_t_obj_dwo = 'd_sal_invoice_line_grid' 
istr_streamvalue[1].s_t_obj_column ='warehouse_id' 
istr_streamvalue[1].s_t_column_sv = 'T_OBJECT_ID'

istr_streamvalue[1].s_item_dwo = 'd_sal_invoice_line_grid'
istr_streamvalue[1].s_item_column = 'object_id;spec_id;act_qty;trans_uom;loc_id'
istr_streamvalue[1].s_item_column_sv = 'item_id;spec_id;qty;uom_id;loc_id'

istr_streamvalue[1].s_currency_dwo = 'd_invoice_sal_form'
istr_streamvalue[1].s_currency_column = 'currency_id;exchange_rate'
istr_streamvalue[1].s_currency_column_sv = 'trans_cur_id;exchange_rate'

istr_streamvalue[1].s_value_dwo = 'd_sal_invoice_line_grid'
istr_streamvalue[1].s_value_column = 'object_id;cogs;cogs;spec_id;act_qty_sku'
istr_streamvalue[1].s_value_column_sv = 'item_id;trans_value;base_value;spec_id;qty'
end subroutine

on c_sal_invoice_return.create
call super::create
end on

on c_sal_invoice_return.destroy
call super::destroy
end on

event constructor;call super::constructor;is_object_title = 'Hóa đơn KH trả hàng'
is_exrate_type = 'sell'
istr_actionpane[1].s_button_name = 'b_add_multi;b_join_multi;b_copyt_multi;b_insert;b_modify;b_save; b_saveclose;b_delete;b_cancel;b_total;b_post;b_unpost;b_account_view;b_copyt_payment;b_copyt_bank_voucher;b_send_2_approve;b_request_2_change;b_approve;b_reject;'
istr_actionpane[1].s_button_has_sub = 'b_add_multi;b_join_multi;b_copyt_multi;'
istr_actionpane[1].sa_sub_button[1]='b_add;b_copyf_goods_receipt;b_copyf_so_return;b_copyf_sal_invoice;'
istr_actionpane[1].sa_sub_button[2]='b_copyl_goods_receipt;b_copyl_so_return;b_copyl_sal_invoice;'
istr_actionpane[1].sa_sub_button[3]='b_copyt_payment;b_copyt_bank_voucher_payment;b_view_accounting;'
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_blank;b_copyt_multi;b_blank;b_post;b_account_view;b_blank;b_send_2_approve;b_blank;b_approve;b_reject;'																		   
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_blank;b_copyt_multi;b_blank;b_post;b_account_view;b_blank;b_send_2_approve;b_blank;b_approve;b_reject;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query; b_refresh;b_delete;b_total;b_blank;b_copyt_multi;b_blank;b_post;b_account_view;b_blank;b_send_2_approve;b_blank;b_approve;b_reject;'													   
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query; b_refresh;b_delete;b_total;b_blank;b_copyt_multi;b_blank;b_post;b_account_view;b_blank;b_send_2_approve;b_blank;b_approve;b_reject;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons= 'b_add_multi;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_blank;b_copyt_multi;b_blank;b_post;b_account_view;b_blank;b_send_2_approve;b_blank;b_approve;b_reject;'
																	          
					else
						istr_actionpane[li_idx].s_visible_buttons= 'b_add_multi;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_blank;b_copyt_multi;b_blank;b_post;b_account_view;b_blank;b_send_2_approve;b_blank;b_approve;b_reject;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =   'b_so_return;b_goods_receipt;b_sal_invoice;b_payment;b_bank_voucher_payment;'
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
	 rpo_dw.setitem(vl_currentrow,'doc_type','SAL_INVOICE_RETURN')
elseif  mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_invoice_sal' then
	rpo_dw.setitem(vl_currentrow,'doc_type','SAL_INVOICE_RETURN')
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
laa_value[1] = '=SAL_INVOICE_RETURN'
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

event e_window_e_preunpost;call super::e_window_e_preunpost;any				laa_data[]
long				ll_rtn
double			ldb_so_doc_id,ldb_t_doc_id
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
laa_data[2] = 'OBJECT_TRANS'
lds_matching.f_add_where( 't_doc_id;t_ref_table',laa_data[])
ll_rtn = lds_matching.retrieve( )
if ll_rtn > 0 then
	gf_messagebox('m.c_sal_invoice_return.e_window_e_preunpost.01','Thông báo','Phiếu: '+ lds_matching.getitemstring( 1, 't_doc_code') +' đã cấn trừ với phiếu: '+ lds_matching.getitemstring( 1, 'f_doc_code') +' nên không được sửa ghi sổ!' ,'stop','ok',1)
	destroy lds_matching
	return -1
end if
destroy lds_matching
//-- Cập nhật lại trạng thái cho ĐXBH --//
ldw_main = iw_display.f_get_dwmain( )
ldb_t_doc_id = ldw_main.getitemnumber( ldw_main.getrow( ) , 'id')
ldb_so_doc_id = this.f_get_so_doc_id( "SAL_INVOICE_LINE", ldb_t_doc_id)
if ldb_so_doc_id > 0 then
	update document set status = 'full_receive' where id = :ldb_so_doc_id using lt_transaction ;
	if lt_transaction.sqlcode <> 0 then
		gf_messagebox('m.c_sal_invoice_return.e_window_e_preunpost.02','Thông báo','Lỗi, Không cập nhật được trạng thái cho phiếu đề xuất trả hàng: @'+lt_transaction.sqlerrtext ,'stop','ok',1)
			rollback using  lt_transaction;
			return -1
	end if
	return 1
end if
return 0
end event

event e_window_e_post;call super::e_window_e_post;double			ldb_t_doc_id,ldb_so_doc_id
t_dw_mpl		ldw_main
t_transaction	lt_transaction

iw_display.f_get_transaction(lt_transaction)
ldw_main = iw_display.f_get_dwmain( )
ldb_t_doc_id = ldw_main.getitemnumber( ldw_main.getrow( ) , 'id')
ldb_so_doc_id = this.f_get_so_doc_id( "SAL_INVOICE_LINE", ldb_t_doc_id)
if ldb_so_doc_id > 0 then
	UPDATE DOCUMENT SET STATUS = 'invoiced' WHERE ID = :ldb_so_doc_id using lt_transaction;
	if lt_transaction.sqlcode <> 0 then
		gf_messagebox('m.c_sal_invoice_return.e_window_e_post.01','Thông báo','Lỗi, Không cập nhật được trạng thái cho phiếu đề xuất bán hàng: @'+lt_transaction.sqlerrtext ,'stop','ok',1)
		rollback using lt_transaction;
		return -1
	end if
	return 1
end if
return 0
end event

event e_window_e_prepost;call super::e_window_e_prepost;/*********************************************************************************************************
Chức năng: kiểm tra logic ghi sổ của hóa đơn
	- HĐ kết với phiếu nhập kho : chỉ được chọn ghi số giá trị ; ngày ghi sổ HĐ <= ngày ghi sổ phiếu nhập kho; phiếu nhập kho phải ghi sổ trước.
	- HĐ độc lập: không được phép chỉ chọn ghi sổ số lượng mà không chọn ghi sồ giá trị nhưng có thể ghi số giá trị mà không SL.
	- HĐ kết với hóa đơn bán: ngày nghi sổ của hóa đơn trả phải >= ngày ghi sổ của hóa đơn bán
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

=============================================================================================*/
int				li_cnt, li_idx, li_cnt2, li_idx2, li_cnt3, li_idx3, li_cnt4, li_idx4, li_cnt5, li_idx5
double		ladb_related_doc_id[], ldb_doc_id, ladb_related_doc_id2[], ladb_related_doc_id3[], ladb_related_doc_id4[], ladb_related_doc_id5[]
string			ls_doctype_related, ls_doc_code_related, ls_doctype, ls_doc_code, ls_status, ls_status_related, ls_qty_yn, ls_value_yn
date			ld_bookeddate_related, ld_bookeddate

t_dw_mpl			ldw_main
c_dwservice			lc_dwservice

ldw_main = this.iw_display.f_get_dwmain( )
ldb_doc_id = ldw_main.getitemnumber(ldw_main.getrow( ), 'id')
lc_dwservice.f_get_qty_and_value_yn(ldb_doc_id, ls_qty_yn, ls_value_yn)

li_cnt = this.f_get_f_doc_id(ldb_doc_id,ladb_related_doc_id[] )
if li_cnt >  0 then
	this.f_get_doc_info(ldb_doc_id, ls_doctype, ld_bookeddate, ls_status, ls_doc_code)
	FOR li_idx = 1 to li_cnt
		this.f_get_doc_info(ladb_related_doc_id[li_idx], ls_doctype_related, ld_bookeddate_related,ls_status_related, ls_doc_code_related)
		if ls_doctype_related = 'GOODS_RECEIPT' then
			if ls_qty_yn = 'Y' then
				gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.01','Thông báo','Hóa đơn kết với phiếu nhập kho không được chọn ghi sổ số lượng:@'+ls_doc_code_related,'exclamation','ok',1)
				return -1				
			end if
			if pos(ls_status_related+';','new;') > 0 then
				gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.02','Thông báo','Phiếu nhập kho của hóa đơn chưa ghi sổ:@'+ls_doc_code_related,'exclamation','ok',1)
				return -1
			end if
			if ld_bookeddate_related > ld_bookeddate then
				gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.03','Thông báo','Hóa đơn không được phép ghi sổ trước ngày nhập kho, phiếu nhập kho :@'+ls_doc_code_related+'@-ngày:'+ string(ld_bookeddate_related, gs_w_date_format ),'exclamation','ok',1)
				return -1
			end if
			//-- PNK trả hàng kết với phiếu nào --//
			li_cnt2 = this.f_get_f_doc_id(ladb_related_doc_id[li_idx],ladb_related_doc_id2[] )
			FOR li_idx2 =1 to li_cnt2
				this.f_get_doc_info(ladb_related_doc_id2[li_idx2], ls_doctype_related, ld_bookeddate_related,ls_status_related, ls_doc_code_related)
				if ls_doctype_related = 'SO_RETURN' then
					li_cnt3 = this.f_get_f_doc_id(ladb_related_doc_id2[li_idx2], ladb_related_doc_id3[])
					FOR li_idx3 =1 to li_cnt3
						this.f_get_doc_info(ladb_related_doc_id3[li_idx3], ls_doctype_related, ld_bookeddate_related,ls_status_related, ls_doc_code_related)
						if ls_doctype_related = 'SO' then
							li_cnt4 = this.f_get_t_doc_id(ladb_related_doc_id3[li_idx3],ladb_related_doc_id4[] )
							FOR li_idx4 =1 to li_cnt4
								this.f_get_doc_info(ladb_related_doc_id4[li_idx4], ls_doctype_related, ld_bookeddate_related,ls_status_related, ls_doc_code_related)
								if ls_doctype_related = 'GOODS_DELIVERY'  then
									li_cnt5 = this.f_get_t_doc_id(ladb_related_doc_id4[li_idx4],ladb_related_doc_id5[] )
									FOR li_idx5 =1 to li_cnt5
										this.f_get_doc_info(ladb_related_doc_id5[li_idx5], ls_doctype_related, ld_bookeddate_related,ls_status_related, ls_doc_code_related)
										if  ls_doctype_related = 'SAL_INVOICE' then
											lc_dwservice.f_get_qty_and_value_yn(ladb_related_doc_id5[li_idx5], ls_qty_yn, ls_value_yn)
											//-- kiểm tra--//
											if  ls_value_yn <> 'Y' then
												gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.01','Thông báo','Hóa đơn kết với hóa đơn bán phải chọn cả ghi sổ GT:@'+ls_doc_code_related,'exclamation','ok',1)
												return -1				
											end if
											if pos(ls_status_related+';','new;') > 0 then
												gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.02','Thông báo','Hóa đơn bán chưa ghi sổ:@'+ls_doc_code_related,'exclamation','ok',1)
												return -1
											end if
											if ld_bookeddate_related > ld_bookeddate then
												gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.03','Thông báo','Hóa đơn không được phép ghi sổ trước ngày hóa đơn bán, HĐ bán :@'+ls_doc_code_related+'@-ngày:'+ string(ld_bookeddate_related, gs_w_date_format ),'exclamation','ok',1)
												return -1
											end if																
										end if
									NEXT
								elseif  ls_doctype_related = 'SAL_INVOICE' then
									//-- kiểm tra--//
									lc_dwservice.f_get_qty_and_value_yn(ladb_related_doc_id4[li_idx4], ls_qty_yn, ls_value_yn)
									if ls_qty_yn <> 'Y' or ls_value_yn <> 'Y' then
										gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.01','Thông báo','Hóa đơn kết với hóa đơn bán phải chọn cả ghi sổ SL và GT:@'+ls_doc_code_related,'exclamation','ok',1)
										return -1				
									end if
									if pos(ls_status_related+';','new;') > 0 then
										gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.02','Thông báo','Hóa đơn bán chưa ghi sổ:@'+ls_doc_code_related,'exclamation','ok',1)
										return -1
									end if
									if ld_bookeddate_related > ld_bookeddate then
										gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.03','Thông báo','Hóa đơn không được phép ghi sổ trước ngày hóa đơn bán, HĐ bán :@'+ls_doc_code_related+'@-ngày:'+ string(ld_bookeddate_related, gs_w_date_format ),'exclamation','ok',1)
										return -1
									end if														
								end if
							NEXT
						elseif  ls_doctype_related = 'GOODS_DELIVERY' then
							li_cnt4 = this.f_get_t_doc_id(ladb_related_doc_id3[li_idx3],ladb_related_doc_id4[] )
							FOR li_idx4 =1 to li_cnt4
								this.f_get_doc_info(ladb_related_doc_id4[li_idx4], ls_doctype_related, ld_bookeddate_related,ls_status_related, ls_doc_code_related)
								if  ls_doctype_related = 'SAL_INVOICE' then
									//-- kiểm tra--//
									lc_dwservice.f_get_qty_and_value_yn(ladb_related_doc_id4[li_idx4], ls_qty_yn, ls_value_yn)
									if ls_qty_yn <> 'Y' or ls_value_yn <> 'Y' then
										gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.01','Thông báo','Hóa đơn kết với hóa đơn bán phải chọn cả ghi sổ SL và GT:@'+ls_doc_code_related,'exclamation','ok',1)
										return -1				
									end if
									if pos(ls_status_related+';','new;') > 0 then
										gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.02','Thông báo','Hóa đơn bán chưa ghi sổ:@'+ls_doc_code_related,'exclamation','ok',1)
										return -1
									end if
									if ld_bookeddate_related > ld_bookeddate then
										gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.03','Thông báo','Hóa đơn không được phép ghi sổ trước ngày hóa đơn bán, HĐ bán :@'+ls_doc_code_related+'@-ngày:'+ string(ld_bookeddate_related, gs_w_date_format ),'exclamation','ok',1)
										return -1
									end if														
								end if								
							NEXT
						elseif  ls_doctype_related = 'SAL_INVOICE' then
							//-- kiểm tra--//
							if ls_qty_yn <> 'Y' or ls_value_yn <> 'Y' then
								gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.01','Thông báo','Hóa đơn kết với hóa đơn bán phải chọn cả ghi sổ SL và GT:@'+ls_doc_code_related,'exclamation','ok',1)
								return -1				
							end if
							if pos(ls_status_related+';','new;') > 0 then
								gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.02','Thông báo','Hóa đơn bán chưa ghi sổ:@'+ls_doc_code_related,'exclamation','ok',1)
								return -1
							end if
							if ld_bookeddate_related < ld_bookeddate then
								gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.03','Thông báo','Hóa đơn không được phép ghi sổ trước ngày hóa đơn bán, HĐ bán :@'+ls_doc_code_related+'@-ngày:'+ string(ld_bookeddate_related, gs_w_date_format ),'exclamation','ok',1)
								return -1
							end if															
						end if
					NEXT //--//
				elseif  ls_doctype_related = 'GOODS_DELIVERY' then
					li_cnt3 = this.f_get_t_doc_id(ladb_related_doc_id2[li_idx2], ladb_related_doc_id3[])
					FOR li_idx3 =1 to li_cnt3
						this.f_get_doc_info(ladb_related_doc_id3[li_idx3], ls_doctype_related, ld_bookeddate_related,ls_status_related, ls_doc_code_related)
						if  ls_doctype_related = 'SAL_INVOICE' then
							//-- kiểm tra--//
							if ls_qty_yn <> 'Y' or ls_value_yn <> 'Y' then
								gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.01','Thông báo','Hóa đơn kết với hóa đơn bán phải chọn cả ghi sổ SL và GT:@'+ls_doc_code_related,'exclamation','ok',1)
								return -1				
							end if
							if pos(ls_status_related+';','new;') > 0 then
								gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.02','Thông báo','Hóa đơn bán chưa ghi sổ:@'+ls_doc_code_related,'exclamation','ok',1)
								return -1
							end if
							if ld_bookeddate_related < ld_bookeddate then
								gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.03','Thông báo','Hóa đơn không được phép ghi sổ trước ngày hóa đơn bán, HĐ bán :@'+ls_doc_code_related+'@-ngày:'+ string(ld_bookeddate_related, gs_w_date_format ),'exclamation','ok',1)
								return -1
							end if															
						end if						
					NEXT
				elseif  ls_doctype_related = 'SAL_INVOICE' then
					//-- kiểm tra--//
					if ls_qty_yn <> 'Y' or ls_value_yn <> 'Y' then
						gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.01','Thông báo','Hóa đơn kết với hóa đơn bán phải chọn cả ghi sổ SL và GT:@'+ls_doc_code_related,'exclamation','ok',1)
						return -1				
					end if
					if pos(ls_status_related+';','new;') > 0 then
						gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.02','Thông báo','Hóa đơn bán chưa ghi sổ:@'+ls_doc_code_related,'exclamation','ok',1)
						return -1
					end if
					if ld_bookeddate_related < ld_bookeddate then
						gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.03','Thông báo','Hóa đơn không được phép ghi sổ trước ngày hóa đơn bán, HĐ bán :@'+ls_doc_code_related+'@-ngày:'+ string(ld_bookeddate_related, gs_w_date_format ),'exclamation','ok',1)
						return -1
					end if								
				end if
			NEXT
		elseif ls_doctype_related = 'GOODS_DELIVERY' then		
			li_cnt2 = this.f_get_t_doc_id(ladb_related_doc_id2[li_idx2], ladb_related_doc_id2[])
			FOR li_idx2 =1 to li_cnt2
				this.f_get_doc_info(ladb_related_doc_id2[li_idx2], ls_doctype_related, ld_bookeddate_related,ls_status_related, ls_doc_code_related)
				if  ls_doctype_related = 'SAL_INVOICE' then
					//-- kiểm tra--//
					if ls_qty_yn <> 'Y' or ls_value_yn <> 'Y' then
						gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.01','Thông báo','Hóa đơn kết với hóa đơn bán phải chọn cả ghi sổ SL và GT:@'+ls_doc_code_related,'exclamation','ok',1)
						return -1				
					end if
					if pos(ls_status_related+';','new;') > 0 then
						gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.02','Thông báo','Hóa đơn bán chưa ghi sổ:@'+ls_doc_code_related,'exclamation','ok',1)
						return -1
					end if
					if ld_bookeddate_related < ld_bookeddate then
						gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.03','Thông báo','Hóa đơn không được phép ghi sổ trước ngày hóa đơn bán, HĐ bán :@'+ls_doc_code_related+'@-ngày:'+ string(ld_bookeddate_related, gs_w_date_format ),'exclamation','ok',1)
						return -1
					end if															
				end if						
			NEXT			
		elseif  ls_doctype_related = 'SAL_INVOICE' then			
			if ls_qty_yn <> 'Y' or ls_value_yn <> 'Y' then
				gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.01','Thông báo','Hóa đơn kết với hóa đơn bán phải chọn cả ghi sổ SL và GT:@'+ls_doc_code_related,'exclamation','ok',1)
				return -1				
			end if
			if pos(ls_status_related+';','new;') > 0 then
				gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.02','Thông báo','Hóa đơn bán chưa ghi sổ:@'+ls_doc_code_related,'exclamation','ok',1)
				return -1
			end if
			if ld_bookeddate_related < ld_bookeddate then
				gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.03','Thông báo','Hóa đơn không được phép ghi sổ trước ngày hóa đơn bán, HĐ bán :@'+ls_doc_code_related+'@-ngày:'+ string(ld_bookeddate_related, gs_w_date_format ),'exclamation','ok',1)
				return -1
			end if			
		end if
	NEXT
else 
	if ls_qty_yn = 'Y' and ls_value_yn = 'N' then
		gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.04','Thông báo','Hóa đơn không được phép ghi sổ số lượng mà không ghi sổ giá trị!' ,'exclamation','ok',1)
		return -1		
	end if
end if
return 0
end event

