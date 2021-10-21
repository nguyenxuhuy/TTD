$PBExportHeader$c_label_object.sru
forward
global type c_label_object from c_label
end type
end forward

global type c_label_object from c_label
end type
global c_label_object c_label_object

type variables

protected:

end variables

forward prototypes
public function integer f_load_label (ref datawindow rpo_dw)
end prototypes

public function integer f_load_label (ref datawindow rpo_dw);window				lw_parent
powerobject			lpo_parent_handling
s_str_actionpane	lstr_actionpane[]
string					ls_dwo, ls_dwo_trim
int						li_idx
long					ll_row


//-- load các field mới --//
lw_parent = iw_display.dynamic f_getparentwindow()
if isvalid(lw_parent) then
	lpo_parent_handling = lw_parent.dynamic f_get_obj_handling()
	if isvalid(lpo_parent_handling) then		
		ls_dwo = iw_display.dynamic f_get_rightcliked_objname() 
//		if left(ls_dwo,8) <> 'd_action' then 
//			this.f_add_dwo_label( rpo_dw, ls_dwo, lstr_actionpane[li_idx].s_description, lpo_parent_handling.classname())	
//		else
			this.f_add_dwo_label( rpo_dw, ls_dwo,'', ls_dwo)	
//		end if
		iw_display.dynamic event e_save()
		t_w_mdi.ids_lang_text.retrieve( gs_user_lang, gdb_industry_id)
	end if
end if
return 1
end function

on c_label_object.create
call super::create
end on

on c_label_object.destroy
call super::destroy
end on

event constructor;call super::constructor;
is_table = 'LABEL'
ib_changed_dwo_4edit = false
ib_keyboardlocked = true
is_display_model = '2d'
is_object_title = 'Dịch tên nhãn'

istr_dwo[1].s_dwo_default = 'd_label_vn_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_label_vn_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_label_foreign_grid'
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = false
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].s_description = 'Tên nhãn tiếng Việt'

istr_dwo[2].s_dwo_default = 'd_label_foreign_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_label_foreign_grid'
istr_dwo[2].b_detail = true
istr_dwo[2].s_dwo_master = 'd_label_vn_grid'
istr_dwo[2].s_master_keycol = 'code;subcode'
istr_dwo[2].s_detail_keycol = 'code;subcode'
istr_dwo[2].b_ref_table_yn  = false
istr_dwo[2].s_ref_table_field = ''
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].s_description = 'Tên nhãn tiếng nước ngoài'
end event

event e_dw_e_preretrieve;call super::e_dw_e_preretrieve;
window					lw_parent
datawindow				ldw_focus
c_sql						lc_sql
long						ll_cur_hdl
string						ls_currentSQL, ls_currentWhere, ls_modify, ls_rtn, ls_dwo_trim

if rpo_dw.classname() = 'dw_1' then
	if not isvalid(iw_display) then return -1
	//-- them dieu kien vao where --//
	ls_dwo_trim =  iw_display.dynamic f_get_rightcliked_objname() 
	ls_dwo_trim = mid(ls_dwo_trim,1,len(ls_dwo_trim) - 5)
	if rpo_dw.dynamic f_getcurrentSQL( ls_currentSQL, ls_currentWhere) =1 then
		if ls_currentWhere <> '' then ls_currentWhere += ' AND '
		ls_currentWhere += "code like ~~'" + ls_dwo_trim +"%~~'"
		lc_sql.f_addtowhereclause( ls_currentSQL, ls_currentWhere, " AND ")
		ls_modify = "Datawindow.Table.Select= '" + ls_currentSQL +"'"
		ls_rtn =rpo_dw.modify(ls_modify )
	end if		
end if
return 0
end event

event e_window_e_refresh;call super::e_window_e_refresh;
datawindow		ldw_main
ldw_main = iw_display.dynamic f_get_dwmain()
this.f_load_label( ldw_main)
return 1
end event

