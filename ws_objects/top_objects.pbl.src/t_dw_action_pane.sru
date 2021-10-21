$PBExportHeader$t_dw_action_pane.sru
forward
global type t_dw_action_pane from t_dw
end type
end forward

global type t_dw_action_pane from t_dw
string title = "datawindow for action pane"
string is_popmenu = "m_setup_user_access;m_edit_window_label;m_edit_obj_label;"
event type integer e_display_actionbutton ( integer vi_width )
event type integer e_init_buttons ( s_str_actionpane vc_s_actionpane )
event type integer e_display_actionbutton_new ( integer vi_width )
end type
global t_dw_action_pane t_dw_action_pane

type variables

boolean		iab_bttn_visible[], iab_bttn_enable[], iab_bttn_hidden_enable[], iab_bttn_independent_data[], iab_func_enable[]
string			ias_bttn_name[], ias_bttn_hidden[], is_button_has_sub, ias_sub_button[], is_objname_handling
int				ii_bttn_visible_count

t_m_actionbutton		im_actionbutton[]
end variables

forward prototypes
public function integer f_set_visible_button (string vs_buttons)
public function boolean f_is_button_active (string vs_button_name)
public function integer f_send_message_to_object (string vs_message)
public function integer f_set_enabled_button (string vs_buttons, ref s_object_display rod_handle)
public subroutine f_set_m_actionbutton (string vs_bttn_has_sub)
public function integer f_set_subbutton (string vs_enabled_buttons[])
end prototypes

event type integer e_display_actionbutton(integer vi_width);/*********************************************
Chức năng: Hiện thị các nút theo giá trị các biến
				  - iab_bttn_visible[]
				  - iab_bttn_enable[]
				  -	ias_bttn_name[]
-------------------------------------------------------------------------------*/

int					li_idx, li_bttn_cnt, li_width_pixel, li_total_bttn_pixel, li_bttn_width, li_total_bttn, li_arrow_width,li_arrow_pixel
int					li_idx_visible, li_last_bttn1_width, li_last_bttn2_width, li_last_bttn1_idx, li_last_bttn2_idx
string				ls_modify, ls_rtn, las_empty[]
boolean			lb_show_arrow, lab_empty[]

this.setredraw( false)

li_width_pixel =  unitsToPixels(vi_width, XunitsToPixels!)
li_bttn_cnt = upperbound(ias_bttn_name[])
li_arrow_width =  integer(this.describe("b_arrow.width"))
li_arrow_pixel = unitsToPixels(li_arrow_width, XunitsToPixels!)
lb_show_arrow = false
ias_bttn_hidden[] = las_empty[]
iab_bttn_hidden_enable[] = lab_empty[]
 
