$PBExportHeader$c_tasklist.sru
forward
global type c_tasklist from b_doc
end type
end forward

global type c_tasklist from b_doc
event e_window_e_rb_clicked ( radiobutton vrd_handling )
end type
global c_tasklist c_tasklist

forward prototypes
public subroutine f_set_actionpane (s_str_actionpane vstr_actionpane[])
public subroutine f_set_dwo_window ()
public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[])
end prototypes

event e_window_e_rb_clicked(radiobutton vrd_handling);string				vs_rp_name,ls_filter
t_dw_mpl		ldw_tmp
RadioButton		lrb_tmp

if isnull(vrd_handling) then return
vs_rp_name = vrd_handling.classname()
ldw_tmp = iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
choose case vs_rp_name
	case 'rb_1'
		lrb_tmp = iw_display.dynamic f_get_ratiobutton('2')
		if not isnull(lrb_tmp) then lrb_tmp.checked = false
		lrb_tmp = iw_display.dynamic f_get_ratiobutton('3')
		if not isnull(lrb_tmp) then lrb_tmp.checked = false
		ls_filter = is_dwmain_filter
	case 'rb_2'
		lrb_tmp = iw_display.dynamic f_get_ratiobutton('1')
		if not isnull(lrb_tmp) then lrb_tmp.checked = false
		lrb_tmp = iw_display.dynamic f_get_ratiobutton('3')
		if not isnull(lrb_tmp) then lrb_tmp.checked = false
		ls_filter = "status = 'approved'"
	case 'rb_3'
		lrb_tmp = iw_display.dynamic f_get_ratiobutton('1')
		if not isnull(lrb_tmp) then lrb_tmp.checked = false
		lrb_tmp = iw_display.dynamic f_get_ratiobutton('2')
		if not isnull(lrb_tmp) then lrb_tmp.checked = false
		ls_filter = "status <> 'approved'"
end choose
if is_dwmain_filter <> '' and ls_filter <> '' then ls_filter = ls_filter + ' and ' + is_dwmain_filter
ldw_tmp.setfilter( ls_filter)
ldw_tmp.filter()
return
end event

public subroutine f_set_actionpane (s_str_actionpane vstr_actionpane[]);istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name =  'b_pr;b_so_return;b_goods_delivery;b_sal_invoice;'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_tasklist_hdr_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_tasklist_hdr_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_tasklist_line_grid'
istr_dwo[1].s_dwo_shared = ''
istr_dwo[1].s_dwo_master = ''
//istr_dwo[1].s_master_keycol = 'ID;'
//istr_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[1].b_ref_table_yn  = false
istr_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = false
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_gb_name = 'gb_6'
istr_dwo[1].s_description = 'Danh sách công việc'

istr_dwo[2].s_dwo_default =  'd_tasklist_line_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_tasklist_line_grid'
istr_dwo[2].b_master = false
istr_dwo[2].b_detail = true
istr_dwo[2].b_shared = false
istr_dwo[2].b_cascade_del = false
istr_dwo[2].s_dwo_master = ''
istr_dwo[2].s_dwo_details = ''
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
istr_dwo[2].s_description = 'Chi tiết công việc'





//istr_dwo[3].s_dwo_default =  'd_activities_form'
//istr_dwo[3].s_dwo_form = 'd_activities_form'
//istr_dwo[3].s_dwo_grid = ''
////istr_dwo[3].b_master = false
//istr_dwo[3].b_detail = true
//istr_dwo[3].b_cascade_del = true
//istr_dwo[3].s_dwo_master = 'd_tasklist_form;'
//istr_dwo[3].s_dwo_details = ''
//istr_dwo[3].s_master_keycol = 'ID;'
//istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID;'
//istr_dwo[3].b_ref_table_yn  = false
//istr_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE'
//istr_dwo[3].b_relation_1_1 = true
//istr_dwo[3].b_insert = true
//istr_dwo[3].b_update = true
//istr_dwo[3].b_delete = true
//istr_dwo[3].b_query = true
//istr_dwo[3].b_print = true
//istr_dwo[3].b_excel = true
//istr_dwo[3].b_traceable = true
//istr_dwo[3].b_keyboardlocked = true
//istr_dwo[3].b_focus_master = true
//istr_dwo[3].s_description = 'Công việc'
end subroutine

