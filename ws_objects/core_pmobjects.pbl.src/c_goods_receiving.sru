$PBExportHeader$c_goods_receiving.sru
forward
global type c_goods_receiving from b_doc
end type
end forward

global type c_goods_receiving from b_doc
event type integer e_action_receiving ( )
end type
global c_goods_receiving c_goods_receiving

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_related ()
public subroutine f_set_str_unit ()
public function integer f_resize_fixedpart_grid ()
public function integer f_resize_fixedpart_form ()
public function integer f_reset_fixedpart_grid ()
public function double f_get_pr_doc_id (string vs_t_ref_table, double vdb_t_doc_id)
end prototypes

event type integer e_action_receiving();long			ll_found
string			ls_vend_name, ls_dist_name, ls_find_string
double		ldb_rtn, ldb_doc_version_id
any			laa_value[]
s_str_dwo_related		lstr_related[], lstr_data_related[]
t_dw_mpl				ldw_main, ldw_line
s_object_display 		lpo_related
t_ds_db					lads_copied[]
b_obj_instantiate		lbo_ins

connect using it_transaction;

ldw_main = iw_display.f_get_dwmain( )
ll_found = ldw_main.find("gutter ='Y' ",1 , ldw_main.rowcount())
if ll_found > 0 then
	//-- check cùng vendor--//
	ls_vend_name = ldw_main.getitemstring(ll_found, 'object_short_name')
	ls_dist_name = ldw_main.getitemstring(ll_found, 'dist_short_name')
	ls_find_string = " gutter ='Y' "
	if isnull(ls_vend_name) then
		ls_find_string += "AND object_short_name > ''"
	else
		ls_find_string += "AND object_short_name <> '"+ls_vend_name+"'"
	end if
	if isnull(ls_dist_name) then
		ls_find_string += "AND dist_short_name > ''"
	else
		ls_find_string += "AND dist_short_name <> '"+ls_dist_name+"'"
	end if	
	ll_found = ldw_main.find(ls_find_string, ll_found + 1 , ldw_main.rowcount()+1)
	if ll_found > 0 then
		disconnect using it_transaction;
		gf_messagebox('m.c_goods_receiving.e_action_receiving.01','Thông báo','PO không cùng nhà cung cấp / phân phối','stop','ok',1)
		return -1
	end if
end if

//get data de build where related
this.f_get_data_related('u_pur_invoice', lstr_data_related[]) 
//build where related
iw_display.f_build_data_related( lstr_data_related[])  

this.dynamic f_get_dwo_related(lstr_related) 
if iw_display.dynamic f_get_data_copied_ex( lads_copied[],lstr_related,'copyt','u_pur_invoice') > 0 then
	lpo_related = create using 'u_pur_invoice'
	ldb_rtn = lbo_ins.f_copy_to_pur_invoice( lstr_data_related[], lads_copied[], it_transaction ,lpo_related.idwsetup_initial )			
	if ldb_rtn > 0 then
		lpo_related.f_set_main_id(ldb_rtn )
		iw_display.event e_change_object_appeon( lpo_related)			
		//-- update PO status--//
		ldw_line = iw_display.f_get_dw( 'd_po_line_receiving_grid')
		ldw_line.settransobject( it_transaction )
		ll_found = ldw_main.find("gutter ='Y' ",1 , ldw_main.rowcount())
		if ll_found = 0 then				
			ldw_line.event e_refresh( )
			if ldw_line.rowcount( ) = 0 then	
				ldb_doc_version_id =   ldw_main.getitemnumber( ldw_main.getrow(), 'version_id')		
				Update DOCUMENT set status = 'full_receive' where version_id = :ldb_doc_version_id using it_transaction;
				commit using it_transaction;
			end if
		else 
			DO while ll_found > 0
				ldb_doc_version_id =  ldw_main.getitemnumber(ll_found, 'version_id')	
				laa_value[1]  = ldb_doc_version_id
				ldw_line.f_add_where_to_origin( 'object_ref_id', laa_value[])
				if ldw_line.retrieve( ) = 0 then
					Update DOCUMENT set status = 'full_receive' where version_id = :ldb_doc_version_id using it_transaction;
				end if
				ll_found = ldw_main.find("gutter ='Y' ",ll_found +1 , ldw_main.rowcount()+1)
			LOOP
			commit using it_transaction;
		end if
		ldw_main.settransobject(it_transaction )
		ldw_main.event e_refresh( )
	else
		destroy lpo_related
	end if
end if
disconnect using it_transaction;
return 1			
end event

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_document_receiving_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_document_receiving_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_details = 'd_po_line_receiving_grid' 
istr_dwo[1].b_ref_table_yn  = false
istr_dwo[1].s_ref_table_field = ''
//istr_dwo[1].b_relation_1_1 = true
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = false
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = false
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_gb_name = 'gb_6'
istr_dwo[1].s_description = 'Đơn đặt mua'


istr_dwo[2].s_dwo_default =  'd_po_line_receiving_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_po_line_receiving_grid'
istr_dwo[2].b_master = false
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_details = ''
istr_dwo[2].s_dwo_master = 'd_document_receiving_grid;'
istr_dwo[2].s_master_keycol = 'VERSION_ID;'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[2].b_ref_table_yn  = false
istr_dwo[2].s_ref_table_field = ''
istr_dwo[2].b_relation_1_1 = false
istr_dwo[2].b_insert = false
istr_dwo[2].b_update = false
istr_dwo[2].b_delete = false
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = false
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].b_focus_master = true
istr_dwo[2].s_description = 'Chi tiết mua hàng'

