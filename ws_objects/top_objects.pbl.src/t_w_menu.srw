$PBExportHeader$t_w_menu.srw
$PBExportComments$Window hiện menu của chương trình
forward
global type t_w_menu from t_w_main
end type
type tv_1 from t_tv within t_w_menu
end type
end forward

global type t_w_menu from t_w_main
integer width = 1609
integer height = 1824
string title = ""
windowstate windowstate = normal!
string icon = "AppIcon!"
boolean toolbarvisible = false
boolean clientedge = false
windowdockoptions windowdockoptions = windowdockoptiondockedandfloatonly!
event e_resize ( integer vi_newwidth,  integer vi_newheight )
tv_1 tv_1
end type
global t_w_menu t_w_menu

type variables


string 	  is_module, is_menu_code
c_menu_mdi			ic_menu



end variables

forward prototypes
public function integer f_resize_dwsubmenu ()
public function long f_cnt_approve_req ()
public function integer f_insert_alert ()
public function integer f_check_exists (string as_object_code, string as_column_code, string as_values_change, long al_user_id)
public function integer f_check_isuserapprove (long al_user_id)
public function integer f_check_isuseralert (long al_user_id)
public function long f_insert_item (datastore vds_menu, double vl_row)
public function integer f_load_menu (double vdb_module_id)
public function long f_fnd_up_menu (double vs_up_menu_id, long vl_hdl_item)
public function integer f_change_pic_idx (powerobject vpo_main, string vs_open_close)
public function string f_get_menu_code ()
public subroutine f_roll_in ()
public subroutine f_show_vbar_picture (boolean vb_show)
end prototypes

public function integer f_resize_dwsubmenu ();//if dw_1.rowcount( ) = 0 then 
//	ii_submodule_h = 0
//else
//	ii_submodule_h = dw_1.f_getheight( ) + 100
//end if
//
//// tv_1
//tv_1.height =this.height - st_1.height -  ii_submodule_h - gb_2.height +30 - ii_bottom_margin
//
//// Thanh ngang điều chỉnh size
//gb_2.width =tv_1.width
//gb_2.move( 0, tv_1.y + tv_1.height - 30)
//
//// datawindow sub-module
//dw_1.width = tv_1.width
//dw_1.height = ii_submodule_h
//dw_1.move( 0, gb_2.y + gb_2.height  )
//
return 0
end function

public function long f_cnt_approve_req ();long ll_count
// select count(*) into :ll_count
//  from VIE_APPROVE_OBJECTLIST_REQ, VIE_APPROVE_USER
// where (VIE_APPROVE_OBJECTLIST_REQ.APPROVED_BY = VIE_APPROVE_USER.ROLE_ID  
//        or VIE_APPROVE_OBJECTLIST_REQ.DELEGATED_PERSON = VIE_APPROVE_USER.ROLE_ID)
//   and VIE_APPROVE_OBJECTLIST_REQ.COMPANY_ID = :gi_user_comp_id
//   and VIE_APPROVE_USER.USER_ID = :gi_userid ;

//select  count(*) into :ll_count
//from 
//(
//SELECT T.*
// FROM ERP_ALERT_TMP T , VIE_APPROVE_USER V
//WHERE (T.USER_ID = V.ROLE_ID or T.USER_ID = V.USER_ID  )   
//  AND V.USER_ID = :gi_userid
//  AND T.COMPANY_ID = :gi_user_comp_id
//  AND NVL(T.STOP_YN, 'N') = 'N'
//  and nvl(T.kind, 'xx') <> 'table'
//  union
//SELECT T.*
// FROM ERP_ALERT_TMP T , VIE_APPROVE_USER V
//WHERE (T.USER_ID = V.ROLE_ID or T.USER_ID = V.USER_ID  )      
//  AND V.USER_ID = :gi_userid  
//  AND T.COMPANY_ID = :gi_user_comp_id  
//  and nvl(T.kind, 'xx') = 'table'
//)x  ;
//		
return ll_count
end function

