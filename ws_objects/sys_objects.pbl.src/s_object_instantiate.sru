$PBExportHeader$s_object_instantiate.sru
forward
global type s_object_instantiate from s_object
end type
end forward

global type s_object_instantiate from s_object autoinstantiate
end type

type variables
t_s_tv  istr_tv

w_xls_service_progress iw_progress
end variables

forward prototypes
public function powerobject f_get_tv_data ()
public function double f_get_id ()
public function string f_get_tv_findstring ()
public function string f_get_tv_label ()
public function string f_get_tv_parentstring ()
public function integer f_get_tv_pictureindex ()
public function integer f_get_tv_selectedpictureindex ()
public function any f_get_tv_sort_data ()
public function integer of_show_progress (integer ai_progress, string vs_title)
public function integer of_set_progress_text (string vs_text)
end prototypes

public function powerobject f_get_tv_data ();return this
end function

public function double f_get_id ();return istr_tv.db_id
end function

public function string f_get_tv_findstring ();return string(istr_tv.db_id)
end function

public function string f_get_tv_label ();return istr_tv.s_label
end function

public function string f_get_tv_parentstring ();return string(istr_tv.db_up_id)
end function

public function integer f_get_tv_pictureindex ();return istr_tv.i_pic_idx
end function

public function integer f_get_tv_selectedpictureindex ();return istr_tv.i_sel_pic_idx
end function

public function any f_get_tv_sort_data ();return 0
end function

public function integer of_show_progress (integer ai_progress, string vs_title);if ai_progress > 100 then
	if isvalid(iw_progress) then
		close(iw_progress)
		setnull(iw_progress)
	end if
else
	if isvalid(iw_progress) then
	else
		open(iw_progress)
		iw_progress.title = vs_title +' ......... '
	end if
	iw_progress.event ue_show_progress(ai_progress)	
end if 

return 1
end function

public function integer of_set_progress_text (string vs_text);iw_progress.f_set_text_progress( vs_text)
return 1
end function

on s_object_instantiate.create
call super::create
end on

on s_object_instantiate.destroy
call super::destroy
end on

