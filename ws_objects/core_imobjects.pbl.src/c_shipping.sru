$PBExportHeader$c_shipping.sru
forward
global type c_shipping from b_doc
end type
end forward

global type c_shipping from b_doc
event type integer e_action_shipping ( )
end type
global c_shipping c_shipping

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_related ()
public subroutine f_set_str_unit ()
public function integer f_resize_fixedpart_grid ()
public function integer f_resize_fixedpart_form ()
public function integer f_reset_fixedpart_grid ()
public function double f_get_pr_doc_id (string vs_t_ref_table, double vdb_t_doc_id)
end prototypes

event type integer e_action_shipping();long			ll_found
string			ls_cust_name, ls_dist_name, ls_find_string
double		ldb_rtn, ldb_doc_version_id, ldb_doc_id, ldb_t_doc_id
any			laa_value[]
s_str_dwo_related		lstr_related[], lstr_data_related[]
t_dw_mpl				ldw_main, ldw_line
s_object_display 		lpo_related
t_ds_db					lads_copied[]
b_obj_instantiate		lbo_ins

connect using it_transaction;

ldw_main = iw_display.f_get_dwmain( )
ll_found = ldw_main.find("gutter ='Y' ",1 , ldw_main.rowcount())
if ll_found > 0 then
	//-- check cùng customer--//
	ls_cust_name = ldw_main.getitemstring(ll_found, 'bill_to_short_name')
//	ls_dist_name = ldw_main.getitemstring(ll_found, 'dist_short_name')
	ls_find_string = " gutter ='Y' "
	if isnull(ls_cust_name) then
		ls_find_string += "AND bill_to_short_name > ''"
	else
		ls_find_string += "AND bill_to_short_name <> '"+ls_cust_name+"'"
	end if

	ll_found = ldw_main.find(ls_find_string, ll_found + 1 , ldw_main.rowcount()+1)
	if ll_found > 0 then
		disconnect using it_transaction;
		gf_messagebox('m.c_goods_receiving.e_action_shipping.01','Thông báo','SO không cùng khách hàng','stop','ok',1)
		return -1
	end if
end if

//get data de build where related
this.f_get_data_related('u_goods_delivery', lstr_data_related[]) 
//build where related
iw_display.f_build_data_related( lstr_data_related[])  

this.dynamic f_get_dwo_related(lstr_related) 
if iw_display.dynamic f_get_data_copied_ex( lads_copied[],lstr_related,'copyt','u_goods_delivery') > 0 then
	lpo_related = create using 'u_goods_delivery'
	ldb_t_doc_id = lbo_ins.f_copy_to_goods_delivery( lstr_data_related[], lads_copied[], it_transaction ,lpo_related.idwsetup_initial )			
	if ldb_t_doc_id > 0 then
		lpo_related.f_set_main_id(ldb_rtn )
		iw_display.event e_change_object_appeon( lpo_related)			
		//-- update SO status--//
		lbo_ins.f_upd_related_status( ldb_t_doc_id, 'new', 'INVENTORY_LINE' , it_transaction) 

		ldw_main.settransobject(it_transaction )
		ldw_main.event e_refresh( )
	else
		destroy lpo_related
	end if
end if
disconnect using it_transaction;
return 1			
end event

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_document_so_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_document_so_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_details = 'd_so_line_shipping_grid' 
istr_dwo[1].b_ref_table_yn  = false
istr_dwo[1].s_ref_table_field = ''
//istr_dwo[1].b_relation_1_1 = true
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = false
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = false
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_gb_name = 'gb_6'
istr_dwo[1].s_description = 'Đơn bán hàng (SO)'