/*
istr_dwo[3].s_dwo_default =  'd_po_line_grid'
istr_dwo[3].s_dwo_form = 'd_po_line_form'
istr_dwo[3].s_dwo_grid = 'd_po_line_grid'
istr_dwo[3].b_detail = true
istr_dwo[3].b_master = true
istr_dwo[3].b_cascade_del = true
istr_dwo[3].s_dwo_master = 'd_order_form;'
istr_dwo[3].s_dwo_details = 'd_order_catch_grid;d_tax_line_grid;'
istr_dwo[3].s_master_keycol = 'ID;'
istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[3].b_ref_table_yn  = false
istr_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[3].b_insert = true
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = true
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_excel = true
istr_dwo[3].b_traceable = true
istr_dwo[3].b_focus_master = false
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].s_gb_name = 'gb_7'
istr_dwo[3].s_description = 'Chi tiết đặt mua'

istr_dwo[4].s_dwo_default =  'd_tax_line_grid'
istr_dwo[4].s_dwo_form = ''
istr_dwo[4].s_dwo_grid = 'd_tax_line_grid'
istr_dwo[4].b_detail = true
istr_dwo[4].s_dwo_master = 'd_po_line_grid;'
istr_dwo[4].s_dwo_details = ''
istr_dwo[4].s_master_keycol = 'ID;'
istr_dwo[4].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[4].b_ref_table_yn  = false
istr_dwo[4].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[4].b_relation_1_1 = true
istr_dwo[4].b_insert = false
istr_dwo[4].b_update = true
istr_dwo[4].b_delete = false
istr_dwo[4].b_query = true
istr_dwo[4].b_print = true
istr_dwo[4].b_excel = true
istr_dwo[4].b_traceable = true
istr_dwo[4].b_keyboardlocked = true
istr_dwo[4].s_gb_name = 'gb_8'
istr_dwo[4].s_description = 'Thuế'

istr_dwo[5].s_dwo_default =  'd_order_catch_grid'
istr_dwo[5].s_dwo_form = ''
istr_dwo[5].s_dwo_grid = 'd_order_catch_grid'
istr_dwo[5].b_detail = true
istr_dwo[5].s_dwo_master = 'd_po_line_grid;'
istr_dwo[5].s_master_keycol = 'ID;'
istr_dwo[5].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[5].b_ref_table_yn  = false
istr_dwo[5].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[5].b_insert = true
istr_dwo[5].b_update = true
istr_dwo[5].b_delete = true
istr_dwo[5].b_query = true
istr_dwo[5].b_print = true
istr_dwo[5].b_excel = true
istr_dwo[5].b_traceable = true
istr_dwo[5].b_focus_master = false 
istr_dwo[5].b_keyboardlocked = true
istr_dwo[5].s_gb_name = 'gb_9'
istr_dwo[5].s_description = 'Chi tiết kiểm đếm'
*/
end subroutine

public subroutine f_set_dwo_related ();
// Đối tượng liên quan
istr_dwo_related[1].s_related_obj_name = 'u_pur_invoice'					// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = 'd_document_po_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'd_document_ap_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].b_f_matching = true
istr_dwo_related[1].b_copy_tax = true
istr_dwo_related[1].b_chk_matched_qty = false
istr_dwo_related[1].s_relatedtext_column = 'code'					
istr_dwo_related[1].s_text = 'Hóa đơn phải trả từ: '

istr_dwo_related[1].s_main_obj_dwo_copy[1] = 'd_order_form' 
istr_dwo_related[1].s_main_obj_column_copy[1] = 'bill_to_object;bill_to_addtext;bill_to_object;bill_to_addtext;'+&
																		'payment_term;payment_method;'+&
																		'include_tax_yn;exchange_rate;currency_id;note;'
istr_dwo_related[1].s_related_obj_dwo_copy[1] = 'd_invoice_pur_form'
istr_dwo_related[1].s_related_obj_column_copy[1] = 'invoice_object;invoice_address;dr_cr_object;trans_address;'+&
																		'PAYMENT_TERM;PAYMENT_METHOD;'+&
																		'include_tax_yn;exchange_rate;currency_id;note;'
istr_dwo_related[1].s_main_obj_column_chk[1] = ''
istr_dwo_related[1].s_related_obj_column_chk[1] = 'trans_date;'


