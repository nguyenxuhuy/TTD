$PBExportHeader$c_label_window.sru
forward
global type c_label_window from c_label
end type
end forward

global type c_label_window from c_label
end type
global c_label_window c_label_window

type variables

end variables

forward prototypes
public function integer f_display_on_tv (ref treeview r_tv)
public function integer f_insert_tv_item (powerobject vpo_tv, ref treeview r_tv)
public function integer f_load_windowobj_2_tv (ref treeview rtv_handling, ref window rw_handling)
public function integer f_load_label (ref datawindow rpo_dw)
public subroutine f_set_dwo_window ()
end prototypes

public function integer f_display_on_tv (ref treeview r_tv);
s_w_main					lw_parent
s_object_display					lpo_parent_handling
t_dw_mpl					ldw_main, ldwa_detail[], ldwa_share[], ldwa_none_md[]
long 							ll_row, ll_handle, ll_root_hdl
int								li_rtn, li_cnt, li_dwoCnt, li_idx
string							ls_dwtitlte

//-- xóa treeview để load lại --//

//-- load treeview items--//
lw_parent = iw_display.f_getparentwindow()
if isvalid(lw_parent) then
	lpo_parent_handling = lw_parent.f_get_obj_handling()
	if isvalid(lpo_parent_handling) then
		if lpo_parent_handling.classname( ) <> 'u_valueset_entry' then
			ic_label_tv.istr_tv.s_object = upper(lpo_parent_handling.classname( ))
		else			
			ic_label_tv.istr_tv.s_object = upper(lpo_parent_handling.f_get_menu_code( ))
		end if
		ic_label_tv.istr_tv.s_label =  lpo_parent_handling.dynamic f_get_title()
		ic_label_tv.istr_tv.i_pic_idx =  1
		ic_label_tv.istr_tv.i_sel_pic_idx = 2
		ll_root_hdl = r_tv.dynamic f_insertitemlast(0, ic_label_tv)
		//-- add cac dw tren window --//
		ldw_main = lw_parent.f_get_dwmain( )
		ic_label_tv.istr_tv.s_object = ldw_main.dataobject
		ls_dwtitlte = ldw_main.title 
		if isnull(ls_dwtitlte) or ls_dwtitlte ='' then ls_dwtitlte = 'Tên DW'
		ic_label_tv.istr_tv.s_label = ls_dwtitlte
		ic_label_tv.istr_tv.i_pic_idx =  1
		ic_label_tv.istr_tv.i_sel_pic_idx = 2			
		ll_handle = r_tv.dynamic f_insertitemlast(ll_root_hdl, ic_label_tv)		
		//-- add cac DW detail--//
		li_dwoCnt = lw_parent.f_get_iwdw_detail( ldwa_detail[])
		FOR li_cnt = 1 to li_dwoCnt
			if  ldwa_detail[li_cnt].dataobject = ldw_main.dataobject then continue 
			ic_label_tv.istr_tv.s_object = ldwa_detail[li_cnt].dataobject 
			ls_dwtitlte = ldwa_detail[li_cnt].title 
			if isnull(ls_dwtitlte) or ls_dwtitlte ='' then ls_dwtitlte = 'Tên DW'			
			ic_label_tv.istr_tv.s_label =  ls_dwtitlte
			ic_label_tv.istr_tv.i_pic_idx =  1
			ic_label_tv.istr_tv.i_sel_pic_idx = 2			
			ll_handle = r_tv.dynamic f_insertitemlast(ll_root_hdl, ic_label_tv)
		NEXT
		//-- add cac dw share --//
		li_dwoCnt = lw_parent.f_get_iwdw_share(ldwa_share[])
		FOR li_cnt = 1 to li_dwoCnt
			if ldwa_share[li_cnt].dataobject = ldw_main.dataobject then continue 
			ic_label_tv.istr_tv.s_object = ldwa_share[li_cnt].dataobject
			ls_dwtitlte = ldwa_share[li_cnt].title 
			if isnull(ls_dwtitlte) or ls_dwtitlte ='' then ls_dwtitlte = 'Tên DW'			
			ic_label_tv.istr_tv.s_label =  ls_dwtitlte			
			ic_label_tv.istr_tv.i_pic_idx =  1
			ic_label_tv.istr_tv.i_sel_pic_idx = 2			
			ll_handle = r_tv.dynamic f_insertitemlast(ll_root_hdl, ic_label_tv)
		NEXT		
		
		//-- add cac dw none md --//
		li_dwoCnt = lw_parent.f_get_iadw_none_md( ldwa_none_md[])
		FOR li_cnt = 1 to li_dwoCnt
			if ldwa_none_md[li_cnt].dataobject = ldw_main.dataobject then continue 
			ic_label_tv.istr_tv.s_object = ldwa_none_md[li_cnt].dataobject
			ls_dwtitlte = ldwa_none_md[li_cnt].title 
			if isnull(ls_dwtitlte) or ls_dwtitlte ='' then ls_dwtitlte = 'Tên DW'			
			ic_label_tv.istr_tv.s_label =  ls_dwtitlte			
			ic_label_tv.istr_tv.i_pic_idx =  1
			ic_label_tv.istr_tv.i_sel_pic_idx = 2			
			ll_handle = r_tv.dynamic f_insertitemlast(ll_root_hdl, ic_label_tv)
		NEXT				
		
		//-- các nút trên window --//
		this.f_load_windowobj_2_tv( r_tv, lw_parent)
		
		ll_root_hdl = r_tv.FindItem(RootTreeItem! , 0)
		r_tv.setredraw(false)
		r_tv.SortAll(ll_root_hdl , userdefinedsort!)
		r_tv.selectitem(ll_root_hdl)
		r_tv.expanditem(ll_root_hdl)
		r_tv.setredraw(true)			
	else
		return -1
	end if
