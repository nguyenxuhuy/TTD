$PBExportHeader$s_w_main.srw
$PBExportComments$top window of main type
forward
global type s_w_main from t_w_main
end type
type st_1 from t_st within s_w_main
end type
type tab_action from t_t within s_w_main
end type
type tab_action from t_t within s_w_main
end type
type gb_filter from t_gb within s_w_main
end type
type dw_filter from t_dw_mpl within s_w_main
end type
end forward

global type s_w_main from t_w_main
boolean visible = false
integer width = 4782
integer height = 2116
string title = ""
boolean hscrollbar = true
boolean vscrollbar = true
string icon = ""
boolean toolbarvisible = false
boolean clientedge = false
boolean center = true
event type integer e_closeedit ( )
event type integer e_ctrl_actionbutton ( )
event e_resize_tab_action ( integer vi_width,  integer vi_height )
event type integer e_filteron ( )
event type integer e_filteroff ( )
event e_filter_modify_display ( string vas_colname[] )
event e_filter_resize ( )
event type integer e_change_object ( s_object_display vpo_change_object )
event type integer e_create_related_object ( string vs_object_name,  ref s_object_display rpo_related )
event type integer e_book ( )
event e_okclose ( )
event type integer e_close ( )
event type integer e_view_report ( )
event e_doc_trace_on ( )
event e_doc_trace_off ( )
event e_user_trace ( )
event type integer e_allocate ( )
event type integer e_amortize ( )
event type integer e_collect ( )
event type integer e_sendmail ( )
event type integer e_importfile ( )
event type integer e_change_object_appeon ( s_object_display vpo_change_object )
event type integer e_filteron_new ( )
event e_filter_resize_new ( )
st_1 st_1
tab_action tab_action
gb_filter gb_filter
dw_filter dw_filter
end type
global s_w_main s_w_main

type variables
public:
int							ii_resize_width, ii_resize_height
s_str_dw_md			iastr_dw_md[]
s_str_dw_ms			iastr_dw_ms[]

datawindow 				idw_focus, iwdw_detail[], iwdw_share[],iadw_none_md[]
t_transaction			it_transaction

boolean					ib_filter_on, ib_opening, ib_closing, ib_querymode_on, ib_dwmain_resetting, ib_object_changing
boolean					ib_doc_trace_on
string						is_data, is_filter_txt
Protected:

decimal			ii_text_spaceheight = 0
decimal 			ii_leftpart_width = 1100, ii_leftpart_width_bak
decimal			ii_midpart_width = 1000, ii_midpart_width_bak
decimal			ii_gb_11_width , ii_gb_11_width_bak
decimal			ii_upperpart_height = 1000, ii_upperpart_height_bak
decimal			ii_fixedpart1_height = 150, ii_fixedpart1_height_bak
decimal			ii_fixedpart2_height = 280, ii_fixedpart2_height_bak, ii_fixedpart2_height_form
decimal			ii_fixedpart3_height = 120, ii_fixedpart3_height_bak
decimal			ii_gb_3_height = 500, ii_gb_3_height_bak
decimal			ii_gb_4_height, ii_gb_4_height_bak
decimal			ii_gb_5_height, ii_gb_5_height_bak 
decimal			ii_Vscrollbar , ii_Hscrollbar 

end variables

forward prototypes
protected function integer f_set_usr_profile ()
public function integer f_set_security ()
public function powerobject f_get_main_object ()
public function integer f_set_dwo ()
public function datawindow f_get_idwfocus ()
public function datawindow f_get_dwmain ()
public function integer f_get_transaction (ref transaction rt_transaction)
public subroutine f_set_idwfocus (ref datawindow vdw_focus)
public function tab f_get_tab_action ()
public function integer f_get_dw_actionpane (string vs_dwo_actionpane, ref datawindow rdw_actionpane)
public function datawindow f_get_active_dwactionpane ()
public function boolean f_is_filter_on ()
public function integer f_filter_dwmain ()
public function integer f_get_filter_header ()
public function integer f_create_tabpage (ref t_t rt_detail)
public function integer f_display_ctrl (string vs_display_model)
public function integer f_arrange_dwdetail (datawindow vdw_detail[])
public function integer f_arrage_dwshared (datawindow vdw_shared[])
public function integer f_set_md_ms ()
public function tab f_get_tab_1 ()
public function integer f_get_dw_md_structure (ref s_str_dw_md rastr_dw_md[])
public function integer f_get_dw_ms_structure (ref s_str_dw_ms rastr_dw_ms[])
public function integer f_set_dw_ms_structure (s_str_dw_ms vastr_dw_ms[])
public function integer f_set_dw_md_structure (s_str_dw_md vastr_dw_md[])
public function boolean f_get_ib_opening ()
public function boolean f_get_ib_dwmain_resetting ()
public function integer f_suspend_dw ()
public subroutine f_set_invisible_ctrl ()
public subroutine f_set_visible_ctrl (string vs_display_model)
public function integer f_resize (string vs_display_model)
public subroutine f_set_st_1_text (string vs_text, string vs_dwo_name)
public function integer f_build_data_related (ref s_str_dwo_related rstr_data_related[])
public function integer f_set_dw_properties ()
public function integer f_set_record_security ()
public subroutine f_set_visible_st_1 (boolean vb_visible)
public subroutine f_set_text_cbx_1 (string vs_text, boolean vb_checked)
public subroutine f_set_text_cbx_2 (string vs_text, boolean vb_checked)
public function powerobject f_create_flex_object (datastore vds_dwsetup, string vs_objname)
public subroutine f_set_groupbox_text (groupbox vgb_handle, s_str_dwo rstr_dwo[])
public function groupbox f_get_groupbox (string vs_gb_name)
public subroutine f_set_resize_parm ()
public function boolean f_get_ib_doc_trace_on ()
public subroutine f_set_iwdw_detail (datawindow vdw_detail[])
public function integer f_get_iwdw_detail (ref datawindow rdw_detail[])
public function integer f_get_iwdw_share (ref datawindow rdw_share[])
public subroutine f_set_iwdw_share (datawindow vdw_share[])
public function boolean f_get_ib_object_changing ()
public subroutine f_reset_ii_fixedpart2_height_form ()
public subroutine f_reset_ii_fixedpart2_height_grid ()
public subroutine f_reset_ii_fixedpart2_height_grid (integer vi_fixedpart2_height)
public subroutine f_set_resize ()
public function integer f_set_record_security (t_dw_mpl vdw_handing)
public subroutine f_set_iadw_none_md (datawindow vdw_none_md[])
public function integer f_get_iadw_none_md (ref datawindow rdw_none_md[])
public subroutine f_store_filter_datastore ()
public function datawindow f_get_dw (string vs_dwo)
public subroutine f_set_obj_handling (s_object_display vod_handle)
public function integer f_set_redraw_dw (boolean vb_flag)
public function integer f_reconnect_trans ()
public function integer f_reset_dwo_trans ()
public function integer f_filter_dwmain_new ()
public function integer f_add_filter_colname (t_dw_mpl vdw_handle)
public function integer f_build_data_related (ref s_str_dwo_related rstr_data_related[], ref s_str_drilldown_data rstr_drilldown_data)
public subroutine f_set_ii_fixedpart1_height (decimal vi_fixedpart1_height)
public subroutine f_set_ii_fixedpart2_height (decimal vi_fixedpart2_height)
public subroutine f_set_ii_fixedpart2_height (decimal vi_fixedpart2_height, boolean vb_reset)
public subroutine f_set_ii_fixedpart3_height (decimal vi_fixedpart3_height)
public subroutine f_set_ii_gb_11_width (decimal vi_gb_11_width)
public subroutine f_set_ii_gb_3_height (decimal vi_gb_3_height)
public subroutine f_set_ii_gb_4_height (decimal vi_gb_4_height)
public subroutine f_set_ii_gb_5_height (decimal vi_gb_5_height)
public subroutine f_set_ii_leftpart_width (decimal vi_leftpart_width)
public subroutine f_set_ii_midpart_width (decimal vi_midpart_width)
public subroutine f_set_ii_upperpart_height (decimal vi_upperpart_height)
public subroutine f_set_ii_upperpart_height (decimal vi_upperpart_height, boolean vb_reset)
public function decimal f_get_ii_fixedpart1_height ()
public function decimal f_get_ii_fixedpart2_height ()
public function decimal f_get_ii_fixedpart3_height ()
public function decimal f_get_ii_gb_11_width ()
public function decimal f_get_ii_gb_3_height ()
public function decimal f_get_ii_gb_4_height ()
public function decimal f_get_ii_gb_5_height ()
public function decimal f_get_ii_leftpart_width ()
public function decimal f_get_ii_midpart_width ()
public function decimal f_get_ii_upperpart_height ()
public function integer f_set_record_security_ex (ref t_transaction rt_transaction)
public function integer f_set_record_security_ex (t_dw_mpl vdw_handing, ref t_transaction rt_transaction)
end prototypes

event type integer e_closeedit();t_dw_mpl		ldw_main

if ic_obj_handling.dynamic f_is_changed_dwo_4edit()  then
	ldw_main = this.f_get_dwmain( )	
	if isvalid(ldw_main) then
		ldw_main.event e_rollback_modify( )
		ldw_main.dynamic f_close_edit()
	else
		return -1
	end if		
	
	this.event e_filteron_new( )
	//-- set lại filter data nếu có--//
	this.f_filter_dwmain_new( )
//	if isvalid(ic_obj_handling.ids_filter_data ) then
//		if ic_obj_handling.ids_filter_data.rowcount() > 0 then			
//			ic_obj_handling.ids_filter_data.rowscopy( 1, 1, Primary!, dw_filter, 1, Primary!)	
//			this.f_filter_dwmain_new( )
//		end if
//	end if
	
	//--nếu đang copy thì sau khi save tắt chế độ copy--//
	if ic_obj_handling.f_get_ib_copying( ) then ic_obj_handling.f_set_ib_copying( false)
	ic_obj_handling.f_ctrl_actionbuttons( idw_focus)
	this.event e_display_actionbutton( )
	return idw_focus.setfocus( )	
	
	return 1
end if
return 0

end event

event type integer e_ctrl_actionbutton();
//-- Kiem tra phân quyen cua cac button --//
tab_Action.event e_ctrl_actionbutton()
return 1
end event

event e_resize_tab_action(integer vi_width, integer vi_height);this.tab_action.move(0,0)
this.tab_action.width = vi_width
this.tab_action.height= 364

end event

event type integer e_filteron();s_str_dwo			lstr_dwo[]
datawindow			ldw_main
c_string				lc_string
t_dw					ldw_focus
int						li_cnt
long					ll_currow
string					las_colname_in_taborder[], ls_dwsyntax, ls_err, ls_vpos_max, ls_vpos,ls_display_model


return event e_filteron_new( )

/*

// Gan dataobject cho dw_filter//
ldw_main = this.f_get_dwmain( )

li_cnt = ic_obj_handling.dynamic f_get_dwo(lstr_dwo[])
if li_cnt < 1 then return -1
if ldw_main.dynamic f_isgrid() then
	ls_dwsyntax = ldw_main.describe("datawindow.syntax")
//	ls_dwsyntax = lc_string.f_globalreplace( ls_dwsyntax, '=datetime', '=char(250)')
//	ls_dwsyntax = lc_string.f_globalreplace( ls_dwsyntax, '=number', '=char(250)')
	dw_filter.Create(ls_dwsyntax, ls_err)
	dw_filter.f_set_editable_4_filter( true)
	dw_filter.modify( "destroy b_form ")
	dw_filter.modify( "destroy b_first ")
	dw_filter.modify( "destroy b_prior ")
	dw_filter.modify( "destroy b_next ")
	dw_filter.modify( "destroy b_last ")
else
	dw_filter.dataobject = lstr_dwo[1].s_dwo_grid
end if


ii_dwfilter_header = integer(dw_filter.describe( "datawindow.header.height"))
dw_filter.modify( "gutter.protect =1")
dw_filter.object.datawindow.color = rgb(255,255,255)
li_cnt = dw_filter.insertrow( 0)
dw_filter.scrolltorow(li_cnt)
ib_filter_on = true
this.event e_filter_resize( )
ls_vpos_max = ldw_main.describe( "datawindow.VerticalScrollmaximum")
ll_currow = ldw_main.getrow( )
if ll_currow < 3 then
	ls_vpos = string(0)
else
	ls_vpos = string( long(long(ls_vpos_max)/ldw_main.rowcount( )*ll_currow -1) )
end if
ls_vpos = ldw_main.modify( "datawindow.VerticalScrollPosition = "+ls_vpos)	

//--resize window--//
ls_display_model = ic_obj_handling.dynamic f_get_display_model()
this.f_resize(ls_display_model )

gb_filter.visible = true
dw_filter.visible = true

//-- restore filter --//
if ic_obj_handling.is_dwmain_filter <> '' then 
//	dw_filter.setitem( 1, 'gutter', 'Y')
	ic_obj_handling.ids_filter_data.rowscopy(1, 1, primary!, dw_filter,1 , primary!)
	ldw_main.setfilter(ic_obj_handling.is_dwmain_filter)
	ldw_main.filter( )
else
	dw_filter.setitem( 1, 'gutter', 'N')
end if

this.event e_ctrl_actionbutton( )
this.event e_display_actionbutton( )

//-- set dw focus để chuẩn bị xử lý các chuổi đặt biệt của datetime và number--//
ldw_focus = dw_filter
dw_filter.inv_querymode.f_setdwfocus( ldw_focus)

return 0
*/
end event

event type integer e_filteroff();datawindow				ldw_main
s_str_dwo				lstr_dwo[]
groupbox					lgb_main
int							li_return
long						ll_row
string						ls_display_model, ls_filterStr
//-- hủy filter --//


//-- ẩn dw_filter va resize --//
dw_filter.visible = false
gb_filter.visible = false

ic_obj_handling.dynamic f_get_dwo(lstr_dwo[])
if lstr_dwo[1].s_gb_name <> '' then
	lgb_main = this.f_get_groupbox( lstr_dwo[1].s_gb_name )
	lgb_main.y = lgb_main.y - ii_filter_space
	if lgb_main.height > ii_filter_space then
		lgb_main.height = lgb_main.height + ii_filter_space
	else
		li_return = ic_obj_handling.event e_window('e_filteroff')
	end if
end if
/*
không resize dw main mà phải resize cả window
ldw_main.y = ldw_main.y - ii_filter_space
ldw_main.height = ldw_main.height + ii_filter_space
*/

ldw_main = this.f_get_dwmain( )
ii_filter_space = 0
ib_filter_on = false
ldw_main.setfilter( "")
ldw_main.filter( )

//-- khi nào có dữ liệu nhớ lại string --//
this.f_store_filter_datastore( )

//--resize window--//
ls_display_model = ic_obj_handling.dynamic f_get_display_model()
this.f_resize(ls_display_model )



//--Long: khi nào có dữ liệu nhớ lại string --//


//if not isnull(ls_filterStr) and ls_filterStr <> '' then
//	ll_row = ldw_main.getrow()
//	ldw_main.setfilter( "")
//	ldw_main.filter( )
//	if ll_row = 1 and not ic_obj_handling.ib_copying and not ic_obj_handling.ib_allocating then
//		ldw_main.dynamic f_filter_detail( )
//		ic_obj_handling.event e_dw_rowfocuschanged( ldw_main, ll_row)
//	end if
//end if

//Long: nếu ll_row <> 1 thì điều khiển nút đã được chạy trong rowforcus khi filter nên không cần chạy lại--//
//if (ll_row = 1 and ic_obj_handling.is_dwmain_filter <> '') or (ll_row = 0 and ic_obj_handling.is_dwmain_filter = '') then
//	this.event e_ctrl_actionbutton( )
//	this.event e_display_actionbutton( )
//end if
//ic_obj_handling.is_dwmain_filter =''

return 0
end event

event e_filter_modify_display(string vas_colname[]);datawindow			ldw_main
string	 				ls_rtn, ls_x, ls_colType, ls_colWidth
int						li_idx, li_colCount , li_y, li_hdr_height
any					la_data[]

dw_filter.setredraw( false)
//li_hdr_height = integer(dw_filter.describe("datawindow.header.height"))
ldw_main = this.f_get_dwmain( )
dw_filter.accepttext( )
li_colCount = upperbound(vas_colname[])
FOR li_idx =1 to li_colCount
	la_data[li_idx] = dw_filter.dynamic f_getitemany( 1, vas_colname[li_idx])
	ls_rtn= dw_filter.modify(vas_colname[li_idx]+".visible='0'" )
NEXT

FOR li_idx = 1 to li_colCount	
	ls_rtn= dw_filter.modify(vas_colname[li_idx]+".visible='1'" )
	dw_filter.setitem( 1, vas_colname[li_idx],la_data[li_idx])
	
	ls_x = dw_filter.describe(vas_colname[li_idx]+ ".x")	
	if ldw_main.dynamic f_isgrid() then
		ls_colWidth = ldw_main.describe(vas_colname[li_idx]+ ".width" )
	else
		ls_colWidth = dw_filter.describe(vas_colname[li_idx]+ ".width" )
	end if
	ls_rtn= dw_filter.modify(vas_colname[li_idx]+".x=" + ls_x  )
	ls_rtn= dw_filter.modify(vas_colname[li_idx]+".width=" + ls_colWidth  )
	ls_rtn= dw_filter.modify(vas_colname[li_idx]+".TabSequence=" + string(li_idx) )
	ls_rtn= dw_filter.modify(vas_colname[li_idx]+".Edit.limit=" + '250' )
NEXT

////dw_1.Object.DataWindow.ReadOnly = false
//ls_rtn = dw_filter.describe( "DataWindow.ReadOnly")
//ls_rtn = dw_filter.describe( vas_colname[15]+".Edit.style")
//ls_rtn = dw_filter.describe( vas_colname[15]+".Edit.Displayonly")
//ls_rtn = dw_filter.describe( vas_colname[15]+".Edit.limit")
dw_filter.setredraw( true)
//dw_filter.BringToTop=true

end event

event e_filter_resize();s_str_dwo			lstr_dwo[]
t_dw_mpl			ldw_main,ladw_share[]
groupbox				lgb_main
int						li_rtn, li_filter_space, li_return
string					las_colname_in_taborder[]


//-- resize gb_filter va dw_filter --//
li_filter_space = ii_filter_space
ldw_main = this.f_get_dwmain( )
li_rtn = ldw_main.dynamic f_getdwshared( ladw_share)

if ldw_main.dynamic f_isgrid() and li_rtn = 0 then
	ii_filter_space = 160
//	dw_filter.modify( "datawindow.header.height = 0" )		
else
	dw_filter.modify( "datawindow.header.height =" + string(ii_dwfilter_header))
	ii_filter_space = 160 + ii_dwfilter_header
end if

gb_filter.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_text_spaceheight)
gb_filter.width = this.width //- this.ii_vscrollbar // ldw_main.width
gb_filter.height = ii_filter_space 

dw_filter.move(gb_filter.x + 14, gb_filter.y + 60)
dw_filter.width = gb_filter.width - 28
dw_filter.height = gb_filter.height - 76

//-- modify display --//

if ldw_main.dynamic f_isgrid() and li_rtn = 0 and  dw_filter.is_filter_type = '2' then
	ldw_main.dynamic f_get_colname_in_taborder(las_colname_in_taborder[])
	this.event e_filter_modify_display( las_colname_in_taborder[]) // new không dùng --//
end if

/*
Đóng lại bởi Long 07/08/2015
không cần resize main ở đây, sẽ gọi resize window luôn trong sự kiện e_filter_on
//-- resize datawindow main --//
ic_obj_handling.f_get_dwo(lstr_dwo[])
if lstr_dwo[1].s_gb_name <> '' then
	lgb_main = this.f_get_groupbox( lstr_dwo[1].s_gb_name )
	lgb_main.y = lgb_main.y + (ii_filter_space - li_filter_space)
	if lgb_main.height > (ii_filter_space - li_filter_space) then
		lgb_main.height = lgb_main.height -  (ii_filter_space - li_filter_space)
	else
		li_return = ic_obj_handling.event e_window('e_filter_resize')
	end if	
end if

ldw_main.move(ldw_main.x , ldw_main.y + (ii_filter_space - li_filter_space))
ldw_main.height = ldw_main.height - (ii_filter_space - li_filter_space)
*/

end event

event type integer e_change_object(s_object_display vpo_change_object);boolean					lb_return_2_main,lb_multi_print
string						ls_display_model, ls_filterstring, ls_sqlnowhere, ls_currentwhere, ls_modify, ls_rtn,ls_dwo_view
double					ldb_main_ID
long						ll_row
int							li_idx,li_rtn
c_string					lc_string
s_str_dw_ms			lastr_dw_ms_empty[]
s_str_dw_md			lastr_dw_md_empty[]
t_transaction			lc_transaction
window					lw_requester
t_dw_mpl					ldw_main, ldw_empty[]
s_object_display		lod_main
s_str_dwo_related		lstr_data_related[],lstr_related[]
s_str_dwo				lstr_dwo[]

ib_object_changing = true
ldw_main = this.f_get_dwmain( )

if not isvalid(vpo_change_object) then return -1
if upper(left(ic_obj_handling.classname(),3)) = 'UR_' then // change drilldown report//
	ic_obj_handling.f_change_drilldown_rpt(vpo_change_object)