public function integer f_insert_alert ();
//string ls_USER_COLUMN, ls_COLUMN_CONTENT, ls_OBJECT_CODE , ls_COLUMN_CODE, ls_VALUE_CHANGE, ls_MSG_CONTENT,ls_COLUMN_CONTENT_ID
//string ls_USER_COLUMN_DELEGATED, ls_value
//long ll_COLUMN_CONTENT_ID, ll_row, ll_user_id
//t_ds_db ltd_datastor
//ltd_datastor = create t_ds_db
//DECLARE  CUR_ALERT  CURSOR FOR
//      select A.USER_COLUMN, A.USER_COLUMN_DELEGATED, A.COLUMN_CONTENT, A.OBJECT_CODE , A.COLUMN_CODE, A.VALUE_CHANGE, 
//			  A.COLUMN_CONTENT_ID, user_id, MSG_CONTENT
//       from erp_alert_line A      
//     where NVL(A.kind, 'XX') <> 'table'
//	    and A.company_id = :gi_user_comp_id
//     	and nvl(A.USER_ID , 0) > 0 ;
//Open cur_alert;
//fetch cur_alert into  :ls_USER_COLUMN, :ls_USER_COLUMN_DELEGATED, :ls_COLUMN_CONTENT, :ls_OBJECT_CODE , :ls_COLUMN_CODE,
//						  :ls_VALUE_CHANGE, :ls_COLUMN_CONTENT_ID, :ll_user_id,:ls_MSG_CONTENT;
//do while sqlca.sqlcode = 0 	
//	ltd_datastor.dataobject = ls_OBJECT_CODE
//	ltd_datastor.settransobject( SQLCA)
//	ltd_datastor.retrieve( gi_user_comp_id)
//	
//    delete from ERP_ALERT_TMP 
//    where upper(OBJECT_CODE) = upper(:ls_OBJECT_CODE)
//    and upper(COLUMN_CODE) = upper(:ls_COLUMN_CODE)
//    AND (USER_ID = :ll_user_id or (user_id in (select v.role_id from VIE_APPROVE_USER V where v.user_id = :ll_user_id ))) AND stop_yn = 'N';
//	
//	for ll_row = 1 to ltd_datastor.rowcount()
//		ls_value = ltd_datastor.getitemstring(ll_row,ls_COLUMN_CONTENT)
//		if f_check_exists(ls_OBJECT_CODE, ls_COLUMN_CODE, ls_value, ll_user_id) = 0 then 
//			INSERT INTO ERP_ALERT_TMP(ALERT_TMP_ID, USER_ID, COL_CONTENT, MSG_CONTENT, OBJECT_CODE, COLUMN_CODE, VALUE_CHANGE, COL_CONTENT_ID, COMPANY_ID, kind, stop_yn) 
//				  VALUES( SEQ_ERP_ALERT_TMP.NEXTVAL, :ll_user_id, :ls_value, :ls_MSG_CONTENT, :ls_OBJECT_CODE, :ls_COLUMN_CODE, :ls_VALUE_CHANGE, :ll_COLUMN_CONTENT_ID, :gi_user_comp_id, '', 'N');
//		end if 
//	next 	
//	fetch cur_alert into  :ls_USER_COLUMN, :ls_USER_COLUMN_DELEGATED, :ls_COLUMN_CONTENT, :ls_OBJECT_CODE , :ls_COLUMN_CODE,
//							  :ls_VALUE_CHANGE, :ls_COLUMN_CONTENT_ID, :ll_user_id, :ls_MSG_CONTENT;		
//loop;
//close cur_alert;
//commit;
return -1
end function

public function integer f_check_exists (string as_object_code, string as_column_code, string as_values_change, long al_user_id);
//long ll_count
//
//select Count(*) into :ll_count 
//from ERP_ALERT_TMP
//where object_code = :as_object_code
//  and column_code = :as_column_code
//  and col_content = :as_values_change
//  and user_id = :al_user_id
//  and company_id = :gi_user_comp_id  ;
//  
// if ll_count > 0 then 
//	return 1
//else 
	return 0
//end if 
end function

public function integer f_check_isuserapprove (long al_user_id);//Kiem tra user log in vao co quyen duyet ko
//Author : Tu
//int li_count
//select count(*) into :li_count
//from (
//				select t.USER_ID
//				from erp_approve_hierarchy t
//				where nvl(t.USER_ID ,0) <> 0
//				and t.company_id = :gi_user_comp_id 
//			union 
//				select t2.USER_ID
//				from erp_approve_hierarchy t1, erp_role_user t2
//				where nvl(t1.USER_ID,0) = 0 
//				and t1.ROLE_ID = t2.ROLE_ID
//				and t1.company_id = :gi_user_comp_id  
//			union 
//				select t3.DELEGATE
//				from erp_approve_hierarchy t3
//				where nvl(t3.DELEGATE ,0) <> 0
//		) A
//		where A.USER_ID = :al_user_id ;
// if li_count > 0 then 
//	return 1
//else 
	return 0
//end if 
end function

