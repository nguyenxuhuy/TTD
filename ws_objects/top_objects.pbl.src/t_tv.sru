$PBExportHeader$t_tv.sru
$PBExportComments$top tree view control
forward
global type t_tv from treeview
end type
end forward

global type t_tv from treeview
string tag = "top"
integer width = 480
integer height = 400
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean border = false
boolean linesatroot = true
boolean hideselection = false
grsorttype sorttype = userdefinedsort!
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
event e_mousemove pbm_mousemove
end type
global t_tv t_tv

type variables
string				is_popupMenu
boolean			ib_deleting
end variables

forward prototypes
public function integer f_delete_all_items ()
public function string f_get_accessible_name ()
public function long f_insertitem (long vl_handle, string vs_data, string vs_label, integer vi_picture, integer vi_selectpicture)
public function string f_get_accessible_description ()
public function boolean f_set_visible (boolean vb_visible)
public function string f_gettext ()
public function string f_get_popupmenu_name ()
public function long f_find_item_hdl (string vs_findstring, integer vl_root_hdl)
public function long f_populate_item (powerobject vpo_item)
public function long f_find_item_hdl (string vs_findstring)
public function integer f_getparentwindow (ref window aw_parent)
public function string f_get_popmenu_name ()
public function long f_find_parent_hdl (string vs_findstring, long vl_root_hdl)
public function integer f_send_message_to_object (ref powerobject rtv_handling, long vl_clicked_handle, string vs_message)
public function long f_reset_item (powerobject vpo_item, long vl_handle)
public function integer f_send_message_to_object (ref powerobject rpm_handling, string vs_message)
public function long f_insertitemlast (long vl_parenthandle, powerobject vpo_item)
public function long f_find_item_hdl (string vs_findstring, string vs_parentstring, ref long rl_parent_hdl)
public function long f_find_item_hdl (string vs_findstring, string vs_parentstring, integer vl_root_hdl, ref long rl_parent_hdl)
public function long f_populate_item (powerobject vpo_item, long vl_parent_hdl)
end prototypes

event e_mousemove;
//t_w_main			lw_parent

//-- kiểm tra w_search close chưa --//
//this.f_getparentwindow(lw_parent )
//if isvalid(lw_parent) then
//	if lw_parent.classname( ) <> 's_w_search' then
//		if isvalid(t_w_mdi.iw_search) then
//			if t_w_mdi.iw_search.height > t_w_mdi.iw_search.dw_search.height then
//				t_w_mdi.iw_search.height = t_w_mdi.iw_search.dw_search.height
//				t_w_mdi.iw_search.width = t_w_mdi.iw_search.dw_search.width
//				if gs_user_lang = 'vi-vn' then
//					t_w_mdi.iw_search.dw_search.setitem(1,'search','Gõ vào điều cần tìm và bấm "Enter"...')
//				elseif gs_user_lang = 'en-us' then
//					t_w_mdi.iw_search.dw_search.setitem(1,'search','Key in what to search and <Enter>...')
//				end if
//			end if
//		end if
//	end if
//end if

end event

public function integer f_delete_all_items ();long ll_handle
integer li_rtn
try
	ll_handle = this.finditem( roottreeitem!, 0)
	ib_deleting= true
	DO while ll_handle <> -1
		li_rtn = this.deleteitem( ll_handle)
		ll_handle = this.finditem( roottreeitem!, 0)
	LOOP
	ib_deleting = false
	return li_rtn
catch(runtimeerror lre)
//	openwithparm(c_w_err, lre.text)
end try
end function

public function string f_get_accessible_name ();return this.AccessibleName
end function

public function long f_insertitem (long vl_handle, string vs_data, string vs_label, integer vi_picture, integer vi_selectpicture);TreeViewItem ltvi_item
ltvi_item.data = vs_data
ltvi_item.label = vs_label
ltvi_item.pictureindex = vi_picture
ltvi_item.selectedpictureindex = vi_selectpicture

