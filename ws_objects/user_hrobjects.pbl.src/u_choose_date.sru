$PBExportHeader$u_choose_date.sru
forward
global type u_choose_date from b_choose_trans
end type
end forward

global type u_choose_date from b_choose_trans
end type
global u_choose_date u_choose_date

type variables
s_str_data		istr_data
end variables

forward prototypes
public subroutine f_set_dwo_window ()
public function integer f_set_default_week (date vd_f_date, date vd_t_date, integer vi_total_day, integer vi_idx)
public function integer f_check_assign (double vdb_dept_id, date vd_f_date, date vd_t_date)
public function double f_get_doc_id (double vdb_dept_id, date vd_f_date, date vd_t_date)
public function double f_get_doc_id_up (double vdb_dept_id, date vd_f_date, date vd_t_date)
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_choose_date_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_choose_date_grid'
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = false
istr_dwo[1].b_keyboardlocked = false
istr_dwo[1].s_description = 'Chọn ngày'
end subroutine

public function integer f_set_default_week (date vd_f_date, date vd_t_date, integer vi_total_day, integer vi_idx);/******************************
vi_total_day : tổng số ngày phân công ca
vi_idx:		: số tuần trong tháng
******************************/
c_datetime	lc_dt
t_dw_mpl	ldw_date
date			ld_f_date, ld_t_date, ld_null
string			ls_colname
int				li_day_of_shift, li_daynum

if vi_total_day < 1 then return 0
ldw_date = iw_display.f_get_dw( istr_dwo[1].s_dwo_default )
ld_f_date = vd_f_date
li_daynum = daynumber(ld_f_date)
if li_daynum = 7 then
	ld_f_date = relativeDate(ld_f_date , 2 ) //-- ngày đầu tiến là thứ 7 : nhảy qua 2 ngày --//
elseif  li_daynum = 1 then
	ld_f_date = relativeDate(ld_f_date , 1 )//-- ngày đầu tiến là CN : nhảy qua 1 ngày --//
end if
FOR li_day_of_shift = 1 to 6
	
	if ld_f_date > vd_t_date then // -- set null -- các tuần còn lại--//
		setnull(ld_null)			
		ls_colname = 'f_date_t' + string(li_day_of_shift)
		ldw_date.setitem( ldw_date.getrow(), ls_colname, ld_null)		
		ls_colname = 't_date_t' + string(li_day_of_shift)
		ldw_date.setitem( ldw_date.getrow(), ls_colname, ld_null)	
		continue 
	end if
	
	//-- set f_date--//
	ls_colname = 'f_date_t' + string(li_day_of_shift)
	ldw_date.setitem( ldw_date.getrow(), ls_colname, ld_f_date)
		
	//-- set t_date--//
	ls_colname = 't_date_t' + string(li_day_of_shift)
	li_daynum = daynumber(ld_f_date)
	ld_t_date = relativeDate(ld_f_date , 7 - li_daynum -1 ) //-- làm việc tứ thứ 2 đến thứ 6 --//

	if ld_t_date <= vd_t_date then	
		ldw_date.setitem( ldw_date.getrow(), ls_colname, ld_t_date)		
	else
		ldw_date.setitem( ldw_date.getrow(), ls_colname, vd_t_date)		
	end if
		 
	ld_f_date = relativeDate(ld_t_date , 3 ) //-- làm việc tứ thứ 2 đến thứ 6 --//
NEXT
return 1


end function

public function integer f_check_assign (double vdb_dept_id, date vd_f_date, date vd_t_date);long		ll_idx,ll_count
double	ldb_dept

t_ds_db	lds_full_dept

select count(swd.id) into :ll_count
from STAFF_WORKING_DAY swd
where swd.trans_date between :vd_f_date and :vd_t_date and swd.dept_id = :vdb_dept_id using SQLCA;

