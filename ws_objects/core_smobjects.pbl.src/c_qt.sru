$PBExportHeader$c_qt.sru
forward
global type c_qt from b_doc
end type
end forward

global type c_qt from b_doc
event type integer e_action_generate ( )
event type integer e_action_complete ( )
event type integer e_action_lose ( )
end type
global c_qt c_qt

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_related ()
public subroutine f_set_str_unit ()
public function integer f_resize_fixedpart_grid ()
public function integer f_resize_fixedpart_form ()
public function integer f_reset_fixedpart_grid ()
public function double f_get_pr_doc_id (string vs_t_ref_table, double vdb_t_doc_id)
end prototypes

event type integer e_action_generate();double						ldb_doc_id, ldb_ver_id, ldb_trans_id, ldb_vend_id, ldb_dist_id, ldb_curr_id, ldb_payterm, ldb_paymethod, ldb_delivery_mode, ldb_branch
double						ladb_vend_info[4], ldb_base_cur
any							laa_values[]
int								li_cnt, li_row, li_idx, li_progress
string							ls_code, ls_gen_branch, las_gen_branch[] , ls_vend_id_list, ls_dist_id_list,  ls_base_curcode,ls_base_curname
string							ls_sql, ls_payterm, ls_paymethod, ls_delivery_mode, ls_vend_id, ls_dist_id
b_obj_instantiate			lbo_ins
t_ds_db						lds_vendor
t_dw_mpl					ldw_main
s_str_data					lstr_data
s_object_display			lod_select_branch
c_dwsetup_initial			lc_dwsetup_initial
c_string						lc_string
c_unit_instance				lc_unit

connect using it_transaction;

lod_select_branch = create using 'u_sel_branch_4_gen'
openwithparm(s_wr_multi,lod_select_branch)
ls_gen_branch = message.stringparm
setnull(message.stringparm)
if ls_gen_branch='' or isnull(ls_gen_branch) then 
	disconnect using it_transaction;
	return 0
end if

lds_vendor = create t_ds_db
lds_vendor.dataobject = 'ds_pr_4_gen'
laa_values[1] = gi_user_comp_id
if pos(ls_gen_branch,';') > 0 then
	laa_values[2] = "("+ls_gen_branch+")"	
else
	laa_values[2] = double(ls_gen_branch)
