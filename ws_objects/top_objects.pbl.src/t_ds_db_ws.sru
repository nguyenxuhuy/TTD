$PBExportHeader$t_ds_db_ws.sru
$PBExportComments$datastore associated with database, inherited from t_ds
forward
global type t_ds_db_ws from t_ds_db
end type
end forward

global type t_ds_db_ws from t_ds_db
event type long e_retrieve_copy ( )
event type integer e_preretrieve_copy ( )
end type
global t_ds_db_ws t_ds_db_ws

type variables

t_ds_db_ws				ids_master, iads_detail[],  iads_shared[], ids_total
s_str_policy_attr		istr_rule_attr, istr_security_attr
s_str_criteria_rec		is_str_criteria_rec[]
string						ias_master_keycol[], ias_detail_keycol[], is_ref_table_field, is_record_where, is_originalSQL_NoWhere, is_join_match
boolean					ib_relation_1_1,ib_ismaster, ib_isdetail, ib_isshared, ib_iscascade_del, ib_dataerror, ib_first_buildwhere
boolean					ib_query, ib_update, ib_delete, ib_insert, ib_keyboardlocked, ib_dropdowning, ib_excel
double					idb_rule_id[]
end variables

forward prototypes
public function integer f_accepttext ()
public function integer f_buildrecwhereclause (t_ds_db vds_criteria, ref string as_where)
protected function integer f_buildwhereclause_4_dwdetail (ref string as_where)
protected function integer f_buildwhereclause_of_masterkey (ref string as_where)
public function boolean f_get_ib_detail ()
protected function integer f_buildwhereclause_of_masterkey (ref t_ds_db_ws rds_master, ref t_ds_db_ws rds_detail, ref string as_where, string vas_master_keycol[], string vas_detail_keycol[])
public function integer f_get_master_keycol (ref string rs_key[])
public function integer f_get_detail_keycol (ref string rs_key[])
public function string f_buildwhereclause_of_company ()
public function string f_buildwhereclause_of_sob ()
public function boolean f_check_foreign_key (string as_table_name, string as_id_colume_name, any aa_id_value)
public function integer f_check_limit (string vs_object_name, string vs_column_name, string vs_data)
public function t_ds_db_ws f_getdsmaster ()
public function string f_get_branch_colname ()
public function string f_get_company_colname ()
public function integer f_get_criteria_record (s_str_criteria_rec rs_str_criteria_rec[])
public function string f_get_datacolumn_name (string as_columnname, string as_receipt_col, string as_return_col)
public function string f_get_detail_filterstring (t_ds_db_ws vds_detail, boolean vb_doc_filter)
public function integer f_get_doc_trace (ref string rs_where, ref string rs_sort)
public function boolean f_get_ib_cascade_del ()
public function boolean f_get_ib_delete ()
public function boolean f_get_ib_delete (s_str_policy_attr vstr_security_attr, s_str_policy_attr vstr_rule_attr)
public function boolean f_get_ib_editing ()
public function boolean f_get_ib_insert (s_str_policy_attr vstr_security_attr, s_str_policy_attr vstr_rule_attr)
public function boolean f_get_ib_insert ()
public function boolean f_get_ib_keyboardlocked ()
public function boolean f_get_ib_master ()
public function boolean f_get_ib_query (s_str_policy_attr vstr_security_attr, s_str_policy_attr vstr_rule_attr)
public function boolean f_get_ib_query ()
public function boolean f_get_ib_ref_table_yn ()
public function boolean f_get_ib_relation_1_1 ()
public function boolean f_get_ib_saving ()
public function boolean f_get_ib_shared ()
public function boolean f_get_ib_traceable ()
public function boolean f_get_ib_update (s_str_policy_attr vstr_security_attr, s_str_policy_attr vstr_rule_attr)
public function boolean f_get_ib_update ()
public function t_ds_db_ws f_get_ids_master ()
public function string f_get_pkcol ()
public function string f_get_ref_table_field ()
public function integer f_get_rule_id_rec (ref double rdb_rule_id[])
public function string f_get_sql_join_master (string vs_dwo_detail)
public function integer f_getdsdetails (ref t_ds_db_ws rds_details[])
public function integer f_getdwshared (ref t_ds_db_ws rds_shared[])
public function boolean f_is_lang ()
public function integer f_rebuild_select_column (string vs_columns)
public function long f_reset_detail ()
public function integer f_send_message_to_object (ref t_ds_db_ws rds_focus, ref t_ds_db_ws vds_source, long vl_currentrow, dwobject dwo, string vs_message)
public function integer f_set_criteria_record (s_str_criteria_rec vs_str_criteria_rec[])
public subroutine f_set_ids_master (t_ds_db_ws vds_master)
public function integer f_set_ib_cascade_del (boolean vb_cascade_del)
public function integer f_set_ib_dataerror (boolean vb_dataerror)
public function integer f_set_ib_delete (boolean vb_delete)
public subroutine f_set_ib_detail (boolean vb_detail)
public subroutine f_set_ib_displaying (boolean vb_displaying)
public subroutine f_set_ib_dropdowning (boolean vb_dropdowning)
public subroutine f_set_ib_edit_changing (boolean vb_edit_changing)
public function integer f_set_ib_editing (boolean vb_editing)
public function integer f_set_ib_excel (boolean vb_excel)
public function integer f_set_ib_insert (boolean vb_insert)
public function integer f_set_ib_inserting (boolean vb_inserting)
public function integer f_set_ib_master (boolean vb_master)
public function integer f_set_ib_query (boolean vb_query)
public function integer f_set_ib_ref_table_yn (boolean vb_ref_table_yn)
public subroutine f_set_ib_relation_1_1 (boolean vb_relation_1_1)
public function integer f_set_ib_saving (boolean vb_saving)
public subroutine f_set_ib_shared (boolean vb_shared)
public function integer f_set_ib_update (boolean vb_update)
public subroutine f_set_ib_valuesetting (boolean vb_valuesetting)
public subroutine f_set_master_keycol (string vas_keycol[])
public function integer f_set_rec_security ()
public function integer f_set_rule_id_rec (double vdb_rule_id[])
public function long f_get_policy_attr (datastore vds_policy, long vl_row, ref s_str_policy_attr rstr_policy_attr)
public function long f_get_policy_attr_union (s_str_policy_attr vstr_policy_attr, ref s_str_policy_attr rstr_policy_attr)
public function s_str_policy_attr f_get_rule_attr ()
public function s_str_policy_attr f_get_security_attr ()
public function integer f_set_rule_attr (datastore vds_policy, long vl_row)
public subroutine f_set_rule_attr (s_str_policy_attr vstr_rule_attr)
public function integer f_set_security_attr (datastore vds_policy, long vl_row)
public subroutine f_set_security_attr (s_str_policy_attr vstr_policy_attr)
public subroutine f_set_detail_keycol (string vas_keycol[])
public function integer f_set_dsmaster (ref t_ds_db_ws rads_detail[])
public function integer f_set_dsshare (ref t_ds_db_ws rds_share[])
public function integer f_send_message_to_object (ref powerobject rpm_handling, string vs_message)
public function integer f_retrieve_detail_copy ()
public function string f_buildwhereclause_copy ()
end prototypes

event type long e_retrieve_copy();int 						li_preretrieve
any 							la_retrieve_arg[10]
long 							ll_rtn

setpointer(HourGlass!)

li_preretrieve = this.event e_preretrieve_copy( )

if li_preretrieve <> -1 then
	//-- lấy tham so retrieve --//
	la_retrieve_arg[ ] = ia_retrieve_arg[]				
else //-- preretieve loi --//
	return -1
end if

ll_rtn = this.retrieve(la_retrieve_arg[1], la_retrieve_arg[2], la_retrieve_arg[3], la_retrieve_arg[4],la_retrieve_arg[5], &
							la_retrieve_arg[6], la_retrieve_arg[7], la_retrieve_arg[8], la_retrieve_arg[9], la_retrieve_arg[10])		

setpointer(arrow!)
return ll_rtn
end event

event type integer e_preretrieve_copy();/*==============================
Chức năng:
	- Set security cho dw trước khi retrieve
	- Set properties cho dw trước khi retrieve
	- Gán tham số retrieve: ia_retrieve_arg[]
    - Thông báo cho ic_obj_handling
----------------------------------------------------------
return (integer): 0 Không gán gì cả
					: 1 Gán thành công
					: -1 lỗi
					: -9 dw external không tiên hành retrieve
===============================*/
int								li_rtn
string							ls_currentSQL,ls_currentWhere, ls_originalWhere, ls_rtn, ls_modify, ls_Where, ls_joinSQL
string							ls_where_ver, ls_sort_ver
boolean						lb_querymode
any							la_empty[]

