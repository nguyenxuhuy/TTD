$PBExportHeader$c_valueset.sru
forward
global type c_valueset from b_popup_data
end type
end forward

global type c_valueset from b_popup_data
event type integer e_action_new ( )
end type
global c_valueset c_valueset

type variables
double idb_object_ref_id
end variables

forward prototypes
public subroutine f_set_dwo_window ()
public function integer f_get_setup_objectname (ref string rs_objectname)
public function boolean f_is_user_appli (double vdb_user_id, string vs_applicable_ref_id)
public subroutine f_set_dwo_tabpage ()
public function integer f_set_returndata (any vaa_rtn_data[], boolean vb_valueset_receive_number, datawindow vdw_focus, string vs_columnname, string vas_receive_cols[])
end prototypes

event type integer e_action_new();
t_dw_mpl				ldw_main
s_object_display 		lod_drilldown

if is_drilldown_object = 'U_VALUESET_ENTRY' then
//	ldw_main = iw_display.f_get_dwmain( )
	iw_display.event e_add( )
	
else
	lod_drilldown = create using is_drilldown_object
	
	iw_display.f_openchildwithparm( 's_w_multi_n_max', lod_drilldown)
end if

return 1
end event

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default = 'd_valueset_entry_grid'
istr_dwo[1].s_dwo_form = ' '
istr_dwo[1].s_dwo_grid = 'd_valueset_entry_grid'
istr_dwo[1].b_master = false
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_details = ''
istr_dwo[1].s_dwo_shared = ''
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = false
istr_dwo[1].b_excel = false
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Bộ giá trị tìm kiếm'


end subroutine

public function integer f_get_setup_objectname (ref string rs_objectname);string							ls_objname
s_object_display			lod_main
int								li_rtn

lod_main = this.f_get_main_object( )
if isvalid(lod_main) then
	 li_rtn = lod_main.f_get_setup_objectname( ls_objname)
	 rs_objectname = ls_objname
	 return li_rtn
end if
return 0
end function

public function boolean f_is_user_appli (double vdb_user_id, string vs_applicable_ref_id);/***********************************************************************************
Kiểm tra user truyền vào vdb_user_id có phải là user áp dụng của điều kiện phụ thuộc trong cài đặt bảng hay không
vdb_user_id : user_id cần kiểm tra
return 	true : user_id truyền vào là user áp dụng điều kiện
			false : không phải user áp dụng
************************************************************************************/
c_string		lc_string
t_ds_db		lds_role_assign
b_rule		lbs_rule
boolean		lb_return
string			las_applicable_id[],ls_role_id,ls_user_id
long			ll_retrieve,ll_find
any			laa_data[]
int				li_count,li_idx

lds_role_assign = create t_ds_db
lds_role_assign.dataobject = 'ds_role_assign'
lds_role_assign.f_settransobject( SQLCA)
li_count = lc_string.f_stringtoarray( vs_applicable_ref_id, ';', las_applicable_id)
for li_idx = 1 to li_count
	if upper(lbs_rule.f_get_type_role_user_id( double(las_applicable_id[li_idx]))) = 'ROLE' then
		if ls_role_id <> '' and li_idx < li_count then ls_role_id += ','
		ls_role_id += las_applicable_id[li_idx] 
	else
		if ls_user_id <> '' and li_idx < li_count then ls_user_id += ','
		ls_user_id += las_applicable_id[li_idx] 
	end if
next
if ls_user_id <> '' then ls_user_id = '('+ls_user_id+')'
if ls_role_id <> '' then ls_role_id = '('+ls_role_id+')'
if ls_role_id <> '' and ls_user_id <> '' then
	laa_data[1] = ls_user_id
	laa_data[2] = ls_role_id
	lds_role_assign.f_add_where( 'USER_ID;ROLE_ID', laa_data)
elseif ls_role_id <> '' then
	laa_data[1] = ls_role_id
	lds_role_assign.f_add_where( 'ROLE_ID', laa_data)
elseif ls_user_id <> '' then
	laa_data[1] = ls_user_id
	lds_role_assign.f_add_where( 'USER_ID', laa_data)
