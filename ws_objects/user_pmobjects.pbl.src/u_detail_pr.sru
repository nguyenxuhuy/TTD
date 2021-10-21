$PBExportHeader$u_detail_pr.sru
forward
global type u_detail_pr from b_detail
end type
end forward

global type u_detail_pr from b_detail
end type
global u_detail_pr u_detail_pr

type variables
double	idb_obj_ref_id
end variables

forward prototypes
public subroutine f_set_dwo_window ()
public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[])
public subroutine f_set_dwo_related ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_pr_line_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_pr_line_grid'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Chi tiết y/c mua'
end subroutine

public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[]);return 0
end function

public subroutine f_set_dwo_related ();// Đối tượng liên quan
istr_dwo_related[1].s_related_obj_name = 'u_po'					// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = 'd_pr_line_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'd_po_line_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].b_f_matching = true
istr_dwo_related[1].s_relatedtext_column = ''					
istr_dwo_related[1].s_text = 'Đơn đặt mua từ: '

istr_dwo_related[1].s_main_obj_dwo_copy[1] = 'd_order_pr_form' 
istr_dwo_related[1].s_main_obj_column_copy[1] = 'currency_id;note;exchange_rate;'
istr_dwo_related[1].s_related_obj_dwo_copy[1] = 'd_order_form'
istr_dwo_related[1].s_related_obj_column_copy[1] = 'currency_id;note;exchange_rate;'
istr_dwo_related[1].s_main_obj_column_chk[1] = ''
istr_dwo_related[1].s_related_obj_column_chk[1] = 'object_id;bill_to_object;'

istr_dwo_related[1].s_main_obj_dwo_copy[2] = 'd_pr_line_grid' 
// cột copy từ
istr_dwo_related[1].s_main_obj_column_copy[2] = 'LINE_TEXT;NOTE;QTY;best_price;best_AMOUNT;best_base_amount;best_base_amount_ex_tax;TRANS_UOM;ITEM_ID;SPEC_ID;REQUEST_RECEIVE_DATE;'
//datawindow copy đến
istr_dwo_related[1].s_related_obj_dwo_copy[2] = 'd_po_line_grid'
// cột copy đến
istr_dwo_related[1].s_related_obj_column_copy[2] = 'LINE_TEXT;NOTE;QTY;PRICE;AMOUNT;base_amount;base_amount_ex_tax;TRANS_UOM;ITEM_ID;SPEC_ID;REQUEST_RECEIVE_DATE'
istr_dwo_related[1].b_copy_line[2] = true
// cột check cùng loại thường dùng cho master
istr_dwo_related[1].s_main_obj_column_chk[2] = 'DIST_ID_LIST;VEND_ID_LIST;'
istr_dwo_related[1].s_related_obj_column_chk[2] = ''
istr_dwo_related[1].s_f_obj_column_chk[2] = 'DIST_ID_LIST;VEND_ID_LIST;'
istr_dwo_related[1].s_t_obj_column_chk[2] = ''
istr_dwo_related[1].s_match_f_dwo[2] = 'd_pr_line_grid'
istr_dwo_related[1].s_match_f_col_obj[2] = 'item_id'
istr_dwo_related[1].s_match_t_dwo[2] = 'd_po_line_grid'
istr_dwo_related[1].s_match_f_column[2] = 'qty'
istr_dwo_related[1].s_match_t_column[2] = 'qty'
istr_dwo_related[1].s_match_column[2] = 'qty'
istr_dwo_related[1].b_f_sum[2] = false

end subroutine

on u_detail_pr.create
call super::create
end on

on u_detail_pr.destroy
call super::destroy
end on

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

if ldw_main.getrow() > 0 then
	idb_obj_ref_id =  ldw_main.getitemnumber(ldw_main.getrow(),'version_id')
else
	idb_obj_ref_id = 0
end if
laa_value[1] = idb_obj_ref_id
ldw_main = iw_display.f_get_dwmain()
ldw_main.f_add_where('object_ref_id;',laa_value[])

return 0
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;
rpo_dw.setitem(vl_currentrow, 'object_ref_table' , 'ORDERS')
rpo_dw.setitem(vl_currentrow, 'object_ref_id' , idb_obj_ref_id)

