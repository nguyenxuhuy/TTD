$PBExportHeader$ur_item_material_barcode.sru
forward
global type ur_item_material_barcode from b_report
end type
end forward

global type ur_item_material_barcode from b_report
end type
global ur_item_material_barcode ur_item_material_barcode

forward prototypes
public subroutine f_set_dwo_window ()
public function datawindow f_get_dw_print ()
end prototypes

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

istr_dwo[2].s_dwo_default = 'dp_item_material_barcode_form'
istr_dwo[2].s_dwo_form = 'dp_item_material_barcode_form'
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

istr_dwo[3].s_dwo_default = 'dr_item_material_barcode_form'
istr_dwo[3].s_dwo_form = 'dr_item_material_barcode_form'
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

public function datawindow f_get_dw_print ();
return iw_display.f_get_dw(istr_dwo[3].s_dwo_default)
end function

on ur_item_material_barcode.create
call super::create
end on

on ur_item_material_barcode.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'object'
ib_changed_dwo_4edit = false
is_display_model = '1d_2d'
ib_display_text = true
is_object_title = 'In tem nguyên liệu'

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

event e_window_open;call super::e_window_open;t_dw_mpl	ldw_main
any			laa_value[]

ldw_main = iw_display.f_get_dwmain()
laa_value[1] = 'item'
ldw_main.f_add_where('object_ref_table',laa_value[])
return 0
end event

event e_window_e_postopen;t_dw_mpl	ldw_temp
int				li_row

ldw_temp = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
if ldw_temp.rowcount( ) = 0 then
	li_row = ldw_temp.insertrow( 0)
	ldw_temp.setitem( li_row, 'receipt_date', Today())
else
	li_row = 1
end if
ldw_temp.setitem( li_row, 'print_times', 1)
ldw_temp.setitem( li_row, 'type_print', 'new')
ldw_temp = iw_display.f_get_dw( istr_dwo[3].s_dwo_default)
ldw_temp.insertrow( 0)
ldw_temp = iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
this.event e_dw_rowfocuschanged( ldw_temp, ldw_temp.getrow( ) )
return 1
end event

event e_dw_rowfocuschanged;call super::e_dw_rowfocuschanged;string			ls_item_code
t_dw_mpl	ldw_material_info

if rpo_dw.dataobject = istr_dwo[1].s_dwo_default and vl_currentrow > 0 then
	ldw_material_info = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)
	ls_item_code = rpo_dw.getitemstring(vl_currentrow,'code')
	ldw_material_info.setitem( 1, 'item_code',ls_item_code )
end if

return vl_currentrow
end event

event e_window_e_view_report;t_transaction	lt_transaction
t_dw_mpl	ldw_main,ldw_material_info,ldw_view
t_ds_db		lds_item_lot,lds_temp,lds_item
datetime		ldt_receipt_date
string			ls_item_code,ls_sq_lot_no,ls_item_name,ls_ven_code,ls_ven_name,ls_item_bercode,ls_null
long			ll_find_gt,ll_find_lot,ll_add_row,ll_find,ll_print_times,ll_idx
int				li_rtn

setnull(ls_null)
ldw_main = iw_display.f_get_dwmain( )
iw_display.f_get_transaction(lt_transaction )
lds_item_lot = create t_ds_db
lds_item_lot.dataobject = 'ds_item_lot'
lds_item_lot.f_settransobject( lt_transaction)
lds_temp = create t_ds_db
lds_temp.dataobject =  'ds_item_lot'
lds_temp.f_settransobject( SQLCA)
lds_temp.retrieve( )
lds_item = create t_ds_db
lds_item.dataobject = 'd_item_form'
lds_item.f_settransobject( SQLCA)
lds_item.retrieve( )
ll_find_gt = ldw_main.find( "gutter = 'Y'", 1, ldw_main.rowcount( ) )
ldw_material_info = iw_display.f_get_dw(istr_dwo[2].s_dwo_default)
ldw_view = iw_display.f_get_dw(istr_dwo[3].s_dwo_default)
if ll_find_gt > 0 then
	Do While ll_find_gt > 0
		
	Loop
