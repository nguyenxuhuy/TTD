$PBExportHeader$c_item1.sru
forward
global type c_item1 from s_object_display
end type
end forward

global type c_item1 from s_object_display
end type
global c_item1 c_item1

forward prototypes
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_related ()
public function integer f_update_moving_avg (double vdb_item_id, double vdb_moving_avg, ref t_transaction rt_transaction)
public function double f_get_moving_avg (double vdb_item_id)
public function integer f_update_round_diff (double vdb_item_id, double vdb_round_diff, ref t_transaction rt_transaction)
public function double f_get_round_diff (double vdb_item_id)
public function boolean f_is_managed_qty (double vdb_item_id)
public function integer f_get_lot_or_serial_yn (double vdb_item_id, ref string rs_lot_yn, ref string rs_serial_yn)
public subroutine f_set_dwo_tabpage ()
public function integer f_get_retail_price (double vdb_item_id, double vdb_qty, double vdb_object_id, double vdb_currency, string vs_purchase_sales, date vd_trans_date, ref double rdc_price)
public function integer f_get_link_item (double vdb_item_id, ref double vadb_lnk_item[], ref double vadb_lnk_spec[], ref double vadb_lnk_qty[], ref t_transaction rt_transaction)
public function integer f_get_link_item (double vdb_item_id, double vdb_spec_id, ref double vadb_lnk_item[], ref double vadb_lnk_spec[], ref double vadb_lnk_qty[], ref t_transaction rt_transaction)
public function integer f_get_wholesales_price (double vdb_item_id, double vdb_qty, double vdb_currency_id, string vs_purchase_sales, date vd_trans_date, double vdb_customer_id, double vdb_sales_person, ref double rdb_wholesales_price)
public function integer f_get_discount (double vdb_item_id, double vdb_qty, double vdb_currency_id, string vs_purchase_sales, date vd_trans_date, double vdb_customer_id, double vdb_sales_person, ref double rdb_discount_amount, ref integer ri_discount_pct)
public function integer f_caculation_disc (double vdb_sales_price, ref double rdb_discount_amount, ref integer ri_discount_pct, ref double rdb_discount_price)
end prototypes

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name =  'b_so;b_goods_delivery;b_sal_invoice;b_po;b_goods_receipt;b_pur_invoice;'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_button_name =  'b_book;b_note;b_doc_trace;b_user_trace;'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'

end subroutine

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_object_grid'
istr_dwo[1].s_dwo_form = 'd_object_form'
istr_dwo[1].s_dwo_grid = 'd_object_grid'
//istr_dwo[1].b_master = true
//istr_dwo[1].b_detail = false
//istr_dwo[1].b_cascade_del = true
//istr_dwo[1].s_dwo_details = 'd_item_form;d_item_spec_grid;'
//istr_dwo[1].s_dwo_master = ''
//istr_dwo[1].s_master_keycol = ''
//istr_dwo[1].s_detail_keycol = ''
//istr_dwo[1].b_ref_table_yn  = true
//istr_dwo[1].s_ref_table_field = 'object_ref_table'
istr_dwo[1].b_master = true
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_item_form;d_item_spec_grid;d_object_images_grid;'
istr_dwo[1].s_dwo_shared = ''
istr_dwo[1].s_dwo_master = ''
istr_dwo[1].s_master_keycol = ''
istr_dwo[1].s_detail_keycol = ''
istr_dwo[1].b_ref_table_yn  = true
istr_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_gb_name = 'gb_6'
istr_dwo[1].s_description = 'sản phẩm - hàng hóa - dịch vụ'

istr_dwo[2].s_dwo_default =  'd_item_form'
istr_dwo[2].s_dwo_form = 'd_item_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_detail = true
istr_dwo[2].b_master = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].b_shared = false
istr_dwo[2].s_dwo_master = 'd_object_grid;'
istr_dwo[2].s_dwo_details = 'd_item_purchase_price_grid;d_item_sales_price_grid;d_item_barcode_grid;d_item_catch_grid;d_coupon_serial_grid;'
istr_dwo[2].s_master_keycol = 'ID;'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[2].b_ref_table_yn  = true
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE'
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
istr_dwo[2].s_description = 'Thuộc tính sản phẩm'
istr_dwo[2].s_pic_ref_table = ''
istr_dwo[2].s_pic_ref_field = ''

end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_so'					// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = 	'd_object_grid'	//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo =  'd_so_line_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'item_id'			// cột quan hệ đến
istr_dwo_related[1].s_relatedtext_column = 'code'					
istr_dwo_related[1].s_text = 'Đơn bán hàng của : '
istr_dwo_related[1].s_main_obj_dwo_copy[1] = 'd_object_grid' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[1] =  'ID;code;name;' // cột copy từ
istr_dwo_related[1].s_related_obj_dwo_copy[1] = 'd_so_line_grid' // datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[1] = 'item_ID;object_code;LINE_TEXT;' // cột copy đến

istr_dwo_related[1].s_main_obj_dwo_copy[2] = 'd_item_form' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[2] =  'stock_uom;uom_code;' // cột copy từ
istr_dwo_related[1].s_related_obj_dwo_copy[2] = 'd_so_line_grid' // datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[2] = 'trans_uom;uom_code;' // cột copy đến


istr_dwo_related[1].s_main_obj_column_chk[2] = ''
istr_dwo_related[1].s_related_obj_column_chk[2] = ''
istr_dwo_related[1].s_match_f_dwo[2] = ''
istr_dwo_related[1].s_match_t_dwo[2] = ''
istr_dwo_related[1].s_match_f_column[2] = ''
istr_dwo_related[1].s_match_t_column[2] = ''
istr_dwo_related[1].s_match_column[2] = ''
istr_dwo_related[1].s_main_obj_column_sum[2] = ''
istr_dwo_related[1].s_related_obj_column_sum[2] = ''
istr_dwo_related[1].b_f_sum[2] = false
istr_dwo_related[1].s_f_obj_column_chk[2] = ''
istr_dwo_related[1].s_t_obj_column_chk[2] = ''

istr_dwo_related[2].s_related_obj_name = 'u_po'					// đối tượng copy đến
istr_dwo_related[2].s_main_obj_dwo = 	'd_object_grid'	//datawindow quan hệ main
istr_dwo_related[2].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[2].s_related_obj_dwo =  'd_po_line_grid'	// datawindow quan hệ đến
istr_dwo_related[2].s_related_obj_column = 'item_id'			// cột quan hệ đến
istr_dwo_related[2].s_relatedtext_column = 'code'					
istr_dwo_related[2].s_text = 'Đơn đặt mua của : '
istr_dwo_related[2].s_main_obj_dwo_copy[1] = 'd_object_grid' // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[1] =  'ID;code;name;' // cột copy từ
istr_dwo_related[2].s_related_obj_dwo_copy[1] = 'd_po_line_grid' // datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[1] = 'item_ID;item_code;LINE_TEXT;' // cột copy đến

istr_dwo_related[2].s_main_obj_dwo_copy[2] = 'd_item_form' // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[2] =  'stock_uom;uom_code;' // cột copy từ
istr_dwo_related[2].s_related_obj_dwo_copy[2] = 'd_po_line_grid' // datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[2] = 'trans_uom;uom_code;' // cột copy đến

istr_dwo_related[2].s_main_obj_column_chk[2] = ''
istr_dwo_related[2].s_related_obj_column_chk[2] = ''
istr_dwo_related[2].s_match_f_dwo[2] = ''
istr_dwo_related[2].s_match_t_dwo[2] = ''
istr_dwo_related[2].s_match_f_column[2] = ''
istr_dwo_related[2].s_match_t_column[2] = ''
istr_dwo_related[2].s_match_column[2] = ''
istr_dwo_related[2].s_main_obj_column_sum[2] = ''
istr_dwo_related[2].s_related_obj_column_sum[2] = ''
istr_dwo_related[2].b_f_sum[2] = false
istr_dwo_related[2].s_f_obj_column_chk[2] = ''
istr_dwo_related[2].s_t_obj_column_chk[2] = ''

istr_dwo_related[3].s_related_obj_name = 'u_goods_receipt'					// đối tượng copy đến
istr_dwo_related[3].s_main_obj_dwo = 	'd_object_grid'	//datawindow quan hệ main
istr_dwo_related[3].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[3].s_related_obj_dwo =  'd_inventory_line_receipt_grid'	// datawindow quan hệ đến
istr_dwo_related[3].s_related_obj_column = 'item_id'			// cột quan hệ đến
istr_dwo_related[3].s_relatedtext_column = 'code'					
istr_dwo_related[3].s_text = 'Phiếu xuất kho của : '
istr_dwo_related[3].s_main_obj_dwo_copy[1] = 'd_object_grid' // datawindow copy từ
istr_dwo_related[3].s_main_obj_column_copy[1] =  'ID;code;name;' // cột copy từ
istr_dwo_related[3].s_related_obj_dwo_copy[1] = 'd_inventory_line_receipt_grid' // datawindow copy đến
istr_dwo_related[3].s_related_obj_column_copy[1] = 'item_ID;item_code;LINE_TEXT;' // cột copy đến

