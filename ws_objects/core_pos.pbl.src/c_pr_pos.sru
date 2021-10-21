$PBExportHeader$c_pr_pos.sru
forward
global type c_pr_pos from b_doc
end type
end forward

global type c_pr_pos from b_doc
end type
global c_pr_pos c_pr_pos

forward prototypes
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_related ()
public subroutine f_set_str_unit ()
public function integer f_reset_fixedpart_grid ()
public function integer f_resize_fixedpart_form ()
public function integer f_resize_fixedpart_grid ()
public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[])
end prototypes

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_document_pm_grid'
istr_dwo[1].s_dwo_form = 'd_document_pm_form'
istr_dwo[1].s_dwo_grid = 'd_document_pm_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_order_pr_form;'
istr_dwo[1].b_ref_table_yn  = true
istr_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;doc_type;VERSION_ID;'
//istr_dwo[1].b_relation_1_1 = true
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_gb_name = 'gb_6'
istr_dwo[1].s_description = 'Yêu cầu mua hàng'

istr_dwo[2].s_dwo_default =  'd_order_pr_form'
istr_dwo[2].s_dwo_form = 'd_order_pr_form'
istr_dwo[2].s_dwo_grid = ''//d_order_pr_grid
istr_dwo[2].b_detail = true
istr_dwo[2].b_master = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_master = 'd_document_pm_grid;'
istr_dwo[2].s_dwo_details = 'd_pr_line_grid;'
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
istr_dwo[2].s_description = 'Mua hàng'

istr_dwo[3].s_dwo_default =  'd_pr_line_grid'
istr_dwo[3].s_dwo_form = ''//d_pr_line_form
istr_dwo[3].s_dwo_grid = 'd_pr_line_grid'
istr_dwo[3].b_detail = true
istr_dwo[3].b_master = true
istr_dwo[3].b_cascade_del = true
istr_dwo[3].s_dwo_master = 'd_order_pr_form;'
istr_dwo[3].s_dwo_details = 'd_order_catch_grid;'
istr_dwo[3].s_master_keycol = 'ID;'
istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[3].b_ref_table_yn  = false
istr_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[3].b_insert = true
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = true
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_excel = true
istr_dwo[3].b_traceable = true
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].b_focus_master = false
istr_dwo[3].s_gb_name = 'gb_7'
istr_dwo[3].s_description = 'Chi tiết mua hàng'
istr_dwo[3].s_popmenu_items = 'm_filter_detail'

istr_dwo[4].s_dwo_default =  'd_order_catch_grid'
istr_dwo[4].s_dwo_form = ''
istr_dwo[4].s_dwo_grid = 'd_order_catch_grid'
istr_dwo[4].b_detail = true
istr_dwo[4].s_dwo_master = 'd_pr_line_grid;'
istr_dwo[4].s_master_keycol = 'ID;'
istr_dwo[4].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[4].b_ref_table_yn  = false
istr_dwo[4].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[4].b_insert = true
istr_dwo[4].b_update = true
istr_dwo[4].b_delete = true
istr_dwo[4].b_query = true
istr_dwo[4].b_print = true
istr_dwo[4].b_excel = true
istr_dwo[4].b_traceable = true
istr_dwo[4].b_keyboardlocked = true
istr_dwo[4].b_focus_master = false 
istr_dwo[4].s_gb_name = 'gb_8'
istr_dwo[4].s_description = 'Chi tiết kiểm đếm'
end subroutine

public subroutine f_set_dwo_related ();// Đối tượng liên quan
istr_dwo_related[1].s_related_obj_name = 'u_po'					// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = 'd_document_pm_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'd_document_pm_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].b_f_matching = true
istr_dwo_related[1].s_relatedtext_column = 'code'					
istr_dwo_related[1].s_text = 'Đơn đặt mua từ: '

