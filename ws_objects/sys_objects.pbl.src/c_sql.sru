$PBExportHeader$c_sql.sru
forward
global type c_sql from nonvisualobject
end type
end forward

global type c_sql from nonvisualobject autoinstantiate
end type

forward prototypes
public function integer f_parse (string as_sql, ref t_s_sql_attr astr_sql[])
public function string f_assemble (t_s_sql_attr astr_sql[])
public function integer f_addtowhereclause (ref string as_sql, string as_criteria, string as_logical_operator)
public function integer f_delete (double vdb_id[])
public function integer f_getoriginalsql_of_datastore (ref string rs_originalsql, datastore vds_handling)
private function string f_remove_lrf_join (string vs_joinstring, string vs_join_type)
public function string f_remove_lrf_join (string vs_joinstring)
end prototypes

public function integer f_parse (string as_sql, ref t_s_sql_attr astr_sql[]);integer	li_Pos, li_KWNum, li_NumStats, li_Cnt, li_PosU, li_posW
string	ls_UpperSQL, ls_Keyword[7], ls_Clause[7], ls_SQL[], ls_right
constant string LI_UNIONREPLACE="*%$!@"
char lc_char
Boolean lb_is_union_all
c_obj_service lobj_srv

// Remove Carriage returns, Newlines, and Tabs
as_SQL = lobj_srv.f_GlobalReplace(as_SQL, "~r", " ")
as_SQL = lobj_srv.f_GlobalReplace(as_SQL, "~n", " ")
as_SQL = lobj_srv.f_GlobalReplace(as_SQL, "~t", " ")

as_SQL = Trim(as_SQL)

// Search for UNION keyword, must be followed by SELECT Keyword.
// Replace UNION with bogus string so that the UNIONs can
// be separated
li_PosU = Pos(Lower(as_SQL), "union") 
li_Pos = li_PosU
Do Until li_Pos <= 0
	If li_Pos > 0 Then
		li_Pos = li_Pos + 5
		
		Do While True
			// Bypass "ALL" of "UNION ALL"
			If Upper(Mid(as_SQL, li_pos, 3)) = "ALL" Then
				lb_is_union_all = True
				as_SQL = Replace(as_SQL, li_pos, 3, "")					
			End If
			
			//  Bypass embedded spaces  
			lc_char = Mid(as_SQL, li_Pos, 1)
			If len(lc_char) > 0 and Trim(lc_char) = '' Then
				li_Pos++
			Else
				Exit
			End If
		Loop

		ls_right = Mid(as_SQL, li_pos, 6)
		
		If Upper(ls_right) = "SELECT" Then
			as_SQL = Replace(as_SQL, li_PosU, 5, LI_UNIONREPLACE)
		End If
		li_PosU = Pos(Lower(as_SQL), "union", li_Pos+5) 
		li_Pos = li_PosU
	End If
Loop

// Separate the statement into multiple statements separated by UNIONs
li_NumStats = lobj_srv.f_StringToArray(as_SQL, LI_UNIONREPLACE, ls_SQL)

