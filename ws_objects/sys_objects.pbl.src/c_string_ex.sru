$PBExportHeader$c_string_ex.sru
forward
global type c_string_ex from nonvisualobject
end type
end forward

global type c_string_ex from nonvisualobject
end type
global c_string_ex c_string_ex

forward prototypes
public function long f_parsetoarray (string as_source, string as_delimiter, ref string as_array[])
public function string f_padleft (string as_source, long al_length)
public function string f_padright (string as_source, long al_length)
public function boolean f_islower (string as_source)
public function boolean f_isupper (string as_source)
public function boolean f_iswhitespace (string as_source)
public function boolean f_isalpha (string as_source)
public function boolean f_isalphanum (string as_source)
public function string f_quote (string as_source)
public function boolean f_isspace (string as_source)
public function boolean f_ispunctuation (string as_source)
public function long f_lastpos (string as_source, string as_target, long al_start)
public function long f_lastpos (string as_source, string as_target)
public function string f_globalreplace (string as_source, string as_old, string as_new, boolean ab_ignorecase)
public function string f_globalreplace (string as_source, string as_old, string as_new)
public function long f_countoccurrences (string as_source, string as_target, boolean ab_ignorecase)
public function string f_righttrim (string as_source)
public function string f_lefttrim (string as_source)
public function string f_lefttrim (string as_source, boolean ab_remove_spaces)
public function string f_lefttrim (string as_source, boolean ab_remove_spaces, boolean ab_remove_nonprint)
public function string f_righttrim (string as_source, boolean ab_remove_spaces)
public function string f_righttrim (string as_source, boolean ab_remove_spaces, boolean ab_remove_nonprint)
public function string f_trim (string as_source)
public function string f_trim (string as_source, boolean ab_remove_spaces)
public function string f_trim (string as_source, boolean ab_remove_spaces, boolean ab_remove_nonprint)
public function string f_getkeyvalue (string as_source, string as_keyword, string as_separator)
public function integer f_setkeyvalue (ref string as_source, string as_keyword, string as_keyvalue, string as_separator)
public function string f_removenonprint (string as_source)
public function boolean f_isempty (string as_source)
public function boolean f_isprintable (string as_source)
public function boolean f_isformat (string as_source)
public function string f_removewhitespace (string as_source)
public function boolean f_IsComparisonOperator (string as_source)
public function boolean f_IsArithmeticOperator (string as_source)
public function long f_countoccurrences (string as_source, string as_target)
public function long f_arraytostring (string as_source[], string as_delimiter, ref string as_ref_string)
public function long f_arraytostring (string as_source[], string as_delimiter, boolean ab_processempty, ref string as_ref_string)
public function string f_wordcap (string as_source)
public function integer f_check_email (string vs_email)
public function long f_stringtoarray (string as_source, string as_delimiter, ref string as_array[])
public function long f_pos (string vs_source, string vs_target, integer vi_occurrence)
public function string f_gettoken (ref string as_source, string as_separator)
public function string f_getfirsttoken (string as_source, string as_separator)
public function integer f_globalreplace (string as_source, string as_old, string as_new, boolean ab_ignorecase, ref string as_target)
public function integer f_globalreplace (string as_source, string as_old, string as_new, ref string as_target)
public function string f_compare_expression_one_char (string vs_data, ref string rs_expression, ref string rs_data)
public function string f_compare_expression_two_char (string vs_data, ref string rs_expression, ref string rs_data)
public function string f_compare_expression_in_or_between (string vs_data, ref string rs_expression, ref string rs_data)
public function string f_get_expression (string vs_data, string vs_coltype, string vs_colname, string vs_build_type)
public function string f_get_data_number (string vs_data)
public function boolean f_check_data_number (string vs_data)
public function string f_get_data_sysdate (string vs_data)
public function string f_check_type_char (ref string rs_conv, ref string rs_conv2, ref string rs_conv3, ref string rs_mat_reg, string vs_data, string vs_build_type)
public function string f_get_date_spec (string vs_data, string vs_expression, string vs_build_type, string vs_colname)
public function string f_get_date_in_between (string vs_data, string vs_fomat, string vs_build_type)
public function string f_get_date_stand (string vs_build_type)
public function string f_get_data_char (string vs_data, string vs_colname, string vs_build_type)
public function string f_get_char_in_between (string vs_data, string vs_colname, string vs_expression, string vs_build_type)
public function string f_conver_data_pb_to_ora (string vs_data)
public function string f_get_data_datet (string vs_data, string vs_colname, string vs_build_type)
public function long f_arraytostring (double adb_source[], string as_delimiter, boolean ab_processempty, ref string as_ref_string)
public function long f_arraytostring (double adb_source[], string as_delimiter, ref string as_ref_string)
public function string f_get_data_ddlb (string vs_data_source, string vs_colname, window vdw_handling)
public function string f_remove_doublewhitespace (string as_source)
public function string f_removesqlwhitespace (string as_source)
public function boolean f_isspecialchar (string as_source)
public function string f_removespecialchar (string as_source)
public function long f_arraytostring (date ad_source[], string as_delimiter, boolean ab_processempty, ref string as_ref_string)
public function long f_arraytostring (date ad_source[], string as_delimiter, ref string as_ref_string)
public function string f_convert_abc2uni (string str)
public function string f_convert_abc2unsign (string str)
public function long f_find_item (string as_source[], string as_item)
public function string f_convert_uni2abc (string str)
public function string f_convert_uni2unsign (string str)
public function string f_convert_uni2vni (string str)
public function string f_convert_vni2uni (string str)
public function string f_convert_vni2unsign (string str)
public function string f_get_cur_name (string vs_cur_code, boolean vb_aft_dot)
public function string f_readnumber_eng (integer vi_number, string vs_cur_code)
public function string f_readnumber (integer vi_number, string vs_cur_code)
public function integer f_find_item_pos (string as_source[], string as_item)
public function long f_stringtoarray (string as_source, string as_delimiter, ref string as_array[], boolean vb_expend)
public function string f_convert_name (string vs_name)
public function string f_replace_specchar_htlfcr (string as_source)
public function string f_globalreplace (string as_source, string as_old, string as_new, boolean ab_ignorecase, integer ai_s_pos, integer ai_e_pos)
public function string f_globalreplace (string as_source, string as_old, string as_new, integer ai_s_pos, integer ai_e_pos)
public function string f_check_type_datet (ref string rs_conv, ref string rs_conv2, ref string rs_conv3, ref string rs_mat_reg, ref string rs_fomat, string vs_build_type)
public function long f_pos_ex (string vs_source, string vs_target, integer vi_occurrence, ref t_transaction rt_transaction)
public function long f_pos_ex (string vs_source, string vs_target, integer vi_occurrence)
end prototypes

