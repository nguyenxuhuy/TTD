$PBExportHeader$ur_sal_invoice_detail.sru
forward
global type ur_sal_invoice_detail from b_report
end type
end forward

global type ur_sal_invoice_detail from b_report
end type
global ur_sal_invoice_detail ur_sal_invoice_detail

forward prototypes
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_dwo_window ()
public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[])
public subroutine f_set_dwo_related ()
end prototypes

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1d'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default = 'dr_sal_invoice_detail_form'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = 'dr_sal_invoice_detail_form'
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
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Báo cáo danh sách hóa đơn bán'
iastr_dwo_tabpage[1].str_dwo[1].s_gb_name = ''
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

istr_dwo[2].s_dwo_default = 'dp_sal_invoice_detail_form'
istr_dwo[2].s_dwo_form = 'dp_sal_invoice_detail_form'
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

public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[]);c_dwservice				lc_dwsr
t_dw_mpl				ldw_parm
c_string					lc_string
string						las_colname[],ls_coltype
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
					ra_args[upperbound(ra_args)+1] = trim(ldw_parm.getitemstring( ldw_parm.getrow( ) , las_colname[li_idx]))
					if ls_coltype = 'char(1)' then
						if isnull(ra_args[upperbound(ra_args)]) then ra_args[upperbound(ra_args)] = 'N'
					elseif upper(left( las_colname[li_idx],4))='A_S_' or upper(left(las_colname[li_idx],4))='A_E_' or upper(left( las_colname[li_idx],4))='A_F_' or upper(left( las_colname[li_idx],4))='A_T_'   then //trường hợp xem theo từ...đến...
						if isnull(ra_args[upperbound(ra_args)]) or ra_args[upperbound(ra_args)] = '*' or ra_args[upperbound(ra_args)] = '' then 
							ra_args[upperbound(ra_args)] = '%'
						end if
						if pos(ra_args[upperbound(ra_args)],'*')  > 0 then 
							ra_args[upperbound(ra_args)] = lc_string.f_globalreplace(ra_args[upperbound(ra_args)],'*','%')
						end if
					else //xử lí regexp_like
						if isnull(ra_args[upperbound(ra_args)]) or ra_args[upperbound(ra_args)] = '' or ra_args[upperbound(ra_args)] = '%' then 
							ra_args[upperbound(ra_args)] = '*'
						end if
						if pos(ra_args[upperbound(ra_args)],';')  > 0 then 
							ra_args[upperbound(ra_args)] = lc_string.f_globalreplace(ra_args[upperbound(ra_args)],';','|^')
						end if
						if ra_args[upperbound(ra_args)]<> '*' then  
							if pos(ra_args[upperbound(ra_args)],')') > 0 and pos(ra_args[upperbound(ra_args)],'|') = 0 then ra_args[upperbound(ra_args)] = lc_string.f_globalreplace(ra_args[upperbound(ra_args)],')','\)')
							if pos(ra_args[upperbound(ra_args)],'(') > 0 and pos(ra_args[upperbound(ra_args)],'|') = 0 then ra_args[upperbound(ra_args)] = lc_string.f_globalreplace(ra_args[upperbound(ra_args)],'(','\(')
							if pos(ra_args[upperbound(ra_args)],'|') = 0 then ra_args[upperbound(ra_args)]='^'+ra_args[upperbound(ra_args)]+'$'
						end if
					end if
				elseif left(ls_coltype,5) = 'numbe' then
					ra_args[upperbound(ra_args)+1] = ldw_parm.getitemnumber( ldw_parm.getrow( ) , las_colname[li_idx])
					if isnull(ra_args[upperbound(ra_args)]) then ra_args[upperbound(ra_args)] = 0
				elseif left(ls_coltype,5) = 'date' or left(ls_coltype,5) = 'datet' then
					if left(ls_coltype,5) = 'date' then
						ra_args[upperbound(ra_args)+1] = ldw_parm.getitemdate(  ldw_parm.getrow( ),las_colname[li_idx]) 
					elseif left(ls_coltype,5) = 'datet' then
						ra_args[upperbound(ra_args)+1] = date(ldw_parm.getitemdatetime( ldw_parm.getrow( ),las_colname[li_idx]))
					end if
					if isnull(ra_args[upperbound(ra_args)]) then ra_args[upperbound(ra_args)] = '01/01/1900'
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

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_sal_invoice'					// đối tượng liên quan
istr_dwo_related[1].s_main_obj_dwo = 'dr_sal_invoice_detail_form'		//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'sal_code'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo = 'd_document_ar_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'code'			// cột quan hệ đến
istr_dwo_related[1].s_relatedtext_column = 'sal_code'					
istr_dwo_related[1].s_text = 'Hoá đơn bán'
//-- set cho drilldown report--//
//istr_dwo_related[1].s_main_obj_dwo_copy[1] = 'dp_vendor_balance_form' // datawindow copy từ
//istr_dwo_related[1].s_main_obj_column_copy[1] ='p_s_date;p_e_date;p_currency_type;p_account_code;'
//istr_dwo_related[1].s_related_obj_dwo_copy[1] = 'dp_vendor_balance_detail_form' 
//istr_dwo_related[1].s_related_obj_column_copy[1]='p_s_date;p_e_date;p_currency_type;p_account_code;'
end subroutine

on ur_sal_invoice_detail.create
call super::create
end on

on ur_sal_invoice_detail.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'DOCUMENT'
ib_changed_dwo_4edit = false
is_display_model = '1ddlb_2d_1tp'
ib_display_text = true
is_object_title = 'Báo cáo danh sách hóa đơn bán'

istr_actionpane[1].s_description = is_object_title

istr_report.s_dwo_report = 'dr_sal_invoice_detail_form'
istr_report.b_multi_thread = false

end event

event e_window_e_postopen;call super::e_window_e_postopen;t_dw_mpl	ldw_parm
string 		ls_doc_type,ls_status,ls_trans_date

ldw_parm = iw_display.f_get_dw(istr_dwo[2].s_dwo_default)
ls_doc_type = ldw_parm.getitemstring(ldw_parm.getrow(), 'a_doc_type')
ls_status = ldw_parm.getitemstring(ldw_parm.getrow(), 'a_status')
ls_trans_date = ldw_parm.getitemstring(ldw_parm.getrow(), 'a_trans_date')
if isnull(ls_trans_date) then 
	ls_trans_date = 'Y'
	ldw_parm.setitem(ldw_parm.getrow(), 'a_trans_date', ls_trans_date)
end if
if isnull(ls_doc_type) then 
	ls_doc_type = '%'
	ldw_parm.setitem(ldw_parm.getrow(), 'a_doc_type', ls_doc_type)
end if
//if isnull(ls_status) then 
//	ls_status = '%'
//	ldw_parm.setitem(ldw_parm.getrow(), 'a_status', ls_status)
//end if
return 0

end event

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.dynamic f_set_ii_leftpart_width(3800)
iw_display.dynamic f_set_ii_upperpart_height(300)
return 0
end event

