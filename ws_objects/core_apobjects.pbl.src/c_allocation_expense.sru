$PBExportHeader$c_allocation_expense.sru
forward
global type c_allocation_expense from b_doc
end type
end forward

global type c_allocation_expense from b_doc
end type
global c_allocation_expense c_allocation_expense

forward prototypes
public subroutine f_set_dwo_window ()
public function integer f_allocate_charge (double vdb_charge_id, decimal vdc_alloc_amt_total, string vs_base_column, t_dw_mpl vdw_charge_alloc, t_dw_mpl vdw_base_alloc, t_dw_mpl vdw_charge, ref t_transaction rt_transaction)
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_allocation_expense_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_allocation_expense_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_details = 'd_allocation_expense_d_grid;' 
istr_dwo[1].b_ref_table_yn  = false
istr_dwo[1].s_ref_table_field = ''
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = false
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_gb_name = 'gb_6'
istr_dwo[1].s_description = 'Phân bổ chi phí'

istr_dwo[2].s_dwo_default =  'd_allocation_expense_d_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_allocation_expense_d_grid'
istr_dwo[2].b_master = false
istr_dwo[2].b_detail = true
istr_dwo[2].b_cascade_del = false
istr_dwo[2].s_dwo_details = ''
istr_dwo[2].s_dwo_master = 'd_allocation_expense_grid;'
istr_dwo[2].s_master_keycol = 'ID;'
istr_dwo[2].s_detail_keycol = 'ID;'
istr_dwo[2].b_ref_table_yn  = false
istr_dwo[2].s_ref_table_field = ''
istr_dwo[2].b_relation_1_1 = false
istr_dwo[2].b_insert = false
istr_dwo[2].b_update = false
istr_dwo[2].b_delete = false
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].b_focus_master = true
istr_dwo[2].s_description = 'Chi tiết'
istr_dwo[2].s_gb_name = ''

istr_dwo[3].s_dwo_default =  'd_charge_list_form'
istr_dwo[3].s_dwo_form = 'd_charge_list_form'
istr_dwo[3].s_dwo_grid = ''
istr_dwo[3].b_master = false
istr_dwo[3].b_detail = false
istr_dwo[3].b_cascade_del = false
istr_dwo[3].s_dwo_details = ''
istr_dwo[3].s_dwo_master = ''
istr_dwo[3].s_master_keycol = ''
istr_dwo[3].s_detail_keycol = ''
istr_dwo[3].b_ref_table_yn  = false
istr_dwo[3].s_ref_table_field = ''
istr_dwo[3].b_relation_1_1 = false
istr_dwo[3].b_insert = true
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = true
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_excel = true
istr_dwo[3].b_traceable = true
istr_dwo[3].b_keyboardlocked = false
istr_dwo[3].b_focus_master = true
istr_dwo[3].s_description = 'Loại phí'
istr_dwo[3].s_gb_name = ''

end subroutine

public function integer f_allocate_charge (double vdb_charge_id, decimal vdc_alloc_amt_total, string vs_base_column, t_dw_mpl vdw_charge_alloc, t_dw_mpl vdw_base_alloc, t_dw_mpl vdw_charge, ref t_transaction rt_transaction);string				ls_original_filter, ls_object_ref_table, ls_object_offset_table, ls_base_curCode, ls_base_curName
long				ll_row_alloc, ll_row, ll_insertrow, ll_line_no, ll_row_matching
dec				ldc_alloc_base, ldc_alloc_base_total, ldc_alloc_amt, ldc_charge_amt, ldc_alloc_amt_total
double			ldb_object_offset_id, ldb_doc_ref_id, ldb_objec_ref_id, ldb_charge_line_id, ldb_base_curID, ldb_baseCur_roundID,ldb_t_doc_id,ldb_f_doc_id
c_string			lc_string
t_ds_db 			lds_matching
c_datetime		lc_date 
t_dw_mpl				ldw_main
s_w_multi			lw_parent

