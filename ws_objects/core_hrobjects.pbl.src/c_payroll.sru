$PBExportHeader$c_payroll.sru
forward
global type c_payroll from b_doc
end type
end forward

global type c_payroll from b_doc
event type integer e_action_process ( )
event type integer e_action_undo ( )
end type
global c_payroll c_payroll

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_str_unit ()
end prototypes

event type integer e_action_process();date						ld_fdate, ld_tdate
t_transaction			lt_transaction
t_dw_mpl				ldw_salary_line, ldw_doc
b_hr_instantiate		lb_hr_instance


ldw_salary_line = this.iw_display.f_get_dw( 'd_month_salary_line_grid')
if ldw_salary_line.rowcount( ) > 0 then
	gf_messagebox('m.c_payroll.e_action_process.01','Thông báo','Phải hủy kết quả trước khi tính lại lương','information','ok',1)
	return 0
end if

this.iw_display.f_get_transaction(lt_transaction )
ldw_doc = this.iw_display.f_get_dw( 'd_document_month_salary_grid')
ld_fdate = date(ldw_doc.getitemdatetime( ldw_doc.getrow() ,'count_f_date'))
ld_tdate = date(ldw_doc.getitemdatetime( ldw_doc.getrow() ,'count_t_date'))

if lb_hr_instance.f_calc_payroll( ld_fdate,ld_tdate,lt_transaction, ldw_salary_line) = -1 then 
	rollback using  lt_transaction;
	return -1
end if

if this.iw_display.event e_save( )<> -1 then
	ldw_doc.event e_refresh( )
	gf_messagebox('m.c_payroll.e_action_process.02','Thông báo','Hoàn tất tính lương','exclamation','ok',1)
else
	gf_messagebox('m.c_payroll.e_action_process.03','Thông báo','Lỗi cập nhất lương:@' + lt_transaction.sqlerrtext,'stop','ok',1)
	rollback using  lt_transaction;
	return -1
end if
return 1
end event

event type integer e_action_undo();string				ls_status
double			ldb_version_id
t_dw_mpl		ldw_doc
t_transaction	lt_transaction

this.iw_display.f_get_transaction(lt_transaction )
ldw_doc = this.iw_display.f_get_dw( 'd_document_month_salary_grid')
if ldw_doc.getrow( ) > 0 then
	ls_status = ldw_doc.getitemstring(ldw_doc.getrow( )  , 'status')
	if ls_status <> 'booked' then
		ldb_version_id =  ldw_doc.getitemnumber(ldw_doc.getrow( )  , 'version_id')
		DELETE salary_line WHERE object_ref_id = :ldb_version_id using lt_transaction;
		if lt_transaction.sqlnrows >0 then
			commit using lt_transaction;
			ldw_doc.event e_refresh( )
		end if
	else
		gf_messagebox('m.c_payroll.e_action_undo.01','Thông báo','Phải sửa ghi sỗ trước khi hủy kết quả','information','ok',1)
		return 0		
	end if
end if
return 1
end event

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_document_month_salary_grid'
istr_dwo[1].s_dwo_form = 'd_document_month_salary_form'
istr_dwo[1].s_dwo_grid = 'd_document_month_salary_grid'
istr_dwo[1].b_master = false
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_details = ''
istr_dwo[1].b_ref_table_yn  = false
istr_dwo[1].s_ref_table_field = ''
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Bảng lương'
istr_dwo[1].s_gb_name = 'gb_6'

//istr_dwo[2].s_dwo_default =  'd_bs_month_salary_form'
//istr_dwo[2].s_dwo_form = 'd_bs_month_salary_form'
//istr_dwo[2].s_dwo_grid = ''
//istr_dwo[2].b_detail = true
//istr_dwo[2].b_master = true
//istr_dwo[2].s_dwo_master = 'd_document_month_salary_grid;'
//istr_dwo[2].s_dwo_details = 'd_month_salary_sum_grid;d_month_salary_line_grid;'
//istr_dwo[2].s_master_keycol = 'ID'
//istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID'
//istr_dwo[2].b_ref_table_yn  = true
//istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE;doc_type;id;'
//istr_dwo[2].b_relation_1_1 = true
//istr_dwo[2].b_cascade_del = true
//istr_dwo[2].b_insert = true
//istr_dwo[2].b_update = true
//istr_dwo[2].b_delete = true
//istr_dwo[2].b_query = true
//istr_dwo[2].b_print = true
//istr_dwo[2].b_excel = true
//istr_dwo[2].b_traceable = true
//istr_dwo[2].b_focus_master = false
//istr_dwo[2].b_keyboardlocked = true
//istr_dwo[2].s_description = 'Thông tin ghi sổ tính lương'
//istr_dwo[2].s_gb_name = 'gb_7'
//
end subroutine