return This.insertitemlast( vl_handle, ltvi_item)
end function

public function string f_get_accessible_description ();return this.accessibledescription
end function

public function boolean f_set_visible (boolean vb_visible);this.visible = vb_visible
return this.visible
end function

public function string f_gettext ();return this.tag
end function

public function string f_get_popupmenu_name ();return is_popupMenu
end function

public function long f_find_item_hdl (string vs_findstring, integer vl_root_hdl);/* function: Tìm handle của treeviewitem khi biết data. và handle của treeview
 return: handle if success
   : -1 if error
*/
long     ll_child_hdl, ll_handle, ll_rtn_handle
integer    li_rtn
treeviewitem  l_tvi
powerobject			lpo_data

ll_handle = vl_root_hdl 
ll_rtn_handle = vl_root_hdl
DO while ll_handle <> -1
 li_rtn = this.getitem( ll_handle, l_tvi)
 lpo_data = l_tvi.data
 if lpo_data.dynamic f_get_tv_findstring() = vs_findstring then
  return ll_handle
 else
  ll_child_hdl = this.finditem( childtreeitem!, ll_handle)
  if ll_child_hdl <> -1 then   
   ll_rtn_handle = this.f_find_item_hdl( vs_findstring, ll_child_hdl)
   if ll_rtn_handle > 0 then 
    return ll_rtn_handle
   end if
  end if  
 end if
 ll_handle = this.finditem( nexttreeitem!, ll_handle) 
LOOP

return ll_handle
end function

public function long f_populate_item (powerobject vpo_item);/***********************************************************************************
Chức năng: insert Treeviewitem theo thông tin của vds_menu
(Yêu cầu cần phải insert tất cả các item trực truộc root trước sao đó mới insert các item của level con)
--------------------------------------------------------------------------------------------------------------------------------------------------
Tham số:
			- vpo : object của treeview item
--------------------------------------------------------------------------------------------------------------------------------------------------
Return: handle insert thành công
	     : -1 lỗi
***********************************************************************************/
treeviewitem l_tvi
long 			 	ll_handle,ll_row, ll_parent_hdl, ll_rtn_hdl


//-- Gán dữ liệu vào treeview item --//
l_tvi.label = vpo_item.dynamic f_get_tv_label()
l_tvi.data =  vpo_item.dynamic f_get_tv_data()
l_tvi.pictureindex =  vpo_item.dynamic f_get_tv_pictureindex()
l_tvi.selectedpictureindex =  vpo_item.dynamic f_get_tv_selectedpictureindex()

if vpo_item.dynamic f_get_tv_parentstring() > '' and vpo_item.dynamic f_get_tv_parentstring() > '0' then
	ll_handle = this.FindItem(rootTreeItem!, 0)
	if ll_handle <> -1 then
		//-- Tìm handle của cha --//
		ll_parent_hdl = this.f_find_item_hdl( vpo_item.dynamic f_get_tv_parentstring(), ll_handle)
		if ll_parent_hdl = -1 then return -1
		ll_rtn_hdl = this.insertitemlast( ll_parent_hdl , l_tvi)
	end if	
else
	ll_rtn_hdl = this.insertitemlast( 0, l_tvi)
end if
return ll_rtn_hdl

end function

public function long f_find_item_hdl (string vs_findstring);/* function: Tìm handle của treeviewitem khi biết data. và handle của treeview
 return: handle if success
   : -1 if error
*/
long     ll_child_hdl, ll_handle, ll_rtn_handle
integer    li_rtn
treeviewitem  l_tvi
powerobject			lpo_data