istr_dwo_related[1].s_main_obj_dwo_copy[2] = 'd_po_line_receiving_grid' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[2] = 'ITEM_ID;LINE_TEXT;NOTE;QTY;price;amount;base_amount;base_amount_ex_tax;TRANS_UOM;vat;vat_amount;' // cột copy từ
istr_dwo_related[1].s_related_obj_dwo_copy[2] = 'd_pur_invoice_line_grid' // datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[2] = 'OBJECT_ID;LINE_TEXT;NOTE;QTY;price;amount;base_amount;base_amount_ex_tax;TRANS_UOM;vat;vat_amount;' // cột copy đến
istr_dwo_related[1].s_main_obj_column_chk[2] = ''
istr_dwo_related[1].s_related_obj_column_chk[2] = 'warehouse_id;'
istr_dwo_related[1].s_f_obj_column_chk[2] = 'ITEM_ID'
istr_dwo_related[1].s_t_obj_column_chk[2] = 'OBJECT_ID'
istr_dwo_related[1].b_copy_line[1] = false
// khai báo cập nhật bản matching
istr_dwo_related[1].s_match_f_dwo[2] = 'd_po_line_receiving_grid'
istr_dwo_related[1].s_match_f_col_obj[2] = 'item_id'
istr_dwo_related[1].s_match_t_dwo[2] = 'd_pur_invoice_line_grid'
istr_dwo_related[1].s_match_f_column[2] = 'qty'
istr_dwo_related[1].s_match_t_column[2] = 'qty'
istr_dwo_related[1].s_match_column[2] = 'qty'
istr_dwo_related[1].s_match_rf_dwo[2] = ''  //tra hang
istr_dwo_related[1].s_main_obj_column_sum[2] = ''
istr_dwo_related[1].s_related_obj_column_sum[2] = ''
istr_dwo_related[1].s_f_obj_column_chk[2] = ''
istr_dwo_related[1].s_t_obj_column_chk[2] = ''
istr_dwo_related[1].b_f_sum[2] = false

// Đối tượng liên quan : GOODS_RECEIPT --//
istr_dwo_related[2].s_related_obj_name = 'u_goods_receipt'					// đối tượng copy đến
istr_dwo_related[2].s_main_obj_dwo = 'd_document_receiving_grid'		//datawindow quan hệ main
istr_dwo_related[2].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[2].s_related_obj_dwo = 'd_doc_goods_receipt_grid'	// datawindow quan hệ đến
istr_dwo_related[2].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[2].b_f_matching = true
istr_dwo_related[2].b_copy_tax = true
istr_dwo_related[2].b_chk_matched_qty = false
istr_dwo_related[2].s_relatedtext_column = 'code'					
istr_dwo_related[2].s_text = 'Phiếu nhập kho từ: '

istr_dwo_related[2].s_main_obj_dwo_copy[1] = 'd_order_form' 
istr_dwo_related[2].s_main_obj_column_copy[1] = 'bill_to_object;bill_to_addtext;bill_to_object;bill_to_addtext;'+&
																		'payment_term;payment_method;'+&
																		'include_tax_yn;exchange_rate;currency_id;note;'
istr_dwo_related[2].s_related_obj_dwo_copy[1] = 'd_goods_receipt_form'
istr_dwo_related[2].s_related_obj_column_copy[1] = 'invoice_object;invoice_address;dr_cr_object;trans_address;'+&
																		'PAYMENT_TERM;PAYMENT_METHOD;'+&
																		'include_tax_yn;exchange_rate;currency_id;note;'
istr_dwo_related[2].s_main_obj_column_chk[1] = ''
istr_dwo_related[2].s_related_obj_column_chk[1] = 'trans_date;'


istr_dwo_related[2].s_main_obj_dwo_copy[2] = 'd_po_line_receiving_grid' // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[2] = 'ITEM_ID;LINE_TEXT;NOTE;QTY;QTY;price;amount;base_amount;base_amount_ex_tax;TRANS_UOM;' // cột copy từ
istr_dwo_related[2].s_related_obj_dwo_copy[2] = 'd_inventory_line_delivery_grid' // datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[2] = 'ITEM_ID;LINE_TEXT;NOTE;DOC_QTY;QTY;price;amount;base_amount;base_amount_ex_tax;TRANS_UOM;' // cột copy đến
istr_dwo_related[2].s_main_obj_column_chk[2] = ''
istr_dwo_related[2].s_related_obj_column_chk[2] = 'warehouse_id;'
istr_dwo_related[2].s_f_obj_column_chk[2] = 'ITEM_ID'
istr_dwo_related[2].s_t_obj_column_chk[2] = 'ITEM_ID'
istr_dwo_related[2].b_copy_line[1] = false
// khai báo cập nhật bản matching
istr_dwo_related[2].s_match_f_dwo[2] = 'd_po_line_receiving_grid'
istr_dwo_related[2].s_match_f_col_obj[2] = 'item_id'
istr_dwo_related[2].s_match_t_dwo[2] = 'd_inventory_line_delivery_grid'
istr_dwo_related[2].s_match_f_column[2] = 'qty'
istr_dwo_related[2].s_match_t_column[2] = 'qty'
istr_dwo_related[2].s_match_column[2] = 'qty'
istr_dwo_related[2].s_match_rf_dwo[2] = ''  //tra hang
istr_dwo_related[2].s_main_obj_column_sum[2] = ''
istr_dwo_related[2].s_related_obj_column_sum[2] = ''
istr_dwo_related[2].s_f_obj_column_chk[2] = ''
istr_dwo_related[2].s_t_obj_column_chk[2] = ''
istr_dwo_related[2].b_f_sum[2] = false



end subroutine

