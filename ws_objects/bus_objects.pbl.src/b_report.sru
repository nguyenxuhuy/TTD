$PBExportHeader$b_report.sru
forward
global type b_report from s_object_display
end type
end forward

global type b_report from s_object_display
end type
global b_report b_report

type variables
t_ds_db			ids_ddlb
double			idb_id
b_callback		ic_callback
b_multithread	ic_multithread
s_str_data		istr_data[]
end variables

forward prototypes
public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[])
public subroutine f_set_dwo_window ()
public function integer f_set_ddlb (string vs_dwo)
public function integer f_get_properties_cur_report (ref integer ri_zoom, ref string rs_zoom, ref boolean rb_last_save, ref boolean rb_print_preview, integer vi_idx_tab)
public function integer f_set_str_properties (integer vi_idx_tab)
public function integer f_set_properties_cur_report (integer vi_idx_tab)
public function integer f_del_null_column (ref datawindow rpo_dw)
public function datawindow f_get_dw_print ()
public function any f_get_parm_value (string vs_parm_name)
public function integer f_update_dp_arg (datawindow vdw_dp, ref t_transaction rt_transaction)
public function string f_get_sql_pro ()
public function string f_get_sql_report (t_dw_mpl rdw_report)
public function integer f_get_cur_dw_report (ref t_dw_mpl rdw_report, ref string rs_report_name)
public subroutine f_set_dwo_tabpage_replace ()
public subroutine f_set_struct_report_replace ()
public function any f_get_parm_value (string vs_parm_name, t_dw_mpl vdw_parm)
public function any f_get_parm_value_ex (string vs_parm_name, t_dw_mpl vdw_parm, ref t_transaction rt_transaction)
public function string f_get_sql_pro_ex (ref t_transaction rt_transaction)
end prototypes

public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[]);c_dwservice				lc_dwsr
t_dw_mpl				ldw_parm
c_string					lc_string
c_datetime				lc_dt
datetime					ldt_date
string						las_colname[],ls_coltype,ls_data
date						ld_date,ld_sysdate
int							li_idx,li_idx1,li_idx2

if pos(rdw_focus.dataobject,'dr_') >0 then
	ldw_parm = iw_display.dynamic f_get_dw(istr_dwo[2].s_dwo_default)
	li_idx1 = lc_dwsr.f_getcolumns_sql( ldw_parm, las_colname[]) 
	for li_idx = 1 to li_idx1
		if left(las_colname[li_idx],2) = 'a_' then
//			//-- Gán sổ kế toán cho args --//
//			if las_colname[li_idx] = 'a_sob' then
//				ra_args[upperbound(ra_args)+1] = gs_sob
//			else
				ls_coltype = ldw_parm.describe( las_colname[li_idx] + '.coltype')
				
				if left(ls_coltype,5) = 'char(' then
//					ra_args[upperbound(ra_args)+1] = trim(ldw_parm.getitemstring( ldw_parm.getrow( ) , las_colname[li_idx])) // trường hợp khống chế ko cho khoảng trắng đầu cuối của chuỗi thì dùng đoạn này
					ls_data = ldw_parm.getitemstring( ldw_parm.getrow( ) , las_colname[li_idx])
					if isnull(ls_data) then ls_data ='*'
					ls_data = lc_string.f_conver_data_pb_to_ora( ls_data)
					ra_args[upperbound(ra_args)+1] = ls_data
					
					if ls_coltype = 'char(1)' then
						if isnull(ra_args[upperbound(ra_args)]) then ra_args[upperbound(ra_args)] = 'N'
					elseif upper(left( las_colname[li_idx],4))='A_S_' or upper(left(las_colname[li_idx],4))='A_E_' or upper(left( las_colname[li_idx],4))='A_F_' or upper(left( las_colname[li_idx],4))='A_T_'   then //trường hợp xem theo từ...đến...
						if isnull(ra_args[upperbound(ra_args)]) or ra_args[upperbound(ra_args)] = '*' or ra_args[upperbound(ra_args)] = '' then 
							ra_args[upperbound(ra_args)] = '%'
						end if
						if pos(ra_args[upperbound(ra_args)],'*')  > 0 then 
							ra_args[upperbound(ra_args)] = lc_string.f_globalreplace(ra_args[upperbound(ra_args)],'*','%')
						end if
						/* Khoá 28/11/2019: Hỏi Long*/
//					else //xử lí regexp_like
//						if isnull(ra_args[upperbound(ra_args)]) or ra_args[upperbound(ra_args)] = '' or ra_args[upperbound(ra_args)] = '%' then 
//							ra_args[upperbound(ra_args)] = '*'
//						end if
//						if pos(ra_args[upperbound(ra_args)],';')  > 0 then 
//							ra_args[upperbound(ra_args)] = lc_string.f_globalreplace(ra_args[upperbound(ra_args)],';','|^')
//						end if
//						if ra_args[upperbound(ra_args)]<> '*' then  
//							if pos(ra_args[upperbound(ra_args)],')') > 0 then ra_args[upperbound(ra_args)] = lc_string.f_globalreplace(ra_args[upperbound(ra_args)],')','\)')
//							if pos(ra_args[upperbound(ra_args)],'(') > 0 then ra_args[upperbound(ra_args)] = lc_string.f_globalreplace(ra_args[upperbound(ra_args)],'(','\(')
//							ra_args[upperbound(ra_args)]='^'+ra_args[upperbound(ra_args)]+'$'
//						end if
					end if
				elseif left(ls_coltype,5) = 'numbe' then
					ra_args[upperbound(ra_args)+1] = ldw_parm.getitemnumber( ldw_parm.getrow( ) , las_colname[li_idx])
					if isnull(ra_args[upperbound(ra_args)]) then ra_args[upperbound(ra_args)] = 0
				elseif left(ls_coltype,5) = 'date' or left(ls_coltype,5) = 'datet' then
					ld_sysdate = date(lc_dt.f_getsysdate_ex( it_transaction ))
					
					ld_date = date(ldw_parm.getitemdatetime(  ldw_parm.getrow( ),las_colname[li_idx]))
					if ld_date > ld_sysdate then ld_date = ld_sysdate
					ra_args[upperbound(ra_args)+1] = ld_date
					if isnull(ra_args[upperbound(ra_args)]) then ra_args[upperbound(ra_args)] = date('01/01/1900' )
				end if
//			end if
		end if
	next