ll_handle =  this.finditem( roottreeitem!, 0)
DO while ll_handle <> -1
	 li_rtn = this.getitem( ll_handle, l_tvi)
	 lpo_data = l_tvi.data
	 if lpo_data.dynamic f_get_tv_findstring() = vs_findstring then
		return ll_handle
	 else
	  ll_child_hdl = this.finditem( childtreeitem!, ll_handle)
		if ll_child_hdl <> -1 then   
				ll_rtn_handle = this.f_find_item_hdl( vs_findstring, ll_child_hdl)
				if ll_rtn_handle > 0 then 
				return ll_rtn_handle
				end if
		end if  
	 end if
	 ll_handle = this.finditem( nexttreeitem!, ll_handle) 
LOOP

return ll_handle
end function

public function integer f_getparentwindow (ref window aw_parent);powerobject	lpo_parent

lpo_parent = this.GetParent()

// Loop getting the parent of the object until it is of type window!
do while IsValid (lpo_parent) 
	if lpo_parent.TypeOf() <> window! then
		lpo_parent = lpo_parent.GetParent()
	else
		exit
	end if
loop

if IsNull(lpo_parent) or not IsValid (lpo_parent) then
	setnull(aw_parent)	
	return -1
end if

aw_parent = lpo_parent

return 1
end function

public function string f_get_popmenu_name ();return is_popupmenu
end function

public function long f_find_parent_hdl (string vs_findstring, long vl_root_hdl);/* function: Tìm handle của treeviewitem khi biết data. và handle của treeview
 return: handle if success
   : -1 if error
*/
long     ll_child_hdl, ll_handle, ll_rtn_handle
integer    li_rtn
treeviewitem  l_tvi
powerobject			lpo_data

ll_handle = vl_root_hdl 
ll_rtn_handle = vl_root_hdl
DO while ll_handle <> -1
 li_rtn = this.getitem( ll_handle, l_tvi)
 lpo_data = l_tvi.data
 if lpo_data.dynamic f_get_parentstring() = vs_findstring then
  return ll_handle
 else
  ll_child_hdl = this.finditem( childtreeitem!, ll_handle)
  if ll_child_hdl <> -1 then   
   ll_rtn_handle = this.f_find_item_hdl( vs_findstring, ll_child_hdl)
   if ll_rtn_handle > 0 then 
    return ll_rtn_handle
   end if
  end if  
 end if
 ll_handle = this.finditem( nexttreeitem!, ll_handle) 
LOOP

return ll_handle
end function

public function integer f_send_message_to_object (ref powerobject rtv_handling, long vl_clicked_handle, string vs_message);int 					li_rtn
powerobject		lpo_handling
window				lw_display

if this.f_getparentwindow( lw_display) = 1 then
	lpo_handling = lw_display.dynamic f_get_obj_handling()
	if isvalid(lpo_handling) then
		return lpo_handling.dynamic f_handle_message(rtv_handling,vl_clicked_handle, vs_message)
	end if
end if
return -1

end function

public function long f_reset_item (powerobject vpo_item, long vl_handle);/***********************************************************************************
Chức năng: insert Treeviewitem theo thông tin của vds_menu
(Yêu cầu cần phải insert tất cả các item trực truộc root trước sao đó mới insert các item của level con)
--------------------------------------------------------------------------------------------------------------------------------------------------
Tham số:
			- vpo : object của treeview item
--------------------------------------------------------------------------------------------------------------------------------------------------
Return: handle insert thành công
	     : -1 lỗi
***********************************************************************************/
treeviewitem l_tvi
long 			 	ll_handle,ll_row, ll_parent_hdl, ll_rtn_hdl




if this.getitem( vl_handle, l_tvi) > 0 then
	//-- Gán dữ liệu vào treeview item --//
	l_tvi.label = vpo_item.dynamic f_get_tv_label()
	l_tvi.data =  vpo_item.dynamic f_get_tv_data()
	l_tvi.pictureindex =  vpo_item.dynamic f_get_tv_pictureindex()
	l_tvi.selectedpictureindex =  vpo_item.dynamic f_get_tv_selectedpictureindex()	
	return this.setitem( vl_handle , l_tvi)
else
	return -1
end if


end function

