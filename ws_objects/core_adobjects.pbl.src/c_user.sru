$PBExportHeader$c_user.sru
$PBExportComments$User class, kế thừa c_employee
forward
global type c_user from s_object_display
end type
end forward

global type c_user from s_object_display
end type
global c_user c_user

type variables
long 				il_old_id
end variables

forward prototypes
public subroutine f_set_dwo_window ()
public function string f_encrypt_pwd (string vs_password)
public function integer f_update_staff (long vl_id, long vl_object_ref_id, string vs_object_ref_table, string vs_dataobject)
public subroutine f_set_actionpane ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_role_user_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_role_user_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_shared = 'd_role_user_form;'
istr_dwo[1].s_dwo_details = 'd_role_user_staff_form;'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Người dùng'   

istr_dwo[2].s_dwo_default =  'd_role_user_form'
istr_dwo[2].s_dwo_form = 'd_role_user_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = false
istr_dwo[2].b_detail = false
istr_dwo[2].b_shared = true
istr_dwo[2].s_dwo_master = 'd_role_user_grid;'
istr_dwo[2].s_master_keycol = ''
istr_dwo[2].s_detail_keycol = ''
istr_dwo[2].b_ref_table_yn  = false
istr_dwo[2].s_ref_table_field = ''
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_focus_master = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_description = 'Thông tin người dùng'

istr_dwo[3].s_dwo_default =  'd_role_user_staff_form'
istr_dwo[3].s_dwo_form = 'd_role_user_staff_form'
istr_dwo[3].s_dwo_grid = ''
istr_dwo[3].b_master = false
istr_dwo[3].b_detail = true
istr_dwo[3].s_dwo_master = 'd_role_user_grid;'
istr_dwo[3].s_dwo_details = ''
istr_dwo[3].s_master_keycol = 'OBJECT_STAFF;'
istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[3].b_ref_table_yn  = false
istr_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[3].b_insert = false
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = false
istr_dwo[3].b_query = true
istr_dwo[3].b_print = false
istr_dwo[3].b_excel = true
istr_dwo[3].b_traceable = false
istr_dwo[3].b_focus_master = false
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].s_description = 'Nhân viên'

end subroutine

public function string f_encrypt_pwd (string vs_password);string ls_password

select encrypt(:vs_password) into :ls_password from dual using it_transaction ;
return ls_password
end function

public function integer f_update_staff (long vl_id, long vl_object_ref_id, string vs_object_ref_table, string vs_dataobject);t_ds_db					lds_staff,lds_temp
t_transaction			lt_transaction
long 						ll_id,ll_object_ref_id
int							li_rtn
any						laan_data[]
string						ls_object_ref_table

laan_data[1] = vl_id
iw_display.dynamic f_get_transaction(lt_transaction)
lds_staff = create t_ds_db
lds_staff.dataobject = vs_dataobject
lds_staff.settransobject(lt_transaction)
lds_staff.f_add_where( 'id', laan_data[])
li_rtn = lds_staff.retrieve( )
if li_rtn = -1 then 
	//--messager--//
	return -1
end if
if li_rtn > 0 then
	if il_old_id = 0 or isnull(il_old_id) then
		laan_data[1] = -1
	else
		laan_data[1] = il_old_id
	end if
	lds_staff.setitem( 1, 'object_ref_id', vl_object_ref_id)
	lds_staff.setitem( 1, 'object_ref_table', upper(vs_object_ref_table))
	lds_staff.update( )
	if lt_transaction.sqlcode = 0 then
		if laan_data[1] > 0 then
			setnull(vl_object_ref_id)
			setnull(vs_object_ref_table)
			lds_temp = create t_ds_db
			lds_temp.dataobject = vs_dataobject
			lds_temp.settransobject(lt_transaction)
			lds_temp.f_add_where( 'id', laan_data[])
			li_rtn = lds_temp.retrieve( )
			if li_rtn > 0 then
				lds_temp.setitem( 1, 'object_ref_id', vl_object_ref_id)
				lds_temp.setitem( 1, 'object_ref_table', upper(vs_object_ref_table))
				lds_temp.update( )
				if lt_transaction.sqlcode = -1 then return -1
			end if
		end if
	else
		return -1
	end if
else
	return 0
end if
destroy lds_staff
destroy lds_temp
return 1
end function

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'

end subroutine

event constructor;call super::constructor;is_table = 'ROLE_USER'
ib_changed_dwo_4edit = false
is_display_model = '1d_2d'
ib_display_text = false
is_object_title = 'Người dùng'

istr_actionpane[1].s_description = is_object_title
end event

on c_user.create
call super::create
end on

on c_user.destroy
call super::destroy
end on

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;string 		ls_password

if AncestorReturnValue = 1 then return 1
if pos( rpo_dw.dataobject , 'd_role_user_') > 0 then
	if vs_colname = 'password' then
		connect using it_transaction;
		ls_password = this.f_encrypt_pwd( vs_editdata)
		disconnect using it_transaction;
		rpo_dw.object.password.primary[vl_currentrow] = ls_password
		return 2
	end if
end if
return 0

end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;if rpo_dw.dataobject = 'd_role_user_grid' or rpo_dw.dataobject = 'd_role_user_form'   then
	rpo_dw.setitem(vl_currentrow,'type','user')
	rpo_dw.setitem(vl_currentrow,'company_id', gi_user_comp_id )
	rpo_dw.setitem(vl_currentrow,'branch_id', gdb_branch )	
	rpo_dw.setitem(vl_currentrow,'DEFAULT_COMP', gi_user_comp_id )	
	rpo_dw.setitem(vl_currentrow,'DEFAULT_BRANCH', gdb_branch )	
	rpo_dw.setitem(vl_currentrow,'active_yn', 'Y' )	
end if
return 0
end event

event e_dw_e_preretrieve;call super::e_dw_e_preretrieve;string					ls_dwo,ls_columns,ls_dataobject
window				lw_parent
powerobject		lc_object_handle_parent
any					la_arg[]

ls_dataobject = rpo_dw.dataobject
if mid(ls_dataobject,1,len(ls_dataobject)-5) = 'd_role_user' then
	ls_columns = 'lang'
	la_arg[1] = '=vi-vn'
	rpo_dw.dynamic f_add_where(ls_columns,la_arg)
end if
return 0
end event

event e_window_open;call super::e_window_open;datawindow		ldw_main
int						li_rtn
any					laa_data[]

laa_data[1] = '=user'
ldw_main = iw_display.dynamic f_get_dwmain()
li_rtn = ldw_main.dynamic f_add_where('type',laa_data)

if li_rtn = 1 then
	return 0
else
	return 1
end if
end event

event e_window_e_preopen;call super::e_window_e_preopen;//-- resize parm --//

iw_display.dynamic f_set_ii_upperpart_height(1200)
return 0
end event

event e_dw_e_save;call super::e_dw_e_save;
if rpo_dw.dataobject = 'd_role_user_staff_form' then
	return 0
else
	return 1
end if
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
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_delete;'
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

