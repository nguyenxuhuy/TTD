$PBExportHeader$c_item_interface.sru
forward
global type c_item_interface from b_interface
end type
end forward

global type c_item_interface from b_interface
event type integer e_action_load_file ( )
event type integer e_action_check ( )
event type integer e_action_process ( )
end type
global c_item_interface c_item_interface

forward prototypes
public subroutine f_set_dwo_window ()
public function integer f_update_active_yn (t_dw_mpl vdw_interface, string vs_price_type)
end prototypes

event type integer e_action_load_file();
t_transaction	lt_transaction
t_dw_mpl		ldw_interface
t_ds_db			lds_interface
OLEobject		lole_excel, lole_worksheet
long 				ll_idx


lole_excel = create OLEobject

if this.f_load_excelfile( lole_excel) = -1 then return -1

this.iw_display.f_get_transaction( lt_transaction)
ldw_interface = this.iw_display.dynamic f_get_dw( 2)
lds_interface = create t_ds_db
lds_interface.dataobject = ldw_interface.dataobject
lds_interface.f_settransobject(lt_transaction)

lole_worksheet = lole_excel.ActiveWorkbook.ActiveSheet
if this.f_load_worksheet2datastore(lole_worksheet, lds_interface, 1, 1) = -1 then return -1
lole_excel.application.quit()
lole_excel.DisconnectObject()
destroy lole_Excel

for ll_idx = 1 to lds_interface.rowcount( )
	if pos(lds_interface.dataobject,'sal_price') > 0 then
		lds_interface.setitem( ll_idx, 'object_type', 'CUSTOMER')
	elseif pos(lds_interface.dataobject,'pur_price') > 0 then
		lds_interface.setitem( ll_idx, 'object_type', 'VENDOR')
	end if
next
if lds_interface.update(true, false ) = 1 then
	commit using lt_transaction;
	ldw_interface.event e_refresh( )
	gf_messagebox('m.c_item_interface.e_action_load_file.01','Thông báo','Hoàn thành nạp dữ liệu','information','ok',1)
else
	gf_messagebox('m.c_item_interface.e_action_load_file.01','Thông báo','Lỗi nạp dữ liệu :@'+ lt_transaction.sqlerrtext ,'exclamation','ok',1)
	rollback using lt_transaction;
	return -1
end if

return 1
end event

event type integer e_action_check();any 					laa_arg[], laa_empty[]
long					ll_row
string					ls_duplicated_colnames,ls_sort
boolean				lb_chk_dulicated
t_dw_mpl			ldw_interface
t_ds_db				lds_item_code, lds_foreign_key

//=================//
//-- Kiểm tra trùng dữ liệu --//
//------------------------------//
ldw_interface = this.iw_display.dynamic f_get_dw( 2)
if ldw_interface.rowcount( ) = 0 then	return 0
this.iw_display.setredraw( false)
lds_item_code = create t_ds_db
ls_sort = ldw_interface.describe( "datawindow.table.sort")
if ldw_interface.dataobject = 'd_item_interface_grid' then	
	//-- kiểm tra trùng dữ liệu database item_code --//
	lds_item_code.dataobject = 'ds_object'
	laa_arg[1] = gi_user_comp_id
	laa_arg[2] = '=Y'
	laa_arg[3] = '=ITEM'	
	lds_item_code.f_add_where( 'company_id;active_yn;object_ref_table;', laa_arg[])
	lds_item_code.f_settransobject( sqlca)
	lds_item_code.retrieve( )
	if this.f_chk_interface_duplicated_data( ldw_interface,'item_code' , lds_item_code, 'code') = -1 then return -1	
	//-- kiểm tra trùng quy cách trong 1 mã hàng --//
	
	//--Kiểm tra trùng barcode khác mã hàng , trùng barcode của 1 mã hàng--//
elseif ldw_interface.dataobject = 'd_pur_price_interface_grid' then
	//-- kiểm tra trùng dữ liệu trên dữ liệu import--//
	FOR ll_row = 1 to ldw_interface.rowcount()
		lb_chk_dulicated = this.idwsetup_initial.f_is_duplicated_data(ldw_interface, ll_row, ls_duplicated_colnames)
		if isnull(lb_chk_dulicated) then return -1
		if lb_chk_dulicated  then	
			//-- update check_text --//
			this.f_set_check_text(ldw_interface , ls_duplicated_colnames, ll_row, 'Trùng dữ liệu, cột')
		else
			this.f_set_check_text(ldw_interface , ls_duplicated_colnames, ll_row, 'OK')
		end if
	NEXT
