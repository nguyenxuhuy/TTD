$PBExportHeader$c_bom.sru
forward
global type c_bom from s_object_display
end type
end forward

global type c_bom from s_object_display
event type integer e_action_estimate ( )
end type
global c_bom c_bom

type variables
int						ii_left_cut, ii_right_cut, ii_back_cut, ii_front_cut
protected:
long							il_tv_insert_hdl, il_delete_hdl_item, il_modify_hdl
boolean						ib_add_branch


end variables

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_dwo_related ()
public subroutine f_set_actionpane ()
public function long f_tv_scroll2row (treeview vtv_bom)
public function integer f_update_line_no (t_dw_mpl vdw_line, long vl_row)
public subroutine f_set_str_unit ()
public function integer f_insert_labour (double vdb_bom_id, double vdb_bom_line_id, double vdb_labour_id, double vdb_mat_qty, double vdb_fg_qty, double vdb_cost)
public function integer f_del_labour (double vdb_bom_id, double vdb_bom_line_id)
end prototypes

event type integer e_action_estimate();double				ldb_bom_id, ldb_pro_cost, ldb_bom_root, ldb_base_currID, ldb_curr_round_id, ldb_fg_qty_sum, ldb_labor_cost, ldb_fg_qty
double				ldb_object_ref_id, ldb_id, ldb_labor_id, ldb_bom_fg_qty, ldb_mat_cost, ldb_bom_overhead, ldb_bom_mat
long					ll_cnt, ll_found, ll_row, ll_cnt2
int						li_level_max, li_level
string					ls_base_currCode, ls_base_currName, ls_base_type

t_dw_mpl			ldw_main 
t_ds_db				lds_bom_rollup, lds_bom_detail

this.ic_unit_instance.f_get_base_cur( ldb_base_currID, ls_base_currCode, ls_base_currName)
ldb_curr_round_id = ic_unit_instance.f_get_round_id( ldb_base_currID, 0, 'amount')

