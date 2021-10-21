$PBExportHeader$c_onhand.sru
forward
global type c_onhand from b_doc
end type
end forward

global type c_onhand from b_doc
end type
global c_onhand c_onhand

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_tabpage ()
end prototypes

public subroutine f_set_dwo_window ();//istr_dwo[1].s_dwo_default =  'd_onhand_grid'
//istr_dwo[1].s_dwo_form = ''
//istr_dwo[1].s_dwo_grid = 'd_onhand_grid'
//istr_dwo[1].b_master = true
//istr_dwo[1].b_cascade_del = true
//istr_dwo[1].b_insert = true
//istr_dwo[1].b_update = true
//istr_dwo[1].b_delete = true
//istr_dwo[1].b_query = true
//istr_dwo[1].b_print = true
//istr_dwo[1].b_excel = true
//istr_dwo[1].b_traceable = true
//istr_dwo[1].b_keyboardlocked = true
//istr_dwo[1].s_description = 'Truy vấn tồn kho'
//
end subroutine

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'

end subroutine

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model = '1dgb_1d'
iastr_dwo_tabpage[1].i_index = 1
iastr_dwo_tabpage[1].i_leftpart_width = 6/7
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_onhand_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_onhand_grid'
iastr_dwo_tabpage[1].str_dwo[1].b_master = true
iastr_dwo_tabpage[1].str_dwo[1].b_detail = false
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = false
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = 'd_onhand_loc_grid;'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol = 'ID;WAREHOUSE_CODE;'
iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol = 'ID;WAREHOUSE_CODE;'
iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[1].s_ref_table_field = ';'
iastr_dwo_tabpage[1].str_dwo[1].b_insert = false
iastr_dwo_tabpage[1].str_dwo[1].b_update = false
iastr_dwo_tabpage[1].str_dwo[1].b_delete = false
iastr_dwo_tabpage[1].str_dwo[1].b_query = true
iastr_dwo_tabpage[1].str_dwo[1].b_print = true
iastr_dwo_tabpage[1].str_dwo[1].b_excel = true
iastr_dwo_tabpage[1].str_dwo[1].b_traceable = false
iastr_dwo_tabpage[1].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Tồn kho'

iastr_dwo_tabpage[1].str_dwo[2].s_dwo_default =  'd_item_photo_form'
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_form = 'd_item_photo_form'
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_grid = ''
iastr_dwo_tabpage[1].str_dwo[2].b_master = false
iastr_dwo_tabpage[1].str_dwo[2].b_detail = false
iastr_dwo_tabpage[1].str_dwo[2].b_cascade_del = false
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_master = ''
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_details = 'd_onhand_grid;'
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_shared = ''
iastr_dwo_tabpage[1].str_dwo[2].s_master_keycol = ''
iastr_dwo_tabpage[1].str_dwo[2].s_detail_keycol = ''
iastr_dwo_tabpage[1].str_dwo[2].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[2].s_ref_table_field = ';'
iastr_dwo_tabpage[1].str_dwo[2].b_insert = false
iastr_dwo_tabpage[1].str_dwo[2].b_update = false
iastr_dwo_tabpage[1].str_dwo[2].b_delete = false
iastr_dwo_tabpage[1].str_dwo[2].b_query = true
iastr_dwo_tabpage[1].str_dwo[2].b_print = true
iastr_dwo_tabpage[1].str_dwo[2].b_excel = true
iastr_dwo_tabpage[1].str_dwo[2].b_traceable = false
iastr_dwo_tabpage[1].str_dwo[2].b_keyboardlocked = true
iastr_dwo_tabpage[1].str_dwo[2].s_description ='Tồn kho'


iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_display_model = '1d'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_onhand_loc_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = 'd_onhand_loc_grid'
iastr_dwo_tabpage[2].str_dwo[1].b_master = false
iastr_dwo_tabpage[2].str_dwo[1].b_detail = true
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = false
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_onhand_loc_grid;'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[2].str_dwo[1].s_master_keycol =  'ID;WAREHOUSE_CODE;'
iastr_dwo_tabpage[2].str_dwo[1].s_detail_keycol = 'ID;WAREHOUSE_CODE;'
iastr_dwo_tabpage[2].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[2].str_dwo[1].s_ref_table_field = ''
iastr_dwo_tabpage[2].str_dwo[1].b_insert = false
iastr_dwo_tabpage[2].str_dwo[1].b_update = false
iastr_dwo_tabpage[2].str_dwo[1].b_delete = false
iastr_dwo_tabpage[2].str_dwo[1].b_query = true
iastr_dwo_tabpage[2].str_dwo[1].b_print = true
iastr_dwo_tabpage[2].str_dwo[1].b_excel = true
iastr_dwo_tabpage[2].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[2].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[2].i_index = 2
iastr_dwo_tabpage[2].str_dwo[1].s_description ='Tôn kho theo vị trí'
end subroutine

