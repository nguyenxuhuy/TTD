$PBExportHeader$c_customer_interface.sru
forward
global type c_customer_interface from b_interface
end type
end forward

global type c_customer_interface from b_interface
event type integer e_action_load_file ( )
event type integer e_action_check ( )
event type integer e_action_process ( )
end type
global c_customer_interface c_customer_interface

forward prototypes
public subroutine f_set_dwo_window ()
end prototypes

event type integer e_action_load_file();
t_transaction	lt_transaction
t_dw_mpl		ldw_interface
t_ds_db			lds_interface
OLEobject		lole_excel, lole_worksheet


lole_excel = create OLEobject

if this.f_load_excelfile( lole_excel) = -1 then return -1

this.iw_display.f_get_transaction( lt_transaction)
ldw_interface = this.iw_display.dynamic f_get_dw( 2)
lds_interface = create t_ds_db
lds_interface.dataobject = ldw_interface.dataobject
lds_interface.f_settransobject(lt_transaction)
lds_interface.f_set_obj_display( this)

lole_worksheet = lole_excel.ActiveWorkbook.ActiveSheet
if this.f_load_worksheet2datastore(lole_worksheet, lds_interface, 1, 1) = -1 then return -1
lole_excel.application.quit()
lole_excel.DisconnectObject()
destroy lole_Excel

if lds_interface.update(true, false ) = 1 then
	commit using lt_transaction;
	ldw_interface.event e_refresh( )
	gf_messagebox('m.c_customer_interface.e_action_load_file.01','Thông báo','Hoàn thành nạp dữ liệu','information','ok',1)
else
	gf_messagebox('m.c_customer_interface.e_action_load_file.01','Thông báo','Lỗi nạp dữ liệu :@'+ lt_transaction.sqlerrtext ,'exclamation','ok',1)
	rollback using lt_transaction;
	return -1
end if

return 1
end event

event type integer e_action_check();any 					laa_arg[], laa_empty[]
long					ll_row
string					ls_duplicated_colnames,ls_sort,ls_ins_or_upd, ls_colname
boolean				lb_chk_dulicated
t_dw_mpl				ldw_interface,ldw_parm
t_ds_db					lds_chk_key
b_obj_instantiate		lbo_inst

//=================//
//-- Kiểm tra trùng dữ liệu --//
//------------------------------//
ldw_interface = this.iw_display.dynamic f_get_dw( 2)
ldw_parm = iw_display.f_get_dw( 'd_cust_interface_parm_form')
if ldw_interface.rowcount( ) = 0 then	return 0
this.iw_display.setredraw( false)
lds_chk_key = create t_ds_db
ls_sort = ldw_interface.describe( "datawindow.table.sort")
ls_ins_or_upd = ldw_parm.getitemstring( 1, 'ins_or_upd')
if ls_ins_or_upd = 'ins' then
	if ldw_interface.dataobject = 'd_customer_interface_grid' then	
		//-- kiểm tra trùng dữ liệu database item_code --//
		lds_chk_key.dataobject = 'ds_object'
		laa_arg[1] = gi_user_comp_id
		laa_arg[2] = '=CUSTOMER'	
		if lbo_inst.f_is_branch_yn( this.classname()) then
			laa_arg[3] = gdb_branch
			ls_colname =  'company_id;object_ref_table;branch_id;'
		else
			ls_colname =  'company_id;object_ref_table;'
		end if
		lds_chk_key.f_add_where(ls_colname , laa_arg[])
		lds_chk_key.f_settransobject( sqlca)
		lds_chk_key.retrieve( )
		if this.f_chk_interface_duplicated_data( ldw_interface,'code' , lds_chk_key, 'code') = -1 then return -1	
		//-- kiểm tra trùng mã số thuế --//
		lds_chk_key.dataobject = 'd_organization_form'
		laa_arg[1] = '=CUSTOMER'	
		if lbo_inst.f_is_branch_yn( this.classname()) then
			laa_arg[2] = gdb_branch
			ls_colname =  'object_ref_table;branch_id;'
		else
			ls_colname =  'object_ref_table;'
		end if		
		lds_chk_key.f_add_where( ls_colname, laa_arg[])
		lds_chk_key.f_settransobject( sqlca)
		lds_chk_key.retrieve( )
		if this.f_chk_interface_duplicated_data( ldw_interface,'TAX_NUMBER' , lds_chk_key, 'TAX_NUMBER') = -1 then return -1	
		
		//--Kiểm tra trùng địa chỉ--//
		lds_chk_key.dataobject = 'd_address_grid'
		laa_arg[1] = '=CUSTOMER'	
		lds_chk_key.f_add_where( 'object_ref_table;', laa_arg[])
		lds_chk_key.f_settransobject( sqlca)
		lds_chk_key.retrieve( )
		if this.f_chk_interface_duplicated_data( ldw_interface,'ADDRESS' , lds_chk_key, 'ADDRESS') = -1 then return -1	
	
	end if
