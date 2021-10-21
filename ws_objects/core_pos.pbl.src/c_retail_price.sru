$PBExportHeader$c_retail_price.sru
forward
global type c_retail_price from s_object_display
end type
end forward

global type c_retail_price from s_object_display
event type integer e_action_create_loc ( )
event e_action_2080 ( )
end type
global c_retail_price c_retail_price

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_tabpage ()
end prototypes

event e_action_2080();long					ll_row
double				ldb_id
string					ls_sql
t_dw_mpl			ldw_item_buy

connect using it_transaction;

ls_sql = 'TRUNCATE TABLE item_tmp DROP STORAGE'
execute immediate :ls_sql using it_transaction;

ldw_item_buy = iw_display.dynamic f_get_dw( 1,1)
Yield()
FOR ll_row = 1 to ldw_item_buy.rowcount()	
	this.of_show_progress( int(ll_row/ ldw_item_buy.rowcount()*100), 'Đang cập nhật .........')
	this.iw_progress.st_remain.text = string(ll_row)+'/'+string(ldw_item_buy.rowcount())
	
	ldb_id = ldw_item_buy.getitemnumber( ll_row, 'object_id')
	if ldb_id > 0 then
		INSERT into item_tmp (id) values(:ldb_id) using it_transaction ;		
	else
		ldb_id = ldw_item_buy.getitemnumber( ll_row, 'manage_group')
		if ldb_id > 0 then
			INSERT into item_tmp (id) 
			select t1.id from object t1 where t1.manage_group =  :ldb_id 
																				and t1.object_ref_table = 'ITEM' 
																				and t1.company_id = :gi_user_comp_id
																				and t1.branch_id = :gdb_branch 
			using it_transaction ;
			
		end if
	end if	
NEXT
UPDATE item t set t.abc_rank = '20' 
where exists (select null from item_tmp where t.object_ref_id = item_tmp.id)
using it_transaction ;

UPDATE item t set t.abc_rank = '80' 
where not exists (select null from item_tmp where t.object_ref_id = item_tmp.id)
using it_transaction ;


if  ldw_item_buy.rowcount() > 0 then
	commit using it_transaction;
	this.of_show_progress(101, 'Đang cập nhật .........')
	gf_messagebox('m.c_promotion.e_action_2080.01','Thông báo','Cập nhật hoàn tất','information','ok',1)
end if
disconnect using it_transaction;
end event

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_retailed_price_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_retailed_price_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_retailed_price_his_grid;'
istr_dwo[1].s_dwo_master = ''
istr_dwo[1].s_master_keycol = ''
istr_dwo[1].s_detail_keycol = ''
istr_dwo[1].b_ref_table_yn  = false
istr_dwo[1].s_ref_table_field = ''
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
//istr_dwo[1].s_gb_name = 'gb_6'
//istr_dwo[1].s_description = 'sản phẩm - hàng hóa - dịch vụ'
end subroutine

public subroutine f_set_actionpane ();//
//istr_actionpane[2].s_dwo_action = 'd_action_related_object'
//istr_actionpane[2].s_button_name = 'b_goods_delivery;b_goods_receipt;'
//istr_actionpane[2].s_objname_handling = this.classname( )
//istr_actionpane[2].s_description = 'Đối tượng liên quan'
//
//istr_actionpane[3].s_dwo_action = 'd_action_related_report'
//istr_actionpane[3].s_button_name =  'b_inventory_io; b_inventory_onhand'
//istr_actionpane[3].s_objname_handling = this.classname( )
//istr_actionpane[3].s_description = 'Báo cáo liên quan'
//
//istr_actionpane[4].s_dwo_action = 'd_action_manage'
//istr_actionpane[4].s_objname_handling = this.classname( )
//istr_actionpane[4].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_dwo_tabpage ();
iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_description = 'Lược sử giá'
iastr_dwo_tabpage[1].s_display_model = '1d'
//iastr_dwo_tabpage[1].i_leftpart_width = 2/3 - 1/5
//iastr_dwo_tabpage[1].i_midpart_width = 1/3
iastr_dwo_tabpage[1].i_index = 1
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_retailed_price_his_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_retailed_price_his_grid'
iastr_dwo_tabpage[1].str_dwo[1].b_master = false
iastr_dwo_tabpage[1].str_dwo[1].b_detail = false
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_retailed_price_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol = 'item_id'
iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol = 'item_id'
iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[1].s_ref_table_field = ''
iastr_dwo_tabpage[1].str_dwo[1].b_insert = false
iastr_dwo_tabpage[1].str_dwo[1].b_update = false
iastr_dwo_tabpage[1].str_dwo[1].b_delete = false
iastr_dwo_tabpage[1].str_dwo[1].b_query = true
iastr_dwo_tabpage[1].str_dwo[1].b_print = true
iastr_dwo_tabpage[1].str_dwo[1].b_excel = true
iastr_dwo_tabpage[1].str_dwo[1].b_traceable = false
iastr_dwo_tabpage[1].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Lược sử giá'
iastr_dwo_tabpage[1].str_dwo[1].s_gb_name = ''


