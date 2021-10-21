$PBExportHeader$c_promotion.sru
forward
global type c_promotion from s_object_display
end type
end forward

global type c_promotion from s_object_display
event type integer e_action_create_loc ( )
event e_action_2080 ( )
end type
global c_promotion c_promotion

type variables
string			is_origin_filter
end variables

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

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_doc_promotion_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_doc_promotion_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_promotion_buy_grid;d_promotion_get_grid;d_promotion_obj_grid;'
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
iastr_dwo_tabpage[1].s_description = 'Điều kiệm mua được KM'
iastr_dwo_tabpage[1].s_display_model = '1df_1df_1df'
iastr_dwo_tabpage[1].i_leftpart_width = 2/3 - 1/5
iastr_dwo_tabpage[1].i_midpart_width = 1/3
iastr_dwo_tabpage[1].i_index = 1
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_promotion_buy_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_promotion_buy_grid'
iastr_dwo_tabpage[1].str_dwo[1].b_master = false
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_doc_promotion_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol = 'id'
iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol = 'object_ref_id'
iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[1].s_ref_table_field = 'object_ref_table'
iastr_dwo_tabpage[1].str_dwo[1].b_insert = true
iastr_dwo_tabpage[1].str_dwo[1].b_update = true
iastr_dwo_tabpage[1].str_dwo[1].b_delete = true
iastr_dwo_tabpage[1].str_dwo[1].b_query = true
iastr_dwo_tabpage[1].str_dwo[1].b_print = true
iastr_dwo_tabpage[1].str_dwo[1].b_excel = true
iastr_dwo_tabpage[1].str_dwo[1].b_drag = true
iastr_dwo_tabpage[1].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Thuốc có CTKM'
iastr_dwo_tabpage[1].str_dwo[1].s_gb_name = 'gb_6'

iastr_dwo_tabpage[1].str_dwo[2].s_dwo_default =  'd_objects_item_grid'
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_grid = 'd_objects_item_grid'
iastr_dwo_tabpage[1].str_dwo[2].b_master = false
iastr_dwo_tabpage[1].str_dwo[2].b_detail = false
iastr_dwo_tabpage[1].str_dwo[2].b_shared = false
iastr_dwo_tabpage[1].str_dwo[2].b_cascade_del = false
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_master = ''
iastr_dwo_tabpage[1].str_dwo[2].s_master_keycol = ''
iastr_dwo_tabpage[1].str_dwo[2].s_detail_keycol = ''
iastr_dwo_tabpage[1].str_dwo[2].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[2].s_ref_table_field = ''
iastr_dwo_tabpage[1].str_dwo[2].b_insert = false
iastr_dwo_tabpage[1].str_dwo[2].b_update = false
iastr_dwo_tabpage[1].str_dwo[2].b_delete = false
iastr_dwo_tabpage[1].str_dwo[2].b_query = true
iastr_dwo_tabpage[1].str_dwo[2].b_print = true
iastr_dwo_tabpage[1].str_dwo[2].b_excel = true
iastr_dwo_tabpage[1].str_dwo[2].b_drag = true
iastr_dwo_tabpage[1].str_dwo[2].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[2].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[2].s_description ='DS thuốc để chọn'
iastr_dwo_tabpage[1].str_dwo[2].s_gb_name = 'gb_7'

iastr_dwo_tabpage[1].str_dwo[3].s_dwo_default =  'd_valueset_entry_grid'
iastr_dwo_tabpage[1].str_dwo[3].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[3].s_dwo_grid = 'd_valueset_entry_grid'
iastr_dwo_tabpage[1].str_dwo[3].b_master = false
iastr_dwo_tabpage[1].str_dwo[3].b_detail = false
iastr_dwo_tabpage[1].str_dwo[3].b_shared = false
iastr_dwo_tabpage[1].str_dwo[3].b_cascade_del = false
iastr_dwo_tabpage[1].str_dwo[3].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[3].s_dwo_master = ''
iastr_dwo_tabpage[1].str_dwo[3].s_master_keycol = ''
iastr_dwo_tabpage[1].str_dwo[3].s_detail_keycol = ''
iastr_dwo_tabpage[1].str_dwo[3].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[3].s_ref_table_field = ''
iastr_dwo_tabpage[1].str_dwo[3].b_insert = true
iastr_dwo_tabpage[1].str_dwo[3].b_update = true
iastr_dwo_tabpage[1].str_dwo[3].b_delete = true
iastr_dwo_tabpage[1].str_dwo[3].b_query = true
iastr_dwo_tabpage[1].str_dwo[3].b_print = true
iastr_dwo_tabpage[1].str_dwo[3].b_excel = true
iastr_dwo_tabpage[1].str_dwo[3].b_drag = true
iastr_dwo_tabpage[1].str_dwo[3].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[3].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[3].s_description ='DS nhóm để chọn'
iastr_dwo_tabpage[1].str_dwo[3].s_gb_name = 'gb_8'

