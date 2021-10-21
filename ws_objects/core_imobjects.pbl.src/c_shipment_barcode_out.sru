$PBExportHeader$c_shipment_barcode_out.sru
forward
global type c_shipment_barcode_out from b_doc
end type
end forward

global type c_shipment_barcode_out from b_doc
event type integer e_action_process ( )
event type integer e_action_estimate ( )
end type
global c_shipment_barcode_out c_shipment_barcode_out

type variables
int		ii_err_pick, ii_err_weight, ii_err_mixed

any	ias_retrieve_arg[]
end variables

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_related ()
public function long f_get_str_streamvalue (ref s_str_streamvalue rs_str_streamvalue[])
public function integer f_update_shipment_in (string vs_carton_barcode, double vdb_qty)
public function decimal f_cal_qty_plan (long vl_item_id, long vl_item_spec, string vs_po_nbr, long vl_doc_id)
public function decimal f_cal_qty_in (long vl_item_id, long vl_item_spec, string vs_po_nbr, long vl_doc_id)
public function decimal f_cal_qty_out (long vl_item_id, long vl_item_spec, string vs_po_nbr, long vl_doc_id)
public subroutine f_set_actionpane ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_shipment_barcode_out_form'
istr_dwo[1].s_dwo_form = 'd_shipment_barcode_out_form'
istr_dwo[1].s_dwo_grid = ''
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = ''
istr_dwo[1].s_dwo_shared = ''
istr_dwo[1].s_dwo_master = ''
istr_dwo[1].s_master_keycol = ''
istr_dwo[1].s_detail_keycol = ''
istr_dwo[1].b_ref_table_yn  = true
istr_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;DOC_TYPE;VERSION_ID;'
istr_dwo[1].b_traceable = true
istr_dwo[1].b_query  = true
istr_dwo[1].b_update = true
istr_dwo[1].b_keyboardlocked = false
istr_dwo[1].s_description = 'Quét xuất kho'
end subroutine

public subroutine f_set_dwo_related ();//istr_dwo_related[1].s_related_obj_name = 'b_view'				// đối tượng copy đến
//istr_dwo_related[1].s_main_obj_dwo = 'd_document_prod_grid'		//datawindow quan hệ main
//istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
//istr_dwo_related[1].s_related_obj_dwo = 'dv_prod_order_form'	// datawindow quan hệ đến
//istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
//istr_dwo_related[1].s_relatedtext_column = 'code'					
//istr_dwo_related[1].s_text = 'In phiếu tác nghiệp'
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

