$PBExportHeader$c_prod_orders.sru
forward
global type c_prod_orders from b_doc
end type
end forward

global type c_prod_orders from b_doc
event type integer e_action_process ( )
event type integer e_action_estimate ( )
event type integer e_action_copmlete ( )
event type integer e_action_reopen ( )
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

event type integer e_action_process();double				ldb_id
string					ls_status
t_dw_mpl			ldw_main

//-- cập nhật trạng thái : planned --//
ldw_main =  this.iw_display.f_get_dwmain( )
ls_status = ldw_main.getitemstring( ldw_main.getrow(), 'status')
if ls_status = 'planned' then
	ldb_id =  ldw_main.getitemnumber( ldw_main.getrow(), 'id')
	connect using it_transaction;
	Update document set status = 'processing' where id = :ldb_id using it_transaction;	
	commit using it_transaction;
	ldw_main.event e_refresh( )	
	disconnect using it_transaction;
end if
return 0
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

event type integer e_action_copmlete();double				ldb_id
string					ls_status
t_dw_mpl			ldw_main

//-- cập nhật trạng thái : planned --//
ldw_main =  this.iw_display.f_get_dwmain( )
ls_status = ldw_main.getitemstring( ldw_main.getrow(), 'status')
if ls_status = 'processing' then
	ldb_id =  ldw_main.getitemnumber( ldw_main.getrow(), 'id')
	connect using it_transaction;
	Update document set status = 'completed' where id = :ldb_id using it_transaction;
	commit using it_transaction;
	ldw_main.event e_refresh( )	
	disconnect using it_transaction;
end if
return 0
end event

event type integer e_action_reopen();double				ldb_id
string					ls_status
t_dw_mpl			ldw_main

//-- cập nhật trạng thái : planned --//
ldw_main =  this.iw_display.f_get_dwmain( )
ls_status = ldw_main.getitemstring( ldw_main.getrow(), 'status')
if ls_status = 'completed' then
	ldb_id =  ldw_main.getitemnumber( ldw_main.getrow(), 'id')
	connect using it_transaction;
	Update document set status = 'planned' where id = :ldb_id using it_transaction;
	commit using it_transaction;
	ldw_main.event e_refresh( )	
	disconnect using it_transaction;
end if
return 0
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
istr_dwo[2].s_master_keycol = 'version_id;OBJECT_REF_TABLE;'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;OBJECT_REF_TABLE;'
istr_dwo[2].b_ref_table_yn  = false
istr_dwo[2].s_ref_table_field = ''
istr_dwo[2].b_relation_1_1 = false
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].b_focus_master = false
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
iastr_dwo_tabpage[1].str_dwo[1].b_master = false
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_prod_line_kd_grid;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[1].str_dwo[1].b_insert = false
iastr_dwo_tabpage[1].str_dwo[1].b_update = true
iastr_dwo_tabpage[1].str_dwo[1].b_delete = false
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
iastr_dwo_tabpage[2].str_dwo[1].b_master = false
iastr_dwo_tabpage[2].str_dwo[1].b_detail = true
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_prod_line_kd_grid;'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[2].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[2].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[2].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[2].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[2].str_dwo[1].b_insert = false
iastr_dwo_tabpage[2].str_dwo[1].b_update = true
iastr_dwo_tabpage[2].str_dwo[1].b_delete = false
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
iastr_dwo_tabpage[3].str_dwo[1].b_master = false
iastr_dwo_tabpage[3].str_dwo[1].b_detail = true
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
istr_dwo_related[1].s_text = 'In lệnh sản xuất'

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

istr_dwo_related[7].s_related_obj_name = 'b_view'				// đối tượng copy đến
istr_dwo_related[7].s_main_obj_dwo = 'd_document_prod_grid'		//datawindow quan hệ main
istr_dwo_related[7].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[7].s_related_obj_dwo = 'dv_prod_sample_form'	// datawindow quan hệ đến
istr_dwo_related[7].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[7].s_relatedtext_column = 'code'					
istr_dwo_related[7].s_text = 'In phiếu làm mẫu'