s_object_display			lpo_handling
t_ds_db_ws					lds_focus
c_sql							lc_sql
c_dwservice					lc_dwservice



lds_focus = this
if this.ib_edit_changing then return 0

if this.f_getcurrentSQL( ls_currentSQL, ls_currentWhere) =1 then
	if isnull(is_originalwhereClause)  then
		ib_first_buildwhere = true
		is_originalwhereClause = ls_currentWhere
		is_originalSQL_NoWhere = ls_currentSQL
	else
		ib_first_buildwhere = false
	end if
	
	ls_originalWhere = is_originalwhereClause	
	ls_Where = this.f_buildwhereclause_copy( )
	if isnull(ls_Where) then 
		return -1
	end if	
	
	if ls_originalWhere <> '' then		
		ls_originalWhere += ' AND '		
	end if
	if ls_Where <> '' then 
		ls_Where = ls_originalWhere + ls_Where
	else
		ls_Where = is_originalwhereClause
	end if
	
	
	//-- build from clause with join for detail DW--//
	ls_joinSQL = ls_currentSQL
	if ls_Where <> "" then 
		if ls_where_ver <> '' then ls_Where += ' AND ' + ls_where_ver
	elseif ls_currentWhere <> "" and not this.ib_ismaster and not this.ib_isdetail then
		ls_Where = ls_currentWhere
		if ls_where_ver <> '' then ls_Where += ' AND ' + ls_where_ver
	end if				
	lc_sql.f_addtowhereclause( ls_joinSQL, ls_Where, ' AND ')
	
	if ls_currentWhere <> ls_Where or  ls_where_ver <> '' or this.ib_isdetail then
		ls_modify = 'Datawindow.Table.Select= "' + ls_joinSQL +'"'
		ls_rtn =this.modify(ls_modify )
		if ls_sort_ver <> '' then this.setsort(ls_sort_ver)
	end if
end if


//-- Thông báo cho obj_handling --//
//li_rtn = this.f_send_message_to_object( lds_focus, "e_preretrieve")
return li_rtn
end event

public function integer f_accepttext ();int li_numdetails, li_i, li_rc = 1

If This.AcceptText() <> 1 Then Return -1

li_numdetails = UpperBound(iads_detail)
For li_i = 1 to li_numdetails
	If IsValid( iads_detail[li_i] ) Then
		li_rc = iads_detail[li_i].f_AcceptText()
		If li_rc <> 1 Then Exit
	End If
Next

Return li_rc
end function

public function integer f_buildrecwhereclause (t_ds_db vds_criteria, ref string as_where);String		ls_where, ls_criteria
String		ls_colname, ls_value
String		ls_coltype, ls_dbname
String		ls_values[], ls_empty[]
Integer	li_i, li_count, li_pos
Integer	li_j, li_nb_values
Boolean	lb_not
String		ls_obj_type, ls_logic

c_obj_service		lc_obj_service

// Get number of criterias
li_count = vds_criteria.rowcount()
if li_count > 0 then
	vds_criteria.setsort("logic desc")
	vds_criteria.sort()
else
	return -1
end if
// Build the WHERE clause with the criterias
For li_i = li_count To 1 step -1
	// Get the current criteria's value , Get column's name , Get logical operator
	ls_value = vds_criteria.getitemstring(li_i, 'value1')
	ls_colname = vds_criteria.getitemstring(li_i, 'col_name')
	ls_logic = vds_criteria.getitemstring(li_i, 'logic')
	// Ignore NULL values
	If IsNull(ls_value) or Len(ls_value) = 0 Then continue
	
	// Reset some variables
	lb_not = false
	ls_criteria = ""
	ls_values[] = ls_empty[]
	
	// Link the criterias with the AND operator
	If ls_where <> "" Then ls_where += " "+ls_logic+" "
	
	// Get column's DB name & type
	ls_dbname = this.describe(ls_colname + ".DBAlias")
	if pos(ls_dbname,'.')=1 then
		ls_dbname = this.describe(ls_colname + ".DBName")
	elseif ls_dbname = '!' then
		ls_dbname = ls_colname
	elseif ls_dbname = '?' then
		messagebox('Thông báo','f_buildrecwhereclause: Không lấy được dbalias')
		return -1
	end if
	ls_coltype = this.describe(ls_colname + ".ColType")
	ls_obj_type = this.describe(ls_colname + ".Edit.Style")
	
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
						li_nb_values = lc_obj_service.f_StringToArray(ls_value,";",ls_values)
						
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
						ls_value = lc_obj_service.f_GlobalReplace(ls_value,"*","%")
						// Add value to criteria
						ls_criteria += "LIKE ~~'" + Upper(ls_value) + "~~'"
					Else													// Simple equality (=)
						// Add value to criteria
						ls_criteria += "= ~~'" + Upper(ls_value) + "~~'"
					End If
				End If
			End If
			
		Case "date","datet"
			
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
						li_nb_values = lc_obj_service.f_StringToArray(ls_value,";",ls_values)
						
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
			
		Case "decim","numbe"
			
			// Build the beginning of the criteria
			ls_criteria = "( " + ls_dbname + " "
			
			// Replace ',' by '.'
			ls_value = lc_obj_service.f_GlobalReplace(ls_value,",",".")
			
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
						li_nb_values = lc_obj_service.f_StringToArray(ls_value,";",ls_values)
						
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
						li_nb_values = lc_obj_service.f_StringToArray(ls_value,";",ls_values)
						
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

protected function integer f_buildwhereclause_4_dwdetail (ref string as_where);
string					ls_table_m, ls_table_alias_m, ls_join_m, ls_where_m
c_dwservice			lc_dwservice
//window				lw_display
s_object_display	lod_handle

if ib_isdetail then	
	if isvalid(ids_master) then
//		this.f_getparentwindow(lw_display)
//		lod_handle= lw_display.dynamic f_get_obj_handling()
		if lod_handle.ib_copying or lod_handle.ib_allocating then
//			this.f_buildwhereclause_of_masterkey( as_where)
		else			
			if lc_dwservice.f_parse_fromwhere_clause(ids_master, ls_table_m, ls_table_alias_m, ls_join_m, ls_where_m) = -1 then return -1
			if ls_where_m <> '' then
				if as_where <> '' then
					as_where = as_where + ' AND '+ ls_where_m
				else
					as_where = ls_where_m 
				end if
			end if
		end if
		return 1
	else
		return -1
	end if
else
	return 0
end if

end function

protected function integer f_buildwhereclause_of_masterkey (ref string as_where);		
string					ls_coltype, ls_dbname, ls_where, ls_value, ls_master_key_value
int						li_cols, li_idx
long					li_master_currow, ll_row
boolean				lb_master_found
t_ds_db_ws			lds_detail
c_string				lc_string
c_dwservice			lc_dwservice
s_object_display	lod_handle
window				lw_display

if ib_isdetail then	
	ls_where = as_where	
	if isvalid(ids_master) then
		if ids_master.f_get_ib_detail() then
			//-- detail cấp 2 --//
			lds_detail = this
			if this.f_buildwhereclause_of_masterkey( ids_master, lds_detail, as_where, ias_master_keycol[], ias_detail_keycol[]) = -1 then
				return -1
			end if
		else
			//-- detail cấp 1 --//			
			lod_handle= this.f_get_obj_display( )
			li_cols = upperbound(ias_master_keycol)
			FOR li_idx = 1 TO li_cols
				//-- Link the criterias with the AND operator --//
				If ls_where <> "" Then ls_where += " AND "		
				//-- lấy tên cột của detail --//
				ls_dbname =  ias_detail_keycol[li_idx]
				if lc_dwservice.f_get_build_column( this,ls_dbname, ls_colType) = -1 then
					return -1			
				end if					
				if lod_handle.ib_copying or lod_handle.ib_allocating then
					li_master_currow = this.ids_master.find( "gutter = 'Y'", 1, this.ids_master.rowcount())
				else
					li_master_currow = ids_master.getrow()
				end if
				DO while li_master_currow > 0					
					if not isnull(ls_master_key_value) and ls_master_key_value <>'' then
						ls_master_key_value +=';'
					end if
					ls_master_key_value += string(ids_master.f_getitemany(li_master_currow, ias_master_keycol[li_idx]))

					if lod_handle.ib_copying or lod_handle.ib_allocating then
						li_master_currow = this.ids_master.find( "gutter = 'Y'", li_master_currow+1, this.ids_master.rowcount()+1)
					else
						li_master_currow = 0
					end if
					lb_master_found = true
				LOOP				
				if not lb_master_found then
					ls_where =''
					exit
				end if
				if isnull(ls_master_key_value) then
					ls_master_key_value ='()'
				end if			
				if pos(ls_master_key_value,';')>0 then 
					ls_master_key_value = '('+ls_master_key_value+')'
				else
					if left(ls_colType, 4) = 'char' then
						if ls_master_key_value <> '()' then
							ls_master_key_value = '='+ls_master_key_value
						end if
					end if		
				end if
				ls_where += lc_string.f_get_expression(ls_master_key_value , ls_coltype, ls_dbname,'build where')			
				//xóa biến ls_master_key_value để tranh trường hợp cộng dồn do nhiều cột master key
				ls_master_key_value = ''
			NEXT	
			if ls_where <> '' then
				as_where = ls_where	
				return 1
			else
				as_where = " 1 = 0 "
				return 0
			end if
		end if
	else 
		return -1
	end if