elseif ldw_interface.dataobject = 'd_sal_price_interface_grid' then
	//-- kiểm tra trùng dữ liệu trên dữ liệu import--//
	FOR ll_row = 1 to ldw_interface.rowcount()
		lb_chk_dulicated = this.idwsetup_initial.f_is_duplicated_data(ldw_interface, ll_row,ls_duplicated_colnames)
		if isnull(lb_chk_dulicated) then return -1
		if lb_chk_dulicated then
			this.f_set_check_text(ldw_interface , ls_duplicated_colnames, ll_row, 'Trùng dữ liệu, cột')
		else
			this.f_set_check_text(ldw_interface , ls_duplicated_colnames, ll_row, 'OK')
		end if
	NEXT	
elseif ldw_interface.dataobject = 'd_pur_tariff_price_interface_grid' then
	//-- kiểm tra trùng dữ liệu --//
	
end if
//===============//
//-- kiểm tra foreignkey --//
//---------------------------//
lds_foreign_key = create t_ds_db
if ldw_interface.dataobject = 'd_item_interface_grid' then	
	//-- kiểm tra cột manage_grp_code --//
	lds_foreign_key.dataobject = 'd_valueset_entry_grid'
	laa_arg[] = laa_empty[]
	laa_arg[1] = '=u_valueset_entry@item_group'
	lds_foreign_key.f_add_where( 'menu_code', laa_arg[])
	lds_foreign_key.f_settransobject( sqlca)
	lds_foreign_key.retrieve( )		
	if this.f_chk_interface_foreignkey( ldw_interface, 'manage_grp_code', lds_foreign_key, 'code') = -1 then return -1
	//-- kiểm tra cột post_grp_code --//
	lds_foreign_key.dataobject = 'd_valueset_entry_grid'
	laa_arg[] = laa_empty[]
	laa_arg[1] = '=u_valueset_entry@item_posting'
	lds_foreign_key.f_add_where( 'menu_code', laa_arg[])
	lds_foreign_key.f_settransobject( sqlca)
	lds_foreign_key.retrieve( )		
	if this.f_chk_interface_foreignkey( ldw_interface, 'post_grp_code', lds_foreign_key, 'code') = -1 then return -1
	
	//--uom_code--//
	lds_foreign_key.dataobject = 'd_uom_grid'
	lds_foreign_key.f_settransobject( sqlca)
	lds_foreign_key.retrieve( )		
	if this.f_chk_interface_foreignkey( ldw_interface, 'uom_code', lds_foreign_key, 'code') = -1 then return	-1
	//--round_code--/
	lds_foreign_key.dataobject = 'd_rounding_grid'
	lds_foreign_key.f_settransobject( sqlca)
	lds_foreign_key.retrieve( )		
	if this.f_chk_interface_foreignkey( ldw_interface, 'round_code', lds_foreign_key, 'code') = -1 then return -1		
	//--handle_by--//
	lds_foreign_key.dataobject = 'ds_object'
	laa_arg[] = laa_empty[]
	laa_arg[1] = gi_user_comp_id
	laa_arg[2] = '=Y'
	laa_arg[3] = '=STAFF'	
	lds_foreign_key.f_add_where( 'company_id;active_yn;object_ref_table;', laa_arg[])
	lds_foreign_key.f_settransobject( sqlca)
	lds_foreign_key.retrieve( )
	if this.f_chk_interface_foreignkey( ldw_interface,'handled_name' , lds_foreign_key, 'NAME') = -1 then return -1	
	//-- kiểm tra spec_code --//
elseif ldw_interface.dataobject = 'd_pur_price_interface_grid' then
//	item_code
	lds_foreign_key.dataobject = 'ds_object'
	laa_arg[] = laa_empty[]
	laa_arg[1] = gi_user_comp_id
	laa_arg[2] = '=Y'
	laa_arg[3] = '=ITEM'	
	lds_foreign_key.f_add_where( 'company_id;active_yn;object_ref_table;', laa_arg[])
	lds_foreign_key.f_settransobject( sqlca)
	lds_foreign_key.retrieve( )
	if this.f_chk_interface_foreignkey( ldw_interface,'item_code' , lds_foreign_key, 'code') = -1 then return -1	
//	spec_code

//	vendor_code
	lds_foreign_key.dataobject = 'ds_object'
	laa_arg[] = laa_empty[]
	laa_arg[1] = gi_user_comp_id
	laa_arg[2] = '=Y'
	laa_arg[3] = '=VENDOR'	
	lds_foreign_key.f_add_where( 'company_id;active_yn;object_ref_table;', laa_arg[])
	lds_foreign_key.f_settransobject( sqlca)
	lds_foreign_key.retrieve( )
	if this.f_chk_interface_foreignkey( ldw_interface,'vendor_code' , lds_foreign_key, 'code') = -1 then return -1	
