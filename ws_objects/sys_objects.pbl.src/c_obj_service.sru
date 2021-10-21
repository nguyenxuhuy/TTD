$PBExportHeader$c_obj_service.sru
$PBExportComments$Chứa tất cả các function phục vụ cho objects
forward
global type c_obj_service from nonvisualobject
end type
end forward

global type c_obj_service from nonvisualobject autoinstantiate
end type

type variables
string is_dec_separator
c_w_progress iw_progress
mailSession				mSes
mailReturnCode		mRet
mailMessage			mMsg
mailFileDescription		mAttach
end variables

forward prototypes
public function decimal f_calculate (string vs_calculate_string)
public function decimal f_round_down (decimal vd_number, integer vi_decimal)
public function decimal f_round_standard (decimal vd_number, integer vi_decimal)
public function decimal f_round_up (decimal vd_number, integer vi_decimal)
public function decimal f_truncate (decimal vd_number, integer vi_decimal)
public function integer f_split_number (decimal vd_number, ref string vs_int, ref string vs_dec)
public function long f_arraytostring (string as_source[], string as_delimiter, ref string as_ref_string)
public function string f_getdecimalseparator ()
public function string f_globalreplace (string as_source, string as_old, string as_new)
public function long f_stringtoarray (string as_source, string as_delimiter, ref string as_array[])
public function long f_countoccurrences (string as_source, string as_target, boolean ab_ignorecase)
public function long f_countoccurrences (string as_source, string as_target)
public function boolean f_isoperator (string as_operator)
public function integer f_build_criteria_clause (t_dw_mpl vdw_requestor, string vs_table_alias, string vs_col_name, string vs_operation, string vs_value1, string vs_value2, ref string vs_expression)
public function integer f_buildcriterias (t_dw_mpl vdw_requestor, string vs_table_name, string vs_table_alias, ref string vs_criteria)
public function string f_get_parent_w_string (powerobject va_object)
public function integer f_set_tabtext (tab vt_tab)
public function string f_getcolumnname ()
public function string f_getwindowname ()
public function integer f_setmicrohelp (datawindow vdw_object, string vs_colname, string vs_lang_id)
public function integer f_setmicrohelp (powerobject vpo_object, string vs_lang_id)
public function integer f_getparentwindow (powerobject vpo_obj, ref window aw_parent)
public function decimal f_round (long vl_unit, decimal vd_number)
public function integer f_get_winlist (datawindow vdw_winlist)
public function decimal f_round (long vl_unit, decimal vd_number, string vs_table_ref)
public function integer f_show_progress (integer ai_progress)
public function string f_format_vnnumber (string as_money)
public function decimal f_round_spec (decimal vd_number, integer vi_decimal)
public function integer f_rearrange_array (powerobject vpo_source_array[], ref powerobject rpo_dest_array[])
public function integer f_sendmail (string vs_from_email, string vs_password, string vs_mail_server, long vl_server_port, string vs_to_email, string vs_cc_email, string vs_subject, string vs_attack_files, string vs_content)
public function integer f_sendmail_system (string vs_to_email, string vs_cc_email, string vs_subject, string vs_attack_files, string vs_content)
end prototypes

public function decimal f_calculate (string vs_calculate_string);/* Hàm tính chuỗi phép tính +, -, *,/ (vi du: 23+12*5-3), không hỗ trợ phép tính có dấu ngoặc đơn.

*/
dec ld_return, ld_operand[], ld_exp, ld_null
string ls_cal, ls_temp, ls_number, ls_operator[]
int li_strlen, li_pos,li_idx, li_bound
boolean lb_minus = false, lb_exp = false
setnull(ld_null)

try
	ls_cal = trim(vs_calculate_string)
	li_strlen = len(ls_cal)
	FOR li_pos = 1 to li_strlen
		ls_temp = mid(ls_cal, li_pos, 1)
		
		if isnumber(ls_temp) or ls_temp = is_dec_separator then 
			ls_number = ls_number + ls_temp
		elseif ls_temp = ' ' then
			continue
		elseif pos('+-*/',ls_temp) > 0 then
			If (Len(ls_number) = 0 and li_pos > 1) or (li_pos = 1 and pos('*/',ls_temp) > 0) Then
//				gf_messagebox('cal_error')
//				messagebox('cal_error','cal_error')
				return ld_null
			End If
			li_idx++
			if lb_minus then
				ld_operand[li_idx] = -dec(ls_number)
			else
				ld_operand[li_idx] = dec(ls_number)
			end if
			if ls_temp = '-' then
				lb_minus = true
			else
				lb_minus = false
			end if
			if ls_temp = '-' then ls_temp = '+'
			ls_operator[li_idx] = ls_temp				
			ls_number=''
		else
