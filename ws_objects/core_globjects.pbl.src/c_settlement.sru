$PBExportHeader$c_settlement.sru
forward
global type c_settlement from b_doc
end type
end forward

global type c_settlement from b_doc
end type
global c_settlement c_settlement

forward prototypes
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_tabpage ()
public function integer f_view_settlemented (double vdb_dr_id, double vdb_cr_id, string vs_colname, t_dw_mpl vdw_master, t_dw_mpl vdw_detail, string vs_type)
public function integer f_replace_where (ref t_dw_mpl rdw_handle, string vs_colstring, any vaa_data[])
public function integer f_select_settled_document (datawindow vdw_handling, long vl_currentrow, ref datawindow rdw_offset)
public function integer f_delete_settlement_ledger (double vdb_dr_doc_id)
public function integer f_create_settlement_ledger (double vdb_dr_doc_id, double vdb_dr_object_id, string vs_dr_doc_code, date vd_dr_trans_date, double vdb_cr_doc_id, double vdb_cr_object_id, string vs_cr_doc_code, date vd_cr_trans_date, double vdb_trans_amt, double vdb_base_amt, date vd_trans_date, double vdb_settle_curr, double vdb_settle_exrate, double vdb_exrate_diff)
public function integer f_settle (ref t_dw_mpl rdw_dr, ref t_dw_mpl rdw_cr, ref t_ds_db rds_matching, ref double rdba_t_doc_id[], ref string rsa_t_doc_type[])
public function integer f_settle_detail (ref t_dw_mpl rdw_detail_dr, ref t_dw_mpl rdw_detail_cr, ref t_ds_db rds_matching, ref long rl_row_dr, ref double rdb_trans_dr, ref double rdb_base_dr, ref long rl_row_cr, ref double rdb_trans_cr, ref double rdb_base_cr)
end prototypes

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name =  'b_pur_invoice;b_sal_invoice_return;'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_settlement_dr_form'
istr_dwo[1].s_dwo_form = 'd_settlement_dr_form'
istr_dwo[1].s_dwo_grid = ''
istr_dwo[1].b_master = true
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_details = ''
istr_dwo[1].s_dwo_master = ''
istr_dwo[1].s_master_keycol = ''
istr_dwo[1].s_detail_keycol = ''
istr_dwo[1].b_ref_table_yn  = false
istr_dwo[1].s_ref_table_field = ''
istr_dwo[1].b_relation_1_1 = false
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = false
//istr_dwo[1].b_focus_master = true
istr_dwo[1].s_description = 'Tham số'


istr_dwo[2].s_dwo_default =  'd_settlement_cr_form'
istr_dwo[2].s_dwo_form = 'd_settlement_cr_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = false
istr_dwo[2].b_detail = false
istr_dwo[2].b_cascade_del = false
istr_dwo[2].s_dwo_details = ''
istr_dwo[2].s_dwo_master = ''
istr_dwo[2].s_master_keycol = ''
istr_dwo[2].s_detail_keycol = ''
istr_dwo[2].b_ref_table_yn  = false
istr_dwo[2].s_ref_table_field = ''
istr_dwo[2].b_relation_1_1 = false
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = false
//istr_dwo[2].b_focus_master = true
istr_dwo[2].s_description = 'Tham số'

end subroutine

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '2tp_2dw'
iastr_dwo_tabpage[1].i_leftpart_width = 2830
iastr_dwo_tabpage[1].s_description = 'Tổng quan'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_settle_hdr_dr_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_settle_hdr_dr_grid'
iastr_dwo_tabpage[1].str_dwo[1].b_master = true
iastr_dwo_tabpage[1].str_dwo[1].b_detail = false
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = false
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = 'd_settle_line_dr_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol =''
iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol =''
iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[1].s_ref_table_field = ''
iastr_dwo_tabpage[1].str_dwo[1].b_insert = true
iastr_dwo_tabpage[1].str_dwo[1].b_update = true
iastr_dwo_tabpage[1].str_dwo[1].b_delete = true
iastr_dwo_tabpage[1].str_dwo[1].b_query = true
iastr_dwo_tabpage[1].str_dwo[1].b_print = true
iastr_dwo_tabpage[1].str_dwo[1].b_excel = true
iastr_dwo_tabpage[1].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Chứng từ phải thu'
iastr_dwo_tabpage[1].str_dwo[1].s_gb_name='gb_6'

iastr_dwo_tabpage[1].str_dwo[2].s_dwo_default =  'd_settle_hdr_cr_grid'
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_grid = 'd_settle_hdr_cr_grid'
iastr_dwo_tabpage[1].str_dwo[2].b_master = true
iastr_dwo_tabpage[1].str_dwo[2].b_detail = false
iastr_dwo_tabpage[1].str_dwo[2].b_cascade_del = false
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_master = ''
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_details = 'd_settle_line_cr_grid'
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_shared = ''
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
iastr_dwo_tabpage[1].str_dwo[2].s_description ='Chứng từ phải trả'
iastr_dwo_tabpage[1].i_index = 1
iastr_dwo_tabpage[1].str_dwo[2].s_gb_name='gb_7'

iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_display_model = '2tp_2dw'
iastr_dwo_tabpage[2].i_leftpart_width = 2830
iastr_dwo_tabpage[2].s_description = 'Chi tiết'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_settle_line_dr_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = 'd_settle_line_dr_grid'
iastr_dwo_tabpage[2].str_dwo[1].b_master = false
iastr_dwo_tabpage[2].str_dwo[1].b_detail = true
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = false
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_settle_hdr_dr_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[2].str_dwo[1].s_master_keycol ='doc_ref_id;object_id'
iastr_dwo_tabpage[2].str_dwo[1].s_detail_keycol ='doc_ref_id;object_id'
iastr_dwo_tabpage[2].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[2].str_dwo[1].s_ref_table_field = ''
iastr_dwo_tabpage[2].str_dwo[1].b_insert = true
iastr_dwo_tabpage[2].str_dwo[1].b_update = true
iastr_dwo_tabpage[2].str_dwo[1].b_delete = true
iastr_dwo_tabpage[2].str_dwo[1].b_query = true
iastr_dwo_tabpage[2].str_dwo[1].b_print = true
iastr_dwo_tabpage[2].str_dwo[1].b_excel = true
iastr_dwo_tabpage[2].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[2].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[2].str_dwo[1].s_description ='Chứng từ phải thu'
iastr_dwo_tabpage[2].str_dwo[1].s_gb_name='gb_6'

iastr_dwo_tabpage[2].str_dwo[2].s_dwo_default =  'd_settle_line_cr_grid'
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_form = ''
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_grid = 'd_settle_line_cr_grid'
iastr_dwo_tabpage[2].str_dwo[2].b_master = false
iastr_dwo_tabpage[2].str_dwo[2].b_detail = true
iastr_dwo_tabpage[2].str_dwo[2].b_cascade_del = false
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_master = 'd_settle_hdr_cr_grid'
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_details = ''
iastr_dwo_tabpage[2].str_dwo[2].s_dwo_shared = ''
iastr_dwo_tabpage[2].str_dwo[2].s_master_keycol = 'doc_ref_id;object_id'
iastr_dwo_tabpage[2].str_dwo[2].s_detail_keycol = 'doc_ref_id;object_id'
iastr_dwo_tabpage[2].str_dwo[2].b_ref_table_yn  = false
iastr_dwo_tabpage[2].str_dwo[2].s_ref_table_field = ''
iastr_dwo_tabpage[2].str_dwo[2].b_insert = true
iastr_dwo_tabpage[2].str_dwo[2].b_update = true
iastr_dwo_tabpage[2].str_dwo[2].b_delete = true
iastr_dwo_tabpage[2].str_dwo[2].b_query = true
iastr_dwo_tabpage[2].str_dwo[2].b_print = true
iastr_dwo_tabpage[2].str_dwo[2].b_excel = true
iastr_dwo_tabpage[2].str_dwo[2].b_traceable = true
iastr_dwo_tabpage[2].str_dwo[2].b_keyboardlocked = true
iastr_dwo_tabpage[2].str_dwo[2].s_description ='Chứng từ phải trả'
iastr_dwo_tabpage[2].i_index = 2
iastr_dwo_tabpage[2].str_dwo[2].s_gb_name='gb_7'


end subroutine

public function integer f_view_settlemented (double vdb_dr_id, double vdb_cr_id, string vs_colname, t_dw_mpl vdw_master, t_dw_mpl vdw_detail, string vs_type);string				ls_originalsq,ls_originalwhere, ls_currentsql,ls_currentwhere,ls_where,ls_modify,ls_coltype,ls_colname
long				ll_row
c_sql				lc_sql
c_dwservice 	lc_dwservice
c_string			lc_string

vdw_master.f_getcurrentsql( ls_currentsql,ls_currentwhere)
		vdw_master.f_get_originalsql( ls_originalsq,ls_originalwhere)
		if isnull(ls_originalwhere) then
			if  ls_currentsql<> '' and ls_currentwhere <>'' then 
				ls_originalsq=ls_currentsql
				ls_originalwhere=ls_currentwhere
				vdw_master.f_set_originalsql( ls_originalsq, ls_originalwhere)
		end if
	end if
	ls_colname=vs_colname
	lc_dwservice.f_get_build_column( vdw_master, ls_colname,ls_coltype)
	if vs_type='dr' then