//	vendor_group
	lds_foreign_key.dataobject = 'd_valueset_entry_grid'
	laa_arg[] = laa_empty[]
	laa_arg[1] = '=u_valueset_entry@vend_grp'
	lds_foreign_key.f_add_where( 'menu_code', laa_arg[])
	lds_foreign_key.f_settransobject( sqlca)
	lds_foreign_key.retrieve( )		
	if this.f_chk_interface_foreignkey( ldw_interface, 'vendor_group', lds_foreign_key, 'code') = -1 then return -1
//	curr_code
	lds_foreign_key.dataobject = 'd_currency_grid'
	lds_foreign_key.f_settransobject( sqlca)
	lds_foreign_key.retrieve( )		
	if this.f_chk_interface_foreignkey( ldw_interface, 'curr_code', lds_foreign_key, 'code') = -1 then return -1		
elseif ldw_interface.dataobject = 'd_sal_price_interface_grid' then //-- sal_price --//
//	item_code
	lds_foreign_key.dataobject = 'ds_object'
	laa_arg[] = laa_empty[]
	laa_arg[1] = gi_user_comp_id
	laa_arg[2] = '=Y'
	laa_arg[3] = '=ITEM'	
	lds_foreign_key.f_add_where( 'company_id;active_yn;object_ref_table;', laa_arg[])
	lds_foreign_key.f_settransobject( sqlca)
	lds_foreign_key.retrieve( )
	if this.f_chk_interface_foreignkey( ldw_interface,'item_code' , lds_foreign_key, 'code') = -1 then return -1	
//	spec_code

//	cust_code
	lds_foreign_key.dataobject = 'ds_object'
	laa_arg[] = laa_empty[]
	laa_arg[1] = gi_user_comp_id
	laa_arg[2] = '=Y'
	laa_arg[3] = '=CUSTOMER'	
	lds_foreign_key.f_add_where( 'company_id;active_yn;object_ref_table;', laa_arg[])
	lds_foreign_key.f_settransobject( sqlca)
	lds_foreign_key.retrieve( )
	if this.f_chk_interface_foreignkey( ldw_interface,'cust_code' , lds_foreign_key, 'code') = -1 then return -1	
//	cust_group
	lds_foreign_key.dataobject = 'd_valueset_entry_grid'
	laa_arg[] = laa_empty[]
	laa_arg[1] = '=u_valueset_entry@cust_grp'
	lds_foreign_key.f_add_where( 'menu_code', laa_arg[])
	lds_foreign_key.f_settransobject( sqlca)
	lds_foreign_key.retrieve( )		
	if this.f_chk_interface_foreignkey( ldw_interface, 'cust_group', lds_foreign_key, 'code') = -1 then return -1
//	curr_code
	lds_foreign_key.dataobject = 'd_currency_grid'
	lds_foreign_key.f_settransobject( sqlca)
	lds_foreign_key.retrieve( )		
	if this.f_chk_interface_foreignkey( ldw_interface, 'curr_code', lds_foreign_key, 'code') = -1 then return -1			
	
//  staff_code
	lds_foreign_key.dataobject = 'ds_object'
	laa_arg[] = laa_empty[]
	laa_arg[1] = gi_user_comp_id
	laa_arg[2] = '=Y'
	laa_arg[3] = '=STAFF'	
	lds_foreign_key.f_add_where( 'company_id;active_yn;object_ref_table;', laa_arg[])
	lds_foreign_key.f_settransobject( sqlca)
	lds_foreign_key.retrieve( )
	if this.f_chk_interface_foreignkey( ldw_interface,'staff_code' , lds_foreign_key, 'code') = -1 then return -1	
//  staff_group
else	//-- tariff price --//
//	item_code
	lds_foreign_key.dataobject = 'ds_object'
	laa_arg[] = laa_empty[]
	laa_arg[1] = gi_user_comp_id
	laa_arg[2] = '=Y'
	laa_arg[3] = '=ITEM'	
	lds_foreign_key.f_add_where( 'company_id;active_yn;object_ref_table;', laa_arg[])
	lds_foreign_key.f_settransobject( sqlca)
	lds_foreign_key.retrieve( )
	if this.f_chk_interface_foreignkey( ldw_interface,'item_code' , lds_foreign_key, 'code') = -1 then return -1	
//	spec_code