lds_matching = create t_ds_db
lds_matching.dataobject = 'ds_matching'
lds_matching.f_settransobject( rt_transaction)		
ldc_alloc_amt_total = vdc_alloc_amt_total

FOR ll_row = 1 to vdw_base_alloc.rowcount()
	ldc_alloc_base = vdw_base_alloc.getitemnumber( ll_row, vs_base_column)
	if isnull(ldc_alloc_base) then ldc_alloc_base = 0
	ldc_alloc_base_total += ldc_alloc_base
NEXT
if ldc_alloc_base_total = 0 then ldc_alloc_base_total = 1

ls_object_ref_table = upper(vdw_base_alloc.describe( "datawindow.table.Updatetable"))

ll_row_alloc = vdw_charge_alloc.find("gutter = 'Y'", 1, vdw_charge_alloc.rowcount())
ll_row = 1
ll_line_no = 1
DO WHILE ll_row_alloc > 0 and ldc_alloc_amt_total > 0
	ldc_alloc_amt = vdw_charge_alloc.getitemnumber(ll_row_alloc, 'REMAIN_AMT_D')
	if isnull(ldc_alloc_amt) then ldc_alloc_amt = 0
	ldb_object_offset_id = vdw_charge_alloc.getitemnumber(ll_row_alloc, 'object_id')
	ls_object_offset_table = vdw_charge_alloc.getitemstring(ll_row_alloc, 'LINE_REF_TABLE')
	ldb_doc_ref_id = vdw_charge_alloc.getitemnumber(ll_row_alloc, 'id')
	
	DO WHILE ll_row <= vdw_base_alloc.rowcount() and ldc_alloc_amt > 0		
		if ldc_charge_amt = 0 then // tính lại charge amount mới khi ll_row tăng --//			
			ldb_objec_ref_id = vdw_base_alloc.getitemnumber( ll_row, 'ID')
			ldc_alloc_base =  vdw_base_alloc.getitemnumber( ll_row, vs_base_column)
			if isnull(ldc_alloc_base) then ldc_alloc_base = 0
			
			//-- Nếu không phải là record cuối--//
			if ll_row < vdw_base_alloc.rowcount() then
				ldc_charge_amt = vdc_alloc_amt_total*ldc_alloc_base/ldc_alloc_base_total
				ic_unit_instance.f_get_base_cur( ldb_base_curID, ls_base_curCode, ls_base_curName)
				ldb_baseCur_roundID = ic_unit_instance.f_get_round_id(ldb_base_curID , 0, 'bc')		
				ldc_charge_amt = ic_unit_instance.f_round( rt_transaction, ldb_baseCur_roundID, ldc_charge_amt)			
			else  //-- record cuối --//
				if ldc_alloc_amt >= ldc_alloc_amt_total then
					ldc_charge_amt = ldc_alloc_amt_total
					ldc_alloc_amt_total = 0
				else
					ldc_charge_amt = ldc_alloc_amt
					ldc_alloc_amt_total -= ldc_alloc_amt
				end if				
			end if
		end if
		
//		ldb_charge_line_id = this.f_create_id( )
//		ll_insertrow = vdw_charge.insertrow(0)
//		vdw_charge.setitem(ll_insertrow, 'ID', ldb_charge_line_id)
		ll_insertrow = vdw_charge.event e_addrow()
		vdw_charge.setitem(ll_insertrow, 'OBJECT_REF_ID', ldb_objec_ref_id)
		vdw_charge.setitem(ll_insertrow, 'OBJECT_REF_TABLE', ls_object_ref_table)
		vdw_charge.setitem(ll_insertrow, 'DOC_REF_ID', ldb_doc_ref_id)
		vdw_charge.setitem(ll_insertrow, 'OBJECT_OFFSET_ID', ldb_object_offset_id)
		vdw_charge.setitem(ll_insertrow, 'OBJECT_OFFSET_TABLE', upper(ls_object_offset_table))
		vdw_charge.setitem(ll_insertrow, 'CHARGE_ID', vdb_charge_id)
		vdw_charge.setitem(ll_insertrow, 'LINE_NO', ll_line_no)
