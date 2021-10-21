$PBExportHeader$c_so_completion.sru
forward
global type c_so_completion from b_doc
end type
end forward

global type c_so_completion from b_doc
event type integer e_action_release ( )
end type
global c_so_completion c_so_completion

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_str_unit ()
public subroutine f_set_dwo_related ()
public subroutine f_set_actionpane ()
public subroutine f_set_str_streamvalue ()
public function integer f_reset_fixedpart_grid ()
public function integer f_resize_fixedpart_form ()
public function integer f_resize_fixedpart_grid ()
public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[])
end prototypes

event type integer e_action_release();double				ldb_doc_id
string					ls_status
t_dw_mpl			ldw_main

ldw_main = this.iw_display.f_get_dwmain( )
ldb_doc_id = ldw_main.getitemnumber(ldw_main.getrow( ), 'id')
ls_status = ldw_main.getitemstring(ldw_main.getrow( ), 'status')
if ls_status = 'hold' then
	update document set status = 'released' where id = :ldb_doc_id using sqlca;
	commit using sqlca;
end if
return 1
end event

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_document_inventory_grid'
istr_dwo[1].s_dwo_form = 'd_document_inventory_form'
istr_dwo[1].s_dwo_grid = 'd_document_inventory_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_goods_delivery_form;' 
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
istr_dwo[1].s_description = 'Phiếu quyết toán'

istr_dwo[2].s_dwo_default =  'd_goods_delivery_form'
istr_dwo[2].s_dwo_form = 'd_goods_delivery_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = true
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_details = 'd_inventory_line_delivery_grid;'
istr_dwo[2].s_dwo_master = 'd_document_inventory_grid;'
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
istr_dwo[2].b_focus_master = true
istr_dwo[2].s_description = 'Quyết toán'

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
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = false
istr_dwo[3].b_query = true
istr_dwo[3].b_print = false
istr_dwo[3].b_excel = false
istr_dwo[3].b_traceable = false
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].b_focus_master = false
istr_dwo[3].s_gb_name = 'gb_7'
istr_dwo[3].s_description = 'Chi tiết quyết toán'

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
istr_dwo[4].b_insert = true
istr_dwo[4].b_update = true
istr_dwo[4].b_delete = true
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
istr_dwo[5].b_update = true
istr_dwo[5].b_delete = true
istr_dwo[5].b_query = true
istr_dwo[5].b_print = true
istr_dwo[5].b_excel = true
istr_dwo[5].b_traceable = true
istr_dwo[5].b_keyboardlocked = true
istr_dwo[5].s_description ='Định khoản'
istr_dwo[5].s_gb_name = 'gb_9'

istr_dwo[6].s_dwo_default =  'd_charge_line_grid'
istr_dwo[6].s_dwo_form = ''
istr_dwo[6].s_dwo_grid = 'd_charge_line_grid'
istr_dwo[6].b_master = false
istr_dwo[6].b_detail = true
istr_dwo[6].b_cascade_del = true
istr_dwo[6].s_dwo_master = 'd_inventory_line_delivery_grid;'
istr_dwo[6].s_dwo_details = ''
istr_dwo[6].s_dwo_shared = ''
istr_dwo[6].s_master_keycol = 'ID;'
istr_dwo[6].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[6].b_ref_table_yn  = false
istr_dwo[6].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[6].b_insert = false
istr_dwo[6].b_update = true
istr_dwo[6].b_delete = true
istr_dwo[6].b_query = true
istr_dwo[6].b_print = true
istr_dwo[6].b_excel = true
istr_dwo[6].b_traceable = true
istr_dwo[6].b_keyboardlocked = true
//istr_dwo[6].s_description ='Định khoản'
//istr_dwo[6].s_gb_name = 'gb_9'
end subroutine

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_inventory_line_delivery_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_inventory_line_delivery_grid'
iastr_dwo_tabpage[1].str_dwo[1].b_master = true
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_goods_delivery_form;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = 'd_inventory_catch_grid;d_lot_line_grid;d_charge_line_grid;d_tax_line_grid;'
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
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Chi tiết quyết toán'

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
iastr_dwo_tabpage[2].str_dwo[1].b_insert = true
iastr_dwo_tabpage[2].str_dwo[1].b_update = true
iastr_dwo_tabpage[2].str_dwo[1].b_delete = true
iastr_dwo_tabpage[2].str_dwo[1].b_query = true
iastr_dwo_tabpage[2].str_dwo[1].b_print = true
iastr_dwo_tabpage[2].str_dwo[1].b_excel = true
iastr_dwo_tabpage[2].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[2].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[2].i_index = 2
iastr_dwo_tabpage[2].str_dwo[1].s_description ='Chi tiết barcode'

iastr_dwo_tabpage[3].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[3].s_display_model = '1d'
iastr_dwo_tabpage[3].i_upperpart_height = 500
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_default =  'd_charge_line_grid'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_form = 'd_charge_line_form'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_grid = 'd_charge_line_grid'
iastr_dwo_tabpage[3].str_dwo[1].b_master = false
iastr_dwo_tabpage[3].str_dwo[1].b_detail = true
iastr_dwo_tabpage[3].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_master = 'd_inventory_line_delivery_grid;'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[3].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[3].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[3].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[3].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[3].str_dwo[1].b_insert = true
iastr_dwo_tabpage[3].str_dwo[1].b_update = true
iastr_dwo_tabpage[3].str_dwo[1].b_delete = true
iastr_dwo_tabpage[3].str_dwo[1].b_query = true
iastr_dwo_tabpage[3].str_dwo[1].b_print = true
iastr_dwo_tabpage[3].str_dwo[1].b_excel = true
iastr_dwo_tabpage[3].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[3].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[3].str_dwo[1].s_description ='Chi phí'

iastr_dwo_tabpage[4].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[4].s_display_model = '1d'
iastr_dwo_tabpage[4].i_upperpart_height = 500
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_default =  'd_tax_line_grid'
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_grid = 'd_tax_line_grid'
iastr_dwo_tabpage[4].str_dwo[1].b_master = false
iastr_dwo_tabpage[4].str_dwo[1].b_detail = true
iastr_dwo_tabpage[4].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_master = 'd_inventory_line_delivery_grid;'
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[4].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[4].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[4].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[4].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[4].str_dwo[1].b_insert = false
iastr_dwo_tabpage[4].str_dwo[1].b_update = true
iastr_dwo_tabpage[4].str_dwo[1].b_delete = true
iastr_dwo_tabpage[4].str_dwo[1].b_query = true
iastr_dwo_tabpage[4].str_dwo[1].b_print = true
iastr_dwo_tabpage[4].str_dwo[1].b_excel = true
iastr_dwo_tabpage[4].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[4].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[4].str_dwo[1].s_description ='Thuế'

end subroutine

public subroutine f_set_str_unit ();////--Datawindow chứa các cột cần làm tròn--//
//istr_unit[1].s_dwo_handing = 'd_inventory_line_delivery_grid;"";"";d_inventory_line_delivery_grid;d_goods_delivery_form;'
////--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
//istr_unit[1].s_colname_data = 'qty;"";"";bc;ex'
////--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
//istr_unit[1].s_colname_convert = ''
//istr_unit[1].s_colname_diff = ''
////--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
//istr_unit[1].s_dwo_unit = 'd_inventory_line_delivery_grid;"";"";"";""'
////--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
//istr_unit[1].s_colname_unit = 'uom_code;"";"";"";""'
////--Loại làm tròn --//
//istr_unit[1].s_type = 'item;"";"";"";""'
////--Datawindow của cột chứa mã hàng--//
//istr_unit[1].s_dwo_object = 'd_inventory_line_delivery_grid'
////--Cột chứa mã hàng--//
//istr_unit[1].s_colname_object = 'item_code'



//--Datawindow chứa các cột cần làm tròn--//
//istr_unit[1].s_dwo_handing = 'd_inventory_line_delivery_grid;"";"";d_inventory_line_delivery_grid;d_goods_delivery_form;'
istr_unit[1].s_dwo_handing = iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default + ';' + ""+ ';' + "" &
								+ ';' + iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default &
								+ ';' + istr_dwo[2].s_dwo_default
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = 'qty;"";"";bc;ex'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
//istr_unit[1].s_dwo_unit = 'd_inventory_line_delivery_grid;"";"";"";""'
istr_unit[1].s_dwo_unit = iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default + ';' + "" + ';' + "" + ';' + "" + ';' + ""
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = 'uom_code;"";"";"";""'
//--Loại làm tròn --//
istr_unit[1].s_type = 'item;"";"";"";""'
//--Datawindow của cột chứa mã hàng--//
istr_unit[1].s_dwo_object =  iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default
//--Cột chứa mã hàng--//
istr_unit[1].s_colname_object = 'item_code'
end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_so'					// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = 	istr_dwo[1].s_dwo_default	//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo =  'd_document_orders_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].b_t_matching = true
istr_dwo_related[1].s_relatedtext_column = 'code'					
istr_dwo_related[1].s_text = 'Đơn bán hàng của : '
istr_dwo_related[1].s_match_f_dwo[1] = 'd_so_line_grid'
istr_dwo_related[1].s_match_t_dwo[1] = iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default
istr_dwo_related[1].s_match_f_column[1] = 'qty'
istr_dwo_related[1].s_match_t_column[1] = 'qty'
istr_dwo_related[1].s_match_column[1] = 'qty'
istr_dwo_related[1].s_match_rf_dwo[1] = 'd_so_line_grid'

