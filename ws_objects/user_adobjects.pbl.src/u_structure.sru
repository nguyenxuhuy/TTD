$PBExportHeader$u_structure.sru
forward
global type u_structure from cl_structure
end type
end forward

global type u_structure from cl_structure
end type
global u_structure u_structure

on u_structure.create
call super::create
end on

on u_structure.destroy
call super::destroy
end on

event e_dw_rbuttondown;//-- overrided --//

return 0
end event

