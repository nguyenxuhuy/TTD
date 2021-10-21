$PBExportHeader$c_w_test.srw
forward
global type c_w_test from window
end type
type cb_cancel from t_cb within c_w_test
end type
type cb_ok from t_cb within c_w_test
end type
type dw_briefbill from t_dw_pos within c_w_test
end type
end forward

global type c_w_test from window
integer width = 3045
integer height = 2344
boolean titlebar = true
string title = "Bill nhanh"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_cancel cb_cancel
cb_ok cb_ok
dw_briefbill dw_briefbill
end type
global c_w_test c_w_test

type variables
double		idb_new_cust
end variables

on c_w_test.create
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.dw_briefbill=create dw_briefbill
this.Control[]={this.cb_cancel,&
this.cb_ok,&
this.dw_briefbill}
end on

on c_w_test.destroy
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.dw_briefbill)
end on

event open;long		ll_length
string		ls_qr, ls_pathfile, ls_name
blob		lbl_pic

t_ds_db  	lds_bill
t_transaction		lt_transaction

/*
lds_bill= message.powerobjectparm
//ls_qr = message.stringparm

//this.rte_1.replacetext( ls_qr)

this.dw_briefbill.dataobject = lds_bill.dataobject

lds_bill.rowscopy( 1, lds_bill.rowcount(), primary!, dw_briefbill , 1, primary!)

ll_length = 90 + dw_briefbill.rowcount( )*5

dw_briefbill.Modify("DataWindow.Print.Paper.Size=256")
dw_briefbill.Modify("DataWindow.Print.CustomPage.Width=80")  
dw_briefbill.Modify("DataWindow.Print.CustomPage.Length=" +string(ll_length)) 
dw_briefbill.Modify("DataWindow.Print.Margin.Top= 5")
dw_briefbill.modify("DataWindow.Print.Preview= true")
dw_briefbill.Modify("DataWindow.Print.Preview.Rulers = 'Yes'")
*/

lt_transaction = create t_transaction
lt_transaction.DBMS = "ODBC"
lt_transaction.AutoCommit = False
lt_transaction.DBParm = "ConnectString='DSN=abc;UID=;PWD=<******>'"

connect using	lt_transaction;	


select count( photo) into :ll_length from userinfo
where not isnull(photo)
using lt_transaction;

selectblob photo into :lbl_pic from userinfo
where not isnull(photo)
using lt_transaction;

ls_pathfile = "D:\3.png"

gf_blob2file(lbl_pic,ls_pathfile)




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

type cb_cancel from t_cb within c_w_test
integer x = 590
integer y = 2088
integer taborder = 30
string text = "&Hủy"
end type

event clicked;call super::clicked;c_str_pos		lc_str_pos

lc_str_pos.s_response = 'cancel'

closewithreturn(parent, lc_str_pos)
end event

type cb_ok from t_cb within c_w_test
integer x = 55
integer y = 2088
integer taborder = 20
string text = "&OK"
end type

event clicked;call super::clicked;double			ldb_spk_amt, ldb_spl_amt, ldb_cust_point
c_str_pos		lc_str_pos
//-- add item to bill--//

dw_briefbill.print( false, false)

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
	lc_str_pos.dba_data[1] = idb_new_cust
	lc_str_pos.dba_data[2] =  ldb_cust_point
	
	lc_str_pos.s_response = 'ok'
end if 
closewithreturn(parent, lc_str_pos)
end event

type dw_briefbill from t_dw_pos within c_w_test
integer x = 27
integer y = 24
integer width = 2912
integer height = 1544
integer taborder = 10
string dataobject = "d_test"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event e_dwnkey;call super::e_dwnkey;if key= keyEnter! then
	this.accepttext( )
	Send(Handle(this),256,9,Long(0,0))
	RETURN 1

end if
end event

