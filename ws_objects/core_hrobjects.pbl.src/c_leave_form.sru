$PBExportHeader$c_leave_form.sru
forward
global type c_leave_form from s_object_display
end type
end forward

global type c_leave_form from s_object_display
event e_action_init_shift ( )
end type
global c_leave_form c_leave_form

type variables
date		id_f_date,id_t_date,id_f_date1,id_t_date1,id_f_date2,id_t_date2,id_f_date3,id_t_date3,id_f_date4,id_t_date4,id_f_date5,id_t_date5,id_f_date6,id_t_date6
double	idb_staff_id,idb_dept_id,idb_sh_id,idb_doc_id,idb_sh_id1,idb_sh_id2,idb_sh_id3,idb_sh_id4,idb_sh_id5
long		il_yesno
boolean	ib_copy_yn,ib_group_dept, ib_update_s, ib_insert_s, ib_upd_ins,ib_delete_s
t_ds_db	ids_staff_working_day

end variables

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_related ()
public function integer f_calc_workcount (datetime vdt_f_time, datetime vdt_t_time, integer vi_break_minute, ref double rdb_work_hours, ref double rdb_work_count)
public function double f_get_dept_id (string vs_dept_name)
public function integer f_set_item_doc (ref t_ds_db rds_doc)
public function integer f_set_item_orders (ref t_ds_db rds_orders, double vdb_doc_id)
public function integer f_choose_date ()
public function integer f_set_detail_working_day ()
public function long f_get_ds_staff (ref t_ds_db rds_staff)
public function integer f_set_item_staff_shift (ref t_ds_db rds_staff_wd, double vdb_orders_id, ref t_ds_db rds_import, string vs_import_yn)
public function integer f_set_item_staff_shift_week (ref t_ds_db vds_staff, ref t_ds_db rds_staff_wd, date vd_f_date, date vd_t_date, double vdb_sh_id, double vdb_staff_id, double vdb_orders_id, double vdb_dept_id)
public function string f_get_dept_id_string (double vdb_dept_id)
public function integer f_choose_date (s_str_data vstr_data)
public function integer f_set_item_staff_shift (double vdb_dept_id, double vdb_staff_id, double vdb_orders_id, date vd_f_date, date vd_t_date)
public subroutine f_set_dwo_tabpage ()
end prototypes

event e_action_init_shift();b_obj_instantiate	lb_obj_ins

t_ds_db				lds_staff,lds_staff_wd,lds_doc,lds_orders
t_dw_mpl			ldw_main
s_str_data			lstr_Data
double	ldb_id, ldb_doc_id
string		ls_where
long		ll_row,ll_doc_row
//any		laa_data[]
//ds_full_dept
/*
ldw_main = iw_display.f_get_dwmain( )
if ldw_main.getitemstring(ldw_main.getrow(), "status") = 'new' then
	lstr_Data.adb_data[1] = ldw_main.getitemnumber(ldw_main.getrow(), "duty_id")
	lstr_Data.adb_data[2] = ldw_main.getitemnumber(ldw_main.getrow(), "dept_id")
	lstr_Data.as_data[1] = ldw_main.getitemstring(ldw_main.getrow(), "combination_code")
	lstr_Data.as_data[2] = ldw_main.getitemstring(ldw_main.getrow(), "combination_text")
	lstr_Data.ad_data[1] = date(ldw_main.getitemdatetime(ldw_main.getrow(), "f_date"))
	lstr_Data.ad_data[2] = date(ldw_main.getitemdatetime(ldw_main.getrow(), "t_date"))
else
	lstr_Data.adb_data[1] = 0
end if

if this.f_choose_date(lstr_Data ) <> 0 then
*/

ldw_main = iw_display.f_get_dwmain( )
if ldw_main.getitemstring(ldw_main.getrow(), "status") = 'new' then
	lstr_Data.adb_data[1] = ldw_main.getitemnumber(ldw_main.getrow(), "id")
	lstr_Data.adb_data[2] = ldw_main.getitemnumber(ldw_main.getrow(), "manage_group")
	lstr_Data.adb_data[3] = ldw_main.getitemnumber(ldw_main.getrow(), "version_id")
	lstr_Data.as_data[1] = ldw_main.getitemstring(ldw_main.getrow(), "dept_code")
	lstr_Data.as_data[2] = ldw_main.getitemstring(ldw_main.getrow(), "dept_name")
	lstr_Data.ad_data[1] = date(ldw_main.getitemdatetime(ldw_main.getrow(), "count_f_date"))
	lstr_Data.ad_data[2] = date(ldw_main.getitemdatetime(ldw_main.getrow(), "count_t_date"))
else
	lstr_Data.adb_data[1] = 0
end if



