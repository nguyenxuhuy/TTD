$PBExportHeader$c_fiscal_period.sru
forward
global type c_fiscal_period from s_object_display
end type
end forward

global type c_fiscal_period from s_object_display
event type integer e_action_create_fiscal_year ( )
end type
global c_fiscal_period c_fiscal_period

type variables
double				idb_class_id
string					is_base_code
end variables

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
public function boolean f_is_period_closed (string vs_stop_type, date vd_trans_date)
public function integer f_get_period_first_last_date (date v_trans_date, ref date rd_firstdate, ref date rd_lastdate)
end prototypes

event type integer e_action_create_fiscal_year();date					ld_f_date, ld_t_date, ld_f_date_next, ld_t_date_next
long					ll_row, ll_nbr_in_period, ll_nbr_of_period, ll_insertrow, ll_fiscal
string					ls_periodtype, ls_close_period_yn, ls_close_year_yn
b_popup_data		lb_popup_input
t_ds					lds_parm
t_dw_mpl			ldw_fiscal_period
c_datetime			lc_date
t_transaction		lt_transaction

connect using it_transaction;
//-- lấy ngày cuối cùng của năm tài chính cuối --//
ldw_fiscal_period = this.iw_display.f_get_dw( 'd_fiscal_period_grid')
if isvalid(ldw_fiscal_period) then
	if ldw_fiscal_period.rowcount() > 0 then
		ld_f_date = date(ldw_fiscal_period.Describe("Evaluate('Max(to_date)', 0)"))		
		ld_f_date =   relativeDate(ld_f_date, 1)
		ld_t_date = lc_date.f_lastdaymonthofyear( ld_f_date)
		ll_fiscal = integer(ldw_fiscal_period.Describe("Evaluate('Max(FISCAL_YEAR)', 0)")) + 1
	elseif  ldw_fiscal_period.rowcount() = 0 then
		ld_f_date = lc_date.f_firstdaymonthofyear(  today())		
		ld_t_date = lc_date.f_lastdaymonthofyear( today())
		ll_fiscal = 1
	else
		disconnect using it_transaction;
		gf_messagebox('m.c_fiscal_period.e_action_create_fiscal_year.01','Thông báo','Lỗi tìm kiếm:ldw_fiscal_period','stop','ok',1)
		
		return -1
	end if
	
	//-- popup window nhập tham số --//
	lb_popup_input = create b_popup_data
	lb_popup_input.is_display_column = 'f_date;t_date;nbr_in_period;period_type'
	lb_popup_input.iaa_default_data[1] = ld_f_date
	lb_popup_input.iaa_default_data[2] = ld_t_date
	lb_popup_input.iaa_default_data[3] = 1
	lb_popup_input.iaa_default_data[4] = 'MONTH'
	lb_popup_input.f_init_popup_display( '1d', 'd_create_fiscal_period_form', 2600, 1000)
	openwithparm(s_wr_multi,lb_popup_input)
	lds_parm = message.powerobjectparm
	setnull(message.powerobjectparm)	
	if not isvalid(lds_parm) then 
		disconnect using it_transaction;
		return 0
	end if
	//--KIỂM TRA THAM SỐ TRẢ VỀ --//
	ld_f_date_next = date(lds_parm.getitemdatetime( 1, 'f_date'))
	ld_t_date_next = date(lds_parm.getitemdatetime( 1, 't_date'))
	if string(ld_f_date_next, 'dd/mm/yyyy') = '01/01/1900' or  string(ld_t_date_next, 'dd/mm/yyyy') = '01/01/1900' then
		disconnect using it_transaction;
		gf_messagebox('m.c_fiscal_period.e_action_create_fiscal_year.02','Thông báo','Cần nhập ngày bắt đầu và ngày kết thúc của năm tài chính','exclamation','ok',1)
		return -1
	end if
	ll_nbr_in_period = lds_parm.getitemnumber( 1, 'nbr_in_period')
	if isnull(ll_nbr_in_period) or ll_nbr_in_period = 0 then
		disconnect using it_transaction;
		gf_messagebox('m.c_fiscal_period.e_action_create_fiscal_year.03','Thông báo','Cần nhập số (tháng/tuần/ngày) trong 1 kỳ','exclamation','ok',1)
		return -1
	end if
	if ld_f_date_next < ld_f_date and ll_fiscal > 1 then
		disconnect using it_transaction;
		gf_messagebox('m.c_fiscal_period.e_action_create_fiscal_year.04','Thông báo','Cần nhập ngày bắt đầu năm tài chính mới phải lớn hơn ngày:@'+string(ld_t_date),'exclamation','ok',1)
		return -1		
	end if
	if ld_t_date_next <= ld_f_date_next then
		disconnect using it_transaction;
		gf_messagebox('m.c_fiscal_period.e_action_create_fiscal_year.05','Thông báo','Cần nhập ngày kết thức năm tài chính mới phải lớn hơn ngày:@'+string(ld_t_date_next),'exclamation','ok',1)
		return -1		
	end if	
	ls_periodtype = lds_parm.getitemstring( 1, 'period_type')
	if isnull(ls_periodtype) or ls_periodtype = '' then ls_periodtype = 'MONTH'
	ls_close_period_yn  = lds_parm.getitemstring( 1, 'close_period_yn')
	if isnull(ls_close_period_yn) then ls_close_period_yn = 'N'
	ls_close_year_yn  = lds_parm.getitemstring( 1, 'close_fiscal_yn')
	if isnull(ls_close_year_yn) then ls_close_year_yn = 'N'
	
	//-- INSERT KỲ KẾ TOÁN --//	
	if ls_periodtype = 'MONTH' then
		ll_nbr_of_period = lc_date.f_monthsafter( ld_f_date_next, ld_t_date_next) + 1
		FOR ll_row = 1 to ll_nbr_of_period
			ll_insertrow = ldw_fiscal_period.event e_addrow( )
			ldw_fiscal_period.setitem( ll_insertrow, 'FISCAL_YEAR', ll_fiscal)
			ldw_fiscal_period.setitem( ll_insertrow, 'CAL_YEAR', year(ld_f_date_next) )
			ldw_fiscal_period.setitem( ll_insertrow, 'from_date', ld_f_date_next )
			ld_t_date_next = relativeDate(lc_date.f_add_months_ex( ld_f_date_next, 1, it_transaction) , -1) 
			ldw_fiscal_period.setitem( ll_insertrow, 'to_date', ld_t_date_next )
			ldw_fiscal_period.setitem( ll_insertrow, 'period_type', 'NORMAL' )
			if ls_close_period_yn = 'Y' then 				
				ll_insertrow = ldw_fiscal_period.event e_addrow( )
				ldw_fiscal_period.setitem( ll_insertrow, 'FISCAL_YEAR', ll_fiscal)
				ldw_fiscal_period.setitem( ll_insertrow, 'CAL_YEAR', year(ld_f_date_next) )
				ldw_fiscal_period.setitem( ll_insertrow, 'from_date', ld_t_date_next )
				ldw_fiscal_period.setitem( ll_insertrow, 'to_date', ld_t_date_next )
				ldw_fiscal_period.setitem( ll_insertrow, 'period_type', 'CLOSING' )				
			end if
			ld_f_date_next =   relativeDate(ld_t_date_next , 1)
		NEXT
		if ls_close_period_yn = 'N' and ls_close_year_yn = 'Y' then
			ll_insertrow = ldw_fiscal_period.event e_addrow( )
			ldw_fiscal_period.setitem( ll_insertrow, 'FISCAL_YEAR', ll_fiscal)
			ldw_fiscal_period.setitem( ll_insertrow, 'CAL_YEAR', year(ld_f_date_next) )
			ldw_fiscal_period.setitem( ll_insertrow, 'from_date', ld_t_date_next )
			ldw_fiscal_period.setitem( ll_insertrow, 'to_date', ld_t_date_next )
			ldw_fiscal_period.setitem( ll_insertrow, 'period_type', 'CLOSING' )						
		end if		
		disconnect using it_transaction;
		this.iw_display.event e_save( )
	elseif ls_periodtype = 'WEEK' then
		//-- kỳ kế toán theo tuần --//
		disconnect using it_transaction;
	else
		//-- kỳ kế toán theo ngày --//
		disconnect using it_transaction;
	end if