end subroutine

on c_retail_price.create
call super::create
end on

on c_retail_price.destroy
call super::destroy
end on

event constructor;call super::constructor;
ib_changed_dwo_4edit = false
this.ib_keyboardlocked = true
is_display_model = 'up_1d_lo_tb'
is_object_title = 'Bảng giá'
istr_actionpane[1].s_button_name = 'b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_delete;b_create_loc;'
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title
end event

event e_window_open;call super::e_window_open;int				li_cnt
iw_display.event e_filteron_new( )

//-- update item_price --//
select count(v.item_id) into :li_cnt
from v_uom_item v
where v.company_id = :gi_user_comp_id
and (V.TO_COEFFICIENT > 1 or V.FROM_COEFFICIENT = 1 and V.TO_COEFFICIENT = 1)
and not exists (select null from item_price t1 where t1.item_id = v.item_id and t1.trans_uom = V.UOM_ID and t1.company_id = v.company_id  and t1.price_type = 'SALES'  )
using it_transaction;

if li_cnt > 0 then
	insert into item_price( id, item_id, company_id, branch_id, created_by, created_Date, last_mdf_by, last_mdf_date,
                                retail_price, f_Date, currency_id, ITEM_APPLIED_TYPE, OBJECT_APPLIED_TYPE, OBJECT_TYPE,
                                PRICE_TYPE,TRANS_UOM)
	select seq_table_id.nextval, v.item_id, :gi_user_comp_id, :gdb_branch , :gi_userid , sysdate, :gi_userid, sysdate,
                                null, trunc(sysdate) ,23933, 'spec','all','CUSTOMER',
                                'SALES',v.uom_id
             from v_uom_item v
                where v.company_id = :gi_user_comp_id
                and (V.TO_COEFFICIENT > 1 or V.FROM_COEFFICIENT = 1 and V.TO_COEFFICIENT = 1)
                and not exists (select null from item_price t1 where t1.item_id = v.item_id and t1.trans_uom = V.UOM_ID and t1.company_id = v.company_id  and t1.price_type = 'SALES'  )
	using it_transaction;
	commit using it_transaction;
end if
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
							istr_actionpane[li_idx].s_visible_buttons =  'b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons =  'b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons= 'b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =  'b_goods_delivery; b_goods_receipt;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
				istr_actionpane[li_idx].s_visible_buttons =  'b_attach; b_note;b_doc_trace_on;b_user_trace;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
				istr_actionpane[li_idx].s_visible_buttons =  'b_inventory_io; b_inventory_onhand;'
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.dynamic f_set_ii_upperpart_height(1/2)


return 0
end event

event e_dw_e_save;call super::e_dw_e_save;
if rpo_dw.dataobject = 'd_retailed_price_his_grid'  then
	return 0
end if
return ancestorreturnvalue
end event