//			gf_messagebox('cal_error')
//			messagebox('cal_error','cal_error')
			return ld_null
		end if
	NEXT

	if len(ls_number) = 0 then 
		ls_operator[li_idx] = '#'
	else
		li_idx++
		if lb_minus then
			ld_operand[li_idx] = -dec(ls_number)
		else
			ld_operand[li_idx] = dec(ls_number)
		end if
	end if

	li_bound = upperbound(ls_operator)
	If li_bound = 0 Then Return dec(vs_calculate_string)
	if ls_operator[li_bound] = '#' then li_bound = li_bound - 1
	FOR li_idx = 1 to li_bound
		CHOOSE CASE ls_operator[li_idx]
			CASE '+'
				If li_idx = 1 or Not lb_exp Then
					ld_return = ld_return + ld_operand[li_idx]
				Else
					ld_return = ld_return + ld_exp
				End If
				lb_exp = false
			CASE '*'
				If Not lb_exp Then
					ld_exp = ld_operand[li_idx] * ld_operand[li_idx + 1]
				Else
					ld_exp = ld_exp * ld_operand[li_idx + 1]
				End If
				lb_exp = true
			CASE '/'
				If Not lb_exp Then
					ld_exp = ld_operand[li_idx] / ld_operand[li_idx + 1]
				Else
					ld_exp = ld_exp / ld_operand[li_idx + 1]
				End If
				lb_exp = true	
		END CHOOSE
	NEXT
	If ls_operator[li_idx - 1] = '+' Then
		ld_return = ld_return + ld_operand[li_idx]
	Else
		ld_return = ld_return + ld_exp
	End If

	return ld_return
catch (runtimeerror lre)
//	openwithparm (c_w_err,lre.text)
//	messagebox('c_w_err,lre.text',lre.text)
end try

//dw_1.describe("evaluate('" + vs_calculate_string + "',1)")
end function

public function decimal f_round_down (decimal vd_number, integer vi_decimal);dec ld_return
string ls_add_nbr, ls_int, ls_dec
int li_pos, li_rt

If vd_number >= 0 Then	Return f_truncate(vd_number, vi_decimal)

li_rt = f_split_number(-vd_number, ls_int, ls_dec)
If li_rt <> 1 Then Return li_rt

If vi_decimal < 0 and -vi_decimal >= Len(ls_int) Then Return 0
If vi_decimal > 0 and vi_decimal >= Len(ls_dec) Then Return vd_number

If vi_decimal > 0 Then
	ls_add_nbr = '0' + is_dec_separator + Right(Fill('0', vi_decimal) + '1', vi_decimal)
Else
	ls_add_nbr = '1' + Fill('0', -vi_decimal)
End If

ld_return = f_truncate(-vd_number, vi_decimal) + dec(ls_add_nbr)

Return -ld_return
end function

public function decimal f_round_standard (decimal vd_number, integer vi_decimal);string ls_int, ls_dec
int li_pos, li_sign_nbr, li_sign_dec, li_round_value, li_compare, li_rt
dec ld_trunc_nbr, ld_add_nbr, ld_rtn

li_sign_nbr = Sign(vd_number)
li_sign_dec = Sign(vi_decimal)
vd_number = Abs(vd_number)
ld_trunc_nbr = f_truncate(vd_number, vi_decimal)
vi_decimal = Abs(vi_decimal)

li_rt = f_split_number(vd_number, ls_int, ls_dec)
If li_rt <> 1 Then Return li_rt

If li_sign_dec >= 0 Then
	If vi_decimal >= Len(ls_dec) Then
		li_compare = 0
	Else
		li_compare = integer(Mid(ls_dec, vi_decimal + 1, 1))
	End If
Else
	If vi_decimal > Len(ls_int) Then
		li_compare = 0
	Else
		li_compare = integer(Mid(ls_int, Len(ls_int) - vi_decimal + 1, 1))
	End If
End If

if li_compare >= 5 then
	li_round_value = 10
else
	li_round_value = 0
end if

If li_sign_dec >= 0 Then
	ld_add_nbr = f_truncate(li_round_value / (10^(vi_decimal + 1)), vi_decimal)
Else
	ld_add_nbr = li_round_value * 10^(vi_decimal - 1)
End If

ld_rtn = ld_trunc_nbr + ld_add_nbr
If li_sign_nbr = -1 Then ld_rtn = -ld_rtn

Return ld_rtn
end function

public function decimal f_round_up (decimal vd_number, integer vi_decimal);dec ld_return
string ls_add_nbr, ls_int, ls_dec
int li_pos, li_rt

If vd_number <= 0 Then	Return f_truncate(vd_number, vi_decimal)

li_rt = f_split_number(vd_number, ls_int, ls_dec)
If li_rt <> 1 Then Return li_rt

//If vi_decimal < 0 and -vi_decimal > Len(ls_int) Then Return 0
If vi_decimal > 0 and vi_decimal >= Len(ls_dec) Then Return vd_number

If vi_decimal > 0 Then
	if dec(mid(ls_dec, vi_decimal + 1)) > 0 then 
		ls_add_nbr = '0' + is_dec_separator + Right(Fill('0', vi_decimal) + '1', vi_decimal)
	else
		ls_add_nbr = '0'
	end if
Else
	ls_add_nbr = '1' + Fill('0', -vi_decimal)
End If

ld_return = f_truncate(vd_number, vi_decimal) + dec(ls_add_nbr)

Return ld_return
end function

public function decimal f_truncate (decimal vd_number, integer vi_decimal);string ls_int, ls_dec, ls_rtn
int li_rt, li_sign_nbr, li_sign_dec

li_sign_nbr = Sign(vd_number)
li_sign_dec = Sign(vi_decimal)
vd_number = Abs(vd_number)
vi_decimal = Abs(vi_decimal)

li_rt = f_split_number(vd_number, ls_int, ls_dec)
If li_rt <> 1 Then Return li_rt

If li_sign_dec = 0 Then 
	ls_rtn = ls_int
Elseif li_sign_dec > 0 Then
	If Len(ls_dec) = 0 Then
		ls_rtn = ls_int
	Else
		ls_rtn = ls_int + is_dec_separator + Left(ls_dec, vi_decimal)
	End If