//		vdw_charge.setitem(ll_insertrow, 'COMPANY_ID', gi_user_comp_id)
//		vdw_charge.setitem(ll_insertrow, 'BRANCH_ID', gdb_branch)
		
		if ll_row < vdw_base_alloc.rowcount() then
			if ldc_charge_amt <= ldc_alloc_amt then
				vdw_charge.setitem(ll_insertrow, 'CHARGE_BASE_AMT', ldc_charge_amt)	
				ldc_alloc_amt_total -= ldc_charge_amt
				ldc_alloc_amt -= ldc_charge_amt
				ldc_charge_amt = 0
				ll_row++
				ll_line_no = 1
			else
				vdw_charge.setitem(ll_insertrow, 'CHARGE_BASE_AMT', ldc_alloc_amt)	
				ldc_alloc_amt_total -= ldc_alloc_amt
				ldc_charge_amt = ldc_charge_amt - ldc_alloc_amt
				ldc_alloc_amt = 0
				ll_line_no++
			end if					
		else
			vdw_charge.setitem(ll_insertrow, 'CHARGE_BASE_AMT', ldc_charge_amt)	
			ldc_charge_amt = 0
			ldc_alloc_amt = 0
			if ldc_alloc_amt_total > 0 then ll_line_no++
		end if
		
		/*===========update bảng matching========*/	
		 ll_row_matching=lds_matching .event e_addrow( )
		lds_matching.setitem(ll_row_matching, 'ID',this.f_create_id() )	
		lds_matching.setitem(ll_row_matching, 'MATCH_TYPE', 'ALLOC_EXP')
		lds_matching.setitem(ll_row_matching, 'MATCHING_DATE', date(lc_date.f_getsysdate( )) )
		lds_matching.setitem(ll_row_matching, 'F_REF_ID',vdw_charge_alloc.getitemnumber(ll_row_alloc,'LINE_ID'))
		lds_matching.setitem(ll_row_matching, 'F_REF_TABLE', upper(vdw_charge_alloc.getitemstring(ll_row_alloc,'LINE_REF_TABLE')))
		lds_matching.setitem(ll_row_matching, 'T_REF_ID',vdw_charge.getitemnumber(ll_insertrow,'ID'))
		lds_matching.setitem(ll_row_matching, 'T_REF_TABLE', upper(vdw_charge.describe( "DataWindow.Table.UpdateTable")))
		lds_matching.setitem(ll_row_matching, 'BASE_VALUE', vdw_charge.getitemnumber(ll_insertrow,'CHARGE_BASE_AMT'))
		ldb_f_doc_id=this.f_get_doc_id( vdw_charge_alloc.getitemnumber(ll_row_alloc,'LINE_ID'),upper(vdw_charge_alloc.getitemstring(ll_row_alloc,'LINE_REF_TABLE')))
		if isnull(ldb_f_doc_id) then ldb_f_doc_id=0
		lds_matching.setitem(ll_row_matching, 'F_DOC_ID', ldb_f_doc_id)
		vdw_charge.dynamic f_getparentwindow(lw_parent)
		ldw_main = lw_parent.dynamic f_get_dwmain()
		ldb_t_doc_id= ldw_main.getitemnumber(ldw_main.getrow( ) ,'id')
		if isnull(ldb_t_doc_id) then ldb_t_doc_id=0
		lds_matching.setitem(ll_row_matching, 'T_DOC_ID', ldb_t_doc_id)
	LOOP
	
	ll_row_alloc = vdw_charge_alloc.find("gutter = 'Y'", ll_row_alloc+1, vdw_charge_alloc.rowcount()+1)
	//-- xử lý phần chênh lệch còn lại cho record cuối --//
	if ll_row_alloc = 0 and ldc_alloc_amt_total > 0 then
		vdw_charge.setitem(ll_insertrow, 'CHARGE_BASE_AMT', ldc_charge_amt + ldc_alloc_amt_total)	
		lds_matching.setitem(lds_matching.rowcount(), 'BASE_VALUE', vdw_charge.getitemnumber(ll_insertrow,'CHARGE_BASE_AMT'))
	end if
