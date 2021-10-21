$PBExportHeader$ur_customer_balance_confirm.sru
forward
global type ur_customer_balance_confirm from b_report
end type
end forward

global type ur_customer_balance_confirm from b_report
end type
global ur_customer_balance_confirm ur_customer_balance_confirm

forward prototypes
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_dwo_window ()
end prototypes

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default = 'dr_customer_balance_confirm_form'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = 'dr_customer_balance_confirm_form'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = ''
iastr_dwo_tabpage[1].str_dwo[1].b_master = false
iastr_dwo_tabpage[1].str_dwo[1].b_detail = false
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = false
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol = ''
iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol = ''
iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[1].s_pic_ref_table = 'legal_entity'
iastr_dwo_tabpage[1].str_dwo[1].s_pic_ref_field = 'id'
iastr_dwo_tabpage[1].str_dwo[1].s_pic_ref_colname = 'logo'
iastr_dwo_tabpage[1].str_dwo[1].b_insert = false
iastr_dwo_tabpage[1].str_dwo[1].b_update = false
iastr_dwo_tabpage[1].str_dwo[1].b_delete = false
iastr_dwo_tabpage[1].str_dwo[1].b_query = true
iastr_dwo_tabpage[1].str_dwo[1].b_print = true
iastr_dwo_tabpage[1].str_dwo[1].b_excel = true
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Giấy xác nhận công nợ (chi tiết)'
iastr_dwo_tabpage[1].str_dwo[1].s_gb_name = ''

iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_display_model = '1d'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default = 'dr_customer_balance_confirm_m_form'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = 'dr_customer_balance_confirm_m_form'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = ''
iastr_dwo_tabpage[2].str_dwo[1].b_master = false
iastr_dwo_tabpage[2].str_dwo[1].b_detail = false
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = false
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[2].str_dwo[1].s_master_keycol = ''
iastr_dwo_tabpage[2].str_dwo[1].s_detail_keycol = ''
iastr_dwo_tabpage[2].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[2].str_dwo[1].s_pic_ref_table = 'legal_entity'
iastr_dwo_tabpage[2].str_dwo[1].s_pic_ref_field = 'id'
iastr_dwo_tabpage[2].str_dwo[1].s_pic_ref_colname = 'logo'
iastr_dwo_tabpage[2].str_dwo[1].b_insert = false
iastr_dwo_tabpage[2].str_dwo[1].b_update = false
iastr_dwo_tabpage[2].str_dwo[1].b_delete = false
iastr_dwo_tabpage[2].str_dwo[1].b_query = true
iastr_dwo_tabpage[2].str_dwo[1].b_print = true
iastr_dwo_tabpage[2].str_dwo[1].b_excel = true
iastr_dwo_tabpage[2].str_dwo[1].s_description ='Giấy xác nhận công nợ (mẫu)'
iastr_dwo_tabpage[2].str_dwo[1].s_gb_name = ''
end subroutine

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_report_parm_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_report_parm_grid'
istr_dwo[1].b_master = false
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = false
istr_dwo[1].b_excel = false
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].b_traceable = true
istr_dwo[1].s_description = 'Xem báo cáo theo điều kiện: '

istr_dwo[2].s_dwo_default = 'dp_customer_balance_confirm_form'
istr_dwo[2].s_dwo_form = 'dp_customer_balance_confirm_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = false
istr_dwo[2].b_insert = false
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = false
istr_dwo[2].b_query = true
istr_dwo[2].b_print = false
istr_dwo[2].b_excel = false
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = false
istr_dwo[2].s_description = 'Tham số của báo cáo: '
end subroutine

on ur_customer_balance_confirm.create
call super::create
end on

on ur_customer_balance_confirm.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'CUSTOMER_BALANCE_TMP'
ib_changed_dwo_4edit = false
is_display_model = '1ddlb_2d_1tp'
ib_display_text = true
is_object_title = 'Giấy xác nhận công nợ'

istr_actionpane[1].s_description = is_object_title

istr_report.s_dwo_report = 'dr_customer_balance_confirm_form'
istr_report.s_pro_name = 'pkg_customer_balance_detail.pro_cus_bal_detail'
istr_report.sa_parm_name[1] = 'p_s_date'
istr_report.sa_parm_name[2] = 'p_e_date'
istr_report.sa_parm_name[3] = 'p_branch_code'
istr_report.sa_parm_name[4] = 'p_object_code'
istr_report.sa_parm_name[5] = 'p_mana_code'
istr_report.sa_parm_name[6] = 'p_account_code'
istr_report.sa_parm_name[7] = 'p_currency_type'
istr_report.sa_parm_name[8] = 'p_options'
istr_report.sa_parm_name[9] = 'gs_sob'
istr_report.sa_parm_name[10] = 'gi_user_id'
istr_report.sa_parm_value[10] = gi_userid
istr_report.b_multi_thread = false
end event

event e_window_e_postopen;call super::e_window_e_postopen;t_dw_mpl		ldw_parm
t_cbx				lt_cbx
long				vl_row
string 			ls_currency_type,ls_options

ldw_parm = iw_display.f_get_dw(istr_dwo[2].s_dwo_default)
ls_currency_type = ldw_parm.getitemstring(ldw_parm.getrow(), 'p_currency_type')
if isnull(ls_currency_type) or ls_currency_type = '' then 
	ldw_parm.setitem(ldw_parm.getrow(), 'p_currency_type','BASE')
