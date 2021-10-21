$PBExportHeader$t_ds_db.sru
$PBExportComments$datastore associated with database, inherited from t_ds
forward
global type t_ds_db from t_ds
end type
end forward

global type t_ds_db from t_ds
event type integer e_preinsertrow ( )
event type integer e_preretrieve ( )
event type long e_retrieve ( )
end type
global t_ds_db t_ds_db

type variables

string 	is_originalwhereClause
protected:
any 		ia_retrieve_arg[]

boolean 	ib_cancelling, ib_deleting, ib_editing, ib_valuesetting, ib_inserting, ib_displaying, ib_dummy_row, ib_traceable
boolean	ib_saving, ib_retrieving, ib_edit_changing, ib_ref_table_yn

double	idb_upd_ID[], idb_insert_ID[]


s_str_dwo_related			istr_data_related[]
end variables

forward prototypes
public function boolean f_isdelete ()
public function integer f_reset ()
public function integer f_retrieve_detail ()
public subroutine f_set_dwdetail (ref t_dw_mpl rdw_master)
public subroutine f_set_dwdetail (ref t_dw_mpl rdw_master, string vs_master_keycol, string vs_detail_keycol)
public subroutine f_set_dwdetail (ref t_dw_mpl rdw_master, string vs_keycol)
public function string f_chk_required_data ()
public function integer f_chk_ora_dberror (long vl_err_code)
public function any f_getitemany (long al_row, string as_column, dwbuffer adw_buffer, boolean ab_orig_value)
public function any f_getitemany (long al_row, string as_column)
public function any f_getitemany (long al_row, integer ai_column, dwbuffer adw_buffer, boolean ab_orig_value)
public function any f_getitemany (long al_row, integer ai_column)
public function integer f_upd_track_info ()
public function string f_buildwhereclause ()
protected function integer f_buildwhereclause_of_relation (ref s_str_dwo_related rstr_data_related[])
public function integer f_set_data_related (s_str_dwo_related vstr_data_related[])
public function integer f_get_data_related (ref s_str_dwo_related rstr_data_related[])
public function integer f_set_retrieve_args (any va_args[])
public subroutine f_set_ib_traceable (boolean vb_traceable)
public function integer f_remove_where ()
public function integer f_add_originalwhere (string vs_where, string vs_operator)
public function integer f_build_join_where_4_posting (string vs_join, string vs_where, string vs_operator)
public function integer f_getcolumns_update (ref string as_columns[])
public function integer f_get_doc_trace (ref string rs_where, ref string rs_sort)
end prototypes

event type integer e_preretrieve();/*==============================
Chức năng:
	- Set security cho dw trước khi retrieve
	- Set properties cho dw trước khi retrieve
	- Gán tham số retrieve: ia_retrieve_arg[]
    - Thông báo cho ic_obj_handling
----------------------------------------------------------
return (integer): 0 Không gán gì cả
					: 1 Gán thành công
					: -1 lỗi
===============================*/
//int								li_rtn
//string							ls_currentSQL,ls_currentWhere, ls_originalWhere, ls_rtn, ls_modify, ls_Where
//c_sql							lc_sql
//
//if this.f_getcurrentSQL( ls_currentSQL, ls_currentWhere) =1 then
//	if isnull(is_originalwhereClause) or is_originalwhereClause = '' then
//		is_originalwhereClause = ls_currentWhere
//	end if
//	
//	ls_originalWhere = is_originalwhereClause	
//	ls_Where = this.f_buildwhereclause( ) 
//	if isnull(ls_Where) then 
//		return -1
//	end if	
//	
//	if ls_originalWhere <> '' then		
//		ls_originalWhere += ' AND '		
//	end if
//	if ls_Where <> '' then 
//		ls_Where = ls_originalWhere + ls_Where
//	else
//		ls_Where = is_originalwhereClause
//	end if
//	
//	if ls_Where <> "" then
//		lc_sql.f_addtowhereclause( ls_currentSQL, ls_Where, " AND ")
//	end if
//	if ls_currentWhere <> ls_Where then
//		ls_modify = 'Datawindow.Table.Select= "' + ls_currentSQL +'"'
//		ls_rtn =this.modify(ls_modify )
//	end if
//end if

