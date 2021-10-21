$PBExportHeader$c_timesheet.sru
forward
global type c_timesheet from s_object_display
end type
end forward

global type c_timesheet from s_object_display
event type integer e_action_process ( )
event type integer e_action_estimate ( )
end type
global c_timesheet c_timesheet

type variables
int		ii_err_pick, ii_err_weight, ii_err_mixed

any	ias_retrieve_arg[]
t_ds_db	ids_dept

b_multithread	ic_multithread
end variables

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_str_unit ()
public subroutine f_set_actionpane ()
public function integer f_calc_workcount (datetime vdt_f_time, datetime vdt_t_time, double vdb_shift_id, ref double rdb_work_hours, ref double rdb_work_count)
end prototypes

event type integer e_action_process();
date   				ld_fdate, ld_tdate
double				ldb_dep_id, ldb_staff_id

b_hr_instantiate	lb_hr
t_dw_mpl			ldw_parm



ldw_parm = this.iw_display.f_get_dw( 'd_timesheet_date_form')

if isvalid(ldw_parm) then
	ld_fdate = date(ldw_parm.getitemdatetime( 1, 'f_date'))
	ld_tdate = date(ldw_parm.getitemdatetime( 1, 't_date'))
	ldb_dep_id = ldw_parm.getitemnumber( 1, 'dept_id')
	ldb_staff_id = ldw_parm.getitemnumber( 1, 'staff_id')
	if isnull(ldb_dep_id) then ldb_dep_id = 0
	lb_hr.f_calc_timesheet_tm( ldb_dep_id, ldb_staff_id, ld_fdate, ld_tdate, it_transaction )
	

	ldw_parm = this.iw_display.f_get_dw( 'd_timesheet_grid')
	
	ldw_parm.event e_retrieve( )
	gf_messagebox('m.c_timesheet.e_action_process.02','Thông báo','Hoàn thành tính công', 'exclamation','ok',1)
	/*
	if isnull(ls_staff_code) or ls_staff_code = '' then ls_staff_code = '*'
	if isnull(ls_dept_code) or ls_dept_code = '' then ls_dept_code = '*'
	if sharedobjectregister("b_multithread","i_multithread_timesheet") = Success! then
		sharedobjectGet("i_multithread_timesheet", ic_multithread)
		
//		ls_tmp = "execute pkg_time_inout.pro_insert_time_inout(trunc(to_date('"+string(ld_fdate)+"','dd/mm/yyyy')),trunc(to_date('"+string(ld_tdate)+"','dd/mm/yyyy')),'"+ls_staff_code+"','"+ls_dept_code+"',"+string(gi_userid)+")"
//		ic_multithread.post event e_window_e_action_process( this.classname(), lt_transaction.servername , lt_transaction.logid , lt_transaction.logpass , ls_tmp)
		ls_tmp = "execute pkg_timesheet.pro_insert_timesheet_day(trunc(to_date('"+string(ld_fdate)+"','" + gs_w_date_format + "')),trunc(to_date('"+string(ld_tdate)+"','"+ gs_w_date_format + "')),'"+ls_staff_code+"','"+ls_dept_code+"',"+string(gi_userid)+")"
		ic_multithread.post event e_window_e_action_process( this.classname(), lt_transaction.servername , lt_transaction.logid , lt_transaction.logpass , ls_tmp)
//		ls_tmp = "execute pkg_timesheet.pro_insert_timesheet(trunc(to_date('"+string(ld_fdate)+"','dd/mm/yyyy')),trunc(to_date('"+string(ld_tdate)+"','dd/mm/yyyy')),'"+ls_staff_code+"','"+ls_dept_code+"',"+string(gi_userid)+")"
//		ic_multithread.post event e_window_e_action_process( this.classname(), lt_transaction.servername , lt_transaction.logid , lt_transaction.logpass , ls_tmp)
//		ls_tmp = "execute pkg_timesheet_ot.pro_insert_timesheet(trunc(to_date('"+string(ld_fdate)+"','dd/mm/yyyy')),trunc(to_date('"+string(ld_tdate)+"','dd/mm/yyyy')),'"+ls_staff_code+"','"+ls_dept_code+"',"+string(gi_userid)+")"
//		ic_multithread.post event e_window_e_action_process( this.classname(), lt_transaction.servername , lt_transaction.logid , lt_transaction.logpass , ls_tmp)
		
		SharedobjectUnregister("i_multithread_timesheet")
				
	end if
	*/
end if
return 0
end event

