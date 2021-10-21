$PBExportHeader$c_cost_accounting.sru
forward
global type c_cost_accounting from b_doc
end type
end forward

global type c_cost_accounting from b_doc
event type integer e_action_process ( )
end type
global c_cost_accounting c_cost_accounting

forward prototypes
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_window ()
public subroutine f_set_str_unit ()
public subroutine f_set_str_streamvalue ()
public subroutine f_set_dwo_related ()
public function integer f_insert_matching (t_ds_db vds_ledger_4_matching, double vdb_t_doc_id)
public function integer f_delete_matching (double vdb_t_doc_id)
public function integer f_insert_ledger_line (t_ds_db vds_transfered_amt, t_ds_db vds_alloc_base, ref t_dw_mpl rdw_line, double vdb_alloc_account_id, string vs_trans_desc)
end prototypes

event type integer e_action_process();/********************************************************************
Kết chuyển chi phí chung và phân bổ vào subaccount
--------------------------------------------------
- Nếu TK dư Nợ (TK chi phí chung) có subaccount được phân bổ toàn bộ giá trị qua cùng subaccount bên TK kết chuyển
- Nếu TK dư Nợ (TK chi phí chung) không subaccount được phân bổ theo tỷ lệ căn cứ của subaccount bên TK kết chuyển

********************************************************************/
double		ldb_trans_hdr_id, ldb_dr_account_id, ldb_doc_id
long			ll_rows
string			ls_dr_acct_code, lsa_dr_acct_code[], ls_base_acct_code, ls_acct_code, ls_trans_desc
t_ds_db		lds_trans_setup, lds_alloc_base, lds_transfered_amt, lds_trans_4_matching
t_dw_mpl				ldw_booked_slip, ldw_line, ldw_main
c_string					lc_string
b_obj_instantiate		lbo_inst

iw_display.event e_modify( )

ldw_main = iw_display.f_get_dwmain( )
if ldw_main.getrow( ) > 0 then
	ldb_doc_id = ldw_main.getitemnumber(  ldw_main.getrow( ), 'id')
	ldb_trans_hdr_id = ldw_main.getitemnumber(  ldw_main.getrow( ), 'trans_hdr_id')
	ls_trans_desc = ldw_main.getitemstring(  ldw_main.getrow( ), 'trans_desc')
else
	iw_display.event e_saveclose( )
	return 0
end if

ldw_booked_slip = iw_display.f_get_Dw(istr_dwo[2].s_dwo_default )
if ldw_booked_slip.rowcount( ) = 0 then	
	iw_display.event e_saveclose( )
	return 0
end if
//-- nếu đã có line, xoá thực hiện lại --//
ldw_line = iw_display.f_get_dw(istr_dwo[3].s_dwo_default)
if ldw_line.rowcount( ) > 0 then
	if gf_messagebox('m.c_cost_accounting.e_action_process.01','Thông báo','Phiếu đã có dữ liệu, bạn có muốn xoá và thực hiện lại không?','question','yesno',1) = 1 then
		ldw_line.event e_delete_all( )
	else
		iw_display.event e_saveclose( )
		return 0
	end if
end if
//-------------------------------------------------//
//-- lấy căn cứ phân bổ củaTK kết chuyển --//
//-------------------------------------------------//
//-- Lấy TK kết chuyển trong cài đặt giao dịch --//
lds_trans_setup = create t_ds_db
if this.f_get_trans_setup(ldb_trans_hdr_id, lds_trans_setup) < 1 then
	gf_messagebox('m.c_cost_accounting.e_action_process.02','Thông báo','Giao dịch ghi sổ chưa cài đặt','exclamation','ok',1)
	destroy lds_trans_setup
	return -1		
end if
if lds_trans_setup.rowcount( ) = 1 then
	ldb_dr_account_id = lds_trans_setup.getitemnumber(1,'DR_ACCT_ID')
