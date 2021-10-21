$PBExportHeader$c_amortize.sru
forward
global type c_amortize from b_doc
end type
end forward

global type c_amortize from b_doc
end type
global c_amortize c_amortize

forward prototypes
public subroutine f_set_dwo_window ()
public function integer f_amortize (t_dw_mpl vdw_amortize, t_dw_mpl vdw_journal_line, date vd_trans_date, ref t_transaction rt_transaction, ref t_ds_db rds_matching)
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_amortize_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_amortize_grid'
istr_dwo[1].b_master = false
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_details = ';' 
istr_dwo[1].b_ref_table_yn  = false
istr_dwo[1].s_ref_table_field = ''
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_gb_name = ''
istr_dwo[1].s_description = 'Phân bổ chi phí'


end subroutine

public function integer f_amortize (t_dw_mpl vdw_amortize, t_dw_mpl vdw_journal_line, date vd_trans_date, ref t_transaction rt_transaction, ref t_ds_db rds_matching);
long					ll_row_alloc, ll_nbr_period, ll_insertrow, ll_line_no, ll_row_matching
double				ldb_alloc_amt, ldb_buse_curr, ldb_round_id, ldb_t_doc_id,ldb_f_doc_id
date					ld_start_date, ld_firstdate, ld_lastdate
any					laa_data[]
string					ls_linetext, ls_base_currcode, ls_base_currname
t_dw_mpl				ldw_main
s_w_multi			lw_parent

//u_fiscal_period		lu_fiscal_peirod
b_obj_instantiate	lbo_instance
 
		

//lu_fiscal_peirod = create u_fiscal_period
//if lu_fiscal_peirod.f_get_period_first_last_date( vd_trans_date,  ld_firstdate, ld_lastdate) = -1 then return -1
if lbo_instance.f_get_period_first_last_date( vd_trans_date,  ld_firstdate, ld_lastdate,'normal') = -1 then return -1

