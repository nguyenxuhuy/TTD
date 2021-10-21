$PBExportHeader$c_dw_querymode.sru
forward
global type c_dw_querymode from c_obj_service
end type
end forward

global type c_dw_querymode from c_obj_service
event type integer e_itemchanged ( long al_row,  string as_colname,  string as_data )
event type integer e_itemfocuschanged ( long al_row,  string as_colname )
event type integer e_ok ( )
event type integer e_cancel ( )
event type integer e_ok_original ( )
end type

type variables
t_dw_mpl	idw_requestor
t_dw			idw_focus
double		idb_branch									//phân biệt chi nhánh
boolean		ib_rec = false
Protected:

t_s_querymode_criteria		istr_criterias[]	// Criteria values that were entered for the last query
t_s_querymodeattr			istr_querymodeinfo []

String			is_originalSQL						// Original SQL statement
String			is_originalSQLdataobject			// Dataobject from which the original SQL was taken

Boolean		ib_QueryMode = false			// Is the requestor DW currently in query mode ?
Boolean		ib_AutoRedraw = true
boolean		ib_resetcriteria = true
boolean		ib_retrieveondisabled = true
boolean		ib_date_spec = false
string			is_querycolumns[]
string 		is_values[]

String			is_dataobject			// Dataobject for which the query columns were registered
Boolean		ib_AutoRefreshColsProperties = false	// Automatically refresh the query columns properties when
																// entering query mode (false by default for compatibility)
Boolean		ib_AllowQueryOperators = true				// Is the use of query operators allowed in querymode in the requestor DW ?
Boolean		ib_QueryCancelled = false					// If set to true, the normal processing, that takes place
																		// when querymode is disabled, is bypassed.
String			is_querySQL										// Updated SQL statement (WHERE clause updated with criterias
																		// that were entered in the requestor DW)

String			is_queryJoinClause								// Join clause DW had queryWhereClause
String			is_queryWhereClause							// WHERE clause built with the criterias
Boolean		ib_UseQuerySQLOnDisabled = true			// Automatically set the updated SQL select statement
																		// (WHERE clause updated with criterias entered)
																		// in the requestor DW when the querymode is to FALSE ?
																		// (true by default for compatibility)		



end variables

forward prototypes
public function integer f_querymode (boolean ab_switch)
public function integer f_setqmcontrolvalue (string as_colname, string as_data)
public function integer f_destroyqmcontrols ()
public function integer f_setrequestor (t_dw_mpl adw_requestor)
public function integer f_backuporiginalsql ()
public function integer f_resetquerycriterias ()
public function integer f_setenabled (boolean ab_switch)
public function integer f_setquerycols (string as_querycolumns[])
protected function integer f_setquerycolsproperties (boolean ab_switch)
public function integer f_getquerycriterias (ref t_s_querymode_criteria astr_criterias[])
public function integer f_setquerycriteria (t_s_querymode_criteria astr_criteria)
public function string f_getoriginalsql ()
public function integer f_restoreoriginalsql ()
public function boolean f_getautoredraw ()
public function integer f_setautoredraw (boolean ab_switch)
public function boolean f_getresetcriteria ()
public function integer f_setresetcriteria (boolean ab_reset)
public function boolean f_getautorefreshcolsproperties ()
public function integer f_setautorefreshcolsproperties (boolean ab_switch)
public function integer f_setallowqueryoperators (boolean ab_switch)
public function boolean f_getallowqueryoperators ()
public function integer f_setquerycancelled (boolean ab_switch)
public function integer f_buildquerysql ()
public function string f_getquerysql ()
public function integer f_setquerysql ()
public function string f_getquerywhereclause ()
protected function boolean f_iscriteriavalid (string as_colname, ref string as_data)
public function string f_getquerycriteria (string as_colname)
public function integer f_getquerycriteria (string as_colname, ref string as_criteria)
public function boolean f_getenabled ()
public function integer f_setusequerysqlondisabled (boolean ab_switch)
public function boolean f_getusequerysqlondisabled ()
public function boolean f_getretrieveondisabled ()
public function integer f_setretrieveondisabled (boolean ab_retrieve)
protected function integer f_buildquerywhereclause (ref string as_where)
public function string f_check_char (string as_source, string as_obj_type, string as_colname)
public function string f_check_date_spec (string as_data)
public function string f_get_whereclause_detail (t_dw_mpl vdw_detailn[], t_dw_mpl vdw_master_of_detailn)
protected function integer f_buildquerywhereclause_original (ref string as_where)
public subroutine f_setquerywhereclause (string vs_whereclause)
public function integer f_setquerycriteria (t_s_querymode_criteria astr_criteria[])
public function integer f_removeargsfromwhereclause (ref string as_where)
public function integer f_setdwfocus (t_dw adw_focus)
public function integer f_setqmcontrolvalue_dwfocus (string as_colname, string as_data)
public function integer f_destroyqmcontrols_dwfocus ()
public function string f_get_joinsql (t_dw_mpl vdw_requestor)
public function string f_get_queryjoinclause ()
public function string f_removejoinfromjoinclause (string vs_joinclause)
end prototypes

event type integer e_itemchanged(long al_row, string as_colname, string as_data);t_s_querymode_criteria	lstr_criteria
Integer	li_pos,li_length
String		ls_data,ls_coltype,ls_null
string 		ls_obj_type,ls_lb_item

ls_data = as_data

If not IsNull(ls_data) Then
	// Get column's type
	ls_coltype = idw_requestor.describe(as_colname + ".ColType")
	ls_obj_type = idw_requestor.describe(as_colname + ".Edit.Style")
	if ls_obj_type = 'ddlb' then
		ls_data = idw_requestor.f_get_data_value_ddlb( ls_data, as_colname)
	end if
//Choose Case Lower(Left(ls_coltype,5))
//			Case "char("
//				ls_data = f_check_char(as_data,ls_obj_type,as_colname)
//			Case "date","datet"
//				ls_data = f_check_date_spec(as_data)
//End Choose
	// Test if criteria is valid
//	If not f_IsCriteriaValid(as_colname,ls_data) Then
//		MessageBox("DW QueryMode service -> e_ItemChanged", &
//				"(" + string(al_row) + ",~'" + as_colname + "~') : " &
//				+ "The value entered ~'" + as_data + "~' has been refused.") 
//
//		Return 1
//	End If
End If

// The value entered has been completed
If ls_data <> as_data Then
	// Log an entry in the debug log window
/*	MessageBox("DW QueryMode service -> e_ItemChanged", &
			"("	+ string(al_row) + ",~'" + as_colname + "~') : " &
			+ "The value entered ~'" + as_data + "~' has been completed ~'" + ls_data + "~'.")
*/
End If

// Save new criteria
lstr_criteria.is_colname = as_colname
lstr_criteria.is_value = Trim(ls_data)				// Suppress leading
lstr_criteria.is_displayvalue = Trim(as_data)		// & trailing spaces

// Set query criteria for this column
f_SetQueryCriteria(lstr_criteria)

// Check if query operators are allowed
If ib_AllowQueryOperators Then
	// Display the criteria entered by the user in a label on top of the column
	f_SetQMControlValue(as_colname,lstr_criteria.is_displayvalue)
	
	// Get column's type
//	ls_coltype = idw_requestor.describe(as_colname + ".ColType")
	
	// Check if criteria is null
	If IsNull(ls_data) Then
		// Prepare a null value
		SetNull(ls_null)
		
		// Set a null value in the column
		idw_requestor.f_SetItem(1,as_colname,ls_null)
	Else
		// Set a bogus value in the DW buffer for this column to be sure
		// an itemchanged is triggered next time the value is changed
		Choose Case Lower(Left(ls_coltype,5))
			Case "char("
				// Locate the '(' character
				li_pos = Pos(ls_coltype,"(")
				
				// Get column type's size
				li_length = Integer(Mid(ls_coltype,li_pos +1,Len(ls_coltype) -li_pos -1))
				
				
				  
				if ls_obj_type = 'checkbox' then
					idw_requestor.f_SetItem(1,as_colname,as_data) // set dấu check cho checkbox nếu value = 'Y'
				else
					idw_requestor.f_SetItem(1,as_colname,as_data) // set value cho dw share của dw đang tìm
				end if
				
				// Fill column with '|' character
			//	idw_requestor.f_SetItem(1,as_colname,Fill("|",li_length))
				
			Case "date","datet"
				// Fill column with an 'invalid' date 
				idw_requestor.f_SetItem(1,as_colname,as_data)
				
			Case "decim","numbe"
				// Check if criteria is a number (no query wildcard)
				If IsNumber(lstr_criteria.is_value) Then
					// Set criteria value in the buffer
					idw_requestor.f_SetItem(1,as_colname,lstr_criteria.is_value)
				Else	// The criteria contains query wildcard(s)
					// Set zero value in the buffer
					idw_requestor.f_SetItem(1,as_colname,as_data)
				End If
				
			Case "time"
				// Fill the column with an 'invalid' time
				idw_requestor.f_SetItem(1,as_colname,as_data)
				
		End Choose
	End If
End If

// Check if query operators are allowed
If ib_AllowQueryOperators Then
	// Return an adequate value depending on the caller event
	If al_row = 1 Then	// Itemchanged
		// Reject criteria but allow the focus to change
		Return 2
	ElseIf al_row = 2 Then	// ItemError
		// Reject criteria but allow the focus to change
		Return 3
	End If
Else
	// Return an adequate value depending on the caller event
	If al_row = 1 Then	// Itemchanged
		// Accept criteria
		Return 0
	ElseIf al_row = 2 Then	// ItemError
		// Reject criteria (no msgbox)
		Return 1
	End If
End If

end event

event type integer e_itemfocuschanged(long al_row, string as_colname);Integer	li_i,li_max
String	ls_rc

If IsNull(as_colname) or Len(as_colname) = 0 Then Return -1

// Check requestor DW is valid
If not IsValid(idw_requestor) or IsNull(idw_requestor) Then Return -1

// Check if query operators are activated
If not ib_AllowQueryOperators Then Return 0

// Check if there's a QM control for this column
If idw_requestor.describe(as_colname + "_qm.x") = "!" Then Return 0

// Search for the criteria value entered in this column
li_max = UpperBound(istr_criterias)
For li_i=1 To li_max
	// Check if column has been found	
	If istr_criterias[li_i].is_colname = as_colname Then
		// Set criteria's display value in the column
		idw_requestor.SetText(istr_criterias[li_i].is_displayvalue)
		// Select value in the column
		idw_requestor.SelectText(1,Len(istr_criterias[li_i].is_displayvalue))
		
		Return 1
	End If
Next

Return 0
end event

event type integer e_ok();Boolean			lb_useautoquery
t_dw_mpl		ldw_master,ldw_details[],ldw_shared[],ldw_sharedn[]
t_s_sql_attr		lstr_sql_master[],lstr_sql_detail[],lstr_sql_empty[],lstr_sql_attr[]
Integer			li_sql_master_count,li_sql_detail_count
String			ls_sql_master,ls_sql_detail
String			ls_columns[],ls_tables[],ls_empty[]
String			ls_query_where,ls_shared_where,ls_detail_where, ls_dbname
String			ls_action,ls_rc,ls_coltype
Integer			li_i,li_j,li_max, li_count_detail, li_count_shared,li_count_sharedn,li_in
c_sql				lnv_sql
c_dwservice	c_service
c_string			lc_string
string				 ls_currentSQL, ls_currentWhere

//variable for dw detail level 2
t_dw_mpl		ldw_details2[],ldw_shared2[]
t_s_sql_attr		lstr_sql_detail2[]
Integer		li_sql_detail_count2
String		ls_sql_detail2
String		ls_columns2[],ls_tables2[]
String		ls_shared_where2,ls_detail_where2, ls_dbname2, ls_where_sharedn
Integer		li_i2,li_j2,li_max2, li_count_detail2, li_count_shared2

//variable for dw detail level n
Integer			li_count_detailn
t_dw_mpl		ldw_detailsn[]
string				ls_detail_wheren

// Change pointer
SetPointer(Hourglass!)

// Get the current master
ldw_master = idw_requestor.f_getdwmaster( )

// Check reference
If IsNull(ldw_master) or not IsValid(ldw_master) Then Return -1
// Check querymode service is started for master DW
If not IsValid(ldw_master.inv_querymode) Then Return -1

// If this master is alone (no shared & no detail), we can let
// the querymode service do everything ...
li_count_detail = ldw_master.f_getdwdetails(ldw_details)
li_count_shared = ldw_master.f_getdwshared(ldw_shared)
If li_count_detail + li_count_shared = 0  Then
	// Let querymode manage the retrieve
	lb_UseAutoQuery = true
End If

// Disable repaint of the DWs while disabling querymode
ldw_master.f_SetRedraw(false)

// Check if the retrieve is done by the querymode or manually
If lb_UseAutoQuery Then
	// Tell to querymode to use the SQL it has build with criterias
	ldw_master.inv_querymode.f_SetUseQuerySQLOnDisabled(true)
	// Tell to querymode to retrieve rows automatically
	ldw_master.inv_querymode.f_SetRetrieveOnDisabled(true)	
	// Disable querymode -> The retrieve is done automatically
	If ldw_master.inv_querymode.f_SetEnabled(false) <> 1 Then Return -1
Else
	// Make sure the querymode service will not automatically make
	//	a retrieve when disabling it
	ldw_master.inv_querymode.f_SetUseQuerySQLOnDisabled(false)
	ldw_master.inv_querymode.f_SetRetrieveOnDisabled(false)
	// Disable querymode on the master DW
	ldw_master.inv_querymode.f_SetEnabled(false)
	
	// Get query SQL select of the master
	ls_sql_master = ldw_master.inv_querymode.f_GetQuerySQL()
	// Check SQL select
	If IsNull(ls_sql_master) or Len(ls_sql_master) = 0 Then Return -1
	
	//////////////////////////////////////////////////////////////////////////////
	// DETAIL DWs ////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////
	
	// Disable querymode on detail DWs & get query where clause
	For li_i = 1 To li_count_detail
		If IsNull(ldw_details[li_i]) or not IsValid(ldw_details[li_i]) Then Continue
		If IsValid(ldw_details[li_i].inv_querymode) Then
			ldw_details[li_i].inv_querymode.f_SetUseQuerySQLOnDisabled(false)
			ldw_details[li_i].inv_querymode.f_SetRetrieveOnDisabled(false)
			// Disable querymode
			ldw_details[li_i].inv_querymode.f_SetEnabled(false)
			// Get the query where clause of the detail DW
			ls_detail_where = ldw_details[li_i].inv_querymode.f_GetQueryWhereClause()
			
