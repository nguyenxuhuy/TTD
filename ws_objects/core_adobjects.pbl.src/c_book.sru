$PBExportHeader$c_book.sru
forward
global type c_book from s_object_display
end type
end forward

global type c_book from s_object_display
end type
global c_book c_book

type variables
boolean		ib_modify = false
boolean		ib_rowfocuschange = false
end variables

forward prototypes
public subroutine f_set_dwo_window ()
public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[])
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_object_book_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_object_book_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_object_book_detail_grid;d_business_rule_grid'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Bộ sổ của:'

istr_dwo[2].s_dwo_default =  'd_object_book_detail_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_object_book_detail_grid'
istr_dwo[2].b_detail = true
istr_dwo[2].s_dwo_master = 'd_object_book_grid;'
istr_dwo[2].s_master_keycol = 'ID'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[2].b_ref_table_yn  = true
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].b_focus_master = false
istr_dwo[2].s_description = 'Cài đặt cho sổ của'

istr_dwo[3].s_dwo_default =  'd_business_rule_grid'
istr_dwo[3].s_dwo_form = ''
istr_dwo[3].s_dwo_grid = 'd_business_rule_grid'
istr_dwo[3].b_detail = true
istr_dwo[3].s_dwo_master = 'd_object_book_grid;'
istr_dwo[3].s_master_keycol = 'ID'
istr_dwo[3].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[3].b_ref_table_yn  = true
istr_dwo[3].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[3].b_insert = true
istr_dwo[3].b_update = true
istr_dwo[3].b_delete = false
istr_dwo[3].b_query = true
istr_dwo[3].b_print = true
istr_dwo[3].b_excel = true
istr_dwo[3].b_traceable = true
istr_dwo[3].b_keyboardlocked = true
istr_dwo[3].b_focus_master = false
istr_dwo[3].s_description = ''
end subroutine

public function integer f_get_dw_retrieve_args (ref datawindow rdw_focus, ref any ra_args[]);
if rdw_focus.dataobject = 'd_object_book_grid' then
	ra_args[1] = gi_userid
end if
return 1
end function

on c_book.create
call super::create
end on

on c_book.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'RECORD_ACCESS_HDR'
ib_changed_dwo_4edit = false
is_display_model = '2d'
ib_display_text = true
is_object_title = 'Bộ sổ'

istr_actionpane[1].s_description = is_object_title

istr_actionpane[1].s_button_name = 'e_modify;e_delete;e_add;e_okclose;e_close;'
//istr_actionpane[1].s_button_name += 'b_doc_trace;e_add;e_modify;e_delete;'
//istr_actionpane[1].s_button_has_sub ='b_update;'
//istr_actionpane[1].sa_sub_button[1]='e_action_load_file;e_action_link;e_action_open_file;'
//istr_actionpane[1].sa_subbutton_name[1]='Nạp file;Nạp link;Mở file;'

//istr_actionpane[1].s_button_has_sub ='b_related_object;b_update;b_approve;b_view;b_copyt;b_copyf;'
//istr_actionpane[1].sa_sub_button[1]='u_so;'
//istr_actionpane[1].sa_subbutton_name[1]='Đơn bán hàng(SO);'
//istr_actionpane[1].sa_sub_button[2]='b_complete;b_lose;b_excel;'
//istr_actionpane[1].sa_subbutton_name[2]='Thành công;Không thành;Excel;'
//istr_actionpane[1].sa_sub_button[3]=''	//'b_send_2_approve;b_approve;b_reject;'
//istr_actionpane[1].sa_subbutton_name[3]=''	//'Gửi duyệt;Duyệt;Trả duyệt'
//istr_actionpane[1].sa_sub_button[4]='b_view_qt;b_view_qt_kni_eng;'
//istr_actionpane[1].sa_subbutton_name[4]='Chào giá;Chào giá ENG;'
//istr_actionpane[1].sa_sub_button[5]=''
//istr_actionpane[1].sa_subbutton_name[5]=''
//istr_actionpane[1].sa_sub_button[6]=''
//istr_actionpane[1].sa_subbutton_name[6]=''
end event