FOR li_idx = 1 to li_bttn_cnt
	//-- nút khoảng trắng --//
	if ias_bttn_name[li_idx] = 'b_blank' then
		li_total_bttn+=30
		li_total_bttn_pixel += unitsToPixels(30, XunitsToPixels!) 		
		li_idx_visible++
		continue
	end if
	if lb_show_arrow then
		ls_modify += " " + ias_bttn_name[li_idx] + ".visible = false"
		//-- ghi nhớ các button bị ẩn vào biến is_bttn_hidden --//
		if iab_bttn_visible[li_idx] then
			ias_bttn_hidden[upperbound(ias_bttn_hidden)+1] = ias_bttn_name[li_idx]
			iab_bttn_hidden_enable[upperbound(iab_bttn_hidden_enable)+1] = iab_bttn_enable[li_idx]
		end if
		continue
	end if
	
	li_bttn_width = integer(this.describe( ias_bttn_name[li_idx] + ".width"))
	li_idx_visible++	
	
	if li_idx_visible = ii_bttn_visible_count - 1 then
		li_last_bttn1_width = li_bttn_width
		li_last_bttn1_idx = li_idx
		continue
	end if
	
	if li_idx_visible = ii_bttn_visible_count then
		li_last_bttn2_width = li_bttn_width
		li_last_bttn2_idx = li_idx
			
		li_bttn_width = li_last_bttn1_width + li_last_bttn2_width
		
		if li_total_bttn_pixel + unitsToPixels(li_bttn_width, XunitsToPixels!)  <= li_width_pixel and li_last_bttn1_width > 0 then
			ls_modify += " " + ias_bttn_name[li_last_bttn1_idx] + ".visible = true "
			ls_modify += " " + ias_bttn_name[li_last_bttn2_idx] + ".visible = true " 
			ls_modify += " " + ias_bttn_name[li_last_bttn1_idx] + ".enabled = " + string(iab_bttn_enable[li_last_bttn1_idx])		
			ls_modify += " " + ias_bttn_name[li_last_bttn2_idx] + ".enabled = " + string(iab_bttn_enable[li_last_bttn2_idx])	
			ls_modify +=" " + ias_bttn_name[li_last_bttn1_idx] + ".x = " + string(vi_width - li_bttn_width)		
			ls_modify +=" " + ias_bttn_name[li_last_bttn2_idx] + ".x = " + string(vi_width - li_last_bttn2_width)	
			ls_modify += " b_arrow.visible = false"
			continue
		elseif li_last_bttn1_width > 0 and li_total_bttn_pixel + li_arrow_pixel + unitsToPixels(li_last_bttn1_width, XunitsToPixels!)  <= li_width_pixel then
			ls_modify += " " + ias_bttn_name[li_last_bttn1_idx] + ".visible = true "
			ls_modify += " " + ias_bttn_name[li_last_bttn1_idx] + ".enabled = " + string(iab_bttn_enable[li_last_bttn1_idx])			
			ls_modify +=" " + ias_bttn_name[li_last_bttn1_idx] + ".x = " + string(li_total_bttn)	
			ls_modify += " b_arrow.visible = true"
			ls_modify += " b_arrow.enabled = true" 
			ls_modify += " b_arrow.x = " + string(li_total_bttn+li_last_bttn1_width)	
			ls_modify += " " + ias_bttn_name[li_last_bttn2_idx] + ".visible = false"
			//-- ghi nhớ các button bị ẩn vào biến is_bttn_hidden --//
			if iab_bttn_visible[li_last_bttn2_idx] then
				ias_bttn_hidden[upperbound(ias_bttn_hidden)+1] = ias_bttn_name[li_last_bttn2_idx]
				iab_bttn_hidden_enable[upperbound(iab_bttn_hidden_enable)+1] = iab_bttn_enable[li_last_bttn2_idx]				
			end if			
			continue
		elseif li_last_bttn1_width > 0 and li_last_bttn2_width > 0 and li_total_bttn_pixel + li_arrow_pixel + unitsToPixels(li_last_bttn2_width, XunitsToPixels!)  <= li_width_pixel then
			ls_modify += " " + ias_bttn_name[li_last_bttn2_idx] + ".visible = true "
			ls_modify += " " + ias_bttn_name[li_last_bttn2_idx] + ".enabled = " + string(iab_bttn_enable[li_last_bttn2_idx])			
			ls_modify +=" " + ias_bttn_name[li_last_bttn2_idx] + ".x = " + string(li_total_bttn)	
			ls_modify += " b_arrow.visible = true"
			ls_modify += " b_arrow.enabled = true" 
			ls_modify += " b_arrow.x = " + string(li_total_bttn+li_last_bttn2_width)	
			ls_modify += " " + ias_bttn_name[li_idx] + ".visible = false"
			//-- ghi nhớ các button bị ẩn vào biến is_bttn_hidden --//
			if iab_bttn_visible[li_idx] then
				ias_bttn_hidden[upperbound(ias_bttn_hidden)+1] = ias_bttn_name[li_idx]
				iab_bttn_hidden_enable[upperbound(iab_bttn_hidden_enable)+1] = iab_bttn_enable[li_idx]						
			end if			
			continue
		elseif  li_last_bttn1_width = 0 and li_last_bttn2_width > 0 and li_total_bttn_pixel + li_arrow_pixel + unitsToPixels(li_last_bttn2_width, XunitsToPixels!)  <= li_width_pixel then
			ls_modify += " " + ias_bttn_name[li_last_bttn2_idx] + ".visible = true "
			ls_modify += " " + ias_bttn_name[li_last_bttn2_idx] + ".enabled = " + string(iab_bttn_enable[li_last_bttn2_idx])			
			ls_modify +=" " + ias_bttn_name[li_last_bttn2_idx] + ".x = " +  string(vi_width - li_last_bttn2_width)
			continue
		elseif li_width_pixel > 0 then
			ls_modify += " b_arrow.visible = true"
			ls_modify += " b_arrow.enabled = true"
			ls_modify += " b_arrow.x = " + string(li_total_bttn)	
			ls_modify += " " + ias_bttn_name[li_last_bttn1_idx] + ".visible = false"
			ls_modify += " " + ias_bttn_name[li_last_bttn2_idx] + ".visible = false"
			//-- ghi nhớ các button bị ẩn vào biến is_bttn_hidden --//
			if iab_bttn_visible[li_last_bttn1_idx] then
				ias_bttn_hidden[upperbound(ias_bttn_hidden)+1] = ias_bttn_name[li_last_bttn1_idx]
				iab_bttn_hidden_enable[upperbound(iab_bttn_hidden_enable)+1] = iab_bttn_enable[li_last_bttn1_idx]							
			end if			
			if iab_bttn_visible[li_last_bttn2_idx] then
				ias_bttn_hidden[upperbound(ias_bttn_hidden)+1] = ias_bttn_name[li_last_bttn2_idx]
				iab_bttn_hidden_enable[upperbound(iab_bttn_hidden_enable)+1] = iab_bttn_enable[li_last_bttn2_idx]							
			end if					
			continue
		end if
	end if //-- kết thúc xử lý 2 nút cuối --//
	///////////////////////////////////////////
		

	if li_total_bttn_pixel + li_arrow_pixel + unitsToPixels(li_bttn_width, XunitsToPixels!)  <= li_width_pixel then	
		ls_modify += " " + ias_bttn_name[li_idx] + ".visible = true"
		ls_modify += " " + ias_bttn_name[li_idx] + ".enabled = " + string(iab_bttn_enable[li_idx])				
		ls_modify +=" " + ias_bttn_name[li_idx] + ".x = " + string(li_total_bttn)
		li_total_bttn+=li_bttn_width
		li_total_bttn_pixel += unitsToPixels(li_bttn_width, XunitsToPixels!) 
		continue
	else
		ls_modify += " b_arrow.visible = true"
		ls_modify += " b_arrow.enabled = true" 
		ls_modify += " b_arrow.x = " + string(li_total_bttn)
		ls_modify += " " + ias_bttn_name[li_idx] + ".visible = false"
		lb_show_arrow = true
		//-- ghi nhớ các button bị ẩn vào biến is_bttn_hidden --//
		if iab_bttn_visible[li_idx] then
			ias_bttn_hidden[upperbound(ias_bttn_hidden)+1] = ias_bttn_name[li_idx]
			iab_bttn_hidden_enable[upperbound(iab_bttn_hidden_enable)+1] = iab_bttn_enable[li_idx]			
		end if					
		continue
	end if

