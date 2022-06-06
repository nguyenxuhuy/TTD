$PBExportHeader$c_prod_orders.sru
forward
global type c_prod_orders from b_doc
end type
end forward

global type c_prod_orders from b_doc
event type integer e_action_process ( )
event type integer e_action_estimate ( )
end type
global c_prod_orders c_prod_orders

type variables
int		ii_err_pick, ii_err_weight, ii_err_mixed

any	ias_retrieve_arg[]

double	idb_bomline_id
end variables

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_str_unit ()
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_dwo_related ()
public subroutine f_set_str_streamvalue ()
public function integer f_update_product (double vdb_ref_id, double vdb_bom_id, double vdb_plan_qty, double vdb_act_qty, ref t_dw_mpl rdw_product, string vs_upd_type)
public function integer f_update_material (double vdb_ref_id, double vdb_bom_id, double vdb_plan_qty, double vdb_act_qty, ref t_dw_mpl rdw_material, string vs_upd_type)
public function integer f_update_formula (double vdb_ref_id, double vdb_bom_id, double vdb_plan_qty, double vdb_act_qty, ref t_dw_mpl rdw_material, string vs_upd_type)
public function integer f_update_material (double vdb_ref_id, double vdb_bom_id, double vdb_plan_qty, double vdb_act_qty, ref t_ds_db rdw_material, string vs_upd_type, ref t_transaction rt_transaction)
public function integer f_update_formula (double vdb_ref_id, double vdb_bom_id, double vdb_plan_qty, double vdb_act_qty, ref t_ds_db rdw_material, string vs_upd_type, ref t_transaction rt_transaction)
end prototypes

event type integer e_action_process();double				ldb_bom_id, ldb_produced_qty, ldb_ref_id, ldb_plan_qty
long					ll_row
t_transaction 		lt_transaction
t_dw_mpl			ldw_prod_line, ldw_material, ldw_product, ldw_main
t_ds_db				lds_material 

this.iw_display.f_get_transaction( lt_transaction)
ldw_prod_line = this.iw_display.f_get_dw( 'd_prod_line_grid')
ldw_material =  this.iw_display.f_get_dw( 'd_prod_material_grid')
ldw_product = this.iw_display.f_get_dw( 'd_prod_product_grid')

ldw_material.setfilter( '')
ldw_material.filter( )

lds_material = create t_ds_db
lds_material.dataobject = ldw_material.dataobject
lds_material.f_settransobject(lt_transaction )
ldw_material.rowscopy( 1, ldw_material.rowcount(), primary!, lds_material, 1, primary!)
lds_material.resetupdate( )

//-- Xoa material cũ --//
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

//-- Xoa TP cũ --//
if isvalid(ldw_product) then 	
	for ll_row = 1 to ldw_prod_line.rowcount( )
		ldb_ref_id = ldw_prod_line.getitemnumber( ll_row, 'ID')
		ldw_product.setfilter( ' object_ref_id = ' + string(ldb_ref_id) )
		ldw_product.filter( )	
		if ldw_product.rowcount( ) > 0 then 
			if ldw_product.event e_delete_all( ) = -1 then 
				rollback using lt_transaction;
				this.iw_display.event e_refresh( )
				return -1
			end if
		end if		
	next
end if

FOR ll_row= 1 to ldw_prod_line.rowcount( )
	//-- update NL--//
	ldb_bom_id = ldw_prod_line.getitemnumber( ll_row, 'BOM_ID')
	if isnull(ldb_bom_id ) or ldb_bom_id = 0 then continue
	ldb_produced_qty = ldw_prod_line.getitemnumber( ll_row, 'INPUT_QTY')
//	if isnull(ldb_produced_qty ) or ldb_produced_qty = 0 then continue
//	ldb_plan_qty = ldw_prod_line.getitemnumber( ll_row, 'PLAN_QTY')
//	if isnull(ldb_produced_qty ) then ldb_produced_qty = 0 
	ldb_ref_id = ldw_prod_line.getitemnumber( ll_row, 'ID')
	if this.f_update_material(ldb_ref_id, ldb_bom_id , ldb_plan_qty,ldb_produced_qty, lds_material, 'actual',lt_transaction ) = -1 then
//	if this.f_update_material(ldb_ref_id, ldb_bom_id , ldb_plan_qty, ldb_produced_qty, ldw_material, 'actual') = -1 then
		rollback using lt_transaction;
		this.iw_display.event e_refresh( )
		return -1		
	end if
	//-- update tp --//
	if this.f_update_product( ldb_ref_id, ldb_bom_id,ldb_plan_qty, ldb_produced_qty, ldw_product, 'actual') = -1 then
		rollback using lt_transaction;
		this.iw_display.event e_refresh( )
		return -1				
	end if
NEXT
if lds_material.update( true,false) = 1 then
	lds_material.resetupdate( )
else
	gf_messagebox('m.c_prod_orders.e_action_process.01','Thông báo','Lỗi update dữ liệu nguyên liệu:@'+lt_transaction.sqlerrtext,'stop','ok',1)
	rollback using lt_transaction;
	this.iw_display.event e_refresh( )
	return -1
end if
if ldw_product.update( true,false) = 1 then
	ldw_product.resetupdate( )
	//-- cập nhật trạng thái : planned --//
	ldw_main =  this.iw_display.f_get_dwmain( )
	ldw_main.setitem( ldw_main.getrow(), 'status', 'processing')
	if ldw_main.update( true,false) = 1 then
		ldw_main.resetupdate( )
		commit using  lt_transaction;
		ldw_main.event e_refresh( )
		gf_messagebox('m.c_prod_orders.e_action_process.02','Thông báo','Hoàn thành tính nguyên liệu','information','ok',1)		
	else
		gf_messagebox('m.c_prod_orders.e_action_process.03','Thông báo','Lỗi  update trạng thái lệnh SX:@'+lt_transaction.sqlerrtext,'stop','ok',1)
		rollback using lt_transaction;
		this.iw_display.event e_refresh( )
		return -1		
	end if	
else
	gf_messagebox('m.c_prod_orders.e_action_process.04','Thông báo','Lỗi update dữ liệu thành phẩm:@'+lt_transaction.sqlerrtext,'stop','ok',1)
	rollback using lt_transaction;
	this.iw_display.event e_refresh( )
	return -1
end if

destroy lds_material
return 1
end event

event type integer e_action_estimate();double				ldb_bom_id, ldb_plan_qty, ldb_ref_id, ldb_act_qty
long					ll_row
t_transaction 		lt_transaction
t_dw_mpl			ldw_prod_line,  ldw_product, ldw_main
t_ds_db				lds_material 

this.iw_display.f_get_transaction( lt_transaction)
ldw_prod_line = this.iw_display.f_get_dw( 'd_prod_line_grid')
//ldw_material =  this.iw_display.f_get_dw( 'd_prod_material_grid')
ldw_product = this.iw_display.f_get_dw( 'd_prod_product_grid')


lds_material = create t_ds_db
lds_material.dataobject = 'd_prod_material_grid'
lds_material.f_settransobject(lt_transaction )

//-- Xoa material cũ --//
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
//-- Xoa TP cũ --//
if isvalid(ldw_product) then 	
	for ll_row = 1 to ldw_prod_line.rowcount( )
		ldb_ref_id = ldw_prod_line.getitemnumber( ll_row, 'ID')
		ldw_product.setfilter( ' object_ref_id = ' + string(ldb_ref_id) )
		ldw_product.filter( )	
		if ldw_product.rowcount( ) > 0 then 
			if ldw_product.event e_delete_all( ) = -1 then 
				rollback using lt_transaction;
				this.iw_display.event e_refresh( )
				return -1
			end if
		end if		
	next
end if

//-- xóa nguyên liệu chính --//
for ll_row = 1 to ldw_prod_line.rowcount( )
	ldb_ref_id = ldw_prod_line.getitemnumber(ll_row,'id')
	delete PRODUCTION_DETAIL
	where object_ref_id = :ldb_ref_id using lt_transaction;
next

//--xóa nguyên lệu tiêu hao chung --//
//ldb_ref_id = ldw_prod_line.getitemnumber(1,'object_ref_id')
//delete PRODUCTION_DETAIL
//where object_ref_id = :ldb_ref_id using lt_transaction;

FOR ll_row= 1 to ldw_prod_line.rowcount( )
	//-- update NL--//
	ldb_bom_id = ldw_prod_line.getitemnumber( ll_row, 'BOM_ID')
	if isnull(ldb_bom_id ) or ldb_bom_id = 0 then continue
	ldb_plan_qty = ldw_prod_line.getitemnumber( ll_row, 'PLAN_QTY')
//	if isnull(ldb_plan_qty ) or ldb_plan_qty = 0 then continue
	ldb_act_qty =  ldw_prod_line.getitemnumber( ll_row, 'INPUT_QTY')
	if isnull(ldb_act_qty ) then ldb_act_qty = 0
	ldb_ref_id = ldw_prod_line.getitemnumber( ll_row, 'ID')
	if this.f_update_material(ldb_ref_id, ldb_bom_id , ldb_plan_qty,ldb_act_qty, lds_material, 'estimate',lt_transaction ) = -1 then
		rollback using lt_transaction;
		this.iw_display.event e_refresh( )
		return -1		
	end if
	//-- update tp --//
	if this.f_update_product( ldb_ref_id, ldb_bom_id, ldb_plan_qty,ldb_act_qty, ldw_product, 'estimate') = -1 then
		rollback using lt_transaction;
		this.iw_display.event e_refresh( )
		return -1				
	end if
NEXT
if lds_material.update( true,false) = 1 then
	lds_material.resetupdate( )
else
	gf_messagebox('m.c_prod_orders.e_action_estimate.01','Thông báo','Lỗi cập update dữ liệu nguyên liệu:@'+lt_transaction.sqlerrtext,'stop','ok',1)
	rollback using lt_transaction;
	this.iw_display.event e_refresh( )
	return -1
