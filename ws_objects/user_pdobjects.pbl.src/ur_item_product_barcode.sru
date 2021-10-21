$PBExportHeader$ur_item_product_barcode.sru
forward
global type ur_item_product_barcode from b_report
end type
end forward

global type ur_item_product_barcode from b_report
end type
global ur_item_product_barcode ur_item_product_barcode

forward prototypes
public function datawindow f_get_dw_print ()
public subroutine f_set_dwo_window ()
end prototypes

public function datawindow f_get_dw_print ();
return iw_display.f_get_dw(istr_dwo[3].s_dwo_default)
end function

public subroutine f_set_dwo_window ();
istr_dwo[1].s_dwo_default = 'd_object_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_object_grid'
istr_dwo[1].b_master = false
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = false
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = false
istr_dwo[1].b_excel = false
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Hàng hóa: '

istr_dwo[2].s_dwo_default = 'dp_item_product_barcode_form'
istr_dwo[2].s_dwo_form = 'dp_item_product_barcode_form'
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
istr_dwo[2].s_description = 'Thông tin in tem: '

istr_dwo[3].s_dwo_default = 'dr_item_product_barcode_form'
istr_dwo[3].s_dwo_form = 'dr_item_product_barcode_form'
istr_dwo[3].s_dwo_grid = ''
istr_dwo[3].b_master = false
istr_dwo[3].b_insert = false
istr_dwo[3].b_update = false
istr_dwo[3].b_delete = false
istr_dwo[3].b_query = true
istr_dwo[3].b_print = false
istr_dwo[3].b_excel = false
istr_dwo[3].b_traceable = true
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].s_description = 'In tem: '
end subroutine

on ur_item_product_barcode.create
call super::create
end on

on ur_item_product_barcode.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'object'
ib_changed_dwo_4edit = false
is_display_model = '1d_2d'
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
						istr_actionpane[li_idx].s_visible_buttons='b_filteron;b_query;b_refresh;b_saveas;b_view_report;b_print;'
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

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;string			ls_lot_sq_no,ls_item_code,ls_lot_num

if AncestorReturnValue = 1 then return 1
if rpo_dw.dataobject = istr_dwo[2].s_dwo_default then
	choose case vs_colname
		case 'lot_number'
			ls_lot_num = vs_editdata
			ls_lot_sq_no =string(rpo_dw.getitemdatetime(vl_currentrow,'assemble_date'),'yy') + ls_lot_num
			rpo_dw.setitem(vl_currentrow,'lot_sq_no_pr',ls_lot_sq_no)
		case 'assemble_date'
			ls_lot_num = rpo_dw.getitemstring(vl_currentrow,'lot_number')
			ls_lot_sq_no = string(date(vs_editdata),'yy') + ls_lot_num
			rpo_dw.setitem(vl_currentrow,'lot_sq_no_pr',ls_lot_sq_no)
	end choose
end if
return 0
end event

event e_window_e_postopen;t_dw_mpl	ldw_temp
int				li_row

ldw_temp = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
li_row = ldw_temp.insertrow( 0)
ldw_temp.setitem( li_row, 'assemble_date', Today())
ldw_temp.setitem( li_row, 'print_times', 1)
ldw_temp.setitem( li_row, 'print_type', 'new')
ldw_temp.setitem( li_row, 'lot_number', '001')
ldw_temp.setitem( li_row, 'spec_name', 'Quy cách size ( kích thước hàng )')
ldw_temp.setitem( li_row, 'spec_code', 'u_valueset_entry@QCSize')
ldw_temp = iw_display.f_get_dw( istr_dwo[3].s_dwo_default)
ldw_temp.insertrow( 0)
ldw_temp = iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
this.event e_dw_rowfocuschanged( ldw_temp, ldw_temp.getrow( ) )
return 1
end event

event e_window_open;call super::e_window_open;t_dw_mpl	ldw_main
any			laa_value[]

