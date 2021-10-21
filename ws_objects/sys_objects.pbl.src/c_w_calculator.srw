$PBExportHeader$c_w_calculator.srw
$PBExportComments$window caculator, inherited from t_w_response
forward
global type c_w_calculator from t_w_response
end type
type dw_calculator from t_dw within c_w_calculator
end type
type gb_calc from t_gb within c_w_calculator
end type
end forward

global type c_w_calculator from t_w_response
integer width = 846
integer height = 1160
string title = "Calculator"
event syscommand pbm_syscommand
dw_calculator dw_calculator
gb_calc gb_calc
end type
global c_w_calculator c_w_calculator

type variables
Boolean	ib_firstequal = TRUE, lb_result_focus
String	is_previous_expression, is_format, is_SavedRequestorValue
t_dw idw_requestor
end variables

forward prototypes
public function boolean f_isvalidexpression (string as_expression)
public subroutine f_filter_expression (string as_expression, integer ai_pos)
public function integer f_evaluate_expression ()
end prototypes

event syscommand;Try
	// The user close the window using Alt+F4 or the cross
	If commandtype = 61536 Then
		// Reset the number on the requestor //
		idw_requestor.settext(is_SavedRequestorValue)
	End If
Catch(RuntimeError e)
//	OpenWithparm(c_w_err,e.text)
End Try		
end event

public function boolean f_isvalidexpression (string as_expression);Integer		li_len, li_i, li_count_right_parenthesis, li_count_left_parenthesis
String		ls_char, ls_current_value, ls_prev_char, ls_last_char, ls_decimal_sep
Boolean		lb_valid_expression = TRUE
c_obj_service lobj_srv

try
	
	// Get Length of current expression
	li_len = Len(as_expression)
	
	// Get decimal separator character
	ls_decimal_sep = lobj_srv.f_GetDecimalSeparator()
	
	// Check each character of expression
	For li_i = 1 to li_len
		// Get character
		ls_char = Mid(as_expression,li_i,1)
		
		Choose Case ls_char
			CASE ls_decimal_sep
				// Only one decimal separator in a number
				If Pos(ls_current_value,ls_decimal_sep) = 0 Then
					ls_current_value += ls_char
				Else
					lb_valid_expression = False
					Exit
				End If
				
			CASE '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
				// No number after ')'
				If ls_prev_char = ')' Then
					lb_valid_expression = False
					Exit
				End If
				// Build current value
				ls_current_value += ls_char
				
			CASE '/', '*', '+', '-' 
				// Discard another operator
				If lobj_srv.f_isOperator(ls_prev_char) Or ls_prev_char = '' Then
					lb_valid_expression = False
					Exit
				End If					
				// Clear current value
				ls_current_value = ''
				
			CASE '('
				// Open parenthesis after an operator or a left parenthesis or in front of expression
				If NOT lobj_srv.f_isOperator(ls_prev_char) AND ls_prev_char <> '(' AND ls_prev_char <> '' Then
					lb_valid_expression = False
					Exit
				End If
				// Clear current value
				ls_current_value = ''
				
			CASE ')'
				// Close parenthesis only if a parenthesis is opened
				If lobj_srv.f_isOperator(ls_prev_char) OR ls_prev_char = '(' Then
					lb_valid_expression = False
					Exit
				End If
				// Clear current value
				ls_current_value = ''
				
			CASE Else
				lb_valid_expression = False
				Exit
				
		End Choose
		ls_prev_char = ls_char
	Next
	
	// Global check of expression
	If lb_valid_expression = True Then
		// Check end of expression
		ls_last_char = right(as_expression,1)
		If lobj_srv.f_isoperator(ls_last_char) Or ls_last_char = '(' Then 
			lb_valid_expression = False
		End If
		// Check parenthesis parity
		li_count_left_parenthesis = lobj_srv.f_countoccurrences(as_expression, '(')
		li_count_right_parenthesis = lobj_srv.f_countoccurrences(as_expression, ')')
		If li_count_left_parenthesis <> li_count_right_parenthesis Then 
			lb_valid_expression = False
		End If
	End If
	
	// Invalid expression
	If lb_valid_expression = False Then
//		gf_messageBox('invalid_expression')
		This.ib_firstequal = True
	End If
	
	Return lb_valid_expression
	
Catch(RuntimeError e)
//	OpenWithparm(c_w_err,e.text)
End Try
end function