end if
lds_vendor.f_add_where( 'company_id;branch_id', laa_values[])
lds_vendor.f_settransobject( it_transaction)
li_cnt = lds_vendor.retrieve( )
if li_cnt > 0 then
	ldw_main = iw_display.f_get_dwmain( )
	laa_values[1] = upper(mid(this.classname(),3))	
	lc_string.f_Stringtoarray(ls_gen_branch ,';', las_gen_branch[])
	FOR li_idx =1 to upperbound(las_gen_branch[])		
		if  lbo_ins.f_is_branch_yn_ex('u_trans_setup', it_transaction )then
			ldb_branch = double(las_gen_branch[li_idx])
		else
			ldb_branch = 0
		end if					
		if this.f_get_dfl_trans_info(laa_values[1]  , ldb_branch, lstr_data,it_transaction ) > 0 then
			ldb_trans_id = lstr_data.db_data
		else
			return -1
		end if	
						
		lc_dwsetup_initial.f_init_ids_setup_dw_ex( double(las_gen_branch[li_idx]), this.classname(), it_transaction)
		lds_vendor.setfilter( "branch_id="+las_gen_branch[li_idx])
		lds_vendor.filter( )		
		FOR li_row = 1 to lds_vendor.rowcount()
			yield()
			li_progress ++
			this.of_show_progress( int(li_progress/li_cnt*100), 'Đang tổng hợp y/c mua .........')
			this.of_set_progress_text( string(li_progress)+'/'+string(li_cnt))
			ldb_branch =  lds_vendor.getitemnumber( li_row, 'branch_id')
			ls_vend_id_list = lds_vendor.getitemstring( li_row, 'VENDOR_ID_LIST')
			if ls_vend_id_list = '' or isnull(ls_vend_id_list) then
				setnull(ldb_vend_id)
				ls_vend_id = 'NULL'
			elseif pos(ls_vend_id_list,';') = 0 then
				ldb_vend_id = double(ls_vend_id_list)
				ls_vend_id = string(ldb_vend_id)
			else
				ldb_vend_id = double(left( ls_vend_id_list, pos(ls_vend_id_list,';') -1 ))
				ls_vend_id = string(ldb_vend_id)
			end if
			ls_dist_id_list = lds_vendor.getitemstring( li_row, 'DISTRIBUTE_ID_LIST')
			if ls_dist_id_list = '' or isnull(ls_dist_id_list) then
				setnull(ldb_dist_id)
				ls_dist_id = 'NULL'
			elseif pos(ls_dist_id_list,';') = 0 then
				ldb_dist_id = double(ls_dist_id_list)
				ls_dist_id = string(ldb_dist_id)
			else
				ldb_dist_id = double(left( ls_dist_id_list, pos(ls_dist_id_list,';') -1 ))
				ls_dist_id = string(ldb_dist_id)
			end if			
			ldb_doc_id = lbo_ins.f_create_id_ex( it_transaction)
			ldb_ver_id = lbo_ins.f_create_id_ex( it_transaction)
			if ldb_vend_id > 0 then
				lbo_ins.f_get_vend_info( ldb_vend_id, ladb_vend_info[], it_transaction )
			elseif ldb_dist_id > 0 then
				lbo_ins.f_get_vend_info( ldb_dist_id, ladb_vend_info[], it_transaction )
			end if
			//-- currency --//
			if ladb_vend_info[1] = 0 or isnull(ladb_vend_info[1]) then
				lc_unit.f_get_base_cur_ex(ldb_base_cur,  ls_base_curcode,ls_base_curname, it_transaction )
			else
				ldb_base_cur = ladb_vend_info[1]
			end if
			//-- ls_payterm --//
			if ladb_vend_info[2] = 0 or isnull(ladb_vend_info[2]) then
				ls_payterm = 'NULL'
			else
				ls_payterm = string(ladb_vend_info[2])
			end if		
			//-- ls_paymethod --//
			if ladb_vend_info[3] = 0 or isnull(ladb_vend_info[3]) then
				ls_paymethod = 'NULL'
			else
				ls_paymethod = string(ladb_vend_info[3])
			end if		
			//-- ls_delivery_mode --//
			if ladb_vend_info[4] = 0 or isnull(ladb_vend_info[4]) then
				ls_delivery_mode = 'NULL'
			else
				ls_delivery_mode = string(ladb_vend_info[4])
			end if					
			
			ls_code = lc_dwsetup_initial.f_get_autonumber_ex( 'code', ldw_main, 0, it_transaction)
			
			//-- insert document --//			
			insert into document (id,  SOB, company_id, branch_id, object_ref_table, created_by, created_date, last_mdf_by, last_mdf_date, handled_by,version_id, doc_type,  status, 
										TRANS_HDR_ID, document_date, code)	
			values(:ldb_doc_id, 'F', :gi_user_comp_id, :ldb_branch, 'ORDERS',:gi_userid, sysdate, :gi_userid, sysdate, :gi_userid, :ldb_ver_id, 'PO', 'planned',
					:ldb_trans_id, :gd_session_date, :ls_code) using it_transaction;
			
			//-- insert orders --//
			ls_sql = "insert into orders (id, company_id, branch_id, object_ref_id, object_ref_table, created_by, created_date, last_mdf_by, last_mdf_date, version_no, doc_type,"+&
						"OBJECT_ID, BILL_TO_OBJECT, REQUEST_SHIP_DATE, CURRENCY_ID, exchange_rate, PAYMENT_TERM, PAYMENT_METHOD, delivery_mode)	"+&
						" values("+string(ldb_ver_id)+", "+string(gi_user_comp_id)+", "+string(ldb_branch)+","+string(ldb_doc_id)+", 'DOCUMENT',"+string(gi_userid)+", sysdate, "+string(gi_userid)+", sysdate, 1, 'PO',"+&
						ls_dist_id +", "+ls_vend_id +", null , "+string(ldb_base_cur)+", 1," + ls_payterm+", "+ls_paymethod+" , "+ls_delivery_mode+")"
			execute immediate :ls_sql using it_transaction;
			//-- insert po_line --//
			
			if ldb_dist_id > 0 and ldb_vend_id > 0 then
				insert into po_line (id, company_id, branch_id, object_ref_id, object_ref_table, created_by, created_date, last_mdf_by, last_mdf_date,
											ITEM_ID, LINE_TEXT, QTY, PRICE, AMOUNT,  TRANS_UOM, BASE_AMOUNT, VAT, VAT_AMOUNT)	
				select seq_table_id.nextval,:gi_user_comp_id, :ldb_branch,:ldb_ver_id, 'ORDERS',:gi_userid, sysdate, :gi_userid, sysdate,
						 ITEM_ID, NAME, qty, null, null, trans_uom, null, null, null from v_pr_line_4_gen
				where vendor_id_list = :ls_vend_id_list and DISTRIBUTE_ID_LIST = :ls_dist_id_list  and company_id = :gi_user_comp_id and branch_id = :ldb_branch
				using it_transaction;			

			elseif ldb_dist_id > 0 and isnull(ldb_vend_id) then
				insert into po_line (id, company_id, branch_id, object_ref_id, object_ref_table, created_by, created_date, last_mdf_by, last_mdf_date,
											ITEM_ID, LINE_TEXT, QTY, PRICE, AMOUNT,  TRANS_UOM, BASE_AMOUNT, VAT, VAT_AMOUNT)	
				select seq_table_id.nextval,:gi_user_comp_id, :ldb_branch,:ldb_ver_id, 'ORDERS',:gi_userid, sysdate, :gi_userid, sysdate,
						 ITEM_ID, name, qty, null, null, trans_uom,null, null, null from v_pr_line_4_gen
				where DISTRIBUTE_ID_LIST = :ls_dist_id_list and vendor_id_list is null  and company_id = :gi_user_comp_id and branch_id = :ldb_branch
				using it_transaction;				

			elseif  isnull(ldb_dist_id) and ldb_vend_id > 0 then
				insert into po_line (id, company_id, branch_id, object_ref_id, object_ref_table, created_by, created_date, last_mdf_by, last_mdf_date,
											ITEM_ID, LINE_TEXT, QTY, PRICE, AMOUNT,  TRANS_UOM, BASE_AMOUNT, VAT, VAT_AMOUNT)	
				select seq_table_id.nextval,:gi_user_comp_id, :ldb_branch,:ldb_ver_id, 'ORDERS',:gi_userid, sysdate, :gi_userid, sysdate,
						 ITEM_ID, name, qty, null, null, trans_uom, null, null, null from v_pr_line_4_gen
				where DISTRIBUTE_ID_LIST is null and vendor_id_list = :ls_vend_id_list and company_id = :gi_user_comp_id and branch_id = :ldb_branch
				using it_transaction;					
				
			elseif  isnull(ldb_dist_id) and  isnull(ldb_vend_id) then
				insert into po_line (id, company_id, branch_id, object_ref_id, object_ref_table, created_by, created_date, last_mdf_by, last_mdf_date,
											ITEM_ID, LINE_TEXT, QTY, PRICE, AMOUNT,  TRANS_UOM, BASE_AMOUNT, VAT, VAT_AMOUNT)	
				select seq_table_id.nextval,:gi_user_comp_id, :ldb_branch,:ldb_ver_id, 'ORDERS',:gi_userid, sysdate, :gi_userid, sysdate,
						 ITEM_ID, name, qty, best_price, qty*best_price, trans_uom, qty*best_price, null, null from v_pr_line_4_gen
				where DISTRIBUTE_ID_LIST is null and vendor_id_list is null  and company_id = :gi_user_comp_id and branch_id = :ldb_branch
				using it_transaction;	
				
			end if			
		NEXT		
		//-- update PR status sau khi ket thuc 1 branch--//
		UPDATE document t set t.status = 'generated'
		where t.id in (select distinct pr_doc_id from v_pr_line_4_gen 
							where 
							company_id = :gi_user_comp_id 
							and branch_id = :ldb_branch)
		using it_transaction;	
	NEXT

	this.of_show_progress( 101, 'Đang tổng hợp y/c mua .........')
	gf_messagebox('m.c_po.e_action_generate.01','Thông báo','Tổng hợp hoàn thành', 'information','ok',1)
	ldw_main.event e_refresh( )