istr_dwo_related[8].s_related_obj_name = 'u_qt'					// đối tượng copy đến
istr_dwo_related[8].s_main_obj_dwo = 'd_document_prod_grid'		//datawindow quan hệ main
istr_dwo_related[8].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[8].s_related_obj_dwo = 'd_document_qt_grid'	// datawindow quan hệ đến
istr_dwo_related[8].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[8].b_f_matching = true
istr_dwo_related[8].s_relatedtext_column = 'code'		
istr_dwo_related[8].s_text = 'Chào giá từ: '

istr_dwo_related[8].s_main_obj_dwo_copy[1] = 'd_document_prod_grid' // datawindow copy từ
istr_dwo_related[8].s_main_obj_column_copy[1] = 'dr_cr_object;dr_cr_object;' // cột copy từ
istr_dwo_related[8].s_related_obj_dwo_copy[1] = 'd_document_qt_form' //datawindow copy đến
istr_dwo_related[8].s_related_obj_column_copy[1] = 'object_id;bill_to_object;' // cột copy đến
istr_dwo_related[8].s_f_default_col[1] = 'DEFAULT_CURRENCY;SELL_RATE;PAYMENT_TERM;PAYMENT_METHOD;DELIVERY_MODE;'
istr_dwo_related[8].s_main_dft_obj_col[1] = 'dr_cr_object'
istr_dwo_related[8].s_t_default_col[1] = 'CURRENCY_ID;EXCHANGE_RATE;PAYMENT_TERM;PAYMENT_METHOD;DELIVERY_MODE;'
istr_dwo_related[8].s_main_obj_column_chk[1] = ''
istr_dwo_related[8].s_related_obj_column_chk[1] = ''

istr_dwo_related[8].s_main_obj_dwo_copy[2] = 'd_prod_line_kd_grid' // datawindow copy từ
istr_dwo_related[8].s_main_obj_column_copy[2] = 'OBJECT_ID;object_name;total_QTY;TRANS_UOM;' // cột copy từ
istr_dwo_related[8].s_related_obj_dwo_copy[2] = 'd_qt_line_grid' //datawindow copy đến
istr_dwo_related[8].s_related_obj_column_copy[2] = 'ITEM_ID;LINE_TEXT;QTY;TRANS_UOM;' // cột copy đến
istr_dwo_related[8].s_main_obj_column_chk[2] = ''
istr_dwo_related[8].s_related_obj_column_chk[2] = ''
istr_dwo_related[8].s_match_f_dwo[2] ='d_prod_line_kd_grid'
istr_dwo_related[8].s_match_f_col_obj[2] = 'OBJECT_ID'
istr_dwo_related[8].s_match_t_dwo[2] = 'd_qt_line_grid'
istr_dwo_related[8].s_match_f_column[2] = 'total_QTY'
istr_dwo_related[8].s_match_t_column[2] = 'qty'
istr_dwo_related[8].s_match_column[2] = 'qty'
istr_dwo_related[8].s_main_obj_column_sum[2] = 'total_QTY'
istr_dwo_related[8].s_related_obj_column_sum[2] = 'QTY'
istr_dwo_related[8].s_f_obj_column_chk[2] = 'OBJECT_ID'
istr_dwo_related[8].s_t_obj_column_chk[2] = 'ITEM_ID'
istr_dwo_related[8].s_match_minus_dwo[2] = '' //dwo không tính là đã match
istr_dwo_related[8].b_f_sum[2] = true

istr_dwo_related[8].s_main_obj_dwo_copy[3] = 'd_tax_line_grid' // datawindow copy từ
istr_dwo_related[8].s_main_obj_column_copy[3] = 'tax_pct;tax_amt;tax_correction;tax_id;TRANS_CURRENCY;exchange_rate;' // cột copy từ
istr_dwo_related[8].s_related_obj_dwo_copy[3] = 'd_tax_line_grid' //datawindow copy đến
istr_dwo_related[8].s_related_obj_column_copy[3] = 'tax_pct;tax_amt;tax_correction;tax_id;TRANS_CURRENCY;exchange_rate;' // cột copy đến
istr_dwo_related[8].s_main_obj_column_chk[3] = ''
istr_dwo_related[8].s_related_obj_column_chk[3] = ''

