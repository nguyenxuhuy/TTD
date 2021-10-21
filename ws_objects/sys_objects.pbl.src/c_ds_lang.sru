$PBExportHeader$c_ds_lang.sru
$PBExportComments$Core datastore language inherited from t_ds_db
forward
global type c_ds_lang from t_ds_db
end type
end forward

global type c_ds_lang from t_ds_db
end type
global c_ds_lang c_ds_lang

forward prototypes
public function integer f_set_menu_lang (menu vm_menu)
public function integer f_retrieve_lang_text (string vs_dwo_name)
public function string f_get_lang_text (string vs_code, string vs_subcode)
public function integer f_set_dw_lang (t_dw vdw_dw)
public function integer f_set_dwc_lang (datawindowchild vdwc_dw, string vs_up_grp)
public function string f_find_text (string vs_code, string vs_subcode, long al_begin, long al_end)
public function integer f_set_ttdhelp (string vs_code, string vs_subcode)
public function string f_get_lang_text (string vs_code)
public function string f_find_text (string vs_code, long al_begin, long al_end)
end prototypes

public function integer f_set_menu_lang (menu vm_menu);/* return 
	0 success
	null do nothing
	-1 error
*/
integer li_rtn, li_m_idx, li_item_idx1, li_item_idx2, li_find
string ls_menu_name, ls_item_name, ls_toolbartext, ls_microhelp
try
	setnull(li_rtn)
	if isnull(vm_menu) or not isvalid(vm_menu) then return li_rtn
	
	ls_menu_name = vm_menu.className()
	
	FOR li_m_idx = 1 to upperbound(vm_menu.item[])
		ls_item_name = vm_menu.item[li_m_idx].className()

		li_find = this.find( "code = '"+ls_item_name+"'", 1, this.rowcount( ) )
		if li_find > 0 then
			vm_menu.item[li_m_idx].text = this.getitemstring( li_find, "text")
			ls_toolbartext = this.getitemstring( li_find, "text")
			ls_microhelp = this.getitemstring( li_find, "text")
			if isnull(ls_microhelp) then ls_microhelp=''
			if isnull(ls_toolbartext) then ls_toolbartext =''
			vm_menu.item[li_m_idx].toolbaritemtext = ls_toolbartext
			vm_menu.item[li_m_idx].microhelp = ls_microhelp			
		else
			if vm_menu.item[li_m_idx].text <> '-' then
				vm_menu.item[li_m_idx].text = '?['+ls_item_name+']?'
			end if
		end if
		
		FOR li_item_idx1 = 1 to upperbound(vm_menu.item[li_m_idx].item)
			ls_item_name = vm_menu.item[li_m_idx].item[li_item_idx1].className()
			
			li_find = this.find( "code = '"+ls_item_name+"'", 1, this.rowcount( ) )
			if li_find > 0 then
				vm_menu.item[li_m_idx].item[li_item_idx1].text = this.getitemstring( li_find, "text")
				
				ls_toolbartext = this.getitemstring( li_find, "text")
				ls_microhelp = this.getitemstring( li_find, "text")
				if isnull(ls_microhelp) then ls_microhelp=''
				if isnull(ls_toolbartext) then ls_toolbartext =''
				vm_menu.item[li_m_idx].item[li_item_idx1].toolbaritemtext = ls_toolbartext
				vm_menu.item[li_m_idx].item[li_item_idx1].microhelp = ls_microhelp
			else
				if vm_menu.item[li_m_idx].item[li_item_idx1].text <> '-' then 
					vm_menu.item[li_m_idx].item[li_item_idx1].text = '?['+ls_item_name+']?'
				end if
			end if
			
			FOR  li_item_idx2 = 1 to upperbound(vm_menu.item[li_m_idx].item[li_item_idx1].item)
				ls_item_name = vm_menu.item[li_m_idx].item[li_item_idx1].item[li_item_idx2].className()
				
				li_find = this.find( "code = '"+ls_item_name+"'", 1, this.rowcount( ) )
				if li_find > 0 then
					vm_menu.item[li_m_idx].item[li_item_idx1].item[li_item_idx2].text = this.getitemstring( li_find, "text")
					
					ls_toolbartext = this.getitemstring( li_find, "text")
					ls_microhelp = this.getitemstring( li_find, "text")
					if isnull(ls_microhelp) then ls_microhelp=''
					if isnull(ls_toolbartext) then ls_toolbartext =''
					vm_menu.item[li_m_idx].item[li_item_idx1].item[li_item_idx2].toolbaritemtext = ls_toolbartext
					vm_menu.item[li_m_idx].item[li_item_idx1].item[li_item_idx2].microhelp = ls_microhelp
				else
					if vm_menu.item[li_m_idx].item[li_item_idx1].item[li_item_idx2].text <> '-' then 
						vm_menu.item[li_m_idx].item[li_item_idx1].item[li_item_idx2].text = '?['+ls_item_name+']?'
					end if
				end if
			NEXT
		NEXT
	NEXT
	return 0
