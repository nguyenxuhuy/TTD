$PBExportHeader$c_label_tv.sru
forward
global type c_label_tv from s_object_instantiate
end type
end forward

global type c_label_tv from s_object_instantiate
end type

type variables

end variables

forward prototypes
public function double f_get_id ()
public function string f_get_tv_findstring ()
public function string f_get_tv_label ()
public function string f_get_tv_parentstring ()
public function integer f_get_tv_pictureindex ()
public function integer f_get_tv_selectedpictureindex ()
public function any f_get_tv_sort_data ()
end prototypes

public function double f_get_id ();return this.istr_tv.db_id  
end function

public function string f_get_tv_findstring ();return string(this.istr_tv.db_id)
end function

public function string f_get_tv_label ();return this.istr_tv.s_label
end function

public function string f_get_tv_parentstring ();return string(this.istr_tv.db_up_id)
end function

public function integer f_get_tv_pictureindex ();return this.istr_tv.i_pic_idx
end function

public function integer f_get_tv_selectedpictureindex ();return this.istr_tv.i_sel_pic_idx
end function

public function any f_get_tv_sort_data ();return this.istr_tv.s_label
end function

on c_label_tv.create
call super::create
end on

on c_label_tv.destroy
call super::destroy
end on

