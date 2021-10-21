$PBExportHeader$c_tax_settle.sru
forward
global type c_tax_settle from b_doc
end type
end forward

global type c_tax_settle from b_doc
event e_action_process ( )
end type
global c_tax_settle c_tax_settle

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_actionpane ()
public subroutine f_set_str_unit ()
public subroutine f_set_dwo_related ()
public subroutine f_set_str_streamvalue ()
public function integer f_reset_fixedpart_grid ()
public function integer f_resize_fixedpart_form ()
public function integer f_resize_fixedpart_grid ()
public function integer f_insert_matching_tax_settle (ref t_ds_db rds_matching, double vdb_f_ref_id, double vdb_t_ref_id, datetime vdt_match_date, double vdb_doc_f_id, double vdb_doc_t_id, double vdb_value, string vs_type, t_ds_db rds_tax_line)
end prototypes

event e_action_process();t_transaction	lt_transaction
c_datetime		lc_dt
t_dw_mpl		ldw_doc
t_ds_db			lds_matching,lds_sum_ip_tax,lds_sum_op_tax,lds_ip_tax,lds_op_tax,lds_tax_sal,lds_tax_pur
datetime			ldt_sysdate
double			ldb_ip_val, ldb_ip_tax,ldb_op_val,ldb_op_tax,ldb_obt_id,ldb_f_doc_id,ldb_t_doc_id
long				ll_rtn_ip, ll_rtn_op,ll_retrieve,ll_idx
date				ld_f_date,ld_t_date

iw_display.f_get_transaction( lt_transaction)
ldw_doc = iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
ldt_sysdate = lc_dt.f_getsysdate( )
ldb_t_doc_id = ldw_doc.getitemnumber( ldw_doc.getrow(), 'ID')

lds_matching = create t_ds_db
lds_matching.dataobject = 'ds_matching'
lds_matching.f_settransobject(lt_transaction )

//lds_sum_ip_tax = create t_ds_db
//lds_sum_ip_tax.dataobject = 'ds_sum_ip_tax_grid'
//lds_sum_ip_tax.f_settransobject(lt_transaction )
//
//lds_sum_op_tax = create t_ds_db
//lds_sum_op_tax.dataobject = 'ds_sum_op_tax_grid'
//lds_sum_op_tax.f_settransobject(lt_transaction )

lds_ip_tax = create t_ds_db
lds_ip_tax.dataobject = 'ds_input_sales_tax_grid'
lds_ip_tax.f_settransobject(lt_transaction )

lds_op_tax = create t_ds_db
lds_op_tax.dataobject = 'ds_output_sales_tax_grid'
lds_op_tax.f_settransobject(lt_transaction )

lds_tax_pur = create t_ds_db
lds_tax_pur.dataobject = 'ds_tax_line_pur'
lds_tax_pur.f_settransobject(lt_transaction )

lds_tax_sal = create t_ds_db
lds_tax_sal.dataobject = 'ds_tax_line_sal'
lds_tax_sal.f_settransobject(lt_transaction )

ld_f_date = date(ldw_doc.getitemdatetime( ldw_doc.getrow(), 'count_f_date'))
ld_t_date = date(ldw_doc.getitemdatetime( ldw_doc.getrow(), 'count_t_date'))

//lds_sum_ip_tax.retrieve(ld_f_date,ld_t_date,gdb_branch,gs_sob )
//lds_sum_op_tax.retrieve(ld_f_date,ld_t_date,gdb_branch,gs_sob )

ll_rtn_ip = lds_ip_tax.retrieve( ld_f_date,ld_t_date,gdb_branch,gs_sob)
ll_rtn_op = lds_op_tax.retrieve( ld_f_date,ld_t_date,gdb_branch,gs_sob)
lds_tax_pur.retrieve( ld_f_date,ld_t_date)
lds_tax_sal.retrieve( ld_f_date,ld_t_date)

if ll_rtn_ip > ll_rtn_op then ll_retrieve = ll_rtn_ip
if ll_rtn_op > ll_rtn_ip then ll_retrieve = ll_rtn_op

for ll_idx = 1 to ll_retrieve
	if ll_idx < ll_rtn_ip then
		ldb_obt_id = lds_ip_tax.getitemnumber( ll_idx, 'OBJECT_TRANS_ID')
		ldb_f_doc_id = lds_ip_tax.getitemnumber( ll_idx, 'DOC_ID')
		ldb_ip_val = lds_ip_tax.getitemnumber( ll_idx, 'base_amount')
		this.f_insert_matching_tax_settle(lds_matching, ldb_obt_id, ldb_obt_id, ldt_sysdate, ldb_f_doc_id, ldb_t_doc_id, ldb_ip_val, 'VALUES', lds_tax_pur)
		this.f_insert_matching_tax_settle( lds_matching, 0, 0, ldt_sysdate, ldb_f_doc_id, ldb_t_doc_id, 0, 'TAX', lds_tax_pur)
	end if
	
	if ll_idx < ll_rtn_op then
		ldb_obt_id = lds_op_tax.getitemnumber( ll_idx, 'OBJECT_TRANS_ID')
		ldb_f_doc_id = lds_op_tax.getitemnumber( ll_idx, 'DOC_ID')
		ldb_op_val = lds_op_tax.getitemnumber( ll_idx, 'base_amount')
		this.f_insert_matching_tax_settle(lds_matching, ldb_obt_id, ldb_obt_id, ldt_sysdate, ldb_f_doc_id, ldb_t_doc_id, ldb_op_val, 'VALUES', lds_tax_sal)
		this.f_insert_matching_tax_settle( lds_matching, 0, 0, ldt_sysdate, ldb_f_doc_id, ldb_t_doc_id, 0, 'TAX', lds_tax_sal)
	end if
next

if lds_matching.rowcount() > 0 then
	if lds_matching.update(true,false ) = 1 then
		lds_matching.resetupdate( )
		COMMIT using lt_transaction;
	end if
end if
destroy lds_matching
//destroy lds_sum_ip_tax
//destroy lds_sum_op_tax
destroy lds_ip_tax
destroy lds_op_tax
destroy lds_tax_pur
destroy lds_tax_sal
return
end event

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_document_tax_settle_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_document_tax_settle_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_tax_settle_form;d_input_sales_tax_grid;d_output_sales_tax_grid;' 
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
istr_dwo[1].s_gb_name = 'gb_6'
istr_dwo[1].s_description = 'Tờ khai thuế GTGT'

istr_dwo[2].s_dwo_default =  'd_tax_settle_form'
istr_dwo[2].s_dwo_form = 'd_tax_settle_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = true
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_details = ''
istr_dwo[2].s_dwo_master = 'd_document_ar_grid;'
istr_dwo[2].s_dwo_shared = ''
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
istr_dwo[2].s_description = ''

//istr_dwo[3].s_dwo_default =  'd_sal_tax_desc_form'
//istr_dwo[3].s_dwo_form = 'd_sal_tax_desc_form'
//istr_dwo[3].s_dwo_grid = ''
//istr_dwo[3].b_shared = true
//istr_dwo[3].s_dwo_master = 'd_invoice_sal_form;'
//istr_dwo[3].s_master_keycol = ''
//istr_dwo[3].s_detail_keycol = ''
//istr_dwo[3].b_ref_table_yn  = false
//istr_dwo[3].s_ref_table_field = ''
//istr_dwo[3].b_insert = true
//istr_dwo[3].b_update = true
//istr_dwo[3].b_delete = true
//istr_dwo[3].b_query = true
//istr_dwo[3].b_print = true
//istr_dwo[3].b_excel = true
//istr_dwo[3].b_cascade_del = true
//istr_dwo[3].b_traceable = true
//istr_dwo[3].b_keyboardlocked = true
//istr_dwo[3].b_focus_master = true
//istr_dwo[3].s_description = 'Thông tin khai báo thuế'
end subroutine

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
iastr_dwo_tabpage[1].i_upperpart_height = 730
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_input_sales_tax_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_input_sales_tax_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_popmenu_items = 'm_spec_identified_cogs'
iastr_dwo_tabpage[1].str_dwo[1].b_master = false
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = false
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_document_tax_settle_grid;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[1].s_ref_table_field = ''
iastr_dwo_tabpage[1].str_dwo[1].b_insert = false
iastr_dwo_tabpage[1].str_dwo[1].b_update = false
iastr_dwo_tabpage[1].str_dwo[1].b_delete = false
iastr_dwo_tabpage[1].str_dwo[1].b_query = true
iastr_dwo_tabpage[1].str_dwo[1].b_print = true
iastr_dwo_tabpage[1].str_dwo[1].b_excel = true
iastr_dwo_tabpage[1].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Chi tiết thuế đầu vào'

iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_display_model = '1d'
iastr_dwo_tabpage[2].i_upperpart_height = 730
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_output_sales_tax_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = 'd_output_sales_tax_grid'
iastr_dwo_tabpage[2].str_dwo[1].b_master = false
iastr_dwo_tabpage[2].str_dwo[1].b_detail = true
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = false
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_document_tax_settle_grid;'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[2].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[2].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[2].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[2].str_dwo[1].s_ref_table_field = ''
iastr_dwo_tabpage[2].str_dwo[1].b_insert = false
iastr_dwo_tabpage[2].str_dwo[1].b_update = true
iastr_dwo_tabpage[2].str_dwo[1].b_delete = false
iastr_dwo_tabpage[2].str_dwo[1].b_query = false
iastr_dwo_tabpage[2].str_dwo[1].b_print = true
iastr_dwo_tabpage[2].str_dwo[1].b_excel = true
iastr_dwo_tabpage[2].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[2].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[2].str_dwo[1].s_description ='Chi tiết thuế đầu ra'
//
//iastr_dwo_tabpage[3].s_tp_name = 's_tp_multi'
//iastr_dwo_tabpage[3].s_display_model = '2d'
//iastr_dwo_tabpage[3].i_upperpart_height = 730
//iastr_dwo_tabpage[3].str_dwo[1].s_dwo_default =  'd_tax_line_grid'
//iastr_dwo_tabpage[3].str_dwo[1].s_dwo_form = ''
//iastr_dwo_tabpage[3].str_dwo[1].s_dwo_grid = 'd_tax_line_grid'
//iastr_dwo_tabpage[3].str_dwo[1].b_master = true
//iastr_dwo_tabpage[3].str_dwo[1].b_detail = true
//iastr_dwo_tabpage[3].str_dwo[1].b_cascade_del = true
//iastr_dwo_tabpage[3].str_dwo[1].s_dwo_master = 'd_sal_invoice_line_grid;'
//iastr_dwo_tabpage[3].str_dwo[1].s_dwo_details = 'd_post_line_tax_grid;'
//iastr_dwo_tabpage[3].str_dwo[1].s_dwo_shared = ''
//iastr_dwo_tabpage[3].str_dwo[1].s_master_keycol = 'ID;'
//iastr_dwo_tabpage[3].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
//iastr_dwo_tabpage[3].str_dwo[1].b_ref_table_yn  = false
//iastr_dwo_tabpage[3].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
//iastr_dwo_tabpage[3].str_dwo[1].b_insert = true
//iastr_dwo_tabpage[3].str_dwo[1].b_update = true
//iastr_dwo_tabpage[3].str_dwo[1].b_delete = true
//iastr_dwo_tabpage[3].str_dwo[1].b_query = true
//iastr_dwo_tabpage[3].str_dwo[1].b_print = true
//iastr_dwo_tabpage[3].str_dwo[1].b_excel = true
//iastr_dwo_tabpage[3].str_dwo[1].b_keyboardlocked = true
//iastr_dwo_tabpage[3].str_dwo[1].b_traceable = true
//iastr_dwo_tabpage[3].str_dwo[1].s_description ='Thuế'




end subroutine

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_str_unit ();//--Datawindow chứa các cột cần làm tròn--//
istr_unit[1].s_dwo_handing = 'd_sal_invoice_line_grid;d_sal_invoice_line_grid;d_sal_invoice_line_grid;d_sal_invoice_line_grid;d_invoice_sal_form;'
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = 'qty;price;amount;base_amount;exchange_rate;'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[1].s_dwo_unit = 'd_sal_invoice_line_grid;d_invoice_sal_form;d_invoice_sal_form;d_invoice_sal_form;d_invoice_sal_form;'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = 'uom_code;uom_code;uom_code;uom_code;exchange_rate;'
//--Loại làm tròn --//
istr_unit[1].s_type = 'item;price;amount;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[1].s_dwo_object = 'd_sal_invoice_line_grid'
//--Cột chứa mã đơn vị--//
istr_unit[1].s_colname_object = 'object_code'
end subroutine