//		ls_where=ls_colname+'='+string(vdb_dr_id)
		ls_originalwhere=lc_string.f_globalreplace( ls_originalwhere,"nvl(obt.settle_yn,~~'N~~')=~~'N~~'","nvl(obt.settle_yn,~~'N~~') in (~~'Y~~',~~'N~~') and obt.id in (select obt.id  from object_trans obt left join matching mat on mat.f_ref_id=obt.id left join object_trans obt2 on obt2.id=mat.t_ref_id where obt.object_id="+string(vdb_dr_id)+" and obt2.object_id="+string(vdb_cr_id)+")")
	else
		ls_originalwhere=lc_string.f_globalreplace( ls_originalwhere,"nvl(obt.settle_yn,~~'N~~')=~~'N~~'","nvl(obt.settle_yn,~~'N~~') in (~~'Y~~',~~'N~~') and obt.id in (select obt2.id  from object_trans obt left join matching mat on mat.f_ref_id=obt.id left join object_trans obt2 on obt2.id=mat.t_ref_id where obt.object_id="+string(vdb_dr_id)+" and obt2.object_id="+string(vdb_cr_id)+")")
	end if
	lc_sql.f_addtowhereclause( ls_originalsq, ls_originalwhere, " AND ")
	lc_sql.f_addtowhereclause( ls_originalsq, ls_Where, " AND ")
	ls_modify = 'Datawindow.Table.Select= "' + ls_originalsq +'"'
	vdw_master.modify(ls_modify )
	vdw_master.retrieve( )
	
	/*-------dw_chi tiet-----------*/
	
	vdw_detail.f_getcurrentsql( ls_currentsql,ls_currentwhere)
		vdw_detail.f_get_originalsql( ls_originalsq,ls_originalwhere)
		if isnull(ls_originalwhere) then
			if  ls_currentsql<> '' and ls_currentwhere <>'' then 
				ls_originalsq=ls_currentsql
				ls_originalwhere=ls_currentwhere
				vdw_detail.f_set_originalsql( ls_originalsq, ls_originalwhere)
		end if
	end if
	ls_colname=vs_colname
	lc_dwservice.f_get_build_column( vdw_detail, ls_colname,ls_coltype)
	//ls_where=ls_colname+'='+string(vdb_id)
	if vs_type='dr' then
		ls_originalwhere=lc_string.f_globalreplace( ls_originalwhere,"nvl(vie.settle_yn,~~'N~~')=~~'N~~'","nvl(vie.settle_yn,~~'N~~') in (~~'Y~~',~~'N~~') and vie.id in (select obt.id  from object_trans obt left join matching mat on mat.f_ref_id=obt.id left join object_trans obt2 on obt2.id=mat.t_ref_id where obt.object_id="+string(vdb_dr_id)+" and obt2.object_id="+string(vdb_cr_id)+")")
	else
		ls_originalwhere=lc_string.f_globalreplace( ls_originalwhere,"nvl(vie.settle_yn,~~'N~~')=~~'N~~'","nvl(vie.settle_yn,~~'N~~') in (~~'Y~~',~~'N~~') and vie.id in (select obt2.id  from object_trans obt left join matching mat on mat.f_ref_id=obt.id left join object_trans obt2 on obt2.id=mat.t_ref_id where obt.object_id="+string(vdb_dr_id)+" and obt2.object_id="+string(vdb_cr_id)+")")
	end if
	lc_sql.f_addtowhereclause( ls_originalsq, ls_originalwhere, " AND ")
	lc_sql.f_addtowhereclause( ls_originalsq, ls_Where, " AND ")
	ls_modify = 'Datawindow.Table.Select= "' + ls_originalsq +'"'
	vdw_detail.modify(ls_modify )
	vdw_detail.retrieve( )
return 0
end function

public function integer f_replace_where (ref t_dw_mpl rdw_handle, string vs_colstring, any vaa_data[]);
string				ls_originalSQL, ls_curWhere, las_Colname[], ls_coltype, ls_rtn
int					li_idx, li_cnt
c_string			lc_string
c_dwservice		lc_dwservice
c_sql				lc_sql

rdw_handle.f_getcurrentsql( ls_originalSQL, ls_curWhere)
li_cnt = lc_string.f_stringtoarray(vs_colstring, ';',las_Colname[])
ls_curWhere = ''
setnull(rdw_handle.is_originalwhereClause)
FOR li_idx = 1 to li_cnt
	lc_dwservice.f_get_build_column( rdw_handle,las_Colname[li_idx], ls_coltype)
	if ls_curWhere <> '' then ls_curWhere += ' AND '
	ls_curWhere += lc_string.f_get_expression( string(vaa_data[li_idx]), ls_coltype,las_Colname[li_idx], 'build where')
NEXT
lc_sql.f_addtowhereclause( ls_originalSQL, ls_curWhere, " AND ")
ls_rtn =rdw_handle.modify('Datawindow.Table.Select= "' + ls_originalSQL +'"' )	

if ls_rtn ='' then
	return 1
else
	gf_messagebox('m.c_settlement.f_replace_where.01','Thông báo','Lỗi modify sql cùa DW:@'+rdw_handle.dataobject,'stop','ok',1)
	return -1
end if
end function

public function integer f_select_settled_document (datawindow vdw_handling, long vl_currentrow, ref datawindow rdw_offset);double			ldb_match_id
long				ll_find
string				ls_gutter,ls_match, ls_match_offset


ldb_match_id = vdw_handling.getitemnumber(vl_currentrow,'match_id')
ls_gutter = vdw_handling.getitemstring(vl_currentrow,'gutter')
ll_find=rdw_offset.find("match_id =" + string(ldb_match_id),1,rdw_offset.rowcount())
if ll_find >0 then
	rdw_offset.setitem(ll_find,'gutter',ls_gutter)
end if
return 0
end function

public function integer f_delete_settlement_ledger (double vdb_dr_doc_id);double			ldb_docID
date				ld_trans_date
t_transaction	lt_transaction
t_ds_db			lds_obj_post

this.iw_display.f_get_transaction( lt_transaction)

//-- Lấy doc id của bút toán settlement --//
select ID into :ldb_docID  from DOCUMENT where object_ref_id = :vdb_dr_doc_id using lt_transaction;
//-- Lấy ngày ghi sổ --//
select distinct TRANS_DATE into :ld_trans_date from POST_LINE where doc_id = :ldb_docID using lt_transaction;
if lt_transaction.sqlcode = 100 then
	return 0
elseif  lt_transaction.sqlcode = -1 then
	gf_messagebox('m.c_settlement.f_delete_settlement_ledger.01','Thông báo','Lỗi Select dữ liệu:@'+lt_transaction.sqlerrtext,'stop','ok',1)
	return -1
end if
if isnull(ldb_docID) or ldb_docID = 0 then
	gf_messagebox('m.c_settlement.f_delete_settlement_ledger.02','Thông báo','Lỗi: ID bút toán ghi sổ bị NULL','stop','ok',1)
	return -1
end if

//-- Xóa ledger trans --//
delete LEDGER_TRANS where DOC_REF_ID = :ldb_docID using lt_transaction;
if  lt_transaction.sqlcode = -1 then	
	gf_messagebox('m.c_settlement.f_delete_settlement_ledger.03','Thông báo','Lỗi xóa dữ liệu:@'+lt_transaction.sqlerrtext,'stop','ok',1)
	rollback using lt_transaction;
	return -1
end if

//-- Xóa object_trans --//
delete object_trans where doc_ref_id =:ldb_docID using lt_transaction;
if lt_transaction.sqlcode = -1 then 
	gf_messagebox('m.c_settlement.f_delete_settlement_ledger.03','Thông báo','Lỗi xóa dữ liệu:@'+lt_transaction.sqlerrtext,'stop','ok',1)
	rollback using lt_transaction;
	return -1
end if

//-- cập nhật object balance --//
//-- update object_balance đối tượng Nợ--//
lds_obj_post = create t_ds_db
lds_obj_post.dataobject = 'ds_obj_balance_post_dr'
if this.f_insert_object_balance( ldb_docID,  ld_trans_date, lt_transaction, lds_obj_post, 'unpost',gs_sob) <> 1 then
	destroy lds_obj_post
	return -1	
end if

//-- update ledger_balance đối tượng Nợ--//
lds_obj_post.dataobject = 'ds_ledger_balance_post_dr'
if this.f_insert_object_balance( ldb_docID,  ld_trans_date, lt_transaction, lds_obj_post, 'unpost',gs_sob) <> 1 then
	destroy lds_obj_post
	return -1	
end if

//-- update object_balance đối tượng Có--//
lds_obj_post.dataobject = 'ds_obj_balance_post_cr'
if this.f_insert_object_balance( ldb_docID,  ld_trans_date, lt_transaction, lds_obj_post, 'unpost',gs_sob) <> 1 then
	destroy lds_obj_post
	return -1	
end if

//-- update ledger_balance đối tượng Có--//
lds_obj_post.dataobject = 'ds_ledger_balance_post_cr'
if this.f_insert_object_balance( ldb_docID,  ld_trans_date, lt_transaction, lds_obj_post, 'unpost',gs_sob) <> 1 then
	destroy lds_obj_post
	return -1	
end if

//-- xóa postline --//
delete POST_LINE where DOC_ID = :ldb_docID using lt_transaction;
if  lt_transaction.sqlcode = -1 then	
	gf_messagebox('m.c_settlement.f_delete_settlement_ledger.03','Thông báo','Lỗi xóa dữ liệu:@'+lt_transaction.sqlerrtext,'stop','ok',1)
	rollback using lt_transaction;
	return -1
end if

//-- xóa document --//
delete DOCUMENT where ID = :ldb_docID using lt_transaction;
if  lt_transaction.sqlcode = -1 then	
	gf_messagebox('m.c_settlement.f_delete_settlement_ledger.03','Thông báo','Lỗi xóa dữ liệu:@'+lt_transaction.sqlerrtext,'stop','ok',1)
	rollback using lt_transaction;
	return -1
end if

destroy lds_obj_post
return 1
end function

public function integer f_create_settlement_ledger (double vdb_dr_doc_id, double vdb_dr_object_id, string vs_dr_doc_code, date vd_dr_trans_date, double vdb_cr_doc_id, double vdb_cr_object_id, string vs_cr_doc_code, date vd_cr_trans_date, double vdb_trans_amt, double vdb_base_amt, date vd_trans_date, double vdb_settle_curr, double vdb_settle_exrate, double vdb_exrate_diff);double			ldb_dr_account_id, ldb_cr_account_id, ldb_doc_id
any				laa_data[]
long				ll_insert_row
string				ls_trans_text
date				ld_settle_date
t_ds_db					lds_post_line_dr, lds_post_line_cr, lds_settle_post_line, lds_ledger_trans, lds_document,lds_obj_post, lds_parm
t_transaction			lt_transaction
b_popup_data			lb_popup_input
s_str_post_account	lstr_post_account

this.iw_display.f_get_transaction( lt_transaction)
lds_post_line_dr = create t_ds_db
lds_post_line_dr.dataobject = 'd_post_line_grid'
lds_post_line_dr.f_settransobject(lt_transaction)
laa_data[1] = vdb_dr_doc_id
laa_data[2] = vdb_dr_object_id
lds_post_line_dr.f_add_where( 'doc_id;DR_OBJECT_ID', laa_data[])
if lds_post_line_dr.retrieve( ) > 0 then
	ldb_dr_account_id = lds_post_line_dr.getitemnumber( 1, 'dr_account_id')
