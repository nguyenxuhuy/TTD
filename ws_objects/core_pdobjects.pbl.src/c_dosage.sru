$PBExportHeader$c_dosage.sru
forward
global type c_dosage from s_object_display
end type
end forward

global type c_dosage from s_object_display
end type
global c_dosage c_dosage

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_related ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_dosage_product_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_dosage_product_grid'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Liều dùng'
end subroutine

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'

end subroutine

public subroutine f_set_dwo_related ();//istr_dwo_related[1].s_related_obj_name = 'u_unit_class'
//istr_dwo_related[1].s_main_obj_dwo = 'd_uom_grid'
//istr_dwo_related[1].s_main_obj_column = 'class_id'
//istr_dwo_related[1].s_related_obj_dwo = 'd_unit_class_grid'
//istr_dwo_related[1].s_related_obj_column = 'id'
//istr_dwo_related[1].s_relatedtext_column = 'code;name'
//istr_dwo_related[1].s_text = 'Lớp đơn vị của:'
//
//istr_dwo_related[2].s_related_obj_name = 'u_unit_conversion'
//istr_dwo_related[2].s_main_obj_dwo = 'd_uom_grid'
//istr_dwo_related[2].s_main_obj_column = 'id'
//istr_dwo_related[2].s_related_obj_dwo = 'd_unit_conversion_grid'
//istr_dwo_related[2].s_related_obj_column = 'FROM_UNIT_ID'
//istr_dwo_related[2].s_relatedtext_column = 'code;name'
//istr_dwo_related[2].s_text = 'Quy đổi đơn vị của:'
end subroutine

on c_dosage.create
call super::create
end on

on c_dosage.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'UOM'
ib_changed_dwo_4edit = false
is_display_model = '1d'
ib_display_text = false
is_object_title = 'Liều dùng'

istr_actionpane[1].s_description = is_object_title
end event

event e_action_ctrl_e_postmodifyrow;return 0
end event

event e_action_ctrl_bttn;t_dw_mpl				ldw_focus
int							li_idx

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
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify; b_filteron;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_filteron;b_refresh;b_delete;'
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron; b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_filteron; b_refresh;b_delete;'
					end if
				end if
			else				
				if  ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_refresh;b_delete;'
				else
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_filteron;b_refresh;b_delete;'
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then
			istr_actionpane[li_idx].s_visible_buttons =  'b_attach;b_user_trace;'
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
			
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_window_e_postopen_child;call super::e_window_e_postopen_child;long				ll_row
int					li_cnt, li_idx
string				lsa_colname[], ls_coltype, ls_itemCode, ls_itemName, ls_uomCode
double			ldb_stock_uom
t_dw_mpl				ldw_main
c_string					lc_string
b_obj_instantiate		lbo_ins
if upperbound(istr_data_related[]) = 1 then
	ldw_main = iw_display.f_get_dwmain( )
	li_cnt = ldw_main.event e_retrieve( )
	if li_cnt = 0 and istr_data_related[1].s_related_obj_dwo = ldw_main.dataobject then
		ll_row = iw_display.event e_add( )
		li_cnt = lc_string.f_stringtoarray( istr_data_related[1].s_related_obj_column, ';', lsa_colname[])
		FOR li_idx = 1 to li_cnt
			ls_coltype = ldw_main.describe( lsa_colname[li_idx] +'.coltype')
			if left(ls_coltype,5) = 'numbe' then
				ldw_main.setitem( ll_row, lsa_colname[li_idx], double(istr_data_related[1].s_data[li_idx]))
				if  lower(lsa_colname[li_idx]) = 'object_ref_id' then
					ldw_main.setitem( ll_row, 'object_ref_table', 'OBJECT')
					if lbo_ins.f_get_object_code_n_name_ex(double(istr_data_related[1].s_data[li_idx]), ls_itemCode, ls_itemName, it_transaction) = 1 then
						ldw_main.setitem( ll_row, 'object_code', ls_itemCode)
						ldw_main.setitem( ll_row, 'object_name', ls_itemName)
						lbo_ins.f_get_stock_uom_ex( double(istr_data_related[1].s_data[li_idx]), ldb_stock_uom, ls_uomCode, it_transaction )
						ldw_main.setitem( ll_row, 'uom_code', ls_uomCode)	
					end if
				end if
			end if
		NEXT
	elseif  li_cnt > 0 and istr_data_related[1].s_related_obj_dwo = ldw_main.dataobject then
		iw_display.event e_modify( )
	end if
end if

return ancestorreturnvalue
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;

if rpo_dw.dataobject = 'd_dosage_product_grid' then
	if vs_colname = 'after_meal_yn' then
		if vs_editdata = 'Y' then
			rpo_dw.setitem( vl_currentrow, 'b4_meal_yn', 'N')
		end if
	elseif vs_colname = 'b4_meal_yn' then
		if vs_editdata = 'Y' then
			rpo_dw.setitem( vl_currentrow, 'after_meal_yn', 'N')
		end if		
	end if
end if
return ancestorreturnvalue
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;//long				ll_row
//int					li_cnt, li_idx
//string				lsa_colname[], ls_coltype, ls_itemCode, ls_itemName, ls_uomCode
//double			ldb_stock_uom
//t_dw_mpl				ldw_main
//c_string					lc_string
//b_obj_instantiate		lbo_ins
//if upperbound(istr_data_related[]) = 1 then
//	ldw_main = iw_display.f_get_dwmain( )
//	li_cnt = ldw_main.event e_retrieve( )
//	if li_cnt = 0 and istr_data_related[1].s_related_obj_dwo = ldw_main.dataobject then
//		ll_row = iw_display.event e_add( )
//		li_cnt = lc_string.f_stringtoarray( istr_data_related[1].s_related_obj_column, ';', lsa_colname[])
//		FOR li_idx = 1 to li_cnt
//			ls_coltype = ldw_main.describe( lsa_colname[li_idx] +'.coltype')
//			if left(ls_coltype,5) = 'numbe' then
//				ldw_main.setitem( ll_row, lsa_colname[li_idx], double(istr_data_related[1].s_data[li_idx]))
//				if  lower(lsa_colname[li_idx]) = 'object_ref_id' then
//					ldw_main.setitem( ll_row, 'object_ref_table', 'OBJECT')
//					if lbo_ins.f_get_object_code_n_name(double(istr_data_related[1].s_data[li_idx]), ls_itemCode, ls_itemName) = 1 then
//						ldw_main.setitem( ll_row, 'object_code', ls_itemCode)
//						ldw_main.setitem( ll_row, 'object_name', ls_itemName)
//						lbo_ins.f_get_stock_uom( double(istr_data_related[1].s_data[li_idx]), ldb_stock_uom, ls_uomCode)
//						ldw_main.setitem( ll_row, 'uom_code', ls_uomCode)	
//					end if
//				end if
//			end if
//		NEXT
//	elseif  li_cnt > 0 and istr_data_related[1].s_related_obj_dwo = ldw_main.dataobject then
//		iw_display.event e_modify( )
//	end if
//end if
//
return ancestorreturnvalue
end event