elseif rdw_focus.dataobject = 'd_report_parm_grid' then
	if not isvalid(ids_ddlb) then
		ra_args[1] = 0
	else
		ra_args[1] = idb_id
	end if
end if
return upperbound(ra_args)
end function

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
istr_dwo[1].b_traceable = true
istr_dwo[1].s_description = 'Tham số của báo cáo: '

end subroutine

public function integer f_set_ddlb (string vs_dwo);dropdownlistbox	lddlb_lib
long					ll_row,ll_idx,ll_totalitem,ll_index
string					ls_arg_name,ls_name
t_transaction		lt_transaction

if not isvalid(ids_ddlb) then ids_ddlb = create t_ds_db
ids_ddlb.dataobject = 'ds_ddlb_arg_report'
iw_display.dynamic f_get_transaction(lt_transaction)
ids_ddlb.f_settransobject(lt_transaction )
ll_row = ids_ddlb.retrieve( vs_dwo,gi_user_comp_id,gdb_branch,gi_userid,this.classname( ) )
if gs_user_lang = 'vi-vn' then
	ls_arg_name = '(Tạo mới tham số báo cáo)'
else
	ls_arg_name = '(New arguments report)'
end if
lddlb_lib = iw_display.dynamic f_get_ddlb1()
if isvalid(lddlb_lib) then
	if lddlb_lib.finditem( ls_arg_name, 0) = -1 then
		lddlb_lib.insertitem( ls_arg_name, 1)
	end if
	if ll_row > 0 then
		ids_ddlb.setsort( 'LAST_MDF_DATE ds')
		ids_ddlb.sort( )
		ls_name = ids_ddlb.getitemstring( 1, 'name')
		for ll_idx = 2 to ll_row + 1
			ls_arg_name = ids_ddlb.getitemstring( ll_idx - 1, 'name')
			lddlb_lib.insertitem( ls_arg_name, ll_idx )
		next
		ll_index = lddlb_lib.selectitem( ls_name, 1)
		this.event e_ddlb_selectionchanged( lddlb_lib, ll_index)
	else
		ll_index = lddlb_lib.selectitem( ls_arg_name, 1)
		this.event e_ddlb_selectionchanged( lddlb_lib, ll_index)
	end if
end if
return 1
end function

public function integer f_get_properties_cur_report (ref integer ri_zoom, ref string rs_zoom, ref boolean rb_last_save, ref boolean rb_print_preview, integer vi_idx_tab);string 		ls_izoom,ls_print_preview,ls_zoom,ls_last_save

ls_print_preview = istr_data[vi_idx_tab].as_data[1]
ls_izoom = istr_data[vi_idx_tab].as_data[2]
rs_zoom = istr_data[vi_idx_tab].as_data[3]
ls_last_save= istr_data[vi_idx_tab].as_data[4]
if upper(ls_print_preview) = 'YES' then
	rb_print_preview = true
else
	rb_print_preview = false
end if
if upper(ls_last_save) = 'TRUE' then
	rb_last_save = true
else
	rb_last_save = false
end if
ri_zoom = long(ls_izoom)
return 1
end function

public function integer f_set_str_properties (integer vi_idx_tab);/*******************************************
save các thuộc tính print preview,zoom,text %,last_save
return -1: lỗi
*******************************************/
t_dw_mpl		ldw_report
string				ls_report_name,ls_zoom,ls_print_preview
int					li_zoom
boolean			lb_last_save
t_htb				l_htb
t_cbx				l_cbx
t_sle				l_sle

if this.f_get_cur_dw_report( ldw_report, ls_report_name) = -1 then return -1
l_htb = iw_display.dynamic f_get_htb()
l_sle = iw_display.dynamic f_get_sle_1()
l_cbx = iw_display.dynamic f_get_cbx('1')

ls_print_preview = ldw_report.describe( "DataWindow.Print.Preview")
li_zoom = l_htb.position
ls_zoom = l_sle.text
lb_last_save = l_cbx.checked
	
istr_data[vi_idx_tab].as_data[1] = ls_print_preview
istr_data[vi_idx_tab].as_data[2] = string(li_zoom)
istr_data[vi_idx_tab].as_data[3] = ls_zoom
istr_data[vi_idx_tab].as_data[4] = string(lb_last_save)
return 1
end function

public function integer f_set_properties_cur_report (integer vi_idx_tab);/*******************************************
set các thuộc tính print preview,zoom,text %,last_save
vs_type SET: set thuộc tính vào dw_report hiện tại
		  SAVE: lưu vào biến istr_data[]
return -1: lỗi
*******************************************/
t_dw_mpl		ldw_report
string				ls_report_name,ls_zoom,ls_print_preview
int					li_zoom
boolean			lb_last_save,lb_print_preview
t_htb				l_htb
t_cbx				l_cbx
t_sle				l_sle

if this.f_get_cur_dw_report( ldw_report, ls_report_name) = -1 then return -1
l_htb = iw_display.dynamic f_get_htb()
l_sle = iw_display.dynamic f_get_sle_1()
l_cbx = iw_display.dynamic f_get_cbx('1')

this.f_get_properties_cur_report(li_zoom , ls_zoom, lb_last_save, lb_print_preview, vi_idx_tab)
ldw_report.Modify("DataWindow.Print.Preview= "+string(lb_print_preview))
l_htb.position = li_zoom
ldw_report.object.datawindow.print.preview.zoom = li_zoom
l_sle.text = ls_zoom
//l_cbx.checked = lb_last_save
return 1

end function

public function integer f_del_null_column (ref datawindow rpo_dw);long			ll_find,ll_rtn

Do 
	ll_find = rpo_dw.find('isnull(OBJECT_REF_ID)',1,rpo_dw.rowcount( ) +1)
	if ll_find > 0 then
		ll_rtn = rpo_dw.DeleteRow(ll_find)
	end if
Loop While ll_find <> 0

return ll_rtn
end function

public function datawindow f_get_dw_print ();datawindow	ldw_print
s_tp_multi		ltp_multi
tab				ltb_tab
int					li_tab_idx

ltb_tab = iw_display.dynamic f_get_tab_1()
li_tab_idx = ltb_tab.selectedtab
ltp_multi = ltb_tab.control[li_tab_idx]
ldw_print = ltp_multi.event e_get_dwmain( )
return ldw_print
end function

public function any f_get_parm_value (string vs_parm_name);//-- 1 --//

c_string					lc_string
t_dw_mpl				ldw_parm
c_datetime				lc_dt
string						ls_colType
date						ld_sysdate
any						la_rtn