/////////////////////////////////////////////////////////////////////////////////////
			//DW detail level 2
			li_count_detail2 = ldw_details[li_i].f_getdwdetails(ldw_details2)
			li_count_shared2 = ldw_details[li_i].f_getdwshared(ldw_shared2)
			If li_count_detail2 + li_count_shared2 > 0 Then
				For li_i2 = 1 To li_count_detail2
					If IsNull(ldw_details2[li_i2]) or not IsValid(ldw_details2[li_i2]) Then Continue
					If IsValid(ldw_details2[li_i2].inv_querymode) Then
						ldw_details2[li_i2].inv_querymode.f_SetUseQuerySQLOnDisabled(false)
						ldw_details2[li_i2].inv_querymode.f_SetRetrieveOnDisabled(false)
						// Disable querymode
						ldw_details2[li_i2].inv_querymode.f_SetEnabled(false)
						
						// Get the query where clause of the detail DW
						ls_detail_where2 = ldw_details2[li_i2].inv_querymode.f_GetQueryWhereClause()
						
						//--kiểm tra detail cấp {n}--//
						li_count_detailn = ldw_details2[li_i2].f_getdwdetails( ldw_detailsn)
						li_count_sharedn= ldw_details2[li_i2].f_getdwshared(ldw_sharedn)
						//--gọi hàm f-get_whereclauce_detail--//
						if li_count_detailn > 0 then 
						//	if not isnull(ls_detail_where2) and len(ls_detail_where2) > 0 then ls_detail_where2 += ' AND '
							ls_detail_wheren = this.f_get_whereclause_detail( ldw_detailsn, ldw_details2[li_i2])
							if not isnull(ls_detail_wheren) and len(ls_detail_wheren) > 0 then 
								if not isnull(ls_detail_where2) and len(ls_detail_where2) > 0 then
									ls_detail_where2 += ' AND ' + ls_detail_wheren
								else
									ls_detail_where2 = ls_detail_wheren
								end if
							end if
						end if
						
							//////////////////////////////////DW SHARE N
						For li_in = 1 To li_count_sharedn
							If IsNull(ldw_sharedn[li_in]) or not IsValid(ldw_sharedn[li_in]) Then Continue
							If IsValid(ldw_sharedn[li_in].inv_querymode) Then
							ldw_sharedn[li_in].inv_querymode.f_SetUseQuerySQLOnDisabled(false)
							ldw_sharedn[li_in].inv_querymode.f_SetRetrieveOnDisabled(false)
								ldw_sharedn[li_in].inv_querymode.f_SetEnabled(false)
								ls_where_sharedn = ldw_sharedn[li_in].inv_querymode.f_GetQueryWhereClause()
								If not IsNull(ls_where_sharedn) and Len(ls_where_sharedn) > 0 Then
									If not IsNull(ls_detail_where2) and Len(ls_detail_where2) > 0 Then
										ls_detail_where2 += " AND "
									End If
									ls_detail_where2 += ls_where_sharedn
								End If
							End If
					Next
						
						//////////////////////////////////
						If not IsNull(ls_detail_where2) and Len(ls_detail_where2) > 0 Then
							// Get the original SQL select of the detail DW
							ls_sql_detail2 = ldw_details2[li_i2].inv_querymode.f_GetOriginalSQL()
							If IsNull(ls_sql_detail2) or Len(ls_sql_detail2) = 0 Then Continue
							
							// Reset SQL statement information
							lstr_sql_detail2 = lstr_sql_empty
							// Break the SQL in parts
							li_sql_detail_count2 = lnv_sql.f_parse(ls_sql_detail2, lstr_sql_detail2)
							
							// Ignore criterias entered in detail DW that have a SQL containing
							// several select separated by UNION(s) ...
							If li_sql_detail_count2 > 1 Then Continue
							
							// Remove arguments from the existing where clause
							If f_RemoveArgsFromWhereClause(lstr_sql_detail2[1].s_where) < 0 Then
								Continue
							End If
							
							// Remove ORDER BY clause
							lstr_sql_detail2[1].s_order = ""
							
							// Add the query where clause to the existing where clause
							If not IsNull(lstr_sql_detail2[1].s_where) and Len(lstr_sql_detail2[1].s_where) > 0 Then
								lstr_sql_detail2[1].s_where += " AND "
							End If
							lstr_sql_detail2[1].s_where += ls_detail_where2
							
							// Copy detail columns & tables locally for faster access
							ls_columns2 = ls_empty
							ldw_details2[li_i2].f_get_detail_keycol(ls_columns2)
							
							// Replace the selected columns of the detail by the linkage columns
							li_max2 = UpperBound(ls_columns2)
							lstr_sql_detail2[1].s_columns = ""				
							For li_j2 = 1 To li_max2
								If li_j2 > 1 Then lstr_sql_detail2[1].s_columns += ","
//								ls_dbname2 = ldw_details2[li_i2].describe(ls_columns2[li_j2] + ".DBName")
								ls_dbname2 = ls_columns2[li_j2] 
								c_service.f_get_build_column( ldw_details2[li_i2], ls_dbname2, ls_coltype)
								ls_tables2 = ls_empty
								This.f_StringToArray(ls_dbname2,'.',ls_tables2)
								If UpperBound(ls_tables2) = 2 Then
									lstr_sql_detail2[1].s_columns += "~"" + Upper(ls_tables2[1]) + "~".~"" +  Upper(ls_tables2[2]) + "~""
								Else
									lstr_sql_detail2[1].s_columns += "~"" + Upper(ls_tables2[1]) + "~""
								End If
							Next
							
							// Rebuild the detail SQL
							ls_sql_detail2 = lnv_sql.f_Assemble(lstr_sql_detail2)
							
							// Prepare the main Query where clause
							If ls_detail_where <> "" Then ls_detail_where += " AND "
							ls_detail_where += "("
							
							// Copy master columns & tables locally for faster access
							ls_columns2 = ls_empty
							ldw_details2[li_i2].f_get_master_keycol(ls_columns2)
							li_max2 = UpperBound(ls_columns2)
							For li_j2 = 1 To li_max2
								If li_j2 > 1 Then ls_detail_where += ","
								// Add linkage column
//								ls_dbname2 = ldw_details[li_i].describe(ls_columns2[li_j2] + ".DBName")
								ls_dbname2 = ls_columns2[li_j2]
								c_service.f_get_build_column( ldw_details[li_i], ls_dbname2, ls_coltype)
								ls_tables2 = ls_empty
								This.f_StringToArray(ls_dbname2,'.',ls_tables2)
								If UpperBound(ls_tables2) = 2 Then
									ls_detail_where += "~"" + Upper(ls_tables2[1]) + "~".~"" +  Upper(ls_tables2[2]) + "~""
								Else
									ls_detail_where += "~"" + Upper(ls_tables2[1]) + "~""
								End If
							Next
							
							// Finish add of the detail SQL
							ls_detail_where += ") IN (" + ls_sql_detail2 + ")"
						End If
					End If
				Next
				
				// Disable querymode on shared DWs & get query where clause
				For li_i2 = 1 To li_count_shared2
					If IsNull(ldw_shared2[li_i2]) or not IsValid(ldw_shared2[li_i2]) Then Continue
					If IsValid(ldw_shared2[li_i2].inv_querymode) Then
						ldw_shared2[li_i2].inv_querymode.f_SetUseQuerySQLOnDisabled(false)
						ldw_shared2[li_i2].inv_querymode.f_SetRetrieveOnDisabled(false)
						// Disable querymode		
						ldw_shared2[li_i2].inv_querymode.f_SetEnabled(false)
						
						// Get the query where clause of the shared DW
						ls_shared_where2 = ldw_shared2[li_i2].inv_querymode.f_GetQueryWhereClause()
						// Add the shared where clause to the main Query where clause
						If not IsNull(ls_shared_where2) and Len(ls_shared_where2) > 0 Then
							If not IsNull(ls_detail_where) and Len(ls_detail_where) > 0 Then
								ls_detail_where += " AND "
							End If
							ls_detail_where += ls_shared_where2
						End If
					End If
				Next
			End If
////////////////////////////////////////////////////////////////////////////////////
			
			// Get the query where clause of the detail DW
//			ls_detail_where = ldw_details[li_i].inv_querymode.f_GetQueryWhereClause()
			If not IsNull(ls_detail_where) and Len(ls_detail_where) > 0 Then
				// Get the original SQL select of the detail DW
				ls_sql_detail = ldw_details[li_i].inv_querymode.f_GetOriginalSQL()
				If IsNull(ls_sql_detail) or Len(ls_sql_detail) = 0 Then Continue
				
				// Reset SQL statement information
				lstr_sql_detail = lstr_sql_empty
				// Break the SQL in parts
				li_sql_detail_count = lnv_sql.f_parse(ls_sql_detail, lstr_sql_detail)
				
				// Ignore criterias entered in detail DW that have a SQL containing
				// several select separated by UNION(s) ...
				If li_sql_detail_count > 1 Then Continue
				
				// Remove arguments from the existing where clause
				If f_RemoveArgsFromWhereClause(lstr_sql_detail[1].s_where) < 0 Then
					Continue
				End If
				
				// Remove ORDER BY clause
				lstr_sql_detail[1].s_order = ""
				
				// Add the query where clause to the existing where clause
				If not IsNull(lstr_sql_detail[1].s_where) and Len(lstr_sql_detail[1].s_where) > 0 Then
					lstr_sql_detail[1].s_where += " AND "
				End If
				lstr_sql_detail[1].s_where += ls_detail_where
				
				// Copy detail columns & tables locally for faster access
				ls_columns = ls_empty
				ldw_details[li_i].f_get_detail_keycol(ls_columns)
				
				// Replace the selected columns of the detail by the linkage columns
				li_max = UpperBound(ls_columns)
				lstr_sql_detail[1].s_columns = ""				
				For li_j=1 To li_max
					If li_j > 1 Then lstr_sql_detail[1].s_columns += ","
//					ls_dbname = ldw_details[li_i].describe(ls_columns[li_j] + ".DBName")
					ls_dbname = ls_columns[li_j]
					c_service.f_get_build_column( ldw_details[li_i], ls_dbname, ls_coltype)
					ls_tables = ls_empty
					This.f_StringToArray(ls_dbname,'.',ls_tables)
					If UpperBound(ls_tables) = 2 Then
						lstr_sql_detail[1].s_columns += "~"" + Upper(ls_tables[1]) + "~".~"" +  Upper(ls_tables[2]) + "~""
					Else
						lstr_sql_detail[1].s_columns += "~"" + Upper(ls_tables[1]) + "~""
					End If
				Next
				
				// Rebuild the detail SQL
				ls_sql_detail = lnv_sql.f_Assemble(lstr_sql_detail)
				
				// Prepare the main Query where clause
				If ls_query_where <> "" Then ls_query_where += " AND "
				ls_query_where += "("
				
				// Copy master columns & tables locally for faster access
				ls_columns = ls_empty
				ldw_details[li_i].f_get_master_keycol(ls_columns)
				li_max = UpperBound(ls_columns)
				For li_j=1 To li_max
					If li_j > 1 Then ls_query_where += ","
					// Add linkage column
//					ls_dbname = ldw_master.describe(ls_columns[li_j] + ".DBName")
					ls_dbname = ls_columns[li_j]
					c_service.f_get_build_column( ldw_master, ls_dbname, ls_coltype)
					ls_tables = ls_empty
					This.f_StringToArray(ls_dbname,'.',ls_tables)
					// Add linkage column
					If UpperBound(ls_tables) = 2 Then
						ls_query_where += "~"" + Upper(ls_tables[1]) + "~".~"" +  Upper(ls_tables[2]) + "~""
					Else
						ls_query_where += "~"" + Upper(ls_tables[1]) + "~""
					End If
				Next

				
				// Finish add of the detail SQL
				ls_query_where += ") IN (" + ls_sql_detail + ")"
			End If
		End If
	Next
	
	//////////////////////////////////////////////////////////////////////////////
	// SHARED DWs ////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////
	
	// Disable querymode on shared DWs & get query where clause
	For li_i=1 To li_count_shared
		If IsNull(ldw_shared[li_i]) or not IsValid(ldw_shared[li_i]) Then Continue
		If IsValid(ldw_shared[li_i].inv_querymode) Then
			ldw_shared[li_i].inv_querymode.f_SetUseQuerySQLOnDisabled(false)
			ldw_shared[li_i].inv_querymode.f_SetRetrieveOnDisabled(false)
			// Disable querymode		
			ldw_shared[li_i].inv_querymode.f_SetEnabled(false)
			
			// Get the query where clause of the shared DW
			ls_shared_where = ldw_shared[li_i].inv_querymode.f_GetQueryWhereClause()
			// Add the shared where clause to the main Query where clause
			If not IsNull(ls_shared_where) and Len(ls_shared_where) > 0 Then
				If not IsNull(ls_query_where) and Len(ls_query_where) > 0 Then
					ls_query_where += " AND "
				End If
				ls_query_where += ls_shared_where
			End If
		End If
	Next
	
	//////////////////////////////////////////////////////////////////////////////
	// MASTER DW /////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////
	
	// Remove arguments from the existing sql master
	if pos(ls_sql_master,':') > 0 then
		if  ldw_master.dynamic f_getcurrentSQL( ls_currentSQL, ls_currentWhere) =1 then
			If f_RemoveArgsFromWhereClause(ls_currentWhere) > 0 Then
				if len(ls_currentWhere) > 0 then
					ls_sql_master = ls_currentSQL +' WHERE '+ ls_currentWhere
				else
					ls_sql_master = ls_currentSQL
				end if
			End If
		end if
	end if
	
	// Build SQL select of the master
	// -> Add criterias entered in shared & detail DWs
	if ldw_master.is_join_match = '' then
		If lnv_sql.f_AddToWhereClause(ls_sql_master,ls_query_where,"AND") = -1 Then
			Return -1
		End If
	else
		lnv_sql.f_parse( ls_sql_master, lstr_sql_attr[])
		ls_currentWhere = lstr_sql_attr[1].s_where
		lstr_sql_attr[1].s_where = ''
		ls_currentSQL = lnv_sql.f_assemble(  lstr_sql_attr[])
		ls_sql_master = ls_currentSQL + ' ' + ldw_master.is_join_match + ' WHERE ' + ls_currentWhere
		if ls_query_where <> '' then ls_sql_master += " AND " + ls_query_where
	end if
//End If
	if len(ls_sql_master) = 0 then
		ls_sql_master = is_querysql
	end if
	// giu lay where tim kiem cua master va detail
	if ls_query_where <>'' then
		if is_queryWhereClause <> '' then
			is_queryWhereClause+=" and " + ls_query_where
		else
			is_queryWhereClause = ls_query_where
		end if
	end if
	if not ib_rec then
		is_queryWhereClause = lc_string.f_globalreplace( is_queryWhereClause, '"', '')
		// Set the query SQL select in the master DW
		ls_rc = ldw_master.Modify("Datawindow.Table.Select=~'" + ls_sql_master + "~'")
		If not IsNull(ls_rc) and Len(ls_rc) > 0 Then Return -1
		
		is_queryJoinClause = this.f_removejoinfromjoinclause( is_queryJoinClause)
		ldw_master.is_join_query_mode = is_queryJoinClause
		
		// Retrieve rows
		this.ib_querymode = true
		If ldw_master.Event e_Retrieve() < 0 Then Return -1
		this.ib_querymode = false
	end if
End If

if not ib_rec then
	is_queryWhereClause = lc_string.f_globalreplace( is_queryWhereClause, '"', '')
	ldw_master.is_where_query_mode = is_queryWhereClause	
end if

Return 1

end event

event type integer e_cancel();Integer	li_i,li_count
String		ls_rc
t_dw_mpl		ldw_master,ldw_shared[],ldw_detail[]

// Change pointer
SetPointer(Hourglass!)

// Get the current master
ldw_master = idw_requestor.f_getdwmaster( )

// Check reference
If IsNull(ldw_master) or not IsValid(ldw_master) Then Return -1
// Check querymode service is started for master DW
If not IsValid(ldw_master.inv_querymode) Then Return -1

// Disable repaint of the DWs while disabling querymode
ldw_master.f_SetRedraw(false)

// Make sure the querymode service will not automatically make
//	a retrieve when disabling it
ldw_master.inv_querymode.f_SetUseQuerySQLOnDisabled(false)
ldw_master.inv_querymode.f_SetRetrieveOnDisabled(false)
// Tell to the querymode service the query was cancelled
ldw_master.inv_querymode.f_SetQueryCancelled(true)
// Disable querymode on the master DW
ldw_master.inv_querymode.f_SetEnabled(false)

// Disable querymode on shared DWs
li_count = ldw_master.f_getdwshared(ldw_shared)
For li_i=1 To li_count
	If IsNull(ldw_shared[li_i]) or not IsValid(ldw_shared[li_i]) Then Continue
	If IsValid(ldw_shared[li_i].inv_querymode) Then
		// Tell to the querymode service the query was cancelled
		ldw_shared[li_i].inv_querymode.f_SetQueryCancelled(true)
		// Disable querymode		
		ldw_shared[li_i].inv_querymode.f_SetEnabled(false)
	End If
Next

// Disable querymode on detail DWs
li_count = ldw_master.f_getdwdetails(ldw_detail)
For li_i=1 To li_count
	If IsNull(ldw_detail[li_i]) or not IsValid(ldw_detail[li_i]) Then Continue
	If IsValid(ldw_detail[li_i].inv_querymode) Then
		// Tell to the querymode service the query was cancelled
		ldw_detail[li_i].inv_querymode.f_SetQueryCancelled(true)
		// Disable querymode
		ldw_detail[li_i].inv_querymode.f_SetEnabled(false)
	End If
Next

// Retrieve rows
If ldw_master.Event e_Retrieve() < 0 Then Return -1

// Enable repaint of the DWs
ldw_master.f_SetRedraw(true)

// Disable current DWs
ldw_master.f_Enable(false)


Return 1
end event

event type integer e_ok_original();Boolean		lb_useautoquery
t_dw_mpl		ldw_master,ldw_details[],ldw_shared[]
t_s_sql_attr		lstr_sql_master[],lstr_sql_detail[],lstr_sql_empty[]
Integer		li_sql_master_count,li_sql_detail_count
String		ls_sql_master,ls_sql_detail
String		ls_columns[],ls_tables[],ls_empty[]
String		ls_query_where,ls_shared_where,ls_detail_where, ls_dbname
String		ls_action,ls_rc,ls_coltype
Integer		li_i,li_j,li_max, li_count_detail, li_count_shared
c_sql			lnv_sql
c_dwservice	c_service

//variable for dw detail level 2
t_dw_mpl		ldw_details2[],ldw_shared2[]
t_s_sql_attr		lstr_sql_detail2[]
Integer		li_sql_detail_count2
String		ls_sql_detail2
String		ls_columns2[],ls_tables2[]
String		ls_shared_where2,ls_detail_where2, ls_dbname2
Integer		li_i2,li_j2,li_max2, li_count_detail2, li_count_shared2




// Change pointer
SetPointer(Hourglass!)

// Get the current master
ldw_master = idw_requestor.f_getdwmaster( )