istr_dwo_related[1].s_match_f_dwo[2] = 'd_order_catch_grid'
istr_dwo_related[1].s_match_t_dwo[2] = istr_dwo[4].s_dwo_default
istr_dwo_related[1].s_match_f_column[2] = 'catch_qty'
istr_dwo_related[1].s_match_t_column[2] = 'catch_qty'
istr_dwo_related[1].s_match_column[2] = 'qty'
istr_dwo_related[1].s_match_rf_dwo[2] = ''


istr_dwo_related[2].s_related_obj_name = 'u_sal_invoice'					// đối tượng copy đến
istr_dwo_related[2].s_main_obj_dwo = istr_dwo[1].s_dwo_default	//datawindow quan hệ main
istr_dwo_related[2].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[2].s_related_obj_dwo = 'd_document_ar_grid'	// datawindow quan hệ đến
istr_dwo_related[2].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[2].b_f_matching = true
istr_dwo_related[2].b_copy_tax = true
istr_dwo_related[2].s_relatedtext_column = 'code'					
istr_dwo_related[2].s_text = 'HĐ bán : '
istr_dwo_related[2].s_f_obj_column_chk[1] = 'OBJECT_ID'
istr_dwo_related[2].s_t_obj_column_chk[1] = 'ITEM_ID'
istr_dwo_related[2].s_match_f_dwo[1] = 'd_sal_invoice_line_grid'
istr_dwo_related[2].s_match_f_col_obj[1] = 'item_id'
istr_dwo_related[2].s_match_t_dwo[1] = 'd_inventory_line_delivery_grid'
istr_dwo_related[2].s_match_f_column[1] = 'qty'
istr_dwo_related[2].s_match_t_column[1] = 'qty'
istr_dwo_related[2].s_match_column[1] = 'qty'

istr_dwo_related[2].s_main_obj_dwo_copy[1] = iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[1] =  'ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;QTY;QTY;uom_code;TRANS_UOM;warehouse_id;wh_code;wh_name;SPEC_ID;spec_code;spec_name;PRICE;AMOUNT;' +&
																		'ACT_PRICE;ACT_AMOUNT;MARKUP_QTY;MARKUP_AMT;COMM_AMT;NOT_INVOICE;foc_yn;' +&
																		'TAX_PCT;TAX_AMT;TAX_CORRECTION;MARKUP_RETURN;sales_person;MARKUP_PCT;disc_pct;disc_amt;' // cột copy từ
istr_dwo_related[2].s_related_obj_dwo_copy[1] = 'd_sal_invoice_line_grid' // datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[1] = 'object_ID;object_code;object_name;LINE_TEXT;NOTE;QTY;act_qty;uom_code;TRANS_UOM;warehouse_id;warehouse_code;warehouse_name;SPEC_ID;spec_code;spec_name;PRICE;AMOUNT;' +&
																			'ACT_PRICE;ACT_AMOUNT;MARKUP_QTY;MARKUP_AMT;COMM_AMT;NOT_INVOICE;foc_yn;'+&
																			'TAX_PCT;TAX_AMT;TAX_CORRECTION;MARKUP_RETURN;sales_person;MARKUP_PCT;disc_pct;disc_amt;' // cột copy đến
istr_dwo_related[2].b_copy_line[1] = true
//khai báo cộng dồn số lượng
istr_dwo_related[2].b_f_sum[1] = true
istr_dwo_related[2].s_main_obj_column_sum[1] = 'qty;MARKUP_QTY;MARKUP_AMT;COMM_AMT;MARKUP_RETURN;' 
istr_dwo_related[2].s_f_obj_column_chk[1] = 'ITEM_ID;PRICE;NOT_INVOICE;foc_yn;LINE_TEXT;ACT_PRICE;'
istr_dwo_related[2].s_t_obj_column_chk[1] = 'object_ID;PRICE;NOT_INVOICE;foc_yn;LINE_TEXT;ACT_PRICE;'
istr_dwo_related[2].s_main_dr_cr_obj_dwo_sum[1]=''
istr_dwo_related[2].s_main_dr_cr_obj_column_sum[1]=''
//khai bao dw tra hang
istr_dwo_related[2].s_match_rf_dwo[1] = 'd_so_line_grid;d_inventory_line_delivery_grid'
// khai báo cập nhật bản matching
istr_dwo_related[2].s_match_f_dwo[1] = iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default
//istr_dwo_related[2].s_match_f_col_obj[1] = 'item_id' //-- đóng lại vì cho phép phiếu xuất kho kết với đơn hàng dịch vụ
istr_dwo_related[2].s_match_t_dwo[1] = 'd_sal_invoice_line_grid' 
istr_dwo_related[2].s_match_f_column[1] = 'qty'
istr_dwo_related[2].s_match_t_column[1] = 'act_qty'
istr_dwo_related[2].s_match_column[1] = 'qty'
//-- copy thue--//
istr_dwo_related[2].s_main_obj_dwo_copy[2] = 'd_tax_line_grid' 
istr_dwo_related[2].s_main_obj_column_copy[2] = 'tax_type;tax_pct;tax_amt;tax_correction;'																		
istr_dwo_related[2].s_related_obj_dwo_copy[2] = 'd_sal_invoice_line_grid'
istr_dwo_related[2].s_related_obj_column_copy[2] = 'tax_type;tax_pct;tax_amt;tax_correction;'																	
istr_dwo_related[2].s_main_obj_column_chk[2] = 'tax_type;tax_pct;'
istr_dwo_related[2].s_related_obj_column_chk[2] = 'tax_type;tax_pct;'
//istr_dwo_related[2].b_copy_line[2] = true

istr_dwo_related[2].s_main_obj_dwo_copy[3] =  istr_dwo[2].s_dwo_default // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[3] = 'invoice_object;object_code;object_name;trans_address;invoice_object;object_code;object_name;invoice_address;' + &
												 'note;description;trans_date;payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate;invoice_address;invoice_address;invoice_request;include_tax_yn;' // cột copy từ
istr_dwo_related[2].s_related_obj_dwo_copy[3] = 'd_invoice_sal_form' // datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[3] = 'invoice_object;invoice_object_code;invoice_object_name;trans_address;dr_cr_object;dr_cr_object_code;dr_cr_object_name;invoice_address;' + &
												'note;description;trans_date;payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate;trans_address;invoice_address;invoice_request;include_tax_yn;'  // cột copy đến
istr_dwo_related[2].s_main_obj_column_chk[3] = 'object_code;include_tax_yn'
istr_dwo_related[2].s_related_obj_column_chk[3] = 'invoice_object_code;include_tax_yn'

istr_dwo_related[2].s_main_obj_dwo_copy[4] = istr_dwo[6].s_dwo_default // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[4] =  'CHARGE_ID;CHARGE_PCT;TAX_YN;CHARGE_AMT;CHARGE_CURRENCY;EXCHANGE_RATE;CHARGE_BASE_AMT;OBJECT_OFFSET_ID;OBJECT_OFFSET_TABLE;'&
																	+ 'SUBACCOUNT;BENEFICIARY_ID;BENEFICIARY_NAME;OBJECT_CODE;OBJECT_NAME;UOM_CODE;object_offset_code;object_offset_name;'					
istr_dwo_related[2].s_related_obj_dwo_copy[4] = 'd_charge_line_grid' // datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[4] = 'CHARGE_ID;CHARGE_PCT;TAX_YN;CHARGE_AMT;CHARGE_CURRENCY;EXCHANGE_RATE;CHARGE_BASE_AMT;OBJECT_OFFSET_ID;OBJECT_OFFSET_TABLE;'&
																	+ 'SUBACCOUNT;BENEFICIARY_ID;BENEFICIARY_NAME;OBJECT_CODE;OBJECT_NAME;UOM_CODE;object_offset_code;object_offset_name'
istr_dwo_related[2].b_copy_line[4] = false
//-- kiểm tra lại --//
istr_dwo_related[2].s_main_obj_dwo_copy[5] = 'd_tax_line_grid' // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[5] = 'object_code;object_name;tax_id;tax_type;tax_pct;tax_amt;tax_correction;uom_code;TRANS_CURRENCY;exchange_rate;uprow_yn;include_yn;TAX_REPORT_GROUP;'
istr_dwo_related[2].s_related_obj_dwo_copy[5] = 'd_tax_line_grid' // datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[5] = 'object_code;object_name;tax_id;tax_type;tax_pct;tax_amt;tax_correction;uom_code;TRANS_CURRENCY;exchange_rate;uprow_yn;include_yn;TAX_REPORT_GROUP;'
istr_dwo_related[2].b_copy_line[5] = true
istr_dwo_related[2].s_f_obj_column_chk[5] = ''

istr_dwo_related[2].s_t_obj_column_chk[5] = ''

istr_dwo_related[2].s_main_obj_column_chk[5] = ''

istr_dwo_related[2].s_related_obj_column_chk[5] = ''

istr_dwo_related[2].s_match_f_dwo[5] = ''

istr_dwo_related[2].s_match_t_dwo[5] = ''

istr_dwo_related[2].s_match_f_column[5] = ''

istr_dwo_related[2].s_match_t_column[5] = ''

