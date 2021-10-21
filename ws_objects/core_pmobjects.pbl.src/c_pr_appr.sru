$PBExportHeader$c_pr_appr.sru
forward
global type c_pr_appr from b_doc
end type
end forward

global type c_pr_appr from b_doc
end type
global c_pr_appr c_pr_appr

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
istr_dwo[2].s_dwo_grid = 'd_order_pr_grid'
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
istr_dwo[3].s_dwo_form = 'd_pr_line_form'
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

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_po'					// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = 'd_pr_line_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'd_po_line_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].b_f_matching = true
istr_dwo_related[1].s_relatedtext_column = 'doc_code'					
istr_dwo_related[1].s_text = 'Đơn đặt mua từ: '

// datawindow copy từ
istr_dwo_related[1].s_main_obj_dwo_copy[1] = 'd_pr_line_grid' 
// cột copy từ
istr_dwo_related[1].s_main_obj_column_copy[1] = 'item_code;LINE_TEXT;NOTE;QTY;PRICE;AMOUNT;uom_code;TRANS_UOM;ITEM_ID;SPEC_ID;'
//datawindow copy đến
istr_dwo_related[1].s_related_obj_dwo_copy[1] = 'd_po_line_grid'
// cột copy đến
istr_dwo_related[1].s_related_obj_column_copy[1] = 'item_code;LINE_TEXT;NOTE;QTY;PRICE;AMOUNT;uom_code;TRANS_UOM;ITEM_ID;SPEC_ID;'
istr_dwo_related[1].b_copy_line[1] = true
// cột check cùng loại thường dùng cho master
istr_dwo_related[1].s_main_obj_column_chk[1] = ''
istr_dwo_related[1].s_related_obj_column_chk[1] = ''
istr_dwo_related[1].s_f_obj_column_chk[1] = ''
istr_dwo_related[1].s_t_obj_column_chk[1] = ''
istr_dwo_related[1].s_match_f_dwo[1] = 'd_pr_line_grid'
istr_dwo_related[1].s_match_f_col_obj[1] = 'item_id'
istr_dwo_related[1].s_match_t_dwo[1] = 'd_po_line_grid'
istr_dwo_related[1].s_match_f_column[1] = 'qty'
istr_dwo_related[1].s_match_t_column[1] = 'qty'
istr_dwo_related[1].s_match_column[1] = 'qty'

istr_dwo_related[1].s_main_obj_dwo_copy[2] = 'd_pr_line_grid' 
istr_dwo_related[1].s_main_obj_column_copy[2] = 'vendor_code;vendor_name;vendor_address;vendor_code;vendor_name;vendor_address;contact_name;vendor_id;vendor_id;contact_id;'
istr_dwo_related[1].s_related_obj_dwo_copy[2] = 'd_order_form'
istr_dwo_related[1].s_related_obj_column_copy[2] ='object_code;object_name;ship_to_addtext;object_code_1;object_name_1;bill_to_addtext;contact_name;object_id;bill_to_object;contact_id;'
istr_dwo_related[1].s_main_obj_column_chk[2] = 'vendor_code;vendor_name;vendor_address;vendor_code;vendor_name;vendor_address;contact_name;vendor_id;vendor_id;contact_id;'
istr_dwo_related[1].s_related_obj_column_chk[2] = 'object_code;object_name;ship_to_addtext;object_code_1;object_name_1;bill_to_addtext;contact_name;object_id;bill_to_object;contact_id;'

istr_dwo_related[1].s_main_obj_dwo_copy[3] = 'd_order_pr_form' 
istr_dwo_related[1].s_main_obj_column_copy[3] = 'uom_code;currency_id;note;'
istr_dwo_related[1].s_related_obj_dwo_copy[3] = 'd_order_form'
istr_dwo_related[1].s_related_obj_column_copy[3] = 'uom_code;currency_id;note;'
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