ldw_parm = iw_display.dynamic f_get_dw(istr_dwo[2].s_dwo_default)
la_rtn = ldw_parm.f_getitemany( ldw_parm.getrow( ) , vs_parm_name)
ls_colType = ldw_parm.describe(vs_parm_name+ ".ColType")
ld_sysdate = date(lc_dt.f_getsysdate( ))
if left(ls_colType,5) = 'char(' then
	la_rtn = lc_string.f_conver_data_pb_to_ora( la_rtn)
	if upper(left(vs_parm_name,4))='P_S_' or upper(left(vs_parm_name,4))='P_E_' or upper(left(vs_parm_name,4))='P_F_' or upper(left(vs_parm_name,4))='P_T_'  then //trường hợp xem theo từ...đến...
		if isnull(la_rtn) or la_rtn = '' or la_rtn = "*" then la_rtn = "%"
		if pos(la_rtn,'*') > 0 then la_rtn = lc_string.f_globalreplace(la_rtn,'*','%')
		la_rtn = "'"+la_rtn+"'"
	else //xử lí regexp_like
		if isnull(la_rtn) or la_rtn = '' or la_rtn = '%' then la_rtn = "*"
		if pos(la_rtn,';') > 0 then la_rtn = lc_string.f_globalreplace(la_rtn,';','|^')
		if la_rtn='*' then 
			la_rtn = "'"+la_rtn+"'"
		else
			if pos(la_rtn,')') > 0 then la_rtn = lc_string.f_globalreplace(la_rtn,')','\)')
			if pos(la_rtn,'(') > 0 then la_rtn = lc_string.f_globalreplace(la_rtn,'(','\(')
//			la_rtn = "'^"+la_rtn+"$'"
		end if
	end if
elseif left(ls_colType,5) = 'numbe' then
	if isnull(la_rtn) then la_rtn = 0
elseif left(ls_colType,5) = 'date' or left(ls_colType,5) = 'datet' then
	if isnull(la_rtn) then 
//		la_rtn = "trunc(to_date('01/01/1990','"+gs_w_date_format+"'))"
		la_rtn = "trunc(to_date('01/01/1900','dd/mm/yyyy'))"
	else
//		la_rtn = "trunc(to_date('"+string(date(la_rtn))+"','"+ gs_w_date_format+"'))"
		if date(la_rtn) > ld_sysdate then la_rtn = ld_sysdate
		la_rtn = "trunc(to_date('"+string(date(la_rtn),'dd/mm/yyyy')+"','dd/mm/yyyy'))"
	end if
end if
return la_rtn
end function

public function integer f_update_dp_arg (datawindow vdw_dp, ref t_transaction rt_transaction);t_ds_db 				lds_record_hdr_rp,lds_record_line_rp
t_cbx					lc_cbx
b_obj_instantiate	lbo_ins
int 					li_rtn,li_rtn1,li_colCnt,li_idx, li_check
long 					ll_find,ll_row
string 				ls_dwo,ls_colname[],ls_class_name,ls_data
decimal				ldc_id
double				ldb_id,ldb_id1

lds_record_hdr_rp = create t_ds_db
lds_record_hdr_rp.dataobject = 'ds_record_access_hdr_rp'
lds_record_hdr_rp.f_settransobject(rt_transaction)
lds_record_line_rp = create t_ds_db
lds_record_line_rp.dataobject = 'ds_record_access_line_rp'
lds_record_line_rp.f_settransobject(rt_transaction)

ls_dwo = left(vdw_dp.dataobject,len(vdw_dp.dataobject) - 5)
ls_class_name = this.classname( )

ll_row = lds_record_hdr_rp.retrieve(ls_dwo,ls_class_name,gi_userid)
if ll_row > 0 then
	ldb_id = lds_record_hdr_rp.getitemnumber(ll_row,'id')
	ll_row = lds_record_line_rp.retrieve(ldb_id)
else
	lds_record_hdr_rp.f_set_ib_traceable(true)
	li_rtn = lds_record_hdr_rp.Event e_addRow()
	ldb_id = lbo_ins.f_create_id_ex( rt_transaction)
	lds_record_hdr_rp.setitem(li_rtn,'dwo',ls_dwo)
	lds_record_hdr_rp.setitem(li_rtn,'id',ldb_id)
	lds_record_hdr_rp.setitem(li_rtn,'type','report')
	lds_record_hdr_rp.setitem(li_rtn,'object',this.classname( ))
end if
lc_cbx = iw_display.dynamic f_get_cbx('1')
li_colCnt = vdw_dp.dynamic f_getcolumns(ls_colname[] )
lds_record_line_rp.f_set_ib_traceable(true)
FOR li_idx = 1 to li_colCnt
	if ll_row > 0 then
		ll_find = lds_record_line_rp.find("DWCOLUMN = '" +string(ls_colname[li_idx])+"'", 1, lds_record_line_rp.rowcount( ) )
		if ll_find < 0 then 
			return -1			
		elseif ll_find = 0 then
			ll_find = lds_record_line_rp.Event e_addRow()
			ldb_id1 = lbo_ins.f_create_id_ex( rt_transaction)
			lds_record_line_rp.setitem(ll_find,'id',ldb_id1)
			lds_record_line_rp.setitem(ll_find,'object_ref_id',ldb_id)
		end if
	else
		ll_find = lds_record_line_rp.Event e_addRow()
		ldb_id1 = lbo_ins.f_create_id_ex( rt_transaction)
		lds_record_line_rp.setitem(ll_find,'id',ldb_id1)
		lds_record_line_rp.setitem(ll_find,'object_ref_id',ldb_id)
	end if
	if lc_cbx.checked = true then
		ls_data = string(vdw_dp.dynamic f_getitemany(1,ls_colname[li_idx] ))
		if isnull(ls_data) then setnull(ls_data)
		if ll_find = 0 then
		end if
	else
		setnull(ls_data)
	end if
	if ll_find > 0 then
		lds_record_line_rp.setitem(ll_find,'DWCOLUMN',ls_colname[li_idx])
		li_rtn = lds_record_line_rp.setitem(ll_find,'CRITERIA',ls_data)
		lds_record_line_rp.setitem(ll_find,'OBJECT_REF_TABLE','RECORD_ACCESS_HDR')
	elseif ll_find = 0 then
	end if