istr_dwo_related[3].s_main_obj_dwo_copy[2] = 'd_item_form' // datawindow copy từ
istr_dwo_related[3].s_main_obj_column_copy[2] =  'stock_uom;uom_code;' // cột copy từ
istr_dwo_related[3].s_related_obj_dwo_copy[2] = 'd_inventory_line_receipt_grid' // datawindow copy đến
istr_dwo_related[3].s_related_obj_column_copy[2] = 'trans_uom;uom_code;' // cột copy đến

istr_dwo_related[3].s_main_obj_column_chk[2] = ''
istr_dwo_related[3].s_related_obj_column_chk[2] = ''
istr_dwo_related[3].s_match_f_dwo[2] = ''
istr_dwo_related[3].s_match_t_dwo[2] = ''
istr_dwo_related[3].s_match_f_column[2] = ''
istr_dwo_related[3].s_match_t_column[2] = ''
istr_dwo_related[3].s_match_column[2] = ''
istr_dwo_related[3].s_main_obj_column_sum[2] = ''
istr_dwo_related[3].s_related_obj_column_sum[2] = ''
istr_dwo_related[3].b_f_sum[2] = false
istr_dwo_related[3].s_f_obj_column_chk[2] = ''
istr_dwo_related[3].s_t_obj_column_chk[2] = ''

istr_dwo_related[4].s_related_obj_name = 'u_goods_delivery'					// đối tượng copy đến
istr_dwo_related[4].s_main_obj_dwo = 	'd_object_grid'	//datawindow quan hệ main
istr_dwo_related[4].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[4].s_related_obj_dwo =  'd_inventory_line_delivery_grid'	// datawindow quan hệ đến
istr_dwo_related[4].s_related_obj_column = 'item_id'			// cột quan hệ đến
istr_dwo_related[4].s_relatedtext_column = 'code'					
istr_dwo_related[4].s_text = 'Phiếu xuất kho của : '
istr_dwo_related[4].s_main_obj_dwo_copy[1] = 'd_object_grid' // datawindow copy từ
istr_dwo_related[4].s_main_obj_column_copy[1] =  'ID;code;name;' // cột copy từ
istr_dwo_related[4].s_related_obj_dwo_copy[1] = 'd_inventory_line_delivery_grid' // datawindow copy đến
istr_dwo_related[4].s_related_obj_column_copy[1] = 'item_ID;item_code;LINE_TEXT;' // cột copy đến

istr_dwo_related[4].s_main_obj_dwo_copy[2] = 'd_item_form' // datawindow copy từ
istr_dwo_related[4].s_main_obj_column_copy[2] =  'stock_uom;uom_code;' // cột copy từ
istr_dwo_related[4].s_related_obj_dwo_copy[2] = 'd_inventory_line_delivery_grid' // datawindow copy đến
istr_dwo_related[4].s_related_obj_column_copy[2] = 'trans_uom;uom_code;' // cột copy đến

istr_dwo_related[4].s_main_obj_column_chk[2] = ''
istr_dwo_related[4].s_related_obj_column_chk[2] = ''
istr_dwo_related[4].s_match_f_dwo[2] = ''
istr_dwo_related[4].s_match_t_dwo[2] = ''
istr_dwo_related[4].s_match_f_column[2] = ''
istr_dwo_related[4].s_match_t_column[2] = ''
istr_dwo_related[4].s_match_column[2] = ''
istr_dwo_related[4].s_main_obj_column_sum[2] = ''
istr_dwo_related[4].s_related_obj_column_sum[2] = ''
istr_dwo_related[4].b_f_sum[2] = false
istr_dwo_related[4].s_f_obj_column_chk[2] = ''
istr_dwo_related[4].s_t_obj_column_chk[2] = ''

istr_dwo_related[5].s_related_obj_name = 'u_pur_invoice'					// đối tượng copy đến
istr_dwo_related[5].s_main_obj_dwo = 	'd_object_grid'	//datawindow quan hệ main
istr_dwo_related[5].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[5].s_related_obj_dwo =  'd_pur_invoice_line_grid'	// datawindow quan hệ đến
istr_dwo_related[5].s_related_obj_column = 'object_id'			// cột quan hệ đến
istr_dwo_related[5].s_relatedtext_column = 'code'					
istr_dwo_related[5].s_text = 'Hoá đơn mua của : '
istr_dwo_related[5].s_main_obj_dwo_copy[1] = 'd_object_grid' // datawindow copy từ
istr_dwo_related[5].s_main_obj_column_copy[1] =  'ID;code;name;' // cột copy từ
istr_dwo_related[5].s_related_obj_dwo_copy[1] = 'd_pur_invoice_line_grid' // datawindow copy đến
istr_dwo_related[5].s_related_obj_column_copy[1] = 'object_ID;object_code;LINE_TEXT;' // cột copy đến

istr_dwo_related[5].s_main_obj_dwo_copy[2] = 'd_item_form' // datawindow copy từ
istr_dwo_related[5].s_main_obj_column_copy[2] =  'stock_uom;uom_code;' // cột copy từ
istr_dwo_related[5].s_related_obj_dwo_copy[2] = 'd_pur_invoice_line_grid' // datawindow copy đến
istr_dwo_related[5].s_related_obj_column_copy[2] = 'trans_uom;uom_code;' // cột copy đến

istr_dwo_related[5].s_main_obj_column_chk[2] = ''
istr_dwo_related[5].s_related_obj_column_chk[2] = ''
istr_dwo_related[5].s_match_f_dwo[2] = ''
istr_dwo_related[5].s_match_t_dwo[2] = ''
istr_dwo_related[5].s_match_f_column[2] = ''
istr_dwo_related[5].s_match_t_column[2] = ''
istr_dwo_related[5].s_match_column[2] = ''
istr_dwo_related[5].s_main_obj_column_sum[2] = ''
istr_dwo_related[5].s_related_obj_column_sum[2] = ''
istr_dwo_related[5].b_f_sum[2] = false
istr_dwo_related[5].s_f_obj_column_chk[2] = ''
istr_dwo_related[5].s_t_obj_column_chk[2] = ''

istr_dwo_related[6].s_related_obj_name = 'u_sal_invoice'					// đối tượng copy đến
istr_dwo_related[6].s_main_obj_dwo = 	'd_object_grid'	//datawindow quan hệ main
istr_dwo_related[6].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[6].s_related_obj_dwo =  'd_sal_invoice_line_grid'	// datawindow quan hệ đến
istr_dwo_related[6].s_related_obj_column = 'object_id'			// cột quan hệ đến
istr_dwo_related[6].s_relatedtext_column = 'code'					
istr_dwo_related[6].s_text = 'Hóa đơn bán của : '
istr_dwo_related[6].s_main_obj_dwo_copy[1] = 'd_object_grid' // datawindow copy từ
istr_dwo_related[6].s_main_obj_column_copy[1] =  'ID;code;name;' // cột copy từ
istr_dwo_related[6].s_related_obj_dwo_copy[1] = 'd_sal_invoice_line_grid' // datawindow copy đến
istr_dwo_related[6].s_related_obj_column_copy[1] = 'object_ID;object_code;LINE_TEXT;' // cột copy đến

istr_dwo_related[6].s_main_obj_dwo_copy[2] = 'd_item_form' // datawindow copy từ
istr_dwo_related[6].s_main_obj_column_copy[2] =  'stock_uom;uom_code;' // cột copy từ
istr_dwo_related[6].s_related_obj_dwo_copy[2] = 'd_sal_invoice_line_grid' // datawindow copy đến
istr_dwo_related[6].s_related_obj_column_copy[2] = 'trans_uom;uom_code;' // cột copy đến

istr_dwo_related[6].s_main_obj_column_chk[2] = ''
istr_dwo_related[6].s_related_obj_column_chk[2] = ''
istr_dwo_related[6].s_match_f_dwo[2] = ''
istr_dwo_related[6].s_match_t_dwo[2] = ''
istr_dwo_related[6].s_match_f_column[2] = ''
istr_dwo_related[6].s_match_t_column[2] = ''
istr_dwo_related[6].s_match_column[2] = ''
istr_dwo_related[6].s_main_obj_column_sum[2] = ''
istr_dwo_related[6].s_related_obj_column_sum[2] = ''
istr_dwo_related[6].b_f_sum[2] = false
istr_dwo_related[6].s_f_obj_column_chk[2] = ''
istr_dwo_related[6].s_t_obj_column_chk[2] = ''

