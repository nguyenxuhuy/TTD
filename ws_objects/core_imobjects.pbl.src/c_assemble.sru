$PBExportHeader$c_assemble.sru
forward
global type c_assemble from b_doc
end type
end forward

global type c_assemble from b_doc
end type
global c_assemble c_assemble

type variables

end variables

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
public function integer f_add_material_item (double vdb_item_id, double vdb_spec_id, ref t_dw_mpl rdw_material)
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_document_inventory_grid'
istr_dwo[1].s_dwo_form = 'd_document_inventory_form'
istr_dwo[1].s_dwo_grid = 'd_document_inventory_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_assemble_form;' 
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
istr_dwo[1].s_description = 'Phiếu lắp ráp'

istr_dwo[2].s_dwo_default =  'd_assemble_form'
istr_dwo[2].s_dwo_form = 'd_assemble_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = true
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_details = 'd_product_grid;d_material_grid;'
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
istr_dwo[2].s_description = 'lắp ráp'

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
istr_dwo[3].b_focus_master = false
istr_dwo[3].s_gb_name = 'gb_7'
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].s_description = 'Chi tiết'
end subroutine

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '2d'
iastr_dwo_tabpage[1].i_upperpart_height = 2/3
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_product_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_product_grid'
iastr_dwo_tabpage[1].str_dwo[1].b_master = true
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_assemble_form;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = 'd_post_line_invoice_grid;d_lot_line_product_grid;'
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
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Thành phẩm'

iastr_dwo_tabpage[1].str_dwo[2].s_dwo_default =  'd_post_line_invoice_grid'
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_grid = 'd_post_line_invoice_grid'
iastr_dwo_tabpage[1].str_dwo[2].b_detail = true
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_master = 'd_product_grid;'
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[2].s_master_keycol = 'ID;'
iastr_dwo_tabpage[1].str_dwo[2].s_detail_keycol = 'object_ref_id;'
iastr_dwo_tabpage[1].str_dwo[2].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE'
iastr_dwo_tabpage[1].str_dwo[2].b_insert = false
iastr_dwo_tabpage[1].str_dwo[2].b_update = true
iastr_dwo_tabpage[1].str_dwo[2].b_delete = true
iastr_dwo_tabpage[1].str_dwo[2].b_query = true
iastr_dwo_tabpage[1].str_dwo[2].b_print = true
iastr_dwo_tabpage[1].str_dwo[2].b_excel = true
iastr_dwo_tabpage[1].str_dwo[2].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[2].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[2].s_description = 'Định khoản'
iastr_dwo_tabpage[1].i_index = 1

iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_display_model = '1d'
iastr_dwo_tabpage[2].i_upperpart_height = 720
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_lot_line_product_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = 'd_lot_line_product_grid'
iastr_dwo_tabpage[2].str_dwo[1].b_master = false
iastr_dwo_tabpage[2].str_dwo[1].b_detail = true
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_product_grid;'
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
iastr_dwo_tabpage[2].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[2].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[2].str_dwo[1].s_description ='Số lô thành phẩm'
iastr_dwo_tabpage[2].str_dwo[1].s_popmenu_items = ''

iastr_dwo_tabpage[3].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[3].s_display_model = '2d'
iastr_dwo_tabpage[3].i_upperpart_height = 730
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_default =  'd_material_grid'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_form = 'd_material_form'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_grid = 'd_material_grid'
iastr_dwo_tabpage[3].str_dwo[1].b_master = true
iastr_dwo_tabpage[3].str_dwo[1].b_detail = true
iastr_dwo_tabpage[3].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_master = 'd_assemble_form;'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_details = 'd_post_line_charge_grid;d_lot_line_material_grid'
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
iastr_dwo_tabpage[3].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[3].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[3].str_dwo[1].s_description ='Nguyên vật liệu'
iastr_dwo_tabpage[3].str_dwo[1].s_popmenu_items = 'm_spec_identified_cogs'

iastr_dwo_tabpage[3].str_dwo[2].s_dwo_default =  'd_post_line_charge_grid'
iastr_dwo_tabpage[3].str_dwo[2].s_dwo_form = ''
iastr_dwo_tabpage[3].str_dwo[2].s_dwo_grid = 'd_post_line_charge_grid'
iastr_dwo_tabpage[3].str_dwo[2].b_detail = true
iastr_dwo_tabpage[3].str_dwo[2].s_dwo_master = 'd_material_grid;'
iastr_dwo_tabpage[3].str_dwo[2].s_dwo_details = ''
iastr_dwo_tabpage[3].str_dwo[2].s_master_keycol = 'ID;'
iastr_dwo_tabpage[3].str_dwo[2].s_detail_keycol = 'object_ref_id;'
iastr_dwo_tabpage[3].str_dwo[2].b_ref_table_yn  = false
iastr_dwo_tabpage[3].str_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE'
iastr_dwo_tabpage[3].str_dwo[2].b_insert = false
iastr_dwo_tabpage[3].str_dwo[2].b_update = true
iastr_dwo_tabpage[3].str_dwo[2].b_delete = true
iastr_dwo_tabpage[3].str_dwo[2].b_query = true
iastr_dwo_tabpage[3].str_dwo[2].b_print = true
iastr_dwo_tabpage[3].str_dwo[2].b_excel = true
iastr_dwo_tabpage[3].str_dwo[2].b_traceable = true
iastr_dwo_tabpage[3].str_dwo[2].b_keyboardlocked = true
iastr_dwo_tabpage[3].str_dwo[2].s_description = 'Định khoản'
iastr_dwo_tabpage[3].i_index = 2