ldw_main = iw_display.f_get_dwmain( )
if ldw_main.getrow( ) > 0 then
	ldb_bom_root = ldw_main.getitemnumber( ldw_main.getrow( ), 'ID')
	lds_bom_rollup = create t_ds_db
	lds_bom_rollup.dataobject = 'ds_bom_rollup'
	lds_bom_rollup.f_settransobject( it_transaction )
	lds_bom_rollup.setsort( "level d")
	ll_cnt = lds_bom_rollup.retrieve(9, ldb_bom_root)
	
	lds_bom_detail = create t_ds_db
	lds_bom_detail.dataobject = 'ds_bom_detail'
	lds_bom_detail.f_settransobject( it_transaction )
	
	if ll_cnt > 0 then
		FOR ll_row = 1 to ll_cnt
			this.of_show_progress( integer(ll_row/ll_cnt*100), 'Đang giá trị định mức')
			ldb_labor_id = 0
			ldb_bom_id = lds_bom_rollup.getitemnumber(ll_row,'bom_id')
			if isnull(ldb_bom_id) then continue 
			ll_cnt2 = lds_bom_detail.retrieve(1, ldb_bom_id)
			if ll_cnt2 = 0 then continue
			
			ll_found = lds_bom_detail.find( "item_type = 'LABOUR'", 1, lds_bom_detail.rowcount())
			if ll_found > 0 then	ldb_labor_id =  lds_bom_detail.getitemnumber(ll_found,'item_id')
			ll_found = lds_bom_detail.find( "item_type <> 'LABOUR'", 1, lds_bom_detail.rowcount())
			ls_base_type = lds_bom_detail.getitemstring(ll_found,'base_type')
			ldb_fg_qty = lds_bom_detail.getitemnumber(ll_found,'fg_qty')
			ldb_object_ref_id = lds_bom_detail.getitemnumber(ll_found,'object_ref_id')
			ldb_bom_mat = double(lds_bom_detail.describe("Evaluate('Sum( if( item_type = ~~'BOM~~' , mat_cost,0) )', 0)" ))
			ldb_bom_overhead = double(lds_bom_detail.describe("Evaluate('Sum( if( item_type = ~~'BOM~~' , overhead_cost,0) )', 0)" ))
			if isnull(ldb_bom_overhead) then ldb_bom_overhead = 0
			if isnull(ldb_bom_mat) then ldb_bom_mat = 0		
			
			if ls_base_type = 'volumn_mat' or ls_base_type = 'coffa_pillar_mat' or ls_base_type = 'coffa_beam_mat'  then
				ldb_pro_cost = double(lds_bom_detail.describe("Evaluate('Sum( if( not isnull(base_type) , unit_cost*mat_qty,0) )', 0)" ))
				
				ldb_mat_cost = double(lds_bom_detail.describe("Evaluate('Sum( if( item_type = ~~'ITEM~~' , unit_cost*mat_qty,0) )', 0)" ))
				ldb_labor_cost = double(lds_bom_detail.describe("Evaluate('Sum( if( item_type = ~~'LABOUR~~' , unit_cost/fg_qty,0) )', 0)" ))
				
				ldb_fg_qty_sum = double(lds_bom_detail.describe("Evaluate('Sum( if( not isnull(base_type)  , fg_qty,0) )', 0)" ))
				ldb_pro_cost = ldb_bom_mat + ldb_mat_cost + ldb_fg_qty_sum * ldb_labor_cost + ldb_bom_overhead
				ldb_pro_cost = ic_unit_instance.f_round( it_transaction , ldb_curr_round_id, ldb_pro_cost)
				//-- INSERT LABOUR--//
				if (ldb_labor_cost > 0 and ldb_labor_id > 0) or ldb_bom_overhead > 0 then			
					ldb_labor_cost = ic_unit_instance.f_round( it_transaction , ldb_curr_round_id, ldb_fg_qty_sum * ldb_labor_cost  + ldb_bom_overhead)
					if this.f_insert_labour(ldb_bom_id, ldb_object_ref_id, ldb_labor_id,1, ldb_fg_qty_sum,  ldb_labor_cost) = -1 then return -1
				else
					if this.f_del_labour( ldb_bom_id, ldb_object_ref_id) = -1 then return -1
				end if
				ldb_bom_fg_qty = ldb_fg_qty_sum
			elseif  ls_base_type = 'volumn_fg' or ls_base_type = 'coffa_pillar_fg' or ls_base_type = 'coffa_beam_fg'  then
				ldb_pro_cost = double(lds_bom_detail.describe("Evaluate('Sum( if(   not isnull(base_type) , unit_cost*mat_qty,0) )', 0)" ))
				
				ldb_mat_cost = double(lds_bom_detail.describe("Evaluate('Sum( if( item_type = ~~'ITEM~~' , unit_cost*mat_qty,0) )', 0)" ))
				ldb_labor_cost = double(lds_bom_detail.describe("Evaluate('Sum( if(  item_type = ~~'LABOUR~~' , unit_cost/fg_qty,0) )', 0)" ))
				
				ldb_pro_cost =  ldb_bom_mat + ldb_mat_cost + ldb_fg_qty * ldb_labor_cost + ldb_bom_overhead
				ldb_pro_cost = ic_unit_instance.f_round( it_transaction , ldb_curr_round_id, ldb_pro_cost)
				//-- INSERT LABOUR--//
				if (ldb_labor_cost > 0 and ldb_labor_id > 0) or ldb_bom_overhead > 0 then			
					ldb_labor_cost = ic_unit_instance.f_round( it_transaction , ldb_curr_round_id, ldb_fg_qty * ldb_labor_cost + ldb_bom_overhead)
					if this.f_insert_labour(ldb_bom_id, ldb_object_ref_id, ldb_labor_id,1, ldb_fg_qty,  ldb_labor_cost) = -1 then return -1
				else
					if this.f_del_labour(ldb_bom_id, ldb_object_ref_id) = -1 then return -1
				end if				
				ldb_bom_fg_qty = ldb_fg_qty
			elseif ls_base_type = 'sum_semi_fg' then
				ldb_pro_cost = double(lds_bom_detail.describe("Evaluate('Sum( if(  not isnull(base_type) , unit_cost*mat_qty/fg_qty,0) )', 0)" ))
				
				ldb_mat_cost = double(lds_bom_detail.describe("Evaluate('Sum( if( item_type = ~~'ITEM~~' , unit_cost*mat_qty,0) )', 0)" ))
				ldb_labor_cost = double(lds_bom_detail.describe("Evaluate('Sum( if( item_type = ~~'LABOUR~~' , unit_cost/fg_qty,0) )', 0)" ))
				ldb_fg_qty_sum = double(lds_bom_detail.describe("Evaluate('Sum( if( not isnull(base_type)  , fg_qty,0) )', 0)" ))
				
				ldb_pro_cost =  ldb_bom_mat + ldb_mat_cost + ldb_fg_qty_sum * ldb_labor_cost + ldb_bom_overhead
				ldb_pro_cost = ic_unit_instance.f_round( it_transaction , ldb_curr_round_id, ldb_pro_cost)				
				//-- INSERT LABOUR--//
				if (ldb_labor_cost > 0 and ldb_labor_id > 0) or ldb_bom_overhead > 0 then		
					ldb_labor_cost = ic_unit_instance.f_round( it_transaction , ldb_curr_round_id, ldb_fg_qty_sum * ldb_labor_cost + ldb_bom_overhead)
					if this.f_insert_labour(ldb_bom_id, ldb_object_ref_id, ldb_labor_id,1, ldb_fg_qty_sum, ldb_labor_cost) = -1 then return -1
				else
					if this.f_del_labour(ldb_bom_id,  ldb_object_ref_id) = -1 then return -1
				end if								
				ldb_bom_fg_qty = ldb_fg_qty_sum
			else
				ldb_pro_cost = double(lds_bom_rollup.describe("Evaluate('Sum( if( bom_id = " + string(ldb_bom_id)  +" , unit_cost*mat_qty/fg_qty,0) )', 0)" ))
				
				ldb_pro_cost = ic_unit_instance.f_round( it_transaction , ldb_curr_round_id, ldb_pro_cost)			
				ldb_bom_fg_qty = 1
			end if
			UPDATE item SET ROLLUP_COST_PRICE = :ldb_pro_cost , bom_fg_qty = :ldb_bom_fg_qty , mat_cost = :ldb_mat_cost + :ldb_bom_mat
			where object_ref_id = :ldb_bom_id using it_transaction;
			ldb_id = this.f_create_id( )
		NEXT
		
	end if
