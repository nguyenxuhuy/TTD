$PBExportHeader$c_shipment.sru
forward
global type c_shipment from b_doc
end type
end forward

global type c_shipment from b_doc
event type integer e_action_process ( )
event type integer e_action_create_barcode ( )
end type
global c_shipment c_shipment

type variables
int		ii_err_pick, ii_err_weight, ii_err_mixed

any	ias_retrieve_arg[]
end variables

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_str_unit ()
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_dwo_related ()
public function long f_get_str_streamvalue (ref s_str_streamvalue rs_str_streamvalue[])
public subroutine f_set_str_streamvalue ()
public function integer f_update_barcode (double vdb_ref_id, string vs_barcode_str, long vl_f_ctn, long vl_t_ctn, ref t_dw_mpl rdw_barcode)
public function integer f_update_total_pcs (ref t_dw_mpl rdw_size, long vl_row, string vs_colname, string vs_editdata)
end prototypes

event type integer e_action_process();//double				ldb_bom_id, ldb_produced_qty, ldb_ref_id
//long					ll_row
//t_transaction 		lt_transaction
//t_dw_mpl			ldw_prod_line, ldw_material, ldw_product, ldw_main
//
//this.iw_display.f_get_transaction( lt_transaction)
//ldw_prod_line = this.iw_display.f_get_dw( 'd_prod_line_grid')
//ldw_material =  this.iw_display.f_get_dw( 'd_prod_material_grid')
//ldw_product = this.iw_display.f_get_dw( 'd_prod_product_grid')
//
//
////-- Xoa material cũ --//
//if isvalid(ldw_material) then 	
//	for ll_row = 1 to ldw_prod_line.rowcount( )
//		ldb_ref_id = ldw_prod_line.getitemnumber( ll_row, 'ID')
//		ldw_material.setfilter( ' object_ref_id = ' + string(ldb_ref_id) )
//		ldw_material.filter( )
//		if ldw_material.rowcount( ) > 0 then 
//			if ldw_material.event e_delete_all( ) = -1 then 
//				rollback using lt_transaction;
//				this.iw_display.event e_refresh( )
//				return -1
//			end if
//		end if		
//	next
//end if
////-- Xoa TP cũ --//
//if isvalid(ldw_product) then 	
//	for ll_row = 1 to ldw_prod_line.rowcount( )
//		ldb_ref_id = ldw_prod_line.getitemnumber( ll_row, 'ID')
//		ldw_product.setfilter( ' object_ref_id = ' + string(ldb_ref_id) )
//		ldw_product.filter( )	
//		if ldw_product.rowcount( ) > 0 then 
//			if ldw_product.event e_delete_all( ) = -1 then 
//				rollback using lt_transaction;
//				this.iw_display.event e_refresh( )
//				return -1
//			end if
//		end if		
//	next
//end if
//
//FOR ll_row= 1 to ldw_prod_line.rowcount( )
//	//-- update NL--//
//	ldb_bom_id = ldw_prod_line.getitemnumber( ll_row, 'BOM_ID')
//	if isnull(ldb_bom_id ) or ldb_bom_id = 0 then continue
//	ldb_produced_qty = ldw_prod_line.getitemnumber( ll_row, 'INPUT_QTY')
//	if isnull(ldb_produced_qty ) or ldb_produced_qty = 0 then continue
//	ldb_ref_id = ldw_prod_line.getitemnumber( ll_row, 'ID')
//	if this.f_update_material(ldb_ref_id, ldb_bom_id , ldb_produced_qty, ldw_material, 'actual') = -1 then
//		rollback using lt_transaction;
//		this.iw_display.event e_refresh( )
//		return -1		
//	end if
//	//-- update tp --//
//	if this.f_update_product( ldb_ref_id, ldb_bom_id, ldb_produced_qty, ldw_product, 'actual') = -1 then
//		rollback using lt_transaction;
//		this.iw_display.event e_refresh( )
//		return -1				
//	end if
//NEXT
//if ldw_material.update( true,false) = 1 then
//	ldw_material.resetupdate( )
//else
//	gf_messagebox('m.c_prod_orders.e_action_process.01','Thông báo','Lỗi update dữ liệu nguyên liệu:@'+lt_transaction.sqlerrtext,'stop','ok',1)
//	rollback using lt_transaction;
//	this.iw_display.event e_refresh( )
//	return -1
//end if
//if ldw_product.update( true,false) = 1 then
//	ldw_product.resetupdate( )
//	//-- cập nhật trạng thái : planned --//
//	ldw_main =  this.iw_display.f_get_dwmain( )
//	ldw_main.setitem( ldw_main.getrow(), 'status', 'processing')
//	if ldw_main.update( true,false) = 1 then
//		ldw_main.resetupdate( )
//		commit using  lt_transaction;
//		ldw_main.event e_refresh( )
//		gf_messagebox('m.c_prod_orders.e_action_process.02','Thông báo','Hoàn thành tính nguyên liệu','information','ok',1)		
//	else
//		gf_messagebox('m.c_prod_orders.e_action_process.03','Thông báo','Lỗi  update trạng thái lệnh SX:@'+lt_transaction.sqlerrtext,'stop','ok',1)
//		rollback using lt_transaction;
//		this.iw_display.event e_refresh( )
//		return -1		
//	end if	
//else
//	gf_messagebox('m.c_prod_orders.e_action_process.04','Thông báo','Lỗi update dữ liệu thành phẩm:@'+lt_transaction.sqlerrtext,'stop','ok',1)
//	rollback using lt_transaction;
//	this.iw_display.event e_refresh( )
//	return -1
//end if
return 1
end event

