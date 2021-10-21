$PBExportHeader$ur_goods_transfer_detail.sru
forward
global type ur_goods_transfer_detail from b_report
end type
end forward

global type ur_goods_transfer_detail from b_report
end type
global ur_goods_transfer_detail ur_goods_transfer_detail

forward prototypes
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_related ()
end prototypes

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default = 'dr_goods_transfer_detail_form'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = 'dr_goods_transfer_detail_form'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = ''
iastr_dwo_tabpage[1].str_dwo[1].b_master = false
iastr_dwo_tabpage[1].str_dwo[1].b_detail = false
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = false
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol = ''
iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol = ''
iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[1].s_pic_ref_table = 'legal_entity'
iastr_dwo_tabpage[1].str_dwo[1].s_pic_ref_field = 'id'
iastr_dwo_tabpage[1].str_dwo[1].s_pic_ref_colname = 'logo'
iastr_dwo_tabpage[1].str_dwo[1].b_insert = false
iastr_dwo_tabpage[1].str_dwo[1].b_update = false
iastr_dwo_tabpage[1].str_dwo[1].b_delete = false
iastr_dwo_tabpage[1].str_dwo[1].b_query = true
iastr_dwo_tabpage[1].str_dwo[1].b_print = true
iastr_dwo_tabpage[1].str_dwo[1].b_excel = true
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Báo cáo danh sách phiếu chuyển kho'
iastr_dwo_tabpage[1].str_dwo[1].s_gb_name = ''
end subroutine

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_report_parm_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_report_parm_grid'
istr_dwo[1].b_master = false
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = false
istr_dwo[1].b_excel = false
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].b_traceable = true
istr_dwo[1].s_description = 'Xem báo cáo theo điều kiện: '

istr_dwo[2].s_dwo_default = 'dp_goods_transfer_detail_form'
istr_dwo[2].s_dwo_form = 'dp_goods_transfer_detail_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = false
istr_dwo[2].b_insert = false
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = false
istr_dwo[2].b_query = true
istr_dwo[2].b_print = false
istr_dwo[2].b_excel = false
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = false
istr_dwo[2].s_description = 'Tham số của báo cáo: '
end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_goods_transfer'					// đối tượng liên quan
istr_dwo_related[1].s_main_obj_dwo = 'dr_goods_transfer_detail_form'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'transfer_code'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'd_document_inventory_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'code'			// cột quan hệ đến
istr_dwo_related[1].s_relatedtext_column = 'transfer_code'					
istr_dwo_related[1].s_text = 'Phiếu chuyển kho'
end subroutine

on ur_goods_transfer_detail.create
call super::create
end on

on ur_goods_transfer_detail.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = false
is_display_model = '1ddlb_2d_1tp'
ib_display_text = true
is_object_title = 'Báo cáo danh sách phiếu chuyển kho'

istr_actionpane[1].s_description = is_object_title

istr_report.s_dwo_report = 'dr_goods_transfer_detail_form'
istr_report.b_multi_thread = false

end event

event e_window_e_postopen;call super::e_window_e_postopen;t_dw_mpl	ldw_parm
string 		ls_status,ls_wh_delivery,ls_wh_receipt

ldw_parm = iw_display.f_get_dw(istr_dwo[2].s_dwo_default)
ls_status = ldw_parm.getitemstring(ldw_parm.getrow(), 'a_status')
ls_wh_delivery = ldw_parm.getitemstring(ldw_parm.getrow(), 'a_warehouse_delivery')
ls_wh_receipt = ldw_parm.getitemstring(ldw_parm.getrow(), 'a_warehouse_receipt')
if isnull(ls_status) then 
	ls_status = '%'
	ldw_parm.setitem(ldw_parm.getrow(), 'a_status', ls_status)
end if
if isnull(ls_wh_delivery) then 
	ls_status = '%'
	ldw_parm.setitem(ldw_parm.getrow(), 'a_warehouse_delivery', ls_wh_delivery)
end if
if isnull(ls_wh_receipt) then 
	ls_status = '%'
	ldw_parm.setitem(ldw_parm.getrow(), 'a_warehouse_receipt', ls_wh_receipt)
end if
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.dynamic f_set_ii_leftpart_width(4000)
iw_display.dynamic f_set_ii_upperpart_height(300)
return 0
end event