end if
ls_acct_code = lbo_inst.f_get_object_code( ldb_dr_account_id)
if  ls_acct_code = '154' then
	//-- Lấy datastore căn cứ phân bổ : các subaccount của tk kết chuyển con dư nợ --//
	ls_base_acct_code = ldw_booked_slip.getitemstring(ldw_booked_slip.getrow() , 'receipt_person')
	if isnull(ls_base_acct_code) or ls_base_acct_code = '' then
		gf_messagebox('m.c_cost_accounting.e_action_process.03','Thông báo','Chưa chọn tài khoản làm căn cứ phân bổ kết chuyển','exclamation','ok',1)
		return -1
	end if
	lds_alloc_base = create t_ds_db
	lds_alloc_base.dataobject = 'ds_cost_accounting_alloc_base'
	lds_alloc_base.f_settransobject(sqlca)
	ll_rows = lds_alloc_base.retrieve(gi_user_comp_id, gdb_branch, gs_sob,ldb_dr_account_id, ls_base_acct_code)
	if ll_rows = 0 then
		gf_messagebox('m.c_cost_accounting.e_action_process.04','Thông báo','Chưa có giao dịch tạo giá trị làm căn cứ phân bổ','exclamation','ok',1)
		iw_display.event e_saveclose( )
		return 0
	end if
end if
//---------------------------------------------------------------//
//-- lấy giá trị chi phí chung cần kết chuyển và phân bổ --//
//---------------------------------------------------------------//
//-- Lấy datastore dư nợ của tài khoản chi phí chung cần kết chuyển và phân bổ--//

ls_dr_acct_code = ldw_booked_slip.getitemstring(ldw_booked_slip.getrow() , 'delivery_person')
if isnull(ls_dr_acct_code) or ls_dr_acct_code = '' then
	gf_messagebox('m.c_cost_accounting.e_action_process.05','Thông báo','Chưa chọn tài khoản kết chuyển','exclamation','ok',1)
	return -1
end if
if pos(ls_dr_acct_code,',') > 0 then
	gf_messagebox('m.c_cost_accounting.e_action_process.06','Thông báo','Kết chuyển nhiều tài khoản cách nhâu bằng dấu: ";"','exclamation','ok',1)
	return -1
end if
lc_string.f_stringtoarray( ls_dr_acct_code, ';', lsa_dr_acct_code)

lds_transfered_amt = create t_ds_db
lds_transfered_amt.dataobject = 'ds_cost_accounting_transfered_amt'
lds_transfered_amt.f_settransobject(sqlca)
ll_rows = lds_transfered_amt.retrieve(gi_user_comp_id, gdb_branch, gs_sob,lsa_dr_acct_code[])
if ll_rows = 0 then
	gf_messagebox('m.c_cost_accounting.e_action_process.07','Thông báo','Tài khoản kết chuẩn chưa có giá trị để kết chuyển','exclamation','ok',1)
	iw_display.event e_saveclose( )
	return 0
end if
//------------------------//
//-- insert matching --//
//-----------------------//
lds_trans_4_matching  = create t_ds_db
lds_trans_4_matching.dataobject = 'ds_cost_accounting_4_matching'
lds_trans_4_matching.f_settransobject(sqlca )
ll_rows = lds_trans_4_matching.retrieve(gi_user_comp_id, gdb_branch, gs_sob,lsa_dr_acct_code[])
if this.f_insert_matching( lds_trans_4_matching, ldb_doc_id) = -1 then return -1

//--------------------------------------------------------------//
//-- Thực hiện phân bổ ghi vào ledger_line của phiếu --//
//-------------------------------------------------------------//
if this.f_insert_ledger_line(lds_transfered_amt, lds_alloc_base, ldw_line, ldb_dr_account_id, ls_trans_desc) = -1 then return -1

iw_display.event e_saveclose( )
return 0


