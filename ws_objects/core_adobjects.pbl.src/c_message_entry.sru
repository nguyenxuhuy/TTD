$PBExportHeader$c_message_entry.sru
forward
global type c_message_entry from s_object_display
end type
end forward

global type c_message_entry from s_object_display
end type
global c_message_entry c_message_entry

forward prototypes
public function long f_insert_messsage (string vs_objectsyntax)
public subroutine f_set_dwo_window ()
end prototypes

public function long f_insert_messsage (string vs_objectsyntax);/*****************************************************
gf_messagebox(msg_id, title,message,icon,button,defualt)
message: Co the la 1 trong cac dang sau:
			  - "text", 'text'
			  - "text@"+ tên biến
			  - "text@" + biến + " @text"
			  - "text@" + biến +";" + biến + " @text"
------------------------------------------------------------------------------------*/
c_string			lc_obj_service
T_dw_mpl		ldw_message, ldw_msg_label
long				ll_func_pos, ll_row, ll_msg_pos, ll_rowCnt, ll_row_label
string				ls_msg_id, ls_title, ls_message, ls_icon, ls_button,ls_object, ls_event_func_name
int					li_default_bttn


ldw_message = iw_display.f_get_dwmain()
ldw_message.event e_retrieve( )
ldw_msg_label = iw_display.f_get_dw('d_message_label_grid')
ldw_message.setredraw( false)
ldw_msg_label.setredraw( false)

ll_func_pos = pos(lower(vs_objectsyntax), 'gf_messagebox')
do while ll_func_pos > 0 
	//-- lay msgID --//
	vs_objectsyntax = mid(vs_objectsyntax, ll_func_pos + len('gf_messagebox') )
	ls_msg_id = mid(vs_objectsyntax, pos(vs_objectsyntax,'(')+1, pos(vs_objectsyntax, ',') - pos(vs_objectsyntax,'(') -1 )
	vs_objectsyntax = mid(vs_objectsyntax, pos(vs_objectsyntax, ',') +1 )
	
	ls_msg_id = lc_obj_service.f_globalreplace( ls_msg_id, "'", "")
	ls_msg_id = lc_obj_service.f_globalreplace( ls_msg_id, '"', "")
	if lc_obj_service.f_countoccurrences(ls_msg_id , '.') <> 3 then
		goto cont
	end if
	
	//-- Kiem tra msgID da co chua --//
	ll_row = ldw_message.find( "code = '"+ ls_msg_id +"'", 1, ldw_message.rowcount())
	if ll_row = 0 then
		
		//-- lay title --//
		ls_title = mid(vs_objectsyntax, 1, pos(vs_objectsyntax, ',') - 1 )
		vs_objectsyntax = mid(vs_objectsyntax, pos(vs_objectsyntax, ',') +1 )
		ls_title = lc_obj_service.f_globalreplace( ls_title, "'", "")
		ls_title = lc_obj_service.f_globalreplace( ls_title, '"', "")	
		
		//-- lay message --//
		ls_message = mid(vs_objectsyntax, 1, pos(vs_objectsyntax, ',') - 1 )
		vs_objectsyntax = mid(vs_objectsyntax, pos(vs_objectsyntax, ',') +1 )			
		//-- kiem tra trường hợp message có chứa dấu "@" --//
		ll_msg_pos = pos(ls_message, "@") 
		if ll_msg_pos > 0 then
			if pos(ls_message, "@", ll_msg_pos +1) = 0 then
				ls_message =  mid(ls_message,1, pos(ls_message, '@'))
			else
				ll_msg_pos = pos(ls_message, "@", ll_msg_pos +1)
				ls_message = mid(ls_message,1 , pos(ls_message, '@') -1 ) + mid(ls_message, ll_msg_pos )
			end if
		end if
		ls_message = lc_obj_service.f_globalreplace( ls_message, "'", "")
		ls_message = lc_obj_service.f_globalreplace( ls_message, '"', "")
		
		//-- lay icon --//
		ls_icon = mid(vs_objectsyntax, 1, pos(vs_objectsyntax, ',') - 1 )
		vs_objectsyntax = mid(vs_objectsyntax, pos(vs_objectsyntax, ',') +1 )				
		ls_icon = lc_obj_service.f_globalreplace( ls_icon, "'", "")
		ls_icon = lc_obj_service.f_globalreplace( ls_icon, '"', "")		
		if len(ls_icon)>12 then
			goto cont
		end if
		
		//-- lay button --//
		ls_button = mid(vs_objectsyntax, 1, pos(vs_objectsyntax, ',') - 1 )
		vs_objectsyntax = mid(vs_objectsyntax, pos(vs_objectsyntax, ',') +1 )				
		ls_button = lc_obj_service.f_globalreplace( ls_button, "'", "")
		ls_button = lc_obj_service.f_globalreplace( ls_button, '"', "")	
		
		//-- lay default button --//
		li_default_bttn = integer(trim(mid(vs_objectsyntax, 1, pos(vs_objectsyntax, ')') - 1 )))
		vs_objectsyntax = mid(vs_objectsyntax, pos(vs_objectsyntax, ')') +1 )		
		
		//-- tach object va event/func name --//
		ls_object = mid(ls_msg_id,3)
		ls_object = mid(ls_object,1, pos(ls_object,'.') - 1)
		ll_msg_pos = lastpos(ls_msg_id,'.')
		ls_event_func_name = left(ls_msg_id, ll_msg_pos -1)
		ls_event_func_name = right(ls_event_func_name, len(ls_event_func_name) - lastpos(ls_event_func_name,'.'))	
		//-- insert vao dw --//
		ll_rowCnt++
		ll_row = ldw_message.event e_addrow()
		ldw_message.setitem( ll_row, 'code',ls_msg_id)
		ldw_message.setitem( ll_row, 'button',ls_button)
		ldw_message.setitem( ll_row, 'icon',ls_icon)
		ldw_message.setitem( ll_row, 'default_bttn',li_default_bttn)
		ldw_message.setitem( ll_row, 'OBJ_NAME',ls_object)
		ldw_message.setitem( ll_row, 'EVENT_FUNC_NAME',ls_event_func_name)
		if ldw_message.update(true, false ) = 1 then ldw_message.resetupdate( )
		
		ll_row_label = ldw_msg_label.event e_addrow()
		ldw_msg_label.setitem( ll_row_label, 'text', ls_message)
		ldw_msg_label.setitem( ll_row_label, 'ttdhelp', ls_title)
		ldw_msg_label.setitem( ll_row_label, 'lang', gs_user_lang)
		ldw_msg_label.setitem( ll_row_label, 'subcode', 'MESSAGE.TEXT')
		//-- insert
		ll_row_label = ldw_msg_label.event e_addrow()
		ldw_msg_label.setitem( ll_row_label, 'text', ls_button)
		ldw_msg_label.setitem( ll_row_label, 'ttdhelp', ls_button)
		ldw_msg_label.setitem( ll_row_label, 'lang', gs_user_lang)
		ldw_msg_label.setitem( ll_row_label, 'subcode', 'MESSAGE.BUTTON')
		if ldw_msg_label.update(true, false ) = 1 then ldw_msg_label.resetupdate( )
		
		
	end if
	
	cont:
	ll_func_pos = pos(vs_objectsyntax, 'gf_messagebox')
