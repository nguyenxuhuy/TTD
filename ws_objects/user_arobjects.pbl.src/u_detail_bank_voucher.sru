$PBExportHeader$u_detail_bank_voucher.sru
forward
global type u_detail_bank_voucher from b_detail
end type
end forward

global type u_detail_bank_voucher from b_detail
event type integer e_action_item_label ( )
event type integer e_action_total_disc ( )
end type
global u_detail_bank_voucher u_detail_bank_voucher

type variables
double		idb_obj_ref_id

s_str_data	istr_currency
end variables

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_related ()
end prototypes

event type integer e_action_item_label();int								li_rtn, li_idx
s_object_display			lod_item_label
s_str_dwo_related		lstr_data_related[]
t_dw_mpl					ldw_main

lod_item_label = create using 'u_item_label'

li_rtn = this.f_get_data_related(lod_item_label.classname(), lstr_data_related[])
if li_rtn = 0 then
	//-- xem lại khai báo đối tương liên quan trên object--//
	gf_messagebox('m.u_detail_pur_invoice.e_action_item_label.01','Thông báo','Không tìm thấy struct đối tượng liên quan','exclamation','ok',1)
	return -1
end if
ldw_main = iw_display.f_get_dwmain( )
FOR li_idx = 1 to ldw_main.rowcount()
	ldw_main.setitem( li_idx, 'gutter', 'Y')
NEXT

if iw_display.f_build_data_related( lstr_data_related[]) = -1 then return -1
lod_item_label.f_set_data_related(lstr_data_related[])		
lod_item_label.is_object_title = lstr_data_related[1].s_text
lod_item_label.is_win_grp = 'DOC'
lod_item_label.is_sheet_type ='DOC'
lod_item_label.is_win_name = lstr_data_related[1].s_text
li_idx= t_w_mdi.wf_open_sheet_doc(lod_item_label, 's_w_multi_ex' )
lod_item_label.post event e_window_e_change_object()
close(iw_display)
return li_idx
end event

event type integer e_action_total_disc();string						ls_status, ls_upd_colname
decimal					ldc_total_disc, ldc_total_amt, ldc_dics_pct, ldc_amount, ldc_dics_amt	, ldc_qty, ldc_price				
long						ll_row
b_popup_data			lb_popup_data
t_ds_db					lds_return				
t_dw_mpl				ldw_main
b_obj_instantiate		lb_obj

if idb_obj_ref_id > 0 then
	connect using it_transaction;
	select status into :ls_status from document where version_id = :idb_obj_ref_id using it_transaction;
	disconnect using it_transaction;
		
	if ls_status <> 'completed' and ls_status <> 'booked' then

		lb_popup_data = create b_popup_data
		lb_popup_data.f_init_popup_display( '1d', 'dp_total_disc_form','Nhập chiết khấu tổng','Chiết khấu tổng','Chiết khấu tổng', 1500, 1000)
		lb_popup_data.is_display_column = 'total_disc'
		openwithparm(s_wr_multi, lb_popup_data)
		lds_return = message.powerobjectparm
		if isvalid(lds_return) then
			setnull( message.powerobjectparm)
			if lds_return.rowcount( ) > 0 then
				ldc_total_disc = lds_return.getitemnumber( 1, 'total_disc')
				if isnull(ldc_total_disc) then  ldc_total_disc = 0 
				ldw_main = iw_display.f_get_dwmain( )
				ldc_total_amt = dec(ldw_main.Describe("Evaluate('Sum(amount)', 0)"))
				if  ldc_total_amt > 0 then
					ldc_dics_pct = int(ldc_total_disc/ldc_total_amt *100)															
					FOR ll_row = 1 to ldw_main.rowcount()
						ldc_qty = ldw_main.getitemnumber(ll_row , 'qty')
						if isnull(ldc_qty) then ldc_qty = 0
						ldc_price	 = ldw_main.getitemnumber(ll_row , 'price')
						if isnull(ldc_price) then ldc_price = 0
						ldc_amount =ldc_price * ldc_qty
						
						if ll_row = ldw_main.rowcount() then 
							ldc_dics_amt = ldc_total_disc
						else
							ldc_dics_amt = round(ldc_total_disc * ldc_amount/ldc_total_amt,0)
							ldc_total_disc -= ldc_dics_amt
						end if
						ls_upd_colname = 'amount;base_amount;base_amount_ex_tax;vat_amount;disc_amt;'						
						if lb_obj.f_update_line_itemchanged_ex( 'disc_amt', string(ldc_dics_amt) , ls_upd_colname,ll_row , ldw_main, it_transaction, istr_currency) = -1 then return -1													
					NEXT
					connect using it_transaction;
					ldw_main.settransobject(it_transaction )
					if ldw_main.update( ) = 1 then
						commit using it_transaction;
					end if
					disconnect using it_transaction;
				end if
			end if			
		end if
	else
		gf_messagebox('m.u_detail_pur_invoice.e_action_total_disc.01','Thống báo','Phiếu đã hoàn tất không được chỉnh sửa','information','ok',1)
	end if	
end if
return 0
end event

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_payment_line_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_payment_line_grid'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = false
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Chi tiết phiếu chi'
end subroutine

public subroutine f_set_dwo_related ();// Đối tượng liên quan
istr_dwo_related[1].s_related_obj_name = 'u_item_label'					// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = 'd_pur_invoice_line_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'd_retailed_price_upd_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].b_f_matching = false
istr_dwo_related[1].s_relatedtext_column = 'code'					
istr_dwo_related[1].s_text = 'In tem từ Hoá đơn: '
end subroutine

