$PBExportHeader$c_uo_excel.sru
forward
global type c_uo_excel from nonvisualobject
end type
end forward

global type c_uo_excel from nonvisualobject
end type
global c_uo_excel c_uo_excel

type variables
string is_excel_version
Protected:

OLEObject	ioo_excel, ioo_sheet
Boolean		ib_ExcelActivated

end variables

forward prototypes
public function integer f_init ()
private function string f_getexcelcolumn (integer ai_column)
public function integer f_cleanupxlssheet (t_dw adw_requestor, string as_pathname, integer ai_sheet_index)
public function integer f_cleanupxlssheet (t_dw adw_requestor, string as_pathname)
public function integer f_create_xlssheet (t_dw adw_requestor, string as_pathname, integer ai_sheet_index)
end prototypes

public function integer f_init ();String	ls_value, ls_version
Integer	li_rc
Boolean	lb_displaymessage

// Check if Excel functionalities are available
li_rc = RegistryGet("HKEY_CLASSES_ROOT\Excel.Application\CurVer","",RegString!,ls_value)
ls_version = Mid(ls_value, LastPos(ls_value, '.') + 1)
is_excel_version = ls_version
If li_rc <> 1 or Pos('7,8,9,10,11,12', ls_version)= 0 Then
//	gf_messagebox('msg_KhongTheMoExcel')
	Return -1
End If

// Activate Excel functionalities
ib_ExcelActivated = true

Return 1

end function

private function string f_getexcelcolumn (integer ai_column);String	ls_null,ls_col
Integer	li_max,li_min

// Prepare a null value
SetNull(ls_null)

// Check argument
If IsNull(ai_column) or ai_column <= 0 Then Return ls_null

// Get the whole part and the rest of the division
// of the column number by 26 
li_max = Int((ai_column -1) / 26)
li_min = Mod(ai_column,26)

// See if there are 2 letters in the column header
If li_max >= 1 then
	ls_col = char(64 + li_max)
Else
	ls_col = ""
End If

// Manage special cases
If li_min = 0 Then li_min = 26

// Build Excel-style column notation
ls_col += string(char(64 + li_min))

Return ls_col
end function

public function integer f_cleanupxlssheet (t_dw adw_requestor, string as_pathname, integer ai_sheet_index);String		ls_columns[],ls_col,ls_visible
Integer		li_rc,li_i,li_count
Integer		li_column,li_remaining
Any			la_value

// Check Excel functionalities are activated
If not ib_ExcelActivated Then Return -1

// Change pointer
SetPointer(Hourglass!)

// Check arguments
If IsNull(adw_requestor) or not IsValid(adw_requestor) Then Return -1
If IsNull(as_pathname) or Len(as_pathname) = 0 Then Return -1
If ai_sheet_index <= 0 Then Return -1

// Check file does exist
If not FileExists(as_pathname) Then Return -1

// Bypass processing if DW is not a grid
//If not adw_requestor.f_IsGrid() Then Return 1

// Create a new OLE object
ioo_excel = create OLEObject

Try
	Exception e
	
	// Create a generic exception
	e = create Exception
	
	// Connect to Excel COM Object
	li_rc = ioo_excel.ConnectToNewObject("Excel.Application")
	If li_rc <> 0 Then Throw e
	
	// Open file with Excel
	ioo_excel.Workbooks.Open(as_pathname)
	
	// Get a reference to the active sheet
	ioo_sheet = ioo_excel.Application.ActiveWorkbook.WorkSheets[ai_sheet_index]
	
	// Get requestor DW's columns
	li_count = adw_requestor.f_GetObjects(ls_columns,"column","*",false)
	li_remaining = li_count
	
	// Loop on DW's columns
	// (from the last one to the first one)
	For li_i=li_count To 1 Step -1
		// Get id of the column
		li_column = Long(adw_requestor.describe(ls_columns[li_i] + ".ID"))
		
		// Check if column is visible		
		ls_visible = adw_requestor.describe(ls_columns[li_i] + ".Visible")
		If ls_visible <> "1" Then
			// Decrement remaining columns counter
			li_remaining --
			
			// Get column in the Excel-style notation
			ls_col = f_GetExcelColumn(li_column)
			If IsNull(ls_col) Then continue
			
			// Remove this column in the Excel file
			ioo_sheet.Columns(ls_col + ":" + ls_col).EntireColumn.Delete()
		Else
			// Set column label as in the requestor DW
			ioo_sheet.Cells[1,li_column] = adw_requestor.describe(ls_columns[li_i] + "_t.Text")
		End If
	Next
	
	// Get last column
	ls_col = f_GetExcelColumn(li_remaining)
	If not IsNull(ls_col) Then
		// Set column headers in bold
		ioo_sheet.Range("A1:" + ls_col + "1").Select
		ioo_excel.Selection.Font.Bold = true
	End If
	
	// Auto-size columns widths
	ioo_sheet.Range("A1:A1").Select
	ioo_excel.Columns("A:" + ls_col).EntireColumn.AutoFit
	
	// Save modifications in file
	ioo_excel.Application.ActiveWorkbook.Save()
	
	// Stop Excel
	ioo_excel.Application.Quit()
	