// Check reference
If IsNull(ldw_master) or not IsValid(ldw_master) Then Return -1
// Check querymode service is started for master DW
If not IsValid(ldw_master.inv_querymode) Then Return -1

// If this master is alone (no shared & no detail), we can let
// the querymode service do everything ...
li_count_detail = ldw_master.f_getdwdetails(ldw_details)
li_count_shared = ldw_master.f_getdwshared(ldw_shared)
If li_count_detail + li_count_shared = 0 Then
	// Let querymode manage the retrieve
	lb_UseAutoQuery = true
End If

// Disable repaint of the DWs while disabling querymode
ldw_master.f_SetRedraw(false)

// Check if the retrieve is done by the querymode or manually
If lb_UseAutoQuery Then
	// Tell to querymode to use the SQL it has build with criterias
	ldw_master.inv_querymode.f_SetUseQuerySQLOnDisabled(true)
	// Tell to querymode to retrieve rows automatically
	ldw_master.inv_querymode.f_SetRetrieveOnDisabled(true)	
	// Disable querymode -> The retrieve is done automatically
	If ldw_master.inv_querymode.f_SetEnabled(false) <> 1 Then Return -1
Else
	// Make sure the querymode service will not automatically make
	//	a retrieve when disabling it
	ldw_master.inv_querymode.f_SetUseQuerySQLOnDisabled(false)
	ldw_master.inv_querymode.f_SetRetrieveOnDisabled(false)
	// Disable querymode on the master DW
	ldw_master.inv_querymode.f_SetEnabled(false)
	
	// Get query SQL select of the master
	ls_sql_master = ldw_master.inv_querymode.f_GetQuerySQL()
	// Check SQL select
	If IsNull(ls_sql_master) or Len(ls_sql_master) = 0 Then Return -1
	
	//////////////////////////////////////////////////////////////////////////////
	// DETAIL DWs ////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////
	
	// Disable querymode on detail DWs & get query where clause
	For li_i = 1 To li_count_detail
		If IsNull(ldw_details[li_i]) or not IsValid(ldw_details[li_i]) Then Continue
		If IsValid(ldw_details[li_i].inv_querymode) Then
			ldw_details[li_i].inv_querymode.f_SetUseQuerySQLOnDisabled(false)
			ldw_details[li_i].inv_querymode.f_SetRetrieveOnDisabled(false)
			// Disable querymode
			ldw_details[li_i].inv_querymode.f_SetEnabled(false)
			// Get the query where clause of the detail DW
			ls_detail_where = ldw_details[li_i].inv_querymode.f_GetQueryWhereClause()
			
/////////////////////////////////////////////////////////////////////////////////////
			//DW detail level 2
			li_count_detail2 = ldw_details[li_i].f_getdwdetails(ldw_details2)
			li_count_shared2 = ldw_details[li_i].f_getdwshared(ldw_shared2)
			If li_count_detail2 + li_count_shared2 > 0 Then
				For li_i2 = 1 To li_count_detail2
					If IsNull(ldw_details2[li_i2]) or not IsValid(ldw_details2[li_i2]) Then Continue
					If IsValid(ldw_details2[li_i2].inv_querymode) Then
						ldw_details2[li_i2].inv_querymode.f_SetUseQuerySQLOnDisabled(false)
						ldw_details2[li_i2].inv_querymode.f_SetRetrieveOnDisabled(false)
						// Disable querymode
						ldw_details2[li_i2].inv_querymode.f_SetEnabled(false)
						
						// Get the query where clause of the detail DW
						ls_detail_where2 = ldw_details2[li_i2].inv_querymode.f_GetQueryWhereClause()
						If not IsNull(ls_detail_where2) and Len(ls_detail_where2) > 0 Then
							// Get the original SQL select of the detail DW
							ls_sql_detail2 = ldw_details2[li_i2].inv_querymode.f_GetOriginalSQL()
							If IsNull(ls_sql_detail2) or Len(ls_sql_detail2) = 0 Then Continue
							
							// Reset SQL statement information
							lstr_sql_detail2 = lstr_sql_empty
							// Break the SQL in parts
							li_sql_detail_count2 = lnv_sql.f_parse(ls_sql_detail2, lstr_sql_detail2)
							
							// Ignore criterias entered in detail DW that have a SQL containing
							// several select separated by UNION(s) ...
							If li_sql_detail_count2 > 1 Then Continue
							
							// Remove arguments from the existing where clause
							If f_RemoveArgsFromWhereClause(lstr_sql_detail2[1].s_where) < 0 Then
								Continue
							End If
							
							// Remove ORDER BY clause
							lstr_sql_detail2[1].s_order = ""
							
							// Add the query where clause to the existing where clause
							If not IsNull(lstr_sql_detail2[1].s_where) and Len(lstr_sql_detail2[1].s_where) > 0 Then
								lstr_sql_detail2[1].s_where += " AND "
							End If
							lstr_sql_detail2[1].s_where += ls_detail_where2
							
							// Copy detail columns & tables locally for faster access
							ls_columns2 = ls_empty
							ldw_details2[li_i2].f_get_detail_keycol(ls_columns2)
							
							// Replace the selected columns of the detail by the linkage columns
							li_max2 = UpperBound(ls_columns2)
							lstr_sql_detail2[1].s_columns = ""				
							For li_j2 = 1 To li_max2
								If li_j2 > 1 Then lstr_sql_detail2[1].s_columns += ","
//								ls_dbname2 = ldw_details2[li_i2].describe(ls_columns2[li_j2] + ".DBName")
								ls_dbname2 = ls_columns2[li_j2] 
								c_service.f_get_build_column( ldw_details2[li_i2], ls_dbname2, ls_coltype)
								ls_tables2 = ls_empty
								This.f_StringToArray(ls_dbname2,'.',ls_tables2)
								If UpperBound(ls_tables2) = 2 Then
									lstr_sql_detail2[1].s_columns += "~"" + Upper(ls_tables2[1]) + "~".~"" +  Upper(ls_tables2[2]) + "~""
								Else
									lstr_sql_detail2[1].s_columns += "~"" + Upper(ls_tables2[1]) + "~""
								End If
							Next
							
							// Rebuild the detail SQL
							ls_sql_detail2 = lnv_sql.f_Assemble(lstr_sql_detail2)
							
							// Prepare the main Query where clause
							If ls_detail_where <> "" Then ls_detail_where += " AND "
							ls_detail_where += "("
							
							// Copy master columns & tables locally for faster access
							ls_columns2 = ls_empty
							ldw_details2[li_i2].f_get_master_keycol(ls_columns2)
							li_max2 = UpperBound(ls_columns2)
							For li_j2 = 1 To li_max2
								If li_j2 > 1 Then ls_detail_where += ","
								// Add linkage column
//								ls_dbname2 = ldw_details[li_i].describe(ls_columns2[li_j2] + ".DBName")
								ls_dbname2 = ls_columns2[li_j2]
								c_service.f_get_build_column( ldw_details[li_i], ls_dbname2, ls_coltype)
								ls_tables2 = ls_empty
								This.f_StringToArray(ls_dbname2,'.',ls_tables2)
								If UpperBound(ls_tables2) = 2 Then
									ls_detail_where += "~"" + Upper(ls_tables2[1]) + "~".~"" +  Upper(ls_tables2[2]) + "~""
								Else
									ls_detail_where += "~"" + Upper(ls_tables2[1]) + "~""
								End If
							Next
							
							// Finish add of the detail SQL
							ls_detail_where += ") IN (" + ls_sql_detail2 + ")"
						End If
					End If
				Next
				
				// Disable querymode on shared DWs & get query where clause
				For li_i2 = 1 To li_count_shared2
					If IsNull(ldw_shared2[li_i2]) or not IsValid(ldw_shared2[li_i2]) Then Continue
					If IsValid(ldw_shared2[li_i2].inv_querymode) Then
						ldw_shared2[li_i2].inv_querymode.f_SetUseQuerySQLOnDisabled(false)
						ldw_shared2[li_i2].inv_querymode.f_SetRetrieveOnDisabled(false)
						// Disable querymode		
						ldw_shared2[li_i2].inv_querymode.f_SetEnabled(false)
						
						// Get the query where clause of the shared DW
						ls_shared_where2 = ldw_shared2[li_i2].inv_querymode.f_GetQueryWhereClause()
						// Add the shared where clause to the main Query where clause
						If not IsNull(ls_shared_where2) and Len(ls_shared_where2) > 0 Then
							If not IsNull(ls_detail_where) and Len(ls_detail_where) > 0 Then
								ls_detail_where += " AND "
							End If
							ls_detail_where += ls_shared_where2
						End If
					End If
				Next
			End If
////////////////////////////////////////////////////////////////////////////////////
			
			// Get the query where clause of the detail DW
//			ls_detail_where = ldw_details[li_i].inv_querymode.f_GetQueryWhereClause()
			If not IsNull(ls_detail_where) and Len(ls_detail_where) > 0 Then
				// Get the original SQL select of the detail DW
				ls_sql_detail = ldw_details[li_i].inv_querymode.f_GetOriginalSQL()
				If IsNull(ls_sql_detail) or Len(ls_sql_detail) = 0 Then Continue
				
				// Reset SQL statement information
				lstr_sql_detail = lstr_sql_empty
				// Break the SQL in parts
				li_sql_detail_count = lnv_sql.f_parse(ls_sql_detail, lstr_sql_detail)
				
				// Ignore criterias entered in detail DW that have a SQL containing
				// several select separated by UNION(s) ...
				If li_sql_detail_count > 1 Then Continue
				
				// Remove arguments from the existing where clause
				If f_RemoveArgsFromWhereClause(lstr_sql_detail[1].s_where) < 0 Then
					Continue
				End If
				
				// Remove ORDER BY clause
				lstr_sql_detail[1].s_order = ""
				
				// Add the query where clause to the existing where clause
				If not IsNull(lstr_sql_detail[1].s_where) and Len(lstr_sql_detail[1].s_where) > 0 Then
					lstr_sql_detail[1].s_where += " AND "
				End If
				lstr_sql_detail[1].s_where += ls_detail_where
				
				// Copy detail columns & tables locally for faster access
				ls_columns = ls_empty
				ldw_details[li_i].f_get_detail_keycol(ls_columns)
				
				// Replace the selected columns of the detail by the linkage columns
				li_max = UpperBound(ls_columns)
				lstr_sql_detail[1].s_columns = ""				
				For li_j=1 To li_max
					If li_j > 1 Then lstr_sql_detail[1].s_columns += ","
//					ls_dbname = ldw_details[li_i].describe(ls_columns[li_j] + ".DBName")
					ls_dbname = ls_columns[li_j]
					c_service.f_get_build_column( ldw_details[li_i], ls_dbname, ls_coltype)
					ls_tables = ls_empty
					This.f_StringToArray(ls_dbname,'.',ls_tables)
					If UpperBound(ls_tables) = 2 Then
						lstr_sql_detail[1].s_columns += "~"" + Upper(ls_tables[1]) + "~".~"" +  Upper(ls_tables[2]) + "~""
					Else
						lstr_sql_detail[1].s_columns += "~"" + Upper(ls_tables[1]) + "~""
					End If
				Next
				
				// Rebuild the detail SQL
				ls_sql_detail = lnv_sql.f_Assemble(lstr_sql_detail)
				
				// Prepare the main Query where clause
				If ls_query_where <> "" Then ls_query_where += " AND "
				ls_query_where += "("
				
				// Copy master columns & tables locally for faster access
				ls_columns = ls_empty
				ldw_details[li_i].f_get_master_keycol(ls_columns)
				li_max = UpperBound(ls_columns)
				For li_j=1 To li_max
					If li_j > 1 Then ls_query_where += ","
					// Add linkage column
//					ls_dbname = ldw_master.describe(ls_columns[li_j] + ".DBName")
					ls_dbname = ls_columns[li_j]
					c_service.f_get_build_column( ldw_master, ls_dbname, ls_coltype)
					ls_tables = ls_empty
					This.f_StringToArray(ls_dbname,'.',ls_tables)
					// Add linkage column
					If UpperBound(ls_tables) = 2 Then
						ls_query_where += "~"" + Upper(ls_tables[1]) + "~".~"" +  Upper(ls_tables[2]) + "~""
					Else
						ls_query_where += "~"" + Upper(ls_tables[1]) + "~""
					End If
				Next

				
				// Finish add of the detail SQL
				ls_query_where += ") IN (" + ls_sql_detail + ")"
			End If
		End If
	Next
	
	//////////////////////////////////////////////////////////////////////////////
	// SHARED DWs ////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////
	
	// Disable querymode on shared DWs & get query where clause
	For li_i=1 To li_count_shared
		If IsNull(ldw_shared[li_i]) or not IsValid(ldw_shared[li_i]) Then Continue
		If IsValid(ldw_shared[li_i].inv_querymode) Then
			ldw_shared[li_i].inv_querymode.f_SetUseQuerySQLOnDisabled(false)
			ldw_shared[li_i].inv_querymode.f_SetRetrieveOnDisabled(false)
			// Disable querymode		
			ldw_shared[li_i].inv_querymode.f_SetEnabled(false)
			
			// Get the query where clause of the shared DW
			ls_shared_where = ldw_shared[li_i].inv_querymode.f_GetQueryWhereClause()
			// Add the shared where clause to the main Query where clause
			If not IsNull(ls_shared_where) and Len(ls_shared_where) > 0 Then
				If not IsNull(ls_query_where) and Len(ls_query_where) > 0 Then
					ls_query_where += " AND "
				End If
				ls_query_where += ls_shared_where
			End If
		End If
	Next
	
	//////////////////////////////////////////////////////////////////////////////
	// MASTER DW /////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////

	// Build SQL select of the master
	// -> Add criterias entered in shared & detail DWs
	If lnv_sql.f_AddToWhereClause(ls_sql_master,ls_query_where,"AND") = -1 Then
		Return -1
	End If

	// Set the query SQL select in the master DW
	ls_rc = ldw_master.Modify("Datawindow.Table.Select=~'" + ls_sql_master + "~'")
	If not IsNull(ls_rc) and Len(ls_rc) > 0 Then Return -1
	
	// Retrieve rows
	ib_QueryMode = true
	If ldw_master.Event e_Retrieve() < 0 Then Return -1

End If

//destroy lnv_sql
Return 1

end event

public function integer f_querymode (boolean ab_switch);int 		li_i, li_newrow, li_share_cnt
string 	ls_columns[], ls_coltype, ls_null
date		ld_null
datetime	ldt_null
dec		ldm_null
double	ldb_null
real		lr_null
long		ll_null
time		lt_null
t_dw_mpl ldw_shared[]

s_w_main			lw_parent
s_object_display	lod_handing

idw_requestor.f_getparentwindow( lw_parent)
lod_handing = lw_parent.f_get_obj_handling( )
/* Tạm khóa, khi copy vẫn cho tiềm kiếm, 
	chỉ tìm trong giới hạn của copy
if lod_handing.ib_copying then return 0
*/
If IsNull(ab_switch) Then Return -1

If IsNull(idw_requestor) or not IsValid(idw_requestor) Then Return -1

If ib_querymode = ab_switch Then Return 0

SetNull(ls_null)
SetNull(ld_null)
SetNull(ldt_null)
SetNull(ldm_null)
SetNull(ldb_null)
SetNull(lr_null)
SetNull(ll_null)
SetNull(lt_null)

Choose Case ab_switch
	Case True
		ib_querymode = true
		li_share_cnt = idw_requestor.f_getdwshared(ldw_shared)
		for li_i = 1 to li_share_cnt
			ldw_shared[li_i].inv_querymode.ib_querymode = true
		next
		
		idw_requestor.DBCancel()
		idw_requestor.Reset()
		li_newrow = idw_requestor.InsertRow(0)
		idw_requestor.f_getcolumns(ls_columns)
		For li_i = 1 to UpperBound(ls_columns)
			ls_coltype = idw_requestor.Describe(ls_columns[li_i] + ".ColType")
			Choose Case Left(ls_coltype,5)
				Case "char(", "char"
					idw_requestor.SetItem ( li_newrow, ls_columns[li_i], ls_null ) 
				Case "date"	
					idw_requestor.SetItem ( li_newrow, ls_columns[li_i], ld_null ) 
				Case "datet"
					idw_requestor.SetItem ( li_newrow, ls_columns[li_i], ldt_null ) 
				Case "decim"
					idw_requestor.SetItem ( li_newrow, ls_columns[li_i], ldm_null ) 
				Case "numbe", "doubl"
					idw_requestor.SetItem ( li_newrow, ls_columns[li_i], ldb_null ) 
				Case "real"
					idw_requestor.SetItem ( li_newrow, ls_columns[li_i], lr_null ) 
				Case "long", "ulong"
					idw_requestor.SetItem ( li_newrow, ls_columns[li_i], ll_null ) 
				Case "time", "times"
					idw_requestor.SetItem ( li_newrow, ls_columns[li_i], lt_null ) 
			End Choose
			
		Next
		
	Case False
		f_DestroyQMControls()
		idw_requestor.resetupdate( )
		ib_querymode = false