istr_dwo_related[7].s_related_obj_name = 'u_item'					// đối tượng copy đến
istr_dwo_related[7].s_main_obj_dwo = 	'd_object_grid'	//datawindow quan hệ main
istr_dwo_related[7].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[7].s_related_obj_dwo =  'd_object_grid'	// datawindow quan hệ đến
istr_dwo_related[7].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[7].s_relatedtext_column = 'code'					
istr_dwo_related[7].s_text = 'Nhân bản khai báo mã hàng : '
istr_dwo_related[7].s_main_obj_dwo_copy[1] = 'd_object_grid' // datawindow copy từ
istr_dwo_related[7].s_main_obj_column_copy[1] =  'code;short_name;name;active_yn;group_code;group_name;posting_code;posting_name;MANAGE_GROUP;POSTING_GROUP;' // cột copy từ
istr_dwo_related[7].s_related_obj_dwo_copy[1] = 'd_object_grid' // datawindow copy đến
istr_dwo_related[7].s_related_obj_column_copy[1] =   'code;short_name;name;active_yn;group_code;group_name;posting_code;posting_name;MANAGE_GROUP;POSTING_GROUP;' // cột copy đến
istr_dwo_related[7].s_match_f_dwo[1] = 'd_object_grid'
istr_dwo_related[7].s_match_t_dwo[1] ='d_object_grid'

istr_dwo_related[7].s_main_obj_dwo_copy[2] = 'd_item_form' // datawindow copy từ
istr_dwo_related[7].s_main_obj_column_copy[2] =  'uom_code;uom_name;rounding_code;rounding_name;manufacturers;address;origin;cost_method;'+&
																			'quantity_yn;value_yn;lot_yn;serial_yn;STOCK_UOM;round_id' // cột copy từ
istr_dwo_related[7].s_related_obj_dwo_copy[2] = 'd_item_form' // datawindow copy đến
istr_dwo_related[7].s_related_obj_column_copy[2] =   'uom_code;uom_name;rounding_code;rounding_name;manufacturers;address;origin;cost_method;'+&
																			'quantity_yn;value_yn;lot_yn;serial_yn;STOCK_UOM;round_id'  // cột copy đến
istr_dwo_related[7].s_main_obj_dwo_copy[3] = 'd_item_spec_grid' // datawindow copy từ
istr_dwo_related[7].s_main_obj_column_copy[3] =  'spec_group;code;name;length;width;depth;color;net_weight;gross_weight;tare_weight;density;other_spec;other_desc'
istr_dwo_related[7].s_related_obj_dwo_copy[3] = 'd_item_spec_grid' // datawindow copy đến
istr_dwo_related[7].s_related_obj_column_copy[3] =   'spec_group;code;name;length;width;depth;color;net_weight;gross_weight;tare_weight;density;other_spec;other_desc'

istr_dwo_related[7].s_main_obj_dwo_copy[4] = 'd_item_catch_grid' // datawindow copy từ
istr_dwo_related[7].s_main_obj_column_copy[4] =  'spec_codespec_code;spec_name;catch_code;catch_short_name;catch_name;catch_qty;uom_code;spec_id;item_id;catch_uom'
istr_dwo_related[7].s_related_obj_dwo_copy[4] = 'd_item_catch_grid' // datawindow copy đến
istr_dwo_related[7].s_related_obj_column_copy[4] =   'spec_codespec_code;spec_name;catch_code;catch_short_name;catch_name;catch_qty;uom_code;spec_id;item_id;catch_uom'

istr_dwo_related[7].s_main_obj_column_chk[4] = ''
istr_dwo_related[7].s_related_obj_column_chk[4] = ''
istr_dwo_related[7].s_f_obj_column_chk[4] = ''
istr_dwo_related[7].s_t_obj_column_chk[4] = ''
istr_dwo_related[7].s_match_f_dwo[4] = '' 
istr_dwo_related[7].s_match_t_dwo[4] =''
istr_dwo_related[7].s_match_f_column[4] = ''
istr_dwo_related[7].s_match_t_column[4] = ''
istr_dwo_related[7].s_match_column[4] = ''
istr_dwo_related[7].s_main_obj_column_sum[4] = ''
istr_dwo_related[7].s_related_obj_column_sum[4] = ''
istr_dwo_related[7].b_f_sum[4] = false


end subroutine

public function integer f_update_moving_avg (double vdb_item_id, double vdb_moving_avg, ref t_transaction rt_transaction);double			ldb_moving_avg
string				ls_item_code

if isnull(vdb_item_id) or vdb_item_id = 0 then return 0
if isnull(vdb_moving_avg) then vdb_moving_avg = 0


update item set moving_avg = :vdb_moving_avg where object_ref_id = :vdb_item_id using rt_transaction;
if rt_transaction.sqlcode = -1 then
	rollback using rt_transaction;
	ls_item_code = this.f_get_code(vdb_item_id )
	gf_messagebox('m.c_item.f_update_moving_avg.01','Thông báo','Không cập nhật được giá bình quân di động của mặt hàng:@'+ls_item_code,'stop','ok',1)
	return -1
else
	return 1
end if
end function

public function double f_get_moving_avg (double vdb_item_id);double			ldb_moving_avg


if isnull(vdb_item_id) or vdb_item_id = 0 then return -1

select moving_avg into :ldb_moving_avg from item where object_ref_id = :vdb_item_id using sqlca;

if isnull(ldb_moving_avg) then ldb_moving_avg = 0

return ldb_moving_avg
end function

public function integer f_update_round_diff (double vdb_item_id, double vdb_round_diff, ref t_transaction rt_transaction);double			ldb_moving_avg
string				ls_item_code

if isnull(vdb_item_id) or vdb_item_id = 0 then return 0
if isnull(vdb_round_diff) then vdb_round_diff = 0

update item set round_diff = :vdb_round_diff where object_ref_id = :vdb_item_id using rt_transaction;

if rt_transaction.sqlcode = -1 then
	rollback using rt_transaction;
	ls_item_code = this.f_get_code(vdb_item_id )
	gf_messagebox('m.c_item.f_update_round_diff.01','Thông báo','Không cập nhật được chênh lệch làm tròn quy đổi đơn vị của mặt hàng:@'+ls_item_code,'stop','ok',1)
	return -1
else
	return 1
end if
end function

public function double f_get_round_diff (double vdb_item_id);/**********************************************************************************
Chức năng: Lấy số chênh lệch làm tròn khi quy đổi đơn vị giao dịch sang đơn vị tốn kho, khi sửa ghi sồ (UNPOST)
 				 # Chênh lệch =  Số lược thực tế theo SKU chưa làm tròn - SL SKU đã làm tròn 
				 # Chênh lệch âm: thể hiện tồn kho hiện tại > hơn thực tế
				 # Chênh lệch dương: thể hiện tồn kho hiện tại < hơn thực tế
------------------------------------------------------------------------------------------------------------------------------------
Tham số: vdb_item_id: ID của mặt hàng
------------------
Return: số chênh lệch hiện tại của mã hàng.
==============================================================*/
double			ldb_round_diff

if isnull(vdb_item_id) or vdb_item_id = 0 then return 0

select round_diff into :ldb_round_diff from item where object_ref_id = :vdb_item_id using sqlca;

if sqlca.sqlcode = 0 then
	return ldb_round_diff
else
	return 0
end if
end function

public function boolean f_is_managed_qty (double vdb_item_id);boolean			lb_ok
string				ls_qty_yn

setnull(lb_ok)
if isnull(vdb_item_id) or vdb_item_id = 0 then	return lb_ok

select quantity_yn into :ls_qty_yn from item where object_ref_id = :vdb_item_id  using sqlca;

if sqlca.sqlcode = 0 then
	if ls_qty_yn = 'Y' then return true
	return false
else
	gf_messagebox('m.c_item.f_is_managed_qty.01','Thông báo','Lôi Select table:'+sqlca.sqlerrtext,'stop','ok',1)
	return lb_ok
end if


end function

public function integer f_get_lot_or_serial_yn (double vdb_item_id, ref string rs_lot_yn, ref string rs_serial_yn);
select nvl(item.lot_yn,'N'),nvl(item.serial_yn,'N') into :rs_lot_yn,:rs_serial_yn 
from item 
where item.object_ref_id = :vdb_item_id using SQLCA;
if SQLCA.sqlcode = 0 then
	return 1
else
	return -1
end if
end function

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model ='1d'
//iastr_dwo_tabpage[1].i_upperpart_height  =730
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_item_spec_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = 'd_item_spec_form'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_item_spec_grid'
iastr_dwo_tabpage[1].str_dwo[1].b_master = false
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_object_form;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = ''
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
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Quy cách'
iastr_dwo_tabpage[1].i_index = 1

iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_display_model = '1d'
//iastr_dwo_tabpage[2].i_upperpart_height  =730
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_item_purchase_price_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = 'd_item_purchase_price_grid'
iastr_dwo_tabpage[2].str_dwo[1].b_master = false
iastr_dwo_tabpage[2].str_dwo[1].b_detail = true
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_item_form;'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[2].str_dwo[1].s_master_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[2].str_dwo[1].s_detail_keycol = 'ITEM_ID;'
iastr_dwo_tabpage[2].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[2].str_dwo[1].s_ref_table_field = ''
iastr_dwo_tabpage[2].str_dwo[1].b_insert = true
iastr_dwo_tabpage[2].str_dwo[1].b_update = true
iastr_dwo_tabpage[2].str_dwo[1].b_delete = true
iastr_dwo_tabpage[2].str_dwo[1].b_query = true
iastr_dwo_tabpage[2].str_dwo[1].b_print = true
iastr_dwo_tabpage[2].str_dwo[1].b_excel = true
iastr_dwo_tabpage[2].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[2].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[2].str_dwo[1].s_description ='Giá mua'
iastr_dwo_tabpage[2].i_index = 2

