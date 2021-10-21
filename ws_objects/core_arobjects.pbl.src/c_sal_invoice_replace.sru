$PBExportHeader$c_sal_invoice_replace.sru
forward
global type c_sal_invoice_replace from c_sal_invoice
end type
end forward

global type c_sal_invoice_replace from c_sal_invoice
end type
global c_sal_invoice_replace c_sal_invoice_replace

forward prototypes
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_related ()
end prototypes

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name =  'b_sal_invoice;'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_dwo_related ();//-- chờ xử lý --//

istr_dwo_related[1].s_related_obj_name = 'u_sal_invoice'					// đối tượng liên quan
istr_dwo_related[1].s_main_obj_dwo = 'd_document_ar_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'd_document_ar_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].b_t_matching = true
istr_dwo_related[1].s_relatedtext_column = 'doc_code'					
istr_dwo_related[1].s_text = 'Hóa đơn bán từ:'
istr_dwo_related[1].s_match_f_dwo[1] = 'd_sal_invoice_line_grid'
istr_dwo_related[1].s_match_t_dwo[1] = 'd_sal_invoice_line_grid'
istr_dwo_related[1].s_match_f_column[1] = 'act_qty'
istr_dwo_related[1].s_match_t_column[1] = 'act_qty'
istr_dwo_related[1].s_match_column[1] = 'qty'

istr_dwo_related[2].s_related_obj_name = 'u_map_invoice'
istr_dwo_related[2].s_main_obj_dwo = 'd_order_so_form'
istr_dwo_related[2].s_main_obj_column = 'bill_to_object'
istr_dwo_related[2].s_related_obj_dwo = 'd_address_map_form'
istr_dwo_related[2].s_related_obj_column = 'object_id'

istr_dwo_related[3].s_related_obj_name = 'u_map_delivery'
istr_dwo_related[3].s_main_obj_dwo = 'd_order_so_form'
istr_dwo_related[3].s_main_obj_column = 'object_id'
istr_dwo_related[3].s_related_obj_dwo = 'd_address_map_form'
istr_dwo_related[3].s_related_obj_column = 'object_id'
end subroutine

on c_sal_invoice_replace.create
call super::create
end on

on c_sal_invoice_replace.destroy
call super::destroy
end on

event constructor;call super::constructor;is_object_title = 'Hóa đơn thay thế'
is_exrate_type = 'buy'
istr_actionpane[1].s_button_name = 'b_add_multi;b_join_multi;b_insert;b_modify;b_save; b_saveclose;b_delete;b_cancel;b_total;b_post;b_unpost;b_account_view;b_send_2_approve;b_request_2_change;b_approve;b_reject;'
istr_actionpane[1].s_button_has_sub = 'b_add_multi;b_join_multi;'
istr_actionpane[1].sa_sub_button[1]='b_add;b_copyf_sal_invoice;'
istr_actionpane[1].sa_sub_button[2]='b_copyl_sal_invoice;'
istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_description = is_object_title
end event

event e_action_ctrl_bttn;//-- override --//
datawindow				ldw_focus
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_blank;b_blank;b_post;b_account_view;b_blank;b_send_2_approve;b_blank;b_approve;b_reject;'																		   
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_blank;b_blank;b_post;b_account_view;b_blank;b_send_2_approve;b_blank;b_approve;b_reject;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query; b_refresh;b_delete;b_cancel;b_blank;b_total;b_blank;b_blank;b_post;b_account_view;b_blank;b_send_2_approve;b_blank;b_approve;b_reject;'													   
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query; b_refresh;b_delete;b_cancel;b_blank;b_total;b_blank;b_blank;b_post;b_account_view;b_blank;b_send_2_approve;b_blank;b_approve;b_reject;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons= 'b_add_multi;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_blank;b_blank;b_post;b_account_view;b_blank;b_send_2_approve;b_blank;b_approve;b_reject;'
																	          
					else
						istr_actionpane[li_idx].s_visible_buttons= 'b_add_multi;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_blank;b_blank;b_post;b_account_view;b_blank;b_send_2_approve;b_blank;b_approve;b_reject;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =   'b_sal_invoice;'
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

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;
if pos(rpo_dw.dataobject,'d_invoice_') > 0 then
	rpo_dw.setitem(vl_currentrow,'doc_type','SAL_INVOICE_REPLACE')