istr_dwo_related[1].s_main_obj_dwo_copy[1] = 'd_pr_line_grid' 
istr_dwo_related[1].s_main_obj_column_copy[1] = 'vendor_code;vendor_name;vendor_address;vendor_code;vendor_name;vendor_address;contact_name;vendor_id;vendor_id;'
istr_dwo_related[1].s_related_obj_dwo_copy[1] = 'd_order_form'
istr_dwo_related[1].s_related_obj_column_copy[1] ='object_code;object_name;ship_to_addtext;object_code_1;object_name_1;bill_to_addtext;contact_person;object_id;bill_to_object;'
istr_dwo_related[1].s_main_obj_column_chk[1] = 'vendor_code;vendor_name;vendor_address;vendor_code;vendor_name;vendor_address;contact_name;vendor_id;vendor_id;contact_id;'
istr_dwo_related[1].s_related_obj_column_chk[1] = 'object_code;object_name;ship_to_addtext;object_code_1;object_name_1;bill_to_addtext;contact_name;object_id;bill_to_object;contact_id;'
//istr_dwo_related[1].s_match_f_dwo[1] = 'd_pr_line_grid'
//istr_dwo_related[1].s_match_f_col_obj[1] = 'item_id'
//istr_dwo_related[1].s_match_t_dwo[1] = 'd_po_line_grid'
//istr_dwo_related[1].s_match_f_column[1] = 'qty'
//istr_dwo_related[1].s_match_t_column[1] = 'qty'
//istr_dwo_related[1].s_match_column[1] = 'qty'
//
// datawindow copy từ
istr_dwo_related[1].s_main_obj_dwo_copy[2] = 'd_pr_line_grid' 
// cột copy từ
istr_dwo_related[1].s_main_obj_column_copy[2] = 'item_code;LINE_TEXT;NOTE;QTY;PRICE;AMOUNT;uom_code;TRANS_UOM;ITEM_ID;SPEC_ID;REQUEST_RECEIVE_DATE;'
//datawindow copy đến
istr_dwo_related[1].s_related_obj_dwo_copy[2] = 'd_po_line_grid'
// cột copy đến
istr_dwo_related[1].s_related_obj_column_copy[2] = 'item_code;LINE_TEXT;NOTE;QTY;PRICE;AMOUNT;uom_code;TRANS_UOM;ITEM_ID;SPEC_ID;REQUEST_RECEIVE_DATE;'
istr_dwo_related[1].b_copy_line[2] = true
// cột check cùng loại thường dùng cho master
istr_dwo_related[1].s_main_obj_column_chk[2] = ''
istr_dwo_related[1].s_related_obj_column_chk[2] = ''
istr_dwo_related[1].s_f_obj_column_chk[2] = ''
istr_dwo_related[1].s_t_obj_column_chk[2] = ''
istr_dwo_related[1].s_match_f_dwo[2] = 'd_pr_line_grid'
istr_dwo_related[1].s_match_f_col_obj[2] = 'item_id'
istr_dwo_related[1].s_match_t_dwo[2] = 'd_po_line_grid'
istr_dwo_related[1].s_match_f_column[2] = 'qty'
istr_dwo_related[1].s_match_t_column[2] = 'qty'
istr_dwo_related[1].s_match_column[2] = 'qty'
//
istr_dwo_related[1].s_main_obj_dwo_copy[3] = 'd_order_pr_form' 
istr_dwo_related[1].s_main_obj_column_copy[3] = 'currency_id;uom_code;note;exchange_rate;'
istr_dwo_related[1].s_related_obj_dwo_copy[3] = 'd_order_form'
istr_dwo_related[1].s_related_obj_column_copy[3] = 'currency_id;uom_code;note;exchange_rate;'
istr_dwo_related[1].s_main_obj_column_chk[3] = 'uom_code;currency_id;note;'
istr_dwo_related[1].s_related_obj_column_chk[3] = 'uom_code;currency_id;note;'

istr_dwo_related[1].s_main_obj_dwo_copy[4] = 'd_order_catch_grid' 
istr_dwo_related[1].s_main_obj_column_copy[4] = 'object_code;object_name;uom_code;CATCH_QTY;CATCH_TEXT;CATCH_ITEM;CATCH_UOM;'
istr_dwo_related[1].s_related_obj_dwo_copy[4] = 'd_order_catch_grid'
istr_dwo_related[1].s_related_obj_column_copy[4] = 'object_code;object_name;uom_code;CATCH_QTY;CATCH_TEXT;CATCH_ITEM;CATCH_UOM;'
istr_dwo_related[1].s_main_obj_column_chk[4] = ''
istr_dwo_related[1].s_related_obj_column_chk[4] = ''

istr_dwo_related[1].s_match_f_dwo[4] = 'd_order_catch_grid'
istr_dwo_related[1].s_match_t_dwo[4] = 'd_order_catch_grid'
istr_dwo_related[1].s_match_f_column[4] = 'catch_qty'
istr_dwo_related[1].s_match_t_column[4] = 'catch_qty'
istr_dwo_related[1].s_match_column[4] = 'qty'
istr_dwo_related[1].s_main_obj_column_sum[4] = ''
istr_dwo_related[1].s_related_obj_column_sum[4] = ''
istr_dwo_related[1].s_f_obj_column_chk[4] = ''
istr_dwo_related[1].s_t_obj_column_chk[4] = ''
istr_dwo_related[1].b_f_sum[4] = false
istr_dwo_related[1].b_copy_line[4] = false

