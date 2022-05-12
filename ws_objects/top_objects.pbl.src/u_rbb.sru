$PBExportHeader$u_rbb.sru
forward
global type u_rbb from ribbonbar
end type
end forward

global type u_rbb from ribbonbar
integer width = 4201
integer height = 404
long backcolor = 15132390
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean hidepaneltext = true
event ue_tabbutton ( long al_handle )
event ue_appbutton ( long al_handle,  long al_index,  long al_subindex )
event ue_recentitem ( long al_handle,  long al_index )
event itemclicked ( string itemtag,  long itemhandle,  integer index,  integer subindex )
end type
global u_rbb u_rbb

type variables
Boolean #CentralizedEventHandling = false

end variables

forward prototypes
public function integer of_triggerparentevent (long al_handle, long al_index, long al_subindex)
public function integer of_triggerevent (long al_handle, long al_index, long al_subindex)
public function integer f_change_action_button (long al_handle, long al_index, long al_subindex)
public function integer f_enable_panel_copy (ribbonpanelitem vrpi_action, string vs_type, string vs_doc_status, boolean vb_editing, string vs_enable_buttons, boolean vb_change_4_edit)
public function integer f_enable_panel_print (ribbonpanelitem vrpi_action, string vs_type, string vs_doc_status, boolean vb_editing, string vs_enable_buttons, boolean vb_change_4_edit)
public function integer f_enable_panel_approve (ribbonpanelitem vrpi_action, string vs_type, string vs_doc_status, boolean vb_editing, string vs_enable_buttons, boolean vb_change_4_edit)
public function integer f_enable_panel_update (ribbonpanelitem vrpi_action, string vs_type, string vs_doc_status, boolean vb_editing, string vs_enable_buttons, boolean vb_change_4_edit)
public function integer f_enable_panel_objects (ribbonpanelitem vrpi_action, string vs_type, string vs_doc_status, boolean vb_editing, string vs_enable_buttons, boolean vb_change_4_edit)
public function integer f_ctrl_enable_button (string vs_type, string vs_doc_status, boolean vb_editing, boolean vb_updatable, boolean vb_change_4_edit, string vs_enable_buttons, boolean vb_detail)
public function integer f_enable_panel_action (ribbonpanelitem vrpi_action, string vs_type, string vs_doc_status, boolean vb_editing, boolean vb_updatable, boolean vb_change_4_edit, boolean vb_detail, string vs_enable_buttons)
public function integer f_enable_panel_action_group (string vs_type, string vs_doc_status, boolean vb_editing, boolean vb_updatable, boolean vb_change_4_edit, boolean vb_detail, string vs_enable_buttons, ref ribbongroupitem r_rgi)
public function integer f_enable_panel_action_panel (string vs_type, string vs_doc_status, boolean vb_editing, boolean vb_updatable, boolean vb_change_4_edit, boolean vb_detail, string vs_enable_buttons, ref ribbonpanelitem r_rpi)
public function integer f_enable_panel_tab (ribbonpanelitem vrpi_tab, string vs_type, string vs_doc_status, boolean vb_editing, boolean vb_updatable, string vs_enable_buttons)
end prototypes

event ue_tabbutton(long al_handle);if  #CentralizedEventHandling = false then
	of_triggerparentevent ( al_handle, 0, 0 )
else
	 of_triggerevent ( al_handle, 0, 0)
end if

end event

event ue_appbutton(long al_handle, long al_index, long al_subindex);if  #CentralizedEventHandling = false then
	of_triggerparentevent ( al_handle, al_index, al_subindex )
else
	 of_triggerevent ( al_handle, al_index, al_subindex )
end if

end event

event ue_recentitem(long al_handle, long al_index);if  #CentralizedEventHandling = false then
	of_triggerparentevent ( al_handle, al_index, 0 )
else
	 of_triggerevent ( al_handle, al_index, 0 )
end if

end event

public function integer of_triggerparentevent (long al_handle, long al_index, long al_subindex);PowerObject						po
RibbonTabButtonItem 			tabbutton
RibbonSmallButtonItem			smallbutton
RibbonLargeButtonItem			largebutton
RibbonApplicationButtonItem 	appbutton
RibbonMenuItem 					menuitem
RibbonApplicationMenu 			appmenu
String									ls_classname
String									ls_eventname
Integer								li_rc

li_rc = this.GetItem ( al_handle, po )
IF li_rc = 1 THEN
	ls_classname = po.ClassName()
	Choose Case ls_classname
		Case "ribbonsmallbuttonitem"
			smallbutton = po
			ls_eventname = "ue_" + smallbutton.tag	
			parent.PostEvent ( ls_eventname )
		Case "ribbonlargebuttonitem"
			largebutton = po
			ls_eventname = "ue_" + largebutton.tag	
			parent.PostEvent ( ls_eventname )
		Case "ribbontabbuttonitem"			
			tabbutton = po
			ls_eventname = "ue_" + tabbutton.tag
			parent.PostEvent ( ls_eventname )
		Case "ribbonapplicationbuttonitem"
			appbutton = po
			appbutton.getmenu( appmenu)
			IF al_subindex = 0 THEN
				appMenu.GetRecentItem(al_Index,menuItem)	
				ls_eventname = "ue_recentitem"
				parent.PostEvent ( ls_eventname, al_index, menuitem.text )
			ELSE
				appmenu.GetMasterItem ( al_index, al_subindex,  menuitem )
				ls_eventname = "ue_" + menuitem.tag				
				parent.PostEvent ( ls_eventname )
			END IF
	End Choose
	