loop
ldw_message.setredraw( true)
ldw_msg_label.setredraw( true)

return ll_rowCnt
end function

public subroutine f_set_dwo_window ();
istr_dwo[1].s_dwo_default = 'd_message_entry_grid' 
istr_dwo[1].s_dwo_form = 'd_message_entry_form'
istr_dwo[1].s_dwo_grid = 'd_message_entry_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_message_label_grid'
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = false
istr_dwo[1].b_excel = false
istr_dwo[1].s_description = 'Thông báo'

istr_dwo[2].s_dwo_default = 'd_message_label_grid'
istr_dwo[2].s_dwo_form = 'd_message_label_form'
istr_dwo[2].s_dwo_grid = 'd_message_label_grid'
istr_dwo[2].b_detail = true
istr_dwo[2].s_dwo_master = 'd_message_entry_form'
istr_dwo[2].s_master_keycol = 'code'
istr_dwo[2].s_detail_keycol = 'code'
istr_dwo[2].b_ref_table_yn  = FALSE
istr_dwo[2].s_ref_table_field = ''
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].s_description = 'Nội dung thông báo'

end subroutine

on c_message_entry.create
call super::create
end on

on c_message_entry.destroy
call super::destroy
end on

event constructor;call super::constructor;
is_table = 'MESSAGE'
ib_changed_dwo_4edit = false
is_display_model = '2ddlb_2d'
is_object_title = 'Đăng ký thông báo'
istr_actionpane[1].s_description = is_object_title


end event

event e_window_e_preopen;call super::e_window_e_preopen;dropdownlistbox	lddlb_lib
string 				ls_list_library, ls_library_name
int						ll_index
long					ll_count