NEXT

ls_rtn = this.modify(ls_modify )
this.setredraw( true)
return 1

end event

event type integer e_init_buttons(s_str_actionpane vc_s_actionpane);boolean  lb_empty[]

is_button_has_sub = vc_s_actionpane.s_button_has_sub
ias_sub_button[] = vc_s_actionpane.sa_sub_button[]
iab_func_enable[]= lb_empty[]
iab_bttn_independent_data[]= lb_empty[]
is_objname_handling = vc_s_actionpane.s_objname_handling

return 1

end event

event type integer e_display_actionbutton_new(integer vi_width);/*********************************************
Chức năng: Hiện thị các nút theo giá trị các biến
				  - iab_bttn_visible[]
				  - iab_bttn_enable[]
				  -	ias_bttn_name[]
-------------------------------------------------------------------------------*/

int					li_idx, li_bttn_cnt, li_width_pixel, li_total_bttn_pixel, li_bttn_width, li_total_bttn, li_arrow_width,li_arrow_pixel
int					li_idx_visible, li_last_bttn1_width, li_last_bttn2_width, li_last_bttn1_idx, li_last_bttn2_idx
int					li_row, li_gap
string				ls_modify, ls_rtn, las_empty[]
boolean			lb_show_arrow, lab_empty[]

this.setredraw( false)

li_gap = 12
li_width_pixel =  unitsToPixels(vi_width, XunitsToPixels!)
li_bttn_cnt = upperbound(ias_bttn_name[])

lb_show_arrow = false
ias_bttn_hidden[] = las_empty[]
iab_bttn_hidden_enable[] = lab_empty[]