end event

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_button_name =  'b_pur_invoice;b_sal_invoice_return;'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_document_grid'
istr_dwo[1].s_dwo_form = 'd_document_form'
istr_dwo[1].s_dwo_grid = 'd_document_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_cost_accounting_form;' 
istr_dwo[1].b_ref_table_yn  = true
istr_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;doc_type;VERSION_ID;'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_gb_name = 'gb_6'
istr_dwo[1].s_description = 'Phân bổ và kết chuyển chi phí công trình'

istr_dwo[2].s_dwo_default =  'd_cost_accounting_form'
istr_dwo[2].s_dwo_form = 'd_cost_accounting_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = true
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].s_dwo_details = 'd_gl_journal_line_grid;'
istr_dwo[2].s_dwo_master = 'd_document_grid;'
istr_dwo[2].s_master_keycol = 'ID;'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[2].b_ref_table_yn  = true
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE;doc_type;id;'
istr_dwo[2].b_relation_1_1 = true
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_focus_master = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_description = 'Thông tin phiếu'

istr_dwo[3].s_dwo_default =  'd_gl_journal_line_grid'
istr_dwo[3].s_dwo_form = ''
istr_dwo[3].s_dwo_grid = 'd_gl_journal_line_grid'
istr_dwo[3].b_master = true
istr_dwo[3].b_detail = true
istr_dwo[3].b_cascade_del = true
istr_dwo[3].s_dwo_details = 'd_post_line_grid;'
istr_dwo[3].s_dwo_master = 'd_cost_accounting_form;'
istr_dwo[3].s_master_keycol = 'ID;'
istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[3].b_ref_table_yn  = false
istr_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[3].b_insert = true
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = true
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_excel = true
istr_dwo[3].b_traceable = true
istr_dwo[3].b_focus_master = false
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].s_gb_name = 'gb_7'
istr_dwo[3].s_description = 'Chi tiết phiếu'

istr_dwo[4].s_dwo_default =  'd_post_line_grid'
istr_dwo[4].s_dwo_form = ''
istr_dwo[4].s_dwo_grid = 'd_post_line_grid'
istr_dwo[4].b_detail = true
istr_dwo[4].s_dwo_master = 'd_gl_journal_line_grid;'
istr_dwo[4].s_master_keycol = 'ID;'
istr_dwo[4].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[4].b_ref_table_yn  = false
istr_dwo[4].s_ref_table_field = 'OBJECT_REF_TABLE;'
istr_dwo[4].b_insert = false
istr_dwo[4].b_update = true
istr_dwo[4].b_delete = true
istr_dwo[4].b_query = true
istr_dwo[4].b_print = true
istr_dwo[4].b_excel = true
istr_dwo[4].b_traceable = true
istr_dwo[4].b_keyboardlocked = true
istr_dwo[4].b_focus_master = false 
istr_dwo[4].s_gb_name = 'gb_8'
istr_dwo[4].s_description = 'Thông tin định khoản'

end subroutine

public subroutine f_set_str_unit ();//--Datawindow chứa các cột cần làm tròn--//
istr_unit[1].s_dwo_handing = ';;d_gl_journal_line_grid;d_gl_journal_line_grid;d_cost_accounting_form;'
//--Các cột cần làm tròn, nếu có cột để setitem sau khi qui đổi đơn vị tiền tệ thì không khai báo bc mà khai tên cột--//
istr_unit[1].s_colname_data = ';;amount;base_amount;exchange_rate'
//--Nếu không cần qui đổi trừ kho thì không khai bào tên cột--//
istr_unit[1].s_colname_convert = ''
istr_unit[1].s_colname_diff = ''
//--Datawindow của các cột chứa mã đơn vị, bao gồm tiền tệ--//
istr_unit[1].s_dwo_unit = ';;d_cost_accounting_form;d_cost_accounting_form;d_cost_accounting_form;'
//--Tên cột chứa mã đơn vị, cột cuối chứa tỉ giá--//
istr_unit[1].s_colname_unit = ';;uom_code;uom_code;exchange_rate'
//--Loại làm tròn --//
istr_unit[1].s_type = ';;amount;bc;ex'
//--Datawindow của cột chứa mã hàng--//
istr_unit[1].s_dwo_object = 'd_gl_journal_line_grid;'
//--Cột chứa mã đơn vị--//
istr_unit[1].s_colname_object = 'object_code'
end subroutine

