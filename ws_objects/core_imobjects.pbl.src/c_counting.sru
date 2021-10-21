$PBExportHeader$c_counting.sru
forward
global type c_counting from b_doc
end type
end forward

global type c_counting from b_doc
event type integer e_action_process ( )
end type
global c_counting c_counting

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
public function integer f_set_ds_4_posting ()
end prototypes

event type integer e_action_process();long				ll_cnt, ll_row, ll_insertrow, ll_insertrow_lot
any				laa_where[]
double			ldb_item_id, ldb_item_tmp , ldb_spec_id, ldb_spec_tmp , ldb_loc_id, ldb_loc_tmp, ldb_qty_tmp , ldb_qty, ldb_line_id, ldb_version_id
double			ldb_trans_uom,ldb_close_base_value, ldb_wh_id, ldb_lot_line_id
decimal			ldc_unit_price
string				ls_warehouse, ls_item, ls_loc, ls_lot_no, ls_sql, ls_bestb4_Date, ls_manufacture_date
date				ld_trans_date, ld_bestb4_Date, ld_manufacture_date
t_ds_db			lds_item_balance
t_dw_mpl		ldw_doc



ldw_doc = this.iw_display.f_get_dwmain( )
if ldw_doc.getrow() > 0 then
	connect using it_transaction;
	ldb_version_id = ldw_doc.getitemnumber( ldw_doc.getrow(), 'version_id')
	select count(id) into :ll_cnt
	from inventory_line where object_ref_id = :ldb_version_id
	using it_transaction;
	if ll_cnt > 0 then
		if gf_messagebox('m.c_counting.e_action_prcess.01','Xác nhận','Phiếu kiểm kế đã có dữ liêu. Bạn có muốn tạo lại không?','question','yesno',2) = 2 then
			return 0
		end if		
		// xoá dữ liệu cũ --//
		DELETE lot_line t
				where exists (select null from inventory_line t1 where t1.id = t.object_ref_id and t1.object_ref_id = :ldb_version_id ) using it_transaction;	
		if it_transaction.sqlcode = -1 then
			rollback using it_transaction;
			gf_messagebox('m.c_counting.e_action_prcess.02','Thông báo','Lỗi xóa dữ liệu kiểm kê','stop','ok',1)				
			return -1
		end if
		DELETE inventory_line t where  t .object_ref_id = :ldb_version_id using it_transaction;
		if it_transaction.sqlcode = -1 then
			rollback using it_transaction;
			gf_messagebox('m.c_counting.e_action_prcess.02','Thông báo','Lỗi xóa dữ liệu kiểm kê','stop','ok',1)
			return -1
		end if		
	end if
	//-- retreive balance data --//
	setpointer(hourglass!)
	lds_item_balance= create t_ds_db
	lds_item_balance.dataobject = 'ds_v_item_balance'
	lds_item_balance.f_settransobject( it_transaction)

	ls_warehouse = ldw_doc.getitemstring(ldw_doc.getrow() , 'warehouse')
	if isnull(ls_warehouse) or ls_warehouse = '' then ls_warehouse = '*'
	ls_item= ldw_doc.getitemstring(ldw_doc.getrow() , 'item')
	if isnull(ls_item) or ls_item = '' then ls_item = '*'
	ls_loc= ldw_doc.getitemstring(ldw_doc.getrow() , 'loc')
	if isnull(ls_loc) or ls_loc = '' then ls_loc = '*'
	ld_trans_date = date(ldw_doc.getitemdatetime(ldw_doc.getrow() , 'trans_date'))
			
	laa_where[1] = gi_user_comp_id
	laa_where[2] = gs_sob
	laa_where[3] = ls_warehouse
	laa_where[4] = ls_item
	laa_where[5] =ls_loc
	laa_where[6] = ld_trans_date
	laa_where[7] = 'Y'
	laa_where[8] = gdb_branch
			
	lds_item_balance.f_add_where( 'company_id;sob;warehouse_code; item_code;loc_code;balance_date;value_yn;branch_id', laa_where)
	lds_item_balance.setsort( "item_code asc, SPEC_ID asc, LOC_ID asc, lot_no asc ")
	ll_cnt = lds_item_balance.retrieve( )		
	FOR ll_row = 1 TO ll_cnt
		yield()
		this.of_show_progress( integer(ll_row/ll_cnt*100), 'Đang tạo dữ liệu kiểm kê')
		this.of_set_progress_text( string(ll_row)+'/'+string(ll_cnt))
		ldb_item_tmp = lds_item_balance.getitemnumber(ll_row, 'item_id')
		ldb_spec_tmp = lds_item_balance.getitemnumber(ll_row, 'SPEC_ID')
		if isnull(ldb_spec_tmp) then ldb_spec_tmp = 0
		ldb_loc_tmp = lds_item_balance.getitemnumber(ll_row, 'LOC_ID')
		if isnull(ldb_loc_tmp) then ldb_loc_tmp = 0
		ldb_qty_tmp =  lds_item_balance.getitemnumber(ll_row, 'CLOSE_QTY')			
		if isnull(ldb_qty_tmp) then ldb_qty_tmp = 0
		ldc_unit_price = lds_item_balance.getitemnumber(ll_row, 'moving_avg')
		if isnull(ldc_unit_price) or ldc_unit_price = 0 then
			ldc_unit_price = lds_item_balance.getitemnumber(ll_row, 'last_pur_price')
		end if
		ldb_trans_uom= lds_item_balance.getitemnumber(ll_row, 'STOCK_UOM')
		ldb_close_base_value = lds_item_balance.getitemnumber(ll_row, 'close_base_value')
		ldb_wh_id = lds_item_balance.getitemnumber(ll_row, 'OBJECT_ID')
		if isnull(ldb_close_base_value) then ldb_close_base_value = 0
		if ldb_item_id <> ldb_item_tmp or  ldb_spec_id <> ldb_spec_tmp or  ldb_loc_id <> ldb_loc_tmp then
			ldb_item_id = ldb_item_tmp
			ldb_spec_id = ldb_spec_tmp
			ldb_loc_id = ldb_loc_tmp
			ldb_qty = ldb_qty_tmp
			//-- insert inventory_line --//
			ll_insertrow++
			ldb_line_id = this.f_create_id_ex( it_transaction)
			ls_sql = "INSERT into inventory_line(id,company_id, branch_id,object_ref_id,object_ref_table, created_by, created_date,last_mdf_by, last_mdf_date,"+&
												" line_no, item_id, spec_id, qty,trans_uom,"+&
												"price,base_price,amount,base_amount,cogs,"+&
												"warehouse_id,doc_qty,count_qty,loc_id)" +&
						" VALUES("+string(ldb_line_id)+ "," + string( gi_user_comp_id ) + "," + string( gdb_branch ) +","+string(ldb_version_id)+ ",'BOOKED_SLIP' ," + string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate, " +&
									string(ll_insertrow)+","+string(ldb_item_id) +","+string(ldb_spec_id)+","+string(0)+","+string(ldb_trans_uom)+ ","+&
									string(ldc_unit_price)+","+ string(ldc_unit_price)+","+ string(0)+","+ string(0)+","+ string(ldb_close_base_value)+","+ &
									string(ldb_wh_id) +","+ string(ldb_qty)+","+ string(ldb_qty)+","+string(ldb_loc_id)+ ")"
			EXECUTE immediate :ls_sql using it_transaction;				

			//-- insert lot_line--//
			ls_lot_no =  lds_item_balance.getitemstring(ll_row, 'lot_no')
			if isnull(ls_lot_no) then ls_lot_no = ''
			if ls_lot_no <> '' then
				ld_bestb4_Date = date(lds_item_balance.getitemdatetime(ll_row, 'best_b4_date'))
				if isnull(ld_bestb4_Date) or string(ld_bestb4_Date,'ddmmyyyy') = '01011900' then
					ls_bestb4_Date = 'NULL'
				else	
					ls_bestb4_Date= "to_date('"+string(ld_bestb4_Date,gs_w_date_format)+"','"+gs_w_date_format+"')"
				end if
				ld_manufacture_date = date(lds_item_balance.getitemdatetime(ll_row, 'manufacture_date'))
				if isnull(ld_manufacture_date) or string(ld_manufacture_date,'ddmmyyyy') = '01011900' then
					ls_manufacture_date = 'NULL'
				else	
					ls_manufacture_date= "to_date('"+string(ld_manufacture_date,gs_w_date_format)+"','"+gs_w_date_format+"')"
				end if				
				ldb_lot_line_id =  this.f_create_id_ex( it_transaction)
				ls_sql = "INSERT into lot_line(id,company_id, branch_id,object_ref_id,object_ref_table,"+&
							"created_by, created_date,last_mdf_by, last_mdf_date,DOC_VERSION,"+&
							"DOC_QTY,COUNT_QTY,LOT_NO,MANUFACTURE_DATE,best_b4_date)"+&
							" VALUES("+string(ldb_lot_line_id)+ "," + string( gi_user_comp_id ) + "," + string( gdb_branch ) +","+string(ldb_line_id)+ ",'BOOKED_SLIP' ,"+ &
							string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate," +string(ldb_version_id) +","+&
							string( ldb_qty_tmp )+","+string( ldb_qty_tmp )+",'"+ls_lot_no+"','"+ls_manufacture_date+"','"+ls_bestb4_Date+")"
				EXECUTE immediate :ls_sql using it_transaction;										
			end if			
		else
			//-- update cùng item khác lot--//
			ldb_qty +=  ldb_qty_tmp
			ls_sql = "UPDATE inventory_line "+&
						" SET doc_qty="+string(ldb_qty) +","+&
						" count_qty =" + string(ldb_qty) +"WHERE id = "+string(ldb_line_id)
			EXECUTE immediate :ls_sql using it_transaction;		
			
			//-- insert lot_line--//
			ls_lot_no = lds_item_balance.getitemstring(ll_row, 'lot_no')
			if isnull(ls_lot_no) then ls_lot_no = ''
			ld_bestb4_Date = date(lds_item_balance.getitemdatetime(ll_row, 'best_b4_date'))
			if isnull(ld_bestb4_Date) or string(ld_bestb4_Date,'ddmmyyyy') = '01011900' then
				ls_bestb4_Date = 'NULL'
			else	
				ls_bestb4_Date= "to_date('"+string(ld_bestb4_Date,gs_w_date_format)+"','"+gs_w_date_format+"')"
			end if
			ld_manufacture_date = date(lds_item_balance.getitemdatetime(ll_row, 'manufacture_date'))
			if isnull(ld_manufacture_date) or string(ld_manufacture_date,'ddmmyyyy') = '01011900' then
				ls_manufacture_date = 'NULL'
			else	
				ls_manufacture_date= "to_date('"+string(ld_manufacture_date,gs_w_date_format)+"','"+gs_w_date_format+"')"
			end if				
			ldb_lot_line_id =  this.f_create_id_ex( it_transaction)
			ls_sql = "INSERT into lot_line(id,company_id, branch_id,object_ref_id,object_ref_table,"+&
						"created_by, created_date,last_mdf_by, last_mdf_date,DOC_VERSION,"+&
						"DOC_QTY,COUNT_QTY,LOT_NO,MANUFACTURE_DATE,best_b4_date)"+&
						" VALUES("+string(ldb_lot_line_id)+ "," + string( gi_user_comp_id ) + "," + string( gdb_branch ) +","+string(ldb_line_id)+ ",'BOOKED_SLIP' ,"+ &
						string( gi_userid ) + ", sysdate, "+ string( gi_userid ) + ", sysdate," +string(ldb_version_id) +","+&
						string( ldb_qty_tmp )+","+string( ldb_qty_tmp )+",'"+ls_lot_no+"','"+ls_manufacture_date+"','"+ls_bestb4_Date+")"
			EXECUTE immediate :ls_sql using it_transaction;	
		end if
	NEXT
	commit using it_transaction;
	disconnect using it_transaction;
	this.of_show_progress(101, 'Đang tạo dữ liệu kiểm kê')		