if this.f_choose_date(lstr_Data ) <> 0 then

	
	lds_doc = create t_ds_db
	lds_doc.dataobject = istr_dwo[1].s_dwo_default 
	lds_doc.f_settransobject( it_transaction)
	
	lds_orders = create t_ds_db
	lds_orders.dataobject = istr_dwo[2].s_dwo_default
	lds_orders.f_settransobject( it_transaction)
	
	if lstr_Data.adb_data[1] > 0 then
		ls_where = 'swd.object_ref_id = '+string( lstr_Data.adb_data[3])
		ids_staff_working_day.f_add_originalwhere( ls_where, ' AND ')
		ids_staff_working_day.retrieve( )
	end if
		
	//-- tạo document qua datastore --//
	ll_doc_row = this.f_set_item_doc( lds_doc) 
	if idb_doc_id = 0 then
		ldb_id = this.f_create_id( )		
		ldb_doc_id = ldb_id
		lds_doc.setitem( ll_doc_row, 'ID', ldb_id)
	elseif idb_doc_id > 0 then
		ldb_id = lds_doc.getitemnumber( ll_doc_row, 'version_id')		
	end if
	
	ll_row = this.f_set_item_orders( lds_orders, ldb_id)
	if idb_doc_id = 0 then
		ldb_id = this.f_create_id( )
		lds_orders.setitem( ll_row, 'ID', ldb_id)
		lds_doc.setitem( lds_doc.rowcount(), 'VERSION_ID', ldb_id)
	elseif idb_doc_id > 0 then
		ldb_id = lds_orders.getitemnumber( ll_row, 'id')
	end if

	//-- xoá line cũ --//
	if ids_staff_working_day.rowcount( ) > 0 then
		if not ib_upd_ins then //-- nếu là cập nhật nhân viên mới ( thêm nv) thì không xoá --//
			if idb_dept_id > 0 then
				DELETE STAFF_WORKING_DAY 
				where object_ref_id = :ldb_id 
				and trans_date between :id_f_date and :id_t_date
				using it_transaction;
			elseif idb_staff_id > 0 then
				DELETE STAFF_WORKING_DAY 
				where object_ref_id = :ldb_id 
				and trans_date between :id_f_date and :id_t_date
				and staff_id = :idb_staff_id 
				using it_transaction;
			end if
		end if
	end if

	
	ll_row = this.f_set_item_staff_shift( idb_dept_id, idb_staff_id, ldb_id,id_f_date, id_t_date)
	if ll_row > 0  then 
		if idb_dept_id > 0 and ib_insert_s then
			lds_doc.setitem(ll_doc_row, 'MANAGE_GROUP', idb_dept_id)
			lds_doc.setitem(ll_doc_row, 'COUNT_F_DATE', id_f_date)
			lds_doc.setitem(ll_doc_row, 'COUNT_T_DATE', id_t_date)
		elseif ib_update_s then
			if lstr_Data.ad_data[2] < id_t_date then
				lds_doc.setitem(ll_doc_row, 'COUNT_T_DATE', id_t_date)
			end if
		end if
	end if
	if ll_row > 0 then
		if lds_doc.update( true,false) = 1 then
			lds_doc.resetupdate( )
			if lds_orders.update( true,false) = 1 then
				lds_orders.resetupdate( )
//				if lds_staff_wd.update( true,false) = 1 then
//					lds_staff_wd.resetupdate( )
					commit using it_transaction;
//				else
//					rollback using it_transaction;
//				end if
			else
				rollback using it_transaction;
			end if
		else
			rollback using it_transaction;
		end if
	end if
end if
ldw_main.event e_retrieve( )
if ldb_doc_id = 0 then ldb_doc_id = idb_doc_id
ll_doc_row = ldw_main.find(" ID = "+string(ldb_doc_id), 1,ldw_main.rowcount( ) )
idb_doc_id = 0
if ll_doc_row > 0 then
	ldw_main.scrolltorow(ll_doc_row )
	this.f_set_detail_working_day( )
end if

end event

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_document_leave_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_document_leave_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_order_form;'
istr_dwo[1].b_ref_table_yn  = true
istr_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;doc_type;VERSION_ID'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].b_traceable = true
istr_dwo[1].s_description = 'Nghỉ phép'
istr_dwo[1].s_gb_name = ''


istr_dwo[2].s_dwo_default =  'd_order_form'
istr_dwo[2].s_dwo_form = 'd_order_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = true
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_details = 'd_staff_leave_day_grid'
istr_dwo[2].s_dwo_master = 'd_document_leave_grid;'
istr_dwo[2].s_master_keycol = 'ID;'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[2].b_ref_table_yn  = true
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE;DOC_TYPE;ID'
istr_dwo[2].b_relation_1_1 = true
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].b_focus_master = true
istr_dwo[2].s_description = ''

/*
istr_dwo[4].s_dwo_default =  'd_staff_working_day_grid'
istr_dwo[4].s_dwo_form = ''
istr_dwo[4].s_dwo_grid = 'd_staff_working_day_grid'
istr_dwo[4].b_detail = true
istr_dwo[4].b_master = false
istr_dwo[4].b_cascade_del = true
istr_dwo[4].s_dwo_master = 'd_order_form;'
istr_dwo[4].s_dwo_details = ''
istr_dwo[4].s_master_keycol = 'ID;'
istr_dwo[4].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[4].b_ref_table_yn  = false
istr_dwo[4].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[4].b_insert = true
istr_dwo[4].b_update = true
istr_dwo[4].b_delete = true
istr_dwo[4].b_query = true
istr_dwo[4].b_print = true
istr_dwo[4].b_excel = true
istr_dwo[4].b_traceable = true
istr_dwo[4].b_keyboardlocked = true
istr_dwo[4].b_focus_master = false
istr_dwo[4].s_description = ''
*/
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
	gf_messagebox('m.c_shift.f_calc_workcount.01','Thông báo','Chưa nhập đủ giờ vào giờ ra','exclamation','ok',1)
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
		gf_messagebox('m.c_shift.f_calc_workcount.02','Thông báo','Chưa nhập số giờ làm việc / ngày','exclamation','ok',1)
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

public function double f_get_dept_id (string vs_dept_name);double	ldb_dept_id

select id into :ldb_dept_id
from object 
where upper(trim(name)) = upper(trim(:vs_dept_name))
		and object_ref_table = 'LEGAL_ENTITY' using SQLCA;
return ldb_dept_id
end function

public function integer f_set_item_doc (ref t_ds_db rds_doc);b_obj_instantiate		lb_obj_ins
t_dw_mpl	ldw_doc
double		ldb_id
string			ls_autonumber
long			ll_row
any			laa_data[]
	
ldw_doc = iw_display.f_get_dw( istr_dwo[1].s_dwo_default )
if idb_doc_id = 0 then
	ll_row = rds_doc.event e_insertrow( 0)
	rds_doc.setitem( ll_row, 'document_date',gd_session_date )
	ls_autonumber = lb_obj_ins.f_get_autonumber( ldw_doc, 'code', rds_doc, ll_row,this)
	rds_doc.setitem( ll_row, 'code', ls_autonumber)
	rds_doc.setitem( ll_row, 'object_ref_table', 'ORDERS')
	rds_doc.setitem( ll_row, 'doc_type', 'ASSIGN_SHIFT')
	rds_doc.setitem( ll_row, 'status', 'new')
	rds_doc.setitem( ll_row, 'HANDLED_BY', gi_userid)