NEXT
if lds_record_hdr_rp.update(true,false) = 1 then   
	if lds_record_line_rp.update(true,false) = 1 then
		lds_record_hdr_rp.resetupdate()
		lds_record_line_rp.resetupdate()
		commit using rt_transaction;
	end if
else 
	rollback using rt_transaction;
end if
destroy lds_record_hdr_rp
destroy lds_record_line_rp
return 1









end function

public function string f_get_sql_pro ();/*************************
xử lý tham số cho procedure và
trả về câu SQL để thực thi 
*************************/
c_string				lc_string
t_dw_mpl			ldw_parm
string					las_parms[],ls_parm,ls_sql_pro
int						li_idx,li_count_parm, li_skiped_idx

ldw_parm = iw_display.dynamic f_get_dw(istr_dwo[2].s_dwo_default)

//--xử lý criteria cho pro--//
li_count_parm = upperbound(istr_report.sa_parm_name[])
if li_count_parm > 0 then
	for li_idx = 1 to li_count_parm
		if li_skiped_idx = li_idx then continue // bỏ qua tham số khi user chọn không xem--//
		
		if lower(left(istr_report.sa_parm_name[li_idx],3)) = 'gi_' then
			las_parms[li_idx] = string(gi_userid )   //string(istr_report.sa_parm_value[li_idx])
		elseif lower(istr_report.sa_parm_name[li_idx]) = 'gs_sob' then
			las_parms[li_idx] = "'"+ gs_sob+"'"
		elseif  lower(right(istr_report.sa_parm_name[li_idx],4)) = '_opt' then //lựa chọn  bỏ qua tham số --//
			ls_parm = ldw_parm.getitemstring( 1, istr_report.sa_parm_name[li_idx])
			if isnull(ls_parm) or ls_parm = 'N' then
				li_skiped_idx = li_idx + 1
				continue
			end if
		else
			las_parms[upperbound(las_parms)+1] = string(this.f_get_parm_value(istr_report.sa_parm_name[li_idx], ldw_parm))
		end if
	next
	lc_string.f_arraytostring( las_parms, ',', ls_parm)
	ls_sql_pro ='execute '+ istr_report.s_pro_name +'('+ls_parm+')'
end if
return ls_sql_pro


end function

public function string f_get_sql_report (t_dw_mpl rdw_report);/*******************************
xử lý tham số cho report và trả về câu 
SQL đã có tham số xem report
*******************************/
datawindow			ldw_criteria
s_str_criteria_rec		lstr_criteria
string						ls_currentSQL,ls_currentWhere,ls_buildwhere,ls_sql_report,ls_coltype,ls_colname_criteria,ls_report_name		
int							li_idx,li_idx1,li_count_criteria
c_string					lc_string
c_sql						lc_sql
c_dwservice			lc_service

//if this.f_get_cur_dw_report(rdw_report,ls_report_name ) = -1 then return ''
//rdw_report.dataobject = vs_dwo_report
ldw_criteria = iw_display.dynamic f_get_dw(istr_dwo[1].s_dwo_default)
//--xử lý criteria cho report--//
if rdw_report.dynamic f_getcurrentSQL( ls_currentSQL, ls_currentWhere) =1 then
	li_count_criteria = ldw_criteria.rowcount( )
	if li_count_criteria >0 then
		for li_idx = 1 to li_count_criteria
			lstr_criteria.s_dwcolumn_rec[li_idx] = ldw_criteria.getitemstring( li_idx, 'DWCOLUMN')
			lstr_criteria.s_criteria_rec[li_idx] = ldw_criteria.getitemstring( li_idx, 'CRITERIA')
		next
	end if
	for li_idx = 1 to upperbound(lstr_criteria.s_dwcolumn_rec)
		if ls_buildwhere <> '' then ls_buildwhere += ' AND '
		ls_colname_criteria = lstr_criteria.s_dwcolumn_rec[li_idx]
		lc_service.f_get_build_column( rdw_report, ls_colname_criteria, ls_coltype)
		ls_buildwhere += lc_string.f_get_expression( lstr_criteria.s_criteria_rec[li_idx], ls_coltype,ls_colname_criteria, 'build where')
	next
	if ls_buildwhere <> '' then ls_buildwhere = '('+ls_buildwhere+')'
	if ls_currentWhere <> '' then
		if ls_buildwhere <> '' then ls_currentWhere += ' AND ' + ls_buildwhere
	else
		if ls_buildwhere <> '' then ls_currentWhere = ls_buildwhere
	end if
	if lc_sql.f_addtowhereclause( ls_currentSQL, ls_currentWhere, ' AND ') <> -1 then 
		ls_sql_report = ls_currentSQL
	end if
end if
return ls_sql_report
end function

public function integer f_get_cur_dw_report (ref t_dw_mpl rdw_report, ref string rs_report_name);/********************************
Lấy dw report hiện tại và tên của report
return 1: ok
		-1: lỗi
********************************/
tab				ltab_report
t_tp				lt_tp
int					li_tabindex

ltab_report = iw_display.dynamic f_get_tab_1()
li_tabindex = ltab_report.selectedtab
lt_tp = ltab_report.control[li_tabindex]
rdw_report = lt_tp.dynamic event e_get_dwmain()
rs_report_name = lt_tp.text
if isvalid(rdw_report) then
	return li_tabindex
else
	setnull(rdw_report)
	return -1
end if
end function

public subroutine f_set_dwo_tabpage_replace ();return
end subroutine

public subroutine f_set_struct_report_replace ();return
end subroutine

public function any f_get_parm_value (string vs_parm_name, t_dw_mpl vdw_parm);//-- 2 --//
//-- Xừ lý đấu "'" cho biến char --//
c_string					lc_string
c_datetime				lc_dt
string						ls_colType
date						ld_sysdate
any						la_rtn


la_rtn = vdw_parm.f_getitemany( vdw_parm.getrow( ) , vs_parm_name)
ls_colType = vdw_parm.describe(vs_parm_name+ ".ColType")
ld_sysdate = date(lc_dt.f_getsysdate( ))