Else
	If vi_decimal >= Len(ls_int) Then ls_rtn = '0'
	ls_rtn = Left(ls_int, Len(ls_int) - vi_decimal) + Fill('0',vi_decimal)
End If

If li_sign_nbr = -1 Then ls_rtn = '-' + ls_rtn

Return dec(ls_rtn)
end function

public function integer f_split_number (decimal vd_number, ref string vs_int, ref string vs_dec);String ls_number
int li_pos, li_null

If IsNull(vd_number) Then
	SetNull(li_null)
	Return li_null
End If

ls_number = string(vd_number)
li_pos = Pos(ls_number,is_dec_separator)
If li_pos = 0 Then
	vs_int = ls_number
	vs_dec = ''
Else
	vs_int = Left(ls_number, li_pos - 1)
	vs_dec = Mid(ls_number, li_pos + 1)
End If

Return 1
end function

public function long f_arraytostring (string as_source[], string as_delimiter, ref string as_ref_string);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		f_ArrayToString
//
//	Access:  		public
//
//	Arguments:
//	as_source[]	 	The array of string to be moved into a single string.
//	as_Delimiter		The delimeter string.
//	as_ref_string 	The string to be filled with the array of strings,	 passed by reference.
//
//	Returns:  		long
//						1 for a successful transfer.
//						-1 if a problem was found.
//
//	Description:  	Create a single string from an array of strings separated by	the passed delimeter.
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

return 1

end function

public function string f_getdecimalseparator ();string ls_value
If RegistryGet("HKEY_CURRENT_USER\Control Panel\International","SDecimal",RegString!,ls_value) <> 1 Then
	ls_value = "."
End If

Return ls_value
end function

public function string f_globalreplace (string as_source, string as_old, string as_new);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		gf_GlobalReplace
//
//	Access:  		public
//
//	Arguments:
//	as_Source		The string being searched.
//	as_Old			The old string being replaced.
//	as_New			The new string.
//
//	Returns:  		string
//						as_Source with all occurrences of as_Old replaced with as_New.
//						If any argument's value is NULL, function returns NULL.
//
//	Description:  	Replace all occurrences of one string inside another with a new string.
//
//////////////////////////////////////////////////////////////////////////////
Long	ll_Start
Long	ll_OldLen
Long	ll_NewLen
String ls_Source

//Check parameters
If IsNull(as_source) or IsNull(as_old) or IsNull(as_new) Then
	string ls_null
	SetNull(ls_null)
	Return ls_null
End If

//Get the string lenghts
ll_OldLen = Len(as_Old)
ll_NewLen = Len(as_New)

//Should function respect case.
as_old = Lower(as_old)
ls_source = Lower(as_source)

//Search for the first occurrence of as_Old
ll_Start = Pos(ls_Source, as_Old)

Do While ll_Start > 0
	// replace as_Old with as_New
	as_Source = Replace(as_Source, ll_Start, ll_OldLen, as_New)
	
	//Should function respect case.
	ls_source = Lower(as_source)

	// find the next occurrence of as_Old
	ll_Start = Pos(ls_Source, as_Old, (ll_Start + ll_NewLen))
Loop

Return as_Source

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
	as_Array[1] = trim(as_source)
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
	as_Array[ll_Count] = trim(ls_holder)
	
	//Set the new starting position
	ll_Start = ll_Pos + ll_DelLen

	ll_Pos =  Pos(Upper(as_source), Upper(as_Delimiter), ll_Start)
Loop

//Set last entry
ls_holder = Mid (as_source, ll_start, Len (as_source))

// Update array and counter if necessary
if Len (ls_holder) > 0 then
	ll_count++
	as_Array[ll_Count] = trim(ls_holder)
end if

//Return the number of entries found
Return ll_Count

end function

public function long f_countoccurrences (string as_source, string as_target, boolean ab_ignorecase);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_CountOccurrences
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

public function long f_countoccurrences (string as_source, string as_target);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		f_CountOccurrences
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

public function boolean f_isoperator (string as_operator);CHOOSE CASE as_operator
	CASE '/', '*', '+', '-'
		Return True
END CHOOSE

Return False
end function

public function integer f_build_criteria_clause (t_dw_mpl vdw_requestor, string vs_table_alias, string vs_col_name, string vs_operation, string vs_value1, string vs_value2, ref string vs_expression);string ls_coltype, ls_criteria, ls_values[]
int li_nb_values, li_i, li_pos 

If IsNull(vdw_requestor) or IsNull(vs_table_alias) or IsNull(vs_col_name) or IsNull(vs_operation) Then Return -1
vs_value1 = Trim(vs_value1)
vs_value2 = Trim(vs_value2)

ls_coltype = vdw_requestor.describe(vs_col_name + ".ColType")

