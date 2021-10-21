$PBExportHeader$c_label_entry.sru
forward
global type c_label_entry from c_label
end type
end forward

global type c_label_entry from c_label
end type
global c_label_entry c_label_entry

type variables

protected:

end variables

forward prototypes
public function integer f_load_label (ref datawindow rpo_dw)
public function integer f_add_menu_label (ref datawindow rdw_label_vn, string vs_menuname)
public subroutine f_set_dwo_window ()
public function integer f_add_object_label (ref datawindow rdw_label_vn, string vs_object_name)
end prototypes

public function integer f_load_label (ref datawindow rpo_dw);window				lw_handle
dropdownlistbox	lddlb_2
string					ls_object_name
int						li_idx
long					ll_row
double				ldb_id

//-- load các field mới --//

lddlb_2 = iw_display.dynamic f_get_ddlb2()
ls_object_name = lddlb_2.text	
if ls_object_name = '' then return 0
if pos(ls_object_name, '_m_') > 0 then
	this.f_add_menu_label( rpo_dw, ls_object_name)
elseif pos(ls_object_name, 'd_') > 0 or pos(ls_object_name, 'dd_') > 0  then
	this.f_add_dwo_label( rpo_dw, ls_object_name,'', ls_object_name)
elseif pos(ls_object_name, '_w_') > 0  then
	this.f_add_windowobj_label( rpo_dw, ls_object_name, ls_object_name)
elseif left(ls_object_name,2)= 'u_' then
	this.f_add_object_label(rpo_dw , ls_object_name)
end if	

disconnect using it_transaction;
iw_display.dynamic event e_save()
connect using it_transaction;

connect using sqlca;
t_w_mdi.ids_lang_text.settransobject( sqlca)
t_w_mdi.ids_lang_text.retrieve( gs_user_lang, gdb_industry_id)
disconnect using sqlca;
return 1
end function

public function integer f_add_menu_label (ref datawindow rdw_label_vn, string vs_menuname);
int 					li_idx1, li_idx2, li_idx3
string					ls_code
Long 					ll_find, ll_row

menu					l_menu

l_menu = create using vs_menuname
For li_idx1 = 1 to UpperBound(l_menu.item)

	if  l_menu.item[li_idx1].text = '-' then continue
	ls_code =  l_menu.item[li_idx1].classname()
	ll_find = t_w_mdi.ids_lang_text.Find("code = '"+ ls_code +"'", 1, t_w_mdi.ids_lang_text.RowCount())
	if ll_find > 0 then continue
	ll_row = rdw_label_vn.dynamic event e_addrow()
	rdw_label_vn.setitem(ll_row, 'lang',gs_user_lang )	
	rdw_label_vn.setitem(ll_row, 'code', ls_code)
	rdw_label_vn.setitem(ll_row, 'subcode','button')
	rdw_label_vn.setitem(ll_row, 'text', l_menu.item[li_idx1].text )		
	if  l_menu.item[li_idx1].classname() = 'm_module' then continue
	FOR li_idx2 = 1 to upperbound( l_menu.item[li_idx1].item)
		if l_menu.item[li_idx1].item[li_idx2].text = '-' then continue 
		ls_code =  l_menu.item[li_idx1].item[li_idx2].classname()
		ll_find = t_w_mdi.ids_lang_text.Find("code = '"+ ls_code +"'", 1, t_w_mdi.ids_lang_text.RowCount())
		if ll_find > 0 then continue
		ll_row = rdw_label_vn.dynamic event e_addrow()		
		rdw_label_vn.setitem(ll_row, 'lang', gs_user_lang )	
		rdw_label_vn.setitem(ll_row, 'code', ls_code)
		rdw_label_vn.setitem(ll_row, 'subcode','button')
		rdw_label_vn.setitem(ll_row, 'text', l_menu.item[li_idx1].item[li_idx2].text )		
		FOR li_idx3 = 1 to upperbound( l_menu.item[li_idx1].item[li_idx2].item)
			if l_menu.item[li_idx1].item[li_idx2].item[li_idx3].text = '-' then continue 
			ls_code =  l_menu.item[li_idx1].item[li_idx2].item[li_idx3].classname()
			ll_find = t_w_mdi.ids_lang_text.Find("code = '"+ ls_code +"'", 1, t_w_mdi.ids_lang_text.RowCount())
			if ll_find > 0 then continue
			ll_row = rdw_label_vn.dynamic event e_addrow()					
			rdw_label_vn.setitem(ll_row, 'lang', gs_user_lang )	
			rdw_label_vn.setitem(ll_row, 'code', ls_code)
			rdw_label_vn.setitem(ll_row, 'subcode','button')
			rdw_label_vn.setitem(ll_row, 'text', l_menu.item[li_idx1].item[li_idx2].item[li_idx3].text )			
		NEXT			
	NEXT
