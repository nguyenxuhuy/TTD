$PBExportHeader$u_detail_qt.sru
forward
global type u_detail_qt from b_detail
end type
end forward

global type u_detail_qt from b_detail
event type integer e_action_split_po ( )
end type
global u_detail_qt u_detail_qt

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

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_qt_line_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_qt_line_grid'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Chi tiết chào giá'
end subroutine

public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[]);return 0
end function

public subroutine f_set_dwo_related ();
istr_dwo_related[1].s_related_obj_name = 'b_view'
istr_dwo_related[1].s_main_obj_dwo = istr_dwo[1].s_dwo_default
istr_dwo_related[1].s_main_obj_column = 'object_ref_id'
istr_dwo_related[1].s_related_obj_dwo = 'dv_qt_form'
istr_dwo_related[1].s_related_obj_column = 'version_id'
istr_dwo_related[1].s_relatedtext_column = 'code'
istr_dwo_related[1].s_text = 'In bảng báo giá(VNĐ)'



istr_dwo_related[2].s_related_obj_name = 'b_view'
istr_dwo_related[2].s_main_obj_dwo = istr_dwo[1].s_dwo_default
istr_dwo_related[2].s_main_obj_column = 'object_ref_id'
istr_dwo_related[2].s_related_obj_dwo = 'dv_qt_f_cur_form'
istr_dwo_related[2].s_related_obj_column = 'version_id'
istr_dwo_related[2].s_relatedtext_column = 'code'
istr_dwo_related[2].s_text = 'In bảng báo giá(USD)'

if	gdb_branch = 24088840 then
	istr_dwo_related[3].s_related_obj_name = 'b_view'
	istr_dwo_related[3].s_main_obj_dwo = istr_dwo[1].s_dwo_default
	istr_dwo_related[3].s_main_obj_column = 'object_ref_id'
	istr_dwo_related[3].s_related_obj_dwo = 'dv_qt_kni_eng_form'
	istr_dwo_related[3].s_related_obj_column = 'version_id'
	istr_dwo_related[3].s_relatedtext_column = 'code'
	istr_dwo_related[3].s_text = 'In bảng báo giá Dao-Dầu(eng)'

	istr_dwo_related[4].s_related_obj_name = 'b_view'
	istr_dwo_related[4].s_main_obj_dwo = istr_dwo[1].s_dwo_default
	istr_dwo_related[4].s_main_obj_column = 'object_ref_id'
	istr_dwo_related[4].s_related_obj_dwo = 'dv_qt_kni_form'
	istr_dwo_related[4].s_related_obj_column = 'version_id'
	istr_dwo_related[4].s_relatedtext_column = 'code'
	istr_dwo_related[4].s_text = 'In bảng báo giá Dao-Dầu(vn)'
else  // if gdb_branch = 11006119 then
	istr_dwo_related[3].s_related_obj_name = 'b_view'
	istr_dwo_related[3].s_main_obj_dwo = istr_dwo[1].s_dwo_default
	istr_dwo_related[3].s_main_obj_column = 'object_ref_id'
	istr_dwo_related[3].s_related_obj_dwo = 'dv_qt_kni_eng_asv_form'
	istr_dwo_related[3].s_related_obj_column = 'version_id'
	istr_dwo_related[3].s_relatedtext_column = 'code'
	istr_dwo_related[3].s_text = 'In bảng báo giá Dao-Dầu(eng)'
	
	istr_dwo_related[4].s_related_obj_name = 'b_view'
	istr_dwo_related[4].s_main_obj_dwo = istr_dwo[1].s_dwo_default
	istr_dwo_related[4].s_main_obj_column = 'object_ref_id'
	istr_dwo_related[4].s_related_obj_dwo = 'dv_qt_kni_asv_form'
	istr_dwo_related[4].s_related_obj_column = 'version_id'
	istr_dwo_related[4].s_relatedtext_column = 'code'
	istr_dwo_related[4].s_text = 'In bảng báo giá Dao-Dầu(vn)'
end if
end subroutine

on u_detail_qt.create
call super::create
end on

on u_detail_qt.destroy
call super::destroy
end on

event e_window_e_postopen_child;call super::e_window_e_postopen_child;
any				laa_value[]
double			ldb_handled_by
t_dw_mpl			ldw_main
window				lw_parent
b_obj_instantiate	lbo_ins

lw_parent = iw_display.dynamic f_getparentwindow()
ldw_main = lw_parent.dynamic f_get_dwmain()
if ldw_main.getrow( ) > 0 then
	istr_currency.adb_data[1] = ldw_main.getitemnumber( ldw_main.getrow( ) , 'currency_id')
	istr_currency.adb_data[2] = ldw_main.getitemnumber( ldw_main.getrow( ) , 'exchange_rate')
	idb_obj_ref_id =  ldw_main.getitemnumber(ldw_main.getrow(),'version_id')
	ldb_handled_by =  ldw_main.getitemnumber(ldw_main.getrow(),'handled_by')
	idb_object_id = lbo_ins.f_get_user_staff_id( ldb_handled_by, it_transaction )
	
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
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_refresh;b_delete;b_send_2_approve;b_approve;'
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
if idb_object_id = 0 then
	gf_messagebox('m.u_detail_qt.e_dw_e_postinsertrow.01','Thống báo','Chưa tạo thông tin HEADER của phiếu','stop','ok',1)
	return -1
