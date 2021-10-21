$PBExportHeader$cl_pur_invoice_all.sru
forward
global type cl_pur_invoice_all from c_pur_invoice
end type
end forward

global type cl_pur_invoice_all from c_pur_invoice
end type
global cl_pur_invoice_all cl_pur_invoice_all

on cl_pur_invoice_all.create
call super::create
end on

on cl_pur_invoice_all.destroy
call super::destroy
end on

event e_action_ctrl_bttn;call super::e_action_ctrl_bttn;t_dw_mpl				ldw_focus
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_detail;b_blank;b_allocate;b_blank;b_copyt_multi;b_blank;b_post;b_account_view;b_view_detail_pur_inv;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_join_multi;b_modify;b_blank; b_filteron;b_query;b_refresh;b_blank;b_delete;b_blank;b_total;b_detail;b_blank;b_allocate;b_blank;b_copyt_multi;b_blank;b_post;b_account_view;b_blank;b_view_detail_pur_inv;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_detail;b_blank;b_copyt_multi;b_blank;b_post;b_account_view;b_view_detail_pur_inv;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query; b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_detail;b_blank;b_copyt_multi;b_blank;b_post;b_account_view;b_view_detail_pur_inv;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_detail;b_view_invoice_goods_receipt;b_blank;b_allocate;b_blank;b_copyt_multi;b_blank;b_post;b_account_view;b_view_detail_pur_inv;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_total;b_detail;b_blank;b_allocate;b_blank;b_account_view;b_view_detail_pur_inv;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =   'b_po;b_goods_receipt;b_payment;b_bank_voucher_payment;b_pur_invoice_return;b_pur_invoice_replace;'
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