else
	//-- tat control --//
	this.dynamic f_set_invisible_ctrl()
	
	//-- tắt tìm kiếm --//
	if this.ib_querymode_on then this.event e_execquery( )
	
	lb_multi_print = true
	//--build data related--/
	if  not vpo_change_object.ib_copying then
		lod_main = vpo_change_object.f_get_main_object()
		if isvalid(lod_main) then
			if lod_main.classname( ) = ic_obj_handling.classname() then
				if vpo_change_object.classname() = 'b_view' then// Đối tượng In
					if ic_obj_handling.event e_window_e_view(vpo_change_object, ls_dwo_view ) = -1 then return -1
					li_rtn = ic_obj_handling.f_get_data_related(vpo_change_object.f_get_main_dwo( ), lstr_data_related[])												
				else
					 li_rtn = ic_obj_handling.f_get_data_related(vpo_change_object.classname(), lstr_data_related[])
				end if
				if li_rtn = 0 then
					//-- xem lại khai báo đối tương liên quan trên object--//
					gf_messagebox('m.s_w_main.e_change_object.01','Thông báo','Không tìm thấy struct đối tượng liên quan','exclamation','ok',1)
					return -1
				end if
				if this.f_build_data_related( lstr_data_related[]) = -1 then lb_multi_print = false
				vpo_change_object.f_set_data_related(lstr_data_related[])							
			else
				lb_return_2_main = true
			end if
		else
			lb_return_2_main = true
		end if
	end if
	//-- luu giu main ID --//
	if not lb_return_2_main then
		if  ldw_main.getrow( ) > 0 then
			ldb_main_ID = ldw_main.getitemnumber( ldw_main.getrow( ) , 'ID')
			ic_obj_handling.f_set_main_ID(ldb_main_ID)
		end if
	end if
	//-- Lưu giữ filter_data --//
	this.f_store_filter_datastore( )
	//-- Cất data của đối tượng hiện hành vào datastore --//
	this.f_suspend_dw( )
	
	//-- change object handling --//
	ic_obj_handling = vpo_change_object
	lw_requester = this
	ic_obj_handling.dynamic f_set_wdisplay(lw_requester)
	ic_obj_handling.f_init_policy_datastore( )
	
	//-- gán dwo cho dw cùa window --//
	iastr_dw_ms = lastr_dw_ms_empty[]
	iastr_dw_md = lastr_dw_md_empty[]
	this.iwdw_detail[]  = ldw_empty[]
	this.iwdw_share[] = ldw_empty[]
	this.iadw_none_md[] = ldw_empty[]
	this.f_set_dwo( )
	
	//-- tao tabpage detail nếu có --//
	if ic_obj_handling.dynamic f_create_tabpage() = -1 then return -1
		
	//-- set master detail share --//
	this.f_arrange_dwdetail( this.iwdw_detail[] )
	this.f_arrage_dwshared( this.iwdw_share[] )
	this.f_set_md_ms()
	
	//-- Nếu chuyển từ main obj qua related obj thì setnull originalwhere va reset current where --//
	if not lb_return_2_main then
		ldw_main.dynamic f_getcurrentsql( ls_sqlnowhere, ls_currentwhere)
		ls_modify = 'Datawindow.Table.Select= "' + ls_sqlnowhere +'"'
		ls_rtn =ldw_main.modify(ls_modify )	
		setnull(ldw_main.is_originalwhereclause)
		setnull(ldw_main.is_originalsql_nowhere)
	end if
	
	//-- set record security --//
	this.f_set_record_security( )
	
	//-- tat che do filter --//
	if this.ib_filter_on and ic_obj_handling.is_dwmain_filter = '' then 
		this.event e_filteroff( )
	end if
	
	//-- bat control --//
	ls_display_model = ic_obj_handling.dynamic f_get_display_model()
	this.dynamic f_set_visible_ctrl(ls_display_model)
	
	//-- set resize parm--//
	ic_obj_handling.event e_window( 'e_preopen')
	
	//-- set orignal retrieve parm --//
	ic_obj_handling.event e_window( 'open')
	
	//-- resize theo display model mới --//
	this.f_resize( ls_display_model)
	
	//-- thông báo đến object --//
	ic_obj_handling.event e_window( 'e_postopen')
	
	if ls_dwo_view <> '' then//đổi Đối tượng In (print)
		ldw_main.dataobject = ls_dwo_view
		this.f_get_transaction( lc_transaction)
		ldw_main.settransobject( lc_transaction)
		ldw_main.dynamic f_set_properties( )
	end if
	
	
	
	if  not ic_obj_handling.ib_copying then //
		if ldw_main.event e_retrieve()  = -1 then return -1
	else
		ic_obj_handling.ib_copying=false
		ic_obj_handling.f_ctrl_actionbuttons(ldw_main)
	end if
	
	ib_object_changing = false
	
	//-- Nếu quay về main obj thì scroll đến dòng cũ --//
	if lb_return_2_main then
		ldb_main_ID = ic_obj_handling.f_get_main_id( )
		ll_row = ldw_main.find( "id = " +string(ldb_main_ID), 1, ldw_main.rowcount())
		if ll_row > 0 then
			ldw_main.scrolltorow( ll_row)
		end if
	end if
	
	// không thỏa điều kiện cột khai báo in nhiều phếu 1 lúc 
	if not  lb_multi_print then return -1 
	if ldw_main.event getfocus( ) = -1 then return -1
	this.event e_display_actionbutton( )
end if

return 1
end event

event type integer e_create_related_object(string vs_object_name, ref s_object_display rpo_related);int							li_idx, li_cnt
string						ls_object_name, ls_dwo_view
c_string					lc_string
s_tp_actionpane		ltp_actionpane
s_str_actionpane		lstr_actionpane[]
s_str_dwo_related		lstr_data_related[]
s_str_dwo				lstr_dwo[]
t_dw_mpl				ldw_main

if vs_object_name = '' then return  -1
ldw_main = this.f_get_dwmain( )
if ldw_main.getrow( ) < 1 and pos(ldw_main.dataobject,'report_parm') = 0 then
	return -1
end if
//-- Tao object handling --//

if left(vs_object_name,6) = 'b_view' then 
	ls_object_name =left(vs_object_name,6)
else
	ls_object_name = vs_object_name
end if

rpo_related =  create using ls_object_name

if ls_object_name = 'b_view' then
	ls_dwo_view = lc_string.f_globalreplace( vs_object_name, 'b_view_', 'dv_') + '_form'
	if ic_obj_handling.f_get_data_related( ls_dwo_view, lstr_data_related[]) = 1 then
		//--Gán title cho phiếu in--//
		rpo_related.f_get_istr_actionpane(lstr_actionpane)
		lstr_actionpane[1].s_description = lstr_data_related[1].s_text
		rpo_related.f_set_istr_actionpane(lstr_actionpane)		
		//--Gán dwo main --//
		rpo_related.f_get_dwo( lstr_dwo)
		lstr_dwo[1].s_dwo_default =  lstr_data_related[1].s_related_obj_dwo
		lstr_dwo[1].s_dwo_form = lstr_data_related[1].s_related_obj_dwo
		lstr_dwo[1].s_description =  lstr_data_related[1].s_text
		rpo_related.f_set_dwo_structure(lstr_dwo )		
	else
		gf_messagebox('m.s_w_main.e_create_related_object.01','Thông báo','Không tìm thấy structure đối tượng liên quan theo dwo:@'+ls_dwo_view,'stop','ok',1)
		return -1
	end if
end if


return 1
end event

event type integer e_book();
window 					lw_parent
powerobject 			lc_object_handle
s_str_dwo_related 	ls_str_dwo_related
string						ls_object_name

this.dynamic f_openchildwithparm('s_w_multi_n','u_book;0')

return 0
end event

event e_okclose();
 ic_obj_handling.event e_window( 'e_okclose')

end event

event type integer e_close();
 ic_obj_handling.dynamic event e_window( 'e_close')

 return 0

end event

event type integer e_view_report();ic_obj_handling.dynamic event e_window( 'e_view_report')
return 0
end event

event e_doc_trace_on();
ib_doc_trace_on = true
this.event e_refresh( )
this.event e_ctrl_actionbutton( )
this.event e_display_actionbutton( )
end event

event e_doc_trace_off();
ib_doc_trace_on = false
this.event e_refresh( )
this.event e_ctrl_actionbutton( )
this.event e_display_actionbutton( )
end event

event e_user_trace();
this.f_openchildwithparm( 's_w_multi_n', 'c_user_trace;0')
end event

event type integer e_sendmail();return 0
end event

event type integer e_importfile();ic_obj_handling.dynamic event e_window( 'e_importfile')
return 0
end event

event type integer e_change_object_appeon(s_object_display vpo_change_object);boolean					lb_return_2_main,lb_multi_print
string						ls_display_model, ls_filterstring, ls_sqlnowhere, ls_currentwhere, ls_modify, ls_rtn,ls_dwo_view
double					ldb_main_ID
long						ll_row
int							li_idx,li_rtn
c_string					lc_string
s_str_dw_ms			lastr_dw_ms_empty[]
s_str_dw_md			lastr_dw_md_empty[]
t_transaction			lc_transaction
window					lw_requester
//t_dw_mpl					ldw_main, ldw_empty[]
s_object_display		lod_main
s_str_dwo_related		lstr_data_related[],lstr_related[]
s_str_dwo				lstr_dwo[]
s_str_drilldown_data	lstr_drilldown_data

ib_object_changing = true
//ldw_main = this.f_get_dwmain( )

if not isvalid(vpo_change_object) then return -1
if upper(left(vpo_change_object.classname(), 3)) = 'UR_' then // change drilldown report//	
//	ic_obj_handling.f_change_drilldown_rpt(vpo_change_object)
	lb_multi_print = true
	li_rtn = ic_obj_handling.f_get_data_related(vpo_change_object.classname(), lstr_data_related[])
	if li_rtn = 0 then
		//-- xem lại khai báo đối tương liên quan trên object--//
		gf_messagebox('m.s_w_main.e_change_object.01','Thông báo','Không tìm thấy struct đối tượng liên quan','exclamation','ok',1)
		return -1
	end if	
	if this.f_build_data_related( lstr_data_related[], lstr_drilldown_data) = -1 then lb_multi_print = false
//	vpo_change_object.f_set_data_related(lstr_data_related[])		
	vpo_change_object.f_set_drilldown_data(lstr_drilldown_data)
	vpo_change_object.is_object_title = lstr_data_related[1].s_text
	vpo_change_object.is_win_grp = 'DOC'
	vpo_change_object.is_sheet_type ='DOC'
	vpo_change_object.is_win_name = lstr_data_related[1].s_text	
	
	li_idx= t_w_mdi.wf_open_sheet_doc(vpo_change_object, 's_w_multi_ex' )
	ib_object_changing = false	
else
	/*
	//-- tat control --//
	this.dynamic f_set_invisible_ctrl()
	
	//-- tắt tìm kiếm --//
	if this.ib_querymode_on then this.event e_execquery( )
	*/
	lb_multi_print = true
	//--build data related--/
	if  not vpo_change_object.ib_copying then

		if vpo_change_object.classname() = 'b_view' then// Đối tượng In
			if ic_obj_handling.event e_window_e_view(vpo_change_object, ls_dwo_view ) = -1 then return -1
			li_rtn = ic_obj_handling.f_get_data_related(vpo_change_object.f_get_main_dwo( ), lstr_data_related[])
		else
			 li_rtn = ic_obj_handling.f_get_data_related(vpo_change_object.classname(), lstr_data_related[])
		end if
		if li_rtn = 0 then
			//-- xem lại khai báo đối tương liên quan trên object--//
			gf_messagebox('m.s_w_main.e_change_object.01','Thông báo','Không tìm thấy struct đối tượng liên quan','exclamation','ok',1)
			return -1
		end if
		if this.f_build_data_related( lstr_data_related[]) = -1 then lb_multi_print = false
		vpo_change_object.f_set_data_related(lstr_data_related[])		
		vpo_change_object.is_object_title = lstr_data_related[1].s_text
		vpo_change_object.is_win_grp = 'DOC'
		vpo_change_object.is_sheet_type ='DOC'
		vpo_change_object.is_win_name = lstr_data_related[1].s_text
									
	end if	
	
	li_idx= t_w_mdi.wf_open_sheet_doc(vpo_change_object, 's_w_multi_ex' )
	vpo_change_object.post event e_window_e_change_object()
	ib_object_changing = false
	
end if

return li_idx
end event

event type integer e_filteron_new();
datawindow			ldw_main
c_string				lc_string
t_dw					ldw_focus
int						li_cnt
long					ll_currow
string					las_colname_in_taborder[], ls_dwsyntax, ls_err, ls_vpos_max, ls_vpos,ls_display_model


// Gan dataobject cho dw_filter//
ldw_main = this.f_get_dwmain( )



gb_filter.visible = true
dw_filter.visible = true

ii_dwfilter_header = integer(dw_filter.describe( "datawindow.header.height"))

li_cnt = dw_filter.insertrow( 0)
dw_filter.scrolltorow(li_cnt)
ib_filter_on = true
dw_filter.dynamic f_retrieve_dwc_dwfilter( 'colname')
this.event e_filter_resize_new( )


//--resize window--//
ls_display_model = ic_obj_handling.dynamic f_get_display_model()
this.f_resize(ls_display_model )

if isvalid( ic_obj_handling.ids_filter_data) then
	if ic_obj_handling.ids_filter_data.rowcount( ) = 1 then
		dw_filter.reset( )
		ic_obj_handling.ids_filter_data.rowscopy(1,1,primary!,dw_filter, 1,primary!)
	end if
end if

this.event e_ctrl_actionbutton( )
this.event e_display_actionbutton( )

//-- set dw focus để chuẩn bị xử lý các chuổi đặt biệt của datetime và number--//
ldw_focus = dw_filter
dw_filter.inv_querymode.f_setdwfocus( ldw_focus)

return 0
end event

event e_filter_resize_new();s_str_dwo			lstr_dwo[]
t_dw_mpl			ldw_main,ladw_share[]
groupbox				lgb_main
int						li_rtn, li_filter_space, li_return
string					las_colname_in_taborder[], ls_vpos_max


//-- resize gb_filter va dw_filter --//
li_filter_space = ii_filter_space
ldw_main = this.f_get_dwmain( )
li_rtn = ldw_main.dynamic f_getdwshared( ladw_share)

if ldw_main.dynamic f_isgrid() and li_rtn = 0 then
	ii_filter_space = 160
	if dw_filter.is_filter_type = '2' then
		dw_filter.modify( "datawindow.header.height = 0" )		
	else
	end if
else
	dw_filter.modify( "datawindow.header.height =" + string(ii_dwfilter_header))
	ii_filter_space = 160 + ii_dwfilter_header
end if

gb_filter.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_text_spaceheight)
gb_filter.width = this.width //- this.ii_vscrollbar // ldw_main.width
gb_filter.height = ii_filter_space 

dw_filter.move(gb_filter.x + 14, gb_filter.y + 60)
dw_filter.width = gb_filter.width - 28
dw_filter.height = gb_filter.height - 76
//dw_filter.bringtotop = true
//-- modify display --//

if dw_filter.is_filter_type = '2' then
	ldw_main.dynamic f_get_colname_in_taborder(las_colname_in_taborder[])
	this.event e_filter_modify_display( las_colname_in_taborder[])		
end if

/*
Đóng lại bởi Long 07/08/2015
không cần resize main ở đây, sẽ gọi resize window luôn trong sự kiện e_filter_on
//-- resize datawindow main --//
ic_obj_handling.f_get_dwo(lstr_dwo[])
if lstr_dwo[1].s_gb_name <> '' then
	lgb_main = this.f_get_groupbox( lstr_dwo[1].s_gb_name )
	lgb_main.y = lgb_main.y + (ii_filter_space - li_filter_space)
	if lgb_main.height > (ii_filter_space - li_filter_space) then
		lgb_main.height = lgb_main.height -  (ii_filter_space - li_filter_space)
	else
		li_return = ic_obj_handling.event e_window('e_filter_resize')
	end if	
end if

ldw_main.move(ldw_main.x , ldw_main.y + (ii_filter_space - li_filter_space))
ldw_main.height = ldw_main.height - (ii_filter_space - li_filter_space)
*/

end event

protected function integer f_set_usr_profile ();//
integer li_ctrl_Cnt, li_i
string ls_find_string, ls_value, ls_key_name
long  ll_fnd_row


	if ll_fnd_row > 0 then
		li_ctrl_Cnt = upperbound(this.control)
		FOR li_i = 1 to li_ctrl_Cnt
			if this.control[li_i].typeof() =datawindow! then continue
			ls_value = this.control[li_i].className()
			ls_key_name = this.control[li_i].dynamic f_get_parent_w_string()
			ls_find_string = "value = '"+ls_value+"'"
			if ll_fnd_row > 0 then	this.control[li_i].Visible = false
		NEXT
		return 1
	end if
	return 0

end function

public function integer f_set_security ();/* set security của các control  trong window
	return -1: error
			 0: success
*/
string ls_w_name, ls_security_id
integer li_ctrl_Cnt, li_i, li_access_right,li_admin, li_idx_run
datawindow ldw_ctrl
int li_count_menu,  li_idx_tab, li_idx_tabpage
string ls_access_name, ls_access_name_child

//window lw_obj
windowobject lwo_window[], lwo_tabpage[]
userobject luo_obj[]
tab ltb_tmp

ls_w_name = this.classname( )
 
// check user admin ( khong set security)
SELECT count(*) into :li_admin
  FROM erp_role_user
WHERE user_id = :gi_userid and role_id = 1;

// check xem win co dang ky menu ko
select count(*) into :li_count_menu
  from erp_menu
where menu_id = :ls_w_name;

if li_admin > 0 or li_count_menu = 0 then
  return 0
end if  
// nếu ko phải user admin

li_ctrl_Cnt = upperbound(this.control)

FOR li_i = 1 to li_ctrl_Cnt   //FOR-1//
	//--Neu control la zkem bo qua--//
	if this.control[li_i].classname() = 'czkem' then continue     //if-01:endif-01//
	
	//--Neu control la tab--//
	if this.control[li_i].typeof() = tab! then  //if-02//
		ltb_tmp = create tab
		ltb_tmp = this.control[li_i]
		luo_obj = ltb_tmp.control		
		FOR li_idx_tab = 1 to upperbound(luo_obj)	//FOR-2//
			//-- Kiem tra security tabpage: win_name + tabpage accessible name --//
			ls_access_name = ltb_tmp.event dynamic e_get_accessible_name(li_idx_tab)			
			ls_security_id = ls_w_name + '.' + ls_access_name						
			
			SELECT access_right into :li_access_right
			  FROM ERP_USER_SECURITY
			WHERE user_id = :gi_userid
			 	AND company_id = :gi_user_comp_id
				AND security_id = :ls_security_id;			
			if sqlca.sqlcode <> 0 then  //if-03//
				SELECT  nvl(max(access_right),4) into :li_access_right
				  FROM ERP_ROLE_SECURITY
			  	WHERE role_id in (select role_id from erp_role_user where user_id = :gi_userid)
				 	AND company_id = :gi_user_comp_id
				 	AND security_id = :ls_security_id;	
			end if  //endif-03//
			//-- set access right cho tabpage--//
			lwo_tabpage[] = luo_obj[li_idx_tab].control
			if li_access_right = 0 then	//endif-05//
				//-- set invisible cho tat ca cac control cua tabpage--//				
				FOR li_idx_run = 1 to upperbound(lwo_tabpage[])		//FOR-3//
					lwo_tabpage[li_idx_run].visible = false
				NEXT																//endFOR-3//
				luo_obj[li_idx_tab].visible = false
			else
				//--Kiem tra cac control cua tabpage--//
				if luo_obj[li_idx_tab].visible = true then		//if-06//
					FOR li_idx_run = 1 to upperbound(lwo_tabpage[])		//FOR-4//
						If lwo_tabpage[li_idx_run].typeof() = Datawindow! Then		//if-07//
							//-- cac control la dw--//
							ls_security_id = lwo_tabpage[li_idx_run].dynamic f_get_dataobject()
							SELECT access_right into :li_access_right
							  FROM ERP_USER_SECURITY
							WHERE user_id = :gi_userid
								AND company_id = :gi_user_comp_id
								AND security_id = :ls_security_id;			
							if sqlca.sqlcode <> 0 then		//if-08//
								SELECT  nvl(max(access_right),4) into :li_access_right
								  FROM ERP_ROLE_SECURITY
								WHERE role_id in (select role_id from erp_role_user where user_id = :gi_userid)
									AND company_id = :gi_user_comp_id
									AND security_id = :ls_security_id;	
							end if		//endif-08//
							//-- set access right cho datawindow--//
							if li_access_right = 0 then		//if-10//
								lwo_tabpage[li_idx_run].visible = false
							else
								//--Giu nguyen mac dinh khi thiet ke cua DW--//
							end if		//endif-10//
						else
							//-- cac control khac, khong phai la dw--//
							ls_access_name_child = lwo_tabpage[li_idx_run].dynamic f_get_accessible_name()
							ls_security_id = ls_access_name + '.' + ls_access_name_child
							SELECT access_right into :li_access_right
							  FROM ERP_USER_SECURITY
							WHERE user_id = :gi_userid
								AND company_id = :gi_user_comp_id
								AND security_id = :ls_security_id;			
							if sqlca.sqlcode <> 0 then		//if-11//
								SELECT  nvl(max(access_right),4) into :li_access_right
								  FROM ERP_ROLE_SECURITY
								WHERE role_id in (select role_id from erp_role_user where user_id = :gi_userid)
									AND company_id = :gi_user_comp_id
									AND security_id = :ls_security_id;	
							end if		//endif-11//
							//-- set access right cho cac control khac DW--//
							if li_access_right = 0 then		//if-13//
								lwo_tabpage[li_idx_run].visible = false
							else
								//--Giu nguyen mac dinh khi thiet ke cua control--//
							end if			//endif-13//						
						end if		//endif-07//
					NEXT			//endFOR-4//
				else
					//-- Giu nguyen mac dinh khi thiet ke cua tabpage--//
				end if		//endif-06//
			end if			//endif-05//
		NEXT			//endFOR-2//
		//-- Sau khi xu ly xong cac control cua tab tiep tuc thuc hien control khac--//
		continue
	end if  //endif-02//
	
	//--Neu control la DW--/
	if this.control[li_i].typeof() = datawindow! then  //if-14//
		ls_security_id = this.control[li_i].dynamic f_get_dataobject()
		SELECT access_right into :li_access_right
		  FROM ERP_USER_SECURITY
		WHERE user_id = :gi_userid
			AND company_id = :gi_user_comp_id
			AND security_id = :ls_security_id;			
		if sqlca.sqlcode <> 0 then		//if-08//
			SELECT  nvl(max(access_right),4) into :li_access_right
			  FROM ERP_ROLE_SECURITY
			WHERE role_id in (select role_id from erp_role_user where user_id = :gi_userid)
				AND company_id = :gi_user_comp_id
				AND security_id = :ls_security_id;	
		end if		//endif-08//
		//-- set access right cho datawindow--//
		if li_access_right = 0 then		//if-10//
			this.control[li_i].visible = false
		else
			//--Giu nguyen mac dinh khi thiet ke cua DW--//
		end if		//endif-10//		
		continue
	end if  //endif-14//
	
	//--Cac control khac--//
	ls_access_name = this.control[li_i].dynamic f_get_accessible_name()
	ls_security_id = ls_w_name + '.' + ls_access_name	
	SELECT access_right into :li_access_right
	  FROM ERP_USER_SECURITY
	WHERE user_id = :gi_userid
		AND company_id = :gi_user_comp_id
		AND security_id = :ls_security_id;			
	if sqlca.sqlcode <> 0 then		//if-08//
		SELECT  nvl(max(access_right),4) into :li_access_right
		  FROM ERP_ROLE_SECURITY
		WHERE role_id in (select role_id from erp_role_user where user_id = :gi_userid)
			AND company_id = :gi_user_comp_id
			AND security_id = :ls_security_id;	
	end if		//endif-08//
	//-- set access right cho datawindow--//
	if li_access_right = 0 then		//if-10//
		this.control[li_i].visible = false
	else
		//--Giu nguyen mac dinh khi thiet ke cua DW--//
	end if		//endif-10//			
NEXT //endFOR-1//

this.parentwindow().dynamic f_set_security(this.menuid)
return 1

end function

public function powerobject f_get_main_object ();return ic_obj_main
end function

public function integer f_set_dwo ();
c_obj_service				lc_obj_service
t_dw_mpl						ladw_all[] //, ladw_details[], ladw_shared[]
s_str_dwo					lc_s_dwo[]
c_sql							lc_sql
string							las_master_keycol[],las_detail_keycol[], las_empty[], ls_suspend_sql, ls_rtn
long 							ll_cnt
int								li_idx1, li_idx2, li_count, li_dwo_cnt , li_rtn
blob							lbl_empty