End if

Return li_rc
end function

public function integer of_triggerevent (long al_handle, long al_index, long al_subindex);PowerObject						po
RibbonTabButtonItem 			tabbutton
RibbonSmallButtonItem			smallbutton
RibbonLargeButtonItem			largebutton
RibbonApplicationButtonItem 	appbutton
RibbonMenu 						lr_Menu
RibbonMenuItem 					menuitem
RibbonApplicationMenu 			appmenu
String									ls_classname
Integer								li_rc

li_rc = this.GetItem ( al_handle, po )
IF li_rc = 1 THEN
	ls_classname = po.ClassName()
	Choose Case ls_classname
		Case "ribbonsmallbuttonitem"
			if al_index > 0 then
				li_rc = this.GetMenuByButtonHandle (al_handle, lr_Menu)
				if li_rc = 1 then
					lr_Menu.getitem( al_index , menuitem)
					this.post event itemclicked( menuitem.tag, al_handle, al_index , 0)
					return li_rc
				end if
			end if			
			smallbutton = po
			this.post event itemclicked( smallbutton.tag, al_handle, 0, 0)
		Case "ribbonlargebuttonitem"
			if al_index > 0 then
				li_rc = this.GetMenuByButtonHandle (al_handle, lr_Menu)
				if li_rc = 1 then
					lr_Menu.getitem( al_index , menuitem)
					this.post event itemclicked( menuitem.tag, al_handle, al_index , 0)
					return li_rc
				end if
			end if
			largebutton = po			
			this.post event itemclicked( largebutton.tag, al_handle, 0, 0)
		Case "ribbontabbuttonitem"			
			tabbutton = po
			this.post event itemclicked( tabbutton.tag, al_handle, 0, 0)
		Case "ribbonapplicationbuttonitem"
			appbutton = po
			appbutton.getmenu( appmenu)
//			IF al_subindex = 0 THEN
//				appMenu.GetRecentItem(al_Index,menuItem)	
//				this.post event itemclicked( appbutton.tag, al_handle, al_index, al_subindex)
//			ELSE
//				appmenu.GetMasterItem ( al_index, al_subindex,  menuitem )
				appmenu.getmasteritem( al_index, menuitem)
				this.post event itemclicked( menuitem.tag, al_handle, al_index, al_subindex)
//			END IF
	End Choose
	
End if

Return li_rc
end function

public function integer f_change_action_button (long al_handle, long al_index, long al_subindex);PowerObject						po
RibbonTabButtonItem 			tabbutton
RibbonSmallButtonItem			smallbutton
RibbonLargeButtonItem			largebutton
RibbonApplicationButtonItem 	appbutton
RibbonMenu 						lr_Menu
RibbonMenuItem 					menuitem
RibbonApplicationMenu 			appmenu
String									ls_classname
Integer								li_rc

li_rc = this.GetItem ( al_handle, po )
IF li_rc = 1 THEN
	ls_classname = po.ClassName()
	Choose Case ls_classname
		Case "ribbonsmallbuttonitem"	
			smallbutton = po
			if smallbutton.tag = 'e_modify' then
				smallbutton.tag = 'e_save'
				smallbutton.picturename = 'SaveBig!'
				smallbutton.shortcut = "Ctrl+S"
				smallbutton.powertipdescription = "Lưu Ctrl+S"
				this.setsmallbutton(al_handle , smallbutton)
			elseif smallbutton.tag = 'e_save' then
				smallbutton.tag = 'e_modify'
				smallbutton.picturename = 'ModifySmall!'
				smallbutton.shortcut = "Ctrl+M"
				smallbutton.powertipdescription = "Chỉnh sửa Ctrl+M"
				this.setsmallbutton(al_handle , smallbutton)		
			elseif  smallbutton.tag = 'e_add' or smallbutton.tag = 'e_insert'  then
				this.getitembytag(  'e_modify', po)
				smallbutton = po 
				smallbutton.tag = 'e_save'
				smallbutton.picturename = 'SaveBig!'
				smallbutton.shortcut = "Ctrl+S"
				smallbutton.powertipdescription = "Lưu Ctrl+S"
				this.setsmallbutton(smallbutton.itemhandle , smallbutton)				
			elseif smallbutton.tag = 'e_post' then
				smallbutton.tag = 'e_unpost'
				smallbutton.picturename = 'Custom094!'
				smallbutton.shortcut = ""
				smallbutton.powertipdescription = "Sửa ghi sổ"
				this.setsmallbutton(al_handle , smallbutton)							
			elseif smallbutton.tag = 'e_unpost' then
				smallbutton.tag = 'e_post'
				smallbutton.picturename = 'Edit!'
				smallbutton.shortcut = "Ctrl+G"
				smallbutton.powertipdescription = "Ghi sổ Ctrl+G"
				this.setsmallbutton(al_handle , smallbutton)			
			elseif smallbutton.tag = 'e_filter' then
				if smallbutton.picturename = 'filterbig!' then
					smallbutton.picturename = 'Pics\filter4.jpg'
				else
					smallbutton.picturename = 'filterbig!'
				end if
				this.setsmallbutton(al_handle , smallbutton)						
			elseif smallbutton.tag = 'e_send_2_approve' then
			elseif smallbutton.tag = 'e_request_2_change' then
			end if
			
		Case "ribbonlargebuttonitem"

			largebutton = po			
			if largebutton.tag = 'e_modify' then
				largebutton.tag = 'e_save'
				largebutton.picturename = 'SaveBig!'
				largebutton.shortcut = "Ctrl+S"
				largebutton.powertipdescription = "Lưu Ctrl+S"
				largebutton.text = 'Lưu'
				this.setlargebutton(al_handle , largebutton)
			elseif largebutton.tag = 'e_save' then
				largebutton.tag = 'e_modify'
				largebutton.picturename = 'ModifySmall!'
				largebutton.shortcut = "Ctrl+M"
				largebutton.text = 'Chỉnh sửa'				
				largebutton.powertipdescription = "Chỉnh sửa Ctrl+M"
				this.setlargebutton(al_handle , largebutton)		
			elseif  largebutton.tag = 'e_add' or largebutton.tag = 'e_insert'  then
				this.getitembytag(  'e_modify', po)
				largebutton = po 
				largebutton.tag = 'e_save'
				largebutton.picturename = 'SaveBig!'
				largebutton.shortcut = "Ctrl+S"
				largebutton.powertipdescription = "Lưu Ctrl+S"
				largebutton.text = 'Lưu'
				this.setlargebutton(largebutton.itemhandle , largebutton)				
			elseif largebutton.tag = 'e_post' then
				largebutton.tag = 'e_unpost'
				largebutton.picturename = 'Custom094!'
				largebutton.shortcut = ""
				largebutton.powertipdescription = "Sửa ghi sổ"
				largebutton.text = 'Sửa ghi sổ'
				this.setlargebutton(al_handle , largebutton)							
			elseif largebutton.tag = 'e_unpost' then
				largebutton.tag = 'e_post'
				largebutton.picturename = 'Edit!'
				largebutton.shortcut = "Ctrl+G"
				largebutton.powertipdescription = "Ghi sổ Ctrl+G"
				largebutton.text = 'Ghi sổ'
				this.setlargebutton(al_handle , largebutton)			
			elseif largebutton.tag = 'e_filter' then
				if largebutton.picturename = 'filterbig!' then
					largebutton.picturename = 'Pics\filter4.jpg'
				else
					largebutton.picturename = 'filterbig!'
				end if
				this.setlargebutton(al_handle , largebutton)						
			elseif largebutton.tag = 'e_send_2_approve' then
			elseif largebutton.tag = 'e_request_2_change' then
			end if			
		Case "ribbontabbuttonitem"			
			tabbutton = po

		Case "ribbonapplicationbuttonitem"
			appbutton = po
			appbutton.getmenu( appmenu)

	End Choose
	
