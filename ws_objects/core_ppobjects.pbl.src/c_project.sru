$PBExportHeader$c_project.sru
forward
global type c_project from b_doc
end type
end forward

global type c_project from b_doc
event type integer e_action_process ( )
event type integer e_action_estimate ( )
end type
global c_project c_project

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
public function integer f_update_formula (double vdb_ref_id, double vdb_bom_id, double vdb_plan_qty, double vdb_act_qty, ref t_ds_db rdw_material, string vs_upd_type, ref t_transaction rt_transaction)
public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[])
public function integer f_update_material (double vdb_ref_id, double vdb_bom_id, double vdb_plan_qty)
public function integer f_drilldown_selection (ref t_dw_mpl rdw_handle, double vdb_bom_ref_id, string vs_item_colname, string vs_selected_yn)
public function boolean f_is_selected (t_dw_mpl vdw_handle, double vdb_object_id, string vs_object_colname)
end prototypes

event type integer e_action_process();//double				ldb_bom_id, ldb_produced_qty, ldb_ref_id, ldb_plan_qty
//long					ll_row
//t_transaction 		lt_transaction
//t_dw_mpl			ldw_prod_line, ldw_material, ldw_product, ldw_main
//t_ds_db				lds_material 
//
//this.iw_display.f_get_transaction( lt_transaction)
//ldw_prod_line = this.iw_display.f_get_dw( 'd_prod_line_grid')
//ldw_material =  this.iw_display.f_get_dw( 'd_prod_material_grid')
//ldw_product = this.iw_display.f_get_dw( 'd_prod_product_grid')
//
//ldw_material.setfilter( '')
//ldw_material.filter( )
//
//lds_material = create t_ds_db
//lds_material.dataobject = ldw_material.dataobject
//lds_material.f_settransobject(lt_transaction )
//ldw_material.rowscopy( 1, ldw_material.rowcount(), primary!, lds_material, 1, primary!)
//lds_material.resetupdate( )
//
////-- Xoa material cũ --//
////if isvalid(ldw_material) then 	
////	for ll_row = 1 to ldw_prod_line.rowcount( )
////		ldb_ref_id = ldw_prod_line.getitemnumber( ll_row, 'ID')
////		ldw_material.setfilter( ' object_ref_id = ' + string(ldb_ref_id) )
////		ldw_material.filter( )
////		if ldw_material.rowcount( ) > 0 then 
////			if ldw_material.event e_delete_all( ) = -1 then 
////				rollback using lt_transaction;
////				this.iw_display.event e_refresh( )
////				return -1
////			end if
////		end if		
////	next
////end if
//
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
////	if isnull(ldb_produced_qty ) or ldb_produced_qty = 0 then continue
////	ldb_plan_qty = ldw_prod_line.getitemnumber( ll_row, 'PLAN_QTY')
////	if isnull(ldb_produced_qty ) then ldb_produced_qty = 0 
//	ldb_ref_id = ldw_prod_line.getitemnumber( ll_row, 'ID')
//	if this.f_update_material(ldb_ref_id, ldb_bom_id , ldb_plan_qty,ldb_produced_qty, lds_material, 'actual',lt_transaction ) = -1 then
////	if this.f_update_material(ldb_ref_id, ldb_bom_id , ldb_plan_qty, ldb_produced_qty, ldw_material, 'actual') = -1 then
//		rollback using lt_transaction;
//		this.iw_display.event e_refresh( )
//		return -1		
//	end if
//	//-- update tp --//
//	if this.f_update_product( ldb_ref_id, ldb_bom_id,ldb_plan_qty, ldb_produced_qty, ldw_product, 'actual') = -1 then
//		rollback using lt_transaction;
//		this.iw_display.event e_refresh( )
//		return -1				
//	end if
//NEXT
//if lds_material.update( true,false) = 1 then
//	lds_material.resetupdate( )
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
//
//destroy lds_material
return 1
end event

event type integer e_action_estimate();double				ldb_bom_id, ldb_plan_qty, ldb_ref_id, ldb_act_qty, ldb_doc_id
long					ll_row, ll_cnt

t_dw_mpl			ldw_proj_line,  ldw_main


ldw_main =  this.iw_display.f_get_dwmain( )
if ldw_main.getrow( ) = 0 then return 0
ldb_doc_id = ldw_main.getitemnumber( ldw_main.getrow( ) , 'ID')
if ldb_doc_id = 0 or isnull(ldb_doc_id) then return 0

ldw_proj_line = this.iw_display.f_get_dw( 'd_proj_line_grid')



//-- Kiểm tra dự án đã kết pur_invoice chưa--//
select count(id) into :ll_cnt from matching where f_doc_id= :ldb_doc_id using it_transaction;
if ll_cnt > 0 then
	gf_messagebox('m.c_project.e_action_estimate.01','Thông báo','Dự án đã kết xuất hoá đơn mua, không được tính lại','stop','ok',1)
	return -1
end if

ll_cnt = ldw_proj_line.rowcount( )
//-- xóa nguyên liệu chính --//
for ll_row = 1 to ll_cnt
	this.of_show_progress( integer(ll_row/ll_cnt*100), 'Đang xoá định mức cũ...')
	ldb_ref_id = ldw_proj_line.getitemnumber(ll_row,'id')
	delete PRODUCTION_DETAIL
	where object_ref_id = :ldb_ref_id using it_transaction;
	
	delete PRODUCTION_RESOURCE
	where object_ref_id = :ldb_ref_id using it_transaction;		
next
this.of_show_progress( 101, 'Đang xoá định mức cũ')


FOR ll_row= 1 to ll_cnt
	
	//-- update NL--//
	ldb_bom_id = ldw_proj_line.getitemnumber( ll_row, 'OBJECT_ID')
	if isnull(ldb_bom_id ) or ldb_bom_id = 0 then continue
	ldb_plan_qty = ldw_proj_line.getitemnumber( ll_row, 'PLAN_QTY')
	ldb_ref_id = ldw_proj_line.getitemnumber( ll_row, 'ID')

	if this.f_update_material(ldb_ref_id, ldb_bom_id , ldb_plan_qty ) = -1 then
		rollback using it_transaction;
		this.iw_display.event e_refresh( )
		return -1		
	end if

