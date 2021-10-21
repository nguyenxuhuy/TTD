$PBExportHeader$c_inventory_close.sru
forward
global type c_inventory_close from b_doc
end type
end forward

global type c_inventory_close from b_doc
event type integer e_action_process ( )
event type integer e_action_undo ( )
end type
global c_inventory_close c_inventory_close

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
end prototypes

event type integer e_action_process();/********************************************************************
Chức năng: tính giá vốn xuất kho tới ngày đóng kỳ 
-----------------------------------------------------------------
===========================================*/
date 				ld_edate, ld_edate_prior, ld_sdate
double			ldb_bookedslip_ref_id
string				ls_warehouse_yn, ls_loc_yn, ls_spec_yn, ls_lot_yn, ls_serial_yn, ls_update_method
boolean			lb_firsttime
t_dw_mpl				ldw_invt_form, ldw_main

b_obj_instantiate		lbo_instance

ldw_invt_form= this.iw_display.f_get_dw('d_inventory_close_form')
ldw_main = this.iw_display.f_get_dwmain( )
ld_edate = date(ldw_invt_form.getitemdatetime(ldw_invt_form.getrow(), 'trans_date'))
ldb_bookedslip_ref_id = ldw_invt_form.getitemnumber(ldw_invt_form.getrow() , 'ID')

//this.iw_display.f_get_transaction( lt_transaction)

//-- Lấy ngày liền sau ngày đóng kỳ liền trước: Nếu là kỳ đâu tiên thì lấy ngày đầu năm tài chính --//
SELECT max(booked_slip.trans_date) into :ld_edate_prior 
FROM booked_slip JOIN document ON document.version_id = booked_slip.id 
WHERE document.doc_type='INVENTORY_CLOSE' and document.status IN ('completed','booked') USING sqlca;  

if not isnull(ld_edate_prior) then
	if ld_edate_prior >= ld_edate then
		gf_messagebox('m.c_inventory_close.e_action_process.01','Thông báo','Ngày đóng kỳ phải lơn hơn ngày đóng kỳ trước:@'+ string(ld_edate_prior, gs_w_date_format),'exclamation','ok',1)
		return -1		
	end if
else
		SELECT min(from_date) into :ld_edate_prior FROM fiscal_period t
	WHERE t.PERIOD_TYPE = 'NORMAL'
	 AND t.fiscal_year = (SELECT t1.fiscal_year FROM fiscal_period t1 WHERE :ld_edate BETWEEN t1.from_date AND t1.to_date and t1.period_type = 'NORMAL')  USING sqlca;
	 if isnull(ld_edate_prior) then
		gf_messagebox('m.c_inventory_close.e_action_process.02','Thông báo','Chưa tạo năm tài chính','exclamation','ok',1)
		return -1
	end if
	lb_firsttime = true
end if

//--lấy các thông tin đóng kỳ khác: warehouse_yn, loc_yn, spec_yn, lot_yn, serial_yn, update_method --//

ls_warehouse_yn =  ldw_invt_form.getitemstring(ldw_invt_form.getrow() , 'warehouse_yn')
if isnull(ls_warehouse_yn) then ls_warehouse_yn = 'N'
ls_loc_yn =  ldw_invt_form.getitemstring(ldw_invt_form.getrow() , 'loc_yn')
if isnull(ls_loc_yn) then ls_loc_yn = 'N'
ls_spec_yn =  ldw_invt_form.getitemstring(ldw_invt_form.getrow() , 'spec_yn')
if isnull(ls_spec_yn) then ls_spec_yn = 'N'
ls_lot_yn =  ldw_invt_form.getitemstring(ldw_invt_form.getrow() , 'lot_yn')
if isnull(ls_lot_yn) then ls_lot_yn = 'N'
ls_serial_yn =  ldw_invt_form.getitemstring(ldw_invt_form.getrow() , 'serial_yn')
if isnull(ls_serial_yn) then ls_serial_yn = 'N'
ls_update_method =  ldw_invt_form.getitemstring(ldw_invt_form.getrow() , 'update_method')