public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[]);string			ls_task_frequency
date			ld_trans_date_f,ld_f_task_date

t_dw_mpl	ldw_tasklist
c_datetime	lc_datet

//if rdw_focus.dataobject = istr_dwo[2].s_dwo_default then
//	ldw_tasklist = iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
//	ra_args[upperbound(ra_args)+1] = gi_userid
//	ls_task_frequency = ldw_tasklist.getitemstring(ldw_tasklist.getrow(),'task_frequency')
//	ld_f_task_date = date(ldw_tasklist.getitemdatetime(ldw_tasklist.getrow(),'f_task_date'))
//	choose case lower(trim(ls_task_frequency))
//		case 'hàng ngày'
//			ld_trans_date_f = lc_datet.f_add_date( ld_f_task_date, -1)
//		case 'hàng tuần'
//			ld_trans_date_f = lc_datet.f_add_date( ld_f_task_date, -7)
//		case 'hàng tháng'
//			ld_trans_date_f = lc_datet.f_add_months( ld_f_task_date, -1)
//		case 'hàng quý'
//			ld_trans_date_f = lc_datet.f_add_months( ld_f_task_date, -3)
//		case 'hàng năm'
//			ld_trans_date_f = lc_datet.f_add_months( ld_f_task_date, -12)
//	end choose
//	ra_args[upperbound(ra_args)+1] = ld_trans_date_f
//	ra_args[upperbound(ra_args)+1] = ld_f_task_date
//end if

return upperbound(ra_args)
end function

on c_tasklist.create
call super::create
end on

on c_tasklist.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'tasklist'
ib_changed_dwo_4edit = false
is_display_model = '2d_3rb'
ib_display_text = false
is_object_title = 'Kế hoạch công việc'

istr_actionpane[1].s_button_name = 'b_add;b_modify;b_filteron;b_query; b_refresh;b_delete;b_send_2_approve;b_approve;b_reject;'
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title
end event

event e_action_ctrl_bttn;call super::e_action_ctrl_bttn;datawindow				ldw_focus
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
							istr_actionpane[li_idx].s_visible_buttons ='b_add;b_modify;b_filteron;b_query; b_refresh;b_delete;b_send_2_approve;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query; b_refresh;b_delete;b_send_2_approve;b_approve;b_reject;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query; b_refresh;b_delete;b_send_2_approve;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query; b_refresh;b_delete;b_send_2_approve;b_approve;b_reject;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons= 'b_add;b_modify;b_filteron;b_query; b_refresh;b_delete;b_send_2_approve;b_approve;b_reject;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_send_2_approve;b_approve;b_reject;'
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

event e_window_open;call super::e_window_open;//RadioButton		lrb_tmp
//
//lrb_tmp = iw_display.dynamic f_get_ratiobutton('1')
//lrb_tmp.text = 'Xem tất cả'
//lrb_tmp.checked = true
//lrb_tmp = iw_display.dynamic f_get_ratiobutton('2')
//lrb_tmp.text = 'Đã hoàn thành'
//lrb_tmp.checked = false
//lrb_tmp = iw_display.dynamic f_get_ratiobutton('3')
//lrb_tmp.text = 'Chưa hoàn thành'
//lrb_tmp.checked = false
//iw_display.dynamic f_resize_2d_3rb()
return 0
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;//b_popup_data	lb_popup_data
//c_datetime		lc_datet
//t_dw_mpl		ldw_tasklist
//t_ds_db			lds_sales_reveneu,lds_return
//double			ldb_act_base_amount_ex_tax,ldb_charge_base_amt,ldb_object_id
//string				ls_description,ls_task_frequency,ls_object_code,ls_object_name
//long				ll_row,ll_idx,ll_retrieve
//date				ld_f_task_date,ld_t_task_date,ld_f_date

if rpo_dw.dataobject = istr_dwo[1].s_dwo_default then
	rpo_dw.setitem(vl_currentrow,'status','new')
	rpo_dw.setitem(vl_currentrow,'status_name','Mới')
	rpo_dw.setitem(vl_currentrow,'loop_yn','Y')