return 0
end event

event type long e_retrieve();int 						li_preretrieve
any 							la_retrieve_arg[15]
long 							ll_rtn

setpointer(HourGlass!)

li_preretrieve = this.event e_preretrieve( )

if li_preretrieve <> -1 then
	//-- lấy tham so retrieve --//
	la_retrieve_arg[ ] = ia_retrieve_arg[]				
else //-- preretieve loi --//
	return -1
end if

ll_rtn = this.retrieve(la_retrieve_arg[1], la_retrieve_arg[2], la_retrieve_arg[3], la_retrieve_arg[4],la_retrieve_arg[5], &
							la_retrieve_arg[6], la_retrieve_arg[7], la_retrieve_arg[8], la_retrieve_arg[9], la_retrieve_arg[10], la_retrieve_arg[11], la_retrieve_arg[12], la_retrieve_arg[13], la_retrieve_arg[14], la_retrieve_arg[15] )		

setpointer(arrow!)
return ll_rtn
end event

public function boolean f_isdelete ();return true
end function

public function integer f_reset ();int li_numdetails, li_i, li_rc = 1



Return li_rc
	
end function

public function integer f_retrieve_detail ();/*
return 1: success

*/
int li_idx
long ll_rows

return ll_rows

end function

public subroutine f_set_dwdetail (ref t_dw_mpl rdw_master);
end subroutine

public subroutine f_set_dwdetail (ref t_dw_mpl rdw_master, string vs_master_keycol, string vs_detail_keycol);
end subroutine

public subroutine f_set_dwdetail (ref t_dw_mpl rdw_master, string vs_keycol);
end subroutine

public function string f_chk_required_data ();/* Usage: khi save datawidnow, hàm kiểm tra tất cả các column bắt buộc nhập liệu
- return chuỗi tên cột bắt buộc nhập nhưng chưa có dữ liệu, null nếu ko có cột nào như thế */
//string ls_dwo, ls_col_string, ls_colname, ls_datatype, ls_coltext
//int  li_count, li_cols, li_idx, ll_cur_row
//boolean lb_required
//try
//	ls_dwo = this.dataobject
//	ll_cur_row = this.getrow( )
//	DECLARE lcs_req_column cursor for
//	SELECT dwcolumn from erp_dwcolumn_setup
//	WHERE dwobject = :ls_dwo and company_id = :gi_user_comp_id and upper(mandatory_yn) = 'Y';
//	open lcs_req_column;
//	FETCH lcs_req_column  into :ls_colname;
//	DO while sqlca.sqlcode = 0
//		li_cols = integer(this.object.datawindow.column.count)
//		FOR li_idx = 1 to li_cols
//			if  this.describe( "#"+string(li_idx)+".name") = ls_colname then
//				ls_coltext = this.describe( ls_colname+"_t.text")
//				ls_datatype = this.describe( "#"+string(li_idx)+".coltype")
//				CHOOSE CASE Lower ( Left ( ls_datatype , 5 ) )
//					CASE "numbe", "long", "ulong", "real", "int"	
//						dec lr_data
//						lr_data = this.getitemnumber( ll_cur_row, li_idx)
//						if isnull(lr_data) then ls_col_string = ls_col_string + ls_coltext +","
//					CASE "char(", "char"
//						string ls_data
//						ls_data = this.getitemstring( ll_cur_row, li_idx)
//						if isnull(ls_data) or trim(ls_data) = '' then ls_col_string = ls_col_string + ls_coltext +","
//					CASE "date"
//						string ldt_data
//						ldt_data = this.getitemstring( ll_cur_row, li_idx)
//						if isnull(ldt_data) or trim(ldt_data) = '' then ls_col_string = ls_col_string + ls_coltext +","				
//					CASE "datet"
//					CASE "decim"
//					CASE "time", "times"
//				END CHOOSE
//				
//				exit
//				
//			end if
//		NEXT
//		FETCH lcs_req_column  into :ls_colname;
//	LOOP
//	if not isnull(ls_col_string) then ls_col_string = left(ls_col_string,len(ls_col_string)-1)
//	if  trim(ls_col_string) = '' then setnull(ls_col_string)
	return ''
//catch (runtimeerror lre)
////	openwithparm(c_w_err, lre.text)
//end try
end function