public subroutine f_set_dwo_window ();
istr_dwo[1].s_dwo_default =  'd_timesheet_date_form'
istr_dwo[1].s_dwo_form = 'd_timesheet_date_form'
istr_dwo[1].s_dwo_grid = ''
istr_dwo[1].b_master = false
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_details = ''
istr_dwo[1].s_dwo_shared = ''
istr_dwo[1].s_dwo_master = ''
istr_dwo[1].s_master_keycol = ''
istr_dwo[1].s_detail_keycol = ''
istr_dwo[1].b_ref_table_yn  = false
istr_dwo[1].s_ref_table_field = ''
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = false
istr_dwo[1].b_excel = false
istr_dwo[1].b_keyboardlocked = false
istr_dwo[1].s_gb_name = ''
istr_dwo[1].s_description = 'Chọn ngày'

istr_dwo[2].s_dwo_default =  'd_timesheet_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_timesheet_grid'
istr_dwo[2].b_master = false
istr_dwo[2].b_detail = false
istr_dwo[2].b_cascade_del = false
istr_dwo[2].s_dwo_details = ''
istr_dwo[2].s_dwo_shared = ''
istr_dwo[2].s_dwo_master = ''
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
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_gb_name = ''
istr_dwo[2].s_description = 'Bảng công'



end subroutine

public subroutine f_set_str_unit ();////--Datawindow chứa các cột cần làm tròn--//
//istr_unit[1].s_dwo_handing = 'd_prod_product_grid;d_prod_product_grid;d_prod_product_grid;d_prod_product_grid;d_prod_hdr_form;'
////--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
//istr_unit[1].s_colname_data = 'act_qty;bom_qty;cogs;bc;ex'
////--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
//istr_unit[1].s_colname_convert = ''
//istr_unit[1].s_colname_diff = ''
////--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
//istr_unit[1].s_dwo_unit = 'd_prod_product_grid;d_prod_product_grid;d_prod_hdr_form;d_prod_hdr_form;d_prod_hdr_form;'
////--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
//istr_unit[1].s_colname_unit = 'uom_code;uom_code;uom_code;uom_code;EXCHANGE_RATE'
////--Loại làm tròn --//
//istr_unit[1].s_type =  'item;item;amount;bc;ex'
////--Datawindow của cột chứa mã hàng--//
//istr_unit[1].s_dwo_object = 'd_prod_product_grid'
////--Cột chứa mã hàng--//
//istr_unit[1].s_colname_object = 'object_code'
//
//
end subroutine

public subroutine f_set_actionpane ();//istr_actionpane[2].s_dwo_action = 'd_action_related_object'
//istr_actionpane[2].s_button_name =  ''
//istr_actionpane[2].s_objname_handling = this.classname( )
//istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'
end subroutine

public function integer f_calc_workcount (datetime vdt_f_time, datetime vdt_t_time, double vdb_shift_id, ref double rdb_work_hours, ref double rdb_work_count);double			ldb_workhour, ldb_shifthour

t_dw_mpl				ldw_shift
c_datetime				lc_datetime
b_hr_instantiate		lb_hr

//-- kiểm tra thâm số truyền vào --//
if isnull(vdt_f_time) or isnull(vdt_t_time) then
	gf_messagebox('m.c_timesheet.f_calc_workcount.01','Thông báo','Chưa nhập đủ giờ vào giờ ra','exclamation','ok',1)
	return -1
elseif string(vdt_f_time, 'hhssmm') = '000000' or string(vdt_t_time, 'hhssmm') = '000000' then
	rdb_work_hours =0
	rdb_work_count = 0
	return 0
end if

if isnull(vdb_shift_id) then vdb_shift_id = 0

ldb_workhour = lb_hr.f_get_workinghour_per_day(vdb_shift_id )
if isnull(ldb_workhour) or ldb_workhour = 0 then
	gf_messagebox('m.c_timesheet.f_calc_workcount.02','Thông báo','Chưa nhập số giờ làm việc / ngày','exclamation','ok',1)
	return -1
end if

ldb_shifthour = round(lc_datetime.f_hourafter( vdt_f_time, vdt_t_time),3)
rdb_work_hours = ldb_shifthour
rdb_work_count = round(ldb_shifthour/ldb_workhour,3)

return 1

end function

on c_timesheet.create
call super::create
end on

on c_timesheet.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = false
this.ib_keyboardlocked = true
is_display_model = '1tv_2d'
is_object_title = 'Tính công'
istr_actionpane[1].s_button_name = 'b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_post;b_unpost;b_estimate;b_copyt_po;b_view_prod_order;b_process;'
istr_actionpane[1].s_button_has_sub = ''