iastr_dwo_tabpage[4].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[4].s_display_model = '1d'
iastr_dwo_tabpage[4].i_upperpart_height = 730
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_default =  'd_lot_line_material_grid'
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_grid = 'd_lot_line_material_grid'
iastr_dwo_tabpage[4].str_dwo[1].b_master = false
iastr_dwo_tabpage[4].str_dwo[1].b_detail = true
iastr_dwo_tabpage[4].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_master = 'd_material_grid;'
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
iastr_dwo_tabpage[4].str_dwo[1].s_description ='Số lô nguyên vật liệu'
iastr_dwo_tabpage[4].str_dwo[1].s_popmenu_items = ''


end subroutine

public subroutine f_set_str_unit ();//--Datawindow chứa các cột cần làm tròn--//
istr_unit[1].s_dwo_handing = 'd_product_grid;d_product_grid;d_product_grid;d_product_grid;d_assemble_form;'
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = 'qty;act_price;act_amount;bc;ex'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[1].s_dwo_unit = 'd_product_grid;d_assemble_form;d_assemble_form;d_assemble_form;d_assemble_form;'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = 'uom_code;uom_code;uom_code;uom_code;EXCHANGE_RATE'
//--Loại làm tròn --//
istr_unit[1].s_type =  'item;price;amount;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[1].s_dwo_object = 'd_product_grid'
//--Cột chứa mã hàng--//
istr_unit[1].s_colname_object = 'item_code'

//--Datawindow chứa các cột cần làm tròn--//
istr_unit[2].s_dwo_handing = 'd_material_grid;d_material_grid;d_material_grid;d_material_grid;d_assemble_form;'
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[2].s_colname_data = 'qty;price;cogs;bc;ex'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[2].s_colname_convert = ''
istr_unit[2].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[2].s_dwo_unit = 'd_material_grid;"";d_assemble_form;d_assemble_form;d_assemble_form'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[2].s_colname_unit = 'uom_code;"";uom_code;uom_code;EXCHANGE_RATE'
//--Loại làm tròn --//
istr_unit[2].s_type =  'item;price;amount;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[2].s_dwo_object = 'd_material_grid'
//--Cột chứa mã hàng--//
istr_unit[2].s_colname_object = 'item_code'
end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'b_view'				// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = 'd_document_inventory_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'dv_materials_delivery_form'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].s_relatedtext_column = 'code'					
istr_dwo_related[1].s_text = 'In phiếu đề nghị vật tư'


istr_dwo_related[2].s_related_obj_name = 'u_goods_delivery'					// đối tượng copy đến
istr_dwo_related[2].s_main_obj_dwo = 	'd_material_grid'	//datawindow quan hệ main
istr_dwo_related[2].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[2].s_related_obj_dwo =  'd_inventory_line_delivery_grid'	// datawindow quan hệ đến
istr_dwo_related[2].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[2].b_f_matching = true
istr_dwo_related[2].s_relatedtext_column = 'doc_code'					
istr_dwo_related[2].s_text = 'Phiếu nhập kho : '

istr_dwo_related[2].s_main_obj_dwo_copy[1] =  'd_material_grid'// datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[1] = 'ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;QTY;QTY;cogs;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;warehouse_id;wh_code;wh_name;object_type;' // cột copy từ
istr_dwo_related[2].s_related_obj_dwo_copy[1] = 'd_inventory_line_delivery_grid' // datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[1] ='ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;doc_qty;QTY;cogs;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;object_id;cus_code;cus_name;object_type;'  // cột copy đến
istr_dwo_related[2].b_copy_line[1] = true
istr_dwo_related[2].s_main_obj_column_chk[1] = ''
istr_dwo_related[2].s_related_obj_column_chk[1] = ''
istr_dwo_related[2].s_f_obj_column_chk[1] = 'ITEM_ID'
istr_dwo_related[2].s_t_obj_column_chk[1] = 'ITEM_ID'
istr_dwo_related[2].s_match_f_dwo[1] = 'd_material_grid'
istr_dwo_related[2].s_match_f_col_obj[1] = 'item_id'
istr_dwo_related[2].s_match_t_dwo[1] = 'd_inventory_line_delivery_grid'
istr_dwo_related[2].s_match_f_column[1] = 'qty'
istr_dwo_related[2].s_match_t_column[1] = 'qty'
istr_dwo_related[2].s_match_column[1] = 'qty'

