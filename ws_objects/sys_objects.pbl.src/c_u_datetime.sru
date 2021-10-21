$PBExportHeader$c_u_datetime.sru
forward
global type c_u_datetime from nonvisualobject
end type
end forward

global type c_u_datetime from nonvisualobject
end type
global c_u_datetime c_u_datetime

type variables
Public:

// Define constants for date formats
Constant Integer FORMAT_INTERNAL = 1		// YYYY-MM-DD is internal format (regional settings independent)
Constant Integer FORMAT_DDMMYY = 2
Constant Integer FORMAT_DDMMYYYY = 3
Constant Integer FORMAT_DMYY = 4
Constant Integer FORMAT_DMYYYY = 5
Constant Integer FORMAT_DEFAULT = FORMAT_INTERNAL

Protected:

String	is_date_separator			// Date separator character
String	is_time_separator			// Time separator character
String	is_date_format				// Control panel's Date format
String	is_time_format				// Control panel's Time format

end variables

forward prototypes
protected function datetime f_getsysdate ()
public function time f_now ()
public function date f_today ()
public function datetime f_todaynow ()
public function boolean f_isvalid (ref string as_date, integer ai_format)
public function boolean f_isvalid (ref string as_date)
end prototypes

protected function datetime f_getsysdate ();Datetime	ldtm_sysdate

// Get system date & time of the server
Select sysdate
  into :ldtm_sysdate
  from dual
 using SQLCA;

// Check for error
If SQLCA.SQLcode <> 0 Then
	// Set date to an error value
	ldtm_sysdate = DateTime(Date(1900,1,1))
End If

Return ldtm_sysdate

end function

public function time f_now ();Return Time(f_GetSysDate())

end function

public function date f_today ();Return Date(f_GetSysDate())

end function

public function datetime f_todaynow ();Return f_GetSysDate()

end function

public function boolean f_isvalid (ref string as_date, integer ai_format);Date		ldt_today
Integer	li_year,li_month,li_day
String	ls_year,ls_month,ls_day,ls_test
Integer	li_slash1,li_slash2
Long		ll_pos_hour

// Check the arguments
If IsNull(as_date) or Len(as_date) = 0 Then Return False
If IsNull(ai_format) or ai_format <= 0 or ai_format > 5 Then Return False

// Check if the data contains the hour
ll_pos_hour = Pos(as_date," ")

// Remove hour part if necessary
If ll_pos_hour > 0 Then
	as_date = Left(as_date,ll_pos_hour -1)
End If

// Basic pattern testing for complete date with correct format
If (ai_format = FORMAT_INTERNAL and Match(as_date,"^[0-9][0-9][0-9][0-9]-[0-1][0-9]-[0-3][0-9]$")) &
	or (ai_format = FORMAT_DDMMYY and Match(as_date,"^[0-3][0-9]/[0-1][0-9]/[0-9][0-9]$")) &
	or (ai_format = FORMAT_DDMMYYYY and Match(as_date,"^[0-3][0-9]/[0-1][0-9]/[0-9][0-9][0-9][0-9]$")) &
	or (ai_format = FORMAT_DMYY and Match(as_date,"^[0-3]?[0-9]/[0-1]?[0-9]/[0-9][0-9]$")) &
	or (ai_format = FORMAT_DMYYYY and Match(as_date,"^[0-3]?[0-9]/[0-1]?[0-9]/[0-9][0-9][0-9][0-9]$")) Then
	
	// Don't need to go further
	Return (Date(as_date) <> Date(1900,1,1))
End If

// Get current date
ldt_today = f_Today()
// Check for error ...
If ldt_today = Date(1900,1,1) Then Return false

// Try getting year, month & day from the passed string.
li_slash1 = Pos(as_date,"/")
If li_slash1 > 0 Then
	li_slash2 = Pos(as_date,"/",li_slash1 +1)
End If
If li_slash1 > 0 Then
	ls_day = Mid(as_date,1,li_slash1 -1)
	If li_slash2 > 0 Then
		ls_month = Mid(as_date,li_slash1 +1,li_slash2 - li_slash1 -1)
		ls_year = Mid(as_date,li_slash2 +1)
	Else
		ls_month = Mid(as_date,li_slash1 +1)
		ls_year = ""
	End If
