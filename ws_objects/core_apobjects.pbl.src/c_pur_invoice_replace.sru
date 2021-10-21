$PBExportHeader$c_pur_invoice_replace.sru
forward
global type c_pur_invoice_replace from c_pur_invoice
end type
end forward

global type c_pur_invoice_replace from c_pur_invoice
end type
global c_pur_invoice_replace c_pur_invoice_replace

forward prototypes
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_related ()
end prototypes

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name =  'b_pur_invoice;'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_dwo_related ();//-- chờ xử lý --//

istr_dwo_related[1].s_related_obj_name = 'u_pur_invoice'					// đối tượng liên quan
istr_dwo_related[1].s_main_obj_dwo = 'd_document_ap_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'd_document_ap_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].b_t_matching = true
istr_dwo_related[1].s_relatedtext_column = 'code'					
istr_dwo_related[1].s_text = 'Hóa đơn mua:'
istr_dwo_related[1].s_match_f_dwo[1] = 'd_pur_invoice_line_grid'
istr_dwo_related[1].s_match_t_dwo[1] = 'd_pur_invoice_line_grid'
istr_dwo_related[1].s_match_f_column[1] = 'qty'
istr_dwo_related[1].s_match_t_column[1] = 'qty'
istr_dwo_related[1].s_match_column[1] = 'qty'

istr_dwo_related[2].s_related_obj_name = 'u_map_invoice'
istr_dwo_related[2].s_main_obj_dwo = 'd_invoice_pur_form'
istr_dwo_related[2].s_main_obj_column = 'invoice_object'
istr_dwo_related[2].s_related_obj_dwo = 'd_address_map_form'
istr_dwo_related[2].s_related_obj_column = 'object_id'

istr_dwo_related[3].s_related_obj_name = 'u_map_delivery'
istr_dwo_related[3].s_main_obj_dwo = 'd_invoice_pur_form'
istr_dwo_related[3].s_main_obj_column = 'dr_cr_object'
istr_dwo_related[3].s_related_obj_dwo = 'd_address_map_form'
istr_dwo_related[3].s_related_obj_column = 'object_id'

end subroutine

on c_pur_invoice_replace.create
call super::create
end on

on c_pur_invoice_replace.destroy
call super::destroy
end on

event constructor;call super::constructor;is_object_title = 'Hóa đơn thay thế'
is_exrate_type = 'sell'

istr_actionpane[1].s_button_name = 'b_add_multi;b_join_multi;b_insert;b_modify;b_save; b_saveclose;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_total;b_post;b_unpost;b_send_2_approve;b_request_2_change;b_approve;b_reject;'
istr_actionpane[1].s_button_has_sub = 'b_add_multi;b_join_multi;'
istr_actionpane[1].sa_sub_button[1]='b_add;b_copyf_pur_invoice;'
istr_actionpane[1].sa_sub_button[2]='b_copyl_pur_invoice;'
istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_description = is_object_title
end event

event e_action_ctrl_bttn;//-- override --//
t_dw_mpl				ldw_focus
int							li_idx

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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_blank;b_allocate;b_blank;b_blank;b_post;b_account_view;b_blank;b_send_2_approve;b_blank;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_blank;b_allocate;b_blank;b_blank;b_post;b_account_view;b_blank;b_send_2_approve;b_blank;b_approve;b_reject;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query; b_refresh;b_blank;b_delete;b_cancel;b_total;b_blank;b_blank;b_post;b_account_view;b_blank;b_send_2_approve;b_blank;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query; b_refresh;b_blank;b_delete;b_cancel;b_total;b_blank;b_blank;b_post;b_account_view;b_blank;b_send_2_approve;b_blank;b_approve;b_reject;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_join_multi;b_blank;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_blank;b_allocate;b_blank;b_blank;b_post;b_account_view;b_blank;b_send_2_approve;b_blank;b_approve;b_reject;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_join_multi;b_blank;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_total;b_blank;b_allocate;b_blank;b_blank;b_post;b_account_view;b_blank;b_send_2_approve;b_blank;b_approve;b_reject;'
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

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;

if pos(rpo_dw.dataobject,'d_invoice_pur_') > 0 then
	rpo_dw.setitem(vl_currentrow,'doc_type','PUR_INVOICE_REPLACE')
end if
return vl_currentrow
end event

event e_window_open;//-- override --//
t_dw_mpl			ldw_main
b_obj_instantiate		lobj_ins
any				laa_value[],laa_null[]
string				ls_int_string

//--form parm--//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '=PUR_INVOICE_REPLACE'
ldw_main.f_add_where('doc_type;',laa_value[])
iw_display.f_set_text_cbx_1( 'Xem tất cả các thuế', false)
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

