$PBExportHeader$c_organisation.sru
$PBExportComments$Organisation class
forward
global type c_organisation from nonvisualobject
end type
end forward

global type c_organisation from nonvisualobject
end type
global c_organisation c_organisation

type variables
string is_name
string is_address
string is_lang
string is_country_id
end variables

forward prototypes
public function string f_get_name ()
public function string f_get_address ()
public function string f_get_lang ()
public function string f_get_country_id ()
end prototypes

public function string f_get_name ();return is_name
end function

public function string f_get_address ();return is_address
end function

public function string f_get_lang ();return is_lang
end function

public function string f_get_country_id ();return is_country_id
end function

on c_organisation.create
call super::create
TriggerEvent( this, "constructor" )
end on

on c_organisation.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