if ll_count = 0 then
	lds_full_dept = create t_ds_db
	lds_full_dept.dataobject = 'ds_full_dept'
	lds_full_dept.f_settransobject( SQLCA)
	ll_count = lds_full_dept.retrieve(vdb_dept_id )
	if ll_count > 0 then
		for ll_idx = 1 to ll_count
			ldb_dept = lds_full_dept.getitemnumber( ll_idx, 'id')
			if this.f_check_assign( ldb_dept, vd_f_date, vd_t_date) = 1 then return 1
		next
	end if
	destroy lds_full_dept
else
	return 1
end if
return 0
end function

public function double f_get_doc_id (double vdb_dept_id, date vd_f_date, date vd_t_date);long		ll_idx,ll_count
double	ldb_dept,ldb_doc_id

t_ds_db	lds_full_dept

select distinct doc.id into :ldb_doc_id
from document doc join STAFF_WORKING_DAY swd on doc.version_id = swd.object_ref_id
where doc.doc_type = 'ASSIGN_SHIFT' and swd.trans_date between :vd_f_date and :vd_t_date
		and (swd.dept_id = :vdb_dept_id or doc.manage_group = :vdb_dept_id) using SQLCA;
if ldb_doc_id > 0 then
	return ldb_doc_id
end if
return 0
end function

public function double f_get_doc_id_up (double vdb_dept_id, date vd_f_date, date vd_t_date);long		ll_idx,ll_count
double	ldb_dept,ldb_doc_id

t_ds_db	lds_full_dept



if ldb_doc_id = 0 then
	lds_full_dept = create t_ds_db
	lds_full_dept.dataobject = 'ds_dept_up'
	lds_full_dept.f_settransobject( SQLCA)
	ll_count = lds_full_dept.retrieve(vdb_dept_id )
	if ll_count > 0 then
		for ll_idx = 1 to ll_count
			ldb_dept = lds_full_dept.getitemnumber( ll_idx, 'manage_group')
			
			select distinct doc.id into :ldb_doc_id
			from document doc join STAFF_WORKING_DAY swd on doc.version_id = swd.object_ref_id
			where doc.doc_type = 'ASSIGN_SHIFT' and swd.trans_date between :vd_f_date and :vd_t_date
					and (swd.dept_id = :ldb_dept or doc.manage_group = :ldb_dept) using SQLCA;
			if ldb_doc_id = 0 then
				ldb_doc_id = this.f_get_doc_id_up( ldb_dept, vd_f_date, vd_t_date)
			else
				return ldb_doc_id
			end if
		next
	end if
	destroy lds_full_dept
else
	return ldb_doc_id
end if
return 0
end function

on u_choose_date.create
call super::create
end on

on u_choose_date.destroy
call super::destroy
end on

event constructor;call super::constructor;ib_changed_dwo_4edit = false
is_display_model = '1d'
ib_display_text = true
is_object_title = 'Chọn ngày'

istr_actionpane[1].s_description = is_object_title
end event

event e_dw_clicked;return 0
end event

event e_window_e_okclose;//--override--//

date				ld_f_date,ld_t_date,ld_df_1,ld_df_2,ld_df_3,ld_df_4,ld_df_5,ld_df_6,ld_dt_1,ld_dt_2,ld_dt_3,ld_dt_4,ld_dt_5,ld_dt_6
string 			ls_df_1,ls_df_2,ls_df_3,ls_df_4,ls_df_5,ls_df_6,ls_dt_1,ls_dt_2,ls_dt_3,ls_dt_4,ls_dt_5,ls_dt_6
long				ll_count
string				ls_return,ls_choose_upd_ins
double			ldb_dept_id,ldb_staff_id,ldb_sh_id,ldb_doc_id,ldb_sh_id1,ldb_sh_id2,ldb_sh_id3,ldb_sh_id4,ldb_sh_id5
datawindow 	ldw_main
t_ds_db			lds_full_dept

ldw_main = iw_display.dynamic f_get_dwmain()

