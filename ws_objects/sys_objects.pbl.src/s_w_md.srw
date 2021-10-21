$PBExportHeader$s_w_md.srw
forward
global type s_w_md from s_w_main
end type
type dw_2 from t_dw_mpl within s_w_md
end type
type dw_1 from t_dw_mpl within s_w_md
end type
type gb_2 from t_g_line within s_w_md
end type
end forward

global type s_w_md from s_w_main
long backcolor = 134217732
dw_2 dw_2
dw_1 dw_1
gb_2 gb_2
end type
global s_w_md s_w_md

type variables
int				ii_dw_2_height = 600
end variables

forward prototypes
public function datawindow f_get_dwmain ()
public function datawindow f_get_dw_2 ()
end prototypes

public function datawindow f_get_dwmain ();return dw_1
end function

public function datawindow f_get_dw_2 ();return dw_2
end function

on s_w_md.create
int iCurrent
call super::create
this.dw_2=create dw_2
this.dw_1=create dw_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_2
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.gb_2
end on

on s_w_md.destroy
call super::destroy
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.gb_2)
end on

event resize;call super::resize;

//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height )
dw_1.width = newwidth
dw_1.height = newheight - tab_action.y - tab_action.height - ii_dw_2_height - gb_2.height


//-- resize horizontal line --//
gb_2.move( dw_1.x , dw_1.y + dw_1.height )
gb_2.width = dw_1.width 

//-- resize dw_2 --//
dw_2.move( dw_1.x , gb_2.y + gb_2.height )
dw_2.width = dw_1.width
dw_2.height = ii_dw_2_height

this.setredraw( true)
end event

type dw_filter from s_w_main`dw_filter within s_w_md
end type

type tab_action from s_w_main`tab_action within s_w_md
integer taborder = 0
long backcolor = 134217732
end type

type gb_filter from s_w_main`gb_filter within s_w_md
end type

type dw_2 from t_dw_mpl within s_w_md
integer x = 736
integer y = 1180
integer height = 400
integer taborder = 20
boolean bringtotop = true
boolean minbox = false
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylebox!
end type

event constructor;call super::constructor;
this.ib_displaying = true
end event

type dw_1 from t_dw_mpl within s_w_md
integer x = 695
integer y = 416
integer width = 686
integer height = 392
integer taborder = 10
boolean bringtotop = true
boolean minbox = false
boolean hsplitscroll = true
boolean livescroll = true
end type

type gb_2 from t_g_line within s_w_md
integer x = 1047
integer y = 940
integer width = 782
integer height = 52
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

//-- resize dw_2 --//
dw_2.move( dw_1.x , gb_2.y + gb_2.height )
dw_2.height = ii_dw_2_height
end event

