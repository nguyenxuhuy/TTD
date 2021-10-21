$PBExportHeader$c_comm_journal.sru
forward
global type c_comm_journal from b_doc
end type
end forward

global type c_comm_journal from b_doc
event type integer e_action_process ( )
end type
global c_comm_journal c_comm_journal

type variables

end variables

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_str_unit ()
public subroutine f_set_dwo_related ()
public subroutine f_set_actionpane ()
public subroutine f_set_str_streamvalue ()
public function integer f_reset_fixedpart_grid ()
public function integer f_resize_fixedpart_form ()
public function integer f_resize_fixedpart_grid ()
public function integer f_set_comm_line (double vdb_staff_id, t_ds_db vds_trans_setup, ref t_dw_mpl rdw_comm_line, double vdba_comm[], double vdb_open_sales, double vdb_open_comm)
end prototypes

event type integer e_action_process();/****************************************************************************************
Chức năng: Tính hoa hồng của nhân viên kinh doang theo chính sách.
				Quy ước: mỗi kỳ chỉ được tạo 1 phiếu để đê phần mềm tự động tính cho tất cả nhân viên có hưởng hoa hồng.
				Chức năng cho phép xóa đi và tính lại.
--------------------------------------------------------------------------------------------------------------------------------------------*/
string				ls_sql,ls_where
long				ll_cnt, ll_row
int					li_rtn
double			ldb_staff_id, ldb_dept_id, ldb_comm[], ldb_prev_doc_id, ldb_outstanding_sales, ldb_outstanding_comm
double			ldb_trans_id, ldb_empty[]
date				ld_fdate, ld_tdate
any				laa_arg[]
t_ds_db					lds_comm_staff, lds_objsales_objcomm, lds_comm_rate, lds_trans_setup
t_ds_db					lds_sales_revenue_period, lds_settled_revenue_period, lds_comm_journal_line
t_dw_mpl				ldw_comm_journal, ldw_journal_line, ldw_main
b_obj_instantiate		lb_obj
t_transaction			lt_transaction

//-- Lấy toàn bộ thông tin cài đặt nghiệp vụ của chứng từ --//
ldw_main = this.iw_display.f_get_dwmain( )
ldb_trans_id = ldw_main.getitemnumber( ldw_main.getrow( ), 'trans_hdr_id')
if ldb_trans_id = 0 or isnull(ldb_trans_id) then
	gf_messagebox('m.c_comm_journal.e_action_process.01','Thông báo','Chứng từ chưa có giao dịch','exclamation','ok',1)
	return -1
end if	
lds_trans_setup = create t_ds_db
if this.f_get_trans_setup(ldb_trans_id, lds_trans_setup) < 1 then
	gf_messagebox('m.c_comm_journal.e_action_process.02','Thông báo','Giao dịch ghi sổ chưa cài đặt','exclamation','ok',1)
	destroy lds_trans_setup
	return -1		
end if

//-- Lấy f_date, t_date tính comm --//
ldw_journal_line = this.iw_display.f_get_dw('d_gl_journal_line_grid')
ldw_comm_journal= this.iw_display.f_get_dw('d_counting_form')
ld_tdate = date(ldw_comm_journal.getitemdatetime(ldw_comm_journal.getrow(), 'trans_date'))

//-- Lấy ngày liền sau ngày đóng kỳ liền trước: Nếu là kỳ đâu tiên thì lấy ngày đầu năm tài chính --//
SELECT booked_slip.trans_date, document.id into :ld_fdate , :ldb_prev_doc_id
FROM booked_slip 
    JOIN document ON document.version_id = booked_slip.id 
    JOIN ( select max(booked_slip.trans_date) max_date 
               from booked_slip 
               join document ON document.version_id = booked_slip.id 
               where document.doc_type='COMM_JOURNAL' 
                  and document.status IN ('completed','booked') )mxdate on mxdate.max_date = booked_slip.trans_date
WHERE document.doc_type='COMM_JOURNAL' 
and document.status IN ('completed','booked') USING sqlca;  