ldw_main = iw_display.f_get_dwmain()
laa_value[1] = 'item'
ldw_main.f_add_where('object_ref_table',laa_value[])
return 0
end event

event e_window_e_view_report;t_transaction	lt_transaction
t_dw_mpl		ldw_product_info,ldw_print
t_ds_db			lds_temp,lds_item_lot,lds_item_link
c_string			lc_string
datetime			ldt_assemble_date
boolean			lb_insert = false
string				ls_lot_number,ls_item_code,ls_assemble_date,ls_lot_no,ls_qc_code,ls_ID_COMBINATION,ls_spec_code
long				ll_print_times,ll_idx,ll_row,ll_find,ll_rtn,ll_row1
any				laa_data[],laa_empty[]

ldw_product_info = iw_display.f_get_dw(istr_dwo[2].s_dwo_default)
ldw_print = iw_display.f_get_dw(istr_dwo[3].s_dwo_default)
iw_display.f_get_transaction(lt_transaction )

lds_temp = create t_ds_db
lds_temp.dataobject = 'ds_valueset_value'
lds_temp.f_settransobject( SQLCA)

lds_item_lot = create t_ds_db
lds_item_lot.dataobject = 'ds_item_lot'
lds_item_lot.f_settransobject(lt_transaction )

lds_item_link = create t_ds_db
lds_item_link.dataobject = 'ds_item_link'
lds_item_link.f_settransobject( lt_transaction)

ls_assemble_date = string(ldw_product_info.getitemdatetime(1, 'assemble_date'),'yy')
ls_lot_number = ldw_product_info.getitemstring( 1, 'lot_number')
if isnull(ls_lot_number) then ls_lot_number = '001'
ls_item_code = ldw_product_info.getitemstring( 1, 'item_code')
if isnull(ls_item_code) or ls_item_code = '' then
	gf_messagebox('m.ur_item_product_barcode.e_window_e_view_report.01','Thông báo','Chưa chọn hàng hóa','exclamation','ok',1)
	return -1
end if
ls_qc_code =  ldw_product_info.getitemstring( 1, 'spec_code')

laa_data[1] = '='+ls_item_code
laa_data[2] = '='+ls_qc_code
lds_temp.f_add_where( 'combination_code;qc_code', laa_data)
lds_temp.retrieve( )
ls_spec_code = lds_temp.getitemstring( 1, 'spec_code')
laa_data = laa_empty

lds_temp.dataobject = 'dd_lot_no'
lds_temp.f_settransobject( SQLCA)
laa_data[1] = '=' + ldw_product_info.getitemstring(1,'lot_sq_no_pr')
laa_data[2] = '=' + ldw_product_info.getitemstring(1,'item_code')
lds_temp.f_add_where( 'lot_sq_no_pr;item_code_pr', laa_data)
lds_temp.retrieve( )
ldw_print.reset( )

if ldw_product_info.getitemstring(1,'print_type') = 'new' then
	ll_print_times = ldw_product_info.getitemnumber( 1, 'print_times')
	for ll_idx = 1 to ll_print_times
		ls_lot_no = ls_item_code + ls_spec_code + ls_assemble_date + ls_lot_number + string(ll_idx,'0000')
		ll_find = lds_temp.find( "lot_no = '"+ls_lot_no+"'", 1, lds_temp.rowcount() )
		if ll_find > 0 then 
		else
			ll_row = lds_item_lot.event e_addrow( )
			lds_item_lot.setitem( ll_row, 'ID', this.f_create_id( ) )
			lds_item_lot.setitem( ll_row, 'OBJECT_REF_ID', ldw_product_info.getitemnumber( 1, 'item_id'))
			lds_item_lot.setitem( ll_row, 'OBJECT_REF_TABLE', 'ITEM')
			lds_item_lot.setitem( ll_row, 'LOT_NO', ls_lot_no)
			
			ll_row1 = lds_item_link.event e_addrow( )
			lds_item_link.setitem( ll_row1, 'ID', this.f_create_id( ) )
			lds_item_link.setitem( ll_row1, 'OBJECT_REF_ID', lds_item_lot.getitemnumber( ll_row, 'id'))
			lds_item_link.setitem( ll_row1, 'OBJECT_REF_TABLE', 'ITEM_LOT')
			lds_item_link.setitem( ll_row1, 'link_ref_id', ldw_product_info.getitemnumber( 1, 'cus_id'))
			lds_item_link.setitem( ll_row1, 'link_ref_table', 'OBJECT')
			
			ll_row = ldw_print.insertrow( 0)
			ldw_print.setitem( ll_row, 'product_barcode', ls_lot_no)
		end if
	next