istr_dwo[2].s_dwo_default =  'd_so_line_shipping_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_so_line_shipping_grid'
istr_dwo[2].b_master = false
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_details = ''
istr_dwo[2].s_dwo_master = 'd_document_so_grid;'
istr_dwo[2].s_master_keycol = 'VERSION_ID;'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[2].b_ref_table_yn  = false
istr_dwo[2].s_ref_table_field = ''
istr_dwo[2].b_relation_1_1 = false
istr_dwo[2].b_insert = false
istr_dwo[2].b_update = false
istr_dwo[2].b_delete = false
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = false
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].b_focus_master = true
istr_dwo[2].s_description = 'Chi tiết bán hàng'

/*
istr_dwo[3].s_dwo_default =  'd_po_line_grid'
istr_dwo[3].s_dwo_form = 'd_po_line_form'
istr_dwo[3].s_dwo_grid = 'd_po_line_grid'
istr_dwo[3].b_detail = true
istr_dwo[3].b_master = true
istr_dwo[3].b_cascade_del = true
istr_dwo[3].s_dwo_master = 'd_order_form;'
istr_dwo[3].s_dwo_details = 'd_order_catch_grid;d_tax_line_grid;'
istr_dwo[3].s_master_keycol = 'ID;'
istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[3].b_ref_table_yn  = false
istr_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[3].b_insert = true
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = true
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_excel = true
istr_dwo[3].b_traceable = true
istr_dwo[3].b_focus_master = false
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].s_gb_name = 'gb_7'
istr_dwo[3].s_description = 'Chi tiết đặt mua'

istr_dwo[4].s_dwo_default =  'd_tax_line_grid'
istr_dwo[4].s_dwo_form = ''
istr_dwo[4].s_dwo_grid = 'd_tax_line_grid'
istr_dwo[4].b_detail = true
istr_dwo[4].s_dwo_master = 'd_po_line_grid;'
istr_dwo[4].s_dwo_details = ''
istr_dwo[4].s_master_keycol = 'ID;'
istr_dwo[4].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[4].b_ref_table_yn  = false
istr_dwo[4].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[4].b_relation_1_1 = true
istr_dwo[4].b_insert = false
istr_dwo[4].b_update = true
istr_dwo[4].b_delete = false
istr_dwo[4].b_query = true
istr_dwo[4].b_print = true
istr_dwo[4].b_excel = true
istr_dwo[4].b_traceable = true
istr_dwo[4].b_keyboardlocked = true
istr_dwo[4].s_gb_name = 'gb_8'
istr_dwo[4].s_description = 'Thuế'

istr_dwo[5].s_dwo_default =  'd_order_catch_grid'
istr_dwo[5].s_dwo_form = ''
istr_dwo[5].s_dwo_grid = 'd_order_catch_grid'
istr_dwo[5].b_detail = true
istr_dwo[5].s_dwo_master = 'd_po_line_grid;'
istr_dwo[5].s_master_keycol = 'ID;'
istr_dwo[5].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[5].b_ref_table_yn  = false
istr_dwo[5].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[5].b_insert = true
istr_dwo[5].b_update = true
istr_dwo[5].b_delete = true
istr_dwo[5].b_query = true
istr_dwo[5].b_print = true
istr_dwo[5].b_excel = true
istr_dwo[5].b_traceable = true
istr_dwo[5].b_focus_master = false 
istr_dwo[5].b_keyboardlocked = true
istr_dwo[5].s_gb_name = 'gb_9'
istr_dwo[5].s_description = 'Chi tiết kiểm đếm'
*/
end subroutine

public subroutine f_set_dwo_related ();
// Đối tượng liên quan
istr_dwo_related[1].s_related_obj_name = 'u_goods_delivery'					// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = 'd_document_so_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'd_doc_goods_delivery_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].b_f_matching = true
istr_dwo_related[1].b_copy_tax = true
istr_dwo_related[1].b_chk_matched_qty = false
istr_dwo_related[1].s_relatedtext_column = 'code'					
istr_dwo_related[1].s_text = 'Phiếu xuất kho tư:: '