event e_window_e_postopen;call super::e_window_e_postopen;string				ls_first_colname
int					li_rtn
ls_first_colname =  iw_display.dw_filter.f_getfirstcolumn( true)
iw_display.f_set_idwfocus(  iw_display.dw_filter)
li_rtn = iw_display.idw_focus.setcolumn( ls_first_colname)
return li_rtn
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;double		ldb_item_id, ldb_price_id
dec			ldc_profit, ldc_last_pur, ldc_old_price, ldc_price, ldc_fr_factor_max, ldc_to_factor_max, ldc_to_factor, ldc_fr_factor, ldc_pur_price
int				li_row
date			ld_f_date
if rpo_dw.dataobject = 'd_retailed_price_grid' then
	if vs_colname = 'profit' then	
		ldc_profit = dec(vs_editdata)
		ldb_item_id = rpo_dw.getitemnumber(vl_currentrow, 'item_id')		
		li_row = rpo_dw.find(" item_id = " + string(ldb_item_id) ,1, rpo_dw.rowcount() )
		DO while li_row > 0 
			ldc_last_pur = rpo_dw.getitemnumber(li_row , 'last_pur_price')
			if isnull(ldc_last_pur) then ldc_last_pur = 0
			ldc_price = round(ldc_last_pur + ldc_last_pur*ldc_profit/100, 0) 
			rpo_dw.setitem(li_row, 'retail_price', ldc_price)
			rpo_dw.setitem(li_row, 'profit', ldc_profit)
			ldc_old_price = rpo_dw.getitemnumber(li_row, 'retail_price_old')
			if isnull(ldc_old_price) then ldc_old_price = 0
			if ldc_price <> ldc_old_price then
				rpo_dw.setitem( li_row, 'f_date', today() )			
				ldb_price_id = rpo_dw.getitemnumber(li_row, 'id')
				if ldb_price_id > 0 then								
					setnull(ld_f_date)
					rpo_dw.setitem( li_row, 'f_date_old', ld_f_date )
					rpo_dw.setitem( li_row, 't_date_old', relativeDate( today(), -1) )		
				end if
			end if
			li_row = rpo_dw.find(" item_id = " + string(ldb_item_id) ,li_row + 1, rpo_dw.rowcount()+1 )
		LOOP
	elseif vs_colname = 'retail_price' then	
		ldc_last_pur = rpo_dw.getitemnumber(vl_currentrow, 'last_pur_price')
		if isnull(ldc_last_pur) OR ldc_last_pur = 0	 then
			rpo_dw.setitem( vl_currentrow, 'profit', 100 )
		ELSE
			rpo_dw.setitem( vl_currentrow, 'profit', round( ((dec(vs_editdata ) - ldc_last_pur)/ ldc_last_pur)*100 , 1) )
		end if
		ldc_old_price = rpo_dw.getitemnumber(vl_currentrow, 'retail_price_old')
		if isnull(ldc_old_price) then ldc_old_price = 0
		if dec(vs_editdata ) <> ldc_old_price then
			rpo_dw.setitem( vl_currentrow, 'f_date', today() )
			ldb_price_id = rpo_dw.getitemnumber(vl_currentrow, 'id')
			if ldb_price_id > 0 then															
				setnull(ld_f_date)
				rpo_dw.setitem( vl_currentrow, 'f_date_old', ld_f_date )
				rpo_dw.setitem( vl_currentrow, 't_date_old',  relativeDate( today(), -1)  )						
			end if
		end if
	elseif vs_colname = 'last_pur_price' then			
		ldc_last_pur = dec(vs_editdata)
		ldb_item_id = rpo_dw.getitemnumber(vl_currentrow, 'item_id')		
		ldc_profit = rpo_dw.getitemnumber(vl_currentrow, 'profit')
		ldc_fr_factor_max = rpo_dw.getitemnumber(vl_currentrow, 'FROM_COEFFICIENT')
		ldc_to_factor_max = rpo_dw.getitemnumber(vl_currentrow, 'TO_COEFFICIENT')		
		if isnull(ldc_to_factor_max) or ldc_to_factor_max = 0 then ldc_to_factor_max =1		
		li_row = rpo_dw.find(" item_id = " + string(ldb_item_id) ,1, rpo_dw.rowcount() )
		DO while li_row > 0 
			if li_row = vl_currentrow then
				ldc_price = round( ldc_last_pur + ldc_last_pur* ldc_profit/100 , 0)
			else
				ldc_profit = rpo_dw.getitemnumber(li_row, 'profit')
				ldc_fr_factor = rpo_dw.getitemnumber(li_row, 'FROM_COEFFICIENT')
				if isnull(ldc_fr_factor) or ldc_fr_factor = 0 then ldc_fr_factor =1
				ldc_to_factor = rpo_dw.getitemnumber(li_row, 'TO_COEFFICIENT')
				ldc_pur_price = round(ldc_last_pur * (ldc_fr_factor_max/ldc_to_factor_max) * (ldc_to_factor/ldc_fr_factor) ,0)
				ldc_price = round( ldc_pur_price + ldc_pur_price* ldc_profit/100 , 0)			
				rpo_dw.setitem( li_row, 'last_pur_price', ldc_pur_price )
			end if
			rpo_dw.setitem( li_row, 'retail_price', ldc_price )
			li_row = rpo_dw.find(" item_id = " + string(ldb_item_id) ,li_row + 1, rpo_dw.rowcount() + 1)
		LOOP							
	end if
	
end if

return ancestorreturnvalue
end event

event e_window_e_refresh;call super::e_window_e_refresh;int				li_cnt

//-- update item_price --//
select count(v.item_id) into :li_cnt
from v_uom_item v
where v.company_id = :gi_user_comp_id
and (V.TO_COEFFICIENT > 1 or V.FROM_COEFFICIENT = 1 and V.TO_COEFFICIENT = 1)
and not exists (select null from item_price t1 where t1.item_id = v.item_id and t1.trans_uom = V.UOM_ID and t1.company_id = v.company_id  and t1.price_type = 'SALES'  )
using it_transaction;

if li_cnt > 0 then
	insert into item_price( id, item_id, company_id, branch_id, created_by, created_Date, last_mdf_by, last_mdf_date,
                                retail_price, f_Date, currency_id, ITEM_APPLIED_TYPE, OBJECT_APPLIED_TYPE, OBJECT_TYPE,
                                PRICE_TYPE,TRANS_UOM)
	select seq_table_id.nextval, v.item_id, :gi_user_comp_id, :gdb_branch , :gi_userid , sysdate, :gi_userid, sysdate,
                                null, trunc(sysdate) ,23933, 'spec','all','CUSTOMER',
                                'SALES',v.uom_id
             from v_uom_item v
                where v.company_id = :gi_user_comp_id
                and (V.TO_COEFFICIENT > 1 or V.FROM_COEFFICIENT = 1 and V.TO_COEFFICIENT = 1)
                and not exists (select null from item_price t1 where t1.item_id = v.item_id and t1.trans_uom = V.UOM_ID and t1.company_id = v.company_id  and t1.price_type = 'SALES'  )
	using it_transaction;
	commit using it_transaction;
end if
return  0
end event