else
	if ldw_interface.dataobject = 'd_customer_interface_grid' then	
		//-- kiểm tra khách hàng đã khai báo --//
		lds_chk_key.dataobject = 'ds_object'
		laa_arg[1] = gi_user_comp_id
		laa_arg[2] = '=CUSTOMER'	
		lds_chk_key.f_add_where( 'company_id;object_ref_table;', laa_arg[])
		lds_chk_key.f_settransobject( sqlca)
		lds_chk_key.retrieve( )
		if this.f_chk_interface_exists_data( ldw_interface,'code' , lds_chk_key, 'code') = -1 then return -1	
	end if
end if
//===============//
//-- kiểm tra foreignkey --//
//---------------------------//
lds_chk_key = create t_ds_db

if ldw_interface.dataobject = 'd_customer_interface_grid' then	
	//-- kiểm tra cột POSTING_GROUP --//
	lds_chk_key.dataobject = 'd_valueset_entry_grid'
	laa_arg[] = laa_empty[]
	laa_arg[1] = '=u_valueset_entry@custpost_grp'
	lds_chk_key.f_add_where( 'menu_code', laa_arg[])
	lds_chk_key.f_settransobject( sqlca)
	lds_chk_key.retrieve( )		
	if this.f_chk_interface_foreignkey( ldw_interface, 'POSTING_GROUP', lds_chk_key, 'code') = -1 then return -1
	//-- kiểm tra cột MANAGE_GROUP --//
	lds_chk_key.dataobject = 'd_valueset_entry_grid'
	laa_arg[] = laa_empty[]
	laa_arg[1] = '=u_valueset_entry@cit'
	lds_chk_key.f_add_where( 'menu_code', laa_arg[])
	lds_chk_key.f_settransobject( sqlca)
	lds_chk_key.retrieve( )		
	if this.f_chk_interface_foreignkey( ldw_interface, 'MANAGE_GROUP', lds_chk_key, 'code') = -1 then return -1

//  HANDLED_BY        ,
	lds_chk_key.dataobject = 'd_role_user_grid'
	laa_arg[] = laa_empty[]
	laa_arg[1] = '=user'
	lds_chk_key.f_add_where( 'type;', laa_arg[])
	lds_chk_key.f_settransobject( sqlca)
	lds_chk_key.retrieve( )
	if this.f_chk_interface_foreignkey( ldw_interface,'handled_by' , lds_chk_key, 'STAFF_NAME') = -1 then return -1	
		
//DEFAULT_CURRENCY
	lds_chk_key.dataobject = 'd_currency_grid'
	lds_chk_key.f_settransobject( sqlca)
	lds_chk_key.retrieve( )		
	if this.f_chk_interface_foreignkey( ldw_interface, 'DEFAULT_CURRENCY', lds_chk_key, 'code') = -1 then return -1		
	
//  PAYMENT_TERM     ,
	lds_chk_key.dataobject = 'd_payment_term_grid'
	lds_chk_key.f_settransobject( sqlca)
	lds_chk_key.retrieve( )		
	if this.f_chk_interface_foreignkey( ldw_interface, 'payment_term', lds_chk_key, 'code') = -1 then return -1

//  DELIVERY_MODE      ,
	lds_chk_key.dataobject = 'd_valueset_entry_grid'
	laa_arg[] = laa_empty[]
	laa_arg[1] = '=u_valueset_entry@vc'
	lds_chk_key.f_add_where( 'menu_code', laa_arg[])
	lds_chk_key.f_settransobject( sqlca)
	lds_chk_key.retrieve( )		
	if this.f_chk_interface_foreignkey( ldw_interface, 'delivery_mode', lds_chk_key, 'code') = -1 then return -1
