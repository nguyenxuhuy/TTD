$PBExportHeader$c_label.sru
forward
global type c_label from s_object_display
end type
end forward

global type c_label from s_object_display
boolean ib_filter = false
boolean ib_refresh = false
boolean ib_trace = false
boolean ib_keyboardlocked = false
boolean ib_query = false
boolean ib_update = false
boolean ib_insert = false
boolean ib_delete = false
boolean ib_query_ctx = false
boolean ib_update_ctx = false
boolean ib_insert_ctx = false
boolean ib_delete_ctx = false
boolean ib_trace_ctx = false
end type
global c_label c_label

type variables

protected:
c_label_tv		ic_label_tv

end variables

forward prototypes
public function integer f_display_on_tv (ref treeview r_tv)
public function integer f_load_windowobj_2_tv (ref treeview rtv_handling, ref window rw_handling)
public function integer f_add_windowobj_label (ref datawindow rdw_label_vn, ref window rw_handling, string vs_subcode)
public function integer f_load_label (ref datawindow rpo_dw)
public function integer f_add_dwo_label (ref datawindow rdw_label_vn, string vs_dwo, string vs_dwo_description, string vs_subcode)
public function integer f_add_windowobj_label (ref datawindow rdw_label_vn, string vs_w_name, string vs_subcode)
end prototypes

public function integer f_display_on_tv (ref treeview r_tv);return 0
end function

public function integer f_load_windowobj_2_tv (ref treeview rtv_handling, ref window rw_handling);return 0
end function

public function integer f_add_windowobj_label (ref datawindow rdw_label_vn, ref window rw_handling, string vs_subcode);//
int 					li_idx, li_idx_tab, li_idx_tabpage
String 				ls_code, ls_text
Long 					ll_find, ll_row
windowobject 		lwo_window[], ltp_obj[]
userobject			ltb_obj[]
t_t						ltb_tmp

lwo_window = rw_handling.control	

For li_idx = 1 to upperbound(lwo_window)
	Choose Case lwo_window[li_idx].typeof()
		Case CommandButton!,PictureButton!,statictext!,groupbox!,CheckBox!
			if lwo_window[li_idx].visible = true then
				ls_text = lwo_window[li_idx].dynamic f_gettext()				
				if isnull(ls_text) or ls_text ='' then continue			
				ls_code = vs_subcode+'.'+lwo_window[li_idx].classname()
				ll_find = t_w_mdi.ids_lang_text.Find("code = '"+ ls_code +"'", 1, t_w_mdi.ids_lang_text.RowCount())
				if ll_find = 0 then
					ll_row = rdw_label_vn.dynamic event e_addrow()
					rdw_label_vn.setitem(ll_row, 'lang',gs_user_lang)	
					rdw_label_vn.setitem(ll_row, 'code', ls_code)
					rdw_label_vn.setitem(ll_row, 'subcode',vs_subcode)
					rdw_label_vn.setitem(ll_row, 'text', ls_text )	
				end if
			end if
		case tab!
				ltb_tmp = create t_t
				ltb_tmp = lwo_window[li_idx]
				ltb_obj[] = ltb_tmp.control
				For li_idx_tab = 1 to upperbound(ltb_obj)

					ltp_obj[] = ltb_obj[li_idx_tab].control
					For li_idx_tabpage = 1 to upperbound(ltp_obj)
						Choose Case ltp_obj[li_idx_tabpage].typeof()
							Case  CommandButton!,PictureButton!,CheckBox!,RadioButton!,StaticText!,GroupBox!
								if ltp_obj[li_idx_tabpage].visible = true then
									ls_text = ltp_obj[li_idx_tabpage].dynamic f_gettext()				
									if isnull(ls_text) or ls_text ='' then continue			
									ls_code = vs_subcode+'.'+lwo_window[li_idx].classname()+'.'+ltb_obj[li_idx_tab].classname()+'.'+ltp_obj[li_idx_tabpage].classname()
									ll_find = t_w_mdi.ids_lang_text.Find("code = '"+ ls_code +"'", 1, t_w_mdi.ids_lang_text.RowCount())
									if ll_find = 0 then
										ll_row = rdw_label_vn.dynamic event e_addrow()
										rdw_label_vn.setitem(ll_row, 'lang',gs_user_lang)	
										rdw_label_vn.setitem(ll_row, 'code', ls_code)
										rdw_label_vn.setitem(ll_row, 'subcode',vs_subcode)
										rdw_label_vn.setitem(ll_row, 'text', ls_text )	
									end if
								end if
						End Choose
					Next
				Next			
	End Choose
Next

Return 1

end function

public function integer f_load_label (ref datawindow rpo_dw);return 0
end function

