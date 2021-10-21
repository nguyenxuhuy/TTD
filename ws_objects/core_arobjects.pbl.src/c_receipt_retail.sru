$PBExportHeader$c_receipt_retail.sru
forward
global type c_receipt_retail from b_doc
end type
end forward

global type c_receipt_retail from b_doc
end type
global c_receipt_retail c_receipt_retail

type variables
t_ds_db			ids_barcode_search

end variables

forward prototypes
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_str_unit ()
public subroutine f_set_dwo_related ()
public subroutine f_set_str_streamvalue ()
public function integer f_reset_fixedpart_grid ()
public function integer f_resize_fixedpart_form ()
public function integer f_resize_fixedpart_grid ()
public function integer f_add_link_item (double vdb_item_id, double vdb_qty, t_dw_mpl rdw_payment_line)
public function integer f_delete_link_item (double vdb_item_id, double vdb_qty, t_dw_mpl rdw_payment_line)
public function integer f_add_barcode_item (string vs_barcode, ref t_dw_mpl rdw_retail_line)
public function integer f_delete_barcode_item (string vs_barcode, ref t_dw_mpl rdw_retail_line)
public function integer f_calc_line_amount_fields (string vs_editcol, string vs_editdata, long vl_row, ref t_dw_mpl rdw_line)
public function integer f_refresh_print_receipt ()
public function datawindow f_get_dw_print ()
public subroutine f_connect_device ()
public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[])
public function integer f_set_cus_info_fp (long vl_acctno, datetime vdt_att_datetime)
public function integer f_set_cus_info_pin (long vl_acctno, datetime vdt_att_datetime)
public function integer f_insert_loyalty_trans (double vdb_object_id, string vs_doctype, double vdb_doc_id)
public function integer f_change_receipt_print_dwo ()
public function integer f_pay_by_point (double vdb_cust_id, string vs_point_data, ref t_dw_mpl rdw_line)
public function integer f_calc_refund (double vdb_cust_id, string vs_amount_data, ref t_dw_mpl rdw_receipt)
end prototypes

public subroutine f_set_actionpane ();
//istr_actionpane[2].s_dwo_action = 'd_action_related_object'
//istr_actionpane[2].s_button_name =  'b_pur_invoice;b_sal_invoice_return;'
//istr_actionpane[2].s_objname_handling = this.classname( )
//istr_actionpane[2].s_description = 'Đối tượng liên quan'
//
istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_document_retail_form'
istr_dwo[1].s_dwo_form = 'd_document_retail_form'
istr_dwo[1].s_dwo_grid = ''
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_receipt_retail_form;dv_receipt_retail_form' 
istr_dwo[1].b_ref_table_yn  = true
istr_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;DOC_TYPE;VERSION_ID;'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_gb_name = 'gb_6'
istr_dwo[1].s_description = 'Phiếu bán lẻ'

istr_dwo[2].s_dwo_default =  'd_receipt_retail_form'
istr_dwo[2].s_dwo_form = 'd_receipt_retail_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = true
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_details = 'd_retail_line_grid;'
istr_dwo[2].s_dwo_master = 'd_document_retail_form;'
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
istr_dwo[2].b_focus_master = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_description = 'Thông tin phiếu bán lẻ'
istr_dwo[2].s_gb_name = 'gb_7'

istr_dwo[3].s_dwo_default =  'dv_receipt_retail_form' //dv_receipt_retail_form
istr_dwo[3].s_dwo_form = 'dv_receipt_retail_form'
istr_dwo[3].s_dwo_grid = ''
istr_dwo[3].b_master = false
istr_dwo[3].b_detail = false
istr_dwo[3].b_cascade_del = false
istr_dwo[3].s_dwo_details = ''
istr_dwo[3].s_dwo_master = ''
istr_dwo[3].s_master_keycol =  ';'
istr_dwo[3].s_detail_keycol =  ';'
istr_dwo[3].b_ref_table_yn  = false
istr_dwo[3].s_ref_table_field = ''
istr_dwo[3].b_insert = false
istr_dwo[3].b_update = false
istr_dwo[3].b_delete = false
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_excel = false
istr_dwo[3].b_traceable = false
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].b_focus_master = false

end subroutine

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
//iastr_dwo_tabpage[1].i_upperpart_height  =730
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_retail_line_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_retail_line_grid'
iastr_dwo_tabpage[1].str_dwo[1].b_master = true
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_receipt_retail_form;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = 'd_serial_line_grid;'
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
iastr_dwo_tabpage[1].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Chi tiết phiếu bán lẻ'
iastr_dwo_tabpage[1].i_index = 1

iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_display_model = '1d'
//iastr_dwo_tabpage[2].i_upperpart_height  =730
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_serial_line_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = 'd_serial_line_grid'
iastr_dwo_tabpage[2].str_dwo[1].b_master = false
iastr_dwo_tabpage[2].str_dwo[1].b_detail = true
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = false
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_retail_line_grid;'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[2].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[2].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[2].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[2].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[2].str_dwo[1].b_insert = false
iastr_dwo_tabpage[2].str_dwo[1].b_update = true
iastr_dwo_tabpage[2].str_dwo[1].b_delete = true
iastr_dwo_tabpage[2].str_dwo[1].b_query = true
iastr_dwo_tabpage[2].str_dwo[1].b_print = true
iastr_dwo_tabpage[2].str_dwo[1].b_excel = true
iastr_dwo_tabpage[2].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[2].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[2].str_dwo[1].s_description ='Số seri phiếu mua hàng'
iastr_dwo_tabpage[2].i_index = 2


end subroutine

public subroutine f_set_str_unit ();//--Datawindow chứa các cột cần làm tròn--//
istr_unit[1].s_dwo_handing = 'd_retail_line_grid;d_retail_line_grid;d_retail_line_grid;d_retail_line_grid;d_receipt_retail_form;'
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = 'qty;price;amount;base_amount;exchange_rate'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[1].s_dwo_unit = 'd_retail_line_grid;d_receipt_retail_form;d_receipt_retail_form;d_receipt_retail_form;d_receipt_retail_form'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = 'uom_code;uom_code;uom_code;uom_code;exchange_rate'
//--Loại làm tròn --//
istr_unit[1].s_type = 'item;price;amount;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[1].s_dwo_object = 'd_retail_line_grid'
//--Cột chứa mã đơn vị--//
istr_unit[1].s_colname_object = 'object_code'
end subroutine

public subroutine f_set_dwo_related ();
istr_dwo_related[1].s_related_obj_name = 'b_view'					// đối tượng liên quan
istr_dwo_related[1].s_main_obj_dwo = 'd_document_ar_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'dv_receipt_retail_form'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].s_relatedtext_column = 'code'					
istr_dwo_related[1].s_text = 'In phiếu bán lẻ'

istr_dwo_related[2].s_related_obj_name = 'u_sal_invoice'					// đối tượng liên quan
istr_dwo_related[2].s_main_obj_dwo = 'd_document_ar_grid'		//datawindow quan hệ main
istr_dwo_related[2].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[2].s_related_obj_dwo = 'd_document_ar_grid'	// datawindow quan hệ đến
istr_dwo_related[2].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[2].b_t_matching = true
istr_dwo_related[2].s_relatedtext_column = 'doc_code'					
istr_dwo_related[2].s_text = 'Hóa đơn bán từ:'
istr_dwo_related[2].b_f_sum[1] = true
istr_dwo_related[2].s_main_obj_column_sum[1] = 'trans_amt;base_amt'
istr_dwo_related[2].s_match_f_dwo[1] = 'd_post_line_invoice_grid'
istr_dwo_related[2].s_match_t_dwo[1] = 'd_payment_line_grid'
istr_dwo_related[2].s_match_f_column[1] ='trans_amt;base_amt'
istr_dwo_related[2].s_match_t_column[1] = 'amount;base_amount'
istr_dwo_related[2].s_match_column[1] = 'trans_value;base_value'


istr_dwo_related[3].s_related_obj_name = 'u_pur_invoice_return'					// đối tượng liên quan
istr_dwo_related[3].s_main_obj_dwo = 'd_document_ap_grid'		//datawindow quan hệ main
istr_dwo_related[3].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[3].s_related_obj_dwo = 'd_document_ar_grid'	// datawindow quan hệ đến
istr_dwo_related[3].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[3].b_t_matching = true
istr_dwo_related[3].s_relatedtext_column = 'doc_code'					
istr_dwo_related[3].s_text = 'Hóa đơn bán từ:'
istr_dwo_related[3].b_f_sum[1] = true
istr_dwo_related[3].s_main_obj_column_sum[1] = 'trans_amt;base_amt'
istr_dwo_related[3].s_match_f_dwo[1] = 'd_post_line_invoice_grid'
istr_dwo_related[3].s_match_t_dwo[1] = 'd_payment_line_grid'
istr_dwo_related[3].s_match_f_column[1] ='trans_amt;base_amt'
istr_dwo_related[3].s_match_t_column[1] = 'amount;base_amount'
istr_dwo_related[3].s_match_column[1] = 'trans_value;base_value'

istr_dwo_related[4].s_related_obj_name = 'u_receipt'					
istr_dwo_related[4].s_main_obj_dwo = 	'd_document_ar_grid'	
istr_dwo_related[4].s_main_obj_column = 'id'			
istr_dwo_related[4].s_related_obj_dwo =  'd_document_ar_grid'	
istr_dwo_related[4].s_related_obj_column = 'id'
istr_dwo_related[4].b_f_matching = true
istr_dwo_related[4].s_relatedtext_column = 'code'					
istr_dwo_related[4].s_text = 'Nhân bản phiếu thu : '

istr_dwo_related[4].s_main_obj_dwo_copy[1] = 'd_document_ar_grid' 
istr_dwo_related[4].s_main_obj_column_copy[1] =  'ship_to_object_code;ship_to_object_name;group_name;doc_type;roster_yn;'													
istr_dwo_related[4].s_related_obj_dwo_copy[1] = 'd_document_ar_grid' 
istr_dwo_related[4].s_related_obj_column_copy[1] ='ship_to_object_code;ship_to_object_name;group_name;doc_type;roster_yn;'
istr_dwo_related[4].s_match_f_dwo[1] = 'd_document_ar_grid'
istr_dwo_related[4].s_match_t_dwo[1] = 'd_document_ar_grid'		