istr_dwo_related[8].b_copy_line[3] = true
// khai báo cập nhật bản matching
istr_dwo_related[8].s_match_f_dwo[3] = ''
istr_dwo_related[8].s_match_f_col_obj[3] = ''
istr_dwo_related[8].s_match_t_dwo[3] = ''
istr_dwo_related[8].s_match_f_column[3] = ''
istr_dwo_related[8].s_match_t_column[3] = ''
istr_dwo_related[8].s_match_column[3] = ''
istr_dwo_related[8].s_main_obj_column_sum[3] = ''
istr_dwo_related[8].s_related_obj_column_sum[3] = ''
istr_dwo_related[8].s_f_obj_column_chk[3] = ''
istr_dwo_related[8].s_t_obj_column_chk[3] = ''
istr_dwo_related[8].s_match_minus_dwo[3] = '' //dwo không tính là đã match
istr_dwo_related[8].b_f_sum[3] = true
istr_dwo_related[8].s_main_dr_cr_obj_dwo_sum[3]=''
istr_dwo_related[8].s_main_dr_cr_obj_column_sum[3]=''
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

istr_actionpane[1].s_button_name = 'b_preview;b_send_2_approve;b_approve;b_reject;b_copyt;u_so;b_view;e_action_process;e_action_complete;e_action_reopen;'
istr_actionpane[1].s_button_name += 'b_doc_trace;b_cancel;b_self_copy;e_add;e_modify;e_delete;b_view_prod_order;b_view_prod_sample;b_copyt_goods_receipt_misc;b_copyt_goods_delivery_misc;b_copyt_qt;'
istr_actionpane[1].s_button_has_sub ='b_related_object;b_update;b_approve;b_view;b_copyt;b_copyf;'
istr_actionpane[1].sa_sub_button[1]='u_so;'
istr_actionpane[1].sa_subbutton_name[1]='Đơn bán hàng(SO);'
istr_actionpane[1].sa_sub_button[2]='e_action_process;e_action_complete;e_action_reopen;'
istr_actionpane[1].sa_subbutton_name[2]='Thực hiện;Hoàn thành;Mở lại;'
istr_actionpane[1].sa_sub_button[3]=''	//'b_send_2_approve;b_approve;b_reject;'
istr_actionpane[1].sa_subbutton_name[3]=''	//'Gửi duyệt;Duyệt;Trả duyệt'
istr_actionpane[1].sa_sub_button[4]='b_view_prod_sample;b_view_prod_order;'
istr_actionpane[1].sa_subbutton_name[4]='Phiếu làm Mẫu;Lệnh SX;'
istr_actionpane[1].sa_sub_button[5]='b_copyt_goods_delivery_misc;b_copyt_goods_receipt_misc;b_copyt_qt';
istr_actionpane[1].sa_subbutton_name[5]='Tạo xuất kho NVL;Tạo nhập kho TP;Tạo chào giá'
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

iw_display.f_set_ii_upperpart_height(1/3 )

iw_display.f_set_ii_leftpart_width( 1/5)

return 0
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;//-- OVERRIDE --//
any							laa_retrieve[], laa_data[]
double						ldb_version_id, ldb_branch
b_obj_instantiate			lbo_ins
s_str_data					lstr_data


if rpo_dw.dataobject = 'd_document_prod_grid' then
	ldb_version_id = lbo_ins.f_Create_id_ex( it_transaction )
	rpo_dw.setitem(vl_currentrow,'doc_type','PROD_ORDERS')
	rpo_dw.setitem(vl_currentrow,'object_ref_table','BOOKED_SLIP')
	rpo_dw.setitem(vl_currentrow,'version_id',ldb_version_id)
	rpo_dw.setitem(vl_currentrow,'handled_by',gi_userid)
	rpo_dw.setitem(vl_currentrow,'object_name', g_user.f_get_name_of_userid_ex(gi_userid, it_transaction ) )
	rpo_dw.setitem(vl_currentrow,'status','planned')
	rpo_dw.setitem(vl_currentrow,'document_date',date(gd_session_date))
	rpo_dw.setitem(vl_currentrow,'TRANS_DATE',date(gd_session_date))	
	rpo_dw.setitem(vl_currentrow,'count_t_date',date(gd_session_date))
	
	laa_retrieve[1] = upper(mid(this.classname(),3))
	if  lbo_ins.f_is_branch_yn_ex('u_trans_setup', it_transaction )then
		ldb_branch = gdb_branch
	else
		ldb_branch = 0
	end if			
	if this.f_get_dfl_trans_info(laa_retrieve[1]  , ldb_branch, lstr_data,it_transaction ) > 0 then
		idb_trans_id = lstr_data.db_data
		if not isnull(idb_trans_id) and idb_trans_id > 0 then 
			laa_data[1] = idb_trans_id
			this.f_init_object_table(ids_trans_setup, 'd_trans_setup_grid', 'object_ref_id;',laa_data[],laa_retrieve[], it_transaction)
			rpo_dw.setitem(vl_currentrow,'trans_hdr_id',idb_trans_id)
			rpo_dw.setitem(vl_currentrow,'trans_desc',lstr_data.as_data[1] )
			rpo_dw.setitem( vl_currentrow,'QUANTITY_YN',lstr_data.as_data[2] )
			rpo_dw.setitem( vl_currentrow,'VALUE_YN',lstr_data.as_data[3] )	
		end if
	end if	
