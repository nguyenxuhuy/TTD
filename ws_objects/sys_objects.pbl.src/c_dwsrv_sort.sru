$PBExportHeader$c_dwsrv_sort.sru
forward
global type c_dwsrv_sort from c_obj_service
end type
end forward

global type c_dwsrv_sort from c_obj_service
event type integer e_doubleclicked ( integer ai_xpos,  integer ai_ypos,  long al_row,  dwobject adwo_obj )
end type

type variables
t_dw_mpl		idw_requestor

Protected:

Boolean  ib_ColumnHeaderArrow = false			// Does the service have to display an arrow in the column header ?
String   	is_HeaderArrowSuffix = "_h"			// Suffix to use when creating arrows in the requestor DW.
Long		il_HeaderArrowColor = 23798792		// Color to use when creating arrows in the requestor DW.
Boolean	ib_ColumnHeaderSort
string		is_DefaultHeaderSuffix = "_t"
String		is_OriginalSort							// Original sort of the requestor DW
int			ii_sort_click
end variables

forward prototypes
public function string f_getsort ()
protected function integer f_createarrows (string as_newsortcolumns[], string as_newsortorders[])
public function integer f_setoriginalsort (string as_sort)
public function string f_getoriginalsort ()
protected function integer f_destroyarrows (string as_oldsortcolumns[])
public function integer f_sort ()
public function integer f_setsort (string as_format)
public function integer f_parsesort (string as_sort, ref string as_columns[], ref string as_orders[])
public function integer f_init ()
protected function integer f_buildnewsort (string as_sortcolumn, boolean ab_multicolumnsort, ref string as_newsortstring)
protected function boolean f_usesdisplayvalue (string as_column)
protected function boolean f_canchangecurrentsort ()
public function integer f_setrequestor (t_dw vdw_requestor)
public function integer f_setrequestor (datawindow vdw_requestor)
end prototypes

event type integer e_doubleclicked(integer ai_xpos, integer ai_ypos, long al_row, dwobject adwo_obj);Boolean	lb_multicolumnsort
String	ls_headername,ls_colname
Integer	li_rc
Integer	li_suffixlen,li_headerlen
String	ls_sortstring

// Get the shift key status
lb_multicolumnsort = KeyDown(KeyControl!)

// Validate the dwo reference.
IF IsNull(adwo_obj) OR NOT IsValid(adwo_obj) THEN Return -1

// Check if the service is set to sort on column headers.
IF NOT ib_ColumnHeaderSort THEN Return 0

// Only valid on header column.
If adwo_obj.Name = 'datawindow' THEN Return 0
IF adwo_obj.Band <> "header" THEN Return 0

// Check if the current sort can be changed
If not f_CanChangeCurrentSort() Then Return 0

// Get column header information.
ls_headername = adwo_obj.Name
li_headerlen = Len(ls_headername)
li_suffixlen = Len(is_defaultheadersuffix)

// Extract the columname from the header label 
// (by taking out the header/arrow suffix).
IF (Right(ls_headername, li_suffixlen) <> is_DefaultHeaderSuffix) &
	And (ib_ColumnHeaderArrow and Right(ls_headername, li_suffixlen) <> is_HeaderArrowSuffix)THEN 
	// Cannot determine the column name from the header.	
	Return -1
END IF 	
ls_colname = Left (ls_headername, li_headerlen - li_suffixlen)

// Validate the column name.
If IsNull(ls_colname) or Len(Trim(ls_colname))=0 Then 
	Return -1
End If

// Build new sort
if ii_sort_click < 3 then ii_sort_click++
li_rc = f_BuildNewSort(ls_colname,lb_multicolumnsort,ls_sortstring)
If li_rc < 0 Then Return li_rc

// If sort is empty, use original sort
If Len(ls_sortstring) = 0 Then ls_sortstring = is_originalsort

// Perform the SetSort operation (check the rc).
li_rc = f_SetSort (ls_sortstring) 
If li_rc < 0 Then Return li_rc

// Perform the actual Sort operation (check the rc).
li_rc = f_Sort()
If li_rc < 0 Then Return li_rc

Return 1

end event

public function string f_getsort ();String	ls_sort

If IsNull(idw_requestor) Or Not IsValid(idw_requestor) Then Return ""

// Get current sort for the datawindow.
ls_sort = idw_requestor.Describe("DataWindow.Table.Sort")