istr_dwo_related[4].s_main_obj_dwo_copy[2] = 'd_receipt_form' 
istr_dwo_related[4].s_main_obj_column_copy[2] = 'delivery_person;receipt_person;description;uom_code;currency_id;exchange_rate;object_code;object_name;DR_CR_OBJECT;allocation_yn;'
istr_dwo_related[4].s_related_obj_dwo_copy[2] = 'd_receipt_form' 
istr_dwo_related[4].s_related_obj_column_copy[2]= 'delivery_person;receipt_person;description;uom_code;currency_id;exchange_rate;object_code;object_name;DR_CR_OBJECT;allocation_yn;'

istr_dwo_related[4].s_main_obj_dwo_copy[3] = 'd_payment_line_grid' 
istr_dwo_related[4].s_main_obj_column_copy[3] =  'object_type;object_code;object_name;object_id;line_text;amount;base_amount;not_accept;uom_code;qty;price;disc_pct;disc_amt;vat_pct;vat_amt;warehouse_code;WAREHOUSE_ID;TRANS_UOM;'
istr_dwo_related[4].s_related_obj_dwo_copy[3] = 'd_payment_line_grid'
istr_dwo_related[4].s_related_obj_column_copy[3] = 'object_type;object_code;object_name;object_id;line_text;amount;base_amount;not_accept;uom_code;qty;price;disc_pct;disc_amt;vat_pct;vat_amt;warehouse_code;WAREHOUSE_ID;TRANS_UOM;'
																		
istr_dwo_related[4].s_main_obj_column_chk[3] = ''
istr_dwo_related[4].s_related_obj_column_chk[3] = ''
istr_dwo_related[4].s_match_f_dwo[3] = ''
istr_dwo_related[4].s_match_t_dwo[3] = ''
istr_dwo_related[4].s_match_f_column[3] =''
istr_dwo_related[4].s_match_t_column[3] =''
istr_dwo_related[4].s_match_column[3] = ''
istr_dwo_related[4].s_main_obj_column_sum[3] = ''
istr_dwo_related[4].s_related_obj_column_sum[3] = ''
istr_dwo_related[4].s_f_obj_column_chk[3] = ''
istr_dwo_related[4].s_t_obj_column_chk[3] = ''
istr_dwo_related[4].b_f_sum[3] = false
end subroutine

public subroutine f_set_str_streamvalue ();istr_streamvalue[1].s_f_obj_dwo = 'd_retail_line_grid'
istr_streamvalue[1].s_f_obj_column = 'WAREHOUSE_ID'
istr_streamvalue[1].s_f_column_sv = 'F_OBJECT_ID'

istr_streamvalue[1].s_t_obj_dwo = 'd_receipt_retail_form'
istr_streamvalue[1].s_t_obj_column = 'DR_CR_OBJECT'
istr_streamvalue[1].s_t_column_sv = 'T_OBJECT_ID'

istr_streamvalue[1].s_item_dwo = 'd_retail_line_grid'
istr_streamvalue[1].s_item_column = 'object_id;spec_id;qty;trans_uom;loc_id'
istr_streamvalue[1].s_item_column_sv = 'item_id;spec_id;qty;uom_id;loc_id'

istr_streamvalue[1].s_currency_dwo = 'd_receipt_retail_form'
istr_streamvalue[1].s_currency_column = 'currency_id;exchange_rate;trans_date'
istr_streamvalue[1].s_currency_column_sv = 'trans_cur_id;exchange_rate;trans_date'

istr_streamvalue[1].s_value_dwo = 'd_retail_line_grid'
istr_streamvalue[1].s_value_column = 'OBJECT_ID;amount;base_amount;spec_id;qty_sku'
istr_streamvalue[1].s_value_column_sv = 'item_id;trans_value;base_value;spec_id;qty'

end subroutine

public function integer f_reset_fixedpart_grid ();
this.iw_display.dynamic f_reset_ii_fixedpart2_height_grid()
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_resize_fixedpart_form ();this.iw_display.dynamic f_reset_ii_fixedpart2_height_form()
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_resize_fixedpart_grid ();
this.iw_display.dynamic f_reset_ii_fixedpart2_height_grid(0)
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_add_link_item (double vdb_item_id, double vdb_qty, t_dw_mpl rdw_payment_line);double			ladb_lnk_item[], ladb_lnk_spec[], ladb_lnk_qty[], ldb_qty, ldb_stock_id
int					li_cnt, li_idx
string				ls_findstr, ls_obj_code, ls_obj_name, ls_uom_code
long				ll_row
b_obj_instantiate			lb_obj_inst
t_transaction				lt_transaction

//-- add link item --//
this.iw_display.f_get_transaction( lt_transaction)
li_cnt = lb_obj_inst.f_get_link_item( vdb_item_id,  ladb_lnk_item[], ladb_lnk_spec[], ladb_lnk_qty[], lt_transaction)

if li_cnt > 0 then
	FOR li_idx = 1 to li_cnt
		if isnull(ladb_lnk_spec[li_idx]) or ladb_lnk_spec[li_idx] = 0 then
			ls_findStr = "OBJECT_ID = "+string(ladb_lnk_item[li_idx])
		else
			ls_findStr = "OBJECT_ID = "+string(ladb_lnk_item[li_idx]) + " AND SPEC_ID ="+string(ladb_lnk_spec[li_idx])
		end if
		ll_row = rdw_payment_line.find( ls_findStr, 1, rdw_payment_line.rowcount( ) )	
		if ll_row > 0 then
			ldb_qty = rdw_payment_line.getitemnumber( ll_row, 'qty')
			if isnull(ldb_qty) then ldb_qty = 0
			rdw_payment_line.setitem( ll_row, 'qty', vdb_qty * ladb_lnk_qty[li_idx])			
		else
			select obj.code,obj.name, ite.stock_uom, uom.code
				into :ls_obj_code,:ls_obj_name, :ldb_stock_id, :ls_uom_code
			  from item ite 
					join uom on uom.id = ite.stock_uom
					join object obj on ite.object_ref_id=obj.id
			 where obj.id= :ladb_lnk_item[li_idx] using sqlca;		
			ll_row = rdw_payment_line.event e_addrow( )	
			rdw_payment_line.setitem( ll_row, 'object_id',  ladb_lnk_item[li_idx])
			rdw_payment_line.setitem( ll_row, 'object_code', ls_obj_code )
			rdw_payment_line.setitem( ll_row, 'object_name', ls_obj_name )
			rdw_payment_line.setitem( ll_row, 'line_text', 'KHUYỄN MÃI - '+ls_obj_name )
			rdw_payment_line.setitem( ll_row, 'uom_code', ls_uom_code )
			rdw_payment_line.setitem( ll_row, 'trans_uom', ldb_stock_id )
			rdw_payment_line.setitem( ll_row, 'spec_id', ladb_lnk_spec[li_idx] )
			rdw_payment_line.setitem( ll_row, 'qty', vdb_qty * ladb_lnk_qty[li_idx])				 
		end if
	NEXT
end if

return li_cnt
end function

public function integer f_delete_link_item (double vdb_item_id, double vdb_qty, t_dw_mpl rdw_payment_line);double			ladb_lnk_item[], ladb_lnk_spec[], ladb_lnk_qty[], ldb_stock_id,ldb_qty
int					li_cnt, li_idx
string				ls_findstr, ls_obj_code, ls_obj_name, ls_uom_code
long				ll_row
b_obj_instantiate			lb_obj_inst
t_transaction				lt_transaction


this.iw_display.f_get_transaction( lt_transaction)
li_cnt = lb_obj_inst.f_get_link_item( vdb_item_id,  ladb_lnk_item[], ladb_lnk_spec[], ladb_lnk_qty[], lt_transaction)

if li_cnt > 0 then
	FOR li_idx = 1 to li_cnt
		if isnull(ladb_lnk_spec[li_idx]) or ladb_lnk_spec[li_idx] = 0 then
			ls_findStr = "OBJECT_ID = "+string(ladb_lnk_item[li_idx])
		else
			ls_findStr = "OBJECT_ID = "+string(ladb_lnk_item[li_idx]) + " AND SPECT_ID ="+string(ladb_lnk_spec[li_idx])
		end if
		ll_row = rdw_payment_line.find( ls_findStr, 1, rdw_payment_line.rowcount( ) )	
		if ll_row > 0 then

			ldb_qty = rdw_payment_line.getitemnumber(ll_row,'qty')
			if ldb_qty >  ladb_lnk_qty[li_idx] and vdb_qty > 0 then
				rdw_payment_line.setitem(ll_row,'qty',vdb_qty * ladb_lnk_qty[li_idx])
			else
				rdw_payment_line.deleterow(ll_row)	
				ll_row = 0
			end if
		end if
	NEXT
end if

return li_cnt
end function

public function integer f_add_barcode_item (string vs_barcode, ref t_dw_mpl rdw_retail_line);double		ldb_object_id, ldb_stock_id, ldb_spec_id, ldb_qty, ladb_lnk_item[], ladb_lnk_spec[], ladb_lnk_qty[], ldb_qty_scan
string			ls_obj_code, ls_obj_name, ls_uom_code, ls_findStr, lsa_ref_table_field[], ls_coltype
double		ldb_point, ldb_cust_id, ldb_amount
long			ll_row, ll_found, ll_CARDNUMBER
int					li_idx, li_rtn
any				laa_empty[]
t_dw_mpl 			ldw_handle, ldw_receipt_hdr
c_string				lc_string
t_transaction		lt_transaction
b_obj_instantiate	lbo_instance

this.iw_display.f_get_transaction( lt_transaction)
ldw_receipt_hdr = this.iw_display.f_get_dw( 'd_receipt_retail_form')
ldb_qty_scan = ldw_receipt_hdr.getitemnumber(ldw_receipt_hdr.getrow( ) , 'scan_qty')
if isnull(ldb_qty_scan) or ldb_qty_scan = 0 then ldb_qty_scan = 1