end if

rpo_dw.setitem(vl_currentrow, 'object_ref_table' , 'ORDERS')
rpo_dw.setitem(vl_currentrow, 'object_ref_id' , idb_obj_ref_id)
rpo_dw.setitem(vl_currentrow, 'SALES_PERSON' , idb_object_id)

return vl_currentrow
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;double			ldb_item_id, ldb_spec_id, ldb_qt_line, ll_tax_line_id, ll_vat_id
int					li_tax_line_cnt, li_cnt
decimal			ldb_qty, ldc_tax_correction, ldc_tax_pct
string				ls_upd_colname, ls_sql, ls_dataStr
b_obj_instantiate			lb_obj
t_dw_mpl					ldw_handle

choose case vs_colname
	case 'item_code'
		//-- check spec khách hàng --//
		ldb_item_id = rpo_dw.getitemnumber( vl_currentrow, 'item_id' )
		connect using it_transaction;
		select count(id) into :li_cnt from item_spec where object_ref_id = :ldb_item_id and spec_group = :idb_object_id using it_transaction;
		disconnect using it_transaction;
		if li_cnt = 0 then
			if gf_messagebox('m.u_detail_qt.e_dw_e_itemchanged.01','Thông báo','Hình thể chưa có làm phiếu mẫu với khách hàng, bạn tiếp tục hay không?','question','yesno',2) = 2 then
				return 1
			end if				
		end if
		//---------------------------------//
		vs_colname = 'price'
		vs_editdata = string(rpo_dw.getitemnumber(vl_currentrow, 'price'))
		
		ls_upd_colname = 'base_price;act_price;amount;act_amount;base_amount;amount_ex_tax;base_amount_ex_tax;tax_correction;discount_pct;discount;'
		ldw_handle = rpo_dw
		if lb_obj.f_update_line_itemchanged_ex( vs_colname, vs_editdata , ls_upd_colname,vl_currentrow , ldw_handle, it_transaction , istr_currency) = -1 then return 1	
	case 'amount'
	//-- cập nhật các cột liên quan --//
		ls_upd_colname = 'price;act_price;base_amount;act_amount;base_amount_ex_tax;tax_correction;discount_pct;discount;'
		ldw_handle = rpo_dw
		if lb_obj.f_update_line_itemchanged_ex( vs_colname, vs_editdata , ls_upd_colname,vl_currentrow , ldw_handle, it_transaction , istr_currency) = -1 then return 1	
	case 'base_amount'
//	-- cập nhật các cột liên quan --//
		ls_upd_colname = 'base_price;act_price;act_amount;base_amount_ex_tax;tax_correction;discount_pct;discount;'
		ldw_handle = rpo_dw
		if lb_obj.f_update_line_itemchanged_ex( vs_colname, vs_editdata , ls_upd_colname,vl_currentrow , ldw_handle, it_transaction , istr_currency) = -1 then return 1			
	case 'qty'
		ls_upd_colname = 'base_amount;amount_ex_tax;base_amount_ex_tax;tax_correction;act_price;act_qty;act_amount;act_amount_ex_tax;act_base_amount_ex_tax;'
		ldw_handle = rpo_dw
		if lb_obj.f_update_line_itemchanged_ex( vs_colname, vs_editdata , ls_upd_colname,vl_currentrow , ldw_handle, it_transaction , istr_currency) = -1 then return 1	
	case 'act_price'
		//-- cập nhật các cột liện quan --//
		ls_upd_colname = 'base_price;act_amount;base_amount;amount_ex_tax;base_amount_ex_tax;tax_correction;discount_pct;discount;'
		ldw_handle = rpo_dw
		if lb_obj.f_update_line_itemchanged_ex( vs_colname, vs_editdata , ls_upd_colname,vl_currentrow , ldw_handle, it_transaction , istr_currency) = -1 then return 1	
	case 'base_price'
		//-- cập nhật các cột liện quan --//
		ls_upd_colname = 'act_price;act_amount;base_amount;base_amount_ex_tax;tax_correction;discount_pct;discount;'
		ldw_handle = rpo_dw
		if lb_obj.f_update_line_itemchanged_ex( vs_colname, vs_editdata , ls_upd_colname,vl_currentrow , ldw_handle, it_transaction , istr_currency) = -1 then return 1		
	case 'discount'
		//-- cập nhật các cột liện quan --//
		ls_upd_colname = 'discount_pct;act_price;base_price;act_amount;base_amount;amount_ex_tax;base_amount_ex_tax;tax_correction;act_amount;act_amount_ex_tax;act_base_amount_ex_tax;'
		ldw_handle = rpo_dw
		if lb_obj.f_update_line_itemchanged_ex( vs_colname, vs_editdata , ls_upd_colname,vl_currentrow , ldw_handle, it_transaction , istr_currency) = -1 then return 1			
	case 'discount_pct'
		//-- cập nhật các cột liện quan --//
		ls_upd_colname = 'discount;act_price;base_price;act_amount;base_amount;amount_ex_tax;base_amount_ex_tax;tax_correction;act_amount;act_amount_ex_tax;act_base_amount_ex_tax;'
		ldw_handle = rpo_dw
		if lb_obj.f_update_line_itemchanged_ex( vs_colname, vs_editdata , ls_upd_colname,vl_currentrow , ldw_handle, it_transaction , istr_currency) = -1 then return 1		
	case 'tax_pct'
		//-- cập nhật các cột liện quan --//
		ls_upd_colname = 'tax_correction'
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
return 0
end event

