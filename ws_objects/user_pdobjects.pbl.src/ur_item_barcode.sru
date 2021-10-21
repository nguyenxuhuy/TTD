$PBExportHeader$ur_item_barcode.sru
forward
global type ur_item_barcode from b_report
end type
end forward

global type ur_item_barcode from b_report
end type
global ur_item_barcode ur_item_barcode

forward prototypes
public subroutine f_set_dwo_tabpage ()
public subroutine f_set_dwo_window ()
public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[])
public function datawindow f_get_dw_print ()
end prototypes

public subroutine f_set_dwo_tabpage ();//iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
//iastr_dwo_tabpage[1].s_display_model = '1d'
//iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default = 'dr_item_barcode_form'
//iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = 'dr_item_barcode_form'
//iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = ''
//iastr_dwo_tabpage[1].str_dwo[1].b_master = false
//iastr_dwo_tabpage[1].str_dwo[1].b_detail = false
//iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = false
//iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = ''
//iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = ''
//iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = ''
//iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol = ''
//iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol = ''
//iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = false
//iastr_dwo_tabpage[1].str_dwo[1].s_pic_ref_table = 'legal_entity'
//iastr_dwo_tabpage[1].str_dwo[1].s_pic_ref_field = 'id'
//iastr_dwo_tabpage[1].str_dwo[1].s_pic_ref_colname = 'logo'
//iastr_dwo_tabpage[1].str_dwo[1].b_insert = false
//iastr_dwo_tabpage[1].str_dwo[1].b_update = false
//iastr_dwo_tabpage[1].str_dwo[1].b_delete = false
//iastr_dwo_tabpage[1].str_dwo[1].b_query = true
//iastr_dwo_tabpage[1].str_dwo[1].b_print = true
//iastr_dwo_tabpage[1].str_dwo[1].b_excel = true
//iastr_dwo_tabpage[1].str_dwo[1].s_description ='In tem'
//iastr_dwo_tabpage[1].str_dwo[1].s_gb_name = ''
end subroutine

public subroutine f_set_dwo_window ();
istr_dwo[1].s_dwo_default = 'd_object_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = ''
istr_dwo[1].b_master = false
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = false
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = false
istr_dwo[1].b_excel = false
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Số lần in tem: '

istr_dwo[2].s_dwo_default = 'dp_item_barcode_form'
istr_dwo[2].s_dwo_form = 'dp_item_barcode_form'
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
istr_dwo[2].s_description = 'Số lần in tem: '

istr_dwo[3].s_dwo_default = 'dr_item_barcode_form'
istr_dwo[3].s_dwo_form = 'dr_item_barcode_form'
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

public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[]);t_dw_mpl	ldw_parm
long			ll_find,ll_number
any			la_data,laa_data[]

if rdw_focus.dataobject = 'dr_item_barcode_form' then
	ldw_parm = iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
	//ll_find ++
	Do 
		ll_find = ldw_parm.find( "gutter = 'Y'", ll_find + 1, ldw_parm.rowcount( )+1 )
		if ll_find > 0 then
			la_data = ldw_parm.getitemstring( ll_find, 'code')
			if isnull(la_data) or la_data = '' then
				//message  mã hàng trong form khai báo mã hàng ko có
				return -1
			else
				laa_data[upperbound(laa_data[])+1] = la_data
			end if
		end if
	Loop While ll_find > 0
	if upperbound(laa_data[]) = 0 then laa_data[upperbound(laa_data[])+1] = ldw_parm.getitemstring( ldw_parm.getrow( ) , 'code')
	ra_args[1] = laa_data
	ldw_parm = iw_display.f_get_dw( 'dp_item_barcode_form')
	ll_number = ldw_parm.getitemnumber( 1, 'a_barcode_times')
	if isnull(ll_number) then ll_number = 0
	ra_args[2] = ll_number
	ra_args[3] = gi_user_comp_id
end if
return upperbound(ra_args[])
end function

public function datawindow f_get_dw_print ();
return iw_display.f_get_dw(istr_dwo[3].s_dwo_default)
end function

on ur_item_barcode.create
call super::create
end on

on ur_item_barcode.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'object'
ib_changed_dwo_4edit = false
is_display_model = '1d_2d'
ib_display_text = true
is_object_title = 'In tem'

istr_actionpane[1].s_description = is_object_title

istr_report.s_dwo_report = ''
istr_report.s_pro_name = ''
istr_report.b_multi_thread = false
end event

event e_window_e_postopen;t_dw_mpl	ldw_parm,ldw_object_parent,ldw_object
s_w_multi	lw_parent
string			ls_object_id
long			ll_find,ll_idx
int				li_row,li_rtn

