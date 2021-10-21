$PBExportHeader$c_warehouse.sru
forward
global type c_warehouse from s_object_display
end type
end forward

global type c_warehouse from s_object_display
event type integer e_action_create_loc ( )
end type
global c_warehouse c_warehouse

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_dwo_related ()
end prototypes

event type integer e_action_create_loc();long				ll_row
int					li_f_aisle, li_t_aisle, li_f_line, li_t_line, li_f_floor, li_t_floor
string				ls_f_aisle, ls_t_aisle, ls_f_line, ls_t_line, ls_f_floor, ls_t_floor
t_dw_mpl		ldw_parm

FOR ll_row = 1 to ldw_parm.rowcount( )
	ls_f_aisle = ldw_parm.getitemstring( ll_row,'f_aisle')

	ls_t_aisle = ldw_parm.getitemstring( ll_row,'t_aisle')
	ls_f_line = ldw_parm.getitemstring( ll_row,'f_line')
	ls_t_line = ldw_parm.getitemstring( ll_row,'t_line')
	ls_f_floor = ldw_parm.getitemstring( ll_row,'f_floor')
	ls_t_floor = ldw_parm.getitemstring( ll_row,'t_floor')	
	
	
NEXT
return 1
end event

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_object_wh_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_object_wh_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_details = 'd_address_grid;d_zones_grid;d_location_tree_grid;'
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

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name = 'b_goods_delivery;b_goods_receipt;'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_related_report'
istr_actionpane[3].s_button_name =  'b_inventory_io; b_inventory_onhand'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Báo cáo liên quan'

istr_actionpane[4].s_dwo_action = 'd_action_manage'
istr_actionpane[4].s_objname_handling = this.classname( )
istr_actionpane[4].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_dwo_tabpage ();
iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1dgb_1dgb'
iastr_dwo_tabpage[1].i_leftpart_width = 1/3
iastr_dwo_tabpage[1].i_index = 1
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_address_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_address_grid'
iastr_dwo_tabpage[1].str_dwo[1].b_master = true
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_object_wh_grid;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = 'd_address_form;'
iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol = 'ID'
iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID'
iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE'
iastr_dwo_tabpage[1].str_dwo[1].b_insert = true
iastr_dwo_tabpage[1].str_dwo[1].b_update = true
iastr_dwo_tabpage[1].str_dwo[1].b_delete = true
iastr_dwo_tabpage[1].str_dwo[1].b_query = true
iastr_dwo_tabpage[1].str_dwo[1].b_print = true
iastr_dwo_tabpage[1].str_dwo[1].b_excel = true
iastr_dwo_tabpage[1].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Địa điểm'
iastr_dwo_tabpage[1].str_dwo[1].s_gb_name = 'gb_6'

iastr_dwo_tabpage[1].str_dwo[2].s_dwo_default =  'd_address_form'
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_form = 'd_address_form'
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_grid = ''
iastr_dwo_tabpage[1].str_dwo[2].b_master = false
iastr_dwo_tabpage[1].str_dwo[2].b_detail = false
iastr_dwo_tabpage[1].str_dwo[2].b_shared = true
iastr_dwo_tabpage[1].str_dwo[2].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_master = 'd_address_grid;'
iastr_dwo_tabpage[1].str_dwo[2].s_master_keycol = ''
iastr_dwo_tabpage[1].str_dwo[2].s_detail_keycol = ''
iastr_dwo_tabpage[1].str_dwo[2].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[2].s_ref_table_field = ''
iastr_dwo_tabpage[1].str_dwo[2].b_insert = true
iastr_dwo_tabpage[1].str_dwo[2].b_update = true
iastr_dwo_tabpage[1].str_dwo[2].b_delete = true
iastr_dwo_tabpage[1].str_dwo[2].b_query = true
iastr_dwo_tabpage[1].str_dwo[2].b_print = true
iastr_dwo_tabpage[1].str_dwo[2].b_excel = true
iastr_dwo_tabpage[1].str_dwo[2].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[2].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[2].s_description ='Địa chỉ'
iastr_dwo_tabpage[1].str_dwo[2].s_gb_name = 'gb_7'

iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_display_model = '1d'
iastr_dwo_tabpage[2].i_index = 2
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_zones_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = 'd_zones_grid'
iastr_dwo_tabpage[2].str_dwo[1].b_master = true
iastr_dwo_tabpage[2].str_dwo[1].b_detail = true
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_object_wh_grid;'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_details = 'd_location_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[2].str_dwo[1].s_master_keycol = 'ID'
iastr_dwo_tabpage[2].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID'
iastr_dwo_tabpage[2].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[2].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE'
iastr_dwo_tabpage[2].str_dwo[1].b_insert = true
iastr_dwo_tabpage[2].str_dwo[1].b_update = true
iastr_dwo_tabpage[2].str_dwo[1].b_delete = true
iastr_dwo_tabpage[2].str_dwo[1].b_query = true
iastr_dwo_tabpage[2].str_dwo[1].b_print = true
iastr_dwo_tabpage[2].str_dwo[1].b_excel = true
iastr_dwo_tabpage[2].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[2].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[2].str_dwo[1].s_description ='Phân khu trong kho'
iastr_dwo_tabpage[2].str_dwo[1].s_gb_name = 'gb_6'

iastr_dwo_tabpage[3].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[3].s_display_model = '1d'
iastr_dwo_tabpage[3].i_index = 3
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_default =  'd_location_grid'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_grid = 'd_location_grid'
iastr_dwo_tabpage[3].str_dwo[1].b_master = false
iastr_dwo_tabpage[3].str_dwo[1].b_detail = true
iastr_dwo_tabpage[3].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_master = 'd_zones_grid;'
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
iastr_dwo_tabpage[3].str_dwo[1].s_description ='Vị trí trong kho'
iastr_dwo_tabpage[3].str_dwo[1].s_gb_name = 'gb_6'



iastr_dwo_tabpage[4].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[4].s_display_model = '1dgb_1df_1df'
iastr_dwo_tabpage[4].i_index = 4
iastr_dwo_tabpage[4].i_leftpart_width = 1/3
iastr_dwo_tabpage[4].i_midpart_width = 1/3
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_default =  'd_location_tree_grid'
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_form = 'd_location_tree_grid'
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_grid = ''
iastr_dwo_tabpage[4].str_dwo[1].b_master = true
iastr_dwo_tabpage[4].str_dwo[1].b_detail = true
iastr_dwo_tabpage[4].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_master = 'd_object_wh_grid;'
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_details = 'd_item_w_loc_grid;'
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[4].str_dwo[1].s_master_keycol = 'ID'
iastr_dwo_tabpage[4].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID'
iastr_dwo_tabpage[4].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[4].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE'
iastr_dwo_tabpage[4].str_dwo[1].b_insert = false
iastr_dwo_tabpage[4].str_dwo[1].b_update = false
iastr_dwo_tabpage[4].str_dwo[1].b_delete = false
iastr_dwo_tabpage[4].str_dwo[1].b_query = true
iastr_dwo_tabpage[4].str_dwo[1].b_print = true
iastr_dwo_tabpage[4].str_dwo[1].b_excel = true
iastr_dwo_tabpage[4].str_dwo[1].b_drag = true
iastr_dwo_tabpage[4].str_dwo[1].b_traceable = false
iastr_dwo_tabpage[4].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[4].str_dwo[1].s_description ='Cây vị trí'
iastr_dwo_tabpage[4].str_dwo[1].s_gb_name = 'gb_6'

iastr_dwo_tabpage[4].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[4].i_index = 4
iastr_dwo_tabpage[4].str_dwo[2].s_dwo_default =  'd_item_w_loc_grid'
iastr_dwo_tabpage[4].str_dwo[2].s_dwo_form = ''
iastr_dwo_tabpage[4].str_dwo[2].s_dwo_grid = 'd_item_w_loc_grid'
iastr_dwo_tabpage[4].str_dwo[2].b_master = false
iastr_dwo_tabpage[4].str_dwo[2].b_detail = true
iastr_dwo_tabpage[4].str_dwo[2].b_cascade_del = true
iastr_dwo_tabpage[4].str_dwo[2].s_dwo_master = 'd_location_tree_grid;'
iastr_dwo_tabpage[4].str_dwo[2].s_dwo_details = ''
iastr_dwo_tabpage[4].str_dwo[2].s_dwo_shared = ''
iastr_dwo_tabpage[4].str_dwo[2].s_master_keycol = 'id'
iastr_dwo_tabpage[4].str_dwo[2].s_detail_keycol = 'location'
iastr_dwo_tabpage[4].str_dwo[2].b_ref_table_yn  = false
iastr_dwo_tabpage[4].str_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE'
iastr_dwo_tabpage[4].str_dwo[2].b_insert = false
iastr_dwo_tabpage[4].str_dwo[2].b_update = false
iastr_dwo_tabpage[4].str_dwo[2].b_delete = false
iastr_dwo_tabpage[4].str_dwo[2].b_query = true
iastr_dwo_tabpage[4].str_dwo[2].b_print = true
iastr_dwo_tabpage[4].str_dwo[2].b_excel = true
iastr_dwo_tabpage[4].str_dwo[2].b_drag = true
iastr_dwo_tabpage[4].str_dwo[2].b_traceable = false
iastr_dwo_tabpage[4].str_dwo[2].b_keyboardlocked = true
iastr_dwo_tabpage[4].str_dwo[2].s_description = 'Mã hàng có vị trí mặc định'
iastr_dwo_tabpage[4].str_dwo[2].s_gb_name = 'gb_7'

