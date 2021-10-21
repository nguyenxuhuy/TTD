$PBExportHeader$s_w_tv_md_n.srw
forward
global type s_w_tv_md_n from s_w_main
end type
type dw_2 from t_dw_mpl within s_w_tv_md_n
end type
type tv_1 from t_tv within s_w_tv_md_n
end type
type dw_1 from t_dw_mpl within s_w_tv_md_n
end type
type gb_1 from t_g_line within s_w_tv_md_n
end type
type gb_2 from t_g_line within s_w_tv_md_n
end type
end forward

global type s_w_tv_md_n from s_w_main
integer width = 4137
integer height = 2108
windowstate windowstate = normal!
long backcolor = 134217732
boolean center = true
integer ii_tv_width = 900
dw_2 dw_2
tv_1 tv_1
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global s_w_tv_md_n s_w_tv_md_n

type variables

int				ii_dw_2_height = 600
end variables

forward prototypes
public function treeview f_get_tv ()
public function datawindow f_get_dwmain ()
public function datawindow f_get_dw_2 ()
end prototypes

public function treeview f_get_tv ();return tv_1
end function

public function datawindow f_get_dwmain ();return dw_1
end function

public function datawindow f_get_dw_2 ();return dw_2
end function

on s_w_tv_md_n.create
int iCurrent
call super::create
this.dw_2=create dw_2
this.tv_1=create tv_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_2
this.Control[iCurrent+2]=this.tv_1
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.gb_1
this.Control[iCurrent+5]=this.gb_2
end on

on s_w_tv_md_n.destroy
call super::destroy
destroy(this.dw_2)
destroy(this.tv_1)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event resize;call super::resize;
//-- resize filter --//
if gb_filter.visible then
	this.event e_filter_resize( )
end if
//-- resize tab action --//
this.event e_resize_tab_action(newwidth,newheight)

//-- resize treeview --//
tv_1.move( tab_action.x , tab_action.y + tab_action.height )
tv_1.width = ii_tv_width
tv_1.height = newheight - tab_action.y - tab_action.height

//-- resize vertical line --//
gb_1.move( tv_1.x + tv_1.width , tab_action.y + tab_action.height )
gb_1.height = newheight - tab_action.y - tab_action.height

//-- resize dw_1 --//
dw_1.move( gb_1.x + gb_1.width , tab_action.y + tab_action.height )
dw_1.width = newwidth - gb_1.x - gb_1.width
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

type dw_filter from s_w_main`dw_filter within s_w_tv_md_n
end type

type tab_action from s_w_main`tab_action within s_w_tv_md_n
integer taborder = 0
long backcolor = 134217732
end type

type gb_filter from s_w_main`gb_filter within s_w_tv_md_n
end type

type dw_2 from t_dw_mpl within s_w_tv_md_n
integer x = 736
integer y = 1180
integer height = 400
integer taborder = 20
boolean bringtotop = true
boolean minbox = false
end type

event constructor;call super::constructor;
this.ib_displaying = true
end event

type tv_1 from t_tv within s_w_tv_md_n
integer y = 568
integer taborder = 30
boolean bringtotop = true
end type

type dw_1 from t_dw_mpl within s_w_tv_md_n
integer x = 695
integer y = 416
integer width = 686
integer height = 392
integer taborder = 10
boolean bringtotop = true
end type

type gb_1 from t_g_line within s_w_tv_md_n
integer x = 530
integer y = 632
integer width = 27
integer height = 568
string pointer = "SizeWE!"
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

//-- resize tv_1 --//
tv_1.width = ii_tv_width

//-- resize dw_1 --//
dw_1.move( gb_1.x + gb_1.width , tab_action.y + tab_action.height )
dw_1.width = parent.workspacewidth( ) - gb_1.x - gb_1.width


//-- resize gb_2 --//
gb_2.move( dw_1.x , gb_2.y )
gb_2.width = dw_1.width


//-- resize dw_2 --//
dw_2.move( dw_1.x , dw_2.y )
dw_2.width = dw_1.width

end event

type gb_2 from t_g_line within s_w_tv_md_n
integer x = 1047
integer y = 940
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