catch(Runtimeerror lre)
//	openwithparm(c_w_err, lre.text)
	return -1
end try
end function

public function integer f_retrieve_lang_text (string vs_dwo_name);/*
- return null do nothing
- return number of rows if success
- return -1 error
*/
integer li_rtn
try
	setnull(li_rtn)
////	this.dataobject = 'c_d_retrieve_grp'
//	this.settrans( sqlca)
//	li_rtn = this.retrieve(vs_dwo_name, gs_user_lang )
	return li_rtn
catch(runtimeError lre)
//	openwithparm(c_w_err, lre.text)
end try
end function

public function string f_get_lang_text (string vs_code, string vs_subcode);/*
- return null do nothing
- return text string
*/
long 				ll_rtn
string 			ls_text
try
	if isnull(vs_subcode) or vs_subcode = '' then
		ll_rtn = this.find( "code = '"+vs_code+"' AND isnull(subcode)", 1, this.rowcount())
	else
		ll_rtn = this.find( "code = '"+vs_code+"' AND subcode='" + vs_subcode + "'", 1, this.rowcount())
	end if
	if ll_rtn > 0 then 
		return this.getitemstring( ll_rtn, 'text')
	elseif ll_rtn = 0 then
		return '?['+vs_code+']?'
	else
//		gf_messagebox('label_err'+";"+vs_code+";"+vs_subcode)
	end if
	setnull(ls_text)
	return ls_text
catch(runtimeError lre)
//	openwithparm(c_w_err, lre.text)
end try
end function

public function integer f_set_dw_lang (t_dw vdw_dw);/* return 
	1 success
	0 nothing
	-1 error
*/
integer 				li_cols, li_nbr_objects, ll_rc, li_nbr_values, li_i, li_j
string					ls_dwo_name,ls_dwo,  ls_item_name, ls_subcode, ls_text, ls_dwo_child
string					ls_objstring, ls_objects[], ls_buffer, ls_valstring, ls_empty[], ls_values[]
long 					li_rows, li_find
DatawindowChild	ldwc_subreport
c_obj_service 		lobj_srv
s_object_display	lod_handling
window				lw_display

if gs_user_lang =  'vi-vn' then return 0

If IsNull(vdw_dw) or not IsValid(vdw_dw) Then Return -1

try
	vdw_dw.f_getparentwindow(lw_display)
	lod_handling = lw_display.dynamic f_get_obj_handling()
	
	ls_dwo_name = vdw_dw.dataobject
	if pos('d_action_edit;d_action_manage;d_action_related_object;d_action_related_report;d_search_result_admin_grid;',ls_dwo_name+';') = 0 then
		if left(ls_dwo_name, 3) <> 'dd_' then
			ls_dwo = left(ls_dwo_name, len(ls_dwo_name) - 5)
		else
			ls_dwo = ls_dwo_name
		end if
		ls_subcode = upper(lod_handling.classname())
		if ls_subcode = 'U_CHOOSE_TRANS' then ls_subcode = 'U_TRANS_SETUP'
	else
		if ls_dwo_name = 'd_search_result_admin_grid' then
			ls_dwo = left(ls_dwo_name, len(ls_dwo_name) - 5)
		else
			ls_dwo = ls_dwo_name
		end if
		ls_subcode = ls_dwo_name
	end if
	li_rows = this.rowcount( )

	ls_objstring = vdw_dw.describe("Datawindow.Objects")

	li_nbr_objects = lobj_srv.f_StringToArray(ls_objstring,"~t",ls_objects)
	If li_nbr_objects <= 0 Then Return 0
	
	For li_i = 1 To li_nbr_objects
		ls_item_name = ls_objects[li_i]

		If Right(ls_item_name,2) = "_t" or  Left(ls_item_name,3) = "gb_" or  Left(ls_item_name,2) = "b_"  Then
			// The object is a text label
			if ls_subcode <> 'U_VALUESET' then
				ls_text = this.f_find_text(ls_dwo+'.'+ls_item_name,ls_subcode, 1, li_rows)		
			else
				ls_text = this.f_find_text(ls_dwo+'.'+ls_item_name, 1, li_rows)		
			end if
			if isnull(ls_text) then ls_text = ''
			if ls_text = '?' then 
				ls_text = vdw_dw.describe(ls_item_name+'.text')
				if ls_text <> '' and not isnull(ls_text) and  ls_item_name <> 'gutter_t' then
					ls_text ='['+ ls_text +']'
				end if
			end if
			ls_buffer += ls_item_name + ".Text=~"" + ls_text + "~" "
		
		Else
			If vdw_dw.describe(ls_item_name + ".Edit.Style") = "dddw" Then
				// The object is a dropdowndw
				// -> get the reference to the dwchild
				ll_rc = vdw_dw.GetChild(ls_item_name,ldwc_subreport)
				If ll_rc = 1 Then
					// Translate the dropdowndw
