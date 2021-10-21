$PBExportHeader$c_salary_advance.sru
forward
global type c_salary_advance from b_doc
end type
end forward

global type c_salary_advance from b_doc
end type
global c_salary_advance c_salary_advance

forward prototypes
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_str_unit ()
public subroutine f_set_dwo_related ()
public subroutine f_set_str_streamvalue ()
end prototypes

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name = '' 
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_document_sal_advance_grid'
istr_dwo[1].s_dwo_form = 'd_document_sal_advance_form'
istr_dwo[1].s_dwo_grid = 'd_document_sal_advance_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_sal_advance_form;' 
istr_dwo[1].b_ref_table_yn  = true
istr_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;doc_type;VERSION_ID;'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_gb_name = 'gb_6'
istr_dwo[1].s_description = 'Phiếu tạm ứng lương'

istr_dwo[2].s_dwo_default =  'd_sal_advance_form'
istr_dwo[2].s_dwo_form = 'd_sal_advance_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = true
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_details = 'd_payment_line_grid;'
istr_dwo[2].s_dwo_master = 'd_document_sal_advance_grid;'
istr_dwo[2].s_master_keycol = 'ID;'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[2].b_ref_table_yn  = true
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE;doc_type;id'
istr_dwo[2].b_relation_1_1 = true
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].b_focus_master = false
istr_dwo[2].s_description = 'Thông tin tạm ứng'
istr_dwo[2].s_gb_name = 'gb_7'


end subroutine

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '2d'
iastr_dwo_tabpage[1].i_upperpart_height  =2/3
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_payment_line_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = 'd_payment_line_form'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_payment_line_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_source = 'd_sal_advance_form'
iastr_dwo_tabpage[1].str_dwo[1].s_col_source = 'description'
iastr_dwo_tabpage[1].str_dwo[1].s_col_target = 'line_text'
iastr_dwo_tabpage[1].str_dwo[1].b_master = true
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_sal_advance_form;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = 'd_post_line_invoice_grid;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = ';'
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
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Chi tiết phiếu chi'

iastr_dwo_tabpage[1].str_dwo[2].s_dwo_default =  'd_post_line_invoice_grid'
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_grid = 'd_post_line_invoice_grid'
iastr_dwo_tabpage[1].str_dwo[2].b_master = false
iastr_dwo_tabpage[1].str_dwo[2].b_detail = true
iastr_dwo_tabpage[1].str_dwo[2].b_cascade_del = false
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_master = 'd_payment_line_grid;'
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_shared = ''
iastr_dwo_tabpage[1].str_dwo[2].s_master_keycol = 'ID;'
iastr_dwo_tabpage[1].str_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[1].str_dwo[2].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[1].str_dwo[2].b_insert = false
iastr_dwo_tabpage[1].str_dwo[2].b_update = true
iastr_dwo_tabpage[1].str_dwo[2].b_delete = true
iastr_dwo_tabpage[1].str_dwo[2].b_query = true
iastr_dwo_tabpage[1].str_dwo[2].b_print = true
iastr_dwo_tabpage[1].str_dwo[2].b_excel = true
iastr_dwo_tabpage[1].str_dwo[2].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[2].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[2].s_description ='Định khoản tạm ứng'
iastr_dwo_tabpage[1].i_index = 1


end subroutine

public subroutine f_set_str_unit ();
//--datawindow chứa các cột cần làm tròn--//
istr_unit[1].s_dwo_handing = ';;d_payment_line_grid;d_payment_line_grid;d_sal_advance_form;'
//--các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = ';;amount;base_amount;exchange_rate'
//--nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[1].s_dwo_unit = ';;d_sal_advance_form;d_sal_advance_form;d_sal_advance_form'
//--tên cột hứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = ';;uom_code;uom_code;exchange_rate'
//--loại làm tròn --//
istr_unit[1].s_type = ';;amount;bc;ex'
//--datawindow của cột chứa mã hàng--//
istr_unit[1].s_dwo_object = 'd_payment_line_grid'
//--cột chứa mã đơn vị--//
istr_unit[1].s_colname_object = 'object_code'
end subroutine

public subroutine f_set_dwo_related ();//
istr_dwo_related[1].s_related_obj_name = 'b_view'					// đối tượng liên quan
istr_dwo_related[1].s_main_obj_dwo = 'd_document_sal_advance_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'dv_payment_form'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].s_relatedtext_column = 'code'					
istr_dwo_related[1].s_text = 'In phiếu chi'