NEXT



//-- cập nhật trạng thái : planned --//
ldw_main.setitem( ldw_main.getrow(), 'status', 'planned')
if ldw_main.update( true,false) = 1 then
	ldw_main.resetupdate( )
	commit using  it_transaction;
	ldw_main.event e_refresh( )
	gf_messagebox('m.c_project.e_action_estimate.01','Thông báo','Hoàn thành tính nguyên liệu vật tư','exclamation','ok',1)		
else
	gf_messagebox('m.c_project.e_action_estimate.02','Thông báo','Lỗi cập update trạng thái lệnh SX:@'+it_transaction.sqlerrtext,'stop','ok',1)
	rollback using it_transaction;
	this.iw_display.event e_refresh( )
	return -1		
end if	

return 1
end event

public subroutine f_set_dwo_window ();
istr_dwo[1].s_dwo_default =  'd_document_proj_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_document_proj_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_proj_hdr_form;'
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
istr_dwo[1].s_description = 'Dự án'
istr_dwo[1].s_gb_name = 'gb_6'

istr_dwo[2].s_dwo_default =  'd_proj_hdr_form'
istr_dwo[2].s_dwo_form = 'd_proj_hdr_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = true
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_master = 'd_document_proj_grid;'
istr_dwo[2].s_dwo_details = 'd_proj_line_grid;d_proj_consumption_grid;'
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
istr_dwo[2].s_description = 'Thông tin dự án'


//istr_dwo[3].s_dwo_default =  'd_post_line_charge_grid'
//istr_dwo[3].s_dwo_form = ''
//istr_dwo[3].s_dwo_grid = 'd_post_line_charge_grid'
//istr_dwo[3].b_master = false
//istr_dwo[3].b_detail = true
//istr_dwo[3].b_cascade_del = true
//istr_dwo[3].s_dwo_master = 'd_proj_material_grid;'
//istr_dwo[3].s_dwo_details = ';'
//istr_dwo[3].s_master_keycol = 'ID;'
//istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID;'
//istr_dwo[3].b_ref_table_yn  = true
//istr_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE;'
//istr_dwo[3].b_relation_1_1 = false
//istr_dwo[3].b_insert = true
//istr_dwo[3].b_update = true
//istr_dwo[3].b_delete = true
//istr_dwo[3].b_query = true
//istr_dwo[3].b_print = true
//istr_dwo[3].b_excel = true
//istr_dwo[3].b_traceable = true
//istr_dwo[3].b_keyboardlocked = true
//istr_dwo[3].b_focus_master = true
//istr_dwo[3].s_description = 'Thông tin ghi sổ'
//
//istr_dwo[4].s_dwo_default =  'd_post_line_tax_grid'
//istr_dwo[4].s_dwo_form = ''
//istr_dwo[4].s_dwo_grid = 'd_post_line_tax_grid'
//istr_dwo[4].b_master = false
//istr_dwo[4].b_detail = true
//istr_dwo[4].b_cascade_del = true
//istr_dwo[4].s_dwo_master = 'd_proj_consumption_grid;'
//istr_dwo[4].s_dwo_details = ';'
//istr_dwo[4].s_master_keycol = 'ID;'
//istr_dwo[4].s_detail_keycol = 'OBJECT_REF_ID;'
//istr_dwo[4].b_ref_table_yn  = true
//istr_dwo[4].s_ref_table_field = 'OBJECT_REF_TABLE;'
//istr_dwo[4].b_relation_1_1 = false
//istr_dwo[4].b_insert = true
//istr_dwo[4].b_update = true
//istr_dwo[4].b_delete = true
//istr_dwo[4].b_query = true
//istr_dwo[4].b_print = true
//istr_dwo[4].b_excel = true
//istr_dwo[4].b_traceable = true
//istr_dwo[4].b_keyboardlocked = true
//istr_dwo[4].b_focus_master = true
//istr_dwo[4].s_description = 'Thông tin ghi sổ'


end subroutine

public subroutine f_set_str_unit ();//--Datawindow chứa các cột cần làm tròn--//
istr_unit[1].s_dwo_handing = 'd_proj_product_grid;d_proj_product_grid;d_proj_product_grid;d_proj_product_grid;d_proj_hdr_form;'
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = 'act_qty;bom_qty;cogs;bc;ex'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[1].s_dwo_unit = 'd_proj_line_grid;d_proj_consumption_grid;d_proj_hdr_form;d_proj_hdr_form;d_proj_hdr_form;'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = 'uom_code;uom_code;uom_code;uom_code;EXCHANGE_RATE'
//--Loại làm tròn --//
istr_unit[1].s_type =  'item;item;amount;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[1].s_dwo_object = 'd_proj_product_grid'
//--Cột chứa mã hàng--//
istr_unit[1].s_colname_object = 'object_code'

//--Datawindow chứa các cột cần làm tròn--//
istr_unit[2].s_dwo_handing = 'd_proj_material_grid;d_proj_material_grid;d_proj_material_grid;d_proj_material_grid;d_proj_hdr_form;'
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[2].s_colname_data = 'changed_qty;bom_qty;cogs;bc;ex'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[2].s_colname_convert = ''
istr_unit[2].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[2].s_dwo_unit = 'd_proj_material_grid;d_proj_material_grid;d_proj_hdr_form;d_proj_hdr_form;d_proj_hdr_form'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[2].s_colname_unit = 'uom_code;uom_code;uom_code;uom_code;EXCHANGE_RATE'
//--Loại làm tròn --//
istr_unit[2].s_type =  'item;item;amount;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[2].s_dwo_object = 'd_proj_material_grid'
//--Cột chứa mã hàng--//
istr_unit[2].s_colname_object = 'object_code'