istr_dwo_related[2].s_main_obj_column_sum[5] = ''

istr_dwo_related[2].s_related_obj_column_sum[5] = ''

istr_dwo_related[2].s_match_column[5] = ''

istr_dwo_related[2].s_f_obj_column_chk[5] = ''

istr_dwo_related[2].s_t_obj_column_chk[5] = ''

istr_dwo_related[2].b_f_sum[5] = false

//
istr_dwo_related[3].s_related_obj_name = 'b_view'				// đối tượng copy đến
istr_dwo_related[3].s_main_obj_dwo = 'd_document_inventory_grid'		//datawindow quan hệ main
istr_dwo_related[3].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[3].s_related_obj_dwo = 'dv_so_completion_form'	// datawindow quan hệ đến
istr_dwo_related[3].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[3].s_relatedtext_column = 'code'					
istr_dwo_related[3].s_text = 'Phiếu quyết toán'

istr_dwo_related[4].s_related_obj_name = 'u_item'					// đối tượng copy đến
istr_dwo_related[4].s_main_obj_dwo = 	'd_inventory_line_delivery_grid'	//datawindow quan hệ main
istr_dwo_related[4].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[4].s_related_obj_dwo =  'd_object_grid'	// datawindow quan hệ đến
istr_dwo_related[4].s_related_obj_column = 'item_id'			// cột quan hệ đến
istr_dwo_related[4].s_relatedtext_column = 'code'					
istr_dwo_related[4].s_text = 'Mã hàng của : '

istr_dwo_related[5].s_related_obj_name = 'u_pur_invoice_return'					// đối tượng copy đến
istr_dwo_related[5].s_main_obj_dwo = 'd_document_inventory_grid'		//datawindow quan hệ main
istr_dwo_related[5].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[5].s_related_obj_dwo = 'd_document_ap_grid'	// datawindow quan hệ đến
istr_dwo_related[5].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[5].b_f_matching = true
istr_dwo_related[5].s_relatedtext_column = 'code'					
istr_dwo_related[5].s_text = 'Hóa đơn trả hàng từ: '

istr_dwo_related[5].s_main_obj_dwo_copy[1] = 'd_inventory_line_delivery_grid' // datawindow copy từ
istr_dwo_related[5].s_main_obj_column_copy[1] =  'ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;QTY;uom_code;TRANS_UOM;warehouse_id;wh_code;wh_name;SPEC_ID;spec_code;spec_name;PRICE;AMOUNT;' +&
																		'TAX_PCT;TAX_AMT;TAX_CORRECTION' // cột copy từ
istr_dwo_related[5].s_related_obj_dwo_copy[1] = 'd_pur_invoice_line_grid' // datawindow copy đến
istr_dwo_related[5].s_related_obj_column_copy[1] = 'object_ID;object_code;object_name;LINE_TEXT;NOTE;QTY;uom_code;TRANS_UOM;warehouse_id;warehouse_code;warehouse_name;SPEC_ID;spec_code;spec_name;PRICE;AMOUNT;' +&
																			'TAX_PCT;TAX_AMT;TAX_CORRECTION' // cột copy đến
istr_dwo_related[5].s_main_obj_column_chk[1] = ''
istr_dwo_related[5].s_related_obj_column_chk[1] = ''
istr_dwo_related[5].s_f_obj_column_chk[1] = 'ITEM_ID'
istr_dwo_related[5].s_t_obj_column_chk[1] = 'object_ID'
istr_dwo_related[5].b_copy_line[1] = true
// khai báo cập nhật bản matching
istr_dwo_related[5].s_match_f_dwo[1] = 'd_inventory_line_delivery_grid'
istr_dwo_related[5].s_match_f_col_obj[1] = 'item_id'
istr_dwo_related[5].s_match_t_dwo[1] = 'd_pur_invoice_line_grid' 
istr_dwo_related[5].s_match_f_column[1] = 'qty'
istr_dwo_related[5].s_match_t_column[1] = 'qty'
istr_dwo_related[5].s_match_column[1] = 'qty'
//khai bao lay gia hoa don mua
istr_dwo_related[5].b_get_price=true
istr_dwo_related[5].s_dwo_get_price='d_pur_invoice_line_grid'
istr_dwo_related[5].s_col_get_price[1]='price'
istr_dwo_related[5].s_col_get_qty[1]=''
istr_dwo_related[5].s_dwo_set_price='d_pur_invoice_line_grid'
istr_dwo_related[5].s_col_set_price[1]='price'
istr_dwo_related[5].s_col_set_qty[1]=''

istr_dwo_related[5].s_main_obj_dwo_copy[2] =  istr_dwo[2].s_dwo_default // datawindow copy
istr_dwo_related[5].s_main_obj_column_copy[2] = 'invoice_object;object_code;object_name;trans_address;invoice_object;object_code;object_name;invoice_address;' + &
									'note;description;trans_date;payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate' // cột copy từ
istr_dwo_related[5].s_related_obj_dwo_copy[2] = 'd_invoice_pur_form' // datawindow copy 
istr_dwo_related[5].s_related_obj_column_copy[2] = 'invoice_object;invoice_object_code;invoice_object_name;invoice_address;dr_cr_object;dr_cr_object_code;dr_cr_object_name;trans_address;'+&
									'note;description;trans_date;payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate'  // cột copy đến
istr_dwo_related[5].s_main_obj_column_chk[2] ='object_code;invoice_object'
istr_dwo_related[5].s_related_obj_column_chk[2] ='invoice_object_code;invoice_object'
istr_dwo_related[5].s_match_f_dwo[2] = ''
istr_dwo_related[5].s_match_t_dwo[2] = ''
istr_dwo_related[5].s_match_f_column[2] = ''
istr_dwo_related[5].s_match_t_column[2] = ''
istr_dwo_related[5].s_match_column[2] = ''
istr_dwo_related[5].s_main_obj_column_sum[2] = ''
istr_dwo_related[5].s_related_obj_column_sum[2] = ''
istr_dwo_related[5].s_f_obj_column_chk[2] = ''
istr_dwo_related[5].s_t_obj_column_chk[2] = ''
istr_dwo_related[5].b_f_sum[2] = false
istr_dwo_related[5].b_copy_line[2] = false


istr_dwo_related[6].s_related_obj_name = 'b_view'				// đối tượng copy đến
istr_dwo_related[6].s_main_obj_dwo = 'd_document_inventory_grid'		//datawindow quan hệ main
istr_dwo_related[6].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[6].s_related_obj_dwo = 'dv_goods_delivery_demo_form'	// datawindow quan hệ đến
istr_dwo_related[6].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[6].s_relatedtext_column = 'code'					
istr_dwo_related[6].s_text = 'In phiếu xuất kho demo'

istr_dwo_related[7].s_related_obj_name = 'u_po_return'					// đối tượng copy đến
istr_dwo_related[7].s_main_obj_dwo = 'd_document_inventory_grid'		//datawindow quan hệ main
istr_dwo_related[7].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[7].s_related_obj_dwo = 'd_document_pm_grid'	// datawindow quan hệ đến
istr_dwo_related[7].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[7].b_t_matching = true
istr_dwo_related[7].s_relatedtext_column = 'code'					
istr_dwo_related[7].s_text = 'Đơn trả hàng: '
istr_dwo_related[7].s_match_f_dwo[1] = 'd_po_line_grid'
istr_dwo_related[7].s_match_t_dwo[1] = 'd_inventory_line_delivery_grid'
istr_dwo_related[7].s_match_f_column[1] = 'qty'
istr_dwo_related[7].s_match_t_column[1] = 'qty'
istr_dwo_related[7].s_match_column[1] = 'qty'

istr_dwo_related[8].s_related_obj_name = 'u_map_delivery'
istr_dwo_related[8].s_main_obj_dwo = 'd_inventory_line_delivery_form'
istr_dwo_related[8].s_main_obj_column = 'object_id'
istr_dwo_related[8].s_related_obj_dwo = 'd_address_map_form'
istr_dwo_related[8].s_related_obj_column = 'object_id'


istr_dwo_related[9].s_related_obj_name = 'u_goods_receipt'					// đối tượng copy đến
istr_dwo_related[9].s_main_obj_dwo =  'd_document_inventory_grid'		//datawindow quan hệ main
istr_dwo_related[9].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[9].s_related_obj_dwo = 'd_document_inventory_grid' // datawindow quan hệ đến
istr_dwo_related[9].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[9].b_f_matching = true
istr_dwo_related[9].s_relatedtext_column = 'code'					
istr_dwo_related[9].s_text = 'Phiếu nhập kho : '

