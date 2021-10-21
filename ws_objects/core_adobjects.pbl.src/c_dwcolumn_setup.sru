$PBExportHeader$c_dwcolumn_setup.sru
forward
global type c_dwcolumn_setup from s_object_display
end type
end forward

global type c_dwcolumn_setup from s_object_display
end type
global c_dwcolumn_setup c_dwcolumn_setup

forward prototypes
public subroutine f_set_dwo_window ()
public function integer f_load_segment (ref datawindow rdw_dwcolumn_setup, double vdb_struct_id)
public function integer f_load_dwcolumn (ref datawindow rdw_dwcolumn_setup, string vs_obj_dwo)
public function integer f_get_setup_objectname (ref string rs_objectname)
public subroutine f_set_dwo_tabpage ()
public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[])
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_dwcolumn_setup_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_dwcolumn_setup_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_dwcolumn_setup_line_grid;'
istr_dwo[1].s_dwo_shared = 'd_dwcolumn_setup_form;'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Cài đặt thuộc tính dữ liệu'

istr_dwo[2].s_dwo_default =  'd_dwcolumn_setup_form'
istr_dwo[2].s_dwo_form = 'd_dwcolumn_setup_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_detail = false
istr_dwo[2].b_shared = true
istr_dwo[2].s_dwo_master = 'd_dwcolumn_setup_grid;'
istr_dwo[2].s_master_keycol = ''
istr_dwo[2].s_detail_keycol = ''
istr_dwo[2].b_ref_table_yn  = false
istr_dwo[2].s_ref_table_field = ''
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_focus_master = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_description = 'Thuộc tính dữ liệu'
istr_dwo[2].s_pic_ref_table = ''
istr_dwo[2].s_pic_ref_field = ''

//istr_dwo[3].s_dwo_default =  'd_dwcolumn_setup_line_grid'
//istr_dwo[3].s_dwo_form = ''
//istr_dwo[3].s_dwo_grid = 'd_dwcolumn_setup_line_grid'
//istr_dwo[3].b_detail = true
//istr_dwo[3].s_dwo_master = 'd_dwcolumn_setup_grid;'
//istr_dwo[3].s_master_keycol = 'ID;OBJECT_REF_CODE'
//istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID;DWVALUESET'
//istr_dwo[3].b_ref_table_yn  = true
//istr_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE'
//istr_dwo[3].b_insert = true
//istr_dwo[3].b_update = true
//istr_dwo[3].b_delete = true
//istr_dwo[3].b_query = true
//istr_dwo[3].b_print = true
//istr_dwo[3].b_excel = true
//istr_dwo[3].b_traceable = true
//istr_dwo[3].b_keyboardlocked = true
//istr_dwo[3].s_description = 'Cài đặt bộ giá trị'
end subroutine

public function integer f_load_segment (ref datawindow rdw_dwcolumn_setup, double vdb_struct_id);
int 					li_idx, li_colCnt, li_limit
Long 					ll_find, ll_row
String 				ls_dwo_trim, las_column[], ls_x, ls_coltype, ls_dwcolumn
double				ldb_id
c_string 				lc_string
t_ds					lds_dwo, lds_dwsetup_temp

lds_dwo = create t_ds
lds_dwo.DataObject = 'd_struct_segment_grid'
lds_dwo.f_settransobject( it_transaction)
/*

lds_dwsetup_temp = create t_ds
lds_dwsetup_temp.dataobject = rdw_dwcolumn_setup.dataobject


li_colCnt = lds_dwo.f_getcolumns( las_column[])
For li_idx = 1 To li_colCnt
	if las_column[li_idx] = 'gutter' then continue
	ls_x =  lds_dwo.describe( las_column[li_idx] + "_t.x")
	if ls_x <> '!' then
		ll_row = lds_dwsetup_temp.insertrow( 0)
		ldb_id = this.f_create_id( )
		lds_dwsetup_temp.setitem(ll_row, 'id',ldb_id )		
		lds_dwsetup_temp.setitem(ll_row , 'dwobject',ls_dwo_trim)
		lds_dwsetup_temp.setitem(ll_row , 'dwcolumn', las_column[li_idx])
		lds_dwsetup_temp.setitem(ll_row , 'DWDATATYPE', 'normal')
		lds_dwsetup_temp.setitem(ll_row , 'textcolor', 'default')
		lds_dwsetup_temp.setitem(ll_row , 'backcolor', 'default')
		ls_colType = lds_dwo.describe( las_column[li_idx]+'.ColType')
		if left(ls_coltype,5) = 'char(' then
			li_limit = integer(mid(ls_coltype,6 , len(ls_coltype) - 6))
			lds_dwsetup_temp.setitem(ll_row , 'limit', li_limit)
			lds_dwsetup_temp.setitem(ll_row , 'max_limit', li_limit)
		end if	
	end if
Next

if rdw_dwcolumn_setup.rowcount() = 0 then
	lds_dwsetup_temp.rowscopy( 1, lds_dwsetup_temp.rowcount(), primary!, rdw_dwcolumn_setup, 1, primary!)
else
	For ll_row = 1 to lds_dwsetup_temp.RowCount()
		ls_dwcolumn = lds_dwsetup_temp.GetItemString(ll_row, 'dwcolumn')
		ll_find = rdw_dwcolumn_setup.Find("dwcolumn = '"+ls_dwcolumn +"'",1,rdw_dwcolumn_setup.RowCount())
		If ll_find > 0 Then
			continue
		else
			lds_dwsetup_temp.rowscopy( ll_row, ll_row, primary!, rdw_dwcolumn_setup, rdw_dwcolumn_setup.rowcount()+1 , primary!)
		End If
	Next
end if
this.iw_display.dynamic event e_save()
destroy lds_dwo
destroy lds_dwsetup_temp */
Return 1

