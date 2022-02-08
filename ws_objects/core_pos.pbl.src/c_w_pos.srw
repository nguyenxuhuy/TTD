$PBExportHeader$c_w_pos.srw
forward
global type c_w_pos from window
end type
type ole_1 from olecustomcontrol within c_w_pos
end type
type dw_cust_his from t_dw_pos within c_w_pos
end type
type st_promotion from statictext within c_w_pos
end type
type st_dosage from statictext within c_w_pos
end type
type dw_promotion from t_dw_pos within c_w_pos
end type
type dw_dosage from t_dw_pos within c_w_pos
end type
type dw_func from t_dw_pos within c_w_pos
end type
type dw_online from t_dw_pos within c_w_pos
end type
type dw_suspend from t_dw_pos within c_w_pos
end type
type dw_doc from t_dw_pos within c_w_pos
end type
type dw_bill_line from t_dw_pos within c_w_pos
end type
type dw_scan_barcode from t_dw_pos within c_w_pos
end type
type gb_2 from groupbox within c_w_pos
end type
type gb_1 from groupbox within c_w_pos
end type
type st_suspend from statictext within c_w_pos
end type
type st_online from statictext within c_w_pos
end type
end forward

global type c_w_pos from window
integer width = 3598
integer height = 1992
boolean titlebar = true
string title = "TTĐ-POS"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event e_action_newbill ( )
event e_action_pay ( )
event e_action_printbill ( )
event e_action_briefbill ( )
event e_action_return ( )
event e_action_findbill ( )
event e_action_dosage ( )
event e_action_deliver ( )
event e_action_newcustomer ( )
event e_action_adj_amount ( )
event e_action_delete ( )
event e_action_other_amount ( )
event e_action_newpr ( )
event e_action_pay_not_print ( )
event e_action_focus_scan ( )
event e_action_refresh ( )
event e_action_newbill_shortcut ( )
event e_action_pay_brief ( c_str_pos vc_str_pos )
event e_action_newbill_pay ( double vdb_amount )
event e_action_print_4_chk ( )
ole_1 ole_1
dw_cust_his dw_cust_his
st_promotion st_promotion
st_dosage st_dosage
dw_promotion dw_promotion
dw_dosage dw_dosage
dw_func dw_func
dw_online dw_online
dw_suspend dw_suspend
dw_doc dw_doc
dw_bill_line dw_bill_line
dw_scan_barcode dw_scan_barcode
gb_2 gb_2
gb_1 gb_1
st_suspend st_suspend
st_online st_online
end type
global c_w_pos c_w_pos

type variables
t_transaction		it_transaction, it_trans_second
t_ds_db				ids_dosage, ids_bill_line, ids_bill_print,ids_bill2_print,  ids_dosage_bill, ids_cust_his
t_ds_db				ids_return_line, ids_return_doc, ids_buy_get_the_same
datawindowchild	idwc, idwc_unit
double		idb_object_id, idb_bs_id, idb_uom_id, idb_to_uom_id, idb_cust_point, idb_cust_id, idb_adj_doc_id, idb_bs_id_rtn
dec			idc_to_coefficient
string 		is_obj_name, is_short_name,is_print_name, is_barcode, is_location, is_cust_name, is_cust_code, is_to_unit_code
boolean		ib_complete, ib_cust_chosen, ib_item_chosen, ib_price_chk, ib_connected
long			il_staff_pct, il_cust_pct		
end variables

forward prototypes
public function integer f_resize ()
public function long f_get_dwheight (datawindow vdw_handle)
public function integer f_resize_dw_dosage (integer vi_row)
public function string f_get_comm_data ()
public function integer f_disconnect_comm ()
public function integer f_load_bill (string vs_code)
public function integer f_connect_comm (integer vi_port)
end prototypes

event e_action_newbill();
connect using it_transaction;

dw_doc.accepttext( )
if dw_doc.getrow( ) = 1 then
	if dw_bill_line.rowcount( ) > 0 then
		//-- move vào dw suspend --//
		dw_doc.rowsmove( 1, 1, primary!, dw_suspend , dw_suspend.rowcount()+1, primary!)
		dw_bill_line.rowsmove( 1, dw_bill_line.rowcount(), primary!, ids_bill_line, ids_bill_line.rowcount()+1, primary!)
		dw_doc.event e_addrow( )
	end if
else
	dw_doc.event e_addrow( )
end if

dw_scan_barcode.setfocus( )
dw_scan_barcode.setitem( 1, 'name', '')
dw_scan_barcode.setitem( 1, 'unit', '')
dw_scan_barcode.setitem( 1, 'qty', 1)
dw_scan_barcode.setitem( 1, 'price', 0)
dw_scan_barcode.setitem( 1, 'stock', 0)
dw_scan_barcode.setcolumn( 'name')
idb_object_id = 0
is_obj_name = ''

disconnect using it_transaction;
end event

event e_action_pay();date			ld_transDate
double		ldb_cust_id, ldb_base_currID, ldb_bill_id, ldb_bill_id_rtn, ldb_promotion_id, ldb_amt, ldb_staff_id, ldb_rtn_version_id
string			ls_CurrCode, ls_currName, ls_staffName, ls_gift
long			ll_rows, ll_row, ll_staff_point, ll_rtn, ll_bill_staff_point, ll_bill_cust_point, ll_bill_cust_used_point, ll_cust_point, ll_insertR
int				li_idx

c_datetime				lc_datetime
c_unit_instance			lc_unit
c_str_pos				lc_str_pos
b_obj_instantiate		lbo_ins
s_str_data				lstr_gift
c_string					lc_string

dw_scan_barcode.event losefocus( )
connect using it_transaction;
if it_transaction.sqlcode = -1 then
	gf_messagebox('m.c_w_pos.e_action_pay.02','Thông báo','Không kết nối được CSDL:@'+ it_transaction.sqlerrtext ,'exclamation','ok',1)
	return
end if
//-- SAVE data--//
dw_doc.settransobject(it_transaction )
if dw_doc.update( ) = -1 then
	rollback using it_transaction;
	disconnect using it_transaction;
	gf_messagebox('m.c_w_pos.e_action_pay.01','Thông báo','Không lưu được Bill header:@'+ it_transaction.sqlerrtext ,'exclamation','ok',1)
	return 
end if
lc_unit.f_get_base_cur_ex( ldb_base_currID, ls_CurrCode, ls_currName, it_transaction)		
ld_transDate= date(dw_doc.getitemdatetime( 1, 'document_date'))
ldb_bill_id = dw_doc.getitemnumber( 1, 'ID')
ldb_cust_id = dw_doc.getitemnumber( 1, 'dr_cr_object') 
ll_bill_cust_point = dw_doc.getitemnumber( 1, 'cust_point') 
////-- insert booked_slip --////
INSERT into booked_slip ( ID ,
								  BRANCH_ID   ,
								  COMPANY_ID   ,
								  OBJECT_REF_ID    ,
								  OBJECT_REF_TABLE,
								  DOC_TYPE,
								  CREATED_BY  ,
								  CREATED_DATE  ,
								  LAST_MDF_BY    ,
								  LAST_MDF_DATE  ,
								  VERSION_NO     ,
								  TRANS_DATE     ,
								  INVOICE_OBJECT  ,
								  QUANTITY_YN   ,
								  VALUE_YN       ,
								  DR_CR_OBJECT      ,
								  CURRENCY_ID   ,
								  EXCHANGE_RATE ,
								  RT_BONUS_POINT,
								  RT_USED_POINT,
								  RT_STAFF_POINT
								  )
values(:idb_bs_id,
		:gdb_branch,
		:gi_user_comp_id,
		:ldb_bill_id,
		'DOCUMENT',
		'RETAIL',
		:gi_userid,
		sysdate,
		:gi_userid,
		sysdate,
		1,
		:ld_transDate,
		null,
		'Y',
		'Y',
		null,
		:ldb_base_currID,
		1,
		null,
		null,
		null
		) using it_transaction;
if it_transaction.sqlcode <> 0 then
	rollback using it_transaction;
	disconnect using it_transaction;
	gf_messagebox('m.c_w_pos.e_action_pay.02','Thông báo','Không lưu được Bill booked slip:@'+ it_transaction.sqlerrtext ,'exclamation','ok',1)			
	return 
end if 
////-- Luu dw_line --////
dw_bill_line.settransobject(it_transaction )
if dw_bill_line.update( ) = -1 then
	rollback using it_transaction;
	disconnect using it_transaction;
	gf_messagebox('m.c_w_pos.e_action_pay.03','Thông báo','Không lưu được Bill line:@'+ it_transaction.sqlerrtext ,'exclamation','ok',1)
	return 
end if
////-- Luu dosage bill --////
if ids_dosage_bill.rowcount( ) > 0 then
	ids_dosage_bill.settransobject( it_transaction)
	if ids_dosage_bill.update( ) = -1 then
		rollback using it_transaction;
		disconnect using it_transaction;
		gf_messagebox('m.c_w_pos.e_action_pay.04','Thông báo','Không lưu được liều dùng theo Bill:@'+ it_transaction.sqlerrtext ,'exclamation','ok',1)
		return 				
	end if
end if  //-- KET THUC SAVE --//

//-- open win payment --//
lc_str_pos.s_data[1] = dw_doc.getitemstring( 1, 'object_name') 
lc_str_pos.s_data[2] = dw_doc.getitemstring( 1, 'object_code') 
lc_str_pos.dba_data[1] = dw_doc.getitemnumber( 1, 'dr_cr_object') 
lc_str_pos.dba_data[2] = dw_doc.getitemnumber( 1, 'cust_point') 
ldb_amt= double(dw_bill_line.Describe("Evaluate('Sum(amount)', 0)"))
lc_str_pos.dba_data[3] = ldb_amt


//-- check gift --//
if lbo_ins.f_get_gift( ids_buy_get_the_same, lc_str_pos.dba_data[1] , ldb_bill_id, lstr_gift, it_transaction) > 0 then
	lc_str_pos.s_promote = lstr_gift.s_data
	FOR li_idx = 1 to upperbound( lstr_gift.as_data[])
		if lc_str_pos.s_gift<> '' then lc_str_pos.s_gift +=';~r'
		if ls_gift<> '' then lc_str_pos.s_gift +=';'
		lc_str_pos.s_gift +=lstr_gift.as_data[li_idx] + ' ('+string(lstr_gift.adb_data[li_idx*2] ) +')'
		ls_gift += lstr_gift.as_data[li_idx] + ' ('+string(lstr_gift.adb_data[li_idx*2] ) +')'
	NEXT
end if

openwithparm (c_w_payment, lc_str_pos)
if not isvalid( message.powerobjectparm) then
	disconnect using it_transaction;
	return
end if
lc_str_pos = message.powerobjectparm
setnull(message.powerobjectparm)
if lc_str_pos.s_response = 'cancel' then 
	disconnect using it_transaction;
	return
end if

//-- Lưu doc với status paying --//
		////-- lưu dw_doc --////
		lc_unit.f_get_base_cur_ex( ldb_base_currID, ls_CurrCode, ls_currName, it_transaction)		
		ld_transDate= date(dw_doc.getitemdatetime( 1, 'document_date'))
		ldb_cust_id = lc_str_pos.dba_data[1]
		if isnull(ldb_cust_id) then ldb_cust_id = 0
		dw_doc.setitem( 1, 'dr_cr_object', ldb_cust_id)
		dw_doc.setitem( 1, 'status', 'paying')
		dw_doc.setitem( 1, 'created_date', lc_datetime.f_getsysdate_ex(it_transaction) )
		dw_doc.setitem( 1, 'last_mdf_date',  lc_datetime.f_getsysdate_ex(it_transaction))
		
		dw_doc.settransobject(it_transaction )
		if dw_doc.update( ) = -1 then
			rollback using it_transaction;
			disconnect using it_transaction;
			gf_messagebox('m.c_w_pos.e_action_pay.01','Thông báo','Không lưu được Bill header:@'+ it_transaction.sqlerrtext ,'exclamation','ok',1)
			return 
		end if
		///-- ghi nhận điểm KH và NV--//
		if lc_str_pos.s_data[2] <> '' then
			ll_rtn = lbo_ins.f_get_object_id_name_n_point(lc_str_pos.s_data[2], 'STAFF',gi_user_comp_id , gdb_branch , ldb_staff_id, ls_staffName, ll_staff_point, it_transaction)
			if ll_rtn = 1 then
				FOR ll_row = 1 to dw_bill_line.rowcount()
					dw_bill_line.setitem(ll_row , 'sales_person', ldb_staff_id)
				NEXT
			end if
		end if		
		if ldb_cust_id > 0 or ldb_staff_id > 0 then					
			if lc_str_pos.dba_data[4] > 0 then //-- dùng điểm --//			
				lbo_ins.f_upd_cust_point_ex( ldb_bill_id, ld_transDate, ldb_cust_id, lc_str_pos.dba_data[4] , lc_str_pos.dba_data[2], it_transaction)
				lbo_ins.f_upd_bonus_point_ex( dw_bill_line, dw_doc ,0, ldb_staff_id, lc_str_pos.dba_data[2], ll_staff_point, it_transaction,  ll_bill_staff_point, ll_bill_cust_point)
			else
				lbo_ins.f_upd_bonus_point_ex( dw_bill_line, dw_doc ,ldb_cust_id, ldb_staff_id, lc_str_pos.dba_data[2], ll_staff_point, it_transaction,  ll_bill_staff_point, ll_bill_cust_point)
			end if				
		end if
		
		//-- UPDATE booked_slip--//
		UPDATE booked_slip
		set DR_CR_OBJECT = :ldb_cust_id,
			invoice_object = :ldb_cust_id,
			RT_BONUS_POINT = :ll_bill_cust_point,
			RT_USED_POINT =	:lc_str_pos.dba_data[4],
			RT_STAFF_POINT =	:ll_bill_staff_point
		WHERE id = :idb_Bs_id using it_transaction;
		
		//-- insert gift --//
		if upperbound( lstr_gift.as_data[]) > 0 and lc_str_pos.s_accept_gift = 'Y'  then 
//			FOR li_idx = 1 to upperbound( lstr_gift.as_data[])

				ll_insertR = dw_bill_line.event e_addrow( )
	
//				dw_bill_line.setitem(ll_insertR , 'qty', lstr_gift.adb_data[li_idx*2] )
//				dw_bill_line.setitem(ll_insertR , 'price',  0)
//				dw_bill_line.setitem(ll_insertR , 'amount', 0)
//				dw_bill_line.setitem(ll_insertR , 'ITEM_ID',  lstr_gift.adb_data[li_idx*2 -1])
//				dw_bill_line.setitem(ll_insertR , 'TRANS_UOM', lstr_gift.aa_data[li_idx] )
//				dw_bill_line.setitem(ll_insertR , 'unit_code', this.getitemstring( 1, 'unit') )		
				dw_bill_line.setitem(ll_insertR , 'sales_person',ldb_staff_id )	
//				dw_bill_line.setitem(ll_insertR , 'loc',is_location )	
				dw_bill_line.setitem(ll_insertR , 'line_no', ll_insertR)
				dw_bill_line.setitem(ll_insertR , 'note', ls_gift )		
				dw_bill_line.setitem(ll_insertR , 'line_text',  lstr_gift.s_data)
//			NEXT
		end if
		////-- Luu dw_line: sales_person và promotion --////
		dw_bill_line.settransobject(it_transaction )
		if dw_bill_line.update( ) = -1 then
			rollback using it_transaction;
			disconnect using it_transaction;
			gf_messagebox('m.c_w_pos.e_action_pay.03','Thông báo','Không lưu được Bill line:@'+ it_transaction.sqlerrtext ,'exclamation','ok',1)
			return 
		end if		
		
//-- Gọi ghi sổ thread khác--//

//-- Lưu doc return khi chỉnh bill với status paying --//
if dw_doc.getitemnumber( 1, 'id') = idb_adj_doc_id then
	
	ldb_rtn_version_id =  ids_return_doc.getitemnumber( 1, 'object_ref_id') //-- object_ref_id của document lưu version_id gốc trả hàng--//
	ldb_bill_id_rtn = ids_return_doc.getitemnumber( 1, 'ID')
	ld_transDate= date(ids_return_doc.getitemdatetime( 1, 'document_date'))
	ldb_cust_id = ids_return_doc.getitemnumber( 1, 'dr_cr_object')
	ldb_staff_id = ids_return_line.getitemnumber( 1, 'sales_person')
	ids_return_doc.setitem( 1, 'status', 'paying')
	ids_return_doc.setitem( 1, 'created_date', lc_datetime.f_getsysdate_ex(it_transaction) )
	ids_return_doc.setitem( 1, 'last_mdf_date', lc_datetime.f_getsysdate_ex(it_transaction))
	
	ids_return_doc.f_settransobject(it_transaction)
	if ids_return_doc.update( ) = -1 then
		rollback using it_transaction;
		disconnect using it_transaction;
		gf_messagebox('m.c_w_pos.e_action_pay.05','Thông báo','Không lưu được Bill header trả hàng:@'+ it_transaction.sqlerrtext ,'exclamation','ok',1)
		return 
	end if
	
	///-- ghi nhận điểm KH và NV--//
	select	RT_USED_POINT
	into  :ll_bill_cust_used_point
	from booked_slip
	where id = :ldb_rtn_version_id
	using it_transaction;
	if ldb_staff_id > 0 then
		ll_rtn = lbo_ins.f_get_object_point(ldb_staff_id, 'STAFF',gi_user_comp_id , gdb_branch , ll_staff_point, it_transaction)
	end if			
	if ldb_cust_id > 0 then
		ll_rtn = lbo_ins.f_get_object_point(ldb_cust_id, 'CUSTOMER',gi_user_comp_id , gdb_branch , ll_cust_point, it_transaction)
	end if			
	if ldb_cust_id > 0 or ldb_staff_id > 0 then					
		if ll_bill_cust_used_point > 0 then //-- dùng điểm --//			
			lbo_ins.f_upd_cust_point_ex( ldb_bill_id_rtn, ld_transDate, ldb_cust_id, -ll_bill_cust_used_point , ll_cust_point, it_transaction)
			lbo_ins.f_upd_bonus_point_ex( ids_return_line, ids_return_doc ,0, ldb_staff_id, ll_cust_point, ll_staff_point, it_transaction,  ll_bill_staff_point, ll_bill_cust_point)
		else
			lbo_ins.f_upd_bonus_point_ex( ids_return_line, ids_return_doc ,ldb_cust_id, ldb_staff_id, ll_cust_point, ll_staff_point, it_transaction,  ll_bill_staff_point, ll_bill_cust_point)
		end if				
	end if
	
