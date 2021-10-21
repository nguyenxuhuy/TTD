$PBExportHeader$b_popup_data.sru
forward
global type b_popup_data from s_object_display
end type
end forward

global type b_popup_data from s_object_display
end type
global b_popup_data b_popup_data

type variables
string							is_display_column,is_current_dwo,is_display_column_history, is_drilldown_object, is_object_ref_name
string							is_where_rec
any							iaa_default_data[]

protected:

string							is_currentdata
end variables

forward prototypes
public function string f_get_return_colname (string vs_receive_colname)
public function integer f_set_ic_dwsetup_initial (c_dwsetup_initial vc_dwsetup_initial)
public function c_dwsetup_initial f_get_ic_dwsetup_initial ()
public function integer f_init_popup_display (string vs_displaymodel, string vs_dwo_input_data, integer vi_window_width, integer vi_widnow_height)
public function string f_get_currentdata ()
public subroutine f_set_currentdata (string vs_data)
public function integer f_init_popup_display (string vs_displaymodel, string vs_dwo_input_data, string vs_dwo_description, string vs_action_description, string vs_object_title, integer vi_window_width, integer vi_widnow_height)
public subroutine f_set_default_data (string vs_column, any vaa_data[])
public subroutine f_set_is_display_model (string vs_display_model)
end prototypes

public function string f_get_return_colname (string vs_receive_colname);string					ls_return_column, ls_receive_column, las_return_column[], las_receive_column[] 
int						li_colCnt, li_idx
c_obj_service		lc_obj_service

ls_return_column = this.idwsetup_initial.ids_setup_dw.getitemstring( 1, 'return_column')
ls_receive_column = this.idwsetup_initial.ids_setup_dw.getitemstring( 1, 'receive_column')

li_colCnt = lc_obj_service.f_stringtoarray(ls_receive_column ,';', las_receive_column[])
FOR li_idx = 1 to li_colCnt
	if las_receive_column[li_idx] = vs_receive_colname then
		lc_obj_service.f_stringtoarray(ls_return_column ,';', las_return_column[])
		return las_return_column[li_idx]
	end if
NEXT
return ''

end function

public function integer f_set_ic_dwsetup_initial (c_dwsetup_initial vc_dwsetup_initial);idwsetup_initial = vc_dwsetup_initial
return 1
end function

public function c_dwsetup_initial f_get_ic_dwsetup_initial ();return idwsetup_initial
end function

public function integer f_init_popup_display (string vs_displaymodel, string vs_dwo_input_data, integer vi_window_width, integer vi_widnow_height);
this.is_display_model = vs_displaymodel
this.istr_dwo[1].s_dwo_default = vs_dwo_input_data
istr_dwo[1].s_dwo_form = vs_dwo_input_data
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_keyboardlocked = false
istr_dwo[1].s_description = 'Chọn ngày ghi sổ'
// khai báo tab actionpane
istr_actionpane[1].s_dwo_action = 'd_action_edit'
istr_actionpane[1].s_visible_buttons = 'b_okclose;b_close;'
istr_actionpane[1].s_button_name =  'b_okclose;b_close;'
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = 'Menu soạn thảo'

this.f_set_resize_wdisplay( vi_window_width, vi_widnow_height)
return 1
end function

public function string f_get_currentdata ();return is_currentdata 
end function

public subroutine f_set_currentdata (string vs_data);is_currentdata = vs_data
end subroutine

public function integer f_init_popup_display (string vs_displaymodel, string vs_dwo_input_data, string vs_dwo_description, string vs_action_description, string vs_object_title, integer vi_window_width, integer vi_widnow_height);is_object_title = vs_object_title
this.is_display_model = vs_displaymodel
this.istr_dwo[1].s_dwo_default = vs_dwo_input_data
istr_dwo[1].s_dwo_form = vs_dwo_input_data
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_keyboardlocked = false
istr_dwo[1].s_description = vs_dwo_description
// khai báo tab actionpane
istr_actionpane[1].s_dwo_action = 'd_action_edit'
istr_actionpane[1].s_visible_buttons = 'b_okclose;b_close;'
istr_actionpane[1].s_button_name =  'b_okclose;b_close;'
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = vs_action_description

this.f_set_resize_wdisplay( vi_window_width, vi_widnow_height)
return 1
end function

public subroutine f_set_default_data (string vs_column, any vaa_data[]);int 		li_idx,li_count
string		las_column[]

c_string		lc_string
t_dw_mpl	ldw_main

li_count = lc_string.f_stringtoarray( vs_column, ';', las_column)
ldw_main = iw_display.f_get_dwmain( )
for li_idx = 1 to li_count
	if ldw_main.describe( las_column[li_idx]+".X") <> '!' then
		ldw_main.setitem( 1,las_column[li_idx] , vaa_data[li_idx])
	end if
next
end subroutine

public subroutine f_set_is_display_model (string vs_display_model);is_display_model = vs_display_model
end subroutine

on b_popup_data.create
call super::create
end on

on b_popup_data.destroy
call super::destroy
end on

event e_window_closequery;call super::e_window_closequery;//-- return 1 để s_w_main không destroy obj_main --//
return 1
end event