public subroutine f_filter_expression (string as_expression, integer ai_pos);String 		ls_new_expression, ls_char, ls_prev_char, ls_value
Integer 		li_i, li_len
String   	ls_valid_symbols = "0123456789()+/*-"
Integer		li_count_left_parenthesis, li_count_right_parenthesis
Boolean		lb_valid_expression = True
c_obj_service lobj_srv
	
Try	
	
	// Add decimal separator to the allowed characters
	ls_valid_symbols += lobj_srv.f_GetDecimalSeparator()
	
	// Get Length of current expression
	li_len = Len(as_expression)
	
	// Buid expression with valid symbols
	For li_i = 1 to li_len
		ls_char = Mid(as_expression,li_i,1)
		If Pos(ls_valid_symbols, ls_char) > 0 Then
			ls_new_expression += ls_char
		End If
	Next
	
	// Force expression with the valid expression
	//dw_calculator.SetText(ls_new_expression)
	dw_calculator.SetItem(1,'expression',ls_new_expression)
	
	// Scroll To the position of the cursor
	If ls_new_expression = as_expression Then
		dw_calculator.selecttext(ai_pos, 0)
	Else
		dw_calculator.selecttext(ai_pos - 1, 0)
	End If
Catch(RuntimeError e)
//	OpenWithparm(c_w_err,e.text)
End Try	
end subroutine

public function integer f_evaluate_expression ();String		ls_result, ls_expression, ls_lastchar
Integer		li_count_left_parenthesis, li_count_right_parenthesis
c_obj_service lobj_srv


	
	// Accept Text of the expression
	dw_calculator.AcceptText()
	
	// Get expression 
	ls_expression = dw_calculator.GetItemString(dw_calculator.GetRow(),"expression")
	
	// Set expression to 0 if string is empty
	If IsNull(ls_expression) or ls_expression = '' Then 
		ls_expression = '0'
	End If
	
	// Check if expression is valid
	If f_isValidExpression(ls_expression) Then 
		
		// Before evaluating expression replace '-' by ' - ' because of a bug in some substract expressions
		ls_expression = lobj_srv.f_globalreplace( ls_expression, '-', ' - ')
		
		// Convert decimal separator character to a dot ('.') before evaluation
		ls_expression = lobj_srv.f_GlobalReplace(ls_expression,lobj_srv.f_GetDecimalSeparator(),".")
		
		// Evaluate expression
		ls_result = dw_calculator.describe("evaluate('"+ ls_expression + "',1)")
		
		// Verify result
		If IsNumber(ls_result) Then 
			ls_result = String(dec(ls_result),is_format)
		Else
			If ls_result <> '!' Then 
//				gf_messagebox('invalid_expresion')
				This.ib_firstequal = True
				return -1
			Else
				This.ib_firstequal = True
			End If
			ls_result = ''
		End If
	Else
		ls_result = ''
		return -1
	End If
	
	// Set The result on the DW's
	dw_calculator.setitem(1,"result",ls_result)
	is_SavedRequestorValue = ls_result
//	idw_requestor.SetText(ls_result)
//
return 0
end function

on c_w_calculator.create
int iCurrent
call super::create
this.dw_calculator=create dw_calculator
this.gb_calc=create gb_calc
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_calculator
this.Control[iCurrent+2]=this.gb_calc
end on

on c_w_calculator.destroy
call super::destroy
destroy(this.dw_calculator)
destroy(this.gb_calc)
end on

event e_preopen;call super::e_preopen;If IsValid(Message.PowerObjectParm) Then
	idw_requestor = Message.PowerObjectParm
	setnull(Message.PowerObjectParm)
End If
dw_calculator.insertrow( 0)
dw_calculator.setfocus( )
return 0
end event

event closequery;call super::closequery;//idw_requestor.SetText('')
end event

type cb_cancel from t_w_response`cb_cancel within c_w_calculator
integer x = 411
integer y = 940
integer taborder = 3
end type

event cb_cancel::clicked;call super::clicked;idw_requestor.SetText('')
Close(parent)
end event

type cb_ok from t_w_response`cb_ok within c_w_calculator
integer x = 9
integer y = 940
integer taborder = 2
end type

event cb_ok::clicked;call super::clicked;		if f_evaluate_expression() = 0 then
			idw_requestor.SetText(is_SavedRequestorValue)
			Close(parent)
		end if

end event

type dw_calculator from t_dw within c_w_calculator
integer x = 37
integer y = 52
integer width = 754
integer height = 876
integer taborder = 1
boolean bringtotop = true
string dataobject = "d_calculator"
borderstyle borderstyle = stylebox!
end type