event itemchanged;call super::itemchanged;string			ls_name, ls_code
int				li_rtn
long			ll_point
double		ldb_cust_id, ldb_id

b_obj_instantiate		lbo_ins

if dwo.name = 'code' then
	//-- kiểm tra cust --//

	li_rtn = lbo_ins.f_get_object_id_name_n_point( data, 'CUSTOMER', gi_user_comp_id , gdb_branch, ldb_cust_id, ls_name, ll_point)
	if li_rtn = 0 then
		ls_name = this.getitemstring( 1, 'name')
		if ls_name <> '' and not isnull(ls_name) then //-- thêm khách hàng mới --//
			select SEQ_TABLE_ID.nextval into :ldb_cust_id from dual using  sqlca;	
			INSERT into object (ID, company_id, branch_id, object_ref_table, code, name, manage_group, posting_group, handled_by, created_by, created_date, last_mdf_by, last_mdf_date)
			VALUEs(:ldb_cust_id, :gi_user_comp_id, :gdb_branch, 'CUSTOMER',  :data,  :ls_name, null, null, :gi_userid, :gi_userid, sysdate, :gi_userid, sysdate) 
			using sqlca;
			
			select SEQ_TABLE_ID.nextval into :ldb_id from dual using  sqlca;
			INSERT into customer (ID, company_id, branch_id, object_ref_id, object_ref_table, created_by, created_date, last_mdf_by, last_mdf_date)
			VALUEs(:ldb_id, :gi_user_comp_id, :gdb_branch,:ldb_cust_id, 'OBJECT', :gi_userid, sysdate, :gi_userid, sysdate) 
			using sqlca;
			commit using sqlca;				
			idb_new_cust = ldb_cust_id
		end if
	else
		this.setitem( 1, 'name', ls_name)
		this.setitem( 1, 'cust_point', ll_point)
		idb_new_cust = ldb_cust_id
	end if
elseif dwo.name = 'name' then
	ls_code = this.getitemstring( 1, 'code')
	if ls_code <> '' and not isnull(ls_code) then
		li_rtn = lbo_ins.f_get_object_id_n_name( ls_code, 'CUSTOMER', gi_user_comp_id , gdb_branch, ldb_cust_id, ls_name)
		if li_rtn = 0 then //-- thêm khách hàng mới --//
			select SEQ_TABLE_ID.nextval into :ldb_cust_id from dual using  sqlca;	
			INSERT into object (ID, company_id, branch_id, object_ref_table, code, name, manage_group, posting_group, handled_by, created_by, created_date, last_mdf_by, last_mdf_date)
			VALUEs(:ldb_cust_id, :gi_user_comp_id, :gdb_branch, 'CUSTOMER',  :ls_code,  :data, null, null, :gi_userid, :gi_userid, sysdate, :gi_userid, sysdate) 
			using sqlca;
			
			select SEQ_TABLE_ID.nextval into :ldb_id from dual using  sqlca;
			INSERT into customer (ID, company_id, branch_id, object_ref_id, object_ref_table, created_by, created_date, last_mdf_by, last_mdf_date)
			VALUEs(:ldb_id, :gi_user_comp_id, :gdb_branch,:ldb_cust_id, 'OBJECT', :gi_userid, sysdate, :gi_userid, sysdate) 
			using sqlca;
			commit using sqlca;		
			idb_new_cust = ldb_cust_id
		else
			idb_new_cust = ldb_cust_id
			if ls_name <> data then //-- thay đổi tên khách hàng đã có--//
				if gf_messagebox('m.c_w_payment.dw_payment.itemchanged.01','Xác nhận','Bạn có chắc muốn cập nhật khách hàng với tên mới không? @' + ls_name +'-' + data ,'question','yesno', 1) = 1 then				
					UPDATE object set name = :data where id = :ldb_cust_id using sqlca;
				else 
					this.settext( ls_name)
					return 1
				end if				
			end if			
		end if
	end if	
end if
end event