LOOP

if  lds_matching.update(true, false) <> 1 then
	rollback using rt_transaction;
	gf_messagebox('m.c_allocation_expense.f_allocate_charge.01','Thông báo','Lỗi cập nhật chi phí:@'+rt_transaction.sqlerrtext,'stop','ok',1)
	destroy lds_matching
	return -1
end if
destroy lds_matching
return 1
end function

on c_allocation_expense.create
call super::create
end on

on c_allocation_expense.destroy
call super::destroy
end on

event constructor;any		la_value[]

is_table = 'DOCUMENT'
ib_changed_dwo_4edit = false
is_display_model = '3d_rb'
ib_display_text = false
is_object_title = 'Phân bổ chi phí mua hàng'
istr_actionpane[1].s_dwo_action = 'd_action_edit'
istr_actionpane[1].s_button_name = 'b_filteron;b_okclose;b_close;'
istr_actionpane[1].s_description = is_object_title
istr_actionpane[1].s_objname_handling = this.classname( )
this.ib_allocating = true

//this.f_set_actionpane( )
this.f_set_dwo_window( )
//this.f_set_dwo_tabpage( )
//this.f_set_dwo_related( )
//this.f_set_str_unit( )
//this.f_set_str_streamvalue( )
ids_matching = create t_ds_db

ids_user_profile = create	c_ds_usr_profile
la_value[1] ='='+ this.classname( )
la_value[2] = gi_userid
ids_user_profile.f_add_where(  'object_name;user_id', la_value[])
ids_user_profile.retrieve( )

//-- init dwsetup --//
idwsetup_initial.f_init_ids_setup_dw( upper(this.classname( )) )
end event

event e_action_ctrl_bttn;t_dw_mpl				ldw_focus
int							li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	//-- control d_action_edit --//
	FOR li_idx = 1 to upperbound(istr_actionpane[]) 
		if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
			istr_actionpane[li_idx].s_visible_buttons= 'b_filteron;b_okclose;b_close;'			
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;t_rb				lrb_1, lrb_2

iw_display.dynamic f_set_ii_fixedpart1_height(160 )
iw_display.dynamic f_set_ii_upperpart_height(1100)


lrb_1 = iw_display.dynamic f_get_ratiobutton('1')
lrb_1.width = 500
lrb_1.text = 'Theo giá trị'
lrb_1.checked = true
lrb_2 = iw_display.dynamic f_get_ratiobutton('2')
lrb_2.width = 500
lrb_2.text = 'Theo số lượng'

return 0
end event

event e_window_e_filter_resize;call super::e_window_e_filter_resize;groupbox			lgb_main
t_dw_mpl		ldw_charge_list
t_rb				lrb_1, lrb_2

lgb_main = iw_display.f_get_groupbox( 'gb_6' )
lrb_1 = iw_display.dynamic f_get_ratiobutton('1')
lrb_2 = iw_display.dynamic f_get_ratiobutton('2')
ldw_charge_list = iw_display.f_get_dw( 'd_charge_list_form')
ldw_charge_list.setposition( totop!)
lgb_main.setposition( behind!)

lrb_1.move(lgb_main.x + 600, lgb_main.y + 55)
lrb_2.move(lrb_1.x + lrb_1.width, lgb_main.y + 55)
ldw_charge_list.move( lrb_2.x + lrb_2.width + 20 , lgb_main.y + 45)
ldw_charge_list.height =  100

return 0
end event

event e_window_e_filteroff;call super::e_window_e_filteroff;
this.event e_window_e_filter_resize( )
return 0
end event

event e_window_e_postopen;call super::e_window_e_postopen;t_dw_mpl		ldw_charge_list

ldw_charge_list = iw_display.f_get_dw( istr_dwo[3].s_dwo_default)
ldw_charge_list.insertrow( 0)
ldw_charge_list.setposition( totop!)
return 0
end event

