$PBExportHeader$s_w_map_n.srw
forward
global type s_w_map_n from s_w_main
end type
type ole_map from olecustomcontrol within s_w_map_n
end type
type dw_1 from t_dw_mpl within s_w_map_n
end type
end forward

global type s_w_map_n from s_w_main
integer width = 4142
integer height = 2512
boolean resizable = false
windowstate windowstate = normal!
ole_map ole_map
dw_1 dw_1
end type
global s_w_map_n s_w_map_n

type variables
string 			is_address_search     // địa chỉ cần tìm
string 			is_address_company // địa chỉ công ty
string				is_mapname			//file bản đồ
string 			is_APIKEY				//key kết nối google map
string				is_mapfile				// đường dẫn của file bản đồ
int		 			ii_mapfile				//số index khi open file bản đồ
boolean			ib_AD_search = false			//tìm địa chỉ
boolean			ib_RD_search	=false		//tìm đường
end variables

forward prototypes
public function datawindow f_get_dwmain ()
public subroutine f_display_map (string vs_mapfile)
public function integer f_update_userprofile ()
end prototypes

public function datawindow f_get_dwmain ();return dw_1
end function

public subroutine f_display_map (string vs_mapfile);any ls_rtn

OpenUserObject(ole_map)
ls_rtn = ole_map.object.Navigate2(vs_mapfile)
//if isnull(ls_rtn) then
//	close(this)
//	return
//end if
ole_map.setfocus( )
end subroutine

public function integer f_update_userprofile ();
c_dwservice			lc_dwservice

if lc_dwservice.f_update_dwtabseq( ic_obj_handling, dw_1, iadw_none_md[]) = -1 then
	return -1
end if

if lc_dwservice.f_update_resize_parm( ic_obj_handling) = -1 then
	return -1
end if

return 1
end function

on s_w_map_n.create
int iCurrent
call super::create
this.ole_map=create ole_map
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ole_map
this.Control[iCurrent+2]=this.dw_1
end on

on s_w_map_n.destroy
call super::destroy
destroy(this.ole_map)
destroy(this.dw_1)
end on

event e_postopen_child;call super::e_postopen_child;string 				ls_mapfile,ls_address,ls_object_related
window 				lw_parent
powerobject 		lc_object_handle_parent
s_str_dwo_related ls_str_dwo_related[],ls_str_dwo_related_destroy[]

lw_parent = this.f_getparentwindow( )
lc_object_handle_parent = lw_parent.dynamic f_get_obj_handling()
lc_object_handle_parent.dynamic f_get_data_related(ls_str_dwo_related)
ic_obj_handling.dynamic f_set_data_related(ls_str_dwo_related)
this.event e_postopen( 0)
if dw_1.rowcount() > 1 then
	ls_object_related = ls_str_dwo_related[upperbound(ls_str_dwo_related)].s_related_obj_name
	if pos(ls_object_related,'delivery') >0 then
		dw_1.setfilter( "PURPOSE = 'delivery'")
	elseif pos(ls_object_related,'invoice') >0 then
		dw_1.setfilter( "PURPOSE = 'invoice'")
	end if
	dw_1.filter( )
end if

ls_address = dw_1.getitemstring( 1, 'address')
ls_mapfile = ic_obj_handling.dynamic f_address_search(ls_address)
f_display_map(ls_mapfile)
lc_object_handle_parent.dynamic f_set_data_related(ls_str_dwo_related_destroy)
//this.f_resize_map( )
return 0
end event

event open;call super::open;select BUSINESS_ADDRESS.address into :gs_branch
from BUSINESS_ADDRESS
where BUSINESS_ADDRESS.object_ref_id = :gi_user_comp_id using SQLCA;
		
return 1
end event

event resize;call super::resize;//-- resize map --//
ole_map.move( tab_action.x , tab_action.y + tab_action.height )
//ole_map.width = tab_action.width
//ole_map.height = newheight - tab_action.y - tab_action.height - 280
//ole_map.event windowsetheight( newheight)
ole_map.resize(tab_action.width,newheight - tab_action.y - tab_action.height - 280)

//-- resize dw_1 --//
dw_1.move(ole_map.x , ole_map.y + ole_map.height )
dw_1.width = ole_map.width
dw_1.height = 280

end event

