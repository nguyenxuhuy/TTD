$PBExportHeader$c_sales_plan.sru
forward
global type c_sales_plan from s_object_display
end type
end forward

global type c_sales_plan from s_object_display
end type
global c_sales_plan c_sales_plan

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_sales_plan_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_sales_plan_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = true
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Nhập danh số'
end subroutine

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'

end subroutine

on c_sales_plan.create
call super::create
end on

on c_sales_plan.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = false
is_display_model = '1d'
is_object_title = 'Doanh số kế hoạch'
istr_actionpane[1].s_description = is_object_title

end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;string 			ls_object_code,ls_branch_code
double		ldb_id,ldb_object_branch


if pos(rpo_dw.dataobject,'d_sales_plan') > 0 then
	select obj.id,obj.name,ru.default_branch,lge.code into :ldb_id,:ls_object_code,:ldb_object_branch,:ls_branch_code
    from role_user ru
    LEFT join object obj on obj.id=ru.object_staff
    LEFT JOIN LEGAL_ENTITY lge ON lge.ID=ru.default_branch
    where ru.id= :gi_userid using sqlca;
	if sqlca.sqlcode=0 then
		rpo_dw.setitem(vl_currentrow,'object_ref_id',ldb_id)
		rpo_dw.setitem(vl_currentrow,'object_name', ls_object_code)
		rpo_dw.setitem(vl_currentrow,'object_branch',ldb_object_branch)
		rpo_dw.setitem(vl_currentrow,'branch_code', ls_branch_code)
	end if
	rpo_dw.setitem(vl_currentrow,'object_ref_table','OBJECT')
end if
return 0
end event