public subroutine f_set_dwo_related ();//istr_dwo_related[1].s_related_obj_name = 'b_view'					// đối tượng liên quan
//istr_dwo_related[1].s_main_obj_dwo = 'd_document_ar_grid'		//datawindow quan hệ main
//istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
//istr_dwo_related[1].s_related_obj_dwo = 'dv_sal_invoice_form'	// datawindow quan hệ đến
//istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
//istr_dwo_related[1].s_relatedtext_column = 'code'					
//istr_dwo_related[1].s_text = 'In hóa đơn bán hàng '
//
//istr_dwo_related[2].s_related_obj_name = 'u_so'					// đối tượng quan hệ đến
//istr_dwo_related[2].s_main_obj_dwo = 'd_document_ar_grid'		//datawindow quan hệ main
//istr_dwo_related[2].s_main_obj_column = 'id'			// cột quan hệ của main
//istr_dwo_related[2].s_related_obj_dwo = 'd_document_orders_grid'	// datawindow quan hệ đến
//istr_dwo_related[2].s_related_obj_column = 'id'			// cột quan hệ đến
//istr_dwo_related[2].b_t_matching = true
//istr_dwo_related[2].s_relatedtext_column = 'doc_code'					
//istr_dwo_related[2].s_text = 'Đơn trả hàng từ: '
//istr_dwo_related[2].s_match_f_dwo[1] = 'd_so_line_grid'
//istr_dwo_related[2].s_match_t_dwo[1] = 'd_sal_invoice_line_grid'
//istr_dwo_related[2].s_match_f_column[1] = 'act_qty'
//istr_dwo_related[2].s_match_t_column[1] = 'act_qty'
//istr_dwo_related[2].s_match_column[1] = 'qty'
//istr_dwo_related[2].s_match_rf_dwo[1] = 'd_so_line_grid'
//
//istr_dwo_related[3].s_related_obj_name = 'u_goods_delivery'					// đối tượng quan hệ đến
//istr_dwo_related[3].s_main_obj_dwo = 'd_document_ar_grid'		//datawindow quan hệ main
//istr_dwo_related[3].s_main_obj_column = 'id'			// cột quan hệ của main
//istr_dwo_related[3].s_related_obj_dwo = 'd_document_inventory_grid'	// datawindow quan hệ đến
//istr_dwo_related[3].s_related_obj_column = 'id'			// cột quan hệ đến
//istr_dwo_related[3].b_f_matching = true
//istr_dwo_related[3].s_relatedtext_column = 'doc_code'					
//istr_dwo_related[3].s_text = 'Hóa đơn bán từ: '
//istr_dwo_related[3].s_match_t_dwo[1] = 'd_inventory_line_delivery_grid'
//istr_dwo_related[3].s_match_f_dwo[1] = 'd_sal_invoice_line_grid' 
//istr_dwo_related[3].s_match_rf_dwo[1] = 'd_so_line_grid;d_sal_invoice_line_grid'
//istr_dwo_related[3].s_match_t_column[1] = 'qty'
//istr_dwo_related[3].s_match_f_column[1] = 'act_qty'
//istr_dwo_related[3].s_match_column[1] = 'qty'
//
//istr_dwo_related[3].s_related_obj_dwo_copy[1] = 'd_inventory_line_delivery_grid' // datawindow copy từ
//istr_dwo_related[3].s_related_obj_column_copy[1] =  'ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;QTY;doc_QTY;uom_code;TRANS_UOM;warehouse_id;wh_code;wh_name;SPEC_ID;spec_code;spec_name;PRICE;AMOUNT;' +&
//																		'ACT_PRICE;ACT_AMOUNT;MARKUP_QTY;MARKUP_AMT;COMM_AMT;NOT_INVOICE;foc_yn;' +&
//																		'MARKUP_RETURN;sales_person;MARKUP_PCT;disc_pct;disc_amt;' // cột copy từ
//
//istr_dwo_related[3].s_main_obj_dwo_copy[1]  = 'd_sal_invoice_line_grid' // datawindow copy đến
//istr_dwo_related[3].s_main_obj_column_copy[1] = 'object_ID;object_code;object_name;LINE_TEXT;NOTE;QTY;act_qty;uom_code;TRANS_UOM;warehouse_id;warehouse_code;warehouse_name;SPEC_ID;spec_code;spec_name;PRICE;AMOUNT;' +&
//																			'ACT_PRICE;ACT_AMOUNT;MARKUP_QTY;MARKUP_AMT;COMM_AMT;NOT_INVOICE;foc_yn;'+&
//																			'MARKUP_RETURN;sales_person;MARKUP_PCT;disc_pct;disc_amt;' // cột copy đến
//istr_dwo_related[3].b_copy_line[1] = true
////khai báo cộng dồn số lượng
//istr_dwo_related[3].b_f_sum[1] = true
//istr_dwo_related[3].s_main_obj_column_sum[1] = 'qty;MARKUP_QTY;MARKUP_AMT;COMM_AMT;MARKUP_RETURN;' 
//istr_dwo_related[3].s_t_obj_column_chk[1] = 'ITEM_ID;PRICE;NOT_INVOICE;foc_yn;LINE_TEXT;ACT_PRICE;'
//istr_dwo_related[3].s_f_obj_column_chk[1] = 'object_ID;PRICE;NOT_INVOICE;foc_yn;LINE_TEXT;ACT_PRICE;'
//istr_dwo_related[3].s_main_dr_cr_obj_dwo_sum[1]=''
//istr_dwo_related[3].s_main_dr_cr_obj_column_sum[1]=''
////khai bao dw tra hang
//istr_dwo_related[3].s_match_rf_dwo[1] = 'd_so_line_grid;d_inventory_line_delivery_grid'
//// khai báo cập nhật bản matching
//istr_dwo_related[3].s_match_t_dwo[1] = 'd_inventory_line_delivery_grid'
////istr_dwo_related[2].s_match_f_col_obj[1] = 'item_id' //-- đóng lại vì cho phép phiếu xuất kho kết với đơn hàng dịch vụ
//istr_dwo_related[3].s_match_f_dwo[1] = 'd_sal_invoice_line_grid' 
//istr_dwo_related[3].s_match_t_column[1] = 'qty'
//istr_dwo_related[3].s_match_f_column[1] = 'act_qty'
//istr_dwo_related[3].s_match_column[1] = 'qty'
//
//istr_dwo_related[3].s_related_obj_dwo_copy[2] =  'd_goods_delivery_form' // datawindow copy từ
//istr_dwo_related[3].s_related_obj_column_copy[2] = 'invoice_object;object_code;object_name;trans_address;invoice_object;object_code;object_name;invoice_address;' + &
//												 'note;description;trans_date;payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate;invoice_address;invoice_address;invoice_request;include_tax_yn;' // cột copy từ
//istr_dwo_related[3].s_main_obj_dwo_copy[2] = 'd_invoice_sal_form' // datawindow copy đến
//istr_dwo_related[3].s_main_obj_column_copy[2] = 'invoice_object;invoice_object_code;invoice_object_name;trans_address;dr_cr_object;dr_cr_object_code;dr_cr_object_name;invoice_address;' + &
//												'note;description;trans_date;payment_term;payment_method;payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;currency_id;exchange_rate;trans_address;invoice_address;invoice_request;include_tax_yn;'  // cột copy đến
//istr_dwo_related[3].s_related_obj_column_chk[2] = 'object_code;include_tax_yn'
//istr_dwo_related[3].s_main_obj_column_chk[2] = 'invoice_object_code;include_tax_yn'
//
///////
//istr_dwo_related[3].s_related_obj_dwo_copy[3] = 'd_charge_line_grid' // datawindow copy từ
//istr_dwo_related[3].s_related_obj_column_copy[3] =  'CHARGE_ID;CHARGE_PCT;TAX_YN;CHARGE_AMT;CHARGE_CURRENCY;EXCHANGE_RATE;CHARGE_BASE_AMT;OBJECT_OFFSET_ID;OBJECT_OFFSET_TABLE;'&
//																	+ 'SUBACCOUNT;BENEFICIARY_ID;BENEFICIARY_NAME;OBJECT_CODE;OBJECT_NAME;UOM_CODE;object_offset_code;object_offset_name;'					
//istr_dwo_related[3].s_main_obj_dwo_copy[3] = 'd_charge_line_grid' // datawindow copy đến
//istr_dwo_related[3].s_main_obj_column_copy[3] = 'CHARGE_ID;CHARGE_PCT;TAX_YN;CHARGE_AMT;CHARGE_CURRENCY;EXCHANGE_RATE;CHARGE_BASE_AMT;OBJECT_OFFSET_ID;OBJECT_OFFSET_TABLE;'&
//																	+ 'SUBACCOUNT;BENEFICIARY_ID;BENEFICIARY_NAME;OBJECT_CODE;OBJECT_NAME;UOM_CODE;object_offset_code;object_offset_name'
//istr_dwo_related[3].s_main_obj_column_chk[3] = ''
//istr_dwo_related[3].s_related_obj_column_chk[3] = ''
//istr_dwo_related[3].s_match_f_dwo[3] = ''
//istr_dwo_related[3].s_match_t_dwo[3] = '' 
//istr_dwo_related[3].s_match_f_column[3] = ''
//istr_dwo_related[3].s_match_t_column[3] = ''
//istr_dwo_related[3].s_match_column[3] = ''
//istr_dwo_related[3].s_main_obj_column_sum[3] = ''
//istr_dwo_related[3].s_related_obj_column_sum[3] = ''
//istr_dwo_related[3].s_f_obj_column_chk[3] = ''
//istr_dwo_related[3].s_t_obj_column_chk[3] = ''
//istr_dwo_related[3].b_f_sum[3] = false
//istr_dwo_related[3].b_copy_line[3] = false
//
//istr_dwo_related[4].s_related_obj_name = 'u_customer'
//istr_dwo_related[4].s_main_obj_dwo = 'd_invoice_sal_form'
//istr_dwo_related[4].s_main_obj_column = 'dr_cr_object'
//istr_dwo_related[4].s_related_obj_dwo = 'd_objects_grid'
//istr_dwo_related[4].s_related_obj_column = 'id'
//istr_dwo_related[4].s_relatedtext_column = 'doc_code'
//istr_dwo_related[4].s_text = 'Khách hàng của: '
//
//istr_dwo_related[5].s_related_obj_name = 'u_sal_invoice_replace'					// đối tượng liên quan
//istr_dwo_related[5].s_main_obj_dwo = 'd_document_ar_grid'		//datawindow quan hệ main
//istr_dwo_related[5].s_main_obj_column = 'id'			// cột quan hệ của main
//istr_dwo_related[5].s_related_obj_dwo = 'd_document_ar_grid'	// datawindow quan hệ đến
//istr_dwo_related[5].s_related_obj_column = 'id'			// cột quan hệ đến
//istr_dwo_related[5].b_f_matching = true
//istr_dwo_related[5].s_relatedtext_column = 'code'					
//istr_dwo_related[5].s_text = 'Hóa đơn bán:'
//
//istr_dwo_related[5].s_main_obj_dwo_copy[1] = 'd_sal_invoice_line_grid' // datawindow copy từ
//istr_dwo_related[5].s_main_obj_column_copy[1] ='line_no;object_type;object_id;object_code;line_text;warehouse_id;warehouse_code;spec_id;TRANS_UOM;uom_code;qty;price;amount;' // cột copy từ
//istr_dwo_related[5].s_main_obj_column_copy[1]+='tax_type;tax_pct;tax_amt;tax_correction;act_qty;base_amount;act_price;comm_pct;comm_amt;markup_pct;markup_return;markup_amt;act_amount;'
//istr_dwo_related[5].s_main_obj_column_copy[1]+='act_base_amount;sales_person;sales_name;disc_pct;disc_amt;warehouse_name;spec_code;spec_name;foc_yn;not_invoice;subaccount_code;note'
//istr_dwo_related[5].s_related_obj_dwo_copy[1] = 'd_sal_invoice_line_grid' // datawindow copy đến
//istr_dwo_related[5].s_related_obj_column_copy[1] = 'line_no;object_type;object_id;object_code;line_text;warehouse_id;warehouse_code;spec_id;TRANS_UOM;uom_code;qty;price;amount;'  // cột copy đến
//istr_dwo_related[5].s_related_obj_column_copy[1]+='tax_type;tax_pct;tax_amt;tax_correction;act_qty;base_amount;act_price;comm_pct;comm_amt;markup_pct;markup_return;markup_amt;act_amount;'
//istr_dwo_related[5].s_related_obj_column_copy[1]+='act_base_amount;sales_person;sales_name;disc_pct;disc_amt;warehouse_name;spec_code;spec_name;foc_yn;not_invoice;subaccount_code;note'
//istr_dwo_related[5].s_main_obj_column_chk[1] = ''
//istr_dwo_related[5].s_related_obj_column_chk[1] = ''
//istr_dwo_related[5].s_f_obj_column_chk[1] = 'object_id'
//istr_dwo_related[5].s_t_obj_column_chk[1] = 'object_id'
//istr_dwo_related[5].b_copy_line[1] = true
//istr_dwo_related[5].s_match_f_dwo[1] = 'd_sal_invoice_line_grid'
//istr_dwo_related[5].s_match_f_col_obj[1] = 'object_id'
//istr_dwo_related[5].s_match_t_dwo[1] = 'd_sal_invoice_line_grid'
//istr_dwo_related[5].s_match_f_column[1] = 'act_qty'
//istr_dwo_related[5].s_match_t_column[1] = 'act_qty'
//istr_dwo_related[5].s_match_column[1] = 'qty'
//
////chi tiet
//istr_dwo_related[5].s_main_obj_dwo_copy[2] = 'd_invoice_sal_form' // datawindow copy từ
//istr_dwo_related[5].s_main_obj_column_copy[2] ='invoice_object;payment_term;payment_method;dr_cr_object;currency_id;company_id;cus_tax_num;invoice_object_code;invoice_object_name;invoice_address;dr_cr_object_code;dr_cr_object_name;'
//istr_dwo_related[5].s_main_obj_column_copy[2]+='payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;exchange_rate;version_no;'
//istr_dwo_related[5].s_main_obj_column_copy[2]+='include_tax_yn;invoice_yn;quantity_yn;value_yn;due_date;invoice_received_date;trans_address;description;note;'
//istr_dwo_related[5].s_related_obj_dwo_copy[2] = 'd_invoice_sal_form' // datawindow copy đến
//istr_dwo_related[5].s_related_obj_column_copy[2]='invoice_object;payment_term;payment_method;dr_cr_object;currency_id;company_id;cus_tax_num;invoice_object_code;invoice_object_name;invoice_address;dr_cr_object_code;dr_cr_object_name;'
//istr_dwo_related[5].s_related_obj_column_copy[2]+='payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;exchange_rate;version_no;'
//istr_dwo_related[5].s_related_obj_column_copy[2]+='include_tax_yn;invoice_yn;quantity_yn;value_yn;due_date;invoice_received_date;trans_address;description;note;'
////chi phi
//istr_dwo_related[5].s_main_obj_dwo_copy[3] = 'd_charge_line_grid' // datawindow copy từ
//istr_dwo_related[5].s_main_obj_column_copy[3] ='line_no;object_code;object_name;charge_pct;charge_amt;uom_code;exchange_rate' // cột copy từ
//istr_dwo_related[5].s_related_obj_dwo_copy[3] = 'd_charge_line_grid' // datawindow copy đến
//istr_dwo_related[5].s_related_obj_column_copy[3] = 'line_no;object_code;object_name;charge_pct;charge_amt;uom_code;exchange_rate'   // cột copy đến
//
////dinh khoan
//istr_dwo_related[5].s_main_obj_dwo_copy[4] = 'd_post_line_invoice_grid' // datawindow copy từ
//istr_dwo_related[5].s_main_obj_column_copy[4] ='post_type;dr_object_type;dr_object_code;dr_account_code;cr_object_type;cr_object_code;cr_account_code;trans_amt;base_amt;uom_code;ex_rate' // cột copy từ
//istr_dwo_related[5].s_related_obj_dwo_copy[4] = 'd_post_line_invoice_grid' // datawindow copy đến
//istr_dwo_related[5].s_related_obj_column_copy[4] = 'post_type;dr_object_type;dr_object_code;dr_account_code;cr_object_type;cr_object_code;cr_account_code;trans_amt;base_amt;uom_code;ex_rate'   // cột copy đến
//
//istr_dwo_related[5].s_main_obj_dwo_copy[5] = 'd_post_line_charge_grid' // datawindow copy từ
//istr_dwo_related[5].s_main_obj_column_copy[5] ='post_type;dr_object_type;dr_object_code;dr_account_code;cr_object_type;cr_object_code;cr_account_code;trans_amt;base_amt;uom_code;ex_rate' // cột copy từ
//istr_dwo_related[5].s_related_obj_dwo_copy[5] = 'd_post_line_charge_grid' // datawindow copy đến
//istr_dwo_related[5].s_related_obj_column_copy[5] = 'post_type;dr_object_type;dr_object_code;dr_account_code;cr_object_type;cr_object_code;cr_account_code;trans_amt;base_amt;uom_code;ex_rate'   // cột copy đến
//istr_dwo_related[5].s_main_obj_column_chk[5] = ''
//istr_dwo_related[5].s_related_obj_column_chk[5] = ''
//istr_dwo_related[5].s_match_f_dwo[5] = ''
//istr_dwo_related[5].s_match_t_dwo[5] =''
//istr_dwo_related[5].s_match_column[5] = ''
//istr_dwo_related[5].s_main_obj_column_sum[5] = ''
//istr_dwo_related[5].s_related_obj_column_sum[5] = ''
//istr_dwo_related[5].s_f_obj_column_chk[5] = ''
//istr_dwo_related[5].s_t_obj_column_chk[5] = ''
//istr_dwo_related[5].b_f_sum[5] = false
//istr_dwo_related[5].b_copy_line[5] = false
///////////////////////////////////////////
//istr_dwo_related[6].s_related_obj_name = 'u_receipt'					// đối tượng liên quan
//istr_dwo_related[6].s_main_obj_dwo = 'd_document_ar_grid'		//datawindow quan hệ main
//istr_dwo_related[6].s_main_obj_column = 'id'			// cột quan hệ của main
//istr_dwo_related[6].s_related_obj_dwo = 'd_document_ar_grid'	// datawindow quan hệ đến
//istr_dwo_related[6].s_related_obj_column = 'id'			// cột quan hệ đến
//istr_dwo_related[6].b_f_matching = true
//istr_dwo_related[6].s_relatedtext_column = 'doc_code'					
//istr_dwo_related[6].s_text = 'Phiếu thu từ:'
//
//istr_dwo_related[6].s_main_obj_dwo_copy[1] = 'd_post_line_invoice_grid' // datawindow copy từ
//istr_dwo_related[6].s_related_obj_dwo_copy[1] = 'd_payment_line_grid' // datawindow copy đến
//istr_dwo_related[6].s_main_obj_column_copy[1] ='DR_OBJECT_ID;trans_amt;base_amt' // cột copy từ
//istr_dwo_related[6].s_related_obj_column_copy[1] = 'OBJECT_ID;amount;base_amount'  // cột copy đến
//istr_dwo_related[6].s_main_dr_cr_obj_dwo_sum[1]='d_invoice_sal_form' //dw chứa đối tượng công nợ
//istr_dwo_related[6].s_main_dr_cr_obj_column_sum[1]='dr_cr_object' // cột chứa đối tượng công nợ
//istr_dwo_related[6].s_main_obj_column_sum[1] = 'trans_amt;base_amt' // cột cộng tổng
//istr_dwo_related[6].s_f_obj_column_chk[1] = 'DR_OBJECT_ID'
//istr_dwo_related[6].s_t_obj_column_chk[1] = 'OBJECT_ID'
//istr_dwo_related[6].s_main_obj_column_chk[1] = ''
//istr_dwo_related[6].s_related_obj_column_chk[1] = ''
//istr_dwo_related[6].b_f_sum[1] = true
//istr_dwo_related[6].b_copy_line[1] = true
//istr_dwo_related[6].s_match_f_dwo[1] = 'd_post_line_invoice_grid'
//istr_dwo_related[6].s_match_t_dwo[1] = 'd_payment_line_grid'
//istr_dwo_related[6].s_match_f_column[1] = 'trans_amt;base_amt'
//istr_dwo_related[6].s_match_t_column[1] = 'amount;base_amount'
//istr_dwo_related[6].s_match_column[1] = 'trans_value;base_value'
//
//istr_dwo_related[6].s_main_obj_dwo_copy[2] = 'd_post_line_tax_grid' // datawindow copy từ
//istr_dwo_related[6].s_related_obj_dwo_copy[2] = 'd_payment_line_grid' // datawindow copy đến
//istr_dwo_related[6].s_main_obj_column_copy[2] = 'DR_OBJECT_ID;trans_amt;base_amt' // cột copy từ
//istr_dwo_related[6].s_related_obj_column_copy[2] = 'OBJECT_ID;amount;base_amount'
//istr_dwo_related[6].s_main_dr_cr_obj_dwo_sum[2]='d_invoice_sal_form' //dw chứa đối tượng công nợ
//istr_dwo_related[6].s_main_dr_cr_obj_column_sum[2]='dr_cr_object' // cột chứa đối tượng công nợ
//istr_dwo_related[6].s_main_obj_column_sum[2] = 'trans_amt;base_amt' // cột cộng tổng
//istr_dwo_related[6].s_f_obj_column_chk[2] = 'DR_OBJECT_ID'
//istr_dwo_related[6].s_t_obj_column_chk[2] = 'OBJECT_ID'
//istr_dwo_related[6].s_main_obj_column_chk[2] = ''
//istr_dwo_related[6].s_related_obj_column_chk[2] = ''
//istr_dwo_related[6].b_f_sum[2] = true
//istr_dwo_related[6].b_copy_line[2] = true
//istr_dwo_related[6].s_match_f_dwo[2] = 'd_post_line_tax_grid'
//istr_dwo_related[6].s_match_t_dwo[2] = 'd_payment_line_grid'
//istr_dwo_related[6].s_match_f_column[2] = 'trans_amt;base_amt'
//istr_dwo_related[6].s_match_t_column[2] = 'amount;base_amount'
//istr_dwo_related[6].s_match_column[2] = 'trans_value;base_value'
//
//istr_dwo_related[6].s_main_obj_dwo_copy[3] = 'd_invoice_sal_form' // datawindow copy từ
//istr_dwo_related[6].s_main_obj_column_copy[3] ='dr_cr_object_type;dr_cr_object_code;dr_cr_object_name;' // cột copy từ
//istr_dwo_related[6].s_related_obj_dwo_copy[3] = 'd_payment_line_grid' // datawindow copy đến
//istr_dwo_related[6].s_related_obj_column_copy[3] = 'object_type;object_code;object_name'  // cột copy đến
//istr_dwo_related[6].s_main_obj_column_chk[3] = 'dr_cr_object'
//istr_dwo_related[6].s_related_obj_column_chk[3] = 'OBJECT_ID'
//istr_dwo_related[6].b_copy_line[3] = true
//
//istr_dwo_related[6].s_main_obj_dwo_copy[4] = 'd_invoice_sal_form' // datawindow copy từ
//istr_dwo_related[6].s_main_obj_column_copy[4] ='currency_id;uom_code;exchange_rate;dr_cr_object;' // cột copy từ
//istr_dwo_related[6].s_related_obj_dwo_copy[4] = 'd_receipt_form' // datawindow copy đến
//istr_dwo_related[6].s_related_obj_column_copy[4] = 'currency_id;uom_code;exchange_rate;invoice_object'  // cột copy đến
//istr_dwo_related[6].s_main_obj_column_chk[4] = ''
//istr_dwo_related[6].s_related_obj_column_chk[4] = ''
//istr_dwo_related[6].s_match_f_dwo[4] = ''
//istr_dwo_related[6].s_match_t_dwo[4] = ''
//istr_dwo_related[6].s_match_f_column[4] = ''
//istr_dwo_related[6].s_match_t_column[4] = ''
//istr_dwo_related[6].s_match_column[4] = ''
//istr_dwo_related[6].s_main_obj_column_sum[4] = ''
//istr_dwo_related[6].s_related_obj_column_sum[4] = ''
//istr_dwo_related[6].s_f_obj_column_chk[4] = ''
//istr_dwo_related[6].s_t_obj_column_chk[4] = ''
//istr_dwo_related[6].b_f_sum[4] = false
//istr_dwo_related[6].b_copy_line[4] = false
///////////////////////////////////////////
//
//istr_dwo_related[7].s_related_obj_name = 'u_item'					// đối tượng copy đến
//istr_dwo_related[7].s_main_obj_dwo = 	'd_sal_invoice_line_grid'	//datawindow quan hệ main
//istr_dwo_related[7].s_main_obj_column = 'id'			// cột quan hệ của main
//istr_dwo_related[7].s_related_obj_dwo =  'd_object_grid'	// datawindow quan hệ đến
//istr_dwo_related[7].s_related_obj_column = 'object_id'			// cột quan hệ đến
//istr_dwo_related[7].s_relatedtext_column = 'code'					
//istr_dwo_related[7].s_text = 'Hóa đơn bán của : '
//
//istr_dwo_related[8].s_related_obj_name = 'u_sal_invoice'					// đối tượng liên quan
//istr_dwo_related[8].s_main_obj_dwo = 'd_sal_invoice_line_grid'		//datawindow quan hệ main
//istr_dwo_related[8].s_main_obj_column = 'id'			// cột quan hệ của main
//istr_dwo_related[8].s_related_obj_dwo = 'd_sal_invoice_line_grid'	// datawindow quan hệ đến
//istr_dwo_related[8].s_related_obj_column = 'id'			// cột quan hệ đến
//istr_dwo_related[8].b_f_matching = true
//istr_dwo_related[8].b_copy_tax = true
//istr_dwo_related[8].s_relatedtext_column = 'code'					
//istr_dwo_related[8].s_text = 'Nhân bản từ hóa đơn bán:'
//
//istr_dwo_related[8].s_main_obj_dwo_copy[1] = 'd_document_ar_grid' // datawindow copy từ
//istr_dwo_related[8].s_main_obj_column_copy[1] =  'handled_by;trans_hdr_id;ship_to_object_code;object_name;trans_desc;group_name;req_appr_note;appr_note;doc_type;roster_yn;'
//istr_dwo_related[8].s_related_obj_dwo_copy[1] = 'd_document_ar_grid' // datawindow copy đến
//istr_dwo_related[8].s_related_obj_column_copy[1] = 'handled_by;trans_hdr_id;ship_to_object_code;object_name;trans_desc;group_name;req_appr_note;appr_note;doc_type;roster_yn;'
//istr_dwo_related[8].s_match_f_dwo[1] = 'd_document_ar_grid'
//istr_dwo_related[8].s_match_t_dwo[1] = 'd_document_ar_grid'
//
//istr_dwo_related[8].s_main_obj_dwo_copy[2] = 'd_sal_invoice_line_grid' // datawindow copy từ
//istr_dwo_related[8].s_main_obj_column_copy[2] ='line_no;object_type;object_id;object_code;line_text;warehouse_id;warehouse_code;spec_id;TRANS_UOM;uom_code;qty;price;amount;' // cột copy từ
//istr_dwo_related[8].s_main_obj_column_copy[2]+='tax_type;tax_pct;tax_amt;tax_correction;act_qty;base_amount;act_price;comm_pct;comm_amt;markup_pct;markup_return;markup_amt;act_amount;'
//istr_dwo_related[8].s_main_obj_column_copy[2]+='act_base_amount;sales_person;sales_name;disc_pct;disc_amt;warehouse_name;spec_code;spec_name;foc_yn;not_invoice;subaccount_code;note;amount_ex_tax;'
//istr_dwo_related[8].s_related_obj_dwo_copy[2] = 'd_sal_invoice_line_grid' // datawindow copy đến
//istr_dwo_related[8].s_related_obj_column_copy[2] = 'line_no;object_type;object_id;object_code;line_text;warehouse_id;warehouse_code;spec_id;TRANS_UOM;uom_code;qty;price;amount;'  // cột copy đến
//istr_dwo_related[8].s_related_obj_column_copy[2]+='tax_type;tax_pct;tax_amt;tax_correction;act_qty;base_amount;act_price;comm_pct;comm_amt;markup_pct;markup_return;markup_amt;act_amount;'
//istr_dwo_related[8].s_related_obj_column_copy[2]+='act_base_amount;sales_person;sales_name;disc_pct;disc_amt;warehouse_name;spec_code;spec_name;foc_yn;not_invoice;subaccount_code;note;amount_ex_tax;'
//
////chi tiet
//istr_dwo_related[8].s_main_obj_dwo_copy[3] = 'd_invoice_sal_form' // datawindow copy từ
//istr_dwo_related[8].s_main_obj_column_copy[3] ='invoice_object;payment_term;payment_method;dr_cr_object;currency_id;company_id;cus_tax_num;invoice_object_code;invoice_object_name;invoice_address;dr_cr_object_code;dr_cr_object_name;'
//istr_dwo_related[8].s_main_obj_column_copy[3]+='payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;exchange_rate;version_no;invoice_request;'
//istr_dwo_related[8].s_main_obj_column_copy[3]+='include_tax_yn;invoice_yn;quantity_yn;value_yn;due_date;invoice_received_date;trans_address;description;buyer_person;note;'
//istr_dwo_related[8].s_related_obj_dwo_copy[3] = 'd_invoice_sal_form' // datawindow copy đến
//istr_dwo_related[8].s_related_obj_column_copy[3]='invoice_object;payment_term;payment_method;dr_cr_object;currency_id;company_id;cus_tax_num;invoice_object_code;invoice_object_name;invoice_address;dr_cr_object_code;dr_cr_object_name;'
//istr_dwo_related[8].s_related_obj_column_copy[3]+='payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;exchange_rate;version_no;invoice_request;'
//istr_dwo_related[8].s_related_obj_column_copy[3]+='include_tax_yn;invoice_yn;quantity_yn;value_yn;due_date;invoice_received_date;trans_address;description;buyer_person;note;'
//
//istr_dwo_related[8].s_main_obj_dwo_copy[4] = 'd_tax_line_grid' // datawindow copy từ
//istr_dwo_related[8].s_main_obj_column_copy[4] = 'line_no;object_code;object_name;tax_id;tax_type;tax_pct;tax_amt;tax_correction;uom_code;TRANS_CURRENCY;exchange_rate;uprow_yn;include_yn'
//istr_dwo_related[8].s_related_obj_dwo_copy[4] = 'd_tax_line_grid' // datawindow copy đến
//istr_dwo_related[8].s_related_obj_column_copy[4] = 'line_no;object_code;object_name;tax_id;tax_type;tax_pct;tax_amt;tax_correction;uom_code;TRANS_CURRENCY;exchange_rate;uprow_yn;include_yn'
//
//////chi phi
//istr_dwo_related[8].s_main_obj_dwo_copy[5] = 'd_charge_line_grid' // datawindow copy từ
//istr_dwo_related[8].s_main_obj_column_copy[5] ='line_no;object_code;object_name;charge_pct;charge_amt;uom_code;exchange_rate' // cột copy từ
//istr_dwo_related[8].s_related_obj_dwo_copy[5] = 'd_charge_line_grid' // datawindow copy đến
//istr_dwo_related[8].s_related_obj_column_copy[5] = 'line_no;object_code;object_name;charge_pct;charge_amt;uom_code;exchange_rate'   // cột copy đến
//
//istr_dwo_related[8].s_main_obj_column_chk[5] = ''
//istr_dwo_related[8].s_related_obj_column_chk[5] = ''
//istr_dwo_related[8].s_match_f_dwo[5] = ''
//istr_dwo_related[8].s_match_t_dwo[5] = ''
//istr_dwo_related[8].s_match_f_column[5] = ''
//istr_dwo_related[8].s_match_t_column[5] = ''
//istr_dwo_related[8].s_match_column[5] = ''
//istr_dwo_related[8].s_main_obj_column_sum[5] = ''
//istr_dwo_related[8].s_related_obj_column_sum[5] = ''
//istr_dwo_related[8].s_f_obj_column_chk[5] = ''
//istr_dwo_related[8].s_t_obj_column_chk[5] = ''
//istr_dwo_related[8].b_f_sum[5] = false
//
//istr_dwo_related[9].s_related_obj_name = 'u_bank_voucher'					// đối tượng liên quan
//istr_dwo_related[9].s_main_obj_dwo = 'd_document_ar_grid'		//datawindow quan hệ main
//istr_dwo_related[9].s_main_obj_column = 'id'			// cột quan hệ của main
//istr_dwo_related[9].s_related_obj_dwo = 'd_document_ar_grid'	// datawindow quan hệ đến
//istr_dwo_related[9].s_related_obj_column = 'id'			// cột quan hệ đến
//istr_dwo_related[9].b_f_matching = true
//istr_dwo_related[9].s_relatedtext_column = 'doc_code'					
//istr_dwo_related[9].s_text = 'Sổ phụ ngân hàng từ:'
//
//istr_dwo_related[9].s_main_obj_dwo_copy[1] = 'd_post_line_invoice_grid' // datawindow copy từ
//istr_dwo_related[9].s_related_obj_dwo_copy[1] = 'd_payment_line_grid' // datawindow copy đến
//istr_dwo_related[9].s_main_obj_column_copy[1] ='DR_OBJECT_ID;trans_amt;base_amt' // cột copy từ
//istr_dwo_related[9].s_related_obj_column_copy[1] = 'OBJECT_ID;amount;base_amount'  // cột copy đến
//istr_dwo_related[9].s_main_dr_cr_obj_dwo_sum[1]='d_invoice_sal_form' //dw chứa đối tượng công nợ
//istr_dwo_related[9].s_main_dr_cr_obj_column_sum[1]='dr_cr_object' // cột chứa đối tượng công nợ
//istr_dwo_related[9].s_main_obj_column_sum[1] = 'trans_amt;base_amt' // cột cộng tổng
//istr_dwo_related[9].s_f_obj_column_chk[1] = 'DR_OBJECT_ID'
//istr_dwo_related[9].s_t_obj_column_chk[1] = 'OBJECT_ID'
//istr_dwo_related[9].s_main_obj_column_chk[1] = ''
//istr_dwo_related[9].s_related_obj_column_chk[1] = ''
//istr_dwo_related[9].b_f_sum[1] = true
//istr_dwo_related[9].b_copy_line[1] = true
//istr_dwo_related[9].s_match_f_dwo[1] = 'd_post_line_invoice_grid'
//istr_dwo_related[9].s_match_t_dwo[1] = 'd_payment_line_grid'
//istr_dwo_related[9].s_match_f_column[1] = 'trans_amt;base_amt'
//istr_dwo_related[9].s_match_t_column[1] = 'amount;base_amount'
//istr_dwo_related[9].s_match_column[1] = 'trans_value;base_value'
//
//istr_dwo_related[9].s_main_obj_dwo_copy[2] = 'd_post_line_tax_grid' // datawindow copy từ
//istr_dwo_related[9].s_related_obj_dwo_copy[2] = 'd_payment_line_grid' // datawindow copy đến
//istr_dwo_related[9].s_main_obj_column_copy[2] ='DR_OBJECT_ID;trans_amt;base_amt' // cột copy từ
//istr_dwo_related[9].s_related_obj_column_copy[2] = 'OBJECT_ID;amount;base_amount'
//istr_dwo_related[9].s_main_dr_cr_obj_dwo_sum[2]='d_invoice_sal_form' //dw chứa đối tượng công nợ
//istr_dwo_related[9].s_main_dr_cr_obj_column_sum[2]='dr_cr_object' // cột chứa đối tượng công nợ
//istr_dwo_related[9].s_main_obj_column_sum[2] = 'trans_amt;base_amt' // cột cộng tổng
//istr_dwo_related[9].s_f_obj_column_chk[2] = 'DR_OBJECT_ID'
//istr_dwo_related[9].s_t_obj_column_chk[2] = 'OBJECT_ID'
//istr_dwo_related[9].s_main_obj_column_chk[2] = ''
//istr_dwo_related[9].s_related_obj_column_chk[2] = ''
//istr_dwo_related[9].b_f_sum[2] = true
//istr_dwo_related[9].b_copy_line[2] = true
//istr_dwo_related[9].s_match_f_dwo[2] = 'd_post_line_tax_grid'
//istr_dwo_related[9].s_match_t_dwo[2] = 'd_payment_line_grid'
//istr_dwo_related[9].s_match_f_column[2] = 'trans_amt;base_amt'
//istr_dwo_related[9].s_match_t_column[2] = 'amount;base_amount'
//istr_dwo_related[9].s_match_column[2] = 'trans_value;base_value'
//
//istr_dwo_related[9].s_main_obj_dwo_copy[3] = 'd_invoice_sal_form' // datawindow copy từ
//istr_dwo_related[9].s_main_obj_column_copy[3] ='dr_cr_object_type;dr_cr_object_code;dr_cr_object_name' // cột copy từ
//istr_dwo_related[9].s_related_obj_dwo_copy[3] = 'd_payment_line_grid' // datawindow copy đến
//istr_dwo_related[9].s_related_obj_column_copy[3] = 'object_type;object_code;object_name'  // cột copy đến
//istr_dwo_related[9].s_main_obj_column_chk[3] = 'dr_cr_object'
//istr_dwo_related[9].s_related_obj_column_chk[3] = 'OBJECT_ID'
//
//istr_dwo_related[9].s_main_obj_dwo_copy[4] = 'd_invoice_sal_form' // datawindow copy từ
//istr_dwo_related[9].s_main_obj_column_copy[4] ='currency_id;uom_code;exchange_rate;dr_cr_object' // cột copy từ
//istr_dwo_related[9].s_related_obj_dwo_copy[4] = 'd_bank_voucher_form' // datawindow copy đến
//istr_dwo_related[9].s_related_obj_column_copy[4] = 'currency_id;uom_code;exchange_rate;invoice_object'  // cột copy đến
//istr_dwo_related[9].s_main_obj_column_chk[4] = ''
//istr_dwo_related[9].s_related_obj_column_chk[4] = ''
//istr_dwo_related[9].s_match_f_dwo[4] = ''
//istr_dwo_related[9].s_match_t_dwo[4] = ''
//istr_dwo_related[9].s_match_f_column[4] = ''
//istr_dwo_related[9].s_match_t_column[4] = ''
//istr_dwo_related[9].s_match_column[4] = ''
//istr_dwo_related[9].s_main_obj_column_sum[4] = ''
//istr_dwo_related[9].s_related_obj_column_sum[4] = ''
//istr_dwo_related[9].s_f_obj_column_chk[4] = ''
//istr_dwo_related[9].s_t_obj_column_chk[4] = ''
//istr_dwo_related[9].b_f_sum[4] = false
//istr_dwo_related[9].b_copy_line[4] = false
//
//istr_dwo_related[10].s_related_obj_name = 'u_map_invoice'
//istr_dwo_related[10].s_main_obj_dwo = 'd_invoice_sal_form'
//istr_dwo_related[10].s_main_obj_column = 'invoice_object'
//istr_dwo_related[10].s_related_obj_dwo = 'd_address_map_form'
//istr_dwo_related[10].s_related_obj_column = 'object_id'
//
//istr_dwo_related[11].s_related_obj_name = 'u_map_delivery'
//istr_dwo_related[11].s_main_obj_dwo = 'd_invoice_sal_form'
//istr_dwo_related[11].s_main_obj_column = 'dr_cr_object'
//istr_dwo_related[11].s_related_obj_dwo = 'd_address_map_form'
//istr_dwo_related[11].s_related_obj_column = 'object_id'
//
//istr_dwo_related[12].s_related_obj_name = 'u_sal_invoice_return'					// đối tượng liên quan
//istr_dwo_related[12].s_main_obj_dwo = 'd_document_ar_grid'		//datawindow quan hệ main
//istr_dwo_related[12].s_main_obj_column = 'id'			// cột quan hệ của main
//istr_dwo_related[12].s_related_obj_dwo = 'd_document_ar_grid'	// datawindow quan hệ đến
//istr_dwo_related[12].s_related_obj_column = 'id'			// cột quan hệ đến
//istr_dwo_related[12].b_f_matching = true
//istr_dwo_related[12].s_relatedtext_column = 'code'					
//istr_dwo_related[12].s_text = 'Hóa đơn bán:'
//
//istr_dwo_related[12].s_main_obj_dwo_copy[1] = 'd_sal_invoice_line_grid' // datawindow copy từ
//istr_dwo_related[12].s_main_obj_column_copy[1] ='line_no;object_type;object_id;object_code;line_text;warehouse_id;warehouse_code;spec_id;TRANS_UOM;uom_code;qty;price;amount;' // cột copy từ
//istr_dwo_related[12].s_main_obj_column_copy[1]+='tax_type;tax_pct;tax_amt;tax_correction;act_qty;base_amount;act_price;comm_pct;comm_amt;markup_pct;markup_return;markup_amt;act_amount;'
//istr_dwo_related[12].s_main_obj_column_copy[1]+='act_base_amount;sales_person;sales_name;disc_pct;disc_amt;warehouse_name;spec_code;spec_name;foc_yn;not_invoice;subaccount_code;note;cogs'
//istr_dwo_related[12].s_related_obj_dwo_copy[1] = 'd_sal_invoice_line_grid' // datawindow copy đến
//istr_dwo_related[12].s_related_obj_column_copy[1] = 'line_no;object_type;object_id;object_code;line_text;warehouse_id;warehouse_code;spec_id;TRANS_UOM;uom_code;qty;price;amount;'  // cột copy đến
//istr_dwo_related[12].s_related_obj_column_copy[1]+='tax_type;tax_pct;tax_amt;tax_correction;act_qty;base_amount;act_price;comm_pct;comm_amt;markup_pct;markup_return;markup_amt;act_amount;'
//istr_dwo_related[12].s_related_obj_column_copy[1]+='act_base_amount;sales_person;sales_name;disc_pct;disc_amt;warehouse_name;spec_code;spec_name;foc_yn;not_invoice;subaccount_code;note;cogs'
//istr_dwo_related[12].s_main_obj_column_chk[1] = ''
//istr_dwo_related[12].s_related_obj_column_chk[1] = ''
//istr_dwo_related[12].s_f_obj_column_chk[1] = 'object_id'
//istr_dwo_related[12].s_t_obj_column_chk[1] = 'object_id'
//istr_dwo_related[12].b_copy_line[1] = true
//istr_dwo_related[12].s_match_f_dwo[1] = 'd_sal_invoice_line_grid'
////istr_dwo_related[12].s_match_f_col_obj[1] = 'object_id' -- đóng lại vì cho phép hóa đơn kết với đơn hàng dịch vụ
//istr_dwo_related[12].s_match_t_dwo[1] = 'd_sal_invoice_line_grid'
//istr_dwo_related[12].s_match_f_column[1] = 'act_qty'
//istr_dwo_related[12].s_match_t_column[1] = 'act_qty'
//istr_dwo_related[12].s_match_column[1] = 'qty'
//// khai báo struct lấy giá bán
//istr_dwo_related[12].b_get_price=true
//istr_dwo_related[12].s_dwo_get_price='d_sal_invoice_line_grid'
//istr_dwo_related[12].s_col_get_price[1]='cogs'
//istr_dwo_related[12].s_col_get_price[2]='price'
//istr_dwo_related[12].s_col_get_qty[1]='qty'
//istr_dwo_related[12].s_col_get_qty[2]='' 
//istr_dwo_related[12].s_dwo_set_price='d_sal_invoice_line_grid'
//istr_dwo_related[12].s_col_set_price[1]='cogs'
//istr_dwo_related[12].s_col_set_price[2]='price'
//istr_dwo_related[12].s_col_set_qty[1]='qty'
//istr_dwo_related[12].s_col_set_qty[2]=''
//
////chi tiet
//istr_dwo_related[12].s_main_obj_dwo_copy[2] = 'd_invoice_sal_form' // datawindow copy từ
//istr_dwo_related[12].s_main_obj_column_copy[2] ='invoice_object;payment_term;payment_method;dr_cr_object;currency_id;company_id;cus_tax_num;invoice_object_code;invoice_object_name;invoice_address;dr_cr_object_code;dr_cr_object_name;'
//istr_dwo_related[12].s_main_obj_column_copy[2]+='payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;exchange_rate;version_no;'
//istr_dwo_related[12].s_main_obj_column_copy[2]+='include_tax_yn;invoice_yn;quantity_yn;value_yn;due_date;invoice_received_date;trans_address;description'
//istr_dwo_related[12].s_related_obj_dwo_copy[2] = 'd_invoice_sal_form' // datawindow copy đến
//istr_dwo_related[12].s_related_obj_column_copy[2]='invoice_object;payment_term;payment_method;dr_cr_object;currency_id;company_id;cus_tax_num;invoice_object_code;invoice_object_name;invoice_address;dr_cr_object_code;dr_cr_object_name;'
//istr_dwo_related[12].s_related_obj_column_copy[2]+='payment_term_code;payment_term_name;payment_method_code;payment_method_name;uom_code;exchange_rate;version_no;'
//istr_dwo_related[12].s_related_obj_column_copy[2]+='include_tax_yn;invoice_yn;quantity_yn;value_yn;due_date;invoice_received_date;trans_address;description'
//
//istr_dwo_related[12].s_main_obj_column_chk[2] = ''
//istr_dwo_related[12].s_related_obj_column_chk[2] = ''
//istr_dwo_related[12].s_match_f_dwo[2] = ''
//istr_dwo_related[12].s_match_t_dwo[2] =''
//istr_dwo_related[12].s_match_column[2] = ''
//istr_dwo_related[12].s_match_f_column[2] = ''
//istr_dwo_related[12].s_match_t_column[2] = ''
//istr_dwo_related[12].s_main_obj_column_sum[2] = ''
//istr_dwo_related[12].s_related_obj_column_sum[2] = ''
//istr_dwo_related[12].s_f_obj_column_chk[2] = ''
//istr_dwo_related[12].s_t_obj_column_chk[2] = ''
//istr_dwo_related[12].b_f_sum[2] = false
//istr_dwo_related[12].b_copy_line[2] = false
//
//istr_dwo_related[13].s_related_obj_name = 'u_goods_transfer'					// đối tượng quan hệ đến
//istr_dwo_related[13].s_main_obj_dwo = 'd_document_ar_grid'		//datawindow quan hệ main
//istr_dwo_related[13].s_main_obj_column = 'id'			// cột quan hệ của main
//istr_dwo_related[13].s_related_obj_dwo = 'd_document_inventory_grid'	// datawindow quan hệ đến
//istr_dwo_related[13].s_related_obj_column = 'id'			// cột quan hệ đến
//istr_dwo_related[13].b_t_matching = true
//istr_dwo_related[13].s_relatedtext_column = 'doc_code'					
//istr_dwo_related[13].s_text = 'Hóa đơn bán từ: '
//istr_dwo_related[13].s_match_f_dwo[1] = 'd_inventory_line_transfer_grid'
//istr_dwo_related[13].s_match_t_dwo[1] = 'd_sal_invoice_line_grid' 
//istr_dwo_related[13].s_match_rf_dwo[1] = ''
//istr_dwo_related[13].s_match_f_column[1] = 'qty'
//istr_dwo_related[13].s_match_t_column[1] = 'act_qty'
//istr_dwo_related[13].s_match_column[1] = 'qty'
//
//istr_dwo_related[14].s_related_obj_name = 'b_view'					// đối tượng liên quan
//istr_dwo_related[14].s_main_obj_dwo = 'd_document_ar_grid'		//datawindow quan hệ main
//istr_dwo_related[14].s_main_obj_column = 'id'			// cột quan hệ của main
//istr_dwo_related[14].s_related_obj_dwo = 'dv_invoice_goods_delivery_form'	// datawindow quan hệ đến
//istr_dwo_related[14].s_related_obj_column = 'id'			// cột quan hệ đến
//istr_dwo_related[14].s_relatedtext_column = 'code'					
//istr_dwo_related[14].s_text = 'In phiếu xuất kho ' 
//
//
end subroutine

