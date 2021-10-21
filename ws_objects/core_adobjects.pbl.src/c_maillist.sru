$PBExportHeader$c_maillist.sru
forward
global type c_maillist from s_object_display
end type
end forward

global type c_maillist from s_object_display
end type
global c_maillist c_maillist

type variables
boolean 			ib_drag
int					ii_clicked_pointerX,ii_clicked_pointerY
b_callback		ic_callback
b_multithread	ic_multithread

end variables

forward prototypes
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_tabpage ()
end prototypes

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_maillist_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_maillist_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].b_traceable = true
istr_dwo[1].s_dwo_details = 'd_maillist_line_grid;'
istr_dwo[1].s_dwo_shared = 'd_maillist_body_form;d_maillist_footer_form;d_maillist_header_form;'
istr_dwo[1].b_ref_table_yn  = false
istr_dwo[1].s_ref_table_field = ''
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Danh sách nhóm gửi mail'   

istr_dwo[2].s_dwo_default =  'd_objects_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_objects_grid'
istr_dwo[2].s_dwo_master = ''
istr_dwo[2].s_dwo_details = ''
istr_dwo[2].s_master_keycol = ''
istr_dwo[2].s_detail_keycol = ''
istr_dwo[2].s_ref_table_field = ''
istr_dwo[2].b_insert = false
istr_dwo[2].b_update = false
istr_dwo[2].b_delete = false
istr_dwo[2].b_query = true
istr_dwo[2].b_print = false
istr_dwo[2].b_excel = false
istr_dwo[2].b_cascade_del = false
istr_dwo[2].b_traceable = false
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_description = 'Danh sách đối tượng gửi mail'

end subroutine

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
iastr_dwo_tabpage[1].i_leftpart_width = 1300
iastr_dwo_tabpage[1].i_fixedpart1_height = 500
iastr_dwo_tabpage[1].i_index = 1
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_maillist_line_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_maillist_line_grid'
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_maillist_grid;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol = 'ID'
iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID'
iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = true
iastr_dwo_tabpage[1].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE'
iastr_dwo_tabpage[1].str_dwo[1].b_insert = false
iastr_dwo_tabpage[1].str_dwo[1].b_update = true
iastr_dwo_tabpage[1].str_dwo[1].b_delete = true
iastr_dwo_tabpage[1].str_dwo[1].b_query = true
iastr_dwo_tabpage[1].str_dwo[1].b_print = true
iastr_dwo_tabpage[1].str_dwo[1].b_excel = true
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Chi tiêt gửi mail'
iastr_dwo_tabpage[1].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[1].s_gb_name = 'gb_6'

iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_display_model = '3gb_3d'
iastr_dwo_tabpage[2].i_index = 2
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_maillist_body_form'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = 'd_maillist_body_form'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = ''
iastr_dwo_tabpage[2].str_dwo[1].b_master = false
iastr_dwo_tabpage[2].str_dwo[1].b_detail = false
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = false
iastr_dwo_tabpage[2].str_dwo[1].b_shared = true
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_maillist_grid;'
iastr_dwo_tabpage[2].str_dwo[1].s_master_keycol = ''
iastr_dwo_tabpage[2].str_dwo[1].s_detail_keycol = ''
iastr_dwo_tabpage[2].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[2].str_dwo[1].s_ref_table_field = ''
iastr_dwo_tabpage[2].str_dwo[1].b_insert = false
iastr_dwo_tabpage[2].str_dwo[1].b_update = true
iastr_dwo_tabpage[2].str_dwo[1].b_delete = false
iastr_dwo_tabpage[2].str_dwo[1].b_query = true
iastr_dwo_tabpage[2].str_dwo[1].b_print = true
iastr_dwo_tabpage[2].str_dwo[1].b_excel = true
iastr_dwo_tabpage[2].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[2].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[2].str_dwo[1].s_description ='Nội dung'
iastr_dwo_tabpage[2].str_dwo[1].s_gb_name = 'gb_6'