iastr_dwo_tabpage[4].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[4].i_index = 4
iastr_dwo_tabpage[4].str_dwo[3].s_dwo_default =  'd_item_wo_loc_grid'
iastr_dwo_tabpage[4].str_dwo[3].s_dwo_form = ''
iastr_dwo_tabpage[4].str_dwo[3].s_dwo_grid = 'd_item_wo_loc_grid'
iastr_dwo_tabpage[4].str_dwo[3].b_master = false
iastr_dwo_tabpage[4].str_dwo[3].b_detail = false
iastr_dwo_tabpage[4].str_dwo[3].b_cascade_del = true
iastr_dwo_tabpage[4].str_dwo[3].s_dwo_master = ''
iastr_dwo_tabpage[4].str_dwo[3].s_dwo_details = ''
iastr_dwo_tabpage[4].str_dwo[3].s_dwo_shared = ''
iastr_dwo_tabpage[4].str_dwo[3].s_master_keycol = ''
iastr_dwo_tabpage[4].str_dwo[3].s_detail_keycol = ''
iastr_dwo_tabpage[4].str_dwo[3].b_ref_table_yn  = false
iastr_dwo_tabpage[4].str_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE'
iastr_dwo_tabpage[4].str_dwo[3].b_insert = false
iastr_dwo_tabpage[4].str_dwo[3].b_update = false
iastr_dwo_tabpage[4].str_dwo[3].b_delete = false
iastr_dwo_tabpage[4].str_dwo[3].b_query = true
iastr_dwo_tabpage[4].str_dwo[3].b_print = true
iastr_dwo_tabpage[4].str_dwo[3].b_excel = true
iastr_dwo_tabpage[4].str_dwo[3].b_drag = true
iastr_dwo_tabpage[4].str_dwo[3].b_traceable = false
iastr_dwo_tabpage[4].str_dwo[3].b_keyboardlocked = true
iastr_dwo_tabpage[4].str_dwo[3].s_description = 'Mã hàng chưa có vị trí mặc định'
iastr_dwo_tabpage[4].str_dwo[3].s_gb_name = 'gb_8'

iastr_dwo_tabpage[4].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[4].i_index = 4
iastr_dwo_tabpage[4].str_dwo[4].s_dwo_default =  'd_filter_new_form'
iastr_dwo_tabpage[4].str_dwo[4].s_dwo_form = 'd_filter_new_form'
iastr_dwo_tabpage[4].str_dwo[4].s_dwo_grid = ''
iastr_dwo_tabpage[4].str_dwo[4].b_master = false
iastr_dwo_tabpage[4].str_dwo[4].b_detail = false
iastr_dwo_tabpage[4].str_dwo[4].b_cascade_del = true
iastr_dwo_tabpage[4].str_dwo[4].s_dwo_master = ''
iastr_dwo_tabpage[4].str_dwo[4].s_dwo_details = ''
iastr_dwo_tabpage[4].str_dwo[4].s_dwo_shared = ''
iastr_dwo_tabpage[4].str_dwo[4].s_master_keycol = ''
iastr_dwo_tabpage[4].str_dwo[4].s_detail_keycol = ''
iastr_dwo_tabpage[4].str_dwo[4].b_ref_table_yn  = false
iastr_dwo_tabpage[4].str_dwo[4].s_ref_table_field = 'OBJECT_REF_TABLE'
iastr_dwo_tabpage[4].str_dwo[4].b_insert = false
iastr_dwo_tabpage[4].str_dwo[4].b_update = true
iastr_dwo_tabpage[4].str_dwo[4].b_delete = false
iastr_dwo_tabpage[4].str_dwo[4].b_query = true
iastr_dwo_tabpage[4].str_dwo[4].b_print = true
iastr_dwo_tabpage[4].str_dwo[4].b_excel = true
iastr_dwo_tabpage[4].str_dwo[4].b_drag = false
iastr_dwo_tabpage[4].str_dwo[4].b_traceable = false
iastr_dwo_tabpage[4].str_dwo[4].b_keyboardlocked = false
iastr_dwo_tabpage[4].str_dwo[4].s_description = 'lọc'
iastr_dwo_tabpage[4].str_dwo[4].s_gb_name = ''