public subroutine f_set_str_streamvalue ();istr_streamvalue[1].s_f_obj_dwo = 'd_sal_invoice_line_grid'
istr_streamvalue[1].s_f_obj_column ='warehouse_id' 
istr_streamvalue[1].s_f_column_sv = 'F_OBJECT_ID'

istr_streamvalue[1].s_t_obj_dwo = 'd_invoice_sal_form' 
istr_streamvalue[1].s_t_obj_column ='dr_cr_object'
istr_streamvalue[1].s_t_column_sv = 'T_OBJECT_ID'

istr_streamvalue[1].s_item_dwo = 'd_sal_invoice_line_grid'
istr_streamvalue[1].s_item_column = 'object_id;spec_id;act_qty;trans_uom;loc_id'
istr_streamvalue[1].s_item_column_sv = 'item_id;spec_id;qty;uom_id;loc_id'

istr_streamvalue[1].s_currency_dwo = 'd_invoice_sal_form'
istr_streamvalue[1].s_currency_column = 'currency_id;exchange_rate'
istr_streamvalue[1].s_currency_column_sv = 'trans_cur_id;exchange_rate'

istr_streamvalue[1].s_value_dwo = 'd_sal_invoice_line_grid'
istr_streamvalue[1].s_value_column = 'object_id;cogs;cogs;spec_id;act_qty_sku'
istr_streamvalue[1].s_value_column_sv = 'item_id;trans_value;base_value;spec_id;qty'
end subroutine

