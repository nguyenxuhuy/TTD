$PBExportHeader$c_item_price_list.sru
forward
global type c_item_price_list from s_object_display
end type
end forward

global type c_item_price_list from s_object_display
event e_action_calculator_price ( )
end type
global c_item_price_list c_item_price_list

type variables
double	idb_spec_round_id,idb_sal_price
end variables

forward prototypes
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_window ()
public function integer f_get_apply_obj_id (double vdb_gr_id, ref double rdb_cus_id, ref double rdb_ven_id)
public function integer f_insert_item_price (t_ds_db vds_price_list, double vdb_branch_ref_id, long vl_currenrow)
end prototypes

event e_action_calculator_price();t_transaction	lt_transaction

t_dw_mpl	ldw_price_list
t_ds_db		lds_price_list
double		ldb_branch_id
string			ls_item_code
long			ll_idx,ll_find,ll_count
int				li_rtn

ldw_price_list = iw_display.f_get_dwmain( )
select rounding.id into :idb_spec_round_id from rounding where rounding.code = 'LTSPEC' using sqlca;
iw_display.f_get_transaction( lt_transaction)
lds_price_list = create t_ds_db
lds_price_list.dataobject = ldw_price_list.dataobject
ldw_price_list.rowscopy( 1, ldw_price_list.rowcount() , Primary! , lds_price_list, 1, Primary!)
lds_price_list.setfilter( "gutter = 'Y'")
lds_price_list.filter( )
lds_price_list.setsort( "item_code asc , main_yn desc")
lds_price_list.sort( )
ll_find = lds_price_list.find( "gutter = 'Y'", 1, lds_price_list.rowcount())
if ll_find > 0 then
	Do While ll_find > 0
		ll_count ++
		ldb_branch_id = lds_price_list.getitemnumber(ll_find,'BRANCH_REF_ID')
		li_rtn = this.f_insert_item_price( lds_price_list, ldb_branch_id, ll_find)
		if li_rtn = -1 then
			//-- message thất bại --//
			continue
		end if
		ll_find = lds_price_list.find( "gutter = 'Y'", ll_find +1, lds_price_list.rowcount() + 1)
		if ll_count = 200 then
			commit using lt_transaction;
			ll_count = 1
		end if
	Loop
else
	for ll_idx = 1 to lds_price_list.rowcount()
	next
end if
if li_rtn = 1 then 
	commit using lt_transaction;
else
end if
destroy lds_price_list
return 
end event

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'

end subroutine

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_item_sales_price_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_item_sales_price_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Bảng giá hàng hóa'

end subroutine

public function integer f_get_apply_obj_id (double vdb_gr_id, ref double rdb_cus_id, ref double rdb_ven_id);t_ds_db	lds_tmp
any		laa_retr[]

//lds_tmp = create t_ds_db
//lds_tmp.dataobject = 'd_suppliers_discount_gr_grid'
//lds_tmp.f_settransobject( lt_transaction)
//laa_retr[1] = vdb_gr_id
//lds_tmp.f_add_where( 'id', laa_retr[])
//lds_tmp.retrieve( )
//ldb_ven_obj_id = lds_tmp1.getitemnumber( 1, 'ven_ref_id')
//ldb_cus_obj_id = lds_tmp1.getitemnumber( 1, 'cus_ref_id')
return 1
end function

public function integer f_insert_item_price (t_ds_db vds_price_list, double vdb_branch_ref_id, long vl_currenrow);b_obj_instantiate	lb_obj
t_transaction		lt_transaction
c_datetime			lc_datet
t_ds_db				lds_tmp,lds_tmp1
double				ldb_tariff_price,ldb_discount_pur_price,ldb_discount_sal_price,ldb_item_id,ldb_id,ldb_ven_obj_id,ldb_cus_obj_id,ldb_cur_id,ldb_tariff_id,ldb_origin_pur_price,ldb_round_id
string					ls_item_code,ls_pur_app_type,ls_sal_app_type,ls_main_yn
date					ld_sysdate
long					ll_find,ll_insertrow
any					laa_data[],laa_retr[]
int						li_dis_pct,li_rtn,li_idx