end if
if ldw_product.update( true,false) = 1 then
	ldw_product.resetupdate( )
	//-- cập nhật trạng thái : planned --//
	ldw_main =  this.iw_display.f_get_dwmain( )
	ldw_main.setitem( ldw_main.getrow(), 'status', 'planned')
	if ldw_main.update( true,false) = 1 then
		ldw_main.resetupdate( )
		commit using  lt_transaction;
		ldw_main.event e_refresh( )
		gf_messagebox('m.c_prod_orders.e_action_estimate.02','Thông báo','Hoàn thành tính nguyên liệu','information','ok',1)		
	else
		gf_messagebox('m.c_prod_orders.e_action_estimate.03','Thông báo','Lỗi cập update trạng thái lệnh SX:@'+lt_transaction.sqlerrtext,'stop','ok',1)
		rollback using lt_transaction;
		this.iw_display.event e_refresh( )
		return -1		
	end if	
else
	gf_messagebox('m.c_prod_orders.e_action_estimate.04','Thông báo','Lỗi cập update dữ liệu thành phẩm:@'+lt_transaction.sqlerrtext,'stop','ok',1)
	rollback using lt_transaction;
	this.iw_display.event e_refresh( )
	return -1
end if

destroy  lds_material

return 1
end event

public subroutine f_set_dwo_window ();
istr_dwo[1].s_dwo_default =  'd_document_prod_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_document_prod_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_prod_line_kd_grid;'
istr_dwo[1].s_dwo_shared = ''
istr_dwo[1].s_dwo_master = ''
istr_dwo[1].s_master_keycol = ''
istr_dwo[1].s_detail_keycol = ''
istr_dwo[1].b_ref_table_yn  = false
istr_dwo[1].s_ref_table_field = ''
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Lệnh sản xuất'
istr_dwo[1].s_gb_name = 'gb_6'


istr_dwo[2].s_dwo_default =  'd_prod_line_kd_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_prod_line_kd_grid'
istr_dwo[2].b_master = true
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_master = 'd_document_prod_grid;'
istr_dwo[2].s_dwo_details = 'd_lot_line_kd_grid;d_prod_material_grid;d_prod_resource_grid'
istr_dwo[2].s_master_keycol = 'ID;'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[2].b_ref_table_yn  = false
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[2].b_relation_1_1 = false
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
istr_dwo[2].s_description = 'Thông tin SX'

/*
istr_dwo[3].s_dwo_default =  'd_post_line_charge_grid'
istr_dwo[3].s_dwo_form = ''
istr_dwo[3].s_dwo_grid = 'd_post_line_charge_grid'
istr_dwo[3].b_master = false
istr_dwo[3].b_detail = true
istr_dwo[3].b_cascade_del = true
istr_dwo[3].s_dwo_master = 'd_prod_material_grid;'
istr_dwo[3].s_dwo_details = ';'
istr_dwo[3].s_master_keycol = 'ID;'
istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[3].b_ref_table_yn  = true
istr_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[3].b_relation_1_1 = false
istr_dwo[3].b_insert = true
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = true
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_excel = true
istr_dwo[3].b_traceable = true
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].b_focus_master = true
istr_dwo[3].s_description = 'Thông tin ghi sổ'

istr_dwo[4].s_dwo_default =  'd_post_line_tax_grid'
istr_dwo[4].s_dwo_form = ''
istr_dwo[4].s_dwo_grid = 'd_post_line_tax_grid'
istr_dwo[4].b_master = false
istr_dwo[4].b_detail = true
istr_dwo[4].b_cascade_del = true
istr_dwo[4].s_dwo_master = 'd_prod_consumption_grid;'
istr_dwo[4].s_dwo_details = ';'
istr_dwo[4].s_master_keycol = 'ID;'
istr_dwo[4].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[4].b_ref_table_yn  = true
istr_dwo[4].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[4].b_relation_1_1 = false
istr_dwo[4].b_insert = true
istr_dwo[4].b_update = true
istr_dwo[4].b_delete = true
istr_dwo[4].b_query = true
istr_dwo[4].b_print = true
istr_dwo[4].b_excel = true
istr_dwo[4].b_traceable = true
istr_dwo[4].b_keyboardlocked = true
istr_dwo[4].b_focus_master = true
istr_dwo[4].s_description = 'Thông tin ghi sổ'
*/

end subroutine

public subroutine f_set_str_unit ();//--Datawindow chứa các cột cần làm tròn--//
istr_unit[1].s_dwo_handing = 'd_prod_product_grid;d_prod_product_grid;d_prod_product_grid;d_prod_product_grid;d_prod_hdr_form;'
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = 'act_qty;bom_qty;cogs;bc;ex'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[1].s_dwo_unit = 'd_prod_product_grid;d_prod_product_grid;d_prod_hdr_form;d_prod_hdr_form;d_prod_hdr_form;'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = 'uom_code;uom_code;uom_code;uom_code;EXCHANGE_RATE'
//--Loại làm tròn --//
istr_unit[1].s_type =  'item;item;amount;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[1].s_dwo_object = 'd_prod_product_grid'
//--Cột chứa mã hàng--//
istr_unit[1].s_colname_object = 'object_code'

//--Datawindow chứa các cột cần làm tròn--//
istr_unit[2].s_dwo_handing = 'd_prod_material_grid;d_prod_material_grid;d_prod_material_grid;d_prod_material_grid;d_prod_hdr_form;'
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[2].s_colname_data = 'changed_qty;bom_qty;cogs;bc;ex'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[2].s_colname_convert = ''
istr_unit[2].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[2].s_dwo_unit = 'd_prod_material_grid;d_prod_material_grid;d_prod_hdr_form;d_prod_hdr_form;d_prod_hdr_form'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[2].s_colname_unit = 'uom_code;uom_code;uom_code;uom_code;EXCHANGE_RATE'
//--Loại làm tròn --//
istr_unit[2].s_type =  'item;item;amount;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[2].s_dwo_object = 'd_prod_material_grid'
//--Cột chứa mã hàng--//
istr_unit[2].s_colname_object = 'object_code'

//--Datawindow chứa các cột cần làm tròn--//
istr_unit[3].s_dwo_handing = 'd_prod_consumption_grid;d_prod_consumption_grid;d_prod_consumption_grid;d_prod_hdr_form;d_prod_hdr_form;'
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[3].s_colname_data = 'act_qty;price;cogs;bc;ex'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[3].s_colname_convert = ''
istr_unit[3].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[3].s_dwo_unit = 'd_prod_consumption_grid;d_prod_hdr_form;d_prod_hdr_form;d_prod_hdr_form;d_prod_hdr_form'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[3].s_colname_unit = 'uom_code;uom_code;uom_code;uom_code;EXCHANGE_RATE'
//--Loại làm tròn --//
istr_unit[3].s_type =  'item;price;amount;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[3].s_dwo_object = 'd_prod_consumption_grid'
//--Cột chứa mã hàng--//
istr_unit[3].s_colname_object = 'object_code'

//--Datawindow chứa các cột cần làm tròn--//
istr_unit[4].s_dwo_handing = 'd_prod_line_grid;d_prod_line_grid;d_prod_line_grid;d_prod_hdr_form;d_prod_hdr_form;'
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[4].s_colname_data = 'input_qty;price;amount;bc;ex'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[4].s_colname_convert = ''
istr_unit[4].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[4].s_dwo_unit = 'd_prod_line_grid;d_prod_hdr_form;d_prod_hdr_form;d_prod_hdr_form;d_prod_hdr_form'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[4].s_colname_unit = 'uom_code;uom_code;uom_code;uom_code;EXCHANGE_RATE'
//--Loại làm tròn --//
istr_unit[4].s_type =  'item;price;amount;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[4].s_dwo_object = 'd_prod_line_grid'
//--Cột chứa mã hàng--//
istr_unit[4].s_colname_object = 'bom_code'
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
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_lot_line_kd_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_lot_line_kd_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_popmenu_items = ''
iastr_dwo_tabpage[1].str_dwo[1].b_master = true
iastr_dwo_tabpage[1].str_dwo[1].b_detail = false
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_prod_line_kd_grid;'
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
iastr_dwo_tabpage[1].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Chi tiết SIZE'

iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_display_model = '1d'
iastr_dwo_tabpage[2].i_index = 2
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_prod_material_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = 'd_prod_material_grid'
iastr_dwo_tabpage[2].str_dwo[1].b_master = true
iastr_dwo_tabpage[2].str_dwo[1].b_detail = false
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_prod_line_kd_grid;'
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
iastr_dwo_tabpage[2].str_dwo[1].s_description ='Nguyên liệu chính'


iastr_dwo_tabpage[3].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[3].s_display_model = '1d'
iastr_dwo_tabpage[3].i_index = 3
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_default =  'd_prod_resource_grid'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_grid = 'd_prod_resource_grid'
iastr_dwo_tabpage[3].str_dwo[1].b_master = true
iastr_dwo_tabpage[3].str_dwo[1].b_detail = false
iastr_dwo_tabpage[3].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_master = 'd_prod_line_kd_grid;'
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
iastr_dwo_tabpage[3].str_dwo[1].s_description ='Lưu ý cách làm'

/*
iastr_dwo_tabpage[4].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[4].s_display_model = '1d'
iastr_dwo_tabpage[4].i_index = 4
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_default =  'd_prod_product_grid'
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_grid = 'd_prod_product_grid'
iastr_dwo_tabpage[4].str_dwo[1].b_master = false
iastr_dwo_tabpage[4].str_dwo[1].b_detail = true
iastr_dwo_tabpage[4].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_master = 'd_prod_line_grid;'
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
iastr_dwo_tabpage[4].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[4].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[4].str_dwo[1].s_description ='Phụ phẩm'

iastr_dwo_tabpage[5].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[5].s_display_model = '1d'
iastr_dwo_tabpage[5].i_index = 5
iastr_dwo_tabpage[5].str_dwo[1].s_dwo_default =  'd_prod_resource_grid'
iastr_dwo_tabpage[5].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[5].str_dwo[1].s_dwo_grid = 'd_prod_resource_grid'
iastr_dwo_tabpage[5].str_dwo[1].b_master = false
iastr_dwo_tabpage[5].str_dwo[1].b_detail = true
iastr_dwo_tabpage[5].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[5].str_dwo[1].s_dwo_master = 'd_prod_line_grid;'
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
iastr_dwo_tabpage[5].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[5].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[5].str_dwo[1].s_description ='Máy móc-Nhân lực'
*/
end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'b_view'				// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = 'd_document_prod_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'dv_prod_order_form'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].s_relatedtext_column = 'code'					
istr_dwo_related[1].s_text = 'In phiếu tác nghiệp'

