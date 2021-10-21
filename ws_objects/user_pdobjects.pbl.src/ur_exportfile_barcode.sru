$PBExportHeader$ur_exportfile_barcode.sru
forward
global type ur_exportfile_barcode from b_report
end type
end forward

global type ur_exportfile_barcode from b_report
end type
global ur_exportfile_barcode ur_exportfile_barcode

forward prototypes
public function datawindow f_get_dw_print ()
public subroutine f_set_dwo_window ()
end prototypes

public function datawindow f_get_dw_print ();
return iw_display.f_get_dw(istr_dwo[2].s_dwo_default)
end function

public subroutine f_set_dwo_window ();//
//istr_dwo[1].s_dwo_default = 'd_object_grid'
//istr_dwo[1].s_dwo_form = ''
//istr_dwo[1].s_dwo_grid = 'd_object_grid'
//istr_dwo[1].b_master = false
//istr_dwo[1].b_insert = false
//istr_dwo[1].b_update = false
//istr_dwo[1].b_delete = false
//istr_dwo[1].b_query = true
//istr_dwo[1].b_print = false
//istr_dwo[1].b_excel = false
//istr_dwo[1].b_traceable = true
//istr_dwo[1].b_keyboardlocked = true
//istr_dwo[1].s_description = 'Hàng hóa: '

istr_dwo[1].s_dwo_default = 'dp_exportfile_barcode_form'
istr_dwo[1].s_dwo_form = 'dp_exportfile_barcode_form'
istr_dwo[1].s_dwo_grid = ''
istr_dwo[1].b_master = false
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = false
istr_dwo[1].b_excel = false
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = false
istr_dwo[1].s_description = 'Thông tin xuất file: '

istr_dwo[2].s_dwo_default = 'dr_exportfile_barcode_grid'
istr_dwo[2].s_dwo_form = 'dr_exportfile_barcode_grid'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = false
istr_dwo[2].b_insert = false
istr_dwo[2].b_update = false
istr_dwo[2].b_delete = false
istr_dwo[2].b_query = true
istr_dwo[2].b_print = false
istr_dwo[2].b_excel = false
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_description = 'Chi tiết lô TP: '
end subroutine

on ur_exportfile_barcode.create
call super::create
end on

on ur_exportfile_barcode.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'object'
ib_changed_dwo_4edit = false
is_display_model = '2d'
ib_display_text = true
is_object_title = 'In tem thành phẩm'

istr_actionpane[1].s_dwo_action = 'd_action_edit'
istr_actionpane[1].s_button_name = 'b_query;b_execquery;b_filteron;b_refresh;b_print;b_view_report;'
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title

istr_report.s_dwo_report = ''
istr_report.s_pro_name = ''
istr_report.b_multi_thread = false
end event

event e_action_ctrl_bttn;//-- override --//

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
						istr_actionpane[li_idx].s_visible_buttons = 'b_filteron;b_query;b_refresh;b_view_report;b_print;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_filteron;b_query;b_refresh;b_view_report;b_print;'
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_filteron;b_query;b_refresh;b_view_report;b_print;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_filteron;b_query;b_refresh;b_view_report;b_print;'
					end if
				end if
			else				
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons= 'b_filteron;b_query;b_refresh;b_view_report;b_print;'
				else
					if ldw_focus.dataobject = 'd_report_parm_grid' then
						istr_actionpane[li_idx].s_visible_buttons= 'b_filteron;b_query;b_refresh;b_view_report;b_print;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_saveas;b_view_report;b_print;'
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

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;//string			ls_lot_sq_no,ls_item_code,ls_lot_num
//
//if AncestorReturnValue = 1 then return 1
//if rpo_dw.dataobject = istr_dwo[1].s_dwo_default then
//	choose case vs_colname
//		case 'lot_number'
//			ls_lot_num = vs_editdata
//			ls_lot_sq_no =string(rpo_dw.getitemdatetime(vl_currentrow,'assemble_date'),'yy') + ls_lot_num
//			rpo_dw.setitem(vl_currentrow,'lot_sq_no_pr',ls_lot_sq_no)
//		case 'assemble_date'
//			ls_lot_num = rpo_dw.getitemstring(vl_currentrow,'lot_number')
//			ls_lot_sq_no = string(date(vs_editdata),'yy') + ls_lot_num
//			rpo_dw.setitem(vl_currentrow,'lot_sq_no_pr',ls_lot_sq_no)
//	end choose
//end if
return AncestorReturnValue
end event

event e_window_e_postopen;t_dw_mpl	ldw_temp
int				li_row

ldw_temp = iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
li_row = ldw_temp.insertrow( 0)
ldw_temp.setitem( li_row, 'year', string(Today(),'yyyy'))
ldw_temp.setitem( li_row, 'f_times', 1)
ldw_temp.setitem( li_row, 't_times', 1)
ldw_temp.setitem( li_row, 'lot_no', '001')
this.f_ctrl_actionbuttons(ldw_temp )
iw_display.triggerevent( "e_display_actionbutton" )
//ldw_temp.setitem( li_row, 'print_type', 'new')