ll_found = ids_barcode_search.find( "barcode ='"+vs_barcode+"'" , 1, ids_barcode_search.rowcount( ) )
if ll_found = 0 then
	//-- kiểm tra thẻ mua hàng --//
	gf_messagebox('m.c_receipt_retail.f_add_barcode_item.01','Thông báo','Không tìm thấy mã hàng có barcode:@'+vs_barcode,'exclamation','ok',1)
	return -1
end if
ldb_object_id = ids_barcode_search.getitemnumber(ll_found, 'ID') 
ldb_spec_id = ids_barcode_search.getitemnumber(ll_found, 'SPEC_ID') 

//rdw_retail_line = iw_display.f_get_dw('d_retail_line_grid')
if isnull(ldb_spec_id) or ldb_spec_id = 0 then
	ls_findStr = "OBJECT_ID = "+string(ldb_object_id)
else
	ls_findStr = "OBJECT_ID = "+string(ldb_object_id) + " AND SPEC_ID ="+string(ldb_spec_id)
end if
ll_row = rdw_retail_line.find( ls_findStr, 1, rdw_retail_line.rowcount( ) )

if ll_row > 0 then
	ldb_qty = rdw_retail_line.getitemnumber( ll_row, 'qty')
	if isnull(ldb_qty) then ldb_qty = 0
	ldb_qty = ldb_qty + ldb_qty_scan
	rdw_retail_line.setitem( ll_row, 'qty', ldb_qty)
else
	ll_row = rdw_retail_line.event e_addrow( )
	ldb_qty = ldb_qty_scan
	rdw_retail_line.setitem( ll_row, 'object_id', ldb_object_id )
	rdw_retail_line.setitem( ll_row, 'object_code', ids_barcode_search.getitemstring(ll_found, 'code')  )
	rdw_retail_line.setitem( ll_row, 'object_name',  ids_barcode_search.getitemstring(ll_found, 'name') )
	rdw_retail_line.setitem( ll_row, 'line_text',  ids_barcode_search.getitemstring(ll_found, 'name') )
	rdw_retail_line.setitem( ll_row, 'uom_code',  ids_barcode_search.getitemstring(ll_found, 'uom_code') )
	rdw_retail_line.setitem( ll_row, 'trans_uom', ids_barcode_search.getitemnumber(ll_found, 'stock_uom') )
	rdw_retail_line.setitem( ll_row, 'spec_id', ldb_spec_id )
	rdw_retail_line.setitem( ll_row, 'qty', ldb_qty)
end if

if this.f_calc_line_amount_fields( 'qty', string(ldb_qty), ll_row, rdw_retail_line) = -1 then
	rollback using lt_transaction;
	rdw_retail_line.event e_retrieve()	
	return -1
end if
//-- add link item --// 
if this.f_add_link_item( ldb_object_id ,ldb_qty, rdw_retail_line) = -1 then return -1

//-- kiểm tra dw master đã lưu chưa --//
ldw_handle = this.iw_display.f_get_dwmain( )
if ldw_handle.getitemstatus(ldw_handle.getrow( ) ,0, primary!) = NewModified! then

	//-- cấp nhật object_ref_table lên master --//
	if ldw_handle.f_set_ref_data()= -1 then return -1
	li_rtn = lc_string.f_stringtoarray( ldw_handle.is_ref_table_field, ';', lsa_ref_table_field[])
	FOR li_idx = 1 to li_rtn
		ls_coltype = ldw_handle.describe( lsa_ref_table_field[li_idx] + '.coltype')
		if left(ls_coltype,5) = 'char(' then ldw_handle.a_ref_data[li_idx] = upper(ldw_handle.a_ref_data[li_idx])
		ldw_handle.setitem( ldw_handle.getrow( ) , lsa_ref_table_field[li_idx], ldw_handle.a_ref_data[li_idx])
	NEXT	
	ldw_handle.a_ref_data[] = laa_empty[]

	if ldw_handle.update(true,false ) = -1 then
		gf_messagebox('m.c_receipt_retail.f_add_barcode_item.02','Thông báo','Lỗi:@ '+lt_transaction.sqlerrtext,'exclamation','ok',1)
		rollback using lt_transaction;
		return -1			
	end if
	ldw_handle.resetupdate()

	if ldw_receipt_hdr.update(true,false ) = -1 then
		gf_messagebox('m.c_receipt_retail.f_add_barcode_item.02','Thông báo','Lỗi:@ '+lt_transaction.sqlerrtext,'exclamation','ok',1)
		rollback using lt_transaction;
		return -1			
	end if
	ldw_receipt_hdr.resetupdate()	
end if

//-- tính điểm --//
//ll_CARDNUMBER = ldw_receipt_hdr.getitemnumber( ldw_receipt_hdr.getrow(), 'cardnumber')
//if not isnull(ll_CARDNUMBER) and ll_CARDNUMBER > 0 then
//	ldb_amount = double(rdw_retail_line.Describe( "Evaluate('sum(AMT_AFTR_DISC)', 0)"))
//	ldb_cust_id = ldw_receipt_hdr.getitemnumber(ldw_receipt_hdr.getrow(), 'invoice_object')				
//	ldb_point = lbo_instance.f_get_bonus_point( 'CUSTOMER', ldb_cust_id, 'RECEIPT_RETAIL', ldb_amount)
//	ldw_receipt_hdr.setitem(ldw_receipt_hdr.getrow(),'rt_bonus_point', ldb_point)
//	if ldw_receipt_hdr.update(true,false ) = -1 then
//		gf_messagebox('m.c_receipt_retail.f_add_barcode_item.02','Thông báo','Lỗi:@ '+lt_transaction.sqlerrtext,'exclamation','ok',1)
//		rollback using lt_transaction;
//		return -1			
//	end if
//	ldw_receipt_hdr.resetupdate()		
//end if

	
if rdw_retail_line.update(true, false) = -1 then	
	gf_messagebox('m.c_receipt_retail.f_add_barcode_item.02','Thông báo','Lỗi:@ '+lt_transaction.sqlerrtext,'exclamation','ok',1)
	rollback using lt_transaction;
	rdw_retail_line.event e_retrieve()
	return -1	
end if
commit using lt_transaction;
rdw_retail_line.resetupdate()
rdw_retail_line.scrolltorow(ll_row)

return ll_row
end function

public function integer f_delete_barcode_item (string vs_barcode, ref t_dw_mpl rdw_retail_line);double		ldb_object_id, ldb_stock_id, ldb_spec_id, ldb_qty, ladb_lnk_item[], ladb_lnk_spec[], ladb_lnk_qty[], ldb_qty_scan
string			ls_obj_code, ls_obj_name, ls_uom_code, ls_findStr
double		ldb_amount, ldb_cust_id, ldb_point
long			ll_row, ll_found, ll_CARDNUMBER
t_transaction		lt_transaction
t_dw_mpl			ldw_handle, ldw_receipt_hdr
b_obj_instantiate	lbo_instance

this.iw_display.f_get_transaction( lt_transaction)
ldw_receipt_hdr = this.iw_display.f_get_dw( 'd_receipt_retail_form')
ldb_qty_scan = ldw_receipt_hdr.getitemnumber(ldw_receipt_hdr.getrow( ) , 'scan_qty')
if isnull(ldb_qty_scan) or ldb_qty_scan = 0 then ldb_qty_scan =1

ll_found = ids_barcode_search.find( "barcode ='"+vs_barcode+"'" , 1, ids_barcode_search.rowcount( ) )
if ll_found = 0 then
	gf_messagebox('m.c_receipt_retail.f_delete_barcode_item.01','Thông báo','Không tìm thấy mã hàng có barcode:@'+vs_barcode,'exclamation','ok',1)
	return -1
end if
ldb_object_id = ids_barcode_search.getitemnumber(ll_found, 'ID') 
ldb_spec_id = ids_barcode_search.getitemnumber(ll_found, 'SPEC_ID') 


if isnull(ldb_spec_id) or ldb_spec_id = 0 then
	ls_findStr = "OBJECT_ID = "+string(ldb_object_id)
else
	ls_findStr = "OBJECT_ID = "+string(ldb_object_id) + " AND SPECT_ID ="+string(ldb_spec_id)
end if
ll_row = rdw_retail_line.find( ls_findStr, 1, rdw_retail_line.rowcount( ) )
if ll_row > 0 then
	ldb_qty = rdw_retail_line.getitemnumber(ll_row,'qty')
	if ldb_qty > 1 then
		ldb_qty = ldb_qty - ldb_qty_scan
		rdw_retail_line.setitem(ll_row,'qty',ldb_qty)
	else
		rdw_retail_line.deleterow( ll_row)
		ll_row = 0
	end if
else
	gf_messagebox('m.c_receipt_retail.f_delete_barcode_item.01','Thông báo','Không có mã hàng này trong chi tiết phiếu:@'+vs_barcode,'exclamation','ok',1)
	return -1
end if

if ll_row > 0 then
	if this.f_calc_line_amount_fields( 'qty',string(ldb_qty), ll_row, rdw_retail_line) = -1 then
		rollback using lt_transaction;
		rdw_retail_line.event e_retrieve()	
		return -1
	end if
end if

//-- delete link item --// 
if this.f_delete_link_item( ldb_object_id, ldb_qty, rdw_retail_line) = -1 then
	rdw_retail_line.event e_retrieve()
	return -1
end if


if rdw_retail_line.update(true, false) = -1 then	
	gf_messagebox('m.c_receipt_retail.f_add_barcode_item.03','Thông báo','Lỗi:@ '+lt_transaction.sqlerrtext,'exclamation','ok',1)
	rollback using lt_transaction;
	rdw_retail_line.event e_retrieve()
	return -1	
end if

//-- tính điểm --//
//ll_CARDNUMBER = ldw_receipt_hdr.getitemnumber( ldw_receipt_hdr.getrow(), 'cardnumber')
//if not isnull(ll_CARDNUMBER) and ll_CARDNUMBER > 0 then
//	ldb_amount = double(rdw_retail_line.Describe( "Evaluate('sum(AMT_AFTR_DISC)', 0)"))
//	ldb_cust_id = ldw_receipt_hdr.getitemnumber(ldw_receipt_hdr.getrow(), 'invoice_object')				
//	ldb_point = lbo_instance.f_get_bonus_point( 'CUSTOMER', ldb_cust_id, 'RECEIPT_RETAIL', ldb_amount)
//	ldw_receipt_hdr.setitem(ldw_receipt_hdr.getrow(),'rt_bonus_point', ldb_point)
//end if
//if ldw_receipt_hdr.update(true,false ) = -1 then
//	gf_messagebox('m.c_receipt_retail.f_add_barcode_item.02','Thông báo','Lỗi:@ '+lt_transaction.sqlerrtext,'exclamation','ok',1)
//	rollback using lt_transaction;
//	return -1			
//end if
//ldw_receipt_hdr.resetupdate()	