//--Datawindow chứa các cột cần làm tròn--//
istr_unit[3].s_dwo_handing = 'd_proj_consumption_grid;d_proj_consumption_grid;d_proj_consumption_grid;d_proj_hdr_form;d_proj_hdr_form;'
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[3].s_colname_data = 'act_qty;price;cogs;bc;ex'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[3].s_colname_convert = ''
istr_unit[3].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[3].s_dwo_unit = 'd_proj_consumption_grid;d_proj_hdr_form;d_proj_hdr_form;d_proj_hdr_form;d_proj_hdr_form'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[3].s_colname_unit = 'uom_code;uom_code;uom_code;uom_code;EXCHANGE_RATE'
//--Loại làm tròn --//
istr_unit[3].s_type =  'item;price;amount;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[3].s_dwo_object = 'd_proj_consumption_grid'
//--Cột chứa mã hàng--//
istr_unit[3].s_colname_object = 'object_code'

//--Datawindow chứa các cột cần làm tròn--//
istr_unit[4].s_dwo_handing = 'd_proj_line_grid;d_proj_line_grid;d_proj_line_grid;d_proj_hdr_form;d_proj_hdr_form;'
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[4].s_colname_data = 'input_qty;price;amount;bc;ex'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[4].s_colname_convert = ''
istr_unit[4].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[4].s_dwo_unit = 'd_proj_line_grid;d_proj_hdr_form;d_proj_hdr_form;d_proj_hdr_form;d_proj_hdr_form'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[4].s_colname_unit = 'uom_code;uom_code;uom_code;uom_code;EXCHANGE_RATE'
//--Loại làm tròn --//
istr_unit[4].s_type =  'item;price;amount;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[4].s_dwo_object = 'd_proj_line_grid'
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
iastr_dwo_tabpage[1].s_description ='Hạng mục dự án'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_proj_line_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_proj_line_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_popmenu_items = ''
iastr_dwo_tabpage[1].str_dwo[1].b_master = true
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_proj_hdr_form;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = 'd_proj_material_grid;d_proj_resource_grid'
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
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Hạng mục dự án'

iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_display_model = '1tv_1dgb'
iastr_dwo_tabpage[2].i_leftpart_width = 1/4
iastr_dwo_tabpage[2].i_index = 2
iastr_dwo_tabpage[2].s_description ='Hạng mục vật tư'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_proj_mat_sum_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = 'd_proj_mat_sum_grid'
iastr_dwo_tabpage[2].str_dwo[1].b_master = false
iastr_dwo_tabpage[2].str_dwo[1].b_detail = false
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = ';'
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
iastr_dwo_tabpage[2].str_dwo[1].s_description ='Hạng mục vật tư'

iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
//iastr_dwo_tabpage[2].s_display_model = '2d'
iastr_dwo_tabpage[2].i_index = 2
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_default =  'd_proj_material_grid'
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_form = ''
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_grid = 'd_proj_material_grid'
iastr_dwo_tabpage[2].str_dwo[2].b_master = false
iastr_dwo_tabpage[2].str_dwo[2].b_detail = true
iastr_dwo_tabpage[2].str_dwo[2].b_cascade_del = true
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_master = 'd_proj_line_grid;'
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
iastr_dwo_tabpage[2].str_dwo[2].s_description ='Chi tiết Nguyên liệu vật tư'

iastr_dwo_tabpage[3].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[3].s_display_model = '1tv_1dgb'
iastr_dwo_tabpage[3].i_leftpart_width = 1/4
iastr_dwo_tabpage[3].i_index = 3
iastr_dwo_tabpage[3].s_description ='Nhân công'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_default =  'd_proj_res_sum_grid'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_grid = 'd_proj_res_sum_grid'
iastr_dwo_tabpage[3].str_dwo[1].b_master = false
iastr_dwo_tabpage[3].str_dwo[1].b_detail = false
iastr_dwo_tabpage[3].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_master = ';'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_details = ';'
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
iastr_dwo_tabpage[3].str_dwo[1].s_description ='Nhân công'

iastr_dwo_tabpage[3].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[3].s_display_model = '1tv_1dgb'
iastr_dwo_tabpage[3].s_description ='Nhân công'
iastr_dwo_tabpage[3].str_dwo[2].s_dwo_default =  'd_proj_resource_grid'
iastr_dwo_tabpage[3].str_dwo[2].s_dwo_form = ''
iastr_dwo_tabpage[3].str_dwo[2].s_dwo_grid = 'd_proj_resource_grid'
iastr_dwo_tabpage[3].str_dwo[2].b_master = false
iastr_dwo_tabpage[3].str_dwo[2].b_detail = true
iastr_dwo_tabpage[3].str_dwo[2].b_cascade_del = true
iastr_dwo_tabpage[3].str_dwo[2].s_dwo_master = 'd_proj_line_grid;'
iastr_dwo_tabpage[3].str_dwo[2].s_dwo_details = ''
iastr_dwo_tabpage[3].str_dwo[2].s_dwo_shared = ''
iastr_dwo_tabpage[3].str_dwo[2].s_master_keycol = 'ID;'
iastr_dwo_tabpage[3].str_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[3].str_dwo[2].b_ref_table_yn  = false
iastr_dwo_tabpage[3].str_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[3].str_dwo[2].b_insert = true
iastr_dwo_tabpage[3].str_dwo[2].b_update = true
iastr_dwo_tabpage[3].str_dwo[2].b_delete = true
iastr_dwo_tabpage[3].str_dwo[2].b_query = true
iastr_dwo_tabpage[3].str_dwo[2].b_print = true
iastr_dwo_tabpage[3].str_dwo[2].b_excel = true
iastr_dwo_tabpage[3].str_dwo[2].b_keyboardlocked = true
iastr_dwo_tabpage[3].str_dwo[2].b_traceable = true
iastr_dwo_tabpage[3].str_dwo[2].s_description ='Nhân công'