public function integer f_check_isuseralert (long al_user_id);//Kiem tra user log in vao co nhan thong bao ko
//Author : Tu
//int li_count
//select count(*) into :li_count
//from erp_alert_line
//where erp_alert_line.USER_ID = :al_user_id ;
// if li_count > 0 then 
//	return 1
//else 
	return 0
//end if 
end function

public function long f_insert_item (datastore vds_menu, double vl_row);/*

return null nếu datastore truyền vào la null
*/
treeviewitem l_tvi
long ll_handle,ll_row, ll_parent, ll_cnt, ll_root
integer li_rtn
string ls_up_menu_id
double ldb_up_menu_id, ldb_menu_id
long ll_insert_hdl

t_s_tv 				l_s_menuitem
c_menu				lc_menu

ldb_up_menu_id = vds_menu.getitemnumber(vl_row,'menu_up_menu_id')
ldb_menu_id = vds_menu.getitemnumber(vl_row,'menu_menu_id')

l_s_menuitem.db_id = vds_menu.getitemnumber(vl_row,'menu_id')
l_s_menuitem.s_object = vds_menu.getitemstring(vl_row, 'menu_obj_name')
l_s_menuitem.i_type = vds_menu.getitemnumber(vl_row, 'menu_type')
l_s_menuitem.i_sort = vds_menu.getitemnumber(vl_row, 'menu_sort_number') 
l_s_menuitem.i_pic_idx = vds_menu.getitemnumber(vl_row, 'menu_type')
l_s_menuitem.i_sel_pic_idx = vds_menu.getitemnumber(vl_row, 'menu_type')+1
l_tvi.data = l_s_menuitem
l_tvi.label = vds_menu.getitemstring(vl_row, 'label_text')
l_tvi.pictureindex = vds_menu.getitemnumber(vl_row, 'menu_type')


ll_root = tv_1.finditem( roottreeitem!, 0)
ll_handle = this.f_fnd_up_menu( l_s_menuitem.db_id, ll_root) //f_find_item_hdl( l_tvi.data, ll_root)

if ll_handle >= 0 then 
	//da ton tai khong insert nua
	ll_insert_hdl = ll_handle
else 
	if ldb_up_menu_id = ldb_menu_id then 
		// la root inert luon.
		ll_insert_hdl = tv_1.insertitemlast( 0, l_tvi)
	else 
		ll_root = tv_1.finditem( roottreeitem!, 0)	
		ll_parent = this.f_fnd_up_menu( ldb_up_menu_id, ll_root)
		if ll_parent < 0 then 
			// insert nut cha truoc.
			ll_row = vds_menu.find(" menu_id = " + string(ldb_up_menu_id), 1, vds_menu.rowcount())
			if ll_row > 0 then 
				ll_parent = f_insert_item(vds_menu, ll_row)				
			else
				ll_parent = -1
			end if		
		end if 
		if ll_parent >= 0 then 
			ll_insert_hdl = tv_1.insertitemlast(ll_parent, l_tvi)
		end if 
	end if 
end if 
return ll_insert_hdl

end function

public function integer f_load_menu (double vdb_module_id);/* function: load menu treeview của module hoặc sub module. load khi user chọn hoặc thay đổi module hoặc submodule. trước khi load, delete tất cả các items nếu có.
	return số menu item nếu thành công, return -1 nếu error
*/


integer 				li_items, li_row 
long 					ll_root_hdl
t_ds_db 				lds_menu 

// load menu item to menu window
tv_1.f_delete_all_items( )


lds_menu = CREATE t_ds_db
lds_menu.dataobject = 'd_menu'
lds_menu.settrans( sqlca)
li_items = lds_menu.retrieve(gi_user_comp_id,gdb_branch, gi_userid ,  gs_user_lang, vdb_module_id)

if li_items <1 then return li_items
	
FOR li_row =1 TO lds_menu.rowcount( )
	this.f_insert_item( lds_menu, li_row)		
NEXT

//-- sort treeview --//
ll_root_hdl = tv_1.FindItem(RootTreeItem! , 0)
tv_1.SortAll(ll_root_hdl , Ascending!)

return 1
end function

public function long f_fnd_up_menu (double vs_up_menu_id, long vl_hdl_item);/* function: tìm parent của menu item
	return: parent handle if success
			: -1 if error
*/
long ll_handle, ll_hdl_child, ll_next_hdl, ll_rtn_hdl
integer li_rtn
treeviewitem l_tvi
t_s_tv l_s_menu_data

