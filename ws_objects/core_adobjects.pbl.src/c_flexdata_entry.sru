$PBExportHeader$c_flexdata_entry.sru
forward
global type c_flexdata_entry from s_object_display
end type
end forward

global type c_flexdata_entry from s_object_display
end type
global c_flexdata_entry c_flexdata_entry

type variables
double idb_object_ref_id
end variables

forward prototypes
public subroutine f_set_dwo_window ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_flexible_data_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_flexible_data_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_valueset_entry_grid;'
istr_dwo[1].s_dwo_shared = ''
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
istr_dwo[1].s_description = 'Bộ giá trị'
istr_dwo[1].s_gb_name = 'gb_6'


istr_dwo[2].s_dwo_default =  'd_valueset_entry_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_valueset_entry_grid'
istr_dwo[2].b_master = false
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_master = 'd_flexible_data_grid;'
istr_dwo[2].s_dwo_details = ''
istr_dwo[2].s_master_keycol = 'ID;'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[2].b_ref_table_yn  = false
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[2].b_relation_1_1 = false
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].b_focus_master = false
istr_dwo[2].s_gb_name = 'gb_7'
istr_dwo[2].s_description = 'Chi tiết'

end subroutine

on c_flexdata_entry.create
call super::create
end on

on c_flexdata_entry.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'flexible_data'
is_display_model = '1d_1d'
is_object_title = 'Bộ giá trị'

istr_actionpane[1].s_description = is_object_title

istr_actionpane[1].s_button_name =  'e_add;e_modify;e_delete;'
//istr_actionpane[1].s_button_name += 'b_doc_trace;b_cancel;b_self_copy;e_add;e_modify;e_delete;'
//istr_actionpane[1].s_button_has_sub ='b_related_object;b_update;b_approve;b_view;b_copyt;b_copyf;'
//istr_actionpane[1].sa_sub_button[1]='u_so;'
//istr_actionpane[1].sa_subbutton_name[1]='Đơn bán hàng(SO);'
//istr_actionpane[1].sa_sub_button[2]='b_complete;b_lose;b_excel;'
//istr_actionpane[1].sa_subbutton_name[2]='Thành công;Không thành;Excel;'
//istr_actionpane[1].sa_sub_button[3]=''	//'b_send_2_approve;b_approve;b_reject;'
//istr_actionpane[1].sa_subbutton_name[3]=''	//'Gửi duyệt;Duyệt;Trả duyệt'
//istr_actionpane[1].sa_sub_button[4]='b_view_qt;b_view_qt_kni_eng;'
//istr_actionpane[1].sa_subbutton_name[4]='Chào giá;Chào giá ENG;'
//istr_actionpane[1].sa_sub_button[5]=''
//istr_actionpane[1].sa_subbutton_name[5]=''
//istr_actionpane[1].sa_sub_button[6]=''
//istr_actionpane[1].sa_subbutton_name[6]=''

end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;int li_line_no,li_idx

if rpo_dw.dataobject = istr_dwo[1].s_dwo_default  then
	rpo_dw.setitem(vl_currentrow,'object_ref_id',double(this.is_menu_id ))
	rpo_dw.setitem(vl_currentrow,'object_ref_table','MENU')
end if
RETURN vl_currentrow
end event

event e_window_open;call super::e_window_open;
t_dw_mpl			ldw_main

any				la_value[], la_args[]


la_value[1] = double(this.is_menu_id)
ldw_main = iw_display.dynamic f_get_dwmain()
ldw_main.f_add_where('object_ref_id',la_value[])
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;
iw_display.f_set_ii_leftpart_width( 1/3)
return 0
end event

event e_dw_e_save;call super::e_dw_e_save;
b_obj_instantiate			lbo_ins
if rpo_dw.dataobject = 'd_valueset_entry_grid' then
	if lbo_ins.f_update_line_no( rpo_dw ) = -1 then return -1
end if
return 1
end event