ldw_parm = iw_display.f_get_dw('dp_item_barcode_form')
li_row = ldw_parm.insertrow( 0)
ldw_parm.setitem(li_row, 'a_barcode_times', 1)

lw_parent = iw_display.f_getparentwindow( )
if isvalid(lw_parent) then
	ldw_object_parent = lw_parent.f_get_dw('d_object_grid')
	ldw_object = iw_display.f_get_dw( 'd_object_grid')
	ll_find = ldw_object_parent.find( "gutter = 'Y'", 1, ldw_object_parent.rowcount( ) )
	DO While ll_find > 0
		if ls_object_id <> '' then ls_object_id = ls_object_id + ','
		ls_object_id = ls_object_id + string(ldw_object_parent.getitemnumber( ll_find, 'ID'))
		ll_find = ldw_object_parent.find( "gutter = 'Y'", ll_find+1, ldw_object_parent.rowcount( ) +1)
	Loop
	if ls_object_id <> '' then
		ldw_object.setfilter( "ID in "+'('+ls_object_id+')')
		li_rtn = ldw_object.filter( )
	else
		if  ldw_object_parent.getrow( ) > 0 then
			ls_object_id = string(ldw_object_parent.getitemnumber( ldw_object_parent.getrow( ) , 'ID'))
			ldw_object.setfilter( "ID = "+ls_object_id)
			li_rtn = ldw_object.filter( )
		end if
	end if
	if li_rtn = 1 then
		for ll_idx = 1 to ldw_object.rowcount( )
			ldw_object.setitem( ll_idx, 'gutter', 'Y')
		next
	end if
end if
return 0
end event

event e_dw_e_postinsertrow;return vl_currentrow
end event

event e_dw_e_presave;return 0
end event

event e_dw_e_rollback_save;call super::e_dw_e_rollback_save;return 0
end event

event e_window_e_postsave;call super::e_window_e_postsave;return 0
end event

event e_window_e_preopen;return 0
end event

event e_window_e_view_report;t_dw_mpl ldw_report

ldw_report = iw_display.f_get_dw( 'dr_item_barcode_form')
ldw_report.event e_retrieve( )
return 0
end event

event e_window_open;call super::e_window_open;t_dw_mpl	ldw_main
any			laa_value[]

ldw_main = iw_display.f_get_dwmain()
laa_value[1] = 'item'
ldw_main.f_add_where('object_ref_table;',laa_value[])
return 0
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
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify; b_saveclose;b_filteron;b_query;b_refresh;b_delete;b_view_report;b_print;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_saveclose;b_filteron;b_query;b_refresh;b_delete;b_view_report;b_print;'
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_save;b_filteron;b_query; b_refresh;b_delete;b_view_report;b_print;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_save;b_filteron;b_query; b_refresh;b_delete;b_view_report;b_print;'
					end if
				end if
			else				
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_saveclose;b_filteron;b_query;b_refresh;b_delete;b_view_report;b_print;'
				else
					if ldw_focus.dataobject = 'd_report_parm_grid' then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_save;b_filteron;b_query;b_refresh;b_delete;b_view_report;b_print;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_filteron;b_refresh;b_view_report;b_print;'
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

event e_window_e_postopen_child;call super::e_window_e_postopen_child;t_dw_mpl	ldw_object_parent,ldw_object
s_w_multi	lw_parent
string			ls_object_id
long			ll_find,ll_idx
int				li_rtn

lw_parent = iw_display.f_getparentwindow( )
if isvalid(lw_parent) then
	ldw_object_parent = lw_parent.f_get_dw('d_object_grid')
	ldw_object = iw_display.f_get_dw( 'd_object_grid')
	ll_find = ldw_object_parent.find( "gutter = 'Y'", 1, ldw_object_parent.rowcount( ) )
	DO While ll_find > 0
		if ls_object_id <> '' then ls_object_id = ls_object_id + ','
		ls_object_id = ls_object_id + string(ldw_object_parent.getitemnumber( ll_find, 'ID'))
		ll_find = ldw_object_parent.find( "gutter = 'Y'", ll_find+1, ldw_object_parent.rowcount( ) +1)
	Loop
	if ls_object_id <> '' then
		ldw_object.setfilter( "ID in "+'('+ls_object_id+')')
		li_rtn = ldw_object.filter( )
	else
		if  ldw_object_parent.getrow( ) > 0 then
			ls_object_id = string(ldw_object_parent.getitemnumber( ldw_object_parent.getrow( ) , 'ID'))
			ldw_object.setfilter( "ID = "+ls_object_id)
			li_rtn = ldw_object.filter( )
		end if
	end if
	if li_rtn = 1 then
		for ll_idx = 1 to ldw_object.rowcount( )
			ldw_object.setitem( ll_idx, 'gutter', 'Y')
		next
	end if
end if
return 0
end event

