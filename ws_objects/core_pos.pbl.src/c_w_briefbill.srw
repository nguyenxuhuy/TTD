$PBExportHeader$c_w_briefbill.srw
forward
global type c_w_briefbill from window
end type
type cb_cancel from t_cb within c_w_briefbill
end type
type cb_no_print from t_cb within c_w_briefbill
end type
type cb_ok from t_cb within c_w_briefbill
end type
type dw_briefbill from t_dw_pos within c_w_briefbill
end type
end forward

global type c_w_briefbill from window
integer width = 2386
integer height = 1212
boolean titlebar = true
string title = "Bill nhanh"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_cancel cb_cancel
cb_no_print cb_no_print
cb_ok cb_ok
dw_briefbill dw_briefbill
end type
global c_w_briefbill c_w_briefbill

type variables
double			idb_new_cust
t_transaction	it_transaction
end variables

on c_w_briefbill.create
this.cb_cancel=create cb_cancel
this.cb_no_print=create cb_no_print
this.cb_ok=create cb_ok
this.dw_briefbill=create dw_briefbill
this.Control[]={this.cb_cancel,&
this.cb_no_print,&
this.cb_ok,&
this.dw_briefbill}
end on

on c_w_briefbill.destroy
destroy(this.cb_cancel)
destroy(this.cb_no_print)
destroy(this.cb_ok)
destroy(this.dw_briefbill)
end on

event open;any							laa_value[] 
string							ls_rtn, ls_col_string
datawindowchild 			ldwc
c_dwservice					lc_dwservice

//-- Tạo connection voi database --//
it_transaction = create t_transaction
it_transaction.dbms =	SQLCA.DBMS
it_transaction.ServerName	 = SQLCA.ServerName
it_transaction.LogId	 = SQLCA.LogId
it_transaction.LogPass 	 = SQLCA.LogPass 
it_transaction.AutoCommit 	 = false 
it_transaction.DBParm	 = SQLCA.DBParm
connect using	it_transaction;	

dw_briefbill.insertrow( 0)

this.dw_briefbill.getchild( 'code', ldwc)
laa_value[1] = gi_user_comp_id
ls_col_string = 'company_id;'
lc_dwservice.f_add_where_dwc(ldwc, ls_col_string, laa_value[])
ldwc.settrans(it_transaction )
ldwc.retrieve( )
ls_rtn = dw_briefbill.Modify( 'code.dddw.percentwidth= 200')

this.dw_briefbill.getchild( 'staff_code', ldwc)
//laa_value[1] = gi_user_comp_id
//ls_col_string = 'company_id;'
lc_dwservice.f_add_where_dwc(ldwc, ls_col_string, laa_value[])
ldwc.settrans(it_transaction )
ldwc.retrieve( )
ls_rtn = dw_briefbill.Modify( 'staff_name.dddw.percentwidth= 200')
end event

event key;if key= keyEnter! then
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
end if
end event

event closequery;disconnect using it_transaction;
destroy it_transaction
end event

type cb_cancel from t_cb within c_w_briefbill
integer x = 1655
integer y = 924
integer taborder = 40
string text = "&Hủy"
end type

event clicked;call super::clicked;c_str_pos		lc_str_pos

lc_str_pos.s_response = 'cancel'

closewithreturn(parent, lc_str_pos)
end event

type cb_no_print from t_cb within c_w_briefbill
integer x = 709
integer y = 924
integer width = 919
integer taborder = 30
string text = "&OK Không in phiếu (Shift + F12)"
end type

event clicked;call super::clicked;double			ldb_spk_amt, ldb_spl_amt, ldb_cust_point
string			ls_code, ls_staff_code
c_str_pos		lc_str_pos
//-- add item to bill--//

dw_briefbill.accepttext( )

ls_code = parent.dw_briefbill.getitemstring(1, 'code')
ls_staff_code = parent.dw_briefbill.getitemstring(1, 'staff_code')
if isnull(ls_code) then ls_code = ''
if isnull(ls_staff_code) or ls_staff_code = '' then
	gf_messagebox('m.c_w_payment.cb_ok.clicked.01','Thông báo','Chưa nhập NV bán hàng','exclamation','ok',1)
	return
end if

dw_briefbill.accepttext()

ldb_spk_amt = parent.dw_briefbill.getitemnumber(1, 'spk')
ldb_spl_amt = parent.dw_briefbill.getitemnumber(1, 'spl')
ldb_cust_point = parent.dw_briefbill.getitemnumber(1, 'cust_point')
if isnull(ldb_spk_amt) then ldb_spk_amt = 0 
if isnull(ldb_spl_amt) then ldb_spl_amt = 0 
if isnull(ldb_cust_point) then ldb_cust_point = 0 

if ldb_spk_amt = 0 and ldb_spl_amt = 0 then
	lc_str_pos.s_response = 'cancel'
else
	lc_str_pos.dba_spk[1] = 24829894 //-- Id của item spk--//
	lc_str_pos.dba_spk[2] = ldb_spk_amt
	lc_str_pos.dba_spl[1] = 24829896 //-- Id của item spl--//
	lc_str_pos.dba_spl[2] = ldb_spl_amt
end if 

lc_str_pos.s_data[1] = ls_code 
lc_str_pos.s_data[2] = ls_staff_code
if idb_new_cust > 0 then
	lc_str_pos.dba_data[1] = idb_new_cust  //-- cust_id--//
end if
lc_str_pos.dba_data[2] = parent.dw_briefbill.getitemnumber(1, 'cust_point') //-- bonus point --//
//	lc_str_pos.dba_data[3] = 1 //-- pay amount --//
lc_str_pos.dba_data[4] = parent.dw_briefbill.getitemnumber(1, 'used_point')*1000 //-- used point --//
lc_str_pos.s_response = 'ok_none_print'

