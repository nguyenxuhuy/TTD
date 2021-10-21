$PBExportHeader$c_pur_price_disc.sru
forward
global type c_pur_price_disc from s_object_display
end type
end forward

global type c_pur_price_disc from s_object_display
event type integer e_action_create_loc ( )
event e_action_2080 ( )
end type
global c_pur_price_disc c_pur_price_disc

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

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_pur_price_disc_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_pur_price_disc_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_details = 'd_pur_price_disc_d_grid;'
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

istr_dwo[2].s_dwo_default =  'd_pur_price_disc_d_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_pur_price_disc_d_grid'
istr_dwo[2].b_master = false
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = false
istr_dwo[2].s_dwo_details = ''
istr_dwo[2].s_dwo_master = 'd_pur_price_disc_grid'
istr_dwo[2].s_master_keycol = 'OBJECT_MANAGE_GROUP;APPLIED_OBJECT_ID;DISCOUNT_PCT;'
istr_dwo[2].s_detail_keycol = 'OBJECT_MANAGE_GROUP;APPLIED_OBJECT_ID;DISCOUNT_PCT;'
istr_dwo[2].b_ref_table_yn  = false
istr_dwo[2].b_keynull = true
istr_dwo[2].s_ref_table_field = ''
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = true
//istr_dwo[2].s_gb_name = 'gb_6'
//istr_dwo[2].s_description = 'sản phẩm - hàng hóa - dịch vụ'


istr_dwo[3].s_dwo_default =  'd_pur_price_disc_d_grid'
istr_dwo[3].s_dwo_form = ''
istr_dwo[3].s_dwo_grid = 'd_pur_price_disc_d_grid'
istr_dwo[3].b_master = false
istr_dwo[3].b_detail = false
istr_dwo[3].b_cascade_del = false
istr_dwo[3].s_dwo_details = ''
istr_dwo[3].s_dwo_master = ''
istr_dwo[3].s_master_keycol = ''
istr_dwo[3].s_detail_keycol = ''
istr_dwo[3].b_ref_table_yn  = false
istr_dwo[3].b_keynull = true
istr_dwo[3].s_ref_table_field = ''
istr_dwo[3].b_insert = true
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = true
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_excel = true
istr_dwo[3].b_traceable = true
istr_dwo[3].b_keyboardlocked = true
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

public subroutine f_set_dwo_tabpage ();/*
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
*/

end subroutine

on c_pur_price_disc.create
call super::create
end on

on c_pur_price_disc.destroy
call super::destroy
end on

event constructor;call super::constructor;
ib_changed_dwo_4edit = false
this.ib_keyboardlocked = true
is_display_model = '2d'
is_object_title = 'Chiết khấu mua'
istr_actionpane[1].s_button_name = 'b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_delete;b_saveas;'
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title
end event

event e_window_open;call super::e_window_open;
iw_display.event e_filteron_new( )



return  0
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
							istr_actionpane[li_idx].s_visible_buttons =  'b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;b_saveas;'
						else
							istr_actionpane[li_idx].s_visible_buttons =  'b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;b_saveas;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;b_saveas;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;b_saveas;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;b_saveas;'
					else
						istr_actionpane[li_idx].s_visible_buttons= 'b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;b_saveas;'
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

event e_window_e_postopen;call super::e_window_e_postopen;string				ls_first_colname
int					li_rtn
ls_first_colname =  iw_display.dw_filter.f_getfirstcolumn( true)
iw_display.f_set_idwfocus(  iw_display.dw_filter)
li_rtn = iw_display.idw_focus.setcolumn( ls_first_colname)
return li_rtn
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;
if rpo_dw.dataobject = 'd_pur_price_disc_grid' then

elseif  rpo_dw.dataobject = 'd_pur_price_disc_d_grid' then
	rpo_dw.setitem(vl_currentrow, 'PRICE_TYPE', 'PURCHASE')
	rpo_dw.setitem(vl_currentrow, 'OBJECT_TYPE', 'VENDOR')
	rpo_dw.setitem(vl_currentrow, 'f_date', date(today()))	
end if
return vl_currentrow
end event

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.f_set_ii_upperpart_height(1/2) //orders+pr_line
return 0
end event

event e_dw_e_save;call super::e_dw_e_save;
long					ll_row
rpo_dw.accepttext()
if rpo_dw.dataobject = 'd_pur_price_disc_grid' then
	rpo_dw.accepttext()
	return 0
elseif  rpo_dw.classname() = 'dw_2' then
	FOR ll_row = 1 to rpo_dw.rowcount()
		rpo_dw.dynamic f_set_master_detail_ref_table(ll_row )
	NEXT
	return 1
else
	return 0
end if
end event

event e_dw_e_predelete;call super::e_dw_e_predelete;if rpo_dw.dataobject = 'd_pur_price_disc_grid' then
	return 2
end if
return 0
end event

event e_window_e_saveas;call super::e_window_e_saveas;any			laa_value[]
string			ls_sql, ls_where, ls_dw_syntax, ls_err
int				li_row, li_row2
t_dw_mpl	ldw_main, ldw_detail ,ldw_excel


ldw_detail = iw_display.dynamic f_get_dw(2)
ldw_excel = iw_display.dynamic f_get_dw(3)
ldw_main = iw_display.f_get_dwmain( )

For li_row = 1 to ldw_main.rowcount( )
	ldw_main.scrolltorow( li_row)
	ldw_detail = iw_display.f_get_dw( 'd_pur_price_disc_d_grid')
	ldw_detail.rowscopy( 1, ldw_detail.rowcount(), primary!, ldw_excel,ldw_excel.rowcount()+1, primary!)
next

rdw_forcus = ldw_excel

return ldw_excel.rowcount()
end event

event e_dw_e_preretrieve_start;call super::e_dw_e_preretrieve_start;if rpo_dw.classname() = 'dw_3' then return -9
end event

