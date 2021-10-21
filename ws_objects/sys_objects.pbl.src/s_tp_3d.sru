$PBExportHeader$s_tp_3d.sru
forward
global type s_tp_3d from t_tp
end type
type dw_3 from t_dw_mpl within s_tp_3d
end type
type dw_2 from t_dw_mpl within s_tp_3d
end type
type dw_1 from t_dw_mpl within s_tp_3d
end type
type gb_1 from t_g_line within s_tp_3d
end type
type gb_2 from t_gb within s_tp_3d
end type
type gb_3 from t_gb within s_tp_3d
end type
end forward

global type s_tp_3d from t_tp
integer width = 2437
integer height = 1056
dw_3 dw_3
dw_2 dw_2
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global s_tp_3d s_tp_3d

type variables
int			ii_leftpart_width, ii_upperpart_height
end variables

on s_tp_3d.create
int iCurrent
call super::create
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_3
this.Control[iCurrent+2]=this.dw_2
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.gb_1
this.Control[iCurrent+5]=this.gb_2
this.Control[iCurrent+6]=this.gb_3
end on

on s_tp_3d.destroy
call super::destroy
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event e_resize;call super::e_resize;
//-- resize gb_2 --//
gb_2.move( 0, 0)
gb_2.width = ii_leftpart_width
gb_2.height = newheight

//-- resize dw_1--//
dw_1.move( gb_2.x + 25 , gb_2.y + 65 )
dw_1.width = ii_leftpart_width -55
dw_1.height = newheight - 80

//-- resize gb_1 --//
gb_1.move(gb_2.x + ii_leftpart_width, 0)
gb_1.height = newheight
gb_1.width = 24

//-- resize gb_3 --//
gb_3.move( gb_1.x + gb_1.width + 5, 0)
gb_3.width = newwidth - gb_1.x - gb_1.width - 5
gb_3.height = newheight

//-- resize dw_2--//
dw_2.move( gb_3.x + 25 , gb_3.y + 65 )
dw_2.width = newwidth  - gb_1.x - gb_1.width -55
dw_2.height = newheight - 80


end event

type dw_3 from t_dw_mpl within s_tp_3d
integer x = 1257
integer y = 584
integer width = 832
integer height = 276
integer taborder = 20
end type

type dw_2 from t_dw_mpl within s_tp_3d
integer x = 1198
integer y = 112
integer height = 452
integer taborder = 20
end type

type dw_1 from t_dw_mpl within s_tp_3d
integer x = 32
integer y = 112
integer height = 760
integer taborder = 10
end type

type gb_1 from t_g_line within s_tp_3d
integer x = 1038
integer y = 172
integer width = 24
integer height = 568
integer taborder = 50
string pointer = "SizeWE!"
long backcolor = 12639424
borderstyle borderstyle = stylelowered!
end type

event e_mousemove;call super::e_mousemove;
int				li_x

if flags = 1 then	
	li_x =  parent.pointerx( )
	if li_x >140 and li_x < parent.width - 200 then 
		this.move( li_x, this.y )
		this.setposition( ToTop!)
		ii_leftpart_width = li_x
	end if
end if

end event

event e_left_mouseup;call super::e_left_mouseup;
//-- resize gb_3 --//
gb_2.width = ii_leftpart_width - 5

//-- resize dw_2 --//
dw_1.width =  ii_leftpart_width - 55

//-- resize gb_4 --//
gb_3.move(  gb_1.x + gb_1.width + 5 ,  0 )
gb_3.width = parent.width - gb_1.x - gb_1.width  - 5

//-- resize dw_1 --//
dw_2.move( gb_3.x + 25 ,  gb_3.y + 65 )
dw_2.width = parent.width - gb_1.x - gb_1.width - 55

end event

type gb_2 from t_gb within s_tp_3d
integer width = 978
integer height = 900
integer taborder = 10
end type

type gb_3 from t_gb within s_tp_3d
integer x = 1170
integer y = 52
integer width = 978
integer height = 900
integer taborder = 20
end type