elseif idb_doc_id > 0 then
	laa_data[1] = idb_doc_id
	rds_doc.f_add_where( 'id', laa_data)
	ll_row = rds_doc.retrieve()
end if

return ll_row
end function

public function integer f_set_item_orders (ref t_ds_db rds_orders, double vdb_doc_id);
long			ll_row
any			laa_data[]
int				li_count

if idb_doc_id = 0 then
	select count(id) into :li_count
	from orders 
	where object_ref_id = :vdb_doc_id using sqlca;
	ll_row = rds_orders.event e_insertrow( 0)
	rds_orders.setitem( ll_row, 'object_ref_id', vdb_doc_id)
	rds_orders.setitem( ll_row, 'object_ref_table', 'DOCUMENT')
	rds_orders.setitem( ll_row, 'doc_type', 'ASSIGN_SHIFT')
	rds_orders.setitem( ll_row, 'version_no', li_count+1)
elseif idb_doc_id > 0 then
	laa_data[1] = vdb_doc_id
	rds_orders.f_add_where( 'id', laa_data)
	ll_row = rds_orders.retrieve()
end if

return ll_row
end function

public function integer f_choose_date ();/**************************************
Chọn ngày , phòng ban hoặc nhân viên để phân công ca
idb_sh_id là ca mặc định ban đầu được set cho tất cả
***************************************/
u_choose_date		lpo_choose_date
c_string				lc_string
double				ldb_doc_id
string					ls_date,las_data[]
long					ll_count

lpo_choose_date = create u_choose_date
lpo_choose_date.is_object_type = lc_string.f_globalreplace( this.classname( ) , 'u_', '')
openwithparm( s_wr_multi, lpo_choose_date)
ls_date = Message.StringParm
if ls_date <> '' then
	lc_string.f_stringtoarray( ls_date, ';', las_data)
	id_f_date = date(las_data[1])
	id_t_date = date(las_data[2])
	idb_staff_id = double(las_data[3])
	idb_dept_id = double(las_data[4])
	idb_sh_id = double(las_data[5])
	idb_sh_id1 = double(las_data[6])
	idb_sh_id2 = double(las_data[7])
	idb_sh_id3 = double(las_data[8])
	idb_sh_id4 = double(las_data[9])
	idb_sh_id5 = double(las_data[10])
	id_f_date1 = date(las_data[11])
	id_t_date1 = date(las_data[12])
	id_f_date2 = date(las_data[13])
	id_t_date2 = date(las_data[14])
	id_f_date3 = date(las_data[15])
	id_t_date3 = date(las_data[16])
	id_f_date4 = date(las_data[17])
	id_t_date4 = date(las_data[18])
	id_f_date5 = date(las_data[19])
	id_t_date5 = date(las_data[20])
	id_f_date6 = date(las_data[21])
	id_t_date6 = date(las_data[22])
	if upperbound(las_data) = 24 then
		idb_doc_id = double(las_data[23])
	end if
	if las_data[upperbound(las_data)] = 'update' then
		ib_update_s = true
		ib_insert_s = false
		ib_upd_ins = false
		ib_delete_s = false
	elseif las_data[upperbound(las_data)] = 'insert' then
		ib_insert_s = true
		ib_update_s = false
		ib_upd_ins = false
		ib_delete_s = false
	elseif las_data[upperbound(las_data)] = 'delete' then
		ib_insert_s = false
		ib_update_s = false
		ib_upd_ins = false
		ib_delete_s = true
	else
		ib_upd_ins = true
		ib_insert_s = false
		ib_update_s = false
		ib_delete_s = false
	end if
else
	return 0
end if
return 1
end function

public function integer f_set_detail_working_day ();t_dw_mpl		ldw_wd_form,ldw_main
string				ls_staff_code, ls_where
date				ld_trans_date,ld_f_date,ld_t_date
int					li_idx,li_ins_row,li_cnt
double			ldb_version


//ldw_wd =  iw_display.f_get_dw( istr_dwo[4].s_dwo_default )
//ldw_wd.event e_refresh( )

ldw_wd_form =  iw_display.f_get_dw( iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default )
ldw_main = iw_display.f_get_dwmain( )
if ldw_main.rowcount( ) = 0 then
	ldw_wd_form.reset( )
	return 0
end if
ld_f_date = date(ldw_main.getitemdatetime( ldw_main.getrow(), 'count_f_date'))
ld_t_date = date(ldw_main.getitemdatetime( ldw_main.getrow(), 'count_t_date'))
ldb_version = ldw_main.getitemnumber( ldw_main.getrow(), 'version_id')
ls_where = 'swd.object_ref_id = '+string(ldb_version)
ids_staff_working_day.f_add_originalwhere( ls_where, ' AND ')
ids_staff_working_day.retrieve( )
	
	
if ldw_wd_form.rowcount( ) > 0 then ldw_wd_form.reset( )
for li_idx = 1 to ids_staff_working_day.rowcount( )
	if ls_staff_code <> ids_staff_working_day.getitemstring( li_idx, 'staff_code') then
		li_ins_row = ldw_wd_form.insertrow( 0)
		ld_trans_date = ld_f_date
		li_cnt = 0
		Do While ld_trans_date <= ld_t_date
			li_cnt ++
			if li_cnt <= 31 then
				ldw_wd_form.setitem( li_ins_row, 'name_' + string(li_cnt) , ld_trans_date )
			end if
			ld_trans_date = RelativeDate ( ld_trans_date, 1 )
		Loop
		li_cnt = 1
	else
		li_ins_row = ldw_wd_form.rowcount( )
		li_cnt += 1
	end if
	if li_cnt > 31 then continue
	ld_trans_date = date(ids_staff_working_day.getitemdatetime( li_idx, 'trans_date'))
	ldw_wd_form.setitem( li_ins_row, 'staff_code', ids_staff_working_day.getitemstring( li_idx, 'staff_code'))
	ldw_wd_form.setitem( li_ins_row, 'staff_name', ids_staff_working_day.getitemstring( li_idx, 'staff_name'))
	ldw_wd_form.setitem( li_ins_row, 'dept_name', ids_staff_working_day.getitemstring( li_idx, 'dept_name'))
	ldw_wd_form.setitem( li_ins_row, 'sh_code_' + string(li_cnt), ids_staff_working_day.getitemstring( li_idx, 'shift_code'))