end function

public function integer f_load_dwcolumn (ref datawindow rdw_dwcolumn_setup, string vs_obj_dwo);
int 					li_idx, li_colCnt, li_limit
Long 					ll_find, ll_row
String 				ls_dwo_trim, las_column[], ls_x, ls_coltype, ls_dwcolumn, ls_dwo, ls_objname
double				ldb_id
any					la_value[]
c_string 				lc_string
t_ds					lds_dwo, lds_dwsetup_temp, lds_label_chk

ls_dwo = vs_obj_dwo
ls_objname = upper(lc_string.f_gettoken( ls_dwo, ';'))
lds_dwo = create t_ds
lds_dwo.DataObject = ls_dwo

ls_dwo_trim = mid(ls_dwo,1,len(ls_dwo)-5)

lds_dwsetup_temp = create t_ds
lds_dwsetup_temp.dataobject = rdw_dwcolumn_setup.dataobject

lds_label_chk = create t_ds
lds_label_chk.dataobject = 'd_label_foreign_grid'
la_value[1] = '=' + ls_objname
la_value[2] = ls_dwo_trim
la_value[3] = '=' + gs_user_lang
lds_label_chk.f_add_where( 'subcode;code;lang',la_value[])
lds_label_chk.settransobject( it_transaction)
if lds_label_chk.retrieve( ) = 0 then
	gf_messagebox('m.c_dwcolumn_setup.01','Thông báo','Chưa chạy nhãn cho DW:@'+ls_dwo_trim,'exclamation','ok',1)
	return -1
end if

li_colCnt = lds_dwo.f_getcolumns( las_column[])
For li_idx = 1 To li_colCnt
	if las_column[li_idx] = 'gutter' then continue
	ls_x =  lds_dwo.describe( las_column[li_idx] + "_t.x")
	if ls_x <> '!' then
		//-- kiểm tra có nhãn chưa --//
		if lds_label_chk.find( "subcode = '"+ls_objname + "' AND code='"+ls_dwo_trim+'.'+las_column[li_idx]+"_t'", 1, lds_label_chk.rowcount()) > 0 then
			ll_row = lds_dwsetup_temp.event e_addrow( )
			ldb_id = this.f_create_id_ex(it_transaction )
			lds_dwsetup_temp.setitem(ll_row, 'id',ldb_id )		
			lds_dwsetup_temp.setitem(ll_row , 'object',ls_objname)
			lds_dwsetup_temp.setitem(ll_row , 'dwobject',ls_dwo_trim)
			lds_dwsetup_temp.setitem(ll_row , 'dwcolumn', las_column[li_idx])
			lds_dwsetup_temp.setitem(ll_row , 'DWDATATYPE', 'normal')
			lds_dwsetup_temp.setitem(ll_row , 'textcolor', 'default')
			lds_dwsetup_temp.setitem(ll_row , 'backcolor', 'default')
			ls_colType = lds_dwo.describe( las_column[li_idx]+'.ColType')
			if left(ls_coltype,5) = 'char(' then
				li_limit = integer(mid(ls_coltype,6 , len(ls_coltype) - 6))
				lds_dwsetup_temp.setitem(ll_row , 'limit', li_limit)
				lds_dwsetup_temp.setitem(ll_row , 'max_limit', li_limit)
			end if	
		else
			gf_messagebox('m.c_dwcolumn_setup.02','Thông báo','Chưa chạy nhãn cho cột:@'+ las_column[li_idx],'exclamation','ok',1)
		end if
	end if
Next

