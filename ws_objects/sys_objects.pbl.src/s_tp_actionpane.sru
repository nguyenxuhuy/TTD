$PBExportHeader$s_tp_actionpane.sru
forward
global type s_tp_actionpane from t_tp
end type
type dw_action from t_dw_action_pane within s_tp_actionpane
end type
end forward

global type s_tp_actionpane from t_tp
string tag = ""
integer width = 2103
integer height = 1428
long backcolor = 1073741824
string text = ""
long tabtextcolor = 0
long picturemaskcolor = 0
event type integer e_display_actionpane ( )
event type long e_resize_dw_action ( integer vi_newwidth,  integer vi_newheight )
dw_action dw_action
end type
global s_tp_actionpane s_tp_actionpane

type variables

s_str_actionpane			istr_actionpane

end variables

forward prototypes
public function integer f_get_dw_action (ref datawindow rdw_action)
public function s_str_actionpane f_get_actionpane_structure ()
public function integer f_set_actionpane_structure (s_str_actionpane vstr_actionpane)
public function integer f_set_actionpane (integer vi_page_idx)
end prototypes

event type integer e_display_actionpane();
dw_action.event e_display_actionbutton_new( this.width )
return 1
end event

event type long e_resize_dw_action(integer vi_newwidth, integer vi_newheight);dw_action.move(0, 0)
dw_action.width = vi_newwidth
dw_action.height = vi_newheight
if this.dw_action.dataobject <>'' then
	this.event e_display_actionpane( )
end if
return 0
end event

public function integer f_get_dw_action (ref datawindow rdw_action);rdw_action = dw_action
return 1
end function

public function s_str_actionpane f_get_actionpane_structure ();return istr_actionpane
end function

public function integer f_set_actionpane_structure (s_str_actionpane vstr_actionpane); istr_actionpane = vstr_actionpane
 return 0
end function

public function integer f_set_actionpane (integer vi_page_idx);string						ls_text
int							li_rtn
window					lw_display
s_object_display		lod_handle

if isvalid(istr_actionpane) then 
	this.dw_action.dataobject = istr_actionpane.s_dwo_action
	this.dw_action.reset()
//	li_rtn = this.dw_action.insertrow( 0)
	parent.dynamic f_getparentwindow(lw_display)
	lod_handle = lw_display.dynamic f_get_obj_handling()
	g_user.i_rule.f_set_policy_dwctrl(lod_handle, this.dw_action)
	this.dw_action. event e_init_buttons(istr_actionpane)
	if istr_actionpane.s_dwo_action = 'd_action_edit' then
		ls_text = t_w_mdi.ids_lang_text.f_get_lang_text( istr_actionpane.s_objname_handling )
		if istr_actionpane.i_tp_index > 1 then
			if ls_text = '' then
				ls_text = '[' +istr_actionpane.s_description + ']'
			end if
			ls_text +=  ' [x]'
		end if
	else
		ls_text = t_w_mdi.ids_lang_text.f_get_lang_text( istr_actionpane.s_dwo_action)
	end if 
	if ls_text = '' or isnull(ls_text) then
		ls_text = '[' +istr_actionpane.s_description + ']'
	end if
	this.text = ls_text
end if
return 0
end function

on s_tp_actionpane.create
int iCurrent
call super::create
this.dw_action=create dw_action
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_action
end on

on s_tp_actionpane.destroy
call super::destroy
destroy(this.dw_action)
end on

event e_resize;call super::e_resize;if isnull(istr_actionpane) then return
this.event e_resize_dw_action(newwidth, newheight)
end event

event constructor;call super::constructor;
istr_actionpane = message.powerobjectparm
setnull(message.powerobjectparm)
this.f_set_actionpane( istr_actionpane.i_tp_index)

end event

type dw_action from t_dw_action_pane within s_tp_actionpane
integer x = 59
integer y = 60
integer width = 302
integer height = 300
integer taborder = 10
string title = ""
borderstyle borderstyle = stylebox!
string is_popmenu = ""
end type