if isnull(ls_update_method) then 
	gf_messagebox('m.c_inventory_close.e_action_process.03','Thông báo','Chưa chọn phương thức điều chỉnh' ,'exclamation','ok',1)		
	return 0
end if

//-- ngày bắt đầu kỳ kho mới --//
if not lb_firsttime then
	ld_sdate = relativeDate(ld_edate_prior, 1)
else
	ld_sdate = ld_edate_prior   //-- phiếu điều chỉnh đâu tiên --//
end if
//-- gọi hàm update --//
if this.f_update_cogs(ld_sdate, ld_edate, ls_warehouse_yn, ls_spec_yn, ls_lot_yn, ls_serial_yn, ls_loc_yn, ls_update_method,ldb_bookedslip_ref_id, 'BOOKED_SLIP' ) = 1 then
	//-- khóa ký kế toán --//
	if lbo_instance.f_stop_period( ld_sdate, ld_edate,'NORMAL', 'ALL') = -1 then
		gf_messagebox('m.c_inventory_close.e_action_process.04','Thông báo','Không đóng được kỳ sau khi điều chỉnh giá vốn' ,'exclamation','ok',1)	
		rollback using it_transaction;
		return -1
	end if
	//-- cập nhật trạng thái chứng từ --//
	if ls_update_method = 'direct_update' then
		ldw_main.setitem( ldw_main.getrow() , 'status', 'booked')
	else
		ldw_main.setitem( ldw_main.getrow() , 'status', 'completed')
	end if
	if ldw_main.update(true, false ) = 1 then
		Commit using it_transaction;
		ldw_main.event e_refresh( )
		gf_messagebox('m.c_inventory_close.e_action_process.05','Thông báo','Tính giá vốn hoàn thành' ,'exclamation','ok',1)		
	else
		gf_messagebox('m.c_inventory_close.e_action_process.06','Thông báo','Lỗi cập nhật trang thái:@' +it_transaction.sqlerrtext ,'exclamation','ok',1)
		return -1		
	end if
end if

return 0
end event

event type integer e_action_undo();date 				ld_edate, ld_edate_prior, ld_edate_max
double			ldb_bookedslip_ref_id, ldb_doc_id
string				ls_warehouse_yn, ls_loc_yn, ls_spec_yn, ls_lot_yn, ls_serial_yn, ls_update_method
boolean			lb_firsttime

t_dw_mpl			ldw_invt_form, ldw_main
t_transaction		lt_transaction
b_obj_instantiate	lbo_instance

ldw_invt_form= this.iw_display.f_get_dw('d_inventory_close_form')
ldw_main = this.iw_display.f_get_dwmain( )
ldb_doc_id = ldw_main.getitemnumber(ldw_main.getrow( ) ,'ID')
ldb_bookedslip_ref_id = ldw_invt_form.getitemnumber(ldw_invt_form.getrow() , 'ID')
ld_edate = date(ldw_invt_form.getitemdatetime(ldw_invt_form.getrow(), 'trans_date'))
this.iw_display.f_get_transaction( lt_transaction)

//-- Lấy ngày liền sau ngày đóng kỳ liền trước: Nếu là kỳ đâu tiên thì lấy ngày đầu năm tài chính --//
SELECT max(booked_slip.trans_date) into :ld_edate_max
FROM booked_slip JOIN document ON document.version_id = booked_slip.id 
WHERE document.doc_type='INVENTORY_CLOSE' 
and document.status IN ('completed','booked') USING sqlca;  

if not isnull(ld_edate_max) then
	if ld_edate_max > ld_edate then
		gf_messagebox('m.c_inventory_close.e_action_undo.01','Thông báo','Phải hủy phiếu đóng kỳ kho sau cùng trước:@'+ string(ld_edate_max, gs_w_date_format),'exclamation','ok',1)
		return -1		
	end if