End Choose

Return 1

end function

public function integer f_setqmcontrolvalue (string as_colname, string as_data);String	ls_rc,ls_text,ls_bgcolor
Integer	li_pos

If IsNull(as_colname) or Len(as_colname) = 0 Then Return -1

// Get text to display in the QM control
If IsNull(as_data) Then
	ls_text = ""
Else
	ls_text = as_data
End If

// Check requestor DW is valid
If IsNull(idw_requestor) or not IsValid(idw_requestor) Then Return -1

// Ignore if column's type is not 'Edit'
If idw_requestor.describe(as_colname + ".Edit.Style") <> "edit" Then Return 0

// Check if QM control already exists
If idw_requestor.Describe(as_colname + "_qm.x") = "!" Then
	// Get background color of the column or background color of the DW,
	// if the column is transparent
	If idw_requestor.describe(as_colname + ".Background.Mode") <> "1" Then
		ls_bgcolor = idw_requestor.describe(as_colname + ".Background.Color")
	Else
		ls_bgcolor = idw_requestor.describe("Datawindow.Color")
	End If
	
	// Create the QM control
	ls_rc = idw_requestor.Modify(&
	"create text(band="+ idw_requestor.describe(as_colname+".Band") &
		+ " color=~""+ f_GlobalReplace(idw_requestor.describe(as_colname+".Color"),"~"","") +"~"" &
		+ " alignment=~""+ idw_requestor.describe(as_colname+".Alignment") +"~"" &
		+ " border=~""+ f_GlobalReplace(idw_requestor.describe(as_colname+".Border"),"~"","") +"~"" &
		+ " x=~""+ f_GlobalReplace(idw_requestor.describe(as_colname+".X"),"~"","") +"~"" &
		+ " y=~""+ f_GlobalReplace(idw_requestor.describe(as_colname+".Y"),"~"","") +"~"" &
		+ " height=~""+ f_GlobalReplace(idw_requestor.describe(as_colname+".height"),"~"","") +"~"" &
		+ " width=~""+ f_GlobalReplace(idw_requestor.describe(as_colname+".width"),"~"","") +"~"" &
		+ " text=~""+ ls_text +"~" name="+ as_colname + "_qm" &
		+ " font.face=~"Tahoma~" font.height=~"-9~" font.weight=~"400~"" &
		+ "font.family=~"2~" font.pitch=~"2~" font.charset=~"0~"" &
		+ "background.mode=~"0~" background.color=~""+ f_GlobalReplace(ls_bgcolor,"~"","") +"~")")
	
Else
	// Update QM control's text
	ls_rc = idw_requestor.modify(as_colname + "_qm.text=~'" + ls_text + "~'")

End If

Return 1

end function

public function integer f_destroyqmcontrols ();String	ls_syntax,ls_colname,ls_buffer,ls_rc
Long		ll_pos1,ll_pos2

If IsNull(idw_requestor) or not IsValid(idw_requestor) Then Return -1

// Get requestor DW's syntax
ls_syntax = idw_requestor.describe("Datawindow.Syntax")

// Search for a QM control
ll_pos1 = Pos(ls_syntax,"_qm ")
Do While (ll_pos1 > 0)
	// Get position of the 'name' keyword
	ll_pos2 = LastPos(ls_syntax,"name=",ll_pos1)
	
	// Get column's name
	ls_colname = Mid(ls_syntax,ll_pos2+5,(ll_pos1+3)-(ll_pos2+5))
	
	// Fill buffer
	ls_buffer = "destroy " + ls_colname
	
	// Update requestor DW
	ls_rc = idw_requestor.modify(ls_buffer)
	
	// Search for the next QM control
	ll_pos1 = Pos(ls_syntax,"_qm ",ll_pos1+1)
Loop

Return 1

end function

public function integer f_setrequestor (t_dw_mpl adw_requestor);If IsNull(adw_requestor) or Not IsValid(adw_requestor) Then
	Return -1
End If

idw_Requestor = adw_Requestor
Return 1
end function

public function integer f_backuporiginalsql ();string 			ls_originalSQL,ls_originalWhere,ls_originalSQLs[],ls_where
c_string			lc_string
t_dw_mpl		ldw_master
t_ds_db			lds_temp
s_w_main		lw_parent
s_object_display	lod_handling
// Check requestor DW is valid
If not IsValid(idw_requestor) or IsNull(idw_requestor) Then Return -1

if this.ib_rec then
	lds_temp = create t_ds_db
	lds_temp.dataobject = idw_requestor.dataobject
	//lấy câu SQL của dataobject lúc thiết kế
	ls_originalSQL = lds_temp.describe("Datawindow.Table.Select")
	is_originalSQL = ls_originalSQL
else
	// Save the SQL select statement
	if idw_requestor.f_get_ib_master( ) and not idw_requestor.f_get_ib_detail( ) then
		idw_requestor.f_getparentwindow( lw_parent)
		lod_handling = lw_parent.f_get_obj_handling( )
		if lod_handling.ib_copying then
			ls_originalSQL = idw_requestor.is_originalsql_nowhere
			ls_originalWhere = idw_requestor.is_originalwhereclause
		else
			idw_requestor.f_getcurrentsql( ls_originalSQL, ls_originalWhere)
		end if
		if idw_requestor.f_is_branch( ) then
			if idw_requestor.getrow() > 0 then
				idb_branch = idw_requestor.getitemnumber( idw_requestor.getrow() , 'branch_id')
			else
				idb_branch = gdb_branch
			end if
			ls_where = this.f_getquerywhereclause( )
			if ls_where <> '' then ls_originalWhere = lc_string.f_globalreplace( ls_originalWhere,' AND ' +  ls_where, ' ' )
		end if
	elseif idw_requestor.f_get_ib_shared( ) then
		ldw_master=idw_requestor.f_get_idw_master()
		ldw_master.f_getcurrentsql( ls_originalSQL, ls_originalWhere)
	else
		idw_requestor.f_get_originalsql( ls_originalSQL, ls_originalWhere)
		if idw_requestor.f_get_ib_detail( ) and (isnull(ls_originalSQL) or ls_originalSQL = '') then idw_requestor.f_getcurrentsql( ls_originalSQL, ls_originalWhere)
	end if
	//idw_requestor.f_getcurrentsql(ls_originalSQL , ls_where)
	if isnull(ls_originalWhere) then ls_originalWhere = ''
	if ls_originalWhere <> '' then
		is_originalSQL = ls_originalSQL + ' WHERE ' + ls_originalWhere
	else
		is_originalSQL = ls_originalSQL
	end if
end if
//is_originalSQL = idw_requestor.describe("Datawindow.Table.Select")

// Check for errors
If IsNull(is_originalSQL) or Len(is_originalSQL) = 0 Then
	Return -1
End If

// Prepare original SQL to be re-used in a modify DW function
//is_originalSQL = f_GlobalReplace(is_originalSQL,"'","~~'")

// Also save the dataobject so the service can
// automatically detect when the dataobject has changed
//	and so, when it needs to refresh the original SQL.
is_originalSQLdataobject = idw_requestor.Dataobject

Return 1

end function

public function integer f_resetquerycriterias ();t_s_querymode_criteria	lnv_criteria_empty[]

// Reset criterias
istr_criterias = lnv_criteria_empty

Return 1
end function

public function integer f_setenabled (boolean ab_switch);String	ls_empty[]
double ldb_branch_id

// Check argument
If IsNull(ab_switch) Then Return -1

// Check requestor DW is valid
If not IsValid(idw_requestor) or IsNull(idw_requestor) Then Return -1

// Disable the Redraw during the operation if necessary
If ib_AutoRedraw Then idw_requestor.SetReDraw (false)

Choose Case ab_switch

	Case True
			//kiểm tra chi nhánh
			if idw_requestor.f_is_branch( ) then
				if idw_requestor.getrow( ) > 0 then  
					ldb_branch_id = idw_requestor.getitemnumber( idw_requestor.getrow( ) ,'branch_id')
				else
					ldb_branch_id = gdb_branch
				end if
			end if
			// Backup original SQL if necessary
			If idw_requestor.Dataobject <> is_originalSQLdataobject or (ldb_branch_id <> idb_branch and ldb_branch_id <> 0 ) Then
				If f_BackupOriginalSQL() <> 1 Then
					If ib_AutoRedraw Then idw_requestor.SetReDraw (true)
					Return -1
				End If
			End If
			
			// Clear prior QueryMode criterias if necessary
			If ib_resetcriteria Then f_ResetQueryCriterias()
			
			// Activate Querymode in requestor DW
			f_QueryMode(true)
			
			// Refresh column properties if necessary
			If ib_AutoRefreshColsProperties Then f_SetQueryCols(ls_empty)
		
			// Set column properties for the query mode
			f_SetQueryColsProperties(True)

	Case False
			// Check if this query was canceled
			If not ib_QueryCancelled Then
				// Accept entered criterias
				If idw_requestor.f_AcceptText() <> 1 Then
					If ib_AutoRedraw Then idw_requestor.SetReDraw (true)
					Return -1
				End If
			End If
			
			// Deactivate Querymode in requestor DW
			if idw_requestor.f_get_ib_shared( ) then  f_Querymode(false)

			// Reset original column properties
			f_SetQueryColsProperties(false)

			// Check if this query was canceled
			If not ib_QueryCancelled Then
				// Build the query SQL statement
				If f_BuildQuerySQL() <> 1 Then
					If ib_AutoRedraw Then idw_requestor.SetReDraw (true)
					Return -1
				Else
					// Set the query SQL statement in the requestor DW
					// if appropriate
					If ib_UseQuerySQLOnDisabled Then
						If f_SetQuerySQL() <> 1 Then
							If ib_AutoRedraw Then idw_requestor.SetReDraw (true)
							Return -1
						End If
					End If
				End If

				// Perform retrieve if appropriate.
				if ib_retrieveondisabled then
					If idw_requestor.event e_retrieve () < 0 Then
						If ib_AutoRedraw Then idw_requestor.SetReDraw (true)
						Return -1
					End If
				end if
			End If

			// Reset Cancelled status
			If ib_QueryCancelled Then ib_QueryCancelled = false
End Choose

// Refresh requestor DW if necessary
If ib_AutoRedraw Then idw_requestor.SetReDraw (true)

Return 1

end function

public function integer f_setquerycols (string as_querycolumns[]);t_s_querymodeattr	istr_empty[]
Integer	li_i,li_maxcols,li_j,li_maxset
String		ls_colname,ls_collist[]

// Check requestor DW is valid
If not IsValid(idw_requestor) or IsNull(idw_requestor) Then Return -1

// Get number of registered columns
li_maxcols = UpperBound (istr_querymodeinfo) 

// Check if columns of the requestor dataobject have already been registered
// and if the dataobject hasn't changed
If (li_maxcols = 0) or (is_dataobject <> idw_requestor.Dataobject) Then
	
	// Reset registered columns if necessary
	If li_maxcols = 0 Then istr_querymodeinfo = istr_empty
	
	// Initialize the attribute class with information of all the columns.
	li_maxcols = idw_requestor.f_GetColumns(ls_collist)
	If li_maxcols <= 0 Then Return -1
	
	// Register columns
	For li_i = 1 To li_maxcols
		istr_querymodeinfo[li_i].s_col = ls_collist[li_i]
	Next
	
	// Register dataobject of the requestor DW
	is_dataobject = idw_requestor.Dataobject

	// Save query columns
	is_querycolumns = ls_collist
End If

// Get number of passed columns
li_maxset = UpperBound (as_querycolumns)

// Loop on registered columns and refresh information
For li_i = 1 To li_maxcols
	// Get column's name
	ls_colname = istr_querymodeinfo[li_i].s_col
	
	// Loop on passed columns & unset queryable flag if found
	For li_j = 1 To li_maxset
		If Lower (ls_colname) = Lower (as_querycolumns[li_j]) Then
			istr_querymodeinfo[li_i].b_state = false
			Exit
		End If
	Next
	
	// If column wasn't found in passed columns, reset queryable flag to true
	If li_j > li_maxset Then istr_querymodeinfo[li_i].b_state = true
	
	// Refresh column's information
	istr_querymodeinfo[li_i].s_protect = idw_requestor.Describe (ls_colname + ".protect")
	istr_querymodeinfo[li_i].is_visible = idw_requestor.Describe (ls_colname + ".visible")
	istr_querymodeinfo[li_i].is_limit = idw_requestor.Describe (ls_colname + ".edit.limit")
	istr_querymodeinfo[li_i].ib_haslabel = (idw_requestor.Describe (ls_colname + "_t.X") <> "!")
Next

Return 1

end function

protected function integer f_setquerycolsproperties (boolean ab_switch);String	ls_colname,ls_style,ls_modify,ls_rc
Integer	li_i,li_numquerycols

// Check the argument
If IsNull(ab_switch) Then Return -1

// Check requestor DW is valid
If not IsValid(idw_requestor) or IsNull(idw_requestor) Then Return -1

// Get the upperbound of the querymode stored information.
li_numquerycols = UpperBound (istr_querymodeinfo)

// Set the properties for the querymode
If ab_switch Then
	// Build Modify string to change all the appropriate properties
	for li_i = 1 to li_numquerycols
		// use a local variable for easier manipulation
		ls_colname = istr_querymodeinfo[li_i].s_col
		
		// Change protect propery
		if istr_querymodeinfo[li_i].b_state = false then
			// Check current property
			If istr_querymodeinfo[li_i].s_protect <> "1" Then
				// Add to modify string to protect for non-querymode columns
				ls_modify = ls_modify + ls_colname + ".Protect=1 " 
			End If
		else
			// Check current property
			If istr_querymodeinfo[li_i].s_protect <> "0" Then				
				// Add to modify string to non-protect for querymode columns.
				ls_modify = ls_modify + ls_colname + ".Protect=0 " 
			End If
		end if
		
		// Check if query operators are allowed
		If ib_AllowQueryOperators Then
			// Check Edit style of the column
			ls_style = lower(idw_requestor.describe(ls_colname + ".Edit.Style"))
			If ls_style = "edit" or ls_style = "dropdownlistbox" Then
				// Reset Edit limit
				If istr_querymodeinfo[li_i].is_limit <> "!" &
					and istr_querymodeinfo[li_i].is_limit <> "0" Then			
					// Add to modify string to remove limit for querymode columns.
					ls_modify = ls_modify + ls_colname + ".Edit.Limit=0 "
				End If
			End If
		End If
		
//		If istr_querymodeinfo[li_i].is_visible <> "1" Then
//			// Add to modify string to display querymode columns.
//			ls_modify = ls_modify + ls_colname + ".Visible=1 "
//	
//			// Display text label if existing
//			If istr_querymodeinfo[li_i].ib_haslabel Then
//				ls_modify = ls_modify + ls_colname + "_t.Visible=1 "
//			End If
//		End If
	next
Else
	// Build Modify string to Reset all the appropriate properties
	for li_i = 1 to li_numquerycols
		// use a local variable for easier manipulation
		ls_colname = istr_querymodeinfo[li_i].s_col
		
		// Check if the property need to be modified
		If (istr_querymodeinfo[li_i].b_state and istr_querymodeinfo[li_i].s_protect <> "0") &
			or (not istr_querymodeinfo[li_i].b_state and istr_querymodeinfo[li_i].s_protect <> "1") Then			
			// Add to Modify string to restore the protect property
			ls_modify = ls_modify + ls_colname + ".Protect=" &
							+ istr_querymodeinfo[li_i].s_protect + " "
		End If
		
		// Check if query operators are allowed
		If ib_AllowQueryOperators Then
			// Check Edit style of the column
			ls_style = lower(idw_requestor.describe(ls_colname + ".Edit.Style"))
			If ls_style = "edit" or ls_style = "dropdownlistbox" Then
				// Check if the property need to be modified
				If istr_querymodeinfo[li_i].is_limit <> "!" &
					and istr_querymodeinfo[li_i].is_limit <> "0" Then			
					// Add to Modify string to restore the protect property
					ls_modify = ls_modify + ls_colname + ".Edit.Limit=" &
									+ istr_querymodeinfo[li_i].is_limit + " "
				End If
			End If
		End If
		
//		// Check if the property need to be modified
//		If istr_querymodeinfo[li_i].is_visible <> "1" Then
//			// Add to Modify string to restore the visible property
//			ls_modify = ls_modify + ls_colname + ".Visible=" &
//							+ istr_querymodeinfo[li_i].is_visible + " "
//			
//			// Restore Visible property of text label if existing
//			// (Only if requestor DW is not a grid)
//			If istr_querymodeinfo[li_i].ib_haslabel &
//				and not idw_requestor.f_IsGrid() Then
//				ls_modify = ls_modify + ls_colname + "_t.Visible=" &
//								+ istr_querymodeinfo[li_i].is_visible + " "
//			End If
//		End If
	next