li_count = ic_obj_handling.f_get_dwo(lc_s_dwo[])

//-- set dwo --//
FOR li_idx1 = 1 to upperbound(this.control[])
	//-- set dwo cho dw tren window --//
	if this.control[li_idx1].typeof() = datawindow! then
		if this.control[li_idx1].classname() = 'dw_filter' then continue
		FOR li_idx2 = 1 to li_count
			if this.control[li_idx1].classname() = "dw_"+string(li_idx2) then
				li_dwo_cnt++
				ladw_all[li_idx2] = this.control[li_idx1]

				if isvalid(lc_s_dwo[li_idx2].ds_suspend_data) then
					if lc_s_dwo[li_idx2].ds_suspend_data.dataobject <> '' then
						ladw_all[li_idx2].dataobject = lc_s_dwo[li_idx2].ds_suspend_data.dataobject	
						ladw_all[li_idx2].is_focus_colname =''
						ladw_all[li_idx2].f_set_ib_editing(lc_s_dwo[li_idx2].b_suspend_editing )
						ladw_all[li_idx2].f_set_rule_attr(lc_s_dwo[li_idx2].str_suspend_rule_attr )
						ladw_all[li_idx2].f_set_security_attr(lc_s_dwo[li_idx2].str_suspend_security_attr )
						ladw_all[li_idx2].is_originalwhereClause = lc_s_dwo[li_idx2].s_suspend_originalwhere
						ladw_all[li_idx2].is_originalSQL_NoWhere = lc_s_dwo[li_idx2].s_suspend_sqlnowhere
						ladw_all[li_idx2].is_where_query_mode=lc_s_dwo[li_idx2].s_where_query_mode //lay ra where tìm kiếm đã được cất
						ladw_all[li_idx2].inv_querymode = lc_s_dwo[li_idx2].c_suspend_querymode
						ladw_all[li_idx2].inv_sort = lc_s_dwo[li_idx2].c_suspend_sort
						ls_suspend_sql = lc_s_dwo[li_idx2].s_suspend_sqlnowhere
						if ls_suspend_sql <> '' then	
							lc_sql.f_addtowhereclause(ls_suspend_sql, lc_s_dwo[li_idx2].s_suspend_where, ' AND ')
							ls_rtn = ladw_all[li_idx2].modify("Datawindow.Table.Select =~'"+ls_suspend_sql+"~'")
						end if
						//-- restore data --//
						lc_s_dwo[li_idx2].ds_suspend_data.rowscopy( 1, lc_s_dwo[li_idx2].ds_suspend_data.rowcount( ) , primary!, ladw_all[li_idx2], 1, primary!)
//						lc_s_dwo[li_idx2].ds_suspend_data.rowscopy( 1, lc_s_dwo[li_idx2].ds_suspend_data.filteredcount( ) , filter!, ladw_all[li_idx2], 1, filter!)
						ladw_all[li_idx2].resetupdate( )
						ladw_all[li_idx2].setredraw( true)
						//-- xoa datastore --//
						lc_s_dwo[li_idx2].ds_suspend_data.dataobject = '' 
						lc_s_dwo[li_idx2].s_suspend_sqlnowhere = ''
						lc_s_dwo[li_idx2].s_suspend_where =''					
					else
						if li_idx2 = 1 then
							ladw_all[li_idx2].dataobject = ic_obj_handling.f_get_main_dwo()
						else
							ladw_all[li_idx2].dataobject = lc_s_dwo[li_idx2].s_dwo_default
							ladw_all[li_idx2].title =  lc_s_dwo[li_idx2].s_description
						end if				
						//-- set full security --//
						g_user.i_rule.f_set_policy_dwctrl_ex(ic_obj_handling , ladw_all[li_idx2])					
					end if
				else
					if li_idx2 = 1 then
						ladw_all[li_idx2].dataobject = ic_obj_handling.f_get_main_dwo()
					else
						ladw_all[li_idx2].dataobject = lc_s_dwo[li_idx2].s_dwo_default
						ladw_all[li_idx2].title =  lc_s_dwo[li_idx2].s_description
					end if					
					ladw_all[li_idx2].is_focus_colname =''
					//-- set full security --//
					g_user.i_rule.f_set_policy_dwctrl_ex(ic_obj_handling , ladw_all[li_idx2])			
				end if

				//-- set transaction --//
				ladw_all[li_idx2].settransobject( it_transaction)
				ladw_all[li_idx2].f_set_scrollbar( )				
				ladw_all[li_idx2].f_set_dwo_grid(lc_s_dwo[li_idx2].s_dwo_grid)
				ladw_all[li_idx2].f_set_dwo_form(lc_s_dwo[li_idx2].s_dwo_form)				
				//-- set navigation --//
				if lc_s_dwo[li_idx2].s_dwo_form <> '' and lc_s_dwo[li_idx2].s_dwo_grid <> '' then
					ladw_all[li_idx2].f_set_ib_grid_n_form(true)
					ladw_all[li_idx2].f_create_navigate_bttn()
				elseif   lc_s_dwo[li_idx2].s_dwo_form = '' then
					ladw_all[li_idx2].f_set_ib_grid_n_form(false)
					ladw_all[li_idx2].f_create_navigate_bttn()					
				end if
				
				
				//-- set các biến instance --//
				ladw_all[li_idx2].f_set_ib_detail( lc_s_dwo[li_idx2].b_detail )
				ladw_all[li_idx2].f_set_ib_master( lc_s_dwo[li_idx2].b_master )
				ladw_all[li_idx2].f_set_ib_shared( lc_s_dwo[li_idx2].b_shared )
				ladw_all[li_idx2].f_set_ib_cascade_del( lc_s_dwo[li_idx2].b_cascade_del )
				ladw_all[li_idx2].f_set_ib_ref_table_yn( lc_s_dwo[li_idx2].b_ref_table_yn )
				ladw_all[li_idx2].f_set_ref_table_field( lc_s_dwo[li_idx2].s_ref_table_field )
				ladw_all[li_idx2].f_set_ib_insert( lc_s_dwo[li_idx2].b_insert )
				ladw_all[li_idx2].f_set_ib_delete( lc_s_dwo[li_idx2].b_delete )
				ladw_all[li_idx2].f_set_ib_update( lc_s_dwo[li_idx2].b_update )
				ladw_all[li_idx2].f_set_ib_query( lc_s_dwo[li_idx2].b_query )
				ladw_all[li_idx2].f_set_ib_print( lc_s_dwo[li_idx2].b_print )
				ladw_all[li_idx2].f_set_ib_excel( lc_s_dwo[li_idx2].b_excel )
				ladw_all[li_idx2].f_set_ib_traceable( lc_s_dwo[li_idx2].b_traceable )
				ladw_all[li_idx2].ib_drag = lc_s_dwo[li_idx2].b_drag
				ladw_all[li_idx2].ib_keynull = lc_s_dwo[li_idx2].b_keynull
				ladw_all[li_idx2].f_set_ib_focus_master( lc_s_dwo[li_idx2].b_focus_master )
				ladw_all[li_idx2].f_set_ib_dummy_row_yn( lc_s_dwo[li_idx2].b_dummy_row_yn )
				ladw_all[li_idx2].f_set_ib_relation_1_1(lc_s_dwo[li_idx2].b_relation_1_1 )
				ladw_all[li_idx2].f_set_ib_keyboardlocked( lc_s_dwo[li_idx2].b_keyboardlocked )
				ladw_all[li_idx2].is_popmenu += lc_s_dwo[li_idx2].s_popmenu_items
				ladw_all[li_idx2].is_dwo_source = lc_s_dwo[li_idx2].s_dwo_source
				ladw_all[li_idx2].is_col_source = lc_s_dwo[li_idx2].s_col_source
				ladw_all[li_idx2].is_col_target = lc_s_dwo[li_idx2].s_col_target
				
				//-- set dw propeties --//
				ladw_all[li_idx2].dynamic f_set_properties()	
				//-- set sort --//
				ladw_all[li_idx2].inv_sort.f_setrequestor(ladw_all[li_idx2])
				ladw_all[li_idx2].inv_sort.f_init( )				
				//-- ghi nhớ để set master-detail --//
				if lc_s_dwo[li_idx2].b_master and lc_s_dwo[li_idx2].s_dwo_details <> '' then
					iastr_dw_md[upperbound(iastr_dw_md[]) + 1].dw_master = ladw_all[li_idx2]
					iastr_dw_md[upperbound(iastr_dw_md[])].s_dwo_detail=  lc_s_dwo[li_idx2].s_dwo_details
				end if
				//-- ghi nhớ để set master-shared --//
				if lc_s_dwo[li_idx2].b_master and lc_s_dwo[li_idx2].s_dwo_shared <> '' then
					iastr_dw_ms[upperbound(iastr_dw_ms[]) + 1].dw_master = ladw_all[li_idx2]
					iastr_dw_ms[upperbound(iastr_dw_ms[])].s_dwo_shared = lc_s_dwo[li_idx2].s_dwo_shared
				end if				
				//-- ghi nho dwdetail --//
				las_master_keycol[] = las_empty[]
				las_detail_keycol[] = las_empty[]
				if lc_s_dwo[li_idx2].b_detail then
					iwdw_detail[upperbound(iwdw_detail[])+1] =  ladw_all[li_idx2]
					lc_obj_service.f_stringtoarray( lc_s_dwo[li_idx2].s_master_keycol , ';', las_master_keycol[])
					ladw_all[li_idx2].f_set_master_keycol(las_master_keycol[])
					lc_obj_service.f_stringtoarray( lc_s_dwo[li_idx2].s_detail_keycol , ';', las_detail_keycol[])
					ladw_all[li_idx2].f_set_detail_keycol(las_detail_keycol[])
				end if
				//-- ghi nho dwshared --//
				if lc_s_dwo[li_idx2].b_shared then
					iwdw_share[upperbound(iwdw_share[])+1] =  ladw_all[li_idx2]
				end if	
				//--ghi nhớ dw không master không detail--//
				if not lc_s_dwo[li_idx2].b_master and not lc_s_dwo[li_idx2].b_detail  and not lc_s_dwo[li_idx2].b_shared  then
					iadw_none_md[upperbound(iadw_none_md[]) + 1] = ladw_all[li_idx2]
				end if
				//-- set dwfocus --//
				if li_idx2 = 1 then				
					idw_focus =  ladw_all[li_idx2]
				end if						
				exit
			end if
		NEXT
	elseif this.control[li_idx1].typeof() = groupbox! then
		this.f_set_groupbox_text( this.control[li_idx1], lc_s_dwo[])
	end if
NEXT	


return 1
end function

public function datawindow f_get_idwfocus ();return this.idw_focus
end function

public function datawindow f_get_dwmain ();datawindow l_dw

return l_dw

end function

public function integer f_get_transaction (ref transaction rt_transaction);rt_transaction = it_transaction
return 1
end function

public subroutine f_set_idwfocus (ref datawindow vdw_focus);this.idw_focus = vdw_focus
end subroutine

public function tab f_get_tab_action ();
return this.tab_action
end function

public function integer f_get_dw_actionpane (string vs_dwo_actionpane, ref datawindow rdw_actionpane);datawindow			ldw_actionpane
int							li_idx, li_tabpagecount

li_tabpagecount = upperbound(tab_action.control[])

FOR li_idx = 1 to li_tabpagecount
	ldw_actionpane = tab_action.control[li_idx].control[1]
	if ldw_actionpane.dataobject = vs_dwo_actionpane then
		rdw_actionpane = ldw_actionpane
		return 1
	end if
NEXT

return -1


end function

public function datawindow f_get_active_dwactionpane ();
datawindow l_dw
return l_dw
return tab_action.control[tab_Action.selectedtab].control[1]

end function

public function boolean f_is_filter_on ();return ib_filter_on
end function

public function integer f_filter_dwmain ();s_str_dwo_tabpage	lstr_dwo_tab[]

t_dw_mpl			ldw_main
string					ls_filterstring
double				ldb_ID
long					ll_currentrow, ll_originalrow

ls_filterstring = dw_filter.f_get_filterstring( )
if isnull(ls_filterstring) or ls_filterstring = '' then
	ic_obj_handling.is_dwmain_filter = ''
	return 0
end if
if ic_obj_handling.classname( ) = 'u_valueset' then
	ic_obj_handling.f_get_dwo_tabpage( lstr_dwo_tab[])
	ldw_main = this.f_get_dw( lstr_dwo_tab[1].str_dwo[1].s_dwo_default)
	if isnull(ldw_main) then
		ldw_main = this.f_get_dwmain( )
	end if
else
	ldw_main = this.f_get_dwmain( )
end if
if isvalid(ldw_main) then
	ll_originalrow = ldw_main.getrow()
	if ll_originalrow > 0 then
		if ldw_main.describe( "ID.coltype") <> '!' then	ldb_ID = ldw_main.getitemnumber( ll_originalrow, 'ID')
	end if
	ldw_main.setfilter(ls_filterstring )
	ldw_main.filter( )
	ldw_main.f_set_gutter_rowcount( )
	if ldb_ID > 0 then
		ll_currentrow = ldw_main.find( "ID = "+string(ldb_ID), 1, ldw_main.rowcount())
		if ll_currentrow = 0 then ll_currentrow = 1
		ldw_main.scrolltorow( ll_currentrow)
		// truong hop copy from thi khong filter_detail
		if not ic_obj_handling.ib_copying then
			if ll_currentrow = 1 and ll_originalrow = 1 then
				ldw_main.f_filter_detail( )
				ic_obj_handling.f_ctrl_actionbuttons(ldw_main)
				this.triggerevent( "e_display_actionbutton" )
			end if
		end if
	end if
	if ls_filterstring <> '' then		
		dw_filter.setitem( 1, 'gutter', 'Y')
	else
		dw_filter.setitem( 1, 'gutter', 'N')
	end if
end if

ic_obj_handling.is_dwmain_filter = ls_filterstring

return 0
end function

public function integer f_get_filter_header ();return ii_dwfilter_header
end function

public function integer f_create_tabpage (ref t_t rt_detail);int		li_tabpageCnt
s_str_dwo_tabpage		lstr_dwo_tabpage[]

li_tabpageCnt = ic_obj_handling.dynamic f_get_dwo_tabpage(lstr_dwo_tabpage[])


return li_tabpageCnt
end function

public function integer f_display_ctrl (string vs_display_model);/*************************************************************
* Objekt : s_w_main
* Methode: f_display_ctrl (Function)
* Autor  : X230
* Datum  : 19.10.2013
*
* Argument(e):	string vs_display_model
* Return: integer
*
*
*
*
*
*************************************************************
* Modifikationen:
* Datum    Version        Autor              Kommentar
*------------------------------------------------------------
*
*************************************************************/

int								li_rtn, li_idx

datawindow					ldw[]
groupbox						lgb[]
button						lbttn[]
t_t								ltab[]

FOR li_idx = 1 to upperbound(this.control)
	
NEXT
choose case vs_display_model
	case 'up_1d_2d_lo_tb'
	case 'up_1d_lo_tb'
	case 'up_1d_lo_tb'
	case 'up_1d_lo_tb'
	case 'up_1d_lo_tb'
	case '2d'
	case '1d'
end choose
return li_rtn
end function

public function integer f_arrange_dwdetail (datawindow vdw_detail[]);int			li_idx1, li_idx2, li_masterCount, li_detailCount
string		ls_dwo_detail
c_string	lc_string

li_masterCount = upperbound(iastr_dw_md[])
if li_masterCount = 1 then
	
	if upperbound(iastr_dw_md[1].dw_details[] ) = 0 then
		iastr_dw_md[1].dw_details[] = vdw_detail[]
	else
		li_detailCount = upperbound(vdw_detail[])
		FOR li_idx1 = 1 to li_detailCount
			iastr_dw_md[1].dw_details[li_detailCount + li_idx1] = vdw_detail[li_idx1]
		NEXT
	end if	
else
	FOR li_idx1 = 1 to li_masterCount
		FOR li_idx2 = 1 to upperbound(vdw_detail[])
			iastr_dw_md[li_idx1].s_dwo_detail = lc_string.f_globalreplace(iastr_dw_md[li_idx1].s_dwo_detail, ' ', '')
			if right(iastr_dw_md[li_idx1].s_dwo_detail,1) <> ';' then iastr_dw_md[li_idx1].s_dwo_detail += ';'
			if pos(iastr_dw_md[li_idx1].s_dwo_detail, vdw_detail[li_idx2].dataobject+';') > 0 then
				iastr_dw_md[li_idx1].dw_details[upperbound(iastr_dw_md[li_idx1].dw_details[])+1] = vdw_detail[li_idx2]
			end if
		NEXT
	NEXT
end if
return li_masterCount
end function

public function integer f_arrage_dwshared (datawindow vdw_shared[]);int			li_idx1, li_idx2, li_masterCount, li_shareCount
string		ls_dwo_detail

li_masterCount = upperbound(iastr_dw_ms[])
if li_masterCount = 1 then
	if upperbound(iastr_dw_ms[1].dw_shared[] ) = 0 then
		iastr_dw_ms[1].dw_shared[] = vdw_shared[]
	else
		li_shareCount = upperbound(vdw_shared[])
		FOR li_idx1 = 1 to li_shareCount
			iastr_dw_ms[1].dw_shared[li_shareCount + li_idx1] = vdw_shared[li_idx1]
		NEXT
	end if
else
	FOR li_idx1 = 1 to li_masterCount
		FOR li_idx2 = 1 to upperbound(vdw_shared[])
			if pos(iastr_dw_ms[li_idx1].s_dwo_shared, vdw_shared[li_idx2].dataobject+';') > 0 then
				iastr_dw_ms[li_idx1].dw_shared[upperbound(iastr_dw_ms[li_idx1].dw_shared[])+1] = vdw_shared[li_idx2]
			end if
		NEXT
	NEXT
end if
return li_masterCount
end function

public function integer f_set_md_ms ();int		li_idx

FOR li_idx = 1 to upperbound(iastr_dw_md[])
	iastr_dw_md[li_idx].dw_master.dynamic f_set_dwmaster(iastr_dw_md[li_idx].dw_details[])
NEXT
FOR li_idx = 1 to upperbound(iastr_dw_ms[])
	iastr_dw_ms[li_idx].dw_master.dynamic f_set_dwshare(iastr_dw_ms[li_idx].dw_shared[])
NEXT
return 0
end function

public function tab f_get_tab_1 ();tab		l_tab

return l_tab
end function

public function integer f_get_dw_md_structure (ref s_str_dw_md rastr_dw_md[]);rastr_dw_md[] = iastr_dw_md[]
return upperbound(rastr_dw_md[] )
end function

public function integer f_get_dw_ms_structure (ref s_str_dw_ms rastr_dw_ms[]);rastr_dw_ms[] = iastr_dw_ms[]
return upperbound(rastr_dw_ms[] )
end function

public function integer f_set_dw_ms_structure (s_str_dw_ms vastr_dw_ms[]);iastr_dw_ms[] = vastr_dw_ms[] 
return upperbound(vastr_dw_ms[] )
end function

public function integer f_set_dw_md_structure (s_str_dw_md vastr_dw_md[]);iastr_dw_md[] = vastr_dw_md[] 
return upperbound(vastr_dw_md[] )
end function

public function boolean f_get_ib_opening ();return ib_opening
end function

public function boolean f_get_ib_dwmain_resetting ();return ib_dwmain_resetting
end function

public function integer f_suspend_dw ();
int					li_idx, li_cnt
t_t					l_tab
t_dw				ldw_tmp,ladw_empty[]
datawindow		ladw_shared[],ladw_detail[]

FOR li_idx = 1 to upperbound(this.control[])
	//-- tìm và cất  dw--//
	if this.control[li_idx].typeof() = datawindow! then
		if this.control[li_idx].classname() <> 'dw_filter' then
			ldw_tmp =  this.control[li_idx]
			if ldw_tmp.dataobject <> '' then
				if upper(left(ic_obj_handling.classname( ),3)) <> 'UR_' then
					ic_obj_handling.f_set_suspend_data(ldw_tmp)
				else
					ic_obj_handling.f_set_suspend_report(ldw_tmp)
				end if
				setnull(ldw_tmp.is_originalSQL_NoWhere)
				setnull(ldw_tmp.is_originalwhereClause)
				setnull(ldw_tmp.is_currentwhere)
				ldw_tmp.is_where_query_mode=''
				ldw_tmp.dataobject = ''
				li_cnt = ldw_tmp.dynamic f_getdwdetails(ladw_detail)
				if li_cnt > 0 then ldw_tmp.dynamic f_set_dwmaster(ladw_empty[])
				li_cnt = ldw_tmp.dynamic f_getdwshared(ladw_shared)
				if li_cnt > 0 then ldw_tmp.dynamic f_set_dwshare(ladw_empty[])
			end if
		end if
	elseif this.control[li_idx].typeof() = tab! then
		l_tab = this.control[li_idx]
		if l_tab.classname() = 'tab_1' then
			l_tab.dynamic event e_suspend_dw()
		end if
	end if
NEXT	

return 1
end function

public subroutine f_set_invisible_ctrl ();
end subroutine

public subroutine f_set_visible_ctrl (string vs_display_model);
end subroutine

public function integer f_resize (string vs_display_model);
st_1.move( tab_action.x, tab_action.y + tab_action.height)
st_1.width = pixelstoUnits(scr_width, XPixelsToUnits!) - ii_Vscrollbar
st_1.height = ii_text_spaceheight