public function integer f_chk_ora_dberror (long vl_err_code);try
	choose case vl_err_code
		case 1400
//			gf_messagebox("datarequired")
		case 2292
//			gf_messagebox("delete_integrity")
		case 2291
//			gf_messagebox("no_match_integrity")
		case else
//			messagebox('db Error',vl_err_code)
	end choose
	return 1
catch (runtimeerror lre)
//	openwithparm(c_w_err, lre.text)
end try
end function

public function any f_getitemany (long al_row, string as_column, dwbuffer adw_buffer, boolean ab_orig_value);any 		la_value

/*  Determine the datatype of the column and then call the appropriate 
	 GetItemxxx function and cast the returned value */
CHOOSE CASE Lower ( Left ( this.Describe ( as_column + ".ColType" ) , 5 ) )

		CASE "char(", "char"		//  CHARACTER DATATYPE
			la_value = this.GetItemString ( al_row, as_column, adw_buffer, ab_orig_value ) 
	
		CASE "date"					//  DATE DATATYPE
			la_value = this.GetItemDate ( al_row, as_column, adw_buffer, ab_orig_value ) 

		CASE "datet"				//  DATETIME DATATYPE
			la_value = this.GetItemDateTime ( al_row, as_column, adw_buffer, ab_orig_value ) 
			
		CASE "decim"				//  DECIMAL DATATYPE
			la_value = this.GetItemDecimal ( al_row, as_column, adw_buffer, ab_orig_value ) 
	
		CASE "numbe", "long", "ulong", "real", "int"				//  NUMBER DATATYPE	
			la_value = this.GetItemNumber ( al_row, as_column, adw_buffer, ab_orig_value ) 
	
		CASE "time", "times"		//  TIME DATATYPE
			la_value = this.GetItemTime ( al_row, as_column, adw_buffer, ab_orig_value ) 

		CASE ELSE 					
			SetNull ( la_value ) 

END CHOOSE

Return la_value
end function

public function any f_getitemany (long al_row, string as_column);Return f_GetItemany ( al_row, as_column, Primary!, FALSE )
end function

public function any f_getitemany (long al_row, integer ai_column, dwbuffer adw_buffer, boolean ab_orig_value);string ls_columnname 

ls_columnname = This.Describe ( "#" + String( ai_column ) + ".name" )

Return f_GetItemany ( al_row, ls_columnname, adw_buffer, ab_orig_value )
end function

public function any f_getitemany (long al_row, integer ai_column);string ls_columnname 

ls_columnname = This.Describe ( "#" + String( ai_column ) + ".name" )

Return f_GetItemany ( al_row, ls_columnname, Primary!, FALSE )
end function

public function integer f_upd_track_info ();/* return 0 succeed, -1 error*/
string				ls_updatetable, ls_updSQL,ls_sysdate,ls_format
long					ll_idx
double				ladb_empty[]
datetime				ldt_sysdate
c_datetime			lc_datet

ls_updatetable = this.describe( "DataWindow.Table.UpdateTable")

ls_format = lc_datet.f_get_sessiondate_format_ex(it_transaction )
ls_sysdate = lc_datet.f_getsysdate_ex(ls_format + " hh24:mi:ss" , it_transaction)
//-- update track infor when insert new record --//
FOR ll_idx =1 to upperbound(idb_insert_id[])
	ls_updSQL = "UPDATE "+ls_updatetable + &
						" SET created_by = "+string(gi_userid)+ & 
						", 	     created_date = to_date('" + ls_sysdate +"','"+ ls_format + " hh24:mi:ss') " + &
						", 	     last_mdf_date = to_date('" + ls_sysdate +"','"+ ls_format + " hh24:mi:ss') " + &
						", 	     last_mdf_by = "+string(gi_userid)+ & 
						"WHERE ID = "+ string(idb_insert_id[ll_idx])
	if isnull(ls_updSQL)	then 
		//Chưa khởi tạo ID khi add dòng mới vào datastore
		messagebox('Lỗi','t_ds_db.f_upd_track_info(line:17)')
		return -1
	end if
	EXECUTE IMMEDIATE :ls_updSQL using it_transaction ;
	if it_transaction.sqlcode <> 0 then
		messagebox('ERROR', 'f_upd_track_info')
		return -1
	end if