end if


try
	DELETE stream_value_adj where object_ref_id = :ldb_bookedslip_ref_id  using lt_transaction;
	DELETE item_balance_adj where object_ref_id = :ldb_bookedslip_ref_id  using lt_transaction;
	DELETE ledger_trans_adj  where object_ref_id = :ldb_bookedslip_ref_id  using lt_transaction;	
	DELETE object_balance_adj where object_ref_id = :ldb_bookedslip_ref_id  using lt_transaction;

catch (runtimeerror l_rte)
	rollback using lt_transaction;
	gf_messagebox('m.c_inventory_close.e_action_undo.02','Thông báo','Lỗi SQL:@'+ lt_transaction.sqlerrtext ,'exclamation','ok',1)		
end try

//-- lấy phiếu đóng kỳ trước đó : cap nhật adj value kỳ truóc cho đến ngày hiện tại.--//
SELECT max(booked_slip.trans_date) into :ld_edate_prior
FROM booked_slip JOIN document ON document.version_id = booked_slip.id 
WHERE document.doc_type='INVENTORY_CLOSE' 
and booked_slip.trans_date < :ld_edate
and document.status IN ('completed','booked') USING sqlca;  

if not isnull(ld_edate_prior) then
	lt_transaction.f_db_upd_item_balance_adj( ld_edate_prior, gs_sob )
	lt_transaction.f_db_upd_obj_balance_adj( ld_edate_prior , gs_sob)
else
	SELECT min(from_date) into :ld_edate_prior FROM fiscal_period t
	WHERE t.PERIOD_TYPE = 'NORMAL'
	 AND t.fiscal_year = (SELECT t1.fiscal_year FROM fiscal_period t1 WHERE :ld_edate BETWEEN t1.from_date AND t1.to_date and  t1.PERIOD_TYPE = 'NORMAL')  USING sqlca;
	 if isnull(ld_edate_prior) then
		gf_messagebox('m.c_inventory_close.e_action_undo.03','Thông báo','Chưa tạo năm tài chính','exclamation','ok',1)
		return -1
	end if
	lb_firsttime = true	
end if	

//-- mở kỳ --//
if not lb_firsttime then ld_edate_prior =  RelativeDate ( ld_edate_prior, 1 )
if lbo_instance.f_open_period(ld_edate_prior , ld_edate,'NORMAL', 'ALL') = -1 then
	gf_messagebox('m.c_inventory_close.e_action_undo.04','Thông báo','Mở  được kỳ sau khi huy điều chỉnh giá vốn' ,'exclamation','ok',1)	
	rollback using lt_transaction;
	return -1
end if
	
//-- cập nhật lại trạng thái --//
update document set status = 'new' where id = :ldb_doc_id using lt_transaction;
Commit using lt_transaction;

ldw_main.event e_refresh( )
gf_messagebox('m.c_inventory_close.e_action_undo.05','Thông báo','Hủy tính giá vốn hoàn thành' ,'exclamation','ok',1)		

return 0
end event

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_document_invt_close_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_document_invt_close_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_inventory_close_form;'
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
istr_dwo[1].s_description = 'Tính giá vốn và đóng kỳ kho'

istr_dwo[2].s_dwo_default =  'd_inventory_close_form'
istr_dwo[2].s_dwo_form = 'd_inventory_close_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_detail = true
istr_dwo[2].b_master = true
istr_dwo[2].s_dwo_master = 'd_document_invt_close_grid;'
istr_dwo[2].s_dwo_details = 'd_invt_close_detail_grid;'
istr_dwo[2].s_master_keycol = 'ID'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[2].b_ref_table_yn  = true
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE;doc_type;id;'
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_focus_master = false
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_description = 'Thông tin đóng kỳ kho'