else
	return -1
end if

return li_cnt
end function

public function integer f_insert_tv_item (powerobject vpo_tv, ref treeview r_tv);int				li_rtn
double		ldb_id

li_rtn =  r_tv.dynamic f_populate_item(vpo_tv)
if li_rtn = -1 then
	ldb_id = double(vpo_tv.dynamic f_get_parentString())
	if ldb_id > 0 then
		li_rtn = this.f_insert_tv_item( ldb_id, r_tv)
	end if
end if
return li_rtn
end function

public function integer f_load_windowobj_2_tv (ref treeview rtv_handling, ref window rw_handling);
	int 					li_idx
	long 					ll_root_hdl
	string					ls_text
	windowobject 		lwo_window[]
	
	ll_root_hdl = rtv_handling.FindItem(RootTreeItem! , 0)
	lwo_window = rw_handling.control	

	For li_idx = 1 to upperbound(lwo_window)
		Choose Case lwo_window[li_idx].typeof()
			Case CommandButton!,PictureButton!		
				if  lwo_window[li_idx].visible = true then
					ls_text = lwo_window[li_idx].dynamic f_gettext()
					if isnull(ls_text) or ls_text ='' then continue
					ic_label_tv.istr_tv.s_label = ls_text
					ic_label_tv.istr_tv.s_object = lwo_window[li_idx].classname()
					ic_label_tv.istr_tv.i_pic_idx =  1
					ic_label_tv.istr_tv.i_sel_pic_idx = 2
					rtv_handling.dynamic f_insertitemlast(ll_root_hdl, ic_label_tv)	
				end if
		End Choose
	Next

	Return 1
end function

public function integer f_load_label (ref datawindow rpo_dw);s_w_main					lw_parent
s_object_display				lpo_parent_handling
c_obj_service			lc_obj_service
t_dw_mpl				ldw_main, ldw_detial[], ldw_share[], ldw_none_md[]

long 						ll_row, ll_rowcount 
int							li_rtn, li_idx, li_dwoCnt, li_colCnt, li_col
string						las_colname[], ls_coltext, ls_bttn, las_bttnText[], ls_dwo_trim, ls_code, ls_title,ls_parent_classname
long						ll_find