elseif rpo_dw.dataobject = istr_dwo[2].s_dwo_default then
	rpo_dw.setitem(vl_currentrow,'status','new')
	rpo_dw.setitem(vl_currentrow,'status_name','Mới')
	rpo_dw.setitem(vl_currentrow,'assigned_by',gi_userid)
end if
//if rpo_dw.dataobject = istr_dwo[1].s_dwo_default then
//	ldw_tasklist = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
//	//-- mở form chọn loại công việc và ngày bắt đầu--//
//	lb_popup_data = create b_popup_data
//	lb_popup_data.f_init_popup_display( '1d', 'dp_create_tasklist_form','Tạo kế hoạch công việc','Chọn loại kế hoạch công việc','Tạo kế hoạch công việc', 3500, 1000)
//	openwithparm(s_wr_multi, lb_popup_data)
//	lds_return = message.powerobjectparm
//	if isvalid(lds_return) then
//		setnull( message.powerobjectparm)
//		ls_description = lds_return.getitemstring( 1, 'description')
//		ls_task_frequency = lds_return.getitemstring( 1, 'task_frequency')
//		if isnull(ls_task_frequency) or trim(ls_task_frequency) = '' then ls_task_frequency = 'hàng ngày'
//		ld_f_task_date = date(lds_return.getitemdatetime( 1, 'f_task_date'))
//		if isnull(ld_f_task_date) then ld_f_task_date = date(lc_datet.f_getsysdate( ))
//		choose case lower(trim(ls_task_frequency))
//			case 'hàng ngày'
//				ld_t_task_date = lc_datet.f_add_date( ld_f_task_date, 1)
//				ld_f_date = lc_datet.f_add_date( ld_f_task_date, -1)
//			case 'hàng tuần'
//				ld_t_task_date = lc_datet.f_add_date( ld_f_task_date, 7)
//				ld_f_date = lc_datet.f_add_date( ld_f_task_date, -7)
//			case 'hàng tháng'
//				ld_t_task_date = lc_datet.f_add_months( ld_f_task_date, 1)
//				ld_f_date = lc_datet.f_add_months( ld_f_task_date, -1)
//			case 'hàng quý'
//				ld_t_task_date = lc_datet.f_add_months( ld_f_task_date, 3)
//				ld_f_date = lc_datet.f_add_months( ld_f_task_date, -3)
//			case 'hàng năm'
//				ld_t_task_date = lc_datet.f_add_months( ld_f_task_date, 12)
//				ld_f_date = lc_datet.f_add_months( ld_f_task_date, -12)
//			case else
//				
//		end choose
//		ldw_tasklist.reset( )
//		lds_sales_reveneu = create t_ds_db
//		lds_sales_reveneu.dataobject = 'ds_sales_revenue'
//		lds_sales_reveneu.f_settransobject( SQLCA)
//		ll_retrieve = lds_sales_reveneu.retrieve( ld_f_date,ld_f_task_date,gi_userid)
//		for ll_idx = 1 to ll_retrieve
//			ldb_act_base_amount_ex_tax = lds_sales_reveneu.getitemnumber( ll_idx, 'act_base_amount_ex_tax')
//			ldb_charge_base_amt = lds_sales_reveneu.getitemnumber( ll_idx, 'charge_base_amt')
//			ldb_object_id = lds_sales_reveneu.getitemnumber( ll_idx, 'object_id')
//			ls_object_code = lds_sales_reveneu.getitemstring( ll_idx, 'object_code')
//			ls_object_name = lds_sales_reveneu.getitemstring( ll_idx, 'object_name')
//			ll_row = ldw_tasklist.event e_addrow( )
//			ldw_tasklist.setitem( ll_row, 'description', ls_description)
//			ldw_tasklist.setitem( ll_row, 'task_frequency', ls_task_frequency)
//			ldw_tasklist.setitem( ll_row, 'f_task_date', ld_f_task_date)
//			ldw_tasklist.setitem( ll_row, 't_task_date', ld_t_task_date)
//			ldw_tasklist.setitem( ll_row, 'object_id', ldb_object_id)
//			ldw_tasklist.setitem( ll_row, 'object_code', ls_object_code)
//			ldw_tasklist.setitem( ll_row, 'object_name', ls_object_name)
//		next
//		if ll_retrieve = 0 then
//			ll_row = ldw_tasklist.event e_addrow( )
//			ldw_tasklist.setitem( ll_row, 'description', ls_description)
//			ldw_tasklist.setitem( ll_row, 'task_frequency', ls_task_frequency)
//			ldw_tasklist.setitem( ll_row, 'f_task_date', ld_f_task_date)
//			ldw_tasklist.setitem( ll_row, 't_task_date', ld_t_task_date)
//		end if
//	else
//		destroy lds_sales_reveneu
//		return -1
//	end if
//	//--setitem cho master tasklist--//
//	rpo_dw.setitem( vl_currentrow, 'description', ls_description)
//	rpo_dw.setitem( vl_currentrow, 'task_frequency', ls_task_frequency)
//	rpo_dw.setitem( vl_currentrow, 'f_task_date', ld_f_task_date)
//	rpo_dw.setitem( vl_currentrow, 't_task_date', ld_t_task_date)
//	destroy lds_return
//	destroy lb_popup_data
//	destroy lds_sales_reveneu
//elseif rpo_dw.dataobject = istr_dwo[2].s_dwo_default or rpo_dw.dataobject = istr_dwo[2].s_dwo_form then 
//	rpo_dw.setitem(vl_currentrow,'ASSIGNED_BY',gi_userid)
//	rpo_dw.setitem(vl_currentrow,'staff_name', g_user.f_get_name_of_userid(gi_userid))
//end if