istr_dwo_related[2].s_main_obj_dwo_copy[2] =  'd_assemble_form'
istr_dwo_related[2].s_main_obj_column_copy[2] = 'note;description;trans_date;uom_code;currency_id;exchange_rate;' 
istr_dwo_related[2].s_related_obj_dwo_copy[2] = 'd_goods_delivery_form' 
istr_dwo_related[2].s_related_obj_column_copy[2] ='note;description;trans_date;uom_code;currency_id;exchange_rate;' 
istr_dwo_related[2].s_main_obj_column_chk[2] = ''
istr_dwo_related[2].s_related_obj_column_chk[2] = ''
istr_dwo_related[2].s_match_f_dwo[2] = ''
istr_dwo_related[2].s_match_t_dwo[2] = ''
istr_dwo_related[2].s_match_f_column[2] = ''
istr_dwo_related[2].s_match_t_column[2] = ''
istr_dwo_related[2].s_match_column[2] = ''
istr_dwo_related[2].s_main_obj_column_sum[2] = ''
istr_dwo_related[2].s_related_obj_column_sum[2] = ''
istr_dwo_related[2].s_f_obj_column_chk[2] = ''
istr_dwo_related[2].s_t_obj_column_chk[2] = ''
istr_dwo_related[2].b_f_sum[2] = false
istr_dwo_related[2].b_copy_line[2] = false

istr_dwo_related[3].s_related_obj_name = 'b_view'				// đối tượng copy đến
istr_dwo_related[3].s_main_obj_dwo = 'd_document_inventory_grid'		//datawindow quan hệ main
istr_dwo_related[3].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[3].s_related_obj_dwo = 'dv_product_receipt_form'	// datawindow quan hệ đến
istr_dwo_related[3].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[3].s_relatedtext_column = 'code'					
istr_dwo_related[3].s_text = 'In phiếu nhập kho thành phẩm lắp ráp'


end subroutine

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name = ''
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_str_streamvalue ();//-- product --//
istr_streamvalue[1].s_f_obj_dwo = 'd_material_grid'
istr_streamvalue[1].s_f_obj_column = 'WAREHOUSE_ID'
istr_streamvalue[1].s_f_column_sv = 'F_OBJECT_ID'

istr_streamvalue[1].s_t_obj_dwo = 'd_post_line_charge_grid'
istr_streamvalue[1].s_t_obj_column = 'DR_ACCOUNT_ID'
istr_streamvalue[1].s_t_column_sv = 'T_OBJECT_ID'

istr_streamvalue[1].s_item_dwo = 'd_material_grid'
istr_streamvalue[1].s_item_column = 'item_id;spec_id;qty;TRANS_UOM;loc_id'
istr_streamvalue[1].s_item_column_sv = 'item_id;spec_id;qty;uom_id;loc_id'

//istr_streamvalue[1].s_item_lot_dwo = 'd_lot_line_grid'
//istr_streamvalue[1].s_item_lot_column = 'qty;lot_no;serial_no;'
//istr_streamvalue[1].s_item_lot_column_sv = 'qty;LOT_NO;SERIAL_NO;'

istr_streamvalue[1].s_currency_dwo = 'd_assemble_form'
istr_streamvalue[1].s_currency_column = 'CURRENCY_ID;exchange_rate'
istr_streamvalue[1].s_currency_column_sv = 'TRANS_CUR_ID;exchange_rate'

istr_streamvalue[1].s_value_dwo = 'd_material_grid'
istr_streamvalue[1].s_value_column = 'item_id;COGS;COGS;spec_id;qty'
istr_streamvalue[1].s_value_column_sv = 'item_id;trans_value;base_value;spec_id;qty'

//-- product --//
istr_streamvalue[2].s_f_obj_dwo = 'd_post_line_invoice_grid'
istr_streamvalue[2].s_f_obj_column = 'CR_ACCOUNT_ID'
istr_streamvalue[2].s_f_column_sv = 'F_OBJECT_ID'

istr_streamvalue[2].s_t_obj_dwo = 'd_product_grid'
istr_streamvalue[2].s_t_obj_column = 'WAREHOUSE_ID'
istr_streamvalue[2].s_t_column_sv = 'T_OBJECT_ID'

istr_streamvalue[2].s_item_dwo = 'd_product_grid'
istr_streamvalue[2].s_item_column = 'item_id;spec_id;qty;TRANS_UOM;loc_id'
istr_streamvalue[2].s_item_column_sv = 'item_id;spec_id;qty;uom_id;loc_id'

//istr_streamvalue[1].s_item_lot_dwo = 'd_lot_line_grid'
//istr_streamvalue[1].s_item_lot_column = 'qty;lot_no;serial_no;'
//istr_streamvalue[1].s_item_lot_column_sv = 'qty;LOT_NO;SERIAL_NO;'