elseif rpo_dw.dataobject= 'd_prod_line_kd_grid'  then
	//-- insert line_no --//
//	this.f_update_line_no( rpo_dw, vl_currentrow , 'line_no')
end if

return vl_currentrow
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

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;
date 			ld_doc_Date
if ancestorreturnvalue = 1 then return 1

if pos(rpo_dw.dataobject, 'd_document_prod_') > 0  then
	//-- update  --//	
	if vs_colname = 'document_date' then
		rpo_dw.setitem(vl_currentrow, 'trans_date',date( vs_editdata))
		
	end if
end if

return 0
end event

event e_cbx_clicked;call super::e_cbx_clicked;//if rcbx_handling.checked then
//	this.f_doc_filter(  'd_prod_material_grid', true)			
//	this.f_doc_filter(  'd_prod_consumption_grid', true)
//else
//	this.f_doc_filter(  'd_prod_material_grid', false)
//	this.f_doc_filter(  'd_prod_consumption_grid', false)
//end if
return 0
end event

event e_dw_e_postsave;call super::e_dw_e_postsave;double		ldb_customer_id, ldb_doc_id, ldb_extend_id, ldb_base_curr_id, ldb_item_id, ldb_spec_id, ldb_line_id, ldb_lot_id
long			ll_scrap_pct, ll_row
int				li_cnt, li_idx
string			ls_alloc_yn, ls_currCode, ls_currName, ls_qty_yn, ls_val_yn, ls_ref_no
date			ld_trans_date
b_obj_instantiate		lbo_ins
t_dw_mpl				ldw_main

if rpo_dw.dataobject = 'd_document_prod_grid' then
	ldb_doc_id =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'id') 
	ldb_extend_id = rpo_dw.getitemnumber(rpo_dw.getrow(), 'extend_id') 
	ldb_customer_id = rpo_dw.getitemnumber(rpo_dw.getrow(), 'dr_cr_object') 
	ls_alloc_yn = rpo_dw.getitemstring(rpo_dw.getrow(), 'allocation_yn') 
	ls_qty_yn = rpo_dw.getitemstring(rpo_dw.getrow(), 'quantity_yn') 
	ls_val_yn = rpo_dw.getitemstring(rpo_dw.getrow(), 'value_yn') 
	ll_scrap_pct = rpo_dw.getitemnumber(rpo_dw.getrow(), 'qty') 
	ld_trans_date = date(rpo_dw.getitemdatetime(rpo_dw.getrow(), 'trans_date') )
	ic_unit_instance.f_get_base_cur_ex( ldb_base_curr_id, ls_currCode, ls_currName, it_transaction)
	//-- BOOKED_SLIP --//
	if ldb_extend_id > 0 then
		//-- update--//		
		UPDATE booked_slip 
		set dr_cr_object = :ldb_customer_id , invoice_object = :ldb_customer_id, allocation_yn = :ls_alloc_yn, 
			 qty = :ll_scrap_pct , trans_date = :ld_trans_date
		where id = :ldb_extend_id using it_transaction;		
	else 
		//-- insert--//
		ldb_extend_id = rpo_dw.getitemnumber(rpo_dw.getrow(), 'version_id') 
		INSERT into booked_slip (id, object_ref_id, object_ref_Table, company_id, branch_id, created_by, created_Date, last_mdf_by, last_mdf_date,
									value_yn, quantity_yn, CURRENCY_ID, exchange_rate, dr_cr_object, invoice_object, allocation_yn, qty, doc_type,trans_date)
		VALUES (:ldb_extend_id, :ldb_doc_id, 'DOCUMENT',:gi_user_comp_id, :gdb_branch, :gi_userid, sysdate, :gi_userid, sysdate,
					:ls_val_yn, :ls_qty_yn, :ldb_base_curr_id, 1, :ldb_customer_id, :ldb_customer_id, :ls_alloc_yn, :ll_scrap_pct, 'PROD_ORDERS',:ld_trans_date)
		using it_transaction;		
		rpo_dw.setitem(rpo_dw.getrow(), 'extend_id', ldb_extend_id) 
	end if