commit using lt_transaction;
rdw_retail_line.resetupdate()
if ll_row > 0 then rdw_retail_line.scrolltorow(ll_row)
return ll_row
end function

public function integer f_calc_line_amount_fields (string vs_editcol, string vs_editdata, long vl_row, ref t_dw_mpl rdw_line);double			ldb_edit_value, ldb_qty, ldb_price, ldb_amt, ldb_base_amt, ldb_currency_id, ldb_round_id, ldb_base_round_id
double			ldb_disc_pct, ldb_disc_amt, ldb_amt_aftr_disc, ldb_base_amt_aftr_disc, ldb_exrate, ldb_object_id,ldb_item_id
double			ldb_amount, ldb_cust_id, ldb_point
long				ll_CARDNUMBER
date				ld_trans_date
string				ls_item_code
t_dw_mpl			ldw_handle
b_obj_instantiate	lb_obj_inst
t_transaction		lt_transaction

if vs_editcol = 'qty'  then
	ldb_qty = double(vs_editdata)
else
	ldb_qty =  rdw_line.getitemnumber(vl_row, 'qty')
end if
if isnull(ldb_qty) then ldb_qty = 0
if vs_editcol = 'price'  then
	ldb_price = double(vs_editdata)
else
	ldb_price =  rdw_line.getitemnumber(vl_row, 'price')
end if
if isnull(ldb_price) then ldb_price = 0
ldb_disc_pct =  rdw_line.getitemnumber(vl_row, 'DISC_PCT')
if isnull(ldb_disc_pct) then ldb_disc_pct = 0
ldb_item_id = rdw_line.getitemnumber(vl_row, 'object_id')


//-- lấy làm tròn thành tiền và thành tiền ghi sổ luôn, vì hầu hết hiện tại trên itemchange đều xử liên quan tới tiền --//
ldw_handle = iw_display.f_get_dw('d_receipt_retail_form')
ldb_currency_id = ldw_handle.getitemnumber( ldw_handle.getrow(),'CURRENCY_ID') 
ldb_exrate = ldw_handle.getitemnumber( ldw_handle.getrow(),'exchange_rate') 
ld_trans_date = date(ldw_handle.getitemdatetime( ldw_handle.getrow(),'trans_date') )
ldb_object_id = ldw_handle.getitemnumber( ldw_handle.getrow(),'invoice_object')
if isnull(ldb_object_id) then ldb_object_id = 0

if ldb_currency_id > 0 then
	ldb_round_id = this.ic_unit_instance.f_get_round_id( ldb_currency_id, 0, 'amount')
	ldb_base_round_id =  this.ic_unit_instance.f_get_round_id( 0, 0, 'bc')
else
	gf_messagebox('m.c_receipt_retail.f_calc_line_amount_fields.01','Thông báo','Chưa có thông tin loại tiền','exclamation','ok',1)
	return -1	
end if
if vs_editcol = 'qty' or vs_editcol = 'cust_name' or vs_editcol = 'uom_code' then
	lb_obj_inst.f_get_retail_price(ldb_item_id , ldb_qty, ldb_currency_id, 'd_item_sales_price_grid','sales', ld_trans_date,ldb_object_id, 0, ldb_price, ldb_disc_pct)
	rdw_line.setitem(vl_row, 'price',ldb_price )
	rdw_line.setitem(vl_row, 'DISC_PCT',ldb_disc_pct )
	if ldb_price = 0 or isnull(ldb_price) then
		gf_messagebox('m.c_receipt_retail.f_calc_line_amount_fields.02','Thông báo','Mặt hàng này có giá bán = 0:@'+ls_item_code,'exclamation','ok',1)
	end if
end if

ldb_amt =  this.ic_unit_instance.f_round(ldw_handle, ldb_round_id, ldb_qty* ldb_price) 
ldb_base_amt =  this.ic_unit_instance.f_round(ldw_handle, ldb_base_round_id,  ldb_exrate * ldb_amt) 
ldb_disc_amt =   this.ic_unit_instance.f_round(ldw_handle, ldb_round_id,  ldb_disc_pct * ldb_amt) 
ldb_amt_aftr_disc =  ldb_amt - ldb_disc_amt
ldb_base_amt_aftr_disc = this.ic_unit_instance.f_round(ldw_handle, ldb_base_round_id, ldb_exrate * ldb_amt_aftr_disc) 

rdw_line.setitem(vl_row, 'amount', ldb_amt)
rdw_line.setitem(vl_row, 'base_amount',ldb_base_amt)
rdw_line.setitem(vl_row, 'DISC_AMT', ldb_disc_amt)
rdw_line.setitem(vl_row, 'AMT_AFTR_DISC', ldb_amt_aftr_disc)
rdw_line.setitem(vl_row, 'BASE_AMT_AFTR_DISC', ldb_base_amt_aftr_disc)
rdw_line.setitem(vl_row, 'DISC_AMT',ldb_disc_amt )
this.iw_display.f_get_transaction(lt_transaction )
if rdw_line.update(true, false) = 1 then	
	commit using lt_transaction;
	rdw_line.resetupdate()
else	
	gf_messagebox('m.c_receipt_retail.f_calc_line_amount_fields.03','Thông báo', lt_transaction.sqlerrtext  ,'exclamation','ok',1)
	rdw_line.event e_retrieve()
	return -1		
end if

//-- tính lại điểm --//
ll_CARDNUMBER = ldw_handle.getitemnumber( ldw_handle.getrow(), 'cardnumber')
if not isnull(ll_CARDNUMBER) and ll_CARDNUMBER > 0 then
	ldb_amount = double(rdw_line.Describe( "Evaluate('sum(AMT_AFTR_DISC)', 0)"))
	ldb_cust_id = ldw_handle.getitemnumber(ldw_handle.getrow(), 'invoice_object')				
	ldb_point = lb_obj_inst.f_get_bonus_point( 'CUSTOMER', ldb_cust_id, 'RECEIPT_RETAIL', ldb_amount)
	ldw_handle.setitem(ldw_handle.getrow() ,'rt_bonus_point', ldb_point)
	if ldw_handle.update(true, false) = 1 then	
		commit using lt_transaction;
		ldw_handle.resetupdate()
	else	
		gf_messagebox('m.c_receipt_retail.f_calc_line_amount_fields.04','Thông báo', lt_transaction.sqlerrtext  ,'exclamation','ok',1)
		ldw_handle.event e_retrieve()
		return -1		
	end if		
end if

return 1
end function

public function integer f_refresh_print_receipt ();t_dw_mpl		ldw_handle

ldw_handle = iw_display.dynamic f_get_dw(2)
ldw_handle.event e_retrieve( )
ldw_handle = iw_display.dynamic f_get_dw(3)
return ldw_handle.event e_retrieve( )


end function

public function datawindow f_get_dw_print ();

t_dw_mpl		ldw_receipt

this.f_refresh_print_receipt( )
ldw_receipt = this.iw_display.dynamic f_get_dw( 3)
ldw_receipt.is_printtype = 'nodialog'
ldw_receipt.ii_print_copy = 2
return ldw_receipt
end function

public subroutine f_connect_device ();OLECustomControl		lo_czkem

string			ls_ip_add, ls_inifile  = 'global.ini'
long			ll_ip_port



ls_ip_add = ProfileString(ls_inifile,"finger device","ip_address ",'')
if ls_ip_add = '' then
	gf_messagebox('m.c_receipt_retail.f_connect_device.01','Thông báo','Máy bán hàng không kết nối vân tay','exclamation','ok',1)	
	return
end if
lo_czkem = iw_display.dynamic f_get_czkem()

select count(ID) into :ll_ip_port from FINGER_SCAN_SETUP
					where IP_ADDRESS = trim(:ls_ip_add) using SQLCA;
					
if ll_ip_port <>1 then
	gf_messagebox('m.c_receipt_retail.f_connect_device.01','Thông báo','Máy bán hàng không kết nối vân tay','exclamation','ok',1)	
	return
end if

select IP_PORT
into :ll_ip_port
from FINGER_SCAN_SETUP
where IP_ADDRESS = trim(:ls_ip_add)
using SQLCA;

if isnull(ls_ip_add) or ls_ip_add = '' or isnull(ll_ip_port) or ll_ip_port = 0 then
else
	if lo_czkem.object.Connect_Net(ls_ip_add, ll_ip_port ) then
		if lo_czkem.object.Regevent(1,65535) then				
			lo_czkem.object.ReadRTlog(1)
			lo_czkem.object.GetRTlog(1)
			gf_messagebox('m.c_receipt_retail.f_connect_device.01','Thông báo','Kết nối thiết bị thành công','exclamation','ok',1)
			lo_czkem.object.ClearGLog(1)
		else
			gf_messagebox('m.c_receipt_retail.f_connect_device.02','Thông báo','Kết nối thiết bị thất bại, vui lòng kiểm tra kết nối mạng hoặc IP thiết bị','exclamation','ok',1)
		end if
	end if
end if

end subroutine

public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[]);double			ldb_id
t_dw_mpl		ldw_main

if pos(rdw_focus.dataobject, 'dv_receipt_retail_')  > 0 then
	ldw_main = this.iw_display.f_get_dwmain( )
	if ldw_main.rowcount( ) > 0 then
		ldb_id = ldw_main.getitemnumber(ldw_main.getrow( ) , 'ID')
		ra_args[1] = ldb_id
		return upperbound(ra_args[])
	else
		ra_args[1] = 0
		return upperbound(ra_args[])
	end if
end if
end function

public function integer f_set_cus_info_fp (long vl_acctno, datetime vdt_att_datetime);b_obj_instantiate	lob_ins
t_transaction		lt_transaction
t_dw_mpl			ldw_retail,ldw_master,ldw_detail, ldw_line