ldb_staff_id = ldw_main.getitemnumber( 1, 'staff_id')
ldb_dept_id = ldw_main.getitemnumber( 1, 'dept_id')
if isnull(ldb_staff_id) then ldb_staff_id = 0
if isnull(ldb_dept_id) then ldb_dept_id = 0
//if ldb_staff_id =0 and ldb_dept_id = 0 then
//	gf_messagebox('m.u_choos_date.e_window_e_okclose.02','Thông báo','Chưa chọn nhân viên hoặc phòng ban','exclamation','ok',1)
//	return 
//end if

ld_f_date = date(ldw_main.getitemdatetime( 1, 'f_date'))
ld_t_date = date(ldw_main.getitemdatetime( 1, 't_date'))
if daysafter(ld_f_date, ld_t_date) > 30 then
	gf_messagebox('m.u_choos_date.e_window_e_okclose.03','Thông báo','Tổng số ngay phân công vượt quá 31 ngày','exclamation','ok',1)
	return
end if

ls_choose_upd_ins = ldw_main.getitemstring( 1, 'choose_upd_ins')

ld_df_1 = date(ldw_main.getitemdatetime( 1, 'f_date_t1'))
ld_dt_1 = date(ldw_main.getitemdatetime( 1, 't_date_t1'))
ld_df_2 = date(ldw_main.getitemdatetime( 1, 'f_date_t2'))
ld_dt_2 = date(ldw_main.getitemdatetime( 1, 't_date_t2'))
ld_df_3 = date(ldw_main.getitemdatetime( 1, 'f_date_t3'))
ld_dt_3 = date(ldw_main.getitemdatetime( 1, 't_date_t3'))
ld_df_4 = date(ldw_main.getitemdatetime( 1, 'f_date_t4'))
ld_dt_4 = date(ldw_main.getitemdatetime( 1, 't_date_t4'))
ld_df_5 = date(ldw_main.getitemdatetime( 1, 'f_date_t5'))
ld_dt_5 = date(ldw_main.getitemdatetime( 1, 't_date_t5'))
ld_df_6 = date(ldw_main.getitemdatetime( 1, 'f_date_t6'))
ld_dt_6 = date(ldw_main.getitemdatetime( 1, 't_date_t6'))
if isnull(string( ld_df_1 )) then
	ls_df_1 = 'null'
else
	ls_df_1 = string( ld_df_1 )
end if
if isnull(string( ld_df_2 )) then
	ls_df_2 = 'null'
else
	ls_df_2 = string( ld_df_2 )
end if
if isnull(string( ld_df_3 )) then
	ls_df_3 = 'null'
else
	ls_df_3 = string( ld_df_3 )
end if
if isnull(string( ld_df_4 )) then
	ls_df_4 = 'null'
else
	ls_df_4 = string( ld_df_4 )
end if
if isnull(string( ld_df_5 )) then
	ls_df_5 = 'null'
else
	ls_df_5 = string( ld_df_5 )
end if
if isnull(string( ld_df_6 )) then
	ls_df_6 = 'null'
else
	ls_df_6 = string( ld_df_6 )
end if

if isnull(string( ld_dt_1 )) then
	ls_dt_1 = 'null'
else
	ls_dt_1 = string( ld_dt_1 )
end if
if isnull(string( ld_dt_2 )) then
	ls_dt_2 = 'null'
else
	ls_dt_2 = string( ld_dt_2 )
end if
if isnull(string( ld_dt_3 )) then
	ls_dt_3 = 'null'
else
	ls_dt_3 = string( ld_dt_3 )
end if
if isnull(string( ld_dt_4 )) then
	ls_dt_4 = 'null'
else
	ls_dt_4 = string( ld_dt_4 )
end if
if isnull(string( ld_dt_5 )) then
	ls_dt_5 = 'null'
else
	ls_dt_5 = string( ld_dt_5 )