istr_dwo_related[9].s_main_obj_dwo_copy[1] =  'd_inventory_line_delivery_grid' // datawindow copy từ
istr_dwo_related[9].s_main_obj_column_copy[1] = 'ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;doc_qty;QTY;price;amount;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;disc_amt;disc_pct;foc_yn;warehouse_id;wh_code;wh_name;cus_code;cus_name;OBJECT_ID' // cột copy từ
istr_dwo_related[9].s_related_obj_dwo_copy[1] = 'd_inventory_line_receipt_grid' // datawindow copy đến
istr_dwo_related[9].s_related_obj_column_copy[1] = 'ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;doc_qty;QTY;price;amount;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;disc_amt;disc_pct;foc_yn;warehouse_id;wh_code;wh_name;vendor_code;vendor_name;OBJECT_ID'  // cột copy đến
istr_dwo_related[9].b_copy_line[1] = true
istr_dwo_related[9].s_main_obj_column_chk[1] = ''
istr_dwo_related[9].s_related_obj_column_chk[1] = ''
istr_dwo_related[9].s_f_obj_column_chk[1] = 'ITEM_ID;PRICE;foc_yn;'
istr_dwo_related[9].s_t_obj_column_chk[1] = 'ITEM_ID;PRICE;foc_yn;'
istr_dwo_related[9].s_match_f_dwo[1] ='d_inventory_line_delivery_grid'
istr_dwo_related[9].s_match_f_col_obj[1] = 'item_id'
istr_dwo_related[9].s_match_t_dwo[1] = 'd_inventory_line_receipt_grid' 
istr_dwo_related[9].s_match_f_column[1] = 'qty'
istr_dwo_related[9].s_match_t_column[1] = 'qty'
istr_dwo_related[9].s_match_column[1] = 'qty'

istr_dwo_related[9].s_main_obj_dwo_copy[2] =  'd_goods_delivery_form' // datawindow copy từ
istr_dwo_related[9].s_main_obj_column_copy[2] ='note;description;trans_date;payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate;trans_address;invoice_address;delivery_person;receipt_person;delivery_mode_code;delivery_mode_name;delivery_mode'  // cột copy từ
istr_dwo_related[9].s_related_obj_dwo_copy[2] = 'd_goods_receipt_form' // datawindow copy đến
istr_dwo_related[9].s_related_obj_column_copy[2] ='note;description;trans_date;payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate;trans_address;invoice_address;delivery_person;receipt_person;delivery_mode_code;delivery_mode_name;delivery_mode'  // cột copy đến

istr_dwo_related[9].s_main_obj_dwo_copy[3] =  'd_lot_line_grid' // datawindow copy từ
istr_dwo_related[9].s_main_obj_column_copy[3] = 'manufacture_date;best_b4_date;qty;out_qty;lot_no;serial_no'
istr_dwo_related[9].s_related_obj_dwo_copy[3] = 'd_lot_line_grid' // datawindow copy đến
istr_dwo_related[9].s_related_obj_column_copy[3] ='manufacture_date;best_b4_date;qty;out_qty;lot_no;serial_no'

istr_dwo_related[9].s_main_obj_column_chk[3] = ''
istr_dwo_related[9].s_related_obj_column_chk[3] = ''
istr_dwo_related[9].s_match_f_dwo[3] = ''
istr_dwo_related[9].s_match_t_dwo[3] = ''
istr_dwo_related[9].s_match_f_column[3] = ''
istr_dwo_related[9].s_match_t_column[3] = ''
istr_dwo_related[9].s_match_column[3] = ''
istr_dwo_related[9].s_main_obj_column_sum[3] = ''
istr_dwo_related[9].s_related_obj_column_sum[3] = ''
istr_dwo_related[9].s_f_obj_column_chk[3] = ''
istr_dwo_related[9].s_t_obj_column_chk[3] = ''
istr_dwo_related[9].b_f_sum[3] = false
istr_dwo_related[9].b_copy_line[3] = false

istr_dwo_related[10].s_related_obj_name = 'b_view'				// đối tượng copy đến
istr_dwo_related[10].s_main_obj_dwo = 'd_document_inventory_grid'		//datawindow quan hệ main
istr_dwo_related[10].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[10].s_related_obj_dwo = 'dv_transfer_form'	// datawindow quan hệ đến
istr_dwo_related[10].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[10].s_relatedtext_column = 'code'					
istr_dwo_related[10].s_text = 'In phiếu XK kiêm VC-NB'

istr_dwo_related[11].s_related_obj_name = 'b_view'				// đối tượng copy đến
istr_dwo_related[11].s_main_obj_dwo = 'd_document_inventory_grid'		//datawindow quan hệ main
istr_dwo_related[11].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[11].s_related_obj_dwo = 'dv_attribute_form'	// datawindow quan hệ đến
istr_dwo_related[11].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[11].s_relatedtext_column = 'code'					
istr_dwo_related[11].s_text = 'In lệnh điều động nội bộ'

istr_dwo_related[12].s_related_obj_name = 'u_so_completion'					// đối tượng copy đến
istr_dwo_related[12].s_main_obj_dwo =  'd_document_inventory_grid'		//datawindow quan hệ main
istr_dwo_related[12].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[12].s_related_obj_dwo = 'd_document_inventory_grid' // datawindow quan hệ đến
istr_dwo_related[12].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[12].b_f_matching = true
istr_dwo_related[12].s_relatedtext_column = 'code'					
istr_dwo_related[12].s_text = 'Nhân bản phiếu quyết toán: '

istr_dwo_related[12].s_main_obj_dwo_copy[1] =  'd_document_inventory_grid'// datawindow copy từ
istr_dwo_related[12].s_main_obj_column_copy[1] = 'object_name;ship_to_object_code;ship_to_object_name;trans_hdr_id;trans_desc;group_name;req_appr_note;appr_note;doc_type;roster_yn;invoice_request;' // cột copy từ
istr_dwo_related[12].s_related_obj_dwo_copy[1] = 'd_document_inventory_grid' // datawindow copy đến
istr_dwo_related[12].s_related_obj_column_copy[1] ='object_name;ship_to_object_code;ship_to_object_name;trans_hdr_id;trans_desc;group_name;req_appr_note;appr_note;doc_type;roster_yn;invoice_request;'  // cột copy đến
istr_dwo_related[12].s_match_f_dwo[1] = 'd_document_inventory_grid'
istr_dwo_related[12].s_match_t_dwo[1] = 'd_document_inventory_grid'

istr_dwo_related[12].s_main_obj_dwo_copy[2] =  'd_inventory_line_delivery_grid' // datawindow copy từ
istr_dwo_related[12].s_main_obj_column_copy[2] = 'ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;doc_qty;QTY;price;amount;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;disc_amt;disc_pct;foc_yn;warehouse_id;wh_code;wh_name;' // cột copy từ
istr_dwo_related[12].s_related_obj_dwo_copy[2] = 'd_inventory_line_delivery_grid' // datawindow copy đến
istr_dwo_related[12].s_related_obj_column_copy[2] = 'ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;doc_qty;QTY;price;amount;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;disc_amt;disc_pct;foc_yn;warehouse_id;wh_code;wh_name;'  // cột copy đến

istr_dwo_related[12].s_main_obj_dwo_copy[3] =  'd_goods_delivery_form' // datawindow copy từ
istr_dwo_related[12].s_main_obj_column_copy[3] ='object_code;object_name;invoice_object;note;description;trans_date;payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate;trans_address;invoice_address;delivery_person;receipt_person;delivery_mode_code;delivery_mode_name;delivery_mode'  // cột copy từ
istr_dwo_related[12].s_related_obj_dwo_copy[3] = 'd_goods_delivery_form' // datawindow copy đến
istr_dwo_related[12].s_related_obj_column_copy[3] ='object_code;object_name;invoice_object;note;description;trans_date;payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate;trans_address;invoice_address;delivery_person;receipt_person;delivery_mode_code;delivery_mode_name;delivery_mode'  // cột copy đến

istr_dwo_related[12].s_main_obj_dwo_copy[4] =  'd_lot_line_grid' // datawindow copy từ
istr_dwo_related[12].s_main_obj_column_copy[4] = 'manufacture_date;best_b4_date;qty;out_qty;lot_no;serial_no'
istr_dwo_related[12].s_related_obj_dwo_copy[4] = 'd_lot_line_grid' // datawindow copy đến
istr_dwo_related[12].s_related_obj_column_copy[4] ='manufacture_date;best_b4_date;qty;out_qty;lot_no;serial_no'
istr_dwo_related[12].s_main_obj_column_chk[4] = ''
istr_dwo_related[12].s_related_obj_column_chk[4] = ''
istr_dwo_related[12].s_match_f_dwo[4] = ''
istr_dwo_related[12].s_match_t_dwo[4] = ''
istr_dwo_related[12].s_match_f_column[4] = ''
istr_dwo_related[12].s_match_t_column[4] = ''
istr_dwo_related[12].s_match_column[4] = ''
istr_dwo_related[12].s_main_obj_column_sum[4] = ''
istr_dwo_related[12].s_related_obj_column_sum[4] = ''
istr_dwo_related[12].s_f_obj_column_chk[4] = ''
istr_dwo_related[12].s_t_obj_column_chk[4] = ''
istr_dwo_related[12].b_f_sum[4] = false
istr_dwo_related[12].b_copy_line[4] = false

istr_dwo_related[13].s_related_obj_name = 'u_assemble'					// đối tượng copy đến
istr_dwo_related[13].s_main_obj_dwo = 'd_document_inventory_grid'		//datawindow quan hệ main
istr_dwo_related[13].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[13].s_related_obj_dwo = 'd_document_inventory_grid' 	// datawindow quan hệ đến
istr_dwo_related[13].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[13].b_t_matching = true
istr_dwo_related[13].s_relatedtext_column = 'code'					
istr_dwo_related[13].s_text = 'Phiếu lắp ráp : '
istr_dwo_related[13].s_match_f_dwo[1] = 'd_material_grid'
istr_dwo_related[13].s_match_t_dwo[1] = 'd_inventory_line_delivery_grid'
istr_dwo_related[13].s_match_f_column[1] = 'qty'
istr_dwo_related[13].s_match_t_column[1] = 'qty'
istr_dwo_related[13].s_match_column[1] = 'qty'