if ldb_prev_doc_id > 0 then
	lds_comm_journal_line = create t_ds_db
	lds_comm_journal_line.dataobject = 'd_comm_journal_line_grid'
		
	lds_comm_journal_line.f_getcurrentsql( ls_sql,ls_where)
	
	ls_sql += 	' join booked_slip bs on bs.id = ledger_line.object_ref_id ' + &
					' join document on document.version_id = bs.id ' + &
					' where document.id = ' + string(ldb_prev_doc_id)
	ls_where = lds_comm_journal_line.modify("Datawindow.Table.Select= '" + ls_sql +"'")		
	lds_comm_journal_line.f_settransobject( sqlca)
	lds_comm_journal_line.retrieve( )
end if

if not isnull(ld_fdate) then
	if ld_tdate < ld_fdate then
		ld_fdate = relativedate(ld_tdate, 1)
	else
		gf_messagebox('m.c_comm_journal.e_action_process.01','Thông báo','Ngày chốt tính hoa hồng phải lớn hơn ngày chốt kỳ trước:@'+ string(ld_tdate, gs_w_date_format),'exclamation','ok',1)
		return -1		
	end if
else
	SELECT min(from_date) into :ld_fdate FROM fiscal_period t
	WHERE t.PERIOD_TYPE = 'NORMAL'
	 AND t.fiscal_year = (SELECT t1.fiscal_year FROM fiscal_period t1 WHERE :ld_tdate BETWEEN t1.from_date AND t1.to_date)  USING sqlca;
	 if isnull(ld_fdate) then
		gf_messagebox('m.c_comm_journal.e_action_process.02','Thông báo','Chưa tạo năm tài chính','exclamation','ok',1)
		return -1
	end if
end if

//-- lấy tất cả hóa đơn bán hàng trong kỳ (doanh số không thuế) và hoa hồng cho khách --//
lds_sales_revenue_period = create t_ds_db
if lb_obj.f_get_ds_sales_revenue_period(lds_sales_revenue_period,ld_fdate, ld_tdate) = -1 then return -1
 
//-- lấy tất cả tiền thanh toán của hóa đơn có  1salesperson--//
lds_settled_revenue_period = create t_ds_db
if lb_obj.f_get_ds_settled_revenue_period(lds_settled_revenue_period, ld_fdate, ld_tdate) = -1 then return -1


//--lấy tất cả đối tượng tính doanh số và đối tượng tính hoa hồng --//
lds_objsales_objcomm = create t_ds_db
lds_objsales_objcomm.dataobject = 'ds_objsales_objcomm'

lds_objsales_objcomm.f_settransobject( sqlca)
ll_cnt = lds_objsales_objcomm.retrieve(ld_tdate )

//--lấy tất cả chính sách tỷ lệ hoa hồng: 1 nhân viên chỉ được cài đặt 1 chính sách --//
lds_comm_rate = create t_ds_db
lds_comm_rate.dataobject = 'ds_comm_rate'
lds_comm_rate.f_settransobject( sqlca)
ll_cnt = lds_comm_rate.retrieve(ld_tdate )

//-- danh sách nhân viên có hưởng hoa hồng --//
lds_comm_staff = create t_ds_db 
lds_comm_staff.dataobject = 'ds_comm_staff'
lds_comm_staff.f_settransobject( sqlca)
ll_cnt = lds_comm_staff.retrieve(ld_tdate )

lds_comm_staff.setfilter( " minus_sales_comm_yn = 'N' or isnull(minus_sales_comm_yn) ")
lds_comm_staff.filter( )
FOR ll_row = 1 to lds_comm_staff.rowcount()
	ldb_staff_id = lds_comm_staff.getitemnumber( ll_row, 'staff_id')
	ldb_dept_id = lds_comm_staff.getitemnumber( ll_row, 'dept_id')
	//-- tính hoa hồng trong kỳ --//
	ldb_comm[] = ldb_empty[]
	li_rtn = lb_obj.f_get_salesperson_comm(ldb_staff_id,ldb_dept_id, lds_sales_revenue_period,lds_settled_revenue_period,  lds_objsales_objcomm, lds_comm_rate, ldb_comm[])
	if li_rtn = -1 then return -1
	//-- tính số đầu kỳ --//
	if ldb_prev_doc_id > 0 then
		ldb_outstanding_sales = 0
		ldb_outstanding_comm = 0		
		li_rtn = lb_obj.f_get_salesperson_outstanding_comm( ldb_staff_id, lds_comm_journal_line,ldb_outstanding_sales, ldb_outstanding_comm)
		if li_rtn = -1 then return -1
	end if
	
	li_rtn = this.f_set_comm_line(ldb_staff_id,lds_trans_setup, ldw_journal_line , ldb_comm[], ldb_outstanding_sales, ldb_outstanding_comm)
	if li_rtn = -1 then return -1