iastr_dwo_tabpage[4].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[4].s_display_model = '1tv_1dgb'
iastr_dwo_tabpage[4].i_leftpart_width = 1/4
iastr_dwo_tabpage[4].i_index = 4
iastr_dwo_tabpage[4].s_description ='Phát sinh khác'
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_default =  'd_proj_consumption_grid'
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_grid = 'd_proj_consumption_grid'
iastr_dwo_tabpage[4].str_dwo[1].b_master = false
iastr_dwo_tabpage[4].str_dwo[1].b_detail = true
iastr_dwo_tabpage[4].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_master = 'd_proj_hdr_form;'
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
iastr_dwo_tabpage[4].str_dwo[1].s_description ='Phát sinh khác'

end subroutine

public subroutine f_set_dwo_related ();

istr_dwo_related[1].s_related_obj_name = 'u_pur_invoice'					// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = 'd_document_proj_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'd_document_ap_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].b_f_matching = true
istr_dwo_related[1].s_relatedtext_column = 'code'		
istr_dwo_related[1].s_text = 'Hóa đơn mua từ: '

istr_dwo_related[1].s_main_obj_dwo_copy[1] = 'd_proj_material_grid' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[1] = 'ITEM_ID;object_code;object_name;BOM_QTY;price;COGS;uom_code;UOM_ID;wh_id' // cột copy từ
istr_dwo_related[1].s_related_obj_dwo_copy[1] = 'd_pur_invoice_line_grid' //datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[1] = 'object_ID;object_code;LINE_TEXT;qty;price;amount;uom_code;TRANS_UOM;warehouse_id' // cột copy đến
istr_dwo_related[1].s_main_obj_column_chk[1] = ''
istr_dwo_related[1].s_related_obj_column_chk[1] = ''
istr_dwo_related[1].s_main_dr_cr_obj_dwo_sum[1]=''
istr_dwo_related[1].s_main_dr_cr_obj_column_sum[1]=''
istr_dwo_related[1].b_copy_line[1] = true
istr_dwo_related[1].b_selected[1] = true
// khai báo cập nhật bản matching
istr_dwo_related[1].s_match_f_dwo[1] = 'd_proj_material_grid'
istr_dwo_related[1].s_match_f_col_obj[1] = 'item_id'
istr_dwo_related[1].s_match_t_dwo[1] = 'd_pur_invoice_line_grid'
istr_dwo_related[1].s_match_f_column[1] = 'BOM_QTY;COGS'
istr_dwo_related[1].s_match_t_column[1] = 'qty;amount'
istr_dwo_related[1].s_match_column[1] = 'qty;trans_value'
istr_dwo_related[1].s_main_obj_column_sum[1] = 'BOM_QTY'
istr_dwo_related[1].s_related_obj_column_sum[1] = 'qty'
istr_dwo_related[1].s_f_obj_column_chk[1] = 'ITEM_ID'
istr_dwo_related[1].s_t_obj_column_chk[1] = 'object_ID'
istr_dwo_related[1].s_match_minus_dwo[1] = 'd_po_line_grid;' //dwo không tính là đã match
istr_dwo_related[1].b_f_sum[1] = true


istr_dwo_related[1].s_main_obj_dwo_copy[2] = 'd_proj_consumption_grid' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[2] = 'ITEM_ID;object_code;object_name;BOM_QTY;price;COGS;uom_code;UOM_ID;wh_id' // cột copy từ
istr_dwo_related[1].s_related_obj_dwo_copy[2] = 'd_pur_invoice_line_grid' //datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[2] = 'object_ID;object_code;LINE_TEXT;QTY;price;amount;uom_code;TRANS_UOM;warehouse_id' // cột copy đến
istr_dwo_related[1].s_main_obj_column_chk[2] = ''
istr_dwo_related[1].s_related_obj_column_chk[2] = ''
istr_dwo_related[1].b_copy_line[2] = true
istr_dwo_related[1].b_selected[2] = true
// khai báo cập nhật bản matching
istr_dwo_related[1].s_match_f_dwo[2] = 'd_proj_consumption_grid'
istr_dwo_related[1].s_match_f_col_obj[2] = 'item_id'
istr_dwo_related[1].s_match_t_dwo[2] = 'd_pur_invoice_line_grid'
istr_dwo_related[1].s_match_f_column[2] = 'BOM_QTY;COGS'
istr_dwo_related[1].s_match_t_column[2] = 'qty;amount'
istr_dwo_related[1].s_match_column[2] = 'qty;trans_value'
istr_dwo_related[1].s_main_obj_column_sum[2] = 'BOM_QTY'
istr_dwo_related[1].s_related_obj_column_sum[2] = 'qty'
istr_dwo_related[1].s_f_obj_column_chk[2] = 'ITEM_ID'
istr_dwo_related[1].s_t_obj_column_chk[2] = 'object_ID'
istr_dwo_related[1].s_match_minus_dwo[2] = 'd_po_line_grid;' //dwo không tính là đã match
istr_dwo_related[1].b_f_sum[2] = true
istr_dwo_related[1].s_main_dr_cr_obj_dwo_sum[2]=''
istr_dwo_related[1].s_main_dr_cr_obj_column_sum[2]=''

istr_dwo_related[1].s_main_obj_dwo_copy[3] = 'd_proj_resource_grid' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[3] = 'OBJECT_ID;object_code;object_name;QTY;price;amount;uom_code;UOM_ID' // cột copy từ
istr_dwo_related[1].s_related_obj_dwo_copy[3] = 'd_pur_invoice_line_grid' //datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[3] = 'object_ID;object_code;LINE_TEXT;QTY;price;amount;uom_code;TRANS_UOM' // cột copy đến
istr_dwo_related[1].s_main_obj_column_chk[3] = ''
istr_dwo_related[1].s_related_obj_column_chk[3] = ''
istr_dwo_related[1].b_copy_line[3] = true
istr_dwo_related[1].b_selected[3] = true
// khai báo cập nhật bản matching
istr_dwo_related[1].s_match_f_dwo[3] = 'd_proj_resource_grid'
istr_dwo_related[1].s_match_f_col_obj[3] = 'OBJECT_ID'
istr_dwo_related[1].s_match_t_dwo[3] = 'd_pur_invoice_line_grid'
istr_dwo_related[1].s_match_f_column[3] = 'QTY;amount'
istr_dwo_related[1].s_match_t_column[3] = 'qty;amount'
istr_dwo_related[1].s_match_column[3] = 'qty;trans_value'
istr_dwo_related[1].s_main_obj_column_sum[3] = 'QTY'
istr_dwo_related[1].s_related_obj_column_sum[3] = 'qty'
istr_dwo_related[1].s_f_obj_column_chk[3] = 'OBJECT_ID'
istr_dwo_related[1].s_t_obj_column_chk[3] = 'object_ID'
istr_dwo_related[1].s_match_minus_dwo[3] = 'd_po_line_grid;' //dwo không tính là đã match
istr_dwo_related[1].b_f_sum[3] = true
istr_dwo_related[1].s_main_dr_cr_obj_dwo_sum[3]=''
istr_dwo_related[1].s_main_dr_cr_obj_column_sum[3]=''

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
lds_bom.dataobject = 'ds_bom_rollup'
lds_bom.f_settransobject( it_transaction )


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