Choose Case Lower(Left(ls_coltype,5))
	Case "char("		
		ls_criteria = "( Upper(" + vs_table_alias + "." + vs_col_name + ") " + vs_operation + " "
		
		Choose Case Upper(vs_operation)
			Case '>','>=','<','<=','=','<>'
				If IsNull(vs_value1) Then Return -1
				ls_criteria += "~~'" + Upper(vs_value1) + "~~'"
				
			Case 'BETWEEN','NOT BETWEEN'
				If IsNull(vs_value1) or IsNull(vs_value2) Then Return -1
				ls_criteria += "~~'" + Upper(vs_value1) + "~~' AND ~~'" + Upper(vs_value2) + "~~'"
				
			Case 'IN','NOT IN'
				If IsNull(vs_value1) Then Return -1
				ls_criteria += "( "
				li_nb_values = f_StringToArray(vs_value1,";",ls_values)
				For li_i=1 To li_nb_values
					ls_criteria += "~~'" + Upper(Trim(ls_values[li_i])) + "~~'"
					If li_i <> li_nb_values Then ls_criteria += " , "
				Next
				ls_criteria += " )"
				
			Case 'LIKE'
				If IsNull(vs_value1) Then Return -1
				li_pos = Pos(vs_value1,"*")
				If li_pos > 0 Then vs_value1 = f_GlobalReplace(vs_value1,"*","%")
				li_pos = Pos(vs_value1,"%")
				If li_pos > 0 Then 
					ls_criteria += "~~'" + Upper(vs_value1) + "~~'"
				Else
					ls_criteria += "~~'" + Upper(vs_value1) + "%~~'"
				End If
				
		End Choose
	
	Case "date","datet"
		ls_criteria = "( TRUNC(" + vs_table_alias + "." + vs_col_name + ") " + vs_operation + " "
	
		Choose Case Upper(vs_operation)
			Case '>','>=','<','<=','=','<>'
				If IsNull(vs_value1) Then Return -1
				ls_criteria += "TO_DATE(~~'" + vs_value1 + "~~',~~'YYYY-MM-DD~~')"
				
			Case 'BETWEEN','NOT BETWEEN'
				If IsNull(vs_value1) or IsNull(vs_value2) Then Return -1
				ls_criteria += "TO_DATE(~~'" + vs_value1 + "~~',~~'YYYY-MM-DD~~')" &
										+ " AND TO_DATE(~~'" + vs_value2 + "~~',~~'YYYY-MM-DD~~')"
				
			Case 'IN','NOT IN'
				If IsNull(vs_value1) Then Return -1
				ls_criteria += "( "
				li_nb_values = f_StringToArray(vs_value1,";",ls_values)
				For li_i=1 To li_nb_values
					ls_criteria += "TO_DATE(~~'" + Trim(ls_values[li_i]) + "~~',~~'YYYY-MM-DD~~')"
					If li_i <> li_nb_values Then ls_criteria += " , "
				Next
				ls_criteria += " )"
				
		End Choose
		
	Case "decim","numbe"
		ls_criteria = "( " + vs_table_alias + "." + vs_col_name + " " + vs_operation + " "
		
		vs_value1 = f_GlobalReplace(vs_value1,",",".")
		vs_value2 = f_GlobalReplace(vs_value2,",",".")
		
		Choose Case Upper(vs_operation)
			Case '>','>=','<','<=','=','<>'
				If IsNull(vs_value1) Then Return -1
				ls_criteria += vs_value1
				
			Case 'BETWEEN','NOT BETWEEN'
				If IsNull(vs_value1) or IsNull(vs_value2) Then Return -1
				ls_criteria += vs_value1 + " AND " + vs_value2
				
			Case 'IN','NOT IN'
				If IsNull(vs_value1) Then Return -1
				ls_criteria += "( "
				li_nb_values = f_StringToArray(vs_value1,";",ls_values)
				For li_i=1 To li_nb_values
					ls_criteria += Trim(ls_values[li_i])
					If li_i <> li_nb_values Then ls_criteria += " , "
				Next
				ls_criteria += " )"
				
		End Choose
					
	Case "time"
		ls_criteria = "( TO_CHAR(" + vs_table_alias + "." + vs_col_name + ",~~'HH24:MI:SS~~') " + vs_operation + " "
		
		Choose Case Upper(vs_operation)
			Case '>','>=','<','<=','=','<>'
				If IsNull(vs_value1) Then Return -1
				ls_criteria += "TO_CHAR(TO_DATE(~~'" + vs_value1 + "~~',~~'HH24:MI:SS~~'),~~'HH24:MI:SS~~')"
				
			Case 'BETWEEN','NOT BETWEEN'
				If IsNull(vs_value1) or IsNull(vs_value2) Then Return -1
				ls_criteria += "TO_CHAR(TO_DATE(~~'" + vs_value1 + "~~',~~'HH24:MI:SS~~'),~~'HH24:MI:SS~~')" &
										+ " AND TO_CHAR(TO_DATE(~~'" + vs_value2 + "~~',~~'HH24:MI:SS~~'),~~'HH24:MI:SS~~')"
				
			Case 'IN','NOT IN'
				If IsNull(vs_value1) Then Return -1
				ls_criteria += "( "
				li_nb_values = f_StringToArray(vs_value1,";",ls_values)
				For li_i=1 To li_nb_values
					ls_criteria += "TO_CHAR(TO_DATE(~~'" + Trim(ls_values[li_i]) &
											+ "~~',~~'HH24:MI:SS~~'),~~'HH24:MI:SS~~')"
					If li_i <> li_nb_values Then ls_criteria += " , "
				Next
				ls_criteria += " )"
				
		End Choose
		
	Case Else
		Return -1
		
End Choose

ls_criteria += " )"

vs_expression = ls_criteria

Return 1	
end function

public function integer f_buildcriterias (t_dw_mpl vdw_requestor, string vs_table_name, string vs_table_alias, ref string vs_criteria);String ls_col_name, ls_operation, ls_value1, ls_value2, ls_expression
int li_rt

If IsNull(vdw_requestor) or IsNull(vs_table_name) or IsNull(vs_table_alias) Then Return -1

declare c1 cursor for
	Select col_name, operation, value1, value2
		From erp_rec_security
			Where user_id = :gi_userid and
					company_id = :gi_user_comp_id and
					table_name = :vs_table_name;
