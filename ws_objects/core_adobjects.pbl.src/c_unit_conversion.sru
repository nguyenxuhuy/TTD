$PBExportHeader$c_unit_conversion.sru
forward
global type c_unit_conversion from s_object_display
end type
end forward

global type c_unit_conversion from s_object_display
end type
global c_unit_conversion c_unit_conversion

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_related ()
public subroutine f_set_actionpane ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_unit_conversion_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_unit_conversion_grid'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Cài đặt quy đổi đơn vị'
end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_uom'
istr_dwo_related[1].s_main_obj_dwo = 'd_unit_conversion_grid' 
istr_dwo_related[1].s_main_obj_column = 'FROM_UNIT_ID'
istr_dwo_related[1].s_related_obj_dwo =  'd_uom_grid'
istr_dwo_related[1].s_related_obj_column =  'id'
istr_dwo_related[1].s_relatedtext_column = 'code;name'
istr_dwo_related[1].s_text = 'Đơn vị của: '

istr_dwo_related[2].s_related_obj_name = 'u_rounding'
istr_dwo_related[2].s_main_obj_dwo = 'd_unit_conversion_grid' 
istr_dwo_related[2].s_main_obj_column = 'round_id'
istr_dwo_related[2].s_related_obj_dwo =  'd_rounding_grid'
istr_dwo_related[2].s_related_obj_column =  'id'
istr_dwo_related[2].s_relatedtext_column = 'code_from_unit;code_item' 
istr_dwo_related[2].s_text = 'Phương pháp làm tròn của: '
end subroutine

public subroutine f_set_actionpane ();//istr_actionpane[2].s_dwo_action = 'd_action_related_object'
//istr_actionpane[2].s_objname_handling = this.classname( )
//istr_actionpane[2].s_description = 'Đối tượng liên quan'
//
//istr_actionpane[3].s_dwo_action = 'd_action_manage'
//istr_actionpane[3].s_objname_handling = this.classname( )
//istr_actionpane[3].s_description = 'Menu quản lý'
end subroutine

on c_unit_conversion.create
call super::create
end on

on c_unit_conversion.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'UNIT_CONVERSION'
ib_changed_dwo_4edit = false
is_display_model = '1d'
ib_display_text = false
is_object_title = 'Quy đổi đơn vị'

istr_actionpane[1].s_description = is_object_title


istr_actionpane[1].s_button_name =  'e_add;e_modify;e_delete;'
//istr_actionpane[1].s_button_name += 'b_doc_trace;b_cancel;b_self_copy;e_add;e_modify;e_delete;'
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

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;double 				ldb_item_id,ldb_unit_id,ldb_data,ldb_class_id
string					ls_unit_code
int						li_rtn

b_obj_instantiate	lb_obj

if AncestorReturnValue = 1 then return 1
choose case vs_colname
	case 'code_from_unit'
		ldb_item_id = rpo_dw.getitemnumber(vl_currentrow,'item_id')
		ls_unit_code = vs_editdata
		//--Nếu không nhập mã hàng thì setitem đơn vị chuẩn vào to_unit_code--//
		if isnull(ldb_item_id) or ldb_item_id <= 0 then
			connect using it_transaction;
			ldb_class_id = ic_unit_instance.f_get_unit_class_id_ex( ls_unit_code , it_transaction )
			if ic_unit_instance.f_get_unit_standard_ex( ls_unit_code, ldb_unit_id,ldb_class_id, it_transaction) > 0 then
				rpo_dw.setitem(vl_currentrow,'code_to_unit',ls_unit_code)
				rpo_dw.setitem(vl_currentrow,'to_unit_id',ldb_unit_id)
				disconnect using it_transaction;
			else
				gf_messagebox('m.c_unit_conversion.e_dw_e_itemchanged.01','Thông báo','Chưa có đơn vị chuẩn','exclamation','ok',1)
				disconnect using it_transaction;
				return 1
			end if
		end if
	case 'code_to_unit'
		 //-- nếu có mã hàng thì from_unit phải là stock unit  của mã hàng--//
		ldb_item_id = rpo_dw.getitemnumber(vl_currentrow,'item_id')
		ls_unit_code = vs_editdata		 
		 if not isnull(ldb_item_id) and ldb_item_id > 0 then
			connect using it_transaction;
			li_rtn = lb_obj.f_get_stock_uom_ex(ldb_item_id,ldb_unit_id, ls_unit_code, it_transaction )
			disconnect using it_transaction;
			if li_rtn = -1 then return 1
			if lower(ls_unit_code) <> lower(vs_editdata) then
				gf_messagebox('m.c_unit_conversion.e_dw_e_itemchanged.02','Thông báo','Phải chọn đơn vị tồn kho của mã hàng cho đơn vị <Đến>','exclamation','ok',1)
				return 1
			end if
		end if
	case 'code_item'
		connect using it_transaction;
		li_rtn = lb_obj.f_get_stock_uom_ex(vs_editdata,ldb_unit_id, ls_unit_code, it_transaction )
		disconnect using it_transaction;
		if li_rtn = -1 then return 1
		rpo_dw.setitem(vl_currentrow, 'code_to_unit',ls_unit_code)
		rpo_dw.setitem(vl_currentrow, 'TO_UNIT_ID',ldb_unit_id)
		
	case 'to_coefficient'