if rdw_dwcolumn_setup.rowcount() = 0 then
	lds_dwsetup_temp.rowscopy( 1, lds_dwsetup_temp.rowcount(), primary!, rdw_dwcolumn_setup, 1, primary!)
else
	For ll_row = 1 to lds_dwsetup_temp.RowCount()
		ls_dwcolumn = lds_dwsetup_temp.GetItemString(ll_row, 'dwcolumn')
		ll_find = rdw_dwcolumn_setup.Find("dwcolumn = '"+ls_dwcolumn +"'",1,rdw_dwcolumn_setup.RowCount())
		If ll_find > 0 Then
			continue
		else
			lds_dwsetup_temp.rowscopy( ll_row, ll_row, primary!, rdw_dwcolumn_setup, rdw_dwcolumn_setup.rowcount()+1 , primary!)
		End If
	Next
end if
this.iw_display.dynamic event e_save()
destroy lds_dwo
destroy lds_dwsetup_temp
Return 1

end function

public function integer f_get_setup_objectname (ref string rs_objectname);datawindow			ldw_main
string					ls_object


ldw_main = iw_display.dynamic f_get_dwmain()
if ldw_main.getrow( ) > 0 then
	ls_object = ldw_main.getitemstring( ldw_main.getrow(), 'object')
	if ls_object <> '' and not isnull(ls_object) then
		rs_objectname = ls_object
		return 1
	else
		gf_messagebox('m.c_dwcolumn_setup.f_get_setup_objectname.01','Thông báo','Cài đặt bảng chưa có đối tượng','exclamation','ok',1)	
		return -1
	end if
else
	gf_messagebox('m.c_dwcolumn_setup.f_get_setup_objectname.02','Thông báo','Không có dữ liệu:c_dwcolumn_setup.f_get_setup_objectname: line 4','exclamation','ok',1)
	return -1
end if
end function

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
//iastr_dwo_tabpage[1].i_leftpart_width = 2830
iastr_dwo_tabpage[1].s_description = 'Cài đặt bộ giá trị phụ thuộc'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_dwcolumn_setup_line_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_dwcolumn_setup_line_grid'
iastr_dwo_tabpage[1].str_dwo[1].b_master = false
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = false
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_dwcolumn_setup_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol = 'ID;OBJECT_REF_CODE'
iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;DWVALUESET'
iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = true
iastr_dwo_tabpage[1].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE'
iastr_dwo_tabpage[1].str_dwo[1].b_insert = true
iastr_dwo_tabpage[1].str_dwo[1].b_update = true
iastr_dwo_tabpage[1].str_dwo[1].b_delete = true
iastr_dwo_tabpage[1].str_dwo[1].b_query = true
iastr_dwo_tabpage[1].str_dwo[1].b_print = true
iastr_dwo_tabpage[1].str_dwo[1].b_excel = true
iastr_dwo_tabpage[1].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[1].b_keyboardlocked = true
//iastr_dwo_tabpage[1].str_dwo[1].s_description ='Cài đặt phụ thuộc valueset'
//iastr_dwo_tabpage[1].str_dwo[1].s_gb_name='gb_6'


iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_display_model = '1d'
//iastr_dwo_tabpage[2].i_leftpart_width = 2830
iastr_dwo_tabpage[2].s_description = 'Cài đặt truy tìm (drilldown)'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_dwcolumn_drilldown_line_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = 'd_dwcolumn_drildown_line_grid'
iastr_dwo_tabpage[2].str_dwo[1].b_master = false
iastr_dwo_tabpage[2].str_dwo[1].b_detail = true
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = false
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_dwcolumn_setup_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[2].str_dwo[1].s_master_keycol ='ID;'
iastr_dwo_tabpage[2].str_dwo[1].s_detail_keycol ='object_ref_id;'
iastr_dwo_tabpage[2].str_dwo[1].b_ref_table_yn  = true
iastr_dwo_tabpage[2].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE'
iastr_dwo_tabpage[2].str_dwo[1].b_insert = true
iastr_dwo_tabpage[2].str_dwo[1].b_update = true
iastr_dwo_tabpage[2].str_dwo[1].b_delete = true
iastr_dwo_tabpage[2].str_dwo[1].b_query = true
iastr_dwo_tabpage[2].str_dwo[1].b_print = true
iastr_dwo_tabpage[2].str_dwo[1].b_excel = true
iastr_dwo_tabpage[2].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[2].str_dwo[1].b_keyboardlocked = true
//iastr_dwo_tabpage[2].str_dwo[1].s_description ='Cài đặt truy tìm (drilldown)'
//iastr_dwo_tabpage[2].str_dwo[1].s_gb_name='gb_6'


end subroutine

public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[]);