ll_handle = vl_hdl_item
ll_rtn_hdl = vl_hdl_item
DO while ll_handle <> -1
	li_rtn = tv_1.getitem( ll_handle, l_tvi)
	l_s_menu_data = l_tvi.data
	if l_s_menu_data.db_id = vs_up_menu_id then
		return ll_handle
	end if
	ll_hdl_child = tv_1.finditem( childtreeitem!, ll_handle)
	if ll_hdl_child <> -1 then	
		ll_rtn_hdl = f_fnd_up_menu(vs_up_menu_id, ll_hdl_child)
		if ll_rtn_hdl > 0 then return ll_rtn_hdl
	end if
	ll_handle = tv_1.finditem( nexttreeitem!, ll_handle)
LOOP
return ll_handle
end function

public function integer f_change_pic_idx (powerobject vpo_main, string vs_open_close);/***************************************************
Chức năng: Thay đổi hình biểu tượng cùa treeview menu
----------------------------------------------------------------------------------
Tham số:
	- vs_object: Tên object của menu
	- vi_idx: 0 icon lúc widow không mở
			   1 icon lúc window đã được mở
-----------------------------------------------------------------------------------
Return: 	 1 Thành công
			-1 Lỗi
=============================================*/
long					ll_handle
string				ls_menu_id
treeviewitem		ltvi_menu
c_menu_item		lc_menu_item

ls_menu_id = vpo_main.dynamic f_get_menu_id()

ll_handle = tv_1.f_find_item_hdl( ls_menu_id)

if ll_handle <> -1 then
	tv_1.getitem( ll_handle, ltvi_menu)
	lc_menu_item = ltvi_menu.data
	if vs_open_close = 'close' then
		ltvi_menu.pictureindex = lc_menu_item.istr_tv.i_pic_idx
		ltvi_menu.selectedpictureindex =  lc_menu_item.istr_tv.i_pic_idx
	else
		ltvi_menu.pictureindex = lc_menu_item.istr_tv.i_sel_pic_idx
		ltvi_menu.selectedpictureindex =  lc_menu_item.istr_tv.i_sel_pic_idx
	end if
	tv_1.setitem( ll_handle, ltvi_menu)
end if

return 1
end function

public function string f_get_menu_code ();return is_menu_code
end function

public subroutine f_roll_in ();//int			li_width, li_width_roll
//
//li_width =  t_w_menu.width
//For li_width_roll = li_width to p_1.width  step -80
//	this.width = li_width_roll
//Next
//this.width = p_1.width
//p_1.visible = true
end subroutine

public subroutine f_show_vbar_picture (boolean vb_show);//
//if vb_show then
//	if this.width = 119 then
//		choose case is_module
//			case 'ad'
//				if gs_user_lang = 'vi-vn' then
//					p_1.picturename = 'pics\he thong.jpg'
//				elseif gs_user_lang = 'en-us' then
//					p_1.picturename = 'pics\erp.jpg'
//				end if
//			case 'fm'
//				if gs_user_lang = 'vi-vn' then
//					p_1.picturename = 'pics\taichinh-ketoan.jpg'
//				elseif gs_user_lang = 'en-us' then
//					p_1.picturename = 'pics\FM.jpg'
//				end if	
//			case 'hr'
//				if gs_user_lang = 'vi-vn' then
//					p_1.picturename = 'pics\nhan su.jpg'
//				elseif gs_user_lang = 'en-us' then
//					p_1.picturename = 'pics\HR.jpg'
//				end if		
//			case 'im'
//				if gs_user_lang = 'vi-vn' then
//					p_1.picturename = 'pics\kho.jpg'
//				elseif gs_user_lang = 'en-us' then
//					p_1.picturename = 'pics\IM.jpg'
//				end if
//			case 'pm'
//				if gs_user_lang = 'vi-vn' then
//					p_1.picturename = 'pics\thu mua.jpg'
//				elseif gs_user_lang = 'en-us' then
//					p_1.picturename = 'pics\PM.jpg'
//				end if
//			case 'sm'
//				if gs_user_lang = 'vi-vn' then
//					p_1.picturename = 'pics\ban hang.jpg'
//				elseif gs_user_lang = 'en-us' then
//					p_1.picturename = 'pics\SM.jpg'
//				end if	
//			case 'sv'
//				if gs_user_lang = 'vi-vn' then
//					p_1.picturename = 'pics\dich vu.jpg'
//				elseif gs_user_lang = 'en-us' then
//					p_1.picturename = 'pics\SM.jpg'
//				end if	
//			case 'pp'
//				if gs_user_lang = 'vi-vn' then
//					p_1.picturename = 'pics\san xuat.jpg'
//				elseif gs_user_lang = 'en-us' then
//					p_1.picturename = 'pics\PP.jpg'
//				end if		
//			case 'pj'
//				if gs_user_lang = 'vi-vn' then
//					p_1.picturename = 'pics\du an.jpg'
//				elseif gs_user_lang = 'en-us' then
//					p_1.picturename = 'pics\PJ.jpg'
//				end if		
//			case else
//				if gs_user_lang = 'vi-vn' then
//					p_1.picturename = 'pics\erp.jpg'
//				elseif gs_user_lang = 'en-us' then
//					p_1.picturename = 'pics\erp.jpg'
//				end if	
//		end choose
//	else
//		p_1.visible = false
//		return
//	end if
//end if
//p_1.visible = vb_show
//
//this.setredraw( true)
end subroutine