// Check current sort
If ls_sort = "!" or ls_sort = "?" Then ls_sort = ""

// Remove space after the comma(s) (convert ', ' to ',').
ls_sort = f_GlobalReplace(ls_sort,', ',',')

Return ls_sort
end function

protected function integer f_createarrows (string as_newsortcolumns[], string as_newsortorders[]);Integer	li_i,li_max
String	ls_arrow
String	ls_buffer,ls_rc

If IsNull(idw_requestor) or not IsValid(idw_requestor) Then Return -1

If IsNull(as_newsortcolumns) or UpperBound(as_newsortcolumns) = 0 Then Return 0
If IsNull(as_newsortorders) or UpperBound(as_newsortorders) = 0 Then Return 0

li_max = UpperBound(as_newsortcolumns)
For li_i=1 To li_max
	// Choose character depending on the sort order
	If upper(trim(as_newsortorders[li_i])) = "A" or upper(trim(as_newsortorders[li_i])) = "ASC" Then
		ls_arrow = "Ç"
	Else
		ls_arrow = "È"
	End If
	
	// Fill buffer
	ls_buffer = "create text(band=Header color='" + string(il_HeaderArrowColor) + "' alignment='1' border='0' " &
		+ " x='" + idw_requestor.describe(as_newsortcolumns[li_i]+"_t.X") + "'" &
		+ " y='" + idw_requestor.describe(as_newsortcolumns[li_i]+"_t.Y") + "'" &
		+ " height='" + idw_requestor.describe(as_newsortcolumns[li_i] + "_t.Height") + "'" &
		+ " width='" + idw_requestor.describe(as_newsortcolumns[li_i] + "_t.Width")+"' text='" + ls_arrow + "'" &
		+ " name=" + as_newsortcolumns[li_i] + is_HeaderArrowSuffix + " font.face='Wingdings 3' font.height='-9'" &
		+ " font.weight='400' font.family='0' font.pitch='2' font.charset='2' " &
		+ " background.mode='1' background.color='553648127') "

	// Update the requestor DW
	ls_rc = idw_requestor.modify(ls_buffer)
	// Check return value
	If not IsNull(ls_rc) and Len(ls_rc) > 0 Then
		MessageBox("DW Sort service -> f_CreateArrows", "Couldn't create arrow for column ~'" + as_newsortcolumns[li_i] + "~'.~r~n" + ls_rc)
		Return -1
	End If
Next

Return 1
end function

public function integer f_setoriginalsort (string as_sort);If IsNull(as_sort) Then Return -1

is_originalsort = as_sort

Return 1
end function

public function string f_getoriginalsort ();Return is_originalsort
end function

protected function integer f_destroyarrows (string as_oldsortcolumns[]);Integer	li_i,li_max
String	ls_buffer,ls_rc

If IsNull(idw_requestor) or not IsValid(idw_requestor) Then Return -1

If IsNull(as_oldsortcolumns) or UpperBound(as_oldsortcolumns) = 0 Then Return 0

li_max = UpperBound(as_oldsortcolumns)
For li_i=1 To li_max
	// Check if the arrow does exist
	If idw_requestor.describe(as_oldsortcolumns[li_i] + is_HeaderArrowSuffix + ".X") = "!" Then
		Continue
	End If
	
	// Fill buffer
	ls_buffer = "destroy " + as_oldsortcolumns[li_i] + is_HeaderArrowSuffix

	ls_rc = idw_requestor.modify(ls_buffer)

	If not IsNull(ls_rc) and Len(ls_rc) > 0 Then
		MessageBox("DW Sort service -> f_DestroyArrows","Couldn't destroy arrow of column ~'" + as_oldsortcolumns[li_i] + "~'.~r~n" + ls_rc)
		Return -1
	End If
Next

Return 1
end function

public function integer f_sort ();integer	li_rc

li_rc = idw_Requestor.Sort() 

//// Tell the datawindow that the buffer has changed and that the 
//// current row may have new data.
//idw_Requestor.Event pfc_rowchanged() 

Return li_rc
end function

public function integer f_setsort (string as_format);Integer	li_rc, li_i
String	ls_sort, ls_parse, ls_rtn
string 	ls_columns[], ls_order[]
Long		ll_pos

// Check requestor DW is valid
If IsNull(idw_requestor) or not IsValid(idw_requestor) Then Return -1