//istr_dwo_related[2].s_related_obj_name = 'u_pur_invoice'					// đối tượng liên quan
//istr_dwo_related[2].s_main_obj_dwo = 'd_document_ap_grid'		//datawindow quan hệ main
//istr_dwo_related[2].s_main_obj_column = 'id'			// cột quan hệ của main
//istr_dwo_related[2].s_related_obj_dwo = 'd_document_ap_grid'	// datawindow quan hệ đến
//istr_dwo_related[2].s_related_obj_column = 'id'			// cột quan hệ đến
//istr_dwo_related[2].b_t_matching = true
//istr_dwo_related[2].s_relatedtext_column = 'doc_code'					
//istr_dwo_related[2].s_text = 'Hóa đơn mua từ:'
//istr_dwo_related[2].b_f_sum[1] = true
//istr_dwo_related[2].s_main_obj_column_sum[1] = 'trans_amt;base_amt'
//istr_dwo_related[2].s_match_f_dwo[1] = 'd_post_line_invoice_grid'
//istr_dwo_related[2].s_match_t_dwo[1] = 'd_payment_line_grid'
//istr_dwo_related[2].s_match_f_column[1] = 'trans_amt;base_amt'
//istr_dwo_related[2].s_match_t_column[1] = 'amount;base_amount'
//istr_dwo_related[2].s_match_column[1] = 'trans_value;base_value'
//
//istr_dwo_related[3].s_related_obj_name = 'u_sal_invoice_return'					// đối tượng liên quan
//istr_dwo_related[3].s_main_obj_dwo = 'd_document_ap_grid'		//datawindow quan hệ main
//istr_dwo_related[3].s_main_obj_column = 'id'			// cột quan hệ của main
//istr_dwo_related[3].s_related_obj_dwo = 'd_document_ar_grid'	// datawindow quan hệ đến
//istr_dwo_related[3].s_related_obj_column = 'id'			// cột quan hệ đến
//istr_dwo_related[3].b_t_matching = true
//istr_dwo_related[3].s_relatedtext_column = 'doc_code'					
//istr_dwo_related[3].s_text = 'Hóa đơn trả hàng từ:'
//istr_dwo_related[3].b_f_sum[1] = true
//istr_dwo_related[3].s_main_obj_column_sum[1] = 'trans_amt;base_amt'
//istr_dwo_related[3].s_match_f_dwo[1] = 'd_post_line_invoice_grid'
//istr_dwo_related[3].s_match_t_dwo[1] = 'd_payment_line_grid'
//istr_dwo_related[3].s_match_f_column[1] =  'trans_amt;base_amt'
//istr_dwo_related[3].s_match_t_column[1] = 'amount;base_amount'
//istr_dwo_related[3].s_match_column[1] = 'trans_value;base_value'
//
//istr_dwo_related[4].s_related_obj_name = 'u_payment'					
//istr_dwo_related[4].s_main_obj_dwo = 	'd_document_ap_grid'	
//istr_dwo_related[4].s_main_obj_column = 'id'			
//istr_dwo_related[4].s_related_obj_dwo =  'd_document_ap_grid'	
//istr_dwo_related[4].s_related_obj_column = 'id'
//istr_dwo_related[4].b_f_matching = true
//istr_dwo_related[4].s_relatedtext_column = 'code'					
//istr_dwo_related[4].s_text = 'Nhân bản phiếu chi : '
//
//istr_dwo_related[4].s_main_obj_dwo_copy[1] = 'd_document_ap_grid' 
//istr_dwo_related[4].s_main_obj_column_copy[1] =  'ship_to_object_code;ship_to_object_name;group_name;doc_type;roster_yn;trans_hdr_id;trans_desc;'
//																		
//istr_dwo_related[4].s_related_obj_dwo_copy[1] = 'd_document_ap_grid' 
//istr_dwo_related[4].s_related_obj_column_copy[1] ='ship_to_object_code;ship_to_object_name;group_name;doc_type;roster_yn;trans_hdr_id;trans_desc;'
//istr_dwo_related[4].s_match_f_dwo[1] = 'd_document_ap_grid'
//istr_dwo_related[4].s_match_t_dwo[1] = 'd_document_ap_grid'		
//
//istr_dwo_related[4].s_main_obj_dwo_copy[2] = 'd_payment_form' 
//istr_dwo_related[4].s_main_obj_column_copy[2] = 'delivery_person;receipt_person;description;tax_desc;uom_code;currency_id;exchange_rate;object_code;object_name;DR_CR_OBJECT;allocation_yn;value_yn;quantity_yn;'
//istr_dwo_related[4].s_related_obj_dwo_copy[2] = 'd_payment_form' 
//istr_dwo_related[4].s_related_obj_column_copy[2]= 'delivery_person;receipt_person;description;tax_desc;uom_code;currency_id;exchange_rate;object_code;object_name;DR_CR_OBJECT;allocation_yn;value_yn;quantity_yn;'
//
//istr_dwo_related[4].s_main_obj_dwo_copy[3] = 'd_payment_line_grid' 
//istr_dwo_related[4].s_main_obj_column_copy[3] =  'object_type;object_code;object_name;object_id;line_text;amount;base_amount;not_accept;uom_code;qty;price;disc_pct;disc_amt;vat_pct;vat_amt;warehouse_code;WAREHOUSE_ID;TRANS_UOM;'
//istr_dwo_related[4].s_related_obj_dwo_copy[3] = 'd_payment_line_grid'
//istr_dwo_related[4].s_related_obj_column_copy[3] = 'object_type;object_code;object_name;object_id;line_text;amount;base_amount;not_accept;uom_code;qty;price;disc_pct;disc_amt;vat_pct;vat_amt;warehouse_code;WAREHOUSE_ID;TRANS_UOM;'
//istr_dwo_related[4].s_main_obj_column_chk[3] = ''
//istr_dwo_related[4].s_related_obj_column_chk[3] = ''
//istr_dwo_related[4].s_match_f_dwo[3] = ''
//istr_dwo_related[4].s_match_t_dwo[3] = ''
//istr_dwo_related[4].s_match_f_column[3] =''
//istr_dwo_related[4].s_match_t_column[3] =''
//istr_dwo_related[4].s_match_column[3] = ''
//istr_dwo_related[4].s_main_obj_column_sum[3] = ''
//istr_dwo_related[4].s_related_obj_column_sum[3] = ''
//istr_dwo_related[4].s_f_obj_column_chk[3] = ''
//istr_dwo_related[4].s_t_obj_column_chk[3] = ''
//istr_dwo_related[4].b_f_sum[3] = false
//
//istr_dwo_related[5].s_related_obj_name = 'u_receipt'					
//istr_dwo_related[5].s_main_obj_dwo = 	'd_document_ap_grid'	
//istr_dwo_related[5].s_main_obj_column = 'id'			
//istr_dwo_related[5].s_related_obj_dwo =  'd_document_ar_grid'	
//istr_dwo_related[5].s_related_obj_column = 'id'
//istr_dwo_related[5].b_f_matching = true
//istr_dwo_related[5].s_relatedtext_column = 'code'					
//istr_dwo_related[5].s_text = 'Phiều thu từ phiếu chi : '
//
//istr_dwo_related[5].s_main_obj_dwo_copy[1] = 'd_payment_line_grid' // datawindow copy từ
//istr_dwo_related[5].s_main_obj_column_copy[1] = 'object_type;object_id;object_code;object_name;line_text;amount;base_amount' // cột copy từ
//istr_dwo_related[5].s_related_obj_dwo_copy[1] = 'd_payment_line_grid' // datawindow copy đến
//istr_dwo_related[5].s_related_obj_column_copy[1] ='object_type;object_id;object_code;object_name;line_text;amount;base_amount' // cột copy đến
//istr_dwo_related[5].b_copy_line[1] = true
// khai báo cập nhật bản matching
//istr_dwo_related[5].s_match_f_dwo[1] = 'd_payment_line_grid'
//istr_dwo_related[5].s_match_t_dwo[1] = 'd_payment_line_grid' 
//istr_dwo_related[5].s_match_f_column[1] = 'amount;base_amount'
//istr_dwo_related[5].s_match_t_column[1] = 'amount;base_amount'
//istr_dwo_related[5].s_match_column[1] = 'TRANS_VALUE;BASE_VALUE'
//
//istr_dwo_related[5].s_main_obj_dwo_copy[2] = 'd_payment_form' // datawindow copy từ 
//istr_dwo_related[5].s_main_obj_column_copy[2] = 'currency_id;uom_code;exchange_rate;dr_cr_object;object_code;object_name;value_yn' // cột copy từ
//istr_dwo_related[5].s_related_obj_dwo_copy[2] = 'd_receipt_form' // datawindow copy đến
//istr_dwo_related[5].s_related_obj_column_copy[2] ='currency_id;uom_code;exchange_rate;dr_cr_object;object_code;object_name;value_yn' // cột copy đến
//istr_dwo_related[5].s_match_f_dwo[2] = ''
//istr_dwo_related[5].s_match_t_dwo[2] = '' 
//istr_dwo_related[5].s_match_f_column[2] = ''
//istr_dwo_related[5].s_match_t_column[2] = ''
//istr_dwo_related[5].s_match_column[2] = ''
//istr_dwo_related[5].s_main_obj_column_chk[2] = ''
//istr_dwo_related[5].s_related_obj_column_chk[2] = ''
//istr_dwo_related[5].s_f_obj_column_chk[2] = ''
//istr_dwo_related[5].s_t_obj_column_chk[2] = ''
//istr_dwo_related[5].s_main_obj_column_sum[2] = ''
//istr_dwo_related[5].s_related_obj_column_sum[2] = ''
//istr_dwo_related[5].b_f_sum[2] = false
end subroutine