public function integer f_update_shipment_in (string vs_carton_barcode, double vdb_qty);//double					ldb_bomline_id, ldb_fg_id, ldb_spec_id, ldb_fg_qty, ldb_fg_uom, ldb_fg_round, ldb_version_id
//double					ldb_fg_wh, ldb_mat_qty
//any						laa_args[], laa_empty[]
//long						ll_row, ll_cnt, ll_row_found
//string						ls_code, ls_ref_table
//t_ds_db					lds_bom
//b_obj_instantiate		lbo_inst
//c_datetime				ldt_inst
//
//ls_ref_table = upper(rdw_product.describe("DataWindow.Table.UpdateTable"))
////rdw_material.setfilter("object_ref_id = "+string(vdb_ref_id))
////rdw_material.filter()
//
//lds_bom = create t_ds_db
//lds_bom.dataobject = 'd_bom_hdr_form'
//lds_bom.f_settransobject( sqlca)
//
//ldb_version_id = lbo_inst.f_get_bom_version_id( vdb_bom_id)
//laa_args[1] = ldb_version_id
//laa_args[2] = '=ITEM'
//lds_bom.f_add_where( 'id;item_type;', laa_args[])
//ll_cnt = lds_bom.retrieve( )
//if ll_cnt > 0 then 
//	ldb_fg_id =  lds_bom.getitemnumber( 1, 'ITEM_ID')
//	
//	if isnull(ldb_fg_id) or ldb_fg_id = 0 then return 0
//	ldb_spec_id =  lds_bom.getitemnumber( 1, 'spec_id')
//	ldb_fg_wh =  lds_bom.getitemnumber( 1, 'default_wh')
//	ldb_fg_uom = lds_bom.getitemnumber( 1, 'stock_uom')
//	
//	ll_row_found = rdw_product.insertrow(0)
//	rdw_product.setitem(ll_row_found, 'ITEM_ID', ldb_fg_id )
//	rdw_product.setitem(ll_row_found, 'BOM_QTY', vdb_qty )
//	if lower(vs_upd_type) = 'actual' then
//		rdw_product.setitem(ll_row_found, 'ACT_QTY', vdb_qty)
//	end if	
//	rdw_product.setitem(ll_row_found, 'UOM_ID', ldb_fg_uom)
//	rdw_product.setitem(ll_row_found, 'OBJECT_REF_ID', vdb_ref_id)
//	rdw_product.setitem(ll_row_found, 'OBJECT_REF_TABLE', ls_ref_table)
//	rdw_product.setitem(ll_row_found, 'INPUT_OUTPUT', 'O')
//	rdw_product.setitem(ll_row_found, 'ID', this.f_create_id( ) )
//	rdw_product.setitem(ll_row_found, 'COMPANY_ID', gi_user_comp_id )
//	rdw_product.setitem(ll_row_found, 'BRANCH_ID', gdb_branch )
//	rdw_product.setitem(ll_row_found, 'WH_ID', ldb_fg_wh )	
//end if
//
//ldb_bomline_id = lbo_inst.f_get_bom_line(vdb_bom_id , vdb_qty, date(ldt_inst.f_getsysdate( )) )
//lds_bom.dataobject = 'd_bom_output_grid'
//lds_bom.f_settransobject( sqlca)
//laa_args[] = laa_empty[]
//laa_args[1] = ldb_bomline_id
//lds_bom.f_add_where( 'object_ref_id', laa_args[])
//
//ll_cnt = lds_bom.retrieve( ) 
//FOR ll_row = 1 to ll_cnt
//	ldb_fg_id = lds_bom.getitemnumber( ll_row, 'ITEM_ID')
//	if ldb_fg_id =0  or isnull(ldb_fg_id) then continue 
//	ldb_fg_wh = lds_bom.getitemnumber( ll_row, 'FG_WH')
//	ldb_spec_id =  lds_bom.getitemnumber( ll_row, 'spec_id')
//	ldb_mat_qty = lds_bom.getitemnumber( ll_row, 'MAT_QTY')
//	if ldb_mat_qty = 0 or isnull(ldb_mat_qty) then
//		ls_code = lbo_inst.f_get_code(ldb_fg_id )
//		gf_messagebox('m.c_prod_orders.f_update_product.01','Thông báo','Phụ phẩm sau trong công thức có số lượng TP = 0:@'+ls_code,'information','ok',1)
//		continue
//	end if
//	ldb_fg_qty = lds_bom.getitemnumber( ll_row, 'FG_QTY')
//	if ldb_fg_qty = 0 or isnull(ldb_fg_qty) then
//		ls_code = lbo_inst.f_get_code(ldb_fg_id )
//		gf_messagebox('m.c_prod_orders.f_update_product.02','Thông báo','Phụ phẩm sau trong công thức có số lượng = 0:@'+ls_code,'information','ok',1)
//		continue
//	end if	
//	ldb_fg_uom = lds_bom.getitemnumber( ll_row, 'FG_UOM')
//	if ldb_fg_uom = 0 or isnull(ldb_fg_uom) then
//		ls_code = lbo_inst.f_get_code(ldb_fg_id )
//		gf_messagebox('m.c_prod_orders.f_update_product.03','Thông báo','Phụ phẩm  sau trong công thức không có đơn vị tính:@'+ls_code,'information','ok',1)
//		continue
//	end if		
//	
//	ldb_fg_round = this.ic_unit_instance.f_get_round_id(ldb_fg_uom, ldb_fg_id, 'item')
//	
//	ll_row_found = rdw_product.find(" ITEM_ID = "+string(ldb_fg_id) + " AND object_ref_id = "+string(vdb_ref_id) ,1 , rdw_product.rowcount() )
//	if ll_row_found = 0 then
//		ll_row_found = rdw_product.insertrow(0)
//	end if
//	rdw_product.setitem(ll_row_found, 'ITEM_ID', ldb_fg_id )
//	
//	if lower(vs_upd_type) = 'actual' then
//		rdw_product.setitem(ll_row_found, 'ACT_QTY', ic_unit_instance.f_round( rdw_product, ldb_fg_round,vdb_qty*ldb_fg_qty/ldb_mat_qty))
//	else
//		rdw_product.setitem(ll_row_found, 'BOM_QTY', ic_unit_instance.f_round( rdw_product, ldb_fg_round,vdb_qty*ldb_fg_qty/ldb_mat_qty  ) )
//		rdw_product.setitem(ll_row_found, 'ACT_QTY', 0)
//	end if
//	rdw_product.setitem(ll_row_found, 'UOM_ID', ldb_fg_uom)
//	rdw_product.setitem(ll_row_found, 'OBJECT_REF_ID', vdb_ref_id)
//	rdw_product.setitem(ll_row_found, 'OBJECT_REF_TABLE', ls_ref_table)
//	rdw_product.setitem(ll_row_found, 'INPUT_OUTPUT', 'O')
//	rdw_product.setitem(ll_row_found, 'ID', this.f_create_id( ) )
//	rdw_product.setitem(ll_row_found, 'COMPANY_ID', gi_user_comp_id )
//	rdw_product.setitem(ll_row_found, 'BRANCH_ID', gdb_branch )
//	rdw_product.setitem(ll_row_found, 'WH_ID', ldb_fg_wh )
//	rdw_product.setitem(ll_row_found, 'spec_id', ldb_spec_id )
//NEXT
//