public subroutine f_set_actionpane ();//istr_actionpane[2].s_dwo_action = 'd_action_related_object'
//istr_actionpane[2].s_objname_handling = this.classname( )
//istr_actionpane[2].s_description = 'Đối tượng liên quan'
//
istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_dwo_tabpage ();//iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
//iastr_dwo_tabpage[1].s_display_model = '1d'
//iastr_dwo_tabpage[1].i_index = 1
//iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_month_salary_sum_grid'
//iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
//iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_month_salary_sum_grid'
//iastr_dwo_tabpage[1].str_dwo[1].s_popmenu_items = ''
//iastr_dwo_tabpage[1].str_dwo[1].b_master = false
//iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
//iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
//iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_bs_month_salary_form;'
//iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = ';'
//iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = ''
//iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol = 'ID;'
//iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol = 'ID;'
//iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = false
//iastr_dwo_tabpage[1].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
//iastr_dwo_tabpage[1].str_dwo[1].b_insert = false
//iastr_dwo_tabpage[1].str_dwo[1].b_update = false
//iastr_dwo_tabpage[1].str_dwo[1].b_delete = false
//iastr_dwo_tabpage[1].str_dwo[1].b_query = true
//iastr_dwo_tabpage[1].str_dwo[1].b_print = true
//iastr_dwo_tabpage[1].str_dwo[1].b_excel = true
//iastr_dwo_tabpage[1].str_dwo[1].b_keyboardlocked = true
//iastr_dwo_tabpage[1].str_dwo[1].b_traceable = true
//iastr_dwo_tabpage[1].str_dwo[1].s_description ='Lương tổng hợp'
//
//iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
//iastr_dwo_tabpage[2].s_display_model = '1d'
//iastr_dwo_tabpage[2].i_index = 2
//iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_month_salary_line_grid'
//iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = ''
//iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = 'd_month_salary_line_grid'
//iastr_dwo_tabpage[2].str_dwo[1].b_master = false
//iastr_dwo_tabpage[2].str_dwo[1].b_detail = true
//iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = true
//iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_bs_month_salary_form;'
//iastr_dwo_tabpage[2].str_dwo[1].s_dwo_details = ''
//iastr_dwo_tabpage[2].str_dwo[1].s_dwo_shared = ''
//iastr_dwo_tabpage[2].str_dwo[1].s_master_keycol = 'ID;'
//iastr_dwo_tabpage[2].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
//iastr_dwo_tabpage[2].str_dwo[1].b_ref_table_yn  = false
//iastr_dwo_tabpage[2].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
//iastr_dwo_tabpage[2].str_dwo[1].b_insert = true
//iastr_dwo_tabpage[2].str_dwo[1].b_update = true
//iastr_dwo_tabpage[2].str_dwo[1].b_delete = true
//iastr_dwo_tabpage[2].str_dwo[1].b_query = true
//iastr_dwo_tabpage[2].str_dwo[1].b_print = true
//iastr_dwo_tabpage[2].str_dwo[1].b_excel = true
//iastr_dwo_tabpage[2].str_dwo[1].b_keyboardlocked = true
//iastr_dwo_tabpage[2].str_dwo[1].b_traceable = true
//iastr_dwo_tabpage[2].str_dwo[1].s_description ='Lương chi tiết'
//
end subroutine