public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[]);int			li_daynum

if rdw_focus.dataobject = 'd_proj_line_grid' then
	li_daynum = Daynumber(today())
	
	ra_args[1] =  relativeDate(today(), 1 - li_daynum )
	ra_args[2] = relativeDate(today(),7 - li_daynum )
	ra_args[3] = relativeDate(today(),8 - li_daynum )
	ra_args[4] = relativeDate(today(), 14 - li_daynum)
	return 4
end if
return 0

end function

public function integer f_update_material (double vdb_ref_id, double vdb_bom_id, double vdb_plan_qty);double					ldb_bom_id, ldb_bom_id_rem
long						ll_row, ll_cnt, ll_level, ll_level_rem, ll_cnt2 
string						ls_bom_ref_str, ls_bom_ref_str_rem
t_ds_db					lds_bom_item, lds_bom_labor, lds_production_detail,lds_production_resource



lds_bom_item = create t_ds_db
lds_bom_item.dataobject = 'ds_bom_detail_item_copy'
lds_bom_item.f_settransobject( sqlca)

lds_bom_labor = create t_ds_db
lds_bom_labor.dataobject = 'ds_bom_detail_labor_copy'
lds_bom_labor.f_settransobject( sqlca)


ll_cnt = lds_bom_item.retrieve(9, vdb_bom_id,vdb_ref_id, gi_user_comp_id, gdb_branch ) 
ll_cnt2 = lds_bom_labor.retrieve(9, vdb_bom_id,vdb_ref_id, gi_user_comp_id, gdb_branch ) 

if ll_cnt > 0 then
	lds_production_detail = create t_ds_db
	lds_production_detail.dataobject = 'ds_production_detail_copy'
	lds_production_detail.f_settransobject( it_transaction)
	
	lds_bom_item.rowscopy( 1, ll_cnt, primary!, lds_production_detail, 1, primary!)
	FOR ll_row = 1 to ll_cnt
		this.of_show_progress( integer(ll_row/(ll_cnt+ll_cnt2)*100), 'Đang cập nhật định mức...')
		
//		ldb_bom_id = lds_production_detail.getitemnumber( ll_row, 'bom_ref_id')
//		ll_level = lds_production_detail.getitemnumber( ll_row, 'bom_level')
//		if ll_level <> ll_level_rem then
//			ll_level_rem = ll_level 
//			ls_bom_ref_str_rem = ls_bom_ref_str
//			ls_bom_ref_str += string(ldb_bom_id) +';'
//		elseif ldb_bom_id <> ldb_bom_id_rem then
//			ls_bom_ref_str = ls_bom_ref_str_rem
//			ls_bom_ref_str += string(ldb_bom_id) +';'
//		end if
		lds_production_detail.setitem( ll_row, 'ID', this.f_create_id( ) )
//		lds_production_detail.setitem( ll_row, 'bom_ref_string', ls_bom_ref_str )
	NEXT
	if lds_production_detail.update( ) = -1 then
		gf_messagebox('m.c_project.f_update_material.01','Thông báo','Lỗi cập nhật vật tư @'+ it_transaction.sqlerrtext ,'information','ok',1)
		rollback using it_transaction;
		return -1
	end if	
end if


if ll_cnt2 > 0 then
	lds_production_resource = create t_ds_db
	lds_production_resource.dataobject = 'ds_production_resource_copy'
	lds_production_resource.f_settransobject( it_transaction)
	
	lds_bom_labor.rowscopy( 1, ll_cnt2, primary!, lds_production_resource, 1, primary!)
	FOR ll_row = 1 to ll_cnt2
		this.of_show_progress( integer((ll_cnt+ll_row)/(ll_cnt+ll_cnt2)*100), 'Đang cập nhật định mức...')
		
//		ldb_bom_id = lds_production_resource.getitemnumber( ll_row, 'bom_ref_id')
//		ll_level = lds_production_resource.getitemnumber( ll_row, 'bom_level')
//		if ll_level <> ll_level_rem then
//			ll_level_rem = ll_level 
//			ls_bom_ref_str_rem = ls_bom_ref_str
//			ls_bom_ref_str += string(ldb_bom_id) +';'
//		elseif ldb_bom_id <> ldb_bom_id_rem then
//			ls_bom_ref_str = ls_bom_ref_str_rem
//			ls_bom_ref_str += string(ldb_bom_id) +';'
//		end if
		lds_production_resource.setitem( ll_row, 'ID', this.f_create_id( ) )
//		lds_production_resource.setitem( ll_row, 'bom_ref_string', ls_bom_ref_str )
	NEXT
	if lds_production_resource.update( ) = -1 then
		gf_messagebox('m.c_project.f_update_material.01','Thông báo','Lỗi cập nhật vật tư @'+ it_transaction.sqlerrtext ,'information','ok',1)
		rollback using it_transaction;
		return -1
	end if	
end if

this.of_show_progress( 101, 'Đang cập nhật định mức...')
destroy lds_production_detail
destroy lds_production_resource
destroy lds_bom_item
destroy lds_bom_labor

return 1
end function