istr_dwo_related[2].s_related_obj_name = 'u_po'					// đối tượng copy đến
istr_dwo_related[2].s_main_obj_dwo = 'd_document_prod_grid'		//datawindow quan hệ main
istr_dwo_related[2].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[2].s_related_obj_dwo = 'd_document_pm_grid'	// datawindow quan hệ đến
istr_dwo_related[2].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[2].b_f_matching = true
istr_dwo_related[2].s_relatedtext_column = 'doc_code'		
istr_dwo_related[2].s_text = 'Đơn đặt mua từ: '

istr_dwo_related[2].s_main_obj_dwo_copy[1] = 'd_prod_material_grid' // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[1] = 'ITEM_ID;object_code;object_name;object_name;BOM_QTY;uom_code;UOM_ID;wh_id;' // cột copy từ
istr_dwo_related[2].s_related_obj_dwo_copy[1] = 'd_po_line_grid' //datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[1] = 'ITEM_ID;item_code;item_name;LINE_TEXT;QTY;uom_code;TRANS_UOM;warehouse_id' // cột copy đến
istr_dwo_related[2].s_main_obj_column_chk[1] = ''
istr_dwo_related[2].s_related_obj_column_chk[1] = ''
istr_dwo_related[2].b_copy_line[1] = true
// khai báo cập nhật bản matching
istr_dwo_related[2].s_match_f_dwo[1] = 'd_prod_material_grid'
istr_dwo_related[2].s_match_f_col_obj[1] = 'item_id'
istr_dwo_related[2].s_match_t_dwo[1] = 'd_po_line_grid'
istr_dwo_related[2].s_match_f_column[1] = 'BOM_QTY'
istr_dwo_related[2].s_match_t_column[1] = 'qty'
istr_dwo_related[2].s_match_column[1] = 'qty'
istr_dwo_related[2].s_main_obj_column_sum[1] = 'BOM_QTY'
istr_dwo_related[2].s_related_obj_column_sum[1] = 'QTY'
istr_dwo_related[2].s_f_obj_column_chk[1] = 'ITEM_ID'
istr_dwo_related[2].s_t_obj_column_chk[1] = 'ITEM_ID'
istr_dwo_related[2].s_match_minus_dwo[1] = 'd_pur_invoice_line_grid;' //dwo không tính là đã match
istr_dwo_related[2].b_f_sum[1] = true
istr_dwo_related[2].s_main_dr_cr_obj_dwo_sum[1]=''
istr_dwo_related[2].s_main_dr_cr_obj_column_sum[1]=''

istr_dwo_related[2].s_main_obj_dwo_copy[2] = 'd_prod_consumption_grid' // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[2] = 'ITEM_ID;object_code;object_name;object_name;ACT_QTY;uom_code;UOM_ID;'
istr_dwo_related[2].s_related_obj_dwo_copy[2] = 'd_po_line_grid' //datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[2] = 'ITEM_ID;item_code;item_name;LINE_TEXT;QTY;uom_code;TRANS_UOM;'
istr_dwo_related[2].s_main_obj_column_chk[2] = ''
istr_dwo_related[2].s_related_obj_column_chk[2] = ''
istr_dwo_related[2].b_copy_line[2] = true
// khai báo cập nhật bản matching
istr_dwo_related[2].s_match_f_dwo[2] = 'd_prod_consumption_grid'
istr_dwo_related[2].s_match_f_col_obj[2] = 'item_id'
istr_dwo_related[2].s_match_t_dwo[2] = 'd_po_line_grid'
istr_dwo_related[2].s_match_f_column[2] = 'act_qty'
istr_dwo_related[2].s_match_t_column[2] = 'qty'
istr_dwo_related[2].s_match_column[2] = 'qty'
istr_dwo_related[2].s_main_obj_column_sum[2] = 'ACT_QTY'
istr_dwo_related[2].s_related_obj_column_sum[2] = 'QTY'
istr_dwo_related[2].s_f_obj_column_chk[2] = 'ITEM_ID'
istr_dwo_related[2].s_t_obj_column_chk[2] = 'ITEM_ID'
istr_dwo_related[2].b_f_sum[2] = true
istr_dwo_related[2].s_main_dr_cr_obj_dwo_sum[2]=''
istr_dwo_related[2].s_main_dr_cr_obj_column_sum[2]=''

istr_dwo_related[3].s_related_obj_name = 'u_pur_invoice'					// đối tượng copy đến
istr_dwo_related[3].s_main_obj_dwo = 'd_document_prod_grid'		//datawindow quan hệ main
istr_dwo_related[3].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[3].s_related_obj_dwo = 'd_document_ap_grid'	// datawindow quan hệ đến
istr_dwo_related[3].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[3].b_f_matching = true
istr_dwo_related[3].s_relatedtext_column = 'code'		
istr_dwo_related[3].s_text = 'Hóa đơn mua từ: '

istr_dwo_related[3].s_main_obj_dwo_copy[1] = 'd_prod_material_grid' // datawindow copy từ
istr_dwo_related[3].s_main_obj_column_copy[1] = 'ITEM_ID;object_code;object_name;act_QTY;uom_code;UOM_ID;wh_id;' // cột copy từ
istr_dwo_related[3].s_related_obj_dwo_copy[1] = 'd_pur_invoice_line_grid' //datawindow copy đến
istr_dwo_related[3].s_related_obj_column_copy[1] = 'object_ID;object_code;LINE_TEXT;act_QTY;uom_code;TRANS_UOM;warehouse_id' // cột copy đến
istr_dwo_related[3].s_main_obj_column_chk[1] = ''
istr_dwo_related[3].s_related_obj_column_chk[1] = ''
istr_dwo_related[3].b_copy_line[1] = true
// khai báo cập nhật bản matching
istr_dwo_related[3].s_match_f_dwo[1] = 'd_prod_material_grid'
istr_dwo_related[3].s_match_f_col_obj[1] = 'item_id'
istr_dwo_related[3].s_match_t_dwo[1] = 'd_pur_invoice_line_grid'
istr_dwo_related[3].s_match_f_column[1] = 'act_QTY'
istr_dwo_related[3].s_match_t_column[1] = 'act_qty'
istr_dwo_related[3].s_match_column[1] = 'qty'
istr_dwo_related[3].s_main_obj_column_sum[1] = 'act_QTY'
istr_dwo_related[3].s_related_obj_column_sum[1] = 'act_QTY'
istr_dwo_related[3].s_f_obj_column_chk[1] = 'ITEM_ID'
istr_dwo_related[3].s_t_obj_column_chk[1] = 'object_ID'
istr_dwo_related[3].s_match_minus_dwo[1] = 'd_po_line_grid;' //dwo không tính là đã match
istr_dwo_related[3].b_f_sum[1] = true
istr_dwo_related[3].s_main_dr_cr_obj_dwo_sum[1]=''
istr_dwo_related[3].s_main_dr_cr_obj_column_sum[1]=''

istr_dwo_related[3].s_main_obj_dwo_copy[2] = 'd_prod_consumption_grid' // datawindow copy từ
istr_dwo_related[3].s_main_obj_column_copy[2] = 'ITEM_ID;object_code;object_name;act_QTY;uom_code;UOM_ID;wh_id;' // cột copy từ
istr_dwo_related[3].s_related_obj_dwo_copy[2] = 'd_pur_invoice_line_grid' //datawindow copy đến
istr_dwo_related[3].s_related_obj_column_copy[2] = 'object_ID;object_code;LINE_TEXT;act_QTY;uom_code;TRANS_UOM;warehouse_id' // cột copy đến
istr_dwo_related[3].s_main_obj_column_chk[2] = ''
istr_dwo_related[3].s_related_obj_column_chk[2] = ''
istr_dwo_related[3].b_copy_line[2] = true
// khai báo cập nhật bản matching
istr_dwo_related[3].s_match_f_dwo[2] = 'd_prod_consumption_grid'
istr_dwo_related[3].s_match_f_col_obj[2] = 'item_id'
istr_dwo_related[3].s_match_t_dwo[2] = 'd_pur_invoice_line_grid'
istr_dwo_related[3].s_match_f_column[2] = 'act_QTY'
istr_dwo_related[3].s_match_t_column[2] = 'act_qty'
istr_dwo_related[3].s_match_column[2] = 'qty'
istr_dwo_related[3].s_main_obj_column_sum[2] = 'act_QTY'
istr_dwo_related[3].s_related_obj_column_sum[2] = 'act_QTY'
istr_dwo_related[3].s_f_obj_column_chk[2] = 'ITEM_ID'
istr_dwo_related[3].s_t_obj_column_chk[2] = 'object_ID'
istr_dwo_related[3].s_match_minus_dwo[2] = 'd_po_line_grid;' //dwo không tính là đã match
istr_dwo_related[3].b_f_sum[2] = true
istr_dwo_related[3].s_main_dr_cr_obj_dwo_sum[2]=''
istr_dwo_related[3].s_main_dr_cr_obj_column_sum[2]=''


istr_dwo_related[4].s_related_obj_name = 'u_goods_transfer'					// đối tượng copy đến
istr_dwo_related[4].s_main_obj_dwo = 	'd_document_prod_grid'	//datawindow quan hệ main
istr_dwo_related[4].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[4].s_related_obj_dwo =  'd_document_inventory_grid'	// datawindow quan hệ đến
istr_dwo_related[4].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[4].b_t_matching = true
istr_dwo_related[4].s_relatedtext_column = 'code'					
istr_dwo_related[4].s_text = 'Lệnh SX cho : '
istr_dwo_related[4].s_match_f_dwo[1] = 'd_inventory_line_transfer_grid'
istr_dwo_related[4].s_match_t_dwo[1] = 'd_prod_line_grid'
istr_dwo_related[4].s_match_f_column[1] = 'doc_qty'
istr_dwo_related[4].s_match_t_column[1] = 'PLAN_QTY'
istr_dwo_related[4].s_match_column[1] = 'qty'