end if

destroy lds_bom_rollup
destroy lds_bom_detail

commit using it_transaction;
this.of_show_progress(101, 'Đang tạo dữ liệu kiểm kê')

this.iw_display.event e_refresh( )


return 1
end event

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_object_bom_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_object_bom_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_bom_hdr_form;d_item_spec_grid;'
istr_dwo[1].b_ref_table_yn  = true
istr_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].b_traceable = true
istr_dwo[1].s_description = 'Mã, tên công thức'
istr_dwo[1].s_gb_name = 'gb_6'


istr_dwo[2].s_dwo_default =  'd_bom_hdr_form'
istr_dwo[2].s_dwo_form = 'd_bom_hdr_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_detail = true
istr_dwo[2].b_master = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_master = 'd_object_bom_grid;'
istr_dwo[2].s_dwo_details = 'd_bom_line_grid;'
istr_dwo[2].b_relation_1_1 = true
istr_dwo[2].s_master_keycol = 'ID'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[2].b_ref_table_yn  = true
istr_dwo[2].s_ref_table_field = 'type;'
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].b_focus_master = true
istr_dwo[2].s_description = 'Sản phẩm'
istr_dwo[2].s_gb_name = 'gb_7'
//istr_dwo[2].s_pic_ref_table = 'LEGAL_ENTITY'
//istr_dwo[2].s_pic_ref_field = 'object_ref_id'
//istr_dwo[2].s_pic_ref_colname = 'LOGO'

istr_dwo[3].s_dwo_default =  'd_item_spec_grid'
istr_dwo[3].s_dwo_form = ''
istr_dwo[3].s_dwo_grid = 'd_item_spec_grid'
istr_dwo[3].b_detail = true
istr_dwo[3].b_master = false
istr_dwo[3].b_cascade_del = true
istr_dwo[3].s_dwo_master = 'd_object_bom_grid;'
istr_dwo[3].s_dwo_details = ''
istr_dwo[3].s_master_keycol = 'ID'
istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[3].b_ref_table_yn  = false
istr_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[3].b_insert = true
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = true
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_excel = true
istr_dwo[3].b_traceable = true
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].s_description = 'Quy cách TP'
istr_dwo[3].s_gb_name = 'gb_8'

istr_dwo[4].s_dwo_default =  'd_bom_line_grid'
istr_dwo[4].s_dwo_form = ''
istr_dwo[4].s_dwo_grid = 'd_bom_line_grid'
istr_dwo[4].b_detail = true
istr_dwo[4].b_master = true
istr_dwo[4].b_cascade_del = true
istr_dwo[4].s_dwo_master = 'd_bom_hdr_form;'
istr_dwo[4].s_dwo_details = 'd_bom_input_grid;d_bom_output_grid'
istr_dwo[4].s_master_keycol = 'ID'
istr_dwo[4].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[4].b_ref_table_yn  = false
istr_dwo[4].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[4].b_insert = true
istr_dwo[4].b_update = true
istr_dwo[4].b_delete = true
istr_dwo[4].b_query = true
istr_dwo[4].b_print = true
istr_dwo[4].b_excel = true
istr_dwo[4].b_traceable = true
istr_dwo[4].b_keyboardlocked = true
istr_dwo[4].s_description = 'Quy trình SX'
istr_dwo[4].s_gb_name = 'gb_9'
end subroutine

public subroutine f_set_dwo_tabpage ();
iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
iastr_dwo_tabpage[1].i_index = 1
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_bom_input_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_bom_input_grid'
iastr_dwo_tabpage[1].str_dwo[1].b_master = true
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_bom_line_grid;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = ';'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = 'd_bom_mat_surplus_grid;d_bom_surplus_grid;'
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
iastr_dwo_tabpage[1].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Nguyên liệu'
iastr_dwo_tabpage[1].str_dwo[1].s_gb_name = ''


iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_display_model = '1d'
iastr_dwo_tabpage[2].i_index = 2
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_bom_output_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = 'd_bom_output_grid'
iastr_dwo_tabpage[2].str_dwo[1].b_master = false
iastr_dwo_tabpage[2].str_dwo[1].b_detail = true
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_bom_line_grid;'
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
iastr_dwo_tabpage[2].str_dwo[1].s_description ='Phụ phẩm'