FOR li_idx = 1 to li_bttn_cnt
	if ias_bttn_name[li_idx] = 'b_blank' then														
		li_bttn_width = 0
	else
		li_bttn_width = 297
	end if				
	if li_total_bttn_pixel + unitsToPixels(li_bttn_width, XunitsToPixels!) + unitsToPixels(li_gap, XunitsToPixels!) + unitsToPixels(96, XunitsToPixels!) > li_width_pixel then		
		li_bttn_width = 96		
	end if
	if li_idx <= this.rowcount( ) then
		li_row = li_idx
		li_idx_visible = li_row
	elseif not lb_show_arrow then  		
		li_row = This.insertrow( 0)
		li_idx_visible = li_row
	end if				
	if li_bttn_width = 96 then lb_show_arrow = true	
	
	if lb_show_arrow  then		
		if upperbound(ias_bttn_hidden) = 0 then
			This.setitem(li_row , 'button','Pics\Buttons\' +   'b_arrow.png')
			ls_modify +=" " + 'button_' + string(li_idx) + ".x = " + string(li_total_bttn)
			ls_modify +=" " + 'button_' + string(li_idx) + ".width = " + string(li_bttn_width)
			li_total_bttn += li_bttn_width + li_gap
			li_total_bttn_pixel += + unitsToPixels(li_bttn_width, XunitsToPixels!) + unitsToPixels(li_gap, XunitsToPixels!)				
		end if
		ias_bttn_hidden[upperbound(ias_bttn_hidden)+1] = ias_bttn_name[li_idx]
		iab_bttn_hidden_enable[upperbound(iab_bttn_hidden_enable)+1] = iab_bttn_enable[li_idx]
		continue
	end if
	
	li_idx_visible = li_idx // ghi nhớ số index nút được hiển thị --//
	if iab_bttn_enable[li_idx] then 
		This.setitem(li_row , 'button',  'Pics\Buttons\' + ias_bttn_name[li_idx] +'.png')				
	else
		This.setitem(li_row , 'button', 'Pics\Buttons\' +  ias_bttn_name[li_idx] +'_d.png')
	end if		
	
	ls_modify +=" " + 'button_' + string(li_idx) + ".x = " + string(li_total_bttn)
	ls_modify +=" " + 'button_' + string(li_idx) + ".width = " + string(li_bttn_width)
	li_total_bttn += li_bttn_width + li_gap
	li_total_bttn_pixel += + unitsToPixels(li_bttn_width, XunitsToPixels!) + unitsToPixels(li_gap, XunitsToPixels!)	
	
NEXT
//-- xoá các record dư > số nút hiển thị --//
if li_idx_visible < this.rowcount( ) then
	FOR li_row = this.rowcount( ) to li_idx_visible + 1 step -1
		this.deleterow( this.rowcount( ) )
	NEXT
end if 

ls_rtn = this.modify(ls_modify )
this.setredraw( true)
return 1

end event

public function integer f_set_visible_button (string vs_buttons);int			li_idx
string		las_empty[], ls_modify
c_string	lc_string

//-- Ẩn các nút cũ --//
if upperbound(ias_bttn_name[]) > 0 then
	FOR li_idx = 1 to upperbound(ias_bttn_name[])
		if ias_bttn_name[li_idx] <> 'b_blank' then
			ls_modify += " " + ias_bttn_name[li_idx] + ".visible = false"
			ls_modify += " " + ias_bttn_name[li_idx] + ".enabled = false"
		end if
	NEXT
	this.modify(ls_modify )
	ias_bttn_name[] = las_empty[]
end if
ii_bttn_visible_count = lc_string.f_stringtoarray( vs_buttons,';', ias_bttn_name[])

FOR li_idx = 1 to ii_bttn_visible_count
	iab_bttn_visible[li_idx] = true
NEXT
return ii_bttn_visible_count
end function

public function boolean f_is_button_active (string vs_button_name);int			li_idx

FOR li_idx = 1 to upperbound(ias_bttn_name[])
	if vs_button_name = ias_bttn_name[li_idx] then
		return iab_bttn_visible[li_idx] and iab_bttn_enable[li_idx]
	end if
NEXT
end function

public function integer f_send_message_to_object (string vs_message);int 					li_rtn
s_object_display		lpo_handling
window				lw_display
if this.f_getparentwindow( lw_display) = 1 then
	lpo_handling = lw_display.dynamic f_get_obj_handling()
	if isvalid(lpo_handling) then
		return lpo_handling.event e_action( vs_message)
	end if
end if
return -1
end function

public function integer f_set_enabled_button (string vs_buttons, ref s_object_display rod_handle);int							li_idx, li_func_idx
string						ls_idkey_code, ls_menu_code
boolean					lb_first_bttn, lb_independent, lb_enable, lb_empty[]
datastore					lds_rule, lds_security
s_str_actionpane		lstr_actionpane
window					lw_display


lb_first_bttn = true

ls_menu_code = rod_handle.f_get_menu_code()

FOR li_idx = 1 to upperbound(ias_bttn_name[])
	if pos(vs_buttons, ias_bttn_name[li_idx]+';') = 0 then
		iab_bttn_enable[li_idx] = false
	else
		iab_bttn_enable[li_idx] = true 
		/*
		if pos('b_add;b_add_multi;b_insert;b_modify;b_save;b_saveclose;b_query;b_execquery;b_filteron;b_filteroff;b_refresh;b_delete;', ias_bttn_name[li_idx]+';') > 0 then
			iab_bttn_enable[li_idx] = true 
		else
			ls_idkey_code = ls_menu_code +'.'+this.dataobject +'.'+ ias_bttn_name[li_idx]				
			li_func_idx++
			if lb_first_bttn then
				
				lb_first_bttn = false
				lds_rule = rod_handle.f_get_ids_policy_rule()
				lds_security = rod_handle.f_get_ids_policy_security()	
				lw_display = rod_handle.f_get_wdisplay()
				lstr_actionpane = parent.dynamic f_get_actionpane_structure()
				
				if upperbound(iab_bttn_independent_data[]) > 0 then
					if iab_bttn_independent_data[li_func_idx] then
						iab_bttn_enable[li_idx] = iab_func_enable[li_func_idx]
						continue
					end if				
				end if

				//-- kiểm tra access lần đầu tiên --//
				g_user.i_rule.f_get_rule_action_bttn(ls_idkey_code , lds_rule, lw_display, lstr_actionpane, lb_independent, lb_enable)
				if lb_enable then
					g_user.i_rule.f_get_rule_action_bttn(ls_idkey_code , lds_security, lw_display, lstr_actionpane, lb_independent, lb_enable)
				end if
				iab_bttn_enable[li_idx] =  lb_enable
				iab_func_enable[li_func_idx] = lb_enable
				iab_bttn_independent_data[li_func_idx] = lb_independent
				continue
			end if			
			if lstr_actionpane.b_full_inherit then
				iab_bttn_enable[li_idx] =  lstr_actionpane.b_access
				iab_func_enable[li_func_idx] =  lstr_actionpane.b_access
				iab_bttn_independent_data[li_func_idx] = lstr_actionpane.b_independent_data
				continue
			else //-- kiểm tra access cho từng nút --//
				g_user.i_rule.f_get_rule_action_bttn(ls_idkey_code , lds_rule, lw_display, lstr_actionpane, lb_independent, lb_enable)
				if lb_enable then
					g_user.i_rule.f_get_rule_action_bttn(ls_idkey_code , lds_security, lw_display, lstr_actionpane, lb_independent, lb_enable)
				end if
				iab_bttn_enable[li_idx] =  lb_enable
				iab_func_enable[li_func_idx] = lb_enable
				iab_bttn_independent_data[li_func_idx] = lb_independent				
			end if						
		end if		
		*/
	end if
NEXT
return 1
end function

public subroutine f_set_m_actionbutton (string vs_bttn_has_sub);
end subroutine

public function integer f_set_subbutton (string vs_enabled_buttons[]);c_string		lc_string
string			las_button_has_sub[]
int				li_btnIndex, li_btnCount


if is_button_has_sub <> '' then
	li_btnCount = lc_string.f_stringtoarray(is_button_has_sub, ';', las_button_has_sub[])
	FOR li_btnIndex = 1 to li_btnCount
		im_actionbutton[li_btnIndex] = create	t_m_actionbutton
		im_actionbutton[li_btnIndex].is_object_name = las_button_has_sub[li_btnIndex]
		im_actionbutton[li_btnIndex].f_set_popupmenu( ias_sub_button[li_btnIndex],vs_enabled_buttons[li_btnIndex])	
	NEXT
else
	im_actionbutton[1] = create	t_m_actionbutton
end if

return 1

end function

on t_dw_action_pane.create
call super::create
end on

on t_dw_action_pane.destroy
call super::destroy
end on

event constructor;//-- override--//
is_popmenu = 'm_edit_obj_label;'


//-- Set ngôn ngữ --//
t_w_mdi.ids_lang_text.post f_set_dw_lang(this)
end event

event buttonclicked;call super::buttonclicked;t_m_popup				lm_popup_button		
t_t							ltab_action
c_string					lc_string
c_obj_service			lc_obj_service
s_object_display		lpo_related
window					lw_parent
t_dw_mpl				ldw_focus
int							li_rtn, li_btnCount, li_btnIndex,li_idx
string						las_button_has_sub[], ls_objname,las_button[], ls_hidden_bttns

if dwo.name = 'b_arrow' then

	lm_popup_button = create	t_m_popup

	lm_popup_button.is_object_name = 'b_arrow'
	 
	lc_string.f_arraytostring( ias_bttn_hidden[],';', ls_hidden_bttns)
	ls_hidden_bttns += ';'
//	lm_actionbutton.f_set_popupmenu( ias_bttn_hidden[],iab_bttn_hidden_enable[] )
	//-- show popup menu --//
	for li_idx = 1 to upperbound(im_actionbutton[1].item[])
		if pos(ls_hidden_bttns, im_actionbutton[1].item[li_idx].classname() ) > 0 then
			lm_popup_button.item[upperbound(lm_popup_button.item[]) + 1] =  im_actionbutton[1].item[li_idx]
			lm_popup_button.item[upperbound(lm_popup_button.item[])].Text =  im_actionbutton[1].item[li_idx].Text
			lm_popup_button.item[upperbound(lm_popup_button.item[])].visible =  im_actionbutton[1].item[li_idx].visible
			lm_popup_button.item[upperbound(lm_popup_button.item[])].enabled =  im_actionbutton[1].item[li_idx].enabled
			
		end if
	next
	im_actionbutton[1].f_set_im_parent(lm_popup_button)
	//-- set menu language --//
	if gs_user_lang <> 'vi-vn' then
		t_w_mdi.ids_lang_text.f_set_menu_lang(lm_popup_button)
	end if	
	lm_popup_button.popmenu( t_w_mdi.pointerX() , t_w_mdi.pointerY() )
	
	if lm_popup_button.is_clicked_menu <> '' then	
		this.f_send_message_to_object( lm_popup_button.is_clicked_menu)		
		lm_popup_button.is_clicked_menu =''
	end if
	destroy lm_popup_button
	return			
elseif is_button_has_sub <> '' then
	li_btnCount = upperbound(im_actionbutton[])
	lm_popup_button = create	t_m_popup
	FOR li_btnIndex = 1 to li_btnCount
		if im_actionbutton[li_btnIndex].is_object_name = dwo.name then
			if lastpos(ias_sub_button[li_btnIndex],';') < len(ias_sub_button[li_btnIndex]) then ias_sub_button[li_btnIndex] += ';'
			for li_idx = 1 to upperbound(im_actionbutton[li_btnIndex].item[])
				if pos(ias_sub_button[li_btnIndex],im_actionbutton[li_btnIndex].item[li_idx].classname()+';') > 0 then
					lm_popup_button.item[upperbound(lm_popup_button.item[]) + 1] = im_actionbutton[li_btnIndex].item[li_idx]
					lm_popup_button.item[upperbound(lm_popup_button.item[])].Text = im_actionbutton[li_btnIndex].item[li_idx].Text
					lm_popup_button.item[upperbound(lm_popup_button.item[])].visible = im_actionbutton[li_btnIndex].item[li_idx].visible
					lm_popup_button.item[upperbound(lm_popup_button.item[])].enabled = im_actionbutton[li_btnIndex].item[li_idx].enabled					
				end if
			next
			//-- show popup menu --//		
			im_actionbutton[li_btnIndex].f_set_im_parent(lm_popup_button)
			//-- set menu language --//
			if gs_user_lang <> 'vi-vn' then
				t_w_mdi.ids_lang_text.f_set_menu_lang(lm_popup_button)
			end if				
			lm_popup_button.popmenu( t_w_mdi.pointerX() , t_w_mdi.pointerY() )
			//-- thuc hien sau khi user click chon button popup --//
			if lm_popup_button.is_clicked_menu <> '' then	
				this.f_send_message_to_object( lm_popup_button.is_clicked_menu)
				lm_popup_button.is_clicked_menu =''
			end if
			destroy lm_popup_button
			return
/*			
			im_actionbutton[li_btnIndex].popmenu( t_w_mdi.pointerX() , t_w_mdi.pointerY() )	
			//-- thuc hien sau khi user click chon button popup --//
			if im_actionbutton[li_btnIndex].is_clicked_menu <> '' then	
				this.f_send_message_to_object( im_actionbutton[li_btnIndex].is_clicked_menu)		
				 im_actionbutton[li_btnIndex].is_clicked_menu =''
			end if	
			return
*/
		end if
	NEXT
elseif this.dataobject = 'd_action_related_object' then
	if this.f_getparentwindow( lw_parent) =1 then
		ls_objname = lc_obj_service.f_globalreplace( dwo.name, 'b_', 'u_')
		lw_parent.dynamic event e_create_related_object(ls_objname,lpo_related)
		ltab_action=lw_parent.dynamic f_get_tab_action()
		ldw_focus = lw_parent.dynamic f_get_idwfocus( )
		if ldw_focus.f_get_ib_editing() then
			gf_messagebox('m.t_dw_action_pane.buttonclicked.01','Thông báo','Phải lưu dữ liệu trước khi chuyển đối tượng liên quan','exclamation','ok',1)
			return 
		else
			lpo_related.f_create_actionpane(ltab_action)
			lw_parent.dynamic event e_change_object(lpo_related)
		end if
	end if
	return
//elseif left(dwo.name,6) = 'b_view' then
//	if this.f_getparentwindow( lw_parent) =1 then
//		lw_parent.dynamic event e_view(dwo.name)
//	end if
//	return 
elseif this.dataobject = 'd_action_related_report' then
	if this.f_getparentwindow( lw_parent) =1 then
		ls_objname = lc_obj_service.f_globalreplace( dwo.name, 'br_', 'ur_')
		lw_parent.dynamic event e_open_report(ls_objname)
		return
	end if
end if

return this.f_send_message_to_object( dwo.name)
end event

event e_dwnkey;call super::e_dwnkey;
window 			lw_parent
datawindow		ldw_actionpane, ldw_forcus
powerobject		lpo_handling
string				ls_name, ls_selected
int					li_row, li_idx
boolean			lb_querymode



if key=keyS! and keyflags = 2 then
	if this.f_getparentwindow(lw_parent) = 1 then
		ldw_forcus = lw_parent.dynamic f_get_idwforcus()
		if ldw_forcus.accepttext( ) <> 1 then return -1
		
		if lw_parent.dynamic f_get_dw_actionpane('d_action_edit',ldw_actionpane) = 1 then
			if ldw_actionpane.dynamic f_is_button_active('b_save') then
				lw_parent.dynamic event e_save( )
			end if
		end if
	end if
	return 1
elseif key=keyM! and keyflags = 2 then
	if this.f_getparentwindow(lw_parent) = 1 then
		if lw_parent.dynamic f_get_dw_actionpane('d_action_edit',ldw_actionpane) = 1 then
			if ldw_actionpane.dynamic f_is_button_active('b_modify') then
				lw_parent.dynamic event e_modify( )
			end if
		end if
	end if
	return 1
elseif key=keyN! and keyflags = 2 then
	if this.f_getparentwindow(lw_parent) = 1 then
		ldw_forcus = lw_parent.dynamic f_get_idwforcus()
		if ldw_forcus.accepttext( ) <> 1 then return -1		
		if lw_parent.dynamic f_get_dw_actionpane('d_action_edit',ldw_actionpane) = 1 then
			if ldw_actionpane.dynamic f_is_button_active('b_add') then
				lw_parent.dynamic event e_add( )
			end if
		end if
	end if
	return	 1
elseif key=keyI! and keyflags = 2 then
	if this.f_getparentwindow(lw_parent) = 1 then
		ldw_forcus = lw_parent.dynamic f_get_idwforcus()
		if ldw_forcus.accepttext( ) <> 1 then return -1		
		if lw_parent.dynamic f_get_dw_actionpane('d_action_edit',ldw_actionpane) = 1 then
			if ldw_actionpane.dynamic f_is_button_active('b_insert') then
				lw_parent.dynamic event e_insert( )
			end if
		end if
	end if
	return	 1
elseif key=keyD! and keyflags = 2 then
	if this.f_getparentwindow(lw_parent) = 1 then
		if lw_parent.dynamic f_get_dw_actionpane('d_action_edit',ldw_actionpane) = 1 then
			if ldw_actionpane.dynamic f_is_button_active('b_delete') then
				lw_parent.dynamic event e_delete( )
			end if
		end if
	end if
	return	
elseif key=keyF! and keyflags = 2 then
	if this.f_getparentwindow(lw_parent) = 1 then
		if lw_parent.dynamic f_get_dw_actionpane('d_action_edit',ldw_actionpane) = 1 then
			if ldw_actionpane.dynamic f_is_button_active('b_query') then
				lw_parent.dynamic event e_query( )
			end if
		end if
	end if
	return 1
elseif key=keyX! and keyflags = 2 then
	if this.f_getparentwindow(lw_parent) = 1 then
		if lw_parent.dynamic f_get_dw_actionpane('d_action_edit',ldw_actionpane) = 1 then
			if ldw_actionpane.dynamic f_is_button_active('b_exec_query') then
				lw_parent.dynamic event e_exec_query( )
			end if
		end if
	end if
	return	 1	
elseif key=keyF5! then
	if this.f_getparentwindow(lw_parent) = 1 then
		if lw_parent.dynamic f_get_dw_actionpane('d_action_edit',ldw_actionpane) = 1 then
			if ldw_actionpane.dynamic f_is_button_active('b_refresh') then
				lw_parent.dynamic event e_refresh( )
			end if
		end if
	end if
	return	 1	
elseif key = KeyEscape! then
	this.f_getparentwindow(lw_parent)
	if lw_parent.dynamic f_get_dw_actionpane('d_action_edit',ldw_actionpane) = 1 then
		if  ldw_actionpane.dynamic f_is_button_active('b_saveclose') then
			lw_parent.dynamic event e_closeedit( )
		else
			close (lw_parent)
		end if
	else
		close (lw_parent)
	end if		
end if

end event

event e_dwnlbuttonup;//-- override --//

end event

event destructor;call super::destructor;int 		li_idx
FOR li_idx =  upperbound(im_actionbutton[]) to 1 step -1
	destroy im_actionbutton[li_idx]
NEXT

end event

event clicked;// override //
string		ls_btn
t_m_popup				lm_popup_button		
t_t							ltab_action
c_string					lc_string
s_object_display		lpo_related
window					lw_parent
t_dw_mpl				ldw_focus
int							li_rtn, li_btnCount, li_btnIndex,li_idx, li_hidden_cnt
string						las_button_has_sub[], ls_objname,las_button[], ls_hidden_bttns


if row = 0 or row = 2 and xpos > 150 then return 0 //-- click ngoài các nút --//

ls_btn = this.getitemstring( row, 'button')
ls_btn =  mid(ls_btn, pos(ls_btn,'b_'))
ls_btn =  mid(ls_btn, 1, pos(ls_btn, '.') -1)
if right(ls_btn, 2) = '_d' then return 0 // nút bị disable --//
if right(ls_btn, 2) = '_f' then ls_btn = left(ls_btn, len(ls_btn) - 2)

if ls_btn = 'b_arrow'  then

	lm_popup_button = create	t_m_popup

	lm_popup_button.is_object_name = ls_btn
	 
	lc_string.f_arraytostring( ias_bttn_hidden[],';', ls_hidden_bttns)
	ls_hidden_bttns += ';'
//	lm_actionbutton.f_set_popupmenu( ias_bttn_hidden[],iab_bttn_hidden_enable[] )
	//-- show popup menu --//
	for li_idx = 1 to upperbound(im_actionbutton[1].item[])
		if pos(ls_hidden_bttns, im_actionbutton[1].item[li_idx].classname() ) > 0 then
			li_hidden_cnt ++
			lm_popup_button.item[upperbound(lm_popup_button.item[]) + 1] =  im_actionbutton[1].item[li_idx]
			lm_popup_button.item[upperbound(lm_popup_button.item[])].Text =  im_actionbutton[1].item[li_idx].Text
			lm_popup_button.item[upperbound(lm_popup_button.item[])].visible =  im_actionbutton[1].item[li_idx].visible
			lm_popup_button.item[upperbound(lm_popup_button.item[])].enabled = iab_bttn_hidden_enable[li_hidden_cnt]		/// im_actionbutton[1].item[li_idx].enabled
			
		end if
	next
	im_actionbutton[1].f_set_im_parent(lm_popup_button)
	//-- set menu language --//
	if gs_user_lang <> 'vi-vn' then
		t_w_mdi.ids_lang_text.f_set_menu_lang(lm_popup_button)
	end if	
	this.f_getparentwindow( lw_parent)
	lm_popup_button.popmenu( PixelsToUnits(xpos, XPixelsToUnits!) + lw_parent.WorkSpaceX ( ) ,  PixelsToUnits(ypos, YPixelsToUnits!)  + lw_parent.WorkSpaceY ( ) )
	
	if lm_popup_button.is_clicked_menu <> '' then	
		this.f_send_message_to_object( lm_popup_button.is_clicked_menu)		
		lm_popup_button.is_clicked_menu =''
	end if
	destroy lm_popup_button
	return	 0
elseif is_button_has_sub <> '' then
	li_btnCount = upperbound(im_actionbutton[])
	lm_popup_button = create	t_m_popup
	FOR li_btnIndex = 1 to li_btnCount
		if im_actionbutton[li_btnIndex].is_object_name = ls_btn then
			if lastpos(ias_sub_button[li_btnIndex],';') < len(ias_sub_button[li_btnIndex]) then ias_sub_button[li_btnIndex] += ';'
			for li_idx = 1 to upperbound(im_actionbutton[li_btnIndex].item[])
				if pos(ias_sub_button[li_btnIndex],im_actionbutton[li_btnIndex].item[li_idx].classname()+';') > 0 then
					lm_popup_button.item[upperbound(lm_popup_button.item[]) + 1] = im_actionbutton[li_btnIndex].item[li_idx]
					lm_popup_button.item[upperbound(lm_popup_button.item[])].Text = im_actionbutton[li_btnIndex].item[li_idx].Text
					lm_popup_button.item[upperbound(lm_popup_button.item[])].visible = im_actionbutton[li_btnIndex].item[li_idx].visible
					lm_popup_button.item[upperbound(lm_popup_button.item[])].enabled = im_actionbutton[li_btnIndex].item[li_idx].enabled					
				end if
			next
			//-- show popup menu --//		
			im_actionbutton[li_btnIndex].f_set_im_parent(lm_popup_button)
			//-- set menu language --//
			if gs_user_lang <> 'vi-vn' then
				t_w_mdi.ids_lang_text.f_set_menu_lang(lm_popup_button)
			end if				
			this.f_getparentwindow( lw_parent)
			
			lm_popup_button.popmenu( PixelsToUnits(xpos, XPixelsToUnits!) + lw_parent.WorkSpaceX ( ),  PixelsToUnits(ypos, YPixelsToUnits!) + lw_parent.WorkSpaceY ( ))
			
			//-- thuc hien sau khi user click chon button popup --//
			if lm_popup_button.is_clicked_menu <> '' then	
				this.f_send_message_to_object( lm_popup_button.is_clicked_menu)
				lm_popup_button.is_clicked_menu =''
			end if
			destroy lm_popup_button
			return 0

		end if
	NEXT
elseif this.dataobject = 'd_action_related_object' then
	if this.f_getparentwindow( lw_parent) =1 then
		ls_objname = lc_string.f_globalreplace( ls_btn, 'b_', 'u_')
			
		lw_parent.dynamic event e_create_related_object(ls_objname,lpo_related)
		ldw_focus = lw_parent.dynamic f_get_idwfocus( )
		if ldw_focus.f_get_ib_editing() then
			gf_messagebox('m.t_dw_action_pane.buttonclicked.01','Thông báo','Phải lưu dữ liệu trước khi chuyển đối tượng liên quan','exclamation','ok',1)
			return -1
		else

			lw_parent.dynamic event e_change_object_appeon(lpo_related)
		end if
	end if
	return 0

elseif this.dataobject = 'd_action_related_report' then
	if this.f_getparentwindow( lw_parent) =1 then
		ls_objname = lc_string.f_globalreplace( ls_btn, 'br_', 'ur_')
		lw_parent.dynamic event e_open_report(ls_objname)
		return 0
	end if
end if

li_rtn= this.f_send_message_to_object( ls_btn)
return 0



end event

event rbuttondown;
//-- OVERRIDE --//
return
end event

event e_mousemove;//-override--//
string			ls_rtn, ls_modstring_color,  ls_modstring_currentrow, ls_backgoundcolor,ls_currentrowcolor, ls_columns[], ls_btn
int				li_colcnt, li_idx

if dwo.name <> 'datawindow' then

	
//	ls_backgoundcolor = string(536870912)
//	ls_currentrowcolor =string(rgb(0,255,255)) //xanh trời
	li_colCnt = this.f_getcolumns( ls_columns[])
	FOR li_idx = 1 to li_colCnt
		ls_btn = this.getitemstring( li_idx, 'button')
		ls_btn = mid(ls_btn, 1, pos(ls_btn, '.') -1 )				
		if dwo.name =  ls_columns[li_idx] then
			if right(ls_btn,2) <> '_d' and right(ls_btn,2) <> '_f' then
				this.setitem( li_idx,  'button', ls_btn+'_f.png')
			end if			
		else
			if right(ls_btn,2) = '_f' then
				this.setitem( li_idx,  'button', left(ls_btn, len(ls_btn) - 2)+'.png')
			end if			
		end if		
	NEXT

end if


end event