iastr_dwo_tabpage[3].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[3].s_display_model = '1d'
//iastr_dwo_tabpage[3].i_upperpart_height  =730
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_default =  'd_item_sales_price_grid'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_grid = 'd_item_sales_price_grid'
iastr_dwo_tabpage[3].str_dwo[1].b_master = false
iastr_dwo_tabpage[3].str_dwo[1].b_detail = true
iastr_dwo_tabpage[3].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_master = 'd_item_form;'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[3].str_dwo[1].s_master_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[3].str_dwo[1].s_detail_keycol = 'ITEM_ID;'
iastr_dwo_tabpage[3].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[3].str_dwo[1].s_ref_table_field = ''
iastr_dwo_tabpage[3].str_dwo[1].b_insert = true
iastr_dwo_tabpage[3].str_dwo[1].b_update = true
iastr_dwo_tabpage[3].str_dwo[1].b_delete = true
iastr_dwo_tabpage[3].str_dwo[1].b_query = true
iastr_dwo_tabpage[3].str_dwo[1].b_print = true
iastr_dwo_tabpage[3].str_dwo[1].b_excel = true
iastr_dwo_tabpage[3].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[3].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[3].str_dwo[1].s_description ='Giá bán'
iastr_dwo_tabpage[3].i_index = 3

iastr_dwo_tabpage[4].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[4].s_display_model = '1d'
//iastr_dwo_tabpage[4].i_upperpart_height  =730
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_default =  'd_item_barcode_grid'
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_grid = 'd_item_barcode_grid'
iastr_dwo_tabpage[4].str_dwo[1].b_master = false
iastr_dwo_tabpage[4].str_dwo[1].b_detail = true
iastr_dwo_tabpage[4].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_master = 'd_item_form;'
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[4].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[4].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[4].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[4].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[4].str_dwo[1].b_insert = true
iastr_dwo_tabpage[4].str_dwo[1].b_update = true
iastr_dwo_tabpage[4].str_dwo[1].b_delete = true
iastr_dwo_tabpage[4].str_dwo[1].b_query = true
iastr_dwo_tabpage[4].str_dwo[1].b_print = true
iastr_dwo_tabpage[4].str_dwo[1].b_excel = true
iastr_dwo_tabpage[4].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[4].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[4].str_dwo[1].s_description ='Mã vạch'
iastr_dwo_tabpage[4].i_index = 4

//iastr_dwo_tabpage[5].s_tp_name = 's_tp_multi'
//iastr_dwo_tabpage[5].s_display_model = '1d'
////iastr_dwo_tabpage[5].i_upperpart_height  =730
//iastr_dwo_tabpage[5].str_dwo[1].s_dwo_default =  'd_item_discount_price_grid'
//iastr_dwo_tabpage[5].str_dwo[1].s_dwo_form = ''
//iastr_dwo_tabpage[5].str_dwo[1].s_dwo_grid = 'd_item_discount_price_grid'
//iastr_dwo_tabpage[5].str_dwo[1].b_master = false
//iastr_dwo_tabpage[5].str_dwo[1].b_detail = true
//iastr_dwo_tabpage[5].str_dwo[1].b_cascade_del = true
//iastr_dwo_tabpage[5].str_dwo[1].s_dwo_master = 'd_item_form;'
//iastr_dwo_tabpage[5].str_dwo[1].s_dwo_details = ''
//iastr_dwo_tabpage[5].str_dwo[1].s_dwo_shared = ''
//iastr_dwo_tabpage[5].str_dwo[1].s_master_keycol = 'ID;'
//iastr_dwo_tabpage[5].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
//iastr_dwo_tabpage[5].str_dwo[1].b_ref_table_yn  = false
//iastr_dwo_tabpage[5].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
//iastr_dwo_tabpage[5].str_dwo[1].b_insert = true
//iastr_dwo_tabpage[5].str_dwo[1].b_update = true
//iastr_dwo_tabpage[5].str_dwo[1].b_delete = true
//iastr_dwo_tabpage[5].str_dwo[1].b_query = true
//iastr_dwo_tabpage[5].str_dwo[1].b_print = true
//iastr_dwo_tabpage[5].str_dwo[1].b_excel = true
//iastr_dwo_tabpage[5].str_dwo[1].b_traceable = true
//iastr_dwo_tabpage[5].str_dwo[1].b_keyboardlocked = true
//iastr_dwo_tabpage[5].str_dwo[1].s_description ='Chiết khấu'
//iastr_dwo_tabpage[5].i_index = 5

iastr_dwo_tabpage[5].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[5].s_display_model = '1d'
//iastr_dwo_tabpage[5].i_upperpart_height  =730
iastr_dwo_tabpage[5].str_dwo[1].s_dwo_default =  'd_item_catch_grid'
iastr_dwo_tabpage[5].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[5].str_dwo[1].s_dwo_grid = 'd_item_catch_grid'
iastr_dwo_tabpage[5].str_dwo[1].b_master = false
iastr_dwo_tabpage[5].str_dwo[1].b_detail = true
iastr_dwo_tabpage[5].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[5].str_dwo[1].s_dwo_master = 'd_item_form;'
iastr_dwo_tabpage[5].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[5].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[5].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[5].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[5].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[5].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[5].str_dwo[1].b_insert = true
iastr_dwo_tabpage[5].str_dwo[1].b_update = true
iastr_dwo_tabpage[5].str_dwo[1].b_delete = true
iastr_dwo_tabpage[5].str_dwo[1].b_query = true
iastr_dwo_tabpage[5].str_dwo[1].b_print = true
iastr_dwo_tabpage[5].str_dwo[1].b_excel = true
iastr_dwo_tabpage[5].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[5].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[5].str_dwo[1].s_description ='Chiết tiết cấu thành'
iastr_dwo_tabpage[5].i_index = 5

iastr_dwo_tabpage[6].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[6].i_leftpart_width = 3000
iastr_dwo_tabpage[6].s_display_model = '1dgb_1d'
iastr_dwo_tabpage[6].str_dwo[1].s_dwo_default =  'd_object_images_grid'
iastr_dwo_tabpage[6].str_dwo[1].s_dwo_grid = 'd_object_images_grid'
iastr_dwo_tabpage[6].str_dwo[1].b_master = true
iastr_dwo_tabpage[6].str_dwo[1].b_detail = true
iastr_dwo_tabpage[6].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[6].str_dwo[1].s_dwo_master = 'd_object_form;'
iastr_dwo_tabpage[6].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[6].str_dwo[1].s_dwo_shared = 'd_object_images_form'
iastr_dwo_tabpage[6].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[6].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[6].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[6].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE'
iastr_dwo_tabpage[6].str_dwo[1].b_insert = true
iastr_dwo_tabpage[6].str_dwo[1].b_update = true
iastr_dwo_tabpage[6].str_dwo[1].b_delete = true
iastr_dwo_tabpage[6].str_dwo[1].b_query = true
iastr_dwo_tabpage[6].str_dwo[1].b_print = true
iastr_dwo_tabpage[6].str_dwo[1].b_excel = true
iastr_dwo_tabpage[6].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[6].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[6].str_dwo[1].s_description ='Hình minh họa SP'
iastr_dwo_tabpage[6].i_index = 6

//iastr_dwo_tabpage[6].str_dwo[2].s_dwo_default =  'd_object_images_form'
//iastr_dwo_tabpage[6].str_dwo[2].s_dwo_form = 'd_object_images_form'
//iastr_dwo_tabpage[6].str_dwo[2].s_dwo_grid = ''
//iastr_dwo_tabpage[6].str_dwo[2].b_shared = true
//iastr_dwo_tabpage[6].str_dwo[2].s_dwo_master = 'd_object_images_grid;'
//iastr_dwo_tabpage[6].str_dwo[2].b_master = false
//iastr_dwo_tabpage[6].str_dwo[2].b_detail = false
//iastr_dwo_tabpage[6].str_dwo[2].b_cascade_del = true
//iastr_dwo_tabpage[6].str_dwo[2].s_dwo_details = ''
//iastr_dwo_tabpage[6].str_dwo[2].s_dwo_shared = ''
//iastr_dwo_tabpage[6].str_dwo[2].s_master_keycol = ''
//iastr_dwo_tabpage[6].str_dwo[2].b_focus_master = true
//iastr_dwo_tabpage[6].str_dwo[2].b_ref_table_yn  = false
//iastr_dwo_tabpage[6].str_dwo[2].s_ref_table_field = ''
//iastr_dwo_tabpage[6].str_dwo[2].b_insert = true
//iastr_dwo_tabpage[6].str_dwo[2].b_update = true
//iastr_dwo_tabpage[6].str_dwo[2].b_delete = true
//iastr_dwo_tabpage[6].str_dwo[2].b_query = true
//iastr_dwo_tabpage[6].str_dwo[2].b_print = true
//iastr_dwo_tabpage[6].str_dwo[2].b_excel = true
//iastr_dwo_tabpage[6].str_dwo[2].b_traceable = true
//iastr_dwo_tabpage[6].str_dwo[2].b_keyboardlocked = true
//iastr_dwo_tabpage[6].str_dwo[2].s_description ='Hình minh họa SP'

