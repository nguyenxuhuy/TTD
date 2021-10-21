$PBExportHeader$c_finger_scan_data.sru
forward
global type c_finger_scan_data from s_object_display
end type
end forward

global type c_finger_scan_data from s_object_display
event e_action_att_log ( )
end type
global c_finger_scan_data c_finger_scan_data

forward prototypes
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_window ()
end prototypes

event e_action_att_log();c_dwservice		lc_dwser
t_dw_mpl	ldw_info,ldw_data
t_ds_db		lds_data
c_string		lc_str
c_sql			lc_sql
string			ls_ip_address,ls_coltype,ls_colname,ls_where,ls_currentSQL, ls_currentWhere,ls_sql
date			ld_f_date,ld_t_date

ldw_info = iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
ldw_data = iw_display.f_get_dw( istr_dwo[2].s_dwo_default)

ld_f_date = date(ldw_info.getitemdatetime( 1, 'f_date'))
if isnull(ld_f_date) then ld_f_date = date('01/01/1990')
ld_t_date = date(ldw_info.getitemdatetime( 1, 't_date'))
if isnull(ld_t_date) then ld_t_date = date('01/01/1990')
ls_ip_address = ldw_info.getitemstring(1,'ip_address')
if isnull(ls_ip_address) then ls_ip_address = '*'

ldw_data.f_getcurrentSQL( ls_currentSQL, ls_currentWhere)
ls_colname = 'check_time'
lc_dwser.f_get_build_column( ldw_data, ls_colname, ls_coltype)
ls_colname = 'trunc('+ls_colname+')'
ls_where = lc_str.f_get_expression( '(' + string(ld_f_date) + ':' + string(ld_t_date) + ')', ls_coltype, ls_colname, 'build where')
ls_colname = 'ip_address'
lc_dwser.f_get_build_column( ldw_data, ls_colname, ls_coltype)
ls_where += ' AND ' + lc_str.f_get_expression( ls_ip_address, ls_coltype, ls_colname, 'build where')
ls_currentWhere = ls_where
if lc_sql.f_addtowhereclause( ls_currentSQL, ls_currentWhere, ' AND ') <> -1 then ls_sql = ls_currentSQL

ldw_data.Modify("Datawindow.Table.Select=~'" + ls_sql + "~'")
ldw_data.event e_retrieve( )
setnull(ldw_data.is_originalwhereclause)


return 
end event

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_related_object'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Đối tượng liên quan'

istr_actionpane[3].s_dwo_action = 'd_action_manage'
istr_actionpane[3].s_objname_handling = this.classname( )
istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_select_date_form'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_select_date_form'
istr_dwo[1].b_master = false
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_details = ''
istr_dwo[1].s_dwo_shared = ''
istr_dwo[1].s_dwo_master = ''
istr_dwo[1].s_master_keycol = ''
istr_dwo[1].s_detail_keycol = ''
istr_dwo[1].b_ref_table_yn  = false
istr_dwo[1].s_ref_table_field = ''
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = false
istr_dwo[1].b_excel = false
istr_dwo[1].b_keyboardlocked = false
istr_dwo[1].s_gb_name = ''
istr_dwo[1].s_description = 'Chọn ngày'

istr_dwo[2].s_dwo_default =  'd_finger_scan_data_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_finger_scan_data_grid'
istr_dwo[2].b_master = false
istr_dwo[2].b_detail = false
istr_dwo[2].b_cascade_del = false
istr_dwo[2].s_dwo_details = ''
istr_dwo[2].s_dwo_shared = ''
istr_dwo[2].s_dwo_master = ''
istr_dwo[2].s_master_keycol = ''
istr_dwo[2].s_detail_keycol = ''
istr_dwo[2].b_ref_table_yn  = false
istr_dwo[2].s_ref_table_field = ''
istr_dwo[2].b_insert = false
istr_dwo[2].b_update = false
istr_dwo[2].b_delete = false
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_gb_name = ''
istr_dwo[2].s_description = 'Dữ liệu chấm công thô'
end subroutine

on c_finger_scan_data.create
call super::create
end on

on c_finger_scan_data.destroy
call super::destroy
end on

event constructor;call super::constructor;ib_changed_dwo_4edit = false
is_display_model = '2d'
ib_display_text = false
this.ib_keyboardlocked = true
is_object_title = 'Xem dữ liệu chấm công thô'
istr_actionpane[1].s_button_name = 'b_saveas;b_att_log;b_print;'
istr_actionpane[1].s_objname_handling = this.classname( )
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
				if ldw_focus.dynamic f_get_ib_detail() then
					if ib_changed_dwo_4edit then
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_saveas;b_att_log;b_print;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_saveas;b_att_log;b_print;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_saveas;b_att_log;b_print;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_saveas;b_att_log;b_print;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_saveas;b_att_log;b_print;'
					else
						istr_actionpane[li_idx].s_visible_buttons= 'b_saveas;b_att_log;b_print;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
				istr_actionpane[li_idx].s_visible_buttons =  'b_book; b_attach; b_note;b_doc_trace_on;b_user_trace;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
				
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_e_postopen;call super::e_window_e_postopen;t_dw_mpl	ldw_info
long			ll_row

ldw_info = iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
if ldw_info.rowcount() = 0 then
	ll_row = ldw_info.insertrow( 0)
	this.f_ctrl_actionbuttons( ldw_info)
	this.iw_display.triggerevent( "e_display_actionbutton" )
end if
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;//--resize parm --//
iw_display.f_set_ii_upperpart_height(iw_display.ii_resize_height*1/6 )
//iw_display.f_set_ii_fixedpart1_height( iw_display.ii_resize_height*1/4)

//iw_display.dynamic f_set_ii_upperpart_height(250)
//iw_display.dynamic f_set_ii_fixedpart2_height(1750)

return 0
end event