End if

Return li_rc
end function

public function integer f_enable_panel_copy (ribbonpanelitem vrpi_action, string vs_type, string vs_doc_status, boolean vb_editing, string vs_enable_buttons, boolean vb_change_4_edit);boolean								lb_enable
String									ls_classname
Integer								li_rc, li_idx, li_itemCnt, li_idx1

RibbonCategoryItem			l_rci
RibbonPanelItem				l_rpi, l_rpi_action
RibbonLargeButtonItem 		l_rlbi, l_rlbi_null
RibbonMenu						l_rMenu		
RibbonMenuItem				l_rmitem, l_rmitem_tmp
RibbonGroupItem				l_rgi
RibbonSmallButtonItem 		l_rsbi, l_rsbi_null

//-- panel: action --//

li_rc = this.getchilditemcount( vrpi_action.itemhandle )
FOR li_idx = 1 to li_rc
	this.getchilditembyindex( vrpi_action.itemhandle, li_idx , l_rsbi)
	if pos(vs_enable_buttons, l_rsbi.tag+';') > 0 then
		lb_enable =  true 
	else
		lb_enable =  false
	end if	
	if  l_rsbi.tag= 'b_self_copy' then
		l_rsbi.enabled =  lb_enable and not isnull(vs_doc_status ) 
	else
		l_rsbi.getmenu( l_rMenu)
		li_itemCnt = l_rMenu.GetItemCount ()
		FOR li_idx1 = 1 to li_itemCnt
			l_rMenu.getitem( li_idx1 , l_rmitem)
			if pos(vs_enable_buttons, l_rmitem.tag+';') > 0 then
				lb_enable = true
			else
				lb_enable =  false
			end if
			l_rmitem.enabled = lb_enable and not isnull(vs_doc_status )
			l_rMenu.setitem( li_idx1, l_rmitem)
		NEXT
	end if
	this.setsmallbutton( l_rsbi.itemhandle , l_rsbi)
NEXT




Return li_rc
end function

public function integer f_enable_panel_print (ribbonpanelitem vrpi_action, string vs_type, string vs_doc_status, boolean vb_editing, string vs_enable_buttons, boolean vb_change_4_edit);
String									ls_classname
Integer								li_rc, li_idx, li_itemCnt, li_idx1

RibbonCategoryItem			l_rci
RibbonPanelItem				l_rpi, l_rpi_action
RibbonLargeButtonItem 		l_rlbi, l_rlbi_null
RibbonMenu						l_rMenu		
RibbonMenuItem				l_rmitem, l_rmitem_tmp
RibbonGroupItem				l_rgi
RibbonSmallButtonItem 		l_rsbi, l_rsbi_null

//-- panel: action --//