NEXT
idb_insert_id[] = ladb_empty[]
FOR ll_idx =1 to upperbound(idb_upd_id[])
	ls_updSQL = "UPDATE "+ls_updatetable + &
						" SET last_mdf_date = to_date('" + ls_sysdate +"','"+ ls_format + " hh24:mi:ss') " + &
						", 	     last_mdf_by = "+string(gi_userid)+ & 
						"WHERE ID = "+ string(idb_upd_id[ll_idx])
	if isnull(ls_updSQL)	then 
		//Chưa khởi tạo ID khi add dòng mới vào datastore
		messagebox('Lỗi','t_ds_db.f_upd_track_info(line:17)')
		return -1
	end if					
	EXECUTE IMMEDIATE :ls_updSQL  using it_transaction;
	if it_transaction.sqlcode <> 0 then
		messagebox('ERROR', 'f_upd_track_info')
		return -1
	end if
NEXT
idb_upd_id[] = ladb_empty[]


return 0
	

end function

public function string f_buildwhereclause ();int					li_idx, li_count,li_rtn
string 			ls_whereclause, ls_where_master, ls_related_dwo
any				la_master_key_value[]
string				ls_dwcolumns[],ls_criteria_of_dwcolumns[],ls_rtn

window						lw_parent
datastore						lds_handle
powerobject					lpo_handling
s_str_dwo_related			lstr_data_related[]
c_dwservice_ex					lc_service


lc_service = create c_dwservice_ex
//-- company --//
if this.f_is_company( ) then
	ls_whereclause = ' company_id =' + string(gi_user_comp_id)
end if

//-- branch --//
if this.f_is_branch( ) then
	if ls_whereclause <> '' then ls_whereclause +=  ' AND '
	ls_whereclause = ls_whereclause + ' branch_id =' + string(gdb_branch)
end if

//-- build related key --//
li_count =  this.f_get_data_related(lstr_data_related[])
if li_count > 0 then
	//-- Nếu đã build where 1 lần rồi thì không build lại --//
//	if not this.ib_first_buildwhere then return ''			
	lds_handle = this
	if lc_service.f_buildwhereclause_of_relation(lds_handle, lstr_data_related[] ) > 0 then						
		FOR li_idx = 1 to li_count
			if ls_whereclause <> '' then ls_whereclause +=  ' AND '
			ls_whereclause+=  lstr_data_related[li_idx].s_where	
		NEXT
		if ls_whereclause <> '' then
			return '('+ls_whereclause + ')'
		else
			return ''
		end if
	end if 
end if

return ls_whereclause

end function

protected function integer f_buildwhereclause_of_relation (ref s_str_dwo_related rstr_data_related[]);
string				ls_related_dwo, ls_where, las_column[], ls_colType, ls_dbname, ls_criteria, ls_data, ls_detail1_where
string				ls_currentSQL_nowhere, ls_currentwhereclause, las_master_keycol[], las_detail_keycol[], ls_detail2_where
int					li_col, li_colCount, li_rtn, li_idx
c_string_ex		lc_obj_service
t_dw_mpl		ldw_related, ldw_master
c_sql_ex				lc_sql
t_s_sql_attr		lastr_sql_attr[]


lc_sql =  create c_sql_ex
lc_obj_service = create c_string_ex