public subroutine f_set_str_streamvalue ();//istr_streamvalue[1].s_f_obj_dwo = 'd_payment_line_grid'
//istr_streamvalue[1].s_f_obj_column = 'OBJECT_ID'
//istr_streamvalue[1].s_f_column_sv = 'F_OBJECT_ID'
//
//istr_streamvalue[1].s_t_obj_dwo = 'd_receipt_form'
//istr_streamvalue[1].s_t_obj_column = 'DR_CR_OBJECT'
//istr_streamvalue[1].s_t_column_sv = 'T_OBJECT_ID'
//
//istr_streamvalue[1].s_item_dwo = 'none'
//
//istr_streamvalue[1].s_currency_dwo = 'd_receipt_form'
//istr_streamvalue[1].s_currency_column = 'currency_id;exchange_rate;trans_date'
//istr_streamvalue[1].s_currency_column_sv = 'trans_cur_id;exchange_rate;trans_date'
//
//istr_streamvalue[1].s_value_dwo = 'd_payment_line_grid'
//istr_streamvalue[1].s_value_column = 'OBJECT_ID;amount;base_amount'
//istr_streamvalue[1].s_value_column_sv = 'item_id;trans_value;base_value'
end subroutine

public subroutine f_set_dwo_related ();//khai bao cap nhat phan bo
istr_dwo_related[1].s_related_obj_name = 'u_pur_invoice'				
istr_dwo_related[1].s_main_obj_dwo = 'd_pur_invoice_line_grid'
istr_dwo_related[1].s_main_obj_column = 'id'
istr_dwo_related[1].s_related_obj_dwo = 'd_gl_journal_line_grid'	
istr_dwo_related[1].s_related_obj_column = 'id'
istr_dwo_related[1].b_t_matching = true
istr_dwo_related[1].s_match_f_dwo[1] = 'd_pur_invoice_line_grid'
istr_dwo_related[1].s_match_t_dwo[1] = 'd_gl_journal_line_grid'
istr_dwo_related[1].s_match_f_column[1] = 'BASE_AMOUNT_EX_TAX'
istr_dwo_related[1].s_match_t_column[1] = 'BASE_AMOUNT'
istr_dwo_related[1].s_match_column[1] = 'base_value'

//nhan ban

istr_dwo_related[2].s_related_obj_name = 'u_gl_journal'					// đối tượng liên quan
istr_dwo_related[2].s_main_obj_dwo = 'd_document_grid'		//datawindow quan hệ main
istr_dwo_related[2].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[2].s_related_obj_dwo = 'd_document_grid'	// datawindow quan hệ đến
istr_dwo_related[2].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[2].b_f_matching = true
istr_dwo_related[2].s_relatedtext_column = 'code'					
istr_dwo_related[2].s_text = 'Nhân bản phiếu hạch toán tổng hợp'

istr_dwo_related[2].s_main_obj_dwo_copy[1] = 'd_document_grid' // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[1] =  'handled_by;trans_hdr_id;object_name;trans_desc;group_name;req_appr_note;appr_note;doc_type;roster_yn;'
istr_dwo_related[2].s_related_obj_dwo_copy[1] = 'd_document_grid' // datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[1] = 'handled_by;trans_hdr_id;object_name;trans_desc;group_name;req_appr_note;appr_note;doc_type;roster_yn;'
istr_dwo_related[2].s_match_f_dwo[1] = 'd_document_grid'
istr_dwo_related[2].s_match_t_dwo[1] = 'd_document_grid'