Open c1;
Fetch c1 into :ls_col_name, :ls_operation, :ls_value1, :ls_value2;
If SQLCA.SQLCode = 100 Then
	Close c1;
	Return 0
End If
Do While SQLCA.SQLCode = 0
	li_rt = f_build_criteria_clause(vdw_requestor,vs_table_alias,ls_col_name,ls_operation,ls_value1,ls_value2,ls_expression)
	If li_rt = 1 Then 
		If IsNull(vs_criteria) or Len(Trim(vs_criteria)) = 0 Then
			vs_criteria = ls_expression
		Else
			vs_criteria += " AND " + ls_expression
		End If
	Else
		Return -1
	End If
	Fetch c1 into :ls_col_name, :ls_operation, :ls_value1, :ls_value2;
Loop
Close c1;

Return 1		
end function

public function string f_get_parent_w_string (powerobject va_object);/* trả về chuỗi classname của control và tất cả các parent*/

powerobject	lpo_parent
string ls_rstring =''

//	ls_rstring = va_object.classname( )
	if va_object.typeof() = window! then return ls_rstring
	
	lpo_parent = va_object.dynamic GetParent()
	// Loop getting the parent of the object until it is of type window!
	do while IsValid (lpo_parent) 
		ls_rstring = lpo_parent.classname( )+'.'+ls_rstring
		if lpo_parent.TypeOf() = window! then exit
		lpo_parent = lpo_parent.GetParent()
	loop
	return ls_rstring
end function

public function integer f_set_tabtext (tab vt_tab);/* return null if tab is not valid, 0 if no pages, 1 if succeed */
//c_ds_lang lds_lang_text
int li_idx, li_pages
string ls_label_id,ls_sublabel_id
try
	setnull(li_pages)
	if not isvalid(vt_tab) then return li_pages
	li_pages = upperbound(vt_tab.control)
	if li_pages = 0 then return li_pages
//	lds_lang_text = create c_ds_lang
	FOR li_idx = 1 to li_pages
		ls_label_id = vt_tab.control[li_idx].classname( )
		ls_sublabel_id =vt_tab.control[li_idx].accessibledescription
		if ls_sublabel_id = '' then continue
		if isvalid(t_w_mdi) then 
			vt_tab.control[li_idx].text  = t_w_mdi.ids_lang_text.f_get_lang_text( ls_label_id, ls_sublabel_id)
		else 
			c_ds_lang lds_lang_text	
			lds_lang_text = create c_ds_lang
			vt_tab.control[li_idx].text  = lds_lang_text.f_get_lang_text( ls_label_id, ls_sublabel_id)		
			destroy lds_lang_text
		end if 
	NEXT
//	destroy lds_lang_text
	return 1
catch(runtimeerror lre)
//	openwithparm(c_w_err,lre.text)
end try
end function