istr_dwo_related[14].s_related_obj_name = 'b_view'				// đối tượng copy đến
istr_dwo_related[14].s_main_obj_dwo = 'd_document_inventory_grid'		//datawindow quan hệ main
istr_dwo_related[14].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[14].s_related_obj_dwo = 'dv_inspection_checklist_form'	// datawindow quan hệ đến
istr_dwo_related[14].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[14].s_relatedtext_column = 'code'					
istr_dwo_related[14].s_text = 'In biên bản nghiệm thu'

istr_dwo_related[15].s_related_obj_name = 'b_view'				// đối tượng copy đến
istr_dwo_related[15].s_main_obj_dwo = 'd_document_inventory_grid'		//datawindow quan hệ main
istr_dwo_related[15].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[15].s_related_obj_dwo = 'dv_goods_delivery_tm_form'	// datawindow quan hệ đến
istr_dwo_related[15].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[15].s_relatedtext_column = 'code'					
istr_dwo_related[15].s_text = 'In phiếu giao hàng'
end subroutine

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name = 'b_so;b_po_return;b_sal_invoice;b_pur_invoice_return;'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_str_streamvalue ();//s_str_streamvalue	lstr_stream[]

//istr_streamvalue[1].s_f_obj_dwo = 'd_inventory_line_delivery_grid'
//istr_streamvalue[1].s_f_obj_column = 'WAREHOUSE_ID'
//istr_streamvalue[1].s_f_column_sv = 'F_OBJECT_ID'
//
//istr_streamvalue[1].s_t_obj_dwo = 'd_inventory_line_delivery_grid'
//istr_streamvalue[1].s_t_obj_column = 'object_id'
//istr_streamvalue[1].s_t_column_sv = 'T_OBJECT_ID'
//
//istr_streamvalue[1].s_item_dwo = 'd_inventory_line_delivery_grid'
//istr_streamvalue[1].s_item_column = 'item_id;spec_id;qty;trans_uom;loc_id'
//istr_streamvalue[1].s_item_column_sv = 'item_id;spec_id;qty;uom_id;loc_id'
//
//istr_streamvalue[1].s_item_lot_dwo = 'd_lot_line_grid'
//istr_streamvalue[1].s_item_lot_column = 'out_qty;lot_no;serial_no;'
//istr_streamvalue[1].s_item_lot_column_sv = 'qty;LOT_NO;SERIAL_NO;'
//
//istr_streamvalue[1].s_currency_dwo = ''
//istr_streamvalue[1].s_currency_column = ''
//istr_streamvalue[1].s_currency_column_sv = ''
//
//istr_streamvalue[1].s_value_dwo = ''
//istr_streamvalue[1].s_value_column = ''
//istr_streamvalue[1].s_value_column_sv = ''

//s_str_streamvalue	lstr_stream[]

istr_streamvalue[1].s_f_obj_dwo = iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default
istr_streamvalue[1].s_f_obj_column = 'WAREHOUSE_ID'
istr_streamvalue[1].s_f_column_sv = 'F_OBJECT_ID'

istr_streamvalue[1].s_t_obj_dwo = istr_dwo[2].s_dwo_default
istr_streamvalue[1].s_t_obj_column = 'invoice_object'
istr_streamvalue[1].s_t_column_sv = 'T_OBJECT_ID'

istr_streamvalue[1].s_item_dwo = iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default
istr_streamvalue[1].s_item_column = 'item_id;spec_id;qty;trans_uom;loc_id'
istr_streamvalue[1].s_item_column_sv = 'item_id;spec_id;qty;uom_id;loc_id'

istr_streamvalue[1].s_item_lot_dwo = iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default
istr_streamvalue[1].s_item_lot_column = 'out_qty;lot_no;serial_no;'
istr_streamvalue[1].s_item_lot_column_sv = 'qty;LOT_NO;SERIAL_NO;'

istr_streamvalue[1].s_currency_dwo = ''
istr_streamvalue[1].s_currency_column = ''
istr_streamvalue[1].s_currency_column_sv = ''

istr_streamvalue[1].s_value_dwo = ''
istr_streamvalue[1].s_value_column = ''
istr_streamvalue[1].s_value_column_sv = ''
end subroutine

public function integer f_reset_fixedpart_grid ();this.iw_display.dynamic f_reset_ii_fixedpart2_height_grid()
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_resize_fixedpart_form ();this.iw_display.dynamic f_reset_ii_fixedpart2_height_form()
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_resize_fixedpart_grid ();//this.iw_display.dynamic f_reset_ii_fixedpart2_height_grid(0)
//this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[]);
if rdw_focus.dataobject = 'd_inventory_line_delivery_grid' then
	ra_args[1] = gs_sob
	return 1
end if
return 0
end function

on c_so_completion.create
call super::create
end on

on c_so_completion.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = true
ib_display_text = false
is_display_model = '5dgb_1tp_1dh'
is_object_title = 'Phiếu quyết toán'
istr_actionpane[1].s_button_name = 'b_add_multi;b_copyt_multi;b_join_multi;b_insert;b_modify;b_save;b_delete;b_cancel;'+&
												'b_view_goods_delivery;b_view_transfer;b_view_attribute;b_view_goods_delivery_sale;b_post;b_unpost;b_savepost;'+&
												'b_send_2_approve;b_request_2_change;b_approve;b_reject;b_release;'
istr_actionpane[1].s_button_has_sub = 'b_add_multi;b_join_multi;b_copyt_multi;b_view_multi;'
istr_actionpane[1].sa_sub_button[1]='b_add;b_copyf_so;b_copyf_assemble;b_copyf_po_return;b_copyf_goods_receipt;b_copyt_seft;'
istr_actionpane[1].sa_sub_button[2]='b_copyl_so;b_copyl_po_return;b_copyl_goods_receipt;b_copyl_assemble;'
istr_actionpane[1].sa_sub_button[3]='b_copyt_sal_invoice;b_copyt_pur_invoice_return;b_copyt_goods_receipt;'
istr_actionpane[1].sa_sub_button[4]='b_view_so_completion;b_view_inspection_checklist;b_view_goods_delivery_tm;'
istr_actionpane[1].sa_enabled_subbutton[]= istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_description = is_object_title
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_join_multi;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_view_multi;b_detail;b_blank;b_copyt_multi;b_blank;b_post;b_release;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_view_multi;b_detail;b_blank;b_copyt_multi;b_blank;b_post;b_release;b_blank;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_view_multi;b_detail;b_blank;b_copyt_multi;b_blank;b_post;b_release;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_view_multi;b_detail;b_blank;b_copyt_multi;b_blank;b_post;b_release;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_view_multi;b_detail;b_blank;b_copyt_multi;b_blank;b_post;b_release;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_view_multi;b_detail;b_blank;b_copyt_multi;b_blank;b_post;b_release;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =  'b_so;b_sal_invoice;'
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

event e_window_e_preopen;call super::e_window_e_preopen;

iw_display.f_set_ii_upperpart_height((iw_display.ii_resize_height - iw_display.tab_action.height - iw_display.dw_filter.height ) *(1/2))
iw_display.f_set_ii_fixedpart2_height(286+50)
iw_display.f_set_ii_fixedpart3_height(iw_display.ii_resize_height*(2/5)*(1/10))
iw_display.f_set_ii_gb_3_height(iw_display.ii_resize_height*(2/5)*(4/5))
iw_display.f_set_ii_gb_4_height(iw_display.ii_resize_height*(2/5)*(7/20))

return 0
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;long		ll_row,ll_line_no,ll_idx

if pos(rpo_dw.dataobject,'d_document') > 0 then
	 rpo_dw.setitem(vl_currentrow,'doc_type','SO_COMPLETION')
elseif pos(rpo_dw.dataobject,'d_goods_delivery') > 0 then
	rpo_dw.setitem(vl_currentrow,'doc_type','SO_COMPLETION')
elseif pos(rpo_dw.dataobject,'d_inventory_line') > 0 then
	rpo_dw.setitem(vl_currentrow,'object_type','item')
	if vl_currentrow = 1 then
		ll_line_no = 1
	else
		ll_line_no = vl_currentrow
		for ll_idx = vl_currentrow + 1 to rpo_dw.rowcount()
			rpo_dw.setitem(ll_idx,'line_no',ll_idx)
		next
	end if
	rpo_dw.setitem(vl_currentrow,'line_no',ll_line_no)
elseif pos(rpo_dw.dataobject,'d_inventory_catch') > 0 then
	rpo_dw.setitem(vl_currentrow,'object_type','item')
end if
return vl_currentrow
end event

event e_dw_e_postretrieve;call super::e_dw_e_postretrieve;//string				ls_object_type
//
//if mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject) -5) = 'd_inventory_line' then
//	ls_object_type = rpo_dw.getitemstring(vl_rowcount,'object_type_1')
//	if isnull(ls_object_type) then rpo_dw.setitem(vl_rowcount,'object_type_1','customer')
//	ls_object_type = rpo_dw.getitemstring(vl_rowcount,'object_type')
//	if isnull(ls_object_type) then rpo_dw.setitem(vl_rowcount,'object_type','item')
//end if
return vl_rowcount
end event