elseif rpo_dw.dataobject= 'd_prod_line_kd_grid'  then
	ldw_main = rpo_dw.dynamic f_get_idw_master()
	ldb_customer_id = ldw_main.getitemnumber(ldw_main.getrow(), 'dr_cr_object') 
	if isnull(ldb_customer_id) then
		gf_messagebox('m.c_rpod_orders.e_dw_e_postsave.01','Thông báo','Chưa chọn khách hàng !','exclamation','ok',1)
		return -1
	end if

	FOR ll_row = 1 to rpo_dw.rowcount()
		ldb_line_id = rpo_dw.getitemnumber(ll_row, 'id') 
		ldb_item_id = rpo_dw.getitemnumber(ll_row, 'object_id') 
		ldb_spec_id = rpo_dw.getitemnumber(ll_row, 'spec_id') 
		ls_ref_no = rpo_dw.getitemstring(ll_row, 'oper_name') 
		
		//-- check and update SPEC --//
		if isnull(ldb_spec_id) then
			select count(id) into :li_cnt
			from item_spec where object_ref_id = :ldb_item_id and spec_group = :ldb_customer_id using it_transaction;
			if li_cnt = 1 then
				select id into :ldb_spec_id
				from item_spec where object_ref_id = :ldb_item_id and spec_group = :ldb_customer_id using it_transaction;
			elseif li_cnt = 0 then
				ldb_spec_id= lbo_ins.f_create_id_ex( it_transaction)
				INSERT into item_spec (id,company_id,branch_id,created_by,created_date,last_mdf_by, last_mdf_date,object_ref_id,object_ref_table,spec_group)
					VALUES(:ldb_spec_id, :gi_user_comp_id, :gdb_branch, :gi_userid,sysdate,:gi_userid,sysdate,:ldb_item_id ,'OBJECT',:ldb_customer_id)
					using it_transaction;
			end if
			UPDATE production_line set spec_id = :ldb_spec_id where id = :ldb_line_id using it_transaction;
		else
			select count(id) into :li_cnt
			from item_spec where id = :ldb_spec_id and spec_group = :ldb_customer_id using it_transaction;
			if li_cnt = 0 then
				UPDATE item_spec set spec_group = :ldb_customer_id where id = :ldb_spec_id using it_transaction;
			end if
		end if
		//-- check and update ITEM LOT --//
		if trim(ls_ref_no) <> '' then
			select count(id) into :li_cnt
			from item_lot where object_ref_id = :ldb_item_id and lot_no = :ls_ref_no using it_transaction;	
			if li_cnt = 0 then
				ldb_lot_id= lbo_ins.f_create_id_ex( it_transaction)
				INSERT into item_lot (id,company_id,branch_id,created_by,created_date,last_mdf_by, last_mdf_date,object_ref_id,object_ref_table,lot_no)
					VALUES(:ldb_lot_id, :gi_user_comp_id, :gdb_branch, :gi_userid,sysdate,:gi_userid,sysdate,:ldb_item_id ,'OBJECT',:ls_ref_no)
					using it_transaction;
			end if
		end if
	NEXT
end if

return 0
end event

event e_dw_getfocus;call super::e_dw_getfocus;double				ldb_item_id, ldb_object_ref_id, ldb_size_id, ldb_bom_id, ldb_route_id, ldb_doc_version
string					ls_lot_yn
t_dw_mpl			ldw_master