event constructor;call super::constructor;istr_actionpane[1].s_button_name =  'b_insert;b_modify;b_filteron;b_refresh;b_delete;'
//istr_actionpane[1].s_button_has_sub = 'b_view_multi;'
////istr_actionpane[1].sa_sub_button[1]='b_view_qt;'
//if	gdb_branch = 24088840 then
//	istr_actionpane[1].sa_sub_button[1]='b_view_qt;b_view_qt_f_cur;b_view_qt_kni_eng;b_view_qt_kni;'
//else
//	istr_actionpane[1].sa_sub_button[1]='b_view_qt;b_view_qt_f_cur;b_view_qt_kni_eng_asv;b_view_qt_kni_asv;'
//end if
//istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
end event

event e_dw_e_save;call super::e_dw_e_save;
b_obj_instantiate			lbo_ins
	
if lbo_ins.f_update_line_no( rpo_dw ) = -1 then return -1

return 1
end event

event e_dw_e_predelete;call super::e_dw_e_predelete;double		ldb_extend_id, ldb_ref_id, ldb_doc_id
int				li_cnt
string			ls_doc_code

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
		delete from matching where t_ref_id = :ldb_ref_id using it_transaction;	
	end if
	
	//-- Xoá tax_line --//
	DELETE  tax_line where object_ref_id = :ldb_ref_id  using it_transaction;

	return 1

end event

event e_dw_e_postsave;call super::e_dw_e_postsave;double 		ldb_qt_line, ldb_vat_id, ldb_tax_line_id
int				li_tax_line_cnt, li_row
dec			ldc_tax_correction, ldc_tax_pct
string			ls_sql, ls_dataStr

b_obj_instantiate	lb_obj

//-- update TAX_LINE --//

FOR li_row = 1 to rpo_dw.rowcount()
	ldc_tax_correction = rpo_dw.getitemnumber( li_row, 'tax_correction' )
	if isnull(ldc_tax_correction) then ldc_tax_correction = 0
	ldc_tax_pct= rpo_dw.getitemnumber( li_row, 'tax_pct' )	
	if isnull(ldc_tax_pct) then ldc_tax_pct = 0
	
	ls_dataStr = ' set tax_pct = '+ string(ldc_tax_pct)
	ls_dataStr += ' , tax_correction = '+ string(ldc_tax_correction)
	
	ldb_qt_line = rpo_dw.getitemnumber( li_row, 'id' )
	select count(id) into :li_tax_line_cnt from tax_line where object_ref_id = :ldb_qt_line using it_transaction;
	if li_tax_line_cnt = 1 then
		ls_sql = "Update tax_line " + ls_dataStr + " where object_ref_id ="+string(ldb_qt_line)
		execute immediate :ls_sql using it_transaction;	
	elseif li_tax_line_cnt = 0 then
		ldb_tax_line_id = lb_obj.f_create_id_ex( it_transaction)
		ldb_vat_id = 24262712
					
		ls_sql = "Insert into tax_line (id,company_id,branch_id,object_ref_id,object_ref_table, doc_version, "+&
					" created_by,created_date,last_mdf_by,last_mdf_date,"+&
					"tax_id, tax_pct, tax_correction, trans_currency, exchange_rate)" +&
					" VALUES ( "+string(ldb_tax_line_id)+ ","+string(gi_user_comp_id  )+ ","+string(gdb_branch  )+ ","+string(ldb_qt_line ) +", 'QT_LINE',"+ string(idb_obj_ref_id )+","+ &
					string(gi_userid) + ", sysdate, "+string(gi_userid) + ", sysdate, "+string(ldb_vat_id) +","+ string(ldc_tax_pct)+","+string(ldc_tax_correction)+","+ & 
					string(istr_currency.adb_data[1]) + ","+ string(istr_currency.adb_data[2])+ ")"
					
		execute immediate :ls_sql using it_transaction;	
	end if
NEXT
return 0
end event

