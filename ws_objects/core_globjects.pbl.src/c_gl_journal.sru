﻿$PBExportHeader$c_gl_journal.sru
forward
global type c_gl_journal from b_doc
end type
end forward

global type c_gl_journal from b_doc
end type
global c_gl_journal c_gl_journal

forward prototypes
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_window ()
public subroutine f_set_str_unit ()
public subroutine f_set_str_streamvalue ()
public subroutine f_set_dwo_related ()
end prototypes

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name =  'b_pur_invoice;b_sal_invoice_return;'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_document_grid'
istr_dwo[1].s_dwo_form = 'd_document_form'
istr_dwo[1].s_dwo_grid = 'd_document_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_gl_journal_form;' 
istr_dwo[1].b_ref_table_yn  = true
istr_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;doc_type;VERSION_ID;'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_gb_name = 'gb_6'
istr_dwo[1].s_description = 'Phiếu hạch toán tổng hợp'

istr_dwo[2].s_dwo_default =  'd_gl_journal_form'
istr_dwo[2].s_dwo_form = 'd_gl_journal_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = true
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_details = 'd_gl_journal_line_grid;'
istr_dwo[2].s_dwo_master = 'd_document_grid;'
istr_dwo[2].s_master_keycol = 'ID;'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[2].b_ref_table_yn  = true
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE;doc_type;id;'
istr_dwo[2].b_relation_1_1 = true
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_focus_master = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_description = 'Thông tin phiếu hạch toán tổng hợp'

istr_dwo[3].s_dwo_default =  'd_gl_journal_line_grid'
istr_dwo[3].s_dwo_form = ''
istr_dwo[3].s_dwo_grid = 'd_gl_journal_line_grid'
istr_dwo[3].b_master = true
istr_dwo[3].b_detail = true
istr_dwo[3].b_cascade_del = true
istr_dwo[3].s_dwo_details = 'd_post_line_grid;'
istr_dwo[3].s_dwo_master = 'd_gl_journal_form;'
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
istr_dwo[3].b_focus_master = false
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].s_gb_name = 'gb_7'
istr_dwo[3].s_description = 'Chi tiết phiếu hạch toán tổng hợp'

istr_dwo[4].s_dwo_default =  'd_post_line_grid'
istr_dwo[4].s_dwo_form = ''
istr_dwo[4].s_dwo_grid = 'd_post_line_grid'
istr_dwo[4].b_detail = true
istr_dwo[4].s_dwo_master = 'd_gl_journal_line_grid;'
istr_dwo[4].s_master_keycol = 'ID;'
istr_dwo[4].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[4].b_ref_table_yn  = false
istr_dwo[4].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[4].b_insert = false
istr_dwo[4].b_update = true
istr_dwo[4].b_delete = true
istr_dwo[4].b_query = true
istr_dwo[4].b_print = true
istr_dwo[4].b_excel = true
istr_dwo[4].b_traceable = true
istr_dwo[4].b_keyboardlocked = true
istr_dwo[4].b_focus_master = false 
istr_dwo[4].s_gb_name = 'gb_8'
istr_dwo[4].s_description = 'Thông tin định khoản'

end subroutine

public subroutine f_set_str_unit ();//--Datawindow chứa các cột cần làm tròn--//
istr_unit[1].s_dwo_handing = ';;d_gl_journal_line_grid;d_gl_journal_line_grid;d_gl_journal_form;'
//--Các cột cần làm tròn, nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = ';;amount;base_amount;exchange_rate'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[1].s_dwo_unit = ';;d_gl_journal_form;d_gl_journal_form;d_gl_journal_form;'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = ';;uom_code;uom_code;exchange_rate'
//--Loại làm tròn --//
istr_unit[1].s_type = ';;amount;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[1].s_dwo_object = 'd_gl_journal_line_grid;'
//--Cột chứa mã đơn vị--//
istr_unit[1].s_colname_object = 'object_code'
end subroutine