// Đối tượng liên quan
istr_dwo_related[2].s_related_obj_name = 'u_so'					// đối tượng quan hệ đến
istr_dwo_related[2].s_main_obj_dwo = 'd_document_pm_grid'		//datawindow quan hệ main
istr_dwo_related[2].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[2].s_related_obj_dwo = 'd_document_orders_grid'	// datawindow quan hệ đến
istr_dwo_related[2].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[2].b_t_matching = true
istr_dwo_related[2].s_relatedtext_column = 'doc_code'					
istr_dwo_related[2].s_text = 'Đơn trả hàng từ: '
istr_dwo_related[2].s_match_f_dwo[1] = 'd_so_line_grid'
istr_dwo_related[2].s_match_t_dwo[1] = 'd_pr_line_grid'
istr_dwo_related[2].s_match_f_column[1] = 'qty'
istr_dwo_related[2].s_match_t_column[1] = 'qty'
istr_dwo_related[2].s_match_column[1] = 'qty'
istr_dwo_related[2].s_dwo_matched_f_dwo[1] = 'd_detail_so_line_grid'
istr_dwo_related[2].s_column_matched_f_dwo[1] = 'inv_qty'
istr_dwo_related[2].s_match_f_dwo[2] = 'd_order_catch_grid'
istr_dwo_related[2].s_match_t_dwo[2] = 'd_order_catch_grid'
istr_dwo_related[2].s_match_f_column[2] = 'catch_qty'
istr_dwo_related[2].s_match_t_column[2] = 'catch_qty'
istr_dwo_related[2].s_match_column[2] = 'qty'

istr_dwo_related[3].s_related_obj_name = 'b_view'					// đối tượng liên quan
istr_dwo_related[3].s_main_obj_dwo = 'd_document_pm_grid'		//datawindow quan hệ main
istr_dwo_related[3].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[3].s_related_obj_dwo = 'dv_pr_form'	// datawindow quan hệ đến
istr_dwo_related[3].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[3].s_relatedtext_column = 'code'					
istr_dwo_related[3].s_text = 'In phiếu yêu cầu mua hàng '


// Đối tượng liên quan
istr_dwo_related[4].s_related_obj_name = 'u_prod_orders'					// đối tượng copy đến
istr_dwo_related[4].s_main_obj_dwo = 'd_document_prod_grid'		//datawindow quan hệ main
istr_dwo_related[4].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[4].s_related_obj_dwo = 'd_document_pm_grid'	// datawindow quan hệ đến
istr_dwo_related[4].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[4].b_f_matching = true
istr_dwo_related[4].s_relatedtext_column = 'code'					
istr_dwo_related[4].s_text = 'Sản xuất từ: '
// datawindow copy từ 
istr_dwo_related[4].s_main_obj_dwo_copy[1] = 'd_pr_line_grid'
istr_dwo_related[4].s_main_obj_column_copy[1] = 'item_code;LINE_TEXT;QTY;uom_code;TRANS_UOM;ITEM_ID;SPEC_ID;REQUEST_RECEIVE_DATE;' &
																+ 'spec_code;spec_name;length;width;depth;'    // cột copy từ
//datawindow copy đến
istr_dwo_related[4].s_related_obj_dwo_copy[1] = 'd_prod_line_grid'
istr_dwo_related[4].s_related_obj_column_copy[1] = 'object_code;object_name;plan_qty;uom_code;TRANS_UOM;OBJECT_ID;SPEC_ID;PLAN_E_DATE;' & 
																	+ 'spec_code;spec_name;spec_length;spec_width;spec_depth;' // cột copy đến
istr_dwo_related[4].b_copy_line[1] = true
// cột check cùng loại thường dùng cho master
istr_dwo_related[4].s_main_obj_column_chk[1] = ''
istr_dwo_related[4].s_related_obj_column_chk[1] = ''
istr_dwo_related[4].s_f_obj_column_chk[1] = ''
istr_dwo_related[4].s_t_obj_column_chk[1] = ''
istr_dwo_related[4].s_match_f_dwo[1] = 'd_pr_line_grid'
istr_dwo_related[4].s_match_f_col_obj[1] = 'item_id'
istr_dwo_related[4].s_match_t_dwo[1] = 'd_prod_line_grid'
istr_dwo_related[4].s_match_f_column[1] = 'qty'
istr_dwo_related[4].s_match_t_column[1] = 'plan_qty'
istr_dwo_related[4].s_match_column[1] = 'qty'