iastr_dwo_tabpage[6].str_dwo[2].s_dwo_default =  'd_object_images_form'
iastr_dwo_tabpage[6].str_dwo[2].s_dwo_form = 'd_object_images_form'
iastr_dwo_tabpage[6].str_dwo[2].s_dwo_grid = ''
iastr_dwo_tabpage[6].str_dwo[2].b_shared = true
iastr_dwo_tabpage[6].str_dwo[2].s_dwo_master = 'd_object_images_grid;'
iastr_dwo_tabpage[6].str_dwo[2].s_master_keycol = ''
iastr_dwo_tabpage[6].str_dwo[2].s_detail_keycol = ''
iastr_dwo_tabpage[6].str_dwo[2].b_ref_table_yn  = false
iastr_dwo_tabpage[6].str_dwo[2].s_ref_table_field = ''
iastr_dwo_tabpage[6].str_dwo[2].b_insert = true
iastr_dwo_tabpage[6].str_dwo[2].b_update = true
iastr_dwo_tabpage[6].str_dwo[2].b_delete = true
iastr_dwo_tabpage[6].str_dwo[2].b_query = true
iastr_dwo_tabpage[6].str_dwo[2].b_print = true
iastr_dwo_tabpage[6].str_dwo[2].b_excel = true
iastr_dwo_tabpage[6].str_dwo[2].b_cascade_del = true
iastr_dwo_tabpage[6].str_dwo[2].b_traceable = true
iastr_dwo_tabpage[6].str_dwo[2].b_keyboardlocked = true
iastr_dwo_tabpage[6].str_dwo[2].b_focus_master = true
iastr_dwo_tabpage[6].str_dwo[2].s_description = 'Hình minh họa SP'
iastr_dwo_tabpage[6].str_dwo[2].s_pic_ref_table = 'OBJECT_IMAGES'
iastr_dwo_tabpage[6].str_dwo[2].s_pic_ref_field = 'ID'
iastr_dwo_tabpage[6].str_dwo[2].s_pic_ref_colname = 'images'
//istr_dwo[2].s_pic_ref_table = 'LEGAL_ENTITY'
//istr_dwo[2].s_pic_ref_field = 'object_ref_id'
//istr_dwo[2].s_pic_ref_colname = 'LOGO'
end subroutine

public function integer f_get_retail_price (double vdb_item_id, double vdb_qty, double vdb_object_id, double vdb_currency, string vs_purchase_sales, date vd_trans_date, ref double rdc_price);dec			ldc_price
double		ldb_object_manage_group
string			ls_item_code
int				li_count

//-- kiểm tra biến --
if isnull(vdb_item_id) or vdb_item_id = 0 or isnull(vdb_object_id) or isnull(vdb_currency) or vdb_currency = 0 then
	//gf_messagebox('m.c_item.d_get_retail_price.01','Thông báo','Không có mã hàng để lấy giá','exclamation','ok',1)
	return -1
end if
//if isnull(vdb_object_id)  then
//	//gf_messagebox('m.c_item.d_get_retail_price.02','Thông báo','Không có đối tượng áp lấy giá','exclamation','ok',1)
//	return -1
//end if
//if isnull(vdb_currency) or vdb_currency = 0 then
//	//gf_messagebox('m.c_item.d_get_retail_price.03','Thông báo','Không có loại để lấy giá','exclamation','ok',1)
//	return -1
//end if
//-- lấy giá riêng biệt --//
select count(id) into :li_count
from item_price
where item_id = :vdb_item_id
	 and upper(price_type) = upper(:vs_purchase_sales)
	and currency_id = :vdb_currency
	and ((:vdb_qty between nvl(from_qty,0) and nvl(to_qty,0)) OR (nvl(from_qty,0) = 0 and nvl(to_qty,0) = 0))
	and :vd_trans_date between nvl(f_date,to_date('01011900','ddmmrrrr')) and nvl(t_date,to_date('31123000','ddmmrrrr'))		
	and lower(object_applied_type) = 'spec'
	and applied_object_id = :vdb_object_id using sqlca;
if li_count > 1 then
	gf_messagebox('m.c_item.f_get_retail_price.01','Thông báo','Mã hàng này cài 2 giá cho cùng 1 đối tượng. Vào khai báo hàng hóa để chỉnh lại','exclamation','ok',1)
	rdc_price = 0
	return 0
end if
select retail_price into :ldc_price
from item_price
where item_id = :vdb_item_id
	 and upper(price_type) = upper(:vs_purchase_sales)
	and currency_id = :vdb_currency
	and ((:vdb_qty between nvl(from_qty,0) and nvl(to_qty,0)) OR (nvl(from_qty,0) = 0 and nvl(to_qty,0) = 0))
	and :vd_trans_date between nvl(f_date,to_date('01011900','ddmmrrrr')) and nvl(t_date,to_date('31123000','ddmmrrrr'))		
	and lower(object_applied_type) = 'spec'
	and applied_object_id = :vdb_object_id using sqlca;
if sqlca.sqlcode = 0 then
	rdc_price = ldc_price
elseif sqlca.sqlcode = 100 then
	//-- lấy giá theo nhóm --//
	if this.f_init_object( vdb_object_id) = 1 then
		ldb_object_manage_group = this.ids_attribute.getitemnumber( 1, 'manage_group')
		if isnull(ldb_object_manage_group) then ldb_object_manage_group = 0
		
		select count(id) into :li_count
		from item_price
		where item_id = :vdb_item_id
			 and upper(price_type) = upper(:vs_purchase_sales)
			and currency_id = :vdb_currency
			and ((:vdb_qty between nvl(from_qty,0) and nvl(to_qty,0)) OR (nvl(from_qty,0) = 0 and nvl(to_qty,0) = 0))
			and :vd_trans_date between nvl(f_date,to_date('01011900','ddmmrrrr')) and nvl(t_date,to_date('31123000','ddmmrrrr'))			
			and lower(object_applied_type) = 'group'
			and object_manage_group = :ldb_object_manage_group using sqlca;
		if li_count > 1 then
			gf_messagebox('m.c_item.f_get_retail_price.01','Thông báo','Mã hàng này cài 2 giá cho cùng 1 đối tượng. Vào khai báo hàng hóa để chỉnh lại','exclamation','ok',1)
			rdc_price = 0
			return 0
		end if
		
		select retail_price into :ldc_price
		from item_price
		where item_id = :vdb_item_id
			 and upper(price_type) = upper(:vs_purchase_sales)
			and currency_id = :vdb_currency
			and ((:vdb_qty between nvl(from_qty,0) and nvl(to_qty,0)) OR (nvl(from_qty,0) = 0 and nvl(to_qty,0) = 0))
			and :vd_trans_date between nvl(f_date,to_date('01011900','ddmmrrrr')) and nvl(t_date,to_date('31123000','ddmmrrrr'))			
			and lower(object_applied_type) = 'group'
			and object_manage_group = :ldb_object_manage_group using sqlca;	
			if sqlca.sqlcode = 0 then
				rdc_price = ldc_price
			elseif sqlca.sqlcode = 100 then	
				//-- lấy giá áp dụng tất cả --//
				select count(id) into :li_count
				from item_price
				where item_id = :vdb_item_id
					 and upper(price_type) = upper(:vs_purchase_sales)
					and currency_id = :vdb_currency
					and ((:vdb_qty between nvl(from_qty,0) and nvl(to_qty,0)) OR (nvl(from_qty,0) = 0 and nvl(to_qty,0) = 0))
					and :vd_trans_date between nvl(f_date,to_date('01011900','ddmmrrrr')) and nvl(t_date,to_date('31123000','ddmmrrrr'))
					and lower(object_applied_type) = 'all' using sqlca;	
				if li_count > 1 then
					gf_messagebox('m.c_item.f_get_retail_price.01','Thông báo','Mã hàng này cài 2 giá cho cùng 1 đối tượng. Vào khai báo hàng hóa để chỉnh lại','exclamation','ok',1)
					rdc_price = 0
					return 0
				end if
				select retail_price into :ldc_price
				from item_price
				where item_id = :vdb_item_id
					and upper(price_type) = upper(:vs_purchase_sales)
					and currency_id = :vdb_currency
					and ((:vdb_qty between nvl(from_qty,0) and nvl(to_qty,0)) OR (nvl(from_qty,0) = 0 and nvl(to_qty,0) = 0))
					and :vd_trans_date between nvl(f_date,to_date('01011900','ddmmrrrr')) and nvl(t_date,to_date('31123000','ddmmrrrr'))
					and lower(object_applied_type) = 'all' using sqlca;	
				if sqlca.sqlcode = 0 then
					rdc_price = ldc_price
				end if				
			else
				gf_messagebox('m.c_item.d_get_retail_price.05','Thông báo','Lỗi truy vẫn dữ liệu:@'+ sqlca.sqlerrtext ,'stop','ok',1)
				return -1							
			end if
	end if