//	vendor_code
	lds_foreign_key.dataobject = 'ds_object'
	laa_arg[] = laa_empty[]
	laa_arg[1] = gi_user_comp_id
	laa_arg[2] = '=Y'
	laa_arg[3] = '=VENDOR'	
	lds_foreign_key.f_add_where( 'company_id;active_yn;object_ref_table;', laa_arg[])
	lds_foreign_key.f_settransobject( sqlca)
	lds_foreign_key.retrieve( )
	if this.f_chk_interface_foreignkey( ldw_interface,'vendor_code' , lds_foreign_key, 'code') = -1 then return -1	
//	vendor_group
	lds_foreign_key.dataobject = 'd_valueset_entry_grid'
	laa_arg[] = laa_empty[]
	laa_arg[1] = '=u_discount_vendor_price_gr' //u_discount_vendor_price
	lds_foreign_key.f_add_where( 'menu_code', laa_arg[])
	lds_foreign_key.f_settransobject( sqlca)
	lds_foreign_key.retrieve( )		
	if this.f_chk_interface_foreignkey( ldw_interface, 'vendor_group', lds_foreign_key, 'code') = -1 then return -1
//	curr_code
	lds_foreign_key.dataobject = 'd_currency_grid'
	lds_foreign_key.f_settransobject( sqlca)
	lds_foreign_key.retrieve( )		
	if this.f_chk_interface_foreignkey( ldw_interface, 'curr_code', lds_foreign_key, 'code') = -1 then return -1		
end if
//=====================//
//-- kiểm tra bắt buộc có dữ liệu --//
//------------------------------------//
this.f_chk_interface_must_data( ldw_interface) 
this.iw_display.setredraw( true)
gf_messagebox('m.c_item_interface.e_action_check.01','Thông báo','Kiểm tra hoàn thành','information','ok',1)
if ls_sort <> '?' then 	ldw_interface.setsort(ls_sort)
if ls_sort = '?' then ldw_interface.setsort('')
ldw_interface.sort( )
return 1
end event

event type integer e_action_process();t_transaction				lt_transaction
t_dw_mpl					ldw_interface
t_ds_db						lds_m_fk_data[],lds_d1_fk_data[],lds_d2_fk_data[], lds_d3_fk_data[]
t_ds_db						lds_fk_manage_group, lds_fk_post_group, lds_fk_staff,lds_price

string							ls_m_table, ls_m_colnames, ls_m_refcol, ls_m_fk_col, ls_d1_table, ls_d1_colnames, ls_d1_ref_col
string							ls_d1_fk_col, ls_d2_table, ls_d2_colnames, ls_d2_fk_col,  ls_d3_table, ls_d3_colnames, ls_d3_fk_col
string							ls_mt_colnames, ls_d1t_colnames, ls_d2t_colnames, ls_d3t_colnames
string							ls_m_pk_col, ls_d1_pk_col, ls_d2_pk_col, ls_d3_pk_col,ls_price_type
any							laa_arg[], laa_empty[]
long							ll_rowcnt