NEXT

if ldw_journal_line.update(true, false ) = -1 then
	this.iw_display.f_get_transaction(lt_transaction)
	rollback using lt_transaction;
	return -1
end if

ldw_journal_line.resetupdate( )	
ldw_journal_line.event e_retrieve( )
lds_comm_staff.setfilter( " minus_sales_comm_yn = 'Y' ")
lds_comm_staff.filter( )
FOR ll_row = 1 to lds_comm_staff.rowcount()
	ldb_staff_id = lds_comm_staff.getitemnumber( ll_row, 'staff_id')
	ldb_dept_id = lds_comm_staff.getitemnumber( ll_row, 'dept_id')
	//-- tính hoa hồng trong kỳ --//
	ldb_comm[] = ldb_empty[]
	lb_obj.f_get_support_person_comm(ldb_staff_id, ldb_dept_id, lds_sales_revenue_period,lds_settled_revenue_period,  lds_objsales_objcomm,ldw_journal_line, lds_comm_rate, ldb_comm[])
	
	//-- tính số đầu kỳ --//
	ldb_outstanding_sales = 0
	ldb_outstanding_comm = 0
	if ldb_prev_doc_id > 0 then
		li_rtn = lb_obj.f_get_salesperson_outstanding_comm( ldb_staff_id, lds_comm_journal_line,ldb_outstanding_sales, ldb_outstanding_comm)
		if li_rtn = -1 then return -1
	end if	
	li_rtn = this.f_set_comm_line(ldb_staff_id,lds_trans_setup, ldw_journal_line , ldb_comm[], ldb_outstanding_sales, ldb_outstanding_comm)
	if li_rtn = -1 then return -1	
NEXT

if ldw_journal_line.update(true, false ) = -1 then
	this.iw_display.f_get_transaction(lt_transaction)
	rollback using lt_transaction;
	return -1
end if

destroy lds_sales_revenue_period
destroy lds_settled_revenue_period
destroy lds_comm_staff
destroy lds_objsales_objcomm
destroy lds_comm_rate

return 0
end event

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_document_counting_grid'
istr_dwo[1].s_dwo_form = 'd_document_counting_form'
istr_dwo[1].s_dwo_grid = 'd_document_counting_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_counting_form;' 
istr_dwo[1].b_ref_table_yn  = true
istr_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;doc_type;VERSION_ID;'
istr_dwo[1].b_relation_1_1 = true
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_gb_name = 'gb_6'
istr_dwo[1].s_description = 'Tính hoa hồng'

istr_dwo[2].s_dwo_default =  'd_counting_form'
istr_dwo[2].s_dwo_form = 'd_counting_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = true
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_details = 'd_comm_journal_line_grid;'
istr_dwo[2].s_dwo_master = 'd_document_counting_grid;'
istr_dwo[2].s_master_keycol = 'ID;'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[2].b_ref_table_yn  = true
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE;doc_type;id'
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
istr_dwo[2].s_description = 'Hoa hồng kinh doanh'


end subroutine

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '2d'
iastr_dwo_tabpage[1].i_upperpart_height = 2/3
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_comm_journal_line_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_comm_journal_line_grid'
iastr_dwo_tabpage[1].str_dwo[1].b_master = true
iastr_dwo_tabpage[1].str_dwo[1].b_detail = true
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = 'd_counting_form;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = 'd_post_line_grid;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[1].str_dwo[1].b_insert = true
iastr_dwo_tabpage[1].str_dwo[1].b_update = true
iastr_dwo_tabpage[1].str_dwo[1].b_delete = true
iastr_dwo_tabpage[1].str_dwo[1].b_query = true
iastr_dwo_tabpage[1].str_dwo[1].b_print = true
iastr_dwo_tabpage[1].str_dwo[1].b_excel = true
iastr_dwo_tabpage[1].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Chi tiết hoa hồng'