end if
destroy lds_parm

return 1
end event

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_fiscal_period_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_fiscal_period_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_exchange_rate_grid;'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Kỳ kế toán'

istr_dwo[2].s_dwo_default =  'd_fiscal_period_control_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_fiscal_period_control_grid'
istr_dwo[2].b_detail = true
istr_dwo[2].s_dwo_master = 'd_fiscal_period_grid;'
istr_dwo[2].s_master_keycol = 'ID;'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
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
istr_dwo[2].s_description = 'Kiểm soát kỳ kế toán'
end subroutine

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'

end subroutine

public function boolean f_is_period_closed (string vs_stop_type, date vd_trans_date);int					li_cnt
string				ls_role_user_id
any				laa_value[]
c_string			lc_string
t_ds_db			lds_period_control


select count(id) into :li_cnt from fiscal_period where :vd_trans_date between from_date and to_date using sqlca;

if li_cnt = 0 then
	return true 
end if

select count(ID) into :li_cnt
from fiscal_period
where upper(period_type) = 'NORMAL'
	and nvl(closed_yn,'N') = 'Y'
    and  :vd_trans_date between from_date and to_date using sqlca;

if li_cnt = 1 then return true

select count(ID) into :li_cnt
from fiscal_period_control
where stop_type = 'ALL'
    and  :vd_trans_date between from_date and to_date 
	and nvl(STOP_YN,'N') = 'Y'
	and ROLE_USER_ID is null using sqlca;
	