istr_dwo_related[1].s_main_obj_dwo_copy[1] = 'd_order_form' 
istr_dwo_related[1].s_main_obj_column_copy[1] = 'bill_to_object;bill_to_addtext;bill_to_object;bill_to_addtext;'+&
																		'payment_term;payment_method;'+&
																		'include_tax_yn;exchange_rate;currency_id;note;'
istr_dwo_related[1].s_related_obj_dwo_copy[1] = 'd_invoice_pur_form'
istr_dwo_related[1].s_related_obj_column_copy[1] = 'invoice_object;invoice_address;dr_cr_object;trans_address;'+&
																		'PAYMENT_TERM;PAYMENT_METHOD;'+&
																		'include_tax_yn;exchange_rate;currency_id;description;'
istr_dwo_related[1].s_main_obj_column_chk[1] = ''
istr_dwo_related[1].s_related_obj_column_chk[1] = 'trans_date;'


istr_dwo_related[1].s_main_obj_dwo_copy[2] = 'd_so_line_shipping_grid' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[2] = 'ITEM_ID;LINE_TEXT;NOTE;QTY;QTY;act_price;act_price;base_price;act_amount;act_amount;base_amount;base_amount_ex_tax;TRANS_UOM;' // cột copy từ
istr_dwo_related[1].s_related_obj_dwo_copy[2] = 'd_inventory_line_delivery_grid' // datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[2] = 'ITEM_ID;LINE_TEXT;NOTE;doc_qty;QTY;price;act_price;base_price;amount;act_amount;base_amount;base_amount_ex_tax;TRANS_UOM;' // cột copy đến
istr_dwo_related[1].s_main_obj_column_chk[2] = ''
istr_dwo_related[1].s_related_obj_column_chk[2] = 'warehouse_id;'
istr_dwo_related[1].s_f_obj_column_chk[2] = 'ITEM_ID'
istr_dwo_related[1].s_t_obj_column_chk[2] = 'ITEM_ID'
istr_dwo_related[1].b_copy_line[1] = false
// khai báo cập nhật bản matching
istr_dwo_related[1].s_match_f_dwo[2] = 'd_so_line_shipping_grid'
istr_dwo_related[1].s_match_f_col_obj[2] = 'item_id'
istr_dwo_related[1].s_match_t_dwo[2] = 'd_inventory_line_delivery_grid'
istr_dwo_related[1].s_match_f_column[2] = 'qty'
istr_dwo_related[1].s_match_t_column[2] = 'qty'
istr_dwo_related[1].s_match_column[2] = 'qty'
istr_dwo_related[1].s_match_rf_dwo[2] = ''  //tra hang
istr_dwo_related[1].s_main_obj_column_sum[2] = ''
istr_dwo_related[1].s_related_obj_column_sum[2] = ''
istr_dwo_related[1].s_f_obj_column_chk[2] = ''
istr_dwo_related[1].s_t_obj_column_chk[2] = ''
istr_dwo_related[1].b_f_sum[2] = false


end subroutine

public subroutine f_set_str_unit ();//--Datawindow chứa các cột cần làm tròn--//
istr_unit[1].s_dwo_handing = 'd_po_line_grid;d_po_line_grid;d_po_line_grid;d_po_line_grid;d_order_form;'
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = 'qty;price;amount;base_amount;exchange_rate;'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[1].s_dwo_unit = 'd_po_line_grid;d_order_form;d_order_form;d_order_form;d_order_form'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = 'uom_code;uom_code;uom_code;uom_code;exchange_rate'
//--Loại làm tròn --//
istr_unit[1].s_type = 'item;price;amount;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[1].s_dwo_object = 'd_po_line_grid'
//--Cột chứa mã đơn vị--//
istr_unit[1].s_colname_object = 'item_code'
end subroutine