else
	gf_messagebox('m.c_po.e_action_generate.02','Thông báo','Không có yêu cầu mua chưa tổng hợp', 'information','ok',1)
end if
commit using it_transaction;
disconnect using it_transaction;

return 1
end event

event type integer e_action_complete();long			ll_found
string			ls_vend_name, ls_dist_name, ls_find_string, ls_status
double		ldb_rtn, ldb_qt_ID
any			laa_value[]
s_str_dwo_related		lstr_related[], lstr_data_related[]
t_dw_mpl				ldw_main, ldw_line
s_object_display 		lpo_related
t_ds_db					lads_copied[]
b_obj_instantiate		lbo_ins

connect using it_transaction;

ldw_main = iw_display.f_get_dwmain( )
ll_found = ldw_main.find("gutter ='Y' ",1 , ldw_main.rowcount())
if ll_found = 0 then
	ll_found = ldw_main.getrow()
end if
ldb_qt_ID = ldw_main.getitemnumber( ll_found, 'id')
//-- check status --//
select status into :ls_status from document where id = :ldb_qt_ID using it_transaction;
if ls_status <> 'new' then
	gf_messagebox('m.c_qt.e_action_completed.01','Thông báo','Chào giá đã bị thay đổi trạng thái','information','ok',1)
	disconnect using it_transaction;
	iw_display.event e_refresh( )
	return 0
end if

//get data de build where related
this.f_get_data_related('u_so', lstr_data_related[]) 
//build where related
iw_display.f_build_data_related( lstr_data_related[])  

this.dynamic f_get_dwo_related(lstr_related) 
if iw_display.dynamic f_get_data_copied_ex( lads_copied[],lstr_related,'copyt','u_so') > 0 then
	lpo_related = create using 'u_so'
	ldb_rtn = lbo_ins.f_copy_to_so( lstr_data_related[], lads_copied[], it_transaction ,lpo_related.idwsetup_initial )			
	if ldb_rtn > 0 then
		lpo_related.f_set_main_id(ldb_rtn )
		iw_display.event e_change_object_appeon( lpo_related)			
		//-- update QT status--//
		Update DOCUMENT set status = 'completed' where id = :ldb_qt_ID using it_transaction;
		commit using it_transaction;
	else
		destroy lpo_related
	end if
end if
disconnect using it_transaction;
return 1			
end event

event type integer e_action_lose();t_ds_db			lds_return
t_dw_mpl		ldw_orders

b_popup_data	lb_popup_data
string				ls_reason_lose
int					li_rtn
double			ldb_ver_id
t_dw_mpl		ldw_main

//ldw_orders = iw_display.f_get_dw(istr_dwo[2].s_dwo_default)
//ls_reason_lose = ldw_orders.getitemstring( ldw_orders.getrow(), 'reason_lose')
lb_popup_data = create b_popup_data
lb_popup_data.f_init_popup_display( '1d', 'dp_reason_lose_form','Nhập lý do chào giá chưa đạt','Nêu lý do','Nêu lý do chào giá chưa đạt', 3500, 1000)
lb_popup_data.is_display_column = 'reason_lose;'
lb_popup_data.iaa_default_data[1] = ls_reason_lose
openwithparm(s_wr_multi, lb_popup_data)
lds_return = message.powerobjectparm
if isvalid(lds_return) then
	setnull( message.powerobjectparm)
	ls_reason_lose = lds_return.getitemstring( 1, 'reason_lose')
	if isnull(ls_reason_lose) then ls_reason_lose = ''
	connect using it_transaction;
	ldw_main = iw_display.f_get_dwmain( )
	ldb_ver_id  = ldw_main.getitemnumber(ldw_main.getrow() , 'version_id')
	
	UPDATE orders set reason_lose = :ls_reason_lose where id = :ldb_ver_id using it_transaction;
	if it_transaction.sqlcode = 0 then
		ldw_main.setitem(ldw_main.getrow(), 'reason_lose', ls_reason_lose)
		ldw_main.setitem(ldw_main.getrow(), 'status', 'lose')
		ldw_main.settransobject(it_transaction )
		ldw_main.update( )		
		commit using it_transaction;
	else 
		rollback using  it_transaction;
	end if
	disconnect using it_transaction;
end if
destroy lds_return
destroy lb_popup_data

iw_display.event e_refresh( )
return 0
end event

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_document_qt_grid'
istr_dwo[1].s_dwo_form = 'd_document_qt_form'
istr_dwo[1].s_dwo_grid = 'd_document_qt_grid'
istr_dwo[1].b_master = false
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_details = '' 
istr_dwo[1].b_ref_table_yn  = false
istr_dwo[1].s_ref_table_field = ';'
//istr_dwo[1].b_relation_1_1 = true
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_gb_name = 'gb_6'
istr_dwo[1].s_description = 'Chào giá'