iastr_dwo_tabpage[1].str_dwo[2].s_dwo_default =  'd_post_line_grid'
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_grid = 'd_post_line_grid'
iastr_dwo_tabpage[1].str_dwo[2].b_detail = true
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_master = 'd_comm_journal_line_grid;'
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[2].s_master_keycol = 'ID;'
iastr_dwo_tabpage[1].str_dwo[2].s_detail_keycol = 'object_ref_id;'
iastr_dwo_tabpage[1].str_dwo[2].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE'
iastr_dwo_tabpage[1].str_dwo[2].b_insert = false
iastr_dwo_tabpage[1].str_dwo[2].b_update = true
iastr_dwo_tabpage[1].str_dwo[2].b_delete = true
iastr_dwo_tabpage[1].str_dwo[2].b_query = true
iastr_dwo_tabpage[1].str_dwo[2].b_print = true
iastr_dwo_tabpage[1].str_dwo[2].b_excel = true
iastr_dwo_tabpage[1].str_dwo[2].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[2].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[2].s_description = 'Định khoản'
iastr_dwo_tabpage[1].i_index = 1


end subroutine

public subroutine f_set_str_unit ();//--Datawindow chứa các cột cần làm tròn--//
istr_unit[1].s_dwo_handing = 'd_gl_journal_line_grid;d_gl_journal_line_grid;d_gl_journal_line_grid;d_counting_form;d_counting_form;'
//--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = 'count_qty;price;amount;bc;ex'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[1].s_dwo_unit = 'd_gl_journal_line_grid;d_counting_form;d_counting_form;d_counting_form;d_counting_form;'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = 'uom_code;uom_code;uom_code;uom_code;EXCHANGE_RATE'
//--Loại làm tròn --//
istr_unit[1].s_type =  'item;price;amount;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[1].s_dwo_object = ''
//--Cột chứa mã hàng--//
istr_unit[1].s_colname_object = ''

////--Datawindow chứa các cột cần làm tròn--//
//istr_unit[2].s_dwo_handing = 'd_material_grid;d_material_grid;d_material_grid;d_material_grid;d_assemble_form;'
////--Các cột cần làm tròn ,nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
//istr_unit[2].s_colname_data = 'qty;price;cogs;bc;ex'
////--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
//istr_unit[2].s_colname_convert = ''
//istr_unit[2].s_colname_diff = ''
////--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
//istr_unit[2].s_dwo_unit = 'd_material_grid;"";d_assemble_form;d_assemble_form;d_assemble_form'
////--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
//istr_unit[2].s_colname_unit = 'uom_code;"";uom_code;uom_code;EXCHANGE_RATE'
////--Loại làm tròn --//
//istr_unit[2].s_type =  'item;price;amount;bc;ex'
////--Datawindow của cột chứa mã hàng--//
//istr_unit[2].s_dwo_object = 'd_material_grid'
////--Cột chứa mã hàng--//
//istr_unit[2].s_colname_object = 'item_code'
end subroutine