event type integer e_action_create_barcode();double				ldb_bom_id, ldb_plan_qty, ldb_ref_id
long					ll_row, ll_f_ctn, ll_t_ctn, ll_respond
string					ls_message, ls_string, ls_barcode_yn, ls_shipno, ls_barcode_str
t_transaction 		lt_transaction
t_dw_mpl			ldw_shipment_catch, ldw_shipment_barcode , ldw_product, ldw_main

this.iw_display.f_get_transaction( lt_transaction)
ldw_shipment_catch = this.iw_display.f_get_dw( 'd_shipment_catch_grid')
ldw_shipment_barcode =  this.iw_display.f_get_dw( 'd_shipment_barcode_grid')
ldw_main = this.iw_display.f_get_dwmain( )
if ldw_main.getrow( ) > 0 then
	ls_shipno = ldw_main.getitemstring( ldw_main.getrow( ), 'code')
else 
	return 0
end if

//-- Xoa barcode cũ --//

if isvalid(ldw_shipment_catch) then 	
	for ll_row = 1 to ldw_shipment_catch.rowcount( )
		//-- lấy barcode string--//
		ls_string = ldw_shipment_catch.getitemstring( ll_row,'object_code')
		if isnull(ls_string) then ls_string = ''
		ls_message = ls_string +';'
		ls_barcode_str =  ls_shipno + ls_string
		ls_string = ldw_shipment_catch.getitemstring( ll_row,'object_name')
		if isnull(ls_string) then ls_string = ''
		ls_message += ls_string +';'
		ls_string = ldw_shipment_catch.getitemstring( ll_row,'catch_code')
		if isnull(ls_string) then ls_string = ''
		ls_message += ls_string +';'
		ls_barcode_str = ls_barcode_str + ls_string
		ls_string = ldw_shipment_catch.getitemstring( ll_row,'po_nbr')
		if isnull(ls_string) then ls_string = ''
		ls_message += ls_string +';'	
		ls_barcode_str = ls_barcode_str + ls_string
		
		ldb_ref_id = ldw_shipment_catch.getitemnumber( ll_row, 'ID')
		
		//-- xóa barcode cũ --//
		ldw_shipment_barcode.setfilter( ' object_ref_id = ' + string(ldb_ref_id) )
		ldw_shipment_barcode.filter( )
		if ldw_shipment_barcode.rowcount( ) > 0 then 			
			ll_respond =gf_messagebox('m.c_prod_orders.e_action_create_barcode.01','Thông báo','Lô hàng sau đã tạo barcode:@'+ ls_message+'@ BẠN CÓ MUỒN TẠO LẠI KHÔNG?','question','yesno',2)
			if ll_respond = 1 then
				if ldw_shipment_barcode.event e_delete_all( ) = -1 then 
					rollback using lt_transaction;
					this.iw_display.event e_refresh( )
					return -1
				end if
			end if
		end if	
		//-- sinh barcode--/
		ll_f_ctn = ldw_shipment_catch.getitemnumber( ll_row, 'f_ctn')
		if isnull(ll_f_ctn ) or ll_f_ctn = 0 then 
			gf_messagebox('m.c_prod_orders.e_action_create_barcode.02','Thông báo','Chưa nhập đủ số CTN bắt đầu','stop','ok',1)
		end if
		ll_t_ctn = ldw_shipment_catch.getitemnumber( ll_row, 't_ctn')
		if isnull(ll_f_ctn ) or ll_f_ctn = 0 then 
			gf_messagebox('m.c_prod_orders.e_action_create_barcode.03','Thông báo','Chưa nhập đủ số CTN kết thúc','stop','ok',1)
		end if	
		ls_barcode_yn = ldw_shipment_catch.getitemstring( ll_row, 'crt_barcode_yn')
		if isnull(ls_barcode_yn) or  ls_barcode_yn = '' then ls_barcode_str = 'NULL'
			this.f_update_barcode(ldb_ref_id , ls_barcode_str, ll_f_ctn, ll_t_ctn, ldw_shipment_barcode)
		next