if rdw_handling.dataobject  = 'd_lot_line_kd_grid' then
	if rdw_handling.rowcount() = 0 then
		ldw_master = rdw_handling.f_get_idw_master()
		if ldw_master.accepttext( ) = -1 then return -1
		connect using it_transaction;
		ldw_master.event e_autosave( )
		if ldw_master.getrow( ) > 0 then
			ldb_object_ref_id = ldw_master.getitemnumber( ldw_master.getrow(), 'id')
			ldb_doc_version = ldw_master.getitemnumber( ldw_master.getrow(), 'object_ref_id')
			ldb_item_id = ldw_master.getitemnumber( ldw_master.getrow(), 'object_id')
			if isnull(ldb_item_id) or ldb_item_id = 0 then
				gf_messagebox('m.c_prod_orders.e_dw_getfocus.01','Thông báo','Chưa có thành phẩm SX !','exclamation','ok',1)
				return 0
			end if
			//-- lấy size, lot_yn của item --//			
			select size_id, lot_yn into :ldb_size_id , :ls_lot_yn from item where object_ref_id = :ldb_item_id using it_transaction;
			if ldb_size_id = 0 or isnull(ldb_size_id) then
				gf_messagebox('m.c_prod_orders.e_dw_getfocus.02','Thông báo','Chưa chọn loại size cho sản phẩm !','exclamation','ok',1)
				return 0
			end if
			//-- insert size --//
			if ls_lot_yn = 'Y' then
				INSERT into lot_line(id,company_id,branch_id,created_by, created_date, last_mdf_by, last_mdf_date, object_ref_id, object_ref_table,DOC_VERSION,
											lot_no,serial_no,line_no)
				SELECT ttd.SEQ_TABLE_ID.nextval, :gi_user_comp_id, :gdb_branch, :gi_userid, sysdate, :gi_userid, sysdate,:ldb_object_ref_id, 'PRODUCTION_LINE',:ldb_doc_version,
							'T', vv.code,vv.line_no
						from valueset_value vv where object_ref_id = :ldb_size_id using it_transaction;
				INSERT into lot_line(id,company_id,branch_id,created_by, created_date, last_mdf_by, last_mdf_date, object_ref_id, object_ref_table,DOC_VERSION,
											lot_no,serial_no,line_no)
				SELECT ttd.SEQ_TABLE_ID.nextval, :gi_user_comp_id, :gdb_branch, :gi_userid, sysdate, :gi_userid, sysdate,:ldb_object_ref_id, 'PRODUCTION_LINE',:ldb_doc_version,
							'P', vv.code,vv.line_no
						from valueset_value vv where object_ref_id = :ldb_size_id using it_transaction;						
			else
				INSERT into lot_line(id,company_id,branch_id,created_by, created_date, last_mdf_by, last_mdf_date, object_ref_id, object_ref_table,DOC_VERSION,
											lot_no,serial_no,line_no)
				SELECT ttd.SEQ_TABLE_ID.nextval, :gi_user_comp_id, :gdb_branch, :gi_userid, sysdate, :gi_userid, sysdate,:ldb_object_ref_id, 'PRODUCTION_LINE',:ldb_doc_version,
							'Đôi', vv.code,vv.line_no
						from valueset_value vv where object_ref_id = :ldb_size_id using it_transaction;
			end if
			commit using it_transaction;
			rdw_handling.event e_retrieve()
			disconnect using it_transaction;		
		else 
			disconnect using it_transaction;	
		end if
	end if
