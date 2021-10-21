$PBExportHeader$b_detail.sru
forward
global type b_detail from s_object_display
end type
end forward

global type b_detail from s_object_display
end type
global b_detail b_detail

forward prototypes
public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[])
end prototypes

public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[]);double			ldb_doc_id
window			lw_parent
datawindow	ldw_main

lw_parent = iw_display.dynamic f_getparentwindow()
ldw_main = lw_parent.dynamic f_get_dwmain()
ldb_doc_id = ldw_main.getitemnumber(ldw_main.getrow(),'id')
ra_args[1] = ldb_doc_id
return 1
end function

on b_detail.create
call super::create
end on

on b_detail.destroy
call super::destroy
end on

event constructor;call super::constructor;ib_changed_dwo_4edit = false
is_display_model = '1d'
ib_display_text = true
is_object_title = 'Xem chi tiết'

istr_actionpane[1].s_description = is_object_title
end event

event e_action_ctrl_bttn;//-- override --//

datawindow				ldw_focus
int								li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	//-- control d_action_edit --//
	FOR li_idx = 1 to upperbound(istr_actionpane[]) 
		if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
			if ldw_focus.dynamic f_get_ib_shared() then
				ldw_focus = ldw_focus.dynamic f_getdwmaster()
			end if			
			if ldw_focus.dynamic f_get_ib_detail() then
				if ib_changed_dwo_4edit then
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_close;'
					else
						istr_actionpane[li_idx].s_visible_buttons ='b_close;'
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons ='b_close;'
					else
						istr_actionpane[li_idx].s_visible_buttons ='b_close;'
					end if
				end if
			else				
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_close;'
				else
					istr_actionpane[li_idx].s_visible_buttons='b_close;'
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
			
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
			
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then				
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_open;call super::e_window_open;//int						li_width
//t_dw_mpl				ldw_main
//c_string				lc_string
//
//ldw_main = this.iw_display.f_get_dwmain( )
////-- resize window --//
//li_width = ldw_main.f_getwidth( )
//this.f_set_resize_wdisplay( min(PixelsToUnits(scr_width, XPixelsToUnits!) - 100, li_width) ,1600)
return 0
end event

event e_window_e_saveclose;call super::e_window_e_saveclose;
post close(iw_display)
return 0
end event

event e_window_closequery;call super::e_window_closequery;

t_dw_mpl			ldw_main
s_w_main			lw_parent
s_object_display 	lod_handling

boolean			lb_editing

lw_parent = iw_display.f_getparentwindow()
ldw_main = lw_parent.f_get_dwmain()
lb_editing = ldw_main.f_get_ib_editing( )

if lb_editing then
	ldw_main.f_set_ib_editing( false)
	lod_handling = lw_parent.f_get_obj_handling( )
	if lod_handling.f_is_changed_dwo_4edit() then
		ldw_main.f_close_edit_ex( )
	end if
end if
ldw_main.setfocus( )
return 0
end event

event e_dw_e_predelete;call super::e_dw_e_predelete;
//-- delete matching --//
//double		ldb_id
//int				li_cnt
//ldb_id = rpo_dw.getitemnumber(vl_currentrow , 'ID')
//
//select count(id) into :li_cnt
//from matching where f_ref_id = :ldb_id using it_transaction;
//
//if li_cnt> 0 then
//	gf_messagebox('m.b_detail.e_dw-e_predelete.01','Thông báo','Phiếu đã kết với chứng từ khác nên không xoá được','stop','ok',1)
//	return -1
//end if
//
//select count(id) into :li_cnt
//from matching where t_ref_id = :ldb_id using it_transaction;
//
//if li_cnt> 0 then
//	delete matching where t_ref_id = :ldb_id using it_transaction;
//end if
return 0
end event