return vl_currentrow
end event

event e_window_e_preopen;call super::e_window_e_preopen;//--resize parm --//

iw_display.dynamic f_set_ii_upperpart_height(1150)
iw_display.dynamic f_set_ii_fixedpart2_height(750)

return 0
end event

event e_dw_e_postretrieve;call super::e_dw_e_postretrieve;//t_dw_mpl	ldw_tasklist
//date			ld_f_task_date,ld_t_task_date
//string			ls_description,ls_task_frequency

//if rpo_dw.dataobject = istr_dwo[1].s_dwo_default and vl_rowcount > 0 then
//	ldw_tasklist = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
//	ldw_tasklist.event e_retrieve( )
//	ld_f_task_date = date(rpo_dw.getitemdatetime(rpo_dw.getrow(),'f_task_date'))
//	ld_t_task_date = date(rpo_dw.getitemdatetime(rpo_dw.getrow(),'t_task_date'))
//	ls_description = rpo_dw.getitemstring(rpo_dw.getrow(),'description')
//	ls_task_frequency = rpo_dw.getitemstring(rpo_dw.getrow(),'task_frequency')
//	ldw_tasklist.setfilter( "f_task_date = date('" + string(ld_f_task_date) + "')" + " and t_task_date = date('" + string(ld_t_task_date) + "') and description = '" + ls_description + "' and task_frequency = '" +ls_task_frequency+ "'")
//	ldw_tasklist.filter( )
//elseif (rpo_dw.dataobject = istr_dwo[2].s_dwo_default or rpo_dw.dataobject = istr_dwo[2].s_dwo_form) and vl_rowcount > 0 then
//	if iw_display.f_get_ib_opening( ) then return vl_rowcount
//	ldw_tasklist = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
//	if ldw_tasklist.getrow( ) = 0 then return vl_rowcount
//	ld_f_task_date = date(ldw_tasklist.getitemdatetime(ldw_tasklist.getrow(),'f_task_date'))
//	ld_t_task_date = date(ldw_tasklist.getitemdatetime(ldw_tasklist.getrow(),'t_task_date'))
//	ls_description = ldw_tasklist.getitemstring(ldw_tasklist.getrow(),'description')
//	ls_task_frequency = rpo_dw.getitemstring(rpo_dw.getrow(),'task_frequency')
//	rpo_dw.setfilter( "f_task_date = date('" + string(ld_f_task_date) + "')" + " and t_task_date = date('" + string(ld_t_task_date) + "') and description = '" + ls_description + "' and task_frequency = '" +ls_task_frequency+ "'")
//	rpo_dw.filter( )
//end if

return vl_rowcount
end event