event e_window_e_postopen;call super::e_window_e_postopen;	//--gán text cho form bộ sổ--//
	window 			lw_parent
	powerobject	lc_object_handle_parent
	datawindow	ldw_focus
	s_str_dwo		ls_str_dwo[]
	long				ll_idx
	string 			ls_dwo_main,ls_dwo_name
	
	lw_parent = iw_display.dynamic f_getparentwindow()
	if not isvalid(lw_parent) then lw_parent = iw_display
	lc_object_handle_parent = lw_parent.dynamic f_get_obj_handling()
	ls_dwo_main = lc_object_handle_parent.dynamic f_get_main_dwo()
	ls_dwo_name = t_w_mdi.ids_lang_text.f_get_lang_text( ls_dwo_main )
	if ls_dwo_name = '' then
		lc_object_handle_parent.dynamic f_get_dwo(ls_str_dwo[])
		for ll_idx = 1 to upperbound(ls_str_dwo[])
			if ls_str_dwo[ll_idx].s_dwo_default = ls_dwo_main then
				iw_display.dynamic f_set_st_1_text(istr_dwo[1].s_description ,ls_str_dwo[ll_idx].s_description)
			end if
		next
	else
		iw_display.dynamic f_set_st_1_text(istr_dwo[1].s_description ,ls_dwo_name)
	end if
return 1
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;/***************************************
	insert dwo và type cho dwmain
	insert tất cả các cột của form được tạo bộ sổ
	inset 1 dòng vào bảng business rule
****************************************/

t_dw_mpl		ldw_main,ldw_detail[],ldw_main_parent,ldw_focus, ldw_tmp
window			lw_parent
powerobject		lc_object_handle_parent
string 			ls_columns[],ls_code,ls_text,ls_dwo
int					li_idx,li_idx_detail

ldw_main = iw_display.dynamic f_get_dwmain()
lw_parent = iw_display.dynamic f_getparentwindow()
lc_object_handle_parent = lw_parent.dynamic f_get_obj_handling()
ls_dwo = lc_object_handle_parent.dynamic f_get_main_dwo()
ls_dwo =  mid(ls_dwo,1,len(ls_dwo)-5)
if ldw_main.getitemstring(ldw_main.rowcount( ) , 'dwo') = '' or isnull(ldw_main.getitemstring(ldw_main.rowcount( ) , 'dwo')) then
	ldw_main.setitem( ldw_main.rowcount( ) , 'dwo', ls_dwo)
	ldw_main.setitem( ldw_main.rowcount( ) , 'default_yn', 'N' )
	ldw_main.setitem( ldw_main.rowcount( ) , 'type', 'book' )
	ldw_main.setitem( ldw_main.rowcount( ) , 'object', upper(lc_object_handle_parent.classname( )) )
	ldw_main_parent = lw_parent.dynamic f_get_dwmain()
	ldw_main_parent.dynamic f_getcolumns(ls_columns[])
	for li_idx = 1 to ldw_main.dynamic f_getdwdetails(ldw_detail)
		if ldw_detail[li_idx].dataobject = 'd_object_book_detail_grid' then
			for li_idx_detail=1 to upperbound(ls_columns[])
				//--không insert cột giả gutter--//
				if lower(ls_columns[li_idx_detail]) = 'gutter' then continue
				ls_code = ls_dwo+ '.' + ls_columns[li_idx_detail] + '_t'
				ls_text = t_w_mdi.ids_lang_text.f_get_lang_text( ls_code)
				ldw_detail[li_idx].dynamic event e_addrow()
				ldw_detail[li_idx].setitem( ldw_detail[li_idx].rowcount( ) , 'dwcolumn', ls_columns[li_idx_detail])
				ldw_detail[li_idx].setitem( ldw_detail[li_idx].rowcount( ) , 'text', ls_text)
				//-- Set dwobject cho bộ sổ -//
				ldw_detail[li_idx].setitem( ldw_detail[li_idx].rowcount( ) , 'dwobject', ls_dwo)
			next
		else
			ldw_detail[li_idx].dynamic event e_addrow()
		end if
	next
else
//--khi thêm dòng ở detail--//
	ldw_focus = iw_display.dynamic f_get_idwfocus()
	if ldw_focus.dataobject = 'd_object_book_detail_grid' then
		ldw_focus.setitem(ldw_focus.getrow(),'dwobject', ls_dwo)
	end if
end if
return 1


end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;//--khi chọn sổ mặc định =Y thì set các sổ khác về N--//
int 			li_idx
t_transaction 	lt_transaction

