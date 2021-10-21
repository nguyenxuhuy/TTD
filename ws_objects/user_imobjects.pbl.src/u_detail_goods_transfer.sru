$PBExportHeader$u_detail_goods_transfer.sru
forward
global type u_detail_goods_transfer from b_detail
end type
end forward

global type u_detail_goods_transfer from b_detail
end type
global u_detail_goods_transfer u_detail_goods_transfer

type variables
double		idb_obj_ref_id
end variables

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_related ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_inventory_line_transfer_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_inventory_line_transfer_grid'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = false
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Chi tiết chuyển kho'
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

on u_detail_goods_transfer.create
call super::create
end on

on u_detail_goods_transfer.destroy
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_refresh;b_delete;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron; b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_refresh;b_delete;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_refresh;b_delete;'
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

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;double			ldb_item_id, ldb_spec_id, ldb_line_id, ll_lot_line_id, ldb_object_ref_id, ll_item_lot_id
decimal			ldb_qty
string				ls_upd_colname, ls_sql , ls_dataStr
int					li_cnt
b_obj_instantiate			lb_obj
s_str_data					lstr_cuurency
t_dw_mpl					ldw_handle

choose case vs_colname
	case 'amount' ,'qty', 'price','vat'
		if vs_colname = 'amount' then
			//-- cập nhật các cột liên quan --//
			ls_upd_colname = 'price;base_amount;base_amount_ex_tax;vat_amount;'
			ldw_handle = rpo_dw
			if lb_obj.f_update_line_itemchanged_ex( vs_colname, vs_editdata , ls_upd_colname,vl_currentrow , ldw_handle, it_transaction , lstr_cuurency) = -1 then return 1	
		elseif vs_colname =  'qty' or vs_colname =  'price' then
			//-- cập nhật các cột liện quan --//
			ls_upd_colname = 'amount;base_amount;base_amount_ex_tax;vat_amount;'
			ldw_handle = rpo_dw
			if lb_obj.f_update_line_itemchanged_ex( vs_colname, vs_editdata , ls_upd_colname,vl_currentrow , ldw_handle, it_transaction , lstr_cuurency) = -1 then return 1								
		elseif vs_colname =  'vat' then
			//-- cập nhật các cột liện quan --//
			ls_upd_colname = 'vat_amount'
			ldw_handle = rpo_dw
			if lb_obj.f_update_line_itemchanged_ex( vs_colname, vs_editdata , ls_upd_colname,vl_currentrow , ldw_handle, it_transaction , lstr_cuurency) = -1 then return 1	
		end if
	case 'lot_no', 'manufacture_date','expired_date'
//		connect using it_transaction;
//		ldb_line_id = rpo_dw.getitemnumber( vl_currentrow,'id')
//		ldb_qty =rpo_dw.getitemnumber( vl_currentrow,'qty')
//		ldb_item_id = rpo_dw.getitemnumber( vl_currentrow,'object_id')
//		if vs_colname = 'lot_no' then
//			if isnull(vs_editdata) then
//				ls_dataStr = "NULL"
//			else
//				ls_dataStr = "'" + vs_editdata + "'"
//			end if
//		else
//			if isnull(vs_editdata) or vs_editdata = '' then
//				ls_dataStr = "NULL"
//			else
//				ls_dataStr = " to_Date( '" + string(date(vs_editdata),gs_w_date_format)+"', '"+gs_w_date_format+"')"
//			end if
//		end if
//		//-- update LOT_LINE --//
//		select count(id) into :li_cnt from lot_line where object_ref_id = :ldb_line_id using it_transaction;
//		if li_cnt > 0 then
//			ls_sql = "Update lot_line set " + vs_colname + "=" + ls_dataStr + " where object_ref_id ="+string(ldb_line_id)
//		else
//			ll_lot_line_id = lb_obj.f_create_id_ex( it_transaction)
//			
//			ls_sql = "Insert into lot_line (id,company_id,branch_id,object_ref_id,object_ref_table, "+&
//						" created_by,created_date,last_mdf_by,last_mdf_date,"+&
//						"qty, "+vs_colname+")" +&
//						" VALUES ( "+string(ll_lot_line_id)+ ","+string(gi_user_comp_id  )+ ","+string(gdb_branch  )+ ","+string(ldb_line_id  ) +", 'PUR_INVOICE_LINE', "+&
//						string(gi_userid) + ", sysdate, "+string(gi_userid) + ", sysdate, "+string(ldb_qty) +","+ ls_dataStr +")"
//		end if
//		execute immediate :ls_sql using it_transaction;
//		//-- update ITEM_LOT --//
//		select count(id) into :li_cnt from item_lot where object_ref_id = :ldb_item_id using it_transaction;
//		if li_cnt > 0 then
//			ls_sql = "Update item_lot set " + vs_colname + "=" + ls_dataStr + " where object_ref_id ="+string(ldb_item_id)
//		else
//			ll_item_lot_id = lb_obj.f_create_id_ex( it_transaction)
//			
//			ls_sql = "Insert into item_lot (id,company_id,branch_id,object_ref_id,object_ref_table, "+&
//						" created_by,created_date,last_mdf_by,last_mdf_date,"+ vs_colname+") " +&
//						" VALUES ( "+string(ll_item_lot_id)+ ","+string(gi_user_comp_id  )+ ","+string(gdb_branch  )+ ","+string(ldb_item_id  ) +", 'OBJECT', "+&
//						string(gi_userid) + ", sysdate, "+string(gi_userid) + ", sysdate, " + ls_dataStr +")"
//		end if
//		execute immediate :ls_sql using it_transaction;	
//		commit using it_transaction;
//		disconnect using it_transaction;
end choose
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
		this.post event e_dw_e_itemfocuschanged( ldw_main, ldw_main.getrow(), 'item_code')
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

idb_obj_ref_id =  ldw_main.getitemnumber(ldw_main.getrow(),'version_id')
laa_value[1] = idb_obj_ref_id
ldw_main = iw_display.f_get_dwmain()
ldw_main.f_add_where('object_ref_id;',laa_value[])

return 0
end event

event e_dw_e_save;call super::e_dw_e_save;
b_obj_instantiate			lbo_ins
	
if lbo_ins.f_update_line_no( rpo_dw ) = -1 then return -1

return 1
end event