end if
ll_retrieve = lds_role_assign.retrieve( )
if ll_retrieve > 0 then
	ll_find = lds_role_assign.find( "USER_ID = "+string(vdb_user_id), 1, ll_retrieve)
	if ll_find > 0 then
		lb_return = true
	else
		lb_return = false
	end if
else
	lds_role_assign.dataobject = 'd_role_user_grid'
	lds_role_assign.f_settransobject( SQLCA)
	lds_role_assign.f_add_where( 'ID', laa_data)
	ll_retrieve = lds_role_assign.retrieve( )
	if ll_retrieve > 0 then
		ll_find = lds_role_assign.find( "ID = "+string(vdb_user_id), 1, ll_retrieve)
		if ll_find > 0 then
			lb_return = true
		else
			 lb_return = false
		end if
	else
		lb_return = false
	end if
end if
destroy lds_role_assign
return lb_return
end function

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
iastr_dwo_tabpage[1].b_fulltab = false
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
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
iastr_dwo_tabpage[1].str_dwo[1].s_ref_table_field = ''
iastr_dwo_tabpage[1].str_dwo[1].b_insert = false
iastr_dwo_tabpage[1].str_dwo[1].b_update = false
iastr_dwo_tabpage[1].str_dwo[1].b_delete = false
iastr_dwo_tabpage[1].str_dwo[1].b_query = true
iastr_dwo_tabpage[1].str_dwo[1].b_print = false
iastr_dwo_tabpage[1].str_dwo[1].b_excel = false
iastr_dwo_tabpage[1].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[1].b_traceable = false
iastr_dwo_tabpage[1].i_index = 1
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Bộ giá trị tìm kiếm'
iastr_dwo_tabpage[1].s_description ='Bộ giá trị tìm kiếm'

iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_display_model = '1d'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = ''
iastr_dwo_tabpage[2].str_dwo[1].b_master = false
iastr_dwo_tabpage[2].str_dwo[1].b_detail = false
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = false
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[2].str_dwo[1].s_master_keycol = ''
iastr_dwo_tabpage[2].str_dwo[1].s_detail_keycol = ''
iastr_dwo_tabpage[2].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[2].str_dwo[1].s_ref_table_field = ''
iastr_dwo_tabpage[2].str_dwo[1].b_insert = false
iastr_dwo_tabpage[2].str_dwo[1].b_update = false
iastr_dwo_tabpage[2].str_dwo[1].b_delete = false
iastr_dwo_tabpage[2].str_dwo[1].b_query = true
iastr_dwo_tabpage[2].str_dwo[1].b_print = false
iastr_dwo_tabpage[2].str_dwo[1].b_excel = false
iastr_dwo_tabpage[2].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[2].str_dwo[1].b_traceable = false
iastr_dwo_tabpage[2].i_index = 2
iastr_dwo_tabpage[2].str_dwo[1].s_description ='Truy vấn dữ liệu'
iastr_dwo_tabpage[2].s_description ='Truy vấn dữ liệu'
end subroutine

public function integer f_set_returndata (any vaa_rtn_data[], boolean vb_valueset_receive_number, datawindow vdw_focus, string vs_columnname, string vas_receive_cols[]);string		ls_data
int			li_rtn_preitemchanged,li_rtn

window	lw_parent

lw_parent = iw_display.f_getparentwindow( )

//-- xử lý set return data --//
	if  vb_valueset_receive_number then
		if upperbound(vaa_rtn_data[]) > 0 then 
			ls_data = string(vaa_rtn_data[1] )
		end if
	else		
		if  upperbound(vaa_rtn_data[]) > 0 then
			ls_data = vaa_rtn_data[1]
		end if
	end if
	if ls_data <> '' and this.classname() = 'u_valueset' then
		//##xử lý làm tròn và kiểm tra quy đổi đơn vị--//
		li_rtn_preitemchanged = vdw_focus.dynamic f_send_message_to_object( vdw_focus,vdw_focus.getrow(),vs_ColumnName, ls_data, 'e_preitemchanged')
		if li_rtn_preitemchanged =1  then