iastr_dwo_tabpage[2].str_dwo[2].s_dwo_default =  'd_maillist_header_form'
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_form = 'd_maillist_header_form'
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_grid = ''
iastr_dwo_tabpage[2].str_dwo[2].b_master = false
iastr_dwo_tabpage[2].str_dwo[2].b_detail = false
iastr_dwo_tabpage[2].str_dwo[2].b_cascade_del = false
iastr_dwo_tabpage[2].str_dwo[2].b_shared = true
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_details = ''
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_master = 'd_maillist_grid;'
iastr_dwo_tabpage[2].str_dwo[2].s_master_keycol = ''
iastr_dwo_tabpage[2].str_dwo[2].s_detail_keycol = ''
iastr_dwo_tabpage[2].str_dwo[2].b_ref_table_yn  = false
iastr_dwo_tabpage[2].str_dwo[2].s_ref_table_field = ''
iastr_dwo_tabpage[2].str_dwo[2].b_insert = false
iastr_dwo_tabpage[2].str_dwo[2].b_update = true
iastr_dwo_tabpage[2].str_dwo[2].b_delete = false
iastr_dwo_tabpage[2].str_dwo[2].b_query = true
iastr_dwo_tabpage[2].str_dwo[2].b_print = true
iastr_dwo_tabpage[2].str_dwo[2].b_excel = true
iastr_dwo_tabpage[2].str_dwo[2].b_traceable = true
iastr_dwo_tabpage[2].str_dwo[2].b_keyboardlocked = true
iastr_dwo_tabpage[2].str_dwo[2].s_description ='Câu chào'
iastr_dwo_tabpage[2].str_dwo[2].s_gb_name = 'gb_7'

iastr_dwo_tabpage[2].str_dwo[3].s_dwo_default =  'd_maillist_footer_form'
iastr_dwo_tabpage[2].str_dwo[3].s_dwo_form = 'd_maillist_footer_form'
iastr_dwo_tabpage[2].str_dwo[3].s_dwo_grid = ''
iastr_dwo_tabpage[2].str_dwo[3].b_master = false
iastr_dwo_tabpage[2].str_dwo[3].b_detail = false
iastr_dwo_tabpage[2].str_dwo[3].b_cascade_del = false
iastr_dwo_tabpage[2].str_dwo[3].b_shared = true
iastr_dwo_tabpage[2].str_dwo[3].s_dwo_details = ''
iastr_dwo_tabpage[2].str_dwo[3].s_dwo_master = 'd_maillist_grid;'
iastr_dwo_tabpage[2].str_dwo[3].s_master_keycol = ''
iastr_dwo_tabpage[2].str_dwo[3].s_detail_keycol = ''
iastr_dwo_tabpage[2].str_dwo[3].b_ref_table_yn  = false
iastr_dwo_tabpage[2].str_dwo[3].s_ref_table_field = ''
iastr_dwo_tabpage[2].str_dwo[3].b_insert = false
iastr_dwo_tabpage[2].str_dwo[3].b_update = true
iastr_dwo_tabpage[2].str_dwo[3].b_delete = false
iastr_dwo_tabpage[2].str_dwo[3].b_query = true
iastr_dwo_tabpage[2].str_dwo[3].b_print = true
iastr_dwo_tabpage[2].str_dwo[3].b_excel = true
iastr_dwo_tabpage[2].str_dwo[3].b_traceable = true
iastr_dwo_tabpage[2].str_dwo[3].b_keyboardlocked = true
iastr_dwo_tabpage[2].str_dwo[3].s_description ='Câu kết'
iastr_dwo_tabpage[2].str_dwo[3].s_gb_name = 'gb_8'
end subroutine

on c_maillist.create
call super::create
end on

on c_maillist.destroy
call super::destroy
end on

event constructor;call super::constructor;ic_callback = create b_callback

is_table = 'MAILLIST'
ib_changed_dwo_4edit = false
is_display_model = '1dr_1tb_2gb_1ddlb_1dl'
ib_display_text = false
is_object_title = 'Gửi mail'

istr_actionpane[1].s_dwo_action = 'd_action_edit'
istr_actionpane[1].s_button_name = 'b_add;b_insert;b_modify;b_save;b_query;b_execquery;b_filteron;b_refresh;b_delete;b_print;b_view_report;b_sendmail;'
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title
end event

event e_action_ctrl_bttn;//-- override --//