////-- insert booked_slip --////	
	INSERT into booked_slip ( ID ,
									  BRANCH_ID   ,
									  COMPANY_ID   ,
									  OBJECT_REF_ID    ,
									  OBJECT_REF_TABLE,
									  DOC_TYPE,
									  CREATED_BY  ,
									  CREATED_DATE  ,
									  LAST_MDF_BY    ,
									  LAST_MDF_DATE  ,
									  VERSION_NO     ,
									  TRANS_DATE     ,
									  INVOICE_OBJECT  ,
									  QUANTITY_YN   ,
									  VALUE_YN       ,
									  DR_CR_OBJECT      ,
									  CURRENCY_ID   ,
									  EXCHANGE_RATE ,
									  RT_BONUS_POINT,
									  RT_USED_POINT,
									  RT_STAFF_POINT
									  )
	values(:idb_bs_id_rtn,
			:gdb_branch,
			:gi_user_comp_id,
			:ldb_bill_id_rtn,
			'DOCUMENT',
			'RETAIL',
			:gi_userid,
			sysdate,
			:gi_userid,
			sysdate,
			1,
			:ld_transDate,
			:ldb_cust_id,
			'Y',
			'Y',
			:ldb_cust_id,
			:ldb_base_currID,
			1,
			:ll_bill_cust_point,
			:lc_str_pos.dba_data[4],
			:ll_bill_staff_point
			) using it_transaction;
	if it_transaction.sqlcode <> 0 then
		rollback using it_transaction;
		disconnect using it_transaction;
		gf_messagebox('m.c_w_pos.e_action_pay.06','Thông báo','Không lưu được Bill booked slip trả hàng:@'+ it_transaction.sqlerrtext ,'exclamation','ok',1)			
		return 
	end if 
	////-- Luu dw_line --////
	ids_return_line.f_settransobject(it_transaction)
	if ids_return_line.update( ) = -1 then
		rollback using it_transaction;
		disconnect using it_transaction;
		gf_messagebox('m.c_w_pos.e_action_pay.07','Thông báo','Không lưu được Bill line trả hàng:@'+ it_transaction.sqlerrtext ,'exclamation','ok',1)
		return 
	end if	
	idb_bs_id_rtn = 0
	idb_adj_doc_id = 0
end if //-- kết thúc xứ lý bill trả hàng --//


commit using it_transaction;
//-- In bill --//
if  lc_str_pos.s_response = 'ok' then
	ids_bill_print.settransobject( it_transaction)
	ids_bill2_print.settransobject( it_transaction)
	ll_rows = ids_bill_print.retrieve( ldb_bill_id)
	ll_rows = ids_bill2_print.retrieve( ldb_bill_id)
	if ll_rows > 0 then
//		openwithparm(c_w_test,ids_bill2_print)
		ids_bill_print.print(false,false)	
		ids_bill2_print.print(false,false)					
	end if
end if

disconnect using it_transaction;

//-- thanh toán xong: reset dw_doc, dw_line --//
dw_bill_line.reset( )
dw_doc.reset( )
this.event e_action_newbill_pay(ldb_amt )

end event

event e_action_printbill();

dw_scan_barcode.event losefocus( )
//dw_doc.event e_addrow( )

end event

event e_action_briefbill();long					ll_row, ll_found, ll_cust_pct, ll_staff_pct
string					ls_code, ls_name, ls_unit_code
double				ldb_unit_id, ldb_promotion_id
c_str_pos			lc_str_pos
b_obj_instantiate	lbo_ins


dw_scan_barcode.event losefocus( )
open (u_w_briefbill)
if not isvalid( message.powerobjectparm) then
	return
end if
lc_str_pos = message.powerobjectparm 
setnull(message.powerobjectparm )


if lc_str_pos.s_response = 'ok' or  lc_str_pos.s_response = 'ok_none_print'  then
	connect using it_transaction;
	//-- add item vvào bill--//
	if dw_doc.getrow( ) = 1 and dw_bill_line.rowcount( ) > 0 then
		//-- move vào dw suspend --//
		dw_doc.rowsmove( 1, 1, primary!, dw_suspend , dw_suspend.rowcount()+1, primary!)
		dw_bill_line.rowsmove( 1, dw_bill_line.rowcount(), primary!, ids_bill_line, ids_bill_line.rowcount()+1, primary!)
		dw_doc.event e_addrow( )
	end if
	if lc_str_pos.dba_spk[2] > 0 then
		lbo_ins.f_get_item_code_n_name_uom_ex(  lc_str_pos.dba_spk[1], ls_code, ls_name, ls_unit_code, ldb_unit_id , it_transaction)
	end if
	if lc_str_pos.dba_spl[2] > 0 then 
		lbo_ins.f_get_item_code_n_name_uom_ex(  lc_str_pos.dba_spl[1], ls_code, ls_name, ls_unit_code,ldb_unit_id , it_transaction )
	end if
	disconnect using it_transaction;
	
	if lc_str_pos.dba_spk[2] > 0 then //-- item:spk--//		
		ll_row = dw_bill_line.event e_addrow( )
		dw_bill_line.setitem(ll_row , 'line_text',ls_name )
		dw_bill_line.setitem(ll_row , 'qty', 1)
		dw_bill_line.setitem(ll_row , 'price',   lc_str_pos.dba_spk[2])
		dw_bill_line.setitem(ll_row , 'amount',  lc_str_pos.dba_spk[2])
		dw_bill_line.setitem(ll_row , 'ITEM_ID',  lc_str_pos.dba_spk[1])
		dw_bill_line.setitem(ll_row , 'TRANS_UOM', ldb_unit_id )
		dw_bill_line.setitem(ll_row , 'unit_code', ls_unit_code)	
		ll_found = idwc.find("object_id = "+string( lc_str_pos.dba_spk[1]), 1, idwc.rowcount())
		if ll_found > 0 then
			ll_cust_pct = idwc.getitemnumber( ll_found, 'comm_cust_pct')
			ll_staff_pct = idwc.getitemnumber( ll_found, 'comm_staff_pct')
		else
			ll_cust_pct = 0
			ll_staff_pct = 0
		end if 		
		dw_bill_line.setitem(ll_row , 'cust_point', round(1 * lc_str_pos.dba_spk[2]*ll_cust_pct/100,0))
		dw_bill_line.setitem(ll_row , 'staff_point', round(1 * lc_str_pos.dba_spk[2]*ll_staff_pct/100,0))
		dw_bill_line.setitem(ll_row , 'cust_pct', ll_cust_pct)
		dw_bill_line.setitem(ll_row , 'staff_pct', ll_staff_pct)		
	end if
	
	if lc_str_pos.dba_spl[2] > 0 then //-- item: spl--//
		
		ll_row = dw_bill_line.event e_addrow( )
		dw_bill_line.setitem(ll_row , 'line_text',ls_name )
		dw_bill_line.setitem(ll_row , 'qty', 1)
		dw_bill_line.setitem(ll_row , 'price',   lc_str_pos.dba_spl[2])
		dw_bill_line.setitem(ll_row , 'amount',  lc_str_pos.dba_spl[2])
		dw_bill_line.setitem(ll_row , 'ITEM_ID',  lc_str_pos.dba_spl[1])
		dw_bill_line.setitem(ll_row , 'TRANS_UOM', ldb_unit_id )
		dw_bill_line.setitem(ll_row , 'unit_code', ls_unit_code)	
		ll_found = idwc.find("object_id = "+string( lc_str_pos.dba_spl[1]), 1, idwc.rowcount())
		if ll_found > 0 then
			ll_cust_pct = idwc.getitemnumber( ll_found, 'comm_cust_pct')
			ll_staff_pct = idwc.getitemnumber( ll_found, 'comm_staff_pct')
		else
			ll_cust_pct = 0
			ll_staff_pct = 0
		end if 		
		dw_bill_line.setitem(ll_row , 'cust_point', round(1 * lc_str_pos.dba_spl[2]*ll_cust_pct/100,0))
		dw_bill_line.setitem(ll_row , 'staff_point', round(1 * lc_str_pos.dba_spl[2]*ll_staff_pct/100,0))
		dw_bill_line.setitem(ll_row , 'cust_pct', ll_cust_pct)
		dw_bill_line.setitem(ll_row , 'staff_pct', ll_staff_pct)			
	end if	
	
	//-- than toán bill 
	this.event e_action_pay_brief(lc_str_pos )
	
elseif  lc_str_pos.s_response = 'cancel' then
	
end if

end event

event e_action_return();double			ldb_qty, ldb_price, ldb_item_id
int					li_row, ll_row
long				ll_cust_pct, ll_staff_pct, ll_found
t_ds_db			lds_return

dw_scan_barcode.event losefocus( )
connect using it_transaction;
if it_transaction.sqlcode = -1 then
	gf_messagebox('m.c_w_pos.e_action_return.01','Thông báo','Không kết nối được CSDL:@'+ it_transaction.sqlerrtext ,'exclamation','ok',1)
	return
end if

openwithparm (c_w_return, it_transaction)
if not isvalid(message.powerobjectparm) then
	disconnect using it_transaction;
	return 
end if
lds_return = message.powerobjectparm
setnull(message.powerobjectparm)

if lds_return.rowcount() > 0 then
	
	//-- move vào dw suspend --//
	if dw_doc.getrow( ) = 1 and dw_bill_line.rowcount( ) > 0 then		
		dw_doc.rowsmove( 1, 1, primary!, dw_suspend , dw_suspend.rowcount()+1, primary!)
		dw_bill_line.rowsmove( 1, dw_bill_line.rowcount(), primary!, ids_bill_line, ids_bill_line.rowcount()+1, primary!)
		dw_doc.event e_addrow( )
	end if	
	
	//-- add hdr --//
	dw_doc.setitem( 1, 'object_name',  lds_return.getitemstring( 1, 'cust_name') )
	dw_doc.setitem( 1, 'object_code',  lds_return.getitemstring( 1, 'cust_code') )
	dw_doc.setitem( 1, 'dr_cr_object',  lds_return.getitemstring( 1, 'cust_id') )
	dw_doc.setitem( 1, 'note',  lds_return.getitemstring( 1, 'note') )
	dw_doc.setitem( 1, 'document_ref_code',  lds_return.getitemstring( 1, 'document_ref_code') )
	dw_doc.setitem( 1, 'object_ref_id',  lds_return.getitemnumber( 1, 'id') )
	
	//-- add item trả hàng --//
	FOR li_row = 1 to  lds_return.rowcount() 
		ldb_item_id = lds_return.getitemnumber( li_row, 'ITEM_ID')
		ll_found = idwc.find("object_id = "+string(ldb_item_id), 1, idwc.rowcount())
		if ll_found > 0 then
			ll_cust_pct = idwc.getitemnumber( ll_found, 'comm_cust_pct')
			ll_staff_pct = idwc.getitemnumber( ll_found, 'comm_staff_pct')
		else
			ll_cust_pct = 0
			ll_staff_pct = 0
		end if 		
		ldb_qty = lds_return.getitemnumber( li_row, 'return_qty')
		ldb_price = lds_return.getitemnumber( li_row, 'return_price')
		ll_row = dw_bill_line.event e_addrow( )
		dw_bill_line.setitem(ll_row , 'line_text', lds_return.getitemstring( li_row, 'line_text') )
		dw_bill_line.setitem(ll_row , 'qty', -ldb_qty)
		dw_bill_line.setitem(ll_row , 'price',   ldb_price)
		dw_bill_line.setitem(ll_row , 'amount', - ldb_qty * ldb_price)
		dw_bill_line.setitem(ll_row , 'ITEM_ID',  ldb_item_id)
		dw_bill_line.setitem(ll_row , 'TRANS_UOM',  lds_return.getitemnumber( li_row, 'ITEM_ID') )
		dw_bill_line.setitem(ll_row , 'unit_code',  lds_return.getitemstring( li_row, 'uom_code'))	
		dw_bill_line.setitem(ll_row , 'sales_person',lds_return.getitemnumber( li_row, 'sales_person') )	
		dw_bill_line.setitem(ll_row , 'note',lds_return.getitemstring( li_row, 'line_note') )
		dw_bill_line.setitem(ll_row , 'line_no', ll_row)
		dw_bill_line.setitem(ll_row , 'cust_point', round(-ldb_qty * ldb_price*ll_cust_pct/100,0))
		dw_bill_line.setitem(ll_row , 'staff_point', round(-ldb_qty * ldb_price*ll_staff_pct/100,0))
		dw_bill_line.setitem(ll_row , 'cust_pct', ll_cust_pct)
		dw_bill_line.setitem(ll_row , 'staff_pct', ll_staff_pct)	
	NEXT
end if
disconnect using it_transaction;
end event

event e_action_findbill();double			ldb_qty, ldb_price, ldb_seq_id, ldb_item_id, ldb_price_old
long				ll_found, ll_cust_pct, ll_staff_pct
int					li_row, ll_row,ll_insertrow
string				ls_autonumber
t_ds_db					lds_foundbill
b_obj_instantiate		lbo_ins
b_flexibledata			lbo_flex
b_sequences			lbo_seq

dw_scan_barcode.event losefocus( )
connect using it_transaction;
if it_transaction.sqlcode = -1 then
	gf_messagebox('m.c_w_pos.e_action_return.01','Thông báo','Không kết nối được CSDL:@'+ it_transaction.sqlerrtext ,'exclamation','ok',1)
	return
end if

openwithparm (c_w_findbill, it_transaction)
if not isvalid(message.powerobjectparm) then
	disconnect using it_transaction;
	return 
end if
lds_foundbill = message.powerobjectparm
setnull(message.powerobjectparm)

