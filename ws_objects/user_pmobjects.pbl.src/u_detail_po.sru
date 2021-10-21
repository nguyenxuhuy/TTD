$PBExportHeader$u_detail_po.sru
forward
global type u_detail_po from b_detail
end type
end forward

global type u_detail_po from b_detail
event type integer e_action_split_po ( )
end type
global u_detail_po u_detail_po

type variables
double	idb_obj_ref_id, idb_object_id, idb_curr_id, idb_exrate
date		id_doc_date
s_str_data	istr_currency
end variables

forward prototypes
public subroutine f_set_dwo_window ()
public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[])
public subroutine f_set_dwo_related ()
end prototypes

event type integer e_action_split_po();
s_str_dwo_related		lstr_related[], lstr_data_related[]
t_dw_mpl				ldw_main
t_ds_db					lads_copied[]
b_obj_instantiate		lbo_ins
c_dwsetup_initial		lc_dwsetup_initial
long						ll_find
double 					ldb_rtn

connect using it_transaction;

ldw_main = iw_display.f_get_dwmain( )
ll_find=ldw_main.find("gutter = 'Y'", 1, ldw_main.rowcount())
if ll_find=0 then 
	gf_messagebox('m.u_detail_po.e_action_split_po.01','Thông báo','Chưa chọn mặt hàng cần tách','exclamation','ok',1)
	disconnect using it_transaction;
	return 0
else
	//-- kiểm tra cùng NCC --//
	
end if

this.f_get_dwo_related(lstr_related) 
//get data de build where related
this.f_get_data_related(this.classname(), lstr_data_related[]) 

//build where related
iw_display.f_build_data_related( lstr_data_related[])  //

if iw_display.dynamic f_get_data_copied_ex( lads_copied[],lstr_related,'copyt',this.classname()) > 0 then
	lc_dwsetup_initial.f_init_ids_setup_dw_ex( gdb_branch , 'u_po', it_transaction)
	ldb_rtn = lbo_ins.f_split_po( lstr_data_related[], lads_copied[], it_transaction ,lc_dwsetup_initial )		
	if ldb_rtn > 0 then
		//-- xoá line đã tách --//
		ll_find=ldw_main.find("gutter = 'Y'", 1, ldw_main.rowcount())
		DO while ll_find > 0
			ldw_main.event e_deleterow( ll_find)
			ll_find=ldw_main.find("gutter = 'Y'", 1, ldw_main.rowcount())
		LOOP
		ldw_main.settransobject(it_transaction )
		if ldw_main.update( ) = 1 then
			commit using it_transaction;
		else
			rollback using it_transaction;
		end if		
	end if
	disconnect using it_transaction;
	return 1
end if
disconnect using it_transaction;
return 0
end event

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_po_line_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_po_line_grid'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Chi tiết đặt mua'
end subroutine

public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[]);return 0
end function

public subroutine f_set_dwo_related ();// Đối tượng liên quan
istr_dwo_related[1].s_related_obj_name = 'u_detail_po'					// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = 'd_po_line_grid'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'd_po_line_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].b_f_matching = true
istr_dwo_related[1].s_relatedtext_column = ''					
istr_dwo_related[1].s_text = 'Đơn đặt mua từ: '

istr_dwo_related[1].s_main_obj_dwo_copy[1] = 'd_po_line_grid' 
istr_dwo_related[1].s_main_obj_column_copy[1] = 'subaccount;subaccount;'
istr_dwo_related[1].s_related_obj_dwo_copy[1] = 'd_order_form'
istr_dwo_related[1].s_related_obj_column_copy[1] = 'object_id;bill_to_object;'
istr_dwo_related[1].s_main_obj_column_chk[1] = 'subaccount' //-- cột cùng giá trị--//
istr_dwo_related[1].s_related_obj_column_chk[1] = 'currency_id;exchange_rate;payment_term;payment_method;delivery_mode;' //-- các cột lấy theo mặc định của object(istr_dwo_related[1].s_match_f_col_obj[1]) --//
istr_dwo_related[1].s_match_f_col_obj[1] = 'subaccount' //--cột object lấy giá trị mặc định khi copy--//

istr_dwo_related[1].s_main_obj_dwo_copy[2] = 'd_po_line_grid' 
// cột copy từ
istr_dwo_related[1].s_main_obj_column_copy[2] = 'LINE_TEXT;NOTE;QTY;PRICE;AMOUNT;base_amount;base_amount_ex_tax;TRANS_UOM;ITEM_ID;SPEC_ID;REQUEST_RECEIVE_DATE;'
//datawindow copy đến
istr_dwo_related[1].s_related_obj_dwo_copy[2] = 'd_po_line_grid'
// cột copy đến
istr_dwo_related[1].s_related_obj_column_copy[2] = 'LINE_TEXT;NOTE;QTY;PRICE;AMOUNT;base_amount;base_amount_ex_tax;TRANS_UOM;ITEM_ID;SPEC_ID;REQUEST_RECEIVE_DATE'
istr_dwo_related[1].b_copy_line[2] = true
// cột check cùng loại thường dùng cho master
istr_dwo_related[1].s_main_obj_column_chk[2] = ''
istr_dwo_related[1].s_related_obj_column_chk[2] = ''
istr_dwo_related[1].s_f_obj_column_chk[2] = ''
istr_dwo_related[1].s_t_obj_column_chk[2] = ''
istr_dwo_related[1].s_match_f_dwo[2] = ''
istr_dwo_related[1].s_match_f_col_obj[2] = ''
istr_dwo_related[1].s_match_t_dwo[2] = ''
istr_dwo_related[1].s_match_f_column[2] = ''
istr_dwo_related[1].s_match_t_column[2] = ''
istr_dwo_related[1].s_match_column[2] = ''
istr_dwo_related[1].b_f_sum[2] = false
end subroutine