For li_Cnt = 1 to li_NumStats

	// Remove leading and trailing spaces
	ls_SQL[li_Cnt] = Trim(ls_SQL[li_Cnt])

	// Convet to upper case
	ls_UpperSQL = Upper(ls_SQL[li_Cnt])

	// Determine what type of SQL this is
	// and assign the appropriate kewords
	// for the corresponding type
	If Left(ls_UpperSQL, 7) = "SELECT " Then
		// Parse the SELECT statement
		ls_Keyword[1] = "SELECT "
		ls_Keyword[2] = " FROM "
		ls_Keyword[3] = " WHERE "
		ls_Keyword[4] = " GROUP BY "
		ls_Keyword[5] = " HAVING "
		ls_Keyword[6] = " ORDER BY "

	Elseif Left(ls_UpperSQL, 7) = "UPDATE " Then
		// Parse the UPDATE statement
		ls_Keyword[1] = "UPDATE "
		ls_Keyword[2] = " SET "
		ls_Keyword[3] = " WHERE "
		ls_Keyword[6] = " ORDER BY "

	Elseif Left(ls_UpperSQL, 12) = "INSERT INTO " Then
		// Parse the INSERT statement (test before 'insert')
		ls_Keyword[1] = "INSERT INTO "
		ls_Keyword[7] = " VALUES "
		
	Elseif Left(ls_UpperSQL, 7) = "INSERT " Then
		// Parse the INSERT statement (test after 'insert to')
		ls_Keyword[1] = "INSERT "
		ls_Keyword[7] = " VALUES "		

	Elseif Left(ls_UpperSQL, 12) = "DELETE FROM " Then
		// Parse the DELETE statement (test before 'delete')
		ls_Keyword[1] = "DELETE FROM "
		ls_Keyword[3] = " WHERE "

	Elseif Left(ls_UpperSQL, 7) = "DELETE " Then
		// Parse the DELETE statement (test after 'delete from')
		ls_Keyword[1] = "DELETE "
		ls_Keyword[3] = " WHERE "
		
	End if

	// There is a maximum of 7 keywords
	li_posW =  Pos(ls_UpperSQL, ls_Keyword[3]) - 1
	For li_KWNum = 7 To 1 Step -1
		If ls_Keyword[li_KWNum] <> "" Then
			// Find the position of the Keyword
			li_Pos = Pos(ls_UpperSQL, ls_Keyword[li_KWNum]) - 1
			
			if li_Pos < li_posW and li_KWNum > 3 then continue
			
			If li_Pos >= 0 Then
				ls_Clause[li_KWNum] = Right(ls_SQL[li_Cnt], (Len(ls_SQL[li_Cnt]) - (li_Pos + Len(ls_Keyword[li_KWNum]))))
				ls_SQL[li_Cnt] = Left(ls_SQL[li_Cnt], li_Pos)
			Else
				ls_Clause[li_KWNum] = ""
			End if
		End if
	Next

	astr_sql[li_Cnt].s_Verb = Trim(ls_Keyword[1])

	If Pos(astr_sql[li_Cnt].s_Verb, "SELECT") > 0 Then
		astr_sql[li_Cnt].s_Columns = Trim(ls_Clause[1])
		astr_sql[li_Cnt].s_Tables 	= Trim(ls_Clause[2])
	Else
		astr_sql[li_Cnt].s_Tables = Trim(ls_Clause[1])

		If Pos(astr_sql[li_Cnt].s_Verb, "INSERT") > 0 Then
			li_Pos = Pos(astr_sql[li_Cnt].s_Tables, " ")
			If li_Pos > 0 Then
				astr_sql[li_Cnt].s_Columns = Trim(Right(astr_sql[li_Cnt].s_Tables, (Len(astr_sql[li_Cnt].s_Tables) - li_Pos)))
				astr_sql[li_Cnt].s_Tables = Left(astr_sql[li_Cnt].s_Tables, (li_Pos - 1))
			End if
		Else
			astr_sql[li_Cnt].s_Columns = Trim(ls_Clause[2])
		End if
	End if

	astr_sql[li_Cnt].s_Where 	= Trim(ls_Clause[3])
	astr_sql[li_Cnt].s_Group 	= Trim(ls_Clause[4])
	astr_sql[li_Cnt].s_Having 	= Trim(ls_Clause[5])
	astr_sql[li_Cnt].s_Order 	= Trim(ls_Clause[6])
	astr_sql[li_Cnt].s_Values 	= Trim(ls_Clause[7])
	astr_sql[li_Cnt].b_is_union_all = lb_is_union_all
Next

Return li_NumStats
end function

public function string f_assemble (t_s_sql_attr astr_sql[]);Integer	li_NumStats, li_Cnt
String	ls_SQL

li_NumStats = UpperBound(astr_sql[])

For li_Cnt = 1 to li_NumStats

	// Check for valid data
	If Trim(astr_sql[li_Cnt].s_Verb) = "" Or &
		Trim(astr_sql[li_Cnt].s_Tables) = "" Then
		Return ""
	End if

	// If there is more than one statement in the array, they are SELECTs that
	// should be joined by a UNION
	If li_Cnt > 1 Then
		If astr_sql[li_Cnt].b_is_union_all Then
			ls_SQL = ls_SQL + " UNION ALL "
		Else
			ls_SQL = ls_SQL + " UNION "
		End If
	End if

	ls_SQL = ls_SQL + astr_sql[li_Cnt].s_Verb

	If astr_sql[li_Cnt].s_Verb = "SELECT" Then
		If Trim(astr_sql[li_Cnt].s_Columns) = "" Then
			Return ""
		Else
			ls_SQL = ls_SQL + " " + astr_sql[li_Cnt].s_Columns + &
						" FROM " + astr_sql[li_Cnt].s_Tables
		End if

	Else
		ls_SQL = ls_SQL + " " + astr_sql[li_Cnt].s_Tables

		If astr_sql[li_Cnt].s_Verb = "UPDATE" Then
			ls_SQL = ls_SQL + " SET " + astr_sql[li_Cnt].s_Columns
		Elseif Trim(astr_sql[li_Cnt].s_Columns) <> "" Then
			ls_SQL = ls_SQL + " " + astr_sql[li_Cnt].s_Columns
		End if
	End if

	If Trim(astr_sql[li_Cnt].s_Values) <> "" Then
		ls_SQL = ls_SQL + " VALUES " + astr_sql[li_Cnt].s_Values
	End if

	If Trim(astr_sql[li_Cnt].s_Where) <> "" Then
		ls_SQL = ls_SQL + " WHERE " + astr_sql[li_Cnt].s_Where
	End if

	If Trim(astr_sql[li_Cnt].s_Group) <> "" Then
		ls_SQL = ls_SQL + " GROUP BY " + astr_sql[li_Cnt].s_Group
	End if

	If Trim(astr_sql[li_Cnt].s_Having) <> "" Then
		ls_SQL = ls_SQL + " HAVING " + astr_sql[li_Cnt].s_Having
	End if

	If Trim(astr_sql[li_Cnt].s_Order) <> "" Then
		ls_SQL = ls_SQL + " ORDER BY " + astr_sql[li_Cnt].s_Order
	End if
