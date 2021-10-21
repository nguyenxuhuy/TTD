$PBExportHeader$b_copy.sru
forward
global type b_copy from s_object_display
end type
end forward

global type b_copy from s_object_display
end type
global b_copy b_copy

type variables
double idb_trans_id
string	is_main_id
t_ds_db_ws	iads_handling[]
end variables

forward prototypes
public subroutine f_set_idb_trans_id (double vdb_trans_id)
public function string f_get_trans_id_4copy ()
public subroutine f_set_dwo_window_copy ()
public function t_ds_db_ws f_get_ds (string vs_dwo)
public function integer f_get_ds_detail (ref t_ds_db_ws rads_detail[], string vs_dwo_master)
public function string f_get_master_keycol (string vs_dwo_master)
public function string f_get_detail_keycol (string vs_dwo_master)
public function integer f_set_ds_detail (ref t_ds_db_ws rds_detail)
public function integer f_get_data_copied (ref t_ds_db rads_copied[], string vs_type_copy, string vs_obj_related)
end prototypes

public subroutine f_set_idb_trans_id (double vdb_trans_id);idb_trans_id = vdb_trans_id
end subroutine

public function string f_get_trans_id_4copy ();
double       		ldb_trans_id[]
string				ls_doc_type, ls_trans_group, ls_trans_id
int					li_idx, li_row
any				laa_value[]

t_ds_db			lds_trans_hdr

select trans_group into :ls_trans_group 
from trans_setup_hdr where id = :idb_trans_id using sqlca;
if sqlca.sqlcode = 0 then
	if isnull(ls_trans_group) then return ''
	lds_trans_hdr = create t_ds_db
	lds_trans_hdr.dataobject = 'd_trans_setup_hdr_grid'
	ls_doc_type=upper(mid(this.classname( ) ,3))
	laa_value[1]= ls_trans_group
	lds_trans_hdr.f_add_where('trans_group;',laa_value[])
	lds_trans_hdr.settransobject( sqlca)
	lds_trans_hdr.retrieve(ls_doc_type)
	li_row = lds_trans_hdr.rowcount()
	if li_row > 0 then
		for li_idx = 1 to li_row
			ldb_trans_id[li_idx] = lds_trans_hdr.getitemnumber(li_idx,'id')
			ls_trans_id += string(ldb_trans_id[li_idx])+','
		next
	end if
	destroy lds_trans_hdr
	return left(ls_trans_id,len(ls_trans_id) - 1)
else
	return ''
end if
end function

public subroutine f_set_dwo_window_copy ();return 
end subroutine

public function t_ds_db_ws f_get_ds (string vs_dwo);int		li_idx

for li_idx = 1 to upperbound(iads_handling[])
	if iads_handling[li_idx].dataobject = vs_dwo then
		return iads_handling[li_idx]
	end if
next
end function

public function integer f_get_ds_detail (ref t_ds_db_ws rads_detail[], string vs_dwo_master);int		li_idx

for li_idx = 1 to upperbound(iads_handling[])
	if iads_handling[li_idx].dataobject = vs_dwo_master then
		rads_detail = iads_handling[li_idx].iads_detail
		return upperbound(rads_detail[])
	end if
next
return 1
end function

public function string f_get_master_keycol (string vs_dwo_master);int		li_idx
string	ls_master_keycol

for li_idx = 1 to upperbound(istr_dwo[])
	if pos(istr_dwo[li_idx].s_dwo_master,vs_dwo_master) > 0 then
		ls_master_keycol = istr_dwo[li_idx].s_master_keycol
	end if
next
return ls_master_keycol
end function

public function string f_get_detail_keycol (string vs_dwo_master);int		li_idx
string	ls_detail_keycol

for li_idx = 1 to upperbound(istr_dwo[])
	if pos(istr_dwo[li_idx].s_dwo_master,vs_dwo_master) > 0 then
		ls_detail_keycol = istr_dwo[li_idx].s_detail_keycol
	end if
next
return ls_detail_keycol
end function

public function integer f_set_ds_detail (ref t_ds_db_ws rds_detail);return 1
end function

public function integer f_get_data_copied (ref t_ds_db rads_copied[], string vs_type_copy, string vs_obj_related);int			li_idx,li_idx1,li_count_dwo_copy
t_ds_db	lds_copy