//-- import vào table --//
this.iw_display.f_get_transaction(lt_transaction )
ldw_interface = this.iw_display.dynamic f_get_dw( 2)
if ldw_interface.dataobject = 'd_item_interface_grid' then
	ls_m_table = 'OBJECT'
	ls_m_colnames = 'company_id,branch_id,created_by, created_date,last_mdf_by, last_mdf_date,item_code,item_name, SHORT_NAME, manage_grp_code,post_grp_code,HANDLED_NAME,ACTIVE_YN'
	ls_mt_colnames = 'company_id,branch_id,created_by, created_date,last_mdf_by, last_mdf_date,code,name,SHORT_NAME, manage_group,posting_group,HANDLED_BY,ACTIVE_YN'
	ls_m_fk_col = 'manage_grp_code,post_grp_code,HANDLED_NAME'	
	ls_m_pk_col = 'code,code,STAFF_NAME'
	
	lds_m_fk_data[1] = create t_ds_db
	lds_m_fk_data[1].dataobject = 'd_valueset_entry_grid'
	laa_arg[1] = '=u_valueset_entry@item_group'
	lds_m_fk_data[1].f_add_where( 'menu_code', laa_arg[])
	lds_m_fk_data[1].f_settransobject( sqlca)
	lds_m_fk_data[1].retrieve( )		
	
	lds_m_fk_data[2] = create t_ds_db
	lds_m_fk_data[2].dataobject = 'd_valueset_entry_grid'
	laa_arg[1] = '=u_valueset_entry@item_posting'
	lds_m_fk_data[2].f_add_where( 'menu_code', laa_arg[])
	lds_m_fk_data[2].f_settransobject( sqlca)
	lds_m_fk_data[2].retrieve( )			

	lds_m_fk_data[3] = create t_ds_db
	lds_m_fk_data[3].dataobject = 'd_role_user_grid'
	lds_m_fk_data[3].f_settransobject( sqlca)
	lds_m_fk_data[3].retrieve( )			
	
	ls_d1_table = 'ITEM'
	ls_d1_colnames = 'company_id,branch_id,created_by, created_date,last_mdf_by, last_mdf_date,uom_code, round_code,qty_yn,value_yn,lot_yn,serial_yn,cost_method,'+&
							'origin,manufacturers,factory_address,min_stock,max_stock,catch_item_yn,note'
	ls_d1t_colnames = 'company_id,branch_id,created_by, created_date,last_mdf_by, last_mdf_date,STOCK_UOM, ROUND_ID,QUANTITY_YN,value_yn,lot_yn,serial_yn,cost_method,'+&
							'origin,manufacturers,ADDRESS,min_stock,max_stock,catch_item_yn, note'							
	ls_d1_fk_col = 'uom_code, round_code'
	ls_d1_pk_col = 'code, code'
	
	lds_d1_fk_data[1] = create t_ds_db
	lds_d1_fk_data[1].dataobject = 'd_uom_grid'
	lds_d1_fk_data[1].f_settransobject( sqlca)
	lds_d1_fk_data[1].retrieve( )				

	lds_d1_fk_data[2] = create t_ds_db
	lds_d1_fk_data[2].dataobject = 'd_rounding_grid'
	lds_d1_fk_data[2].f_settransobject( sqlca)
	lds_d1_fk_data[2].retrieve( )		
	
elseif  ldw_interface.dataobject = 'd_pur_price_interface_grid' then
	ls_price_type = 'PURCHASE'
	ls_m_table = 'ITEM_PRICE'
	ls_m_colnames = 'company_id,branch_id,created_by, created_date,last_mdf_by, last_mdf_date,item_code,ITEM_APPLIED_TYPE, PRICE_TYPE, SPEC_CODE,OBJECT_APPLIED_TYPE,'+&
							'VENDOR_CODE,VENDOR_GROUP, WHOLESALES_PRICE, FROM_QTY,TO_QTY,F_DATE,T_DATE,CURR_CODE,DISCOUNT_AMOUNT,DISCOUNT_PCT,object_type'
	ls_mt_colnames =  'company_id,branch_id,created_by, created_date,last_mdf_by, last_mdf_date,ITEM_ID,ITEM_APPLIED_TYPE, PRICE_TYPE, SPEC_ID,OBJECT_APPLIED_TYPE,'+&
							'APPLIED_OBJECT_ID,OBJECT_MANAGE_GROUP, WHOLESALES_PRICE, FROM_QTY,TO_QTY,F_DATE,T_DATE,CURRENCY_ID,DISCOUNT_AMOUNT,DISCOUNT_PCT,object_type'
	ls_m_fk_col = 'item_code,SPEC_CODE,VENDOR_CODE,VENDOR_GROUP,CURR_CODE'	
	ls_m_pk_col = 'code,code,code,code,code,code'

	lds_m_fk_data[1] = create t_ds_db
	lds_m_fk_data[1] .dataobject = 'ds_object'
	laa_arg[1] = gi_user_comp_id
	laa_arg[2] = '=Y'
	laa_arg[3] = '=ITEM'	
	lds_m_fk_data[1] .f_add_where( 'company_id;active_yn;object_ref_table;', laa_arg[])
	lds_m_fk_data[1] .f_settransobject( sqlca)
	lds_m_fk_data[1] .retrieve( )	
	
	lds_m_fk_data[2] = create t_ds_db
	lds_m_fk_data[2].dataobject = 'd_item_spec_grid'
	lds_m_fk_data[2].f_settransobject( sqlca)
	lds_m_fk_data[2].retrieve( )		
	
	lds_m_fk_data[3] = create t_ds_db
	lds_m_fk_data[3] .dataobject = 'ds_object'
	laa_arg[1] = gi_user_comp_id
	laa_arg[2] = '=Y'
	laa_arg[3] = '=VENDOR'	
	lds_m_fk_data[3] .f_add_where( 'company_id;active_yn;object_ref_table;', laa_arg[])
	lds_m_fk_data[3] .f_settransobject( sqlca)
	lds_m_fk_data[3] .retrieve( )	

	lds_m_fk_data[4] = create t_ds_db
	lds_m_fk_data[4].dataobject = 'd_valueset_entry_grid'
	laa_arg[] = laa_empty[]
	laa_arg[1] = '=u_valueset_entry@vend_grp'
	lds_m_fk_data[4].f_add_where( 'menu_code', laa_arg[])
	lds_m_fk_data[4].f_settransobject( sqlca)
	lds_m_fk_data[4].retrieve( )			
	
	lds_m_fk_data[5] = create t_ds_db
	lds_m_fk_data[5].dataobject = 'd_currency_grid'
	lds_m_fk_data[5].f_settransobject( sqlca)
	lds_m_fk_data[5].retrieve( )				