if pos(rdw_focus.dataobject, 'd_dwcolumn_setup_') > 0 then
	ra_args[1] = gs_user_lang
end if
return upperbound(ra_args[])
end function

on c_dwcolumn_setup.create
call super::create
end on

on c_dwcolumn_setup.destroy
call super::destroy
end on

event constructor;call super::constructor;//-- override --//

is_table = 'DWCOLUMN_SETUP_HDR'
ib_changed_dwo_4edit = false
is_display_model = 'up_1d_1d_lo_tb'
is_object_title = 'Cài đặt thuộc tính dữ liệu'

istr_actionpane[1].s_description = 'Cài đặt thuộc tính dữ liệu'

end event

event e_dw_e_postretrieve;call super::e_dw_e_postretrieve;

string 	ls_dwo

if rpo_dw.dataobject = 'd_dwcolumn_setup_grid'  then
	if vl_rowcount = 0 then
		ls_dwo = iw_display.dynamic f_get_rightcliked_objname() 		
		this.f_load_dwcolumn(rpo_dw , ls_dwo)
	end if
end if
return 0
end event

event e_dw_e_preretrieve;call super::e_dw_e_preretrieve;c_string					lc_string
window					lw_parent
long						ll_cur_hdl
string						ls_dwo, ls_dwo_label, ls_objname
any						laa_value[]

if rpo_dw.dataobject = 'd_dwcolumn_setup_grid'  then
	if not isvalid(iw_display) then return -1
	//-- kiem tra xem đã tạo label chưa --//
	ls_dwo = iw_display.dynamic f_get_rightcliked_objname()
	if ls_dwo = '' then
		lw_parent = iw_display.f_getparentwindow( )
		if not isvalid(lw_parent) then
			ls_dwo = 'c_dwcolumn_setup;d_dwcolumn_setup_grid'
		end if
	end if
	ls_objname = lc_string.f_gettoken( ls_dwo, ';')
	ls_dwo = mid(ls_dwo,1, len(ls_dwo) -5 )
	ls_dwo_label = t_w_mdi.ids_lang_text.f_get_lang_text( ls_dwo)
	if ls_dwo_label = '' then
		gf_messagebox('m.c_dwcolumn_setup.e_dw_e_preretrieve.01','Thông báo','Chưa tạo nhãn (label) cho bảng dữ liệu','exclamation','ok',1)
		return -1
	end if
	//-- them dieu kien vao where --//
	laa_value[1] = '='+upper(ls_objname)
	laa_value[2] = '='+ls_dwo
	rpo_dw.dynamic f_add_where('object;dwobject', laa_value[])
end if
return 0
end event

event e_window_e_refresh;call super::e_window_e_refresh;string				ls_dwo
datawindow		ldw_main

ldw_main = iw_display.dynamic f_get_dwmain()
ls_dwo = iw_display.dynamic f_get_rightcliked_objname() 
this.f_load_dwcolumn( ldw_main, ls_dwo)
return 1
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;t_dw_mpl		ldw_handle
int				li_row

if rpo_dw.dataobject = 'd_dwcolumn_setup_grid' or   rpo_dw.dataobject = 'd_dwcolumn_setup_form'  then
	if upper(vs_colname) = 'OBJECT_REF_CODE' then
		ldw_handle = iw_display.dynamic f_get_dw('d_dwcolumn_setup_line_grid')
		FOR li_row = 1 to ldw_handle.rowcount( )
			ldw_handle.setitem(li_row, 'DWVALUESET',vs_editdata)
		NEXT
	end if
end if
return 0

end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;long	ll_row

if rpo_dw.dataobject = 'd_dwcolumn_setup_grid' or rpo_dw.dataobject = 'd_dwcolumn_setup_form' then
	if vl_currentrow > 1 then
		ll_row = 1
	elseif vl_currentrow =1 and rpo_dw.rowcount() > 1 then
		ll_row = 2
	end if
	if ll_row > 0 then
		rpo_dw.setitem(vl_currentrow, 'dwobject', rpo_dw.getitemstring(ll_row, 'dwobject'))
		rpo_dw.setitem(vl_currentrow, 'object', rpo_dw.getitemstring(ll_row, 'object'))
	end if
end if
return 0
end event

event e_window_e_postopen_child;call super::e_window_e_postopen_child;s_w_main			lw_parent

lw_parent = iw_display.f_getparentwindow( )
if not isvalid(lw_parent) then return 0
iw_display.is_rightclicked_objname = lw_parent.is_rightclicked_objname
lw_parent.is_rightclicked_objname= ''
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;
iw_display.f_set_ii_upperpart_height( 3/5)

iw_display.f_set_ii_leftpart_width(1/8  )

return 0
end event

