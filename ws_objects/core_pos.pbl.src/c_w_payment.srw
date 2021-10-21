$PBExportHeader$c_w_payment.srw
forward
global type c_w_payment from window
end type
type cb_no_print from t_cb within c_w_payment
end type
type cb_cancel from t_cb within c_w_payment
end type
type cb_ok from t_cb within c_w_payment
end type
type dw_payment from t_dw_pos within c_w_payment
end type
end forward

global type c_w_payment from window
integer width = 3191
integer height = 1096
boolean titlebar = true
string title = "Thanh toán"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_no_print cb_no_print
cb_cancel cb_cancel
cb_ok cb_ok
dw_payment dw_payment
end type
global c_w_payment c_w_payment

type variables
double				idb_new_cust
t_transaction		it_transaction

end variables

on c_w_payment.create
this.cb_no_print=create cb_no_print
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.dw_payment=create dw_payment
this.Control[]={this.cb_no_print,&
this.cb_cancel,&
this.cb_ok,&
this.dw_payment}
end on

on c_w_payment.destroy
destroy(this.cb_no_print)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.dw_payment)
end on

event open;string					ls_rtn, ls_col_string
any					laa_value[]
double				ldb_bill_id
c_str_pos			lc_str_pos
s_str_data			lstr_gift
datawindowchild	ldwc, ldwc_staff
c_dwservice			lc_dwservice
b_obj_instantiate	lbo_ins
t_ds_db				lds_buy_get_bill_m

//-- Tạo connection voi database --//
it_transaction = create t_transaction
it_transaction.dbms =	SQLCA.DBMS
it_transaction.ServerName	 = SQLCA.ServerName
it_transaction.LogId	 = SQLCA.LogId
it_transaction.LogPass 	 = SQLCA.LogPass 
it_transaction.AutoCommit 	 = false 
it_transaction.DBParm	 = SQLCA.DBParm
connect using	it_transaction;	

lc_str_pos = message.powerobjectparm
setnull(message.powerobjectparm)

dw_payment.insertrow( 0)
//dw_payment.setitem( 1, 'staff_name', lc_str_pos.s_data[1] )
dw_payment.setitem( 1, 'code', lc_str_pos.s_data[2] )
idb_new_cust = lc_str_pos.dba_data[1]
dw_payment.setitem( 1, 'cust_point', lc_str_pos.dba_data[2] )
dw_payment.setitem( 1, 'total_amt', lc_str_pos.dba_data[3] )
dw_payment.setitem( 1, 'cash_amt', lc_str_pos.dba_data[3] )
if lc_str_pos.s_promote <> '' then
	dw_payment.setitem( 1, 'campaign',lc_str_pos.s_promote )
	dw_payment.setitem( 1, 'gift', lc_str_pos.s_gift )
	dw_payment.setitem( 1, 'gift_accepted_yn','Y')
end if

this.dw_payment.getchild( 'code', ldwc)
laa_value[1] = gi_user_comp_id
ls_col_string = 'company_id;'
lc_dwservice.f_add_where_dwc(ldwc, ls_col_string, laa_value[])
ldwc.settrans(it_transaction )
ldwc.retrieve( )
ls_rtn = dw_payment.Modify( 'code.dddw.percentwidth= 200')


this.dw_payment.getchild( 'staff_code', ldwc_staff)
//laa_value[1] = gi_user_comp_id
//ls_col_string = 'company_id;'
lc_dwservice.f_add_where_dwc(ldwc_staff, ls_col_string, laa_value[])
ldwc_staff.settrans(it_transaction )
ldwc_staff.retrieve( )
ls_rtn = dw_payment.Modify( 'staff_code.dddw.percentwidth= 200')

//-- add where branch --//
//laa_value[2] = gdb_branch
//ls_col_string += 'branch_id;'

//-- add gift --//

//lds_buy_get_bill_m = create t_ds_db
//lds_buy_get_bill_m.dataobject = 'ds_buy_get_bill_m'
//if lbo_ins.f_get_gift(lds_buy_get_bill_m, lc_str_pos.dba_data[1], ldb_bill_id, lstr_gift, it_transaction) > 0 then
//	
//end if

end event

event key;c_str_pos		lc_str_pos

if key= keyEnter! then
	if cb_ok.ib_focus then
		cb_ok.event clicked( )
		return 1
	elseif cb_cancel.ib_focus then
		cb_cancel.event clicked( )
		return 1
	else
		Send(Handle(this),256,9,Long(0,0))
		RETURN 1
	end if
elseif key= keyF12!  and keyflags = 1 then
	this.cb_no_print.event clicked( )
elseif  key= keyF12! then
	this.cb_ok.event clicked( )	
elseif key = keyEscape! then
	lc_str_pos.s_response = 'cancel'
	closewithreturn(this, lc_str_pos)
end if






end event

event closequery;disconnect using it_transaction;
destroy it_transaction
end event

type cb_no_print from t_cb within c_w_payment
integer x = 997
integer y = 856
integer width = 919
integer taborder = 30
string text = "&OK Không in phiếu (Shift + F12)"
end type