choose case vs_display_model
	case '2ddlb_1tv_up1d1d_mid1d1d_lo1d'
		ii_spare_space = 110
		this.dynamic f_resize_2ddlb_1tv_up1d1d_mid1d1d_lo1d()
	case '1tv_up1d1d_mid1d1d_lo1d'
		this.dynamic f_resize_1tv_up1d1d_mid1d1d_lo1d()
	case '1tv_up1d_1d_lo1d'
		this.dynamic f_resize_1tv_up1d_1d_lo1d()
	case '1tv_up1d_1d_lo2d'
		this.dynamic f_resize_1tv_up1d_1d_lo2d()
	case '1tv_up1d_mid1d_lo1d1d'
		this.dynamic f_resize_1tv_up1d_mid1d_lo1d1d()
	case 'up_1d_lo_1d_gb2d'
		this.dynamic f_resize_up_1d_lo_1d_gb2d()
	case '3d'
		this.dynamic f_resize_3d()
	case '1d_1dup_2d'
		this.dynamic f_resize_1d_1dup_2d()
	case '1d_2d'
		this.dynamic f_resize_1d_2d()
	case '1d_1df_1df'
		this.dynamic f_resize_1d_1df_1df()		
	case 'up_1d_lo_2d'
		this.dynamic f_resize_up_1d_lo_2d()
	case '1d_1d'
		this.dynamic f_resize_1d_1d()		
	case '1d_3d'
		this.dynamic f_resize_1d_3d()
	case '1dg_2gb_2df'
		this.dynamic f_resize_1dg_2gb_2df()
	case '2d'
		this.dynamic f_resize_2d()
	case '3d_rb'
		this.dynamic f_resize_3d_rb()		
	case '1ddlb_1d_1tp'
		ii_spare_space = 110
		this.dynamic f_resize_1ddlb_1d_1tp()
	case '1ddlb_1d'
		ii_spare_space = 110
		this.dynamic f_resize_1ddlb_1d()				
	case '1ddlb_2d_1tp'
		ii_spare_space = 110
		this.dynamic f_resize_1ddlb_2d_1tp()
	case '1d'
		this.dynamic f_resize_1d()
	case 'up_1tv_fx3dfx_lo_tb'
		this.dynamic f_resize_up_1tv_fx3dfx_lo_tb()
	case 'up_gp_1d2d1tv_lo_tb'
		this.dynamic f_resize_up_gp_1d2d1tv_lo_tb()
	case 'up_gp_1d3d1tv_lo_tb' 
		this.dynamic f_resize_up_gp_1d3d1tv_lo_tb()
	case 'up_gp_2d1tv_lo_tb'
		this.dynamic f_resize_up_gp_2d1tv_lo_tb()
	case 'up_gp_2d_lo_tb'
		this.dynamic f_resize_up_gp_2d_lo_tb()
	case  'up_1d_1d_lo_tb'
		this.dynamic f_resize_up_1d_1d_lo_tb()
	case  'up_1d_4d_lo_tb'
		this.dynamic f_resize_up_1d_4d_lo_tb()
	case 'up_1d_3d_lo_tb'
		this.dynamic f_resize_up_1d_3d_lo_tb()
	case 'up_1d_2d_lo_tb'
		this.dynamic f_resize_up_1d_2d_lo_tb()
	case 'up_2d1d_lo_1tb'
		this.dynamic f_resize_up_2d1d_lo_1tb()		
	case 'up_1d_lo_tb'
		this.dynamic f_resize_up_1d_lo_tb()
	case '1tv_2d'
		this.dynamic f_resize_1tv_2d()
	case '2ddlb_2d'
		ii_spare_space = 110
		this.dynamic f_resize_2ddlb_2d()
	case '3dgb'
		this.dynamic f_resize_3dgb()
	case '4dgb'
		this.dynamic f_resize_4dgb()
	case '4dgb_1tp'
		this.dynamic f_resize_4dgb_1tp()
	case '5dgb_1tp'
		this.dynamic f_resize_5dgb_1tp()
	case '5dgb_1tp_1dh'
		this.dynamic f_resize_5dgb_1tp_1dh()
	case '2dgb_1tp'
		this.dynamic f_resize_2dgb_1tp()
	case '2dgb_1tp_tax'
		this.dynamic f_resize_2dgb_1tp_tax()
	case '2dgb_1tp_tax_2d'
		this.dynamic f_resize_2dgb_1tp_tax_2d()
	case '5dgb'
		this.dynamic f_resize_5dgb()
	case '6dgb'
		this.dynamic f_resize_6dgb()
	case '6dgb_ext'
		this.dynamic f_resize_6dgb_ext()
	case 'up_1d_lo_1d_1d'
		this.dynamic f_resize_up_1d_lo_1d_1d()
	case '3d_1tp'
		this.dynamic f_resize_3d_1tp()	
	case 'tb'
	case '1tb'
		this.dynamic f_resize_1tp()	
	case '2d'
		this.dynamic f_resize_2d()	
	case '1dr_1tb_2gb_1ddlb_1dl'
		this.dynamic f_resize_1dr_1tb_2gb_1ddlb_1dl()
	case '2dgb_1pc_1tp'
		this.dynamic f_resize_2dgb_1pc_1tp()
	case '2d_3rb'
		this.dynamic f_resize_2d_3rb()
end choose
this.setredraw( true)
return 1
end function

public subroutine f_set_st_1_text (string vs_text, string vs_dwo_name);
end subroutine

public function integer f_build_data_related (ref s_str_dwo_related rstr_data_related[]);//-- Lay du lieu cua dwo lien quan --//

c_string					lc_string
datawindow				ldw_related
c_dwservice				lc_dwsr
int							li_idx, li_objCount, li_colCount, li_col
long						ll_row
string						las_main_obj_column[], las_relatedtext_column[], ls_text, ls_null, ls_coltype, ls_data
boolean					lb_notseleted

li_objCount =upperbound(rstr_data_related[])
FOR li_idx = 1 to li_objCount
	if upperbound(rstr_data_related[li_idx].s_data[]) > 0 then continue
	ldw_related = this.f_get_dw(rstr_data_related[li_idx].s_main_obj_dwo)	
	if isnull(ldw_related) or not isvalid(ldw_related) then 
		if rstr_data_related[li_idx].s_related_obj_name <> 'u_valueset' then
			// khai báo tên dw trong struct sai hoặc nhầm giữa đối tượng main và related
			messagebox('Lỗi','s_w_main.fbuild_data_related(line:16)')
		end if
		continue
	end if
	if ldw_related.rowcount() > 0 then
		//-- build datalink --//
		li_colCount = lc_string.f_stringtoarray(rstr_data_related[li_idx].s_main_obj_column , ';', las_main_obj_column[]) 
		FOR li_col = 1 to li_colCount
			ls_coltype = ldw_related.describe( las_main_obj_column[li_col]+ '.coltype' )
			if ldw_related.dynamic f_isgrid() then
				lb_notseleted = true
				ll_row = ldw_related.find( "gutter = 'Y' ", 1, ldw_related.rowcount( ))
				//-- nếu đối tượng là b_view thì kiểm tra in nhiều phiếu 1 lúc --//
				if ll_row > 0 and rstr_data_related[li_idx].s_related_obj_name = 'b_view'then
					if upperbound(rstr_data_related[li_idx].s_main_obj_column_chk[]) > 0 then
						if not lc_dwsr.f_is_object_col_check(rstr_data_related[li_idx].s_main_obj_column_chk[li_idx] , ldw_related) then return -1
					end if
				end if
				DO while ll_row > 0
					lb_notseleted = false
					if upperbound(rstr_data_related[li_idx].s_data[]) = li_col then							
						if rstr_data_related[li_idx].s_data[li_col] <> '' then rstr_data_related[li_idx].s_data[li_col] += ','
					end if
					rstr_data_related[li_idx].s_data[li_col] += string(ldw_related.dynamic f_getitemany(ll_row, las_main_obj_column[li_col]))		
					ll_row = ldw_related.find( "gutter = 'Y' ", ll_row+1, ldw_related.rowcount( ) + 1)
				LOOP

				if lb_notseleted then
					if isnull(rstr_data_related[li_idx].s_criteria_type) or rstr_data_related[li_idx].s_criteria_type <> 'fixed' then
						if upperbound(rstr_data_related[li_idx].s_data[]) = li_col then							
							if rstr_data_related[li_idx].s_data[li_col] <> '' then rstr_data_related[li_idx].s_data[li_col] += ','
						end if			
						if ldw_related.getrow( ) > 0 then
							ls_data = string(ldw_related.dynamic f_getitemany(ldw_related.getrow( ) , las_main_obj_column[li_col]))	
							if isnull(ls_data) then ls_data = '()'
							rstr_data_related[li_idx].s_data[li_col] += ls_data
							//-- tạm đổi: khoá 2 dòng dưới 11/12/2019 --//
//							rstr_data_related[li_idx].s_data[li_col] += string(ldw_related.dynamic f_getitemany(ldw_related.getrow( ) , las_main_obj_column[li_col]))			
//							if isnull(rstr_data_related[li_idx].s_data[li_col]) then rstr_data_related[li_idx].s_data[li_col] ='()'
						end if
					end if
				end if
			else
				if  isnull(rstr_data_related[li_idx].s_criteria_type) or rstr_data_related[li_idx].s_criteria_type <> 'fixed' then //-- trường hợp valueset --//
					if upperbound(rstr_data_related[li_idx].s_data[]) = li_col then							
						if rstr_data_related[li_idx].s_data[li_col] <> '' then rstr_data_related[li_idx].s_data[li_col] += ';'
					end if
					if ldw_related.getrow( ) > 0 then 
						if ldw_related.dataobject = 'd_struct_popup_form' and las_main_obj_column[li_col] = 'value_id' then
							if ldw_related.getitemstring(ldw_related.getrow( ) , rstr_data_related[li_idx].s_uprow_column) = 'Y' and  ldw_related.getrow( ) > 1 then
								rstr_data_related[li_idx].s_data[li_col] += string(ldw_related.dynamic f_getitemany(ldw_related.getrow( ) - 1 , las_main_obj_column[li_col]))
							else
								setnull(ls_null)
								rstr_data_related[li_idx].s_data[li_col] = ls_null
							end if								
						else							
							rstr_data_related[li_idx].s_data[li_col] += string(ldw_related.dynamic f_getitemany(ldw_related.getrow( ) , las_main_obj_column[li_col]))
						end if
					end if
				end if
			end if
			//-- điều chỉnh lại dữ liệu để phù hợp với buildwhere --//
			if pos(rstr_data_related[li_idx].s_data[li_col], ',') > 0 then
				if rstr_data_related[li_idx].s_related_obj_name = 'b_view' then rstr_data_related[li_idx].s_data[li_col] = lc_string.f_globalreplace( rstr_data_related[li_idx].s_data[li_col], ',', ';')
				rstr_data_related[li_idx].s_data[li_col] = '(' + rstr_data_related[li_idx].s_data[li_col] + ')'
			elseif isnull(rstr_data_related[li_idx].s_data[li_col]) then
				rstr_data_related[li_idx].s_data[li_col] ='()'
			elseif left(ls_coltype,4) = 'char' then
				rstr_data_related[li_idx].s_data[li_col] = '=' + rstr_data_related[li_idx].s_data[li_col]
			end if			
		NEXT
		//-- build text --//			
		li_colCount = lc_string.f_stringtoarray(rstr_data_related[li_idx].s_relatedtext_column , ';', las_relatedtext_column[]) 	
		rstr_data_related[li_idx].s_text = lc_string.f_getfirsttoken(rstr_data_related[li_idx].s_text , ':')
		rstr_data_related[li_idx].s_text += ':'
		FOR li_col = 1 to li_colCount
			if li_col > 1 then rstr_data_related[li_idx].s_text += ' - '
			ls_text =  string(ldw_related.dynamic f_getitemany(ldw_related.getrow( ), las_relatedtext_column[li_col]))
			if isnull(ls_text) then ls_text = ''
			rstr_data_related[li_idx].s_text += ls_text
		NEXT			
	else
		return 0
	end if
NEXT

return upperbound(rstr_data_related)
end function

public function integer f_set_dw_properties ();int							li_idx
datawindow				ldw_handling

FOR li_idx = 1 to upperbound(this.control[])
	//-- set dwo cho dw tren window --//
	if this.control[li_idx].typeof() = datawindow! then
		if this.control[li_idx].classname() = 'dw_filter' then continue
		ldw_handling =  this.control[li_idx]
		if ldw_handling.dataobject = '' then continue
		ldw_handling.dynamic f_set_properties()
		ldw_handling.dynamic f_set_editable_property(false)
	end if
NEXT
return 1
end function

public function integer f_set_record_security ();t_dw_mpl	ldw_main,ladw_detail[],ldw_master
int				li_rtn,li_idx,li_count


ldw_main = this.f_get_dwmain( )
ldw_main.f_set_rec_security( )
li_count = ldw_main.f_getdwdetails( ladw_detail)
for li_idx = 1 to li_count
	li_rtn = this.f_set_record_security(ladw_detail[li_idx] )
next
//--set record cho các dw none md(thường là báo cáo)--//
for li_idx = 1 to upperbound(iadw_none_md[])
	ldw_master = this.f_get_dw( iadw_none_md[li_idx].dataobject)
	if isvalid(ldw_master) then
		ldw_master.f_set_rec_security( )
	end if
next
return 1
end function

public subroutine f_set_visible_st_1 (boolean vb_visible);
end subroutine

public subroutine f_set_text_cbx_1 (string vs_text, boolean vb_checked);
end subroutine

public subroutine f_set_text_cbx_2 (string vs_text, boolean vb_checked);
end subroutine

public function powerobject f_create_flex_object (datastore vds_dwsetup, string vs_objname);string						ls_objname_of_valuset
string						ls_history_related_col,ls_history_main_col,ls_history_obj_ref_code
s_object_display		lpo_flex
s_str_dwo_related		lstr_data_related[]
s_str_dwo				lstr_dwo[]
s_str_dwo_tabpage	lstr_dwo_tab[]

//-- Khởi tạo valueset/struct object --//
lpo_flex = create using vs_objname

//-- Khởi tạo data related structure --//
lpo_flex.dynamic f_set_main_object(ic_obj_handling)
ic_obj_handling.f_get_data_related(vds_dwsetup,lstr_data_related[],lpo_flex)

//-- init lai idwsetup_initial --//
if vs_objname = 'u_valueset' then
	ls_objname_of_valuset = vds_dwsetup.getitemstring(1, 'OBJECT_REF_NAME')
	if isnull(ls_objname_of_valuset) or ls_objname_of_valuset = '' then
		gf_messagebox('m.s_w_main.f_create_flex_object.01','Thông báo','Bảng giá trị chưa có đối tượng','exclamation','ok',1)
		setnull(lpo_flex)
		return lpo_flex
	end if
	lpo_flex.idwsetup_initial.f_init_ids_setup_dw_ex(ls_objname_of_valuset )
end if

//-- build data related --//
this.f_build_data_related( lstr_data_related[]) 
if upperbound(lstr_data_related[1].s_data[]) = 0 and vs_objname <> 'u_valueset' then lstr_data_related[1].s_data[1] = '1=1'
lpo_flex.dynamic f_set_data_related(lstr_data_related[])

//-- set dwobject cho dwveluset --//
lpo_flex.dynamic f_get_dwo(lstr_dwo[])
lstr_dwo[1].s_dwo_default = lstr_data_related[1].s_related_obj_dwo 
lpo_flex.dynamic f_set_dwo_structure(lstr_dwo[])

//-- kiểm tra có truy lượt sử đối tượng không --//
ls_history_obj_ref_code = vds_dwsetup.getitemstring(1, 'history_obj_ref_code')
if not isnull(ls_history_obj_ref_code) and len(ls_history_obj_ref_code) > 0 then
	ls_history_related_col = vds_dwsetup.getitemstring(1, 'history_related_col')
	ls_history_main_col = vds_dwsetup.getitemstring(1, 'history_main_col')
	
	lpo_flex.dynamic f_set_is_display_model('1tb')
	
	//-- set dwobject của tabpage--//
	lpo_flex.dynamic f_get_dwo_tabpage(lstr_dwo_tab[])
	lstr_dwo_tab[1].str_dwo[1].s_dwo_default =  lstr_data_related[1].s_related_obj_dwo
	lstr_dwo_tab[1].str_dwo[1].b_master = true
	lstr_dwo_tab[1].str_dwo[1].s_dwo_details = ls_history_obj_ref_code
	lstr_dwo_tab[1].b_fulltab = true
	
	lstr_dwo_tab[2].str_dwo[1].s_dwo_default = ls_history_obj_ref_code
	lstr_dwo_tab[2].str_dwo[1].b_detail = true
	lstr_dwo_tab[2].str_dwo[1].s_dwo_master = lstr_data_related[1].s_related_obj_dwo
	lstr_dwo_tab[2].str_dwo[1].s_master_keycol = ls_history_main_col
	lstr_dwo_tab[2].str_dwo[1].s_detail_keycol = ls_history_related_col
	lpo_flex.dynamic f_set_dwo_structure_tabpage( lstr_dwo_tab[])
else
	
end if



return lpo_flex
end function

public subroutine f_set_groupbox_text (groupbox vgb_handle, s_str_dwo rstr_dwo[]);
int			li_idx
string		ls_text
FOR li_idx = 1 to upperbound(rstr_dwo[])
	if vgb_handle.classname( ) = rstr_dwo[li_idx].s_gb_name then
		ls_text = t_w_mdi.ids_lang_text.f_get_lang_text(rstr_dwo[li_idx].s_dwo_default )
		if ls_text = '' then
			ls_text = '[' +  rstr_dwo[li_idx].s_description +']'	
		end if
		vgb_handle.text =ls_text
		return 
	end if
NEXT
end subroutine

public function groupbox f_get_groupbox (string vs_gb_name);groupbox   l_gb

return l_gb
end function

public subroutine f_set_resize_parm ();
end subroutine

public function boolean f_get_ib_doc_trace_on ();return ib_doc_trace_on
end function

public subroutine f_set_iwdw_detail (datawindow vdw_detail[]);iwdw_detail[] = vdw_detail[]
end subroutine

public function integer f_get_iwdw_detail (ref datawindow rdw_detail[]);rdw_detail[] = iwdw_detail[] 
return upperbound(iwdw_detail[])
end function

public function integer f_get_iwdw_share (ref datawindow rdw_share[]);rdw_share[] = iwdw_share[] 
return upperbound(iwdw_share[])
end function

public subroutine f_set_iwdw_share (datawindow vdw_share[]);iwdw_share[] = vdw_share[]
end subroutine

public function boolean f_get_ib_object_changing ();return ib_object_changing
end function

public subroutine f_reset_ii_fixedpart2_height_form ();
ii_fixedpart2_height_bak = ii_fixedpart2_height
ii_fixedpart2_height = ii_fixedpart2_height_form
end subroutine

public subroutine f_reset_ii_fixedpart2_height_grid ();
if ii_fixedpart2_height > 0 then ii_fixedpart2_height_form = ii_fixedpart2_height
ii_fixedpart2_height = ii_fixedpart2_height_bak




end subroutine

public subroutine f_reset_ii_fixedpart2_height_grid (integer vi_fixedpart2_height);
if ii_fixedpart2_height > 0 then ii_fixedpart2_height_form = ii_fixedpart2_height
ii_fixedpart2_height = vi_fixedpart2_height




end subroutine

public subroutine f_set_resize ();int		li_width, li_height

//-- resize scrollbar --//
if this.hscrollbar then	ii_Hscrollbar = 50 + t_w_mdi.mdi_1.microhelpheight
if this.vscrollbar then ii_Vscrollbar = 90

ic_obj_handling.f_get_resize_wdisplay(li_width ,li_height)

if li_width = 0 and li_height = 0 then
	if this.windowtype = main! then	
		li_height =  t_w_mdi.mdi_1.height //, pixelstoUnits(scr_height, YPixelsToUnits!))// - ii_Hscrollbar
		li_width = t_w_mdi.mdi_1.width //, pixelstoUnits(scr_width, XPixelsToUnits!))// - ii_Vscrollbar
	elseif this.windowtype = response! or this.windowtype = popup!   then
		li_height =  this.workspaceheight( ) //- ii_Hscrollbar
		li_width =  this.workspacewidth( ) //- ii_Vscrollbar
	end if
end if

ii_resize_width = li_width
ii_resize_height = li_height
end subroutine

public function integer f_set_record_security (t_dw_mpl vdw_handing);t_dw_mpl		ladw_detail[]
int					li_rtn,li_idx,li_count

li_count = vdw_handing.f_getdwdetails( ladw_detail)
li_rtn = vdw_handing.f_set_rec_security( )
for li_idx = 1 to li_count
	this.f_set_record_security(ladw_detail[li_idx] )
next
return li_rtn
end function

public subroutine f_set_iadw_none_md (datawindow vdw_none_md[]);iadw_none_md[] = vdw_none_md[]
end subroutine

public function integer f_get_iadw_none_md (ref datawindow rdw_none_md[]); rdw_none_md[] = iadw_none_md[]
 return upperbound(rdw_none_md[])
end function

public subroutine f_store_filter_datastore ();//-- Lưu giữ filter_data --//
//t_dw_mpl		ldw_main

if isvalid(ic_obj_handling.ids_filter_data) then
	ic_obj_handling.ids_filter_data.reset()		
else
	ic_obj_handling.ids_filter_data = create t_ds_db
	ic_obj_handling.ids_filter_data.dataobject = dw_filter.dataobject
end if
dw_filter.rowscopy( 1, 1, Primary!, ic_obj_handling.ids_filter_data, 1, Primary!)

end subroutine

public function datawindow f_get_dw (string vs_dwo);
int					li_idx, li_idx2, li_idx3

datawindow		ldw_tmp,ldw_rtn
t_t					l_tab
t_tp				l_tabpage

t_dw_mpl	ldw

setnull(ldw_tmp)
setnull(ldw_rtn)
if isnull(vs_dwo) or vs_dwo = '' then return ldw_rtn

FOR li_idx = 1 to upperbound(this.control[])
	//-- tìm và cất  dw--//
	if this.control[li_idx].typeof() = datawindow! then
		ldw_tmp = this.control[li_idx]
		if left(ldw_tmp.dataobject,len(ldw_tmp.dataobject)-4) = left(vs_dwo,len(vs_dwo)-4) then
			if ldw_tmp.dynamic f_get_ib_shared( ) then 
				ldw_tmp = ldw_tmp.dynamic f_get_idw_master()
			end if
			ldw_rtn = ldw_tmp
			return ldw_rtn
		end if
	elseif this.control[li_idx].typeof() = tab! then
		l_tab = this.control[li_idx]
		FOR li_idx2 =1 to upperbound(l_tab.control)
			l_tabpage = l_tab.control[li_idx2]
			FOR li_idx3 = 1 to upperbound(l_tabpage.control[])
				if l_tabpage.control[li_idx3].typeof() = datawindow! then
					ldw_tmp =  l_tabpage.control[li_idx3]
					if  left(ldw_tmp.dataobject,len(ldw_tmp.dataobject)-4) = left(vs_dwo,len(vs_dwo)-4) then
						if ldw_tmp.dynamic f_get_ib_shared( ) then 
							ldw_tmp = ldw_tmp.dynamic f_get_idw_master()
						end if
						ldw_rtn = ldw_tmp
						return ldw_rtn
					end if					
				end if
			NEXT
		NEXT
	end if
NEXT	

return ldw_rtn
end function

public subroutine f_set_obj_handling (s_object_display vod_handle);ic_obj_handling = vod_handle
end subroutine

public function integer f_set_redraw_dw (boolean vb_flag);int			li_idx, li_rtn
t_dw 		ldw_main

ldw_main = this.f_get_dwmain( )
ldw_main.setredraw(vb_flag )
 
FOR li_idx =1 to upperbound(this.iadw_none_md )
	li_rtn =this.iadw_none_md[li_idx].setredraw(vb_flag )
NEXT

FOR li_idx =1 to upperbound(this.iwdw_detail[] )
	li_rtn =this.iwdw_detail[li_idx].setredraw(vb_flag )
NEXT

FOR li_idx =1 to upperbound(this.iwdw_share[] )
	li_rtn =this.iwdw_share[li_idx].setredraw(vb_flag )
NEXT

return li_rtn
end function

public function integer f_reconnect_trans ();


destroy it_transaction

//-- Tạo connection voi database --//
it_transaction = create t_transaction
it_transaction.dbms =	SQLCA.DBMS
it_transaction.ServerName	 = SQLCA.ServerName
it_transaction.LogId	 = SQLCA.LogId
it_transaction.LogPass 	 = SQLCA.LogPass 
it_transaction.AutoCommit 	 = false 
it_transaction.DBParm	 = SQLCA.DBParm