li_rc = this.getchilditemcount( vrpi_action.itemhandle )
FOR li_idx = 1 to li_rc
	this.getchilditembyindex( vrpi_action.itemhandle, li_idx , l_rsbi)
	if pos(vs_enable_buttons,  l_rsbi.tag+';') > 0 then
		l_rsbi.enabled = not isnull( vs_doc_status)
	else
		l_rsbi.enabled =  false
	end if	
	if  l_rsbi.tag= 'b_preview'  then
		l_rsbi.getmenu( l_rMenu)
		li_itemCnt = l_rMenu.GetItemCount ()
		FOR li_idx1 = 1 to li_itemCnt
			l_rMenu.getitem( li_idx1 , l_rmitem)
			if pos(vs_enable_buttons,  l_rmitem.tag+';') > 0 then
				l_rmitem.enabled =  not isnull( vs_doc_status)
			else
				l_rmitem.enabled =  false
			end if
			l_rMenu.setitem( li_idx1, l_rmitem)
		NEXT
	end if
	this.setsmallbutton( l_rsbi.itemhandle , l_rsbi)
NEXT




Return li_rc
end function

public function integer f_enable_panel_approve (ribbonpanelitem vrpi_action, string vs_type, string vs_doc_status, boolean vb_editing, string vs_enable_buttons, boolean vb_change_4_edit);boolean								lb_enable
String									ls_classname
Integer								li_rc, li_idx, li_itemCnt, li_idx1

RibbonCategoryItem			l_rci
RibbonPanelItem				l_rpi, l_rpi_action
RibbonLargeButtonItem 		l_rlbi, l_rlbi_null
RibbonMenu						l_rMenu		
RibbonMenuItem				l_rmitem, l_rmitem_tmp
RibbonGroupItem				l_rgi
RibbonSmallButtonItem 		l_rsbi, l_rsbi_null

//-- panel: action --//

li_rc = this.getchilditemcount( vrpi_action.itemhandle )
FOR li_idx = 1 to li_rc
	this.getchilditembyindex( vrpi_action.itemhandle, li_idx , l_rsbi)
	if pos(vs_enable_buttons, l_rsbi.tag+';') > 0 then
		lb_enable =  true
	else
		lb_enable =  false
	end if	
	if l_rsbi.tag = 'b_send_2_approve' then
		if vs_doc_status = 'new' or vs_doc_status = 'rejected' then
			l_rsbi.enabled = lb_enable  and not vb_editing
		end if
	elseif l_rsbi.tag = 'b_request_2_change' then
		if vs_doc_status = 'request_2_approve' or vs_doc_status = 'approved' then
			l_rsbi.enabled = lb_enable and not vb_editing
		end if		
	elseif l_rsbi.tag = 'b_approve' then
		if vs_doc_status = 'request_2_approve' then
			l_rsbi.enabled = lb_enable and not vb_editing
		end if				
	elseif l_rsbi.tag = 'b_reject' then
		if vs_doc_status = 'request_2_approve' then
			l_rsbi.enabled = lb_enable and not vb_editing
		end if			
	elseif l_rsbi.tag = 'b_appr_trace' then
		l_rsbi.enabled = lb_enable and not vb_editing
	end if
	this.setsmallbutton( l_rsbi.itemhandle , l_rsbi)
NEXT




Return li_rc
end function

public function integer f_enable_panel_update (ribbonpanelitem vrpi_action, string vs_type, string vs_doc_status, boolean vb_editing, string vs_enable_buttons, boolean vb_change_4_edit);boolean								lb_enable
String									ls_classname
Integer								li_rc, li_idx, li_itemCnt, li_idx1

RibbonCategoryItem			l_rci
RibbonPanelItem				l_rpi, l_rpi_action
RibbonLargeButtonItem 		l_rlbi, l_rlbi_null
RibbonMenu						l_rMenu		
RibbonMenuItem				l_rmitem, l_rmitem_tmp
RibbonGroupItem				l_rgi
RibbonSmallButtonItem 		l_rsbi, l_rsbi_null

//-- panel: action --//

li_rc = this.getchilditemcount( vrpi_action.itemhandle )
FOR li_idx = 1 to li_rc
	this.getchilditembyindex( vrpi_action.itemhandle, li_idx , l_rsbi)
	if pos(vs_enable_buttons, l_rsbi.tag+';') > 0 then
		lb_enable =  true
	else
		lb_enable =  false
	end if	
	if l_rsbi.tag = 'b_complete' or l_rsbi.tag = 'b_lose'then
		if vs_doc_status = 'new' then
			l_rsbi.enabled = lb_enable and not vb_editing
		else
			l_rsbi.enabled = false
		end if		
	else
		l_rsbi.enabled = lb_enable and not vb_editing and not isnull(vs_doc_status)
	end if
		
	this.setsmallbutton( l_rsbi.itemhandle , l_rsbi)
NEXT




Return li_rc
end function

public function integer f_enable_panel_objects (ribbonpanelitem vrpi_action, string vs_type, string vs_doc_status, boolean vb_editing, string vs_enable_buttons, boolean vb_change_4_edit);boolean								lb_enable
String									ls_classname
Integer								li_rc, li_idx, li_itemCnt, li_idx1

RibbonCategoryItem			l_rci
RibbonPanelItem				l_rpi, l_rpi_action
RibbonLargeButtonItem 		l_rlbi, l_rlbi_null
RibbonMenu						l_rMenu		
RibbonMenuItem				l_rmitem, l_rmitem_tmp
RibbonGroupItem				l_rgi
RibbonSmallButtonItem 		l_rsbi, l_rsbi_null

//-- panel: action --//

li_rc = this.getchilditemcount( vrpi_action.itemhandle )
FOR li_idx = 1 to li_rc
	this.getchilditembyindex( vrpi_action.itemhandle, li_idx , l_rlbi)
	if pos(vs_enable_buttons, l_rlbi.tag+';') > 0 then
		lb_enable =  true
	else
		lb_enable =  false
	end if	
	l_rlbi.enabled = lb_enable and not vb_editing and not isnull(vs_doc_status)

	this.setLargebutton( l_rlbi.itemhandle , l_rlbi)