end if

gf_messagebox('m.c_counting.e_action_prcess.04','Thông báo','Hoàn thành tạo dữ liệu kiểm kê','exclamation','ok',1)

return 1
end event

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_document_counting_grid'
istr_dwo[1].s_dwo_form = 'd_document_counting_form'
istr_dwo[1].s_dwo_grid = 'd_document_counting_grid'
istr_dwo[1].b_master = false
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_details = '' 
istr_dwo[1].b_ref_table_yn  = false
istr_dwo[1].s_ref_table_field = ''
istr_dwo[1].b_relation_1_1 = false
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_gb_name = 'gb_6'
istr_dwo[1].s_description = 'Phiếu kiểm kê'
//
//istr_dwo[2].s_dwo_default =  'd_counting_form'
//istr_dwo[2].s_dwo_form = 'd_counting_form'
//istr_dwo[2].s_dwo_grid = ''
//istr_dwo[2].b_master = true
//istr_dwo[2].b_detail = true
//istr_dwo[2].b_cascade_del = true
//istr_dwo[2].s_dwo_details = 'd_inventory_line_counting_grid;'
//istr_dwo[2].s_dwo_master = 'd_document_counting_grid;'
//istr_dwo[2].s_master_keycol = 'ID;'
//istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
//istr_dwo[2].b_ref_table_yn  = true
//istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE;doc_type;id'
//istr_dwo[2].b_relation_1_1 = true
//istr_dwo[2].b_insert = true
//istr_dwo[2].b_update = true
//istr_dwo[2].b_delete = true
//istr_dwo[2].b_query = true
//istr_dwo[2].b_print = true
//istr_dwo[2].b_excel = true
//istr_dwo[2].b_traceable = true
//istr_dwo[2].b_keyboardlocked = true
//istr_dwo[2].b_focus_master = true
//istr_dwo[2].s_description = 'lắp ráp'
//
//
end subroutine

