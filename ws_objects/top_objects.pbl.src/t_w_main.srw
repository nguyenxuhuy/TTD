$PBExportHeader$t_w_main.srw
$PBExportComments$top window of main type
forward
global type t_w_main from window
end type
end forward

global type t_w_main from window
integer width = 3182
integer height = 1956
boolean titlebar = true
string title = "top window main"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 134217732
string icon = "Pics\logo_tp_icon.ico"
boolean clientedge = true
event type integer e_resize ( integer newwidth,  integer newheight,  string vs_display_model )
event type long e_preadd ( )
event type long e_postadd ( )
event type long e_add ( )
event type integer e_premodify ( )
event type integer e_modify ( )
event type integer e_predelete ( )
event type integer e_delete ( )
event type long e_presave ( )
event type integer e_save ( )
event type integer e_cancel ( )
event type integer e_update ( )
event type integer e_postopen ( integer vi_preopen_return )
event type integer e_preopen ( )
event type long e_insert ( )
event type integer e_refresh ( )
event type integer e_first ( )
event type integer e_next ( )
event type integer e_last ( )
event type integer e_prior ( )
event type integer e_prequery ( )
event type integer e_query ( )
event e_postquery ( )
event type integer e_execquery ( )
event type long e_preinsert ( )
event type long e_postinsert ( )
event type integer e_postsave ( integer vi_save_return )
event type integer e_firstpage ( )
event type long e_lastpage ( )
event type long e_nextpage ( )
event type long e_previouspage ( )
event type integer e_saveas ( string as_saveastype )
event type integer e_print ( )
event type integer e_postdelete ( )
event type integer e_attach ( )
event type boolean e_checking_chagedata ( string as_table_name,  string as_id_colume_name,  long al_id_value,  string as_status_colume_name,  string as_status_value )
event type integer e_postmodify ( )
event type integer e_display_actionbutton ( )
event type long e_saveclose ( )
event type integer e_postopen_child ( )
event type integer e_querying ( )
end type
global t_w_main t_w_main

type variables
public:
t_w_main				iw_parent, iw_child
boolean					ib_child
string						is_rightclicked_objname, is_win_grp, is_sheet_type, is_win_name, is_opentype
Protected:

s_object_display		ic_obj_main, ic_obj_handling

int 						ii_left_margin1 = 0, ii_right_margin1 = 0,ii_top_margin1 = 0, ii_bottom_margin1 = 0
Int							ii_spare_space, ii_filter_space, ii_dwfilter_header, ii_tv_width
string						is_popmenu 

end variables

forward prototypes
protected function integer f_set_usr_profile ()
public function integer f_set_security ()
public function integer f_get_control (ref powerobject rpo_control[])
public function integer f_openchild (string vs_windowchild)
public function integer f_openchildwithparm (string vs_windowchild, double vdb_parm)
public function integer f_openchildwithparm (string vs_windowchild, powerobject vpo_parm)
public function integer f_openchildwithparm (string vs_windowchild, string vs_stringparm)
public function powerobject f_get_obj_main ()
public function powerobject f_get_obj_handling ()
public function window f_getparentwindow ()
public function string f_get_rightcliked_objname ()
public subroutine f_set_originalsize_4_windowchild ()
public function integer f_send_message_to_object (powerobject rpo_requester, string vs_message)
end prototypes

event type integer e_postsave(integer vi_save_return);return vi_save_return
end event

protected function integer f_set_usr_profile ();return 0
end function

public function integer f_set_security ();return 0
end function

public function integer f_get_control (ref powerobject rpo_control[]);rpo_control = this.control
return 0
end function

public function integer f_openchild (string vs_windowchild);int li_rt
t_w_main lw_opened
		li_rt = OpenSheet(lw_opened, vs_windowchild, t_w_mdi, 0 , original!)
		If li_rt = -1 Then Return -1				

		lw_opened.iw_parent = this
		lw_opened.ib_child = true
		If li_rt = 1 Then this.Enabled = false
		
		return 1
end function

public function integer f_openchildwithparm (string vs_windowchild, double vdb_parm);int li_rt
t_w_main lw_opened

		li_rt = OpenSheetwithparm(lw_opened, vdb_parm, vs_windowchild, t_w_mdi, 0 , original!)
		If li_rt = -1 Then Return -1				


		lw_opened.iw_parent = this
		lw_opened.ib_child = true
		If li_rt = 1 Then this.Enabled = false
		
		return 1
end function

public function integer f_openchildwithparm (string vs_windowchild, powerobject vpo_parm);int 			li_rt
string			ls_objectname
t_w_main 	lw_opened

li_rt = Openwithparm(lw_opened, vpo_parm, vs_windowchild, this)
If li_rt = -1 Then Return -1				

ls_objectname=this.is_rightclicked_objname

lw_opened.iw_parent = this
this.iw_child = lw_opened
lw_opened.ib_child = true
lw_opened.is_rightclicked_objname = ls_objectname
//this.move( t_w_mdi.workspaceX() -20, t_w_mdi.workspaceY() - 200)
//this.width = t_w_mdi.MDI_1.width - 20
//this.height = t_w_mdi.MDI_1.height - t_w_mdi.MDI_1.microhelpheight
//

If li_rt = 1 Then this.Enabled = false
lw_opened.event e_postopen_child( )		
		
		
return 1

end function

public function integer f_openchildwithparm (string vs_windowchild, string vs_stringparm);int 			li_rt
string			ls_objectname
t_w_main 	lw_opened
c_string		lc_string

if lastpos(vs_stringparm, ';') > pos(vs_stringparm, ';') then
	ls_objectname = mid(vs_stringparm,  lc_string.f_pos_ex( vs_stringparm, ';', 2) +1)
	vs_stringparm =  mid(vs_stringparm, 1, lc_string.f_pos_ex( vs_stringparm, ';', 2) -1 )
