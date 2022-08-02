$PBExportHeader$s_w_multi_n_max_rb.srw
forward
global type s_w_multi_n_max_rb from s_w_multi_rb
end type
type rbb_1 from u_rbb within s_w_multi_n_max_rb
end type
end forward

global type s_w_multi_n_max_rb from s_w_multi_rb
integer width = 3081
integer height = 1860
rbb_1 rbb_1
end type
global s_w_multi_n_max_rb s_w_multi_n_max_rb

forward prototypes
public subroutine f_set_st_1_text (string vs_text, string vs_dwo_name)
public function integer f_ctrl_enable_button (t_dw_mpl vdw_focus)
end prototypes

public subroutine f_set_st_1_text (string vs_text, string vs_dwo_name);this.st_1.text = vs_text + ' '+ vs_dwo_name
end subroutine

public function integer f_ctrl_enable_button (t_dw_mpl vdw_focus);

this.ic_obj_handling.f_ctrl_enable_button( this.rbb_1, vdw_focus)
return 1
end function

on s_w_multi_n_max_rb.create
int iCurrent
call super::create
this.rbb_1=create rbb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rbb_1
end on

on s_w_multi_n_max_rb.destroy
call super::destroy
destroy(this.rbb_1)
end on

event e_resize_tab_action;rbb_1.width = vi_width

this.tab_action.move(0,0)
this.tab_action.width = 0
this.tab_action.height= rbb_1.height

end event

event open;call super::open;rbb_1.importfromxmlfile( "XmlFile2.xml")

if ic_obj_handling.f_get_ib_editing( ) then
	rbb_1.f_change_action_button( 'e_modify')
end if
end event

event activate;// overrid--// /
end event

type st_1 from s_w_multi_rb`st_1 within s_w_multi_n_max_rb
end type

type tab_action from s_w_multi_rb`tab_action within s_w_multi_n_max_rb
end type

type gb_filter from s_w_multi_rb`gb_filter within s_w_multi_n_max_rb
end type

type dw_filter from s_w_multi_rb`dw_filter within s_w_multi_n_max_rb
end type

type dw_2 from s_w_multi_rb`dw_2 within s_w_multi_n_max_rb
end type

type tab_1 from s_w_multi_rb`tab_1 within s_w_multi_n_max_rb
end type

type dw_4 from s_w_multi_rb`dw_4 within s_w_multi_n_max_rb
end type

type tv_1 from s_w_multi_rb`tv_1 within s_w_multi_n_max_rb
end type

type dw_5 from s_w_multi_rb`dw_5 within s_w_multi_n_max_rb
end type

type dw_6 from s_w_multi_rb`dw_6 within s_w_multi_n_max_rb
end type

type ddlb_1 from s_w_multi_rb`ddlb_1 within s_w_multi_n_max_rb
integer taborder = 250
end type

type ddlb_2 from s_w_multi_rb`ddlb_2 within s_w_multi_n_max_rb
integer taborder = 400
end type

type cbx_1 from s_w_multi_rb`cbx_1 within s_w_multi_n_max_rb
end type

type htb_1 from s_w_multi_rb`htb_1 within s_w_multi_n_max_rb
end type

type cbx_2 from s_w_multi_rb`cbx_2 within s_w_multi_n_max_rb
end type

type sle_1 from s_w_multi_rb`sle_1 within s_w_multi_n_max_rb
integer taborder = 460
end type

type st_2 from s_w_multi_rb`st_2 within s_w_multi_n_max_rb
end type

type gb_2 from s_w_multi_rb`gb_2 within s_w_multi_n_max_rb
end type

type gb_1 from s_w_multi_rb`gb_1 within s_w_multi_n_max_rb
end type

type gb_3 from s_w_multi_rb`gb_3 within s_w_multi_n_max_rb
end type

type gb_4 from s_w_multi_rb`gb_4 within s_w_multi_n_max_rb
end type

type gb_5 from s_w_multi_rb`gb_5 within s_w_multi_n_max_rb
end type

type gb_6 from s_w_multi_rb`gb_6 within s_w_multi_n_max_rb
end type

type gb_8 from s_w_multi_rb`gb_8 within s_w_multi_n_max_rb
end type

type gb_9 from s_w_multi_rb`gb_9 within s_w_multi_n_max_rb
end type

type gb_10 from s_w_multi_rb`gb_10 within s_w_multi_n_max_rb
integer taborder = 170
end type

type gb_11 from s_w_multi_rb`gb_11 within s_w_multi_n_max_rb
integer taborder = 330
end type

type gb_12 from s_w_multi_rb`gb_12 within s_w_multi_n_max_rb
integer taborder = 110
end type

type dw_1 from s_w_multi_rb`dw_1 within s_w_multi_n_max_rb
end type

type gb_7 from s_w_multi_rb`gb_7 within s_w_multi_n_max_rb
end type

type dw_3 from s_w_multi_rb`dw_3 within s_w_multi_n_max_rb
end type

type rb_1 from s_w_multi_rb`rb_1 within s_w_multi_n_max_rb
end type

type rb_2 from s_w_multi_rb`rb_2 within s_w_multi_n_max_rb
end type

type rb_3 from s_w_multi_rb`rb_3 within s_w_multi_n_max_rb
end type

type rbb_1 from u_rbb within s_w_multi_n_max_rb
integer x = 5
integer height = 308
boolean bringtotop = true
long backcolor = 14142144
integer builtintheme = 4
boolean hidetabheader = true
boolean #centralizedeventhandling = true
end type

event itemclicked;call super::itemclicked;int			li_rtn
choose case itemtag
	case 'e_add','e_modify','e_delete','e_save','e_first','e_next','e_prior','e_last','e_refresh'
			li_rtn = parent.triggerevent( itemtag)		
			if li_rtn = 1 then
				choose case itemtag
					case 'e_modify','e_save','e_post','e_unpost','e_add','e_insert'
						this.f_change_action_button( itemhandle, index, 0)
				end choose
			end if			
	case 'e_filter'
			if parent.ib_filter_on then
				parent.triggerevent( 'e_filteroff')
			else
				parent.triggerevent( 'e_filteron_new')
			end if
	case 'close'
		close(parent)
	case 'e_action_attach'
//		lw_active = parent.getactivesheet( )
//		if isvalid(lw_active) then
//			lod_handle = lw_active.f_get_obj_handling( )
//			lod_handle.triggerevent(itemtag )
//		end if				
	case else //-- e_change_object_appeon --//
//		lw_active = parent.getactivesheet( )
//		if isvalid(lw_active) then
//			lw_active.triggerevent(itemtag )
//		end if				
end choose

end event