public subroutine f_set_dwo_related ();//istr_dwo_related[1].s_related_obj_name = 'b_view'				// đối tượng copy đến
//istr_dwo_related[1].s_main_obj_dwo = 'd_document_inventory_grid'		//datawindow quan hệ main
//istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
//istr_dwo_related[1].s_related_obj_dwo = 'dv_materials_delivery_form'	// datawindow quan hệ đến
//istr_dwo_related[1].s_related_obj_column = 'id'			// cột quan hệ đến
//istr_dwo_related[1].s_relatedtext_column = 'code'					
//istr_dwo_related[1].s_text = 'In phiếu đề nghị vật tư'
//
//
//istr_dwo_related[2].s_related_obj_name = 'u_goods_delivery'					// đối tượng copy đến
//istr_dwo_related[2].s_main_obj_dwo = 	'd_material_grid'	//datawindow quan hệ main
//istr_dwo_related[2].s_main_obj_column = 'id'			// cột quan hệ của main
//istr_dwo_related[2].s_related_obj_dwo =  'd_inventory_line_delivery_grid'	// datawindow quan hệ đến
//istr_dwo_related[2].s_related_obj_column = 'id'			// cột quan hệ đến
//istr_dwo_related[2].b_f_matching = true
//istr_dwo_related[2].s_relatedtext_column = 'doc_code'					
//istr_dwo_related[2].s_text = 'Phiếu nhập kho : '
//
//istr_dwo_related[2].s_main_obj_dwo_copy[1] =  'd_material_grid'// datawindow copy từ
//istr_dwo_related[2].s_main_obj_column_copy[1] = 'ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;QTY;QTY;cogs;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;warehouse_id;wh_code;wh_name;object_type;' // cột copy từ
//istr_dwo_related[2].s_related_obj_dwo_copy[1] = 'd_inventory_line_delivery_grid' // datawindow copy đến
//istr_dwo_related[2].s_related_obj_column_copy[1] ='ITEM_ID;item_code;item_name;LINE_TEXT;NOTE;doc_qty;QTY;cogs;SPEC_ID;spec_code;spec_name;uom_code;TRANS_UOM;object_id;cus_code;cus_name;object_type;'  // cột copy đến
//istr_dwo_related[2].b_copy_line[1] = true
//istr_dwo_related[2].s_main_obj_column_chk[1] = ''
//istr_dwo_related[2].s_related_obj_column_chk[1] = ''
//istr_dwo_related[2].s_f_obj_column_chk[1] = 'ITEM_ID'
//istr_dwo_related[2].s_t_obj_column_chk[1] = 'ITEM_ID'
//istr_dwo_related[2].s_match_f_dwo[1] = 'd_material_grid'
//istr_dwo_related[2].s_match_f_col_obj[1] = 'item_id'
//istr_dwo_related[2].s_match_t_dwo[1] = 'd_inventory_line_delivery_grid'
//istr_dwo_related[2].s_match_f_column[1] = 'qty'
//istr_dwo_related[2].s_match_t_column[1] = 'qty'
//istr_dwo_related[2].s_match_column[1] = 'qty'
//
//istr_dwo_related[2].s_main_obj_dwo_copy[2] =  'd_assemble_form'
//istr_dwo_related[2].s_main_obj_column_copy[2] = 'note;description;trans_date;uom_code;currency_id;exchange_rate;' 
//istr_dwo_related[2].s_related_obj_dwo_copy[2] = 'd_goods_delivery_form' 
//istr_dwo_related[2].s_related_obj_column_copy[2] ='note;description;trans_date;uom_code;currency_id;exchange_rate;' 
//istr_dwo_related[2].s_main_obj_column_chk[2] = ''
//istr_dwo_related[2].s_related_obj_column_chk[2] = ''
//istr_dwo_related[2].s_match_f_dwo[2] = ''
//istr_dwo_related[2].s_match_t_dwo[2] = ''
//istr_dwo_related[2].s_match_f_column[2] = ''
//istr_dwo_related[2].s_match_t_column[2] = ''
//istr_dwo_related[2].s_match_column[2] = ''
//istr_dwo_related[2].s_main_obj_column_sum[2] = ''
//istr_dwo_related[2].s_related_obj_column_sum[2] = ''
//istr_dwo_related[2].s_f_obj_column_chk[2] = ''
//istr_dwo_related[2].s_t_obj_column_chk[2] = ''
//istr_dwo_related[2].b_f_sum[2] = false
//istr_dwo_related[2].b_copy_line[2] = false
//
//istr_dwo_related[3].s_related_obj_name = 'b_view'				// đối tượng copy đến
//istr_dwo_related[3].s_main_obj_dwo = 'd_document_inventory_grid'		//datawindow quan hệ main
//istr_dwo_related[3].s_main_obj_column = 'id'			// cột quan hệ của main
//istr_dwo_related[3].s_related_obj_dwo = 'dv_product_receipt_form'	// datawindow quan hệ đến
//istr_dwo_related[3].s_related_obj_column = 'id'			// cột quan hệ đến
//istr_dwo_related[3].s_relatedtext_column = 'code'					
//istr_dwo_related[3].s_text = 'In phiếu nhập kho thành phẩm lắp ráp'
//
//
end subroutine

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name = ''
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_str_streamvalue ();////-- couting --//
//istr_streamvalue[1].s_f_obj_dwo =  'd_post_line_invoice_grid' 
//istr_streamvalue[1].s_f_obj_column =  'CR_ACCOUNT_ID'
//istr_streamvalue[1].s_f_column_sv = 'T_OBJECT_ID' 
//
//istr_streamvalue[1].s_t_obj_dwo = 'd_inventory_line_counting_grid'
//istr_streamvalue[1].s_t_obj_column = 'WAREHOUSE_ID'
//istr_streamvalue[1].s_t_column_sv = 'F_OBJECT_ID'
//
//istr_streamvalue[1].s_item_dwo = 'd_inventory_line_counting_grid'
//istr_streamvalue[1].s_item_column = 'item_id;spec_id;qty;TRANS_UOM;loc_id'
//istr_streamvalue[1].s_item_column_sv = 'item_id;spec_id;qty;uom_id;loc_id'
//
////istr_streamvalue[1].s_item_lot_dwo = 'd_lot_line_grid'
////istr_streamvalue[1].s_item_lot_column = 'qty;lot_no;serial_no;'
////istr_streamvalue[1].s_item_lot_column_sv = 'qty;LOT_NO;SERIAL_NO;'
//
//istr_streamvalue[1].s_currency_dwo = 'd_counting_form'
//istr_streamvalue[1].s_currency_column = 'CURRENCY_ID;exchange_rate'
//istr_streamvalue[1].s_currency_column_sv = 'TRANS_CUR_ID;exchange_rate'
//
//istr_streamvalue[1].s_value_dwo = 'd_inventory_line_counting_grid'
//istr_streamvalue[1].s_value_column = 'item_id;COGS;COGS;spec_id;qty'
//istr_streamvalue[1].s_value_column_sv = 'item_id;trans_value;base_value;spec_id;qty'
//
//
end subroutine