if left(ls_colType,5) = 'char(' then
	la_rtn = lc_string.f_conver_data_pb_to_ora( la_rtn)
	if upper(left(vs_parm_name,4))='P_S_' or upper(left(vs_parm_name,4))='P_E_' or upper(left(vs_parm_name,4))='P_F_' or upper(left(vs_parm_name,4))='P_T_'  then //trường hợp xem theo từ...đến...
		if isnull(la_rtn) or la_rtn = '' or la_rtn = "*" then la_rtn = "%"
		if pos(la_rtn,'*') > 0 then la_rtn = lc_string.f_globalreplace(la_rtn,'*','%')
		la_rtn = "'"+la_rtn+"'"
	else //xử lí regexp_like
		if isnull(la_rtn) or la_rtn = '' or la_rtn = '%' then
			la_rtn = "'*'"
		else
			la_rtn = "'"+la_rtn+"'"
		end if
		/*
		if pos(la_rtn,';') > 0 then la_rtn = lc_string.f_globalreplace(la_rtn,';','|^')
		if la_rtn='*' then 
			la_rtn = "'"+la_rtn+"'"
		else
			if pos(la_rtn,')') > 0 then la_rtn = lc_string.f_globalreplace(la_rtn,')','\)')
			if pos(la_rtn,'(') > 0 then la_rtn = lc_string.f_globalreplace(la_rtn,'(','\(')
			la_rtn = "'"+la_rtn+"'"
		end if
		*/
	end if
elseif left(ls_colType,5) = 'numbe' then
	if isnull(la_rtn) then la_rtn = 0
elseif left(ls_colType,5) = 'date' or left(ls_colType,5) = 'datet' then
	if isnull(la_rtn) then 
//		la_rtn = "trunc(to_date('01/01/1990','"+gs_w_date_format+"'))"
		la_rtn = "trunc(to_date('01/01/1900','dd/mm/yyyy'))"
	else
//		la_rtn = "trunc(to_date('"+string(date(la_rtn))+"','"+ gs_w_date_format+"'))"
		if date(la_rtn) > ld_sysdate then la_rtn = ld_sysdate
		la_rtn = "trunc(to_date('"+string(date(la_rtn),'dd/mm/yyyy')+"','dd/mm/yyyy'))"
	end if
end if
return la_rtn
end function

public function any f_get_parm_value_ex (string vs_parm_name, t_dw_mpl vdw_parm, ref t_transaction rt_transaction);//-- 2 --//
//-- Xừ lý đấu "'" cho biến char --//
c_string					lc_string
c_datetime				lc_dt
string						ls_colType
date						ld_sysdate
any						la_rtn


la_rtn = vdw_parm.f_getitemany( vdw_parm.getrow( ) , vs_parm_name)
ls_colType = vdw_parm.describe(vs_parm_name+ ".ColType")
ld_sysdate = date(lc_dt.f_getsysdate_ex(rt_transaction ))

if left(ls_colType,5) = 'char(' then
	la_rtn = lc_string.f_conver_data_pb_to_ora( la_rtn)
	if upper(left(vs_parm_name,4))='P_S_' or upper(left(vs_parm_name,4))='P_E_' or upper(left(vs_parm_name,4))='P_F_' or upper(left(vs_parm_name,4))='P_T_'  then //trường hợp xem theo từ...đến...
		if isnull(la_rtn) or la_rtn = '' or la_rtn = "*" then la_rtn = "%"
		if pos(la_rtn,'*') > 0 then la_rtn = lc_string.f_globalreplace(la_rtn,'*','%')
		la_rtn = "'"+la_rtn+"'"
	else //xử lí regexp_like
		if isnull(la_rtn) or la_rtn = '' or la_rtn = '%' then
			la_rtn = "'*'"
		else
			la_rtn = "'"+la_rtn+"'"
		end if
		/*
		if pos(la_rtn,';') > 0 then la_rtn = lc_string.f_globalreplace(la_rtn,';','|^')
		if la_rtn='*' then 
			la_rtn = "'"+la_rtn+"'"
		else
			if pos(la_rtn,')') > 0 then la_rtn = lc_string.f_globalreplace(la_rtn,')','\)')
			if pos(la_rtn,'(') > 0 then la_rtn = lc_string.f_globalreplace(la_rtn,'(','\(')
			la_rtn = "'"+la_rtn+"'"
		end if
		*/
	end if
elseif left(ls_colType,5) = 'numbe' then
	if isnull(la_rtn) then la_rtn = 0
elseif left(ls_colType,5) = 'date' or left(ls_colType,5) = 'datet' then
	if isnull(la_rtn) then 
//		la_rtn = "trunc(to_date('01/01/1990','"+gs_w_date_format+"'))"
		la_rtn = "trunc(to_date('01/01/1900','dd/mm/yyyy'))"
	else
//		la_rtn = "trunc(to_date('"+string(date(la_rtn))+"','"+ gs_w_date_format+"'))"
		if date(la_rtn) > ld_sysdate then la_rtn = ld_sysdate
		la_rtn = "trunc(to_date('"+string(date(la_rtn),'dd/mm/yyyy')+"','dd/mm/yyyy'))"
	end if
end if
return la_rtn
end function

public function string f_get_sql_pro_ex (ref t_transaction rt_transaction);/*************************
xử lý tham số cho procedure và
trả về câu SQL để thực thi 
*************************/
c_string				lc_string
t_dw_mpl			ldw_parm
string					las_parms[],ls_parm,ls_sql_pro
int						li_idx,li_count_parm, li_skiped_idx

ldw_parm = iw_display.dynamic f_get_dw(istr_dwo[2].s_dwo_default)

//--xử lý criteria cho pro--//
li_count_parm = upperbound(istr_report.sa_parm_name[])
if li_count_parm > 0 then
	for li_idx = 1 to li_count_parm
		if li_skiped_idx = li_idx then continue // bỏ qua tham số khi user chọn không xem--//
		
		if lower(left(istr_report.sa_parm_name[li_idx],3)) = 'gi_' then
			las_parms[li_idx] = string(gi_userid )   //string(istr_report.sa_parm_value[li_idx])
		elseif lower(istr_report.sa_parm_name[li_idx]) = 'gs_sob' then
			las_parms[li_idx] = "'"+ gs_sob+"'"
		elseif  lower(right(istr_report.sa_parm_name[li_idx],4)) = '_opt' then //lựa chọn  bỏ qua tham số --//
			ls_parm = ldw_parm.getitemstring( 1, istr_report.sa_parm_name[li_idx])
			if isnull(ls_parm) or ls_parm = 'N' then
				li_skiped_idx = li_idx + 1
				continue
			end if
		else
			las_parms[upperbound(las_parms)+1] = string(this.f_get_parm_value_ex(istr_report.sa_parm_name[li_idx], ldw_parm, rt_transaction))
		end if
	next
	lc_string.f_arraytostring( las_parms, ',', ls_parm)
	ls_sql_pro ='execute '+ istr_report.s_pro_name +'('+ls_parm+')'