public subroutine f_set_str_streamvalue ();//istr_streamvalue[1].s_f_obj_dwo =  'd_payment_form'
//istr_streamvalue[1].s_f_obj_column = 'DR_CR_OBJECT'
//istr_streamvalue[1].s_f_column_sv = 'F_OBJECT_ID'
//
//istr_streamvalue[1].s_t_obj_dwo = 'd_payment_line_grid'
//istr_streamvalue[1].s_t_obj_column = 'OBJECT_ID' 
//istr_streamvalue[1].s_t_column_sv = 'T_OBJECT_ID'
//
//istr_streamvalue[1].s_item_dwo = 'none'
//
//istr_streamvalue[1].s_currency_dwo = 'd_payment_form'
//istr_streamvalue[1].s_currency_column = 'currency_id;exchange_rate;trans_date'
//istr_streamvalue[1].s_currency_column_sv = 'trans_cur_id;exchange_rate;trans_date'
//
//istr_streamvalue[1].s_value_dwo = 'd_payment_line_grid'
//istr_streamvalue[1].s_value_column = 'object_id;amount;base_amount'
//istr_streamvalue[1].s_value_column_sv = 'item_id;trans_value;base_value'
end subroutine

on c_salary_advance.create
call super::create
end on

on c_salary_advance.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = true
is_display_model = '2dgb_1tp'
ib_display_text = false
if not this.idwsetup_initial.f_is_branch_yn( istr_dwo[1].s_dwo_default) then
	is_object_title = 'Phiếu chi tiền mặt tổng hợp'