public function integer f_reset_fixedpart_grid ();this.iw_display.dynamic f_reset_ii_fixedpart2_height_grid()
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_resize_fixedpart_form ();
this.iw_display.dynamic f_reset_ii_fixedpart2_height_form()
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_resize_fixedpart_grid ();
//this.iw_display.dynamic f_reset_ii_fixedpart2_height_grid(0)
//this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_insert_matching_tax_settle (ref t_ds_db rds_matching, double vdb_f_ref_id, double vdb_t_ref_id, datetime vdt_match_date, double vdb_doc_f_id, double vdb_doc_t_id, double vdb_value, string vs_type, t_ds_db rds_tax_line);datetime		ldt_sysdate
double		ldb_ID
long			ll_row
int 			li_idx,li_rtn

ll_row = rds_matching.event e_addrow( )
if ll_row = -1 then return -1
//ldb_ID = this.f_create_id( )
//if ldb_ID = -1 then return -1
if upper(vs_type) = 'VALUES' then
	ldb_ID = this.f_create_id( )
	li_rtn = rds_matching.setitem(ll_row,'ID',ldb_ID)
	li_rtn = rds_matching.setitem(ll_row,'MATCH_TYPE','TAX_SETTLE')
	li_rtn = rds_matching.setitem(ll_row,'MATCHING_DATE',vdt_match_date)
	li_rtn = rds_matching.setitem(ll_row,'F_DOC_ID',vdb_doc_f_id)
	li_rtn = rds_matching.setitem(ll_row,'T_DOC_ID',vdb_doc_t_id)
	li_rtn = rds_matching.setitem(ll_row,'F_BRANCH_ID',gdb_branch)
	li_rtn = rds_matching.setitem(ll_row,'T_BRANCH_ID',gdb_branch)
	li_rtn = rds_matching.setitem(ll_row,'F_REF_ID',vdb_f_ref_id)
	li_rtn = rds_matching.setitem(ll_row,'F_REF_TABLE','OBJECT_TRANS')
	li_rtn = rds_matching.setitem(ll_row,'T_REF_ID',vdb_t_ref_id)
	li_rtn = rds_matching.setitem(ll_row,'T_REF_TABLE','OBJECT_TRANS')
	li_rtn = rds_matching.setitem(ll_row,'base_value',vdb_value)
