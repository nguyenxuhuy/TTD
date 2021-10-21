$PBExportHeader$t_t.sru
$PBExportComments$top tab control
forward
global type t_t from tab
end type
end forward

global type t_t from tab
integer width = 1842
integer height = 1268
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean showpicture = false
integer selectedtab = 1
event type integer e_init_tabpages ( userobject ruo_tabpage[] )
event e_mousemove pbm_mousemove
end type
global t_t t_t

type variables
boolean		ib_tabpage_creating
end variables

forward prototypes
public function string f_get_accessible_name ()
public function integer f_handle_message (string vs_message)
public function integer f_getparentwindow (ref window aw_parent)
end prototypes

public function string f_get_accessible_name ();return this.AccessibleName
end function

public function integer f_handle_message (string vs_message);
this.triggerevent(vs_message)
		
return 1
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