else
	gf_messagebox('m.c_item.d_get_retail_price.05','Thông báo','Lỗi truy vẫn dữ liệu:@'+ sqlca.sqlerrtext ,'stop','ok',1)
	return -1									
end if
return 1
end function

public function integer f_get_link_item (double vdb_item_id, ref double vadb_lnk_item[], ref double vadb_lnk_spec[], ref double vadb_lnk_qty[], ref t_transaction rt_transaction);
return this.f_get_link_item( vdb_item_id,0, vadb_lnk_item[], vadb_lnk_spec[], vadb_lnk_qty[], rt_transaction)

end function

public function integer f_get_link_item (double vdb_item_id, double vdb_spec_id, ref double vadb_lnk_item[], ref double vadb_lnk_spec[], ref double vadb_lnk_qty[], ref t_transaction rt_transaction);any				laa_data[]
long				ll_cnt, ll_row
double			ldb_object_ref_id, ldb_item_qty, ldb_catch_qty, ldb_catch_uom, ldb_round_id
t_ds_db			lds_item_link

if isnull(vdb_item_id) or vdb_item_id = 0 then
	gf_messagebox('m.c_item.f_get_link_item.01','Thông báo','ID mã sản phẩm (dịch vụ) la 0 hoặc rỗng','exclamation','ok',1)
	return -1
end if
select id into :ldb_object_ref_id from item where object_ref_id = :vdb_item_id using sqlca;

if sqlca.sqlcode = 100 then 
	gf_messagebox('m.c_item.f_get_link_item.02','Thông báo','Không tìm thấy Mã SP/DV có ID:@'+string(vdb_item_id),'exclamation','ok',1)
	return 0
elseif sqlca.sqlcode = -1 then
	gf_messagebox('m.c_item.f_get_link_item.03','Thông báo','Lõi truy vấn database:@'+ sqlca.sqlerrtext ,'exclamation','ok',1)
	return -1	
end if

lds_item_link = create t_ds_db
lds_item_link.dataobject = 'd_item_catch_grid'
lds_item_link.f_settransobject( sqlca)
laa_data[1] = ldb_object_ref_id
if vdb_spec_id > 0 then laa_data[2] = vdb_spec_id
lds_item_link.f_add_where( 'object_ref_id', laa_data[])

ll_cnt = lds_item_link.retrieve( )
FOR ll_row = 1 to ll_cnt
	vadb_lnk_item[ll_row] = lds_item_link.getitemnumber( ll_row, 'catch_item')
	vadb_lnk_spec[ll_row] = lds_item_link.getitemnumber( ll_row, 'catch_spec')
	ldb_item_qty =  lds_item_link.getitemnumber( ll_row, 'item_qty')
	if isnull(ldb_item_qty) then ldb_item_qty =1
	ldb_catch_qty =  lds_item_link.getitemnumber( ll_row, 'catch_qty')
	if isnull(ldb_catch_qty) then ldb_catch_qty = 0
	ldb_catch_uom =  lds_item_link.getitemnumber( ll_row, 'catch_uom')
	ldb_round_id = this.ic_unit_instance.f_get_round_id( ldb_catch_uom, vadb_lnk_item[ll_row], 'item')
	if ldb_round_id = -1 then return -1
	vadb_lnk_qty[ll_row] = this.ic_unit_instance.f_round( rt_transaction,ldb_round_id , ldb_catch_qty/ldb_item_qty)
NEXT
destroy lds_item_link
return ll_cnt
end function

public function integer f_get_wholesales_price (double vdb_item_id, double vdb_qty, double vdb_currency_id, string vs_purchase_sales, date vd_trans_date, double vdb_customer_id, double vdb_sales_person, ref double rdb_wholesales_price);t_ds_db		lds_sales_price
boolean		lb_cus,lb_staff
double		ldb_staff_group,ldb_staff_id,ldb_customer_id
string			ls_filter,ls_filter_staff,ls_filter_customer
long			ll_retrieve,ll_find_staff,ll_find_customer,ll_idx
any			laa_data[]

//-- lấy nhóm nhân viên --//
select staff.dept_id into :ldb_staff_group
from object join staff on staff.object_ref_id = object.id
				join object obj1 on obj1.id = staff.dept_id
where object.id = :vdb_sales_person using SQLCA;
//-- lấy nhóm khách hàng(chưa lấy) --//
laa_data[1] = vdb_item_id
laa_data[2] = upper(vs_purchase_sales)
laa_data[3] = vdb_currency_id
lds_sales_price = create t_ds_db
lds_sales_price.dataobject = iastr_dwo_tabpage[3].str_dwo[1].s_dwo_default
lds_sales_price.f_settransobject( SQLCA)
lds_sales_price.f_add_where( 'item_id;price_type;currency_id', laa_data)
ll_retrieve = lds_sales_price.retrieve( )
if ll_retrieve = 0 then return 0 //-- không có cài đặt giá bán cho mặt hàng --//
//-- lọc theo khách hàng cụ thể --//
ls_filter = string(vdb_qty) + " between from_qty and to_qty and date('" + string(vd_trans_date) + "') between f_date and t_date "
ls_filter_customer = " and APPLIED_OBJECT_ID = " + string(vdb_customer_id) + " and object_applied_type = "+"'"+"spec"+"'" //+ " and (APPLIED_OBJECT_STAFF = " + string(vdb_sales_person) + " or STAFF_MANAGE_GROUP = " + string(ldb_staff_group) + ")"
lds_sales_price.setfilter( ls_filter + ls_filter_customer)
lds_sales_price.filter( )
if lds_sales_price.rowcount( ) > 0 then
	//-- lấy giá bán theo nhân viên --//
	ll_find_staff = lds_sales_price.find( "APPLIED_OBJECT_STAFF = " + string(vdb_sales_person), 1, lds_sales_price.rowcount( ))
	if ll_find_staff = 0 then
		//-- lấy giá bán theo nhóm nhân viên --//
		ll_find_staff = lds_sales_price.find( "STAFF_MANAGE_GROUP = " + string(ldb_staff_group), 1, lds_sales_price.rowcount( ))
		if ll_find_staff = 0 then
			//-- lấy giá theo tất cả nhân viên--//
			ll_find_staff = lds_sales_price.find( "staff_applied_type = 'all'", 1, lds_sales_price.rowcount( ))
		end if
	end if
	if ll_find_staff > 0 then rdb_wholesales_price = lds_sales_price.getitemnumber( ll_find_staff, 'wholesales_price')
else
	//-- lọc theo nhóm khách hàng --//
	ls_filter_customer = " and object_applied_type = 'group'"
	lds_sales_price.setfilter( ls_filter + ls_filter_customer)
	lds_sales_price.filter( )
	if lds_sales_price.rowcount( ) > 0 then
		//-- chưa xử lý nhóm khách hàng--//
	else
		//-- lọc theo tất cả khách hàng --//
		ls_filter_customer = " and object_applied_type = 'all'"
		lds_sales_price.setfilter( ls_filter + ls_filter_customer)
		lds_sales_price.filter( )
		if lds_sales_price.rowcount( ) > 0 then
			//-- lấy giá bán theo nhân viên --//
			ll_find_staff = lds_sales_price.find( "APPLIED_OBJECT_STAFF = " + string(vdb_sales_person), 1, lds_sales_price.rowcount( ))
			if ll_find_staff = 0 then
				//-- lấy giá bán theo nhóm nhân viên --//
				ll_find_staff = lds_sales_price.find( "STAFF_MANAGE_GROUP = " + string(ldb_staff_group), 1, lds_sales_price.rowcount( ))
				if ll_find_staff = 0 then
					//-- lấy giá theo tất cả nhân viên--//
					ll_find_staff = lds_sales_price.find( "staff_applied_type = 'all'", 1, lds_sales_price.rowcount( ))
				end if
			end if
			if ll_find_staff > 0 then rdb_wholesales_price = lds_sales_price.getitemnumber( ll_find_staff, 'wholesales_price')
		end if
	end if
end if
destroy lds_sales_price
return 0
end function

public function integer f_get_discount (double vdb_item_id, double vdb_qty, double vdb_currency_id, string vs_purchase_sales, date vd_trans_date, double vdb_customer_id, double vdb_sales_person, ref double rdb_discount_amount, ref integer ri_discount_pct);t_ds_db		lds_sales_price
boolean		lb_cus,lb_staff,lb_got_disc
double		ldb_staff_group,ldb_staff_id,ldb_customer_id
string			ls_filter,ls_filter_staff,ls_filter_customer
long			ll_retrieve,ll_find_staff,ll_find_customer,ll_idx,ll_find
any			laa_data[]

//-- lấy nhóm nhân viên --//
select staff.dept_id into :ldb_staff_group
from object join staff on staff.object_ref_id = object.id
				join object obj1 on obj1.id = staff.dept_id