//-- load các field mới --//
lw_parent = iw_display.dynamic f_getparentwindow()
if isvalid(lw_parent) then
	lpo_parent_handling = lw_parent.dynamic f_get_obj_handling()
	if isvalid(lpo_parent_handling) then
		ls_parent_classname = upper(lpo_parent_handling.classname())
		if ls_parent_classname = 'U_VALUESET_ENTRY' then
			ls_parent_classname = upper(lpo_parent_handling.f_get_menu_code( ) )
		end if
		//-- add label cua cac dw main--//
		ldw_main = lw_parent.f_get_dwmain( )
		ls_title = ldw_main.title
		if isnull(ls_title) or ls_title ='' then ls_title = ldw_main.dataobject
		this.f_add_dwo_label( rpo_dw,ldw_main.dataobject, ls_title , ls_parent_classname)
		//-- add label cua cac dw detail --//
		li_dwoCnt =  lw_parent.f_get_iwdw_detail( ldw_detial[]) 
		FOR li_idx = 1 to li_dwoCnt		
			ls_title = ldw_detial[li_idx].title
			if isnull(ls_title) or ls_title ='' then ls_title = ldw_detial[li_idx].dataobject		
			this.f_add_dwo_label( rpo_dw, ldw_detial[li_idx].dataobject, ls_title , ls_parent_classname)
		NEXT		
		
		//-- add label cua cac dw share --//
		li_dwoCnt = lw_parent.f_get_iwdw_share( ldw_share[]) 
		FOR li_idx = 1 to li_dwoCnt		
			ls_title = ldw_share[li_idx].title
			if isnull(ls_title) or ls_title ='' then ls_title = ldw_share[li_idx].dataobject	
			this.f_add_dwo_label( rpo_dw,ldw_share[li_idx].dataobject	, ls_title, ls_parent_classname)
		NEXT		
		//-- add label cua cac dw none --//
		li_dwoCnt = lw_parent.f_get_iadw_none_md( ldw_none_md[])
		FOR li_idx = 1 to li_dwoCnt		
			ls_title = ldw_none_md[li_idx].title
			if isnull(ls_title) or ls_title ='' then ls_title = ldw_none_md[li_idx].dataobject	
			this.f_add_dwo_label( rpo_dw,ldw_none_md[li_idx].dataobject, ls_title, ls_parent_classname)
		NEXT		
		
		//-- thêm các buttn nếu là window error message --//
		if lpo_parent_handling.classname( ) = 'c_err_message' then
			if lpo_parent_handling.dynamic f_get_init_button( ls_bttn, las_bttnText[]) = 1 then
				li_colCnt = lc_obj_service.f_stringtoarray( ls_bttn, ';', las_colname[])
				FOR li_col = 1 to li_colCnt
					ls_code = lpo_parent_handling.classname()+'.'+las_colname[li_col]
					ll_find = t_w_mdi.ids_lang_text.Find("code = '"+ ls_code +"'", 1, t_w_mdi.ids_lang_text.RowCount())
					if ll_find > 0 then continue
					ll_row = rpo_dw.dynamic event e_addrow()
					rpo_dw.setitem(ll_row, 'code',  ls_code)
					rpo_dw.setitem(ll_row, 'subcode', ls_parent_classname)
					rpo_dw.setitem(ll_row, 'text', las_bttnText[li_col] )	
					rpo_dw.setitem(ll_row, 'lang', gs_user_lang )					
				NEXT
			end if
		end if
	end if
	//-- thêm các control là button trên window --//
	this.f_add_windowobj_label( rpo_dw, lw_parent, ls_parent_classname)			
	disconnect using it_transaction;
	iw_display.dynamic event e_save()
	connect using it_transaction;
	t_w_mdi.ids_lang_text.settransobject(it_transaction )
	t_w_mdi.ids_lang_text.retrieve( gs_user_lang, gdb_industry_id)
end if
return 1
end function

public subroutine f_set_dwo_window ();
istr_dwo[1].s_dwo_default = 'd_label_vn_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_label_vn_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_label_foreign_grid'
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = false
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

on c_label_window.create
call super::create
end on