event editchanged;call super::editchanged;Try
	Integer	li_pos
	
	// Get position of the cursor
	li_pos = This.position()
	
	// Validate expression
	// of_validate_expression(data,li_pos)
	f_filter_expression(data,li_pos)
Catch(RuntimeError e)
//	OpenWithparm(c_w_err,e.text)
End Try	
end event

event buttonclicked;call super::buttonclicked;String 			ls_buttonname, ls_buttontext, ls_expression
Integer			li_totallen, li_pos
c_w_calculator	lw_calculator
Try
	If IsNull(dwo) Then Return
	If IsNull(dwo.Name) Then Return
	If IsNull(dwo.Text) Then Return
	
	// Get the clicked information.
	ls_buttonname = Trim(dwo.Name)
	ls_buttontext = Trim(dwo.Text)
	
	// Tell the object of the clicked button.
	If Len(ls_buttontext) > 0 Then
		// Accept Text of the expression
		dw_calculator.accepttext()
			
		// Get expression
		ls_expression = This.GetItemString(1,"expression")
		If IsNull(ls_expression) Then ls_expression = ''
		
		// Get expression's lenght
		li_totallen = len(ls_expression)
	
		// Get cursor position 
		If GetColumnName() = 'result' Then
			li_pos = li_totallen + 1
		Else
			li_pos = This.position()
		End If
		
		// Next '=' will be the first
		If ls_buttontext <> "=" Then ib_firstequal = True
		
		Choose case ls_buttontext
			Case  '=' 
//				If ib_firstequal Then 
//					// After that it won't be the first time that user use '='
//					ib_firstequal = False
//					
					// Evaluate the expression
					f_evaluate_expression()
//				Else
//					// The user use '=' for the second time => Close the parent window //
//					If This.f_getparentwindow(lw_calculator) = 1 Then 
//						If idw_requestor.Gettext() = '' Then
//							// Reset saved number on the requestor
////							idw_requestor.SetText(is_SavedRequestorValue)
//						End If
////						Post Close(lw_calculator)
//						Return
//					End If
//				End If
	
			Case "C"
				// Clear expression
				This.SetItem(1,"expression",'')
				
			Case "<-"
				// Clear previous char in expression
				ls_expression = Mid(ls_expression,1,li_pos - 2) + mid(ls_expression, li_pos)
	//			dw_calculator.SetText(ls_expression)
				dw_calculator.SetItem(1,'expression',ls_expression)
				
				// Scroll To the position of the cursor
				dw_calculator.selecttext(li_pos - 1, 0)
	
			Case Else
				// Build new expression
				ls_expression = Mid(ls_expression,1,li_pos - 1) + ls_buttontext + mid(ls_expression, li_pos)
			
				// Filter expression 
				f_filter_expression(ls_expression, li_pos + 1)
		End Choose
	End If
Catch(RuntimeError e)
//	OpenWithparm(c_w_err,e.text)
End Try
end event

event rowfocuschanged;//
end event

event constructor;//
//This.Settransobject(sqlca)
//This.InsertRow(0)
end event

event destructor;//
end event

event e_rbuttondown;//
end event

event itemfocuschanged;//
end event

event e_dwnkey;call super::e_dwnkey;Try
	c_w_calculator	lw_calculator
	
	// Specific for "=" button //
	If KeyDown(KeyEnter!) or (Not KeyDown(KeyShift!) And KeyDown(KeyEqual!)) Then
//		If ib_firstequal Then 
			// After that it won't be the first time that user use '='
//			ib_firstequal = False
			// Evaluate the expression
			f_evaluate_expression()
//		Else
			// The user use '=' for the second time => Close the parent window //
			If This.f_getparentwindow(lw_calculator) = 1 Then 
//				If idw_requestor.Gettext() = '' Then
					// Reset saved number on the requestor
					idw_requestor.SetText(is_SavedRequestorValue)
//				End If
				Close(lw_calculator)
				Return
			End If
//		End If
//	Else
//		// Next '=' will be the first
//		ib_firstequal = True
	End If
//	
//	Return
Catch(RuntimeError e)
//	OpenWithparm(c_w_err,e.text)
End Try	
end event

type gb_calc from t_gb within c_w_calculator
integer x = 9
integer y = 4
integer width = 800
integer height = 932
integer textsize = -9
string text = "Calculator"
end type