istr_streamvalue[2].s_currency_dwo = 'd_assemble_form'
istr_streamvalue[2].s_currency_column = 'CURRENCY_ID;exchange_rate'
istr_streamvalue[2].s_currency_column_sv = 'TRANS_CUR_ID;exchange_rate'

istr_streamvalue[2].s_value_dwo = 'd_product_grid'
istr_streamvalue[2].s_value_column = 'item_id;ACT_AMOUNT;ACT_BASE_AMOUNT;spec_id;qty_sku'
istr_streamvalue[2].s_value_column_sv = 'item_id;trans_value;base_value;spec_id;qty'

end subroutine

public function integer f_reset_fixedpart_grid ();
this.iw_display.dynamic f_reset_ii_fixedpart2_height_grid()
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_resize_fixedpart_form ();
this.iw_display.dynamic f_reset_ii_fixedpart2_height_form()
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_resize_fixedpart_grid ();this.iw_display.dynamic f_reset_ii_fixedpart2_height_grid(0)
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_add_material_item (double vdb_item_id, double vdb_spec_id, ref t_dw_mpl rdw_material);double			ladb_lnk_item[], ladb_lnk_spec[], ladb_lnk_qty[], ldb_qty
int					li_cnt, li_idx
string				ls_findstr, ls_obj_code, ls_obj_name, ldb_stock_id, ls_uom_code
long				ll_row
u_item			lu_item
t_transaction	lt_transaction

//-- add link item --//
lu_item = create u_item
this.iw_display.f_get_transaction( lt_transaction)
li_cnt = lu_item.f_get_link_item( vdb_item_id, vdb_spec_id, ladb_lnk_item[], ladb_lnk_spec[], ladb_lnk_qty[], lt_transaction)

if li_cnt > 0 then
	FOR li_idx = 1 to li_cnt
		if isnull(ladb_lnk_spec[li_idx]) then
			ls_findStr = "item_ID = "+string(ladb_lnk_item[li_idx])
		else
			ls_findStr = "item_ID = "+string(ladb_lnk_item[li_idx]) + " spec_id ="+string(ladb_lnk_spec[li_idx])
		end if
		ll_row = rdw_material.find( ls_findStr, 1, rdw_material.rowcount( ) )	
		if ll_row > 0 then
			ldb_qty = rdw_material.getitemnumber( ll_row, 'qty')
			if isnull(ldb_qty) then ldb_qty = 0
			rdw_material.setitem( ll_row, 'qty', ldb_qty * ladb_lnk_qty[li_idx])			
		else
			select obj.code,obj.name, ite.stock_uom, uom.code
				into :ls_obj_code,:ls_obj_name, :ldb_stock_id, :ls_uom_code
			  from item ite 
					join uom on uom.id = ite.stock_uom
					join object obj on ite.object_ref_id=obj.id
			 where obj.id= :ladb_lnk_item[li_idx] using sqlca;		
			ll_row = rdw_material.event e_addrow( )	
			rdw_material.setitem( ll_row, 'item_id',  ladb_lnk_item[li_idx])
			rdw_material.setitem( ll_row, 'item_code', ls_obj_code )
			rdw_material.setitem( ll_row, 'line_text', ls_obj_name )
			rdw_material.setitem( ll_row, 'uom_code', ls_uom_code )
			rdw_material.setitem( ll_row, 'trans_uom', ldb_stock_id )
			rdw_material.setitem( ll_row, 'spec_id', ladb_lnk_spec[li_idx] )
			rdw_material.setitem( ll_row, 'qty', ladb_lnk_qty[li_idx])				 
		end if
	NEXT
end if

destroy lu_item
return li_cnt
end function

on c_assemble.create
call super::create
end on

on c_assemble.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = true
ib_display_text = false
is_display_model = '4dgb_1tp'
is_object_title = 'Phiếu lắp ráp'
istr_actionpane[1].s_button_name = 'b_add;b_join_multi;b_copyt_multi;b_insert;b_modify;b_save;b_query;b_execquery;b_filteron;b_refresh;b_delete;b_cancel;'+&
												'b_view_multi;b_view_materials_delivery;b_view_product_receipt;b_post;b_unpost;b_account_view;b_copyt_multi;'+&
												'b_send_2_approve;b_request_2_change;b_approve;b_reject;'