end if
return ls_sql_pro


end function

on b_report.create
call super::create
end on

on b_report.destroy
call super::destroy
end on

event e_ddlb_selectionchanged;call super::e_ddlb_selectionchanged;//--khi chọn ddlb_1 thì dw_1 retrieve theo--//
long				ll_row,ll_idx
string				ls_dataobject,ls_colnames
any				laa_data[]
double			ldb_id
datawindow	ldw_parm

ldw_parm = iw_display.dynamic f_get_dw('d_report_parm_grid')
if vl_index > 1 then
	ldb_id = ids_ddlb.getitemnumber( vl_index - 1, 'ID')
	idb_id = ldb_id
	ldw_parm.retrieve( ldb_id)
else
	ldw_parm.retrieve( 0)
end if
return 0
end event

event e_dw_e_rollback_save;call super::e_dw_e_rollback_save;dropdownlistbox	lddlb_lib
long					ll_totalitem

ll_totalitem = lddlb_lib.totalitems( )
lddlb_lib.deleteitem(ll_totalitem )
return 0
end event

event e_window_e_postopen;call super::e_window_e_postopen;t_transaction			lt_transaction
t_ds_db 					lds_record_hdr_rp,lds_record_line_rp
t_dw_mpl				ldw_parm
t_cbx 						l_cbx
long						vl_row,ll_find
int 						li_rtn,li_colCnt,li_idx
string 					ls_dwo,ls_class_name,ls_colname[],ls_coltype,ls_data,ls_tmp,ls_sob
decimal					ldc_id
double					ldb_user

this.f_set_ddlb(mid(iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default,1,len(iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default) - 5) )
iw_display.f_set_text_cbx_1('Ghi nhớ lần sau',false)
iw_display.f_set_text_cbx_2('Xem trước khi In',false)
this.f_set_str_properties( 1)
ldw_parm = iw_display.f_get_dw(istr_dwo[2].s_dwo_default)
if ldw_parm.rowcount( ) = 0 then
	vl_row = ldw_parm.event e_addrow( )	
	ldw_parm.f_set_ib_editing( false)
end if

iw_display.f_get_transaction(lt_transaction)
lds_record_hdr_rp = create t_ds_db
lds_record_hdr_rp.dataobject = 'ds_record_access_hdr_rp'
lds_record_hdr_rp.f_settransobject(lt_transaction)
lds_record_line_rp = create t_ds_db
lds_record_line_rp.dataobject = 'ds_record_access_line_rp'
lds_record_line_rp.f_settransobject(lt_transaction)

ls_dwo = left(ldw_parm.dataobject,len(ldw_parm.dataobject) - 5)
ls_class_name = this.classname( )
li_rtn = lds_record_hdr_rp.retrieve(ls_dwo,ls_class_name,gi_userid)
if li_rtn = 1 then
	ldc_id = lds_record_hdr_rp.getitemnumber(li_rtn,'id')
	li_rtn = lds_record_line_rp.retrieve(ldc_id)
	li_colCnt = ldw_parm.f_getcolumns(ls_colname[] )
	FOR li_idx = 1 to li_colCnt
		ls_coltype = ldw_parm.describe( ls_colname[li_idx] + '.coltype')
		ll_find = lds_record_line_rp.find("DWCOLUMN = '" +string(ls_colname[li_idx])+"'", 1, lds_record_line_rp.rowcount( ) )
		ls_data = lds_record_line_rp.getitemstring(ll_find,'CRITERIA' )
		if isnull(ls_data) or ls_data = '' then continue
		if left(ls_coltype,5) = 'char(' then
			ldw_parm.setitem(1,ls_colname[li_idx],ls_data)
		elseif left(ls_coltype,5) = 'numbe' then
			ldw_parm.setitem(1,ls_colname[li_idx],dec(ls_data))
		elseif left(ls_coltype,5) = 'date' or left(ls_coltype,5) = 'datet' then
			ldw_parm.setitem(1,ls_colname[li_idx],date(ls_data))
		end if
	NEXT
end if
destroy lds_record_hdr_rp
destroy lds_record_line_rp

//ldw_parm = iw_display.f_get_dw(istr_dwo[2].s_dwo_default)
ls_tmp = ldw_parm.describe( "a_user_id.x")
if ls_tmp <> '!' then
	ldb_user = ldw_parm.getitemnumber(ldw_parm.getrow(), 'a_user_id')
	if isnull(ldb_user) or  ldb_user = 0 then 
		ldb_user = gi_userid
		ldw_parm.setitem(ldw_parm.getrow(), 'a_user_id', ldb_user)
	end if
end if

//-- bất printpreview--//
if istr_report.b_printpreview then
	l_cbx = this.iw_display.dynamic f_get_cbx('2')
	l_cbx.checked = true
	this.event e_cbx_clicked( l_cbx)
end if
this.f_ctrl_actionbuttons( iw_display.idw_focus )
return 0





end event

event e_window_e_view_report;call super::e_window_e_view_report;t_transaction			lt_transaction
t_dw_mpl				ldw_report,ldw_parm
s_str_criteria_rec		lstr_criteria
t_cbx						lc_cbx
string						ls_sql_report,ls_sql_pro,ls_rtn,ls_dwo,ls_report_name
long						ll_row
any						laa_arg[]
int							li_tabindex,ls_name_cbx

li_tabindex = this.f_get_cur_dw_report(ldw_report, ls_report_name)
if li_tabindex = -1 then return -1
iw_display.f_get_transaction(lt_transaction)
connect using lt_transaction;

ls_dwo = ldw_report.dataobject 
ls_sql_report = this.f_get_sql_report(ldw_report )
ls_sql_pro = this.f_get_sql_pro_ex( lt_transaction)

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
	ldw_report.settransobject( lt_transaction)
	setnull(ldw_report.is_originalwhereclause )
	ll_row = ldw_report.Event e_Retrieve()
	if ll_row = 0 then ldw_report.insertrow( 0)
	ldw_report.groupcalc( )
	this.f_set_properties_cur_report( li_tabindex)
//	ldw_report.dynamic f_set_properties()
	//--ghi nhớ arg--//
		ldw_parm = iw_display.dynamic f_get_dw(istr_dwo[2].s_dwo_default)
		this.f_update_dp_arg(ldw_parm,lt_transaction)