istr_dwo_related[2].s_related_obj_name = 'u_so'					// đối tượng quan hệ đến
istr_dwo_related[2].s_main_obj_dwo = 'd_pr_line_grid'		//datawindow quan hệ main
istr_dwo_related[2].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[2].s_related_obj_dwo = 'd_so_line_grid'	// datawindow quan hệ đến
istr_dwo_related[2].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[2].b_t_matching = true
istr_dwo_related[2].s_relatedtext_column = 'doc_code'					
istr_dwo_related[2].s_text = 'Đơn trả hàng từ: '
istr_dwo_related[2].s_match_f_dwo[1] = 'd_so_line_grid'
istr_dwo_related[2].s_match_t_dwo[1] = 'd_pr_line_grid'
istr_dwo_related[2].s_match_f_column[1] = 'qty'
istr_dwo_related[2].s_match_t_column[1] = 'qty'
istr_dwo_related[2].s_match_column[1] = 'qty'
istr_dwo_related[2].s_match_f_dwo[2] = 'd_order_catch_grid'
istr_dwo_related[2].s_match_t_dwo[2] = 'd_order_catch_grid'
istr_dwo_related[2].s_match_f_column[2] = 'catch_qty'
istr_dwo_related[2].s_match_t_column[2] = 'catch_qty'
istr_dwo_related[2].s_match_column[2] = 'qty'
end subroutine

public subroutine f_set_str_unit ();//--datawindow chứa các cột cần làm tròn--//
istr_unit[1].s_dwo_handing = 'd_pr_line_grid'
//--các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = 'qty;price;amount;bc;ex'
//--nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[1].s_dwo_unit = 'd_pr_line_grid;d_order_pr_form;d_order_pr_form;d_order_pr_form;d_order_pr_form'
//--tên cột hứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = 'uom_code;uom_code;uom_code;uom_code;exchange_rate'
//--loại làm tròn --//
istr_unit[1].s_type = 'item;"";"";"";""'
//--datawindow của cột chứa mã hàng--//
istr_unit[1].s_dwo_object = 'd_pr_line_grid'
//--cột chứa mã đơn vị--//
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

on c_pr_appr.create
call super::create
end on

on c_pr_appr.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = true
is_display_model = '4dgb'
ib_display_text = false
is_object_title = 'Duyệt yêu cầu mua hàng'
istr_actionpane[1].s_button_name = 'b_approve;b_reject;'
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
elseif pos(rpo_dw.dataobject,'d_order_catch') > 0 then
	rpo_dw.setitem(vl_currentrow,'object_type','ITEM')
end if
return vl_currentrow
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;decimal			ldc_price,ldc_amount,ldc_disc_amt,ldc_disc_pct
long				ll_qty

if mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_pr_line' then
	choose case vs_colname
		case 'qty'
			ldc_price = rpo_dw.getitemnumber(vl_currentrow,'price')
			if isnull(ldc_price) then ldc_price = 0
			ldc_amount = dec(vs_editdata) * ldc_price
			rpo_dw.setitem(vl_currentrow,'amount',dec(ldc_amount))
		case 'price'
			ll_qty = rpo_dw.getitemnumber(vl_currentrow,'qty')
			if isnull(ll_qty) then ldc_price = 0
			ldc_amount = dec(vs_editdata) * ll_qty
			rpo_dw.setitem(vl_currentrow,'amount',dec(ldc_amount))
		case 'amount'
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_filteron;b_query;b_refresh;b_blank;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_filteron;b_query;b_refresh;b_blank;b_approve;b_reject;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_filteron;b_query;b_refresh;b_blank;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_filteron;b_query;b_refresh;b_blank;b_approve;b_reject;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_filteron;b_query;b_refresh;b_blank;b_approve;b_reject;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_filteron;b_query;b_refresh;b_blank;b_approve;b_reject;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =   'b_pr;b_so_return;b_goods_delivery;b_sal_invoice;'
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
laa_value[2] = 'req_approve'
ldw_main.f_add_where('doc_type;status;',laa_value[])

return 0

end event

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.dynamic f_set_ii_fixedpart2_height(600 )
iw_display.dynamic f_set_ii_upperpart_height(1100)
iw_display.dynamic f_set_ii_gb_3_height( 520)
return 0
end event

event e_window_e_approved;call super::e_window_e_approved;t_dw_mpl	ldw_main
string			ls_dwmain_filter,ls_filter

ldw_main = iw_display.f_get_dwmain( )
ls_dwmain_filter = this.is_dwmain_filter
ls_filter = "status = 'req_approve'"
if trim(ls_dwmain_filter) <> '' then ls_filter = ls_filter + ' AND ' + ls_dwmain_filter
ldw_main.setfilter( ls_filter)
ldw_main.filter( )
if ldw_main.getrow( ) = 1 or ldw_main.getrow( ) = ldw_main.rowcount( ) then
	ldw_main.f_filter_detail( )
end if
return 1
end event