end if
if isnull(string( ld_dt_6 )) then
	ls_dt_6 = 'null'
else
	ls_dt_6 = string( ld_dt_6 )
end if


ldb_sh_id = ldw_main.getitemnumber( 1, 'sh_id')
ldb_sh_id1 = ldw_main.getitemnumber( 1, 'sh_id1')
ldb_sh_id2 = ldw_main.getitemnumber( 1, 'sh_id2')
ldb_sh_id3 = ldw_main.getitemnumber( 1, 'sh_id3')
ldb_sh_id4 = ldw_main.getitemnumber( 1, 'sh_id4')
ldb_sh_id5 = ldw_main.getitemnumber( 1, 'sh_id5')

if isnull(ldb_sh_id) then ldb_sh_id = 0
if isnull(ldb_sh_id1) then ldb_sh_id1 = 0
if isnull(ldb_sh_id2) then ldb_sh_id2 = 0
if isnull(ldb_sh_id3) then ldb_sh_id3 = 0
if isnull(ldb_sh_id4) then ldb_sh_id4 = 0
if isnull(ldb_sh_id5) then ldb_sh_id5 = 0

// kiểm tra đã phân công chưa--//
if ldb_staff_id > 0 then
	if  ls_choose_upd_ins = 'update' or  ls_choose_upd_ins = 'update_insert' then
		select count(swd.id) into :ll_count
		from STAFF_WORKING_DAY swd
		where swd.trans_date between :ld_f_date and :ld_t_date 
			and swd.staff_id = :ldb_staff_id 
			and swd.branch_id = :gdb_branch
			AND swd.object_ref_id <> :istr_data.adb_data[3]
		using SQLCA;
	else
		select count(swd.id) into :ll_count
		from STAFF_WORKING_DAY swd
		where swd.trans_date between :ld_f_date and :ld_t_date and swd.staff_id = :ldb_staff_id 
		using SQLCA;		
	end if
elseif ldb_dept_id > 0 then
	if  ls_choose_upd_ins = 'update'  or  ls_choose_upd_ins = 'update_insert' then
		select count(swd.id) into :ll_count
		from STAFF_WORKING_DAY swd
		where swd.trans_date between :ld_f_date and :ld_t_date 
			and swd.dept_id = :ldb_dept_id 
			and swd.branch_id = :gdb_branch
			AND swd.object_ref_id <> :istr_data.adb_data[3]
		using SQLCA;	
	else
		select count(swd.id) into :ll_count
		from STAFF_WORKING_DAY swd
		where swd.trans_date between :ld_f_date and :ld_t_date 
		and swd.branch_id = :gdb_branch
		and swd.dept_id = :ldb_dept_id 
		using SQLCA;			
	end if
else
	if  ls_choose_upd_ins = 'update'  or  ls_choose_upd_ins = 'update_insert' then
		select count(swd.id) into :ll_count
		from STAFF_WORKING_DAY swd
		where swd.trans_date between :ld_f_date and :ld_t_date
			and swd.branch_id = :gdb_branch
			AND swd.object_ref_id <> :istr_data.adb_data[3]
		using SQLCA;	
	else
		select count(swd.id) into :ll_count
		from STAFF_WORKING_DAY swd
		where swd.trans_date between :ld_f_date and :ld_t_date 
		and swd.branch_id = :gdb_branch
		using SQLCA;			
	end if
end if

if ll_count > 0 then
	gf_messagebox('m.u_choos_date.e_window_e_okclose.01','Thông báo','Thời gian phân công ca cho phòng ban trùng lắp 2 phiếu','exclamation','ok',1)
	return
end if

if istr_data.adb_data[1]  > 0 and ls_choose_upd_ins = 'update' or ls_choose_upd_ins = 'update_insert' then //-- nếu đã có chứng từ --//
	ldb_doc_id = istr_data.adb_data[1]