event e_window_e_okclose;t_dw_mpl				ldw_charge_object, ldw_charge_alloc, ldw_base_alloc, ldw_charge
t_rb						lrb_alloc
s_w_multi				lw_parent
b_doc						lbdoc_parent	
t_transaction			lt_transaction

long						ll_row
string						ls_value_qty, las_allocation_info[], ls_base_colname
decimal					ldc_alloc_amt, ldc_alloc_amt_total
double					ldb_charge_id


//-- lấy cách phân bổ --//
lrb_alloc = iw_display.dynamic f_get_ratiobutton('1')
if lrb_alloc.checked then
	ls_value_qty = 'value'
else
	ls_value_qty = 'qty'
end if

//-- Lấy loại phí phân bổ --//
ldw_charge_object = iw_display.f_get_dw('d_charge_list_form' )
ldb_charge_id = ldw_charge_object.getitemnumber( 1, 'charge_id')
if isnull(ldb_charge_id) then
	gf_messagebox('m.c_allocation_expense.e_window_e_okclose.01','Thông báo','Chưa chọn mã chi phí','exclamation','ok',1)
	return 
end if


//-- lấy tổng giá trị phân bổ --//
ldw_charge_alloc = iw_display.f_get_dw('d_allocation_expense_d_grid' )
ll_row = ldw_charge_alloc.find("gutter = 'Y'", 1 ,  ldw_charge_alloc.rowcount())
DO WHILE ll_row > 0
	ldc_alloc_amt = ldw_charge_alloc.getitemnumber( ll_row, 'remain_amt_d')
	if isnull(ldc_alloc_amt) then ldc_alloc_amt = 0
	ldc_alloc_amt_total += ldc_alloc_amt
	ll_row = ldw_charge_alloc.find("gutter = 'Y'", ll_row+ 1 ,  ldw_charge_alloc.rowcount()+1)
LOOP
if ldc_alloc_amt_total = 0 then 
	gf_messagebox('m.c_allocation_expense.e_window_e_okclose.02','Thông báo','Chưa có chi phí nào được chọn','exclamation','ok',1)
	return 
end if

//-- lấy thông tin phân bổ
lw_parent = iw_display.dynamic f_getparentwindow( )
lw_parent.f_get_transaction( lt_transaction)
lbdoc_parent = lw_parent.f_get_obj_handling()
if lbdoc_parent.f_get_allocation_info(las_allocation_info[] ) > 0 then
	ldw_base_alloc = lw_parent.f_get_dw( las_allocation_info[1])
	ldw_charge = lw_parent.f_get_dw( las_allocation_info[4])
	//-- tính tổng base  alloc --//
	if upper(ls_value_qty) = 'VALUE' then
		ls_base_colname = las_allocation_info[3]
	else
		ls_base_colname = las_allocation_info[2]
	end if
else
	gf_messagebox('m.c_allocation_expense.e_window_e_okclose.03','Thông báo','Chưa khai báo thông tin phân bổ','exclamation','ok',1)
	return 
end if		


//-- phân bổ --//
if this.f_allocate_charge(ldb_charge_id , ldc_alloc_amt_total, ls_base_colname, ldw_charge_alloc, ldw_base_alloc, ldw_charge, lt_transaction) = -1 then return 

//-- update matching --//

iw_display.iw_parent.dynamic event e_save()
//commit using lt_transaction;
//ldw_charge.resetupdate()
iw_display.iw_parent.dynamic event e_refresh()
gf_messagebox('m.c_allocation_expense.e_window_e_okclose.04','Thông báo','Phân bổ thành công','information','ok',1)
 close(iw_display)

end event

event e_dw_e_postretrieve;call super::e_dw_e_postretrieve;long 		ll_row

if rpo_dw.dataobject = 'd_allocation_expense_d_grid' then
	FOR ll_row = 1 to rpo_dw.rowcount()
		rpo_dw.setitem(ll_row,'gutter','Y')
	NEXT
end if
return 0
end event