double	ldb_cus_id,db_payment_method,ldb_currency_id, ldb_null, ldb_credit, ldb_id, ldb_bal_amt, ldb_amount
string		ls_cus_name,s_payment_method_name,ls_currency_code,ls_rt_idcard_no, ls_rt_tel_no, ls_address
date		ld_transdate

setnull(ldb_null)

ldw_retail = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
ldb_id = ldw_retail.getitemnumber(ldw_retail.getrow( ),'object_ref_id' )
ldw_detail = iw_display.dynamic f_get_dw(3)
if not ldw_retail.f_get_ib_editing( ) then return 0
if ldw_detail.rowcount( ) = 0 then 
	gf_messagebox('m.c_receipt_retail.f_set_cus_info_fp.01','Thông báo','Chưa quét mã hàng','exclamation','ok',1)
	return 0
end if
ldw_master = iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
iw_display.f_get_transaction( lt_transaction)
lob_ins.f_get_cus_info( vl_acctno, ldb_cus_id, ls_cus_name,db_payment_method,s_payment_method_name,ldb_currency_id, ls_currency_code,ls_rt_idcard_no, ls_rt_tel_no, ls_address, ldb_credit)

if ldb_cus_id = 0 or isnull(ldb_cus_id) then
	gf_messagebox('m.c_receipt_retail.f_set_cus_info_fp.02','Thông báo','Vân tay chưa khai báo khách hàng','exclamation','ok',1)
	return 0
end if
if ldb_credit > 0 then //-- kiểm tra credit --//
	ldw_line = iw_display.f_get_dw('d_retail_line_grid')
	ld_transdate = date(ldw_retail.getitemdatetime( ldw_retail.getrow(), 'trans_date'))
	ldb_bal_amt = lob_ins.f_get_cust_balance( ldb_cus_id, ldb_currency_id, ld_transdate)
	if isnull(ldb_bal_amt) then ldb_bal_amt = 0
	ldb_amount = double(ldw_line.Describe( "Evaluate('sum(AMT_AFTR_DISC)', 0)"))
	if ldb_credit < ldb_bal_amt + ldb_amount then
		gf_messagebox('m.c_receipt_retail.f_set_cus_info.01','Thông báo','Công nợ của quy khách đã vượt mức tín dụng:@'+&
		string(ldb_credit,'#,##0') + '-  nợ cũ: '+string(ldb_bal_amt,'#,##0') + '; nợ mới:' + string(ldb_amount,'#,##0')+'; số tiền vượt: '+string(ldb_credit - ldb_bal_amt - ldb_amount,'#,##0' ),'exclamation','ok',1)
		return -1
	end if
end if
if ldw_retail.getrow() > 0 then
	ldw_retail.setitem( ldw_retail.getrow(), 'INVOICE_OBJECT',ldb_cus_id)
	ldw_retail.setitem( ldw_retail.getrow(), 'PAYMENT_METHOD', db_payment_method)
	ldw_retail.setitem( ldw_retail.getrow(), 'CURRENCY_ID',ldb_currency_id)
	ldw_retail.setitem( ldw_retail.getrow(), 'cust_name',ls_cus_name)
	ldw_retail.setitem( ldw_retail.getrow(), 'cust_address', ls_address)
	ldw_retail.setitem( ldw_retail.getrow(), 'rt_tel_no', ls_rt_tel_no)
	ldw_retail.setitem( ldw_retail.getrow(), 'rt_idcard_no',ls_rt_idcard_no)
	ldw_retail.setitem( ldw_retail.getrow(), 'paymethod_name',s_payment_method_name)
	ldw_retail.setitem( ldw_retail.getrow(), 'uom_code', ls_currency_code)
	ldw_retail.setitem( ldw_retail.getrow(), 'finger_chk_yn', 'Y')
	ldw_retail.setitem( ldw_retail.getrow(), 'receive_amount',ldb_null )
	ldw_retail.setitem( ldw_retail.getrow(), 'rt_pay_amt',ldb_null )
	ldw_retail.setitem( ldw_retail.getrow(), 'rt_pay_base_amt',ldb_null )
	ldw_master.setitem( ldw_retail.getrow(), 'CREATED_DATE', vdt_att_datetime)
	ldw_master.setitem( ldw_retail.getrow(), 'LAST_MDF_date', vdt_att_datetime)
	if ldw_master.update( true,false) = 1 then
		ldw_master.resetupdate( )
		if ldw_retail.update( true,false) = 1 then
			ldw_retail.resetupdate( )
		else
			ldw_master.resetupdate( )
			rollback using lt_transaction;
			gf_messagebox('m.c_receipt_retail.f_set_cus_info_fp.03','Thông báo','Không cập nhật được thông tin khách hàng, vui lòng đặt dấu vân tay lại','exclamation','ok',1)
			return -1
		end if
	else
		rollback using lt_transaction;
		gf_messagebox('m.c_receipt_retail.f_set_cus_info_fp.03','Thông báo','Không cập nhật được thông tin khách hàng, vui lòng đặt dấu vân tay lại','exclamation','ok',1)
		return -1
	end if
	commit using lt_transaction;

end if
return 1
end function

public function integer f_set_cus_info_pin (long vl_acctno, datetime vdt_att_datetime);b_obj_instantiate	lob_ins
t_transaction		lt_transaction
t_dw_mpl			ldw_retail,ldw_master,ldw_detail, ldw_line

double	ldb_cus_id,db_payment_method,ldb_currency_id, ldb_null, ldb_credit, ldb_id, ldb_point , ldb_amount
string		ls_cus_name,s_payment_method_name,ls_currency_code,ls_CARDNUMBER, ls_rt_tel_no, ls_address
date		ld_transdate

setnull(ldb_null)
ldw_retail = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
ldb_id = ldw_retail.getitemnumber(ldw_retail.getrow( ),'object_ref_id' )
if not ldw_retail.f_get_ib_editing( ) then return 0


ldw_master = iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
iw_display.f_get_transaction( lt_transaction)
lob_ins.f_get_cus_info( vl_acctno, ldb_cus_id, ls_cus_name,db_payment_method,s_payment_method_name,ldb_currency_id, ls_currency_code,ls_CARDNUMBER, ls_rt_tel_no, ls_address, ldb_credit)
if ldb_cus_id = 0 or isnull(ldb_cus_id) then
	gf_messagebox('m.c_receipt_retail.f_set_cus_info_pin.02','Thông báo','Số thẻ chưa khai báo khách hàng','exclamation','ok',1)
	return 0
end if

ldw_line = iw_display.f_get_dw('d_retail_line_grid')
if ldw_line.rowcount( ) = 0 then 
	ldb_point = lob_ins.f_get_balance_point( 'CUSTOMER', ldb_cus_id)
	gf_messagebox('m.c_receipt_retail.f_set_cus_info_pin.01','Thông báo','SỐ ĐIỂM CỦA QUÝ KHÁCH LÀ: @'+STRING(ldb_point,'#,##0'),'exclamation','ok',1)
	return 0
end if

if ldw_retail.getrow() > 0 then	
	ldb_amount = double(ldw_line.Describe( "Evaluate('sum(AMT_AFTR_DISC)', 0)"))	
	ldb_point = lob_ins.f_get_bonus_point( 'CUSTOMER',ldb_cus_id, 'RECEIPT_RETAIL', ldb_amount)		
	ldw_retail.setitem( ldw_retail.getrow(), 'INVOICE_OBJECT',ldb_cus_id)
	ldw_retail.setitem( ldw_retail.getrow(), 'CURRENCY_ID',ldb_currency_id)
	ldw_retail.setitem( ldw_retail.getrow(), 'cust_name',ls_cus_name)
	ldw_retail.setitem( ldw_retail.getrow(), 'cust_address', ls_address)
	ldw_retail.setitem( ldw_retail.getrow(), 'rt_tel_no', ls_rt_tel_no)
	ldw_retail.setitem( ldw_retail.getrow(), 'CARDNUMBER',ls_CARDNUMBER)
	ldw_retail.setitem( ldw_retail.getrow(), 'uom_code', ls_currency_code)
	ldw_retail.setitem( ldw_retail.getrow(), 'rt_bonus_point', ldb_point)
	if ldw_master.update( true,false) = 1 then
		ldw_master.resetupdate( )
		if ldw_retail.update( true,false) = 1 then
			ldw_retail.resetupdate( )
		else
			ldw_master.resetupdate( )
			rollback using lt_transaction;
			gf_messagebox('m.c_receipt_retail.f_set_cus_info_pin.03','Thông báo','Không cập nhật được thông tin khách hàng, vui lòng quét thẻ lại','exclamation','ok',1)
			return -1
		end if
	else
		rollback using lt_transaction;
		gf_messagebox('m.c_receipt_retail.f_set_cus_info_pin.03','Thông báo','Không cập nhật được thông tin khách hàng, vui lòng quét thẻ lại','exclamation','ok',1)
		return -1
	end if
	commit using lt_transaction;

end if
return 1
end function

public function integer f_insert_loyalty_trans (double vdb_object_id, string vs_doctype, double vdb_doc_id);double			ldb_bonus_point, ldb_used_point, ldb_id, ldb_measure_id, ldb_uom_id, ldb_ref_id
long				ll_row, ll_cnt
string				ls_objtype, ls_ref_table
date				ld_transdate
t_dw_mpl		ldw_receipt
t_ds_db			lds_measurement
t_transaction	lt_transaction

//-- kiểm tra đối tượng là khách hàng --//
ls_objtype = this.f_get_object_type(vdb_object_id )
if ls_objtype = '' or upper(ls_objtype) <> 'CUSTOMER' then return 0

//-- kiểm tra có cài đặt loyalty chưa --//
select count(id) into :ll_cnt from measurement_hdr 
where object_type = :ls_objtype 
and code = 'KHTT'
and doc_type = :vs_doctype using sqlca;
if ll_cnt <> 1 then return 0

select id, uom_id into :ldb_measure_id, :ldb_uom_id  
from measurement_hdr 
where object_type = :ls_objtype 
and code = 'KHTT'
and doc_type = :vs_doctype using sqlca;

this.iw_display.f_get_Transaction(lt_transaction )