if li_cnt = 1 then return true

select count(ID) into :li_cnt
from fiscal_period_control
where stop_type = upper(:vs_stop_type)
    and  :vd_trans_date between from_date and to_date 
	and nvl(STOP_YN,'N') = 'Y'
	and ROLE_USER_ID is null using sqlca;
	
if li_cnt = 1 then return true

lc_string.f_arraytostring( g_user.idb_role_id[], ';' ,ls_role_user_id)
//Trường hợp user không có nhóm
if ls_role_user_id = '' or isnull(ls_role_user_id) then
	ls_role_user_id = '('+string(gi_userid) +')'
else
	ls_role_user_id = '('+ls_role_user_id+';' +string(gi_userid) +')'
end if
lds_period_control = create t_ds_db
lds_period_control.dataobject = 'd_fiscal_period_control_grid'
lds_period_control.f_settransobject( sqlca)

laa_value[1] = '=ALL'
laa_value[2] = '<=' + string(vd_trans_date, gs_w_date_format)
laa_value[3] = '>=' + string(vd_trans_date, gs_w_date_format)
laa_value[4] = ls_role_user_id
laa_value[5] = '=Y'

lds_period_control.f_add_where( 'stop_type;from_date;to_date;ROLE_USER_ID;STOP_YN',laa_value)
if lds_period_control.retrieve( ) > 0 then return true

lds_period_control.dataobject = 'd_fiscal_period_control_grid'
lds_period_control.f_settransobject( sqlca)
laa_value[1] = '=' + upper(vs_stop_type)
laa_value[2] = '<=' + string(vd_trans_date, gs_w_date_format)
laa_value[3] = '>=' + string(vd_trans_date, gs_w_date_format)
laa_value[4] = ls_role_user_id
laa_value[5] = '=Y'

lds_period_control.f_add_where( 'stop_type;from_date;to_date;ROLE_USER_ID;STOP_YN',laa_value)
if lds_period_control.retrieve( ) > 0 then return true

destroy lds_period_control
return false
end function

public function integer f_get_period_first_last_date (date v_trans_date, ref date rd_firstdate, ref date rd_lastdate);
select from_Date, to_date 
into :rd_firstdate, :rd_lastdate
from fiscal_period
where :v_trans_date between from_date and to_date using sqlca;

if sqlca.sqlcode = 0 then 
	return 1
else
	gf_messagebox('m.c_fiscal_priod.f_get_period_first_last_date.01','Thông báo','Chưa có tạo kỳ kế toán cho ngày:@'+string(v_trans_date),'exclamation','ok',1)
	return -1
end if
end function

on c_fiscal_period.create
call super::create
end on

on c_fiscal_period.destroy
call super::destroy
end on

event constructor;call super::constructor;
ib_changed_dwo_4edit = false
is_display_model = '2d'
ib_display_text = false
is_object_title = 'Kỳ kế toán'