istr_dwo_related[5].s_related_obj_name = 'u_so'					// đối tượng copy đến
istr_dwo_related[5].s_main_obj_dwo = 'd_document_prod_grid'		//datawindow quan hệ main
istr_dwo_related[5].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[5].s_related_obj_dwo = 'd_document_orders_grid'	// datawindow quan hệ đến 
istr_dwo_related[5].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[5].b_t_matching = true
istr_dwo_related[5].s_relatedtext_column = 'code'					
istr_dwo_related[5].s_text = 'Đơn bán hàng hàng của: '
// khai báo cập nhật bản matching
istr_dwo_related[5].s_match_f_dwo[1] = 'd_so_line_grid'
istr_dwo_related[5].s_match_t_dwo[1] = 'd_prod_line_grid'
istr_dwo_related[5].s_match_f_column[1] = 'act_qty'
istr_dwo_related[5].s_match_t_column[1] = 'PLAN_QTY'
istr_dwo_related[5].s_match_column[1] = 'qty'


istr_dwo_related[6].s_related_obj_name = 'u_pr'					// đối tượng copy đến
istr_dwo_related[6].s_main_obj_dwo = 'd_document_prod_grid'		//datawindow quan hệ main
istr_dwo_related[6].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[6].s_related_obj_dwo = 'd_document_pm_grid'	// datawindow quan hệ đến 
istr_dwo_related[6].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[6].b_t_matching = true
istr_dwo_related[6].s_relatedtext_column = 'code'					
istr_dwo_related[6].s_text = 'Y/c mua hàng của: '
// khai báo cập nhật bản matching
istr_dwo_related[6].s_match_f_dwo[1] = 'd_pr_line_grid'
istr_dwo_related[6].s_match_t_dwo[1] = 'd_prod_line_grid'
istr_dwo_related[6].s_match_f_column[1] = 'qty'
istr_dwo_related[6].s_match_t_column[1] = 'PLAN_QTY'
istr_dwo_related[6].s_match_column[1] = 'qty'


end subroutine

public subroutine f_set_str_streamvalue ();//-- material --//
istr_streamvalue[1].s_f_obj_dwo = 'd_prod_material_grid'
istr_streamvalue[1].s_f_obj_column = 'WH_ID'
istr_streamvalue[1].s_f_column_sv = 'F_OBJECT_ID'

istr_streamvalue[1].s_t_obj_dwo = 'd_post_line_charge_grid'
istr_streamvalue[1].s_t_obj_column = 'DR_ACCOUNT_ID'
istr_streamvalue[1].s_t_column_sv = 'T_OBJECT_ID'

istr_streamvalue[1].s_item_dwo = 'd_prod_material_grid'
istr_streamvalue[1].s_item_column = 'item_id;spec_id;changed_qty;UOM_ID;loc_id'
istr_streamvalue[1].s_item_column_sv = 'item_id;spec_id;qty;uom_id;loc_id'

//istr_streamvalue[1].s_item_lot_dwo = 'd_lot_line_grid'
//istr_streamvalue[1].s_item_lot_column = 'qty;lot_no;serial_no;'
//istr_streamvalue[1].s_item_lot_column_sv = 'qty;LOT_NO;SERIAL_NO;'

istr_streamvalue[1].s_currency_dwo = 'd_prod_hdr_form'
istr_streamvalue[1].s_currency_column = 'CURRENCY_ID;exchange_rate'
istr_streamvalue[1].s_currency_column_sv = 'TRANS_CUR_ID;exchange_rate'

istr_streamvalue[1].s_value_dwo = 'd_prod_material_grid'
istr_streamvalue[1].s_value_column = 'item_id;COGS;COGS;spec_id;changed_qty'
istr_streamvalue[1].s_value_column_sv = 'item_id;trans_value;base_value;spec_id;qty'

//-- consumption --//
istr_streamvalue[2].s_f_obj_dwo = 'd_prod_consumption_grid'
istr_streamvalue[2].s_f_obj_column = 'WH_ID'
istr_streamvalue[2].s_f_column_sv = 'F_OBJECT_ID'

istr_streamvalue[2].s_t_obj_dwo = 'd_post_line_tax_grid'
istr_streamvalue[2].s_t_obj_column = 'DR_ACCOUNT_ID'
istr_streamvalue[2].s_t_column_sv = 'T_OBJECT_ID'

istr_streamvalue[2].s_item_dwo = 'd_prod_consumption_grid'
istr_streamvalue[2].s_item_column = 'item_id;spec_id;ACT_QTY;UOM_ID;loc_id'
istr_streamvalue[2].s_item_column_sv = 'item_id;spec_id;qty;uom_id;loc_id'

//istr_streamvalue[2].s_item_lot_dwo = 'd_lot_line_grid'
//istr_streamvalue[2].s_item_lot_column = 'qty;lot_no;serial_no;'
//istr_streamvalue[2].s_item_lot_column_sv = 'qty;LOT_NO;SERIAL_NO;'

istr_streamvalue[2].s_currency_dwo = 'd_prod_hdr_form'
istr_streamvalue[2].s_currency_column = 'CURRENCY_ID;exchange_rate'
istr_streamvalue[2].s_currency_column_sv = 'TRANS_CUR_ID;exchange_rate'

istr_streamvalue[2].s_value_dwo = 'd_prod_consumption_grid'
istr_streamvalue[2].s_value_column = 'item_id;COGS;COGS;spec_id;ACT_QTY'
istr_streamvalue[2].s_value_column_sv = 'item_id;trans_value;base_value;spec_id;qty'

//-- product --//
istr_streamvalue[3].s_f_obj_dwo = 'd_post_line_charge_grid'
istr_streamvalue[3].s_f_obj_column = 'CR_ACCOUNT_ID'
istr_streamvalue[3].s_f_column_sv = 'F_OBJECT_ID'

istr_streamvalue[3].s_t_obj_dwo = 'd_prod_product_grid'
istr_streamvalue[3].s_t_obj_column = 'WH_ID'
istr_streamvalue[3].s_t_column_sv = 'T_OBJECT_ID'

istr_streamvalue[3].s_item_dwo = 'd_prod_product_grid'
istr_streamvalue[3].s_item_column = 'item_id;spec_id;ACT_QTY;UOM_ID;loc_id'
istr_streamvalue[3].s_item_column_sv = 'item_id;spec_id;qty;uom_id;loc_id'

//istr_streamvalue[1].s_item_lot_dwo = 'd_lot_line_grid'
//istr_streamvalue[1].s_item_lot_column = 'qty;lot_no;serial_no;'
//istr_streamvalue[1].s_item_lot_column_sv = 'qty;LOT_NO;SERIAL_NO;'

istr_streamvalue[3].s_currency_dwo = 'd_prod_hdr_form'
istr_streamvalue[3].s_currency_column = 'CURRENCY_ID;exchange_rate'
istr_streamvalue[3].s_currency_column_sv = 'TRANS_CUR_ID;exchange_rate'

istr_streamvalue[3].s_value_dwo = 'd_prod_product_grid'
istr_streamvalue[3].s_value_column = 'item_id;COGS;COGS;spec_id;ACT_QTY_SKU'
istr_streamvalue[3].s_value_column_sv = 'item_id;trans_value;base_value;spec_id;qty'


end subroutine

public function integer f_update_product (double vdb_ref_id, double vdb_bom_id, double vdb_plan_qty, double vdb_act_qty, ref t_dw_mpl rdw_product, string vs_upd_type);double					ldb_bomline_id, ldb_fg_id, ldb_spec_id, ldb_fg_qty, ldb_fg_uom, ldb_fg_round, ldb_version_id
double					ldb_fg_wh, ldb_mat_qty
any						laa_args[], laa_empty[]
long						ll_row, ll_cnt, ll_row_found
string						ls_code, ls_ref_table
t_ds_db					lds_bom
b_obj_instantiate		lbo_inst
c_datetime				ldt_inst

ls_ref_table = upper(rdw_product.describe("DataWindow.Table.UpdateTable"))
//rdw_material.setfilter("object_ref_id = "+string(vdb_ref_id))
//rdw_material.filter()

lds_bom = create t_ds_db
lds_bom.dataobject = 'd_bom_hdr_form'
lds_bom.f_settransobject( sqlca)

ldb_version_id = lbo_inst.f_get_bom_version_id( vdb_bom_id)
laa_args[1] = ldb_version_id
laa_args[2] = '=ITEM'
lds_bom.f_add_where( 'id;item_type;', laa_args[])
ll_cnt = lds_bom.retrieve( )
if ll_cnt > 0 then 
	ldb_fg_id =  lds_bom.getitemnumber( 1, 'ITEM_ID')
	
	if isnull(ldb_fg_id) or ldb_fg_id = 0 then return 0
	ldb_spec_id =  lds_bom.getitemnumber( 1, 'spec_id')
	ldb_fg_wh =  lds_bom.getitemnumber( 1, 'default_wh')
	ldb_fg_uom = lds_bom.getitemnumber( 1, 'stock_uom')
	
	ll_row_found = rdw_product.insertrow(0)
	rdw_product.setitem(ll_row_found, 'ITEM_ID', ldb_fg_id )
	rdw_product.setitem(ll_row_found, 'BOM_QTY', vdb_plan_qty )
	rdw_product.setitem(ll_row_found, 'ACT_QTY', vdb_act_qty)
	rdw_product.setitem(ll_row_found, 'UOM_ID', ldb_fg_uom)
	rdw_product.setitem(ll_row_found, 'OBJECT_REF_ID', vdb_ref_id)
	rdw_product.setitem(ll_row_found, 'OBJECT_REF_TABLE', 'PRODUCTION_LINE')
	rdw_product.setitem(ll_row_found, 'INPUT_OUTPUT', 'O')
	rdw_product.setitem(ll_row_found, 'ID', this.f_create_id( ) )
	rdw_product.setitem(ll_row_found, 'COMPANY_ID', gi_user_comp_id )
	rdw_product.setitem(ll_row_found, 'BRANCH_ID', gdb_branch )
	rdw_product.setitem(ll_row_found, 'WH_ID', ldb_fg_wh )	
end if

