$PBExportHeader$c_appli_deligate.sru
forward
global type c_appli_deligate from s_object_display
end type
end forward

global type c_appli_deligate from s_object_display
end type
global c_appli_deligate c_appli_deligate

forward prototypes
public subroutine f_set_dwo_window ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_appli_deligate_grid'
istr_dwo[1].s_dwo_form = 'd_appli_deligate_form'
istr_dwo[1].s_dwo_grid = 'd_appli_deligate_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = false
istr_dwo[1].b_excel = false
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Ủy quyền record của'


end subroutine

on c_appli_deligate.create
call super::create
end on

on c_appli_deligate.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'APPLICABLE_RULE_HDR'
ib_changed_dwo_4edit = true
is_display_model = '1d'
ib_display_text = true
is_object_title = 'Ủy quyền record'

istr_actionpane[1].s_description = is_object_title
end event

event e_window_e_postopen;call super::e_window_e_postopen;	//--gán text cho form ủy quyền record--//
	window 			lw_parent
	powerobject	lc_object_handle_parent
	s_str_dwo		ls_str_dwo[]
	long				ll_idx
	string 			ls_dwo,ls_dwo_name
	
	ls_dwo = iw_display.dynamic f_get_rightcliked_objname()
	ls_dwo = mid(ls_dwo,1,len(ls_dwo)-5)
	ls_dwo_name = t_w_mdi.ids_lang_text.f_get_lang_text( ls_dwo )
	if ls_dwo_name = '' then
		lw_parent = iw_display.dynamic f_getparentwindow()
		lc_object_handle_parent = lw_parent.dynamic f_get_obj_handling()
		lc_object_handle_parent.dynamic f_get_dwo(ls_str_dwo[])
		for ll_idx = 1 to upperbound(ls_str_dwo[])
			if ls_str_dwo[ll_idx].s_dwo_default = iw_display.dynamic f_get_rightcliked_objname() then
				iw_display.dynamic f_set_st_1_text(istr_dwo[1].s_description ,ls_str_dwo[ll_idx].s_description)
			end if
		next
	else
		iw_display.dynamic f_set_st_1_text(istr_dwo[1].s_description ,ls_dwo_name)
	end if
return 1
end event

event e_action_ctrl_e_postmodifyrow;datawindow				ldw_focus
int								li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	//-- control d_action_edit --//
	FOR li_idx = 1 to upperbound(istr_actionpane[]) 
		if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
			if ldw_focus.dynamic f_get_ib_shared() then
				ldw_focus = ldw_focus.dynamic f_getdwmaster()
			end if			
			if ldw_focus.dynamic f_get_ib_detail() then
				if ib_changed_dwo_4edit then
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify; b_saveclose;b_refresh;b_delete;'
						istr_actionpane[li_idx].s_enabled_buttons = 'b_add;b_insert;b_saveclose;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_saveclose;b_refresh;b_delete;'
						istr_actionpane[li_idx].s_enabled_buttons = 'b_add;b_saveclose;b_refresh;b_delete;'						
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_save; b_refresh;b_delete;'
						istr_actionpane[li_idx].s_enabled_buttons = 'b_add;b_insert;b_save;b_refresh;b_delete;'	
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_save; b_refresh;b_delete;'
						istr_actionpane[li_idx].s_enabled_buttons = 'b_add;b_save;b_refresh;b_delete;'							
					end if
				end if
			else				
				if  ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_insert;b_modify;b_saveclose;b_refresh;b_delete;'
					istr_actionpane[li_idx].s_enabled_buttons='b_insert;b_saveclose;b_refresh;b_delete;'		
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_save;b_refresh;b_delete;'
					istr_actionpane[li_idx].s_enabled_buttons='b_save;b_refresh;b_delete;'							
				end if
			end if
		elseif istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then
			
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_action_ctrl_retrieveend;datawindow				ldw_focus
int							li_idx
string						ls_case

ldw_focus = iw_display.dynamic f_get_idwfocus()