if AncestorReturnValue = 1 then return 1
if rpo_dw.dataobject = 'd_object_book_grid'  then
	if vs_colname = 'default_yn' then
		if vs_editdata = 'Y' then
			li_idx = rpo_dw.find("default_yn ='Y'", 1, rpo_dw.rowcount())
			if li_idx > 0 and li_idx <> vl_currentrow then
				rpo_dw.setitem(li_idx,'default_yn','N')
			end if
			/* Khóa 30/04/2014: không đúng
			iw_display.dynamic f_get_transaction(lt_transaction)
			istr_dwo[1].ds_suspend_data.settransobject(lt_transaction)
			for li_idx = 1 to istr_dwo[1].ds_suspend_data.rowcount()
				if istr_dwo[1].ds_suspend_data.getitemstring(li_idx,'default_yn') = 'Y' then 	
					istr_dwo[1].ds_suspend_data.setitem(li_idx,'default_yn','N')
					istr_dwo[1].ds_suspend_data.update()
					exit
				end if
			next
			*/
//		else
//			rpo_dw.dynamic f_set_ib_dataerror(true)
//			gf_messagebox('m.c_book.e_dw_e_itemchanged.01','Thông báo','Phải có sổ mặc định','exclamation','ok',1)
//			return 1
		end if
	end if
end if
return 0
end event

event e_action_ctrl_retrieveend;call super::e_action_ctrl_retrieveend;//--cho phép thêm xóa sửa ở detail--//
datawindow				ldw_focus
int							li_idx
string						ls_case

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
					istr_actionpane[li_idx].s_visible_buttons='b_modify;b_saveclose;b_query;b_delete;b_insert;'
					istr_actionpane[li_idx].s_enabled_buttons='b_modify;b_query;b_delete;b_insert;'							
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_insert;b_modify;b_save;b_query;b_execquery;b_filteron;b_refresh;b_delete;'
					istr_actionpane[li_idx].s_enabled_buttons='b_add;b_insert;b_modify;b_query;b_execquery;b_filteron;b_refresh;b_delete;'							
				end if
			else
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_saveclose;b_query;b_filteron;b_refresh;b_delete;'
					istr_actionpane[li_idx].s_enabled_buttons='b_add;b_modify;b_query;b_filteron;b_refresh;b_delete;'										
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_save;b_query;b_execquery;b_filteron;b_refresh;b_delete;'
					istr_actionpane[li_idx].s_enabled_buttons='b_add;b_modify;b_query;b_execquery;b_filteron;b_refresh;b_delete;'														
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_transaction' then	
		end if		
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_action_ctrl_e_postmodifyrow;call super::e_action_ctrl_e_postmodifyrow;datawindow				ldw_focus
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
						istr_actionpane[li_idx].s_visible_buttons = 'b_insert;b_modify; b_saveclose;b_refresh;b_delete;'
						istr_actionpane[li_idx].s_enabled_buttons = 'b_insert;b_saveclose;b_refresh;b_delete;'	
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_saveclose;b_refresh;b_delete;'
						istr_actionpane[li_idx].s_enabled_buttons = 'b_add;b_saveclose;b_refresh;b_delete;'						
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_save; b_refresh;b_delete;'
						istr_actionpane[li_idx].s_enabled_buttons = 'b_add;b_insert;b_save;b_refresh;b_delete;'	
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_save; b_refresh;b_delete;'
						istr_actionpane[li_idx].s_enabled_buttons = 'b_add;b_save;b_refresh;b_delete;'							
					end if
				end if
			else				
				if  ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_saveclose;b_refresh;b_delete;'
					istr_actionpane[li_idx].s_enabled_buttons='b_saveclose;b_refresh;b_delete;'		
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_save;b_refresh;b_delete;'
					istr_actionpane[li_idx].s_enabled_buttons='b_save;b_refresh;b_delete;'							
				end if
			end if
		elseif istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then
			
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_dw_e_preretrieve;call super::e_dw_e_preretrieve;string					ls_dwo,ls_columns,ls_dataobject
window				lw_parent
powerobject		lc_object_handle_parent
any					la_arg[]

ls_dataobject = rpo_dw.dataobject
if mid(ls_dataobject,1,len(ls_dataobject)-5) = 'd_object_book' then
	lw_parent = iw_display.dynamic f_getparentwindow()
	if not isvalid(lw_parent) then lw_parent = iw_display
	lc_object_handle_parent = lw_parent.dynamic f_get_obj_handling()
	ls_dwo = lc_object_handle_parent.dynamic f_get_main_dwo()
	ls_dwo = mid(ls_dwo,1,len(ls_dwo)-5)
	ls_columns = 'dwo;type;object'
	la_arg[1] = '='+ls_dwo
	la_arg[2] = '=book'
	la_arg[3] = '=' + upper(lc_object_handle_parent.classname( ))
	rpo_dw.dynamic f_add_where(ls_columns,la_arg)
end if
return 0
end event