end if

lds_post_line_cr = create t_ds_db
lds_post_line_cr.dataobject = 'd_post_line_grid'
lds_post_line_cr.f_settransobject(lt_transaction)
laa_data[1] = vdb_cr_doc_id
laa_data[2] = vdb_cr_object_id
lds_post_line_cr.f_add_where( 'doc_id;CR_OBJECT_ID', laa_data[])
if lds_post_line_cr.retrieve( ) > 0 then
	ldb_cr_account_id = lds_post_line_cr.getitemnumber( 1, 'cr_account_id')
end if

if  ldb_dr_account_id > 0 and ldb_cr_account_id > 0 then	
	//-- popup user nhập ngày ghi sỗ --//
	redo:
	lb_popup_input = create b_popup_data
	lb_popup_input.is_display_column = 'settle_date'
	lb_popup_input.iaa_default_data[1] = vd_trans_date
	lb_popup_input.f_init_popup_display( '1d', 'd_settle_date_form', 2000, 1000)
	openwithparm(s_wr_multi,lb_popup_input)
	lds_parm = message.powerobjectparm
	setnull(message.powerobjectparm)
	if isvalid(lds_parm) then
		ld_settle_date = date(lds_parm.getitemdatetime(1, 'settle_date'))
		if isnull(ld_settle_date) then 
			gf_messagebox('m.c_settlement.f_create_settlement_ledger.01','Thông báo','Chưa nhập ngày cấn trừ','exclamation','ok',1)
			destroy lb_popup_input
			goto redo
		end if
		if ld_settle_date < vd_dr_trans_date then
			gf_messagebox('m.c_settlement.f_create_settlement_ledger.02','Thông báo','Ngày cấn trừ không được nhỏ hơn ngày của phiếu ghi Nợ:@ ' +vs_dr_doc_code+':'+string(vd_dr_trans_date),'exclamation','ok',1)
			destroy lb_popup_input
			goto redo			
		end if
		if ld_settle_date < vd_cr_trans_date then
			gf_messagebox('m.c_settlement.f_create_settlement_ledger.03','Thông báo','Ngày cấn trừ không được nhỏ hơn ngày của phiếu ghi Có:@ ' +vs_cr_doc_code+':'+string(vd_cr_trans_date),'exclamation','ok',1)
			destroy lb_popup_input
			goto redo			
		end if
	else
//		ld_settle_date = vd_trans_date
		rollback using lt_transaction;
		return -1
	end if	
	
	lds_settle_post_line = create t_ds_db
	lds_settle_post_line.dataobject = 'd_post_line_grid'
	lds_settle_post_line.f_settransobject( lt_transaction)				
	//-- Cấn trừ 2 tài khoản khác nhau: phát sinh bút toán cấn trừ --//
	if ldb_dr_account_id <> ldb_cr_account_id then			
		//-- insert document --//
		lds_document = create t_ds_db
		lds_document.dataobject =	'd_document_grid'
		lds_document.f_settransobject( lt_transaction)
		ll_insert_row = lds_document.event e_addrow()
		ldb_doc_id = this.f_create_id( ) 
		lds_document.setitem(ll_insert_row,'id', ldb_doc_id)
		lds_document.setitem(ll_insert_row,'code', 'CT'+string(ldb_doc_id, '000000') )
		lds_document.setitem(ll_insert_row,'document_date', date(gd_session_date)) //today()
		lds_document.setitem(ll_insert_row,'doc_type', 'SETTLE')
		lds_document.setitem(ll_insert_row,'status', 'booked')
		lds_document.setitem(ll_insert_row,'object_ref_id', vdb_dr_doc_id)
		
		if lds_document.update(true,false ) = -1 then
			gf_messagebox('m.c_settlement.f_create_settlement_ledger.05','Thông báo','Lỗi, không update được Số chứng từ cấn trừ:@'+lt_transaction.sqlerrtext,'stop','ok',1)
			rollback using lt_transaction;
			return -1
		end if
		lds_document.resetupdate( )
		
		//--insert post_line--//
		ll_insert_row = lds_settle_post_line.event e_addrow()
		lds_settle_post_line.setitem(ll_insert_row,'id', this.f_create_id( ) )
		lds_settle_post_line.setitem(ll_insert_row,'dr_object_type', lds_post_line_cr.getitemstring(1, 'cr_object_type'))
		lds_settle_post_line.setitem(ll_insert_row,'dr_object_id', lds_post_line_cr.getitemnumber(1, 'cr_object_id'))	
		lds_settle_post_line.setitem(ll_insert_row,'dr_account_id',  lds_post_line_cr.getitemnumber(1, 'cr_account_id'))
		lds_settle_post_line.setitem(ll_insert_row,'dr_subaccount', lds_post_line_cr.getitemnumber(1, 'cr_subaccount'))
		
		lds_settle_post_line.setitem(ll_insert_row,'cr_object_type', lds_post_line_dr.getitemstring(1, 'dr_object_type'))
		lds_settle_post_line.setitem(ll_insert_row,'cr_object_id', lds_post_line_dr.getitemnumber(1, 'dr_object_id'))
		lds_settle_post_line.setitem(ll_insert_row,'cr_account_id', lds_post_line_dr.getitemnumber(1, 'dr_account_id'))
		lds_settle_post_line.setitem(ll_insert_row,'cr_subaccount', lds_post_line_dr.getitemnumber(1, 'dr_subaccount'))
		ls_trans_text = 'Cấn trừ chứng từ số: '+ vs_dr_doc_code + ', ngày: '+ string(vd_dr_trans_date,'dd/mm/yyyy') + ' và số: ' + vs_cr_doc_code + ', ngày: ' + string(vd_cr_trans_date,'dd/mm/yyyy') 
		lds_settle_post_line.setitem(ll_insert_row,'trans_text', ls_trans_text)
		lds_settle_post_line.setitem(ll_insert_row,'post_type', 'settle')
		lds_settle_post_line.setitem(ll_insert_row,'doc_id', ldb_doc_id )
		lds_settle_post_line.setitem(ll_insert_row,'object_ref_id', ldb_doc_id )
		lds_settle_post_line.setitem(ll_insert_row,'object_ref_table', 'DOCUMENT' )
		lds_settle_post_line.setitem(ll_insert_row,'trans_amt', vdb_trans_amt)
		lds_settle_post_line.setitem(ll_insert_row,'base_amt',  vdb_base_amt)
		lds_settle_post_line.setitem(ll_insert_row,'TRANS_CUR_ID', vdb_settle_curr)
		lds_settle_post_line.setitem(ll_insert_row,'EX_RATE', vdb_settle_exrate)
		lds_settle_post_line.setitem(ll_insert_row,'trans_Date', ld_settle_date)
	end if
	//-- tạo bút toán chênh lệch tỷ giá --//
	if vdb_exrate_diff <> 0 then
		if ldb_doc_id = 0 then
			lds_document = create t_ds_db
			lds_document.dataobject =	'd_document_grid'
			lds_document.f_settransobject( lt_transaction)
			ll_insert_row = lds_document.event e_addrow()
			ldb_doc_id = this.f_create_id( ) 
			lds_document.setitem(ll_insert_row,'id', ldb_doc_id)
			lds_document.setitem(ll_insert_row,'code', 'CT'+string(ldb_doc_id, '000000') )
			lds_document.setitem(ll_insert_row,'document_date', date(gd_session_date)) //today()
			lds_document.setitem(ll_insert_row,'doc_type', 'SETTLE')
			lds_document.setitem(ll_insert_row,'status', 'booked')
			lds_document.setitem(ll_insert_row,'object_ref_id', vdb_dr_doc_id)
			
			if lds_document.update(true,false ) = -1 then
				gf_messagebox('m.c_settlement.f_create_settlement_ledger.05','Thông báo','Lỗi, không update được Số chứng từ cấn trừ:@'+lt_transaction.sqlerrtext,'stop','ok',1)
				rollback using lt_transaction;
				return -1
			end if
			lds_document.resetupdate( )			
		end if
		
		lstr_post_account.s_dr_object_type = lds_post_line_dr.getitemstring(1, 'dr_object_type')
		lstr_post_account.db_dr_object_id = lds_post_line_dr.getitemnumber(1, 'dr_object_id')
		lstr_post_account.db_dr_account = lds_post_line_dr.getitemnumber(1, 'dr_account_id')
		lstr_post_account.db_dr_subaccount = lds_post_line_dr.getitemnumber(1, 'dr_subaccount')
		
		lstr_post_account.s_cr_object_type = lds_post_line_cr.getitemstring(1, 'cr_object_type')
		lstr_post_account.db_cr_object_id = lds_post_line_cr.getitemnumber(1, 'cr_object_id')
		lstr_post_account.db_cr_account = lds_post_line_cr.getitemnumber(1, 'cr_account_id')
		lstr_post_account.db_cr_subaccount = lds_post_line_cr.getitemnumber(1, 'cr_subaccount')		 
		if this.f_insert_exrate_post_line(lds_settle_post_line , lstr_post_account, vdb_exrate_diff, vdb_settle_curr, vdb_settle_exrate, ld_settle_date, ldb_doc_id, ldb_doc_id, 'DOCUMENT') = -1 then return -1
	end if
	
	if lds_settle_post_line.update(true,false ) = -1 then
		gf_messagebox('m.c_settlement.f_create_settlement_ledger.06','Thông báo','Lỗi, không update được postline:@'+lt_transaction.sqlerrtext,'stop','ok',1)
		rollback using lt_transaction;
		return -1
	end if
	lds_settle_post_line.resetupdate( )
	
	destroy lb_popup_input
	destroy lds_document
	destroy lds_settle_post_line
	destroy lds_post_line_dr
	destroy lds_post_line_cr
	
	//-- Ghi sổ ledger_trans --//
	lds_ledger_trans = create t_ds_db
	if f_insert_ledger_trans(ldb_doc_id,'SETTLE', ld_settle_date, lt_transaction, lds_ledger_trans) <> 1 then
		destroy lds_ledger_trans
		return -1
	end if
	//-- Ghi sổ object_trans đối tượng Nợ--//
	lds_obj_post = create t_ds_db
	lds_obj_post.dataobject = 'ds_obj_trans_post_dr'
	if f_insert_object_trans(ldb_doc_id,'SETTLE', ld_settle_date, lt_transaction, lds_obj_post) <> 1 then
		destroy lds_obj_post
		return -1
	end if
	//-- Ghi sổ object_trans đối tượng Có--//
	lds_obj_post.dataobject = 'ds_obj_trans_post_cr'
	if f_insert_object_trans(ldb_doc_id,'SETTLE', ld_settle_date, lt_transaction, lds_obj_post) <> 1 then
		destroy lds_obj_post
		return -1
	end if
	//-- update object_balance đối tượng Nợ--//
	lds_obj_post.dataobject = 'ds_obj_balance_post_dr'
	if f_insert_object_balance( ldb_doc_id,  ld_settle_date, lt_transaction, lds_obj_post, 'post',gs_sob) <> 1 then
		destroy lds_obj_post
		return -1	
	end if
	//-- update ledger_balance đối tượng Nợ--//
	lds_obj_post.dataobject = 'ds_ledger_balance_post_dr'
	if this.f_insert_object_balance( ldb_doc_id,  ld_settle_date, lt_transaction, lds_obj_post, 'post',gs_sob) <> 1 then
		destroy lds_obj_post
		return -1	
	end if
	//-- update object_balance đối tượng Có--//
	lds_obj_post.dataobject = 'ds_obj_balance_post_cr'
	if f_insert_object_balance( ldb_doc_id,  ld_settle_date, lt_transaction, lds_obj_post, 'post',gs_sob) <> 1 then
		destroy lds_obj_post
		return -1	
	end if
	//-- update ledger_balance đối tượng Có--//
	lds_obj_post.dataobject = 'ds_ledger_balance_post_cr'
	if f_insert_object_balance( ldb_doc_id,  ld_settle_date, lt_transaction, lds_obj_post, 'post',gs_sob) <> 1 then
		destroy lds_obj_post
		return -1	
	end if

	return 1