public subroutine f_set_str_streamvalue ();//istr_streamvalue[1].s_f_obj_dwo = 'd_payment_line_grid'
//istr_streamvalue[1].s_f_obj_column = 'OBJECT_ID'
//istr_streamvalue[1].s_f_column_sv = 'F_OBJECT_ID'
//
//istr_streamvalue[1].s_t_obj_dwo = 'd_receipt_form'
//istr_streamvalue[1].s_t_obj_column = 'DR_CR_OBJECT'
//istr_streamvalue[1].s_t_column_sv = 'T_OBJECT_ID'
//
//istr_streamvalue[1].s_item_dwo = 'none'
//
//istr_streamvalue[1].s_currency_dwo = 'd_receipt_form'
//istr_streamvalue[1].s_currency_column = 'currency_id;exchange_rate;trans_date'
//istr_streamvalue[1].s_currency_column_sv = 'trans_cur_id;exchange_rate;trans_date'
//
//istr_streamvalue[1].s_value_dwo = 'd_payment_line_grid'
//istr_streamvalue[1].s_value_column = 'OBJECT_ID;amount;base_amount'
//istr_streamvalue[1].s_value_column_sv = 'item_id;trans_value;base_value'
end subroutine

public subroutine f_set_dwo_related ();//khai bao cap nhat phan bo
istr_dwo_related[1].s_related_obj_name = 'u_pur_invoice'				
istr_dwo_related[1].s_main_obj_dwo = 'd_pur_invoice_line_grid'
istr_dwo_related[1].s_main_obj_column = 'id'
istr_dwo_related[1].s_related_obj_dwo = 'd_gl_journal_line_grid'	
istr_dwo_related[1].s_related_obj_column = 'id'
istr_dwo_related[1].b_t_matching = true
istr_dwo_related[1].s_match_f_dwo[1] = 'd_pur_invoice_line_grid'
istr_dwo_related[1].s_match_t_dwo[1] = 'd_gl_journal_line_grid'
istr_dwo_related[1].s_match_f_column[1] = 'BASE_AMOUNT_EX_TAX'
istr_dwo_related[1].s_match_t_column[1] = 'BASE_AMOUNT'
istr_dwo_related[1].s_match_column[1] = 'base_value'

//nhan ban

istr_dwo_related[2].s_related_obj_name = 'u_gl_journal'					// đối tượng liên quan
istr_dwo_related[2].s_main_obj_dwo = 'd_document_grid'		//datawindow quan hệ main
istr_dwo_related[2].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[2].s_related_obj_dwo = 'd_document_grid'	// datawindow quan hệ đến
istr_dwo_related[2].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[2].b_f_matching = true
istr_dwo_related[2].s_relatedtext_column = 'code'					
istr_dwo_related[2].s_text = 'Nhân bản phiếu hạch toán tổng hợp'

istr_dwo_related[2].s_main_obj_dwo_copy[1] = 'd_document_grid' // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[1] =  'handled_by;trans_hdr_id;object_name;trans_desc;group_name;req_appr_note;appr_note;doc_type;roster_yn;'
istr_dwo_related[2].s_related_obj_dwo_copy[1] = 'd_document_grid' // datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[1] = 'handled_by;trans_hdr_id;object_name;trans_desc;group_name;req_appr_note;appr_note;doc_type;roster_yn;'
istr_dwo_related[2].s_match_f_dwo[1] = 'd_document_grid'
istr_dwo_related[2].s_match_t_dwo[1] = 'd_document_grid'

istr_dwo_related[2].s_main_obj_dwo_copy[2] = 'd_gl_journal_form' // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[2] ='currency_id;uom_code;exchange_rate;description;value_yn;'
istr_dwo_related[2].s_related_obj_dwo_copy[2] = 'd_gl_journal_form' // datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[2] = 'currency_id;uom_code;exchange_rate;description;value_yn;'  

istr_dwo_related[2].s_main_obj_dwo_copy[3] = 'd_gl_journal_line_grid' // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[3] ='dr_object_type;dr_account_code;dr_account_name;dr_account_id;dr_subaccount_code;dr_subaccount_name;dr_subaccount;'
istr_dwo_related[2].s_main_obj_column_copy[3]+='cr_object_type;cr_account_code;cr_account_name;cr_account_id;cr_subaccount_code;cr_subaccount_name;cr_subaccount;line_text;amount;base_amount;not_accept;'
istr_dwo_related[2].s_related_obj_dwo_copy[3] = 'd_gl_journal_line_grid' // datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[3]='dr_object_type;dr_account_code;dr_account_name;dr_account_id;dr_subaccount_code;dr_subaccount_name;dr_subaccount;'
istr_dwo_related[2].s_related_obj_column_copy[3]+='cr_object_type;cr_account_code;cr_account_name;cr_account_id;cr_subaccount_code;cr_subaccount_name;cr_subaccount;line_text;amount;base_amount;not_accept;'