else
	return 0
end if

end function

public function boolean f_get_ib_detail ();return ib_isdetail

end function

protected function integer f_buildwhereclause_of_masterkey (ref t_ds_db_ws rds_master, ref t_ds_db_ws rds_detail, ref string as_where, string vas_master_keycol[], string vas_detail_keycol[]);
string					ls_orginalSQL_nowhere,ls_whereclause, ls_dbname, ls_tables[], ls_empty[], ls_where, ls_wheredetail3
string					las_master_keycol[], las_detail_keycol[], ls_colType, ls_where_4_copy
int						li_cols, li_idx, li_rtn, li_cnt
c_sql					lc_sql
t_s_sql_attr 				lastr_sql[]
c_dwservice				lc_dwservice
c_string						lc_string
t_ds_db_ws					lds_grandmaster, lds_match 
s_object_display			lc_obj_handling, lc_obj_parent
s_str_dwo_related		lstr_dwo_related[]
	
if rds_master.f_getCurrentSQL(ls_orginalSQL_nowhere, ls_whereclause) = 1 then
	li_rtn = lc_sql.f_parse(ls_orginalSQL_nowhere, lastr_sql[])
	if li_rtn = 1 then
		//-- Remove ORDER BY clause --//
		lastr_sql[1].s_order = ""		
		// Replace the selected columns of the detail by the linkage columns
		li_cols = UpperBound(vas_master_keycol[])
		lastr_sql[1].s_columns = ""				
		For li_idx = 1 To li_cols
			If li_idx > 1 Then lastr_sql[1].s_columns += ","
			ls_dbname = vas_master_keycol[li_idx] 
			if lc_dwservice.f_get_build_column( rds_master,ls_dbname, ls_colType) = -1 then
				return -1			
			end if			

			lastr_sql[1].s_columns += ls_dbname
		Next
		//-- kiem tra where detail cấp 3 --//
		lds_grandmaster = rds_master.f_getdsmaster()
		if isvalid(lds_grandmaster) then
			if lds_grandmaster.f_get_ib_detail() then
				//-- detail cấp 3 --//
				rds_master.f_get_master_keycol(las_master_keycol[])
				rds_master.f_get_detail_keycol(las_detail_keycol[])
				li_rtn = this.f_buildwhereclause_of_masterkey( lds_grandmaster, rds_master, ls_wheredetail3, las_master_keycol[], las_detail_keycol[])				
			end if
		end if		
		
		if ls_wheredetail3 <>'' then 
			lastr_sql[1].s_where = ls_wheredetail3
		else 
			lastr_sql[1].s_where = ls_whereclause
		end if
		
		// Rebuild the detail SQL
		ls_orginalSQL_nowhere = lc_sql.f_Assemble(lastr_sql)
		
		// Prepare the main Query where clause
		ls_where += "("
		
		// Copy master columns & tables locally for faster access
		li_cols = UpperBound(vas_detail_keycol)
		For li_idx = 1 To li_cols
			If li_idx > 1 Then ls_where += ","
			// Add linkage column
			ls_dbname = vas_detail_keycol[li_idx] 
			if lc_dwservice.f_get_build_column( rds_detail,ls_dbname, ls_colType) = -1 then
				return -1			
			end if					

			ls_where += ls_dbname
		Next
		
		// Finish add of the detail SQL
		ls_where += ") IN (" + ls_orginalSQL_nowhere + ")"		
		//-- kiêm tra form copy --//
		lc_obj_handling = this.f_get_obj_display( )
		if lc_obj_handling.ib_copying or lc_obj_handling.ib_allocating then

//			lc_obj_parent = lc_obj_handling.f_get_p					
			li_cnt = lc_obj_handling.f_get_data_related( lc_obj_parent.classname( ) , lstr_dwo_related[])
			if li_cnt = 1 then
				if upperbound(lstr_dwo_related[1].s_match_f_dwo[]) >0 then
					lds_match = lc_obj_handling.f_get_ds( lstr_dwo_related[1].s_match_f_dwo[1])
					if not isvalid(lds_match) or lds_match.dataobject = '' then
						//--Lỗi khai báo str copy bị sai tên dw
						gf_messagebox('m.t_dw_mpl.f_buildwhere_of_masterkey.01','Thông báo','Không tìm thấy DWO:@'+ lstr_dwo_related[1].s_match_f_dwo[1],'exclamation','ok',1)
						return -1
					end if
					if left(lds_match.dataobject, len(lds_match.dataobject)-5) = left(this.dataobject, len(this.dataobject)-5) then
						ls_where_4_copy = lc_dwservice.f_buildwhere_line_4_copy(lstr_dwo_related[1] , lds_match)
					end if
				end if
			else
				gf_messagebox('m.t_dw_mpl.f_buildwhere_of_masterkey.02','Thông báo','Cấu trúc related dwo không có đúng 1 đối tượng liên quan: b_doc.e_window_postopen_child.01: line12','exclamation','ok',1)
				return -1
			end if			
		end if
		if ls_where_4_copy <> '' then
			ls_where = ls_where + ' AND ' + ls_where_4_copy
		end if
		as_where =ls_where
	end if

	return 1
else
	return -1
end if

return 0

end function

public function integer f_get_master_keycol (ref string rs_key[]);int li_rt
rs_key = ias_master_keycol
li_rt = upperbound(ias_master_keycol)
return li_rt 
end function

public function integer f_get_detail_keycol (ref string rs_key[]);int li_rt
rs_key = ias_detail_keycol
li_rt = upperbound(ias_detail_keycol)
return li_rt
end function

public function string f_buildwhereclause_of_company ();
string 					ls_whereclause, ls_modify, ls_currentSQL, ls_currentWhere,ls_rtn, ls_dbname, ls_coltype
c_sql					lc_sql
c_dwservice			lc_dwservice

s_object_display	lod_handle

//-- company --//
if this.f_is_company( ) then
	ls_dbname = 'company_id'
	lc_dwservice.f_get_build_column( this,ls_dbname, ls_coltype)
	ls_whereclause = ls_dbname+ " =" + string(gi_user_comp_id)
end if

//-- branch --//
if this.f_is_branch( ) then
	lod_handle = this.f_get_obj_display( )
	if lod_handle.idwsetup_initial.f_is_branch_yn( this.dataobject ) then
		ls_dbname = 'branch_id'
		lc_dwservice.f_get_build_column( this, ls_dbname, ls_coltype)
		if ls_whereclause <> '' then ls_whereclause +=  ' AND '
		ls_whereclause = ls_whereclause + ls_dbname+ ' =' + string(gdb_branch)
	end if
end if


return ls_whereclause

end function

public function string f_buildwhereclause_of_sob ();
string 			ls_rtn, ls_dbname, ls_coltype,ls_whereclause
c_dwservice		lc_dwservice


//-- sob --//
if this.f_is_sob( ) then
	ls_dbname = 'sob'
	lc_dwservice.f_get_build_column( this,ls_dbname, ls_coltype)
	ls_whereclause = +ls_dbname+ " = '" + gs_sob + "'"
end if

return ls_whereclause

end function

public function boolean f_check_foreign_key (string as_table_name, string as_id_colume_name, any aa_id_value);/*
Nội dung:Kiem tra co ton tai khoa ngoai  ko
---------------------------------------------------------------------------------------------
Biến:
	Tên									Diễn giải
- as_table_name 						Tên table
- as_id_colume_name				Tên cột ID của table
- aa_id_value							Giá trị của ID
----------------------------------------------------------------------------------------------
Trả về:
	- > 0 la co ton tai khoa ngoai
	- = 0 la ko ton tai khoa ngoai
*/
long ll_count
string ls_sql
ls_sql =  "SELECT count(*) FROM " + as_table_name + " WHERE nvl(" + as_id_colume_name + ", 0) = " + string(aa_id_value)

DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;
PREPARE SQLSA FROM :ls_sql;
OPEN DYNAMIC my_cursor ;
FETCH my_cursor INTO :ll_count ;
CLOSE my_cursor ;