end if
destroy lds_post_line_dr
destroy lds_post_line_cr
return 0
end function

public function integer f_settle (ref t_dw_mpl rdw_dr, ref t_dw_mpl rdw_cr, ref t_ds_db rds_matching, ref double rdba_t_doc_id[], ref string rsa_t_doc_type[]);
long			ll_row1, ll_row2, ll_row_matching, ll_row_dr, ll_row_cr
double		ldb_trans_dr, ldb_base_dr,ldb_trans_cr, ldb_base_cr
double		ldb_dr_base_amount, ldb_dr_trans_amount, ldb_dr_currency, ldb_dr_doc_id, ldb_dr_object_id, ldb_dr_exrate, ldb_settle_curr
double		ldb_cr_base_amount, ldb_cr_trans_amount, ldb_cr_currency, ldb_cr_doc_id, ldb_cr_object_id, ldb_cr_exrate , ldb_base_curr
double		ldb_settle_exrate,ldb_settle_trans_value,  ldb_match_trans_value, ldb_match_base_value, ldb_f_doc_id, ldb_t_doc_id, ldb_f_id, ldb_t_id
double		ldb_settle_base_value_dr, ldb_settle_base_value_cr, ldb_settle_base_value, ldb_exrate_diff_value, ldb_round_id
date			ld_dr_trans_date, ld_cr_trans_date, ld_settle_date
string			ls_dr_doc_code, ls_cr_doc_code,  ls_base_currcode, ls_base_currname, ls_cr_doc_type
int				li_rtn
t_dw_mpl	ldw_detail_dr, ldw_detail_cr
c_datetime	lc_date

ll_row1 = 1
ll_row2 = 1
this.ic_unit_instance.f_get_base_cur( ldb_base_curr,  ls_base_currcode, ls_base_currname)
ldw_detail_dr = this.iw_display.f_get_dw( 'd_settle_line_dr_grid')
ldw_detail_cr = this.iw_display.f_get_dw( 'd_settle_line_cr_grid')
DO WHILE ll_row1<= rdw_dr.rowcount()
	ldb_dr_base_amount= rdw_dr.getitemnumber(ll_row1, 'remain_dr_base_value')
	ldb_dr_trans_amount=rdw_dr.getitemnumber(ll_row1, 'remain_dr_trans_value')
	ldb_dr_currency = rdw_dr.getitemnumber(ll_row1, 'trans_currency')
	ld_dr_trans_date = date(rdw_dr.getitemdatetime(ll_row1, 'trans_date'))
	ldb_dr_doc_id =  rdw_dr.getitemnumber(ll_row1, 'doc_ref_id')
	ls_dr_doc_code =  rdw_dr.getitemstring(ll_row1, 'doc_code')
	ldb_dr_object_id =  rdw_dr.getitemnumber(ll_row1, 'object_id')
	ldb_dr_exrate =  rdw_dr.getitemnumber(ll_row1, 'exchange_rate')		
	if ldb_dr_exrate = 0 or isnull(ldb_dr_exrate) then 
		gf_messagebox('m.c_settlement.f_settle.01','Thông báo','Chứng từ không có tỷ giá:'+ls_dr_doc_code,'exclamation','ok',1)
		return -1
	end if			
	//-- cập nhật chi tiết bảng match: filter DW chi tiết --//
	ldw_detail_dr.setfilter( "doc_ref_id= "+string(ldb_dr_doc_id) + " AND object_id ="+string(ldb_dr_object_id))
	ldw_detail_dr.filter( )
	ll_row_dr = 1
	ldb_trans_dr = 0
	ldb_base_dr = 0
	
	DO WHILE  ll_row2 <= rdw_cr.rowcount() and ldb_dr_base_amount > 0		
		if ldb_cr_trans_amount = 0 then
			ldb_cr_base_amount=rdw_cr.getitemnumber(ll_row2, 'remain_cr_base_value')					
			ldb_cr_trans_amount=rdw_cr.getitemnumber(ll_row2, 'remain_cr_trans_value')
			ldb_cr_currency = rdw_cr.getitemnumber(ll_row2, 'trans_currency')					
			ld_cr_trans_date = date(rdw_cr.getitemdatetime(ll_row2, 'trans_date'))
			ldb_cr_doc_id =  rdw_cr.getitemnumber(ll_row2, 'doc_ref_id')
			ls_cr_doc_code =  rdw_cr.getitemstring(ll_row2, 'doc_code')
			ls_cr_doc_type =   rdw_cr.getitemstring(ll_row2, 'doc_type')
			ldb_cr_object_id =  rdw_cr.getitemnumber(ll_row2, 'object_id')
			ldb_cr_exrate =  rdw_cr.getitemnumber(ll_row2, 'exchange_rate')
			if ldb_cr_exrate = 0 or isnull(ldb_cr_exrate) then 
				gf_messagebox('m.c_settlement.f_settle.02','Thông báo','Chứng từ không có tỷ giá:'+ls_cr_doc_code,'exclamation','ok',1)
				return -1
			end if						
			//-- cập nhật chi tiết bảng match: filter DW chi tiết --//
			ldw_detail_cr.setfilter( "doc_ref_id= "+string(ldb_cr_doc_id) + " AND object_id ="+string(ldb_cr_object_id))
			ldw_detail_cr.filter( )			
			ll_row_cr = 1			
			ldb_trans_cr = 0
			ldb_base_cr = 0			
		end if
		
		//====Tính số tiền cấn trừ ====//
																/////////////////////////////////////
		if ldb_dr_currency = ldb_cr_currency then //-- Tính cấn trừ cùng loại tiền --//
																///////////////////////////////////
			ldb_settle_curr = ldb_dr_currency
			ldb_round_id = this.ic_unit_instance.f_get_round_id( ldb_base_curr, 0, 'amount')
			//-- xác định tỷ giá cấn trừ : lấy tỷ giá của giao dịch phát sinh sau làm tỷ giá cấn trừ --//
			if ld_dr_trans_date > ld_cr_trans_date then
				ldb_settle_exrate = ldb_dr_exrate
				ld_settle_date = ld_dr_trans_date
			else
				ldb_settle_exrate = ldb_cr_exrate
				ld_settle_date = ld_cr_trans_date
			end if
			//-- xác định số tiền cấn trừ cập nhật bảng match then trans_amount--//		
			if ldb_dr_trans_amount >= ldb_cr_trans_amount then
				ldb_match_trans_value = ldb_cr_trans_amount
				//-- số tiền base value cập nhật bảng match là số tiền lớn nhất tương ứng của số tiền trans_value theo tỷ giá giao dịch --//
				ldb_match_base_value = max(ldb_cr_base_amount, ldb_match_trans_value * ldb_dr_exrate) //-- làm tròn --//
				//-- làm tròn: ldb_match_base_value--//
				ldb_match_base_value = this.ic_unit_instance.f_round( rdw_cr,ldb_round_id, ldb_match_base_value)	
				
				ldb_dr_trans_amount -= ldb_cr_trans_amount
				ldb_dr_base_amount = max(ldb_dr_base_amount - ldb_match_base_value	, 0)			
				
				ldb_settle_base_value_cr = ldb_cr_base_amount
				ldb_settle_base_value_dr =  ldb_match_trans_value * ldb_dr_exrate
				//-- làm tròn: ldb_settle_base_value_dr--//
				ldb_settle_base_value_dr = this.ic_unit_instance.f_round( rdw_dr,ldb_round_id, ldb_settle_base_value_dr)	
				
				ldb_cr_base_amount = 0
				ldb_cr_trans_amount = 0
			else				
				ldb_match_trans_value = ldb_dr_trans_amount
				//-- số tiền base value cập nhật bảng match là số tiền lớn nhất tương ứng của số tiền trans_value theo tỷ giá giao dịch --//
				ldb_match_base_value =  max(ldb_dr_base_amount, ldb_match_trans_value * ldb_cr_exrate) //-- làm tròn --//
				//-- làm tròn: ldb_match_base_value--//
				ldb_match_base_value = this.ic_unit_instance.f_round( rdw_cr,ldb_round_id, ldb_match_base_value)	
				
				ldb_cr_trans_amount -= ldb_dr_trans_amount
				ldb_cr_base_amount = max(ldb_cr_base_amount - ldb_match_base_value	, 0)	
				
				ldb_settle_base_value_cr = ldb_match_trans_value * ldb_cr_exrate
				//-- làm tròn: ldb_settle_base_value_cr--//				
				ldb_settle_base_value_cr = this.ic_unit_instance.f_round( rdw_cr,ldb_round_id, ldb_settle_base_value_cr)				
				ldb_settle_base_value_dr =  ldb_dr_base_amount 
				
				ldb_dr_base_amount = 0
				ldb_dr_trans_amount = 0
			end if										
			//-- xác định số tiền cấn trừ ghi sổ kế toán --//
				ldb_settle_trans_value = ldb_match_trans_value
				ldb_settle_base_value = min(ldb_settle_base_value_dr, ldb_settle_base_value_cr)
				if ldb_dr_exrate <> ldb_cr_exrate then
					ldb_exrate_diff_value = ldb_settle_base_value_dr - ldb_settle_base_value_cr //-- nếu >0 lỗ, <0 lãi --//
				else
					ldb_exrate_diff_value = 0
				end if
				 ////////////////////////////////////////////////////////////////////////////
		else  //-- Tính: cấn trừ khác loại tiền: 1 là ngoại tệ, 1 là tiền hạch toán --// 	
				////////////////////////////////////////////////////////////////////////////
			if ldb_dr_currency <> ldb_base_curr and ldb_cr_currency <> ldb_base_curr then
				gf_messagebox('m.c_settlement.f_settle.03','Thông báo','@ Ngoại tệ khác nhau không được cấn trừ','exclamation','ok',1)
				return -1
			end if
			//-- xác định tỷ giá cấn trừ = tỷ giá của giao dịch bằng ngoại tệ --//
			if ldb_dr_currency = ldb_base_curr then 
				ldb_settle_curr = ldb_cr_currency
				ldb_settle_exrate = ldb_cr_exrate				
			else
				ldb_settle_curr = ldb_dr_currency
				ldb_settle_exrate = ldb_dr_exrate
			end if
			//-- xác định số tiền cấn trừ cập nhật bảng match theo base amount--//			
			if ldb_dr_base_amount >= ldb_cr_base_amount then
				ldb_match_base_value = ldb_cr_base_amount
				ldb_match_trans_value = 0													
				ldb_dr_base_amount -= ldb_cr_base_amount											
				ldb_cr_base_amount = 0
			else						
				ldb_match_base_value = ldb_dr_base_amount
				ldb_match_trans_value = 0						
				ldb_cr_base_amount -= ldb_dr_base_amount						
				ldb_dr_base_amount = 0
			end if
			//-- xác định số tiền cấn trử ghi sổ kế toán --//
			ldb_settle_base_value = ldb_match_base_value
			ldb_settle_trans_value = ldb_match_base_value/ldb_dr_exrate	//--làm tròn //
			//-- làm tròn: ldb_settle_trans_value --//
			ldb_round_id = this.ic_unit_instance.f_get_round_id( ldb_settle_curr, 0, 'amount')
			ldb_settle_trans_value = this.ic_unit_instance.f_round( rdw_cr,ldb_round_id, ldb_settle_trans_value)				
		end if						
		
		/*=========update bang match====================*/
		ldb_f_id=rdw_dr.getitemnumber(ll_row1,'id')
		ldb_t_id=rdw_cr.getitemnumber(ll_row2,'id')
		ll_row_matching=rds_matching .event e_addrow( )
		rds_matching.setitem(ll_row_matching, 'ID',this.f_create_id() )	
		rds_matching.setitem(ll_row_matching, 'F_REF_ID',ldb_f_id)
		rds_matching.setitem(ll_row_matching, 'T_REF_ID',ldb_t_id)			
		rds_matching.setitem(ll_row_matching, 'F_REF_TABLE', 'OBJECT_TRANS')		
		rds_matching.setitem(ll_row_matching, 'T_REF_TABLE', 'OBJECT_TRANS')
		rds_matching.setitem(ll_row_matching, 'BASE_VALUE', ldb_match_base_value)
		rds_matching.setitem(ll_row_matching, 'TRANS_VALUE', ldb_match_trans_value)
		rds_matching.setitem(ll_row_matching, 'MATCH_TYPE', 'SETTLE')
		rds_matching.setitem(ll_row_matching, 'MATCHING_DATE',lc_date.f_getsysdate( ))
		// Cập nhập f_doc_id và t_doc_id
		ldb_f_doc_id=rdw_dr.getitemnumber(ll_row1,'doc_ref_id')
		ldb_t_doc_id=rdw_cr.getitemnumber(ll_row2,'doc_ref_id')
		rds_matching.setitem(ll_row_matching, 'F_DOC_ID',ldb_f_doc_id)
		rds_matching.setitem(ll_row_matching, 'T_DOC_ID', ldb_t_doc_id)			
		if upperbound(rdba_t_doc_id[]) > 0 then
			if ldb_t_doc_id <> rdba_t_doc_id[upperbound(rdba_t_doc_id[])] then
				rdba_t_doc_id[upperbound(rdba_t_doc_id[])+1] = ldb_t_doc_id
				rsa_t_doc_type[upperbound(rdba_t_doc_id[])+1] = ls_cr_doc_type
			end if
		else
			rdba_t_doc_id[1] = ldb_t_doc_id
			rsa_t_doc_type[1] = ls_cr_doc_type
		end if
		
		
		/*========= Tạo bút toán cấn trừ================*/
		li_rtn = this.f_create_settlement_ledger( ldb_dr_doc_id, ldb_dr_object_id, ls_dr_doc_code, ld_dr_trans_date, ldb_cr_doc_id, ldb_cr_object_id, ls_cr_doc_code, ld_cr_trans_date, ldb_settle_trans_value, ldb_settle_base_value, ld_settle_date, ldb_settle_curr, ldb_settle_exrate, ldb_exrate_diff_value)
		if li_rtn = -1 then return -1
		
		//-- cập nhật chi tiết bảng match --//				
		this.f_settle_detail(ldw_detail_dr, ldw_detail_cr, rds_matching,ll_row_dr,ldb_trans_dr, ldb_base_dr, ll_row_cr,ldb_trans_cr, ldb_base_cr)

		if ldb_cr_trans_amount = 0 and ldb_dr_currency = ldb_cr_currency  then ll_row2++
		if ldb_cr_base_amount = 0 and ldb_dr_currency <> ldb_cr_currency  then ll_row2++				
	LOOP
	
	if ldb_dr_trans_amount > 0 and ldb_dr_currency = ldb_cr_currency  then exit
	if ldb_dr_base_amount > 0 and ldb_dr_currency <> ldb_cr_currency  then exit
	
	if ldb_dr_trans_amount =0 and ldb_dr_currency = ldb_cr_currency  then ll_row1++
	if ldb_dr_base_amount =0 and ldb_dr_currency <> ldb_cr_currency  then ll_row1++

