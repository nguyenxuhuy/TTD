$PBExportHeader$c_work_center.sru
forward
global type c_work_center from s_object_display
end type
end forward

global type c_work_center from s_object_display
end type
global c_work_center c_work_center

type variables

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
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_object_workcenter_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_object_workcenter_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_work_center_form;'
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
istr_dwo[1].s_description = 'Mã, tên quy trình'
istr_dwo[1].s_gb_name = 'gb_6'


istr_dwo[2].s_dwo_default =  'd_work_center_form'
istr_dwo[2].s_dwo_form = 'd_work_center_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_detail = true
istr_dwo[2].b_master = true
istr_dwo[2].s_dwo_master = 'd_object_workcenter_grid;'
istr_dwo[2].s_dwo_details = 'd_work_center_line_grid;'
istr_dwo[2].b_relation_1_1 = true
istr_dwo[2].s_master_keycol = 'ID'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[2].b_ref_table_yn  = true //-- Nếu là dw detail, TRUE sẽ cập nhật updateTABLE của master xuống dw này --//
											//-- Nếu là dw master, TRUE sẽ cập nhật ref_table_filed từ detail lên ref_table field của dw này --//
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].b_focus_master = true
istr_dwo[2].s_description = 'Thông tin chung tổ sản xuất'
istr_dwo[2].s_gb_name = 'gb_7'
//istr_dwo[2].s_pic_ref_table = 'LEGAL_ENTITY'
//istr_dwo[2].s_pic_ref_field = 'object_ref_id'
//istr_dwo[2].s_pic_ref_colname = 'LOGO'


end subroutine

public subroutine f_set_dwo_tabpage ();
iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
iastr_dwo_tabpage[1].i_index = 1
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_work_center_line_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_work_center_line_grid'
iastr_dwo_tabpage[1].str_dwo[1].b_master = false
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_work_center_form;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol = 'ID'
iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID'
iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = true  //-- Nếu là dw detail, TRUE sẽ cập nhật updateTABLE của master xuống dw này --//
																			//-- Nếu dw master và true sẽ cập các cột từ ref_table_field từ detail lên master --//
iastr_dwo_tabpage[1].str_dwo[1].s_ref_table_field = ''  //-- Nếu cột đầu tiên là: OBJECT_REF_TABLE sẽ cập nhất master updateTABLE xuống detail --//
iastr_dwo_tabpage[1].str_dwo[1].b_insert = true
iastr_dwo_tabpage[1].str_dwo[1].b_update = true
iastr_dwo_tabpage[1].str_dwo[1].b_delete = true
iastr_dwo_tabpage[1].str_dwo[1].b_query = true
iastr_dwo_tabpage[1].str_dwo[1].b_print = true
iastr_dwo_tabpage[1].str_dwo[1].b_excel = true
iastr_dwo_tabpage[1].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Máy móc thiết bị'
iastr_dwo_tabpage[1].str_dwo[1].s_gb_name = ''


//iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
//iastr_dwo_tabpage[2].s_display_model = '1d'
//iastr_dwo_tabpage[2].i_index = 2
//iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_route_machine_grid'
//iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = ''
//iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = 'd_route_machine_grid'
//iastr_dwo_tabpage[2].str_dwo[1].b_master = false
//iastr_dwo_tabpage[2].str_dwo[1].b_detail = true
//iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = true
//iastr_dwo_tabpage[2].str_dwo[1].s_dwo_details = ''
//iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_route_line_grid;'
//iastr_dwo_tabpage[2].str_dwo[1].s_master_keycol = 'ID'
//iastr_dwo_tabpage[2].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID'
//iastr_dwo_tabpage[2].str_dwo[1].b_ref_table_yn  = true //-- Nếu true sẽ cập nhật master updateTABLE xuống detail --//
//iastr_dwo_tabpage[2].str_dwo[1].s_ref_table_field = '' //-- Nếu cột đầu tiên là: OBJECT_REF_TABLE sẽ cập nhất master updateTABLE xuống detail --//
//iastr_dwo_tabpage[2].str_dwo[1].b_insert = true
//iastr_dwo_tabpage[2].str_dwo[1].b_update = true
//iastr_dwo_tabpage[2].str_dwo[1].b_delete = true
//iastr_dwo_tabpage[2].str_dwo[1].b_query = true
//iastr_dwo_tabpage[2].str_dwo[1].b_print = true
//iastr_dwo_tabpage[2].str_dwo[1].b_excel = true
//iastr_dwo_tabpage[2].str_dwo[1].b_traceable = true
//iastr_dwo_tabpage[2].str_dwo[1].b_keyboardlocked = true
//iastr_dwo_tabpage[2].str_dwo[1].s_description ='Máy móc'
//
//iastr_dwo_tabpage[3].s_tp_name = 's_tp_multi'
//iastr_dwo_tabpage[3].s_display_model = '1d'
//iastr_dwo_tabpage[3].i_index = 3
////iastr_dwo_tabpage[3].s_description ='Nguyên liệu thừa'
//iastr_dwo_tabpage[3].str_dwo[1].s_dwo_default =  'd_route_labour_grid'
//iastr_dwo_tabpage[3].str_dwo[1].s_dwo_form = ''
//iastr_dwo_tabpage[3].str_dwo[1].s_dwo_grid = 'd_route_labour_grid'
//iastr_dwo_tabpage[3].str_dwo[1].b_master = false
//iastr_dwo_tabpage[3].str_dwo[1].b_detail = true
//iastr_dwo_tabpage[3].str_dwo[1].b_shared = false
//iastr_dwo_tabpage[3].str_dwo[1].b_cascade_del = true
//iastr_dwo_tabpage[3].str_dwo[1].s_dwo_details = ''
//iastr_dwo_tabpage[3].str_dwo[1].s_dwo_master = 'd_route_line_grid;'
//iastr_dwo_tabpage[3].str_dwo[1].s_master_keycol = 'ID'
//iastr_dwo_tabpage[3].str_dwo[1].s_detail_keycol =  'OBJECT_REF_ID'
//iastr_dwo_tabpage[3].str_dwo[1].b_ref_table_yn  = true //-- Nếu true sẽ cập nhật master updateTABLE xuống detail --//
//iastr_dwo_tabpage[3].str_dwo[1].s_ref_table_field = ''  //-- Nếu cột đầu tiên là: OBJECT_REF_TABLE sẽ cập nhất master updateTABLE xuống detail --//
//iastr_dwo_tabpage[3].str_dwo[1].b_insert = false
//iastr_dwo_tabpage[3].str_dwo[1].b_update = false
//iastr_dwo_tabpage[3].str_dwo[1].b_delete = false
//iastr_dwo_tabpage[3].str_dwo[1].b_query = true
//iastr_dwo_tabpage[3].str_dwo[1].b_print = true
//iastr_dwo_tabpage[3].str_dwo[1].b_excel = true
//iastr_dwo_tabpage[3].str_dwo[1].b_traceable = true
//iastr_dwo_tabpage[3].str_dwo[1].b_keyboardlocked = true
//iastr_dwo_tabpage[3].str_dwo[1].s_description ='Nhân lực'
////iastr_dwo_tabpage[3].str_dwo[1].s_gb_name = 'gb_6'
//
//iastr_dwo_tabpage[4].s_tp_name = 's_tp_multi'
//iastr_dwo_tabpage[4].s_display_model = '1d'
//iastr_dwo_tabpage[4].i_index = 4
//iastr_dwo_tabpage[4].str_dwo[1].s_dwo_default =  'd_route_energy_grid'
//iastr_dwo_tabpage[4].str_dwo[1].s_dwo_form = ''
//iastr_dwo_tabpage[4].str_dwo[1].s_dwo_grid = 'd_route_energy_grid'
//iastr_dwo_tabpage[4].str_dwo[1].b_master = false
//iastr_dwo_tabpage[4].str_dwo[1].b_detail = true
//iastr_dwo_tabpage[4].str_dwo[1].b_shared = false
//iastr_dwo_tabpage[4].str_dwo[1].b_cascade_del = true
//iastr_dwo_tabpage[4].str_dwo[1].s_dwo_details = ''
//iastr_dwo_tabpage[4].str_dwo[1].s_dwo_master = 'd_route_line_grid;'
//iastr_dwo_tabpage[4].str_dwo[1].s_master_keycol = 'ID'
//iastr_dwo_tabpage[4].str_dwo[1].s_detail_keycol ='OBJECT_REF_ID'
//iastr_dwo_tabpage[4].str_dwo[1].b_ref_table_yn  = true //-- Nếu true sẽ cập nhật master updateTABLE xuống detail --//
//iastr_dwo_tabpage[4].str_dwo[1].s_ref_table_field = '' //-- Nếu cột đầu tiên là: OBJECT_REF_TABLE sẽ cập nhất master updateTABLE xuống detail --//
//iastr_dwo_tabpage[4].str_dwo[1].b_insert = false
//iastr_dwo_tabpage[4].str_dwo[1].b_update = true
//iastr_dwo_tabpage[4].str_dwo[1].b_delete = true
//iastr_dwo_tabpage[4].str_dwo[1].b_query = true
//iastr_dwo_tabpage[4].str_dwo[1].b_print = true
//iastr_dwo_tabpage[4].str_dwo[1].b_excel = true
//iastr_dwo_tabpage[4].str_dwo[1].b_traceable = true
//iastr_dwo_tabpage[4].str_dwo[1].b_keyboardlocked = true
//iastr_dwo_tabpage[4].str_dwo[1].s_description ='Năng lượng - Nhiên liệu'
////iastr_dwo_tabpage[3].str_dwo[2].s_gb_name = 'gb_7'
//
end subroutine