else
	ls_item_code = trim(upper(ldw_main.getitemstring( ldw_main.getrow(), 'code')))
	ls_item_name = ldw_main.getitemstring( ldw_main.getrow(), 'name')
	ls_ven_code = trim(upper(ldw_material_info.getitemstring( 1, 'ven_code')))
	ls_ven_name = ldw_material_info.getitemstring( 1, 'ven_name')
	ldt_receipt_date = ldw_material_info.getitemdatetime( 1, 'receipt_date')
	if ldw_material_info.getitemstring( 1, 'type_print') = 'new' then
		ldw_material_info.setitem( 1,'lot_sq_no' , ls_null)
		this.idwsetup_initial.f_set_autonumber('lot_sq_no' , ldw_material_info, 1)
		ls_sq_lot_no = ldw_material_info.getitemstring( 1, 'lot_sq_no')
		ls_item_bercode = ls_ven_code + ls_sq_lot_no + ls_item_code
	else
		ls_sq_lot_no = ldw_material_info.getitemstring( 1, 'lot_no')
		ls_sq_lot_no = left(ls_sq_lot_no,len(ls_sq_lot_no) -2)
		ls_item_bercode = ldw_material_info.getitemstring( 1, 'lot_no')
	end if
	
	ll_print_times = ldw_material_info.getitemnumber( 1, 'print_times')
	ll_find = lds_item.find( "object_ref_id = "+string(ldw_main.getitemnumber( ldw_main.getrow(), 'ID') ), 1, lds_item.rowcount())
	lds_temp.setfilter( "object ref_id = "+string(lds_item.getitemnumber( ll_find, 'ID') ))
	lds_temp.filter( )
	ll_find_lot = lds_temp.find( "lot_no = '"+ls_item_bercode+"'", 1, lds_temp.rowcount( ) )
	if ll_find_lot > 0 then
	else
		ll_add_row = lds_item_lot.event e_addrow( )
		lds_item_lot.setitem( ll_add_row, 'ID',this.f_create_id( ) )
		lds_item_lot.setitem( ll_add_row, 'OBJECT_REF_ID', lds_item.getitemnumber( ll_find, 'ID'))
		lds_item_lot.setitem( ll_add_row, 'OBJECT_REF_TABLE', upper(lds_item.describe ("datawindow.table.update")))
		lds_item_lot.setitem( ll_add_row, 'LOT_NO', ls_item_bercode)
		li_rtn = lds_item_lot.update( true,false)
		if li_rtn = 1 then
			lds_item_lot.resetupdate( )
			commit using lt_transaction;
		else
			rollback using lt_transaction;
		end if
	end if
	ldw_view.reset( )
	for ll_idx = 1 to ll_print_times
		ll_add_row = ldw_view.insertrow( 0)
		ldw_view.setitem(ll_add_row , 'item_barcode', ls_item_bercode)
		ldw_view.setitem(ll_add_row , 'ven_name', ls_ven_name)
		ldw_view.setitem(ll_add_row , 'lot_no', right(ls_sq_lot_no,3))
		ldw_view.setitem(ll_add_row , 'item_name', ls_item_name)
		ldw_view.setitem(ll_add_row , 'receipt_date', ldt_receipt_date)
	next
end if
destroy lds_item_lot
destroy lds_temp
destroy lds_item
return 1
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;string			ls_lot_sq_no,ls_item_code

if AncestorReturnValue = 1 then return 1
if rpo_dw.dataobject = istr_dwo[2].s_dwo_default then
	choose case vs_colname
		case 'ven_code'
			ls_item_code = vs_editdata
			ls_lot_sq_no = ls_item_code+ string(rpo_dw.getitemdatetime(vl_currentrow,'receipt_date'),'ddmmyy')
			rpo_dw.setitem(vl_currentrow,'lot_sq_no_1',ls_lot_sq_no)
		case 'receipt_date'
			ls_item_code = rpo_dw.getitemstring(vl_currentrow,'ven_code')
			ls_lot_sq_no = ls_item_code+ string(date(vs_editdata),'ddmmyy')
			rpo_dw.setitem(vl_currentrow,'lot_sq_no_1',ls_lot_sq_no)
	end choose
end if
return 0
end event

event e_window_e_postopen_child;call super::e_window_e_postopen_child;s_w_multi	lw_parent
t_dw_mpl	ldw_inven_line,ldw_material_info,ldw_object,ldw_main
string			ls_item_id,ls_ven_code,ls_ven_name
long			ll_idx

lw_parent = iw_display.f_getparentwindow( )
if isvalid(lw_parent) then
	ldw_main = lw_parent.f_get_dwmain( )
	ldw_material_info = iw_display.f_get_dw(istr_dwo[2].s_dwo_default)
	if ldw_material_info.rowcount( ) = 0 then 
		ldw_material_info.insertrow( 0)
		ldw_material_info.setitem( 1, 'receipt_date', ldw_main.getitemdatetime( ldw_main.getrow( ) , 'document_date') )
	end if
	ldw_object =  iw_display.f_get_dw(istr_dwo[1].s_dwo_default)
	ldw_inven_line = lw_parent.f_get_dw( 'd_inventory_line_receipt_grid')
	ls_ven_code = ldw_inven_line.getitemstring( ldw_inven_line.rowcount( ), 'vendor_code')
	ls_ven_name = ldw_inven_line.getitemstring( ldw_inven_line.rowcount( ), 'vendor_name')
	for ll_idx = 1 to ldw_inven_line.rowcount( )
		if ls_item_id <> '' then ls_item_id += ','
		ls_item_id += string(ldw_inven_line.getitemnumber( ll_idx,'item_id'))
	next
	ldw_object.setfilter( "ID in ("+ls_item_id+')')
	ldw_object.filter( )
	ldw_material_info.setitem( 1, 'ven_code', ls_ven_code)
	ldw_material_info.setitem( 1, 'ven_name', ls_ven_name)
	this.event e_dw_e_itemchanged( ldw_material_info, 1, 'ven_code', ls_ven_code)
end if
return 0
end event