elseif ldw_interface.dataobject = 'd_sal_price_interface_grid' then
	ls_price_type = 'SALES'
	ls_m_table = 'ITEM_PRICE'
	ls_m_colnames = 'company_id,branch_id,created_by, created_date,last_mdf_by, last_mdf_date,item_code,SPEC_CODE,ITEM_APPLIED_TYPE, PRICE_TYPE,OBJECT_APPLIED_TYPE,'+&
							'CUST_CODE,CUST_GROUP,WHOLESALES_PRICE,FROM_QTY,TO_QTY,F_DATE,T_DATE,CURR_CODE,DISCOUNT_AMOUNT,DISCOUNT_PCT,'+&
							'STAFF_APPLIED_TYPE,STAFF_GROUP,STAFF_CODE,object_type'
	ls_mt_colnames =  'company_id,branch_id,created_by, created_date,last_mdf_by, last_mdf_date,item_id,SPEC_ID,ITEM_APPLIED_TYPE, PRICE_TYPE,OBJECT_APPLIED_TYPE,'+&
							 'APPLIED_OBJECT_ID,OBJECT_MANAGE_GROUP,WHOLESALES_PRICE,FROM_QTY,TO_QTY,F_DATE,T_DATE,currency_id,DISCOUNT_AMOUNT,DISCOUNT_PCT,'+&
							 'STAFF_APPLIED_TYPE,STAFF_MANAGE_GROUP,APPLIED_OBJECT_STAFF,object_type'
	ls_m_fk_col = 'item_code,SPEC_CODE,CUST_CODE,CUST_GROUP,CURR_CODE,STAFF_GROUP,STAFF_CODE'
	ls_m_pk_col =  'code,code,code,code,code,code,code'
	
	//-- kiểm tra cột manage_grp_code --//
	lds_m_fk_data[1] = create t_ds_db
	lds_m_fk_data[1] .dataobject = 'ds_object'
	laa_arg[1] = gi_user_comp_id
	laa_arg[2] = '=Y'
	laa_arg[3] = '=ITEM'
	lds_m_fk_data[1] .f_add_where( 'company_id;active_yn;object_ref_table;', laa_arg[])
	lds_m_fk_data[1] .f_settransobject( sqlca)
	lds_m_fk_data[1] .retrieve( )	

	lds_m_fk_data[2] = create t_ds_db
	lds_m_fk_data[2].dataobject = 'd_item_spec_grid'
	lds_m_fk_data[2].f_settransobject( sqlca)
	lds_m_fk_data[2].retrieve( )	

	lds_m_fk_data[3] = create t_ds_db
	lds_m_fk_data[3].dataobject = 'ds_object'
	laa_arg[] = laa_empty[]
	laa_arg[1] = gi_user_comp_id
	laa_arg[2] = '=Y'
	laa_arg[3] = '=CUSTOMER'	
	lds_m_fk_data[3].f_add_where( 'company_id;active_yn;object_ref_table;', laa_arg[])
	lds_m_fk_data[3].f_settransobject( sqlca)
	lds_m_fk_data[3].retrieve( )		

	
	lds_m_fk_data[4] = create t_ds_db
	lds_m_fk_data[4].dataobject = 'd_valueset_entry_grid'
	laa_arg[] = laa_empty[]
	laa_arg[1] = '=u_valueset_entry@cust_grp'
	lds_m_fk_data[4].f_add_where( 'menu_code', laa_arg[])
	lds_m_fk_data[4].f_settransobject( sqlca)
	lds_m_fk_data[4].retrieve( )	

	lds_m_fk_data[5] = create t_ds_db
	lds_m_fk_data[5].dataobject = 'd_currency_grid'
	lds_m_fk_data[5].f_settransobject( sqlca)
	lds_m_fk_data[5].retrieve( )	
	
	lds_m_fk_data[6] = create t_ds_db
	lds_m_fk_data[6].dataobject = 'ds_object'
	laa_arg[] = laa_empty[]
	laa_arg[1] = gi_user_comp_id
	laa_arg[2] = '=LEGALENTITY'	
	lds_m_fk_data[6].f_add_where( 'company_id;object_ref_table;', laa_arg[])
	lds_m_fk_data[6].f_settransobject( sqlca)
	lds_m_fk_data[6].retrieve( )	

	lds_m_fk_data[7] = create t_ds_db
	lds_m_fk_data[7].dataobject = 'ds_object'
	laa_arg[] = laa_empty[]
	laa_arg[1] = gi_user_comp_id
	laa_arg[2] = '=Y'
	laa_arg[3] = '=STAFF'	
	lds_m_fk_data[7].f_add_where( 'company_id;active_yn;object_ref_table;', laa_arg[])
	lds_m_fk_data[7].f_settransobject( sqlca)
	lds_m_fk_data[7].retrieve( )		