event e_dw_rowfocuschanged;call super::e_dw_rowfocuschanged;//t_ds_db		lds_sales_reveneu
//t_dw_mpl	ldw_tasklist
//c_string		lc_string
//c_datetime	lc_datet
//any			laa_data[]
//date			ld_f_task_date,ld_t_task_date,ld_trans_date_f
//long			ll_retrieve,ll_idx
//string			ls_description,ls_task_frequency,ls_filter,ls_where
//double		ladb_object_id[]
//
//if rpo_dw.dataobject = istr_dwo[1].s_dwo_default then
////	lds_sales_reveneu = create t_ds_db
////	lds_sales_reveneu.dataobject = 'ds_sales_reveneu'
////	lds_sales_reveneu.f_settransobject( SQLCA)
//	ldw_tasklist = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
//	ldw_tasklist.event e_retrieve( )
//	ld_f_task_date = date(rpo_dw.getitemdatetime(vl_currentrow,'f_task_date'))
//	ld_t_task_date = date(rpo_dw.getitemdatetime(vl_currentrow,'t_task_date'))
//	ls_description = rpo_dw.getitemstring(vl_currentrow,'description')
//	ls_task_frequency = rpo_dw.getitemstring(rpo_dw.getrow(),'task_frequency')
//	ls_filter = "f_task_date = date('" + string(ld_f_task_date) + "') and t_task_date = date('" + string(ld_t_task_date) + "') and description = '" + ls_description + "' and task_frequency = '" +ls_task_frequency+ "'"
//	ldw_tasklist.setfilter( ls_filter)
//	ldw_tasklist.filter( )
//end if
return vl_currentrow
end event

event e_dw_e_preinsertrow;call super::e_dw_e_preinsertrow;//b_popup_data	lb_popup_data
//t_dw_mpl		ldw_tasklist
//t_ds_db			lds_return
//string				ls_description,ls_task_frequency
//long				ll_row
//date				ld_f_task_date
//
//if rpo_dw.dataobject = istr_dwo[1].s_dwo_default then
//	ldw_tasklist = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
//	//-- mở form chọn loại công việc và ngày bắt đầu--//
//	lb_popup_data = create b_popup_data
//	lb_popup_data.f_init_popup_display( '1d', 'dp_tasklist_form','Tạo kế hoạch công việc','Chọn loại kế hoạch công việc','Tạo kế hoạch công việc', 3500, 1000)
//	openwithparm(s_wr_multi, lb_popup_data)
//	lds_return = message.powerobjectparm
//	if isvalid(lds_return) then
//		setnull( message.powerobjectparm)
//		ls_description = lds_return.getitemstring( 1, 'description')
//		ls_task_frequency = lds_return.getitemstring( 1, 'task_frequency')
//		ld_f_task_date = date(lds_return.getitemdatetime( 1, 'f_task_date'))
//		ldw_tasklist.reset( )
//		ll_row = ldw_tasklist.event e_addrow( )
//		ldw_tasklist.setitem( ll_row, 'description', ls_description)
//		ldw_tasklist.setitem( ll_row, 'task_frequency', ls_task_frequency)
//		ldw_tasklist.setitem( ll_row, 'f_task_date', ld_f_task_date)
//	else
//		return -1
//	end if
//	destroy lds_return
//	destroy lb_popup_data
//end if
return 0
end event

event e_dw_rowfocuschanging;call super::e_dw_rowfocuschanging;//t_dw_mpl	ldw_tasklist
//
//if rpo_dw.dataobject = istr_dwo[1].s_dwo_default then
//	ldw_tasklist = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
//	if ldw_tasklist.f_get_ib_editing( ) then
//		return 1
//	end if
//end if
return 0
end event

event e_dw_e_modifyrow;call super::e_dw_e_modifyrow;t_dw_mpl	ldw_tasklist

//if rpo_dw.dataobject = istr_dwo[1].s_dwo_default then
//	ldw_tasklist = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
//	ldw_tasklist.event e_modifyrow( )
//end if
return 0
end event