iastr_dwo_tabpage[4].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[4].i_index = 4
iastr_dwo_tabpage[4].str_dwo[5].s_dwo_default =  'd_filter_new_form'
iastr_dwo_tabpage[4].str_dwo[5].s_dwo_form = 'd_filter_new_form'
iastr_dwo_tabpage[4].str_dwo[5].s_dwo_grid = ''
iastr_dwo_tabpage[4].str_dwo[5].b_master = false
iastr_dwo_tabpage[4].str_dwo[5].b_detail = false
iastr_dwo_tabpage[4].str_dwo[5].b_cascade_del = false
iastr_dwo_tabpage[4].str_dwo[5].s_dwo_master = ''
iastr_dwo_tabpage[4].str_dwo[5].s_dwo_details = ''
iastr_dwo_tabpage[4].str_dwo[5].s_dwo_shared = ''
iastr_dwo_tabpage[4].str_dwo[5].s_master_keycol = ''
iastr_dwo_tabpage[4].str_dwo[5].s_detail_keycol = ''
iastr_dwo_tabpage[4].str_dwo[5].b_ref_table_yn  = false
iastr_dwo_tabpage[4].str_dwo[5].s_ref_table_field = 'OBJECT_REF_TABLE'
iastr_dwo_tabpage[4].str_dwo[5].b_insert = false
iastr_dwo_tabpage[4].str_dwo[5].b_update = true
iastr_dwo_tabpage[4].str_dwo[5].b_delete = false
iastr_dwo_tabpage[4].str_dwo[5].b_query = true
iastr_dwo_tabpage[4].str_dwo[5].b_print = true
iastr_dwo_tabpage[4].str_dwo[5].b_excel = true
iastr_dwo_tabpage[4].str_dwo[5].b_drag = false
iastr_dwo_tabpage[4].str_dwo[5].b_traceable = false
iastr_dwo_tabpage[4].str_dwo[5].b_keyboardlocked = false
iastr_dwo_tabpage[4].str_dwo[5].s_description = 'Lọc'
iastr_dwo_tabpage[4].str_dwo[5].s_gb_name = ''
end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'c_map_n'
istr_dwo_related[1].s_main_obj_dwo = 'd_address_form'
istr_dwo_related[1].s_main_obj_column = 'ID'
istr_dwo_related[1].s_related_obj_dwo = 'd_address_map_form'
istr_dwo_related[1].s_related_obj_column = 'id'
end subroutine

on c_warehouse.create
call super::create
end on

on c_warehouse.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'object'
ib_changed_dwo_4edit = false
this.ib_keyboardlocked = true
is_display_model = 'up_1d_lo_tb'
is_object_title = 'Danh sách kho báo kho'
istr_actionpane[1].s_button_name = 'b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_delete;b_create_loc;'
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title
end event

event e_window_open;call super::e_window_open;t_dw_mpl			ldw_main
any				laa_value[]

//-- add where vendor --//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '=WAREHOUSE'
ldw_main.f_add_where('object_ref_table;',laa_value[])
return  0
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;
if rpo_dw.dataobject = istr_dwo[1].s_dwo_default then
	rpo_dw.setitem(vl_currentrow,'object_ref_table','WAREHOUSE')
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query; b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query; b_refresh;b_delete;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;'
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

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.dynamic f_set_ii_upperpart_height(1/4)


return 0
end event

event e_dw_dragdrop;call super::e_dw_dragdrop;long			ll_row_found
double		ldb_loc_id
t_dw_mpl	ldw_tree, ldw_retrieve
if rdw_handling.dataobject = 'd_item_w_loc_grid' then
	if vdw_source.dataobject = 'd_item_wo_loc_grid' then
		if rdw_handling.rowcount() > 0 then
			ldb_loc_id = rdw_handling.getitemnumber( 1, 'location' )
		else
			ldw_tree = iw_display.f_get_dw( 'd_location_tree_form')
			if ldw_tree.getrow( ) > 0 then
				ldb_loc_id = ldw_tree.getitemnumber(  ldw_tree.getrow( ), 'id' )
			else
				return 0
			end if
		end if
		ll_row_found = vdw_source.find(" gutter = 'Y' ", 1, vdw_source.rowcount())		
		if ll_row_found = 0 then
			//-- cập nhật dòng forcus --//
			vdw_source.setitem(vdw_source.getrow(), 'location', ldb_loc_id)
		elseif ll_row_found > 0 then
			//-- cập nhật dòng chọn --//
			DO WHILE ll_row_found > 0
				vdw_source.setitem(ll_row_found, 'location', ldb_loc_id)
				ll_row_found = vdw_source.find(" gutter = 'Y' ", ll_row_found + 1, vdw_source.rowcount() + 1)
			LOOP
		end if
		if vdw_source.update() = 1 then
			iw_display.event e_save( )
			vdw_source.dynamic event e_retrieve()
			rdw_handling.dynamic event e_retrieve()
		end if
	end if