elseif ldw_interface.dataobject = 'd_pur_tariff_price_interface_grid' then
	ls_price_type = 'PUR_TARIFF'
	ls_m_table = 'ITEM_PRICE'
	ls_m_colnames = 'company_id,branch_id,created_by, created_date,last_mdf_by, last_mdf_date,item_code,ITEM_APPLIED_TYPE, PRICE_TYPE, SPEC_CODE,OBJECT_APPLIED_TYPE,'+&
							'VENDOR_CODE,VENDOR_GROUP, WHOLESALES_PRICE, FROM_QTY,TO_QTY,F_DATE,T_DATE,CURR_CODE,DISCOUNT_AMOUNT,DISCOUNT_PCT,object_type'
	ls_mt_colnames =  'company_id,branch_id,created_by, created_date,last_mdf_by, last_mdf_date,ITEM_ID,ITEM_APPLIED_TYPE, PRICE_TYPE, SPEC_ID,OBJECT_APPLIED_TYPE,'+&
							'APPLIED_OBJECT_ID,OBJECT_MANAGE_GROUP, WHOLESALES_PRICE, FROM_QTY,TO_QTY,F_DATE,T_DATE,CURRENCY_ID,DISCOUNT_AMOUNT,DISCOUNT_PCT,object_type'
	ls_m_fk_col = 'item_code,SPEC_CODE,VENDOR_CODE,VENDOR_GROUP,CURR_CODE'	
	ls_m_pk_col = 'code,code,code,code,code,code'

	lds_m_fk_data[1] = create t_ds_db
	lds_m_fk_data[1] .dataobject = 'ds_object'
	laa_arg[1] = gi_user_comp_id
	laa_arg[2] = '=Y'
	laa_arg[3] = '=ITEM'	
	lds_m_fk_data[1] .f_add_where( 'company_id;active_yn;object_ref_table;', laa_arg[])
	lds_m_fk_data[1] .f_settransobject( sqlca)
	lds_m_fk_data[1] .retrieve( )	
	
	lds_m_fk_data[2] = create t_ds_db
	lds_m_fk_data[2].dataobject = 'd_item_spec_grid'
	lds_m_fk_data[2].f_settransobject( sqlca)
	lds_m_fk_data[2].retrieve( )		
	
	lds_m_fk_data[3] = create t_ds_db
	lds_m_fk_data[3] .dataobject = 'ds_object'
	laa_arg[1] = gi_user_comp_id
	laa_arg[2] = '=Y'
	laa_arg[3] = '=VENDOR'	
	lds_m_fk_data[3] .f_add_where( 'company_id;active_yn;object_ref_table;', laa_arg[])
	lds_m_fk_data[3] .f_settransobject( sqlca)
	lds_m_fk_data[3] .retrieve( )	

	lds_m_fk_data[4] = create t_ds_db
	lds_m_fk_data[4].dataobject = 'd_valueset_entry_grid'
	laa_arg[] = laa_empty[]
	laa_arg[1] = '=u_discount_vendor_price_gr'
	lds_m_fk_data[4].f_add_where( 'menu_code', laa_arg[])
	lds_m_fk_data[4].f_settransobject( sqlca)
	lds_m_fk_data[4].retrieve( )			
	
	lds_m_fk_data[5] = create t_ds_db
	lds_m_fk_data[5].dataobject = 'd_currency_grid'
	lds_m_fk_data[5].f_settransobject( sqlca)
	lds_m_fk_data[5].retrieve( )		
