$PBExportHeader$c_hprogress.sru
forward
global type c_hprogress from hprogressbar
end type
end forward

global type c_hprogress from hprogressbar
integer width = 622
integer height = 68
unsignedinteger maxposition = 100
unsignedinteger position = 50
integer setstep = 10
end type
global c_hprogress c_hprogress

forward prototypes
public subroutine of_setmaximum (long vl_max)
public subroutine of_increment (long vl_pos)
end prototypes

public subroutine of_setmaximum (long vl_max);this.maxposition = vl_max
end subroutine

public subroutine of_increment (long vl_pos);this.position = vl_pos
end subroutine

on c_hprogress.create
end on

on c_hprogress.destroy
end on