Next

Return 1

end function

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default = 'd_label_vn_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_label_vn_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_label_foreign_grid'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_keyboardlocked = true
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
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_description = 'Tên nhãn tiếng nước ngoài'
end subroutine

public function integer f_add_object_label (ref datawindow rdw_label_vn, string vs_object_name);
int 					li_idx1, li_idx2, li_idx3
string					ls_code
Long 					ll_find, ll_row




ll_find = t_w_mdi.ids_lang_text.Find("code = '"+ vs_object_name +"'", 1, t_w_mdi.ids_lang_text.RowCount())
if ll_find = 0 then
	ll_row = rdw_label_vn.dynamic event e_addrow()
	rdw_label_vn.setitem(ll_row, 'lang',gs_user_lang )	
	rdw_label_vn.setitem(ll_row, 'code', vs_object_name)
	rdw_label_vn.setitem(ll_row, 'subcode','N_MENU')
	rdw_label_vn.setitem(ll_row, 'text', vs_object_name )		
end if

Return 1

end function

on c_label_entry.create
call super::create
end on

on c_label_entry.destroy
call super::destroy
end on

event constructor;call super::constructor;
is_table = 'LABEL'
ib_changed_dwo_4edit = false
ib_keyboardlocked = true
is_display_model = '2ddlb_2d'
is_object_title = 'Dịch tên nhãn'


end event

event e_window_e_refresh;call super::e_window_e_refresh;
datawindow		ldw_main
ldw_main = iw_display.dynamic f_get_dwmain()
this.f_load_label( ldw_main)
return 1
end event

event e_ddlb_selectionchanged;call super::e_ddlb_selectionchanged;
dropdownlistbox			lddlb_2
datastore					lds_object_syntax
datawindow					ldw_label

String 						ls_entries
string 						ls_lib_name 
long 							ll_row, li_pos