istr_actionpane[1].s_description = is_object_title
is_exrate_type = 'buy'


end event

event e_action_ctrl_bttn;call super::e_action_ctrl_bttn;datawindow				ldw_focus
int								li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	if not this.ib_copying then
		//-- control d_action_edit --//
		FOR li_idx = 1 to upperbound(istr_actionpane[]) 
			if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
//				if ldw_focus.dynamic f_get_ib_shared() then
//					ldw_focus = ldw_focus.dynamic f_getdwmaster()
//				end if			
//				if ldw_focus.dynamic f_get_ib_detail() then
//					if ib_changed_dwo_4edit then
//						if ldw_focus.dynamic f_isgrid() then
//							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_release;b_process;'
//						else
//							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_release;b_process;'
//						end if
//					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons =  'b_add;b_insert;b_modify;b_refresh;b_blank;b_delete;b_blank;b_process;'
						else
							istr_actionpane[li_idx].s_visible_buttons =   'b_refresh;b_process;'
						end if
//					end if
//				else				
//					if  ib_changed_dwo_4edit then
//						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_post;b_view_prod_order;b_estimate;b_process;'
//					else
//						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_post;b_view_prod_order;b_estimate;b_process;'
//					end if
//				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				istr_actionpane[li_idx].s_visible_buttons =   ''
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
				istr_actionpane[li_idx].s_visible_buttons =  'b_book; b_attach; b_note;b_doc_trace_on;b_user_trace;b_appr_trace;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
				
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;//--resize parm --//

iw_display.f_set_ii_upperpart_height(1/7 )
//iw_display.f_set_ii_fixedpart1_height( iw_display.ii_resize_height*2/5 *1/3)


return 0
end event

event e_window_e_postopen;call super::e_window_e_postopen;t_dw_mpl		ldw_date

ldw_date = this.iw_display.f_get_dw( 'd_timesheet_date_form')
ldw_date.insertrow( 0)
//ldw_date.setfocus( )
//this.iw_display.idw_focus = ldw_date
this.f_ctrl_actionbuttons( ldw_date)
this.iw_display.triggerevent( "e_display_actionbutton" )
return 0
end event

event e_dw_e_preretrieve;call super::e_dw_e_preretrieve;double				ldb_dept_id
date   				ld_fdate, ld_tdate
string					ls_staff_code, ls_where, ls_dept_code
b_obj_instantiate	lbo_ins
t_dw_mpl			ldw_parm
t_transaction		lt_transaction

if rpo_dw.dataobject = 'd_timesheet_grid' then
//	this.iw_display.f_get_transaction(lt_transaction)
//	rpo_dw.dataobject = 'd_timesheet_grid'
//	rpo_dw.settransobject(lt_transaction)
	
	ldw_parm = this.iw_display.f_get_dw( 'd_timesheet_date_form')
	
	if isvalid(ldw_parm) then
		ld_fdate = date(ldw_parm.getitemdatetime( 1, 'f_date'))
		ld_tdate = date(ldw_parm.getitemdatetime( 1, 't_date'))
		ls_staff_code = upper(ldw_parm.getitemstring( 1, 'staff_code'))
		ldb_dept_id =  ldw_parm.getitemnumber( 1, 'dept_id')
		if isnull(ld_fdate) or string(ld_fdate,'ddmmyyyy') = '01011900' or  isnull(ld_tdate) or string(ld_tdate,'ddmmyyyy') = '01011900' then
			gf_messagebox('m.c_timesheet.e_action_process.01','Thông báo','Chưa chọn ngày tính công', 'exclamation','ok',1)
			return 0
		end if
		
		if lbo_ins.f_is_branch_yn( this.classname( ) ) then		
			ls_where = " TIMESHEET_LINE.company_id ="+string(gi_user_comp_id )+ " AND TIMESHEET_LINE.branch_id ="+string(gdb_branch ) & 
						+ " AND to_char(TIMESHEET_LINE.work_Date,~~'yyyymmdd~~') BETWEEN ~~'" + string(ld_fdate,'yyyymmdd') &
						+ "~~' AND ~~'" + string(ld_tdate,'yyyymmdd') + "~~'"
		else
			ls_where = " TIMESHEET_LINE.company_id ="+string(gi_user_comp_id ) & 
						+ " AND to_char(TIMESHEET_LINE.work_Date,~~'yyyymmdd~~') BETWEEN ~~'" + string(ld_fdate,'yyyymmdd') &
						+ "~~' AND ~~'" + string(ld_tdate,'yyyymmdd') + "~~'"			
		end if
		if not isnull(ls_staff_code) and ls_staff_code <> '' then
			ls_where += " AND upper(o_staff.code) = ~~'" + ls_staff_code +"~~'"
		end if		
		if not isnull(ldb_dept_id) and ldb_dept_id <> 0 then
			ls_where += " AND o_dept.ID = " + string(ldb_dept_id )
		end if	
		
		rpo_dw.dynamic f_change_where( ls_where )
	end if