connect using	it_transaction;	
if it_transaction.sqlcode = 0 then
	return 1
else
	return  it_transaction.sqlcode
end if
end function

public function integer f_reset_dwo_trans ();
int								li_idx1, li_tabpageCount, li_j, li_k, li_controlCount

//-- resonnect --//
if this.f_reconnect_trans( ) = 1 then
	//-- set dwo --//
	FOR li_idx1 = 1 to upperbound(this.control[])
		//-- set dwo cho dw tren window --//
		if this.control[li_idx1].typeof() = datawindow! then
			if this.control[li_idx1].classname() = 'dw_filter' then continue
			if  this.control[li_idx1].dynamic f_get_dataobject() <> '' then
				//-- set transaction --//
				 this.control[li_idx1].dynamic settransobject( it_transaction)
			end if
		elseif this.control[li_idx1].typeof() = tab! then
				tab ltb
				ltb = create tab
				ltb = this.control[li_idx1]	
				li_tabpageCount = Upperbound(ltb.Control[])
				For li_j = 1 to li_tabpageCount
					 li_controlCount =  Upperbound(ltb.Control[li_j].control[])
					 for li_k =1 To li_controlCount
							choose case ltb.Control[li_j].control[li_k].typeof()
								 case Datawindow!
										if   ltb.Control[li_j].control[li_k].dynamic f_get_dataobject() <> '' then
											//-- set transaction --//
											 ltb.Control[li_j].control[li_k].dynamic settransobject( it_transaction)
										end if									
						  end choose
					 Next
				Next				
		end if
	NEXT	
end if

return 1
end function

public function integer f_filter_dwmain_new ();s_str_dwo_tabpage	lstr_dwo_tab[]
b_obj_instantiate		lobj_ins

t_dw_mpl			ldw_main
string					ls_filterstring, ls_text, ls_colname
double				ldb_ID
long					ll_currentrow, ll_originalrow


ls_text = this.dw_filter.gettext( ) // getitemstring( 1, 'filter_string')



if ic_obj_handling.classname( ) = 'u_valueset' or  ic_obj_handling.classname( ) = 'u_onhand'   then
	ic_obj_handling.f_get_dwo_tabpage( lstr_dwo_tab[])
	ldw_main = this.f_get_dw( lstr_dwo_tab[1].str_dwo[1].s_dwo_default)
	if isnull(ldw_main) then
		ldw_main = this.f_get_dwmain( )
	end if
else
	ldw_main = this.f_get_dwmain( )
end if

if isnull(ls_text) or ls_text = '' then
	ls_filterstring = ''
else
	ls_colname =  this.dw_filter.getitemstring( 1, 'colname')
	if ls_colname = '' or isnull(ls_colname) then
		if left(ldw_main.describe( 'obj_search.coltype'), 5) = 'char(' then 
			ls_colname = 'obj_search'
		elseif left(ldw_main.describe( 'doc_search.coltype'), 5) = 'char(' then
			ls_colname = 'doc_search'
		end if
	end if
	if isnull(ls_colname) or ls_colname ='' then
		ls_filterstring = lobj_ins.f_get_filterstring( ldw_main,ls_text )
	else
		ls_filterstring = lobj_ins.f_get_filterstring( ldw_main,ls_text , ls_colname)
	end if
end if

if isvalid(ldw_main) then
	ll_originalrow = ldw_main.getrow()
	if ll_originalrow > 0 then
		if ldw_main.describe( "ID.coltype") <> '!' then	ldb_ID = ldw_main.getitemnumber( ll_originalrow, 'ID')
	end if
	ldw_main.setfilter(ls_filterstring )
	ldw_main.filter( )
	ldw_main.f_set_gutter_rowcount( )
	if ldb_ID > 0 then
		ll_currentrow = ldw_main.find( "ID = "+string(ldb_ID), 1, ldw_main.rowcount())
		if ll_currentrow = 0 then ll_currentrow = 1
		ldw_main.scrolltorow( ll_currentrow)
		// truong hop copy from thi khong filter_detail
		if not ic_obj_handling.ib_copying then
			if ll_currentrow = 1 and ll_originalrow = 1 then
				ldw_main.f_filter_detail( )
				ic_obj_handling.f_ctrl_actionbuttons(ldw_main)
				this.triggerevent( "e_display_actionbutton" )
			end if
		end if
	elseif ldw_main.rowcount() = 1 or ldw_main.getrow( ) = 1  then
		ldw_main.f_filter_detail( )
	end if

end if

//ic_obj_handling.is_dwmain_filter = ls_filterstring

return 0
end function

public function integer f_add_filter_colname (t_dw_mpl vdw_handle);string			lsa_colname[], ls_dwo
int				li_cnt
if dw_filter.rowcount( ) <> 1 then return 0
ls_dwo = left(vdw_handle.dataobject, len(vdw_handle.dataobject) - 5)
li_cnt = vdw_handle.f_getcolumns(lsa_colname[])


return 1
end function

public function integer f_build_data_related (ref s_str_dwo_related rstr_data_related[], ref s_str_drilldown_data rstr_drilldown_data);//-- Lay du lieu cua dwo lien quan : dung cho drilldown report --//

c_string					lc_string
t_dw_mpl				ldw_related, ldw_parm
c_dwservice				lc_dwsr
int							li_idx, li_objCount, li_colCount, li_col
long						ll_row
string						las_main_obj_column[], las_relatedtext_column[], ls_text, ls_null, ls_coltype, ls_data
boolean					lb_notseleted

li_objCount =upperbound(rstr_data_related[])

FOR li_idx = 1 to li_objCount
	if upperbound(rstr_data_related[li_idx].s_data[]) > 0 then continue
	ldw_related = this.f_get_dw(rstr_data_related[li_idx].s_main_obj_dwo)	
	if isnull(ldw_related) or not isvalid(ldw_related) then 
		if rstr_data_related[li_idx].s_related_obj_name <> 'u_valueset' then
			// khai báo tên dw trong struct sai hoặc nhầm giữa đối tượng main và related
			messagebox('Lỗi','s_w_main.fbuild_data_related(line:16)')
		end if
		continue
	end if
	
	if  ldw_related.getrow( ) > 0 then
		//-- build datalink --//
		li_colCount = lc_string.f_stringtoarray(rstr_data_related[li_idx].s_main_obj_column , ';', las_main_obj_column[]) 
		FOR li_col = 1 to li_colCount			
			if isnull(rstr_data_related[li_idx].s_criteria_type) or rstr_data_related[li_idx].s_criteria_type <> 'fixed' then
				if upperbound(rstr_data_related[li_idx].s_data[]) = li_col then							
					if rstr_data_related[li_idx].s_data[li_col] <> '' then rstr_data_related[li_idx].s_data[li_col] += ','
				end if			
				ls_data = string(ldw_related.dynamic f_getitemany(ldw_related.getrow( ) , las_main_obj_column[li_col]))	
				if isnull(ls_data) then ls_data = ''
				rstr_data_related[li_idx].s_data[li_col] += ls_data		
				//-- set data related cho dw drilldown --//
				if rstr_data_related[li_idx].s_related_obj_dwo = rstr_data_related[li_idx].s_related_obj_dwo_copy[1] then
					rstr_drilldown_data.aa_data[li_col] = ldw_related.dynamic f_getitemany(ldw_related.getrow( ) , las_main_obj_column[li_col])
				end if				
			end if			

			
			
			/*
			ls_coltype = ldw_related.describe( las_main_obj_column[li_col]+ '.coltype' )			
			if ldw_related.dynamic f_isgrid() then
				lb_notseleted = true
				ll_row = ldw_related.find( "gutter = 'Y' ", 1, ldw_related.rowcount( ))
				//-- nếu đối tượng là b_view thì kiểm tra in nhiều phiếu 1 lúc --//
				if ll_row > 0 and rstr_data_related[li_idx].s_related_obj_name = 'b_view'then
					if upperbound(rstr_data_related[li_idx].s_main_obj_column_chk[]) > 0 then
						if not lc_dwsr.f_is_object_col_check(rstr_data_related[li_idx].s_main_obj_column_chk[li_idx] , ldw_related) then return -1
					end if
				end if
				DO while ll_row > 0
					lb_notseleted = false
					if upperbound(rstr_data_related[li_idx].s_data[]) = li_col then							
						if rstr_data_related[li_idx].s_data[li_col] <> '' then rstr_data_related[li_idx].s_data[li_col] += ','
					end if
					rstr_data_related[li_idx].s_data[li_col] += string(ldw_related.dynamic f_getitemany(ll_row, las_main_obj_column[li_col]))		
					ll_row = ldw_related.find( "gutter = 'Y' ", ll_row+1, ldw_related.rowcount( ) + 1)
				LOOP

				if lb_notseleted then
					if isnull(rstr_data_related[li_idx].s_criteria_type) or rstr_data_related[li_idx].s_criteria_type <> 'fixed' then
						if upperbound(rstr_data_related[li_idx].s_data[]) = li_col then							
							if rstr_data_related[li_idx].s_data[li_col] <> '' then rstr_data_related[li_idx].s_data[li_col] += ','
						end if			
						if ldw_related.getrow( ) > 0 then
							rstr_data_related[li_idx].s_data[li_col] += string(ldw_related.dynamic f_getitemany(ldw_related.getrow( ) , las_main_obj_column[li_col]))			
							if isnull(rstr_data_related[li_idx].s_data[li_col]) then rstr_data_related[li_idx].s_data[li_col] ='()'
						end if
					end if
				end if
			else
				if  isnull(rstr_data_related[li_idx].s_criteria_type) or rstr_data_related[li_idx].s_criteria_type <> 'fixed' then //-- trường hợp valueset --//
					if upperbound(rstr_data_related[li_idx].s_data[]) = li_col then							
						if rstr_data_related[li_idx].s_data[li_col] <> '' then rstr_data_related[li_idx].s_data[li_col] += ';'
					end if
					if ldw_related.getrow( ) > 0 then 
						if ldw_related.dataobject = 'd_struct_popup_form' and las_main_obj_column[li_col] = 'value_id' then
							if ldw_related.getitemstring(ldw_related.getrow( ) , rstr_data_related[li_idx].s_uprow_column) = 'Y' and  ldw_related.getrow( ) > 1 then
								rstr_data_related[li_idx].s_data[li_col] += string(ldw_related.dynamic f_getitemany(ldw_related.getrow( ) - 1 , las_main_obj_column[li_col]))
							else
								setnull(ls_null)
								rstr_data_related[li_idx].s_data[li_col] = ls_null
							end if								
						else							
							rstr_data_related[li_idx].s_data[li_col] += string(ldw_related.dynamic f_getitemany(ldw_related.getrow( ) , las_main_obj_column[li_col]))
						end if
					end if
				end if
			end if
			//-- điều chỉnh lại dữ liệu để phù hợp với buildwhere --//
			if pos(rstr_data_related[li_idx].s_data[li_col], ',') > 0 then
				if rstr_data_related[li_idx].s_related_obj_name = 'b_view' then rstr_data_related[li_idx].s_data[li_col] = lc_string.f_globalreplace( rstr_data_related[li_idx].s_data[li_col], ',', ';')
				rstr_data_related[li_idx].s_data[li_col] = '(' + rstr_data_related[li_idx].s_data[li_col] + ')'
			elseif isnull(rstr_data_related[li_idx].s_data[li_col]) then
				rstr_data_related[li_idx].s_data[li_col] ='()'
			elseif left(ls_coltype,4) = 'char' then
				rstr_data_related[li_idx].s_data[li_col] = '=' + rstr_data_related[li_idx].s_data[li_col]
			end if			
			*/
		NEXT
		//-- build text --//			
		li_colCount = lc_string.f_stringtoarray(rstr_data_related[li_idx].s_relatedtext_column , ';', las_relatedtext_column[]) 	
		rstr_data_related[li_idx].s_text = lc_string.f_getfirsttoken(rstr_data_related[li_idx].s_text , ':')
		rstr_data_related[li_idx].s_text += ':'
		FOR li_col = 1 to li_colCount
			if li_col > 1 then rstr_data_related[li_idx].s_text += ' - '
			ls_text =  string(ldw_related.dynamic f_getitemany(ldw_related.getrow( ), las_relatedtext_column[li_col]))
			if isnull(ls_text) then ls_text = ''
			rstr_data_related[li_idx].s_text += ls_text
		NEXT			
	else
		return 0
	end if
	
	//-- set drilldown --//
	rstr_drilldown_data.s_drilldown_obj_dwo[1] = rstr_data_related[li_idx].s_related_obj_dwo_copy[1]
	if rstr_data_related[li_idx].s_related_obj_dwo = rstr_data_related[li_idx].s_related_obj_dwo_copy[1] then		
		rstr_drilldown_data.s_drilldown_obj_column[1] = rstr_data_related[li_idx].s_related_obj_column + ';' + rstr_data_related[1].s_related_obj_column_copy[1]	
	else
		rstr_drilldown_data.s_drilldown_obj_column[1] = rstr_data_related[1].s_related_obj_column_copy[1]	
	end if
	ldw_parm = this.f_get_dw(rstr_data_related[li_idx].s_main_obj_dwo_copy[1])	
	li_colCount = lc_string.f_stringtoarray(rstr_data_related[li_idx].s_main_obj_column_copy[1] , ';', las_main_obj_column[]) 
	FOR li_idx = 1 to li_colCount
		rstr_drilldown_data.aa_data[upperbound(rstr_drilldown_data.aa_data[])+1] = ldw_parm.dynamic f_getitemany(ldw_parm.getrow( ) , las_main_obj_column[li_idx])	
	NEXT
NEXT

return upperbound(rstr_data_related)
end function

public subroutine f_set_ii_fixedpart1_height (decimal vi_fixedpart1_height);
	ii_fixedpart1_height = vi_fixedpart1_height

end subroutine

public subroutine f_set_ii_fixedpart2_height (decimal vi_fixedpart2_height);

int			li_row


li_row = ic_obj_handling.ids_user_profile.find("user_id ="+string(gi_userid)+" AND isnull(dwobject) and dwcontrol = 'ii_fixedpart2_height'", 1, ic_obj_handling.ids_user_profile.rowcount())
if li_row > 0 then
	ii_fixedpart2_height =  ic_obj_handling.ids_user_profile.getitemnumber( li_row,'tabseq')
	if ii_fixedpart2_height = 0 then
		ii_fixedpart2_height_form = vi_fixedpart2_height
	else
		ii_fixedpart2_height_form = ii_fixedpart2_height
	end if
else
	ii_fixedpart2_height = vi_fixedpart2_height
	ii_fixedpart2_height_form = vi_fixedpart2_height
end if

end subroutine

public subroutine f_set_ii_fixedpart2_height (decimal vi_fixedpart2_height, boolean vb_reset);

int			li_row

if vb_reset then
	ii_fixedpart2_height = vi_fixedpart2_height
	ii_fixedpart2_height_form = vi_fixedpart2_height	
else
	this.f_set_ii_fixedpart2_height(vi_fixedpart2_height)
end if
end subroutine

public subroutine f_set_ii_fixedpart3_height (decimal vi_fixedpart3_height);
	ii_fixedpart3_height = vi_fixedpart3_height




end subroutine

public subroutine f_set_ii_gb_11_width (decimal vi_gb_11_width);
int			li_row


li_row = ic_obj_handling.ids_user_profile.find( "user_id ="+string(gi_userid)+" AND isnull(dwobject) and dwcontrol = 'ii_gb_11_width'", 1, ic_obj_handling.ids_user_profile.rowcount())
if li_row > 0 then
	ii_gb_11_width =  ic_obj_handling.ids_user_profile.getitemnumber( li_row,'tabseq')
else
	ii_gb_11_width = vi_gb_11_width
end if




end subroutine

public subroutine f_set_ii_gb_3_height (decimal vi_gb_3_height);int			li_row


li_row = ic_obj_handling.ids_user_profile.find("user_id ="+string(gi_userid)+" AND isnull(dwobject) and dwcontrol = 'ii_gb_3_height'", 1, ic_obj_handling.ids_user_profile.rowcount())
if li_row > 0 then
	ii_gb_3_height =  ic_obj_handling.ids_user_profile.getitemnumber( li_row,'tabseq')
else
	ii_gb_3_height = vi_gb_3_height
end if


end subroutine

public subroutine f_set_ii_gb_4_height (decimal vi_gb_4_height);int			li_row


li_row = ic_obj_handling.ids_user_profile.find("user_id ="+string(gi_userid)+" AND isnull(dwobject) and dwcontrol = 'ii_gb_4_height'", 1, ic_obj_handling.ids_user_profile.rowcount())
if li_row > 0 then
	ii_gb_4_height =  ic_obj_handling.ids_user_profile.getitemnumber( li_row,'tabseq')
else
	ii_gb_4_height = vi_gb_4_height
end if


end subroutine

public subroutine f_set_ii_gb_5_height (decimal vi_gb_5_height);int			li_row


li_row = ic_obj_handling.ids_user_profile.find("user_id ="+string(gi_userid)+" AND isnull(dwobject) and dwcontrol = 'ii_gb_5_height'", 1, ic_obj_handling.ids_user_profile.rowcount())
if li_row > 0 then
	ii_gb_5_height =  ic_obj_handling.ids_user_profile.getitemnumber( li_row,'tabseq')
else
	ii_gb_5_height = vi_gb_5_height
end if


end subroutine

public subroutine f_set_ii_leftpart_width (decimal vi_leftpart_width);int			li_row


li_row = ic_obj_handling.ids_user_profile.find("user_id ="+string(gi_userid)+" AND isnull(dwobject) and dwcontrol = 'ii_leftpart_width'", 1, ic_obj_handling.ids_user_profile.rowcount())
if li_row > 0 then
	ii_leftpart_width =  ic_obj_handling.ids_user_profile.getitemnumber( li_row,'tabseq')
else
	ii_leftpart_width = vi_leftpart_width
end if



end subroutine

public subroutine f_set_ii_midpart_width (decimal vi_midpart_width);int			li_row


li_row = ic_obj_handling.ids_user_profile.find("user_id ="+string(gi_userid)+" AND isnull(dwobject) and dwcontrol = 'ii_midpart_width'", 1, ic_obj_handling.ids_user_profile.rowcount())
if li_row > 0 then
	ii_midpart_width =  ic_obj_handling.ids_user_profile.getitemnumber( li_row,'tabseq')
else
	ii_midpart_width = vi_midpart_width
end if




end subroutine

public subroutine f_set_ii_upperpart_height (decimal vi_upperpart_height);int			li_row


li_row = ic_obj_handling.ids_user_profile.find("user_id ="+string(gi_userid)+" AND isnull(dwobject) and dwcontrol = 'ii_upperpart_height'", 1, ic_obj_handling.ids_user_profile.rowcount())
if li_row > 0 then
	ii_upperpart_height =  ic_obj_handling.ids_user_profile.getitemnumber( li_row,'tabseq')
else
	ii_upperpart_height = vi_upperpart_height
end if


end subroutine

public subroutine f_set_ii_upperpart_height (decimal vi_upperpart_height, boolean vb_reset);int			li_row

if vb_reset then
	ii_upperpart_height = vi_upperpart_height
else
	this.f_set_ii_upperpart_height(vi_upperpart_height)
end if


end subroutine

public function decimal f_get_ii_fixedpart1_height ();return ii_fixedpart1_height
end function

public function decimal f_get_ii_fixedpart2_height ();return ii_fixedpart2_height
end function

public function decimal f_get_ii_fixedpart3_height ();return ii_fixedpart3_height
end function

public function decimal f_get_ii_gb_11_width ();return ii_gb_11_width
end function

public function decimal f_get_ii_gb_3_height ();return ii_gb_3_height
end function

public function decimal f_get_ii_gb_4_height ();return ii_gb_4_height
end function

public function decimal f_get_ii_gb_5_height ();return ii_gb_5_height
end function

public function decimal f_get_ii_leftpart_width ();return ii_leftpart_width
end function

public function decimal f_get_ii_midpart_width ();return ii_midpart_width
end function

public function decimal f_get_ii_upperpart_height ();return ii_upperpart_height
end function

public function integer f_set_record_security_ex (ref t_transaction rt_transaction);t_dw_mpl	ldw_main,ladw_detail[],ldw_master
int				li_rtn,li_idx,li_count


ldw_main = this.f_get_dwmain( )
ldw_main.f_set_rec_security_ex( rt_transaction)
li_count = ldw_main.f_getdwdetails( ladw_detail)
for li_idx = 1 to li_count
	li_rtn = this.f_set_record_security_ex(ladw_detail[li_idx], rt_transaction)
next
//--set record cho các dw none md(thường là báo cáo)--//
for li_idx = 1 to upperbound(iadw_none_md[])
	ldw_master = this.f_get_dw( iadw_none_md[li_idx].dataobject)
	if isvalid(ldw_master) then
		ldw_master.f_set_rec_security_ex(rt_transaction )
	end if
next
return 1
end function

public function integer f_set_record_security_ex (t_dw_mpl vdw_handing, ref t_transaction rt_transaction);t_dw_mpl		ladw_detail[]
int					li_rtn,li_idx,li_count

li_count = vdw_handing.f_getdwdetails( ladw_detail)
li_rtn = vdw_handing.f_set_rec_security_ex( rt_transaction)
for li_idx = 1 to li_count
	this.f_set_record_security_ex(ladw_detail[li_idx], rt_transaction )
next
return li_rtn
end function

event e_preadd;/*******************************************************************
chức năng: thay đổi giao diện dw main sang giao dien edit
--------------------------------------------------------------------------------------*/

datawindow		ldw_main

if ic_obj_handling.dynamic f_is_changed_dwo_4edit()  then
	if this.f_is_filter_on() then
		//-- lưu lại filter data nếu có--//
//		this.f_store_filter_datastore( )
		//-- tắt filter --//	
		this.event e_filteroff( )
	end if
	
	//-- change DWO to edit mode --//	
	ldw_main = this.f_get_dwmain( )
	if ldw_main = idw_focus then
		ldw_main.dynamic f_change_2_edit()
		ldw_main.dynamic f_set_ib_edit_changing(false)
		ldw_main.reset( )
	end if
end if
return 0
end event

event e_postadd;//-- Thực hiện sau khi tạo mớ: set focus cho control và gọi điều khiển action --//
int				li_rtn

li_rtn = ic_obj_handling.dynamic event e_window( 'e_postadd')
if li_rtn = -1 then 
	return -1
end if
ic_obj_handling.f_ctrl_actionbuttons( idw_focus)
this.event e_display_actionbutton( )
return idw_focus.setfocus( )
end event

event e_add;//-- Tạo đối tượng mới, return row number , -1 lỗi --//
long			ll_rtn
t_dw_mpl	ldw_main

setpointer(appstarting!)
ldw_main = this.f_get_dwmain( )
if idw_focus.classname( ) = 'dw_filter' then
	this.f_set_idwfocus(ldw_main )
end if 
//-- Trước khi add: Thay đổi giao diện dw sang edit --//
ll_rtn = this.event e_preadd( )

