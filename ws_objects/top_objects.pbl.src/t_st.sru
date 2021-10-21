$PBExportHeader$t_st.sru
$PBExportComments$top static text inherited from statictext
forward
global type t_st from statictext
end type
end forward

global type t_st from statictext
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "top static text"
boolean focusrectangle = false
event e_mousemove pbm_mousemove
end type
global t_st t_st

forward prototypes
public function string f_get_accessible_description ()
public function string f_get_accessible_name ()
public function string f_gettext ()
public function boolean f_set_visible (boolean vb_visible)
public function window f_getparent_window ()
public function integer f_set_lang_text ()
public function string f_get_parent_name_string ()
end prototypes

public function string f_get_accessible_description ();return this.accessibledescription
end function

public function string f_get_accessible_name ();return this.AccessibleName
end function

public function string f_gettext ();return this.text
end function

public function boolean f_set_visible (boolean vb_visible);this.visible = vb_visible
return this.visible
end function

public function window f_getparent_window ();

powerobject			lpo_handle

lpo_handle= this.getparent( )
DO while lpo_handle.typeof( )  <> window!
	lpo_handle = lpo_handle.getparent( )
LOOP
return lpo_handle

end function

public function integer f_set_lang_text ();string					ls_label_code, ls_parent_string
window				lw_display
s_object_display	lod_handling


// set language
if gs_user_lang <> 'vi-vn' then
	lw_display = this.f_getparent_window( )
	if isvalid(lw_display) then
		if lw_display.classname( ) = 't_w_menu' then 
			ls_label_code = lw_display.classname( )+'.' + this.classname( )
		elseif lw_display.classname( ) = 's_w_backgound' then
			ls_label_code = this.classname( )
		else
			lod_handling = lw_display.dynamic f_get_obj_handling()
			ls_parent_string = this.f_get_parent_name_string( )
			if ls_parent_string <> '' then
				ls_label_code = upper(lod_handling.classname( )) +'.'+ls_parent_string+'.'+ this.classname( )
			else
				ls_label_code =  upper(lod_handling.classname( )) +'.'+ this.classname( )
			end if
		end if
		if not isnull(ls_label_code) then
			if isvalid(t_w_mdi) then 
				this.text = t_w_mdi.ids_lang_text.f_get_lang_text( ls_label_code)
			end if 
		end if
	end if
end if
return 1
end function

public function string f_get_parent_name_string ();
string		ls_name, ls_name_string

powerobject			lpo_handle

lpo_handle= this.getparent( )
DO while lpo_handle.typeof( )  <> window!
	
	ls_name = lpo_handle.classname( )
	if ls_name_string <>'' then ls_name_string += '.'
	ls_name_string += ls_name
		
	lpo_handle = lpo_handle.getparent( )
LOOP
return ls_name_string
end function

on t_st.create
end on

on t_st.destroy
end on

event constructor;
this.post f_set_lang_text( )
end event

event rbuttondown;//c_popmenu_srv lc_popmenu_srv
//t_w_main lw_parent
//lc_popmenu_srv.f_getparentwindow(this, lw_parent)
//lc_popmenu_srv.f_popup_menu( this, lw_parent.parentwindow().pointerX(), lw_parent.parentwindow().pointerY())
end event