return vl_currentrow
end event

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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;b_copyt_multi;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_filteron;b_refresh;b_delete;b_copyt_multi;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;b_copyt_multi;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron; b_refresh;b_delete;b_copyt_multi;'
						end if
					end if
				else				
					if ib_changed_dwo_4edit then
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;b_copyt_multi;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_filteron;b_refresh;b_delete;b_copyt_multi;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_saveclose;b_filteron;b_refresh;b_delete;b_copyt_multi;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_saveclose;b_filteron;b_refresh;b_delete;b_copyt_multi;'
						end if
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
				istr_actionpane[li_idx].s_visible_buttons =  'b_book; b_attach; b_note;b_doc_trace_on;b_user_trace;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
				
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event constructor;call super::constructor;

istr_actionpane[1].s_button_name =  'b_add_multi;b_copyt_multi;b_insert;b_modify;b_saveclose;b_filteron;b_query;b_refresh;b_delete;b_view_multi;b_send_2_approve;b_request_2_change;b_approve;b_reject;'
istr_actionpane[1].s_button_has_sub = 'b_copyt_multi;'
istr_actionpane[1].sa_sub_button[1]='b_copyt_po;b_copyt_goods_transfer;'
istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]

end event

event e_window_e_precopy_to;call super::e_window_e_precopy_to;long				ll_found
double			ldb_version_id
string				ls_status, ls_dist_id_list, ls_vend_id_list, ls_findStr
t_dw_mpl 		ldw_main

ldw_main = iw_display.f_get_dwmain( )
ldw_main.accepttext( )
if ldw_main.getrow() > 0 then
	ldb_version_id = ldw_main.getitemnumber( ldw_main.getrow(), 'object_ref_id') 
	select status into :ls_status from document where version_id = :ldb_version_id using it_transaction;
	if ls_status = 'generated' then
		gf_messagebox('m.u_detail_pr.e_window_e_precopy_to.01','Thông báo','YCMH đã được tổng hợp' ,'exclamation','ok',1)
		return -1
	else
		//-- chck vendor --//
		ll_found = ldw_main.find( "gutter ='Y' ", 1, ldw_main.rowcount())
		If ll_found > 0 then
			 ls_findStr = "gutter ='Y' AND ("
			ls_dist_id_list = ldw_main.getitemstring( ll_found, 'dist_id_list')
			if isnull(ls_dist_id_list) then
				ls_findStr += "  dist_id_list <>'' "
			else
				ls_findStr += " dist_id_list <> '"+ls_dist_id_list+"' OR isnull(vend_id_list) "
			end if
			ls_vend_id_list = ldw_main.getitemstring( ll_found, 'vend_id_list')
			if isnull(ls_vend_id_list) then
				ls_findStr += "OR vend_id_list<>'' )"
			else
				ls_findStr += " OR vend_id_list <> '"+ls_vend_id_list+"' OR isnull(vend_id_list))"
			end if
			ll_found = ldw_main.find( ls_findStr , ll_found+1, ldw_main.rowcount())
			if ll_found > 0 then
				gf_messagebox('m.u_detail_pr.e_window_e_precopy_to.02','Thông báo','Các mặt hàng không cùng NCC/NPP' ,'exclamation','ok',1)
				return -1				
			end if
		end if
	end if	
end if

return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;decimal 		ldc_qty, ldc_b_price

choose case vs_colname
	case 'best_price', 'qty'
		if vs_colname = 'best_price' then
			ldc_b_price = dec(vs_editdata)
			ldc_qty = rpo_dw.getitemnumber(vl_currentrow,'qty')
		else
			ldc_qty = dec(vs_editdata)
			ldc_b_price = rpo_dw.getitemnumber(vl_currentrow,'best_price')
		end if
		rpo_dw.setitem(vl_currentrow, 'best_amount', ldc_b_price* ldc_qty)
		rpo_dw.setitem(vl_currentrow, 'best_base_amount', ldc_b_price* ldc_qty)
		rpo_dw.setitem(vl_currentrow, 'best_base_amount_ex_tax', ldc_b_price* ldc_qty)
end choose
return ancestorreturnvalue

end event