if lds_foundbill.rowcount() > 0 then
	lds_foundbill.setsort('code a, line_no a')
	lds_foundbill.sort( )
	
	//-- move vào dw suspend --//
	if dw_doc.getrow( ) = 1 and dw_bill_line.rowcount( ) > 0 then		
		dw_doc.rowsmove( 1, 1, primary!, dw_suspend , dw_suspend.rowcount()+1, primary!)
		dw_bill_line.rowsmove( 1, dw_bill_line.rowcount(), primary!, ids_bill_line, ids_bill_line.rowcount()+1, primary!)
		dw_doc.event e_addrow( )
		
	end if	
	
	//-- add hdr --//
	dw_doc.setitem( 1, 'object_name',  lds_foundbill.getitemstring( 1, 'cust_name') )
	dw_doc.setitem( 1, 'object_code',  lds_foundbill.getitemstring( 1, 'cust_code') )
	dw_doc.setitem( 1, 'dr_cr_object',  lds_foundbill.getitemnumber( 1, 'cust_id') )
	dw_doc.setitem( 1, 'note',  lds_foundbill.getitemstring( 1, 'note') )
	
	//-- return bill  --//
	if lds_foundbill.getitemstring( 1, 'document_ref_code') = 'adjust' then	
		idb_adj_doc_id = dw_doc.getitemnumber( 1, 'id')
		ids_return_doc = create t_ds_db
		ids_return_doc.dataobject = 'd_bill_hdr_grid'
		li_row = ids_return_doc.insertrow(0)
		ids_return_doc.setitem( li_row, 'object_name',  lds_foundbill.getitemstring( 1, 'cust_name') )
		ids_return_doc.setitem( li_row, 'object_code',  lds_foundbill.getitemstring( 1, 'cust_code') )
		ids_return_doc.setitem( li_row, 'dr_cr_object',  lds_foundbill.getitemnumber( 1, 'cust_id') )
		ids_return_doc.setitem( li_row, 'note',  lds_foundbill.getitemstring( 1, 'note') )				
		ids_return_doc.setitem( li_row , 'document_ref_code', lds_foundbill.getitemstring(1,'code' ))
		ids_return_doc.setitem( li_row , 'object_ref_id',  lds_foundbill.getitemnumber(1,'version_id' ) )	// lưu booked_slip ID của bill được chỉnh --//	
		
		ids_return_doc.setitem( li_row , 'id', lbo_ins.f_create_id_ex( it_transaction ) )
		idb_bs_id_rtn = lbo_ins.f_create_id_ex(it_transaction )		
		ids_return_doc.setitem( li_row , 'object_ref_table', 'BOOKED_SLIP' )
		ids_return_doc.setitem( li_row , 'version_id', idb_bs_id_rtn )
		ids_return_doc.setitem( li_row , 'trans_hdr_id', 25121532 )
		ids_return_doc.setitem( li_row , 'handled_by', gi_userid )
		ids_return_doc.setitem( li_row , 'status', 'new' )
		ids_return_doc.setitem( li_row , 'doc_type', 'RETAIL' )
		ids_return_doc.setitem( li_row , 'user_name', g_user.name  )
		ids_return_doc.setitem( li_row , 'document_date', gd_session_date )
		ids_return_doc.setitem( li_row , 'handled_by', gi_userid )
		ids_return_doc.setitem( li_row , 'company_id', gi_user_comp_id  )
		ids_return_doc.setitem( li_row , 'branch_id', gdb_branch )
		ids_return_doc.setitem( li_row , 'created_by', gi_userid )
		ids_return_doc.setitem( li_row , 'last_mdf_by', gi_userid )
		
		ldb_seq_id = lbo_flex.f_get_id('bill_nbr_THM','sequences', it_transaction )
		if ldb_seq_id <> -1 then
			lbo_seq.f_init_ex(ldb_seq_id, it_transaction )
			ls_autonumber = lbo_seq.f_create_autonumber_ex( gd_session_date, it_transaction )
			ids_return_doc.setitem( li_row , 'code', ls_autonumber )
		end if		
		
		ids_return_line = create t_ds_db
		ids_return_line.dataobject = 'd_bill_line_grid'			
		
	end if	
	
	//-- add item --//
	FOR li_row = 1 to  lds_foundbill.rowcount() 
		ldb_item_id = lds_foundbill.getitemnumber( li_row, 'ITEM_ID')
		ldb_qty = lds_foundbill.getitemnumber( li_row, 'qty')
		ldb_price = lds_foundbill.getitemnumber( li_row, 'retail_price')
		ldb_price_old = lds_foundbill.getitemnumber( li_row, 'price')
		ll_found = idwc.find("object_id = "+string(ldb_item_id), 1, idwc.rowcount())
		if ll_found > 0 then
			ll_cust_pct = idwc.getitemnumber( ll_found, 'comm_cust_pct')
			ll_staff_pct = idwc.getitemnumber( ll_found, 'comm_staff_pct')
		else
			ll_cust_pct = 0
			ll_staff_pct = 0
		end if 
		ll_row = dw_bill_line.event e_addrow( )
		dw_bill_line.setitem(ll_row , 'line_text', lds_foundbill.getitemstring( li_row, 'line_text') )
		dw_bill_line.setitem(ll_row , 'qty', ldb_qty)
		dw_bill_line.setitem(ll_row , 'price', ldb_price)
		dw_bill_line.setitem(ll_row , 'amount', ldb_qty * ldb_price)
		dw_bill_line.setitem(ll_row , 'ITEM_ID',  ldb_item_id)
		dw_bill_line.setitem(ll_row , 'TRANS_UOM',  lds_foundbill.getitemnumber( li_row, 'TRANS_UOM') )
		dw_bill_line.setitem(ll_row , 'unit_code',  lds_foundbill.getitemstring( li_row, 'uom_code'))	
		dw_bill_line.setitem(ll_row , 'note',lds_foundbill.getitemstring( li_row, 'line_note') )
		dw_bill_line.setitem(ll_row , 'line_no', ll_row)
		dw_bill_line.setitem(ll_row , 'cust_point', round(ldb_qty * ldb_price*ll_cust_pct/100,0))
		dw_bill_line.setitem(ll_row , 'staff_point', round(ldb_qty * ldb_price*ll_staff_pct/100,0))
		dw_bill_line.setitem(ll_row , 'cust_pct', ll_cust_pct)
		dw_bill_line.setitem(ll_row , 'staff_pct', ll_staff_pct)
		dw_bill_line.setitem(ll_row , 'old_price', ldb_price_old)
		
		//-- return line--//
		if lds_foundbill.getitemstring( 1, 'document_ref_code') = 'adjust' then	
			ll_insertrow = ids_return_line.insertrow(0)
			ids_return_line.setitem( ll_insertrow , 'id', lbo_ins.f_create_id_ex( it_transaction ) )
			ids_return_line.setitem( ll_insertrow , 'object_ref_id', idb_bs_id_rtn)
			ids_return_line.setitem( ll_insertrow , 'object_ref_table', 'BOOKED_SLIP')
			ids_return_line.setitem( ll_insertrow , 'company_id', gi_user_comp_id )
			ids_return_line.setitem( ll_insertrow , 'branch_id', gdb_branch )		
			ids_return_line.setitem(ll_insertrow , 'line_text', lds_foundbill.getitemstring( li_row, 'line_text') )
			ids_return_line.setitem(ll_insertrow , 'qty', -ldb_qty)
			ids_return_line.setitem(ll_insertrow , 'price', ldb_price)
			ids_return_line.setitem(ll_insertrow , 'amount', -ldb_qty * ldb_price)
			ids_return_line.setitem(ll_insertrow , 'ITEM_ID',  lds_foundbill.getitemnumber( li_row, 'ITEM_ID'))
			ids_return_line.setitem(ll_insertrow , 'TRANS_UOM',  lds_foundbill.getitemnumber( li_row, 'TRANS_UOM') )
			ids_return_line.setitem(ll_insertrow , 'unit_code',  lds_foundbill.getitemstring( li_row, 'uom_code'))	
			ids_return_line.setitem(ll_insertrow , 'note',lds_foundbill.getitemstring( li_row, 'line_note') )
			ids_return_line.setitem(ll_insertrow , 'line_no', lds_foundbill.getitemnumber( li_row, 'line_no'))	
			ids_return_line.setitem(ll_insertrow , 'sales_person', lds_foundbill.getitemnumber( li_row, 'sales_person'))	
			ids_return_line.setitem(ll_insertrow , 'cust_point', round(-ldb_qty * ldb_price*ll_cust_pct/100,0))
			ids_return_line.setitem(ll_insertrow , 'staff_point', round(-ldb_qty * ldb_price*ll_staff_pct/100,0))
			ids_return_line.setitem(ll_insertrow , 'cust_pct', ll_cust_pct)
			ids_return_line.setitem(ll_insertrow , 'staff_pct', ll_staff_pct)			
		end if		
	NEXT

end if
disconnect using it_transaction;
end event

event e_action_dosage();string				ls_dosageStr
long				ll_row 
c_str_pos		lc_str_pos
t_ds_db			lds_dosage_bill

dw_scan_barcode.event losefocus( )

ll_row = dw_bill_line.find( "item_id = "+string(idb_object_id), 1, dw_bill_line.rowcount( ) )
if ll_row > 0 then
	lc_str_pos.dba_data[1] = dw_bill_line.getitemnumber( ll_row, 'id')
	lc_str_pos.dba_data[2] = idb_object_id

	openwithparm (c_w_dosage_bill, lc_str_pos)
	lds_dosage_bill = message.powerobjectparm
	setnull(message.powerobjectparm)
	if isvalid(lds_dosage_bill) then
		if lds_dosage_bill.rowcount( ) > 0 then
			lds_dosage_bill.rowscopy( 1, 1, primary!, ids_dosage_bill, ids_dosage_bill.rowcount() +1  , primary!)
			if lds_dosage_bill.getitemstring( 1, 'after_meal_yn') = 'Y' then
				ls_dosageStr  = '(Sau ăn : '
			end if
			if lds_dosage_bill.getitemstring( 1, 'b4_meal_yn') = 'Y' then
				ls_dosageStr  = '(Trước ăn : '
			end if	
			if lds_dosage_bill.getitemnumber( 1, 'morning_qty')  > 0 then
				ls_dosageStr  +=   'sáng ' + string(lds_dosage_bill.getitemnumber( 1, 'morning_qty')) +' '+ lds_dosage_bill.getitemstring( 1, 'uom_code') +', '
			end if	
			if lds_dosage_bill.getitemnumber( 1, 'noon_qty')  > 0 then
				ls_dosageStr  +=   ' trưa ' + string(lds_dosage_bill.getitemnumber( 1, 'noon_qty')) +' '+ lds_dosage_bill.getitemstring( 1, 'uom_code') +', '
			end if		
			if lds_dosage_bill.getitemnumber( 1, 'afternoon_qty')  > 0 then
				ls_dosageStr  +=   ' chiều ' + string(lds_dosage_bill.getitemnumber( 1, 'afternoon_qty')) +' '+ lds_dosage_bill.getitemstring( 1, 'uom_code') +', '
			end if		
			if lds_dosage_bill.getitemnumber( 1, 'evening_qty')  > 0 then
				ls_dosageStr  +=   ' tối ' + string(lds_dosage_bill.getitemnumber( 1, 'evening_qty')) +' '+ lds_dosage_bill.getitemstring( 1, 'uom_code')
			end if			
			if right(ls_dosageStr, 2) =  ', ' then 
				ls_dosageStr = left ( ls_dosageStr, len(ls_dosageStr) - 2) + ')'
			else
				ls_dosageStr +=  ')'
			end if
			dw_bill_line.setitem( ll_row , 'dosage', ls_dosageStr)
		end if
	end if
end if
end event

event e_action_deliver();
dw_scan_barcode.event losefocus( )
//dw_doc.event e_addrow( )

end event

event e_action_newcustomer();double					ldb_cust_id, ldb_id
string						ls_code, ls_name
c_str_pos				lc_str_pos
b_obj_instantiate		lbo_ins

dw_scan_barcode.event losefocus( )

open (u_w_newcustomer)
lc_str_pos = message.powerobjectparm 
setnull(message.powerobjectparm )

if lc_str_pos.s_response = 'ok' then
	//-- insert new cust vào database --//
	connect using it_transaction;
	if it_transaction.sqlcode = -1 then
		gf_messagebox('m.c_w_pos.e_action_pay.02','Thông báo','Không kết nối được CSDL:@'+ it_transaction.sqlerrtext ,'exclamation','ok',1)
		return
	end if
	ldb_cust_id = lbo_ins.f_get_object_id(lc_str_pos.s_data[1] , 'customer', gi_user_comp_id , gdb_branch , it_transaction)	
	if ldb_cust_id > 0 then
		lbo_ins.f_get_object_code_n_name( ldb_cust_id, ls_code, ls_name, it_transaction)
		if ls_name <> lc_str_pos.s_data[2] then
			if gf_messagebox('m.c_w_pos.e_action_pay.02','Xác nhận','Số điện thoại khách hàng đã có, nhưng đăng ký với tên khác, bạn có muốn cập nhật với tên mới không? @' + ls_name +'-' + lc_str_pos.s_data[2],'question','yesno',2) = 2 then				
				lc_str_pos.s_data[2] = ls_name
			else 
				UPDATE object set name = :lc_str_pos.s_data[2] where id = :ldb_cust_id using it_transaction;
			end if
		else
			gf_messagebox('m.c_w_pos.e_action_pay.02','Xác nhận','Số điện thoại khách hàng đã có !','information','ok',1)
		end if
	else
		select SEQ_TABLE_ID.nextval into :ldb_cust_id from dual using  it_transaction;	
		INSERT into object (ID, company_id, branch_id, object_ref_table, code, name, manage_group, posting_group, handled_by, created_by, created_date, last_mdf_by, last_mdf_date)
		VALUEs(:ldb_cust_id, :gi_user_comp_id, :gdb_branch, 'CUSTOMER',  :lc_str_pos.s_data[1],  :lc_str_pos.s_data[2], null, null, :gi_userid, :gi_userid, sysdate, :gi_userid, sysdate) 
		using it_transaction;
		
		select SEQ_TABLE_ID.nextval into :ldb_id from dual using  it_transaction;
		INSERT into customer (ID, company_id, branch_id, object_ref_id, object_ref_table, created_by, created_date, last_mdf_by, last_mdf_date)
		VALUEs(:ldb_id, :gi_user_comp_id, :gdb_branch,:ldb_cust_id, 'OBJECT', :gi_userid, sysdate, :gi_userid, sysdate) 
		using it_transaction;
		commit using it_transaction;		
	end if
	disconnect using it_transaction;
	
	//-- add cust vào bill --//
	dw_doc.setitem( 1, 'dr_cr_object', ldb_cust_id)
	dw_doc.setitem( 1, 'object_code', lc_str_pos.s_data[1])
	dw_doc.setitem( 1, 'object_name', lc_str_pos.s_data[2])
end if

end event

event e_action_adj_amount();double			ldb_total_qty, ldb_qty, ldb_price, ldb_price_adj, ldb_adj_amt_total
long				ll_row
c_str_pos		lc_str_pos


dw_scan_barcode.event losefocus( )

open (c_w_adj_amount)
if not isvalid(message.powerobjectparm ) then 
	return
end if
lc_str_pos = message.powerobjectparm 
setnull(message.powerobjectparm )

if lc_str_pos.s_response = 'ok' then
	if dw_bill_line.rowcount() > 0 then
		ldb_total_qty = double(dw_bill_line.describe("Evaluate('Sum(qty)', 0)"))
		if ldb_total_qty > 0 then
			ldb_price_adj = round(lc_str_pos.db_data / ldb_total_qty, 0)
			FOR ll_row = 1 to dw_bill_line.rowcount()
				ldb_qty = dw_bill_line.getitemnumber( ll_row, 'qty')
				ldb_price = dw_bill_line.getitemnumber( ll_row, 'price')				
				if ll_row = dw_bill_line.rowcount() then
					ldb_price_adj = round((lc_str_pos.db_data - ldb_adj_amt_total) / ldb_qty, 0)
					ldb_price += ldb_price_adj
				else
					ldb_price += ldb_price_adj
					ldb_adj_amt_total += ldb_price_adj*ldb_qty
				end if
				dw_bill_line.setitem( ll_row, 'price', ldb_price)
				dw_bill_line.setitem( ll_row, 'amount', ldb_price*ldb_qty)				
			NEXT
		end if
	end if		
elseif  lc_str_pos.s_response = 'cancel' then
end if

end event

event e_action_delete();int		li_row

dw_scan_barcode.event losefocus( )
li_row = dw_bill_line.find( "Gutter = 'Y' ", 1, dw_bill_line.rowcount())
Do while li_row > 0
	dw_bill_line.deleterow(li_row )
	li_row = dw_bill_line.find( "Gutter = 'Y' ", 1, dw_bill_line.rowcount())
Loop
end event

event e_action_other_amount();
//dw_doc.event e_addrow( )

dw_scan_barcode.event losefocus( )
end event

event e_action_newpr();
dw_scan_barcode.event losefocus( )
open (c_w_pr_pos)
end event

event e_action_pay_not_print();date			ld_transDate
double		ldb_cust_id, ldb_base_currID, ldb_bill_id, ldb_promotion_id
string			ls_CurrCode, ls_currName
c_datetime				lc_datetime
c_unit_instance			lc_unit
c_str_pos				lc_str_pos
b_obj_instantiate		lbo_ins

dw_scan_barcode.event losefocus( )
connect using it_transaction;
if it_transaction.sqlcode = -1 then
	gf_messagebox('m.c_w_pos.e_action_pay.02','Thông báo','Không kết nối được CSDL:@'+ it_transaction.sqlerrtext ,'exclamation','ok',1)
	return
end if
//-- open win payment --//
lc_str_pos.s_data[1] = dw_doc.getitemstring( 1, 'object_name') 
lc_str_pos.s_data[2] = dw_doc.getitemstring( 1, 'object_code') 
lc_str_pos.dba_data[1] = dw_doc.getitemnumber( 1, 'dr_cr_object') 
lc_str_pos.dba_data[2] = dw_doc.getitemnumber( 1, 'cust_point') 
lc_str_pos.dba_data[3] = double(dw_bill_line.Describe("Evaluate('Sum(amount)', 0)"))
openwithparm (c_w_payment, lc_str_pos)
if not isvalid( message.powerobjectparm) then
	disconnect using it_transaction;
	return
end if
lc_str_pos = message.powerobjectparm
setnull(message.powerobjectparm)

if lc_str_pos.s_response = 'cancel' then 
	disconnect using it_transaction;
	return
end if

//-- Lưu doc với status paying --//
		////-- lưu dw_doc --////
		lc_unit.f_get_base_cur( ldb_base_currID, ls_CurrCode, ls_currName)
		ldb_bill_id = dw_doc.getitemnumber( 1, 'ID')
		ld_transDate= date(dw_doc.getitemdatetime( 1, 'document_date'))
		ldb_cust_id = lc_str_pos.dba_data[1]
		dw_doc.setitem( 1, 'status', 'paying')
		dw_doc.setitem( 1, 'created_date', lc_datetime.f_getsysdate() )
		dw_doc.setitem( 1, 'last_mdf_date',  lc_datetime.f_getsysdate())
		dw_doc.settransobject(it_transaction )
		if dw_doc.update( ) = -1 then
			rollback using it_transaction;
			disconnect using it_transaction;
			gf_messagebox('m.c_w_pos.e_action_pay.01','Thông báo','Không lưu được Bill header:@'+ it_transaction.sqlerrtext ,'exclamation','ok',1)
			return 
		end if
		////-- insert booked_slip --////
		INSERT into booked_slip ( ID ,
										  BRANCH_ID   ,
										  COMPANY_ID   ,
										  OBJECT_REF_ID    ,
										  OBJECT_REF_TABLE,
										  DOC_TYPE,
										  CREATED_BY  ,
										  CREATED_DATE  ,
										  LAST_MDF_BY    ,
										  LAST_MDF_DATE  ,
										  VERSION_NO     ,
										  TRANS_DATE     ,
										  INVOICE_OBJECT  ,
										  QUANTITY_YN   ,
										  VALUE_YN       ,
										  DR_CR_OBJECT      ,
										  CURRENCY_ID   ,
										  EXCHANGE_RATE ,
										  RT_BONUS_POINT,
										  RT_USED_POINT
//										  PAYMENT_TERM   ,
//										  PAYMENT_METHOD  ,
//										  DUE_DATE  ,
//										  INCLUDE_TAX_YN  
										  )
		values(:idb_bs_id,
				:gdb_branch,
				:gi_user_comp_id,
				:ldb_bill_id,
				'DOCUMENT',
				'RETAIL',
				:gi_userid,
				sysdate,
				:gi_userid,
				sysdate,
				1,
				:ld_transDate,
				:ldb_cust_id,
				'Y',
				'Y',
				:ldb_cust_id,
				:ldb_base_currID,
				1,
				:lc_str_pos.dba_data[2],
				:lc_str_pos.dba_data[4]
				) using it_transaction;
		if it_transaction.sqlcode <> 0 then
			rollback using it_transaction;
			disconnect using it_transaction;
			gf_messagebox('m.c_w_pos.e_action_pay.02','Thông báo','Không lưu được Bill booked slip:@'+ it_transaction.sqlerrtext ,'exclamation','ok',1)
			return 
		end if 
		////-- Luu dw_line --////
		dw_bill_line.settransobject(it_transaction )
		if dw_bill_line.update( ) = -1 then
			rollback using it_transaction;
			disconnect using it_transaction;
			gf_messagebox('m.c_w_pos.e_action_pay.03','Thông báo','Không lưu được Bill line:@'+ it_transaction.sqlerrtext ,'exclamation','ok',1)
			return 
		end if
		////-- Luu dosage bill --////
		if ids_dosage_bill.rowcount( ) > 0 then
			ids_dosage_bill.settransobject( it_transaction)
			if ids_dosage_bill.update( ) = -1 then
				rollback using it_transaction;
				disconnect using it_transaction;
				gf_messagebox('m.c_w_pos.e_action_pay.04','Thông báo','Không lưu được liều dùng theo Bill:@'+ it_transaction.sqlerrtext ,'exclamation','ok',1)
				return 				
			end if
		end if
		
		///-- ghi nhận điểm --//
