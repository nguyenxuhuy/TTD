$PBExportHeader$c_dwservice.sru
$PBExportComments$cac function liên quan đến format, kiểm tra data
forward
global type c_dwservice from c_obj_service
end type
end forward

global type c_dwservice from c_obj_service
end type

type variables
string 			is_data // data cua column dang edit
any 				iaa_return_val[] //value tra ve cua c_w_value_set
any 				iaa_retrieve_val[10] // value de retrieve cho c_w_value_set
integer 			ii_ref_id
string 			is_insert_struct_yn
end variables

forward prototypes
public function decimal f_dw_calculate (ref datawindow rdw_data, string ls_col)
public function boolean f_check_exists_dw (string v_library_name, string v_datawindow_name, ref string v_datawindow_systax)
public function integer f_get_dwlist (string vs_lib, ref datawindow rdw_list)
public function integer f_get_dwcollist (string vs_dwobject, ref datawindow rdw_collist)
public function integer f_get_dwcollist (string vs_dwobject, ref datastore rds_collist)
public function integer f_get_dwlist (string vs_lib, ref datastore rdw_list)
public function integer f_get_dwcollist (ref datawindow rdw_collist)
public function string f_buildwhereclause (powerobject vpo_dw, string vs_dwcolumns, string vs_criteria_of_dwcolumns)
public function integer f_build_sql_select (powerobject vpo_dw, string vs_columns, ref string rs_newsql)
public function integer f_build_sql_delete (powerobject vpo_dw, string vs_where, ref string rs_newsql)
public function integer f_get_build_column (powerobject vpo_dw, ref string rs_build_colname, ref string rs_coltype)
public function integer f_getcolumns (powerobject vpo_dw, ref string as_columns[])
public function integer f_getcolumns_sql (powerobject vpo_dw, ref string as_columns[])
public function integer f_getcurrentsql (ref powerobject rpo_dw, ref string rs_originalsql_nowhere, ref string rs_whereclause)
public function integer f_get_tablesql (ref powerobject rpo_dw, ref string rs_tablesql)
public function integer f_build_rec_criteria (double vdb_rule_id, ref s_str_criteria_rec rs_str_criteria_rec[])
public function integer f_getobjects (powerobject vpo_dw, ref string rs_objlist[], string vs_objtype, string vs_band, boolean vb_visibleonly)
public function long f_getwidth (powerobject vpo_dw)
public function any f_getitemany_dwc (datawindowchild vdwc_handle, long al_row, string as_column, dwbuffer adw_buffer, boolean ab_orig_value)
public function any f_getitemany_dwc (datawindowchild vdwc_handle, long al_row, string as_column)
public function integer f_build_str_criteria (powerobject vpo_dw, string vs_colname_dwcolumn, string vs_colname_criteria, ref s_str_criteria_rec rs_str_criteria[])
public function string f_buildwhereclause (powerobject vpo_dw, s_str_criteria_rec vs_str_criteria[])
public function string f_buildwhereclause_4_dwmain (t_dw_mpl vpo_dw, string vs_detailwhere)
public function integer f_buildwhereclause_of_relation (ref s_object_display rpo_handle, ref s_str_dwo_related rstr_data_related[])
public function integer f_buildwhereclause_of_relation (ref powerobject rpo_dw, ref s_str_dwo_related rstr_data_related[])
public function string f_get_dataobject (powerobject vpo_handle)
public function integer f_update_resize_parm (ref s_object_display rod_handle)
public function string f_buildwhere_rec_security (powerobject vdw_record, string vs_dwo, string vs_object_name)
public function boolean f_is_lang_dwc (datawindowchild vdwc_handle)
public function integer f_add_where_dwc (datawindowchild vdwc_handle, string vs_columns, any vaa_value[])
private function integer f_update_tabpage_resize_parm (ref s_object_display rod_handle, ref t_t rt_tab)
public function integer f_copy_f_t (powerobject vpo_copied_from, ref powerobject rpo_copied_to)
public function integer f_copy_f_t (powerobject vpo_copied_from, ref powerobject rpo_copied_to, long vl_start, long vl_end)
public function string f_find_obj_ref_id (powerobject vpo_copied)
public function integer f_insert_matching (t_ds_db vpo_source[], s_str_dwo_related vstr_related[], s_object_display vpo_handle)
public function string f_get_object_code (double vdb_object_id)
public function integer f_insert_streamvalue (s_str_streamvalue vastr_streamvalue[], s_object_display vod_handling, string vs_qty_yn, string vs_value_yn)
public function integer f_insert_sv (t_dw_mpl vdw_accessary, t_dw_mpl vdw_data, t_ds_db rds_streamvalue, string vs_colname_data, string vs_colname_sv, boolean vb_addrow)
public function integer f_get_qty_and_value_yn (double vdb_doc_id, ref string rs_quantity_yn, ref string rs_value_yn)
public function integer f_get_lot_or_serial_yn (double vdb_item_id, ref string rs_lot_yn, ref string rs_serial_yn)
public function integer f_update_streamvalue (t_dw_mpl vdw_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row)
public function boolean f_is_warehouse (double vdb_object_id)
public function integer f_caculation_close_qty (ref any raa_data[], date vd_trans_date)
public function long f_get_open_qty (date vd_trans_date, double vdb_object_id, double vdb_item_id, double vdb_branch_id, double vdb_company_id, double vdb_spec_id, double vdb_loc_id, string vs_serial_no, string vs_lot_no)
public function integer f_postinsert_streamvalue (s_object_display vod_handling, t_dw_mpl vdw_main, t_dw_mpl vdw_item, ref t_ds_db rds_stream, long vl_row, long vl_item_row, string vs_value_yn, string vs_qty_yn)
public function string f_buildwhere_4_copy_master (string vs_detail_where, string vs_detail_table, t_dw_mpl vdw_detail)
public function string f_buildwhere_line_4_copy (s_str_dwo_related vstr_dwo_related, t_dw_mpl vdw_match)
public function integer f_parse_fromwhere_clause (t_ds vds_handle, ref string rs_table, ref string rs_table_alias, ref string rs_joinclause, ref string rs_whereclause)
public function integer f_parse_fromwhere_clause (t_dw vdw_handle, ref string rs_table, ref string rs_table_alias, ref string rs_joinclause, ref string rs_whereclause)
public function boolean f_is_object_col_check (string vs_column_chk, datawindow vdw_copied)
public function integer f_copy_version (powerobject vpo_detail, ref t_transaction vt_transaction, string vs_dataobject, string vas_id_replace[])
public function integer f_copy_version (powerobject vpo_detail, ref t_transaction vt_transaction)
public function boolean f_is_dr_cr_object (double vdb_object_id, string vs_dwo)
public function integer f_set_data_sum (powerobject vpo_from_copied, t_dw_mpl vdw_to_copied, string vas_from_col[], string vas_to_col[], boolean vb_addrow, string vas_main_col_chk_sum[], string vas_related_col_chk_sum[], string vas_col_sum[], powerobject vpo_dr_cr_object, string vas_col_dr_cr_object[], string vas_match_column[], string vas_match_f_column[], double vdb_t_doc_id, ref t_ds_db rds_matching, s_object_display vod_handling, s_str_dwo_related vstr_dwo_related)
public function integer f_update_data_copied (string vas_main_obj_column_copy[], string vas_related_obj_column_copy[], boolean vb_f_sum, string vas_main_col_chk_sum[], string vas_related_col_chk_sum[], string vas_col_sum[], t_ds_db vds_copied, datawindow vdw_copied, powerobject vpo_dr_cr_object, string vas_col_dr_cr_object[], string vas_match_column[], string vas_match_f_column[], double vdb_t_doc_id, ref t_ds_db rds_matching, s_object_display vod_handling, s_str_dwo_related vstr_dwo_related)
public function integer f_copy (datawindow vdw_master, datawindow vdw_copied, ref t_ds_db rds_copied, string vs_type_copy)
public function string f_getcolumnlabel (string vs_colname, string vs_dwo, string vs_objname)
public function integer f_send_mail (string vs_object_name, string vs_to_email, string vs_cc_email, string vs_subject, string vs_attack_files, string vs_body, boolean vb_display)
public function integer f_send_mail (string vs_to_email, string vs_cc_email, string vs_subject, string vs_attack_files, string vs_header, string vs_body, string vs_footer, integer vi_format, boolean vb_display)
public function integer f_buildwhere_4_copy (s_str_dwo_related vstr_dwo_related, t_dw_mpl vdw_match, ref string rs_joinclause, ref string rs_wherecluase)
public function integer f_update_dwtabseq (ref s_object_display rod_handle, t_dw_mpl vdw_handle, t_dw_mpl vadw_none_md[])
public function string f_buildwhere_line_4_copy (s_str_dwo_related vstr_dwo_related, t_ds_db_ws vds_match)
public function string f_buildwhere_rec_security_ws (t_ds_db_ws vds_record, string vs_dwo, string vs_object_name)
public function boolean f_is_company (datawindowchild vdwc_handle)
public function boolean f_is_branch (datawindowchild vdwc_handle)
public function integer f_copy (datawindow vdw_master, datawindow vdw_copied, ref t_ds_db rds_copied, boolean vb_selected_copy)
public function long f_set_gutter_rowcount (ref datawindowchild rdwc)
public function string f_buildwhere_rec_security_ex (powerobject vdw_record, string vs_dwo, string vs_object_name, ref t_transaction rt_transaction)
public function integer f_update_dwtabseq_ex (ref s_object_display rod_handle, t_dw_mpl vdw_handle, t_dw_mpl vadw_none_md[], ref t_transaction rt_transaction)
public function integer f_update_resize_parm_ex (ref s_object_display rod_handle, ref t_transaction rt_transaction)
public function string f_buildwhere_rec_security_ex (powerobject vdw_record, string vs_dwo, string vs_object_name)
public function string f_getcolumnlabel_ex (string vs_colname, string vs_dwo, string vs_objname, ref t_transaction rt_transaction)
public function integer f_getorginsql (string vs_dwo, ref string rs_originalsql_nowhere, ref string rs_whereclause)
public function integer f_build_rec_criteria_ex (double vdb_rule_id, ref s_str_criteria_rec rs_str_criteria_rec[], ref t_transaction rt_transaction)
public function string f_buildwhere_rec_security_ex (datawindowchild vdwc_record, string vs_dwo, string vs_object_name)
end prototypes

public function decimal f_dw_calculate (ref datawindow rdw_data, string ls_col);dec ldc_rtn
try
	ldc_rtn = Dec(rdw_data.describe("Evaluate(ls_col, currentrow())"))
	return ldc_rtn
catch (runtimeerror lre)
//	openwithparm(c_w_err, lre.text)
end try
end function

public function boolean f_check_exists_dw (string v_library_name, string v_datawindow_name, ref string v_datawindow_systax);/*--------------------------------------------------------------------
         Khởi tạo: Út
             Ngày : 13-07-2009
		----------------------------------------------------------		 
 Nội dung xử lý: kiểm tra trong thư viện v_library_name có chứa datawindow v_datawindow_name.
    Giá trị trả về: 
	 				True Có chứa.
					False không chứa. 
--------------------------------------------------------------------
Sửa:none
--------------------------------------------------------------------*/
String ls_dwsyn, ls_errors
v_datawindow_systax = LibraryDirectoryEx (v_library_name, DirDataWindow!)
if pos(v_datawindow_systax,v_datawindow_name +'~t') > 0 then
	return true
else
	return false
end if 

end function

public function integer f_get_dwlist (string vs_lib, ref datawindow rdw_list);/*===========================================
Lấy danh sách các datawindow trong thư viện
-----------------------------------------------------------
Tham số
	vs_lib: tên thư viện
	rdw_list: Datawindow chứa danh sách tên datawindow trong thư viện
--------------------------------------------------------------
return (integer): 1 thành công
					: -1 lỗi
=============================================*/
string ls_lib_list, ls_libs[], ls_lib_name, ls_lib_path, ls_obj_lib, ls_compare_name, ls_impstring
int li_cnt, li_pos, li_idx, li_star_pos
long ll_rows
c_obj_service lobj_srv


If not isvalid(rdw_list) then return -1
if isnull(rdw_list.dataobject) or trim(rdw_list.dataobject) = '' then return -1