if rddlb_handling.classname() = 'ddlb_1' then
	li_pos = LastPos(rddlb_handling.text,'\')
	ls_lib_name = Mid(rddlb_handling.text,li_pos + 1)
	//-- load datawindow --//
	ls_entries = LibraryDirectory( ls_lib_name, Dirdatawindow! )
	lds_object_syntax = create datastore
	lds_object_syntax.dataobject = 'ds_object_syntax'
	lds_object_syntax.Reset( )
	lds_object_syntax.ImportString(ls_Entries)
	
	lddlb_2 = iw_display.dynamic f_get_ddlb2()
	lddlb_2.reset( )
	for ll_row = 1 to lds_object_syntax.rowcount()
		lddlb_2.additem(lds_object_syntax.getitemstring(ll_row, 'object_name') )	
	next 
	//-- load menu --//
	ls_entries = LibraryDirectory( ls_lib_name, DirMenu! )
	
	lds_object_syntax.Reset( )
	lds_object_syntax.ImportString(ls_Entries)
	 
	for ll_row = 1 to lds_object_syntax.rowcount()
		if lds_object_syntax.getitemstring(ll_row, 'object_name') = 't_m_mdi' &
			or lds_object_syntax.getitemstring(ll_row, 'object_name') = 't_m_popup_object' &
			or lds_object_syntax.getitemstring(ll_row, 'object_name') = 't_m_actionbutton' then
			lddlb_2.additem(lds_object_syntax.getitemstring(ll_row, 'object_name') )	
		end if
	next 
	//-- load window --//
	ls_entries = LibraryDirectory( ls_lib_name, DirWindow! )
	
	lds_object_syntax.Reset( )
	lds_object_syntax.ImportString(ls_Entries)
	
	for ll_row = 1 to lds_object_syntax.rowcount()
		if lds_object_syntax.getitemstring(ll_row, 'object_name') = 't_w_menu' &
			or lds_object_syntax.getitemstring(ll_row, 'object_name') = 's_w_background' then
			lddlb_2.additem(lds_object_syntax.getitemstring(ll_row, 'object_name') )	
		end if
	next 	
	//-- load DirUserObject --//
	ls_entries = LibraryDirectory( ls_lib_name, DirUserObject! )
	lds_object_syntax.Reset( )
	lds_object_syntax.ImportString(ls_Entries)
	for ll_row = 1 to lds_object_syntax.rowcount()
		lddlb_2.additem(lds_object_syntax.getitemstring(ll_row, 'object_name') )	
	next 	
	
	destroy lds_object_syntax
else
	ldw_label = iw_display.dynamic f_get_dwmain()
	connect using it_transaction;
	ldw_label.settransobject(it_transaction )
	ldw_label.dynamic event e_retrieve()
	disconnect using it_transaction;
	
end if
return 1
end event

event e_window_e_preopen;call super::e_window_e_preopen;dropdownlistbox	lddlb_lib
string 				ls_list_library, ls_library_name
int						ll_index
long					ll_count


ls_list_library = getlibrarylist()
if isnull(ls_list_library) or trim(ls_list_library) = '' then return 0
ll_index = 0 
ll_count = pos(ls_list_library, ',')
lddlb_lib = iw_display.dynamic f_get_ddlb1()
if isvalid(lddlb_lib) then
	do while ll_count > 0 
		ls_library_name = mid(ls_list_library, 1, ll_count - 1)
		ls_list_library = mid(ls_list_library, ll_count + 1)
		if pos(ls_library_name, 'dw_') > 0  or pos(ls_library_name, 'top') > 0 or pos(ls_library_name, 'user_') > 0 then
			lddlb_lib.additem( ls_library_name)
		end if
		ll_count =  pos(ls_list_library, ',')
		if ll_count = 0 and len(trim(ls_list_library)) > 0 then 
			if pos(ls_library_name, 'dw_') > 0  or pos(ls_library_name, 'top') > 0 then
				lddlb_lib.additem( ls_list_library)
			end if
		end if 	
	loop
end if
return 1
end event

event e_dw_e_preretrieve;call super::e_dw_e_preretrieve;string					ls_object_name,  ls_currentSQL, ls_currentWhere, ls_modify, ls_rtn,ls_where,ls_colname,ls_coltype

dropdownlistbox	lddlb_handling
c_sql					lc_sql
c_dwservice			lc_dwservice


lddlb_handling = iw_display.dynamic f_get_ddlb2()
ls_object_name = lddlb_handling.text	
if ls_object_name = 't_m_actionbutton' or ls_object_name = 't_m_popup_object'  then ls_object_name = 'button'

if rpo_dw.classname() = 'dw_1' then
	if rpo_dw.dynamic f_getcurrentSQL( ls_currentSQL, ls_currentWhere) =1 then
		if left(ls_object_name,2) = 'u_' then
			ls_colname = 'code'
		else
			ls_colname = 'subcode'
		end if
		lc_dwservice.f_get_build_column( rpo_dw, ls_colname, ls_coltype)
		ls_where = ls_colname
		/*****/
		if ls_currentWhere <> '' then ls_currentWhere += ' AND '
		ls_currentWhere +=  +ls_where+"= ~~'" + ls_object_name +"~~'"	
		lc_sql.f_addtowhereclause( ls_currentSQL, ls_currentWhere, " AND ")
		ls_modify = "Datawindow.Table.Select= '" + ls_currentSQL +"'"
		ls_rtn =rpo_dw.modify(ls_modify )	
	end if		
end if

return 0
end event

