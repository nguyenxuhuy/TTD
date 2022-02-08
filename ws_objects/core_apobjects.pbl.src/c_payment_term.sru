$PBExportHeader$c_payment_term.sru
forward
global type c_payment_term from s_object_display
end type
end forward

global type c_payment_term from s_object_display
end type
global c_payment_term c_payment_term

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
public function date f_get_due_date (date vd_date, double vdb_payment_term_id)
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_payment_term_grid'
istr_dwo[1].s_dwo_form = 'd_payment_term_form'
istr_dwo[1].s_dwo_grid = 'd_payment_term_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = ''
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Danh mục thời hạn thanh toán'

end subroutine

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'

end subroutine

public function date f_get_due_date (date vd_date, double vdb_payment_term_id);/**********************************
chức năng: lấy ra ngày thanh toán
biến truyền vào: ngày, id_thời hạn thanh toán
trả về:
null: nếu là trả trước
01/01/1900: lỗi hoặc id truyền vào không tồn tại
trả ra ngày bình thường nếu dữ liệu đúng
**********************************/
c_datetime      ldt_date
c_string			lc_string
t_ds_db       	 lds_payment_term
int 		      	li_nday,li_day_num_1,li_day_num_2
any                 aa_id[]
long               ll_rtn
string 			ls_payment_type, ls_day
date				ld_payment_date,ld_date


 aa_id[1]=vdb_payment_term_id
 lds_payment_term = create t_ds_db
 lds_payment_term.dataobject='d_payment_term_grid'
 lds_payment_term.settransobject( sqlca)
 lds_payment_term.f_add_where('id',aa_id)
 ll_rtn=lds_payment_term.retrieve( )
 if ll_rtn>0 then 
	  ls_payment_type=lds_payment_term.getitemstring( ll_rtn, 'type')
	  if ls_payment_type='in advance' then    //trả trước
		setnull(ld_payment_date)
		return ld_payment_date
	  elseif ls_payment_type='on delivery' then  //trả ngay
		return vd_date
	  elseif ls_payment_type='deferred net days ' then  //ghi công nợ
		li_nday=lds_payment_term.getitemnumber( ll_rtn, 'nday')
		return ldt_date.f_add_date( vd_date,li_nday)
	  elseif ls_payment_type='deferred cur. month'  then  //thanh toán trong tháng
		ld_payment_date=date(lds_payment_term.getitemdatetime( ll_rtn, 'payment_date'))
		vd_date=date(lc_string.f_globalreplace( string(vd_date,'dd/mm/yyyy'), String(vd_date,'dd'), String(ld_payment_date,'dd')))
		return vd_date
	elseif  ls_payment_type='deferred next month' then //thanh toán tháng sau
		ld_payment_date=date(lds_payment_term.getitemdatetime( ll_rtn, 'payment_date'))
		vd_date=date(lc_string.f_globalreplace( string(vd_date,'dd/mm/yyyy'), String(vd_date,'dd'), String(ld_payment_date,'dd')))
		return ldt_date.f_add_months( vd_date, 1)
	elseif ls_payment_type = 'repayment periodically' then // thanh toán theo kỳ
		ld_payment_date = date(lds_payment_term.getitemdatetime( 1, 'payment_date'))
		li_nday = lds_payment_term.getitemnumber( ll_rtn, 'nday')
		ld_date = ldt_date.f_day_of_period( li_nday, ld_payment_date, vd_date)
		return ld_date
	end if
 else
  	return date('01/01/1900')
 end if



end function

event constructor;call super::constructor;is_table = 'payment_term'
ib_changed_dwo_4edit = true
is_display_model = '1d'
ib_display_text = false
is_object_title = 'Thời hạn thanh toán'

istr_actionpane[1].s_description = is_object_title

end event

on c_payment_term.create
call super::create
end on

on c_payment_term.destroy
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