end if
//-- cập nhật lại actvice yn --//
this.f_update_active_yn( ldw_interface, ls_price_type)
ll_rowcnt = this.f_import_data( lt_transaction, ldw_interface, ls_m_table, ls_m_colnames, ls_mt_colnames, ls_m_refcol, ls_m_fk_col,ls_m_pk_col, lds_m_fk_data[], ls_d1_table, &
						ls_d1_colnames,ls_d1t_colnames,ls_d1_ref_col,ls_d1_fk_col,ls_d1_pk_col, lds_d1_fk_data[], ls_d2_table, ls_d2_colnames,ls_d2t_colnames, ls_d2_fk_col,&
						ls_d2_pk_col, lds_d2_fk_data[], ls_d3_table, ls_d3_colnames,ls_d3t_colnames, ls_d3_fk_col,ls_d3_pk_col, lds_d3_fk_data[])
if ll_rowcnt < 0 then
	rollback using lt_transaction;
else
	if ldw_interface.update(true, false ) = 1 then
		commit using lt_transaction;
		destroy lds_price
		gf_messagebox('m.c_item_interface.01','Thông báo','Nạp dữ liệu hoàn thành, số record đã nạp :@'+string(ll_rowcnt), 'information','ok',1)
	else
		rollback  using lt_transaction;
		gf_messagebox('m.c_item_interface.01','Thông báo','Lỗi nạp dữ liệu :@'+ lt_transaction.sqlerrtext , 'exclamation','ok',1)
	end if
end if
return 1
end event

public subroutine f_set_dwo_window ();

istr_dwo[1].s_dwo_default = 'd_item_interface_parm_form' 
istr_dwo[1].s_dwo_form = 'd_item_interface_parm_form'
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

istr_dwo[2].s_dwo_default = 'd_item_interface_grid' 
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_item_interface_grid'
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
istr_dwo[2].s_description = 'Thông tin hàng hóa, dịch vụ'

end subroutine

public function integer f_update_active_yn (t_dw_mpl vdw_interface, string vs_price_type);b_multithread	lb_update
t_transaction	lt_transaction
b_callback		lod_callback

if vs_price_type = '' then return 0
iw_display.f_get_transaction( lt_transaction)
lb_update = create b_multithread
lod_callback = create b_callback
lod_callback.f_copy_datastore(vdw_interface )

if sharedobjectregister("b_multithread","i_multithread_update") = Success! then
	if sharedobjectGet("i_multithread_update", lb_update) = Success! then
		lb_update.post event e_window_e_update( lod_callback, vs_price_type, lt_transaction.servername,lt_transaction.logid ,lt_transaction.logpass )
	else

	end if
	SharedobjectUnregister("i_multithread_update")
else
	return -1
end if	
return 0
end function

on c_item_interface.create
call super::create
end on

on c_item_interface.destroy
call super::destroy
end on

event constructor;call super::constructor;
is_table = 'object'
is_display_model = '2d'
ib_keyboardlocked = false
ib_changed_dwo_4edit = false

is_object_title = 'Nạp dữ liệu sản phẩm dịch vụ từ excel'

istr_actionpane[1].s_button_name = 'b_add;b_insert;b_modify;b_load_file;b_check;b_process; b_refresh;b_delete;'
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title
end event

event e_window_e_preopen;call super::e_window_e_preopen;
iw_display.dynamic f_set_ii_upperpart_height(200)
return 0
end event

event e_window_open;call super::e_window_open;

t_dw_mpl			ldw_parm, ldw_item


//-- add where vendor --//
ldw_parm = iw_display.f_get_dw('d_item_interface_parm_form')
ldw_parm.insertrow( 0)
ldw_item =  this.iw_display.dynamic f_get_dw( 2)
this.iw_display.f_set_idwfocus(ldw_item)

this.f_ctrl_actionbuttons(ldw_item)

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

if rpo_dw.dataobject = 'd_item_interface_parm_form' then
	ldw_item = this.iw_display.dynamic f_get_dw( 2)
	
	if ldw_item.f_get_ib_editing( ) then
		ls_dwo = rpo_dw.getitemstring(vl_currentrow,vs_colname)
		gf_messagebox('m.c_item_interface.e_dw_e_itemchanged.01','Thông báo','Phải lưu trước khi thay đổi bảng nạp dữ liệu','exclamation','ok',1)
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
if rpo_dw.dataobject = 'd_item_interface_parm_form' then
	return 0
end if
return ancestorreturnvalue
end event

event e_window_e_refresh;call super::e_window_e_refresh;
return 1
end event

event e_dw_e_preretrieve_start;call super::e_dw_e_preretrieve_start;
if rpo_dw.dataobject = 'd_item_interface_parm_form' then
	return -9
end if
end event

event e_dw_getfocus;call super::e_dw_getfocus;
if rdw_handling.dataobject = 'd_item_interface_parm_form' then 
	return -9
end if
return ancestorReturnValue
end event