public function integer f_reset_fixedpart_grid ();
this.iw_display.dynamic f_reset_ii_fixedpart2_height_grid()
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_resize_fixedpart_form ();
this.iw_display.dynamic f_reset_ii_fixedpart2_height_form()
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_resize_fixedpart_grid ();this.iw_display.dynamic f_reset_ii_fixedpart2_height_grid(0)
this.iw_display.dynamic f_resize(is_display_model)
return 0
end function

public function integer f_set_comm_line (double vdb_staff_id, t_ds_db vds_trans_setup, ref t_dw_mpl rdw_comm_line, double vdba_comm[], double vdb_open_sales, double vdb_open_comm);double					ldb_base_amount, ldb_base_curr, ldb_base_round_id
long						ll_rtn_row, ll_insertrow
string						ls_base_currcode, ls_base_currname
s_str_post_account	lstr_post_account

if vdba_comm[1]+vdb_open_sales > 0 then
	this.ic_unit_instance.f_get_base_cur( ldb_base_curr, ls_base_currcode, ls_base_currname)
	ldb_base_round_id = this.ic_unit_instance.f_get_round_id( ldb_base_curr, 0, 'amount')

	ldb_base_amount = (vdb_open_comm + vdba_comm[3]) *vdba_comm[2] /(vdba_comm[1]+vdb_open_sales)
	ldb_base_amount= this.ic_unit_instance.f_round(rdw_comm_line, ldb_base_round_id, ldb_base_amount)

	ll_insertrow = rdw_comm_line.event e_addrow()
	
	rdw_comm_line.setitem(ll_insertrow,'CR_ACCOUNT_ID',vdb_staff_id)
	
	rdw_comm_line.setitem(ll_insertrow,'AMOUNT',ldb_base_amount)
	rdw_comm_line.setitem(ll_insertrow,'BASE_AMOUNT',ldb_base_amount)
	rdw_comm_line.setitem(ll_insertrow,'OPEN_BASE_SALES',vdb_open_sales)
	rdw_comm_line.setitem(ll_insertrow,'OPEN_BASE_COMM',vdb_open_comm)
	rdw_comm_line.setitem(ll_insertrow,'SALES_BASE_AMT',vdba_comm[1])
	rdw_comm_line.setitem(ll_insertrow,'SETTLED_BASE_AMT',vdba_comm[2])
	rdw_comm_line.setitem(ll_insertrow,'COMM_BASE_AMT',vdba_comm[3])
		
	ll_rtn_row = this.f_get_Trans_setup_account( vds_trans_setup, 'NULL', rdw_comm_line, ll_insertrow, lstr_post_account)
	
	rdw_comm_line.setitem(ll_insertrow,'DR_ACCOUNT_ID',lstr_post_account.db_dr_account )
	rdw_comm_line.setitem(ll_insertrow,'DR_SUBACCOUNT',lstr_post_account.db_dr_subaccount )
	rdw_comm_line.setitem(ll_insertrow,'CR_SUBACCOUNT',lstr_post_account.db_cr_subaccount )
	rdw_comm_line.setitem(ll_insertrow,'LINE_TEXT',lstr_post_account.s_trans_text )