event e_dw_rbuttondown;call super::e_dw_rbuttondown;//-- return -1 ngăn đối tượng không popup menu --//

return -1
end event

event e_action_ctrl_bttn;datawindow				ldw_focus
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
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify; b_saveclose;b_filteron;b_query;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_saveclose;b_filteron;b_query;b_refresh;b_delete;'
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_save;b_filteron;b_query; b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_save;b_filteron;b_query; b_refresh;b_delete;'
					end if
				end if
			else				
				if  ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_saveclose;b_filteron;b_query;b_refresh;b_delete;'
				else
					istr_actionpane[li_idx].s_visible_buttons= 'b_okclose;b_close;'
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
			
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
			istr_actionpane[li_idx].s_visible_buttons =  'b_book; b_attach; b_note;b_doc_trace;b_user_trace;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
			
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;int			li_idx
string		las_colmun[]
c_string	lc_string
if upperbound(istr_dwo[]) > 0 then 
	if rpo_dw.dataobject = istr_dwo[1].s_dwo_default then
		if pos(is_display_column,';')>0 then
			lc_string.f_stringtoarray(is_display_column , ';', las_colmun[])
		elseif is_display_column <> '' then
			las_colmun[1] = is_display_column
		end if
		FOR li_idx = 1 to upperbound(iaa_default_data[])
			rpo_dw.setitem(vl_currentrow,las_colmun[li_idx],iaa_default_data[li_idx])
		NEXT	
	end if
elseif upperbound(iastr_dwo_tabpage[]) > 0 then 
	if rpo_dw.dataobject = iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default then
		if pos(is_display_column,';')>0 then
			lc_string.f_stringtoarray(is_display_column , ';', las_colmun[])
		elseif is_display_column <> '' then
			las_colmun[1] = is_display_column
		end if
		FOR li_idx = 1 to upperbound(iaa_default_data[])
			rpo_dw.setitem(vl_currentrow,las_colmun[li_idx],iaa_default_data[li_idx])
		NEXT	
	end if
end if
return vl_currentrow
end event

event e_window_e_okclose;call super::e_window_e_okclose;t_dw		ldw_handle
t_ds_db	lds_handle

lds_handle = create t_ds_db
if upperbound(istr_dwo[]) > 0 then 
	ldw_handle = this.iw_display.f_get_dw( istr_dwo[1].s_dwo_default)
elseif upperbound(iastr_dwo_tabpage[]) > 0 then 
	ldw_handle = this.iw_display.f_get_dw(iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default )
end if
ldw_handle.accepttext( ) // do dw_main là dwo external và chỉ có 1 dòng nên dùng acceptext
lds_handle.dataobject = ldw_handle.dataobject
ldw_handle.rowscopy( 1, ldw_handle.rowcount( ) , Primary!, lds_handle, lds_handle.rowcount( ) + 1 , Primary!)
closewithreturn(s_wr_multi,lds_handle)
//if isvalid(ldw_handle) then message.powerobjectparm = lds_handle
//destroy lds_handle


end event

event e_window_e_postopen;call super::e_window_e_postopen;t_dw_mpl	ldw_main
c_string		lc_string
string			ls_currentSQL,ls_currentWhere,las_colmun[]
long			ll_row
int				li_idx

ldw_main = iw_display.dynamic f_get_dwmain()
if ldw_main.dataobject = '' then ldw_main = this.iw_display.f_get_dw(iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default )
if ldw_main.rowcount() = 0  and this.classname() <> 'u_valueset' then
	ldw_main.f_getcurrentSQL( ls_currentSQL, ls_currentWhere)
	if len(ls_currentSQL) + len(ls_currentWhere) > 0 then
		ldw_main.event e_addrow( )
	else
		ll_row = ldw_main.insertrow( 0)
		if ldw_main.dataobject = istr_dwo[1].s_dwo_default then
			if pos(is_display_column,';')>0 then
				lc_string.f_stringtoarray(is_display_column , ';', las_colmun[])
			elseif is_display_column <> '' then
				las_colmun[1] = is_display_column
			end if
			FOR li_idx = 1 to upperbound(iaa_default_data[])
				ldw_main.setitem(ll_row,las_colmun[li_idx],iaa_default_data[li_idx])
			NEXT	
		end if
	end if
end if
return 0
end event

event e_window_open;t_dw_mpl	ldw_main
string			ls_sql,ls_where

ldw_main =  iw_display.dynamic f_get_dwmain()
ldw_main.f_getcurrentsql( ls_sql, ls_where)
if len(ls_sql) + len(ls_where) = 0 then
	//nếu dwmain là dwo không có câu select thì k cần retrive và gọi hàm hiển thị nút
	this.f_ctrl_actionbuttons(ldw_main)
	return 1
else
	return 0
end if

end event

event e_window_e_close;//-- Override --//
t_ds_db	lds_handle

closewithreturn(iw_display,lds_handle)
return 0
end event

event e_dw_dwnkey;call super::e_dw_dwnkey;

if v_keycode = KeyEnter! then
	this. post event e_window_e_okclose( )
	return 2
end if
return 0
end event