//			vdw_focus.dynamic f_setnull_columns(vas_receive_cols[] , vdw_focus.getrow())
			this.ipo_main.idwsetup_initial.ids_setup_dw.setfilter( "" )
			this.ipo_main.idwsetup_initial.ids_setup_dw.filter( )			
			vdw_focus.dynamic f_set_ib_valuesetting(false)
			return -1
		end if
	end if
	
	li_rtn = vdw_focus.dynamic f_setitem_returndata(vs_ColumnName , vdw_focus.getrow(), true) 
	if li_rtn <> -1 then
		if this.classname( ) = 'u_valueset' then 
			vdw_focus.accepttext( )
		end if
	else
		vdw_focus.dynamic f_set_ib_valuesetting(false)
		return close(iw_display)
	end if
		//-- gửi data cho object kiểm tra neu là valueset--//
	if ls_data <> '' and this.classname() = 'u_valueset' then
		//##Kết thúc xử lý làm tròn --//
		li_rtn = vdw_focus.dynamic f_send_message_to_object( vdw_focus,vdw_focus.getrow(),vs_ColumnName, ls_data, 'e_itemchanged')
		if li_rtn = -1 then
			vdw_focus.dynamic f_restore_original_data(vas_receive_cols[] , vdw_focus.getrow())
			this.ipo_main.idwsetup_initial.ids_setup_dw.setfilter( "" )
			this.ipo_main.idwsetup_initial.ids_setup_dw.filter( )	
			vdw_focus.dynamic f_set_ib_valuesetting(false)
			return -1
		end if
	end if
//-----------------------------------------------------------------------//	
this.ipo_main.idwsetup_initial.ids_setup_dw.setfilter( "" )
this.ipo_main.idwsetup_initial.ids_setup_dw.filter( )	
vdw_focus.dynamic f_set_ib_valuesetting(false)
if vdw_focus.dynamic f_get_ib_focus_master( ) then
	vdw_focus =  vdw_focus.dynamic f_get_idw_master()
//	if isvalid(vdw_focus) then lw_parent.f_set_idwfocus(vdw_focus)
end if
return 0
end function

on c_valueset.create
call super::create
end on

on c_valueset.destroy
call super::destroy
end on

event e_dw_e_preretrieve;call super::e_dw_e_preretrieve;//-- rebuild select column --//
int					li_rtnCnt, li_dispCnt, li_idx1, li_idx2
string				ls_rtn_colname, ls_display_column, ls_return_column, ls_data[], ls_sql, ls_where
boolean			lb_notexist
c_string					lc_string
b_obj_instantiate		lbo_ins


if iw_display.classname( ) = 's_w_multi' then return ancestorreturnvalue



/*
if rpo_dw.dynamic f_get_dataobject() = iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default then
	ls_display_column = this.ipo_main.idwsetup_initial.ids_setup_dw.getitemstring(1, 'history_display_column')
else
	ls_display_column = this.ipo_main.idwsetup_initial.ids_setup_dw.getitemstring(1, 'display_column')
end if
ls_display_column = " ~~'~~' gutter;" + ls_display_column
ls_display_column += ';'
ls_return_column = this.ipo_main.idwsetup_initial.ids_setup_dw.getitemstring(1, 'return_column')

DO
	ls_rtn_colname =  lc_string.f_gettoken(ls_return_column , ';') + ';'
	if pos(ls_display_column, ls_rtn_colname) = 0 then
		ls_display_column += ls_rtn_colname
	end if
LOOP WHILE  ls_return_column <> ''

//if rpo_dw.dataobject = 'd_valueset_entry_grid' then //-- thêm column obj_search --//
//	ls_display_column += 'obj_search;'
//	rpo_dw.dynamic f_getcurrentsql(ls_sql, ls_where)
//	lbo_ins.f_left_join_dwh_search( 'd_valueset_entry_grid', ls_sql)
//end if

if is_drilldown_object = 'U_VALUESET_ENTRY' then
	ls_display_column += 'id;object_ref_id;object_ref_table;created_by;created_date;last_mdf_by;last_mdf_date;'
end if
rpo_dw.dynamic f_rebuild_select_column(ls_display_column)
*/


return 1
end event

event e_window_e_postopen;call super::e_window_e_postopen;datawindow				ldw_valueset
c_string					lc_string
string						ls_rtn_column, las_data[], ls_dwobject, ls_receive_column,ls_history_obj_ref_code,ls_first_column
int							li_dataCnt, li_lastpos, li_idx
long						ll_row_found,ll_rc