End If

// Execute the Modify string changing all the appropriate properties
ls_rc = idw_Requestor.Modify (ls_modify)
If ls_rc <> "" Then
	Return -1
End If

Return 1

end function

public function integer f_getquerycriterias (ref t_s_querymode_criteria astr_criterias[]);// Return criterias
astr_criterias = istr_criterias

// Return number of criterias
Return UpperBound(istr_criterias)
end function

public function integer f_setquerycriteria (t_s_querymode_criteria astr_criteria);Integer	li_i,li_max

// Check argument
If IsNull(astr_criteria) or not IsValid(astr_criteria) Then Return -1
If IsNull(astr_criteria.is_colname) or Len(astr_criteria.is_colname) = 0 Then Return -1

// See if we already have a criteria for this column
li_max = UpperBound(istr_criterias)
For li_i=1 To li_max
	// Check if column has been found
	If istr_criterias[li_i].is_colname = astr_criteria.is_colname Then
		Exit
	End If
Next

// Overwrite existing value or add a new one
istr_criterias[li_i] = astr_criteria

Return 1

end function

public function string f_getoriginalsql ();Return is_originalsql
end function

public function integer f_restoreoriginalsql ();String	ls_rc

// Check requestor DW reference
If not IsValid(idw_requestor) or IsNull(idw_requestor) Then Return -1

// Check original SQL
If IsNull(is_originalsql) or Len(is_originalSQL) = 0 Then
	MessageBox("QueryMode service -> f_RestoreOriginalSQL : ",&
			 "Couldn't restore the original SQL because the saved statement was empty.")
	Return -1
End If

// Check the dataobject
If idw_requestor.Dataobject <> is_originalSQLdataobject Then
	// Log an entry in the debug log window
	MessageBox("QueryMode service -> f_RestoreOriginalSQL : ", &
			 "Couldn't restore the original SQL because the dataobject has changed " &
			+ "and the SQL statement hasn't been saved yet.")
	Return -1
End If

// Restore original SQL
ls_rc = idw_requestor.Modify("Datawindowo.Table.Select=~'" + is_originalSQL + "~'")
If ls_rc <> "" Then
	MessageBox("QueryMode service -> f_RestoreOriginalSQL : ", &
			+ "Couldn't restore the original SQL because an error occured in the modify.~r~n" &
			+ " Saved SQL statement : " + is_originalSQL + ".~r~nError in modify : " + ls_rc)
	Return -1
End If

Return 1

end function

public function boolean f_getautoredraw ();Return ib_AutoRedraw
end function

public function integer f_setautoredraw (boolean ab_switch);// Check argument
If IsNull(ab_switch) Then Return -1

// Set auto redraw status
ib_AutoRedraw = ab_switch

Return 1
end function

public function boolean f_getresetcriteria ();return ib_resetcriteria
end function

public function integer f_setresetcriteria (boolean ab_reset);if IsNull (ab_reset) then return -1  

ib_resetcriteria = ab_reset
return 1
end function

public function boolean f_getautorefreshcolsproperties ();Return ib_AutoRefreshColsProperties
end function

public function integer f_setautorefreshcolsproperties (boolean ab_switch);// Check argument
If IsNull(ab_switch) Then Return -1

// Set auto refresh status
ib_AutoRefreshColsProperties = ab_switch

Return 1

end function

public function integer f_setallowqueryoperators (boolean ab_switch);// Check argument
If IsNull(ab_switch) Then Return -1

// Set flag
ib_AllowQueryOperators = ab_switch

Return 1
end function

public function boolean f_getallowqueryoperators ();Return ib_AllowQueryOperators
end function

public function integer f_setquerycancelled (boolean ab_switch);// Check argument
If IsNull(ab_switch) Then Return -1

// Set cancelled status
ib_QueryCancelled = ab_switch

Return 1
end function

public function integer f_buildquerysql ();String		ls_querywhereclause,ls_querysql,ls_queryJoinClause
c_sql	lnv_sql



// Get the updated where clause
If f_BuildQueryWhereClause(ls_querywhereclause) <> 1 Then
	MessageBox("DW QueryMode service -> f_BuildQuerySQL : ", ls_querywhereclause)
	Return -1
End If

// Check returned WHERE clause
If ls_querywhereclause = "" Then
	// If no criterias were entered, use original SQL
	is_querysql = is_originalsql
	ls_queryJoinClause = ''
Else
	// Criterias were entered and a new WHERE clause was built
	// -> build the new SQL select statement
	
	// Use the original SQL as the basis for the query SQL
	ls_querysql = is_originalsql
	
	if ls_querywhereclause <> '' then
		ls_querywhereclause = '('+ls_querywhereclause+')'
	end if
	
	// Add the query where clause to the SQL statement
	if idw_Requestor.is_join_match = '' then
		If lnv_sql.f_AddToWhereClause(ls_querysql,ls_querywhereclause,"AND") = 1 Then
			// Save the query SQL
			is_querysql = ls_querysql
		End If
	else
		is_querysql = ls_querysql + ' AND '+ ls_querywhereclause
	end if
	if idw_Requestor.f_get_ib_master( ) and not idw_Requestor.f_get_ib_detail( ) then
		ls_queryJoinClause = this.f_get_joinsql(idw_Requestor )
	end if
End If

// Save new query WHERE clause
is_querywhereclause = ls_querywhereclause
//save join clause master
is_queryJoinClause = ls_queryJoinClause
Return 1

end function

public function string f_getquerysql ();Return is_querysql
end function

public function integer f_setquerysql ();String	ls_rc

// Check requestor DW reference
If not IsValid(idw_requestor) or isNull(idw_requestor) Then Return -1

// Check query SQL
If IsNull(is_querysql) or Len(is_querysql) = 0 Then
	MessageBox("DW QueryMode service -> f_SetQuerySQL : ", &
			+ "Couldn't set the query SQL because the saved statement was empty.")
	Return -1
End If

// Set the query SQL
ls_rc = idw_requestor.Modify("Datawindow.Table.Select=~'" + is_querysql + "~'")
If ls_rc <> "" Then
	MessageBox("DW QueryMode service -> f_SetQuerySQL : ", &
			+ "Couldn't set the query SQL because an error occured in the modify.~r~n" &
			+ " Saved SQL statement : " + is_querysql + ".~r~nError in modify : " + ls_rc)
	Return -1
End If
Return 1

end function

public function string f_getquerywhereclause ();Return is_queryWhereClause
end function

protected function boolean f_iscriteriavalid (string as_colname, ref string as_data);Integer	li_pos1,li_pos2,li_pos_between,li_i,li_count
String		ls_data,ls_left,ls_right,ls_values[]
c_u_datetime	lnv_datetime
lnv_datetime = create c_u_datetime

// Check requestor DW
If not IsValid(idw_requestor) or IsNull(idw_requestor) Then Return false

// Remove leading & trailing spaces
ls_data = Trim(as_data)

// Check arguments
If IsNull(as_colname) or Len(as_colname) = 0 Then Return false
If IsNull(ls_data) or Len(ls_data) = 0 Then Return false

// Perform checks depending on the datatype of the column
Choose Case Lower(Left(idw_requestor.describe(as_colname + ".ColType"),5))
	Case "char("
		// Accept single star ('*') wildcard (-> not null)
		If ls_data = "*" Then Return true
		
		// Check criterias containing < > wildcards
		If Match(ls_data,"^[<>] *[^=>].*$") Then
			// Exit if query operators not allowed
			Return ib_AllowQueryOperators
		End If
		
		// Check criterias containing <= >= <> wildcards
		If Match(ls_data,"^[<>]= *.+$") or Match(ls_data,"^<> *[^(]+$") Then
			// Exit if query operators not allowed
			Return ib_AllowQueryOperators
		End If
		
		// Check the remaining wildcards
		If Match(ls_data,"^<> *(.*[;:]*.*)$") or Match(ls_data,"^(.*[;:]*.*)$") Then
			// Exit if query operators not allowed
			Return ib_AllowQueryOperators
		Else
			// No wildcards used -> accept value
			Return true
		End If
	
	Case "date","datet"
		
		// Accept single star ('*') wildcard (-> not null)
		If ls_data = "*" Then Return true
		
		// Check criterias containing < > wildcards
		If Match(ls_data,"^[<>] *[^=>].*$") Then
			// Exit if query operators not allowed
			If not ib_AllowQueryOperators Then Return false
			
			ls_right = Trim(Mid(ls_data,2))
			If lnv_datetime.f_IsValid(ls_right,1) Then
				// Refresh the value
				as_data = Left(ls_data,1) + ls_right
				Return true
			Else
				Return false
			End If
		End If
		
		// Check criterias containing <= >= <> wildcards
		If Match(ls_data,"^[<>]= *.+$") or Match(ls_data,"^<> *[^(]+$") Then
			// Exit if query operators not allowed
			If not ib_AllowQueryOperators Then Return false

			ls_right = Trim(Mid(ls_data,3))
			If lnv_datetime.f_IsValid(ls_right,1) Then
				// Refresh the value
				as_data = Left(ls_data,2) + ls_right
				Return true
			Else
				Return false
			End If
		End If
		
		// Check the remaining wildcards
		If Match(ls_data,"^<> *(.*[;:]*.*)$") or Match(ls_data,"^(.*[;:]*.*)$") Then
			// Exit if query operators not allowed
			If not ib_AllowQueryOperators Then Return false			
			
			// Get position of (
			li_pos1 = Pos(ls_data,"(")
			// Get position of )
			li_pos2 = Pos(ls_data,")")
			
			// Get content of the brackets ()
			ls_right = Trim(Mid(ls_data,li_pos1+1,li_pos2 -li_pos1 -1))
			
			// () = NULL -> OK
			If Len(ls_right) = 0 Then Return true
			
			li_pos_between = Pos(ls_right,":")
			If li_pos_between > 0 Then
				// We must have 2 values (-> between)
				ls_values[1] = Trim(Left(ls_right,li_pos_between -1))
				ls_values[2] = Trim(Mid(ls_right,li_pos_between +1))
				
				// Test the first value
				If not lnv_datetime.f_IsValid(ls_values[1],1) Then
					// The first value is invalid
					//	-> no need to test the second one
					Return false
				End If
				
				// Test the second value
				If lnv_datetime.f_IsValid(ls_values[2],1) Then
					// Refresh the value
					as_data = Left(ls_data,li_pos1) + ls_values[1] + ":" + ls_values[2] + ")"
					Return true
				Else
					Return false
				End If
			Else
				// We must have 1 or more values (-> in)
				li_count = f_StringToArray(ls_right,";",ls_values)
				
				// Check all the values
				For li_i=1 To li_count
					// Trim values
					ls_values[li_i] = Trim(ls_values[li_i])
					If not lnv_datetime.f_IsValid(ls_values[li_i],1) Then Return false
				Next
				
				// Refresh the value
				f_ArrayToString(ls_values,";",as_data)
				as_data = Left(ls_data,li_pos1) + as_data + ")"
				
				// All the values were accepted
				Return true				
			End If
		Else
			// No wildcards used -> check value
			If lnv_datetime.f_IsValid(ls_data,1) Then
				// Refresh the value
				as_data = ls_data
				Return true
			Else
				Return false
			End If			
		End If
		
	Case "decim","numbe"

		// Accept single star ('*') wildcard (-> not null)
		If ls_data = "*" Then Return true
		
		// Check criterias containing < > wildcards
		If Match(ls_data,"^[<>] *[^=>].*$") Then
			// Exit if query operators not allowed
			If not ib_AllowQueryOperators Then Return false
			
			ls_right = Trim(Mid(ls_data,2))
			If IsNumber(ls_right) Then
				// Refresh the value
				as_data = Left(ls_data,1) + ls_right
				Return true
			Else
				Return false
			End If
			
		End If
		
		// Check criterias containing <= >= <> wildcards
		If Match(ls_data,"^[<>]= *.+$") or Match(ls_data,"^<> *[^(]+$") Then
			// Exit if query operators not allowed
			If not ib_AllowQueryOperators Then Return false
			
			ls_right = Trim(Mid(ls_data,3))
			If IsNumber(ls_right) Then
				// Refresh the value
				as_data = Left(ls_data,2) + ls_right
				Return true
			Else
				Return false
			End If
		End If
		
		// Check the remaining wildcards
		If Match(ls_data,"^<> *(.*[;:]*.*)$") or Match(ls_data,"^(.*[;:]*.*)$") Then
			// Exit if query operators not allowed
			If not ib_AllowQueryOperators Then Return false
			
			// Get position of (
			li_pos1 = Pos(ls_data,"(")
			// Get position of )
			li_pos2 = Pos(ls_data,")")
			
			// Get content of the brackets ()
			ls_right = Trim(Mid(ls_data,li_pos1+1,li_pos2 -li_pos1 -1))
			
			// () = NULL -> OK
			If Len(ls_right) = 0 Then Return true
			
			li_pos_between = Pos(ls_right,":")
			If li_pos_between > 0 Then
				// We must have 2 values (-> between)
				ls_values[1] = Trim(Left(ls_right,li_pos_between -1))
				ls_values[2] = Trim(Mid(ls_right,li_pos_between +1))
				
				// Test the first value
				If not IsNumber(ls_values[1]) Then
					// The first value is invalid
					//	-> no need to test the second one
					Return false
				End If
				
				// Test the second value
				If IsNumber(ls_values[2]) Then
					// Refresh the value
					as_data = Left(ls_data,li_pos1) + ls_values[1] + ":" + ls_values[2] + ")"
					Return true
				Else
					Return false
				End If
				
			Else
				// We must have 1 or more values (-> in)
				li_count = f_StringToArray(ls_right,";",ls_values)
				
				// Check all the values
				For li_i=1 To li_count
					// Trim values
					ls_values[li_i] = Trim(ls_values[li_i])
					If not IsNumber(ls_values[li_i]) Then Return false
				Next

				// Refresh the value
				f_ArrayToString(ls_values,";",as_data)
				as_data = Left(ls_data,li_pos1) + as_data + ")"
				
				// All the values were accepted
				Return true				
			End If
		Else
			// No wildcards used -> check value
			Return IsNumber(ls_data)
		End If
		
End Choose

destroy lnv_datetime
// Accept value for datatypes other than number & dates
Return True

end function

public function string f_getquerycriteria (string as_colname);Integer	li_i,li_max
String	ls_null

// Prepare a null value
SetNull(ls_null)

// Check argument
If IsNull(as_colname) or Len(as_colname) = 0 Then Return ls_null

// Loop on criterias
li_max = UpperBound(istr_criterias)
For li_i=1 To li_max
	// Check if column has been found
	If istr_criterias[li_i].is_colname = as_colname Then
		// Return criteria value
		Return istr_criterias[li_i].is_value
	End If
Next

Return ls_null
end function

public function integer f_getquerycriteria (string as_colname, ref string as_criteria);Integer	li_i,li_max

// Check argument
If IsNull(as_colname) or Len(as_colname) = 0 Then Return -1

// Loop on criterias
li_max = UpperBound(istr_criterias)
For li_i=1 To li_max
	// Check if column has been found
	If istr_criterias[li_i].is_colname = as_colname Then
		// Return criteria value
		as_criteria = istr_criterias[li_i].is_value
		
		Return 1
	End If
Next

Return -1
end function

public function boolean f_getenabled ();Return ib_QueryMode
end function

public function integer f_setusequerysqlondisabled (boolean ab_switch);If IsNull(ab_switch) Then Return -1

ib_usequerysqlondisabled = ab_switch

Return 1
end function

public function boolean f_getusequerysqlondisabled ();Return ib_usequerysqlondisabled
end function

public function boolean f_getretrieveondisabled ();return ib_retrieveondisabled
end function

public function integer f_setretrieveondisabled (boolean ab_retrieve);if IsNull (ab_retrieve) then return -1  

ib_retrieveondisabled = ab_retrieve
return 1
end function

protected function integer f_buildquerywhereclause (ref string as_where);String		ls_where,ls_criteria
String		ls_colname,ls_value
String		ls_coltype,ls_dbname
String		ls_values[],ls_empty[]
Integer		li_i,li_count,li_pos,li_i1,li_j1
Integer		li_j,li_nb_values
Boolean		lb_not
String		ls_obj_type
//c_string		lc_string
c_dwservice	lc_service


// Check requestor DW reference
If not IsValid(idw_requestor) or IsNull(idw_requestor) Then Return -1

// Get number of criterias
li_count = UpperBound(istr_criterias)

