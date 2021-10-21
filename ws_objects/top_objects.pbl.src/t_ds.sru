$PBExportHeader$t_ds.sru
$PBExportComments$top datastore
forward
global type t_ds from datastore
end type
end forward

global type t_ds from datastore
event type integer e_save ( )
event type long e_postinsertrow ( long al_row )
event type long e_addrow ( )
event type long e_insertrow ( long vl_row )
end type
global t_ds t_ds

type variables
t_transaction		it_transaction
int						ii_dberrorcode
protected	:

s_object_display	iso_display
end variables

forward prototypes
public function integer f_getcolumns (ref string as_columns[])
public function integer f_getcomputes (ref string as_computes[])
public function integer f_deleteallrow ()
public function integer f_add_where (string vs_columns, any va_data[])
public function integer f_getcurrentsql (ref string rs_originalsql_nowhere, ref string rs_whereclause)
public function integer f_getcolumns_sql (ref string as_columns[])
public function boolean f_is_company ()
public function boolean f_is_branch ()
public function integer f_addwhereclause_of_company (s_object_display vod_handle)
public function integer f_add_where (string vs_where, string vs_operator)
public function boolean f_is_sob ()
public function string f_get_dataobject ()
public function integer f_set_obj_display (s_object_display vs_object_display)
public function s_object_display f_get_obj_display ()
public function integer f_settransobject (readonly t_transaction rt_transaction)
end prototypes

event type long e_postinsertrow(long al_row);/**************************************************************
Chức năng:
	- Gán các giá trị company va branch nếu có
---------------------------------------------------------------------------
Tham số: al_row dòng đang được thêm mới
=======================================================*/

//-- company --//
if this.f_is_company( ) then
	this.setitem( al_row, 'company_id',gi_user_comp_id)
end if

//-- branch --//
if this.f_is_branch( ) then
	this.setitem( al_row, 'branch_id',gdb_branch)
end if

//-- sob --//
if this.f_is_sob( ) then
	this.setitem( al_row, 'sob',gs_sob)
end if
return al_row
end event

event type long e_addrow();//////////////////////////////////////////////////////////
//Return	-1: error
//			0: no action
//			1: success
/////////////////////////////////////////////////////////			
long			ll_rc,  ll_add_row


ll_add_row=This.insertrow( 0)

//-- Sau khi thêm record: gán các giá trị mặc đinh, ID và thông báo cho Object --//
ll_rc = This.Event e_PostInsertRow(ll_add_row)

Return ll_rc

end event

event type long e_insertrow(long vl_row);//////////////////////////////////////////////////////////
//Return	-1: error
//			0: no action
//			1: success
/////////////////////////////////////////////////////////			
long			ll_rc,  ll_add_row


ll_add_row=This.insertrow( vl_row)

//-- Sau khi thêm record: gán các giá trị mặc đinh, ID và thông báo cho Object --//
ll_rc = This.Event e_PostInsertRow(ll_add_row)

Return ll_rc

end event

public function integer f_getcolumns (ref string as_columns[]);Integer	li_columns_count
String	ls_syntax,ls_columns[]
Long		ll_poscol,ll_posname

ls_syntax = this.describe("Datawindow.syntax")

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

public function integer f_getcomputes (ref string as_computes[]);Integer	li_computes_count
String	ls_syntax,ls_computes[]
Long		ll_poscol,ll_posname

ls_syntax = this.describe("Datawindow.syntax")
If IsNull(ls_syntax) or Len(ls_syntax) = 0 Then Return -1

ll_poscol = Pos(ls_syntax,"compute(")
Do While (ll_poscol > 0)
	ll_posname = Pos(ls_syntax,"name=",ll_poscol)
	ll_posname += 5
	
	li_computes_count ++
	
	ls_computes[li_computes_count] =Trim(Mid(ls_syntax,ll_posname,Pos(ls_syntax," ",ll_posname)-ll_posname))
	
	ll_poscol = Pos(ls_syntax,"compute(",ll_poscol+1)
Loop

as_computes = ls_computes

Return li_computes_count

end function

public function integer f_deleteallrow ();long ll_row
int li_rtn
FOR ll_row = this.rowcount( ) to 1 step -1
	this.deleterow( ll_row)
NEXT
li_rtn = this.update( )
if li_rtn = 1 then
	commit;
	this.resetupdate( )
else
//	gf_messagebox('msg_khongXoaDuoc')
end if
return li_rtn
end function

public function integer f_add_where (string vs_columns, any va_data[]);string					ls_currentSQL, ls_currentWhere, ls_rtn, las_columns[], ls_colType, ls_modify, ls_dbname, ls_value
int						li_colCount, li_idx
c_string_ex				lc_string
c_sql_ex					lc_sql
c_dwservice_ex			lc_dwservice

lc_string = create c_string_ex
lc_sql = create c_sql_ex
lc_dwservice = create c_dwservice_ex

if this.dynamic f_getcurrentSQL( ls_currentSQL, ls_currentWhere) =1 then
	li_colCount = lc_string.f_stringtoarray( vs_columns,';', las_columns[])
	FOR li_idx =1 to li_colCount
		ls_dbname =  las_columns[li_idx]
		if lc_dwservice.f_get_build_column( this,ls_dbname, ls_colType) = -1 then
			return -1			
		end if
		