closewithreturn(parent, lc_str_pos)
end event

type cb_ok from t_cb within c_w_briefbill
integer x = 279
integer y = 924
integer taborder = 20
string text = "&OK(F12)"
end type

event clicked;call super::clicked;double			ldb_spk_amt, ldb_spl_amt, ldb_cust_point
string			ls_code, ls_staff_code
c_str_pos		lc_str_pos
//-- add item to bill--//

dw_briefbill.accepttext( )

ls_code = parent.dw_briefbill.getitemstring(1, 'code')
ls_staff_code = parent.dw_briefbill.getitemstring(1, 'staff_code')
if isnull(ls_code) then ls_code = ''
if isnull(ls_staff_code) or ls_staff_code = '' then
	gf_messagebox('m.c_w_payment.cb_ok.clicked.01','Thông báo','Chưa nhập NV bán hàng','exclamation','ok',1)
	return
end if

dw_briefbill.accepttext()

ldb_spk_amt = parent.dw_briefbill.getitemnumber(1, 'spk')
ldb_spl_amt = parent.dw_briefbill.getitemnumber(1, 'spl')
ldb_cust_point = parent.dw_briefbill.getitemnumber(1, 'cust_point')
if isnull(ldb_spk_amt) then ldb_spk_amt = 0 
if isnull(ldb_spl_amt) then ldb_spl_amt = 0 
if isnull(ldb_cust_point) then ldb_cust_point = 0 

if ldb_spk_amt = 0 and ldb_spl_amt = 0 then
	lc_str_pos.s_response = 'cancel'
else
	lc_str_pos.dba_spk[1] = 24829894 //-- Id của item spk--//
	lc_str_pos.dba_spk[2] = ldb_spk_amt
	lc_str_pos.dba_spl[1] = 24829896 //-- Id của item spl--//
	lc_str_pos.dba_spl[2] = ldb_spl_amt
end if 

lc_str_pos.s_data[1] = ls_code 
lc_str_pos.s_data[2] = ls_staff_code
if idb_new_cust > 0 then
	lc_str_pos.dba_data[1] = idb_new_cust  //-- cust_id--//
end if
lc_str_pos.dba_data[2] = parent.dw_briefbill.getitemnumber(1, 'cust_point') //-- bonus point --//
//	lc_str_pos.dba_data[3] = 1 //-- pay amount --//
lc_str_pos.dba_data[4] = parent.dw_briefbill.getitemnumber(1, 'used_point')*1000 //-- used point --//
lc_str_pos.s_response = 'ok'

closewithreturn(parent, lc_str_pos)
end event

type dw_briefbill from t_dw_pos within c_w_briefbill
integer width = 2327
integer height = 836
integer taborder = 10
string dataobject = "d_briefbill_form"
end type

event e_dwnkey;

//-- Override --//

if key= keyEnter! then
	Send(Handle(this),256,9,Long(0,0))
	RETURN 1
elseif key= keyF12!  and keyflags = 1 then
	parent.cb_no_print.event clicked( )
elseif  key= keyF12! then
	parent.cb_ok.event clicked( )
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

	li_rtn = lbo_ins.f_get_object_id_name_n_point( data, 'CUSTOMER', gi_user_comp_id , gdb_branch, ldb_cust_id, ls_name, ll_point, it_transaction)
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
			INSERT into customer (ID, company_id, branch_id, object_ref_id, object_ref_table, created_by, created_date, last_mdf_by, last_mdf_date, CARDNUMBER, dob)
			VALUEs(:ldb_id, :gi_user_comp_id, :gdb_branch,:ldb_cust_id, 'OBJECT', :gi_userid, sysdate, :gi_userid, sysdate, :lc_str_pos.s_data[3], :lc_str_pos.d_date) 
			using it_transaction;
			commit using it_transaction;		
			idb_new_cust = ldb_cust_id			
			this.setitem( 1, 'code', lc_str_pos.s_data[1])
			this.getchild( 'code', ldwc)
			ldwc.retrieve( )					
		else
			this.setitem( 1, 'code', '')
			this.setitem( 1, 'cust_point', 0)
			idb_new_cust = 0			
		end if
	else
		this.setitem( 1, 'cust_point', ll_point)
		idb_new_cust = ldb_cust_id
	end if

elseif dwo.name = 'used_point' then
	ldb_cust_point =  this.getitemnumber( 1, 'cust_point')
	if isnull(ldb_cust_point) then ldb_cust_point = 0
	if ldb_cust_point/1000 >= double(data) then
		ldb_total_amt =  this.getitemnumber( 1, 'total_amt')
		this.setitem( 1, 'cash_amount', ldb_total_amt - double(data) * 1000)		
	else
		gf_messagebox('m.c_w_payment.dw_payment.itemchanged.02','Xác nhận','Số điểm dùng không đươc lớn hơn số điểm tích lũy ! (điểm/1000)@ ' + string(ldb_cust_point),'exclamation','ok', 1)			
		this.settext('')	
		return 1		
	end if
end if
end event

event editchanged;call super::editchanged;int								li_editpos, li_rtn
string							ls_data, ls_autocomplete_string, ls_rtn
datawindowchild			ldwc

If dwo.name = 'code' then

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

event losefocus;call super::losefocus;
datawindowchild 		ldwc

this.ib_dropdowning = false
	
if this.getchild( 'CODE', ldwc)  = 1 then
	ldwc.setfilter( '')
	ldwc.filter( )
end if

if this.getchild( 'staff_code', ldwc)  = 1 then
	ldwc.setfilter( '')
	ldwc.filter( )
end if

end event

event itemfocuschanged;call super::itemfocuschanged;this.ib_dropdowning = false
end event