istr_actionpane[1].s_button_has_sub = 'b_copyt_multi;b_view_multi;'
istr_actionpane[1].sa_sub_button[1]='b_copyt_goods_delivery;'
istr_actionpane[1].sa_sub_button[2]='b_view_materials_delivery;b_view_product_receipt;'
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_join_multi;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_view_multi;b_blank;b_copyt_multi;b_blank;b_post;b_account_view;'  
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_view_multi;b_blank;b_copyt_multi;b_blank;b_blank;b_post;b_account_view;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_view_multi;b_blank;b_copyt_multi;b_blank;b_post;b_account_view;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_view_multi;b_blank;b_post;b_blank;b_account_view;b_copyt_multi;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_view_multi;b_blank;b_copyt_multi;b_blank;b_post;b_account_view;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_view_multi;b_blank;b_copyt_multi;b_blank;b_post;b_account_view;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =   'b_po;b_so_return;b_pur_invoice;b_sal_invoice_return;b_goods_delivery;'
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

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.f_set_ii_fixedpart2_height(278 )
iw_display.f_set_ii_fixedpart3_height(100)
iw_display.f_set_ii_upperpart_height(1000)
iw_display.f_set_ii_gb_3_height( 900)
iw_display.f_set_ii_gb_4_height(400)
//iw_display.f_set_ii_leftpart_width( 2600)
return 0
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;long		ll_row,ll_line_no,ll_idx

if pos(rpo_dw.dataobject,'d_document') > 0 then
	 rpo_dw.setitem(vl_currentrow,'doc_type','ASSEMBLE')
elseif mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) ='d_assemble' then 
	rpo_dw.setitem(vl_currentrow,'doc_type','ASSEMBLE')
	rpo_dw.setitem( vl_currentrow, 'VERSION_NO', 1)
	rpo_dw.setitem( vl_currentrow, 'trans_date', date(gd_session_date))
elseif pos(rpo_dw.dataobject,'d_product') > 0 then
	rpo_dw.setitem(vl_currentrow,'object_type','item')
	rpo_dw.setitem(vl_currentrow,'MANUFACTURE_YN','Y')
	if vl_currentrow = 1 then
		ll_line_no = 1
	else
		ll_line_no = vl_currentrow
		for ll_idx = vl_currentrow + 1 to rpo_dw.rowcount()
			rpo_dw.setitem(ll_idx,'line_no',ll_idx)
		next
	end if
	rpo_dw.setitem(vl_currentrow,'line_no',ll_line_no)
elseif pos(rpo_dw.dataobject,'d_material') > 0 then
	rpo_dw.setitem(vl_currentrow,'object_type','item')
	rpo_dw.setitem(vl_currentrow,'MANUFACTURE_YN','N')
	if vl_currentrow = 1 then
		ll_line_no = 1
	else
		ll_line_no = vl_currentrow
		for ll_idx = vl_currentrow + 1 to rpo_dw.rowcount()
			rpo_dw.setitem(ll_idx,'line_no',ll_idx)
		next
	end if
	rpo_dw.setitem(vl_currentrow,'line_no',ll_line_no)
end if
return AncestorReturnValue
end event

event e_window_open;call super::e_window_open;t_dw_mpl			ldw_main
any				laa_value[]
string a,b
//--form parm--//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '=ASSEMBLE'
ldw_main.f_add_where('doc_type;',laa_value[])
return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;any				laa_data[]
long				ll_insertrow,ll_find,ll_qty,ll_qty_master,ll_rtn
string				ls_rbt_ins_del,ls_rbt_seri_lot_no,ls_data,ls_uom_code,ls_item_code,ls_line_text
double			ldb_item_id, ldb_spec_id
t_dw_mpl		ldw_material, ldw_trans_date
t_ds_db			lds_lot_line
t_dw_mpl		ldw_lot_line,ldw_master
t_transaction	lt_transaction


if AncestorReturnValue = 1 then return 1
if pos(rpo_dw.dataobject,'d_scan_barcode') > 0 or pos(rpo_dw.dataobject,'d_lot_line_product') > 0 then
	iw_display.f_get_transaction(lt_transaction)
	lds_lot_line = create t_ds_db
	lds_lot_line.dataobject = 'ds_lot_line'
	lds_lot_line.f_settransobject(lt_transaction )
	if pos(rpo_dw.dataobject,'d_lot_line_product') > 0 then
		ldw_master = rpo_dw.dynamic f_get_idw_master( )
	else
		ldw_lot_line = iw_display.f_get_dw( 'd_lot_line_product_grid')
		ldw_master = ldw_lot_line.f_get_idw_master( )
	end if
	laa_data[1] = ldw_master.getitemnumber( ldw_master.getrow( ) , 'item_ID')
	lds_lot_line.f_add_where( 'object_id', laa_data)
	ll_rtn = lds_lot_line.retrieve( )
	ls_uom_code = ldw_master.getitemstring( ldw_master.getrow( ) , 'uom_code')
	ls_item_code = ldw_master.getitemstring( ldw_master.getrow( ) , 'item_code')
	ls_line_text = ldw_master.getitemstring( ldw_master.getrow( ) , 'line_text')
	if pos(rpo_dw.dataobject,'d_scan_barcode') > 0 then
		if isnull(vs_editdata) or vs_editdata = '' then return 0
		ls_rbt_ins_del = rpo_dw.getitemstring(vl_currentrow,'rbt_ins_del')
		ls_rbt_seri_lot_no = rpo_dw.getitemstring(vl_currentrow,'rbt_seri_lot_no')
		ldw_lot_line = iw_display.dynamic f_get_dw('d_lot_line_product_grid')
		if vs_colname = 'barcode' then
			ll_qty_master = ldw_master.getitemnumber( ldw_master.getrow( ) , 'qty')
			if ldw_lot_line.rowcount( ) < ll_qty_master then
				if ls_rbt_seri_lot_no = 'serial' then
					ll_find = ldw_lot_line.find( 'serial_no = '+"'"+trim(vs_editdata)+"'", 1,ldw_lot_line.rowcount( ) )
					if ll_find = 0 then
						//-- khóa lại để nhập số serial theo yêu cầu của a Duy--//