ll_row_alloc = vdw_amortize.find("gutter = 'Y'", 1, vdw_amortize.rowcount())
ll_line_no = 0
DO WHILE ll_row_alloc > 0 
	//-- kiểm tra start date--//
	ld_start_date = date(vdw_amortize.getitemdatetime(ll_row_alloc, 'START_ALLOC_DATE'))
	if ld_start_date > vd_trans_date then
		ll_row_alloc = vdw_amortize.find("gutter = 'Y'", ll_row_alloc+1, vdw_amortize.rowcount()+1)	
		continue
	end if
	//-- kiểm tra mỗi kỳ chỉ amortize 1 lần--//	
	laa_data[1] = vdw_amortize.getitemnumber(ll_row_alloc,'ID')
	laa_data[2] = '=AMORTIZE'
	laa_data[3] = '('+ string(ld_firstdate, gs_w_date_format) + ':' + string(ld_lastdate, gs_w_date_format) + ')'
	rds_matching.f_add_where( 'F_REF_ID;MATCH_TYPE;MATCHING_DATE',laa_data[])
	if rds_matching.retrieve( ) > 0 then
		ls_linetext = vdw_amortize.getitemstring(ll_row_alloc, 'LINE_TEXT')
		ld_start_date = date(rds_matching.getitemdatetime(1,'MATCHING_DATE') )
		gf_messagebox('m.c_amortize.f_amortize.01','Thông báo','Chi phí đã phân bổ rồi vào ngày:@'+string(ld_start_date)+'@-@'+ls_linetext,'information','ok',1)
	else	
		ll_nbr_period = vdw_amortize.getitemnumber(ll_row_alloc, 'ALLOC_PERIOD_REMAIN')
		if isnull(ll_nbr_period) OR ll_nbr_period = 0 then continue	
		ldb_alloc_amt = vdw_amortize.getitemnumber(ll_row_alloc, 'ALLOC_AMOUNT_REMAIN')
		if isnull(ldb_alloc_amt) then ldb_alloc_amt = 0
		ldb_alloc_amt = ldb_alloc_amt/ll_nbr_period 
		//--LÀM TRÒN --//
		this.ic_unit_instance.f_get_base_cur(ldb_buse_curr, ls_base_currcode, ls_base_currname)
		ldb_round_id = this.ic_unit_instance.f_get_round_id( ldb_buse_curr, 0, 'amount')
		ldb_alloc_amt = this.ic_unit_instance.f_round(vdw_journal_line,ldb_round_id,ldb_alloc_amt)
		
		ll_insertrow = vdw_journal_line.event e_addrow()
		ll_line_no++
		vdw_journal_line.setitem(ll_insertrow, 'DR_ACCOUNT_ID',  vdw_amortize.getitemnumber(ll_row_alloc, 'ALLOC_OBJECT'))
		vdw_journal_line.setitem(ll_insertrow, 'CR_ACCOUNT_ID', vdw_amortize.getitemnumber(ll_row_alloc, 'object_id'))
		vdw_journal_line.setitem(ll_insertrow, 'DR_SUBACCOUNT',  vdw_amortize.getitemnumber(ll_row_alloc, 'ALLOC_SUBACCOUNT'))
		vdw_journal_line.setitem(ll_insertrow, 'CR_SUBACCOUNT', vdw_amortize.getitemnumber(ll_row_alloc, 'SUBACCOUNT'))
		vdw_journal_line.setitem(ll_insertrow, 'AMOUNT', ldb_alloc_amt)
		vdw_journal_line.setitem(ll_insertrow, 'BASE_AMOUNT', ldb_alloc_amt)
		vdw_journal_line.setitem(ll_insertrow, 'LINE_NO', ll_line_no)
		vdw_journal_line.setitem(ll_insertrow, 'LINE_TEXT',  vdw_amortize.getitemstring(ll_row_alloc, 'LINE_TEXT'))
		
	
		/*===========update bảng matching========*/	
		ll_row_matching=rds_matching .event e_addrow( )
		rds_matching.setitem(ll_row_matching, 'ID',this.f_create_id() )	
		rds_matching.setitem(ll_row_matching, 'MATCH_TYPE','AMORTIZE')
		rds_matching.setitem(ll_row_matching, 'MATCHING_DATE', vd_trans_date)
		rds_matching.setitem(ll_row_matching, 'F_REF_ID', vdw_amortize.getitemnumber(ll_row_alloc,'ID'))
		rds_matching.setitem(ll_row_matching, 'F_REF_TABLE', vdw_amortize.getitemstring(ll_row_alloc,'REF_TABLE'))
		rds_matching.setitem(ll_row_matching, 'T_REF_ID',vdw_journal_line.getitemnumber(ll_insertrow,'ID'))
		rds_matching.setitem(ll_row_matching, 'T_REF_TABLE', upper(vdw_journal_line.describe( "DataWindow.Table.UpdateTable")))
		rds_matching.setitem(ll_row_matching, 'BASE_VALUE', ldb_alloc_amt)
		ldb_f_doc_id=this.f_get_doc_id( vdw_amortize.getitemnumber(ll_row_alloc,'ID'),vdw_amortize.getitemstring(ll_row_alloc,'REF_TABLE'))
		if isnull(ldb_f_doc_id) then ldb_f_doc_id=0
		rds_matching.setitem(ll_row_matching, 'F_DOC_ID', ldb_f_doc_id)
		vdw_journal_line.dynamic f_getparentwindow(lw_parent)
		ldw_main = lw_parent.dynamic f_get_dwmain()
		ldb_t_doc_id= ldw_main.getitemnumber(ldw_main.getrow( ) ,'id')
		if isnull(ldb_t_doc_id) then ldb_t_doc_id=0
		rds_matching.setitem(ll_row_matching, 'T_DOC_ID', ldb_t_doc_id)
		ll_line_no++
	end if
	
	ll_row_alloc = vdw_amortize.find("gutter = 'Y'", ll_row_alloc+1, vdw_amortize.rowcount()+1)	