public subroutine f_set_str_unit ();
//--datawindow chứa các cột cần làm tròn--//
istr_unit[1].s_dwo_handing = ';;d_month_salary_sum_grid;d_month_salary_sum_grid;d_bs_month_salary_form;'
//--các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = ';;payment_amt;staff_si_amt;exchange_rate'
//--nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[1].s_dwo_unit = ';;d_bs_month_salary_form;d_bs_month_salary_form;d_bs_month_salary_form'
//--tên cột hứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = ';;uom_code;uom_code;exchange_rate'
//--loại làm tròn --//
istr_unit[1].s_type = ';;amount;bc;ex'
//--datawindow của cột chứa mã hàng--//
istr_unit[1].s_dwo_object = ''
//--cột chứa mã đơn vị--//
istr_unit[1].s_colname_object = ''
end subroutine

on c_payroll.create
call super::create
end on

on c_payroll.destroy
call super::destroy
end on

event constructor;call super::constructor;

is_table = 'document'
ib_changed_dwo_4edit = true
this.ib_keyboardlocked = true
is_display_model = '1d'
is_object_title = 'Bảng lương'
istr_actionpane[1].s_description = is_object_title


istr_actionpane[1].s_dwo_action = 'd_action_edit'
istr_actionpane[1].s_button_name = 'b_add;b_insert;b_modify;b_save;b_query;b_execquery;b_filteron;b_refresh;b_delete;b_process;b_deprocess;b_post;b_account_view;'
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title
end event

event e_dw_e_postinsertrow;//-- Override --//
any							laa_retrieve[], laa_data[]
double						ldb_version_id, ldb_branch
b_obj_instantiate			lbo_ins
s_str_data					lstr_data

ldb_version_id = lbo_ins.f_Create_id_ex( it_transaction )
rpo_dw.setitem(vl_currentrow,'doc_type','PAYROLL')
rpo_dw.setitem(vl_currentrow,'object_ref_table','BOOKED_SLIP')
rpo_dw.setitem(vl_currentrow,'version_id',ldb_version_id)
rpo_dw.setitem(vl_currentrow,'handled_by',gi_userid)
rpo_dw.setitem(vl_currentrow,'object_name', g_user.f_get_name_of_userid_ex(gi_userid, it_transaction ) )
rpo_dw.setitem(vl_currentrow,'status','new')
rpo_dw.setitem(vl_currentrow,'document_date',date(gd_session_date))
rpo_dw.setitem(vl_currentrow,'TRANS_DATE',date(gd_session_date))
//rpo_dw.setitem(vl_currentrow,'version_no',1)

laa_retrieve[1] = upper(mid(this.classname(),3))
if  lbo_ins.f_is_branch_yn_ex('u_trans_setup', it_transaction )then
	ldb_branch = gdb_branch
else
	ldb_branch = 0
end if			
if this.f_get_dfl_trans_info(laa_retrieve[1]  , ldb_branch, lstr_data,it_transaction ) > 0 then
	idb_trans_id = lstr_data.db_data
	if not isnull(idb_trans_id) and idb_trans_id > 0 then 
		laa_data[1] = idb_trans_id
		this.f_init_object_table(ids_trans_setup, 'd_trans_setup_grid', 'object_ref_id;',laa_data[],laa_retrieve[], it_transaction)
		rpo_dw.setitem(vl_currentrow,'trans_hdr_id',idb_trans_id)
		rpo_dw.setitem(vl_currentrow,'trans_desc',lstr_data.as_data[1] )
		rpo_dw.setitem( vl_currentrow,'QUANTITY_YN',lstr_data.as_data[2] )
		rpo_dw.setitem( vl_currentrow,'VALUE_YN',lstr_data.as_data[3] )
	else
		// không có giao dịch mặc định
	end if	
	//-- set cài đặt ghi sổ phụ mặc định cho chứng từ --//
	if rpo_dw.describe( "sob_yn.x") <> "!" and idb_trans_id > 0 then
		rpo_dw.setitem(vl_currentrow,'sob_yn', lstr_data.as_data[4])
	end if	