//						ll_find = lds_lot_line.find('serial_no = '+"'"+trim(vs_editdata)+"'",1,lds_lot_line.rowcount( ) )
//						if ll_find > 0 then
//							lds_lot_line.setfilter('serial_no = '+"'"+trim(vs_editdata)+"'")
//							lds_lot_line.filter( )
//							if mod(lds_lot_line.rowcount( ),2 ) = 0 then ll_find = 0
//						end if
						if ls_rbt_ins_del = 'insert' then
							if ll_find = 0  then
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
									ldw_lot_line.setitem(ll_insertrow,'qty',1)
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
								gf_messagebox('m.c_goods_receipt.e_dw_e_itemchanged.02','Thông báo','Số serial @: '+vs_editdata+' không tồn tại','exclamation','ok',1)
								rpo_dw.settext('')
								rpo_dw.setitem(vl_currentrow,'barcode','')
								return 1
							end if
						end if
					else
						if ls_rbt_ins_del <> 'insert' then
							ldw_lot_line.event e_deleterow( ll_find)
						else
							gf_messagebox('m.c_goods_receipt.e_dw_e_itemchanged.08','Thông báo','Số serial @: '+vs_editdata+' đã tồn tại','exclamation','ok',1)
							rpo_dw.settext('')
							rpo_dw.setitem(vl_currentrow,'barcode','')
						end if
						return 1
					end if
				else//--lot--//
					ll_find = ldw_lot_line.find( 'lot_no = '+"'"+vs_editdata+"'", 1,ldw_lot_line.rowcount( ) )
					if ls_rbt_ins_del = 'insert' then	
						if ll_find > 0 then
							ll_qty = ldw_lot_line.getitemnumber( ll_find, 'qty')
							if isnull(ll_qty) then ll_qty = 0
							ldw_lot_line.setitem(ll_find,'qty',ll_qty + 1)
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
								ldw_lot_line.setitem(ll_insertrow,'qty',1)
							else
								messagebox('Lỗi','c_goods_receipt.e_dw_e_itemchanged(line:17)')
								rpo_dw.settext('')
								rpo_dw.setitem(vl_currentrow,'barcode','')
								return 1
							end if
						end if
					else //--delete--//
						if ll_find > 0 then
							ll_qty = ldw_lot_line.getitemnumber( ll_find, 'qty')
							if isnull(ll_qty) then ll_qty = 0
							if ll_qty = 1 then
								ldw_lot_line.event e_deleterow( ll_find)
							elseif ll_qty > 1 then
								ldw_lot_line.setitem(ll_find,'qty',ll_qty - 1)
							end if
						else
							gf_messagebox('m.c_goods_receipt.e_dw_e_itemchanged.03','Thông báo','Số lô/lot @: '+vs_editdata+' không tồn tại','exclamation','ok',1)
							rpo_dw.settext('')
							rpo_dw.setitem(vl_currentrow,'barcode','')
							return 1
						end if
					end if
				end if
				rpo_dw.settext('')
				rpo_dw.setitem(vl_currentrow,'barcode','')
				return 1
			else
				gf_messagebox('m.c_goods_receipt.e_dw_e_itemchanged.04','Thông báo','Mặt hàng '+ls_item_code+' - '+ls_line_text+' đã đủ số lượng '+string(ll_qty_master)+' '+ls_uom_code,'exclamation','ok',1)
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
		if vs_colname = 'serial_no' then
			ll_find = rpo_dw.find( 'serial_no = '+"'"+trim(vs_editdata)+"'", 1,rpo_dw.rowcount( ) )
			if ll_find = 0 then 
				ll_find = lds_lot_line.find('serial_no = '+"'"+trim(vs_editdata)+"'",1,lds_lot_line.rowcount( ) )
				if ll_find > 0 then
					lds_lot_line.setfilter('serial_no = '+"'"+trim(vs_editdata)+"'")
					lds_lot_line.filter( )
					if mod(lds_lot_line.rowcount( ),2 ) = 0 then ll_find = 0
				end if
				if ll_find > 0 then 
					gf_messagebox('m.c_goods_receipt.e_dw_e_itemchanged.05','Thông báo','Số serial @: '+vs_editdata+' đã tồn tại','exclamation','ok',1)
					rpo_dw.settext('')
					return 1
				elseif ldw_master.getitemnumber( ldw_master.getrow( ) , 'qty') < rpo_dw.rowcount() then
					gf_messagebox('m.c_goods_receipt.e_dw_e_itemchanged.07','Thông báo','Mặt hàng '+ls_item_code+' - '+ls_line_text+' đã đủ số lượng '+string(ll_qty_master)+' '+ls_uom_code,'exclamation','ok',1)
					return 1
				end if
			else
				gf_messagebox('m.c_goods_receipt.e_dw_e_itemchanged.06','Thông báo','Số serial @: '+vs_editdata+' đã tồn tại','exclamation','ok',1)
				rpo_dw.settext('')
				return 1
			end if
		end if
	end if
	destroy lds_lot_line