datawindow				ldw_focus
int								li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	//-- control d_action_edit --//
	FOR li_idx = 1 to upperbound(istr_actionpane[]) 
		if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
			if ldw_focus.dynamic f_get_ib_shared() then
				ldw_focus = ldw_focus.dynamic f_getdwmaster()
			end if			
			if ldw_focus.dynamic f_get_ib_detail() then
				if ib_changed_dwo_4edit then
					if ldw_focus.dynamic f_isgrid() then
					//	istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify; b_filteron;b_query;b_refresh;b_delete;b_blank;b_copyt_so;b_copyt_goods_delivery;b_blank; b_copyt_sal_invoice;b_copyt_bank_voucher;b_copyt_receipt;b_copyt_payment;'
					else
					//	istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_filteron;b_query;b_refresh;b_delete;b_blank;b_copyt_so; b_copyt_goods_delivery;b_blank; b_copyt_sal_invoice;b_copyt_bank_voucher;b_copyt_receipt;b_copyt_payment;'
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_filteron;b_query;b_sendmail; b_refresh;b_delete;'
					else
					//	istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query; b_refresh;b_delete;b_blank;b_copyt_so;b_copyt_goods_delivery;b_blank; b_copyt_sal_invoice;b_copyt_bank_voucher;b_copyt_receipt;b_copyt_payment;'
					end if
				end if
			else				
				if ib_changed_dwo_4edit then
				//	istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_blank;b_copyt_so;b_copyt_goods_delivery;b_blank; b_copyt_sal_invoice;b_copyt_bank_voucher;b_copyt_receipt;b_copyt_payment;'
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_sendmail;b_refresh;b_delete;'
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
		//	istr_actionpane[li_idx].s_visible_buttons =   'b_so;b_so_return;b_blank;b_goods_delivery;b_goods_receipt;b_blank;b_sal_invoice;b_sal_invoice_return;b_sal_invoice_replace;b_blank;b_bank_voucher;b_bank_voucher_payment;b_receipt;b_payment;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
			istr_actionpane[li_idx].s_visible_buttons =  'b_attach;b_note;b_user_trace;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then		
		//	istr_actionpane[li_idx].s_visible_buttons =  'br_customer_balance;br_customer_balance_detail;'
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;
if rpo_dw.dataobject = 'd_maillist_grid' then
	rpo_dw.setitem(vl_currentrow,'active_yn','Y')
end if
return vl_currentrow
end event

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.dynamic f_set_ii_upperpart_height(600)
iw_display.dynamic f_set_ii_leftpart_width(3800)
return 0
end event

event e_window_open;call super::e_window_open;t_ddlb  lt_ddlb

lt_ddlb = iw_display.dynamic f_get_ddlb1()
lt_ddlb.additem( "Khách hàng")
lt_ddlb.additem( "Nhà cung cấp")
lt_ddlb.additem( "Nhân viên")
return 0
end event

event e_window_e_postopen;call super::e_window_e_postopen;t_dw_mpl	ldw_object, ldw
any			laa_data[]

ldw_object = iw_display.f_get_dw( "d_objects_grid")
laa_data[1] = "CUSTOMER;VENDOR;STAFF"
laa_data[2] = 'Y'
ldw_object.f_add_where( "object_ref_table;active_yn", laa_data)
ldw_object.event e_retrieve( )

ldw_object = iw_display.f_get_dw( "d_maillist_body_form")
ldw_object.richtexttoolbaractivation = RichTextToolbarActivationNever!

ldw_object = iw_display.f_get_dw( "d_maillist_grid")
ldw_object.richtexttoolbaractivation = RichTextToolbarActivationNever!
return 0

end event

event e_ddlb_selectionchanged;call super::e_ddlb_selectionchanged;c_dwservice		lc_dwser
t_dw_mpl		ldw_object,ldw_maillist_line
c_string			lc_string
string				ls_filter,ls_obj_code,ls_coltype,ls_colname
long				ll_idx

ldw_object = iw_display.f_get_dw( 'd_objects_grid')
ldw_maillist_line = iw_display.f_get_dw( 'd_maillist_line_grid')
ls_colname = 'code'
if ldw_maillist_line.rowcount( ) > 0 then
	for ll_idx = 1 to ldw_maillist_line.rowcount( )
		if ls_obj_code <> '' then ls_obj_code += ';'
		ls_obj_code += ldw_maillist_line.getitemstring( ll_idx, ls_colname)
	next
	ls_obj_code = '<>('+ls_obj_code+')'
	lc_dwser.f_get_build_column( ldw_object, ls_colname, ls_coltype)
	ls_filter = lc_string.f_get_expression( ls_obj_code, ls_coltype, ls_colname, 'filter')
	if ls_filter <> '' then ls_filter = ' AND ' + ls_filter
end if