iw_display.f_get_transaction(lt_transaction )
lds_tmp = create t_ds_db
lds_tmp1 =create t_ds_db
ldb_tariff_price = vds_price_list.getitemnumber( vl_currenrow, 'vendor_price')
ls_item_code = vds_price_list.getitemstring(vl_currenrow,'item_code')
ldb_cur_id = vds_price_list.getitemnumber( vl_currenrow, 'cur_id')
ldb_tariff_id = vds_price_list.getitemnumber( vl_currenrow, 'tariff_id')
ld_sysdate = date(lc_datet.f_getsysdate( ))
laa_retr[1] = vds_price_list.getitemnumber( vl_currenrow, 'DIS_GROUP_ID')
laa_retr[2] = vdb_branch_ref_id

lds_tmp1.dataobject = 'ds_tariff_list_grid'
lds_tmp1.f_settransobject( lt_transaction)
lds_tmp1.f_add_where( 'dis_gr_id;BRANCH_REF_ID', laa_retr[])
lds_tmp1.retrieve( )

lb_obj.f_get_item_info( 0, ls_item_code, laa_data)
ldb_round_id = ic_unit_instance.f_get_round_id( ldb_cur_id, double(laa_data[1]), 'amount')
ls_main_yn = lds_tmp1.getitemstring( 1, 'main_yn')
if ls_main_yn = 'N' then ldb_tariff_price = idb_sal_price
ldb_ven_obj_id = lds_tmp1.getitemnumber( 1, 'ven_ref_id')
ldb_cus_obj_id = lds_tmp1.getitemnumber( 1, 'cus_ref_id')

if isnull(ldb_ven_obj_id) or ldb_ven_obj_id = 0 then
	setnull(ldb_ven_obj_id)
	ls_pur_app_type = 'all'
else
	ls_pur_app_type = 'spec'
end if
if isnull(ldb_cus_obj_id) or ldb_cus_obj_id = 0 then
	setnull(ldb_cus_obj_id)
	ls_sal_app_type = 'all'
else
	ls_sal_app_type = 'spec'
end if
//-- tính giá mua --//
lds_tmp.dataobject = 'd_item_purchase_price_grid'
lds_tmp.f_settransobject( lt_transaction)
laa_retr[1] = laa_data[1]
lds_tmp.f_add_where( 'item_id', laa_retr)
lds_tmp.retrieve( )
li_dis_pct = vds_price_list.getitemnumber( vl_currenrow, 'suppliers_discount_pct')
lb_obj.f_calculation_disc( ldb_tariff_price, li_dis_pct, ldb_discount_pur_price, 'PURCHASE')
ldb_origin_pur_price = ldb_discount_pur_price
if ldb_cur_id = 23933 and idb_spec_round_id <> 0 then
	ldb_discount_pur_price = ic_unit_instance.f_db_round( idb_spec_round_id,ldb_origin_pur_price, lt_transaction)
else
	ldb_discount_pur_price = ic_unit_instance.f_db_round( ldb_round_id,ldb_origin_pur_price, lt_transaction)
end if
ll_find = lds_tmp.find( "active_yn = 'Y' and branch_id = " + string(vdb_branch_ref_id) , 1, lds_tmp.rowcount())
if ll_find > 0 then lds_tmp.setitem( ll_find, 'active_yn', 'N')
ll_insertrow = lds_tmp.event e_addrow( )
ldb_id = this.f_create_id( )
lds_tmp.setitem( ll_insertrow, 'ID', ldb_id)
lds_tmp.setitem( ll_insertrow, 'ITEM_ID', double(laa_data[1]))
lds_tmp.setitem( ll_insertrow, 'ITEM_APPLIED_TYPE', 'spec')
lds_tmp.setitem( ll_insertrow, 'OBJECT_APPLIED_TYPE', ls_pur_app_type)
lds_tmp.setitem( ll_insertrow, 'OBJECT_TYPE', 'VENDOR')
lds_tmp.setitem( ll_insertrow, 'APPLIED_OBJECT_ID', ldb_ven_obj_id)
lds_tmp.setitem( ll_insertrow, 'WHOLESALES_PRICE', ldb_discount_pur_price)
lds_tmp.setitem( ll_insertrow, 'F_DATE', ld_sysdate )
lds_tmp.setitem( ll_insertrow, 'CURRENCY_ID', ldb_cur_id)
lds_tmp.setitem( ll_insertrow, 'PRICE_TYPE', 'PURCHASE')
lds_tmp.setitem( ll_insertrow, 'active_yn', 'Y')
lds_tmp.setitem( ll_insertrow, 'branch_id', vdb_branch_ref_id)
li_rtn = lds_tmp.update(true,false)
ldb_discount_pur_price = ldb_origin_pur_price