elseif pos(rpo_dw.dataobject,'d_product') > 0 then
	choose case vs_colname
		case 'qty',  'item_code', 'spec_code'
			//-- update meterial quantity --//
			ldw_material = iw_display.dynamic f_get_dw('d_material_grid')
			ldb_item_id = rpo_dw.getitemnumber(vl_currentrow,'item_id')
			ldb_spec_id = rpo_dw.getitemnumber(vl_currentrow,'spec_id')
			if isnull(ldb_spec_id) then ldb_spec_id = 0
			this.f_add_material_item( ldb_item_id, ldb_spec_id, ldw_material)
	end choose
elseif pos(rpo_dw.dataobject,'d_document_inventory') > 0 then
	if vs_colname = 'document_date' then
		ldw_trans_date = iw_display.dynamic f_get_dw('d_assemble_form')
		ldw_trans_date.setitem(ldw_trans_date.getrow(),'trans_date', date(vs_editdata))
	end if
end if
return AncestorReturnValue
end event

event e_window_e_postopen;call super::e_window_e_postopen;datawindow	ldw_barcode
t_dw_mpl	ldw_ivt
string			ls_item
ldw_barcode = iw_display.dynamic f_get_dw ('d_scan_barcode_form')
if isvalid(ldw_barcode) then 
	if ldw_barcode.rowcount( ) = 0 then
		ldw_barcode.insertrow( 0)
		ldw_barcode.setitem(ldw_barcode.rowcount( ) , 'rbt_seri_lot_no', 'serial')
		ldw_barcode.setitem(ldw_barcode.rowcount( ) , 'rbt_ins_del', 'insert')
	end if
end if
ldw_ivt = iw_display.f_get_dw('d_product_grid' )
if ldw_ivt.getrow( ) > 0 then 
	ls_item = ldw_ivt.getitemstring( ldw_ivt.getrow( ) , 'item_code') + ' - ' +  ldw_ivt.getitemstring( ldw_ivt.getrow( ) , 'line_text')
end if
iw_display.f_set_visible_st_1(true)
iw_display.f_set_st_1_text('Số serial của: ',ls_item ) 
return AncestorReturnValue
end event

event e_dw_e_preinsertrow;call super::e_dw_e_preinsertrow;//t_dw_mpl	ldw_master
//
//if pos(rpo_dw.dataobject,'d_lot_line') > 0 then
//	ldw_master = rpo_dw.dynamic f_get_idw_master()
//	if ldw_master.getitemnumber( ldw_master.getrow( ) ,'qty') <= rpo_dw.rowcount() then return -1
//end if
return 0
end event

event e_dw_rowfocuschanged;call super::e_dw_rowfocuschanged;t_dw_mpl	ldw_main,ldw_ivt
string			ls_item

ldw_main = iw_display.f_get_dwmain( )
if rpo_dw.dataobject = ldw_main.dataobject then
	ldw_ivt = iw_display.f_get_dw('d_product_grid' )
	if ldw_ivt.getrow( ) > 0 then 
		ls_item = ldw_ivt.getitemstring( ldw_ivt.getrow( ) , 'item_code') + ' - ' +  ldw_ivt.getitemstring( ldw_ivt.getrow( ) , 'line_text')
	else
		ldw_ivt = iw_display.f_get_dw('d_material_grid' )
		if ldw_ivt.getrow( ) > 0 then	ls_item = ldw_ivt.getitemstring( ldw_ivt.getrow( ) , 'item_code') + ' - ' +  ldw_ivt.getitemstring( ldw_ivt.getrow( ) , 'line_text')
	end if
	iw_display.f_set_st_1_text('Số serial của: ',ls_item ) 
elseif rpo_dw.dataobject = 'd_product_grid' or rpo_dw.dataobject = 'd_material_grid' then
	ls_item = rpo_dw.getitemstring( vl_currentrow , 'item_code') + ' - ' +  rpo_dw.getitemstring( vl_currentrow , 'line_text')
	iw_display.f_set_st_1_text('Số serial của: ',ls_item ) 
end if
return 0
end event

event e_dw_getfocus;call super::e_dw_getfocus;string		ls_item