end if

if ldw_shipment_barcode.update( true,false) = 1 then
	ldw_shipment_barcode.resetupdate( )
		commit using  lt_transaction;
		ldw_main.event e_refresh( )
		gf_messagebox('m.c_prod_orders.e_action_create_barcode.04','Thông báo','Hoàn thành sinh barcode','information','ok',1	)
else
	gf_messagebox('m.c_prod_orders.e_action_create_barcode.05','Thông báo','Lỗi cập update dữ liệu nguyên liệu:@'+lt_transaction.sqlerrtext,'stop','ok',1)
	rollback using lt_transaction;
	this.iw_display.event e_refresh( )
	return -1
end if

return 1
end event

public subroutine f_set_dwo_window ();
istr_dwo[1].s_dwo_default =  'd_document_shipment_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_document_shipment_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_shipment_hdr_form;'
istr_dwo[1].s_dwo_shared = ''
istr_dwo[1].s_dwo_master = ''
istr_dwo[1].s_master_keycol = ''
istr_dwo[1].s_detail_keycol = ''
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
istr_dwo[1].s_description = 'Kế hoạch xuất hàng'
istr_dwo[1].s_gb_name = 'gb_6'

istr_dwo[2].s_dwo_default =  'd_shipment_hdr_form'
istr_dwo[2].s_dwo_form = 'd_shipment_hdr_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = true
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_master = 'd_document_shipment_grid;'
istr_dwo[2].s_dwo_details = 'd_shipment_catch_grid;'
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
istr_dwo[2].s_gb_name = 'gb_7'
istr_dwo[2].s_description = 'Ghi chú SX'



end subroutine

public subroutine f_set_str_unit ();//--Datawindow chứa các cột cần làm tròn--//
istr_unit[1].s_dwo_handing = 'd_prod_product_grid;d_prod_product_grid;d_prod_product_grid;d_prod_product_grid;d_prod_hdr_la_form;'
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = 'act_qty;bom_qty;cogs;bc;ex'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[1].s_dwo_unit = 'd_prod_product_grid;d_prod_product_grid;d_prod_hdr_la_form;d_prod_hdr_la_form;d_prod_hdr_la_form;'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = 'uom_code;uom_code;uom_code;uom_code;EXCHANGE_RATE'
//--Loại làm tròn --//
istr_unit[1].s_type =  'item;item;amount;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[1].s_dwo_object = 'd_prod_product_grid'
//--Cột chứa mã hàng--//
istr_unit[1].s_colname_object = 'object_code'