istr_dwo_related[2].s_main_obj_dwo_copy[2] = 'd_gl_journal_form' // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[2] ='currency_id;uom_code;exchange_rate;description;value_yn;'
istr_dwo_related[2].s_related_obj_dwo_copy[2] = 'd_gl_journal_form' // datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[2] = 'currency_id;uom_code;exchange_rate;description;value_yn;'  

istr_dwo_related[2].s_main_obj_dwo_copy[3] = 'd_gl_journal_line_grid' // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[3] ='dr_object_type;dr_account_code;dr_account_name;dr_account_id;dr_subaccount_code;dr_subaccount_name;dr_subaccount;'
istr_dwo_related[2].s_main_obj_column_copy[3]+='cr_object_type;cr_account_code;cr_account_name;cr_account_id;cr_subaccount_code;cr_subaccount_name;cr_subaccount;line_text;amount;base_amount;not_accept;'
istr_dwo_related[2].s_related_obj_dwo_copy[3] = 'd_gl_journal_line_grid' // datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[3]='dr_object_type;dr_account_code;dr_account_name;dr_account_id;dr_subaccount_code;dr_subaccount_name;dr_subaccount;'
istr_dwo_related[2].s_related_obj_column_copy[3]+='cr_object_type;cr_account_code;cr_account_name;cr_account_id;cr_subaccount_code;cr_subaccount_name;cr_subaccount;line_text;amount;base_amount;not_accept;'

istr_dwo_related[2].s_main_obj_column_chk[3] = ''
istr_dwo_related[2].s_related_obj_column_chk[3] = ''
istr_dwo_related[2].s_match_f_dwo[3] = ''
istr_dwo_related[2].s_match_t_dwo[3] = ''
istr_dwo_related[2].s_match_f_column[3] = ''
istr_dwo_related[2].s_match_t_column[3] = ''
istr_dwo_related[2].s_match_column[3] = ''
istr_dwo_related[2].s_main_obj_column_sum[3] = ''
istr_dwo_related[2].s_related_obj_column_sum[3] = ''
istr_dwo_related[2].s_f_obj_column_chk[3] = ''
istr_dwo_related[2].s_t_obj_column_chk[3] = ''
istr_dwo_related[2].b_f_sum[3] = false

istr_dwo_related[3].s_related_obj_name = 'b_view'					// đối tượng liên quan
istr_dwo_related[3].s_main_obj_dwo = 'd_document_grid'		//datawindow quan hệ main
istr_dwo_related[3].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[3].s_related_obj_dwo = 'dv_gl_journal_form'	// datawindow quan hệ đến
istr_dwo_related[3].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[3].s_relatedtext_column = 'code'					
istr_dwo_related[3].s_text = 'In phiếu hạch toán'

istr_dwo_related[3].s_related_obj_name = 'b_view'					// đối tượng liên quan
istr_dwo_related[3].s_main_obj_dwo = 'd_document_grid'		//datawindow quan hệ main
istr_dwo_related[3].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[3].s_related_obj_dwo = 'dv_accounting_form'	// datawindow quan hệ đến
istr_dwo_related[3].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[3].s_relatedtext_column = 'code'					
istr_dwo_related[3].s_text = 'Chứng từ kế toán'
end subroutine

public function integer f_insert_matching (t_ds_db vds_ledger_4_matching, double vdb_t_doc_id);long		ll_row, ll_insrt_row
t_ds_db		lds_matching