public function integer f_send_message_to_object (ref powerobject rpm_handling, string vs_message);int 					li_rtn
powerobject		lpo_handling
window				lw_display

if this.f_getparentwindow( lw_display) = 1 then
	lpo_handling = lw_display.dynamic f_get_obj_handling()
	if isvalid(lpo_handling) then
		return lpo_handling.dynamic f_handle_message(rpm_handling, vs_message)
	end if
end if
return -1

end function

public function long f_insertitemlast (long vl_parenthandle, powerobject vpo_item);TreeViewItem 			l_tvi

//-- Gán dữ liệu vào treeview item --//
l_tvi.label = vpo_item.dynamic f_get_tv_label()
l_tvi.data =  vpo_item
l_tvi.pictureindex =  vpo_item.dynamic f_get_tv_pictureindex()
l_tvi.selectedpictureindex =  vpo_item.dynamic f_get_tv_selectedpictureindex()

return This.insertitemlast( vl_parenthandle, l_tvi)
end function

public function long f_find_item_hdl (string vs_findstring, string vs_parentstring, ref long rl_parent_hdl);/* function: Tìm handle của treeviewitem khi biết data. và handle của treeview
 return: handle if success
 		: nếu không tìm thấy, return parent handle
   : -1 if error
*/
long     ll_child_hdl, ll_handle, ll_parent_handle, ll_rtn_handle
integer    li_rtn
treeviewitem  l_tvi
powerobject			lpo_data

ll_handle =  this.finditem( roottreeitem!, 0)
DO while ll_handle <> -1
	 li_rtn = this.getitem( ll_handle, l_tvi)
	 lpo_data = l_tvi.data
	 if lpo_data.dynamic f_get_tv_findstring() = vs_findstring and lpo_data.dynamic f_get_tv_parentstring() = vs_parentstring then
		return ll_handle
	elseif lpo_data.dynamic f_get_tv_findstring() = vs_parentstring then
		rl_parent_hdl = ll_handle
	else
	  ll_child_hdl = this.finditem( childtreeitem!, ll_handle)
		if ll_child_hdl <> -1 then   
				ll_rtn_handle = this.f_find_item_hdl( vs_findstring, vs_parentstring, ll_child_hdl, rl_parent_hdl)
				if ll_rtn_handle > 0 then 					
					return ll_rtn_handle
				end if
		end if  
	 end if
	 ll_handle = this.finditem( nexttreeitem!, ll_handle) 
LOOP

return ll_handle

end function

public function long f_find_item_hdl (string vs_findstring, string vs_parentstring, integer vl_root_hdl, ref long rl_parent_hdl);/* function: Tìm handle của treeviewitem khi biết data. và handle của treeview
 return: handle if success
   : -1 if error
*/
long     ll_child_hdl, ll_handle, ll_rtn_handle
integer    li_rtn
treeviewitem  l_tvi
powerobject			lpo_data

ll_handle = vl_root_hdl 
ll_rtn_handle = vl_root_hdl
DO while ll_handle <> -1	
	li_rtn = this.getitem( ll_handle, l_tvi)
	lpo_data = l_tvi.data
	if lpo_data.dynamic f_get_tv_findstring() = vs_findstring and lpo_data.dynamic f_get_tv_parentstring()  = vs_parentstring then
		return ll_handle
	elseif lpo_data.dynamic f_get_tv_findstring()  = vs_parentstring then
		rl_parent_hdl = ll_handle
	else
		ll_child_hdl = this.finditem( childtreeitem!, ll_handle)
		if ll_child_hdl <> -1 then   
				ll_rtn_handle = this.f_find_item_hdl( vs_findstring,vs_parentstring, ll_child_hdl, rl_parent_hdl)
				if ll_rtn_handle > 0 then 
					return ll_rtn_handle
				end if
		end if  
	 end if
	 ll_handle = this.finditem( nexttreeitem!, ll_handle) 
LOOP

return ll_handle
end function