istr_dwo_related[4].s_main_obj_dwo_copy[2] = 'd_pr_line_grid' 
istr_dwo_related[4].s_main_obj_column_copy[2] = 'vendor_code;vendor_name;vendor_address;vendor_address;vendor_id;vendor_id;'
istr_dwo_related[4].s_related_obj_dwo_copy[2] = 'd_prod_hdr_form'
istr_dwo_related[4].s_related_obj_column_copy[2] ='object_code;object_name;trans_address;invoice_address;dr_cr_object;invoice_object;'
istr_dwo_related[4].s_main_obj_column_chk[2] = 'vendor_code;vendor_name;vendor_address;vendor_address;vendor_id;vendor_id;'
istr_dwo_related[4].s_related_obj_column_chk[2] = 'object_code;object_name;trans_address;invoice_address;dr_cr_object;invoice_object;'

istr_dwo_related[4].s_main_obj_dwo_copy[3] = 'd_order_pr_form' 
istr_dwo_related[4].s_main_obj_column_copy[3] = 'uom_code;currency_id;note;exchange_rate;'
istr_dwo_related[4].s_related_obj_dwo_copy[3] = 'd_prod_hdr_form'
istr_dwo_related[4].s_related_obj_column_copy[3] = 'uom_code;currency_id;note;exchange_rate;'
istr_dwo_related[4].s_main_obj_column_chk[3] = 'uom_code;currency_id;note;'
istr_dwo_related[4].s_related_obj_column_chk[3] = 'uom_code;currency_id;note;'
istr_dwo_related[4].b_copy_line[3] = false
istr_dwo_related[4].s_f_obj_column_chk[3] = ''

istr_dwo_related[4].s_t_obj_column_chk[3] = ''

istr_dwo_related[4].s_main_obj_column_chk[3] = ''

istr_dwo_related[4].s_related_obj_column_chk[3] = ''

istr_dwo_related[4].s_match_f_dwo[3] = ''

istr_dwo_related[4].s_match_t_dwo[3] = ''

istr_dwo_related[4].s_match_f_column[3] = ''

istr_dwo_related[4].s_match_t_column[3] = ''

istr_dwo_related[4].s_main_obj_column_sum[3] = ''

istr_dwo_related[4].s_related_obj_column_sum[3] = ''

istr_dwo_related[4].s_match_column[3] = ''

istr_dwo_related[4].s_f_obj_column_chk[3] = ''

istr_dwo_related[4].s_t_obj_column_chk[3] = ''

istr_dwo_related[4].b_f_sum[3] = false
end subroutine

public subroutine f_set_str_unit ();//--Datawindow chứa các cột cần làm tròn--//
istr_unit[1].s_dwo_handing = 'd_pr_line_grid;d_pr_line_grid;d_pr_line_grid;d_pr_line_grid;d_order_pr_form;'
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = 'qty;price;amount;bc;ex'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[1].s_dwo_unit = 'd_pr_line_grid;d_order_pr_form;d_order_pr_form;d_order_pr_form;d_order_pr_form;'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = 'uom_code;uom_code;uom_code;uom_code;exchange_rate'
//--Loại làm tròn --//
istr_unit[1].s_type = 'item;"";"";"";""'
//--Datawindow của cột chứa mã hàng--//
istr_unit[1].s_dwo_object = 'd_pr_line_grid'
//--Cột chứa mã đơn vị--//
istr_unit[1].s_colname_object = 'item_code'
end subroutine

public function integer f_reset_fixedpart_grid ();this.iw_display.dynamic f_reset_ii_fixedpart2_height_grid()
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_resize_fixedpart_form ();this.iw_display.dynamic f_reset_ii_fixedpart2_height_form()
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_resize_fixedpart_grid ();
this.iw_display.dynamic f_reset_ii_fixedpart2_height_grid(0)
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[]);if pos(rdw_focus.dataobject,'d_document_' ) > 0 then
	ra_args[1] = gi_userid
end if
return upperbound(ra_args)
end function

on c_pr_pos.create
call super::create
end on