// If displaying arrows in headers, save old sort
If ib_ColumnHeaderArrow Then
	f_ParseSort(f_GetSort(),ls_columns,ls_order)
End If

// If necessary, destroy Arrows of the old sort
If ib_ColumnHeaderArrow Then
	// Destroy arrows
	f_DestroyArrows(ls_columns)
End If

// Apply new sort
li_rc = idw_requestor.SetSort (as_format) 
//ls_rtn = idw_requestor.modify("DataWindow.Table.Sort= '"+as_format +"'")
// Check if SetSort operation was done properly
//If ls_rtn <> '' Then Return -1

// If necessary, create Arrows for the new sort
If ib_ColumnHeaderArrow Then
	// Get new sort
	f_ParseSort(as_format,ls_columns,ls_order)
	// Create arrows
	f_CreateArrows(ls_columns, ls_order)
End If

Return 1

end function

public function integer f_parsesort (string as_sort, ref string as_columns[], ref string as_orders[]);int li_i
string ls_parse, ls_empty[]
long ll_pos

as_columns = ls_empty
as_orders = ls_empty
f_StringToArray ( as_sort, ",", as_columns )

// Loop around all array entries.
FOR li_i = 1 to UpperBound ( as_columns )
	ls_parse = trim(as_columns[li_i])
	
	// Remove the LookUpDisplay function if it was used in the sort.
	If Pos(Lower(ls_parse), Lower("LookUpDisplay(")) > 0 Then
		ls_parse = f_GlobalReplace ( ls_parse, "LookUpDisplay(", "" ) 
		ls_parse = f_GlobalReplace ( ls_parse, ")", "" ) 
		ls_parse = Trim ( ls_parse ) 
	End If
	
	ll_pos = Pos(ls_parse, ' ')	
	if ll_pos = 0 then
		as_columns[li_i] = ls_parse
		as_orders[li_i] = ''
	else
		as_columns[li_i] = Mid(ls_parse, 1, ll_pos - 1)
		as_orders[li_i] = Mid(ls_parse, ll_pos + 1)
	end if

NEXT 
Return 1
end function

public function integer f_init ();string ls_sort

If idw_requestor.dynamic f_IsGrid() Then
	ib_ColumnHeaderSort = true
	ib_ColumnHeaderArrow = true
End If
	
	
// Save the original sort of the DW
ls_sort = f_GetSort()
f_SetOriginalSort(ls_sort)

// Load the default sort of the sort DW
f_SetSort(ls_sort)

Return 1

end function

protected function integer f_buildnewsort (string as_sortcolumn, boolean ab_multicolumnsort, ref string as_newsortstring);String	ls_oldsortcolumns[],ls_oldsortorders[]
String	ls_newsortcolumns[],ls_newsortorders[], ls_sortstring
Integer	li_i,li_max,li_sortcolumns_count
boolean	lb_found

// Check arguments
If IsNull(as_sortcolumn) or Len(as_sortcolumn) = 0 Then Return -1
If IsNull(ab_multicolumnsort) Then Return -1

if ii_sort_click = 3 then
	ii_sort_click = 0
	as_newsortstring = ''
	return 1
end if
// Parse current sort
If f_ParseSort(f_GetSort(),ls_oldsortcolumns,ls_oldsortorders) <> 1 Then Return 1

// Check if single or multi column sort
If not ab_multicolumnsort Then
	// Single column sort
	
	// Check the previous sort is a single column sort
	If UpperBound(ls_oldsortcolumns) = 1 Then
		// Check previous sort column
		If ls_oldsortcolumns[1] = as_sortcolumn Then
			// Change sort order if column is the same
			// (if descending order then remove column from the sort)
			If upper(ls_oldsortorders[1])  = "A" or upper(ls_oldsortorders[1]) = 'ASC' Then
				ls_newsortcolumns[1] = as_sortcolumn
				ls_newsortorders[1] = "D"
			else
				ls_newsortcolumns[1] = as_sortcolumn
				ls_newsortorders[1] = "A"
			End If
		Else
			// Define new sort
			ls_newsortcolumns[1] = as_sortcolumn
			ls_newsortorders[1] = "A"
		End If
	Else
		// Define new sort
		ls_newsortcolumns[1] = as_sortcolumn
		FOR li_i = 1 to UpperBound(ls_oldsortcolumns)
			if  ls_oldsortcolumns[li_i] = as_sortcolumn Then
				if isnull(ls_oldsortorders[li_i]) or (upper(ls_oldsortorders[li_i])<> "A" and upper(ls_oldsortorders[li_i]) <> "ASC" and upper(ls_oldsortorders[1]) <> "ASC A" ) then	
					ls_newsortorders[1] = "A"
				else
					ls_newsortorders[1] = "D"
				end if	
				lb_found=true
				exit
			end if
		NEXT
		if not lb_found then
			ls_newsortorders[1] = "A"
		end if
	End If