on u_detail_po.create
call super::create
end on

on u_detail_po.destroy
call super::destroy
end on

event e_window_e_postopen_child;call super::e_window_e_postopen_child;t_dw_mpl			ldw_main
window			lw_parent
any				laa_value[]

lw_parent = iw_display.dynamic f_getparentwindow()
ldw_main = lw_parent.dynamic f_get_dwmain()

if ldw_main.getrow() > 0 then
	idb_obj_ref_id =  ldw_main.getitemnumber(ldw_main.getrow(),'version_id')
	istr_currency.adb_data[1] = ldw_main.getitemnumber( ldw_main.getrow( ) , 'currency_id')
	istr_currency.adb_data[2] = ldw_main.getitemnumber( ldw_main.getrow( ) , 'exchange_rate')	
else
	idb_obj_ref_id = 0
end if
laa_value[1] = idb_obj_ref_id
ldw_main = iw_display.f_get_dwmain()
ldw_main.f_add_where('object_ref_id;',laa_value[])

return 0
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_refresh;b_delete;b_copyt_multi;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron; b_refresh;b_delete;b_copyt_multi;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron; b_refresh;b_delete;b_copyt_multi;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_refresh;b_delete;b_copyt_multi;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_refresh;b_delete;b_copyt_multi;'
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

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;
rpo_dw.setitem(vl_currentrow, 'object_ref_table' , 'ORDERS')
rpo_dw.setitem(vl_currentrow, 'object_ref_id' , idb_obj_ref_id)

return vl_currentrow
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;double			ldb_item_id, ldb_spec_id
decimal			ldb_qty
string				ls_upd_colname
b_obj_instantiate			lb_obj
t_dw_mpl					ldw_handle

choose case vs_colname
	case 'object_code', 'spec_code' 
	case 'amount'
	//-- cập nhật các cột liên quan --//
		ls_upd_colname = 'price;base_price;base_amount;base_amountex_tax;vat_amount;'
		ldw_handle = rpo_dw
		if lb_obj.f_update_line_itemchanged_ex( vs_colname, vs_editdata , ls_upd_colname,vl_currentrow , ldw_handle, it_transaction , istr_currency) = -1 then return 1	
	case 'qty', 'price'
		//-- cập nhật các cột liện quan --//
		ls_upd_colname = 'base_price;amount;base_amount;base_amountex_tax;vat_amount;'
		ldw_handle = rpo_dw
		if lb_obj.f_update_line_itemchanged_ex( vs_colname, vs_editdata , ls_upd_colname,vl_currentrow , ldw_handle, it_transaction , istr_currency) = -1 then return 1								
	case 'vat'
		//-- cập nhật các cột liện quan --//
		ls_upd_colname = 'vat_amount'
		ldw_handle = rpo_dw
		if lb_obj.f_update_line_itemchanged_ex( vs_colname, vs_editdata , ls_upd_colname,vl_currentrow , ldw_handle, it_transaction , istr_currency) = -1 then return 1			
end choose
return 0
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
	else
		iw_display.post event e_add( )
	end if
end if
iw_display.event e_filteron_new( )
return 0
end event

event constructor;call super::constructor;istr_actionpane[1].s_button_name =  'b_add_multi;b_copyt_multi;b_insert;b_modify;b_save;b_filteron;b_query;b_refresh;b_delete;b_view_multi;b_send_2_approve;b_request_2_change;b_approve;b_reject;'
istr_actionpane[1].s_button_has_sub = 'b_copyt_multi;'
istr_actionpane[1].sa_sub_button[1]='b_split_po;b_copyt_goods_transfer;'
istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
end event

event e_dw_e_save;call super::e_dw_e_save;
b_obj_instantiate			lbo_ins
	
//if lbo_ins.f_update_line_no( rpo_dw ) = -1 then return -1

return 1
end event

event e_dw_e_postsave;call super::e_dw_e_postsave;double 		ldb_po_line,  ldb_item_id
int				li_row, li_cnt
dec			ldc_qty
string			ls_code

b_obj_instantiate	lb_obj

//-- update TAX_LINE --//

FOR li_row = 1 to rpo_dw.rowcount()
		
	//-- UPdate MATCH --//
	ldb_po_line = rpo_dw.getitemnumber( li_row, 'id' )
	select count(id) into :li_cnt from MATCHING where t_ref_id = :ldb_po_line and upper(f_ref_table) =  'SO_LINE' using it_transaction;
	if li_cnt > 0 then
		ldc_qty  = rpo_dw.getitemnumber( li_row, 'qty' )
		update matching set qty = :ldc_qty where t_ref_id = :ldb_po_line using it_transaction;
	else
		select count(id) into :li_cnt from MATCHING where t_doc_id = :idb_obj_ref_id and upper(f_ref_table) =  'SO_LINE' using it_transaction;
		if li_cnt > 0 then
			rollback using it_transaction;
			ldb_item_id =  rpo_dw.getitemnumber( li_row, 'item_id' )
			ls_code = lb_obj.f_get_object_code_ex( ldb_item_id, it_transaction)
			if isnull(ls_code) then ls_code = ''
			gf_messagebox('m.u_detail_so.e_dw_e_postsave.01','Thông báo','Không nhập được mặt hàng ngoài SO:@'+ls_code ,'information','ok',1)
			return -1
		end if
	end if
NEXT
return 0
end event

