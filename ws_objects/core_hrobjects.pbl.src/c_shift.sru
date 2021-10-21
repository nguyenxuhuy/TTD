$PBExportHeader$c_shift.sru
forward
global type c_shift from s_object_display
end type
end forward

global type c_shift from s_object_display
end type
global c_shift c_shift

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_related ()
public function integer f_calc_workcount (datetime vdt_f_time, datetime vdt_t_time, integer vi_break_minute, ref double rdb_work_hours, ref double rdb_work_count)
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_shift_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_shift_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_shift_line_grid;'
istr_dwo[1].b_ref_table_yn  = false
istr_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].b_traceable = true
istr_dwo[1].s_description = 'Ca làm việc'
istr_dwo[1].s_gb_name = ''


istr_dwo[2].s_dwo_default =  'd_shift_line_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_shift_line_grid'
istr_dwo[2].b_detail = true
istr_dwo[2].b_master = false
istr_dwo[2].s_dwo_master = 'd_shift_grid;'
istr_dwo[2].s_dwo_details = ';'
istr_dwo[2].b_relation_1_1 = false
istr_dwo[2].s_master_keycol = 'ID'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[2].b_ref_table_yn  = true
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].b_focus_master = false
istr_dwo[2].s_description = 'Giờ vào, ra'
istr_dwo[2].s_gb_name = ''
//istr_dwo[2].s_pic_ref_table = 'LEGAL_ENTITY'
//istr_dwo[2].s_pic_ref_field = 'object_ref_id'
//istr_dwo[2].s_pic_ref_colname = 'LOGO'

end subroutine

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'

end subroutine

public subroutine f_set_dwo_related ();//istr_dwo_related[1].s_related_obj_name = 'u_unit_class'
//istr_dwo_related[1].s_main_obj_dwo = 'd_uom_grid'
//istr_dwo_related[1].s_main_obj_column = 'class_id'
//istr_dwo_related[1].s_related_obj_dwo = 'd_unit_class_grid'
//istr_dwo_related[1].s_related_obj_column = 'id'
//istr_dwo_related[1].s_relatedtext_column = 'code;name'
//istr_dwo_related[1].s_text = 'Lớp đơn vị của:'
//
//istr_dwo_related[2].s_related_obj_name = 'u_unit_conversion'
//istr_dwo_related[2].s_main_obj_dwo = 'd_uom_grid'
//istr_dwo_related[2].s_main_obj_column = 'id'
//istr_dwo_related[2].s_related_obj_dwo = 'd_unit_conversion_grid'
//istr_dwo_related[2].s_related_obj_column = 'FROM_UNIT_ID'
//istr_dwo_related[2].s_relatedtext_column = 'code;name'
//istr_dwo_related[2].s_text = 'Quy đổi đơn vị của:'
end subroutine

public function integer f_calc_workcount (datetime vdt_f_time, datetime vdt_t_time, integer vi_break_minute, ref double rdb_work_hours, ref double rdb_work_count);double			ldb_workhour, ldb_shifthour

t_dw_mpl		ldw_shift
c_datetime		lc_datetime

//-- kiểm tra thâm số truyền vào --//
if isnull(vdt_f_time) or isnull(vdt_t_time) then
//	gf_messagebox('m.c_shift.f_calc_workcount.01','Thông báo','Chưa nhập đủ giờ vào giờ ra','exclamation','ok',1)
	rdb_work_hours =0
	rdb_work_count = 0
	return 0
elseif string(vdt_f_time, 'hhssmm') = '000000' or string(vdt_t_time, 'hhssmm') = '000000' then
	rdb_work_hours =0
	rdb_work_count = 0
	return 0
end if
if isnull(vi_break_minute) then vi_break_minute = 0

ldw_shift = this.iw_display.f_get_dw( 'd_shift_grid')
if ldw_shift.rowcount( ) > 0 then
	ldb_workhour = ldw_shift.getitemnumber(ldw_shift.getrow( ) , 'HOUR_PER_DAY')
	if isnull(ldb_workhour) or ldb_workhour = 0 then
//		gf_messagebox('m.c_shift.f_calc_workcount.02','Thông báo','Chưa nhập số giờ làm việc / ngày','exclamation','ok',1)
		return -1
	end if
	
	ldb_shifthour = round(lc_datetime.f_hourafter( vdt_f_time, vdt_t_time),3)
	ldb_shifthour = ldb_shifthour - round(vi_break_minute/60,3)
	rdb_work_hours = ldb_shifthour
	rdb_work_count = round(ldb_shifthour/ldb_workhour,3)
	return 1
end if
return 0
end function

on c_shift.create
call super::create
end on

on c_shift.destroy
call super::destroy
end on

event constructor;call super::constructor;
ib_changed_dwo_4edit = false
is_display_model = '2d'
ib_display_text = false
is_object_title = 'Khai báo ca làm việc'

istr_actionpane[1].s_description = is_object_title
end event

event e_action_ctrl_e_postmodifyrow;return 0
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
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;'
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
			
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;

iw_display.f_set_ii_upperpart_height(iw_display.ii_resize_height*1/2)


return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;int				li_rtn, ldb_breakminute
double		ldb_workcount, ldb_workhours
datetime		ldt_ftime, ldt_ttime

if rpo_dw.dataobject = 'd_shift_line_grid' then
	if vs_colname = 'f_time' then
		
		ldt_ftime = datetime(vs_editdata)
		ldt_ttime = rpo_dw.getitemdatetime(vl_currentrow , 't_time')
		ldb_breakminute =rpo_dw.getitemnumber(vl_currentrow , 'break_minute')
		
		li_rtn = this.f_calc_workcount( ldt_ftime, ldt_ttime, ldb_breakminute,ldb_workhours,ldb_workcount)
		if li_rtn = -1 then return 1
		rpo_dw.setitem(vl_currentrow, 'WORKING_HOURS', ldb_workhours )
		rpo_dw.setitem(vl_currentrow, 'WORKING_COUNT', ldb_workcount )
	elseif vs_colname = 't_time' then
		ldt_ftime = rpo_dw.getitemdatetime(vl_currentrow , 'f_time')
		ldt_ttime =datetime(vs_editdata) 
		ldb_breakminute =rpo_dw.getitemnumber(vl_currentrow , 'break_minute')
		
		li_rtn = this.f_calc_workcount( ldt_ftime, ldt_ttime, ldb_breakminute,ldb_workhours,ldb_workcount)
		if li_rtn = -1 then return 1
		rpo_dw.setitem(vl_currentrow, 'WORKING_HOURS', ldb_workhours )
		rpo_dw.setitem(vl_currentrow, 'WORKING_COUNT', ldb_workcount )
	elseif vs_colname =  'break_minute' then
		ldt_ftime = rpo_dw.getitemdatetime(vl_currentrow , 'f_time')
		ldt_ttime = rpo_dw.getitemdatetime(vl_currentrow , 't_time')
		ldb_breakminute = long(vs_editdata)
		
		li_rtn = this.f_calc_workcount( ldt_ftime, ldt_ttime, ldb_breakminute,ldb_workhours,ldb_workcount)
		if li_rtn = -1 then return 1
		rpo_dw.setitem(vl_currentrow, 'WORKING_HOURS', ldb_workhours )
		rpo_dw.setitem(vl_currentrow, 'WORKING_COUNT', ldb_workcount )	
	end if
end if
return 0
end event