event constructor;call super::constructor;is_table = 'ITEM_BALANCE'
ib_changed_dwo_4edit = false
is_display_model = '1tb'
ib_display_text = false
is_object_title = 'Truy vấn tồn kho'

istr_actionpane[1].s_description = is_object_title
end event

on c_onhand.create
call super::create
end on

on c_onhand.destroy
call super::destroy
end on

event e_action_ctrl_bttn;call super::e_action_ctrl_bttn;datawindow				ldw_focus
int							li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	//-- control d_action_edit --//
	FOR li_idx = 1 to upperbound(istr_actionpane[]) 
		if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
			istr_actionpane[li_idx].s_visible_buttons='b_refresh;b_filteron;b_query;'
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_e_refresh;call super::e_window_e_refresh;string			ls_item_code, ls_fileName, ls_default_directory, ls_path
double		ldb_id
int				li_cnt
blob			lblob_ppoto
t_dw_mpl	ldw_photo

iw_display.idw_focus  = iw_display.f_get_dw( 'd_onhand_grid')
if iw_display.idw_focus.getrow() > 0 then
	ls_item_code = iw_display.idw_focus.getitemstring(iw_display.idw_focus.getrow() , 'item_code')
	ldb_id =  iw_display.idw_focus.getitemnumber(iw_display.idw_focus.getrow() , 'id')
	if ls_item_code <> '' and not isnull(ls_item_code) then
		//-- xoá file hình local--//
		select count(id)  into :li_cnt
		from attachment 
		where object_ref_id = :ldb_id
		and line_no = 1
		using it_transaction;
		if li_cnt > 0 then
			select file_name into :ls_fileName
			from attachment 
			where object_ref_id = :ldb_id
			and line_no = 1
			using it_transaction;

			ls_default_directory = gs_path_pic
			ls_path = ls_default_directory + '\pics\' + ls_fileName
			if FileExists ( ls_path ) then
				FileDelete ( ls_path )
				if  iw_display.idw_focus.getrow() = 1 then
					//-- nạp lại hình từ DB--//
					select attach_doc into :lblob_ppoto
					from attachment
					where object_ref_id = :ldb_id
						and line_no = 1
						using it_transaction; 
					gf_blob2file(lblob_ppoto, ls_path)
					ldw_photo = iw_display.f_get_dw( 'd_item_photo_form')
					ldw_photo.setitem(1, 'photo', 'pics\' + ls_fileName)
					
				end if
			end if			
		end if
	end if
end if
return 1
end event

event e_window_e_postopen;call super::e_window_e_postopen;t_dw_mpl		ldw_photo

ldw_photo = iw_display.f_get_dw('d_item_photo_form')
ldw_photo.insertrow( 0)

return ancestorreturnvalue
end event

event e_dw_clicked;call super::e_dw_clicked;
string 			ls_curdir,  ls_path_name, ls_file_name, ls_file_extension, ls_file_type, ls_dwo, ls_sql
boolean			lb_rtn
int					li_rtn
long				ll_pos
blob				lblb_document
double			ldb_ref_id
t_dw_mpl		ldw_main

//
//if vs_colname = 'b_del' then
////-- xoá hình trong attachement để up lại --///
//	ldw_main = this.iw_display.f_get_dwmain( )
//	ls_dwo = ldw_main.dataobject
//	if ldw_main.getrow() > 0 then	
//		ldb_ref_id = ldw_main.getitemnumber(ldw_main.getrow(),'id')
//		connect using it_transaction;
//		DELETE attachment 
//				where object_ref_id = :ldb_ref_id
//				and dwobject = :ls_dwo
//				and line_no = 1
//				using it_transaction;
//		if  it_transaction.sqlcode = 0 then
//			commit using it_transaction;
//		else
//			gf_messagebox('m.c_attachment.e_action_load_file.01','Thông báo','Lỗi update BLOB:@'+ it_transaction.sqlerrtext,'stop','ok',1)
//			rollback using it_transaction;					
//			return -1					
//		end if		
//		disconnect using it_transaction;
//		rdw_handling.setitem(vl_currentrow,'photo','')
//	end if
//elseif  vs_colname = 'b_add' then
//	ldw_main = this.iw_display.f_get_dwmain( )
//	ls_dwo = ldw_main.dataobject
//	if ldw_main.getrow() > 0 then	
//		ldb_ref_id = ldw_main.getitemnumber(ldw_main.getrow(),'id')
//		ls_curdir = GetCurrentDirectory()
//		li_rtn = GetFileOpenName("Select File", ls_path_name, ls_file_name, "(*.bmp;*.png;*.jpg;*.jpeg)","*.bmp;*.png;*.jpg;*.jpeg")
//		If li_rtn < 1 Then return -1
//		ChangeDirectory(ls_curdir)
//		
//		ll_pos = LastPos(ls_file_name,".")
//		If (ll_pos > 0) Then
//			ls_file_extension = Mid(ls_file_name,ll_pos)
//			RegistryGet("HKEY_CLASSES_ROOT\" + ls_file_extension,"Content Type",ls_file_type)
//			If IsNull(ls_file_type) or Len(Trim(ls_file_type)) = 0 Then
//				ls_file_type = Mid(ls_file_extension,2)
//			End If
//		End If	
//		
//		li_rtn = gf_file2blob(ls_path_name, lblb_document)
//		If li_rtn = 1 Then
//						
//			connect using it_transaction;
//			
//			ls_sql = "insert into attachment(id,company_Id, branch_id, object_ref_id, object_ref_table, dwobject,line_no "
//			ls_sql +=	",file_name,file_type, created_by,created_date,last_mdf_by,last_mdf_date) "
//			ls_sql += " select TTD.SEQ_TABLE_ID.nextval,"+string(gi_user_comp_id) +","+string( gdb_branch )  +","+string(ldb_ref_id)+", 'OBJECT', '"+ls_dwo + "',"+string(1)
//			ls_sql += ", '"+ls_file_name+"' , '"+ls_file_type+"',"+string(gi_userid)+",sysdate,"+string(gi_userid)+",sysdate from dual"
//			execute immediate :ls_sql using it_transaction;
//			if it_transaction.sqlcode = 0 then
//				update attachment set attach_doc = :lblb_document
//				where object_ref_id = :ldb_ref_id
//				and dwobject = :ls_dwo
//				and line_no = 1
//				using it_transaction;
//				if  it_transaction.sqlcode = 0 then
//					commit using it_transaction;
//					rdw_handling.setitem(vl_currentrow,'photo','Pics\'+ls_file_name)
//					
//				else
//					gf_messagebox('m.c_attachment.e_action_load_file.01','Thông báo','Lỗi update BLOB:@'+ it_transaction.sqlerrtext,'stop','ok',1)
//					rollback using it_transaction;			
//					disconnect using it_transaction;
//					return -1					
//				end if
//			else
//				gf_messagebox('m.c_attachment.e_action_load_file.02','Thông báo','Lỗi update :@'+ it_transaction.sqlerrtext ,'stop','ok',1)
//				rollback using it_transaction;
//			end if
//			disconnect using it_transaction;
//		else 
//			gf_messagebox('m.c_attachment.e_action_load_file.03','Thông báo','Lỗi đoc file: line 26' ,'stop','ok',1)
//			return -1			
//		End If	
//	end if
//end if
return 0



end event

event e_dw_rowfocuschanged;call super::e_dw_rowfocuschanged;string				ls_item_code, ls_photo_file, ls_path, ls_default_directory,ls_fileName
double			ldb_id
blob				lblob_ppoto
int					li_cnt
t_dw_mpl		ldw_photo
t_transaction	lt_transaction


if rpo_dw.dataobject = 'd_onhand_grid' then
	if vl_currentrow > 0 then
		ls_item_code = rpo_dw.getitemstring(vl_currentrow , 'item_code')
		ldb_id =  rpo_dw.getitemnumber(vl_currentrow  , 'id')
		if ls_item_code <> '' and not isnull(ls_item_code) then
			lt_transaction = create t_transaction
			lt_transaction.dbms =	SQLCA.DBMS
			lt_transaction.ServerName	 = SQLCA.ServerName
			lt_transaction.LogId	 = SQLCA.LogId
			lt_transaction.LogPass 	 = SQLCA.LogPass 
			lt_transaction.AutoCommit 	 = false 
			lt_transaction.DBParm	 = SQLCA.DBParm
			connect using	lt_transaction;			
	
			//-- xoá file hình local--//
			select count(id)  into :li_cnt
			from attachment 
			where object_ref_id = :ldb_id
			and line_no = 1
			using lt_transaction;
			if li_cnt > 0 then
				select file_name into :ls_fileName
				from attachment 
				where object_ref_id = :ldb_id
				and line_no = 1
				using lt_transaction;
	
				ls_default_directory = gs_path_pic
				ls_path = ls_default_directory + '\pics\' + ls_fileName
				if not FileExists ( ls_path ) then
					//-- nạp lại hình từ DB--//
					select attach_doc into :lblob_ppoto
					from attachment
					where object_ref_id = :ldb_id
						and line_no = 1
						using lt_transaction; 
					gf_blob2file(lblob_ppoto, ls_path)
	
				end if		
				ldw_photo = iw_display.f_get_dw( 'd_item_photo_form')
				ldw_photo.setitem(1, 'photo', 'pics\' + ls_fileName)
			else
				ldw_photo = iw_display.f_get_dw( 'd_item_photo_form')
				ldw_photo.setitem(1, 'photo', '')			
			end if
	
			disconnect using lt_transaction;		
	
		else
			ldw_photo = iw_display.f_get_dw( 'd_item_photo_form')
			ldw_photo.setitem(1, 'photo', '')				
		end if
	end if
end if
return 1
return ancestorreturnvalue
end event