end if

//t_w_mdi.wf_open_sheet_doc(ls_parm[1]+";"+ls_parm[2]+";"+ string(lc_menu_item.istr_tv.db_menu_id)+';'+ lc_menu_item.istr_tv.s_label)	

//li_rt = OpenSheetwithparm(lw_opened, vs_stringparm, vs_windowchild, t_w_mdi, 3 , original!)

li_rt = Openwithparm(lw_opened, vs_stringparm,vs_windowchild, this )
If li_rt = -1 Then Return -1				

lw_opened.iw_parent = this
lw_opened.ib_child = true
lw_opened.is_rightclicked_objname = ls_objectname
//this.move( t_w_mdi.workspaceX() -20, t_w_mdi.workspaceY() - 200)
//this.width = t_w_mdi.MDI_1.width - 20
//this.height = t_w_mdi.MDI_1.height - t_w_mdi.MDI_1.microhelpheight
//lw_opened.dynamic f_set_originalsize_4_windowchild()
//lw_opened.move( t_w_mdi.workspaceX() -20 + 1/16*( t_w_mdi.MDI_1.width - 20) ,t_w_mdi.workspaceY() - 200 +  1/16*(t_w_mdi.MDI_1.height - t_w_mdi.MDI_1.microhelpheight))
//lw_opened.width = ( t_w_mdi.MDI_1.width - 20) - 1/8*( t_w_mdi.MDI_1.width - 20)
//lw_opened.height = (t_w_mdi.MDI_1.height - t_w_mdi.MDI_1.microhelpheight) - 1/8*(t_w_mdi.MDI_1.height - t_w_mdi.MDI_1.microhelpheight)

If li_rt = 1 Then this.Enabled = false
lw_opened.event e_postopen_child( )
return 1
end function

public function powerobject f_get_obj_main ();return ic_obj_main
end function

public function powerobject f_get_obj_handling ();return ic_obj_handling
end function

public function window f_getparentwindow ();return iw_parent
end function

public function string f_get_rightcliked_objname ();return is_rightclicked_objname
end function

public subroutine f_set_originalsize_4_windowchild ();if this.ib_child then
	if this.windowstate = maximized! then this.windowstate = normal!
	this.move( t_w_mdi.workspaceX() -20 + 1/16*( t_w_mdi.MDI_1.width - 20) ,t_w_mdi.workspaceY() - 200 +  1/16*(t_w_mdi.MDI_1.height - t_w_mdi.MDI_1.microhelpheight))
	this.width = ( t_w_mdi.MDI_1.width - 20) - 1/8*( t_w_mdi.MDI_1.width - 20)
	this.height = (t_w_mdi.MDI_1.height - t_w_mdi.MDI_1.microhelpheight) - 1/8*(t_w_mdi.MDI_1.height - t_w_mdi.MDI_1.microhelpheight)
end if
end subroutine

public function integer f_send_message_to_object (powerobject rpo_requester, string vs_message);int 				li_rtn

li_rtn = ic_obj_handling.dynamic f_handle_message(rpo_requester, vs_message)
return li_rtn

end function

on t_w_main.create
end on

on t_w_main.destroy
end on

event clicked;t_w_mdi.setmicrohelp('')
end event

event key;if key = KeyEscape! then
	close(this)
end if
end event

event rbuttondown;int							li_rtn

t_m_popup_object		lm_popup
window					lw_request

//-- thong báo object rightclick truoc khi thực hiện-- //
lw_request = this
li_rtn = this.f_send_message_to_object(lw_request, 'rightclicked')
if li_rtn = -1 then 
	return -1
end if

lm_popup = create	t_m_popup_object
lm_popup.is_show_menu = is_popmenu
lm_popup.is_object_name = this.classname()

//-- Thông báo cho object popup --//
li_rtn = this.f_send_message_to_object(lm_popup, 'popup')
if li_rtn = -1 then 
	destroy lm_popup
	return -1
end if

//-- show popup menu --//
lm_popup.popmenu( t_w_mdi.pointerX() , t_w_mdi.pointerY() )

//-- xử lý khi user click chọn popmenu --//
if 'm_edit_window_label' = lm_popup.is_clicked_menu  then
	this.dynamic f_openchildwithparm('s_w_tv_md','c_label_window;0')
elseif 'm_setup_user_access'  = lm_popup.is_clicked_menu  then
elseif 'm_setup_alert' = lm_popup.is_clicked_menu  then
elseif 'm_setup_dw' = lm_popup.is_clicked_menu  then
end if

//-- Thông báo cho object menu duoc click--//
if lm_popup.is_clicked_menu <> '' then
	li_rtn = this.f_send_message_to_object(lm_popup, 'clicked')
end if

destroy lm_popup
end event

event mousemove;

//-- kiểm tra w_search close chưa --//

//if this.classname( ) <> 's_w_search' then
//	if isvalid(t_w_mdi.iw_search) then
//		if t_w_mdi.iw_search.height > t_w_mdi.iw_search.dw_search.height then
//			t_w_mdi.iw_search.height = t_w_mdi.iw_search.dw_search.height
//			t_w_mdi.iw_search.width = t_w_mdi.iw_search.dw_search.width
//			
//			if gs_user_lang = 'vi-vn' then
//				t_w_mdi.iw_search.dw_search.setitem(1,'search','Gõ vào điều cần tìm và bấm "Enter"...')
//			elseif  gs_user_lang = 'en-us' then
//				t_w_mdi.iw_search.dw_search.setitem(1,'search','Key in what to search and <Enter>...')
//			end if
//			t_w_mdi.iw_search.setredraw(true)
//		end if
//	end if
//end if
//
end event

