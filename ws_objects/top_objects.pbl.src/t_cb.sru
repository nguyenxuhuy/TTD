$PBExportHeader$t_cb.sru
$PBExportComments$top command button
forward
global type t_cb from commandbutton
end type
end forward

global type t_cb from commandbutton
integer width = 402
integer height = 112
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "top buton"
event e_dwnkey pbm_dwnkey
end type
global t_cb t_cb

type variables
boolean			ib_focus
end variables

forward prototypes
public function string f_get_accessible_description ()
public function string f_get_accessible_name ()
public function string f_gettext ()
public function boolean f_set_visible (boolean vb_visible)
public function window f_getparent_window ()
public function string f_get_parent_name_string ()
public function integer f_set_lang_text ()
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

public function string f_get_parent_name_string ();
string		ls_name, ls_name_string

powerobject			lpo_handle

lpo_handle= this.getparent( )
DO while lpo_handle.typeof( )  <> window!
	
	ls_name = lpo_handle.classname( )
	if ls_name_string <>'' then ls_name_string = '.' + ls_name_string
	ls_name_string = ls_name + ls_name_string
		
	lpo_handle = lpo_handle.getparent( )
LOOP
return ls_name_string
end function

public function integer f_set_lang_text ();string					ls_label_code, ls_text, ls_parent_string
window				lw_display
s_object_display	lod_handling


// set language
if gs_user_lang <> 'vi-vn' then
	lw_display = this.f_getparent_window( )
	if isvalid(lw_display) then
		if lw_display.classname( ) = 't_w_menu' then
			ls_label_code = lw_display.classname( )+'.' + this.classname( )
		elseif lw_display.classname( ) = 's_w_background' then
			ls_label_code =  this.classname( )
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
				ls_text = t_w_mdi.ids_lang_text.f_get_lang_text( ls_label_code)
				if ls_text = '' then 
					ls_text = this.text
					if ls_text <> '' and not isnull(ls_text) then ls_text = '[' + ls_text + ']'
				end if
				this.text = ls_text
			end if 
		end if
	end if
end if
return 1
end function

on t_cb.create
end on

on t_cb.destroy
end on

event rbuttondown;//c_popmenu_srv lc_popmenu_srv
//t_w_main lw_parent
//lc_popmenu_srv.f_getparentwindow(this, lw_parent)
//lc_popmenu_srv.f_popup_menu( this, lw_parent.parentwindow().pointerX(), lw_parent.parentwindow().pointerY())
end event

event constructor;//
//string 			ls_label_code
//s_object_display			lc_object
//
// set language
//if gs_user_lang <> 'vi-vn' then
////	ls_label_code = lc_object.f_get_path_classname( this) 
//	if not isnull(ls_label_code) then
//		if isvalid(t_w_mdi) then 
//			this.text = t_w_mdi.ids_lang_text.f_get_lang_text( ls_label_code, '')
//		end if 
//	end if
//end if

// set user profile



end event

event getfocus;s_object_display			lc_object
string 			ls_label_code


ib_focus = true

lc_object = create s_object_display
ls_label_code = lc_object.f_get_path_classname( this)
if isvalid(t_w_mdi) then 
	t_w_mdi.ids_lang_text.f_set_ttdhelp(ls_label_code,'')
end if 
destroy lc_object
end event

event losefocus;
ib_focus = false
end event