elseif rdw_handling.dataobject  = 'd_prod_material_grid' then
	if rdw_handling.rowcount() = 0 then
		ldw_master = rdw_handling.f_get_idw_master()
		if ldw_master.getrow( ) > 0 then
			ldb_object_ref_id = ldw_master.getitemnumber( ldw_master.getrow(), 'id')
			ldb_doc_version = ldw_master.getitemnumber( ldw_master.getrow(), 'object_ref_id')
			ldb_item_id = ldw_master.getitemnumber( ldw_master.getrow(), 'object_id')
			if isnull(ldb_item_id) or ldb_item_id = 0 then
				gf_messagebox('m.c_prod_orders.e_dw_getfocus.01','Thông báo','Chưa có thành phẩm SX !','exclamation','ok',1)
				return 0
			end if
			//-- lấy BOM_ID của item --//
			connect using it_transaction;
			select bom_id into :ldb_bom_id from item where object_ref_id = :ldb_item_id using it_transaction;
			if ldb_bom_id = 0 or isnull(ldb_bom_id) then
				gf_messagebox('m.c_prod_orders.e_dw_getfocus.03','Thông báo','Chưa chọn Công thức NVL cho sản phẩm !','exclamation','ok',1)
				return 0
			end if
			//-- insert size --//
			INSERT into PRODUCTION_DETAIL(id,company_id,branch_id,created_by, created_date, last_mdf_by, last_mdf_date, object_ref_id, object_ref_table,doc_version,
										LINE_NO,BOM_REF_ID,BOM_REF_TABLE, INPUT_OUTPUT)
			SELECT ttd.SEQ_TABLE_ID.nextval, :gi_user_comp_id, :gdb_branch, :gi_userid, sysdate, :gi_userid, sysdate,:ldb_object_ref_id, 'PRODUCTION_LINE',:ldb_doc_version,
						bio.line_no,bio.item_id,'OBJECT', 'I'
					from BOM_INOUT_PUT bio join bom_line bl on bl.id = bio.object_ref_id
                                                     join item i on i.id = bl.object_ref_id
                                                     join object o on o.id = i.object_ref_id  and o.object_ref_table = 'BOM'
                                                     where o.id = :ldb_bom_id using it_transaction;
			commit using it_transaction;
			rdw_handling.event e_retrieve()
			disconnect using it_transaction;			
		end if
	end if
elseif rdw_handling.dataobject  = 'd_prod_resource_grid' then
	if rdw_handling.rowcount() = 0 then
		ldw_master = rdw_handling.f_get_idw_master()
		if ldw_master.getrow( ) > 0 then
			ldb_object_ref_id = ldw_master.getitemnumber( ldw_master.getrow(), 'id')
			ldb_doc_version = ldw_master.getitemnumber( ldw_master.getrow(), 'object_ref_id')
			ldb_item_id = ldw_master.getitemnumber( ldw_master.getrow(), 'object_id')
			if isnull(ldb_item_id) or ldb_item_id = 0 then
				gf_messagebox('m.c_prod_orders.e_dw_getfocus.01','Thông báo','Chưa có thành phẩm SX !','exclamation','ok',1)
				return 0
			end if
			//-- lấy BOM_ID của item --//
			connect using it_transaction;
			select bom_id into :ldb_bom_id from item where object_ref_id = :ldb_item_id using it_transaction;
			if ldb_bom_id = 0 or isnull(ldb_bom_id) then
				gf_messagebox('m.c_prod_orders.e_dw_getfocus.03','Thông báo','Chưa chọn Công thức NVL cho sản phẩm !','exclamation','ok',1)
				return 0
			end if
			//-- lấy ROUTE_ID của item --//
			select bl.route_id into :ldb_route_id from bom_line bl 
                                                     join item i on i.id = bl.object_ref_id
                                                     join object o on o.id = i.object_ref_id  and o.object_ref_table = 'BOM'
                                                     where o.id = :ldb_bom_id using it_transaction;			
			//-- insert resource line --//
			INSERT into PRODUCTION_RESOURCE(id,company_id,branch_id,created_by, created_date, last_mdf_by, last_mdf_date, object_ref_id, object_ref_table,doc_version,
										LINE_NO,ITEM_TYPE,OBJECT_ID, NOTE)
			SELECT ttd.SEQ_TABLE_ID.nextval, :gi_user_comp_id, :gdb_branch, :gi_userid, sysdate, :gi_userid, sysdate,:ldb_object_ref_id, 'PRODUCTION_LINE',:ldb_doc_version,
						bl.line_no, bl.LINE_TYPE, bl.route_id, coalesce(vv.name, o_subRoute.name)
									from bom_line bl 
                                                     join bom_hdr bh on bh.id = bl.object_ref_id
                                                     join object o on o.id = bh.object_ref_id  and o.object_ref_table = 'ROUTE'
                                                     left join valueset_value vv on vv.id = bl.route_id and bl.line_type = 'OPERATION'
                                                     left join object o_subRoute on o_subRoute.id = bl.route_id  and o_subRoute.object_ref_table = bl.line_type
                                                     where o.id = :ldb_route_id using it_transaction;
			commit using it_transaction;
			rdw_handling.event e_retrieve()
			disconnect using it_transaction;			
		end if
	end if	