//--Datawindow chứa các cột cần làm tròn--//
istr_unit[2].s_dwo_handing = 'd_prod_material_grid;d_prod_material_grid;d_prod_material_grid;d_prod_material_grid;d_prod_hdr_la_form;'
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[2].s_colname_data = 'act_qty;bom_qty;cogs;bc;ex'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[2].s_colname_convert = ''
istr_unit[2].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[2].s_dwo_unit = 'd_prod_material_grid;d_prod_material_grid;d_prod_hdr_la_form;d_prod_hdr_la_form;d_prod_hdr_la_form'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[2].s_colname_unit = 'uom_code;uom_code;uom_code;uom_code;EXCHANGE_RATE'
//--Loại làm tròn --//
istr_unit[2].s_type =  'item;item;amount;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[2].s_dwo_object = 'd_prod_material_grid'
//--Cột chứa mã hàng--//
istr_unit[2].s_colname_object = 'object_code'
end subroutine

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name =  ''
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
iastr_dwo_tabpage[1].i_index = 1
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_shipment_catch_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = 'd_shipment_catch_tree'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_shipment_catch_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_popmenu_items = ''
iastr_dwo_tabpage[1].str_dwo[1].b_master = true
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_shipment_hdr_form;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = 'd_shipment_barcode_grid;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = 'd_shipment_catch_share_grid'
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
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Chi tiết shipment'

iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_display_model = '1dgb_1dgb'
iastr_dwo_tabpage[2].s_description ='Chi tiết barcode'
iastr_dwo_tabpage[2].i_index = 2
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_shipment_catch_share_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = 'd_shipment_catch_share_grid'
iastr_dwo_tabpage[2].str_dwo[1].b_master = false
iastr_dwo_tabpage[2].str_dwo[1].b_detail = false
iastr_dwo_tabpage[2].str_dwo[1].b_shared = true
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_shipment_catch_tree;'
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
iastr_dwo_tabpage[2].str_dwo[1].s_description ='Chi tiết shipment'
iastr_dwo_tabpage[2].str_dwo[1].s_gb_name = 'gb_6'

iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
//iastr_dwo_tabpage[2].s_display_model = '1dgb_1dgb'
//iastr_dwo_tabpage[2].i_index = 2
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_default =  'd_shipment_barcode_grid'
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_form = ''
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_grid = 'd_shipment_barcode_grid'
iastr_dwo_tabpage[2].str_dwo[2].b_master = false
iastr_dwo_tabpage[2].str_dwo[2].b_detail = true
iastr_dwo_tabpage[2].str_dwo[2].b_shared = false
iastr_dwo_tabpage[2].str_dwo[2].b_cascade_del = true
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_master = 'd_shipment_catch_tree;'
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_details = ''
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_shared = ''
iastr_dwo_tabpage[2].str_dwo[2].s_master_keycol = 'ID;'
iastr_dwo_tabpage[2].str_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[2].str_dwo[2].b_ref_table_yn  = false
iastr_dwo_tabpage[2].str_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[2].str_dwo[2].b_insert = true
iastr_dwo_tabpage[2].str_dwo[2].b_update = true
iastr_dwo_tabpage[2].str_dwo[2].b_delete = true
iastr_dwo_tabpage[2].str_dwo[2].b_query = true
iastr_dwo_tabpage[2].str_dwo[2].b_print = true
iastr_dwo_tabpage[2].str_dwo[2].b_excel = true
iastr_dwo_tabpage[2].str_dwo[2].b_keyboardlocked = true
iastr_dwo_tabpage[2].str_dwo[2].b_traceable = true
iastr_dwo_tabpage[2].str_dwo[2].s_description ='Chi tiết barcode cartons'
iastr_dwo_tabpage[2].str_dwo[2].s_gb_name = 'gb_7'

end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'b_view'				// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = 'd_document_shipment_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'dv_barcode_form'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].s_relatedtext_column = ''					
istr_dwo_related[1].s_text = 'In phiếu tác nghiệp'
end subroutine