ls_list_library = getlibrarylist()
if isnull(ls_list_library) or trim(ls_list_library) = '' then return 0
ll_index = 0 
ll_count = pos(ls_list_library, ',')
lddlb_lib = iw_display.dynamic f_get_ddlb1()
if isvalid(lddlb_lib) then
	do while ll_count > 0 
		ls_library_name = mid(ls_list_library, 1, ll_count - 1)
		ls_list_library = mid(ls_list_library, ll_count + 1)
		lddlb_lib.additem( ls_library_name)
		ll_count =  pos(ls_list_library, ',')
		if ll_count = 0 and len(trim(ls_list_library)) > 0 then 
			lddlb_lib.additem( ls_list_library)
		end if 	
	loop
end if
return 1
end event

event e_ddlb_selectionchanged;call super::e_ddlb_selectionchanged;
dropdownlistbox			lddlb_2, lddlb_1
datastore					lds_object_syntax, ds_message_entry
t_dw_mpl					ldw_message
c_sql							lc_sql
String 						ls_entries, ls_where, ls_modify, ls_currentSQL_nowhere, ls_currentWhere, ls_rtn
string 						ls_lib_name, ls_object_name, ls_objSyn
long 							ll_row, li_pos

if rddlb_handling.classname() = 'ddlb_1' then
	li_pos = LastPos(rddlb_handling.text,'\')
	ls_lib_name = Mid(rddlb_handling.text,li_pos + 1)
	
	ls_entries = LibraryDirectory( ls_lib_name, DirWindow! )
	lds_object_syntax = create datastore
	lds_object_syntax.dataobject = 'ds_object_syntax'
	lds_object_syntax.Reset( )
	lds_object_syntax.ImportString(ls_Entries)
	
	lddlb_2 = iw_display.dynamic f_get_ddlb2()
	lddlb_2.reset( )
	for ll_row = 1 to lds_object_syntax.rowcount()
		lddlb_2.additem(lds_object_syntax.getitemstring(ll_row, 'object_name') )	
	next 
	
	ls_entries = LibraryDirectory( ls_lib_name, DirUserObject! )
	
	lds_object_syntax.Reset( )
	lds_object_syntax.ImportString(ls_Entries)
	
	for ll_row = 1 to lds_object_syntax.rowcount()
		lddlb_2.additem(lds_object_syntax.getitemstring(ll_row, 'object_name') )	
	next 
	destroy lds_object_syntax
else
	//-- gán sql where và retrieve message data tu database --//
	ldw_message = iw_display.f_get_dwmain()
	if ldw_message.dynamic f_getcurrentsql( ls_currentSQL_nowhere, ls_currentWhere) = 1 then
		ls_object_name = rddlb_handling.text
		ls_where = " obj_name =~~'" + ls_object_name +"~~'"
		lc_sql.f_addtowhereclause( ls_currentSQL_nowhere, ls_where, " AND ")
		ls_modify = "Datawindow.Table.Select= '" + ls_currentSQL_nowhere +"'"
		ls_rtn =ldw_message.modify(ls_modify )
		if ls_rtn <> '' then
			gf_messagebox('m.c_message_entry.e_ddlb_selectionchanged.01','ERROR','Loi modify SQL syntax','stop','ok',1)
			return -1
		end if
		ldw_message.event e_retrieve()
	end if
	//-- lay message tu source code dua vao datastore: chi lay nhung messageID nao chua co --//
	lddlb_1 = iw_display.dynamic f_get_ddlb1()
	ls_lib_name = lddlb_1.text
	if mid(ls_object_name, 2, 3) = '_w_' then 
		ls_objSyn = LibraryExport(ls_lib_name, ls_object_name, ExportWindow! )
	else
		ls_objSyn = LibraryExport(ls_lib_name, ls_object_name, ExportUserObject! )
	end if
	ll_row = this.f_insert_messsage( ls_objSyn)
	//-- luu vao dw message va save vao database --//
	if ll_row > 0 then 
		if iw_display.event e_save() <> -1 then
			iw_display.event e_refresh()
		else
			return -1
		end if
	end if
end if
return 1
end event

event e_action_ctrl_bttn;datawindow				ldw_focus
int								li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	if not this.ib_copying then
		//-- control d_action_edit --//
		FOR li_idx = 1 to upperbound(istr_actionpane[]) 
			if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
				if ldw_focus.dynamic f_get_ib_shared() then
					ldw_focus = ldw_focus.dynamic f_getdwmaster()
				end if			
				if ldw_focus.dynamic f_get_ib_detail() then
					if ib_changed_dwo_4edit then
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_filteron;b_query;b_refresh;b_delete;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query; b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query; b_refresh;b_delete;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
				istr_actionpane[li_idx].s_visible_buttons =  'b_book; b_attach; b_note;b_doc_trace_on;b_user_trace;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
				
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

