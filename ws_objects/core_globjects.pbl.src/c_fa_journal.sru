$PBExportHeader$c_fa_journal.sru
forward
global type c_fa_journal from b_doc
end type
end forward

global type c_fa_journal from b_doc
event type integer e_action_depreciate ( )
end type
global c_fa_journal c_fa_journal

forward prototypes
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_window ()
public subroutine f_set_str_unit ()
public subroutine f_set_str_streamvalue ()
end prototypes

event type integer e_action_depreciate();string				ls_asset_code, ls_operation_status, ls_depre_stopping_yn, ls_time_unit, ls_base_currCode, ls_base_currName
any				laa_data[], laa_empty[]
long				ll_row, ll_rowFilter, ll_nbr_of_depre_time_unit, ll_insertrow, ll_line_no, ll_history_row
date				ld_trans_date, ld_period_firstdate, ld_period_lastdate, ld_depre_date
double			ldb_asset_id, ldb_net_value, ldb_dr_value, ldb_cr_value, ldb_base_curr, ldb_round_id, ldb_nbr_of_depre_time_unit_history
double			ldb_depre_value, ldb_depre_value_alloc, ldb_weighted_total, ldb_weighted_nbr, ldb_DEPRE_LIFE_REMAIN
b_popup_data	lb_popup_input
t_ds_db			lds_parm, lds_asset_profile, lds_depre_profile, lds_depre_profile_filter, lds_depre_history
t_dw_mpl		ldw_journal, ldw_journal_line
t_transaction	lt_transaction
//u_fiscal_period	lu_fiscal_period
b_obj_instantiate		lbo_instance
c_datetime				lc_datetime

//-- popup window nhập tham số --//
lb_popup_input = create b_popup_data
lb_popup_input.f_init_popup_display( '1d', 'd_depre_parm_form', 2600, 1000)
openwithparm(s_wr_multi,lb_popup_input)
lds_parm = message.powerobjectparm
setnull(message.powerobjectparm)	
if not isvalid(lds_parm) then return 0

ls_asset_code =lds_parm.getitemstring( 1, 'asset_code')
if isnull(ls_asset_code) or ls_asset_code = '' then ls_asset_code = '*'
//-- lấy trans_date --//
ldw_journal = this.iw_display.f_get_dw('d_gl_journal_form')
if ldw_journal.accepttext( ) = -1 then return 0
if ldw_journal.getrow( ) > 0 then
	ld_trans_date = date(ldw_journal.getitemdatetime( ldw_journal.getrow( ), 'trans_date'))
	laa_data[1] = ls_asset_code
	laa_data[2] = '=Y'
	laa_data[3] = '=Y'
	laa_data[4] = '<='+string(ld_trans_date,gs_w_date_format)
	laa_data[5] = '>0'
	laa_data[6] = '='+gs_sob
	//-- retrieve các tài sản thỏa điều kiện khấu hao --//
	lds_depre_profile = create t_ds_db
	lds_depre_profile.dataobject = 'd_depre_profile_grid'
	lds_depre_profile.f_add_where( 'asset_code;fixed_asset_yn;depre_yn;depre_start_date;DEPRE_LIFE_REMAIN;SOB', laa_data[])
	lds_depre_profile.f_settransobject( sqlca)
	lds_depre_profile.setsort( "asset_code asc" )
	if lds_depre_profile.retrieve( ) > 0 then //-- retrieve tất cả tài sản khấu hao--//
		lds_depre_profile_filter = create t_ds_db
		lds_depre_profile_filter.dataobject = 'd_depre_profile_grid'
		lds_depre_profile.rowscopy( 1, lds_depre_profile.rowcount( ) ,primary!, lds_depre_profile_filter, 1, primary!)				
		ldw_journal_line = this.iw_display.f_get_dw('d_gl_journal_line_grid')
		lds_asset_profile = create t_ds_db
		lds_depre_history =  create t_ds_db
		this.iw_display.f_get_transaction(lt_transaction )
