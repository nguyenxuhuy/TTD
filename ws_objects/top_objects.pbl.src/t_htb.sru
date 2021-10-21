$PBExportHeader$t_htb.sru
$PBExportComments$top horizontal track bar
forward
global type t_htb from htrackbar
end type
end forward

global type t_htb from htrackbar
integer width = 622
integer height = 136
integer maxposition = 100
integer tickfrequency = 10
end type
global t_htb t_htb

forward prototypes
public function string f_get_accessible_description ()
public function string f_get_accessible_name ()
public function boolean f_set_visible (boolean vb_visible)
public function string f_gettext ()
public function integer f_getparentwindow (ref window aw_parent)
public function integer f_send_message_to_object (ref powerobject rpo_handling, string vs_message)
end prototypes

public function string f_get_accessible_description ();return this.accessibledescription
end function

public function string f_get_accessible_name ();return this.AccessibleName
end function

public function boolean f_set_visible (boolean vb_visible);this.visible = vb_visible
return this.visible
end function

public function string f_gettext ();return this.tag
end function

public function integer f_getparentwindow (ref window aw_parent);powerobject	lpo_parent

lpo_parent = this.GetParent()

// Loop getting the parent of the object until it is of type window!
do while IsValid (lpo_parent) 
	if lpo_parent.TypeOf() <> window! then
		lpo_parent = lpo_parent.GetParent()
	else
		exit
	end if
loop

if IsNull(lpo_parent) or not IsValid (lpo_parent) then
	setnull(aw_parent)	
	return -1
end if

aw_parent = lpo_parent

return 1
end function

public function integer f_send_message_to_object (ref powerobject rpo_handling, string vs_message);int 					li_rtn
powerobject		lpo_handling
window				lw_display

if this.f_getparentwindow( lw_display) = 1 then
	lpo_handling = lw_display.dynamic f_get_obj_handling()
	if isvalid(lpo_handling) then
		return lpo_handling.dynamic f_handle_message(rpo_handling, vs_message)
	end if
end if
return -1

end function

event rbuttondown;//c_popmenu_srv lc_popmenu_srv
t_w_main lw_parent
//lc_popmenu_srv.f_getparentwindow(this, lw_parent)
//lc_popmenu_srv.f_popup_menu( this, lw_parent.parentwindow().pointerX(), lw_parent.parentwindow().pointerY())
end event

on t_htb.create
end on

on t_htb.destroy
end on

event moved;
htrackbar				l_htb

//-- Thông báo cho obj_handling --//
l_htb = this
this.f_send_message_to_object( l_htb, "moved")

end event