/*
istr_dwo[2].s_dwo_default =  'd_order_form'
istr_dwo[2].s_dwo_form = 'd_order_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = true
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_details = 'd_po_line_grid;'
istr_dwo[2].s_dwo_master = 'd_document_pm_grid;'
istr_dwo[2].s_master_keycol = 'ID;'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[2].b_ref_table_yn  = true
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE;DOC_TYPE;ID'
istr_dwo[2].b_relation_1_1 = true
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].b_focus_master = true
istr_dwo[2].s_description = 'Mua hàng'

istr_dwo[3].s_dwo_default =  'd_po_line_grid'
istr_dwo[3].s_dwo_form = 'd_po_line_form'
istr_dwo[3].s_dwo_grid = 'd_po_line_grid'
istr_dwo[3].b_detail = true
istr_dwo[3].b_master = true
istr_dwo[3].b_cascade_del = true
istr_dwo[3].s_dwo_master = 'd_order_form;'
istr_dwo[3].s_dwo_details = 'd_order_catch_grid;d_tax_line_grid;'
istr_dwo[3].s_master_keycol = 'ID;'
istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID'
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
istr_dwo[3].s_description = 'Chi tiết đặt mua'

istr_dwo[4].s_dwo_default =  'd_tax_line_grid'
istr_dwo[4].s_dwo_form = ''
istr_dwo[4].s_dwo_grid = 'd_tax_line_grid'
istr_dwo[4].b_detail = true
istr_dwo[4].s_dwo_master = 'd_po_line_grid;'
istr_dwo[4].s_dwo_details = ''
istr_dwo[4].s_master_keycol = 'ID;'
istr_dwo[4].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[4].b_ref_table_yn  = false
istr_dwo[4].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[4].b_relation_1_1 = true
istr_dwo[4].b_insert = false
istr_dwo[4].b_update = true
istr_dwo[4].b_delete = false
istr_dwo[4].b_query = true
istr_dwo[4].b_print = true
istr_dwo[4].b_excel = true
istr_dwo[4].b_traceable = true
istr_dwo[4].b_keyboardlocked = true
istr_dwo[4].s_gb_name = 'gb_8'
istr_dwo[4].s_description = 'Thuế'

istr_dwo[5].s_dwo_default =  'd_order_catch_grid'
istr_dwo[5].s_dwo_form = ''
istr_dwo[5].s_dwo_grid = 'd_order_catch_grid'
istr_dwo[5].b_detail = true
istr_dwo[5].s_dwo_master = 'd_po_line_grid;'
istr_dwo[5].s_master_keycol = 'ID;'
istr_dwo[5].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[5].b_ref_table_yn  = false
istr_dwo[5].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[5].b_insert = true
istr_dwo[5].b_update = true
istr_dwo[5].b_delete = true
istr_dwo[5].b_query = true
istr_dwo[5].b_print = true
istr_dwo[5].b_excel = true
istr_dwo[5].b_traceable = true
istr_dwo[5].b_focus_master = false 
istr_dwo[5].b_keyboardlocked = true
istr_dwo[5].s_gb_name = 'gb_9'
istr_dwo[5].s_description = 'Chi tiết kiểm đếm'
*/
end subroutine

public subroutine f_set_dwo_related ();
istr_dwo_related[1].s_related_obj_name = 'u_so'					// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = istr_dwo[1].s_dwo_default	//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'd_document_so_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].b_f_matching = true
//istr_dwo_related[1].b_return = true //la doi duong tra hang
istr_dwo_related[1].s_relatedtext_column = 'code'					
istr_dwo_related[1].s_text = 'Đơn bán hàng từ: '

istr_dwo_related[1].s_main_obj_dwo_copy[1] = 'd_document_qt_form' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[1] = 'object_id;bill_to_object;PAYMENT_TERM;PAYMENT_METHOD;DELIVERY_MODE;REQUEST_SHIP_DATE;BILL_TO_ADDTEXT;CURRENCY_ID;EXCHANGE_RATE;'
istr_dwo_related[1].s_related_obj_dwo_copy[1] = 'd_document_so_form' // datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[1]= 'object_id;bill_to_object;PAYMENT_TERM;PAYMENT_METHOD;DELIVERY_MODE;REQUEST_SHIP_DATE;BILL_TO_ADDTEXT;CURRENCY_ID;EXCHANGE_RATE;'

istr_dwo_related[1].s_main_obj_dwo_copy[2] = 'd_qt_line_grid' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[2] =  'line_no;ITEM_ID;LINE_TEXT;NOTE;other_note;QTY;act_qty;price;act_price;amount;act_amount;not_invoice;foc_yn;'+&
																			'TRANS_UOM;SALES_PERSON;base_price;base_amount;amount_ex_tax;act_amount_ex_tax;' +&
																			'BASE_AMOUNT_EX_TAX;ACT_BASE_AMOUNT_EX_TAX;price_ex_tax;act_price_ex_tax;'// cột copy từ
istr_dwo_related[1].s_related_obj_dwo_copy[2] = 'd_so_line_grid' // datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[2] = 'line_no;ITEM_ID;LINE_TEXT;NOTE;other_note;QTY;act_qty;price;act_price;amount;act_amount;not_invoice;foc_yn;'+&
																		'TRANS_UOM;SALES_PERSON;base_price;base_amount;amount_ex_tax;act_amount_ex_tax;' +&
																		'BASE_AMOUNT_EX_TAX;ACT_BASE_AMOUNT_EX_TAX;price_ex_tax;act_price_ex_tax;'// cột copy đến
istr_dwo_related[1].s_main_obj_column_chk[2] = ''
istr_dwo_related[1].s_related_obj_column_chk[2] = ''
istr_dwo_related[1].s_f_obj_column_chk[2] = 'ITEM_ID;PRICE;NOT_INVOICE;foc_yn;'
istr_dwo_related[1].s_t_obj_column_chk[2] = 'ITEM_ID;PRICE;NOT_INVOICE;foc_yn;'
istr_dwo_related[1].b_copy_line[2] = true
// khai báo cập nhật bảng matching
istr_dwo_related[1].s_match_f_dwo[2] = 'd_qt_line_grid'
istr_dwo_related[1].s_match_f_col_obj[2] = 'item_id' //--cho phép hàng hóa dịch vụ
istr_dwo_related[1].s_match_t_dwo[2] = 'd_so_line_grid'
istr_dwo_related[1].s_match_f_column[2] = 'qty'
istr_dwo_related[1].s_match_t_column[2] = 'qty'
istr_dwo_related[1].s_match_column[2] = 'qty'

istr_dwo_related[1].s_main_obj_dwo_copy[3] = 'd_tax_line_grid' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[3] = 'tax_pct;tax_correction;tax_id;TRANS_CURRENCY;exchange_rate;'
istr_dwo_related[1].s_related_obj_dwo_copy[3] = 'd_tax_line_grid' // datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[3] = 'tax_pct;tax_correction;tax_id;TRANS_CURRENCY;exchange_rate;'
//istr_dwo_related[1].s_main_obj_column_chk[3] = 'item_id;item_code;item_name;'
//istr_dwo_related[1].s_related_obj_column_chk[3] = 'item_id;object_code;line_text;'

istr_dwo_related[1].s_main_obj_column_chk[3] = ''
istr_dwo_related[1].s_related_obj_column_chk[3] = ''
istr_dwo_related[1].s_match_f_dwo[3] = ''
istr_dwo_related[1].s_match_t_dwo[3] = ''
istr_dwo_related[1].s_main_obj_column_sum[3] = ''
istr_dwo_related[1].s_related_obj_column_sum[3] = ''
istr_dwo_related[1].s_f_obj_column_chk[3] = ''
istr_dwo_related[1].s_t_obj_column_chk[3] = ''
istr_dwo_related[1].b_f_sum[3] = false
istr_dwo_related[1].b_copy_line[3] = false