event e_action_ctrl_bttn;datawindow				ldw_focus
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
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;'
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_query; b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron;b_query; b_refresh;b_delete;'
					end if
				end if
			else				
				if  ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;b_okclose;b_close;'
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_query;b_refresh;b_delete;'
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
			
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
			istr_actionpane[li_idx].s_visible_buttons =  'b_book; b_attach; b_note;b_doc_trace;b_user_trace;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
			
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_e_okclose;//--trước khi tắt form, lấy điều kiện để retrieve window parent--/
window			lw_parent
datawindow	ldw_master_parent,ldw_master_child
string				ls_criteria_of_dwcolumn[],ls_dwcolumn[]
double			ldb_book_id
powerobject	lc_obj_handling

lw_parent = iw_display.dynamic f_getparentwindow()
lc_obj_handling = lw_parent.dynamic f_get_obj_handling()
ldw_master_child = iw_display.dynamic f_get_dwmain()
if ldw_master_child.rowcount( ) > 0 then
	ldb_book_id = ldw_master_child.getitemnumber( ldw_master_child.getrow( ) , 'ID')
	lc_obj_handling.dynamic f_book( ldb_book_id,ib_modify)
	lw_parent.dynamic post event e_refresh()
	is_dwcolumn_books[] = ls_dwcolumn[]
	is_criteria_of_dwcolumn_books[] = ls_criteria_of_dwcolumn[]
end if
close(iw_display)
end event

event e_dw_updatestart;call super::e_dw_updatestart;//--chỉ insert dòng nào có điều kiện--//
int					li_idx
string				ls_criteria, ls_user_default, ls_dfl_object
double			ldb_book_id, ldb_id
datawindow				ldw_detail
b_obj_instantiate		lbo_ins


setnull(ls_criteria)
if mid(rdw_requester.dataobject,1,len(rdw_requester.dataobject)-5) = 'd_object_book' then
	//-- delete detail --//
	ldw_detail = iw_display.dynamic f_get_dw('d_object_book_detail_grid')
	for li_idx = ldw_detail.rowcount( ) to 1 step -1
		if trim(ldw_detail.getitemstring( li_idx, 'criteria')) = '' or isnull(ldw_detail.getitemstring( li_idx, 'criteria')) then
			ldw_detail.deleterow( li_idx)
		end if
	next
	//-- update Y/N--//
	
end if
return 1
end event

event e_dw_e_modifyrow;call super::e_dw_e_modifyrow;//--khi có chỉnh sửa sẽ retrieve lại ids_book--//
ib_modify = true
return 1
end event

event e_dw_e_predelete;call super::e_dw_e_predelete;if mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject)-5) = 'd_object_book' then
	gf_messagebox('m.c_book.e_dw_e_predelete.01','Thông báo','Chưa cài đặt bộ sổ mặc định','exclamation','ok',1)
	return -1
end if
return vl_currentrow
end event

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.F_SET_II_upperpart_height( 1/2)
return ancestorreturnvalue
end event

event e_dw_e_postsave;call super::e_dw_e_postsave;string				ls_user_default, ls_dfl_object
double			ldb_book_id, ldb_id
//int					li_cnt
b_obj_instantiate		lbo_ins

if rpo_dw.dataobject = 'd_object_book_grid' then
	ldb_id =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'ID')
	ls_dfl_object =  rpo_dw.getitemstring(rpo_dw.getrow(), 'object')
	ls_user_default = rpo_dw.getitemstring(rpo_dw.getrow(), 'user_default_yn')
	if isnull(ls_user_default) then ls_user_default = 'N'
	ldb_book_id =  rpo_dw.getitemnumber(rpo_dw.getrow(), 'default_book_id')
	if isnull(ldb_book_id) then ldb_book_id = 0
	if ldb_book_id > 0 then
		UPDATE default_book 
		SET default_yn = :ls_user_default 
		WHERE id = :ldb_book_id
		using it_transaction;
	else
//		select count(id) into :li_cnt from default_book where object_ref_id = :ldb_id using it_transaction;
		ldb_book_id = lbo_ins.f_create_id_ex( it_transaction )
		INSERT into default_book(id, object_ref_id,object_ref_table,company_id,branch_id,created_by,created_date,last_mdf_By,last_mdf_date,
					user_id,default_object, DEFAULT_YN)
		VALUES (:ldb_book_id, :ldb_id, 'RECORD_ACCESS_HDR',:gi_user_comp_id, :gdb_branch, :gi_userid, sysdate, :gi_userid, sysdate,
					:gi_userid, :ls_dfl_object, :ls_user_default)
		using it_transaction;
	end if

end if

return ancestorreturnvalue
end event