public subroutine f_set_dwo_tabpage ();//iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
//iastr_dwo_tabpage[1].s_display_model = '2d'
//iastr_dwo_tabpage[1].i_upperpart_height = 2/3
//iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_inventory_line_counting_grid'
//iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
//iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_inventory_line_counting_grid'
//iastr_dwo_tabpage[1].str_dwo[1].b_master = true
//iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
//iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
//iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_counting_form;'
//iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = 'd_post_line_invoice_grid;d_lot_line_counting_grid;'
//iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = ''
//iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol = 'ID;'
//iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
//iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = false
//iastr_dwo_tabpage[1].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
//iastr_dwo_tabpage[1].str_dwo[1].b_insert = true
//iastr_dwo_tabpage[1].str_dwo[1].b_update = true
//iastr_dwo_tabpage[1].str_dwo[1].b_delete = true
//iastr_dwo_tabpage[1].str_dwo[1].b_query = true
//iastr_dwo_tabpage[1].str_dwo[1].b_print = true
//iastr_dwo_tabpage[1].str_dwo[1].b_excel = true
//iastr_dwo_tabpage[1].str_dwo[1].b_traceable = true
//iastr_dwo_tabpage[1].str_dwo[1].b_keyboardlocked = true
//iastr_dwo_tabpage[1].str_dwo[1].s_description ='Chi tiết kiểm kê'
//
//iastr_dwo_tabpage[1].str_dwo[2].s_dwo_default =  'd_post_line_invoice_grid'
//iastr_dwo_tabpage[1].str_dwo[2].s_dwo_form = ''
//iastr_dwo_tabpage[1].str_dwo[2].s_dwo_grid = 'd_post_line_invoice_grid'
//iastr_dwo_tabpage[1].str_dwo[2].b_detail = true
//iastr_dwo_tabpage[1].str_dwo[2].s_dwo_master = 'd_inventory_line_counting_grid;'
//iastr_dwo_tabpage[1].str_dwo[2].s_dwo_details = ''
//iastr_dwo_tabpage[1].str_dwo[2].s_master_keycol = 'ID;'
//iastr_dwo_tabpage[1].str_dwo[2].s_detail_keycol = 'object_ref_id;'
//iastr_dwo_tabpage[1].str_dwo[2].b_ref_table_yn  = false
//iastr_dwo_tabpage[1].str_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE'
//iastr_dwo_tabpage[1].str_dwo[2].b_insert = false
//iastr_dwo_tabpage[1].str_dwo[2].b_update = true
//iastr_dwo_tabpage[1].str_dwo[2].b_delete = true
//iastr_dwo_tabpage[1].str_dwo[2].b_query = true
//iastr_dwo_tabpage[1].str_dwo[2].b_print = true
//iastr_dwo_tabpage[1].str_dwo[2].b_excel = true
//iastr_dwo_tabpage[1].str_dwo[2].b_traceable = true
//iastr_dwo_tabpage[1].str_dwo[2].b_keyboardlocked = true
//iastr_dwo_tabpage[1].str_dwo[2].s_description = 'Định khoản'
//iastr_dwo_tabpage[1].i_index = 1
//
//iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
//iastr_dwo_tabpage[2].s_display_model = '1d'
//iastr_dwo_tabpage[2].i_upperpart_height = 2/3
//iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_lot_line_counting_grid'
//iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = ''
//iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = 'd_lot_line_counting_grid'
//iastr_dwo_tabpage[2].str_dwo[1].b_master = false
//iastr_dwo_tabpage[2].str_dwo[1].b_detail = true
//iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = true
//iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_inventory_line_counting_grid;'
//iastr_dwo_tabpage[2].str_dwo[1].s_dwo_details = ';'
//iastr_dwo_tabpage[2].str_dwo[1].s_dwo_shared = ''
//iastr_dwo_tabpage[2].str_dwo[1].s_master_keycol = 'ID;'
//iastr_dwo_tabpage[2].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
//iastr_dwo_tabpage[2].str_dwo[1].b_ref_table_yn  = false
//iastr_dwo_tabpage[2].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
//iastr_dwo_tabpage[2].str_dwo[1].b_insert = true
//iastr_dwo_tabpage[2].str_dwo[1].b_update = true
//iastr_dwo_tabpage[2].str_dwo[1].b_delete = true
//iastr_dwo_tabpage[2].str_dwo[1].b_query = true
//iastr_dwo_tabpage[2].str_dwo[1].b_print = true
//iastr_dwo_tabpage[2].str_dwo[1].b_excel = true
//iastr_dwo_tabpage[2].str_dwo[1].b_traceable = true
//iastr_dwo_tabpage[2].str_dwo[1].b_keyboardlocked = true
//iastr_dwo_tabpage[2].str_dwo[1].s_description ='Lô/serial'
//iastr_dwo_tabpage[2].i_index = 2
end subroutine