iastr_dwo_tabpage[1].str_dwo[4].s_dwo_default =  'd_filter_short_full_form'
iastr_dwo_tabpage[1].str_dwo[4].s_dwo_form = 'd_filter_short_full_form'
iastr_dwo_tabpage[1].str_dwo[4].s_dwo_grid = ''
iastr_dwo_tabpage[1].str_dwo[4].b_master = false
iastr_dwo_tabpage[1].str_dwo[4].b_detail = false
iastr_dwo_tabpage[1].str_dwo[4].b_shared = false
iastr_dwo_tabpage[1].str_dwo[4].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[4].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[4].s_dwo_master = ''
iastr_dwo_tabpage[1].str_dwo[4].s_master_keycol = ''
iastr_dwo_tabpage[1].str_dwo[4].s_detail_keycol = ''
iastr_dwo_tabpage[1].str_dwo[4].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[4].s_ref_table_field = ''
iastr_dwo_tabpage[1].str_dwo[4].b_insert = false
iastr_dwo_tabpage[1].str_dwo[4].b_update = true
iastr_dwo_tabpage[1].str_dwo[4].b_delete = false
iastr_dwo_tabpage[1].str_dwo[4].b_query = true
iastr_dwo_tabpage[1].str_dwo[4].b_print = true
iastr_dwo_tabpage[1].str_dwo[4].b_excel = true
iastr_dwo_tabpage[1].str_dwo[4].b_traceable = false
iastr_dwo_tabpage[1].str_dwo[4].b_keyboardlocked = false
iastr_dwo_tabpage[1].str_dwo[4].s_description ='Lọc'
iastr_dwo_tabpage[1].str_dwo[4].s_gb_name = ''

iastr_dwo_tabpage[1].str_dwo[5].s_dwo_default =  'd_filter_short_form'
iastr_dwo_tabpage[1].str_dwo[5].s_dwo_form = 'd_filter_short_form'
iastr_dwo_tabpage[1].str_dwo[5].s_dwo_grid = ''
iastr_dwo_tabpage[1].str_dwo[5].b_master = false
iastr_dwo_tabpage[1].str_dwo[5].b_detail = false
iastr_dwo_tabpage[1].str_dwo[5].b_shared = false
iastr_dwo_tabpage[1].str_dwo[5].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[5].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[5].s_dwo_master = ''
iastr_dwo_tabpage[1].str_dwo[5].s_master_keycol = ''
iastr_dwo_tabpage[1].str_dwo[5].s_detail_keycol = ''
iastr_dwo_tabpage[1].str_dwo[5].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[5].s_ref_table_field = ''
iastr_dwo_tabpage[1].str_dwo[5].b_insert = false
iastr_dwo_tabpage[1].str_dwo[5].b_update = true
iastr_dwo_tabpage[1].str_dwo[5].b_delete = false
iastr_dwo_tabpage[1].str_dwo[5].b_query = true
iastr_dwo_tabpage[1].str_dwo[5].b_print = true
iastr_dwo_tabpage[1].str_dwo[5].b_excel = true
iastr_dwo_tabpage[1].str_dwo[5].b_traceable = false
iastr_dwo_tabpage[1].str_dwo[5].b_keyboardlocked = false
iastr_dwo_tabpage[1].str_dwo[5].s_description ='Lọc'
iastr_dwo_tabpage[1].str_dwo[5].s_gb_name = ''