iastr_dwo_tabpage[3].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[3].s_display_model = '1dgb_1dgb'
iastr_dwo_tabpage[3].i_leftpart_width = 1/2
iastr_dwo_tabpage[3].i_index = 3
iastr_dwo_tabpage[3].s_description ='Nguyên liệu thừa'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_default =  'd_bom_mat_surplus_grid'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_grid = 'd_bom_mat_surplus_grid'
iastr_dwo_tabpage[3].str_dwo[1].b_master = false
iastr_dwo_tabpage[3].str_dwo[1].b_detail = false
iastr_dwo_tabpage[3].str_dwo[1].b_shared = true
iastr_dwo_tabpage[3].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_master = 'd_bom_input_grid;'
iastr_dwo_tabpage[3].str_dwo[1].s_master_keycol = ''
iastr_dwo_tabpage[3].str_dwo[1].s_detail_keycol = ''
iastr_dwo_tabpage[3].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[3].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE'
iastr_dwo_tabpage[3].str_dwo[1].b_insert = false
iastr_dwo_tabpage[3].str_dwo[1].b_update = false
iastr_dwo_tabpage[3].str_dwo[1].b_delete = false
iastr_dwo_tabpage[3].str_dwo[1].b_query = true
iastr_dwo_tabpage[3].str_dwo[1].b_print = true
iastr_dwo_tabpage[3].str_dwo[1].b_excel = true
iastr_dwo_tabpage[3].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[3].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[3].str_dwo[1].s_description ='Nguyên liệu gốc'
iastr_dwo_tabpage[3].str_dwo[1].s_gb_name = 'gb_6'

iastr_dwo_tabpage[3].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[3].str_dwo[2].s_dwo_default =  'd_bom_surplus_grid'
iastr_dwo_tabpage[3].str_dwo[2].s_dwo_form = ''
iastr_dwo_tabpage[3].str_dwo[2].s_dwo_grid = 'd_bom_surplus_grid'
iastr_dwo_tabpage[3].str_dwo[2].b_master = false
iastr_dwo_tabpage[3].str_dwo[2].b_detail = false
iastr_dwo_tabpage[3].str_dwo[2].b_shared = true
iastr_dwo_tabpage[3].str_dwo[2].b_cascade_del = true
iastr_dwo_tabpage[3].str_dwo[2].s_dwo_details = ''
iastr_dwo_tabpage[3].str_dwo[2].s_dwo_master = 'd_bom_input_grid;'
iastr_dwo_tabpage[3].str_dwo[2].s_master_keycol = ''
iastr_dwo_tabpage[3].str_dwo[2].s_detail_keycol = ''
iastr_dwo_tabpage[3].str_dwo[2].b_ref_table_yn  = false
iastr_dwo_tabpage[3].str_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE'
iastr_dwo_tabpage[3].str_dwo[2].b_insert = false
iastr_dwo_tabpage[3].str_dwo[2].b_update = true
iastr_dwo_tabpage[3].str_dwo[2].b_delete = true
iastr_dwo_tabpage[3].str_dwo[2].b_query = true
iastr_dwo_tabpage[3].str_dwo[2].b_print = true
iastr_dwo_tabpage[3].str_dwo[2].b_excel = true
iastr_dwo_tabpage[3].str_dwo[2].b_traceable = true
iastr_dwo_tabpage[3].str_dwo[2].b_keyboardlocked = true
iastr_dwo_tabpage[3].str_dwo[2].s_description ='Nguyên liệu thừa'
iastr_dwo_tabpage[3].str_dwo[2].s_gb_name = 'gb_7'

end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_bom'					// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = 	'd_object_bom_grid'	//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo =  'd_object_bom_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[1].s_relatedtext_column = 'code'					
istr_dwo_related[1].s_text = 'Nhân bản khai báo mã hàng : '
istr_dwo_related[1].s_main_obj_dwo_copy[1] = 'd_object_bom_grid' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[1] =  'code;short_name;name;active_yn;manage_grpcode;manage_grpname;post_grpcode;MANAGE_GROUP;POSTING_GROUP;' // cột copy từ
istr_dwo_related[1].s_related_obj_dwo_copy[1] = 'd_object_bom_grid' // datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[1] =    'code;short_name;name;active_yn;manage_grpcode;manage_grpname;post_grpcode;MANAGE_GROUP;POSTING_GROUP;' // cột copy đến
istr_dwo_related[1].s_match_f_dwo[1] = 'd_object_bom_grid'
istr_dwo_related[1].s_match_t_dwo[1] ='d_object_bom_grid'

istr_dwo_related[1].s_main_obj_dwo_copy[2] = 'd_bom_hdr_form' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[2] =  'uom_code;rounding_code;rounding_name;'+&
																			'item_type;type;item_id;STOCK_UOM;round_id' // cột copy từ
istr_dwo_related[1].s_related_obj_dwo_copy[2] = 'd_bom_hdr_form' // datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[2] =   'uom_code;rounding_code;rounding_name;'+&
																			'item_type;type;item_id;STOCK_UOM;round_id'  // cột copy đến