ls_lib_list = GetLibraryList()
li_cnt = lobj_srv.f_stringtoarray(ls_lib_list, ',', ls_libs)
li_star_pos = pos(vs_lib, '*')
For li_idx = 1 to li_cnt
	ls_lib_path = ls_libs[li_idx]
	li_pos = LastPos(ls_lib_path,'\')
	ls_lib_name = Mid(ls_lib_path,li_pos + 1)
	if li_star_pos = 0 then
		if vs_lib =  ls_lib_name then
			ls_obj_lib = LibraryDirectoryEx(ls_lib_path, DirDataWindow!)			
			ls_impstring = ls_obj_lib
			exit
		end if			
	elseif li_star_pos = 1  and len (vs_lib) =  1 then 
		ls_obj_lib = LibraryDirectoryEx(ls_lib_path, DirDataWindow!)
	elseif li_star_pos = 1  and len (vs_lib) >  1 then 
		if right(vs_lib, len(vs_lib) -1) =  right(ls_lib_name, len(vs_lib) -1) then
			ls_obj_lib = LibraryDirectoryEx(ls_lib_path, DirDataWindow!)
		end if
	elseif li_star_pos = len (vs_lib) then
		if left(vs_lib, len(vs_lib) -1) =  left(ls_lib_name, len(vs_lib) -1) then
			ls_obj_lib = LibraryDirectoryEx(ls_lib_path, DirDataWindow!)
		end if	
	else
		return -1
	end if	
	if ls_obj_lib <> '' then
		ls_impstring = ls_impstring + ls_obj_lib	
		ls_obj_lib = ''
	end if
NEXT
rdw_list.Reset( )
rdw_list.ImportString(ls_impstring)
rdw_list.Sort()
rdw_list.resetupdate()
return 1
end function

public function integer f_get_dwcollist (string vs_dwobject, ref datawindow rdw_collist);/*===========================================
Lấy danh sách các cột của datawindow
-----------------------------------------------------------
Tham số
	vs_dwobject: tên datawindow
	rdw_collist: Datawindow chứa danh sách tên cột
--------------------------------------------------------------
return (integer): 1 thành công
					: -1 lỗi
=============================================*/
datastore lds_dwobject
c_dwservice  lcd_dwservice
int li_nbr_objects, li_idx, li_cnt, li_insertrow
string  ls_object, lsa_object_name[], ls_colname, ls_type, ls_name_text, ls_coldesc, ls_x

If not isvalid(rdw_collist) then return -1
if isnull(rdw_collist.dataobject) or rdw_collist.dataobject = ''  then return -1


DECLARE l_cur cursor for
select text from erp_label el
where el.lang_id = :gs_user_lang
  and el.label_id = :vs_dwobject
  and el.sublabel_id = :ls_name_text;

lds_dwobject = create datastore
lds_dwobject.dataobject = vs_dwobject
ls_object = lds_dwobject.describe("Datawindow.Objects")
li_nbr_objects = lcd_dwservice.f_StringToArray(ls_object,"~t",lsa_object_name)
FOR li_idx = 1 to li_nbr_objects
	ls_colname =lsa_object_name[li_idx]
	ls_type = lds_dwobject.describe(ls_colname + ".type")
//	ls_x = lds_dwobject.describe(ls_colname + ".x")
	if lower(ls_type) = 'column'   then
		li_insertrow = rdw_collist.insertrow(0)
		ls_name_text = ls_colname+'_t'
		OPEN l_cur;
		FETCH l_cur into :ls_coldesc;
		if sqlca.sqlcode = 0 then
			rdw_collist.setitem(li_insertrow, 'dwcol',ls_colname)
			rdw_collist.setitem(li_insertrow, 'dwcol_desc',ls_coldesc)
		else
			rdw_collist.setitem(li_insertrow, 'dwcol',ls_colname)
			rdw_collist.setitem(li_insertrow, 'dwcol_desc',ls_colname)			
		end if
		
		CLOSE l_cur;
	end if
NEXT
rdw_collist.resetupdate()
return 1
end function

public function integer f_get_dwcollist (string vs_dwobject, ref datastore rds_collist);/*===========================================
Lấy danh sách các cột của datawindowobject
-----------------------------------------------------------
Tham số
	vs_dwobject: tên datawindowobject
	rds_collist: Datawindowobject chứa danh sách tên cột
--------------------------------------------------------------
return (integer): 1 thành công
					: -1 lỗi
=============================================*/
datastore lds_dwobject
c_dwservice  lcd_dwservice
int li_nbr_objects, li_idx, li_cnt, li_insertrow
string  ls_object, lsa_object_name[], ls_colname, ls_type, ls_name_text, ls_coldesc, ls_x

If not isvalid(rds_collist) then return -1
if isnull(rds_collist.dataobject) or rds_collist.dataobject = ''  then return -1

DECLARE l_cur cursor for
select text from erp_label el
where el.lang_id = :gs_user_lang
  and el.label_id = :vs_dwobject
  and el.sublabel_id = :ls_name_text;

lds_dwobject = create datastore
lds_dwobject.dataobject = vs_dwobject
ls_object = lds_dwobject.describe("Datawindow.Objects")
li_nbr_objects = lcd_dwservice.f_StringToArray(ls_object,"~t",lsa_object_name)
FOR li_idx = 1 to li_nbr_objects
	ls_colname =lsa_object_name[li_idx]
	ls_type = lds_dwobject.describe(ls_colname + ".type")
//	ls_x = lds_dwobject.describe(ls_colname + ".x")
	if lower(ls_type) = 'column'   then
		li_insertrow = rds_collist.insertrow(0)
		ls_name_text = ls_colname+'_t'
		OPEN l_cur;
		FETCH l_cur into :ls_coldesc;
		if sqlca.sqlcode = 0 then
			rds_collist.setitem(li_insertrow, 'dwcol',ls_colname)
			rds_collist.setitem(li_insertrow, 'dwcol_desc',ls_coldesc)
		else
			rds_collist.setitem(li_insertrow, 'dwcol',ls_colname)
			rds_collist.setitem(li_insertrow, 'dwcol_desc',ls_colname)			
		end if
		
		CLOSE l_cur;
	end if
NEXT
rds_collist.resetupdate()
return 1
end function

public function integer f_get_dwlist (string vs_lib, ref datastore rdw_list);/***************************************************
Chức năng: Lấy danh sách các datawindow trong thư viện
------------------------------------------------------------------------------------
Tham số:
	- vs_lib: tên thư viện
	- rdw_list: datastore chứa danh sách tên datawindow trong thư viện
----------------------------------------------------------------------------------
return (integer): 1 thành công
					: -1 lỗi
=============================================*/
string 				ls_lib_list, ls_libs[], ls_lib_name, ls_lib_path, ls_obj_lib, ls_compare_name, ls_impstring
int						li_cnt, li_pos, li_idx, li_star_pos
long 					ll_rows
c_obj_service 		lobj_srv


If not isvalid(rdw_list) then return -1

if isnull(rdw_list.dataobject) or trim(rdw_list.dataobject) = '' then return -1

ls_lib_list = GetLibraryList()
li_cnt = lobj_srv.f_stringtoarray(ls_lib_list, ',', ls_libs)
li_star_pos = pos(vs_lib, '*')
For li_idx = 1 to li_cnt
	ls_lib_path = ls_libs[li_idx]
	li_pos = LastPos(ls_lib_path,'\')
	ls_lib_name = Mid(ls_lib_path,li_pos + 1)
	if li_star_pos = 0 then
		if vs_lib =  ls_lib_name then
			ls_obj_lib = LibraryDirectoryEx(ls_lib_path, DirDataWindow!)			
			ls_impstring = ls_obj_lib
			exit
		end if			
	elseif li_star_pos = 1  and len (vs_lib) =  1 then 
		ls_obj_lib = LibraryDirectoryEx(ls_lib_path, DirDataWindow!)
	elseif li_star_pos = 1  and len (vs_lib) >  1 then 
		if right(vs_lib, len(vs_lib) -1) =  right(ls_lib_name, len(vs_lib) -1) then
			ls_obj_lib = LibraryDirectoryEx(ls_lib_path, DirDataWindow!)
		end if
	elseif li_star_pos = len (vs_lib) then
		if left(vs_lib, len(vs_lib) -1) =  left(ls_lib_name, len(vs_lib) -1) then
			ls_obj_lib = LibraryDirectoryEx(ls_lib_path, DirDataWindow!)
		end if	
	else
		return -1
	end if	
	if ls_obj_lib <> '' then
		ls_impstring = ls_impstring + ls_obj_lib	
		ls_obj_lib = ''
	end if
NEXT
rdw_list.Reset( )
rdw_list.ImportString(ls_impstring)
rdw_list.Sort()
rdw_list.resetupdate()
return 1
end function

public function integer f_get_dwcollist (ref datawindow rdw_collist);/*===========================================
Lấy danh sách các cột của datawindow
-----------------------------------------------------------
Tham số
	vs_dwobject: tên datawindow
	rdw_collist: Datawindow chứa danh sách tên cột
--------------------------------------------------------------
return (integer): 1 thành công
					: -1 lỗi
=============================================*/
datastore lds_dwobject, lds_dwlist
c_dwservice  lcd_dwservice
long li_nbr_objects, li_idx, li_cnt, li_insertrow
string  ls_object, lsa_object_name[], ls_colname, ls_type, ls_name_text, ls_coldesc, ls_x, ls_dwobject

If not isvalid(rdw_collist) then return -1
if isnull(rdw_collist.dataobject) or rdw_collist.dataobject = ''  then return -1

lds_dwlist =  create datastore
lds_dwlist.dataobject = 'd_dw_list'
this.f_get_dwlist( 'dw*', lds_dwlist)

DECLARE l_cur cursor for
select text from erp_label el
where el.lang_id = :gs_user_lang
  and el.label_id = :ls_dwobject
  and el.sublabel_id = :ls_name_text;

lds_dwobject = create datastore
FOR li_idx =  1 to lds_dwlist.rowcount( )
	ls_dwobject = lds_dwlist.getitemstring( li_idx, 'object_name')

	lds_dwobject.dataobject = ls_dwobject
	ls_object = lds_dwobject.describe("Datawindow.Objects")
	li_nbr_objects = lcd_dwservice.f_StringToArray(ls_object,"~t",lsa_object_name)
	FOR li_cnt = 1 to li_nbr_objects
		ls_colname =lsa_object_name[li_cnt]
		ls_type = lds_dwobject.describe(ls_colname + ".type")
	//	ls_x = lds_dwobject.describe(ls_colname + ".x")
		if lower(ls_type) = 'column'   then
			li_insertrow = rdw_collist.find("dwcol = '"+ls_colname+"'", 1, rdw_collist.rowcount())
			if li_insertrow > 0 then continue
			li_insertrow = rdw_collist.insertrow(0)
			ls_name_text = ls_colname+'_t'
			OPEN l_cur;
			FETCH l_cur into :ls_coldesc;
			if sqlca.sqlcode = 0 then
				rdw_collist.setitem(li_insertrow, 'dwcol',ls_colname)
				rdw_collist.setitem(li_insertrow, 'dwcol_desc',ls_coldesc)
			else
				rdw_collist.setitem(li_insertrow, 'dwcol',ls_colname)
				rdw_collist.setitem(li_insertrow, 'dwcol_desc',ls_colname)			
			end if
			
			CLOSE l_cur;
		end if
	NEXT
NEXT

rdw_collist.resetupdate()
return 1
end function

public function string f_buildwhereclause (powerobject vpo_dw, string vs_dwcolumns, string vs_criteria_of_dwcolumns);string 				ls_colType,ls_where
c_string				lc_string
window				lw_parent
s_object_display	lod_parent

if this.f_get_build_column( vpo_dw, vs_dwcolumns, ls_colType) = -1 then return ''
if lower(trim(vs_criteria_of_dwcolumns)) = 'me/toi' or lower(trim(vs_criteria_of_dwcolumns)) = 'me/tôi' &
	or lower(trim(vs_criteria_of_dwcolumns)) = 'me\toi' or lower(trim(vs_criteria_of_dwcolumns)) = 'me\tôi' then
	//vs_dwcolumns = 'HANDLED_BY'
	//if this.f_get_build_column( vpo_dw, vs_dwcolumns, ls_colType) = -1 then return ''
	vs_criteria_of_dwcolumns = 'me'
end if
ls_where = lc_string.f_get_expression( vs_criteria_of_dwcolumns, ls_colType,vs_dwcolumns, 'build where')

/*
đóng ngày 16/09/2014
Long
//--xử lý phần copyf--//
if vpo_dw.dynamic typeof() = Datawindow! then
	lw_parent = vpo_dw.dynamic GetParent()
	lod_parent = lw_parent.dynamic f_get_obj_handling()
	if lod_parent.f_get_ib_copying( ) and vs_criteria_of_dwcolumns = 'me' then
	//	ls_where += ' OR ' + vs_dwcolumns + ' <> ' + string(gi_userid)
		ls_where += ' OR 1=1'
	end if
end if
*/
return ls_where
end function

public function integer f_build_sql_select (powerobject vpo_dw, string vs_columns, ref string rs_newsql);int						li_idx, li_colCnt, li_rtn, li_delCnt
string					las_original_colname[], ls_delcol[], ls_currentSQL_nowhere, ls_currentwhere, ls_dbname

t_s_sql_attr			lastr_sql[]
c_sql					lc_sql
c_string				lc_string



//-- lấy các cột không cần thiết --//
li_colCnt = vpo_dw.dynamic f_getcolumns_sql(las_original_colname[] )
FOR li_idx = 1 to li_colCnt
	if pos(lower(vs_columns), las_original_colname[li_idx]+',') = 0 then
		ls_delcol[upperbound(ls_delcol) + 1] = las_original_colname[li_idx]
	end if
NEXT

if vpo_dw.dynamic f_getCurrentSQL(ls_currentSQL_nowhere, ls_currentwhere) = 1 then
	li_rtn = lc_sql.f_parse(ls_currentSQL_nowhere, lastr_sql[])
	if li_rtn = 1 then
		//-- Remove ORDER BY clause --//
		lastr_sql[1].s_order = ""	
		li_delCnt =  upperbound(ls_delcol[] )	
		For li_idx = 1 To li_delCnt
			
			//-- Replace the selected columns of the detail by the linkage columns --//		
			ls_dbname = vpo_dw.dynamic describe(ls_delcol[li_idx] + ".DBAlias")
			if  ls_delcol[li_idx] = 'gutter' then
				ls_dbname =  ls_delcol[li_idx] 
			elseif pos(ls_dbname,'.') = 1 then
				ls_dbname =  vpo_dw.dynamic describe(ls_delcol[li_idx] + ".DBName")
			elseif ls_dbname = '!' then
				ls_dbname = ls_delcol[li_idx]
			elseif ls_dbname = '?' then
				messagebox('Thông báo','c_dwservice.f_build_sql_select: không lấy được DBalias:@'+ls_delcol[li_idx])
				return -1
			end if					
			li_rtn = lc_string.f_globalreplace(  lastr_sql[1].s_columns , ls_dbname+',', '',   lastr_sql[1].s_columns)
			if li_rtn = 0 then
				 lc_string.f_globalreplace(  lastr_sql[1].s_columns , ls_dbname, '',   lastr_sql[1].s_columns)
			end if				
		Next		
		//-- cắt dấu (,) ở cuối nếu có --//
		if lc_string.f_countoccurrences( lastr_sql[1].s_columns,',') = li_colCnt - li_delCnt then
			 lastr_sql[1].s_columns = mid( lastr_sql[1].s_columns,1,lastpos(lastr_sql[1].s_columns,',')-1)
		end if
		
		lastr_sql[1].s_where += ls_currentwhere
				
		// Rebuild the detail SQL
		rs_newsql = lc_sql.f_Assemble(lastr_sql)

	end if
else
	return -1
end if
return 0

end function

public function integer f_build_sql_delete (powerobject vpo_dw, string vs_where, ref string rs_newsql);
string					ls_currentSQL_nowhere, ls_currentwhere
int						li_rtn
t_s_sql_attr			lastr_sql[]
c_sql					lc_sql

if vpo_dw.dynamic f_getCurrentSQL(ls_currentSQL_nowhere, ls_currentwhere) = 1 then
	li_rtn = lc_sql.f_parse(ls_currentSQL_nowhere, lastr_sql[])
	if li_rtn = 1 then
		//-- Remove ORDER BY clause --//
		lastr_sql[1].s_order = ""	
		lastr_sql[1].s_Verb = "DELETE"
		lastr_sql[1].s_columns = ""
		lastr_sql[1].s_where += vs_where
				
		// Rebuild the detail SQL
		rs_newsql = lc_sql.f_Assemble(lastr_sql)

	end if
else
	return -1
end if
return 0

end function

public function integer f_get_build_column (powerobject vpo_dw, ref string rs_build_colname, ref string rs_coltype);c_string	lc_string
string		ls_colType, ls_dbname, ls_table_alias,ls_dw_type
int			li_pos

ls_colType = vpo_dw.dynamic describe(rs_build_colname+ ".ColType")
if ls_colType = '!' then
	messagebox('Thông báo','m.c_dwservice.f_get_build_column:Không lấy được coltype: '+rs_build_colname+ ' ' +this.f_get_dataobject(vpo_dw) )
	return -1			
end if

ls_dw_type = vpo_dw.dynamic describe("DataWindow.Nested")
if lower(ls_dw_type) = 'yes' then
	ls_dbname = '.'
else
	ls_dbname = vpo_dw.dynamic describe(rs_build_colname+ ".DBAlias")
end if
if pos(ls_dbname,'.') = 1 then
	ls_dbname =  vpo_dw.dynamic describe(rs_build_colname + ".DBName")
	if pos(ls_dbname,'->') > 0 then
		ls_dbname = lc_string.f_globalreplace(ls_dbname , '->', '.')
	elseif ls_dbname = '!' then
		ls_dbname = rs_build_colname
	elseif ls_dbname = '?' then
		messagebox('Thông báo','m.c_dwservice.f_get_build_column:Không lấy được DBname: '+rs_build_colname+ ' ' +this.f_get_dataobject(vpo_dw))
		return -1
	end if
elseif pos(ls_dbname,'$') > 0 then
	ls_dbname = left(ls_dbname, pos(ls_dbname,'$') - 1)
elseif pos(ls_dbname,'.') > 1 then
	ls_table_alias = mid(ls_dbname,1, pos(ls_dbname,'.') -1)
	ls_dbname =  vpo_dw.dynamic describe(rs_build_colname + ".DBName")
	ls_dbname = ls_table_alias + '.' + mid(ls_dbname,pos(ls_dbname,'.') +1)
elseif  ls_dbname = '?' then
//	if vpo_dw.dynamic describe("DataWindow.Processing") = '0' then
//		ls_dbname =  vpo_dw.dynamic describe(rs_build_colname + ".DBName")
//		if pos(ls_dbname,'->') > 0 then
//			ls_dbname = lc_string.f_globalreplace(ls_dbname , '->', '.')
//		elseif ls_dbname = '!' then
//			ls_dbname = rs_build_colname
//		elseif ls_dbname = '?' then
//			messagebox('Thông báo','m.c_dwservice.f_get_build_column:Không lấy được DBname:@'+this.f_get_dataobject(vpo_dw))
//			return -1
//		end if
//	else
		messagebox('Thông báo','m.c_dwservice.f_get_build_column:Không lấy được DBname: '+rs_build_colname+ ' ' +this.f_get_dataobject(vpo_dw))
		return -1	
//	end if
end if	

rs_coltype = ls_colType
rs_build_colname = ls_dbname
return 1
end function

public function integer f_getcolumns (powerobject vpo_dw, ref string as_columns[]);Integer	li_columns_count
String	ls_syntax,ls_columns[]
Long		ll_poscol,ll_posname

ls_syntax = vpo_dw.dynamic describe("Datawindow.syntax")

If IsNull(ls_syntax) or Len(ls_syntax) = 0 Then Return -1

ll_poscol = Pos(ls_syntax,"column(")
Do While (ll_poscol > 0)
	ll_posname = Pos(ls_syntax,"name=",ll_poscol)
	ll_posname += 5

	li_columns_count ++

	ls_columns[li_columns_count] =Trim(Mid(ls_syntax,ll_posname,Pos(ls_syntax," ",ll_posname)-ll_posname))

	ll_poscol = Pos(ls_syntax,"column(",ll_poscol+1)
Loop

as_columns = ls_columns

Return li_columns_count

end function

public function integer f_getcolumns_sql (powerobject vpo_dw, ref string as_columns[]);Integer	li_columns_count
String	ls_syntax,ls_columns[]
Long		ll_poscol,ll_posname

// Get the requestor DW syntax
ls_syntax = vpo_dw.dynamic describe("Datawindow.syntax")
// Check syntax
ll_poscol = Pos(ls_syntax,"column=(")
Do While (ll_poscol > 0)
	// Search for the name of the column
	ll_posname = Pos(ls_syntax,"name=",ll_poscol)
	// Advance cursor
	ll_posname = ll_posname + 5
	
	// Increment counter
	li_columns_count ++
	
	// Get the name of the column
	ls_columns[li_columns_count] =Trim(Mid(ls_syntax,ll_posname,Pos(ls_syntax," ",ll_posname)-ll_posname))
	
	// Get next column
	ll_poscol = Pos(ls_syntax,"column=(",ll_poscol+1)
Loop

// Return found columns
as_columns = ls_columns

Return li_columns_count
end function

public function integer f_getcurrentsql (ref powerobject rpo_dw, ref string rs_originalsql_nowhere, ref string rs_whereclause);
c_obj_service			lc_obj_service
c_sql						lc_sql
t_s_sql_attr				lstr_sql_attr[]
string						ls_originalSQL

//-- Save the SQL select statement --//
ls_originalSQL = rpo_dw.dynamic describe("Datawindow.Table.Select")

//-- Check for errors --//
If IsNull(ls_originalSQL) or Len(ls_originalSQL) = 0 Then
	Return -1
End If

//-- Prepare original SQL to be re-used in a modify DW function --//
ls_originalSQL = lc_obj_service.f_GlobalReplace(ls_originalSQL,"'","~~'")

//-- //
lc_sql.f_parse( ls_originalSQL, lstr_sql_attr[])
rs_whereclause = lstr_sql_attr[1].s_where
lstr_sql_attr[1].s_where = ''
rs_originalsql_nowhere = lc_sql.f_assemble(  lstr_sql_attr[])

Return 1

end function

public function integer f_get_tablesql (ref powerobject rpo_dw, ref string rs_tablesql);
c_string					lc_string
string						ls_originalSQL

//-- Save the SQL select statement --//
ls_originalSQL = rpo_dw.dynamic describe("Datawindow.Table.Select")

//-- Check for errors --//
If IsNull(ls_originalSQL) or Len(ls_originalSQL) = 0 Then
	Return -1
End If

//-- Prepare original SQL to be re-used in a modify DW function --//
rs_tableSQL = lc_string.f_GlobalReplace(ls_originalSQL,"'","~~'")

return 1
end function

public function integer f_build_rec_criteria (double vdb_rule_id, ref s_str_criteria_rec rs_str_criteria_rec[]);long 				ll_idx,ll_rtn,ll_row_of_rule_id
string 			ls_dwcolumns[] , ls_criteria_of_dwcolumns[],ls_modify,ls_rtn,ls_sql,las_dwobjects[]
datastore		lds_record		

ls_sql = "select RECORD_ACCESS_LINE.ID as ID, RECORD_ACCESS_LINE.DWCOLUMN as criteria_col, RECORD_ACCESS_LINE.CRITERIA as criteria_val,RECORD_ACCESS_LINE.DWOBJECT as ref_table,'' as col_of_id"+&
			" from RECORD_ACCESS_LINE join RECORD_ACCESS_HDR on RECORD_ACCESS_HDR.ID = RECORD_ACCESS_LINE.OBJECT_REF_ID"+&
													" join BUSINESS_RULE on RECORD_ACCESS_HDR.ID = BUSINESS_RULE.OBJECT_REF_ID"+&
			" where BUSINESS_RULE.ID = " + string(vdb_rule_id)
			
lds_record = create datastore
lds_record.dataobject = 'ds_replace_syntax'
ls_modify = 'Datawindow.Table.Select= "' + ls_sql +'"'
ls_rtn =lds_record.modify(ls_modify )
lds_record.settransobject( SQLCA)
ll_rtn = lds_record.retrieve( )
ll_row_of_rule_id = upperbound(rs_str_criteria_rec) + 1
if ll_rtn >0 then
	for ll_idx=1 to ll_rtn
		ls_dwcolumns[upperbound(ls_dwcolumns)+1] = lds_record.getitemstring( ll_idx, 'criteria_col')
		ls_criteria_of_dwcolumns[upperbound(ls_criteria_of_dwcolumns)+1] = lds_record.getitemstring( ll_idx, 'criteria_val')
		las_dwobjects[upperbound(las_dwobjects)+1] = lds_record.getitemstring( ll_idx, 'ref_table')
	next	
else
	ls_dwcolumns[1] = 'full.full'
	ls_criteria_of_dwcolumns[1] = 'full.full'
end if
rs_str_criteria_rec[ll_row_of_rule_id].s_dwcolumn_rec = ls_dwcolumns
rs_str_criteria_rec[ll_row_of_rule_id].s_criteria_rec = ls_criteria_of_dwcolumns
rs_str_criteria_rec[ll_row_of_rule_id].s_dwobject = las_dwobjects
return ll_row_of_rule_id
end function

public function integer f_getobjects (powerobject vpo_dw, ref string rs_objlist[], string vs_objtype, string vs_band, boolean vb_visibleonly);string	ls_ObjString, ls_ObjHolder
integer	li_Start=1, li_Tab, li_Count=0

/* Get the Object String */
ls_ObjString = vpo_dw.dynamic Describe("Datawindow.Objects")

/* Get the first tab position. */
li_Tab =  Pos(ls_ObjString, "~t", li_Start)
Do While li_Tab > 0
	ls_ObjHolder = Mid(ls_ObjString, li_Start, (li_Tab - li_Start))

	// Determine if object is the right type and in the right band
	If (lower(vpo_dw.dynamic Describe(ls_ObjHolder + ".type")) = lower(vs_ObjType) Or vs_ObjType = "*") And &
		(lower(vpo_dw.dynamic Describe(ls_ObjHolder + ".band")) = lower(vs_Band) Or vs_Band = "*") And &
		(vpo_dw.dynamic Describe(ls_ObjHolder + ".visible") = "1" Or Not vb_VisibleOnly) Then
			li_Count ++ 
			rs_ObjList[li_Count] = ls_ObjHolder
	End if

	/* Get the next tab position. */
	li_Start = li_Tab + 1
	li_Tab =  Pos(ls_ObjString, "~t", li_Start)
Loop 

// Check the last object
ls_ObjHolder = Mid(ls_ObjString, li_Start, Len(ls_ObjString))

// Determine if object is the right type and in the right band
If (lower(vpo_dw.dynamic Describe(ls_ObjHolder + ".type")) = lower(vs_ObjType) or vs_ObjType = "*") And &
	(lower(vpo_dw.dynamic Describe(ls_ObjHolder + ".band")) = lower(vs_Band) or vs_Band = "*") And &
	(vpo_dw.dynamic Describe(ls_ObjHolder + ".visible") = "1" Or Not vb_VisibleOnly) Then
		li_Count ++
		rs_ObjList[li_Count] = ls_ObjHolder
End if

Return li_Count
end function

public function long f_getwidth (powerobject vpo_dw);long	ll_Width
long	ll_Return
integer	li_NumObjects
integer	li_Count
long	ll_X
long	ll_ObjWidth
string	ls_Objects[]

// Get the names of all visible objects in the datawindow
li_NumObjects = this.f_GetObjects(vpo_dw,ls_Objects, "*", "*", True)

ll_Return = 0

For li_Count = 1 To li_NumObjects
	// Calculate the x position + the width of each object
	ll_X = Integer(vpo_dw.dynamic Describe(ls_Objects[li_Count] + ".x"))
	ll_ObjWidth = Integer(vpo_dw.dynamic Describe(ls_Objects[li_Count] + ".width"))
	ll_Width = ll_X + ll_ObjWidth

	// Return the rightmost value
	If ll_Width > ll_Return Then
		ll_Return = ll_Width
	End if
Next

Return ll_Return
end function

public function any f_getitemany_dwc (datawindowchild vdwc_handle, long al_row, string as_column, dwbuffer adw_buffer, boolean ab_orig_value);any 		la_value

/*  Determine the datatype of the column and then call the appropriate 
	 GetItemxxx function and cast the returned value */
CHOOSE CASE Lower ( Left ( vdwc_handle.Describe ( as_column + ".ColType" ) , 5 ) )

		CASE "char(", "char"		//  CHARACTER DATATYPE
			la_value = vdwc_handle.GetItemString ( al_row, as_column, adw_buffer, ab_orig_value ) 
	
		CASE "date"					//  DATE DATATYPE
			la_value = vdwc_handle.GetItemDate ( al_row, as_column, adw_buffer, ab_orig_value ) 

		CASE "datet"				//  DATETIME DATATYPE
			la_value = vdwc_handle.GetItemDateTime ( al_row, as_column, adw_buffer, ab_orig_value ) 

		CASE "decim"				//  DECIMAL DATATYPE
			la_value = vdwc_handle.GetItemDecimal ( al_row, as_column, adw_buffer, ab_orig_value ) 
	
		CASE "numbe", "long", "ulong", "real", "int"				//  NUMBER DATATYPE	
			la_value = vdwc_handle.GetItemNumber ( al_row, as_column, adw_buffer, ab_orig_value ) 
	
		CASE "time", "times"		//  TIME DATATYPE
			la_value = vdwc_handle.GetItemTime ( al_row, as_column, adw_buffer, ab_orig_value ) 

		CASE ELSE 					
			SetNull ( la_value ) 

END CHOOSE

Return la_value
end function

public function any f_getitemany_dwc (datawindowchild vdwc_handle, long al_row, string as_column);Return f_GetItemany_dwc (vdwc_handle, al_row, as_column, Primary!, FALSE )
end function

public function integer f_build_str_criteria (powerobject vpo_dw, string vs_colname_dwcolumn, string vs_colname_criteria, ref s_str_criteria_rec rs_str_criteria[]);long 				ll_idx,ll_rtn,ll_row_of_rule_id
string 			ls_dwcolumns[] , ls_criteria_of_dwcolumns[],ls_modify,ls_rtn,ls_sql

ll_row_of_rule_id = upperbound(rs_str_criteria) + 1
ll_rtn = vpo_dw.dynamic rowcount()
if ll_rtn >0 then
	for ll_idx=1 to ll_rtn
		ls_dwcolumns[upperbound(ls_dwcolumns)+1] = vpo_dw.dynamic getitemstring( ll_idx, vs_colname_dwcolumn)
		ls_criteria_of_dwcolumns[upperbound(ls_criteria_of_dwcolumns)+1] = vpo_dw.dynamic getitemstring( ll_idx, vs_colname_criteria)
	next	
end if
rs_str_criteria[ll_row_of_rule_id].s_dwcolumn_rec = ls_dwcolumns
rs_str_criteria[ll_row_of_rule_id].s_criteria_rec = ls_criteria_of_dwcolumns
return ll_row_of_rule_id
end function

public function string f_buildwhereclause (powerobject vpo_dw, s_str_criteria_rec vs_str_criteria[]);string 		ls_colType,ls_where,ls_colname_dwcolumn
c_string		lc_string
int				li_rtn,li_idx,li_idx1

li_rtn = upperbound(vs_str_criteria[])
if li_rtn > 0 then
	for li_idx = 1 to li_rtn
		for li_idx1 = 1 to upperbound(vs_str_criteria[li_idx].s_dwcolumn_rec )
			ls_colname_dwcolumn = vs_str_criteria[li_idx].s_dwcolumn_rec[li_idx1]
			this.f_get_build_column( vpo_dw,ls_colname_dwcolumn , ls_colType)
			if ls_where <> '' then ls_where += ' AND '
			ls_where = lc_string.f_get_expression( vs_str_criteria[li_idx].s_criteria_rec[li_idx1], ls_colType,ls_colname_dwcolumn, 'build where')
		next
	next
end if

return ls_where
end function

public function string f_buildwhereclause_4_dwmain (t_dw_mpl vpo_dw, string vs_detailwhere);string 			ls_where, ls_coltype, ls_dbname, ls_detail_table, las_master_keycol[], las_detail_keycol[]
string			ls_masterkeycol, ls_detailkeycol, ls_dbname_parse[]
int				li_keycnt, li_idx
t_dw_mpl		ldw_master
c_string		lc_string

if vpo_dw.f_get_ib_detail() then
	ldw_master = vpo_dw.f_get_idw_master()			
	li_keycnt = vpo_dw.f_get_master_keycol(las_master_keycol[])
	li_keycnt = vpo_dw.f_get_detail_keycol(las_detail_keycol[])

	FOR li_idx = 1 to li_keycnt
		//-- master  key --//
		ls_masterkeycol = las_master_keycol[li_idx]
		this.f_get_build_column(ldw_master , ls_masterkeycol, ls_coltype)
		//-- detail key --//
		ls_detailkeycol = las_detail_keycol[li_idx]
		this.f_get_build_column(vpo_dw , ls_detailkeycol, ls_coltype)	
		if ls_where <> '' then ls_where += ' AND '
		ls_where = ls_detailkeycol + ' = ' +  ls_masterkeycol
		if li_idx = 1 then lc_string.f_stringtoarray( ls_detailkeycol,'.', ls_dbname_parse[])
	NEXT

	ls_detail_table = vpo_dw.describe( "DataWindow.Table.UpdateTable")
	if ls_dbname_parse[1] <> ls_detail_table then ls_detail_table += ' '+ls_dbname_parse[1] 
	ls_where = ' Exists (SELECT null FROM '+ls_detail_table + ' WHERE '+ls_where+ ' AND ' + vs_detailwhere +')'		

	if ldw_master.f_get_ib_detail( ) then
		ls_where = this.f_buildwhereclause_4_dwmain( ldw_master, ls_where)
		return ls_where
	else
		return ls_where
	end if
else
	return vs_detailwhere
end if

end function

public function integer f_buildwhereclause_of_relation (ref s_object_display rpo_handle, ref s_str_dwo_related rstr_data_related[]);
string				ls_where, las_column[], ls_colType, ls_dbname, ls_related_dwo, ls_match_data
int					li_col, li_colCount, li_idx 
c_string			lc_string
window			lw_display
datawindow		ldw_handle

lw_display = rpo_handle.f_get_wdisplay()
FOR li_idx = 1 to upperbound(rstr_data_related[])
	if upperbound(rstr_data_related[li_idx].s_data[]) > 0 then
		ls_related_dwo = rstr_data_related[li_idx].s_related_obj_dwo
		if rpo_handle.classname() = 'b_view' and rstr_data_related[li_idx].s_related_obj_replace_dwo <> '' then
			ldw_handle = lw_display.dynamic f_get_dw(rstr_data_related[li_idx].s_related_obj_replace_dwo)
		else
			ldw_handle = lw_display.dynamic f_get_dw(ls_related_dwo)
		end if
		if isnull(ldw_handle) then
			gf_messagebox('m.c_dwservice.f_buildwhereclause_of_relation.01','Thông báo','Không tìm thấy dwo đối tượng liên quan:@'+ls_related_dwo,'stop','ok',1)
			return -1
		end if
		li_colCount = lc_string.f_stringtoarray(rstr_data_related[li_idx].s_related_obj_column ,';', las_column[])		
		if li_colCount = 0 or isnull(li_colCount) then
			rstr_data_related[li_idx].s_where =''
			return 0
		end if
		if rstr_data_related[li_idx].b_f_matching then // matching
			ls_dbname = las_column[1]
			if pos(ls_dbname, '|') = 0 then
				if this.f_get_build_column(ldw_handle , ls_dbname, ls_coltype) = -1 then
					return -1
				end if	
			else
				ls_coltype = ls_dbname
				ls_dbname = lc_string.f_gettoken( ls_coltype, '|')
			end if							
			if rstr_data_related[li_idx].s_match_table = '' then			
//				ls_match_data =  lc_string.f_get_expression( rstr_data_related[li_idx].s_data[1], 'number', 'MATCHING.F_REF_ID', 'build where')
//				ls_where = ' EXISTS (select MATCHING.T_REF_ID from MATCHING where MATCHING.T_REF_ID = ' + ls_dbname +&
//																									   ' AND ' + ls_match_data +')'
				
				ls_match_data =  lc_string.f_get_expression( rstr_data_related[li_idx].s_data[1], 'number', 'MATCHING.F_DOC_ID', 'build where')
				ls_where = ' EXISTS (select MATCHING.T_DOC_ID from MATCHING where MATCHING.T_DOC_ID = ' + ls_dbname +&
																									   ' AND ' + ls_match_data +')'
			else				
				ls_match_data =  lc_string.f_get_expression( rstr_data_related[li_idx].s_data[1], 'number', rstr_data_related[li_idx].s_match_table + '.' +  rstr_data_related[li_idx].s_match_column[1], 'build where')
				ls_where = ' EXISTS (select null from '+ rstr_data_related[li_idx].s_match_table + &
								' where ' + rstr_data_related[li_idx].s_match_table + '.' + rstr_data_related[li_idx].s_match_column[2] + ' = ' + ls_dbname +&
								' AND ' + ls_match_data +')'				
			end if
			rstr_data_related[li_idx].s_where = this.f_buildwhereclause_4_dwmain(ldw_handle , ls_where)
			//-- reset biến --//
			ls_where = ''				
		elseif rstr_data_related[li_idx].b_t_matching	then // matching
			ls_dbname =  las_column[1]
			if pos(ls_dbname, '|') = 0 then
				if this.f_get_build_column(ldw_handle , ls_dbname, ls_coltype) = -1 then
					return -1
				end if	
			else
				ls_coltype = ls_dbname
				ls_dbname = lc_string.f_gettoken( ls_coltype, '|')
			end if			
		
			if rstr_data_related[li_idx].s_match_table = '' then
//				ls_match_data =  lc_string.f_get_expression( rstr_data_related[li_idx].s_data[1], 'number', 'MATCHING.T_REF_ID', 'build where')
//				ls_where = ' EXISTS (select MATCHING.F_REF_ID from MATCHING where MATCHING.F_REF_ID = ' + ls_dbname +&
//																			 							' AND  ' +ls_match_data +')'	
				ls_match_data =  lc_string.f_get_expression( rstr_data_related[li_idx].s_data[1], 'number', 'MATCHING.T_DOC_ID', 'build where')
				ls_where = ' EXISTS (select MATCHING.F_DOC_ID from MATCHING where MATCHING.F_DOC_ID = ' + ls_dbname +&
																									   ' AND ' + ls_match_data +')'
			else
				ls_match_data =  lc_string.f_get_expression( rstr_data_related[li_idx].s_data[1], 'number', rstr_data_related[li_idx].s_match_table + '.' +  rstr_data_related[li_idx].s_match_column[1], 'build where')
				ls_where = ' EXISTS (select null from '+ rstr_data_related[li_idx].s_match_table + &
								' where ' + rstr_data_related[li_idx].s_match_table + '.' + rstr_data_related[li_idx].s_match_column[2] + ' = ' + ls_dbname +&
								' AND ' + ls_match_data +')'								
			end if
			rstr_data_related[li_idx].s_where = this.f_buildwhereclause_4_dwmain(ldw_handle , ls_where)
			//-- reset biến --//
			ls_where = ''				
		else
			FOR li_col = 1 to li_colCount
				if ls_where <> '' then ls_where += ' AND '
				ls_dbname = las_column[li_col]
				if pos(ls_dbname, '|') = 0 then
					if this.f_get_build_column(ldw_handle , ls_dbname, ls_coltype) = -1 then
						return -1
					end if
				else
					ls_coltype = ls_dbname
					ls_dbname = lc_string.f_gettoken( ls_coltype, '|')
				end if
				//-- Add criteria to WHERE Clause --//
				ls_where += lc_string.f_get_expression( rstr_data_related[li_idx].s_data[li_col], ls_coltype, ls_dbname, 'build where')
			NEXT		
			rstr_data_related[li_idx].s_where += this.f_buildwhereclause_4_dwmain(ldw_handle , ls_where)
			//-- reset biến --//
			ls_where = ''			
		end if
	else
		if rpo_handle.classname() = 'u_valueset' then continue //-- valueset có cài điều kiên phụ thuộc theo user or role --//
		rstr_data_related[li_idx].s_where ='1=0' //-- khi không có dữ liệu liên quan thì không hiện dữ liệu của đối tượng liên quan --//
		return 1		
	end if
NEXT
return upperbound(rstr_data_related[])


end function

public function integer f_buildwhereclause_of_relation (ref powerobject rpo_dw, ref s_str_dwo_related rstr_data_related[]);
string				ls_where, las_column[], ls_colType, ls_dbname, ls_related_dwo
int					li_col, li_colCount, li_idx 
c_string			lc_string

FOR li_idx = 1 to upperbound(rstr_data_related[])
	if upperbound(rstr_data_related[li_idx].s_data[]) > 0 then
		ls_related_dwo = rstr_data_related[li_idx].s_related_obj_dwo
		li_colCount = lc_string.f_stringtoarray(rstr_data_related[li_idx].s_related_obj_column ,';', las_column[])		
		
		FOR li_col = 1 to li_colCount
			if ls_where <> '' then ls_where += ' AND '
			ls_dbname = las_column[li_col]
			if pos(ls_dbname, '|') = 0 then
				if this.f_get_build_column(rpo_dw , ls_dbname, ls_coltype) = -1 then
					return -1
				end if	
			else
				ls_coltype = ls_dbname
				ls_dbname = lc_string.f_gettoken( ls_coltype, '|')
			end if						
			
			//-- Add criteria to WHERE Clause --//
			ls_where += lc_string.f_get_expression( rstr_data_related[li_idx].s_data[li_col], ls_coltype, ls_dbname, 'build where')
		NEXT						
		rstr_data_related[li_idx].s_where = ls_where
		//-- reset biến --//
		ls_where = ''
	else
		if rstr_data_related[li_idx].s_related_obj_name = 'u_valueset' then
			rstr_data_related[li_idx].s_where = '1 = 1'
		end if
	end if
NEXT
return upperbound(rstr_data_related[])
return 0

end function

public function string f_get_dataobject (powerobject vpo_handle);string	 ls_dataobject
datawindow	ldw_handle
datastore		lds_handle

if vpo_handle.typeof() = datawindow! then
	ldw_handle = vpo_handle
	ls_dataobject = ldw_handle.dataobject
elseif vpo_handle.typeof() = datastore! then
	lds_handle = vpo_handle
	ls_dataobject = lds_handle.dataobject
end if
return ls_dataobject
end function

public function integer f_update_resize_parm (ref s_object_display rod_handle);long			ll_row
window		lw_display
t_t				l_tab

lw_display = rod_handle.f_get_wdisplay()

ll_row = rod_handle.ids_user_profile.find("USER_ID = "+string(gi_userid) +" AND isnull(dwobject) AND dwcontrol = 'ii_upperpart_height'",1,rod_handle.ids_user_profile.rowcount())
if ll_row > 0 then
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq',lw_display.dynamic f_get_ii_upperpart_height() )
else
	ll_row = rod_handle.ids_user_profile.insertrow(0)
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', lw_display.dynamic f_get_ii_upperpart_height() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_upperpart_height' )	
	rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )	
end if

ll_row = rod_handle.ids_user_profile.find("USER_ID = "+string(gi_userid) +" AND isnull(dwobject)  AND dwcontrol = 'ii_leftpart_width'",1,rod_handle.ids_user_profile.rowcount())
if ll_row > 0 then
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq',lw_display.dynamic f_get_ii_leftpart_width() )
else
	ll_row = rod_handle.ids_user_profile.insertrow(0)
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', lw_display.dynamic f_get_ii_leftpart_width() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_leftpart_width' )
	rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )
end if

ll_row = rod_handle.ids_user_profile.find("USER_ID = "+string(gi_userid) +" AND isnull(dwobject)  AND dwcontrol = 'ii_midpart_width'",1,rod_handle.ids_user_profile.rowcount())
if ll_row > 0 then
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq',lw_display.dynamic f_get_ii_midpart_width() )
else
	ll_row = rod_handle.ids_user_profile.insertrow(0)
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', lw_display.dynamic f_get_ii_midpart_width() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_midpart_width' )
	rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )
end if

