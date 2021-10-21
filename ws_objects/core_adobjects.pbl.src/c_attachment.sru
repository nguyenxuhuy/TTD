$PBExportHeader$c_attachment.sru
forward
global type c_attachment from s_object_display
end type
end forward

global type c_attachment from s_object_display
event type integer e_action_load_file ( )
event type integer e_action_open_file ( )
event type integer e_action_link ( )
end type
global c_attachment c_attachment

type variables

private:
string		is_dwobject, is_object_ref_table , is_temp_file[]
int		ii_line_id
double	idb_object_ref_id

end variables

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
end prototypes

event type integer e_action_load_file();string 	ls_path_name, ls_file_name, ls_file_extension, ls_file_type, ls_curdir
long 		li_new
double	ldb_id
integer 	li_rtn, ll_pos
blob		lblb_document

t_dw_mpl		ldw_main



ls_curdir = GetCurrentDirectory()
li_rtn = GetFileOpenName("Select File", ls_path_name, ls_file_name)
If li_rtn < 1 Then return -1
ChangeDirectory(ls_curdir)

ll_pos = LastPos(ls_file_name,".")
If (ll_pos > 0) Then
	ls_file_extension = Mid(ls_file_name,ll_pos)
	RegistryGet("HKEY_CLASSES_ROOT\" + ls_file_extension,"Content Type",ls_file_type)
	If IsNull(ls_file_type) or Len(Trim(ls_file_type)) = 0 Then
		ls_file_type = Mid(ls_file_extension,2)
	End If
End If


li_rtn = gf_file2blob(ls_path_name, lblb_document)
If li_rtn = 1 Then
	connect using it_transaction;
	ldw_main = this.iw_display.f_get_dwmain( )
	ldw_main.settransobject(it_transaction)
	
	li_new = ldw_main.insertrow( 0)
	ldb_id = this.f_create_id_ex(it_transaction )
	ldw_main.SetItem(li_new, 'id', ldb_id)
	ldw_main.SetItem(li_new, 'object_ref_id', idb_object_ref_id)
	ldw_main.SetItem(li_new, 'object_ref_table', is_object_ref_table)
	ldw_main.SetItem(li_new, 'dwobject', is_dwobject)	
	ldw_main.SetItem(li_new, 'company_id', gi_user_comp_id)
	ldw_main.SetItem(li_new, 'branch_id', gdb_branch)
	ldw_main.SetItem(li_new, 'file_type', ls_file_type)
	ldw_main.SetItem(li_new, 'file_name', ls_file_name)
	
	if ldw_main.update(true, false ) = 1 then
		updateblob attachment set attach_doc = :lblb_document
			where ID = :ldb_id using it_transaction;
			
		if it_transaction.sqlcode = 0 then
			commit using it_transaction;
			ldw_main.resetupdate( )
			ldw_main.f_set_ib_editing(false)
		else
			rollback using it_transaction;			
			ldw_main.event e_retrieve( )
			ldw_main.f_set_ib_editing(false)
			disconnect using it_transaction;
			gf_messagebox('m.c_attachment.e_action_load_file.01','Thông báo','Lỗi update BLOB; line 41','stop','ok',1)
			return -1
		end if
	else
		disconnect using it_transaction;
		gf_messagebox('m.c_attachment.e_action_load_file.02','Thông báo','Lỗi update :@'+ it_transaction.sqlerrtext ,'stop','ok',1)
		return -1		
	end if
	disconnect using it_transaction;
else 
	gf_messagebox('m.c_attachment.e_action_load_file.03','Thông báo','Lỗi đoc file: line 26' ,'stop','ok',1)
	return -1			
End If

return 1
end event

event type integer e_action_open_file();string 	ls_path, ls_filename, ls_null, ls_msg
double	ldb_id
int			li_rt
blob		lblb_document
long		ll_rc

c_user_api		lnv_api
t_dw_mpl		ldw_main
n_runandwait	ln_runandwait

ldw_main = this.iw_display.f_get_dwmain( ) 

If ldw_main.RowCount() = 0 or ldw_main.GetRow() = 0 Then return 0

ls_filename = ldw_main.GetItemString(ldw_main.GetRow(),'file_name')
If IsNull(ls_filename) or Len(Trim(ls_filename)) = 0 Then Return 0
ls_path =  ldw_main.GetItemString(ldw_main.GetRow(),'note')
if ls_path = '' or isnull(ls_path) then

	ls_path = Space(lnv_api.MAX_PATH)
	lnv_api.GetTempPath(lnv_api.MAX_PATH,ls_path)
	If Right(ls_path,1) <> "\" Then ls_path += "\"
	ls_path += ls_filename
	
	ldb_id = ldw_main.GetItemNumber(ldw_main.GetRow(),'ID')
	If IsNull(ldb_id) or ldb_id = 0 Then Return 0
	connect using it_transaction;
	SelectBlob attach_doc into :lblb_document
		From attachment
			Where ID = :ldb_id using it_transaction;
	if it_transaction.sqlcode = 0 then
		li_rt = gf_blob2file(lblb_document,ls_path)		
		If li_rt <> 1 Then
			FileDelete(ls_path)
			disconnect  using it_transaction;
			gf_messagebox('m.c_attachment.e_action_open_file.01','Thông báo','Lỗi tạo file: line 28','stop','ok',1)
			Return -1
		End If
	
		SetNull(ls_null)
		ll_rc = ln_runandwait.of_ShellRun(ls_path, 'open', maximized!)
		is_temp_file[upperbound(is_temp_file) + 1] = ls_path
		// check return code
		CHOOSE CASE ll_rc
			CASE ln_runandwait.WAIT_COMPLETE
				ls_msg = "Đóng file"
			CASE ln_runandwait.WAIT_TIMEOUT
				ls_msg = "The process was terminated after 5 seconds!"
			CASE -1
				ls_msg = "The process was not created!"
			CASE ELSE
				ls_msg = "The process completed with return code: " + String(ll_rc)
		END CHOOSE
		gf_messagebox('m.c_attachment.e_action_open_file.02','Thông báo', ls_msg,'stop','ok',1)
	else
		disconnect  using it_transaction;
		gf_messagebox('m.c_attachment.e_action_open_file.02','Thông báo','Lỗi select SQL: line 24 ','stop','ok',1)
		Return -1	
	end if
	disconnect  using it_transaction;
else 
	SetNull(ls_null)
	if lnv_api.ShellExecute(Handle(this.iw_display ),ls_null ,ls_path, ls_null,ls_null,lnv_api.SW_SHOWNORMAL) < 32 then
		gf_messagebox('m.c_attachment.e_action_open_file.03','Thông báo','Lỗi mở file','stop','ok',1)
		Return -1			
	end if
end if


return 1
end event

event type integer e_action_link();string 	ls_path_name, ls_file_name, ls_file_extension, ls_file_type, ls_curdir
long 		li_new
double	ldb_id
integer 	li_rtn, ll_pos
blob		lblb_document

t_dw_mpl		ldw_main



ls_curdir = GetCurrentDirectory()
li_rtn = GetFileOpenName("Select File", ls_path_name, ls_file_name)
If li_rtn < 1 Then return -1
ChangeDirectory(ls_curdir)

ll_pos = LastPos(ls_file_name,".")
If (ll_pos > 0) Then
	ls_file_extension = Mid(ls_file_name,ll_pos)
	RegistryGet("HKEY_CLASSES_ROOT\" + ls_file_extension,"Content Type",ls_file_type)
	If IsNull(ls_file_type) or Len(Trim(ls_file_type)) = 0 Then
		ls_file_type = Mid(ls_file_extension,2)
	End If
End If


ldw_main = this.iw_display.f_get_dwmain( )
connect using it_transaction;
ldw_main.settransobject(it_transaction )

li_new = ldw_main.insertrow( 0)
ldb_id = this.f_create_id_ex( it_transaction)
ldw_main.SetItem(li_new, 'object_ref_id', idb_object_ref_id)
ldw_main.SetItem(li_new, 'object_ref_id', idb_object_ref_id)
ldw_main.SetItem(li_new, 'object_ref_table', is_object_ref_table)
ldw_main.SetItem(li_new, 'dwobject', is_dwobject)	
ldw_main.SetItem(li_new, 'company_id', gi_user_comp_id)
ldw_main.SetItem(li_new, 'branch_id', gdb_branch)
ldw_main.SetItem(li_new, 'file_type', ls_file_type)
ldw_main.SetItem(li_new, 'file_name', ls_file_name)
ldw_main.SetItem(li_new, 'note', ls_path_name)
if ldw_main.update(true, false ) = 1 then
		
	if it_transaction.sqlcode = 0 then
		commit using it_transaction;
		ldw_main.resetupdate( )
		ldw_main.f_set_ib_editing(false)
	else
		rollback using it_transaction;			
		ldw_main.event e_retrieve( )
		ldw_main.f_set_ib_editing(false)
		disconnect using it_transaction;
		gf_messagebox('m.c_attachment.e_action_load_file.01','Thông báo','Lỗi update BLOB; line 41','stop','ok',1)		
		return -1
	end if
else
	disconnect using it_transaction;
	gf_messagebox('m.c_attachment.e_action_load_file.02','Thông báo','Lỗi update :@'+ it_transaction.sqlerrtext ,'stop','ok',1)
	return -1		
end if
disconnect using it_transaction;

return 1
end event

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_attachment_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_attachment_grid'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Đính kèm'
end subroutine

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'

end subroutine

on c_attachment.create
call super::create
end on

on c_attachment.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'ATTACHMENT'
ib_changed_dwo_4edit = false
is_display_model = '1d'
ib_display_text = false
is_object_title = 'Chứng từ đính kèm'

istr_actionpane[1].s_description = is_object_title
istr_actionpane[1].s_button_name = 'b_modify;b_save;b_filteron;b_refresh;b_delete;b_load_file;b_link;b_open_file;b_close'
end event

event e_action_ctrl_bttn;t_dw_mpl				ldw_focus
int							li_idx

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
				if  ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;'
				else
					istr_actionpane[li_idx].s_visible_buttons='b_modify;b_filteron;b_delete;b_blank;b_load_file;b_link;b_open_file;b_refresh;b_close;'
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then
			 istr_actionpane[li_idx].s_visible_buttons = 'b_user_trace;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
			
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_e_postopen_child;call super::e_window_e_postopen_child;
any					laa_data[]
t_dw_mpl			ldw_focus, ldw_main
c_string				lc_string

ldw_focus = this.iw_display.iw_parent.dynamic f_get_idwfocus()
ldw_main = iw_display.dynamic f_get_dwmain()

is_object_ref_table= upper(ldw_focus.describe( "datawindow.table.UpdateTable"))
is_dwobject = ldw_focus.dataobject
if right(is_dwobject,5) = '_form' then 
	is_dwobject = lc_string.f_globalreplace( is_dwobject, '_form', '_grid')
end if

idb_object_ref_id = ldw_focus.getitemnumber( ldw_focus.getrow( ) , 'ID')
laa_data[1] = idb_object_ref_id
laa_data[2] = is_object_ref_table
laa_data[3] = is_dwobject
return ldw_main.dynamic f_add_where('object_ref_id;object_ref_table;dwobject',laa_data[])

end event

event destructor;call super::destructor;int li_cnt

For li_cnt = 1 to Upperbound(is_temp_file)
	FileDelete(is_temp_file[li_cnt])
Next
end event

event e_dw_updatestart;call super::e_dw_updatestart;if rdw_requester.dataobject = istr_dwo[1].s_dwo_default then
	this.f_update_line_no( rdw_requester, 1, 'line_no')
end if
return 1
end event