if vs_upd_type = 'actual' then
	ldb_bomline_id = lbo_inst.f_get_bom_line(vdb_bom_id , vdb_act_qty, date(ldt_inst.f_getsysdate( )) )
else
	ldb_bomline_id = lbo_inst.f_get_bom_line(vdb_bom_id , vdb_plan_qty, date(ldt_inst.f_getsysdate( )) )
end if
lds_bom.dataobject = 'd_bom_output_grid'
lds_bom.f_settransobject( sqlca)
laa_args[] = laa_empty[]
laa_args[1] = ldb_bomline_id
lds_bom.f_add_where( 'object_ref_id', laa_args[])

ll_cnt = lds_bom.retrieve( ) 
FOR ll_row = 1 to ll_cnt
	ldb_fg_id = lds_bom.getitemnumber( ll_row, 'ITEM_ID')
	if ldb_fg_id =0  or isnull(ldb_fg_id) then continue 
	ldb_fg_wh = lds_bom.getitemnumber( ll_row, 'FG_WH')
	ldb_spec_id =  lds_bom.getitemnumber( ll_row, 'spec_id')
	ldb_mat_qty = lds_bom.getitemnumber( ll_row, 'MAT_QTY')
	if ldb_mat_qty = 0 or isnull(ldb_mat_qty) then
		ls_code = lbo_inst.f_get_code(ldb_fg_id )
		gf_messagebox('m.c_prod_orders.f_update_product.01','Thông báo','Phụ phẩm sau trong công thức có số lượng TP = 0:@'+ls_code,'information','ok',1)
		continue
	end if
	ldb_fg_qty = lds_bom.getitemnumber( ll_row, 'FG_QTY')
	if ldb_fg_qty = 0 or isnull(ldb_fg_qty) then
		ls_code = lbo_inst.f_get_code(ldb_fg_id )
		gf_messagebox('m.c_prod_orders.f_update_product.02','Thông báo','Phụ phẩm sau trong công thức có số lượng = 0:@'+ls_code,'information','ok',1)
		continue
	end if	
	ldb_fg_uom = lds_bom.getitemnumber( ll_row, 'FG_UOM')
	if ldb_fg_uom = 0 or isnull(ldb_fg_uom) then
		ls_code = lbo_inst.f_get_code(ldb_fg_id )
		gf_messagebox('m.c_prod_orders.f_update_product.03','Thông báo','Phụ phẩm  sau trong công thức không có đơn vị tính:@'+ls_code,'information','ok',1)
		continue
	end if		
	
	ldb_fg_round = this.ic_unit_instance.f_get_round_id(ldb_fg_uom, ldb_fg_id, 'item')
	
//	ll_row_found = rdw_product.find(" ITEM_ID = "+string(ldb_fg_id) + " AND object_ref_id = "+string(vdb_ref_id) ,1 , rdw_product.rowcount() )
//	if ll_row_found = 0 then
		ll_row_found = rdw_product.insertrow(0)
//	end if
	rdw_product.setitem(ll_row_found, 'ITEM_ID', ldb_fg_id )
	

	rdw_product.setitem(ll_row_found, 'BOM_QTY', ic_unit_instance.f_round( rdw_product, ldb_fg_round,vdb_plan_qty*ldb_fg_qty/ldb_mat_qty  ) )
	rdw_product.setitem(ll_row_found, 'ACT_QTY', ic_unit_instance.f_round( rdw_product, ldb_fg_round,vdb_act_qty*ldb_fg_qty/ldb_mat_qty  ) )

	rdw_product.setitem(ll_row_found, 'UOM_ID', ldb_fg_uom)
	rdw_product.setitem(ll_row_found, 'OBJECT_REF_ID', vdb_ref_id)
	rdw_product.setitem(ll_row_found, 'OBJECT_REF_TABLE', ls_ref_table)
	rdw_product.setitem(ll_row_found, 'INPUT_OUTPUT', 'O')
	rdw_product.setitem(ll_row_found, 'ID', this.f_create_id( ) )
	rdw_product.setitem(ll_row_found, 'COMPANY_ID', gi_user_comp_id )
	rdw_product.setitem(ll_row_found, 'BRANCH_ID', gdb_branch )
	rdw_product.setitem(ll_row_found, 'WH_ID', ldb_fg_wh )
	rdw_product.setitem(ll_row_found, 'spec_id', ldb_spec_id )
NEXT



return 1
end function

public function integer f_update_material (double vdb_ref_id, double vdb_bom_id, double vdb_plan_qty, double vdb_act_qty, ref t_dw_mpl rdw_material, string vs_upd_type);double					ldb_bomline_id, ldb_mat_id, ldb_mat_qty, ldb_fg_qty, ldb_mat_uom, ldb_mat_round, ldb_ref_id
double					ldb_mat_wh, ldb_spec_id, ldb_formular_qty_plan, ldb_formular_qty_act
any						laa_args[]
long						ll_row, ll_cnt, ll_row_found
string						ls_code, ls_ref_table, ls_itemtype
boolean					lb_new
t_ds_db					lds_bom
b_obj_instantiate		lbo_inst
c_datetime				ldt_inst

ls_ref_table = upper(rdw_material.describe("DataWindow.Table.UpdateTable"))
rdw_material.setfilter("object_ref_id = "+string(vdb_ref_id))
rdw_material.filter()

lds_bom = create t_ds_db
lds_bom.dataobject = 'd_bom_input_grid'
lds_bom.f_settransobject( sqlca)

if vs_upd_type = 'actual' then
	ldb_bomline_id = lbo_inst.f_get_bom_line(vdb_bom_id , vdb_act_qty, date(ldt_inst.f_getsysdate( )) )
else
	ldb_bomline_id = lbo_inst.f_get_bom_line(vdb_bom_id , vdb_plan_qty, date(ldt_inst.f_getsysdate( )) )
end if
laa_args[1] = ldb_bomline_id
lds_bom.f_add_where( 'object_ref_id', laa_args[])


ll_cnt = lds_bom.retrieve( ) 
FOR ll_row = 1 to ll_cnt
	ldb_mat_id = lds_bom.getitemnumber( ll_row, 'ITEM_ID')
	if ldb_mat_id =0  or isnull(ldb_mat_id) then continue 
	ldb_mat_wh = lds_bom.getitemnumber( ll_row, 'MAT_WH')
	ldb_spec_id = lds_bom.getitemnumber( ll_row, 'spec_id')
	ldb_mat_qty = lds_bom.getitemnumber( ll_row, 'MAT_QTY')
	if ldb_mat_qty = 0 or isnull(ldb_mat_qty) then
		ls_code = lbo_inst.f_get_code(ldb_mat_id )
		gf_messagebox('m.c_prod_orders.f_update_material.01','Thông báo','Nguyên liệu sau trong công thức có số lượng = 0:@'+ls_code,'information','ok',1)
		continue
	end if
	ldb_fg_qty = lds_bom.getitemnumber( ll_row, 'FG_QTY')
	if ldb_fg_qty = 0 or isnull(ldb_fg_qty) then
		ls_code = lbo_inst.f_get_code(ldb_mat_id )
		gf_messagebox('m.c_prod_orders.f_update_material.02','Thông báo','Nguyên liệu sau trong công thức có số lượng sản phẩm = 0:@'+ls_code,'information','ok',1)
		continue
	end if	
	ldb_mat_uom = lds_bom.getitemnumber( ll_row, 'MAT_UOM')
	if ldb_mat_uom = 0 or isnull(ldb_mat_uom) then
		ls_code = lbo_inst.f_get_code(ldb_mat_id )
		gf_messagebox('m.c_prod_orders.f_update_material.03','Thông báo','Nguyên liệu sau trong công thức không có đơn vị tính:@'+ls_code,'information','ok',1)
		continue
	end if		
	ldb_mat_round = this.ic_unit_instance.f_get_round_id(ldb_mat_uom, ldb_mat_id, 'item')
	if ldb_mat_round = -1 then return -1
	
	ls_itemtype = lds_bom.getitemstring( ll_row, 'ITEM_TYPE')	
	//-- kiểm tra item BOM --//
	if ls_itemtype = 'BOM' then
		ldb_formular_qty_plan = ic_unit_instance.f_round( rdw_material, ldb_mat_round,vdb_plan_qty*ldb_mat_qty/ldb_fg_qty )
		ldb_formular_qty_act = ic_unit_instance.f_round( rdw_material, ldb_mat_round,vdb_act_qty*ldb_mat_qty/ldb_fg_qty )
		this.f_update_formula( vdb_ref_id, ldb_mat_id, ldb_formular_qty_plan, ldb_formular_qty_act , rdw_material, vs_upd_type)
		continue 
	end if	
	
	lb_new = false
	if vs_upd_type = 'actual' then
		ll_row_found = rdw_material.find(" OBJECT_REF_ID="+string(vdb_ref_id) +" AND  ITEM_ID = "+string(ldb_mat_id) ,1 , rdw_material.rowcount() )
		if ll_row_found = 0 then
			lb_new= true
			ll_row_found = rdw_material.insertrow(0)
		end if
	else
		ll_row_found = rdw_material.insertrow(0)
		lb_new= true
	end if
	if lb_new then
		rdw_material.setitem(ll_row_found, 'ITEM_ID', ldb_mat_id )	
		rdw_material.setitem(ll_row_found, 'ACT_QTY', ic_unit_instance.f_round( rdw_material, ldb_mat_round,vdb_act_qty*ldb_mat_qty/ldb_fg_qty ))
		rdw_material.setitem(ll_row_found, 'BOM_QTY', ic_unit_instance.f_round( rdw_material, ldb_mat_round,vdb_plan_qty*ldb_mat_qty/ldb_fg_qty ) )
		rdw_material.setitem(ll_row_found, 'UOM_ID', ldb_mat_uom)
		rdw_material.setitem(ll_row_found, 'OBJECT_REF_ID', vdb_ref_id)
		rdw_material.setitem(ll_row_found, 'OBJECT_REF_TABLE', 'PRODUCTION_LINE')
		rdw_material.setitem(ll_row_found, 'INPUT_OUTPUT', 'I')
		rdw_material.setitem(ll_row_found, 'ID', this.f_create_id( ) )
		rdw_material.setitem(ll_row_found, 'COMPANY_ID', gi_user_comp_id )
		rdw_material.setitem(ll_row_found, 'BRANCH_ID', gdb_branch )
		rdw_material.setitem(ll_row_found, 'LINE_NO', ll_row_found )
		rdw_material.setitem(ll_row_found, 'WH_ID', ldb_mat_wh )
		rdw_material.setitem(ll_row_found, 'spec_id', ldb_spec_id )
		rdw_material.setitem(ll_row_found, 'bom_ref_id', vdb_bom_id )
	else
		rdw_material.setitem(ll_row_found, 'ACT_QTY', ic_unit_instance.f_round( rdw_material, ldb_mat_round,vdb_act_qty*ldb_mat_qty/ldb_fg_qty ))
	end if