end if
return 0


end event

event e_window_e_refresh;call super::e_window_e_refresh;t_dw_mpl		ldw_focus


ldw_focus =  this.iw_display.f_get_idwfocus( )
if ldw_focus.dataobject = 'd_timesheet_date_form' then
	ldw_focus = this.iw_display.f_get_dw( 'd_timesheet_grid')
	this.iw_display.f_set_idwfocus(ldw_focus)
end if
return 1
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;datetime				ldt_ftime, ldt_ttime
time					lt_time_tmp
date					ld_workdate
double				ldb_shift_id, ldb_workhours, ldb_workcount
int						li_rtn

if rpo_dw.dataobject = 'd_timesheet_grid' then
	if vs_colname = 'shift_in_time' then
		ldb_shift_id = rpo_dw.getitemnumber(vl_currentrow , 'shift_id')
		ld_workdate = date(rpo_dw.getitemdatetime(vl_currentrow , 'work_date'))		

		lt_time_tmp =time(datetime(vs_editdata)) 		
		ldt_ftime = datetime(ld_workdate, lt_time_tmp)	
		
		ldt_ttime = rpo_dw.getitemdatetime(vl_currentrow , 'shift_out_time')
		lt_time_tmp = time(ldt_ttime)
		ldt_ttime = datetime(ld_workdate, lt_time_tmp)
			
		if ldb_shift_id > 0 then	
			li_rtn = this.f_calc_workcount( ldt_ftime, ldt_ttime, ldb_shift_id,ldb_workhours,ldb_workcount)
			if li_rtn = -1 then return 1
			rpo_dw.setitem(vl_currentrow, 'WORK_HOUR', ldb_workhours )
			rpo_dw.setitem(vl_currentrow, 'WORK_COUNT', ldb_workcount )
		else
			gf_messagebox('m.c_timesheet.e_dw_e_itemchanged.01','Thông báo','Chưa nhập Ca làm việc nên chưa tính được công', 'exclamation','ok',1)
		end if
		return 0
	elseif vs_colname = 'shift_out_time' then
		ldb_shift_id = rpo_dw.getitemnumber(vl_currentrow , 'shift_id')
		ld_workdate = date(rpo_dw.getitemdatetime(vl_currentrow , 'work_date'))
		ldt_ftime = rpo_dw.getitemdatetime(vl_currentrow , 'shift_in_time')
		lt_time_tmp = time(ldt_ftime)
		ldt_ftime = datetime(ld_workdate, lt_time_tmp)
		
		lt_time_tmp =time(datetime(vs_editdata)) 		
		ldt_ttime = datetime(ld_workdate, lt_time_tmp)
		if ldb_shift_id > 0 then	
			li_rtn = this.f_calc_workcount( ldt_ftime, ldt_ttime, ldb_shift_id,ldb_workhours,ldb_workcount)
			if li_rtn = -1 then return 1
			rpo_dw.setitem(vl_currentrow, 'WORK_HOUR', ldb_workhours )
			rpo_dw.setitem(vl_currentrow, 'WORK_COUNT', ldb_workcount )			
		else
			gf_messagebox('m.c_timesheet.e_dw_e_itemchanged.01','Thông báo','Chưa nhập Ca làm việc nên chưa tính được công', 'exclamation','ok',1)			
		end if
		return 0
	end if
end if
return 0
end event

event e_tv_selectionchanged;call super::e_tv_selectionchanged;double			ll_cur_hdl, ldb_dept_id,ldb_up_id
string				ls_filter, ls_dept_code, ls_dept_name
int					li_idx
t_dw_mpl		ldw_timesheet, ldw_parm
treeviewitem	l_tvi