Catch (Exception error)
	Return -1
	
Catch (OLERuntimeError oleerror)
	Return -1
	
Catch (Throwable other)
	// Propagate error
	Throw other
	
Finally
	// Disconnect OLE objects
	ioo_sheet.DisconnectObject()
	ioo_excel.DisconnectObject()
	
	// Destroy OLE objects
	Destroy ioo_sheet
	Destroy ioo_excel
End Try

Return 1

end function

public function integer f_cleanupxlssheet (t_dw adw_requestor, string as_pathname);Return f_CleanupXLSSheet(adw_requestor,as_pathname,1)
end function

public function integer f_create_xlssheet (t_dw adw_requestor, string as_pathname, integer ai_sheet_index);String		ls_columns[],ls_col,ls_coltype, lsa_grpcols[], lsa2_rowcol[50000,100], lsa2_rowcol_null[50000,100]
Integer		li_rc,li_i,li_count, ll_j
Integer		li_column, li_no_of_grp, li_insert_cols = 0, li_grp_idx
Any			la_value
long ll_rows
// Check Excel functionalities are activated
If not ib_ExcelActivated Then Return -1

// Change pointer
SetPointer(Hourglass!)

// Check arguments
If IsNull(adw_requestor) or not IsValid(adw_requestor) Then Return -1
If IsNull(as_pathname) or Len(as_pathname) = 0 Then Return -1
If ai_sheet_index <= 0 Then Return -1

// Check file does exist
//If not FileExists(as_pathname) Then Return -1

// Bypass processing if DW is not a grid
//If not adw_requestor.f_IsGrid() Then Return 1

// Create a new OLE object
ioo_excel = create OLEObject