NEXT

rdw_material.setfilter('')
rdw_material.filter()

return 1
end function

public function integer f_update_formula (double vdb_ref_id, double vdb_bom_id, double vdb_plan_qty, double vdb_act_qty, ref t_dw_mpl rdw_material, string vs_upd_type);double					ldb_bomline_id, ldb_mat_id, ldb_mat_qty, ldb_fg_qty, ldb_mat_uom, ldb_mat_round, ldb_ref_id
double					ldb_mat_wh, ldb_spec_id, ldb_formular_qty_plan, ldb_formular_qty_act
any						laa_args[]
long						ll_row, ll_cnt, ll_row_found
string						ls_code, ls_ref_table, ls_itemtype
boolean					lb_new
t_ds_db					lds_bom
b_obj_instantiate		lbo_inst
c_datetime				ldt_inst

ls_ref_table = upper(rdw_material.describe("DataWindow.Table.UpdateTable"))
rdw_material.setfilter("object_ref_id = "+string(vdb_ref_id))
rdw_material.filter()

lds_bom = create t_ds_db
lds_bom.dataobject = 'd_bom_input_grid'
lds_bom.f_settransobject( sqlca)

if vs_upd_type = 'actual' then
	ldb_bomline_id = lbo_inst.f_get_bom_line(vdb_bom_id , vdb_act_qty, date(ldt_inst.f_getsysdate( )) )
else
	ldb_bomline_id = lbo_inst.f_get_bom_line(vdb_bom_id , vdb_plan_qty, date(ldt_inst.f_getsysdate( )) )
end if
laa_args[1] = ldb_bomline_id
lds_bom.f_add_where( 'object_ref_id', laa_args[])


ll_cnt = lds_bom.retrieve( ) 
FOR ll_row = 1 to ll_cnt
	ldb_mat_id = lds_bom.getitemnumber( ll_row, 'ITEM_ID')
	if ldb_mat_id =0  or isnull(ldb_mat_id) then continue 
	ldb_mat_wh = lds_bom.getitemnumber( ll_row, 'MAT_WH')
	ldb_spec_id = lds_bom.getitemnumber( ll_row, 'spec_id')
	ldb_mat_qty = lds_bom.getitemnumber( ll_row, 'MAT_QTY')
	if ldb_mat_qty = 0 or isnull(ldb_mat_qty) then
		ls_code = lbo_inst.f_get_code(ldb_mat_id )
		gf_messagebox('m.c_prod_orders.f_update_formula.01','Thông báo','Nguyên liệu sau trong công thức có số lượng = 0:@'+ls_code,'information','ok',1)
		continue
	end if
	ldb_fg_qty = lds_bom.getitemnumber( ll_row, 'FG_QTY')
	if ldb_fg_qty = 0 or isnull(ldb_fg_qty) then
		ls_code = lbo_inst.f_get_code(ldb_mat_id )
		gf_messagebox('m.c_prod_orders.f_update_formula.02','Thông báo','Nguyên liệu sau trong công thức có số lượng sản phẩm = 0:@'+ls_code,'information','ok',1)
		continue
	end if	
	ldb_mat_uom = lds_bom.getitemnumber( ll_row, 'MAT_UOM')
	if ldb_mat_uom = 0 or isnull(ldb_mat_uom) then
		ls_code = lbo_inst.f_get_code(ldb_mat_id )
		gf_messagebox('m.c_prod_orders.f_update_formula.03','Thông báo','Nguyên liệu sau trong công thức không có đơn vị tính:@'+ls_code,'information','ok',1)
		continue
	end if		
	ldb_mat_round = this.ic_unit_instance.f_get_round_id(ldb_mat_uom, ldb_mat_id, 'item')
	if ldb_mat_round = -1 then return -1
	ls_itemtype = lds_bom.getitemstring( ll_row, 'ITEM_TYPE')	
	//-- kiểm tra item BOM --//
	if ls_itemtype = 'BOM' then
		gf_messagebox('m.c_prod_orders.f_update_formula.04','Thông báo','Không hỗ trợ công thức con nhiều cấp:@'+ls_code,'information','ok',1)
//		ldb_formular_qty_plan = ic_unit_instance.f_round( rdw_material, ldb_mat_round,vdb_plan_qty*ldb_mat_qty/ldb_fg_qty )
//		ldb_formular_qty_act = ic_unit_instance.f_round( rdw_material, ldb_mat_round,vdb_act_qty*ldb_mat_qty/ldb_fg_qty )
//		this.f_update_formula( vdb_ref_id, ldb_mat_id, ldb_formular_qty_plan, ldb_formular_qty_act, rdw_material, vs_upd_type)
		continue 
	end if	
	
	lb_new = false
	if vs_upd_type = 'actual' then
		ll_row_found = rdw_material.find(" ITEM_ID = "+string(ldb_mat_id),1 , rdw_material.rowcount() )
		if ll_row_found = 0 then
			ll_row_found = rdw_material.insertrow(0)
			lb_new= true
		end if
	else 
		ll_row_found = rdw_material.insertrow(0)
		lb_new= true		
	end if
	if lb_new then 
		rdw_material.setitem(ll_row_found, 'ITEM_ID', ldb_mat_id )	
		rdw_material.setitem(ll_row_found, 'ACT_QTY', ic_unit_instance.f_round( rdw_material, ldb_mat_round,vdb_act_qty*ldb_mat_qty/ldb_fg_qty ))
		rdw_material.setitem(ll_row_found, 'BOM_QTY', ic_unit_instance.f_round( rdw_material, ldb_mat_round,vdb_plan_qty*ldb_mat_qty/ldb_fg_qty ) )
		rdw_material.setitem(ll_row_found, 'UOM_ID', ldb_mat_uom)
		rdw_material.setitem(ll_row_found, 'OBJECT_REF_ID', vdb_ref_id)
		rdw_material.setitem(ll_row_found, 'OBJECT_REF_TABLE', 'PRODUCTION_LINE')
		rdw_material.setitem(ll_row_found, 'INPUT_OUTPUT', 'I')
		rdw_material.setitem(ll_row_found, 'ID', this.f_create_id( ) )
		rdw_material.setitem(ll_row_found, 'COMPANY_ID', gi_user_comp_id )
		rdw_material.setitem(ll_row_found, 'BRANCH_ID', gdb_branch )
		rdw_material.setitem(ll_row_found, 'LINE_NO', ll_row_found )
		rdw_material.setitem(ll_row_found, 'WH_ID', ldb_mat_wh )
		rdw_material.setitem(ll_row_found, 'spec_id', ldb_spec_id )
		rdw_material.setitem(ll_row_found, 'bom_ref_id', vdb_bom_id )
	else
		rdw_material.setitem(ll_row_found, 'ACT_QTY', ic_unit_instance.f_round( rdw_material, ldb_mat_round,vdb_act_qty*ldb_mat_qty/ldb_fg_qty ))
	end if
NEXT

rdw_material.setfilter('')
rdw_material.filter()

return 1
end function

public function integer f_update_material (double vdb_ref_id, double vdb_bom_id, double vdb_plan_qty, double vdb_act_qty, ref t_ds_db rdw_material, string vs_upd_type, ref t_transaction rt_transaction);double					ldb_bomline_id, ldb_mat_id, ldb_mat_qty, ldb_fg_qty, ldb_mat_uom, ldb_mat_round, ldb_ref_id
double					ldb_mat_wh, ldb_spec_id, ldb_formular_qty_plan, ldb_formular_qty_act,ldb_bom_qty,ldb_difference_qty
any						laa_args[]
long						ll_row, ll_cnt, ll_row_found
string						ls_code, ls_ref_table, ls_itemtype,ls_change_qty_yn
boolean					lb_new
t_ds_db					lds_bom
b_obj_instantiate		lbo_inst
c_datetime				ldt_inst

ls_ref_table = upper(rdw_material.describe("DataWindow.Table.UpdateTable"))
rdw_material.setfilter("object_ref_id = "+string(vdb_ref_id))
rdw_material.filter()

lds_bom = create t_ds_db
lds_bom.dataobject = 'd_bom_input_grid'
lds_bom.f_settransobject( sqlca)

if vs_upd_type = 'actual' then
	ldb_bomline_id = lbo_inst.f_get_bom_line(vdb_bom_id , vdb_act_qty, date(ldt_inst.f_getsysdate( )) )
else
	ldb_bomline_id = lbo_inst.f_get_bom_line(vdb_bom_id , vdb_plan_qty, date(ldt_inst.f_getsysdate( )) )
end if
laa_args[1] = ldb_bomline_id
lds_bom.f_add_where( 'object_ref_id', laa_args[])
idb_bomline_id = ldb_bomline_id