end if
return ancestorreturnvalue
end event

event e_dw_e_save;call super::e_dw_e_save;long		ll_row
double	ldb_qty, ldb_id
b_obj_instantiate			lbo_ins	
if rpo_dw.dataobject = 'd_lot_line_kd_grid' then
	if rpo_dw.accepttext() = -1 then return -1
	for ll_row = 1 to rpo_dw.rowcount()
		ldb_id = rpo_dw.getitemnumber(ll_row, 'id')
		ldb_qty = rpo_dw.getitemnumber(ll_row, 'qty')
		Update lot_line set qty = :ldb_qty where id = :ldb_id using it_transaction;
	next
	return 0
elseif rpo_dw.dataobject = 'd_prod_material_grid' or  rpo_dw.dataobject = 'd_prod_resource_grid'  then		
	if lbo_ins.f_update_line_no( rpo_dw ) = -1 then return -1
end if
return ancestorreturnvalue
end event

event e_dw_e_predelete;call super::e_dw_e_predelete;string					ls_status, ls_doc_code
double				ldb_version_id, ldb_doc_id
int						li_cnt
t_dw_mpl			ldw_main
b_obj_instantiate	lbo_ins

ldw_main = iw_display.f_get_dwmain( )

ls_status = ldw_main.getitemstring(ldw_main.getrow(), 'status')
if ls_status = 'planned' or  ls_status = 'new' then
	ldb_doc_id =  ldw_main.getitemnumber(ldw_main.getrow(), 'id')
	ldb_version_id = ldw_main.getitemnumber(ldw_main.getrow(), 'version_id')
	select count(id) into :li_cnt from matching where f_doc_id = :ldb_doc_id using it_transaction;
	if li_cnt > 0 then
		select t_doc_id into :ldb_doc_id
			from matching where f_doc_id = :ldb_doc_id  and rownum = 1 using it_transaction;
			
		ls_doc_code = lbo_ins.f_get_doc_code( ldb_doc_id, it_transaction)
		if isnull(ls_doc_code) then ls_doc_code = ''
		gf_messagebox('m.c_qt.e_dw_e_predelete.02','Thông báo','Không xoá được phiếu đã kết với chứng từ khác, có số:@'+ls_doc_code,'stop','ok',1)
		return -1
	end if
	if rpo_dw.dataobject = ldw_main.dataobject then

		//-- delete matching--//
		select count(id) into :li_cnt
		from matching where t_doc_id = :ldb_doc_id using it_transaction;	
		if li_cnt > 0 then
			delete from matching where t_doc_id = :ldb_doc_id using it_transaction;	
		end if		
			
	//-- delele BOOKED_SLIP --//
		delete BOOKED_SLIP where id = :ldb_version_id using it_transaction;
	//-- delele production_line --//
		delete production_line where object_ref_id = :ldb_version_id using it_transaction;
	//-- delele lot_line --//
		delete lot_line where doc_version = :ldb_version_id using it_transaction;
	//-- delele production_detail --//
		delete production_detail where doc_version = :ldb_version_id using it_transaction;
	//-- delele production_resource --//		
		delete production_resource where doc_version = :ldb_version_id using it_transaction;
	elseif rpo_dw.dataobject = 'd_prod_line_kd_grid' then
	//-- delele lot_line --//
		delete lot_line where doc_version = :ldb_version_id using it_transaction;
	//-- delele production_detail --//
		delete production_detail where doc_version = :ldb_version_id using it_transaction;
	//-- delele production_resource --//		
		delete production_resource where doc_version = :ldb_version_id using it_transaction;
	end if
else
	gf_messagebox('m.c_prod_orders.e_dw_e_predelete.01','Thông báo','Chỉ xoá được lệnh có trạng thái là "Kế hoạch" hoặc "Mới" !','information','ok',1)
	return -1
end if

return ancestorreturnvalue
end event

event e_window_e_precopy_to;call super::e_window_e_precopy_to;//-- varify before copy --//

if vs_objectname_to = 'u_qt' then
	
elseif vs_objectname_to = 'u_goods_delivery_misc' then
elseif vs_objectname_to = 'u_goods_receipt_misc' then
end if
return 0
end event