lds_matching =  create t_ds_db
lds_matching.dataobject = 'ds_matching'
lds_matching.f_settransobject( it_transaction )
FOR ll_row = 1 to vds_ledger_4_matching.rowcount()
	ll_insrt_row = lds_matching.event e_addrow( )	
	
	lds_matching.setitem( ll_insrt_row, 'ID', this.f_create_id( ))
	lds_matching.setitem( ll_insrt_row, 'MATCH_TYPE', 'COST_ACCOUNTING')
	lds_matching.setitem( ll_insrt_row, 'F_DOC_ID',vds_ledger_4_matching.getitemnumber(ll_row, 'doc_ref_id') )
	lds_matching.setitem( ll_insrt_row, 'T_DOC_ID', vdb_t_doc_id)
	lds_matching.setitem( ll_insrt_row, 'F_REF_ID', vds_ledger_4_matching.getitemnumber(ll_row, 'id'))
	lds_matching.setitem( ll_insrt_row, 'F_REF_TABLE', 'LEDGER_TRANS')
	lds_matching.setitem( ll_insrt_row, 'TRANS_CURRENCY', vds_ledger_4_matching.getitemnumber(ll_row, 'TRANS_CURRENCY'))
	lds_matching.setitem( ll_insrt_row, 'MATCHING_DATE', today())
	lds_matching.setitem( ll_insrt_row, 'TRANS_VALUE', vds_ledger_4_matching.getitemnumber(ll_row, 'AMOUNT'))
	lds_matching.setitem( ll_insrt_row, 'BASE_VALUE', vds_ledger_4_matching.getitemnumber(ll_row, 'BASE_AMOUNT'))
	lds_matching.setitem( ll_insrt_row, 'F_BRANCH_ID', vds_ledger_4_matching.getitemnumber(ll_row, 'BRANCH_ID'))
	lds_matching.setitem( ll_insrt_row, 'T_BRANCH_ID', gdb_branch )
	lds_matching.setitem( ll_insrt_row, 'EXRATE',  vds_ledger_4_matching.getitemnumber(ll_row, 'EXCHANGE_RATE'))
	
NEXT
if vds_ledger_4_matching.rowcount() > 0 then
	if lds_matching.update( ) = -1 then
		gf_messagebox('m.c_cost_accounting.f_insert_matching.01','Thông báo','Không cập nhật được bảng MATCH@:'+it_transaction.sqlerrtext ,'stop','ok',1)
		rollback using it_transaction;
		return -1
	end if 
end if
return vds_ledger_4_matching.rowcount()
end function

public function integer f_delete_matching (double vdb_t_doc_id);
delete matching where t_doc_id = :vdb_t_doc_id and match_type = 'COST_ACCOUNTING' using it_transaction ;

if it_transaction.sqlcode = -1 then
	gf_messagebox('m.c_cost_accounting.f_insert_matching.01','Thông báo','Không xoá được bảng MATCH@:'+it_transaction.sqlerrtext ,'stop','ok',1)
	rollback using it_transaction;
	return -1	
else
	commit using it_transaction;
	return 1
end if
end function

public function integer f_insert_ledger_line (t_ds_db vds_transfered_amt, t_ds_db vds_alloc_base, ref t_dw_mpl rdw_line, double vdb_alloc_account_id, string vs_trans_desc);long		ll_row1,ll_row2, ll_insrt_row
double	ldb_subaccount, ldb_sub_pct, ldb_amount, ldb_base_amount, ldb_curr, ldb_account_id, ldb_round_trans_id, ldb_round_base_id
double	ldb_amount_tmp, ldb_base_amount_tmp,ldb_subaccount_alloc, ldb_base_cur
string		ls_curcode, ls_curname