iastr_dwo_tabpage[1].str_dwo[6].s_dwo_default =  'd_filter_short_full_form'
iastr_dwo_tabpage[1].str_dwo[6].s_dwo_form = 'd_filter_short_full_form'
iastr_dwo_tabpage[1].str_dwo[6].s_dwo_grid = ''
iastr_dwo_tabpage[1].str_dwo[6].b_master = false
iastr_dwo_tabpage[1].str_dwo[6].b_detail = false
iastr_dwo_tabpage[1].str_dwo[6].b_shared = false
iastr_dwo_tabpage[1].str_dwo[6].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[6].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[6].s_dwo_master = ''
iastr_dwo_tabpage[1].str_dwo[6].s_master_keycol = ''
iastr_dwo_tabpage[1].str_dwo[6].s_detail_keycol = ''
iastr_dwo_tabpage[1].str_dwo[6].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[6].s_ref_table_field = ''
iastr_dwo_tabpage[1].str_dwo[6].b_insert = false
iastr_dwo_tabpage[1].str_dwo[6].b_update = true
iastr_dwo_tabpage[1].str_dwo[6].b_delete = false
iastr_dwo_tabpage[1].str_dwo[6].b_query = true
iastr_dwo_tabpage[1].str_dwo[6].b_print = true
iastr_dwo_tabpage[1].str_dwo[6].b_excel = true
iastr_dwo_tabpage[1].str_dwo[6].b_traceable = false
iastr_dwo_tabpage[1].str_dwo[6].b_keyboardlocked = false
iastr_dwo_tabpage[1].str_dwo[6].s_description ='Lọc'
iastr_dwo_tabpage[1].str_dwo[6].s_gb_name = ''

iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_description = 'Quà/Điểm tích lũy'
iastr_dwo_tabpage[2].s_display_model = '1dgb_1dgf'
iastr_dwo_tabpage[2].i_leftpart_width = 2/3
iastr_dwo_tabpage[2].i_index = 2
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_promotion_get_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = 'd_promotion_get_grid'
iastr_dwo_tabpage[2].str_dwo[1].b_master = false
iastr_dwo_tabpage[2].str_dwo[1].b_detail = true
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_doc_promotion_grid;'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[2].str_dwo[1].s_master_keycol = 'id'
iastr_dwo_tabpage[2].str_dwo[1].s_detail_keycol = 'object_ref_id'
iastr_dwo_tabpage[2].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[2].str_dwo[1].s_ref_table_field = 'object_ref_table'
iastr_dwo_tabpage[2].str_dwo[1].b_insert = true
iastr_dwo_tabpage[2].str_dwo[1].b_update = true
iastr_dwo_tabpage[2].str_dwo[1].b_delete = true
iastr_dwo_tabpage[2].str_dwo[1].b_query = true
iastr_dwo_tabpage[2].str_dwo[1].b_print = true
iastr_dwo_tabpage[2].str_dwo[1].b_excel = true
iastr_dwo_tabpage[2].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[2].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[2].str_dwo[1].s_description ='Quà tặng/ Điểm tích lũy'
iastr_dwo_tabpage[2].str_dwo[1].s_gb_name = 'gb_6'

iastr_dwo_tabpage[2].str_dwo[2].s_dwo_default =  'd_objects_item_grid'
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_form = ''
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_grid = 'd_objects_item_grid'
iastr_dwo_tabpage[2].str_dwo[2].b_master = false
iastr_dwo_tabpage[2].str_dwo[2].b_detail = false
iastr_dwo_tabpage[2].str_dwo[2].b_cascade_del = false
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_master = ';'
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_details = ''
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_shared = ''
iastr_dwo_tabpage[2].str_dwo[2].s_master_keycol = ''
iastr_dwo_tabpage[2].str_dwo[2].s_detail_keycol = ''
iastr_dwo_tabpage[2].str_dwo[2].b_ref_table_yn  = false
iastr_dwo_tabpage[2].str_dwo[2].s_ref_table_field = ''
iastr_dwo_tabpage[2].str_dwo[2].b_insert = false
iastr_dwo_tabpage[2].str_dwo[2].b_update = false
iastr_dwo_tabpage[2].str_dwo[2].b_delete = false
iastr_dwo_tabpage[2].str_dwo[2].b_query = true
iastr_dwo_tabpage[2].str_dwo[2].b_print = true
iastr_dwo_tabpage[2].str_dwo[2].b_excel = true
iastr_dwo_tabpage[2].str_dwo[2].b_drag = true
iastr_dwo_tabpage[2].str_dwo[2].b_traceable = true
iastr_dwo_tabpage[2].str_dwo[2].b_keyboardlocked = false
iastr_dwo_tabpage[2].str_dwo[2].s_description ='DS hàng chọn làm quà'
iastr_dwo_tabpage[2].str_dwo[2].s_gb_name = 'gb_7'