ll_cnt = lds_bom.retrieve( ) 
FOR ll_row = 1 to ll_cnt
	ldb_mat_id = lds_bom.getitemnumber( ll_row, 'ITEM_ID')
	if ldb_mat_id =0  or isnull(ldb_mat_id) then continue 
	ldb_mat_wh = lds_bom.getitemnumber( ll_row, 'MAT_WH')
	ldb_spec_id = lds_bom.getitemnumber( ll_row, 'spec_id')
	ldb_mat_qty = lds_bom.getitemnumber( ll_row, 'MAT_QTY')
	if ldb_mat_qty = 0 or isnull(ldb_mat_qty) then
		ls_code = lbo_inst.f_get_code(ldb_mat_id )
		gf_messagebox('m.c_prod_orders.f_update_material.01','Thông báo','Nguyên liệu sau trong công thức có số lượng = 0:@'+ls_code,'information','ok',1)
		continue
	end if
	ldb_fg_qty = lds_bom.getitemnumber( ll_row, 'FG_QTY')
	if ldb_fg_qty = 0 or isnull(ldb_fg_qty) then
		ls_code = lbo_inst.f_get_code(ldb_mat_id )
		gf_messagebox('m.c_prod_orders.f_update_material.02','Thông báo','Nguyên liệu sau trong công thức có số lượng sản phẩm = 0:@'+ls_code,'information','ok',1)
		continue
	end if	
	ldb_mat_uom = lds_bom.getitemnumber( ll_row, 'MAT_UOM')
	if ldb_mat_uom = 0 or isnull(ldb_mat_uom) then
		ls_code = lbo_inst.f_get_code(ldb_mat_id )
		gf_messagebox('m.c_prod_orders.f_update_material.03','Thông báo','Nguyên liệu sau trong công thức không có đơn vị tính:@'+ls_code,'information','ok',1)
		continue
	end if		
	ldb_mat_round = this.ic_unit_instance.f_get_round_id(ldb_mat_uom, ldb_mat_id, 'item')
	if ldb_mat_round = -1 then return -1
	
	ls_itemtype = lds_bom.getitemstring( ll_row, 'ITEM_TYPE')	
	//-- kiểm tra item BOM --//
	if ls_itemtype = 'BOM' then
		ldb_formular_qty_plan = ic_unit_instance.f_round( rt_transaction, ldb_mat_round,vdb_plan_qty*ldb_mat_qty/ldb_fg_qty )
		ldb_formular_qty_act = ic_unit_instance.f_round( rt_transaction, ldb_mat_round,vdb_act_qty*ldb_mat_qty/ldb_fg_qty )
		this.f_update_formula( vdb_ref_id, ldb_mat_id, ldb_formular_qty_plan, ldb_formular_qty_act , rdw_material, vs_upd_type, rt_transaction)
		continue 
	end if	
	
	lb_new = false
	if vs_upd_type = 'actual' then
		ll_row_found = rdw_material.find(" OBJECT_REF_ID="+string(vdb_ref_id) +" AND  ITEM_ID = "+string(ldb_mat_id) ,1 , rdw_material.rowcount() )
		if ll_row_found = 0 then
			lb_new= true
			ll_row_found = rdw_material.insertrow(0)
		end if
	else
		ll_row_found = rdw_material.insertrow(0)
		lb_new= true
	end if
	if lb_new then
		rdw_material.setitem(ll_row_found, 'ITEM_ID', ldb_mat_id )	
		rdw_material.setitem(ll_row_found, 'ACT_QTY', ic_unit_instance.f_round( rt_transaction, ldb_mat_round,vdb_act_qty*ldb_mat_qty/ldb_fg_qty ))
		rdw_material.setitem(ll_row_found, 'BOM_QTY', ic_unit_instance.f_round( rt_transaction, ldb_mat_round,vdb_plan_qty*ldb_mat_qty/ldb_fg_qty ) )
		rdw_material.setitem(ll_row_found, 'UOM_ID', ldb_mat_uom)
		rdw_material.setitem(ll_row_found, 'OBJECT_REF_ID', vdb_ref_id)
		rdw_material.setitem(ll_row_found, 'OBJECT_REF_TABLE', 'PRODUCTION_LINE')
		rdw_material.setitem(ll_row_found, 'INPUT_OUTPUT', 'I')
		rdw_material.setitem(ll_row_found, 'ID', this.f_create_id( ) )
		rdw_material.setitem(ll_row_found, 'COMPANY_ID', gi_user_comp_id )
		rdw_material.setitem(ll_row_found, 'BRANCH_ID', gdb_branch )
		rdw_material.setitem(ll_row_found, 'LINE_NO', ll_row_found )
		rdw_material.setitem(ll_row_found, 'WH_ID', ldb_mat_wh )
		rdw_material.setitem(ll_row_found, 'spec_id', ldb_spec_id )
		rdw_material.setitem(ll_row_found, 'bom_ref_id', vdb_bom_id )
	else
		rdw_material.setitem(ll_row_found, 'ACT_QTY', ic_unit_instance.f_round( rt_transaction, ldb_mat_round,vdb_act_qty*ldb_mat_qty/ldb_fg_qty ))
		//-- update chênh lệch --//
		ldb_bom_qty = rdw_material.getitemnumber(ll_row_found,'BOM_QTY') 
		ldb_difference_qty = ldb_bom_qty - (vdb_act_qty*ldb_mat_qty/ldb_fg_qty)
		rdw_material.setitem(ll_row_found, 'difference_qty', ic_unit_instance.f_round( rt_transaction, ldb_mat_round, ldb_difference_qty))
		ls_change_qty_yn = rdw_material.getitemstring(ll_row_found,'CHANGE_QTY_YN')
		if ls_change_qty_yn = 'Y' then
			rdw_material.setitem(ll_row_found, 'changed_qty', ic_unit_instance.f_round( rt_transaction, ldb_mat_round,ldb_difference_qty +(vdb_act_qty*ldb_mat_qty/ldb_fg_qty) ))
		else
			rdw_material.setitem(ll_row_found, 'changed_qty', ic_unit_instance.f_round( rt_transaction, ldb_mat_round,vdb_act_qty*ldb_mat_qty/ldb_fg_qty ))
		end if
	end if
NEXT

rdw_material.setfilter('')
rdw_material.filter()

return 1
end function

public function integer f_update_formula (double vdb_ref_id, double vdb_bom_id, double vdb_plan_qty, double vdb_act_qty, ref t_ds_db rdw_material, string vs_upd_type, ref t_transaction rt_transaction);double					ldb_bomline_id, ldb_mat_id, ldb_mat_qty, ldb_fg_qty, ldb_mat_uom, ldb_mat_round, ldb_ref_id
double					ldb_mat_wh, ldb_spec_id, ldb_formular_qty_plan, ldb_formular_qty_act
any						laa_args[]
long						ll_row, ll_cnt, ll_row_found
string						ls_code, ls_ref_table, ls_itemtype
boolean					lb_new
t_ds_db					lds_bom
b_obj_instantiate		lbo_inst
c_datetime				ldt_inst

ls_ref_table = upper(rdw_material.describe("DataWindow.Table.UpdateTable"))
rdw_material.setfilter("object_ref_id = "+string(vdb_ref_id))
rdw_material.filter()

lds_bom = create t_ds_db
lds_bom.dataobject = 'd_bom_input_grid'
lds_bom.f_settransobject( sqlca)

if vs_upd_type = 'actual' then
	ldb_bomline_id = lbo_inst.f_get_bom_line(vdb_bom_id , vdb_act_qty, date(ldt_inst.f_getsysdate( )) )
else
	ldb_bomline_id = lbo_inst.f_get_bom_line(vdb_bom_id , vdb_plan_qty, date(ldt_inst.f_getsysdate( )) )
end if
laa_args[1] = ldb_bomline_id
lds_bom.f_add_where( 'object_ref_id', laa_args[])


ll_cnt = lds_bom.retrieve( ) 
FOR ll_row = 1 to ll_cnt
	ldb_mat_id = lds_bom.getitemnumber( ll_row, 'ITEM_ID')
	if ldb_mat_id =0  or isnull(ldb_mat_id) then continue 
	ldb_mat_wh = lds_bom.getitemnumber( ll_row, 'MAT_WH')
	ldb_spec_id = lds_bom.getitemnumber( ll_row, 'spec_id')
	ldb_mat_qty = lds_bom.getitemnumber( ll_row, 'MAT_QTY')
	if ldb_mat_qty = 0 or isnull(ldb_mat_qty) then
		ls_code = lbo_inst.f_get_code(ldb_mat_id )
		gf_messagebox('m.c_prod_orders.f_update_formula.01','Thông báo','Nguyên liệu sau trong công thức có số lượng = 0:@'+ls_code,'information','ok',1)
		continue
	end if
	ldb_fg_qty = lds_bom.getitemnumber( ll_row, 'FG_QTY')
	if ldb_fg_qty = 0 or isnull(ldb_fg_qty) then
		ls_code = lbo_inst.f_get_code(ldb_mat_id )
		gf_messagebox('m.c_prod_orders.f_update_formula.02','Thông báo','Nguyên liệu sau trong công thức có số lượng sản phẩm = 0:@'+ls_code,'information','ok',1)
		continue
	end if	
	ldb_mat_uom = lds_bom.getitemnumber( ll_row, 'MAT_UOM')
	if ldb_mat_uom = 0 or isnull(ldb_mat_uom) then
		ls_code = lbo_inst.f_get_code(ldb_mat_id )
		gf_messagebox('m.c_prod_orders.f_update_formula.03','Thông báo','Nguyên liệu sau trong công thức không có đơn vị tính:@'+ls_code,'information','ok',1)
		continue
	end if		
	ldb_mat_round = this.ic_unit_instance.f_get_round_id(ldb_mat_uom, ldb_mat_id, 'item')
	if ldb_mat_round = -1 then return -1
	ls_itemtype = lds_bom.getitemstring( ll_row, 'ITEM_TYPE')	
	//-- kiểm tra item BOM --//
	if ls_itemtype = 'BOM' then
		gf_messagebox('m.c_prod_orders.f_update_formula.04','Thông báo','Không hỗ trợ công thức con nhiều cấp:@'+ls_code,'information','ok',1)