ll_row = rod_handle.ids_user_profile.find("USER_ID = "+string(gi_userid) + " AND isnull(dwobject)  AND dwcontrol = 'ii_gb_11_width'",1,rod_handle.ids_user_profile.rowcount())
if ll_row > 0 then
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq',lw_display.dynamic f_get_ii_gb_11_width() )
else
	ll_row = rod_handle.ids_user_profile.insertrow(0)
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', lw_display.dynamic f_get_ii_gb_11_width() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_gb_11_width' )
	rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )
end if

ll_row = rod_handle.ids_user_profile.find("USER_ID = "+string(gi_userid) +" AND isnull(dwobject)  AND dwcontrol = 'ii_fixedpart1_height'",1,rod_handle.ids_user_profile.rowcount())
if ll_row > 0 then
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq',lw_display.dynamic f_get_ii_fixedpart1_height() )
else
	ll_row = rod_handle.ids_user_profile.insertrow(0)
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', lw_display.dynamic f_get_ii_fixedpart1_height() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_fixedpart1_height' )
	rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )
end if

ll_row = rod_handle.ids_user_profile.find("USER_ID = "+string(gi_userid) + " AND isnull(dwobject)  AND dwcontrol = 'ii_fixedpart2_height'",1,rod_handle.ids_user_profile.rowcount())
if ll_row > 0 then
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq',lw_display.dynamic f_get_ii_fixedpart2_height() )
else
	ll_row = rod_handle.ids_user_profile.insertrow(0)
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', lw_display.dynamic f_get_ii_fixedpart2_height() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_fixedpart2_height' )
	rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )
end if

ll_row = rod_handle.ids_user_profile.find("USER_ID = "+string(gi_userid) + " AND isnull(dwobject)  AND dwcontrol = 'ii_fixedpart3_height'",1,rod_handle.ids_user_profile.rowcount())
if ll_row > 0 then
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq',lw_display.dynamic f_get_ii_fixedpart3_height() )
else
	ll_row = rod_handle.ids_user_profile.insertrow(0)
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', lw_display.dynamic f_get_ii_fixedpart3_height() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_fixedpart3_height' )
	rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )
end if

ll_row = rod_handle.ids_user_profile.find("USER_ID = "+string(gi_userid) +" AND isnull(dwobject)  AND dwcontrol = 'ii_gb_3_height'",1,rod_handle.ids_user_profile.rowcount())
if ll_row > 0 then
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq',lw_display.dynamic f_get_ii_gb_3_height() )
else
	ll_row = rod_handle.ids_user_profile.insertrow(0)
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', lw_display.dynamic f_get_ii_gb_3_height() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_gb_3_height' )	
	rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )
end if

ll_row = rod_handle.ids_user_profile.find("USER_ID = "+string(gi_userid) +" AND isnull(dwobject)  AND dwcontrol = 'ii_gb_4_height'",1,rod_handle.ids_user_profile.rowcount())
if ll_row > 0 then
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq',lw_display.dynamic f_get_ii_gb_4_height() )
else
	ll_row = rod_handle.ids_user_profile.insertrow(0)
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', lw_display.dynamic f_get_ii_gb_4_height() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_gb_4_height' )
	rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )
end if

ll_row = rod_handle.ids_user_profile.find("USER_ID = "+string(gi_userid) + " AND isnull(dwobject)  AND dwcontrol = 'ii_gb_5_height'",1,rod_handle.ids_user_profile.rowcount())
if ll_row > 0 then
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', lw_display.dynamic f_get_ii_gb_5_height() )
else
	ll_row = rod_handle.ids_user_profile.insertrow(0)
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', lw_display.dynamic f_get_ii_gb_5_height() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_gb_5_height' )	
	rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )
end if

//-- update tabpage parm --//
l_tab = lw_display.dynamic f_get_tab_1()
if isvalid(l_tab) then
	this.f_update_tabpage_resize_parm( rod_handle, l_tab)
end if

if rod_handle.ids_user_profile.update(true,false ) = 1 then
	commit using sqlca;	
	return rod_handle.ids_user_profile.resetupdate()
else
	rollback using sqlca;
	messagebox('Lỗi','Không cập nhật được resize parm')
	return -1
end if

end function

public function string f_buildwhere_rec_security (powerobject vdw_record, string vs_dwo, string vs_object_name);t_s_querymode_criteria	lstr_qr_criteria[]
s_str_criteria_rec			lstr_criteria_rec[],lstr_criteria_rec_build[],lstr_criteria_rec_or,lstr_criteria_rec_empty
c_dw_querymode			lc_querymode
s_w_main					lw_display
t_dw_mpl					ldw_requestor,ldw_master,ldw_master_rc
b_rule						lc_rule
c_string						lc_string
boolean						lb_full = false
double						ldb_rule_id[],ldb_rule_id_deligate[]
string							ls_each_where,ls_total_where,ls_object_name,ls_where,ls_each_where_1
int								li_idx,li_count,li_idx2,li_rtn,li_idx3

if vdw_record.typeof() = datawindow! then
	vdw_record.dynamic f_getparentwindow(lw_display)
elseif vdw_record.typeof() = datawindowchild! then
	lw_display = vdw_record.dynamic getparent( )
end if
li_rtn = lc_rule.f_get_appli_rule_id( ldb_rule_id, gi_userid, vs_dwo,'record',vs_object_name)
if li_rtn > 0 then 
	if lc_rule.f_get_appli_deligate_rule_id( ldb_rule_id_deligate, gi_userid, vs_dwo,'record',vs_object_name) > 0 then
		for li_idx = 1 to upperbound(ldb_rule_id_deligate)
			ldb_rule_id[upperbound(ldb_rule_id)+1] = ldb_rule_id_deligate[li_idx]
		next
	end if
	for li_idx = 1 to upperbound(ldb_rule_id)
		this.f_build_rec_criteria( ldb_rule_id[li_idx], lstr_criteria_rec_build)
	next
end if

li_count = upperbound(lstr_criteria_rec_build)
if li_count > 0 then
	ldw_requestor = lw_display.f_get_dw(vdw_record.dynamic f_get_dataobject() )
	ldw_master_rc = ldw_requestor.f_getdwmaster( )
	lc_querymode = ldw_master_rc.inv_querymode
	for li_idx=1 to li_count
		//-- Trường hợp nếu 2 quyền có phân quyền trên cùng 1 dw chỉ khác cột --//
		if li_idx > 1 then
			for li_idx2 = 1 to upperbound(lstr_criteria_rec_build[li_idx].s_dwobject)
				lstr_criteria_rec_or = lstr_criteria_rec_empty
				for li_idx3 = 1 to upperbound(lstr_criteria_rec_build[li_idx - 1].s_dwobject)
					if lstr_criteria_rec_build[li_idx].s_dwobject[li_idx2] = lstr_criteria_rec_build[li_idx - 1].s_dwobject[li_idx3] then
						lstr_criteria_rec_or.s_criteria_rec[upperbound(lstr_criteria_rec_or.s_criteria_rec) + 1] =lstr_criteria_rec_build[li_idx - 1].s_criteria_rec[li_idx3]
						lstr_criteria_rec_or.s_dwcolumn_rec[upperbound(lstr_criteria_rec_or.s_dwcolumn_rec) + 1] =lstr_criteria_rec_build[li_idx - 1].s_dwcolumn_rec[li_idx3]
						lstr_criteria_rec_or.s_dwobject[upperbound(lstr_criteria_rec_or.s_dwobject) + 1] =lstr_criteria_rec_build[li_idx - 1].s_dwobject[li_idx3]
					end if
				next
				if upperbound(lstr_criteria_rec_or.s_dwobject) > 0 then
					lstr_criteria_rec_or.s_criteria_rec[upperbound(lstr_criteria_rec_or.s_criteria_rec) + 1] =lstr_criteria_rec_build[li_idx ].s_criteria_rec[li_idx2]
					lstr_criteria_rec_or.s_dwcolumn_rec[upperbound(lstr_criteria_rec_or.s_dwcolumn_rec) + 1] =lstr_criteria_rec_build[li_idx].s_dwcolumn_rec[li_idx2]
					lstr_criteria_rec_or.s_dwobject[upperbound(lstr_criteria_rec_or.s_dwobject) + 1] =lstr_criteria_rec_build[li_idx ].s_dwobject[li_idx2]
					for  li_idx3 = 1 to upperbound(lstr_criteria_rec_or.s_criteria_rec)
						if li_idx3 = 1 then ldw_requestor = lw_display.f_get_dw(lstr_criteria_rec_or.s_dwobject[li_idx3] + '_grid' )
						if isvalid(ldw_requestor) then
							ldw_master = ldw_requestor.f_getdwmaster( )
							if li_idx3=1 then
								ldw_master.inv_querymode.ib_rec = true
								ldw_requestor.event e_query( )
							end if
							ldw_requestor.inv_querymode.event e_itemchanged(ldw_requestor.getrow( ), lstr_criteria_rec_or.s_dwcolumn_rec[li_idx3], lstr_criteria_rec_or.s_criteria_rec[li_idx3])
							ldw_requestor.inv_querymode.f_getquerycriterias(lstr_qr_criteria)
							lstr_qr_criteria[upperbound(lstr_qr_criteria)].is_expression = ' OR '
							ldw_requestor.inv_querymode.f_setquerycriteria(lstr_qr_criteria)
							if li_idx3 = upperbound(lstr_criteria_rec_build[li_idx].s_criteria_rec ) then ldw_requestor.event e_execquery( )
//							ldw_requestor.inv_querymode.f_querymode( false)
							ls_where = 'RECORD'
						end if
					next
					ldw_requestor.inv_querymode.f_querymode( false)
					ls_total_where = trim(lc_string.f_globalreplace( ls_total_where, ls_each_where_1 , ' '))
				end if
			next
		end if
		if ls_total_where <> '' and len(ls_total_where) > 0 then 
			if ls_each_where_1 <> '' then 
				if upperbound(lstr_criteria_rec_build)> 1 then
					ls_total_where += ' OR '
				else
					ls_total_where += ' AND '
				end if
			else
				ls_total_where += ' OR '
			end if
		end if
		ls_each_where_1 = ''
		if upperbound(lstr_criteria_rec_or.s_dwobject) = 0 then
			for li_idx2=1 to upperbound(lstr_criteria_rec_build[li_idx].s_criteria_rec )
				if lstr_criteria_rec_build[li_idx].s_dwcolumn_rec[li_idx2]  = 'full.full' then
					lb_full = true
					exit
				end if
				if ls_each_where <> '' then ls_each_where += ' AND '
				if pos(vs_dwo,lstr_criteria_rec_build[li_idx].s_dwobject[li_idx2]) > 0 then
					ls_each_where += this.f_buildwhereclause( vdw_record, lstr_criteria_rec_build[li_idx].s_dwcolumn_rec[li_idx2], lstr_criteria_rec_build[li_idx].s_criteria_rec[li_idx2])
				else
					if ls_where <>  'RECORD' then
						ldw_requestor = lw_display.f_get_dw(lstr_criteria_rec_build[li_idx].s_dwobject[li_idx2] + '_grid' )
						if isvalid(ldw_requestor) then
							ldw_master = ldw_requestor.f_getdwmaster( )
							if li_idx2=1 then
								ldw_master.inv_querymode.ib_rec = true
								ldw_requestor.event e_query( )
							end if
							ldw_requestor.inv_querymode.event e_itemchanged(ldw_requestor.getrow( ), lstr_criteria_rec_build[li_idx].s_dwcolumn_rec[li_idx2], lstr_criteria_rec_build[li_idx].s_criteria_rec[li_idx2])
							if li_idx2 = upperbound(lstr_criteria_rec_build[li_idx].s_criteria_rec ) then ldw_requestor.event e_execquery( )
							ls_where = 'RECORD'
						end if
					end if
				end if
			next
			if lb_full then 
				ls_total_where = ''
				exit
			end if
		end if
		if ls_where = 'RECORD' then
			ldw_master_rc.inv_querymode.ib_rec = true
			ldw_requestor.event e_execquery( )
			ls_each_where_1 = ldw_master_rc.inv_querymode.f_getquerywhereclause( )
			ls_where = ldw_master.describe( "Datawindow.Table.Select")
		end if
		if ls_each_where_1 <> '' and ls_each_where <> ''  then
			ls_each_where_1 =' AND ' + ls_each_where_1 
			ls_total_where += '(' + ls_each_where + ')' + ls_each_where_1
		elseif ls_each_where_1 <> '' then
			ls_total_where += ls_each_where_1 
		else
			ls_total_where += '(' + ls_each_where + ')'
		end if
		ls_each_where = ''
	next
	if vdw_record.typeof() = datawindow! then
		//--lưu các rule_id của user --//
		vdw_record.dynamic f_set_rule_id_rec(ldb_rule_id)
		//--lưu struct buildwhere record--//
		if vdw_record.dynamic f_get_criteria_record( lstr_criteria_rec) = 0 then
			vdw_record.dynamic f_set_criteria_record(lstr_criteria_rec_build )
		end if
	end if
	ldw_master_rc.inv_querymode = lc_querymode
end if
return ls_total_where
end function

public function boolean f_is_lang_dwc (datawindowchild vdwc_handle);
string		ls_coltype


ls_coltype = vdwc_handle.Describe ("lang.coltype" )
if ls_coltype = '!' then 
	return false
else
	return true
end if
end function

public function integer f_add_where_dwc (datawindowchild vdwc_handle, string vs_columns, any vaa_value[]);string					ls_currentSQL, ls_currentWhere, ls_rtn, las_columns[], ls_colType, ls_modify, ls_dbname
int						li_colCount, li_idx
c_dwservice			lc_dwservice
c_sql					lc_sql
c_string				lc_string

if this.f_getcurrentsql(vdwc_handle , ls_currentSQL, ls_currentWhere) = 1 then
	li_colCount = lc_string.f_stringtoarray( vs_columns,';', las_columns[])
	FOR li_idx =1 to li_colCount
		ls_dbname =  las_columns[li_idx]
		if lc_dwservice.f_get_build_column( vdwc_handle,ls_dbname, ls_colType) = -1 then
			return -1			
		end if

		if ls_currentWhere <> '' then ls_currentWhere += ' AND '
		ls_currentWhere += lc_string.f_get_expression( string(vaa_value[li_idx] ), ls_colType, ls_dbname, 'build where')		
	NEXT

	lc_sql.f_addtowhereclause( ls_currentSQL, ls_currentWhere, " AND ")
	ls_modify = "Datawindow.Table.Select= '" + ls_currentSQL +"'"
	ls_rtn =vdwc_handle.modify(ls_modify )
	if ls_rtn <> '' then
		gf_messagebox('m.t_dw.f_add_where.01','Thông báo','Lỗi c_dwservice.f_add_where_dwc: line 29', 'exclamation','ok',1)
		return -1
	end if
end if		
	
return 1
end function

private function integer f_update_tabpage_resize_parm (ref s_object_display rod_handle, ref t_t rt_tab);long			ll_row
int				li_idx
s_tp_multi	ltp_multi

FOR li_idx = 1 to upperbound(rt_tab.control[])
	ltp_multi = rt_tab.control[li_idx]
	
	ll_row = rod_handle.ids_user_profile.find("user_id ="+ string(gi_userid)+ " AND dwobject= 'tabpage_"+string(li_idx) +"' AND dwcontrol = 'ii_upperpart_height'",1,rod_handle.ids_user_profile.rowcount())
	if ll_row > 0 then
		rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', ltp_multi.ii_upperpart_height )
	else
		ll_row = rod_handle.ids_user_profile.insertrow(0)
		rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', ltp_multi.ii_upperpart_height)	
		rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
		rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_upperpart_height' )	
		rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )	
		rod_handle.ids_user_profile.setitem(ll_row, 'dwobject', 'tabpage_'+string(li_idx) )	
	end if
	
	ll_row = rod_handle.ids_user_profile.find("user_id ="+ string(gi_userid)+  " AND dwobject= 'tabpage_"+string(li_idx) +"' AND dwcontrol = 'ii_leftpart_width'",1,rod_handle.ids_user_profile.rowcount())
	if ll_row > 0 then
		rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', ltp_multi.ii_leftpart_width )
	else
		ll_row = rod_handle.ids_user_profile.insertrow(0)
		rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', ltp_multi.ii_leftpart_width)	
		rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
		rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_leftpart_width' )	
		rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )	
		rod_handle.ids_user_profile.setitem(ll_row, 'dwobject', 'tabpage_'+string(li_idx) )	
	end if
	
	ll_row = rod_handle.ids_user_profile.find("user_id ="+ string(gi_userid)+  " AND dwobject= 'tabpage_"+string(li_idx) +"' AND dwcontrol = 'ii_midpart_width'",1,rod_handle.ids_user_profile.rowcount())
	if ll_row > 0 then
		rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', ltp_multi.ii_midpart_width )
	else
		ll_row = rod_handle.ids_user_profile.insertrow(0)
		rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', ltp_multi.ii_midpart_width)	
		rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
		rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_midpart_width' )	
		rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )	
		rod_handle.ids_user_profile.setitem(ll_row, 'dwobject', 'tabpage_'+string(li_idx) )	
	end if
	
	
	ll_row = rod_handle.ids_user_profile.find("user_id ="+ string(gi_userid)+ " AND dwobject= 'tabpage_"+string(li_idx) +"' AND dwcontrol = 'ii_fixedpart1_height'",1,rod_handle.ids_user_profile.rowcount())
	if ll_row > 0 then
		rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', ltp_multi.ii_fixedpart1_height )
	else
		ll_row = rod_handle.ids_user_profile.insertrow(0)
		rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', ltp_multi.ii_fixedpart1_height)	
		rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
		rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_fixedpart1_height' )	
		rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )	
		rod_handle.ids_user_profile.setitem(ll_row, 'dwobject', 'tabpage_'+string(li_idx) )	
	end if
	
	ll_row = rod_handle.ids_user_profile.find("user_id ="+ string(gi_userid)+  " AND dwobject= 'tabpage_"+string(li_idx) +"' AND dwcontrol = 'ii_fixedpart2_height'",1,rod_handle.ids_user_profile.rowcount())
	if ll_row > 0 then
		rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', ltp_multi.ii_fixedpart2_height )
	else
		ll_row = rod_handle.ids_user_profile.insertrow(0)
		rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', ltp_multi.ii_fixedpart2_height)	
		rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
		rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_fixedpart2_height' )	
		rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )	
		rod_handle.ids_user_profile.setitem(ll_row, 'dwobject', 'tabpage_'+string(li_idx) )	
	end if
	
	ll_row = rod_handle.ids_user_profile.find("user_id ="+ string(gi_userid)+  " AND dwobject= 'tabpage_"+string(li_idx) +"' AND dwcontrol = 'ii_gb_3_height'",1,rod_handle.ids_user_profile.rowcount())
	if ll_row > 0 then
		rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', ltp_multi.ii_gb_3_height )
	else
		ll_row = rod_handle.ids_user_profile.insertrow(0)
		rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', ltp_multi.ii_gb_3_height)	
		rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
		rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_gb_3_height' )	
		rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )	
		rod_handle.ids_user_profile.setitem(ll_row, 'dwobject', 'tabpage_'+string(li_idx) )	
	end if
	
	ll_row = rod_handle.ids_user_profile.find("user_id ="+ string(gi_userid)+ " AND dwobject= 'tabpage_"+string(li_idx) +"' AND dwcontrol = 'ii_gb_4_height'",1,rod_handle.ids_user_profile.rowcount())
	if ll_row > 0 then
		rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', ltp_multi.ii_gb_4_height )
	else
		ll_row = rod_handle.ids_user_profile.insertrow(0)
		rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', ltp_multi.ii_gb_4_height)	
		rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
		rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_gb_4_height' )	
		rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )	
		rod_handle.ids_user_profile.setitem(ll_row, 'dwobject', 'tabpage_'+string(li_idx) )	
	end if
	
	ll_row = rod_handle.ids_user_profile.find("user_id ="+ string(gi_userid)+  " AND dwobject= 'tabpage_"+string(li_idx) +"' AND dwcontrol = 'ii_gb_5_height'",1,rod_handle.ids_user_profile.rowcount())
	if ll_row > 0 then
		rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', ltp_multi.ii_gb_5_height )
	else
		ll_row = rod_handle.ids_user_profile.insertrow(0)
		rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', ltp_multi.ii_gb_5_height)	
		rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
		rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_gb_5_height' )	
		rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )	
		rod_handle.ids_user_profile.setitem(ll_row, 'dwobject', 'tabpage_'+string(li_idx) )	
	end if

NEXT
return 1

end function

public function integer f_copy_f_t (powerobject vpo_copied_from, ref powerobject rpo_copied_to);return this.f_copy_f_t( vpo_copied_from,rpo_copied_to , 1, vpo_copied_from.dynamic rowcount())

end function

public function integer f_copy_f_t (powerobject vpo_copied_from, ref powerobject rpo_copied_to, long vl_start, long vl_end);/***********************************
Copy từ đố tượng nguồn đến đối tượng đích
nếu vl_start, vl_end =0 thì sẽ copy những dòng đã tích chọn 
return -1 lỗi,ref rpo_copied_to is null
		  1 ok
***********************************/
long				ll_find,ll_rtn

if vpo_copied_from.dynamic rowcount() = 0 then return 0
if vl_start + vl_end = 0 then
	Do 
		ll_find++
		ll_find = vpo_copied_from.dynamic find( "gutter = 'Y'",ll_find , vpo_copied_from.dynamic rowcount( ) +1 )
		if ll_find > 0 then
			ll_rtn = vpo_copied_from.dynamic rowscopy( ll_find , ll_find, Primary!, rpo_copied_to, rpo_copied_to.dynamic rowcount() + 1, Primary!)
			if ll_rtn = -1 or isnull(ll_rtn) then
				//không copy được
				setnull(rpo_copied_to)
				gf_messagebox('m.c_dwservice.f_copy_f_t.01','Thông báo','c_dwservice.f_copy_f_t(line:19)','stop','ok',1)
				return -1
			end if
		end if
	Loop While ll_find > 0
	
else
	ll_rtn = vpo_copied_from.dynamic rowscopy( vl_start , vl_end, Primary!, rpo_copied_to, rpo_copied_to.dynamic rowcount() + 1, Primary!)
	if ll_rtn = -1 or isnull(ll_rtn) then
		//không copy được
		setnull(rpo_copied_to)
		gf_messagebox('m.c_dwservice.f_copy_f_t.02','Thông báo','c_dwservice.f_copy_f_t(line:29)','stop','ok',1)
		return -1
	end if
end if
return 1
end function

public function string f_find_obj_ref_id (powerobject vpo_copied);/*********************************************
Tìm object_ref_id để filter lại cho đúng theo từng master
return chuỗi object ref id
**********************************************/

long				ll_find
string				ls_obj_ref_id,ls_find,ls_sort

ls_sort = vpo_copied.dynamic describe("Datawindow.table.sort")
vpo_copied.dynamic setsort( 'object_ref_id a')
vpo_copied.dynamic sort()
ll_find ++
Do 
	if vpo_copied.dynamic rowcount() = 0 or vpo_copied.dynamic rowcount() < ll_find then exit
	ls_obj_ref_id = string(vpo_copied.dynamic getitemnumber(ll_find,'object_ref_id'))
	ll_find = vpo_copied.dynamic find('object_ref_id <> '+ls_obj_ref_id,ll_find,vpo_copied.dynamic rowcount() + 1)
	if ll_find > 0 then
		ls_find +=ls_obj_ref_id + ';'
	else
		ls_find +=ls_obj_ref_id
	end if
Loop While ll_find > 0
if ls_sort <> '?' then
	vpo_copied.dynamic setsort( ls_sort)
	vpo_copied.dynamic sort()
end if
return ls_find
end function

public function integer f_insert_matching (t_ds_db vpo_source[], s_str_dwo_related vstr_related[], s_object_display vpo_handle);t_transaction		lt_transaction
t_dw_mpl			ldw_related_copy,ldw_master,ldw_main
t_ds_db				lds_matching
c_string				lc_string
s_w_main			lw_related
t_ds_db				lds_post_line
double				ldb_ID,ldb_T_REF_ID,ldb_obj_id
string					ls_original_filter,las_match_column[],las_match_f_column[],las_match_t_column[],ls_update_table
decimal				ldc_sum,ldc_tax
long					ll_row,ll_rtn,ll_count,ll_row_dw_related
int 					li_idx,li_idx1,li_idx2,li_idx3,li_idx4,li_count_main_copy


for li_idx = 1 to upperbound(vstr_related)
	li_count_main_copy = upperbound(vstr_related[li_idx].s_match_f_dwo)
	if li_count_main_copy > 0 and vstr_related[li_idx].b_f_matching then
		if vstr_related[li_idx].s_related_obj_name = vpo_handle.classname() then
			lw_related = vpo_handle.f_get_wdisplay()
			lw_related.f_get_transaction( lt_transaction)
			lds_matching = create t_ds_db
			lds_matching.dataobject = 'ds_matching'
			lds_matching.f_settransobject( lt_transaction)		
			ldw_main = lw_related.f_get_dwmain( )
			for li_idx1 = 1 to li_count_main_copy
				if vstr_related[li_idx].s_match_f_dwo[li_idx1] = vpo_source[li_idx1].dataobject then		
					ldw_related_copy = lw_related.f_get_dw(vstr_related[li_idx].s_match_t_dwo[li_idx1] ) 
					ldw_master = ldw_related_copy.f_get_idw_master( )			
					if not isvalid(ldw_master) then exit
					lc_string.f_stringtoarray( vstr_related[li_idx].s_match_column[li_idx1], ';', las_match_column[])
					lc_string.f_stringtoarray( vstr_related[li_idx].s_match_f_column[li_idx1], ';', las_match_f_column[])
					lc_string.f_stringtoarray( vstr_related[li_idx].s_match_t_column[li_idx1], ';', las_match_t_column[])					
					if ldw_master.dataobject <> ldw_main.dataobject then // là detail cấp 2 trở đi
						ls_original_filter = ldw_related_copy.describe( "DataWindow.Table.Filter")
						ldw_related_copy.setfilter( '')
						ldw_related_copy.filter( )
						vpo_source[li_idx1].setfilter('')
						vpo_source[li_idx1].filter()
					end if
//					if vstr_related[li_idx].b_f_sum[li_idx1] then
						ll_count = vpo_source[li_idx1].rowcount()
//					else
//						ll_count = ldw_related_copy.rowcount( )
//					end if
					for li_idx2 = 1 to ll_count
//					for li_idx2 = vpo_source[li_idx1].rowcount() to 1 step -1
						ll_row = lds_matching.event e_addrow( )
						ldb_ID	= vpo_handle.f_create_id( )
						if ldb_ID < 1 then 
							destroy lds_matching
							return -1
						end if
						lds_matching.setitem(ll_row, 'ID',ldb_ID)	
						lds_matching.setitem(ll_row, 'F_REF_ID', vpo_source[li_idx1].f_getitemany(li_idx2,'ID'))
						lds_matching.setitem(ll_row, 'F_REF_TABLE', upper(vpo_source[li_idx1].describe( "DataWindow.Table.UpdateTable")))
						if vstr_related[li_idx].b_f_sum[li_idx1] then
							lds_matching.setitem(ll_row, 'T_REF_ID', ldw_related_copy.f_getitemany(ldw_related_copy.getrow( ) ,'ID'))
							for li_idx3 = 1 to upperbound(las_match_column)
								ldb_obj_id = vpo_source[li_idx1].getitemnumber(li_idx2,'id')
								ldc_sum =vpo_source[li_idx1].f_getitemany(li_idx2,las_match_f_column[li_idx3])
								lds_matching.setitem( ll_row, las_match_column[li_idx3], ldc_sum)
							next
						else
//							if li_idx2 = vpo_source[li_idx1].rowcount() then 
//								ll_row_dw_related = ldw_related_copy.rowcount( )
//							else
								ll_row_dw_related = ldw_related_copy.rowcount( ) - vpo_source[li_idx1].rowcount() + li_idx2 
//							end if
							lds_matching.setitem(ll_row, 'T_REF_ID', ldw_related_copy.f_getitemany(ll_row_dw_related ,'ID'))
							for li_idx3 = 1 to upperbound(las_match_column)
								lds_matching.setitem( ll_row,las_match_column[li_idx3] ,vpo_source[li_idx1].f_getitemany(li_idx2,las_match_f_column[li_idx3]) )
							next
						end if
						lds_matching.setitem(ll_row, 'T_REF_TABLE', upper(ldw_related_copy.describe( "DataWindow.Table.UpdateTable")))
						
					next
					if ls_original_filter <> '?' then
						ldw_related_copy.setfilter(ls_original_filter)
						ldw_related_copy.filter( )
					end if
					