public function long f_get_str_streamvalue (ref s_str_streamvalue rs_str_streamvalue[]);////-- product --//
//istr_streamvalue[1].s_f_obj_dwo = 'd_material_grid'
//istr_streamvalue[1].s_f_obj_column = 'WAREHOUSE_ID'
//istr_streamvalue[1].s_f_column_sv = 'F_OBJECT_ID'
//
//istr_streamvalue[1].s_t_obj_dwo = 'd_post_line_charge_grid'
//istr_streamvalue[1].s_t_obj_column = 'DR_ACCOUNT_ID'
//istr_streamvalue[1].s_t_column_sv = 'T_OBJECT_ID'
//
//istr_streamvalue[1].s_item_dwo = 'd_material_grid'
//istr_streamvalue[1].s_item_column = 'item_id;spec_id;qty;TRANS_UOM;loc_id'
//istr_streamvalue[1].s_item_column_sv = 'item_id;spec_id;qty;uom_id;loc_id'
//
////istr_streamvalue[1].s_item_lot_dwo = 'd_lot_line_grid'
////istr_streamvalue[1].s_item_lot_column = 'qty;lot_no;serial_no;'
////istr_streamvalue[1].s_item_lot_column_sv = 'qty;LOT_NO;SERIAL_NO;'
//
//istr_streamvalue[1].s_currency_dwo = 'd_assemble_form'
//istr_streamvalue[1].s_currency_column = 'CURRENCY_ID;exchange_rate'
//istr_streamvalue[1].s_currency_column_sv = 'TRANS_CUR_ID;exchange_rate'
//
//istr_streamvalue[1].s_value_dwo = 'd_material_grid'
//istr_streamvalue[1].s_value_column = 'item_id;COGS;COGS;spec_id;qty'
//istr_streamvalue[1].s_value_column_sv = 'item_id;trans_value;base_value;spec_id;qty'
//
////-- product --//
//istr_streamvalue[2].s_f_obj_dwo = 'd_post_line_invoice_grid'
//istr_streamvalue[2].s_f_obj_column = 'CR_ACCOUNT_ID'
//istr_streamvalue[2].s_f_column_sv = 'F_OBJECT_ID'
//
//istr_streamvalue[2].s_t_obj_dwo = 'd_product_grid'
//istr_streamvalue[2].s_t_obj_column = 'WAREHOUSE_ID'
//istr_streamvalue[2].s_t_column_sv = 'T_OBJECT_ID'
//
//istr_streamvalue[2].s_item_dwo = 'd_product_grid'
//istr_streamvalue[2].s_item_column = 'item_id;spec_id;qty;TRANS_UOM;loc_id'
//istr_streamvalue[2].s_item_column_sv = 'item_id;spec_id;qty;uom_id;loc_id'
//
////istr_streamvalue[1].s_item_lot_dwo = 'd_lot_line_grid'
////istr_streamvalue[1].s_item_lot_column = 'qty;lot_no;serial_no;'
////istr_streamvalue[1].s_item_lot_column_sv = 'qty;LOT_NO;SERIAL_NO;'
//
//istr_streamvalue[2].s_currency_dwo = 'd_assemble_form'
//istr_streamvalue[2].s_currency_column = 'CURRENCY_ID;exchange_rate'
//istr_streamvalue[2].s_currency_column_sv = 'TRANS_CUR_ID;exchange_rate'
//
//istr_streamvalue[2].s_value_dwo = 'd_product_grid'
//istr_streamvalue[2].s_value_column = 'item_id;ACT_AMOUNT;ACT_BASE_AMOUNT;spec_id;qty_sku'
//istr_streamvalue[2].s_value_column_sv = 'item_id;trans_value;base_value;spec_id;qty'

return 0
end function

public subroutine f_set_str_streamvalue ();//-- material --//
istr_streamvalue[1].s_f_obj_dwo = 'd_prod_material_grid'
istr_streamvalue[1].s_f_obj_column = 'WH_ID'
istr_streamvalue[1].s_f_column_sv = 'F_OBJECT_ID'

istr_streamvalue[1].s_t_obj_dwo = 'd_post_line_charge_grid'
istr_streamvalue[1].s_t_obj_column = 'DR_ACCOUNT_ID'
istr_streamvalue[1].s_t_column_sv = 'T_OBJECT_ID'

istr_streamvalue[1].s_item_dwo = 'd_prod_material_grid'
istr_streamvalue[1].s_item_column = 'item_id;spec_id;ACT_QTY;UOM_ID;loc_id'
istr_streamvalue[1].s_item_column_sv = 'item_id;spec_id;qty;uom_id;loc_id'