return 1
end function

public function decimal f_cal_qty_plan (long vl_item_id, long vl_item_spec, string vs_po_nbr, long vl_doc_id);//Đếm số lượng thùng carton giao khách trong kế hoạch theo  mã hàng, quy cách, đơn hàng, phiếu kế hoạch
dec ld_sum_qty
if isnull(vl_item_id) or isnull(vl_item_spec) or isnull(vs_po_nbr) or isnull(vl_doc_id) then return 0
select sum(nvl(i.t_ctn,0) - nvl(i.f_ctn,0) + 1) into :ld_sum_qty
from document d left join booked_slip s on d.version_id = s.id
left join inventory_catch i on s.id = i.object_ref_id
where i.catch_item = :vl_item_id
and i.catch_spec = :vl_item_spec
and i.po_nbr = :vs_po_nbr
and d.id = :vl_doc_id
and d.company_id = :gi_user_comp_id;
return  ld_sum_qty
end function

public function decimal f_cal_qty_in (long vl_item_id, long vl_item_spec, string vs_po_nbr, long vl_doc_id);//Đếm số lượng thùng carton giao khách trong kế hoạch theo  mã hàng, quy cách, đơn hàng, phiếu kế hoạch
dec ld_sum_qty
if isnull(vl_item_id) or isnull(vl_item_spec) or isnull(vs_po_nbr) or isnull(vl_doc_id) then return 0
select sum(b.in_qty) into :ld_sum_qty
from document d left join booked_slip s on d.version_id = s.id
left join inventory_catch i on s.id = i.object_ref_id
left join barcode_catch b on i.id = b.object_ref_id
where i.catch_item = :vl_item_id
and i.catch_spec = :vl_item_spec
and i.po_nbr = :vs_po_nbr
and d.id = :vl_doc_id
and d.company_id = :gi_user_comp_id;	
	
return  ld_sum_qty
end function