Try
	Exception e
	
	// Create a generic exception
	e = create Exception
	
	// Connect to Excel COM Object
	li_rc = ioo_excel.ConnectToNewObject("Excel.Application")
	If li_rc <> 0 Then Throw e
	
	// Open file with Excel
	ioo_excel.Workbooks.Open(as_pathname)
	
	// Get a reference to the active sheet
	ioo_sheet = ioo_excel.Application.ActiveWorkbook.WorkSheets[ai_sheet_index]
	
	// Remove this column in the Excel file
	ioo_sheet.Columns("A:ZZ").EntireColumn.Delete()
			
	ll_rows = adw_requestor.rowcount()
	li_column = adw_requestor.f_get_visiblecolumns(ls_columns)
	
	// insert report title
	string lsa_obj_name[]
	adw_requestor.f_getobjects(lsa_obj_name,'Text','header','title')
	if upperbound(lsa_obj_name) > 0 then
		ioo_sheet.Cells[3, 1] =adw_requestor.describe(lsa_obj_name[1]+'.text')
	end if
	FOR li_i = 1 to ll_rows
		// insert header
		if li_i = 1 then
			li_insert_cols = 0
			FOR li_count = 1 to upperbound(ls_columns)
				// insert company name
				if lower(adw_requestor.describe(ls_columns[li_count]+'.tag')) = 'co' then
					ioo_sheet.Cells[1, 1] =adw_requestor.describe(ls_columns[li_count]+'_t.text')
					ioo_sheet.Cells[1, 2] = adw_requestor.f_getitemany(li_i, ls_columns[li_count] )
					continue
				end if
				// insert address
				if lower(adw_requestor.describe(ls_columns[li_count]+'.tag')) = 'add' then
					ioo_sheet.Cells[2, 1] =adw_requestor.describe(ls_columns[li_count]+'_t.text')
					ioo_sheet.Cells[2, 2] = adw_requestor.f_getitemany(li_i, ls_columns[li_count])
					continue
				end if

				// insert report date
				if lower(adw_requestor.describe(ls_columns[li_count]+'.tag')) = 'dt' then
					ioo_sheet.Cells[4, 1] =adw_requestor.getitemstring(1, ls_columns[li_count])
					ioo_sheet.Cells[4, 1].select
					ioo_excel.Selection.Font.Bold = true
					continue
				end if			
				// insert report header field
				int li_hdr_cnt = 0
				if lower(adw_requestor.describe(ls_columns[li_count]+'.tag')) = 'hdr' then
					li_hdr_cnt++
					if adw_requestor.describe(ls_columns[li_count]+'_t.text') <> '!' and adw_requestor.describe(ls_columns[li_count]+'_t.text') <> '?' then
						ioo_sheet.Cells[5, li_hdr_cnt] =adw_requestor.describe(ls_columns[li_count]+'_t.text')
						ioo_sheet.Cells[5, li_hdr_cnt + 1] =adw_requestor.getitemstring(1, ls_columns[li_count])
					else
						ioo_sheet.Cells[5, li_hdr_cnt ] =adw_requestor.getitemstring(1, ls_columns[li_count])
					end if
					
					continue
				end if							
				// copy tieu de
				li_insert_cols ++
				ioo_sheet.Cells[7, li_insert_cols] = adw_requestor.describe(ls_columns[li_count] + "_t.Text")
			NEXT
		end if
		//-- insert data of group and detail band --//
		li_insert_cols= 0
		For ll_j =1 To li_column 
			if lower(adw_requestor.describe(ls_columns[ll_j]+'.tag')) = 'co' then continue
			if lower(adw_requestor.describe(ls_columns[ll_j]+'.tag')) = 'add' then continue
			if lower(adw_requestor.describe(ls_columns[ll_j]+'.tag')) = 'dt' then continue
			if lower(adw_requestor.describe(ls_columns[ll_j]+'.tag')) = 'hdr' then continue
			li_insert_cols++
			ls_coltype = lower(adw_requestor.describe(ls_columns[ll_j] + ".coltype"))
			if ls_coltype = 'datetime' then
				ioo_sheet.Cells[li_i +7 ,li_insert_cols] = string(adw_requestor.getitemdatetime(li_i, ls_columns[ll_j] ), 'dd/mm/yyyy')
			else
				ioo_sheet.Cells[li_i +7 ,li_insert_cols] = adw_requestor.f_getitemany(li_i, ls_columns[ll_j] )
			end if
		Next
	NEXT
	
	
	// Get last column
	ls_col = f_GetExcelColumn(li_insert_cols)
	If not IsNull(ls_col) Then
		// Set row headers in bold
		ioo_sheet.Range("A6:" + ls_col + "1").Select
		ioo_excel.Selection.Font.Bold = true
	End If
	
	// Auto-size columns widths
	ioo_sheet.Range("A1:A1").Select
	ioo_excel.Columns("A:" + ls_col).EntireColumn.AutoFit
	
	// Save modifications in file
	ioo_excel.Application.ActiveWorkbook.Save()
	ioo_excel.Application.ActiveWorkbook.close()
	// Stop Excel
	ioo_excel.Application.close()
	ioo_excel.Application.Quit()
	
Catch (Exception error)
	Return -1
	
Catch (OLERuntimeError oleerror)
	Return -1
	
Catch (Throwable other)
	// Propagate error
	Throw other
	
Finally
	// Disconnect OLE objects
	ioo_sheet.DisconnectObject()
	ioo_excel.DisconnectObject()

	// Destroy OLE objects
	Destroy ioo_sheet
	Destroy ioo_excel
End Try

Return 1

end function

on c_uo_excel.create
call super::create
TriggerEvent( this, "constructor" )
end on

on c_uo_excel.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