public function long f_parsetoarray (string as_source, string as_delimiter, ref string as_array[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  f_ParseToArray
//
//	Access:  public
//
//	Arguments:
//	as_Source   The string to parse.
//	as_Delimiter   The delimeter string.
//	as_Array[]   The array to be filled with the parsed strings, passed by reference.
//
//	Returns:  long
//	The number of elements in the array.
//	If as_Source or as_Delimeter is NULL, function returns NULL.
//
//	Description:  Parse a string into array elements using a delimeter string.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.02   Fixed problem when delimiter is last character of string.

//	   Ref array and return code gave incorrect results.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

long		ll_DelLen, ll_Pos, ll_Count, ll_Start, ll_Length
string 	ls_holder

//Check for NULL
IF IsNull(as_source) or IsNull(as_delimiter) Then
	long ll_null
	SetNull(ll_null)
	Return ll_null
End If

//Check for at leat one entry
If Trim (as_source) = '' Then
	Return 0
End If

//Get the length of the delimeter
ll_DelLen = Len(as_Delimiter)

ll_Pos =  Pos(Upper(as_source), Upper(as_Delimiter))

//Only one entry was found
if ll_Pos = 0 then
	as_Array[1] = as_source
	return 1
end if

//More than one entry was found - loop to get all of them
ll_Count = 0
ll_Start = 1
Do While ll_Pos > 0
	
	//Set current entry
	ll_Length = ll_Pos - ll_Start
	ls_holder = Mid (as_source, ll_start, ll_length)

	// Update array and counter
	ll_Count ++
	as_Array[ll_Count] = ls_holder
	
	//Set the new starting position
	ll_Start = ll_Pos + ll_DelLen

	ll_Pos =  Pos(Upper(as_source), Upper(as_Delimiter), ll_Start)
Loop

//Set last entry
ls_holder = Mid (as_source, ll_start, Len (as_source))

// Update array and counter if necessary
if Len (ls_holder) > 0 then
	ll_count++
	as_Array[ll_Count] = ls_holder
end if

//Return the number of entries found
Return ll_Count

end function

public function string f_padleft (string as_source, long al_length);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_PadLeft
//
//	Access:  		public
//
//	Arguments:
//	as_Source		The string being searched.
//	al_length		The desired length of the string.
//
//	Returns:  		String
//						A string of length al_length wich contains as_source with
//						spaces added to its left.
//						If any argument's value is NULL, function returns NULL.
//						If al_length is less or equal to length of as_source, the 
//						function returns the original as_source.
//
//	Description:  	Pad the original string with spaces on its left to make it of
//					   the desired length.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

string	ls_return

//Check for Null Parameters.
IF IsNull(as_source) or IsNull(al_length) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

//Check for the lengths
If al_length <= Len(as_Source) Then
	//Return the original string
	Return as_source
End If

//Create the left padded string
ls_return = space(al_length - Len(as_Source)) + as_source

//Return the left padded string
Return ls_return
end function

public function string f_padright (string as_source, long al_length);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_PadRight
//
//	Access:  		public
//
//	Arguments:
//	as_Source		The string being searched.
//	al_length		The desired length of the string.
//
//	Returns:  		String
//						A string of length al_length wich contains as_source with
//						spaces added to its right.
//						If any argument's value is NULL, function returns NULL.
//						If al_length is less or equal to length of as_source, the 
//						function returns the original as_source.
//
//	Description:  	Pad the original string with spaces on its right to make it of
//					   the desired length.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

string	ls_return

//Check for Null Parameters.
IF IsNull(as_source) or IsNull(al_length) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

//Check for the lengths
If al_length <= Len(as_Source) Then
	//Return the original string
	Return as_source
End If

//Create the right padded string
ls_return = as_source + space(al_length - Len(as_Source))

//Return the right padded string
Return ls_return
end function

public function boolean f_islower (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_IsLower
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string only contains lowercase characters. 
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Determines whether a string contains only lowercase 
//						characters.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

If as_source = Lower(as_source) Then
	Return True
Else
	Return False
End If
end function

public function boolean f_isupper (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_IsUpper
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string only contains uppercase characters. 
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Determines whether a string contains only uppercase 
//						characters.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

If as_source = Upper(as_source) Then
	Return True
Else
	Return False
End If
end function

public function boolean f_iswhitespace (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_IsWhiteSpace
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string only contains White Space characters. 
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Determines whether a string contains only White Space
//						characters. White Space characters include Newline, Tab,
//						Vertical tab, Carriage return, Formfeed, and Backspace.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

long 		ll_count=0
long 		ll_length
char		lc_char[]
integer	li_ascii

//Check parameters
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

//Get the length
ll_length = Len (as_source)

//Check for at least one character
If ll_length=0 Then
	Return False
End If

//Move string into array of chars
lc_char = as_source


//Perform loop around all characters
//Quit loop if Non WhiteSpace character is found
do while ll_count<ll_length
	ll_count ++
	
	//Get ASC code of character.
	li_ascii = Asc (lc_char[ll_count])
	
	If li_ascii=8	or			/* BackSpae */		 		& 
		li_ascii=9 	or			/* Tab */		 			& 
		li_ascii=10 or			/* NewLine */				& 
		li_ascii=11 or			/* Vertical Tab */		& 
		li_ascii=12 or			/* Form Feed */			& 
		li_ascii=13 or			/* Carriage Return */	&
		li_ascii=32 Then		/* Space */		
		//Character is a WhiteSpace.
		//Continue with the next character.
	Else
		/* Character is Not a White Space. */
		Return False
	End If
loop
	
// Entire string is White Space.
return True

end function

public function boolean f_isalpha (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_IsAlpha
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string only contains alphabetic characters. 
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Determines whether a string contains only alphabetic
//						characters.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

long		ll_count=0
long		ll_length
char		lc_char[]
integer	li_ascii

//Check parameters
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

//Get the length
ll_length = Len (as_source)

//Check for at least one character
If ll_length=0 Then
	Return False
End If

//Move string into array of chars
lc_char = as_source

//Perform loop around all characters
//Quit loop if Non Alpha character is found
do while ll_count<ll_length
	ll_count ++
	
	//Get ASC code of character.
	li_ascii = Asc (lc_char[ll_count])
	
	// 'A'=65, 'Z'=90, 'a'=97, 'z'=122
	if li_ascii<65 or (li_ascii>90 and li_ascii<97) or li_ascii>122 then
		/* Character is Not an Alpha */
		Return False
	end if
loop
	
// Entire string is alpha.
return True
end function

public function boolean f_isalphanum (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_IsAlphaNum
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string only contains alphabetic and Numeric
//						characters. 
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Determines whether a string contains only alphabetic and
//						numeric characters.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

long ll_count=0
long ll_length
char lc_char[]
integer	li_ascii

//Check parameters
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

//Get the length
ll_length = Len (as_source)

//Check for at least one character
If ll_length=0 Then
	Return False
End If

//Move string into array of chars
lc_char = as_source

//Perform loop around all characters.
//Quit loop if Non Alphanemeric character is found.
do while ll_count<ll_length
	ll_count ++
	
	//Get ASC code of character.
	li_ascii = Asc (lc_char[ll_count])
	
	// '0'= 48, '9'=57, 'A'=65, 'Z'=90, 'a'=97, 'z'=122
	If li_ascii<48 or (li_ascii>57 and li_ascii<65) or &
		(li_ascii>90 and li_ascii<97) or li_ascii>122 then
		/* Character is Not an AlphaNumeric */
		Return False
	end if
loop
	
// Entire string is AlphaNumeric.
return True

end function

public function string f_quote (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_Quote
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		String
//						The original string enclosed in quotations.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Enclose the original string in quotations.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	Return as_source
End If

// Enclosed original string in quotations.
return '"' + as_source + '"'

end function

public function boolean f_isspace (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_IsSpace
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string only contains space characters. 
//						False if the string is empty or if it contains other
//						non-space characters.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Determines whether a string contains only space characters.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

//Check for an empty string
If Len(as_source)=0 Then
	Return False
End If

If Trim(as_source) = '' Then
	// Entire string is made of spaces.
	return True
end if

//String is not made up entirely of spaces.
Return False

end function

public function boolean f_ispunctuation (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_IsPunctuation
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string only contains punctuation characters.
//						If as_source is NULL, the function returns NULL.
//
//	Description:  	Determines whether a string contains only punctuation
//						characters.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

long		ll_count=0
long		ll_length
char		lc_char[]
integer	li_ascii

//Check parameters
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

//Get the length
ll_length = Len (as_source)

//Check for at least one character
If ll_length=0 Then
	Return False
End If

//Move string into array of chars
lc_char = as_source

//Perform loop around all characters
//Quit loop if Non Punctuation character is found
do while ll_count<ll_length
	ll_count ++
	
	//Get ASC code of character.
	li_ascii = Asc (lc_char[ll_count])
	
	If li_ascii=33 or			/* '!' */		 & 
		li_ascii=34 or			/* '"' */		 & 
		li_ascii=39 or			/* ''' */		 & 
		li_ascii=44 or			/* ',' */		 & 
		li_ascii=46 or			/* '.' */		 & 
		li_ascii=58 or			/* ':' */		 & 
		li_ascii=59 or			/* ';' */		 & 	
		li_ascii=63 Then 		/* '?' */
		//Character is a punctuation.
		//Continue with the next character.
	Else
		Return False
	End If
loop
	
// Entire string is punctuation.
return True

end function

public function long f_lastpos (string as_source, string as_target, long al_start);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_LastPos	
//
//	Access:  		public
//
//	Arguments:
//	as_Source		The string being searched.
//	as_Target		The being searched for.
//	al_start			The starting position, 0 means start at the end.
//
//	Returns:  		Long	
//						The position of as_Target.
//						If as_Target is not found, function returns a 0.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Search backwards through a string to find the last occurrence 
//						of another string.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

Long	ll_Cnt, ll_Pos

//Check for Null Parameters.
IF IsNull(as_source) or IsNull(as_target) or IsNull(al_start) Then
	SetNull(ll_Cnt)
	Return ll_Cnt
End If

//Check for an empty string
If Len(as_Source) = 0 Then
	Return 0
End If

// Check for the starting position, 0 means start at the end.
If al_start=0 Then  
	al_start=Len(as_Source)
End If

//Perform find
For ll_Cnt = al_start to 1 Step -1
	ll_Pos = Pos(as_Source, as_Target, ll_Cnt)
	If ll_Pos = ll_Cnt Then 
		//String was found
		Return ll_Cnt
	End If
Next

//String was not found
Return 0

end function

public function long f_lastpos (string as_source, string as_target);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_LastPos	
//
//	Access:  		public
//
//	Arguments:
//	as_Source		The string being searched.
//	as_Target		The string being searched for.
//
//	Returns:  		Long	
//						The position of as_Target.
//						If as_Target is not found, function returns a 0.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  Search backwards through a string to find the last occurrence of another string
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

//Check for Null Parameters.
IF IsNull(as_source) or IsNull(as_target) Then
	Long ll_null
	SetNull(ll_null)
	Return ll_null
End If

//Set the starting position and perform the search
Return f_LastPos (as_source, as_target, Len(as_Source))

end function

public function string f_globalreplace (string as_source, string as_old, string as_new, boolean ab_ignorecase);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_GlobalReplace
//
//	Access:  		public
//
//	Arguments:
//	as_Source		The string being searched.
//	as_Old			The old string being replaced.
//	as_New			The new string.
// ab_IgnoreCase	A boolean stating to ignore case sensitivity.
//
//	Returns:  		string
//						as_Source with all occurrences of as_Old replaced with as_New.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Replace all occurrences of one string inside another with
//						a new string.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

Long	ll_Start
Long	ll_OldLen
Long	ll_NewLen
String ls_Source, ls_null

//Check parameters
If IsNull(as_source) or IsNull(as_old) or IsNull(as_new) or IsNull(ab_ignorecase) Then
	SetNull(ls_null)
	Return ls_null
End If

//Get the string lenghts
ll_OldLen = Len(as_Old)
ll_NewLen = Len(as_New)

//Should function respect case.
If ab_ignorecase Then
	as_old = Lower(as_old)
	ls_source = Lower(as_source)
	if Lower(as_old) = Lower(as_new) then
		return as_source
	end if	
Else
	ls_source = as_source
	if as_old = as_new then
		return as_source
	end if		
End If

//Search for the first occurrence of as_Old
ll_Start = Pos(ls_Source, as_Old)

Do While ll_Start > 0
	// replace as_Old with as_New
	as_Source = Replace(as_Source, ll_Start, ll_OldLen, as_New)
	
	//Should function respect case.
	If ab_ignorecase Then 
		ls_source = Lower(as_source)
	Else
		ls_source = as_source
	End If
	
	// find the next occurrence of as_Old
	ll_Start = Pos(ls_Source, as_Old,ll_Start+ll_NewLen)
Loop

Return as_Source

end function

public function string f_globalreplace (string as_source, string as_old, string as_new);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_GlobalReplace
//
//	Access:  		public
//
//	Arguments:
//	as_Source		The string being searched.
//	as_Old			The old string being replaced.
//	as_New			The new string.
// 
//Returns:  		string
//						as_Source with all occurrences of as_Old replaced with as_New.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Replace all occurrences of one string inside another with
//						a new string.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) or IsNull(as_old) or IsNull(as_new) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

//The default is to ignore Case
as_Source = f_GlobalReplace (as_source, as_old, as_new, True)

Return as_Source


end function

public function long f_countoccurrences (string as_source, string as_target, boolean ab_ignorecase);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_CountOccurrences
//
//	Access:  		public
//
//	Arguments:
//	as_Source		The string in which to search.
//	as_Target		The string to search for.
//	ab_IgnoreCase	A boolean stating to ignore case sensitivity.
//
//	Returns: 		long
//						The number of occurrences of as_Target in as_source.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Count the occurrences of one string within another.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

Long	ll_Count, ll_Pos, ll_Len

//Check for parameters
If IsNull(as_source) or IsNull(as_target) or IsNull(ab_ignorecase) Then
	long ll_null
	SetNull(ll_null)
	Return ll_null
End If

//Should function ignore case?
If ab_ignorecase Then
	as_source = Lower(as_source)
	as_target = Lower(as_target)
End If

ll_Len = Len(as_Target)
ll_Count = 0

ll_Pos = Pos(as_source, as_Target)

Do While ll_Pos > 0
	ll_Count ++
	ll_Pos = Pos(as_source, as_Target, (ll_Pos + ll_Len))
Loop

Return ll_Count

end function

public function string f_righttrim (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_RightTrim
//
//	Access:  		public
//
//	Arguments:
//	as_source		The string to be trimmed.
//
//	Returns:  		string
//						as_source with all desired characters removed from the right end 
//						of the string.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes desired characters from the right end of a string.
//						The options depending on the parameters are:
//							Remove spaces from the end of a string.
//							Remove nonprintable characters from the end of a string.
//							Remove spaces and nonprintable characters from the end 
//							of a string.
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

// Remove spaces=True, NonPrintCharacters=False
return f_RightTrim (as_source, True, False)
end function

public function string f_lefttrim (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_LeftTrim
//
//	Access:  		public
//
//	Arguments:
//	as_source		The string to be trimmed.
//
//	Returns:  		string
//						as_source with all desired characters removed from the left end 
//						of the string.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes desired characters from the left end of a string.
//						The options depending on the parameters are:
//							Remove spaces from the beginning of a string.
//							Remove nonprintable characters from the beginning of a string.
//							Remove spaces and nonprintable characters from the 
//							beginning of a string.
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

// Remove spaces=True, NonPrintCharacters=False
return f_LeftTrim (as_source, True, False)
end function

public function string f_lefttrim (string as_source, boolean ab_remove_spaces);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_LeftTrim
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string to be trimmed.
//	ab_remove_spaces	A boolean stating if spaces should be removed.
//
//	Returns:  		string
//						as_source with all desired characters removed from the left end 
//						of the string.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes desired characters from the left end of a string.
//						The options depending on the parameters are:
//							Remove spaces from the beginning of a string.
//							Remove nonprintable characters from the beginning of a string.
//							Remove spaces and nonprintable characters from the 
//							beginning of a string.
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) or IsNull(ab_remove_spaces) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If


// Remove spaces=ab_remove_spaces, NonPrintCharacters=False
return f_LeftTrim (as_source, ab_remove_spaces, False)
end function

public function string f_lefttrim (string as_source, boolean ab_remove_spaces, boolean ab_remove_nonprint);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_LeftTrim
//
//	Access:  		public
//
//	Arguments:
//	as_source				The string to be trimmed.
//	ab_remove_spaces		A boolean stating if spaces should be removed.
//	ab_remove_nonprint	A boolean stating if nonprint characters should be removed.
//
//	Returns:  		string
//						as_source with all desired characters removed from the left end of the string.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes desired characters from the left end of a string.
//						The options depending on the parameters are:
//							Remove spaces from the beginning of a string.
//							Remove nonprintable characters from the beginning of a string.
//							Remove spaces and nonprintable characters from the beginning of a string.
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

char		lc_char
boolean	lb_char
boolean	lb_printable_char

//Check parameters
If IsNull(as_source) or IsNull(ab_remove_spaces) or IsNull(ab_remove_nonprint) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

If ab_remove_spaces and ab_remove_nonprint Then
	// Remove spaces and nonprintable characters from the beginning of a string.
	do while Len (as_source) > 0 and not lb_char
		lc_char = as_source
		if f_IsPrintable(lc_char) and Not f_IsSpace(lc_char) then
			lb_char = true
		else
			as_source = Mid (as_source, 2)
		end if
	loop
	return as_source
ElseIf ab_remove_nonprint Then
	// Remove nonprintable characters from the beginning of a string.
	do while Len (as_source) > 0 and not lb_printable_char
		lc_char = as_source
		if f_IsPrintable(lc_char) then
			lb_printable_char = true
		else
			as_source = Mid (as_source, 2)
		end if
	loop
	return as_source
ElseIf ab_remove_spaces Then
	//Remove spaces from the beginning of a string.
	return LeftTrim(as_source)
End If

return as_source


end function

public function string f_righttrim (string as_source, boolean ab_remove_spaces);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_RightTrim
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string to be trimmed.
//	ab_remove_spaces	A boolean stating if spaces should be removed.
//
//	Returns:  		string
//						as_source with all desired characters removed from the right end 
//						of the string.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes desired characters from the right end of a string.
//						The options depending on the parameters are:
//							Remove spaces from the end of a string.
//							Remove nonprintable characters from the end of a string.
//							Remove spaces and nonprintable characters from the end 
//							of a string.
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) or IsNull(ab_remove_spaces) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

// Remove spaces=ab_remove_spaces, NonPrintCharacters=False
return f_RightTrim (as_source, ab_remove_spaces, False)
end function

public function string f_righttrim (string as_source, boolean ab_remove_spaces, boolean ab_remove_nonprint);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_RightTrim
//
//	Access:  		public
//
//	Arguments:
//	as_source				The string to be trimmed.
//	ab_remove_spaces		A boolean stating if spaces should be removed.
//	ab_remove_nonprint	A boolean stating if nonprint characters should be removed.
//
//	Returns:  		string
//						as_source with all desired characters removed from the right
//						end of the string.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes desired characters from the right end of a string.
//						The options depending on the parameters are:
//							Remove spaces from the end of a string.
//							Remove nonprintable characters from the end of a string.
//							Remove spaces and nonprintable characters from the end of
//							a string.
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

boolean	lb_char
char		lc_char
boolean	lb_printable_char

//Check parameters
If IsNull(as_source) or IsNull(ab_remove_spaces) or IsNull(ab_remove_nonprint) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

If ab_remove_spaces and ab_remove_nonprint Then
	// Remove spaces and nonprintable characters from the end of a string.
	do while Len (as_source) > 0 and not lb_char
		lc_char = Right (as_source, 1)
		if f_IsPrintable(lc_char) and Not f_IsSpace(lc_char) then
			lb_char = true
		else
			as_source = Left (as_source, Len (as_source) - 1)
		end if
	loop
	return as_source
	
ElseIf ab_remove_nonprint Then
	// Remove nonprintable characters from the end of a string.
	do while Len (as_source) > 0 and not lb_printable_char
		lc_char = Right (as_source, 1)
		if f_IsPrintable(lc_char) then
			lb_printable_char = true
		else
			as_source = Left (as_source, Len (as_source) - 1)
		end if
	loop
	return as_source
	
ElseIf ab_remove_spaces Then
	//Remove spaces from the end of a string.
	return RightTrim(as_source)
End If

return as_source
end function

public function string f_trim (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_Trim
//
//	Access:  		public
//
//	Arguments:
//	as_source		The string to be trimmed.
//
//	Returns:  		string
//						as_source with all desired characters removed from the left end 
//						of the string.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes desired characters from the left and right end of 
//						a string.
//						The options depending on the parameters are:
//							Remove spaces from the beginning and end of a string.
//							Remove nonprintable characters from the beginning and 
//							end of a string.
//							Remove spaces and nonprintable characters from the 
//							beginning and end of a string.
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

// Remove Spaces=True, NonPrintCharacters=False
return f_Trim (as_source, True, False)

end function

public function string f_trim (string as_source, boolean ab_remove_spaces);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_Trim
//
//	Access:  		public
//
//	Arguments:
//	as_source			The string to be trimmed.
//	ab_remove_spaces	A boolean stating if spaces should be removed.
//
//	Returns:  		string
//						as_source with all desired characters removed from the left end 
//						of the string.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes desired characters from the left and right end of 
//						a string.
//						The options depending on the parameters are:
//							Remove spaces from the beginning and end of a string.
//							Remove nonprintable characters from the beginning and 
//							end of a string.
//							Remove spaces and nonprintable characters from the 
//							beginning and end of a string.
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) or IsNull(ab_remove_spaces) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

// Remove Spaces=ab_remove_spaces, NonPrintCharacters=False
return f_Trim (as_source, ab_remove_spaces, False)

end function

public function string f_trim (string as_source, boolean ab_remove_spaces, boolean ab_remove_nonprint);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_Trim
//
//	Access:  		public
//
//	Arguments:
//	as_source				The string to be trimmed.
//	ab_remove_spaces		A boolean stating if spaces should be removed.
//	ab_remove_nonprint	A boolean stating if nonprint characters should be removed.
//
//	Returns:  		string
//						as_source with all desired characters removed from the left and 
//						right end of the string.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes desired characters from the left and right end of 
//						a string.
//						The options depending on the parameters are:
//							Remove spaces from the beginning and end of a string.
//							Remove nonprintable characters from the beginning and 
//							end of a string.
//							Remove spaces and nonprintable characters from the 
//							beginning and end of a string.
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

//Check parameters
If IsNull(as_source) or IsNull(ab_remove_spaces) or IsNull(ab_remove_nonprint) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

If ab_remove_spaces and ab_remove_nonprint Then
	// Remove spaces and nonprintable characters from the beginning and end 
	// of a string.
	as_source = f_LeftTrim (as_source, ab_remove_spaces, ab_remove_nonprint)
	as_source = f_RightTrim(as_source, ab_remove_spaces, ab_remove_nonprint)

ElseIf ab_remove_nonprint Then
	// Remove nonprintable characters from the beginning and end
	// of a string.
	as_source = f_LeftTrim (as_source, ab_remove_spaces, ab_remove_nonprint)
	as_source = f_RightTrim(as_source, ab_remove_spaces, ab_remove_nonprint)

ElseIf ab_remove_spaces Then
	//Remove spaces from the beginning and end of a string.
	as_source = Trim(as_source)

End If

return as_source
end function

public function string f_getkeyvalue (string as_source, string as_keyword, string as_separator);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_GetKeyValue
//
//	Access:  		public
//
//	Arguments:
//	as_source		The string to be searched.
//	as_keyword		The keyword to be searched for.
//	as_separator	The separator character used in the source string.
//
//	Returns:  		string	
//						The value found for the keyword.
//						If no matching keyword is found, an empty string is returned.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Gets the value portion of a keyword=value pair from a string.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	6.0.01	Make function find only an exact match of the keyword
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

boolean	lb_done=false
integer	li_keyword, li_separator, li_equal
string	ls_keyvalue, ls_source, ls_exact

//Check parameters
If IsNull(as_source) or IsNull(as_keyword) or IsNull(as_separator) Then
	string ls_null
	SetNull (ls_null)
	Return ls_null
End If

//Initialize key value
ls_keyvalue = ''

do while not lb_done
	li_keyword = Pos (Lower(as_source), Lower(as_keyword))
	if li_keyword > 0 then
		ls_source = as_source
		as_source = LeftTrim(Right(as_source, Len(as_source) - (li_keyword + Len(as_keyword) - 1)))
		// see if this is an exact match.  Either the match will be at the start of the string or
		// the match will be after a separator character.  So check for both cases
		li_equal = li_keyword - len(as_separator)
		If li_equal > 0 Then
			// not the start so see if this is a compound occurance separated by the separator string
			ls_exact = mid(ls_source, li_equal, len(as_separator))  
			If ls_exact <> as_separator Then
				// not the separator string so continue looking
				Continue
			End IF
		End If

		if Left(as_source, 1) = "=" then
			li_separator = Pos (as_source, as_separator, 2)
			if li_separator > 0 then
				ls_keyvalue = Mid(as_source, 2, li_separator - 2)
			else
				ls_keyvalue = Mid(as_source, 2)
			end if
			ls_keyvalue = Trim(ls_keyvalue)
			lb_done = true
		end if
	else
		lb_done = true
	end if
loop

return ls_keyvalue
end function

public function integer f_setkeyvalue (ref string as_source, string as_keyword, string as_keyvalue, string as_separator);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_SetKeyValue
//
//	Access:  		public
//
//	Arguments:
//	as_source		The string to have the set performed on.  Passed by reference.
//							Format:  keyword = value; ...
//	as_keyword		The keyword to set a value for.
//	as_keyvalue		The new value for the specified keyword.
//	as_separator	The separator character used in the source string.
//
//	Returns:			integer
//						1 Successful operation.
//						-1 The specified keywork did not exist in the source string.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:	Sets the value portion of a keyword=value pair from a string
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////


integer	li_found=-1
integer	li_keyword, &
			li_separator, &
			li_equal
string	ls_temp

//Check paramemeters
If IsNull(as_source) or IsNull(as_keyword) or IsNull(as_keyvalue) or IsNull(as_separator) Then
	integer li_null
	SetNull (li_null)
	Return li_null
End If

do 
	li_keyword = Pos (Lower(as_source), Lower(as_keyword), li_keyword + 1)
	if li_keyword > 0 then
		ls_temp = LeftTrim (Right (as_source, Len(as_source) - (li_keyword + Len(as_keyword) - 1)))
		if Left (ls_temp, 1) = "=" then
			li_equal = Pos (as_source, "=", li_keyword + 1)
			li_separator = Pos (as_source, as_separator, li_equal + 1)
			if li_separator > 0 then
				as_source = Left(as_source, li_equal) + as_keyvalue + as_separator + Right(as_source, Len(as_source) - li_separator)
			else
				as_source = Left(as_source, li_equal) + as_keyvalue
			end if
			li_found = 1
		end if
	end if
loop while li_keyword > 0

return li_found
end function

public function string f_removenonprint (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_RemoveNonPrint
//
//	Access:  		public

//
//	Arguments:
//	as_source		The string from which all nonprint characters are to
//						be removed.
//
//	Returns:  		string
//						as_source with all desired characters removed.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes all nonprint characters.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

char		lch_char
long		ll_pos = 1
long		ll_loop
string	ls_source
long		ll_source_len

//Check parameters
If IsNull(as_source) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

ls_source = as_source
ll_source_len = Len(ls_source)

// Remove nonprintable characters 
FOR ll_loop = 1 TO ll_source_len
	lch_char = Mid(ls_source, ll_pos, 1)
	if f_IsPrintable(lch_char) then
		ll_pos ++	
	else
		ls_source = Replace(ls_source, ll_pos, 1, "")
	end if 
NEXT

Return ls_source

end function

public function boolean f_isempty (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_IsEmpty
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string has a lenght of 0 or is NULL.
//
//	Description:  	Determines whether a string has a lenght of 0 or is NULL.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

if IsNull(as_source) or Len(as_source)=0 then
	//String is empty
	Return True
end if
	
//String is Not empty
return False
end function

public function boolean f_isprintable (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_IsPrintable
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string only contains Printable characters.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Determines whether a string is composed entirely of 
//						Printable characters.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

long		ll_count=0
long		ll_length
char		lc_char[]
integer	li_ascii

//Check parameters
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

//Get the length
ll_length = Len (as_source)

//Check for at least one character
If ll_length=0 Then
	Return False
End If

//Move string into array of chars
lc_char = as_source

//Perform loop around all characters
//Quit loop if NonPrintable character is found
do while ll_count<ll_length
	ll_count ++
	
	//Get ASC code of character.
	li_ascii = Asc (lc_char[ll_count])
	
	// 'space'=32, '~'=126
	if li_ascii<32 or li_ascii>126 then
		/* Not a printable character */
		Return False
	end if
loop
	
// Entire string is of printable characters.
return True

end function

public function boolean f_isformat (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_IsFormat
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string only contains Formatting characters.
//						If as_source is NULL, the function returns NULL.
//
//	Description:  	Determines whether a string contains only Formatting
//						characters.  Format characters for this function
//						are all printable characters that are not AlphaNumeric.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

long		ll_count=0
long		ll_length
char		lc_char[]
integer	li_ascii

//Check parameters
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

//Get the length
ll_length = Len (as_source)

//Check for at least one character
If ll_length=0 Then
	Return False
End If

//Move string into array of chars
lc_char = as_source

//Perform loop around all characters
//Quit loop if Non Operator character is found
do while ll_count<ll_length
	ll_count ++
	
	//Get ASC code of character.
	li_ascii = Asc (lc_char[ll_count])
	
	If (li_ascii>=33 and li_ascii<=47) or &
		(li_ascii>=58 and li_ascii<=64) or &
		(li_ascii>=91 and li_ascii<=96) or &
		(li_ascii>=123 and li_ascii<=126) Then
		//Character is a Format.
		//Continue with the next character.
	Else
		Return False
	End If
loop
	
// Entire string is made of Format characters.
return True

end function

public function string f_removewhitespace (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_RemoveWhiteSpace
//
//	Access:  		public
//
//	Arguments:
//	as_source		The string from which all WhiteSpace characters are to
//						be removed.
//
//	Returns:  		string
//						as_source with all desired characters removed.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes all WhiteSpace characters.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

char		lch_char
long		ll_pos = 1
long		ll_loop
string	ls_source
long		ll_source_len

//Check parameters
If IsNull(as_source) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

ls_source = as_source
ll_source_len = Len(ls_source)

// Remove WhiteSpace characters 
FOR ll_loop = 1 TO ll_source_len
	lch_char = Mid(ls_source, ll_pos, 1)
	if Not f_IsWhiteSpace(lch_char) then
		ll_pos ++	
	else
		ls_source = Replace(ls_source, ll_pos, 1, "")
	end if 
NEXT

Return ls_source

end function

public function boolean f_IsComparisonOperator (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_IsComparisonOperator
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string only contains Comparison Operator
//						characters.
//						If as_source is NULL, the function returns NULL.
//
//	Description:  	Determines whether a string contains only Comparison
//						Operator characters.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

long		ll_count=0
long		ll_length
char		lc_char[]
integer	li_ascii

//Check parameters
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

//Get the length
ll_length = Len (as_source)

//Check for at least one character
If ll_length=0 Then
	Return False
End If

//Move string into array of chars
lc_char = as_source

//Perform loop around all characters
//Quit loop if Non Operator character is found
do while ll_count<ll_length
	ll_count ++
	
	//Get ASC code of character.
	li_ascii = Asc (lc_char[ll_count])
	
	If li_ascii=60 or			/* < less than */	 & 
		li_ascii=61 or			/* = equal */		 & 
		li_ascii=62 Then		/* > greater than */
		//Character is an Comparison Operator.
		//Continue with the next character.
	Else
		Return False
	End If
loop
	
// Entire string is made of Comparison Operators.
return True

end function

public function boolean f_IsArithmeticOperator (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_IsArithmeticOperator
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string only contains Arithmetic Operator
//						characters.
//						If as_source is NULL, the function returns NULL.
//
//	Description:  	Determines whether a string contains only Arithmetic
//						Operator characters.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

long		ll_count=0
long		ll_length
char		lc_char[]
integer	li_ascii

//Check parameters
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

//Get the length
ll_length = Len (as_source)

//Check for at least one character
If ll_length=0 Then
	Return False
End If

//Move string into array of chars
lc_char = as_source

//Perform loop around all characters
//Quit loop if Non Operator character is found
do while ll_count<ll_length
	ll_count ++
	
	//Get ASC code of character.
	li_ascii = Asc (lc_char[ll_count])
	
	If li_ascii=40 or			/* ( left parenthesis */	 & 
		li_ascii=41 or			/* ) right parenthesis */	 & 
		li_ascii=43 or			/* + addition */				 & 
		li_ascii=45 or			/* - subtraction */			 & 
		li_ascii=42 or			/* * multiplication */		 & 
		li_ascii=47 or			/* / division */				 & 
		li_ascii=94 Then		/* ^ power */	
		//Character is an operator.
		//Continue with the next character.
	Else
		Return False
	End If
loop
	
// Entire string is made of arithmetic operators.
return True

end function

public function long f_countoccurrences (string as_source, string as_target);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_CountOccurrences
//
//	Access:  		public
//
//	Arguments:
//	as_Source		The string in which to search.
//	as_Target		The string to search for.
//
//	Returns: 		long
//						The number of occurrences of as_Target in as_source.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Count the occurrences of one string within another.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

Long	ll_Count

//Check for parameters
If IsNull(as_source) or IsNull(as_target) Then
	long ll_null
	SetNull(ll_null)
	Return ll_null
End If

//Default is to ignore case.
ll_Count = f_CountOccurrences (as_source, as_target, True)

Return ll_Count

end function

public function long f_arraytostring (string as_source[], string as_delimiter, ref string as_ref_string);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_ArrayToString
//
//	Access:  		public
//
//	Arguments:
//	as_source[]		The array of string to be moved into a single string.
//	as_Delimiter	The delimeter string.
//	as_ref_string	The string to be filled with the array of strings,
//						passed by reference.
//
//	Returns:  		long
//						1 for a successful transfer.
//						-1 if a problem was found.
//
//	Description:  	Create a single string from an array of strings separated by
//						the passed delimeter.
//						Note: Function will not include on the single string any 
//								array entries which match an empty string.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	7.0   Redirect to the overloaded function version, which allows optional 
//			processing of an empty string.  The default behavior is to dissallow 
//			empty string to remain backwards compatible.  Call the 4 argument 
//			version of the function if the empty string processing is desired.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

return f_arraytostring(as_source[], as_delimiter, FALSE, as_ref_string)

end function

public function long f_arraytostring (string as_source[], string as_delimiter, boolean ab_processempty, ref string as_ref_string);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_ArrayToString
//
//	Access:  		public
//
//	Arguments:
//	as_source[]		 The array of string to be moved into a single string.
//	as_Delimiter	 The delimeter string.
//	ab_processempty Whether to process empty string as_source members.
//	as_ref_string	 The string to be filled with the array of strings,
//						 passed by reference.
//
//	Returns:  		long
//						1 for a successful transfer.
//						-1 if a problem was found.
//
//	Description:  	Create a single string from an array of strings separated by
//						the passed delimeter.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	7.0   Initial version
//			Overloaded an existing f_arraytostring to optionally allow processing 
//			of empty string arguments.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

long		ll_Count, ll_ArrayUpBound

//Get the array size
ll_ArrayUpBound = UpperBound(as_source[])

//Check parameters
IF IsNull(as_delimiter) or (Not ll_ArrayUpBound>0) Then
	Return -1
End If

//Reset the Reference string
as_ref_string = ''

If Not ab_processempty Then
	For ll_Count = 1 to ll_ArrayUpBound
		// Do not include any entries that match an empty string 
		If as_source[ll_Count] <> '' Then
			If Len(as_ref_string) = 0 Then
				//Initialize string
				as_ref_string = as_source[ll_Count]
			else
				//Concatenate to string
				as_ref_string = as_ref_string + as_delimiter + as_source[ll_Count]
			End If
		End If
	Next 
Else
	For ll_Count = 1 to ll_ArrayUpBound
		// Include any entries that match an empty string 
		If ll_Count = 1 Then
			//Initialize string
			as_ref_string = as_source[ll_Count]
		else
			//Concatenate to string
			as_ref_string = as_ref_string + as_delimiter + as_source[ll_Count]
		End If
	Next 
End If
return 1

end function

public function string f_wordcap (string as_source);//////////////////////////////////////////////////////////////////////////////
//	Public Function:  		 f_WordCap
//	Arguments:		as_source		The source string.
//	Returns:  		String			Returns string with the first letter of each word set to
//											uppercase and the remaining letters lowercase if it succeeds
//											and NULL if an error occurs.
//											If any argument's value is NULL, function returns NULL.
//	Description:  	Sets the first letter of each word in a string to a capital 
//						letter and all other letters to lowercase (for example, 
//						ROBERT E. LEE would be Robert E. Lee).
//////////////////////////////////////////////////////////////////////////////
//	Rev. History	Version
//						5.0   Initial version
//						7.0	Fix to not capitalize the next character after apostrophe
//////////////////////////////////////////////////////////////////////////////
//	Copyright © 1996-1999 Sybase, Inc. and its subsidiaries.  All rights reserved.  Any distribution of the 
// PowerBuilder Foundation Classes (PFC) source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//////////////////////////////////////////////////////////////////////////////
integer	li_pos
boolean	lb_capnext
string 	ls_ret
long		ll_stringlength
char		lc_char, lc_string[]

//Check parameters
If IsNull(as_source) Then Return as_source

//Get and check length
ll_stringlength = Len(as_source)
If ll_stringlength = 0 Then Return as_source

//Convert all characters to lowercase and put it into Character Array
lc_string = Lower(as_source)

//The first character should be capitalized
lb_capnext = TRUE

//Loop through the entire string
For li_pos = 1 to ll_stringlength
	//Get one character at a time
	lc_char = lc_string[li_pos]
	
	If lc_char = "'" Then
		lb_capnext = False
	ElseIf Not f_IsAlpha(lc_char) Then
		//The next character should be capitalized
		lb_capnext = True
	ElseIf lb_capnext Then
		//Capitalize this Alphabetic character
		lc_string[li_pos] = Upper(lc_char)
		//The next character should not be capitalized
		lb_capnext = False
	End If
Next

//Copy the Character array back to a string variable
ls_ret = lc_string

return ls_ret
end function

public function integer f_check_email (string vs_email)

// check email address (check basic)
// return 1: valid
//           0: invalid

int li_pos1, li_pos2

li_pos1 = pos(vs_email, '@')
SELECT INSTR(:vs_email, '@',1,2) into :li_pos2 FROM Dual;
		
if  li_pos1 < 2 or li_pos2 > 0 or pos(vs_email, '.') < 2 or pos(vs_email, '@.') > 0 or pos(vs_email, '.@') > 0 or  pos(vs_email, '.') = Len(trim(vs_email)) then
	return 0
end if

li_pos1 = pos(vs_email, '.')
SELECT INSTR(:vs_email, '.',1,2) into :li_pos2 FROM Dual;
do while li_pos2 > 0
	if  li_pos2 = li_pos1 + 1 then
		return 1
	else
		li_pos1 = li_pos2
		SELECT INSTR(:vs_email, '.',:li_pos1,2) into :li_pos2 FROM Dual;
	end if
loop		
return 1
end function

public function long f_stringtoarray (string as_source, string as_delimiter, ref string as_array[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  f_StringToArray
//
//	Access:  public
//
//	Arguments:
//	as_Source   The string to parse.
//	as_Delimiter   The delimeter string.
//	as_Array[]   The array to be filled with the parsed strings, passed by reference.
//
//	Returns:  long
//	The number of elements in the array.
//	If as_Source or as_Delimeter is NULL, function returns NULL.
//
//	Description:  Parse a string into array elements using a delimeter string.
//
//////////////////////////////////////////////////////////////////////////////

long		ll_DelLen, ll_Pos, ll_Count, ll_Start, ll_Length
string 	ls_holder

//Check for NULL
IF IsNull(as_source) or IsNull(as_delimiter) Then
	long ll_null
	SetNull(ll_null)
	Return ll_null
End If

//Check for at leat one entry
If Trim (as_source) = '' Then
	Return 0
End If

//Get the length of the delimeter
ll_DelLen = Len(as_Delimiter)

ll_Pos =  Pos(Upper(as_source), Upper(as_Delimiter))

//Only one entry was found
if ll_Pos = 0 then
	as_Array[1] = as_source
//	as_Array[1] = trim(as_source)
	
	return 1
end if

//More than one entry was found - loop to get all of them
ll_Count = 0
ll_Start = 1
Do While ll_Pos > 0
	
	//Set current entry
	ll_Length = ll_Pos - ll_Start
	ls_holder = Mid (as_source, ll_start, ll_length)

	// Update array and counter
	ll_Count ++
	as_Array[ll_Count] = ls_holder
//	as_Array[ll_Count] = trim(ls_holder)
	//Set the new starting position
	ll_Start = ll_Pos + ll_DelLen

	ll_Pos =  Pos(Upper(as_source), Upper(as_Delimiter), ll_Start)
Loop

//Set last entry
ls_holder = Mid (as_source, ll_start, Len (as_source))

// Update array and counter if necessary
if Len (ls_holder) > 0 then
	ll_count++
	as_Array[ll_Count] = ls_holder
//	as_Array[ll_Count] = trim(ls_holder)
end if

//Return the number of entries found
Return ll_Count

end function

public function long f_pos (string vs_source, string vs_target, integer vi_occurrence);long		ll_pos

SELECT INSTR(:vs_source, :vs_target,1,:vi_occurrence) into :ll_pos FROM Dual;
if isnull(ll_pos) then ll_pos =0
return ll_pos
end function

public function string f_gettoken (ref string as_source, string as_separator);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_GetToken
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string passed by reference
//	as_separator	Separator character in the source string which will be 
//						used to determine the length of characters to strip from
//						the left end of the source string.
//
//	Returns:  		string
//						The token stripped off of the source string.
//						If the separator character does not appear in the string, 
//						the entire source string is returned.
//						Otherwise, it returns the token stripped off of the left
//						end of the source string (not including the separator character)
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	This function strips a source string (from the left) up 
//						to the occurrence of a specified separator character.
//
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

int 		li_pos
string 	ls_ret

//Check parameters
If IsNull(as_source) or IsNull(as_separator) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

/////////////////////////////////////////////////////////////////////////////////
// Get the position of the separator
/////////////////////////////////////////////////////////////////////////////////
li_pos = Pos(as_source, as_separator)	

/////////////////////////////////////////////////////////////////////////////////
// Compute the length of the token to be stripped off of the source string.
/////////////////////////////////////////////////////////////////////////////////

// If no separator, the token to be stripped is the entire source string
if li_pos = 0 then
	ls_ret = as_source
	as_source = ""	
else
	// Otherwise, return just the token and strip it & the separator from the source string
	ls_ret = Mid(as_source, 1, li_pos - 1)
	as_source = Right(as_source, Len(as_source) - (li_pos+Len(as_separator)-1) )
end if

return ls_ret
end function

public function string f_getfirsttoken (string as_source, string as_separator);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_GetfirstToken
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string passed by reference
//	as_separator	Separator character in the source string which will be 
//						used to determine the length of characters to strip from
//						the left end of the source string.
//
//	Returns:  		string
//						The token stripped off of the source string.
//						If the separator character does not appear in the string, 
//						the entire source string is returned.
//						Otherwise, it returns the token stripped off of the left
//						end of the source string (not including the separator character)
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	This function strips a source string (from the left) up 
//						to the occurrence of a specified separator character.
//
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

int 		li_pos
string 	ls_ret

//Check parameters
If IsNull(as_source) or IsNull(as_separator) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

/////////////////////////////////////////////////////////////////////////////////
// Get the position of the separator
/////////////////////////////////////////////////////////////////////////////////
li_pos = Pos(as_source, as_separator)	

/////////////////////////////////////////////////////////////////////////////////
// Compute the length of the token to be stripped off of the source string.
/////////////////////////////////////////////////////////////////////////////////

// If no separator, the token to be stripped is the entire source string
if li_pos = 0 then
	ls_ret = as_source
else
	// Otherwise, return just the token and strip it & the separator from the source string
	ls_ret = Mid(as_source, 1, li_pos - 1)
end if

return ls_ret
end function

public function integer f_globalreplace (string as_source, string as_old, string as_new, boolean ab_ignorecase, ref string as_target);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_GlobalReplace
//
//	Access:  		public
//
//	Arguments:
//	as_Source		The string being searched.
//	as_Old			The old string being replaced.
//	as_New			The new string.
// ab_IgnoreCase	A boolean stating to ignore case sensitivity.
//
//	Returns:  		string
//						as_Source with all occurrences of as_Old replaced with as_New.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Replace all occurrences of one string inside another with
//						a new string.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

Long	ll_Start
Long	ll_OldLen
Long	ll_NewLen
String	ls_Source
int		li_rtn

//Check parameters
If IsNull(as_source) or IsNull(as_old) or IsNull(as_new) or IsNull(ab_ignorecase) Then
	SetNull(li_rtn)
	Return li_rtn
End If

//Get the string lenghts
ll_OldLen = Len(as_Old)
ll_NewLen = Len(as_New)

//Should function respect case.
If ab_ignorecase Then
	as_old = Lower(as_old)
	ls_source = Lower(as_source)
Else
	ls_source = as_source
End If

//Search for the first occurrence of as_Old
ll_Start = Pos(ls_Source, as_Old)

Do While ll_Start > 0
	li_rtn = 1
	// replace as_Old with as_New
	as_Source = Replace(as_Source, ll_Start, ll_OldLen, as_New)
	
	//Should function respect case.
	If ab_ignorecase Then 
		ls_source = Lower(as_source)
	Else
		ls_source = as_source
	End If
	
	// find the next occurrence of as_Old
	ll_Start = Pos(ls_Source, as_Old, (ll_Start + ll_NewLen))
Loop
as_target = as_Source
Return li_rtn

end function

public function integer f_globalreplace (string as_source, string as_old, string as_new, ref string as_target);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_GlobalReplace
//
//	Access:  		public
//
//	Arguments:
//	as_Source		The string being searched.
//	as_Old			The old string being replaced.
//	as_New			The new string.
// 
//Returns:  		string
//						as_Source with all occurrences of as_Old replaced with as_New.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Replace all occurrences of one string inside another with
//						a new string.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

int				li_rtn

//Check parameters
If IsNull(as_source) or IsNull(as_old) or IsNull(as_new) Then
	SetNull(li_rtn)
	Return li_rtn
End If

//The default is to ignore Case
li_rtn = f_GlobalReplace (as_source, as_old, as_new, True, as_target)

Return li_rtn


end function

public function string f_compare_expression_one_char (string vs_data, ref string rs_expression, ref string rs_data);string 			ls_rtn,ls_data,ls_values[]
int					li_i
//c_obj_service	this

ls_data = vs_data
if Match(ls_data,"^> *[^=].*$") or Match(ls_data,"^< *[^=].*$") Then //< ,> not ()
	rs_expression = left(ls_data,1)
	if match(ls_data,'[+ * / -]$') then	
		if pos(ls_data,'(') > 0 and pos(ls_data,')') = 0 then
			rs_data = '0'
		elseif pos(ls_data,'(') + pos(ls_data,')') > 1 then
			rs_data = trim(mid(ls_data,pos(ls_data,'(')+1,pos(ls_data,')') - pos(ls_data,'(')-1))
		else
			rs_data = trim(mid(ls_data,2,lastpos(ls_data,right(ls_data,1)) - 2))
		end if
		return vs_data
	end if
if pos(ls_data,'(') > 0 and pos(ls_data,')') = 0 then
		rs_data = '0'
	elseif pos(ls_data,'(') <> lastpos(ls_data,'(') or pos(ls_data,')') <> lastpos(ls_data,')') then
		rs_expression = '='
		rs_data = ' -1'
	else
		rs_data = mid(ls_data,2,len(ls_data))
	end if
end if
return rs_expression + rs_data
end function

public function string f_compare_expression_two_char (string vs_data, ref string rs_expression, ref string rs_data);string 			ls_rtn,ls_data,ls_values[]
int					li_i
//c_obj_service	this

ls_data = vs_data
If Match(ls_data,"^>= *[^(]+$") or Match(ls_data,"^<= *[^(]+$") or Match(ls_data,"^<> *[^(]+$") &
	or Match(ls_data,"^<> *.+$") or Match(ls_data,"^>= *.+$") or Match(ls_data,"^>= *.+$") Then // <>,>=,<= not ()
	rs_expression = left(ls_data,2)			
		if match(ls_data,'[+ * / -]$') then
			if len(ls_data) < 4 then
			else
				rs_data = trim(mid(ls_data,3,lastpos(ls_data,right(ls_data,1)) - 3))
			end if
			if pos(ls_data,'(')=0 then
				return vs_data
			end if
		end if
	if len(ls_data) = 2 then
		rs_data = '0'
	else
		if pos(ls_data,'(') > 0 and pos(ls_data,')') = 0 then
			rs_data = '0'
		elseif pos(ls_data,'(') <> lastpos(ls_data,'(') or pos(ls_data,')') <> lastpos(ls_data,')')  then
			rs_expression = '='
			rs_data = ' -1'
		else
			rs_data = trim(mid(ls_data,3,len(ls_data)))
		end if
	end if
end if
return rs_expression + rs_data
end function

public function string f_compare_expression_in_or_between (string vs_data, ref string rs_expression, ref string rs_data);string 			ls_rtn,ls_data,ls_values[]
int					li_i
//c_obj_service	this

ls_data = vs_data
if Match(ls_data,"^<> *.+)$") then
	ls_data = Trim(Mid(ls_data,3))
	rs_data = ' NOT'
end if
If Match(ls_data,"^(.*[;:]+.+)$") Then
	if pos(ls_data,':') > 0 and pos(ls_data,':') = lastpos(ls_data,':') and pos(ls_data,';') = 0 then
		ls_data = Trim(Mid(ls_data,2,Len(ls_data)-2))
		this.f_stringtoarray( ls_data, ':', ls_values[])
		for li_i=1 to upperbound(ls_values[])
			if not isnumber(ls_values[li_i]) then
				rs_expression = '='
				rs_data = ' -1'
				return vs_data
			end if
		next
		rs_data += ' BETWEEN ' + ls_values[1] + ' AND ' + ls_values[2]
	end if
	if pos(ls_data,';') > 0 and pos(ls_data,':') = 0 then
		ls_data = Trim(Mid(ls_data,2,Len(ls_data)-2))
		this.f_stringtoarray( ls_data, ';', ls_values[])
		for li_i=1 to upperbound(ls_values[])
			if not isnumber(ls_values[li_i]) then
				rs_expression = '='
				rs_data = ' -1'
				return vs_data
			end if
		next
		this.f_arraytostring( ls_values[], ',', ls_data)
		rs_data += ' IN ('+ls_data+')'
	end if
else
	rs_expression = '='
	rs_data = ' -1'
end if
return rs_expression + rs_data
end function

public function string f_get_expression (string vs_data, string vs_coltype, string vs_colname, string vs_build_type);/**********************************
Xử lý chuỗi truyền vào theo vs_build_type

filter: 			dùng để setfilter lọc dữ liệu
modify:			dùng để chỉnh sửa thuộc tính
					datawindow
build where:	chỉnh sửa câu select hoặc 
					build lại câu where cho dw
**********************************/

string 			ls_return_string,ls_rtn,ls_expression,ls_data,ls_format,ls_build_type
string				ls_conv,ls_conv2,ls_conv3,ls_mat_reg
//c_obj_service	this
c_datetime		lc_dt

ls_build_type = lower(trim(vs_build_type)) 
If left(vs_coltype,5) = 'char(' then  // KIỂU CHUỖI
	if vs_coltype = 'char(1)' or isnull(vs_data) then
		//xử lý các cột _yn
		if lower(vs_build_type) = 'build where' then
			vs_colname = "nvl("+vs_colname+",~~'N~~')"
		elseif lower(vs_build_type) = 'modify' then
			vs_colname = "if( isnull( "+vs_colname+" ),~~'N~~',"+vs_colname+")"
		else
			vs_colname = "if( isnull( "+vs_colname+" ),'N',"+vs_colname+")"
		end if
		if isnull(vs_data) or len(trim(vs_data)) = 0 then vs_data = 'N'
	elseif isnull(vs_data) then
		vs_data = '()'
	end if
	if trim(vs_data) = '()' or (right(trim(vs_data),2) = '()' and left(trim(vs_data),2) <> '<>') then
		if lower(vs_build_type) = 'build where' then
			ls_return_string = vs_colname + ' is null'
		else
			ls_return_string = ' isnull(' + vs_colname + ')'
			if vs_coltype = 'char(1)' then 
				ls_return_string = ls_return_string + " or " + vs_colname + " = ~~'N~~' "
			end if
		end if
	elseif trim(vs_data) = '<>()' then
		if lower(vs_build_type) = 'build where' then
			ls_return_string = vs_colname + ' is not null'
		else
			ls_return_string = ' not isnull(' + vs_colname + ')'
		end if
	elseif trim(vs_data) = "''" then
		ls_return_string = this.f_get_data_char( "",vs_colname, ls_build_type)
	else
		ls_return_string = this.f_get_data_char( vs_data,vs_colname, ls_build_type)
	end if
elseif left(vs_coltype,5) = 'numbe' or  left(vs_coltype,5) = 'decim' then // KIỂU SỐ
	if lower(trim(vs_data)) = 'me/toi' or lower(trim(vs_data)) = 'me/tôi' &
			or lower(trim(vs_data)) = 'me\toi' or lower(trim(vs_data)) = 'me\tôi' then
			vs_data = 'me'
	elseif lower(trim(vs_data)) = '<>me/toi' or lower(trim(vs_data)) = '<>me/tôi' &
			or lower(trim(vs_data)) = 'me\toi' or lower(trim(vs_data)) = '<>me\tôi' then
			vs_data = '<>me'
	end if
	if isnull(vs_data) and lower(vs_build_type) = 'build where' then
		vs_data = '0'
		vs_colname = 'NVL('+vs_colname+',0)'
	elseif  isnull(vs_data) then 
		vs_data = '()'
	end if
	if trim(vs_data) = '()' or (right(trim(vs_data),2) = '()' and left(trim(vs_data),2) <> '<>') then
		if lower(vs_build_type) = 'build where' then
			ls_return_string = vs_colname + ' is null'
		else
			ls_return_string = ' isnull(' + vs_colname + ')'
		end if
	elseif trim(vs_data) = '<>()' then
		if lower(vs_build_type) = 'build where' then
			ls_return_string = vs_colname + ' is not null'
		else
			ls_return_string = ' not isnull(' + vs_colname + ')'
		end if
	elseif lower(trim(vs_data)) = 'me' then
		ls_return_string = vs_colname + ' = ' +  string(gi_userid)
	elseif lower(trim(vs_data)) = '<>me' then
		ls_return_string = vs_colname + ' <> ' +  string(gi_userid)
	else
		ls_return_string = vs_colname + ' ' + this.f_get_data_number( vs_data)
	end if
elseif left(vs_coltype,5) = 'date(' or  left(vs_coltype,5) = 'datet' then // KIỀU NGÀY / GIỜ
	if isnull(vs_data) and lower(vs_build_type) = 'build where' then
		vs_data = '01/01/1900'
		vs_colname = 'NVL('+vs_colname+',to_date(01/01/1900))'
	elseif  isnull(vs_data) then
		vs_data = '()'
	end if
	if pos(trim(lower(vs_data)),'today') > 0 or pos(trim(lower(vs_data)),'homnay') > 0 or pos(trim(lower(vs_data)),'hôm nay') > 0 then
		ls_data = lc_dt.f_getsysdate( gs_w_date_format)
		if left(vs_data,2) = '<>' or left(vs_data,2) = '>=' or left(vs_data,2) = '<=' then
			vs_data = left(vs_data,2) + ls_data
		elseif left(vs_data,1) = '>' or left(vs_data,1) = '<' then
			vs_data = left(vs_data,1) + ls_data
		end if
	end if
	if trim(vs_data) = '()' or (right(trim(vs_data),2) = '()' and left(trim(vs_data),2) <> '<>') then
		if lower(vs_build_type) = 'build where' then
			ls_return_string = vs_colname + ' is null'
		else
			ls_return_string = ' isnull(' + vs_colname + ')'
		end if
	elseif trim(vs_data) = '<>()' then
		if lower(vs_build_type) = 'build where' then
			ls_return_string = vs_colname + ' is not null'
		else
			ls_return_string = ' not isnull(' + vs_colname + ')'
		end if
//	elseif trim(vs_data) = '*' and len(vs_data) = 1 then
//		ls_return_string = vs_colname +' > '+"date('01/01/1990')"
	else
		ls_return_string = this.f_get_data_datet( vs_data,vs_colname,ls_build_type)
	end if
end if
return ls_return_string

end function

public function string f_get_data_number (string vs_data);string 			ls_rtn,ls_data,ls_values[],ls_rtn_expression,ls_rtn_data
string				ls_format
int					li_i
long				ll_test
//c_obj_service	this

ls_data = f_removewhitespace(vs_data)
if gs_decimal = ',' then ls_data = this.f_globalreplace( ls_data, ',', '.')
if this.f_check_data_number( ls_data) then return ' = ' + ls_data
if pos(ls_data,':')>0 or pos(ls_data,';')>0 or pos(ls_data,',') > 0 then // BETWEEN AND <=> (0:9) or IN <=> (1;2;3) 
	if pos(ls_data,',') > 0 and left(ls_data,1) = '(' and right(ls_data,1 )=')' then //- trờng hợp đối tượng liện quan builwhere relation--//
		ls_data = this.f_globalreplace( ls_data, ',', ';')
	end if
	return f_compare_expression_in_or_between(ls_data,ls_rtn_expression,ls_rtn_data)
else
	if len(ls_data) = 1 then
		ls_rtn_expression = '='
		ls_rtn_data = ' -1'
		if isnumber(ls_data) then
			ls_rtn_data = ls_data
		elseif ls_data = '(' then
		elseif ls_data = '>' or ls_data = '<' or ls_data = '=' then
			ls_rtn_expression = ls_data
		end if
	elseif len(ls_data) > 1 then
		If Match(ls_data,"^>= *[^(]+$") or Match(ls_data,"^<= *[^(]+$") or Match(ls_data,"^<> *[^(]+$") &
			or Match(ls_data,"^<> *.+$") or Match(ls_data,"^>= *.+$") or Match(ls_data,"^>= *.+$") Then // <>,>=,<= not ()
			f_compare_expression_two_char(ls_data,ls_rtn_expression,ls_rtn_data)
		elseif Match(ls_data,"^> *[^=].*$") or Match(ls_data,"^< *[^=].*$") Then //< ,> not ()
			f_compare_expression_one_char(ls_data,ls_rtn_expression,ls_rtn_data)
		else
			if pos(ls_data,'(') = lastpos(ls_data,'(') and pos(ls_data,'(')<>0 then
				ls_rtn_expression = '='
				if match(ls_data,'[+ * / -]$') then
					if not isnumber(mid(ls_data,len(ls_data)-1,1)) then 
						ls_rtn_data = ' -1'
						return ls_rtn_expression + ls_rtn_data
					end if
					if left(ls_data,1) = '(' then
						if (mid(ls_data,lastpos(ls_data,right(ls_data,1))-1,1) = ')' or isnumber(mid(ls_data,lastpos(ls_data,right(ls_data,1))-1,1))) and len(ls_data)>3 then
							ls_rtn_data = trim(mid(ls_data,1,lastpos(ls_data,right(ls_data,1)) - 1))
						else
							ls_rtn_data = trim(mid(ls_data,2,lastpos(ls_data,right(ls_data,1)) - 2))
						end if
					elseif  pos(ls_data,')') = 0 then
						ls_rtn_data = ' -1'
					else
						ls_rtn_data = trim(mid(ls_data,1,lastpos(ls_data,right(ls_data,1)) - 1))
					end if
					if this.f_check_data_number( ls_rtn_data) then
						return ls_rtn_expression + ls_rtn_data
					else
						return ' = -1'
					end if
				end if
				if left(ls_data,1) = '(' then
					if (right(ls_data,1) = ')' or isnumber(right(ls_data,1))) and len(ls_data)>4 then
						if pos(ls_data,'(') <> lastpos(ls_data,'(') or pos(ls_data,')') <> lastpos(ls_data,')') then
							ls_rtn_data = ' -1'
						else
							ls_rtn_data = ls_data
						end if
					elseif pos(ls_data,')') = 0 then
						ls_rtn_data = mid(vs_data,1,len(ls_data)) + ')'
					else
						ls_rtn_data = mid(vs_data,2,pos(ls_data,')')-2)
					end if
				else
					if (isnumber(left(ls_data,1)) or pos(ls_data,'(') = len(ls_data)) and pos(ls_data,')') = 0 then
						ls_rtn_data = left(ls_data,1)
					else
						if pos(ls_data,'()') > 0 then
							ls_rtn_expression = '='
							ls_rtn_data = ' -1'
						else
							if isnumber(mid(ls_data,pos(ls_data,')')-1,1)) then
								ls_rtn_data = ls_data
							else
								ls_rtn_expression = '='
								ls_rtn_data = ' -1'
							end if
						end if
					end if
				end if
			elseif pos(ls_data,'(') = 0 then
				ls_rtn_expression = '='
				if match(ls_data,'[+ * / -]$') then
					if not isnumber(mid(ls_data,len(ls_data)-1,1)) then 
						ls_rtn_data = ' -1'
						return ls_rtn_expression + ls_rtn_data
					end if
					ls_rtn_data = trim(mid(ls_data,1,lastpos(ls_data,right(ls_data,1)) - 1))
					if this.f_check_data_number( ls_rtn_data) then
						return ls_rtn_expression + ls_rtn_data
					else
						return ' = -1'
					end if
				end if
				ls_rtn_data = ls_data
			else
				ls_rtn_expression = '='
				ls_rtn_data = ' -1'
			end if
		end if
	end if
end if
//return vs_data
if this.f_check_data_number( ls_rtn_data) then
	return ls_rtn_expression + ls_rtn_data
else
	return ' = -1'
end if
end function

public function boolean f_check_data_number (string vs_data);string					ls_err,ls_syntax,ls_sql, ls_data

//ls_sql = "select "+vs_data+" from dual"
//ls_syntax = SQLCA.syntaxfromsql( ls_sql, '', ls_err)
if isnumber(vs_data) then
//if ls_err = '' then
	if pos(vs_data,'+-') + pos(vs_data,'-+')+ pos(vs_data,'*+')+ pos(vs_data,'*-')+ pos(vs_data,'/+')+ pos(vs_data,'++') + pos(vs_data,'/-') > 0 then
		return false
	else
		return true
	end if
else
	if pos(vs_data,'+') + pos(vs_data,'-')+ pos(vs_data,'*')+ pos(vs_data,'/') > 1 then
		return true
	else		
		if left(vs_data ,1) = '(' and right(vs_data,1) = ')' and (pos(vs_data,';') > 0 or pos(vs_data,',') > 0 )then			
			return false
		else
			ls_data = mid(vs_data,2,len(vs_data) - 2)
			if isnumber(ls_data) then
				return true
			else
				return false
			end if
		end if
	end if
end if
end function

public function string f_get_data_sysdate (string vs_data);string 			ls_date
int					li_pos,li_day
datetime			ldt_sysdate,ldt_date
c_datetime		lc_datet

li_pos = pos(vs_data,'+') + pos(vs_data,'-')
li_day = long(mid(vs_data,li_pos+1,len(vs_data)))
if pos(vs_data,'-') > 0 then
	li_day = li_day * -1
end if
ldt_sysdate = lc_datet.f_getsysdate( )
ls_date = string(lc_datet.f_add_date( date(ldt_sysdate), li_day))
return ls_date
end function

public function string f_check_type_char (ref string rs_conv, ref string rs_conv2, ref string rs_conv3, ref string rs_mat_reg, string vs_data, string vs_build_type);//--gán các ký tự đặt trưng cho kiểu chuỗi của PB và ORA--//
if vs_build_type = 'filter' then
	rs_mat_reg = "match("
	if pos(vs_data,"'") > 0 then
		rs_conv = '"'
		rs_conv2 = ',"'
		rs_conv3 = '")'
	elseif pos(vs_data,'"') > 0 then
		rs_conv = "'"
		rs_conv2 = ",'"
		rs_conv3 = "')"
	else
		rs_conv = '"'
		rs_conv2 = ',"'
		rs_conv3 = '")'
	end if
elseif lower(vs_build_type) = 'modify' then
	rs_mat_reg = "match("
	if pos(vs_data,'"') > 0 then
		rs_conv = "~~'"
		rs_conv2 = ",~~'"
		rs_conv3 = "~~')"
	elseif pos(vs_data,"'") > 0 then
		rs_conv = '~~"'
		rs_conv2 = ',~~"'
		rs_conv3 = '~~")'
	else
		rs_conv = "~~'"
		rs_conv2 = ",~~'"
		rs_conv3 = "~~')"
	end if
else
	rs_mat_reg = 'REGEXP_LIKE('
//	if pos(vs_data,'"') > 0 then
//		rs_conv = "~~'"
//		rs_conv2 = ",~~'"
//		rs_conv3 = "~~')"
//	elseif pos(vs_data,"'") > 0 then
//		rs_conv = '~~"'
//		rs_conv2 = ',~~"'
//		rs_conv3 = '~~")'
//	else
		rs_conv = "~~'"
		rs_conv2 = ",~~'"
		rs_conv3 = "~~')"
//	end if
end if

return vs_build_type
end function

public function string f_get_date_spec (string vs_data, string vs_expression, string vs_build_type, string vs_colname);/********************************************
	Xử lý date theo cách nhập đặt biệt có dạng :
	1: * / * / yyyy		từ đầu năm đến cuối năm
	2: * /mm/yyyy	đầu tháng cuối tháng
	3: dd/mm/ *		ngày trong tháng của tất cả các năm
	4: dd/ * / *			ngày của tất cả các tháng và các năm
	5:	dd/ * /yyyy		ngày của tất cả các tháng trong năm
	6: * /mm/ *		1 tháng của các năm
	
	dd/mm/ * :dd/mm/ *
*********************************************/

string 				ls_rtn,ls_data,ls_sources[],ls_first,ls_last,ls_format,ls_formats[],ls_datas[],ls_date[],las_w_date_format[]
string					ls_fomat,ls_rtn_data,ls_tmp
string 				ls_conv,ls_conv2,ls_conv3,ls_mat_reg
int						li_rtn,li_idx1,li_idx2,li_idx3
c_datetime 			lc_datetime
//c_obj_service		this

ls_data = vs_data
setnull(ls_rtn)

if pos(ls_data,'(')>0 then
	ls_data = mid(ls_data,2,pos(ls_data,')') - pos(ls_data,'(') - 1)
end if
if pos(gs_w_date_format,'/') > 0 then
	ls_tmp = '/'
	li_rtn = this.f_stringtoarray(gs_w_date_format,'/',las_w_date_format[])
else
	ls_tmp = '-'
	li_rtn = this.f_stringtoarray(gs_w_date_format,'-',las_w_date_format[])
end if
if len(las_w_date_format[1]) = 1 then las_w_date_format[1] = las_w_date_format[1] + las_w_date_format[1]
if len(las_w_date_format[2]) = 1 then las_w_date_format[2] = las_w_date_format[2] + las_w_date_format[2]
li_rtn = this.f_stringtoarray(ls_data,'/',ls_sources[])

if li_rtn = 3 then
	this.f_arraytostring( las_w_date_format, ls_tmp, ls_fomat)
	if ls_sources[1] = '*' and ls_sources[2] = '*' and ls_sources[3] <> '*' then // trường hợp */*/yyyy (xem cả năm)
		ls_rtn = '('
		ls_first = string(lc_datetime.f_firstdayofmonth( date('01/01/'+ls_sources[3])))
		if lower(las_w_date_format[1]) = 'mm'  then
			ls_last = string(lc_datetime.f_lastdayofmonth( date('12/01/'+ls_sources[3])))
		elseif lower(las_w_date_format[1]) = 'dd'  then
			ls_last = string(lc_datetime.f_lastdayofmonth( date('01/12/'+ls_sources[3])))
		end if
		ls_rtn += ls_first + ':' + ls_last + ')'
		if vs_expression = '<>' then
			vs_expression = ' NOT '
		elseif vs_expression = '=' then
			vs_expression = ''
		else
			return ''
		end if
		if vs_build_type <> 'filter' and vs_build_type <> 'modify' then
			ls_rtn =vs_colname +vs_expression+ this.f_get_date_in_between( ls_rtn, ls_fomat, vs_build_type)
		else
			ls_rtn =vs_colname +vs_expression+ this.f_get_date_in_between( ls_rtn, '', vs_build_type)
		end if
	elseif ls_sources[1] = '*' and ls_sources[2] <> '*' and ls_sources[3] <> '*' and (lower(las_w_date_format[1]) = 'dd') then // trường hợp */mm/yyyy (xem 1 tháng)
		ls_rtn = '('
		ls_sources[1] = '01'
		this.f_arraytostring(ls_sources[],'/',ls_first)
		ls_last = string(lc_datetime.f_lastdayofmonth( date(ls_first)) )
		ls_rtn += ls_first + ':' + ls_last + ')'
		if vs_expression = '<>' then
			vs_expression = ' NOT '
		elseif vs_expression = '=' then
			vs_expression = ''
		else
			return ''
		end if
		if vs_build_type <> 'filter' and vs_build_type <> 'modify' then
			ls_rtn =vs_colname +vs_expression+ this.f_get_date_in_between( ls_rtn, gs_w_date_format, vs_build_type)
		else
			ls_rtn =vs_colname +vs_expression+ this.f_get_date_in_between( ls_rtn, '', vs_build_type)
		end if
	elseif ls_sources[1] <> '*' and ls_sources[2] = '*' and ls_sources[3] <> '*' then //ngày của tất cả các tháng trong năm
		ls_rtn = '('
		for li_idx1 = 1 to 12
			ls_rtn += ls_sources[1] + ls_tmp + string(li_idx1,'00') + ls_tmp + ls_sources[3]
			if li_idx1 < 12 then ls_rtn += ';'
		next
		ls_rtn += ')'
		ls_rtn = vs_colname + this.f_get_date_in_between( ls_rtn, '', vs_build_type)
	elseif ls_sources[1] <> '*' and ls_sources[2] <> '*' and ls_sources[3] = '*' then // dd/mm/ *		ngày trong tháng của tất cả các năm
	elseif ls_sources[1] <> '*' and ls_sources[2] = '*' and ls_sources[3] = '*' then	//dd/ * / *			ngày của tất cả các tháng và các năm
	elseif ls_sources[1] <> '*' and ls_sources[2] <> '*' and ls_sources[3] = '*' then //* /mm/ *		1 tháng của các năm
	elseif vs_build_type <> 'filter' and vs_build_type <> 'modify' then
		for li_idx1 =upperbound(ls_sources[]) to 1 step -1
			if ls_sources[li_idx1] <> '*' then
				li_idx2 += 1
				if li_idx1 =1 then
					ls_formats[li_idx2] = las_w_date_format[li_idx2]
				elseif li_idx1 = 2 then
					ls_formats[li_idx2] = las_w_date_format[li_idx2]
				elseif li_idx1 = 3 then
					ls_formats[li_idx2] = las_w_date_format[li_idx2]
				end if
				if long(ls_sources[li_idx1]) >= 10 then
					ls_datas[li_idx2] = ls_sources[li_idx1]
				else
					if left(ls_sources[li_idx1],1) <> '0' then
						ls_datas[li_idx2] = '0' + ls_sources[li_idx1]
					else
						ls_datas[li_idx2] = ls_sources[li_idx1]
					end if
				end if
			end if
		next
		if upperbound(ls_datas[]) > 1 then
			this.f_arraytostring(ls_formats[],'/',ls_fomat)
			this.f_arraytostring(ls_datas[],'/',ls_rtn_data)
		else
			ls_fomat = ls_formats[1]
			ls_rtn_data = ls_datas[1]
		end if
		this.f_check_type_datet(ls_conv , ls_conv2, ls_conv3, ls_mat_reg, ls_fomat, vs_build_type)
		ls_rtn = ls_mat_reg + vs_colname +','+ls_conv+ls_fomat+ls_conv3+vs_expression+ls_conv+ls_rtn_data+ls_conv
	end if
else
	ls_fomat = ''
	this.f_check_type_datet(ls_conv , ls_conv2, ls_conv3, ls_mat_reg, ls_fomat, vs_build_type)
	if vs_build_type <> 'filter' then ls_fomat = gs_w_date_format
	ls_rtn_data = '01/01/1900'
	ls_rtn =vs_colname + '=' + ls_mat_reg + ls_conv + ls_rtn_data + ls_conv2 + ls_fomat + ls_conv3
end if
return ls_rtn
end function

public function string f_get_date_in_between (string vs_data, string vs_fomat, string vs_build_type);string 					ls_data,ls_values[],ls_rtn_data,ls_rtn_expression
string						ls_mat_reg,ls_conv,ls_conv2,ls_conv3
int							li_i
boolean					lb_isdate = true
//c_obj_service			this
c_datetime				lc_dt

ls_data = mid(vs_data,2,pos(vs_data,')') - pos(vs_data,'(') - 1) 
this.f_check_type_datet( ls_conv, ls_conv2, ls_conv3, ls_mat_reg, vs_fomat, vs_build_type)
if pos(ls_data,':')>0 and lastpos(ls_data,':') = pos(ls_data,':') then
	this.f_stringtoarray( ls_data, ':', ls_values[])
	//if lc_dt.f_isvalid( ls_values[1], vs_fomat) and lc_dt.f_isvalid( ls_values[2], vs_fomat) then
	if isdate(ls_values[1]) and isdate(ls_values[2]) then
		ls_rtn_data =' BETWEEN '+ ls_mat_reg + ls_conv+ls_values[1]+ ls_conv2+ vs_fomat +ls_conv3 +&
						' AND '+ ls_mat_reg + ls_conv+ ls_values[2]+ ls_conv2+vs_fomat+ls_conv3
	else
		ls_rtn_expression = '='
		if vs_build_type <> 'filter' and vs_build_type <> 'modify' then
			ls_rtn_data = "to_date(~~'01/01/1900~~','"+vs_fomat+"')"
		else
			ls_rtn_data = "date('01/01/1900')"
		end if
	end if
elseif lastpos(ls_data,':') <> pos(ls_data,':') then
	ls_rtn_expression = '='
	if vs_build_type <> 'filter' and vs_build_type <> 'modify' then
		ls_rtn_data = "to_date(~~'01/01/1900~~','"+vs_fomat+"')"
	else
		ls_rtn_data = "date('01/01/1900')"
	end if
end if
//--dạng (date1;date2;daten) <=> IN (date1,date2,daten) --//
if pos(ls_data,';')>0 then
	this.f_stringtoarray( ls_data, ';', ls_values[])
	for li_i = 1 to upperbound(ls_values[])
//		if lc_dt.f_isvalid( ls_values[li_i], vs_fomat) then
		if not isdate(ls_values[li_i]) then
			lb_isdate = false
			exit
		end if
	next
	if lb_isdate then
		for li_i = 1 to upperbound(ls_values[])
			ls_values[li_i] = ls_mat_reg+ls_conv+ls_values[li_i]+ls_conv2+ vs_fomat +ls_conv3
		next
		this.f_arraytostring( ls_values, ',', ls_data)
		ls_rtn_data =' IN('+ls_data+')'
	else
		ls_rtn_expression = '='
		if vs_build_type <> 'filter' and vs_build_type <> 'modify' then
			ls_rtn_data = "to_date(~~'01/01/1900~~','"+vs_fomat+"')"
		else
			ls_rtn_data = "date('01/01/1900')"
		end if
	end if
end if

return ls_rtn_expression + ls_rtn_data
end function

public function string f_get_date_stand (string vs_build_type);string			ls_rtn_data
if vs_build_type <> 'filter' and vs_build_type <> 'modify' then
	ls_rtn_data = "to_date(~~'01/01/1900~~',~~'dd/mm/yyyy~~')"
else
	ls_rtn_data = "date('01/01/1900')"
end if
return ls_rtn_data
end function

public function string f_get_data_char (string vs_data, string vs_colname, string vs_build_type);string 			ls_data,ls_rtn,ls_values[],ls_rtn_data,ls_rtn_expression
string				ls_conv,ls_conv2,ls_conv3,ls_mat_reg, ls_digit1, ls_digit2, ls_digit
int 				li_i, li_chk1,li_chk2,li_chk3,li_chk4,li_chk5
//c_obj_service 	this

if pos(vs_data,';') = 0 and pos(vs_data,':') = 0 and pos(vs_data,'=') = 0 then
	vs_data = upper(vs_data)
end if
ls_data = vs_data
this.f_check_type_char( ls_conv, ls_conv2, ls_conv3, ls_mat_reg, vs_data, lower(vs_build_type))
if pos(ls_data,'(') = 0 and pos(ls_data,'[') = 0 then
	if len(ls_data) = 1 and lower(vs_build_type) = 'filter' then
		if not match(ls_data,"^[><=]") then
			ls_rtn_expression = ''
			ls_rtn_data = vs_data
		else
			ls_rtn_expression = ls_data
			ls_rtn_data = "'a'"
		end if
	elseif len(ls_data) > 1 then
		If Match(ls_data,"^>= *[^(]+$") or Match(ls_data,"^<= *[^(]+$") or Match(ls_data,"^<> *[^(]+$") &
			or Match(ls_data,"^<> *.+$") or Match(ls_data,"^>= *.+$") or Match(ls_data,"^>= *.+$") then
			if Match(ls_data,"^<> *.+)$") then
				ls_data = Trim(Mid(ls_data,3))
				ls_rtn_expression = ' NOT'
			else
				ls_rtn_expression = left(ls_data,2)
			end if
			ls_rtn_data = mid(ls_data,3,len(ls_data))
		elseif left(ls_data,1) = '>' or left(ls_data,1) = '<'  or left(ls_data,1) = '=' then
			ls_rtn_expression = left(ls_data,1)
			ls_rtn_data = mid(ls_data,2,len(ls_data))
		elseif pos(ls_data,';')>0 then
			return this.f_get_char_in_between( ls_data, vs_colname, ls_rtn_expression, vs_build_type)
		end if
	end if
else
	if Match(ls_data,"^<> *.+)$") then
		ls_data = Trim(Mid(ls_data,3))
		ls_rtn_expression = ' NOT'
	elseif Match(ls_data,"^= *") then
		ls_data = trim(mid(ls_data,2))
		ls_rtn_expression = '='
	else
		ls_rtn_expression = ''
	end if
	if pos(ls_data,')') = 0 and pos(ls_data,']') = 0 then
		ls_rtn_data = mid(ls_data,pos(ls_data,'(')+1,len(ls_data))
	else
		if pos(ls_rtn_expression,'=') = 0 then
			if Match(ls_data,"^(+.+)$") then 
				if (pos(ls_data,':') > 0 and lastpos(ls_data,':') = pos(ls_data,':')) or pos(ls_data,';')> 0 then
					return this.f_get_char_in_between( ls_data, vs_colname, ls_rtn_expression, vs_build_type)
				else			
					ls_rtn_data = mid(ls_data,pos(ls_data,'(')+1,pos(ls_data,')') - pos(ls_data,'(') -1)
					return ls_rtn_expression + ' ' + this.f_get_data_char(ls_rtn_data,vs_colname,vs_build_type)
				end if
			else
				ls_rtn_expression = '='
				ls_rtn_data = ls_data
			end if
		else
			ls_rtn_data = ls_data
		end if
	end if
end if
if ls_rtn_expression <> '' then
	if ls_rtn_expression = '=' then
		ls_rtn = vs_colname + " " + ls_rtn_expression + ' ' +ls_conv + ls_rtn_data +ls_conv
	elseif ls_rtn_data = '' then
		ls_rtn = 'upper('+vs_colname+')' + " " + ls_rtn_expression + ' ' +ls_conv + ls_rtn_data +ls_conv + ' OR isnull('+vs_colname+')'
	else
		ls_rtn = 'upper('+vs_colname+')' + " " + ls_rtn_expression + ' ' +ls_conv + ls_rtn_data +ls_conv
	end if
else
	if vs_build_type = 'filter' then
		//-- for THM --//
		li_chk1 = pos(upper(vs_data),'CK=')
		li_chk2 = pos(upper(vs_data),'CK>=')
		li_chk3 = pos(upper(vs_data),'CK>')
		li_chk4 = pos(upper(vs_data),'CK<=')
		li_chk5 = pos(upper(vs_data),'CK<')		
		
		if li_chk1 > 0 then			
			ls_digit1= mid(vs_data, li_chk1 +3, 1)
			ls_digit2 = mid(vs_data, li_chk1 +4, 1)
			if ls_digit1 <> '' and match(ls_digit1, '[1-9]') then
				ls_digit = ls_digit1								
				if ls_digit2 <> '' and match(ls_digit2, '[0-9]') then
					ls_digit += ls_digit2				
				end if							
			end if
		elseif  li_chk2 > 0 then
			ls_rtn_data = left(vs_data, li_chk2 -1)
			ls_digit1= mid(vs_data, li_chk2 +4, 1)		
			ls_digit2 = mid(vs_data, li_chk2 +5, 1)
			if ls_digit1 <> '' and match(ls_digit1, '[1-9]') then								
				if ls_digit2 <> '' and match(ls_digit2, '[0-9]') then
//					ls_digit = '('+ ls_digit1 +'['+ string(integer(ls_digit2))  +' - 9]|['+string(integer(ls_digit1)+1) +'-9][0-9]' +')'
					ls_digit = '['+ls_digit1+ '-9][0-9]'
				else
					ls_digit = '['+ string(integer(ls_digit1)) +'-9]'
				end if							
			end if					
		elseif  li_chk3 > 0 then
			ls_rtn_data = left(vs_data, li_chk3 -1)			
			ls_digit1= mid(vs_data, li_chk3 +3, 1)			
			ls_digit2 = mid(vs_data, li_chk3 +4, 1)
			if ls_digit1 <> '' and match(ls_digit1, '[1-9]') then								
				if ls_digit2 <> '' and match(ls_digit2, '[0-9]') then
					ls_digit = '['+string(integer(ls_digit1)+1)+ '-9][0-9]'
//					ls_digit = '('+ ls_digit1 +'['+ string(integer(ls_digit2)+1)  +' - 9]|['+string(integer(ls_digit1)+1) +'-9][0-9]' +')'
				else
					ls_digit = '['+ string(integer(ls_digit1)+1) +'-9]'
				end if							
			end if			
		elseif  li_chk4 > 0 then
			ls_rtn_data = left(vs_data, li_chk4 -1)
			ls_digit1= mid(vs_data, li_chk4 +4, 1)
			ls_digit2 = mid(vs_data, li_chk4 +5, 1)	
			if ls_digit1 <> '' and match(ls_digit1, '[1-9]') then								
				if ls_digit2 <> '' and match(ls_digit2, '[0-9]') then
					ls_digit = '[1-'+ls_digit1+'][0-'+ls_digit2+']'
//					ls_digit = '('+ ls_digit1 +'[0-'+ string(integer(ls_digit2))  +']|[0-'+string(integer(ls_digit1) -1) +'][0-9]' +')'
				else
					ls_digit = '[0-'+ string(integer(ls_digit1)) +']'
				end if							
			end if							
		elseif  li_chk5 > 0 then
			ls_rtn_data = left(vs_data, li_chk5 -1)
			ls_digit1= mid(vs_data, li_chk5 +3, 1)
			ls_digit2 = mid(vs_data, li_chk5 +4, 1)			
			if ls_digit1 <> '' and match(ls_digit1, '[1-9]') then								
				if ls_digit2 <> '' and match(ls_digit2, '[0-9]') then
					ls_digit = '[0-'+string(integer(ls_digit1)-1)+'][0-'+string(integer(ls_digit2)-1)+']'
//					ls_digit = '('+ ls_digit1 +'[0-'+ string(integer(ls_digit2)-1)  +']|[0-'+string(integer(ls_digit1)-1) +'][0-9]' +')'
				else
					ls_digit = '[0-'+ string(integer(ls_digit1)-1) +']'
				end if					
			end if						
		else
			ls_rtn_data = vs_data		
		end if
		ls_rtn_data = this.f_globalreplace( ls_rtn_data, '*', '.*')
		ls_rtn_data = upper(ls_rtn_data)
		if ls_digit <> '' then ls_rtn_data +='CK'+ls_digit
	else
		ls_rtn_data = this.f_conver_data_pb_to_ora( vs_data)
	end if
	if ls_rtn_data = '' or ls_rtn_data = '*' then
		if vs_build_type = 'build where' then
			ls_rtn = '(' + ls_mat_reg+'upper('+vs_colname+')'+ls_conv2 + ls_rtn_data + ls_conv3 + ' OR '+vs_colname+' is null)'
		else
			ls_rtn = ls_mat_reg+'upper('+vs_colname+')'+ls_conv2 + ls_rtn_data + ls_conv3 + ' OR isnull('+vs_colname+')'
		end if
	else //-- filter--//
		ls_rtn = ls_mat_reg+'upper('+vs_colname+')'+ls_conv2 + ls_rtn_data + ls_conv3
	end if
end if
return ls_rtn 
end function

public function string f_get_char_in_between (string vs_data, string vs_colname, string vs_expression, string vs_build_type);string 			ls_data,ls_rtn,ls_values[],ls_rtn_data
string				ls_conv,ls_conv2,ls_conv3,ls_mat_reg
int 				li_i
//c_obj_service 	this

ls_data = vs_data
this.f_check_type_char( ls_conv, ls_conv2, ls_conv3, ls_mat_reg, ls_data, lower(vs_build_type))
if pos(ls_data,':') > 0 and lastpos(ls_data,':') = pos(ls_data,':') and (pos(ls_data,'(') = 1 and lastpos(ls_data,')') = len(ls_data) ) then
	if mid(ls_data,pos(ls_data,':')+1,1) <> ')' then
		ls_rtn_data = mid(ls_data,pos(ls_data,'(')+1,pos(ls_data,')') - pos(ls_data,'(') -1)
		this.f_stringtoarray( ls_rtn_data, ':', ls_values[])
		ls_rtn = vs_colname + vs_expression + ' BETWEEN '+ ls_conv +ls_values[1] + ls_conv + ' AND ' + ls_conv + ls_values[2]+ls_conv
		vs_expression = ''
		ls_rtn_data = ''
		return ls_rtn
	else
		return vs_colname + " > 'A'"
	end if
elseif pos(ls_data,';')> 0 then
	if pos(ls_data,']') = 0 and pos(ls_data,')') > 0 then
		if mid(ls_data,pos(ls_data,';')+1,1) <> ')' then
			ls_rtn_data = mid(ls_data,pos(ls_data,'(')+1,pos(ls_data,')') - pos(ls_data,'(') -1)
			this.f_stringtoarray( ls_rtn_data, ';', ls_values[])
			ls_rtn =' IN ('
			for li_i =1 to upperbound(ls_values[])
				if li_i<>upperbound(ls_values[]) then
					ls_rtn += ls_conv + ls_values[li_i]+ls_conv+','
				else
					ls_rtn +=ls_conv + ls_values[li_i]+ls_conv+ ')'
				end if
			next
			ls_rtn = vs_expression + ls_rtn
			vs_expression = ''
			ls_rtn_data = ''
			return vs_colname + ls_rtn
		else
			return vs_colname + " > 'A'"
		end if
	else
		if pos(ls_data,'[') > 0 then
			ls_rtn_data = mid(ls_data,pos(ls_data,'[')+1,pos(ls_data,']') - pos(ls_data,'[') -1)
			ls_rtn_data = '(' + this.f_globalreplace( ls_rtn_data, ';', ')|(') + ')'
			ls_rtn_data = this.f_globalreplace( ls_rtn_data, '|()', '')
		else
			if pos(ls_data,';') = 1 and lastpos(ls_data,';') = len(ls_data) then
//			ls_rtn_data = ls_data
				ls_data = mid(ls_data,2,len(ls_data)-2)
				ls_rtn_data = '(;' + this.f_globalreplace( ls_data, ';', ';)|(;') + ';)'
				ls_rtn_data = this.f_globalreplace( ls_rtn_data, '|(;;)', '')
			else
				ls_rtn_data = '(' + this.f_globalreplace( ls_data, ';', ')|(') + ')'
				ls_rtn_data = this.f_globalreplace( ls_rtn_data, '|()', '')
			end if
		end if
		ls_rtn = ls_mat_reg + vs_colname + ls_conv2 + ls_rtn_data + ls_conv3
		return ls_rtn
	end if
else
	ls_data = this.f_globalreplace(ls_data , "'", "~~'")
	ls_rtn = vs_colname + " = '" + ls_data + "'"
	return ls_rtn
end if
end function

public function string f_conver_data_pb_to_ora (string vs_data);int					li_pos,li_last_pos,li_appear,li_len_data,li_idx
string				ls_rtn,ls_data,ls_expression

ls_data = vs_data

if len(ls_data) > 1 then
	ls_data = this.f_globalreplace( ls_data, '.', '\.')
	ls_data = this.f_globalreplace( ls_data, '?', '\?')
	ls_data = this.f_globalreplace( ls_data, '^', '\^')
	ls_data = this.f_globalreplace( ls_data, '$', '\$')
	ls_data = this.f_globalreplace( ls_data, '+', '\+')
end if

li_pos = pos(ls_data,'*')
li_last_pos = lastpos(ls_data,'*')
li_appear = this.f_countoccurrences( ls_data, '*')
li_len_data = len(ls_data)
if pos(ls_data,'\*') > 0 then ls_data = this.f_globalreplace( ls_data, '\*', ':=')
if li_pos = 1 and li_appear = 1 and li_len_data > 1 then  //-- *a --//
	ls_expression = mid(ls_data,1,li_pos)
	ls_data = mid(ls_data,li_pos + 1, li_len_data)
	ls_expression = this.f_globalreplace( ls_expression, '*', '$')
	ls_rtn = this.f_globalreplace( ls_data, ':=', '\*') + ls_expression
elseif li_pos = li_len_data and li_appear = 1 and li_len_data > 1 then  //-- a* --//
	ls_expression = mid(ls_data,li_last_pos ,1)
	ls_data = mid(ls_data,1, li_len_data -1)
	ls_expression = this.f_globalreplace( ls_expression, '*', '^')
	ls_rtn = ls_expression + this.f_globalreplace( ls_data, ':=', '\*') 
elseif  li_appear = 1 and  li_pos < li_len_data and li_pos > 1 then
	ls_data = this.f_globalreplace( ls_data, '*', '.+')
	ls_rtn =  this.f_globalreplace( ls_data, ':=', '\*')  	
elseif li_appear > 1 and li_pos = 1 and li_last_pos = li_len_data  and pos(ls_data, ';') = 0 then //-- *a*b* --//
	ls_data = this.f_globalreplace( ls_data, '*', '.+')
	ls_rtn =  this.f_globalreplace( ls_data, ':=', '\*')  
elseif  li_appear > 1 and li_pos = 1 and li_last_pos = li_len_data  and pos(ls_data, ';') > 0 then //-- *a*;*b* --//
	ls_data = this.f_globalreplace( ls_data, '*', '.+')
	ls_rtn =  this.f_globalreplace( ls_data, ';', '|')  	
elseif  li_appear > 1 and li_pos <> 1 and li_last_pos = li_len_data  and pos(ls_data, ';') > 0 then //-- a*;b* --//
	ls_data = this.f_globalreplace( ls_data, ';', '|^')
	ls_rtn = "^"+ this.f_globalreplace( ls_data, '*', '') 
elseif  li_appear > 1 and li_pos = 1 and li_last_pos < li_len_data  and pos(ls_data,';') > 0 then //-- *a;*b --//
	ls_data = this.f_globalreplace( ls_data, ';', '$|')
	ls_rtn = this.f_globalreplace( ls_data, '*', '') +"$"
else
	if li_pos = 1 and li_appear > 1 then ls_data = '.' + mid(ls_data,2)
	if li_last_pos = li_len_data and li_appear > 1 then ls_data = mid(ls_data,1,li_len_data - 1) + '.'
	if li_appear > 1 then	 ls_data = this.f_globalreplace( ls_data, '*', '.+')
	ls_rtn = ls_data 
end if
return ls_rtn
end function

public function string f_get_data_datet (string vs_data, string vs_colname, string vs_build_type);string 					ls_rtn,ls_data,ls_value,ls_values[],ls_conv,ls_conv2,ls_conv3,ls_mat_reg
string						ls_rtn_expression,ls_rtn_data,ls_fomat
int							li_i
//c_obj_service			this
c_datetime				lc_dt

if pos(vs_data,'-')>0 and pos(vs_data,'sysdate')=0 then
//	ls_data = this.f_globalreplace( vs_data, '-', '/')
//elseif pos(vs_data,'\')>0 then
//	ls_data = this.f_globalreplace( vs_data, '\', '/')
	ls_data = vs_data
elseif pos(vs_data,'sysdate')>0 then
	ls_data = this.f_get_data_sysdate( vs_data)
else
	ls_data = vs_data
end if
if vs_build_type <> 'filter' and vs_build_type <> 'modify' then ls_fomat = gs_w_date_format
ls_data = f_removewhitespace(ls_data)
this.f_check_type_datet( ls_conv, ls_conv2, ls_conv3, ls_mat_reg, ls_fomat, vs_build_type )
//--Không được nhập hơn 1 cặp ()--//
if pos(ls_data,'(') <> lastpos(ls_data,'(') or pos(ls_data,')') <> lastpos(ls_data,')') then
	ls_rtn_expression = '='
	ls_rtn_data = this.f_get_date_stand( vs_build_type)
	return ls_rtn_expression + ls_rtn_data
end if

//if pos(ls_data,'*')>0 and vs_build_type <> 'filter' then
if pos(ls_data,'*')>0 then
	If Match(ls_data,"^>= *[^(]+$") or Match(ls_data,"^<= *[^(]+$") or Match(ls_data,"^<> *[^(]+$") &
			or Match(ls_data,"^<> *.+$") or Match(ls_data,"^>= *.+$") or Match(ls_data,"^>= *.+$") Then
		
		ls_rtn_expression = left(ls_data,2)
		ls_data = mid(ls_data,3)
	elseif Match(ls_data,"^> *[^=].*$") or Match(ls_data,"^< *[^=].*$") Then
		ls_rtn_expression = left(ls_data,1)
		ls_data = mid(ls_data,2)
	else
		ls_rtn_expression = '='
	end if
	ls_rtn = this.f_get_date_spec( ls_data, ls_rtn_expression, vs_build_type, vs_colname)
	return ls_rtn
else
	//--xử lý date theo cách nhập chuẩn dạng dd/mm/yyyy và các phép toán so sánh--//
	if pos(ls_data,'(') > 0 then
		if Match(ls_data,"^<> *.+)$") then
			ls_data = Trim(Mid(ls_data,3))
			ls_rtn_expression = ' NOT '
		end if
		if Match(ls_data,"^(.*[;:]+.+)$") then
			if vs_build_type <> 'build where' then
				ls_rtn = 'date('+vs_colname+')'+ ls_rtn_expression + this.f_get_date_in_between( ls_data, ls_fomat,vs_build_type)
			else
				ls_rtn = vs_colname + ls_rtn_expression + this.f_get_date_in_between( ls_data, ls_fomat,vs_build_type)
			end if
			return ls_rtn
		else
			ls_rtn_expression = ' = '
			ls_rtn_data = this.f_get_date_stand( vs_build_type)
		end if
	else
		If Match(ls_data,"^>= *[^(]+$") or Match(ls_data,"^<= *[^(]+$") or Match(ls_data,"^<> *[^(]+$") &
			or Match(ls_data,"^<> *.+$") or Match(ls_data,"^>= *.+$") or Match(ls_data,"^>= *.+$") Then // <>,>=,<= not ()
			
			ls_rtn_expression = left(ls_data,2)
			ls_data = trim(mid(ls_data,3,len(ls_data) - 2))
//			if lc_dt.f_isvalid( ls_data, ls_fomat) then
			if isdate(ls_data) then
				ls_rtn_data = ls_mat_reg + ls_conv+ls_data+ls_conv2 + ls_fomat +ls_conv3
			else
				ls_rtn_data = this.f_get_date_stand( vs_build_type)
			end if
		elseif Match(ls_data,"^> *[^=].*$") or Match(ls_data,"^< *[^=].*$") Then //< ,> not ()
			ls_rtn_expression = left(ls_data,1)	
			ls_data = trim(mid(ls_data,2,len(ls_data) - 1))
//			if lc_dt.f_isvalid( ls_data, ls_fomat) then
			if isdate(ls_data) then
				ls_rtn_data = ls_mat_reg + ls_conv+ls_data+ls_conv2 + ls_fomat +ls_conv3
			else
				ls_rtn_data = this.f_get_date_stand( vs_build_type)
			end if
		else
//			if lc_dt.f_isvalid( ls_data, ls_fomat) then
			if isdate(ls_data) then
				ls_rtn_expression = ' = '
				ls_rtn_data =ls_mat_reg + ls_conv+ls_data+ls_conv2 + ls_fomat +ls_conv3
			else
				ls_rtn_expression = ' = '
				ls_rtn_data = this.f_get_date_stand( vs_build_type)
			end if
		end if
	end if
end if
return vs_colname + ls_rtn_expression + ls_rtn_data

end function

public function long f_arraytostring (double adb_source[], string as_delimiter, boolean ab_processempty, ref string as_ref_string);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_ArrayToString
//
//	Access:  		public
//
//	Arguments:
//	as_source[]		 The array of string to be moved into a single string.
//	as_Delimiter	 The delimeter string.
//	ab_processempty Whether to process empty string as_source members.
//	as_ref_string	 The string to be filled with the array of strings,
//						 passed by reference.
//
//	Returns:  		long
//						1 for a successful transfer.
//						-1 if a problem was found.
//
//	Description:  	Create a single string from an array of strings separated by
//						the passed delimeter.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	7.0   Initial version
//			Overloaded an existing f_arraytostring to optionally allow processing 
//			of empty string arguments.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

long		ll_Count, ll_ArrayUpBound

//Get the array size
ll_ArrayUpBound = UpperBound(adb_source[])

//Check parameters
IF IsNull(as_delimiter) or (Not ll_ArrayUpBound>0) Then
	Return -1
End If

//Reset the Reference string
as_ref_string = ''

If Not ab_processempty Then
	For ll_Count = 1 to ll_ArrayUpBound
		// Do not include any entries that match an empty string 
		If string(adb_source[ll_Count]) <> '' Then
			If Len(as_ref_string) = 0 Then
				//Initialize string
				as_ref_string = string(adb_source[ll_Count])
			else
				//Concatenate to string
				as_ref_string = as_ref_string + as_delimiter + string(adb_source[ll_Count])
			End If
		End If
	Next 
Else
	For ll_Count = 1 to ll_ArrayUpBound
		// Include any entries that match an empty string 
		If ll_Count = 1 Then
			//Initialize string
			as_ref_string = string(adb_source[ll_Count])
		else
			//Concatenate to string
			as_ref_string = as_ref_string + as_delimiter + string(adb_source[ll_Count])
		End If
	Next 
End If
return 1

end function

public function long f_arraytostring (double adb_source[], string as_delimiter, ref string as_ref_string);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_ArrayToString
//
//	Access:  		public
//
//	Arguments:
//	as_source[]		The array of string to be moved into a single string.
//	as_Delimiter	The delimeter string.
//	as_ref_string	The string to be filled with the array of strings,
//						passed by reference.
//
//	Returns:  		long
//						1 for a successful transfer.
//						-1 if a problem was found.
//
//	Description:  	Create a single string from an array of strings separated by
//						the passed delimeter.
//						Note: Function will not include on the single string any 
//								array entries which match an empty string.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	7.0   Redirect to the overloaded function version, which allows optional 
//			processing of an empty string.  The default behavior is to dissallow 
//			empty string to remain backwards compatible.  Call the 4 argument 
//			version of the function if the empty string processing is desired.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

return f_arraytostring(adb_source[], as_delimiter, FALSE, as_ref_string)

end function

public function string f_get_data_ddlb (string vs_data_source, string vs_colname, window vdw_handling);return ''
end function

public function string f_remove_doublewhitespace (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_RemoveWhiteSpace
//
//	Access:  		public
//
//	Arguments:
//	as_source		The string from which all WhiteSpace characters are to
//						be removed.
//
//	Returns:  		string
//						as_source with all desired characters removed.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes all WhiteSpace characters.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

char		lch_char
long		ll_pos = 1
long		ll_loop
string	ls_source
long		ll_source_len

//Check parameters
If IsNull(as_source) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

ls_source = trim(as_source)
ll_pos =  pos(ls_source, '  ')
DO WHILE ll_pos > 0 
	ls_source = Replace(ls_source, ll_pos,2, ' ')
	ll_pos =  pos(ls_source, '  ')
LOOP

Return ls_source

end function

public function string f_removesqlwhitespace (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_RemoveWhiteSpace
//
//	Access:  		public
//
//	Arguments:
//	as_source		The string from which all WhiteSpace characters are to
//						be removed.
//
//	Returns:  		string
//						as_source with all desired characters removed.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes all WhiteSpace characters.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

char		lch_char
long		ll_pos = 1
long		ll_loop
string	ls_source
long		ll_source_len

//Check parameters
If IsNull(as_source) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

ls_source = as_source
ll_source_len = Len(ls_source)

// Remove WhiteSpace characters 
FOR ll_loop = 1 TO ll_source_len
	lch_char = Mid(ls_source, ll_pos, 1)
	if Not f_IsWhiteSpace(lch_char) then
		if lch_char = ',' and f_IsWhiteSpace(Mid(ls_source, ll_pos - 1, 1)) then
			ls_source = Replace(ls_source, ll_pos - 1, 1, "")
		else
			ll_pos ++	
		end if
	else
		if ll_pos > 1 then
			if not f_IsWhiteSpace(Mid(ls_source, ll_pos - 1, 1)) and Mid(ls_source, ll_pos + 1, 1) <> ',' then 
				if  f_IsWhiteSpace(Mid(ls_source, ll_pos + 1, 1)) then
					ls_source = Replace(ls_source, ll_pos, 1, "")
				else
					ll_pos ++					
				end if
			else
				ls_source = Replace(ls_source, ll_pos, 1, "")
			end if
		else
			ls_source = Replace(ls_source, ll_pos, 1, "")
		end if
	end if 
NEXT

Return ls_source

end function

public function boolean f_isspecialchar (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_IsWhiteSpace
//
//	Access: 			public
//
//	Arguments:
//	as_source		The source string.
//
//	Returns:  		Boolean
//						True if the string only contains White Space characters. 
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Determines whether a string contains only White Space
//						characters. White Space characters include Newline, Tab,
//						Vertical tab, Carriage return, Formfeed, and Backspace.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

long 		ll_count=0
long 		ll_length
char		lc_char[]
integer	li_ascii

//Check parameters
If IsNull(as_source) Then
	boolean lb_null
	SetNull(lb_null)
	Return lb_null
End If

//Get the length
ll_length = Len (as_source)

//Check for at least one character
If ll_length=0 Then
	Return False
End If

//Move string into array of chars
lc_char = as_source


//Perform loop around all characters
//Quit loop if Non WhiteSpace character is found
do while ll_count<ll_length
	ll_count ++
	
	//Get ASC code of character.
	li_ascii = Asc (lc_char[ll_count])
	
	If li_ascii=8	or			/* BackSpae */		 		& 
		li_ascii=9 	or			/* Tab */		 			& 
		li_ascii=10 or			/* NewLine */				& 
		li_ascii=11 or			/* Vertical Tab */		& 
		li_ascii=12 or			/* Form Feed */			& 
		li_ascii=13 then			/* Carriage Return */
		//Continue with the next character.
	Else
		/* Character is Not a White Space. */
		Return False
	End If
loop
	
// Entire string is White Space.
return True

end function

public function string f_removespecialchar (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_RemoveWhiteSpace
//
//	Access:  		public
//
//	Arguments:
//	as_source		The string from which all WhiteSpace characters are to
//						be removed.
//
//	Returns:  		string
//						as_source with all desired characters removed.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes all WhiteSpace characters.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

char		lch_char
long		ll_pos = 1
long		ll_loop
string	ls_source
long		ll_source_len

//Check parameters
If IsNull(as_source) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

ls_source = as_source
ll_source_len = Len(ls_source)

// Remove special char characters 
FOR ll_loop = 1 TO ll_source_len
	lch_char = Mid(ls_source, ll_pos, 1)
	if Not f_IsSpecialChar(lch_char) then
		ll_pos ++	
	else
		ls_source = Replace(ls_source, ll_pos, 1, "")
	end if 
NEXT

Return ls_source

end function

public function long f_arraytostring (date ad_source[], string as_delimiter, boolean ab_processempty, ref string as_ref_string);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_ArrayToString
//
//	Access:  		public
//
//	Arguments:
//	as_source[]		 The array of string to be moved into a single string.
//	as_Delimiter	 The delimeter string.
//	ab_processempty Whether to process empty string as_source members.
//	as_ref_string	 The string to be filled with the array of strings,
//						 passed by reference.
//
//	Returns:  		long
//						1 for a successful transfer.
//						-1 if a problem was found.
//
//	Description:  	Create a single string from an array of strings separated by
//						the passed delimeter.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	7.0   Initial version
//			Overloaded an existing f_arraytostring to optionally allow processing 
//			of empty string arguments.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

long		ll_Count, ll_ArrayUpBound

//Get the array size
ll_ArrayUpBound = UpperBound(ad_source[])

//Check parameters
IF IsNull(as_delimiter) or (Not ll_ArrayUpBound>0) Then
	Return -1
End If

//Reset the Reference string
as_ref_string = ''

If Not ab_processempty Then
	For ll_Count = 1 to ll_ArrayUpBound
		// Do not include any entries that match an empty string 
		If string(ad_source[ll_Count]) <> '' Then
			If Len(as_ref_string) = 0 Then
				//Initialize string
				as_ref_string = string(ad_source[ll_Count])
			else
				//Concatenate to string
				as_ref_string = as_ref_string + as_delimiter + string(ad_source[ll_Count])
			End If
		End If
	Next 
Else
	For ll_Count = 1 to ll_ArrayUpBound
		// Include any entries that match an empty string 
		If ll_Count = 1 Then
			//Initialize string
			as_ref_string = string(ad_source[ll_Count])
		else
			//Concatenate to string
			as_ref_string = as_ref_string + as_delimiter + string(ad_source[ll_Count])
		End If
	Next 
End If
return 1

end function

public function long f_arraytostring (date ad_source[], string as_delimiter, ref string as_ref_string);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_ArrayToString
//
//	Access:  		public
//
//	Arguments:
//	as_source[]		The array of string to be moved into a single string.
//	as_Delimiter	The delimeter string.
//	as_ref_string	The string to be filled with the array of strings,
//						passed by reference.
//
//	Returns:  		long
//						1 for a successful transfer.
//						-1 if a problem was found.
//
//	Description:  	Create a single string from an array of strings separated by
//						the passed delimeter.
//						Note: Function will not include on the single string any 
//								array entries which match an empty string.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	7.0   Redirect to the overloaded function version, which allows optional 
//			processing of an empty string.  The default behavior is to dissallow 
//			empty string to remain backwards compatible.  Call the 4 argument 
//			version of the function if the empty string processing is desired.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

return f_arraytostring(ad_source[], as_delimiter, FALSE, as_ref_string)

end function

public function string f_convert_abc2uni (string str);//Chuyển chữ việt từ bảng mã (ABC - TCNV3) sang (Unicode )
string ls_result=''
string arrUNI[], sUni, ABC, UNI, ls_char
long i, STT
ABC = "¸µ¶·¹¨¾»¼½Æ©ÊÇÈÉËÐÌÎÏÑªÕÒÓÔÖÝ×ØÜÞãßáâä«èåæçé¬íêëìîóïñòô­øõö÷ùýúûüþ®¸µ¶·¹¡¾»¼½Æ¢ÊÇÈÉËÐÌÎÏÑ£ÕÒÓÔÖÝ×ØÜÞãßáâä¤èåæçé¥íêëìîóïñòô¦øõö÷ùýúûüþ§"
UNI = "225,224,7843,227,7841,259,7855,7857,7859,7861,7863,226,7845,7847,7849,7851,7853,233,232,7867,7869,7865,234,7871,7873,7875,7877,7879,237,236,7881,297,7883,243,242,7887,245,7885,244,7889,7891,7893,7895,7897,417,7899,7901,7903,7905,7907,250,249,7911,361,7909,432,7913,7915,7917,7919,7921,253,7923,7927,7929,7925,273,225,224,7843,227,7841,258,7855,7857,7859,7861,7863,194,7845,7847,7849,7851,7853,233,232,7867,7869,7865,202,7871,7873,7875,7877,7879,237,236,7881,297,7883,243,242,7887,245,7885,212,7889,7891,7893,7895,7897,416,7899,7901,7903,7905,7907,250,249,7911,361,7909,431,7913,7915,7917,7919,7921,253,7923,7927,7929,7925,272"
f_parsetoarray(UNI, ",",arrUNI)
For i = 1 To Len(str)
	ls_char = Mid(str, i, 1)
	STT = pos(ABC, ls_char) 
	If STT > 0 Then
	 sUni = sUni + Char(long(arrUNI[STT]))
	Else
	 sUni = sUni + ls_char
 	End If
Next
ls_result = sUni
RETURN ls_result
end function

public function string f_convert_abc2unsign (string str);//Bỏ dấu chữ việt từ bảng mã (ABC - TCNV3)
string ls_result=''
string sKD, ABC, KD, ls_char
long i, STT
ABC = "¸µ¶·¹¨¾»¼½Æ©ÊÇÈÉËÐÌÎÏÑªÕÒÓÔÖÝ×ØÜÞãßáâä«èåæçé¬íêëìîóïñòô­øõö÷ùýúûüþ®¸µ¶·¹¡¾»¼½Æ¢ÊÇÈÉËÐÌÎÏÑ£ÕÒÓÔÖÝ×ØÜÞãßáâä¤èåæçé¥íêëìîóïñòô¦øõö÷ùýúûüþ§"
KD = "aaaaaaaaaaaaaaaaaeeeeeeeeeeeiiiiiooooooooooooooooouuuuuuuuuuuyyyyydaaaaaAaaaaaAaaaaaeeeeeEeeeeeiiiiioooooOoooooOooooouuuuuUuuuuuyyyyyD"
For i = 1 To Len(str)
	ls_char = Mid(str, i, 1)
	STT = pos(ABC, ls_char) 
	If STT > 0 Then
		sKD = sKD + Mid(KD, STT, 1)
	Else
		sKD = sKD + ls_char
 	End If
Next
ls_result = sKD
RETURN ls_result
end function

public function long f_find_item (string as_source[], string as_item);int li_i 
for li_i = 1 to upperbound(as_source)
	if upper(as_source[li_i]) = upper(as_item) then return li_i
next
return 0

end function

public function string f_convert_uni2abc (string str);//Chuyển chữ việt từ bảng mã (Unicode )  sang (ABC-TCVN3 Code)
//font ABC KHÔNG hô tro' các NGUYÊN ÂM CÓ DÂU VIÊT HOA
string ls_result=''
String arrABC[], arrUNI[] , sabc, ABC, UNI 
long i,STT

ABC = "¸@µ@¶@·@¹@¨@¾@»@¼@½@Æ@©@Ê@Ç@È@É@Ë@Ð@Ì@Î@Ï@Ñ@ª@Õ@Ò@Ó@Ô@Ö@Ý@×@Ø@Ü@Þ@ã@ß@á@â@ä@«@è@å@æ@ç@é@¬@í@ê@ë@ì@î@ó@ï@ñ@ò@ô@­@ø@õ@ö@÷@ù@ý@ú@û@ü@þ@®@¸@µ@¶@·@¹@¡@¾@»@¼@½@Æ@¢@Ê@Ç@È@É@Ë@Ð@Ì@Î@Ï@Ñ@£@Õ@Ò@Ó@Ô@Ö@Ý@×@Ø@Ü@Þ@ã@ß@á@â@ä@¤@è@å@æ@ç@é@¥@í@ê@ë@ì@î@ó@ï@ñ@ò@ô@¦@ø@õ@ö@÷@ù@ý@ú@û@ü@þ@§"
UNI = "225,224,7843,227,7841,259,7855,7857,7859,7861,7863,226,7845,7847,7849,7851,7853,233,232,7867,7869,7865,234,7871,7873,7875,7877,7879,237,236,7881,297,7883,243,242,7887,245,7885,244,7889,7891,7893,7895,7897,417,7899,7901,7903,7905,7907,250,249,7911,361,7909,432,7913,7915,7917,7919,7921,253,7923,7927,7929,7925,273,225,224,7843,227,7841,258,7855,7857,7859,7861,7863,194,7845,7847,7849,7851,7853,233,232,7867,7869,7865,202,7871,7873,7875,7877,7879,237,236,7881,297,7883,243,242,7887,245,7885,212,7889,7891,7893,7895,7897,416,7899,7901,7903,7905,7907,250,249,7911,361,7909,431,7913,7915,7917,7919,7921,253,7923,7927,7929,7925,272"
f_parsetoarray(ABC, "@",arrABC)
f_parsetoarray(UNI, ",",arrUNI)
For i = 1 To Len(str)
	If Asc(Mid(str, i, 1)) > 127 Then
		STT = f_find_item(arrUNI, string(Asc(Mid(str, i, 1))))
		sabc = sabc + arrABC[STT]
	Else
	 	sabc = sabc + Mid(str, i, 1)
	End If
Next
ls_result = sabc
RETURN ls_result
end function

public function string f_convert_uni2unsign (string str);//Chuyển chữ việt(Unicode) có dấu sang không dấu
string ls_result=''
string KD, UNI, skd, arrKD[], arrUNI[], ls_char
long STT, i
KD = "a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,e,e,e,e,e,e,e,e,e,e,e,i,i,i,i,i,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,u,u,u,u,u,u,u,u,u,u,u,y,y,y,y,y,d,A,A,A,A,A,A,A,A,A,A,A,A,A,A,A,A,A,E,E,E,E,E,E,E,E,E,E,E,I,I,I,I,I,O,O,O,O,O,O,O,O,O,O,O,O,O,O,O,O,O,U,U,U,U,U,U,U,U,U,U,U,Y,Y,Y,Y,Y,D"
UNI = "225,224,7843,227,7841,259,7855,7857,7859,7861,7863,226,7845,7847,7849,7851,7853,233,232,7867,7869,7865,234,7871,7873,7875,7877,7879,237,236,7881,297,7883,243,242,7887,245,7885,244,7889,7891,7893,7895,7897,417,7899,7901,7903,7905,7907,250,249,7911,361,7909,432,7913,7915,7917,7919,7921,253,7923,7927,7929,7925,273,225,224,7843,227,7841,258,7855,7857,7859,7861,7863,194,7845,7847,7849,7851,7853,233,232,7867,7869,7865,202,7871,7873,7875,7877,7879,237,236,7881,297,7883,243,242,7887,245,7885,212,7889,7891,7893,7895,7897,416,7899,7901,7903,7905,7907,250,249,7911,361,7909,431,7913,7915,7917,7919,7921,253,7923,7927,7929,7925,272"
f_parsetoarray(KD, ",",arrKD)
f_parsetoarray(UNI, ",",arrUNI)
For i = 1 To Len(str)
	ls_char = Mid(str, i, 1)
	  If Asc(Mid(str, i, 1)) > 127 Then
		 STT = f_find_item(arrUNI, string(Asc(ls_char)))
		 skd = skd + arrkd[STT]
	  Else
		skd = skd + ls_char
	  End If
Next
ls_result = skd
RETURN ls_result	 
end function

public function string f_convert_uni2vni (string str);//Chuyển chữ việt từ bảng mã (Unicode )  sang (VNI code)
string ls_result=''
string VNI, UNI,  sVNi, arrVNI[], arrUNI[], ls_char
long i, STT
    VNI = "aù,aø,aû,aõ,aï,aê,aé,aè,aú,aü,aë,aâ,aá,aà,aå,aã,aä,eù,eø,eû,eõ,eï,eâ,eá,eà,eå,eã,eä,í,ì,æ,ó,ò,où,oø,oû,oõ,oï,oâ,oá,oà,oå,oã,oä,ô,ôù,ôø,ôû,ôõ,ôï,uù,uø,uû,uõ,uï,ö,öù,öø,öû,öõ,öï,yù,yø,yû,yõ,î,ñ,AÙ,AØ,AÛ,AÕ,AÏ,AÊ,AÉ,AÈ,AÚ,AÜ,AË,AÂ,AÁ,AÀ,AÅ,AÃ,AÄ,EÙ,EØ,EÛ,EÕ,EÏ,EÂ,EÁ,EÀ,EÅ,EÃ,EÄ,Í,Ì,Æ,Ó,Ò,OÙ,OØ,OÛ,OÕ,OÏ,OÂ,OÁ,OÀ,OÅ,OÃ,OÄ,Ô,ÔÙ,ÔØ,ÔÛ,ÔÕ,ÔÏ,UÙ,UØ,UÛ,UÕ,UÏ,Ö,ÖÙ,ÖØ,ÖÛ,ÖÕ,ÖÏ,YÙ,YØ,YÛ,YÕ,Î,Ñ"
    UNI = "225,224,7843,227,7841,259,7855,7857,7859,7861,7863,226,7845,7847,7849,7851,7853,233,232,7867,7869,7865,234,7871,7873,7875,7877,7879,237,236,7881,297,7883,243,242,7887,245,7885,244,7889,7891,7893,7895,7897,417,7899,7901,7903,7905,7907,250,249,7911,361,7909,432,7913,7915,7917,7919,7921,253,7923,7927,7929,7925,273,225,224,7843,227,7841,258,7855,7857,7859,7861,7863,194,7845,7847,7849,7851,7853,233,232,7867,7869,7865,202,7871,7873,7875,7877,7879,237,236,7881,297,7883,243,242,7887,245,7885,212,7889,7891,7893,7895,7897,416,7899,7901,7903,7905,7907,250,249,7911,361,7909,431,7913,7915,7917,7919,7921,253,7923,7927,7929,7925,272"
    f_parsetoarray(VNI, ",", arrVNI)
	f_parsetoarray(UNI, ",", arrUNI)
    For i = 1 To Len(str)
		ls_char = Mid(str, i, 1)
        If Asc(ls_char) > 127 Then
		   STT = f_find_item(arrUNI,string(Asc(ls_char)))
            sVNi = sVNi + arrVNI[STT]
        Else
            sVNi = sVNi + ls_char
        End If
    Next
    ls_result = sVNi
RETURN ls_result
end function

public function string f_convert_vni2uni (string str);
//Chuyển chữ việt từ bảng mã (VNI Code) sang (Unicode )
string ls_result=''
string arrUNI[], arrVNI[], sUni, VNI, UNI, ls_char, ls_char_couple
long i, STT
VNI = "aù,aø,aû,aõ,aï,aê,aé,aè,aú,aü,aë,aâ,aá,aà,aå,aã,aä,eù,eø,eû,eõ,eï,eâ,eá,eà,eå,eã,eä,í,ì,æ,ó,ò,où,oø,oû,oõ,oï,oâ,oá,oà,oå,oã,oä,ô,ôù,ôø,ôû,ôõ,ôï,uù,uø,uû,uõ,uï,ö,öù,öø,öû,öõ,öï,yù,yø,yû,yõ,î,ñ,AÙ,AØ,AÛ,AÕ,AÏ,AÊ,AÉ,AÈ,AÚ,AÜ,AË,AÂ,AÁ,AÀ,AÅ,AÃ,AÄ,EÙ,EØ,EÛ,EÕ,EÏ,EÂ,EÁ,EÀ,EÅ,EÃ,EÄ,Í,Ì,Æ,Ó,Ò,OÙ,OØ,OÛ,OÕ,OÏ,OÂ,OÁ,OÀ,OÅ,OÃ,OÄ,Ô,ÔÙ,ÔØ,ÔÛ,ÔÕ,ÔÏ,UÙ,UØ,UÛ,UÕ,UÏ,Ö,ÖÙ,ÖØ,ÖÛ,ÖÕ,ÖÏ,YÙ,YØ,YÛ,YÕ,Î,Ñ"
UNI = "225,224,7843,227,7841,259,7855,7857,7859,7861,7863,226,7845,7847,7849,7851,7853,233,232,7867,7869,7865,234,7871,7873,7875,7877,7879,237,236,7881,297,7883,243,242,7887,245,7885,244,7889,7891,7893,7895,7897,417,7899,7901,7903,7905,7907,250,249,7911,361,7909,432,7913,7915,7917,7919,7921,253,7923,7927,7929,7925,273,225,224,7843,227,7841,258,7855,7857,7859,7861,7863,194,7845,7847,7849,7851,7853,233,232,7867,7869,7865,202,7871,7873,7875,7877,7879,237,236,7881,297,7883,243,242,7887,245,7885,212,7889,7891,7893,7895,7897,416,7899,7901,7903,7905,7907,250,249,7911,361,7909,431,7913,7915,7917,7919,7921,253,7923,7927,7929,7925,272"
f_parsetoarray(VNI, ",",arrVNI)
f_parsetoarray(UNI, ",",arrUNI)
For i = 1 To Len(str)
	ls_char_couple = Mid(str, i, 2)
	STT = f_find_item(arrVNI, ls_char_couple)
	if STT > 0 then  
		sUni = sUni + Char(long(arrUNI[STT]))
		i = i + 1
	ELSE
		ls_char = Mid(str, i, 1)	
		STT = f_find_item(arrVNI, ls_char)
		if STT > 0 then 
			sUni = sUni + Char(long(arrUNI[STT]))
		Else
			sUni = sUni + ls_char
		END IF
	End If
Next
ls_result = sUni
RETURN ls_result
end function

public function string f_convert_vni2unsign (string str);//Chuyển chữ việt(VNI code) có dấu sang không dấu
string ls_result=''
string VNI, KD, sKD, arrVNI[], arrKD[], ls_char, ls_char_couple
long i, STT
    VNI = "aù,aø,aû,aõ,aï,aâ,aê,aá,aà,aå,aã,aä,aé,aè,aú,aü,aë,AÙ,AØ,AÛ,AÕ,AÏ,AÂ,AÊ,AÁ,AÀ,AÅ,AÃ,AÄ,AÉ,AÈ,AÚ,AÜ,AË,eù,eø,eû,eõ,eï,eâ,eá,eà,eå,eã,eä,EÙ,EØ,EÛ,EÕ,EÏ,EÂ,EÁ,EÀ,EÅ,EÃ,EÄ,í,ì,æ,ó,ò,Í,Ì,Æ,Ó,Ò,où,oø,oû,oõ,oï,oâ,ô,oá,oà,oå,oã,oä,ôù,ôø,ôû,ôõ,ôï,OÙ,OØ,OÛ,OÕ,OÏ,OÂ,Ô,OÁ,OÀ,OÅ,OÃ,OÄ,ÔÙ,ÔØ,ÔÛ,ÔÕ,ÔÏ,uù,uø,uû,uõ,uï,ö,öù,öø,öû,öõ,öï,UÙ,UØ,UÛ,UÕ,UÏ,Ö,ÖÙ,ÖØ,ÖÛ,ÖÕ,ÖÏ,yù,yø,yû,yõ,î,YÙ,YØ,YÛ,YÕ,Î,ñ,Ñ"
    KD = "a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,a,A,A,A,A,A,A,A,A,A,A,A,A,A,A,A,A,A,e,e,e,e,e,e,e,e,e,e,e,E,E,E,E,E,E,E,E,E,E,E,i,i,i,i,i,I,I,I,I,I,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,o,O,O,O,O,O,O,O,O,O,O,O,O,O,O,O,O,O,u,u,u,u,u,u,u,u,u,u,u,U,U,U,U,U,U,U,U,U,U,U,y,y,y,y,y,Y,Y,Y,Y,Y,d,D"
    f_parsetoarray(VNI, ",",arrVNI)
    f_parsetoarray(KD, ",",arrKD)
    For i = 1 To Len(str)
		ls_char_couple = Mid(str, i, 2)
		STT = f_find_item(arrVNI,ls_char_couple)
		If STT > 0 Then
			sKD = sKD + arrKD[STT]
			i = i + 1
		else
			ls_char = Mid(str, i, 1)
			STT = f_find_item(arrVNI,ls_char)
			If STT > 0 Then
				sKD = sKD + arrKD[STT]
			Else
				sKD = sKD + ls_char
			end if
		End If
    Next
    ls_result = sKD
RETURN ls_result
end function

public function string f_get_cur_name (string vs_cur_code, boolean vb_aft_dot);string	ls_name

if not vb_aft_dot then
	choose case upper(vs_cur_code)
		case 'USD'
			ls_name = 'dollars'
		case 'EUR'
			ls_name = 'euro'
		case 'GBP'
			ls_name = 'pounds'
		case 'AUD'
			ls_name = 'dollars'
		case 'CNY'
			ls_name = 'yuan'
		case 'HKD'
			ls_name = 'dollars'
		case 'JPY'
			ls_name = 'yen'
		case 'KRW'
			ls_name = 'won'
		case 'SGD'
			ls_name = 'dollars'
		case 'CHF'
			ls_name = 'franc'
		case 'RUB'
			ls_name = 'rouble'
	end choose
else
	choose case upper(vs_cur_code)
		case 'USD'
			ls_name = 'cent'
		case 'EUR'
			ls_name = 'cent'
		case 'GBP'
			ls_name = 'penny'
		case 'AUD'
			ls_name = 'cent'
		case 'CNY'
			ls_name = 'fen'
		case 'HKD'
			ls_name = 'cent'
		case 'JPY'
			ls_name = 'sen'
		case 'KRW'
			ls_name = 'fils'
		case 'SGD'
			ls_name = 'cent'
		case 'CHF'
			ls_name = 'rappen'
		case 'RUB'
			ls_name = 'kopek'
	end choose
end if
return ls_name
end function

public function string f_readnumber_eng (integer vi_number, string vs_cur_code);string ls_tmp1 ,ls_tmp2

if len(string(vi_number)) = 1 then
	if upper(vs_cur_code) <> 'VNĐ' or upper(vs_cur_code) <> 'VND' then
		choose case vi_number
			case 1
				return 'one'
			case 2
				return 'two'
			case 3
				return 'three'
			case 4
				return 'four'
			case 5
				return 'five'
			case 6
				return 'six'
			case 7
				return 'seven'
			case 8
				return 'eight'
			case 9
				return 'nine'
		end choose
	else
		choose case vi_number
			case 1
				return 'một'
			case 2
				return 'hai'
			case 3
				return 'ba'
			case 4
				return 'bốn'
			case 5
				return 'năm'
			case 6
				return 'sáu'
			case 7
				return 'bảy'
			case 8
				return 'tám'
			case 9
				return 'chín'
		end choose
	end if
else
	if upper(vs_cur_code) <> 'VNĐ' or upper(vs_cur_code) <> 'VND' then
		choose case vi_number
			case 10
				return 'ten'
			case 11
				return 'eleven'
			case 12
				return 'twelve'
			case 13
				return 'thirteen'
			case 14
				return 'fourteen'
			case 15
				return 'fifteen'
			case 16
				return 'sixteen'
			case 17
				return 'seventeen'
			case 18
				return 'eighteen'
			case 19
				return 'nineteen'
			case 20
				return 'twenty'
			case 30
				return 'thirty'
			case 40
				return 'forty'
			case 50
				return 'fifty'
			case 60
				return 'sixty'
			case 70
				return 'seventy'
			case 80
				return 'eighty'
			case 90
				return 'ninety'
			case else 
				ls_tmp1 = this.f_readnumber_eng( mod(vi_number,10),vs_cur_code)
				ls_tmp2 = this.f_readnumber_eng( vi_number - mod(vi_number,10),vs_cur_code)
				return ls_tmp2 + ' ' + ls_tmp1
		end choose
	else
		choose case vi_number
			case 10
				return 'mười'
			case 20
				return 'hai mươi'
			case 30
				return 'ba mươi'
			case 40
				return 'bốn mươi'
			case 50
				return 'năm mươi'
			case 60
				return 'sáu mươi'
			case 70
				return 'bảy mươi'
			case 80
				return 'tám mươi'
			case 90
				return 'chính mươi'
			case 21
				return 'hai mươi mốt'
			case 31
				return 'ba mươi mốt'
			case 41
				return 'bố mươin mốt'
			case 51
				return 'năm mươi mốt'
			case 61
				return 'sáu mươi mốt'
			case 71
				return 'bảy mươi mốt'
			case 81
				return 'tám mươi mốt'
			case 91
				return 'chín mươi mốt'
			case 15
				return 'mười lăm'
			case 25
				return 'hai mươi lăm'
			case 35
				return 'ba mươi lăm'
			case 45
				return 'bốn mươi lăm'
			case 55
				return 'năm mươi lăm'
			case 65
				return 'sáu mươi lăm'
			case 75
				return 'bảy mươi lăm'
			case 85
				return 'tám mươi lăm'
			case 95
				return 'chín mươi lăm'
			case else 
				ls_tmp1 = this.f_readnumber_eng( mod(vi_number,10),vs_cur_code)
				ls_tmp2 = this.f_readnumber_eng( vi_number - mod(vi_number,10),vs_cur_code)
				return ls_tmp2 + ' ' + ls_tmp1
		end choose
	end if
end if
return 'none'
end function

public function string f_readnumber (integer vi_number, string vs_cur_code);string ls_tmp1 ,ls_tmp2

if len(string(vi_number)) = 1 then
	if upper(vs_cur_code) = 'VNĐ' or upper(vs_cur_code) = 'VND' then
		choose case vi_number
			case 1
				return 'một'
			case 2
				return 'hai'
			case 3
				return 'ba'
			case 4
				return 'bốn'
			case 5
				return 'năm'
			case 6
				return 'sáu'
			case 7
				return 'bảy'
			case 8
				return 'tám'
			case 9
				return 'chín'
		end choose
	else
		choose case vi_number
			case 1
				return 'one'
			case 2
				return 'two'
			case 3
				return 'three'
			case 4
				return 'four'
			case 5
				return 'five'
			case 6
				return 'six'
			case 7
				return 'seven'
			case 8
				return 'eight'
			case 9
				return 'nine'
		end choose
	end if
else
	if upper(vs_cur_code) = 'VNĐ' or upper(vs_cur_code) = 'VND' then
		choose case vi_number
			case 10
				return 'mười'
			case 20
				return 'hai mươi'
			case 30
				return 'ba mươi'
			case 40
				return 'bốn mươi'
			case 50
				return 'năm mươi'
			case 60
				return 'sáu mươi'
			case 70
				return 'bảy mươi'
			case 80
				return 'tám mươi'
			case 90
				return 'chính mươi'
			case 21
				return 'hai mươi mốt'
			case 31
				return 'ba mươi mốt'
			case 41
				return 'bố mươin mốt'
			case 51
				return 'năm mươi mốt'
			case 61
				return 'sáu mươi mốt'
			case 71
				return 'bảy mươi mốt'
			case 81
				return 'tám mươi mốt'
			case 91
				return 'chín mươi mốt'
			case 15
				return 'mười lăm'
			case 25
				return 'hai mươi lăm'
			case 35
				return 'ba mươi lăm'
			case 45
				return 'bốn mươi lăm'
			case 55
				return 'năm mươi lăm'
			case 65
				return 'sáu mươi lăm'
			case 75
				return 'bảy mươi lăm'
			case 85
				return 'tám mươi lăm'
			case 95
				return 'chín mươi lăm'
			case else 
				ls_tmp1 = this.f_readnumber( mod(vi_number,10),vs_cur_code)
				ls_tmp2 = this.f_readnumber( vi_number - mod(vi_number,10),vs_cur_code)
				return ls_tmp2 + ' ' + ls_tmp1
		end choose
	else
		choose case vi_number
			case 10
				return 'ten'
			case 11
				return 'eleven'
			case 12
				return 'twelve'
			case 13
				return 'thirteen'
			case 14
				return 'fourteen'
			case 15
				return 'fifteen'
			case 16
				return 'sixteen'
			case 17
				return 'seventeen'
			case 18
				return 'eighteen'
			case 19
				return 'nineteen'
			case 20
				return 'twenty'
			case 30
				return 'thirty'
			case 40
				return 'forty'
			case 50
				return 'fifty'
			case 60
				return 'sixty'
			case 70
				return 'seventy'
			case 80
				return 'eighty'
			case 90
				return 'ninety'
			case else 
				ls_tmp1 = this.f_readnumber( mod(vi_number,10),vs_cur_code)
				ls_tmp2 = this.f_readnumber( vi_number - mod(vi_number,10),vs_cur_code)
				return ls_tmp2 + ' ' + ls_tmp1
		end choose
	end if
end if
return 'none'
end function

public function integer f_find_item_pos (string as_source[], string as_item);int li_i 
for li_i = 1 to upperbound(as_source)
	if pos(as_source[li_i],  as_item, 1) > 0 then return li_i
next
return 0

end function

public function long f_stringtoarray (string as_source, string as_delimiter, ref string as_array[], boolean vb_expend);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  f_StringToArray
//
//	Access:  public
//
//	Arguments:
//	as_Source   The string to parse.
//	as_Delimiter   The delimeter string.
//	as_Array[]   The array to be filled with the parsed strings, passed by reference.
//  vb_expand   TRUE expend the array as_array[] elements if any, FASE reset the array as_array[] elements
//	Returns:  long
//	The number of elements in the array.
//	If as_Source or as_Delimeter is NULL, function returns NULL.
//
//	Description:  Parse a string into array elements using a delimeter string.
//
//////////////////////////////////////////////////////////////////////////////

long		ll_DelLen, ll_Pos, ll_Count, ll_Start, ll_Length
string 	ls_holder

if vb_expend = FALSE then
	return f_stringtoarray(as_source, as_delimiter, as_array[])
else
	//Check for NULL
	IF IsNull(as_source) or IsNull(as_delimiter) Then
		long ll_null
		SetNull(ll_null)
		Return ll_null
	End If
	
	//Check for at leat one entry
	If Trim (as_source) = '' Then
		Return 0
	End If
	
	//Get the length of the delimeter
	ll_DelLen = Len(as_Delimiter)
	
	ll_Pos =  Pos(Upper(as_source), Upper(as_Delimiter))
	
	//Only one entry was found
	if ll_Pos = 0 then
		as_Array[upperbound(as_Array)+1] = as_source
//		as_Array[upperbound(as_Array)+1] = trim(as_source)
		return upperbound(as_Array)
	end if
	
	//More than one entry was found - loop to get all of them
	ll_Count = upperbound(as_Array)
	ll_Start = 1
	Do While ll_Pos > 0
		
		//Set current entry
		ll_Length = ll_Pos - ll_Start
		ls_holder = Mid (as_source, ll_start, ll_length)
	
		// Update array and counter
		ll_Count ++
		as_Array[ll_Count] = ls_holder
//		as_Array[ll_Count] = trim(ls_holder)

		//Set the new starting position
		ll_Start = ll_Pos + ll_DelLen
	
		ll_Pos =  Pos(Upper(as_source), Upper(as_Delimiter), ll_Start)
	Loop
	
	//Set last entry
	ls_holder = Mid (as_source, ll_start, Len (as_source))
	
	// Update array and counter if necessary
	if Len (ls_holder) > 0 then
		ll_count++
		as_Array[ll_Count] = ls_holder
//		as_Array[ll_Count] = trim(ls_holder)
	end if

	//Return the number of entries found
	Return ll_Count
end if
end function

public function string f_convert_name (string vs_name);string 		ls_rtn_name, ls_char_a,ls_char_e,ls_char_i,ls_char_o, ls_char_u,ls_char_y,ls_name,ls_char,ls_char_d
long			ll_len,ll_row

if isnull(vs_name) or trim(vs_name) = '' then
	ls_rtn_name = ''
	return ls_rtn_name
end if
ls_char_a =upper('á à ả ã ạ ấ ầ ẩ ẫ ậ ắ ằ ẳ ẵ ặ a â ă ẫ')
ls_char_e = upper('é è ẻ ẽ ẹ ế ề ể ễ ệ e ê ')
ls_char_i = upper('í ì ỉ ĩ ị i ')
ls_char_o = upper(' ó ò ỏ õ ọ ố ồ ổ ỗ ộ ớ ờ ở ỡ ợ ơ ô o')
ls_char_u = upper('ú ù ủ ũ ụ ứ ừ ử ữ ự u ư')
ls_char_y = upper('ý ỳ ỷ ỹ ỵ y')
ls_char_d = upper('đ d')
ls_rtn_name = ''
ls_name = trim(vs_name)
ll_len = len(ls_name)

for ll_row = 1 to ll_len
	ls_char = mid(ls_name,ll_row,1)
	if ls_char <> ' '  then
		if mid(ls_name,ll_row - 1,1) <> ' ' then
			if pos(ls_char_a,upper(ls_char)) > 0 then
				ls_char = 'a'
			end if
			if pos(ls_char_e,upper(ls_char)) > 0 then
				ls_char = 'e'
			end if
			if pos(ls_char_i,upper(ls_char)) > 0 then
				ls_char = 'i'
			end if
			if pos(ls_char_o,upper(ls_char)) > 0 then
				ls_char = 'o'
			end if
			if pos(ls_char_u,upper(ls_char)) > 0 then
				ls_char = 'u'
			end if
			if pos(ls_char_y,upper(ls_char)) > 0 then
				ls_char = 'y'
			end if
			if pos(ls_char_d,upper(ls_char)) > 0 then
				ls_char = 'd'
			end if
		end if
	end if
	if ll_row = 1 or mid(ls_name,ll_row - 1,1) = ' ' then
		ls_rtn_name = ls_rtn_name + upper(ls_char)
	else
		if mid(ls_name,ll_row,1) = upper(mid(ls_name,ll_row,1)) then
			ls_char = upper(ls_char)
			ls_rtn_name = ls_rtn_name + ls_char
		else
			ls_rtn_name = ls_rtn_name + ls_char
		end if
	end if
next
return ls_rtn_name
end function

public function string f_replace_specchar_htlfcr (string as_source);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_RemoveWhiteSpace
//
//	Access:  		public
//
//	Arguments:
//	as_source		The string from which all WhiteSpace characters are to
//						be removed.
//
//	Returns:  		string
//						as_source with all desired characters removed.
//						If any argument's value is NULL, function returns NULL.
//
//	Description: 	Removes all WhiteSpace characters.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

char		lch_char
long		ll_pos = 1
long		ll_loop
string	ls_source
long		ll_source_len

//Check parameters
If IsNull(as_source) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

ls_source = as_source
ll_source_len = Len(ls_source)

// Remove special char characters 
FOR ll_loop = 1 TO ll_source_len
	lch_char = Mid(ls_source, ll_pos, 1)
	if Not f_IsSpecialChar(lch_char) then
		ll_pos ++	
	else
		if asc(lch_char) = 9 then
			ls_source = Replace(ls_source, ll_pos, 1, "~~t")
			ll_pos += 2
		elseif asc(lch_char) = 10 then
			ls_source = Replace(ls_source, ll_pos, 1, "~~n")
			ll_pos += 2
		elseif asc(lch_char) = 13 then
			ls_source = Replace(ls_source, ll_pos, 1, "~~r")
			ll_pos += 2
		end if
	end if 
NEXT

Return ls_source


end function

public function string f_globalreplace (string as_source, string as_old, string as_new, boolean ab_ignorecase, integer ai_s_pos, integer ai_e_pos);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_GlobalReplace
//
//	Access:  		public
//
//	Arguments:
//	as_Source		The string being searched.
//	as_Old			The old string being replaced.
//	as_New			The new string.
// ab_IgnoreCase	A boolean stating to ignore case sensitivity.
//
//	Returns:  		string
//						as_Source with all occurrences of as_Old replaced with as_New.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Replace all occurrences of one string inside another with
//						a new string.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

Long	ll_Start
Long	ll_OldLen
Long	ll_NewLen
String ls_Source, ls_null

//Check parameters
If IsNull(as_source) or IsNull(as_old) or IsNull(as_new) or IsNull(ab_ignorecase) Then
	SetNull(ls_null)
	Return ls_null
End If

//Get the string lenghts
ll_OldLen = Len(as_Old)
ll_NewLen = Len(as_New)

//Should function respect case.
If ab_ignorecase Then
	as_old = Lower(as_old)
	ls_source = Lower(as_source)
	if Lower(as_old) = Lower(as_new) then
		return as_source
	end if	
Else
	ls_source = as_source
	if as_old = as_new then
		return as_source
	end if		
End If

if isnull(ai_s_pos) then ai_s_pos = 0 
if isnull(ai_e_pos) then ai_e_pos = 0 
ls_Source = mid(ls_Source,1,ai_e_pos - ai_s_pos +1)
//Search for the first occurrence of as_Old
ll_Start = Pos(ls_Source, as_Old, ai_s_pos)

Do While ll_Start > 0
	// replace as_Old with as_New
	as_source = Replace(as_source, ll_Start, ll_OldLen, as_New)
	
	//Should function respect case.
	If ab_ignorecase Then 
		ls_source = mid(Lower(as_source),1,ai_e_pos - ai_s_pos +1)
	Else
		ls_source = mid(as_source,1,ai_e_pos - ai_s_pos +1)
	End If
	
	// find the next occurrence of as_Old
	ll_Start = Pos(ls_Source, as_Old,ll_Start+ll_NewLen)
Loop

Return as_Source

end function

public function string f_globalreplace (string as_source, string as_old, string as_new, integer ai_s_pos, integer ai_e_pos);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		 f_GlobalReplace
//
//	Access:  		public
//
//	Arguments:
//	as_Source		The string being searched.
//	as_Old			The old string being replaced.
//	as_New			The new string.
// ab_IgnoreCase	A boolean stating to ignore case sensitivity.
//
//	Returns:  		string
//						as_Source with all occurrences of as_Old replaced with as_New.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Replace all occurrences of one string inside another with
//						a new string.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright © 1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////


//Check parameters
If IsNull(as_source) or IsNull(as_old) or IsNull(as_new) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

//The default is to ignore Case
as_Source = f_GlobalReplace (as_source, as_old, as_new, True,ai_s_pos,ai_e_pos)

Return as_Source

end function

public function string f_check_type_datet (ref string rs_conv, ref string rs_conv2, ref string rs_conv3, ref string rs_mat_reg, ref string rs_fomat, string vs_build_type);//--gán các ký tự đặt trưng cho kiểu date của PB và ORA--//
string ls_valuses[]

//if pos(rs_fomat,'-') > 0 then rs_fomat = this.f_globalreplace( rs_fomat, '-', '/')
//if pos(rs_fomat,'\') > 0 then rs_fomat = this.f_globalreplace( rs_fomat, '\', '/')
//if pos(rs_fomat,'_') > 0 then rs_fomat = this.f_globalreplace( rs_fomat, '_', '/')
//if pos(rs_fomat,'|') > 0 then rs_fomat = this.f_globalreplace( rs_fomat, '|', '/')
//if pos(rs_fomat,'.') > 0 then rs_fomat = this.f_globalreplace( rs_fomat, '.', '/')


if vs_build_type = 'filter' then
	rs_mat_reg = "date("
	rs_conv = "'"
	rs_conv2 = "'"
	rs_conv3 = ")"
elseif lower(vs_build_type) = 'modify' then
	rs_mat_reg = "date("
	rs_conv = "~~'"
	rs_conv2 = "~~'"
	rs_conv3 = ")"
else
	if pos( lower(rs_fomat),'mmm') > 0 then rs_fomat = this.f_globalreplace( rs_fomat, 'mmm', 'mon')
//	if this.f_stringtoarray( rs_fomat, '/', ls_valuses)>2  then
		rs_mat_reg =  'TO_DATE('
//	else
//		rs_mat_reg = 'TO_CHAR('
//	end if
	rs_conv = "~~'"
	rs_conv2 = "~~',~~'"
	rs_conv3 = "~~')"
end if

return vs_build_type
end function

public function long f_pos_ex (string vs_source, string vs_target, integer vi_occurrence, ref t_transaction rt_transaction);long		ll_pos

SELECT INSTR(:vs_source, :vs_target,1,:vi_occurrence) into :ll_pos FROM Dual using rt_transaction;
if isnull(ll_pos) then ll_pos =0
return ll_pos
end function

public function long f_pos_ex (string vs_source, string vs_target, integer vi_occurrence);long		ll_pos
t_transaction		lt_transaction

//-- Tạo connection voi database --//
lt_transaction = create t_transaction
lt_transaction.dbms =	SQLCA.DBMS
lt_transaction.ServerName	 = SQLCA.ServerName
lt_transaction.LogId	 = SQLCA.LogId
lt_transaction.LogPass 	 = SQLCA.LogPass 
lt_transaction.AutoCommit 	 = false 
lt_transaction.DBParm	 = SQLCA.DBParm
connect using	lt_transaction;	


SELECT INSTR(:vs_source, :vs_target,1,:vi_occurrence) into :ll_pos FROM Dual using lt_transaction;
if isnull(ll_pos) then ll_pos =0
return ll_pos

disconnect using lt_transaction;
destroy lt_transaction
end function

on c_string_ex.create
call super::create
TriggerEvent( this, "constructor" )
end on

on c_string_ex.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