public subroutine f_set_str_unit ();//--Datawindow chứa các cột cần làm tròn--//
istr_unit[1].s_dwo_handing = 'd_po_line_grid;d_po_line_grid;d_po_line_grid;d_po_line_grid;d_order_form;'
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = 'qty;price;amount;base_amount;exchange_rate;'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[1].s_dwo_unit = 'd_po_line_grid;d_order_form;d_order_form;d_order_form;d_order_form'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = 'uom_code;uom_code;uom_code;uom_code;exchange_rate'
//--Loại làm tròn --//
istr_unit[1].s_type = 'item;price;amount;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[1].s_dwo_object = 'd_po_line_grid'
//--Cột chứa mã đơn vị--//
istr_unit[1].s_colname_object = 'item_code'
end subroutine

public function integer f_resize_fixedpart_grid ();this.iw_display.dynamic f_reset_ii_fixedpart2_height_grid(0)
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_resize_fixedpart_form ();this.iw_display.dynamic f_reset_ii_fixedpart2_height_form()
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_reset_fixedpart_grid ();this.iw_display.dynamic f_reset_ii_fixedpart2_height_grid()
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function double f_get_pr_doc_id (string vs_t_ref_table, double vdb_t_doc_id);double 		ldb_doc_id

if upper(vs_t_ref_table) =  'PO_LINE' then
		// PO -> PR
		SELECT DISTINCT MAT2.F_DOC_ID into :ldb_doc_id 
		FROM DOCUMENT DOC //PUR
			 JOIN MATCHING MAT1 ON MAT1.T_DOC_ID = DOC.ID AND MAT1.F_REF_TABLE = 'PO_LINE' //INVEN
			 JOIN MATCHING MAT2 ON MAT2.T_DOC_ID = MAT1.F_DOC_ID AND MAT2.F_REF_TABLE = 'PR_LINE' //PO
		WHERE DOC.ID = :vdb_t_doc_id using SQLCA;
		if SQLCA.SQLCODE = 100 then
			// PUR -> PO
			SELECT DISTINCT MAT1.F_DOC_ID into :ldb_doc_id 
			FROM DOCUMENT DOC //PUR
				 JOIN MATCHING MAT1 ON MAT1.T_DOC_ID = DOC.ID AND MAT1.F_REF_TABLE = 'PR_LINE' //PO
			WHERE DOC.ID = :vdb_t_doc_id using SQLCA;
		end if
end if
if isnull(ldb_doc_id) then ldb_doc_id = 0
if SQLCA.sqlcode = -1 then ldb_doc_id = -1
return ldb_doc_id
end function

on c_goods_receiving.create
call super::create
end on

on c_goods_receiving.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = false
is_display_model = '1d_1d'
ib_display_text = false
is_object_title = 'Nhận hàng'
is_exrate_type = 'sell'
istr_actionpane[1].s_button_name = 'b_add_multi;b_join_multi;b_copyt_multi;b_view_multi;b_insert;b_modify;b_save; b_saveclose;b_filteron;b_query;b_refresh;b_delete;b_view_po;b_send_2_approve;b_request_2_change;b_total;b_approve;b_reject;'
istr_actionpane[1].s_button_has_sub = 'b_add_multi;b_view_multi;'
istr_actionpane[1].sa_sub_button[1]='b_add;b_copyt_seft;'
istr_actionpane[1].sa_sub_button[2]='b_view_po;b_view_po_eng;'
//istr_actionpane[1].sa_sub_button[3]='b_copyt_po_return;b_copyt_goods_receipt;b_copyt_pur_invoice;'
//istr_actionpane[1].sa_sub_button[4]='b_view_po;b_view_po_eng;'
istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_description = is_object_title
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;double						ldb_version_id
b_obj_instantiate			lbo_ins

ldb_version_id = lbo_ins.f_Create_id_ex( it_transaction )
rpo_dw.setitem(vl_currentrow,'doc_type','PO')
rpo_dw.setitem(vl_currentrow,'object_ref_table','ORDERS')
rpo_dw.setitem(vl_currentrow,'version_id',ldb_version_id)