event clicked;call super::clicked;string			ls_code, ls_staff_code, ls_gift_yn
c_str_pos		lc_str_pos
//-- add item to bill--//

dw_payment.accepttext( )
ls_gift_yn = parent.dw_payment.getitemstring(1, 'gift_accepted_yn') 
if isnull(ls_gift_yn) then ls_gift_yn = 'N'

ls_code = parent.dw_payment.getitemstring(1, 'code')
ls_staff_code = parent.dw_payment.getitemstring(1, 'staff_code')
if isnull(ls_code) then ls_code = ''
if isnull(ls_staff_code) or ls_staff_code = '' then
	gf_messagebox('m.c_w_payment.cb_ok.clicked.01','Thông báo','Chưa nhập NV bán hàng','exclamation','ok',1)
	return
end if
//if ls_code <> '' and ls_name = '' then
//	gf_messagebox('m.c_w_payment.cb_ok.cliked.01','Thông báo',' Chưa nhập tên khách' ,'exclamation','ok', 1)	
//	return 0
//end if
//if ls_code = '' and ls_name <> '' then
//	gf_messagebox('m.c_w_payment.cb_ok.cliked.01','Thông báo',' Chưa nhập số điện thoại của khách' ,'exclamation','ok', 1)	
//	return 0	
//end if


lc_str_pos.s_data[1] = ls_code 
lc_str_pos.s_data[2] = ls_staff_code
if idb_new_cust > 0 then
	lc_str_pos.dba_data[1] = idb_new_cust  //-- cust_id--//
end if
lc_str_pos.dba_data[2] = parent.dw_payment.getitemnumber(1, 'cust_point') //-- bonus point --//
//	lc_str_pos.dba_data[3] = 1 //-- pay amount --//
lc_str_pos.dba_data[4] = parent.dw_payment.getitemnumber(1, 'used_point')*1000 //-- used point --//
lc_str_pos.s_response = 'ok_none_print'
lc_str_pos.s_accept_gift = ls_gift_yn

closewithreturn(parent, lc_str_pos)
end event

type cb_cancel from t_cb within c_w_payment
integer x = 1943
integer y = 856
integer taborder = 40
string text = "&Hủy"
end type

event clicked;call super::clicked;c_str_pos		lc_str_pos

lc_str_pos.s_response = 'cancel'

closewithreturn(parent, lc_str_pos)
end event

type cb_ok from t_cb within c_w_payment
integer x = 576
integer y = 856
integer taborder = 20
string text = "&OK(F12)"
end type

event clicked;call super::clicked;string			ls_code, ls_staff_code, ls_gift_yn

c_str_pos		lc_str_pos
//-- add item to bill--//

dw_payment.accepttext( )
ls_gift_yn = parent.dw_payment.getitemstring(1, 'gift_accepted_yn') 
if isnull(ls_gift_yn) then ls_gift_yn = 'N'

ls_code = parent.dw_payment.getitemstring(1, 'code')
ls_staff_code = parent.dw_payment.getitemstring(1, 'staff_code')
if isnull(ls_code) then ls_code = ''
if isnull(ls_staff_code) or ls_staff_code = '' then
	gf_messagebox('m.c_w_payment.cb_ok.clicked.01','Thông báo','Chưa nhập NV bán hàng','exclamation','ok',1)
	return
end if
//if ls_code <> '' then
//	gf_messagebox('m.c_w_payment.cb_ok.cliked.01','Thông báo',' Chưa nhập khách hàng' ,'exclamation','ok', 1)	
//	return 0
//end if
//if ls_code = '' and ls_name <> '' then
//	gf_messagebox('m.c_w_payment.cb_ok.cliked.01','Thông báo',' Chưa nhập số điện thoại của khách' ,'exclamation','ok', 1)	
//	return 0	
//end if


lc_str_pos.s_data[1] = ls_code 
lc_str_pos.s_data[2] = ls_staff_code
if idb_new_cust > 0 then
	lc_str_pos.dba_data[1] = idb_new_cust  //-- cust_id--//
end if
lc_str_pos.dba_data[2] = parent.dw_payment.getitemnumber(1, 'cust_point') //-- bonus point --//
//	lc_str_pos.dba_data[3] = 1 //-- pay amount --//
lc_str_pos.dba_data[4] = parent.dw_payment.getitemnumber(1, 'used_point')*1000 //-- used point --//
lc_str_pos.s_response = 'ok'

lc_str_pos.s_accept_gift = ls_gift_yn

closewithreturn(parent, lc_str_pos)
end event

type dw_payment from t_dw_pos within c_w_payment
integer width = 3177
integer height = 796
integer taborder = 10
string dataobject = "d_payment_pos_form"
end type

event e_dwnkey;//-- Override --//
c_str_pos		lc_str_pos

if key= keyEnter! then
	Send(Handle(this),256,9,Long(0,0))
	RETURN 1
elseif key= keyF12!  and keyflags = 1 then
	parent.cb_no_print.event clicked( )
elseif  key= keyF12! then
	parent.cb_ok.event clicked( )
elseif key = keyEscape! then
	lc_str_pos.s_response = 'cancel'
	closewithreturn(parent, lc_str_pos)