//		lu_fiscal_period = create u_fiscal_period
		ll_row = 1		
		DO
			ldb_asset_id = lds_depre_profile.getitemnumber( ll_row , 'OBJECT_REF_ID')
			//-- kiểm tra đã khấu hao trong kỳ chưa: mỗi kỳ chì khấu hao 1 lần --//
			lds_depre_history.dataobject = 'ds_depre_history'
			lds_depre_history.f_settransobject( lt_transaction)
			if lbo_instance.f_get_period_first_last_date(ld_trans_date , ld_period_firstdate, ld_period_lastdate, 'normal') = -1 then return -1
//			if lu_fiscal_period.f_get_period_first_last_date(ld_trans_date , ld_period_firstdate, ld_period_lastdate) = -1 then return -1
			laa_data[] = laa_empty[]
			laa_data[1] = ldb_asset_id
			laa_data[2] = '='+gs_sob
			laa_data[3] = '(' + string(ld_period_firstdate, gs_w_date_format) +':' + string(ld_period_lastdate, gs_w_date_format) + ')'
			lds_depre_history.f_add_where( 'ASSET_ID;SOB;DEPRE_DATE', laa_data[])
			if lds_depre_history.retrieve( ) > 0 then 
				ld_depre_date = date(lds_depre_history.getitemdatetime( 1, 'depre_date'))
				ls_asset_code =  lds_depre_profile.getitemstring( ll_row , 'asset_code')		
				gf_messagebox('m.c_fa_journal.e_action_depreciate.01','Thông báo','Tài sản sau đã chạy khấu hao rồi:@'+ls_asset_code+'@-@'+string(ld_depre_date),'exclamation','ok',1)
			else
				lds_asset_profile.dataobject = 'd_asset_profile_grid'
				lds_asset_profile.f_settransobject( sqlca)
				laa_data[] =laa_empty[]
				laa_data[1] = ldb_asset_id
				laa_data[2] = '='+gs_sob
				lds_asset_profile.f_add_where( 'ASSET_ID;SOB', laa_data[])		
				if lds_asset_profile.retrieve( ) > 0 then  // khi tài sản đã hình thành //
					ldb_dr_value = double(lds_asset_profile.Describe("Evaluate('Sum(dr_base_amount)', 0)"))
					ldb_cr_value = double(lds_asset_profile.Describe("Evaluate('Sum(cr_base_amount)', 0)"))
					ldb_net_value = ldb_dr_value - ldb_cr_value			
					
					lds_depre_profile_filter.setfilter("OBJECT_REF_ID = "  +string(ldb_asset_id))
					lds_depre_profile_filter.filter( ) //-- filter depre profile theo từng tài sản --//
					ldb_weighted_total =  double(lds_asset_profile.Describe("Evaluate('Sum(depre_weighted_nbr)', 0)"))
					if isnull(ldb_weighted_total) or ldb_weighted_total = 0  then ldb_weighted_total = 1
					
					FOR ll_rowFilter = 1 to lds_depre_profile_filter.rowcount( )
						ls_operation_status = lds_depre_profile_filter.getitemstring( ll_rowFilter , 'operation_status')
						ls_depre_stopping_yn = lds_depre_profile_filter.getitemstring( ll_rowFilter , 'depre_stopping_yn')		
						if ls_depre_stopping_yn = 'Y' and ls_operation_status = 'STOPPING' then exit

						ldb_DEPRE_LIFE_REMAIN = lds_depre_profile_filter.getitemnumber( ll_rowFilter, 'depre_life_remain')			
						ls_time_unit = lds_depre_profile_filter.getitemstring( ll_rowFilter , 'depre_time_unit')	
						
						if ls_time_unit = 'MONTH' then
							ll_nbr_of_depre_time_unit = 1
						elseif ls_time_unit = 'DAY' then
							ll_nbr_of_depre_time_unit = DaysAfter(ld_period_firstdate, ld_period_lastdate)
						else //-- hour : chưa thực thiện --//							
						end if
						//ldb_depre_value = ldb_net_value * max(ll_nbr_of_depre_time_unit /ldb_DEPRE_LIFE_REMAIN, 1) //-- nếu số ngày của kỳ cuối cùng nhỏ hơn số ngày còn lại thì khấu hao hết //
						ldb_depre_value = ldb_net_value * (ll_nbr_of_depre_time_unit /ldb_DEPRE_LIFE_REMAIN)
						//--làm tròn--//
						this.ic_unit_instance.f_get_base_cur(ldb_base_curr, ls_base_currCode, ls_base_currName)
						ldb_round_id = this.ic_unit_instance.f_get_round_id( ldb_base_curr, 0, 'amount')
						ldb_depre_value = this.ic_unit_instance.f_round( lt_transaction, ldb_round_id, ldb_depre_value)
						
						if ll_rowFilter = lds_depre_profile_filter.rowcount( ) then
							ldb_depre_value_alloc = ldb_depre_value		
						else
							ldb_weighted_nbr =  lds_depre_profile_filter.getitemnumber( ll_rowFilter , 'depre_weighted_nbr')
							if isnull(ldb_weighted_nbr) or ldb_weighted_nbr = 0  then ldb_weighted_nbr = 1							
							ldb_depre_value_alloc = ldb_depre_value *ldb_weighted_nbr/ldb_weighted_total
							//--làm tròn --//
							ldb_depre_value_alloc = this.ic_unit_instance.f_round( lt_transaction, ldb_round_id, ldb_depre_value_alloc)							
							ldb_depre_value -= ldb_depre_value_alloc
						end if										
						//-- insert vào journal --//		
						ll_insertrow = ldw_journal_line.event e_addrow( )
						ldw_journal_line.setitem( ll_insertrow, 'dr_account_id', lds_depre_profile_filter.getitemnumber( ll_rowFilter, 'DEPRE_SUBACCOUNT'))
						ldw_journal_line.setitem( ll_insertrow, 'dr_account_code', lds_depre_profile_filter.getitemstring( ll_rowFilter, 'depre_subaccount_code'))
						ldw_journal_line.setitem( ll_insertrow, 'dr_account_name', lds_depre_profile_filter.getitemstring( ll_rowFilter, 'depre_subaccount_name'))
						ldw_journal_line.setitem( ll_insertrow, 'DR_SUBACCOUNT',  lds_depre_profile_filter.getitemnumber( ll_rowFilter, 'depre_subaccount'))
						ldw_journal_line.setitem( ll_insertrow, 'CR_ACCOUNT_ID', ldb_asset_id)
						ldw_journal_line.setitem( ll_insertrow, 'cr_account_code', lds_depre_profile_filter.getitemstring( ll_rowFilter , 'asset_code'))
						ldw_journal_line.setitem( ll_insertrow, 'cr_account_name', lds_depre_profile_filter.getitemstring( ll_rowFilter , 'asset_name'))
						ldw_journal_line.setitem( ll_insertrow, 'AMOUNT', ldb_depre_value_alloc)
						ldw_journal_line.setitem( ll_insertrow, 'BASE_AMOUNT', ldb_depre_value_alloc)
						ldw_journal_line.setitem( ll_insertrow, 'LINE_TEXT',  lds_depre_profile_filter.getitemstring( ll_rowFilter , 'asset_name')	)
						//-- insert depre history --//						
						ll_history_row = lds_depre_history.event e_addrow( )
						lds_depre_history.setitem( ll_history_row, 'ID', this.f_create_id( ) )
						lds_depre_history.setitem( ll_history_row, 'OBJECT_REF_ID',  ldw_journal_line.getitemnumber( ll_insertrow, 'ID') )
						lds_depre_history.setitem( ll_history_row, 'OBJECT_REF_TABLE', upper(ldw_journal_line.describe("DataWindow.Table.UpdateTable")) )
						lds_depre_history.setitem( ll_history_row, 'ASSET_ID',  ldb_asset_id)
						lds_depre_history.setitem( ll_history_row, 'SOB', gs_sob)
						lds_depre_history.setitem( ll_history_row, 'DEPRE_TIME_UNIT', ls_time_unit)
						lds_depre_history.setitem( ll_history_row, 'DEPRE_DATE', ld_trans_date)	
						if ll_rowFilter = 1 then ldb_nbr_of_depre_time_unit_history = min(ll_nbr_of_depre_time_unit, ldb_DEPRE_LIFE_REMAIN)
						if ll_rowFilter = lds_depre_profile_filter.rowcount( ) then							
							lds_depre_history.setitem( ll_history_row, 'DEPRE_COUNT', ldb_nbr_of_depre_time_unit_history)	
						else
							lds_depre_history.setitem( ll_history_row, 'DEPRE_COUNT', ldb_nbr_of_depre_time_unit_history*ldb_weighted_nbr/ldb_weighted_total)	
							ldb_nbr_of_depre_time_unit_history = ldb_nbr_of_depre_time_unit_history*(1 - ldb_weighted_nbr/ldb_weighted_total)
						end if													
					NEXT
				end if
			end if
			//-- tìm đến mã tài sản khác --//			
			ll_row = lds_depre_profile.find( "OBJECT_REF_ID <>" +string(ldb_asset_id), ll_row+1,  lds_depre_profile.rowcount( )+1)
		LOOP WHILE ll_row > 0
		if isvalid(lds_depre_history) then
			if lds_depre_history.update(true, false ) = -1 then
				gf_messagebox('m.c_fa_journal.e_action_depreciate.02','Thông báo','Lỗi update:@'+lt_transaction.sqlerrtext ,'stop','ok',1)
				destroy lds_depre_profile
				destroy lds_asset_profile
				destroy lds_depre_profile_filter
				destroy lds_depre_history
				rollback using lt_transaction;
				return -1
			end if
		end if
		this.iw_display.event e_save( )
	end if