istr_dwo[3].s_dwo_default =  'd_invt_close_detail_grid'
istr_dwo[3].s_dwo_form = ''
istr_dwo[3].s_dwo_grid = 'd_invt_close_detail_grid'
istr_dwo[3].b_detail = true
istr_dwo[3].s_dwo_master = 'd_inventory_close_form'
istr_dwo[3].s_master_keycol = 'ID'
istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[3].b_ref_table_yn  = true
istr_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[3].b_insert = false
istr_dwo[3].b_update = false
istr_dwo[3].b_delete = false
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_excel = true
istr_dwo[3].b_traceable = true
istr_dwo[3].b_focus_master = false
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].s_description = 'Chi tiết điều chỉnh giá vốn'

end subroutine

public subroutine f_set_actionpane ();//istr_actionpane[2].s_dwo_action = 'd_action_related_object'
//istr_actionpane[2].s_objname_handling = this.classname( )
//istr_actionpane[2].s_description = 'Đối tượng liên quan'
//
istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'
end subroutine

on c_inventory_close.create
call super::create
end on

on c_inventory_close.destroy
call super::destroy
end on

event constructor;call super::constructor;

istr_actionpane[1].s_dwo_action = 'd_action_edit'
istr_actionpane[1].s_button_name = 'b_add;b_insert;b_modify;b_save;b_query;b_execquery;b_filteron;b_refresh;b_delete;b_process;b_deprocess;b_post;'
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title

is_table = 'document'
ib_changed_dwo_4edit = false
this.ib_keyboardlocked = true
is_display_model = '3d'
is_object_title = 'Tính giá vốn và đóng kỳ kho'
istr_actionpane[1].s_description = is_object_title

end event

event e_window_e_preopen;call super::e_window_e_preopen;//--resize parm --//
iw_display.dynamic f_set_ii_upperpart_height(750)
iw_display.dynamic f_set_ii_gb_3_height(700)
return 0
end event

event e_window_open;call super::e_window_open;t_dw_mpl			ldw_main
any				laa_value[]
//--form parm--//
ldw_main = iw_display.f_get_dwmain()
laa_value[1] = '=INVENTORY_CLOSE'
ldw_main.f_add_where('doc_type;',laa_value[])
return 0
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;t_dw_mpl  ldw_handle

if pos(rpo_dw.dataobject, 'd_document_invt_close_')> 0 then
	rpo_dw.setitem(vl_currentrow,'doc_type','INVENTORY_CLOSE')
	rpo_dw.setitem( vl_currentrow, 'DOCUMENT_date', date(gd_session_date))	
	ldw_handle = iw_display.f_get_dw('d_inventory_close_form')
	ldw_handle.event e_addrow( )
elseif pos(rpo_dw.dataobject, 'd_inventory_close_') > 0 then
	rpo_dw.setitem(vl_currentrow,'doc_type','INVENTORY_CLOSE')
	rpo_dw.setitem( vl_currentrow, 'VERSION_NO', 1)
	rpo_dw.setitem( vl_currentrow, 'trans_date', date(gd_session_date))	
end if

return 0
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query;b_blank;b_process;b_undo;b_blank;b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_filteron;b_query;b_blank;b_process;b_undo;b_blank;b_refresh;b_delete;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_modify;b_filteron;b_query;b_blank;b_process;b_undo;b_blank;b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_modify;b_filteron;b_query;b_blank;b_process;b_undo;b_blank;b_refresh;b_delete;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_insert;b_modify;b_filteron;b_query;b_blank;b_process;b_undo;b_blank;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_insert;b_modify;b_filteron;b_query;b_blank;b_process;b_undo;b_blank;b_refresh;b_delete;'
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

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;
t_dw_mpl			ldw_handle


if pos(rpo_dw.dataobject, 'd_document_invt_close_')> 0 then
	if vs_colname = 'trans_date' then
		ldw_handle = iw_display.f_get_dw('d_inventory_close_form')
		ldw_handle.setitem(ldw_handle.getrow( ) , 'trans_date', date(vs_editdata))
	end if
end if
return 0
end event

