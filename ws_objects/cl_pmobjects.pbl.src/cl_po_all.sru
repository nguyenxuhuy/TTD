$PBExportHeader$cl_po_all.sru
forward
global type cl_po_all from c_po_all
end type
end forward

global type cl_po_all from c_po_all
end type
global cl_po_all cl_po_all

on cl_po_all.create
call super::create
end on

on cl_po_all.destroy
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_join_multi;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_detail;b_blank;b_copyt_multi;b_blank;b_view_po;b_blank;b_send_2_approve;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_detail;b_blank;b_copyt_multi;b_blank;b_view_po;b_blank;b_send_2_approve;b_approve;b_reject;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_detail;b_blank;b_copyt_multi;b_blank;b_view_po;b_blank;b_send_2_approve;b_total;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query; b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_detail;b_blank;b_copyt_multi;b_blank;b_view_po;b_blank;b_send_2_approve;b_total;b_approve;b_reject;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_filteron;b_query;b_refresh;b_blank;b_total;b_detail;b_blank;b_copyt_multi;b_view_po;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_filteron;b_query;b_refresh;b_blank;b_total;b_detail;b_blank;b_copyt_multi;b_view_po;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =   'b_pr;b_po_return;b_goods_receipt;b_pur_invoice;'
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

event constructor;call super::constructor;is_object_title = 'Đơn đặt mua tổng hợp'
is_table = 'DOCUMENT'
ib_changed_dwo_4edit = true
is_display_model = '5dgb'
ib_display_text = false
is_exrate_type = 'sell'
istr_actionpane[1].s_button_name = 'b_filteron;b_query;b_refresh;b_view_po;b_total;b_detail;b_copyt_multi;'
istr_actionpane[1].s_button_has_sub = 'b_copyt_multi;'
istr_actionpane[1].sa_sub_button[1]='b_copyt_po_return;b_copyt_goods_receipt;b_copyt_pur_invoice;b_copyt_so;'
istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_description = is_object_title
end event