if ll_rtn <> -1 then
	//-- add record --//
	ll_rtn = idw_focus.dynamic event e_addrow()

	//-- set focus và goi object điều khiễn nút --//
	this.event e_postadd( )
end if
setpointer(arrow!)
return ll_rtn
end event

event e_premodify;//-- đổi giao diện sang giao diện editing --//

datawindow		ldw_main


if ic_obj_handling.dynamic f_is_changed_dwo_4edit()  then
//	if this.f_is_filter_on() then
//		//-- lưu lại filter data nếu có--//
//		this.f_store_filter_datastore( )
//	end if
	
	//-- change DWO to edit mode --//
	ldw_main = this.f_get_dwmain( )
	if isvalid(ldw_main) then
		ldw_main.dynamic f_change_2_edit()
		ldw_main.settransobject( it_transaction )
		ldw_main.dynamic event e_retrieve( )
		ldw_main.dynamic f_set_ib_edit_changing(false)
	else
		return -1
	end if
	if this.f_is_filter_on() then
		//-- tắt filter --//	
		this.event e_filteroff( )
	end if	
end if
return 0

end event

event e_modify;//-- Chỉnh sửa đối tượng, return rownumber, -1 lỗi --//

int li_rtn
t_dw_mpl	ldw_main

if idw_focus.classname( ) = 'dw_filter' then
	ldw_main = this.f_get_dwmain( )
	this.f_set_idwfocus(ldw_main )
end if

//-- đổi giao diện sang giao diện editing --//
li_rtn = this.event e_premodify( )

if li_rtn <> -1 then
	
	//-- Gọi dw modify: set readonly, đổi trạng thái biến ib_editing --//
	li_rtn = idw_focus.triggerevent( 'e_modifyrow')
	
	//-- set focus và gọi object điều khiển action button --//
	this.event e_postmodify( )
end if

return li_rtn
end event

event e_predelete;//-- Thực hiện trước khi xóa, return 1 yes, 2 no --//
string		ls_cnt

ls_cnt = this.idw_focus.Describe("Evaluate('sum(if(gutter = ~~'Y~~',1,0))', 0)")
if ls_cnt = '0' then
	
	if  gf_messagebox('m.s_w_main.e_predelete.01', 'Xác nhận xóa','Bạn chắc chắn xóa dòng dữ liệu hiện thời không?','question','yesno',2) = 1 then
		return 1
	else
		return 0
	end if
else
	if  gf_messagebox('m.s_w_main.e_predelete.02', 'Xác nhận xóa','Tổng số dòng xoá:@'+ls_cnt+'@, Bạn chắc chắn xóa không?'  ,'question','yesno',2) = 1 then
		return 1
	else
		return 0
	end if	
end if
end event

event e_delete;//-- Thực hiện xóa, return row number deleted, -1 lỗi --//
long 				ll_rtn
datawindow		ldw_main


if idw_focus.classname( ) = 'dw_filter' then return 0

//-- xác nhận chắc chắn xóa --//
ll_rtn =  this.event e_predelete( )

//-- Yêu càu thực hiện xóa --//
if ll_rtn = 1 then
	ll_rtn = idw_focus.dynamic event e_delete()
	if ll_rtn = -1 then
		rollback using it_transaction;
		idw_focus.dynamic event e_retrieve()
		return 0
	else
		if  not idw_focus.dynamic f_get_ib_editing() then		
			commit using it_transaction;
		else
			//-- Nếu xóa dwmain khi đang edit thi se save và đóng edit --//			
			if ic_obj_handling.f_get_ib_changed_dwo_4edit( ) then
				ldw_main = this.f_get_dwmain( ) 
				if ldw_main= idw_focus then
					if idw_focus.update(true,false ) = 1 then
						commit using it_transaction;	
						idw_focus.dynamic event e_resetupdate()
						idw_focus.dynamic f_close_edit()
						this.event e_filteron( )				
					else
						rollback using  it_transaction;	
						gf_messagebox('m.s_w_main.e_delete.01','Thông báo','Không xóa được dữ liệu DW:@'+idw_focus.dataobject,'exclamation','ok',1)
						return -1
					end if
				else
					//-- Không thực hiện gì cả: không chạy postdelete --//	
					return 0
				end if
			else
				ldw_main = this.f_get_dwmain( ) 
				if ldw_main= idw_focus then
					if idw_focus.update(true,false ) = 1 then
						commit using it_transaction;	
						idw_focus.dynamic event e_resetupdate_del()
						idw_focus.scrolltorow(idw_focus.getrow( ) )
					else
						rollback using  it_transaction;	
						gf_messagebox('m.s_w_main.e_delete.01','Thông báo','Khống xóa được dữ liệu DW:@'+idw_focus.dataobject,'exclamation','ok',1)
						return -1
					end if									
				else
					//-- Không thực hiện gì cả: không chạy postdelete --//	
					return 0					
				end if
			end if			
		end if
	end if

	//-- Sau khi xóa thông báo object điều khiển trạng thái action --//
	this.event e_postdelete( )	
end if

return ll_rtn
end event

event e_presave;int				li_rtn


li_rtn = ic_obj_handling.event e_window_e_presave()
if li_rtn = -1 then 
	return -1
end if
return 0
end event

event e_save;//-- Thực hiện lưu dữ liệu, return 1 ok, -1 lỗi --//
int 		li_rtn
t_ds_db	lds_matching

t_dw_mpl	ldw_main

if idw_focus.classname( ) = 'dw_filter' then
	ldw_main = this.f_get_dwmain( )
	this.f_set_idwfocus(ldw_main )
end if

//-- Trước khi lưu --//
li_rtn = this.event e_presave( )

//-- Yêu cầu thực hiện lưu --//
if li_rtn <> -1 then
	li_rtn = idw_focus.dynamic event e_save()
	if li_rtn <> -1 then
		li_rtn = idw_focus.dynamic event e_resetupdate()	
		if li_rtn = 1 then
			lds_matching = ic_obj_handling.dynamic f_get_ids_matching()
			if isvalid(lds_matching) then
//				if lds_matching.rowcount( ) > 0 then
//					li_rtn = lds_matching.update( true,false)
//					if li_rtn = 1 then 
//						lds_matching.resetupdate( )
//					else
//						rollback using it_transaction;
//					end if
//				end if
				lds_matching.reset()
				ic_obj_handling.ib_copying = false
				ic_obj_handling.ib_copy_tax = false
			end if
			if li_rtn = 1 then 
				commit using it_transaction;
			end if
			if it_transaction.sqlcode = 0 then
			else
				messagebox('ERROR','s_w_main.e_save(commit)')
			end if
		else
			rollback using it_transaction;
		end if
	else
		rollback using it_transaction;
	end if
	this.event e_postsave(li_rtn )
end if
return li_rtn
end event

event e_postopen;/*****************************************************************
Chức năng: Thống báo đến object
===================================================*/
int				li_rtn, li_idx
long			ll_row_found
string		ls_display_model,ls_select_SQL
s_str_drilldown_data 		lstr_drilldown_data

//this.f_set_resize() khoá vì đã gọi trong event resize
ls_display_model = ic_obj_handling.dynamic f_get_display_model()
this.f_resize(ls_display_model )	
//--kiẻm tra open drilldown --//
if ic_obj_handling.f_get_drilldown_data( lstr_drilldown_data) > 1 then	
	li_rtn = ic_obj_handling.dynamic event e_window('e_postopen')
	ic_obj_handling.f_open_drilldown_rpt( )
	idw_focus.setfocus( )
	this.event e_display_actionbutton( )
	ib_opening = false
	return li_rtn
else		
	//-- Neu open object return 0 thi thuc hien retrieve idw_focus --//
	if vi_preopen_return = 0 then
		//-- retrieve ds_book --//
		if not ic_obj_handling.ib_copying then ic_obj_handling.dynamic f_book(0,false)
		//-- retrieve dw_focus --//
		if ic_obj_handling.classname() = 'u_onhand' then
			idw_focus = this.f_get_dw( 'd_onhand_grid')
		end if
		if idw_focus.dynamic event e_refresh() = -9 or idw_focus.dynamic event e_refresh() = 0  then
			ic_obj_handling.f_ctrl_actionbuttons(idw_focus)
		end if
		
		//-- scroll đến record được chọn trong window search --//
	//	if idw_focus.rowcount( ) > 0 then
	//		if t_w_mdi.iw_search.idb_object_id > 0 then
	//			ll_row_found = idw_focus.find("ID =" + string(t_w_mdi.iw_search.idb_object_id), 1,  idw_focus.rowcount( ))
	//			t_w_mdi.iw_search.idb_object_id = 0
	//			if ll_row_found > 0 then
	//				idw_focus.scrolltorow(ll_row_found)
	//			end if
	//		end if
	//	end if
	
		//-- retrieve các DW độc lập --//
		FOR li_idx = 1 to upperbound(iadw_none_md[] )
			ls_select_SQL = iadw_none_md[li_idx].describe("Datawindow.Table.Select")
			if ls_select_SQL<>'' and ls_select_SQL <> '!' and left(iadw_none_md[li_idx].dataobject,3) <> 'dr_' and  iadw_none_md[li_idx].dataobject <> idw_focus.dataobject then
				iadw_none_md[li_idx].dynamic event e_refresh( ) 
			end if
		NEXT	
	else
		ic_obj_handling.f_ctrl_actionbuttons(idw_focus)
	end if
end if

li_rtn = ic_obj_handling.dynamic event e_window('e_postopen')
idw_focus.setfocus( )
this.event e_display_actionbutton( )
ib_opening = false
return li_rtn

end event

event e_preopen;/*****************************************************************
chứa năng:
	- Create transaction object
	- Gán dwo cho tab_action
	- Gán dwo cho dw control
	- 
-----------------------------------------------------------
retun 0: suceed
	   -1: fail
==========================================================*/

window						lw_requester	

string 						ls_title
int 							li_rtn

//-- tat cac control --//
this.f_set_invisible_ctrl()
this.setredraw( false)



ic_obj_handling.f_set_it_transaction( it_transaction)
/*/ -- set title :khoá (đã set ở event OPEN--//
if gs_user_lang ='vi-vn' then
	ls_title = ic_obj_main.f_get_title()
else
	ls_title = ic_obj_main.classname()
	ls_title = t_w_mdi.ids_lang_text.f_get_lang_text( ls_title)
end if
this.title = ls_title
*/

//-- thông báo đến object  resize các bien fix--//
li_rtn = ic_obj_handling.event e_window( 'e_preopen')
if li_rtn = -1 then 
	return -1
end if

return li_rtn

end event

event e_insert;//-- Tạo dòng mới, return row number , -1 lỗi --//

long ll_rtn
t_dw_mpl	ldw_main

if idw_focus.classname( ) = 'dw_filter' then
	ldw_main = this.f_get_dwmain( )
	this.f_set_idwfocus(ldw_main )
end if

//-- Chì chèn record cho dw detail --//
ll_rtn = idw_focus.triggerevent( 'e_insertrow')

//-- set focus và goi object điều khiễn nút --//
this.event e_postadd( )
return ll_rtn
end event

event e_refresh;
int					li_return, li_idx
string				ls_select_SQL
t_dw_mpl			ldw_main

//ic_obj_handling.ib_refresh = true
ic_obj_handling.f_set_ib_refresh( true)
li_return = ic_obj_handling.event e_window('e_refresh')
if li_return = 0 then
	this.dw_filter.accepttext( )
	ldw_main = this.f_get_dwmain( )
	ldw_main.event e_refresh( )
else
	if idw_focus.classname( ) = 'dw_filter' then
		ldw_main = this.f_get_dwmain( )
		this.f_set_idwfocus(ldw_main )
	end if	
	this.idw_focus.dynamic event e_refresh( )
end if
ic_obj_handling.f_set_ib_refresh( false)
ldw_main = this.f_get_dwmain( )
ldw_main.setfocus( )

return 0
end event

event e_first;
return idw_focus.scrolltorow( 1)

end event

event e_next;return idw_focus.scrollnextrow( )
end event

event e_last;return idw_focus.scrolltorow(idw_focus.rowcount( ) )
end event

event e_prior;return idw_focus.scrollpriorrow( )
end event

event e_prequery;Return 1
end event

event e_query;int li_rtn
If event e_PreQuery() <> 1 Then Return 0
LI_RTN = IDW_FOCUS.TRIGGEREVENT( 'E_QUERY')
ib_querymode_on = true
this.event e_ctrl_actionbutton( )
this.event e_display_actionbutton( )

////idw_focus.f_set_readonly( false)
//li_rtn = idw_focus.event e_query( )
////if li_rtn > 0 then this.f_set_m_file('query')
//This.Event e_PostQuery()
return li_rtn
end event

event e_execquery;int li_rtn

LI_RTN = IDW_FOCUS.TRIGGEREVENT( 'E_EXECQUERY')

ib_querymode_on = false
this.event e_ctrl_actionbutton( )
this.event e_display_actionbutton( )

//idw_focus.f_set_readonly( true)
//li_rtn = idw_focus.event e_execquery( )
//if li_rtn > 0 then this.f_set_m_file('execquery')
return li_rtn
end event

event e_postsave;
/******************************************************
chức năng: - setfocus cho control
				 - Thông báo object
				 - gọi điều khiển action button
---------------------------------------------------------------------------------------*/

int				li_rtn


//li_rtn = ic_obj_handling.dynamic event e_window( 'e_postsave')
li_rtn = ic_obj_handling.event e_window_e_postsave(vi_save_return )
if li_rtn = -1 then 
	return -1
end if
//--nếu đang copy thì sau khi save tắt chế độ copy--//
if ic_obj_handling.f_get_ib_copying( ) then ic_obj_handling.f_set_ib_copying( false)
ic_obj_handling.f_ctrl_actionbuttons( idw_focus)
this.event e_display_actionbutton( )
return idw_focus.setfocus( )

end event

event e_saveas;t_dw_mpl 		ldw_focus

ldw_focus = this.f_get_idwfocus( )
ic_obj_handling.event e_window_e_saveas( ldw_focus)
 
ldw_focus.event e_saveas( 'excelwithlayout')
return 1
end event

event type integer e_print();Return 1
end event

event e_postdelete;/******************************************************
chức năng: - setfocus cho control
				 - Thông báo object
				 - gọi điều khiển action button
-----------------------------------------------------------------------------------------------*/
int				li_rtn

li_rtn = ic_obj_handling.dynamic event e_window( 'e_postdelete')
if li_rtn = -1 then 
	return -1
end if
ic_obj_handling.f_ctrl_actionbuttons( idw_focus)
this.event e_display_actionbutton( )


return idw_focus.setfocus( )
end event

event type integer e_attach();return 1
end event

event type boolean e_checking_chagedata(string as_table_name, string as_id_colume_name, long al_id_value, string as_status_colume_name, string as_status_value);/*
Nội dung:
* Kiểm tra dữ liệu thay đổi.
---------------------------------------------------------------------------------------------
Biến:
	Tên									Diễn giải
- as_table_name 						Tên table
- as_id_colume_name				Tên cột ID của table
- al_id_value							Giá trị của ID
- as_status_colume_name			Tên cột trạng thái dòng
- as_status_value						Giá trị cột trạng thái dòng trên datawindow.
----------------------------------------------------------------------------------------------
Trả về:
	- True Không thay đổi
	- False Có thay đổi

*/
long ll_count,ll_row
string ls_status,ls_coltype // lưu trạng thái dọng dưới database.
string ls_sql,ls_syntax, ls_err,ls_colname
long ll_Version_id
int li_cols,li_idx
DataStore lds_info

// Kiểm tra thay đổi version

//ls_sql =  "SELECT version_id  FROM " + as_table_name + " WHERE nvl(" + as_id_colume_name + ", 0) = nvl(" + string(al_id_value) + ", 0)"//+ " AND company_id = " + tring(gi_user_comp_id)
//
//DECLARE my_cursoro DYNAMIC CURSOR FOR SQLSA ;
//
//PREPARE SQLSA FROM :ls_sql;
//
//OPEN DYNAMIC my_cursoro ;
//
//FETCH my_cursoro INTO :ll_Version_id ;
//
//CLOSE my_cursoro ;
//if isnull(ll_Version_id) then ll_Version_id = 0 
//
//ls_sql =  "SELECT count(*) FROM " + as_table_name + " WHERE nvl(" + as_id_colume_name + ", 0) > nvl(" + string(al_id_value) + ", 0)"+ " AND version_id = " + string(ll_Version_id)
//
//DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;
//
//PREPARE SQLSA FROM :ls_sql;
//
//OPEN DYNAMIC my_cursor ;
//
//FETCH my_cursor INTO :ll_count ;
//
//CLOSE my_cursor ;
//if ll_count > 0 then  // thay đổi version
//	return true
//end if 
//
//// Kiểm tra thay đổi status nếu cùng version.
//ls_sql =  "SELECT " + as_status_colume_name+" FROM " + as_table_name + " WHERE " + as_id_colume_name + " = " + string(al_id_value) //+ " AND company_id = " + tring(gi_user_comp_id)
//
//DECLARE my_cursor1 DYNAMIC CURSOR FOR SQLSA ;
//
//PREPARE SQLSA FROM :ls_sql;
//
//OPEN DYNAMIC my_cursor1 ;
//
//FETCH my_cursor1 INTO :ls_status ;
//
//CLOSE my_cursor1 ;
//if ls_status <> as_status_value then 
//	return true
//else 
//	return false
//end if 

ls_sql =  "SELECT version_id  FROM " + as_table_name + " WHERE nvl(" + as_id_colume_name + ", 0) = nvl(" + string(al_id_value) + ", 0)  AND company_id = " + string(gi_user_comp_id)
ls_syntax = sqlca.SyntaxFromSQL( ls_sql, '', ls_err )
IF ls_err <> '' THEN
MessageBox( 'Error...', ls_err )
RETURN true
END IF
lds_info = CREATE DataStore
lds_info.Create( ls_syntax )
lds_info.SetTransObject( sqlca)
lds_info.Retrieve( )
ll_Version_id = lds_info.getitemnumber( 1, 'version_id')
//DESTROY lds_info
if isnull(ll_Version_id) then ll_Version_id = 0 

ls_sql =  "SELECT * FROM " + as_table_name + " WHERE nvl(" + as_id_colume_name + ", 0) > nvl(" + string(al_id_value) + ", 0)"+ " AND version_id = " + string(ll_Version_id)
ls_syntax = sqlca.SyntaxFromSQL( ls_sql, '', ls_err )
IF ls_err <> '' THEN
MessageBox( 'Error...', ls_err )
DESTROY lds_info
RETURN true
END IF
//lds_info = CREATE DataStore
lds_info.Create( ls_syntax )
lds_info.SetTransObject( sqlca)
lds_info.Retrieve( )
ll_count= lds_info.rowcount( )
if ll_count > 0 then  // thay đổi version
	DESTROY lds_info
	return true
end if 
ls_sql =  "SELECT " + as_status_colume_name+" FROM " + as_table_name + " WHERE " + as_id_colume_name + " = " + string(al_id_value) + " AND company_id = " + string(gi_user_comp_id)
ls_syntax = sqlca.SyntaxFromSQL( ls_sql, '', ls_err )
IF ls_err <> '' THEN
MessageBox( 'Error...', ls_err )
DESTROY lds_info
RETURN true
END IF
//lds_info = CREATE DataStore
lds_info.Create( ls_syntax )
lds_info.SetTransObject( sqlca)
ll_row= lds_info.Retrieve( )
// kiểm tra trong datastore co cot Status và kiểu dữ liệu của nó là gì và lấy giá trị của nó ra 
if ll_row > 0 then 				
			ls_colname = lds_info.describe( '#'+string(1)+'.name')
			if ls_colname ='status' then
				ls_coltype = lds_info.describe( "#"+string(1)+".coltype")
				choose case left(lower(ls_coltype), 4) 
					case 'int','long','deci','real','numb','ulon'
							ls_status =string( lds_info.getitemnumber( 1, ls_colname))
						case  "char"
							ls_status =lds_info.getitemstring( 1, ls_colname)
					end choose					
			end if			
	end if		
DESTROY lds_info
if ls_status <> as_status_value then 
	return true
else 
	return false
end if 
end event

event e_postmodify;//-- Set focus và goi object điều khiển action --//

int				li_rtn

li_rtn = ic_obj_handling.dynamic event e_window( 'e_postmodify')
if li_rtn = -1 then 
	return -1
end if
ic_obj_handling.f_ctrl_actionbuttons( idw_focus)
this.event e_display_actionbutton( )
return idw_focus.setfocus( )
end event

event e_display_actionbutton;tab_action.event e_display_actionpane( )
return 1
end event

event e_saveclose;//-- Lưu dữ liệu và đóng window, return 1 ok, -1 lỗi --//
int li_rtn
t_dw_mpl		ldw_main
/*
li_rtn = this.event e_save( )
if li_rtn = -1 then return -1
//-- close edit --//
if ic_obj_handling.dynamic f_is_changed_dwo_4edit()  then
	ldw_main = this.f_get_dwmain( )
	if isvalid(ldw_main) then
		ldw_main.f_close_edit()
	else
		return -1
	end if		
	
	this.event e_filteron_new( )
	//-- set lại filter data nếu có--//
	this.f_filter_dwmain_new( )	
//	if isvalid(ic_obj_handling.ids_filter_data) then
//		dw_filter.setitem(1,'filter_string', ic_obj_handling.is_dwmain_filter)
//		this.f_filter_dwmain_new( )
//		if ic_obj_handling.ids_filter_data.rowcount() > 0 then			
//			ic_obj_handling.ids_filter_data.rowscopy( 1, 1, Primary!, dw_filter, 1, Primary!)	
//			this.f_filter_dwmain_new( )
//		end if
//	end if
	 ic_obj_handling.event e_window( 'e_saveclose')
end if
*/
return li_rtn
end event

on s_w_main.create
int iCurrent
call super::create
this.st_1=create st_1
this.tab_action=create tab_action
this.gb_filter=create gb_filter
this.dw_filter=create dw_filter
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.tab_action
this.Control[iCurrent+3]=this.gb_filter
this.Control[iCurrent+4]=this.dw_filter
end on

on s_w_main.destroy
call super::destroy
destroy(this.st_1)
destroy(this.tab_action)
destroy(this.gb_filter)
destroy(this.dw_filter)
end on

event open;/*******************************************************
Chức năng:
	- Tạo object chính
	- Gọi control action pane
	- gọi pre-open
	- gọi post-open: chỉ chạy e_postopen khi mở window thành công
------------------------------------------------------------------------------------------------*/

int 						li_rtn, li_width, li_height
string						ls_object, ls_parm, las_parm[], ls_display_model, ls_menu_code, ls_menu_text
window					lw_requester
c_obj_service			lc_obj_service
s_str_dw_md			lastr_dw_md_empty[]
s_str_dw_ms			lastr_dw_ms_empty[]
s_str_dwo_related		lstr_data_related[]	
datawindow				ldw_empty[]
c_menu_item			lc_menu_item