istr_dwo_related[2].s_main_obj_column_chk[3] = ''
istr_dwo_related[2].s_related_obj_column_chk[3] = ''
istr_dwo_related[2].s_match_f_dwo[3] = ''
istr_dwo_related[2].s_match_t_dwo[3] = ''
istr_dwo_related[2].s_match_f_column[3] = ''
istr_dwo_related[2].s_match_t_column[3] = ''
istr_dwo_related[2].s_match_column[3] = ''
istr_dwo_related[2].s_main_obj_column_sum[3] = ''
istr_dwo_related[2].s_related_obj_column_sum[3] = ''
istr_dwo_related[2].s_f_obj_column_chk[3] = ''
istr_dwo_related[2].s_t_obj_column_chk[3] = ''
istr_dwo_related[2].b_f_sum[3] = false

istr_dwo_related[3].s_related_obj_name = 'b_view'					// đối tượng liên quan
istr_dwo_related[3].s_main_obj_dwo = 'd_document_grid'		//datawindow quan hệ main
istr_dwo_related[3].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[3].s_related_obj_dwo = 'dv_gl_journal_form'	// datawindow quan hệ đến
istr_dwo_related[3].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[3].s_relatedtext_column = 'code'					
istr_dwo_related[3].s_text = 'In phiếu hạch toán'

istr_dwo_related[3].s_related_obj_name = 'b_view'					// đối tượng liên quan
istr_dwo_related[3].s_main_obj_dwo = 'd_document_grid'		//datawindow quan hệ main
istr_dwo_related[3].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[3].s_related_obj_dwo = 'dv_accounting_form'	// datawindow quan hệ đến
istr_dwo_related[3].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[3].s_relatedtext_column = 'code'					
istr_dwo_related[3].s_text = 'Chứng từ kế toán'
end subroutine

on c_gl_journal.create
call super::create
end on

on c_gl_journal.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = true
is_display_model = '4dgb'
ib_display_text = false
is_object_title = 'Phiếu hạch toán tổng hợp'
is_exrate_type = 'buy'
istr_actionpane[1].s_button_name = 'b_add_multi;b_insert;b_modify;b_save; b_saveclose;b_filteron;b_query;b_refresh;b_delete;b_view_multi;b_total;b_post;b_unpost;b_send_2_approve;b_request_2_change;b_approve;b_reject;'
istr_actionpane[1].s_button_has_sub = 'b_add_multi;b_view_multi'
istr_actionpane[1].sa_sub_button[1]='b_add;b_copyt_seft;'
istr_actionpane[1].sa_sub_button[2]='b_view_gl_journal;b_view_accounting;'

istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_description = is_object_title
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
				if ldw_focus.dynamic f_get_ib_detail() then //--DETIAL--//
					if ib_changed_dwo_4edit then
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_view_multi;b_amortize;b_post;b_account_view;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_view_multi;b_amortize;b_post;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_view_multi;b_total;b_post;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query; b_refresh;b_delete;b_cancel;b_view_multi;b_total;b_post;'
						end if
					end if
				else	//-- MASTER--//			
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_view_multi;b_amortize;b_post;b_account_view;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_view_multi;b_amortize;b_post;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
//				istr_actionpane[li_idx].s_visible_buttons =   'b_sal_invoice;b_sal_invoice_return;'
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
//--form parm--//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '=GL_JOURNAL'
ldw_main.f_add_where('doc_type;',laa_value[])
return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;decimal				ldc_exc
double				ldb_currency_id, ldb_base_round_id,ldb_round_id,ldb_base_amount,ldb_amount
int						li_tax_percent,li_idx, ll_row
string					ls_include_tax_yn
t_dw_mpl			ldw_object, ldw_main, ldw_tmp
c_unit_instance		lc_unit