//					ll_rtn = lds_matching.update(true,false )
//					if ll_rtn = -1 then
//						rollback using lt_transaction;
//						messagebox('Lỗi','c_dwservice.f_insert_matching(line:58)')
//					else
//						lds_matching.resetupdate( )
//					end if
				end if
			next
		end if
	end if
next
if isvalid(lds_matching) then
	vpo_handle.dynamic f_set_ids_matching(lds_matching)
	destroy lds_matching
end if
return ll_rtn

end function

public function string f_get_object_code (double vdb_object_id);string		ls_object_code

select object.code into :ls_object_code from object where object.id = :vdb_object_id using SQLCA;
if sqlca.sqlcode = 0 then
	return ls_object_code
else
	return ''
end if
end function

public function integer f_insert_streamvalue (s_str_streamvalue vastr_streamvalue[], s_object_display vod_handling, string vs_qty_yn, string vs_value_yn);t_transaction	lt_transaction
s_w_multi		lw_display
t_dw_mpl		ldw_f_object,ldw_t_object,ldw_item,ldw_currency,ldw_value,ldw_master,ldw_item_lot,ldw_main
t_ds_db			lds_stream
c_string			lc_str
double			ldb_obj_ref_id,ldb_item_id,ldb_t_obj,ldb_f_obj
string				las_item_col[],las_item_col_sv[],las_f_obj_col[],las_f_obj_col_sv[],ls_filter_item
string				las_t_obj_col[],las_t_obj_col_sv[],las_cur_col[],las_cur_col_sv[],las_value_col[],las_value_col_sv[],ls_item_code
string				ls_lot_yn,ls_serial_y,las_item_lot_col[],las_item_lot_col_sv[],ls_filter_lot,ls_filter_cur,ls_filter_value
long				ll_row,ll_find
any				la_data
int					li_idx,li_idx2,li_idx3,li_idx4,li_rtn

lw_display = vod_handling.f_get_wdisplay( )
lw_display.f_get_transaction( lt_transaction)
lds_stream = create t_ds_db
lds_stream.dataobject = 'ds_streamvalue'
lds_stream.f_settransobject( lt_transaction)
for li_idx = 1 to upperbound(vastr_streamvalue)
	ldw_main = lw_display.f_get_dw(vod_handling.f_get_main_dwo( ))
	ldw_f_object = lw_display.f_get_dw(vastr_streamvalue[li_idx].s_f_obj_dwo)
	ldw_t_object = lw_display.f_get_dw(vastr_streamvalue[li_idx].s_t_obj_dwo)
	if vastr_streamvalue[li_idx].s_item_dwo <> 'none' then ldw_item = lw_display.f_get_dw(vastr_streamvalue[li_idx].s_item_dwo)
	if vastr_streamvalue[li_idx].s_item_lot_dwo <> '' then ldw_item_lot = lw_display.f_get_dw(vastr_streamvalue[li_idx].s_item_lot_dwo)
	if vastr_streamvalue[li_idx].s_currency_dwo <> '' then ldw_currency = lw_display.f_get_dw(vastr_streamvalue[li_idx].s_currency_dwo)
	if vastr_streamvalue[li_idx].s_value_dwo <> '' then ldw_value= lw_display.f_get_dw(vastr_streamvalue[li_idx].s_value_dwo)
	lc_str.f_stringtoarray( vastr_streamvalue[li_idx].s_item_column, ';', las_item_col)
	lc_str.f_stringtoarray( vastr_streamvalue[li_idx].s_item_column_sv, ';', las_item_col_sv)
	lc_str.f_stringtoarray( vastr_streamvalue[li_idx].s_item_lot_column, ';', las_item_lot_col)
	lc_str.f_stringtoarray( vastr_streamvalue[li_idx].s_item_lot_column_sv, ';', las_item_lot_col_sv)
	lc_str.f_stringtoarray( vastr_streamvalue[li_idx].s_f_obj_column, ';', las_f_obj_col)
	lc_str.f_stringtoarray( vastr_streamvalue[li_idx].s_f_column_sv, ';', las_f_obj_col_sv)
	lc_str.f_stringtoarray( vastr_streamvalue[li_idx].s_t_obj_column, ';', las_t_obj_col)
	lc_str.f_stringtoarray( vastr_streamvalue[li_idx].s_t_column_sv, ';', las_t_obj_col_sv)
	lc_str.f_stringtoarray( vastr_streamvalue[li_idx].s_currency_column, ';', las_cur_col)
	lc_str.f_stringtoarray( vastr_streamvalue[li_idx].s_currency_column_sv, ';', las_cur_col_sv)
	lc_str.f_stringtoarray( vastr_streamvalue[li_idx].s_value_column, ';', las_value_col)
	lc_str.f_stringtoarray( vastr_streamvalue[li_idx].s_value_column_sv, ';', las_value_col_sv)
	if upper(vs_qty_yn) = 'Y' and upper(vs_value_yn) = 'N' then
		//giữ lại filter gốc
//		ls_filter_item = ldw_item.describe( "Datawindow.Table.filter")
//		if ls_filter_item <> '?' then
//			ldw_item.setfilter( "")
//			ldw_item.filter()
//		end if
		//giữ lại filter gốc
//		if isvalid(ldw_item_lot) then 
//			ls_filter_lot = ldw_item_lot.describe( "Datawindow.Table.filter")
//			if ls_filter_lot <> '?' then
//				ldw_item_lot.setfilter( "")
//				ldw_item_lot.filter()
//			end if		
//		end if

		for li_idx2 = 1 to ldw_item.rowcount( )
			ldb_item_id=ldw_item.getitemnumber( li_idx2, las_item_col[1])
			if isnull(ldb_item_id) then
				gf_messagebox('m.c_dwservice.f_insert_stramvalue.02','Thông báo','Chưa nhập mã hàng hoặc tài khoản','exclamation','ok',1)
				li_rtn = -1
			else
				if upper(vod_handling.dynamic f_get_object_type(ldb_item_id))<>'ITEM' THEN continue
			end if ///					
			if isvalid(ldw_item_lot) then 
				ldb_item_id = ldw_item.getitemnumber( li_idx2, 'ID')
				this.f_get_lot_or_serial_yn(ldw_item.getitemnumber( li_idx2, 'ITEM_ID'), ls_lot_yn,ls_serial_y)
			end if
			
			ldw_master = ldw_item.f_get_idw_master( )
			
			ldb_obj_ref_id = ldw_item.getitemnumber(li_idx2, 'object_ref_id')
			ll_find = ldw_f_object.find( "id = "+string(ldb_obj_ref_id), 1, ldw_f_object.rowcount( ) )
			
			if ls_serial_y = 'Y' then
				//filter lại theo item id
				ldw_item_lot.setfilter( 'object_ref_id = '+string(ldb_item_id))
				ldw_item_lot.filter()
				if ldw_item_lot.rowcount( ) > 0 then
					for li_idx3 = 1 to ldw_item_lot.rowcount( )
						ll_row = lds_stream.event e_addrow( )
						if ll_row >0 then 
							li_rtn = this.f_update_streamvalue( ldw_item_lot, lds_stream, las_item_lot_col, las_item_lot_col_sv, '', li_idx3, ll_row)
							if li_rtn = 1 then li_rtn = this.f_update_streamvalue( ldw_item, lds_stream, las_item_col, las_item_col_sv, 'QTY', li_idx2, ll_row)
							if li_rtn = -1 then
								destroy lds_stream
								rollback using lt_transaction;
								return -1
							end if
						end if		
						if ldw_master.dataobject = ldw_f_object.dataobject then
							if ldw_f_object.rowcount( ) = 1  and ll_find > 0 then
								li_rtn = this.f_update_streamvalue( ldw_f_object, lds_stream, las_f_obj_col, las_f_obj_col_sv, '', ldw_f_object.getrow(), ll_row)
								if li_rtn = -1 then
									destroy lds_stream
									rollback using lt_transaction;
									return -1
								end if
							else // nhiều f_object
							end if
						elseif ldw_f_object.dataobject = ldw_item.dataobject then
							li_rtn = this.f_update_streamvalue(ldw_f_object, lds_stream,las_f_obj_col,las_f_obj_col_sv,'', li_idx2,ll_row)
							if li_rtn = -1 then
								destroy lds_stream
								rollback using lt_transaction;
								return -1
							end if
						else // tìm lên master
						end if
						
						if ldw_t_object.dataobject = ldw_item.dataobject then
							li_rtn = this.f_update_streamvalue( ldw_t_object, lds_stream, las_t_obj_col, las_t_obj_col_sv,'', li_idx2,ll_row)
							if li_rtn = -1 then
								destroy lds_stream
								rollback using lt_transaction;
								return -1
							end if
						else // tìm lên master
						end if
						li_rtn = this.f_postinsert_streamvalue( vod_handling, ldw_main,ldw_item, lds_stream,ll_row,li_idx2,vs_value_yn,vs_qty_yn)
						if li_rtn = -1 then 
							destroy lds_stream
							rollback using lt_transaction;
							return -1
						end if
					next
				else
					ls_item_code = this.f_get_object_code(ldw_item.getitemnumber( li_idx2, 'ITEM_ID'))
					gf_messagebox('m.c_dwservice.f_insert_streamvalue.01','Thông báo','Chưa nhập số serial cho mã hàng @: '+ls_item_code,'exclamation','ok',1)
					destroy lds_stream
					rollback using lt_transaction;
					return -1
				end if
				
			else
				ll_row = lds_stream.event e_addrow( )
				if ll_row = -1 then 
					destroy lds_stream
					rollback using lt_transaction;
					return -1
				end if
				li_rtn = this.f_update_streamvalue( ldw_item, lds_stream, las_item_col, las_item_col_sv, '', li_idx2, ll_row)
				if li_rtn = -1 then 
					destroy lds_stream
					rollback using lt_transaction;
					return -1
				end if
				if ldw_master.dataobject = ldw_f_object.dataobject then
					if ldw_f_object.rowcount( ) = 1  and ll_find > 0 then
						li_rtn = this.f_update_streamvalue( ldw_f_object, lds_stream, las_f_obj_col, las_f_obj_col_sv, '', ldw_f_object.getrow(), ll_row)
						if li_rtn = -1 then 
							destroy lds_stream
							rollback using lt_transaction;
							return -1
						end if
					else // nhiều f_object
					end if
				elseif ldw_f_object.dataobject = ldw_item.dataobject then
					li_rtn = this.f_update_streamvalue(ldw_f_object, lds_stream,las_f_obj_col,las_f_obj_col_sv,'', li_idx2,ll_row)
					if li_rtn = -1 then 
						destroy lds_stream
						rollback using lt_transaction;
						return -1
					end if
				else // tìm lên master
				end if
				
				if ldw_t_object.dataobject = ldw_item.dataobject then
					li_rtn = this.f_update_streamvalue( ldw_t_object, lds_stream, las_t_obj_col, las_t_obj_col_sv,'', li_idx2,ll_row)
					if li_rtn = -1 then 
						destroy lds_stream
						rollback using lt_transaction;
						return -1
					end if
				else // tìm lên master
				end if
				li_rtn = this.f_postinsert_streamvalue( vod_handling, ldw_main,ldw_item, lds_stream,ll_row,li_idx2,vs_value_yn,vs_qty_yn)
				if li_rtn = -1 then 
					destroy lds_stream
					rollback using lt_transaction;
					return -1
				end if
			end if						
		next
		//-- trả lại filter cho dw item--//
//		if ls_filter_item <> "?" then
//			ls_filter_item = lc_str.f_globalreplace( ls_filter_item, '~~', "")				
//			ldw_item.setfilter(ls_filter_item)
//			ldw_item.filter( )
//		end if		
		//-- trả lại filter cho dw item LOT--//
		if ls_filter_lot <> "?" and isvalid(ldw_item_lot) then
			ls_filter_lot = lc_str.f_globalreplace( ls_filter_lot, '~~', "")				
			ldw_item_lot.setfilter(ls_filter_lot)
			ldw_item_lot.filter( )
		end if		

elseif (upper(vs_qty_yn) = 'N' and upper(vs_value_yn) = 'Y') or (upper(vs_qty_yn) = 'Y' and upper(vs_value_yn) = 'Y') then
		ls_filter_value = ldw_value.describe( "Datawindow.Table.filter")
		if ls_filter_value <> '?' then
			ldw_value.setfilter( "")
			ldw_value.filter()
		end if
		ldw_master = ldw_value.f_get_idw_master( )
		for li_idx2 = 1 to ldw_value.rowcount( )
			ldb_item_id=ldw_value.getitemnumber( li_idx2,las_value_col[1])
			if isnull(ldb_item_id) then ldb_item_id = 0
//			if isnull(ldb_item_id) then
//				gf_messagebox('m.c_dwservice.f_insert_stramvalue.02','Thông báo','Chưa nhập mã hàng hoặc tài khoản','exclamation','ok',1)
//				li_rtn = -1
//			else
				if upper(vod_handling.dynamic f_get_object_type(ldb_item_id))<>'ITEM' THEN continue
//			end if
			ll_row = lds_stream.event e_addrow( )
			lds_stream.setitem( ll_row, 'ID', vod_handling.f_create_id())
			//insert value,base_value
			for li_idx3 = 1 to upperbound(las_value_col)
				lds_stream.setitem( ll_row,las_value_col_sv[li_idx3], ldw_value.f_getitemany( li_idx2, las_value_col[li_idx3])  )
			next
				//insert currency_id,exchange_reate,....
			if ldw_master.dataobject = ldw_currency.dataobject then
				for li_idx3 = 1 to upperbound(las_cur_col)
					la_data = ldw_currency.f_getitemany( ldw_currency.getrow(), las_cur_col[li_idx3])
					li_rtn = lds_stream.setitem( li_idx2,las_cur_col_sv [li_idx3],la_data )
				next 
			else
				/////////
			end if
				//insert f_object_id,t_object_id
			if ldw_value.dataobject = ldw_f_object.dataobject then
				la_data = ldw_f_object.f_getitemany( li_idx2, las_f_obj_col[1])
				
				if isnull(la_data) then 
					la_data=ldw_value.f_getitemany( li_idx2, las_item_col[1]) 
					if isnull(la_data) then la_data = 0
//					if isnull(la_data) then
//						gf_messagebox('m.c_dwservice.f_insert_stramvalue.02','Thông báo','Chưa nhập mã hàng hoặc tài khoản','exclamation','ok',1)
//						li_rtn = -1			
//					else
						li_rtn=lds_stream.setitem( li_idx2, las_f_obj_col_sv[1],la_data )	
//					end if
				else
					li_rtn=lds_stream.setitem( li_idx2, las_f_obj_col_sv[1],la_data )	
				end if
				
			elseif ldw_master.dataobject = ldw_f_object.dataobject then
				if ldw_f_object.getrow( ) > 0 then
					la_data = ldw_f_object.f_getitemany( ldw_f_object.getrow( ), las_f_obj_col[1])
					li_rtn = lds_stream.setitem( li_idx2, las_f_obj_col_sv[1],la_data )
				end if
			end if
			if ldw_value.dataobject = ldw_t_object.dataobject then
				la_data = ldw_t_object.f_getitemany( li_idx2, las_t_obj_col[1])
				if isnull(la_data) then 
					la_data=ldw_value.f_getitemany( li_idx2, las_item_col[1]) 
					if isnull(la_data) then
						gf_messagebox('m.c_dwservice.f_insert_stramvalue.03','Thông báo','Chưa nhập mã hàng hoặc tài khoản','exclamation','ok',1)
						li_rtn = -1			
					else
						li_rtn=lds_stream.setitem( li_idx2, las_t_obj_col_sv[1],la_data )	
					end if
				else
					li_rtn=lds_stream.setitem( li_idx2, las_t_obj_col_sv[1],la_data )	
				end if
			elseif ldw_master.dataobject = ldw_t_object.dataobject then
				if ldw_t_object.getrow( ) > 0 then
					la_data = ldw_t_object.f_getitemany( ldw_t_object.getrow( ), las_t_obj_col[1])
					li_rtn = lds_stream.setitem( li_idx2, las_t_obj_col_sv[1],la_data )
				end if
			end if
				//insert doc_ref_id,doc_ref_type,item_ref_id,item_ref_table,trans_date,qty_yn,value_yn
			li_rtn = this.f_postinsert_streamvalue(vod_handling, ldw_main, ldw_value, lds_stream,ll_row,li_idx2,vs_value_yn,vs_qty_yn)
			if li_rtn = -1 then exit
		next
		
		if li_rtn = -1 then 
			destroy lds_stream
			rollback using lt_transaction;
			return -1
		end if		
		if ls_filter_value <> '?' then
			ls_filter_value = lc_str.f_globalreplace( ls_filter_value, '~~', "")
			ldw_value.setfilter( ls_filter_value)
			ldw_value.filter()
		end if
	end if
next
li_rtn = lds_stream.update(true,false )
if li_rtn = 1 then
	lds_stream.resetupdate( )
else
	messagebox('Lỗi','c_dwservice.f_insert_streamvalue(line:)')
	Rollback using lt_transaction;
end if
return 1
end function

public function integer f_insert_sv (t_dw_mpl vdw_accessary, t_dw_mpl vdw_data, t_ds_db rds_streamvalue, string vs_colname_data, string vs_colname_sv, boolean vb_addrow);return 1
end function

public function integer f_get_qty_and_value_yn (double vdb_doc_id, ref string rs_quantity_yn, ref string rs_value_yn);
select nvl(bks.QUANTITY_YN,'N'),nvl(bks.VALUE_YN,'N') into :rs_quantity_yn,:rs_value_yn
from booked_slip bks left join document doc on doc.id = bks.object_ref_id and doc.version_id = bks.id 
where doc.id = :vdb_doc_id using SQLCA; 

if SQLCA.sqlcode = 0 then
	return 1
elseif SQLCA.sqlcode = 100 then
	return 0
else
	return -1
end if
end function

public function integer f_get_lot_or_serial_yn (double vdb_item_id, ref string rs_lot_yn, ref string rs_serial_yn);
select nvl(item.lot_yn,'N'),nvl(item.serial_yn,'N') into :rs_lot_yn,:rs_serial_yn 
from item 
where item.object_ref_id = :vdb_item_id using SQLCA;
if SQLCA.sqlcode = 0 then
	return 1
else
	return -1
end if
end function

public function integer f_update_streamvalue (t_dw_mpl vdw_data, ref t_ds_db rds_stream, string vas_data_col[], string vas_update_col[], string vs_pas_col, long vl_data_row, long vl_update_row);int				li_idx,li_rtn

for li_idx = 1 to upperbound(vas_data_col)
	if upper(vas_data_col[li_idx]) = upper(vs_pas_col) then continue
	if pos(vas_data_col[li_idx],'qty')>0 and (li_idx=1 or li_idx=3) then 
		li_rtn = rds_stream.setitem( vl_update_row,vas_update_col[li_idx], vdw_data.f_getitemany( vl_data_row, vas_data_col[li_idx]+'_sku')  )
	else
		li_rtn = rds_stream.setitem( vl_update_row,vas_update_col[li_idx], vdw_data.f_getitemany( vl_data_row, vas_data_col[li_idx])  )
	end if
	if li_rtn = -1 then return -1
next
return li_rtn
end function

public function boolean f_is_warehouse (double vdb_object_id);string ls_object_type

select object_ref_table into :ls_object_type from object where id = :vdb_object_id using SQLCA;
if sqlca.sqlcode = 0 then
	if upper(ls_object_type) = 'WAREHOUSE' then 
		return true
	end if
end if
return false
end function

public function integer f_caculation_close_qty (ref any raa_data[], date vd_trans_date);
//-- KHÔNG CÒN DÙNG --//

c_unit_instance	lc_unit_instance

lc_unit_instance.is_table = 'object'
if isnull(raa_data[7]) then raa_data[7]  = 'NULL' 
if isnull(raa_data[8]) then raa_data[8] = 'NULL'
raa_data[12] = this.f_get_open_qty(date(vd_trans_date) ,raa_data[6],raa_data[1],raa_data[2], raa_data[3],raa_data[4] ,raa_data[5],raa_data[7] ,raa_data[8] )
if raa_data[12] = -1 then
	//câu select trong hàm f_get_open_qty có sqlcode = -1
	messagebox('Thông báo','c_dwservice.f_caculation_close_qty(line:9)')
	return -1
end if
raa_data[13] = long(raa_data[12]) + long(raa_data[10]) - long(raa_data[11])
if raa_data[13] < 0 then
	if this.f_is_warehouse( raa_data[6]) then
		gf_messagebox('m.c_dwservice.f_caculation_close_qty.01','Thông báo','Mã hàng : '+lc_unit_instance.f_get_code(raa_data[1])+' tồn kho '+string(raa_data[13]) ,'exclamation','ok',1)
		return -1
	end if
end if
return 1
end function

public function long f_get_open_qty (date vd_trans_date, double vdb_object_id, double vdb_item_id, double vdb_branch_id, double vdb_company_id, double vdb_spec_id, double vdb_loc_id, string vs_serial_no, string vs_lot_no);
//-- KHÔNG CÒN DÙNG --//

date		ld_balance_date
long		ll_open_qty
double	ldb_item_id,ldb_f_object_id,ldb_branch_id

/*sử dụng using SQLCA để kiểm tra dưới database có thể bị lỗi insert 2 dòng cùng item_id ..v..v.. và cùng ngày ghi sổ, do trên line có 1 mặt hàng có 2 dòng khác số lượng*/
if isnull(vdb_spec_id) then vdb_spec_id = 0
if isnull(vdb_loc_id) then vdb_loc_id = 0
if isnull(vdb_object_id) then vdb_object_id = 0
if isnull(vs_lot_no) or vs_lot_no = '' then vs_lot_no = 'NULL'
if isnull(vs_serial_no) or vs_serial_no = '' then vs_serial_no = 'NULL'
select max(balance_date) into :ld_balance_date
 from item_balance 
 where item_id = :vdb_item_id 
		  and object_id = :vdb_object_id 
		  and BRANCH_ID = :vdb_branch_id 
		  and COMPANY_ID = :vdb_company_id
		  and nvl(SPEC_ID,0) = :vdb_spec_id
		  and nvl(LOC_ID,0) = :vdb_loc_id
		  and nvl(LOT_NO,'NULL') = :vs_lot_no
		  and nvl(SERIAL_NO,'NULL') =:vs_serial_no
		  and trunc(BALANCE_DATE) < trunc(:vd_trans_date) using SQLCA;
if SQLCA.sqlcode = 100 then
	return 0
elseif SQLCA.sqlcode = 0 then
	if isnull(ld_balance_date) then return 0
	select close_qty into :ll_open_qty
				from item_balance 
				where item_id = :vdb_item_id 
				  and object_id = :vdb_object_id 
				  and BRANCH_ID = :vdb_branch_id 
				  and COMPANY_ID = :vdb_company_id
				  and nvl(SPEC_ID,0) = :vdb_spec_id
				  and nvl(LOC_ID,0) = :vdb_loc_id
				  and nvl(LOT_NO,'NULL') = :vs_lot_no
				  and nvl(SERIAL_NO,'NULL') =:vs_serial_no
				  and BALANCE_DATE = :ld_balance_date using SQLCA;
	if SQLCA.sqlcode = 0 then
		return ll_open_qty
	elseif SQLCA.sqlcode = 100 then
		// lỗi dữ liệu, số cuối kỳ của ngày gần nhất với ngày ghi sổ ko có
		messagebox('Lỗi','c_dwservice.f_get_open_qty(line:41)')
		return -1
	end if
else
	return -1
end if

return 1
end function

public function integer f_postinsert_streamvalue (s_object_display vod_handling, t_dw_mpl vdw_main, t_dw_mpl vdw_item, ref t_ds_db rds_stream, long vl_row, long vl_item_row, string vs_value_yn, string vs_qty_yn);int				li_rtn,li_count,li_idx
string			ls_table
datetime		ldt_trans_date
t_dw_mpl 	ladw_detail[]
	
	li_count = vdw_main.f_getdwdetails( ladw_detail)
	for li_idx = 1 to li_count
		ls_table = ladw_detail[li_idx].describe( "DataWindow.Table.UpdateTable")
		if upper(ls_table) = 'BOOKED_SLIP' then
			ldt_trans_date = ladw_detail[li_idx].getitemdatetime( ladw_detail[li_idx].getrow( ) , 'trans_date')
			exit
		end if
	next
	li_rtn = rds_stream.setitem( vl_row, 'ID', vod_handling.f_create_id())
	if li_rtn = 1 then li_rtn = rds_stream.setitem( vl_row, 'QTY_YN', vs_qty_yn)
	if li_rtn = 1 then li_rtn = rds_stream.setitem( vl_row, 'VALUE_YN', vs_value_yn)
	if li_rtn = 1 then li_rtn = rds_stream.setitem( vl_row, 'DOC_REF_ID', vdw_main.getitemnumber( vdw_main.getrow() , 'ID') )
	if li_rtn = 1 then li_rtn = rds_stream.setitem( vl_row, 'DOC_REF_TYPE', upper(vdw_main.getitemstring( vdw_main.getrow( ) , 'doc_type')) )
	if li_rtn = 1 then li_rtn = rds_stream.setitem( vl_row, 'TRANS_DATE', date(ldt_trans_date) )
	if li_rtn = 1 then li_rtn = rds_stream.setitem( vl_row, 'ITEM_REF_ID', vdw_item.getitemnumber(vl_item_row,'ID')  )
	if li_rtn = 1 then li_rtn = rds_stream.setitem( vl_row, 'ITEM_REF_TABLE', upper(vdw_item.describe( "DataWindow.Table.UpdateTable")) )
return li_rtn
end function

public function string f_buildwhere_4_copy_master (string vs_detail_where, string vs_detail_table, t_dw_mpl vdw_detail);string					ls_where, ls_detail_ref_ID, ls_master_ID, ls_coltype, las_master_keycol[], las_detail_keycol[]
int						li_keycnt, li_idx
boolean				lb_detail
t_dw_mpl			ldw_master
c_dwservice			lc_dwservice



ldw_master = vdw_detail.f_get_idw_master()			
lb_detail = ldw_master.f_get_ib_detail() 
li_keycnt = vdw_detail.f_get_master_keycol(las_master_keycol[])
li_keycnt = vdw_detail.f_get_detail_keycol(las_detail_keycol[])
FOR li_idx = 1 to li_keycnt
	ls_detail_ref_ID = vs_detail_table+'.'+las_detail_keycol[li_idx]	
	if lb_detail then
		ls_master_ID = ldw_master.describe("DataWindow.Table.updatetable") + '.'+ las_master_keycol[li_idx]
	else
		ls_master_ID = las_master_keycol[li_idx]
		if lc_dwservice.f_get_build_column(ldw_master, ls_master_ID, ls_coltype) = -1 then
			gf_messagebox('m.f_buildwhere_4_copy_master.01','Thông báo','Không lấy được tên cột của dwo:@'+ldw_master.dataobject,'exclamation','ok',1)
			return ''
		end if			
	end if		
	if ls_where <> '' then ls_where += ' AND '
	ls_where += ls_detail_ref_ID + ' = ' + ls_master_ID
NEXT
//add where version_id
if ldw_master.describe( "version_id.coltype" ) = 'number' then
	ls_detail_ref_ID = vs_detail_table+'.ID'
	ls_master_ID = 'VERSION_ID'
	if lc_dwservice.f_get_build_column(ldw_master, ls_master_ID, ls_coltype) = -1 then
		gf_messagebox('m.f_buildwhere_4_copy_master.01','Thông báo','Không lấy được tên cột của dwo:@'+ldw_master.dataobject,'exclamation','ok',1)
		return ''
	end if		
	if ls_where <> '' then ls_where += ' AND '
	ls_where += ls_detail_ref_ID + ' = ' + ls_master_ID
end if

ls_where =  " exists (select 'x' from "+ vs_detail_table+" where " + ls_where
ls_where = ls_where + " AND " +vs_detail_where +")"
if lb_detail then
	vs_detail_table = ldw_master.describe("DataWindow.Table.updatetable")
	return this.f_buildwhere_4_copy_master(ls_where , vs_detail_table, ldw_master)
end if

return ls_where


end function