// Build the WHERE clause with the criterias
For li_i=1 To li_count
	// Get the current criteria's value
	ls_value = istr_criterias[li_i].is_value
	
	// Ignore NULL values
	If IsNull(ls_value) or Len(ls_value) = 0 Then continue
	
	// Reset some variables
	lb_not = false
	ls_criteria = ""
	ls_values = ls_empty
	
	// Link the criterias with the AND operator
	if istr_criterias[li_i].is_expression <> '' then
		if ls_where <> "" Then ls_where += istr_criterias[li_i].is_expression
	else
		If ls_where <> "" Then ls_where += " AND "
	end if
	
	// Get column's name
	ls_colname = istr_criterias[li_i].is_colname
	
	// Get column's DB name & type
	if pos(ls_value,';') = 0 and  pos(ls_value,':') = 0 and  pos(ls_value,'=') = 0 then
		ls_criteria = lc_service.f_buildwhereclause( idw_requestor, ls_colname, upper(ls_value))
	else
		ls_criteria = lc_service.f_buildwhereclause( idw_requestor, ls_colname, ls_value)
	end if
//	ls_dbname = ls_colname
//	if lc_service.f_get_build_column( idw_requestor, ls_dbname, ls_coltype) = 1 then
//		ls_criteria = lc_service.f_buildwhereclause( idw_requestor, ls_dbname, upper(ls_value))
//		ls_criteria = lc_string.f_get_expression( upper(ls_value), ls_coltype, ls_dbname, 'build where')
//	end if
//	ls_dbname =  idw_requestor.describe(ls_colname + ".dbAlias")
//	if pos(ls_dbname,'.') = 1 then
//		ls_dbname = idw_requestor.describe(ls_colname + ".DBName")
//	elseif ls_dbname = '!' then
//		ls_dbname = ls_colname
//	elseif ls_dbname = '?' then
//		messagebox('Thông báo','querymode:buildwhere: Không lấy được db_alias')
//		return -1
//	end if
//	ls_coltype = idw_requestor.describe(ls_colname + ".ColType")
//	ls_criteria = lc_string.f_get_expression( upper(ls_value), ls_coltype, ls_dbname, 'build where')
	
//	ls_obj_type = idw_requestor.describe(ls_colname + ".Edit.Style")
	
	
	// Add criteria to the WHERE clause depending on the column's datatype
	
	
	// Check if the criteria was properly built
	If ls_criteria = "ERROR" Then
		// Return the error message
		as_where = "Error building criteria for column ~'" + ls_colname + "~'."
		Return -1
	End If
	
	// The criteria was build
	// -> Add the last bracket
//	ls_criteria += " )"
	
	// Add criteria to WHERE Clause
	ls_where += ls_criteria
Next

// Set the where clause to be returned
as_where = ls_where

Return 1

end function

public function string f_check_char (string as_source, string as_obj_type, string as_colname);/*
đã tách hàm viêt trên t_dw
string 	ls_source,ls_rtn,ls_char,ls_mid,ls_source_values[],ls_source_value,ls_mids[]
string 	ls_left,ls_right
int			li_i,li_count_char,li_rtn,li_j


ls_rtn = as_source
if as_obj_type = 'ddlb' then
	ls_source = as_source
	if pos(ls_source,'>') > 0 or pos(ls_source,'<') > 0 or pos(ls_source,'=') > 0 then
		ls_rtn = ''
		if match(ls_source,'^<> *') then
			if pos(ls_source,'(') = 0 then
				ls_mid = trim(mid(ls_source,pos(ls_source,'>') + 1,len(ls_source)))
				ls_left = trim(left(ls_source,pos(ls_source,'>')))
			else
				ls_mid = trim(mid(ls_source,pos(ls_source,'(')+1,pos(ls_source,')') - pos(ls_source,'(')-1))
				ls_left = trim(left(ls_source,pos(ls_source,'(')))
				ls_right = trim(right(ls_source,len(ls_source) - pos(ls_source,')')+1))
			end if
		elseif match(ls_source,'^<= *') or match(ls_source,'^>= *') then
			if pos(ls_source,'(') = 0 then
				ls_mid = trim(mid(ls_source,pos(ls_source,'=') + 1,len(ls_source)))
				ls_left = trim(left(ls_source,pos(ls_source,'=')))
			else
				ls_mid = trim(mid(ls_source,pos(ls_source,'(') +1,pos(ls_source,')') - pos(ls_source,'(')-1 ))
				ls_left = trim(left(ls_source,pos(ls_source,'(')))
				ls_right = trim(right(ls_source,len(ls_source) - pos(ls_source,')')+1))
			end if
		elseif match(ls_source,'^< *') then
			if pos(ls_source,'(') = 0 then
				ls_mid = trim(mid(ls_source,pos(ls_source,'<') + 1,len(ls_source)))
				ls_left = trim(left(ls_source,pos(ls_source,'<')))
			else
				ls_mid = trim(mid(ls_source,pos(ls_source,'(') +1,pos(ls_source,')') - pos(ls_source,'(')-1 ))
				ls_left = trim(left(ls_source,pos(ls_source,'(')))
				ls_right = trim(right(ls_source,len(ls_source) - pos(ls_source,')')+1))
			end if
		elseif match(ls_source,'^> *') then
			if pos(ls_source,'(') = 0 then
				ls_mid = trim(mid(ls_source,pos(ls_source,'>') + 1,len(ls_source)))
				ls_left = trim(left(ls_source,pos(ls_source,'>')))
			else
				ls_mid = trim(mid(ls_source,pos(ls_source,'(') +1,pos(ls_source,')') - pos(ls_source,'(')-1 ))
				ls_left = trim(left(ls_source,pos(ls_source,'(')))
				ls_right = trim(right(ls_source,len(ls_source) - pos(ls_source,')')+1))
			end if
		end if
		ls_source_value = idw_requestor.describe(as_colname+ '.values')
		li_rtn = f_stringtoarray(ls_source_value,'/',ls_source_values[])
		if pos(ls_mid,';') = 0 then
			if li_rtn <> 0 then
				for li_i = 1 to UpperBound(ls_source_values[])
					if pos(lower(ls_source_values[li_i]),lower(trim(ls_mid))) > 0 then
						li_rtn = pos(ls_source_values[li_i],'~t')
						ls_rtn = mid(ls_source_values[li_i],li_rtn+1,len(ls_source_values[li_i]) - li_rtn)
						exit
					end if
				next
			end if
		else
			li_rtn = f_stringtoarray(ls_mid,';',ls_mids[])
			for li_i = 1 to UpperBound(ls_mids[])
				for li_j = 1 to UpperBound(ls_source_values[])
					if pos(lower(ls_source_values[li_j]),lower(trim(ls_mids[li_i]))) > 0 then
						li_rtn = pos(ls_source_values[li_j],'~t')
						ls_rtn = ls_rtn + mid(ls_source_values[li_j],li_rtn+1,len(ls_source_values[li_j]) - li_rtn)
						if li_i <> UpperBound(ls_mids[]) then
							ls_rtn += ';'
						end if
						exit
					end if
				next
			next
		end if
		ls_rtn = ls_left + ls_rtn + ls_right
	end if
elseif as_obj_type = 'checkbox' then
elseif as_obj_type = 'dddw' then
else //kiểm tra dấu ' 
	ls_source = as_source
	li_count_char = len(ls_source)
	if pos(ls_source,"'") > 0 then
		ls_rtn = ''
		for li_i=1 to li_count_char
			ls_char = mid(ls_source,li_i,1)
			if ls_char = "'" then
				ls_rtn = ls_rtn + '~~'+ls_char + "~~'"
			else
				ls_rtn = ls_rtn + ls_char
			end if
		next
	end if
end if */
return ''
end function

public function string f_check_date_spec (string as_data);/*
đã tách hàm viết trên c_string
string 	ls_rtn,ls_data,ls_sources[],ls_first,ls_last
int			li_rtn
c_datetime lc_datetime
ls_data = as_data
setnull(ls_rtn)
if pos(ls_data,'*')>0 then
	li_rtn = f_stringtoarray(ls_data,'/',ls_sources[])
	if li_rtn = 3 then
		if ls_sources[1] = '*' and ls_sources[2] = '*' and ls_sources[3] <> '*' then // 
			ls_rtn = '('
			ls_first = string(lc_datetime.f_firstdayofmonth( date('01/01/'+ls_sources[3])))
			ls_last = string(lc_datetime.f_lastdayofmonth( date('01/12/'+ls_sources[3])))
			ls_rtn += ls_first + ':' + ls_last + ')'
		elseif ls_sources[1] = '*' and ls_sources[2] <> '*' and ls_sources[3] <> '*' then // 
			ls_rtn = '('
			ls_sources[1] = '01'
			f_arraytostring(ls_sources[],'/',ls_first)
			ls_last = string(lc_datetime.f_lastdayofmonth( date(ls_first)) )
			ls_rtn += ls_first + ':' + ls_last + ')'
		else
			is_values = ls_sources
			ib_date_spec = true
			ls_rtn = string(today())
		end if
	else
		ls_data = trim(mid(ls_data,pos(ls_data,'(')+1,pos(ls_data,')')-pos(ls_data,'(')-1))
		ls_data = f_globalreplace(ls_data,';','/')
		f_stringtoarray(ls_data,'/',ls_sources[])
		is_values = ls_sources
		ib_date_spec = true
	end if
end if
if isnull(ls_rtn) then
	ls_rtn = as_data
end if */
return ''
end function

public function string f_get_whereclause_detail (t_dw_mpl vdw_detailn[], t_dw_mpl vdw_master_of_detailn);//variable for dw detail 
t_s_sql_attr		lstr_sql_detail[],lstr_sql_empty[]
c_dwservice	c_service
t_dw_mpl		ldw_detailsn[],ldw_sharedn[]
c_sql				lnv_sql
Integer			li_sql_detail_count
String			ls_sql_detail,ls_coltype,ls_sql_detailn
String			ls_columns[],ls_tables[],ls_empty[]
String			ls_detail_where, ls_dbname,ls_master_query_where
Integer			li_i,li_j,li_max
Integer			li_count_detailn,li_count_sharedn
String			ls_shared_wheren,ls_detail_wheren,ls_where

for li_i = 1 to upperbound(vdw_detailn[])
	if isvalid(vdw_detailn[li_i].inv_querymode) then
		vdw_detailn[li_i].inv_querymode.f_SetUseQuerySQLOnDisabled(false)
		vdw_detailn[li_i].inv_querymode.f_SetRetrieveOnDisabled(false)
		// Disable querymode
		vdw_detailn[li_i].inv_querymode.f_SetEnabled(false)
		// Get where clause detail
		ls_detail_wheren = vdw_detailn[li_i].inv_querymode.f_GetQueryWhereClause()
		//check detail of detail
		li_count_detailn = vdw_detailn[li_i].f_getdwdetails( ldw_detailsn)
		li_count_sharedn = vdw_detailn[li_i].f_getdwshared(ldw_sharedn)
		if li_count_detailn > 0 then 
		//	if not isnull(ls_detail_wheren) and len(ls_detail_wheren)> 0 then ls_detail_wheren += " AND "
			ls_where = this.f_get_whereclause_detail( ldw_detailsn,  vdw_detailn[li_i])
			if not isnull(ls_where) and len(ls_where)> 0 then
				if not isnull(ls_detail_wheren) and len(ls_detail_wheren)> 0 then
					ls_detail_wheren += " AND (" + ls_where +')'
				else
					ls_detail_wheren = ls_where
				end if
			end if
		end if
		
		if not isnull(ls_detail_wheren) and len(ls_detail_wheren)> 0 then
			// Get the original SQL select of the detail DW
			ls_sql_detail = vdw_detailn[li_i].inv_querymode.f_GetOriginalSQL()
			if isnull(ls_sql_detail) or ls_sql_detail = '' then continue
			
			// Reset SQL statement information
			lstr_sql_detail = lstr_sql_empty
			// Break the SQL in parts
			li_sql_detail_count = lnv_sql.f_parse(ls_sql_detail, lstr_sql_detail)
			
			// Ignore criterias entered in detail DW that have a SQL containing
			// several select separated by UNION(s) ...
			If li_sql_detail_count > 1 Then Continue
			
			// Remove arguments from the existing where clause
			If f_RemoveArgsFromWhereClause(lstr_sql_detail[1].s_where) < 0 Then
				Continue
			end if
			
			// Remove ORDER BY clause
			lstr_sql_detail[1].s_order = ""
			
			// Add the query where clause to the existing where clause
			If not IsNull(lstr_sql_detail[1].s_where) and Len(lstr_sql_detail[1].s_where) > 0 Then
				lstr_sql_detail[1].s_where += " AND "
			end if
			lstr_sql_detail[1].s_where += ls_detail_wheren
			
			// Copy detail columns & tables locally for faster access
			ls_columns = ls_empty
			vdw_detailn[li_i].f_get_detail_keycol(ls_columns)
			
			// Replace the selected columns of the detail by the linkage columns
			li_max = UpperBound(ls_columns)
			lstr_sql_detail[1].s_columns = ""		
			for li_j = 1 to li_max
				If li_j > 1 Then lstr_sql_detail[1].s_columns += ","
				ls_dbname = ls_columns[li_j] 
				c_service.f_get_build_column( vdw_detailn[li_i], ls_dbname, ls_coltype)
				ls_tables = ls_empty
				This.f_StringToArray(ls_dbname,'.',ls_tables)
				If UpperBound(ls_tables) = 2 Then
					lstr_sql_detail[1].s_columns += "~"" + Upper(ls_tables[1]) + "~".~"" +  Upper(ls_tables[2]) + "~""
				else
					lstr_sql_detail[1].s_columns += "~"" + Upper(ls_tables[1]) + "~""
				end if
			next
			
			// Rebuild the detail SQL
			ls_sql_detail = lnv_sql.f_Assemble(lstr_sql_detail)
//			if not isnull(ls_sql_detailn) or len(ls_sql_detailn)>0 then ls_sql_detail += ' IN ('+
			
			// Prepare the main Query where clause
//			if ls_master_query_where = '' then ls_master_query_where = vdw_master_of_detailn.inv_querymode.f_GetQueryWhereClause()
			if ls_detail_where = '' then ls_detail_where = vdw_master_of_detailn.inv_querymode.f_GetQueryWhereClause()
			If ls_detail_where <> "" Then ls_detail_where += " AND "
			ls_detail_where += "("
			
			// Copy master columns & tables locally for faster access
			ls_columns = ls_empty
			vdw_detailn[li_i].f_get_master_keycol(ls_columns)
			li_max = UpperBound(ls_columns)
			for li_j =1 to li_max
				If li_j > 1 Then ls_detail_where += ","
				// Add linkage column
				ls_dbname = ls_columns[li_j]
				c_service.f_get_build_column( vdw_master_of_detailn, ls_dbname, ls_coltype)
				ls_tables = ls_empty
				This.f_StringToArray(ls_dbname,'.',ls_tables)
				If UpperBound(ls_tables) = 2 Then
					ls_detail_where += "~"" + Upper(ls_tables[1]) + "~".~"" +  Upper(ls_tables[2]) + "~""
				else
					ls_detail_where += "~"" + Upper(ls_tables[1]) + "~""
				end if
			next
			
			// Finish add of the detail SQL
			ls_detail_where += ") IN (" + ls_sql_detail + ")"
		end if
		// dw share of detail
		for li_j = 1 to li_count_sharedn
			If IsNull(ldw_sharedn[li_j]) or not IsValid(ldw_sharedn[li_j]) Then Continue
			If IsValid(ldw_sharedn[li_i].inv_querymode) Then
				ldw_sharedn[li_j].inv_querymode.f_SetUseQuerySQLOnDisabled(false)
				ldw_sharedn[li_j].inv_querymode.f_SetRetrieveOnDisabled(false)
				// Disable querymode		
				ldw_sharedn[li_j].inv_querymode.f_SetEnabled(false)
				
				// Get the query where clause of the shared DW
				ls_shared_wheren = ldw_sharedn[li_j].inv_querymode.f_GetQueryWhereClause()
				// Add the shared where clause to the main Query where clause
				If not IsNull(ls_shared_wheren) and Len(ls_shared_wheren) > 0 Then
					ls_detail_where += " AND "
				end if
				ls_detail_where += ls_shared_wheren
			end if
		next
	end if
next

//If IsNull(ldw_details2[li_i2]) or not IsValid(ldw_details2[li_i2]) Then Continue
//					If IsValid(ldw_details2[li_i2].inv_querymode) Then
//						ldw_details2[li_i2].inv_querymode.f_SetUseQuerySQLOnDisabled(false)
//						ldw_details2[li_i2].inv_querymode.f_SetRetrieveOnDisabled(false)
//						// Disable querymode
//						ldw_details2[li_i2].inv_querymode.f_SetEnabled(false)

