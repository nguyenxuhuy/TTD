$PBExportHeader$c_customer_pos.sru
forward
global type c_customer_pos from s_object_display
end type
end forward

global type c_customer_pos from s_object_display
end type
global c_customer_pos c_customer_pos

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_related ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_customer_pos_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_customer_pos_grid'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Khách hàng'
end subroutine

public subroutine f_set_actionpane ();
istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'

end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_unit_class'
istr_dwo_related[1].s_main_obj_dwo = 'd_uom_grid'
istr_dwo_related[1].s_main_obj_column = 'class_id'
istr_dwo_related[1].s_related_obj_dwo = 'd_unit_class_grid'
istr_dwo_related[1].s_related_obj_column = 'id'
istr_dwo_related[1].s_relatedtext_column = 'code;name'
istr_dwo_related[1].s_text = 'Lớp đơn vị của:'

istr_dwo_related[2].s_related_obj_name = 'u_unit_conversion'
istr_dwo_related[2].s_main_obj_dwo = 'd_uom_grid'
istr_dwo_related[2].s_main_obj_column = 'id'
istr_dwo_related[2].s_related_obj_dwo = 'd_unit_conversion_grid'
istr_dwo_related[2].s_related_obj_column = 'FROM_UNIT_ID'
istr_dwo_related[2].s_relatedtext_column = 'code;name'
istr_dwo_related[2].s_text = 'Quy đổi đơn vị của:'
end subroutine

on c_customer_pos.create
call super::create
end on

on c_customer_pos.destroy
call super::destroy
end on

event constructor;call super::constructor;
ib_changed_dwo_4edit = false
is_display_model = '1d'
ib_display_text = false
is_object_title = 'Khách hàng'

istr_actionpane[1].s_description = is_object_title
end event

event e_action_ctrl_e_postmodifyrow;//-- Override --//
return 0
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

event e_window_open;call super::e_window_open;
iw_display.event e_filteron_new( )
return  1
end event

event e_window_e_postopen;call super::e_window_e_postopen;
string				ls_first_colname
int					li_rtn
ls_first_colname =  iw_display.dw_filter.f_getfirstcolumn( true)
iw_display.f_set_idwfocus(  iw_display.dw_filter)
li_rtn = iw_display.idw_focus.setcolumn( ls_first_colname)
return li_rtn
end event

event e_window_e_refresh;call super::e_window_e_refresh;
if iw_display.dw_filter.getitemstring(1,'filter_string') <> ''  then
	iw_display.f_filter_dwmain_new( )
end if

return ancestorreturnvalue
end event

event e_dw_updatestart;call super::e_dw_updatestart;long		ll_modified_row
double	ldb_cust_id, ldb_age

if rdw_requester.modifiedcount( ) > 0 then	
	ll_modified_row = rdw_requester.GetNextModified(0, Primary!)
	do while ll_modified_row > 0 
		if rdw_requester.GetItemStatus (ll_modified_row, 0 , Primary!) = NewModified! then
			ldb_cust_id = rdw_requester.getitemnumber(ll_modified_row, 'ID')
			ldb_age = rdw_requester.getitemnumber(ll_modified_row, 'age')
			Insert into customer (ID    ,
										  OBJECT_REF_ID,
										  COMPANY_ID ,
										  BRANCH_ID  ,
										  age,
										  CREATED_BY ,
										  CREATED_DATE  ,
										  LAST_MDF_BY  ,
										  LAST_MDF_DATE )
			select seq_table_id.nextval, :ldb_cust_id, :gi_user_comp_id, :gdb_branch,:ldb_age, :gi_userid, sysdate, :gi_userid, sysdate from dual using it_transaction;
			
		end if
		ll_modified_row = rdw_requester.GetNextModified(ll_modified_row, Primary!)
	loop
end if

if rdw_requester.deletedcount( ) > 0 then	
	FOR ll_modified_row = 1 to rdw_requester.deletedcount( ) 
		ldb_cust_id = rdw_requester.getitemnumber(ll_modified_row, 'ID', Delete!, true)
		DELETE customer where object_ref_id = :ldb_cust_id  using it_transaction;
	NEXT
end if
return ancestorreturnvalue
end event

event e_dw_e_predelete;call super::e_dw_e_predelete;long			ll_cnt
double	ldb_cust_id

ldb_cust_id = rpo_dw.getitemnumber(vl_currentrow, 'ID')
if ldb_cust_id > 0 then 
	select count(id) into :ll_cnt from booked_slip where dr_cr_object = :ldb_cust_id and company_id = :gi_user_comp_id using it_transaction;
	if ll_cnt > 0 then
		gf_messagebox('m.c_customer_pos.e_dw_e_predelete.01','Thông báo','Khách đã có giao dịch không thể xoá', 'exclamation','ok',1)
		return -1
	end if
end if
return ancestorreturnvalue
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;
double		ldb_age, ldb_id
if vs_colname = 'age' then
	ldb_age = double(vs_editdata )
	ldb_id = rpo_dw.getitemnumber(vl_currentrow,'id')
	connect using it_transaction;
	Update customer 
	set age = :ldb_age
	where object_ref_id = :ldb_id using it_transaction;
	commit using it_transaction;
	disconnect using it_transaction;
end if
return ancestorreturnvalue
end event