else
	ls_lot_no = ldw_product_info.getitemstring(1,'lot_sq_no')
	ll_row = ldw_print.insertrow( 0)
	ldw_print.setitem( ll_row, 'product_barcode', ls_lot_no)
end if
if lds_item_lot.rowcount() > 0 then
	ll_rtn = lds_item_lot.update(true,false )
	if ll_rtn = 1 then
		ll_rtn = lds_item_link.update(true,false )
		if ll_rtn = 1 then
			lds_item_lot.resetupdate( )
			lds_item_link.resetupdate( )
			commit using lt_transaction;
		else
			ldw_print.reset( )
			rollback using lt_transaction;
		end if
	else
		ldw_print.reset( )
		rollback using lt_transaction;
	end if
end if
destroy lds_temp
destroy lds_item_lot
destroy lds_item_link
return 1
end event

event e_dw_rowfocuschanged;call super::e_dw_rowfocuschanged;t_dw_mpl	ldw_product
double		ldb_item_id,ldb_object_id
string			ls_value_name,ls_item_code,ls_id_combination

if rpo_dw.dataobject = istr_dwo[1].s_dwo_default and vl_currentrow > 0 then
	ldw_product = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
	ls_item_code = rpo_dw.getitemstring(vl_currentrow,'code')
	ldb_object_id = rpo_dw.getitemnumber(vl_currentrow,'id')
	select VALUESET_VALUE.name,VALUESET_VALUE.id_combination into :ls_value_name,:ls_id_combination
	from VALUESET_VALUE 
	where VALUESET_VALUE.code = trim(:ls_item_code) using SQLCA;
	select item.id into :ldb_item_id
	from item
	where item.object_ref_id = :ldb_object_id using SQLCA;
	ldw_product.setitem( 1, 'item_code', ls_item_code )
	ldw_product.setitem( 1, 'item_name', ls_value_name )
	ldw_product.setitem( 1, 'id_combination', ls_id_combination )
	ldw_product.setitem( 1, 'item_id', ldb_item_id)
	ldw_product.setitem( 1, 'lot_sq_no_pr', string(ldw_product.getitemdatetime(1,'assemble_date'),'yy') + ldw_product.getitemstring(1,'lot_number') )
end if
return vl_currentrow
end event

event e_window_e_postopen_child;call super::e_window_e_postopen_child;t_dw_mpl		ldw_main,ldw_product,ldw_inven_line,ldw_object
s_w_multi		lw_parent
string				ls_item_id
long				ll_idx

lw_parent = iw_display.f_getparentwindow( )
if isvalid(lw_parent) then
	ldw_main = lw_parent.f_get_dwmain( )
	ldw_product = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
	ldw_object = iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
	ldw_inven_line = lw_parent.f_get_dw( 'd_product_grid')
	for ll_idx = 1 to ldw_inven_line.rowcount( )
		if ls_item_id <> '' then ls_item_id += ','
		ls_item_id += string(ldw_inven_line.getitemnumber( ll_idx, 'item_id'))
	next
	ldw_object.setfilter( "ID in ("+ls_item_id+")")
	ldw_object.filter( )
end if

return 0
end event