public subroutine f_set_dwo_related ();//istr_dwo_related[1].s_related_obj_name = 'u_legal_entity'
//istr_dwo_related[1].s_main_obj_dwo = 'd_business_group_form'
//istr_dwo_related[1].s_main_obj_column = 'ID'
//istr_dwo_related[1].s_related_obj_dwo = 'd_legal_entity_form'
//istr_dwo_related[1].s_related_obj_column = 'bus_grp_id'
//istr_dwo_related[1].s_text = 'Công ty con của: '
//
end subroutine

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'



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

on c_work_center.create
call super::create
end on

on c_work_center.destroy
call super::destroy
end on

event constructor;call super::constructor;
ib_changed_dwo_4edit = false
is_display_model = 'up_gp_2d_lo_tb'
is_object_title = 'Tổ sản xuất'


istr_actionpane[1].s_button_name = 'b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;'
istr_actionpane[1].s_button_has_sub = ''
istr_actionpane[1].s_description = is_object_title


end event

event e_window_e_preopen;call super::e_window_e_preopen;
iw_display.f_set_ii_upperpart_height(iw_display.ii_resize_height*1/2 )
iw_display.f_set_ii_fixedpart1_height( iw_display.ii_resize_height*1/2 *1/3)


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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_filteron;b_query;b_refresh;b_delete;'
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


if rpo_dw.dataobject = 'd_object_workcenter_grid' then
	ldw_handle = iw_display.f_get_dw('d_work_center_form')
	ll_row = ldw_handle.event e_addrow( )
elseif rpo_dw.dataobject = 'd_work_center_line_grid'  then
	//-- insert line_no --//
	this.f_update_line_no( rpo_dw, vl_currentrow , 'line_no')
end if
return vl_currentrow
end event

event e_dw_updatestart;call super::e_dw_updatestart;

if rdw_requester.dataobject = 'd_work_center_line_grid'  then
	//-- insert line_no --//
	this.f_update_line_no( rdw_requester, 1 , 'line_no')
end if
return 0
end event