public subroutine f_set_str_unit ();//--Datawindow chứa các cột cần làm tròn--//
istr_unit[1].s_dwo_handing = 'd_inventory_line_counting_grid;d_inventory_line_counting_grid;d_inventory_line_counting_grid;d_document_counting_form;d_document_counting_form;'
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = 'qty;price;amount;bc;ex'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[1].s_dwo_unit = 'd_inventory_line_counting_grid;d_document_counting_form;d_document_counting_form;d_document_counting_form;d_document_counting_form;'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = 'uom_code;uom_code;uom_code;uom_code;EXCHANGE_RATE'
//--Loại làm tròn --//
istr_unit[1].s_type =  'item;price;amount;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[1].s_dwo_object = 'd_inventory_line_counting_grid'
//--Cột chứa mã hàng--//
istr_unit[1].s_colname_object = 'item_code'

////--Datawindow chứa các cột cần làm tròn--//
//istr_unit[2].s_dwo_handing = 'd_material_grid;d_material_grid;d_material_grid;d_material_grid;d_assemble_form;'
////--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
//istr_unit[2].s_colname_data = 'qty;price;cogs;bc;ex'
////--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
//istr_unit[2].s_colname_convert = ''
//istr_unit[2].s_colname_diff = ''
////--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
//istr_unit[2].s_dwo_unit = 'd_material_grid;"";d_assemble_form;d_assemble_form;d_assemble_form'
////--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
//istr_unit[2].s_colname_unit = 'uom_code;"";uom_code;uom_code;EXCHANGE_RATE'
////--Loại làm tròn --//
//istr_unit[2].s_type =  'item;price;amount;bc;ex'
////--Datawindow của cột chứa mã hàng--//
//istr_unit[2].s_dwo_object = 'd_material_grid'
////--Cột chứa mã hàng--//
//istr_unit[2].s_colname_object = 'item_code'
end subroutine