public function string f_buildwhere_line_4_copy (s_str_dwo_related vstr_dwo_related, t_dw_mpl vdw_match);string					ls_where, ls_f_table, ls_t_table, ls_rf_table, ls_match_column[], ls_f_column[], ls_master_table , ls_from_clause
string					ls_coltype, ls_master_ID, ls_match_f_ID, ls_match_f_colname, lsa_match_f_col_obj[], ls_match_f_col_obj
int						li_cnt
boolean				lb_detail
datastore			lds_tmp
t_dw_mpl			ldw_master
c_string				lc_string
c_dwservice			lc_dwservice

lds_tmp = create datastore
lds_tmp.dataobject = vstr_dwo_related.s_match_f_dwo[1]
//ls_f_table = upper(lds_tmp.describe("DataWindow.Table.updatetable"))
lds_tmp.dataobject = vstr_dwo_related.s_match_t_dwo[1]
ls_t_table = upper(lds_tmp.describe("DataWindow.Table.updatetable"))
if upperbound(vstr_dwo_related.s_match_rf_dwo[]) > 0 then
	if vstr_dwo_related.s_match_rf_dwo[1] <> '' then
		lds_tmp.dataobject = vstr_dwo_related.s_match_rf_dwo[1]
		ls_rf_table = upper(lds_tmp.describe("DataWindow.Table.updatetable"))
	end if
end if
li_cnt = lc_string.f_stringtoarray( vstr_dwo_related.s_match_f_column[1] , ';', ls_f_column[])
li_cnt = lc_string.f_stringtoarray( vstr_dwo_related.s_match_column[1] , ';', ls_match_column[])
//-- build điều kiện của object match --//
if upperbound(vstr_dwo_related.s_match_f_col_obj[]) > 0 then
	li_cnt = lc_string.f_stringtoarray( vstr_dwo_related.s_match_f_col_obj[1] , ';', lsa_match_f_col_obj[])
end if
lb_detail = vdw_match.f_get_ib_detail() 

if lb_detail then
	ls_match_f_colname = ls_f_column[1]
	lc_dwservice.f_get_build_column(vdw_match , ls_match_f_colname, ls_coltype)
	ls_match_f_ID = 'ID'
	lc_dwservice.f_get_build_column(vdw_match , ls_match_f_ID, ls_coltype)

	if ls_rf_table = '' then
		ls_where = ls_match_f_colname + " > (select nvl(sum(M1."+ ls_match_column[1] +"),0) from MATCHING M1 where M1.F_REF_ID = " + &
							 ls_match_f_ID +" and upper(M1.T_REF_TABLE) = '"+ ls_t_table+ "') "	
	else
		ls_where = ls_match_f_colname + " > (select nvl(sum(M1."+ ls_match_column[1] +"),0) from MATCHING M1 where M1.F_REF_ID = " + &
						 ls_match_f_ID +" and upper(M1.T_REF_TABLE) = '"+ ls_t_table+ "') "  + &
						" + (select nvl(sum(M2."+ ls_match_column[1] +"),0) from MATCHING M2 where M2.F_REF_ID = " + &
					 	ls_match_f_ID +" and upper(M2.T_REF_TABLE) = '"+ ls_rf_table+ "') "
	end if

end if



ls_where = lc_string.f_globalreplace( ls_where, "'", "~~'")

destroy lds_tmp
return ls_where
end function

public function integer f_parse_fromwhere_clause (t_ds vds_handle, ref string rs_table, ref string rs_table_alias, ref string rs_joinclause, ref string rs_whereclause);
c_string					lc_string
c_sql						lc_sql
t_s_sql_attr				lstr_sql_attr[]
string						ls_originalSQL, ls_fromclause
int							li_join_pos, li_left_pos, li_full_pos, li_right_pos, li_pos1,li_pos2

//-- Save the SQL select statement --//
ls_originalSQL = vds_handle.describe("Datawindow.Table.Select")

//-- Check for errors --//
If IsNull(ls_originalSQL) or Len(ls_originalSQL) = 0 Then
	Return -1
End If

//-- Prepare original SQL to be re-used in a modify DW function --//
ls_originalSQL = lc_string.f_GlobalReplace(ls_originalSQL,"'","~~'")

//-- //
lc_sql.f_parse( ls_originalSQL, lstr_sql_attr[])
rs_whereclause = lstr_sql_attr[1].s_where

ls_fromclause = upper(lstr_sql_attr[1].s_tables)

//-- cắt lấy join clause --//
li_join_pos = pos(ls_fromclause, 'JOIN')
li_left_pos = pos(ls_fromclause, 'LEFT') 
li_full_pos = pos(ls_fromclause, 'FULL')
li_right_pos = pos(ls_fromclause, 'RIGHT')

if min(li_left_pos, li_right_pos) = 0 then 
	li_pos1 = max(li_left_pos, li_right_pos)
else
	li_pos1 = min(li_left_pos, li_right_pos) 
end if

if min(li_full_pos, li_join_pos) = 0 then
	li_pos2 = max(li_full_pos, li_join_pos)
else
	li_pos2 = min(li_full_pos, li_join_pos)
end if

if min(li_pos1,li_pos2) = 0 then
	li_join_pos = max(li_pos1,li_pos2) 
else
	li_join_pos = min(li_pos1,li_pos2)
end if

if li_join_pos = 0 then
	rs_table = ls_fromclause
else
	rs_joinclause = mid(ls_fromclause, li_join_pos)
	rs_table = left(ls_fromclause, li_join_pos -1)
end if
rs_table = trim(rs_table) //-- cắt bỏ khoảng trắng đầu đuôi --//

if pos(rs_table,' ') > 0 then
	rs_table_alias = mid(rs_table, pos(rs_table,' ') +1 )
	rs_table = left(rs_table, pos(rs_table, ' ') - 1)	
end if

return 1
end function

public function integer f_parse_fromwhere_clause (t_dw vdw_handle, ref string rs_table, ref string rs_table_alias, ref string rs_joinclause, ref string rs_whereclause);c_dw_querymode		lc_dw_query
c_string					lc_string
c_sql						lc_sql
t_s_sql_attr				lstr_sql_attr[]
string						ls_originalSQL, ls_fromclause
int							li_join_pos, li_left_pos, li_full_pos, li_right_pos, li_pos1, li_pos2

//-- Save the SQL select statement --//
ls_originalSQL = vdw_handle.describe("Datawindow.Table.Select")

//-- Check for errors --//
If IsNull(ls_originalSQL) or Len(ls_originalSQL) = 0 Then
	Return -1
End If

//-- Prepare original SQL to be re-used in a modify DW function --//
ls_originalSQL = lc_string.f_GlobalReplace(ls_originalSQL,"'","~~'")

//-- //
lc_sql.f_parse( ls_originalSQL, lstr_sql_attr[])
rs_whereclause = lstr_sql_attr[1].s_where
//-- remove where có tham số--//
lc_dw_query.f_removeargsfromwhereclause( rs_whereclause)
ls_fromclause = upper(lstr_sql_attr[1].s_tables)

//-- cắt lấy join clause --//
li_join_pos = pos(ls_fromclause, 'JOIN')
li_left_pos = pos(ls_fromclause, 'LEFT') 
li_full_pos = pos(ls_fromclause, 'FULL')
li_right_pos = pos(ls_fromclause, 'RIGHT')

if min(li_left_pos, li_right_pos) = 0 then 
	li_pos1 = max(li_left_pos, li_right_pos)
else
	li_pos1 = min(li_left_pos, li_right_pos) 
end if

if min(li_full_pos, li_join_pos) = 0 then
	li_pos2 = max(li_full_pos, li_join_pos)
else
	li_pos2 = min(li_full_pos, li_join_pos)
end if

if min(li_pos1,li_pos2) = 0 then
	li_join_pos = max(li_pos1,li_pos2) 
else
	li_join_pos = min(li_pos1,li_pos2)
end if

if li_join_pos = 0 then
	rs_table = ls_fromclause
else
	rs_joinclause = mid(ls_fromclause, li_join_pos)
	rs_table = left(ls_fromclause, li_join_pos -1)
end if
rs_table = trim(rs_table) //-- cắt bỏ khoảng trắng đầu đuôi --//

if pos(rs_table,' ') > 0 then
	rs_table_alias = mid(rs_table, pos(rs_table,' ') +1 )
	rs_table = left(rs_table, pos(rs_table, ' ') - 1)	
end if

return 1
end function

public function boolean f_is_object_col_check (string vs_column_chk, datawindow vdw_copied);c_string			lc_string
int					li_idx,li_idx2,li_idx3
int					li_count_col_chk
long				ll_find, ll_row
string				las_column_chk[],ls_text

li_count_col_chk = lc_string.f_stringtoarray( vs_column_chk,';', las_column_chk)
if li_count_col_chk > 0 then
	if vdw_copied.dynamic f_isgrid() then ll_find = vdw_copied.find( "gutter = 'Y'", 0, vdw_copied.rowcount( ) )
	// neu dw la dang form hoac dang grid ma ko tich chon
	if  ll_find=0 then
		for li_idx = 2 to vdw_copied.rowcount()
			for li_idx2 = 1 to li_count_col_chk
				if vdw_copied.dynamic f_getitemany(1,las_column_chk[li_idx2] )<> vdw_copied.dynamic f_getitemany(li_idx,las_column_chk[li_idx2] ) then
					ls_text = t_w_mdi.ids_lang_text.f_get_lang_text(lower(mid(vdw_copied.dataobject,1,len(vdw_copied.dataobject) - 5) +'.'+ las_column_chk[li_idx2] + '_t'))
					if ls_text = '' then ls_text = t_w_mdi.ids_lang_text.f_get_lang_text(lower(mid(vdw_copied.dataobject,1,len(vdw_copied.dataobject) - 5) +'.'+ las_column_chk[li_idx2] + '_x'))
					gf_messagebox('m.c_dwsevice.f_is_object_col_check.01','Thông báo',"Dữ liệu cột '"+ ls_text + "' không đúng",'exclamation','ok',1)
					return false
				end if
			next
		next
	else //la dang gird co tich chon
		ll_row=ll_find
		Do
			ll_find = vdw_copied.find( "gutter = 'Y'", ll_find +1, vdw_copied.rowcount( ) +1 )
			if ll_find > 0 then 
				for li_idx2 = 1 to li_count_col_chk
					if vdw_copied.dynamic f_getitemany(ll_row,las_column_chk[li_idx2] )<> vdw_copied.dynamic f_getitemany(ll_find,las_column_chk[li_idx2] ) then
						ls_text = t_w_mdi.ids_lang_text.f_get_lang_text(lower(mid(vdw_copied.dataobject,1,len(vdw_copied.dataobject) - 5) +'.'+ las_column_chk[li_idx2] + '_t'))
						if ls_text = '' then ls_text = t_w_mdi.ids_lang_text.f_get_lang_text(lower(mid(vdw_copied.dataobject,1,len(vdw_copied.dataobject) - 5) +'.'+ las_column_chk[li_idx2] + '_x'))
						gf_messagebox('m.c_dwsevice.f_is_object_col_check.01','Thông báo',"Dữ liệu cột '"+ ls_text + "' không đúng",'exclamation','ok',1)
						return false
					end if
				next
			end if
		Loop While ll_find > 0 
	end if
end if
return true
//================================================
//c_string			lc_string
//int					li_idx2,li_idx3
//int					li_count_col_chk,li_upp
//long				ll_find
//string				las_column_chk[],ls_find,las_row[],ls_text
//
//li_count_col_chk = lc_string.f_stringtoarray( vs_column_chk,';', las_column_chk)
//if li_count_col_chk > 0 then
//	Do
//		if not vdw_copied.dynamic f_isgrid() then exit
//		ll_find = vdw_copied.find( "gutter = 'Y'", ll_find +1, vdw_copied.rowcount( ) +1 )
//		if ll_find > 0 then
//			ls_find += string(ll_find) + ';'
//		end if
//	Loop While ll_find > 0 
//	if ls_find = '' and vdw_copied.dataobject = vdw_main.dataobject then
//	elseif ls_find = '' and vdw_copied.dataobject <> vdw_main.dataobject then
//		for li_idx2 = 1 to vdw_copied.rowcount()
//			ls_find += string(li_idx2)+';'
//		next
//	end if
//	for li_idx2 = 1 to li_count_col_chk
//		for li_idx3 = 1 to lc_string.f_stringtoarray( ls_find, ';', las_row)
//			ls_text = t_w_mdi.ids_lang_text.f_get_lang_text(lower(mid(vdw_copied.dataobject,1,len(vdw_copied.dataobject) - 5) +'.'+ las_column_chk[li_idx2] + '_t'))
//			if ls_text = '' then ls_text = t_w_mdi.ids_lang_text.f_get_lang_text(lower(mid(vdw_copied.dataobject,1,len(vdw_copied.dataobject) - 5) +'.'+ las_column_chk[li_idx2] + '_x'))
////			if isnull(vdw_copied.dynamic f_getitemany(long(las_row[li_idx3]),las_column_chk[li_idx2] )) then
////				gf_messagebox('m.c_dwsevice.f_is_col_chk_copy.01','Thông báo',"Dữ liệu cột '"+ ls_text + "' không đúng",'exclamation','ok',1)
////				return false
////			end if
//			if li_idx3 = upperbound(las_row) then exit
//			if vdw_copied.dynamic f_getitemany(long(las_row[li_idx3]),las_column_chk[li_idx2] ) &
//				<> vdw_copied.dynamic f_getitemany(long(las_row[li_idx3 + 1]) ,las_column_chk[li_idx2] ) then
//				gf_messagebox('m.c_dwsevice.f_is_col_chk_copy.02','Thông báo',"Dữ liệu cột '"+ ls_text + "' không đúng",'exclamation','ok',1)
//				return false
//			end if
//		next
//	next
//end if
//return true
end function

public function integer f_copy_version (powerobject vpo_detail, ref t_transaction vt_transaction, string vs_dataobject, string vas_id_replace[]);/***************************
Chức năng: nhân bản 1 chứng từ 
***************************/
t_dw_mpl			ladw_details[],ldw_master
t_ds_db				lds_detail
c_string				lc_string
s_object_display	lod_detail
int					li_idx,li_idx1,li_rtn, li_cnt
long				ll_rtn,ll_find
double			ldb_id
string				ls_OriginalFilter,las_id_replace[],las_id[],ls_updatetable, ls_filterStr

lod_detail = create s_object_display
lds_detail = create t_ds_db
lds_detail.dataobject = vs_dataobject
lds_detail.f_settransobject( vt_transaction)
ls_OriginalFilter = vpo_detail.dynamic Describe("DataWindow.Table.Filter")
ls_updatetable = lds_detail.describe( "DataWindow.Table.UpdateTable")
if ls_updatetable = '?' then 
	destroy lds_detail
	destroy lod_detail	
	return 0
end if

if trim(lower(ls_updatetable)) <> 'post_line' then 
	
	ldw_master = vpo_detail.dynamic f_get_idw_master( )
	if isvalid(ldw_master) then
		vpo_detail.dynamic f_set_ib_version_copying(true)
		if ls_OriginalFilter <> '?' then
			ls_filterStr = ldw_master.f_get_detail_filterstring(vpo_detail , true)
			vpo_detail.dynamic setfilter(ls_filterStr)
			vpo_detail.dynamic filter()
		end if		
		//--copy vào datastore để update--//
		if this.f_copy_f_t( vpo_detail, lds_detail) =-1 then 
			Rollback using vt_transaction;
			destroy lds_detail
			destroy lod_detail			
			return -1
		end if
		//--set lại id cho các dòng vừa copy--//
		for li_idx = 1 to lds_detail.rowcount( )
			ldb_id = lod_detail.f_create_id( )
			//--cất id mới và cũ của master để truyền vào cập nhật ref_id cho detail--//
			las_id_replace[li_idx] = string(ldb_id)+';'+string(vpo_detail.dynamic getitemnumber(li_idx,'id'))
			//--set id mới để update--//
			lds_detail.setitem( li_idx , 'id', ldb_id)
		next
		//--lấy id của master để update object ref id cho detail--//
		for li_idx =1 to upperbound(vas_id_replace[])
			lc_string.f_stringtoarray( vas_id_replace[li_idx], ';', las_id[])
			Do
				ll_find ++
				ll_find = lds_detail.find(ls_updatetable + '.object_ref_id = '+las_id[2], ll_find, lds_detail.rowcount( )+1 )
				if ll_find > 0 then
					lds_detail.setitem( ll_find, 'object_ref_id', double(las_id[1]))
				end if
			Loop While ll_find > 0
		next
		//--update ngày tạo chứng từ--//
		lds_detail.f_set_ib_traceable( true)
		if lds_detail.update(true,false ) = -1 then
			gf_messagebox('m.c_dwservice.f_copy_version.01','Thông báo','Lỗi update dữ liệu:@'+vt_transaction.sqlerrtext,'stop','ok',1)
			Rollback using vt_transaction;
			destroy lds_detail
			destroy lod_detail
			return -1
		else
			lds_detail.resetupdate( )
			if vpo_detail.dynamic describe('version_no.visible') <> '?' and vpo_detail.dynamic describe('version_no.visible')<> '!' then
				//--cập nhật version_no cho detail--//
				vpo_detail.dynamic setitem(vpo_detail.dynamic getrow(),'version_no',vpo_detail.dynamic getitemnumber(vpo_detail.dynamic getrow(),'version_no') + 1)
				if vpo_detail.dynamic update(true,false) = -1 then
					gf_messagebox('m.c_dwservice.f_copy_version.01','Thông báo','Lỗi update dữ liệu:@'+vt_transaction.sqlerrtext,'stop','ok',1)
					Rollback using vt_transaction;
					destroy lds_detail
					destroy lod_detail
					return -1					
				else
					vpo_detail.dynamic resetupdate()
				end if
			end if
		end if
		
		//-- copy detail của detail --//
		li_cnt =vpo_detail.dynamic f_getdwdetails( ladw_details[])
		for li_idx = 1 to li_cnt
			ll_rtn = this.f_copy_version( ladw_details[li_idx], vt_transaction,ladw_details[li_idx].dataobject,las_id_replace)
			if ll_rtn = -1 then return -1
		next		
		//-- trả lại filter gốc --//
		vpo_detail.dynamic f_set_ib_version_copying(false)
		if ls_OriginalFilter <> '?' then
			ls_OriginalFilter = lc_string.f_globalreplace(ls_OriginalFilter , '~~', '')
			vpo_detail.dynamic setfilter(ls_OriginalFilter)
			vpo_detail.dynamic filter()
		end if			
	end if
	
end if

return 1
end function

public function integer f_copy_version (powerobject vpo_detail, ref t_transaction vt_transaction);t_dw_mpl	ldw_detail
t_ds_db		lds_detail
string			las_master_id[]

if vpo_detail.typeof() = datawindow! then
	ldw_detail = vpo_detail
	return this.f_copy_version( ldw_detail, vt_transaction,ldw_detail.dataobject ,las_master_id)
elseif vpo_detail.typeof() = datastore! then
	lds_detail = vpo_detail
	return this.f_copy_version( lds_detail, vt_transaction,lds_detail.dataobject ,las_master_id)
end if
return 1
end function

public function boolean f_is_dr_cr_object (double vdb_object_id, string vs_dwo);t_ds_db		lds_dr_cr_object
long			ll_rtn
any			laa_data[]

laa_data[1] = vdb_object_id
lds_dr_cr_object = create t_ds_db
lds_dr_cr_object.dataobject = vs_dwo
lds_dr_cr_object.f_add_where( 'ID',laa_data )
ll_rtn = lds_dr_cr_object.retrieve( )
if ll_rtn > 0 then
	return true
else
	return false
end if
end function

public function integer f_set_data_sum (powerobject vpo_from_copied, t_dw_mpl vdw_to_copied, string vas_from_col[], string vas_to_col[], boolean vb_addrow, string vas_main_col_chk_sum[], string vas_related_col_chk_sum[], string vas_col_sum[], powerobject vpo_dr_cr_object, string vas_col_dr_cr_object[], string vas_match_column[], string vas_match_f_column[], double vdb_t_doc_id, ref t_ds_db rds_matching, s_object_display vod_handling, s_str_dwo_related vstr_dwo_related);int				li_idx1,li_idx2,li_idx3,li_idx4,li_rtn,li_idx5
any			la_f_data,la_t_data,laa_data[],la_data
long			ll_find,ll_row,ll_find1,ll_qty, ll_colcnt
string			ls_f_table,ls_dbname, ls_colType,ls_filter,ls_origin_filter
double		ldb_f_doc_id,ldb_return_price, ldb_id
boolean		lb_sum_group,lb_continue
datetime		ldt_sysdate
c_string		lc_string
c_datetime	lc_datet

b_obj_instantiate	lc_obj

ll_colcnt = upperbound(vas_to_col)
ldt_sysdate = lc_datet.f_getsysdate( )
if isvalid(vpo_dr_cr_object) then
	lb_sum_group = true
	for li_idx1 = 1 to upperbound(vas_col_dr_cr_object)
		laa_data[li_idx1] =  vpo_dr_cr_object.dynamic f_getitemany(vpo_dr_cr_object.dynamic rowcount(),vas_col_dr_cr_object[li_idx1])
		if isnull(laa_data[li_idx1]) then 
			gf_messagebox('m.c_dwservice.f_set_data_sum.01','Thông báo','Không có đối tượng công nợ','exclamation','ok',1)
			return -1
		end if
	next
else
	lb_sum_group = false
end if
ls_filter = vdw_to_copied.describe("Datawindow.table.filter")
if ls_filter <> '?' then
	ls_filter = lc_string.f_globalreplace( ls_filter, '~~', '')
	ls_origin_filter = ls_filter
end if
ls_filter = ''
ls_f_table = vpo_from_copied.dynamic describe("Datawindow.table.update")
for li_idx2 = 1 to vpo_from_copied.dynamic rowcount()
	ldb_id = vpo_from_copied.dynamic getitemnumber(li_idx2,'ID')
//	ldb_f_doc_id = vod_handling.dynamic f_get_doc_id(ldb_id  , ls_f_table)
	ldb_f_doc_id = lc_obj.f_get_doc_id(ldb_id , ls_f_table)
	if vdw_to_copied.dynamic rowcount() > 0  then
		for li_idx3 = 1 to upperbound(vas_main_col_chk_sum)
		//	ll_find1 = vdw_to_copied.dynamic find(vas_related_col_chk_sum[li_idx3] + ' = '+ string(vpo_from_copied.dynamic f_getitemany(li_idx2,vas_main_col_chk_sum[li_idx3])) ,1,vdw_to_copied.dynamic rowcount())
		//	if isnull(ll_find1) then
				ls_dbname = vas_related_col_chk_sum[li_idx3]
				if this.f_get_build_column( vdw_to_copied,ls_dbname, ls_colType) = -1 then
					return -1			
				end if
				if ls_filter <> '' then ls_filter += ' AND '
				la_data = vpo_from_copied.dynamic f_getitemany(li_idx2,vas_main_col_chk_sum[li_idx3])
				ls_filter += lc_string.f_get_expression( string(la_data), ls_colType, ls_dbname, 'Filter')
//				vdw_to_copied.setfilter(ls_filter)
//				vdw_to_copied.filter()
//				ll_find1 = vdw_to_copied.dynamic find(vas_related_col_chk_sum[1] + ' = '+ string(vpo_from_copied.dynamic f_getitemany(li_idx2,vas_main_col_chk_sum[1])) ,1,vdw_to_copied.dynamic rowcount())
//				ll_find1 = vdw_to_copied.dynamic rowcount()
		//	end if
		next
		vdw_to_copied.setfilter(ls_filter + ' AND '+ls_origin_filter)
		vdw_to_copied.filter()
		ls_filter = ''
		if vdw_to_copied.rowcount() = 0 then 
			if lb_sum_group then
				lb_continue = true
			else
				lb_continue = false
			end if
		end if
		ll_find1 = vdw_to_copied.dynamic rowcount()
	elseif vdw_to_copied.rowcount() = 0 and lb_sum_group then
		for li_idx3 = 1 to upperbound(vas_main_col_chk_sum)
			la_f_data = vpo_from_copied.dynamic f_getitemany(li_idx2,vas_main_col_chk_sum[li_idx3])
			if la_f_data <> laa_data[upperbound(laa_data)] then
				lb_continue = true
				exit
			else
				lb_continue = false
			end if
		next
	end if
	if (vb_addrow or vdw_to_copied.rowcount() = 0) and ll_find1 = 0 then
		vdw_to_copied.setfilter(ls_origin_filter)
		vdw_to_copied.filter()
		if lb_continue then 
			continue
		end if
		ll_row = vdw_to_copied.dynamic event e_addrow()
	elseif ll_find1 = 0 and lb_sum_group then
		continue
	else
		ll_row = ll_find1
	end if
	
	for li_idx4 = 1 to ll_colcnt
		if ll_find1 > 0  then
			for li_idx3 = 1 to upperbound(vas_col_sum)
				if upper(vas_from_col[li_idx4]) = upper(vas_col_sum[li_idx3]) then
					la_f_data = vpo_from_copied.dynamic f_getitemany( li_idx2, vas_from_col[li_idx4])
					if isnull(la_f_data) then la_f_data = 0
					la_t_data = vdw_to_copied.dynamic f_getitemany( ll_row,vas_to_col[li_idx4])
					if isnull(la_t_data) then la_t_data = 0
					li_rtn = vdw_to_copied.dynamic setitem( ll_row,vas_to_col[li_idx4] ,la_f_data + la_t_data )
				end if
			next
		else
			if vas_from_col[li_idx4] = '' or isnull(vas_from_col[li_idx4] ) then continue 
			li_rtn = vdw_to_copied.dynamic setitem( ll_row,vas_to_col[li_idx4] ,vpo_from_copied.dynamic f_getitemany( li_idx2, vas_from_col[li_idx4]) )
		end if
	next
	////lay gia hoa don mua, ban //////
	if 	vstr_dwo_related.b_get_price=true and vstr_dwo_related.s_dwo_set_price=vdw_to_copied.dataobject  then //set lai gia tra hang
		for li_idx5=1 to upperbound(vstr_dwo_related.s_col_get_price)
			ldb_id =vpo_from_copied. dynamic getitemnumber(li_idx3,'id')
			ldb_return_price=vod_handling.dynamic f_get_return_price(ldb_id, vstr_dwo_related.s_col_get_price[li_idx5], vstr_dwo_related.s_col_get_qty[li_idx5], vstr_dwo_related.s_dwo_get_price)
			if vstr_dwo_related.s_col_set_qty[li_idx5]<>'' then 
				ll_qty=vdw_to_copied.getitemnumber(ll_row,vstr_dwo_related.s_col_set_qty[li_idx5])
				if isnull(ll_qty) then ll_qty=0
				ldb_return_price=ldb_return_price*ll_qty
			end if
			li_rtn=vdw_to_copied.setitem( ll_row,vstr_dwo_related.s_col_set_price[li_idx5] ,ldb_return_price )
		next
	end if	
	if upperbound(vas_match_column) > 0 then
		vod_handling.dynamic f_insert_matching( vpo_from_copied, vdw_to_copied, vas_match_column, vas_match_f_column, 'COPY', ldb_f_doc_id, vdb_t_doc_id, rds_matching, ldt_sysdate, li_idx2, ll_row)
	end if
	vdw_to_copied.setfilter(ls_origin_filter)
	vdw_to_copied.filter()
next
return 1
end function

public function integer f_update_data_copied (string vas_main_obj_column_copy[], string vas_related_obj_column_copy[], boolean vb_f_sum, string vas_main_col_chk_sum[], string vas_related_col_chk_sum[], string vas_col_sum[], t_ds_db vds_copied, datawindow vdw_copied, powerobject vpo_dr_cr_object, string vas_col_dr_cr_object[], string vas_match_column[], string vas_match_f_column[], double vdb_t_doc_id, ref t_ds_db rds_matching, s_object_display vod_handling, s_str_dwo_related vstr_dwo_related);datetime			ldt_sysdate
double			ldb_f_doc_id,ldb_object_id,ldb_cus_id
string				ls_main_column_chk,ls_related_column_chk,ls_purpose_type,ls_address
int					li_idx,li_idx1,li_rtn,ll_find
any				la_data
c_string			lc_string
c_datetime		lc_datet

b_obj_instantiate	lc_obj


vds_copied.setsort("id asc")
vds_copied.sort()
for li_idx = 1 to vdw_copied.rowcount()
	if vb_f_sum and vds_copied.rowcount() >= 1 then
		// xử lý trường hợp sum