//		if ldb_cust_id > 0 then
//			ldb_promotion_id = ids_bonus_point.getitemnumber(1, 'id')
//			if ldb_promotion_id > 0 then
//				if lc_str_pos.dba_data[4] > 0 then
//					lbo_ins.f_upd_cust_point( ldb_bill_id, ld_transDate, ldb_cust_id, ldb_promotion_id,  lc_str_pos.dba_data[4] , lc_str_pos.dba_data[2], it_transaction)
//				else
//					lbo_ins.f_upd_cust_point( dw_bill_line , dw_doc , ids_bonus_point ,lc_str_pos.dba_data[2], it_transaction)
//				end if
//			end if
//		end if
		
//-- Gọi ghi sổ thread khác--//


commit using it_transaction;
//-- In bill : ko in--//


disconnect using it_transaction;

//-- thanh toán xong: reset dw_doc, dw_line --//
dw_bill_line.reset( )
dw_doc.reset( )
this.event e_action_newbill( )

end event

event e_action_focus_scan();
dw_scan_barcode.setfocus( )
dw_scan_barcode.setcolumn( 'name')
dw_scan_barcode.keybd_event( 115,0,0,0 )
end event

event e_action_refresh();any						laa_value[]
string						ls_col_string
datawindowchild		ldwc, ldwc_unit
c_dwservice				lc_dwservice

connect using	it_transaction;	


//-- retrieve dwc: tên hàng --//
this.dw_scan_barcode.getchild( 'name', ldwc)
//-- add where comapny --//
laa_value[1] = gi_user_comp_id
ls_col_string = 'company_id;'
//-- add where branch --//
//laa_value[2] = gdb_branch
//ls_col_string += 'branch_id;'
lc_dwservice.f_add_where_dwc(ldwc, ls_col_string, laa_value[])
ldwc.settransobject(it_transaction )
ldwc.retrieve( ) //-- Kết thúc retrieve dwc: tên hàng --//
//ls_rtn = dw_scan_barcode.Modify( 'name.dddw.percentwidth= 200')

//-- retrieve dwc_unit: tên hàng --//
this.dw_scan_barcode.getchild( 'unit', ldwc_unit)
//-- add where comapny --//
//laa_value[1] = gi_user_comp_id
//ls_col_string = 'company_id;'
//lc_dwservice.f_add_where_dwc(ldwc_unit, ls_col_string, laa_value[])
ldwc_unit.settransobject(it_transaction )
ldwc_unit.retrieve( )
//ls_rtn = dw_scan_barcode.Modify( 'unit.dddw.percentwidth= 200')

ids_dosage.settransobject( it_transaction)
ids_dosage.retrieve( )


//ids_dosage_bill = create t_ds_db
//ids_dosage_bill.dataobject = 'd_dosage_bill_grid'
//
//ids_bonus_point.settransobject( it_transaction)
//ids_bonus_point.retrieve( )

ids_cust_his.settransobject( it_transaction)
ids_cust_his.retrieve(gi_user_comp_id,gdb_branch )

this.dw_scan_barcode.post setfocus( )

disconnect using	it_transaction;	
end event

event e_action_newbill_shortcut();//-- Khi bấm shift + F1 --//

connect using it_transaction;
dw_doc.accepttext( )
if dw_doc.getrow( ) = 1 then
	if dw_bill_line.rowcount( ) > 0 then
		//-- reset bill mới --//
		dw_doc.reset( )
		dw_bill_line.reset( )
		dw_doc.event e_addrow( )
	end if
else
	dw_doc.event e_addrow( )
end if

dw_scan_barcode.setfocus( )
dw_scan_barcode.setitem( 1, 'name', '')
dw_scan_barcode.setitem( 1, 'unit', '')
dw_scan_barcode.setitem( 1, 'qty', 1)
dw_scan_barcode.setitem( 1, 'price', 0)
dw_scan_barcode.setitem( 1, 'stock', 0)
dw_scan_barcode.setcolumn( 'name')
idb_object_id = 0
is_obj_name = ''

disconnect using it_transaction;
end event

event e_action_pay_brief(c_str_pos vc_str_pos);date			ld_transDate
double		ldb_cust_id, ldb_base_currID, ldb_bill_id, ldb_staff_id, ldb_promotion_id, ldb_amt
string			ls_CurrCode, ls_currName, ls_staffName
long			ll_rtn, ll_staff_point, ll_row, ll_rows, ll_bill_staff_point, ll_bill_cust_point
c_datetime				lc_datetime
c_unit_instance			lc_unit
b_obj_instantiate		lbo_ins

dw_scan_barcode.event losefocus( )
connect using it_transaction;
if it_transaction.sqlcode = -1 then	
	gf_messagebox('m.c_w_pos.e_action_pay.02','Thông báo','Không kết nối được CSDL:@'+ it_transaction.sqlerrtext ,'exclamation','ok',1)
	return
end if


//-- Lưu doc với status paying --//
		////-- lưu dw_doc --////
		lc_unit.f_get_base_cur_ex( ldb_base_currID, ls_CurrCode, ls_currName,it_transaction)
		ldb_bill_id = dw_doc.getitemnumber( 1, 'ID')
		ld_transDate= date(dw_doc.getitemdatetime( 1, 'document_date'))
		ldb_cust_id = vc_str_pos.dba_data[1]
		if isnull(ldb_cust_id) then ldb_cust_id = 0
		dw_doc.setitem( 1, 'dr_cr_object', ldb_cust_id)
		dw_doc.setitem( 1, 'status', 'paying')
		dw_doc.setitem( 1, 'created_date', lc_datetime.f_getsysdate_ex(it_transaction) )
		dw_doc.setitem( 1, 'last_mdf_date',  lc_datetime.f_getsysdate_ex(it_transaction))
		
		dw_doc.settransobject(it_transaction )
		if dw_doc.update( ) = -1 then
			rollback using it_transaction;
			disconnect using it_transaction;
			gf_messagebox('m.c_w_pos.e_action_pay.01','Thông báo','Không lưu được Bill header:@'+ it_transaction.sqlerrtext ,'exclamation','ok',1)
			return 
		end if
		///-- ghi nhận điểm KH và NV--//
		ldb_amt= double(dw_bill_line.Describe("Evaluate('Sum(amount)', 0)"))
		if vc_str_pos.s_data[2] <> '' then
				ll_rtn = lbo_ins.f_get_object_id_name_n_point(vc_str_pos.s_data[2], 'STAFF',gi_user_comp_id , gdb_branch , ldb_staff_id, ls_staffName, ll_staff_point, it_transaction)
			if ll_rtn = 1 then
				FOR ll_row = 1 to dw_bill_line.rowcount()
					dw_bill_line.setitem(ll_row , 'sales_person',ldb_staff_id)
				NEXT
			end if
		end if
		if ldb_cust_id > 0 or ldb_staff_id > 0 then					
			if vc_str_pos.dba_data[4] > 0 then //-- dùng điểm --//			
				lbo_ins.f_upd_cust_point_ex( ldb_bill_id, ld_transDate, ldb_cust_id, vc_str_pos.dba_data[4] , vc_str_pos.dba_data[2], it_transaction)
				lbo_ins.f_upd_bonus_point_ex( dw_bill_line, dw_doc ,0, ldb_staff_id, vc_str_pos.dba_data[2], ll_staff_point, it_transaction,  ll_bill_staff_point, ll_bill_cust_point)
			else
				lbo_ins.f_upd_bonus_point_ex( dw_bill_line, dw_doc ,ldb_cust_id, ldb_staff_id, vc_str_pos.dba_data[2], ll_staff_point, it_transaction,  ll_bill_staff_point, ll_bill_cust_point)
			end if				
		end if				
		////-- insert booked_slip --////
		INSERT into booked_slip ( ID ,
										  BRANCH_ID   ,
										  COMPANY_ID   ,
										  OBJECT_REF_ID    ,
										  OBJECT_REF_TABLE,
										  DOC_TYPE,
										  CREATED_BY  ,
										  CREATED_DATE  ,
										  LAST_MDF_BY    ,
										  LAST_MDF_DATE  ,
										  VERSION_NO     ,
										  TRANS_DATE     ,
										  INVOICE_OBJECT  ,
										  QUANTITY_YN   ,
										  VALUE_YN       ,
										  DR_CR_OBJECT      ,
										  CURRENCY_ID   ,
										  EXCHANGE_RATE ,
										  RT_BONUS_POINT,
										  RT_USED_POINT,
										  RT_STAFF_POINT
										  )
		values(:idb_bs_id,
				:gdb_branch,
				:gi_user_comp_id,
				:ldb_bill_id,
				'DOCUMENT',
				'RETAIL',
				:gi_userid,
				sysdate,
				:gi_userid,
				sysdate,
				1,
				:ld_transDate,
				:ldb_cust_id,
				'Y',
				'Y',
				:ldb_cust_id,
				:ldb_base_currID,
				1,
				:ll_bill_cust_point,
				:vc_str_pos.dba_data[4],
				:ll_bill_staff_point
				) using it_transaction;
		if it_transaction.sqlcode <> 0 then
			rollback using it_transaction;
			disconnect using it_transaction;
			gf_messagebox('m.c_w_pos.e_action_pay.02','Thông báo','Không lưu được Bill booked slip:@'+ it_transaction.sqlerrtext ,'exclamation','ok',1)			
			return 			
		end if 
		
		////-- Luu dw_line --////	
		dw_bill_line.settransobject(it_transaction )
		if dw_bill_line.update( ) = -1 then
			rollback using it_transaction;
			disconnect using it_transaction;
			gf_messagebox('m.c_w_pos.e_action_pay.03','Thông báo','Không lưu được Bill line:@'+ it_transaction.sqlerrtext ,'exclamation','ok',1)
			return 
		end if
		////-- Luu dosage bill --////
		if ids_dosage_bill.rowcount( ) > 0 then
			ids_dosage_bill.settransobject( it_transaction)
			if ids_dosage_bill.update( ) = -1 then
				rollback using it_transaction;
				disconnect using it_transaction;
				gf_messagebox('m.c_w_pos.e_action_pay.04','Thông báo','Không lưu được liều dùng theo Bill:@'+ it_transaction.sqlerrtext ,'exclamation','ok',1)
				return 				
			end if
		end if

		
//-- Gọi ghi sổ thread khác--//


commit using it_transaction;
//-- In bill --//
if  vc_str_pos.s_response = 'ok' then
	ids_bill_print.settransobject( it_transaction)
	ids_bill2_print.settransobject( it_transaction)
	ll_rows = ids_bill_print.retrieve( ldb_bill_id)
	ll_rows = ids_bill2_print.retrieve( ldb_bill_id)
	if ll_rows > 0 then
		ids_bill_print.print(false,false)	
		ids_bill2_print.print(false,false)					
	end if
end if

disconnect using it_transaction;

//-- thanh toán xong: reset dw_doc, dw_line --//
dw_bill_line.reset( )
dw_doc.reset( )
this.event e_action_newbill_pay(ldb_amt )

end event

event e_action_newbill_pay(double vdb_amount);
connect using it_transaction;
dw_doc.accepttext( )
if dw_doc.getrow( ) = 1 then
	if dw_bill_line.rowcount( ) > 0 then
		//-- move vào dw suspend --//
		dw_doc.rowsmove( 1, 1, primary!, dw_suspend , dw_suspend.rowcount()+1, primary!)
		dw_bill_line.rowsmove( 1, dw_bill_line.rowcount(), primary!, ids_bill_line, ids_bill_line.rowcount()+1, primary!)
		dw_doc.event e_addrow( )
	end if
else
	dw_doc.event e_addrow( )
end if
dw_doc.object.amount_chk.text = string(vdb_amount,'#,##0') + ' đ'
dw_doc.object.amount_chk.visible = true

dw_scan_barcode.setfocus( )
dw_scan_barcode.setitem( 1, 'name', '')
dw_scan_barcode.setitem( 1, 'unit', '')
dw_scan_barcode.setitem( 1, 'qty', 1)
dw_scan_barcode.setitem( 1, 'price', 0)
dw_scan_barcode.setitem( 1, 'stock', 0)
dw_scan_barcode.setcolumn( 'name')
idb_object_id = 0
is_obj_name = ''

disconnect using it_transaction;
end event

event e_action_print_4_chk();int				li_row, li_ins_row

FOR li_row = 1 to dw_bill_line.rowcount( )
	li_ins_row = ids_bill_print.insertrow( 0)
	ids_bill_print.setitem( li_ins_row, 'document_code', dw_doc.getitemstring(1,'code' ))
	ids_bill_print.setitem( li_ins_row, 'document_document_date', dw_doc.getitemdatetime(1,'document_date' ))
	ids_bill_print.setitem( li_ins_row, 'rownum', li_row)
	ids_bill_print.setitem( li_ins_row, 'so_line_line_text', dw_bill_line.getitemstring(li_row,'line_text' ))
	ids_bill_print.setitem( li_ins_row, 'so_line_qty', dw_bill_line.getitemnumber(li_row,'qty' ))
	ids_bill_print.setitem( li_ins_row, 'v_uom_item_uom_code', dw_bill_line.getitemstring(li_row,'unit_code' ))
	ids_bill_print.setitem( li_ins_row, 'so_line_price', dw_bill_line.getitemnumber(li_row,'price' ))
	ids_bill_print.setitem( li_ins_row, 'so_line_amount', dw_bill_line.getitemnumber(li_row,'amount' ))
NEXT
if dw_bill_line.rowcount( ) > 0 then
	ids_bill_print.print(false,false)	
end if
end event

public function integer f_resize ();//-- resize dw_doc --//
dw_doc.move( 0, 0)
dw_doc.width = 1/3* this.width
dw_doc.height = this.f_get_dwheight( dw_doc)

//-- resize dw_bill_line --//
dw_bill_line.move( 0, dw_doc.y+ dw_doc.height)
dw_bill_line.width = 1/3* this.width
dw_bill_line.height = this.height - dw_doc.y - dw_doc.height - 100

//-- resize gb_1 --//
gb_1.move(dw_bill_line.x + dw_bill_line.width , 0)
gb_1.width = 24
gb_1.height = this.height


//-- resize dw_scan_barcode --//
dw_scan_barcode.move( gb_1.x+ gb_1.width, 0)
dw_scan_barcode.width = 2/3* this.width
dw_scan_barcode.height = 1/10*this.height


//-- resize tab_1 --//
//tab_1.move( dw_scan_barcode.x, dw_scan_barcode.y + dw_scan_barcode.height )
//tab_1.width = 1/3* this.width
//tab_1.height = 1/2*(9/10*this.height - dw_scan_barcode.y - dw_scan_barcode.height)

//-- resize dw_promottion --//
st_promotion.move( dw_scan_barcode.x ,  dw_scan_barcode.y + dw_scan_barcode.height)
st_promotion.width = 1/3* this.width
dw_promotion.move( dw_scan_barcode.x, st_promotion.y + st_promotion.height )
dw_promotion.width = 1/3* this.width
dw_promotion.height = 1/3*(9/10*this.height - 550 - st_dosage.height - st_promotion.height )

//-- resize dw_dosage--//
st_dosage.move( dw_scan_barcode.x ,  dw_promotion.y + dw_promotion.height)
st_dosage.width = 1/3* this.width
dw_dosage.move( dw_scan_barcode.x, st_dosage.y + st_dosage.height )
dw_dosage.width = 1/3* this.width
dw_dosage.height = 1/3*(9/10*this.height - 550 - st_dosage.height - st_promotion.height )

//-- resize dw_cust_his--//
dw_cust_his.move( dw_scan_barcode.x, dw_dosage.y + dw_dosage.height )
dw_cust_his.width = 1/3* this.width
dw_cust_his.height = 1/3*(9/10*this.height - 550 - st_dosage.height - st_promotion.height )


//-- resize dw_func --//
dw_func.move( dw_scan_barcode.x, dw_cust_his.y+ dw_cust_his.height)
dw_func.width = 2/3* this.width
dw_func.height = 400

//-- resize gb_2 --//
gb_2.move(dw_promotion.x + dw_promotion.width , dw_scan_barcode.y + dw_scan_barcode.height)
gb_2.width = 24
gb_2.height = this.height - dw_scan_barcode.y - dw_scan_barcode.height

//-- resize st_suspend --//
st_suspend.move( gb_2.x + gb_2.width ,  dw_scan_barcode.y + dw_scan_barcode.height)
st_suspend.width = 1/3* this.width

//-- resize dw_suspend --//
dw_suspend.move( st_suspend.x, st_suspend.y+ st_suspend.height)
dw_suspend.width = 1/3* this.width
dw_suspend.height = 1/2*(9/10*this.height - st_suspend.height - st_online.height - 550 )

//-- resize st_online --//
st_online.move( dw_suspend.x ,  dw_suspend.y + dw_suspend.height)
st_online.width = 1/3* this.width

//-- resize dw_online --//
dw_online.move( st_online.x, st_online.y+ st_online.height)
dw_online.width = 1/3* this.width
dw_online.height = 1/2*(9/10*this.height - st_suspend.height - st_online.height - 550 )

return 0
end function

public function long f_get_dwheight (datawindow vdw_handle);Integer	li_Bands, li_Cnt, li_group_level, li_header_cnt, ll_find
long		ll_height
long		ll_detail
String	ls_DWBands, ls_Band[]
c_obj_service lobj_srv

ls_DWBands = vdw_handle.Describe("DataWindow.Bands")

li_Bands = lobj_srv.f_StringToArray (ls_DWBands, "~t", ls_Band)

For li_Cnt = 1 To li_Bands
	If ls_Band[li_Cnt] <> "detail" Then
		if pos(ls_Band[li_Cnt],'header.')> 0 then
			li_group_level = Integer(mid(ls_Band[li_Cnt], pos(ls_Band[li_Cnt], '.') + 1 ))
			ll_find = vdw_handle.findgroupchange( 1, li_group_level )
			li_header_cnt = 0
			DO while ll_find > 0
				li_header_cnt++
				ll_find = vdw_handle.findgroupchange( ll_find+1, li_group_level )
			LOOP 
		else
			li_header_cnt = 1
		end if
		ll_Height += li_header_cnt * Integer(vdw_handle.Describe("Datawindow." + ls_Band[li_Cnt] + ".Height"))
	End if
Next

ll_Detail = vdw_handle.rowcount() * Integer(vdw_handle.Describe("Datawindow.Detail.Height"))

ll_Height += ll_Detail

Return ll_Height
end function