public function long f_populate_item (powerobject vpo_item, long vl_parent_hdl);/***********************************************************************************
Chức năng: insert Treeviewitem theo thông tin của vds_menu
(Yêu cầu cần phải insert tất cả các item trực truộc root trước sao đó mới insert các item của level con)
--------------------------------------------------------------------------------------------------------------------------------------------------
Tham số:
			- vpo : object của treeview item
--------------------------------------------------------------------------------------------------------------------------------------------------
Return: handle insert thành công
	     : -1 lỗi
***********************************************************************************/
treeviewitem l_tvi
long 			 	ll_handle,ll_row, ll_parent_hdl, ll_rtn_hdl


//-- Gán dữ liệu vào treeview item --//
l_tvi.label = vpo_item.dynamic f_get_tv_label()
l_tvi.data =  vpo_item.dynamic f_get_tv_data()
l_tvi.pictureindex =  vpo_item.dynamic f_get_tv_pictureindex()
l_tvi.selectedpictureindex =  vpo_item.dynamic f_get_tv_selectedpictureindex()

ll_rtn_hdl = this.insertitemlast( vl_parent_hdl , l_tvi)

return ll_rtn_hdl

end function

on t_tv.create
end on

on t_tv.destroy
end on

event rightclicked;int						li_rtn
treeview			ltv_handling
t_m_popup_object		lm_popup

//-- thong báo object rightclick truoc khi thực hiện-- //
ltv_handling = this
li_rtn = this.f_send_message_to_object(ltv_handling,handle, 'rightclicked')
if li_rtn = -1 then 
	return -1
end if

lm_popup = create	t_m_popup_object
lm_popup.is_show_menu = is_popupMenu
lm_popup.is_object_name = this.classname()
LM_POPUP.IPO_CLICKED = THIS 

//-- Thông báo cho object popup --//
li_rtn = this.f_send_message_to_object(lm_popup, 'popup')
if li_rtn = -1 then 
	destroy lm_popup
	return -1
end if

//-- show popup menu --//
lm_popup.popmenu( t_w_mdi.pointerX() , t_w_mdi.pointerY() )

//-- Thông báo cho object menu duoc click--//
if lm_popup.is_clicked_menu <> '' then
	li_rtn = this.f_send_message_to_object(lm_popup, 'clicked')
end if
destroy lm_popup
end event

event key;

//-- Đóng window mẹ khi bấm phím Escape --//
if key = KeyEscape! then
	close( parent)
end if
end event

event sort;//-- Sort treeview tăng dần theo sort_number --//
long 						ll_rtn
treeviewitem 		l_tvi1,l_tvi2
powerobject			lpo_tvi1, lpo_tvi2

ll_rtn=this.getitem(handle1 , l_tvi1)
ll_rtn=this.getitem(handle2 , l_tvi2)
lpo_tvi1 = l_tvi1.data
lpo_tvi2 = l_tvi2.data	
if lpo_tvi1.dynamic f_get_tv_sort_data() >  lpo_tvi2.dynamic f_get_tv_sort_data() then
	return 1
elseif lpo_tvi1.dynamic f_get_tv_sort_data() <  lpo_tvi2.dynamic f_get_tv_sort_data() then
	return -1
else
	return 0
end if

end event

event selectionchanged;
treeview				l_tv

//-- Thông báo cho obj_handling --//
if ib_deleting = false then
	l_tv = this
	this.f_send_message_to_object( l_tv, "selectionchanged")
end if
end event

event selectionchanging;treeview				l_tv
int						li_rtn

//-- Thông báo cho obj_handling --//
l_tv = this

li_rtn = this.f_send_message_to_object( l_tv, "selectionchanging")

return li_rtn
end event

event clicked;//-- đóng w_menu --//
//if isvalid(t_w_menu) then
//	if t_w_menu.st_2.visible = true and t_w_menu.width > t_w_menu.p_1.width  then
//		t_w_menu.f_roll_in()
//	end if
//end if
end event

