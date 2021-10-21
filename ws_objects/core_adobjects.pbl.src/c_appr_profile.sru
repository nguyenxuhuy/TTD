$PBExportHeader$c_appr_profile.sru
forward
global type c_appr_profile from s_object_display
end type
end forward

global type c_appr_profile from s_object_display
end type
global c_appr_profile c_appr_profile

forward prototypes
public subroutine f_set_dwo_window ()
public function integer f_insert_appr_profile (double vdb_doc_id, string vs_doc_table, double vdb_appr_assigned, integer vi_appr_level, ref t_ds_db rds_appr_profile)
public function integer f_insert_appr_profile (double vdb_doc_id, string vs_doc_table, ref t_ds_db rds_appr_profile, ref t_ds_db rds_appr_level)
public function integer f_update_appr_profile (t_ds_db vds_appr_profile, long vl_row, string vs_status, double vdb_user_id, double vdb_doc_id, datetime vdt_appr_date, string vs_type)
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_appr_profile_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_appr_profile_grid'
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = false
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = false
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Lược sử duyệt của: '
end subroutine

public function integer f_insert_appr_profile (double vdb_doc_id, string vs_doc_table, double vdb_appr_assigned, integer vi_appr_level, ref t_ds_db rds_appr_profile);int					li_rtn
long				ll_row
double			ldb_id
datetime			ldt_created
c_datetime		lc_dt

ll_row = rds_appr_profile.insertrow( 0)
ldb_id = this.f_create_id( )
ldt_created = lc_dt.f_getsysdate( )
li_rtn = rds_appr_profile.setitem( ll_row, 'ID', ldb_id)
if li_rtn = 1 then li_rtn = rds_appr_profile.setitem( ll_row, 'OBJECT_REF_ID', vdb_doc_id)
if li_rtn = 1 then li_rtn = rds_appr_profile.setitem( ll_row, 'OBJECT_REF_TABLE', vs_doc_table)
if li_rtn = 1 then li_rtn = rds_appr_profile.setitem( ll_row, 'STATUS', 'waiting')
if li_rtn = 1 then li_rtn = rds_appr_profile.setitem( ll_row, 'APPR_ASSIGNED', vdb_appr_assigned)
if li_rtn = 1 then li_rtn = rds_appr_profile.setitem( ll_row, 'APPR_LEVEL', vi_appr_level)
if li_rtn = 1 then li_rtn = rds_appr_profile.setitem( ll_row, 'CREATED_DATE', ldt_created)

return li_rtn

end function

public function integer f_insert_appr_profile (double vdb_doc_id, string vs_doc_table, ref t_ds_db rds_appr_profile, ref t_ds_db rds_appr_level);int					li_rtn,li_upperbound,li_idx,li_idx1,li_idx2
long				ll_row
string				ls_role_user_id,las_role_user_id[],ls_type_role_user_id
b_rule			lc_rule
c_string			lc_string
t_ds_db			lds_role_user

lds_role_user = create t_ds_db
lds_role_user.dataobject = 'd_role_assign_grid'
lds_role_user.f_settransobject( SQLCA)
ll_row = lds_role_user.retrieve( )
if ll_row = -1 then return -1
for li_idx = 1 to rds_appr_level.rowcount()
	ls_role_user_id = rds_appr_level.getitemstring( li_idx, 'APPLICABLE_REF_ID_STRING')
	li_upperbound = lc_string.f_stringtoarray( ls_role_user_id, ';', las_role_user_id[])
	if li_upperbound > 1 then
		//-- 1 cấp duyệt có nhiều người duyệt--//
		for li_idx1 = 1 to li_upperbound
			ls_type_role_user_id = lc_rule.f_get_type_role_user_id( double(las_role_user_id[li_idx1]))
			if ls_type_role_user_id = 'role' then
				lds_role_user.setfilter( "role_id = "+ las_role_user_id[li_idx1])
				lds_role_user.filter( )
				for li_idx2 = 1 to lds_role_user.rowcount( )
					li_rtn = this.f_insert_appr_profile(vdb_doc_id ,vs_doc_table,lds_role_user.getitemnumber(li_idx2, 'user_id') ,li_idx,rds_appr_profile)
					if li_rtn = -1 then exit
				next
			else
				li_rtn = this.f_insert_appr_profile( vdb_doc_id, vs_doc_table,double(las_role_user_id[li_idx1]), li_idx,rds_appr_profile)
			end if
			if li_rtn = -1 then exit
		next
	else
		ls_type_role_user_id = lc_rule.f_get_type_role_user_id( double(las_role_user_id[1]))
		if ls_type_role_user_id = 'role' then
			lds_role_user.setfilter( "role_id = "+ las_role_user_id[1])
			lds_role_user.filter( )
			for li_idx1 = 1 to lds_role_user.rowcount( )
				li_rtn = this.f_insert_appr_profile(vdb_doc_id ,vs_doc_table,lds_role_user.getitemnumber(li_idx1, 'user_id') ,li_idx,rds_appr_profile)
				if li_rtn = -1 then exit
			next
		else
			li_rtn = this.f_insert_appr_profile( vdb_doc_id, vs_doc_table,double(las_role_user_id[1]), li_idx,rds_appr_profile)
		end if
	end if
	if li_rtn = -1 then exit