return vl_currentrow
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;//double			ldc_amount,ldc_disc_amt,ldc_disc_pct,ldc_exc,ldc_tax,ldc_price,ldc_qty,ldc_base_amount
//double			ldc_amt_ex, ldc_base_amt_ex, ldc_act_base_amt_ex, ldc_act_amt_ex, ldc_base_amt,ldc_price_ex,ldc_act_price_ex
/*
int					li_tax_percent
string				ls_include_tax_yn, ls_currency_price_code, ls_upd_colname
double			ldb_ref_id, ldb_round_id, ldb_currency_id, ldb_trans_id,ldb_object_id, ldb_exrate, ldb_item_id, ldb_spec_id, ldb_qty, ldb_currency_price_id
double			ldb_discount,ldb_discount_pct, ldb_wholesales_price,ldb_disc_amt_setup, ldb_disc_pct_setup, ldc_exc_price, ldb_round_id_price
long 				ll_row,ll_find
date				ld_trans_date
//any				la_data[],la_retrieve[]
//c_unit_instance		lc_unit
t_dw_mpl				ldw_object, ldw_tmp,ldw_main, ldw_tax
b_obj_instantiate		lb_obj


if AncestorReturnValue = 1 then return 1
ldw_main = iw_display.f_get_dwmain( )
if mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_po_line' then
	choose case vs_colname
		case 'object_code', 'spec_code' 
			ldw_tmp = iw_display.f_get_dw(istr_dwo[1].s_dwo_default)
			ld_trans_date = date(ldw_tmp.getitemdatetime( ldw_tmp.getrow(), 'document_date'))	
			ldw_tmp = iw_display.f_get_dw(istr_dwo[2].s_dwo_default)
			ldb_object_id = ldw_tmp.getitemnumber( ldw_tmp.getrow(),'object_id') 
			ldb_currency_id = ldw_tmp.getitemnumber( ldw_tmp.getrow(),'CURRENCY_ID') 
			ldb_exrate = ldw_tmp.getitemnumber( ldw_tmp.getrow( ) , 'exchange_rate')
			ldb_item_id = rpo_dw.getitemnumber (vl_currentrow,'ITEM_ID')	
			ldb_spec_id = rpo_dw.getitemnumber (vl_currentrow,'spec_id')
			ldb_qty = rpo_dw.getitemnumber (vl_currentrow,'qty')
			
			ldb_currency_price_id = ldb_currency_id 
			lb_obj.f_get_item_price_disc(ldb_item_id ,ldb_spec_id, ldb_qty, ldb_currency_price_id, 'd_item_pur_price_grid','PURCHASE', ld_trans_date,ldb_object_id, 0, ldb_wholesales_price,ldb_disc_amt_setup, ldb_disc_pct_setup)								
			if ldb_wholesales_price > 0 then
				if ldb_currency_price_id <> ldb_currency_id then
					ls_currency_price_code = lb_obj.f_get_uom_code(ldb_currency_price_id )
					ldc_exc_price = this.f_get_exchange_rate( ls_currency_price_code, ld_trans_date)
					if ldb_exrate > 0 then
						ldb_wholesales_price = ldb_wholesales_price * ldc_exc_price/ldb_exrate
						if ldb_currency_id > 0 then ldb_round_id_price = ic_unit_instance.f_get_round_id( ldb_currency_id, 0, 'price')
						if ldb_round_id_price > 0 then ldb_wholesales_price = ic_unit_instance.f_round( rpo_dw, ldb_round_id_price, ldb_wholesales_price)								
					end if
				end if
				rpo_dw.setitem(vl_currentrow,'price', ldb_wholesales_price)	
			end if
			ldb_discount = rpo_dw.getitemnumber (vl_currentrow,'disc_amt')
			if isnull(ldb_discount) then ldb_discount = 0
			ldb_discount_pct =  rpo_dw.getitemnumber (vl_currentrow,'disc_pct')
			if isnull(ldb_discount_pct) then ldb_discount_pct = 0
			if ldb_discount_pct = 0 and ldb_discount = 0 then
				rpo_dw.setitem(vl_currentrow,'disc_amt',ldb_disc_amt_setup)
				rpo_dw.setitem(vl_currentrow,'disc_pct',ldb_disc_pct_setup)					
			end if			
			//-- cập nhật các cột liên quan --//
			ls_upd_colname = 'qty;price_ex_tax;amount;amount_ex_tax;base_amount;base_amount_ex_tax;'
			ldw_tmp = iw_display.f_get_dw(istr_dwo[2].s_dwo_default)
			ldw_tax = iw_display.f_get_dw(istr_dwo[4].s_dwo_default)
			if lb_obj.f_update_line_itemchanged( vs_colname, vs_editdata , ls_upd_colname,vl_currentrow , rpo_dw, ldw_tmp, ldw_tax, 0, 0) = -1 then return 1					

		case 'amount'
		//-- cập nhật các cột liên quan --//
			ls_upd_colname = 'disc_amt;disc_pct;price;price_ex_tax;amount_ex_tax;base_amount;base_amount_ex_tax;'
			ldw_tmp = iw_display.f_get_dw(istr_dwo[2].s_dwo_default)
			ldw_tax = iw_display.f_get_dw(istr_dwo[4].s_dwo_default)
			if lb_obj.f_update_line_itemchanged( vs_colname, vs_editdata , ls_upd_colname,vl_currentrow , rpo_dw, ldw_tmp, ldw_tax, 0, 0) = -1 then return 1							
			
		case 'qty'
			ldw_tmp = iw_display.f_get_dw(istr_dwo[1].s_dwo_default)
			ld_trans_date = date(ldw_tmp.getitemdatetime( ldw_tmp.getrow(), 'document_date'))	
			ldw_tmp = iw_display.f_get_dw(istr_dwo[2].s_dwo_default)
			ldb_object_id = ldw_tmp.getitemnumber( ldw_tmp.getrow(),'object_id') 
			ldb_currency_id = ldw_tmp.getitemnumber( ldw_tmp.getrow(),'CURRENCY_ID') 
			ldb_exrate = ldw_tmp.getitemnumber( ldw_tmp.getrow( ) , 'exchange_rate')
			ldb_item_id = rpo_dw.getitemnumber (vl_currentrow,'item_id')		
			ldb_spec_id = rpo_dw.getitemnumber (vl_currentrow,'spec_id')

			ldb_qty = dec(vs_editdata)

			//-- lấy giá --//
			ldb_currency_price_id = ldb_currency_id 
			lb_obj.f_get_item_price_disc(ldb_item_id , ldb_spec_id, ldb_qty, ldb_currency_price_id, 'd_item_sales_price_grid','sales', ld_trans_date,ldb_object_id, 0, ldb_wholesales_price,ldb_disc_amt_setup, ldb_disc_pct_setup)				
			if ldb_wholesales_price > 0 then
				if ldb_currency_price_id <> ldb_currency_id then
					ls_currency_price_code = lb_obj.f_get_uom_code(ldb_currency_price_id )
					ldc_exc_price = this.f_get_exchange_rate( ls_currency_price_code, ld_trans_date)
					if ldb_exrate > 0 then
						ldb_wholesales_price = ldb_wholesales_price * ldc_exc_price/ldb_exrate
						if ldb_currency_price_id > 0 then ldb_round_id_price = ic_unit_instance.f_get_round_id( ldb_currency_price_id, 0, 'price')
						if ldb_round_id_price > 0 then ldb_wholesales_price = ic_unit_instance.f_round( rpo_dw, ldb_round_id_price, ldb_wholesales_price)								
					end if
				end if
				rpo_dw.setitem(vl_currentrow,'price', ldb_wholesales_price)	
			end if
	
			if ldb_discount_pct = 0 and ldb_discount = 0 then
				rpo_dw.setitem(vl_currentrow,'disc_amt',ldb_disc_amt_setup)
				rpo_dw.setitem(vl_currentrow,'disc_pct',ldb_disc_pct_setup)					
			end if			
		
			//-- cập nhật các cột liện quan --//
			ls_upd_colname = 'price_ex_tax;amount;amount_ex_tax;base_amount;base_amount_ex_tax;'
			ldw_tmp = iw_display.f_get_dw(istr_dwo[2].s_dwo_default)
			ldw_tax = iw_display.f_get_dw(istr_dwo[4].s_dwo_default)
			if lb_obj.f_update_line_itemchanged( vs_colname, vs_editdata , ls_upd_colname,vl_currentrow , rpo_dw, ldw_tmp, ldw_tax, 0, 0) = -1 then return 1									
		case 'price'
			//-- cập nhật các cột liên quan --//
			ls_upd_colname = 'price_ex_tax;amount;amount_ex_tax;base_amount;base_amount_ex_tax;'
			ldw_tmp = iw_display.f_get_dw(istr_dwo[2].s_dwo_default)
			ldw_tax = iw_display.f_get_dw(istr_dwo[4].s_dwo_default)
			if lb_obj.f_update_line_itemchanged( vs_colname, vs_editdata , ls_upd_colname,vl_currentrow , rpo_dw, ldw_tmp, ldw_tax, 0, 0) = -1 then return 1			

		case 'disc_amt', 'disc_pct'
			//-- cập nhật các cột liên quan --//
			ls_upd_colname = 'disc_amt;disc_pct;amount;amount_ex_tax;base_amount;base_amount_ex_tax;'
			ldw_tmp = iw_display.f_get_dw(istr_dwo[2].s_dwo_default)
			ldw_tax = iw_display.f_get_dw(istr_dwo[4].s_dwo_default)
			if lb_obj.f_update_line_itemchanged( vs_colname, vs_editdata , ls_upd_colname,vl_currentrow , rpo_dw, ldw_tmp, ldw_tax, 0, 0) = -1 then return 1	
			
			
//			ldc_amount = rpo_dw.getitemnumber(vl_currentrow,'amount')
//			if isnull(ldc_amount) then
//				gf_messagebox('m.e_dw_e_itemchanged.02','Thông báo','Chưa có thành tiền','exclamation','ok',1)
//				rpo_dw.setitem(vl_currentrow,'disc_amt',0)
//				return 2
//			else
//				ldc_disc_pct = dec(vs_editdata) * 100 / ldc_amount
//				rpo_dw.setitem(vl_currentrow,'disc_pct',ldc_disc_pct)
//			end if
//		case 'disc_pct'
//			ldc_amount = rpo_dw.getitemnumber(vl_currentrow,'amount')
//			if isnull(ldc_amount) then ldc_amount = 0
//			ldc_disc_amt = dec(vs_editdata) * ldc_amount / 100
//			rpo_dw.setitem(vl_currentrow,'disc_amt',ldc_disc_amt)
	end choose
elseif mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_order' then
	choose case vs_colname
		case 'object_code'
			ldw_main = iw_display.f_get_dw(istr_dwo[1].s_dwo_default)
			ld_trans_date = date(ldw_main.getitemdatetime(ldw_main.getrow(), 'document_date'))
			
			ls_include_tax_yn = rpo_dw.getitemstring(vl_currentrow,'include_tax_yn')
			ldb_exrate = rpo_dw.getitemnumber(vl_currentrow,'exchange_rate')
			ldb_currency_id = rpo_dw.getitemnumber( vl_currentrow,'CURRENCY_ID') 
			ldb_object_id = rpo_dw.getitemnumber( vl_currentrow,'object_id') 

			ldw_tmp =iw_display.f_get_dw(istr_dwo[3].s_dwo_default)
			FOR ll_row = 1 to ldw_tmp.rowcount()
				ldb_item_id = ldw_tmp.getitemnumber (ll_row,'item_id')	
				ldb_spec_id = ldw_tmp.getitemnumber (ll_row,'spec_id')
				ldb_qty = ldw_tmp.getitemnumber (ll_row,'qty')
				
				ldb_currency_price_id = ldb_currency_id 
				lb_obj.f_get_item_price_disc(ldb_item_id ,ldb_spec_id, ldb_qty, ldb_currency_price_id, 'd_item_pur_price_grid','sales', ld_trans_date,ldb_object_id, 0, ldb_wholesales_price,ldb_disc_amt_setup, ldb_disc_pct_setup)								
				if ldb_wholesales_price > 0 then
					if ldb_currency_price_id <> ldb_currency_id then
						ls_currency_price_code = lb_obj.f_get_uom_code(ldb_currency_price_id )
						ldc_exc_price = this.f_get_exchange_rate( ls_currency_price_code, ld_trans_date)
						if ldb_exrate > 0 then
							ldb_wholesales_price = ldb_wholesales_price * ldc_exc_price/ldb_exrate
							if ldb_currency_price_id > 0 then ldb_round_id_price = ic_unit_instance.f_get_round_id( ldb_currency_price_id, 0, 'price')
							if ldb_round_id_price > 0 then ldb_wholesales_price = ic_unit_instance.f_round( rpo_dw, ldb_round_id_price, ldb_wholesales_price)								
						end if
					end if
					ldw_tmp.setitem(ll_row,'price', ldb_wholesales_price)
				end if
				ldb_discount = ldw_tmp.getitemnumber (ll_row,'disc_amt')
				if isnull(ldb_discount) then ldb_discount = 0
				ldb_discount_pct =  ldw_tmp.getitemnumber (ll_row,'disc_pct')
				if isnull(ldb_discount_pct) then ldb_discount_pct = 0
				if ldb_discount_pct = 0 and ldb_discount = 0 then
					ldw_tmp.setitem(ll_row,'disc_amt',ldb_disc_amt_setup)
					ldw_tmp.setitem(ll_row,'disc_pct',ldb_disc_pct_setup)					
				end if			
			NEXT
			//-- cập nhật các cột liện quan --//
			ls_upd_colname = 'price_ex_tax;amount;amount_ex_tax;base_amount;base_amount_ex_tax;'
			ldw_tax = iw_display.f_get_dw(istr_dwo[4].s_dwo_default)
			if lb_obj.f_update_hdr_itemchanged( 'object_code', vs_editdata , ls_upd_colname,vl_currentrow, ldw_tmp , rpo_dw, ldw_tax, 0) = -1 then return 1
			
		case 'uom_code','exchange_rate'
			//-- cập nhật các cột liện quan --//
			ls_upd_colname = 'price; price_ex_tax;amount;amount_ex_tax;base_amount;base_amount_ex_tax;'
			ldw_tmp =iw_display.f_get_dw(istr_dwo[3].s_dwo_default)
			ldw_tax = iw_display.f_get_dw(istr_dwo[4].s_dwo_default)				
			if lb_obj.f_update_hdr_itemchanged( vs_colname, vs_editdata , ls_upd_colname,vl_currentrow, ldw_tmp , rpo_dw, ldw_tax , idb_previous_exrate) = -1 then return 1
			if vs_colname =  'uom_code' then
				idb_previous_exrate =rpo_dw.getitemnumber( vl_currentrow, 'exchange_rate') //-- lưu nhớ lại tỷ giá thay đổi gần nhất chưa commit --//
			end if
			
		case 'include_tax_yn'
			//-- cập nhật các cột liện quan --//
			ls_upd_colname = 'price_ex_tax;amount_ex_tax;base_amount_ex_tax;'
			ldw_tmp =iw_display.f_get_dw(istr_dwo[3].s_dwo_default)
			ldw_tax = iw_display.f_get_dw(istr_dwo[4].s_dwo_default)
			if lb_obj.f_update_hdr_itemchanged( vs_colname, vs_editdata , ls_upd_colname,vl_currentrow, ldw_tmp , rpo_dw, ldw_tax, 0) = -1 then return 1

	end choose
elseif pos(rpo_dw.dataobject,'d_document_') > 0  then
	if vs_colname = 'trans_desc' then
		ldb_trans_id = rpo_dw.getitemnumber(vl_currentrow,'trans_hdr_id')		
		//-- khởi tạo lại giao dịch để post thuế--//
//		if idb_trans_id <> ldb_trans_id then
//			la_data[1] = ldb_trans_id
//			this.f_init_object_table(ids_trans_setup, 'd_trans_setup_grid', 'object_ref_id;',la_data[],la_retrieve[])
//			idb_trans_id = ldb_trans_id
//		end if						
	end if
end if
*/
return AncestorReturnValue
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_join_multi;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_detail;b_blank;b_copyt_multi;b_blank;b_view_po;b_blank;b_send_2_approve;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_detail;b_blank;b_copyt_multi;b_blank;b_view_po;b_blank;b_send_2_approve;b_approve;b_reject;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons =  'b_filteron;b_refresh;b_receiving;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query; b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_detail;b_blank;b_copyt_multi;b_blank;b_view_po;b_blank;b_send_2_approve;b_total;b_approve;b_reject;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_generate;b_modify;b_detail;b_filteron;b_refresh;b_delete;b_cancel;b_view_multi;b_send_2_approve;b_approve;b_reject;'
					else
						istr_actionpane[li_idx].s_visible_buttons= 'b_filteron;b_refresh;b_receiving;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =   'b_pr;b_po_return;b_goods_receipt;b_pur_invoice;b_so;'
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