NEXT




Return li_rc
end function

public function integer f_ctrl_enable_button (string vs_type, string vs_doc_status, boolean vb_editing, boolean vb_updatable, boolean vb_change_4_edit, string vs_enable_buttons, boolean vb_detail);
String									ls_classname
Integer								li_rc, li_idx

RibbonCategoryItem			l_rci
RibbonPanelItem				l_rpi


this.getcategorybyindex( 1, l_rci)
li_rc =  this.getchilditemcount(l_rci.itemhandle )
FOR li_idx = 1 to li_rc
	this.getchilditembyindex( l_rci.itemhandle, li_idx, l_rpi)	
	
	if l_rpi.tag = 'Tabs' then
		this.f_enable_panel_tab( l_rpi,  vs_type, vs_doc_status,  vb_editing, vb_updatable, vs_enable_buttons)
	elseif l_rpi.tag = 'Actions' then
		this.f_enable_panel_action( l_rpi,  vs_type, vs_doc_status,  vb_editing, vb_updatable,vb_change_4_edit, vb_detail,vs_enable_buttons)
	elseif l_rpi.tag = 'Navigation' then
		this.f_enable_panel_action( l_rpi,  vs_type, vs_doc_status,  vb_editing, vb_updatable,vb_change_4_edit, vb_detail,vs_enable_buttons)
	elseif l_rpi.tag = 'Copy' then
		this.f_enable_panel_copy( l_rpi,  vs_type, vs_doc_status,  vb_editing, vs_enable_buttons,vb_change_4_edit)
	elseif l_rpi.tag = 'Print' then	
		this.f_enable_panel_print( l_rpi,  vs_type, vs_doc_status,  vb_editing, vs_enable_buttons,vb_change_4_edit)
	elseif l_rpi.tag = 'Approve' then
		this.f_enable_panel_approve( l_rpi,  vs_type, vs_doc_status,  vb_editing, vs_enable_buttons,vb_change_4_edit)
	elseif l_rpi.tag = 'Update' then	
		this.f_enable_panel_update( l_rpi,  vs_type, vs_doc_status,  vb_editing, vs_enable_buttons,vb_change_4_edit)
	elseif l_rpi.tag = 'Objects' then	
		this.f_enable_panel_objects( l_rpi,  vs_type, vs_doc_status,  vb_editing, vs_enable_buttons,vb_change_4_edit)
	end if
NEXT


Return li_rc
end function

public function integer f_enable_panel_action (ribbonpanelitem vrpi_action, string vs_type, string vs_doc_status, boolean vb_editing, boolean vb_updatable, boolean vb_change_4_edit, boolean vb_detail, string vs_enable_buttons);
String									ls_classname
Integer								li_rc, li_idx

RibbonCategoryItem			l_rci
RibbonPanelItem				l_rpi, l_rpi_action
RibbonLargeButtonItem 		l_rlbi, l_rlbi_null
RibbonMenu						l_rMenu		
RibbonMenuItem				l_rmitem, l_rmitem_tmp
RibbonGroupItem				l_rgi
RibbonSmallButtonItem 		l_rsbi, l_rsbi_null

//-- panel: action --//
if this.getchilditembyindex( vrpi_action.itemhandle, 1, l_rgi)	= 1  then
	this.f_enable_panel_action_group( vs_type, vs_doc_status, vb_editing, vb_updatable, vb_change_4_edit, vb_detail, vs_enable_buttons, l_rgi)
	this.getchilditembyindex( vrpi_action.itemhandle, 2, l_rgi)
	this.f_enable_panel_action_group( vs_type, vs_doc_status, vb_editing, vb_updatable, vb_change_4_edit, vb_detail, vs_enable_buttons, l_rgi)
else
	this.f_enable_panel_action_panel(  vs_type, vs_doc_status, vb_editing, vb_updatable, vb_change_4_edit, vb_detail, vs_enable_buttons, vrpi_action)
end if



Return li_rc
end function

public function integer f_enable_panel_action_group (string vs_type, string vs_doc_status, boolean vb_editing, boolean vb_updatable, boolean vb_change_4_edit, boolean vb_detail, string vs_enable_buttons, ref ribbongroupitem r_rgi);
String									ls_classname
Integer								li_rc, li_idx

RibbonCategoryItem			l_rci
RibbonPanelItem				l_rpi, l_rpi_action
RibbonLargeButtonItem 		l_rlbi, l_rlbi_null
RibbonMenu						l_rMenu		
RibbonMenuItem				l_rmitem, l_rmitem_tmp
//RibbonGroupItem				l_rgi
RibbonSmallButtonItem 		l_rsbi, l_rsbi_null