event e_dw_e_presave;call super::e_dw_e_presave;//t_dw_mpl	ldw_tasklist
//
//if rpo_dw.dataobject = istr_dwo[1].s_dwo_default then
//	rpo_dw.dynamic f_set_ib_update( false)
//	rpo_dw.dynamic f_set_ib_editing( false)
//	rpo_dw.dynamic f_set_ib_inserting(false) 
//	rpo_dw.dynamic f_set_ib_saving( false)
//	ldw_tasklist = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
//	ldw_tasklist.event e_save( )
//else
//	ldw_tasklist = iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
//	ldw_tasklist.f_set_ib_update( false)
//	ldw_tasklist.f_set_ib_editing( false)
//	ldw_tasklist.f_set_ib_inserting(false) 
//	ldw_tasklist.f_set_ib_saving( false)
//	ldw_tasklist.event e_save( )
//	ldw_tasklist.f_set_editable_property( false)
//end if
return 0
end event

event e_dw_e_postsave;call super::e_dw_e_postsave;
//rpo_dw.dynamic f_set_ib_update( true)
return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;double	ldb_desc_id,ladb_valueset_id[],ldb_object_id,ldb_solve_id
string		las_valueset_code[],las_valueset_name[],ls_loop,ls_freq,ls_object_code,ls_object_name,ls_staff_name
long		ll_row
date		ld_f_date,ld_t_date
int			li_rtn,li_idx

b_obj_instantiate	lob_ins
t_transaction		lt_transaction
c_datetime			lc_dt
t_dw_mpl			ldw_tmp

iw_display.f_get_transaction( lt_transaction)
if rpo_dw.dataobject = istr_dwo[1].s_dwo_default then
	ls_loop = rpo_dw.getitemstring(vl_currentrow,'loop_yn')
	ls_freq = rpo_dw.getitemstring(vl_currentrow,'task_frequency')
	ld_f_date = date(rpo_dw.getitemdatetime(vl_currentrow,'f_task_date'))
	ldw_tmp = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
	if vs_colname = 'description' then
		ldb_desc_id = rpo_dw.getitemnumber(vl_currentrow,'desc_id')
		li_rtn = lob_ins.f_get_valueset( ldb_desc_id, ladb_valueset_id, las_valueset_code, las_valueset_name, lt_transaction)
		ldb_object_id = rpo_dw.getitemnumber(vl_currentrow,'object_id')
		ldb_solve_id = rpo_dw.getitemnumber(vl_currentrow,'SOLVE_PERSON')
		ls_staff_name = rpo_dw.getitemstring(vl_currentrow,'staff_name')
		ls_object_code = rpo_dw.getitemstring(vl_currentrow,'object_code')
		ls_object_name = rpo_dw.getitemstring(vl_currentrow,'object_name')
		if li_rtn > 0 then
			for li_idx = 1 to li_rtn
				ll_row = ldw_tmp.event e_addrow( )
				ldw_tmp.setitem( ll_row, 'description', las_valueset_name[li_idx])
				ldw_tmp.setitem( ll_row, 'ASSIGNED_OBJECT', ldb_object_id)
				ldw_tmp.setitem( ll_row, 'SOLVE_PERSON', ldb_solve_id)
				ldw_tmp.setitem( ll_row, 'object_code', ls_object_code)
				ldw_tmp.setitem( ll_row, 'object_name', ls_object_name)
				ldw_tmp.setitem( ll_row, 'person_name', ls_staff_name)
				ldw_tmp.setitem( ll_row, 'line_no', li_idx)
			next
		end if 
	elseif vs_colname = 'f_task_date' then
		ld_f_date = date(vs_editdata)
		if ls_freq = 'QUARTERLY' then
			ld_t_date = lc_dt.f_lastdaymonthofquarter( ld_f_date)
		elseif ls_freq = 'MONTHLY' then
			ld_t_date = lc_dt.f_lastdayofmonth( ld_f_date)
		elseif ls_freq = 'WEEKLY' then
			ld_t_date = lc_dt.f_get_weekend( ld_f_date)
		elseif ls_freq = 'YEARLY' then
			ld_t_date = lc_dt.f_lastdaymonthofyear( ld_f_date)
		elseif ls_freq = 'DAILY' then
			ld_t_date = lc_dt.f_add_date( ld_f_date, 1)
		end if
		rpo_dw.setitem(vl_currentrow,'t_task_date',ld_t_date)
	elseif vs_colname = 'object_code' then
		ldb_object_id = rpo_dw.getitemnumber(vl_currentrow,'object_id')
		ls_object_name = rpo_dw.getitemstring(vl_currentrow,'object_name')
		for li_idx = 1 to ldw_tmp.rowcount()
			ldw_tmp.setitem( li_idx, 'ASSIGNED_OBJECT', ldb_object_id)
			ldw_tmp.setitem( li_idx, 'object_code', vs_editdata)
			ldw_tmp.setitem( li_idx, 'object_name', ls_object_name)
		next
	elseif vs_colname = 'staff_name' then
		ldb_solve_id = rpo_dw.getitemnumber(vl_currentrow,'SOLVE_PERSON')
		for li_idx = 1 to ldw_tmp.rowcount()
			ldw_tmp.setitem( li_idx, 'SOLVE_PERSON', ldb_solve_id)
			ldw_tmp.setitem( li_idx, 'person_name', vs_editdata)
		next
	end if