if ll_count = 0 then 
	ls_sql =  "SELECT count(*) FROM " + as_table_name + " WHERE " + as_id_colume_name + " = '" + string(aa_id_value) +"'"	
	PREPARE SQLSA FROM :ls_sql;	
	OPEN DYNAMIC my_cursor ;	
	FETCH my_cursor INTO :ll_count ;
	CLOSE my_cursor ;		
end if 

if ll_count > 0 then 
	return true
end if 

return false
end function

public function integer f_check_limit (string vs_object_name, string vs_column_name, string vs_data);/*
return : 
	 1 co cai dat limit va nhap chua vuot qua gioi han
	-1 co cai dat limit va nhap qua gioi han (Limit)
   	 0 Khong cai dat limit, khong kiem tra limit   
*/
int li_result
string ls_dataobject, ls_column, ls_sort_type, ls_sort
long ll_limit
ls_dataobject = this.dataobject

select limit into :ll_limit
from DWCOLUMN_SETUP_HDR
where DWOBJECT= :vs_object_name
and nvl(limit, 0) > 0
and dwcolumn = :vs_column_name
and company_id = :gi_user_comp_id;

if isnull(ll_limit) then  ll_limit = 0
if ll_limit > 0 then 
	if len(vs_data) > ll_limit then 
	 	return -1
	else 
		return 1
	end if 
else
	return 0
end if 


end function

public function t_ds_db_ws f_getdsmaster ();t_ds_db_ws 	lds_null

If ib_isdetail Then
	If IsValid ( ids_master ) Then
		Return ids_master.f_GetDSMaster()
	Else
		SetNull(lds_null)
		Return lds_null
	End If
elseif ib_isshared then
	If IsValid ( ids_master ) Then
		Return ids_master
	Else		
		SetNull(lds_null)
		Return lds_null
	End If	
Else
	Return this
End If
end function

public function string f_get_branch_colname ();
int 			li_col_count, li_col
string		ls_colname

li_col_count = Integer(this.object.datawindow.column.count)
FOR li_col = 1 to li_col_count
	ls_colname = this.Describe ( "#"+string(li_col) + "dbname" )
	if pos(ls_colname, 'branch_id') > 0 then
		return ls_colname
	end if
NEXT
		
return ''
end function

public function string f_get_company_colname ();
int 			li_col_count, li_col
string		ls_colname

li_col_count = Integer(this.object.datawindow.column.count)
FOR li_col = 1 to li_col_count
	ls_colname = this.Describe ( "#"+string(li_col) + "dbname" )
	if pos(ls_colname, 'company_id') > 0 then
		return ls_colname
	end if
NEXT
		
return ''
end function

public function integer f_get_criteria_record (s_str_criteria_rec rs_str_criteria_rec[]);rs_str_criteria_rec = is_str_criteria_rec
return upperbound(rs_str_criteria_rec)


end function

public function string f_get_datacolumn_name (string as_columnname, string as_receipt_col, string as_return_col);c_dwservice	l_dwservice
string lsa_receipt_col[] ,lsa_return_col[]
long ll_recept ,ll_return ,li,ll_find 
l_dwservice.f_stringtoarray( as_receipt_col, ';', lsa_receipt_col) 
l_dwservice.f_stringtoarray( as_return_col, ';', lsa_return_col) 
ll_recept =  upperbound(lsa_receipt_col)
ll_return = upperbound(lsa_return_col)
// cài đặt sai 
for li=1 to ll_recept 
	if upper(trim(as_columnname)) = upper(trim( lsa_receipt_col[li])) then 
		ll_find = li 
		exit 
	end if 
next 
if ll_find =0 then return ''
if ll_find > upperbound(lsa_return_col) then return ''
return  lsa_return_col[ll_find]

end function

public function string f_get_detail_filterstring (t_ds_db_ws vds_detail, boolean vb_doc_filter);/*
return 1: success

*/
int 					li_idx, li_cnt
long 					ll_master_currow
string					las_master_keycol[], las_detail_keycol[], ls_filterString, ls_ColType, ls_data, ls_dbname
double				ldb_data, ldb_doc_id
string					ls_master_key_value
boolean				lb_doc_trace

t_ds_db_ws			lds_main
s_object_display	lod_handle
c_dwservice			lc_dwservice
c_string				lc_string


lod_handle = this.f_get_obj_display( )
lds_main = lod_handle.f_get_dsmain()

li_cnt = vds_detail.f_get_detail_keycol(las_detail_keycol[])
li_cnt = vds_detail.f_get_master_keycol(las_master_keycol[])
FOR li_idx = 1 to li_cnt
	//-- lấy tên cột của detail --//
	ls_dbname =  las_detail_keycol[li_idx]
	ls_colType =  vds_detail.describe(ls_dbname +'.Coltype')

//	if lw_parent.dynamic f_get_ib_doc_trace_on() then
//		if vds_detail.describe( "version_no.coltype" ) = 'number' then
//			ls_dbname = 'ID'
//			ls_colType =  vds_detail.describe(ls_dbname +'.Coltype')
//			lb_doc_trace = true
//		end if
//	end if

	if lod_handle.ib_copying or lod_handle.ib_allocating then
		if this.dataobject = lds_main.dataobject then
			ll_master_currow = this.find( "gutter = 'Y'", 1, this.rowcount())
		else
			if this.rowcount( ) > 0 then	ll_master_currow = 1
		end if
	elseif vb_doc_filter then
		if this.dataobject = lds_main.dataobject then
			ll_master_currow = this.getrow()
		else
			if this.rowcount( ) > 0 then	ll_master_currow = 1
		end if		
	else
		ll_master_currow = this.getrow()		
	end if
	
	DO while ll_master_currow > 0 and ll_master_currow <= this.rowcount( )
		if ls_data <>'' then
			ls_data +=';'
		end if		
		if lb_doc_trace then
			ls_data += string(this.f_getitemany(ll_master_currow, 'extend_id'))
		else
			ls_data += string(this.f_getitemany(ll_master_currow, las_master_keycol[li_idx]))
		end if
		if lod_handle.ib_copying or lod_handle.ib_allocating then
			if this.dataobject = lds_main.dataobject then
				ll_master_currow = this.find( "gutter = 'Y'", ll_master_currow+1, this.rowcount()+1)
			else
				ll_master_currow++
			end if
		elseif vb_doc_filter then
			if this.dataobject = lds_main.dataobject then
				ll_master_currow = 0
			else
				ll_master_currow++
			end if			
		else
			ll_master_currow = 0
		end if		
	LOOP
	//-- lấy thêm dòng getrow của main nếu đang là copy to --//
	if lod_handle.is_copy_type = 'copyt' and lod_handle.ib_copying and this.dataobject = lds_main.dataobject then
		if isnull(this.getitemstring(this.getrow( ),'gutter')) or this.getitemstring(this.getrow( ),'gutter') = 'N' then
			if trim(ls_data) <> '' then ls_data +=';'		
			ls_data += string(this.f_getitemany(this.getrow( ) , las_master_keycol[li_idx]))
		end if
	end if
	
	if ls_data = '' or isnull(ls_data) then
		if  left(ls_colType, 4) = 'numb' then
			ls_filterString =  las_detail_keycol[li_idx]+'= 0'
		else
			ls_filterString =  las_detail_keycol[li_idx]+ "= '' "
		end if
		exit
	end if
	if pos(ls_data,';')>0 then 
		ls_data = '('+ls_data+')'
	else
		if left(ls_colType, 4) = 'char' then
			if ls_data <> '()' then
				ls_data = '='+ls_data
			end if
		end if		
	end if			
	if ls_filterString <> '' then ls_filterString += ' AND '
	ls_filterString += lc_string.f_get_expression(ls_data , ls_coltype, ls_dbname,'filter')			
	//xóa biến ls_data để tranh trường hợp cộng dồn do nhiều cột master key
	ls_data = ''		
NEXT


return ls_filterString

end function

public function integer f_get_doc_trace (ref string rs_where, ref string rs_sort);
c_dwservice				lc_dwservice
s_object_display		lod_handle
c_string					lc_string
double					ldb_doc_id
any						laa_data[]
string						ls_colname, ls_coltype
long						ll_master_row

if this.describe( "version_id.coltype" ) = 'number' then
//	this.f_getparentwindow(lw_display )
//	if lw_display.dynamic f_get_ib_doc_trace_on() then
//		if this.getrow( ) > 0 then
//			ldb_doc_id = this.getitemnumber(this.getrow( ), 'id')
//			ls_colname = ' ID'
//			lc_dwservice.f_get_build_column( this, ls_colname, ls_coltype)		
//			rs_where = ls_colname + '=' + string(ldb_doc_id)			
//		end if
//		rs_sort = "extend_id a"
//		return 1
//	else
		ls_colname = ' extend_id'
		lc_dwservice.f_get_build_column( this, ls_colname, ls_coltype)
		rs_where = ls_colname
		ls_colname = ' version_id'
		lc_dwservice.f_get_build_column( this, ls_colname, ls_coltype)
		rs_where = rs_where +' = ' + ls_colname
		return 0