end if
if upper(vs_type) = 'TAX' then
	rds_tax_line.setfilter("doc_id = " + string(vdb_doc_f_id))
	rds_tax_line.filter()
	for li_idx = 1 to rds_tax_line.rowcount()
		ldb_ID = this.f_create_id( )
		li_rtn = rds_matching.setitem(ll_row,'ID',ldb_ID)
		vdb_f_ref_id = rds_tax_line.getitemnumber(li_idx,'id')
		vdb_t_ref_id = rds_tax_line.getitemnumber(li_idx,'id')
		li_rtn = rds_matching.setitem(ll_row,'MATCH_TYPE','TAX_SETTLE')
		li_rtn = rds_matching.setitem(ll_row,'MATCHING_DATE',vdt_match_date)
		li_rtn = rds_matching.setitem(ll_row,'F_DOC_ID',vdb_doc_f_id)
		li_rtn = rds_matching.setitem(ll_row,'T_DOC_ID',vdb_doc_t_id)
		li_rtn = rds_matching.setitem(ll_row,'F_BRANCH_ID',gdb_branch)
		li_rtn = rds_matching.setitem(ll_row,'T_BRANCH_ID',gdb_branch)
		
		li_rtn = rds_matching.setitem(ll_row,'F_REF_ID',vdb_f_ref_id)
		li_rtn = rds_matching.setitem(ll_row,'F_REF_TABLE','TAX_LINE')
		li_rtn = rds_matching.setitem(ll_row,'T_REF_ID',vdb_t_ref_id)
		li_rtn = rds_matching.setitem(ll_row,'T_REF_TABLE','TAX_LINE')
		li_rtn = rds_matching.setitem(ll_row,'base_value',vdb_value)
	next
	rds_tax_line.setfilter("")
	rds_tax_line.filter()