event e_window_open;call super::e_window_open;
any				laa_value[]
t_dw_mpl			ldw_main

//--form parm--//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '=completed'
ldw_main.f_add_where('status',laa_value[])
return 0
end event

event e_dw_updatestart;call super::e_dw_updatestart;/*
double		ldb_qty,ldb_price,ldb_id
string			ls_filter
long			ll_row

t_dw_mpl		ldw_tax

if rdw_requester.dataobject = istr_dwo[3].s_dwo_default then
	if ids_matching.rowcount( ) > 0 then
		ldw_tax = iw_display.f_get_dw(istr_dwo[4].s_dwo_default )
		ls_filter = ldw_tax.describe( "datawindow.table.filter")
		for ll_row = 1 to rdw_requester.rowcount( )
			ldb_id = rdw_requester.getitemnumber(ll_row,'id')
			ldw_tax.setfilter( "object_ref_id = " + string(ldb_id))
			ldw_tax.filter( )
			ldb_price = rdw_requester.getitemnumber( ll_row, 'price')
			this.event e_dw_e_itemchanged( rdw_requester, ll_row, 'price', string(ldb_price))
		next
		ldw_tax.setfilter( ls_filter)
		ldw_tax.filter( )
	end if
end if
*/
return 0
end event

event e_dw_e_postsave;call super::e_dw_e_postsave;double		ldb_doc_id, ldb_extend_id, ldb_billto_id, ldb_object_id, ldb_payment_term, ldb_payment_method, ldb_delivery_mode
double		ldb_base_curr_id
string			ls_cust_yn, ls_taxnumber, ls_addr, ls_purpose, ls_firstname, ls_phone, ls_email, ls_currCode, ls_currName
date			ld_req_ship_date