s_w_main				lw_parent
t_dw_mpl				ldw_focus
any						la_data

if iw_display.classname( ) = 's_w_multi_rb' then return ancestorreturnvalue

lw_parent = iw_display.f_getparentwindow( )
ldw_focus = lw_parent.f_get_idwfocus( )
la_data = ldw_focus.f_getitemany( ldw_focus.getrow( ) ,  'item_code' )


//kiểm tra load hình //
if ldw_focus.describe( "p_1.x") <> '!' and ldw_focus.describe( "p_1.x") <> '?' then
	ll_rc = ldw_focus.rowcount( )
	if ll_rc > 0 then
		ldw_focus.f_load_pic( ll_rc)
	end if
end if

iw_display.dynamic event e_filteron_rb()

//-- tick các record theo current data --//
if not isnull(is_currentdata) and is_currentdata<>'' then
	ls_history_obj_ref_code = this.ipo_main.idwsetup_initial.ids_setup_dw.getitemstring( 1, 'history_obj_ref_code')
	if not isnull(is_display_column_history) and len(is_display_column_history) > 0 then
		ldw_valueset = iw_display.f_get_dw( iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default)
	else
		ldw_valueset = iw_display.dynamic f_get_dwmain()
	end if
	ls_dwobject = this.ipo_main.idwsetup_initial.ids_setup_dw.getitemstring( 1, 'dwobject')
	ls_receive_column =  this.ipo_main.idwsetup_initial.ids_setup_dw.getitemstring( 1, 'receive_column')
	this.ipo_main.idwsetup_initial.is_receive_column = ls_receive_column
	ls_rtn_column = this.ipo_main.idwsetup_initial.ids_setup_dw.getitemstring( 1, 'return_column')
	ls_first_column = left(ls_rtn_column,pos(ls_rtn_column,';') - 1)
	iw_display.dw_filter.setitem( 1, 'colname', ls_first_column)  
	iw_display.dw_filter.setitem( 1, 'filter_string', is_currentdata)  
	
	iw_display.f_filter_dwmain_new( )
	if this.ipo_main.idwsetup_initial.f_is_valueset_receive_number( ls_dwobject, ls_receive_column) then
		ls_rtn_column = lc_string.f_getfirsttoken(ls_rtn_column,';')
		li_lastpos = lastpos(is_currentdata,';')
		if li_lastpos > 0 then
			is_currentdata = mid(is_currentdata, 1, li_lastpos)
		end if
		li_dataCnt = lc_string.f_stringtoarray( is_currentdata,';', las_data[])
		FOR li_idx = 1 to li_dataCnt
			ll_row_found = ldw_valueset.find(ls_rtn_column+ "='" +las_data[li_idx]+ "'", 1, ldw_valueset.rowcount( ) )
			if ll_row_found > 0 then
				ldw_valueset.scrolltorow(ll_row_found)
//				ldw_valueset.setitem( ll_row_found, 'gutter', 'Y')
			end if
		NEXT
	end if
end if

iw_display.f_set_idwfocus(iw_display.dw_filter )
ldw_focus = iw_display.f_get_idwfocus( )
ls_first_column = ldw_focus.f_getfirstcolumn( true)
ll_rc = ldw_focus.setcolumn( ls_first_column)
iw_display.idw_focus = ldw_valueset
return 1
end event

event constructor;call super::constructor;
ib_changed_dwo_4edit = false
is_display_model ='1d'
is_object_title = 'Bộ giá trị tìm kiếm'

istr_actionpane[1].s_description = is_object_title


istr_actionpane[1].s_button_name = 'e_okclose;e_close;e_action_new;e_refresh;e_filter;'
//istr_actionpane[1].s_button_name += 'b_doc_trace;e_add;e_modify;e_delete;'
if this.is_drilldown_object <> '' and not isnull(this.is_drilldown_object) then
	istr_actionpane[1].s_button_has_sub ='b_update;'
	istr_actionpane[1].sa_sub_button[1]='e_action_new;'
	istr_actionpane[1].sa_subbutton_name[1]='Thêm mới;'
end if

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

event e_window_e_okclose;//-- OVERRIDE --//