public function decimal f_cal_qty_out (long vl_item_id, long vl_item_spec, string vs_po_nbr, long vl_doc_id);//Đếm số lượng thùng carton giao khách trong kế hoạch theo  mã hàng, quy cách, đơn hàng, phiếu kế hoạch
dec ld_sum_qty
if isnull(vl_item_id) or isnull(vl_item_spec) or isnull(vs_po_nbr) or isnull(vl_doc_id) then return 0
select sum(b.out_qty) into :ld_sum_qty
from document d left join booked_slip s on d.version_id = s.id
left join inventory_catch i on s.id = i.object_ref_id
left join barcode_catch b on i.id = b.object_ref_id
where i.catch_item = :vl_item_id
and i.catch_spec = :vl_item_spec
and i.po_nbr = :vs_po_nbr
and d.id = :vl_doc_id
and d.company_id = :gi_user_comp_id;	
	
return  ld_sum_qty
end function

public subroutine f_set_actionpane ();//
end subroutine

on c_shipment_barcode_out.create
call super::create
end on

on c_shipment_barcode_out.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = false
this.ib_keyboardlocked = false
is_display_model = '1d'
is_object_title = 'Quét xuất kho'

istr_actionpane[1].s_description = is_object_title
is_exrate_type = 'buy'
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;string ls_barcode
t_ds_db lds_1
t_transaction lt_sqlca
this.iw_display.f_get_transaction( lt_sqlca)
long ll_catch_id, ll_item_id, ll_item_spec, ll_doc_id
double ldc_ctnqty, ldc_trans_qty, ldc_in_qty, ldc_out_qty
date ld_shipment_date_in, ld_shipment_date_out
string ls_status, ls_po_nbr, ls_item_name,ls_spec_code, ls_null
if AncestorReturnValue = 1 then return 1
if isnull(vs_editdata) then vs_editdata =''
setnull(ls_null)
rpo_dw.setitem(vl_currentrow,'item_name', ls_null)
rpo_dw.setitem(vl_currentrow,'item_spec', ls_null)
rpo_dw.setitem(vl_currentrow,'po_number', ls_null)
rpo_dw.setitem(vl_currentrow,'qty_po', 0)
rpo_dw.setitem(vl_currentrow,'qty_in', 0)
rpo_dw.setitem(vl_currentrow,'qty_out', 0)
rpo_dw.setitem(vl_currentrow,'qty_remain', 0)
if rpo_dw.dataobject = 'd_shipment_barcode_out_form' and vs_colname = 'barcode' then
	ls_barcode = trim(vs_editdata)
	lds_1 = create t_ds_db
	lds_1.dataobject = 'd_shipment_carton_barcode'
	lds_1.f_settransobject(lt_sqlca)
	lds_1.retrieve(ls_barcode, gi_user_comp_id)
	if lds_1.rowcount() = 0 then
		gf_messagebox('m.c_shipment_barcode_out.e_dw_e_itemchanged.01','Cảnh báo', 'Mã barcode chưa được khai báo trong hệ thống'+ls_barcode,'exclamation','ok',1)
//		messagebox('Cảnh báo', 'Mã barcode: '+ls_barcode+ 'chưa được khai báo trong hệ thống')
		rpo_dw.settext('')
		return 1
	end if 
	ll_doc_id =  lds_1.getitemnumber(1, 'doc_id')
	ls_status = lds_1.getitemstring(1, 'status')
	ls_po_nbr = lds_1.getitemstring(1, 'po_nbr')
	ls_item_name = lds_1.getitemstring(1, 'item_name')
	ll_item_id = lds_1.getitemnumber(1, 'item_id')
	ll_item_spec = lds_1.getitemnumber(1, 'item_spec')
	ls_spec_code = lds_1.getitemstring(1, 'spec_code')
	ll_catch_id = lds_1.getitemnumber(1, 'catch_id')	
	ld_shipment_date_in = date(lds_1.getitemdatetime(1, 'count_f_date'))
	ld_shipment_date_out = date(lds_1.getitemdatetime(1, 'count_t_date'))
	ldc_in_qty = lds_1.getitemnumber(1, 'in_qty')
	ldc_out_qty = lds_1.getitemnumber(1, 'out_qty')
	if isnull(ldc_in_qty) then ldc_in_qty = 0
	if isnull(ldc_out_qty) then ldc_out_qty = 0
	//Kiểm tra kế hoạch xuất hàng đang xử lý
	if ldc_out_qty > 0 then
		gf_messagebox('m.c_shipment_barcode_out.e_dw_e_itemchanged.02','Cảnh báo', 'Mã barcode đã xuất rồi'+ls_barcode,'exclamation','ok',1)