istr_dwo_related[2].s_related_obj_name = 'b_view'
istr_dwo_related[2].s_main_obj_dwo = istr_dwo[1].s_dwo_default
istr_dwo_related[2].s_main_obj_column = 'id'
istr_dwo_related[2].s_related_obj_dwo = 'dv_qt_form'
istr_dwo_related[2].s_related_obj_column = 'id'
istr_dwo_related[2].s_relatedtext_column = 'code'
istr_dwo_related[2].s_text = 'In bảng báo giá(VNĐ)'


istr_dwo_related[3].s_related_obj_name = 'u_qt'					// đối tượng copy đến
istr_dwo_related[3].s_main_obj_dwo = 	istr_dwo[1].s_dwo_default//datawindow quan hệ main
istr_dwo_related[3].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[3].s_related_obj_dwo =  istr_dwo[1].s_dwo_default	// datawindow quan hệ đến
istr_dwo_related[3].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[3].b_f_matching = true
istr_dwo_related[3].b_copy_tax = true
istr_dwo_related[3].s_relatedtext_column = 'code'					
istr_dwo_related[3].s_text = 'Nhân bản từ đề xuất bán hàng : '

istr_dwo_related[3].s_main_obj_dwo_copy[1] = 'd_order_qt_form' // datawindow copy từ
istr_dwo_related[3].s_main_obj_column_copy[1] = 'object_id;ship_to_addtext;bill_to_addtext;currency_id;exchange_rate;note;payment_term;payment_method;delivery_mode;'
istr_dwo_related[3].s_related_obj_dwo_copy[1] = 'd_order_qt_form' // datawindow copy đến
istr_dwo_related[3].s_related_obj_column_copy[1]= 'object_id;ship_to_addtext;bill_to_addtext;currency_id;exchange_rate;note;payment_term;payment_method;delivery_mode;'

istr_dwo_related[3].s_main_obj_dwo_copy[2] ='d_qt_line_grid' // datawindow copy từ
istr_dwo_related[3].s_main_obj_column_copy[2] =  'line_no;ITEM_ID;LINE_TEXT;NOTE;other_note;QTY;act_qty;price;act_price;base_price;amount;act_amount;not_invoice;foc_yn;TRANS_UOM;SALES_PERSON;amount_ex_tax;base_amount;'+ &																			
																			'act_amount_ex_tax;act_base_amount_ex_tax;price_ex_tax;act_price_ex_tax;discount;discount_pct;base_amount_ex_tax;' // cột copy từ
istr_dwo_related[3].s_related_obj_dwo_copy[2] = 'd_qt_line_grid' // datawindow copy đến
istr_dwo_related[3].s_related_obj_column_copy[2] = 'line_no;ITEM_ID;LINE_TEXT;NOTE;other_note;QTY;act_qty;price;act_price;base_price;amount;act_amount;not_invoice;foc_yn;TRANS_UOM;SALES_PERSON;amount_ex_tax;base_amount;'+ &																			
																			'act_amount_ex_tax;act_base_amount_ex_tax;price_ex_tax;act_price_ex_tax;discount;discount_pct;base_amount_ex_tax;'
istr_dwo_related[3].s_main_obj_dwo_copy[3] = 'd_tax_line_grid' // datawindow copy từ
istr_dwo_related[3].s_main_obj_column_copy[3] = 'tax_id;tax_pct;tax_amt;tax_correction;TRANS_CURRENCY;exchange_rate;uprow_yn;include_yn;TAX_REPORT_GROUP;'
istr_dwo_related[3].s_related_obj_dwo_copy[3] = 'd_tax_line_grid' // datawindow copy đến
istr_dwo_related[3].s_related_obj_column_copy[3] = 'tax_id;tax_pct;tax_amt;tax_correction;TRANS_CURRENCY;exchange_rate;uprow_yn;include_yn;TAX_REPORT_GROUP;'

istr_dwo_related[3].s_main_obj_column_chk[3] = ''
istr_dwo_related[3].s_related_obj_column_chk[3] = ''
istr_dwo_related[3].s_match_f_dwo[3] = ''
istr_dwo_related[3].s_match_t_dwo[3] = ''
istr_dwo_related[3].s_match_f_column[3] =''
istr_dwo_related[3].s_match_t_column[3] =''
istr_dwo_related[3].s_match_column[3] = ''
istr_dwo_related[3].s_main_obj_column_sum[3] = ''
istr_dwo_related[3].s_related_obj_column_sum[3] = ''
istr_dwo_related[3].s_f_obj_column_chk[3] = ''
istr_dwo_related[3].s_t_obj_column_chk[3] = ''
istr_dwo_related[3].b_f_sum[3] = false


istr_dwo_related[4].s_related_obj_name = 'b_view'
istr_dwo_related[4].s_main_obj_dwo = istr_dwo[1].s_dwo_default
istr_dwo_related[4].s_main_obj_column = 'id'
istr_dwo_related[4].s_related_obj_dwo = 'dv_qt_f_cur_form'
istr_dwo_related[4].s_related_obj_column = 'id'
istr_dwo_related[4].s_relatedtext_column = 'code'
istr_dwo_related[4].s_text = 'In bảng báo giá(USD)'

if	gdb_branch = 24088840 then
	istr_dwo_related[5].s_related_obj_name = 'b_view'
	istr_dwo_related[5].s_main_obj_dwo = istr_dwo[1].s_dwo_default
	istr_dwo_related[5].s_main_obj_column = 'id'
	istr_dwo_related[5].s_related_obj_dwo = 'dv_qt_kni_eng_form'
	istr_dwo_related[5].s_related_obj_column = 'id'
	istr_dwo_related[5].s_relatedtext_column = 'code'
	istr_dwo_related[5].s_text = 'In bảng báo giá Dao-Dầu(eng)'

	istr_dwo_related[6].s_related_obj_name = 'b_view'
	istr_dwo_related[6].s_main_obj_dwo = istr_dwo[1].s_dwo_default
	istr_dwo_related[6].s_main_obj_column = 'id'
	istr_dwo_related[6].s_related_obj_dwo = 'dv_qt_kni_form'
	istr_dwo_related[6].s_related_obj_column = 'id'
	istr_dwo_related[6].s_relatedtext_column = 'code'
	istr_dwo_related[6].s_text = 'In bảng báo giá Dao-Dầu(vn)'