where object.id = :vdb_sales_person using SQLCA;
//-- lấy nhóm khách hàng(chưa lấy) --//
laa_data[1] = vdb_item_id
laa_data[2] = upper(vs_purchase_sales)
laa_data[3] = vdb_currency_id
lds_sales_price = create t_ds_db
lds_sales_price.dataobject = iastr_dwo_tabpage[3].str_dwo[1].s_dwo_default
lds_sales_price.f_settransobject( SQLCA)
lds_sales_price.f_add_where( 'item_id;price_type;currency_id', laa_data)
ll_retrieve = lds_sales_price.retrieve( )
if ll_retrieve = 0 then return 0 //-- không có cài đặt giá bán cho mặt hàng --//
if upper(vs_purchase_sales) = 'SALES' then
	//-- lọc theo khách hàng cụ thể --//
	ls_filter = string(vdb_qty) + " between from_qty and to_qty and date('" + string(vd_trans_date) + "') between f_date and t_date "
	ls_filter_customer = " and APPLIED_OBJECT_ID = " + string(vdb_customer_id) + " and object_applied_type = "+"'"+"spec"+"'" //+ " and (APPLIED_OBJECT_STAFF = " + string(vdb_sales_person) + " or STAFF_MANAGE_GROUP = " + string(ldb_staff_group) + ")"
	lds_sales_price.setfilter( ls_filter + ls_filter_customer)
	lds_sales_price.filter( )
	if lds_sales_price.rowcount( ) > 0 then
		//-- lấy giá bán theo nhân viên --//
		ll_find_staff = lds_sales_price.find( "APPLIED_OBJECT_STAFF = " + string(vdb_sales_person), 1, lds_sales_price.rowcount( ))
		if ll_find_staff = 0 then
			//-- lấy giá bán theo nhóm nhân viên --//
			ll_find_staff = lds_sales_price.find( "STAFF_MANAGE_GROUP = " + string(ldb_staff_group), 1, lds_sales_price.rowcount( ))
			if ll_find_staff = 0 then
				//-- lấy giá theo tất cả nhân viên--//
				ll_find_staff = lds_sales_price.find( "staff_applied_type = 'all'", 1, lds_sales_price.rowcount( ))
			end if
		end if
		if ll_find_staff > 0 then 
			rdb_discount_amount = lds_sales_price.getitemnumber( ll_find_staff, 'discount_amount')
			ri_discount_pct = lds_sales_price.getitemnumber( ll_find_staff, 'discount_pct')
			lb_got_disc = true
		end if
	else
		//-- lọc theo nhóm khách hàng --//
		ls_filter_customer = " and object_applied_type = 'group'"
		lds_sales_price.setfilter( ls_filter + ls_filter_customer)
		lds_sales_price.filter( )
		if lds_sales_price.rowcount( ) > 0 then
			//-- chưa xử lý nhóm khách hàng--//
		else
			//-- lọc theo tất cả khách hàng --//
			ls_filter_customer = " and object_applied_type = 'all'"
			lds_sales_price.setfilter( ls_filter + ls_filter_customer)
			lds_sales_price.filter( )
			if lds_sales_price.rowcount( ) > 0 then
				//-- lấy giá bán theo nhân viên --//
				ll_find_staff = lds_sales_price.find( "APPLIED_OBJECT_STAFF = " + string(vdb_sales_person), 1, lds_sales_price.rowcount( ))
				if ll_find_staff = 0 then
					//-- lấy giá bán theo nhóm nhân viên --//
					ll_find_staff = lds_sales_price.find( "STAFF_MANAGE_GROUP = " + string(ldb_staff_group), 1, lds_sales_price.rowcount( ))
					if ll_find_staff = 0 then
						//-- lấy giá theo tất cả nhân viên--//
						ll_find_staff = lds_sales_price.find( "staff_applied_type = 'all'", 1, lds_sales_price.rowcount( ))
					end if
				end if
				if ll_find_staff > 0 then 
					rdb_discount_amount = lds_sales_price.getitemnumber( ll_find_staff, 'discount_amount')
					ri_discount_pct = lds_sales_price.getitemnumber( ll_find_staff, 'discount_pct')
					lb_got_disc = true
				end if
			end if
		end if
	end if
	//-- lọc không theo giới hạn số lượng và ngày tháng và áp dụng cho tất cả--//
	if not lb_got_disc then
		ls_filter = "if(isnull(from_qty),0,from_qty ) = 0 and if(isnull(to_qty),0,to_qty ) = 0 and if(isnull(f_date),0,if(f_date = date('01/01/1900'),0,1)) = 0 and if(isnull(t_date),0,if(t_date = date('01/01/1900'),0,1)) = 0"
		lds_sales_price.setfilter( ls_filter)
		lds_sales_price.filter( )
		if lds_sales_price.rowcount( ) > 0 then
			ll_find = lds_sales_price.find( "staff_applied_type = 'all' and  object_applied_type = 'all'", 1, lds_sales_price.rowcount( ))
			if ll_find > 0 then
//				rdb_wholesales_price = lds_sales_price.getitemnumber( ll_find, 'wholesales_price')
				rdb_discount_amount = lds_sales_price.getitemnumber( ll_find, 'discount_amount')
				ri_discount_pct = lds_sales_price.getitemnumber( ll_find, 'discount_pct')
				lb_got_disc = true
			end if
		end if
	end if
elseif upper(vs_purchase_sales) = 'PURCHASE' then
end if
destroy lds_sales_price
return 0
end function

public function integer f_caculation_disc (double vdb_sales_price, ref double rdb_discount_amount, ref integer ri_discount_pct, ref double rdb_discount_price);/*
vdb_sales_price 			giá bán 
rdb_discount_amount		tiền chiết khấu
ri_discount_pct				% chiết khấu
rdb_discount_price		giá đã chiết khấu
*/
if vdb_sales_price = 0 then
	
elseif rdb_discount_amount = 0 then
	rdb_discount_price= vdb_sales_price / (1 + (ri_discount_pct/100))
	rdb_discount_amount = vdb_sales_price - rdb_discount_price
elseif ri_discount_pct = 0 then
	rdb_discount_price = vdb_sales_price - rdb_discount_amount
	ri_discount_pct = ((vdb_sales_price/rdb_discount_price) - 1) * 100
end if
return 0
end function

on c_item1.create
call super::create
end on

on c_item1.destroy
call super::destroy
end on

event constructor;call super::constructor;ib_changed_dwo_4edit = true
is_display_model = '2dgb_1tp'
ib_display_text = false
is_object_title = 'Sản phẩm - hàng hóa - dịch vụ'
istr_actionpane[1].s_button_name = 'b_add_multi;b_insert;b_modify;b_save;b_query;b_execquery;b_filteron;b_item_barcode;b_refresh;b_delete;b_inventory_multi;b_purchase_multi;b_sales_multi;b_add_pic;'
istr_actionpane[1].s_button_has_sub = 'b_add_multi;b_inventory_multi;b_purchase_multi;b_sales_multi;'
istr_actionpane[1].sa_sub_button[1]='b_add;b_copyt_seft;'
istr_actionpane[1].sa_sub_button[2]='b_copyt_goods_delivery;b_copyt_goods_receipt;'
istr_actionpane[1].sa_sub_button[3]='b_copyt_po;b_copyt_pur_invoice;'
istr_actionpane[1].sa_sub_button[4]='b_copyt_so;b_copyt_sal_invoice;'
istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title

end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;t_dw_mpl		ldw_item

if pos(rpo_dw.dataobject,'d_object_') > 0 then
	ldw_item = iw_display.dynamic f_get_dw('d_item_form')
	ldw_item.event e_addrow()
elseif pos(rpo_dw.dataobject,'d_item_purchase_price_') > 0 then
	rpo_dw.setitem(vl_currentrow, 'item_applied_type','spec')
	rpo_dw.setitem(vl_currentrow, 'price_type','PURCHASE')
elseif pos(rpo_dw.dataobject,'d_item_sales_price_') > 0 then
	rpo_dw.setitem(vl_currentrow, 'item_applied_type','spec')
	rpo_dw.setitem(vl_currentrow, 'price_type','SALES')
elseif pos(rpo_dw.dataobject,'d_item_discount_price_grid') > 0 then
	rpo_dw.setitem(vl_currentrow, 'item_applied_type','spec')
	rpo_dw.setitem(vl_currentrow, 'price_type','SALES')
end if
return vl_currentrow
end event

event e_window_open;call super::e_window_open;t_dw_mpl			ldw_main
any				laa_value[]

//-- add where vendor --//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '=ITEM'
ldw_main.f_add_where('object_ref_table;',laa_value[])

return  0
end event

event e_action_ctrl_bttn;//-- Override --//
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_query;b_filteron;b_refresh;b_blank;b_delete;b_blank;b_item_barcode;b_blank;b_inventory_multi;b_purchase_multi;b_sales_multi;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_blank;b_item_barcode;b_blank;b_inventory_multi;b_purchase_multi;b_sales_multi;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query; b_refresh;b_blank;b_delete;b_item_barcode;b_blank;b_inventory_multi;b_purchase_multi;b_sales_multi;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_blank;b_item_barcode;b_blank;b_inventory_multi;b_purchase_multi;b_sales_multi;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_modify;b_blank;b_filteron;b_query;b_add_pic;b_refresh;b_blank;b_delete;b_blank;b_item_barcode;b_blank;b_inventory_multi;b_purchase_multi;b_sales_multi;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_blank;b_item_barcode;b_blank;b_inventory_multi;b_purchase_multi;b_sales_multi;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =  'b_so;b_goods_delivery;b_sal_invoice;b_blank;b_po;b_goods_receipt;b_pur_invoice;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
				istr_actionpane[li_idx].s_visible_buttons =  'b_book; b_attach; b_note;b_doc_trace_on;b_user_trace;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
				
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0