public function integer f_drilldown_selection (ref t_dw_mpl rdw_handle, double vdb_bom_ref_id, string vs_item_colname, string vs_selected_yn);string			ls_findStr, ls_itemtype
long			ll_found
double		ldb_item_id

ls_findStr =    " bom_ref_id = " + string(vdb_bom_ref_id)	
ll_found = rdw_handle.find( ls_findStr, 1, rdw_handle.rowcount())

DO while ll_found > 0 
	ls_itemtype = rdw_handle.getitemstring(ll_found , 'item_type')
	if ls_itemtype = 'ITEM' or ls_itemtype = 'LABOUR' then
		rdw_handle.setitem(ll_found, 'gutter',vs_selected_yn)
	else
		ldb_item_id = rdw_handle.getitemnumber(ll_found , vs_item_colname)
		this.f_drilldown_selection(rdw_handle,ldb_item_id , vs_item_colname, vs_selected_yn)
	end if
	ll_found = rdw_handle.find( ls_findStr, ll_found +1, rdw_handle.rowcount() + 1)
LOOP 						
						
return 1						
end function

public function boolean f_is_selected (t_dw_mpl vdw_handle, double vdb_object_id, string vs_object_colname);string			ls_findStr, ls_itemtype
long			ll_found
double		ldb_item_id

//ls_findStr =    vs_object_colname+ " = " + string(vdb_object_id)	
//ll_found = vdw_handle.find( ls_findStr, 1, rdw_handle.rowcount())
//
//DO while ll_found > 0 
//	ls_itemtype = rdw_handle.getitemstring(ll_found , 'item_type')
//	if ls_itemtype = 'ITEM' or ls_itemtype = 'LABOUR' then
//		rdw_handle.setitem(ll_found, 'gutter',vs_selected_yn)
//	else
//		ldb_item_id = rdw_handle.getitemnumber(ll_found , vs_item_colname)
//		this.f_drilldown_selection(rdw_handle,ldb_item_id , vs_item_colname, vs_selected_yn)
//	end if
//	ll_found = rdw_handle.find( ls_findStr, ll_found +1, rdw_handle.rowcount() + 1)
//LOOP 						
						
return true					
end function

on c_project.create
call super::create
end on

on c_project.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = false
this.ib_keyboardlocked = true
is_display_model = 'up_gp_2d_lo_tb'
is_object_title = 'Dự án'
istr_actionpane[1].s_button_name = 'b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_post;b_unpost;b_estimate;b_view_multi;b_copyt_multi;'
istr_actionpane[1].s_button_has_sub = 'b_copyt_multi'
istr_actionpane[1].sa_sub_button[1]='b_copyt_pur_invoice;'


istr_actionpane[1].sa_enabled_subbutton[]= istr_actionpane[1].sa_sub_button[]

istr_actionpane[1].s_description = is_object_title
is_exrate_type = 'buy'

istr_tvo[1].ds_tv_item = create datastore
istr_tvo[1].ds_tv_item.dataobject = 'ds_proj_bom_tv'
istr_tvo[1].s_popmenu_items = ''

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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_release;b_copyt_multi;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_release;b_copyt_multi;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons =  'b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_estimate;b_copyt_multi;'
						else
							istr_actionpane[li_idx].s_visible_buttons =  'b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_estimate;b_copyt_multi;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_estimate;b_copyt_multi;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_estimate;b_copyt_multi;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =   'b_pur_invoice;'
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

iw_display.f_set_ii_upperpart_height(iw_display.ii_resize_height*2/5 )
iw_display.f_set_ii_fixedpart1_height( iw_display.ii_resize_height*2/5 *2/5)


return 0
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;long				ll_row, ll_handle
t_dw_mpl 		ldw_handle
s_tp_multi		ltp_handle
treeviewitem	l_tvi


if pos(rpo_dw.dataobject, 'd_document_proj') > 0 then
	rpo_dw.setitem(vl_currentrow,'doc_type','PROJECT')
	rpo_dw.setitem( ll_row, 'trans_date', date(gd_session_date))
	ldw_handle = iw_display.f_get_dw('d_proj_hdr_form')	
	ll_row = ldw_handle.event e_addrow( )
	ldw_handle.setitem( ll_row, 'doc_type', 'PROJECT')
	ldw_handle.setitem( ll_row, 'version_no',1)
	ldw_handle.setitem( ll_row, 'trans_date', date(gd_session_date))
elseif rpo_dw.dataobject= 'd_proj_material_grid' or  rpo_dw.dataobject= 'd_proj_product_grid'  or  rpo_dw.dataobject= 'd_proj_consumption_grid'  then
	//-- insert line_no --//
//	this.f_update_line_no( rpo_dw, vl_currentrow , 'line_no')
	if  rpo_dw.dataobject= 'd_proj_consumption_grid' then
		if this.ipo_tv.istr_tv.db_id > 0 then
			rpo_dw.setitem(vl_currentrow, 'bom_ref_id',this.ipo_tv.istr_tv.db_id)
			rpo_dw.setitem(vl_currentrow, 'bom_ref_table','OBJECT')
			rpo_dw.setitem(vl_currentrow, 'INPUT_OUTPUT','I')
		else
			ltp_handle = rpo_dw.getparent()
			ll_handle = ltp_handle.tv_1.finditem(currenttreeitem! , 0)
			if ll_handle > 0 then
				 ltp_handle.tv_1.getitem(ll_handle , l_tvi)	
				 this.ipo_tv.istr_tv = l_tvi.data
				 rpo_dw.setitem(vl_currentrow, 'bom_ref_id',this.ipo_tv.istr_tv.db_id)
				 rpo_dw.setitem(vl_currentrow, 'bom_ref_table','OBJECT')				 
			else
				return -1
			end if
		end if
	end if	
end if
return vl_currentrow
end event

event e_dw_updatestart;call super::e_dw_updatestart;double	 ldb_amount
long		ll_row
if   rdw_requester.dataobject= 'd_proj_line_grid'   then
	//-- insert line_no --//