ic_unit_instance.f_get_base_cur( ldb_base_cur, ls_curcode, ls_curname)
ldb_round_base_id = ic_unit_instance.f_get_round_id( ldb_base_cur, 0, 'amount')
FOR ll_row1 = 1 to vds_transfered_amt.rowcount()
	ldb_amount = vds_transfered_amt.getitemnumber( ll_row1, 'amount' )
	ldb_base_amount = vds_transfered_amt.getitemnumber( ll_row1, 'base_amount' )
	
	ldb_account_id = vds_transfered_amt.getitemnumber( ll_row1, 'dr_account_id' )
	ldb_curr = vds_transfered_amt.getitemnumber( ll_row1, 'trans_currency' )
	ldb_subaccount = vds_transfered_amt.getitemnumber( ll_row1, 'dr_subaccount' )
	ldb_round_trans_id = ic_unit_instance.f_get_round_id( ldb_curr, 0, 'amount')
	
	if isnull(ldb_subaccount) or ldb_subaccount = 0 and isvalid(vds_alloc_base) then
		FOR ll_row2 = 1 to vds_alloc_base.rowcount()
			ldb_sub_pct = vds_alloc_base.getitemnumber(ll_row2, 'cp_percent')
			ldb_subaccount_alloc =  vds_alloc_base.getitemnumber(ll_row2, 'dr_subaccount')
			if ll_row2 < vds_alloc_base.rowcount() then		
				ldb_amount_tmp = this.ic_unit_instance.f_round( rdw_line, ldb_round_trans_id, ldb_amount*ldb_sub_pct/100)
				ldb_amount -= ldb_amount_tmp
				ldb_base_amount_tmp =  this.ic_unit_instance.f_round( rdw_line, ldb_round_base_id, ldb_base_amount*ldb_sub_pct/100)
				ldb_base_amount -= ldb_base_amount_tmp
			else
				ldb_amount_tmp = ldb_amount
				ldb_base_amount_tmp = ldb_base_amount
			end if			
			ll_insrt_row = rdw_line.event e_addrow( )						
			rdw_line.setitem( ll_insrt_row, 'DR_ACCOUNT_ID', vdb_alloc_account_id)
			rdw_line.setitem( ll_insrt_row, 'CR_ACCOUNT_ID',ldb_account_id )
			rdw_line.setitem( ll_insrt_row, 'DR_SUBACCOUNT', ldb_subaccount_alloc)
			rdw_line.setitem( ll_insrt_row, 'CR_SUBACCOUNT', ldb_subaccount)
			rdw_line.setitem( ll_insrt_row, 'LINE_TEXT', vs_trans_desc)
			rdw_line.setitem( ll_insrt_row, 'LINE_NO', ll_insrt_row)
			rdw_line.setitem( ll_insrt_row, 'AMOUNT', ldb_amount_tmp)
			rdw_line.setitem( ll_insrt_row, 'BASE_AMOUNT', ldb_base_amount_tmp)			
		NEXT		
	else
		ll_insrt_row = rdw_line.event e_addrow( )	
		rdw_line.setitem( ll_insrt_row, 'DR_ACCOUNT_ID', vdb_alloc_account_id)
		rdw_line.setitem( ll_insrt_row, 'CR_ACCOUNT_ID',ldb_account_id )
		rdw_line.setitem( ll_insrt_row, 'DR_SUBACCOUNT', ldb_subaccount)
		rdw_line.setitem( ll_insrt_row, 'CR_SUBACCOUNT', ldb_subaccount)
		rdw_line.setitem( ll_insrt_row, 'LINE_TEXT', vs_trans_desc)
		rdw_line.setitem( ll_insrt_row, 'LINE_NO', ll_insrt_row)
		rdw_line.setitem( ll_insrt_row, 'AMOUNT', ldb_amount)
		rdw_line.setitem( ll_insrt_row, 'BASE_AMOUNT', ldb_base_amount)					
	end if

NEXT

if rdw_line.update( ) = -1 then
	gf_messagebox('m.c_cost_accounting.f_insert_matching.01','Thông báo','Không cập nhật được bảng MATCH@:'+it_transaction.sqlerrtext ,'stop','ok',1)
	rollback using it_transaction;
	return -1
end if 

return ll_insrt_row
end function

on c_cost_accounting.create
call super::create
end on