//istr_streamvalue[1].s_item_lot_dwo = 'd_lot_line_grid'
//istr_streamvalue[1].s_item_lot_column = 'qty;lot_no;serial_no;'
//istr_streamvalue[1].s_item_lot_column_sv = 'qty;LOT_NO;SERIAL_NO;'

istr_streamvalue[1].s_currency_dwo = 'd_prod_hdr_la_form'
istr_streamvalue[1].s_currency_column = 'CURRENCY_ID;exchange_rate'
istr_streamvalue[1].s_currency_column_sv = 'TRANS_CUR_ID;exchange_rate'

istr_streamvalue[1].s_value_dwo = 'd_prod_material_grid'
istr_streamvalue[1].s_value_column = 'item_id;COGS;COGS;spec_id;ACT_QTY'
istr_streamvalue[1].s_value_column_sv = 'item_id;trans_value;base_value;spec_id;qty'

//-- product --//
istr_streamvalue[2].s_f_obj_dwo = 'd_post_line_charge_grid'
istr_streamvalue[2].s_f_obj_column = 'CR_ACCOUNT_ID'
istr_streamvalue[2].s_f_column_sv = 'F_OBJECT_ID'

istr_streamvalue[2].s_t_obj_dwo = 'd_prod_product_grid'
istr_streamvalue[2].s_t_obj_column = 'WH_ID'
istr_streamvalue[2].s_t_column_sv = 'T_OBJECT_ID'

istr_streamvalue[2].s_item_dwo = 'd_prod_product_grid'
istr_streamvalue[2].s_item_column = 'item_id;spec_id;ACT_QTY;UOM_ID;loc_id'
istr_streamvalue[2].s_item_column_sv = 'item_id;spec_id;qty;uom_id;loc_id'

//istr_streamvalue[1].s_item_lot_dwo = 'd_lot_line_grid'
//istr_streamvalue[1].s_item_lot_column = 'qty;lot_no;serial_no;'
//istr_streamvalue[1].s_item_lot_column_sv = 'qty;LOT_NO;SERIAL_NO;'

istr_streamvalue[2].s_currency_dwo = 'd_prod_hdr_la_form'
istr_streamvalue[2].s_currency_column = 'CURRENCY_ID;exchange_rate'
istr_streamvalue[2].s_currency_column_sv = 'TRANS_CUR_ID;exchange_rate'

istr_streamvalue[2].s_value_dwo = 'd_prod_product_grid'
istr_streamvalue[2].s_value_column = 'item_id;COGS;COGS;spec_id;ACT_QTY_SKU'
istr_streamvalue[2].s_value_column_sv = 'item_id;trans_value;base_value;spec_id;qty'

end subroutine

public function integer f_update_barcode (double vdb_ref_id, string vs_barcode_str, long vl_f_ctn, long vl_t_ctn, ref t_dw_mpl rdw_barcode);
long						ll_ctn, ll_cnt, ll_row_found
string						ls_barcode
c_string 					lc_string


rdw_barcode.setfilter("object_ref_id = "+string(vdb_ref_id))
rdw_barcode.filter()

vs_barcode_str = lc_string.f_globalreplace( vs_barcode_str, '|', '')
FOR ll_ctn = vl_f_ctn  to vl_t_ctn
	if vs_barcode_str = 'NULL' then 
		setnull(ls_barcode)
	else
		ls_barcode = vs_barcode_str+string(ll_ctn)
	END IF
	ll_row_found = rdw_barcode.insertrow(0)

			
	rdw_barcode.setitem(ll_row_found, 'OBJECT_REF_ID', vdb_ref_id)
	rdw_barcode.setitem(ll_row_found, 'OBJECT_REF_TABLE', 'INVENTORY_CATCH')
	rdw_barcode.setitem(ll_row_found, 'ID', this.f_create_id( ) )
	rdw_barcode.setitem(ll_row_found, 'COMPANY_ID', gi_user_comp_id )
	rdw_barcode.setitem(ll_row_found, 'BRANCH_ID', gdb_branch )
	rdw_barcode.setitem(ll_row_found, 'barcode', ls_barcode )
NEXT

rdw_barcode.setfilter('')
rdw_barcode.filter()

return 1
end function