on c_label_window.destroy
call super::destroy
end on

event constructor;call super::constructor;
is_table = 'LABEL'
ib_changed_dwo_4edit = false
ib_keyboardlocked = true
is_display_model = '1tv_2d'
is_object_title = 'Dịch tên nhãn'
end event

event e_window_e_postopen;call super::e_window_e_postopen;
treeview				ltv_display
datawindow			ldw_focus
int						li_rtn

//-- load menu vao treeview --//
ltv_display = iw_display.dynamic f_get_tv()
if isvalid(ltv_display) then
	li_rtn = this.f_display_on_tv( ltv_display)
	ldw_focus = iw_display.dynamic f_get_dwmain()
	ldw_focus.dynamic event e_retrieve()
else
	return -1
end if

return 1
end event

event e_tv_selectionchanged;call super::e_tv_selectionchanged;
datawindow		ldw_handling
treeviewitem	l_tvi
long				ll_cur_hdl
string				ls_objectname


if isvalid(iw_display) then
	ldw_handling = iw_display.dynamic f_get_dwmain()
	if isvalid(ldw_handling) then
		iw_display.dynamic f_set_idwfocus(ldw_handling)
		ll_cur_hdl = rpo_tv.FindItem(CurrentTreeItem! , 0)			
		if ll_cur_hdl > 0 then
			rpo_tv.getitem(ll_cur_hdl, l_tvi)
			ic_label_tv = l_tvi.data
			ls_objectname = ic_label_tv.istr_tv.s_object						
			if ll_cur_hdl <> rpo_tv.FindItem(RootTreeItem! , 0) then		
				ls_objectname = mid(ls_objectname, 1, len(ls_objectname) -5)
				ldw_handling.setfilter( "match(code, '"+ ls_objectname +".')")
			else
				ldw_handling.setfilter( "not match(code, '^d_.+[\.].+$')" )
			end if
			ldw_handling.filter( )
			ldw_handling.event rowfocuschanged( 1)
		end if		
	else
		return -1
	end if
end if
return 1
end event

event e_dw_e_preretrieve;call super::e_dw_e_preretrieve;
treeview					ltv_handling
treeviewitem			l_tvi
c_sql						lc_sql
long						ll_cur_hdl
string						ls_currentSQL, ls_currentWhere, ls_modify, ls_rtn,ls_colname,ls_coltype,ls_where
c_dwservice				lc_dwservice

if rpo_dw.classname() = 'dw_1' then
	if not isvalid(iw_display) then return -1
	ltv_handling = iw_display.dynamic f_get_tv()
	if isvalid(ltv_handling) then
		ll_cur_hdl = ltv_handling.finditem( roottreeitem!, 0)
		if ll_cur_hdl = -1 then return -1
		ltv_handling.getitem( ll_cur_hdl, l_tvi)
		ic_label_tv = l_tvi.data
		//-- them dieu kien vao where --//
		if rpo_dw.dynamic f_getcurrentSQL( ls_currentSQL, ls_currentWhere) =1 then
			ls_colname = 'subcode'
			lc_dwservice.f_get_build_column( rpo_dw, ls_colname, ls_coltype)
			ls_where = ls_colname
			if ls_currentWhere <> '' then ls_currentWhere += ' AND '
			ls_currentWhere += +ls_where+"= ~~'" + ic_label_tv.istr_tv.s_object +"~~'"
			lc_sql.f_addtowhereclause( ls_currentSQL, ls_currentWhere, " AND ")
			ls_modify = "Datawindow.Table.Select= '" + ls_currentSQL +"'"
			ls_rtn =rpo_dw.modify(ls_modify )
		end if		
	else
		return -1
	end if
end if
return 0
end event

event e_window_e_refresh;call super::e_window_e_refresh;treeview			l_tv
datawindow		ldw_main
ldw_main = iw_display.dynamic f_get_dwmain()
this.f_load_label( ldw_main)
l_tv = iw_display.dynamic f_get_tv()
this.event e_tv_selectionchanged(l_tv)

return 1
end event

event e_window_open;call super::e_window_open;return 1
end event

