$PBExportHeader$c_tp_purchase_1.sru
forward
global type c_tp_purchase_1 from t_tp
end type
type dw_2 from t_dw_pos within c_tp_purchase_1
end type
type dw_1 from t_dw_pos within c_tp_purchase_1
end type
end forward

global type c_tp_purchase_1 from t_tp
boolean hscrollbar = false
boolean vscrollbar = false
dw_2 dw_2
dw_1 dw_1
end type
global c_tp_purchase_1 c_tp_purchase_1

on c_tp_purchase_1.create
int iCurrent
call super::create
this.dw_2=create dw_2
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_2
this.Control[iCurrent+2]=this.dw_1
end on

on c_tp_purchase_1.destroy
call super::destroy
destroy(this.dw_2)
destroy(this.dw_1)
end on

type dw_2 from t_dw_pos within c_tp_purchase_1
integer x = 32
integer y = 476
integer taborder = 20
string dataobject = "d_pur_retail_line_grid"
boolean hscrollbar = true
boolean ib_drag = true
end type

event e_dwnkey;//-- Override --//

long				ll_row
window			lw_parent

if key = KeyF5! then
	 this.f_getparentwindow(lw_parent )
	 lw_parent.dynamic f_refresh()
elseif key = KeyDelete! then
	ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	Do while ll_row > 0 
		this.deleterow(ll_row)
		ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	LOOP
end if
end event

event itemchanged;call super::itemchanged;dec						ldc_qty, ldc_price, ldc_vat
string						ls_upd_colname

b_obj_instantiate		lb_obj
s_str_data				lstr_currency

if dwo.name = 'qty' then
	ldc_qty = dec(data)
	ldc_price = this.getitemnumber( row, 'price')
	ldc_vat = this.getitemnumber( row, 'vat')
	this.setitem( row, 'amount', ldc_qty*ldc_price)
	this.setitem( row, 'base_amount',  ldc_qty*ldc_price)
	this.setitem( row, 'base_amount_ex_tax',  ldc_qty*ldc_price)
	this.setitem( row, 'vat_amount',  round(ldc_qty*ldc_price*ldc_vat/100, 0))
	
//		//-- cập nhật các cột liện quan --//
//		ls_upd_colname = 'amount;base_amount;base_amountex_tax;vat_amount;'
//		ldw_handle = rpo_dw
//		if lb_obj.f_update_line_itemchanged_ex( dwo.name, data , ls_upd_colname,row , this, it_transaction , lstr_currency) = -1 then return 1			
	
elseif dwo.name = 'price' then
	ldc_qty = this.getitemnumber( row, 'qty')
	ldc_price = dec(data)
	ldc_vat = this.getitemnumber( row, 'vat')
	this.setitem( row, 'amount', ldc_qty*ldc_price)
	this.setitem( row, 'base_amount',  ldc_qty*ldc_price)
	this.setitem( row, 'base_amount_ex_tax',  ldc_qty*ldc_price)
	this.setitem( row, 'vat_amount',  round(ldc_qty*ldc_price*ldc_vat/100, 0))	
elseif dwo.name = 'vat' then
	ldc_qty = this.getitemnumber( row, 'qty')
	ldc_price = this.getitemnumber( row, 'price')
	ldc_vat = dec(data)
	this.setitem( row, 'amount', ldc_qty*ldc_price)
	this.setitem( row, 'base_amount',  ldc_qty*ldc_price)
	this.setitem( row, 'base_amount_ex_tax',  ldc_qty*ldc_price)
	this.setitem( row, 'vat_amount',  round(ldc_qty*ldc_price*ldc_vat/100, 0))		
end if
end event

type dw_1 from t_dw_pos within c_tp_purchase_1
integer x = 32
integer y = 60
integer taborder = 10
string dataobject = "d_pur_retail_hdr_form"
end type

event e_dwnkey;//-- Override --//

long				ll_row
window			lw_parent

if key = KeyF5! then
	 this.f_getparentwindow(lw_parent )
	 lw_parent.dynamic f_refresh()
elseif key = KeyDelete! then
	ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	Do while ll_row > 0 
		this.deleterow(ll_row)
		ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	LOOP
end if
end event

event e_postinsertrow;call super::e_postinsertrow;double					ldb_seq_id
string						ls_autonumber
window					lw_parent
t_transaction			lt_transaction
b_obj_instantiate		lbo_ins
b_sequences					lbo_seq
b_flexibledata					lbo_flex

this.f_getparentwindow( lw_parent)
lt_transaction = lw_parent.dynamic f_get_transaction()