LOOP			

return 1
end function

public function integer f_settle_detail (ref t_dw_mpl rdw_detail_dr, ref t_dw_mpl rdw_detail_cr, ref t_ds_db rds_matching, ref long rl_row_dr, ref double rdb_trans_dr, ref double rdb_base_dr, ref long rl_row_cr, ref double rdb_trans_cr, ref double rdb_base_cr);
long			ll_row_matching
double		ldb_dr_currency, ldb_dr_doc_id, ldb_dr_object_id, ldb_dr_exrate, ldb_settle_curr
double		ldb_cr_currency, ldb_cr_doc_id, ldb_cr_object_id, ldb_cr_exrate , ldb_base_curr
double		ldb_settle_exrate,ldb_settle_trans_value,  ldb_match_trans_value, ldb_match_base_value, ldb_f_doc_id, ldb_t_doc_id, ldb_f_id, ldb_t_id
double		ldb_settle_base_value_dr, ldb_settle_base_value_cr, ldb_settle_base_value, ldb_exrate_diff_value, ldb_round_id
date			ld_dr_trans_date, ld_cr_trans_date, ld_settle_date
string			ls_dr_doc_code, ls_cr_doc_code,  ls_base_currcode, ls_base_currname, ls_cr_doc_type
//boolean		lb_dr_exrate_yn
int				li_rtn

c_datetime		lc_date