on c_cost_accounting.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = true
is_display_model = '4dgb'
ib_display_text = false
is_object_title = 'Phân bổ và kết chuyển chi phí công trình'
is_exrate_type = 'buy'
istr_actionpane[1].s_button_name = 'b_add_multi;b_insert;b_modify;b_save; b_saveclose;b_filteron;b_query;b_refresh;b_delete;b_view_multi;b_total;b_post;b_unpost;b_send_2_approve;b_request_2_change;b_approve;b_reject;'
istr_actionpane[1].s_button_has_sub = 'b_add_multi;b_view_multi'
istr_actionpane[1].sa_sub_button[1]='b_add;b_copyt_seft;'
istr_actionpane[1].sa_sub_button[2]='b_view_gl_journal;b_view_accounting;'

istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_description = is_object_title
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
				if ldw_focus.dynamic f_get_ib_detail() then //--DETIAL--//
					if ib_changed_dwo_4edit then
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_view_multi;b_process;b_post;b_account_view;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_view_multi;b_process;b_post;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_view_multi;b_total;b_process;b_post;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query; b_refresh;b_delete;b_cancel;b_view_multi;b_total;b_process;b_post;'
						end if
					end if
				else	//-- MASTER--//			
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_view_multi;b_process;b_post;b_account_view;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add_multi;b_modify;b_filteron;b_query;b_refresh;b_delete;b_cancel;b_view_multi;b_process;b_post;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
//				istr_actionpane[li_idx].s_visible_buttons =   'b_sal_invoice;b_sal_invoice_return;'
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

event e_window_open;call super::e_window_open;t_dw_mpl			ldw_main
any				laa_value[]
//--form parm--//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '=COST_ACCOUNTING'
ldw_main.f_add_where('doc_type;',laa_value[])
return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;decimal				ldc_exc
double				ldb_currency_id, ldb_base_round_id,ldb_round_id,ldb_base_amount,ldb_amount
int						li_tax_percent,li_idx, ll_row
string					ls_include_tax_yn
t_dw_mpl			ldw_object, ldw_main, ldw_tmp
c_unit_instance		lc_unit

if AncestorReturnValue = 1 then return 1

//ldw_main = iw_display.f_get_dwmain( )
//ldw_tmp = iw_display.f_get_dw('d_cost_accounting_form')
//ldb_currency_id = ldw_tmp.getitemnumber( ldw_tmp.getrow(),'CURRENCY_ID') 
//if ldb_currency_id > 0 then
//	ldb_round_id = lc_unit.f_get_round_id( ldb_currency_id, 0, 'amount')
//	ldb_base_round_id = lc_unit.f_get_round_id( 0, 0, 'bc')
//end if

if mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_document' then
	if vs_colname = 'document_date' then
		ldw_object = iw_display.dynamic f_get_dw('d_cost_accounting_form')
		ldw_object.setitem(ldw_object.getrow(),'trans_date', date(vs_editdata))
	end if	
end if
return AncestorReturnValue

end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;

if pos(rpo_dw.dataobject,'d_document') > 0 then
	 rpo_dw.setitem(vl_currentrow,'doc_type','COST_ACCOUNTING')
elseif mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5)='d_cost_accounting'  then
	rpo_dw.setitem(vl_currentrow,'doc_type','COST_ACCOUNTING')
	rpo_dw.setitem( vl_currentrow, 'VERSION_NO', 1)
	rpo_dw.setitem( vl_currentrow, 'trans_date', date(gd_session_date))
end if
return vl_currentrow
end event

event e_window_e_preopen;call super::e_window_e_preopen;//--resize parm --//
iw_display.f_set_ii_fixedpart2_height(300)
iw_display.f_set_ii_gb_3_height( 800)
return 0
end event

event e_dw_e_predelete;call super::e_dw_e_predelete;t_dw_mpl  	ldw_main
double		ldb_doc_id

if rpo_dw.dataobject = 'd_gl_journal_line_grid' then
	ldw_main = iw_display.f_get_dwmain( )
	ldb_doc_id = ldw_main.getitemnumber(  ldw_main.getrow( ), 'id')
	if this.f_delete_matching( ldb_doc_id) = -1 then return -1
end if
end event