else
	is_object_title = 'Phiếu ứng lương'
end if
is_exrate_type = 'sell'
istr_actionpane[1].s_button_name = 'b_add;b_insert;b_modify;b_saveclose;b_delete;b_cancel;b_view_payment;b_total;b_post;b_unpost;b_account_view;b_send_2_approve;b_request_2_change;b_approve;b_reject;'
//istr_actionpane[1].s_button_has_sub = 'b_add_multi;b_join_multi;'
//istr_actionpane[1].sa_sub_button[1]='b_add;b_copyf_pur_invoice;b_copyf_sal_invoice_return;b_copyf_receipt;b_copyt_seft;'
//istr_actionpane[1].sa_sub_button[2]='b_copyl_pur_invoice;b_copyl_sal_invoice_return;'
//istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_description = is_object_title
end event

event e_action_ctrl_bttn;t_dw_mpl				ldw_focus
int							li_idx

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
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_post;b_account_view;b_blank;b_view_payment;b_blank;b_send_2_approve;b_approve;b_reject;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_post;b_account_view;b_blank;b_view_payment;b_blank;b_send_2_approve;b_approve;b_reject;'
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_post;b_account_view;b_blank;b_view_payment;b_blank;b_send_2_approve;b_approve;b_reject;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_post;b_account_view;b_blank;b_view_payment;b_blank;b_send_2_approve;b_approve;b_reject;'
					end if
				end if
			else				
				if  ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons= 'b_add;b_modify;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_post;b_account_view;b_blank;b_view_payment;b_blank;b_send_2_approve;b_approve;b_reject;'
				else
					istr_actionpane[li_idx].s_visible_buttons= 'b_add;b_modify;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_post;b_account_view;b_blank;b_view_payment;b_blank;b_send_2_approve;b_approve;b_reject;'
				end if
			end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =  ''
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

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;string 				ls_code, ls_name,ls_obj_type
double				ldb_id
decimal				ldc_exc
long					ll_row,ll_line_no,ll_trans_hdr_id,ll_idx
t_dw_mpl 			ldw_add_row,ldw_main
c_unit_instance		lc_unit


if mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_payment_line'  then
	if vl_currentrow = 1 and  rpo_dw.rowcount()=0 then
		ll_line_no = vl_currentrow
	else
		ll_line_no = vl_currentrow
		for ll_idx = vl_currentrow + 1 to rpo_dw.rowcount()
			rpo_dw.setitem(ll_idx,'line_no',ll_idx)
		next
	end if
	rpo_dw.setitem(vl_currentrow,'line_no',ll_line_no)
	ldw_main = iw_display.dynamic f_get_dwmain()
	ll_trans_hdr_id = ldw_main.getitemnumber(ldw_main.getrow() , 'trans_hdr_id')
	select dr_obj_type into :ls_obj_type
	from trans_setup where object_ref_id = :ll_trans_hdr_id and rownum < 2 using sqlca;
	if sqlca.sqlcode <> 0 then 
		ls_obj_type = ''
	else
		rpo_dw.setitem(vl_currentrow,'object_type',ls_obj_type)
	end if
elseif mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_sal_advance' then
	rpo_dw.setitem(vl_currentrow,'doc_type','SALARY_ADVANCE')
	rpo_dw.setitem( vl_currentrow, 'VERSION_NO', 1)
	rpo_dw.setitem(vl_currentrow,'object_type','ACCOUNT')
	rpo_dw.setitem( vl_currentrow, 'trans_date', date(gd_session_date))	
//	 Set giá trị mặc định cho đồng tiền hạch toán
	lc_unit.f_get_base_cur( ldb_id, ls_code, ls_name)
	rpo_dw.setitem( vl_currentrow, 'CURRENCY_ID', ldb_id)
	rpo_dw.setitem( vl_currentrow, 'uom_code', ls_code)
	ldc_exc = this.f_get_exchange_rate( ls_code,today())
	rpo_dw.setitem( vl_currentrow, 'exchange_rate', ldc_exc)
end if
return vl_currentrow


end event

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.dynamic f_set_ii_fixedpart2_height(this.iw_display.ii_resize_height/2/3 )
iw_display.dynamic f_set_ii_upperpart_height(this.iw_display.ii_resize_height/2 )
return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;double			ldc_price,ldc_amount,ldc_disc_amt,ldc_disc_pct,ldc_exc,ldc_qty,ldc_tax
int					li_tax_percent,li_idx, ll_row
string				ls_include_tax_yn, ls_obj_type, ls_null
double 			ll_trans_hdr_id, ldb_null
t_dw_mpl		ldw_object

if AncestorReturnValue = 1 then return 1

if mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_sal_advance' then
	choose case vs_colname
		case 'uom_code','exchange_rate'
			if vs_colname = 'uom_code' then 
				ldc_exc = this.f_get_exchange_rate( vs_editdata,today())
				rpo_dw.setitem(vl_currentrow,'exchange_rate',ldc_exc)
			elseif vs_colname = 'exchange_rate' then 
				ldc_exc = dec(vs_editdata)
			else
				ldc_exc = rpo_dw.getitemnumber(vl_currentrow,'exchange_rate')
			end if
			ldw_object = iw_display.dynamic f_get_dw('d_payment_line_grid')
			for ll_row=1 to ldw_object.rowcount( )
				ldc_amount = ldw_object.getitemnumber( ll_row , 'amount')
				if not isnull(ldc_amount) then ldw_object.setitem(ll_row , 'base_amount',ldc_amount*ldc_exc)
			next	
	end choose
elseif mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_payment_line' then
	if vs_colname='amount' then
		ldw_object=iw_display.dynamic f_get_dw('d_sal_advance_form')
		ldc_exc=ldw_object.getitemnumber( ldw_object.getrow( ),'exchange_rate')
		ldc_amount = rpo_dw.getitemnumber( vl_currentrow , vs_colname)
		rpo_dw.setitem(vl_currentrow, 'base_amount',ldc_amount*ldc_exc)
	elseif vs_colname='object_type' then
		setnull(ls_null)
		setnull(ldb_null)
		rpo_dw.setitem(vl_currentrow, 'object_code',ls_null)
		rpo_dw.setitem(vl_currentrow, 'object_name',ls_null)	
		rpo_dw.setitem(vl_currentrow, 'object_id',ldb_null)	
	end if
elseif mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_document_sal_advance' then
	// Khi thay đổi ngày chứng từ thì ngày ghi sổ thay đổi theo
	if vs_colname = 'document_date' then
		ldw_object = iw_display.dynamic f_get_dw('d_sal_advance_form')
		ldw_object.setitem(ldw_object.getrow(),'trans_date',date(vs_editdata))
	end if
end if
return AncestorReturnValue

end event