end if

return li_rtn

end function

on c_tax_settle.create
call super::create
end on

on c_tax_settle.destroy
call super::destroy
end on

event e_action_ctrl_bttn;datawindow				ldw_focus
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
							istr_actionpane[li_idx].s_visible_buttons = ''																		   
						else
							istr_actionpane[li_idx].s_visible_buttons = ''
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = ''													   
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_view_multi;b_process;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons= ''											          
					else
						istr_actionpane[li_idx].s_visible_buttons= 'b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_view_multi;b_process;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =   'b_goods_delivery;b_so;b_sal_invoice_replace;b_sal_invoice_return;b_receipt;b_bank_voucher;'
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

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = false
is_display_model = '2dgb_1tp_tax'
ib_display_text = false
is_object_title = 'Tờ khai thuế GTGT'
is_exrate_type = 'buy'
istr_actionpane[1].s_button_name = 'b_add_multi;b_copyt_multi;b_join_multi;b_insert;b_modify;b_save; b_saveclose;b_delete;b_view_multi;b_post;b_unpost;b_process;b_send_2_approve;b_request_2_change;b_total;b_approve;b_reject;b_account_view;b_cancel;b_importfile;'
istr_actionpane[1].s_button_has_sub = 'b_add_multi;b_copyt_multi;b_join_multi;b_view_multi;'
istr_actionpane[1].sa_sub_button[1]='b_add;b_copyf_so;b_copyf_goods_delivery;b_copyf_goods_transfer;b_copyt_seft;'
istr_actionpane[1].sa_sub_button[2]='b_copyt_goods_delivery;b_copyt_sal_invoice_replace;b_copyt_bank_voucher;b_copyt_receipt;b_copyt_sal_invoice_return;'
istr_actionpane[1].sa_sub_button[3]='b_copyl_so;b_copyl_goods_delivery;b_copyl_goods_transfer;'
istr_actionpane[1].sa_sub_button[4]='b_view_sal_invoice;b_view_invoice_goods_delivery;'

istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_description = is_object_title

this.is_m_popup = 'm_spec_identified_cogs'


end event

event e_window_open;call super::e_window_open;t_dw_mpl			ldw_main
b_obj_instantiate		lobj_ins
any				laa_value[],laa_null[]
string				ls_int_string

//--form parm--//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '=TAX_SETTLE'
ldw_main.f_add_where('doc_type;',laa_value[])
//iw_display.f_set_text_cbx_1( 'Xem tất cả các thuế', false)
//
//if ids_tax_authority.rowcount() = 0 then
//	laa_value[1] = '>0'
//	
//	ls_int_string = 'object_ref_id;'
//	if  lobj_ins.f_is_branch_yn('u_tax_authority')  then
//		laa_value[2] = gdb_branch
//		ls_int_string = 'object_ref_id;branch_id;'
//	end if				
//	
//	this.f_init_object_table(ids_tax_authority, 'd_tax_authority_form', ls_int_string, laa_value[],laa_null[])
//end if
//if ids_currency.rowcount( ) = 0 then
//	laa_value[1] = '=Y'
//	this.f_init_object_table(ids_currency, 'd_currency_grid', 'base_yn',laa_value, laa_null[])
//end if

return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;iw_display. f_set_ii_fixedpart2_height(150)  //booked_slip//
iw_display. f_set_ii_upperpart_height(iw_display.ii_resize_height*(9/20))  //doc+booked_slip//
return 0
end event

event e_dw_e_postinsertrow;t_dw_mpl	ladw_detail[],ldw_detail
c_datetime	lc_dt
datetime	ldt_sysdate
string		ls_update_table
long		ll_row
int			li_idx,li_rtn

if rpo_dw.dataobject = istr_dwo[1].s_dwo_default then
	rpo_dw.setitem(vl_currentrow,'doc_type','TAX_SETTLE')
	rpo_dw.setitem(vl_currentrow,'status','new')
	rpo_dw.setitem(vl_currentrow,'document_date',date(gd_session_date))
	li_rtn = rpo_dw.dynamic f_getdwdetails(ladw_detail)
	for li_idx = 1 to li_rtn
		ls_update_table = upper(ladw_detail[li_idx].describe( "DataWindow.Table.UpdateTable"))
		if ls_update_table = 'BOOKED_SLIP' then
			ll_row = ladw_detail[li_idx].dynamic event e_addrow()
			if ll_row > 0 then
				ldw_detail = ladw_detail[li_idx]
				ldw_detail.setitem( ll_row, 'version_no', 1)
				ldt_sysdate = lc_dt.f_getsysdate( )
				if ls_update_table = 'BOOKED_SLIP' then ldw_detail.setitem( ll_row,'TRANS_DATE',date(ldt_sysdate))
			end if
		end if
	next
elseif rpo_dw.dataobject = istr_dwo[2].s_dwo_default then
	rpo_dw.setitem(vl_currentrow,'doc_type','TAX_SETTLE')
end if

return vl_currentrow
end event