//	ldw_wd_form.setitem( li_ins_row, 'name_' + string(li_cnt) , ld_trans_date )
//	ldw_wd_form.setitem( li_ins_row, 'name_' + string(li_cnt) , string(day(ld_trans_date)) + '/' + string(month(ld_trans_date)) ) 
	 
	
	ls_staff_code = ids_staff_working_day.getitemstring( li_idx, 'staff_code')
next
return 0
end function

public function long f_get_ds_staff (ref t_ds_db rds_staff);t_ds_db	lds_staff
string		ls_filter
date		ld_f_date

lds_staff = create t_ds_db
lds_staff.dataobject = 'ds_info_staff_grid'
lds_staff.f_settransobject( SQLCA)
lds_staff.event e_retrieve( )
if idb_staff_id > 0 then
	ls_filter = 'staff_id = ' + string(idb_staff_id)
elseif idb_dept_id > 0 then
	ls_filter = 'dept_id = ' +string(idb_dept_id)
else
	ls_filter = ''
end if
lds_staff.setfilter( ls_filter)
lds_staff.filter( )
//lds_staff.rowscopy( 1, /*long e*/, /*dwbuffer f*/, /*datastore d*/, /*long i*/, /*dwbuffer t */)

destroy lds_staff
//Do While ld_f_date <= id_t_date
//		li_days ++
//		ls_shift_code = rds_import.getitemstring(ll_idx,'workday_'+string(li_days))
//		if isnull(ls_shift_code) then ls_shift_code = ''
//		li_find = lds_shift.find( "trim(code) = trim('"+ls_shift_code+"')", 1, lds_shift.rowcount( ) )
//		if li_find > 0 then ldb_shift_id = lds_shift.getitemnumber( li_find, 'ID')
//		ll_row = rds_staff_wd.event e_insertrow( 0)
//		ldb_id = this.f_create_id( )
//		rds_staff_wd.setitem( ll_row, 'object_ref_id', vdb_orders_id)
//		rds_staff_wd.setitem( ll_row, 'object_ref_table', 'ORDERS')
//		if ldb_dept_id > 0 then rds_staff_wd.setitem( ll_row, 'dept_id', ldb_dept_id)
//		rds_staff_wd.setitem( ll_row, 'staff_id', ldb_staff_id)
//		if ldb_shift_id > 0 then rds_staff_wd.setitem( ll_row, 'shift_id', ldb_shift_id)
//		rds_staff_wd.setitem( ll_row, 'id', ldb_id)
//		rds_staff_wd.setitem( ll_row, 'trans_date', RelativeDate ( ld_f_date, 0 ))
//		ld_f_date = RelativeDate ( ld_f_date, 1 )
//	Loop
//	if ld_f_date >= id_t_date then li_days = 0

return 0
end function

public function integer f_set_item_staff_shift (ref t_ds_db rds_staff_wd, double vdb_orders_id, ref t_ds_db rds_import, string vs_import_yn);b_obj_instantiate	lb_obj_ins
t_ds_db		lds_shift,lds_dept

boolean		lb_set_item
double		ldb_staff_id,ldb_shift_id,ldb_dept_id,ldb_id,ldb_dept_old_id
string			ls_staff_code,ls_shift_code,ls_dept_name,ls_mess,ls_sql,ls_delete
date			ld_f_date
long			ll_row,ll_idx,ll_rowcount,ll_find
any			laa_data[]
int				li_days,li_find


ll_rowcount = rds_import.rowcount()
if ll_rowcount < 1 then return 1
lds_shift = create t_ds_db
lds_shift.dataobject = 'd_shift_grid'
lds_shift.f_settransobject( sqlca)
lds_shift.event e_retrieve( )

if idb_dept_id = 0 and upper(vs_import_yn) = 'Y' then
	lds_dept = create t_ds_db
	lds_dept.dataobject = 'd_dept_grid'
	lds_dept.f_settransobject( sqlca)
	laa_data[1] = 'LEGAL_ENTITY'
	lds_dept.f_add_where( 'object_ref_table;', laa_data)
	lds_dept.event e_retrieve( )
end if