//					ldwc_subreport.retrieve( '')
					ls_dwo_child = vdw_dw.describe( ls_item_name+ '.dddw.name')
					ldwc_subreport.insertrow( 0)
					f_set_dwc_lang(ldwc_subreport,ls_dwo_child)
				End If
			End If
			
			// Check if the object has a code table
			ls_valstring = vdw_dw.describe(ls_item_name + ".Values")
			If Len(ls_valstring) > 0 and ls_valstring <> "!" and ls_valstring <> "?" Then
				// The object has a lookup code table
				// (DropDownListBox/RadioButtons/Edit)
				
				// Don't translate Checkboxes
				If vdw_dw.describe(ls_item_name + ".Edit.Style") = "checkbox" Then Continue
				
				// Reset values array
				ls_values = ls_empty
				
				// Put the objects in an array for easier access
				li_nbr_values = lobj_srv.f_StringToArray(ls_valstring,"/",ls_values)
				
				// Translate each value
				For li_j=1 To li_nbr_values
					if ls_subcode <> 'U_VALUESET' then
						ls_text =  this.f_find_text(ls_dwo+'.'+ls_item_name + '_' + string(li_j),ls_subcode , 1, li_rows) 	
					else
						ls_text = this.f_find_text(ls_dwo+'.'+ls_item_name + '_' + string(li_j), 1, li_rows)		
					end if					
					if isnull(ls_text) then ls_text = ''
					if ls_text <> '?' then 	
						ls_values[li_j] = ls_text + "~t" + Mid(ls_values[li_j],Pos(ls_values[li_j],"~t")+1)
					end if
				Next
				// Put back the values in a string
				lobj_srv.f_ArrayToString(ls_values,"/",ls_valstring)
				
				// update the buffer
				ls_buffer += ls_item_name+".Values=~""+ls_valstring+"~" "
			End If
		End If
	Next
	
	// One pass translation
	ls_buffer = vdw_dw.Modify(ls_buffer)
	If Len(ls_buffer) > 0 Then
		Return -1
	End If
return 1
catch(runtimeerror lre)
//	openwithparm(c_w_err,lre.text)
end try
end function

public function integer f_set_dwc_lang (datawindowchild vdwc_dw, string vs_up_grp);/* return 
	1 success
	0 nothing
	-1 error
*/
integer li_cols, li_rows, li_find, li_nbr_objects, ll_rc, li_nbr_values, li_i, li_j
string ls_dwo_name, ls_code, ls_text, ls_error, ls_item_name, ls_dwo, ls_dwo_child
string ls_objstring, ls_objects[], ls_buffer, ls_valstring, ls_empty[], ls_values[]
DatawindowChild	ldwc_subreport
c_obj_service lobj_srv

If IsNull(vdwc_dw) or not IsValid(vdwc_dw) Then Return -1