public subroutine f_set_dwo_related ();//istr_dwo_related[1].s_related_obj_name = 'b_view'				// đối tượng copy đến
//istr_dwo_related[1].s_main_obj_dwo = 'd_document_inventory_grid'		//datawindow quan hệ main
//istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
//istr_dwo_related[1].s_related_obj_dwo = 'dv_materials_delivery_form'	// datawindow quan hệ đến
//istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
//istr_dwo_related[1].s_relatedtext_column = 'code'					
//istr_dwo_related[1].s_text = 'In phiếu đề nghị vật tư'
//
//
//istr_dwo_related[2].s_related_obj_name = 'u_goods_delivery'					// đối tượng copy đến
//istr_dwo_related[2].s_main_obj_dwo = 	'd_material_grid'	//datawindow quan hệ main
//istr_dwo_related[2].s_main_obj_column = 'id'			// cột quan hệ của main
//istr_dwo_related[2].s_related_obj_dwo =  'd_inventory_line_delivery_grid'	// datawindow quan hệ đến
//istr_dwo_related[2].s_related_obj_column = 'id'			// cột quan hệ đến
//istr_dwo_related[2].b_f_matching = true
//istr_dwo_related[2].s_relatedtext_column = 'doc_code'					
//istr_dwo_related[2].s_text = 'Phiếu nhập kho : '
//
//istr_dwo_related[2].s_main_obj_dwo_copy[1] =  'd_material_grid'// datawindow copy từ
//istr_dwo_related[2].s_main_obj_column_copy[1] = 'ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;QTY;QTY;cogs;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;warehouse_id;wh_code;wh_name;object_type;' // cột copy từ
//istr_dwo_related[2].s_related_obj_dwo_copy[1] = 'd_inventory_line_delivery_grid' // datawindow copy đến
//istr_dwo_related[2].s_related_obj_column_copy[1] ='ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;doc_qty;QTY;cogs;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;object_id;cus_code;cus_name;object_type;'  // cột copy đến
//istr_dwo_related[2].b_copy_line[1] = true
//istr_dwo_related[2].s_main_obj_column_chk[1] = ''
//istr_dwo_related[2].s_related_obj_column_chk[1] = ''
//istr_dwo_related[2].s_f_obj_column_chk[1] = 'ITEM_ID'
//istr_dwo_related[2].s_t_obj_column_chk[1] = 'ITEM_ID'
//istr_dwo_related[2].s_match_f_dwo[1] = 'd_material_grid'
//istr_dwo_related[2].s_match_f_col_obj[1] = 'item_id'
//istr_dwo_related[2].s_match_t_dwo[1] = 'd_inventory_line_delivery_grid'
//istr_dwo_related[2].s_match_f_column[1] = 'qty'
//istr_dwo_related[2].s_match_t_column[1] = 'qty'
//istr_dwo_related[2].s_match_column[1] = 'qty'
//
//istr_dwo_related[2].s_main_obj_dwo_copy[2] =  'd_assemble_form'
//istr_dwo_related[2].s_main_obj_column_copy[2] = 'note;description;trans_date;uom_code;currency_id;exchange_rate;' 
//istr_dwo_related[2].s_related_obj_dwo_copy[2] = 'd_goods_delivery_form' 
//istr_dwo_related[2].s_related_obj_column_copy[2] ='note;description;trans_date;uom_code;currency_id;exchange_rate;' 
//istr_dwo_related[2].s_main_obj_column_chk[2] = ''
//istr_dwo_related[2].s_related_obj_column_chk[2] = ''
//istr_dwo_related[2].s_match_f_dwo[2] = ''
//istr_dwo_related[2].s_match_t_dwo[2] = ''
//istr_dwo_related[2].s_match_f_column[2] = ''
//istr_dwo_related[2].s_match_t_column[2] = ''
//istr_dwo_related[2].s_match_column[2] = ''
//istr_dwo_related[2].s_main_obj_column_sum[2] = ''
//istr_dwo_related[2].s_related_obj_column_sum[2] = ''
//istr_dwo_related[2].s_f_obj_column_chk[2] = ''
//istr_dwo_related[2].s_t_obj_column_chk[2] = ''
//istr_dwo_related[2].b_f_sum[2] = false
//istr_dwo_related[2].b_copy_line[2] = false
//
//istr_dwo_related[3].s_related_obj_name = 'b_view'				// đối tượng copy đến
//istr_dwo_related[3].s_main_obj_dwo = 'd_document_inventory_grid'		//datawindow quan hệ main
//istr_dwo_related[3].s_main_obj_column = 'id'			// cột quan hệ của main
//istr_dwo_related[3].s_related_obj_dwo = 'dv_product_receipt_form'	// datawindow quan hệ đến
//istr_dwo_related[3].s_related_obj_column = 'id'			// cột quan hệ đến
//istr_dwo_related[3].s_relatedtext_column = 'code'					
//istr_dwo_related[3].s_text = 'In phiếu nhập kho thành phẩm lắp ráp'
//
//
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

