$PBExportHeader$c_valueset_entry.sru
forward
global type c_valueset_entry from s_object_display
end type
end forward

global type c_valueset_entry from s_object_display
end type
global c_valueset_entry c_valueset_entry

type variables
double idb_object_ref_id
end variables

forward prototypes
public subroutine f_set_dwo_window ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_valueset_entry_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_valueset_entry_grid'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Bộ giá trị'
end subroutine

on c_valueset_entry.create
call super::create
end on

on c_valueset_entry.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'flexible_data'
is_display_model = '1d'
is_object_title = 'Bộ giá trị'

istr_actionpane[1].s_description = is_object_title

istr_actionpane[1].s_button_name =  'b_doc_trace;b_cancel;b_self_copy;e_add;e_modify;e_delete;'
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
	rpo_dw.setitem(vl_currentrow,'object_ref_id',idb_object_ref_id)
	rpo_dw.setitem(vl_currentrow,'object_ref_table','FLEXIBLE_DATA')
	if vl_currentrow = 1 and  rpo_dw.rowcount()=0 then
		li_line_no = vl_currentrow
	else
		li_line_no = vl_currentrow
			for li_idx = vl_currentrow + 1 to rpo_dw.rowcount()
				rpo_dw.setitem(li_idx,'line_no',li_idx)
			next
	end if
	rpo_dw.setitem(vl_currentrow,'line_no',li_line_no)
end if
RETURN 1
end event

event e_window_open;call super::e_window_open;
b_flexibledata		lb_flexibledata
b_obj_instantiate	lbo_ins
datawindow			ldw_main
string				ls_valuset_code
double			ldb_flexible_data_id
any				la_value[], la_args[]

//-- build where theo business rule code --//
ls_valuset_code = lbo_ins.f_get_menu_code( double(this.is_menu_id), it_transaction )
if isnull(ls_valuset_code) or ls_valuset_code = '' then 
	return -1
end if

ldb_flexible_data_id = lb_flexibledata.f_get_id(ls_valuset_code, it_transaction)
if ldb_flexible_data_id < 1 then
	//-- insert menu code vào business rule --//
	ldb_flexible_data_id = lb_flexibledata.f_insert_flexible_code_ex( ls_valuset_code, it_transaction) 
	if ldb_flexible_data_id = -1 then return -1
	idb_object_ref_id = ldb_flexible_data_id
else
	idb_object_ref_id = ldb_flexible_data_id
end if
la_value[1] = idb_object_ref_id
ldw_main = iw_display.dynamic f_get_dwmain()
ldw_main.dynamic f_add_where('object_ref_id',la_value[])
return 0
end event

event e_dw_e_predelete;call super::e_dw_e_predelete;int				li_cnt
double		ldb_id
string			ls_code

//-- kiểm tra valueset ID đã dùng cài đặt ghi sổ / ghi sổ chưa --//
ldb_id = rpo_dw.getitemnumber( vl_currentrow, 'ID')
if ldb_id > 0 then
	//-- check manage_group --//
	select count(id) into :li_cnt from object where manage_group = :ldb_id or posting_group = :ldb_id using it_transaction;	
	if li_cnt > 0 then 
		ls_code =  rpo_dw.getitemstring( vl_currentrow, 'code')
		if isnull(ls_code) then ls_code = ''
		gf_messagebox('m.c_valueset_entry.e_dw_e_predelete.01','Thông báo','Giá trị sau đã gán vào nhóm đối tượng, không thể xóa:@'+ls_code,'exclamation' ,'ok',1)
		return -1
	end if		
	
	//-- check posting group --//
	select count(id) into :li_cnt from trans_setup where DR_POSTING_GROUP = :ldb_id or CR_POSTING_GROUP = :ldb_id  using it_transaction;	
	if li_cnt > 0 then 
		ls_code =  rpo_dw.getitemstring( vl_currentrow, 'code')
		if isnull(ls_code) then ls_code = ''
		gf_messagebox('m.c_valueset_entry.e_dw_e_predelete.01','Thông báo','Giá trị đã dùng trong cài đặt ghi sổ, không xoá được:@'+ls_code,'exclamation' ,'ok',1)
		return -1
	end if
	//-- check subaccount --//
	select count(id) into :li_cnt from ledger_trans where DR_SUBACCOUNT = :ldb_id or CR_SUBACCOUNT = :ldb_id  using it_transaction;	
	if li_cnt > 0 then 
		ls_code =  rpo_dw.getitemstring( vl_currentrow, 'code')
		if isnull(ls_code) then ls_code = ''
		gf_messagebox('m.c_valueset_entry.e_dw_e_predelete.01','Thông báo','Giá trị đã dùng ghi sổ giao dịch, không xoá được:@'+ls_code,'exclamation' ,'ok',1)
		return -1
	end if	

end if
return 0
end event