//		messagebox('Cảnh báo', 'Đã quét rồi')
		rpo_dw.settext('')
		return 1
	end if
	if ldc_in_qty <= 0 then
		gf_messagebox('m.c_shipment_barcode_out.e_dw_e_itemchanged.03','Cảnh báo', 'Mã barcode chưa nhập kho'+ls_barcode,'exclamation','ok',1)
//		messagebox('Cảnh báo', 'Mã '+ ls_barcode + ' chưa nhập kho')
		rpo_dw.settext('')
		return 1
	end if
	if pos('new;planed;processing;scan out;', ls_status) > 0 then
		if  ld_shipment_date_out <> gd_session_date then
			gf_messagebox('m.c_shipment_barcode_out.e_dw_e_itemchanged.04','Cảnh báo', 'Không xuất kho vì khác ngày kế hoạch','exclamation','ok',1)
//			messagebox('Cảnh báo', 'Không xuất kho vì khác ngày kế hoạch')
			rpo_dw.settext('')
			return 1
		else
			//Lấy SL kế hoạch
			ldc_ctnqty = f_cal_qty_plan(ll_item_id, ll_item_spec, ls_po_nbr, ll_doc_id)
			if isnull(ldc_ctnqty) then ldc_ctnqty = 0
			//Lấy số lượng đã xuất
			ldc_trans_qty = f_cal_qty_out(ll_item_id, ll_item_spec, ls_po_nbr, ll_doc_id)
			if isnull(ldc_trans_qty) then ldc_trans_qty = 0
			//Kiểm tra nếu mã này chưa nhập kho thì cho nhập kho
			if ldc_out_qty = 0 then
				lds_1.setitem(1,'out_qty',1)
				lds_1.update(true,false)
				if lt_sqlca.sqlcode = 0 then
					commit using lt_sqlca;
					rpo_dw.setitem(vl_currentrow,'item_name', ls_item_name)
					rpo_dw.setitem(vl_currentrow,'item_spec', ls_spec_code)
					rpo_dw.setitem(vl_currentrow,'po_number', ls_po_nbr)
					rpo_dw.setitem(vl_currentrow,'qty_po', ldc_ctnqty)
					rpo_dw.setitem(vl_currentrow,'qty_out', ldc_trans_qty + 1)
					rpo_dw.setitem(vl_currentrow,'qty_remain', ldc_ctnqty - ldc_trans_qty - 1)
				end if
				if ldc_ctnqty - ldc_trans_qty - 1 <= 0 then
					gf_messagebox('m.c_shipment_barcode_out.e_dw_e_itemchanged.05','Cảnh báo', 'Đã xuất đủ kế hoạch:'+ls_item_name+'-'+ls_po_nbr,'exclamation','ok',1)
//					messagebox('Thông báo', ls_item_name + ' trên PO:' + ls_po_nbr + ' đã xuất đủ hàng')
				end if
			end if
		end if
	else//nếu KHXH đã hoàn thành
		gf_messagebox('m.c_shipment_barcode_out.e_dw_e_itemchanged.06','Cảnh báo', 'Kế hoạch xuất hàng đã khóa','exclamation','ok',1)
//		messagebox('Thông báo', 'Kế hoạch xuất hàng đã khóa')
	end if
end if
rpo_dw.settext('')
return 1
//return AncestorReturnValue
end event

event e_window_e_postopen;t_dw_mpl ldw_main
ldw_main = this.iw_display.f_get_dwmain( )
ldw_main.insertrow(0)
return 0
end event