else  // if gdb_branch = 11006119 then
	istr_dwo_related[5].s_related_obj_name = 'b_view'
	istr_dwo_related[5].s_main_obj_dwo = istr_dwo[1].s_dwo_default
	istr_dwo_related[5].s_main_obj_column = 'id'
	istr_dwo_related[5].s_related_obj_dwo = 'dv_qt_kni_eng_asv_form'
	istr_dwo_related[5].s_related_obj_column = 'id'
	istr_dwo_related[5].s_relatedtext_column = 'code'
	istr_dwo_related[5].s_text = 'In bảng báo giá Dao-Dầu(eng)'
	
	istr_dwo_related[6].s_related_obj_name = 'b_view'
	istr_dwo_related[6].s_main_obj_dwo = istr_dwo[1].s_dwo_default
	istr_dwo_related[6].s_main_obj_column = 'id'
	istr_dwo_related[6].s_related_obj_dwo = 'dv_qt_kni_asv_form'
	istr_dwo_related[6].s_related_obj_column = 'id'
	istr_dwo_related[6].s_relatedtext_column = 'code'
	istr_dwo_related[6].s_text = 'In bảng báo giá Dao-Dầu(vn)'
end if
end subroutine

public subroutine f_set_str_unit ();//--Datawindow chứa các cột cần làm tròn--//
istr_unit[1].s_dwo_handing = 'd_po_line_grid;d_po_line_grid;d_po_line_grid;d_po_line_grid;d_document_qt_form;'
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = 'qty;price;amount;base_amount;exchange_rate;'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[1].s_dwo_unit = 'd_po_line_grid;d_document_qt_form;d_document_qt_form;d_document_qt_form;d_document_qt_form'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = 'uom_code;uom_code;uom_code;uom_code;exchange_rate'
//--Loại làm tròn --//
istr_unit[1].s_type = 'item;price;amount;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[1].s_dwo_object = 'd_po_line_grid'
//--Cột chứa mã đơn vị--//
istr_unit[1].s_colname_object = 'item_code'
end subroutine

public function integer f_resize_fixedpart_grid ();this.iw_display.dynamic f_reset_ii_fixedpart2_height_grid(0)
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_resize_fixedpart_form ();this.iw_display.dynamic f_reset_ii_fixedpart2_height_form()
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_reset_fixedpart_grid ();this.iw_display.dynamic f_reset_ii_fixedpart2_height_grid()
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function double f_get_pr_doc_id (string vs_t_ref_table, double vdb_t_doc_id);double 		ldb_doc_id

if upper(vs_t_ref_table) =  'PO_LINE' then
		// PO -> PR
		SELECT DISTINCT MAT2.F_DOC_ID into :ldb_doc_id 
		FROM DOCUMENT DOC //PUR
			 JOIN MATCHING MAT1 ON MAT1.T_DOC_ID = DOC.ID AND MAT1.F_REF_TABLE = 'PO_LINE' //INVEN
			 JOIN MATCHING MAT2 ON MAT2.T_DOC_ID = MAT1.F_DOC_ID AND MAT2.F_REF_TABLE = 'PR_LINE' //PO
		WHERE DOC.ID = :vdb_t_doc_id using SQLCA;
		if SQLCA.SQLCODE = 100 then
			// PUR -> PO
			SELECT DISTINCT MAT1.F_DOC_ID into :ldb_doc_id 
			FROM DOCUMENT DOC //PUR
				 JOIN MATCHING MAT1 ON MAT1.T_DOC_ID = DOC.ID AND MAT1.F_REF_TABLE = 'PR_LINE' //PO
			WHERE DOC.ID = :vdb_t_doc_id using SQLCA;
		end if
end if
if isnull(ldb_doc_id) then ldb_doc_id = 0
if SQLCA.sqlcode = -1 then ldb_doc_id = -1
return ldb_doc_id
end function

on c_qt.create
call super::create
end on

on c_qt.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = true
is_display_model = '1d'
ib_display_text = false
is_object_title ='Chào giá'
is_exrate_type = 'sell'
istr_actionpane[1].s_button_name = 'b_preview;b_view;b_view_qt;b_send_2_approve;b_approve;b_reject;e_action_complete;e_action_lose;b_copyt;u_so;b_related_object;'
istr_actionpane[1].s_button_name += 'b_doc_trace;b_cancel;b_self_copy;e_add;e_modify;e_delete;e_detail;b_copyt_so;b_copyt_bank_voucher;b_update;'
istr_actionpane[1].s_button_has_sub ='b_related_object;b_update;b_approve;b_view;b_copyt;b_copyf;'
istr_actionpane[1].sa_sub_button[1]='u_so;'
istr_actionpane[1].sa_subbutton_name[1]='Đơn bán hàng(SO);'
istr_actionpane[1].sa_sub_button[2]='e_action_complete;e_action_lose;'
istr_actionpane[1].sa_subbutton_name[2]='Thành công;Không thành;'
istr_actionpane[1].sa_sub_button[3]=''	//'b_send_2_approve;b_approve;b_reject;'
istr_actionpane[1].sa_subbutton_name[3]=''	//'Gửi duyệt;Duyệt;Trả duyệt'
istr_actionpane[1].sa_sub_button[4]='b_view_qt;'
istr_actionpane[1].sa_subbutton_name[4]='Chào giá;'
istr_actionpane[1].sa_sub_button[5]='b_copyt_so;b_copyt_bank_voucher;'
istr_actionpane[1].sa_subbutton_name[5]='Tạo SO(Đơn bán hàng);Thu tiền;'
istr_actionpane[1].sa_sub_button[6]=''
istr_actionpane[1].sa_subbutton_name[6]=''



