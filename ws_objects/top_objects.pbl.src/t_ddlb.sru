$PBExportHeader$t_ddlb.sru
$PBExportComments$top drop down list box
forward
global type t_ddlb from dropdownlistbox
end type
end forward

global type t_ddlb from dropdownlistbox
end type
global t_ddlb t_ddlb

forward prototypes
public function integer f_getparentwindow (ref window aw_parent)
public function integer f_send_message_to_object (ref powerobject rddlb_handling, long vl_index, string vs_message)
end prototypes

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

public function integer f_send_message_to_object (ref powerobject rddlb_handling, long vl_index, string vs_message);int 						li_rtn
s_object_display		lod_handling
window					lw_display

if this.f_getparentwindow( lw_display) = 1 then
	lod_handling = lw_display.dynamic f_get_obj_handling()
	if isvalid(lod_handling) then
		return lod_handling.f_handle_message(rddlb_handling,vl_index, vs_message)
	end if
end if
return -1

end function

on t_ddlb.create
end on

on t_ddlb.destroy
end on

event selectionchanged;
dropdownlistbox				l_ddlb

//-- Thông báo cho obj_handling --//
l_ddlb = this
this.f_send_message_to_object( l_ddlb, index,  "selectionchanged")
end event