//	end if
elseif this.describe( "version_no.coltype" ) = 'number' then
//	this.f_getparentwindow(lw_display )
//	if lw_display.dynamic f_get_ib_doc_trace_on() then
//		if this.idw_master.getrow( ) > 0 then
//			ls_colname = ' ID'
//			lc_dwservice.f_get_build_column( this, ls_colname, ls_coltype)		
//			rs_where = ls_colname
//			ls_colname = ' extend_id'
//			lc_dwservice.f_get_build_column( this.idw_master, ls_colname, ls_coltype)
//			rs_where = rs_where +' = ' + ls_colname			
//			return 1
//		end if
//	else
		lod_handle = this.f_get_obj_display( )
		if not lod_handle.ib_copying then
			ls_coltype = this.ids_master.describe( "version_id.coltype")
			ls_colname = 'version_id'
			lc_dwservice.f_get_build_column( ids_master, ls_colname, ls_coltype)
			rs_where = ls_colname
			ls_coltype = this.describe( "ID.coltype")
			ls_colname = 'ID'
			lc_dwservice.f_get_build_column( this, ls_colname, ls_coltype)
			rs_where += ' = '+ ls_colname
			return 0
		elseif lod_handle.ib_copying and lod_handle.is_copy_type <> 'copyt' then
			ll_master_row = this.ids_master.find( "gutter = 'Y'", 1, this.ids_master.rowcount())
			DO while ll_master_row > 0					
				if not isnull(rs_where) and rs_where <>'' then
					rs_where +=';'
				end if
				rs_where += string(ids_master.getitemnumber(ll_master_row, 'version_id' ))
				ll_master_row = this.ids_master.find( "gutter = 'Y'", ll_master_row+1, this.ids_master.rowcount()+1)
			LOOP				

			ls_coltype = this.ids_master.describe( "version_id.coltype")
			if pos(rs_where, ';') > 0 then
				rs_where = '('+rs_where+')'
			end if
			ls_colname = 'ID'
			lc_dwservice.f_get_build_column( this, ls_colname, ls_coltype)
			rs_where = lc_string.f_get_expression( rs_where, ls_coltype, ls_colname, 'build where')	
			return 0
		end if
//	end if
end if

end function

public function boolean f_get_ib_cascade_del ();return ib_iscascade_del

end function

public function boolean f_get_ib_delete ();
return this.f_get_ib_delete( istr_security_attr, istr_rule_attr)

end function

public function boolean f_get_ib_delete (s_str_policy_attr vstr_security_attr, s_str_policy_attr vstr_rule_attr);return ib_delete and  vstr_security_attr.b_delete and vstr_rule_attr.b_delete
end function

public function boolean f_get_ib_editing ();return ib_editing
end function

public function boolean f_get_ib_insert (s_str_policy_attr vstr_security_attr, s_str_policy_attr vstr_rule_attr);return ib_insert and vstr_security_attr.b_insert and vstr_rule_attr.b_insert
end function

public function boolean f_get_ib_insert ();return this.f_get_ib_insert( istr_security_attr, istr_rule_attr)

end function

public function boolean f_get_ib_keyboardlocked ();return ib_keyboardlocked 

end function

public function boolean f_get_ib_master ();return ib_ismaster

end function

public function boolean f_get_ib_query (s_str_policy_attr vstr_security_attr, s_str_policy_attr vstr_rule_attr);return ib_query and  vstr_security_attr.b_query and vstr_rule_attr.b_query
end function

public function boolean f_get_ib_query ();return this.f_get_ib_query(istr_security_attr, istr_rule_attr)
end function

public function boolean f_get_ib_ref_table_yn ();return ib_ref_table_yn
end function

public function boolean f_get_ib_relation_1_1 ();return ib_relation_1_1

end function

public function boolean f_get_ib_saving ();return ib_saving
end function

public function boolean f_get_ib_shared ();return ib_isshared

end function

public function boolean f_get_ib_traceable ();return ib_traceable

end function

public function boolean f_get_ib_update (s_str_policy_attr vstr_security_attr, s_str_policy_attr vstr_rule_attr);return ib_update and  vstr_security_attr.b_update and vstr_rule_attr.b_update
end function

public function boolean f_get_ib_update ();return this.f_get_ib_update(istr_security_attr, istr_rule_attr)

end function

public function t_ds_db_ws f_get_ids_master ();return ids_master 
end function

public function string f_get_pkcol ();/*================================
Lấy tên cột làm primary key của datawindow
---------------------------------------------------------
return: (string) tên cột
		: '' emtry string nếu không có primary key
=================================*/
int li_cols, li_idx
string ls_pkcol =''

li_cols =  integer(this.object.datawindow.column.count)
FOR li_idx = 1 to li_cols
	if lower(this.describe( '#'+string(li_idx)+'.key'))='yes' then
		ls_pkcol = this.describe('#'+string(li_idx)+'.name' ) +';'
	end if
NEXT
if ls_pkcol <>'' then ls_pkcol = left(ls_pkcol, len(ls_pkcol) - 1)
return ls_pkcol
end function

public function string f_get_ref_table_field ();return is_ref_table_field
end function

public function integer f_get_rule_id_rec (ref double rdb_rule_id[]); rdb_rule_id = idb_rule_id
return upperbound(rdb_rule_id)
end function

public function string f_get_sql_join_master (string vs_dwo_detail);string			ls_joinSQL, ls_table_m, ls_table_alias_m, ls_join_m, ls_where_m, ls_detail_colname, ls_coltype, ls_Onclause
string			ls_detailSQL, ls_detailWhere, ls_join_remain
int				li_idx, li_pos
c_dwservice			lc_dwservice
c_string				lc_string
t_ds					lds_tmp
c_sql					lc_sql

lds_tmp = create t_ds
lds_tmp.dataobject = vs_dwo_detail
lds_tmp.f_getcurrentsql(ls_detailSQL , ls_detailWhere)
destroy lds_tmp

if lc_dwservice.f_parse_fromwhere_clause(this.ids_master ,ls_table_m, ls_table_alias_m, ls_join_m, ls_where_m) = -1 then 
	gf_messagebox('m.t_dw_mpl.f_get_sql_join_master.01','Thông báo','Lỗi parse JOIN clause của DW master','stop','ok',1)
	return ''
end if
FOR li_idx = 1 to upperbound(ias_master_keycol[])
	if ls_Onclause <> '' then ls_onclause += ' AND '
	if ls_table_alias_m = '' then
		ls_Onclause += ls_table_m + '.' + ias_master_keycol[li_idx]
	else
		ls_Onclause += ls_table_alias_m + '.' + ias_master_keycol[li_idx]
	end if			
	ls_detail_colname = ias_detail_keycol[li_idx]
	lc_dwservice.f_get_build_column( this, ls_detail_colname, ls_coltype)
	ls_onclause += ' = ' + ls_detail_colname
NEXT
//-- remove LRF join --//
ls_join_m = lc_sql.f_remove_LRF_join(ls_join_m)

ls_joinSQL = ls_detailSQL + ' JOIN ' + ls_table_m +' ' + ls_table_alias_m + ' ON ' + ls_onclause + ' ' + ls_join_m

return ls_joinSQL
end function

public function integer f_getdsdetails (ref t_ds_db_ws rds_details[]);int li_rt
rds_details[] = iads_detail[]
li_rt = UpperBound(iads_detail)
Return li_rt 
end function

public function integer f_getdwshared (ref t_ds_db_ws rds_shared[]);int li_rt
rds_shared = iads_shared
li_rt = UpperBound(iads_shared)

Return li_rt 
end function

public function boolean f_is_lang ();
string		ls_coltype


ls_coltype = this.Describe ("lang.coltype" )
if ls_coltype = '!' then 
	return false
else
	return true
end if
end function

public function integer f_rebuild_select_column (string vs_columns);
string					ls_currentSQL_nowhere, ls_currentwhere, ls_rebuildSQL, ls_dbname, ls_rtn, ls_originalColString, ls_delcol[]
string					las_dbname[], ls_empty[], las_original_colname[], ls_coltype
int						li_idx, li_rtn, li_colCnt
boolean				lb_notexist
c_sql					lc_sql
t_s_sql_attr 			lastr_sql[]
c_string				lc_string
c_dwservice			lc_dwservice