end if
ls_options = ldw_parm.getitemstring(ldw_parm.getrow(), 'p_options')
if isnull(ls_currency_type) or ls_currency_type = '' then 
	ldw_parm.setitem(ldw_parm.getrow(), 'p_options','TOTAL')
end if

lt_cbx = iw_display.dynamic f_get_cbx('2')
lt_cbx.checked = true

return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.dynamic f_set_ii_leftpart_width(3800)
iw_display.dynamic f_set_ii_upperpart_height(300)
return 0
end event

event e_window_e_view_report;t_dw_mpl	ldw_parm,ldw_m_rp,ldw_report
date			ldt_s_date

t_transaction			lt_transaction
//t_dw_mpl				ldw_report,ldw_parm
s_str_criteria_rec		lstr_criteria
t_cbx						lt_cbx
string						ls_sql_report,ls_sql_pro,ls_rtn,ls_dwo,ls_report_name
long						ll_row
any						laa_arg[]
int							li_tabindex,ls_name_cbx

//li_tabindex = this.f_get_cur_dw_report(ldw_report, ls_report_name) iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default
ldw_report = iw_display.f_get_dw( iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default)
li_tabindex = 1
ls_dwo = ldw_report.dataobject 
ls_sql_report = this.f_get_sql_report(ldw_report )
ls_sql_pro = this.f_get_sql_pro( )
iw_display.f_get_transaction(lt_transaction)
//--chạy multithread--//
if istr_report.b_multi_thread then
	iw_display.f_set_visible_st_1(true)
	iw_display.f_set_st_1_text('Đang xem báo cáo: ',ls_report_name ) 
	ic_callback.f_setdw( ldw_report)
	ic_callback.f_setw( iw_display)
	ic_callback.f_settab( iw_display.dynamic f_get_tab_1() )
	ic_callback.f_set_obj_report(this)
	//Step 1 (part 1) -  Instantiate the shared obj b_multithread and and give it the logical name "i_multithear"
	if sharedobjectregister("b_multithread","i_multithread_report") = Success! then
		//Step 1 (part 2) - Set up the instance variable in_shared to point to the shared object 
		// refered to by the logical name "i_multithear"
		sharedobjectGet("i_multithread_report", ic_multithread)
		
		//Step 2 - set dw_report 
		
		//Step 3 - Call the f_multitheared method asynchronously (POST)
		this.f_get_dw_retrieve_args( ldw_report, laa_arg)
		ic_multithread.post f_multitheared( ic_callback, ls_sql_pro, ls_sql_report,lt_transaction.servername , lt_transaction.logid ,lt_transaction.logpass ,ldw_report.dataobject,laa_arg )
		
		// Mark a shared object for destruction.The object is not actually destroyed
		// until there are no more references to the object.
		SharedobjectUnregister("i_multithread_report")
	else
		messagebox('Lỗi','b_report.e_window_e_view_report(line:25)') 
	end if
else
	//--không chạy multi thread--//
	if ls_sql_pro <> '' then 
		execute immediate :ls_sql_pro using lt_transaction;
	end if
	ls_rtn = ldw_report.Modify("Datawindow.Table.Select=~'" + ls_sql_report + "~'")
//	ldw_report.settransobject( lt_transaction)
	setnull(ldw_report.is_originalwhereclause )
	ll_row = ldw_report.Event e_Retrieve()
	if ll_row = 0 then ldw_report.insertrow( 0)
	this.f_set_properties_cur_report( li_tabindex)
//	ldw_report.dynamic f_set_properties()
	//--ghi nhớ arg--//
		ldw_parm = iw_display.dynamic f_get_dw(istr_dwo[2].s_dwo_default)
		this.f_update_dp_arg(ldw_parm,lt_transaction)
//	end if
end if

ldw_m_rp = iw_display.f_get_dw(iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default)
ldw_parm = iw_display.f_get_dw(istr_dwo[2].s_dwo_default)
if ldw_m_rp.dataobject = 'dr_customer_balance_confirm_m_form' then
	ldt_s_date = date(ldw_parm.getitemdatetime( 1, 'p_s_date'))
	ldw_m_rp.retrieve( gi_userid,ldt_s_date)
end if
lt_cbx = iw_display.dynamic f_get_cbx('2')
this.event e_cbx_clicked( lt_cbx)
return 1
end event

event e_cbx_clicked;t_dw_mpl		ldw_report,ldw_rp_m
string				ls_report_name
tab				ltab_report
int					li_tabindex

if rcbx_handling.classname( ) = 'cbx_2' then
	li_tabindex = this.f_get_cur_dw_report(ldw_report, ls_report_name)
	if li_tabindex = -1 then return -1
	ldw_rp_m =  iw_display.f_get_dw(iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default)
	if rcbx_handling.checked then
		ldw_report.modify("DataWindow.Print.Preview= true")
		ldw_rp_m.modify("DataWindow.Print.Preview= true")
	else
		ldw_report.modify("DataWindow.Print.Preview= false")
		ldw_rp_m.modify("DataWindow.Print.Preview= false")
	end if
	this.f_set_str_properties( li_tabindex)
else
end if
return 0
end event