ib_opening = true
//-- Tạo connection voi database --//
it_transaction = create t_transaction
it_transaction.dbms =	SQLCA.DBMS
it_transaction.ServerName	 = SQLCA.ServerName
it_transaction.LogId	 = SQLCA.LogId
it_transaction.LogPass 	 = SQLCA.LogPass 
it_transaction.AutoCommit 	 = false 
it_transaction.DBParm	 = SQLCA.DBParm
connect using	it_transaction;	

if not isnull(message.stringparm) and message.stringparm <> '' then
	ls_parm = message.stringparm	
	setnull(message.stringparm)

	lc_obj_service.f_stringtoarray(ls_parm ,";",las_parm[])
	ic_obj_main = create using las_parm[1]
	ic_obj_main.f_set_menu_id(las_parm[2])	
	ls_menu_code = lc_menu_item.f_get_menu_code_ex( double(las_parm[2]), it_transaction)
	ic_obj_main.f_set_menu_code(ls_menu_code )
	//-- init dwsetup --//
	if upper(ic_obj_main.classname( )) = 'U_VALUESET_ENTRY' then
//		ic_obj_main.idwsetup_initial.f_init_ids_setup_dw( upper(ic_obj_main.classname( )) )
//	else
		ic_obj_main.idwsetup_initial.f_init_ids_setup_dw_ex( upper(ic_obj_main.f_get_menu_code( ) ), it_transaction )
	end if
	
	if las_parm[1] <> 'u_valueset_entry' then
		this.is_win_name = las_parm[1]
	else
		this.is_win_name = las_parm[1]+las_parm[2]
	end if

	if upperbound(las_parm[]) > 2 then
		this.title = las_parm[3]				
		this.is_win_grp = las_parm[4]
		this.is_sheet_type = las_parm[4]		
	else
		this.title = lc_menu_item.f_get_menu_label_ex(double(las_parm[2]), it_transaction )
	end if
	ic_obj_main.f_init_policy_datastore_ex(it_transaction )

elseif not isnull(message.powerobjectparm ) then
	ic_obj_main = message.powerobjectparm
	setnull(message.powerobjectparm)

	ic_obj_main.f_init_policy_datastore_ex(it_transaction )
	ls_menu_text = lc_menu_item.f_get_menu_label_ex(ic_obj_main.classname( ) ,it_transaction)
	if ls_menu_text <> '' then
		this.title  = ls_menu_text
	else
		this.title = ic_obj_main.is_object_title
	end if
	this.is_win_name = ic_obj_main.is_win_name
	this.is_win_grp = ic_obj_main.is_win_grp
	this.is_sheet_type = ic_obj_main.is_sheet_type
	
	//-- init dwsetup --//
	if upper(ic_obj_main.classname( )) = 'U_VALUESET_ENTRY' then
//		ic_obj_main.idwsetup_initial.f_init_ids_setup_dw( upper(ic_obj_main.classname( )) )
//	else
		ic_obj_main.idwsetup_initial.f_init_ids_setup_dw_ex( upper(ic_obj_main.f_get_menu_code( ) ), it_transaction )
	end if	
end if

is_popmenu = 'm_setup_user_access;m_edit_window_label;'
//-- create main object --//
lw_requester = this
ic_obj_main.dynamic f_set_wdisplay(lw_requester)

//-- ghi nhớ menu_id của window được open --//
ic_obj_handling = ic_obj_main

//-- pre-open : resize nội bộ đối tượng hoặc window display--//
this.f_set_resize( )  
li_rtn = this.event e_preopen( ) 
if li_rtn = -1 then return -1

//-- tao actionpane --//
if ic_obj_handling.dynamic f_create_actionpane(tab_action) = -1 then return -1


//-- gán dwo cho dw cùa window --//
iastr_dw_ms = lastr_dw_ms_empty[]
iastr_dw_md = lastr_dw_md_empty[]
this.iwdw_detail[]  = ldw_empty[]
this.iwdw_share[] = ldw_empty[]
this.iadw_none_md[] = ldw_empty[]
this.f_set_dwo( )

//-- tao tabpage detail nếu có --//
if ic_obj_handling.dynamic f_create_tabpage() = -1 then return -1

//-- set master detail share --//
this.f_arrange_dwdetail( this.iwdw_detail[] )
this.f_arrage_dwshared( this.iwdw_share[] )
this.f_set_md_ms()

//-- set record security --//
this.f_set_record_security_ex( it_transaction )

//-- thông báo đến object : add where cua object nếu có--//
li_rtn = ic_obj_handling.event e_window( 'open')
if li_rtn = -1 then 
	return -1
end if
//-- resize --//
ic_obj_handling.f_get_resize_wdisplay(li_width ,li_height)
if li_width > 0 and li_height > 0 then
	this.width = li_width
	this.height = li_height
end if

//-- post open --//
if li_rtn <> -1 then this.post event e_postopen(li_rtn )

end event

event closequery;
string					ls_object
int						li_response
c_string				lc_string

if this.enabled = false then return 1 //-- khi đang open window child ko được đóng win parent --//

//-- kiểm tra tình trạng edit --//
if idw_focus.dynamic f_get_ib_editing() then
	li_response = gf_messagebox('m.s_w_main.closequery.01','Xác nhận lưu','Bạn có muốn lưu dữ liệu đang soạn thảo không?','question', 'yesnocancel',1)
	if  li_response = 1 then
		if this.event e_save( ) = -1 then
			return 1
		end if
	elseif li_response = 2 then
		close(this)
	else
		return 1
	end if
end if

//-- đóng window child trở về window cha --//
if this.ib_child and this.windowtype <> response! then
	if isvalid(this.iw_parent) then 
		this.iw_parent.enabled = true
		this.iw_parent.windowstate = Maximized!
	end if
end if

//-- Cập nhật picture index cua menu --//
//if not this.ib_child then
//	t_w_menu.f_change_pic_idx(ic_obj_main, 'close')
//end if

//-- xoa biến is_mainobject --//
//ls_object = ic_obj_main.f_get_menu_code( )
//if ls_object<> '' and not isnull(ls_object) then
//	t_w_mdi.is_menu_code = lc_string.f_globalreplace( t_w_mdi.is_menu_code, ic_obj_main.f_get_menu_code( ) +";" , "")
//end if

//connect using it_transaction;
li_response = ic_obj_handling.dynamic event e_window_closequery()

//-- release resource --//
disconnect using it_transaction;
destroy it_transaction

//if li_response = 0 then
//	destroy this.ic_obj_main
//end if
//
ib_closing = true
return 0
end event

event resize;string		ls_display_model

if ib_closing then return
//if sizetype = 0 and this.ib_opening and not this.ib_child then return

//-- resize tab action --//
this.event e_resize_tab_action(newwidth, newheight)

//-- resize filter --//
if gb_filter.visible then
	this.event e_filter_resize( )
end if

if isvalid(ic_obj_handling) then
	ls_display_model = ic_obj_handling.dynamic f_get_display_model()
	this.ii_resize_width = newwidth
	this.ii_resize_height = newheight
	this.post f_resize(ls_display_model )	
	this.f_set_visible_ctrl(ls_display_model)
end if
end event

event activate;call super::activate;
int							li_cnt
s_object_display		lod_main
t_dw_mpl				ldw_main
s_str_dwo_related		lstr_data_related[]


lod_main = this.ic_obj_handling.f_get_main_object( )
if isvalid(lod_main) and not this.ib_opening then
	if lod_main.classname() <> ic_obj_handling.classname( ) AND not ic_obj_handling.ib_copying then
		li_cnt = ic_obj_handling.f_get_data_related(  lstr_data_related[])		
		if li_cnt = 1 then
			this.title = lstr_data_related[1].s_text
			ldw_main =  this.f_get_dwmain( )
			if isvalid(ldw_main) then
//				if ic_obj_handling.classname() = 'c_valueset' then
//					ldw_main.ib_rebuild_relationwhere = false
//				else
					ldw_main.ib_rebuild_relationwhere = true
//				end if
				this.event e_refresh( )
			end if		
		end if
	end if
end if


ic_obj_handling.event e_window_activate()
end event

event e_postopen_child;call super::e_postopen_child;int			li_rtn

//-- thông báo đến object --//
li_rtn = ic_obj_handling.event e_window( 'e_postopen_child')
if li_rtn = -1 then 
	return -1
end if
end event

event e_querying;call super::e_querying;
return this.event e_query( )
end event

event mousemove;call super::mousemove;
if flags = 1 then
	dw_filter.ib_mousemoving = true
end if
end event

event mouseup;call super::mouseup;
dw_filter.ib_mousemoving = false

end event

event deactivate;call super::deactivate;int							li_cnt, li_idx, li_rtn

s_object_display		lod_relation[]
s_str_dwo_related		lstr_data_related[],lstr_related[]

if isvalid(ic_obj_handling) and not ib_closing and not ib_object_changing then
	li_cnt = ic_obj_handling.f_get_related_object( lod_relation[])
	FOR li_idx = 1 to li_cnt
		li_rtn = ic_obj_handling.f_get_data_related( lod_relation[li_idx].classname(), lstr_data_related[])
		if li_rtn = 0 then
			//-- xem lại khai báo đối tương liên quan trên object--//
			gf_messagebox('m.s_w_main.deactive.01','Thông báo','Không tìm thấy struct đối tượng liên quan','exclamation','ok',1)
			return -1
		end if	
		this.f_build_data_related( lstr_data_related[])
		lod_relation[li_idx].f_set_data_related(lstr_data_related[])				
	NEXT
elseif ib_closing then
	destroy ic_obj_handling
end if

ib_object_changing = false
end event

event close;call super::close;t_w_mdi.p_1.setredraw(false)
t_w_mdi.post f_resize_logo()

ic_obj_handling.event e_window_close()
return 0
end event

event e_firstpage;call super::e_firstpage;ic_obj_handling.event e_window( 'e_firstpage')
return 0
end event

event e_nextpage;call super::e_nextpage;ic_obj_handling.event e_window( 'e_nextpage')
return 0
end event

event e_previouspage;call super::e_previouspage;ic_obj_handling.event e_window( 'e_previouspage')
return 0
end event

event e_lastpage;call super::e_lastpage;ic_obj_handling.event e_window( 'e_lastpage')
return 0
end event

type st_1 from t_st within s_w_main
integer x = 32
integer y = 712
integer height = 108
boolean italic = true
long textcolor = 0
long backcolor = 134217752
string text = ""
end type

type tab_action from t_t within s_w_main
event type integer e_ctrl_actionbutton ( )
event type integer e_display_actionpane ( )
event type integer e_ctrl_action_edit ( ref s_str_actionpane rstr_actionpane,  t_dw_action_pane vdw_actionpane )
event type integer e_ctrl_action_manage ( ref s_str_actionpane rstr_actionpane,  t_dw_action_pane vdw_actionpane )
event type integer e_ctrl_action_related_object ( ref s_str_actionpane rstr_actionpane,  t_dw_action_pane vdw_actionpane )
event type integer e_change_actionpane ( s_object_display vod_changed_objname )
event type integer e_ctrl_action_related_report ( ref s_str_actionpane rstr_actionpane,  t_dw_action_pane vdw_actionpane )
event type integer e_ctrl_action_policy ( t_dw_action_pane vdw_actionpane,  ref s_str_actionpane rstr_actionpane )
integer x = 256
integer y = 92
integer width = 3127
integer height = 400
integer taborder = 10
integer weight = 0
integer selectedtab = 0
end type

event type integer e_ctrl_actionbutton();/********************************************************************
chức năng: Kết hợp phân quyền và buttons in context (Nút hiện thị theo ngữ cảnh)
	- Phân quyền phụ thuộc DW và user object
	- Button hiện thị tuy theo ngữ cảnh thiết kế (s_str_actionpane)
============================================================*/

c_obj_service			lc_obj_service
t_dw_action_pane		ldw_actionpane
s_str_actionpane		lstr_actionpane[]
int							li_idx, li_paneCount, li_bttnCount, li_bttn_idx, li_ctrlCnt
string						las_button[]

setpointer(hourglass!)

li_paneCount = ic_obj_handling.dynamic f_get_actionpane_structure(lstr_actionpane[])	
li_ctrlCnt = upperbound( this.control)
FOR li_idx = 1 to li_ctrlCnt
	ldw_actionpane = this.control[li_idx].control[1]
	if ldw_actionpane.dataobject = 'd_action_edit' and ldw_actionpane.is_objname_handling =  ic_obj_handling.classname() then
		this.event e_ctrl_action_edit(lstr_actionpane[1],ldw_actionpane ) 
		ldw_actionpane.f_set_visible_button(lstr_actionpane[1].s_visible_buttons)
		ldw_actionpane.f_set_enabled_button(lstr_actionpane[1].s_enabled_buttons, ic_obj_handling)	
		ldw_actionpane.f_set_subbutton(lstr_actionpane[1].sa_enabled_subbutton[])
	elseif  ldw_actionpane.dataobject = 'd_action_manage'  then
		if ldw_actionpane.is_objname_handling <>  ic_obj_handling.classname()  then
			ldw_actionpane.f_set_enabled_button('', ic_obj_handling)	
		else		
			this.event e_ctrl_action_manage(lstr_actionpane[li_paneCount],ldw_actionpane )
			ldw_actionpane.f_set_visible_button(lstr_actionpane[li_paneCount].s_visible_buttons)
			ldw_actionpane.f_set_enabled_button(lstr_actionpane[li_paneCount].s_enabled_buttons, ic_obj_handling)	
		end if
	elseif  ldw_actionpane.dataobject = 'd_action_related_object' then
		if ldw_actionpane.is_objname_handling <>  ic_obj_handling.classname()  then
			ldw_actionpane.f_set_enabled_button('', ic_obj_handling)	
		else
			if li_paneCount = 3 then
				this.event e_ctrl_action_related_object(lstr_actionpane[li_paneCount -1] ,ldw_actionpane)
				ldw_actionpane.f_set_visible_button(lstr_actionpane[li_paneCount -1].s_visible_buttons)
				ldw_actionpane.f_set_enabled_button(lstr_actionpane[li_paneCount -1].s_enabled_buttons, ic_obj_handling)	
			elseif  li_paneCount = 4 then
				this.event e_ctrl_action_related_object(lstr_actionpane[li_paneCount -2] ,ldw_actionpane)
				ldw_actionpane.f_set_visible_button(lstr_actionpane[li_paneCount -2].s_visible_buttons)
				ldw_actionpane.f_set_enabled_button(lstr_actionpane[li_paneCount -2].s_enabled_buttons, ic_obj_handling)	
			end if
		end if
	elseif  ldw_actionpane.dataobject = 'd_action_related_report' and ldw_actionpane.is_objname_handling =  ic_obj_handling.classname() then
		if ldw_actionpane.is_objname_handling <>  ic_obj_handling.classname()  then
			ldw_actionpane.f_set_enabled_button('', ic_obj_handling)	
		else				
			this.event e_ctrl_action_related_report(lstr_actionpane[li_paneCount -1],ldw_actionpane )
			ldw_actionpane.f_set_visible_button(lstr_actionpane[li_paneCount -1].s_visible_buttons)
			ldw_actionpane.f_set_enabled_button(lstr_actionpane[li_paneCount -1].s_enabled_buttons, ic_obj_handling)	
		end if
	end if
NEXT

return 1
end event

event type integer e_display_actionpane();userobject			luo_tabpage

luo_tabpage = this.control[this.selectedtab]
luo_tabpage.dynamic event e_display_actionpane()

return 1
end event

event type integer e_ctrl_action_edit(ref s_str_actionpane rstr_actionpane, t_dw_action_pane vdw_actionpane);int						li_bttnCount, li_bttn_idx
string					las_button[], ls_doc_status, ls_status_str
c_string				lc_string
t_dw_mpl			ldw_main

li_bttnCount = lc_string.f_stringtoarray(rstr_actionpane.s_visible_buttons, ';', las_button[])
rstr_actionpane.s_enabled_buttons = rstr_actionpane.s_visible_buttons
//--Dời đoạn code này lên trước vì phân quyền sẽ bật các nút lên trong khi nó đã đc tắt
if idw_focus.dynamic f_get_ib_editing() = false and rstr_actionpane.s_enabled_buttons <> 'b_execquery;' then
	if not ib_querymode_on and not ib_doc_trace_on then this.event e_ctrl_action_policy( vdw_actionpane, rstr_actionpane)
end if
ldw_main = parent.dynamic f_get_dwmain()

FOR li_bttn_idx = 1 to li_bttnCount
	if ib_doc_trace_on then
		if  las_button[li_bttn_idx] <> 'b_refresh' then
			rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '')
		end if
	else
		if ldw_main.getrow( ) > 0 and (upper(ldw_main.describe("datawindow.table.updatetable")) = 'DOCUMENT' or left(parent.ic_obj_handling.classname() , 9)= 'u_detail_' ) then
			ls_doc_status = ldw_main.getitemstring( ldw_main.getrow(), 'status')
		end if
		choose case las_button[li_bttn_idx]
			case 'b_add','b_insert','b_add_multi'												
				if  idw_focus.classname( ) <> 'dw_filter' then
					
					if left(parent.ic_obj_handling.classname() , 9)= 'u_detail_' and ls_doc_status <> 'new' and ldw_main.rowcount() > 0 then
						 rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace( rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '') 
					else					
						if idw_focus.dynamic f_get_ib_insert() = false  &
							OR (idw_focus = ldw_main and  idw_focus.dynamic f_get_ib_editing() and not ldw_main.dynamic f_isgrid( ) ) &
							OR  (idw_focus.dynamic f_get_ib_detail() and not idw_focus.dynamic f_get_ib_editing() ) then // and ic_obj_handling.f_get_ib_changed_dwo_4edit( )
							 rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace( rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '') 
						end if
					end if
				else 										
					if ldw_main.dynamic f_get_ib_insert() = false then // and ic_obj_handling.f_get_ib_changed_dwo_4edit( )
						 rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace( rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '') 
					end if													
				end if
			case 'b_modify',   'b_save',  'b_savepost', 'b_saveclose'
				if idw_focus.classname() <> 'dw_filter' then
					if left(parent.ic_obj_handling.classname() , 9)= 'u_detail_' and ls_doc_status <> 'new' and ldw_main.rowcount() > 0  then
						 rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace( rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '') 
					else						
						if idw_focus.dynamic f_get_ib_editing() or  not idw_focus.dynamic f_get_ib_keyboardlocked( ) then
							if ic_obj_handling.f_get_ib_changed_dwo_4edit( ) then // or left(ic_obj_handling.classname(),9) = 'u_detail_'
								rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_saveclose;')
								rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , 'b_saveclose;')							
							else
								if pos( rstr_actionpane.s_button_name,'b_savepost;') > 0 then
									rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_savepost;')
									rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , 'b_savepost;')	
								elseif pos( rstr_actionpane.s_button_name,'b_saveclose;') > 0 then
									rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_saveclose;')
									rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , 'b_saveclose;')									
								else
									rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_save;')
									rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , 'b_save;')										
								end if
							end if
						else
							if upper(ldw_main.describe("datawindow.table.updatetable")) = 'DOCUMENT' or  upper(ldw_main.describe("datawindow.table.updatetable")) = 'HR_DUTY_HDR'  then		
								ls_status_str =  ';new;rejected;planned;req_change;'
								if idw_focus.dynamic f_get_ib_update() and  pos(ls_status_str, ';'+ls_doc_status+';') > 0 then
									rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_modify;')
									rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , 'b_modify;')
								else
									rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_modify;')
									rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '')						
								end if						
							else
								if idw_focus.dynamic f_get_ib_update() then
									rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_modify;')
									rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , 'b_modify;')
								else
									rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_modify;')
									rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '')						
								end if
							end if
						end if			
					end if
				else
					if ldw_main.dynamic f_get_ib_editing() or  not ldw_main.dynamic f_get_ib_keyboardlocked( ) then
						if ic_obj_handling.f_get_ib_changed_dwo_4edit( ) then
							rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_saveclose;')
							rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , 'b_saveclose;')							
						else
							if pos( rstr_actionpane.s_button_name,'b_savepost;') > 0 then
								rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_savepost;')
								rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , 'b_savepost;')			
							else
								rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_save;')
								rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , 'b_save;')										
							end if
						end if
					else
						if upper(ldw_main.describe("datawindow.table.updatetable")) = 'DOCUMENT' or  upper(ldw_main.describe("datawindow.table.updatetable")) = 'HR_DUTY_HDR'  then		
							ls_status_str =  ';new;rejected;planned;req_change;'
							if idw_focus.dynamic f_get_ib_update() and  pos(ls_status_str, ';'+ls_doc_status+';') > 0 then
								rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_modify;')
								rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , 'b_modify;')
							else
								rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_modify;')
								rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '')						
							end if						
						else
							if ldw_main.dynamic f_get_ib_update() then
								rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_modify;')
								rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , 'b_modify;')
							else
								rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_modify;')
								rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '')						
							end if
						end if
					end if					
					
				end if
			case 'b_delete', 'b_cancel'
				if upper(ldw_main.describe("datawindow.table.updatetable")) = 'DOCUMENT' then			
					ls_status_str =  ';new;rejected;planned;req_change;'
					if idw_focus.dynamic f_get_ib_delete() = false or pos(ls_status_str, ';'+ls_doc_status+';') = 0  then
						rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '')
					else
						if idw_focus.dataobject = ldw_main.dataobject then
							if parent.ic_obj_handling.dynamic f_get_doc_version(ldw_main) > 1 and  las_button[li_bttn_idx] = 'b_delete'  then
								rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '')	
							end if
						end if
						if idw_focus.dynamic f_get_ib_editing() and  las_button[li_bttn_idx] = 'b_cancel'  then
							rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '')
						end if
					end if		
				else	
					if left(parent.ic_obj_handling.classname() , 9)= 'u_detail_' and ls_doc_status <> 'new' and ldw_main.rowcount() > 0  then
						 rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace( rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '') 
					else							
						if idw_focus.dynamic f_get_ib_delete() = false  then
							rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '')
						end if				
					end if
				end if
			case 'b_refresh'
				if idw_focus.dynamic f_get_ib_query() = false  and idw_focus.classname( ) <> 'dw_filter' or idw_focus.dynamic f_get_ib_editing()  then
					rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '')
				end if					
			case 'b_completed'
				if upper(ldw_main.describe("datawindow.table.updatetable")) = 'DOCUMENT'   then			
					ls_status_str =  ';new;rejected;planned;req_change;'
					if idw_focus.dynamic f_get_ib_update() and  pos(ls_status_str, ';'+ls_doc_status+';') > 0 then
						rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_completed;')
						rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , 'b_completed;')
					else
						rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_completed;')
						rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '')						
					end if						
				else
					if idw_focus.dynamic f_get_ib_update() then
						rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_completed;')
						rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , 'b_completed;')
					else
						rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_completed;')
						rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '')						
					end if
				end if			
			case 'b_lose'
				if upper(ldw_main.describe("datawindow.table.updatetable")) = 'DOCUMENT'   then		
					ls_status_str =  ';new;rejected;planned;req_change;'
					if idw_focus.dynamic f_get_ib_update() and  pos(ls_status_str, ';'+ls_doc_status+';') > 0 then
						rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_lose;')
						rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , 'b_lose;')
					else
						rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_lose;')
						rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '')						
					end if						
				else
					if idw_focus.dynamic f_get_ib_update() then
						rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_lose;')
						rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , 'b_lose;')
					else
						rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_lose;')
						rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '')						
					end if
				end if											
			case 'b_filteron','b_filteroff'
				if idw_focus.dynamic f_get_ib_editing() then
					rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , '')
					rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace( rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '')			
					rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , '')
					rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace( rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '')									
				else
					if parent.ib_filter_on then
						rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_filteroff;')
						rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace( rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , 'b_filteroff;')
					else
						rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_filteron;')
						rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace( rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , 'b_filteron;')						
					end if
				end if
			case 'b_send_2_approve', 'b_request_2_change'
				if idw_focus.dynamic f_get_ib_editing() then
					rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '')
				else					
					if upper(ldw_main.describe("datawindow.table.updatetable")) = 'DOCUMENT' then
						
						if upper(ls_doc_status) = 'NEW' OR upper(ls_doc_status) = 'REQ_CHANGE' OR upper(ls_doc_status) = 'REJECTED' then
							rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_send_2_approve;')
							rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , 'b_send_2_approve;')
							rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , 'b_send_2_approve;')
						elseif upper(ls_doc_status) = 'APPROVED' then
							rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_request_2_change;')
							rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , 'b_request_2_change;')
						else
							rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '')
						end if		
					end if
				end if
			case 'b_approve','b_reject'
				if idw_focus.dynamic f_get_ib_editing() then
					rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , '')
					rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '')
				else					
					if upper(ldw_main.describe("datawindow.table.updatetable")) = 'DOCUMENT' then					
						if upper(ls_doc_status) <> 'REQ_APPROVE'  then
							rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , '')
							rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '')
						end if		
					end if
				end if				
			case 'b_post','b_unpost'
				if idw_focus.dynamic f_get_ib_editing() = false and idw_focus.dynamic f_get_ib_keyboardlocked( ) then
					if pos('INVOICED;PAID;PARTIAL_PAID;PARTIAL_INVOICED;BOOKED;ACCOUNTED;SETTLED;PARTIAL_SETTLED;',upper(ls_doc_status)) > 0 then
						rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_unpost;')
						rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , 'b_unpost;')
					elseif pos('BOOKING;',upper(ls_doc_status)) > 0 then
						rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_post;')
						rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '')						
					else
						rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_post;')
						rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , 'b_post;')
					end if					
				else
					rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , '')
					rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '')					
				end if	
			case 'b_auto_download','b_stop_download'
				if upper(ls_doc_status) = 'A' then
					rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_stop_download;')
					rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , 'b_stop_download;')
				else
					rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_auto_download;')
					rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , 'b_auto_download;')
				end if					
			case 'b_finished', 'b_detail','b_total_disc' //-- ko làm gì hết--//
				
			case else
				if idw_focus.dynamic f_get_ib_editing() then
					if pos("b_okclose;b_close;",  las_button[li_bttn_idx]+';') > 0 then
						//-- do nothing--//
					elseif pos("b_amortize;b_depreciate;",  las_button[li_bttn_idx]+';') = 0 then
						rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '')
					end if
				else
					if pos("b_amortize;b_depreciate;",  las_button[li_bttn_idx]+';') > 0 then
						rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , '')
					end if					
				end if
		end choose
	end if