on c_pr_pos.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = true
is_display_model = '4dgb'
ib_display_text = false
is_object_title = 'Yêu cầu mua hàng'
is_exrate_type = 'sell'
istr_actionpane[1].s_button_name =  'b_add_multi;b_join_multi;b_copyt_multi;b_insert;b_modify; b_saveclose;b_filteron;b_query;b_refresh;b_delete;b_view_multi;b_send_2_approve;b_request_2_change;b_approve;b_reject;'
istr_actionpane[1].s_button_has_sub = 'b_add_multi;b_join_multi;b_copyt_multi;b_view_multi;'
istr_actionpane[1].sa_sub_button[1]='b_add;b_copyf_so;b_copyt_seft;'
istr_actionpane[1].sa_sub_button[2]='b_copyl_so;'
istr_actionpane[1].sa_sub_button[3]='b_copyt_po;'
istr_actionpane[1].sa_sub_button[4]='b_view_pr;'

istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_description = is_object_title
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;long		ll_row,ll_line_no,ll_idx

if mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_order_pr' then
	rpo_dw.setitem(vl_currentrow,'doc_type','PR')
	rpo_dw.setitem(vl_currentrow,'object_type','VENDOR')
	rpo_dw.setitem( vl_currentrow, 'VERSION_NO', 1)
elseif pos(rpo_dw.dataobject,'d_pr_line') > 0 then
	rpo_dw.setitem(vl_currentrow,'object_type','ITEM')
	if vl_currentrow = 1 then
		ll_line_no = 1
	else
		ll_line_no = vl_currentrow
		for ll_idx = vl_currentrow + 1 to rpo_dw.rowcount()
			rpo_dw.setitem(ll_idx,'line_no',ll_idx)
		next
	end if
	rpo_dw.setitem(vl_currentrow,'line_no',ll_line_no)
	if this.ib_copying then
		//-- lấy nhà cung cấp khi đang copy từ ĐXBH --//
		
	end if
elseif pos(rpo_dw.dataobject,'d_order_catch') > 0 then
	rpo_dw.setitem(vl_currentrow,'object_type','ITEM')
end if
return vl_currentrow
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;b_obj_instantiate	lb_obj_int
t_dw_mpl		ldw_tmp
double			ldb_vendor_id,ldb_item_id,ldb_wholesales_price,ldb_qty,ldb_cur_id,ldb_amount
string				ls_dwo_price
long				ll_find,ll_row
date				ld_doc_date

if pos(rpo_dw.dataobject, istr_dwo[2].s_dwo_default) > 0 or pos(rpo_dw.dataobject, istr_dwo[3].s_dwo_default) > 0 then
	ldw_tmp = iw_display.f_get_dwmain( )
	ld_doc_date = date(ldw_tmp.getitemdatetime( ldw_tmp.getrow(),'document_date'))
	
	ldw_tmp = iw_display.f_get_dw(istr_dwo[2].s_dwo_default)
	ldb_cur_id = ldw_tmp.getitemnumber( ldw_tmp.getrow(), 'currency_id')
	ls_dwo_price = 'd_item_purchase_price_grid'
end if
if  pos(rpo_dw.dataobject, istr_dwo[3].s_dwo_default) > 0 then
	ldb_item_id = rpo_dw.getitemnumber( vl_currentrow, 'item_id')
	choose case vs_colname
		case 'qty'
			ldb_qty = double(vs_editdata)
			ldb_vendor_id = rpo_dw.getitemnumber(vl_currentrow,'VENDOR_ID')
			lb_obj_int.f_get_wholesales_price( ldb_item_id, ldb_qty, ldb_cur_id, ls_dwo_price, 'PURCHASE', ld_doc_date, ldb_vendor_id, 0, ldb_wholesales_price)
			rpo_dw.setitem( vl_currentrow, 'price', ldb_wholesales_price)
			rpo_dw.setitem(vl_currentrow,'amount',ldb_wholesales_price * ldb_qty)
			//-- set giá mặc định --//
		case 'price'
			ldb_qty = rpo_dw.getitemnumber(vl_currentrow,'qty')
			if isnull(ldb_qty) then ldb_wholesales_price = 0
			ldb_amount = double(vs_editdata) * ldb_qty
			rpo_dw.setitem(vl_currentrow,'amount',double(ldb_amount))
		case 'amount'
		case 'item_code'
			ldb_qty = rpo_dw.getitemnumber( vl_currentrow, 'qty')
			//-- lấy NCC cài đặt của mã hàng --//
			lb_obj_int.is_table = 'object'
			if isnull(ldb_item_id) then ldb_item_id = lb_obj_int.f_get_id( vs_editdata)
			if lb_obj_int.f_get_applied_object_price( ldb_item_id, ldb_qty, ldb_vendor_id, ld_doc_date, ls_dwo_price,'VENDOR', 'PURCHASE') = 1 then
				rpo_dw.setitem( vl_currentrow, 'VENDOR_ID', ldb_vendor_id)
				rpo_dw.setitem( vl_currentrow, 'VENDOR_CODE', lb_obj_int.f_get_code( ldb_vendor_id))
				rpo_dw.setitem( vl_currentrow, 'VENDOR_NAME', lb_obj_int.f_get_name( ldb_vendor_id))
			end if
	end choose