this.ic_unit_instance.f_get_base_cur( ldb_base_curr,  ls_base_currcode, ls_base_currname)
DO WHILE rl_row_dr <= rdw_detail_dr.rowcount()
	if rdb_trans_dr = 0 then
		rdb_base_dr= rdw_detail_dr.getitemnumber(rl_row_dr, 'remain_dr_base_value')
		rdb_trans_dr=rdw_detail_dr.getitemnumber(rl_row_dr, 'remain_dr_trans_value')
	end if
	ldb_dr_currency = rdw_detail_dr.getitemnumber(rl_row_dr, 'trans_currency')
	ld_dr_trans_date = date(rdw_detail_dr.getitemdatetime(rl_row_dr, 'trans_date'))
	ldb_dr_doc_id =  rdw_detail_dr.getitemnumber(rl_row_dr, 'doc_ref_id')
	ls_dr_doc_code =  rdw_detail_dr.getitemstring(rl_row_dr, 'doc_code')
	ldb_dr_object_id =  rdw_detail_dr.getitemnumber(rl_row_dr, 'object_id')
	ldb_dr_exrate =  rdw_detail_dr.getitemnumber(rl_row_dr, 'exchange_rate')		
	if ldb_dr_exrate = 0 or isnull(ldb_dr_exrate) then 
		gf_messagebox('m.c_settlement.f_settle.01','Thông báo','Chứng từ không có tỷ giá:'+ls_dr_doc_code,'exclamation','ok',1)
		return -1
	end if			

	
	DO WHILE  rl_row_cr <= rdw_detail_cr.rowcount() and rdb_base_dr > 0
		
		if rdb_trans_cr = 0 then
			rdb_base_cr=rdw_detail_cr.getitemnumber(rl_row_cr, 'remain_cr_base_value')					
			rdb_trans_cr=rdw_detail_cr.getitemnumber(rl_row_cr, 'remain_cr_trans_value')
		end if
		ldb_cr_currency = rdw_detail_cr.getitemnumber(rl_row_cr, 'trans_currency')					
		ld_cr_trans_date = date(rdw_detail_cr.getitemdatetime(rl_row_cr, 'trans_date'))
		ldb_cr_doc_id =  rdw_detail_cr.getitemnumber(rl_row_cr, 'doc_ref_id')
		ls_cr_doc_code =  rdw_detail_cr.getitemstring(rl_row_cr, 'doc_code')
		ldb_cr_object_id =  rdw_detail_cr.getitemnumber(rl_row_cr, 'object_id')
		ldb_cr_exrate =  rdw_detail_cr.getitemnumber(rl_row_cr, 'exchange_rate')
		if ldb_cr_exrate = 0 or isnull(ldb_cr_exrate) then 
			gf_messagebox('m.c_settlement.f_settle.02','Thông báo','Chứng từ không có tỷ giá:'+ls_cr_doc_code,'exclamation','ok',1)
			return -1
		end if								

		//====Tính số tiền cấn trừ ====//
																/////////////////////////////////////
		if ldb_dr_currency = ldb_cr_currency then //-- Tính cấn trừ cùng loại tiền --//
																///////////////////////////////////
			ldb_settle_curr = ldb_dr_currency
			ldb_round_id = this.ic_unit_instance.f_get_round_id( ldb_base_curr, 0, 'amount')
			//-- xác định tỷ giá cấn trừ : lấy tỷ giá của giao dịch phát sinh sau làm tỷ giá cấn trừ --//
			if ld_dr_trans_date > ld_cr_trans_date then
				ldb_settle_exrate = ldb_dr_exrate
				ld_settle_date = ld_dr_trans_date
			else
				ldb_settle_exrate = ldb_cr_exrate
				ld_settle_date = ld_cr_trans_date
			end if
			//-- xác định số tiền cấn trừ cập nhật bảng match then trans_amount--//		
			if rdb_trans_dr >= rdb_trans_cr then
				ldb_match_trans_value = rdb_trans_cr
				//-- số tiền base value cập nhật bảng match là số tiền lớn nhất tương ứng của số tiền trans_value theo tỷ giá giao dịch --//
				ldb_match_base_value = max(rdb_base_cr, ldb_match_trans_value * ldb_dr_exrate) //-- làm tròn --//
				//-- làm tròn: ldb_match_base_value--//
				ldb_match_base_value = this.ic_unit_instance.f_round( rdw_detail_cr,ldb_round_id, ldb_match_base_value)	
				
				rdb_trans_dr -= rdb_trans_cr
				rdb_base_dr = max(rdb_base_dr - ldb_match_base_value	, 0)			
				
				ldb_settle_base_value_cr = rdb_base_cr
				ldb_settle_base_value_dr =  ldb_match_trans_value * ldb_dr_exrate
				//-- làm tròn: ldb_settle_base_value_dr--//
				ldb_settle_base_value_dr = this.ic_unit_instance.f_round( rdw_detail_dr,ldb_round_id, ldb_settle_base_value_dr)	
				
				rdb_base_cr = 0
				rdb_trans_cr = 0
			else				
				ldb_match_trans_value = rdb_trans_dr
				//-- số tiền base value cập nhật bảng match là số tiền lớn nhất tương ứng của số tiền trans_value theo tỷ giá giao dịch --//
				ldb_match_base_value =  max(rdb_base_dr, ldb_match_trans_value * ldb_cr_exrate) //-- làm tròn --//
				//-- làm tròn: ldb_match_base_value--//
				ldb_match_base_value = this.ic_unit_instance.f_round( rdw_detail_cr,ldb_round_id, ldb_match_base_value)	
				
				rdb_trans_cr -= rdb_trans_dr
				rdb_base_cr = max(rdb_base_cr - ldb_match_base_value	, 0)	
				
				ldb_settle_base_value_cr = ldb_match_trans_value * ldb_cr_exrate
				//-- làm tròn: ldb_settle_base_value_cr--//				
				ldb_settle_base_value_cr = this.ic_unit_instance.f_round( rdw_detail_cr,ldb_round_id, ldb_settle_base_value_cr)				
				ldb_settle_base_value_dr =  rdb_base_dr 
				
				rdb_base_dr = 0
				rdb_trans_dr = 0
			end if										

				 ////////////////////////////////////////////////////////////////////////////
		else  //-- Tính: cấn trừ khác loại tiền: 1 là ngoại tệ, 1 là tiền hạch toán --// 	
				////////////////////////////////////////////////////////////////////////////
			if ldb_dr_currency <> ldb_base_curr and ldb_cr_currency <> ldb_base_curr then
				gf_messagebox('m.c_settlement.f_settle.03','Thông báo','@ Ngoại tệ khác nhau không được cấn trừ','exclamation','ok',1)
				return -1
			end if
			//-- xác định tỷ giá cấn trừ = tỷ giá của giao dịch bằng ngoại tệ --//
			if ldb_dr_currency = ldb_base_curr then 
				ldb_settle_curr = ldb_cr_currency
				ldb_settle_exrate = ldb_cr_exrate				
			else
				ldb_settle_curr = ldb_dr_currency
				ldb_settle_exrate = ldb_dr_exrate
			end if
			//-- xác định số tiền cấn trừ cập nhật bảng match theo base amount--//			
			if rdb_base_dr >= rdb_base_cr then
				ldb_match_base_value = rdb_base_cr
				ldb_match_trans_value = 0													
				rdb_base_dr -= rdb_base_cr											
				rdb_base_cr = 0
			else						
				ldb_match_base_value = rdb_base_dr
				ldb_match_trans_value = 0						
				rdb_base_cr -= rdb_base_dr						
				rdb_base_dr = 0
			end if

		end if						
		
		/*=========update bang match====================*/
		ldb_f_id=rdw_detail_dr.getitemnumber(rl_row_dr,'dr_ref_id')
		ldb_t_id=rdw_detail_cr.getitemnumber(rl_row_cr,'cr_ref_id')
		ll_row_matching=rds_matching .event e_addrow( )
		rds_matching.setitem(ll_row_matching, 'ID',this.f_create_id() )	
		rds_matching.setitem(ll_row_matching, 'F_REF_ID',ldb_f_id)
		rds_matching.setitem(ll_row_matching, 'T_REF_ID',ldb_t_id)			
		rds_matching.setitem(ll_row_matching, 'F_REF_TABLE', 'POST_LINE')		
		rds_matching.setitem(ll_row_matching, 'T_REF_TABLE', 'POST_LINE')
		rds_matching.setitem(ll_row_matching, 'BASE_VALUE', ldb_match_base_value)
		rds_matching.setitem(ll_row_matching, 'TRANS_VALUE', ldb_match_trans_value)
		rds_matching.setitem(ll_row_matching, 'MATCH_TYPE', 'SETTLE')
		rds_matching.setitem(ll_row_matching, 'MATCHING_DATE',lc_date.f_getsysdate( ))
		// Cập nhập f_doc_id và t_doc_id
		ldb_f_doc_id=rdw_detail_dr.getitemnumber(rl_row_dr,'doc_ref_id')
		ldb_t_doc_id=rdw_detail_cr.getitemnumber(rl_row_cr,'doc_ref_id')
		rds_matching.setitem(ll_row_matching, 'F_DOC_ID',ldb_f_doc_id)
		rds_matching.setitem(ll_row_matching, 'T_DOC_ID', ldb_t_doc_id)			
		
			
		if rdb_trans_cr = 0 and ldb_dr_currency = ldb_cr_currency  then rl_row_cr++
		if rdb_base_cr = 0 and ldb_dr_currency <> ldb_cr_currency  then rl_row_cr++				
	LOOP
	
	if rdb_trans_dr > 0 and ldb_dr_currency = ldb_cr_currency  then return 0
	if rdb_base_dr > 0 and ldb_dr_currency <> ldb_cr_currency  then 	return 0

	if rdb_trans_dr =0 and ldb_dr_currency = ldb_cr_currency  then rl_row_dr++
	if rdb_base_dr =0 and ldb_dr_currency <> ldb_cr_currency  then rl_row_dr++
LOOP			

return 1
end function

on c_settlement.create
call super::create
end on

on c_settlement.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = true
is_display_model = 'up_1d_1d_lo_tb'
ib_display_text = false
is_object_title = 'Phiếu cấn trừ'
is_exrate_type = 'buy'
istr_actionpane[1].s_button_name = ''
istr_actionpane[1].s_button_has_sub = ''
istr_actionpane[1].sa_sub_button[1]=''
istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_description = is_object_title

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
							istr_actionpane[li_idx].s_visible_buttons = 'b_settlement;b_cancel_settlement;b_blank;b_account_view;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_settlement;b_cancel_settlement;b_blank;b_account_view;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons =  'b_settlement;b_cancel_settlement;b_blank;b_account_view;'
						else
							istr_actionpane[li_idx].s_visible_buttons =  'b_settlement;b_cancel_settlement;b_blank;b_account_view;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons= 'b_settlement;b_cancel_settlement;b_blank;b_account_view;'
					else
						istr_actionpane[li_idx].s_visible_buttons= 'b_settlement;b_cancel_settlement;b_blank;b_account_view;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =   'b_sal_invoice;b_sal_invoice_return;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
				istr_actionpane[li_idx].s_visible_buttons =  'b_book; b_attach; b_note;b_doc_trace_on;b_user_trace;b_appr_trace;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then							
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.dynamic f_set_ii_upperpart_height(iw_display.ii_resize_height/8 )

iw_display.dynamic f_set_ii_leftpart_width( iw_display.ii_resize_width /2  )

return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;double			ldb_object_id_dr, ldb_object_id_cr, ldb_settled_base_dr
long				ll_row
string				ls_settle_yn
any				laa_data[]
t_dw_mpl		ldw_hdr_dr, ldw_hdr_cr, ldw_settle_dr, ldw_settle_cr
t_transaction	lt_transaction

if AncestorReturnValue = 1 then return 1