istr_dwo_related[1].s_main_obj_dwo_copy[3] = 'd_item_spec_grid' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[3] =  'spec_group;code;name;length;width;depth;color;net_weight;gross_weight;tare_weight;density;other_spec;other_desc'
istr_dwo_related[1].s_related_obj_dwo_copy[3] = 'd_item_spec_grid' // datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[3] =   'spec_group;code;name;length;width;depth;color;net_weight;gross_weight;tare_weight;density;other_spec;other_desc'

istr_dwo_related[1].s_main_obj_dwo_copy[4] = 'd_bom_line_grid' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[4] =  'EFFECTIVE_FDATE;EFFECTIVE_TDATE;F_QTY;T_QTY;ROUTE_ID;route_code;route_name'
istr_dwo_related[1].s_related_obj_dwo_copy[4] = 'd_bom_line_grid' // datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[4] =  'EFFECTIVE_FDATE;EFFECTIVE_TDATE;F_QTY;T_QTY;ROUTE_ID;route_code;route_name'

istr_dwo_related[1].s_main_obj_dwo_copy[5] = 'd_bom_input_grid' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[5] =  'line_no;item_type;object_code;object_name;spec_code;spec_name;length;width;depth;mat_qty;uom_mat;fg_qty;'&
																	+'scrap_pct;scrap_pct_next;left_cut;right_cut;back_cut;front_cut;base_type;wh_mat_code;wh_fg_code;operation_code;note;'&
																	+'ITEM_ID;SPEC_ID;MAT_UOM;MAT_WH;FG_WH;OPERATION_ID'
istr_dwo_related[1].s_related_obj_dwo_copy[5] = 'd_bom_input_grid' // datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[5] =   'line_no;item_type;object_code;object_name;spec_code;spec_name;length;width;depth;mat_qty;uom_mat;fg_qty;'&
																	+'scrap_pct;scrap_pct_next;left_cut;right_cut;back_cut;front_cut;base_type;wh_mat_code;wh_fg_code;operation_code;note;'&
																	+'ITEM_ID;SPEC_ID;MAT_UOM;MAT_WH;FG_WH;OPERATION_ID'

istr_dwo_related[1].s_main_obj_column_chk[5] = ''
istr_dwo_related[1].s_related_obj_column_chk[5] = ''
istr_dwo_related[1].s_f_obj_column_chk[5] = ''
istr_dwo_related[1].s_t_obj_column_chk[5] = ''
istr_dwo_related[1].s_match_f_dwo[5] = '' 
istr_dwo_related[1].s_match_t_dwo[5] =''
istr_dwo_related[1].s_match_f_column[5] = ''
istr_dwo_related[1].s_match_t_column[5] = ''
istr_dwo_related[1].s_match_column[5] = ''
istr_dwo_related[1].s_main_obj_column_sum[5] = ''
istr_dwo_related[1].s_related_obj_column_sum[5] = ''
istr_dwo_related[1].b_f_sum[5] = false
end subroutine

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'


istr_actionpane[1].s_description = 'Công thức nguyên liệu sản xuất'

end subroutine

public function long f_tv_scroll2row (treeview vtv_bom);long					ll_row, ll_handle

treeviewitem 		l_tvi
t_dw_mpl			ldw_main

ll_handle = vtv_bom.finditem(currenttreeitem! , 0)
vtv_bom.getitem(ll_handle , l_tvi)
this.ipo_tv =l_tvi.data
ldw_main = iw_display.f_get_dwmain( )
if ldw_main.rowcount() > 0 then
	ll_row = ldw_main.find( "ID ="+string(this.ipo_tv.istr_tv.db_id ) , 1,  ldw_main.rowcount())
	if ll_row> 0 then
		ldw_main.scrolltorow(ll_row )
	end if
end if
return ll_row
end function

public function integer f_update_line_no (t_dw_mpl vdw_line, long vl_row);long		ll_row


FOR 	ll_row = vl_row to vdw_line.rowcount()
	vdw_line.setitem(ll_row, 'line_no',ll_row)	
NEXT

return vl_row
end function

public subroutine f_set_str_unit ();//--Datawindow chứa các cột cần làm tròn--//
istr_unit[1].s_dwo_handing = 'd_bom_input_grid;d_bom_input_grid;d_bom_line_grid;;;'
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = 'mat_qty;fg_qty;t_qty;;'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[1].s_dwo_unit = 'd_bom_input_grid;d_bom_input_grid;d_bom_hdr_form;;'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = 'mat_uom;fg_uom;uom_code;;'
//--Loại làm tròn --//
istr_unit[1].s_type = 'item;item;item;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[1].s_dwo_object = 'd_bom_input_grid;d_bom_hdr_form;d_bom_hdr_form;'
//--Cột chứa mã đơn vị--//
istr_unit[1].s_colname_object = 'object_code;object_code;object_code;'
end subroutine

public function integer f_insert_labour (double vdb_bom_id, double vdb_bom_line_id, double vdb_labour_id, double vdb_mat_qty, double vdb_fg_qty, double vdb_cost);double		ldb_id
			
