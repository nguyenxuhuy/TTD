$PBExportHeader$s_w_3d_share.srw
forward
global type s_w_3d_share from s_w_main
end type
type dw_1 from t_dw_mpl within s_w_3d_share
end type
type dw_2 from t_dw_mpl within s_w_3d_share
end type
type dw_3 from t_dw_mpl within s_w_3d_share
end type
type gb_1 from t_g_line within s_w_3d_share
end type
type gb_2 from t_g_line within s_w_3d_share
end type
type gb_3 from t_gb within s_w_3d_share
end type
type gb_4 from t_gb within s_w_3d_share
end type
end forward

global type s_w_3d_share from s_w_main
integer height = 2100
integer ii_tv_width = 1200
dw_1 dw_1
dw_2 dw_2
dw_3 dw_3
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
end type
global s_w_3d_share s_w_3d_share

type variables

int		ii_dw_2_height = 1200
end variables

forward prototypes
public function datawindow f_get_dwmain ()
end prototypes

public function datawindow f_get_dwmain ();return dw_1
end function

on s_w_3d_share.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.dw_2=create dw_2
this.dw_3=create dw_3
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.dw_2
this.Control[iCurrent+3]=this.dw_3
this.Control[iCurrent+4]=this.gb_1
this.Control[iCurrent+5]=this.gb_2
this.Control[iCurrent+6]=this.gb_3
this.Control[iCurrent+7]=this.gb_4
end on

on s_w_3d_share.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.dw_2)
destroy(this.dw_3)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
end on

event resize;call super::resize;
//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space)
dw_1.width = newwidth
dw_1.height = newheight - tab_action.y - tab_action.height - ii_dw_2_height - gb_2.height - ii_spare_space - ii_filter_space

//-- resize horizontal line --//
gb_2.move( dw_1.x , dw_1.y + dw_1.height )
gb_2.width = dw_1.width 

//-- resize gb_3 --//
gb_3.move( dw_1.x , gb_2.y + gb_2.height )
gb_3.width = ii_tv_width - 5
gb_3.height = ii_dw_2_height

//-- resize dw_2 --//
dw_2.move( gb_3.x + 25 , gb_3.y + 65 )
dw_2.width = ii_tv_width - 55
dw_2.height = ii_dw_2_height - 80

//-- resize vertical line --//
gb_1.move( gb_3.x + ii_tv_width , gb_2.y + gb_2.height )
gb_1.height = ii_dw_2_height

//-- resize gb_4 --//
gb_4.move( gb_1.x + gb_1.width + 5, gb_2.y + gb_2.height )
gb_4.width = newwidth - gb_1.x - gb_1.width - 5
gb_4.height = ii_dw_2_height

//-- resize dw_3 --//
dw_3.move( gb_4.x + 25 ,  gb_4.y + 65)
dw_3.width = newwidth - gb_1.x - gb_1.width - 55
dw_3.height = ii_dw_2_height -80

this.setredraw( true)

end event

type dw_filter from s_w_main`dw_filter within s_w_3d_share
end type

type tab_action from s_w_main`tab_action within s_w_3d_share
end type

type gb_filter from s_w_main`gb_filter within s_w_3d_share
end type

type dw_1 from t_dw_mpl within s_w_3d_share
integer x = 434
integer y = 384
integer width = 1829
integer taborder = 40
boolean bringtotop = true
boolean vscrollbar = true
boolean livescroll = true
end type

type dw_2 from t_dw_mpl within s_w_3d_share
integer x = 105
integer y = 1200
integer taborder = 50
boolean bringtotop = true
boolean vscrollbar = true
boolean livescroll = true
end type

type dw_3 from t_dw_mpl within s_w_3d_share
integer x = 1719
integer y = 1236
integer taborder = 60
boolean bringtotop = true
boolean hscrollbar = true
boolean livescroll = true
end type

type gb_1 from t_g_line within s_w_3d_share
integer x = 1225
integer y = 1204
integer width = 27
integer height = 568
integer taborder = 30
string pointer = "SizeWE!"
long backcolor = 12639424
borderstyle borderstyle = stylelowered!
end type

event e_mousemove;call super::e_mousemove;
int				li_x

if flags = 1 then	
	li_x =  parent.pointerx( )
	if li_x >140 and li_x < parent.workspacewidth( ) - 200 then 
		this.move( li_x, this.y )
		this.setposition( ToTop!)
		ii_tv_width = li_x
	end if
end if

end event

event e_left_mouseup;call super::e_left_mouseup;
//-- resize gb_3 --//
gb_3.width = ii_tv_width - 5

//-- resize dw_2 --//
dw_2.width =  ii_tv_width - 55

//-- resize gb_4 --//
gb_4.move(  gb_1.x + gb_1.width + 5 ,  gb_2.y + gb_2.height )
gb_4.width = parent.workspacewidth( ) - gb_1.x - gb_1.width  - 5

//-- resize dw_1 --//
dw_3.move( gb_4.x + 25 ,  gb_4.y + 65 )
dw_3.width = parent.workspacewidth( ) - gb_1.x - gb_1.width - 55

end event

type gb_2 from t_g_line within s_w_3d_share
integer x = 1079
integer y = 1096
integer width = 599
integer height = 52
integer taborder = 60
long backcolor = 12639424
end type

event e_mousemove;call super::e_mousemove;

int				li_y

	
if flags = 1 then	
	li_y =  parent.pointery( )
	if li_y > tab_action.height +300 and li_y < parent.workspaceheight( ) - 300 then 
		this.move( this.x, li_y )
		this.setposition( ToTop!)
		ii_dw_2_height = parent.workspaceheight( ) - li_y - this.height
	end if
end if

end event

event e_left_mouseup;call super::e_left_mouseup;

//-- resize dw_1 --//

dw_1.height = parent.workspaceheight( ) - tab_action.y - tab_action.height - ii_dw_2_height - gb_2.height

//-- resize gb_3 --//
gb_3.move( dw_1.x , gb_2.y + gb_2.height )
gb_3.height = ii_dw_2_height

//-- resize dw_2 --//
dw_2.move( gb_3.x + 25 , gb_3.y + 65)
dw_2.height = ii_dw_2_height - 80

//-- resize gb_1 --//
gb_1.move( gb_1.x, gb_2.y + gb_2.height)
gb_1.height = ii_dw_2_height

//-- resize gb_4 --//
gb_4.move(  gb_1.x + gb_1.width + 5 , gb_2.y + gb_2.height )
gb_4.height = ii_dw_2_height

//-- resize dw_3 --//
dw_3.move(gb_4.x + 25 , gb_4.y + 65 )
dw_3.height = ii_dw_2_height - 80

end event

type gb_3 from t_gb within s_w_3d_share
integer y = 1116
integer width = 1061
integer height = 792
integer taborder = 30
end type

type gb_4 from t_gb within s_w_3d_share
integer x = 1618
integer y = 1164
integer width = 1061
integer height = 792
integer taborder = 40
end type