end if
return vl_currentrow

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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query;b_blank;b_process;b_undo;b_blank;b_post;b_account_view;b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_filteron;b_query;b_blank;b_process;b_undo;b_blank;b_post;b_account_view;b_refresh;b_delete;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query;b_blank;b_process;b_undo;b_blank;b_post;b_account_view;b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_modify;b_filteron;b_query;b_blank;b_process;b_undo;b_blank;b_post;b_account_view;b_refresh;b_delete;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_insert;b_modify;b_filteron;b_query;b_blank;b_process;b_undo;b_blank;b_post;b_account_view;b_refresh;b_delete;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
				istr_actionpane[li_idx].s_visible_buttons =  'b_book;b_attach;b_doc_trace_on;b_user_trace;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
				
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_dw_e_postsave;call super::e_dw_e_postsave;double		ldb_doc_id, ldb_extend_id, ldb_billto_id, ldb_object_id, ldb_payment_term, ldb_payment_method, ldb_delivery_mode
double		ldb_base_curr_id, ldb_exrate, ldb_driver_id, ldb_transport_id
decimal		ldc_transport_amt
string			ls_currCode, ls_currName,ls_desc, ls_addr, ls_qty_yn, ls_value_yn, ls_invoice_yn, ls_alloc_yn,ls_tax_included, ls_vendor_delivery_no
date			ld_due_date, ld_trans_date, ld_rec_inv_date

c_unit_instance			lc_unit_ins

ldb_doc_id =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'id') 
if ldb_doc_id > 0 then
	
	//-- booked_sliP--//
	ldb_extend_id = rpo_dw.getitemnumber(rpo_dw.getrow(), 'extend_id') 

	ls_desc =  rpo_dw.getitemstring(rpo_dw.getrow(), 'description')
	ls_qty_yn =  rpo_dw.getitemstring(rpo_dw.getrow(), 'quantity_yn') 
	ls_value_yn =  rpo_dw.getitemstring(rpo_dw.getrow(), 'value_yn')		
	ld_trans_date =  date(rpo_dw.getitemdatetime(rpo_dw.getrow(), 'document_date') )
	
	if ldb_extend_id > 0 then
		//-- update--//		
		UPDATE booked_slip 
		set  description = :ls_desc,quantity_yn = :ls_qty_yn, value_yn = :ls_value_yn,
								trans_date = :ld_trans_date
		where id = :ldb_extend_id using it_transaction;
	else
		//-- insert--//
		ldb_extend_id =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'version_id') 
		INSERT into booked_slip (id, object_ref_id, object_ref_Table, company_id, branch_id, created_by, created_Date, last_mdf_by, last_mdf_date, doc_type,version_no,
								  description,quantity_yn, value_yn, trans_date)
		VALUES(:ldb_extend_id, :ldb_doc_id, 'DOCUMENT',:gi_user_comp_id, :gdb_branch, :gi_userid, sysdate, :gi_userid, sysdate,'PAYROLE', 1,
					:ls_desc, :ls_qty_yn, :ls_value_yn, :ld_trans_date)
		using it_transaction;
	end if

	return 1
end if
return 0
end event

event e_dw_e_predelete;call super::e_dw_e_predelete;double		ldb_extend_id, ldb_doc_id
int				li_cnt
b_obj_instantiate		lbo_ins

	//-- check matching --//
	ldb_doc_id = rpo_dw.getitemnumber(vl_currentrow, 'id') 
	select count(id) into :li_cnt
	from matching where f_doc_id = :ldb_doc_id using it_transaction;
	if li_cnt > 0 then
		gf_messagebox('m.c_po.e_dw_e_predelete.01','Thông báo','Phiếu đã kết với chứng từ khác nên không xoá được','stop','ok',1)
		return -1
	end if
	//-- delete matching--//
	select count(id) into :li_cnt
	from matching where t_doc_id = :ldb_doc_id using it_transaction;	
	if li_cnt > 0 then
		delete from matching where t_doc_id = :ldb_doc_id using it_transaction;	
	end if
	//-- xoa attach--//
	DELETE  attachment where object_ref_id = :ldb_doc_id using it_transaction;	
	//-- delete detail--//
	ldb_extend_id = rpo_dw.getitemnumber(vl_currentrow, 'extend_id') 
	if ldb_extend_id > 0 then
		iw_display.f_get_transaction(it_transaction)
		DELETE  booked_slip where id = :ldb_extend_id using it_transaction;
		return 1
	end if

return 0
end event