type dw_filter from s_w_main`dw_filter within s_w_map_n
end type

type st_1 from s_w_main`st_1 within s_w_map_n
end type

type tab_action from s_w_main`tab_action within s_w_map_n
integer width = 3278
integer height = 336
end type

type gb_filter from s_w_main`gb_filter within s_w_map_n
end type

type ole_map from olecustomcontrol within s_w_map_n
event statustextchange ( string text )
event progresschange ( long progress,  long progressmax )
event commandstatechange ( long command,  boolean enable )
event downloadbegin ( )
event downloadcomplete ( )
event titlechange ( string text )
event propertychange ( string szproperty )
event beforenavigate2 ( oleobject pdisp,  any url,  any flags,  any targetframename,  any postdata,  any headers,  ref boolean cancel )
event newwindow2 ( ref oleobject ppdisp,  ref boolean cancel )
event navigatecomplete2 ( oleobject pdisp,  any url )
event documentcomplete ( oleobject pdisp,  any url )
event onquit ( )
event onvisible ( boolean ocx_visible )
event ontoolbar ( boolean toolbar )
event onmenubar ( boolean menubar )
event onstatusbar ( boolean statusbar )
event onfullscreen ( boolean fullscreen )
event ontheatermode ( boolean theatermode )
event windowsetresizable ( boolean resizable )
event windowsetleft ( long left )
event windowsettop ( long top )
event windowsetwidth ( long ocx_width )
event windowsetheight ( long ocx_height )
event windowclosing ( boolean ischildwindow,  ref boolean cancel )
event clienttohostwindow ( ref long cx,  ref long cy )
event setsecurelockicon ( long securelockicon )
event filedownload ( boolean activedocument,  ref boolean cancel )
event navigateerror ( oleobject pdisp,  any url,  any frame,  any statuscode,  ref boolean cancel )
event printtemplateinstantiation ( oleobject pdisp )
event printtemplateteardown ( oleobject pdisp )
event updatepagestatus ( oleobject pdisp,  any npage,  any fdone )
event privacyimpactedstatechange ( boolean bimpacted )
event setphishingfilterstatus ( long phishingfilterstatus )
event newprocess ( long lcauseflag,  oleobject pwb2,  ref boolean cancel )
event redirectxdomainblocked ( oleobject pdisp,  any starturl,  any redirecturl,  any frame,  any statuscode )
integer y = 340
integer width = 3296
integer height = 1628
integer taborder = 40
boolean bringtotop = true
boolean border = false
borderstyle borderstyle = styleshadowbox!
boolean focusrectangle = false
string binarykey = "s_w_map_n.win"
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
end type

type dw_1 from t_dw_mpl within s_w_map_n
integer y = 1956
integer width = 3278
integer height = 268
integer taborder = 30
boolean bringtotop = true
end type

event buttonclicked;call super::buttonclicked;string ls_mapfile,ls_address_company

choose case dwo.name
	case 'b_search_address'
		ls_mapfile = ic_obj_handling.dynamic f_address_search( dw_1.getitemstring( 1, 'address'))
		f_display_map(ls_mapfile)
	case 'b_search_road'
		if isnull(gs_branch) or gs_branch = '' then gs_branch = '72 Cù Lao, PHường 2, Quận Phú Nhuận, TPHCM'
		ls_address_company = gs_branch
		ls_mapfile = ic_obj_handling.dynamic f_road_search(ls_address_company ,dw_1.getitemstring( 1, 'address'))
		f_display_map(ls_mapfile)
end choose
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
0As_w_map_n.bin 
2200000a00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff000000010000000000000000000000000000000000000000000000000000000085e2495001d60efe00000003000001800000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000009c00000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff000000038856f96111d0340ac0006ba9a205d74f0000000085e2495001d60efe85e2495001d60efe000000000000000000000000004f00430054004e004e00450053005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000030000009c000000000000000100000002fffffffe0000000400000005fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
22ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000004c00004a8400002a110000000000000000000000000000000000000000000000000000004c0000000000000000000000010057d0e011cf3573000869ae62122e2b00000008000000000000004c0002140100000000000000c0460000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004c00004a8400002a110000000000000000000000000000000000000000000000000000004c0000000000000000000000010057d0e011cf3573000869ae62122e2b00000008000000000000004c0002140100000000000000c0460000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1As_w_map_n.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