UPDATE item 
set overhead_cost = :vdb_cost	 
WHERE object_ref_id = :vdb_bom_id using it_transaction;
			
UPDATE 	bom_inout_put 
SET MAT_QTY = :vdb_mat_qty, FG_QTY = :vdb_fg_qty
WHERE OBJECT_REF_ID = :vdb_bom_line_id AND ITEM_ID = :vdb_labour_id and ITEM_TYPE = 'LABOUR' using it_transaction;

if it_transaction.sqlnrows = 0 then
	ldb_id = this.f_create_id( )
					
	INSERT INTO bom_inout_put ( ID   ,
									  BRANCH_ID   ,
									  COMPANY_ID   ,
									  OBJECT_REF_ID    ,
									  OBJECT_REF_TABLE  ,
									  CREATED_BY      ,
									  CREATED_DATE  ,
									  LAST_MDF_BY   ,
									  LAST_MDF_DATE     ,
									  ITEM_ID     ,
									  ITEM_TYPE   ,
									  MAT_QTY    ,
									  MAT_UOM     ,
									  FG_QTY      ,
									  FG_UOM     )
	VALUES(:ldb_id,:gdb_branch, :gi_user_comp_id, :vdb_bom_line_id,'BOM_LINE', :gi_userid , sysdate, :gi_userid , sysdate,:vdb_labour_id, 'LABOUR' ,:vdb_mat_qty , null,:vdb_fg_qty,null  ) using it_transaction;

end if

return 1
end function

public function integer f_del_labour (double vdb_bom_id, double vdb_bom_line_id);			
UPDATE item 
set overhead_cost = 0
WHERE object_ref_id = :vdb_bom_id using it_transaction;

DELETE 	bom_inout_put 
WHERE OBJECT_REF_ID = :vdb_bom_line_id AND ITEM_TYPE = 'LABOUR' using it_transaction;

return it_transaction.sqlcode


end function

on c_bom.create
call super::create
end on

on c_bom.destroy
call super::destroy
end on

event constructor;call super::constructor;
ib_changed_dwo_4edit = false
is_display_model = 'up_gp_1d3d1tv_lo_tb'
is_object_title = 'Định mức nguyên liệu'


istr_actionpane[1].s_button_name = 'b_add_multi;b_modify;b_filteron;b_query;b_refresh;b_delete;b_estimate;b_view_multi;'
istr_actionpane[1].s_button_has_sub = 'b_add_multi;b_view_multi;'
istr_actionpane[1].sa_sub_button[1]='b_add;b_copyt_seft;'
istr_actionpane[1].sa_sub_button[2]='b_view_prod_order;'
istr_actionpane[1].sa_enabled_subbutton[]= istr_actionpane[1].sa_sub_button[]

istr_tvo[1].ds_tv_item = create datastore
istr_tvo[1].ds_tv_item.dataobject = 'ds_bom_tv'
istr_tvo[1].s_popmenu_items = ''

end event

event e_window_e_preopen;call super::e_window_e_preopen;
iw_display.f_set_ii_upperpart_height(iw_display.ii_resize_height*1/2 )
iw_display.f_set_ii_leftpart_width( iw_display.ii_resize_width*2/6 )
iw_display.f_set_ii_midpart_width( iw_display.ii_resize_width*3/6 )
iw_display.f_set_ii_fixedpart1_height( iw_display.ii_resize_height*1/2 *1/3)
iw_display.f_set_ii_fixedpart2_height( iw_display.ii_resize_height*1/2 *1/3)

//this.f_set_ii_leftpart_width_tabpage( 3, iw_display.ii_resize_width*1/2)

return 0
end event

event e_tv_selectionchanged;call super::e_tv_selectionchanged;
t_dw_mpl		ldw_handling

if isvalid(iw_display) then
	ldw_handling = iw_display.dynamic f_get_dwmain()
	if isvalid(ldw_handling) then
		this.f_tv_scroll2row( rpo_tv)
	else
		return -1
	end if
end if
return 1
end event

event e_tv_selectionchanging;call super::e_tv_selectionchanging;
t_dw_mpl			ldw_focus

ldw_focus = iw_display.f_get_idwfocus()
if isvalid(ldw_focus) then
	if ldw_focus.f_get_ib_editing() then
		gf_messagebox('m.c_bom.e_tv_selectionchanging.01','Thong báo','Phải lưu (save) trước khi chuyển','exclamation','ok',1)
		return 1
	end if
end if
return 0
end event

event e_window_open;call super::e_window_open;
any					la_arg[5]
treeview				ltv_display


if not isvalid(iw_display) then return -1

//-- load menu vao treeview --//
ltv_display = iw_display.dynamic f_get_tv()
if isvalid(ltv_display) then
	la_arg[1] = gdb_branch
	this.f_display_on_tv_new( ltv_display, la_arg)
else
	return -1
end if