LOOP
if ll_line_no = 0 then 
	return 0
end if


return 1
end function

on c_amortize.create
call super::create
end on

on c_amortize.destroy
call super::destroy
end on

event constructor;any		la_value[]

is_table = 'DOCUMENT'
ib_changed_dwo_4edit = false
is_display_model = '1d'
ib_display_text = false
is_object_title = 'Phân bổ chi phí trả trước'
istr_actionpane[1].s_dwo_action = 'd_action_edit'
istr_actionpane[1].s_button_name = 'b_filteron;b_okclose;b_close;b_refresh;'
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
idwsetup_initial.f_init_ids_setup_dw( this.classname( ) )
end event

event e_action_ctrl_bttn;datawindow				ldw_focus
int								li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	//-- control d_action_edit --//
	FOR li_idx = 1 to upperbound(istr_actionpane[]) 
		if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
			istr_actionpane[li_idx].s_visible_buttons= 'b_filteron;b_refresh;b_okclose;b_close;'			
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_open;call super::e_window_open;t_dw_mpl			ldw_main
any				laa_value[]


ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '>0'
ldw_main.f_add_where('ALLOC_AMOUNT_REMAIN;',laa_value[])

return 0
end event

event e_window_e_okclose;call super::e_window_e_okclose;t_dw_mpl				ldw_amortize, ldw_gl_journal, ldw_gl_journal_line
t_ds_db					lds_matching
s_w_multi				lw_parent
b_doc						lbdoc_parent	
t_transaction			lt_transaction
int							li_rtn
date						ld_trans_date
//-- lấy thông tin phân bổ
lw_parent = iw_display.dynamic f_getparentwindow( )
if not isvalid(lw_parent) then return 

lw_parent.f_get_transaction( lt_transaction)
lbdoc_parent = lw_parent.f_get_obj_handling()
if lbdoc_parent.classname( ) <>  'u_gl_journal' then return 

ldw_gl_journal = lw_parent.f_get_dw('d_gl_journal_grid') 
ldw_gl_journal_line = lw_parent.f_get_dw('d_gl_journal_line_grid') 
if ldw_gl_journal.getrow( ) > 0 then
	ldw_gl_journal.accepttext( )
	ld_trans_date = date(ldw_gl_journal.getitemdatetime( ldw_gl_journal.getrow( ) , 'trans_date'))
end if

lds_matching = create t_ds_db
lds_matching.dataobject = 'ds_matching'
lds_matching.f_settransobject( lt_transaction)		


//-- Lấy loại phí phân bổ --//
ldw_amortize = iw_display.f_get_dw('d_amortize_grid' )

//-- phân bổ --//
li_rtn = this.f_amortize( ldw_amortize, ldw_gl_journal_line, ld_trans_date, lt_transaction,lds_matching) 
if li_rtn = 1 then

	//-- update matching --//
	iw_display.iw_parent.event e_saveclose()
	
	if lds_matching.update(true, false) <> 1 then
		rollback using lt_transaction;
		gf_messagebox('m.c_amortize.f_amortize.02','Thông báo','Lỗi cập nhật chi phí:@'+lt_transaction.sqlerrtext,'stop','ok',1)
		destroy lds_matching
		return
	else
		commit using lt_transaction;
		destroy lds_matching	
	end if		
			
	iw_display.iw_parent.event e_refresh()
	gf_messagebox('m.c_amortize.e_window_e_okclose.04','Thông báo','Phân bổ thành công','information','ok',1)
	 close(iw_display)
elseif li_rtn = 0 then
	gf_messagebox('m.c_amortize.e_window_e_okclose.05','Thông báo','Không có dữ liệu phân bổ','information','ok',1)
	 close(iw_display)	
else
	close(iw_display)	
	return
end if
	
end event