//-- lấy các cột không cần thiết --//
li_colCnt = this.f_getcolumns_sql(las_original_colname[] )
FOR li_idx = 1 to li_colCnt
	if pos(vs_columns, las_original_colname[li_idx]+';') = 0 then
		ls_delcol[upperbound(ls_delcol) + 1] = las_original_colname[li_idx]
	end if
NEXT

if this.dynamic f_getCurrentSQL(ls_currentSQL_nowhere, ls_currentwhere) = 1 then
	li_rtn = lc_sql.f_parse(ls_currentSQL_nowhere, lastr_sql[])
	if li_rtn = 1 then
		//-- Remove ORDER BY clause --//
		lastr_sql[1].s_order = ""	
		//-- remove khoảng trắng trong select --//
		lastr_sql[1].s_columns = lc_string.f_removesqlwhitespace( lastr_sql[1].s_columns)
//		lc_string.f_globalreplace(  lastr_sql[1].s_columns ,' ,',',',   lastr_sql[1].s_columns)
		For li_idx = 1 To upperbound(ls_delcol[] )	
			
			//-- Replace the selected columns of the detail by the linkage columns --//		
			ls_dbname =ls_delcol[li_idx]
			if lc_dwservice.f_get_build_column( this, ls_dbname, ls_coltype) =-1 then
				return -1
			end if				
			
			
			li_rtn = lc_string.f_globalreplace(  lastr_sql[1].s_columns , ls_dbname+',', '',   lastr_sql[1].s_columns)
			if li_rtn = 0 then
				 li_rtn = lc_string.f_globalreplace(  lastr_sql[1].s_columns , ls_dbname, '',   lastr_sql[1].s_columns)
				 if li_rtn = 0 then
					 li_rtn = lc_string.f_globalreplace(  lastr_sql[1].s_columns , "as "+ls_dbname+',', '',   lastr_sql[1].s_columns)
					 if li_rtn = 0 then
						li_rtn = lc_string.f_globalreplace(  lastr_sql[1].s_columns , "as "+ls_dbname, '',   lastr_sql[1].s_columns)
						if li_rtn  = 0 then
							li_rtn = lc_string.f_globalreplace(  lastr_sql[1].s_columns , ls_delcol[li_idx]+',', '',   lastr_sql[1].s_columns)
							if li_rtn = 0 then
								li_rtn = lc_string.f_globalreplace(  lastr_sql[1].s_columns , ls_delcol[li_idx], '',   lastr_sql[1].s_columns)
								lastr_sql[1].s_columns = mid(lastr_sql[1].s_columns,1,lastpos(lastr_sql[1].s_columns,',') -1)
							end if
						end if
					 end if
				else
					lastr_sql[1].s_columns = mid(lastr_sql[1].s_columns,1,lastpos(lastr_sql[1].s_columns,',') -1)
				end if
			end if
			
			//-- destroy columname --//
			ls_rtn = this.modify( " destroy column "+ls_delcol[li_idx])
			ls_rtn = this.modify( " destroy "+ls_delcol[li_idx]+'_t')		
		Next			
		lastr_sql[1].s_where += ls_currentwhere
				
		// Rebuild the detail SQL
		ls_rebuildSQL = lc_sql.f_Assemble(lastr_sql)
		ls_rebuildSQL = "Datawindow.Table.Select= ~'" + ls_rebuildSQL +"~'"
		ls_rtn =this.modify(ls_rebuildSQL )		
		if ls_rtn <> '' then			
			return -1
		end if
	end if
else
	return -1
end if
return 0

end function

public function long f_reset_detail ();long 					ll_numdetails, ll_i, ll_rc
string					ls_filterString

ll_numdetails = UpperBound(iads_detail)
if this.ib_isdetail then
	For ll_i = 1 to ll_numdetails
		If IsValid ( iads_detail[ll_i] ) Then
			ls_filterString =  this.f_get_detail_filterString( iads_detail[ll_i], false)
			iads_detail[ll_i].setfilter(ls_filterString)
			iads_detail[ll_i].filter()
			if iads_detail[ll_i].f_get_ib_master() then
				ll_rc = iads_detail[ll_i].f_reset_detail()
			end if
		End If
	Next	
else
	For ll_i = 1 to ll_numdetails
		If IsValid ( iads_detail[ll_i] ) Then
			ll_rc = iads_detail[ll_i].reset()
			if iads_detail[ll_i].f_get_ib_master() then
				ll_rc = iads_detail[ll_i].f_reset()
			end if
		End If
	Next
end if
Return ll_rc
	
end function

public function integer f_send_message_to_object (ref t_ds_db_ws rds_focus, ref t_ds_db_ws vds_source, long vl_currentrow, dwobject dwo, string vs_message);int 					li_rtn
s_object_display		lpo_handling


lpo_handling = this.f_get_obj_display( )
if isvalid(lpo_handling) then
	return 0
//	return lpo_handling.f_handle_message(rds_focus,vds_source,vl_currentrow, dwo, vs_message)
end if

return -1
end function

public function integer f_set_criteria_record (s_str_criteria_rec vs_str_criteria_rec[]);is_str_criteria_rec = vs_str_criteria_rec
return upperbound(is_str_criteria_rec)

end function

public subroutine f_set_ids_master (t_ds_db_ws vds_master);ids_master = vds_master
end subroutine

public function integer f_set_ib_cascade_del (boolean vb_cascade_del);ib_iscascade_del = vb_cascade_del
return 1
end function

public function integer f_set_ib_dataerror (boolean vb_dataerror);ib_dataerror = vb_dataerror
return 1
end function

public function integer f_set_ib_delete (boolean vb_delete);ib_delete = vb_delete
return 1
end function

public subroutine f_set_ib_detail (boolean vb_detail);ib_isdetail = vb_detail

end subroutine

public subroutine f_set_ib_displaying (boolean vb_displaying);ib_displaying = vb_displaying

end subroutine

public subroutine f_set_ib_dropdowning (boolean vb_dropdowning);ib_dropdowning = vb_dropdowning

end subroutine

public subroutine f_set_ib_edit_changing (boolean vb_edit_changing);ib_edit_changing  = vb_edit_changing
end subroutine

public function integer f_set_ib_editing (boolean vb_editing);ib_editing = vb_editing
return 1
end function

public function integer f_set_ib_excel (boolean vb_excel);ib_excel = vb_excel
return 1
end function

public function integer f_set_ib_insert (boolean vb_insert);ib_insert = vb_insert
return 1
end function

public function integer f_set_ib_inserting (boolean vb_inserting);ib_inserting = vb_inserting
return 1
end function

public function integer f_set_ib_master (boolean vb_master);ib_ismaster = vb_master
return 1
end function

public function integer f_set_ib_query (boolean vb_query);ib_query = vb_query
return 1
end function

public function integer f_set_ib_ref_table_yn (boolean vb_ref_table_yn);ib_ref_table_yn = vb_ref_table_yn
return 1
end function

public subroutine f_set_ib_relation_1_1 (boolean vb_relation_1_1);ib_relation_1_1 = vb_relation_1_1

end subroutine

public function integer f_set_ib_saving (boolean vb_saving);ib_saving = vb_saving
return 1
end function

public subroutine f_set_ib_shared (boolean vb_shared);ib_isshared = vb_shared

end subroutine

public function integer f_set_ib_update (boolean vb_update);ib_update = vb_update
return 1
end function

public subroutine f_set_ib_valuesetting (boolean vb_valuesetting);ib_valuesetting = vb_valuesetting

end subroutine

public subroutine f_set_master_keycol (string vas_keycol[]);ias_master_keycol [] = vas_keycol[]
end subroutine

public function integer f_set_rec_security ();string						ls_currentSQL, ls_currentWhere,ls_modify,ls_rtn,ls_where,ls_dwo,ls_object_name
c_sql						lc_sql
c_dwservice				lc_dwser
s_object_display		lobj_handle

t_ds_db_ws				lds_handle
c_string					lc_string

if gi_userid = 0 then return 1
ls_dwo = this.dataobject

lobj_handle = this.f_get_obj_display( )
ls_object_name = lobj_handle.idwsetup_initial.ids_setup_dw.getitemstring( 1, 'object')
lds_handle = this
ls_where = lc_dwser.f_buildwhere_rec_security( lds_handle, mid(ls_dwo,1,len(ls_dwo)-5),ls_object_name)
if ls_where <> '' then
	ls_where = '('+ls_where+')'
	ls_where = lc_string.f_globalreplace( ls_where, '"', '')
	if this.f_getcurrentSQL( ls_currentSQL, ls_currentWhere) =1 then
		//Lưu lại where record để sử dụng trong lúc tìm kiếm
		this.is_record_where = ls_where
		if ls_currentWhere <> '' then ls_currentWhere += ' AND '
		if ls_where <> '' then ls_where = ls_currentWhere + ls_where
		if ls_where <> '' then lc_sql.f_addtowhereclause( ls_currentSQL, ls_where, " AND ")
		if ls_currentWhere <> ls_where then
			ls_modify = 'Datawindow.Table.Select= "' + ls_currentSQL +'"'
			ls_rtn =this.modify(ls_modify )
		end if
	end if