public function string f_getcolumnname ();string ls_result, ls_list_library, ls_column_name, ls_entries
string lsar_datawindowname[]
long ll_row, ll_item, ll_columncount, ll_col
c_string lcs_string 
datastore lds_datastor_1, lds_datastor_2
lds_datastor_1 = create datastore
lds_datastor_2 = create datastore
lds_datastor_1.DataObject = 'd_object_list_hind'
ls_list_library = GetLibraryList ( )
f_stringtoarray(ls_list_library, ',', lsar_datawindowname[])
ls_result = ''
for ll_row = 1 to upperbound(lsar_datawindowname[])
	ll_item = lcs_string.f_lastpos(lsar_datawindowname[ll_row], '\')
	if mid(lsar_datawindowname[ll_row], ll_item +1 , 2) = 'dw' then 
		ls_entries = LibraryDirectory( lsar_datawindowname[ll_row], DirDataWindow!)
		lds_datastor_1.reset()
		lds_datastor_1.ImportString(ls_Entries)
		for ll_item = 1 to lds_datastor_1.rowcount()
			lds_datastor_2.dataobject = lds_datastor_1.getitemstring(ll_item, 1)
			lds_datastor_2.settransobject(SQLCA)
			lds_datastor_2.insertrow(0)
			ll_columncount = long(lds_datastor_2.Object.DataWindow.Column.Count)
			for ll_col = 1 to ll_columncount				
				ls_result += lds_datastor_2.Describe("#" + string(ll_col)+".Name") + ','				
			next 
		next
	end if 	
next
if len(ls_result) > 0 then 
	ls_result = mid(ls_result, 1 , len(ls_result) - 1)
end if 
return ls_result
end function

public function string f_getwindowname ();string ls_result, ls_list_library, ls_column_name, ls_entries
string lsar_windowname[]
long ll_row, ll_item, ll_columncount, ll_col
c_string lcs_string 
datastore lds_datastor_1
lds_datastor_1 = create datastore
lds_datastor_1.DataObject = 'd_obj_lib'
ls_list_library = GetLibraryList ( )
f_stringtoarray(ls_list_library, ',', lsar_windowname[])
ls_result = ''
for ll_row = 1 to upperbound(lsar_windowname[])
	ll_item = lcs_string.f_lastpos(lsar_windowname[ll_row], '\')
	if mid(lsar_windowname[ll_row], ll_item +1 , 4) = 'user' then 
		ls_entries = LibraryDirectory( lsar_windowname[ll_row], DirWindow!)
		lds_datastor_1.reset()
		lds_datastor_1.ImportString(ls_Entries)
		for ll_item = 1 to lds_datastor_1.rowcount()
			ls_result += lds_datastor_1.getitemstring(ll_item, 1) + ','		
		next
	end if 	
next
if len(ls_result) > 0 then 
	ls_result = mid(ls_result, 1 , len(ls_result) - 1)
end if 
return ls_result
end function

public function integer f_setmicrohelp (datawindow vdw_object, string vs_colname, string vs_lang_id);/*====================================
Set microhelp cho object của datawindow
-------------------------------------------------------------
return (integer): 1 Thành công
					: 0 không tìm thấy microhelp
					: -1 lỗi 
=====================================*/
string ls_helptext, ls_label_id, ls_sublabel_id
int li_dwdataytype
ls_label_id = vdw_object.dataobject

if isnull(ls_label_id) or vdw_object.dataobject = '' then return -1
// Lay datatype
select dwdatatype  into :li_dwdataytype
 from erp_dwcolumn_setup
 where company_id = :gi_user_comp_id
 	and dwobject= :ls_label_id
	 and dwcolumn=:vs_colname;

ls_sublabel_id = vs_colname + '_t'
select microhelp into :ls_helptext
from erp_label
where label_id = :ls_label_id
	and sublabel_id = :ls_sublabel_id
	and lang_id = :vs_lang_id;
	
if sqlca.sqlcode = 0 then
	if li_dwdataytype > 0 and li_dwdataytype < 4 then
		if isnull(ls_helptext) then ls_helptext = ''
		ls_helptext += '  (Có thể bấm dấu [-] để mở window chọn dữ liệu)'
	end if
	return t_w_mdi.setmicrohelp(ls_helptext)
else
	return -1
end if
end function

public function integer f_setmicrohelp (powerobject vpo_object, string vs_lang_id);/*====================================
Set microhelp cho object của window
-------------------------------------------------------------
return (integer): 1 Thành công
					: 0 không tìm thấy microhelp
					: -1 lỗi 
=====================================*/
string ls_helptext, ls_label_id, ls_sublabel_id

ls_label_id = vpo_object.classname()
ls_sublabel_id = vpo_object.dynamic f_get_accessible_description()


	
if sqlca.sqlcode = 0 then
	return t_w_mdi.setmicrohelp(ls_helptext)
else
	return -1
end if
end function

public function integer f_getparentwindow (powerobject vpo_obj, ref window aw_parent);powerobject	lpo_parent


if vpo_obj.TypeOf() = window! then
	aw_parent = vpo_obj
	return 1	
end if

lpo_parent = vpo_obj.GetParent()
// Loop getting the parent of the object until it is of type window!
do while IsValid (lpo_parent) 
	if lpo_parent.TypeOf() <> window! then
		lpo_parent = lpo_parent.GetParent()
	else
		exit
	end if
loop

if IsNull(lpo_parent) or not IsValid (lpo_parent) then
	setnull(aw_parent)	
	return -1
end if

aw_parent = lpo_parent

return 1
end function

public function decimal f_round (long vl_unit, decimal vd_number);/* Hàm làm tròn theo đơn vị. Dựa vào tham số vs_unit sẽ lấy phương pháp làm tròn từ database. Cac phuong phap lam tròn gồm:
	1. round_standard: (làm tròn chuẩn) <5 làm tròn xuống, >= 5 làm tròn lên
	2. round_up: (làm tròn lên)
	3. round_down: (làm tròn xuống
	4. round_spec: (làm tròn đặc biệt) tùy theo định nghĩa làm tròn trong database
	
	return -1 neu co loi
*/
dec ld_return
string ls_round_type
int li_dec_number
long ls_round_id, ll_round_type

try
	// Kiểm tra xem unit có setup round method chưa?
//	DECLARE c_round_method cursor for
//		SELECT round_id
//		from im_unit where unit_id = :vl_unit
//		UNION
//		SELECT round_id
//		from fm_currency where cur_id = :vl_unit;
//	OPEN 	 c_round_method;
//	FETCH c_round_method into :ls_round_id;
//	CLOSE c_round_method;
	if sqlca.sqlcode <> 0 then
//		gf_messagebox('unit_no_declare')
		return -1
	end if
	If isnull(ls_round_id) or ls_round_id = 0 then
	//	gf_messagebox('unit_no_round_setup')
		return vd_number
	end if
	//gọi hàm làm tròn
//	Select round_type, decimal_digit
//		into :ll_round_type, :li_dec_number
//		From erp_round
//			Where round_id= :ls_round_id;
	Choose Case ll_round_type
		Case 1
			ld_return = f_round_standard(vd_number, li_dec_number)
		Case 2
			ld_return = f_round_up(vd_number, li_dec_number)
		Case 3
			ld_return = f_round_down(vd_number, li_dec_number)
		Case 4
			ld_return = f_round_spec( vd_number, li_dec_number)
	End Choose
	return ld_return
catch (runtimeerror lre)
//	openwithparm (c_w_err,lre.text)
end try
end function

public function integer f_get_winlist (datawindow vdw_winlist);/*===========================================
Lấy danh sách các cột của datawindow
-----------------------------------------------------------
Tham số
	vs_dwobject: tên datawindow
	rdw_collist: Datawindow chứa danh sách tên cột
--------------------------------------------------------------
return (integer): 1 thành công
					: -1 lỗi
=============================================*/
datastore lds_dwobject
c_obj_service  lc_obj_service
int li_idx, li_cnt, li_insertrow
long ll_nbr_objects
string  ls_winname, lsa_winname[], ls_label_id, ls_windowtitle

If not isvalid(vdw_winlist) then return -1
if isnull(vdw_winlist.dataobject) or vdw_winlist.dataobject <> 'd_winlist'  then return -1

ls_winname = this.f_getwindowname( )
ll_nbr_objects = this.f_stringtoarray( ls_winname, ',', lsa_winname)

DECLARE l_cur cursor for
select text from erp_label el
where el.lang_id = :gs_user_lang
  and el.label_id = :ls_label_id
  and el.sublabel_id = 'title';


FOR li_idx = 1 to ll_nbr_objects
	ls_label_id =lsa_winname[li_idx]

	OPEN l_cur;
	FETCH l_cur into :ls_windowtitle;
	li_insertrow = vdw_winlist.insertrow(0)
	if sqlca.sqlcode = 0 then
		vdw_winlist.setitem(li_insertrow, 'winname',ls_label_id)
		vdw_winlist.setitem(li_insertrow, 'wintitle',ls_windowtitle)
	else
		vdw_winlist.setitem(li_insertrow, 'winname',ls_label_id)
		vdw_winlist.setitem(li_insertrow, 'wintitle', '')		
	end if
	CLOSE l_cur;
NEXT
vdw_winlist.resetupdate()
return 1
end function

public function decimal f_round (long vl_unit, decimal vd_number, string vs_table_ref);/* Hàm làm tròn theo đơn vị. Dựa vào tham số vs_unit sẽ lấy phương pháp làm tròn từ database. Cac phuong phap lam tròn gồm:
	1. round_standard: (làm tròn chuẩn) <5 làm tròn xuống, >= 5 làm tròn lên
	2. round_up: (làm tròn lên)
	3. round_down: (làm tròn xuống
	4. round_spec: (làm tròn đặc biệt) tùy theo định nghĩa làm tròn trong database
	
	return -1 neu co loi
*/
dec ld_return
string  ls_round_type
int li_dec_number
long ls_round_id, ll_round_type

// Kiểm tra xem unit có setup round method chưa?
choose case vs_table_ref
	case 'im_unit'
//		select round_id  into :ls_round_id
//		   from im_unit where unit_id = :vl_unit;
	case 'fm_currency'
//		select round_id  into :ls_round_id
//		  from fm_currency where cur_id = :vl_unit;
end choose

If isnull(ls_round_id) or ls_round_id = 0 then
//	gf_messagebox('unit_no_round_setup')
	return -1
end if

//gọi hàm làm tròn
//Select round_type, decimal_digit
//	into :ll_round_type, :li_dec_number
// From erp_round
// Where round_id= :ls_round_id;
		
Choose Case ll_round_type
	Case 1
		ld_return = f_round_standard(vd_number, li_dec_number)
	Case 2
		ld_return = f_round_up(vd_number, li_dec_number)
	Case 3
		ld_return = f_round_down(vd_number, li_dec_number)
	Case 4
		ld_return = f_round_spec( vd_number, li_dec_number)
End Choose

return ld_return

end function

public function integer f_show_progress (integer ai_progress);if ai_progress > 100 then
	if isvalid(iw_progress) then
		close(iw_progress)
		setnull(iw_progress)
	end if
else
	if isvalid(iw_progress) then
	else
		openwithparm(iw_progress,this)
	end if
	iw_progress.event ue_show_progress(ai_progress)
end if 

return 1
end function

public function string f_format_vnnumber (string as_money);string ls_result
int li_idx,li_len

ls_result = as_money
li_len = len(ls_result)
li_idx = 1
do while li_idx < li_len
	if mid(ls_result,li_idx,1) = ',' then replace(ls_result,li_idx,1,'.')
	if mid(ls_result,li_idx,1) = '.' then replace(ls_result,li_idx,1,',')
	li_idx = li_idx + 1
loop
return ls_result
end function

public function decimal f_round_spec (decimal vd_number, integer vi_decimal);string ls_int, ls_dec
int li_pos, li_sign_nbr, li_sign_dec, li_round_value, li_compare, li_rt
dec ld_trunc_nbr, ld_add_nbr, ld_rtn
 
li_sign_nbr = Sign(vd_number)
li_sign_dec = Sign(vi_decimal)
vd_number = Abs(vd_number)
ld_trunc_nbr = f_truncate(vd_number, vi_decimal)
vi_decimal = Abs(vi_decimal)

li_rt = f_split_number(vd_number, ls_int, ls_dec)
If li_rt <> 1 Then Return li_rt

If li_sign_dec >= 0 Then
	If vi_decimal >= Len(ls_dec) Then
		li_compare = 0
	Else
		li_compare = integer(Mid(ls_dec, vi_decimal + 1, 1))
	End If
Else
	If vi_decimal > Len(ls_int) Then
		li_compare = 0
	Else
		li_compare = integer(Mid(ls_int, Len(ls_int) - vi_decimal + 1, 1))
	End If
End If
//////tam dong round_method 
Select round_value into :li_round_value
	From erp_round_spec
		Where //round_method = :vs_round_method and
				from_value <= :li_compare and
				to_value >= :li_compare;
If SQLCA.SQLCode <> 0 Then li_round_value = 0

If li_sign_dec >= 0 Then
	ld_add_nbr = f_truncate(li_round_value / (10^(vi_decimal + 1)), vi_decimal + 1)
Else
	ld_add_nbr = li_round_value * 10^(vi_decimal - 1)
End If

ld_rtn = ld_trunc_nbr + ld_add_nbr
ld_rtn =f_truncate(ld_rtn, vi_decimal)
If li_sign_nbr = -1 Then ld_rtn = -ld_rtn

Return ld_rtn
end function

public function integer f_rearrange_array (powerobject vpo_source_array[], ref powerobject rpo_dest_array[]);int				li_idx

FOR li_idx = 1 to upperbound(vpo_source_array[])
	if isvalid(vpo_source_array[li_idx])  then
		rpo_dest_array[upperbound(rpo_dest_array)+1] = vpo_source_array[li_idx]
	end if
NEXT
return upperbound(rpo_dest_array[])
end function

public function integer f_sendmail (string vs_from_email, string vs_password, string vs_mail_server, long vl_server_port, string vs_to_email, string vs_cc_email, string vs_subject, string vs_attack_files, string vs_content);	string  ls_email_to
	date ld_date_of_birth,ld_day,ld_month
	long ll_return ,li_return, ll_row, li_rc
	string ls_email_array[], ls_files[]
	c_datetime lc_datetime
	c_obj_service lc_obj_service
	n_cst_xlshelper xlshelper  
	OLEObject mailman 
	OLEObject eMail
	mailman = Create OLEObject
	eMail   = Create OLEObject
	li_return = mailman.ConnectToNewObject("ChilkatMail2.ChilkatMailMan2.1")
	If li_return <> 0 Then
		Destroy mailman 
		Return 98       
	End if
	
	li_return = eMail.ConnectToNewObject("ChilkatMail2.ChilkatEMail2.1")    
	If li_return <> 0 Then
		Destroy eMail
		Return 97      
	End if
	mailman.UnlockComponent("MAIL12345678_2AF708DCG84G") //dung suot doi cho den khi chan
	mailman.SmtpHost =  vs_mail_server   //smtp.gmail.com 
	mailman.SmtpUsername =   vs_from_email 
	mailman.SmtpPassword  = vs_password
	mailman.SmtpPort = vl_server_port
	eMail.From = vs_from_email 
	eMail.AddTo('',vs_to_email)	
	lc_obj_service.f_stringtoarray(vs_cc_email, ';', ls_email_array)
	for ll_row = 1 to upperbound(ls_email_array)
		eMail.AddCC('',ls_email_array[ll_row])
	next
	lc_obj_service.f_stringtoarray(vs_attack_files, ';', ls_files)
	for ll_row = 1 to upperbound(ls_files)
		email.AddFileAttachment(ls_files[ll_row])
	next
	eMail.Subject= vs_subject
	eMail.Body = vs_content
	ll_return = mailman.SendEmail(eMail)  //gửi email di chi bang doan text
	IF  ll_return = 1 then
		    Destroy eMail
			Destroy mailman 
			//messagebox('', 'Gửi mail hoàn thành')
			Destroy eMail
			Destroy mailman 
			return 1
	else
			Destroy eMail
			Destroy mailman 
			//messagebox('','Gửi mail thất bại: ' + string(mailman.LastErrorText))
			return 0
	end if
		
end function

public function integer f_sendmail_system (string vs_to_email, string vs_cc_email, string vs_subject, string vs_attack_files, string vs_content);string lsa_to[], lsa_cc[], lsa_file[]
int	li_to, li_cc, li_i, li_file
mailRecipient lm_rep[]
mSes = create mailSession
mRet = mSes.mailLogon ( mailNewSession! )
If mRet <> mailReturnSuccess! Then
	destroy mSes
	//messagebox('','msg_ErrorLogOn')
	return -1
End If
li_to = f_Stringtoarray( vs_to_email, ';', lsa_to)
li_cc = f_Stringtoarray( vs_cc_email, ';', lsa_cc)
li_file = f_Stringtoarray( vs_attack_files, ';', lsa_file)
If li_to + li_cc = 0 Then
	mSes.mailLogoff()
	destroy mSes
	//messagebox('','msg_NoRecipient')
	return -1
End If

mMsg.Recipient = lm_rep 

For li_i = 1 to li_to
	mMsg.Recipient[li_i].Name = lsa_to[li_i]
	mRet = mSes.mailResolveRecipient(mMsg.Recipient[li_i],true)
	If mRet <> mailReturnSuccess! Then
		//destroy mSes
		//messagebox('','msg_InvalidRecipient')
		//return -1
		continue
	End If
	mMsg.Recipient[li_i].RecipientType = mailTo!
Next

For li_i = 1 to li_cc
	mMsg.Recipient[li_to + li_i].Name =lsa_cc[li_i]
	mRet = mSes.mailResolveRecipient(mMsg.Recipient[li_to + li_i],true)
	If mRet <> mailReturnSuccess! Then
		//destroy mSes
		//messagebox('','msg_NoRecipient')
		//return -1
		continue
	End If
	mMsg.Recipient[li_to + li_i].RecipientType = mailCC!
Next
//For li_i = 1 to li_file
//	mAttach.FileType = mailAttach!
//	mAttach.FileName = mid(lsa_file[li_file],pos(lsa_file[li_file],'\',-1))
//	mAttach.PathName = lsa_file[li_file]
//	mMsg.attachmentfile[1] = mAttach
//next 
mMsg.subject = vs_subject
mMsg.notetext = vs_content
mRet = mSes.mailsend ( mMsg )
If mRet <> mailReturnSuccess! Then
	mSes.mailLogoff()
	destroy mSes
	//messagebox('','msg_ErrorSendMail')
	return -1
End If
mSes.mailLogoff()
destroy mSes
return 1
end function

on c_obj_service.create
call super::create
TriggerEvent( this, "constructor" )
end on

on c_obj_service.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