s_w_main			lw_parent
datawindow			ldw_valuset,ldw_focus
c_obj_service		lc_obj_service
c_dwsetup_initial	lc_dwsetup_initial
any					laa_rtn_data[]
long					ll_row,ll_setup_row
int						li_idx, li_colCnt,li_rtn,li_rtn_preitemchanged, li_rpt_parm_rtn
string					ls_rtn_column[], ls_dwobject,ls_receive_cols[], ls_tmp, ls_receive_columns,ls_data,ls_ColumnName
string					ls_coltype,ls_dwdatatype,ls_multi_choose
boolean				lb_selected, lb_valueset_receive_number
double 				ldb_setup_id
date					ld_prior_period_date, ld_last_period_date

if len(is_display_column_history) > 0 then
	ldw_valuset = iw_display.f_get_dw( iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default) 
else
	ldw_valuset = iw_display.dynamic f_get_dwmain()
end if
if ldw_valuset.rowcount( ) = 0 then return 

ls_dwobject = this.ipo_main.idwsetup_initial.ids_setup_dw.getitemstring(1, 'dwobject')
ls_receive_columns = this.ipo_main.idwsetup_initial.ids_setup_dw.getitemstring(1, 'receive_column')
ls_multi_choose =  this.ipo_main.idwsetup_initial.ids_setup_dw.getitemstring(1, 'multi_choose_yn')
lb_valueset_receive_number = this.ipo_main.idwsetup_initial.f_is_valueset_receive_number(ls_dwobject, ls_receive_columns)
li_colCnt = lc_obj_service.f_stringtoarray(this.ipo_main.idwsetup_initial.ids_setup_dw.getitemstring(1, 'return_column') , ';', ls_rtn_column[])
li_colCnt = lc_obj_service.f_stringtoarray( ls_receive_columns, ';', ls_receive_cols[])

lw_parent = iw_display.f_getparentwindow( )
ldw_focus = lw_parent.f_get_idwfocus( )
ls_ColumnName = ldw_focus.GetColumnName()
ldw_focus.dynamic f_set_ib_valuesetting(true)
//Trường hợp không cài đặt return_col (report)
if upperbound(ls_rtn_column[]) = 0 then
	ls_tmp = string(ldw_valuset.dynamic f_getitemany(ldw_valuset.getrow( ),'CODE'))
	li_rpt_parm_rtn = lc_dwsetup_initial.f_get_report_date(ls_tmp,ld_prior_period_date, ld_last_period_date)
	if li_rpt_parm_rtn = 1 then
		this.ipo_main.idwsetup_initial.ias_rtn_data[1]  = ls_tmp
		this.ipo_main.idwsetup_initial.ias_rtn_data[2]  = string(ld_prior_period_date)
		this.ipo_main.idwsetup_initial.ias_rtn_data[3]  = string(ld_last_period_date)		
		this.f_set_returndata( this.ipo_main.idwsetup_initial.ias_rtn_data[],lb_valueset_receive_number, ldw_focus,ls_ColumnName, ls_receive_cols[])
	
		this.ipo_main.idwsetup_initial.ids_setup_dw.setfilter( "" )
		this.ipo_main.idwsetup_initial.ids_setup_dw.filter( )	
		ldw_focus.dynamic f_set_ib_valuesetting(false)
		 close(iw_display)		
		return
	end if
end if

if lb_valueset_receive_number then
	ll_row = ldw_valuset.find("gutter = 'Y'",1, ldw_valuset.rowcount( ))
	if isnull(ls_multi_choose) or ls_multi_choose = 'N' or ll_row = 0 then
		FOR li_idx = 1 to li_colCnt
			this.ipo_main.idwsetup_initial.iaa_rtn_data[li_idx]  = ldw_valuset.dynamic f_getitemany(ldw_valuset.getrow( ) , ls_rtn_column[li_idx])
		NEXT
	else
//		Do While ll_row > 0
//			FOR li_idx = 1 to li_colCnt
//				laa_rtn_data[upperbound(laa_rtn_data)+1] =  ldw_valuset.dynamic f_getitemany(ldw_valuset.getrow( ) , ls_rtn_column[li_idx])
////				this.ipo_main.idwsetup_initial.iaa_rtn_data[upperbound(this.ipo_main.idwsetup_initial.iaa_rtn_data[]) + 1]  = ldw_valuset.dynamic f_getitemany(ldw_valuset.getrow( ) , ls_rtn_column[li_idx])
//			NEXT
//			ll_row = ldw_valuset.find("gutter = 'Y'", ll_row + 1, ldw_valuset.rowcount( )+1)
//		Loop
	end if
