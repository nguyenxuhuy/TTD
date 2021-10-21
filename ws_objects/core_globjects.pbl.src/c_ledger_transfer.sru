$PBExportHeader$c_ledger_transfer.sru
forward
global type c_ledger_transfer from b_doc
end type
end forward

global type c_ledger_transfer from b_doc
boolean ib_copy_line = true
event type integer e_action_transfer_profit ( )
event type integer e_action_transfer_tax ( )
end type
global c_ledger_transfer c_ledger_transfer

forward prototypes
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_window ()
public subroutine f_set_str_unit ()
end prototypes

event type integer e_action_transfer_profit();t_dw_mpl  ldw_master,ldw_legder_transfer_line
int 			li_rtn
ldw_master=iw_display.f_get_dw('d_gl_transfer_form')
ldw_legder_transfer_line=iw_display.f_get_dw( 'd_gl_journal_line_gird')
li_rtn=this.f_set_dw_ledger_transfer_line( ldw_legder_transfer_line, ldw_master, 'profit')
return li_rtn


end event

event type integer e_action_transfer_tax();t_dw_mpl  	ldw_master,	ldw_legder_transfer_line
int 			li_rtn


ldw_master=iw_display.f_get_dw('d_gl_transfer_form')
ldw_legder_transfer_line=iw_display.f_get_dw( 'd_gl_journal_line_gird')
li_rtn=this.f_set_dw_ledger_transfer_line( ldw_legder_transfer_line, ldw_master, 'tax')
return li_rtn


end event

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name =  ''
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
istr_dwo[1].s_dwo_details = 'd_gl_transfer_form;' 
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
istr_dwo[1].s_description = 'Phiếu kết chuyển'

istr_dwo[2].s_dwo_default =  'd_gl_transfer_form'
istr_dwo[2].s_dwo_form = 'd_gl_transfer_form'
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
istr_dwo[2].b_focus_master = false
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_description = 'Thông tin phiếu kết chuyển'


istr_dwo[3].s_dwo_default =  'd_gl_journal_line_grid'
istr_dwo[3].s_dwo_form = 'd_gl_journal_line_form'
istr_dwo[3].s_dwo_grid = 'd_gl_journal_line_grid'
istr_dwo[3].s_dwo_source = 'd_gl_transfer_form'
istr_dwo[3].s_col_source = 'description'
istr_dwo[3].s_col_target = 'line_text'
istr_dwo[3].b_master = true
istr_dwo[3].b_detail = true
istr_dwo[3].b_cascade_del = true
istr_dwo[3].s_dwo_details = 'd_post_line_invoice_grid;'
istr_dwo[3].s_dwo_master = 'd_gl_transfer_form;'
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
istr_dwo[3].s_description = 'Chi tiết'
istr_dwo[3].s_gb_name = 'gb_7'

istr_dwo[4].s_dwo_default =  'd_post_line_invoice_grid'
istr_dwo[4].s_dwo_form = ''
istr_dwo[4].s_dwo_grid = 'd_post_line_invoice_grid'
istr_dwo[4].b_master = false
istr_dwo[4].b_detail = true
istr_dwo[4].b_cascade_del = false
istr_dwo[4].s_dwo_details = ''
istr_dwo[4].s_dwo_master = 'd_gl_journal_line_grid;'
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
istr_dwo[4].b_focus_master = false
istr_dwo[4].b_keyboardlocked = true
istr_dwo[4].s_description = 'Định khoản'
istr_dwo[4].s_gb_name = 'gb_8'



end subroutine

public subroutine f_set_str_unit ();//--Datawindow chứa các cột cần làm tròn--//
istr_unit[1].s_dwo_handing = 'd_gl_journal_line_grid;d_gl_journal_line_grid;d_gl_journal_line_grid;d_gl_journal_line_grid;d_gl_journal_form;'
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = '"";"";amount;base_amount;exchange_rate'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[1].s_dwo_unit = 'd_gl_journal_line_grid;d_gl_journal_form;d_gl_journal_form;d_gl_journal_form;d_gl_journal_form'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = 'uom_code;uom_code;uom_code;uom_code;exchange_rate'
//--Loại làm tròn --//
istr_unit[1].s_type = 'item;price;amount;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[1].s_dwo_object = 'd_gl_journal_line_grid'
//--Cột chứa mã đơn vị--//
istr_unit[1].s_colname_object = 'object_code'


end subroutine

on c_ledger_transfer.create
call super::create
end on