//	this.f_update_line_no( rdw_requester, 1 , 'line_no')
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

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;double			ldb_price, ldb_qty,ldb_item_id, ldb_bom_ref_id
long				ll_row_found
t_dw_mpl		ldw_mat, ldw_res

if ancestorreturnvalue = 1 then return 1
if pos(rpo_dw.dataobject, 'd_proj_line_') > 0  then
	//-- update  --//
	
	if vs_colname = 'plan_qty' then
		ldb_item_id = rpo_dw.getitemnumber(vl_currentrow,'object_id')
		if isnull(ldb_item_id) then return ancestorreturnvalue
		

		if vs_editdata = '' or isnull(vs_editdata) then
			ldb_qty = 0 
		else
			ldb_qty = double(vs_editdata)
		end if
		select ROLLUP_COST_PRICE
		into :ldb_price
		from ITEM where object_ref_id = :ldb_item_id using sqlca;
		if sqlca.sqlcode = 0 then
			rpo_dw.setitem(vl_currentrow, 'amount', ldb_qty*ldb_price)
		end if
	elseif vs_colname = 'object_code' then
		ldb_item_id = rpo_dw.getitemnumber(vl_currentrow,'object_id')
		if isnull(ldb_item_id) then return ancestorreturnvalue		
		ldb_qty = rpo_dw.getitemnumber(vl_currentrow,'plan_qty')
		if isnull(ldb_qty) then ldb_qty = 0
		
		select ROLLUP_COST_PRICE
		into :ldb_price
		from ITEM where object_ref_id = :ldb_item_id using sqlca;
		if sqlca.sqlcode = 0 then
			rpo_dw.setitem(vl_currentrow, 'amount', ldb_qty*ldb_price)
		end if

	end if
elseif pos(rpo_dw.dataobject, 'd_proj_consumption_') > 0  then
	
	if vs_colname = 'bom_qty' then
		ldb_qty = double(vs_editdata)
		ldb_price = rpo_dw.getitemnumber(vl_currentrow,'price')
//		if isnull(ldb_price) then ldb_price = 0
		rpo_dw.setitem(vl_currentrow, 'cogs', ldb_price*ldb_qty )
	elseif vs_colname = 'price' then
		ldb_price = double(vs_editdata)
		ldb_qty = rpo_dw.getitemnumber(vl_currentrow,'bom_qty')
//		if isnull(ldb_price) then ldb_price = 0
		rpo_dw.setitem(vl_currentrow, 'cogs', ldb_price*ldb_qty )
	end if

end if
return 0
end event

event e_window_open;call super::e_window_open;t_dw_mpl			ldw_main
any				laa_value[]


iw_display.f_set_text_cbx_1( 'Xem tất cả nguyên liệu', false)

//--form parm--//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '=PROJECT'
ldw_main.f_add_where('doc_type',laa_value[])
return 0

end event

event e_cbx_clicked;call super::e_cbx_clicked;//if rcbx_handling.checked then
//	this.f_doc_filter(  'd_proj_material_grid', true)			
//	this.f_doc_filter(  'd_proj_consumption_grid', true)
//else
//	this.f_doc_filter(  'd_proj_material_grid', false)
//	this.f_doc_filter(  'd_proj_consumption_grid', false)
//end if
return 0
end event

event e_dw_e_save;call super::e_dw_e_save;if rpo_dw.dataobject = 'd_proj_mat_sum_grid' or  rpo_dw.dataobject = 'd_proj_res_sum_grid' then
	return 0
end if
return 1
end event

event e_tv_selectionchanged;call super::e_tv_selectionchanged;long					ll_handle, ll_cnt, ll_row, ll_found
double				ldb_item_id, ldb_bom_ref_id
int						li_daynum
treeviewitem 		l_tvi
t_dw_mpl			ldw_handling, ldw_item
s_tp_multi			ltp_hdl
c_datetime			lc_datetime

if isvalid(iw_display) then
	ll_handle = rpo_tv.finditem(currenttreeitem! , 0)
	if ll_handle > 0 then
		rpo_tv.getitem(ll_handle , l_tvi)
		this.ipo_tv =l_tvi.data	
		ltp_hdl = rpo_tv.getparent()
		if ltp_hdl.istr_dwo_tabpage.i_index = 2 then
			ldw_handling = iw_display.f_get_dw( 'd_proj_mat_sum_grid')
			ldw_item = iw_display.f_get_dw( 'd_proj_material_grid')
			li_daynum = Daynumber(today())
			ll_cnt = ldw_handling.retrieve(this.ipo_tv.istr_tv.db_id, relativeDate(today(), 1 - li_daynum ),  relativeDate(today(),7 - li_daynum ),  relativeDate(today(),8 - li_daynum ) ,  relativeDate(today(), 14 - li_daynum))
			if ll_cnt > 0 then
				if  ldw_handling.getitemnumber( ll_cnt, 'sort_seq') = 3 then
					ldb_bom_ref_id = ldw_handling.getitemnumber(1,  'item_id')
					FOR ll_row = 1 to ll_cnt
						ldb_item_id = ldw_handling.getitemnumber( ll_row, 'item_id')									
						ll_found = ldw_item.find( "bom_ref_id = "+string(ldb_bom_ref_id)+" AND item_id = " + string(ldb_item_id) + " AND gutter = 'Y' ", 1, ldw_item.rowcount( ) )
						if ll_found > 0 then
							ldw_handling.setitem( ll_row, 'gutter','Y')
						end if				
					NEXT			
				end if
			end if
		elseif ltp_hdl.istr_dwo_tabpage.i_index = 3 then
			ldw_handling = iw_display.f_get_dw( 'd_proj_res_sum_grid')
			ldw_item = iw_display.f_get_dw( 'd_proj_resource_grid')
			li_daynum = Daynumber(today())
			ll_cnt =  ldw_handling.retrieve(this.ipo_tv.istr_tv.db_id, relativeDate(today(), 1 - li_daynum ),  relativeDate(today(),7 - li_daynum ),  relativeDate(today(),8 - li_daynum ) ,  relativeDate(today(), 14 - li_daynum))
			if ll_cnt > 0 then
				if  ldw_handling.getitemnumber( ll_cnt, 'sort_seq') = 3 then
					ldb_bom_ref_id = ldw_handling.getitemnumber(1,  'object_id')
					FOR ll_row = 1 to ll_cnt
						ldb_item_id = ldw_handling.getitemnumber( ll_row, 'object_id')									
						ll_found = ldw_item.find( "bom_ref_id = "+string(ldb_bom_ref_id)+" AND object_id = " + string(ldb_item_id) + " AND gutter = 'Y' ", 1, ldw_item.rowcount( ) )
						if ll_found > 0 then
							ldw_handling.setitem( ll_row, 'gutter','Y')
						end if				
					NEXT			
				end if
			end if
		elseif  ltp_hdl.istr_dwo_tabpage.i_index = 4 then
			ldw_handling = iw_display.f_get_dw( 'd_proj_consumption_grid')
			ldw_handling.setfilter( "bom_ref_id = "+string(this.ipo_tv.istr_tv.db_id))
			ldw_handling.filter( )
		end if
	else
		return -1
	end if