elseif pos(rpo_dw.dataobject,  istr_dwo[2].s_dwo_default) > 0 then
	choose case vs_colname
		case 'uom_code'
			lb_obj_int.is_table = 'uom'
			if isnull(ldb_cur_id) then ldb_cur_id = lb_obj_int.f_get_id( vs_editdata)
			ldw_tmp = iw_display.f_get_dw(istr_dwo[3].s_dwo_default)
			for ll_row = 1 to ldw_tmp.rowcount( )
				ldb_vendor_id = ldw_tmp.getitemnumber(ll_row,'VENDOR_ID')
				ldb_item_id = ldw_tmp.getitemnumber( ll_row, 'item_id')
				ldb_qty = ldw_tmp.getitemnumber( ll_row, 'qty')
				lb_obj_int.f_get_wholesales_price( ldb_item_id, ldb_qty, ldb_cur_id, ls_dwo_price, 'PURCHASE', ld_doc_date, ldb_vendor_id, 0, ldb_wholesales_price)
				ldw_tmp.setitem( ll_row, 'price', ldb_wholesales_price)
				ldw_tmp.setitem(ll_row,'amount',ldb_wholesales_price * ldb_qty)
			next
	end choose
end if
return AncestorReturnValue

end event

event e_dw_e_preretrieve;call super::e_dw_e_preretrieve;//string				ls_columns
//any				laa_arg[]
//
//if mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject) - 5) = 'd_document' then
//	ls_columns = 'doc_type'
//	laa_arg[1] = '=pr'
//	rpo_dw.dynamic f_add_where(ls_columns,laa_arg)
//end if
return 1
end event

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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_detail;b_blank;b_view_multi;b_blank;b_copyt_multi;b_blank;b_send_2_approve;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_detail;b_blank;b_view_multi;b_blank;b_copyt_multi;b_blank;b_send_2_approve;b_approve;b_reject;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query; b_refresh;b_blank;b_delete;b_cancel;b_blank;b_detail;b_blank;b_view_multi;b_blank;b_copyt_multi;b_blank;b_send_2_approve;b_request_2_change;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query; b_refresh;b_blank;b_delete;b_cancel;b_blank;b_detail;b_blank;b_view_multi;b_blank;b_copyt_multi;b_blank;b_send_2_approve;b_request_2_change;b_approve;b_reject;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_detail;b_blank;b_view_multi;b_blank;b_copyt_multi;b_blank;b_send_2_approve;b_approve;b_reject;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_detail;b_blank;b_view_multi;b_blank;b_copyt_multi;b_blank;b_send_2_approve;b_approve;b_reject;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =   'b_so;b_po;'
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

event e_dw_e_postretrieve;call super::e_dw_e_postretrieve;string				ls_object_type

if mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject) -5) = 'd_order' then
	ls_object_type = rpo_dw.getitemstring(vl_rowcount,'object_type')
	if isnull(ls_object_type) then
		rpo_dw.setitem(vl_rowcount,'object_type','VENDOR')
	end if
end if
return 0
end event

event e_window_open;call super::e_window_open;t_dw_mpl			ldw_main
any				laa_value[]
//--form parm--//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '=PR'
ldw_main.f_add_where('doc_type;',laa_value[])

return 0

end event

event e_window_e_preopen;call super::e_window_e_preopen;
iw_display.f_set_ii_fixedpart2_height(iw_display.ii_resize_height*(1/6))  // document
iw_display.f_set_ii_upperpart_height(iw_display.ii_resize_height*(1/2)) //orders+pr_line
iw_display.f_set_ii_gb_3_height(iw_display.ii_resize_height*(1/3)) //pr_line



return 0
end event