//	if gf_messagebox('m.u_choos_date.e_window_e_okclose.01','Thông báo','Đã có phân ca làm việc cho phòng ban này ~t~t Bạn có muốn cập nhật lại ca làm việc?','question','yesno',2) = 1 then
//		if ldb_staff_id > 0 then
//			select distinct doc.id into :ldb_doc_id
//			from document doc join STAFF_WORKING_DAY swd on doc.version_id = swd.object_ref_id
//			where doc.doc_type = 'ASSIGN_SHIFT' and swd.trans_date between :ld_f_date and :ld_t_date
//					and swd.staff_id = :ldb_staff_id using SQLCA;
//		elseif ldb_dept_id > 0 then
//			ldb_doc_id = this.f_get_doc_id( ldb_dept_id,ld_f_date, ld_t_date)
//			if ldb_doc_id = 0 then ldb_doc_id = this.f_get_doc_id_up( ldb_dept_id,ld_f_date, ld_t_date)
//		end if
		ls_return = string(ld_f_date) + ';' + string(ld_t_date) + ';' + string(ldb_staff_id) + ';' + string(ldb_dept_id) +';' + string(ldb_sh_id) + ';'
		ls_return += string(ldb_sh_id1) +';' + string(ldb_sh_id2) +';' + string(ldb_sh_id3) +';' + string(ldb_sh_id4) +';' + string(ldb_sh_id5) +';'
		ls_return += string(ls_df_1) + ';' + string(ls_dt_1) +';'+ string(ls_df_2) + ';' + string(ls_dt_2) +';'+ string(ls_df_3) + ';' + string(ls_dt_3) +';'+ string(ls_df_4) + ';' + string(ls_dt_4) +';'
		ls_return += string(ls_df_5) + ';' + string(ls_dt_5) +';'+ string(ls_df_6) + ';' + string(ls_dt_6) +';'
		ls_return += string(ldb_doc_id) +';' + ls_choose_upd_ins +';'
		CloseWithReturn (iw_display,ls_return)
		return 
//	else
//		return 
//	end if
end if
ls_return = string(ld_f_date) + ';' + string(ld_t_date) + ';' + string(ldb_staff_id) + ';' + string(ldb_dept_id) +';' + string(ldb_sh_id) +';'
ls_return += string(ldb_sh_id1) +';' + string(ldb_sh_id2) +';' + string(ldb_sh_id3) +';' + string(ldb_sh_id4) +';' + string(ldb_sh_id5) +';'
ls_return += string(ls_df_1) + ';' + string(ls_dt_1) +';'+ string(ls_df_2) + ';' + string(ls_dt_2) +';'+ string(ls_df_3) + ';' + string(ls_dt_3) +';'+ string(ls_df_4) + ';' + string(ls_dt_4) + ';'
ls_return += string(ls_df_5) + ';' + string(ls_dt_5) +';'+ string(ls_df_6) + ';' + string(ls_dt_6) +';' + ls_choose_upd_ins +';'
CloseWithReturn (iw_display,ls_return)
return 
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
						istr_actionpane[li_idx].s_visible_buttons = ' b_refresh;b_okclose;b_close;'
					else
						istr_actionpane[li_idx].s_visible_buttons = ' b_refresh;b_okclose;b_close;'
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = ' b_refresh;b_okclose;b_close;'
					else
						istr_actionpane[li_idx].s_visible_buttons =' b_refresh;b_okclose;b_close;'
					end if
				end if
			else				
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons=' b_refresh;b_okclose;b_close;'
				else
					istr_actionpane[li_idx].s_visible_buttons=' b_refresh;b_okclose;b_close;'
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

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;c_datetime	lc_dt
date			ld_f_date,ld_t_date
int				li_days
double		ldb_staff_id, ldb_dept_id