end if
return 1

end event

event e_dw_e_preretrieve_start;call super::e_dw_e_preretrieve_start;
if rpo_dw.dataobject = 'd_proj_mat_sum_grid' or rpo_dw.dataobject = 'd_proj_res_sum_grid'  then
	return -9
end if
return 0
end event

event e_tab_selectionchanged;call super::e_tab_selectionchanged;any			la_arg[]
long			ll_row
double		ldb_object_id
s_tp_multi	l_tabpage
t_dw_mpl	ldw_proj_line

l_tabpage= rtab_handle.control[rtab_handle.SelectedTab ]
if l_tabpage.tv_1.FindItem(RootTreeItem! , 0) > 0 then return 0
//-- load menu vao treeview --//
istr_tvo[1].ds_tv_item.settransobject(it_transaction )
ldw_proj_line = iw_display.f_get_dw( 'd_proj_line_grid')
FOR ll_row = 1 to ldw_proj_line.rowcount( )
	ldb_object_id = ldw_proj_line.getitemnumber( ll_row , 'object_id')
	if  istr_tvo[1].ds_tv_item.retrieve(gdb_branch, ldb_object_id) > 0 then
		la_arg[1] = gdb_branch
		la_arg[2] = ldb_object_id
		this.f_display_on_tv_new( l_tabpage.tv_1, la_arg)		
		return 0
	end if
NEXT
return 0
end event

event e_dw_e_preinsertrow;call super::e_dw_e_preinsertrow;
if  rpo_dw.dataobject= 'd_proj_consumption_grid' then
		if this.ipo_tv.istr_tv.db_id < 1 or isnull( this.ipo_tv.istr_tv.db_id ) then
			gf_messagebox('m.c_project.e_dw_e_preinsertrow.01','Thông báo','Chưa chọn hạng mục trong khu bên phải','exclamation','ok',1)
			return -1
		end if
	end if
end event

event e_dw_clicked;call super::e_dw_clicked;double 			ldb_bom_ref_id, ldb_item_id
long				ll_row_found
int					li_sort_seq
string				ls_editdata, ls_findStr_mat, ls_findStr_res, ls_findStr, ls_findStr_sub, ls_itemtype, ls_item_colname
t_dw_mpl		ldw_mat, ldw_res, ldw_handle

choose case rdw_handling.dataobject
	case  'd_proj_mat_sum_grid' , 'd_proj_res_sum_grid' 
		if vs_colname = 'gutter' then
			ls_editdata = rdw_handling.getitemstring(vl_currentrow, 'gutter')
			li_sort_seq = rdw_handling.getitemnumber(vl_currentrow, 'sort_seq')						
			if rdw_handling.dataobject = 'd_proj_mat_sum_grid'  then
				ldw_handle = iw_display.f_get_dw( 'd_proj_material_grid')
				ls_item_colname = 'item_id'
			else
				ldw_handle =  iw_display.f_get_dw( 'd_proj_resource_grid')
				ls_item_colname = 'object_id'		
			end if
			
			ldb_item_id = rdw_handling.getitemnumber(vl_currentrow, ls_item_colname)
			if li_sort_seq = 3 then
				ldb_bom_ref_id = rdw_handling.getitemnumber(1, ls_item_colname)
				ls_findStr =  "bom_ref_id = "+string(ldb_bom_ref_id)+" AND " + ls_item_colname +" = " + string(ldb_item_id)
			else
				ls_findStr =  " bom_ref_id = " + string(ldb_item_id)		
			end if					
															
			ll_row_found = ldw_handle.find( ls_findStr, 1, ldw_handle.rowcount())
			DO while ll_row_found > 0 
				ls_itemtype = ldw_handle.getitemstring(ll_row_found , 'item_type')
				if ls_itemtype = 'ITEM' or  ls_itemtype = 'LABOUR' then
					ldw_handle.setitem(ll_row_found , 'gutter', ls_editdata )	
				else
					ldb_item_id = ldw_handle.getitemnumber(ll_row_found, ls_item_colname)
					this.f_drilldown_selection( ldw_handle, ldb_item_id, ls_item_colname, ls_editdata)
				end if
				ll_row_found = ldw_handle.find( ls_findStr,ll_row_found+ 1, ldw_handle.rowcount()+1)										
			LOOP		
			
			if li_sort_seq = 1 then		
				FOR ll_row_found = 1 to rdw_handling.rowcount()
					rdw_handling.setitem(ll_row_found , 'gutter', ls_editdata )								
				NEXT
			end if
			
		end if
end choose
return 0
end event

event e_tv_selectionchanging;call super::e_tv_selectionchanging;t_dw_mpl			ldw_handling



if isvalid(iw_display) then
	ldw_handling = iw_display.f_get_idwfocus()
	if ldw_handling.f_get_ib_editing( ) then 
		gf_messagebox('m.c_project.e_tv_selectionchanging.01','Thong báo','Phải lưu (save) trước khi chuyển','exclamation','ok',1)
		return 1
	end if
end if
end event