if idb_dept_id = 0 then rds_import.setsort( 'dept_name asc')
for ll_idx = 1 to ll_rowcount	
	if idb_staff_id = 0 then
		ls_staff_code = rds_import.getitemstring( ll_idx, 'staff_code')
		ldb_staff_id = lb_obj_ins.f_get_id( ls_staff_code)
	else
		ldb_staff_id = idb_staff_id
	end if
	if ldb_staff_id = -1 or isnull(ldb_staff_id) then continue
	
	if idb_dept_id = 0 and upper(vs_import_yn) = 'Y' then
		ls_dept_name =  rds_import.getitemstring( ll_idx, 'dept_name')
		li_find = lds_dept.find( "upper(trim(name)) = upper(trim('"+ls_dept_name+"'))", 1, lds_dept.rowcount())
		if li_find > 0 then ldb_dept_id = lds_dept.getitemnumber(li_find,'ID')	
	else
		ldb_dept_id = rds_import.getitemnumber(ll_idx,'dept_id')
	end if
	
	ld_f_date = id_f_date
	if isnull(ldb_staff_id) or ldb_staff_id = 0 then continue
	if ib_delete_s then
		ls_delete += string(ldb_staff_id) + ','
	else
		if vs_import_yn = 'Y' then
			ll_find = ids_staff_working_day.find( 'staff_id = ' + string(ldb_staff_id), 1, ids_staff_working_day.rowcount())
			if ll_find = 0 then
				Do While ld_f_date <= id_t_date
					li_days ++
					if idb_sh_id = 0 then
						ls_shift_code = rds_import.getitemstring(ll_idx,'workday_'+string(li_days))
						if isnull(ls_shift_code) then ls_shift_code = ''
						li_find = lds_shift.find( "trim(code) = trim('"+ls_shift_code+"')", 1, lds_shift.rowcount( ) )
						if li_find > 0 then ldb_shift_id = lds_shift.getitemnumber( li_find, 'ID')
					else
						ldb_shift_id = idb_sh_id
					end if
					ll_row = rds_staff_wd.event e_insertrow( 0)
					ldb_id = this.f_create_id( )
					rds_staff_wd.setitem( ll_row, 'object_ref_id', vdb_orders_id)
					rds_staff_wd.setitem( ll_row, 'object_ref_table', 'ORDERS')
					if ldb_dept_id > 0 then rds_staff_wd.setitem( ll_row, 'dept_id', ldb_dept_id)
					rds_staff_wd.setitem( ll_row, 'staff_id', ldb_staff_id)
					if ldb_shift_id > 0 then rds_staff_wd.setitem( ll_row, 'shift_id', ldb_shift_id)
					rds_staff_wd.setitem( ll_row, 'id', ldb_id)
					rds_staff_wd.setitem( ll_row, 'trans_date', RelativeDate ( ld_f_date, 0 ))
					ld_f_date = RelativeDate ( ld_f_date, 1 )
				Loop
				if ld_f_date >= id_t_date then li_days = 0
			else
			end if
		else
			ll_find = ids_staff_working_day.find( 'staff_id = ' + string(ldb_staff_id), 1, ids_staff_working_day.rowcount())
			if ll_find = 0 then
				lb_set_item = true
			elseif ll_find > 0 then
				ldb_dept_old_id = ids_staff_working_day.getitemnumber( ll_find, 'dept_id')
				if ldb_dept_old_id <> ldb_dept_id then
					ls_mess += ls_staff_code + ';'
					ls_delete += string(ldb_staff_id) + ','
					lb_set_item = false
				else
					lb_set_item = true
				end if
			end if
			if lb_set_item then
				this.idb_doc_id = 0
				if id_f_date1 <= id_t_date1 then this.f_set_item_staff_shift_week( rds_import, rds_staff_wd, id_f_date1,id_t_date1, idb_sh_id, ldb_staff_id, vdb_orders_id,ldb_dept_id)
				if id_t_date1 < id_f_date2 then this.f_set_item_staff_shift_week( rds_import, rds_staff_wd, id_f_date2,id_t_date2, idb_sh_id1, ldb_staff_id, vdb_orders_id,ldb_dept_id)
				if id_t_date2 <= id_f_date3 then this.f_set_item_staff_shift_week( rds_import, rds_staff_wd, id_f_date3,id_t_date3, idb_sh_id2, ldb_staff_id, vdb_orders_id,ldb_dept_id)
				if id_t_date3 <= id_t_date4 then this.f_set_item_staff_shift_week( rds_import, rds_staff_wd, id_f_date4,id_t_date4, idb_sh_id3, ldb_staff_id, vdb_orders_id,ldb_dept_id)
				if id_t_date4 <= id_t_date5 then this.f_set_item_staff_shift_week( rds_import, rds_staff_wd, id_f_date5,id_t_date5, idb_sh_id4, ldb_staff_id, vdb_orders_id,ldb_dept_id)
				if id_t_date5 <= id_t_date6 then this.f_set_item_staff_shift_week( rds_import, rds_staff_wd, id_f_date6,id_t_date4, idb_sh_id5, ldb_staff_id, vdb_orders_id,ldb_dept_id)
			end if
		end if
	end if
next
destroy lds_shift
destroy lds_dept
if ib_delete_s and ls_delete <> '' then
	ls_sql = 'DELETE staff_working_day '
	ls_sql += ' WHERE staff_id in (' + ls_delete + '0' + ") AND TRANS_DATE BETWEEN TO_DATE('" + string(id_f_date) + "','dd/mm/yyyy') AND TO_DATE('" + string(id_t_date) + "','dd/mm/yyyy')"
	execute immediate :ls_sql using SQLCA;
	commit using SQLCA;
	return 1
end if
if ls_mess <> '' then
	if gf_messagebox('m.u_assign_shift.f_set_item_staff_shift.01','Thông báo','Các nhân viên ' + ls_mess + ' đã được xếp ca cho phòng/nhóm cũ, bạn có muốn xóa xếp ca cũ và thực hiện lại xếp ca mới?','question','yesno',2) = 1 then
		ls_sql = 'DELETE staff_working_day '
		ls_sql += ' WHERE staff_id in (' + ls_delete + '0' + ") AND TRANS_DATE BETWEEN TO_DATE('" + string(id_f_date) + "','dd/mm/yyyy') AND TO_DATE('" + string(id_t_date) + "','dd/mm/yyyy')"
		execute immediate :ls_sql using SQLCA;
		commit using SQLCA;
		gf_messagebox('m.u_assign_shift.f_set_item_staff_shift.02','Thông báo','Đã xóa xong, vui lòng cập nhật lại ca cho nhóm mới','exclamation','ok',1)
	end if
end if
return rds_staff_wd.ModifiedCount( )
end function