//ls_detail_where2 = ldw_details2[li_i2].inv_querymode.f_GetQueryWhereClause()
//						If not IsNull(ls_detail_where2) and Len(ls_detail_where2) > 0 Then
//							// Get the original SQL select of the detail DW
//							ls_sql_detail2 = ldw_details2[li_i2].inv_querymode.f_GetOriginalSQL()
//							If IsNull(ls_sql_detail2) or Len(ls_sql_detail2) = 0 Then Continue
//							
//							// Reset SQL statement information
//							lstr_sql_detail2 = lstr_sql_empty
//							// Break the SQL in parts
//							li_sql_detail_count2 = lnv_sql.f_parse(ls_sql_detail2, lstr_sql_detail2)
//							
//							// Ignore criterias entered in detail DW that have a SQL containing
//							// several select separated by UNION(s) ...
//							If li_sql_detail_count2 > 1 Then Continue
//							-----------------------------------------------------
//							// Remove arguments from the existing where clause
//							If f_RemoveArgsFromWhereClause(lstr_sql_detail2[1].s_where) < 0 Then
//								Continue
//							End If
//							
//							// Remove ORDER BY clause
//							lstr_sql_detail2[1].s_order = ""
//							------------------------------------------------------------------
//							// Add the query where clause to the existing where clause
//							If not IsNull(lstr_sql_detail2[1].s_where) and Len(lstr_sql_detail2[1].s_where) > 0 Then
//								lstr_sql_detail2[1].s_where += " AND "
//							End If
//							lstr_sql_detail2[1].s_where += ls_detail_where2
//							-------------------------------------------------------
//							// Copy detail columns & tables locally for faster access
//							ls_columns2 = ls_empty
//							ldw_details2[li_i2].f_get_detail_keycol(ls_columns2)
//							------------------------------------------------------------------
//							// Replace the selected columns of the detail by the linkage columns
//							li_max2 = UpperBound(ls_columns2)
//							lstr_sql_detail2[1].s_columns = ""				
//							For li_j2 = 1 To li_max2
//								If li_j2 > 1 Then lstr_sql_detail2[1].s_columns += ","
////								ls_dbname2 = ldw_details2[li_i2].describe(ls_columns2[li_j2] + ".DBName")
//								ls_dbname2 = ls_columns2[li_j2] 
//								c_service.f_get_build_column( ldw_details2[li_i2], ls_dbname2, ls_coltype)
//								ls_tables2 = ls_empty
//								This.f_StringToArray(ls_dbname2,'.',ls_tables2)
//								If UpperBound(ls_tables2) = 2 Then
//									lstr_sql_detail2[1].s_columns += "~"" + Upper(ls_tables2[1]) + "~".~"" +  Upper(ls_tables2[2]) + "~""
//								Else
//									lstr_sql_detail2[1].s_columns += "~"" + Upper(ls_tables2[1]) + "~""
//								End If
//							Next
//							-----------------------------------------------------
//							// Rebuild the detail SQL
//							ls_sql_detail2 = lnv_sql.f_Assemble(lstr_sql_detail2)
//							-----------------------------------------------------------
//							// Prepare the main Query where clause
//							If ls_detail_where <> "" Then ls_detail_where += " AND "
//							ls_detail_where += "("
//							-----------------------------------------------------------------
//							// Copy master columns & tables locally for faster access
//							ls_columns2 = ls_empty
//							ldw_details2[li_i2].f_get_master_keycol(ls_columns2)
//							li_max2 = UpperBound(ls_columns2)
//							For li_j2 = 1 To li_max2
//								If li_j2 > 1 Then ls_detail_where += ","
//								// Add linkage column
////								ls_dbname2 = ldw_details[li_i].describe(ls_columns2[li_j2] + ".DBName")
//								ls_dbname2 = ls_columns2[li_j2]
//								c_service.f_get_build_column( ldw_details[li_i], ls_dbname2, ls_coltype)
//								ls_tables2 = ls_empty
//								This.f_StringToArray(ls_dbname2,'.',ls_tables2)
//								If UpperBound(ls_tables2) = 2 Then
//									ls_detail_where += "~"" + Upper(ls_tables2[1]) + "~".~"" +  Upper(ls_tables2[2]) + "~""
//								Else
//									ls_detail_where += "~"" + Upper(ls_tables2[1]) + "~""
//								End If
//							Next
//							
//							// Finish add of the detail SQL
//							ls_detail_where += ") IN (" + ls_sql_detail2 + ")"
//						End If

//For li_i2 = 1 To li_count_shared2
//					If IsNull(ldw_shared2[li_i2]) or not IsValid(ldw_shared2[li_i2]) Then Continue
//					If IsValid(ldw_shared2[li_i2].inv_querymode) Then
//						ldw_shared2[li_i2].inv_querymode.f_SetUseQuerySQLOnDisabled(false)
//						ldw_shared2[li_i2].inv_querymode.f_SetRetrieveOnDisabled(false)
//						// Disable querymode		
//						ldw_shared2[li_i2].inv_querymode.f_SetEnabled(false)
//						
//						// Get the query where clause of the shared DW
//						ls_shared_where2 = ldw_shared2[li_i2].inv_querymode.f_GetQueryWhereClause()
//						// Add the shared where clause to the main Query where clause
//						If not IsNull(ls_shared_where2) and Len(ls_shared_where2) > 0 Then
//							If not IsNull(ls_detail_where) and Len(ls_detail_where) > 0 Then
//								ls_detail_where += " AND "
//							End If
//							ls_detail_where += ls_shared_where2
//						End If
//					End If
//				Next
return ls_detail_where
end function

protected function integer f_buildquerywhereclause_original (ref string as_where);String	ls_where,ls_criteria
String	ls_colname,ls_value
String	ls_coltype,ls_dbname
String	ls_values[],ls_empty[]
Integer	li_i,li_count,li_pos,li_i1,li_j1
Integer	li_j,li_nb_values
Boolean	lb_not
String	ls_obj_type


// Check requestor DW reference
If not IsValid(idw_requestor) or IsNull(idw_requestor) Then Return -1

// Get number of criterias
li_count = UpperBound(istr_criterias)

// Build the WHERE clause with the criterias
For li_i=1 To li_count
	// Get the current criteria's value
	ls_value = istr_criterias[li_i].is_value
	
	// Ignore NULL values
	If IsNull(ls_value) or Len(ls_value) = 0 Then continue
	
	// Reset some variables
	lb_not = false
	ls_criteria = ""
	ls_values = ls_empty
	
	// Link the criterias with the AND operator
	If ls_where <> "" Then ls_where += " AND "
	
	// Get column's name
	ls_colname = istr_criterias[li_i].is_colname
	
	// Get column's DB name & type
	ls_dbname =  idw_requestor.describe(ls_colname + ".dbAlias")
	if pos(ls_dbname,'.') = 1 then
		ls_dbname = idw_requestor.describe(ls_colname + ".DBName")
	elseif ls_dbname = '!' then
		ls_dbname = ls_colname
	elseif ls_dbname = '?' then
		messagebox('Thông báo','querymode:buildwhere: Không lấy được db_alias')
		return -1
	end if
	ls_coltype = idw_requestor.describe(ls_colname + ".ColType")
	ls_obj_type = idw_requestor.describe(ls_colname + ".Edit.Style")
	
	
	// Add criteria to the WHERE clause depending on the column's datatype
	Choose Case Lower(Left(ls_coltype,5))
			
		Case "char("		
			
			// Build the beginning of the criteria (add upper only if necessary)
//			If idw_requestor.of_IsKeyColumn(ls_colname) Then
//				ls_criteria = "( " + ls_dbname + " "
//			Else
				ls_criteria = "( UPPER(" + ls_dbname + ") "