//ldw_temp.setitem( li_row, 'spec_name', 'Quy cách size ( kích thước hàng )')
//ldw_temp.setitem( li_row, 'spec_code', 'u_valueset_entry@QCSize')
//ldw_temp = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
//ldw_temp.insertrow( 0)
//ldw_temp = iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
//this.event e_dw_rowfocuschanged( ldw_temp, ldw_temp.getrow( ) )

return 1
end event

event e_window_open;call super::e_window_open;//t_dw_mpl	ldw_main
//any			laa_value[]
//
//ldw_main = iw_display.f_get_dwmain()
//laa_value[1] = 'item'
//ldw_main.f_add_where('object_ref_table;',laa_value[])
return 0
end event

event e_window_e_view_report;
t_dw_mpl		ldw_info,ldw_print
t_ds_db			lds_lot_no
c_string			lc_string
boolean			lb_Exists
string				ls_lot_sq_no,ls_item_code,ls_path,ls_filename,ls_inifile = 'global.ini'
long				ll_row,ll_idx,ll_rtn
any				laa_data[],laa_empty[]
int					li_f_times,li_t_times

ls_path = ProfileString(ls_inifile,'path file','path_out',gs_path_pic)
ls_filename = ProfileString(ls_inifile,'path file','filenameout','PXK_OUT')
ldw_info = iw_display.f_get_dw(istr_dwo[1].s_dwo_default)
ldw_print = iw_display.f_get_dw(istr_dwo[2].s_dwo_default)
lds_lot_no = create t_ds_db
lds_lot_no.dataobject = 'dd_lot_no'
lds_lot_no.f_settransobject( SQLCA)
ls_lot_sq_no = right(ldw_info.getitemstring( 1, 'year'),2) + ldw_info.getitemstring( 1, 'lot_no')
ls_item_code = ldw_info.getitemstring( 1, 'item_code')
li_f_times = ldw_info.getitemnumber( 1, 'f_times')
li_t_times = ldw_info.getitemnumber( 1, 't_times')
lc_string.f_globalreplace( ls_item_code, ';', ',')
laa_data[1] = ls_lot_sq_no
laa_data[2] = '('+ls_item_code+')'
lds_lot_no.f_add_where( 'lot_sq_no_pr;item_code_pr', laa_data)
ll_rtn = lds_lot_no.retrieve( )
lds_lot_no.setfilter( "long(seq_no) between " + string(li_f_times) + ' and ' + string(li_t_times))
lds_lot_no.filter( )
ldw_print.reset( )
for ll_idx = 1 to ll_rtn
	ll_row = ldw_print.insertrow( 0)
	ldw_print.setitem( ll_row, 'lot_no_product', lds_lot_no.getitemstring( ll_idx, 'lot_no') )
	ldw_print.setitem( ll_row, 'qty', 0)
next

lb_Exists = FileExists(ls_path + '\' + ls_filename + '.csv')
if lb_Exists then FileDelete(ls_path + '\' + ls_filename + '.csv')
ldw_print.saveas(ls_path + '\' + ls_filename + '.csv',csv!,false)
return 1
end event

event e_dw_rowfocuschanged;call super::e_dw_rowfocuschanged;//t_dw_mpl	ldw_product
//double		ldb_item_id,ldb_object_id
//string			ls_value_name,ls_item_code,ls_id_combination
//
//if rpo_dw.dataobject = istr_dwo[1].s_dwo_default then
//	ldw_product = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
//	ls_item_code = rpo_dw.getitemstring(vl_currentrow,'code')
//	ldb_object_id = rpo_dw.getitemnumber(vl_currentrow,'id')
//	select VALUESET_VALUE.name,VALUESET_VALUE.id_combination into :ls_value_name,:ls_id_combination
//	from VALUESET_VALUE 
//	where VALUESET_VALUE.code = trim(:ls_item_code) using SQLCA;
//	select item.id into :ldb_item_id
//	from item
//	where item.object_ref_id = :ldb_object_id using SQLCA;
//	ldw_product.setitem( 1, 'item_code', ls_item_code )
//	ldw_product.setitem( 1, 'item_name', ls_value_name )
//	ldw_product.setitem( 1, 'id_combination', ls_id_combination )
//	ldw_product.setitem( 1, 'item_id', ldb_item_id)
//	ldw_product.setitem( 1, 'lot_sq_no_pr', string(ldw_product.getitemdatetime(1,'assemble_date'),'yy') + ldw_product.getitemstring(1,'lot_number') )
//end if
return vl_currentrow
end event

event e_window_e_postopen_child;call super::e_window_e_postopen_child;//t_dw_mpl		ldw_main,ldw_product,ldw_inven_line,ldw_object
//s_w_multi		lw_parent
//string				ls_item_id
//long				ll_idx
//
//lw_parent = iw_display.f_getparentwindow( )
//if isvalid(lw_parent) then
//	ldw_main = lw_parent.f_get_dwmain( )
//	ldw_product = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
//	ldw_object = iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
//	ldw_inven_line = lw_parent.f_get_dw( 'd_product_grid')
//	for ll_idx = 1 to ldw_inven_line.rowcount( )
//		if ls_item_id <> '' then ls_item_id += ','
//		ls_item_id += string(ldw_inven_line.getitemnumber( ll_idx, 'item_id'))
//	next
//	ldw_object.setfilter( "ID in ("+ls_item_id+")")
//	ldw_object.filter( )
//end if

return 0
end event