public function integer f_set_item_staff_shift_week (ref t_ds_db vds_staff, ref t_ds_db rds_staff_wd, date vd_f_date, date vd_t_date, double vdb_sh_id, double vdb_staff_id, double vdb_orders_id, double vdb_dept_id);double 	ldb_id,ldb_doc_id
string		ls_cols
long		ll_row,ll_rowcount
date		ld_f_date
any		laa_data[]
int			li_days
	
	if vdb_sh_id = 0 then return 0
	if idb_doc_id = 0 then
		ld_f_date = vd_f_date
		Do While ld_f_date <= vd_t_date
			ll_row = rds_staff_wd.event e_insertrow( 0)
			ldb_id = this.f_create_id( )
			rds_staff_wd.setitem( ll_row, 'object_ref_id', vdb_orders_id)
			rds_staff_wd.setitem( ll_row, 'object_ref_table', 'ORDERS')
			rds_staff_wd.setitem( ll_row, 'dept_id', vdb_dept_id)
			rds_staff_wd.setitem( ll_row, 'staff_id', vdb_staff_id)
			if idb_sh_id > 0 then rds_staff_wd.setitem( ll_row, 'shift_id', vdb_sh_id)
			rds_staff_wd.setitem( ll_row, 'id', ldb_id)
			rds_staff_wd.setitem( ll_row, 'trans_date', RelativeDate ( ld_f_date, 0 ))
			ld_f_date = RelativeDate ( ld_f_date, 1 )
		Loop
	elseif idb_doc_id > 0 then
		if rds_staff_wd.rowcount() =  0 then
			laa_data[1] = vdb_orders_id
			rds_staff_wd.f_add_where( 'object_ref_id', laa_data)
			rds_staff_wd.setsort('trans_date asc, staff_id asc')
			rds_staff_wd.retrieve()
		else
			
		end if
		if ib_upd_ins then
			rds_staff_wd.setfilter("staff_id = " + string(vdb_staff_id) + " and trans_date >= date('" + string(vd_f_date) + "') and trans_date <= date('" + string(vd_t_date) + "')")
			rds_staff_wd.filter()
			rds_staff_wd.sort()
			ll_rowcount = rds_staff_wd.rowcount()
			if ll_rowcount > 0 then
				for ll_row = 1 to ll_rowcount
					if idb_sh_id > 0 then rds_staff_wd.setitem( ll_row, 'shift_id', vdb_sh_id)
				next
			else
				ldb_doc_id = idb_doc_id
				idb_doc_id = 0
				this.f_set_item_staff_shift_week( vds_staff, rds_staff_wd, vd_f_date, vd_t_date, vdb_sh_id,vdb_staff_id, vdb_orders_id, vdb_dept_id)
				idb_doc_id = ldb_doc_id
			end if
			return 1
		elseif ib_update_s then
			rds_staff_wd.setfilter("staff_id = " + string(vdb_staff_id) + " and trans_date >= date('" + string(vd_f_date) + "') and trans_date <= date('" + string(vd_t_date) + "')")
			rds_staff_wd.filter()
			rds_staff_wd.sort()
			ll_rowcount = rds_staff_wd.rowcount()
			if ll_rowcount > 0 then
				for ll_row = 1 to ll_rowcount
					if idb_sh_id > 0 then rds_staff_wd.setitem( ll_row, 'shift_id', vdb_sh_id)
				next
			end if
			return 1
		elseif ib_insert_s then
			rds_staff_wd.setfilter("staff_id = " + string(vdb_staff_id) + " and trans_date >= date('" + string(vd_f_date) + "') and trans_date <= date('" + string(vd_t_date) + "')")
			rds_staff_wd.filter()
			rds_staff_wd.sort()
			ll_rowcount = rds_staff_wd.rowcount()
			if ll_rowcount = 0 then
				ldb_doc_id = idb_doc_id
				idb_doc_id = 0
				this.f_set_item_staff_shift_week( vds_staff, rds_staff_wd, vd_f_date, vd_t_date, vdb_sh_id,vdb_staff_id, vdb_orders_id, vdb_dept_id)
				idb_doc_id = ldb_doc_id
			end if
			return 1
		end if
	end if
return 0
end function

public function string f_get_dept_id_string (double vdb_dept_id);t_ds_db		lds_full_dept
string			ls_rtn
long			ll_retr,ll_idx

//lds_full_dept = create t_ds_db
//lds_full_dept.dataobject = 'ds_full_dept'
//lds_full_dept.f_settransobject( SQLCA)
//ll_retr = lds_full_dept.retrieve(vdb_dept_id )
//if ll_retr >  0 then
//	for ll_idx = 1 to ll_retr
//		if ll_idx = ll_retr then
//			ls_rtn += string(lds_full_dept.getitemnumber(ll_idx,'id'))
//		else
//			ls_rtn += string(lds_full_dept.getitemnumber(ll_idx,'id')) +','
//		end if
//	next
//	if ls_rtn <> '' then ls_rtn = ' IN (' + ls_rtn + ') '
//	ib_group_dept = true
//else
	ib_group_dept = false
	ls_rtn = ' = ' + string(vdb_dept_id)
//end if
//destroy lds_full_dept 
return ls_rtn
end function

public function integer f_choose_date (s_str_data vstr_data);/**************************************
Chọn ngày , phòng ban hoặc nhân viên để phân công ca
idb_sh_id là ca mặc định ban đầu được set cho tất cả
***************************************/
u_choose_date		lpo_choose_date
c_string				lc_string
double				ldb_doc_id
string					ls_date,las_data[]
long					ll_count

lpo_choose_date = create u_choose_date
lpo_choose_date.is_object_type = lc_string.f_globalreplace( this.classname( ) , 'u_', '')
lpo_choose_date.istr_data = vstr_Data
openwithparm( s_wr_multi, lpo_choose_date)
ls_date = Message.StringParm
setnull(Message.StringParm)

if ls_date <> '' then
	lc_string.f_stringtoarray( ls_date, ';', las_data)
	id_f_date = date(las_data[1])
	id_t_date = date(las_data[2])
	idb_staff_id = double(las_data[3])
	idb_dept_id = double(las_data[4])
	idb_sh_id = double(las_data[5])
	idb_sh_id1 = double(las_data[6])
	idb_sh_id2 = double(las_data[7])
	idb_sh_id3 = double(las_data[8])
	idb_sh_id4 = double(las_data[9])
	idb_sh_id5 = double(las_data[10])
	id_f_date1 = date(las_data[11])
	id_t_date1 = date(las_data[12])
	id_f_date2 = date(las_data[13])
	id_t_date2 = date(las_data[14])
	id_f_date3 = date(las_data[15])
	id_t_date3 = date(las_data[16])
	id_f_date4 = date(las_data[17])
	id_t_date4 = date(las_data[18])
	id_f_date5 = date(las_data[19])
	id_t_date5 = date(las_data[20])
	id_f_date6 = date(las_data[21])
	id_t_date6 = date(las_data[22])
	if upperbound(las_data) = 24 then
		idb_doc_id = double(las_data[23])
	end if
	if las_data[upperbound(las_data)] = 'update' then
		ib_update_s = true
		ib_insert_s = false
		ib_upd_ins = false
		ib_delete_s = false
	elseif las_data[upperbound(las_data)] = 'insert' then
		ib_insert_s = true
		ib_update_s = false
		ib_upd_ins = false
		ib_delete_s = false
	elseif las_data[upperbound(las_data)] = 'delete' then
		ib_insert_s = false
		ib_update_s = false
		ib_upd_ins = false
		ib_delete_s = true
	else
		ib_upd_ins = true
		ib_insert_s = false
		ib_update_s = false
		ib_delete_s = false
	end if