//  PAYMENT_METHOD    ,
	lds_chk_key.dataobject = 'd_valueset_entry_grid'
	laa_arg[] = laa_empty[]
	laa_arg[1] = '=u_valueset_entry@pat'
	lds_chk_key.f_add_where( 'menu_code', laa_arg[])
	lds_chk_key.f_settransobject( sqlca)
	lds_chk_key.retrieve( )		
	if this.f_chk_interface_foreignkey( ldw_interface, 'payment_method', lds_chk_key, 'code') = -1 then return -1
//  CITY               ,
	lds_chk_key.dataobject = 'd_valueset_entry_grid'
	laa_arg[] = laa_empty[]
	laa_arg[1] = '=u_valueset_entry@TP'
	lds_chk_key.f_add_where( 'menu_code', laa_arg[])
	lds_chk_key.f_settransobject( sqlca)
	lds_chk_key.retrieve( )		
	if this.f_chk_interface_foreignkey( ldw_interface, 'city', lds_chk_key, 'code') = -1 then return -1
//  DISTRICT          ,
	lds_chk_key.dataobject = 'd_valueset_entry_grid'
	laa_arg[] = laa_empty[]
	laa_arg[1] = '=u_valueset_entry@quan'
	lds_chk_key.f_add_where( 'menu_code', laa_arg[])
	lds_chk_key.f_settransobject( sqlca)
	lds_chk_key.retrieve( )		
	if this.f_chk_interface_foreignkey( ldw_interface, 'district', lds_chk_key, 'code') = -1 then return -1
//  TYPE_COMPANY      ,
	lds_chk_key.dataobject = 'd_valueset_entry_grid'
	laa_arg[] = laa_empty[]
	laa_arg[1] = '=u_valueset_entry@lhdn'
	lds_chk_key.f_add_where( 'menu_code', laa_arg[])
	lds_chk_key.f_settransobject( sqlca)
	lds_chk_key.retrieve( )		
	if this.f_chk_interface_foreignkey( ldw_interface, 'type_company', lds_chk_key, 'code') = -1 then return -1
//  TYPE_BUSINESS    ,
	lds_chk_key.dataobject = 'd_valueset_entry_grid'
	laa_arg[] = laa_empty[]
	laa_arg[1] = '=u_valueset_entry@nnkd'
	lds_chk_key.f_add_where( 'menu_code', laa_arg[])
	lds_chk_key.f_settransobject( sqlca)
	lds_chk_key.retrieve( )		
	if this.f_chk_interface_foreignkey( ldw_interface, 'type_business', lds_chk_key, 'code') = -1 then return -1
//  SCALE             ,
	lds_chk_key.dataobject = 'd_valueset_entry_grid'
	laa_arg[] = laa_empty[]
	laa_arg[1] = '=u_valueset_entry@qmdn'
	lds_chk_key.f_add_where( 'menu_code', laa_arg[])
	lds_chk_key.f_settransobject( sqlca)
	lds_chk_key.retrieve( )		
	if this.f_chk_interface_foreignkey( ldw_interface, 'scale', lds_chk_key, 'code') = -1 then return -1
end if
//=====================//
//-- kiểm tra bắt buộc có dữ liệu --//
//------------------------------------//
this.f_chk_interface_must_data( ldw_interface) 
this.iw_display.setredraw( true)
gf_messagebox('m.c_customer_interface.e_action_check.01','Thông báo','Kiểm tra hoàn thành','information','ok',1)
if ls_sort <> '?' then 	ldw_interface.setsort(ls_sort)
if ls_sort = '?' then ldw_interface.setsort('')
ldw_interface.sort( )
return 1
end event

event type integer e_action_process();b_obj_instantiate 			lb_ins
t_transaction				lt_transaction
t_dw_mpl						ldw_interface,ldw_parm
t_ds_db						lds_m_fk_data[],lds_d1_fk_data[],lds_d2_fk_data[], lds_d3_fk_data[]
t_ds_db						lds_fk_manage_group, lds_fk_post_group, lds_fk_staff

s_str_import				lstr_master, lstr_detail1[],  lstr_detail2[],  lstr_detail3[]
any							laa_arg[], laa_empty[]
long							ll_rowcnt, ll_row_import,ll_count
string							las_value_detail1[],las_value_detail2[],las_value_detail3[],ls_value_master,ls_ins_or_upd,ls_code
double						ladb_id[]