if rpo_tv.classname() = 'tv_1' then
	ll_cur_hdl = rpo_tv.finditem(currenttreeitem!, 0)
	if ll_cur_hdl = -1 then	 return -1
	rpo_tv.getitem( ll_cur_hdl, l_tvi)	
	ipo_tv = l_tvi.data
	ldb_up_id = ipo_tv.istr_tv.db_up_id
	ldb_dept_id = ipo_tv.istr_tv.db_id	
	ls_dept_name = ipo_tv.istr_tv.s_label
	ls_dept_code = ipo_tv.istr_tv.s_object
	
	ldw_timesheet = iw_display.f_get_dw( istr_dwo[2].s_dwo_default) 
	ldw_parm = iw_display.f_get_dw( istr_dwo[1].s_dwo_default) 
	
	if ldb_dept_id <> gdb_branch and ldb_up_id <> gi_user_comp_id and ldb_dept_id <> gi_user_comp_id then
		ldw_parm.setitem( 1, 'dept_id', ldb_dept_id)
		ldw_parm.setitem( 1, 'dept_code', ls_dept_code)
		ldw_parm.setitem( 1, 'dept_name', ls_dept_name)
		
		ls_filter =  'dept_id = ' + string(ldb_dept_id)
		

	else
		if ldb_dept_id = gdb_branch or ldb_up_id = gi_user_comp_id then
			ls_filter =  'branch_id = ' + string(ldb_dept_id)
		elseif ldb_dept_id = gi_user_comp_id then
			ls_filter =  'company_id = ' + string(ldb_dept_id)
		else
			ls_filter =''
		end if		
		setnull(ldb_dept_id)
		ldw_parm.setitem( 1, 'dept_id', ldb_dept_id)
		ldw_parm.setitem( 1, 'dept_code', '')
		ldw_parm.setitem( 1, 'dept_name', '')		
		
	end if

	ldw_timesheet.setfilter( ls_filter)
	ldw_timesheet.filter( )
	
	
	
//	if idb_main_ID > 0 then 
//		ll_cur_hdl = rpo_tv.dynamic f_find_item_hdl(string(idb_main_ID))
//		if ll_cur_hdl > 0 then
//			rpo_tv.selectitem(ll_cur_hdl)
//		end if
//		idb_main_ID = 0 
//		return 1
//	end if
//	if isvalid(iw_display) then
//		ldw_handling = iw_display.dynamic f_get_dwmain()
//		if isvalid(ldw_handling) then
//			iw_display.dynamic f_set_idwfocus(ldw_handling)
//			ll_cur_hdl = ldw_handling.dynamic event e_retrieve()	
//		else
//			return -1
//		end if
//	end if
elseif  rpo_tv.classname() = 'tv_2' then
//	ll_cur_hdl = rpo_tv.finditem(currenttreeitem!, 0)
//	if ll_cur_hdl = -1 then				return -1
//
//	//-- lấy treeview item --//
//	rpo_tv.getitem( ll_cur_hdl, l_tvi)	
//	ipo_tv = l_tvi.data
//	ldb_dept_id = ipo_tv.istr_tv.db_id	
//	
//	ldw_handling = iw_display.f_get_dw('d_dept_grid')
//	ll_row = ldw_handling.find("id = "+ string(ldb_dept_id), 1 , ldw_handling.rowcount( ))
//	if ll_row > 0 then	ldw_handling.scrolltorow( ll_row)
	
end if
return 1
end event

event e_tv_selectionchanging;call super::e_tv_selectionchanging;
datawindow			ldw_focus

ldw_focus = iw_display.dynamic f_get_idwfocus()
if isvalid(ldw_focus) then
	if ldw_focus.dynamic f_get_ib_editing() then
		return 1
	end if
end if
return 0
end event

event e_window_open;call super::e_window_open;treeview			ltv_dept
b_obj_instantiate		lbo_ins
int					li_rtn
any				la_arg[5]
long				ll_root_hdl

if not isvalid(iw_display) then return -1

istr_tvo[1].ds_tv_item = create datastore
istr_tvo[1].ds_tv_item.dataobject = 'ds_dept_tv'
istr_tvo[1].s_popmenu_items = 'm_add_dept'

ids_dept = create t_ds_db
ids_dept.dataobject = 'ds_dept_tv'
ids_dept.f_settransobject( it_transaction )
ids_dept.retrieve( )

//-- load company and branch vao treeview --//
ltv_dept = iw_display.dynamic f_get_tv()
if isvalid(ltv_dept) then
	if lbo_ins.f_is_branch_yn( this.classname()) then
		la_arg[1] = gdb_branch
	else
		la_arg[1] = 0
	end if
	li_rtn = this.f_display_on_tv( ltv_dept,la_arg[])
	ll_root_hdl = ltv_dept.FindItem(RootTreeItem! , 0)
	ltv_dept.selectitem(ll_root_hdl)
	ltv_dept.expanditem(ll_root_hdl)
else
	return -1
end if
return 1
end event