choose case vl_index
	case 1
		ldw_object.setfilter( "object_ref_table = 'CUSTOMER'" + ls_filter)
	case 2
		ldw_object.setfilter( "object_ref_table = 'VENDOR'" + ls_filter)
	case 3
		ldw_object.setfilter( "object_ref_table = 'STAFF'" + ls_filter) 
end choose

ldw_object.filter( )
return 1
end event

event e_dw_rowfocuschanged;call super::e_dw_rowfocuschanged;c_dwservice		lc_dwser
t_dw_mpl		ldw_object,ldw_maillist_line
c_string			lc_string
string				ls_filter,ls_obj_code,ls_coltype,ls_colname,ls_obj_type
long				ll_idx

if rpo_dw.dataobject = 'd_maillist_grid' then
	ldw_object = iw_display.f_get_dw( 'd_objects_grid')
	ldw_maillist_line = iw_display.f_get_dw( 'd_maillist_line_grid')
	ls_colname = 'code'
	if ldw_maillist_line.rowcount( ) > 0 then
		for ll_idx = 1 to ldw_maillist_line.rowcount( )
			if ls_obj_code <> '' then ls_obj_code += ';'
			ls_obj_code += ldw_maillist_line.getitemstring( ll_idx, ls_colname)
		next
		ls_obj_code = '<>('+ls_obj_code+')'
		lc_dwser.f_get_build_column( ldw_object, ls_colname, ls_coltype)
		ls_filter = lc_string.f_get_expression( ls_obj_code, ls_coltype, ls_colname, 'filter')
		if ls_filter <> '' then ls_filter = ' AND ' + ls_filter
		if ldw_object.rowcount( ) > 0 then
			ls_obj_type = ldw_object.getitemstring( ldw_object.rowcount( ), 'object_ref_table')
			ldw_object.setfilter( "object_ref_table = '"+ls_obj_type+"'"+ls_filter)
			ldw_object.filter( )
		end if
	end if
end if

return vl_currentrow
end event

event e_dw_dragdrop;call super::e_dw_dragdrop;t_dw_mpl	ldw_main,ldw_temp
long			ll_find,ll_addrow
string			ls_table



ldw_main = iw_display.f_get_dwmain( )
if rdw_handling.dataobject = 'd_maillist_line_grid' and vdw_source.dataobject = 'd_objects_grid' then
	ldw_temp = iw_display.f_get_idwfocus( )
	iw_display.f_set_idwfocus( ldw_main)
	iw_display.event e_modify( )
	ls_table = upper(vdw_source.describe("datawindow.table.update"))
	if vdw_source.dynamic f_isgrid( ) then
		ll_find = vdw_source.find( "gutter = 'Y'", 1, vdw_source.rowcount( ) )
		if ll_find > 0 then
			Do
				ll_addrow = rdw_handling.dynamic event e_addrow( )
				rdw_handling.setitem(ll_addrow,'object_id',vdw_source.getitemnumber(ll_find,'ID'))
				rdw_handling.setitem(ll_addrow,'code',vdw_source.getitemstring(ll_find,'code'))
				rdw_handling.setitem(ll_addrow,'name',vdw_source.getitemstring(ll_find,'name'))
				rdw_handling.setitem(ll_addrow,'object_table',ls_table)
				vdw_source.setitem(ll_find,'gutter','N')
				ll_find = vdw_source.find( "gutter = 'Y'", ll_find + 1, vdw_source.rowcount( ) +1 )
			Loop While ll_find > 0
		else
			ll_addrow = rdw_handling.dynamic event e_addrow( )
			rdw_handling.setitem(ll_addrow,'object_id',vdw_source.getitemnumber(vdw_source.getrow(),'ID'))
			rdw_handling.setitem(ll_addrow,'code',vdw_source.getitemstring(vdw_source.getrow(),'code'))
			rdw_handling.setitem(ll_addrow,'name',vdw_source.getitemstring(vdw_source.getrow(),'name'))
			rdw_handling.setitem(ll_addrow,'object_table',ls_table)
		end if
	else
		ll_addrow = rdw_handling.dynamic event e_addrow( )
		rdw_handling.setitem(ll_addrow,'object_id',vdw_source.getitemnumber(vdw_source.getrow(),'ID'))
		rdw_handling.setitem(ll_addrow,'code',vdw_source.getitemstring(vdw_source.getrow(),'code'))
		rdw_handling.setitem(ll_addrow,'name',vdw_source.getitemstring(vdw_source.getrow(),'name'))
		rdw_handling.setitem(ll_addrow,'object_table',ls_table)
	end if
	iw_display.event e_save( )
	iw_display.event e_refresh( )
	iw_display.f_set_idwfocus( ldw_temp)
	this.event e_dw_rowfocuschanged( ldw_main, ldw_main.getrow( ) )