public function integer f_update_total_pcs (ref t_dw_mpl rdw_size, long vl_row, string vs_colname, string vs_editdata);long			ll_f_ctn, ll_t_ctn, ll_size_qty, ll_idx, ll_total_size, ll_total_pcs
string			ls_breakdown = 'BREAKDOWN', ll_size, ls_idx
if rdw_size.rowcount() = 0 then return 0

if vs_colname =  'f_ctn' then
	if isnull(vs_editdata) or vs_editdata = '' then
		return 0
	else
		ll_f_ctn = long(vs_editdata)
	end if
else
	ll_f_ctn = rdw_size.getitemnumber(vl_row, 'f_ctn')
	if ll_f_ctn = 0 or isnull(ll_f_ctn) then return 0
end if

if vs_colname =  't_ctn' then
	if isnull(vs_editdata) or vs_editdata = '' then
		return 0
	else
		ll_t_ctn = long(vs_editdata)
	end if
else
	ll_t_ctn = rdw_size.getitemnumber(vl_row, 't_ctn')
	if ll_t_ctn = 0 or isnull(ll_t_ctn) then return 0
end if

if ll_t_ctn < ll_f_ctn then return 0

if vs_colname <> 'f_ctn' and vs_colname <> 't_ctn' then
	ls_idx = mid(vs_colname,10)
end if

FOR ll_idx = 1 to 11
	if ls_idx = string(ll_idx) then
		if isnull(vs_editdata) or vs_editdata = '' then
			ll_size_qty =  0
		else
			ll_size_qty = long(vs_editdata)
		end if		
	else
		ll_size = ls_breakdown+string(ll_idx)
		ll_size_qty = rdw_size.getitemnumber(vl_row,ll_size)
		if isnull(ll_size_qty) then ll_size_qty = 0
	end if
	ll_total_size += ll_size_qty
NEXT

ll_total_pcs = (ll_t_ctn - ll_f_ctn +1)*ll_total_size

rdw_size.setitem(vl_row, 'catch_qty', ll_total_pcs)

return 1

end function

on c_shipment.create
call super::create
end on

on c_shipment.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = false
this.ib_keyboardlocked = true
is_display_model = 'up_gp_2d_lo_tb'
is_object_title = 'Kế hoạch xuất hàng'
istr_actionpane[1].s_button_name = 'b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_post;b_unpost;b_create_barcode;b_view_barcode;'
istr_actionpane[1].s_button_has_sub = ''


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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_release;b_process;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_release;b_process;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons =  'b_add;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_post;b_create_barcode;b_view_barcode;'
						else
							istr_actionpane[li_idx].s_visible_buttons =  'b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_post;b_create_barcode;b_view_barcode;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_post;b_create_barcode;b_view_barcode;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_post;b_create_barcode;b_view_barcode;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =   ''
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

event e_window_e_preopen;call super::e_window_e_preopen;//--resize parm --//

iw_display.f_set_ii_upperpart_height(iw_display.ii_resize_height*1/3 )
iw_display.f_set_ii_fixedpart1_height( iw_display.ii_resize_height*1/3 *1/4)
this.f_set_ii_leftpart_width_tabpage( 2, iw_display.ii_resize_width*2/3)

return 0
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;long				ll_row
t_dw_mpl 		ldw_handle


if rpo_dw.dataobject = 'd_document_shipment_grid' then
	ldw_handle = iw_display.f_get_dw('d_shipment_hdr_form')	
	ll_row = ldw_handle.event e_addrow( )
	ldw_handle.setitem( ll_row, 'doc_type', 'SHIPMENT')
	ldw_handle.setitem( ll_row, 'trans_date', date(gd_session_date))
	ldw_handle.setitem( ll_row, 'version_no', 1)
end if
return vl_currentrow
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;t_dw_mpl  		ldw_handle

if rpo_dw.dataobject = 'd_shipment_catch_grid' then	
	choose case vs_colname
		case 'f_ctn','t_ctn','breakdown1','breakdown2','breakdown3','breakdown4','breakdown5','breakdown6','breakdow7','breakdown8','breakdown9','breakdown10','breakdown11'
			ldw_handle = rpo_Dw
			this.f_update_total_pcs( ldw_handle, vl_currentrow , vs_colname, vs_editdata )
	end choose
end if
return 0
end event