public function integer f_add_dwo_label (ref datawindow rdw_label_vn, string vs_dwo, string vs_dwo_description, string vs_subcode);
int 					li_idx, li_nbr_objects, li_nbr_values, li_j
String 				ls_code, ls_find, ls_text, ls_dwo_trim, ls_type, ls_x, ls_originalFilter
String 				ls_objstring, ls_objects[], ls_name, ls_valstring, ls_values[], ls_empty[], ls_display[]
Long 					ll_find, ll_row

c_string 				lc_string
t_ds					lds_dwo

lds_dwo = create t_ds
lds_dwo.DataObject = vs_dwo
if left(vs_dwo,8) <> 'd_action' and left(vs_dwo,3)<> 'dd_' then 
	ls_dwo_trim = mid(vs_dwo,1,len(vs_dwo)-5)
else
	ls_dwo_trim = vs_dwo
end if
ls_originalFilter = rdw_label_vn.describe('datawindow.table.filter')
if ls_originalFilter <> '?' then
	rdw_label_vn.setfilter('')
	rdw_label_vn.filter()
end if
ll_find = t_w_mdi.ids_lang_text.Find("code = '"+ ls_dwo_trim +"' and subcode ='"+vs_subcode +"'", 1, t_w_mdi.ids_lang_text.RowCount())
if ll_find = 0 then		
	ll_find = rdw_label_vn.find("code = '"+ ls_dwo_trim +"' and subcode ='"+vs_subcode+"'", 1, rdw_label_vn.RowCount())
	if ll_find = 0 then
		ll_row = rdw_label_vn.dynamic event e_addrow()
		rdw_label_vn.setitem(ll_row, 'code', ls_dwo_trim)
		rdw_label_vn.setitem(ll_row, 'subcode', vs_subcode)
		rdw_label_vn.setitem(ll_row, 'text', vs_dwo_description )	
		rdw_label_vn.setitem(ll_row, 'lang', gs_user_lang )
	end if
end if
			
ls_objstring = lds_dwo.describe("Datawindow.Objects")
li_nbr_objects = lc_string.f_StringToArray(ls_objstring,"~t",ls_objects)
For li_idx = 1 To li_nbr_objects
	ls_name = ls_objects[li_idx]
	if ls_name = 'gutter_t' or ls_name = 'gutter' then continue
	ls_type = lds_dwo.describe(ls_name + ".type")
	ls_x =  lds_dwo.describe(ls_name + "_t.x")
	ls_text = lds_dwo.describe(ls_name + ".text")
	If Right(ls_name,2) = '_t' or Left(ls_name,3) = 'gb_' or Left(ls_name,2) = 'b_' or Left(ls_name,3) = 'br_' Then
		ls_code =  ls_dwo_trim+'.'+ls_name
		ll_find = t_w_mdi.ids_lang_text.Find("code = '"+ ls_code +"' and subcode ='"+vs_subcode +"'", 1, t_w_mdi.ids_lang_text.RowCount())
		if ll_find = 0 then
			ll_find = rdw_label_vn.find("code = '"+ ls_code +"' and subcode ='"+vs_subcode+"'", 1, rdw_label_vn.RowCount())
			if ll_find = 0 then
				ls_code =  ls_dwo_trim+'.'+left(ls_name,len(ls_name) -2)+'_x'
				ll_find = rdw_label_vn.find("code = '"+ ls_code +"' and subcode ='"+vs_subcode+"'", 1, rdw_label_vn.RowCount())
				if  ll_find = 0 then
					ls_code =  ls_dwo_trim+'.'+ls_name
					ll_row = rdw_label_vn.dynamic event e_addrow()
					rdw_label_vn.setitem(ll_row, 'lang', gs_user_lang)	
					rdw_label_vn.setitem(ll_row, 'code', ls_code)
					rdw_label_vn.setitem(ll_row, 'subcode',vs_subcode)
					rdw_label_vn.setitem(ll_row, 'text', ls_text )
				else
					rdw_label_vn.setitem(ll_find, 'code', ls_dwo_trim+'.'+ls_name)
					rdw_label_vn.setitem(ll_find, 'text', ls_text )					
				end if
			end if
		end if
	Elseif ls_type = 'column' and ls_x = '!' then	
		ls_code = ls_dwo_trim+'.'+ls_name+'_t'
		ll_find = t_w_mdi.ids_lang_text.Find("code = '"+ ls_code +"' and subcode ='"+vs_subcode +"'", 1, t_w_mdi.ids_lang_text.RowCount())
		if ll_find = 0 then
			ll_find = rdw_label_vn.find("code = '"+ ls_code +"' and subcode ='"+vs_subcode+"'", 1, rdw_label_vn.RowCount())
			if ll_find = 0 then
				ls_code = ls_dwo_trim+'.'+ls_name+'_x'
				ll_find = t_w_mdi.ids_lang_text.Find("code = '"+ ls_code +"' and subcode ='"+vs_subcode +"'", 1, t_w_mdi.ids_lang_text.RowCount())
				if ll_find = 0 then				
					ll_find = rdw_label_vn.find("code = '"+ ls_code +"' and subcode ='"+vs_subcode+"'", 1, rdw_label_vn.RowCount())
					if ll_find = 0 then
						ll_row = rdw_label_vn.dynamic event e_addrow()
						rdw_label_vn.setitem(ll_row, 'lang', gs_user_lang )	
						rdw_label_vn.setitem(ll_row, 'code', ls_code)
						rdw_label_vn.setitem(ll_row, 'subcode',vs_subcode)
						rdw_label_vn.setitem(ll_row, 'text', ls_name )	
					end if
				end if
			end if
		end if
	Else
		ls_valstring = lds_dwo.describe(ls_name + ".Values")
		If Len(ls_valstring) > 0 and ls_valstring <> "!" and ls_valstring <> "?" Then
			If lds_dwo.describe(ls_name + ".Edit.Style") = "checkbox" Then Continue
			ls_values = ls_empty
			
			li_nbr_values = lc_string.f_StringToArray(ls_valstring,"/",ls_values)
			For li_j = 1 To li_nbr_values
				ls_display = ls_empty
				lc_string.f_StringToArray(ls_values[li_j],"~t",ls_display)
				ls_text = ls_display[1]
				ls_code =  ls_dwo_trim+'.'+ls_name+'_'+string(li_j)
				ll_find = t_w_mdi.ids_lang_text.Find("code = '"+ ls_code +"' and subcode ='"+vs_subcode+"'", 1, t_w_mdi.ids_lang_text.RowCount())
				if ll_find = 0 then
					ll_find = rdw_label_vn.find("code = '"+ ls_code +"' and subcode ='"+vs_subcode+"'", 1, rdw_label_vn.RowCount())
					if ll_find = 0 then
						ll_row = rdw_label_vn.dynamic event e_addrow()
						rdw_label_vn.setitem(ll_row, 'lang', gs_user_lang)
						rdw_label_vn.setitem(ll_row, 'code', ls_code)
						rdw_label_vn.setitem(ll_row, 'subcode',vs_subcode)
						rdw_label_vn.setitem(ll_row, 'text', ls_text )	
					end if
				end if
			Next
		End If
	End If