public function integer f_resize_dw_dosage (integer vi_row);//
//If vi_row <= 3 then
//	this.tab_1.tabpage_1.dw_dosage.move(0, this.tab_1.tabpage_1.height/3*(3 - vi_row))
//	this.tab_1.tabpage_1.dw_dosage.width = this.tab_1.tabpage_1.width
//	this.tab_1.tabpage_1.dw_dosage.height = this.tab_1.tabpage_1.height/3*vi_row
//else
//	this.tab_1.tabpage_1.dw_dosage.move(0, 0)
//	this.tab_1.tabpage_1.dw_dosage.width = this.tab_1.tabpage_1.width
//	this.tab_1.tabpage_1.dw_dosage.height = this.tab_1.tabpage_1.height
//end if
return 0
end function

public function string f_get_comm_data ();String ls_value
long ll_i
//kiem tra trong buffer co du lieu thi moi thuc hien viec doc
	If ole_1.Object.InBufferCount <> 0  Then
		ls_value  = string(ole_1.Object.input) 		
//		mle_1.text =  mle_1.text  + ls_value		
//		do while pos(mle_1.text, 'kg') > 0
//			ls_value = mid(mle_1.text, pos(mle_1.text, 'kg') - 9, 8)
//			mle_1.text = mid(mle_1.text, pos(mle_1.text, 'kg') + 2)
//		loop
//		ls_value = trim(ls_value)
//		for ll_i = 1 to len(ls_value)
//			
//			if mid(ls_value, ll_i, 1) < '0' or mid(ls_value, ll_i, 1) > '9' then 
//				if mid(ls_value, ll_i, 1) <> '-' then	
//					setnull(ls_value)
//					exit
//				end if
//			end if
//		next 		
		ole_1.Object.InBufferCount = 0
	End if		
Return ls_value
end function

public function integer f_disconnect_comm ();try
	ole_1.Object.PortOpen = false
catch (OLERuntimeError MyOLEError )
	// Messagebox("OLE Error",MyOLEError.getMessage())
	 return 0
catch (Exception ec)
 	return 0
catch (RunTimeerror MyRTError )
	 //Messagebox("Runtime Error",MyRTError.getMessage())
	 return 0
end try
return 1
end function

public function integer f_load_bill (string vs_code);double			ldb_price, ldb_qty
int					li_row, ll_row
t_ds_db			lds_foundbill

if isnull(vs_code) or vs_code ='' then return 0
connect using it_transaction;
if it_transaction.sqlcode = -1 then
	gf_messagebox('m.c_w_pos.e_action_return.01','Thông báo','Không kết nối được CSDL:@'+ it_transaction.sqlerrtext ,'exclamation','ok',1)
	return -1
end if

lds_foundbill = create t_ds_db
lds_foundbill.dataobject = 'ds_load_bill'
lds_foundbill.settransobject(it_transaction )
if lds_foundbill.retrieve( gi_user_comp_id, gdb_branch, upper(vs_code) ) > 0 then
	//-- kiểm tra bill hiện tại : suspend nếu có--//
	if dw_doc.getrow( ) = 1 and dw_bill_line.rowcount( ) > 0 then		
		dw_doc.rowsmove( 1, 1, primary!, dw_suspend , dw_suspend.rowcount()+1, primary!)
		dw_bill_line.rowsmove( 1, dw_bill_line.rowcount(), primary!, ids_bill_line, ids_bill_line.rowcount()+1, primary!)
		dw_doc.event e_addrow( )
	end if	
	
	//-- add hdr --//
	dw_doc.setitem( 1, 'object_name',  lds_foundbill.getitemstring( 1, 'cust_name') )
	dw_doc.setitem( 1, 'object_code',  lds_foundbill.getitemstring( 1, 'cust_code') )
	dw_doc.setitem( 1, 'dr_cr_object',  lds_foundbill.getitemstring( 1, 'cust_id') )
	dw_doc.setitem( 1, 'note',  lds_foundbill.getitemstring( 1, 'note') )
	
	//-- add item trả hàng --//
	FOR li_row = 1 to  lds_foundbill.rowcount() 
		ldb_qty = lds_foundbill.getitemnumber( li_row, 'qty')
		ldb_price = lds_foundbill.getitemnumber( li_row, 'retail_price')
		ll_row = dw_bill_line.event e_addrow( )
		dw_bill_line.setitem(ll_row , 'line_text', lds_foundbill.getitemstring( li_row, 'line_text') )
		dw_bill_line.setitem(ll_row , 'qty', ldb_qty)
		dw_bill_line.setitem(ll_row , 'price',   ldb_price)
		dw_bill_line.setitem(ll_row , 'amount', ldb_qty * ldb_price)
		dw_bill_line.setitem(ll_row , 'ITEM_ID',  lds_foundbill.getitemnumber( li_row, 'ITEM_ID'))
		dw_bill_line.setitem(ll_row , 'TRANS_UOM',  lds_foundbill.getitemnumber( li_row, 'TRANS_UOM') )
		dw_bill_line.setitem(ll_row , 'unit_code',  lds_foundbill.getitemstring( li_row, 'uom_code'))	
		dw_bill_line.setitem(ll_row , 'note',lds_foundbill.getitemstring( li_row, 'line_note') )
		dw_bill_line.setitem(ll_row , 'line_no', ll_row)	
	NEXT
//	dw_scan_barcode.ib_dropdowning = false
	dw_scan_barcode.keybd_event( 115,0,0,0 )
	
	disconnect using it_transaction;
	return 1
end if
dw_scan_barcode.keybd_event( 115,0,0,0 )
disconnect using it_transaction;
return 0
end function

public function integer f_connect_comm (integer vi_port);
try
	ole_1.Object.Settings = "9600,N,8,1"
	ole_1.Object.CommPort = vi_port
	ole_1.Object.RThreshold = 1
	ole_1.Object.SThreshold = 0
	ole_1.Object.InputMode = 0
	ole_1.Object.InputLen = 0
	//  ole_1.Object.Handshaking = comNone
	ole_1.Object.InBufferSize = 1024
	ole_1.Object.OutBufferSize = 1024
	If ole_1.Object.PortOpen = False Then
		ole_1.Object.PortOpen = True
	End If	
	ole_1.Object.CTSTimeout = 0.01
catch (OLERuntimeError MyOLEError )
	// Messagebox("OLE Error",MyOLEError.getMessage())
	 return 0
catch (Exception ec)
 	return 0
catch (RunTimeerror MyRTError )
	 //Messagebox("Runtime Error",MyRTError.getMessage())
	 return 0
end try
ib_connected = true
return 1
end function

on c_w_pos.create
this.ole_1=create ole_1
this.dw_cust_his=create dw_cust_his
this.st_promotion=create st_promotion
this.st_dosage=create st_dosage
this.dw_promotion=create dw_promotion
this.dw_dosage=create dw_dosage
this.dw_func=create dw_func
this.dw_online=create dw_online
this.dw_suspend=create dw_suspend
this.dw_doc=create dw_doc
this.dw_bill_line=create dw_bill_line
this.dw_scan_barcode=create dw_scan_barcode
this.gb_2=create gb_2
this.gb_1=create gb_1
this.st_suspend=create st_suspend
this.st_online=create st_online
this.Control[]={this.ole_1,&
this.dw_cust_his,&
this.st_promotion,&
this.st_dosage,&
this.dw_promotion,&
this.dw_dosage,&
this.dw_func,&
this.dw_online,&
this.dw_suspend,&
this.dw_doc,&
this.dw_bill_line,&
this.dw_scan_barcode,&
this.gb_2,&
this.gb_1,&
this.st_suspend,&
this.st_online}
end on

on c_w_pos.destroy
destroy(this.ole_1)
destroy(this.dw_cust_his)
destroy(this.st_promotion)
destroy(this.st_dosage)
destroy(this.dw_promotion)
destroy(this.dw_dosage)
destroy(this.dw_func)
destroy(this.dw_online)
destroy(this.dw_suspend)
destroy(this.dw_doc)
destroy(this.dw_bill_line)
destroy(this.dw_scan_barcode)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.st_suspend)
destroy(this.st_online)
end on

event resize;
this.post f_resize( )
end event

event open;string								ls_col_string, ls_rtn
any								laa_value[]
int									li_port
c_dwservice						lc_dwservice

//////////////////////////////////////////////////////////////
//li_port = FileOpen("HID\VID_04B4&PID_0100\6&14404537&0&0000", LineMode!, Read!, LockRead!, Replace!)


///////////////////////////////////////////////////////////////
li_port = integer(ProfileString("global.ini",'com','com','0'))
//messagebox('c',li_port)
if li_port > 0 then
//	messagebox('c','c')
	this.f_connect_comm(li_port)
end if

//-- Tạo connection voi database --//
it_transaction = create t_transaction
it_transaction.dbms =	SQLCA.DBMS
it_transaction.ServerName	 = SQLCA.ServerName
it_transaction.LogId	 = SQLCA.LogId
it_transaction.LogPass 	 = SQLCA.LogPass 
it_transaction.AutoCommit 	 = false 
it_transaction.DBParm	 = SQLCA.DBParm
connect using	it_transaction;	


//-- Tạo connection second voi database --//
it_trans_second = create t_transaction
it_trans_second.dbms =	SQLCA.DBMS
it_trans_second.ServerName	 = SQLCA.ServerName
it_trans_second.LogId	 = SQLCA.LogId
it_trans_second.LogPass 	 = SQLCA.LogPass 
it_trans_second.AutoCommit 	 = false 
it_trans_second.DBParm	 = SQLCA.DBParm
//-- ko connect--//

this.dw_func.settransobject(it_transaction)
this.dw_func.retrieve( )

this.dw_scan_barcode.insertrow( 0)
dw_scan_barcode.setitem( 1, 'qty', 1)
//-- retrieve dwc: tên hàng --//
this.dw_scan_barcode.getchild( 'name', idwc)
//-- add where comapny --//
laa_value[1] = gi_user_comp_id
ls_col_string = 'company_id;'
//-- add where branch --//
//laa_value[2] = gdb_branch
//ls_col_string += 'branch_id;'
lc_dwservice.f_add_where_dwc(idwc, ls_col_string, laa_value[])
idwc.settransobject(it_transaction )
idwc.retrieve( ) //-- Kết thúc retrieve dwc: tên hàng --//
ls_rtn = dw_scan_barcode.Modify( 'name.dddw.percentwidth= 200')

//-- retrieve dwc_unit: tên hàng --//
this.dw_scan_barcode.getchild( 'unit', idwc_unit)
//-- add where comapny --//
//laa_value[1] = gi_user_comp_id
//ls_col_string = 'company_id;'
//lc_dwservice.f_add_where_dwc(ldwc_unit, ls_col_string, laa_value[])
idwc_unit.settransobject(it_transaction )
idwc_unit.retrieve( )
ls_rtn = dw_scan_barcode.Modify( 'unit.dddw.percentwidth= 250')

ids_dosage = create t_ds_db
ids_dosage.dataobject = 'd_dosage_form'
ids_dosage.settransobject( it_transaction)
ids_dosage.retrieve( )

ids_bill_line = create t_ds_db
ids_bill_line.dataobject = 'd_bill_line_grid'

ids_bill_print = create t_ds_db
ids_bill_print.dataobject = 'dv_bill_form'
ids_bill_print.Modify("DataWindow.Print.Paper.Size=256") //-- size in milimet --//
ids_bill_print.Modify("DataWindow.Print.CustomPage.Width=80") 
ids_bill_print.Modify("DataWindow.Print.Margin.Top= 5")



ids_bill2_print = create t_ds_db
ids_bill2_print.dataobject = 'dv_bill2_form'
ids_bill2_print.Modify("DataWindow.Print.Paper.Size=256") //-- size in milimet --//
ids_bill2_print.Modify("DataWindow.Print.CustomPage.Width=80") 
ids_bill2_print.Modify("DataWindow.Print.Margin.Top= 5")

ids_dosage_bill = create t_ds_db
ids_dosage_bill.dataobject = 'd_dosage_bill_grid'


//ids_bonus_point = create t_ds_db
//ids_bonus_point.dataobject = 'ds_bonus_point'
//ids_bonus_point.settransobject( it_transaction)
//ids_bonus_point.retrieve( )
//
//ids_bonus_point_staff = create t_ds_db
//ids_bonus_point_staff.dataobject = 'ds_bonus_point_staff'
//ids_bonus_point_staff.settransobject( it_transaction)
//ids_bonus_point_staff.retrieve( )

ids_cust_his = create t_ds_db
ids_cust_his.dataobject = 'd_cust_his_grid'
ids_cust_his.settransobject( it_transaction)
ids_cust_his.retrieve(gi_user_comp_id,gdb_branch )

ids_buy_get_the_same = create t_ds_db
ids_buy_get_the_same.dataobject = 'ds_buy_get_the_same'
ids_buy_get_the_same.settransobject( it_transaction)
ids_buy_get_the_same.retrieve( )

//ids_buy_get_bill_m = create t_ds_db
//ids_buy_get_bill_m.dataobject = 'ds_buy_get_bill_m'


disconnect using	it_transaction;	
this.event e_action_newbill( )
this.dw_scan_barcode.post setfocus( )
this.dw_func.setposition( totop!)

if li_port > 0 then
	timer(0.1)
end if
end event

event timer;string		ls_barcode, ls_objtype, ls_findStr, ls_uom_code, ls_to_uom_code
decimal	ldc_price, ldc_qty, ldc_promote_qty, ldc_buy_qty, ldc_get_qty, ldc_add_qty, ldc_to_coefficient
double	ldb_to_unit_id
long		ll_found, ll_row

c_string	lc_string

ls_barcode = this.f_get_comm_data( )