//-- import vào table --//
this.iw_display.f_get_transaction(lt_transaction )
ldw_interface = this.iw_display.dynamic f_get_dw( 2)
ldw_parm = iw_display.f_get_dw( 'd_cust_interface_parm_form')
ls_ins_or_upd = ldw_parm.getitemstring( 1, 'ins_or_upd')

if ldw_interface.dataobject = 'd_customer_interface_grid' then
	ll_row_import = ldw_interface.find(" chk_text = 'OK'", 1 ,ldw_interface.rowcount())
	DO while ll_row_import > 0
		//----------------------------------//
		//-- import master và detail1 --//
		//----------------------------------//
		lstr_master.s_table = 'OBJECT'
		lstr_master.s_t_colnames = 'company_id,branch_id,created_by, created_date,last_mdf_by, last_mdf_date,CODE,NAME,SHORT_NAME,POSTING_GROUP,MANAGE_GROUP,HANDLED_BY,ACTIVE_YN,NOTE'
		lstr_master.s_dwi_colnames = 'company_id,branch_id,created_by, created_date,last_mdf_by, last_mdf_date,CODE,NAME,SHORT_NAME,POSTING_GROUP,MANAGE_GROUP,HANDLED_BY,ACTIVE_YN,NOTE'
		lstr_master.s_fk_colnames =  'POSTING_GROUP,MANAGE_GROUP,HANDLED_BY'
		lstr_master.s_pk_colnames =  'code,code,STAFF_NAME'
		lstr_master.s_upd_colname = 'NAME,SHORT_NAME,ACTIVE_YN,NOTE'
		lstr_master.s_dwu_colnames = 'NAME,SHORT_NAME,ACTIVE_YN,NOTE'
		
		lstr_master.ds_pk_data[1] = create t_ds_db
		lstr_master.ds_pk_data[1] .dataobject = 'd_valueset_entry_grid'
		laa_arg[1] = '=u_valueset_entry@custpost_grp'
		lstr_master.ds_pk_data[1] .f_add_where( 'menu_code', laa_arg[])
		lstr_master.ds_pk_data[1] .f_settransobject( sqlca)
		lstr_master.ds_pk_data[1] .retrieve( )		
		
		lstr_master.ds_pk_data[2] = create t_ds_db
		lstr_master.ds_pk_data[2] .dataobject = 'd_valueset_entry_grid'
		laa_arg[1] = '=u_valueset_entry@cit'
		lstr_master.ds_pk_data[2] .f_add_where( 'menu_code', laa_arg[])
		lstr_master.ds_pk_data[2] .f_settransobject( sqlca)
		lstr_master.ds_pk_data[2] .retrieve( )	
	
		lstr_master.ds_pk_data[3] = create t_ds_db
		lstr_master.ds_pk_data[3].dataobject = 'd_role_user_grid'
		lstr_master.ds_pk_data[3].f_settransobject( sqlca)
		lstr_master.ds_pk_data[3].retrieve( )		
		
		lstr_detail1[1].s_table = 'CUSTOMER'
		lstr_detail1[1].s_t_colnames = 'company_id,branch_id,created_by, created_date,last_mdf_by, last_mdf_date,VENDOR_YN,PAYMENT_TERM,DEFAULT_CURRENCY,'+&
												'DELIVERY_MODE,PAYMENT_METHOD,CITY,DISTRICT,TYPE_COMPANY,TYPE_BUSINESS,SCALE,TYPE_CUSTOMER'
		lstr_detail1[1].s_dwi_colnames = 'company_id,branch_id,created_by, created_date,last_mdf_by, last_mdf_date,VENDOR_YN,PAYMENT_TERM,DEFAULT_CURRENCY,'+&
												'DELIVERY_MODE,PAYMENT_METHOD,CITY,DISTRICT,TYPE_COMPANY,TYPE_BUSINESS,SCALE,TYPE_CUSTOMER'
		lstr_detail1[1].s_fk_colnames =  'PAYMENT_TERM,DEFAULT_CURRENCY,DELIVERY_MODE,PAYMENT_METHOD,CITY,DISTRICT,TYPE_COMPANY,TYPE_BUSINESS,SCALE,TYPE_CUSTOMER'
		lstr_detail1[1].s_pk_colnames =  'code,code,code,code,code,code,code,code,code,code'
		lstr_detail1[1].s_upd_colname = 'VENDOR_YN'
		lstr_detail1[1].s_dwu_colnames = 'VENDOR_YN'
		
		//--PAYMENT_TERM--//
		lstr_detail1[1].ds_pk_data[1] = create t_ds_db
		lstr_detail1[1].ds_pk_data[1].dataobject = 'd_payment_term_grid'
		lstr_detail1[1].ds_pk_data[1].f_settransobject( sqlca)
		lstr_detail1[1].ds_pk_data[1].retrieve( )		
		
		//--DEFAULT_CURRENCY --//
		lstr_detail1[1].ds_pk_data[2] = create t_ds_db
		lstr_detail1[1].ds_pk_data[2].dataobject = 'd_currency_grid'
		lstr_detail1[1].ds_pk_data[2].f_settransobject( sqlca)
		lstr_detail1[1].ds_pk_data[2].retrieve( )		
		
		//--DELIVERY_MODE--//
		lstr_detail1[1].ds_pk_data[3] = create t_ds_db
		lstr_detail1[1].ds_pk_data[3].dataobject = 'd_valueset_entry_grid'
		laa_arg[1] = '=u_valueset_entry@vc'
		lstr_detail1[1].ds_pk_data[3].f_add_where( 'menu_code', laa_arg[])
		lstr_detail1[1].ds_pk_data[3].f_settransobject( sqlca)
		lstr_detail1[1].ds_pk_data[3].retrieve( )		
		//--PAYMENT_METHOD--//
		lstr_detail1[1].ds_pk_data[4] = create t_ds_db
		lstr_detail1[1].ds_pk_data[4] .dataobject = 'd_valueset_entry_grid'
		laa_arg[1] = '=u_valueset_entry@pat'
		lstr_detail1[1].ds_pk_data[4] .f_add_where( 'menu_code', laa_arg[])
		lstr_detail1[1].ds_pk_data[4] .f_settransobject( sqlca)
		lstr_detail1[1].ds_pk_data[4] .retrieve( )		
		//--CITY--//
		lstr_detail1[1].ds_pk_data[5] = create t_ds_db
		lstr_detail1[1].ds_pk_data[5] .dataobject = 'd_valueset_entry_grid'
		laa_arg[1] = '=u_valueset_entry@TP'
		lstr_detail1[1].ds_pk_data[5] .f_add_where( 'menu_code', laa_arg[])
		lstr_detail1[1].ds_pk_data[5] .f_settransobject( sqlca)
		lstr_detail1[1].ds_pk_data[5] .retrieve( )	
		//--DISTRICT--//
		lstr_detail1[1].ds_pk_data[6] = create t_ds_db
		lstr_detail1[1].ds_pk_data[6] .dataobject = 'd_valueset_entry_grid'
		laa_arg[1] = '=u_valueset_entry@quan'
		lstr_detail1[1].ds_pk_data[6] .f_add_where( 'menu_code', laa_arg[])
		lstr_detail1[1].ds_pk_data[6] .f_settransobject( sqlca)
		lstr_detail1[1].ds_pk_data[6] .retrieve( )	
		//--TYPE_COMPANY--//
		lstr_detail1[1].ds_pk_data[7] = create t_ds_db
		lstr_detail1[1].ds_pk_data[7] .dataobject = 'd_valueset_entry_grid'
		laa_arg[1] = '=u_valueset_entry@lhdn'
		lstr_detail1[1].ds_pk_data[7] .f_add_where( 'menu_code', laa_arg[])
		lstr_detail1[1].ds_pk_data[7] .f_settransobject( sqlca)
		lstr_detail1[1].ds_pk_data[7] .retrieve( )	
		//--TYPE_BUSINESS--//
		lstr_detail1[1].ds_pk_data[8] = create t_ds_db
		lstr_detail1[1].ds_pk_data[8] .dataobject = 'd_valueset_entry_grid'
		laa_arg[1] = '=u_valueset_entry@nnkd'
		lstr_detail1[1].ds_pk_data[8] .f_add_where( 'menu_code', laa_arg[])
		lstr_detail1[1].ds_pk_data[8] .f_settransobject( sqlca)
		lstr_detail1[1].ds_pk_data[8] .retrieve( )	
		//--SCALE--//
		lstr_detail1[1].ds_pk_data[9] = create t_ds_db
		lstr_detail1[1].ds_pk_data[9] .dataobject = 'd_valueset_entry_grid'
		laa_arg[1] = '=u_valueset_entry@qmdn'
		lstr_detail1[1].ds_pk_data[9] .f_add_where( 'menu_code', laa_arg[])
		lstr_detail1[1].ds_pk_data[9] .f_settransobject( sqlca)
		lstr_detail1[1].ds_pk_data[9] .retrieve( )	
		
		//--TYPE_CUSTOMER--//
		lstr_detail1[1].ds_pk_data[10] = create t_ds_db
		lstr_detail1[1].ds_pk_data[10].dataobject = 'd_valueset_entry_grid'
		laa_arg[1] = '=u_valueset_entry@lkh'
		lstr_detail1[1].ds_pk_data[10].f_add_where( 'menu_code', laa_arg[])
		lstr_detail1[1].ds_pk_data[10].f_settransobject( sqlca)
		lstr_detail1[1].ds_pk_data[10].retrieve( )	
		
		if ls_ins_or_upd = 'ins' then
			if upperbound(las_value_detail1) = 0 then las_value_detail1[upperbound(lstr_detail1[])] = ''
			if this.f_import_data( lt_transaction, ldw_interface, ll_row_import,lstr_master,lstr_detail1[], true,ls_value_master,las_value_detail1) = -1 then return -1
		else
			ls_code = ldw_interface.getitemstring( ll_row_import, 'code')
			lb_ins.is_table = 'CUSTOMER'
			lb_ins.f_get_objects_id( ls_code, ladb_id[])
			//-- update object --//
			if this.f_update_data( lt_transaction, ldw_interface, ll_row_import, lstr_master, lstr_master,  0,'CUSTOMER') = -1 then return -1
			//--object_customer--//
			if this.f_update_data( lt_transaction, ldw_interface, ll_row_import, lstr_detail1[1], lstr_master, ladb_id[1],'CUSTOMER') = -1 then return -1
		end if
		//-----------------------//
		//-- import detail 2 --//
		//-----------------------//
		// -- ORGANIZATION --//
		lstr_detail2[1].s_table = 'ORGANIZATION'
		lstr_detail2[1].s_t_colnames = 'company_id,branch_id,created_by, created_date,last_mdf_by, last_mdf_date,REGISTER_NUMBER,TAX_NUMBER,WEBSITE,INVOICE_SIGN,INVOICE_CODE'
		lstr_detail2[1].s_dwi_colnames = 'company_id,branch_id,created_by, created_date,last_mdf_by, last_mdf_date,REGISTER_NUMBER,TAX_NUMBER,WEBSITE,INVOICE_SIGN,INVOICE_CODE'
		lstr_detail2[1].s_fk_colnames =  ''
		lstr_detail2[1].s_pk_colnames =  ''
		lstr_detail2[1].s_upd_colname = 'REGISTER_NUMBER,TAX_NUMBER,WEBSITE,INVOICE_SIGN,INVOICE_CODE'
		lstr_detail2[1].s_dwu_colnames = 'REGISTER_NUMBER,TAX_NUMBER,WEBSITE,INVOICE_SIGN,INVOICE_CODE'
		
		//-- PEOPLE --//
		lstr_detail2[2].s_table = 'PEOPLE'
		lstr_detail2[2].s_t_colnames = 'created_by, created_date,last_mdf_by, last_mdf_date,LAST_NAME,FIRST_NAME,EMAIL,DATE_OF_BIRTH,PHONE,TITLE'
		lstr_detail2[2].s_dwi_colnames = 'created_by, created_date,last_mdf_by, last_mdf_date,LAST_NAME,FIRST_NAME,EMAIL,DATE_OF_BIRTH,PHONE,TITLE'
		lstr_detail2[2].s_fk_colnames =  ''
		lstr_detail2[2].s_pk_colnames =  ''
		lstr_detail2[2].s_upd_colname = 'LAST_NAME,FIRST_NAME,EMAIL,DATE_OF_BIRTH,PHONE,TITLE'
		lstr_detail2[2].s_dwu_colnames = 'LAST_NAME,FIRST_NAME,EMAIL,DATE_OF_BIRTH,PHONE,TITLE'
		
		//--BUSINESS_ADDRESS--//
		lstr_detail2[3].s_table = 'BUSINESS_ADDRESS'
		lstr_detail2[3].s_t_colnames = 'created_by, created_date,last_mdf_by, last_mdf_date,NAME,TEL,FAX,ADDRESS,PURPOSE,ACTIVE_YN'
		lstr_detail2[3].s_dwi_colnames = 'created_by, created_date,last_mdf_by, last_mdf_date,OFFICE_NAME,OFFICE_TEL,OFFICE_FAX,ADDRESS,PURPOSE,ADD_ACTIVE_YN'
		lstr_detail2[3].s_fk_colnames =  ''
		lstr_detail2[3].s_pk_colnames =  ''
		lstr_detail2[3].s_upd_colname = 'NAME,TEL,FAX,ADDRESS,PURPOSE,ACTIVE_YN'
		lstr_detail2[3].s_dwu_colnames = 'OFFICE_NAME,OFFICE_TEL,OFFICE_FAX,ADDRESS,PURPOSE,ADD_ACTIVE_YN'
		
		if ls_ins_or_upd = 'ins' then
			if upperbound(las_value_detail2) = 0 then  las_value_detail2[upperbound(lstr_detail2[])] = ''
			if this.f_import_data( lt_transaction, ldw_interface, ll_row_import,lstr_detail1[1],lstr_detail2[], false,ls_value_master,las_value_detail2) = -1 then return -1
		else
			//--update ORGANIZATION --//
			if this.f_update_data( lt_transaction, ldw_interface, ll_row_import, lstr_detail2[1], lstr_detail1[1], ladb_id[2],'CUSTOMER') = -1 then return -1
			//--update PEOPLE --//
			if this.f_update_data( lt_transaction, ldw_interface, ll_row_import, lstr_detail2[2], lstr_detail1[1], ladb_id[2],'CUSTOMER') = -1 then return -1
			//--update BUSINESS_ADDRESS --//
			if this.f_update_data( lt_transaction, ldw_interface, ll_row_import, lstr_detail2[3], lstr_detail1[1], ladb_id[2],'CUSTOMER') = -1 then return -1
		end if
		
		//--------------------//
		//import detail 3--//
		//-------------------//
		//-- PEOPLE --//
		
		lstr_detail3[1].s_table = 'PEOPLE'
		lstr_detail3[1].s_t_colnames = 'created_by, created_date,last_mdf_by, last_mdf_date,LAST_NAME,FIRST_NAME,EMAIL,DATE_OF_BIRTH,PHONE,TITLE,MAIN_YN'
		lstr_detail3[1].s_dwi_colnames = 'created_by, created_date,last_mdf_by, last_mdf_date,CONTACT_LASTNAME,CONTACT_FIRSTNAME,CONTACT_EMAIL,CONTACT_BIRTHDAY,CONTACT_PHONE,CONTACT_TITLE,MAIN_YN'
		lstr_detail3[1].s_fk_colnames =  ''
		lstr_detail3[1].s_pk_colnames =  ''	
		lstr_detail3[1].s_upd_colname = 'LAST_NAME,FIRST_NAME,EMAIL,DATE_OF_BIRTH,PHONE,TITLE,MAIN_YN'
		lstr_detail3[1].s_dwu_colnames = 'CONTACT_LASTNAME,CONTACT_FIRSTNAME,CONTACT_EMAIL,CONTACT_BIRTHDAY,CONTACT_PHONE,CONTACT_TITLE,MAIN_YN'
		
		if ls_ins_or_upd = 'ins' then
			if upperbound(las_value_detail3) = 0 then  las_value_detail3[upperbound(lstr_detail3[])] = ''
			if this.f_import_data( lt_transaction, ldw_interface, ll_row_import,lstr_detail2[3],lstr_detail3[], false,ls_value_master,las_value_detail3) = -1 then return -1
		else
			if this.f_update_data( lt_transaction, ldw_interface, ll_row_import, lstr_detail3[1], lstr_detail2[3], ladb_id[5],'CUSTOMER') = -1 then return -1
		end if
		
		ldw_interface.deleterow(ll_row_import)
		ll_rowcnt++
		ll_row_import = ldw_interface.find(" chk_text = 'OK'", ll_row_import ,ldw_interface.rowcount()+1)
		lstr_master.s_imported_val = ''
		lstr_detail1[1].s_imported_val = ''
		lstr_detail2[1].s_imported_val = ''
		lstr_detail2[2].s_imported_val = ''
		lstr_detail2[3].s_imported_val = ''
		lstr_detail3[1].s_imported_val = ''
		ll_count++
		if ll_count = 100 then
			commit using lt_transaction;
			ll_count = 0
		end if
	LOOP