this.iw_display.f_get_transaction(lt_transaction)
if mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_settlement_dr' then
	if vs_colname = 'object_code' then
		//-- set dw tham so cr
		ldb_object_id_dr=rpo_dw.getitemnumber(vl_currentrow,'object_id')
		ls_settle_yn=rpo_dw.getitemstring(rpo_dw.getrow(),'settle_yn')
		ldw_settle_cr=iw_display.f_get_dw( 'd_settlement_cr_form')
		ldw_settle_cr.setitem(ldw_settle_cr.getrow(),'object_type',rpo_dw.getitemstring(rpo_dw.getrow(),'object_type'))
		ldw_settle_cr.setitem(ldw_settle_cr.getrow(),'object_id',rpo_dw.getitemnumber(rpo_dw.getrow(),'object_id'))
		ldw_settle_cr.setitem(ldw_settle_cr.getrow(),'object_code',vs_editdata)

		if ls_settle_yn='Y' then
			//-- get dw dr --//
			ldw_hdr_dr=iw_display.f_get_dw( 'd_settled_hdr_dr_grid')	
			//-- get dw cr --//
			ldw_hdr_cr=iw_display.f_get_dw( 'd_settled_hdr_cr_grid')					
			laa_data[1] = '<>()'
			laa_data[2] = ldb_object_id_dr	
			this.f_replace_where(ldw_hdr_dr, 'match_id;object_id',  laa_data[])
			this.f_replace_where(ldw_hdr_cr, 'match_id;object_id',  laa_data[])
		else
			//-- get dw dr --//
			ldw_hdr_dr=iw_display.f_get_dw( 'd_settle_hdr_dr_grid')	
			//-- get dw cr --//
			ldw_hdr_cr=iw_display.f_get_dw( 'd_settle_hdr_cr_grid')					
			laa_data[1] = '>0'
			laa_data[2] = '>0'
			laa_data[3] = ldb_object_id_dr	
			this.f_replace_where(ldw_hdr_dr, 'remain_dr_trans_value;remain_dr_base_value;object_id',  laa_data[])
			this.f_replace_where(ldw_hdr_cr, 'remain_cr_trans_value;remain_cr_base_value;object_id',  laa_data[])
		end if
		ldw_hdr_dr.event e_retrieve( )
		ldw_hdr_cr.event e_retrieve( )
	elseif vs_colname = 'settle_yn' then

		//lay dw chua object
		ldb_object_id_dr=rpo_dw.getitemnumber(vl_currentrow,'object_id')
		ldw_settle_cr=iw_display.f_get_dw( 'd_settlement_cr_from')
		ldb_object_id_cr=ldw_settle_cr.getitemnumber(ldw_settle_cr.getrow(),'object_id')
		if vs_editdata='Y' then
			//get dw dr
			ldw_hdr_dr=iw_display.f_get_dw( 'd_settle_hdr_dr_grid')
			ldw_hdr_dr.dataobject = 'd_settled_hdr_dr_grid'
			ldw_hdr_dr.settransobject(lt_transaction) 
			//get dw cr
			ldw_hdr_cr=iw_display.f_get_dw( 'd_settle_hdr_cr_grid')		
			ldw_hdr_cr.dataobject = 'd_settled_hdr_cr_grid'
			ldw_hdr_cr.settransobject(lt_transaction) 			
			
			laa_data[1] = '>0'
			laa_data[2] = '>0'	
			laa_data[3] = ldb_object_id_dr		
			this.f_replace_where(ldw_hdr_dr, 'match_id;dr_amount;object_id',  laa_data[])
			laa_data[3] = ldb_object_id_cr	
			this.f_replace_where(ldw_hdr_cr, 'match_id;cr_amount;object_id',  laa_data[])			
		else
			//get dw dr
			ldw_hdr_dr=iw_display.f_get_dw( 'd_settled_hdr_dr_grid')
			ldw_hdr_dr.dataobject = 'd_settle_hdr_dr_grid'
			ldw_hdr_dr.settransobject(lt_transaction) 
			//get dw cr
			ldw_hdr_cr=iw_display.f_get_dw( 'd_settled_hdr_cr_grid')		
			ldw_hdr_cr.dataobject = 'd_settle_hdr_cr_grid'
			ldw_hdr_cr.settransobject(lt_transaction) 						
			laa_data[1] = '>0'
			laa_data[2] = '>0'
			laa_data[3] = ldb_object_id_dr	
			this.f_replace_where(ldw_hdr_dr, 'remain_dr_trans_value;remain_dr_base_value;object_id',  laa_data[])		
			laa_data[3] = ldb_object_id_cr	
			this.f_replace_where(ldw_hdr_cr, 'remain_cr_trans_value;remain_cr_base_value;object_id',  laa_data[])	
		end if
		ldw_hdr_dr.event e_retrieve( )
		ldw_hdr_cr.event e_retrieve( )		
	end if	
elseif mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_settlement_cr' then
	if vs_colname = 'object_code' then
		ldw_settle_cr=iw_display.f_get_dw( 'd_settlement_dr_from')
		ls_settle_yn=ldw_settle_cr.getitemstring(ldw_settle_cr.getrow(),'settle_yn')
		ldb_object_id_cr=rpo_dw.getitemnumber(rpo_dw.getrow(),'object_id')
			
		
		if ls_settle_yn='Y' then
			ldw_hdr_cr=iw_display.f_get_dw( 'd_settled_hdr_cr_grid')
			laa_data[1] = '<>()'
			laa_data[2] = '>0'	
			laa_data[3] = ldb_object_id_cr	
			this.f_replace_where(ldw_hdr_cr, 'match_id;cr_amount;object_id',  laa_data[])				
		else	
			ldw_hdr_cr=iw_display.f_get_dw( 'd_settle_hdr_cr_grid')
			laa_data[1] = '>0'	
			laa_data[2] = '>0'	
			laa_data[3] = ldb_object_id_cr	
			this.f_replace_where(ldw_hdr_cr, 'remain_cr_trans_value;remain_cr_base_value;object_id',  laa_data[])					
		end if
		ldw_hdr_cr.event e_retrieve( )	
	end if		
end if
return AncestorReturnValue

end event

event e_window_open;call super::e_window_open;t_dw_mpl		ldw_dr_p, ldw_cr_p

//--form parm--//
ldw_dr_p =iw_display.f_get_dw( 'd_settlement_dr_form')
ldw_dr_p.insertrow(0)
ldw_cr_p =iw_display.f_get_dw( 'd_settlement_cr_form')
ldw_cr_p.insertrow(0)
this.f_ctrl_actionbuttons(ldw_dr_p)
return 0
end event

event e_window_e_settlement;call super::e_window_e_settlement;
int						li_rtn, li_idx
string					ls_settle_yn, lsa_t_doc_type[]
double				ldba_t_doc_id[]

t_dw_mpl 			ldw_dr, ldw_cr, ldw_settle
t_ds_db				lds_matching
transaction			lt_transaction


ldw_settle=iw_display.f_get_dw('d_settlement_dr_form')
ls_settle_yn=ldw_settle.getitemstring(ldw_settle.getrow(),'settle_yn')
if ls_settle_yn='N' then		
	ldw_dr=iw_display.f_get_dw('d_settle_hdr_dr_grid')
	ldw_cr=iw_display.f_get_dw('d_settle_hdr_cr_grid')
	
	//filter cac dong da dc chon
	ldw_dr.setfilter("gutter='Y'")
	ldw_dr.filter( )
	ldw_cr.setfilter("gutter='Y'")
	ldw_cr.filter( )

	
	if ldw_dr.rowcount( ) >0 and ldw_cr.rowcount( ) >0 then				
		ldw_dr.SetSort("trans_date asc")
		ldw_dr.Sort()
		ldw_cr.SetSort("trans_date asc")
		ldw_cr.Sort()
		iw_display.f_get_transaction(lt_transaction)
		lds_matching = create t_ds_db
		lds_matching.dataobject = 'ds_matching'
		lds_matching.f_settransobject( lt_transaction)			
	// tinh toan
		if this.f_settle(ldw_dr, ldw_cr, lds_matching, ldba_t_doc_id[], lsa_t_doc_type[]) = -1 then return -1

		//update
		li_rtn=lds_matching.update(true,false)
		if 	li_rtn=1 then	
			//-- Cập nhật trạng thái chứng từ liên quan --//
			FOR li_idx = 1 to upperbound(ldba_t_doc_id[])
				this.event e_statuschanged( 'settled', ldba_t_doc_id[li_idx], lsa_t_doc_type[li_idx], true)
			NEXT
			
			lds_matching.resetupdate( )
			commit using lt_transaction;
			ldw_dr.setfilter("")
			ldw_dr.filter( )
			ldw_cr.setfilter("")
			ldw_cr.filter( )
			li_rtn=ldw_dr.event e_retrieve( )
			li_rtn=ldw_cr.event e_retrieve( )
			gf_messagebox('m.c_settlement.e_window_e_settlement.01','Thông báo','Cấn trừ thành công','information','ok',1)
			destroy lds_matching
			return 1
		else
			gf_messagebox('m.c_settlement.e_window_e_settlement.02','Thông báo','Lỗi, không cấn trừ được:@'+lt_transaction.sqlerrtext,'stop','ok',1)
			rollback using lt_transaction;
			destroy lds_matching
			return -1
		end  if
	else
		ldw_dr.setfilter("")
		ldw_dr.filter( )
		ldw_cr.setfilter("")
		ldw_cr.filter( )
		gf_messagebox('m.c_settlement.e_window_e_settlement.03','Thông báo','Chưa chọn chứng từ cấn trừ','exclamation','ok',1)
		return 0
	end if
else
	gf_messagebox('m.c_settlement.e_window_e_settlement.04','Thông báo','Phải bỏ tích chọn xem phiếu đã cấn trừ','exclamation','ok',1)
end if
return 0

end event

event e_window_e_cancel_settlement;call super::e_window_e_cancel_settlement;
long 				ll_find
double			ldb_dr_doc_id, ldba_cr_doc_id[], ldb_t_doc_id
string				ls_settle_yn, ls_match_id, ls_delete, ls_doc_id, lsa_doc_type[],ls_t_doc_id
t_dw_mpl    	ldw_hdr_dr,ldw_hdr_cr,ldw_settle_dr
transaction		lt_transaction