public function integer f_resize_fixedpart_grid ();this.iw_display.dynamic f_reset_ii_fixedpart2_height_grid(0)
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_resize_fixedpart_form ();this.iw_display.dynamic f_reset_ii_fixedpart2_height_form()
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_reset_fixedpart_grid ();this.iw_display.dynamic f_reset_ii_fixedpart2_height_grid()
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function double f_get_pr_doc_id (string vs_t_ref_table, double vdb_t_doc_id);double 		ldb_doc_id

if upper(vs_t_ref_table) =  'PO_LINE' then
		// PO -> PR
		SELECT DISTINCT MAT2.F_DOC_ID into :ldb_doc_id 
		FROM DOCUMENT DOC //PUR
			 JOIN MATCHING MAT1 ON MAT1.T_DOC_ID = DOC.ID AND MAT1.F_REF_TABLE = 'PO_LINE' //INVEN
			 JOIN MATCHING MAT2 ON MAT2.T_DOC_ID = MAT1.F_DOC_ID AND MAT2.F_REF_TABLE = 'PR_LINE' //PO
		WHERE DOC.ID = :vdb_t_doc_id using SQLCA;
		if SQLCA.SQLCODE = 100 then
			// PUR -> PO
			SELECT DISTINCT MAT1.F_DOC_ID into :ldb_doc_id 
			FROM DOCUMENT DOC //PUR
				 JOIN MATCHING MAT1 ON MAT1.T_DOC_ID = DOC.ID AND MAT1.F_REF_TABLE = 'PR_LINE' //PO
			WHERE DOC.ID = :vdb_t_doc_id using SQLCA;
		end if
end if
if isnull(ldb_doc_id) then ldb_doc_id = 0
if SQLCA.sqlcode = -1 then ldb_doc_id = -1
return ldb_doc_id
end function

on c_shipping.create
call super::create
end on

on c_shipping.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = false
is_display_model = '1d_1d'
ib_display_text = false
is_object_title = 'Nhận hàng'
is_exrate_type = 'sell'
istr_actionpane[1].s_button_name = 'b_add_multi;b_join_multi;b_copyt_multi;b_view_multi;b_insert;b_modify;b_save; b_saveclose;b_filteron;b_query;b_refresh;b_delete;b_view_po;b_send_2_approve;b_request_2_change;b_total;b_approve;b_reject;'
istr_actionpane[1].s_button_has_sub = 'b_add_multi;b_view_multi;'
istr_actionpane[1].sa_sub_button[1]='b_add;b_copyt_seft;'
istr_actionpane[1].sa_sub_button[2]='b_view_po;b_view_po_eng;'
//istr_actionpane[1].sa_sub_button[3]='b_copyt_po_return;b_copyt_goods_receipt;b_copyt_pur_invoice;'
//istr_actionpane[1].sa_sub_button[4]='b_view_po;b_view_po_eng;'
istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_join_multi;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_detail;b_blank;b_copyt_multi;b_blank;b_view_po;b_blank;b_send_2_approve;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_detail;b_blank;b_copyt_multi;b_blank;b_view_po;b_blank;b_send_2_approve;b_approve;b_reject;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons =  'b_filteron;b_refresh;b_receiving;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query; b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_detail;b_blank;b_copyt_multi;b_blank;b_view_po;b_blank;b_send_2_approve;b_total;b_approve;b_reject;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_generate;b_modify;b_detail;b_filteron;b_refresh;b_delete;b_cancel;b_view_multi;b_send_2_approve;b_approve;b_reject;'
					else
						istr_actionpane[li_idx].s_visible_buttons= 'b_filteron;b_refresh;b_shipping;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =   'b_pr;b_po_return;b_goods_receipt;b_pur_invoice;b_so;'
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

event e_window_open;call super::e_window_open;
any				laa_value[]
t_dw_mpl			ldw_main

//--form parm--//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '<>(full_issue;cancelled)'
ldw_main.f_add_where('status',laa_value[])
this.is_copy_stage = 'data_getting'
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;
iw_display.f_set_ii_leftpart_width(1/2)
return 0
end event