Else
	ls_day = as_date
End If

// Check if found values are correct.
// Complete with current values if necessary.
If not IsNull(ls_day) and IsNumber(ls_day) &
	and Integer(ls_day) >= 1 and Integer(ls_day) <= 31 Then
	// Day is ok
	li_day = Integer(ls_day)
Else
	// Reject passed string
	Return False
End If

If not IsNull(ls_month) and IsNumber(ls_month) Then
	If Integer(ls_month) >= 1 and Integer(ls_month) <= 12 Then
		// Month is ok
		li_month = Integer(ls_month)
	Else
		// Reject passed string
		Return false
	End If
Else
	// Use current month
	li_month = Month(ldt_today)
End If

If not IsNull(ls_year) and IsNumber(ls_year) Then
	// Year is ok
	li_year = Integer(ls_year)	
Else
	// Use current year
	li_year = Year(ldt_today)
End If

// Make sure the year is four digits
If li_year < 50 Then li_year += 2000
If li_year <= 99 Then li_year += 1900

// Prepare date variable
as_date = ""

// Build the date in the adequate date format
Choose Case ai_format
	Case FORMAT_INTERNAL
		as_date = String(li_year) + "-"
		If li_month < 10 Then as_date += "0"
		as_date += String(li_month) + "-"
		If li_day < 10 Then as_date += "0"
		as_date += String(li_day)
		
		// Set the test variable
		ls_test = as_date
		
	Case FORMAT_DDMMYY,FORMAT_DMYY
		If ai_format = FORMAT_DDMMYY and li_day < 10 Then as_date = "0"
		as_date += String(li_day) + "/"
		If ai_format = FORMAT_DDMMYY and li_month < 10 Then as_date += "0"
		as_date += String(li_month) + "/"
		If Mod(li_year,100) < 10 Then as_date += "0"
		as_date += String(Mod(li_year,100))
		
		// Set the test variable
		ls_test = String(li_year) + "-" + String(li_month) + "-" + String(li_day)
	
	Case FORMAT_DDMMYYYY,FORMAT_DMYYYY
		If ai_format = FORMAT_DDMMYYYY and li_day < 10 Then as_date = "0"
		as_date += String(li_day) + "/"
		If ai_format = FORMAT_DDMMYYYY and li_month < 10 Then as_date += "0"
		as_date += String(li_month) + "/"
		as_date += String(li_year)
		
		// Set the test variable
		ls_test = String(li_year) + "-" + String(li_month) + "-" + String(li_day)
		
End Choose

// Last test ...
Return (Date(ls_test) <> Date(1900,1,1))

end function

public function boolean f_isvalid (ref string as_date);// Check date with default format
Return f_IsValid(as_date,FORMAT_DEFAULT)

end function

on c_u_datetime.create
call super::create
TriggerEvent( this, "constructor" )
end on

on c_u_datetime.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;String	ls_value

// Get short date format from the registry
If RegistryGet("HKEY_CURRENT_USER\Control Panel\International","SShortDate",RegString!, ls_value) <> 1 Then
	// Use default value
	ls_value = "d/m/yyyy"
End If

// Save date format
is_date_format = lower(ls_value)

// Get date separator from the registry
If RegistryGet("HKEY_CURRENT_USER\Control Panel\International","SDate",RegString!, ls_value) <> 1 Then
	// Use default value
	ls_value = "/"
End If

// Save date separator
is_date_separator = lower(ls_value)

// Get time format from the registry
If RegistryGet("HKEY_CURRENT_USER\Control Panel\International","STimeFormat",RegString!, ls_value) <> 1 Then
	// Use default value
	ls_value = "h:mm:ss"
End If

// Save time format
is_time_format = lower(ls_value)


// Get time separator from the registry
If RegistryGet("HKEY_CURRENT_USER\Control Panel\International","STime",RegString!, ls_value) <> 1 Then
	// Use default value
	ls_value = ":"
End If

// Save time separator
is_time_separator = lower(ls_value)

end event