li_rc = this.getchilditemcount( r_rgi.itemhandle )
FOR li_idx = 1 to li_rc
	this.getchilditembyindex( r_rgi.itemhandle, li_idx , l_rsbi)
	if  l_rsbi.tag= 'e_refresh'or  l_rsbi.tag = 'e_filter' or   l_rsbi.tag = 'e_book' then
		if vb_editing then
			l_rsbi.enabled =  false
		else
			l_rsbi.enabled =  true
		end if
	else
		if vs_type = 'document' then
			if vs_doc_status = '' or isnull(vs_doc_status)  then
				choose case l_rsbi.tag
					case 'e_add'
						l_rsbi.enabled =  vb_updatable and pos(vs_enable_buttons, 'e_add;') >0 
					case 'e_modify','e_save','e_delete','e_post'
						l_rsbi.enabled =  false
					case 'e_insert'
						l_rsbi.enabled =  vb_updatable and pos(vs_enable_buttons, 'e_add;') >0 and not vb_change_4_edit
					case 'e_first','e_prior','e_prior','e_next','e_last','e_book','e_action_attach','e_user_trace','e_cancel'
						l_rsbi.enabled =  false
				end choose
			elseif vs_doc_status = 'new' then
				choose case l_rsbi.tag
					case 'e_add'
						l_rsbi.enabled =  vb_updatable and not vb_editing and pos(vs_enable_buttons, 'e_add;')>0
					case 'e_modify','e_delete'
						l_rsbi.enabled =  vb_updatable  and pos(vs_enable_buttons,  l_rsbi.tag+';')>0
					case 'e_save'
						l_rsbi.enabled =  vb_updatable
					case 'e_post'
						l_rsbi.enabled =  vb_updatable and not vb_editing and pos(vs_enable_buttons,  l_rsbi.tag+';')>0
					case 'e_insert' 
						l_rsbi.enabled =  vb_updatable and not vb_editing and not vb_change_4_edit and pos(vs_enable_buttons, 'e_add;')>0
					case 'e_first','e_prior','e_prior','e_next','e_last','e_book','e_action_attach','e_user_trace','e_cancel'
						l_rsbi.enabled =  true
				end choose	
			else
				choose case l_rsbi.tag
					case 'e_add','e_insert','e_unpost'
						l_rsbi.enabled =  vb_updatable and pos(vs_enable_buttons,  l_rsbi.tag+';')>0
					case 'e_modify','e_save','e_delete'
						l_rsbi.enabled =  false
					case 'e_first','e_prior','e_prior','e_next','e_last','e_book','e_action_attach','e_user_trace','e_cancel'
						l_rsbi.enabled =  true
				end choose				
			end if
		elseif vs_type = 'detail' then
		elseif vs_type = 'object' then
			if vb_detail and vb_change_4_edit then
				if isnull(vs_doc_status) or vs_doc_status = ''  then
					choose case l_rsbi.tag
						case 'e_add','e_insert'
							l_rsbi.enabled =  vb_updatable and vb_editing and pos(vs_enable_buttons, l_rsbi.tag+';')>0
						case 'e_modify' 
							l_rsbi.enabled =  not vb_editing and vb_updatable
						case 'e_save'
							l_rsbi.enabled =  vb_editing and vb_updatable
						case 'e_delete'
							l_rsbi.enabled =  vb_updatable and vb_editing and pos(vs_enable_buttons, l_rsbi.tag+';')>0
						case 'e_first','e_prior','e_prior','e_next','e_last','e_book','e_action_attach','e_user_trace','e_cancel'
							l_rsbi.enabled =  true
					end choose
				else
					choose case l_rsbi.tag
						case 'e_add','e_insert'
							l_rsbi.enabled =  vb_updatable  and vb_editing  and pos(vs_enable_buttons, 'e_add;')>0 //and (not vb_editing or not vb_change_4_edit)
						case 'e_modify','e_delete'
							l_rsbi.enabled =  vb_updatable and pos(vs_enable_buttons,  l_rsbi.tag+';')>0
						case 'e_save'
							l_rsbi.enabled =  vb_updatable
						case 'e_first','e_prior','e_prior','e_next','e_last','e_book','e_action_attach','e_user_trace','e_cancel'
							l_rsbi.enabled =  true
					end choose	
				end if						
			elseif  vb_detail and not vb_change_4_edit then
				if isnull(vs_doc_status) or vs_doc_status = ''  then
					choose case l_rsbi.tag
						case 'e_add','e_insert'
							l_rsbi.enabled =  vb_updatable and pos(vs_enable_buttons, 'e_add;')>0
						case 'e_modify' 
							l_rsbi.enabled =  not vb_editing and vb_updatable  and pos(vs_enable_buttons, 'e_modify;')>0
						case 'e_save'
							l_rsbi.enabled =  vb_editing and vb_updatable
						case 'e_delete'
							l_rsbi.enabled =  pos(vs_enable_buttons, 'e_delete;')>0 and vb_updatable
						case 'e_first','e_prior','e_prior','e_next','e_last','e_book','e_action_attach','e_user_trace','e_cancel'
							l_rsbi.enabled =  true
					end choose
				end if
			else
				if isnull(vs_doc_status)  then
					choose case l_rsbi.tag
						case 'e_add','e_insert'
							l_rsbi.enabled =  vb_updatable  and pos(vs_enable_buttons, 'e_add;')>0
						case 'e_modify','e_save','e_delete'
							l_rsbi.enabled =  false
						case 'e_first','e_prior','e_prior','e_next','e_last','e_book','e_action_attach','e_user_trace','e_cancel'
							l_rsbi.enabled =  true
					end choose
				else
					choose case l_rsbi.tag
						case 'e_add','e_insert'
							l_rsbi.enabled =  vb_updatable and (not vb_editing or not vb_change_4_edit)  and pos(vs_enable_buttons, 'e_add;')>0
						case 'e_modify','e_delete'
							l_rsbi.enabled =  vb_updatable  and pos(vs_enable_buttons,  l_rsbi.tag+';')>0							
						case 'e_save'
							l_rsbi.enabled =  vb_updatable 
						case 'e_first','e_prior','e_prior','e_next','e_last','e_book','e_action_attach','e_user_trace','e_cancel'
							l_rsbi.enabled =  true
					end choose	
				end if			
			end if
		elseif vs_type = 'report' then
		end if
	end if
	this.setsmallbutton( l_rsbi.itemhandle , l_rsbi)