FOR li_idx = 1 to upperbound(rstr_data_related[])
	ls_related_dwo = rstr_data_related[li_idx].s_related_obj_dwo
	
	//-- Trường hợp link với dw master --//
	li_colCount = lc_obj_service.f_stringtoarray(rstr_data_related[li_idx].s_related_obj_column ,';', las_column[])
	FOR li_col = 1 to li_colCount
		if ls_where <> '' then ls_where += ' AND '
		ls_coltype = this.describe(las_column[li_col] + ".ColType")
		ls_dbname = this.describe(las_column[li_col] + ".DBAlias")
		if pos(ls_dbname,'.') = 1 then
			ls_dbname =  this.describe(las_column[li_col] + ".DBName")
		elseif ls_dbname = '!' then
			ls_dbname = las_column[li_col]
		elseif ls_dbname = '?' then
			messagebox('Thông báo','f_buildwhereclause_of_relation:Không lấy được DBalias')
			return -1
		end if		

		if upperbound(rstr_data_related[li_idx].s_data[]) = 0 then
			ls_data =''
		else
			ls_data = rstr_data_related[li_idx].s_data[li_col]
		end if		
		Choose Case Lower(Left(ls_coltype,5))
			Case "char("				
				if pos(ls_data, ',') > 0 then
					ls_data = lc_obj_service.f_globalreplace( ls_data, ',', "~~',~~'")
					ls_criteria = ls_dbname + " in " + "(~~'"+ls_data+"~~')"
				else
					ls_criteria = ls_dbname + " = ~~'" + ls_data+ "~~'"
				end if			
			Case "decim","numbe"	
				if pos(ls_data, ',') = 0 then
					ls_criteria = ls_dbname + " = "+ ls_data
				else
					ls_criteria = ls_dbname + " in ("+ ls_data + ")"
				end if
			case else
				return -1
		end choose					
		//-- Add criteria to WHERE Clause --//
		ls_where += ls_criteria
	NEXT
	rstr_data_related[li_idx].s_where = ls_where
	return 1
NEXT
return 1


end function

public function integer f_set_data_related (s_str_dwo_related vstr_data_related[]);istr_data_related = vstr_data_related

return 1
end function

public function integer f_get_data_related (ref s_str_dwo_related rstr_data_related[]);
rstr_data_related[] = istr_data_related[]
return upperbound(rstr_data_related)
end function

public function integer f_set_retrieve_args (any va_args[]);ia_retrieve_arg[] = va_args[]
return 1
end function

public subroutine f_set_ib_traceable (boolean vb_traceable);ib_traceable = vb_traceable
end subroutine

public function integer f_remove_where ();string 		ls_currentSQL, ls_currentWhere,ls_modify,ls_rtn
c_sql_ex			lc_sql

lc_sql = create c_sql_ex
if this.dynamic f_getcurrentSQL( ls_currentSQL, ls_currentWhere) =1 then
	if ls_currentWhere <> '' then ls_currentWhere = ''
	if is_originalwhereClause <> '' then ls_currentWhere = is_originalwhereClause
	lc_sql.f_addtowhereclause( ls_currentSQL, ls_currentWhere, " AND ")
	ls_modify = "Datawindow.Table.Select= '" + ls_currentSQL +"'"
	ls_rtn =this.modify(ls_modify )
end if

return 1
end function

public function integer f_add_originalwhere (string vs_where, string vs_operator);string					ls_currentSQL, ls_currentWhere, ls_rtn, ls_modify

c_sql_ex					lc_sql
c_string_ex				lc_string

lc_string =  create c_string_ex
lc_sql =  create c_sql_ex

//vs_where = lc_string.f_GlobalReplace(vs_where,"'","~~'")

if this.f_getcurrentSQL( ls_currentSQL, ls_currentWhere) =1 then
	ls_currentWhere = is_originalwhereClause
	if ls_currentWhere <> "" then
		ls_currentWhere= "("+ls_currentWhere +") " + vs_operator + " (" + vs_where +")"	
	else
		ls_currentWhere = vs_where
	end if
	lc_sql.f_addtowhereclause( ls_currentSQL, ls_currentWhere, " AND ")
	ls_modify = "Datawindow.Table.Select= '" + ls_currentSQL +"'"
	ls_rtn =this.modify(ls_modify )
	if ls_rtn <> '' then
		gf_messagebox('m.t_dw.f_add_originalwhere.01','Thông báo','Lỗi t_dw.f_add_where: line 12:', 'exclamation','ok',1)
		return -1
	end if
end if		
	
return 1
end function

public function integer f_build_join_where_4_posting (string vs_join, string vs_where, string vs_operator);string					ls_currentSQL, ls_currentWhere, ls_rtn, ls_modify

c_sql_ex					lc_sql
c_string_ex				lc_string

lc_string =  create c_string_ex
lc_sql =  create c_sql_ex

//vs_where = lc_string.f_GlobalReplace(vs_where,"'","~~'")