public subroutine f_set_str_streamvalue ();//-- couting --//
istr_streamvalue[1].s_f_obj_dwo =  'd_document_counting_grid' 
istr_streamvalue[1].s_f_obj_column =  'invoice_object;lot_no;serial_no'
istr_streamvalue[1].s_f_column_sv = 'F_OBJECT_ID;lot_no;serial_no'

istr_streamvalue[1].s_t_obj_dwo = 'd_inventory_line_counting_grid'
istr_streamvalue[1].s_t_obj_column = 'WAREHOUSE_ID;lot_no;serial_no'
istr_streamvalue[1].s_t_column_sv = 'T_OBJECT_ID;t_lot_no;t_serial_no'

istr_streamvalue[1].s_item_dwo = 'd_inventory_line_counting_grid'
istr_streamvalue[1].s_item_column = 'item_id;spec_id;qty;TRANS_UOM;loc_id'
istr_streamvalue[1].s_item_column_sv = 'item_id;spec_id;qty;uom_id;loc_id'

istr_streamvalue[1].s_item_lot_dwo = 'd_lot_line_counting_grid'
istr_streamvalue[1].s_item_lot_column = 'qty;lot_no;serial_no;'
istr_streamvalue[1].s_item_lot_column_sv = 'qty;LOT_NO;SERIAL_NO;'

istr_streamvalue[1].s_currency_dwo = 'd_counting_form'
istr_streamvalue[1].s_currency_column = 'CURRENCY_ID;exchange_rate'
istr_streamvalue[1].s_currency_column_sv = 'TRANS_CUR_ID;exchange_rate'

istr_streamvalue[1].s_value_dwo = 'd_inventory_line_counting_grid'
istr_streamvalue[1].s_value_column = 'item_id;amount;amount;spec_id;qty'
istr_streamvalue[1].s_value_column_sv = 'item_id;trans_value;base_value;spec_id;qty'


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

public function integer f_resize_fixedpart_grid ();//this.iw_display.dynamic f_reset_ii_fixedpart2_height_grid(0)
//this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_set_ds_4_posting ();int				li_idx


istr_ds_4_posting.ds_details[1] = create t_ds_db
istr_ds_4_posting.ds_details[1].dataobject =  'd_counting_form'
istr_ds_4_posting.s_dataobject_str += 'd_counting'+'['+string(1)+']'
istr_ds_4_posting.ds_master[1] = create t_ds_db
istr_ds_4_posting.ds_master[1].dataobject = 'd_document_counting_form'
istr_ds_4_posting.s_join_detail[1] =''


li_idx = upperbound(istr_ds_4_posting.ds_details[]) + 1
istr_ds_4_posting.ds_details[li_idx] = create t_ds_db
istr_ds_4_posting.ds_details[li_idx].dataobject =  'd_inventory_line_counting_grid'
istr_ds_4_posting.s_dataobject_str += 'd_inventory_line_counting' +'['+string(li_idx)+']'
istr_ds_4_posting.ds_master[li_idx] = create t_ds_db
istr_ds_4_posting.ds_master[li_idx].dataobject = 'd_counting_form'	
istr_ds_4_posting.s_join_detail[li_idx] =''
	