end choose
return AncestorReturnValue
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;rpo_dw.setitem(vl_currentrow,'text_equal','=')
rpo_dw.setitem(vl_currentrow,'text_add','+')


return 0
end event

event e_action_ctrl_e_postmodifyrow;datawindow				ldw_focus
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
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify; b_saveclose;b_refresh;b_delete;'
						istr_actionpane[li_idx].s_enabled_buttons = 'b_add;b_insert;b_saveclose;b_refresh;b_delete;'
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
					istr_actionpane[li_idx].s_enabled_buttons='b_add;b_save;b_refresh;b_delete;'							
				end if
			end if
		elseif istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then
			
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
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
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify; b_filteron;b_query;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_filteron;b_query;b_refresh;b_delete;'
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
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_insert;b_modify;b_modify;b_filteron;b_query;b_refresh;b_delete;'
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_insert;b_modify;b_filteron;b_query;b_refresh;b_delete;'
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
			istr_actionpane[li_idx].s_visible_buttons = 'b_uom;b_rounding;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
	//		istr_actionpane[li_idx].s_visible_buttons =  'b_book; b_attach; b_note;b_doc_trace;b_user_trace;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
			
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_e_postopen_child;call super::e_window_e_postopen_child;//long				ll_row
//int					li_cnt, li_idx
//string				lsa_colname[], ls_coltype, ls_itemCode, ls_itemName, ls_uomCode, ls_spec
//double			ldb_stock_uom
//t_dw_mpl				ldw_main
//c_string					lc_string
//b_obj_instantiate		lbo_ins
//if upperbound(istr_data_related[]) = 1 then
//	ldw_main = iw_display.f_get_dwmain( )
//	ldw_main.event e_retrieve( )
//	if ldw_main.rowcount( ) = 0 and istr_data_related[1].s_related_obj_dwo = ldw_main.dataobject then
//		ll_row = iw_display.event e_add( )
//		li_cnt = lc_string.f_stringtoarray( istr_data_related[1].s_related_obj_column, ';', lsa_colname[])
//		FOR li_idx = 1 to li_cnt
//			ls_coltype = ldw_main.describe( lsa_colname[li_idx] +'.coltype')
//			if left(ls_coltype,5) = 'numbe' then
//				ldw_main.setitem( ll_row, lsa_colname[li_idx], double(istr_data_related[1].s_data[li_idx]))
//				if  lower(lsa_colname[li_idx]) = 'item_id' then
//					if lbo_ins.f_get_item_code_n_name_spec_ex(double(istr_data_related[1].s_data[li_idx]), ls_itemCode, ls_itemName, ls_spec, it_transaction ) = 1 then
//						ldw_main.setitem( ll_row, 'code_item', ls_itemCode)
//						ldw_main.setitem( ll_row, 'name_item', ls_itemName)
//						ldw_main.setitem( ll_row, 'spec_desc', ls_spec)
//						lbo_ins.f_get_stock_uom_ex( double(istr_data_related[1].s_data[li_idx]), ldb_stock_uom, ls_uomCode , it_transaction )
//						ldw_main.setitem( ll_row, 'to_unit_id', ldb_stock_uom)
//						ldw_main.setitem( ll_row, 'code_to_unit', ls_uomCode)					
//					end if
//				end if
//			end if
//		NEXT
//	elseif ldw_main.rowcount( ) > 0 and istr_data_related[1].s_related_obj_dwo = ldw_main.dataobject then
//		iw_display.event e_modify( )
//	end if
//end if

return ancestorreturnvalue
end event

event e_window_close;call super::e_window_close;s_object_display			lod_handle

if iw_display.is_opentype = 'auto' then
	if gf_messagebox('m.c_unit_conversion.e_window_cloase.01','Xác nhận','Bạn có cần nhập liều dùng không?','question','yesno',2) = 1 then
		lod_handle = iw_display.iw_parent.f_get_obj_handling( )
		lod_handle.dynamic event e_action_dosage( )
	end if	
end if
return ancestorreturnvalue
end event