NEXT


Return li_rc
end function

public function integer f_enable_panel_action_panel (string vs_type, string vs_doc_status, boolean vb_editing, boolean vb_updatable, boolean vb_change_4_edit, boolean vb_detail, string vs_enable_buttons, ref ribbonpanelitem r_rpi);
String									ls_classname
Integer								li_rc, li_idx

RibbonCategoryItem			l_rci
RibbonPanelItem				l_rpi, l_rpi_action
RibbonLargeButtonItem 		l_rlbi, l_rlbi_null
RibbonMenu						l_rMenu		
RibbonMenuItem				l_rmitem, l_rmitem_tmp
//RibbonGroupItem				l_rgi
RibbonSmallButtonItem 		l_rsbi, l_rsbi_null

//-- panel: action --//
//if this.getchilditembyindex( vrpi_action.itemhandle, 1, l_rgi)	= -1 then
//	li_rc = this.getchilditemcount( l_rgi.itemhandle )
//	this.getchilditembyindex( vrpi_action.itemhandle, 1, l_rlbi)
//end if
li_rc = this.getchilditemcount( r_rpi.itemhandle )
FOR li_idx = 1 to li_rc
	this.getchilditembyindex( r_rpi.itemhandle, li_idx , l_rlbi)
	if  l_rlbi.tag= 'e_refresh'or  l_rlbi.tag = 'e_filter' or   l_rlbi.tag = 'e_book' then
		if vb_editing then
			l_rlbi.enabled =  false
		else
			l_rlbi.enabled =  true
		end if
	else
		if vs_type = 'document' then
			if vs_doc_status = '' or isnull(vs_doc_status)  then
				choose case l_rlbi.tag
					case 'e_add'
						l_rlbi.enabled =  vb_updatable and pos(vs_enable_buttons, 'e_add;') >0 
					case 'e_modify','e_save','e_delete','e_post'
						l_rlbi.enabled =  false
					case 'e_insert'
						l_rlbi.enabled =  vb_updatable and pos(vs_enable_buttons, 'e_add;') >0 and not vb_change_4_edit
					case 'e_first','e_prior','e_prior','e_next','e_last','e_book','e_action_attach','e_user_trace','e_cancel'
						l_rlbi.enabled =  false
				end choose
			elseif vs_doc_status = 'new' then
				choose case l_rlbi.tag
					case 'e_add'
						l_rlbi.enabled =  vb_updatable and not vb_editing and pos(vs_enable_buttons, 'e_add;')>0
					case 'e_modify','e_delete'
						l_rlbi.enabled =  vb_updatable  and pos(vs_enable_buttons,  l_rlbi.tag+';')>0
					case 'e_save'
						l_rlbi.enabled =  vb_updatable
					case 'e_post'
						l_rlbi.enabled =  vb_updatable and not vb_editing and pos(vs_enable_buttons,  l_rlbi.tag+';')>0
					case 'e_insert' 
						l_rlbi.enabled =  vb_updatable and not vb_editing and not vb_change_4_edit and pos(vs_enable_buttons, 'e_add;')>0
					case 'e_first','e_prior','e_prior','e_next','e_last','e_book','e_action_attach','e_user_trace','e_cancel'
						l_rlbi.enabled =  true
				end choose	
			else
				choose case l_rlbi.tag
					case 'e_add','e_insert','e_unpost'
						l_rlbi.enabled =  vb_updatable and pos(vs_enable_buttons,  l_rlbi.tag+';')>0
					case 'e_modify','e_save','e_delete'
						l_rlbi.enabled =  false
					case 'e_first','e_prior','e_prior','e_next','e_last','e_book','e_action_attach','e_user_trace','e_cancel'
						l_rlbi.enabled =  true
				end choose				
			end if
		elseif vs_type = 'detail' then
		elseif vs_type = 'object' then
			if vb_detail and vb_change_4_edit then
				if isnull(vs_doc_status) or vs_doc_status = ''  then
					choose case l_rlbi.tag
						case 'e_add','e_insert'
							if pos(vs_enable_buttons, l_rlbi.tag+';') = 0 then
								this.DeleteLargeButton (l_rlbi.ItemHandle)
							else
								l_rlbi.enabled =  vb_updatable and vb_editing and pos(vs_enable_buttons, l_rlbi.tag+';')>0
							end if
						case 'e_modify' 
							l_rlbi.enabled =  not vb_editing and vb_updatable
						case 'e_save'
							l_rlbi.enabled =  vb_editing and vb_updatable
						case 'e_delete'
							l_rlbi.enabled =  vb_updatable and vb_editing and pos(vs_enable_buttons, l_rlbi.tag+';')>0
						case 'e_first','e_prior','e_prior','e_next','e_last','e_book','e_action_attach','e_user_trace','e_cancel'
							l_rlbi.enabled =  true
					end choose
				else
					choose case l_rlbi.tag
						case 'e_add','e_insert'
							if pos(vs_enable_buttons, l_rlbi.tag+';') = 0 then
								this.DeleteLargeButton (l_rlbi.ItemHandle)
							else
								l_rlbi.enabled =  vb_updatable and vb_editing and pos(vs_enable_buttons, l_rlbi.tag+';')>0
							end if
						case 'e_modify','e_delete'
							l_rlbi.enabled =  vb_updatable and pos(vs_enable_buttons,  l_rlbi.tag+';')>0
						case 'e_save'
							l_rlbi.enabled =  vb_updatable
						case 'e_first','e_prior','e_prior','e_next','e_last','e_book','e_action_attach','e_user_trace','e_cancel'
							l_rlbi.enabled =  true
					end choose	
				end if						
			elseif  vb_detail and not vb_change_4_edit then
				if isnull(vs_doc_status) or vs_doc_status = ''  then
					choose case l_rlbi.tag
						case 'e_add','e_insert'
							if pos(vs_enable_buttons, l_rlbi.tag+';') = 0 then
								this.DeleteLargeButton (l_rlbi.ItemHandle)
							else
								l_rlbi.enabled =  vb_updatable and vb_editing and pos(vs_enable_buttons, l_rlbi.tag+';')>0
							end if
						case 'e_modify' 
							l_rlbi.enabled =  not vb_editing and vb_updatable  and pos(vs_enable_buttons, 'e_modify;')>0
						case 'e_save'
							l_rlbi.enabled =  vb_editing and vb_updatable
						case 'e_delete'
							l_rlbi.enabled =  pos(vs_enable_buttons, 'e_delete;')>0 and vb_updatable
						case 'e_first','e_prior','e_prior','e_next','e_last','e_book','e_action_attach','e_user_trace','e_cancel'
							l_rlbi.enabled =  true
					end choose
				end if
			else
				if isnull(vs_doc_status)  then
					choose case l_rlbi.tag
						case 'e_add','e_insert', 'e_okclose'
							if pos(vs_enable_buttons, l_rlbi.tag+';') = 0 then
								this.DeleteLargeButton (l_rlbi.ItemHandle)
							else
								l_rlbi.enabled =  vb_updatable and vb_editing and pos(vs_enable_buttons, l_rlbi.tag+';')>0
							end if
						case 'e_modify','e_save','e_delete'
							l_rlbi.enabled =  false
						case 'e_first','e_prior','e_prior','e_next','e_last','e_book','e_action_attach','e_user_trace','e_cancel'
							l_rlbi.enabled =  true
					end choose
				else
					choose case l_rlbi.tag
						case 'e_add','e_insert', 'e_okclose'
							if pos(vs_enable_buttons, l_rlbi.tag+';') = 0 then
								this.DeleteLargeButton (l_rlbi.ItemHandle)
							else
								l_rlbi.enabled =  vb_updatable and vb_editing and pos(vs_enable_buttons, l_rlbi.tag+';')>0
							end if
						case 'e_modify','e_delete'
							l_rlbi.enabled =  vb_updatable  and pos(vs_enable_buttons,  l_rlbi.tag+';')>0							
						case 'e_save'
							l_rlbi.enabled =  vb_updatable 
						case 'e_first','e_prior','e_prior','e_next','e_last','e_book','e_action_attach','e_user_trace','e_cancel'
							l_rlbi.enabled =  true
					end choose	
				end if			
			end if
		elseif vs_type = 'report' then
		end if
	end if
	this.setLargebutton( l_rlbi.itemhandle , l_rlbi)