end if

return 1
end function

on c_comm_journal.create
call super::create
end on

on c_comm_journal.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = true
ib_display_text = false
is_display_model = '2dgb_1tp'
is_object_title = 'Tính hoa hồng'
istr_actionpane[1].s_button_name = 'b_add;b_insert;b_modify;b_save;b_query;b_execquery;b_filteron;b_refresh;b_delete;b_cancel;b_view_multi;b_post;b_unpost;b_account_view;b_process;'
istr_actionpane[1].s_button_has_sub = 'b_view_multi;'
istr_actionpane[1].sa_sub_button[1]='b_view_counting_stock;b_view_counting_list;'
istr_actionpane[1].sa_enabled_subbutton[]= istr_actionpane[1].sa_sub_button[]
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
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_process;b_view_multi;b_blank;b_post;b_account_view;'  
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_process;b_view_multi;b_blank;b_post;b_account_view;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_process;b_view_multi;b_blank;b_post;b_account_view;b_blank;b_copyt_multi;b_blank;b_send_2_approve;b_approve;b_reject;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_process;b_view_multi;b_blank;b_post;b_blank;b_account_view;b_copyt_multi;b_blank;b_send_2_approve;b_approve;b_reject;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_process;b_view_multi;b_blank;b_post;b_account_view;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_blank;b_filteron;b_query;b_refresh;b_blank;b_delete;b_cancel;b_blank;b_process;b_view_multi;b_blank;b_post;b_account_view;'
					end if
				end if
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

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.dynamic f_set_ii_fixedpart2_height(250 )
iw_display.dynamic f_set_ii_upperpart_height(750)
return 0
end event

event e_window_open;call super::e_window_open;t_dw_mpl			ldw_main
any				laa_value[]
string a,b
//--form parm--//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '=COMMISSION'
ldw_main.f_add_where('doc_type;',laa_value[])
return 0
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;long			ll_line_no, ll_idx

if pos(rpo_dw.dataobject,'d_document') > 0 then
	 rpo_dw.setitem(vl_currentrow,'doc_type','COMMISSION')
elseif pos(rpo_dw.dataobject,'d_counting_form') > 0 then
	rpo_dw.setitem(vl_currentrow,'doc_type','COMMISSION')
	rpo_dw.setitem( vl_currentrow, 'VERSION_NO', 1)
	rpo_dw.setitem( vl_currentrow, 'trans_date', date(gd_session_date))
elseif pos(rpo_dw.dataobject,'d_gl_journal_line_') > 0 then
	rpo_dw.setitem(vl_currentrow,'object_type','ITEM')
	if vl_currentrow = 1 then
		ll_line_no = 1
	else
		ll_line_no = vl_currentrow
		for ll_idx = vl_currentrow + 1 to rpo_dw.rowcount()
			rpo_dw.setitem(ll_idx,'line_no',ll_idx)
		next
	end if
	rpo_dw.setitem(vl_currentrow,'line_no',ll_line_no)
end if
return vl_currentrow
end event

