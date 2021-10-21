$PBExportHeader$u_item_interface.sru
forward
global type u_item_interface from cl_item_interface
end type
end forward

global type u_item_interface from cl_item_interface
end type
global u_item_interface u_item_interface

on u_item_interface.create
call super::create
end on

on u_item_interface.destroy
call super::destroy
end on

event e_action_process;t_transaction				lt_transaction
t_dw_mpl					ldw_interface
t_ds_db						lds_m_fk_data[],lds_d1_fk_data[],lds_d2_fk_data[], lds_d3_fk_data[]
t_ds_db						lds_fk_manage_group, lds_fk_post_group, lds_fk_staff

string							ls_m_table, ls_m_colnames, ls_m_refcol, ls_m_fk_col, ls_d1_table, ls_d1_colnames, ls_d1_ref_col
string							ls_d1_fk_col, ls_d2_table, ls_d2_colnames, ls_d2_fk_col,  ls_d3_table, ls_d3_colnames, ls_d3_fk_col
string							ls_mt_colnames, ls_d1t_colnames, ls_d2t_colnames, ls_d3t_colnames
string							ls_m_pk_col, ls_d1_pk_col, ls_d2_pk_col, ls_d3_pk_col
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
else
	ls_m_table = 'ITEM_PRICE'
	ls_m_colnames = 'company_id,branch_id,created_by, created_date,last_mdf_by, last_mdf_date,item_code,SPEC_CODE,ITEM_APPLIED_TYPE, PRICE_TYPE,OBJECT_APPLIED_TYPE,'+&
							'CUST_CODE,CUST_GROUP,WHOLESALES_PRICE,FROM_QTY,TO_QTY,F_DATE,T_DATE,CURR_CODE,DISCOUNT_AMOUNT,DISCOUNT_PCT,'+&
							'STAFF_APPLIED_TYPE,STAFF_GROUP,STAFF_CODE,object_type,comm_staff_pct'
	ls_mt_colnames =  'company_id,branch_id,created_by, created_date,last_mdf_by, last_mdf_date,item_id,SPEC_ID,ITEM_APPLIED_TYPE, PRICE_TYPE,OBJECT_APPLIED_TYPE,'+&
							 'APPLIED_OBJECT_ID,OBJECT_MANAGE_GROUP,WHOLESALES_PRICE,FROM_QTY,TO_QTY,F_DATE,T_DATE,currency_id,DISCOUNT_AMOUNT,DISCOUNT_PCT,'+&
							 'STAFF_APPLIED_TYPE,STAFF_MANAGE_GROUP,APPLIED_OBJECT_STAFF,object_type,comm_staff_pct'
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
	
end if

ll_rowcnt = this.f_import_data( lt_transaction, ldw_interface, ls_m_table, ls_m_colnames, ls_mt_colnames, ls_m_refcol, ls_m_fk_col,ls_m_pk_col, lds_m_fk_data[], ls_d1_table, &
						ls_d1_colnames,ls_d1t_colnames,ls_d1_ref_col,ls_d1_fk_col,ls_d1_pk_col, lds_d1_fk_data[], ls_d2_table, ls_d2_colnames,ls_d2t_colnames, ls_d2_fk_col,&
						ls_d2_pk_col, lds_d2_fk_data[], ls_d3_table, ls_d3_colnames,ls_d3t_colnames, ls_d3_fk_col,ls_d3_pk_col, lds_d3_fk_data[])
if ll_rowcnt < 0 then
	rollback using lt_transaction;
else
	if ldw_interface.update(true, false ) = 1 then
		commit using lt_transaction;
		gf_messagebox('m.c_item_interface.01','Thông báo','Nạp dữ liệu hoàn thành, số record đã nạp :@'+string(ll_rowcnt), 'information','ok',1)
	else
		rollback  using lt_transaction;
		gf_messagebox('m.c_item_interface.01','Thông báo','Lỗi nạp dữ liệu :@'+ lt_transaction.sqlerrtext , 'exclamation','ok',1)
	end if
end if
return 1
end event