iastr_dwo_tabpage[2].str_dwo[3].s_dwo_default =  'd_filter_new_form'
iastr_dwo_tabpage[2].str_dwo[3].s_dwo_form = 'd_filter_new_form'
iastr_dwo_tabpage[2].str_dwo[3].s_dwo_grid = ''
iastr_dwo_tabpage[2].str_dwo[3].b_master = false
iastr_dwo_tabpage[2].str_dwo[3].b_detail = false
iastr_dwo_tabpage[2].str_dwo[3].b_cascade_del = false
iastr_dwo_tabpage[2].str_dwo[3].s_dwo_master = ';'
iastr_dwo_tabpage[2].str_dwo[3].s_dwo_details = ''
iastr_dwo_tabpage[2].str_dwo[3].s_dwo_shared = ''
iastr_dwo_tabpage[2].str_dwo[3].s_master_keycol = ''
iastr_dwo_tabpage[2].str_dwo[3].s_detail_keycol = ''
iastr_dwo_tabpage[2].str_dwo[3].b_ref_table_yn  = false
iastr_dwo_tabpage[2].str_dwo[3].s_ref_table_field = ''
iastr_dwo_tabpage[2].str_dwo[3].b_insert = false
iastr_dwo_tabpage[2].str_dwo[3].b_update = true
iastr_dwo_tabpage[2].str_dwo[3].b_delete = false
iastr_dwo_tabpage[2].str_dwo[3].b_query = true
iastr_dwo_tabpage[2].str_dwo[3].b_print = true
iastr_dwo_tabpage[2].str_dwo[3].b_excel = true
iastr_dwo_tabpage[2].str_dwo[3].b_traceable = false
iastr_dwo_tabpage[2].str_dwo[3].b_keyboardlocked = false
iastr_dwo_tabpage[2].str_dwo[3].s_description ='Lọc'
iastr_dwo_tabpage[2].str_dwo[3].s_gb_name = ''


iastr_dwo_tabpage[3].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[3].s_description = 'Đối lượng áp dụng (Khách hàng/Nhân viên)'
iastr_dwo_tabpage[3].s_display_model = '1d'
iastr_dwo_tabpage[3].i_index = 3
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_default =  'd_promotion_obj_grid'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_grid = 'd_promotion_obj_grid'
iastr_dwo_tabpage[3].str_dwo[1].b_master = false
iastr_dwo_tabpage[3].str_dwo[1].b_detail = true
iastr_dwo_tabpage[3].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_master = 'd_doc_promotion_grid;'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[3].str_dwo[1].s_master_keycol = 'ID'
iastr_dwo_tabpage[3].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID'
iastr_dwo_tabpage[3].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[3].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE'
iastr_dwo_tabpage[3].str_dwo[1].b_insert = true
iastr_dwo_tabpage[3].str_dwo[1].b_update = true
iastr_dwo_tabpage[3].str_dwo[1].b_delete = true
iastr_dwo_tabpage[3].str_dwo[1].b_query = true
iastr_dwo_tabpage[3].str_dwo[1].b_print = true
iastr_dwo_tabpage[3].str_dwo[1].b_excel = true
iastr_dwo_tabpage[3].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[3].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[3].str_dwo[1].s_description ='Khách hàng/Nhân viên'
iastr_dwo_tabpage[3].str_dwo[1].s_gb_name = ''




end subroutine

on c_promotion.create
call super::create
end on

on c_promotion.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'object'
ib_changed_dwo_4edit = false
this.ib_keyboardlocked = true
is_display_model = 'up_1d_lo_tb'
is_object_title = 'Chương trình khuyễn mãi'
istr_actionpane[1].s_button_name = 'b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_delete;b_create_loc;'
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title
end event

event e_window_open;call super::e_window_open;t_dw_mpl			ldw_main, ldw_item1, ldw_group, ldw_item2, ldw_filter_item
any				laa_value[]

//-- add where vendor --//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '=PROMOTION'
ldw_main.f_add_where('doc_type;',laa_value[])

ldw_item1 = iw_display.dynamic f_get_dw(1,1)
ldw_filter_item =  iw_display.dynamic f_get_dw(1,6)
ldw_filter_item.f_retrieve_dwc_dwfilter( 'colname', ldw_item1.dataobject )