li_idx = upperbound(istr_ds_4_posting.ds_details[]) + 1
istr_ds_4_posting.ds_details[li_idx] = create t_ds_db
istr_ds_4_posting.ds_details[li_idx].dataobject =  'd_lot_line_grid'
istr_ds_4_posting.s_dataobject_str +='d_lot_line_grid' +'['+string(li_idx)+']'
istr_ds_4_posting.ds_master[li_idx] = create t_ds_db
istr_ds_4_posting.ds_master[li_idx].dataobject = 'd_inventory_line_counting_grid'	
istr_ds_4_posting.s_join_detail[li_idx] =''
return 1
end function

on c_counting.create
call super::create
end on

on c_counting.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = true
ib_display_text = false
is_display_model = '1d'
is_object_title = 'Phiếu kiểm kê'
istr_actionpane[1].s_button_name = 'b_add;b_insert;b_modify;b_save;b_query;b_execquery;b_filteron;b_refresh;b_delete;b_cancel;b_view_multi;b_post;b_unpost;b_account_view;b_process;'
istr_actionpane[1].s_button_has_sub = 'b_view_multi;'
istr_actionpane[1].sa_sub_button[1]='b_view_counting_stock;b_view_counting_list;'
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_process;b_view_multi;b_blank;b_post;b_account_view;'  
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_process;b_view_multi;b_blank;b_post;b_account_view;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_process;b_view_multi;b_blank;b_post;b_account_view;b_blank;b_copyt_multi;b_blank;b_send_2_approve;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_process;b_view_multi;b_blank;b_post;b_blank;b_account_view;b_copyt_multi;b_blank;b_send_2_approve;b_approve;b_reject;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_refresh;b_detail;b_delete;b_cancel;b_process;b_post;b_view_multi;b_account_view;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_process;b_view_multi;b_blank;b_post;b_account_view;'
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

event e_window_open;call super::e_window_open;t_dw_mpl			ldw_main
any				laa_value[]
string a,b
//--form parm--//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '=COUNTING'
ldw_main.f_add_where('doc_type;',laa_value[])
return 0
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;double						ldb_version_id
b_obj_instantiate			lbo_ins

ldb_version_id = lbo_ins.f_Create_id_ex( it_transaction )
rpo_dw.setitem(vl_currentrow,'doc_type','COUNTING')
rpo_dw.setitem(vl_currentrow,'object_ref_table','BOOKED_SLIP')
rpo_dw.setitem(vl_currentrow,'version_id',ldb_version_id)
rpo_dw.setitem(vl_currentrow,'trans_date',date(gd_session_date))
return vl_currentrow
end event

event e_dw_e_itemchanged;//--OVERRIDE --//


string					ls_qty_yn,ls_value_yn
double				ldb_trans_id
u_trans_setup		lu_trans_setup


if vs_colname = 'trans_desc' then
	ldb_trans_id = rpo_dw.getitemnumber(vl_currentrow,'trans_hdr_id')		

	if isnull(ldb_trans_id) then ldb_trans_id = 0
	if ldb_trans_id > 0  then
		lu_trans_setup= create u_trans_setup
		lu_trans_setup.f_get_qty_and_value_yn(ldb_trans_id, ls_qty_yn, ls_value_yn)
		rpo_dw.setitem(vl_currentrow, 'quantity_yn',ls_qty_yn)
		rpo_dw.setitem(vl_currentrow, 'value_yn',ls_value_yn)
		destroy u_trans_setup
	end if
end if

return 0

end event

event e_dw_e_postsave;call super::e_dw_e_postsave;double		ldb_doc_id, ldb_extend_id, ldb_object_id
double		ldb_base_curr_id, ldb_exrate
string			ls_currCode, ls_currName,ls_desc, ls_qty_yn, ls_value_yn, ls_lock_issue_yn, ls_lock_rec_yn
date			ld_trans_date

c_unit_instance			lc_unit_ins