//		ldb_formular_qty_plan = ic_unit_instance.f_round( rdw_material, ldb_mat_round,vdb_plan_qty*ldb_mat_qty/ldb_fg_qty )
//		ldb_formular_qty_act = ic_unit_instance.f_round( rdw_material, ldb_mat_round,vdb_act_qty*ldb_mat_qty/ldb_fg_qty )
//		this.f_update_formula( vdb_ref_id, ldb_mat_id, ldb_formular_qty_plan, ldb_formular_qty_act, rdw_material, vs_upd_type)
		continue 
	end if	
	
	lb_new = false
	if vs_upd_type = 'actual' then
		ll_row_found = rdw_material.find(" ITEM_ID = "+string(ldb_mat_id),1 , rdw_material.rowcount() )
		if ll_row_found = 0 then
			ll_row_found = rdw_material.insertrow(0)
			lb_new= true
		end if
	else 
		ll_row_found = rdw_material.insertrow(0)
		lb_new= true		
	end if
	if lb_new then 
		rdw_material.setitem(ll_row_found, 'ITEM_ID', ldb_mat_id )	
		rdw_material.setitem(ll_row_found, 'ACT_QTY', ic_unit_instance.f_round( rt_transaction, ldb_mat_round,vdb_act_qty*ldb_mat_qty/ldb_fg_qty ))
		rdw_material.setitem(ll_row_found, 'BOM_QTY', ic_unit_instance.f_round( rt_transaction, ldb_mat_round,vdb_plan_qty*ldb_mat_qty/ldb_fg_qty ) )
		rdw_material.setitem(ll_row_found, 'UOM_ID', ldb_mat_uom)
		rdw_material.setitem(ll_row_found, 'OBJECT_REF_ID', vdb_ref_id)
		rdw_material.setitem(ll_row_found, 'OBJECT_REF_TABLE', 'PRODUCTION_LINE')
		rdw_material.setitem(ll_row_found, 'INPUT_OUTPUT', 'I')
		rdw_material.setitem(ll_row_found, 'ID', this.f_create_id( ) )
		rdw_material.setitem(ll_row_found, 'COMPANY_ID', gi_user_comp_id )
		rdw_material.setitem(ll_row_found, 'BRANCH_ID', gdb_branch )
		rdw_material.setitem(ll_row_found, 'LINE_NO', ll_row_found )
		rdw_material.setitem(ll_row_found, 'WH_ID', ldb_mat_wh )
		rdw_material.setitem(ll_row_found, 'spec_id', ldb_spec_id )
		rdw_material.setitem(ll_row_found, 'bom_ref_id', vdb_bom_id )
	else
		rdw_material.setitem(ll_row_found, 'ACT_QTY', ic_unit_instance.f_round( rt_transaction, ldb_mat_round,vdb_act_qty*ldb_mat_qty/ldb_fg_qty ))
	end if
NEXT

rdw_material.setfilter('')
rdw_material.filter()

return 1
end function

on c_prod_orders.create
call super::create
end on

on c_prod_orders.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = false
this.ib_keyboardlocked = true
is_display_model = 'up_1d_lo_1d_tb'
is_object_title = 'Lệnh sản xuất'
istr_actionpane[1].s_description = is_object_title
is_exrate_type = 'buy'

istr_actionpane[1].s_button_name = 'b_preview;b_view_qt;b_view_qt_kni_eng;b_send_2_approve;b_approve;b_reject;b_complete;b_lose;b_excel;'
istr_actionpane[1].s_button_name += 'b_doc_trace;b_cancel;b_self_copy;e_add;e_modify;e_delete;'
istr_actionpane[1].s_button_has_sub ='b_related_object;b_update;b_approve;b_view;b_copyt;b_copyf;'
istr_actionpane[1].sa_sub_button[1]='u_so;'
istr_actionpane[1].sa_subbutton_name[1]='Đơn bán hàng(SO);'
istr_actionpane[1].sa_sub_button[2]='b_complete;b_lose;b_excel;'
istr_actionpane[1].sa_subbutton_name[2]='Thành công;Không thành;Excel;'
istr_actionpane[1].sa_sub_button[3]=''	//'b_send_2_approve;b_approve;b_reject;'
istr_actionpane[1].sa_subbutton_name[3]=''	//'Gửi duyệt;Duyệt;Trả duyệt'
istr_actionpane[1].sa_sub_button[4]='b_view_qt;b_view_qt_kni_eng;'
istr_actionpane[1].sa_subbutton_name[4]='Chào giá;Chào giá ENG;'
istr_actionpane[1].sa_sub_button[5]=''
istr_actionpane[1].sa_subbutton_name[5]=''
istr_actionpane[1].sa_sub_button[6]=''
istr_actionpane[1].sa_subbutton_name[6]=''
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add_multi;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_release;b_process;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_release;b_process;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons =  'b_add_multi;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_post;b_view_multi;b_estimate;b_process;'
						else
							istr_actionpane[li_idx].s_visible_buttons =  'b_add_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_post;b_view_multi;b_estimate;b_process;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_post;b_view_multi;b_estimate;b_process;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_post;b_view_multi;b_estimate;b_process;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =   'b_pr;b_so;'
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

iw_display.f_set_ii_upperpart_height(1/2 )

iw_display.f_set_ii_leftpart_width( 1/5)

return 0
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;long				ll_row
t_dw_mpl 		ldw_handle


if rpo_dw.dataobject = 'd_document_prod_grid' then
	ldw_handle = iw_display.f_get_dw('d_prod_hdr_form')	
	ll_row = ldw_handle.event e_addrow( )
	ldw_handle.setitem( ll_row, 'doc_type', 'PROD_ORDERS')
	ldw_handle.setitem( ll_row, 'version_no',1)
	ldw_handle.setitem( ll_row, 'trans_date', date(gd_session_date))
elseif rpo_dw.dataobject= 'd_prod_material_grid' or  rpo_dw.dataobject= 'd_prod_product_grid'  or  rpo_dw.dataobject= 'd_prod_consumption_grid'  then
	//-- insert line_no --//
	this.f_update_line_no( rpo_dw, vl_currentrow , 'line_no')
end if
return vl_currentrow
end event

event e_dw_updatestart;call super::e_dw_updatestart;double	 ldb_amount
long		ll_row
if rdw_requester.dataobject= 'd_prod_material_grid' or  rdw_requester.dataobject= 'd_prod_product_grid'   then
	//-- insert line_no --//
	this.f_update_line_no( rdw_requester, 1 , 'line_no')
elseif pos(rdw_requester.dataobject,'d_prod_line_') > 0 then
	FOr ll_row = 1 to rdw_requester.rowcount()
		ldb_amount =rdw_requester.getitemnumber(ll_row, 'amount')
		rdw_requester.setitem(ll_row, 'base_amount',ldb_amount)
	NEXT
end if
return 0
end event

event e_window_e_prepost;call super::e_window_e_prepost;string				ls_status
t_dw_mpl 		ldw_main

ldw_main = this.iw_display.f_get_dwmain( )

if isvalid(ldw_main) then
	if ldw_main.getrow( ) > 0 then
		ls_status = ldw_main.getitemstring( ldw_main.getrow(), 'status' )
		if ls_status <> 'processing' then
			gf_messagebox('m.c_prod_orders.e_window_e_prepost.01','Thông báo','Lệnh SX phải có trạng thái "Đang thực hiện" mới có thể ghi sổ','information','ok',1)
			return -1
		end if
	end if
end if
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;double			ldb_price, ldb_qty,ldb_changed_qty,ldb_act_qty,ldb_bom_qty,ldb_difference_qty,ldb_item_id,ldb_uom,ldb_round
string				ls_change_yn
t_transaction	lt_transaction

if ancestorreturnvalue = 1 then return 1
/*
if pos(rpo_dw.dataobject, 'd_prod_line_') > 0  then
	//-- update  --//
	
	if vs_colname = 'input_qty' then
		ldb_price = rpo_dw.getitemnumber(vl_currentrow,'price')
		if isnull(ldb_price) then ldb_price = 0
		if vs_editdata = '' or isnull(vs_editdata) then
			ldb_qty = 0 
		else
			ldb_qty = double(vs_editdata)
		end if
		rpo_dw.setitem(vl_currentrow, 'amount', ldb_qty*ldb_price)
		rpo_dw.setitem(vl_currentrow, 'base_amount', ldb_qty*ldb_price)
	elseif vs_colname = 'price' then
		ldb_qty = rpo_dw.getitemnumber(vl_currentrow,'input_qty')
		if isnull(ldb_qty) then ldb_qty = 0
		if vs_editdata = '' or isnull(vs_editdata) then
			ldb_price = 0 
		else
			ldb_price = double(vs_editdata)
		end if
		rpo_dw.setitem(vl_currentrow, 'amount', ldb_qty*ldb_price)
		rpo_dw.setitem(vl_currentrow, 'base_amount', ldb_qty*ldb_price)
	elseif vs_colname = 'act_qty' then
		
	end if
elseif pos(rpo_dw.dataobject, 'd_prod_material_') > 0  then
	if vs_colname = 'change_qty_yn' then
		ls_change_yn = vs_editdata
	else
		ls_change_yn = rpo_dw.getitemstring(vl_currentrow,'change_qty_yn')
	end if
	ldb_act_qty =  rpo_dw.getitemnumber(vl_currentrow,'act_qty')
	ldb_item_id =  rpo_dw.getitemnumber(vl_currentrow,'item_id')
	ldb_uom =  rpo_dw.getitemnumber(vl_currentrow,'uom_id')
	ldb_bom_qty = rpo_dw.getitemnumber(vl_currentrow,'BOM_QTY')
	iw_display.f_get_transaction( lt_transaction)
	ldb_round = this.ic_unit_instance.f_get_round_id(ldb_uom, ldb_item_id, 'item')		
	ldb_difference_qty = rpo_dw.getitemnumber(vl_currentrow,'difference_qty')
	if ls_change_yn = 'Y' then
		rpo_dw.setitem(vl_currentrow, 'changed_qty', ic_unit_instance.f_round( lt_transaction, ldb_round,ldb_difference_qty + ldb_act_qty ))
	else
		rpo_dw.setitem(vl_currentrow, 'changed_qty', ic_unit_instance.f_round( lt_transaction, ldb_round,ldb_act_qty ))
	end if
end if
*/
return 0
end event

event e_window_open;call super::e_window_open;iw_display.f_set_text_cbx_1( 'Xem tất cả nguyên liệu', false)
return 0
end event

event e_cbx_clicked;call super::e_cbx_clicked;if rcbx_handling.checked then
	this.f_doc_filter(  'd_prod_material_grid', true)			
	this.f_doc_filter(  'd_prod_consumption_grid', true)
else
	this.f_doc_filter(  'd_prod_material_grid', false)
	this.f_doc_filter(  'd_prod_consumption_grid', false)
end if
return 0
end event