end if

if ldw_interface.update(true, false ) = 1 then
	commit using lt_transaction;
	gf_messagebox('m.c_item_interface.01','Thông báo','Nạp dữ liệu hoàn thành, số record đã nạp :@'+string(ll_rowcnt), 'information','ok',1)
else
	rollback  using lt_transaction;
	gf_messagebox('m.c_item_interface.01','Thông báo','Lỗi nạp dữ liệu :@'+ lt_transaction.sqlerrtext , 'exclamation','ok',1)
end if

return 1
end event

public subroutine f_set_dwo_window ();

istr_dwo[1].s_dwo_default = 'd_cust_interface_parm_form' 
istr_dwo[1].s_dwo_form = 'd_cust_interface_parm_form'
istr_dwo[1].s_dwo_grid = ''
istr_dwo[1].b_master = false
istr_dwo[1].s_dwo_master = ''
istr_dwo[1].b_detail = false
istr_dwo[1].b_focus_master = false
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_details = ''
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = true
istr_dwo[1].b_keyboardlocked = false
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = false
istr_dwo[1].b_excel = false
istr_dwo[1].s_description = 'Chọn bảng dữ liệu'

istr_dwo[2].s_dwo_default = 'd_customer_interface_grid' 
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_customer_interface_grid'
istr_dwo[2].b_master = false
istr_dwo[2].s_dwo_details = ''
istr_dwo[2].b_cascade_del = false
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_description = 'Thông tin khách hàng'