return 0
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add_multi;b_insert;b_modify;b_filteron;b_query;b_refresh;b_delete;b_estimate;b_view_multi;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add_multi;b_modify; b_filteron;b_query;b_refresh;b_delete;b_estimate;b_view_multi;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add_multi;b_insert;b_modify;b_filteron;b_query; b_refresh;b_delete;b_estimate;b_view_multi;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add_multi;b_modify;b_filteron;b_query; b_refresh;b_delete;b_estimate;b_view_multi;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_modify;b_filteron;b_query;b_refresh;b_delete;b_estimate;b_view_multi;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_modify;b_filteron;b_query;b_refresh;b_delete;b_estimate;b_view_multi;'
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

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;long				ll_row
t_dw_mpl 		ldw_handle


if rpo_dw.dataobject = 'd_object_bom_grid' then
	ldw_handle = iw_display.f_get_dw('d_bom_hdr_form')
	ll_row = ldw_handle.event e_addrow( )
//	ldw_handle.setitem( ll_row, 'version_no', 1)
elseif rpo_dw.dataobject = 'd_bom_input_grid' then
	//-- insert line_no --//
	this.f_update_line_no( rpo_dw, vl_currentrow )
end if
return 0
end event

event e_dw_updatestart;call super::e_dw_updatestart;

if rdw_requester.dataobject = 'd_bom_input_grid' then
	//-- insert line_no --//
	this.f_update_line_no( rdw_requester, 1 )
end if
return 0
end event

event e_window_e_refresh;call super::e_window_e_refresh;
any					la_arg[5]
treeview				ltv_display


if not isvalid(iw_display) then return -1

//-- load menu vao treeview --//
ltv_display = iw_display.dynamic f_get_tv()
if isvalid(ltv_display) then
	la_arg[1] = gdb_branch
	this.f_display_on_tv( ltv_display, la_arg)
else
	return -1
end if


return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;double				ldb_bom_id, ldb_route_id, ldb_prod_spec[], ldb_data, ldb_factor
string					ls_upd_colnames
b_obj_instantiate 	lbo_instance
t_dw_mpl			ldw_product_spec, ldw_temp

if rpo_dw.dataobject = 'd_bom_input_grid' then

	ldw_product_spec = this.iw_display.f_get_dw( 'd_item_spec_grid')
	if ldw_product_spec.getrow( ) > 0 then
		ldb_prod_spec[1] = ldw_product_spec.getitemnumber( ldw_product_spec.getrow( ) , 'length')
		ldb_prod_spec[2] = ldw_product_spec.getitemnumber( ldw_product_spec.getrow( ) , 'width')
		ldb_prod_spec[3] = ldw_product_spec.getitemnumber( ldw_product_spec.getrow( ) , 'depth')
		ldb_prod_spec[4] = ldw_product_spec.getitemnumber( ldw_product_spec.getrow( ) , 'density')
		ldb_factor =  ldw_product_spec.getitemnumber( ldw_product_spec.getrow( ) , 'factor')
		if isnull(ldb_factor) or ldb_factor = 0 then ldb_factor = 1	
	end if
	choose case vs_colname
		case 'length' ,  'width',  'depth', 'mat_qty','fg_qty','base_type','factor','multiplied_by'
			if vs_colname = 'fg_qty' then
				ls_upd_colnames ='mat_qty'
			elseif vs_colname = 'mat_qty' then
				ls_upd_colnames ='fg_qty'
			else
				ls_upd_colnames ='fg_qty;mat_qty'
			end if
			lbo_instance.f_update_bom_line( vs_colname , vs_editdata , ls_upd_colnames, vl_currentrow ,rpo_dw , ldb_prod_spec[], ldb_factor  )
//		case 'left_cut'
//			ls_upd_colnames ='scrap_pct;scrap_pct_next;length;fg_qty'
//			lbo_instance.f_update_bom_line( vs_colname , vs_editdata , ls_upd_colnames, vl_currentrow ,rpo_dw ,  ldb_prod_spec[],  ii_left_cut )	
//			ii_left_cut = integer(vs_editdata) // lưu lại giá trị vừa thay đổi --//			
//		case 'rigth_cut'
//			ls_upd_colnames ='scrap_pct;scrap_pct_next;length;fg_qty'
//			lbo_instance.f_update_bom_line( vs_colname , vs_editdata , ls_upd_colnames, vl_currentrow ,rpo_dw ,  ldb_prod_spec[], ii_right_cut  )	
//			ii_right_cut = integer(vs_editdata) // lưu lại giá trị vừa thay đổi --//			
//		case 'back_cut'
//			ls_upd_colnames ='scrap_pct;scrap_pct_next;width;fg_qty'
//			lbo_instance.f_update_bom_line( vs_colname , vs_editdata , ls_upd_colnames, vl_currentrow ,rpo_dw ,  ldb_prod_spec[], ii_back_cut )	
//			ii_back_cut = integer(vs_editdata) // lưu lại giá trị vừa thay đổi --//			
//		case 'front_cut'
//			ls_upd_colnames ='scrap_pct;scrap_pct_next;width;fg_qty'
//			lbo_instance.f_update_bom_line( vs_colname , vs_editdata , ls_upd_colnames, vl_currentrow ,rpo_dw ,  ldb_prod_spec[], ii_front_cut )	
//			ii_front_cut = integer(vs_editdata) // lưu lại giá trị vừa thay đổi --//
	end choose