else
	lb_selected = false
	ll_row = ldw_valuset.find("gutter = 'Y'",1, ldw_valuset.rowcount( ))
	DO while ll_row > 0 
		lb_selected = true
		FOR li_idx = 1 to li_colCnt
			if upperbound(this.ipo_main.idwsetup_initial.ias_rtn_data[]) >= li_idx then
				if this.ipo_main.idwsetup_initial.ias_rtn_data[li_idx] <> '' then this.ipo_main.idwsetup_initial.ias_rtn_data[li_idx] += ';'
			end if
			this.ipo_main.idwsetup_initial.ias_rtn_data[li_idx]  += string(ldw_valuset.dynamic f_getitemany(ll_row, ls_rtn_column[li_idx]))
		NEXT		
		ll_row = ldw_valuset.find("gutter = 'Y'", ll_row + 1, ldw_valuset.rowcount( )+1)
	LOOP
	if not lb_selected then
		FOR li_idx = 1 to li_colCnt
			this.ipo_main.idwsetup_initial.ias_rtn_data[li_idx] = string(ldw_valuset.dynamic f_getitemany(ldw_valuset.getrow( ) , ls_rtn_column[li_idx]))
		NEXT
	end if
end if

if isnull(ls_multi_choose) or ls_multi_choose = 'N' then		
	this.f_set_returndata( this.ipo_main.idwsetup_initial.iaa_rtn_data[],lb_valueset_receive_number, ldw_focus,ls_ColumnName, ls_receive_cols[])
else
	ll_row = ldw_valuset.find("gutter = 'Y'",1, ldw_valuset.rowcount( ))
	if ll_row = 0 then ll_row = ldw_valuset.getrow( )
	
	Do While ll_row > 0
		FOR li_idx = 1 to li_colCnt
			if upperbound(laa_rtn_data) = li_colCnt then
				laa_rtn_data[li_idx] =  ldw_valuset.dynamic f_getitemany(ll_row , ls_rtn_column[li_idx])
			else
				laa_rtn_data[upperbound(laa_rtn_data)+1] =  ldw_valuset.dynamic f_getitemany(ll_row , ls_rtn_column[li_idx])
			end if
		next
		this.ipo_main.idwsetup_initial.iaa_rtn_data[] = laa_rtn_data[]
		if this.f_set_returndata( this.ipo_main.idwsetup_initial.iaa_rtn_data[],lb_valueset_receive_number, ldw_focus,ls_ColumnName, ls_receive_cols[]) = -1 then
			close(iw_display)
			return 
		end if
		ll_row = ldw_valuset.find("gutter = 'Y'", ll_row + 1, ldw_valuset.rowcount( )+1)
		if ll_row > 0 then 		
			connect using lw_parent.it_transaction;
			li_rtn = ldw_focus.dynamic event e_addrow( )
			disconnect using lw_parent.it_transaction;
			if li_rtn > 0 then  ldw_focus.SetColumn(ls_receive_cols[1])
		end if
	Loop
	
end if