ldw_item1 = iw_display.dynamic f_get_dw(1,2)
laa_value[1] = '=Y'
ldw_item1.f_add_where('active_yn;',laa_value[])
ldw_filter_item =  iw_display.dynamic f_get_dw(1,4)
ldw_filter_item.f_retrieve_dwc_dwfilter( 'colname', ldw_item1.dataobject )

ldw_group = iw_display.dynamic f_get_dw(1,3)
laa_value[1] = 24771803
ldw_group.f_add_where('object_ref_id;',laa_value[])

ldw_item2 = iw_display.dynamic f_get_dw(2,2)
laa_value[1] = '=Y'
ldw_item2.f_add_where('active_yn;',laa_value[])

iw_display.event e_filteron_new( )



return  1
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;
if rpo_dw.dataobject = istr_dwo[1].s_dwo_default then
	rpo_dw.setitem(vl_currentrow,'doc_type','PROMOTION')
elseif rpo_dw.dataobject = 'd_promotion_buy_grid' then
	rpo_dw.setitem(vl_currentrow,'LEVELTYPE', 'buy' )
	rpo_dw.setitem(vl_currentrow,'object_type','ITEM')
elseif rpo_dw.dataobject = 'd_promotion_get_grid' then
	rpo_dw.setitem(vl_currentrow,'LEVELTYPE','get')
end if
return vl_currentrow
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
							istr_actionpane[li_idx].s_visible_buttons =  'b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;b_2080;'
						else
							istr_actionpane[li_idx].s_visible_buttons =  'b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;b_2080;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;b_2080;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;b_2080;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;b_2080;'
					else
						istr_actionpane[li_idx].s_visible_buttons= 'b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;b_2080;'
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

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.dynamic f_set_ii_upperpart_height(1/3)


return 0
end event

event e_dw_dragdrop;call super::e_dw_dragdrop;long			ll_row_found, ll_insert
double		ldb_loc_id, ldb_object_id
string			ls_exists_promote_nm, ls_obj_nm
t_dw_mpl				ldw_tree, ldw_retrieve, ldw_main
b_obj_instantiate		lbo_ins

if  rdw_handling.dataobject = vdw_source.dataobject then return 0

if rdw_handling.dataobject = 'd_promotion_buy_grid' then 
	ldw_main = iw_display.f_get_dwmain( )
	if ldw_main.getrow( ) = 0 then return 0
	if vdw_source.dataobject = 'd_objects_item_grid' then
		ll_row_found = vdw_source.find(" gutter = 'Y' ", 1, vdw_source.rowcount())		
		if ll_row_found = 0 then

			
			//-- cập nhật dòng forcus --//
			if not rdw_handling.dynamic f_get_ib_editing() then 
				iw_display.idw_focus = iw_display.f_get_dwmain( )
				iw_display.event e_modify( )
			end if
			//-- kiểm tra duplicate--//
			ldb_object_id = vdw_source.getitemnumber(vdw_source.getrow(), 'id')
			if rdw_handling.find("object_id =" +string(ldb_object_id), 1, rdw_handling.rowcount()) = 0 then				
				connect using iw_display.it_transaction;
				//-- Kiểm tra item có tham gia CTKM khác không ? --//
				/*
				ls_exists_promote_nm = lbo_ins.f_get_existed_promotion( ldb_object_id,iw_display.it_transaction)
				if ls_exists_promote_nm <> '' then									
					disconnect using iw_display.it_transaction;
					iw_display.event e_save( )
					ls_obj_nm = vdw_source.getitemstring(vdw_source.getrow(), 'short_name')	
					gf_messagebox('m.c_promotion.e_dw_dragdrop.01','Thông báo','Mã hàng ĐANG tham gia CTKM khác: @'+ls_obj_nm+'-'+ls_exists_promote_nm,'exclamation','ok',1)					
					return -1
				end if */
				ll_insert = rdw_handling.dynamic event e_addrow()
				disconnect using iw_display.it_transaction;
				rdw_handling.setitem(ll_insert, 'applied_type','spec')
				rdw_handling.setitem(ll_insert, 'object_id', ldb_object_id )
				rdw_handling.setitem(ll_insert, 'object_name', vdw_source.getitemstring(vdw_source.getrow(), 'name') )
				rdw_handling.setitem(ll_insert, 'manufacturers', vdw_source.getitemstring(vdw_source.getrow(), 'manufacturers') )