//if	gdb_branch = 24088840 then
//	istr_actionpane[1].sa_sub_button[2]='b_view_qt;b_view_qt_f_cur;b_view_qt_kni_eng;b_view_qt_kni;'
//else
//	istr_actionpane[1].sa_sub_button[2]='b_view_qt;b_view_qt_f_cur;b_view_qt_kni_eng_asv;b_view_qt_kni_asv;'
//end if
//istr_actionpane[1].sa_sub_button[3]='b_copyt_po_return;b_copyt_goods_receipt;b_copyt_pur_invoice;'
//istr_actionpane[1].sa_sub_button[4]='b_view_po;b_view_po_eng;'
//istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_description = is_object_title
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;double						ldb_version_id
b_obj_instantiate			lbo_ins

ldb_version_id = lbo_ins.f_Create_id_ex( it_transaction )
rpo_dw.setitem(vl_currentrow,'doc_type','QT')
rpo_dw.setitem(vl_currentrow,'object_ref_table','ORDERS')
rpo_dw.setitem(vl_currentrow,'version_id',ldb_version_id)
rpo_dw.setitem(vl_currentrow,'expired_date',relativeDate(gd_session_date,30 ) )

return vl_currentrow
end event

event e_action_ctrl_bttn;call super::e_action_ctrl_bttn;datawindow				ldw_focus
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_join_multi;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_detail;b_blank;b_copyt_multi;b_blank;b_view_po;b_blank;b_send_2_approve;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_join_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_detail;b_blank;b_copyt_multi;b_blank;b_view_po;b_blank;b_send_2_approve;b_approve;b_reject;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_detail;b_blank;b_copyt_multi;b_blank;b_view_po;b_blank;b_send_2_approve;b_total;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query; b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_detail;b_blank;b_copyt_multi;b_blank;b_view_po;b_blank;b_send_2_approve;b_total;b_approve;b_reject;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_modify;b_detail;b_filteron;b_refresh;b_delete;b_cancel;b_view_multi;b_send_2_approve;b_approve;b_reject;b_completed;b_lose;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_copyt_multi;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_total;b_cancel;b_detail;b_blank;b_copyt_multi;b_blank;b_view_multi;b_blank;b_send_2_approve;b_approve;b_reject;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =   'b_so;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
				istr_actionpane[li_idx].s_visible_buttons =  'b_book;b_attach;b_doc_trace_on;b_user_trace;b_appr_trace;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
				
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_open;call super::e_window_open;
/*
t_dw_mpl			ldw_main
b_obj_instantiate		lobj_ins
any				laa_value[],laa_null[]
string				ls_int_string
//--form parm--//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '=PO'
ldw_main.f_add_where('doc_type;',laa_value[])

if ids_tax_authority.rowcount() = 0 then
	laa_value[1] = '>0'
	
	ls_int_string = 'object_ref_id;'
	if lobj_ins.f_is_branch_yn('u_tax_authority')  then
		laa_value[2] = gdb_branch
		ls_int_string = 'object_ref_id;branch_id;'
	end if			
	
	this.f_init_object_table(ids_tax_authority, 'd_tax_authority_form', ls_int_string,laa_value[],laa_null[])
end if
if ids_currency.rowcount( ) = 0 then
	laa_value[1] = '=Y'
	this.f_init_object_table(ids_currency, 'd_currency_grid', 'base_yn',laa_value, laa_null[])
end if
*/
return 0
end event

event e_dw_updatestart;call super::e_dw_updatestart;/*
double		ldb_qty,ldb_price,ldb_id
string			ls_filter
long			ll_row

t_dw_mpl		ldw_tax

if rdw_requester.dataobject = istr_dwo[3].s_dwo_default then
	if ids_matching.rowcount( ) > 0 then
		ldw_tax = iw_display.f_get_dw(istr_dwo[4].s_dwo_default )
		ls_filter = ldw_tax.describe( "datawindow.table.filter")
		for ll_row = 1 to rdw_requester.rowcount( )
			ldb_id = rdw_requester.getitemnumber(ll_row,'id')
			ldw_tax.setfilter( "object_ref_id = " + string(ldb_id))
			ldw_tax.filter( )
			ldb_price = rdw_requester.getitemnumber( ll_row, 'price')
			this.event e_dw_e_itemchanged( rdw_requester, ll_row, 'price', string(ldb_price))
		next
		ldw_tax.setfilter( ls_filter)
		ldw_tax.filter( )
	end if
end if
*/
return 0
end event

event e_dw_e_postsave;call super::e_dw_e_postsave;double		ldb_doc_id, ldb_extend_id, ldb_billto_id, ldb_object_id, ldb_payment_term, ldb_payment_method, ldb_delivery_mode
double		ldb_base_curr_id, ldb_exrate
string			ls_cust_yn, ls_taxnumber, ls_addr, ls_phone, ls_currCode, ls_currName, ls_ship_address, ls_contact_person
date			ld_exp_date