Next
if ls_originalFilter <> '?' then
	rdw_label_vn.setfilter(ls_originalFilter)
	rdw_label_vn.filter()
end if
destroy lds_dwo
Return 1

end function

public function integer f_add_windowobj_label (ref datawindow rdw_label_vn, string vs_w_name, string vs_subcode);//
int 					li_idx
String 				ls_code, ls_text
Long 					ll_find, ll_row
window 				lw_obj
windowobject 		lwo_window[]

lw_obj = create using vs_w_name
lwo_window =  lw_obj.control

For li_idx = 1 to upperbound(lwo_window)
	Choose Case lwo_window[li_idx].typeof()
		Case CommandButton!,PictureButton!,statictext!,groupbox!
			if lwo_window[li_idx].visible = true then
				ls_text = lwo_window[li_idx].dynamic f_gettext()				
				if isnull(ls_text) or ls_text ='' then continue			
				ls_code = vs_subcode+'.'+lwo_window[li_idx].classname()
				ll_find = t_w_mdi.ids_lang_text.Find("code = '"+ ls_code +"'", 1, t_w_mdi.ids_lang_text.RowCount())
				if ll_find = 0 then
					ll_row = rdw_label_vn.dynamic event e_addrow()
					rdw_label_vn.setitem(ll_row, 'lang',gs_user_lang)	
					rdw_label_vn.setitem(ll_row, 'code', vs_subcode+'.'+lwo_window[li_idx].classname())
					rdw_label_vn.setitem(ll_row, 'subcode',vs_subcode)
					rdw_label_vn.setitem(ll_row, 'text', ls_text )	
				end if
			end if
	End Choose
Next

Return 1

end function

on c_label.create
call super::create
end on

on c_label.destroy
call super::destroy
end on

event constructor;call super::constructor;
is_object_title = 'Dịch tên nhãn'
istr_actionpane[1].s_description = is_object_title

end event

event e_dw_e_postretrieve;call super::e_dw_e_postretrieve;
long 					ll_rowcount 

if rpo_dw.classname() = 'dw_1' then 
	if vl_rowcount = 0 then
		this.f_load_label( rpo_dw)
	end if
end if
return ll_rowcount
end event