istr_actionpane[1].s_button_name = 'b_add;b_insert;b_modify;b_save; b_filteron;b_query;b_refresh;b_delete;b_create_fiscal_year'
istr_actionpane[1].s_description = is_object_title
setnull(is_base_code)
setnull(idb_class_id)
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
						istr_actionpane[li_idx].s_visible_buttons='b_modify;b_filteron;b_query;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_modify;b_filteron;b_query;b_refresh;b_delete;b_create_fiscal_year;'
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

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;date				ld_f_date, ld_t_date
t_dw_mpl		ldw_period

if rpo_dw.dataobject = 'd_fiscal_period_control_grid' then
	ldw_period = this.iw_display.f_get_dw( 'd_fiscal_period_grid')
	if ldw_period.getrow( ) > 0 then
		ld_f_date = date(ldw_period.getitemdatetime(ldw_period.getrow( ), 'from_date'))
		ld_t_date = date(ldw_period.getitemdatetime(ldw_period.getrow( ), 'to_date'))
		rpo_dw.setitem(vl_currentrow, 'STOP_TYPE','ALL') 
		rpo_dw.setitem(vl_currentrow, 'from_date',  ld_f_date) 
		rpo_dw.setitem(vl_currentrow, 'to_date',  ld_t_date) 
	end if
end if

return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;string				ls_stop_type
date				ld_f_date, ld_t_date
t_dw_mpl		ldw_period

if rpo_dw.dataobject = 'd_fiscal_period_control_grid' then
	choose case vs_colname
		case 'from_date', 'to_date'
			ldw_period = this.iw_display.f_get_dw( 'd_fiscal_period_grid')
			if ldw_period.getrow( ) > 0 then
				if vs_colname = 'from_date' then
					ld_f_date = date(ldw_period.getitemdatetime(ldw_period.getrow( ), 'from_date'))
					if date(vs_editdata) < ld_f_date then
						gf_messagebox('m.c_fiscal_period.e_dw_e_itemchanged.01','Thông báo','Ngày khóa phải thuộc (năm trong) kỳ kế toán','exclamation','ok',1)
						return 1
					end if
				else
					ld_t_date = date(ldw_period.getitemdatetime(ldw_period.getrow( ), 'to_date'))
					if  date(vs_editdata) > ld_t_date then
						gf_messagebox('m.c_fiscal_period.e_dw_e_itemchanged.01','Thông báo','Ngày khóa phải thuộc (năm trong) kỳ kế toán','exclamation','ok',1)
						return 1
					end if					
				end if
			end if
		case 'stop_yn' ,  'stop_type'
			ls_stop_type = rpo_dw.getitemstring( vl_currentrow, 'stop_type' )
			if ls_stop_type = 'inventory_count' then
				gf_messagebox('m.c_fiscal_period.e_dw_e_itemchanged.02','Thông báo','Khoá kỳ loại kiểm kế: không xoá được mà phải sửa ghi sổ phiếu kiểm kê','exclamation','ok',1)
				return 1
//			elseif ls_stop_type = 'inventory_close'  then 
//				gf_messagebox('m.c_fiscal_period.e_dw_e_itemchanged.03','Thông báo','Khoá kỳ loại đóng kho:, không xoá được mà phải huỷ phiếu tính giá vốn bình quân','exclamation','ok',1)
//				return 1
			end if			
	end choose
end if
return 0
end event

event e_dw_e_predelete;call super::e_dw_e_predelete;string			ls_stop_type


if rpo_dw.dataobject = 'd_fiscal_period_control_grid' then
	ls_stop_type = rpo_dw.getitemstring( vl_currentrow, 'stop_type' )
	if ls_stop_type = 'inventory_count' then
		gf_messagebox('m.c_fiscal_period.e_dw_e_predelete.01','Thông báo','Khoá kỳ loại kiểm kế: không xoá được mà phải sửa ghi sổ phiếu kiểm kê','exclamation','ok',1)
		return -1
	elseif ls_stop_type = 'inventory_close'  then 
		gf_messagebox('m.c_fiscal_period.e_dw_e_predelete.02','Thông báo','Khoá kỳ loại đóng kho:, không xoá được mà phải huỷ phiếu tính giá vốn bình quân','exclamation','ok',1)
		return -1
	end if
end if
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;
this.iw_display.f_set_ii_upperpart_height( 1/2)
return 0
end event