if ls_barcode <> '' then //-- tìm theo mã thuốc (barcode nộ bộ) --//
	ls_barcode = lc_string.f_removespecialchar(ls_barcode)
	ll_found = idwc.find("object_code= '"+ls_barcode+"'" ,1, idwc.rowcount())
	if ll_found > 0 then
		ls_objtype =  idwc.getitemstring(ll_found, 'object_ref_table')
		if upper(ls_objtype) = 'ITEM' then 
			idb_object_id = idwc.getitemnumber(ll_found, 'object_id')
			il_staff_pct = idwc.getitemnumber(ll_found, 'comm_staff_pct')
			if isnull(il_staff_pct) then il_staff_pct = 0
			il_cust_pct = idwc.getitemnumber(ll_found, 'comm_cust_pct')
			if isnull(il_cust_pct) then il_cust_pct = 0			
			is_obj_name =  idwc.getitemstring(ll_found, 'object_name')
			is_short_name = idwc.getitemstring(ll_found, 'short_name')
			is_print_name = idwc.getitemstring(ll_found, 'print_name')
			is_location = idwc.getitemstring(ll_found, 'location_code')				
			idwc_unit.setfilter( " item_id = " + string(idb_object_id))
			idwc_unit.filter( )
			if idwc_unit.rowcount( ) = 1 and idwc_unit.getitemnumber( 1, 'retail_price') > 0 then // SKU 1 đơn vị và có giá -> insert vào bill--//
				idb_uom_id = idwc_unit.getitemnumber( 1, 'uom_id')
				ls_uom_code = idwc_unit.getitemstring( 1, 'uom_code')
				ldc_to_coefficient = idwc_unit.getitemnumber( 1, 'TO_COEFFICIENT')
				ldb_to_unit_id = idwc_unit.getitemnumber( 1, 'to_unit_id')
				ls_to_uom_code = idwc_unit.getitemstring( 1, 'to_unit_code')
				
				ldc_price =  idwc_unit.getitemnumber( 1, 'retail_price') 
				ls_findStr = "ITEM_ID = "+string(idb_object_id) + " and TRANS_UOM = "+string(idb_uom_id) + " and PRICE ="+string(ldc_price)
				ll_row = dw_bill_line.find( ls_findStr , 1, dw_bill_line.rowcount( ) )
				
				if ll_row = 0 then
					ldc_qty = 1
					ll_row = dw_bill_line.event e_addrow( )
					dw_bill_line.scrolltorow( ll_row)
					if isnull(is_print_name) or is_print_name = '' then
						dw_bill_line.setitem(ll_row , 'line_text', is_obj_name)
					else
						dw_bill_line.setitem(ll_row , 'line_text', is_print_name)
					end if
					dw_bill_line.setitem(ll_row , 'qty', ldc_qty)
					dw_bill_line.setitem(ll_row , 'price',  ldc_price)
					dw_bill_line.setitem(ll_row , 'amount', ldc_price* 1)
					dw_bill_line.setitem(ll_row , 'ITEM_ID', idb_object_id)
					dw_bill_line.setitem(ll_row , 'TRANS_UOM', idb_uom_id)
					dw_bill_line.setitem(ll_row , 'unit_code', ls_uom_code)		
					dw_bill_line.setitem(ll_row , 'sales_person',g_user.object_id )	
					dw_bill_line.setitem(ll_row , 'loc',is_location )	
					dw_bill_line.setitem(ll_row , 'line_no', ll_row)	
					dw_bill_line.setitem(ll_row , 'cust_point', round(ldc_price* 1 * il_cust_pct/100,0) )	
					dw_bill_line.setitem(ll_row , 'staff_point', round(ldc_price* 1 * il_staff_pct/100,0) )	
					dw_bill_line.setitem(ll_row , 'cust_pct',  il_cust_pct )	
					dw_bill_line.setitem(ll_row , 'staff_pct',  il_staff_pct )		
					//-- add promote item --//
					ll_found = ids_buy_get_the_same.find("object_id = "+string(idb_object_id) + " AND buy_qty <=" + string(ldc_to_coefficient), 1, ids_buy_get_the_same.rowcount( ))
					if ll_found > 0 then
						ldc_promote_qty = dw_bill_line.getitemnumber( ll_row, 'promote_qty')
						if isnull(ldc_promote_qty) then ldc_promote_qty = 0
						ldc_buy_qty = ids_buy_get_the_same.getitemnumber(ll_found , 'buy_qty')
						if isnull(ldc_buy_qty) then ldc_buy_qty = 0
						ldc_get_qty = ids_buy_get_the_same.getitemnumber(ll_found , 'get_qty')
						if isnull(ldc_get_qty) then ldc_get_qty = 0
						if ldc_buy_qty > 0 then					
							ldc_add_qty = round(ldc_qty*ldc_to_coefficient / ldc_buy_qty,0) * ldc_get_qty - ldc_promote_qty
							if ldc_add_qty > 0 then
								if ldc_promote_qty = 0 then
									ll_row = dw_bill_line.event e_addrow( )
								else
									ll_row = dw_bill_line.find( "ITEM_ID= "+string(idb_object_id)+" AND price = 0 ", 1, dw_bill_line.rowcount())
								end if
								dw_bill_line.setitem(ll_row , 'qty', ldc_promote_qty+ldc_add_qty)
								dw_bill_line.setitem(ll_row , 'price',  0)
								dw_bill_line.setitem(ll_row , 'amount', 0)
								dw_bill_line.setitem(ll_row , 'ITEM_ID', idb_object_id)
								dw_bill_line.setitem(ll_row , 'TRANS_UOM', ldb_to_unit_id)
								dw_bill_line.setitem(ll_row , 'unit_code', ls_to_uom_code )		
								dw_bill_line.setitem(ll_row , 'sales_person',g_user.object_id )	
								dw_bill_line.setitem(ll_row , 'loc',is_location )	
								dw_bill_line.setitem(ll_row , 'line_no', ll_row)
								dw_bill_line.setitem(ll_row , 'note', ids_buy_get_the_same.getitemstring(ll_found, 'name'))
							end if
						end if
					end if					
				else		
					ldc_qty = dw_bill_line.getitemnumber( ll_row, 'qty') + 1
					dw_bill_line.setitem(ll_row , 'qty',  ldc_qty)
					dw_bill_line.setitem(ll_row , 'amount', ldc_price* ldc_qty)		
					dw_bill_line.setitem(ll_row , 'cust_point', round(ldc_price* ldc_qty * il_cust_pct/100,0) )	
					dw_bill_line.setitem(ll_row , 'staff_point', round(ldc_price* ldc_qty * il_staff_pct/100,0) )		
					dw_bill_line.setitem(ll_row , 'cust_pct',  il_cust_pct )	
					dw_bill_line.setitem(ll_row , 'staff_pct',  il_staff_pct )
					//-- add promote item --//
					ll_found = ids_buy_get_the_same.find("object_id = "+string(idb_object_id) + " AND buy_qty >=" + string(ldc_qty*ldc_to_coefficient), 1, ids_buy_get_the_same.rowcount( ))
					if ll_found > 0 then
						ldc_promote_qty = dw_bill_line.getitemnumber( ll_row, 'promote_qty')
						if isnull(ldc_promote_qty) then ldc_promote_qty = 0
						ldc_buy_qty = ids_buy_get_the_same.getitemnumber(ll_found , 'buy_qty')
						if isnull(ldc_buy_qty) then ldc_buy_qty = 0
						ldc_get_qty = ids_buy_get_the_same.getitemnumber(ll_found , 'get_qty')
						if isnull(ldc_get_qty) then ldc_get_qty = 0
						if ldc_buy_qty > 0 then					
							ldc_add_qty = round(ldc_qty*ldc_to_coefficient / ldc_buy_qty,0) * ldc_get_qty - ldc_promote_qty
							if ldc_add_qty > 0 then
								if ldc_promote_qty = 0 then
									ll_row = dw_bill_line.event e_addrow( )
								else
									ll_row = dw_bill_line.find( "ITEM_ID= "+string(idb_object_id)+" AND price = 0 ", 1, dw_bill_line.rowcount())
								end if
								dw_bill_line.setitem(ll_row , 'qty', ldc_promote_qty+ldc_add_qty)
								dw_bill_line.setitem(ll_row , 'price',  0)
								dw_bill_line.setitem(ll_row , 'amount', 0)
								dw_bill_line.setitem(ll_row , 'ITEM_ID', idb_object_id)
								dw_bill_line.setitem(ll_row , 'TRANS_UOM', ldb_to_unit_id)
								dw_bill_line.setitem(ll_row , 'unit_code', ls_to_uom_code )		
								dw_bill_line.setitem(ll_row , 'sales_person',g_user.object_id )	
								dw_bill_line.setitem(ll_row , 'loc',is_location )	
								dw_bill_line.setitem(ll_row , 'line_no', ll_row)
								dw_bill_line.setitem(ll_row , 'note', ids_buy_get_the_same.getitemstring(ll_found, 'name'))
							end if
						end if
					end if								
				end if																
			else //-- sku nhiều đơn vị hoặc chưa có giá --//
				dw_scan_barcode.setfocus( )
				if idwc_unit.rowcount( ) > 0 then
					idwc_unit.scrolltorow(idwc_unit.rowcount( ))		
				end if
				setnull(ldc_price)
				dw_scan_barcode.setitem( 1, 'price', ldc_price )
				dw_scan_barcode.setcolumn( "unit")
				dw_scan_barcode.keybd_event( 115,0,0,0 )		
				idb_uom_id = 0
//				ib_item_chosen = true				
			end if
			dw_scan_barcode.setitem( 1, 'name', is_short_name)
			dw_scan_barcode.SelectText (1, Len (is_short_name))
			//-- hiện thị liệu trình --//
			dw_dosage.reset()
			ids_dosage.setfilter("item_id ="+string(idb_object_id))
			ids_dosage.filter( )
			ids_dosage.setsort("dosage a, age a")
			ids_dosage.sort()
			if ids_dosage.rowcount() > 0 then
				this.f_resize_dw_dosage(ids_dosage.rowcount()  )
				ids_dosage.rowscopy(1,  ids_dosage.rowcount(), primary!, dw_dosage, 1, primary!)							
			end if						
			if dw_cust_his.rowcount() > 0 then
				ll_row = dw_cust_his.find( " item_id =" +string(idb_object_id),1, dw_cust_his.rowcount() )
				dw_cust_his.scrolltorow( ll_row)
			end if							
		
		elseif upper(ls_objtype) = 'CUSTOMER' then 
			
		end if
	else //-- tìm theo barcode nhà SX --//
		ll_found = idwc.find("barcode= '"+ls_barcode+"'" ,1, idwc.rowcount())
		if ll_found > 0 then
			idb_object_id = idwc.getitemnumber(ll_found, 'object_id')
			il_staff_pct = idwc.getitemnumber(ll_found, 'comm_staff_pct')
			if isnull(il_staff_pct) then il_staff_pct = 0
			il_cust_pct = idwc.getitemnumber(ll_found, 'comm_cust_pct')
			if isnull(il_cust_pct) then il_cust_pct = 0			
			is_obj_name =  idwc.getitemstring(ll_found, 'object_name')
			is_short_name = idwc.getitemstring(ll_found, 'short_name')
			is_print_name = idwc.getitemstring(ll_found, 'print_name')
			is_location = idwc.getitemstring(ll_found, 'location_code')				
			idwc_unit.setfilter( " item_id = " + string(idb_object_id))
			idwc_unit.filter( )
			if idwc_unit.rowcount( ) = 1 and idwc_unit.getitemnumber( 1, 'retail_price') > 0 then // SKU 1 đơn vị và có giá -> insert vào bill--//
				idb_uom_id = idwc_unit.getitemnumber( 1, 'uom_id')
				ldc_price =  idwc_unit.getitemnumber( 1, 'retail_price') 
				ls_findStr = "ITEM_ID = "+string(idb_object_id) + " and TRANS_UOM = "+string(idb_uom_id) + " and PRICE ="+string(ldc_price)
				ll_row = dw_bill_line.find( ls_findStr , 1, dw_bill_line.rowcount( ) )
				
				if ll_row = 0 then
					ll_row = dw_bill_line.event e_addrow( )
					dw_bill_line.scrolltorow( ll_row)
					if isnull(is_print_name) or is_print_name = '' then
						dw_bill_line.setitem(ll_row , 'line_text', is_obj_name)
					else
						dw_bill_line.setitem(ll_row , 'line_text', is_print_name)
					end if
					dw_bill_line.setitem(ll_row , 'qty', 1)
					dw_bill_line.setitem(ll_row , 'price',  ldc_price)
					dw_bill_line.setitem(ll_row , 'amount', ldc_price* 1)
					dw_bill_line.setitem(ll_row , 'ITEM_ID', idb_object_id)
					dw_bill_line.setitem(ll_row , 'TRANS_UOM', idb_uom_id)
					dw_bill_line.setitem(ll_row , 'unit_code', idwc_unit.getitemstring( 1, 'uom_code') )		
					dw_bill_line.setitem(ll_row , 'sales_person',g_user.object_id )	
					dw_bill_line.setitem(ll_row , 'loc',is_location )	
					dw_bill_line.setitem(ll_row , 'line_no', ll_row)	
					dw_bill_line.setitem(ll_row , 'cust_point', round(ldc_price* 1 * il_cust_pct/100,0) )	
					dw_bill_line.setitem(ll_row , 'staff_point', round(ldc_price* 1 * il_staff_pct/100,0) )	
					dw_bill_line.setitem(ll_row , 'cust_pct',  il_cust_pct )	
					dw_bill_line.setitem(ll_row , 'staff_pct',  il_staff_pct )				
					//-- add promote item --//
					ll_found = ids_buy_get_the_same.find("object_id = "+string(idb_object_id) + " AND buy_qty >=" + string(1), 1, ids_buy_get_the_same.rowcount( ))
					if ll_found > 0 then
						ldc_promote_qty = dw_bill_line.getitemnumber( ll_row, 'promote_qty')
						if isnull(ldc_promote_qty) then ldc_promote_qty = 0
						ldc_buy_qty = ids_buy_get_the_same.getitemnumber(ll_found , 'buy_qty')
						if isnull(ldc_buy_qty) then ldc_buy_qty = 0
						ldc_get_qty = ids_buy_get_the_same.getitemnumber(ll_found , 'get_qty')
						if isnull(ldc_get_qty) then ldc_get_qty = 0
						if ldc_buy_qty > 0 then					
							ldc_add_qty = round(ldc_qty*ldc_to_coefficient / ldc_buy_qty,0) * ldc_get_qty - ldc_promote_qty
							if ldc_add_qty > 0 then
								if ldc_promote_qty = 0 then
									ll_row = dw_bill_line.event e_addrow( )
								else
									ll_row = dw_bill_line.find( "ITEM_ID= "+string(idb_object_id)+" AND price = 0 ", 1, dw_bill_line.rowcount())
								end if
								dw_bill_line.setitem(ll_row , 'qty', ldc_promote_qty+ldc_add_qty)
								dw_bill_line.setitem(ll_row , 'price',  0)
								dw_bill_line.setitem(ll_row , 'amount', 0)
								dw_bill_line.setitem(ll_row , 'ITEM_ID', idb_object_id)
								dw_bill_line.setitem(ll_row , 'TRANS_UOM', ldb_to_unit_id)
								dw_bill_line.setitem(ll_row , 'unit_code', ls_to_uom_code )		
								dw_bill_line.setitem(ll_row , 'sales_person',g_user.object_id )	
								dw_bill_line.setitem(ll_row , 'loc',is_location )	
								dw_bill_line.setitem(ll_row , 'line_no', ll_row)
								dw_bill_line.setitem(ll_row , 'note', ids_buy_get_the_same.getitemstring(ll_found, 'name'))
							end if
						end if
					end if								
				else		
					ldc_qty = dw_bill_line.getitemnumber( ll_row, 'qty') + 1
					dw_bill_line.setitem(ll_row , 'qty',  ldc_qty)
					dw_bill_line.setitem(ll_row , 'amount', ldc_price* ldc_qty)		
					dw_bill_line.setitem(ll_row , 'cust_point', round(ldc_price* ldc_qty * il_cust_pct/100,0) )	
					dw_bill_line.setitem(ll_row , 'staff_point', round(ldc_price* ldc_qty * il_staff_pct/100,0) )		
					dw_bill_line.setitem(ll_row , 'cust_pct',  il_cust_pct )	
					dw_bill_line.setitem(ll_row , 'staff_pct',  il_staff_pct )
					//-- add promote item --//
					ll_found = ids_buy_get_the_same.find("object_id = "+string(idb_object_id) + " AND buy_qty >=" + string(1), 1, ids_buy_get_the_same.rowcount( ))
					if ll_found > 0 then
						ldc_promote_qty = dw_bill_line.getitemnumber( ll_row, 'promote_qty')
						if isnull(ldc_promote_qty) then ldc_promote_qty = 0
						ldc_buy_qty = ids_buy_get_the_same.getitemnumber(ll_found , 'buy_qty')
						if isnull(ldc_buy_qty) then ldc_buy_qty = 0
						ldc_get_qty = ids_buy_get_the_same.getitemnumber(ll_found , 'get_qty')
						if isnull(ldc_get_qty) then ldc_get_qty = 0
						if ldc_buy_qty > 0 then					
							ldc_add_qty = round(ldc_qty*ldc_to_coefficient / ldc_buy_qty,0) * ldc_get_qty - ldc_promote_qty
							if ldc_add_qty > 0 then
								if ldc_promote_qty = 0 then
									ll_row = dw_bill_line.event e_addrow( )
								else
									ll_row = dw_bill_line.find( "ITEM_ID= "+string(idb_object_id)+" AND price = 0 ", 1, dw_bill_line.rowcount())
								end if
								dw_bill_line.setitem(ll_row , 'qty', ldc_promote_qty+ldc_add_qty)
								dw_bill_line.setitem(ll_row , 'price',  0)
								dw_bill_line.setitem(ll_row , 'amount', 0)
								dw_bill_line.setitem(ll_row , 'ITEM_ID', idb_object_id)
								dw_bill_line.setitem(ll_row , 'TRANS_UOM', ldb_to_unit_id)
								dw_bill_line.setitem(ll_row , 'unit_code', ls_to_uom_code )		
								dw_bill_line.setitem(ll_row , 'sales_person',g_user.object_id )	
								dw_bill_line.setitem(ll_row , 'loc',is_location )	
								dw_bill_line.setitem(ll_row , 'line_no', ll_row)
								dw_bill_line.setitem(ll_row , 'note', ids_buy_get_the_same.getitemstring(ll_found, 'name'))
							end if
						end if
					end if								
				end if																
			else //-- sku nhiều đơn vị hoặc chưa có giá --//
				dw_scan_barcode.setfocus( )
				if idwc_unit.rowcount( ) > 0 then
					idwc_unit.scrolltorow(idwc_unit.rowcount( ))		
				end if
				setnull(ldc_price)
				dw_scan_barcode.setitem( 1, 'price', ldc_price )
				dw_scan_barcode.setcolumn( "unit")
				dw_scan_barcode.keybd_event( 115,0,0,0 )		
				idb_uom_id = 0
//				ib_item_chosen = true				
			end if
			dw_scan_barcode.setitem( 1, 'name', is_short_name)
			dw_scan_barcode.SelectText (1, Len (is_short_name))
			//-- hiện thị liệu trình --//
			dw_dosage.reset()
			ids_dosage.setfilter("item_id ="+string(idb_object_id))
			ids_dosage.filter( )
			ids_dosage.setsort("dosage a, age a")
			ids_dosage.sort()
			if ids_dosage.rowcount() > 0 then
				this.f_resize_dw_dosage(ids_dosage.rowcount()  )
				ids_dosage.rowscopy(1,  ids_dosage.rowcount(), primary!, dw_dosage, 1, primary!)							
			end if						
			if dw_cust_his.rowcount() > 0 then
				ll_row = dw_cust_his.find( " item_id =" +string(idb_object_id),1, dw_cust_his.rowcount() )
				dw_cust_his.scrolltorow( ll_row)
			end if							
		else
			//-- load bill nếu có --//
			this.f_load_bill(ls_barcode)
		end if
	end if
end if
end event

event closequery;destroy ids_dosage
destroy ids_bill_line
destroy ids_bill_print
destroy ids_bill2_print
destroy ids_dosage_bill
destroy ids_cust_his
destroy ids_return_line
destroy ids_return_doc
destroy ids_buy_get_the_same

end event

type ole_1 from olecustomcontrol within c_w_pos
event oncomm ( )
boolean visible = false
integer x = 2665
integer y = 1568
integer width = 174
integer height = 152
integer taborder = 90
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
string binarykey = "c_w_pos.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
end type

type dw_cust_his from t_dw_pos within c_w_pos
integer x = 2094
integer y = 568
integer taborder = 60
string title = "Chường trình khuyễn mãi"
string dataobject = "d_cust_his_grid"
boolean hscrollbar = true
boolean vscrollbar = true
end type

type st_promotion from statictext within c_w_pos
integer x = 1632
integer y = 312
integer width = 997
integer height = 112
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Chương trình khuyễn mãi"
boolean focusrectangle = false
end type

type st_dosage from statictext within c_w_pos
integer x = 1335
integer y = 736
integer width = 773
integer height = 112
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Liều dùng/liệu trình"
boolean focusrectangle = false
end type

type dw_promotion from t_dw_pos within c_w_pos
integer x = 1298
integer y = 348
integer taborder = 90
string title = "Chường trình khuyễn mãi"
end type

type dw_dosage from t_dw_pos within c_w_pos
integer x = 1289
integer y = 800
integer taborder = 90
string title = "Liều dùng/Liệu trình"
string dataobject = "d_dosage_form"
end type

type dw_func from t_dw_pos within c_w_pos
integer x = 1138
integer y = 1288
integer taborder = 80
string dataobject = "d_func_form"
end type

event e_vscroll;call super::e_vscroll;return 1
end event

event clicked;//-- override --//

if dwo.name= 'f1' then
	parent.event e_action_briefbill()
elseif  dwo.name= 'f2' then
	parent.event e_action_dosage()
elseif  dwo.name= 'f3' then
	parent.event e_action_other_amount()
elseif  dwo.name= 'f11'then
	parent.event e_action_newbill_shortcut() //-- xóa, tạo bill mới--//
//	parent.event e_action_return()
elseif  dwo.name= 'f5' then
	parent.event e_action_refresh()
elseif  dwo.name= 'f6' then
	parent.event e_action_newbill()
elseif  dwo.name= 'f7' then
	parent.event e_action_findbill() 
elseif  dwo.name= 'f8' then
	parent.event e_action_deliver()
elseif  dwo.name= 'f9' then
	parent.event e_action_adj_amount()
//elseif  dwo.name= 'f10' then
//	parent.event e_action_findbill() 
elseif  dwo.name= 'f12' then
	parent.event e_action_pay()