for li_idx = 1 to upperbound(istr_dwo_related[])
	if istr_dwo_related[li_idx].s_related_obj_name <> vs_obj_related then continue
	li_count_dwo_copy = upperbound(istr_dwo_related[li_idx].s_main_obj_dwo_copy)
	if li_count_dwo_copy > 0 then
		//-- chưa Xử lý dữ liệu trường hợp copyt --//
		if vs_type_copy = 'copyt' then
		end if
		//--copy vào ds --//
		for li_idx1 = 1 to li_count_dwo_copy
			lds_copy = this.f_get_ds( istr_dwo_related[li_idx].s_main_obj_dwo_copy[li_idx1])
			if isvalid(lds_copy) then
				rads_copied[li_idx1] = create t_ds_db
				rads_copied[li_idx1].dataobject = lds_copy.dataobject
				lds_copy.rowscopy( 1, lds_copy.rowcount(), primary!, rads_copied[li_idx1], 1, primary!)
			end if
		next
	end if
next

return upperbound(rads_copied)
end function

on b_copy.create
call super::create
end on

on b_copy.destroy
call super::destroy
end on

event constructor;call super::constructor;ib_changed_dwo_4edit = false
is_display_model = '1d'
ib_display_text = true
is_object_title = 'kết chứng từ'

istr_actionpane[1].s_dwo_action = 'd_action_edit'
istr_actionpane[1].s_button_name = 'b_refresh;b_query;b_execquery;b_filteron;b_filteroff;b_okclose;b_close;'
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title

end event

event e_action_ctrl_bttn;//-- override --//

datawindow				ldw_focus
int								li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	//-- control d_action_edit --//
	FOR li_idx = 1 to upperbound(istr_actionpane[]) 
		if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
			if ldw_focus.dynamic f_get_ib_shared() then
				ldw_focus = ldw_focus.dynamic f_getdwmaster()
			end if			
			if ldw_focus.dynamic f_get_ib_detail() then
				if ib_changed_dwo_4edit then
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_refresh;b_query;b_execquery;b_filteron;b_filteroff;b_okclose;b_close;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_refresh;b_query;b_execquery;b_filteron;b_filteroff;b_okclose;b_close;'
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_refresh;b_query;b_execquery;b_filteron;b_filteroff;b_okclose;b_close;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_refresh;b_query;b_execquery;b_filteron;b_filteroff;b_okclose;b_close;'
					end if
				end if
			else				
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons= 'b_refresh;b_query;b_execquery;b_filteron;b_filteroff;b_okclose;b_close;'
				else
					istr_actionpane[li_idx].s_visible_buttons= 'b_refresh;b_query;b_execquery;b_filteron;b_filteroff;b_okclose;b_close;'
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
			istr_actionpane[li_idx].s_visible_buttons =   ''
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
			istr_actionpane[li_idx].s_visible_buttons =  ''
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then				
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_dw_clicked;//--overwride--//
//-- xử lý retrieve khi click vào gutter --//
t_dw_mpl				ldw_main
int						li_str_dwo,li_idx,li_idx1

if (vs_colname = 'gutter' or vs_colname = 'gutter_t') and (this.ib_copying or this.ib_allocating) then
	iads_handling[1].reset()
	ldw_main = iw_display.f_get_dwmain( )
	iads_handling[1].reset()
	ldw_main.RowsCopy(1, ldw_main.RowCount(), Primary!, iads_handling[1], 1, Primary!)
	iads_handling[1].f_retrieve_detail_copy( )
end if
return 0
end event

event e_window_e_copy_form;call super::e_window_e_copy_form;double				ldb_trans_id
c_string				lc_string
u_choose_trans		lpo_choose_trans


lpo_choose_trans = create u_choose_trans
lpo_choose_trans.is_object_type = lc_string.f_globalreplace( this.classname( ) , 'u_', '')
openwithparm( s_wr_multi, lpo_choose_trans)
// lấy trans_id trả về
ldb_trans_id = message.doubleparm
if ldb_trans_id > 0 then
	setnull(message.doubleparm)
	this.f_set_idb_trans_id( ldb_trans_id)
	return 1
else
	return 0
end if
end event

event e_window_e_copy_to;call super::e_window_e_copy_to;double				ldb_trans_id
c_string				lc_string
u_choose_trans	lpo_choose_trans


lpo_choose_trans = create u_choose_trans
lpo_choose_trans.is_object_type = lc_string.f_globalreplace( this.classname( ) , 'u_', '')
openwithparm( s_wr_multi, lpo_choose_trans)
// lấy trans_id trả về
ldb_trans_id = message.doubleparm
if ldb_trans_id > 0 then
	setnull(message.doubleparm)
	this.f_set_idb_trans_id( ldb_trans_id)
	return 1
else
	return 0
end if
end event

event e_window_e_postopen;call super::e_window_e_postopen;this.iw_display.event e_filteron( )
return 0
end event

