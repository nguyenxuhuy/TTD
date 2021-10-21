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
public function integer f_cleanupxlssheet (datawindow adw_requestor, string as_pathname, integer ai_sheet_index)
public function integer f_cleanupxlssheet (datawindow adw_requestor, string as_pathname)
public function integer f_create_xlssheet (datawindow adw_requestor, string as_pathname, integer ai_sheet_index)
end prototypes

public function integer f_init ();String	ls_value, ls_version
Integer	li_rc
Boolean	lb_displaymessage

// Check if Excel functionalities are available
li_rc = RegistryGet("HKEY_CLASSES_ROOT\Excel.Application\CurVer","",RegString!,ls_value)
ls_version = Mid(ls_value, LastPos(ls_value, '.') + 1)
is_excel_version = ls_version
If li_rc <> 1 or Pos('7,8,9,10,11,12', ls_version)= 0 Then
	//gf_messagebox('msg_KhongTheMoExcel')
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

on c_uo_excel.create
call super::create
TriggerEvent( this, "constructor" )
end on

on c_uo_excel.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