end if

destroy lds_depre_profile
destroy lds_asset_profile
destroy lds_depre_profile_filter
destroy lds_depre_history
return 1
end event

public subroutine f_set_actionpane ();
//istr_actionpane[2].s_dwo_action = 'd_action_related_object'
//istr_actionpane[2].s_button_name =  'b_pur_invoice;b_sal_invoice_return;'
//istr_actionpane[2].s_objname_handling = this.classname( )
//istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_document_grid'
istr_dwo[1].s_dwo_form = 'd_document_form'
istr_dwo[1].s_dwo_grid = 'd_document_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_gl_journal_form;' 
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
istr_dwo[1].s_description = 'giao dịch TSCĐ'

istr_dwo[2].s_dwo_default =  'd_gl_journal_form'
istr_dwo[2].s_dwo_form = 'd_gl_journal_form'
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
istr_dwo[2].b_focus_master = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_description = 'Thông tin giao dịch TSCĐ'

istr_dwo[3].s_dwo_default =  'd_gl_journal_line_grid'
istr_dwo[3].s_dwo_form = ''
istr_dwo[3].s_dwo_grid = 'd_gl_journal_line_grid'
istr_dwo[3].b_master = true
istr_dwo[3].b_detail = true
istr_dwo[3].b_cascade_del = true
istr_dwo[3].s_dwo_details = 'd_post_line_grid;'
istr_dwo[3].s_dwo_master = 'd_gl_journal_form;'
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
istr_dwo[3].s_gb_name = 'gb_7'
istr_dwo[3].s_description = 'Chi tiết giao dịch'