end if
return 1
end function

public function integer f_set_rule_id_rec (double vdb_rule_id[]);idb_rule_id = vdb_rule_id
return 1
end function

public function long f_get_policy_attr (datastore vds_policy, long vl_row, ref s_str_policy_attr rstr_policy_attr);//string						ls_idKey_code, ls_dwobject_const


//-- xóa giá trị biến --//
	rstr_policy_attr.b_delete = false
	rstr_policy_attr.b_insert = false
	rstr_policy_attr.b_update = false
	rstr_policy_attr.b_query = false	
	rstr_policy_attr.b_excel = false
	rstr_policy_attr.b_print = false
	rstr_policy_attr.b_access = false
	rstr_policy_attr.b_full_inherit = false

if vl_row = 0 then // user admin
	rstr_policy_attr.b_delete = true
	rstr_policy_attr.b_insert = true
	rstr_policy_attr.b_update = true
	rstr_policy_attr.b_query = true	
	rstr_policy_attr.b_excel = true
	rstr_policy_attr.b_print = true
	rstr_policy_attr.b_access = true
	rstr_policy_attr.b_full_inherit = true
	return 1
end if

if vds_policy.rowcount() = 0 then	return 0
//vl_row = vl_row
//ls_idKey_code = vds_policy.getitemstring( vl_row, 'identification_code')
//DO
//	ll_rtn_row = vl_row
	if  vds_policy.getitemstring(vl_row, 'full_inherit_yn') = 'Y' then
		rstr_policy_attr.b_full_inherit = true
	end if
	if vds_policy.getitemstring(vl_row, 'print_yn') = 'Y' then
		rstr_policy_attr.b_print = true
	end if
	if vds_policy.getitemstring(vl_row, 'excel_yn') = 'Y' then
		rstr_policy_attr.b_excel = true
	end if				
	if vds_policy.getitemstring(vl_row, 'access_yn') = 'Y' then
		rstr_policy_attr.b_access = true
	end if				
	
	if vds_policy.getitemstring(vl_row, 'delete_yn') = 'Y' then
		rstr_policy_attr.b_delete = true
		rstr_policy_attr.b_insert = true
		rstr_policy_attr.b_update = true
		rstr_policy_attr.b_query = true
	elseif vds_policy.getitemstring(vl_row, 'insert_yn') = 'Y' then
		rstr_policy_attr.b_delete = false
		rstr_policy_attr.b_insert = true
		rstr_policy_attr.b_update = true
		rstr_policy_attr.b_query = true	
	elseif vds_policy.getitemstring(vl_row, 'update_yn') = 'Y' then
		rstr_policy_attr.b_delete = false
		rstr_policy_attr.b_insert = false
		rstr_policy_attr.b_update = true
		rstr_policy_attr.b_query = true			
	elseif vds_policy.getitemstring(vl_row, 'query_yn') = 'Y' then
		rstr_policy_attr.b_delete = false 
		rstr_policy_attr.b_insert = false
		rstr_policy_attr.b_update = false
		rstr_policy_attr.b_query = true
	else
		rstr_policy_attr.b_delete = false
		rstr_policy_attr.b_insert = false
		rstr_policy_attr.b_update = false
		rstr_policy_attr.b_query = false				
	end if

return 1

	
end function

public function long f_get_policy_attr_union (s_str_policy_attr vstr_policy_attr, ref s_str_policy_attr rstr_policy_attr);
	rstr_policy_attr.b_delete = rstr_policy_attr.b_delete or vstr_policy_attr.b_delete
	rstr_policy_attr.b_insert = rstr_policy_attr.b_insert or vstr_policy_attr.b_insert
	rstr_policy_attr.b_update = rstr_policy_attr.b_update or vstr_policy_attr.b_update
	rstr_policy_attr.b_query = rstr_policy_attr.b_query or vstr_policy_attr.b_query	
	rstr_policy_attr.b_excel = rstr_policy_attr.b_excel or vstr_policy_attr.b_excel
	rstr_policy_attr.b_print = rstr_policy_attr.b_print or vstr_policy_attr.b_print
	rstr_policy_attr.b_access = rstr_policy_attr.b_access or vstr_policy_attr.b_access
	rstr_policy_attr.b_full_inherit = rstr_policy_attr.b_full_inherit or vstr_policy_attr.b_full_inherit
	
return 1

	
end function

public function s_str_policy_attr f_get_rule_attr ();return istr_rule_attr

end function

public function s_str_policy_attr f_get_security_attr ();return istr_security_attr
end function

public function integer f_set_rule_attr (datastore vds_policy, long vl_row);if vl_row = 0 then // user admin
	istr_rule_attr.b_delete = true
	istr_rule_attr.b_insert = true
	istr_rule_attr.b_update = true
	istr_rule_attr.b_query = true	
	istr_rule_attr.b_excel = true
	istr_rule_attr.b_print = true
	istr_rule_attr.b_access = true
	istr_rule_attr.b_full_inherit = true
	return 1
end if

if  vds_policy.getitemstring(vl_row, 'full_inherit_yn') = 'Y' then
	istr_rule_attr.b_full_inherit = true
end if
if vds_policy.getitemstring(vl_row, 'print_yn') = 'Y' then
	istr_rule_attr.b_print = true
end if
if vds_policy.getitemstring(vl_row, 'excel_yn') = 'Y' then
	istr_rule_attr.b_excel = true
end if				
if vds_policy.getitemstring(vl_row, 'access_yn') = 'Y' then
	istr_rule_attr.b_access = true
end if			
if vds_policy.getitemstring(vl_row, 'delete_yn') = 'Y' then
	istr_rule_attr.b_delete = true
	istr_rule_attr.b_insert = true
	istr_rule_attr.b_update = true
	istr_rule_attr.b_query = true
elseif vds_policy.getitemstring(vl_row, 'insert_yn') = 'Y' then
	istr_rule_attr.b_delete = false
	istr_rule_attr.b_insert = true
	istr_rule_attr.b_update = true
	istr_rule_attr.b_query = true	
elseif vds_policy.getitemstring(vl_row, 'update_yn') = 'Y' then
	istr_rule_attr.b_delete = false
	istr_rule_attr.b_insert = false
	istr_rule_attr.b_update = true
	istr_rule_attr.b_query = true			
elseif vds_policy.getitemstring(vl_row, 'query_yn') = 'Y' then
	istr_rule_attr.b_delete = false
	istr_rule_attr.b_insert = false
	istr_rule_attr.b_update = false
	istr_rule_attr.b_query = true
else
	istr_rule_attr.b_delete = false
	istr_rule_attr.b_insert = false
	istr_rule_attr.b_update = false
	istr_rule_attr.b_query = false	
	return 0
end if

return 1
	
end function

public subroutine f_set_rule_attr (s_str_policy_attr vstr_rule_attr);istr_rule_attr = vstr_rule_attr

end subroutine

public function integer f_set_security_attr (datastore vds_policy, long vl_row);
if vl_row = 0 then // user admin
	istr_security_attr.b_delete = true
	istr_security_attr.b_insert = true
	istr_security_attr.b_update = true
	istr_security_attr.b_query = true	
	istr_security_attr.b_excel = true
	istr_security_attr.b_print = true
	istr_security_attr.b_access = true
	istr_security_attr.b_full_inherit = true
	return 1
end if

return 1
	
end function

public subroutine f_set_security_attr (s_str_policy_attr vstr_policy_attr);istr_security_attr = vstr_policy_attr

end subroutine

public subroutine f_set_detail_keycol (string vas_keycol[]);ias_detail_keycol [] = vas_keycol[]
end subroutine

public function integer f_set_dsmaster (ref t_ds_db_ws rads_detail[]);/* set this la dw_master, va gan cac dw_deal */
int						li_idx



//-- set dwmaster --//
this.iads_detail[] = rads_detail[]

//-- set detail --//
FOR li_idx = 1 to upperbound(rads_detail[])

	rads_detail[li_idx].f_set_ids_master(this)

NEXT

return 1
end function

public function integer f_set_dsshare (ref t_ds_db_ws rds_share[]);int li_no_of_dsshare, li_idx
iads_shared = rds_share