lds_measurement = create t_ds_db
lds_measurement.dataobject = 'ds_measurement_trans'
lds_measurement.f_settransobject(lt_transaction )

//-- 
ldw_receipt = this.iw_display.f_get_dw( 'd_receipt_retail_grid')
if ldw_receipt.getrow( ) > 0 then
	ldb_bonus_point = ldw_receipt.getitemnumber( ldw_receipt.getrow( ) , 'rt_bonus_point')
	if isnull(ldb_bonus_point) then ldb_bonus_point = 0
	ldb_used_point = ldw_receipt.getitemnumber( ldw_receipt.getrow( ) , 'rt_used_point')
	if isnull(ldb_used_point) then ldb_used_point = 0
	ld_transdate = date(ldw_receipt.getitemdatetime( ldw_receipt.getrow( ) , 'trans_date'))
	ldb_ref_id =  ldw_receipt.getitemnumber( ldw_receipt.getrow( ) , 'id')
	ls_ref_table = ldw_receipt.describe("DataWindow.Table.UpdateTable")
	if ldb_bonus_point > 0 then
		ll_row = lds_measurement.event e_addrow()
		ldb_id = this.f_create_id( )
		lds_measurement.setitem(ll_row,'id',ldb_id)
		lds_measurement.setitem(ll_row,'COMPANY_ID',gi_user_comp_id )
		lds_measurement.setitem(ll_row,'BRANCH_ID', gdb_branch )
		lds_measurement.setitem(ll_row,'OBJECT_ID', vdb_object_id )
		lds_measurement.setitem(ll_row,'TRANS_DATE',ld_transdate )
		lds_measurement.setitem(ll_row,'DOC_REF_ID',vdb_doc_id )
		lds_measurement.setitem(ll_row,'DOC_REF_TYPE',vs_doctype )
		lds_measurement.setitem(ll_row,'LINE_REF_ID',ldb_ref_id)
		lds_measurement.setitem(ll_row,'LINE_REF_TABLE',ls_ref_table)
		lds_measurement.setitem(ll_row,'UP_VALUE',ldb_bonus_point)
		lds_measurement.setitem(ll_row,'DOWN_VALUE', ldb_used_point)
		lds_measurement.setitem(ll_row,'MEASUREMENT_ID',ldb_measure_id)
		lds_measurement.setitem(ll_row,'UOM_ID',ldb_uom_id)
	elseif ldb_used_point > 0 then
		ll_row = lds_measurement.event e_addrow()
		ldb_id = this.f_create_id( )
		lds_measurement.setitem(ll_row,'id',ldb_id)
		lds_measurement.setitem(ll_row,'COMPANY_ID',gi_user_comp_id )
		lds_measurement.setitem(ll_row,'BRANCH_ID', gdb_branch )
		lds_measurement.setitem(ll_row,'OBJECT_ID', vdb_object_id )
		lds_measurement.setitem(ll_row,'TRANS_DATE',ld_transdate )
		lds_measurement.setitem(ll_row,'DOC_REF_ID',vdb_doc_id )
		lds_measurement.setitem(ll_row,'DOC_REF_TYPE',vs_doctype )
		lds_measurement.setitem(ll_row,'LINE_REF_ID',ldb_ref_id)
		lds_measurement.setitem(ll_row,'LINE_REF_TABLE',ls_ref_table)
		lds_measurement.setitem(ll_row,'UP_VALUE',ldb_bonus_point)
		lds_measurement.setitem(ll_row,'DOWN_VALUE', ldb_used_point)
		lds_measurement.setitem(ll_row,'MEASUREMENT_ID',ldb_measure_id)
		lds_measurement.setitem(ll_row,'UOM_ID',ldb_uom_id)		
	end if
end if

if lds_measurement.update(true,false) = -1 then
	gf_messagebox('m.b_doc.f_insert_loyalty_trans.01','Thông báo','Không cập nhật được điểm thưởng:@'+lt_transaction.sqlerrtext ,'exclamation','ok',1)
	rollback using lt_transaction;
	destroy lds_measurement
	return -1
end if
destroy lds_measurement

return 1
end function

public function integer f_change_receipt_print_dwo ();
string					ls_paymethod_name
t_dw_mpl			ldw_handle, ldw_receipt

ldw_handle = this.iw_display.dynamic f_get_dw(2)
if ldw_handle.rowcount( ) > 0 then
	ls_paymethod_name = ldw_handle.getitemstring( 1,'paymethod_name')

	ldw_receipt = this.iw_display.dynamic f_get_dw( 3)
	if ls_paymethod_name = 'Tiền mặt' then
		if ldw_receipt.dataobject = 'dv_receipt_retail_credit_form' then
			ldw_receipt.f_change_dwo( 'dv_receipt_retail_form')
		else
//			ldw_receipt.event e_retrieve( )
		end if
		
	else
		if ldw_receipt.dataobject = 'dv_receipt_retail_form' then
			ldw_receipt.f_change_dwo( 'dv_receipt_retail_credit_form')
		else
//			ldw_receipt.event e_retrieve( )
		end if			
	end if
end if
return 1
end function

public function integer f_pay_by_point (double vdb_cust_id, string vs_point_data, ref t_dw_mpl rdw_line);int					li_idx
double			ldb_qty, ldb_amount, ldb_point_amt, ldb_line_amt
date				ld_trans_date
string				ls_editcols
t_dw_mpl			ldw_handle, ldw_receipt
b_obj_instantiate	lbo_instance
t_transaction		lt_transaction



if isnull(vdb_cust_id) or vdb_cust_id = 0 then
	gf_messagebox('m.c_receipt_retail.f_pay_by_point.01','Thông báo','Phiếu chưa có khách hàng','exclamation','ok',1)
	return -1
end if
ldw_receipt = this.iw_display.f_get_dw( 'd_receipt_retail_form')

this.f_calc_refund( vdb_cust_id, '', ldw_receipt)
ldw_handle = rdw_line


if vs_point_data = '' or isnull(vs_point_data) then 
	//-- tính lại amount fields --//	
	FOR li_idx = 1 to ldw_handle.rowcount()
		ldb_qty = ldw_handle.getitemnumber(li_idx, 'qty')
		this.f_calc_line_amount_fields( 'qty', string(ldb_qty), li_idx, ldw_handle)
	NEXT
else
	ldb_point_amt =lbo_instance.f_convert_loyalty_point2amount( 'CUSTOMER', vdb_cust_id, 'RECEIPT_RETAIL', double(vs_point_data))	
	if isnull(ldb_point_amt) or ldb_point_amt = 0 then return 0
	ldb_amount = double(ldw_handle.Describe( "Evaluate('sum(AMT_AFTR_DISC)', 0)"))
	if isnull(ldb_amount) then ldb_amount = 0	
	if ldb_point_amt > ldb_amount then
		gf_messagebox('m.c_receipt_retail.f_pay_by_point.01','Thông báo','Số điểm lơn hơn số tiền cần thanh toán','exclamation','ok',1)
		return -1
	else
		ldb_amount = ldb_amount - ldb_point_amt
	end if
	FOR li_idx = 1 to ldw_handle.rowcount()
		ldb_line_amt = ldw_handle.getitemnumber(li_idx, 'AMT_AFTR_DISC')
		ldb_line_amt = max(0, ldb_line_amt - ldb_point_amt)						
		ldb_point_amt = ldb_point_amt -  ldw_handle.getitemnumber(li_idx, 'AMT_AFTR_DISC')
		ldw_handle.setitem(li_idx, 'AMT_AFTR_DISC', ldb_line_amt)
		if ldb_point_amt <= 0 then exit
	NEXT	
		
	ldw_receipt.setitem( ldw_receipt.getrow(), 'return_amount', -ldb_amount)
	ldw_receipt.setitem( ldw_receipt.getrow(), 'rt_bonus_point', 0)
	if ldw_receipt.update(true,false) = 1 then
		this.iw_display.f_get_transaction(lt_transaction )
		commit using lt_transaction;
		ldw_receipt.resetupdate()
	else 
		return 1
	end if
	
	if ldw_handle.update(true,false) = 1 then
		this.iw_display.f_get_transaction(lt_transaction )
		commit using lt_transaction;
		ldw_handle.resetupdate()
	else 
		return 1
	end if
end if

return 1
end function

public function integer f_calc_refund (double vdb_cust_id, string vs_amount_data, ref t_dw_mpl rdw_receipt);int					li_idx
double			ldb_qty, ldb_amount, ldb_point_amt, ldb_line_amt, ldb_return_amount
date				ld_trans_date
string				ls_editcols
t_dw_mpl			ldw_handle
b_obj_instantiate	lbo_instance
t_transaction		lt_transaction

ldw_handle = iw_display.f_get_dw('d_retail_line_grid')
ldb_amount = double(ldw_handle.Describe( "Evaluate('sum(AMT_AFTR_DISC)', 0)"))
if isnull(ldb_amount) then ldb_amount = 0
if isnull(vs_amount_data) or vs_amount_data ='' then
	rdw_receipt.setitem(rdw_receipt.getrow(),'return_amount', -ldb_amount)
	rdw_receipt.setitem(rdw_receipt.getrow(),'RT_PAY_AMT', 0)
	rdw_receipt.setitem(rdw_receipt.getrow(),'RT_PAY_BASE_AMT', 0)
	rdw_receipt.setitem(rdw_receipt.getrow(),'receive_amount', 0)
else
	ldb_return_amount = double(vs_amount_data) - ldb_amount
	rdw_receipt.setitem(rdw_receipt.getrow(),'return_amount',ldb_return_amount)
	if ldb_return_amount >= 0 then 
		rdw_receipt.setitem(rdw_receipt.getrow(),'RT_PAY_AMT', ldb_amount)
		rdw_receipt.setitem(rdw_receipt.getrow(),'RT_PAY_BASE_AMT', ldb_amount)	
	else
		rdw_receipt.setitem(rdw_receipt.getrow(),'RT_PAY_AMT', 0)
		rdw_receipt.setitem(rdw_receipt.getrow(),'RT_PAY_BASE_AMT', 0)			
	end if
end if

if rdw_receipt.update(true,false) = 1 then
	this.iw_display.f_get_transaction(lt_transaction )
	commit using lt_transaction;
	rdw_receipt.resetupdate()
else
	return -1