next
destroy lds_role_user
return li_rtn
end function

public function integer f_update_appr_profile (t_ds_db vds_appr_profile, long vl_row, string vs_status, double vdb_user_id, double vdb_doc_id, datetime vdt_appr_date, string vs_type);string 	ls_status

if vs_status = 'rejected' or vs_status='req_change' then
	delete from APPR_PROFILE where object_ref_id = :vdb_doc_id using vds_appr_profile.it_transaction;
else
	ls_status = 'done'
	vds_appr_profile.setitem( vl_row, 'STATUS', vs_status)
	vds_appr_profile.setitem( vl_row, 'APPR_BY', vdb_user_id)
	vds_appr_profile.setitem( vl_row, 'APPR_DATE', vdt_appr_date)
	vds_appr_profile.setitem( vl_row, 'TYPE', vs_type)
	//-- update trạng thái của các dòng waiting cùng cấp duyệt --//
//	update APPR_PROFILE set status = :ls_status where object_ref_id = :vdb_doc_id and status <> :vs_status using vds_appr_profile.it_transaction;
end if
vds_appr_profile.f_set_ib_traceable(false)
return vds_appr_profile.update( )
end function

on c_appr_profile.create
call super::create
end on

on c_appr_profile.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'APPR_PROFILE'
ib_changed_dwo_4edit = false
is_display_model = '1d'
ib_display_text = true
is_object_title = 'Lược sử duyệt'

istr_actionpane[1].s_description = is_object_title
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
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify; b_saveclose;b_filteron;b_query;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_saveclose;b_filteron;b_query;b_refresh;b_delete;'
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_save;b_filteron;b_query; b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify;b_save;b_filteron;b_query; b_refresh;b_delete;'
					end if
				end if
			else				
				if  ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_close;'
				else
					istr_actionpane[li_idx].s_visible_buttons='b_close;'
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

event e_dw_e_preretrieve;call super::e_dw_e_preretrieve;string					ls_dwo,ls_columns,ls_dataobject
window				lw_parent
t_dw_mpl			ldw_main
any					la_arg[]

ls_dataobject = rpo_dw.dataobject
if mid(ls_dataobject,1,len(ls_dataobject)-5) = 'd_appr_profile' then
	lw_parent = iw_display.dynamic f_getparentwindow()
	ldw_main =lw_parent.dynamic f_get_dwmain()
	la_arg[1] = ldw_main.getitemnumber(ldw_main.getrow( ) , 'ID')
	ls_columns = 'object_ref_id'
	rpo_dw.dynamic f_add_where(ls_columns,la_arg)
end if
return 1
end event

event e_window_e_postopen;call super::e_window_e_postopen;	//--gán text cho form lược sử duyệt--//
	window 			lw_parent
	t_dw_mpl		ldw_main
	string 			ls_code_doc,ls_text_doc,ls_dataobject
	
	lw_parent = iw_display.dynamic f_getparentwindow()
	ldw_main = lw_parent.dynamic f_get_dwmain()
	ls_code_doc = ldw_main.getitemstring( ldw_main.getrow(), 'code')
	ls_dataobject = ldw_main.dataobject
	ls_dataobject = mid(ls_dataobject,1,len(ls_dataobject)-5)
	ls_text_doc = t_w_mdi.ids_lang_text.f_get_lang_text(ls_dataobject +'.code_t' )
	iw_display.dynamic f_set_st_1_text(istr_dwo[1].s_description ,ls_text_doc +' - '+ls_code_doc)
return 1
end event

