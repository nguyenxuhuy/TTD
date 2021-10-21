$PBExportHeader$s_w_md_2ddlb.srw
forward
global type s_w_md_2ddlb from s_w_main
end type
type dw_2 from t_dw_mpl within s_w_md_2ddlb
end type
type dw_1 from t_dw_mpl within s_w_md_2ddlb
end type
type ddlb_1 from t_ddlb within s_w_md_2ddlb
end type
type ddlb_2 from t_ddlb within s_w_md_2ddlb
end type
type gb_2 from t_g_line within s_w_md_2ddlb
end type
end forward

global type s_w_md_2ddlb from s_w_main
long backcolor = 134217732
integer ii_spare_space = 110
dw_2 dw_2
dw_1 dw_1
ddlb_1 ddlb_1
ddlb_2 ddlb_2
gb_2 gb_2
end type
global s_w_md_2ddlb s_w_md_2ddlb

type variables
int				ii_dw_2_height = 600
end variables

forward prototypes
public function datawindow f_get_dwmain ()
public function datawindow f_get_dw_2 ()
public function dropdownlistbox f_get_ddlb1 ()
public function dropdownlistbox f_get_ddlb2 ()
end prototypes

public function datawindow f_get_dwmain ();return dw_1
end function

public function datawindow f_get_dw_2 ();return dw_2
end function

public function dropdownlistbox f_get_ddlb1 ();return ddlb_1
end function

public function dropdownlistbox f_get_ddlb2 ();return ddlb_2
end function

on s_w_md_2ddlb.create
int iCurrent
call super::create
this.dw_2=create dw_2
this.dw_1=create dw_1
this.ddlb_1=create ddlb_1
this.ddlb_2=create ddlb_2
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_2
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.ddlb_1
this.Control[iCurrent+4]=this.ddlb_2
this.Control[iCurrent+5]=this.gb_2
end on

on s_w_md_2ddlb.destroy
call super::destroy
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.ddlb_1)
destroy(this.ddlb_2)
destroy(this.gb_2)
end on

event resize;call super::resize;
//-- resize ddlb_1 --//
ddlb_1.move(tab_action.x ,  tab_action.y + tab_action.height)
ddlb_1.width = 1400
ddlb_1.height = 100

//-- resize ddlb_2 --//
ddlb_2.move(ddlb_1.x + ddlb_1.width,  tab_action.y + tab_action.height)
ddlb_2.width = 1100
ddlb_2.height = 100

//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space)
dw_1.width = newwidth
dw_1.height = newheight - tab_action.y - tab_action.height - ii_dw_2_height - gb_2.height - ii_spare_space - ii_filter_space

//-- resize horizontal line --//
gb_2.move( dw_1.x , dw_1.y + dw_1.height )
gb_2.width = dw_1.width 

//-- resize dw_2 --//
dw_2.move( dw_1.x , gb_2.y + gb_2.height )
dw_2.width = dw_1.width
dw_2.height = ii_dw_2_height

this.setredraw( true)

end event

type dw_filter from s_w_main`dw_filter within s_w_md_2ddlb
end type

type tab_action from s_w_main`tab_action within s_w_md_2ddlb
integer taborder = 0
long backcolor = 134217732
end type

type gb_filter from s_w_main`gb_filter within s_w_md_2ddlb
end type

type dw_2 from t_dw_mpl within s_w_md_2ddlb
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

type dw_1 from t_dw_mpl within s_w_md_2ddlb
integer x = 315
integer y = 576
integer width = 686
integer height = 392
integer taborder = 10
boolean bringtotop = true
boolean minbox = false
end type

event scrollhorizontal;call super::scrollhorizontal;dw_filter.modify("Datawindow.HorizontalScrollPosition="+this.describe("Datawindow.HorizontalScrollPosition"))
end event

event e_dwnlbuttonup;call super::e_dwnlbuttonup;//-- resize column cua dw_filter neu co --//
IF this.object.datawindow.syntax.modified = "yes" THEN
	if parent.f_is_filter_on() then
		if this.f_isgrid( ) then
			this.post event e_resize_dwfilter()
		end if
	end if
end if
end event

event e_postretrieve;call super::e_postretrieve;//if parent.is_filterstring <> '' then
//	this.setfilter( parent.is_filterstring )
//	this.filter( )
//	if this.rowcount( ) > 0 then
//		this.event rowfocuschanged(1)
////		this.scrolltorow( 1)
//	end if
//end if
return 0 
end event

type ddlb_1 from t_ddlb within s_w_md_2ddlb
integer x = 27
integer y = 396
integer width = 1815
integer height = 820
integer taborder = 20
boolean bringtotop = true
boolean autohscroll = true
boolean hscrollbar = true
boolean vscrollbar = true
end type

type ddlb_2 from t_ddlb within s_w_md_2ddlb
integer x = 1870
integer y = 388
integer width = 1207
integer height = 800
integer taborder = 30
boolean bringtotop = true
boolean autohscroll = true
boolean hscrollbar = true
boolean vscrollbar = true
end type

type gb_2 from t_g_line within s_w_md_2ddlb
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

dw_1.height = parent.workspaceheight( ) - tab_action.y - tab_action.height - ii_dw_2_height - gb_2.height - ii_spare_space - ii_filter_space

//-- resize dw_2 --//
dw_2.move( dw_1.x , gb_2.y + gb_2.height )
dw_2.height = ii_dw_2_height
end event