end if
return vl_currentrow
end event

event e_window_open;//-- override --//
t_dw_mpl			ldw_main
b_obj_instantiate		lobj_ins
any				laa_value[],laa_null[]
string 			ls_int_string

//--form parm--//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '=SAL_INVOICE_REPLACE'
ldw_main.f_add_where('doc_type;',laa_value[])

if ids_tax_authority.rowcount() = 0 then
	laa_value[1] = '>0'
	ls_int_string = 'object_ref_id;'
	if lobj_ins.f_is_branch_yn('u_tax_authority') then
		laa_value[2] = gdb_branch
		ls_int_string = 'object_ref_id;branch_id;'
	end if			
	
	this.f_init_object_table(ids_tax_authority, 'd_tax_authority_form', ls_int_string,laa_value[],laa_null[])
end if
if ids_currency.rowcount( ) = 0 then
	laa_value[1] = '=Y'
	this.f_init_object_table(ids_currency, 'd_currency_grid', 'base_yn',laa_value, laa_null[])
end if

return 0
end event

event e_window_e_prepost;/*********************************************************************************************************
Chức năng: kiểm tra logic ghi sổ của hóa đơn
	- HĐ kết với phiếu xuất kho : chỉ được chọn ghi số giá trị ; ngày ghi sổ HĐ >= ngày ghi sổ phiếu xuất kho; phiếu xuất kho phải ghi sổ trước.
	- HĐ độc lập: không được phép chỉ chọn ghi sổ số lượng mà không chọn ghi sồ giá trị nhưng có thể ghi số giá trị mà không SL.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

=============================================================================================*/
int				li_cnt, li_idx
double		ladb_related_doc_id[], ldb_doc_id
string			ls_doctype_related, ls_doc_code_related, ls_doctype, ls_doc_code, ls_status, ls_status_related, ls_qty_yn, ls_value_yn
date			ld_bookeddate_related, ld_bookeddate

t_dw_mpl			ldw_main
c_dwservice			lc_dwservice

ldw_main = this.iw_display.f_get_dwmain( )
ldb_doc_id = ldw_main.getitemnumber(ldw_main.getrow( ), 'id')
lc_dwservice.f_get_qty_and_value_yn(ldb_doc_id, ls_qty_yn, ls_value_yn)

li_cnt = this.f_get_f_doc_id(ldb_doc_id,ladb_related_doc_id[] )
if li_cnt >  0 then
	this.f_get_doc_info(ldb_doc_id, ls_doctype, ld_bookeddate, ls_status, ls_doc_code)
	FOR li_idx = 1 to li_cnt
		this.f_get_doc_info(ladb_related_doc_id[li_idx], ls_doctype_related, ld_bookeddate_related,ls_status_related, ls_doc_code_related)
		if ls_doctype_related = 'GOODS_RECEIPT' then
			if ls_qty_yn = 'Y' then
				gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.01','Thông báo','Hóa đơn kết với phiếu nhập kho không được chọn ghi sổ số lượng:@'+ls_doc_code_related,'exclamation','ok',1)
				return -1				
			end if
			if pos(ls_status_related+';','booked;invoiced;partial_invoice;partial_receive;approved') > 0 then
				gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.02','Thông báo','Phiếu nhập kho của hóa đơn chưa ghi sổ:@'+ls_doc_code_related,'exclamation','ok',1)
				return -1
			end if
			if ld_bookeddate_related > ld_bookeddate then
				gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.03','Thông báo','Hóa đơn không được phép ghi sổ trước ngày nhập kho, phiếu nhập kho :@'+ls_doc_code_related+'@-ngày:'+ string(ld_bookeddate_related, gs_w_date_format ),'exclamation','ok',1)
				return -1
			end if
		end if
	NEXT
else 
	if ls_qty_yn = 'Y' and ls_value_yn = 'N' then
		gf_messagebox('m.c_sal_invoice_return.e_window_e_prepost.04','Thông báo','Hóa đơn không được phép ghi sổ số lượng mà không ghi sổ giá trị!' ,'exclamation','ok',1)
		return -1		
	end if
end if
return 0
end event

