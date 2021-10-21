$PBExportHeader$c_menu_srv.sru
$PBExportComments$class menu service, inherited from c_obj_service
forward
global type c_menu_srv from c_obj_service
end type
end forward

global type c_menu_srv from c_obj_service
end type

forward prototypes
public function boolean f_islabel_exists (string vs_menu_id)
end prototypes

public function boolean f_islabel_exists (string vs_menu_id);
long ll_cnt

select count(label_id) into :ll_cnt from erp_label where label_id = :vs_menu_id and sublabel_id is null ;

if sqlca.sqlcode = 0 then
	if ll_cnt > 0 then return true
end if

return false
end function

on c_menu_srv.create
call super::create
end on

on c_menu_srv.destroy
call super::destroy
end on