Else
	// Multi columns sort
	
	// Get number of columns used in the current sort
	li_max = UpperBound(ls_oldsortcolumns)
	
	// Loop on sort columns
	For li_i=1 To li_max
		If ls_oldsortcolumns[li_i] = as_sortcolumn Then
			Exit
		Else
			// Copy other sort columns
			li_sortcolumns_count ++
			ls_newsortcolumns[li_sortcolumns_count] = ls_oldsortcolumns[li_i]
			ls_newsortorders[li_sortcolumns_count] = ls_oldsortorders[li_i]
		End If
	Next
	
	// Check if column was found
	If li_i <= li_max Then
		// Change sort order :
		//	If ascending -> descending
		// If descending -> remove column from sort
		If ls_oldsortorders[li_i] = "A" Then
			li_sortcolumns_count ++
			ls_newsortcolumns[li_sortcolumns_count] = as_sortcolumn
			ls_newsortorders[li_sortcolumns_count] = "D"
		End If
		// Copy remaining sort columns
		For li_i = li_i + 1 To li_max
			li_sortcolumns_count ++
			ls_newsortcolumns[li_sortcolumns_count] = ls_oldsortcolumns[li_i]
			ls_newsortorders[li_sortcolumns_count] = ls_oldsortorders[li_i]
		Next
	Else	
		// Add the column to the sort
		li_sortcolumns_count ++
		ls_newsortcolumns[li_sortcolumns_count] = as_sortcolumn
		ls_newsortorders[li_sortcolumns_count] = "A"
	End If
End If

// Reset sort string
ls_sortstring = ""

// Get updated number of sort columns
li_max = UpperBound(ls_newsortcolumns)

// Loop on the sort columns to build the sort string
For li_i = 1 To li_max
	If not IsNull(ls_newsortcolumns[li_i]) and Len(ls_newsortcolumns[li_i]) > 0 Then
		If li_i > 1 Then ls_sortstring += ", "
		If f_UsesDisplayValue(ls_newsortcolumns[li_i]) Then
			ls_sortstring += "LookUpDisplay(" + ls_newsortcolumns[li_i] + ") " + " " + ls_newsortorders[li_i] 
		Else
			ls_sortstring += ls_newsortcolumns[li_i] + " " + ls_newsortorders[li_i]
		End If
	End If
Next

// Return the new sort string
as_newsortstring = ls_sortstring

Return 1

end function

protected function boolean f_usesdisplayvalue (string as_column);string			ls_editstyle
string			ls_codetable

// Check parameters.
If IsNull(as_column) or Len(Trim(as_column))=0 Then Return False

ls_editstyle = Lower(idw_Requestor.Describe (as_column + ".Edit.Style"))
ls_codetable = Lower(idw_Requestor.Describe (as_column + "." + ls_editstyle + ".CodeTable"))

IF ls_editstyle = 'dddw' or ls_editstyle = 'ddlb' or ls_codetable = 'yes' THEN
	Return True
END IF

Return False

end function

protected function boolean f_canchangecurrentsort ();dwItemStatus ldw_status

// Check sort DW is valid
If IsNull(idw_requestor) or not IsValid(idw_requestor) Then Return false

ldw_status = idw_requestor.GetItemStatus(idw_requestor.GetRow(), 0, primary!)
If ldw_status <> NotModified!	Then Return false

Return true

end function

public function integer f_setrequestor (t_dw vdw_requestor);If IsNull(vdw_requestor) or Not IsValid(vdw_requestor) Then
	Return -1
End If

idw_Requestor = vdw_requestor
Return 1
end function

public function integer f_setrequestor (datawindow vdw_requestor);If IsNull(vdw_requestor) or Not IsValid(vdw_requestor) Then
	Return -1
End If

idw_Requestor = vdw_requestor
Return 1
end function

on c_dwsrv_sort.create
call super::create
end on

on c_dwsrv_sort.destroy
call super::destroy
end on