istr_dwo[4].s_dwo_default =  'd_post_line_grid'
istr_dwo[4].s_dwo_form = ''
istr_dwo[4].s_dwo_grid = 'd_post_line_grid'
istr_dwo[4].b_detail = true
istr_dwo[4].s_dwo_master = 'd_gl_journal_line_grid;'
istr_dwo[4].s_master_keycol = 'ID;'
istr_dwo[4].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[4].b_ref_table_yn  = false
istr_dwo[4].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[4].b_insert = false
istr_dwo[4].b_update = true
istr_dwo[4].b_delete = true
istr_dwo[4].b_query = true
istr_dwo[4].b_print = true
istr_dwo[4].b_excel = true
istr_dwo[4].b_traceable = true
istr_dwo[4].b_keyboardlocked = true
istr_dwo[4].b_focus_master = false 
istr_dwo[4].s_gb_name = 'gb_8'
istr_dwo[4].s_description = 'Thông tin định khoản'

end subroutine

public subroutine f_set_str_unit ();//--Datawindow chứa các cột cần làm tròn--//
istr_unit[1].s_dwo_handing = ';;d_gl_journal_line_grid;d_gl_journal_line_grid;d_gl_journal_form;'
//--Các cột cần làm tròn, nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = ';;amount;base_amount;exchange_rate'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[1].s_dwo_unit = ';;d_gl_journal_form;d_gl_journal_form;d_gl_journal_form;'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = ';;uom_code;uom_code;exchange_rate'
//--Loại làm tròn --//
istr_unit[1].s_type = ';;amount;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[1].s_dwo_object = 'd_gl_journal_line_grid;'
//--Cột chứa mã đơn vị--//
istr_unit[1].s_colname_object = 'object_code'
end subroutine