Next

Return ls_SQL

end function

public function integer f_addtowhereclause (ref string as_sql, string as_criteria, string as_logical_operator);Integer		li_i,li_max
String			ls_sql
t_s_sql_attr	lstr_sqlattrib[]

// Check arguments
If IsNull(as_sql) or Len(as_sql) = 0 Then Return -1
If IsNull(as_criteria) or Len(as_criteria) = 0 Then Return 0
If IsNull(as_logical_operator) or Len(as_logical_operator) = 0 &
	or (Trim(Upper(as_logical_operator)) <> "AND" &
		and Trim(Upper(as_logical_operator)) <> "OR") Then Return -1

// Work on a local variable of the SQL statement
ls_sql = as_sql

// Parse the SQL statement
li_max = f_Parse(ls_sql,lstr_sqlattrib)

// Check returned value
If li_max <= 0 Then Return -1

// Loop on SQL statements
For li_i=1 To li_max
	// Add the logical separator if needed
	If not IsNull(lstr_sqlattrib[li_i].s_where) and Len(lstr_sqlattrib[li_i].s_where) > 0 Then
		lstr_sqlattrib[li_i].s_where += " " + as_logical_operator + " "
	End If
	
	// Add the criteria to the WHERE clause
	lstr_sqlattrib[li_i].s_where += as_criteria
Next

// Re-assemble SQL statement
ls_sql = f_Assemble(lstr_sqlattrib)

// Check for errors
If Len(ls_sql) = 0 Then Return -1

// Update passed SQL statement
as_sql = ls_sql

Return 1

end function

public function integer f_delete (double vdb_id[]);
return 1
end function

public function integer f_getoriginalsql_of_datastore (ref string rs_originalsql, datastore vds_handling);
c_obj_service			lc_obj_service

if not isvalid(vds_handling) or isnull(vds_handling) then return -1

//-- Save the SQL select statement --//
rs_originalsql = vds_handling.describe("Datawindow.Table.Select")

//-- Check for errors --//
If IsNull(rs_originalsql) or Len(rs_originalsql) = 0 Then
	Return -1
End If

//-- Prepare original SQL to be re-used in a modify DW function --//
rs_originalsql = lc_obj_service.f_GlobalReplace(rs_originalsql,"'","~~'")

Return 1

end function

private function string f_remove_lrf_join (string vs_joinstring, string vs_join_type);int				li_pos1, li_pos2
string			ls_LRF_join, ls_join, ls_jointype, ls_cutStr
c_string		lc_string

if vs_join_type = '' or isnull(vs_join_type) then return ''
if vs_joinstring = '' or isnull(vs_joinstring) then return ''

//-- Cắt khoảng trắng đầu đuôi --//
vs_joinstring = trim(vs_joinstring)
vs_join_type = trim(vs_join_type)
//-- 2 khoảng trắng giữa chuỗi chuyển thành 1 khoảng trắng --//
vs_joinstring = lc_String.f_remove_doublewhitespace( vs_joinstring) 
vs_join_type =  lc_String.f_remove_doublewhitespace( vs_join_type) 

vs_join_type = upper(vs_join_type)
ls_LRF_join = upper(vs_joinstring)
//-- remove left join --//
li_pos1 = pos(ls_LRF_join , vs_join_type)
DO while li_pos1 > 0
	if li_pos1 = 1 then
		li_pos2 = pos(ls_LRF_join, 'JOIN', 9) 
		if li_pos2 = 0 then
			if pos(lower(ls_LRF_join), 'dwh_search' ) > 0 then
				ls_join +=  ' ' + ls_LRF_join 
			end if			
			ls_LRF_join =''
		else
			ls_cutStr = left(ls_LRF_join, li_pos2 - 6)		
			ls_LRF_join = trim( mid(ls_LRF_join, li_pos2 - 6))
			ls_jointype = trim(left(ls_LRF_join,10))+';'
			if pos('LEFT JOIN;RIGHT JOIN;FULL JOIN;',ls_jointype) = 0 then
				ls_LRF_join = trim(mid(ls_LRF_join, 6))
			end if
			if pos(lower(ls_cutStr), 'dwh_search' ) > 0 then
				ls_join +=  ' ' + ls_cutStr 
			end if
		end if
	else
		ls_join += ' ' + mid(ls_LRF_join,1, li_pos1 -1)
		ls_LRF_join = mid(ls_LRF_join, li_pos1)
	end if
	li_pos1 = pos(ls_LRF_join , vs_join_type)
LOOP
ls_join += ' ' + ls_LRF_join

return ls_join
end function

public function string f_remove_lrf_join (string vs_joinstring);
string			ls_join

ls_join = this.f_remove_lrf_join(vs_joinstring , 'LEFT JOIN')
ls_join = this.f_remove_lrf_join(ls_join , 'RIGHT JOIN')
ls_join = this.f_remove_lrf_join(ls_join , 'FULL JOIN')

return ls_join
end function

on c_sql.create
call super::create
TriggerEvent( this, "constructor" )
end on

on c_sql.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