on t_w_menu.create
int iCurrent
call super::create
this.tv_1=create tv_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tv_1
end on

on t_w_menu.destroy
call super::destroy
destroy(this.tv_1)
end on

event resize;
//treeview menu

tv_1.move(0,0 )
tv_1.height = newheight 
tv_1.width = newwidth

end event

event open;/**************************************************************8
Chức năng:
------------
Parm: ls_win_parm : module_id+win_name+wintype+position
-----------
Return:

=======================================================*/

string						ls_role_user, ls_win_parm, lsa_win_pram[]

c_string					lc_string

ls_win_parm = message.stringparm
setnull(message.stringparm)
lc_string.f_stringtoarray( ls_win_parm, ';', lsa_win_pram[])


t_w_mdi.ic_menu.idb_menu_id = double(lsa_win_pram[1])
this.title = lsa_win_pram[2]
this.is_win_name = lsa_win_pram[4]
this.is_sheet_type = lsa_win_pram[3]
this.is_win_grp = 'LEFT'

t_w_mdi.ic_menu.f_display_on_tv_ex( tv_1) 

t_w_mdi.p_1.setredraw(false)
t_w_mdi.post f_resize_logo()

end event

event activate;//if gbl_can_active then 
//	if isvalid(t_w_mdi.ic_menu) then
//		t_w_mdi.f_query_background(t_w_mdi.ic_menu.idb_menu_id , this.title)
//	end if

//end if
end event

type tv_1 from t_tv within t_w_menu
event e_mousemove pbm_mousemove
integer x = 146
integer y = 260
integer taborder = 10
boolean tooltips = false
boolean trackselect = true
boolean fullrowselect = true
string picturename[] = {"Window!","Cascade!","Custom039!","Project!","StyleLibraryList5!","StyleLibraryList5!","MonthCalendar!","monthcalendar!","OleGenReg!","OleGenReg!","Report!","Report!","copy!","copy!"}
end type

event e_mousemove;//-- override --//
end event

event rightclicked;//-- override --//
end event

event selectionchanged;//--override--//


end event

event selectionchanging;//-- override --//
end event

event key;//-- override --//
end event

event clicked;call super::clicked;//s_w_multi_n_max					lw_retail
treeviewitem				l_tvi
c_menu_item				lc_menu_item
c_obj_service				lc_obj_service

string							ls_parm[]

if handle > 0 then
	this.getitem( handle, l_tvi)
	lc_menu_item = l_tvi.data
	lc_obj_service.f_stringtoarray(lc_menu_item.istr_tv.s_object , ";", ls_parm[])
	if upperbound(ls_parm) <2 then
		this.selectitem(handle)
		if not l_tvi.expanded then this.post expanditem(handle)										
		return 
	end if
	setpointer(hourglass!)
	this.selectitem(handle)			
	if left(ls_parm[1], 4) <> 'u_w_' then
		t_w_mdi.wf_open_sheet_doc(ls_parm[1]+";"+ls_parm[2]+";"+ string(lc_menu_item.istr_tv.db_id)+';'+ lc_menu_item.istr_tv.s_label)	
	elseif ls_parm[1] = 'u_w_pos' then
		open (u_w_pos)
		u_w_pos.setposition( TopMost!)
		u_w_pos.post setposition( noTopMost!)
	else
		open (c_w_purchase)
		c_w_purchase.setposition( TopMost!)
		c_w_purchase.post setposition( noTopMost!)
//		t_w_mdi.wf_open_sheet_doc(ls_parm[1]+";"+ls_parm[2]+";"+ string(lc_menu_item.istr_tv.db_id)+';'+ lc_menu_item.istr_tv.s_label)	
	end if
end if

end event