else
	return 0
end if
return 1
end function

public function integer f_set_item_staff_shift (double vdb_dept_id, double vdb_staff_id, double vdb_orders_id, date vd_f_date, date vd_t_date);long ll_num_day

ll_num_day = daysafter(vd_f_date,vd_t_date ) + 1
if ll_num_day < 1 then return 0

if not ib_upd_ins then
	if vdb_dept_id > 0 then
		
		INSERT INTO staff_working_day (  ID  ,
													  OBJECT_REF_ID ,
												  OBJECT_REF_TABLE ,  
												  COMPANY_ID ,
												  BRANCH_ID   ,
												  DEPT_ID      ,
												  STAFF_ID    , 
												  SHIFT_ID   ,
												  TRANS_DATE ,											  											   
												  CREATED_BY    ,
												  CREATED_DATE ,
												  LAST_MDF_BY   ,
												  LAST_MDF_DATE  )
			 SELECT  SEQ_TABLE_ID.nextval,
						:vdb_orders_id,
						 'ORDERS',
						 o_staff.company_id,   
						 o_staff.branch_id,   
						 :vdb_dept_id,
						 o_staff.id,
						case when WORKDAY.f_date between :id_f_date1 and :id_t_date1  then :idb_sh_id
								when WORKDAY.f_date between :id_f_date2 and :id_t_date2  then :idb_sh_id1
								 when WORKDAY.f_date between :id_f_date3 and :id_t_date3  then :idb_sh_id2
								 when WORKDAY.f_date between :id_f_date4 and :id_t_date4  then :idb_sh_id3
								 when WORKDAY.f_date between :id_f_date5 and :id_t_date5  then :idb_sh_id4
								 when WORKDAY.f_date between :id_f_date5 and :id_t_date5  then :idb_sh_id4
								 when WORKDAY.f_date between :id_f_date6 and :id_t_date6  then :idb_sh_id5
								else null end  shift,
						WORKDAY.f_date,
						:gi_userid,
						sysdate,
						:gi_userid,
						sysdate		
			 FROM 
					object o_staff 
					join  staff on staff.object_ref_id = o_staff.id 
					join         (select :id_f_date + level - 1 f_date
							 from dual 
							 connect by level <= :ll_num_day) workday on 1=1
			WHERE staff.dept_id = :vdb_dept_id using it_transaction;
	elseif vdb_staff_id > 0 then
		INSERT INTO staff_working_day (  ID  ,
													  OBJECT_REF_ID ,
												  OBJECT_REF_TABLE ,  
												  COMPANY_ID ,
												  BRANCH_ID   ,
												  DEPT_ID      ,
												  STAFF_ID    , 
												  SHIFT_ID   ,
												  TRANS_DATE ,											  											   
												  CREATED_BY    ,
												  CREATED_DATE ,
												  LAST_MDF_BY   ,
												  LAST_MDF_DATE  )
			 SELECT  SEQ_TABLE_ID.nextval,
						:vdb_orders_id,
						 'ORDERS',
						 o_staff.company_id,   
						 o_staff.branch_id,   
						 staff.dept_id,
						 o_staff.id,
						case when WORKDAY.f_date between :id_f_date1 and :id_t_date1  then :idb_sh_id
								when WORKDAY.f_date between :id_f_date2 and :id_t_date2  then :idb_sh_id1
								 when WORKDAY.f_date between :id_f_date3 and :id_t_date3  then :idb_sh_id2
								 when WORKDAY.f_date between :id_f_date4 and :id_t_date4  then :idb_sh_id3
								 when WORKDAY.f_date between :id_f_date5 and :id_t_date5  then :idb_sh_id4
								 when WORKDAY.f_date between :id_f_date5 and :id_t_date5  then :idb_sh_id4
								 when WORKDAY.f_date between :id_f_date6 and :id_t_date6  then :idb_sh_id5
								else null end  shift,
						WORKDAY.f_date,
						:gi_userid,
						sysdate,
						:gi_userid,
						sysdate		
			 FROM 
					object o_staff 
					join  staff on staff.object_ref_id = o_staff.id 
					join         (select :id_f_date + level - 1 f_date
							 from dual 
							 connect by level <= :ll_num_day) workday on 1=1
			WHERE o_staff.id = :vdb_staff_id using it_transaction;	
	end if