/*
//-- xử lý set return data --//
	if  lb_valueset_receive_number then
		if upperbound(this.ipo_main.idwsetup_initial.iaa_rtn_data[]) > 0 then 
			ls_data = string(this.ipo_main.idwsetup_initial.iaa_rtn_data[1] )
		end if
	else		
		if  upperbound(this.ipo_main.idwsetup_initial.iaa_rtn_data[]) > 0 then
			ls_data = this.ipo_main.idwsetup_initial.iaa_rtn_data[1]
		end if
	end if

	li_rtn = ldw_focus.dynamic f_setitem_returndata(ls_ColumnName , ldw_focus.getrow(), true) 
	if li_rtn <> -1 then
		if this.classname( ) = 'u_valueset' then ldw_focus.accepttext( )
	else
		ldw_focus.dynamic f_set_ib_valuesetting(false)
		close(iw_display)
		return
	end if
		//-- gửi data cho object kiểm tra neu là valueset--//
	if ls_data <> '' and this.classname() = 'u_valueset' then
		//##xử lý làm tròn --//
		li_rtn_preitemchanged = ldw_focus.dynamic f_send_message_to_object( ldw_focus,ldw_focus.getrow(),ls_ColumnName, ls_data, 'e_preitemchanged')
		if li_rtn_preitemchanged =1  then
			ldw_focus.dynamic f_setnull_columns(ls_receive_cols[] , ldw_focus.getrow())
			this.ipo_main.idwsetup_initial.ids_setup_dw.setfilter( "" )
			this.ipo_main.idwsetup_initial.ids_setup_dw.filter( )			
			ldw_focus.dynamic f_set_ib_valuesetting(false)
			return 
		end if
		//##Kết thúc xử lý làm tròn --//
		li_rtn = ldw_focus.dynamic f_send_message_to_object( ldw_focus,ldw_focus.getrow(),ls_ColumnName, ls_data, 'e_itemchanged')
		if li_rtn = -1 then
			ldw_focus.dynamic f_setnull_columns(ls_receive_cols[] , ldw_focus.getrow())
			this.ipo_main.idwsetup_initial.ids_setup_dw.setfilter( "" )
			this.ipo_main.idwsetup_initial.ids_setup_dw.filter( )	
			ldw_focus.dynamic f_set_ib_valuesetting(false)
			return 
		end if
	end if
//-----------------------------------------------------------------------//	
this.ipo_main.idwsetup_initial.ids_setup_dw.setfilter( "" )
this.ipo_main.idwsetup_initial.ids_setup_dw.filter( )	
ldw_focus.dynamic f_set_ib_valuesetting(false)
if ldw_focus.dynamic f_get_ib_focus_master( ) then
	ldw_focus =  ldw_focus.dynamic f_get_idw_master()
	if isvalid(ldw_focus) then lw_parent.f_set_idwfocus(ldw_focus)
end if
*/
this.ipo_main.idwsetup_initial.ids_setup_dw.setfilter( "" )
this.ipo_main.idwsetup_initial.ids_setup_dw.filter( )	
ldw_focus.dynamic f_set_ib_valuesetting(false)
 close(iw_display)
//return closewithreturn(iw_display,'ok')
end event

event e_dw_clicked;call super::e_dw_clicked;string				ls_multi_choose, ls_dwobject, ls_receive_columns
long				ll_row

if iw_display.classname( ) = 's_w_multi' then return ancestorreturnvalue

ls_dwobject = this.ipo_main.idwsetup_initial.ids_setup_dw.getitemstring( 1, 'dwobject')
ls_receive_columns = this.ipo_main.idwsetup_initial.ids_setup_dw.getitemstring( 1, 'receive_column')
ls_multi_choose = this.ipo_main.idwsetup_initial.ids_setup_dw.getitemstring( 1, 'multi_choose_yn')
if this.ipo_main.idwsetup_initial.f_is_valueset_receive_number(ls_dwobject,ls_receive_columns )  then
	if isnull(ls_multi_choose) or ls_multi_choose = 'N' then
		rdw_handling.setitem( vl_currentrow, 'gutter', 'N')
	end if
end if
return 1
end event

event e_dw_rbuttondown;call super::e_dw_rbuttondown;//-- return -1 ngăn đối tượng không popup menu --//
if iw_display.classname( ) = 's_w_multi' then
	return 0
else
	return -1
END IF
end event

event e_action_ctrl_bttn;datawindow				ldw_focus
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
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;'
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query; b_refresh;b_blank;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query; b_refresh;b_blank;b_delete;'
					end if
				end if
			else				
				if  ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_saveclose;b_filteron;b_query;b_refresh;b_delete;'
				else
					if this.is_drilldown_object <> '' and not isnull(this.is_drilldown_object) then
						if is_drilldown_object <> 'U_VALUESET_ENTRY' then
							istr_actionpane[li_idx].s_visible_buttons= 'b_filteron;b_okclose;b_close;b_new;b_refresh;'
						else
							istr_actionpane[li_idx].s_visible_buttons= 'b_filteron;b_okclose;b_close;b_new;b_modify;b_refresh;b_delete;'
						end if
					else
						istr_actionpane[li_idx].s_visible_buttons= 'b_filteron;b_okclose;b_close;'
					end if
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
			
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
			istr_actionpane[li_idx].s_visible_buttons =  'b_book; b_attach; b_note;b_doc_trace;b_user_trace;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
			
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_open;call super::e_window_open;int						li_width
any					laa_data[]
string					ls_colType
s_w_multi			lw_parent
t_dw_mpl			ldw_main,ldw_focus
c_string				lc_string