c_unit_instance			lc_unit_ins

ldb_doc_id =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'id') 
if ldb_doc_id > 0 then
	
	//-- ORDERS--//
	ldb_extend_id = rpo_dw.getitemnumber(rpo_dw.getrow(), 'extend_id') 
	ldb_billto_id = rpo_dw.getitemnumber(rpo_dw.getrow(), 'bill_to_object') 
	ldb_object_id =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'object_id') 
	ldb_payment_term =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'payment_term') 
	ldb_payment_method =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'payment_method') 
	ldb_delivery_mode =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'delivery_mode') 
	lc_unit_ins.f_get_base_cur_ex( ldb_base_curr_id,ls_currCode, ls_currName, it_transaction )
	ld_req_ship_date = date(rpo_dw.getitemdatetime(rpo_dw.getrow(), 'request_ship_date') )
	if ldb_extend_id > 0 then
		//-- update--//		
		UPDATE orders 
		set bill_to_object = :ldb_billto_id , object_id =:ldb_object_id, payment_term= :ldb_payment_term, 
								payment_method = :ldb_payment_method, delivery_mode =:ldb_delivery_mode,
								currency_id = :ldb_base_curr_id, exchange_rate = 1, request_ship_date = :ld_req_ship_date
		where id = :ldb_extend_id using it_transaction;
	else
		//-- insert--//
		ldb_extend_id =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'version_id') 
		INSERT into orders (id, object_ref_id, object_ref_Table, company_id, branch_id, created_by, created_Date, last_mdf_by, last_mdf_date, doc_type,version_no,
								  bill_to_object, object_id, payment_term, payment_method, delivery_mode, currency_id, exchange_rate, request_ship_date )
		VALUES (:ldb_extend_id, :ldb_doc_id, 'DOCUMENT',:gi_user_comp_id, :gdb_branch, :gi_userid, sysdate, :gi_userid, sysdate,'PO', 1,
					:ldb_billto_id,:ldb_object_id,:ldb_payment_term, :ldb_payment_method, :ldb_delivery_mode,:ldb_base_curr_id,1 ,:ld_req_ship_date)
		using it_transaction;
	end if

	return 1