end if
return 1
end function

on c_receipt_retail.create
call super::create
end on

on c_receipt_retail.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = false
is_display_model = 'up_2d1d_lo_1tb'
ib_display_text = false
is_object_title = 'Phiếu bán lẻ'
is_exrate_type = 'buy'
istr_actionpane[1].s_button_name = 'b_add;b_insert;b_modify;b_save;b_filteron;b_query;b_execquery;b_querying;b_refresh;b_delete;b_cancel;b_post;b_unpost;b_print;'
//istr_actionpane[1].s_button_has_sub = 'b_add;'
//istr_actionpane[1].sa_sub_button[1]='b_add;b_copyf_sal_invoice;b_copyf_pur_invoice_return;b_copyf_seft;'
//istr_actionpane[1].sa_sub_button[2]='b_copyl_sal_invoice;b_copyl_pur_invoice_return;'
//istr_actionpane[1].sa_sub_button[3]='b_copyt_seft;'
istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_description = is_object_title
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
//						if ldw_focus.dynamic f_isgrid() then
//							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_post;b_account_view;b_blank;b_view_receipt_retail;b_blank;b_send_2_approve;b_approve;b_reject;'
//						else
//							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_join_multi;b_modify;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_post;b_account_view;b_blank;b_view_receipt_retail;b_blank;b_send_2_approve;b_approve;b_reject;'
//						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_post;b_print;'
						else
							istr_actionpane[li_idx].s_visible_buttons =  'b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_post;b_print;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
//						istr_actionpane[li_idx].s_visible_buttons= 'b_add;b_modify;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_copyt_multi;b_blank;b_post;b_account_view;b_blank;b_view_receipt_retail;b_blank;b_send_2_approve;b_approve;b_reject;'
					else
						istr_actionpane[li_idx].s_visible_buttons= 'b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_post;b_print;'
					end if
				end if
//			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
//				istr_actionpane[li_idx].s_visible_buttons =   'b_sal_invoice;b_sal_invoice_return;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
				istr_actionpane[li_idx].s_visible_buttons =  'b_book; b_attach; b_doc_trace_on;b_user_trace;b_appr_trace;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then							
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;long					ll_row,ll_line_no,ll_trans_hdr_id,ll_idx
string 				ls_code, ls_name, ls_obj_type
double				ldb_id
decimal				ldc_exc
t_dw_mpl 			ldw_handle
t_transaction		lt_transaction

if pos(rpo_dw.dataobject,'d_retail_line') > 0 then
	if vl_currentrow = 1 and  rpo_dw.rowcount()= 0 then
		ll_line_no = vl_currentrow
	else
		ll_line_no = vl_currentrow
		for ll_idx = vl_currentrow + 1 to rpo_dw.rowcount()
			rpo_dw.setitem(ll_idx,'line_no',ll_idx)
		next
	end if
	rpo_dw.setitem(vl_currentrow,'line_no',ll_line_no)
elseif mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_document_retail' then
	rpo_dw.setitem(vl_currentrow,'doc_type','RECEIPT_RETAIL')
	rpo_dw.setitem(vl_currentrow,'TRANS_HDR_ID', 953009)
//	rpo_dw.setitem( vl_currentrow, 'trans_date', date(gd_session_date))	
	
	ldw_handle = this.iw_display.dynamic f_get_dw( 3)
	if ldw_handle.dataobject = 'dv_receipt_retail_credit_form' then
		ldw_handle.f_change_dwo( 'dv_receipt_retail_form')
	end if
	ldw_handle.event e_addrow( )
elseif mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_receipt_retail' then
	this.iw_display.f_get_transaction( lt_transaction)
	rpo_dw.setitem(vl_currentrow,'doc_type','RECEIPT_RETAIL')
	rpo_dw.setitem( vl_currentrow, 'VERSION_NO', 1)
	rpo_dw.setitem(vl_currentrow,'object_type','ACCOUNT')
	rpo_dw.setitem( vl_currentrow, 'trans_date', date(gd_session_date))
	// Set giá trị mặc định cho đồng tiền hạch toán
	this.ic_unit_instance.f_get_base_cur( ldb_id, ls_code, ls_name)
	rpo_dw.setitem( vl_currentrow, 'CURRENCY_ID', ldb_id)
	rpo_dw.setitem( vl_currentrow, 'uom_code', ls_code)
	ldc_exc = this.f_get_exchange_rate( ls_code,today())
	rpo_dw.setitem( vl_currentrow, 'exchange_rate', ldc_exc)
	rpo_dw.setitem( vl_currentrow, 'value_yn', 'Y')
	rpo_dw.setitem( vl_currentrow, 'quantity_yn', 'Y')
	
//	rpo_dw.post setfocus()
//	rpo_dw.post setcolumn('barcode')
end if
return vl_currentrow
end event

event e_window_open;call super::e_window_open;t_dw_mpl			ldw_main
any				laa_value[]
//--form parm--//
//ldw_main = iw_display.dynamic f_get_dwmain()
//laa_value[1] = '=RECEIPT_RETAIL'
//ldw_main.f_add_where('doc_type;',laa_value[])
//

//ids_barcode_search = create t_ds_db
//ids_barcode_search.dataobject = 'ds_retail_barcode_search'
//ids_barcode_search.f_settransobject( sqlca)
//ids_barcode_search.retrieve(gi_user_comp_id, gdb_branch )
//

return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;//iw_display.dynamic f_set_ii_fixedpart1_height(400 )
//iw_display.dynamic f_set_ii_upperpart_height(800)
return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;double				ldb_qty, ldb_price, ldb_exc, ldb_amount, ldb_trans_hdr_id, ldb_cust_id, ldb_point
double				ldb_item_id, ldb_retail_price, ldb_object_id, ldb_return_amount, ldb_currency_id, ldb_round_id,ldb_base_round_id
string					ls_object_type,ls_rbt_ins_del, ls_obj_code,ls_obj_name, ls_null, ls_used_point_yn
long 					ll_row, ll_CARDNUMBER
date					ld_trans_date
t_dw_mpl			ldw_handle
t_transaction		lt_transaction
b_obj_instantiate	lbo_instance

if AncestorReturnValue = 1 then return 1
setnull(ls_null)

if mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_receipt_retail' then
	choose case vs_colname
		case 'uom_code','exchange_rate'
			if vs_colname = 'uom_code' then 				
				ldb_exc = this.f_get_exchange_rate( vs_editdata,today())
				rpo_dw.setitem(vl_currentrow,'exchange_rate',ldb_exc)
			end if
		case 'barcode'
			if isnull(vs_editdata) or vs_editdata = '' then return 0
			ls_rbt_ins_del = rpo_dw.getitemstring(vl_currentrow,'insrt_del')
			if isnull(ls_rbt_ins_del) then 
				ls_rbt_ins_del = 'add'
				rpo_dw.setitem(vl_currentrow,'insrt_del','add')
			end if
			ldw_handle = iw_display.f_get_dw('d_retail_line_grid')
			if ls_rbt_ins_del='add' then
				ll_row = this.f_add_barcode_item( vs_editdata, ldw_handle)
				if ll_row = -1 then
					rpo_dw.settext('')
					rpo_dw.setitem(vl_currentrow,'barcode',ls_null)
					return 1
				end if
			else
				ll_row = this.f_delete_barcode_item( vs_editdata, ldw_handle)
				if ll_row = -1 then
					rpo_dw.settext('')
					rpo_dw.setitem(vl_currentrow,'barcode',ls_null)
					return 1					
				end if
			end if	
			rpo_dw.settext('')
			rpo_dw.setitem(vl_currentrow,'barcode',ls_null)
			this.f_refresh_print_receipt( )
			return 1			
		case 'receive_amount'
			ldb_cust_id = rpo_dw.getitemnumber(vl_currentrow, 'invoice_object')
			ldw_handle = rpo_dw			
			if this.f_calc_refund(ldb_cust_id,vs_editdata, ldw_handle) = -1 then return 1
			this.f_refresh_print_receipt( )
		case 'cust_name'
			if vs_editdata = 'Khách lẻ' then
				ldw_handle = iw_display.f_get_dw('dv_receipt_retail_credit_form')
				if isvalid(ldw_handle) then
					this.iw_display.f_get_transaction(lt_transaction )
					ldw_handle.dataobject = 'dv_receipt_retail_form'
					ldw_handle.settransobject( lt_transaction)
					ldw_handle.event e_retrieve( )
				end if
			end if
		case 'rt_used_point'
			ldb_cust_id = rpo_dw.getitemnumber(vl_currentrow, 'invoice_object')
			ldw_handle = iw_display.f_get_dw('d_retail_line_grid')
			if this.f_pay_by_point(ldb_cust_id, vs_editdata, ldw_handle) = -1 then return 1
			this.f_change_receipt_print_dwo( )			
		case 'used_point_yn'
			if vs_editdata = 'Y' then
				rpo_dw.setitem(vl_currentrow,'rt_bonus_point', 0)
			else
				ldw_handle = iw_display.f_get_dw('d_retail_line_grid')
				ldb_amount = double(ldw_handle.Describe( "Evaluate('sum(AMT_AFTR_DISC)', 0)"))
				ldb_cust_id = rpo_dw.getitemnumber(vl_currentrow, 'invoice_object')				
				ldb_point = lbo_instance.f_get_bonus_point( 'CUSTOMER', ldb_cust_id, 'RECEIPT_RETAIL', ldb_amount)
				rpo_dw.setitem(vl_currentrow,'rt_bonus_point', ldb_point)
			end if
	end choose
elseif mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_retail_line' then
	choose case vs_colname
		case 'qty','price','disc_pct','object_code'
			if double(vs_editdata) < 0 then
				gf_messagebox('m.c_receipt_retail.e_dw_e_itemchanged.02','Thông báo','Không nhập số lượng hoặc đơn giá âm','exclamation','ok',1)
				rpo_dw.settext('0')
				return 1
			end if		
			ldw_handle = rpo_dw
			this.f_calc_line_amount_fields( vs_colname, vs_editdata, vl_currentrow, ldw_handle)
			ldb_item_id = rpo_dw.getitemnumber(vl_currentrow, 'object_id')
			if vs_colname = 'qty' then
				this.f_delete_link_item( ldb_item_id, double(vs_editdata), ldw_handle)
				this.f_add_link_item(ldb_item_id , double(vs_editdata), ldw_handle)				
			end if

			this.f_refresh_print_receipt( )
	end choose
