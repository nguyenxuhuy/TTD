$PBExportHeader$cl_item.sru
forward
global type cl_item from c_item
end type
end forward

global type cl_item from c_item
end type
global cl_item cl_item

on cl_item.create
call super::create
end on

on cl_item.destroy
call super::destroy
end on

event constructor;call super::constructor;ib_changed_dwo_4edit = true
is_display_model = '2dgb_1tp'
ib_display_text = false
is_object_title = 'Sản phẩm - hàng hóa - dịch vụ'
istr_actionpane[1].s_button_name = 'b_add_multi;b_insert;b_modify;b_save;b_query;b_execquery;b_filteron;b_item_barcode;b_refresh;b_delete;b_copyt_multi;b_purchase_multi;b_sales_multi;b_web_sync;'
istr_actionpane[1].s_button_has_sub = 'b_add_multi;b_web_sync;'
istr_actionpane[1].sa_sub_button[1]='b_add;b_copyt_seft;'
istr_actionpane[1].sa_sub_button[2]='b_fr_web_prodnm;b_fr_web_prodnm_all;b_to_web_price;b_to_web_price_all;b_to_web_proditem'
//istr_actionpane[1].sa_sub_button[3]='b_copyt_po;b_copyt_pur_invoice;'
//istr_actionpane[1].sa_sub_button[4]='b_copyt_so;b_copyt_sal_invoice;'
istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title

end event