//				rdw_handling.setitem(ll_insert, 'f_level_num', 1)
			end if
		elseif ll_row_found > 0 then
			//-- cập nhật dòng chọn --//
			DO WHILE ll_row_found > 0
				if not rdw_handling.dynamic f_get_ib_editing() then 
					iw_display.idw_focus = iw_display.f_get_dwmain( )
					iw_display.event e_modify( )
				end if
				//-- kiểm tra duplicate--//				
				ldb_object_id = vdw_source.getitemnumber(ll_row_found, 'id')
				if rdw_handling.find("object_id =" +string(ldb_object_id), 1, rdw_handling.rowcount()) = 0 then	
					//-- Kiểm tra item có tham gia CTKM khác không ? --//
					/*
					ls_exists_promote_nm = lbo_ins.f_get_existed_promotion( ldb_object_id,iw_display.it_transaction)
					if ls_exists_promote_nm <> '' then											
						disconnect using iw_display.it_transaction;
						iw_display.event e_save( )
						ls_obj_nm = vdw_source.getitemstring(vdw_source.getrow(), 'short_name')	
						gf_messagebox('m.c_promotion.e_dw_dragdrop.01','Thông báo','Mã hàng ĐANG tham gia CTKM khác: @'+ls_obj_nm+'-'+ls_exists_promote_nm,'exclamation','ok',1)						
						return -1
					end if 					*/
					connect using iw_display.it_transaction;
					ll_insert = rdw_handling.dynamic event e_addrow()
					disconnect using iw_display.it_transaction;
					rdw_handling.setitem(ll_insert, 'applied_type','spec')
					rdw_handling.setitem(ll_insert, 'object_id', ldb_object_id )
					rdw_handling.setitem(ll_insert, 'object_name', vdw_source.getitemstring(ll_row_found, 'name') )
					rdw_handling.setitem(ll_insert, 'manufacturers', vdw_source.getitemstring(ll_row_found, 'manufacturers') )
//					rdw_handling.setitem(ll_insert, 'f_level_num', 1)					
				end if
				ll_row_found = vdw_source.find(" gutter = 'Y' ", ll_row_found + 1, vdw_source.rowcount() + 1)
			LOOP
		end if
	elseif  vdw_source.dataobject = 'd_valueset_entry_grid' then
		ldw_main = iw_display.f_get_dwmain( )
		if ldw_main.getrow( ) = 0 then return 0		
		ll_row_found = vdw_source.find(" gutter = 'Y' ", 1, vdw_source.rowcount())		
		if ll_row_found = 0 then
			//-- cập nhật dòng forcus --//
			if not rdw_handling.dynamic f_get_ib_editing() then 
				iw_display.idw_focus = iw_display.f_get_dwmain( )
				iw_display.event e_modify( )
			end if
			//-- kiểm tra duplicate--//				
			ldb_object_id = vdw_source.getitemnumber(vdw_source.getrow(), 'id')
			if rdw_handling.find("MANAGE_GROUP =" +string(ldb_object_id), 1, rdw_handling.rowcount()) = 0 then	
				connect using iw_display.it_transaction;
				ll_insert = rdw_handling.dynamic event e_addrow()
				disconnect using iw_display.it_transaction;
				rdw_handling.setitem(ll_insert, 'applied_type','group')
				rdw_handling.setitem(ll_insert, 'MANAGE_GROUP', ldb_object_id )
				rdw_handling.setitem(ll_insert, 'group_code', vdw_source.getitemstring(vdw_source.getrow(), 'code') )
//				rdw_handling.setitem(ll_insert, 't_level_num', 1)
			end if
		elseif ll_row_found > 0 then
			//-- cập nhật dòng chọn --//
			DO WHILE ll_row_found > 0
				if not rdw_handling.dynamic f_get_ib_editing() then 
					iw_display.idw_focus = iw_display.f_get_dwmain( )
					iw_display.event e_modify( )
				end if
				//-- kiểm tra duplicate--//				
				ldb_object_id = vdw_source.getitemnumber(ll_row_found, 'id')
				if rdw_handling.find("MANAGE_GROUP =" +string(ldb_object_id), 1, rdw_handling.rowcount()) = 0 then			
					connect using iw_display.it_transaction;
					ll_insert = rdw_handling.dynamic event e_addrow()
					disconnect using iw_display.it_transaction;
					rdw_handling.setitem(ll_insert, 'applied_type','group')
					rdw_handling.setitem(ll_insert, 'manage_group', ldb_object_id )
					rdw_handling.setitem(ll_insert, 'group_code', vdw_source.getitemstring(ll_row_found, 'code') )