if isvalid(ldw_focus) then
	//-- control d_action_edit --//
	FOR li_idx = 1 to upperbound(istr_actionpane[]) 
		if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
			if ldw_focus.dynamic f_get_ib_shared() then
				ldw_focus = ldw_focus.dynamic f_getdwmaster()
			end if
			if ldw_focus.dynamic f_get_ib_detail() then
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_modify;b_saveclose;b_query;b_filteron;b_refresh;b_delete;'
					istr_actionpane[li_idx].s_enabled_buttons='b_modify;b_query;b_filteron;b_refresh;b_delete;'							
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_insert;b_modify;b_save;b_query;b_execquery;b_filteron;b_refresh;b_delete;'
					istr_actionpane[li_idx].s_enabled_buttons='b_add;b_insert;b_modify;b_query;b_execquery;b_filteron;b_refresh;b_delete;'							
				end if
			else
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_saveclose;b_query;b_filteron;b_refresh;b_delete;'
					istr_actionpane[li_idx].s_enabled_buttons='b_add;b_modify;b_query;b_filteron;b_refresh;b_delete;'										
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_save;b_query;b_execquery;b_filteron;b_refresh;b_delete;'
					istr_actionpane[li_idx].s_enabled_buttons='b_add;b_modify;b_query;b_execquery;b_filteron;b_refresh;b_delete;'														
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_transaction' then	
		end if		
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_dw_e_presave;call super::e_dw_e_presave;string			ls_deligate_id_string


ls_deligate_id_string = rpo_dw.getitemstring(rpo_dw.getrow(),'deligate_id_string') 
if lastpos(ls_deligate_id_string,';') < len(ls_deligate_id_string) and pos(ls_deligate_id_string,';') > 1 then
	ls_deligate_id_string = ';' + ls_deligate_id_string+';'
	rpo_dw.setitem(rpo_dw.getrow(),'deligate_id_string',ls_deligate_id_string)
end if
return 1
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;string					ls_deligate_ids[],ls_object,ls_delegate_codes[],ls_delegate_code,ls_name,ls_text,ls_colname
double				ldb_cur_rule_id,ldb_rule_id_of_deligates[]
b_rule				lb_rule
int						li_idx,li_idx2
c_string				lc_string
b_rule				lc_rule

ls_colname = vs_colname
ldb_cur_rule_id = rpo_dw.getitemnumber(vl_currentrow,'OBJECT_REF_ID')
ls_name = rpo_dw.getitemstring(vl_currentrow,'name')
ls_object = iw_display.dynamic f_get_rightcliked_objname()
ls_object = mid(ls_object,1,len(ls_object)-5)
lc_string.f_stringtoarray( vs_editdata, ';', ls_delegate_codes)
lc_rule.is_table = 'ROLE_USER'
for li_idx = 1 to upperbound(ls_delegate_codes)
	if lb_rule.f_get_appli_rule_id( ldb_rule_id_of_deligates, lc_rule.f_get_id( ls_delegate_codes[li_idx]), ls_object,'record') > 0 then
		for li_idx2 = 1 to upperbound(ldb_rule_id_of_deligates)
			if ldb_rule_id_of_deligates[li_idx2] = ldb_cur_rule_id then 
				ls_delegate_code += ls_delegate_codes[li_idx] + ';'
				exit
			end if
		next
	else
		//--user đc ủy quyền đang full quyền trên object này--//
		ls_text = t_w_mdi.ids_lang_text.f_get_lang_text( ls_object)
		ls_delegate_code = ls_delegate_codes[li_idx]
		rpo_dw.dynamic f_set_ib_dataerror(true)
		gf_messagebox('m.c_appli_deligate.e_dw_e_itemchanged.01','Thông báo','user @'+ls_delegate_code+' đang toàn quyền trên @'+ls_text,'exclamation','ok',1)
		return 1
	end if
next
if ls_delegate_code <> '' then
	gf_messagebox('m.c_appli_deligate.e_dw_e_itemchanged.02','Thông báo','user đã có quyền @'+ls_name+' @: '+ls_delegate_code,'exclamation','ok',1)
	return 1
end if
return 0
end event

event e_dw_e_preretrieve;call super::e_dw_e_preretrieve;string					ls_dwo,ls_columns,ls_rule_id
double				ldb_rule_id[]
int						li_idx
window				lw_parent
datawindow		ldw_focus
any					la_arg[]


ls_dwo = iw_display.dynamic f_get_rightcliked_objname()
ls_dwo = mid(ls_dwo,1,len(ls_dwo)-5)
la_arg[1] = '='+ls_dwo
ls_columns = 'dwo'
if gi_userid <> 0 then
	ls_columns += ';object_ref_id'
	lw_parent = iw_display.dynamic f_getparentwindow()  
	ldw_focus = lw_parent.dynamic f_get_idwfocus()
	for li_idx = 1 to ldw_focus.dynamic f_get_rule_id_rec(ldb_rule_id)
		ls_rule_id += string(ldb_rule_id[li_idx])+';'
	next
	la_arg[2] = '('+mid(ls_rule_id,1,len(ls_rule_id)-1)+')'
end if	
rpo_dw.dynamic f_add_where(ls_columns,la_arg)
return 0
end event