elseif  dwo.name= 'b_delete' then
	parent.event e_action_delete()
end if
end event

type dw_online from t_dw_pos within c_w_pos
integer x = 2889
integer y = 1176
integer taborder = 80
end type

type dw_suspend from t_dw_pos within c_w_pos
integer x = 2885
integer y = 260
integer taborder = 40
string dataobject = "d_bill_hdr_grid"
end type

event doubleclicked;call super::doubleclicked;long			ll_row
double		ldb_doc_id, ldb_version_id
if row > 0 then
	ldb_doc_id = dw_suspend.getitemnumber( row, 'id')
	ldb_version_id = dw_suspend.getitemnumber( row, 'version_id')

	if dw_doc.getrow( ) = 1 then
		if dw_bill_line.rowcount( ) > 0 then
			//-- move vào dw suspend --//
			dw_doc.rowsmove( 1, 1, primary!, dw_suspend , dw_suspend.rowcount()+1, primary!)
			dw_bill_line.rowsmove( 1, dw_bill_line.rowcount(), primary!, ids_bill_line, ids_bill_line.rowcount()+1, primary!)
		else
			dw_doc.reset( )
		end if
	end if	
	//-- move back --//
	ids_bill_line.setfilter( "object_ref_id ="+string(ldb_version_id))
	ids_bill_line.filter( )	
	ll_row = dw_suspend.find( " id =" + string(ldb_doc_id), 1, dw_suspend.rowcount())
	if ll_row > 0 then
		dw_suspend.rowsmove( ll_row, ll_row, primary!, dw_doc, 1, primary!)
		ids_bill_line.rowsmove( 1, ids_bill_line.rowcount(), primary!, dw_bill_line, 1, primary!)
	end if
	
	ids_bill_line.setfilter('')
	ids_bill_line.filter( )	
end if
end event

type dw_doc from t_dw_pos within c_w_pos
integer x = 82
integer y = 4
integer height = 396
integer taborder = 80
string dataobject = "d_bill_hdr_form"
end type

event e_postinsertrow;call super::e_postinsertrow;string								ls_autonumber
double							ldb_seq_id
b_obj_instantiate				lbo_ins
b_sequences					lbo_seq
b_flexibledata					lbo_flex

this.setitem( vl_row , 'id', lbo_ins.f_create_id_ex( it_transaction ) )
idb_bs_id = lbo_ins.f_create_id_ex(it_transaction )
this.setitem( vl_row , 'object_ref_table', 'BOOKED_SLIP' )
this.setitem( vl_row , 'version_id', idb_bs_id )
this.setitem( vl_row , 'trans_hdr_id', 25121532 )
this.setitem( vl_row , 'handled_by', gi_userid )
this.setitem( vl_row , 'status', 'new' )
this.setitem( vl_row , 'doc_type', 'RETAIL' )
this.setitem( vl_row , 'user_name', g_user.name  )
this.setitem( vl_row , 'document_date', gd_session_date )
this.setitem( vl_row , 'handled_by', gi_userid )
this.setitem( vl_row , 'company_id', gi_user_comp_id  )
this.setitem( vl_row , 'branch_id', gdb_branch )
this.setitem( vl_row , 'created_by', gi_userid )
this.setitem( vl_row , 'last_mdf_by', gi_userid )

ldb_seq_id = lbo_flex.f_get_id('bill_nbr_THM','sequences', it_transaction )
if ldb_seq_id <> -1 then
	lbo_seq.f_init_ex(ldb_seq_id, it_transaction )
	ls_autonumber = lbo_seq.f_create_autonumber_ex( gd_session_date, it_transaction )
	this.setitem( vl_row , 'code', ls_autonumber )
end if
return vl_row

end event

event itemchanged;call super::itemchanged;double		ldb_null

if dwo.name = 'object_name' then
	if data = '' or isnull(data) then
		setnull(ldb_null)
		this.setitem( row, 'dr_cr_object', ldb_null)
		this.setitem( row, 'object_code', '')
		dw_cust_his.reset()
	end if
end if
end event

type dw_bill_line from t_dw_pos within c_w_pos
integer x = 169
integer y = 396
integer taborder = 50
string dataobject = "d_bill_line_grid"
boolean vscrollbar = true
end type

event e_postinsertrow;call super::e_postinsertrow;b_obj_instantiate			lbo_ins

connect using	it_trans_second;	

this.setitem( vl_row , 'id', lbo_ins.f_create_id_ex( it_trans_second ) )
this.setitem( vl_row , 'object_ref_id', idb_bs_id)
this.setitem( vl_row , 'object_ref_table', 'BOOKED_SLIP')
this.setitem( vl_row , 'company_id', gi_user_comp_id )
this.setitem( vl_row , 'branch_id', gdb_branch )

disconnect using it_trans_second;

if vl_row = 1 then	dw_doc.object.amount_chk.visible = false

RETURN vl_row
end event

event clicked;call super::clicked;long			ll_found
if row > 0 then
	idb_object_id = this.getitemnumber( row, 'item_id')
	is_obj_name = this.getitemstring( row, 'line_text')
	dw_scan_barcode.setitem( 1, 'name', is_obj_name)
	//-- hiện thị liệu trình --//	
	dw_dosage.reset()
	ids_dosage.setfilter("item_id ="+string(idb_object_id))
	ids_dosage.filter( )
	ids_dosage.setsort("dosage a, age a")
	ids_dosage.sort()
	if ids_dosage.rowcount() > 0 then		
		parent.f_resize_dw_dosage(ids_dosage.rowcount()  )
		ids_dosage.rowscopy(1,  ids_dosage.rowcount(), primary!, dw_dosage, 1, primary!)							
	end if	

end if
end event

event itemchanged;call super::itemchanged;double 		ldb_qty, ldb_price, ldb_item_id, ldb_trans_uom, ldb_id
long			ll_found, ll_cust_pct, ll_staff_pct
b_obj_instantiate		lbo_ins

if dwo.name = 'price' then
	ll_cust_pct = this.getitemnumber( row, 'cust_pct')
	ll_staff_pct = this.getitemnumber( row, 'staff_pct')
	ldb_qty = this.getitemnumber( row, 'qty')
	ldb_price = double(data)
	this.setitem( row, 'amount', ldb_qty*ldb_price)
	this.setitem( row, 'cust_point', round(ldb_qty*ldb_price*ll_cust_pct/100,0))
	this.setitem( row, 'staff_point',  round(ldb_qty*ldb_price*ll_staff_pct/100,0))
	//-- update item_price --//
	/*
	ldb_item_id = this.getitemnumber(row, 'item_id' ) 
	ldb_trans_uom = this.getitemnumber(row, 'trans_uom' )
	
	connect using	it_trans_second;	
	Update item_price
	set retail_price = :ldb_price
	where item_price.trans_uom = :ldb_trans_uom
						and  item_price.item_id = :ldb_item_id
						and nvl(item_price.stop_yn,'N') = 'N'
						and sysdate between item_price.f_date and nvl(item_price.t_date, sysdate)
						and item_price.ITEM_APPLIED_TYPE = 'spec'
						and item_price.OBJECT_APPLIED_TYPE = 'all'
						and item_price.OBJECT_TYPE = 'CUSTOMER'
						and item_price.PRICE_TYPE = 'SALES'
	using it_trans_second;
	if it_trans_second.sqlnrows = 0 then
		ldb_id = lbo_ins.f_create_id_ex( it_trans_second)
		insert into item_price (id,item_id,company_id, branch_id, created_by, created_date, last_mdf_by, last_mdf_date, retail_price
									,f_date, currency_id, ITEM_APPLIED_TYPE, OBJECT_APPLIED_TYPE, OBJECT_TYPE, PRICE_TYPE, TRANS_UOM)
							values(:ldb_id, :ldb_item_id, :gi_user_comp_id, :gdb_branch, :gi_userid,sysdate, :gi_userid, sysdate, :ldb_price
									,trunc(sysdate) , 23933, 'spec', 'all','CUSTOMER','SALES',:ldb_trans_uom) using it_trans_second;
	end if
	commit using it_trans_second;
	*/
	ll_found = idwc.find("item_id = " + string(ldb_item_id) + " AND stock_uom = "+string(ldb_trans_uom) , 1 , idwc.rowcount())
	if ll_found > 0 then 
		idwc.setitem(ll_found, 'retail_price',ldb_price)
	end if
	ll_found = idwc_unit.find("item_id = " + string(ldb_item_id) + " AND uom_id = "+string(ldb_trans_uom) , 1 , idwc_unit.rowcount())
	if ll_found > 0 then 
		idwc_unit.setitem(ll_found, 'retail_price',ldb_price)
	end if	
//	disconnect using	it_trans_second;	
	
elseif dwo.name = 'qty' then
	ll_cust_pct = this.getitemnumber( row, 'cust_pct')
	ll_staff_pct = this.getitemnumber( row, 'staff_pct')	
	ldb_price = this.getitemnumber( row, 'price')
	ldb_qty = double(data)
	this.setitem( row, 'amount', ldb_price*ldb_qty)
	this.setitem( row, 'cust_point', round(ldb_qty*ldb_price*ll_cust_pct/100,0))
	this.setitem( row, 'staff_point',  round(ldb_qty*ldb_price*ll_staff_pct/100,0))	
end if
end event

event losefocus;call super::losefocus;
this.accepttext( )
end event

event constructor;call super::constructor;
ib_drag = true
end event

event dragdrop;call super::dragdrop;long				ll_row_src, ll_row, ll_line_src, ll_lineNo_tmp, ll_line_dest

t_dw_pos		ldw_source

if row > 0 then
	ldw_source = source
	
	ll_row_src = ldw_source.getrow()
	if ll_row_src > 0 then
		ll_line_src = ldw_source.getitemnumber( ll_row_src , 'line_no')
		ll_line_dest =this.getitemnumber( row , 'line_no')
		ll_lineNo_tmp = ll_line_dest
		this.setitem( row, 'line_no', ll_line_src)
		ldw_source.setitem( ll_row_src, 'line_no', ll_lineNo_tmp)
		
		this.sort( )
	end if
end if
end event

event rowfocuschanged;call super::rowfocuschanged;long			ll_found
	
	if dw_cust_his.rowcount() > 0 then
		ll_found = dw_cust_his.find( " item_id =" +string(idb_object_id),1, dw_cust_his.rowcount() )
		dw_cust_his.scrolltorow( ll_found)
	end if
end event

type dw_scan_barcode from t_dw_pos within c_w_pos
integer x = 1294
integer width = 1413
integer height = 288
integer taborder = 60
string dataobject = "d_barcode_form"
end type

event e_dwdropdown;//-- OVERRIDE--//

this.ib_dropdowning = true
end event

event editchanged;call super::editchanged;int								li_editpos, li_rtn
string							ls_data, ls_autocomplete_string, ls_rtn

if left(data,1) ='/' and  dwo.name <> 'name'  then
	setcolumn( 'name')
	return 1
end if

If dwo.name = 'name' then

//	if this.getchild( dwo.name, ldwc) = -1 then return
	li_editpos = this.position()

	ls_data = data 
	ls_autocomplete_string = this.f_get_autocomplete_string(dwo.name, ls_data, 'dddw', idwc, 'obj_search')
		
	if lower(left(trim(ls_autocomplete_string),len(ls_data))) = lower(ls_data) then
		this.settext( ls_autocomplete_string)		
	else
		this.settext(ls_data)
	end if	
	If len(ls_data) = len(ls_autocomplete_string) THEN
		 This.SelectText (Len (ls_autocomplete_string)+1, 0)
	Else
		This.SelectText (li_editpos, Len (ls_autocomplete_string))
	End If	
	
	if this.ib_dropdowning = false then 
		keybd_event( 115,0,0,0 )
		this.ib_dropdowning = true
	end if
	
end if
end event

event e_dwnkey;//-- OVERRIDE--//

window			lw_parent
this.f_getparentwindow(lw_parent)

if key= keyF11! and keyflags = 1 then
	lw_parent.dynamic event e_action_return()
elseif  key= keyF11! then
	lw_parent.dynamic event e_action_newbill_shortcut() //-- xóa, tạo bill mới--//
elseif key= keyF1! then
	lw_parent.dynamic event e_action_briefbill()
elseif  key= keyF2! then
	lw_parent.dynamic event e_action_dosage()	
elseif  key= keyF3! then
	lw_parent.dynamic event e_action_focus_scan()
	
elseif key= keyF5! and keyflags = 1 then
	lw_parent.dynamic event e_action_newpr()
elseif  key= keyF5! then
	lw_parent.dynamic event e_action_refresh()
elseif  key= keyF6! then	
	lw_parent.dynamic event e_action_newbill()	//-- đưa vào chờ, tạo bill mới --//
elseif  key= keyF7! then
	lw_parent.dynamic event e_action_findbill()		
elseif  key= keyF8! then
	lw_parent.dynamic event e_action_deliver()
elseif  key= keyF9! then
	lw_parent.dynamic event e_action_adj_amount()
elseif key= keyF12!  and keyflags = 1 then
	lw_parent.dynamic event e_action_print_4_chk()
elseif  key= keyF12! then
	lw_parent.dynamic event e_action_pay()
elseif key = KeyUpArrow! and  keyflags = 2  then
	lw_parent.dynamic event e_action_other_amount()	
elseif key= keyEnter! then
	if this.getcolumnname( ) = 'price' then
		this.setcolumn('name')
		return 1
	else		
		Send(Handle(this),256,9,Long(0,0))
		RETURN 1
	end if
elseif  key= keytab! and keyflags = 1 then
elseif key= keytab! then
	if this.getcolumnname( ) = 'price' then
		this.setcolumn('name')
		return 1
	end if
end if
end event

event itemchanged;call super::itemchanged;string						ls_obj_name, ls_obj_type, ls_obj_code, ls_barcode, ls_spec
long						ll_row, ll_row_unit, ll_dwc_row
decimal					ldc_qty, ldc_price
double					ldb_cust_id
//boolean					lb_scan

if dwo.name = 'name' then
//	if this.getchild( 'name', idwc)  = 1 then
		if idwc.getrow( ) > 0 then			

			ll_dwc_row = idwc.getrow( )

			ls_obj_name = idwc.getitemstring(ll_dwc_row, 'object_name')
			ls_obj_type =  idwc.getitemstring(ll_dwc_row, 'object_ref_table')
			ls_obj_code =  idwc.getitemstring(ll_dwc_row, 'object_code')
			ls_barcode =  idwc.getitemstring(ll_dwc_row, 'barcode')
			ls_spec = idwc.getitemstring(ll_dwc_row, 'spec_desc')
			this.setitem( row, 'spec', ls_spec)
			this.setitem( row, 'loc', idwc.getitemstring(idwc.getrow( ), 'location_code'))
			//-- Nếu là hàng hóa --//
			if lower(ls_obj_type) = 'item' then
				ib_cust_chosen = false
				ls_obj_name = idwc.getitemstring(ll_dwc_row, 'short_name')
				if ls_obj_name = data  or ls_barcode = data then			
					idb_object_id = idwc.getitemnumber(idwc.getrow( ), 'object_id')
					il_staff_pct = idwc.getitemnumber(idwc.getrow( ), 'comm_staff_pct')
					if isnull(il_staff_pct) then il_staff_pct = 0
					il_cust_pct = idwc.getitemnumber(idwc.getrow( ), 'comm_cust_pct')
					if isnull(il_cust_pct) then il_cust_pct = 0
					if ls_barcode = data  then												
						is_barcode = ls_barcode
						this.setitem( row, 'name', ls_obj_name)
						this.settext( ls_obj_name)
						
						is_obj_name = ls_obj_name
						is_short_name = idwc.getitemstring(idwc.getrow( ), 'short_name')
						is_print_name = idwc.getitemstring(idwc.getrow( ), 'print_name')
						is_location = idwc.getitemstring(idwc.getrow( ), 'location_code')
						idb_uom_id = 0
						ib_item_chosen = true
						
						//-- hiện thị liệu trình --//
						dw_dosage.reset()
						ids_dosage.setfilter("item_id ="+string(idb_object_id))
						ids_dosage.filter( )
						ids_dosage.setsort("dosage a, age a")
						ids_dosage.sort()
						if ids_dosage.rowcount() > 0 then
							parent.f_resize_dw_dosage(ids_dosage.rowcount()  )
							ids_dosage.rowscopy(1,  ids_dosage.rowcount(), primary!, dw_dosage, 1, primary!)							
						end if						
						if dw_cust_his.rowcount() > 0 then
							ll_row = dw_cust_his.find( " item_id =" +string(idb_object_id),1, dw_cust_his.rowcount() )
							dw_cust_his.scrolltorow( ll_row)
						end if						
						return 2					
					end if
											
					is_obj_name = ls_obj_name
					is_short_name = idwc.getitemstring(idwc.getrow( ), 'short_name')
					is_print_name = idwc.getitemstring(idwc.getrow( ), 'print_name')
					is_location = idwc.getitemstring(idwc.getrow( ), 'location_code')
					idb_uom_id = 0
					ib_item_chosen = true
					
					//-- hiện thị liệu trình --//
					dw_dosage.reset()
					ids_dosage.setfilter("item_id ="+string(idb_object_id))
					ids_dosage.filter( )
					ids_dosage.setsort("dosage a, age a")
					ids_dosage.sort()
					if ids_dosage.rowcount() > 0 then
						parent.f_resize_dw_dosage(ids_dosage.rowcount()  )
						ids_dosage.rowscopy(1,  ids_dosage.rowcount(), primary!, dw_dosage, 1, primary!)							
					end if
					if dw_cust_his.rowcount() > 0 then
						ll_row = dw_cust_his.find( " item_id =" +string(idb_object_id),1, dw_cust_his.rowcount() )
						dw_cust_his.scrolltorow( ll_row)
					end if							
				else //-- ko tìm thấy item--//
					idb_object_id = 0
					il_staff_pct = 0
					il_cust_pct = 0
					is_obj_name = ''
					is_location = ''
					is_short_name = ''
					is_print_name = ''			
					idb_uom_id = 0
				
//					this.ib_dropdowning = false
					this.settext( '')
					this.setitem( row, 'spec', '')
					this.setitem( row, 'loc', '')
					idwc.setfilter( '')		
					idwc.filter( )							
					parent.f_load_bill( data) // load bill nếu có --//