ldw_settle_dr=iw_display.f_get_dw( 'd_settlement_dr_form')
ls_settle_yn=ldw_settle_dr.getitemstring(ldw_settle_dr.getrow( ) ,'settle_yn')
if ls_settle_yn='Y' then
	ldw_hdr_dr=iw_display.f_get_dw( 'd_settled_hdr_dr_grid')
	ldw_hdr_cr=iw_display.f_get_dw( 'd_settled_hdr_cr_grid')
	ll_find=ldw_hdr_dr.find("gutter='Y'",1,ldw_hdr_dr.rowcount( ))
	do while  ll_find >0
		if ls_match_id <> '' then ls_match_id += ','
		if ls_doc_id <> '' then ls_doc_id += ','
		ls_match_id += string(ldw_hdr_dr.getitemnumber(ll_find, 'match_id'))
		ldb_dr_doc_id = ldw_hdr_dr.getitemnumber(ll_find, 'doc_ref_id')

		//-- xóa document, postline, ledgertrans nếu có--//
		if this.f_delete_settlement_ledger(ldb_dr_doc_id ) = -1 then return -1
		ll_find=ldw_hdr_dr.find("gutter='Y'",ll_find+1,ldw_hdr_dr.rowcount( )+1)
	loop 
	//-- lưu lại các doc ID của chứng từ TO để cập nhật lại trạng thái của chứng từ liên quan --//
	ll_find=ldw_hdr_cr.find("gutter='Y'",1,ldw_hdr_cr.rowcount( ))
	do while  ll_find > 0
		ldb_t_doc_id = ldw_hdr_cr.getitemnumber(ll_find, 'doc_ref_id')
		if upperbound(ldba_cr_doc_id[]) > 0 then
			if ldb_t_doc_id <> ldba_cr_doc_id[upperbound(ldba_cr_doc_id[])] then
				ldba_cr_doc_id[upperbound(ldba_cr_doc_id[])+1] = ldb_t_doc_id
				lsa_doc_type[upperbound(lsa_doc_type[])+1] = ldw_hdr_cr.getitemstring(ll_find, 'doc_type')
				ls_t_doc_id += ',' + string(ldb_t_doc_id)
			end if
		else
			ldba_cr_doc_id[1] = ldb_t_doc_id
			lsa_doc_type[1] = ldw_hdr_cr.getitemstring(ll_find, 'doc_type')
			ls_t_doc_id = string(ldb_t_doc_id)
		end if
		ll_find=ldw_hdr_cr.find("gutter='Y'",ll_find+1,ldw_hdr_cr.rowcount( )+1)
	loop 	
	
	if ls_match_id <>'' then
		iw_display.f_get_transaction(lt_transaction)
		//-- Cập nhật lại trạng thái chứng từ liên quan trước khi xóa bảng matching --//
		
		//-- Xóa bảng matching (xóa match tổng object_trans) --//
		if pos(ls_match_id ,',') > 0 then
			ls_delete='delete from matching where id in ('+ls_match_id+') '
		else
			ls_delete='delete from matching where id = '+ ls_match_id
		end if
		EXECUTE IMMEDIATE :ls_delete using lt_transaction ;
		if lt_transaction.sqlcode <>0 then
			gf_messagebox('m.c_settlement.e_window_e_cancel_settlement.01','Thông báo','Lỗi, không hủy cấn trừ được:@'+lt_transaction.sqlerrtext ,'stop','ok',1)
			rollback using  lt_transaction;
			return -1
		end if
		//-- Cập nhật lại trạng thái chứng từ liên quan --//
		FOR ll_find = 1 to upperbound(ldba_cr_doc_id[])
			this.event e_statuschanged( 'settled', ldba_cr_doc_id[ll_find], lsa_doc_type[ll_find], false)
		NEXT
		//-- xóa bảng matching( xóa match chi tiết post_line)  --//
		if pos(ls_t_doc_id ,',') > 0 then
			ls_delete='delete from matching where t_doc_id in ('+ls_t_doc_id+") AND MATCH_TYPE = 'SETTLE'"
		else
			ls_delete='delete from matching where t_doc_id = '+ ls_t_doc_id + " AND MATCH_TYPE = 'SETTLE'"
		end if
		EXECUTE IMMEDIATE :ls_delete using lt_transaction ;
		if lt_transaction.sqlcode <>0 then
			gf_messagebox('m.c_settlement.e_window_e_cancel_settlement.01','Thông báo','Lỗi, không hủy cấn trừ được:@'+lt_transaction.sqlerrtext ,'stop','ok',1)
			rollback using  lt_transaction;
			return -1
		end if
		
		commit using  lt_transaction ; 
		gf_messagebox('m.c_settlement.e_window_e_cancel_settlement.02','Thông báo','Hủy cấn trừ thành công','information','ok',1)
		ldw_hdr_dr.event e_retrieve( )
		ldw_hdr_cr.event e_retrieve( )
		return 1
	else
		gf_messagebox('m.c_settlement.e_window_e_cancel_settlement.03','Thông báo','Chưa chọn chứng từ hủy cấn trừ ','exclamation','ok',1)
		return 0
	end if
else
	gf_messagebox('m.c_settlement.e_window_e_cancel_settlement.04','Thông báo','Phải tích chọn các phiếu đã cấn trừ','exclamation','ok',1)
	return 0
end if

end event

event e_dw_clicked;call super::e_dw_clicked;
string			ls_settle_yn
double		ldb_settled_base_dr, ldb_settled_base_cr, ldb_settled_trans_dr, ldb_settled_trans_cr
t_dw_mpl 	ldw_hdr_dr,ldw_hdr_cr, ldw_settle_dr


if rdw_handling.dataobject='d_settle_hdr_dr_grid' then
	if vs_colname = 'gutter' or vs_colname = 'gutter_t' then
		ldw_hdr_cr=iw_display.f_get_dw( 'd_settle_hdr_cr_grid')
		ldb_settled_base_dr = rdw_handling.object.dr_base_settled_sum[1]		
		ldb_settled_base_cr = ldw_hdr_cr.object.cr_base_settled_sum[1]
		rdw_handling.object.dr_base_diff.text = string(ldb_settled_base_dr - ldb_settled_base_cr ,"#,##0.###; [red](#,##0.###)")
		ldw_hdr_cr.object.cr_base_diff.text = string(ldb_settled_base_cr - ldb_settled_base_dr ,"#,##0.###; [red](#,##0.###)")

		ldb_settled_trans_dr = rdw_handling.object.dr_trans_settled_sum[1]		
		ldb_settled_trans_cr = ldw_hdr_cr.object.cr_trans_settled_sum[1]
		rdw_handling.object.dr_trans_diff.text = string(ldb_settled_trans_dr - ldb_settled_trans_cr ,"#,##0.###; [red](#,##0.###)")		
		ldw_hdr_cr.object.cr_trans_diff.text = string(ldb_settled_trans_cr - ldb_settled_trans_dr ,"#,##0.###; [red](#,##0.###)")
		
		ldw_settle_dr=iw_display.f_get_dw( 'd_settlement_dr_form')
		ls_settle_yn=ldw_settle_dr.getitemstring( ldw_settle_dr.getrow(),'settle_yn')		
	end if
elseif rdw_handling.dataobject='d_settle_hdr_cr_grid' then
	if vs_colname = 'gutter' or vs_colname = 'gutter_t' then
		ldw_hdr_dr=iw_display.f_get_dw( 'd_settle_hdr_dr_grid')
		ldb_settled_base_cr = rdw_handling.object.cr_base_settled_sum[1]		
		ldb_settled_base_dr = ldw_hdr_dr.object.dr_base_settled_sum[1]
		rdw_handling.object.cr_base_diff.text = string(ldb_settled_base_cr - ldb_settled_base_dr ,"#,##0.###; [red](#,##0.###)")
		ldw_hdr_dr.object.dr_base_diff.text = string(ldb_settled_base_dr - ldb_settled_base_cr ,"#,##0.###; [red](#,##0.###)")

		ldb_settled_trans_cr = rdw_handling.object.cr_trans_settled_sum[1]		
		ldb_settled_trans_dr = ldw_hdr_dr.object.dr_trans_settled_sum[1]
		rdw_handling.object.cr_trans_diff.text = string(ldb_settled_trans_cr - ldb_settled_trans_dr ,"#,##0.###; [red](#,##0.###)")		
		ldw_hdr_dr.object.dr_trans_diff.text = string(ldb_settled_trans_dr - ldb_settled_trans_cr ,"#,##0.###; [red](#,##0.###)")	
		
		ldw_settle_dr=iw_display.f_get_dw( 'd_settlement_dr_form')
		ls_settle_yn=ldw_settle_dr.getitemstring( ldw_settle_dr.getrow(),'settle_yn')		
	
	end if	
elseif rdw_handling.dataobject='d_settled_hdr_dr_grid' then
	if vs_colname = 'gutter' then
		ldw_hdr_cr=iw_display.f_get_dw( 'd_settled_hdr_cr_grid')
		this.f_select_settled_document(rdw_handling, vl_currentrow,  ldw_hdr_cr)
	end if
elseif rdw_handling.dataobject='d_settled_hdr_cr_grid' then
	if vs_colname = 'gutter' then
		ldw_hdr_dr=iw_display.f_get_dw( 'd_settled_hdr_dr_grid')
		this.f_select_settled_document(rdw_handling, vl_currentrow,  ldw_hdr_dr)
	end if
end if
return 0

end event

event e_widnow_e_preaccounting;call super::e_widnow_e_preaccounting;double				ldb_doc_id, ldb_doc_ref_id
any					la_data[], la_null[]
string					ls_settle_yn
c_post_line			lc_post_line
t_ds_db				lds_post_line
t_dw_mpl			ldw_settle_dr,ldw_hdr_dr

ldw_settle_dr=iw_display.f_get_dw( 'd_settlement_dr_form')
ls_settle_yn=ldw_settle_dr.getitemstring(ldw_settle_dr.getrow( ) ,'settle_yn')
if ls_settle_yn='Y' then
	ldw_hdr_dr=iw_display.f_get_dw( 'd_settled_hdr_dr_grid')
	ldb_doc_ref_id = ldw_hdr_dr.getitemnumber(ldw_hdr_dr.getrow(), 'doc_ref_id')
	select ID into :ldb_doc_id from DOCUMENT where OBJECT_REF_ID = :ldb_doc_ref_id using sqlca;
	if isnull(ldb_doc_id) or ldb_doc_id = 0 then
		gf_messagebox('m.c_settlement.e_window_e_preaccounting.01','Thông báo','Không có bút toán phát sinh','information','ok',1)
		return 1
	end if
	lds_post_line = create t_ds_db
	lc_post_line = create c_post_line
	lc_post_line.f_set_doc_id(ldb_doc_id)
	la_data[1] = ldb_doc_id	
	lc_post_line.f_init_object_table(lds_post_line, 'd_post_line_grid','doc_id', la_data[], la_null[])
	openwithparm(s_wr_multi, lc_post_line )
end if
//gf_messagebox('m.c_settlement.e_window_e_preaccounting.01','Thông báo','Không có bút toán phát sinh','information','ok',1)
return 1

end event