event e_dw_updatestart;call super::e_dw_updatestart;t_ds_db			lds_pur_price
t_dw_mpl		ldw_main
double			ldb_vendor_id,ldb_item_id,ldb_wholesales_price,ldb_qty
long				ll_find,ll_idx
string				ls_find
date				ld_doc_date

if rdw_requester.dataobject = 'd_pr_line_grid' then
	//rdw_requester = iw_display.f_get_dw( 'd_pr_line_grid')
	ldw_main = iw_display.f_get_dwmain( )
	ld_doc_date = date(ldw_main.getitemdatetime( ldw_main.getrow(),'document_date'))
	lds_pur_price = create t_ds_db
	lds_pur_price.dataobject = 'd_item_purchase_price_grid'
	lds_pur_price.f_settransobject( SQLCA)
	lds_pur_price.event e_retrieve( )
	for ll_idx = 1 to rdw_requester.rowcount( )
		//set giá và nhà cung cấp
		ldb_vendor_id = rdw_requester.getitemnumber( ll_idx, 'vendor_id')
		if isnull(ldb_vendor_id) or ldb_vendor_id = 0 then
			ldb_item_id = rdw_requester.getitemnumber( ll_idx, 'item_id')
			ldb_qty = rdw_requester.getitemnumber( ll_idx, 'qty')
			ls_find= "item_id = "+string(ldb_item_id) + ' AND (FROM_QTY < '+string(ldb_qty)+' AND TO_QTY > '+string(ldb_qty)+')'&
						+" AND (f_date < date('"+string(ld_doc_date)+"') AND t_date > date('"+string(ld_doc_date)+"'))"
			ll_find = lds_pur_price.find( ls_find, 1, lds_pur_price.rowcount())
			if ll_find = 0 then
				ls_find = "item_id = "+string(ldb_item_id) +" and (isnull(FROM_QTY) or FROM_QTY = 0) and (isnull(TO_QTY) or TO_QTY = 0)"&
							+" and isnull(f_date) and isnull(t_date)"
			end if
			ll_find = lds_pur_price.find( ls_find, 1, lds_pur_price.rowcount())
			if ll_find > 0 then
				ldb_wholesales_price = lds_pur_price.getitemnumber( ll_find, 'wholesales_price')
				
				if isnull(ldb_wholesales_price) then ldb_wholesales_price = 0
				if isnull(ldb_qty) then ldb_qty = 0
				rdw_requester.setitem( ll_idx, 'price', ldb_wholesales_price)
				rdw_requester.setitem( ll_idx, 'amount', ldb_qty*ldb_wholesales_price)
				rdw_requester.setitem( ll_idx, 'vendor_id',lds_pur_price.getitemnumber( ll_find, 'applied_object_id') )
				rdw_requester.setitem( ll_idx, 'vendor_code',lds_pur_price.getitemstring( ll_find, 'object_code') )
				rdw_requester.setitem( ll_idx, 'vendor_name',lds_pur_price.getitemstring( ll_find, 'object_name') )
			end if
		end if
	next
	destroy lds_pur_price
end if

return 0
end event