if rdw_handling.dataobject = 'd_product_grid' or rdw_handling.dataobject = 'd_material_grid' then
	ls_item = rdw_handling.getitemstring( rdw_handling.getrow() , 'item_code') + ' - ' +  rdw_handling.getitemstring( rdw_handling.getrow() , 'line_text')
	iw_display.f_set_st_1_text('Số serial của: ',ls_item ) 
end if
return 1
end event

event e_pm_clicked;call super::e_pm_clicked;/***************************************************
Chức năng: lấy giá vốn đích danh của lô hàng
----------------------------------------------------------------------------------


=============================================*/

powerobject		ldw_material


ldw_material = rm_popup.ipo_clicked

//--Lấy mã hàng cần áp giá --//


//-- open window chọn giá đích danh --//

//-- set giá vào dw --//

return 0
end event

event e_widnow_e_postaccounting;call super::e_widnow_e_postaccounting;//-- Tính giá thành phẩm lắp ráp --//
double				ldb_cogs, ldb_act_amt, ldb_qty_sku, ldb_trans_uom, ldb_act_qty_sku, ldb_round_diff, ldb_item_id, ldb_qty, ldb_amt_qty
double				ldb_currency_id,ldb_round_id,ldb_base_round_id
long					ll_row

t_dw_mpl			ldw_material, ldw_product, ldw_main
t_transaction		lt_transaction
u_item				lu_item

ldb_base_round_id = ic_unit_instance.f_get_round_id( 0, 0, 'bc')
ldw_material = this.iw_display.f_get_dw( 'd_material_grid')
ldw_product = this.iw_display.f_get_dw( 'd_product_grid')
this.iw_display.f_get_transaction(lt_transaction )
ldw_main = iw_display.f_get_dwmain( )
ldb_cogs = double(ldw_material.Describe("Evaluate('Sum(cogs)', 0)"))
ldb_amt_qty = double(ldw_product.Describe("Evaluate('Sum(qty)', 0)"))
if isnull(ldb_cogs) then ldb_cogs = 0
FOR ll_row = 1 to ldw_product.rowcount()
	ldb_qty = ldw_product.getitemnumber( ll_row, 'qty')
	if isnull(ldb_qty) or ldb_qty <= 0 then
		gf_messagebox('m.c_assemble.01','Thông báo','Chưa nhập số lượng thành phẩm','exclamation','ok',1)
		return -1
	end if
	ldb_act_amt = ic_unit_instance.f_round(ldw_main, ldb_base_round_id,(ldb_cogs/ldb_amt_qty) * ldb_qty)
	ldw_product.setitem( ll_row, 'act_amount', ldb_act_amt)
	//-- set số lượng SKU --//
	ldb_qty_sku = ldw_product.getitemnumber( ll_row, 'qty_sku')
	ldb_item_id = ldw_product.getitemnumber( ll_row, 'item_id')
	if isnull(ldb_qty_sku) then
		lu_item = create u_item
		ldb_trans_uom = ldw_product.getitemnumber( ll_row, 'trans_uom')
		this.f_set_Qty_sku(lt_transaction, ldw_product, ll_row, ldb_item_id,ldb_trans_uom, 'qty', 'IN', ldb_act_qty_sku, ldb_round_diff)
		lu_item.f_update_round_diff( ldb_item_id, ldb_round_diff, lt_transaction)
		destroy lu_item
	end if
NEXT
if ldw_product.update(true,false ) = -1 then
	gf_messagebox('m.c_assemble.02','Thông báo','Lỗi cập nhật giá nhập kho:@'+lt_transaction.sqlerrtext ,'stop','ok',1)
	rollback using lt_transaction;
	return -1	
else
	ldw_product.resetupdate( )
end if
return 1
end event

event e_dw_e_modifyrow;call super::e_dw_e_modifyrow;t_dw_mpl	ldw_barcode

if pos(rpo_dw.dataobject,'d_product') > 0 then
	ldw_barcode = iw_display.dynamic f_get_dw('d_scan_barcode_form')
	ldw_barcode.event e_modifyrow( )
end if
return 0
end event

event e_dw_e_postsave;call super::e_dw_e_postsave;t_dw_mpl	ldw_barcode

if pos(rpo_dw.dataobject,'d_product') > 0 then
	ldw_barcode = iw_display.dynamic f_get_dw('d_scan_barcode_form')
	ldw_barcode.f_set_ib_editing( false)
	ldw_barcode.f_set_ib_inserting(false) 
	ldw_barcode.f_set_ib_saving( false)
else
//	ldw_barcode = iw_display.dynamic f_get_dw('d_scan_barcode_form')
end if
return AncestorReturnValue
end event

event e_dw_e_save;call super::e_dw_e_save;t_dw_mpl	ldw_main

if rpo_dw.dataobject = 'd_scan_barcode_form' then
	ldw_main = iw_display.f_get_dwmain( )
	ldw_main.event e_save( )
	ldw_main.event e_resetupdate( )
	return 0
end if
return 1
end event