event e_window_open;call super::e_window_open;t_dw_mpl			ldw_main
any				laa_value[]
//--form parm--//
ldw_main = iw_display.f_get_dwmain()
laa_value[1] = '=SO_COMPLETION'
ldw_main.f_add_where('doc_type;',laa_value[])
return 0


end event

event e_dw_e_modifyrow;call super::e_dw_e_modifyrow;t_dw_mpl	ldw_barcode

if pos(rpo_dw.dataobject,'d_inventory_line') > 0 then
	ldw_barcode = iw_display.f_get_dw('d_scan_barcode_form')
	ldw_barcode.event e_modifyrow( )
end if

return AncestorReturnValue
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;any				laa_data[]
long				ll_insertrow,ll_find,ll_qty,ll_qty_master,ll_rtn
string				ls_rbt_ins_del,ls_rbt_seri_lot_no,ls_data,ls_uom_code,ls_item_code,ls_line_text
double			ldc_price,ldc_amount
t_ds_db			lds_lot_line
t_dw_mpl		ldw_lot_line,ldw_master,ldw_trans_date
t_transaction 	lt_transaction

if AncestorReturnValue = 1 then return 1
if isnull(vs_editdata) then vs_editdata = ''

if pos(rpo_dw.dataobject,'d_scan_barcode') > 0 or pos(rpo_dw.dataobject,'d_lot_line') > 0 then
	
	iw_display.f_get_transaction(lt_transaction)
	lds_lot_line = create t_ds_db
	lds_lot_line.dataobject = 'ds_lot_line'
	lds_lot_line.f_settransobject(lt_transaction )
	if pos(rpo_dw.dataobject,'d_lot_line') > 0 then
		ldw_master = rpo_dw.dynamic f_get_idw_master( )
	else
		ldw_lot_line = iw_display.f_get_dw( 'd_lot_line_grid')
		ldw_master = ldw_lot_line.f_get_idw_master( )
	end if
	laa_data[1] = ldw_master.getitemnumber( ldw_master.getrow( ) , 'item_ID')
	laa_data[2]='<>GOODS_TRANSFER'
	lds_lot_line.f_add_where( 'object_id;doc_type', laa_data)
	ll_rtn = lds_lot_line.retrieve( )
	if pos(rpo_dw.dataobject,'d_scan_barcode') > 0 then
		if isnull(vs_editdata) or vs_editdata = '' then return 0
		ls_rbt_ins_del = rpo_dw.getitemstring(vl_currentrow,'rbt_ins_del')
		ls_rbt_seri_lot_no = rpo_dw.getitemstring(vl_currentrow,'rbt_seri_lot_no')
		ldw_lot_line = iw_display.f_get_dw('d_lot_line_grid')
		ldw_master = ldw_lot_line.f_get_idw_master( )
		if vs_colname = 'barcode' then
			ll_qty_master = ldw_master.getitemnumber( ldw_master.getrow( ) , 'qty')
			if ldw_lot_line.rowcount( ) < ll_qty_master then
				if ls_rbt_seri_lot_no = 'serial' then
					ll_find = lds_lot_line.find( 'serial_no = '+"'"+vs_editdata+"'", 1,lds_lot_line.rowcount( ) )
					if ll_find > 0 then
						lds_lot_line.setfilter('serial_no = '+"'"+vs_editdata+"'")
						lds_lot_line.filter( )
						if mod(lds_lot_line.rowcount( ),2 ) = 0 then ll_find = 0
					end if
					//-- rào lại vì tạm thời bỏ qua kiểm tra số serail đã nhập kho (12/12/2014)--//
					//if ll_find > 0 then
						ll_find = ldw_lot_line.find( 'serial_no = '+"'"+trim(vs_editdata)+"'", 1,ldw_lot_line.rowcount( ) )
						if ls_rbt_ins_del = 'insert' then
							if ll_find = 0 then
								if ldw_lot_line.rowcount( ) = 1 then
									ls_data = ldw_lot_line.getitemstring( 1, 'serial_no')
									if isnull(ls_data) or ls_data = '' then 
										ll_insertrow = 1
									else
										ll_insertrow = ldw_lot_line.event e_addrow( )
									end if
								else
									ll_insertrow = ldw_lot_line.event e_addrow( )
								end if
								if ll_insertrow > 0 then
									ldw_lot_line.setitem(ll_insertrow,'serial_no',vs_editdata)
									ldw_lot_line.setitem(ll_insertrow,'out_qty',1)
								else
									messagebox('Lỗi','c_goods_receipt.e_dw_e_itemchanged(line:17)')
									rpo_dw.settext('')
									rpo_dw.setitem(vl_currentrow,'barcode','')
									return 1
								end if
							else
								gf_messagebox('m.c_goods_receipt.e_dw_e_itemchanged.01','Thông báo','Số serial @: '+vs_editdata+' đã tồn tại','exclamation','ok',1)
								rpo_dw.settext('')
								rpo_dw.setitem(vl_currentrow,'barcode','')
								return 1
							end if
						else //--delete--//
							if ll_find > 0 then
								ldw_lot_line.event e_deleterow( ll_find)
							else
								gf_messagebox('m.c_goods_delivery.e_dw_e_itemchanged.02','Thông báo','Số serial @: '+vs_editdata+' không tồn tại','exclamation','ok',1)
								rpo_dw.settext('')
								rpo_dw.setitem(vl_currentrow,'barcode','')
								return 1
							end if
						end if
				//	else
				//		gf_messagebox('m.c_goods_delivery.e_dw_e_itemchanged.03','Thông báo','Số serial @: '+vs_editdata+' chưa nhập kho','exclamation','ok',1)
				//		rpo_dw.settext('')
				//		rpo_dw.setitem(vl_currentrow,'barcode','')
				//		return 1
				//	end if
				else//--lot--//
					if lds_lot_line.find( 'lot_no = '+"'"+vs_editdata+"'", 1,lds_lot_line.rowcount( ) ) > 0 then
						ll_find = ldw_lot_line.find( 'lot_no = '+"'"+vs_editdata+"'", 1,ldw_lot_line.rowcount( ) )
						if ls_rbt_ins_del = 'insert' then	
							if ll_find > 0 then
								ll_qty = ldw_lot_line.getitemnumber( ll_find, 'out_qty')
								if isnull(ll_qty) then ll_qty = 0
								ldw_lot_line.setitem(ll_find,'out_qty',ll_qty + 1)
							else
								if ldw_lot_line.rowcount( ) = 1 then
									ls_data = ldw_lot_line.getitemstring( 1, 'lot_no')
									if isnull(ls_data) or ls_data = '' then 
										ll_insertrow = 1
									else
										ll_insertrow = ldw_lot_line.event e_addrow( )
									end if
								else
									ll_insertrow = ldw_lot_line.event e_addrow( )
								end if
								if ll_insertrow > 0 then
									ldw_lot_line.setitem(ll_insertrow,'lot_no',vs_editdata)
									ldw_lot_line.setitem(ll_insertrow,'out_qty',1)
								else
									messagebox('Lỗi','c_goods_receipt.e_dw_e_itemchanged(line:17)')
									rpo_dw.settext('')
									rpo_dw.setitem(vl_currentrow,'barcode','')
									return 1
								end if
							end if
						else //--delete--//
							if ll_find > 0 then
								ll_qty = ldw_lot_line.getitemnumber( ll_find, 'out_qty')
								if isnull(ll_qty) then ll_qty = 0
								if ll_qty = 1 then
									ldw_lot_line.event e_deleterow( ll_find)
								elseif ll_qty > 1 then
									ldw_lot_line.setitem(ll_find,'out_qty',ll_qty - 1)
								end if
							else
								gf_messagebox('m.c_goods_delivery.e_dw_e_itemchanged.04','Thông báo','Số lô/lot @: '+vs_editdata+' không tồn tại','exclamation','ok',1)
								rpo_dw.settext('')
								rpo_dw.setitem(vl_currentrow,'barcode','')
								return 1
							end if
						end if
					else
						gf_messagebox('m.c_goods_delivery.e_dw_e_itemchanged.05','Thông báo','Số lô/lot @: '+vs_editdata+' chưa nhập kho','exclamation','ok',1)
						rpo_dw.settext('')
						rpo_dw.setitem(vl_currentrow,'barcode','')
						return 1
					end if
				end if
				rpo_dw.settext('')
				rpo_dw.setitem(vl_currentrow,'barcode','')
				return 1
			else
				ls_uom_code = ldw_master.getitemstring( ldw_master.getrow( ) , 'uom_code')
				ls_item_code = ldw_master.getitemstring( ldw_master.getrow( ) , 'item_code')
				ls_line_text = ldw_master.getitemstring( ldw_master.getrow( ) , 'line_text')
				gf_messagebox('m.c_goods_delivery.e_dw_e_itemchanged.06','Thông báo','Mặt hàng '+ls_item_code+' - '+ls_line_text+' đã đủ số lượng '+string(ll_qty_master)+' '+ls_uom_code,'exclamation','ok',1)
				rpo_dw.settext('')
				rpo_dw.setitem(vl_currentrow,'barcode','')
				return 1
			end if
		elseif vs_colname = 'rbt_seri_lot_no' then
			if ls_rbt_seri_lot_no = 'serial' then 
				rpo_dw.object.barcode_t.text =  'Số lô/lot'
			else
				rpo_dw.object.barcode_t.text = 'Số serial'
			end if
			return AncestorReturnValue
		else
			return AncestorReturnValue
		end if
	else
		//ll_find = lds_lot_line.find('serial_no = '+"'"+trim(vs_editdata)+"'",1,lds_lot_line.rowcount( ) )
		if vs_colname = 'serial_no' then
			ll_find = lds_lot_line.find('serial_no = '+"'"+vs_editdata+"'",1,lds_lot_line.rowcount( ) )
			if ll_find > 0 then
				lds_lot_line.setfilter('serial_no = '+"'"+vs_editdata+"'")
				lds_lot_line.filter( )
				if mod(lds_lot_line.rowcount( ),2 ) <> 0 then ll_find = 0
				if ll_find = 0 then ll_find = rpo_dw.find( 'serial_no = '+"'"+trim(vs_editdata)+"'", 1,rpo_dw.rowcount( ) )
				if ll_find > 0 then
					gf_messagebox('m.c_goods_receipt.e_dw_e_itemchanged.07','Thông báo','Số serial @: '+vs_editdata+' đã tồn tại','exclamation','ok',1)
					rpo_dw.settext('')
					return 1
				end if
			else
				gf_messagebox('m.c_goods_receipt.e_dw_e_itemchanged.08','Thông báo','Số serial @: '+vs_editdata+' chưa nhập kho','exclamation','ok',1)
				rpo_dw.settext('')
				return 1
			end if
		elseif vs_colname = 'lot_no' then
			if lds_lot_line.find('lot_no = '+"'"+trim(vs_editdata)+"'",1,lds_lot_line.rowcount( ) ) > 0 then
				if rpo_dw.find( 'lot_no = '+"'"+trim(vs_editdata)+"'", 1,rpo_dw.rowcount( ) ) > 0 then
					gf_messagebox('m.c_goods_receipt.e_dw_e_itemchanged.09','Thông báo','Số lô/lot @: '+vs_editdata+' đã tồn tại','exclamation','ok',1)
					rpo_dw.settext('')
					return 1
				end if
			else
				gf_messagebox('m.c_goods_receipt.e_dw_e_itemchanged.10','Thông báo','Số lô/lot @: '+vs_editdata+' chưa nhập kho','exclamation','ok',1)
				rpo_dw.settext('')
				return 1
			end if
		end if
	end if