//		ldb_f_doc_id = vod_handling.dynamic f_get_doc_id( vds_copied.getitemnumber(vds_copied.rowcount( ), 'ID') , vds_copied.describe("Datawindow.table.update"))
		ldb_f_doc_id = lc_obj.f_get_doc_id(vds_copied.getitemnumber(vds_copied.rowcount( ), 'ID') , vds_copied.describe("Datawindow.table.update"))
		li_rtn = this.f_set_data_sum( vds_copied, vdw_copied, vas_main_obj_column_copy, vas_related_obj_column_copy, false, vas_main_col_chk_sum, vas_related_col_chk_sum, vas_col_sum, vpo_dr_cr_object, vas_col_dr_cr_object, vas_match_column, vas_match_f_column, vdb_t_doc_id, rds_matching, vod_handling,vstr_dwo_related)
		if li_rtn = -1 then return -1
		exit
	end if
	for li_idx1 = 1 to upperbound(vas_main_obj_column_copy)
		if vds_copied.rowcount() = 1 then // trường hợp 1 dòng ds copy ra nhiều dòng dw (1-n)
			li_rtn = vdw_copied.setitem(li_idx,vas_related_obj_column_copy[li_idx1],vds_copied.f_getitemany( vds_copied.rowcount( ) , vas_main_obj_column_copy[li_idx1]))
		elseif vdw_copied.rowcount() = vds_copied.rowcount() then	 // trường hợp nhiều dòng ds vào nhiều dòng dw (n-n)
			li_rtn = vdw_copied.setitem(li_idx,vas_related_obj_column_copy[li_idx1],vds_copied.f_getitemany( li_idx , vas_main_obj_column_copy[li_idx1]))
		elseif vds_copied.rowcount() > 1 and vdw_copied.rowcount() = 1 then // trường hợp nhiều dòng ds copy ra 1 dòng dw (n-1)
			if vds_copied.describe('purpose.coltype') <> '!' then
				ldb_cus_id = vds_copied.getitemnumber(vds_copied.rowcount( ),'object_ref_id')
				Select customer.object_ref_id into :ldb_object_id
				From customer
				where customer.id = :ldb_cus_id USING SQLCA;
				if li_idx1 = 1 then 
					ls_purpose_type = 'DELIVERY'
				else
					ls_purpose_type = 'INVOICE'
				end if
				vod_handling.dynamic f_get_address(ldb_object_id,ls_purpose_type,ls_address)
				la_data = ls_address
			else
				la_data = vds_copied.f_getitemany( vds_copied.rowcount( ) , vas_main_obj_column_copy[li_idx1])
			end if
			li_rtn = vdw_copied.setitem(li_idx,vas_related_obj_column_copy[li_idx1],la_data)
		end if
	next
	if upperbound(vas_match_column) > 0 and vds_copied.rowcount() >= 1 then
		ldt_sysdate = lc_datet.f_getsysdate( )
		vod_handling.dynamic f_insert_matching( vds_copied, vdw_copied, vas_match_column, vas_match_f_column, 'COPY', ldb_f_doc_id, vdb_t_doc_id, rds_matching, ldt_sysdate, vds_copied.rowcount( ), li_idx)
	end if
next
return li_rtn
end function

public function integer f_copy (datawindow vdw_master, datawindow vdw_copied, ref t_ds_db rds_copied, string vs_type_copy);long		ll_find

if vdw_copied.rowcount( ) > 0 then
	if vdw_copied. dynamic f_isgrid() then ll_find = vdw_copied.find("gutter = 'Y'",1,vdw_copied.rowcount())
	if ll_find > 0 then
		if this.f_copy_f_t( vdw_copied, rds_copied, 0, 0) = -1 then return -1
	else
//		return 0  //-- không chọn không copy --//
		if this.f_copy_f_t( vdw_copied, rds_copied, 1, vdw_copied.rowcount( )) = -1 then return -1
	end if
end if
return 1
end function

public function string f_getcolumnlabel (string vs_colname, string vs_dwo, string vs_objname);t_ds_db	lds_label
string		ls_collabel
any		laa_data[]
int			li_rtn

lds_label = create t_ds_db
lds_label.dataobject = 'ds_label'
lds_label.f_settransobject( SQLCA)
if pos(vs_dwo,'_grid') + pos(vs_dwo,'_form') > 0 then
	laa_data[1] = left(vs_dwo,len(vs_dwo) - 5) + '.' + vs_colname
else
	laa_data[1] = vs_dwo + '.' + vs_colname
end if
laa_data[2] = '=' + UPPER(vs_objname)
lds_label.f_add_where(  'code;subcode', laa_data)
li_rtn = lds_label.retrieve()
if li_rtn > 0 then
	ls_collabel = lds_label.getitemstring( 1, 'text')
	return ls_collabel
else
	return ''
end if
end function

public function integer f_send_mail (string vs_object_name, string vs_to_email, string vs_cc_email, string vs_subject, string vs_attack_files, string vs_body, boolean vb_display);oleobject		lole_OutLook,lole_MailItem,lole_Attachments
int				li_rtn

lole_OutLook = create oleobject

li_rtn = lole_OutLook.ConnectToNewObject("Outlook.Application")
if li_rtn = 0 then
	lole_MailItem = lole_OutLook.CreateItem(0)
	lole_Attachments = lole_MailItem.Attachments
	if vs_attack_files <> '' then lole_Attachments.add(vs_attack_files)
	if not vb_display then
		lole_MailItem.Subject = vs_subject
		lole_MailItem.Body = 'Hi '+ vs_object_name +'!'+ '~n' +vs_subject + ': ' + vs_body + "~n~n" +'Đây là chương trình gửi mail tự động, không cần trả lời! '+ '~n'+'(This is the automatically program send mail, no reply)'
		lole_MailItem.To = vs_to_email
		lole_MailItem.CC = vs_cc_email
		lole_MailItem.Send
	else
		lole_MailItem.Display
	end if
	lole_OutLook.disconnectobject()
else
	destroy lole_OutLook
	return -1
end if
destroy lole_OutLook
return 1
end function

public function integer f_send_mail (string vs_to_email, string vs_cc_email, string vs_subject, string vs_attack_files, string vs_header, string vs_body, string vs_footer, integer vi_format, boolean vb_display);oleobject		lole_OutLook,lole_MailItem,lole_Attachments
string			ls_body
/**********************************
BodyFormat:	1 text
					2 html
					3 rtf
**********************************/
int				li_rtn

lole_OutLook = create oleobject
li_rtn = lole_OutLook.ConnectToNewObject("Outlook.Application")
if li_rtn = 0 then
	lole_MailItem = lole_OutLook.CreateItem(0)
	lole_Attachments = lole_MailItem.Attachments
	if vs_attack_files <> '' then lole_Attachments.add(vs_attack_files)
	if not vb_display then
		lole_MailItem.Subject = vs_subject
		lole_MailItem.BodyFormat = vi_format
//		lole_MailItem.HTMLBody = vs_header
		lole_MailItem.body = vs_header + char(13)+ char(13) + vs_body + char(13)+ char(13) + vs_footer
		lole_MailItem.To = vs_to_email
		lole_MailItem.CC = vs_cc_email
		lole_MailItem.Send
	else
		lole_MailItem.Display
	end if
	lole_OutLook.disconnectobject()
else
	destroy lole_OutLook
	return -1
end if
destroy lole_OutLook
return 1
end function

public function integer f_buildwhere_4_copy (s_str_dwo_related vstr_dwo_related, t_dw_mpl vdw_match, ref string rs_joinclause, ref string rs_wherecluase);string					ls_where, ls_f_table, ls_t_table, ls_rf_table, ls_match_column[], ls_f_column[],ls_where_close,ls_minus_table
string					ls_coltype, ls_master_ID, ls_match_f_ID, ls_match_f_colname, lsa_match_f_col_obj[], ls_match_f_col_obj
string					ls_join, ls_select, ls_join_f_match, ls_join_obj, ls_join_objtrans, ls_from, ls_group_str, ls_join_colname, ls_master_object_id
int						li_cnt
boolean				lb_detail
datastore			lds_tmp
t_dw_mpl			ldw_main
c_string				lc_string
c_dwservice			lc_dwservice
window				lw_display


lds_tmp = create datastore
lds_tmp.dataobject = vstr_dwo_related.s_match_f_dwo[1]
ls_f_table = upper(lds_tmp.describe("DataWindow.Table.updatetable"))
lds_tmp.dataobject = vstr_dwo_related.s_match_t_dwo[1]
ls_t_table = upper(lds_tmp.describe("DataWindow.Table.updatetable"))
if upperbound(vstr_dwo_related.s_match_rf_dwo[]) > 0 then
	if vstr_dwo_related.s_match_rf_dwo[1] <> '' then
		lds_tmp.dataobject = vstr_dwo_related.s_match_rf_dwo[1]
		ls_rf_table = upper(lds_tmp.describe("DataWindow.Table.updatetable"))
	end if
end if
if upperbound(vstr_dwo_related.s_match_minus_dwo[]) > 0 then
	if vstr_dwo_related.s_match_minus_dwo[1] <> '' then
//		lds_tmp.dataobject = vstr_dwo_related.s_match_minus_dwo[1]
		lds_tmp.dataobject = lc_string.f_globalreplace( vstr_dwo_related.s_match_minus_dwo[1], ';', '')
		ls_minus_table = upper(lds_tmp.describe("DataWindow.Table.updatetable"))
	end if
end if
li_cnt = lc_string.f_stringtoarray( vstr_dwo_related.s_match_f_column[1] , ';', ls_f_column[])
li_cnt = lc_string.f_stringtoarray( vstr_dwo_related.s_match_column[1] , ';', ls_match_column[])
//-- build điều kiện của object match --//
if upperbound(vstr_dwo_related.s_match_f_col_obj[]) > 0 then
	li_cnt = lc_string.f_stringtoarray( vstr_dwo_related.s_match_f_col_obj[1] , ';', lsa_match_f_col_obj[])
end if
lb_detail = vdw_match.f_get_ib_detail() 
vdw_match.f_getparentwindow(lw_display)
ldw_main = lw_display.dynamic f_get_dwmain()
 
if lb_detail then
	ls_match_f_colname = ls_f_table+'.'+ ls_f_column[1]
	ls_match_f_ID =  ls_f_table+'.'+ 'ID'
	//-- build điều kiện của object match --//
	if upperbound(vstr_dwo_related.s_match_f_col_obj[]) > 0 then
		ls_match_f_col_obj =  ls_f_table+'.'+ lsa_match_f_col_obj[1]
	end if
else
	ls_match_f_colname =ls_f_column[1]
	if lc_dwservice.f_get_build_column(vdw_match, ls_match_f_colname, ls_coltype) = -1 then
		gf_messagebox('m.f_buildwhere_4_copy.01','Thông báo','Không lấy được tên cột của dwo:@'+vdw_match.dataobject,'exclamation','ok',1)
		return -1
	end if
	ls_match_f_ID = 'ID'
	lc_dwservice.f_get_build_column(vdw_match, ls_match_f_ID, ls_coltype) 
	//-- build điều kiện của object match --//
	if upperbound(vstr_dwo_related.s_match_f_col_obj[]) > 0 then
		ls_match_f_col_obj =  lsa_match_f_col_obj[1]
		lds_tmp.dataobject = vstr_dwo_related.s_match_f_dwo[1]
		if lc_dwservice.f_get_build_column(lds_tmp, ls_match_f_col_obj, ls_coltype) = -1 then
			gf_messagebox('m.f_buildwhere_4_copy.01','Thông báo','Không lấy được tên cột của dwo:@'+vdw_match.dataobject,'exclamation','ok',1)
			return -1
		end if		
		/*-- build from_clause của object match --//
			Chưa thực hiện
		---------------------*/		
	end if	
end if
if vdw_match.describe( "doc_id.coltype" ) = 'number' then
	ls_master_ID = 'ID'
	lc_dwservice.f_get_build_column(ldw_main, ls_master_ID, ls_coltype)
//	ls_join_colname = 'M1.F_DOC_ID'
	ls_join_colname = ls_f_table + '.doc_id'
	ls_master_object_id = 'DR_CR_OBJECT'
	lc_dwservice.f_get_build_column(ldw_main, ls_master_object_id, ls_coltype)
else
	ls_master_ID = 'VERSION_ID'
	lc_dwservice.f_get_build_column(ldw_main, ls_master_ID, ls_coltype)
	ls_join_colname = ls_f_table + '.object_ref_id'
end if

//-- --//
if vdw_match.describe( "close_yn.coltype" ) = 'char(1)' then
	if pos(ls_f_table,'POST_LINE') > 0 then
		if pos(vstr_dwo_related.s_main_dr_cr_obj_dwo_sum[1], '_sal_') > 0 then
			ls_where_close = " JOIN SAL_INVOICE_LINE SAL ON SAL.ID = "+ ls_f_table +".OBJECT_REF_ID WHERE NVL(SAL.CLOSE_YN,'N') = 'N' "
		else
			ls_where_close = " JOIN PUR_INVOICE_LINE SAL ON SAL.ID = "+ ls_f_table +".OBJECT_REF_ID WHERE NVL(SAL.CLOSE_YN,'N') = 'N' "
		end if
	else
		ls_where_close = " WHERE nvl("+ ls_f_table +".close_yn,'N') = 'N' "
	end if
end if

//-- builde joinclause của settle match_match --//
if upperbound(vstr_dwo_related.s_main_dr_cr_obj_dwo_sum[]) >0 then
	if vstr_dwo_related.s_main_dr_cr_obj_dwo_sum[1] <> '' then

	end if	
end if		

//-- builde joinclause của copy_match MỚI --//
if vstr_dwo_related.b_return then
	ls_from = " FROM (SELECT M1.F_DOC_ID, SUM(M1."+ls_match_column[1]+") "+ls_match_column[1]+" FROM  MATCHING M1 WHERE M1.T_REF_TABLE = '"+upper(ls_f_table)+"' GROUP BY M1.F_DOC_ID) M1"
elseif pos(upper(ls_f_table),'SO_LINE') > 0 then 
	//-- loại bỏ trường hợp kết với YCMH và đã trả hàng --//
	ls_from = " FROM (SELECT M1.F_DOC_ID, SUM(M1."+ls_match_column[1]+") "+ls_match_column[1]+" FROM  MATCHING M1 WHERE M1.T_REF_TABLE NOT IN ('PR_LINE','SO_LINE') GROUP BY M1.F_DOC_ID) M1"
else //-- loại bỏ object_trans trường hợp cấn trừ --//
	if ls_minus_table <> '' then
		ls_from = " FROM (SELECT M1.F_DOC_ID, SUM(M1."+ls_match_column[1]+") "+ls_match_column[1]+" FROM MATCHING M1 WHERE M1.F_REF_TABLE <> 'OBJECT_TRANS' AND M1.T_REF_TABLE <> '"+ls_minus_table+"' GROUP BY M1.F_DOC_ID) M1"
	else
		ls_from = " FROM (SELECT M1.F_DOC_ID, SUM(M1."+ls_match_column[1]+") "+ls_match_column[1]+" FROM MATCHING M1 WHERE M1.F_REF_TABLE <> 'OBJECT_TRANS' GROUP BY M1.F_DOC_ID) M1"
	end if
end if
	
if ls_match_f_col_obj <> '' then
 //-- loại bỏ mã hàng dịch vụ --//	
	ls_join_obj =  " JOIN object on object.id = "+ls_match_f_col_obj+" JOIN  item on item.object_ref_id = object.id and item.quantity_yn = 'Y'"
end if

if upperbound(vstr_dwo_related.s_main_dr_cr_obj_dwo_sum[]) > 0 then
	if vstr_dwo_related.s_main_dr_cr_obj_dwo_sum[1] <> '' then // trường hợp postline sum theo đối tượng công nợ --//
		ls_select = " LEFT JOIN (SELECT POST_LINE.DOCUMENT_ID GROUP_ID,POST_LINE.DR_CR_OBJECT, M1."+ls_match_column[1]+" T_VALUE, "+ls_match_f_colname+" F_VALUE"
		
		if pos(vstr_dwo_related.s_main_dr_cr_obj_dwo_sum[1], '_sal_') > 0 then
			ls_join_f_match = 	" JOIN (SELECT V_DOCUMENT_AR.ID DOCUMENT_ID,V_DOCUMENT_AR.DR_CR_OBJECT,  SUM("+ls_match_f_colname+") "+ls_f_column[1] &
									+" FROM "+ls_f_table+" JOIN  V_DOCUMENT_AR ON "+ls_join_colname+" = V_DOCUMENT_AR.ID AND V_DOCUMENT_AR.DR_CR_OBJECT = "&
									+ ls_f_table+".DR_OBJECT_ID "+ls_where_close+" GROUP BY V_DOCUMENT_AR.ID, V_DOCUMENT_AR.DR_CR_OBJECT ) "+ls_f_table+" ON M1.F_DOC_ID = "+ls_f_table+".DOCUMENT_ID"			
										
		else
			ls_join_f_match = 	" JOIN (SELECT V_DOCUMENT_AP.ID DOCUMENT_ID,V_DOCUMENT_AP.DR_CR_OBJECT,  SUM("+ls_match_f_colname+") "+ls_f_column[1] &
									+" FROM "+ls_f_table+" JOIN  V_DOCUMENT_AP ON "+ls_join_colname+" = V_DOCUMENT_AP.ID AND V_DOCUMENT_AP.DR_CR_OBJECT = "&
									+ ls_f_table+".CR_OBJECT_ID "+ls_where_close+" GROUP BY V_DOCUMENT_AP.ID, V_DOCUMENT_AP.DR_CR_OBJECT ) "+ls_f_table+" ON M1.F_DOC_ID = "+ls_f_table+".DOCUMENT_ID"	
		end if
	
		ls_group_str = " ) remain_match on remain_match.group_id =" + ls_master_ID + " AND remain_match.DR_CR_OBJECT = " + ls_master_object_id
	else
		ls_select = " LEFT JOIN (SELECT "+ls_join_colname+" GROUP_ID, M1."+ls_match_column[1]+" T_VALUE, "+ls_match_f_colname+" F_VALUE"
		
		ls_join_f_match = 	" JOIN (SELECT "+ls_join_colname+", DOCUMENT.ID DOCUMENT_ID,SUM("+ls_match_f_colname+") "+ls_f_column[1]+" FROM "+ls_f_table+" JOIN "+&
								" DOCUMENT ON "+ls_join_colname+" = "+ls_master_ID+" "+ls_join_obj + ls_where_close + " GROUP BY "+ls_join_colname+", DOCUMENT.ID) "+ls_f_table+" ON M1.F_DOC_ID = "+ls_f_table+".DOCUMENT_ID"		
		ls_group_str +=" having nvl("+ls_match_f_colname+",0.01) <= nvl(M1."+ls_match_column[1]+",0) group by "+ls_match_f_colname+",M1."+ls_match_column[1]+","+ls_join_colname+"  )"				
		
		//having nvl(INVENTORY_LINE.qty,0.01) > nvl(M1.qty,0)
		//group by INVENTORY_LINE.object_ref_id,M1.qty,INVENTORY_LINE.qty
		ls_group_str += "  remain_match on remain_match.group_id =" + ls_master_ID		
	end if
else 
	ls_select = " LEFT JOIN (SELECT "+ls_join_colname+" GROUP_ID, M1."+ls_match_column[1]+" T_VALUE, "+ls_match_f_colname+" F_VALUE"
	
	ls_join_f_match = 	" JOIN (SELECT "+ls_join_colname+", DOCUMENT.ID DOCUMENT_ID,SUM("+ls_match_f_colname+") "+ls_f_column[1]+" FROM "+ls_f_table+" JOIN "+&
							" DOCUMENT ON "+ls_join_colname+" = "+ls_master_ID+" "+ls_join_obj + ls_where_close + " GROUP BY "+ls_join_colname+", DOCUMENT.ID) "+ls_f_table+" ON M1.F_DOC_ID = "+ls_f_table+".DOCUMENT_ID"	
	ls_group_str +=" having nvl("+ls_match_f_colname+",0.01) = nvl(M1."+ls_match_column[1]+",0) group by "+ls_match_f_colname+",M1."+ls_match_column[1]+","+ls_join_colname+"  )"	
	ls_group_str += "  remain_match on remain_match.group_id =" + ls_master_ID		
end if
						

	 
ls_join = ls_select + ls_from+ ls_join_f_match +  ls_join_objtrans + ls_group_str

//-- Build where của settle match --//
ls_where = ' nvl(remain_match.f_value, 0.01) > nvl(remain_match.t_value,0) '	
//ls_where =  ' 1 = 1'


//	if lb_detail then
//		ls_master_table =  ldw_master.describe("DataWindow.Table.updatetable")
//		ls_where = this.f_buildwhere_4_copy_master( ls_where, ls_master_table, ldw_master)
//	end if

ls_join = lc_string.f_globalreplace( ls_join, "'", "~~'")
ls_where = lc_string.f_globalreplace( ls_where, "'", "~~'")
rs_joinclause = ls_join
rs_wherecluase = ls_where
destroy lds_tmp
return 1
end function

public function integer f_update_dwtabseq (ref s_object_display rod_handle, t_dw_mpl vdw_handle, t_dw_mpl vadw_none_md[]);/*=====================================
Lưu thuộc tính datawindow xuống database nếu user thay đổi
------------------------------------------*/
decimal			li_rowCnt, li_objectCnt, li_idx, li_row, li_cnt, li_width
string				ls_object[]
t_dw_mpl		ldw_detail[], ldw_share[], ldw_none_empty[]


//-- update dw tabseq --//
if vdw_handle.f_isgrid( ) then
	if vdw_handle.Describe("DataWindow.Syntax.Modified") = 'yes' then	
		rod_handle.ids_user_profile.setfilter("user_id = " +string(gi_userid)+ " AND dwobject= '" + vdw_handle.dataobject+"'")
		if rod_handle.ids_user_profile.filter( ) = -1 then
			gf_messagebox('m.s_w_multi.f_update_userprofile.01','Thông báo','Lỗi filter ids_user_profile:f_update_userprofile','stop','ok',1)
			return -1
		end if
		li_rowCnt =  rod_handle.ids_user_profile.rowcount()
		li_objectCnt = vdw_handle.f_get_object_in_taborder(ls_object[])
		if li_rowCnt = 0 then
			FOR li_idx = 1 to li_objectCnt
				li_row = rod_handle.ids_user_profile.insertrow( 0)
				rod_handle.ids_user_profile.setitem( li_row, 'user_id', gi_userid)
				rod_handle.ids_user_profile.setitem( li_row, 'object_name', rod_handle.classname() )
				rod_handle.ids_user_profile.setitem( li_row, 'dwobject', vdw_handle.dataobject)
				rod_handle.ids_user_profile.setitem( li_row, 'dwcontrol', ls_object[li_idx])
				rod_handle.ids_user_profile.setitem( li_row, 'tabseq', li_idx*10)
				li_width = integer(vdw_handle.describe(ls_object[li_idx]+'.width'))
				rod_handle.ids_user_profile.setitem( li_row, 'col_width', li_width)
			NEXT
		else
			FOR li_idx = 1 to li_objectCnt
				li_row = rod_handle.ids_user_profile.find( "dwcontrol= '"+ ls_object[li_idx] + "'", 1, li_rowCnt)
				if li_row > 0 then
					rod_handle.ids_user_profile.setitem( li_row, 'tabseq', li_idx*10)
					li_width = integer(vdw_handle.describe(ls_object[li_idx]+'.width'))
					rod_handle.ids_user_profile.setitem( li_row, 'col_width', li_width)					
				else
					li_row = rod_handle.ids_user_profile.insertrow( 0)
					rod_handle.ids_user_profile.setitem( li_row, 'user_id', gi_userid)
					rod_handle.ids_user_profile.setitem( li_row, 'object_name', rod_handle.classname() )
					rod_handle.ids_user_profile.setitem( li_row, 'dwobject', vdw_handle.dataobject)
					rod_handle.ids_user_profile.setitem( li_row, 'dwcontrol', ls_object[li_idx])
					rod_handle.ids_user_profile.setitem( li_row, 'tabseq', li_idx*10)
					li_width = integer(vdw_handle.describe(ls_object[li_idx]+'.width'))
					rod_handle.ids_user_profile.setitem( li_row, 'col_width', li_width)						
				end if
			NEXT			
		end if
		
		if rod_handle.ids_user_profile.update(true,false ) = 1 then
			commit using sqlca;	
			 rod_handle.ids_user_profile.resetupdate()
		else
			rollback using sqlca;
			messagebox('Lỗi','Không cập nhật được thuộc tính dataobject: '+vdw_handle.dataobject)
			return -1
		end if
		li_cnt = vdw_handle.f_getdwdetails(ldw_detail[])
		FOR li_idx = 1 to li_cnt
			if this.f_update_dwtabseq(rod_handle ,ldw_detail[li_idx], ldw_none_empty[]) = -1 then return -1
		NEXT
		li_cnt = vdw_handle.f_getdwshared(ldw_share[])
		FOR li_idx = 1 to li_cnt
			if this.f_update_dwtabseq(rod_handle ,ldw_share[li_idx], ldw_none_empty[]) = -1 then return -1
		NEXT		
	end if
else
	li_cnt = vdw_handle.f_getdwdetails(ldw_detail[])
	FOR li_idx = 1 to li_cnt
		if this.f_update_dwtabseq(rod_handle ,ldw_detail[li_idx], ldw_none_empty[]) = -1 then return -1
	NEXT
	li_cnt = vdw_handle.f_getdwshared(ldw_share[])
	FOR li_idx = 1 to li_cnt
		if this.f_update_dwtabseq(rod_handle ,ldw_share[li_idx], ldw_none_empty[]) = -1 then return -1
	NEXT			
end if
if upperbound( vadw_none_md[]) > 0 then
	FOR  li_idx =1 to upperbound( vadw_none_md[]) 
		if this.f_update_dwtabseq(rod_handle ,vadw_none_md[li_idx], ldw_none_empty[]) = -1 then return -1
	NEXT
end if

rod_handle.ids_user_profile.setfilter("")
rod_handle.ids_user_profile.filter( )

return 1
end function

public function string f_buildwhere_line_4_copy (s_str_dwo_related vstr_dwo_related, t_ds_db_ws vds_match);string					ls_where, ls_f_table, ls_t_table, ls_rf_table, ls_match_column[], ls_f_column[], ls_master_table , ls_from_clause
string					ls_coltype, ls_master_ID, ls_match_f_ID, ls_match_f_colname, lsa_match_f_col_obj[], ls_match_f_col_obj
int						li_cnt
boolean				lb_detail
datastore			lds_tmp
c_string				lc_string
c_dwservice			lc_dwservice

lds_tmp = create datastore
lds_tmp.dataobject = vstr_dwo_related.s_match_f_dwo[1]
//ls_f_table = upper(lds_tmp.describe("DataWindow.Table.updatetable"))
lds_tmp.dataobject = vstr_dwo_related.s_match_t_dwo[1]
ls_t_table = upper(lds_tmp.describe("DataWindow.Table.updatetable"))
if upperbound(vstr_dwo_related.s_match_rf_dwo[]) > 0 then
	if vstr_dwo_related.s_match_rf_dwo[1] <> '' then
		lds_tmp.dataobject = vstr_dwo_related.s_match_rf_dwo[1]
		ls_rf_table = upper(lds_tmp.describe("DataWindow.Table.updatetable"))
	end if
end if
li_cnt = lc_string.f_stringtoarray( vstr_dwo_related.s_match_f_column[1] , ';', ls_f_column[])
li_cnt = lc_string.f_stringtoarray( vstr_dwo_related.s_match_column[1] , ';', ls_match_column[])
//-- build điều kiện của object match --//
if upperbound(vstr_dwo_related.s_match_f_col_obj[]) > 0 then
	li_cnt = lc_string.f_stringtoarray( vstr_dwo_related.s_match_f_col_obj[1] , ';', lsa_match_f_col_obj[])
end if
lb_detail = vds_match.f_get_ib_detail() 