//	end if
end if
disconnect using lt_transaction;

return 1
end event

event constructor;call super::constructor;ic_callback = create b_callback

istr_report.s_pic_ref_table = 'legal_entity'
istr_report.s_pic_ref_field = 'id'
istr_report.s_pic_ref_colname = 'logo'

istr_actionpane[1].s_dwo_action = 'd_action_edit'
istr_actionpane[1].s_button_name = 'b_saveas;b_add;b_insert;b_modify;b_save;b_query;b_execquery;b_filteron;b_refresh;b_delete;b_print;b_view_report;b_firstpage;b_previouspage;b_nextpage;b_lastpage;'
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title

//-- xử lý phân biệt chi nhánh cho báo cáo --//
if upperbound(istr_dwo[]) > 1 then
	if this.idwsetup_initial.f_is_branch_yn( istr_dwo[2].s_dwo_default) then
		this.f_set_struct_report_replace( )
		this.f_set_dwo_tabpage_replace( )
	end if
end if
end event

event e_action_ctrl_bttn;call super::e_action_ctrl_bttn;//-- override --//

datawindow				ldw_focus
int								li_idx

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
						istr_actionpane[li_idx].s_visible_buttons = 'b_saveas;b_view_report;b_print;b_firstpage;b_previouspage;b_nextpage;b_lastpage;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_saveas;b_view_report;b_print;b_firstpage;b_previouspage;b_nextpage;b_lastpage;'
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_saveas;b_view_report;b_print;b_firstpage;b_previouspage;b_nextpage;b_lastpage;'
					else
						istr_actionpane[li_idx].s_visible_buttons ='b_saveas;b_view_report;b_print;b_firstpage;b_previouspage;b_nextpage;b_lastpage;'
					end if
				end if
			else				
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_saveas;b_view_report;b_print;b_firstpage;b_previouspage;b_nextpage;b_lastpage;'
				else
					if ldw_focus.dataobject = 'd_report_parm_grid' then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_delete;b_view_report;b_print;b_firstpage;b_previouspage;b_nextpage;b_lastpage;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_saveas;b_view_report;b_print;b_firstpage;b_previouspage;b_nextpage;b_lastpage;'
					end if
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
			istr_actionpane[li_idx].s_visible_buttons =   'b_unit_class;b_unit_conversion;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
			istr_actionpane[li_idx].s_visible_buttons =  'b_book; b_attach; b_note;b_doc_trace;b_user_trace;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then				
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_dw_e_presave;call super::e_dw_e_presave;string					ls_name,ls_dwo,ls_report_name
long					ll_row,ll_find,ll_idx,ll_rowcount,ll_rtn
double				ldb_id
datetime				ldt_created_date,ldt_last_mdf_date
t_dw_mpl		ldw_report
c_datetime			lc_datet
dropdownlistbox	lddlb_lib

if rpo_dw.dataobject = istr_dwo[1].s_dwo_default then
	lddlb_lib = iw_display.dynamic f_get_ddlb1()
	ls_name = lddlb_lib.text
	if ls_name = '(Tạo mới tham số báo cáo)' then ls_name = ''
	openwithparm(s_wr_input,ls_name)
	ls_name = message.stringparm
	if not isnull(ls_name) and len(ls_name) > 0 and ls_name <> ';exit;' then
		if ids_ddlb.rowcount( ) > 0 then
			ll_find = ids_ddlb.find( 'name = ' +"'"+ ls_name+"'", 1, ids_ddlb.rowcount( ) +1 )
		end if
		if ll_find = 0 then
			ll_row = ids_ddlb.event e_addrow( )
			ldb_id = this.f_create_id( )
			this.f_get_cur_dw_report( ldw_report, ls_report_name)
			ls_dwo = mid(ldw_report.dataobject,1,len(ldw_report.dataobject)-5)
			ids_ddlb.setitem( ll_row, 'id', ldb_id)
			ids_ddlb.setitem( ll_row, 'name', ls_name)
			ids_ddlb.setitem( ll_row, 'dwo', ls_dwo)
			ids_ddlb.setitem( ll_row, 'type', 'report')
			ids_ddlb.setitem( ll_row, 'object', this.classname( ) )
			ll_rtn = ids_ddlb.update(true,false )
			if ll_rtn = 1 then
				ids_ddlb.resetupdate( )
			else
				messagebox('Lỗi','breport.e_dw_e_presave(line:33)')
				return ll_rtn
			end if
			ll_rowcount = rpo_dw.rowcount()
			for ll_idx = 1 to ll_rowcount
				ll_row = rpo_dw.dynamic event e_addrow( )
				rpo_dw.setitem(ll_row,'OBJECT_REF_ID',ldb_id)
				rpo_dw.setitem(ll_row,'OBJECT_REF_TABLE','RECORD_ACCESS_HDR')
				rpo_dw.setitem(ll_row,'DWCOLUMN',rpo_dw.getitemstring(ll_idx,'DWCOLUMN'))
				rpo_dw.setitem(ll_row,'CRITERIA',rpo_dw.getitemstring(ll_idx,'CRITERIA'))
			next
			ll_rtn = this.f_del_null_column( rpo_dw)
			if ll_rtn = -1 then
				messagebox('Lỗi','breport.e_dw_e_presave(line:46)')
				return ll_rtn
			end if
			lddlb_lib.insertitem( ls_name, lddlb_lib.totalitems( ) + 1 )
		else
			ldt_last_mdf_date = lc_datet.f_getsysdate( )
			ids_ddlb.setitem( ll_find, 'LAST_MDF_DATE', ldt_last_mdf_date)
			ll_rtn = ids_ddlb.update(true,false )
			if ll_rtn = 1 then
				ids_ddlb.resetupdate( )
			else
				messagebox('Lỗi','breport.e_dw_e_presave(line:57)')
				return ll_rtn
			end if
			ldb_id = ids_ddlb.getitemnumber( ll_find,'ID')
			for ll_idx = 1 to rpo_dw.rowcount()
				rpo_dw.setitem(ll_idx,'OBJECT_REF_ID',ldb_id)
				rpo_dw.setitem(ll_idx,'OBJECT_REF_TABLE','RECORD_ACCESS_HDR')
			next
		end if
	end if
else
	return -1
end if
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;t_sle	l_sle

iw_display.f_set_ii_leftpart_width(850)
iw_display.f_set_ii_upperpart_height(500)
iw_display.dynamic f_set_st_1_text('','')
l_sle = iw_display.dynamic f_get_sle_1()
l_sle.text = '100'
return 0
end event