end subroutine

on c_customer_interface.create
call super::create
end on

on c_customer_interface.destroy
call super::destroy
end on

event constructor;call super::constructor;
is_table = 'object'
is_display_model = '2d'
ib_keyboardlocked = false
ib_changed_dwo_4edit = false

is_object_title = 'Nạp dữ liệu từ excel'

istr_actionpane[1].s_button_name = 'b_add;b_insert;b_modify;b_load_file;b_check;b_process; b_refresh;b_delete;'
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title
end event

event e_window_e_preopen;call super::e_window_e_preopen;
iw_display.dynamic f_set_ii_upperpart_height(200)
return 0
end event

event e_window_open;call super::e_window_open;

t_dw_mpl			ldw_parm, ldw_customer



ldw_parm = iw_display.f_get_dw('d_cust_interface_parm_form')
ldw_parm.insertrow( 0)
ldw_customer =  this.iw_display.dynamic f_get_dw( 2)
this.iw_display.f_set_idwfocus(ldw_customer)

this.f_ctrl_actionbuttons(ldw_customer)

return  1
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_filteron;b_query;b_refresh;b_delete;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query; b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_load_file;b_check;b_process; b_refresh;b_delete;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_insert;b_modify;b_query;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_insert;b_modify;b_blank; b_load_file;b_check;b_process; b_refresh;b_delete;'
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

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;string					ls_dwo
t_dw_mpl			ldw_item
t_transaction		lt_transaction