ldb_doc_id =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'id') 
if ldb_doc_id > 0 then
	
	//-- ORDERS--//
	ldb_extend_id = rpo_dw.getitemnumber(rpo_dw.getrow(), 'extend_id') 
	ldb_billto_id = rpo_dw.getitemnumber(rpo_dw.getrow(), 'bill_to_object') 
	ldb_object_id =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'object_id') 
	ldb_payment_term =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'payment_term') 
	ldb_payment_method =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'payment_method') 
	ldb_delivery_mode =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'delivery_mode') 
	ldb_exrate = rpo_dw.getitemnumber(rpo_dw.getrow(), 'exchange_rate') 
	ldb_base_curr_id = rpo_dw.getitemnumber(rpo_dw.getrow(), 'currency_id') 	
	
	if isnull(ldb_base_curr_id) then 
		this.ic_unit_instance.f_get_base_cur_ex( ldb_base_curr_id,ls_currCode, ls_currName, it_transaction )
		ldb_exrate = 1
	end if
	
	ld_exp_date = date(rpo_dw.getitemdatetime(rpo_dw.getrow(), 'expired_date') )
	ls_addr = rpo_dw.getitemstring(rpo_dw.getrow(), 'bill_to_addtext') 
	ls_ship_address = rpo_dw.getitemstring(rpo_dw.getrow(), 'ship_to_addtext') 
	ls_contact_person = rpo_dw.getitemstring(rpo_dw.getrow(), 'contact_person') 
	ls_phone = rpo_dw.getitemstring(rpo_dw.getrow(), 'phone') 
	
	if ldb_extend_id > 0 then
		//-- update--//		
		UPDATE orders 
		set bill_to_object = :ldb_billto_id , object_id =:ldb_object_id, payment_term= :ldb_payment_term, 
								payment_method = :ldb_payment_method, delivery_mode =:ldb_delivery_mode,
								currency_id = :ldb_base_curr_id, exchange_rate = :ldb_exrate, expired_date = :ld_exp_date,
								bill_to_addtext = :ls_addr, ship_to_addtext = :ls_ship_address, contact_person = :ls_contact_person, phone = :ls_phone
		where id = :ldb_extend_id using it_transaction;
	else
		//-- insert--//
		ldb_extend_id =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'version_id') 
		INSERT into orders (id, object_ref_id, object_ref_Table, company_id, branch_id, created_by, created_Date, last_mdf_by, last_mdf_date, doc_type,version_no,
								  bill_to_object, object_id, payment_term, payment_method, delivery_mode, currency_id, exchange_rate, expired_date, bill_to_addtext,
								  ship_to_addtext, contact_person, phone)
		VALUES (:ldb_extend_id, :ldb_doc_id, 'DOCUMENT',:gi_user_comp_id, :gdb_branch, :gi_userid, sysdate, :gi_userid, sysdate,'QT', 1,
					:ldb_billto_id,:ldb_object_id,:ldb_payment_term, :ldb_payment_method, :ldb_delivery_mode,:ldb_base_curr_id, :ldb_exrate ,:ld_exp_date, :ls_addr,
					:ls_ship_address, :ls_contact_person, :ls_phone)
		using it_transaction;
	end if

	return 1
end if
return 0
end event

event e_dw_e_predelete;call super::e_dw_e_predelete;double		ldb_extend_id, ldb_doc_id
int				li_cnt
string			ls_doc_code

b_obj_instantiate		lbo_ins

	//-- check matching --//
	ldb_doc_id = rpo_dw.getitemnumber(vl_currentrow, 'id') 
	select count(id) into :li_cnt
	from matching where f_doc_id = :ldb_doc_id using it_transaction;
	if li_cnt > 0 then
		select t_doc_id into :ldb_doc_id
			from matching where f_doc_id = :ldb_doc_id  and rownum = 1 using it_transaction;
			
		ls_doc_code = lbo_ins.f_get_doc_code( ldb_doc_id, it_transaction)
		if isnull(ls_doc_code) then ls_doc_code = ''
		gf_messagebox('m.c_qt.e_dw_e_predelete.01','Thông báo','Không xoá được phiếu đã kết với chứng từ khác, có số:@'+ls_doc_code,'stop','ok',1)
		return -1
	end if
	//-- delete matching--//
	select count(id) into :li_cnt
	from matching where t_doc_id = :ldb_doc_id using it_transaction;	
	if li_cnt > 0 then
		delete from matching where t_doc_id = :ldb_doc_id using it_transaction;	
	end if
	
	//-- delete detail--//
	ldb_extend_id = rpo_dw.getitemnumber(vl_currentrow, 'extend_id') 
	if ldb_extend_id > 0 then
//		iw_display.f_get_transaction(it_transaction)

		DELETE  orders where id = :ldb_extend_id using it_transaction;
		//-- Xoá tax_line --//
		DELETE  tax_line where doc_version = :ldb_extend_id using it_transaction;
		//-- QT_LINE--//
		DELETE  qt_line where object_ref_id = :ldb_extend_id using it_transaction;
	end if

return 1
end event

event e_dw_dwnkey;call super::e_dw_dwnkey;string					ls_colname

//if v_keycode = KeyEnter! then
//	ls_colname = rpo_dw.getcolumnname()
//	if ls_colname = 'payment_method_code' then
//		iw_display.dynamic event e_detail( )
//		return 2
//	end if
//end if
return 0
end event

event e_window_e_detail_start;call super::e_window_e_detail_start;
t_dw_mpl 			ldw_main
ldw_main = iw_display.f_get_dwmain( )
if ldw_main.getrow() = 0 then return -1
if ldw_main.f_get_ib_editing( ) then
	if iw_display.event e_save( ) = -1 then return -1
	ldw_main.f_set_ib_editing( true)
else
	return 0
end if
end event

event e_window_e_change_object;call super::e_window_e_change_object;long				ll_found
t_dw_mpl		ldw_main

ldw_main = iw_display.f_get_dwmain( )

ll_found = ldw_main.find( "Id=" +string( idb_main_id ), 1, ldw_main.rowcount())
if ll_found > 0 then
	ldw_main.scrolltorow( ll_found)
end if
return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;
any		laa_value[1]
string		ls_upd_colname, ls_editColname

t_ds_db					lds_line
b_obj_instantiate		lob_ins
s_str_data				lstr_currency
choose case vs_colname
	case 'uom_code','exchange_rate'
		laa_value[1]  = rpo_dw.getitemnumber(vl_currentrow, 'version_id')
		lds_line = create t_ds_db
		lds_line.dataobject = 'd_qt_line_grid'
		lds_line.f_add_where('object_ref_id;',laa_value[])		
		lstr_currency.adb_data[1] = rpo_dw.getitemnumber(vl_currentrow, 'currency_id')
		ls_editColname = 'qty;price;tax_pct;discount_pct;'
		ls_upd_colname = 'base_price;amount;base_amount;amount_ex_tax;base_amount_ex_tax;tax_correction;act_qty;act_amount;act_amount_ex_tax;act_base_amount_ex_tax;'
		if vs_colname = 'uom_code' then
			lstr_currency.adb_data[2] = rpo_dw.getitemnumber(vl_currentrow, 'exchange_rate')
		elseif vs_colname = 'exchange_rate' then
			lstr_currency.adb_data[2] = double(vs_editdata)			
		end if
		gf_messagebox('m.c_qt.e_dw_e_itemchanged.01','Xác nhận','Hệ thống tự động cập nhật lại tỷ giá trong chi tiết chào giá','information','ok',1)
		lob_ins.f_update_hdr_itemchanged_ex( ls_editColname, vs_editdata, ls_upd_colname, lds_line, it_transaction , lstr_currency)
		destroy lds_line
end choose
return 0
end event