elseif mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_document_retail' then
	if vs_colname = 'document_date' then
		rpo_dw.setitem(vl_currentrow,'trans_date', date(vs_editdata))
		ldw_handle = iw_display.f_get_dw('d_receipt_retail_form')
		ldw_handle.setitem(ldw_handle.getrow(),'trans_date', date(vs_editdata))
		if ldw_handle.update(true,false) = -1 then
			gf_messagebox('m.c_receipt_retail.e_dw_e_itemchanged.03','Thông báo','Không nhập ngày ghi sổ :trans_date','exclamation','ok',1)
			ldw_handle.resetupdate( )
			return 1
		end if
		ldw_handle.resetupdate( )
	end if
end if
return AncestorReturnValue
end event

event e_window_e_unpost;call super::e_window_e_unpost;double			ldb_doc_id
date 				ld_trans_date
t_transaction	lt_transaction
t_ds_db			lds_obj_post
t_dw_mpl		ldw_main

ldw_main = this.iw_display.f_get_dwmain( )
if ldw_main.getrow( ) > 0 then
	ldb_doc_id = ldw_main.getitemnumber(ldw_main.getrow() , 'ID')
	ld_trans_date = date(ldw_main.getitemdatetime(ldw_main.getrow() , 'document_date'))
	this.iw_display.f_get_transaction(lt_transaction )
	
	lds_obj_post = create  t_ds_db
	lds_obj_post.dataobject = 'ds_measurement_trans'
	if this.f_insert_measurement_balance(ldb_doc_id, ld_trans_date, lt_transaction,lds_obj_post,  'unpost', gs_sob) = -1 then
		destroy lds_obj_post
		return -1	
	end if
	destroy lds_obj_post
	
	delete measurement_trans where doc_ref_id =:ldb_doc_id using lt_transaction;
	if lt_transaction.sqlcode = -1 then 
		gf_messagebox('m.c_receipt_retail.e_window_e_unpost.01','Thông báo','Lỗi xóa dữ liệu:@'+lt_transaction.sqlerrtext,'stop','ok',1)
		rollback using lt_transaction;
		return -1
	end if	
end if

return 0
end event

event e_window_e_preunpost;call super::e_window_e_preunpost;//any				laa_data[]
//long				ll_rtn
//double			ldb_so_doc_id,ldb_t_doc_id
//t_ds_db 			lds_matching
//t_dw_mpl		ldw_main
//t_transaction	lt_transaction
//
//iw_display.f_get_transaction(lt_transaction)
////-- Kiểm tra phiếu đã cấn trừ chưa? --//
//lds_matching = create t_ds_db
//lds_matching.dataobject = 'ds_check_matching'
//lds_matching.f_settransobject(lt_transaction )
//
//ldw_main = iw_display.f_get_dwmain( )
//laa_data[1] = ldw_main.getitemnumber( ldw_main.getrow( ), 'id')
//laa_data[2] = 'OBJECT_TRANS'
//lds_matching.f_add_where( 't_doc_id;t_ref_table',laa_data[] )
//ll_rtn = lds_matching.retrieve( )
//if ll_rtn > 0 then
//	gf_messagebox('m.c_receipt.e_window_e_preunpost.01','Thông báo','Phiếu: '+ lds_matching.getitemstring( 1, 't_doc_code') +' đã cấn trừ với phiếu: '+ lds_matching.getitemstring( 1, 'f_doc_code') +' nên không được sửa ghi sổ!' ,'stop','ok',1)
//	destroy lds_matching
//	return -1
//end if
//destroy lds_matching
////-- Cập nhật lại trạng thái cho ĐXBH --//
//ldw_main = iw_display.f_get_dwmain( )
//ldb_t_doc_id = ldw_main.getitemnumber( ldw_main.getrow( ) , 'id')
//ldb_so_doc_id = this.f_get_so_doc_id( "PAYMENT_LINE", ldb_t_doc_id)
//if ldb_so_doc_id > 0 then
//	update document set status = 'invoiced' where id = :ldb_so_doc_id using lt_transaction ;
//	if lt_transaction.sqlcode <> 0 then
//		gf_messagebox('m.c_receipt.e_window_e_preunpost.02','Thông báo','Lỗi, Không cập nhật được trạng thái cho phiếu đề xuất bán hàng:@'+lt_transaction.sqlerrtext ,'stop','ok',1)
//			rollback using  lt_transaction;
//			return -1
//	end if
//	return 1
//end if
return 0
end event

event e_dw_getfocus;//-- overrride --//

return 1
end event

event e_window_e_postopen;
t_dw_mpl 		ldw_receipt

ldw_receipt = this.iw_display.dynamic f_get_dw( 3)
if isvalid(ldw_receipt) then ldw_receipt.event e_retrieve( )

this.f_change_receipt_print_dwo( )
//this.f_connect_device( )
this.iw_display.event e_add( )
return 0
end event

event e_window_e_prepost;call super::e_window_e_prepost;
t_dw_mpl			ldw_retail,ldw_detail

double	ldb_return_amt 
string		ls_finger,ls_payment_method_name

//-- kiểm tra : phuong thức TT: công nợ --//

ldw_detail = iw_display.dynamic f_get_dw(3 )
if ldw_detail.rowcount( ) = 0 then 
	gf_messagebox('m.c_receipt_retail.e_window_e_prepost.01','Thông báo','Phiếu chư có chi tiết hàng mua','exclamation','ok',1)
	return -1
end if
ldw_retail = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
ls_payment_method_name = ldw_retail.getitemstring(ldw_retail.getrow( ) , 'paymethod_name')
if isnull(ls_payment_method_name) then 
	gf_messagebox('m.c_receipt_retail.e_window_e_prepost.02','Thông báo','Phiếu chư có Phương thức thanh toán','exclamation','ok',1)
	return -1	
end if
if ls_payment_method_name = 'Tiền mặt' then
	ldb_return_amt = ldw_retail.getitemnumber(ldw_retail.getrow( ) , 'return_amount')
	if ldb_return_amt < 0 then 
		gf_messagebox('m.c_receipt_retail.e_window_e_prepost.03','Thông báo','Số tiền thanh toán chưa đủ','exclamation','ok',1)
		return -1
	end if
else
	ls_finger =  ldw_retail.getitemstring(ldw_retail.getrow( ) , 'finger_chk_yn')
	if ls_finger <> 'Y' then
		gf_messagebox('m.c_receipt_retail.e_window_e_prepost.04','Thông báo','Khách hàng chưa kiểm vân tay','exclamation','ok',1)
		return -1		
	end if
end if

return 0
end event

event e_dw_e_postmodifyrow;call super::e_dw_e_postmodifyrow;
//if mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_receipt_retail' then
//	rpo_dw.post setfocus()
//	rpo_dw.post setcolumn('barcode')
//end if
return 0
end event

event e_window_e_afterpost;call super::e_window_e_afterpost;
string				ls_payment_method_name
t_dw_mpl		ldw_retail, ldw_main
t_transaction	lt_transaction

this.iw_display.f_get_Transaction(lt_transaction )
ldw_retail = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
ldw_main = this.iw_display.f_get_dwmain( )
ls_payment_method_name = ldw_retail.getitemstring(ldw_retail.getrow( ) , 'paymethod_name')
if ls_payment_method_name = 'Tiền mặt' then
	ldw_main.setitem(ldw_main.getrow(), 'status', 'paid')
	ldw_main.setitem(ldw_main.getrow(), 'sob', gs_sob)
	if  ldw_main.update(true,false ) = -1 then
		Rollback using lt_transaction;
		gf_messagebox('m.c_receipt_retial.e_window_e_afterpost.01','Thông báo','Không cập nhật được trạng thái phiếu khi thanh toán','stop','ok',1)
		return -1
	end if
	ldw_main.resetupdate( )
end if

this.iw_display.event e_print( )
this.iw_display.event e_add( )
return 1


end event

event e_dw_rowfocuschanged;call super::e_dw_rowfocuschanged;
if rpo_dw.dataobject = 'd_document_retail_grid' then
	this.f_change_receipt_print_dwo( )
end if
return 0
end event

event e_czkem_onatttransactionex;call super::e_czkem_onatttransactionex;if verifymethod = 1 then

	this.f_set_cus_info_fp( long(enrollnumber), datetime(string(day) + '/' + string(month) + '/' + string(year) + ' ' + string(hour) + ':' + string(minute) + ':' + string(second)))
	this.f_change_receipt_print_dwo( )
elseif verifymethod = 2 then
	
	
	IF this.f_set_cus_info_pin(long(enrollnumber), datetime(string(day) + '/' + string(month) + '/' + string(year) + ' ' + string(hour) + ':' + string(minute) + ':' + string(second))) = 1 THEN
		this.f_refresh_print_receipt( )
	END IF
end if

end event

event e_window_e_post;call super::e_window_e_post;double			ldb_doc_id
date 				ld_trans_date
t_transaction	lt_transaction
t_ds_db			lds_obj_post
t_dw_mpl		ldw_main

ldw_main = this.iw_display.f_get_dwmain( )
if ldw_main.getrow( ) > 0 then
	ldb_doc_id = ldw_main.getitemnumber(ldw_main.getrow() , 'ID')
	ld_trans_date = date(ldw_main.getitemdatetime(ldw_main.getrow() , 'document_date'))
	this.iw_display.f_get_transaction(lt_transaction )
	
	lds_obj_post = create  t_ds_db
	lds_obj_post.dataobject = 'ds_measurement_trans'
	if this.f_insert_measurement_balance(ldb_doc_id, ld_trans_date, lt_transaction,lds_obj_post,  'post', gs_sob) = -1 then
		destroy lds_obj_post
		return -1	
	end if
	destroy lds_obj_post
end if
return 0
end event

event e_window_e_refresh;call super::e_window_e_refresh;t_dw_mpl 		ldw_receipt

ldw_receipt = this.iw_display.dynamic f_get_dw( 3)
if isvalid(ldw_receipt) then ldw_receipt.event e_retrieve( )

return 0
end event