event e_window_e_postopen_child;call super::e_window_e_postopen_child;s_str_dwo_related			lstr_dwo_related[],lstr_dwo_related_tmp[]
t_transaction				lt_transaction
t_ds_db_ws					lads_detail[],lads_emp[],lds_tmp
s_str_dwo					lstr_dwo[]
t_dw_mpl						ldw_main
c_string						lc_tr

string							las_detail[],las_emp[]
int								li_cnt, li_rtn,li_idx,li_cnt1,li_idx1
//any							laa_data[]

//-- add where matching nếu copy from --//
if ib_copying then
		iw_display.f_get_transaction( lt_transaction)
		ldw_main = iw_display.f_get_dwmain( )
		//-- set master-detail --//
		this.f_set_dwo_window_copy( )
		li_cnt = this.f_get_dwo( lstr_dwo[])
		for li_idx = 1 to li_cnt
			iads_handling[li_idx] = create t_ds_db_ws
			iads_handling[li_idx].dataobject = lstr_dwo[li_idx].s_dwo_default
			iads_handling[li_idx].f_settransobject(lt_transaction )
		next
		for li_idx = 1 to upperbound(lstr_dwo[])
			li_cnt1 = lc_tr.f_stringtoarray( lstr_dwo[li_idx].s_dwo_details, ';', las_detail[])
			for li_idx1 = 1 to li_cnt1
				iads_handling[li_idx].iads_detail[li_idx1] = this.f_get_ds( las_detail[li_idx1])
				iads_handling[li_idx].iads_detail[li_idx1].ias_master_keycol[1] = this.f_get_master_keycol( lstr_dwo[li_idx].s_dwo_default)
				iads_handling[li_idx].iads_detail[li_idx1].ias_detail_keycol[1] = this.f_get_detail_keycol( lstr_dwo[li_idx].s_dwo_default)
				iads_handling[li_idx].ib_ismaster = lstr_dwo[li_idx].b_master
				iads_handling[li_idx].ib_isdetail = lstr_dwo[li_idx].b_detail
				iads_handling[li_idx].iads_detail[li_idx1].ids_master = iads_handling[li_idx]
				iads_handling[li_idx].iads_detail[li_idx1].f_set_obj_display(this)
			next
		next
end if
return 0
end event

event e_window_e_okclose;//--overwrite--//
s_str_dwo_related	lastr_related[]
s_object_display		lc_obj_parent,lc_obj_handling
c_dwservice			lc_dwser
s_w_multi				lw_parent
t_dw_mpl				ldw_main
t_ds_db					lads_copied[]
int							li_rtn
long						ll_find

if ib_copying then
	ldw_main = iw_display.f_get_dwmain()
	ll_find=ldw_main.find("gutter = 'Y'",1,ldw_main.rowcount())
	if ll_find=0 then 
		gf_messagebox('m.s_object_display.e_window_e_okclose.01','Thông báo','Chưa tích chọn phiếu để kết','exclamation','ok',1)
//		return 0
	end if
	lw_parent = iw_display.dynamic f_getparentwindow( )
	if isvalid(lw_parent) then
		lc_obj_parent = lw_parent.f_get_obj_handling()
		lc_obj_handling = iw_display.dynamic f_get_obj_handling()
		lc_obj_handling.f_get_dwo_related( lastr_related)
		li_rtn = this.f_get_data_copied( lads_copied, 'copyf', lc_obj_parent.classname( ))
//		li_rtn = iw_display.dynamic f_get_data_copied( lads_copied, lastr_related, 'copyf',lc_obj_parent.classname( ) )
		if li_rtn > 0 then
			if ib_copying and not ib_copy_line then
				li_rtn = lw_parent.f_set_data_copied( lads_copied, lastr_related, 'copyf',lc_obj_parent.classname( ),iw_display)
//			elseif ib_copying and ib_copy_line then
//				li_rtn = lw_parent.f_set_data_copied_line( lads_copied, lastr_related, 'copyf', lc_obj_parent.classname( ),iw_display)
			end if
//			if li_rtn > 0 then
//			end if
//		else
//			return 0
		end if
	else
		lc_obj_handling.ib_copying = false
		lc_obj_handling.ib_copy_tax = false
		close(iw_display)
	end if
	if li_rtn = -1 then
		ldw_main = lw_parent.f_get_dwmain()
		ldw_main.event e_delete( ) 
	end if
	lc_obj_handling.dynamic f_set_idb_trans_id(0)
	lc_obj_parent.event e_window_e_postcopy( )
	lc_obj_parent.ib_copying = false
	lc_obj_parent.ib_copy_tax = false
	this.ib_copying = false
	close(iw_display)	
end if
//return 0

end event