//			End If
			
			If Match(ls_value,"^> *[^=].*$") Then				// Check for the > wildcard
				ls_criteria += "> ~~'" + Upper(Trim(Mid(ls_value,2))) + "~~'"
			ElseIf Match(ls_value,"^>= *.+$") Then				// Check for the >= wildcard
				ls_criteria += ">= ~~'" + Upper(Trim(Mid(ls_value,3))) + "~~'"
			ElseIf Match(ls_value,"^< *[^=>].*$") Then		// Check for the < wildcard
				ls_criteria += "< ~~'" + Upper(Trim(Mid(ls_value,2))) + "~~'"
			ElseIf Match(ls_value,"^<= *.+$") Then				// Check for the <= wildcard
				ls_criteria += "<= ~~'" + Upper(Trim(Mid(ls_value,3))) + "~~'"
			ElseIf Match(ls_value,"^<> *( *)$") Then			// Check for the <>() wildcard (not null value)
				ls_criteria = "( " + ls_dbname + " IS NOT NULL"
			ElseIf Match(ls_value,"^( *)$") Then				// Check for the () wildcard (null value)
				ls_criteria = "( " + ls_dbname + " IS NULL"
			ElseIf Match(ls_value,"^<> *[^(*]+$") Then		// Check for the <> wildcard (with simple value)
				ls_criteria += "<> ~~'" + Upper(Trim(Mid(ls_value,3))) + "~~'"
			Else	// The criteria contains a list of values or is a simple value (maybe with *)
				If Match(ls_value,"^<> *.+$") Then				// Check for the <> wildcard
					lb_not = true
					// Remove the <>
					ls_value = Trim(Mid(ls_value,3))
				End If
				
				// Add 'not' keyword if necessary
				If lb_not Then ls_criteria += "NOT "
				if pos(ls_value,',')>0 then ls_value = f_globalreplace(ls_value,',',';') //tránh lỗi treo ct , chuyển dấu , thành ;
				If Match(ls_value,"^(.*[;:]+.+)$") Then		// Check for a list of values between brackets
					// Remove brackets
					ls_value = Trim(Mid(ls_value,2,Len(ls_value)-2))
					
					li_pos = Pos(ls_value,":")
					If li_pos > 0 Then								// This is a 'between' wildcard -> (ABC:ZZZ)
						// We must have 2 values
						ls_values[1] = Trim(Left(ls_value,li_pos -1))
						ls_values[2] = Trim(Mid(ls_value,li_pos +1))
						
						ls_criteria += "BETWEEN ~~'" + Upper(ls_values[1]) + "~~'" &
											+ " AND ~~'" + Upper(ls_values[2]) + "~~'"
					Else													// This is a 'in' wildcard -> (ABC;DEF;GHI;ZZZ)
						// Build criteria
						ls_criteria += "IN ( "
						
						// Get the list of values
						li_nb_values = f_StringToArray(ls_value,";",ls_values)
						
						// Check all the values
						For li_j=1 To li_nb_values
							// Add value to criteria
							ls_criteria += "~~'" + Upper(Trim(ls_values[li_j])) + "~~'"
							If li_j <> li_nb_values Then ls_criteria += " , "
						Next
						
						// Ending bracket for the IN
						ls_criteria += " )"
					End If
				Else														// Simple value (maybe containing *)
					li_pos = Pos(ls_value,"*")
					If li_pos > 0 Then								// This is a 'like'
						// Replace * by %
						ls_value = f_GlobalReplace(ls_value,"*","%")
						// Add value to criteria
						ls_criteria += "LIKE ~~'" + Upper(ls_value) + "~~'"
					Else													// Simple equality (=)
						// Add value to criteria
						ls_criteria += "= ~~'" + Upper(ls_value) + "~~'"
					End If
				End If
			End If
			
		Case "date","datet"
			string ls_data,ls_format,ls_datas[],ls_formats[],ls_data2,ls_rtn
			ls_format = ''
			ls_data = ''
			li_j1 = 0
			if ib_date_spec then
				// tìm theo ngày tháng nhập đặc biệt
				if upperbound(is_values[]) < 4 then
					for li_i1 =upperbound(is_values[]) to 1 step -1
						if is_values[li_i1] <> '*' then
							li_j1 += 1
							if li_i1 =1 then
								ls_formats[li_j1] = 'dd'
							elseif li_i1 = 2 then
								ls_formats[li_j1] = 'mm'
							elseif li_i1 = 3 then
								ls_formats[li_j1] = 'yyyy'
							end if
							if long(is_values[li_i1]) >= 10 then
								ls_datas[li_j1] = is_values[li_i1]
							else
								if left(is_values[li_i1],1) <> '0' then
									ls_datas[li_j1] = '0' + is_values[li_i1]
								else
									ls_datas[li_j1] = is_values[li_i1]
								end if
							end if
						end if
					next
					if upperbound(ls_datas[]) > 1 then
						f_arraytostring(ls_formats[],'/',ls_format)
						f_arraytostring(ls_datas[],'/',ls_data)
					else
						ls_format = ls_formats[1]
						ls_data = ls_datas[1]
					end if
					ls_criteria = "( TO_CHAR(" + ls_dbname + "," +"~~'"+ ls_format+"~~'" + ") " + "= " + "~~'" + ls_data + "~~'"
				else
					for li_i1 =1 to upperbound(is_values[])
						if is_values[li_i1] <> '*' then
							if long(is_values[li_i1]) < 10 then
								if left(is_values[li_i1],1) <> '0' then
									is_values[li_i1] = '0' + is_values[li_i1]
								end if
							end if
						end if
					next
					f_arraytostring(is_values[],'/',ls_data2)
					ls_data2 = f_globalreplace(ls_data2,'/*/',',')
					ls_data2 = trim(f_globalreplace(ls_data2,'/*',' '))
					if pos(ls_data2,'*')=0 then
						for li_i1 = 1 to len(ls_data2)
							if li_i1 = 1 then
								ls_rtn = "~~'" + mid(ls_data2,li_i1,1)
							elseif li_i1 = len(ls_data2) then
								ls_rtn +=mid(ls_data2,li_i1,1) + "~~'"
							else
								if mid(ls_data2,li_i1 + 1,1) = ',' then
									ls_rtn += mid(ls_data2,li_i1,1) + "~~'"
								elseif mid(ls_data2,li_i1 - 1,1) = ',' then
									ls_rtn += "~~'" + mid(ls_data2,li_i1,1)
								else
									ls_rtn += mid(ls_data2,li_i1,1)
								end if
							end if
						next
					end if
					ls_format = 'dd/mm'
					if ls_rtn <> '' then
						ls_data = ls_rtn
						if match(ls_value,'^<> *') then
							ls_criteria = "( TO_CHAR(" + ls_dbname + "," +"~~'"+ ls_format+"~~'" + ") " + "NOT IN " + "(" + ls_data + ")"
						else
							ls_criteria = "( TO_CHAR(" + ls_dbname + "," +"~~'"+ ls_format+"~~'" + ") " + "IN " + "(" + ls_data + ")"
						end if
					else
						ls_data = "~~'" + "00/00" + "~~'"
						ls_criteria = "( TO_CHAR(" + ls_dbname + "," +"~~'"+ ls_format+"~~'" + ") " + "IN " + "(" + ls_data + ")"
					end if			
				end if				
				ib_date_spec = false
			else
				// Build the beginning of the criteria
				ls_criteria = "( TRUNC(" + ls_dbname + ") "
				
				If Match(ls_value,"^> *[^=].*$") Then				// Check for the > wildcard			
					ls_criteria += "> TO_DATE(~~'" + Trim(Mid(ls_value,2)) + "~~',~~'YYYY-MM-DD~~')"
				ElseIf Match(ls_value,"^>= *.+$") Then				// Check for the >= wildcard
					ls_criteria += ">= TO_DATE(~~'" + Trim(Mid(ls_value,3)) + "~~',~~'YYYY-MM-DD~~')"
				ElseIf Match(ls_value,"^< *[^=>].*$") Then			// Check for the < wildcard
					ls_criteria += "< TO_DATE(~~'" + Trim(Mid(ls_value,2)) + "~~',~~'YYYY-MM-DD~~')"
				ElseIf Match(ls_value,"^<= *.+$") Then				// Check for the <= wildcard
					ls_criteria += "<= TO_DATE(~~'" + Trim(Mid(ls_value,3)) + "~~',~~'YYYY-MM-DD~~')"
				ElseIf Match(ls_value,"^<> *( *)$") &
					 Or Match(ls_value,"^\*$") Then					// Check for the <>() wildcard (not null value) 
																				// Also accept a single '*' character
					ls_criteria = "( " + ls_dbname + " IS NOT NULL"
				ElseIf Match(ls_value,"^( *)$") Then				// Check for the () wildcard (null value)
					ls_criteria = "( " + ls_dbname + " IS NULL"
				ElseIf Match(ls_value,"^<> *[^(*]+$") Then		// Check for the <> wildcard (with simple value)
					ls_criteria += "<> TO_DATE(~~'" + Trim(Mid(ls_value,3)) + "~~',~~'YYYY-MM-DD~~')"
				Else	// The criteria contains a list of values or is a simple value
					If Match(ls_value,"^<> *.+$") Then				// Check for the <> wildcard
						lb_not = true
						// Remove the <>
						ls_value = Trim(Mid(ls_value,3))
					End If
					
					// Add 'not' keyword if necessary
					If lb_not Then ls_criteria += "NOT "
					if pos(ls_value,',')>0 then ls_value = f_globalreplace(ls_value,',',';') //tránh lỗi treo ct , chuyển dấu , thành ;
					If Match(ls_value,"^(.*[;:]+.+)$") Then		// Check for a list of values between brackets
						// Remove brackets
						ls_value = Trim(Mid(ls_value,2,Len(ls_value)-2))
						
						li_pos = Pos(ls_value,":")
						If li_pos > 0 Then								// This is a 'between' wildcard -> (ABC:ZZZ)
							// We must have 2 values
							ls_values[1] = Trim(Left(ls_value,li_pos -1))
							ls_values[2] = Trim(Mid(ls_value,li_pos +1))
							
							ls_criteria += "BETWEEN TO_DATE(~~'" + ls_values[1] + "~~',~~'YYYY-MM-DD~~')" &
												+ " AND TO_DATE(~~'" + ls_values[2] + "~~',~~'YYYY-MM-DD~~')"
						Else													// This is a 'in' wildcard -> (ABC;DEF;GHI;ZZZ)
							// Build criteria
							ls_criteria += "IN ( "
							
							// Get the list of values
							li_nb_values = f_StringToArray(ls_value,";",ls_values)
							
							// Check all the values
							For li_j=1 To li_nb_values
								// Add value to criteria
								ls_criteria += "TO_DATE(~~'" + Upper(Trim(ls_values[li_j])) + "~~',~~'YYYY-MM-DD~~')"
								If li_j <> li_nb_values Then ls_criteria += " , "
							Next
							
							// Ending bracket for the IN
							ls_criteria += " )"
						End If
					Else														// Simple equality (=)
						// Add value to criteria
						ls_criteria += "= TO_DATE(~~'" + ls_value + "~~',~~'YYYY-MM-DD~~')"
					End If
				End If
			end if
			
		Case "decim","numbe"
			
			// Build the beginning of the criteria
			ls_criteria = "( " + ls_dbname + " "
			
			// Replace ',' by '.'
			ls_value = f_GlobalReplace(ls_value,",",".")
			
			If Match(ls_value,"^> *[^=].*$") Then				// Check for the > wildcard			
				ls_criteria += "> " + Trim(Mid(ls_value,2))
			ElseIf Match(ls_value,"^>= *.+$") Then				// Check for the >= wildcard
				ls_criteria += ">= " + Trim(Mid(ls_value,3))
			ElseIf Match(ls_value,"^< *[^=>].*$") Then		// Check for the < wildcard
				ls_criteria += "< " + Trim(Mid(ls_value,2))
			ElseIf Match(ls_value,"^<= *.+$") Then				// Check for the <= wildcard
				ls_criteria += "<= " + Trim(Mid(ls_value,3))
			ElseIf Match(ls_value,"^<> *( *)$") &
				 Or Match(ls_value,"^\*$") Then					// Check for the <>() wildcard (not null value)
				 															// Also accept a single '*' character
				ls_criteria = "( " + ls_dbname + " IS NOT NULL"
			ElseIf Match(ls_value,"^( *)$") Then				// Check for the () wildcard (null value)
				ls_criteria = "( " + ls_dbname + " IS NULL"
			ElseIf Match(ls_value,"^<> *[^(*]+$") Then		// Check for the <> wildcard (with simple value)
				ls_criteria += "<> " + Trim(Mid(ls_value,3))
			Else	// The criteria contains a list of values or is a simple value (maybe with *)
				If Match(ls_value,"^<> *.+$") Then				// Check for the <> wildcard
					lb_not = true
					// Remove the <>
					ls_value = Trim(Mid(ls_value,3))
				End If
				
				// Add 'not' keyword if necessary
				If lb_not Then ls_criteria += "NOT "
				if pos(ls_value,',')>0 then ls_value = f_globalreplace(ls_value,',',';') //tránh lỗi treo ct , chuyển dấu , thành ;
				If Match(ls_value,"^(.*[;:]+.+)$") Then		// Check for a list of values between brackets
					// Remove brackets
					ls_value = Trim(Mid(ls_value,2,Len(ls_value)-2))
					
					li_pos = Pos(ls_value,":")
					If li_pos > 0 Then								// This is a 'between' wildcard -> (ABC:ZZZ)
						// We must have 2 values
						ls_values[1] = Trim(Left(ls_value,li_pos -1))
						ls_values[2] = Trim(Mid(ls_value,li_pos +1))
						
						ls_criteria += "BETWEEN " + ls_values[1] + " AND " + ls_values[2]
					Else													// This is a 'in' wildcard -> (ABC;DEF;GHI;ZZZ)
						// Build criteria
						ls_criteria += "IN ( "
						
						// Get the list of values
						li_nb_values = f_StringToArray(ls_value,";",ls_values)
						
						// Check all the values
						For li_j=1 To li_nb_values
							// Add value to criteria
							ls_criteria += Trim(ls_values[li_j])
							If li_j <> li_nb_values Then ls_criteria += " , "
						Next
						
						// Ending bracket for the IN
						ls_criteria += " )"
					End If
				Else														// Simple equality (=)
					//15878: Allow find by checkbox with value null
					If ls_obj_type = 'checkbox' And ls_value = '0' Then
						ls_criteria += '= 0 OR ' + ls_dbname + ' IS NULL'
					Else
						// Add value to criteria
						ls_criteria += "= " + ls_value
					End If
				End If
			End If
			
		Case "time"
			
			// Build the beginning of the criteria
			ls_criteria = "( TO_CHAR(" + ls_dbname + ",~~'HH24:MI:SS~~') "
			
			If Match(ls_value,"^> *[^=].*$") Then				// Check for the > wildcard			
				ls_criteria += "> TO_CHAR(TO_DATE(~~'" + Trim(Mid(ls_value,2)) + "~~',~~'HH24:MI:SS~~'),~~'HH24:MI:SS~~')"
			ElseIf Match(ls_value,"^>= *.+$") Then				// Check for the >= wildcard
				ls_criteria += ">= TO_CHAR(TO_DATE(~~'" + Trim(Mid(ls_value,3)) + "~~',~~'HH24:MI:SS~~'),~~'HH24:MI:SS~~')"
			ElseIf Match(ls_value,"^< *[^=>].*$") Then		// Check for the < wildcard
				ls_criteria += "< TO_CHAR(TO_DATE(~~'" + Trim(Mid(ls_value,2)) + "~~',~~'HH24:MI:SS~~'),~~'HH24:MI:SS~~')"
			ElseIf Match(ls_value,"^<= *.+$") Then				// Check for the <= wildcard
				ls_criteria += "<= TO_CHAR(TO_DATE(~~'" + Trim(Mid(ls_value,3)) + "~~',~~'HH24:MI:SS~~'),~~'HH24:MI:SS~~')"
			ElseIf Match(ls_value,"^<> *( *)$") &
				 Or Match(ls_value,"^\*$") Then					// Check for the <>() wildcard (not null value)
				 															// Also accept a single '*' character
				ls_criteria = "( " + ls_dbname + " IS NOT NULL )"
			ElseIf Match(ls_value,"^( *)$") Then				// Check for the () wildcard (null value)
				ls_criteria = "( " + ls_dbname + " IS NULL )"
			ElseIf Match(ls_value,"^<> *[^(*]+$") Then		// Check for the <> wildcard (with simple value)
				ls_criteria += "<> TO_CHAR(TO_DATE(~~'" + Trim(Mid(ls_value,3)) + "~~',~~'HH24:MI:SS~~'),~~'HH24:MI:SS~~')"
			Else	// The criteria contains a list of values or is a simple value (maybe with *)
				If Match(ls_value,"^<> *.+$") Then				// Check for the <> wildcard
					lb_not = true
					// Remove the <>
					ls_value = Trim(Mid(ls_value,3))
				End If
				
				// Add 'not' keyword if necessary
				If lb_not Then ls_criteria += "NOT "
				if pos(ls_value,',')>0 then ls_value = f_globalreplace(ls_value,',',';') //tránh lỗi treo ct , chuyển dấu , thành ;
				If Match(ls_value,"^(.*[;:]+.+)$") Then		// Check for a list of values between brackets
					// Remove brackets
					ls_value = Trim(Mid(ls_value,2,Len(ls_value)-2))
					
					li_pos = Pos(ls_value,":")
					If li_pos > 0 Then								// This is a 'between' wildcard -> (ABC:ZZZ)
						// We must have 2 values
						ls_values[1] = Trim(Left(ls_value,li_pos -1))
						ls_values[2] = Trim(Mid(ls_value,li_pos +1))
						
						ls_criteria += "BETWEEN TO_CHAR(TO_DATE(~~'" + ls_values[1] + "~~',~~'HH24:MI:SS~~'),~~'HH24:MI:SS~~')" &
											+ " AND TO_CHAR(TO_DATE(~~'" + ls_values[2] + "~~',~~'HH24:MI:SS~~'),~~'HH24:MI:SS~~')"
					Else													// This is a 'in' wildcard -> (ABC;DEF;GHI;ZZZ)
						// Build criteria
						ls_criteria += "IN ( "
						
						// Get the list of values
						li_nb_values = f_StringToArray(ls_value,";",ls_values)
						
						// Check all the values
						For li_j=1 To li_nb_values
							// Add value to criteria
							ls_criteria += "TO_CHAR(TO_DATE(~~'" + Upper(Trim(ls_values[li_j])) &
												+ "~~',~~'HH24:MI:SS~~'),~~'HH24:MI:SS~~')"
							If li_j <> li_nb_values Then ls_criteria += " , "
						Next
						
						// End the criteria
						ls_criteria += " )"
					End If
				Else														// Simple equality (=)
					// Add value to criteria
					ls_criteria += "= TO_CHAR(TO_DATE(~~'" + ls_value + "~~',~~'HH24:MI:SS~~'),~~'HH24:MI:SS~~')"
				End If
			End If
			
		Case Else
			// There was a problem getting the column type
			ls_criteria = "ERROR"
			
	End Choose
	
	// Check if the criteria was properly built
	If ls_criteria = "ERROR" Then
		// Return the error message
		as_where = "Error building criteria for column ~'" + ls_colname + "~'."
		Return -1
	End If
	
	// The criteria was build
	// -> Add the last bracket
	ls_criteria += " )"
	
	// Add criteria to WHERE Clause
	ls_where += ls_criteria
Next

// Set the where clause to be returned
as_where = ls_where

Return 1

end function

public subroutine f_setquerywhereclause (string vs_whereclause);is_queryWhereClause=vs_whereclause
end subroutine

public function integer f_setquerycriteria (t_s_querymode_criteria astr_criteria[]);// Overwrite existing value
istr_criterias = astr_criteria

Return 1

end function

public function integer f_removeargsfromwhereclause (ref string as_where);String		ls_or[]
Long		ll_or_num,ll_or_i
String		ls_and[]
Long		ll_and_num,ll_and_i
Integer	li_pos

// Check argument
If IsNull(as_where) or Len(as_where) = 0 or pos(as_where,':') = 0 Then Return 0

// Break where clause on OR separators
ll_or_num = f_StringToArray(as_where," OR ",ls_or)
For ll_or_i = 1 To ll_or_num
	
	// Break where clause on AND separators
	ll_and_num = f_StringToArray(ls_or[ll_or_i]," AND ",ls_and)
	For ll_and_i = 1 To ll_and_num
		li_pos = Pos(ls_and[ll_and_i],":")
		If li_pos > 0 Then ls_and[ll_and_i] = ""
	Next
	
	// Rebuild this part
	f_ArrayToString(ls_and," AND ",ls_or[ll_or_num])
Next

// Rebuild where clause
f_ArrayToString(ls_or," OR ",as_where) 

Return 1

end function

public function integer f_setdwfocus (t_dw adw_focus);If IsNull(adw_focus) or Not IsValid(adw_focus) Then
	Return -1
End If

idw_focus = adw_focus
Return 1
end function

public function integer f_setqmcontrolvalue_dwfocus (string as_colname, string as_data);String	ls_rc,ls_text,ls_bgcolor
Integer	li_pos

If IsNull(as_colname) or Len(as_colname) = 0 Then Return -1

// Get text to display in the QM control
If IsNull(as_data) Then
	ls_text = ""
Else
	ls_text = as_data
End If

// Check requestor DW is valid
If IsNull(idw_focus) or not IsValid(idw_focus) Then Return -1

// Ignore if column's type is not 'Edit'
If idw_focus.describe(as_colname + ".Edit.Style") <> "edit" Then Return 0

// Check if QM control already exists
If idw_focus.Describe(as_colname + "_qm.x") = "!" Then
	// Get background color of the column or background color of the DW,
	// if the column is transparent
	If idw_focus.describe(as_colname + ".Background.Mode") <> "1" Then
		ls_bgcolor = idw_focus.describe(as_colname + ".Background.Color")
	Else
		ls_bgcolor = idw_focus.describe("Datawindow.Color")
	End If
	
	// Create the QM control
	ls_rc = idw_focus.Modify(&
	"create text(band="+ idw_focus.describe(as_colname+".Band") &
		+ " color=~""+ f_GlobalReplace(idw_focus.describe(as_colname+".Color"),"~"","") +"~"" &
		+ " alignment=~""+ idw_focus.describe(as_colname+".Alignment") +"~"" &
		+ " border=~""+ f_GlobalReplace(idw_focus.describe(as_colname+".Border"),"~"","") +"~"" &
		+ " x=~""+ f_GlobalReplace(idw_focus.describe(as_colname+".X"),"~"","") +"~"" &
		+ " y=~""+ f_GlobalReplace(idw_focus.describe(as_colname+".Y"),"~"","") +"~"" &
		+ " height=~""+ f_GlobalReplace(idw_focus.describe(as_colname+".height"),"~"","") +"~"" &
		+ " width=~""+ f_GlobalReplace(idw_focus.describe(as_colname+".width"),"~"","") +"~"" &
		+ " text=~""+ ls_text +"~" name="+ as_colname + "_qm" &
		+ " font.face=~"Tahoma~" font.height=~"-9~" font.weight=~"400~"" &
		+ "font.family=~"2~" font.pitch=~"2~" font.charset=~"0~"" &
		+ "background.mode=~"0~" background.color=~""+ f_GlobalReplace(ls_bgcolor,"~"","") +"~")")
	
Else
	// Update QM control's text
	ls_rc = idw_focus.modify(as_colname + "_qm.text=~'" + ls_text + "~'")

End If

Return 1

end function

public function integer f_destroyqmcontrols_dwfocus ();String	ls_syntax,ls_colname,ls_buffer,ls_rc
Long		ll_pos1,ll_pos2

If IsNull(idw_focus) or not IsValid(idw_focus) Then Return -1

// Get requestor DW's syntax
ls_syntax = idw_focus.describe("Datawindow.Syntax")

// Search for a QM control
ll_pos1 = Pos(ls_syntax,"_qm ")
Do While (ll_pos1 > 0)
	// Get position of the 'name' keyword
	ll_pos2 = LastPos(ls_syntax,"name=",ll_pos1)
	
	// Get column's name
	ls_colname = Mid(ls_syntax,ll_pos2+5,(ll_pos1+3)-(ll_pos2+5))
	
	// Fill buffer
	ls_buffer = "destroy " + ls_colname
	
	// Update requestor DW
	ls_rc = idw_focus.modify(ls_buffer)
	
	// Search for the next QM control
	ll_pos1 = Pos(ls_syntax,"_qm ",ll_pos1+1)
Loop

Return 1

end function

public function string f_get_joinsql (t_dw_mpl vdw_requestor);string				ls_JoinSql,ls_tabble,ls_table_alias,ls_where

c_dwservice		lc_dwser

if lc_dwser.f_parse_fromwhere_clause(vdw_requestor ,ls_tabble, ls_table_alias, ls_JoinSql, ls_where) <> -1 then
	
end if

return ls_JoinSql
end function

public function string f_get_queryjoinclause ();return is_queryJoinClause
end function

public function string f_removejoinfromjoinclause (string vs_joinclause);string				ls_joinclause,las_join[],ls_joinremoved,ls_leftjoin
int					li_idx,li_count
c_string			lc_str

if vs_joinclause <> '' then
	ls_joinclause = UPPER(vs_joinclause)
	ls_joinclause = lc_str.f_globalreplace( ls_joinclause, 'LEFT JOIN', 'LEFT')
	li_count = lc_str.f_stringtoarray( ls_joinclause, 'LEFT', las_join[])
	for li_idx = 1 to li_count
		if ls_joinremoved <> '' then ls_joinremoved += ' LEFT JOIN '
		if pos(las_join[li_idx],'JOIN') > 0 then
			if left(las_join[li_idx],4) = 'JOIN' then
				
			elseif left(las_join[li_idx],4) <> 'JOIN' then
				ls_leftjoin = left(las_join[li_idx], pos(las_join[li_idx],'JOIN') - 1)
				ls_joinremoved += ' ' + ls_leftjoin
			end if
		else
			ls_joinremoved += las_join[li_idx] + ' '
		end if
	next
	if left(trim(ls_joinremoved),4) <> 'LEFT' and ls_joinremoved <> '' then ls_joinremoved = ' LEFT JOIN ' + ls_joinremoved
end if
return ls_joinremoved
end function

on c_dw_querymode.create
call super::create
end on

on c_dw_querymode.destroy
call super::destroy
end on