//					gf_messagebox('m.dw_scan_barcode.01','Thông báo','Tên hàng hóa chưa đúng:@'+data,'exclamation','ok',1)
					return 2 //-- gõ tên hàng chưa đúng --//
				end if						
			//-- Nếu là khách hàng --//
			elseif lower(ls_obj_type) = 'customer' then
				is_cust_code =  idwc.getitemstring(idwc.getrow( ), 'object_code')
				idb_cust_id= idwc.getitemnumber(idwc.getrow( ), 'object_id')
				is_cust_name =  idwc.getitemstring(idwc.getrow( ), 'object_name')
				if is_cust_code = data or is_cust_name = data then	
					ib_cust_chosen = true
					idb_cust_point = idwc.getitemnumber(idwc.getrow( ), 'bal_value')
//					dw_doc.setitem( 1, 'dr_cr_object', ldb_cust_id)
//					dw_doc.setitem( 1, 'object_code', ls_obj_code)
//					dw_doc.setitem( 1, 'object_name', ls_obj_name)
//					dw_doc.setitem( 1, 'cust_point', idwc.getitemnumber(idwc.getrow( ), 'bal_value'))
//					this.settext( '')
//					this.setitem( row, 'spec', '')
//					this.setitem( row, 'loc', '')
//					idwc.setfilter( '')
//					idwc.filter( )					
					//-- hiện thị lược sử mua hàng --//
//					if dw_cust_his.rowcount( ) > 0 then dw_cust_his.reset( )
//					ids_cust_his.setfilter( "dr_cr_object = " + string(ldb_cust_id))
//					ids_cust_his.filter( )
//					if ids_cust_his.rowcount() > 0 then						
//						ids_cust_his.rowscopy( 1, ids_cust_his.rowcount(), primary!, dw_cust_his, 1, primary!)
//					end if
					return 2
				else //-- ko tìm thấy cust--//
					idwc.setfilter( '')	
					idwc.filter( )						
					this.settext( '')		
					this.setitem( row, 'spec', '')
					this.setitem( row, 'loc', '')
					parent.f_load_bill( data) // load bill nếu có --//
//					gf_messagebox('m.dw_scan_barcode.01','Thông báo','số điện thoại chưa đúng:@'+data,'exclamation','ok',1)			
//					if lb_scan then keybd_event( 115,0,0,0 )
					return 2
				end if		
			end if				
		else //-- dwc = 0 //
			idb_object_id = 0
			il_staff_pct = 0
			il_cust_pct = 0			
			is_obj_name = ''
			is_location = ''
			is_short_name = ''
			is_print_name = ''					
			idb_uom_id = 0
//			this.ib_dropdowning = false
			idwc.setfilter( '')
			idwc.filter( )						
			parent.f_load_bill( data) // load bill nếu có --//
//			gf_messagebox('m.dw_scan_barcode.01','Thông báo','Tên hàng hóa chứa đúng:@'+data,'exclamation','ok',1)
//			if lb_scan then keybd_event( 115,0,0,0 )
			return 2 //-- gõ tên hàng chưa đúng --//
		end if
//	end if
elseif dwo.name = 'unit' then	
	if this.getitemstring(row, 'name') = is_obj_name then
//		ldc_qty = this.getitemnumber( row, 'qty')
//		if isnull(ldc_qty) then ldc_qty = 0		
//		if this.getchild( 'unit', idwc_unit)  = 1 then
			if idwc_unit.getrow( ) > 0 then
				idb_uom_id = idwc_unit.getitemnumber( idwc_unit.getrow( ), 'uom_id')
				ldc_price = idwc_unit.getitemnumber( idwc_unit.getrow( ), 'retail_price')	
				this.setitem( 1, 'price', ldc_price)
				idb_to_uom_id = idwc_unit.getitemnumber(  idwc_unit.getrow( ), 'to_unit_id')
				is_to_unit_code = idwc_unit.getitemstring(  idwc_unit.getrow( ), 'to_unit_code')
				idc_to_coefficient =  idwc_unit.getitemnumber(  idwc_unit.getrow( ), 'to_coefficient')				
			end if
//		end if
	end if
elseif dwo.name = 'price' then	
	if isnull(data) or data = '0' then
		ib_complete = false
	end if
end if
end event

event itemerror;call super::itemerror;//if dwo.name = 'name' then
	return 1
//end if
end event

event itemfocuschanged;call super::itemfocuschanged;long								ll_row_unit, ll_row,ll_found 
decimal							ldc_price, ldc_qty, ldc_promote_qty, ldc_add_qty, ldc_buy_qty, ldc_get_qty
string								ls_findStr

this.ib_dropdowning = false

if dwo.name = 'unit' then
	if ib_cust_chosen  or ib_item_chosen then
		if ib_cust_chosen then
			ib_cust_chosen = false
			dw_doc.setitem( 1, 'dr_cr_object', idb_cust_id)
			dw_doc.setitem( 1, 'object_code', is_cust_code)
			dw_doc.setitem( 1, 'object_name', is_cust_name)
			dw_doc.setitem( 1, 'cust_point', idb_cust_point)
			if dw_cust_his.rowcount( ) > 0 then dw_cust_his.reset( )
			ids_cust_his.setfilter( "dr_cr_object = " + string(idb_cust_id))
			ids_cust_his.filter( )
			if ids_cust_his.rowcount() > 0 then						
				ids_cust_his.rowscopy( 1, ids_cust_his.rowcount(), primary!, dw_cust_his, 1, primary!)
			end if			
			
			this.setcolumn('name')
			this.settext( '')
			this.setitem( row, 'spec', '')
			this.setitem( row, 'loc', '')			
	
		end if 
		idb_cust_id = 0
		idb_cust_point = 0
		is_cust_code= ''
		is_cust_name =''				
		idwc.setfilter( '')
		idwc.filter( )
	end if
	//-- kiểm tra đơn vị: nếu chỉ có 1 đơn vị insert bill, nếu > 1 xổ list unit --//
	ldc_qty = this.getitemnumber( row, 'qty')
	if isnull(ldc_qty) then ldc_qty = 0
	
//	if this.getchild( 'unit', idwc_unit)  = 1 then
		idwc_unit.setfilter( " item_id = " + string(idb_object_id))
		idwc_unit.filter( )
		if idwc_unit.rowcount( ) = 1 then 
			this.setitem( row,'unit', idwc_unit.getitemstring( 1, 'uom_code') )
			this.setitem( row, 'price', idwc_unit.getitemnumber( 1, 'retail_price') )
			idb_uom_id = idwc_unit.getitemnumber( 1, 'uom_id')
			idb_to_uom_id = idwc_unit.getitemnumber( 1, 'to_unit_id')
			is_to_unit_code = idwc_unit.getitemstring( 1, 'to_unit_code')
			idc_to_coefficient =  idwc_unit.getitemnumber( 1, 'to_coefficient')
			
			return 0
		elseif idwc_unit.rowcount( ) > 1 then 
			ll_row_unit = idwc_unit.find( "dft_price_yn = 'Y' ", 1, idwc_unit.rowcount( ))
			if ll_row_unit > 0  then
				idwc_unit.scrolltorow(ll_row_unit)
				this.setitem( row,'unit', idwc_unit.getitemstring( ll_row_unit, 'uom_code') )
				this.setitem( row, 'price', idwc_unit.getitemnumber( ll_row_unit, 'retail_price') )
				idb_uom_id = idwc_unit.getitemnumber(ll_row_unit, 'uom_id')			
				return 0
			else 
				idwc_unit.scrolltorow(idwc_unit.rowcount( ))
			end if
			setnull(ldc_price)
			this.setitem( row, 'price', ldc_price )
			if idwc_unit.rowcount( ) > 1 then
				this.keybd_event( 115,0,0,0 )
			end if
			return 0			
		end if
//	end if
	ib_cust_chosen = false
	ib_item_chosen = false
elseif  dwo.name = 'name'   then	
	if (this.getitemstring(row, 'name') = is_obj_name or  this.getitemstring(row, 'name') = is_barcode ) and ib_complete and idb_uom_id > 0 then
		ldc_qty =  this.getitemnumber( row, 'qty')
		ldc_price = this.getitemnumber( row, 'price')
		if isnull(ldc_price) or ldc_price = 0 then
			ib_price_chk = true
			gf_messagebox('m.dw_scan_barcode.itemfocuschanged.01','Thông báo','Chưa nhập đơn giá','exclamation','ok',1)
			this.setcolumn( 'price')
			ib_complete = false
			return 
		end if
		ls_findStr = "ITEM_ID = "+string(idb_object_id) + " and TRANS_UOM = "+string(idb_uom_id) + " and PRICE ="+string(ldc_price)
		ll_row = dw_bill_line.find( ls_findStr , 1, dw_bill_line.rowcount( ) )
		if ll_row = 0 then
			ll_row = dw_bill_line.event e_addrow( )
			dw_bill_line.scrolltorow( ll_row)
			if isnull(is_print_name) or is_print_name = '' then
				dw_bill_line.setitem(ll_row , 'line_text', is_obj_name)
			else
				dw_bill_line.setitem(ll_row , 'line_text', is_print_name)
			end if
			dw_bill_line.setitem(ll_row , 'qty', ldc_qty)
			dw_bill_line.setitem(ll_row , 'price',  ldc_price)
			dw_bill_line.setitem(ll_row , 'amount', ldc_price* ldc_qty)
			dw_bill_line.setitem(ll_row , 'ITEM_ID', idb_object_id)
			dw_bill_line.setitem(ll_row , 'TRANS_UOM', idb_uom_id)
			dw_bill_line.setitem(ll_row , 'unit_code', this.getitemstring( 1, 'unit') )		
			dw_bill_line.setitem(ll_row , 'sales_person',g_user.object_id )	
			dw_bill_line.setitem(ll_row , 'loc',is_location )	
			dw_bill_line.setitem(ll_row , 'line_no', ll_row)	
			dw_bill_line.setitem(ll_row , 'cust_point', round(ldc_price* ldc_qty * il_cust_pct/100,0) )	
			dw_bill_line.setitem(ll_row , 'staff_point', round(ldc_price* ldc_qty * il_staff_pct/100,0) )	
			dw_bill_line.setitem(ll_row , 'cust_pct',  il_cust_pct )	
			dw_bill_line.setitem(ll_row , 'staff_pct',  il_staff_pct )			
			//-- add promote item --//
			ll_found = ids_buy_get_the_same.find("object_id = "+string(idb_object_id) + " AND buy_qty <=" + string(ldc_qty*idc_to_coefficient), 1, ids_buy_get_the_same.rowcount( ))
			if ll_found > 0 then
				ldc_promote_qty = dw_bill_line.getitemnumber( ll_row, 'promote_qty')
				if isnull(ldc_promote_qty) then ldc_promote_qty = 0
				ldc_buy_qty = ids_buy_get_the_same.getitemnumber(ll_found , 'buy_qty')
				if isnull(ldc_buy_qty) then ldc_buy_qty = 0
				ldc_get_qty = ids_buy_get_the_same.getitemnumber(ll_found , 'get_qty')
				if isnull(ldc_get_qty) then ldc_get_qty = 0
				if ldc_buy_qty > 0 then					
					ldc_add_qty = round(ldc_qty * idc_to_coefficient/ ldc_buy_qty,0) * ldc_get_qty - ldc_promote_qty
					if ldc_add_qty > 0 then
						if ldc_promote_qty = 0 then
							ll_row = dw_bill_line.event e_addrow( )
						else
							ll_row = dw_bill_line.find( "ITEM_ID= "+string(idb_object_id)+" AND price = 0 ", 1, dw_bill_line.rowcount())
						end if
						dw_bill_line.setitem(ll_row , 'qty', ldc_promote_qty+ldc_add_qty)
						dw_bill_line.setitem(ll_row , 'price',  0)
						dw_bill_line.setitem(ll_row , 'amount', 0)
						dw_bill_line.setitem(ll_row , 'ITEM_ID', idb_object_id)
						dw_bill_line.setitem(ll_row , 'TRANS_UOM', idb_to_uom_id)
						dw_bill_line.setitem(ll_row , 'unit_code', is_to_unit_code )		
						dw_bill_line.setitem(ll_row , 'sales_person',g_user.object_id )	
						dw_bill_line.setitem(ll_row , 'loc',is_location )	
						dw_bill_line.setitem(ll_row , 'line_no', ll_row)
						dw_bill_line.setitem(ll_row , 'note', ids_buy_get_the_same.getitemstring(ll_found, 'name'))
					end if
				end if
			end if
		else		
			ldc_qty += dw_bill_line.getitemnumber( ll_row, 'qty')
			dw_bill_line.setitem(ll_row , 'qty', ldc_qty)
			dw_bill_line.setitem(ll_row , 'amount', ldc_price* ldc_qty)		
			dw_bill_line.setitem(ll_row , 'cust_point', round(ldc_price* ldc_qty * il_cust_pct/100,0) )	
			dw_bill_line.setitem(ll_row , 'staff_point', round(ldc_price* ldc_qty * il_staff_pct/100,0) )		
			dw_bill_line.setitem(ll_row , 'cust_pct',  il_cust_pct )	
			dw_bill_line.setitem(ll_row , 'staff_pct',  il_staff_pct )			
			//-- add promote item --//
			ll_found = ids_buy_get_the_same.find("object_id = "+string(idb_object_id) + " AND buy_qty <=" + string(ldc_qty*idc_to_coefficient), 1, ids_buy_get_the_same.rowcount( ))
			if ll_found > 0 then
				ldc_promote_qty = dw_bill_line.getitemnumber( ll_row, 'promote_qty')
				if isnull(ldc_promote_qty) then ldc_promote_qty = 0
				ldc_buy_qty = ids_buy_get_the_same.getitemnumber(ll_found , 'buy_qty')
				if isnull(ldc_buy_qty) then ldc_buy_qty = 0
				ldc_get_qty = ids_buy_get_the_same.getitemnumber(ll_found , 'get_qty')
				if isnull(ldc_get_qty) then ldc_get_qty = 0
				if ldc_buy_qty > 0 then					
					ldc_add_qty = round(ldc_qty*idc_to_coefficient / ldc_buy_qty,0) * ldc_get_qty - ldc_promote_qty
					if ldc_add_qty > 0 then
						if ldc_promote_qty = 0 then
							ll_row = dw_bill_line.event e_addrow( )
						else
							ll_row = dw_bill_line.find( "ITEM_ID= "+string(idb_object_id)+" AND price = 0 ", 1, dw_bill_line.rowcount())
						end if
						dw_bill_line.setitem(ll_row , 'qty', ldc_promote_qty+ldc_add_qty)
						dw_bill_line.setitem(ll_row , 'price',  0)
						dw_bill_line.setitem(ll_row , 'amount', 0)
						dw_bill_line.setitem(ll_row , 'ITEM_ID', idb_object_id)
						dw_bill_line.setitem(ll_row , 'TRANS_UOM', idb_to_uom_id)
						dw_bill_line.setitem(ll_row , 'unit_code', is_to_unit_code)		
						dw_bill_line.setitem(ll_row , 'sales_person',g_user.object_id )	
						dw_bill_line.setitem(ll_row , 'loc',is_location )	
						dw_bill_line.setitem(ll_row , 'line_no', ll_row)
						dw_bill_line.setitem(ll_row , 'note', ids_buy_get_the_same.getitemstring(ll_found, 'name'))
					end if
				end if
			end if			
		end if		
		/*
		idb_object_id = 0
		idb_uom_id = 0
		is_obj_name = ''
		is_location = ''
		is_short_name = ''
		is_print_name = ''							
		this.settext( '')
		this.setitem( 1, 'spec', '')
		this.setitem( 1, 'loc', '')
		this.setitem( 1, 'name', '')
		this.setitem( 1, 'unit', '')
		setnull(ldc_price)
		this.setitem( 1, 'price', ldc_price)	
		this.setitem( 1, 'qty', 1)	
		*/
	end if
	ib_complete = false
	keybd_event( 115,0,0,0 )
elseif  dwo.name = 'price'   then
	if idb_object_id > 0 and idb_uom_id > 0 then 
		ib_complete = true	
	end if
elseif dwo.name = 'qty'   then
	if idb_object_id > 0 then
//		if this.getchild( 'unit', idwc_unit)  = 1 then
			if  idwc_unit.getrow() > 0 then
				this.setitem( row,'unit', idwc_unit.getitemstring( idwc_unit.getrow(), 'uom_code') )
				this.setitem( row, 'price', idwc_unit.getitemnumber(idwc_unit.getrow(), 'retail_price') )
				idb_uom_id = idwc_unit.getitemnumber( idwc_unit.getrow(), 'uom_id')	
			end if
//		end if
	end if
end if
end event

event losefocus;call super::losefocus;
this.ib_dropdowning = false
dw_doc.accepttext( )
dw_bill_line.accepttext( )
if not ib_price_chk then
	this.setitem( 1, 'name', '')
	this.setitem( 1, 'spec', '')
	this.setitem( 1, 'loc', '')
	this.setitem( 1, 'unit', '')
	this.setitem( 1, 'qty', 1)
	this.setitem( 1, 'price', 0)
	this.setitem( 1, 'stock', 0)
	
//	if this.getchild( 'name', ldwc)  = 1 then
		idwc.setfilter( '')
		idwc.filter( )
		idwc_unit.setfilter( '')
		idwc_unit.filter( )		
//	end if
end if
ib_price_chk = false
end event

type gb_2 from groupbox within c_w_pos
integer x = 247
integer y = 1220
integer width = 23
integer height = 588
integer taborder = 70
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16776960
end type

type gb_1 from groupbox within c_w_pos
integer x = 690
integer y = 1156
integer width = 23
integer height = 576
integer taborder = 90
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16776960
end type

type st_suspend from statictext within c_w_pos
integer x = 2889
integer y = 132
integer width = 645
integer height = 100
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Bill chờ tính tiền"
boolean focusrectangle = false
end type

type st_online from statictext within c_w_pos
integer x = 2880
integer y = 852
integer width = 654
integer height = 112
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Đơn hàng online"
boolean focusrectangle = false
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
01c_w_pos.bin 
2B00000600e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe00000006000000000000000000000001000000010000000000001000fffffffe00000000fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000fffffffe00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11c_w_pos.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