//					rdw_handling.setitem(ll_insert, 't_level_num', 1)
				end if
				ll_row_found = vdw_source.find(" gutter = 'Y' ", ll_row_found + 1, vdw_source.rowcount() + 1)
			LOOP
		end if
		
	end if
//	if rdw_handling.update() = 1 then
		iw_display.event e_save( )
//		vdw_source.dynamic event e_retrieve()
//		rdw_handling.dynamic event e_retrieve()
//	end if	
elseif  rdw_handling.dataobject = 'd_promotion_get_grid' then
	if vdw_source.dataobject = 'd_objects_item_grid' then
		ll_row_found = vdw_source.find(" gutter = 'Y' ", 1, vdw_source.rowcount())		
		if ll_row_found = 0 then
			//-- cập nhật dòng forcus --//
			if not rdw_handling.dynamic f_get_ib_editing() then 
				iw_display.idw_focus = iw_display.f_get_dwmain( )
				iw_display.event e_modify( )
			end if			
			ldb_object_id = vdw_source.getitemnumber(vdw_source.getrow(), 'id')
			if rdw_handling.find("object_id =" +string(ldb_object_id), 1, rdw_handling.rowcount()) = 0 then		
				connect using iw_display.it_transaction;
				ll_insert = rdw_handling.dynamic event e_addrow()
				disconnect using iw_display.it_transaction;
				rdw_handling.setitem(ll_insert, 'object_type','ITEM')
				rdw_handling.setitem(ll_insert, 'object_id',  ldb_object_id)
				rdw_handling.setitem(ll_insert, 'object_name', vdw_source.getitemstring(vdw_source.getrow(), 'name') )
//				rdw_handling.setitem(ll_insert, 'f_level_num', 1)
			end if
		elseif ll_row_found > 0 then
			//-- cập nhật dòng chọn --//
			DO WHILE ll_row_found > 0
				if not rdw_handling.dynamic f_get_ib_editing() then 
					iw_display.idw_focus = iw_display.f_get_dwmain( )
					iw_display.event e_modify( )
				end if				
				ldb_object_id = vdw_source.getitemnumber(vdw_source.getrow(), 'id')
				if rdw_handling.find("object_id =" +string(ldb_object_id), 1, rdw_handling.rowcount()) = 0 then			
					connect using iw_display.it_transaction;
					ll_insert = rdw_handling.dynamic event e_addrow()
					disconnect using iw_display.it_transaction;
					rdw_handling.setitem(ll_insert, 'object_type','ITEM')
					rdw_handling.setitem(ll_insert, 'object_id', ldb_object_id )
					rdw_handling.setitem(ll_insert, 'object_name', vdw_source.getitemstring(vdw_source.getrow(), 'name') )
//					rdw_handling.setitem(ll_insert, 'f_level_num', 1)					
				end if
				ll_row_found = vdw_source.find(" gutter = 'Y' ", ll_row_found + 1, vdw_source.rowcount() + 1)
			LOOP
		end if
	end if	
//	if rdw_handling.update() = 1 then
		iw_display.event e_save( )
//		vdw_source.dynamic event e_retrieve()
//		rdw_handling.dynamic event e_retrieve()
//	end if	
elseif rdw_handling.dataobject = 'd_objects_item_grid' then
	if vdw_source.dataobject = 'd_promotion_buy_grid' then
		connect using iw_display.it_transaction;
		vdw_source.dynamic event e_delete()
		commit using iw_display.it_transaction;
		disconnect using iw_display.it_transaction;
	end if
end if
return ancestorreturnvalue
end event

event e_dw_e_save;call super::e_dw_e_save;
if rpo_dw.dataobject = 'd_filter_short_full_form' or rpo_dw.dataobject = 'd_filter_short_form' then
	return 0
end if
return ancestorreturnvalue
end event

event e_dw_dwnkey;call super::e_dw_dwnkey;string					ls_text, ls_filterStr, ls_colname
double				ldb_ID
t_dw_mpl			ldw_filter, ldw_main
b_obj_instantiate	lbo_ins