if li_rtn <> -1 then
	lds_tmp.resetupdate( )
	lds_tmp.reset( )
	//-- tính giá bán --//
	lds_tmp.dataobject = 'd_item_sales_price_grid'
	lds_tmp.f_settransobject( lt_transaction)
	laa_retr[1] = laa_data[1]
	lds_tmp.f_add_where( 'item_id', laa_retr)
	lds_tmp.retrieve( )
	li_dis_pct = vds_price_list.getitemnumber( vl_currenrow, 'company_revenue_pct')
	lb_obj.f_calculation_disc( ldb_discount_pur_price, li_dis_pct, ldb_discount_sal_price, 'SALES')
	if ldb_cur_id = 23933 and idb_spec_round_id <> 0 then
		ldb_discount_sal_price = ic_unit_instance.f_db_round( idb_spec_round_id,ldb_discount_sal_price, lt_transaction)
	else
		ldb_discount_sal_price = ic_unit_instance.f_db_round( ldb_round_id,ldb_discount_sal_price, lt_transaction)
	end if
	ll_find = lds_tmp.find( "active_yn = 'Y' and branch_id = " + string(vdb_branch_ref_id), 1, lds_tmp.rowcount())
	if ll_find > 0 then lds_tmp.setitem( ll_find, 'active_yn', 'N')
	ll_insertrow = lds_tmp.event e_addrow( )
	ldb_id = this.f_create_id( )
	lds_tmp.setitem( ll_insertrow, 'ID', ldb_id)
	lds_tmp.setitem( ll_insertrow, 'ITEM_ID', double(laa_data[1]))
	lds_tmp.setitem( ll_insertrow, 'ITEM_APPLIED_TYPE', 'spec')
	lds_tmp.setitem( ll_insertrow, 'OBJECT_APPLIED_TYPE', ls_sal_app_type)
	lds_tmp.setitem( ll_insertrow, 'OBJECT_TYPE', 'CUSTOMER')
	lds_tmp.setitem( ll_insertrow, 'APPLIED_OBJECT_ID', ldb_cus_obj_id)
	lds_tmp.setitem( ll_insertrow, 'WHOLESALES_PRICE', ldb_discount_sal_price)
	lds_tmp.setitem( ll_insertrow, 'F_DATE', ld_sysdate )
	lds_tmp.setitem( ll_insertrow, 'CURRENCY_ID', ldb_cur_id)
	lds_tmp.setitem( ll_insertrow, 'PRICE_TYPE', 'SALES')
	lds_tmp.setitem( ll_insertrow, 'STAFF_APPLIED_TYPE', 'all')
	lds_tmp.setitem( ll_insertrow, 'branch_id', vdb_branch_ref_id)
	lds_tmp.setitem( ll_insertrow, 'active_yn', 'Y')
	li_rtn = lds_tmp.update(true,false)
	if li_rtn <> -1 then
		lds_tmp.resetupdate( )
		lds_tmp.reset( )
		update item_price
		set f_date = :ld_sysdate, LAST_MDF_BY = :gi_userid, LAST_MDF_DATE = sysdate
		where PRICE_TYPE = 'PUR_TARIFF' and id = :ldb_tariff_id using lt_transaction;
	end if
end if

if ls_main_yn = 'Y' then idb_sal_price = ldb_discount_sal_price
destroy lds_tmp
destroy lds_tmp1
return li_rtn
end function

on c_item_price_list.create
call super::create
end on

on c_item_price_list.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'ITEM_PRICE'
ib_changed_dwo_4edit = false
is_display_model = '1d'
ib_display_text = false
is_object_title = 'Bảng giá hàng hóa'

istr_actionpane[1].s_dwo_action = 'd_action_edit'
istr_actionpane[1].s_button_name = 'b_refresh;b_filteron;b_calculator_price;b_query;b_delete;'
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title

end event

event e_action_ctrl_bttn;call super::e_action_ctrl_bttn;datawindow				ldw_focus
int							li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	//-- control d_action_edit --//
	FOR li_idx = 1 to upperbound(istr_actionpane[]) 
		if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
			istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_refresh;b_filteron;b_delete;'
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;
rpo_dw.setitem(vl_currentrow, 'price_type','SALES')

return vl_currentrow
end event