//		if isnull(va_data[li_idx]) then 
//			va_data[li_idx] = '()'
//		elseif pos(string(va_data[li_idx]),';')>0 then
//			va_data[li_idx] = '('+string(va_data[li_idx])+')'
//		elseif left(ls_colType,4) = 'char' then
//			va_data[li_idx] = '='+string(va_data[li_idx])
//		end if
		if ls_currentWhere <> '' then ls_currentWhere += ' AND '
		ls_currentWhere += lc_string.f_get_expression( string(va_data[li_idx] ), ls_colType, ls_dbname, 'build where')
		
	NEXT

	lc_sql.f_addtowhereclause( ls_currentSQL, ls_currentWhere, " AND ")
	ls_modify = "Datawindow.Table.Select= '" + ls_currentSQL +"'"
	ls_rtn =this.modify(ls_modify )
end if		

return 1
end function

public function integer f_getcurrentsql (ref string rs_originalsql_nowhere, ref string rs_whereclause);
c_string_ex			lc_obj_service
c_sql_ex						lc_sql
t_s_sql_attr				lstr_sql_attr[]
string						ls_originalSQL

lc_obj_service = create c_string_ex
lc_sql = create c_sql_ex

//-- Save the SQL select statement --//
ls_originalSQL = this.describe("Datawindow.Table.Select")

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

public function integer f_getcolumns_sql (ref string as_columns[]);Integer	li_columns_count
String	ls_syntax,ls_columns[]
Long		ll_poscol,ll_posname

// Get the requestor DW syntax
ls_syntax = this.describe("Datawindow.syntax")
// Check syntax
If IsNull(ls_syntax) or Len(ls_syntax) = 0 Then Return -1

// Parse the syntax for columns
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

public function boolean f_is_company ();
string		ls_colvisible


ls_colvisible = this.Describe ("company_id.visible" )
if ls_colvisible = '!' then 
	return false
else
	return true
end if
end function

public function boolean f_is_branch ();
string		ls_colvisible

ls_colvisible = this.Describe ("branch_id.visible" )
if ls_colvisible = '!' then 
	return false
else
	return true
end if
end function

public function integer f_addwhereclause_of_company (s_object_display vod_handle);
string 					ls_whereclause, ls_modify, ls_currentSQL, ls_currentWhere,ls_rtn, ls_dbname, ls_coltype
c_sql_ex					lc_sql
c_dwservice_ex			lc_dwservice

lc_dwservice = create c_dwservice_ex
lc_sql  = create c_sql_ex
//-- company --//
if this.f_is_company( ) then
	ls_dbname = 'company_id'
	lc_dwservice.f_get_build_column( this,ls_dbname, ls_coltype)
	ls_whereclause = ls_dbname+ " =" + string(gi_user_comp_id)
end if

//-- branch --//
if this.f_is_branch( ) then
	if vod_handle.idwsetup_initial.f_is_branch_yn( this.dataobject ) then
		ls_dbname = 'branch_id'
		lc_dwservice.f_get_build_column( this, ls_dbname, ls_coltype)
		if ls_whereclause <> '' then ls_whereclause +=  ' AND '
		ls_whereclause = ls_whereclause + ls_dbname+ ' =' + string(gdb_branch)
	end if
end if

if this.f_getcurrentSQL( ls_currentSQL, ls_currentWhere) =1 then
	if ls_whereclause <> "" then
		if ls_currentWhere <> '' then ls_currentWhere += ' AND '
		ls_currentWhere += ls_whereclause
		lc_sql.f_addtowhereclause( ls_currentSQL, ls_currentWhere, " AND ")
		ls_modify = 'Datawindow.Table.Select= "' + ls_currentSQL +'"'
		ls_rtn =this.modify(ls_modify )		
	end if
end if

return 1

end function

public function integer f_add_where (string vs_where, string vs_operator);string					ls_currentSQL, ls_currentWhere, ls_rtn, ls_modify

c_sql_ex					lc_sql
c_string_ex				lc_string

lc_string = create c_string_ex
lc_sql = create c_sql_ex
//vs_where = lc_string.f_GlobalReplace(vs_where,"'","~~'")

if this.dynamic f_getcurrentSQL( ls_currentSQL, ls_currentWhere) =1 then
	if ls_currentWhere <> "" then
		ls_currentWhere= "("+ls_currentWhere +") " + vs_operator + " (" + vs_where +")"	
	else
		ls_currentWhere = vs_where
	end if
	lc_sql.f_addtowhereclause( ls_currentSQL, ls_currentWhere, " AND ")
	ls_modify = "Datawindow.Table.Select= '" + ls_currentSQL +"'"
	ls_rtn =this.modify(ls_modify )
	if ls_rtn <> '' then
		gf_messagebox('m.t_dw.f_add_where.01','Thông báo','Lỗi t_dw.f_add_where: line 12:', 'exclamation','ok',1)
		return -1
	end if
end if		
	
return 1
end function

public function boolean f_is_sob ();
string		ls_colvisible


ls_colvisible = this.Describe ("sob.visible" )
if ls_colvisible = '!' then 
	return false
else
	return true
end if
end function

public function string f_get_dataobject ();return this.dataobject
end function

public function integer f_set_obj_display (s_object_display vs_object_display);
iso_display = vs_object_display

return 1
end function

public function s_object_display f_get_obj_display ();

return iso_display
end function

public function integer f_settransobject (readonly t_transaction rt_transaction); 
it_transaction = rt_transaction
return this.settransobject( rt_transaction)

end function

on t_ds.create
call super::create
TriggerEvent( this, "constructor" )
end on

on t_ds.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event dberror;choose case sqldbcode
	case -3
		ii_dberrorcode = -3
		return 3
	case 1
		ii_dberrorcode = 1
	case 2292
		ii_dberrorcode = 2292
	case 3113
		return 3
	case else
		gf_messagebox('m.t_ds.dberror.01','Thông báo','Lỗi:@ '+sqlerrtext,'exclamation','ok',1)
end choose
end event

