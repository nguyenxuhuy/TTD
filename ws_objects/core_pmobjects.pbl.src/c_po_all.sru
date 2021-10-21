$PBExportHeader$c_po_all.sru
forward
global type c_po_all from c_po
end type
end forward

global type c_po_all from c_po
end type
global c_po_all c_po_all

on c_po_all.create
call super::create
end on

on c_po_all.destroy
call super::destroy
end on

event constructor;call super::constructor;is_object_title = 'Đơn đặt mua tổng hợp'
is_table = 'DOCUMENT'
ib_changed_dwo_4edit = true
is_display_model = '5dgb'
ib_display_text = false
is_exrate_type = 'sell'
istr_actionpane[1].s_button_name = 'b_add_multi;b_join_multi;b_copyt_multi;b_insert;b_modify;b_save; b_saveclose;b_filteron;b_query;b_refresh;b_delete;b_view_po;b_send_2_approve;b_request_2_change;b_total;b_approve;b_reject;'
istr_actionpane[1].s_button_has_sub = 'b_add_multi;b_join_multi;b_copyt_multi;'
istr_actionpane[1].sa_sub_button[1]='b_add;b_copyf_pr;b_copyf_prod_orders;b_copyt_seft;'
istr_actionpane[1].sa_sub_button[2]='b_copyl_pr;b_copyl_prod_orders;'
istr_actionpane[1].sa_sub_button[3]='b_copyt_po_return;b_copyt_goods_receipt;b_copyt_pur_invoice;'
istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_description = is_object_title
end event