NEXT

return 1
end event

event type integer e_ctrl_action_manage(ref s_str_actionpane rstr_actionpane, t_dw_action_pane vdw_actionpane);c_string				lc_string
string					las_button[]
int						li_bttn_idx, li_bttnCount

rstr_actionpane.s_enabled_buttons = rstr_actionpane.s_visible_buttons
li_bttnCount = lc_string.f_stringtoarray(rstr_actionpane.s_visible_buttons, ';', las_button[])
FOR li_bttn_idx = 1 to li_bttnCount
	choose case las_button[li_bttn_idx]			
		case 'b_doc_trace_on', 'b_doc_trace_off'	
				if parent.ib_doc_trace_on then
					rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace(rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_doc_trace_off;')
					rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace( rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , 'b_doc_trace_off;')
				else
					rstr_actionpane.s_visible_buttons = lc_string.f_globalreplace( rstr_actionpane.s_visible_buttons, las_button[li_bttn_idx]+';' , 'b_doc_trace_on;')
					rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, las_button[li_bttn_idx]+';' , 'b_doc_trace_on;')							
				end if
	end choose
NEXT

if not ib_querymode_on then this.event e_ctrl_action_policy( vdw_actionpane, rstr_actionpane)

return 1
end event

event type integer e_ctrl_action_related_object(ref s_str_actionpane rstr_actionpane, t_dw_action_pane vdw_actionpane);
rstr_actionpane.s_enabled_buttons = rstr_actionpane.s_visible_buttons
if not ib_querymode_on then this.event e_ctrl_action_policy( vdw_actionpane, rstr_actionpane)

return 1
end event

event type integer e_change_actionpane(s_object_display vod_changed_objname);
s_str_actionpane		lstr_actionpane[]
s_tp_actionpane		ltp_actionpane, latp_actionpane[]
int							li_cnt

li_cnt = vod_changed_objname.f_get_tp_actionpane(latp_actionpane[])

//vod_changed_objname.dynamic f_get_actionpane_structure(lstr_actionpane[])
if  li_cnt= 2 then
	//-- manage --//
	ltp_actionpane = this.control[upperbound(this.control)]
	ltp_actionpane.f_set_actionpane_structure(latp_actionpane[2].istr_actionpane)	
	ltp_actionpane.f_set_actionpane(upperbound(this.control))
	//-- close tab nếu có --//
elseif li_cnt = 3 then
	//-- close tab nếu tab thứ 3 từ phải qua không phải là edit_action --//
	if upperbound(this.control) > 4 then
		ltp_actionpane = this.control[upperbound(this.control) - 2]
		if ltp_actionpane.istr_actionpane.s_dwo_action <> latp_actionpane[1].istr_actionpane.s_dwo_action then
			this.closetab(ltp_actionpane )
		end if
	end if	
	//-- manage --//
	ltp_actionpane = this.control[upperbound(this.control)]
	ltp_actionpane.f_set_actionpane_structure(latp_actionpane[3].istr_actionpane)	
	ltp_actionpane.f_set_actionpane(upperbound(this.control))	
	//-- related object --//
	ltp_actionpane = this.control[upperbound(this.control) -1 ]
	ltp_actionpane.f_set_actionpane_structure(latp_actionpane[2].istr_actionpane)
	ltp_actionpane.f_set_actionpane(upperbound(this.control) -1)

elseif li_cnt = 4 then
	//-- manage --//
	ltp_actionpane = this.control[upperbound(this.control)]
	ltp_actionpane.dynamic f_set_actionpane_structure(latp_actionpane[4].istr_actionpane)	
	ltp_actionpane.dynamic f_set_actionpane(upperbound(this.control))		
	//-- related object --//
	ltp_actionpane = this.control[upperbound(this.control) -1 ]
	ltp_actionpane.f_set_actionpane_structure(latp_actionpane[3].istr_actionpane)
	ltp_actionpane.f_set_actionpane(upperbound(this.control) -1)				
	//-- related report --//
	ltp_actionpane = this.control[upperbound(this.control) -2 ]
	ltp_actionpane.f_set_actionpane_structure(latp_actionpane[2].istr_actionpane)
	ltp_actionpane.f_set_actionpane(upperbound(this.control) -2)		

end if

return 1
end event

event type integer e_ctrl_action_related_report(ref s_str_actionpane rstr_actionpane, t_dw_action_pane vdw_actionpane);
if not idw_focus.dynamic f_get_ib_editing() then
	rstr_actionpane.s_enabled_buttons = rstr_actionpane.s_visible_buttons
	if not ib_querymode_on then this.event e_ctrl_action_policy( vdw_actionpane, rstr_actionpane)
end if

return 1
end event

event type integer e_ctrl_action_policy(t_dw_action_pane vdw_actionpane, ref s_str_actionpane rstr_actionpane);string					ls_idKey_code[], ls_bttn_name
int						li_idx, li_rtn, li_idx2

s_str_policy_attr 	lstr_rule_attr[], lstr_security_attr[]
c_string				lc_string

li_rtn = ic_obj_handling.f_get_dw_policy_attr( vdw_actionpane, lstr_rule_attr[], lstr_security_attr[], ls_idKey_code[])
if li_rtn = -1 then return -1
FOR li_idx = 1 to li_rtn
	ls_bttn_name = mid(ls_idKey_code[li_idx], lc_string.f_pos_ex( ls_idKey_code[li_idx],'.', 2)+1)
	if lstr_security_attr[li_idx].b_access and lstr_rule_attr[li_idx].b_access then
		if pos(rstr_actionpane.s_enabled_buttons,ls_bttn_name+';') = 0 then
			rstr_actionpane.s_enabled_buttons += ls_bttn_name+';'
		end if					
	else
		rstr_actionpane.s_enabled_buttons = lc_string.f_globalreplace(rstr_actionpane.s_enabled_buttons, ls_bttn_name+';', '')
		FOR li_idx2 = 1 to upperbound(rstr_actionpane.sa_enabled_subbutton[])
			rstr_actionpane.sa_enabled_subbutton[li_idx2] = lc_string.f_globalreplace(rstr_actionpane.sa_enabled_subbutton[li_idx2], ls_bttn_name+';', '')	
		NEXT
	end if	
NEXT
return 1

end event

event selectionchanged;call super::selectionchanged;s_tp_actionpane		ltp_actionpane
s_str_actionpane		lstr_actionpane

//-- kiem tra object --//
if this.ib_tabpage_creating then 
	this.ib_tabpage_creating = false
	return
end if
ltp_actionpane = this.control[newindex]
lstr_actionpane = ltp_actionpane.f_get_actionpane_structure()
ltp_actionpane.event e_display_actionpane()



end event

event e_init_tabpages;call super::e_init_tabpages;int						li_idx,li_cnt, li_tabpagecnt, li_edit_tp_idx
s_str_actionpane	lstr_actionpane
s_object_display	lod_handle
s_tp_actionpane	ltp_actionpane

li_cnt = upperbound(ruo_tabpage[])
li_tabpagecnt = upperbound(this.control) 
if li_tabpagecnt = 0 then
	FOR li_idx = 1 to li_cnt
		lstr_actionpane = ruo_tabpage[li_idx].dynamic f_get_actionpane_structure()
		lstr_actionpane.i_tp_index = li_idx
		if ic_obj_handling.classname( ) = lstr_actionpane.s_objname_handling and lstr_actionpane.s_dwo_action = 'd_action_edit' then
			ic_obj_handling.ii_tp_index = li_idx
		end if
		this.opentabwithparm(ruo_tabpage[li_idx], lstr_actionpane, li_idx)	
		this.ib_tabpage_creating = true
		if li_idx > 1 then this.selecttab(li_idx )		
	NEXT	
	this.ib_tabpage_creating = true
	return this.selecttab(1)
else
	lstr_actionpane = ruo_tabpage[1].dynamic f_get_actionpane_structure()
	if li_tabpagecnt > 1 then
		FOR li_idx = li_tabpagecnt -1 to 1 step -1
			ltp_actionpane = this.control[li_idx]
			if ltp_actionpane.istr_actionpane.s_dwo_action = 'd_action_edit' then exit
		NEXT
	else 
		li_idx = 1
	end if
	//-- khởi tạo tab edit action --//
	lstr_actionpane.i_tp_index = li_idx +1 // upperbound(this.control) -1
	this.opentabwithparm( ruo_tabpage[1], lstr_actionpane , li_idx +1 ) // upperbound(this.control) -1
	this.ib_tabpage_creating = true
	if this.selecttab(li_idx +1) = 1 then return 0	//upperbound(this.control) -2
	//-- khởi tao tab related report nếu đối tượng mới có, nhưng đồi tượng cũ ko có--//
	if li_cnt = 4 then
		ltp_actionpane = this.control[li_idx +2]
		lstr_actionpane = ruo_tabpage[2].dynamic f_get_actionpane_structure()
		if ltp_actionpane.istr_actionpane.s_dwo_action <> lstr_actionpane.s_dwo_action then
			lstr_actionpane.i_tp_index = li_idx +2
			this.opentabwithparm(ruo_tabpage[2], lstr_actionpane,  li_idx +2)	
			this.ib_tabpage_creating = true
			this.selecttab(li_idx +2)
		end if
	end if
	
	//-- tìm đối tượng đã khởi tạo --//
	if ic_obj_handling.f_find_object(lod_handle, lstr_actionpane.s_objname_handling, lstr_actionpane.i_tp_index)  = 0 then
		gf_messagebox('m.s_w_main.tab_action.e_init_tabpages.01','Thông báo','Không tìm thấy đối tượng khởi tạo','exclamation','ok',1)
		return 0
	end if	
	
	return this.event e_change_actionpane(lod_handle)
end if
end event

event rightclicked;call super::rightclicked;t_m_popup_object		lm_popup
s_tp_actionpane		ltp_actionpane_cur, ltp_actionpane_change
s_str_actionpane		lstr_actionpane
s_object_display		lpo_close, lpo_change, lpo_related[], lpo_rearrange_related[]
c_obj_service			lc_obj_service
int							li_rtn, li_idx,li_response
boolean					lb_start_arrange
string						ls_objname

if index < 2 or index > upperbound(this.control) - 2 then return

ltp_actionpane_cur =  this.control[index]
lstr_actionpane = ltp_actionpane_cur.f_get_actionpane_structure( )
lm_popup = create	t_m_popup_object
lm_popup.is_show_menu = 'm_close_object'

lm_popup.is_object_name = lstr_actionpane.s_objname_handling
LM_POPUP.IPO_CLICKED = THIS 

//-- Thông báo cho object popup --//
li_rtn = parent.f_send_message_to_object(lm_popup, 'popup')
if li_rtn = -1 then 
	destroy lm_popup
	return -1
end if

//-- show popup menu --//
lm_popup.popmenu( t_w_mdi.pointerX() , t_w_mdi.pointerY() )
if lm_popup.is_clicked_menu =  'm_close_object' then

	//-- kiểm tra tình trạng edit --//
	if idw_focus.dynamic f_get_ib_editing() then
		li_response = gf_messagebox('m.s_w_main.tab_action.rightclicked.01','Xác nhận lưu','Bạn có muốn lưu dữ liệu đang soạn thảo không?','question', 'yesnocancel',1)
		if  li_response = 1 then
			if parent.event e_save( ) = -1 then
				return 1
			end if
		elseif li_response = 3 then
			return 1
		else
			idw_focus.dynamic event e_rollback_modify( )
		end if
	end if
	ic_obj_handling.f_close_object(lstr_actionpane.s_objname_handling ,index)

end if

end event

event selectionchanging;call super::selectionchanging;s_tp_actionpane		ltp_actionpane, ltp_actionpane_old, latp_actionpane[]
s_str_actionpane		lstr_actionpane
s_str_dwo_related		lstr_data_related[]
s_object_display		lpo_change, lpo_main
t_dw_mpl				ldw_focus
string						ls_main_dwo, ls_bttn_name, ls_enabled
int							li_answer, li_cnt

ltp_actionpane = this.control[newindex]
lstr_actionpane = ltp_actionpane.f_get_actionpane_structure()

if  lstr_actionpane.s_objname_handling <> ic_obj_handling.classname( ) &
	OR (lstr_actionpane.s_objname_handling = ic_obj_handling.classname( )  and lstr_actionpane.s_dwo_action = 'd_action_edit' and lstr_actionpane.i_tp_index <> ic_obj_handling.ii_tp_index) then
	
	//-- Xác nhận lưu --//
//	ldw_focus = parent.f_get_idwfocus( )
//	if ldw_focus.f_get_ib_editing() then
//		li_answer = gf_messagebox('m.s_w_main.tab_action.selectionchaging.01','Xác nhận','Phải lưu dữ liệu trước khi chuyển đối tượng liên quan','exclamation','ok',1)
//		if li_answer = 1 then
//			if parent.event e_save( ) = -1 then
//				return 1
//			end if
//		end if
//	end if
	
	
	if not this.ib_tabpage_creating then
		//-- tìm đối tượng liên quan đã khởi tạo --//
		if ic_obj_handling.f_find_object(lpo_change, lstr_actionpane.s_objname_handling, newindex)  = 0 then
			gf_messagebox('m.s_w_main.tab_action.selectionchaging.02','Thông báo','Không tìm thấy đối tượng liên quan','exclamation','ok',1)
			return 1
		end if
		
		//-- kiểm tra nút in chứng từ --//
		if lpo_change.classname( ) = 'b_view' then
			ls_main_dwo = lpo_change.f_get_main_dwo( )
			ls_bttn_name = 'b_view_'+ mid(ls_main_dwo,4, len(ls_main_dwo) - 8)
			ltp_actionpane_old = this.control[oldindex]
			ls_enabled = '1'
			//-- tạm thời không kiểm tra, vì các nút in khi đưa vào has_sub thì luôn luôn có enabled = 0--//
//			ls_enabled = ltp_actionpane_old.dw_action.describe( ls_bttn_name+'.enabled')
			if ls_enabled = '0' then
				gf_messagebox('m.s_w_main.tab_action.selectionchaging.02','Thông báo','Chứng từ không được phép in','exclamation','ok',1)
				return 1
			end if		
		end if
		//-- tạo thêm tab action nếu cần --//
		li_cnt = lpo_change.f_get_tp_actionpane(latp_actionpane[] )
		if li_cnt = 4 then
			ltp_actionpane = this.control[upperbound(this.control) -2]
			if ltp_actionpane.istr_actionpane.s_dwo_action = 'd_action_edit' then
				latp_actionpane[2].istr_actionpane.i_tp_index = upperbound(this.control) - 1
				this.opentabwithparm(latp_actionpane[2], latp_actionpane[2].istr_actionpane,  latp_actionpane[2].istr_actionpane.i_tp_index  )
				this.ib_tabpage_creating = true
				this.selecttab(latp_actionpane[2].istr_actionpane.i_tp_index)				
			end if
		end if
	
		//-- chuyen actionpane --//
		this.event e_change_actionpane(lpo_change)
		
		//-- Chuyen object --//
		if not this.ib_tabpage_creating then parent.event e_change_object(lpo_change )
	end if
end if

end event

type gb_filter from t_gb within s_w_main
integer x = 375
integer y = 712
integer width = 201
integer height = 200
integer taborder = 20
integer weight = 0
boolean italic = true
long backcolor = 553648127
string text = "Lọc"
end type

type dw_filter from t_dw_mpl within s_w_main
integer x = 1294
integer y = 652
integer height = 192
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_filter_form"
boolean hscrollbar = false
boolean vscrollbar = false
boolean hsplitscroll = false
boolean ib_query = true
end type

event clicked;//-- Override--//
end event

event e_dwnkey;//-- override --//
s_w_main				lw_display
s_object_display		lod_handle
t_dw_mpl					ldw_main
t_dw_action_pane			ldw_actionpane
boolean					lb_querymode

if key= keyEnter!  or key = keytab! then
	lb_querymode = inv_QueryMode.f_GetEnabled()
	If lb_querymode Then
		Send(Handle(this),256,9,Long(0,0))
		RETURN 1
	End if
	this.f_getparentwindow( lw_display)
	lod_handle = lw_display.f_get_obj_handling( )
	if lod_handle.classname() = 'u_valueset' and key= keyEnter! then
		lod_handle.event e_window_e_okclose( )
		return 1
	elseif key= keyEnter! then
		this.accepttext()
		parent.f_filter_dwmain_new( )
		return 1
	end if	
elseif  key= KeyDownArrow! or key = KeyUPArrow! then
	if this.classname( ) = 'dw_filter' then
		this.f_getparentwindow( lw_display)
		lod_handle = lw_display.f_get_obj_handling( )
		if lod_handle.classname() = 'u_valueset' then	
			ldw_main = lw_display.f_get_dwmain( )
			if  key= KeyDownArrow! then
				ldw_main.scrollnextrow( )
			elseif key = KeyUPArrow! then
				ldw_main.scrollpriorrow( )
			end if
			return 1
		end if	
	end if
elseif key=keyF5! then
	if this.f_getparentwindow(lw_display) = 1 then
		if lw_display.dynamic f_get_dw_actionpane('d_action_edit',ldw_actionpane) = 1 then
			if ldw_actionpane.dynamic f_is_button_active('b_refresh') then
				lw_display.dynamic event e_refresh( )
			end if
		end if
	end if
	return	 1		
elseif key=keyS! and keyflags = 2 then
	if this.f_getparentwindow(lw_display) = 1 then
		if lw_display.dynamic f_get_dw_actionpane('d_action_edit',ldw_actionpane) = 1 then
			if ldw_actionpane.dynamic f_is_button_active('b_save') then
				lw_display.dynamic event e_save( )
			elseif  ldw_actionpane.dynamic f_is_button_active('b_saveclose') then
				lw_display.dynamic event e_saveclose( )
			end if
		end if
	end if
	return 1
elseif key=keyM! and keyflags = 2 then
	if this.f_getparentwindow(lw_display) = 1 then
		if lw_display.dynamic f_get_dw_actionpane('d_action_edit',ldw_actionpane) = 1 then
			if ldw_actionpane.dynamic f_is_button_active('b_modify') then
				lw_display.dynamic event e_modify( )
			end if
		end if
	end if
	return 1
elseif key=keyN! and keyflags = 2 then
	if this.f_getparentwindow(lw_display) = 1 then
		if lw_display.dynamic f_get_dw_actionpane('d_action_edit',ldw_actionpane) = 1 then
			if ldw_actionpane.dynamic f_is_button_active('b_add') then
				lw_display.dynamic event e_add( )
			else
				lod_handle = lw_display.f_get_obj_handling( )
				if lod_handle.classname( ) = 'u_valueset' then
					if ldw_actionpane.dynamic f_is_button_active('b_new') then
						lod_handle.dynamic event e_action_new( )
					end if
				end if
			end if
		end if
	end if
	return	 1
end if	


end event

event e_dwnlbuttonup;//-- OVERRIDE--//

//-- resize column cua dw_filter neu co --//
string	ls_dwoName


if this.ib_dropdowning then return
//ls_dwoName = this.getcolumnname( )
//if ls_dwoName <> '' then this.setcolumn( ls_dwoName)

end event

event e_itemchanged;//--OVERRIDE--//


parent.is_filter_txt = data

return 0
end event

event e_vscroll;//-- OVERRIDE--//

return 1
end event

event editchanged;//-- OVERRIDe--//

if parent.ic_obj_handling.classname() = 'u_valueset' then
	parent.f_filter_dwmain_new( )
end if
end event

event getfocus;//--override --//

end event

event itemchanged;call super::itemchanged;//-- OVERRIDE --//

return event e_itemchanged(1,dwo,data)
end event

event itemerror;//-- override--//

end event

event itemfocuschanged;//--override--//
end event

event rbuttondown;//--override--//
end event

event e_losefocus;call super::e_losefocus;
return this.accepttext( )
end event

