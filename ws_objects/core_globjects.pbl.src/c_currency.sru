$PBExportHeader$c_currency.sru
forward
global type c_currency from s_object_display
end type
end forward

global type c_currency from s_object_display
end type
global c_currency c_currency

type variables
double				idb_class_id
end variables

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_related ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_currency_grid'
istr_dwo[1].s_dwo_form = 'd_currency_form'
istr_dwo[1].s_dwo_grid = 'd_currency_grid'
istr_dwo[1].b_master = false
istr_dwo[1].b_cascade_del = false
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Tiền tệ'
end subroutine

public subroutine f_set_actionpane ();istr_actionpane[2].s_button_name =  'b_foreign_currency;b_unit_class;'
istr_actionpane[2].s_visible_buttons = 'b_foreign_currency;b_unit_class;'
istr_actionpane[2].s_enabled_buttons = 'b_foreign_currency;b_unit_class;'

istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'

end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_foreign_currency'
istr_dwo_related[1].s_main_obj_dwo = 'd_currency_grid'
istr_dwo_related[1].s_main_obj_column = 'id'
istr_dwo_related[1].s_related_obj_dwo = 'd_foreign_currency_grid'
istr_dwo_related[1].s_related_obj_column = 'id'
istr_dwo_related[1].s_relatedtext_column = 'code;name'
istr_dwo_related[1].s_text = 'Tỷ giá của:'

istr_dwo_related[2].s_related_obj_name = 'u_unit_class'
istr_dwo_related[2].s_main_obj_dwo = 'd_currency_grid'
istr_dwo_related[2].s_main_obj_column = 'class_id'
istr_dwo_related[2].s_related_obj_dwo = 'd_unit_class_grid'
istr_dwo_related[2].s_related_obj_column = 'id'
istr_dwo_related[2].s_relatedtext_column = 'code;name'
istr_dwo_related[2].s_text = 'Lớp đơn vị của:'
end subroutine

on c_currency.create
call super::create
end on

on c_currency.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'UOM'
ib_changed_dwo_4edit = false
is_display_model = '1d'
ib_display_text = false
is_object_title = 'Tiền tệ'

istr_actionpane[1].s_description = is_object_title
setnull(idb_class_id)
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;int					li_idx
string				ls_unit_code,ls_unit_name

if AncestorReturnValue = 1 then return 1
if vs_colname = 'base_yn' then
	if vs_editdata = 'Y' then
		for li_idx = 1 to rpo_dw.rowcount()
			if rpo_dw.getitemstring(li_idx,vs_colname) = 'Y' then
				ls_unit_code = rpo_dw.getitemstring(li_idx,'code')
				ls_unit_name = rpo_dw.getitemstring(li_idx,'name')
				gf_messagebox('m.c_uom.e_dw_e_itemchanged.01','Thông báo','Đã có đồng tiền hạch toán là @'+ls_unit_code+' - @'+ls_unit_name,'exclamation','ok',1)
				return 1
			end if
		next
	else
		//--vs_editdata = 'N'--//
	end if
end if
return 0
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;if not isnull(idb_class_id) then
	rpo_dw.setitem(vl_currentrow,'multiple',1)
	rpo_dw.setitem(vl_currentrow,'class_id',idb_class_id)
	setnull(idb_class_id)
end if
return 0
end event

event e_dw_updatestart;call super::e_dw_updatestart;/***********************************
kiểm tra đồng tiền hạch toán trước khi save
return -1 lỗi
***********************************/
long				ll_find,ll_count
double			ldb_class_id

if AncestorReturnValue = -1 then return -1
if rdw_requester.rowcount() = 0 then return 0
ll_find = rdw_requester.find("base_yn = 'Y'",1,rdw_requester.rowcount())
if ll_find > 0 then
	return 0
elseif ll_find = 0 then
	gf_messagebox('m.c_currency.e_dw_updatestart.01','Thông báo','Chưa có đồng tiền hạch toán','exclamation','ok',1)
	return -1
else
	messagebox('Lỗi','c_currency.e_dw_updatestart(line:19)')
	return -1
end if
return 0
end event

event e_dw_e_preinsertrow;call super::e_dw_e_preinsertrow;double				ldb_class_id

select UNIT_CLASS.ID into :ldb_class_id from UNIT_CLASS where UNIT_CLASS.CURRENCY_YN = 'Y' using it_transaction;
if it_transaction.sqlcode = 0 then
	idb_class_id = ldb_class_id
elseif it_transaction.sqlcode = 100 then
	gf_messagebox('m.c_currency.e_dw_e_preinsertrow.01','Thông báo','Chưa có lớp đơn vị cho tiền tệ','exclamation','ok',1)
	return -1
else 
	//--nhiều hơn 1 lớp đơn vị tiền tệ, xem lại ràng buộc itemchanged của object c_unit_class--//
	messagebox('Lỗi','c_currency.e_dw_e_preinsertrow(line:11)')
	return -1
end if
return 0
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
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_saveclose;b_refresh;b_delete;'
					istr_actionpane[li_idx].s_enabled_buttons='b_saveclose;b_refresh;b_delete;'		
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_save;b_refresh;b_delete;'
					istr_actionpane[li_idx].s_enabled_buttons='b_add;b_save;b_refresh;b_delete;'							
				end if
			end if
		elseif istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then
			
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_action_ctrl_bttn;call super::e_action_ctrl_bttn;//-- override --//

datawindow				ldw_focus
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
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify; b_filteron;b_query;b_refresh;b_delete;'
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
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;'
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;'
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
			istr_actionpane[li_idx].s_visible_buttons =  'b_foreign_currency;b_unit_class;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
			istr_actionpane[li_idx].s_visible_buttons =  'b_book; b_attach; b_note;b_doc_trace;b_user_trace;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then				
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

