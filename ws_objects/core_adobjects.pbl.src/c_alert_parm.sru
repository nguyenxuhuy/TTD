$PBExportHeader$c_alert_parm.sru
forward
global type c_alert_parm from s_object_display
end type
end forward

global type c_alert_parm from s_object_display
end type
global c_alert_parm c_alert_parm

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
public function integer f_init_object (double vdb_id)
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_alert_parm_grid'
istr_dwo[1].s_dwo_form = 'd_alert_parm_form'
istr_dwo[1].s_dwo_grid = 'd_alert_parm_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_role_user_people_form;'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Khai báo tham số'

//istr_dwo[2].s_dwo_default =  'd_alert_parm_form'
//istr_dwo[2].s_dwo_form = 'd_alert_parm_form'
//istr_dwo[2].s_dwo_grid = ''
//istr_dwo[2].b_detail = true
//istr_dwo[2].s_dwo_master = 'd_alert_parm_grid;'
//istr_dwo[2].s_master_keycol = 'ID'
//istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID'
//istr_dwo[2].b_ref_table_yn  = true
//istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE'
//istr_dwo[2].b_insert = true
//istr_dwo[2].b_update = true
//istr_dwo[2].b_delete = true
//istr_dwo[2].b_query = true
//istr_dwo[2].b_print = true
//istr_dwo[2].b_excel = true
//istr_dwo[2].b_traceable = true
//istr_dwo[2].b_focus_master = true
//istr_dwo[2].s_description = 'Thông tin tham số'
end subroutine

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'

end subroutine

public function integer f_init_object (double vdb_id);/************************************************************************
Chức năng: Lấy dữ liệu của record đối tượng trong databse khi biết ID của một đối tượng
------------------------------------------------------------------------------
Tham số: vdb_id: ID của đối tượng
--------------------
Return (string): 1 Có dữ liệu đối tượng
				   : 0 không tìm thấy đối tượng
				   : -1 nếu bị lỗi
=================================================================*/



string			ls_sql, ls_sql_syntax, ls_err
long 			ll_row
t_ds_db		lds_datastore

//B1: Build sql lấy tên cột của bảng
ls_sql = "select column_name from ALL_TAB_COLUMNS where lower(table_name) = lower('"+ string(is_table)+"')"
ls_sql_syntax = sqlca.syntaxfromsql(ls_sql, "", ls_err)
if len(ls_err) > 0 then
	 //MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_err)
	 return -1
end if
//B2: Retrieve tên cột
lds_datastore = create t_ds_db
lds_datastore.create( ls_sql_syntax, ls_err)
if len(ls_err) > 0 then
	 MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_err)
	 destroy lds_datastore
	 return -1
end if
lds_datastore.f_settransobject( SQLCA)
lds_datastore.retrieve( )
ls_sql = 'select '
//B3: Build sql retrieve record của đối tượng
for ll_row = 1 to lds_datastore.rowcount()
	if ll_row = lds_datastore.rowcount() then
		ls_sql = ls_sql + lds_datastore.getitemstring(ll_row,'column_name')
	else
		ls_sql = ls_sql + lds_datastore.getitemstring(ll_row,'column_name')+','
	end if
next
ls_sql += ' from '+string(is_table) + ' where nvl('+string(vdb_id)+',0) = 0 or id = '+string(vdb_id)
ls_sql_syntax = sqlca.syntaxfromsql(ls_sql, "", ls_err)
if len(ls_err) > 0 then
	 MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_err)
	 return -1
end if
//B4: Retrieve record
if not isvalid(ids_attribute) then
	ids_attribute = create t_ds_db
end if
ids_attribute.create( ls_sql_syntax, ls_err)
if len(ls_err) > 0 then
	 MessageBox("Caution",  "SyntaxFromSQL caused these errors: " + ls_err)
	 destroy ids_attribute
	 return -1
end if

ids_attribute.f_settransobject( SQLCA)
ids_attribute.retrieve( )
if ids_attribute.rowcount( ) =0 then
	//MessageBox("Caution",  "s_object.f_init_object: Return 0 row" + ls_err)
	return 0
end if
return 1

end function

event constructor;call super::constructor;is_table = 'ALERT_PARM'
ib_changed_dwo_4edit = true
is_display_model = '1d'
ib_display_text = false
is_object_title = 'Tham số alert'

istr_actionpane[1].s_description = is_object_title

end event

on c_alert_parm.create
call super::create
end on

on c_alert_parm.destroy
call super::destroy
end on

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;datawindow	ldw_main,ldw_detail[]

if rpo_dw.dataobject = 'd_staff_form' then
	ldw_main = iw_display.dynamic f_get_dwmain()
	ldw_main.dynamic f_getdwdetails(ldw_detail)
	ldw_detail[1].dynamic event e_addrow()
end if
return 0
end event