elseif pos(rpo_dw.dataobject,'d_inventory_line_delivery') > 0 then
	if vs_colname = 'qty' then
		ldc_price = rpo_dw.getitemnumber(vl_currentrow,'act_price')
		ldc_amount = ldc_price * double(vs_editdata)
		rpo_dw.setitem(vl_currentrow,'act_amount',ldc_amount)
	elseif vs_colname = 'doc_qty' then
		ldc_price = rpo_dw.getitemnumber(vl_currentrow,'price')
		ldc_amount = ldc_price * double(vs_editdata)
		rpo_dw.setitem(vl_currentrow,'amount',ldc_amount)
	end if
elseif pos(rpo_dw.dataobject,'d_document_inventory') > 0 then
	if vs_colname = 'document_date' then
		ldw_trans_date = iw_display.dynamic f_get_dw('d_goods_delivery_form')
		ldw_trans_date.setitem(ldw_trans_date.getrow(),'trans_date', date(vs_editdata))
	end if
end if
return AncestorReturnValue
end event

event e_window_e_postopen;call super::e_window_e_postopen;datawindow	ldw_barcode
t_dw_mpl	ldw_ivt
string			ls_item

ldw_barcode = iw_display.f_get_dw ('d_scan_barcode_form')
if isvalid(ldw_barcode) then 
	if ldw_barcode.rowcount( ) = 0 then
		ldw_barcode.insertrow( 0)
		ldw_barcode.setitem(ldw_barcode.rowcount( ) , 'rbt_seri_lot_no', 'serial')
		ldw_barcode.setitem(ldw_barcode.rowcount( ) , 'rbt_ins_del', 'insert')
	end if
end if
ldw_ivt = iw_display.f_get_dw('d_inventory_line_delivery_grid' )
if isnull(ldw_ivt) then ldw_ivt = iw_display.f_get_dw('d_inventory_line_transfer_grid' )
if ldw_ivt.getrow( ) > 0 then 
	ls_item = ldw_ivt.getitemstring( ldw_ivt.getrow( ) , 'item_code') + ' - ' +  ldw_ivt.getitemstring( ldw_ivt.getrow( ) , 'line_text')
end if
iw_display.f_set_st_1_text('Số serial của: ',ls_item ) 
return AncestorReturnValue
end event

event e_dw_e_postsave;call super::e_dw_e_postsave;t_dw_mpl	ldw_barcode

if pos(rpo_dw.dataobject,'d_inventory_line') > 0 then
	ldw_barcode = iw_display.f_get_dw('d_scan_barcode_form')
	ldw_barcode.f_set_ib_editing( false)
	ldw_barcode.f_set_ib_inserting(false) 
	ldw_barcode.f_set_ib_saving( false)
end if
return 1
//return AncestorReturnValue
end event

event e_dw_e_save;call super::e_dw_e_save;t_dw_mpl	ldw_main
if rpo_dw.dataobject = 'd_scan_barcode_form' then
	ldw_main = iw_display.f_get_dwmain( )
	ldw_main.event e_save( )
	ldw_main.event e_resetupdate( )
	return 0
else
	return 1
end if
end event

event e_dw_getfocus;//-- thêm record mới nếu đang edit nhung rowcount = 1 ( dang grid) --//
//if pos(rdw_handling.dataobject,'d_lot_line') = 0 then
//	if rdw_handling.dynamic f_get_ib_editing() then
//		if rdw_handling.rowcount( ) = 0 then
//			rdw_handling.dynamic event e_addrow( )
//		end if
//	end if
//end if
return 1
end event

event e_dw_e_preinsertrow;call super::e_dw_e_preinsertrow;t_dw_mpl	ldw_master

if pos(rpo_dw.dataobject,'d_lot_line') > 0 then
	ldw_master = rpo_dw.dynamic f_get_idw_master()
	if ldw_master.getitemnumber( ldw_master.getrow( ) ,'qty') <= rpo_dw.rowcount() then return -1
end if
return 0
end event

event e_window_e_view;call super::e_window_e_view;t_dw_mpl	ldw_document
s_str_dwo	lstr_dwo[]
string			ls_trans_desc,ls_doc_type


if rod_relation.classname() = 'b_view' then
	rod_relation.f_get_dwo(lstr_dwo[])
	if lstr_dwo[1].s_dwo_default = 'dv_goods_delivery_demo_form' or lstr_dwo[1].s_dwo_default = 'dv_goods_delivery_form' then	
		ldw_document = iw_display.f_get_dwmain( )
		ls_doc_type =  ldw_document.getitemstring( ldw_document.getrow( ) , 'doc_type')
		ls_trans_desc =  ldw_document.getitemstring( ldw_document.getrow( ) , 'trans_desc')
		if isnull(ls_doc_type) or ls_doc_type = '' then 
			gf_messagebox('m.c_work_order.e_window_e_view.01','Thống báo','Loại đơn hàng chưa được chọn','exclamation','ok',1)
			return -1
		end if
		if pos(lower(ls_trans_desc),'demo') > 0 then
			rs_dwo_view = 'dv_'+lower(ls_doc_type)+'_demo_form'
		else
			rs_dwo_view = 'dv_'+lower(ls_doc_type)+'_form'
		end if
		lstr_dwo[1].s_dwo_default =  rs_dwo_view
		lstr_dwo[1].s_dwo_form =rs_dwo_view
		rod_relation.f_set_dwo_structure(lstr_dwo )			
		return 1
	end if
end if
return 0

end event

event e_dw_rowfocuschanged;call super::e_dw_rowfocuschanged;t_dw_mpl	ldw_main,ldw_ivt
string			ls_item

ldw_main = iw_display.f_get_dwmain( )
if rpo_dw.dataobject = ldw_main.dataobject then
	ldw_ivt = iw_display.f_get_dw('d_inventory_line_delivery_grid' )
	if ldw_ivt.getrow( ) > 0 then 
		ls_item = ldw_ivt.getitemstring( ldw_ivt.getrow( ) , 'item_code') + ' - ' +  ldw_ivt.getitemstring( ldw_ivt.getrow( ) , 'line_text')
	end if
	iw_display.f_set_st_1_text('Số serial của: ',ls_item ) 
elseif rpo_dw.dataobject = 'd_inventory_line_delivery_grid' then
	ls_item = rpo_dw.getitemstring( vl_currentrow , 'item_code') + ' - ' +  rpo_dw.getitemstring( vl_currentrow , 'line_text')
	iw_display.f_set_st_1_text('Số serial của: ',ls_item ) 
end if
return 0
end event

event e_window_e_preunpost;call super::e_window_e_preunpost;any				laa_data[]
long				ll_rtn,ll_find
string				ls_status
double			ldb_so_doc_id,ldb_t_doc_id, ldb_assemble_doc_id, ldb_doc_id
t_ds_db			lds_matching
t_dw_mpl		ldw_main
t_transaction	lt_transaction