public subroutine f_set_str_streamvalue ();//istr_streamvalue[1].s_f_obj_dwo = 'd_payment_line_grid'
//istr_streamvalue[1].s_f_obj_column = 'OBJECT_ID'
//istr_streamvalue[1].s_f_column_sv = 'F_OBJECT_ID'
//
//istr_streamvalue[1].s_t_obj_dwo = 'd_receipt_form'
//istr_streamvalue[1].s_t_obj_column = 'DR_CR_OBJECT'
//istr_streamvalue[1].s_t_column_sv = 'T_OBJECT_ID'
//
//istr_streamvalue[1].s_item_dwo = 'none'
//
//istr_streamvalue[1].s_currency_dwo = 'd_receipt_form'
//istr_streamvalue[1].s_currency_column = 'currency_id;exchange_rate;trans_date'
//istr_streamvalue[1].s_currency_column_sv = 'trans_cur_id;exchange_rate;trans_date'
//
//istr_streamvalue[1].s_value_dwo = 'd_payment_line_grid'
//istr_streamvalue[1].s_value_column = 'OBJECT_ID;amount;base_amount'
//istr_streamvalue[1].s_value_column_sv = 'item_id;trans_value;base_value'
end subroutine

on c_fa_journal.create
call super::create
end on

on c_fa_journal.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = true
is_display_model = '4dgb'
ib_display_text = false
is_object_title = 'Giao dịch TSCĐ'
is_exrate_type = 'buy'
istr_actionpane[1].s_button_name = 'b_add;b_insert;b_modify;b_save; b_saveclose;b_filteron;b_query;b_refresh;b_delete;b_post;b_unpost;b_send_2_approve;b_request_2_change;b_approve;b_reject;b_depreciate'
//istr_actionpane[1].s_button_has_sub = 'b_add_multi;'
//istr_actionpane[1].sa_sub_button[1]='b_add;'
//istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
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
				if ldw_focus.dynamic f_get_ib_detail() then //--DETIAL--//
					if ib_changed_dwo_4edit then
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_depreciate;b_total;b_post;b_account_view;b_send_2_approve;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_depreciate;b_total;b_post;b_account_view;b_send_2_approve;b_approve;b_reject;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query; b_refresh;b_delete;b_cancel;b_depreciate;b_total;b_post;b_account_view;b_send_2_approve;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query; b_refresh;b_delete;b_cancel;b_depreciate;b_total;b_post;b_account_view;b_send_2_approve;b_approve;b_reject;'
						end if
					end if
				else	//-- MASTER--//			
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_depreciate;b_post;b_account_view;b_send_2_approve;b_approve;b_reject;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_depreciate;b_post;b_account_view;b_send_2_approve;b_approve;b_reject;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
//				istr_actionpane[li_idx].s_visible_buttons =   'b_sal_invoice;b_sal_invoice_return;'
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
laa_value[1] = '=FA_JOURNAL'
ldw_main.f_add_where('doc_type;',laa_value[])
return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;decimal				ldc_exc
double				ldb_currency_id, ldb_base_round_id,ldb_round_id,ldb_base_amount,ldb_amount
int						li_tax_percent,li_idx, ll_row
string					ls_include_tax_yn
t_dw_mpl			ldw_object, ldw_main, ldw_tmp
c_unit_instance		lc_unit

if AncestorReturnValue = 1 then return 1

ldw_main = iw_display.f_get_dwmain( )
ldw_tmp = iw_display.f_get_dw('d_gl_journal_form')
ldb_currency_id = ldw_tmp.getitemnumber( ldw_tmp.getrow(),'CURRENCY_ID') 
if ldb_currency_id > 0 then
	ldb_round_id = lc_unit.f_get_round_id( ldb_currency_id, 0, 'amount')
	ldb_base_round_id = lc_unit.f_get_round_id( 0, 0, 'bc')