on u_detail_bank_voucher.create
call super::create
end on

on u_detail_bank_voucher.destroy
call super::destroy
end on

event e_action_ctrl_bttn;//-- OVERRIDE--//

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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;b_item_label;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_refresh;b_delete;b_item_label;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron; b_refresh;b_delete;b_item_label;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_refresh;b_delete;b_item_label;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_refresh;b_delete;b_item_label;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_refresh;b_delete;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
				istr_actionpane[li_idx].s_visible_buttons =  'b_book;b_attach;b_note;b_doc_trace_on;b_user_trace;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
				
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;
rpo_dw.setitem(vl_currentrow, 'object_ref_table' , 'BOOKED_SLIP')
rpo_dw.setitem(vl_currentrow, 'object_ref_id' , idb_obj_ref_id)

return vl_currentrow
end event

event e_window_e_postopen;call super::e_window_e_postopen;t_dw_mpl			ldw_main
window			lw_parent

boolean			lb_editing

lw_parent = iw_display.dynamic f_getparentwindow()
ldw_main = lw_parent.dynamic f_get_dwmain()
lb_editing = ldw_main.f_get_ib_editing( )
if lb_editing then
	ldw_main = iw_display.f_get_dwmain( )
	if ldw_main.rowcount( ) > 0 then 
		iw_display.post event e_modify( )
		this.post event e_dw_e_itemfocuschanged( ldw_main, ldw_main.getrow(), 'object_code')
	else
		iw_display.post event e_add( )
	end if
end if
iw_display.event e_filteron_new( )
return 0
end event

event e_window_e_postopen_child;call super::e_window_e_postopen_child;t_dw_mpl			ldw_main
window			lw_parent
any				laa_value[]

lw_parent = iw_display.dynamic f_getparentwindow()
ldw_main = lw_parent.dynamic f_get_dwmain()
if ldw_main.getrow( ) > 0 then
	istr_currency.adb_data[1] = ldw_main.getitemnumber( ldw_main.getrow( ) , 'currency_id')
	istr_currency.adb_data[2] = ldw_main.getitemnumber( ldw_main.getrow( ) , 'exchange_rate')
	idb_obj_ref_id =  ldw_main.getitemnumber(ldw_main.getrow(),'version_id')	

	laa_value[1] = idb_obj_ref_id
	ldw_main = iw_display.f_get_dwmain()
	ldw_main.f_add_where('object_ref_id;',laa_value[])
else
	laa_value[1] = 0
	ldw_main = iw_display.f_get_dwmain()
	ldw_main.f_add_where('object_ref_id;',laa_value[])	
end if

return 0


end event

event e_dw_e_save;call super::e_dw_e_save;
b_obj_instantiate			lbo_ins
	
if lbo_ins.f_update_line_no( rpo_dw ) = -1 then return -1

return 1
end event

event e_dw_e_predelete;call super::e_dw_e_predelete;double		ldb_extend_id, ldb_ref_id, ldb_doc_id, ldb_f_doc_id
int				li_cnt
string			ls_doc_code, ls_ref_table

b_obj_instantiate		lbo_ins

	//-- check matching --//
	ldb_ref_id = rpo_dw.getitemnumber(vl_currentrow, 'id') 
	select count(id) into :li_cnt
	from matching where F_REF_ID = :ldb_ref_id using it_transaction;
	if li_cnt > 0 then
		select t_doc_id into :ldb_doc_id
			from matching where F_REF_ID = :ldb_ref_id and rownum = 1 using it_transaction;
			
		ls_doc_code = lbo_ins.f_get_doc_code( ldb_doc_id, it_transaction)
		if isnull(ls_doc_code) then ls_doc_code = ''
		gf_messagebox('m.c_qt.e_dw_e_predelete.01','Thông báo','Không xoá được phiếu đã kết với chứng từ khác, có số:@'+ls_doc_code,'stop','ok',1)
		return -1
	end if
	//-- delete matching--//
	select count(id) into :li_cnt
	from matching where t_ref_id = :ldb_ref_id using it_transaction;	
	if li_cnt > 0 then		
		//-- update status ucả t_doc_id --//
		select id into :ldb_doc_id
		from document where version_id = :idb_obj_ref_id
		using it_transaction;
		if rpo_dw.rowcount() > 1 then
			lbo_ins.f_upd_related_status_del(ldb_doc_id, 'new', 'PAYMENT_LINE', ldb_doc_id, ldb_ref_id, it_transaction)
		elseif rpo_dw.rowcount() = 1 then
			lbo_ins.f_upd_related_status_del(ldb_doc_id, 'none', 'PAYMENT_LINE', ldb_doc_id, ldb_ref_id, it_transaction)
		end if
		//-- xoá --//
//		delete from matching where t_ref_id = :ldb_ref_id using it_transaction;	
		
	end if
	

	return 1

end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;
string					ls_upd_colname
t_dw_mpl				ldw_handle
b_obj_instantiate		lb_obj

if vs_colname = 'amount' then
	//-- cập nhật các cột liên quan --//
	ls_upd_colname = 'base_amount;'
	ldw_handle = rpo_dw
	if lb_obj.f_update_line_itemchanged_ex( vs_colname, vs_editdata , ls_upd_colname,vl_currentrow , ldw_handle, it_transaction , istr_currency) = -1 then return 1
end if
return ancestorreturnvalue
end event