//
return 0
end event

event e_item_barcode;call super::e_item_barcode;c_string				lc_string
string					ls_obj_name

ls_obj_name = lc_string.f_globalreplace( vs_btn_name, 'b_', 'ur_')
iw_display.f_openchildwithparm( 's_w_multi_n', ls_obj_name+';0')
return 0
end event

event e_window_e_copy_form;call super::e_window_e_copy_form;return 2
end event

event e_window_e_preopen;call super::e_window_e_preopen;//--resize parm --//

iw_display.dynamic f_set_ii_upperpart_height(1500)
iw_display.dynamic f_set_ii_fixedpart2_height(620)

return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;double				ldb_object_id,ldb_stock_uom_id,ldb_count,ldb_wholesales_price,ldb_disc_amount,ldb_discount_price,ldb_currency_id,ldb_round_id
int 					li_idx,li_rtn,li_disc_pct
any					la_data,laa_data[]
string					lsa_return_cols[], lsa_receive_cols[],ls_coltype
boolean				lb_valid
t_ds_db				lds_temp
c_string				lc_string
c_dwservice			lc_dwservice
c_unit_instance		lc_unit
b_obj_instantiate	lboi_instance

if AncestorReturnValue = 1 then return 1
	if pos(rpo_dw.dataobject,'d_item_form') > 0 then
		if vs_colname = 'uom_code' then
			ldb_object_id = rpo_dw.getitemnumber(vl_currentrow,'object_ref_id')
			ldb_stock_uom_id = rpo_dw.getitemnumber(vl_currentrow,'stock_uom',Primary!, true)
			select count(*)
			into :ldb_count
			  from stream_value
			 where item_id= :ldb_object_id and uom_id = :ldb_stock_uom_id using sqlca;
			if sqlca.sqlcode= -1 then
				gf_messagebox('m.e_dw_e_itemchanged.01','Thông báo','Lỗi:@ '+sqlca.sqlerrtext,'exclamation','ok',1)
				return 1
			else
				if ldb_count> 0 then
					gf_messagebox('m.e_dw_e_itemchanged.02','Thông báo','Mặt hàng đã ghi sổ, không sửa được đơn vị tồn kho!','exclamation','ok',2)
					li_rtn = lc_string.f_stringtoarray(this.idwsetup_initial.is_return_column , ';', lsa_return_cols[])
					li_rtn = lc_string.f_stringtoarray(this.idwsetup_initial.is_receive_column , ';', lsa_receive_cols[])
					laa_data[1] = ldb_object_id
					lds_temp = create t_ds_db
					lds_temp.dataobject = 'd_item_form'
					lds_temp.f_settransobject(SQLCA)
					lds_temp.f_add_where('object_ref_id',laa_data)
					lds_temp.retrieve()
					if lds_temp.rowcount() = 1 then
						FOR li_idx = 1 to li_rtn			
							la_data = lds_temp.f_getitemany( lds_temp.getrow() , lsa_receive_cols[li_idx])
							ls_coltype = rpo_dw.describe(lsa_receive_cols[li_idx] +'.coltype' )			
							if left(ls_coltype,4) = 'char' then
								rpo_dw.setitem( vl_currentrow, lsa_receive_cols[li_idx], string(la_data))
							else
								rpo_dw.setitem( vl_currentrow, lsa_receive_cols[li_idx], la_data)
							end if			
						NEXT
						destroy lds_temp
					end if
					return 1
				end if
			end if
		end if
	elseif pos(rpo_dw.dataobject,iastr_dwo_tabpage[3].str_dwo[1].s_dwo_default) > 0 then
		ldb_currency_id = rpo_dw.getitemnumber(vl_currentrow,'currency_id')
		ldb_round_id = lc_unit.f_get_round_id( ldb_currency_id, 0, 'amount')
		if vs_colname = 'discount_amount' then
			ldb_wholesales_price = rpo_dw.getitemnumber(vl_currentrow,'wholesales_price')
			ldb_disc_amount = double(vs_editdata)
			ldb_discount_price = ldb_wholesales_price - ldb_disc_amount
			if not (isnull(ldb_wholesales_price) or ldb_wholesales_price <= 0) and not (isnull(ldb_disc_amount) or ldb_disc_amount <= 0) then
				this.f_caculation_disc( ldb_wholesales_price, ldb_disc_amount, li_disc_pct,ldb_discount_price )
				rpo_dw.setitem(vl_currentrow,'discount_pct',li_disc_pct)
			end if
		elseif  vs_colname = 'wholesales_price' then
			ldb_wholesales_price = double(vs_editdata)
			li_disc_pct = rpo_dw.getitemnumber(vl_currentrow,'discount_pct')
			if not (isnull(li_disc_pct) or li_disc_pct <= 0) then
				this.f_caculation_disc( ldb_wholesales_price, ldb_disc_amount, li_disc_pct, ldb_discount_price)
				ldb_disc_amount = lc_unit.f_round(rpo_dw, ldb_round_id,ldb_disc_amount)
				rpo_dw.setitem(vl_currentrow,'discount_amount',ldb_disc_amount)
			end if
		elseif vs_colname = 'discount_pct' then
			ldb_wholesales_price = rpo_dw.getitemnumber(vl_currentrow,'wholesales_price')
			li_disc_pct = long(vs_editdata)
			if not (isnull(ldb_wholesales_price) or ldb_wholesales_price <= 0) then
				this.f_caculation_disc( ldb_wholesales_price, ldb_disc_amount, li_disc_pct, ldb_discount_price)
				ldb_disc_amount = lc_unit.f_round(rpo_dw, ldb_round_id,ldb_disc_amount)
				rpo_dw.setitem(vl_currentrow,'discount_amount',ldb_disc_amount)
			end if
		elseif  vs_colname = 'f_date' or vs_colname = 't_date' then
			lb_valid = lboi_instance.f_isvalid_date_range_itemchanged( rpo_dw, vl_currentrow , vs_editdata , vs_colname, 'f_date', 't_date')
			if not lb_valid then return 1
		elseif vs_colname = 'from_qty' or vs_colname = 'to_qty' then
			lb_valid = lboi_instance.f_isvalid_qty_range_itemchanged( rpo_dw, vl_currentrow , vs_editdata , vs_colname, 'from_qty', 'to_qty')
			if not lb_valid then return 1			
		end if
	end if
return AncestorReturnValue
end event

event e_dw_rowfocuschanged;call super::e_dw_rowfocuschanged;t_dw_mpl		ladw_img[]
int				li_idx

if rpo_dw.dataobject = iastr_dwo_tabpage[6].str_dwo[1].s_dwo_default then
	rpo_dw.dynamic f_getdwshared(ladw_img[])
	for li_idx = 1 to upperbound(ladw_img)
		if ladw_img[li_idx].dataobject = iastr_dwo_tabpage[6].str_dwo[2].s_dwo_default then
			ladw_img[li_idx].f_load_pic( vl_currentrow)
		end if
	next
end if
return vl_currentrow
end event

event e_dw_clicked;call super::e_dw_clicked;string		ls_default_directory,ls_path, ls_file_name
blob		lblb_pic
int			li_rtn,li_file,li_idx

t_dw_mpl				ladw_share[]
b_obj_instantiate		lb_obj_ins

if vs_colname = 'b_config_pic' then
	ls_default_directory = GetCurrentDirectory ( )
	li_rtn = GetFileOpenName("Select File",ls_path, ls_file_name, "jpg","Graphic Files (*.bmp;*.gif;*.jpg;*.jpeg),*.bmp;*.gif;*.jpg;*.jpeg")
	if li_rtn = 0 or li_rtn = -1 then return li_rtn
	li_file = FileOpen(ls_path, StreamMode!, Read!, LockWrite!, Append!)
	FileReadEx(li_file,lblb_pic)
	FileClose(li_file)
	ChangeDirectory(ls_default_directory)
	if lb_obj_ins.f_update_pic( iastr_dwo_tabpage[6].str_dwo[2].s_pic_ref_table, iastr_dwo_tabpage[6].str_dwo[2].s_pic_ref_field, iastr_dwo_tabpage[6].str_dwo[2].s_pic_ref_colname, lblb_pic, vl_currentrow, rdw_handling) = 1 then
		rdw_handling.dynamic f_getdwshared(ladw_share[])
		for li_idx = 1 to upperbound(ladw_share)
			if ladw_share[li_idx].dataobject = iastr_dwo_tabpage[6].str_dwo[2].s_dwo_default then
				if ls_path <> '' then ladw_share[li_idx].setitem( vl_currentrow, iastr_dwo_tabpage[6].str_dwo[2].s_pic_ref_colname , ls_path)
			end if
		next
	end if
end if
return 0
end event