event e_window_e_send_2_approve;call super::e_window_e_send_2_approve;//b_obj_instantiate	lb_ins
//
//t_dw_mpl	ldw_pr_line,ldw_main,ldw_order
//t_ds_db		lds_balance
//any			laa_data[],la_null
//date			ld_doc_date
//long			ll_idx,ll_find,ll_count
//string			ls_warehouse_code
//double		ldb_total_values,ldb_doc_value,ldb_handle_by,ldb_stock_value
////ds_v_item_balance
//
//ldw_main = iw_display.f_get_dwmain( )
//ldw_pr_line = iw_display.f_get_dw( 'd_pr_line_grid')
//ldw_order = iw_display.f_get_dw('d_order_pr_form')
//ld_doc_date = date(ldw_main.getitemdatetime( ldw_main.getrow(), 'document_date'))
//ldb_handle_by = ldw_main.getitemnumber( ldw_main.getrow(), 'handled_by')
//ls_warehouse_code = lb_ins.f_get_staff_dept_code( ldb_handle_by, 'USER')
//setnull(la_null)
//lds_balance = create t_ds_db
//lds_balance.dataobject = 'ds_v_item_balance'
//lds_balance.f_settransobject( SQLCA)
//laa_data[1] = gi_user_comp_id
//laa_data[2] = ld_doc_date
////laa_data[1] = ldw_pr_line.getitemstring( ll_idx, 'item_code')
//laa_data[3] = ls_warehouse_code
//laa_data[4] = la_null
//laa_data[5] = la_null
//laa_data[6] = la_null
//laa_data[7] = la_null
//lds_balance.f_add_where( "company_id;balance_date;warehouse_code;SPEC_ID;LOC_ID;LOT_NO;SERIAL_NO;", laa_data)
//for ll_idx = 1 to ldw_pr_line.rowcount()
//	ldb_doc_value = ldw_pr_line.getitemnumber( ll_idx, 'amount')
//	if isnull(ldb_doc_value) then ldb_doc_value = 0
//	ll_find = lds_balance.find( "item_code = '"+ldw_pr_line.getitemstring( ll_idx, 'item_code')+"'", 1, lds_balance.rowcount())
//	if ll_find > 0 then
//		ldb_stock_value = lds_balance.getitemnumber( ll_find, 'close_base_value')
//		if isnull(ldb_stock_value) then ldb_stock_value = 0
//	end if
//	ldb_total_values += ldb_doc_value + ldb_stock_value
//next
//Select count(obj.id) into :ll_count
//From object obj
//Where obj.object_ref_table = 'WAREHOUSE' and obj.code = :ls_warehouse_code 
//		and :ldb_total_values between obj.min_stock_value and obj.max_stock_value using SQLCA;
//if SQLCA.sqlcode = 0 then
//	if ll_count > 0 then
//		ldw_order.setitem( ldw_order.getrow(), 'auto_appr', 'Y')
//	else
//		ldw_order.setitem( ldw_order.getrow(), 'auto_appr', 'N')
//	end if
//else
//	return -1
//end if
return 0
end event

event e_window_e_postcopy;call super::e_window_e_postcopy;b_obj_instantiate	lb_obj_int

t_dw_mpl	ldw_pr_line,ldw_main
double		ldb_item_id,ldb_qty,ldb_object_id
string			ls_dwo_price,ls_object_code,ls_object_name
date			ld_trans_date
long			ll_idx

ldw_pr_line = iw_display.f_get_dw( 'd_pr_line_grid')
if not isvalid(ldw_pr_line) then return -1
ldw_main = iw_display.f_get_dwmain( )
ld_trans_date = date(ldw_main.getitemdatetime( ldw_main.getrow( ) , 'document_date'))
lb_obj_int.is_table = 'object'
ls_dwo_price = 'd_item_purchase_price_grid'
for ll_idx = 1 to ldw_pr_line.rowcount( )
	ldb_item_id = ldw_pr_line.getitemnumber( ll_idx, 'item_id')
	ldb_qty =  ldw_pr_line.getitemnumber( ll_idx, 'qty')
	if lb_obj_int.f_get_applied_object_price( ldb_item_id, ldb_qty, ldb_object_id, ld_trans_date, ls_dwo_price,'VENDOR', 'PURCHASE') = 1 then
		ls_object_name = lb_obj_int.f_get_name( ldb_object_id)
		ls_object_code = lb_obj_int.f_get_code( ldb_object_id)
		
		ldw_pr_line.setitem( ll_idx, 'VENDOR_ID', ldb_object_id)
		ldw_pr_line.setitem( ll_idx, 'VENDOR_CODE', ls_object_code)
		ldw_pr_line.setitem( ll_idx, 'VENDOR_NAME', ls_object_name)
	end if
next

end event

event e_window_e_precopy_from;call super::e_window_e_precopy_from;t_dw_mpl 		ldw_line
double			ldb_vendor_id

ldw_line = iw_display.f_get_dw( 'd_pr_line_grid')
if isvalid(ldw_line) and ldw_line.rowcount( ) > 0 then
	if ldw_line.find( "isnull(vendor_id)" , 1, ldw_line.rowcount()) = 0 then return 0
end if
gf_messagebox('m.b_doc.e_dw_e_precopy_from.01','Thông báo','YCMH chưa chọn nhà cung cấp' ,'exclamation','ok',1)
return -1
end event

event e_window_e_precopy_to;call super::e_window_e_precopy_to;

t_dw_mpl 		ldw_line
double			ldb_vendor_id

ldw_line = iw_display.f_get_dw( 'd_pr_line_grid')
if isvalid(ldw_line) and ldw_line.rowcount( ) > 0 then
	if ldw_line.find( "isnull(vendor_id)" , 1, ldw_line.rowcount()) = 0 then return 0
end if
gf_messagebox('m.b_doc.e_dw_e_precopy_from.01','Thông báo','YCMH chưa chọn nhà cung cấp' ,'exclamation','ok',1)
return -1
end event