if rpo_dw.classname() = 'dw_4'  and v_keycode = KeyEnter! then
	rpo_dw.accepttext()
	ls_text = rpo_dw.getitemstring(1, 'filter_string')
	ldw_filter = iw_display.dynamic f_get_dw(1,2 )

	ls_colname =  rpo_dw.getitemstring( 1, 'colname')	
	if ls_colname = '' or isnull(ls_colname) then
			ls_colname = 'obj_search'
	end if

	ls_filterStr = lbo_ins.f_get_filterstring( ldw_filter, ls_text, ls_colname)
	ldw_filter.setfilter( ls_filterStr)
	ldw_filter.filter( )
	ldw_filter.f_set_gutter_rowcount( )
	return 2	
elseif rpo_dw.classname() = 'dw_6' and v_keycode = KeyEnter! then
	rpo_dw.accepttext()
	ldw_main = this.iw_display.f_get_Dwmain( )
	if ldw_main.getrow( ) > 0 then		
		ls_text = rpo_dw.getitemstring(1, 'filter_string')
		ldb_ID = ldw_main.getitemnumber(ldw_main.getrow( ) , 'ID')
		
		ldw_filter = iw_display.dynamic f_get_dw(1,1 )
						
		ls_colname =  rpo_dw.getitemstring( 1, 'colname')	
		if ls_colname = '' or isnull(ls_colname) then
			ls_filterStr = lbo_ins.f_get_filterstring( ldw_filter, ls_text)
	//			ls_colname = 'obj_search'
		else
			ls_filterStr = lbo_ins.f_get_filterstring( ldw_filter, ls_text, ls_colname)
		end if
		if ls_filterStr <> '' then
			ls_filterStr += ' AND object_ref_id ='+string(ldb_ID)
		else
			ls_filterStr = 'object_ref_id ='+string(ldb_ID)
		end if
		
		ldw_filter.setfilter( ls_filterStr)
		ldw_filter.filter( )
		ldw_filter.f_set_gutter_rowcount( )
	end if
	return 2		
elseif rpo_dw.dataobject = 'd_filter_new_form'  and v_keycode = KeyEnter! then
	rpo_dw.accepttext()
	ls_text = rpo_dw.getitemstring(1, 'filter_string')
	ldw_filter = iw_display.dynamic f_get_dw( 2,2)
	ls_filterStr = lbo_ins.f_get_filterstring( ldw_filter, ls_text)
	ldw_filter.setfilter( ls_filterStr)
	ldw_filter.filter( )
	ldw_filter.f_set_gutter_rowcount( )
	return 2	
elseif rpo_dw.dataobject = 'd_filter_short_form'  and v_keycode = KeyEnter! then
	rpo_dw.accepttext()
	ls_text = rpo_dw.getitemstring(1, 'filter_string')
	ldw_filter = iw_display.dynamic f_get_dw(1,3 )
	ls_filterStr = lbo_ins.f_get_filterstring( ldw_filter, ls_text)
	ldw_filter.setfilter( ls_filterStr)
	ldw_filter.filter( )
	ldw_filter.f_set_gutter_rowcount( )
	return 2	
end if
return ancestorreturnvalue
end event

event e_window_e_presave;call super::e_window_e_presave;


if iw_display.idw_focus.dataobject  = 'd_filter_new_form' or iw_display.idw_focus.dataobject  = 'd_filter_short_form' then
	iw_display.idw_focus = iw_display.f_get_dwmain( )
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

event e_window_e_refresh;call super::e_window_e_refresh;t_dw_mpl		ldw_tmp

ldw_tmp = iw_display.dynamic f_get_dw(1,2)
//if ldw_tmp.rowcount( ) = 0 then
	ldw_tmp.event e_retrieve( )
//end if

ldw_tmp = iw_display.dynamic f_get_dw(1,3)
//if ldw_tmp.rowcount( ) = 0 then
	ldw_tmp.event e_retrieve( )
//end if

ldw_tmp = iw_display.dynamic f_get_dw(2,2)
//if ldw_tmp.rowcount( ) = 0 then
	ldw_tmp.event e_retrieve( )
//end if
return 0
end event

event e_dw_rowfocuschanged;call super::e_dw_rowfocuschanged;t_dw_mpl		ldw_filter

if rpo_dw.dataobject = 'd_doc_promotion_grid'  then
	ldw_filter = iw_display.dynamic f_get_dw(1,6 )
	ldw_filter.setitem( 1, 'filter_string', '')
end if

return ancestorreturnvalue
end event