end if
return 0
end event

event e_dw_e_predelete;call super::e_dw_e_predelete;double		ldb_extend_id


	//-- VENDOR--//
	ldb_extend_id = rpo_dw.getitemnumber(vl_currentrow, 'extend_id') 
	if ldb_extend_id > 0 then
		iw_display.f_get_transaction(it_transaction)
		DELETE  orders where id = :ldb_extend_id using it_transaction;
		//-- PO_LINE--//
		DELETE  po_line where object_ref_id = :ldb_extend_id using it_transaction;
		
		return 1
	end if

return 0
end event

event e_dw_dwnkey;call super::e_dw_dwnkey;string					ls_colname

if v_keycode = KeyEnter! then
	ls_colname = rpo_dw.getcolumnname()
	if upper(ls_colname) = 'REQUEST_SHIP_DATE' then
		iw_display.dynamic event e_detail( )
		return 2
	end if
end if
return 0
end event

event e_window_e_detail_start;call super::e_window_e_detail_start;
t_dw_mpl 			ldw_main
ldw_main = iw_display.f_get_dwmain( )
if ldw_main.f_get_ib_editing( ) then
	if iw_display.event e_save( ) = -1 then return -1
	ldw_main.f_set_ib_editing( true)
else
	return 0
end if
end event

event e_window_e_preopen;call super::e_window_e_preopen;
iw_display.f_set_ii_leftpart_width(1/2)
return 0
end event