ldw_main = this.iw_display.f_get_dwmain( )
//-- resize window --//
li_width =max( ldw_main.f_getwidth( ), this.iw_display.dw_filter.f_getwidth( ) + 100)
this.f_set_resize_wdisplay( min(PixelsToUnits(scr_width, XPixelsToUnits!), li_width),2500)


if this.is_where_rec <> '' and not isnull(this.is_where_rec) then
	ldw_main.f_add_where(this.is_where_rec, ' AND ')
end if
if ldw_main.f_is_lang() then
	laa_data[1] = '='+gs_user_lang
	ldw_main.f_add_where('lang',laa_data[])
end if



//-- rebuild sql select column --//
//ldw_main.f_rebuild_select_column( is_display_column) 

//if len(is_display_column_history) > 0 then
//	ldw_main = this.iw_display.f_get_dw( iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default)
//	ldw_main.f_rebuild_select_column( is_display_column)
//	
//	ldw_main = this.iw_display.f_get_dw( iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default)
//	ldw_main.f_rebuild_select_column( is_display_column_history)
//	
//	if pos(is_display_column_history,'sales_person') > 0 then
//		lw_parent = iw_display.f_getparentwindow( )
//		ldw_focus = lw_parent.f_get_idwfocus( )
//		ls_colType = ldw_focus.describe( "sales_person.Coltype")
//		if ls_colType <> '' and ls_colType <> '?' then
//			laa_data[1] = ldw_focus.getitemnumber( ldw_focus.getrow( ), 'sales_person' )
//			ldw_main.f_add_where( 'sales_person', laa_data)
//		end if
//	end if
//end if
return 0
end event

event e_window_e_close;//-- Override--//
s_w_main			lw_parent
datawindow			ldw_focus

this.ipo_main.idwsetup_initial.ids_setup_dw.setfilter( "" )
this.ipo_main.idwsetup_initial.ids_setup_dw.filter( )	
lw_parent = iw_display.f_getparentwindow( )
ldw_focus = lw_parent.f_get_idwfocus( )
ldw_focus.dynamic f_set_ib_valuesetting(false)
close(iw_display)	
return 0


end event

event e_window_activate;call super::e_window_activate;return iw_display.event e_refresh( )
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;string			ls_firstcol

if rpo_dw.dataobject = istr_dwo[1].s_dwo_default  then
	if vl_currentrow > 0 then
		rpo_dw.setitem(vl_currentrow,'object_ref_id',idb_object_ref_id)
		rpo_dw.setitem(vl_currentrow,'object_ref_table','FLEXIBLE_DATA')
		iw_display.dw_filter.accepttext( )
		ls_firstcol = rpo_dw.dynamic f_getfirstcolumn(true)
		if ls_firstcol <> '' then
			rpo_dw.setitem(vl_currentrow, ls_firstcol, iw_display.is_filter_txt)
		else
			rpo_dw.setitem(vl_currentrow, 'code', iw_display.is_filter_txt)
		end if
	end if
end if
RETURN ancestorreturnvalue
end event

event e_dw_e_postretrieve;call super::e_dw_e_postretrieve;string		ls_data

b_obj_instantiate			lbo_ins

if is_drilldown_object = 'U_VALUESET_ENTRY' then
	if vl_rowcount = 0 then
		if upperbound(this.istr_data_related[1].s_data[] ) > 0 then
			ls_data = this.istr_data_related[1].s_data[1]
			if left(ls_data,1) = '=' then ls_data = trim(mid(ls_data,2))
			idb_object_ref_id = lbo_ins.f_get_flexible_id(ls_data )		
		end if
	else
		idb_object_ref_id = rpo_dw.getitemnumber(vl_rowcount, 'object_ref_id')
	end if
end if
return ancestorreturnvalue
end event