iw_display.f_get_transaction(lt_transaction)
lds_matching = create t_ds_db
lds_matching.dataobject = 'ds_matching'
lds_matching.f_settransobject(lt_transaction )
ldw_main = iw_display.f_get_dwmain( )
ldb_t_doc_id = ldw_main.getitemnumber( ldw_main.getrow( ) , 'id')
laa_data[1] = ldb_t_doc_id
lds_matching.f_add_where( 'f_doc_id',laa_data )
ll_rtn = lds_matching.retrieve( )
if ll_rtn > 0 then
	gf_messagebox('m.c_goods_delivery.e_window_e_unpost.01','Thông báo','Phiếu: ' + lds_matching.getitemstring( 1, 'f_doc_code') + ' đã kết với phiếu: ' + lds_matching.getitemstring( 1, 't_doc_code') + ' nên không được sửa ghi sổ' ,'stop','ok',1)
	destroy lds_matching
	return -1
elseif ll_rtn = 0 then
//	ldb_so_doc_id = this.f_get_so_doc_id( "INVENTORY_LINE", double(laa_data[1]))
//	if ldb_so_doc_id > 0 then
//		ldb_doc_id = ldb_so_doc_id
//		ls_status = 'approved'
//	else
//		ldb_assemble_doc_id = this.f_get_assemble_doc_id( "INVENTORY_LINE", double(laa_data[1]))
//		if ldb_assemble_doc_id > 0 then
//			ldb_doc_id = ldb_assemble_doc_id
//			ls_status = 'new'
//		end if
//	end if
//	lds_matching.dataobject = 'ds_matching'
//	lds_matching.f_settransobject(lt_transaction )
//	laa_data[1] = ldb_so_doc_id
//	lds_matching.f_add_where( 'f_doc_id',laa_data )
//	ll_rtn = lds_matching.retrieve( )
//	ll_find = lds_matching.find( "t_doc_id <>" + string(ldb_t_doc_id), 1, ll_rtn)
//	if ll_find > 0 then
//		if upper(this.f_get_doc_status(lds_matching.getitemnumber( ll_find, 't_doc_id') )) = 'BOOKED' then ls_status = 'partial_issue'
//	end if
//	update document
//	set status = :ls_status
//	where id = :ldb_so_doc_id using lt_transaction;
//	destroy lds_matching
//	return 1
end if
return 0
end event

event e_window_e_prepost;call super::e_window_e_prepost;/*********************************************************************************************************************
Chức năng: kiểm tra logic ghi sổ của phiếu xuất kho
	- PXK kết với hóa đơn bán (PXK tạo từ HĐ: hóa đơn xuất trước giao hàng): phải chỉ chọn ghi sổ SL ; ngày ghi sổ PXK <= ngày ghi sổ HĐ (cho phép xuất âm)
	- PXK độc lập: không được phép chỉ chọn ghi sổ giá trị mà không chọn số lượng nhưng có thể ghi số cả 2 (SL và GT)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

========================================================================================================*/
int				li_cnt, li_idx
double		ladb_related_doc_id[], ldb_doc_id, ldb_cust_id
string			ls_doctype_related, ls_doc_code_related, ls_doctype, ls_doc_code, ls_status_related, ls_qty_yn
string			ls_value_yn,ls_invoice_no[], ls_msg, ls_status
date			ld_bookeddate_related, ld_bookeddate,  ld_invoice_date[], ld_due_date[], ld_trans_date


t_dw_mpl			ldw_main, ldw_line
c_dwservice			lc_dwservice
b_obj_instantiate	lb_obj
c_string				lc_string

ldw_main = this.iw_display.f_get_dwmain( )
ldb_doc_id = ldw_main.getitemnumber(ldw_main.getrow( ), 'id')
ls_status = ldw_main.getitemstring(ldw_main.getrow( ), 'status')
lc_dwservice.f_get_qty_and_value_yn(ldb_doc_id, ls_qty_yn, ls_value_yn)

//-- kiểm tra hạn mức tín dụng --//
if ls_status <> 'released' then
	ldw_line = this.iw_display.f_get_dw( 'd_inventory_line_delivery_grid')
	if not isnull(ldw_line) and ldw_line.rowcount() > 0 then
		ldb_cust_id = ldw_line.getitemnumber( 1, 'object_id')
		li_cnt = lb_obj.f_get_cust_overdue_invoice( ldb_cust_id, ld_trans_date, ls_invoice_no[],ld_invoice_date[], ld_due_date[] )
		if li_cnt > 0 then
			lc_string.f_arraytostring( ls_invoice_no[], ';', ls_msg)
			ls_msg += 'Ngày hóa đơn: '
			lc_string.f_arraytostring( ld_invoice_date[], ';', ls_msg)
			ls_msg += 'Ngày tới hạn thanh toán: '
			lc_string.f_arraytostring( ld_due_date[], ';', ls_msg)
			update document set status = 'hold' where id = :ldb_doc_id using sqlca; 
			commit using sqlca;
			gf_messagebox('m.c_goods_delivery.e_window_e_prepost.01','Thông báo','Khách hàng vượt quá hạn mức tín dụng không thể xuất kho, hóa đơn:@'+ls_msg ,'exclamation','ok',1)		
			return -1
		end if
	end if
end if

li_cnt = this.f_get_f_doc_id(ldb_doc_id,ladb_related_doc_id[] )
if li_cnt = 0 then li_cnt = this.f_get_t_doc_id(ldb_doc_id,ladb_related_doc_id[] )
if li_cnt >  0 then
	this.f_get_doc_info(ldb_doc_id, ls_doctype, ld_bookeddate, ls_status, ls_doc_code)
	FOR li_idx = 1 to li_cnt
		this.f_get_doc_info(ladb_related_doc_id[li_idx], ls_doctype_related, ld_bookeddate_related,ls_status_related, ls_doc_code_related)
		if ls_doctype_related = 'SAL_INVOICE' then
			if ls_value_yn = 'Y' then
				gf_messagebox('m.c_goods_delivery.e_window_e_prepost.02','Thông báo','Phiếu xuất kho có kết hóa đon không được ghi sổ giá trị, số HĐ:@'+ls_doc_code_related,'exclamation','ok',1)
				return -1				
			end if
//			if ls_status_related = 'new'  then
//				gf_messagebox('m.c_goods_delivery.e_window_e_prepost.03','Thông báo','Hóa đơn của phiếu xuất kho chưa ghi sổ:@'+ls_doc_code_related,'exclamation','ok',1)
//				return -1
//			end if
			if ld_bookeddate_related < ld_bookeddate then
				gf_messagebox('m.c_goods_delivery.e_window_e_prepost.04','Thông báo','Ngày ghi sổ của phiếu xuất kho phải trước hoặc bằng ngày ghi sổ hóa đơn, HĐ số:@' &
				+ls_doc_code_related+'@-ngày:'+ string(ld_bookeddate_related, gs_w_date_format ),'exclamation','ok',1)
				return -1
			end if
		elseif ls_doctype_related = 'SO' or ls_doctype_related = 'SO_DEMO' then
			if ls_status_related = 'new' or ls_status_related = 'req_approve' or  ls_status_related = 'req_approve' or  ls_status_related = 'rejected' then
				gf_messagebox('m.c_goods_delivery.e_window_e_prepost.05','Thông báo','Đơn hàng của phiếu xuất kho chưa duyệt:@'+ls_doc_code_related,'exclamation','ok',1)
				return -1
			end if
		end if
	NEXT
else 
	if ls_qty_yn = 'N' and ls_value_yn = 'Y' then
		gf_messagebox('m.c_goods_delivery.e_window_e_prepost.05','Thông báo','Phiếu xuất kho không được phép ghi sổ giá trị mà không ghi sổ số lượng !' ,'exclamation','ok',1)
		return -1		
	end if
end if
return 0

end event

event e_dw_clicked;call super::e_dw_clicked;
if rdw_handling.dataobject = 'd_goods_delivery_form' then
	if vs_colname = 't_expand' then
		this.f_expand_dw( rdw_handling,vs_colname, 668 + 50)
//		if iw_display.f_get_ii_upperpart_height( ) > 860+ 60 then
//			iw_display. f_set_ii_fixedpart2_height(860+60,true)  
//		else
//			iw_display. f_set_ii_fixedpart2_height(860+60,true)
//			iw_display.f_set_ii_upperpart_height( 860+60 + 150 , true)
//		end if
//		rdw_handling.object.t_expand.visible = false
//		rdw_handling.object.t_colapse.visible = true
//		iw_display.f_resize( this.is_display_model )
	elseif vs_colname = 't_colapse' then
		this.f_expand_dw( rdw_handling,vs_colname, 284+50)
//		iw_display. f_set_ii_fixedpart2_height(384+60,true)  
//		rdw_handling.object.t_expand.visible = true
//		rdw_handling.object.t_colapse.visible = false
//		iw_display.f_resize( this.is_display_model )
	end if
end if
return 0
end event

event e_window_closequery;//-- OVERRIDE --//

t_dw_mpl 			ldw_booked_slip


ldw_booked_slip = iw_display.f_get_dw( 'd_goods_delivery_form')
if ldw_booked_slip.describe("t_colapse.visible") = '1' then
	iw_display. f_set_ii_fixedpart2_height(286+50,true)
end if

if iw_display.dynamic f_update_userprofile() = -1 then
	return -1
end if
return 0
end event