try
	// set column name in language 
	if left(vs_up_grp, 3) <> 'dd_' then
		ls_dwo = left(vs_up_grp, len(vs_up_grp) -5)
	else
		ls_dwo = vs_up_grp
	end if
	ls_objstring = vdwc_dw.describe("Datawindow.Objects")

	li_nbr_objects = lobj_srv.f_StringToArray(ls_objstring,"~t",ls_objects)
	If li_nbr_objects <= 0 Then Return 0
	li_rows = this.rowcount( )
	
	For li_i=1 To li_nbr_objects
		ls_item_name = ls_objects[li_i]
		
		If Right(ls_item_name,2) = "_t" or  Left(ls_item_name,3) = "gb_" or  Left(ls_item_name,2) = "b_"  Then
			
			ls_text = this.f_find_text(ls_dwo+'.'+ls_item_name, 1, li_rows)		
			if isnull(ls_text) then ls_text = ''
			if ls_text = '?' then 
				ls_text = vdwc_dw.describe(ls_item_name+'.text')
				if ls_text <> '' and not isnull(ls_text) and  ls_item_name <> 'gutter_t' then
					ls_text ='['+ ls_text +']'
				end if
			end if
			
			ls_buffer += ls_item_name + ".Text=~"" + ls_text + "~" "
		Else
			If vdwc_dw.describe(ls_item_name + ".Edit.Style") = "dddw" Then
				// The object is a dropdowndw
				// -> get the reference to the dwchild
				ll_rc = vdwc_dw.GetChild(ls_item_name,ldwc_subreport)
				ls_dwo_child = vdwc_dw.describe( ls_item_name+ '.dddw.name')
				If ll_rc = 1 Then
					// Translate the dropdowndw
					f_set_dwc_lang(ldwc_subreport,ls_dwo_child)
				End If
			End If
			
			// Check if the object has a code table
			ls_valstring = vdwc_dw.describe(ls_item_name + ".Values")
			If Len(ls_valstring) > 0 and ls_valstring <> "!" and ls_valstring <> "?" Then
				// The object has a lookup code table
				// (DropDownListBox/RadioButtons/Edit)
				
				// Don't translate Checkboxes
				If vdwc_dw.describe(ls_item_name + ".Edit.Style") = "checkbox" Then Continue
				
				// Reset values array
				ls_values = ls_empty
				
				// Put the objects in an array for easier access
				li_nbr_values = lobj_srv.f_StringToArray(ls_valstring,"/",ls_values)
				
				// Translate each value
				For li_j=1 To li_nbr_values
					ls_text = this.f_find_text(ls_dwo+'.'+ls_item_name + '_' + string(li_j), 1, li_rows)	
					if isnull(ls_text) then ls_text = ''
					if ls_text <> '?' then 	
						ls_values[li_j] = ls_text + "~t" + Mid(ls_values[li_j],Pos(ls_values[li_j],"~t")+1)
					end if
				Next
				// Put back the values in a string
				lobj_srv.f_ArrayToString(ls_values,"/",ls_valstring)
				
				// update the buffer
				ls_buffer += ls_item_name+".Values=~""+ls_valstring+"~" "
			End If
		End If
	Next
	
	// One pass translation
	ls_buffer = vdwc_dw.Modify(ls_buffer)
	If Len(ls_buffer) > 0 Then
		Return -1
	End If

catch(runtimeerror lre)
//	openwithparm(c_w_err,lre.text)
end try
return 1


	
end function

public function string f_find_text (string vs_code, string vs_subcode, long al_begin, long al_end);int li_find
string ls_text
li_find = this.find("code='"+ vs_code+"' AND subcode='" + vs_subcode + "'", al_begin, al_end )

if li_find > 0 then
	ls_text = this.getitemstring(li_find,'text')
else
	ls_text = '?'
end if

return ls_text
end function

public function integer f_set_ttdhelp (string vs_code, string vs_subcode);/*
- return null do nothing
- return text string
*/
long 				ll_found
string 			ls_text
try
	if isnull(vs_subcode) or vs_subcode = '' then
		ll_found = this.find( "code = '"+vs_code+"' AND isnull(subcode)", 1, this.rowcount())
	else
		ll_found = this.find( "code = '"+vs_code+"' AND subcode='" + vs_subcode + "'", 1, this.rowcount())
	end if
	if ll_found > 0 then
		t_w_mdi.setmicrohelp(this.getitemstring( ll_found, 'ttdhelp'))
		return 1
	elseif ll_found = 0 then
		return 0
	else
		return ll_found
	end if

catch(runtimeError lre)
//	openwithparm(c_w_err, lre.text)
end try
end function

public function string f_get_lang_text (string vs_code);/*
- return null do nothing
- return text string
*/
long 				ll_rtn
string 			ls_text
try
	
	ll_rtn = this.find( "code = '"+vs_code+"'", 1, this.rowcount())

	if ll_rtn > 0 then 
		return this.getitemstring( ll_rtn, 'text')
	elseif ll_rtn = 0 then
//		this.retrieve( gs_user_lang, gdb_industry_id)
//		ll_rtn = this.find( "code = '"+vs_code+"'", 1, this.rowcount())
//		if ll_rtn > 0 then 
//			return this.getitemstring( ll_rtn, 'text')
//		else
			return ''
//		end if
	end if
	setnull(ls_text)
	return ls_text
catch(runtimeError lre)
//	openwithparm(c_w_err, lre.text)
end try
end function

public function string f_find_text (string vs_code, long al_begin, long al_end);int li_find
string ls_text
li_find = this.find("code='"+ vs_code+"'" , al_begin, al_end )

if li_find > 0 then
	ls_text = this.getitemstring(li_find,'text')
else
	ls_text = '?'
end if

return ls_text
end function

on c_ds_lang.create
call super::create
end on

on c_ds_lang.destroy
call super::destroy
end on