if lb_detail then
	ls_match_f_colname = ls_f_column[1]
	lc_dwservice.f_get_build_column(vds_match , ls_match_f_colname, ls_coltype)
	ls_match_f_ID = 'ID'
	lc_dwservice.f_get_build_column(vds_match , ls_match_f_ID, ls_coltype)

	if ls_rf_table = '' then
		ls_where = ls_match_f_colname + " > (select nvl(sum(M1."+ ls_match_column[1] +"),0) from MATCHING M1 where M1.F_REF_ID = " + &
							 ls_match_f_ID +" and upper(M1.T_REF_TABLE) = '"+ ls_t_table+ "') "	
	else
		ls_where = ls_match_f_colname + " > (select nvl(sum(M1."+ ls_match_column[1] +"),0) from MATCHING M1 where M1.F_REF_ID = " + &
						 ls_match_f_ID +" and upper(M1.T_REF_TABLE) = '"+ ls_t_table+ "') "  + &
						" + (select nvl(sum(M2."+ ls_match_column[1] +"),0) from MATCHING M2 where M2.F_REF_ID = " + &
					 	ls_match_f_ID +" and upper(M2.T_REF_TABLE) = '"+ ls_rf_table+ "') "
	end if

end if



ls_where = lc_string.f_globalreplace( ls_where, "'", "~~'")

destroy lds_tmp
return ls_where
end function

public function string f_buildwhere_rec_security_ws (t_ds_db_ws vds_record, string vs_dwo, string vs_object_name);t_s_querymode_criteria	lstr_qr_criteria[]
s_str_criteria_rec			lstr_criteria_rec[],lstr_criteria_rec_build[],lstr_criteria_rec_or,lstr_criteria_rec_empty
c_dw_querymode			lc_querymode
s_w_main					lw_display
s_object_display			lod_handle
t_dw_mpl					ldw_requestor,ldw_master,ldw_master_rc
b_rule						lc_rule
c_string						lc_string
boolean						lb_full = false
double						ldb_rule_id[],ldb_rule_id_deligate[]
string							ls_each_where,ls_total_where,ls_object_name,ls_where,ls_each_where_1
int								li_idx,li_count,li_idx2,li_rtn,li_idx3

if vds_record.typeof() = datastore! then
	lod_handle = vds_record.getparent()
//	vds_record.dynamic f_getparentwindow(lw_display)
elseif vds_record.typeof() = datawindowchild! then
//	lw_display = vds_record.dynamic getparent( )
end if
li_rtn = lc_rule.f_get_appli_rule_id( ldb_rule_id, gi_userid, vs_dwo,'record',vs_object_name)
if li_rtn > 0 then 
	if lc_rule.f_get_appli_deligate_rule_id( ldb_rule_id_deligate, gi_userid, vs_dwo,'record',vs_object_name) > 0 then
		for li_idx = 1 to upperbound(ldb_rule_id_deligate)
			ldb_rule_id[upperbound(ldb_rule_id)+1] = ldb_rule_id_deligate[li_idx]
		next
	end if
	for li_idx = 1 to upperbound(ldb_rule_id)
		this.f_build_rec_criteria( ldb_rule_id[li_idx], lstr_criteria_rec_build)
	next
end if

li_count = upperbound(lstr_criteria_rec_build)
if li_count > 0 then
	ldw_requestor = lw_display.f_get_dw(vds_record.dynamic f_get_dataobject() )
	ldw_master_rc = ldw_requestor.f_getdwmaster( )
	lc_querymode = ldw_master_rc.inv_querymode
	for li_idx=1 to li_count
		//-- Trường hợp nếu 2 quyền có phân quyền trên cùng 1 dw chỉ khác cột --//
		if li_idx > 1 then
			for li_idx2 = 1 to upperbound(lstr_criteria_rec_build[li_idx].s_dwobject)
				lstr_criteria_rec_or = lstr_criteria_rec_empty
				for li_idx3 = 1 to upperbound(lstr_criteria_rec_build[li_idx - 1].s_dwobject)
					if lstr_criteria_rec_build[li_idx].s_dwobject[li_idx2] = lstr_criteria_rec_build[li_idx - 1].s_dwobject[li_idx3] then
						lstr_criteria_rec_or.s_criteria_rec[upperbound(lstr_criteria_rec_or.s_criteria_rec) + 1] =lstr_criteria_rec_build[li_idx - 1].s_criteria_rec[li_idx3]
						lstr_criteria_rec_or.s_dwcolumn_rec[upperbound(lstr_criteria_rec_or.s_dwcolumn_rec) + 1] =lstr_criteria_rec_build[li_idx - 1].s_dwcolumn_rec[li_idx3]
						lstr_criteria_rec_or.s_dwobject[upperbound(lstr_criteria_rec_or.s_dwobject) + 1] =lstr_criteria_rec_build[li_idx - 1].s_dwobject[li_idx3]
					end if
				next
				if upperbound(lstr_criteria_rec_or.s_dwobject) > 0 then
					lstr_criteria_rec_or.s_criteria_rec[upperbound(lstr_criteria_rec_or.s_criteria_rec) + 1] =lstr_criteria_rec_build[li_idx ].s_criteria_rec[li_idx2]
					lstr_criteria_rec_or.s_dwcolumn_rec[upperbound(lstr_criteria_rec_or.s_dwcolumn_rec) + 1] =lstr_criteria_rec_build[li_idx].s_dwcolumn_rec[li_idx2]
					lstr_criteria_rec_or.s_dwobject[upperbound(lstr_criteria_rec_or.s_dwobject) + 1] =lstr_criteria_rec_build[li_idx ].s_dwobject[li_idx2]
					for  li_idx3 = 1 to upperbound(lstr_criteria_rec_or.s_criteria_rec)
						if li_idx3 = 1 then ldw_requestor = lw_display.f_get_dw(lstr_criteria_rec_or.s_dwobject[li_idx3] + '_grid' )
						if isvalid(ldw_requestor) then
							ldw_master = ldw_requestor.f_getdwmaster( )
							if li_idx3=1 then
								ldw_master.inv_querymode.ib_rec = true
								ldw_requestor.event e_query( )
							end if
							ldw_requestor.inv_querymode.event e_itemchanged(ldw_requestor.getrow( ), lstr_criteria_rec_or.s_dwcolumn_rec[li_idx3], lstr_criteria_rec_or.s_criteria_rec[li_idx3])
							ldw_requestor.inv_querymode.f_getquerycriterias(lstr_qr_criteria)
							lstr_qr_criteria[upperbound(lstr_qr_criteria)].is_expression = ' OR '
							ldw_requestor.inv_querymode.f_setquerycriteria(lstr_qr_criteria)
							if li_idx3 = upperbound(lstr_criteria_rec_build[li_idx].s_criteria_rec ) then ldw_requestor.event e_execquery( )
//							ldw_requestor.inv_querymode.f_querymode( false)
							ls_where = 'RECORD'
						end if
					next
					ldw_requestor.inv_querymode.f_querymode( false)
					ls_total_where = trim(lc_string.f_globalreplace( ls_total_where, ls_each_where_1 , ' '))
				end if
			next
		end if
		if ls_total_where <> '' and len(ls_total_where) > 0 then 
			if ls_each_where_1 <> '' then 
				ls_total_where += ' AND '
			else
				ls_total_where += ' OR '
			end if
		end if
		ls_each_where_1 = ''
		if upperbound(lstr_criteria_rec_or.s_dwobject) = 0 then
			for li_idx2=1 to upperbound(lstr_criteria_rec_build[li_idx].s_criteria_rec )
				if lstr_criteria_rec_build[li_idx].s_dwcolumn_rec[li_idx2]  = 'full.full' then
					lb_full = true
					exit
				end if
				if ls_each_where <> '' then ls_each_where += ' AND '
				if pos(vs_dwo,lstr_criteria_rec_build[li_idx].s_dwobject[li_idx2]) > 0 then
					ls_each_where += this.f_buildwhereclause( vds_record, lstr_criteria_rec_build[li_idx].s_dwcolumn_rec[li_idx2], lstr_criteria_rec_build[li_idx].s_criteria_rec[li_idx2])
				else
					if ls_where <>  'RECORD' then
						ldw_requestor = lw_display.f_get_dw(lstr_criteria_rec_build[li_idx].s_dwobject[li_idx2] + '_grid' )
						if isvalid(ldw_requestor) then
							ldw_master = ldw_requestor.f_getdwmaster( )
							if li_idx2=1 then
								ldw_master.inv_querymode.ib_rec = true
								ldw_requestor.event e_query( )
							end if
							ldw_requestor.inv_querymode.event e_itemchanged(ldw_requestor.getrow( ), lstr_criteria_rec_build[li_idx].s_dwcolumn_rec[li_idx2], lstr_criteria_rec_build[li_idx].s_criteria_rec[li_idx2])
							if li_idx2 = upperbound(lstr_criteria_rec_build[li_idx].s_criteria_rec ) then ldw_requestor.event e_execquery( )
							ls_where = 'RECORD'
						end if
					end if
				end if
			next
			if lb_full then 
				ls_total_where = ''
				exit
			end if
		end if
		if ls_where = 'RECORD' then
			ldw_master_rc.inv_querymode.ib_rec = true
			ldw_requestor.event e_execquery( )
			ls_each_where_1 = ldw_master_rc.inv_querymode.f_getquerywhereclause( )
			ls_where = ldw_master.describe( "Datawindow.Table.Select")
		end if
		if ls_each_where_1 <> '' and ls_each_where <> ''  then
			ls_each_where_1 =' AND ' + ls_each_where_1 
			ls_total_where += '(' + ls_each_where + ')' + ls_each_where_1
		elseif ls_each_where_1 <> '' then
			ls_total_where += ls_each_where_1 
		else
			ls_total_where += '(' + ls_each_where + ')'
		end if
		ls_each_where = ''
	next
	if vds_record.typeof() = datawindow! then
		//--lưu các rule_id của user --//
		vds_record.dynamic f_set_rule_id_rec(ldb_rule_id)
		//--lưu struct buildwhere record--//
		if vds_record. f_get_criteria_record( lstr_criteria_rec) = 0 then
			vds_record.dynamic f_set_criteria_record(lstr_criteria_rec_build )
		end if
	end if
	ldw_master_rc.inv_querymode = lc_querymode
end if
return ls_total_where
end function

public function boolean f_is_company (datawindowchild vdwc_handle);string		ls_coltype


ls_coltype = vdwc_handle.Describe ("company_id.coltype" )
if ls_coltype = '!' then 
	return false
else
	return true
end if


end function

public function boolean f_is_branch (datawindowchild vdwc_handle);string		ls_coltype


ls_coltype = vdwc_handle.Describe ("branch_id.coltype" )
if ls_coltype = '!' then 
	return false
else
	return true
end if


end function

public function integer f_copy (datawindow vdw_master, datawindow vdw_copied, ref t_ds_db rds_copied, boolean vb_selected_copy);long		ll_find
/**********************************************************************
vb_selected_copy: 
	- TRUE: nếu không chọn , không copy record nào hết
	- FALSE: nếu không chọn copy tất cả record
===============================================================*/

if vdw_copied.rowcount( ) > 0 then
	if vb_selected_copy then
		if vdw_copied. dynamic f_isgrid() then ll_find = vdw_copied.find("gutter = 'Y'",1,vdw_copied.rowcount())
		if ll_find > 0 then
			if this.f_copy_f_t( vdw_copied, rds_copied, 0, 0) = -1 then return -1
		else
			return 0  //-- không chọn không copy --//
		end if
	else
		if vdw_copied. dynamic f_isgrid() then ll_find = vdw_copied.find("gutter = 'Y'",1,vdw_copied.rowcount())
		if ll_find > 0 then
			if this.f_copy_f_t( vdw_copied, rds_copied, 0, 0) = -1 then return -1
		else // Không chọn copy tất cả --//
			if this.f_copy_f_t( vdw_copied, rds_copied, 1, vdw_copied.rowcount( )) = -1 then return -1
		end if		
	end if
end if
return 1
end function

public function long f_set_gutter_rowcount (ref datawindowchild rdwc);

long		ll_rowCnt,ll_len
string		ls_gutter_text

if rdwc.describe( "gutter_t.x") <> '?' and rdwc.describe( "gutter_t.x") <> '!' then
	ll_rowCnt = rdwc.rowcount( )
	rdwc.modify( "gutter_t.text = '["+string(ll_rowCnt) +"]'" )
	ls_gutter_text = rdwc.describe( "gutter_t.text")
	ll_len =len(ls_gutter_text)*35
	rdwc.modify( "gutter_t.x = 9 gutter_t.width="+string(ll_len))
	rdwc.modify( "gutter.x = 9 gutter.width="+string(ll_len))
	rdwc.modify( "b_form.x =9 b_form.width="+string(ll_len))	
	rdwc.modify("gutter_t.color  = '" +string(rgb(0,0,255))+"'")
end if
return ll_rowCnt
end function

public function string f_buildwhere_rec_security_ex (powerobject vdw_record, string vs_dwo, string vs_object_name, ref t_transaction rt_transaction);t_s_querymode_criteria	lstr_qr_criteria[]
s_str_criteria_rec			lstr_criteria_rec[],lstr_criteria_rec_build[],lstr_criteria_rec_or,lstr_criteria_rec_empty
c_dw_querymode			lc_querymode
s_w_main					lw_display
t_dw_mpl					ldw_requestor,ldw_master,ldw_master_rc
b_rule						lc_rule
c_string						lc_string
boolean						lb_full = false
double						ldb_rule_id[],ldb_rule_id_deligate[]
string							ls_each_where,ls_total_where,ls_object_name,ls_where,ls_each_where_1
int								li_idx,li_count,li_idx2,li_rtn,li_idx3

if vdw_record.typeof() = datawindow! then
	vdw_record.dynamic f_getparentwindow(lw_display)
//elseif vdw_record.typeof() = datawindowchild! then
//	lw_display = vdw_record.dynamic getparent( )
end if
li_rtn = lc_rule.f_get_appli_rule_id_ex( ldb_rule_id, gi_userid, vs_dwo,'record',vs_object_name, rt_transaction)
if li_rtn > 0 then 
	if lc_rule.f_get_appli_deligate_rule_id_ex( ldb_rule_id_deligate, gi_userid, vs_dwo,'record',vs_object_name,rt_transaction) > 0 then
		for li_idx = 1 to upperbound(ldb_rule_id_deligate)
			ldb_rule_id[upperbound(ldb_rule_id)+1] = ldb_rule_id_deligate[li_idx]
		next
	end if
	for li_idx = 1 to upperbound(ldb_rule_id)
		this.f_build_rec_criteria_ex( ldb_rule_id[li_idx], lstr_criteria_rec_build, rt_transaction)
	next
end if

li_count = upperbound(lstr_criteria_rec_build)
if li_count > 0 then
	ldw_requestor = lw_display.f_get_dw(vdw_record.dynamic f_get_dataobject() )
	ldw_master_rc = ldw_requestor.f_getdwmaster( )
	lc_querymode = ldw_master_rc.inv_querymode
	for li_idx=1 to li_count
		//-- Trường hợp nếu 2 quyền có phân quyền trên cùng 1 dw chỉ khác cột --//
		if li_idx > 1 then
			for li_idx2 = 1 to upperbound(lstr_criteria_rec_build[li_idx].s_dwobject)
				lstr_criteria_rec_or = lstr_criteria_rec_empty
				for li_idx3 = 1 to upperbound(lstr_criteria_rec_build[li_idx - 1].s_dwobject)
					if lstr_criteria_rec_build[li_idx].s_dwobject[li_idx2] = lstr_criteria_rec_build[li_idx - 1].s_dwobject[li_idx3] then
						lstr_criteria_rec_or.s_criteria_rec[upperbound(lstr_criteria_rec_or.s_criteria_rec) + 1] =lstr_criteria_rec_build[li_idx - 1].s_criteria_rec[li_idx3]
						lstr_criteria_rec_or.s_dwcolumn_rec[upperbound(lstr_criteria_rec_or.s_dwcolumn_rec) + 1] =lstr_criteria_rec_build[li_idx - 1].s_dwcolumn_rec[li_idx3]
						lstr_criteria_rec_or.s_dwobject[upperbound(lstr_criteria_rec_or.s_dwobject) + 1] =lstr_criteria_rec_build[li_idx - 1].s_dwobject[li_idx3]
					end if
				next
				if upperbound(lstr_criteria_rec_or.s_dwobject) > 0 then
					lstr_criteria_rec_or.s_criteria_rec[upperbound(lstr_criteria_rec_or.s_criteria_rec) + 1] =lstr_criteria_rec_build[li_idx ].s_criteria_rec[li_idx2]
					lstr_criteria_rec_or.s_dwcolumn_rec[upperbound(lstr_criteria_rec_or.s_dwcolumn_rec) + 1] =lstr_criteria_rec_build[li_idx].s_dwcolumn_rec[li_idx2]
					lstr_criteria_rec_or.s_dwobject[upperbound(lstr_criteria_rec_or.s_dwobject) + 1] =lstr_criteria_rec_build[li_idx ].s_dwobject[li_idx2]
					/*
					for  li_idx3 = 1 to upperbound(lstr_criteria_rec_or.s_criteria_rec)
						if li_idx3 = 1 then ldw_requestor = lw_display.f_get_dw(lstr_criteria_rec_or.s_dwobject[li_idx3] + '_grid' )
						if isvalid(ldw_requestor) then
							ldw_master = ldw_requestor.f_getdwmaster( )
							if li_idx3=1 then
								ldw_master.inv_querymode.ib_rec = true
								ldw_requestor.event e_query( )
							end if
							ldw_requestor.inv_querymode.event e_itemchanged(ldw_requestor.getrow( ), lstr_criteria_rec_or.s_dwcolumn_rec[li_idx3], lstr_criteria_rec_or.s_criteria_rec[li_idx3])
							ldw_requestor.inv_querymode.f_getquerycriterias(lstr_qr_criteria)
							lstr_qr_criteria[upperbound(lstr_qr_criteria)].is_expression = ' OR '
							ldw_requestor.inv_querymode.f_setquerycriteria(lstr_qr_criteria)
							if li_idx3 = upperbound(lstr_criteria_rec_build[li_idx].s_criteria_rec ) then ldw_requestor.event e_execquery( )
//							ldw_requestor.inv_querymode.f_querymode( false)
							ls_where = 'RECORD'
						end if
					next
					
					ldw_requestor.inv_querymode.f_querymode( false)
					*/
					ls_total_where = trim(lc_string.f_globalreplace( ls_total_where, ls_each_where_1 , ' '))
				end if
			next
		end if
		if ls_total_where <> '' and len(ls_total_where) > 0 then 
			if ls_each_where_1 <> '' then 
				if upperbound(lstr_criteria_rec_build)> 1 then
					ls_total_where += ' OR '
				else
					ls_total_where += ' AND '
				end if
			else
				ls_total_where += ' OR '
			end if
		end if
		ls_each_where_1 = ''
		if upperbound(lstr_criteria_rec_or.s_dwobject) = 0 then
			for li_idx2=1 to upperbound(lstr_criteria_rec_build[li_idx].s_criteria_rec )
				if lstr_criteria_rec_build[li_idx].s_dwcolumn_rec[li_idx2]  = 'full.full' then
					lb_full = true
					exit
				end if
				if ls_each_where <> '' then ls_each_where += ' AND '
				if pos(vs_dwo,lstr_criteria_rec_build[li_idx].s_dwobject[li_idx2]) > 0 then
					ls_each_where += this.f_buildwhereclause( vdw_record, lstr_criteria_rec_build[li_idx].s_dwcolumn_rec[li_idx2], lstr_criteria_rec_build[li_idx].s_criteria_rec[li_idx2])
				else
					/*
					if ls_where <>  'RECORD' then
						ldw_requestor = lw_display.f_get_dw(lstr_criteria_rec_build[li_idx].s_dwobject[li_idx2] + '_grid' )
						if isvalid(ldw_requestor) then
							ldw_master = ldw_requestor.f_getdwmaster( )
							if li_idx2=1 then
								ldw_master.inv_querymode.ib_rec = true
								ldw_requestor.event e_query( )
							end if
							ldw_requestor.inv_querymode.event e_itemchanged(ldw_requestor.getrow( ), lstr_criteria_rec_build[li_idx].s_dwcolumn_rec[li_idx2], lstr_criteria_rec_build[li_idx].s_criteria_rec[li_idx2])
							if li_idx2 = upperbound(lstr_criteria_rec_build[li_idx].s_criteria_rec ) then ldw_requestor.event e_execquery( )
							ls_where = 'RECORD'
						end if
						
					end if
					*/
				end if
			next
			if lb_full then 
				ls_total_where = ''
				exit
			end if
		end if
		if ls_where = 'RECORD' then
			ldw_master_rc.inv_querymode.ib_rec = true
			ldw_requestor.event e_execquery( )
			ls_each_where_1 = ldw_master_rc.inv_querymode.f_getquerywhereclause( )
			ls_where = ldw_master.describe( "Datawindow.Table.Select")
		end if
		if ls_each_where_1 <> '' and ls_each_where <> ''  then
			ls_each_where_1 =' AND ' + ls_each_where_1 
			ls_total_where += '(' + ls_each_where + ')' + ls_each_where_1
		elseif ls_each_where_1 <> '' then
			ls_total_where += ls_each_where_1 
		else
			ls_total_where += '(' + ls_each_where + ')'
		end if
		ls_each_where = ''
	next
	if vdw_record.typeof() = datawindow! then
		//--lưu các rule_id của user --//
		vdw_record.dynamic f_set_rule_id_rec(ldb_rule_id)
		//--lưu struct buildwhere record--//
		if vdw_record.dynamic f_get_criteria_record( lstr_criteria_rec) = 0 then
			vdw_record.dynamic f_set_criteria_record(lstr_criteria_rec_build )
		end if
	end if
	ldw_master_rc.inv_querymode = lc_querymode
end if
return ls_total_where
end function

public function integer f_update_dwtabseq_ex (ref s_object_display rod_handle, t_dw_mpl vdw_handle, t_dw_mpl vadw_none_md[], ref t_transaction rt_transaction);/*=====================================
Lưu thuộc tính datawindow xuống database nếu user thay đổi
------------------------------------------*/
decimal			li_rowCnt, li_objectCnt, li_idx, li_row, li_cnt, li_width
string				ls_object[]
t_dw_mpl		ldw_detail[], ldw_share[], ldw_none_empty[]


//-- update dw tabseq --//
if vdw_handle.f_isgrid( ) then
	if vdw_handle.Describe("DataWindow.Syntax.Modified") = 'yes' then	
		rod_handle.ids_user_profile.setfilter("user_id = " +string(gi_userid)+ " AND dwobject= '" + vdw_handle.dataobject+"'")
		if rod_handle.ids_user_profile.filter( ) = -1 then
			gf_messagebox('m.s_w_multi.f_update_userprofile.01','Thông báo','Lỗi filter ids_user_profile:f_update_userprofile','stop','ok',1)
			return -1
		end if
		li_rowCnt =  rod_handle.ids_user_profile.rowcount()
		li_objectCnt = vdw_handle.f_get_object_in_taborder(ls_object[])
		if li_rowCnt = 0 then
			FOR li_idx = 1 to li_objectCnt
				li_row = rod_handle.ids_user_profile.insertrow( 0)
				rod_handle.ids_user_profile.setitem( li_row, 'user_id', gi_userid)
				rod_handle.ids_user_profile.setitem( li_row, 'object_name', rod_handle.classname() )
				rod_handle.ids_user_profile.setitem( li_row, 'dwobject', vdw_handle.dataobject)
				rod_handle.ids_user_profile.setitem( li_row, 'dwcontrol', ls_object[li_idx])
				rod_handle.ids_user_profile.setitem( li_row, 'tabseq', li_idx*10)
				li_width = integer(vdw_handle.describe(ls_object[li_idx]+'.width'))
				rod_handle.ids_user_profile.setitem( li_row, 'col_width', li_width)
			NEXT
		else
			FOR li_idx = 1 to li_objectCnt
				li_row = rod_handle.ids_user_profile.find( "dwcontrol= '"+ ls_object[li_idx] + "'", 1, li_rowCnt)
				if li_row > 0 then
					rod_handle.ids_user_profile.setitem( li_row, 'tabseq', li_idx*10)
					li_width = integer(vdw_handle.describe(ls_object[li_idx]+'.width'))
					rod_handle.ids_user_profile.setitem( li_row, 'col_width', li_width)					
				else
					li_row = rod_handle.ids_user_profile.insertrow( 0)
					rod_handle.ids_user_profile.setitem( li_row, 'user_id', gi_userid)
					rod_handle.ids_user_profile.setitem( li_row, 'object_name', rod_handle.classname() )
					rod_handle.ids_user_profile.setitem( li_row, 'dwobject', vdw_handle.dataobject)
					rod_handle.ids_user_profile.setitem( li_row, 'dwcontrol', ls_object[li_idx])
					rod_handle.ids_user_profile.setitem( li_row, 'tabseq', li_idx*10)
					li_width = integer(vdw_handle.describe(ls_object[li_idx]+'.width'))
					rod_handle.ids_user_profile.setitem( li_row, 'col_width', li_width)						
				end if
			NEXT			
		end if
		rod_handle.ids_user_profile.settransobject( rt_transaction)
		if rod_handle.ids_user_profile.update(true,false ) = 1 then
			commit using rt_transaction;	
			 rod_handle.ids_user_profile.resetupdate()
		else
			rollback using rt_transaction;
			messagebox('Lỗi','Không cập nhật được thuộc tính dataobject: '+vdw_handle.dataobject)
			return -1
		end if
		li_cnt = vdw_handle.f_getdwdetails(ldw_detail[])
		FOR li_idx = 1 to li_cnt
			if this.f_update_dwtabseq_ex(rod_handle ,ldw_detail[li_idx], ldw_none_empty[], rt_transaction) = -1 then return -1
		NEXT
		li_cnt = vdw_handle.f_getdwshared(ldw_share[])
		FOR li_idx = 1 to li_cnt
			if this.f_update_dwtabseq_ex(rod_handle ,ldw_share[li_idx], ldw_none_empty[],rt_transaction) = -1 then return -1
		NEXT		
	end if
else
	li_cnt = vdw_handle.f_getdwdetails(ldw_detail[])
	FOR li_idx = 1 to li_cnt
		if this.f_update_dwtabseq_ex(rod_handle ,ldw_detail[li_idx], ldw_none_empty[], rt_transaction) = -1 then return -1
	NEXT
	li_cnt = vdw_handle.f_getdwshared(ldw_share[])
	FOR li_idx = 1 to li_cnt
		if this.f_update_dwtabseq_ex(rod_handle ,ldw_share[li_idx], ldw_none_empty[], rt_transaction) = -1 then return -1
	NEXT			
end if
if upperbound( vadw_none_md[]) > 0 then
	FOR  li_idx =1 to upperbound( vadw_none_md[]) 
		if this.f_update_dwtabseq_ex(rod_handle ,vadw_none_md[li_idx], ldw_none_empty[],rt_transaction) = -1 then return -1
	NEXT
end if

rod_handle.ids_user_profile.setfilter("")
rod_handle.ids_user_profile.filter( )

return 1
end function

public function integer f_update_resize_parm_ex (ref s_object_display rod_handle, ref t_transaction rt_transaction);long			ll_row
window		lw_display
t_t				l_tab

lw_display = rod_handle.f_get_wdisplay()

ll_row = rod_handle.ids_user_profile.find("USER_ID = "+string(gi_userid) +" AND isnull(dwobject) AND dwcontrol = 'ii_upperpart_height'",1,rod_handle.ids_user_profile.rowcount())
if ll_row > 0 then
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq',lw_display.dynamic f_get_ii_upperpart_height() )
else
	ll_row = rod_handle.ids_user_profile.insertrow(0)
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', lw_display.dynamic f_get_ii_upperpart_height() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_upperpart_height' )	
	rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )	
end if

ll_row = rod_handle.ids_user_profile.find("USER_ID = "+string(gi_userid) +" AND isnull(dwobject)  AND dwcontrol = 'ii_leftpart_width'",1,rod_handle.ids_user_profile.rowcount())
if ll_row > 0 then
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq',lw_display.dynamic f_get_ii_leftpart_width() )
else
	ll_row = rod_handle.ids_user_profile.insertrow(0)
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', lw_display.dynamic f_get_ii_leftpart_width() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_leftpart_width' )
	rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )
end if

ll_row = rod_handle.ids_user_profile.find("USER_ID = "+string(gi_userid) +" AND isnull(dwobject)  AND dwcontrol = 'ii_midpart_width'",1,rod_handle.ids_user_profile.rowcount())
if ll_row > 0 then
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq',lw_display.dynamic f_get_ii_midpart_width() )
else
	ll_row = rod_handle.ids_user_profile.insertrow(0)
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', lw_display.dynamic f_get_ii_midpart_width() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_midpart_width' )
	rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )
end if