end if







end event

event itemchanged;call super::itemchanged;string							ls_name, ls_code
double						ldb_cust_id, ldb_cust_point, ldb_total_amt, ldb_id
int								li_rtn
long							ll_point
b_obj_instantiate			lbo_ins
c_str_pos					lc_str_pos
datawindowchild 			ldwc

if dwo.name = 'code' then
	//-- kiểm tra cust --//

	li_rtn = lbo_ins.f_get_object_id_name_n_point( data, 'CUSTOMER', gi_user_comp_id , gdb_branch, ldb_cust_id, ls_name, ll_point, it_transaction )
	if li_rtn = 0 then
		
		openwithparm(u_w_newcustomer,data)
		if isvalid( message.powerobjectparm) then
			lc_str_pos = message.powerobjectparm
			setnull(message.powerobjectparm)
			
			select SEQ_TABLE_ID.nextval into :ldb_cust_id from dual using  it_transaction;	
			INSERT into object (ID, company_id, branch_id, object_ref_table, code, name, manage_group, posting_group, handled_by, created_by, created_date, last_mdf_by, last_mdf_date, active_yn)
			VALUEs(:ldb_cust_id, :gi_user_comp_id, :gdb_branch, 'CUSTOMER',  :lc_str_pos.s_data[1] ,  :lc_str_pos.s_data[2], null, null, :gi_userid, :gi_userid, sysdate, :gi_userid, sysdate, 'Y') 
			using it_transaction;
			
			select SEQ_TABLE_ID.nextval into :ldb_id from dual using  it_transaction;
			INSERT into customer (ID, company_id, branch_id, object_ref_id, object_ref_table, created_by, created_date, last_mdf_by, last_mdf_date, CARDNUMBER, dob, age)
			VALUEs(:ldb_id, :gi_user_comp_id, :gdb_branch,:ldb_cust_id, 'OBJECT', :gi_userid, sysdate, :gi_userid, sysdate, :lc_str_pos.s_data[3], :lc_str_pos.d_date, :lc_str_pos.db_data ) 
			using it_transaction;
			commit using it_transaction;		
			idb_new_cust = ldb_cust_id			
			this.setitem( 1, 'code', lc_str_pos.s_data[1])
			this.setitem( 1, 'cust_name', lc_str_pos.s_data[2])
//			this.getchild( 'code', ldwc)
//			ldwc.retrieve( )					
		else
			this.setitem( 1, 'code', '')
			this.setitem( 1, 'cust_point', 0)
			idb_new_cust = 0			
		end if
	else	
		this.setitem( 1, 'cust_point', ll_point)
		idb_new_cust = ldb_cust_id
		if this.getchild( 'code', ldwc)	<> -1 then
			this.setitem( 1, 'cust_name', ldwc.getitemstring(ldwc.getrow( ),'object_name' ))
		end if				
	end if

elseif dwo.name = 'used_point' then
	ldb_cust_point =  this.getitemnumber( 1, 'cust_point')
	if isnull(ldb_cust_point) then ldb_cust_point = 0
	if ldb_cust_point/1000 >= double(data) then
		ldb_total_amt =  this.getitemnumber( 1, 'total_amt')
		this.setitem( 1, 'cash_amt', ldb_total_amt - double(data) * 1000)		
	else
		gf_messagebox('m.c_w_payment.dw_payment.itemchanged.02','Xác nhận','Số điểm dùng không đươc lớn hơn số điểm tích lũy ! (điểm/1000)@ ' + string(ldb_cust_point),'exclamation','ok', 1)			
		this.settext('')	
		return 1		
	end if
end if
end event

event itemerror;call super::itemerror;return 1
end event

event editchanged;call super::editchanged;int								li_editpos, li_rtn
string							ls_data, ls_autocomplete_string, ls_rtn
datawindowchild			ldwc

If dwo.name = 'code' then

	if this.getchild( dwo.name, ldwc) = -1 then return
	li_editpos = this.position()
	ls_data = data
//	if len(mid(ls_data,li_editpos -1,1)) > 1 then li_editpos ++		
	ls_autocomplete_string = this.f_get_autocomplete_string(dwo.name, ls_data, 'dddw', ldwc, 'obj_search')		
	if lower(left(ls_autocomplete_string,len(ls_data))) = lower(ls_data) then
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
elseIf dwo.name = 'staff_code' then

	if this.getchild( dwo.name, ldwc) = -1 then return
	li_editpos = this.position()
	ls_data = this.gettext( )
//	if len(mid(ls_data,li_editpos -1,1)) > 1 then li_editpos ++		
	ls_autocomplete_string = this.f_get_autocomplete_string(dwo.name, ls_data, 'dddw', ldwc, 'obj_search')		
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

event itemfocuschanged;call super::itemfocuschanged;this.ib_dropdowning = false
end event

event losefocus;call super::losefocus;
datawindowchild 		ldwc

this.ib_dropdowning = false
	
if this.getchild( 'CODE', ldwc)  = 1 then
	ldwc.setfilter( '')
	ldwc.filter( )
end if

end event