on c_ledger_transfer.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = true
is_display_model = '4dgb'
ib_display_text = false
is_object_title = 'Phiếu kết chuyển '
is_exrate_type = 'buy'
istr_actionpane[1].s_button_name = 'b_add;b_insert;b_modify;b_save; b_saveclose;b_filteron;b_query;b_refresh;b_delete;b_total;b_post;b_unpost;b_transfer_multi;b_send_2_approve;b_request_2_change;b_approve;b_reject;'
istr_actionpane[1].s_button_has_sub = 'b_transfer_multi;'
istr_actionpane[1].sa_sub_button[1]='b_transfer_profit;b_transfer_tax;'
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
				if ldw_focus.dynamic f_get_ib_detail() then
					if ib_changed_dwo_4edit then
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_total;b_post;b_account_view;b_transfer_multi;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_total;b_post;b_transfer_multi;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query; b_refresh;b_delete;b_cancel;b_total;b_post;b_transfer_multi;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_total;b_post;b_account_view;b_transfer_multi;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_total;b_post;b_transfer_multi;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =   'b_sal_invoice;b_sal_invoice_return;'
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
laa_value[1] = '=LEDGER_TRANSFER'
ldw_main.f_add_where('doc_type;',laa_value[])
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.dynamic f_set_ii_fixedpart2_height(250 )
iw_display.dynamic f_set_ii_upperpart_height(1100)
return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;decimal			ldc_price,ldc_amount,ldc_disc_amt,ldc_disc_pct,ldc_exc,ldc_qty,ldc_tax
int					li_tax_percent,li_idx, ll_row
string				ls_include_tax_yn
datawindow	ldw_object

if AncestorReturnValue = 1 then return 1

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
				ldc_amount = ldw_object.getitemnumber( ll_row , 'amount')
				if not isnull(ldc_amount) then ldw_object.setitem(ll_row , 'base_amount',ldc_amount*ldc_exc)
			next
			case 'description'
				ldw_object=iw_display.dynamic f_get_dw('d_gl_journal_line_grid')
				if ldw_object.rowcount( )>0 then 
					for ll_row=1 to ldw_object.rowcount( )
						ldw_object.setitem( ll_row,'line_text',vs_editdata)
					next
				end if
			end choose
//elseif mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_gl_journal_line' then
//	if vs_colname='amount' then
//		ldw_object=iw_display.dynamic f_get_dw('d_gl_journal_form')
//		ldc_exc=ldw_object.getitemnumber( ldw_object.getrow( ),'exchange_rate')
//		rpo_dw.setitem(vl_currentrow, 'base_amount',dec(vs_editdata)*ldc_exc)
//	end if
elseif mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_document' then
	if vs_colname = 'document_date' then
		ldw_object = iw_display.f_get_dw('d_gl_journal_form')
		ldw_object.setitem(ldw_object.getrow(),'trans_date',date(vs_editdata))
	end if	
end if
return AncestorReturnValue

end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;long		ll_row,ll_line_no,ll_trans_hdr_id,ll_idx
t_dw_mpl 	ldw_add_row,ldw_main

if pos(rpo_dw.dataobject,'d_document') > 0 then
	 rpo_dw.setitem(vl_currentrow,'doc_type','LEDGER_TRANSFER')
	 
elseif mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5)='d_gl_journal_line' then
	if vl_currentrow = 1 and  rpo_dw.rowcount()=0 then
		ll_line_no = vl_currentrow
	else
		ll_line_no = vl_currentrow
		for ll_idx = vl_currentrow + 1 to rpo_dw.rowcount()
			rpo_dw.setitem(ll_idx,'line_no',ll_idx)
		next
	end if
	//if  vl_currentrow=1 then
		//ldw_main=iw_display.dynamic f_get_dw('d_gl_journal_form')
		//	rpo_dw.setitem(vl_currentrow,'line_text',ldw_main.getitemstring(ldw_main.getrow(),'description'))
//	end if
	rpo_dw.setitem(vl_currentrow,'line_no',ll_line_no)
	ldw_main = iw_display.dynamic f_get_dwmain()
elseif mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5)='d_gl_transfer'  then
	rpo_dw.setitem(vl_currentrow,'doc_type','LEDGER_TRANSFER')
	rpo_dw.setitem( vl_currentrow, 'VERSION_NO', 1)
	rpo_dw.setitem( vl_currentrow, 'trans_date', date(gd_session_date))
	rpo_dw.setitem( vl_currentrow, 'value_yn','Y')
	
end if
return vl_currentrow
end event

event e_window_e_postsave;call super::e_window_e_postsave;iw_display.event e_refresh( )
return 1
end event