elseif rdw_handling.dataobject <> 'd_maillist_line_grid' and vdw_source.dataobject = 'd_maillist_line_grid' then
	iw_display.event e_delete( )
	this.event e_dw_rowfocuschanged( ldw_main, ldw_main.getrow( ) )
end if
vdw_source.drag(End!)
ib_drag = false
return 0
end event

event e_window_e_sendmail;call super::e_window_e_sendmail;t_transaction	lt_transaction
c_dwservice		lc_dwser
t_dw_mpl		ldw_body,ldw_header,ldw_footer,ldw_main,ldw_maillist_line
string				ls_body,ls_header,ls_footer,ls_to_email,ls_contact_name,ls_temp_hd,ls_temp_ft,ls_subject,ls_cc_mail,ls_pacth_att
long				ll_idx
any				laa_data[]
int					li_rtn

ldw_main = iw_display.f_get_dwmain( )
ldw_maillist_line = iw_display.f_get_dw( 'd_maillist_line_grid')
if ldw_main.rowcount( ) = 0 or ldw_main.getrow( ) = 0 or ldw_maillist_line.rowcount( ) = 0 then return 0
ldw_body = iw_display.f_get_dw( 'd_maillist_body_form')
ldw_header = iw_display.f_get_dw( 'd_maillist_header_form')
ldw_footer = iw_display.f_get_dw( 'd_maillist_footer_form')
ls_body = ldw_body.getitemstring( ldw_body.getrow( ) , 'body_data')
ls_header = ldw_header.getitemstring( ldw_header.getrow( ) , 'header')
ls_footer = ldw_footer.getitemstring( ldw_footer.getrow( ) , 'footer')
ls_subject = ldw_main.getitemstring( ldw_main.getrow( ) , 'subject')
laa_data[1] = ldw_main.getitemnumber(ldw_main.getrow( ) , 'id')
iw_display.f_get_transaction(lt_transaction)
if sharedobjectregister("b_multithread","i_multithread_sendmail") = Success! then
	sharedobjectGet("i_multithread_sendmail", ic_multithread)
	ic_callback.f_setdw(ldw_main )
	ic_multithread.post f_send_mail_multi(laa_data[],ls_subject,ls_header,ls_body,ls_footer,lt_transaction.servername,lt_transaction.logid,lt_transaction.logpass,ic_callback)
//	ic_multithread = create b_multithread
//	ic_multithread.f_send_mail_multi(ldw_maillist_line.dataobject,'object_ref_id',laa_data[],ls_subject,ls_header,ls_body,ls_footer,lt_transaction.servername,lt_transaction.logid,lt_transaction.logpass,ic_callback)
	SharedobjectUnregister("i_multithread_sendmail")
else

end if
return 0
end event

event e_dw_clicked;call super::e_dw_clicked;
if rdw_handling.dataobject = 'd_objects_grid' or rdw_handling.dataobject = 'd_maillist_line_grid' then
//	rdw_handling.selectrow(0,false)
//	rdw_handling.selectrow(vl_currentrow,true)
	if vl_currentrow > 0 then
		ii_clicked_pointerX = UnitsToPixels(rdw_handling.PointerX(),XUnitsToPixels!)
		ii_clicked_pointerY = UnitsToPixels(rdw_handling.PointerY(),YUnitsToPixels!)
		ib_drag = true
	end if
end if
return 0
end event

event e_dw_e_mousemove;call super::e_dw_e_mousemove;
if ib_drag then
	IF (Abs(vi_xpos - ii_clicked_pointerX) > 50) OR (Abs(vi_ypos - ii_clicked_pointerY) > 50) OR (ii_clicked_pointerX = 0) OR (ii_clicked_pointerY = 0) THEN
		rdw_handling.dragicon = gs_path_pic + '\pics\drag_drop_icon_3.ico'
		rdw_handling.drag(begin!)
	end if
end if
return 0
end event

event e_dw_e_dwnlbuttonup;call super::e_dw_e_dwnlbuttonup;
if ib_drag then
	ib_drag = false
end if
return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;if rpo_dw.dataobject = 'd_maillist_body_form' then
	rpo_dw.setitem(vl_currentrow,'body_data',vs_editdata)
end if
return AncestorReturnValue
end event

