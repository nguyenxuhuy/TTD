$PBExportHeader$u_choose_trans_po.sru
forward
global type u_choose_trans_po from b_choose_trans
end type
end forward

global type u_choose_trans_po from b_choose_trans
end type
global u_choose_trans_po u_choose_trans_po

type variables
double 		idb_branch_id
string			is_id_list
end variables

forward prototypes
public subroutine f_set_dwo_window ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_choose_trans_po_form'
istr_dwo[1].s_dwo_form = 'd_choose_trans_po_form'
istr_dwo[1].s_dwo_grid = ''
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = false
istr_dwo[1].b_keyboardlocked = false
istr_dwo[1].s_description = 'Chọn giao dịch và NCC'


istr_dwo[2].s_dwo_default =  'd_so_line_2_po_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_so_line_2_po_grid'
istr_dwo[2].b_insert = false
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = false
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = false
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_description = 'Chọn giao dịch và NCC'
end subroutine

on u_choose_trans_po.create
call super::create
end on

on u_choose_trans_po.destroy
call super::destroy
end on

event e_window_open;call super::e_window_open;any					laa_value[]
t_dw_mpl			ldw_main, ldw_line


ldw_main = iw_display.f_get_dwmain( )
ldw_main.event e_addrow( )

if this.idb_main_id > 0 then
	ldw_main.setitem( 1, 'trans_id', idb_main_id)
	ldw_main.setitem( 1, 'branch_id', idb_branch_id )
end if
ldw_main.event e_resetupdate( )

//-- line--//
ldw_line = iw_display.f_get_dw( 'd_so_line_2_po_grid')
if isvalid(ldw_line) then
	if pos(is_id_list,';') > 0 then
		laa_value[1] = '('+is_id_list +')'	
	else
		laa_value[1] = is_id_list
	end if
	ldw_line.f_add_where( "object_ref_id", laa_value[])
	ldw_line.retrieve( )
end if

return 0
end event

event constructor;call super::constructor;ib_changed_dwo_4edit = false
is_display_model = '2d'
ib_display_text = true
is_object_title = 'Chọn giao dịch và NCC'

istr_actionpane[1].s_button_name = 'b_okclose;b_close;'
istr_actionpane[1].s_description = is_object_title
end event

event e_action_ctrl_bttn;//-- override --//

datawindow				ldw_focus
int								li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	//-- control d_action_edit --//
	FOR li_idx = 1 to upperbound(istr_actionpane[]) 
		if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit'then
			if ldw_focus.dynamic f_get_ib_shared() then
				ldw_focus = ldw_focus.dynamic f_getdwmaster()
			end if			
			if ldw_focus.dynamic f_get_ib_detail() then
				if ib_changed_dwo_4edit then
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_okclose;b_close;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_okclose;b_close;'
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_okclose;b_close;'
					else
						istr_actionpane[li_idx].s_visible_buttons ='b_okclose;b_close;'
					end if
				end if
			else				
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_okclose;b_close;'
				else
					istr_actionpane[li_idx].s_visible_buttons='b_okclose;b_close;'
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object'then
			
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage'then	
			
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report'then				
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_dw_e_preretrieve;call super::e_dw_e_preretrieve;return -9
end event

event e_window_e_okclose;//--Override--//
double			ldb_tmp
long				ll_found
datawindow 		ldw_main, ldw_line
s_str_data			lstr_data


ldw_main = iw_display.f_get_dwmain()
ldw_line = iw_display.f_get_dw( 'd_so_line_2_po_grid')

ll_found = ldw_line.find("gutter='Y'", 1, ldw_line.rowcount())
Do while ll_found > 0 
	if upperbound(lstr_data.as_data[]) > 0  then  lstr_data.as_data[1]  += ';'
	
	 lstr_data.as_data[1] += string(ldw_line.getitemnumber( ll_found, 'id'))
	
	ll_found = ldw_line.find("gutter='Y'", ll_found+1, ldw_line.rowcount()+1)
loop

if  upperbound(lstr_data.as_data[]) = 0   then 
	gf_messagebox('m.u_choose_trans_po.e_window_e_okclose.04','Thông báo','Chưa chi tiết mặt hàng','exclamation','ok',1)
	return	
end if


ldb_tmp = ldw_main.getitemnumber(1 , 'trans_id')
if ldb_tmp = 0 or isnull(ldb_tmp) then 
	gf_messagebox('m.u_choose_trans_po.e_window_e_okclose.01','Thông báo','Chưa chọn giao dịch','exclamation','ok',1)
	return
end if
lstr_data.adb_data[1] = ldb_tmp

ldb_tmp = ldw_main.getitemnumber(1 , 'vend_id')
if ldb_tmp = 0 or isnull(ldb_tmp) then 
	gf_messagebox('m.u_choose_trans_po.e_window_e_okclose.02','Thông báo','Chưa chọn nhà cung cấp','exclamation','ok',1)
	return
end if
lstr_data.adb_data[2] = ldb_tmp
ldb_tmp = ldw_main.getitemnumber(1 , 'currency_id')
if ldb_tmp = 0 or isnull(ldb_tmp) then 
	gf_messagebox('m.u_choose_trans_po.e_window_e_okclose.03','Thông báo','Chưa chọn loại tiền','exclamation','ok',1)
	return
end if
lstr_data.adb_data[3] = ldb_tmp



lstr_data.s_data = 'ok'

CloseWithReturn (iw_display,lstr_data)
end event

event e_window_e_close;//--override --//
s_str_data		lstr_data

lstr_data.s_data = 'cancel'
return closewithreturn(iw_display,lstr_data)
end event

event e_window_e_preopen;call super::e_window_e_preopen;
iw_display.f_set_ii_upperpart_height(1/4)
return 0
end event

event e_dw_clicked;//-- overide--//
return 0
end event