ll_row = rod_handle.ids_user_profile.find("USER_ID = "+string(gi_userid) + " AND isnull(dwobject)  AND dwcontrol = 'ii_gb_11_width'",1,rod_handle.ids_user_profile.rowcount())
if ll_row > 0 then
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq',lw_display.dynamic f_get_ii_gb_11_width() )
else
	ll_row = rod_handle.ids_user_profile.insertrow(0)
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', lw_display.dynamic f_get_ii_gb_11_width() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_gb_11_width' )
	rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )
end if

ll_row = rod_handle.ids_user_profile.find("USER_ID = "+string(gi_userid) +" AND isnull(dwobject)  AND dwcontrol = 'ii_fixedpart1_height'",1,rod_handle.ids_user_profile.rowcount())
if ll_row > 0 then
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq',lw_display.dynamic f_get_ii_fixedpart1_height() )
else
	ll_row = rod_handle.ids_user_profile.insertrow(0)
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', lw_display.dynamic f_get_ii_fixedpart1_height() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_fixedpart1_height' )
	rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )
end if

ll_row = rod_handle.ids_user_profile.find("USER_ID = "+string(gi_userid) + " AND isnull(dwobject)  AND dwcontrol = 'ii_fixedpart2_height'",1,rod_handle.ids_user_profile.rowcount())
if ll_row > 0 then
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq',lw_display.dynamic f_get_ii_fixedpart2_height() )
else
	ll_row = rod_handle.ids_user_profile.insertrow(0)
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', lw_display.dynamic f_get_ii_fixedpart2_height() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_fixedpart2_height' )
	rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )
end if

ll_row = rod_handle.ids_user_profile.find("USER_ID = "+string(gi_userid) + " AND isnull(dwobject)  AND dwcontrol = 'ii_fixedpart3_height'",1,rod_handle.ids_user_profile.rowcount())
if ll_row > 0 then
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq',lw_display.dynamic f_get_ii_fixedpart3_height() )
else
	ll_row = rod_handle.ids_user_profile.insertrow(0)
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', lw_display.dynamic f_get_ii_fixedpart3_height() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_fixedpart3_height' )
	rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )
end if

ll_row = rod_handle.ids_user_profile.find("USER_ID = "+string(gi_userid) +" AND isnull(dwobject)  AND dwcontrol = 'ii_gb_3_height'",1,rod_handle.ids_user_profile.rowcount())
if ll_row > 0 then
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq',lw_display.dynamic f_get_ii_gb_3_height() )
else
	ll_row = rod_handle.ids_user_profile.insertrow(0)
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', lw_display.dynamic f_get_ii_gb_3_height() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_gb_3_height' )	
	rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )
end if

ll_row = rod_handle.ids_user_profile.find("USER_ID = "+string(gi_userid) +" AND isnull(dwobject)  AND dwcontrol = 'ii_gb_4_height'",1,rod_handle.ids_user_profile.rowcount())
if ll_row > 0 then
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq',lw_display.dynamic f_get_ii_gb_4_height() )
else
	ll_row = rod_handle.ids_user_profile.insertrow(0)
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', lw_display.dynamic f_get_ii_gb_4_height() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_gb_4_height' )
	rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )
end if

ll_row = rod_handle.ids_user_profile.find("USER_ID = "+string(gi_userid) + " AND isnull(dwobject)  AND dwcontrol = 'ii_gb_5_height'",1,rod_handle.ids_user_profile.rowcount())
if ll_row > 0 then
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', lw_display.dynamic f_get_ii_gb_5_height() )
else
	ll_row = rod_handle.ids_user_profile.insertrow(0)
	rod_handle.ids_user_profile.setitem(ll_row, 'tabseq', lw_display.dynamic f_get_ii_gb_5_height() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'object_name', rod_handle.classname() )	
	rod_handle.ids_user_profile.setitem(ll_row, 'dwcontrol', 'ii_gb_5_height' )	
	rod_handle.ids_user_profile.setitem(ll_row, 'USER_ID', gi_userid )
end if

//-- update tabpage parm --//
l_tab = lw_display.dynamic f_get_tab_1()
if isvalid(l_tab) then
	this.f_update_tabpage_resize_parm( rod_handle, l_tab)
end if
rod_handle.ids_user_profile.settransobject(rt_transaction)
if rod_handle.ids_user_profile.update(true,false ) = 1 then
	commit using rt_transaction;	
	return rod_handle.ids_user_profile.resetupdate()
else
	rollback using rt_transaction;
	messagebox('Lỗi','Không cập nhật được resize parm')
	return -1
end if

end function

public function string f_buildwhere_rec_security_ex (powerobject vdw_record, string vs_dwo, string vs_object_name);t_s_querymode_criteria	lstr_qr_criteria[]
s_str_criteria_rec			lstr_criteria_rec[],lstr_criteria_rec_build[],lstr_criteria_rec_or,lstr_criteria_rec_empty
c_dw_querymode			lc_querymode
s_w_main					lw_display
t_dw_mpl					ldw_requestor,ldw_master,ldw_master_rc
b_rule						lc_rule
c_string						lc_string
t_transaction				lt_transaction
boolean						lb_full = false
double						ldb_rule_id[],ldb_rule_id_deligate[]
string							ls_each_where,ls_total_where,ls_object_name,ls_where,ls_each_where_1
int								li_idx,li_count,li_idx2,li_rtn,li_idx3

//-- Tạo connection voi database --//
lt_transaction = create t_transaction
lt_transaction.dbms =	SQLCA.DBMS
lt_transaction.ServerName	 = SQLCA.ServerName
lt_transaction.LogId	 = SQLCA.LogId
lt_transaction.LogPass 	 = SQLCA.LogPass 
lt_transaction.AutoCommit 	 = false 
lt_transaction.DBParm	 = SQLCA.DBParm
connect using	lt_transaction;	


if vdw_record.typeof() = datawindow! then
	vdw_record.dynamic f_getparentwindow(lw_display)
//elseif vdw_record.typeof() = datawindowchild! then
//	lw_display = vdw_record.dynamic getparent( )
end if
li_rtn = lc_rule.f_get_appli_rule_id_ex( ldb_rule_id, gi_userid, vs_dwo,'record',vs_object_name, lt_transaction)
if li_rtn > 0 then 
	if lc_rule.f_get_appli_deligate_rule_id_ex( ldb_rule_id_deligate, gi_userid, vs_dwo,'record',vs_object_name, lt_transaction) > 0 then
		for li_idx = 1 to upperbound(ldb_rule_id_deligate)
			ldb_rule_id[upperbound(ldb_rule_id)+1] = ldb_rule_id_deligate[li_idx]
		next
	end if
	for li_idx = 1 to upperbound(ldb_rule_id)
		this.f_build_rec_criteria_ex( ldb_rule_id[li_idx], lstr_criteria_rec_build, lt_transaction)
	next
end if

li_count = upperbound(lstr_criteria_rec_build)
if li_count > 0 then
	ldw_requestor = lw_display.f_get_dw(vdw_record.dynamic f_get_dataobject() )
	ldw_master_rc = ldw_requestor.f_getdwmaster( )
	lc_querymode = ldw_master_rc.inv_querymode
	for li_idx=1 to li_count
		//-- Trường hợp nếu 2 quyền có phân quyền trên cùng 1 dw chỉ khác cột --//
		if li_idx > 1 then
			for li_idx2 = 1 to upperbound(lstr_criteria_rec_build[li_idx].s_dwobject)
				lstr_criteria_rec_or = lstr_criteria_rec_empty
				for li_idx3 = 1 to upperbound(lstr_criteria_rec_build[li_idx - 1].s_dwobject)
					if lstr_criteria_rec_build[li_idx].s_dwobject[li_idx2] = lstr_criteria_rec_build[li_idx - 1].s_dwobject[li_idx3] then
						lstr_criteria_rec_or.s_criteria_rec[upperbound(lstr_criteria_rec_or.s_criteria_rec) + 1] =lstr_criteria_rec_build[li_idx - 1].s_criteria_rec[li_idx3]
						lstr_criteria_rec_or.s_dwcolumn_rec[upperbound(lstr_criteria_rec_or.s_dwcolumn_rec) + 1] =lstr_criteria_rec_build[li_idx - 1].s_dwcolumn_rec[li_idx3]
						lstr_criteria_rec_or.s_dwobject[upperbound(lstr_criteria_rec_or.s_dwobject) + 1] =lstr_criteria_rec_build[li_idx - 1].s_dwobject[li_idx3]
					end if
				next
				if upperbound(lstr_criteria_rec_or.s_dwobject) > 0 then
					lstr_criteria_rec_or.s_criteria_rec[upperbound(lstr_criteria_rec_or.s_criteria_rec) + 1] =lstr_criteria_rec_build[li_idx ].s_criteria_rec[li_idx2]
					lstr_criteria_rec_or.s_dwcolumn_rec[upperbound(lstr_criteria_rec_or.s_dwcolumn_rec) + 1] =lstr_criteria_rec_build[li_idx].s_dwcolumn_rec[li_idx2]
					lstr_criteria_rec_or.s_dwobject[upperbound(lstr_criteria_rec_or.s_dwobject) + 1] =lstr_criteria_rec_build[li_idx ].s_dwobject[li_idx2]
					/*
					for  li_idx3 = 1 to upperbound(lstr_criteria_rec_or.s_criteria_rec)
						if li_idx3 = 1 then ldw_requestor = lw_display.f_get_dw(lstr_criteria_rec_or.s_dwobject[li_idx3] + '_grid' )
						if isvalid(ldw_requestor) then
							ldw_master = ldw_requestor.f_getdwmaster( )
							if li_idx3=1 then
								ldw_master.inv_querymode.ib_rec = true
								ldw_requestor.event e_query( )
							end if
							ldw_requestor.inv_querymode.event e_itemchanged(ldw_requestor.getrow( ), lstr_criteria_rec_or.s_dwcolumn_rec[li_idx3], lstr_criteria_rec_or.s_criteria_rec[li_idx3])
							ldw_requestor.inv_querymode.f_getquerycriterias(lstr_qr_criteria)
							lstr_qr_criteria[upperbound(lstr_qr_criteria)].is_expression = ' OR '
							ldw_requestor.inv_querymode.f_setquerycriteria(lstr_qr_criteria)
							if li_idx3 = upperbound(lstr_criteria_rec_build[li_idx].s_criteria_rec ) then ldw_requestor.event e_execquery( )
//							ldw_requestor.inv_querymode.f_querymode( false)
							ls_where = 'RECORD'
						end if
					next
					
					ldw_requestor.inv_querymode.f_querymode( false)
					*/
					ls_total_where = trim(lc_string.f_globalreplace( ls_total_where, ls_each_where_1 , ' '))
				end if
			next
		end if
		if ls_total_where <> '' and len(ls_total_where) > 0 then 
			if ls_each_where_1 <> '' then 
				if upperbound(lstr_criteria_rec_build)> 1 then
					ls_total_where += ' OR '
				else
					ls_total_where += ' AND '
				end if
			else
				ls_total_where += ' OR '
			end if
		end if
		ls_each_where_1 = ''
		if upperbound(lstr_criteria_rec_or.s_dwobject) = 0 then
			for li_idx2=1 to upperbound(lstr_criteria_rec_build[li_idx].s_criteria_rec )
				if lstr_criteria_rec_build[li_idx].s_dwcolumn_rec[li_idx2]  = 'full.full' then
					lb_full = true
					exit
				end if
				if ls_each_where <> '' then ls_each_where += ' AND '
				if pos(vs_dwo,lstr_criteria_rec_build[li_idx].s_dwobject[li_idx2]) > 0 then
					ls_each_where += this.f_buildwhereclause( vdw_record, lstr_criteria_rec_build[li_idx].s_dwcolumn_rec[li_idx2], lstr_criteria_rec_build[li_idx].s_criteria_rec[li_idx2])
				else
					if ls_where <>  'RECORD' then
						ldw_requestor = lw_display.f_get_dw(lstr_criteria_rec_build[li_idx].s_dwobject[li_idx2] + '_grid' )
						if isvalid(ldw_requestor) then
							ldw_master = ldw_requestor.f_getdwmaster( )
							if li_idx2=1 then
								ldw_master.inv_querymode.ib_rec = true
								ldw_requestor.event e_query( )
							end if
							ldw_requestor.inv_querymode.event e_itemchanged(ldw_requestor.getrow( ), lstr_criteria_rec_build[li_idx].s_dwcolumn_rec[li_idx2], lstr_criteria_rec_build[li_idx].s_criteria_rec[li_idx2])
							if li_idx2 = upperbound(lstr_criteria_rec_build[li_idx].s_criteria_rec ) then ldw_requestor.event e_execquery( )
							ls_where = 'RECORD'
						end if
					end if
				end if
			next
			if lb_full then 
				ls_total_where = ''
				exit
			end if
		end if
		if ls_where = 'RECORD' then
			ldw_master_rc.inv_querymode.ib_rec = true
			ldw_requestor.event e_execquery( )
			ls_each_where_1 = ldw_master_rc.inv_querymode.f_getquerywhereclause( )
			ls_where = ldw_master.describe( "Datawindow.Table.Select")
		end if
		if ls_each_where_1 <> '' and ls_each_where <> ''  then
			ls_each_where_1 =' AND ' + ls_each_where_1 
			ls_total_where += '(' + ls_each_where + ')' + ls_each_where_1
		elseif ls_each_where_1 <> '' then
			ls_total_where += ls_each_where_1 
		else
			ls_total_where += '(' + ls_each_where + ')'
		end if
		ls_each_where = ''
	next
	if vdw_record.typeof() = datawindow! then
		//--lưu các rule_id của user --//
		vdw_record.dynamic f_set_rule_id_rec(ldb_rule_id)
		//--lưu struct buildwhere record--//
		if vdw_record.dynamic f_get_criteria_record( lstr_criteria_rec) = 0 then
			vdw_record.dynamic f_set_criteria_record(lstr_criteria_rec_build )
		end if
	end if
	ldw_master_rc.inv_querymode = lc_querymode
end if

disconnect using lt_transaction;
return ls_total_where
end function

public function string f_getcolumnlabel_ex (string vs_colname, string vs_dwo, string vs_objname, ref t_transaction rt_transaction);t_ds_db	lds_label
string		ls_collabel
any		laa_data[]
int			li_rtn

lds_label = create t_ds_db
lds_label.dataobject = 'ds_label'
lds_label.f_settransobject( rt_transaction)
if pos(vs_dwo,'_grid') + pos(vs_dwo,'_form') > 0 then
	laa_data[1] = left(vs_dwo,len(vs_dwo) - 5) + '.' + vs_colname
else
	laa_data[1] = vs_dwo + '.' + vs_colname
end if
laa_data[2] = '=' + UPPER(vs_objname)
lds_label.f_add_where(  'code;subcode', laa_data)
li_rtn = lds_label.retrieve()
if li_rtn > 0 then
	ls_collabel = lds_label.getitemstring( 1, 'text')
	return ls_collabel
else
	return ''
end if
end function

public function integer f_getorginsql (string vs_dwo, ref string rs_originalsql_nowhere, ref string rs_whereclause);t_ds_db					lds_tmp
c_obj_service			lc_obj_service
c_sql						lc_sql
t_s_sql_attr				lstr_sql_attr[]
string						ls_originalSQL

//-- Save the SQL select statement --//
lds_tmp = create t_ds_db
lds_tmp.dataobject = vs_dwo
ls_originalSQL = lds_tmp.dynamic describe("Datawindow.Table.Select")

//-- Check for errors --//
If IsNull(ls_originalSQL) or Len(ls_originalSQL) = 0 Then
	Return -1
End If

//-- Prepare original SQL to be re-used in a modify DW function --//
ls_originalSQL = lc_obj_service.f_GlobalReplace(ls_originalSQL,"'","~~'")

//-- //
if lc_sql.f_parse( ls_originalSQL, lstr_sql_attr[]) = 1 then
	rs_whereclause = lstr_sql_attr[1].s_where
	lstr_sql_attr[1].s_where = ''
	rs_originalsql_nowhere = lc_sql.f_assemble(  lstr_sql_attr[])
	
	Return 1
else
	gf_messagebox('m.c_dwservice.f_getorginsql.01','Thông báo','Không hỗ trợ DWO chứa UNION','stop','ok',1)
	return -1
end if
end function

public function integer f_build_rec_criteria_ex (double vdb_rule_id, ref s_str_criteria_rec rs_str_criteria_rec[], ref t_transaction rt_transaction);long 				ll_idx,ll_rtn,ll_row_of_rule_id
string 			ls_dwcolumns[] , ls_criteria_of_dwcolumns[],ls_modify,ls_rtn,ls_sql,las_dwobjects[]
datastore		lds_record		

ls_sql = "select RECORD_ACCESS_LINE.ID as ID, RECORD_ACCESS_LINE.DWCOLUMN as criteria_col, RECORD_ACCESS_LINE.CRITERIA as criteria_val,RECORD_ACCESS_LINE.DWOBJECT as ref_table,'' as col_of_id"+&
			" from RECORD_ACCESS_LINE join RECORD_ACCESS_HDR on RECORD_ACCESS_HDR.ID = RECORD_ACCESS_LINE.OBJECT_REF_ID"+&
													" join BUSINESS_RULE on RECORD_ACCESS_HDR.ID = BUSINESS_RULE.OBJECT_REF_ID"+&
			" where BUSINESS_RULE.ID = " + string(vdb_rule_id)
			
lds_record = create datastore
lds_record.dataobject = 'ds_replace_syntax'
ls_modify = 'Datawindow.Table.Select= "' + ls_sql +'"'
ls_rtn =lds_record.modify(ls_modify )
lds_record.settransobject( rt_transaction)
ll_rtn = lds_record.retrieve( )
ll_row_of_rule_id = upperbound(rs_str_criteria_rec) + 1
if ll_rtn >0 then
	for ll_idx=1 to ll_rtn
		ls_dwcolumns[upperbound(ls_dwcolumns)+1] = lds_record.getitemstring( ll_idx, 'criteria_col')
		ls_criteria_of_dwcolumns[upperbound(ls_criteria_of_dwcolumns)+1] = lds_record.getitemstring( ll_idx, 'criteria_val')
		las_dwobjects[upperbound(las_dwobjects)+1] = lds_record.getitemstring( ll_idx, 'ref_table')
	next	
else
	ls_dwcolumns[1] = 'full.full'
	ls_criteria_of_dwcolumns[1] = 'full.full'
end if
rs_str_criteria_rec[ll_row_of_rule_id].s_dwcolumn_rec = ls_dwcolumns
rs_str_criteria_rec[ll_row_of_rule_id].s_criteria_rec = ls_criteria_of_dwcolumns
rs_str_criteria_rec[ll_row_of_rule_id].s_dwobject = las_dwobjects
return ll_row_of_rule_id
end function

public function string f_buildwhere_rec_security_ex (datawindowchild vdwc_record, string vs_dwo, string vs_object_name);t_s_querymode_criteria	lstr_qr_criteria[]
s_str_criteria_rec			lstr_criteria_rec[],lstr_criteria_rec_build[],lstr_criteria_rec_or,lstr_criteria_rec_empty
c_dw_querymode			lc_querymode
s_w_main					lw_display
t_dw_mpl					ldw_requestor,ldw_master,ldw_master_rc
b_rule						lc_rule
c_string						lc_string
t_transaction				lt_transaction
boolean						lb_full = false
double						ldb_rule_id[],ldb_rule_id_deligate[]
string							ls_each_where,ls_total_where,ls_object_name,ls_where,ls_each_where_1
int								li_idx,li_count,li_idx2,li_rtn,li_idx3

//-- Tạo connection voi database --//
lt_transaction = create t_transaction
lt_transaction.dbms =	SQLCA.DBMS
lt_transaction.ServerName	 = SQLCA.ServerName
lt_transaction.LogId	 = SQLCA.LogId
lt_transaction.LogPass 	 = SQLCA.LogPass 
lt_transaction.AutoCommit 	 = false 
lt_transaction.DBParm	 = SQLCA.DBParm
connect using	lt_transaction;	

/*
if vdwc_record.typeof() = datawindow! then
	vdwc_record.dynamic f_getparentwindow(lw_display)
elseif vdwc_record.typeof() = datawindowchild! then
	lw_display = vdwc_record.dynamic getparent( )
end if
*/
li_rtn = lc_rule.f_get_appli_rule_id_ex( ldb_rule_id, gi_userid, vs_dwo,'record',vs_object_name, lt_transaction)
if li_rtn > 0 then 
	if lc_rule.f_get_appli_deligate_rule_id_ex( ldb_rule_id_deligate, gi_userid, vs_dwo,'record',vs_object_name, lt_transaction) > 0 then
		for li_idx = 1 to upperbound(ldb_rule_id_deligate)
			ldb_rule_id[upperbound(ldb_rule_id)+1] = ldb_rule_id_deligate[li_idx]
		next
	end if
	for li_idx = 1 to upperbound(ldb_rule_id)
		this.f_build_rec_criteria_ex( ldb_rule_id[li_idx], lstr_criteria_rec_build, lt_transaction)
	next
end if

li_count = upperbound(lstr_criteria_rec_build)
if li_count > 0 then
//	ldw_requestor = lw_display.f_get_dw(vdw_record.dynamic f_get_dataobject() )
//	ldw_master_rc = ldw_requestor.f_getdwmaster( )
//	lc_querymode = ldw_master_rc.inv_querymode
	for li_idx=1 to li_count
		//-- Trường hợp nếu 2 quyền có phân quyền trên cùng 1 dw chỉ khác cột --//
		if li_idx > 1 then
			for li_idx2 = 1 to upperbound(lstr_criteria_rec_build[li_idx].s_dwobject)
				lstr_criteria_rec_or = lstr_criteria_rec_empty
				for li_idx3 = 1 to upperbound(lstr_criteria_rec_build[li_idx - 1].s_dwobject)
					if lstr_criteria_rec_build[li_idx].s_dwobject[li_idx2] = lstr_criteria_rec_build[li_idx - 1].s_dwobject[li_idx3] then
						lstr_criteria_rec_or.s_criteria_rec[upperbound(lstr_criteria_rec_or.s_criteria_rec) + 1] =lstr_criteria_rec_build[li_idx - 1].s_criteria_rec[li_idx3]
						lstr_criteria_rec_or.s_dwcolumn_rec[upperbound(lstr_criteria_rec_or.s_dwcolumn_rec) + 1] =lstr_criteria_rec_build[li_idx - 1].s_dwcolumn_rec[li_idx3]
						lstr_criteria_rec_or.s_dwobject[upperbound(lstr_criteria_rec_or.s_dwobject) + 1] =lstr_criteria_rec_build[li_idx - 1].s_dwobject[li_idx3]
					end if
				next
				if upperbound(lstr_criteria_rec_or.s_dwobject) > 0 then
					lstr_criteria_rec_or.s_criteria_rec[upperbound(lstr_criteria_rec_or.s_criteria_rec) + 1] =lstr_criteria_rec_build[li_idx ].s_criteria_rec[li_idx2]
					lstr_criteria_rec_or.s_dwcolumn_rec[upperbound(lstr_criteria_rec_or.s_dwcolumn_rec) + 1] =lstr_criteria_rec_build[li_idx].s_dwcolumn_rec[li_idx2]
					lstr_criteria_rec_or.s_dwobject[upperbound(lstr_criteria_rec_or.s_dwobject) + 1] =lstr_criteria_rec_build[li_idx ].s_dwobject[li_idx2]
					/*
					for  li_idx3 = 1 to upperbound(lstr_criteria_rec_or.s_criteria_rec)
						if li_idx3 = 1 then ldw_requestor = lw_display.f_get_dw(lstr_criteria_rec_or.s_dwobject[li_idx3] + '_grid' )
						if isvalid(ldw_requestor) then
							ldw_master = ldw_requestor.f_getdwmaster( )
							if li_idx3=1 then
								ldw_master.inv_querymode.ib_rec = true
								ldw_requestor.event e_query( )
							end if
							ldw_requestor.inv_querymode.event e_itemchanged(ldw_requestor.getrow( ), lstr_criteria_rec_or.s_dwcolumn_rec[li_idx3], lstr_criteria_rec_or.s_criteria_rec[li_idx3])
							ldw_requestor.inv_querymode.f_getquerycriterias(lstr_qr_criteria)
							lstr_qr_criteria[upperbound(lstr_qr_criteria)].is_expression = ' OR '
							ldw_requestor.inv_querymode.f_setquerycriteria(lstr_qr_criteria)
							if li_idx3 = upperbound(lstr_criteria_rec_build[li_idx].s_criteria_rec ) then ldw_requestor.event e_execquery( )
//							ldw_requestor.inv_querymode.f_querymode( false)
							ls_where = 'RECORD'
						end if
					next
					
					ldw_requestor.inv_querymode.f_querymode( false)
					*/
					ls_total_where = trim(lc_string.f_globalreplace( ls_total_where, ls_each_where_1 , ' '))
				end if
			next
		end if
		if ls_total_where <> '' and len(ls_total_where) > 0 then 
			if ls_each_where_1 <> '' then 
				if upperbound(lstr_criteria_rec_build)> 1 then
					ls_total_where += ' OR '
				else
					ls_total_where += ' AND '
				end if
			else
				ls_total_where += ' OR '
			end if
		end if
		ls_each_where_1 = ''
		if upperbound(lstr_criteria_rec_or.s_dwobject) = 0 then
			for li_idx2=1 to upperbound(lstr_criteria_rec_build[li_idx].s_criteria_rec )
				if lstr_criteria_rec_build[li_idx].s_dwcolumn_rec[li_idx2]  = 'full.full' then
					lb_full = true
					exit
				end if
				if ls_each_where <> '' then ls_each_where += ' AND '
				if pos(vs_dwo,lstr_criteria_rec_build[li_idx].s_dwobject[li_idx2]) > 0 then
					ls_each_where += this.f_buildwhereclause( vdwc_record, lstr_criteria_rec_build[li_idx].s_dwcolumn_rec[li_idx2], lstr_criteria_rec_build[li_idx].s_criteria_rec[li_idx2])
				else
					if ls_where <>  'RECORD' then
						ldw_requestor = lw_display.f_get_dw(lstr_criteria_rec_build[li_idx].s_dwobject[li_idx2] + '_grid' )
						if isvalid(ldw_requestor) then
							ldw_master = ldw_requestor.f_getdwmaster( )
							if li_idx2=1 then
								ldw_master.inv_querymode.ib_rec = true
								ldw_requestor.event e_query( )
							end if
							ldw_requestor.inv_querymode.event e_itemchanged(ldw_requestor.getrow( ), lstr_criteria_rec_build[li_idx].s_dwcolumn_rec[li_idx2], lstr_criteria_rec_build[li_idx].s_criteria_rec[li_idx2])
							if li_idx2 = upperbound(lstr_criteria_rec_build[li_idx].s_criteria_rec ) then ldw_requestor.event e_execquery( )
							ls_where = 'RECORD'
						end if
					end if
				end if
			next
			if lb_full then 
				ls_total_where = ''
				exit
			end if
		end if
		if ls_where = 'RECORD' then
			ldw_master_rc.inv_querymode.ib_rec = true
			ldw_requestor.event e_execquery( )
			ls_each_where_1 = ldw_master_rc.inv_querymode.f_getquerywhereclause( )
			ls_where = ldw_master.describe( "Datawindow.Table.Select")
		end if
		if ls_each_where_1 <> '' and ls_each_where <> ''  then
			ls_each_where_1 =' AND ' + ls_each_where_1 
			ls_total_where += '(' + ls_each_where + ')' + ls_each_where_1
		elseif ls_each_where_1 <> '' then
			ls_total_where += ls_each_where_1 
		else
			ls_total_where += '(' + ls_each_where + ')'
		end if
		ls_each_where = ''
	next
	/*
	if vdwc_record.typeof() = datawindow! then
		//--lưu các rule_id của user --//
		vdwc_record.dynamic f_set_rule_id_rec(ldb_rule_id)
		//--lưu struct buildwhere record--//
		if vdwc_record.dynamic f_get_criteria_record( lstr_criteria_rec) = 0 then
			vdwc_record.dynamic f_set_criteria_record(lstr_criteria_rec_build )
		end if
	end if
	ldw_master_rc.inv_querymode = lc_querymode
	*/
end if

disconnect using lt_transaction;
return ls_total_where
end function

on c_dwservice.create
call super::create
end on

on c_dwservice.destroy
call super::destroy
end on