if rpo_dw.dataobject = 'd_cust_interface_parm_form' and vs_colname = 'dwo_name' then
	ldw_item = this.iw_display.dynamic f_get_dw( 2)
	
	if ldw_item.f_get_ib_editing( ) then
		ls_dwo = rpo_dw.getitemstring(vl_currentrow,vs_colname)
		gf_messagebox('m.c_customer_interface.e_dw_e_itemchanged.01','Thông báo','Phải lưu trước khi thay đổi bảng nạp dữ liệu','exclamation','ok',1)
		rpo_dw.setitem(vl_currentrow, vs_colname,ls_dwo) 
		return 1
	end if
	if vs_editdata <>'' then
		
		ldw_item.dataobject = vs_editdata
		this.iw_display.f_get_transaction( lt_transaction)
		ldw_item.settransobject(lt_transaction )
		ldw_item.event e_retrieve( )
		ldw_item.is_focus_colname = ''
	end if
end if
return 0
end event

event e_dw_e_save;call super::e_dw_e_save;
if rpo_dw.dataobject = 'd_cust_interface_parm_form' then
	return 0
end if
return ancestorreturnvalue
end event

event e_window_e_refresh;call super::e_window_e_refresh;
return 1
end event

event e_dw_e_preretrieve_start;call super::e_dw_e_preretrieve_start;
if rpo_dw.dataobject = 'd_cust_interface_parm_form' then
	return -9
end if
end event

event e_dw_getfocus;call super::e_dw_getfocus;
if rdw_handling.dataobject = 'd_cust_interface_parm_form' then 
	return -9
end if
return ancestorReturnValue
end event