NEXT

Return li_rc
end function

public function integer f_enable_panel_tab (ribbonpanelitem vrpi_tab, string vs_type, string vs_doc_status, boolean vb_editing, boolean vb_updatable, string vs_enable_buttons);
String									ls_classname
Integer								li_rc

RibbonCategoryItem			l_rci
RibbonPanelItem				l_rpi, l_rpi_action
RibbonLargeButtonItem 		l_rlbi, l_rlbi_null
RibbonMenu						l_rMenu		
RibbonMenuItem				l_rmitem, l_rmitem_tmp
RibbonGroupItem				l_rgi
RibbonSmallButtonItem 		l_rsbi, l_rsbi_null

//-- panel: tab --//
if vs_type = 'document' then
	if isnull(vs_doc_status) then	
		this.getchilditembyindex( vrpi_tab.itemhandle, 1, l_rsbi)
		l_rsbi.enabled = true
//		this.setsmallbutton( l_rsbi.itemhandle , l_rsbi)
	else
		this.getchilditembyindex( vrpi_tab.itemhandle, 1, l_rsbi)
		l_rsbi.enabled = true
//		this.setsmallbutton( l_rsbi.itemhandle , l_rsbi)
		this.getchilditembyindex( vrpi_tab.itemhandle, 2, l_rsbi)
		l_rsbi.enabled = true
//		this.setsmallbutton( l_rsbi.itemhandle , l_rsbi)		
	end if
elseif vs_type = 'detail' then
elseif vs_type = 'object' then
	if this.getchilditembyindex( vrpi_tab.itemhandle, 1, l_rsbi) = 1 then
		l_rsbi.enabled = true
		this.setsmallbutton( l_rsbi.itemhandle , l_rsbi)	
	else
		this.getchilditembyindex( vrpi_tab.itemhandle, 1, l_rlbi)
		if pos(vs_enable_buttons, l_rlbi.tag +';') > 0 then
			l_rlbi.enabled = true		
		else
			this.DeleteLargeButton (l_rlbi.ItemHandle)
		end if
		this.getchilditembyindex( vrpi_tab.itemhandle, 2, l_rlbi)
		if pos(vs_enable_buttons, l_rlbi.tag +';') > 0 then
			l_rlbi.enabled = true			
		else
			this.DeleteLargeButton (l_rlbi.ItemHandle)
		end if		
	end if
elseif vs_type = 'report' then
end if

Return li_rc
end function

on u_rbb.create
end on

on u_rbb.destroy
end on