li_no_of_dsshare = upperbound(iads_shared)
FOR li_idx = 1 to li_no_of_dsshare
	iads_shared[li_idx].f_set_ids_master(this)
	if this.sharedata( iads_shared[li_idx]) = -1 then
		gf_messagebox('m.t_dw_mpl.f_set_dwshare.01','Thông báo','Lỗi setshare:@'+this.dataobject+ ';'+iads_shared[li_idx].dataobject,'exclamation','ok',1)
		return -1
	end if
NEXT
end function

public function integer f_send_message_to_object (ref powerobject rpm_handling, string vs_message);int 					li_rtn
s_object_display		lpo_handling



lpo_handling = this.f_get_obj_display( )
if isvalid(lpo_handling) then
	return lpo_handling.dynamic f_handle_message(rpm_handling, vs_message)
end if

return -1

end function

public function integer f_retrieve_detail_copy ();int			li_idx,li_ctn

s_object_display	lob_display
t_ds_db_ws			lads_details[],lds_detail


for li_idx = 1 to upperbound(iads_detail[])
	iads_detail[li_idx].event e_retrieve_copy( )
	lob_display = iads_detail[li_idx].f_get_obj_display( )
	li_ctn = lob_display.dynamic f_get_ds_detail(lads_details[],iads_detail[li_idx].dataobject)
	if li_ctn > 0 then
		iads_detail[li_idx].f_retrieve_detail_copy( )
	end if
next
return 1
end function

public function string f_buildwhereclause_copy ();int					li_idx, li_count,li_idx1
long				ll_find
string				las_master_key[],las_detail_key[],ls_rtn,ls_whereclause,ls_master_key_value,ls_colType,ls_col

c_dwservice					lc_service
c_string						lc_tr

//-- company and branch --//
ls_whereclause = this.f_buildwhereclause_of_company( )

//-- build maseter - detail key --//
if ias_master_keycol[1] <> '' then
	li_count = lc_tr.f_stringtoarray( ias_master_keycol[1], ';', las_master_key[])
	lc_tr.f_stringtoarray( ias_detail_keycol[1], ';', las_detail_key[])
	for li_idx = 1 to li_count
		if ids_master.ib_ismaster and not ids_master.ib_isdetail then
			ll_find = ids_master.find( "gutter = 'Y'", 1, ids_master.rowcount())
			if ll_find = 0 then return '1 = 0'
			Do While ll_find > 0
				if ls_master_key_value = '' then
					ls_master_key_value = string(ids_master.f_getitemany( ll_find, 'VERSION_ID'))
				else
					ls_master_key_value += ';' + string(ids_master.f_getitemany( ll_find, 'VERSION_ID'))
				end if
				ll_find = ids_master.find( "gutter = 'Y'", ll_find + 1, ids_master.rowcount() + 1)
			Loop
		else
			if ids_master.rowcount( ) = 0 then return '1 = 0'
			for li_idx1 =1 to ids_master.rowcount( )
				if ls_master_key_value = '' then
					ls_master_key_value = string(ids_master.f_getitemany( li_idx1, las_master_key[li_idx]))
				else
					ls_master_key_value += ';' + string(ids_master.f_getitemany( li_idx1, las_master_key[li_idx]))
				end if
			next
		end if
		if ls_master_key_value <> '' then
			if ls_whereclause <> '' then ls_whereclause +=  ' AND '
			if lc_service.f_get_build_column( this,las_detail_key[li_idx], ls_colType) = -1 then return ls_whereclause
			if pos(ls_master_key_value,';') > 0 then ls_master_key_value = '('+ls_master_key_value + ')'
			if ids_master.ib_ismaster and not ids_master.ib_isdetail then
				ls_col = 'ID'
				lc_service.f_get_build_column( this,ls_col, ls_colType)
				ls_whereclause = ls_whereclause + lc_tr.f_get_expression( ls_master_key_value, ls_colType, ls_col, 'build where')
			else
				ls_whereclause = ls_whereclause + lc_tr.f_get_expression( ls_master_key_value, ls_colType, las_detail_key[li_idx], 'build where')
			end if
		end if
	next
end if

return ls_whereclause

end function

on t_ds_db_ws.create
call super::create
end on

on t_ds_db_ws.destroy
call super::destroy
end on

event e_preretrieve;call super::e_preretrieve;/*==============================
Chức năng:
	- Set security cho dw trước khi retrieve
	- Set properties cho dw trước khi retrieve
	- Gán tham số retrieve: ia_retrieve_arg[]
    - Thông báo cho ic_obj_handling
----------------------------------------------------------
return (integer): 0 Không gán gì cả
					: 1 Gán thành công
					: -1 lỗi
					: -9 dw external không tiên hành retrieve
===============================*/
int								li_rtn
string							ls_currentSQL,ls_currentWhere, ls_originalWhere, ls_rtn, ls_modify, ls_Where, ls_joinSQL
string							ls_where_ver, ls_sort_ver
boolean						lb_querymode
any							la_empty[]

s_object_display			lpo_handling
t_ds_db_ws					lds_focus
c_sql							lc_sql
c_dwservice					lc_dwservice



lds_focus = this
if this.ib_edit_changing then return 0


//-- Thông báo cho obj_handling --//
li_rtn = this.f_send_message_to_object( lds_focus, "e_preretrieve_start")
if li_rtn = -9 then return li_rtn

//-- gán gia trị cho biến ia_retrieve_arg[] --//

	lpo_handling = this.f_get_obj_display( )
	if isvalid(lpo_handling) then
		li_rtn = lpo_handling.f_get_ds_retrieve_args(lds_focus,  la_empty[] )
		if li_rtn > 0 then ia_retrieve_arg[] = la_empty[]
		if li_rtn < 0 then return -1
	end if

if this.f_getcurrentSQL( ls_currentSQL, ls_currentWhere) =1 then
	if isnull(is_originalwhereClause)  then
		ib_first_buildwhere = true
		is_originalwhereClause = ls_currentWhere
		is_originalSQL_NoWhere = ls_currentSQL
	else
		ib_first_buildwhere = false
	end if
	
	ls_originalWhere = is_originalwhereClause	
	ls_Where = this.f_buildwhereclause( ) 
	if isnull(ls_Where) then 
		return -1
	end if	
	
	if ls_originalWhere <> '' then		
		ls_originalWhere += ' AND '		
	end if
	if ls_Where <> '' then 
		ls_Where = ls_originalWhere + ls_Where
	else
		ls_Where = is_originalwhereClause
	end if
	
	
	//-- build from clause with join for detail DW--//
	ls_joinSQL = ls_currentSQL
	if this.ib_isdetail and not lpo_handling.ib_copying and not lpo_handling.ib_allocating then
		ls_joinSQL = this.f_get_sql_join_master( this.dataobject )
	end if
	//-- add where version id --//
//	ls_where_ver = this.event e_doc_trace( )	
	this.f_get_doc_trace(ls_where_ver, ls_sort_ver)
	
	//-- add join match khi copy --//
	if lpo_handling.ib_copying and this.is_join_match <> '' then
		if ib_first_buildwhere then ls_joinSQL += ' ' + this.is_join_match //-- build where lần đầu sẽ gắn join clause --//
		
		if ls_Where <> "" then
			ls_joinSQL += " WHERE "+ ls_Where
		elseif ls_currentWhere <> "" and not this.ib_ismaster and not this.ib_isdetail then
			ls_joinSQL += " WHERE "+ ls_currentWhere
		end if		
		if ls_where_ver <> '' then ls_joinSQL += ' AND ' + ls_where_ver
		//thêm vào để xử lý trường hợp đơn hàng có 5 dòng hàng kết ra 1 phiếu xuất kho 4 dòng hàng, sau đó kết dòng hàng còn lại thì không hiện lên//
		if upper(this.describe( "datawindow.table.update") ) = 'DOCUMENT' then
			ls_joinSQL += ' AND ' + "document.code like '%'"
		end if
	else
		if ls_Where <> "" then 
			if ls_where_ver <> '' then ls_Where += ' AND ' + ls_where_ver
		elseif ls_currentWhere <> "" and not this.ib_ismaster and not this.ib_isdetail then
			ls_Where = ls_currentWhere
			if ls_where_ver <> '' then ls_Where += ' AND ' + ls_where_ver
		end if				
		lc_sql.f_addtowhereclause( ls_joinSQL, ls_Where, ' AND ')
	end if
	
	if ls_currentWhere <> ls_Where or  ls_where_ver <> '' or this.ib_isdetail then
		ls_modify = 'Datawindow.Table.Select= "' + ls_joinSQL +'"'
		ls_rtn =this.modify(ls_modify )
		if ls_sort_ver <> '' then this.setsort(ls_sort_ver)
	end if
end if


//-- Thông báo cho obj_handling --//
li_rtn = this.f_send_message_to_object( lds_focus, "e_preretrieve")
return li_rtn
end event