elseif  rpo_dw.dataobject = 'd_item_spec_grid' then	
	choose case vs_colname
		case 'length' , 'width', 'depth','density','factor'
			ldb_factor = rpo_dw.getitemnumber( vl_currentrow , 'factor')	
			if isnull(ldb_data) or ldb_data = 0 then ldb_factor = 1				
			if vs_colname = 'length' then
				ldb_data = double(vs_editdata)
				if isnull(ldb_data) then ldb_data = 0
				ldb_prod_spec[1] = ldb_data
				ldb_prod_spec[2] = rpo_dw.getitemnumber(vl_currentrow , 'width')
				ldb_prod_spec[3] = rpo_dw.getitemnumber( vl_currentrow , 'depth')			
				ldb_prod_spec[4] = rpo_dw.getitemnumber( vl_currentrow , 'density')
			elseif vs_colname = 'width' then
				ldb_data = double(vs_editdata)
				if isnull(ldb_data) then ldb_data = 0
				ldb_prod_spec[2] = ldb_data
				ldb_prod_spec[1] = rpo_dw.getitemnumber(vl_currentrow , 'length')
				ldb_prod_spec[3] = rpo_dw.getitemnumber( vl_currentrow , 'depth')		
				ldb_prod_spec[4] = rpo_dw.getitemnumber( vl_currentrow , 'density')
			elseif vs_colname = 'depth' then
				ldb_data = double(vs_editdata)
				if isnull(ldb_data) then ldb_data = 0
				ldb_prod_spec[3] = ldb_data
				ldb_prod_spec[1] = rpo_dw.getitemnumber(vl_currentrow , 'length')
				ldb_prod_spec[2] = rpo_dw.getitemnumber( vl_currentrow , 'width')				
				ldb_prod_spec[4] = rpo_dw.getitemnumber( vl_currentrow , 'density')
			elseif vs_colname = 'density' then
				ldb_data = double(vs_editdata)
				if isnull(ldb_data) then ldb_data = 0				
				ldb_prod_spec[1] = rpo_dw.getitemnumber(vl_currentrow , 'length')
				ldb_prod_spec[2] = rpo_dw.getitemnumber(vl_currentrow , 'width')
				ldb_prod_spec[3] = rpo_dw.getitemnumber( vl_currentrow , 'depth')			
				ldb_prod_spec[4] = ldb_data							
			elseif vs_colname = 'factor' then
				ldb_data = double(vs_editdata)
				if isnull(ldb_data) or ldb_data = 0 then 
					ldb_factor = 1	
				else
					ldb_factor = ldb_data
				end if
				ldb_prod_spec[1] = rpo_dw.getitemnumber(vl_currentrow , 'length')
				ldb_prod_spec[2] = rpo_dw.getitemnumber(vl_currentrow , 'width')
				ldb_prod_spec[3] = rpo_dw.getitemnumber( vl_currentrow , 'depth')			
				ldb_prod_spec[4] = rpo_dw.getitemnumber( vl_currentrow , 'density')							
			end if
			
			ldw_temp = this.iw_display.f_get_dw( 'd_bom_input_grid')
			ls_upd_colnames ='fg_qty;mat_qty'
			lbo_instance.f_update_bom_line(  'header' , '0' , ls_upd_colnames, 0 ,ldw_temp ,  ldb_prod_spec[], ldb_factor )
	end choose	
elseif  rpo_dw.dataobject = 'd_bom_line_grid' then
elseif  rpo_dw.dataobject = 'd_bom_hdr_form' then		
end if
return 0
end event

event e_dw_e_preinsertrow;call super::e_dw_e_preinsertrow;double			ldb_route_id
t_dw_mpl 		ldw_temp

if pos(rpo_dw.dataobject,'d_bom_input_grid') > 0 then
	
	ldw_temp = this.iw_display.f_get_dw( 'd_bom_line_grid')
	if ldw_temp.getrow( ) = 0 then 
		gf_messagebox('m.c_bom.e_dw_e_preinsertrow.01','Thông báo','Chưa nhập quy trình SX cho công thức','exclamation','ok',1)
		return -1
	end if
	ldb_route_id = ldw_temp.getitemnumber(  ldw_temp.getrow( ) , 'route_id')
	if isnull(ldb_route_id) or ldb_route_id = 0 then
		gf_messagebox('m.c_bom.e_dw_e_preinsertrow.01','Thông báo','Chưa nhập quy trình SX cho công thức','exclamation','ok',1)
		return -1
	end if
end if
return 0
end event

event e_dw_updateend;call super::e_dw_updateend;ii_left_cut = 0
ii_right_cut = 0
ii_back_cut = 0
ii_front_cut = 0
return ancestorreturnvalue
end event