ldb_doc_id =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'id') 
if ldb_doc_id > 0 then
	
	//-- booked_sliP--//
	ldb_extend_id = rpo_dw.getitemnumber(rpo_dw.getrow(), 'extend_id') 
	ldb_object_id =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'dr_cr_object') 
	ls_desc =  rpo_dw.getitemstring(rpo_dw.getrow(), 'description')
	ls_qty_yn =  rpo_dw.getitemstring(rpo_dw.getrow(), 'quantity_yn') 
	ls_value_yn =  rpo_dw.getitemstring(rpo_dw.getrow(), 'value_yn') 
	ls_lock_rec_yn =  rpo_dw.getitemstring(rpo_dw.getrow(), 'lock_rec_yn') 
	ls_lock_issue_yn =  rpo_dw.getitemstring(rpo_dw.getrow(), 'lock_issue_yn') 
	ld_trans_date =  date(rpo_dw.getitemdatetime(rpo_dw.getrow(), 'trans_date') )
	ldb_exrate = rpo_dw.getitemnumber(rpo_dw.getrow(), 'exchange_rate') 	
	ldb_base_curr_id = rpo_dw.getitemnumber(rpo_dw.getrow(), 'CURRENCY_ID') 	
	if ldb_base_curr_id = 0 or isnull(ldb_base_curr_id) then
		lc_unit_ins.f_get_base_cur_ex( ldb_base_curr_id,ls_currCode, ls_currName, it_transaction )
		ldb_exrate = 1
	end if
	

	if ldb_extend_id > 0 then
		//-- update--//		
		UPDATE booked_slip 
		set dr_cr_object =:ldb_object_id,currency_id = :ldb_base_curr_id, exchange_rate = :ldb_exrate, 								
								description = :ls_desc,quantity_yn = :ls_qty_yn, value_yn = :ls_value_yn,								
								lock_rec_yn = :ls_lock_rec_yn, lock_issue_yn = :ls_lock_issue_yn,
								trans_date = :ld_trans_date
		where id = :ldb_extend_id using it_transaction;
	else
		//-- insert--//
		ldb_extend_id =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'version_id') 
		INSERT into booked_slip (id, object_ref_id, object_ref_Table, company_id, branch_id, created_by, created_Date, last_mdf_by, last_mdf_date, doc_type,version_no,
								  dr_cr_object, currency_id, exchange_rate, description, quantity_yn, value_yn, lock_rec_yn, lock_issue_yn, trans_date )								  								 
		VALUES(:ldb_extend_id, :ldb_doc_id, 'DOCUMENT',:gi_user_comp_id, :gdb_branch, :gi_userid, sysdate, :gi_userid, sysdate,'COUNTING', 1,
					:ldb_object_id,:ldb_base_curr_id,:ldb_exrate ,:ls_desc,:ls_qty_yn, :ls_value_yn, :ls_lock_rec_yn, :ls_lock_issue_yn, :ld_trans_date )
		using it_transaction;
	end if

	return 1
end if
return 0
end event

event e_dw_e_predelete;call super::e_dw_e_predelete;double		ldb_extend_id, ldb_doc_id
int				li_cnt
b_obj_instantiate		lbo_ins

	//-- check matching --//
	ldb_doc_id = rpo_dw.getitemnumber(vl_currentrow, 'id') 
	select count(id) into :li_cnt
	from matching where f_doc_id = :ldb_doc_id using it_transaction;
	if li_cnt > 0 then
		gf_messagebox('m.c_po.e_dw_e_predelete.01','Thông báo','Phiếu đã kết với chứng từ khác nên không xoá được','stop','ok',1)
		return -1
	end if
	//-- delete matching--//
	select count(id) into :li_cnt
	from matching where t_doc_id = :ldb_doc_id using it_transaction;	
	if li_cnt > 0 then
		delete from matching where t_doc_id = :ldb_doc_id using it_transaction;	
	end if
	
	//-- delete detail--//
	ldb_extend_id = rpo_dw.getitemnumber(vl_currentrow, 'extend_id') 
	if ldb_extend_id > 0 then
		iw_display.f_get_transaction(it_transaction)
		DELETE  booked_slip where id = :ldb_extend_id using it_transaction;
		//-- PO_LINE--//
		DELETE  inventory_line where object_ref_id = :ldb_extend_id using it_transaction;
		//-- delete lot_line --//
		DELETE  lot_line where doc_version = :ldb_extend_id using it_transaction;
		return 1
	end if

return 0
end event

event e_window_e_change_object;call super::e_window_e_change_object;long				ll_found
t_dw_mpl		ldw_main

ldw_main = iw_display.f_get_dwmain( )

ll_found = ldw_main.find( "Id=" +string( idb_main_id ), 1, ldw_main.rowcount())
if ll_found > 0 then
	ldw_main.scrolltorow( ll_found)
end if
return 0
end event

event e_window_e_detail_start;call super::e_window_e_detail_start;
t_dw_mpl 			ldw_main
ldw_main = iw_display.f_get_dwmain( )
if ldw_main.rowcount( ) > 0 then
	if ldw_main.f_get_ib_editing( ) then
		if iw_display.event e_save( ) = -1 then return -1
		ldw_main.f_set_ib_editing( true)
	else
		return 0
	end if
else
	return -1
end if
end event

event e_window_e_postadd;call super::e_window_e_postadd;
iw_display.idw_focus.setcolumn( 'document_date')
return 0
end event