if vs_colname = 'f_date' or vs_colname = 't_date' then
	if vs_colname = 'f_date' then
		ld_f_date = date(vs_editdata)
		ld_t_date = date(rpo_dw.getitemdatetime(vl_currentrow,'t_date'))
	else
		ld_f_date = date(rpo_dw.getitemdatetime(vl_currentrow,'f_date'))
		ld_t_date = date(vs_editdata)
	end if
	li_days = DaysAfter ( ld_f_date, ld_t_date)
	if li_days > 0 then this.f_set_default_week( ld_f_date, ld_t_date, li_days, 1)
elseif vs_colname = 'choose_upd_ins' then
	if vs_editdata = 'insert' then
		rpo_dw.setitem( 1, 'dept_id',  0)
		rpo_dw.setitem( 1, 'dept_code',  '')
		rpo_dw.setitem( 1, 'dept_name',  '')

		rpo_dw.setitem( 1, 'f_date', lc_dt.f_firstdayofmonth( today()))
		rpo_dw.setitem( 1, 't_date', lc_dt.f_lastdayofmonth( today()))				
	else
		if istr_data.adb_data[1] > 0 then
			rpo_dw.setitem( 1, 'dept_id',  istr_data.adb_data[2])
			rpo_dw.setitem( 1, 'dept_code',  istr_data.as_data[1])
			rpo_dw.setitem( 1, 'dept_name',  istr_data.as_data[2])
			rpo_dw.setitem( 1, 'f_date', istr_data.ad_data[1] )
			rpo_dw.setitem( 1, 't_date', istr_data.ad_data[2])	
			li_days =  DaysAfter ( istr_data.ad_data[1], istr_data.ad_data[2])
			this.f_set_default_week( istr_data.ad_data[1], istr_data.ad_data[2], li_days, 1)
		else
			gf_messagebox('m.u_choos_date.e_dw_e_itemchanged.01','Thông báo','Không chọn đúng phiếu phân công ca để cập nhật!','stop','ok',1) 
			return 1
		end if
	end if	
elseif vs_colname = 'staff_code' then 
	if vs_editdata <> '' and not isnull( vs_editdata) then
		rpo_dw.setitem( 1, 'dept_id',  0)
		rpo_dw.setitem( 1, 'dept_code',  '')
		rpo_dw.setitem( 1, 'dept_name',  '')		
	end if
elseif vs_colname = 'dept_code' then
	if vs_editdata <> '' and not isnull( vs_editdata) then
		rpo_dw.setitem( 1, 'staff_id',  0)
		rpo_dw.setitem( 1, 'staff_code',  '')
		rpo_dw.setitem( 1, 'staff_name',  '')		
	end if	
end if
return 0
end event

event e_window_e_postopen;call super::e_window_e_postopen;/*
t_dw_mpl	ldw_main

ldw_main = iw_display.f_get_dwmain( )

ldw_main.setitem(1,'choose_upd_ins','update')
return 0
*/

t_dw_mpl	ldw_main
int				li_days

ldw_main = iw_display.f_get_dwmain( )
ldw_main.reset( )
ldw_main.event e_addrow( )
ldw_main.f_set_ib_editing( false)
if upperbound( istr_data.adb_data[]) > 0 then
	if  istr_data.adb_data[1] = 0 then
		ldw_main.setitem(1,'choose_upd_ins','insert')
	else
		ldw_main.setitem(1,'choose_upd_ins','update')
		ldw_main.setitem( 1, 'dept_id',  istr_data.adb_data[2])
		ldw_main.setitem( 1, 'dept_code',  istr_data.as_data[1])
		ldw_main.setitem( 1, 'dept_name',  istr_data.as_data[2])
		ldw_main.setitem( 1, 'f_date', istr_data.ad_data[1] )
		ldw_main.setitem( 1, 't_date', istr_data.ad_data[2])
		
		li_days = DaysAfter ( istr_data.ad_data[1],  istr_data.ad_data[2])
		this.f_set_default_week( istr_data.ad_data[1], istr_data.ad_data[2], li_days, 6)		
	end if
	
end if
return 0
end event