else //-- Cập nhật thêm nhân viên mới
	if vdb_dept_id > 0 then
		INSERT INTO staff_working_day (  ID  ,
													  OBJECT_REF_ID ,
												  OBJECT_REF_TABLE ,  
												  COMPANY_ID ,
												  BRANCH_ID   ,
												  DEPT_ID      ,
												  STAFF_ID    , 
												  SHIFT_ID   ,
												  TRANS_DATE ,											  											   
												  CREATED_BY    ,
												  CREATED_DATE ,
												  LAST_MDF_BY   ,
												  LAST_MDF_DATE  )
			 SELECT  SEQ_TABLE_ID.nextval,
						:vdb_orders_id,
						 'ORDERS',
						 o_staff.company_id,   
						 o_staff.branch_id,   
						 :vdb_dept_id,
						 o_staff.id,
						case when WORKDAY.f_date between :id_f_date1 and :id_t_date1  then :idb_sh_id
								when WORKDAY.f_date between :id_f_date2 and :id_t_date2  then :idb_sh_id1
								 when WORKDAY.f_date between :id_f_date3 and :id_t_date3  then :idb_sh_id2
								 when WORKDAY.f_date between :id_f_date4 and :id_t_date4  then :idb_sh_id3
								 when WORKDAY.f_date between :id_f_date5 and :id_t_date5  then :idb_sh_id4
								 when WORKDAY.f_date between :id_f_date5 and :id_t_date5  then :idb_sh_id4
								 when WORKDAY.f_date between :id_f_date6 and :id_t_date6  then :idb_sh_id5
								else null end  shift,
						WORKDAY.f_date,
						:gi_userid,
						sysdate,
						:gi_userid,
						sysdate		
			 FROM 
					object o_staff 
					join  staff on staff.object_ref_id = o_staff.id 
					join         (select :id_f_date + level - 1 f_date
							 from dual 
							 connect by level <= :ll_num_day) workday on 1=1
			WHERE staff.dept_id = :vdb_dept_id
			and not exists (select null from staff_working_day swd where swd.object_ref_id = :vdb_orders_id 
																					and swd.staff_id =  o_staff.id )
			using it_transaction;
	elseif vdb_staff_id > 0 then
		INSERT INTO staff_working_day (  ID  ,
													  OBJECT_REF_ID ,
												  OBJECT_REF_TABLE ,  
												  COMPANY_ID ,
												  BRANCH_ID   ,
												  DEPT_ID      ,
												  STAFF_ID    , 
												  SHIFT_ID   ,
												  TRANS_DATE ,											  											   
												  CREATED_BY    ,
												  CREATED_DATE ,
												  LAST_MDF_BY   ,
												  LAST_MDF_DATE  )
			 SELECT  SEQ_TABLE_ID.nextval,
						:vdb_orders_id,
						 'ORDERS',
						 o_staff.company_id,   
						 o_staff.branch_id,   
						 staff.dept_id,
						 o_staff.id,
						case when WORKDAY.f_date between :id_f_date1 and :id_t_date1  then :idb_sh_id
								when WORKDAY.f_date between :id_f_date2 and :id_t_date2  then :idb_sh_id1
								 when WORKDAY.f_date between :id_f_date3 and :id_t_date3  then :idb_sh_id2
								 when WORKDAY.f_date between :id_f_date4 and :id_t_date4  then :idb_sh_id3
								 when WORKDAY.f_date between :id_f_date5 and :id_t_date5  then :idb_sh_id4
								 when WORKDAY.f_date between :id_f_date5 and :id_t_date5  then :idb_sh_id4
								 when WORKDAY.f_date between :id_f_date6 and :id_t_date6  then :idb_sh_id5
								else null end  shift,
						WORKDAY.f_date,
						:gi_userid,
						sysdate,
						:gi_userid,
						sysdate		
			 FROM 
					object o_staff 
					join  staff on staff.object_ref_id = o_staff.id 
					join         (select :id_f_date + level - 1 f_date
							 from dual 
							 connect by level <= :ll_num_day) workday on 1=1
			WHERE o_staff.id = :vdb_staff_id 
			and not exists (select null from staff_working_day swd where swd.object_ref_id = :vdb_orders_id 
																					and swd.staff_id =  o_staff.id )
			using it_transaction;		
	end if
end if
return 1
end function

public subroutine f_set_dwo_tabpage ();
iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
iastr_dwo_tabpage[1].i_upperpart_height  =730
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_staff_leave_day_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_staff_leave_day_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_source = ''
iastr_dwo_tabpage[1].str_dwo[1].s_col_source = ''
iastr_dwo_tabpage[1].str_dwo[1].s_col_target = ''
iastr_dwo_tabpage[1].str_dwo[1].b_master = false
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_shared = false
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_order_form'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol = 'ID'
iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID'
iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = true
iastr_dwo_tabpage[1].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE'
iastr_dwo_tabpage[1].str_dwo[1].b_insert = true
iastr_dwo_tabpage[1].str_dwo[1].b_update = true
iastr_dwo_tabpage[1].str_dwo[1].b_delete = true
iastr_dwo_tabpage[1].str_dwo[1].b_query = true
iastr_dwo_tabpage[1].str_dwo[1].b_print = true
iastr_dwo_tabpage[1].str_dwo[1].b_excel = true
iastr_dwo_tabpage[1].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Chi tiết nghỉ phép'
end subroutine

on c_leave_form.create
call super::create
end on

on c_leave_form.destroy
call super::destroy
end on

event constructor;call super::constructor;//b_importfile;
ib_changed_dwo_4edit = false
is_display_model = 'up_1d_lo_tb'
ib_display_text = false
is_object_title = 'Nghỉ phép'

istr_actionpane[1].s_button_name =  'b_add;b_insert;b_modify; b_filteron;b_query;b_importfile;b_refresh;b_delete;'

istr_actionpane[1].s_description = is_object_title


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
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_filteron;b_query;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_filteron;b_query;b_refresh;b_delete;'
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query; b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;'
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

event destructor;call super::destructor;if isvalid(ids_staff_working_day) then destroy ids_staff_working_day
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;t_dw_mpl		ldw_form
long				ll_insertrow
if pos(rpo_dw.dataobject,'d_document_leave_grid') > 0 then	 
	rpo_dw.setitem( vl_currentrow, 'document_date',gd_session_date )
	rpo_dw.setitem( vl_currentrow, 'object_ref_table', 'ORDERS')
	rpo_dw.setitem( vl_currentrow, 'doc_type', 'LEAVE_FORM')
	rpo_dw.setitem( vl_currentrow, 'status', 'new')
	rpo_dw.setitem( vl_currentrow, 'HANDLED_BY', gi_userid)	 
	ldw_form = iw_display.f_get_dw('d_order_form' )
	ll_insertrow = ldw_form.event e_addrow( ) 
	ldw_form.setitem( ll_insertrow, 'object_ref_table', 'DOCUMENT')
	ldw_form.setitem( ll_insertrow, 'doc_type', 'LEAVE_FORM')
	ldw_form.setitem( ll_insertrow, 'version_no', 1)		
		
end if
return 0
end event

event e_dw_e_vscroll;// override //
return 0
end event

event e_window_open;call super::e_window_open;t_dw_mpl		ldw_main
any				laa_value[]

//--form parm--//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '=LEAVE_FORM'
ldw_main.f_add_where('doc_type;',laa_value[])

return ancestorreturnvalue
end event