if this.f_getcurrentSQL( ls_currentSQL, ls_currentWhere) =1 then
	ls_currentWhere = is_originalwhereClause
	if ls_currentWhere <> "" then
		ls_currentWhere=   "("+ls_currentWhere +") " + vs_operator + " (" + vs_where +")"	
	else
		ls_currentWhere = vs_where
	end if
	if pos(ls_currentSQL, vs_join) = 0 then
		ls_currentSQL += ' ' + vs_join
	end if
	lc_sql.f_addtowhereclause( ls_currentSQL, ls_currentWhere, " AND ")
	ls_modify = "Datawindow.Table.Select= '" + ls_currentSQL +"'"
//	messagebox('f_build_join_where_4_posting',ls_currentSQL)
	ls_rtn =this.modify(ls_modify )
	
	if ls_rtn <> '' then
//		messagebox('f_build_join_where_4_posting',ls_rtn)
		gf_messagebox('m.t_dw.f_add_where.01','Thông báo','Lỗi t_dw.f_add_where: line 12:', 'exclamation','ok',1)
		return -1
	end if
end if		

destroy lc_string
destroy lc_sql

return 1
end function

public function integer f_getcolumns_update (ref string as_columns[]);Integer	li_columns_count
String	ls_syntax,ls_columns[], ls_colname
Long		ll_poscol,ll_posname, ll_posUpd

ls_syntax = this.describe("Datawindow.syntax")

If IsNull(ls_syntax) or Len(ls_syntax) = 0 Then Return -1

ll_poscol = Pos(ls_syntax,"column=")
Do While (ll_poscol > 0)
	ll_posUpd = Pos(ls_syntax,"update=yes",ll_poscol) 
	ll_posname = Pos(ls_syntax,"dbname=",ll_poscol)
	if ll_posUpd > 0 and  ll_posUpd < ll_posname then
//		ll_posname += 5
		ll_posname = Pos(ls_syntax,".",ll_posname) + 1		
		li_columns_count ++
		ls_colname = Trim(Mid(ls_syntax,ll_posname,Pos(ls_syntax,'"',ll_posname)-ll_posname))
		if lower(ls_colname) = 'id' then ls_colname = 'id_table'
		ls_columns[li_columns_count] = ls_colname
	end if
	ll_poscol = Pos(ls_syntax,"column=",ll_poscol+1)
Loop

as_columns = ls_columns

Return li_columns_count

end function

public function integer f_get_doc_trace (ref string rs_where, ref string rs_sort);
c_dwservice_ex		lc_dwservice

string						ls_colname, ls_coltype



if this.describe( "version_id.coltype" ) = 'number' and left(this.dataobject,3) <> 'dv_' then
	lc_dwservice = create c_dwservice_ex
	ls_colname = ' extend_id'
	lc_dwservice.f_get_build_column( this, ls_colname, ls_coltype)
	rs_where = ls_colname
	ls_colname = ' version_id'
	lc_dwservice.f_get_build_column( this, ls_colname, ls_coltype)
	rs_where = rs_where +' = ' + ls_colname
	
	destroy lc_dwservice
	return 0
end if

end function

on t_ds_db.create
call super::create
end on

on t_ds_db.destroy
call super::destroy
end on

event sqlpreview;call super::sqlpreview;
if sqltype = PreviewInsert! then
	idb_insert_id[upperbound(idb_insert_id)+1] = this.getitemnumber( row,'ID', buffer,false)
elseif sqltype = PreviewUpdate! then
	idb_upd_id[upperbound(idb_upd_id)+1] = this.getitemnumber( row,'ID',buffer,false)
elseif sqltype = PreviewDelete! then	
elseif sqltype = PreviewSelect! then	
end if
end event

event updateend;call super::updateend;//--Up trace info --//
if it_transaction.sqldbcode = -3 or ii_dberrorcode = -3  then return
if rowsinserted + rowsupdated > 0 then
	if this.describe("created_by.coltype" )<> '!' then
		if this.f_upd_track_info() = -1 then return -1
	end if
end if
end event

event e_postinsertrow;call super::e_postinsertrow;int		li_cnt

if isvalid(iso_display) then
	li_cnt =  iso_display.idwsetup_initial.f_initvalue(this, al_row)
	if li_cnt = -1 then return -1
end if
return al_row
end event