event e_tab_selectionchanged;call super::e_tab_selectionchanged;int 				li_tabindex
string				ls_dwo
t_tp				lt_tp
datawindow	ldw_focus

if not iw_display.dynamic f_get_ib_opening() then
	li_tabindex = rtab_handle.selectedtab
	lt_tp = rtab_handle.control[li_tabindex]
	ldw_focus = lt_tp.dynamic event e_get_dwmain()
	ls_dwo = ldw_focus.dataobject 
	this.f_set_ddlb( mid(ls_dwo,1,len(ls_dwo) - 5))
end if
return 0
end event

event e_cbx_clicked;call super::e_cbx_clicked;t_dw_mpl		ldw_report
string				ls_report_name
tab				ltab_report
int					li_tabindex

if rcbx_handling.classname( ) = 'cbx_2' then
	li_tabindex = this.f_get_cur_dw_report(ldw_report, ls_report_name)
	if li_tabindex = -1 then return -1
	if rcbx_handling.checked then
		ldw_report.modify("DataWindow.Print.Preview= true")
	else
		ldw_report.modify("DataWindow.Print.Preview= false")
	end if
	this.f_set_str_properties( li_tabindex)
else
end if
return 0


end event

event e_htb_moved;call super::e_htb_moved;t_dw_mpl		ldw_report
string				ls_report_name
int					li_position,li_tabindex
tab 				ltab_report
t_sle				l_sle

li_position = rhtb_handling.Position
li_tabindex = this.f_get_cur_dw_report(ldw_report, ls_report_name)
if li_tabindex = -1 then return -1
ldw_report.object.datawindow.print.preview.zoom = li_position
l_sle = iw_display.dynamic f_get_sle_1()
l_sle.text = string(li_position)
this.f_set_str_properties( li_tabindex)
return 0
end event

event e_sgle_modified;call super::e_sgle_modified;t_dw_mpl		ldw_report
string				ls_report_name,ls_old_zoom
int					li_zoom,li_tabindex
t_htb				l_htb

//li_tabindex = this.f_get_cur_dw_report(ldw_report, ls_report_name)
l_htb = iw_display.dynamic f_get_htb()
If Not IsNumber(rsgle_handling.Text) Then 
	ls_old_zoom = istr_data[li_tabindex].as_data[2]
	rsgle_handling.Text = ls_old_zoom
	Return 0
End If
li_zoom = Integer(rsgle_handling.Text)
if li_zoom > 200 then
	gf_messagebox('01','m.b_report.e_sgle_modified.01','Thông báo','không được nhập lớn hơn 200','ok',1)
	rsgle_handling.setfocus( )
	rsgle_handling.selecttext( 1, len(rsgle_handling.Text))
	return 0
elseif  li_zoom < 0 then 
	gf_messagebox('02','m.b_report.e_sgle_modified.02','Thông báo','không được nhập nhỏ hơn 0','ok',1)
	rsgle_handling.setfocus( )
	rsgle_handling.selecttext( 1, len(rsgle_handling.Text))
	return 0
else
	l_htb.position = li_zoom
	l_htb.event moved( li_zoom)
end if
return 0
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;if rpo_dw.dataobject = 'd_report_parm_grid' then
	rpo_dw.setitem(vl_currentrow,'dwo',mid(istr_report.s_dwo_report,1,len(istr_report.s_dwo_report) - 5))
end if
return vl_currentrow
end event

event e_window_e_postsave;call super::e_window_e_postsave;datawindow	ldw_focus
dropdownlistbox	lddlb_lib

lddlb_lib = iw_display.dynamic f_get_ddlb1()
lddlb_lib.selectitem( lddlb_lib.totalitems( ))
lddlb_lib.event selectionchanged( lddlb_lib.totalitems( ))
ldw_focus = iw_display.dynamic f_get_idwfocus()
ldw_focus.dynamic event e_refresh( )
return 0
end event

event e_dw_e_vscroll;call super::e_dw_e_vscroll;return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;decimal   			ldc_amount,ldc_exc,ldc_tax,ldc_price,ldc_qty
string   				ls_include_tax_yn
long 					ll_find
t_dw_mpl       		ldw_tmp,ldw_master

if AncestorReturnValue = 1 then return 1
	if pos(rpo_dw.dataobject,'dp_') > 0 then
		if vs_colname = 'a_s_date' or vs_colname = 'a_e_date' or vs_colname = 'p_s_date' or vs_colname = 'p_e_date'  then
			rpo_dw.setitem(vl_currentrow,'view','')
		end if
	end if
return AncestorReturnValue
end event

event e_window_e_sendmail;call super::e_window_e_sendmail;c_dwservice	lc_dwser
t_dw_mpl	ldw_print
string			ls_path

ldw_print = this.f_get_dw_print( )
if isvalid(ldw_print) or not isnull(ldw_print) then
ls_path = ldw_print.event e_printnodialog( )
	if isnull(ls_path)then
		//message
	else
		lc_dwser.f_send_mail( '', '', '', '',ls_path , '',true)
		filedelete(ls_path)
		//gf_messagebox('m.s_w_multi.e_sendmail.01','Thông báo','Gửi mail thành công','exclamation','ok',1)
	end if
end if
return 0
end event

event e_window_e_firstpage;call super::e_window_e_firstpage;string					ls_rept_name
t_dw_mpl			ldw_report


f_get_cur_dw_report( ldw_report, ls_rept_name)
if isvalid(ldw_report) then
	ldw_report.event e_firstpage( )
end if
end event

event e_window_e_lastpage;call super::e_window_e_lastpage;string					ls_rept_name
t_dw_mpl			ldw_report


f_get_cur_dw_report( ldw_report, ls_rept_name)
if isvalid(ldw_report) then
	ldw_report.event e_lastpage( )
end if
end event

event e_window_e_nextpage;call super::e_window_e_nextpage;string					ls_rept_name
t_dw_mpl			ldw_report


f_get_cur_dw_report( ldw_report, ls_rept_name)
if isvalid(ldw_report) then
	ldw_report.event e_nextpage( )
end if
end event

event e_window_e_previouspage;call super::e_window_e_previouspage;string					ls_rept_name
t_dw_mpl			ldw_report


f_get_cur_dw_report( ldw_report, ls_rept_name)
if isvalid(ldw_report) then
	ldw_report.event e_previouspage( )
end if
end event