end if
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
				ldb_amount = ldw_object.getitemnumber( ll_row , 'amount')
				if not isnull(ldb_amount) then 
					ldb_base_amount = lc_unit.f_round(ldw_main, ldb_base_round_id,ldb_amount*ldc_exc)
					ldw_object.setitem(ll_row , 'base_amount',ldb_base_amount)
				end if
			next
			end choose
elseif mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_gl_journal_line' then
	if vs_colname='amount' then
		ldc_exc=ldw_tmp.getitemnumber( ldw_tmp.getrow( ),'exchange_rate')
		ldb_base_amount = lc_unit.f_round(ldw_main, ldb_base_round_id,dec(vs_editdata) * ldc_exc)
		rpo_dw.setitem(vl_currentrow, 'base_amount',ldb_base_amount)
	end if
end if
return AncestorReturnValue

end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;long		ll_row,ll_line_no,ll_trans_hdr_id,ll_idx
t_dw_mpl 	ldw_add_row,ldw_main

if pos(rpo_dw.dataobject,'d_document') > 0 then
	 rpo_dw.setitem(vl_currentrow,'doc_type','FA_JOURNAL')
elseif mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5)='d_gl_journal_line' then
	if vl_currentrow = 1 and  rpo_dw.rowcount()=0 then
		ll_line_no = vl_currentrow
	else
		ll_line_no = vl_currentrow
		for ll_idx = vl_currentrow + 1 to rpo_dw.rowcount()
			rpo_dw.setitem(ll_idx,'line_no',ll_idx)
		next
	end if
	if  vl_currentrow=1 then
		ldw_main=iw_display.dynamic f_get_dw('d_gl_journal_form')
			rpo_dw.setitem(vl_currentrow,'line_text',ldw_main.getitemstring(ldw_main.getrow(),'description'))
	end if
	rpo_dw.setitem(vl_currentrow,'line_no',ll_line_no)
	ldw_main = iw_display.dynamic f_get_dwmain()
elseif mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5)='d_gl_journal'  then
	rpo_dw.setitem(vl_currentrow,'doc_type','FA_JOURNAL')
	rpo_dw.setitem( vl_currentrow, 'VERSION_NO', 1)
	rpo_dw.setitem( vl_currentrow, 'trans_date', date(gd_session_date))
end if
return vl_currentrow
end event

event e_window_e_preopen;call super::e_window_e_preopen;//--resize parm --//
this.iw_display.f_set_ii_upperpart_height( 1200)
iw_display.f_set_ii_fixedpart2_height(300)
iw_display.f_set_ii_gb_3_height( 600)
return 0
end event

event e_dw_e_predelete;call super::e_dw_e_predelete;double				ldb_id
long					ll_row
t_transaction		lt_transaction
t_dw_mpl			ldw_journal_line
//-- xóa depre history --//
if pos(rpo_dw.dataobject, 'd_gl_journal_line') > 0 then
	this.iw_display.f_get_transaction(lt_transaction )
	ldb_id = rpo_dw.getitemnumber(vl_currentrow, 'ID')
	if ldb_id > 0 then
		delete depre_history where object_ref_id  = :ldb_id using lt_transaction;		
		if lt_transaction.sqlcode = -1 then
			gf_messagebox('m.c_fa_journal.e_dw_e_predelete.01','Thông báo','Lỗi xóa history:@'+lt_transaction.sqlerrtext,'stop','ok',1 )
			rollback using lt_transaction;
			return -1
		end if
	end if
elseif pos(rpo_dw.dataobject, 'd_document_') > 0 then
	this.iw_display.f_get_transaction(lt_transaction )
	ldw_journal_line = this.iw_display.f_get_dw( 'd_gl_journal_line_grid')
	FOR ll_row =  1 to ldw_journal_line.rowcount( )
		ldb_id = ldw_journal_line.getitemnumber(vl_currentrow, 'ID')
		delete depre_history where object_ref_id  = :ldb_id using lt_transaction;		
		if lt_transaction.sqlcode = -1 then
			gf_messagebox('m.c_fa_journal.e_dw_e_predelete.01','Thông báo','Lỗi xóa history:@'+lt_transaction.sqlerrtext,'stop','ok',1 )
			rollback using lt_transaction;
			return -1
		end if		
	NEXT
end if
return 0
end event