elseif rpo_dw.dataobject = istr_dwo[2].s_dwo_default then
end if
return AncestorReturnValue
end event

event e_window_e_send_2_approve;call super::e_window_e_send_2_approve;b_obj_instantiate	lb_ins
s_object_display	lc_obj_hd

t_dw_mpl	ldw_focus,ldw_tmp
string			ls_status
long			ll_find


ldw_focus = iw_display.f_get_idwfocus( )
lc_obj_hd = iw_display.f_get_obj_handling( )
if ldw_focus.dataobject = istr_dwo[1].s_dwo_default then
	ldw_tmp = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
	ll_find = ldw_tmp.find("status = 'new'",1,ldw_tmp.rowcount())
	Do While ll_find > 0 
		lb_ins.f_send_2_approve( ldw_tmp, lc_obj_hd, iw_display, ll_find)
		ll_find = ldw_tmp.find("status = 'new'",ll_find + 1,ldw_tmp.rowcount() + 1)
	Loop
else
	ldw_tmp = iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
	ls_status = ldw_tmp.getitemstring(ldw_tmp.getrow(),'status')
	if ls_status = 'new' then 
		lb_ins.f_send_2_approve( ldw_tmp, lc_obj_hd, iw_display, ldw_tmp.getrow())
	end if
end if
return 0
end event

event e_window_e_postopen;call super::e_window_e_postopen;RadioButton		lrb_tmp

lrb_tmp = iw_display.dynamic f_get_ratiobutton('1')
lrb_tmp.text = 'Xem tất cả'
lrb_tmp.checked = true
lrb_tmp.width = 600
lrb_tmp = iw_display.dynamic f_get_ratiobutton('2')
lrb_tmp.text = 'Đã hoàn thành'
lrb_tmp.checked = false
lrb_tmp.width = 600
lrb_tmp = iw_display.dynamic f_get_ratiobutton('3')
lrb_tmp.text = 'Chưa hoàn thành'
lrb_tmp.checked = false
lrb_tmp.width = 600
return 0
end event

event e_window_e_approved;call super::e_window_e_approved;b_obj_instantiate	lb_ins
s_object_display	lc_obj_hd
c_datetime	lc_dt
t_dw_mpl	ldw_focus,ldw_tmp
string			ls_status
date			ld_sysdate
long			ll_find


ldw_focus = iw_display.f_get_idwfocus( )
lc_obj_hd = iw_display.f_get_obj_handling( )
ld_sysdate = date(lc_dt.f_getsysdate( ))
if ldw_focus.dataobject = istr_dwo[1].s_dwo_default then
//	ldw_tmp = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
//	ll_find = ldw_tmp.find("status = 'new'",1,ldw_tmp.rowcount())
//	Do While ll_find > 0 
//		lb_ins.f_send_2_approve( ldw_tmp, lc_obj_hd, iw_display, ll_find)
//		ll_find = ldw_tmp.find("status = 'new'",ll_find + 1,ldw_tmp.rowcount() + 1)
//	Loop
else
	ldw_focus.setitem(ldw_focus.getrow( ) , 'act_solve_date', ld_sysdate)
//	ldw_tmp = iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
//	ls_status = ldw_tmp.getitemstring(ldw_tmp.getrow(),'status')
//	if ls_status = 'new' then 
//		lb_ins.f_send_2_approve( ldw_tmp, lc_obj_hd, iw_display, ldw_tmp.getrow())
//	end if
end if
return 0
end event