//-- tạo ID của record --//
this.setitem( vl_row, 'ID', lbo_ins.f_create_id_ex(lt_transaction ))	
this.setitem( vl_row, 'version_id', lbo_ins.f_create_id_ex(lt_transaction ))	

//-- set auto number : không phụ thuộc ngày --//
// lpo_handling.idwsetup_initial.f_set_autonumber_ex( this, al_row, lt_transaction)
 
//-- company --//
if this.describe( 'company_id.coltype') = 'number' then
	this.setitem( vl_row, 'company_id',gi_user_comp_id)
end if

//-- branch --//
if this.describe( 'branch_id.coltype') = 'number' then
	this.setitem( vl_row, 'branch_id',gdb_branch)
end if

//-- sob --//
if left(this.describe( 'sob.coltype'),5) = 'char(' then
	this.setitem( vl_row, 'sob',gs_sob)
end if

//-- code --//
ldb_seq_id = lbo_flex.f_get_id('HĐM_THM','sequences', lt_transaction )
if ldb_seq_id <> -1 then
	lbo_seq.f_init_ex(ldb_seq_id, lt_transaction )
	ls_autonumber = lbo_seq.f_create_autonumber_ex( gd_session_date, lt_transaction )
	this.setitem( vl_row , 'code', ls_autonumber )
end if
//-- vendor, status, delivery, trans_date--//
this.setitem( vl_row , 'handled_by', gi_userid )
this.setitem( vl_row , 'created_by', gi_userid )
this.setitem( vl_row , 'created_date', today() )
this.setitem( vl_row , 'last_mdf_by', gi_userid )
this.setitem( vl_row , 'last_mdf_date',  today() )
this.setitem( vl_row , 'doc_type', 'PUR_INVOICE' )
this.setitem( vl_row , 'object_ref_Table', 'BOOKED_SLIP' )

this.setitem( vl_row , 'document_date', date(gd_session_date ))
this.setitem( vl_row , 'status', 'new' )
this.setitem( vl_row , 'status_name', 'Mới' )
this.setitem( vl_row , 'INVOICE_OBJECT', 25555421 ) //-- NCC đại diện lẻ --//
this.setitem( vl_row , 'delivery_mode', 25555418 )
this.setitem( vl_row , 'delivery_mode_code', 'Lấy hàng' )
this.setitem( vl_row , 'trans_hdr_id', 25555436) //-- mua lẻ --//

return vl_row
end event

event updateend;call super::updateend;double 			ldb_doc_id, ldb_extend_id, ldb_billto_id, ldb_delivery_mode, ldb_base_curr_id
string				ls_currCode, ls_currName
date				ld_trans_date
t_transaction		lt_transaction
c_unit_instance		lc_unit_ins
window				lw_parent


this.f_getparentwindow( lw_parent)
lt_transaction = lw_parent.dynamic f_get_transaction()

ldb_doc_id =  this.getitemnumber(this.getrow(), 'id') 
if ldb_doc_id > 0 then
	
	//-- BOOKED_SLIP--//
	ldb_extend_id = this.getitemnumber(this.getrow(), 'extend_id') 
	ldb_billto_id = this.getitemnumber(this.getrow(), 'invoice_object') 
	ldb_delivery_mode =  this.getitemnumber(this.getrow(), 'delivery_mode') 
	lc_unit_ins.f_get_base_cur_ex( ldb_base_curr_id,ls_currCode, ls_currName, lt_transaction )
	ld_trans_date = date(this.getitemdatetime(this.getrow(), 'document_date') )
	if ldb_extend_id = 0 or isnull(ldb_extend_id) then
		//-- insert--//
		ldb_extend_id =  this.getitemnumber(this.getrow(), 'version_id') 
		INSERT into booked_slip (id, object_ref_id, object_ref_Table, company_id, branch_id, created_by, created_Date, last_mdf_by, last_mdf_date, doc_type,version_no,
								  invoice_object, dr_cr_object, delivery_mode, currency_id, exchange_rate, trans_date, quantity_yn, value_yn)
		VALUES (:ldb_extend_id, :ldb_doc_id, 'DOCUMENT',:gi_user_comp_id, :gdb_branch, :gi_userid, sysdate, :gi_userid, sysdate,'PUR_INVOICE', 1,
					:ldb_billto_id,:ldb_billto_id,:ldb_delivery_mode,:ldb_base_curr_id,1 ,:ld_trans_date, 'Y', 'Y')
		using lt_transaction;
	end if

	return 1
end if
end event