if AncestorReturnValue = 1 then return 1

ldw_main = iw_display.f_get_dwmain( )
ldw_tmp = iw_display.f_get_dw('d_gl_journal_form')
ldb_currency_id = ldw_tmp.getitemnumber( ldw_tmp.getrow(),'CURRENCY_ID') 
if ldb_currency_id > 0 then
	ldb_round_id = lc_unit.f_get_round_id( ldb_currency_id, 0, 'amount')
	ldb_base_round_id = lc_unit.f_get_round_id( 0, 0, 'bc')
end if
if mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_gl_journal' then
	choose case vs_colname
		case 'uom_code','exchange_rate'
			if vs_colname = 'uom_code' then 
				ldc_exc = this.f_get_exchange_rate( vs_editdata,today())
				rpo_dw.setitem(vl_currentrow,'exchange_rate',ldc_exc)
			elseif vs_colname = 'exchange_rate' then 
				ldc_exc = dec(vs_editdata)
			else
				ldc_exc = rpo_dw.getitemnumber(vl_currentrow,'exchange_rate')
			end if
			ldw_object = iw_display.dynamic f_get_dw('d_gl_journal_line_grid')
			for ll_row=1 to ldw_object.rowcount( )
				ldb_amount = ldw_object.getitemnumber( ll_row , 'amount')
				if not isnull(ldb_amount) then 
					ldb_base_amount = lc_unit.f_round(ldw_main, ldb_base_round_id,ldb_amount*ldc_exc)
					ldw_object.setitem(ll_row , 'base_amount',ldb_base_amount)
				end if
			next
			end choose
elseif mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_gl_journal_line' then
	if vs_colname='amount' then
		ldc_exc=ldw_tmp.getitemnumber( ldw_tmp.getrow( ),'exchange_rate')
		ldb_base_amount = lc_unit.f_round(ldw_main, ldb_base_round_id,dec(vs_editdata) * ldc_exc)
		rpo_dw.setitem(vl_currentrow, 'base_amount',ldb_base_amount)
	end if
elseif mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_document' then
	if vs_colname = 'document_date' then
		ldw_object = iw_display.dynamic f_get_dw('d_gl_journal_form')
		ldw_object.setitem(ldw_object.getrow(),'trans_date', date(vs_editdata))
	end if	
end if
return AncestorReturnValue

end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;long		ll_row,ll_line_no,ll_trans_hdr_id,ll_idx
t_dw_mpl 	ldw_add_row,ldw_main

if pos(rpo_dw.dataobject,'d_document') > 0 then
	 rpo_dw.setitem(vl_currentrow,'doc_type','GL_JOURNAL')
elseif mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5)='d_gl_journal_line' then
	if vl_currentrow = 1 and  rpo_dw.rowcount()=0 then
		ll_line_no = vl_currentrow
	else
		ll_line_no = vl_currentrow
		for ll_idx = vl_currentrow + 1 to rpo_dw.rowcount()
			rpo_dw.setitem(ll_idx,'line_no',ll_idx)
		next
	end if
	if  vl_currentrow = 1 then
		ldw_main=iw_display.dynamic f_get_dw('d_gl_journal_form')
			rpo_dw.setitem(vl_currentrow,'line_text',ldw_main.getitemstring(ldw_main.getrow(),'description'))
	end if
	rpo_dw.setitem(vl_currentrow,'line_no',ll_line_no)
	ldw_main = iw_display.dynamic f_get_dwmain()
elseif mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5)='d_gl_journal'  then
	rpo_dw.setitem(vl_currentrow,'doc_type','GL_JOURNAL')
	rpo_dw.setitem( vl_currentrow, 'VERSION_NO', 1)
	rpo_dw.setitem( vl_currentrow, 'trans_date', date(gd_session_date))
end if
return vl_currentrow
end event

event e_window_e_preopen;call super::e_window_e_preopen;//--resize parm --//
iw_display.f_set_ii_fixedpart2_height(300)
iw_display.f_set_ii_gb_3_height( 800)
return 0
end event

event e_window_e_amortize;call super::e_window_e_amortize;iw_display.f_openchildwithparm('s_w_multi','u_amortize;0')
return 0
end event