elseif  rdw_handling.dataobject = 'd_item_wo_loc_grid' then
	if vdw_source.dataobject = 'd_item_w_loc_grid' then
		ll_row_found = vdw_source.find(" gutter = 'Y' ", 1, vdw_source.rowcount())		
		if ll_row_found = 0 then
			//-- cập nhật dòng forcus --//
			setnull(ldb_loc_id)
			vdw_source.setitem(vdw_source.getrow(), 'location', ldb_loc_id)
		elseif ll_row_found > 0 then
			//-- cập nhật dòng chọn --//
			DO WHILE ll_row_found > 0
				setnull(ldb_loc_id)
				vdw_source.setitem(ll_row_found, 'location', ldb_loc_id)
				ll_row_found = vdw_source.find(" gutter = 'Y' ", ll_row_found + 1, vdw_source.rowcount() + 1)
			LOOP
		end if
		if vdw_source.update() = 1 then
			iw_display.event e_save( )
			vdw_source.dynamic event e_retrieve()
			rdw_handling.dynamic event e_retrieve()
		end if		
	end if	
elseif  rdw_handling.dataobject = 'd_location_tree_grid' then
	if vl_row > 0 then
		ldb_loc_id = rdw_handling.getitemnumber( vl_row, 'ID' )
		if vdw_source.dataobject = 'd_item_w_loc_grid' or vdw_source.dataobject = 'd_item_wo_loc_grid' then
			
			ll_row_found = vdw_source.find(" gutter = 'Y' ", 1, vdw_source.rowcount())		
			if ll_row_found = 0 then
				//-- cập nhật dòng forcus --//
				vdw_source.setitem(vdw_source.getrow(), 'location', ldb_loc_id)
			elseif ll_row_found > 0 then
				//-- cập nhật dòng chọn --//
				DO WHILE ll_row_found > 0
					vdw_source.setitem(ll_row_found, 'location', ldb_loc_id)
					ll_row_found = vdw_source.find(" gutter = 'Y' ", ll_row_found + 1, vdw_source.rowcount() + 1)
				LOOP
			end if
			if vdw_source.update() = 1 then
				iw_display.event e_save( )
				rdw_handling.scrolltorow(vl_row)
				vdw_source.dynamic event e_retrieve()
				if vdw_source.dataobject = 'd_item_w_loc_grid' then
					ldw_retrieve = iw_display.f_get_dw( 'd_item_wo_loc_grid')
				else
					ldw_retrieve = iw_display.f_get_dw( 'd_item_w_loc_grid')
				end if
				ldw_retrieve.event e_retrieve( )
			end if		
		end if		
	end if
end if
return ancestorreturnvalue
end event

event e_dw_e_save;call super::e_dw_e_save;
if rpo_dw.dataobject = 'd_filter_new_form' then
	return 0
end if
return ancestorreturnvalue
end event

event e_dw_dwnkey;call super::e_dw_dwnkey;string					ls_text, ls_filterStr
t_dw_mpl			ldw_filter
b_obj_instantiate	lbo_ins

if rpo_dw.dataobject = 'd_filter_new_form'  and v_keycode = KeyEnter! then
	rpo_dw.accepttext()
	ls_text = rpo_dw.getitemstring(1, 'filter_string')
	if  rpo_dw.classname() = 'dw_5' then
		ldw_filter = iw_display.f_get_dw( 'd_item_wo_loc_grid')
	else
		ldw_filter = iw_display.f_get_dw( 'd_item_w_loc_grid')
	end if
	ls_filterStr = lbo_ins.f_get_filterstring( ldw_filter, ls_text)
	ldw_filter.setfilter( ls_filterStr)
	ldw_filter.filter( )
	ldw_filter.f_set_gutter_rowcount( )
	return 2
end if
return ancestorreturnvalue
end event

