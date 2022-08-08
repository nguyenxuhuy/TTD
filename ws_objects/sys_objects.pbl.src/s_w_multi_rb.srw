$PBExportHeader$s_w_multi_rb.srw
forward
global type s_w_multi_rb from s_w_main
end type
type dw_2 from t_dw_mpl within s_w_multi_rb
end type
type tab_1 from t_t within s_w_multi_rb
end type
type tab_1 from t_t within s_w_multi_rb
end type
type dw_4 from t_dw_mpl within s_w_multi_rb
end type
type tv_1 from t_tv within s_w_multi_rb
end type
type dw_5 from t_dw_mpl within s_w_multi_rb
end type
type dw_6 from t_dw_mpl within s_w_multi_rb
end type
type ddlb_1 from t_ddlb within s_w_multi_rb
end type
type ddlb_2 from t_ddlb within s_w_multi_rb
end type
type cbx_1 from t_cbx within s_w_multi_rb
end type
type htb_1 from t_htb within s_w_multi_rb
end type
type cbx_2 from t_cbx within s_w_multi_rb
end type
type sle_1 from t_sle within s_w_multi_rb
end type
type st_2 from t_st within s_w_multi_rb
end type
type gb_2 from t_g_line within s_w_multi_rb
end type
type gb_1 from t_g_line within s_w_multi_rb
end type
type gb_3 from t_g_line within s_w_multi_rb
end type
type gb_4 from t_g_line within s_w_multi_rb
end type
type gb_5 from t_g_line within s_w_multi_rb
end type
type gb_6 from t_gb within s_w_multi_rb
end type
type gb_8 from t_gb within s_w_multi_rb
end type
type gb_9 from t_gb within s_w_multi_rb
end type
type gb_10 from t_g_line within s_w_multi_rb
end type
type gb_11 from t_g_line within s_w_multi_rb
end type
type gb_12 from t_gb within s_w_multi_rb
end type
type dw_1 from t_dw_mpl within s_w_multi_rb
end type
type gb_7 from t_gb within s_w_multi_rb
end type
type dw_3 from t_dw_mpl within s_w_multi_rb
end type
type rb_1 from t_rb within s_w_multi_rb
end type
type rb_2 from t_rb within s_w_multi_rb
end type
type rb_3 from t_rb within s_w_multi_rb
end type
end forward

global type s_w_multi_rb from s_w_main
boolean visible = true
integer width = 4293
integer height = 2456
event e_copy_to ( string vs_btn_name )
event e_copy_from ( string vs_btn_name )
event e_view ( string vs_btn_name )
event e_approve ( )
event e_appr_trace ( )
event e_total ( )
event e_send_2_approve ( )
event e_request_2_change ( )
event e_reject ( )
event e_post ( )
event e_unpost ( )
event e_note ( )
event e_account_view ( )
event e_copy_line ( string vs_btn_name )
event e_detail ( )
event e_savepost ( )
event type integer e_ledger_transfer ( )
event e_settlement ( )
event e_open_report ( string vs_object_name )
event e_cancel_settlement ( )
event e_fiscal_year ( )
event e_create_fiscal_year ( )
event e_lmousedown pbm_lbuttondown
event e_completed ( )
event e_lose ( )
event type integer e_copy_to_new ( string vs_btn_name )
event type integer e_save4close ( )
event type integer e_filteron_rb ( )
event type integer e_filterswitch_rb ( )
event e_open_related_object ( string vs_objname )
event type integer e_action ( string vs_action )
dw_2 dw_2
tab_1 tab_1
dw_4 dw_4
tv_1 tv_1
dw_5 dw_5
dw_6 dw_6
ddlb_1 ddlb_1
ddlb_2 ddlb_2
cbx_1 cbx_1
htb_1 htb_1
cbx_2 cbx_2
sle_1 sle_1
st_2 st_2
gb_2 gb_2
gb_1 gb_1
gb_3 gb_3
gb_4 gb_4
gb_5 gb_5
gb_6 gb_6
gb_8 gb_8
gb_9 gb_9
gb_10 gb_10
gb_11 gb_11
gb_12 gb_12
dw_1 dw_1
gb_7 gb_7
dw_3 dw_3
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
end type
global s_w_multi_rb s_w_multi_rb

type variables
int ii_redraw
boolean				ib_saving
b_callback			ib_callback
end variables

forward prototypes
public function tab f_get_tab_1 ()
public function datawindow f_get_dwmain ()
public function treeview f_get_tv ()
public function integer f_resize_up_1tv_fx3dfx_lo_tb ()
public subroutine f_set_invisible_ctrl ()
public subroutine f_set_visible_ctrl (string vs_display_model)
public function integer f_resize_2d ()
public function integer f_resize_1d_2d ()
public function integer f_resize_1d_1dup_2d ()
public function integer f_resize_1d_3d ()
public function integer f_resize_up_1d_lo_1d_2dgb ()
public subroutine f_set_visible_st_1 (boolean vb_visible)
public function integer f_resize_3d ()
public function integer f_resize_1tv_2d ()
public function integer f_resize_1tv_up1d_1d_lo1d ()
public function integer f_resize_2ddlb_1tv_up1d1d_mid1d1d_lo1d ()
public function dropdownlistbox f_get_ddlb1 ()
public function dropdownlistbox f_get_ddlb2 ()
public subroutine f_set_text_cbx_1 (string vs_text, boolean vb_checked)
public subroutine f_set_text_cbx_2 (string vs_text, boolean vb_checked)
public function integer f_resize_2ddlb_2d ()
public function integer f_resize_1d_1d ()
public function integer f_resize_1ddlb_1d_1tp ()
public subroutine f_set_st_1_text (string vs_text, string vs_dwo_name)
public function t_sle f_get_sle_1 ()
public function t_cbx f_get_cbx (string vs_idx)
public function t_htb f_get_htb ()
public function integer f_resize_1tv_up1d_1d_lo2d ()
public function integer f_resize_1tv_up1d_mid1d_lo1d1d ()
public function integer f_resize_6dgb ()
public function integer f_resize_5dgb ()
public function integer f_resize_4dgb ()
public function integer f_resize_up_1d_4d_lo_tb ()
public function groupbox f_get_groupbox (string vs_gb_name)
public function integer f_resize_6dgb_ext ()
public function integer f_resize_up_1d_lo_2d ()
public function integer f_update_userprofile ()
public subroutine f_resize_4dgb_1tp ()
public subroutine f_resize_2dgb_1tp ()
public function integer f_resize_up_1d_3d_lo_tb ()
public function integer f_resize_up_1d_lo_tb ()
public subroutine f_resize_5dgb_1tp ()
public function integer f_resize_1ddlb_2d_1tp ()
public function integer f_resize_1dg_2gb_2df ()
public subroutine f_resize_3d_1tp ()
public function t_rb f_get_ratiobutton (string vs_idx)
public function integer f_resize_3d_rb ()
public subroutine f_resize_2dgb_1tp_tax ()
public function integer f_resize_up_1d_lo_1d_1d ()
public function integer f_set_data_copied_line (t_ds_db vds_copied[], s_str_dwo_related vstr_dwo_related[], string ls_type_copy, string vs_obj_related, s_w_multi vw_f_copy)
public function integer f_resize_up_1d_1d_lo_tb ()
protected function integer f_set_data (t_ds_db vpo_from_copied, powerobject vpo_from_copied_master, ref datawindow rdw_to_copied, datawindow vdw_to_copied_master, string vas_obj_ref_id[], string vas_to_col[], string vas_from_col[], string vas_main_col_chk_sum[], string vas_related_col_chk_sum[], boolean vb_addrow, boolean vb_f_sum, string vas_col_sum[], powerobject vpo_dr_cr_object, string vas_col_dr_cr_object[], string vas_match_column[], string vas_match_f_column[], double vdb_t_doc_id, ref t_ds_db rds_matching, s_str_dwo_related vstr_dwo_related)
public function boolean f_exist_second_sob (double vdb_doc_id)
public function integer f_auto_approve (double vdb_doc_id)
public function boolean f_check_auto_appr (string vs_policy_type)
public subroutine f_resize_1dr_1tb_2gb_1ddlb_1dl ()
public function integer f_resize_1tv_up1d1d_mid1d1d_lo1d ()
public function integer f_resize_3dgb ()
public subroutine f_resize_2dgb_1tp_tax_2d ()
public function integer f_resize_1tp ()
public function integer f_resize_1ddlb_1d ()
public function t_dw_mpl f_get_dw (integer vi_index)
public subroutine f_resize_5dgb_1tp_1dh ()
public function integer f_resize_up_1d_2d_lo_tb ()
public function integer f_resize_up_2d1d_lo_1tb ()
public function integer f_resize_up_gp_1d2d1tv_lo_tb ()
public function integer f_resize_up_gp_2d1tv_lo_tb ()
public function integer f_resize_up_gp_2d_lo_tb ()
public subroutine f_resize_2dgb_1pc_1tp ()
public function integer f_get_data_copied (ref t_ds_db rds_copied[], ref s_str_dwo_related vstr_dwo_related[], string vs_type_copy, string vs_obj_related)
public function integer f_resize_1d ()
public function integer f_resize_up_gp_1d3d1tv_lo_tb ()
public function integer f_resize_2d_3rb ()
public function integer setredraw (boolean f)
public function integer f_resize_1d_1df_1df ()
public function t_dw_mpl f_get_dw (integer vi_tabpage_index, integer vi_dw_index)
public function integer f_get_data_copied_ex (ref t_ds_db rds_copied[], ref s_str_dwo_related vstr_dwo_related[], string vs_type_copy, string vs_obj_related)
public function integer f_set_data_copied_new (t_ds_db vds_copied[], s_str_dwo_related vstr_dwo_related[], string ls_type_copy, string vs_obj_related, s_w_multi_rb vw_t_copy)
public function integer f_set_data_copied (t_ds_db vds_copied[], s_str_dwo_related vstr_dwo_related[], string ls_type_copy, string vs_obj_related, s_w_multi_rb vw_f_copy)
public function integer f_ctrl_enable_button (t_dw_mpl vdw_focus)
public function integer f_filter_dwmain_new ()
public function integer f_filter_dwmain ()
public function integer f_resize_up_1d_lo_1d_tb ()
public function integer f_resize_1d3d ()
end prototypes

event e_copy_to(string vs_btn_name);s_str_dwo_related		lstr_related[], lstr_data_related[]
s_object_display		lpo_related
c_dwservice				lc_dwsr
t_dw_mpl				ldw_main
t_ds_db					lads_copied[]
t_t							ltab_action
s_tp_actionpane		ltp_actionpane_cur
string						ls_obj_name
long						ll_rtn,ll_find

ldw_main = this.f_get_dwmain( ) 
ic_obj_handling.dynamic f_get_dwo_related(lstr_related) 
ls_obj_name = mid(vs_btn_name,9,len(vs_btn_name))
if ls_obj_name = 'self' then
	ls_obj_name =ic_obj_handling.classname( )
else
	ls_obj_name = 'u_' + ls_obj_name 
end if
//if ic_obj_handling.f_chk_qty_matching(lstr_related) then
	ic_obj_handling.ib_copying = true 
	ic_obj_handling.is_copy_type = 'copyt'
	//get data de build where related
	ic_obj_handling.f_get_data_related(ls_obj_name, lstr_data_related[]) 
	if ic_obj_handling.classname( )=ls_obj_name then
		ll_find=ldw_main.find("gutter = 'Y'", 1, ldw_main.rowcount())
		if ll_find=0 then 
			gf_messagebox('m.s_w_multi.e_copy_to.01','Thông báo','Phải tích chọn phiếu cần nhân bản','exclamation','ok',1)
			ic_obj_handling.ib_copying = false
			return
		end if
	end if
	if this.f_get_data_copied( lads_copied,lstr_related,'copyt',ls_obj_name) > 0 then
		if ic_obj_handling.classname( )<>ls_obj_name then
			ic_obj_handling.ib_copying = false
			this.event e_create_related_object(ls_obj_name,lpo_related)
			//build where related
			this.f_build_data_related( lstr_data_related[])  //
			ll_rtn = lpo_related.event e_window( 'e_copy_to')
			if ll_rtn = -1 then
				messagebox('Lỗi','s_w_multi.e_copy_to(linrae:16)')
			elseif  ll_rtn = 1 then
				lpo_related.ib_copying = true
				lpo_related.f_create_actionpane( tab_action)
				ll_rtn = this.event e_change_object(lpo_related)
				if  ll_rtn = 1 then
					ic_obj_handling.ib_copying = true
					
					if this.f_set_data_copied( lads_copied,lstr_related,'copyt',ls_obj_name,this) = -1 then
//						close object
						lpo_related.f_close_object( ls_obj_name, lpo_related.ii_tp_index)
					else
			//			if lpo_related.f_insert_matching( lads_copied, lstr_related, lpo_related) = -1 then lpo_related.f_close_object( ls_obj_name, lpo_related.ii_tp_index)
					end if
					
				else
					//close object
					lpo_related.f_close_object( ls_obj_name, lpo_related.ii_tp_index)
				end if
			end if
			//set data cho dtuong related
			ic_obj_handling.f_set_data_related(lstr_data_related[]) 
		else // nhan ban
			 this.f_set_data_copied( lads_copied,lstr_related,'copyt',ls_obj_name,this)
			 ic_obj_handling.ib_copying = false
			 ic_obj_handling.ib_copy_tax = false
		end if
		//lpo_related.ib_copying = false
	else
		ic_obj_handling.ib_copying = false
	end if
//end if
ic_obj_handling.ib_copying = false
ic_obj_handling.event e_window_e_postcopy( )
ldw_main.f_filter_detail( )


end event

event e_copy_from(string vs_btn_name);int										li_rtn
string									ls_obj_name
double								ldb_trans_id
s_object_display					lpo_handing_copyf
s_str_actionpane					lstr_actionpane[]

ls_obj_name = mid(vs_btn_name,9,len(vs_btn_name))
if ls_obj_name = 'seft' then
	ls_obj_name =ic_obj_handling.classname( )
else
	ls_obj_name = 'u_' + ls_obj_name
end if

lpo_handing_copyf = create using ls_obj_name
lpo_handing_copyf.ib_copying = true
lstr_actionpane[1].s_dwo_action = 'd_action_edit'
lstr_actionpane[1].s_visible_buttons = 'b_refresh;b_query;b_filteron;b_okclose;b_close;'
lstr_actionpane[1].s_button_name =  'b_refresh;b_query;b_filteron;b_okclose;b_close;'
lstr_actionpane[1].s_objname_handling = lpo_handing_copyf.classname( )
lstr_actionpane[1].s_description = lpo_handing_copyf.is_object_title
lpo_handing_copyf.f_set_actionpane( lstr_actionpane)
if ic_obj_handling.classname( )<>ls_obj_name then
	li_rtn = ic_obj_handling.event e_window( 'e_copy_form')
else
	li_rtn=2
end if
if li_rtn >0 then ic_obj_handling.ib_copying = true
if li_rtn = -1 then
	messagebox('Lỗi','s_w_multi.e_copy_form(line:22)')
elseif li_rtn = 1 then //copy chứng từ
	ldb_trans_id=ic_obj_handling. dynamic f_get_idb_trans_id()
	lpo_handing_copyf. dynamic f_set_idb_trans_id(ldb_trans_id) //lay id giao dich de copy loc theo giao dich
	this.f_openchildwithparm( 's_w_multi_n_max', lpo_handing_copyf)
elseif li_rtn=2 then //dùng cho nhân bản,copy các đối tượng 
	this.f_openchildwithparm( 's_w_multi_n_max', lpo_handing_copyf)
end if
//ic_obj_handling.ib_copying = false

end event

event e_view(string vs_btn_name);s_object_display	lpo_related , lpo_handle
t_dw_mpl			ldw_focus 
c_string 				lc_string
s_str_dwo_related		lstr_data_related[], lstr_data_empty[]
s_str_actionpane		lstr_actionpane[]
s_str_dwo				lstr_dwo[]
b_view 				lb_view
string					ls_dwo_view


lb_view = create b_view
ls_dwo_view = lc_string.f_globalreplace( vs_btn_name, 'b_view_', 'dv_') + '_form'
if ic_obj_handling.f_get_data_related( ls_dwo_view, lstr_data_related[]) = 1 then
	//--Gán title cho phiếu in--//
	lb_view.f_get_istr_actionpane(lstr_actionpane)
	lstr_actionpane[1].s_description = lstr_data_related[1].s_text
	lb_view.f_set_istr_actionpane(lstr_actionpane)		
	//--Gán dwo main --//
	lb_view.f_get_dwo( lstr_dwo)
	lstr_dwo[1].s_dwo_default =  lstr_data_related[1].s_related_obj_dwo
	lstr_dwo[1].s_dwo_form = lstr_data_related[1].s_related_obj_dwo
	lstr_dwo[1].s_description =  lstr_data_related[1].s_text
	lb_view.f_set_dwo_structure(lstr_dwo )	
	lb_view.is_object_title =   lstr_data_related[1].s_text
	if ic_obj_handling.event e_window_e_view(lb_view, ls_dwo_view ) = -1 then return 
	 lstr_data_related[]=  lstr_data_empty[]
	ic_obj_handling.f_get_data_related(lb_view.f_get_main_dwo( ), lstr_data_related[])
	
	if this.f_build_data_related( lstr_data_related[]) = -1 then return
	lb_view.f_set_data_related(lstr_data_related[])			
	ic_obj_handling.event e_window_e_view( lb_view, ls_dwo_view)
	t_w_mdi.wf_open_sheet_doc(lb_view, 's_w_multi_rb')
else
	gf_messagebox('m.s_w_main.e_view.01','Thông báo','Không tìm thấy structure đối tượng liên quan theo dwo:@'+ls_dwo_view,'stop','ok',1)
	return 
end if	
return

end event

event e_approve();b_obj_instantiate lb_ins

//lb_ins.f_approved( idw_focus, ic_obj_handling, this)
/*
int						li_idx,li_appr_level
any					laa_data[]
long					ll_rtn,ll_row,ll_currentrow,ll_find,ll_find1
string					las_t_ref_table[],ls_doc_code,ls_status,ls_username,ls_doctype
double				ldb_doc_id,ladb_t_ref_id[],ldb_userid
datetime				ldt_sysdate
t_ds_db				lds_appr_profile
t_dw_mpl			ldw_document,ladw_details[]
c_datetime			lc_dt
t_transaction 		lt_transaction
c_appr_profile		lc_appr

if gi_userid = 0 then return
this.f_get_transaction( lt_transaction)
ldw_document = this.f_get_dwmain( )
lc_appr = create c_appr_profile
lds_appr_profile = create t_ds_db
lds_appr_profile.dataobject = 'ds_appr_profile_grid'
if pos(ldw_document.dataobject,'d_document') > 0 then
	ll_currentrow = ldw_document.find("gutter = 'Y'", 1, ldw_document.rowcount( ) )
	if ll_currentrow = 0 then ll_currentrow = ldw_document.getrow( )
	ls_doctype = ldw_document.getitemstring(ll_currentrow , 'doc_type')
	Do While ll_currentrow > 0
		ldb_doc_id = ldw_document.getitemnumber( ll_currentrow , 'ID')
		ls_doc_code = ldw_document.getitemstring( ll_currentrow , 'CODE')
		ldt_sysdate = lc_dt.f_getsysdate( )
		lds_appr_profile.dataobject = 'ds_appr_profile_grid'
		lds_appr_profile.f_settransobject(lt_transaction)
		laa_data[1] = ldb_doc_id
		lds_appr_profile.f_add_where( 'object_ref_id', laa_data[])
		ll_row = lds_appr_profile.event e_retrieve( )
		if ll_row = 0 then 
			gf_messagebox('m.s_w_multi.e_approve.03','Thông báo','Bạn không có quyền duyệt phiếu '+ldw_document.getitemstring(ll_currentrow, 'code'),'exclamation','ok',1)
			exit
		end if
		li_appr_level = lds_appr_profile.getitemnumber(ll_row,'appr_level')
		if li_appr_level > 1 then
			//--trường hợp cây duyệt--//
			ll_find = lds_appr_profile.find( "APPR_ASSIGNED ="+string(gi_userid),1, ll_row)
			if ll_find = 0 then
				ll_rtn = -1
				gf_messagebox('m.s_w_multi.e_approve.03','Thông báo','Bạn không có quyền duyệt phiếu '+ldw_document.getitemstring(ll_currentrow, 'code'),'exclamation','ok',1)
				exit
			end if
			li_appr_level = lds_appr_profile.getitemnumber(ll_find,'appr_level')
			if li_appr_level = 1 then //--duyệt cấp 1--//
				if lds_appr_profile.getitemstring( ll_find, 'status') = 'approved' then
					gf_messagebox('m.s_w_multi.e_approve.02','Thông báo','Phiếu '+ldw_document.getitemstring(ll_currentrow, 'code') + ' đã được duyệt cấp ' +string(li_appr_level),'exclamation','ok',1)
				else
					ll_rtn = lc_appr.f_update_appr_profile( lds_appr_profile,ll_find, 'approved', gi_userid,ldb_doc_id, ldt_sysdate,'normal')
				end if
			elseif li_appr_level > 1 then //--duyệt từ cấp 2 trở đi--//
				ll_find1 = lds_appr_profile.find( "status = 'approved' and appr_level = "+string(li_appr_level - 1),1, ll_row)
				if ll_find1 > 0 then
					ll_rtn = lc_appr.f_update_appr_profile( lds_appr_profile,ll_find, 'approved', gi_userid,ldb_doc_id, ldt_sysdate,'normal')
					if ll_rtn = 1 then
						//--nếu là cấp duyệt cuối thì cập nhật trạng thái--//
						if lds_appr_profile.getitemnumber( ll_find, 'APPR_LEVEL') = lds_appr_profile.getitemnumber(lds_appr_profile.rowcount( ), 'APPR_LEVEL') then
							ldw_document.setitem( ll_currentrow , 'status', 'approved')
							if ldw_document.describe("status_name.x") <> '!' then ldw_document.setitem( ldw_document.getrow(), 'status_name', 'Đã duyệt')
						end if
					end if
				else
					ldb_userid = lds_appr_profile.getitemnumber( ll_find - 1, 'APPR_ASSIGNED')
					select obj.name into :ls_username  
					from object obj join role_user rol on rol.object_staff = obj.id 
					where rol.id = :ldb_userid using SQLCA;
					gf_messagebox('m.s_w_multi.e_approve.01','Thông báo','Nhân viên : '+ls_username+ ' chưa duyệt','exclamation','ok',1)
					ll_rtn = 0
				end if
			end if
		elseif li_appr_level = 1 then
			ll_find = lds_appr_profile.find( "APPR_ASSIGNED ="+string(gi_userid),1, ll_row)
			if ll_find > 0 then
				ll_rtn = lc_appr.f_update_appr_profile( lds_appr_profile,ll_find, 'approved', gi_userid,ldb_doc_id, ldt_sysdate,'normal')
				if ll_rtn = 1 then
					ldw_document.setitem( ll_currentrow , 'status', 'approved')
					if ldw_document.describe("status_name.x") <> '!' then ldw_document.setitem( ldw_document.getrow(), 'status_name', 'Đã duyệt')
				end if
			else
				for li_idx = 1 to upperbound(g_user.idb_role_id)
					ll_find = lds_appr_profile.find( "APPR_ASSIGNED ="+string(g_user.idb_role_id[li_idx] ),1, ll_row)
					if ll_find > 0 then exit
				next
				if ll_find > 0 then
					ll_rtn = lc_appr.f_update_appr_profile( lds_appr_profile,ll_find, 'approved', gi_userid,ldb_doc_id, ldt_sysdate,'normal')
					if ll_rtn = 1 then
						ldw_document.setitem( ll_currentrow , 'status', 'approved')
						if ldw_document.describe("status_name.x") <> '!' then ldw_document.setitem( ldw_document.getrow(), 'status_name', 'Đã duyệt')
					end if
				else
					ll_rtn = -1
					gf_messagebox('m.s_w_multi.e_approve.03','Thông báo','Bạn không có quyền duyệt phiếu '+ldw_document.getitemstring(ll_currentrow, 'code'),'exclamation','ok',1)
					exit
				end if
			end if
		end if
		if ll_rtn = 1 then
			ll_currentrow = ldw_document.find("gutter = 'Y'", ll_currentrow+1, ldw_document.rowcount( )+1 )
		else
			ll_currentrow = 0
		end if
	Loop
	if ll_rtn = 1 then
		ll_rtn = ldw_document.update(true,false )
		if ll_rtn = 1 then
			
			//-- Cập nhật trạng thái chứng từ liên quan --//
			if ic_obj_handling.event e_statuschanged( 'approved', ldb_doc_id, ls_doctype, true) = -1 then
				Rollback using it_transaction;
				ldw_document.event e_refresh( )
				gf_messagebox('m.s_w_multi.e_approve.04','Thông báo','Không cập nhật được trạng thái chứng từ liên quan','exclamation','ok',1)
				return
			end if
			
			ldw_document.resetupdate( )
			commit using lt_transaction;
			gf_messagebox('m.s_w_multi.e_approve.03','Thông báo','Duyệt thành công','exclamation','ok',1)
			ll_currentrow = ldw_document.find( "ID = " + string(ldb_doc_id), 1, ldw_document.rowcount())
			ldw_document.scrolltorow( ll_currentrow)				
		else
			Rollback using lt_transaction;
			messagebox('Lỗi','s_w_multi.e_approve(line:69)')
		end if
	end if
end if
destroy lds_appr_profile
destroy lc_appr
ic_obj_handling.event e_window_e_approved( )
ic_obj_handling.f_ctrl_actionbuttons( idw_focus)
this.event e_display_actionbutton( )
*/
end event

event e_appr_trace();this.dynamic f_openchildwithparm('s_w_multi_n','c_appr_profile;0')
end event

event e_total();string				ls_obj_name
c_string			lc_string

ls_obj_name = lc_string.f_globalreplace( 'b_total' + mid(ic_obj_handling.classname( ),2,len(ic_obj_handling.classname( ))) , 'b_', 'u_')
this.f_openchildwithparm('s_w_multi_n',ls_obj_name +';0')
end event

event e_send_2_approve();b_obj_instantiate		lb_ins

//lb_ins.f_send_2_approve( idw_focus, ic_obj_handling, this)

/*
int								li_idx,li_row,li_idx1,li_upperbound,li_rtn
any							laa_data[]
long							ll_rtn,ll_currentrow
string							ls_identify_code,ls_type_role_user_id,ls_updatetable,ls_role_user_id,las_role_user_id[]
double						ldb_identify_id,ldb_business_id,ldb_role_user_id,ldb_doc_id
b_rule						lc_rule
c_string						lc_string
t_ds_db						lds_appr_level,lds_appr_profile
t_dw_mpl					ldw_document
t_transaction 				lt_transaction
c_appr_profile				lc_appr
c_identification_initial		lc_iden_ini

if gi_userid = 0 then return
this.f_get_transaction( lt_transaction)
ldw_document = this.f_get_dwmain( )
lc_appr = create c_appr_profile
if pos(ldw_document.dataobject,'d_document') > 0 then
	ll_currentrow = ldw_document.getrow( )
	ldb_doc_id = ldw_document.getitemnumber( ll_currentrow , 'ID')
	ls_updatetable = ldw_document.describe( "DataWindow.Table.UpdateTable")
	lds_appr_profile = create t_ds_db
	lds_appr_profile.dataobject = 'ds_appr_profile_grid'
	lds_appr_profile.f_settransobject( lt_transaction)
	lds_appr_level = create t_ds_db
	lds_appr_level.dataobject = 'ds_appr_level'
	lds_appr_level.f_settransobject(lt_transaction)
	ls_identify_code = ic_obj_handling.classname( ) +'.'+ 'd_action_edit' +'.'+lc_string.f_globalreplace('e_approve', 'e_', 'b_')
	ldb_identify_id = lc_iden_ini.f_get_id( ls_identify_code)
	if ldb_identify_id > 0 then
		ldb_business_id = lc_rule.f_get_business_rule_id( ldb_identify_id,this)
		if ldb_business_id > 0 then
			ldb_role_user_id = lc_rule.f_get_role_user_id( ldb_business_id)
			if ldb_role_user_id > 0 then
				ls_type_role_user_id = lc_rule.f_get_type_role_user_id( ldb_role_user_id)
				if not isnull(ls_type_role_user_id) then
					if ls_type_role_user_id = 'appr' then
						//--Duyệt nhiều cấp--//
						laa_data[1] = ldb_role_user_id
						lds_appr_level.f_add_where( 'object_ref_id',laa_data[] )
						li_row = lds_appr_level.retrieve( )
						if li_row = -1 then return
						ll_rtn = lc_appr.f_insert_appr_profile(ldb_doc_id,ls_updatetable,lds_appr_profile, lds_appr_level)
					else
						ll_rtn = lc_appr.f_insert_appr_profile( ldb_doc_id, ls_updatetable,ldb_role_user_id, 1,lds_appr_profile)
					end if
					if ll_rtn = 1 then
						ll_rtn = lds_appr_profile.update(true,false )
						if ll_rtn = 1 then
							lds_appr_profile.resetupdate( )
							ldw_document.setitem( ldw_document.getrow( ) , 'status', 'req_approve')
							if ldw_document.describe("status_name.x") <> '!' then ldw_document.setitem( ldw_document.getrow(), 'status_name', 'Yêu cầu duyệt')
						else
							messagebox('Lỗi','s_w_multi.e_sent_2_approve(line:57)')
						end if
					end if
				else
					ll_rtn = -1
				end if
			else
				ll_rtn = -1
			end if
		else
			ll_rtn = -1
		end if
	else
		ll_rtn = -1
	end if
	if ll_rtn = 1 then
		ll_rtn = ldw_document.update(true,false )	
		if ll_rtn = 1 then
			//--cảnh báo hàng đã đặt bán hết nếu có--//
			ll_rtn = ic_obj_handling.event e_window_e_send_2_approve( )
			if ll_rtn = -1 then
				Rollback using lt_transaction;
			else
				ldw_document.resetupdate( )
				commit using lt_transaction;
			end if
		else
			messagebox('Lỗi','s_w_multi.e_sent_2_approve(line:80)')
		end if
	end if
end if
if ll_rtn = -1 then
	Rollback using lt_transaction;
end if
destroy lds_appr_profile
destroy lds_appr_level
destroy lc_appr
//ldw_document.scrolltorow( ll_currentrow)
if ll_rtn <> -1 then
	if ic_obj_handling.f_is_auto_appr( ) then this.f_auto_approve(ldb_doc_id )
	ic_obj_handling.f_ctrl_actionbuttons( idw_focus)
	this.event e_display_actionbutton( )
end if
*/
end event

event e_request_2_change();int						li_idx
any					laa_data[]
long					ll_rtn,ll_row,ll_currentrow
string					las_t_ref_table[],ls_t_doc_code,ls_doc_code,ls_doctype
double				ldb_doc_id,ldb_user_id,ladb_t_ref_id[]
datetime				ldt_sysdate
t_ds_db				lds_appr_profile
t_dw_mpl			ldw_document,ladw_details[]
c_datetime			lc_dt
c_dwservice		lc_dwsr
t_transaction 		lt_transaction
c_appr_profile		lc_appr

if gi_userid = 0 then return
this.f_get_transaction( lt_transaction)
ldw_document = this.f_get_dwmain( )
lc_appr = create c_appr_profile
if pos(ldw_document.dataobject,'d_document') > 0 then
	ll_currentrow = ldw_document.getrow( )
	ldb_doc_id = ldw_document.getitemnumber( ll_currentrow , 'ID')
	ls_doc_code = ldw_document.getitemstring( ll_currentrow , 'CODE')
	ls_doctype = ldw_document.getitemstring(ll_currentrow , 'doc_type')
	ldt_sysdate = lc_dt.f_getsysdate( )
	lds_appr_profile = create t_ds_db
	lds_appr_profile.dataobject = 'ds_appr_profile_grid'
	lds_appr_profile.f_settransobject(lt_transaction)
	laa_data[1] = ldb_doc_id
	if ic_obj_handling.dynamic f_is_matching(ldb_doc_id,ladb_t_ref_id,las_t_ref_table) then
		ls_t_doc_code = ic_obj_handling.f_get_code( ladb_t_ref_id[upperbound(ladb_t_ref_id)] )
		gf_messagebox('m.s_w_multi.e_approve.01','Thông báo','Phiếu '+ls_doc_code+' đã kết với '+ls_t_doc_code+' ,không được yêu cầu sửa','exclamation','ok',1)
	else
		lds_appr_profile.f_add_where( 'object_ref_id', laa_data[])
		ll_row = lds_appr_profile.event e_retrieve( )
//		if ll_row > 1 then
			//--trường hợp cây duyệt--//
//		elseif ll_row = 1 then
//			setnull(ldb_user_id)
//			setnull(ldt_sysdate)
			ll_rtn = lc_appr.f_update_appr_profile( lds_appr_profile,ll_row, 'req_change',ldb_user_id ,ldb_doc_id,ldt_sysdate,'')
			if ll_rtn = 1 then
				ldw_document.f_getdwdetails( ladw_details[])
				for li_idx = 1 to upperbound(ladw_details[]) 
					ll_rtn = lc_dwsr.f_copy_version( ladw_details[li_idx],lt_transaction)
					if ll_rtn = -1 then exit
				next
				if ll_rtn = 1 then
					ldw_document.setitem( ldw_document.getrow() , 'status', 'req_change')
					if ldw_document.describe("status_name.x") <> '!' then ldw_document.setitem( ldw_document.getrow(), 'status_name', 'Yêu cầu sửa')
				end if
			end if
//		end if
	end if
	if ll_rtn = 1 then
		ll_rtn = ldw_document.update(true,false )
		if ll_rtn = 1 then
			
			//-- Cập nhật trạng thái chứng từ liên quan --//
			if ic_obj_handling.event e_statuschanged( 'req_change', ldb_doc_id, ls_doctype, true) = -1 then
				Rollback using it_transaction;
				ldw_document.event e_refresh( )
				gf_messagebox('m.s_w_multi.e_approve.04','Thông báo','Không cập nhật được trạng thái chứng từ liên quan','exclamation','ok',1)
				return
			end if
			
			ldw_document.resetupdate( )
			commit using lt_transaction;
			ll_currentrow = ldw_document.find( "ID = " + string(ldb_doc_id), 1, ldw_document.rowcount())
			ldw_document.scrolltorow( ll_currentrow)						
		else
			Rollback using lt_transaction;
			messagebox('Lỗi','s_w_multi.e_request_2_change(line:61)')
		end if
	end if
end if
destroy lds_appr_profile
destroy lc_appr
ic_obj_handling.event e_window_e_request_2_change( )
ic_obj_handling.f_ctrl_actionbuttons( idw_focus)
this.event e_display_actionbutton( )
end event

event e_reject();b_obj_instantiate	lb_ins

//lb_ins.f_reject( idw_focus,ic_obj_handling , this)
/*
int						li_idx
any					laa_data[]
long					ll_rtn,ll_row,ll_currentrow
string					las_t_ref_table[],ls_doc_code
double				ldb_doc_id,ldb_user_id,ladb_t_ref_id[]
datetime				ldt_sysdate
t_ds_db				lds_appr_profile
t_dw_mpl			ldw_document
c_datetime			lc_dt
t_transaction 		lt_transaction
c_appr_profile		lc_appr

if gi_userid = 0 then return
this.f_get_transaction( lt_transaction)
ldw_document = this.f_get_dwmain( )
lc_appr = create c_appr_profile
if pos(ldw_document.dataobject,'d_document') > 0 then
	ll_currentrow = ldw_document.getrow( )
	ldb_doc_id = ldw_document.getitemnumber( ll_currentrow , 'ID')
	ls_doc_code = ldw_document.getitemstring( ll_currentrow , 'CODE')
	ldt_sysdate = lc_dt.f_getsysdate( )
	lds_appr_profile = create t_ds_db
	lds_appr_profile.dataobject = 'ds_appr_profile_grid'
	lds_appr_profile.f_settransobject(lt_transaction)
	laa_data[1] = ldb_doc_id
	lds_appr_profile.f_add_where( 'object_ref_id', laa_data[])
	ll_row = lds_appr_profile.event e_retrieve( )
	ll_rtn = lc_appr.f_update_appr_profile( lds_appr_profile,ll_row, 'rejected', gi_userid,ldb_doc_id, ldt_sysdate,'') 
	if ll_rtn =1 then
		ldw_document.setitem( ldw_document.getrow() , 'status', 'rejected')
		if ldw_document.describe("status_name.x") <> '!' then ldw_document.setitem( ldw_document.getrow(), 'status_name', 'Trả duyệt')
	end if
	if ll_rtn = 1 then
		ll_rtn = ldw_document.update(true,false )
		if ll_rtn = 1 then
			ldw_document.resetupdate( )
			commit using lt_transaction;
			ll_currentrow = ldw_document.find( "ID = " + string(ldb_doc_id), 1, ldw_document.rowcount())
			ldw_document.scrolltorow( ll_currentrow)									
		else
			Rollback using lt_transaction;
			messagebox('Lỗi','s_w_multi.e_reject(line:38)')
		end if
	end if
	
end if
destroy lds_appr_profile
destroy lc_appr
ic_obj_handling.event e_window_e_reject( )
ic_obj_handling.f_ctrl_actionbuttons( idw_focus)
this.event e_display_actionbutton( )
*/
end event

event e_post();int						li_cnt
long					ll_select_row
string					ls_hdr, ls_err, ls_server, ls_login, ls_pwd, ls_docs,  ls_qty_yn,ls_value_yn,  ls_ts_qty, ls_ts_value
boolean				lb_multi_post
double				ldb_doc_id, ldb_trans_hdr_id
date					ld_sysdate, ld_trans_date
errorReturn        		lret_rc
b_multithread			lb_multithread_post
t_dw_mpl				ldw_main
b_obj_instantiate		lbo_instance
s_str_ds_4_posting	lstr_ds_4_posting
s_str_streamvalue		lastr_streamvalue[]

connect using it_transaction;    
select trunc(sysdate)  into :ld_sysdate from dual using it_transaction;

ldw_main = this.f_get_dwmain()			
if ldw_main.getrow( ) > 0 then
	setpointer(hourglass!)
	
	ll_select_row = ldw_main.find( " gutter = 'Y'", 1 , ldw_main.rowcount( ) )
	if ll_select_row > 0 then //-- Ghi sổ nhiếu phiếu --//	
		Do while ll_select_row > 0
			ldb_doc_id = ldw_main.getitemnumber( ll_select_row, 'ID')
			ld_trans_date = date(ldw_main.getitemdatetime( ll_select_row, 'trans_date'))
			ldb_trans_hdr_id = ldw_main.getitemnumber( ll_select_row, 'trans_hdr_id')
			
			if ld_trans_date > ld_sysdate then
				if gf_messagebox('m.s_w_multi.e_post.11', 'Thông báo','Ngày ghi sổ ' + string(ld_trans_date) + ' lớn hơn ngày hệ thống '+string(ld_sysdate)+'. @' + ' Bạn có muốn tiếp tục ghi sổ không','question','yesno',2) = 2 then
					return 
				end if
			end if
			if ldb_trans_hdr_id = 0 or isnull(ldb_trans_hdr_id) then	
				gf_messagebox('m.s_w_multi.e_post.01','Thông báo','Chứng từ chưa có giao dịch','exclamation','ok',1)
				return
			end if	
			
			if lbo_instance.f_get_doc_qty_and_value_yn(ldb_doc_id, ls_qty_yn,ls_value_yn, it_transaction) <> 1 then
				gf_messagebox('m.s_w_multi.e_post.02','Thông báo','Phải lưu chứng từ trước khi ghi sổ','exclamation','ok',1)
				return
			end if
			//-- kiểm tra đóng kỳ kế toán --//
			if ls_qty_yn = 'Y' then
				if lbo_instance.f_is_period_closed_ex(  'inventory', ld_trans_date,'normal', it_transaction) then
					gf_messagebox('m.s_w_multi.e_post.03','Thông báo','Đã đóng kỳ kho hoặc chưa tạo kỳ kế toán nên không thể ghi sổ','exclamation','ok',1)
					return 
				end if
				if lbo_instance.f_is_period_closed_ex(  'inventory_count', ld_trans_date,'normal', it_transaction) then
					gf_messagebox('m.s_w_multi.e_post.031','Thông báo','Ngày ghi sổ điều chỉnh số lượng không được trước ngày kiểm kê sau cùng','exclamation','ok',1)
					return 
				end if
				if lbo_instance.f_is_period_closed_ex(  'inventory_close', ld_trans_date,'normal', it_transaction) then
					gf_messagebox('m.s_w_multi.e_post.032','Thông báo','Ngày ghi sổ điều chỉnh số lượng không được trước ngày kiểm kê đóng kỳ kho sau cùng','exclamation','ok',1)
					return 
				end if
			end if
			if ls_value_yn = 'Y' then
				if lbo_instance.f_is_period_closed_ex(  'finance', ld_trans_date,'normal', it_transaction) then
					gf_messagebox('m.s_w_multi.e_post.04','Thông báo','Đã đóng kỳ hoặc chưa tạo kỳ kế toán nên không thể ghi sổ','exclamation','ok',1)
					return 
				end if		
			end if	
			
			//-- kiểm tra chứng từ đã được ghi sổ bởi user khác --//			
			if upper(lbo_instance.f_get_doc_status(ldb_doc_id, it_transaction)) = 'BOOKED' then
				gf_messagebox('m.s_w_multi.e_post.05','Thông báo','Chứng từ đã được ghi sổ bởi người khác! Vui lòng bấm nút nạp lại dữ liệu','exclamation','ok',1)
				return
			end if
		
			if ls_qty_yn = 'N' and ls_value_yn = 'N' then
				gf_messagebox('m.s_w_multi.e_post.06','Thông báo','Chứng từ chưa chọn ghi sổ giá trị hoặc số lượng','exclamation','ok',1)	
				return		
			end if
			
			//-- Kiểm tra tick chọn ghi sổ giá trị và sl có trùng với cài đặt ghi sổ hay không? --//
			if lbo_instance.f_get_qty_and_value_yn_ex(ldb_trans_hdr_id, ls_ts_qty, ls_ts_value, it_transaction) = -1 then 
				gf_messagebox('m.s_w_multi.e_post.07','Thông báo','Cài đặt giao dịch bị lỗi ','stop','ok',1)
				return
			end if
			//-- Ghi sổ giá trị --//
			if ls_ts_value <> ls_value_yn then
				gf_messagebox('m.s_w_multi.e_post.08','Thông báo','Ghi sổ GIÁ TRỊ không đúng với cài đặt giao dịch! Cần chọn giao dịch khác, hoặc thay đổi cài đặt','stop','ok',1)
				return			
			end if
			//-- Ghi sổ số lượng --//
			if ls_ts_qty <> ls_qty_yn then
				gf_messagebox('m.s_w_multi.e_post.10','Thông báo','Ghi sổ SỐ LƯỢNG không đúng với cài đặt giao dịch!  Cần chọn giao dịch khác, hoặc thay đổi cài đặt','stop','ok',1)
				return			
			end if
			
			if ls_docs <> '' then ls_docs+= ','
			ls_docs += string(ldb_doc_id)
			update document set status = 'booking' where id = :ldb_doc_id using  it_transaction;
			
			ll_select_row = ldw_main.find( " gutter = 'Y'", ll_select_row + 1 , ldw_main.rowcount( )+1 )						
		loop
		lb_multi_post = true
	else           
		ldb_doc_id = ldw_main.getitemnumber( ldw_main.getrow(), 'ID')
		ld_trans_date = date(ldw_main.getitemdatetime(  ldw_main.getrow(), 'trans_date'))
		ldb_trans_hdr_id = ldw_main.getitemnumber(  ldw_main.getrow(), 'trans_hdr_id')
		
		if ld_trans_date > ld_sysdate then
			if gf_messagebox('m.s_w_multi.e_post.11', 'Thông báo','Ngày ghi sổ ' + string(ld_trans_date) + ' lớn hơn ngày hệ thống '+string(ld_sysdate)+'. @' + ' Bạn có muốn tiếp tục ghi sổ không','question','yesno',2) = 2 then
				return 
			end if
		end if
		
		if ldb_trans_hdr_id = 0 or isnull(ldb_trans_hdr_id) then	
			gf_messagebox('m.s_w_multi.e_post.01','Thông báo','Chứng từ chưa có giao dịch','exclamation','ok',1)
			return
		end if	
		
		if lbo_instance.f_get_doc_qty_and_value_yn(ldb_doc_id, ls_qty_yn,ls_value_yn, it_transaction) <> 1 then
			gf_messagebox('m.s_w_multi.e_post.02','Thông báo','Phải lưu chứng từ trước khi ghi sổ','exclamation','ok',1)
			return
		end if
		//-- kiểm tra đóng kỳ kế toán --//
		if ls_qty_yn = 'Y' then
			if lbo_instance.f_is_period_closed_ex(  'inventory', ld_trans_date,'normal', it_transaction) then
				gf_messagebox('m.s_w_multi.e_post.03','Thông báo','Đã đóng kỳ kho hoặc chưa tạo kỳ kế toán nên không thể ghi sổ','exclamation','ok',1)
				return 
			end if
			if lbo_instance.f_is_period_closed_ex(  'inventory_count', ld_trans_date,'normal', it_transaction) then
				gf_messagebox('m.s_w_multi.e_post.031','Thông báo','Ngày ghi sổ điều chỉnh số lượng không được trước ngày kiểm kê sau cùng','exclamation','ok',1)
				return 
			end if
			if lbo_instance.f_is_period_closed_ex(  'inventory_close', ld_trans_date,'normal', it_transaction) then
				gf_messagebox('m.s_w_multi.e_post.032','Thông báo','Ngày ghi sổ điều chỉnh số lượng không được trước ngày kiểm kê đóng kỳ kho sau cùng','exclamation','ok',1)
				return 
			end if
		end if
		if ls_value_yn = 'Y' then
			if lbo_instance.f_is_period_closed_ex(  'finance', ld_trans_date,'normal', it_transaction) then
				gf_messagebox('m.s_w_multi.e_post.04','Thông báo','Đã đóng kỳ hoặc chưa tạo kỳ kế toán nên không thể ghi sổ','exclamation','ok',1)
				return 
			end if		
		end if	
		
		//-- kiểm tra chứng từ đã được ghi sổ bởi user khác --//			
		if upper(lbo_instance.f_get_doc_status(ldb_doc_id, it_transaction)) = 'BOOKED' then
			gf_messagebox('m.s_w_multi.e_post.05','Thông báo','Chứng từ đã được ghi sổ bởi người khác! Vui lòng bấm nút nạp lại dữ liệu','exclamation','ok',1)
			return
		end if
	
		if ls_qty_yn = 'N' and ls_value_yn = 'N' then
			gf_messagebox('m.s_w_multi.e_post.06','Thông báo','Chứng từ chưa chọn ghi sổ giá trị hoặc số lượng','exclamation','ok',1)	
			return		
		end if
		
		//-- Kiểm tra tick chọn ghi sổ giá trị và sl có trùng với cài đặt ghi sổ hay không? --//
		if lbo_instance.f_get_qty_and_value_yn_ex(ldb_trans_hdr_id, ls_ts_qty, ls_ts_value, it_transaction) = -1 then 
			gf_messagebox('m.s_w_multi.e_post.07','Thông báo','Cài đặt giao dịch bị lỗi ','stop','ok',1)
			return
		end if
		//-- Ghi sổ giá trị --//
		if ls_ts_value <> ls_value_yn then
			gf_messagebox('m.s_w_multi.e_post.08','Thông báo','Ghi sổ GIÁ TRỊ không đúng với cài đặt giao dịch! Cần chọn giao dịch khác, hoặc thay đổi cài đặt','stop','ok',1)
			return			
		end if
		//-- Ghi sổ số lượng --//
		if ls_ts_qty <> ls_qty_yn then
			gf_messagebox('m.s_w_multi.e_post.10','Thông báo','Ghi sổ SỐ LƯỢNG không đúng với cài đặt giao dịch!  Cần chọn giao dịch khác, hoặc thay đổi cài đặt','stop','ok',1)
			return			
		end if
		
		ls_docs += string(ldb_doc_id)
		update document set status = 'booking' where id = :ldb_doc_id using  it_transaction;
	end if
	commit using it_transaction;
	
	ls_server = it_transaction.servername
	ls_login = it_transaction.logid
	ls_pwd = it_transaction.logpass
	if pos(ls_docs, ',')>0 then ls_docs = '('+ls_docs+')'
	ic_obj_handling.f_get_str_streamvalue( lastr_streamvalue[])
	ic_obj_handling.dynamic f_get_ds_4_posting(lstr_ds_4_posting)
	
	// The multi-threaded AutoRpts object has been created.    
	lb_multithread_post = create b_multithread
/*   //-- khoá debug--//
	lret_rc = SharedObjectGet("doc_post"+string(li_cnt), lb_multithread_post)    
	DO while (lret_rc = SUCCESS!)
		li_cnt ++
		lret_rc = SharedObjectGet("doc_post"+string(li_cnt), lb_multithread_post)    
	loop				
	IF (lret_rc <> SUCCESS!) THEN					
		// Multi-threaded invocation
		lret_rc = SharedObjectRegister ('b_multithread', 'doc_post'+string(li_cnt) )
		IF (lret_rc = SUCCESS!) THEN						
			lret_rc = SharedObjectGet ("doc_post"+string(li_cnt), lb_multithread_post)     
			IF (lret_rc = SUCCESS!) THEN		
				*/  //-- khoá debug--//

				lb_multithread_post.F_post(ls_server ,ls_login,ls_pwd  , gi_user_comp_id , gdb_branch , gi_userid , gs_sob, ldw_main.dataobject, ls_docs, lastr_streamvalue[], lstr_ds_4_posting )
//				lb_multithread_post.post F_post(ls_server ,ls_login,ls_pwd  , gi_user_comp_id , gdb_branch , gi_userid , gs_sob, ldw_main.dataobject, ls_docs, lastr_streamvalue[], lstr_ds_4_posting )

/*   //-- khoá debug--//
				//-- sau khi post xong --//
				SharedobjectUnregister("doc_post"+string(li_cnt))							
			elseIF (lret_rc <> SUCCESS!) THEN
				ls_hdr = "Error Accessing b_multithread"
				ls_err = "An error occurred while getting a pointer to the multi-threaded object ~"b_multithread~". ~r~n~r~n"
				IF (lret_rc = SharedObjectCreateInstanceError!) THEN
					ls_err = ls_err + "SharedObjectCreateInstanceError! - The local reference to the shared object could not be created."
				ELSEIF (lret_rc = SharedObjectNotExistsError!) THEN
					ls_err = ls_err + "SharedObjectNotExistsError! - The instance name has not been registered."
				END IF			
			end if
		else
			  ls_hdr = "Error Creating b_multithread"
			  ls_err = "An error occurred attempting to create the multi-threaded object ~"b_multithread~". ~r~n~r~n"
			  
			  CHOOSE CASE lret_rc
					CASE SharedObjectExistsError!
						  ls_err = ls_err + "SharedObjectExistsError! - The instance name has already been used."
					CASE SharedObjectCreateInstanceError!
						  ls_err = ls_err + "SharedObjectCreateInstanceError! - The object could not be created."
					CASE SharedObjectCreatePBSessionError!
						  ls_err = ls_err + "SharedObjectCreatePBSessionError! - The shared object session could not be created."
					CASE ELSE
			  END CHOOSE       						
		end if
		IF (ls_err <> "") THEN
			messagebox('ERROR', ls_err )
		END IF					
	end if 
	*/   //-- khoá debug--//
	
end if

//ic_obj_handling.f_ctrl_actionbuttons( idw_focus)
/*
//--Ghi sổ phụ--//
if ic_obj_handling.dynamic f_booking_sob(ldb_doc_id, ldb_trans_hdr_id, ls_doctype) = -1 then
	return 
end if
//rettrieve cac dw post_line
if ls_value_yn = 'Y' then ic_obj_handling.dynamic f_retrieve_dw_post_line() */
//this.event e_display_actionbutton( )
//ls_post_message_yn = lbo_instance.f_get_post_message_yn(ls_doctype,ldb_trans_hdr_id)
//if ls_post_message_yn = 'Y' then
//	gf_messagebox('m.s_w_multi.e_post.16','Thông báo','Ghi sổ thành công!','exclamation','ok',1)
//end if	
disconnect using it_transaction;
this.event e_refresh( )
destroy b_multithread
RETURN 


end event

event e_unpost();int						li_cnt
long 					ll_rtn, li_idx, ll_currentrow, ll_select_row
double				ldb_doc_id, ldb_trans_hdr_id
string					ls_qty_yn,ls_value_yn, ls_unpost_message_yn, ls_doctype,ls_doc_status,ls_status, ls_docs, ls_err, ls_hdr
string					ls_server, ls_login, ls_pwd
//string					ls_server,ls_login,ls_pwd
date					ld_trans_date
//c_dwservice 			lc_dwsr
t_dw_mpl 				ldw_main, ladw_details[]
b_obj_instantiate		lbo_instance
c_trans_setup			lc_trans_setup
errorReturn        		lret_rc
b_multithread			lb_multithread_post
s_str_ds_4_posting	lstr_ds_4_posting
s_str_streamvalue		lastr_streamvalue[]


if  gf_messagebox('m.s_w_multi.e_unpost.01', 'Xác nhận sửa ghi sổ','Bạn có muốn sửa ghi sổ không?','question','yesno',2) = 1 then
	connect using it_transaction;	
	ic_obj_handling.f_get_str_streamvalue( lastr_streamvalue[])
	ic_obj_handling.dynamic f_get_ds_4_posting(lstr_ds_4_posting)
			
	// The multi-threaded AutoRpts object has been created.    
	ldw_main = this.f_get_dwmain()			
	if ldw_main.getrow( ) > 0 then
		setpointer(hourglass!)
		
		ll_select_row = ldw_main.find( " gutter = 'Y'", 1 , ldw_main.rowcount( ) )
		if ll_select_row > 0 then //-- Ghi sổ nhiếu phiếu --//	
			Do while ll_select_row > 0
				//---------------//
				//-- checking --//
				//---------------//
				//-- kiểm tra chứng từ đã thay đổi trạng thái bởi chứng từ liên quan --//				
				ldb_doc_id = ldw_main.getitemnumber( ll_select_row, 'ID')
				ls_doc_status = ldw_main.getitemstring( ll_select_row,'status')
				ld_trans_date = date(ldw_main.getitemdatetime( ll_select_row, 'trans_date'))
				ls_status = lbo_instance.f_get_doc_status(ldb_doc_id, it_transaction)				
				if lower(ls_doc_status) <> lower(ls_status) then
					gf_messagebox('m.s_w_multi.e_unpost.06','Thông báo','Chứng từ chưa cập nhật trạng thái','exclamation','ok',1)
					continue 
				end if				
				
				//-- kiểm tra đóng kỳ kế toán --//								
				if lbo_instance.f_get_doc_qty_and_value_yn( ldb_doc_id, ls_qty_yn,ls_value_yn,it_transaction ) <> 1 then
					return
				end if						
				if ls_qty_yn = 'Y' then
					if lbo_instance.f_is_period_closed_Ex(  'inventory', ld_trans_date,'normal', it_transaction ) then
						gf_messagebox('m.s_w_multi.e_unpost.02','Thông báo','Đã đóng kỳ kho hoặc chưa tạo kỳ kế toán nên không thể ghi sổ','exclamation','ok',1)
						return 
					end if
					if lbo_instance.f_is_period_closed_ex(  'inventory_count', ld_trans_date,'normal', it_transaction) then
						gf_messagebox('m.e_unpost.e_post.021','Thông báo','Ngày sửa ghi sổ điều chỉnh số lượng không được trước ngày kiểm kê sau cùng','exclamation','ok',1)
						return 
					end if
					if lbo_instance.f_is_period_closed_ex(  'inventory_close', ld_trans_date,'normal', it_transaction) then
						gf_messagebox('m.s_w_multi.e_post.022','Thông báo','Ngày sửa ghi sổ điều chỉnh số lượng không được trước ngày kiểm kê đóng kỳ kho sau cùng','exclamation','ok',1)
						return 
					end if			
				end if
				if ls_value_yn = 'Y' then
					if lbo_instance.f_is_period_closed_ex(  'finance', ld_trans_date,'normal', it_transaction) then
						gf_messagebox('m.s_w_multi.e_unpost.03','Thông báo','Đã đóng kỳ hoặc chưa tạo kỳ kế toán nên không thể ghi sổ','exclamation','ok',1)
						return 
					end if		
				end if					
				
				//-- xoá approve profile nếu có--//
//				lbo_instance.f_delete_appr_profile( ldb_doc_id, it_transaction )	
//				lbo_instance.f_copy_version( ldb_doc_id, lstr_ds_4_posting, it_transaction)
//				update document set status = 'new' where id = :ldb_doc_id using  it_transaction;
				
				if ls_docs <> '' then ls_docs+= ','
				ls_docs += string(ldb_doc_id)				
								
				ll_select_row = ldw_main.find( " gutter = 'Y'", ll_select_row + 1 , ldw_main.rowcount( )+1 )						
			loop
	//		lb_multi_post = true
		else           
			ldb_doc_id = ldw_main.getitemnumber( ldw_main.getrow(), 'ID')
			ls_doc_status = ldw_main.getitemstring(  ldw_main.getrow(),'status')
			ld_trans_date = date(ldw_main.getitemdatetime(  ldw_main.getrow(), 'trans_date'))			
			//---------------//
			//-- checking --//
			//---------------//
			//-- kiểm tra chứng từ đã thay đổi trạng thái bởi chứng từ liên quan --//				

			ls_status = lbo_instance.f_get_doc_status(ldb_doc_id, it_transaction)				
			if lower(ls_doc_status) <> lower(ls_status) then
				gf_messagebox('m.s_w_multi.e_unpost.06','Thông báo','Chứng từ chưa cập nhật trạng thái','exclamation','ok',1)
				return 
			end if				
			//-- kiểm tra đóng kỳ kế toán --//
			
			if lbo_instance.f_get_doc_qty_and_value_yn( ldb_doc_id, ls_qty_yn,ls_value_yn,it_transaction ) <> 1 then
				return
			end if		
			
			if ls_qty_yn = 'Y' then
				if lbo_instance.f_is_period_closed_Ex(  'inventory', ld_trans_date,'normal', it_transaction ) then
					gf_messagebox('m.s_w_multi.e_unpost.02','Thông báo','Đã đóng kỳ kho hoặc chưa tạo kỳ kế toán nên không thể ghi sổ','exclamation','ok',1)
					return 
				end if
				if lbo_instance.f_is_period_closed_ex(  'inventory_count', ld_trans_date,'normal', it_transaction) then
					gf_messagebox('m.e_unpost.e_post.021','Thông báo','Ngày sửa ghi sổ điều chỉnh số lượng không được trước ngày kiểm kê sau cùng','exclamation','ok',1)
					return 
				end if
				if lbo_instance.f_is_period_closed_ex(  'inventory_close', ld_trans_date,'normal', it_transaction) then
					gf_messagebox('m.s_w_multi.e_post.022','Thông báo','Ngày sửa ghi sổ điều chỉnh số lượng không được trước ngày kiểm kê đóng kỳ kho sau cùng','exclamation','ok',1)
					return 
				end if			
			end if
			if ls_value_yn = 'Y' then
				if lbo_instance.f_is_period_closed_ex(  'finance', ld_trans_date,'normal', it_transaction) then
					gf_messagebox('m.s_w_multi.e_unpost.03','Thông báo','Đã đóng kỳ hoặc chưa tạo kỳ kế toán nên không thể ghi sổ','exclamation','ok',1)
					return 
				end if		
			end if					
			//-- xoá approve profile nếu có--//
//			lbo_instance.f_delete_appr_profile( ldb_doc_id, it_transaction )	
//			lbo_instance.f_copy_version( ldb_doc_id, lstr_ds_4_posting, it_transaction)
//			update document set status = 'new' where id = :ldb_doc_id using  it_transaction;			
			
			ls_docs += string(ldb_doc_id)
		end if
		//-- gọi đối tượng trước khi unpost --//
		if ic_obj_handling.event e_window( 'e_preunpost') = -1 then	
			Rollback using this.it_transaction ;
			disconnect using it_transaction;	
			return
		end if		
		
		commit using it_transaction;
	
		if pos(ls_docs, ',')>0 then ls_docs = '('+ls_docs+')'

		lb_multithread_post = create b_multithread
/* Khoă để debug --/			
		lret_rc = SharedObjectGet("doc_post"+string(li_cnt), lb_multithread_post)    
		DO while (lret_rc = SUCCESS!)
			li_cnt ++
			lret_rc = SharedObjectGet("doc_post"+string(li_cnt), lb_multithread_post)    
		loop		
		IF (lret_rc <> SUCCESS!) THEN
			 // Multi-threaded invocation
			 lret_rc = SharedObjectRegister ('b_multithread', 'doc_post'+string(li_cnt) )
			 IF (lret_rc = SUCCESS!) THEN			 
				lret_rc = SharedObjectGet ("doc_post"+string(li_cnt), lb_multithread_post)     
				IF (lret_rc = SUCCESS!) THEN	
	-- Khoá để debug--*/					
					ls_server = it_transaction.servername
					ls_login = it_transaction.logid
					ls_pwd = it_transaction.logpass			
					
					lb_multithread_post.F_unpost(ls_server,ls_login,ls_pwd , gi_user_comp_id , gdb_branch , gi_userid , gs_sob, ldw_main.dataobject, ls_docs, lastr_streamvalue[], lstr_ds_4_posting )
					
//					lb_multithread_post.post F_unpost(ls_server,ls_login,ls_pwd , gi_user_comp_id , gdb_branch , gi_userid , gs_sob, ldw_main.dataobject, ls_docs, lastr_streamvalue[], lstr_ds_4_posting )

/* Khoă để debug --/					
					//-- sau khi post xong --//
					SharedobjectUnregister("doc_post"+string(li_cnt))
				ELSE
					ls_hdr = "Error Accessing b_multithread"
					ls_err = "An error occurred while getting a pointer to the multi-threaded object ~"b_multithread~". ~r~n~r~n"
					 IF (lret_rc = SharedObjectCreateInstanceError!) THEN
						  ls_err = ls_err + "SharedObjectCreateInstanceError! - The local reference to the shared object could not be created."
					 ELSEIF (lret_rc = SharedObjectNotExistsError!) THEN
						  ls_err = ls_err + "SharedObjectNotExistsError! - The instance name has not been registered."
					 END IF
				end if
			ELSE
				  ls_hdr = "Error Creating b_multithread"
				  ls_err = "An error occurred attempting to create the multi-threaded object ~"b_multithread~". ~r~n~r~n"
				  
				  CHOOSE CASE lret_rc
						CASE SharedObjectExistsError!
							  ls_err = ls_err + "SharedObjectExistsError! - The instance name has already been used."
						CASE SharedObjectCreateInstanceError!
							  ls_err = ls_err + "SharedObjectCreateInstanceError! - The object could not be created."
						CASE SharedObjectCreatePBSessionError!
							  ls_err = ls_err + "SharedObjectCreatePBSessionError! - The shared object session could not be created."
						CASE ELSE
				  END CHOOSE          				
			end if
			
		end if
		IF (ls_err <> "") THEN
			messagebox('ERROR', ls_err )
		END IF		
-- Khoá để debug--*/		
//		ic_obj_handling.f_ctrl_actionbuttons( idw_focus)
//		this.event e_display_actionbutton( )	
		disconnect using it_transaction;	
		this.event e_refresh( )
		destroy b_multithread
		return 		
	end if
	disconnect using it_transaction;	
end if


end event

event e_note();
s_object_display	lod_handle


lod_handle = create u_alert_data
this.f_openchildwithparm( 's_w_multi_n', lod_handle)

end event

event e_account_view();double				ldb_doc_id, ldb_trans_hdr_id,ldb_branch_id
string					ls_status
long					ll_rtn
any					la_data[]
int						li_rtn, li_cnt, li_response

t_dw_mpl				ldw_main
//t_ds_db				lds_post_line
u_post_line			lc_post_line


li_rtn = ic_obj_handling.dynamic event e_widnow_e_preaccounting()
if li_rtn = 1 or li_rtn = -1 then return


lc_post_line = create u_post_line

ldw_main = this.f_get_dwmain()
if ldw_main.getrow( ) > 0 then
	ldb_doc_id = ldw_main.getitemnumber(ldw_main.getrow( ), 'id')	
	ldb_trans_hdr_id = ldw_main.getitemnumber( ldw_main.getrow( ), 'trans_hdr_id')
	ldb_branch_id = ldw_main.getitemnumber( ldw_main.getrow( ), 'branch_id')
	ls_status = ldw_main.getitemstring(ldw_main.getrow( ) , 'status')
	lc_post_line.f_set_doc_id(ldb_doc_id)
	
	if ls_status = 'new' then
		if ic_obj_handling.dynamic f_create_post_line(ldb_doc_id,ldb_branch_id, ldb_trans_hdr_id, 'new') = -1 then
			destroy lc_post_line //-- không dc destroy vì đối tượng này dc dùng trên window child			
			rollback using it_transaction ;
			return
		else
			commit using it_transaction;
		end if							
	end if
	this.f_openchildwithparm( 's_w_multi_n', lc_post_line)
//	openwithparm(s_w_multi_n, lc_post_line , this)
end if

//	la_data[1] = ldb_doc_id
//	if lc_post_line.f_init_object_table(lds_post_line, 'd_post_line_grid','doc_id', la_data[], la_null[]) = -1 then
//		destroy lc_post_line //-- không dc destroy vì đối tượng này dc dùng trên window child
//		destroy lds_post_line			
//		return
//	end if
	
//	if lds_post_line.rowcount() = 0 then
//		if ls_status <> 'new' then
//			gf_messagebox('m.s_w_multi.e_account_view.01','Thông báo','Lỗi chứng từ đã ghi sổ nhưng không ghi công nợ. Liên hệ người quản trị','exclamation','ok',1)
//			return
//		end if
		//-- Nếu chưa tạo tài khoản ghi sổ: post ghi sổ --//
//		if ic_obj_handling.dynamic f_create_post_line(ldb_doc_id,ldb_branch_id, ldb_trans_hdr_id) = -1 then
//			destroy lc_post_line //-- không dc destroy vì đối tượng này dc dùng trên window child			
//			rollback using it_transaction ;
//			return
//		else
//			commit using it_transaction;
//			destroy lc_post_line //-- không dc destroy vì đối tượng này dc dùng trên window child		
//		end if
//		if lds_post_line.update(true,false ) = 1 then
//			commit using sqlca;
//			lds_post_line.resetupdate( )
//		else
//			rollback using sqlca;
//			destroy lc_post_line //-- không dc destroy vì đối tượng này dc dùng trên window child
//			destroy lds_post_line					
//			return
//		end if
//	end if

end event

event e_copy_line(string vs_btn_name);int										li_rtn
string									ls_obj_name
double								ldb_trans_id
s_object_display					lpo_handing_copyf
s_str_actionpane					lstr_actionpane[]

ls_obj_name = mid(vs_btn_name,9,len(vs_btn_name))
if ls_obj_name = 'seft' then
	ls_obj_name =ic_obj_handling.classname( )
else
	ls_obj_name = 'u_' + ls_obj_name
end if
lpo_handing_copyf = create using ls_obj_name
lpo_handing_copyf.ib_copy_line = true
lpo_handing_copyf.ib_copying = true
lstr_actionpane[1].s_dwo_action = 'd_action_edit'
lstr_actionpane[1].s_visible_buttons = 'b_refresh;b_query;b_filteron;b_okclose;b_close;'
lstr_actionpane[1].s_button_name =  'b_refresh;b_query;b_filteron;b_okclose;b_close;'
lstr_actionpane[1].s_objname_handling = lpo_handing_copyf.classname( )
lstr_actionpane[1].s_description = lpo_handing_copyf.is_object_title
lpo_handing_copyf.f_set_actionpane( lstr_actionpane)
ic_obj_handling.ib_copying = true
//li_rtn = ic_obj_handling.event e_window( 'e_copy_form')
//if li_rtn = -1 then
//	messagebox('Lỗi','s_w_multi.e_copy_form(line:20)')
//elseif li_rtn = 1 then
	this.f_openchildwithparm( 's_w_multi_n_max', lpo_handing_copyf)
//end if

end event

event e_detail();string				ls_obj_name
c_string			lc_string
b_detail			lc_obj_detail

if this.ic_obj_handling.event e_window_e_detail_start( ) = -1 then return 
if not isvalid(this.ic_obj_handling.ipo_parm ) then 
	ls_obj_name = lc_string.f_globalreplace( 'b_detail' + mid(ic_obj_handling.classname( ),2,len(ic_obj_handling.classname( ))) , 'b_', 'u_')
	lc_obj_detail = create using ls_obj_name
else
lc_obj_detail = this.ic_obj_handling.ipo_parm
end if
lc_obj_detail.f_set_ib_editing( this.ic_obj_handling.ib_detail_editing) 
this.ic_obj_handling.ib_detail_editing = false
 
this.f_openchildwithparm( 's_w_multi_n_max_rb', lc_obj_detail)
//this.f_openchildwithparm('s_w_multi_n',ls_obj_name +';0')
end event

event e_savepost();int     			li_rtn
long			ll_find
double		ldb_doc_id
t_dw_mpl	ldw_main


if idw_focus.dynamic f_get_ib_editing() then
	ldw_main = this.f_get_dwmain( )
	ldb_doc_id = ldw_main.getitemnumber( ldw_main.getrow(), 'ID')
	li_rtn =	this.event e_saveclose( )
	if ldb_doc_id <> ldw_main.getitemnumber( ldw_main.getrow(), 'ID') then
		ll_find = ldw_main.find( "ID = "+string(ldb_doc_id), 1, ldw_main.rowcount( ) )
		if ll_find = 0 then
			li_rtn = -1
			gf_messagebox('m.s_w_multi.e_savepost.01','Thông báo','Chứng từ sau khi lưu đã bị lọc mất .. Vui lòng tắt lọc để ghi sổ chứng từ ','exclamation','ok',1)
		else
			gf_messagebox('m.s_w_multi.e_savepost.02','Thông báo','Chứng từ đang ghi sổ không đúng với chứng từ vừa lưu, vui lòng báo cho quản trị phần mềm ','exclamation','ok',1)
//			ldw_main.scrolltorow( ll_find)
			li_rtn = -1
		end if
	end if
	if li_rtn = 1 then this.event e_post( )
end if
end event

event type integer e_ledger_transfer();int				li_rtn

//-- thông báo đến object --//
li_rtn = ic_obj_handling.event e_window( 'e_ledger_transfer')
if li_rtn = -1 then 
	return -1
end if


end event

event e_settlement(); ic_obj_handling.event e_window( 'e_settlement')
end event

event e_open_report(string vs_object_name);window	lw_sheet
decimal 	ldc_menu_id

select max(id) into :ldc_menu_id
from menu
where code = :vs_object_name using sqlca;
	if sqlca.sqlcode <> 0 then 
		ldc_menu_id = 0
	else
		opensheetwithparm(lw_sheet, vs_object_name+";"+string(ldc_menu_id), 's_w_multi',t_w_mdi,3, original!)
	end if
return
end event

event e_cancel_settlement(); ic_obj_handling.event e_window( 'e_v_settlement')
end event

event e_fiscal_year(); ic_obj_handling.event e_window( 'e_fiscal_year')
end event

event e_create_fiscal_year(); ic_obj_handling.event e_window( 'e_create_fiscal_year')
end event

event e_lmousedown;string		ls_des_flag

choose case flags
	case 1
		ls_des_flag = 'left mouse'
	case 2
		ls_des_flag = 'right mouse'
	case 4
		ls_des_flag = 'control'
	case 8
		ls_des_flag = 'shift'
	case 16
		ls_des_flag = 'middle mouse'
end choose
return 0
end event

event e_completed();int				li_rtn
//t_dw_mpl	ldw_main
//
//ldw_main = this.f_get_dwmain( )
//ldw_main.setitem( ldw_main.getrow(), 'status', 'completed')
//li_rtn = ldw_main.update(true,false )
//if li_rtn = 1 then
//	ldw_main.resetupdate( )
	li_rtn = ic_obj_handling.event e_window( 'e_completed')
	if li_rtn <> -1 then
//		commit using it_transaction;
		ic_obj_handling.event e_window( 'e_postcompleted')
	else
		rollback using it_transaction;
	end if
//else
//	rollback using it_transaction;
//end if
end event

event e_lose();int 			li_rtn

li_rtn = ic_obj_handling.event e_window( 'e_lose')
if li_rtn = 1 then
	commit using it_transaction;
	this.event e_refresh( )
elseif li_rtn = -1 then
	rollback using it_transaction;
	this.event e_refresh( )
end if

end event

event type integer e_copy_to_new(string vs_btn_name);s_str_dwo_related		lstr_related[], lstr_data_related[]
s_object_display		lpo_related
c_dwservice				lc_dwsr
t_dw_mpl				ldw_main, ldw_main_related
t_ds_db					lads_copied[]
t_t							ltab_action
s_tp_actionpane		ltp_actionpane_cur
b_obj_instantiate		lbo_ins
u_sel_branch_4_gen	lc_select_branch		
string						ls_obj_name, ls_rtn
long						ll_find, ll_win_idx,ll_rtn
double 					ldb_id, ldb_rtn, ldb_t_branch

connect using it_transaction;

ldw_main = this.f_get_dwmain( )
ldb_id = ldw_main.getitemnumber( ldw_main.getrow( ) , 'id')
ic_obj_handling.dynamic f_get_dwo_related(lstr_related) 
ls_obj_name = mid(vs_btn_name,9,len(vs_btn_name))

if ls_obj_name = 'self' then
	ls_obj_name =ic_obj_handling.classname( )
elseif left(ls_obj_name,6) = 'inter_' then
	lc_select_branch = create using 'u_sel_branch_4_gen'
	openwithparm(s_wr_multi,lc_select_branch)
	ls_rtn = message.stringparm
	setnull(message.stringparm)
	if isnull(ls_rtn) or ls_rtn ='' then return	0
	if pos(ls_rtn,';') = 0 then
		ldb_t_branch = double(ls_rtn)
	else
		ldb_t_branch = double(left(ls_rtn,pos(ls_rtn,';') - 1))
	end if
	ls_obj_name = 'u_'+ mid(ls_obj_name,7,len(ls_obj_name))
else
	ls_obj_name = 'u_' + ls_obj_name
end if

if ic_obj_handling.event e_window_e_precopy_to(vs_btn_name) = -1 then
	disconnect using it_transaction;
	return -1
end if
ic_obj_handling.ib_copying = true
ic_obj_handling.is_copy_type = 'copyt'
//get data de build where related
ic_obj_handling.f_get_data_related(ls_obj_name, lstr_data_related[]) 
if ic_obj_handling.classname( )=ls_obj_name then
	ll_find=ldw_main.find("gutter = 'Y'", 1, ldw_main.rowcount())
	if ll_find=0 then 
		gf_messagebox('m.s_w_multi.e_copy_to_new.01','Thông báo','Phải tích chọn phiếu cần nhân bản','exclamation','ok',1)
		ic_obj_handling.ib_copying = false
		disconnect using it_transaction;
		return 0
	end if
end if
//build where related
this.f_build_data_related( lstr_data_related[])  //

if this.f_get_data_copied_ex( lads_copied[],lstr_related,'copyt',ls_obj_name) > 0 then
	if ic_obj_handling.classname( )<>ls_obj_name then						
		ic_obj_handling.ib_copying = false
		this.event e_create_related_object(ls_obj_name,lpo_related)		
		if ldb_t_branch = 0 or ldb_t_branch = gdb_branch then
			ldb_rtn = lbo_ins.f_copy_to(ic_obj_handling.classname( ), ls_obj_name, lstr_data_related[], lads_copied[], it_transaction ,lpo_related.idwsetup_initial )		
		elseif ldb_t_branch > 0  and  ldb_t_branch <> gdb_branch then
			ldb_rtn = lbo_ins.f_copy_to_inter( ldb_t_branch, ls_obj_name, lstr_data_related[], lads_copied[], it_transaction ,lpo_related.idwsetup_initial )		
		end if
		//-- gọi cho object --//
		ic_obj_handling.event e_window_e_postcopy_to(vs_btn_name, ldb_rtn, lstr_data_related[])
		disconnect using it_transaction;
		
		if ldb_rtn > 0 and left(ic_obj_handling.classname( ), 9)<> 'u_detail_' then
			lpo_related.f_set_main_id(ldb_rtn )
			lpo_related.f_set_data_related(lstr_data_related[])		
			lpo_related.is_object_title = lstr_data_related[1].s_text
			lpo_related.is_win_grp = 'DOC'
			lpo_related.is_sheet_type ='DOC'
			lpo_related.is_win_name = lstr_data_related[1].s_text			
			t_w_mdi.wf_open_sheet_doc(lpo_related, 's_w_multi_rb' )
			if isvalid(lpo_related) then lpo_related.post event e_window_e_change_object()			
//			this.event e_change_object_appeon( lpo_related)			
		elseif  ldb_rtn > 0 and left(ic_obj_handling.classname( ), 9)= 'u_detail_' then
			lpo_related.f_set_main_id(ldb_rtn )
			this.iw_parent.dynamic event e_change_object_appeon( lpo_related)			
			disconnect using it_transaction;
			close(this)						
			return 0
		end if


	else /////////--- nhan ban--//////////////
		if upper(ldw_main.describe("DataWindow.table.UpdateTable") ) = 'DOCUMENT'  then
			ldb_rtn = lbo_ins.f_copy_to( ic_obj_handling.classname( ),ls_obj_name, lstr_data_related[], lads_copied[], it_transaction ,ic_obj_handling.idwsetup_initial )	
			
			ldw_main.event e_refresh( )
			ll_find= ldw_main.find("id ="+string(ldb_rtn), 1, ldw_main.rowcount( ))
			if ll_find > 0 then	ldw_main.scrolltorow(ll_find )
			disconnect using it_transaction;
		else
			disconnect using it_transaction;
			this.f_set_data_copied( lads_copied,lstr_related,'copyt',ls_obj_name,this)
			ic_obj_handling.ib_copying = false
			ic_obj_handling.ib_copy_tax = false
			//-- dành cho trường hợp nhân bản ---//
			ic_obj_handling.event e_window_e_postcopy( )
			ldw_main.f_filter_detail( )		 
		end if
	end if	
else
	ic_obj_handling.ib_copying = false
	disconnect using it_transaction;
	
end if

return ll_win_idx


end event

event type integer e_save4close();//-- OVERRIDE --//

//-- Thực hiện lưu dữ liệu, return 1 ok, -1 lỗi --//
int 		li_rtn
t_ds_db	lds_matching
t_dw_mpl	ldw_main


if idw_focus.classname( ) = 'dw_filter' then
	ldw_main = this.f_get_dwmain( )
	this.f_set_idwfocus(ldw_main )
end if

//-- Trước khi lưu --//
li_rtn = this.event e_presave( )

//-- Yêu cầu thực hiện lưu --//
if li_rtn <> -1 then
	li_rtn = idw_focus.dynamic event e_save()
	if li_rtn <> -1 then
		li_rtn = idw_focus.dynamic event e_resetupdate()	
		if li_rtn = 1 then
			lds_matching = ic_obj_handling.dynamic f_get_ids_matching()
			if isvalid(lds_matching) then
//				if lds_matching.rowcount( ) > 0 then
//					li_rtn = lds_matching.update( true,false)
//					if li_rtn = 1 then 
//						lds_matching.resetupdate( )
//					else
//						rollback using it_transaction;
//					end if
//				end if
				lds_matching.reset()
				ic_obj_handling.ib_copying = false
				ic_obj_handling.ib_copy_tax = false
			end if
			if li_rtn = 1 then 
				commit using it_transaction;
			end if
			if it_transaction.sqlcode = 0 then
			else
				messagebox('ERROR','s_w_main.e_save(commit)')
			end if
		else
			rollback using it_transaction;
		end if
	else
		rollback using it_transaction;
	end if
	this.event e_postsave(li_rtn)
end if

return li_rtn
end event

event type integer e_filteron_rb();//-- override--//

t_dw_mpl			ldw_main
c_string				lc_string
t_dw					ldw_focus
int						li_cnt, li_idx
long					ll_currow
string					las_colname_in_taborder[], ls_dwsyntax, ls_err, ls_vpos_max, ls_vpos,ls_display_model
string					ls_presentation_str, ls_sql

// Gan dataobject cho dw_filter//
ldw_main = this.f_get_dwmain( )
gb_filter.visible = true
dw_filter.visible = true

if dw_filter.is_filter_type = '' then dw_filter.is_filter_type = '1'

if dw_filter.is_filter_type = '1' then //-- create DW --//
	dw_filter.dataobject = 'd_filter_form'
else
	// Gan dataobject cho dw_filter//
	if ldw_main.dynamic f_isgrid() then
		li_cnt = ldw_main.f_get_colname_in_taborder( las_colname_in_taborder[])
		ls_sql = "SELECT "
		ls_presentation_str = "style(type=grid)"
		FOR li_idx = 1 to li_cnt
			if li_idx < li_cnt then	
				ls_sql += "~'~' "+  las_colname_in_taborder[li_idx]+ ','
			else
				ls_sql += "~'~' " +  las_colname_in_taborder[li_idx]+ ' FROM dual '
			end if
		NEXT
		if not ib_saving and not ib_opening then
			connect using it_transaction;
		end if
		ls_dwsyntax = it_transaction.SyntaxFromSQL(ls_sql, ls_presentation_str, ls_err)
		if not ib_saving and not ib_opening then
			disconnect using it_transaction;
		end if
		dw_filter.Create(ls_dwsyntax, ls_err)		
		dw_filter.bringtotop = true
//		dw_filter.f_set_editable_4_filter( true)	
	end if	
end if

ii_dwfilter_header = integer(dw_filter.describe( "datawindow.header.height"))

li_cnt = dw_filter.insertrow( 0)
dw_filter.scrolltorow(li_cnt)
ib_filter_on = true
if dw_filter.is_filter_type = '1'  then
	if not this.ib_opening and  not ib_saving then
		connect using it_transaction;
	end if
	dw_filter.f_retrieve_dwc_dwfilter_ex( 'colname', it_transaction)
	if not this.ib_opening and  not ib_saving then
		disconnect using it_transaction;
	end if
end if
this.event e_filter_resize_new( )


//--resize window--//
ls_display_model = ic_obj_handling.dynamic f_get_display_model()
this.f_resize(ls_display_model )

if dw_filter.is_filter_type = '1' then
	if isvalid( ic_obj_handling.ids_filter_data) then
		if ic_obj_handling.ids_filter_data.rowcount( ) = 1 then
			dw_filter.reset( )
			ic_obj_handling.ids_filter_data.rowscopy(1,1,primary!,dw_filter, 1,primary!)
		end if
	end if
end if

//this.event e_ctrl_actionbutton( )
//this.event e_display_actionbutton( )

//-- set dw focus để chuẩn bị xử lý các chuổi đặt biệt của datetime và number--//
//ldw_focus = dw_filter
//dw_filter.inv_querymode.f_setdwfocus( ldw_focus)

return 0
end event

event type integer e_filterswitch_rb();//-- override--//

t_dw_mpl			ldw_main
c_string				lc_string
t_dw					ldw_focus
int						li_cnt, li_idx
long					ll_currow
string					las_colname_in_taborder[], ls_dwsyntax, ls_err, ls_vpos_max, ls_vpos,ls_display_model
string					ls_presentation_str, ls_sql

// Gan dataobject cho dw_filter//
ldw_main = this.f_get_dwmain( )
gb_filter.visible = true
dw_filter.visible = true

if dw_filter.is_filter_type = '1' then //-- create DW --//
	dw_filter.is_filter_type = '2'
	// Gan dataobject cho dw_filter//
	if ldw_main.dynamic f_isgrid() then
		li_cnt = ldw_main.f_get_colname_in_taborder( las_colname_in_taborder[])
		ls_sql = "SELECT "
		ls_presentation_str = "style(type=grid)"
		FOR li_idx = 1 to li_cnt
			if li_idx < li_cnt then	
				ls_sql += "~'~' "+  las_colname_in_taborder[li_idx]+ ','
			else
				ls_sql += "~'~' " +  las_colname_in_taborder[li_idx]+ ' FROM dual '
			end if
		NEXT
		if not ib_saving and not ib_opening then
			connect using it_transaction;
		end if
		ls_dwsyntax = it_transaction.SyntaxFromSQL(ls_sql, ls_presentation_str, ls_err)
		if not ib_saving and not ib_opening then
			disconnect using it_transaction;
		end if
		dw_filter.Create(ls_dwsyntax, ls_err)		
		dw_filter.bringtotop = true
//		dw_filter.f_set_editable_4_filter( true)	
	end if
else
	dw_filter.is_filter_type = '1'
	dw_filter.dataobject = 'd_filter_form'
end if

ii_dwfilter_header = integer(dw_filter.describe( "datawindow.header.height"))

li_cnt = dw_filter.insertrow( 0)
dw_filter.scrolltorow(li_cnt)
ib_filter_on = true
if dw_filter.is_filter_type = '1'  then
	if not this.ib_opening and  not ib_saving then
		connect using it_transaction;
	end if
	dw_filter.f_retrieve_dwc_dwfilter_ex( 'colname', it_transaction)
	if not this.ib_opening and  not ib_saving then
		disconnect using it_transaction;
	end if
end if
this.event e_filter_resize_new( )


//--resize window--//
ls_display_model = ic_obj_handling.dynamic f_get_display_model()
this.f_resize(ls_display_model )

if dw_filter.is_filter_type = '1' then
	if isvalid( ic_obj_handling.ids_filter_data) then
		if ic_obj_handling.ids_filter_data.rowcount( ) = 1 then
			dw_filter.reset( )
			ic_obj_handling.ids_filter_data.rowscopy(1,1,primary!,dw_filter, 1,primary!)
		end if
	end if
end if

//this.event e_ctrl_actionbutton( )
//this.event e_display_actionbutton( )

//-- set dw focus để chuẩn bị xử lý các chuổi đặt biệt của datetime và number--//
//ldw_focus = dw_filter
//dw_filter.inv_querymode.f_setdwfocus( ldw_focus)

return 0
end event

event e_open_related_object(string vs_objname);boolean					lb_return_2_main,lb_multi_print
string						ls_display_model, ls_filterstring, ls_sqlnowhere, ls_currentwhere, ls_modify, ls_rtn,ls_dwo_view
double					ldb_main_ID
long						ll_row
int							li_idx,li_rtn
c_string					lc_string
s_str_dw_ms			lastr_dw_ms_empty[]
s_str_dw_md			lastr_dw_md_empty[]
t_transaction			lc_transaction
window					lw_requester
//t_dw_mpl					ldw_main, ldw_empty[]
s_object_display		lod_main, lpo_related

s_str_dwo_related		lstr_data_related[],lstr_related[]
s_str_dwo				lstr_dwo[]
s_str_drilldown_data	lstr_drilldown_data
t_dw_mpl					ldw_focus



ldw_focus = this.f_get_idwfocus( )
if ldw_focus.f_get_ib_editing() then
	gf_messagebox('m.t_w_mdi.itemclicked.01','Thông báo','Phải lưu dữ liệu trước khi chuyển đối tượng liên quan','exclamation','ok',1) 
else		
	ib_object_changing = true
	lpo_related =  create using vs_objname
	li_rtn = ic_obj_handling.f_get_data_related(lpo_related.classname(), lstr_data_related[])
	if li_rtn = 0 then
		//-- xem lại khai báo đối tương liên quan trên object--//
		gf_messagebox('m.s_w_main.e_change_object.01','Thông báo','Không tìm thấy struct đối tượng liên quan','exclamation','ok',1)
		return
	end if
	li_rtn = this.f_build_data_related( lstr_data_related[], lstr_drilldown_data) 
//		if this.f_build_data_related( lstr_data_related[]) = -1 then lb_multi_print = false
	lpo_related.f_set_data_related(lstr_data_related[])		
	lpo_related.is_object_title = lstr_data_related[1].s_text
	lpo_related.is_win_grp = 'DOC'
	lpo_related.is_sheet_type ='DOC'
	lpo_related.is_win_name = lstr_data_related[1].s_text
	li_idx= t_w_mdi.wf_open_sheet_doc(lpo_related, 's_w_multi_rb' )
	if isvalid(lpo_related) then lpo_related.post event e_window_e_change_object()
	ib_object_changing = false	
end if
return

/*
if ic_obj_handling.f_get_data_related( ls_dwo_view, lstr_data_related[]) = 1 then
	//--Gán title cho phiếu in--//
	lb_view.f_get_istr_actionpane(lstr_actionpane)
	lstr_actionpane[1].s_description = lstr_data_related[1].s_text
	lb_view.f_set_istr_actionpane(lstr_actionpane)		
	//--Gán dwo main --//
	lb_view.f_get_dwo( lstr_dwo)
	lstr_dwo[1].s_dwo_default =  lstr_data_related[1].s_related_obj_dwo
	lstr_dwo[1].s_dwo_form = lstr_data_related[1].s_related_obj_dwo
	lstr_dwo[1].s_description =  lstr_data_related[1].s_text
	lb_view.f_set_dwo_structure(lstr_dwo )	
	lb_view.is_object_title =   lstr_data_related[1].s_text
	if ic_obj_handling.event e_window_e_view(lb_view, ls_dwo_view ) = -1 then return 
	 lstr_data_related[]=  lstr_data_empty[]
	ic_obj_handling.f_get_data_related(lb_view.f_get_main_dwo( ), lstr_data_related[])
	
	if this.f_build_data_related( lstr_data_related[]) = -1 then return
	lb_view.f_set_data_related(lstr_data_related[])			
	ic_obj_handling.event e_window_e_view( lb_view, ls_dwo_view)
	t_w_mdi.wf_open_sheet_doc(lb_view, 's_w_multi_rb')
else
	gf_messagebox('m.s_w_main.e_view.01','Thông báo','Không tìm thấy structure đối tượng liên quan theo dwo:@'+ls_dwo_view,'stop','ok',1)
	return 
end if	
return
*/
end event

event type integer e_action(string vs_action);
s_object_display			lpo_related

ic_obj_handling.event e_action(vs_action)
//lpo_related = message.powerobjectparm
//if isvalid(lpo_related) then
//	t_w_mdi.wf_open_sheet_doc(lpo_related, 's_w_multi_rb' )
//	if isvalid(lpo_related) then lpo_related.post event e_window_e_change_object()			
//	connect using it_transaction;
//	this.event e_change_object_appeon( lpo_related)	
//	disconnect using it_transaction;
//end if
return 1
end event

public function tab f_get_tab_1 ();return tab_1
end function

public function datawindow f_get_dwmain ();t_dw_mpl		ldw_main
s_object_display			lod_handle
s_str_dwo_tabpage		lstr_dwo_tabpage[]

if dw_1.dataobject <> '' then
	ldw_main=  dw_1
else
	lod_handle = this.f_get_obj_handling( )
	lod_handle.f_get_dwo_tabpage( lstr_dwo_tabpage[])
	ldw_main = this.f_get_dw( lstr_dwo_tabpage[1].str_dwo[1].s_dwo_default  )
end if 
return ldw_main
end function

public function treeview f_get_tv ();return tv_1
end function

public function integer f_resize_up_1tv_fx3dfx_lo_tb ();
//-- resize tv_1 --//
tv_1.move(tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
tv_1.width = ii_leftpart_width
tv_1.height = ii_upperpart_height 

//-- resize gb_1 --//
gb_1.move(tv_1.x + ii_leftpart_width, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
gb_1.height = ii_upperpart_height 
gb_1.width = 24

//-- resize dw_1 --//
dw_1.move( gb_1.x + gb_1.width, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_1.width = ii_resize_width - gb_1.x - gb_1.width -  this.ii_vscrollbar
dw_1.height =  ii_fixedpart1_height

//-- resize dw_2 --//
dw_2.move( gb_1.x + gb_1.width + 5, dw_1.y + dw_1.height )
dw_2.width =  ii_resize_width - gb_1.x - gb_1.width  - this.ii_vscrollbar
dw_2.height = ii_fixedpart2_height  //- dw_1.f_getheight( ) - dw_2.f_getheight( )

//-- resize dw_3 --//
dw_3.move( gb_1.x + gb_1.width + 5, dw_2.y + dw_2.height )
dw_3.width =   ii_resize_width - gb_1.x - gb_1.width   - this.ii_vscrollbar
dw_3.height = ii_upperpart_height - ii_fixedpart1_height - ii_fixedpart2_height //dw_3.f_getheight( ) - 50 // ii_fixedpart2_height

//-- resize horizontal line --//
gb_2.move( tab_action.x, tv_1.y + tv_1.height )
gb_2.width =   ii_resize_width  - this.ii_vscrollbar
gb_2.height = 50

//-- resize tab --//
tab_1.move( tv_1.x , gb_2.y + gb_2.height )
tab_1.width =  ii_resize_width  - this.ii_vscrollbar
tab_1.height =  ii_resize_height - (gb_2.y + gb_2.height ) - this.ii_hscrollbar

return 1
end function

public subroutine f_set_invisible_ctrl ();
//if dw_1.f_isgrid( ) then
//	dw_filter.visible = true
//	gb_filter.visible = true
//else
	dw_filter.hide( ) // visible = false
	gb_filter.hide( ) // visible = false
//end if
dw_1.hide( ) // visible = false
dw_2.hide( ) // visible = false
dw_3.hide( ) // visible = false
dw_4.hide( ) // visible = false
dw_5.hide( ) // visible = false
dw_6.hide( ) // visible = false

gb_1.hide( ) // visible = false
gb_2.hide( ) // visible = false
gb_3.hide( ) // visible = false
gb_4.hide( ) // visible = false
gb_5.hide( ) // visible = false
gb_6.hide( ) // visible = false
gb_7.hide( ) // visible = false
gb_8.hide( ) // visible = false
gb_9.hide( ) // visible = false
gb_10.hide( ) // visible = false
gb_11.hide( ) // visible = false
gb_12.hide( ) // visible = false
st_1.hide( ) // visible = false
tv_1.hide( ) // visible = false
tab_1.hide( ) // visible = false

ddlb_1.hide( ) // visible = false
ddlb_2.hide( ) // visible = false

cbx_1.hide( ) //visible = false
cbx_2.hide( ) //visible = false
rb_1.hide( )
rb_2.hide( )
rb_3.hide( )
htb_1.hide( ) //visible = false
sle_1.hide( )
this.setredraw( false)
end subroutine

public subroutine f_set_visible_ctrl (string vs_display_model);boolean						lb_statictext
s_str_dwo_related			lstr_data_related[]

//-- kiem tra co data related ko --//
//lb_statictext = ic_obj_handling.dynamic f_get_ib_display_text()
//if ic_obj_handling.dynamic f_get_data_related(lstr_data_related[]) > 0 or lb_statictext then
//	st_1.show( )
//	if upperbound(lstr_data_related) > 0 then st_1.text = lstr_data_related[1].s_text
//	ii_text_spaceheight = 0
//else
//	st_1.hide( ) //visible = true
//	ii_text_spaceheight = 0	
//end if

choose case vs_display_model
	case '2ddlb_1tv_up1d1d_mid1d1d_lo1d'
		ddlb_1.show( )
		ddlb_2.show( )		
		tv_1.show( ) //visible = true
		gb_1.show( ) //visible = true
		gb_10.show( ) //visible = true
		gb_11.show( ) //visible = true
		gb_2.show( ) //visible = true
		gb_3.show( ) //visible = true
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		dw_3.show( ) //visible = true	
		dw_4.show( ) //visible = true
		dw_5.show( ) //visible = true
	case '1tv_up1d1d_mid1d1d_lo1d'
		tv_1.show( ) //visible = true
		gb_1.show( ) //visible = true
		gb_10.show( ) //visible = true
		gb_11.show( ) //visible = true
		gb_2.show( ) //visible = true
		gb_3.show( ) //visible = true
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		dw_3.show( ) //visible = true	
		dw_4.show( ) //visible = true
		dw_5.show( ) //visible = true
	case '1tv_up1d_1d_lo1d'
		tv_1.show( ) //visible = true
		gb_1.show( ) //visible = true
		gb_10.show( ) //visible = true
		gb_2.show( ) //visible = true
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		dw_3.show( ) //visible = true
	case '1tv_up1d_1d_lo2d'
		tv_1.show( ) //visible = true
		gb_1.show( ) //visible = true
		gb_10.show( ) //visible = true
		gb_2.show( ) //visible = true
		gb_3.show( ) //visible = true
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		dw_3.show( ) //visible = true
		dw_4.show( ) //visible = true
	case '1tv_up1d_mid1d_lo1d1d'
		tv_1.show( ) //visible = true
		gb_1.show( ) //visible = true
		gb_10.show( ) //visible = true
		gb_2.show( ) //visible = true
		gb_3.show( ) //visible = true
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		dw_3.show( ) //visible = true
		dw_4.show( ) //visible = true
	case '3d'
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		dw_3.show( ) //visible = true	
		gb_2.show( ) //visible = true
		gb_3.show( ) //visible = true
	case '1d_1dup_2d'
		gb_1.show( ) //visible = true
		gb_10.show( ) //visible = true
		gb_2.show( ) //visible = true
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		dw_3.show( ) //visible = true
		dw_4.show( ) //visible = true
	case '1d_2d'
		gb_1.show( ) //visible = true
		gb_2.show( ) //visible = true	
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		dw_3.show( ) //visible = true	
	case '1d_1df_1df'
		gb_1.show( ) //visible = true
		gb_10.show( ) //visible = true	
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		dw_3.show( ) //visible = true
		dw_4.show( ) //visible = true
		dw_5.show( ) //visible = true
	case 'up_1d_lo_2d'
		gb_2.show( ) //visible = true	
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		dw_3.show( ) //visible = true			
	case '1d_1d'
		gb_1.show( ) //visible = true
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true		
	case '1d_3d'
		gb_1.show( ) //visible = true
		gb_2.show( ) //visible = true
//		gb_3.show( ) //visible = true
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		dw_3.show( ) //visible = true
		dw_4.show( ) //visible = true
	case '2d'
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		gb_2.show( ) //visible = true
	case '3d_rb'
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		dw_3.show( ) //visible = true
		gb_2.show( ) //visible = true
		gb_6.show( ) //visible = true		
		rb_1.show( )
		rb_2.show( )
	case '1ddlb_1d_1tp'
		ddlb_1.show( ) //visible = true
		cbx_1.show( ) //visible = true
		cbx_2.show( ) //visible = true
		htb_1.show( ) //visible = true
		dw_1.show( ) //visible = true
		tab_1.show( )
		sle_1.show( ) //visible = true
		gb_2.show( ) //visible = true
	case '1ddlb_1d'
		ddlb_1.show( ) //visible = true
		cbx_1.show( ) //visible = true
		cbx_2.show( ) //visible = true
		htb_1.show( ) //visible = true
		dw_1.show( ) //visible = true
		sle_1.show( ) //visible = true
	case '1ddlb_2d_1tp'
		ddlb_1.show( ) //visible = true
		cbx_1.show( ) //visible = true
		cbx_2.show( ) //visible = true
		htb_1.show( ) //visible = true
		dw_1.show( ) //visible = true
		dw_2.show( )
		gb_1.show( ) //visible = true
		tab_1.show( )
		sle_1.show( ) //visible = true
		gb_2.show( ) //visible = true
	case '1d'
		dw_1.show( ) //visible = true
	case '1tb'
		tab_1.show( )
	case 'up_1tv_fx3dfx_lo_tb'
		tv_1.show( ) //visible = true
		gb_1.show( ) //visible = true
		gb_2.show( ) //visible = true
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		dw_3.show( ) //visible = true		
		tab_1.show( ) //visible = true
	case 'up_1d_4d_lo_tb'
		gb_1.show( ) //visible = true
		gb_2.show( ) //visible = true
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		dw_3.show( ) //visible = true		
		dw_4.show( ) //visible = true
		dw_5.show( ) //visible = true
		tab_1.show( ) //visible = true	
	case 'up_1d_1d_lo_tb'
	//	gb_1.show( ) //visible = true
		gb_2.show( ) //visible = true
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		//dw_3.show( ) //visible = true		
	//	dw_4.show( ) //visible = true
		//dw_5.show( ) //visible = true
		tab_1.show( ) //visible = true		
	case 'up_1d_3d_lo_tb'
		gb_1.show( ) //visible = true		
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		dw_3.show( ) //visible = true		
		dw_4.show( ) //visible = true
		gb_2.show( ) //visible = true
		tab_1.show( ) //visible = true				
	case 'up_1d_2d_lo_tb','up_2d1d_lo_1tb'
		gb_1.show( ) //visible = true		
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		dw_3.show( ) //visible = true		
		gb_2.show( ) //visible = true
		tab_1.show( ) //visible = true						
	case 'up_1d_lo_tb'
		dw_1.show( ) //visible = true
		gb_2.show( ) //visible = true
		tab_1.show( ) //visible = true	
	case 'up_1d_lo_1d_tb'
		dw_1.show( ) //visible = true
		gb_2.show( ) //visible = true
		tab_1.show( ) //visible = true		
		dw_2.show( ) //visible = true
		gb_1.show( ) //visible = true
	case '1tv_2d'
		tv_1.show( ) //visible = true
		gb_1.show( ) //visible = true
		gb_2.show( ) //visible = true
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true	
	case '2ddlb_2d'
		ddlb_1.show( )
		ddlb_2.show( )			
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		gb_2.show( ) //visible = true	
	case '5dgb'
		gb_2.show( ) //visible = true	
		gb_3.show( ) //visible = true	
		gb_4.show( ) //visible = true		
		gb_6.show( ) //visible = true	
		gb_7.show( ) //visible = true	
		gb_8.show( ) //visible = true	
		gb_9.show( ) //visible = true	
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		dw_3.show( ) //visible = true	
		dw_4.show( ) //visible = true
		dw_5.show( ) //visible = true
	case '4dgb'
		gb_2.show( ) //visible = true	
		gb_3.show( ) //visible = true	
		gb_6.show( ) //visible = true	
		gb_7.show( ) //visible = true	
		gb_8.show( ) //visible = true	
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		dw_3.show( ) //visible = true	
		dw_4.show( ) //visible = true	
	case '4dgb_1tp'				
		gb_6.show( ) //visible = true	
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		gb_2.show( ) //visible = true	
		gb_7.show( ) //visible = true	
//		dw_3.show( ) //visible = true		
		tab_1.show( ) //visible = true
//		gb_3.show( ) //visible = true	
//		gb_8.show( ) //visible = true	
//		dw_4.show( ) //visible = true
//		st_1.show( )
	case '5dgb_1tp'				
		gb_6.show( ) //visible = true	
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		gb_2.show( ) //visible = true	
		gb_7.show( ) //visible = true	
		dw_3.show( ) //visible = true		
		tab_1.show( ) //visible = true
		gb_3.show( ) //visible = true	
		gb_8.show( ) //visible = true	
		dw_4.show( ) //visible = true	
		gb_4.show( ) //visible = true	
		gb_9.show( ) //visible = true	
		dw_5.show( ) //visible = true	
//		st_1.show( )
	case '5dgb_1tp_1dh'				
		gb_6.show( ) //visible = true	
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		gb_2.show( ) //visible = true	
		gb_7.show( ) //visible = true	
		dw_3.show( ) //visible = true		
		tab_1.show( ) //visible = true
		gb_3.show( ) //visible = true	
		gb_8.show( ) //visible = true	
		dw_4.show( ) //visible = true	
		gb_4.show( ) //visible = true	
		gb_9.show( ) //visible = true	
		dw_5.show( ) //visible = true	
		dw_6.hide( ) // visible = false ẩn 1 dw
//		st_1.show( )
	case '2dgb_1tp'
		gb_2.show( ) //visible = true	
		gb_6.show( ) //visible = true	
//		gb_7.show( ) //visible = true	
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		tab_1.show( ) //visible = true
	case '2dgb_1tp_tax'
		gb_2.show( ) //visible = true	
		gb_6.show( ) //visible = true	
		gb_7.show( ) //visible = true	
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		tab_1.show( ) //visible = true 
		dw_3.show()
		cbx_1.show( )
	case '2dgb_1tp_tax_2d'
		gb_2.show( ) //visible = true	
		gb_6.show( ) //visible = true	
		gb_7.show( ) //visible = true	
		gb_3.show()
		gb_4.show( )	
		gb_8.show( )
		gb_9.show( )
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		tab_1.show( ) //visible = true 
		dw_3.show( )
		dw_4.show( )
		cbx_1.show( )
		
	case '6dgb_ext'
		gb_2.show( ) //visible = true	
		gb_3.show( ) //visible = true	
		gb_4.show( ) //visible = true		
		gb_6.show( ) //visible = true	
		gb_7.show( ) //visible = true	
		gb_8.show( ) //visible = true	
		gb_9.show( ) //visible = true	
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		dw_3.show( ) //visible = true	
		dw_4.show( ) //visible = true
		dw_5.show( ) //visible = true
		dw_6.show( ) //visible = true
	case '6dgb'
		gb_2.show( ) //visible = true	
		gb_3.show( ) //visible = true	
		gb_4.show( ) //visible = true	
		gb_5.show( ) //visible = true	
		gb_6.show( ) //visible = true	
		gb_7.show( ) //visible = true	
		gb_8.show( ) //visible = true	
		gb_9.show( ) //visible = true
		gb_12.show( ) //visible = true	
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		dw_3.show( ) //visible = true	
		dw_4.show( ) //visible = true
		dw_5.show( ) //visible = true		
		dw_6.show( ) //visible = true
	case '1dg_2gb_2df'
		gb_2.show( )
		gb_6.show( )
		gb_7.show( )
		dw_1.show( )
		dw_2.show( )
		dw_3.show( )
	case '3d_1tp'
		gb_2.show( )
		gb_6.show( )
		gb_7.show( )
		dw_1.show( )
		dw_2.show( )
		dw_3.show( )
		tab_1.show( )	
	case 'tb'
	case 'up_1d_lo_1d_1d'
		dw_1.show()
		dw_2.show()
		dw_3.show()
		gb_2.show()
		gb_1.show()
	case '1d3d'
		dw_1.show()
		dw_2.show()
		gb_2.show()		
		dw_3.show()
		dw_4.show()		
	case '1dr_1tb_2gb_1ddlb_1dl'
		dw_1.show( )
		dw_2.show( )
		tab_1.show( )
		gb_1.show( )
		gb_2.show( )
		ddlb_1.show( )
	case '3dgb'
		gb_2.show( )
		gb_6.show( )
		gb_7.show( )
		dw_1.show( )
		dw_2.show( )
		dw_3.show( )
	case 'up_gp_1d2d1tv_lo_tb'
		gb_6.show( ) //visible = true	
		gb_7.show( ) //visible = true	
		gb_8.show( ) //visible = true			
		dw_1.show()
		dw_2.show()
		dw_3.show()
		tv_1.show( )
		tab_1.show( )		
		gb_2.show()
		gb_1.show()		
		gb_10.show()			
	case 'up_gp_1d3d1tv_lo_tb'
		gb_6.show( ) //visible = true	
		gb_7.show( ) //visible = true	
		gb_8.show( ) //visible = true			
		gb_9.show( ) //visible = true			
		dw_1.show()
		dw_2.show()
		dw_3.show()
		dw_4.show()		
		tv_1.show( )
		tab_1.show( )		
		gb_2.show()
		gb_1.show()		
		gb_10.show()		
	case 'up_gp_2d1tv_lo_tb'
		gb_6.show( ) //visible = true	
		gb_7.show( ) //visible = true		
		dw_1.show()
		dw_2.show()
		tv_1.show( )
		tab_1.show( )		
		gb_2.show()
		gb_1.show()		
	case 'up_gp_2d_lo_tb'
		gb_6.show( ) //visible = true	
		gb_7.show( ) //visible = true		
		dw_1.show()
		dw_2.show()
		tab_1.show( )		
		gb_2.show()	
		cbx_1.show( )
	case '2dgb_1pc_1tp'
		gb_2.show( ) //visible = true	
		gb_6.show( ) //visible = true	
		dw_3.show( ) //visible = true	
		dw_1.show( ) //visible = true
		dw_2.show( ) //visible = true
		tab_1.show( ) //visible = true
	case '2d_3rb'
		dw_1.show( )
		gb_2.show( )
		dw_2.show( )
		rb_1.show( )
		rb_2.show( )
		rb_3.show( )
end choose

end subroutine

public function integer f_resize_2d ();
//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space)
dw_1.width = ii_resize_width - this.ii_vscrollbar
dw_1.height =  ii_upperpart_height * ii_resize_height

//-- resize horizontal line --//
gb_2.move( tab_action.x, dw_1.y + dw_1.height )
gb_2.width =  ii_resize_width - this.ii_vscrollbar
gb_2.height = 50

//-- resize dw_2 --//
dw_2.move( tab_action.x , gb_2.y + gb_2.height )
dw_2.width =  ii_resize_width - this.ii_vscrollbar
dw_2.height =  ii_resize_height  - gb_2.y - gb_2.height - this.ii_hscrollbar

return 1
end function

public function integer f_resize_1d_2d ();
//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_1.width = ii_leftpart_width
dw_1.height = ii_resize_height - (tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight) - this.ii_hscrollbar


//-- resize gb_1 --//
gb_1.move(dw_1.x + ii_leftpart_width, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
gb_1.height = ii_resize_height - (tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight) - this.ii_hscrollbar
gb_1.width = 24


//-- resize dw_2 --//
dw_2.move( gb_1.x + gb_1.width, tab_action.y + tab_action.height+ ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_2.width = ii_resize_width - gb_1.x - gb_1.width - this.ii_vscrollbar
dw_2.height = ii_upperpart_height

//-- resize horizontal line --//
gb_2.move( gb_1.x + gb_1.width, dw_2.y + dw_2.height )
gb_2.width = ii_resize_width - gb_1.x - gb_1.width - this.ii_vscrollbar
gb_2.height = 50

//-- resize dw_3 --//
dw_3.move( gb_1.x + gb_1.width , gb_2.y + gb_2.height )
dw_3.width =  ii_resize_width - gb_1.x - gb_1.width - this.ii_vscrollbar
dw_3.height =  ii_resize_height - gb_2.height - gb_2.y - this.ii_hscrollbar

return 1
end function

public function integer f_resize_1d_1dup_2d ();
//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_1.width = ii_leftpart_width * ii_resize_width
dw_1.height = ii_resize_height - (tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight) - this.ii_hscrollbar

//-- resize gb_1 --//
gb_1.move(ii_leftpart_width* ii_resize_width, dw_1.y )
gb_1.height = ii_resize_height  - (tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight) - this.ii_hscrollbar
gb_1.width = 24

//--resize dw_2--//
dw_2.move( gb_1.x + gb_1.width, dw_1.y)
dw_2.width = ii_resize_width - gb_1.x - gb_1.width - this.ii_vscrollbar
dw_2.height = ii_upperpart_height * ii_resize_height

//-- resize gb_2 --//
gb_2.move(gb_1.x + gb_1.width,dw_2.y + dw_2.height )
gb_2.height =50
gb_2.width = dw_2.width

//--resize dw_3--//
dw_3.move( dw_2.x , gb_2.y + gb_2.height )
dw_3.width = ii_midpart_width * ii_resize_width
//dw_3.height =  ii_resize_height - gb_2.y - gb_2.height - this.ii_hscrollbar
dw_3.height = dw_1.height - ii_upperpart_height * ii_resize_height

//-- resize gb_10 --//
gb_10.move( gb_1.x + gb_1.width + ii_midpart_width*ii_resize_width, gb_2.y + gb_2.height )
gb_10.height = ii_resize_height - gb_2.y - gb_2.height - this.ii_hscrollbar
gb_10.width = 24

//--resize dw_4--//
dw_4.move( gb_10.x + gb_10.width , dw_3.y )
dw_4.width = ii_resize_width  - gb_10.x + gb_10.width - this.ii_vscrollbar
dw_4.height = dw_3.height 

return 1
end function

public function integer f_resize_1d_3d ();
//-- resize dw_1 --//          
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_1.width = ii_leftpart_width
dw_1.height = ii_resize_height - (tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight) - this.ii_hscrollbar


//-- resize gb_1 --//
gb_1.move(dw_1.x + dw_1.width, dw_1.y)
gb_1.height = dw_1.height
gb_1.width = 24


//-- resize dw_2 --//
dw_2.move( gb_1.x + gb_1.width, dw_1.y )
dw_2.width =  ii_resize_width - gb_1.x - gb_1.width - this.ii_vscrollbar
dw_2.height = ii_upperpart_height


//-- resize dw_3 --//
dw_3.move( gb_1.x + gb_1.width , dw_2.y + dw_2.height )
dw_3.width =  dw_2.width
dw_3.height = ii_fixedpart1_height

//-- resize gb_2 --//
gb_2.move( gb_1.x + gb_1.width, dw_3.y + dw_3.height )
gb_2.width = dw_2.width
gb_2.height = 50

dw_4.move( gb_1.x + gb_1.width , gb_2.y + gb_2.height )
dw_4.width =  dw_2.width
dw_4.height =  ii_resize_height - (gb_2.y + gb_2.height ) - this.ii_hscrollbar

return 1
end function

public function integer f_resize_up_1d_lo_1d_2dgb ();
//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_1.width =  ii_resize_width - this.ii_vscrollbar 
dw_1.height = ii_upperpart_height

//-- resize gb_2 --//
gb_2.move(dw_1.x ,dw_1.y + dw_1.height )
gb_2.width = dw_1.width
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//--resize dw_2--//
dw_2.move( gb_2.x, gb_2.y + gb_2.height)
dw_2.width = ii_leftpart_width
dw_2.height = max(ii_resize_height - this.ii_vscrollbar  - gb_2.height - gb_2.y, 0)


//-- resize gb_1 --//
gb_1.move(dw_2.x + dw_2.width, gb_2.y + gb_2.height)
gb_1.height = max( ii_resize_height - this.ii_hscrollbar  - gb_2.height - gb_2.y, 0)
gb_1.width = 24

//-- resize gb_10 --//
gb_6.move( gb_1.x + gb_1.width, gb_2.y + gb_2.height )
gb_6.width =  max(ii_resize_width - this.ii_vscrollbar  - (gb_1.x+gb_1.width) , 0)
//gb_6.height = ii_gb_3_height + 65
if ii_gb_3_height = 0 then
	gb_6.height = ii_gb_3_height + 65
	dw_3.height = max(ii_gb_3_height - 25, 0)
else
	gb_6.height = ii_gb_3_height
	dw_3.height = max(ii_gb_3_height - 90, 0)
end if

//--resize dw_3--//
dw_3.move( gb_6.x + 25, gb_6.y + 75 )
dw_3.width = max(ii_resize_width - this.ii_vscrollbar - (gb_1.x+gb_1.width) - 50, 0)
//dw_3.height = max(ii_gb_3_height - 90, 0)

//-- resize gb_3 --//
gb_3.move(gb_6.x  + 25, gb_6.y + gb_6.height )
gb_3.width = gb_6.width
if gb_3.text = '^' then
	gb_3.height = 35
else
	gb_3.height = 50
end if

//--resize dw_4--//
dw_4.move( gb_6.x + 25, gb_3.y + gb_3.height )
dw_4.width = gb_3.width
dw_4.height =max( ii_resize_height - this.ii_hscrollbar  - gb_3.height - gb_3.y, 0)

return 1
end function

public subroutine f_set_visible_st_1 (boolean vb_visible);if vb_visible then
	st_1.show( )
else
	st_1.hide( )
end if
end subroutine

public function integer f_resize_3d ();
//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space)
dw_1.width = ii_resize_width - this.ii_vscrollbar
dw_1.height =  ii_upperpart_height

//-- resize horizontal line --//
gb_2.move( tab_action.x, dw_1.y + dw_1.height )
gb_2.width =   ii_resize_width - this.ii_vscrollbar
gb_2.height = 50

//-- resize dw_2 --//
dw_2.move( tab_action.x , gb_2.y + gb_2.height )
dw_2.width =  ii_resize_width - this.ii_vscrollbar
dw_2.height =  ii_gb_3_height

//-- resize horizontal line --//
gb_3.move( tab_action.x, dw_2.y + dw_2.height )
gb_3.width =   ii_resize_width - this.ii_vscrollbar
gb_3.height = 50

//-- resize dw_2 --//
dw_3.move( tab_action.x , gb_3.y + gb_3.height )
dw_3.width =  ii_resize_width - this.ii_vscrollbar
dw_3.height =   ii_resize_height - this.ii_hscrollbar - gb_3.y - gb_3.height

return 1
end function

public function integer f_resize_1tv_2d ();
//-- resize tv_1 --//
tv_1.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
tv_1.width = ii_leftpart_width
tv_1.height = ii_resize_height - (tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight) - this.ii_hscrollbar 

//-- resize gb_1 --//
gb_1.move(tv_1.x + ii_leftpart_width, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
gb_1.height = ii_resize_height  - (tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight) - this.ii_hscrollbar 
gb_1.width = 24


//-- resize dw_1 --//
dw_1.move( gb_1.x + gb_1.width + 5, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_1.width =  ii_resize_width - gb_1.x - gb_1.width  - this.ii_vscrollbar 
dw_1.height =  this.ii_upperpart_height

//-- resize horizontal line --//
gb_2.move(  gb_1.x + gb_1.width + 5, dw_1.y + dw_1.height )
gb_2.width =  ii_resize_width - gb_1.x - gb_1.width  - this.ii_vscrollbar 
gb_2.height = 50

//-- resize dw_2 --//
dw_2.move( gb_1.x + gb_1.width + 5, gb_2.y + gb_2.height )
dw_2.width =  ii_resize_width - gb_1.x - gb_1.width  - this.ii_vscrollbar 
dw_2.height =  ii_resize_height - gb_2.y - gb_2.height - this.ii_hscrollbar 


return 1
end function

public function integer f_resize_1tv_up1d_1d_lo1d ();
//-- resize tv_1 --//
tv_1.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
tv_1.width = ii_leftpart_width * ii_resize_width
tv_1.height = ii_resize_height  - (tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight) - this.ii_hscrollbar

//-- resize gb_1 --//
gb_1.move(tv_1.x + ii_leftpart_width * ii_resize_width, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
gb_1.height =  ii_resize_height - (tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight) - this.ii_hscrollbar
gb_1.width = 24

//-- resize dw_1 --//
dw_1.move( gb_1.x + gb_1.width , tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_1.width = this.ii_midpart_width * ii_resize_width
dw_1.height =  this.ii_upperpart_height * ii_resize_height

//-- resize gb_10 --//
gb_10.move(gb_1.x + gb_1.width + ii_midpart_width * ii_resize_width, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
gb_10.height = this.ii_upperpart_height * ii_resize_height
gb_10.width = 24

//-- resize dw_2 --//
dw_2.move( gb_10.x + gb_10.width , tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_2.width =  ii_resize_width - gb_10.x - gb_10.width - this.ii_vscrollbar
dw_2.height = this.ii_upperpart_height * ii_resize_height


//-- resize horizontal line --//
gb_2.move(  gb_1.x + gb_1.width , dw_1.y + dw_1.height )
gb_2.width =   ii_resize_width - gb_1.x - gb_1.width  - this.ii_vscrollbar
gb_2.height = 50

//-- resize dw_3 --//
dw_3.move( gb_1.x + gb_1.width , gb_2.y + gb_2.height )
dw_3.width = ii_resize_width - gb_1.x - gb_1.width  - this.ii_vscrollbar
dw_3.height =ii_resize_height - gb_2.y - gb_2.height  - this.ii_hscrollbar


return 1
end function

public function integer f_resize_2ddlb_1tv_up1d1d_mid1d1d_lo1d ();// resize ddlb--//
ddlb_1.move(tab_action.x, tab_action.y + tab_action.height + ii_filter_space + ii_text_spaceheight)
ddlb_2.move(ddlb_1.x + ddlb_1.width , tab_action.y + tab_action.height + ii_filter_space + ii_text_spaceheight)

//-- resize tv_1 --//
tv_1.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
tv_1.width = ii_leftpart_width
tv_1.height = ii_resize_height  - (tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight) - this.ii_hscrollbar

//-- resize gb_1 --//
gb_1.move(tv_1.x + ii_leftpart_width, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
gb_1.height = ii_resize_height - (tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight) - this.ii_hscrollbar
gb_1.width = 24

//-- resize dw_1 --//
dw_1.move( gb_1.x + gb_1.width , tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_1.width = this.ii_midpart_width 
dw_1.height =  this.ii_upperpart_height

//-- resize gb_10 --//
gb_10.move(gb_1.x + gb_1.width + ii_midpart_width, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
gb_10.height = this.ii_upperpart_height
gb_10.width = 24

//-- resize dw_2 --//
dw_2.move( gb_10.x + gb_10.width , tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_2.width = ii_resize_width - gb_10.x - gb_10.width - this.ii_vscrollbar
dw_2.height = this.ii_upperpart_height

//-- resize gb_2 --//
gb_2.move(dw_1.x ,dw_1.y + dw_1.height )
gb_2.height =50
gb_2.width =  ii_resize_width - gb_1.x - gb_1.width  - this.ii_vscrollbar

//--resize dw_3--//
dw_3.move( dw_1.x , gb_2.y + gb_2.height )
dw_3.width = ii_gb_11_width
dw_3.height = ii_gb_3_height

//-- resize gb_11 --//
gb_11.move(gb_1.x + gb_1.width + ii_gb_11_width, gb_2.y + gb_2.height)
gb_11.height = this.ii_gb_3_height
gb_11.width = 24

//-- resize dw_4 --//
dw_4.move( gb_11.x + gb_11.width , gb_2.y + gb_2.height)
dw_4.width = ii_resize_width - gb_11.x - gb_11.width  - this.ii_vscrollbar
dw_4.height = this.ii_gb_3_height

//-- resize gb_3 --//
gb_3.move(dw_1.x  , dw_3.y + dw_3.height )
gb_3.height =50
gb_3.width =  ii_resize_width - gb_1.x - gb_1.width - this.ii_vscrollbar

//-- resize dw_4 --//
dw_5.move( dw_1.x , gb_3.y + gb_3.height )
dw_5.width =   ii_resize_width  - gb_1.x - gb_1.width - this.ii_vscrollbar
dw_5.height =  ii_resize_height - (gb_3.y + gb_3.height)  - this.ii_hscrollbar

return 1
end function

public function dropdownlistbox f_get_ddlb1 ();return ddlb_1
end function

public function dropdownlistbox f_get_ddlb2 ();return ddlb_2
end function

public subroutine f_set_text_cbx_1 (string vs_text, boolean vb_checked);this.cbx_1.text = vs_text
this.cbx_1.checked = vb_checked
end subroutine

public subroutine f_set_text_cbx_2 (string vs_text, boolean vb_checked);this.cbx_2.text = vs_text
this.cbx_2.checked = vb_checked
end subroutine

public function integer f_resize_2ddlb_2d ();// resize ddlb--//
ddlb_1.move(tab_action.x, tab_action.y + tab_action.height + ii_filter_space + ii_text_spaceheight)
ddlb_2.move(tab_action.x + ddlb_1.width , tab_action.y + tab_action.height + ii_filter_space + ii_text_spaceheight)


//-- resize dw_1 --//
dw_1.move( tab_action.x , tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_1.width =  ii_resize_width - this.ii_vscrollbar
dw_1.height =  this.ii_upperpart_height

//-- resize gb_2 --//
gb_2.move(tab_action.x ,dw_1.y + dw_1.height )
gb_2.height =50
gb_2.width =   ii_resize_width - this.ii_vscrollbar

//-- resize dw_2 --//
dw_2.move( tab_action.x ,gb_2.y + gb_2.height )
dw_2.width =   ii_resize_width - this.ii_vscrollbar
dw_2.height = ii_resize_height - gb_2.y - gb_2.height - this.ii_hscrollbar

return 1
end function

public function integer f_resize_1d_1d ();
//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_1.width = ii_leftpart_width*ii_resize_width
dw_1.height = ii_resize_height - (tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight) - this.ii_hscrollbar


//-- resize gb_1 --//
gb_1.move(dw_1.x + dw_1.width, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
gb_1.height = ii_resize_height - (tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight) - this.ii_hscrollbar
gb_1.width = 24


//-- resize dw_2 --//
dw_2.move( gb_1.x + gb_1.width, tab_action.y + tab_action.height+ ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_2.width =  ii_resize_width - gb_1.x - gb_1.width  - this.ii_vscrollbar
dw_2.height = ii_resize_height - (tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight) - this.ii_hscrollbar

return 1
end function

public function integer f_resize_1ddlb_1d_1tp ();//--resize ddlb_1--//
ii_text_spaceheight = 0
ddlb_1.move(tab_action.x, tab_action.y + tab_action.height )
ddlb_1.width = ii_midpart_width + 200
ddlb_1.height = 500

//--resize htb_1--//
htb_1.move( ddlb_1.x + ddlb_1.width , ddlb_1.y)
htb_1.height = ii_spare_space
htb_1.width = ii_midpart_width

//--resize sle_1--//
sle_1.move( htb_1.x + htb_1.width , htb_1.y)
sle_1.width = 130
sle_1.height =  ii_spare_space

//--resize st_2--//
st_2.move( sle_1.x + sle_1.width + 20, htb_1.y+10)
st_2.width = 100
st_2.height = ii_spare_space
st_2.text = '%'

//--resize cbx_1--//
cbx_1.move(st_2.x + st_2.width , htb_1.y )
cbx_1.height = ii_spare_space
cbx_1.width = ii_leftpart_width - 50

//--resize cbx_1--//
cbx_2.move(cbx_1.x + cbx_1.width , htb_1.y )
cbx_2.width = ii_leftpart_width - 50
cbx_2.height = ii_spare_space

//--resize st_1--//
st_1.width =  ii_resize_width - ddlb_1.width - htb_1.width - sle_1.width - cbx_1.width - cbx_2.width - this.ii_vscrollbar 
st_1.move( cbx_2.x + cbx_2.width , htb_1.y)
st_1.height = ii_spare_space

//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space)
dw_1.width = ii_resize_width - this.ii_vscrollbar 
dw_1.height =  ii_upperpart_height 

//-- resize horizontal line --//
gb_2.move( tab_action.x,dw_1.y + dw_1.height )
gb_2.width =  ii_resize_width - this.ii_vscrollbar 
gb_2.height = 50

//-- resize dw_2 --//
tab_1.move( tab_action.x , gb_2.y + gb_2.height )
tab_1.width = ii_resize_width - this.ii_vscrollbar 
tab_1.height =   ii_resize_height - gb_2.y - gb_2.height - this.ii_hscrollbar 

return 1
end function

public subroutine f_set_st_1_text (string vs_text, string vs_dwo_name);st_1.text = vs_text + vs_dwo_name
end subroutine

public function t_sle f_get_sle_1 ();return sle_1
end function

public function t_cbx f_get_cbx (string vs_idx);string		ls_name_cbx

ls_name_cbx = 'cbx_'+vs_idx
choose case ls_name_cbx
	case 'cbx_1' 
		return cbx_1
	case 'cbx_2' 
		return cbx_2
end choose

end function

public function t_htb f_get_htb ();return htb_1
end function

public function integer f_resize_1tv_up1d_1d_lo2d ();
//-- resize tv_1 --//
tv_1.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
tv_1.width = ii_leftpart_width
tv_1.height =  ii_resize_height - (tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight) - this.ii_hscrollbar

//-- resize gb_1 --//
gb_1.move(tv_1.x + ii_leftpart_width, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
gb_1.height =  ii_resize_height - (tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight) - this.ii_hscrollbar
gb_1.width = 24

//-- resize dw_1 --//
dw_1.move( gb_1.x + gb_1.width , tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_1.width = this.ii_midpart_width 
dw_1.height =  this.ii_upperpart_height

//-- resize gb_10 --//
gb_10.move(gb_1.x + gb_1.width + ii_midpart_width, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
gb_10.height = this.ii_upperpart_height
gb_10.width = 24

//-- resize dw_2 --//
dw_2.move( gb_10.x + gb_10.width , tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_2.width = ii_resize_width - gb_10.x - gb_10.width - this.ii_vscrollbar
dw_2.height = this.ii_upperpart_height


//-- resize horizontal line gb2 --//
gb_2.move(  gb_1.x + gb_1.width , dw_1.y + dw_1.height )
gb_2.width = ii_resize_width - gb_1.x - gb_1.width - this.ii_vscrollbar
gb_2.height = 50

//-- resize dw_3 --//
dw_3.move( gb_1.x + gb_1.width , gb_2.y + gb_2.height )
dw_3.width = ii_resize_width - gb_1.x - gb_1.width - this.ii_vscrollbar
dw_3.height = ii_gb_3_height

//-- resize horizontal line gb3 --//
gb_3.move(  gb_1.x + gb_1.width , dw_3.y + dw_3.height )
gb_3.width =  ii_resize_width - gb_1.x - gb_1.width - this.ii_vscrollbar
gb_3.height = 50

//-- resize dw_4 --//
dw_4.move( gb_1.x + gb_1.width , gb_3.y + gb_3.height )
dw_4.width =  ii_resize_width - gb_1.x - gb_1.width  - this.ii_vscrollbar
dw_4.height =  ii_resize_height - gb_3.y - gb_3.height  - this.ii_hscrollbar

return 1
end function

public function integer f_resize_1tv_up1d_mid1d_lo1d1d ();
//-- resize tv_1 --//
tv_1.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
tv_1.width = ii_leftpart_width
tv_1.height = ii_resize_height - (tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight) - this.ii_hscrollbar

//-- resize gb_1 --//
gb_1.move(tv_1.x + ii_leftpart_width, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
gb_1.height = ii_resize_height - (tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight) - this.ii_hscrollbar
gb_1.width = 24

//-- resize dw_1 --//
dw_1.move( gb_1.x + gb_1.width , tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_1.width = ii_resize_width - gb_1.x - gb_1.width - this.ii_vscrollbar
dw_1.height =  this.ii_upperpart_height

//-- resize horizontal line gb2 --//
gb_2.move(  gb_1.x + gb_1.width , dw_1.y + dw_1.height )
gb_2.width =  ii_resize_width - gb_1.x - gb_1.width - this.ii_vscrollbar
gb_2.height = 50

//-- resize dw_2 --//
dw_2.move( gb_1.x + gb_1.width , gb_2.y + + gb_2.height)
dw_2.width = ii_resize_width - gb_1.x - gb_1.width  - this.ii_vscrollbar
dw_2.height = ii_gb_3_height


//-- resize horizontal line gb3 --//
gb_3.move(  gb_1.x + gb_1.width , dw_2.y + dw_2.height )
gb_3.width =  ii_resize_width - gb_1.x - gb_1.width  - this.ii_vscrollbar
gb_3.height = 50

//-- resize dw_3 --//
dw_3.move( gb_1.x + gb_1.width , gb_3.y + gb_3.height )
dw_3.width = ii_midpart_width
dw_3.height = ii_resize_height - gb_3.y - gb_3.height  - this.ii_hscrollbar

//-- resize gb_10 --//
gb_10.move(gb_1.x + gb_1.width + ii_midpart_width,gb_3.y + gb_3.height)
gb_10.height = dw_3.height
gb_10.width = 24

//-- resize dw_4 --//
dw_4.move( gb_10.x + gb_10.width , gb_3.y + gb_3.height )
dw_4.width =ii_resize_width - gb_10.x - gb_10.width  - this.ii_hscrollbar
dw_4.height = dw_3.height 

return 1
end function

public function integer f_resize_6dgb ();
//-- resize gb_6 --//
gb_6.move( tab_action.x, tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space)
gb_6.width = ii_resize_width - this.ii_vscrollbar
if ii_upperpart_height = 0 then
	gb_6.height = ii_upperpart_height + 65
	dw_1.height = max(ii_upperpart_height - ii_fixedpart2_height - 25, 0)
else
	gb_6.height = ii_upperpart_height
	dw_1.height = max(ii_upperpart_height - ii_fixedpart2_height - 90, 0)
end if

//-- resize dw_1 --//
dw_1.move(  gb_6.x + 25, gb_6.y + 75 )
dw_1.width =  ii_resize_width - this.ii_vscrollbar - 50

//--resize dw_2--//
dw_2.move( gb_6.x + 25, dw_1.y + dw_1.height )
dw_2.width =  ii_resize_width - this.ii_vscrollbar  - 50
dw_2.height = min(ii_fixedpart2_height ,ii_upperpart_height)

//-- resize horizontal line --//
gb_2.move( tab_action.x, gb_6.y + gb_6.height )
gb_2.width =  ii_resize_width - this.ii_vscrollbar 
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//-- resize gb_7 --//
gb_7.move( gb_2.x , gb_2.y + gb_2.height )
gb_7.width =   ii_resize_width - this.ii_vscrollbar 
if ii_gb_3_height = 0 then
	gb_7.height = ii_gb_3_height  + 65
	dw_3.height = max(ii_gb_3_height - 25,0)
else
	gb_7.height = ii_gb_3_height 
	dw_3.height = max(ii_gb_3_height - 90,0)
end if

//-- resize dw_3 --//
dw_3.move(gb_7.x + 25, gb_7.y + 75 )
dw_3.width =   ii_resize_width - this.ii_vscrollbar - 50

//-- resize horizontal line --//
gb_3.move( tab_action.x, gb_7.y + gb_7.height )
gb_3.width =  ii_resize_width - this.ii_vscrollbar
if gb_3.text = '^' then
	gb_3.height = 35
else
	gb_3.height = 50
end if

//-- resize gb_8 --//
gb_8.move( gb_3.x , gb_3.y + gb_3.height )
gb_8.width =  ii_resize_width - this.ii_vscrollbar
if ii_gb_4_height = 0 then
	gb_8.height  =  ii_gb_4_height + 65
	dw_4.height =  max(ii_gb_4_height - 25 , 0)
else
	gb_8.height  =  ii_gb_4_height
	dw_4.height =  max(ii_gb_4_height - 90 , 0)
end if

//-- resize dw_4 --//
dw_4.move(gb_8.x + 25, gb_8.y + 75 )
dw_4.width =  ii_resize_width - this.ii_vscrollbar - 50

//-- resize horizontal line --//
gb_4.move( tab_action.x, gb_8.y + gb_8.height )
gb_4.width =   ii_resize_width - this.ii_vscrollbar 
if gb_4.text = '^' then
	gb_4.height = 40
else
	gb_4.height = 50
end if

//-- resize gb_9 --//
gb_9.move( gb_4.x , gb_4.y + gb_4.height )
gb_9.width = ii_resize_width - this.ii_vscrollbar 
if ii_gb_5_height = 0 then
	gb_9.height  =  ii_gb_5_height + 65
	dw_5.height =  max(ii_gb_5_height - 25 , 0)
else
	gb_9.height  =  ii_gb_5_height
	dw_5.height =  max(ii_gb_5_height - 90 , 0)
end if

//-- resize dw_5 --//
dw_5.move(gb_9.x + 25, gb_9.y + 75 )
dw_5.width = ii_resize_width - this.ii_vscrollbar  - 55

//-- resize horizontal line --//
gb_5.move( tab_action.x, gb_9.y + gb_9.height )
gb_5.width =   ii_resize_width - this.ii_vscrollbar
if gb_5.text = '^' then
	gb_5.height = 35
else
	gb_5.height = 50
end if

//-- resize gb_12 --//
gb_12.move( gb_5.x , gb_5.y + gb_5.height )
gb_12.width = ii_resize_width - this.ii_vscrollbar
gb_12.height =  max(ii_resize_height - this.ii_hscrollbar - (gb_5.y + gb_5.height ),0)

//-- resize dw_6 --//
dw_6.move(gb_12.x + 25, gb_12.y + 75 )
dw_6.width = ii_resize_width - this.ii_vscrollbar - 50
dw_6.height = max(gb_12.height - 90, 0)

return 1
end function

public function integer f_resize_5dgb ();
//-- resize gb_6 --//
gb_6.move( tab_action.x, tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space)
gb_6.width = ii_resize_width - this.ii_vscrollbar
if ii_upperpart_height = 0 then
	gb_6.height = ii_upperpart_height + 65
	dw_1.height = max(ii_upperpart_height - ii_fixedpart2_height - 25, 0)
else
	gb_6.height = ii_upperpart_height
	dw_1.height = max(ii_upperpart_height - ii_fixedpart2_height - 90, 0)
end if

//-- resize dw_1 --//
dw_1.move(gb_6.x + 25, gb_6.y + 75)
dw_1.width =  ii_resize_width - this.ii_vscrollbar - 50

//--resize dw_2--//
dw_2.move( gb_6.x + 25, dw_1.y + dw_1.height )
dw_2.width = ii_resize_width - this.ii_vscrollbar - 50
dw_2.height = min(ii_fixedpart2_height ,ii_upperpart_height)

//-- resize horizontal line --//
gb_2.move( tab_action.x, gb_6.height + gb_6.y)
gb_2.width =  ii_resize_width - this.ii_vscrollbar
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//-- resize gb_7 --//
gb_7.move( gb_2.x , gb_2.y + gb_2.height )
gb_7.width = ii_resize_width - this.ii_vscrollbar
if ii_gb_3_height = 0 then
	gb_7.height = ii_gb_3_height  + 65
	dw_3.height = max(ii_gb_3_height - 25,0)
else
	gb_7.height = ii_gb_3_height 
	dw_3.height = max(ii_gb_3_height - 90,0)
end if

//-- resize dw_3 --//
dw_3.move(gb_7.x + 25, gb_7.y + 75 )
dw_3.width =ii_resize_width - this.ii_vscrollbar - 50


//-- resize horizontal line --//
gb_3.move( tab_action.x, gb_7.y + gb_7.height )
gb_3.width = ii_resize_width - this.ii_vscrollbar
if gb_3.text = '^' then
	gb_3.height = 35
else
	gb_3.height = 50
end if

//-- resize gb_8 --//
gb_8.move( gb_3.x , gb_3.y + gb_3.height )
gb_8.width = ii_resize_width - this.ii_vscrollbar
if ii_gb_4_height = 0 then
	gb_8.height  =  ii_gb_4_height + 65
	dw_4.height =  max(ii_gb_4_height - 25 , 0)
else
	gb_8.height  =  ii_gb_4_height
	dw_4.height =  max(ii_gb_4_height - 90 , 0)
end if

//-- resize dw_4 --//
dw_4.move(gb_8.x + 25, gb_8.y + 75 )
dw_4.width = ii_resize_width - this.ii_vscrollbar - 50


//-- resize horizontal line --//
gb_4.move( tab_action.x, gb_8.y + gb_8.height )
gb_4.width = ii_resize_width - this.ii_vscrollbar
if gb_4.text = '^' then
	gb_4.height = 35
else
	gb_4.height = 50
end if

//-- resize gb_9 --//
gb_9.move( gb_4.x , gb_4.y + gb_4.height )
gb_9.width = ii_resize_width - this.ii_vscrollbar
gb_9.height  =  max(ii_resize_height - this.ii_hscrollbar - (gb_4.y + gb_4.height) , 0)

//-- resize dw_5 --//
dw_5.move(gb_9.x + 25, gb_9.y + 75 )
dw_5.width = ii_resize_width - this.ii_vscrollbar - 50
dw_5.height =  max(gb_9.height - 90 , 0)

return 1
end function

public function integer f_resize_4dgb ();
//-- resize gb_6 --//
gb_6.move( tab_action.x, tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space)
gb_6.width = ii_resize_width - this.ii_vscrollbar

//-- resize dw_1 --//
if ii_upperpart_height * ii_resize_height = 0 then
	gb_6.height = ii_upperpart_height  * ii_resize_height + 65
	dw_1.height = max(ii_upperpart_height * ii_resize_height - ii_fixedpart2_height * ii_resize_height - 25, 0)
else
	gb_6.height = ii_upperpart_height  * ii_resize_height
	dw_1.height = max(ii_upperpart_height  * ii_resize_height  - ii_fixedpart2_height  * ii_resize_height - 90, 0)
end if
dw_1.move(gb_6.x + 25, gb_6.y + 75)
dw_1.width =  ii_resize_width - this.ii_vscrollbar - 50

//--resize dw_2--//
dw_2.move( gb_6.x + 25, dw_1.y + dw_1.height )
dw_2.width = ii_resize_width - this.ii_vscrollbar - 50
dw_2.height = min(ii_fixedpart2_height * ii_resize_height ,ii_upperpart_height * ii_resize_height)

//-- resize horizontal line --//
gb_2.move( tab_action.x, gb_6.height + gb_6.y)
gb_2.width =  ii_resize_width - this.ii_vscrollbar
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//-- resize gb_7 --//
gb_7.move( gb_2.x , gb_2.y + gb_2.height )
gb_7.width = ii_resize_width - this.ii_vscrollbar
if ii_gb_3_height * ii_resize_height = 0 then
	gb_7.height = ii_gb_3_height * ii_resize_height  + 65
	dw_3.height = max(ii_gb_3_height * ii_resize_height  - 25,0)
else
	gb_7.height = ii_gb_3_height * ii_resize_height 
	dw_3.height = max(ii_gb_3_height * ii_resize_height  - 90,0)
end if

//-- resize dw_3 --//
dw_3.move(gb_7.x + 25, gb_7.y + 75 )
dw_3.width =ii_resize_width - this.ii_vscrollbar - 50

//-- resize horizontal line --//
gb_3.move( tab_action.x, gb_7.y + gb_7.height )
gb_3.width = ii_resize_width - this.ii_vscrollbar
if gb_3.text = '^' then
	gb_3.height = 35
else
	gb_3.height = 50
end if

//-- resize gb_8 --//
gb_8.move( gb_3.x , gb_3.y + gb_3.height )
gb_8.width = ii_resize_width - this.ii_vscrollbar
gb_8.height  =  max(ii_resize_height - this.ii_hscrollbar - (gb_3.y + gb_3.height) , 0)

//-- resize dw_4 --//
dw_4.move(gb_8.x + 25, gb_8.y + 75 )
dw_4.width = ii_resize_width - this.ii_vscrollbar - 50
dw_4.height = max(gb_8.height - 90 , 0)

return 1
end function

public function integer f_resize_up_1d_4d_lo_tb ();
//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_1.width = ii_leftpart_width
dw_1.height = ii_upperpart_height 

//-- resize gb_1 --//
gb_1.move(dw_1.x + ii_leftpart_width, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
gb_1.height = ii_upperpart_height
gb_1.width = 24

//-- resize dw_2 --//
dw_2.move( gb_1.x + gb_1.width + 5, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_2.width =   ii_resize_width - this.ii_vscrollbar - gb_1.x - gb_1.width 
dw_2.height = dw_2.f_getheight(1 ) // min( ii_fixedpart1_height, ii_upperpart_height)

//-- resize dw_3 --//
dw_3.move( gb_1.x + gb_1.width + 5, dw_2.y + dw_2.height )
dw_3.width =   ii_resize_width - this.ii_vscrollbar - gb_1.x - gb_1.width 
dw_3.height =  dw_3.f_getheight( 1) //min(ii_fixedpart2_height, ii_upperpart_height - ii_fixedpart1_height)

//-- resize dw_4 --//
dw_4.move( gb_1.x + gb_1.width + 5, dw_3.y + dw_3.height )
dw_4.width =    ii_resize_width - this.ii_vscrollbar - gb_1.x - gb_1.width 
dw_4.height = ii_fixedpart2_height //max( ii_upperpart_height - ii_fixedpart1_height - ii_fixedpart1_height - ii_fixedpart2_height, 0)

//-- resize dw_5 --//
dw_5.move( gb_1.x + gb_1.width + 5, dw_4.y + dw_4.height )
dw_5.width =   ii_resize_width - this.ii_vscrollbar - gb_1.x - gb_1.width 
dw_5.height = max(ii_fixedpart1_height, ii_upperpart_height - dw_2.height  - dw_4.height -  dw_3.height  )

//-- resize horizontal line --//
gb_2.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight + ii_upperpart_height )

gb_2.width =   ii_resize_width - this.ii_vscrollbar
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//-- resize tab --//
tab_1.move( tab_action.x , gb_2.y + gb_2.height )
tab_1.width =   ii_resize_width - this.ii_vscrollbar
tab_1.height =  max(ii_resize_height - this.ii_hscrollbar - (gb_2.y + gb_2.height ), 0)		

return 1
end function

public function groupbox f_get_groupbox (string vs_gb_name);groupbox 	l_gb

choose case vs_gb_name
	case 'gb_6' 
		return gb_6
	case 'gb_7'
		return gb_7
	case 'gb_8'
		return gb_8
	case 'gb_9'
		return gb_9
	case 'gb_12'
		return gb_12
	case else
		return l_gb
end choose
end function

public function integer f_resize_6dgb_ext ();int	 li_group_text_height = 65, li_upper_height

//-- resize gb_6 --//
li_upper_height = tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space
gb_6.move( tab_action.x, li_upper_height)
gb_6.width =  ii_resize_width - this.ii_vscrollbar
if ii_upperpart_height = 0 then
	gb_6.height = ii_upperpart_height + 65
	dw_1.height = max(ii_upperpart_height - ii_fixedpart2_height - 25, 0)
else
	gb_6.height = ii_upperpart_height
	dw_1.height = max(ii_upperpart_height - ii_fixedpart2_height - 90, 0)
end if

//-- resize dw_1 --//
dw_1.move(gb_6.x + 25, gb_6.y + 75)
dw_1.width = ii_resize_width - this.ii_vscrollbar - 50

//--resize dw_2--//
dw_2.move( gb_6.x + 25, dw_1.y + dw_1.height )
dw_2.width = ii_resize_width - this.ii_vscrollbar - 50
dw_2.height = min(ii_fixedpart2_height ,ii_upperpart_height)

//-- resize horizontal line --//
if ii_upperpart_height = 0 then
	li_upper_height += li_group_text_height
else
	li_upper_height += ii_upperpart_height 
end if
gb_2.move( tab_action.x, li_upper_height)
gb_2.width = ii_resize_width - this.ii_vscrollbar
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//-- resize gb_7 --//
gb_7.move( gb_2.x , gb_2.y + gb_2.height )
gb_7.width = ii_resize_width - this.ii_vscrollbar
if ii_gb_3_height = 0 then
	gb_7.height = ii_gb_3_height  + 65
	dw_3.height = max(ii_gb_3_height - ii_fixedpart3_height - 25,0)
else
	gb_7.height = ii_gb_3_height 
	dw_3.height = max(ii_gb_3_height - ii_fixedpart3_height - 90,0)
end if

//-- resize dw_3 --//
dw_3.move(gb_7.x + 25, gb_7.y + 75)
dw_3.width = ii_resize_width - this.ii_vscrollbar - 50

//-- resize dw_4 --//
dw_4.move(gb_7.x + 25, dw_3.y + dw_3.height)
dw_4.width = ii_resize_width - this.ii_vscrollbar - 50
dw_4.height = min(ii_fixedpart3_height, ii_gb_3_height)

//-- resize horizontal line --//
if ii_gb_3_height = 0 then
	li_upper_height += gb_2.height + li_group_text_height
else
	li_upper_height += gb_2.height + ii_gb_3_height 
end if
gb_3.move( tab_action.x, li_upper_height )
gb_3.width =  ii_resize_width - this.ii_vscrollbar
if gb_3.text = '^' then
	gb_3.height = 35
else
	gb_3.height = 50
end if

//-- resize gb_8 --//
gb_8.move( gb_3.x , gb_3.y + gb_3.height )
gb_8.width =  ii_resize_width - this.ii_vscrollbar
if ii_gb_4_height = 0 then
	gb_8.height  =  ii_gb_4_height + 65
	dw_5.height =  max(ii_gb_4_height - 25 , 0)
else
	gb_8.height  =  ii_gb_4_height
	dw_5.height =  max(ii_gb_4_height - 90 , 0)
end if

//-- resize dw_5 --//
dw_5.move(gb_8.x + 25, gb_8.y + 75 )
dw_5.width = ii_resize_width - this.ii_vscrollbar - 50

//-- resize horizontal line --//
if ii_gb_4_height = 0 then
	li_upper_height += gb_3.height +li_group_text_height
else
	li_upper_height += gb_3.height + ii_gb_4_height 
end if
gb_4.move( tab_action.x, li_upper_height)
gb_4.width =  ii_resize_width - this.ii_vscrollbar
if gb_4.text = '^' then
	gb_4.height = 35
else
	gb_4.height = 50
end if

//-- resize gb_9 --//
gb_9.move( gb_4.x , gb_4.y + gb_4.height )
gb_9.width = ii_resize_width - this.ii_vscrollbar
if ii_gb_5_height = 0 then
	gb_9.height  =  ii_gb_5_height + 65
	dw_6.height =  max(ii_gb_5_height - 25 , 0)
else
	gb_9.height  =  ii_gb_5_height
	dw_6.height =  max(ii_gb_5_height - 90 , 0)
end if

//-- resize dw_6 --//
dw_6.move(gb_9.x + 25, gb_9.y + 65 )
dw_6.width = ii_resize_width - this.ii_vscrollbar - 50

return 1
end function

public function integer f_resize_up_1d_lo_2d ();
//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_1.width = ii_resize_width - this.ii_vscrollbar
dw_1.height =  ii_upperpart_height

//-- resize horizontal line --//
gb_2.move( dw_1.x , dw_1.y + dw_1.height )
gb_2.width = ii_resize_width - this.ii_vscrollbar
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//-- resize dw_2 --//
dw_2.move( gb_2.x , gb_2.y + gb_2.height)
dw_2.width = ii_resize_width - this.ii_vscrollbar
dw_2.height = ii_fixedpart1_height


//-- resize dw_3 --//
dw_3.move( dw_2.x  , dw_2.y + dw_2.height )
dw_3.width =  ii_resize_width - this.ii_vscrollbar
dw_3.height =  ii_resize_height - dw_2.y - dw_2.height

return 1
end function

public function integer f_update_userprofile ();c_dwservice			lc_dwservice
connect using it_transaction;
if lc_dwservice.f_update_dwtabseq_ex( ic_obj_handling, dw_1, iadw_none_md[], it_transaction ) = -1 then
	disconnect using it_transaction;
	return -1
end if
if lc_dwservice.f_update_resize_parm_ex( ic_obj_handling, it_transaction) = -1 then
	disconnect using it_transaction;
	return -1
end if
disconnect using it_transaction;
return 1
end function

public subroutine f_resize_4dgb_1tp ();int	 li_group_text_height = 65, li_upper_height

//-- resize gb_6 --//
li_upper_height = tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space
gb_6.move( tab_action.x, li_upper_height)
gb_6.width = ii_resize_width - this.ii_vscrollbar
if ii_upperpart_height = 0 then
	gb_6.height = ii_upperpart_height + 65
	dw_1.height = max(ii_upperpart_height - ii_fixedpart2_height - 25, 0)
else
	gb_6.height = ii_upperpart_height
	dw_1.height = max(ii_upperpart_height - ii_fixedpart2_height - 90, 0)
end if

//-- resize dw_1 --//
dw_1.move(gb_6.x + 25, gb_6.y + 75)
dw_1.width =  ii_resize_width - this.ii_vscrollbar - 50

//--resize dw_2--//
dw_2.move( gb_6.x + 25, dw_1.y + dw_1.height )
dw_2.width = ii_resize_width - this.ii_vscrollbar - 50
dw_2.height = min(ii_fixedpart2_height ,ii_upperpart_height)

//-- resize horizontal line --//
if ii_upperpart_height = 0 then
	li_upper_height += li_group_text_height
else
	li_upper_height += ii_upperpart_height 
end if
gb_2.move( tab_action.x, li_upper_height)
gb_2.width =  ii_resize_width - this.ii_vscrollbar
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//-- resize gb_7 --//
gb_7.move( gb_2.x , gb_2.y + gb_2.height )
gb_7.width = ii_resize_width - this.ii_vscrollbar
gb_7.height = max(ii_resize_height - this.ii_hscrollbar - (gb_2.y + gb_2.height) , 0)

//-- resize dw_3 --//
dw_3.move(gb_7.x + 25, gb_7.y + 75 )
dw_3.width =ii_resize_width - this.ii_vscrollbar - 50 - ii_leftpart_width
dw_3.height = min(ii_fixedpart3_height ,ii_gb_3_height)

////--resize st_1--////
//st_1.width = ii_leftpart_width
//st_1.height = dw_3.height
//st_1.move( dw_3.x + dw_3.width, dw_3.y )

//-- resize tab_1 --//
tab_1.move( gb_7.x + 25, dw_3.y + dw_3.height )
tab_1.width = ii_resize_width - this.ii_vscrollbar - 50
tab_1.height = gb_7.height - 90

//-- resize horizontal line --//
if ii_gb_3_height = 0 then
	li_upper_height += gb_2.height +li_group_text_height  
else
	li_upper_height += gb_2.height + ii_gb_3_height
end if
gb_3.move( tab_action.x, li_upper_height)
gb_3.width = ii_resize_width - this.ii_vscrollbar
if gb_3.text = '^' then
	gb_3.height = 35
else
	gb_3.height = 50
end if

//-- resize gb_8 --//
gb_8.move( gb_3.x , gb_3.y + gb_3.height )
gb_8.width = ii_resize_width - this.ii_vscrollbar
gb_8.height  =  max(ii_resize_height - this.ii_hscrollbar - (gb_3.y + gb_3.height) , 0)

//-- resize dw_4 --//
dw_4.move(gb_8.x + 25, gb_8.y + 75 )
dw_4.width = ii_resize_width - this.ii_vscrollbar - 50
dw_4.height = max(gb_8.height - 90 , 0)
end subroutine

public subroutine f_resize_2dgb_1tp ();int	 li_group_text_height = 65, li_upper_height

//-- resize gb_6 --//
li_upper_height = tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space
gb_6.move( tab_action.x, li_upper_height)
gb_6.width = ii_resize_width - this.ii_vscrollbar
if ii_upperpart_height = 0 then
	gb_6.height = ii_upperpart_height * ii_resize_height + 65
	dw_1.height = (ii_upperpart_height  * ii_resize_height)  - (ii_resize_height *ii_fixedpart1_height) - 25
else
	gb_6.height = (ii_upperpart_height  * ii_resize_height)
	dw_1.height = (ii_upperpart_height  * ii_resize_height)  - (ii_resize_height *ii_fixedpart1_height) - 90
end if

//-- resize dw_1 --//
dw_1.move(gb_6.x + 25, gb_6.y + 75)
dw_1.width =  ii_resize_width - this.ii_vscrollbar - 50

//--resize dw_2--//
dw_2.move( gb_6.x + 25, dw_1.y + dw_1.height )
dw_2.width = ii_resize_width - this.ii_vscrollbar - 50
dw_2.height = (ii_resize_height *ii_fixedpart1_height) 

//-- resize horizontal line --//
if ii_upperpart_height = 0 then
	li_upper_height += li_group_text_height
else
	li_upper_height += ii_upperpart_height *ii_resize_height
end if
gb_2.move( tab_action.x, li_upper_height)
gb_2.width =  ii_resize_width - this.ii_vscrollbar
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//-- resize gb_7 --//
//gb_7.move( gb_2.x , gb_2.y + gb_2.height )
//gb_7.width = ii_resize_width - this.ii_vscrollbar
//gb_7.height = max(ii_resize_height - this.ii_hscrollbar - (gb_2.y + gb_2.height) , 0)

//-- resize tab_1 --//
tab_1.move( gb_2.x , gb_2.y + gb_2.height )
tab_1.width = ii_resize_width - this.ii_vscrollbar
tab_1.height = max(ii_resize_height - this.ii_hscrollbar - (gb_2.y + gb_2.height) , 0)
end subroutine

public function integer f_resize_up_1d_3d_lo_tb ();
//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_1.width = ii_leftpart_width
dw_1.height = ii_upperpart_height 

//-- resize gb_1 --//
gb_1.move(dw_1.x + ii_leftpart_width, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
gb_1.height = ii_upperpart_height
gb_1.width = 24

//-- resize dw_2 --//
dw_2.move( gb_1.x + gb_1.width + 5, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_2.width =   ii_resize_width - this.ii_vscrollbar - gb_1.x - gb_1.width 
dw_2.height = min( ii_fixedpart1_height, ii_upperpart_height)

//-- resize dw_3 --//
dw_3.move( gb_1.x + gb_1.width + 5, dw_2.y + dw_2.height )
dw_3.width =   ii_resize_width - this.ii_vscrollbar - gb_1.x - gb_1.width 
dw_3.height = min( ii_fixedpart2_height , ii_upperpart_height - ii_fixedpart1_height)

//-- resize dw_4 --//
dw_4.move( gb_1.x + gb_1.width + 5, dw_3.y + dw_3.height )
dw_4.width =    ii_resize_width - this.ii_vscrollbar - gb_1.x - gb_1.width 
dw_4.height =  max (0,ii_upperpart_height - ii_fixedpart1_height - ii_fixedpart2_height )


//-- resize horizontal line --//
gb_2.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight + ii_upperpart_height)
gb_2.width =   ii_resize_width - this.ii_vscrollbar
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//-- resize tab --//
tab_1.move( tab_action.x , gb_2.y + gb_2.height )
tab_1.width =   ii_resize_width - this.ii_vscrollbar
tab_1.height =  max(ii_resize_height - this.ii_hscrollbar - (gb_2.y + gb_2.height ), 0)		

return 1
end function

public function integer f_resize_up_1d_lo_tb ();
//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_1.width =  ii_resize_width - this.ii_vscrollbar
dw_1.height = ii_upperpart_height * ii_resize_height

//-- resize horizontal line --//
gb_2.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight + dw_1.height)
gb_2.width =   ii_resize_width - this.ii_vscrollbar
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//-- resize tab --//
tab_1.move( tab_action.x , gb_2.y + gb_2.height )
tab_1.width =   ii_resize_width - this.ii_vscrollbar
tab_1.height =  max(ii_resize_height - this.ii_hscrollbar - (gb_2.y + gb_2.height ), 0)		

return 1
end function

public subroutine f_resize_5dgb_1tp ();int	 li_group_text_height = 65, li_upper_height

//////--resize st_1--////
//st_1.width = 550
//st_1.height = 70
////st_1.move( (dw_3.x + dw_3.width) , dw_3.y )
//st_1.move( tab_action.x , tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space )

//-- resize gb_6 --//
li_upper_height = tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space
gb_6.move( tab_action.x, li_upper_height)
gb_6.width = ii_resize_width - this.ii_vscrollbar
if ii_upperpart_height = 0 then
	gb_6.height = ii_upperpart_height + 65
	dw_1.height = max(ii_upperpart_height - ii_fixedpart2_height - 25, 0)
else
	gb_6.height = ii_upperpart_height
	dw_1.height = max(ii_upperpart_height - ii_fixedpart2_height - 90, 0)
end if

//-- resize dw_1 --//
dw_1.move(gb_6.x + 25, gb_6.y + 75)
dw_1.width =  ii_resize_width - this.ii_vscrollbar - 50

//--resize dw_2--//
dw_2.move( gb_6.x + 25, dw_1.y + dw_1.height )
dw_2.width = ii_resize_width - this.ii_vscrollbar - 50
dw_2.height = min(ii_fixedpart2_height ,ii_upperpart_height)

//-- resize horizontal line --//
if ii_upperpart_height = 0 then
	li_upper_height += li_group_text_height
else
	li_upper_height += ii_upperpart_height
end if
gb_2.move( tab_action.x, li_upper_height)
gb_2.width =  ii_resize_width - this.ii_vscrollbar
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//-- resize gb_7 --//
gb_7.move( gb_2.x , gb_2.y + gb_2.height )
gb_7.width = ii_resize_width - this.ii_vscrollbar
if ii_gb_3_height = 0 then
	gb_7.height = ii_gb_3_height  + 65
	tab_1.height = max(ii_gb_3_height - ii_fixedpart3_height - 25,0)
else
	gb_7.height = ii_gb_3_height 
	tab_1.height = max(ii_gb_3_height - ii_fixedpart3_height - 90,0)
end if

//-- resize dw_3 --//
dw_3.move(gb_7.x + 25, gb_7.y + 75 )
dw_3.width =ii_resize_width - this.ii_vscrollbar - 50 - ii_leftpart_width
dw_3.height = min(ii_fixedpart3_height ,ii_gb_3_height)

////--resize st_1--////
//st_1.width = ii_leftpart_width
//st_1.height = dw_3.height
//st_1.move( dw_3.x + dw_3.width , dw_3.y )

//-- resize tab_1 --//
tab_1.move( gb_7.x + 25, dw_3.y + dw_3.height )
tab_1.width = ii_resize_width - this.ii_vscrollbar - 50

//-- resize horizontal line --//
if ii_gb_3_height = 0 then
	li_upper_height += gb_2.height +li_group_text_height  
else
	li_upper_height += gb_2.height + ii_gb_3_height
end if
gb_3.move( tab_action.x, li_upper_height)
gb_3.width = ii_resize_width - this.ii_vscrollbar
if gb_3.text = '^' then
	gb_3.height = 35
else
	gb_3.height = 50
end if

//-- resize gb_8 --//
gb_8.move( gb_3.x , gb_3.y + gb_3.height )
gb_8.width = ii_resize_width - this.ii_vscrollbar
if ii_gb_3_height = 0 then
	gb_8.height = ii_gb_4_height  + 65
	dw_4.height = max(ii_gb_4_height - 25,0)
else
	gb_8.height = ii_gb_4_height 
	dw_4.height = max(ii_gb_4_height - 90,0)
end if

//-- resize dw_4 --//
dw_4.move(gb_8.x + 25, gb_8.y + 75 )
dw_4.width = ii_resize_width - this.ii_vscrollbar - 50

//-- resize horizontal line --//
if ii_gb_4_height = 0 then
	li_upper_height += gb_3.height + li_group_text_height  
else
	li_upper_height += gb_3.height + ii_gb_4_height
end if
gb_4.move( tab_action.x, li_upper_height)
gb_4.width = ii_resize_width - this.ii_vscrollbar
if gb_4.text = '^' then
	gb_4.height = 35
else
	gb_4.height = 50
end if

//-- resize gb_9 --//
gb_9.move( gb_4.x , gb_4.y + gb_4.height )
gb_9.width = ii_resize_width - this.ii_vscrollbar
gb_9.height  =  max(ii_resize_height - this.ii_hscrollbar - (gb_4.y + gb_4.height) , 0)

//-- resize dw_4 --//
dw_5.move(gb_9.x + 25, gb_9.y + 75 )
dw_5.width = ii_resize_width - this.ii_vscrollbar - 50
dw_5.height = max(gb_9.height - 90 , 0)
end subroutine

public function integer f_resize_1ddlb_2d_1tp ();//--resize ddlb_1--//
ii_text_spaceheight = 0
ddlb_1.move(tab_action.x, tab_action.y + tab_action.height )
ddlb_1.width = ii_midpart_width * ii_resize_width + 200
ddlb_1.height = 500

//--resize htb_1--//
htb_1.move( ddlb_1.x + ddlb_1.width , ddlb_1.y)
htb_1.height = ii_spare_space
htb_1.width = ii_midpart_width * ii_resize_width

//--resize sle_1--//
sle_1.move( htb_1.x + htb_1.width , htb_1.y)
sle_1.width = 130
sle_1.height =  ii_spare_space

//--resize st_2--//
st_2.move( sle_1.x + sle_1.width + 20, htb_1.y+10)
st_2.width = 100
st_2.height = ii_spare_space
st_2.text = '%'

//--resize cbx_1--//
cbx_1.move(st_2.x + st_2.width , htb_1.y )
cbx_1.height = ii_spare_space
//cbx_1.width = ii_leftpart_width - 50
cbx_1.width = ii_midpart_width * ii_resize_width

//--resize cbx_1--//
cbx_2.move(cbx_1.x + cbx_1.width , htb_1.y )
//cbx_2.width = ii_leftpart_width - 50
cbx_2.width = ii_midpart_width * ii_resize_width
cbx_2.height = ii_spare_space

//--resize st_1--//
st_1.width =  ii_resize_width - ddlb_1.width - htb_1.width - sle_1.width - cbx_1.width - cbx_2.width - this.ii_vscrollbar 
st_1.move( cbx_2.x + cbx_2.width , htb_1.y)
st_1.height = ii_spare_space

//--resize gb_1--//
gb_1.move( ii_leftpart_width * ii_resize_width, tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space)
gb_1.width = 24
gb_1.height = ii_upperpart_height *ii_resize_height


//-- resize dw_1 --//
dw_2.move( tab_action.x, gb_1.y )
//dw_2.width = ii_resize_width - this.ii_vscrollbar 
dw_2.width = gb_1.x + gb_1.width
dw_2.height =  ii_upperpart_height  *ii_resize_height

dw_1.move( gb_1.x + gb_1.width, gb_1.y )
dw_1.width = ii_resize_width - dw_2.width
dw_1.height =  ii_upperpart_height  *ii_resize_height

//-- resize horizontal line --//
gb_2.move( tab_action.x,dw_1.y + dw_1.height )
gb_2.width =  ii_resize_width - this.ii_vscrollbar 
gb_2.height = 50

//-- resize tab_ 1--//
tab_1.move( tab_action.x , gb_2.y + gb_2.height )
tab_1.width = ii_resize_width - this.ii_vscrollbar 
tab_1.height =   ii_resize_height - gb_2.y - gb_2.height - this.ii_hscrollbar 

return 1
end function

public function integer f_resize_1dg_2gb_2df ();
//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space)
dw_1.width = ii_resize_width - this.ii_vscrollbar
dw_1.height =  ii_upperpart_height

//-- resize horizontal line --//
gb_2.move( tab_action.x, dw_1.y + dw_1.height )
gb_2.width =   ii_resize_width - this.ii_vscrollbar - 30
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//-- resize gb_6 --//
gb_6.move( tab_action.x, gb_2.y + gb_2.height + 10)
gb_6.width = ii_resize_width - this.ii_vscrollbar
gb_6.height = ii_fixedpart1_height  + 75


//-- resize dw_2 --//
dw_2.move( gb_6.x+25 , gb_6.y + 75 )
dw_2.width =  ii_resize_width - this.ii_vscrollbar - 60
dw_2.height =  ii_fixedpart1_height

//-- resize gb_7 --//
gb_7.move( tab_action.x, gb_6.y + gb_6.height + 15)
gb_7.width = ii_resize_width - this.ii_vscrollbar
gb_7.height = ii_fixedpart2_height  + 75

//-- resize dw_2 --//
dw_3.move( gb_7.x+25 , gb_7.y + 75 )
dw_3.width =  ii_resize_width - this.ii_vscrollbar - 60
dw_3.height =   ii_fixedpart2_height

return 1
end function

public subroutine f_resize_3d_1tp ();
//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space)
dw_1.width = ii_resize_width - this.ii_vscrollbar
dw_1.height =  ii_upperpart_height

//-- resize horizontal line --//
gb_2.move( tab_action.x, dw_1.y + dw_1.height )
gb_2.width =   ii_resize_width - this.ii_vscrollbar - 30
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//-- resize gb_6 --//
gb_6.move( tab_action.x, gb_2.y + gb_2.height + 10)
gb_6.width = ii_resize_width - this.ii_vscrollbar
gb_6.height = ii_fixedpart1_height  + 295


//-- resize dw_2 --//
dw_2.move( gb_6.x+25 , gb_6.y + 75 )
dw_2.width =  ii_resize_width - this.ii_vscrollbar - 60
dw_2.height =  ii_fixedpart1_height + 200

//-- resize gb_7 --//
gb_7.move( tab_action.x, gb_6.y + gb_6.height + 15)
gb_7.width = ii_resize_width - this.ii_vscrollbar
gb_7.height = ii_fixedpart2_height  - 100

//-- resize dw_3 --//
dw_3.move( gb_7.x+25 , gb_7.y + 75 )
dw_3.width =  ii_resize_width - this.ii_vscrollbar - 60
dw_3.height =   ii_fixedpart2_height - 200

//-- resize tab_1 --//
tab_1.move( gb_7.x, gb_7.y + gb_7.height)
tab_1.width = ii_resize_width - this.ii_vscrollbar - 50
tab_1.height  =   ii_resize_height - gb_7.y - gb_7.height - this.ii_hscrollbar 
end subroutine

public function t_rb f_get_ratiobutton (string vs_idx);string		ls_name

ls_name = 'rb_'+vs_idx
choose case ls_name
	case 'rb_1' 
		return rb_1
	case 'rb_2' 
		return rb_2
	case 'rb_3'
		return rb_3
end choose

end function

public function integer f_resize_3d_rb ();
//-- resize gb_6 --//
gb_6.move( tab_action.x, tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space)
gb_6.width = ii_resize_width - this.ii_vscrollbar
gb_6.height =  ii_fixedpart1_height

// resize radio button --//
rb_1.move(gb_6.x + 600, gb_6.y + 55)
rb_2.move(rb_1.x + rb_1.width, gb_6.y + 55)
dw_3.move( rb_2.x + rb_2.width + 10, gb_6.y + 55)
dw_3.width = dw_3.f_getwidth( ) + 100
dw_3.height = 100

//-- resize dw_1 --//
dw_1.move( tab_action.x, gb_6.y + gb_6.height +10 )
dw_1.width = ii_resize_width - this.ii_vscrollbar
dw_1.height =  ii_upperpart_height

//-- resize horizontal line --//
gb_2.move( tab_action.x, dw_1.y + dw_1.height )
gb_2.width =  ii_resize_width - this.ii_vscrollbar
gb_2.height = 50



//-- resize dw_2 --//
dw_2.move( tab_action.x , gb_2.y + gb_2.height )
dw_2.width =  ii_resize_width - this.ii_vscrollbar
dw_2.height =  ii_resize_height  - gb_2.y - gb_2.height - this.ii_hscrollbar

return 1
end function

public subroutine f_resize_2dgb_1tp_tax ();int	 li_group_text_height = 65, li_upper_height

//-- resize gb_6 --//
li_upper_height = tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space
gb_6.move( tab_action.x, li_upper_height)
gb_6.width = ii_resize_width - this.ii_vscrollbar
if ii_upperpart_height = 0 then
	gb_6.height = ii_upperpart_height + 65
	dw_1.height = max(ii_upperpart_height - ii_fixedpart2_height - 25, 0)
else
	gb_6.height = ii_upperpart_height
	dw_1.height = max(ii_upperpart_height - ii_fixedpart2_height - 90, 0)
end if

//-- resize dw_1 --//
dw_1.move(gb_6.x + 25, gb_6.y + 75)
dw_1.width =  ii_resize_width - this.ii_vscrollbar - 50

//--resize dw_2--//
dw_2.move( gb_6.x + 25, dw_1.y + dw_1.height )
dw_2.width = ii_resize_width - this.ii_vscrollbar - 50
dw_2.height = min(ii_fixedpart2_height ,ii_upperpart_height)

//-- resize horizontal line --//
if ii_upperpart_height = 0 then
	li_upper_height += li_group_text_height
else
	li_upper_height += ii_upperpart_height 
end if
gb_2.move( tab_action.x, li_upper_height)
gb_2.width =  ii_resize_width - this.ii_vscrollbar
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//-- resize gb_7 --//
gb_7.move( gb_2.x , gb_2.y + gb_2.height )
gb_7.width = ii_resize_width - this.ii_vscrollbar
gb_7.height = max(ii_resize_height - this.ii_hscrollbar - (gb_2.y + gb_2.height) , 0)

//-- resize tab_1 --//
tab_1.move( gb_7.x + 25, gb_7.y + 75 )
tab_1.width = ii_resize_width - this.ii_vscrollbar - 50
tab_1.height = gb_7.height - 90

//-- resize cbx_1 --//
cbx_1.move( gb_7.width - 700, gb_2.y + gb_2.height + 50 )
cbx_1.width = 650
cbx_1.height = 120

//-- resize gb_8 --//
gb_8.move(gb_7.width - 2500, gb_2.y + gb_2.height )
gb_8.width = 1800
gb_8.height = 180

//-- resize dw_3 --//
dw_3.move( gb_8.x + 25, gb_8.y + 50 )
dw_3.width = 1750
dw_3.height = 120
end subroutine

public function integer f_resize_up_1d_lo_1d_1d ();//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_1.width = ii_resize_width
dw_1.height =  ii_upperpart_height

//-- resize horizontal line --//
gb_2.move( dw_1.x , dw_1.y + dw_1.height )
gb_2.width = ii_resize_width
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if


//-- resize dw_2 --//
dw_2.move( tab_action.x, gb_2.y + gb_2.height)
dw_2.width = ii_leftpart_width
dw_2.height = ii_resize_height - (tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight) - this.ii_hscrollbar


//-- resize gb_1 --//
gb_1.move(dw_2.x + ii_leftpart_width, gb_2.y + gb_2.height)
gb_1.height = ii_resize_height - (tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight) - this.ii_hscrollbar
gb_1.width = 24


//-- resize dw_3 --//
dw_3.move( gb_1.x + gb_1.width, gb_2.y + gb_2.height)
dw_3.width =  ii_resize_width - gb_1.x - gb_1.width  - this.ii_vscrollbar
dw_3.height = ii_resize_height - (tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight) - this.ii_hscrollbar

return 1
end function

public function integer f_set_data_copied_line (t_ds_db vds_copied[], s_str_dwo_related vstr_dwo_related[], string ls_type_copy, string vs_obj_related, s_w_multi vw_f_copy);int 				li_idx,li_idx1,li_idx5,ll_find,li_count_rlt_copy,li_idx3
long				ll_rtn
string				las_to_col[],las_from_col[],las_column_sum[],ls_find,las_empty[]
string				las_obj_ref_id[],las_f_obj_column_chk[],las_t_obj_column_chk[],las_match_column[],las_dr_cr_obj_column[],las_match_f_column[]
double			ldb_t_doc_id
c_string			lc_string
t_ds_db			lds_copied_master,lds_copied_tmp,lds_matching,lds_temp,lds_temp_1
c_dwservice		lc_dwsr
datawindow		ldw_copied,ldw_master,ldw_details[]
t_dw_mpl		ldw_main_t
t_transaction	lt_transaction
powerobject		lpo_cr_dr_object

lds_matching = create t_ds_db
lds_copied_tmp = create t_ds_db
lds_matching.dataobject = 'ds_matching'
this.f_get_transaction( lt_transaction)
ldw_main_t = this.f_get_dwmain( )
ic_obj_handling.is_copy_stage = 'data_setting'
for li_idx = 1 to upperbound(vstr_dwo_related)
	if vs_obj_related <> vstr_dwo_related[li_idx].s_related_obj_name then continue //--nếu không phải obj cần copy thì bỏ qua--//
	
	ic_obj_handling.ib_copy_tax = vstr_dwo_related[li_idx].b_copy_tax
	li_count_rlt_copy = upperbound(vstr_dwo_related[li_idx].s_related_obj_dwo_copy)
	for li_idx1 = 1 to li_count_rlt_copy
		if li_idx1=1 then 
			if not ldw_main_t.f_get_ib_editing( ) then
				this.event e_modify( )
			end if		
			ldb_t_doc_id  = ldw_main_t.getitemnumber( ldw_main_t.rowcount( ) , 'ID')
		end if
		las_to_col = las_empty
		las_from_col = las_empty
		las_column_sum = las_empty
		las_f_obj_column_chk = las_empty
		las_t_obj_column_chk = las_empty
		las_match_column = las_empty
		lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_related_obj_column_copy[li_idx1], ';', las_to_col)
		lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_main_obj_column_copy[li_idx1], ';', las_from_col)
		lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_main_obj_column_sum[li_idx1], ';', las_column_sum)
		lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_f_obj_column_chk[li_idx1], ';', las_f_obj_column_chk)
		lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_t_obj_column_chk[li_idx1], ';', las_t_obj_column_chk)
		if vstr_dwo_related[li_idx].s_main_obj_dwo_copy[li_idx1] = vstr_dwo_related[li_idx].s_match_f_dwo[ li_idx1] and &
			vstr_dwo_related[li_idx].s_related_obj_dwo_copy[li_idx1] = vstr_dwo_related[li_idx].s_match_t_dwo[ li_idx1] then
				lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_match_column[li_idx1], ';', las_match_column)
				lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_match_f_column[li_idx1], ';', las_match_f_column)
		end if
		if vstr_dwo_related[li_idx].b_f_sum[li_idx1] then
			lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_main_dr_cr_obj_column_sum[li_idx1], ';', las_dr_cr_obj_column)
			if isvalid(lpo_cr_dr_object) then
				if upper(ls_type_copy) = 'COPYT' then
					lds_temp = lpo_cr_dr_object
					if lds_temp.dataobject <> vstr_dwo_related[li_idx].s_main_dr_cr_obj_dwo_sum[li_idx1] then 
						for li_idx3 = 1 to upperbound(vds_copied[])
							if lds_temp.dataobject = vds_copied[li_idx3].dataobject then 
								lds_temp = vds_copied[li_idx3]
								exit
							end if
						next
					end if
				else
					lpo_cr_dr_object = vw_f_copy.f_get_dw( vstr_dwo_related[li_idx].s_main_dr_cr_obj_dwo_sum[li_idx1])
				end if
			else
				if upper(ls_type_copy) = 'COPYT' then
					for li_idx3 = 1 to upperbound(vds_copied[])
						if vds_copied[li_idx3].dataobject =  vstr_dwo_related[li_idx].s_main_dr_cr_obj_dwo_sum[li_idx1] then
							lpo_cr_dr_object = vds_copied[li_idx3]
							exit
						end if
					next
				else
					lpo_cr_dr_object = vw_f_copy.f_get_dw( vstr_dwo_related[li_idx].s_main_dr_cr_obj_dwo_sum[li_idx1])
				end if
			end if
		end if
		lds_copied_master = lds_temp_1
		if li_idx1 > 1 then 
			if vstr_dwo_related[li_idx].s_related_obj_dwo_copy[li_idx1] = vstr_dwo_related[li_idx].s_related_obj_dwo_copy[li_idx1 - 1] then // trường hợp 2 dw copy vào 1 dw
				ll_rtn = lc_dwsr.f_update_data_copied( las_from_col, las_to_col, vstr_dwo_related[li_idx].b_f_sum[li_idx1], las_f_obj_column_chk, las_t_obj_column_chk, las_column_sum, vds_copied[li_idx1], ldw_copied, lpo_cr_dr_object, las_dr_cr_obj_column, las_match_column, las_match_f_column,  ldb_t_doc_id, lds_matching, ic_obj_handling,vstr_dwo_related[li_idx])
				if ll_rtn = -1 then return -1
				continue
			elseif vstr_dwo_related[li_idx].s_main_obj_dwo_copy[li_idx1] = vstr_dwo_related[li_idx].s_main_obj_dwo_copy[li_idx1 - 1] then // trường hợp 1 dw copy ra 2 dw
				for li_idx5 = 1 to vds_copied[li_idx1].rowcount()
					las_obj_ref_id[li_idx5] = string(vds_copied[li_idx1].getitemnumber(li_idx5,'ID'))
				next
				lds_copied_tmp.dataobject = vds_copied[li_idx1].dataobject
				lc_dwsr.f_copy_f_t( vds_copied[li_idx1], lds_copied_tmp)
				lds_copied_master = lds_copied_tmp
//				ldw_copied = this.f_get_dw( vstr_dwo_related[li_idx].s_related_obj_dwo_copy[li_idx1]) // lấy dw thứ 2
//				if not isvalid(lds_copied_tmp) then
//					lds_copied_tmp = vds_copied[li_idx1 - 1] //lấy ds đầu tiên có dữ liệu cất vào ds tạm
//				else
//					if lds_copied_tmp.dataobject <> vds_copied[li_idx1 - 1].dataobject then lds_copied_tmp = vds_copied[li_idx1 - 1] //lấy ds đầu tiên có dữ liệu cất vào ds tạm
//				end if
//				ll_rtn = lc_dwsr.f_update_data_copied( las_from_col, las_to_col, vstr_dwo_related[li_idx].b_f_sum[li_idx1], las_f_obj_column_chk, las_t_obj_column_chk, las_column_sum, lds_copied_tmp, ldw_copied, lpo_cr_dr_object, las_dr_cr_obj_column, las_match_column, las_match_f_column,  ldb_t_doc_id, lds_matching, ic_obj_handling,vstr_dwo_related[li_idx])
//				if ll_rtn = -1 then return -1
//				continue
			end if
		end if
		ldw_copied = this.f_get_dw( vstr_dwo_related[li_idx].s_related_obj_dwo_copy[li_idx1])
		if isvalid(ldw_copied) then
					
			if vstr_dwo_related[li_idx].b_copy_line[li_idx1] then
				ldw_master = ldw_copied.dynamic f_get_idw_master( )
				if not isvalid(lds_copied_master) then
					ls_find = lc_dwsr.f_find_obj_ref_id( vds_copied[li_idx1])
					lc_string.f_stringtoarray(ls_find , ';', las_obj_ref_id)
					for li_idx5 = 1 to upperbound(vds_copied)
						if li_idx5 = li_idx1 then continue
						ll_find = vds_copied[li_idx5].find('ID =' + string(vds_copied[li_idx1].getitemnumber(1,'object_ref_id')),1,vds_copied[li_idx5].rowcount())
						if ll_find > 0 then 
							lds_copied_master = vds_copied[li_idx5]
							exit
						end if
					next
				end if
				if ldw_copied.dynamic f_get_ib_relation_1_1() then
					if this.f_set_data( vds_copied[li_idx1], lds_copied_master, ldw_copied,ldw_master,las_obj_ref_id, las_to_col,las_from_col, las_f_obj_column_chk, las_t_obj_column_chk, false, vstr_dwo_related[li_idx].b_f_sum[li_idx1], las_column_sum,lpo_cr_dr_object,las_dr_cr_obj_column, las_match_column, las_match_f_column, ldb_t_doc_id, lds_matching, vstr_dwo_related[li_idx]) = -1 then return -1
				else
					if this.f_set_data( vds_copied[li_idx1], lds_copied_master, ldw_copied,ldw_master,las_obj_ref_id, las_to_col,las_from_col, las_f_obj_column_chk, las_t_obj_column_chk, true, vstr_dwo_related[li_idx].b_f_sum[li_idx1], las_column_sum,lpo_cr_dr_object,las_dr_cr_obj_column, las_match_column, las_match_f_column, ldb_t_doc_id, lds_matching, vstr_dwo_related[li_idx]) = -1 then return -1
				end if
			end if
		end if
	next
next
if lds_matching.rowcount( ) > 0 then
	ic_obj_handling.dynamic f_set_ids_matching(lds_matching)
//	//-- update lại tax_pact nếu có--//
//	ic_obj_handling.dynamic f_update_tax_pct()
end if
destroy lds_matching
destroy lds_copied_tmp
return 1
end function

public function integer f_resize_up_1d_1d_lo_tb ();
//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_1.width = ii_leftpart_width * ii_resize_width
dw_1.height = ii_upperpart_height  * ii_resize_height

//-- resize dw_2 --//
dw_2.move( dw_1.x + dw_1.width, tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_2.width =   ii_resize_width - dw_1.x - dw_1.width  - this.ii_vscrollbar
dw_2.height =  dw_1.height 

//-- resize horizontal line --//
gb_2.move( tab_action.x, dw_1.y + dw_1.height)
gb_2.width =   ii_resize_width - this.ii_vscrollbar
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//-- resize tab --//
tab_1.move( tab_action.x , gb_2.y + gb_2.height )
tab_1.width =   ii_resize_width - this.ii_vscrollbar
tab_1.height =  max(ii_resize_height - this.ii_hscrollbar - (gb_2.y + gb_2.height ), 0)		

return 1
end function

protected function integer f_set_data (t_ds_db vpo_from_copied, powerobject vpo_from_copied_master, ref datawindow rdw_to_copied, datawindow vdw_to_copied_master, string vas_obj_ref_id[], string vas_to_col[], string vas_from_col[], string vas_main_col_chk_sum[], string vas_related_col_chk_sum[], boolean vb_addrow, boolean vb_f_sum, string vas_col_sum[], powerobject vpo_dr_cr_object, string vas_col_dr_cr_object[], string vas_match_column[], string vas_match_f_column[], double vdb_t_doc_id, ref t_ds_db rds_matching, s_str_dwo_related vstr_dwo_related);int					li_idx2,li_idx3,li_idx4,li_rtn,li_idx5
long				ll_find,ll_row,ll_qty
string				ls_f_table
double			ldb_f_doc_id,ldb_return_price
datetime			ldt_sysdate
c_dwservice		lc_dwser
c_datetime		lc_datet

b_obj_instantiate	lc_obj
connect using it_transaction;
ldt_sysdate = lc_datet.f_getsysdate_ex( it_transaction )
disconnect using it_transaction;

vpo_from_copied.setsort('id asc')
vpo_from_copied.sort()
if not vb_f_sum then // không cộng dồn
	ls_f_table = vpo_from_copied.dynamic describe("Datawindow.table.update")
	if isvalid(vpo_from_copied_master) and not isnull(vpo_from_copied_master) then //nếu dw copy là detail
		for li_idx2 = 1 to upperbound(vas_obj_ref_id)
			if vpo_from_copied.dataobject <> vpo_from_copied_master.dynamic f_get_dataobject() then
				vpo_from_copied.dynamic setfilter('object_ref_id =' + vas_obj_ref_id[li_idx2]) //lọc ds lại theo obj ref id
			else
				vpo_from_copied.dynamic setfilter('ID =' + vas_obj_ref_id[li_idx2])
			end if
			vpo_from_copied.dynamic filter()
			ll_find = vpo_from_copied_master.dynamic find('id ='+vas_obj_ref_id[li_idx2],1,vpo_from_copied_master.dynamic rowcount()) // lấy số dòng của ds master
			for li_idx3 = 1 to vpo_from_copied.dynamic rowcount() // duyệt số dòng trên ds
				if vb_addrow or rdw_to_copied.rowcount() = 0 then 
					vdw_to_copied_master.scrolltorow( ll_find)
					/////////////////////////////////////////////////////////
					this.f_set_idwfocus( rdw_to_copied)
					ll_row = this.event e_add( )
//					ll_row = rdw_to_copied.dynamic event e_addrow()
				else
					ll_row = li_idx3
				end if
				for li_idx4 = 1 to upperbound(vas_to_col)
					li_rtn = rdw_to_copied.setitem( ll_row,vas_to_col[li_idx4] ,vpo_from_copied.dynamic f_getitemany( li_idx3, vas_from_col[li_idx4]) )
				next
				//////// lay gia hoa don ban va hd mua //////////////
				if 	vstr_dwo_related.b_get_price=true and vstr_dwo_related.s_dwo_set_price=rdw_to_copied.dataobject  then 
					for li_idx5=1 to upperbound(vstr_dwo_related.s_col_get_price)
						ldb_return_price=ic_obj_handling.dynamic f_get_return_price(vpo_from_copied.getitemnumber(li_idx3,'id'), vstr_dwo_related.s_col_get_price[li_idx5], vstr_dwo_related.s_col_get_qty[li_idx5], vstr_dwo_related.s_dwo_get_price)
						if vstr_dwo_related.s_col_set_qty[li_idx5]<>'' then 
							ll_qty=rdw_to_copied.getitemnumber(ll_row,vstr_dwo_related.s_col_set_qty[li_idx5])
							if isnull(ll_qty) then ll_qty=0
							ldb_return_price=ldb_return_price*ll_qty
						end if
						li_rtn=rdw_to_copied.setitem( ll_row,vstr_dwo_related.s_col_set_price[li_idx5] ,ldb_return_price )
					next
				end if	
				//update matching
				if upperbound(vas_match_column) > 0 then 
//					ldb_f_doc_id = ic_obj_handling.dynamic f_get_doc_id( vpo_from_copied.getitemnumber(li_idx3,'ID') , ls_f_table)
					ldb_f_doc_id = lc_obj.f_get_doc_id( vpo_from_copied.getitemnumber(li_idx3,'ID') , ls_f_table)
					ic_obj_handling.dynamic f_insert_matching( vpo_from_copied, rdw_to_copied, vas_match_column, vas_match_f_column, 'COPY', ldb_f_doc_id, vdb_t_doc_id, rds_matching, ldt_sysdate, li_idx3, ll_row)
				end if
			next
		next
	else
		// kiểm tra nếu trên dw_to có dòng giống với dòng trên ds_from thì lấy số dòng trên dw_to
		for li_idx3 = 1 to vpo_from_copied.dynamic rowcount()
			if upperbound(vas_match_column) > 0 then //neu co cap nhat ban mach thi moi lay doc_id
//				ldb_f_doc_id = ic_obj_handling.dynamic f_get_doc_id( vpo_from_copied.dynamic getitemnumber(li_idx3,'ID') , ls_f_table)
				ldb_f_doc_id = lc_obj.f_get_doc_id( vpo_from_copied.getitemnumber(li_idx3,'ID') , ls_f_table)
			end if
			if vb_addrow or rdw_to_copied.rowcount() = 0 then
				////////////////////////////////////////////////////////////////
				this.f_set_idwfocus( rdw_to_copied)
				ll_row = this.event e_add( )				
//				ll_row = rdw_to_copied.dynamic event e_addrow()
				
			else
				ll_row=li_idx3 
			end if
			for li_idx4 = 1 to upperbound(vas_to_col)
				li_rtn = rdw_to_copied.setitem( ll_row,vas_to_col[li_idx4] ,vpo_from_copied.dynamic f_getitemany( li_idx3, vas_from_col[li_idx4]) )
			next
			//////// lay gia hoa don ban va hd mua //////////////
			if 	vstr_dwo_related.b_get_price=true and vstr_dwo_related.s_dwo_set_price=rdw_to_copied.dataobject  then
				for li_idx5=1 to upperbound(vstr_dwo_related.s_col_get_price)
					ldb_return_price=ic_obj_handling.dynamic f_get_return_price(vpo_from_copied.getitemnumber(li_idx3,'id'), vstr_dwo_related.s_col_get_price[li_idx5], vstr_dwo_related.s_col_get_qty[li_idx5], vstr_dwo_related.s_dwo_get_price)
					if vstr_dwo_related.s_col_set_qty[li_idx5]<>'' then 
						ll_qty=rdw_to_copied.getitemnumber(ll_row,vstr_dwo_related.s_col_set_qty[li_idx5])
						if isnull(ll_qty) then ll_qty=0
						ldb_return_price=ldb_return_price*ll_qty
					end if
					li_rtn=rdw_to_copied.setitem( ll_row,vstr_dwo_related.s_col_set_price[li_idx5] ,ldb_return_price )
				next
			end if	
			if upperbound(vas_match_column) > 0 then ic_obj_handling.dynamic f_insert_matching( vpo_from_copied, rdw_to_copied, vas_match_column, vas_match_f_column, 'COPY', ldb_f_doc_id, vdb_t_doc_id, rds_matching, ldt_sysdate,li_idx3, ll_row)
		next
	end if
else
	if vdw_to_copied_master.dynamic f_isgrid() then
		for li_idx2 = 1 to vdw_to_copied_master.rowcount()
//			for li_idx3 = 1 to upperbound(vas_main_col_chk_sum)
//			//	ll_find1 = vdw_to_copied.dynamic find(vas_related_col_chk_sum[li_idx3] + ' = '+ string(vpo_from_copied.dynamic f_getitemany(li_idx2,vas_main_col_chk_sum[li_idx3])) ,1,vdw_to_copied.dynamic rowcount())
//			//	if isnull(ll_find1) then
//					ls_dbname = vas_main_col_chk_sum[li_idx3]
//					if lc_dwser.f_get_build_column( vpo_from_copied,ls_dbname, ls_colType) = -1 then
//						return -1			
//					end if
//					if ls_filter <> '' then ls_filter += ' AND '
//					la_data = vpo_from_copied.dynamic f_getitemany(li_idx2,vas_main_col_chk_sum[li_idx3])
//					ls_filter += lc_string.f_get_expression( string(la_data), ls_colType, ls_dbname, 'Filter')
//	//				vdw_to_copied.setfilter(ls_filter)
//	//				vdw_to_copied.filter()
//	//				ll_find1 = vdw_to_copied.dynamic find(vas_related_col_chk_sum[1] + ' = '+ string(vpo_from_copied.dynamic f_getitemany(li_idx2,vas_main_col_chk_sum[1])) ,1,vdw_to_copied.dynamic rowcount())
//	//				ll_find1 = vdw_to_copied.dynamic rowcount()
//			//	end if
//			next
		next
	end if
	if lc_dwser.f_set_data_sum( vpo_from_copied, rdw_to_copied, vas_from_col, vas_to_col, vb_addrow, vas_main_col_chk_sum, vas_related_col_chk_sum, vas_col_sum, vpo_dr_cr_object, vas_col_dr_cr_object, vas_match_column, vas_match_f_column, vdb_t_doc_id, rds_matching, ic_obj_handling,vstr_dwo_related) = -1 then return -1
end if
return 1
end function

public function boolean f_exist_second_sob (double vdb_doc_id);int 	li_count

if gs_sob = 'F' then
	select count(fsob_id) into :li_count from document where fsob_id = :vdb_doc_id using it_transaction;
else
	select count(fsob_id) into :li_count from document where id = :vdb_doc_id using it_transaction;
end if
if li_count > 0 then
	return true
else
	return false
end if
end function

public function integer f_auto_approve (double vdb_doc_id);int					li_idx,li_rtn
any				laa_data[]
long				ll_find
double			ldb_appr_by
boolean			lb_auto
datetime			ldt_sysdate
t_ds_db			lds_appr_profile
t_dw_mpl		ldw_document
c_datetime		lc_dt
c_appr_profile	lc_appr


lb_auto = this.f_check_auto_appr( 'security')
if not lb_auto then lb_auto = this.f_check_auto_appr( 'rule')
if lb_auto then
	ldw_document = this.f_get_dwmain( )
	ldt_sysdate = lc_dt.f_getsysdate( )
	lc_appr = create c_appr_profile
	lds_appr_profile = create t_ds_db
	lds_appr_profile.dataobject = 'ds_appr_profile_grid'
	laa_data[1] = vdb_doc_id
	lds_appr_profile.f_add_where( 'object_ref_id', laa_data)
	lds_appr_profile.f_settransobject(it_transaction)
	lds_appr_profile.retrieve( )
	lds_appr_profile.setsort( 'APPR_LEVEL asc')
	lds_appr_profile.sort( )
	DO
		li_idx ++
		ll_find ++
		ll_find = lds_appr_profile.find( 'APPR_LEVEL = ' + string(li_idx), ll_find, lds_appr_profile.rowcount( ) )
		if ll_find > 0 then
			ldb_appr_by = lds_appr_profile.getitemnumber( ll_find, 'APPR_ASSIGNED')
			lc_appr.f_update_appr_profile( lds_appr_profile, ll_find, 'approved', ldb_appr_by, vdb_doc_id, ldt_sysdate, 'auto')
		end if
	Loop while ll_find > 0
	li_rtn = lds_appr_profile.update(true,false)
	if li_rtn = 1 then
		lds_appr_profile.resetupdate( )
		ll_find = ldw_document.find( "id = " + string(vdb_doc_id), 1, ldw_document.rowcount( ) )
		ldw_document.setitem(ll_find , 'status', 'approved')
		if ldw_document.describe("status_name.x") <> '!' then ldw_document.setitem( ldw_document.getrow(), 'status_name', 'Đã duyệt')
		li_rtn = ldw_document.update( true,false)
		if li_rtn = 1 then
			ldw_document.resetupdate( )
			commit using it_transaction;
		else
			rollback using it_transaction;
		end if
	else
		rollback using it_transaction;
	end if
	destroy lc_appr
	destroy lds_appr_profile
end if
return 0
end function

public function boolean f_check_auto_appr (string vs_policy_type);int				li_idx,li_idx1,li_idx2,li_idx3
any			laa_data[]
long			ll_retrieve,ll_rowcount
string			ls_filter,ls_org_filter,ls_dwobject_constrant,ls_dbname,ls_dbasname, ls_colType,ls_criteria_constrant,ls_filter_criteria_constrant,ls_type_role_user_id,ls_role_user_string
string			las_dwo_constaint[]
double		ldb_policy_rule_id,ldb_business_id,ldb_role_user_id,ladb_dwo_id[],ldb_main_id
boolean		lb_auto,lb_rtn
b_rule		lc_rule
c_string		lc_string
t_ds_db		lds_policy_hdr,lds_role_user,lds_policy_temp
t_dw_mpl	ldw_object_constrant,ldw_temp,ldw_main
c_dwservice	lc_dwser

lb_rtn = false
lds_policy_hdr = create t_ds_db
lds_policy_temp = create t_ds_db
lds_policy_hdr.dataobject = 'ds_policy_hdr'
laa_data[1] = ic_obj_handling.classname( )
laa_data[2] = 'Y'
laa_data[3] = vs_policy_type
lds_policy_hdr.f_add_where( 'object_ref_code;AUTO_APPR_YN;type', laa_data)
lds_policy_hdr.f_settransobject(SQLCA )
ll_retrieve = lds_policy_hdr.retrieve( )
if ll_retrieve <= 0 then return false
ldw_main = this.f_get_dwmain( )
ldb_main_id = ldw_main.getitemnumber( ldw_main.getrow(), 'ID')
if vs_policy_type = 'security' then
	ldb_business_id = lds_policy_hdr.getitemnumber(ll_retrieve , 'OBJECT_REF_ID')
	if isnull(ldb_business_id) then return false
	ldb_role_user_id = lc_rule.f_get_role_user_id( ldb_business_id)
	if isnull(ldb_role_user_id) then return false
	ls_type_role_user_id = lc_rule.f_get_type_role_user_id( ldb_role_user_id)
	if ls_type_role_user_id = 'user' then
		if ldb_role_user_id <> gi_userid then return false
	elseif ls_type_role_user_id = 'role' then
		ls_role_user_string = g_user.f_get_current_role_user_string( )
		if pos(ls_role_user_string,string(ldb_role_user_id)) = 0 then return false
	elseif ls_type_role_user_id = 'appr' then
//		lds_role_user = create t_ds_db
//		lds_role_user.dataobject = 'd_role_assign_grid'
//		lds_role_user.f_settransobject( SQLCA)
		return false
	end if
	lds_policy_temp.dataobject = ic_obj_handling.ids_policy_security.dataobject
	ic_obj_handling.ids_policy_security.rowscopy( 1,ic_obj_handling.ids_policy_security.rowcount( )  , Primary!, lds_policy_temp, 1, Primary!)
else
	lds_policy_temp.dataobject = ic_obj_handling.ids_policy_rule.dataobject
	ic_obj_handling.ids_policy_rule.rowscopy( 1,ic_obj_handling.ids_policy_rule.rowcount( )  , Primary!, lds_policy_temp, 1, Primary!)
end if
for li_idx = 1 to ll_retrieve
	ldb_policy_rule_id = lds_policy_hdr.getitemnumber( li_idx, 'ID')
	lds_policy_temp.setfilter(  'ID = '+ string(ldb_policy_rule_id))
	lds_policy_temp.filter( )
	if vs_policy_type = 'security' then
		lc_string.f_stringtoarray( ic_obj_handling.f_get_security_dwo_constraint( ), ';', las_dwo_constaint)
	else
		lc_string.f_stringtoarray( ic_obj_handling.f_get_rule_dwo_constraint( ), ';', las_dwo_constaint)
	end if
	for li_idx1 = 1 to upperbound(las_dwo_constaint)
		lds_policy_temp.setfilter(  'ID = '+ string(ldb_policy_rule_id) + " and dwobject_constraint = '" + las_dwo_constaint[li_idx1]+"'")
		lds_policy_temp.filter( )
		for li_idx2 = 1 to lds_policy_temp.rowcount()
			ls_dwobject_constrant = lds_policy_temp.getitemstring( li_idx2, 'dwobject_constraint')
			if not isvalid(ldw_object_constrant) then ldw_object_constrant = this.f_get_dw(ls_dwobject_constrant + '_grid' )
			if not isvalid(ldw_object_constrant) or isnull(ldw_object_constrant) then ldw_object_constrant = this.f_get_dw(ls_dwobject_constrant + '_form' )
			if not isvalid(ldw_object_constrant) or isnull(ldw_object_constrant) then return false
			ls_dbname = lds_policy_temp.getitemstring( li_idx2, 'dwcolumn_constraint')
			ls_dbasname = ls_dbname
			if lc_dwser.f_get_build_column( ldw_object_constrant, ls_dbasname, ls_colType) = -1 then return false
			ls_criteria_constrant = lds_policy_temp.getitemstring( li_idx2, 'criteria_constraint')
			if ls_filter_criteria_constrant <> '' then ls_filter_criteria_constrant += ' AND '
			ls_filter_criteria_constrant += lc_string.f_get_expression( ls_criteria_constrant, ls_colType, ls_dbname, 'filter')
			if li_idx2 = lds_policy_temp.rowcount() then
				ll_rowcount = ldw_object_constrant.rowcount( )
				ls_filter = ls_filter_criteria_constrant
				ls_org_filter = ldw_object_constrant.describe( "datawindow.table.filter")
				if ls_org_filter <> '?' then ls_filter += ' and ' + ls_org_filter
				if ls_org_filter = '?' then ls_org_filter = ''
				if ldw_main.dataobject = ldw_object_constrant.dataobject then
					if ls_filter <> '' then 
						ls_filter += ' and id = '+string(ldb_main_id)
						ll_rowcount = 1
					end if
				end if
				ldw_object_constrant.setfilter(ls_filter)
				ldw_object_constrant.filter( )
				if ldw_object_constrant.rowcount( ) <> ll_rowcount then 
					//lb_auto = false
					for li_idx3 = 1 to ldw_object_constrant.rowcount( )
						ladb_dwo_id[upperbound(ladb_dwo_id[]) + 1] = ldw_object_constrant.getitemnumber( li_idx3, 'ID')
					next
				else
					lb_auto = true
				end if
				ldw_object_constrant.setfilter(ls_org_filter )
				ldw_object_constrant.filter( )
				if ldw_object_constrant.rowcount( ) = upperbound(ladb_dwo_id[]) then lb_auto = true
				ls_filter_criteria_constrant = ''
				ldw_object_constrant = ldw_temp
			end if
		next
		if not lb_auto then exit
	next
	if lb_auto then 
		lb_rtn = true
		exit
	end if
next
lds_policy_temp.setfilter( '')
lds_policy_temp.filter( )
destroy lds_policy_temp
destroy lds_policy_hdr
return lb_rtn
end function

public subroutine f_resize_1dr_1tb_2gb_1ddlb_1dl ();
gb_1.move( tab_action.x + ii_leftpart_width , tab_action.y + tab_action.height + ii_text_spaceheight + ii_spare_space)
gb_1.width = 25
gb_1.height = ii_resize_height - (tab_action.y + tab_action.height + ii_text_spaceheight + ii_spare_space) - this.ii_hscrollbar

//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space)
dw_1.width = ii_leftpart_width
dw_1.height =  ii_upperpart_height - 20

ddlb_1.move( gb_1.x +gb_1.width , gb_1.y )
ddlb_1.width = ii_resize_width - ii_leftpart_width - gb_1.width - this.ii_vscrollbar - 10
ddlb_1.height = 90

dw_2.move( ddlb_1.x , ddlb_1.y + ddlb_1.height )
dw_2.width = ddlb_1.width - 15
dw_2.height = gb_1.height - ddlb_1.height

gb_2.move( dw_1.x , dw_1.y + dw_1.height )
gb_2.width = dw_1.width
gb_2.height = 55

tab_1.move( dw_1.x, gb_2.y + gb_2.height )
tab_1.width = ii_leftpart_width
tab_1.height = ii_resize_height - ii_upperpart_height - (tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space) -this.ii_hscrollbar
end subroutine

public function integer f_resize_1tv_up1d1d_mid1d1d_lo1d ();// resize ddlb--//
//ddlb_1.move(tab_action.x, tab_action.y + tab_action.height + ii_filter_space + ii_text_spaceheight)
//ddlb_2.move(ddlb_1.x + ddlb_1.width , tab_action.y + tab_action.height + ii_filter_space + ii_text_spaceheight)

//-- resize tv_1 --//
tv_1.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
tv_1.width = ii_leftpart_width * ii_resize_width
tv_1.height = ii_resize_height  - (tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight) - this.ii_hscrollbar

//-- resize gb_1 --//
gb_1.move(tv_1.x + ii_leftpart_width * ii_resize_width, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
gb_1.height = ii_resize_height - (tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight) - this.ii_hscrollbar
gb_1.width = 24

//-- resize dw_1 --//
dw_1.move( gb_1.x + gb_1.width , tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_1.width = this.ii_midpart_width * ii_resize_width
dw_1.height =  this.ii_upperpart_height * ii_resize_height

//-- resize gb_10 --//
gb_10.move(gb_1.x + gb_1.width + ii_midpart_width *ii_resize_width , tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
gb_10.height = this.ii_upperpart_height * ii_resize_height
gb_10.width = 24

//-- resize dw_2 --//
dw_2.move( gb_10.x + gb_10.width , tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_2.width = ii_resize_width - gb_10.x - gb_10.width - this.ii_vscrollbar
dw_2.height = this.ii_upperpart_height * ii_resize_height

//-- resize gb_2 --//
gb_2.move(dw_1.x ,dw_1.y + dw_1.height )
gb_2.height =50
gb_2.width =  ii_resize_width - gb_1.x - gb_1.width  - this.ii_vscrollbar

//--resize dw_3--//
dw_3.move( dw_1.x , gb_2.y + gb_2.height )
dw_3.width = ii_gb_11_width * ii_resize_width
dw_3.height = ii_gb_3_height * ii_resize_height

//-- resize gb_11 --//
gb_11.move(gb_1.x + gb_1.width + ii_gb_11_width * ii_resize_width, gb_2.y + gb_2.height)
gb_11.height = this.ii_gb_3_height * ii_resize_height
gb_11.width = 24

//-- resize dw_4 --//
dw_4.move( gb_11.x + gb_11.width , gb_2.y + gb_2.height)
dw_4.width = ii_resize_width - gb_11.x - gb_11.width  - this.ii_vscrollbar
dw_4.height = this.ii_gb_3_height * ii_resize_height

//-- resize gb_3 --//
gb_3.move(dw_1.x  , dw_3.y + dw_3.height )
gb_3.height =50
gb_3.width =  ii_resize_width - gb_1.x - gb_1.width - this.ii_vscrollbar

//-- resize dw_4 --//
dw_5.move( dw_1.x , gb_3.y + gb_3.height )
dw_5.width =   ii_resize_width  - gb_1.x - gb_1.width - this.ii_vscrollbar
dw_5.height =  ii_resize_height - (gb_3.y + gb_3.height)  - this.ii_hscrollbar

return 1
end function

public function integer f_resize_3dgb ();int	 li_group_text_height = 65, li_upper_height

//-- resize gb_6 --//
li_upper_height = tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space
gb_6.move( tab_action.x, li_upper_height)
gb_6.width =  ii_resize_width - this.ii_vscrollbar
if ii_upperpart_height = 0 then
	gb_6.height = ii_upperpart_height + 65
	dw_1.height = max(ii_upperpart_height - ii_fixedpart2_height - 25, 0)
else
	gb_6.height = ii_upperpart_height
	dw_1.height = max(ii_upperpart_height - ii_fixedpart2_height - 90, 0)
end if

//-- resize dw_1 --//
dw_1.move(gb_6.x + 25, gb_6.y + 75)
dw_1.width = ii_resize_width - this.ii_vscrollbar - 50

//--resize dw_2--//
dw_2.move( gb_6.x + 25, dw_1.y + dw_1.height )
dw_2.width = ii_resize_width - this.ii_vscrollbar - 50
dw_2.height = min(ii_fixedpart2_height ,ii_upperpart_height)

//-- resize horizontal line --//
if ii_upperpart_height = 0 then
	li_upper_height += li_group_text_height
else
	li_upper_height += ii_upperpart_height 
end if
gb_2.move( tab_action.x, li_upper_height)
gb_2.width = ii_resize_width - this.ii_vscrollbar
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//-- resize gb_7 --//
gb_7.move( gb_2.x , gb_2.y + gb_2.height )
gb_7.width = ii_resize_width - this.ii_vscrollbar
gb_7.height = ii_resize_height - (gb_2.y + gb_2.height) - this.ii_Hscrollbar
//if ii_gb_3_height = 0 then
//	gb_7.height = ii_gb_3_height  + 65
//	dw_3.height = max(ii_gb_3_height -  25,0)
//else
//	gb_7.height = ii_gb_3_height 
//	dw_3.height = max(ii_gb_3_height -  90,0)
//end if

//-- resize dw_3 --//
dw_3.move(gb_7.x + 25, gb_7.y + 75)
dw_3.width = ii_resize_width - this.ii_vscrollbar - 50
dw_3.height = gb_7.height - 75

////-- resize dw_4 --//
//dw_4.move(gb_7.x + 25, dw_3.y + dw_3.height)
//dw_4.width = ii_resize_width - this.ii_vscrollbar - 50
//dw_4.height = min(ii_fixedpart3_height, ii_gb_3_height)
//
////-- resize horizontal line --//
//if ii_gb_3_height = 0 then
//	li_upper_height += gb_2.height + li_group_text_height
//else
//	li_upper_height += gb_2.height + ii_gb_3_height 
//end if
//gb_3.move( tab_action.x, li_upper_height )
//gb_3.width =  ii_resize_width - this.ii_vscrollbar
//if gb_3.text = '^' then
//	gb_3.height = 35
//else
//	gb_3.height = 50
//end if
//
////-- resize gb_8 --//
//gb_8.move( gb_3.x , gb_3.y + gb_3.height )
//gb_8.width =  ii_resize_width - this.ii_vscrollbar
//if ii_gb_4_height = 0 then
//	gb_8.height  =  ii_gb_4_height + 65
//	dw_5.height =  max(ii_gb_4_height - 25 , 0)
//else
//	gb_8.height  =  ii_gb_4_height
//	dw_5.height =  max(ii_gb_4_height - 90 , 0)
//end if
//
////-- resize dw_5 --//
//dw_5.move(gb_8.x + 25, gb_8.y + 75 )
//dw_5.width = ii_resize_width - this.ii_vscrollbar - 50
//
////-- resize horizontal line --//
//if ii_gb_4_height = 0 then
//	li_upper_height += gb_3.height +li_group_text_height
//else
//	li_upper_height += gb_3.height + ii_gb_4_height 
//end if
//gb_4.move( tab_action.x, li_upper_height)
//gb_4.width =  ii_resize_width - this.ii_vscrollbar
//if gb_4.text = '^' then
//	gb_4.height = 35
//else
//	gb_4.height = 50
//end if
//
////-- resize gb_9 --//
//gb_9.move( gb_4.x , gb_4.y + gb_4.height )
//gb_9.width = ii_resize_width - this.ii_vscrollbar
//if ii_gb_5_height = 0 then
//	gb_9.height  =  ii_gb_5_height + 65
//	dw_6.height =  max(ii_gb_5_height - 25 , 0)
//else
//	gb_9.height  =  ii_gb_5_height
//	dw_6.height =  max(ii_gb_5_height - 90 , 0)
//end if
//
////-- resize dw_6 --//
//dw_6.move(gb_9.x + 25, gb_9.y + 65 )
//dw_6.width = ii_resize_width - this.ii_vscrollbar - 50

return 1
end function

public subroutine f_resize_2dgb_1tp_tax_2d ();int	 li_group_text_height = 65, li_upper_height

//-- resize gb_6 --//
li_upper_height = tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space
gb_6.move( tab_action.x, li_upper_height)
gb_6.width = ii_resize_width - this.ii_vscrollbar
if ii_upperpart_height = 0 then
	gb_6.height = ii_upperpart_height + 65
	dw_1.height = max(ii_upperpart_height - ii_fixedpart2_height - 25, 0)
else
	gb_6.height = ii_upperpart_height
	dw_1.height = max(ii_upperpart_height - ii_fixedpart2_height - 90, 0)
end if

//-- resize dw_1 --//
dw_1.move(gb_6.x + 25, gb_6.y + 75)
dw_1.width =  ii_resize_width - this.ii_vscrollbar - 50

//--resize dw_2--//
dw_2.move( gb_6.x + 25, dw_1.y + dw_1.height )
dw_2.width = ii_resize_width - this.ii_vscrollbar - 50
dw_2.height = min(ii_fixedpart2_height ,ii_upperpart_height)

//-- resize horizontal line --//
if ii_upperpart_height = 0 then
	li_upper_height += li_group_text_height
else
	li_upper_height += ii_upperpart_height 
end if
gb_2.move( tab_action.x, li_upper_height)
gb_2.width =  ii_resize_width - this.ii_vscrollbar
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//-- resize gb_7 --//
gb_7.move( gb_2.x , gb_2.y + gb_2.height )
gb_7.width = ii_resize_width - this.ii_vscrollbar
if ii_gb_3_height = 0 then
	gb_7.height = ii_gb_3_height  + 65
	tab_1.height = max(ii_gb_3_height -  25,0)
else
	gb_7.height = ii_gb_3_height 
	tab_1.height = max(ii_gb_3_height -  90,0)
end if

//-- resize tab_1 --//
tab_1.move( gb_7.x + 25, gb_7.y + 75 )
tab_1.width = ii_resize_width - this.ii_vscrollbar - 50

//-- resize cbx_1 --//
cbx_1.move( gb_7.width - 700, gb_2.y + gb_2.height + 50 )
cbx_1.width = 650
cbx_1.height = 120

//-- resize  horizontal line --//
if ii_gb_3_height = 0 then
	li_upper_height += gb_2.height + li_group_text_height
else
	li_upper_height += gb_2.height + ii_gb_3_height 
end if
gb_3.move( tab_action.x, li_upper_height )
gb_3.width =  ii_resize_width - this.ii_vscrollbar
if gb_3.text = '^' then
	gb_3.height = 35
else
	gb_3.height = 50
end if

//-- resize gb_8 --//
gb_8.move(gb_3.x , gb_3.y + gb_3.height )
gb_8.width = gb_3.width
gb_8.height =  ii_gb_4_height 
//gb_8.height = min(ii_fixedpart3_height, ii_gb_3_height)

//-- resize dw_3 --//
dw_3.move( gb_8.x + 25 , gb_8.y + 75 )
dw_3.width = ii_resize_width - this.ii_vscrollbar - 50
dw_3.height = gb_8.height - 90

//-- resize  horizontal line --//
if ii_gb_4_height = 0 then
	li_upper_height += gb_3.height +li_group_text_height
else
	li_upper_height += gb_3.height + ii_gb_4_height 
end if
gb_4.move( tab_action.x, li_upper_height)
gb_4.width =  ii_resize_width - this.ii_vscrollbar + 255
if gb_4.text = '^' then
	gb_4.height = 35
else
	gb_4.height = 50
end if

//-- resize gb_8 --//
gb_9.move( gb_4.x , gb_4.y + gb_4.height )
gb_9.width = ii_resize_width - this.ii_vscrollbar
if ii_gb_5_height = 0 then
	gb_9.height  =  ii_gb_5_height + 65
	dw_4.height =  max(ii_gb_5_height - 25 , 0)
else
	gb_9.height  =  ii_gb_5_height
	dw_4.height =  max(ii_gb_5_height - 90 , 0)
end if

//-- resize dw_3 --//
dw_4.move( gb_9.x + 25 , gb_9.y + 75 )
dw_4.width = dw_3.width
//dw_4.height = gb_9.height - 90

end subroutine

public function integer f_resize_1tp ();
//-- resize tab_1 --//
tab_1.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight )
tab_1.width = ii_resize_width - this.ii_vscrollbar
tab_1.height =  ii_resize_height - this.ii_hscrollbar - (tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
return 1
end function

public function integer f_resize_1ddlb_1d ();//--resize ddlb_1--//
ii_text_spaceheight = 0
ddlb_1.move(tab_action.x, tab_action.y + tab_action.height )
ddlb_1.width = ii_midpart_width + 200
ddlb_1.height = 500

//--resize htb_1--//
htb_1.move( ddlb_1.x + ddlb_1.width , ddlb_1.y)
htb_1.height = ii_spare_space
htb_1.width = ii_midpart_width

//--resize sle_1--//
sle_1.move( htb_1.x + htb_1.width , htb_1.y)
sle_1.width = 130
sle_1.height =  ii_spare_space

//--resize st_2--//
st_2.move( sle_1.x + sle_1.width + 20, htb_1.y+10)
st_2.width = 100
st_2.height = ii_spare_space
st_2.text = '%'

//--resize cbx_1--//
cbx_1.move(st_2.x + st_2.width , htb_1.y )
cbx_1.height = ii_spare_space
cbx_1.width = ii_leftpart_width - 50

//--resize cbx_1--//
cbx_2.move(cbx_1.x + cbx_1.width , htb_1.y )
cbx_2.width = ii_leftpart_width - 50
cbx_2.height = ii_spare_space

//--resize st_1--//
st_1.width =  ii_resize_width - ddlb_1.width - htb_1.width - sle_1.width - cbx_1.width - cbx_2.width - this.ii_vscrollbar 
st_1.move( cbx_2.x + cbx_2.width , htb_1.y)
st_1.height = ii_spare_space

//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space)
dw_1.width = ii_resize_width - this.ii_vscrollbar 
dw_1.height = ii_resize_height - this.ii_hscrollbar 



return 1
end function

public function t_dw_mpl f_get_dw (integer vi_index);t_dw_mpl		l_dw


if vi_index = 1 then
	l_dw = dw_1
elseif  vi_index = 2  then
	l_dw = dw_2
elseif  vi_index = 3  then
	l_dw = dw_3
elseif  vi_index = 4  then
	l_dw = dw_4
elseif  vi_index = 5  then
	l_dw = dw_5
elseif  vi_index = 6  then
	l_dw = dw_6
end if

return l_dw
end function

public subroutine f_resize_5dgb_1tp_1dh ();int	 li_group_text_height = 65, li_upper_height

//-- dw6 ẩn--//

//-- resize gb_6 --//
li_upper_height = tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space
gb_6.move( tab_action.x, li_upper_height)
gb_6.width = ii_resize_width - this.ii_vscrollbar
if ii_upperpart_height = 0 then
	gb_6.height = ii_upperpart_height + 65
	dw_1.height = max(ii_upperpart_height - ii_fixedpart2_height - 25, 0)
else
	gb_6.height = ii_upperpart_height
	dw_1.height = max(ii_upperpart_height - ii_fixedpart2_height - 90, 0)
end if

//-- resize dw_1 --//
dw_1.move(gb_6.x + 25, gb_6.y + 75)
dw_1.width =  ii_resize_width - this.ii_vscrollbar - 50

//--resize dw_2--//
dw_2.move( gb_6.x + 25, dw_1.y + dw_1.height )
dw_2.width = ii_resize_width - this.ii_vscrollbar - 50
dw_2.height = min(ii_fixedpart2_height ,ii_upperpart_height)

//-- resize horizontal line --//
if ii_upperpart_height = 0 then
	li_upper_height += li_group_text_height
else
	li_upper_height += ii_upperpart_height
end if
gb_2.move( tab_action.x, li_upper_height)
gb_2.width =  ii_resize_width - this.ii_vscrollbar
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//-- resize gb_7 --//
gb_7.move( gb_2.x , gb_2.y + gb_2.height )
gb_7.width = ii_resize_width - this.ii_vscrollbar
if ii_gb_3_height = 0 then
	gb_7.height = ii_gb_3_height  + 65
	tab_1.height = max(ii_gb_3_height - ii_fixedpart3_height - 25,0)
else
	gb_7.height = ii_gb_3_height 
	tab_1.height = max(ii_gb_3_height - ii_fixedpart3_height - 90,0)
end if

//-- resize dw_3 --//
dw_3.move(gb_7.x + 25, gb_7.y + 75 )
dw_3.width =ii_resize_width - this.ii_vscrollbar - 50 - ii_leftpart_width
dw_3.height = min(ii_fixedpart3_height ,ii_gb_3_height)

////--resize st_1--////
//st_1.width = ii_leftpart_width
//st_1.height = dw_3.height
//st_1.move( dw_3.x + dw_3.width , dw_3.y )

//-- resize tab_1 --//
tab_1.move( gb_7.x + 25, dw_3.y + dw_3.height )
tab_1.width = ii_resize_width - this.ii_vscrollbar - 50

//-- resize horizontal line --//
if ii_gb_3_height = 0 then
	li_upper_height += gb_2.height +li_group_text_height  
else
	li_upper_height += gb_2.height + ii_gb_3_height
end if
gb_3.move( tab_action.x, li_upper_height)
gb_3.width = ii_resize_width - this.ii_vscrollbar
if gb_3.text = '^' then
	gb_3.height = 35
else
	gb_3.height = 50
end if

//-- resize gb_8 --//
gb_8.move( gb_3.x , gb_3.y + gb_3.height )
gb_8.width = ii_resize_width - this.ii_vscrollbar
if ii_gb_3_height = 0 then
	gb_8.height = ii_gb_4_height  + 65
	dw_4.height = max(ii_gb_4_height - 25,0)
else
	gb_8.height = ii_gb_4_height 
	dw_4.height = max(ii_gb_4_height - 90,0)
end if

//-- resize dw_4 --//
dw_4.move(gb_8.x + 25, gb_8.y + 75 )
dw_4.width = ii_resize_width - this.ii_vscrollbar - 50

//-- resize horizontal line --//
if ii_gb_4_height = 0 then
	li_upper_height += gb_3.height + li_group_text_height  
else
	li_upper_height += gb_3.height + ii_gb_4_height
end if
gb_4.move( tab_action.x, li_upper_height)
gb_4.width = ii_resize_width - this.ii_vscrollbar
if gb_4.text = '^' then
	gb_4.height = 35
else
	gb_4.height = 50
end if

//-- resize gb_9 --//
gb_9.move( gb_4.x , gb_4.y + gb_4.height )
gb_9.width = ii_resize_width - this.ii_vscrollbar
gb_9.height  =  max(ii_resize_height - this.ii_hscrollbar - (gb_4.y + gb_4.height) , 0)

//-- resize dw_4 --//
dw_5.move(gb_9.x + 25, gb_9.y + 75 )
dw_5.width = ii_resize_width - this.ii_vscrollbar - 50
dw_5.height = max(gb_9.height - 90 , 0)
end subroutine

public function integer f_resize_up_1d_2d_lo_tb ();int 		li_leftpart_width, li_upperpart_height, li_fixedpart1_height

li_leftpart_width = int((ii_resize_width - this.ii_vscrollbar)*1/3)
li_upperpart_height = int(ii_resize_height - this.ii_hscrollbar) * 1/3
li_fixedpart1_height = int(ii_resize_height - this.ii_hscrollbar) * 2/3*1/8
//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_1.width = li_leftpart_width
dw_1.height = li_upperpart_height

//-- resize gb_1 --//
gb_1.move(dw_1.x + li_leftpart_width, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
gb_1.height = dw_1.height
gb_1.width = 24

//-- resize dw_2 --//
dw_2.move( gb_1.x + gb_1.width + 5, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_2.width =   ii_resize_width - this.ii_vscrollbar - gb_1.x - gb_1.width 
dw_2.height = li_upperpart_height

//-- resize dw_3 --//
dw_3.move(tab_action.x, dw_1.y + dw_1.height )
dw_3.width =   ii_resize_width - this.ii_vscrollbar
dw_3.height = min( li_fixedpart1_height, li_upperpart_height)


//-- resize horizontal line --//
gb_2.move( tab_action.x, dw_3.y + dw_3.height )
gb_2.width =   ii_resize_width - this.ii_vscrollbar
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//-- resize tab --//
tab_1.move( tab_action.x , gb_2.y + gb_2.height )
tab_1.width =   ii_resize_width - this.ii_vscrollbar
tab_1.height =  max(ii_resize_height - this.ii_hscrollbar - (gb_2.y + gb_2.height ), 0)		

return 1
end function

public function integer f_resize_up_2d1d_lo_1tb ();int 		li_leftpart_width, li_upperpart_height, li_fixedpart1_height

li_leftpart_width = int((ii_resize_width - this.ii_vscrollbar)*3/4)

li_upperpart_height = int(ii_resize_height - this.ii_hscrollbar) * 2/5
li_fixedpart1_height = int(ii_resize_height - this.ii_hscrollbar) * 2/5*2/3

//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_1.width = li_leftpart_width
dw_1.height = dw_1.f_getheight( 1)


//-- resize dw_2 --//
dw_2.move(tab_action.x, dw_1.y + dw_1.height  )
dw_2.width =  li_leftpart_width 
dw_2.height = li_upperpart_height - dw_1.height



//-- resize gb_1 --//
gb_1.move(dw_1.x + li_leftpart_width, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
gb_1.height = ii_resize_height
gb_1.width = 24

//-- resize dw_3 --//
dw_3.move( gb_1.x + gb_1.width + 5, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_3.width =   ii_resize_width - this.ii_vscrollbar - gb_1.x - gb_1.width 
dw_3.height = ii_resize_height


//-- resize horizontal line --//
gb_2.move( tab_action.x, dw_2.y + dw_2.height )
gb_2.width =   li_leftpart_width
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//-- resize tab --//
tab_1.move( tab_action.x , gb_2.y + gb_2.height )
tab_1.width =  li_leftpart_width
tab_1.height =  max(ii_resize_height - this.ii_hscrollbar - (gb_2.y + gb_2.height ), 0)		

return 1
end function

public function integer f_resize_up_gp_1d2d1tv_lo_tb ();
//-- resize gb_6 --//
gb_6.move( tab_action.x, tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space)
gb_6.width = ii_leftpart_width *ii_resize_width
gb_6.height = ii_upperpart_height * ii_resize_height
//-- resize dw_1 --//
dw_1.move(gb_6.x + 25, gb_6.y + 75 )
dw_1.width = ii_leftpart_width*ii_resize_width - 50
dw_1.height = ii_upperpart_height * ii_resize_height - 90



//-- resize gb_1 --//
gb_1.move(gb_6.x + ii_leftpart_width*ii_resize_width , tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
gb_1.height = ii_upperpart_height * ii_resize_height
gb_1.width = 24

//-- resize gb_7 --//
gb_7.move( gb_1.x +gb_1.width, tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space)
gb_7.width = ii_midpart_width *ii_resize_width 
gb_7.height = ii_fixedpart1_height * ii_resize_height
//-- resize dw_2 --//
dw_2.move( gb_7.x + 25, gb_7.y + 75)
dw_2.width =  ii_midpart_width*ii_resize_width  - 50
dw_2.height = ii_fixedpart1_height  * ii_resize_height - 90

//-- resize gb_8 --//
gb_8.move( gb_1.x +gb_1.width,  gb_7.y + gb_7.height )
gb_8.width = ii_midpart_width *ii_resize_width 
gb_8.height = ii_upperpart_height  * ii_resize_height - ii_fixedpart1_height * ii_resize_height
//-- resize dw_3 --//
dw_3.move(gb_8.x + 25, gb_8.y + 75)
dw_3.width =  ii_midpart_width  *ii_resize_width - 50
dw_3.height =  ii_upperpart_height  * ii_resize_height - ii_fixedpart1_height  * ii_resize_height - 90

//-- resize gb_1 --//
gb_10.move(gb_8.x + ii_midpart_width *ii_resize_width  , tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
gb_10.height = ii_upperpart_height* ii_resize_height
gb_10.width = 24

//-- resize tv_1 --//
tv_1.move(gb_10.x + gb_10.width , tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
tv_1.width =   ii_resize_width -  gb_10.x -  gb_10.width - this.ii_vscrollbar
tv_1.height = ii_upperpart_height * ii_resize_height


//-- resize horizontal line --//
gb_2.move( tab_action.x, gb_6.y + gb_6.height )
gb_2.width =   ii_resize_width - this.ii_vscrollbar
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//-- resize tab --//
tab_1.move( tab_action.x , gb_2.y + gb_2.height )
tab_1.width =   ii_resize_width - this.ii_vscrollbar
tab_1.height =  max(ii_resize_height - this.ii_hscrollbar - (gb_2.y + gb_2.height ), 0)		

return 1
end function

public function integer f_resize_up_gp_2d1tv_lo_tb ();
//-- resize gb_6 --//
gb_6.move( tab_action.x, tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space)
gb_6.width = ii_leftpart_width * ii_resize_width
gb_6.height = ii_upperpart_height *ii_resize_height - ii_fixedpart1_height * ii_resize_height
//-- resize dw_1 --//
dw_1.move(gb_6.x + 25, gb_6.y + 75 )
dw_1.width = ii_leftpart_width * ii_resize_width - 50
dw_1.height = ii_upperpart_height  * ii_resize_height - ii_fixedpart1_height  * ii_resize_height - 90



//-- resize gb_7 --//
gb_7.move( tab_action.x , gb_6.y + gb_6.height )
gb_7.width = ii_leftpart_width  * ii_resize_width
gb_7.height = ii_fixedpart1_height * ii_resize_height
//-- resize dw_2 --//
dw_2.move( gb_7.x + 25, gb_7.y + 75)
dw_2.width =  ii_leftpart_width * ii_resize_width - 50
dw_2.height = ii_fixedpart1_height * ii_resize_height  - 90



//-- resize gb_1 --//
gb_1.move(gb_7.x + ii_leftpart_width * ii_resize_width , tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
gb_1.height = ii_upperpart_height* ii_resize_height 
gb_1.width = 24

//-- resize tv_1 --//
tv_1.move(gb_1.x + gb_1.width , tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
tv_1.width =   ii_resize_width -  gb_1.x -  gb_1.width 
tv_1.height = ii_upperpart_height * ii_resize_height 


//-- resize horizontal line --//
gb_2.move( tab_action.x, gb_7.y + gb_7.height )
gb_2.width =   ii_resize_width - this.ii_vscrollbar
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//-- resize tab --//
tab_1.move( tab_action.x , gb_2.y + gb_2.height )
tab_1.width =   ii_resize_width - this.ii_vscrollbar
tab_1.height =  max(ii_resize_height - this.ii_hscrollbar - (gb_2.y + gb_2.height ), 0)		

return 1
end function

public function integer f_resize_up_gp_2d_lo_tb ();
//-- resize gb_6 --//
gb_6.move( tab_action.x, tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space)
gb_6.width = ii_resize_width - this.ii_vscrollbar 
gb_6.height = ii_upperpart_height - ii_fixedpart1_height
//-- resize dw_1 --//
dw_1.move(gb_6.x + 25, gb_6.y + 75 )
dw_1.width = ii_resize_width - this.ii_vscrollbar - 50
dw_1.height = ii_upperpart_height -ii_fixedpart1_height  - 90



//-- resize gb_7 --//
gb_7.move( tab_action.x , gb_6.y + gb_6.height )
gb_7.width = ii_resize_width - this.ii_vscrollbar 
gb_7.height = ii_fixedpart1_height
//-- resize dw_2 --//
dw_2.move( gb_7.x + 25, gb_7.y + 75)
dw_2.width =  ii_resize_width - this.ii_vscrollbar - 50
dw_2.height = ii_fixedpart1_height  - 90


//-- resize horizontal line --//
gb_2.move( tab_action.x, gb_7.y + gb_7.height )
gb_2.width =   ii_resize_width - this.ii_vscrollbar
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//-- resize tab --//
tab_1.move( tab_action.x , gb_2.y + gb_2.height )
tab_1.width =   ii_resize_width - this.ii_vscrollbar
tab_1.height =  max(ii_resize_height - this.ii_hscrollbar - (gb_2.y + gb_2.height ), 0)		

cbx_1.move(tab_1.width - cbx_1.width , gb_2.y + gb_2.height)

return 1
end function

public subroutine f_resize_2dgb_1pc_1tp ();int	 li_group_text_height = 65, li_upper_height

//-- resize gb_6 --//
li_upper_height = tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space
gb_6.move( tab_action.x, li_upper_height)
gb_6.width = ii_resize_width - this.ii_vscrollbar
if ii_upperpart_height = 0 then
	gb_6.height = ii_upperpart_height + 65
	dw_1.height = max(ii_upperpart_height - ii_fixedpart2_height - 25, 0)
else
	gb_6.height = ii_upperpart_height
	dw_1.height = max(ii_upperpart_height - ii_fixedpart2_height - 90, 0)
end if

//-- resize dw_1 --//
dw_1.move(gb_6.x + 25, gb_6.y + 75)
dw_1.width =  (ii_resize_width - this.ii_vscrollbar - 50) * 2 / 3

//--resize dw_2--//
dw_2.move( gb_6.x + 25, dw_1.y + dw_1.height )
dw_2.width = dw_1.width
dw_2.height = min(ii_fixedpart2_height ,ii_upperpart_height)

dw_3.move( dw_1.x + dw_1.width , dw_1.y )
dw_3.width =  (ii_resize_width - this.ii_vscrollbar - 50) * 1 / 3
dw_3.height = dw_1.height + dw_2.height

//-- resize horizontal line --//
if ii_upperpart_height = 0 then
	li_upper_height += li_group_text_height
else
	li_upper_height += ii_upperpart_height 
end if
gb_2.move( tab_action.x, li_upper_height)
gb_2.width =  ii_resize_width - this.ii_vscrollbar
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//-- resize gb_7 --//
//gb_7.move( gb_2.x , gb_2.y + gb_2.height )
//gb_7.width = ii_resize_width - this.ii_vscrollbar
//gb_7.height = max(ii_resize_height - this.ii_hscrollbar - (gb_2.y + gb_2.height) , 0)

//-- resize tab_1 --//
tab_1.move( gb_2.x , gb_2.y + gb_2.height )
tab_1.width = ii_resize_width - this.ii_vscrollbar
tab_1.height = max(ii_resize_height - this.ii_hscrollbar - (gb_2.y + gb_2.height) , 0)
end subroutine

public function integer f_get_data_copied (ref t_ds_db rds_copied[], ref s_str_dwo_related vstr_dwo_related[], string vs_type_copy, string vs_obj_related);/**********************************
copy những dòng được chọn vào datastore
**********************************/
b_obj_instantiate lc_obj
t_dw_mpl		ldw_copied,ldw_main,ldw_master, ldw_dr_cr_object
c_dwservice		lc_dwsr
c_string			lc_string
t_ds_db			lds_temp
double			ldc_values_return, ldc_remain_values,ldc_values_matching,ldb_id,ldb_doc_id,ladb_values_settle[],ldb_doc_id_nx,ldb_values_settle
double			ldb_dr_cr_object
string				las_match_f_column[],las_match_column[],las_rf_dwo[],las_column_copy[],ls_table_return,ls_update_table,las_col_matched_f[]
string				ls_t_ref_table,ls_dwo_matched_f,ls_col_matched_f,las_minus_dwo[]
long				ll_find,ll_find2,ll_row_count
int					li_idx,li_idx1,li_idx2,li_idx3,li_count_dwo_copy,li_count, li_rtn,lai_idx[]
boolean			lab_check_full_match[],lb_next_settle, lb_copy_full
ldw_main = this.f_get_dwmain( )
ic_obj_handling.is_copy_stage = 'data_getting'
for li_idx = 1 to upperbound(vstr_dwo_related[])
	if vs_obj_related <> vstr_dwo_related[li_idx].s_related_obj_name then continue //--nếu không phải obj cần copy thì bỏ qua--/
	li_count_dwo_copy = upperbound(vstr_dwo_related[li_idx].s_main_obj_dwo_copy)
	if li_count_dwo_copy > 0 then
		//-- Xử lý dữ liệu trường hợp copyt --//
		
		if vs_type_copy = 'copyt' then
			ldw_main.f_filter_detail( )
		end if
		for li_idx1 = 1 to li_count_dwo_copy //duyet tung dw can copy,roi copy va mang datastore
			rds_copied[li_idx1] = create t_ds_db
			ldw_copied= this.f_get_dw( vstr_dwo_related[li_idx].s_main_obj_dwo_copy[li_idx1])
			//--kiểm tra cột dữ liệu giống nhau dùng cho copy nhiều dw => 1dw với dk bắt buộc phải có những cột giống nhau--//
			if not lc_dwsr.f_is_object_col_check(vstr_dwo_related[li_idx].s_main_obj_column_chk[li_idx1] , ldw_copied) then return -1
			if isvalid(ldw_copied) then
				ldw_master = ldw_copied.f_get_idw_master( )
				if ldw_copied.f_get_ib_shared( ) then
					ldw_copied = ldw_master					
				else
					if ldw_copied.dataobject <> ldw_main.dataobject then
						ldw_copied.setsort( "object_ref_id asc ")
						ldw_copied.sort( )
					end if
				end if
				rds_copied[li_idx1].dataobject = ldw_copied.dataobject
				if ldw_copied.dataobject = ldw_main.dataobject then //kiểm tra có phải là dw_main hay không
					ll_find = ldw_copied.find("gutter = 'Y'",1,ldw_copied.rowcount())
					if ll_find > 0 then
						lc_dwsr.f_copy_f_t( ldw_copied, rds_copied[li_idx1], 0, 0)
					else
						lc_dwsr.f_copy_f_t( ldw_copied, rds_copied[li_idx1], ldw_copied.getrow(),  ldw_copied.getrow())
					end if
				else //nếu không là dw_main
					if ldw_copied.f_get_ib_relation_1_1() then
						lc_dwsr.f_copy_f_t( ldw_copied, rds_copied[li_idx1], 1, 1)
						if upper(rds_copied[li_idx1].describe("invoice_object.coltype")) = 'NUMBER' then 
							vstr_dwo_related[li_idx].db_dr_cr_object = rds_copied[li_idx1].getitemnumber(1,'invoice_object')
						end if
					else
//						if lc_dwsr.f_copy(ldw_master, ldw_copied, rds_copied[li_idx1], vs_type_copy) = -1 then return -1
						//-- dùng hàm mới: cho phép copy chọn hoặc ko chọn ở line--//
						if upperbound(vstr_dwo_related[li_idx].b_selected[]) > 0 then
							if lc_dwsr.f_copy(ldw_master, ldw_copied, rds_copied[li_idx1], vstr_dwo_related[li_idx].b_selected[li_idx1]) = -1 then return -1
						else
							if lc_dwsr.f_copy(ldw_master, ldw_copied, rds_copied[li_idx1], vs_type_copy) = -1 then return -1
						end if
					end if
				end if
				if vstr_dwo_related[li_idx].b_f_matching then
					if vstr_dwo_related[li_idx].s_match_f_dwo[li_idx1] <> '' and  vstr_dwo_related[li_idx].s_match_f_dwo[li_idx1] = vstr_dwo_related[li_idx].s_main_obj_dwo_copy[li_idx1] then //Kiểm tra nếu dw copy có cập nhật matching mới chạy get remain
						lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_match_f_column[li_idx1], ';', las_match_f_column)
						lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_match_column[li_idx1], ';', las_match_column)
						lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_main_obj_column_copy[li_idx1], ';', las_column_copy)
						if upperbound(vstr_dwo_related[li_idx].s_match_minus_dwo) >= li_idx1 then lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_match_minus_dwo[li_idx1], ';', las_minus_dwo)
						if upperbound(vstr_dwo_related[li_idx].s_dwo_matched_f_dwo) >= li_idx1 then ls_dwo_matched_f=  vstr_dwo_related[li_idx].s_dwo_matched_f_dwo[li_idx1]
						if upperbound(vstr_dwo_related[li_idx].s_column_matched_f_dwo) >= li_idx1 then  lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_column_matched_f_dwo[li_idx1], ';', las_col_matched_f)
						if upperbound(vstr_dwo_related[li_idx].s_match_rf_dwo) >= li_idx1 then lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_match_rf_dwo[li_idx1], ';', las_rf_dwo)
						ll_row_count=rds_copied[li_idx1].rowcount()
						if ldw_copied.f_isgrid() then ll_find = ldw_copied.find("gutter = 'Y'",1,ldw_copied.rowcount())
						ls_update_table = ldw_copied.describe( "datawindow.table.update")
						lb_copy_full = false //-- reset biến--//
						if ll_find > 0 then //-- copy record được chọn --//
							Do
								ldb_id=ldw_copied.getitemnumber(ll_find,'id')
//								ldb_doc_id_nx = ic_obj_handling.dynamic f_get_doc_id( ldb_id, ls_update_table)
								ldb_doc_id_nx = lc_obj.f_get_doc_id(ldb_id , ls_update_table)
								if ldb_doc_id <> ldb_doc_id_nx then
									lb_next_settle = true
									ldb_doc_id = ldb_doc_id_nx
								else
									lb_next_settle = false
								end if
								for li_idx3 = 1 to upperbound(las_match_column)
									if upperbound(las_col_matched_f) > 0 then
										ls_col_matched_f = las_col_matched_f[li_idx3]
									end if
									//-- lấy giá trị cấn trừ
									if lb_next_settle then ladb_values_settle[li_idx3] = ic_obj_handling.dynamic f_get_values_settle( ldb_doc_id, las_match_column[li_idx3])
									//kiem tra lay so luong con lai
									ll_find2=rds_copied[li_idx1].find('id=' +string(ldb_id),1,rds_copied[li_idx1].rowcount())
									if ll_find2>0 then
										ldc_values_matching = 0
										ldc_remain_values = 0
										if vstr_dwo_related[li_idx].b_return then // related la tra hang
											ldc_values_return=0
											lds_temp = create t_ds_db
											lds_temp.dataobject = vstr_dwo_related[li_idx].s_match_t_dwo[li_idx1]
											ls_table_return= lds_temp.describe("Datawindow.table.update")
											ls_t_ref_table= ls_table_return
									
											destroy lds_temp
											li_rtn = ic_obj_handling.dynamic f_get_values_matching_and_return( ldb_id, ls_table_return,ldc_values_matching,ldc_values_return,las_match_column[li_idx3],ldb_doc_id,ls_t_ref_table)
											ldc_remain_values=ldc_values_matching -ldc_values_return
											if ldc_remain_values > 0 then
												rds_copied[li_idx1].setitem(ll_find2,las_match_f_column[li_idx3],ldc_remain_values)
											elseif ldc_remain_values = 0 then
												if li_rtn=0 then
													gf_messagebox('m.s_w_multi.f_get_data_copied.02','Thông báo','Đề xuất chưa kết phiếu xuất kho, không cần làm trả hàng','exclamation','ok',1)
													return -1
												else
													rds_copied[li_idx1].DeleteRow ( ll_find2 )
												end if 
											end if
										else
											li_rtn = ic_obj_handling.dynamic f_get_remain_and_matched_value( ldw_copied, vstr_dwo_related[li_idx].s_match_t_dwo[li_idx1],  las_rf_dwo, las_match_f_column[li_idx3] ,las_match_column[li_idx3], ldc_remain_values, ldc_values_matching, ll_find,ldb_doc_id,ls_dwo_matched_f,ls_col_matched_f,las_minus_dwo)										
											if li_rtn = 0 and ladb_values_settle[li_idx3] > 0 then ldc_remain_values = ldw_copied.getitemnumber( li_idx2, las_match_f_column[li_idx3])
											if ladb_values_settle[li_idx3] > ldc_remain_values then
												ladb_values_settle[li_idx3] = ladb_values_settle[li_idx3] - ldc_remain_values
												ldb_values_settle = ldc_remain_values
												ldc_remain_values = 0
											elseif ladb_values_settle[li_idx3] < ldc_remain_values then
												ldc_remain_values = ldc_remain_values - ladb_values_settle[li_idx3]
												ldb_values_settle = ladb_values_settle[li_idx3]
												ladb_values_settle[li_idx3] = 0
											else
												ldb_values_settle = 0
												ladb_values_settle[li_idx3] = 0
												ldc_remain_values = 0
											end if
											if ldc_remain_values > 0 then
												rds_copied[li_idx1].setitem(ll_find2,las_match_f_column[li_idx3],ldc_remain_values)
												if IsNumber(rds_copied[li_idx1].describe(las_match_f_column[li_idx3] + "_settle" + ".Visible")) then
													rds_copied[li_idx1].setitem(ll_find2,las_match_f_column[li_idx3]+'_settle',ldb_values_settle )
												end if
											elseif ldc_remain_values = 0 and li_rtn > 0 then //xoa nhung dong da ket het
												rds_copied[li_idx1].DeleteRow ( ll_find2 ) 
											elseif ldc_remain_values = 0 and li_rtn = 0 and vstr_dwo_related[li_idx].s_main_dr_cr_obj_dwo_sum[li_idx1] <> '' then //xoa dòng không cần phải kết --//												
												ldw_dr_cr_object= this.f_get_dw( vstr_dwo_related[li_idx].s_main_dr_cr_obj_dwo_sum[li_idx1])
												if ldw_dr_cr_object.getrow() > 0 then
													ldb_dr_cr_object = ldw_dr_cr_object.getitemnumber( ldw_dr_cr_object.getrow(),  vstr_dwo_related[li_idx].s_main_dr_cr_obj_column_sum[li_idx1])
													if ldb_dr_cr_object <> rds_copied[li_idx1].getitemnumber(ll_find2,vstr_dwo_related[li_idx].s_f_obj_column_chk[li_idx1]) then
														rds_copied[li_idx1].DeleteRow ( ll_find2 ) 
													end if
												end if
											end if
										end if
									end if
								next
								ll_find = ldw_copied.find("gutter = 'Y'",ll_find + 1,ldw_copied.rowcount() + 1)
							Loop While ll_find > 0
							if ll_row_count>0 then
								if rds_copied[li_idx1].rowcount()=0  then  //danh dau nhung datastore da ket het
									lab_check_full_match[upperbound(lab_check_full_match)+1]=true
								else
									lab_check_full_match[upperbound(lab_check_full_match)+1]=false
								end if
							end if
						else //-- trường hợp không chọn -> copy tất cả --//
							if upperbound(vstr_dwo_related[li_idx].b_selected[] ) = 0 then
								lb_copy_full = true
							elseif vstr_dwo_related[li_idx].b_selected[li_idx1] = false then
								lb_copy_full = true
							end if							
							if lb_copy_full then
								for li_idx2 = 1 to ldw_copied.rowcount()
									ldb_id=ldw_copied.getitemnumber(li_idx2,'id')
	//								ldb_doc_id_nx = ic_obj_handling.dynamic f_get_doc_id( ldb_id, ls_update_table)
									ldb_doc_id_nx = lc_obj.f_get_doc_id(ldb_id , ls_update_table)
									if ldb_doc_id <> ldb_doc_id_nx then
										lb_next_settle = true
										ldb_doc_id = ldb_doc_id_nx
									else
										lb_next_settle = false
									end if
									for li_idx3 = 1 to upperbound(las_match_column)
										if upperbound(las_col_matched_f) > 0 then
											ls_col_matched_f = las_col_matched_f[li_idx3]
										end if
										//-- lấy giá trị cấn trừ 
										if lb_next_settle then ladb_values_settle[li_idx3] = ic_obj_handling.dynamic f_get_values_settle( ldb_doc_id, las_match_column[li_idx3])
										//kiem tra cap nhat lai so luong, gia tri con lai
										ll_find2=rds_copied[li_idx1].find('id=' +string(ldb_id),1,rds_copied[li_idx1].rowcount())
										if ll_find2>0 then
											ldc_values_matching = 0
											ldc_remain_values = 0
											if vstr_dwo_related[li_idx].b_return then// related la tra hang
												ldc_values_return=0
												lds_temp = create t_ds_db
												lds_temp.dataobject = vstr_dwo_related[li_idx].s_match_t_dwo[li_idx1]
												ls_table_return= lds_temp.describe("Datawindow.table.update")
												ls_t_ref_table = ls_table_return
												destroy lds_temp
												li_rtn = ic_obj_handling.dynamic f_get_values_matching_and_return( ldb_id, ls_table_return,ldc_values_matching,ldc_values_return,las_match_column[li_idx3],ldb_doc_id,ls_t_ref_table)
												ldc_remain_values=ldc_values_matching -ldc_values_return
												if ldc_remain_values > 0 then
													rds_copied[li_idx1].setitem(ll_find2,las_match_f_column[li_idx3],ldc_remain_values)
												elseif ldc_remain_values = 0 then
													if li_rtn=0 then
														gf_messagebox('m.s_w_multi.f_get_data_copied.02','Thông báo','Đề xuất chưa kết phiếu xuất kho, không cần làm trả hàng','exclamation','ok',1)
														return -1
													else
														rds_copied[li_idx1].DeleteRow ( ll_find2 )
													end if
												end if
											else	
												li_rtn = ic_obj_handling.dynamic f_get_remain_and_matched_value( ldw_copied, vstr_dwo_related[li_idx].s_match_t_dwo[li_idx1],  las_rf_dwo, las_match_f_column[li_idx3] ,las_match_column[li_idx3], ldc_remain_values, ldc_values_matching, li_idx2,ldb_doc_id,ls_dwo_matched_f,ls_col_matched_f,las_minus_dwo)	
												if upperbound(ladb_values_settle[]) > 0 then
													if li_rtn = 0 and ladb_values_settle[li_idx3] > 0 then ldc_remain_values = ldw_copied.getitemnumber( li_idx2, las_match_f_column[li_idx3])					
													if ladb_values_settle[li_idx3] > ldc_remain_values then
														ladb_values_settle[li_idx3] = ladb_values_settle[li_idx3] - ldc_remain_values
														ldb_values_settle = ldc_remain_values
														ldc_remain_values = 0
													elseif ladb_values_settle[li_idx3] < ldc_remain_values then
														ldc_remain_values = ldc_remain_values - ladb_values_settle[li_idx3]
														ldb_values_settle = ladb_values_settle[li_idx3]
														ladb_values_settle[li_idx3] = 0
													else
														ladb_values_settle[li_idx3] = 0
														ldb_values_settle = 0
														ldc_remain_values = 0
													end if
													if ldc_remain_values > 0 or (ldc_remain_values = 0 and ladb_values_settle[li_idx3] > 0) then
														rds_copied[li_idx1].setitem(ll_find2,las_match_f_column[li_idx3],ldc_remain_values)
														if IsNumber(rds_copied[li_idx1].describe(las_match_f_column[li_idx3] + "_settle" + ".Visible")) then
															rds_copied[li_idx1].setitem(ll_find2,las_match_f_column[li_idx3]+'_settle',ldb_values_settle )
														end if
													elseif ldc_remain_values = 0 and li_rtn > 0 then //xoa nhung dong da ket het
														rds_copied[li_idx1].DeleteRow ( ll_find2 ) 
													elseif ldc_remain_values = 0 and li_rtn = 0 then //xoa dòng không cần phải kết --//
														if upperbound(vstr_dwo_related[li_idx].s_main_dr_cr_obj_dwo_sum[]) > 0  then 
															ldw_dr_cr_object= this.f_get_dw( vstr_dwo_related[li_idx].s_main_dr_cr_obj_dwo_sum[li_idx1])
															if ldw_dr_cr_object.getrow() > 0 then
																ldb_dr_cr_object = ldw_dr_cr_object.getitemnumber( ldw_dr_cr_object.getrow(),  vstr_dwo_related[li_idx].s_main_dr_cr_obj_column_sum[li_idx1])
																if ldb_dr_cr_object <> rds_copied[li_idx1].getitemnumber(ll_find2,vstr_dwo_related[li_idx].s_f_obj_column_chk[li_idx1]) then
																	rds_copied[li_idx1].DeleteRow ( ll_find2 ) 
																end if
															end if			
														end if
													end if
												end if
											end if
										end if
									next				
								next
								if ll_row_count>0 then
									if rds_copied[li_idx1].rowcount()=0  then  //danh dau nhung datastore da ket het
										lab_check_full_match[upperbound(lab_check_full_match)+1]=true
									else
										lab_check_full_match[upperbound(lab_check_full_match)+1]=false
									end if
								end if
							end if
						end if	//-- kết thúc:trường hợp không chọn -> copy tất cả --//					
					end if
				end if
			end if
		next
		if vstr_dwo_related[li_idx].b_f_matching then
			for li_count=1 to upperbound(lab_check_full_match)
				if lab_check_full_match[li_count]=false then exit
			next
			if li_count> upperbound(lab_check_full_match) then
				gf_messagebox('m.s_w_multi.f_get_data_copied.03','Thông báo','Phiếu này đã được kết hết','exclamation','ok',1)
				return -1
			end if
		end if
	end if
next
return 1
end function

public function integer f_resize_1d ();
//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_1.width = ii_resize_width - this.ii_vscrollbar 
dw_1.height =  ii_resize_height - this.ii_hscrollbar - (tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight) 
return 1

end function

public function integer f_resize_up_gp_1d3d1tv_lo_tb ();
//-- resize gb_6 --//
gb_6.move( tab_action.x, tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space)
gb_6.width = ii_leftpart_width * ii_resize_width
gb_6.height = ii_upperpart_height * ii_resize_height
//-- resize dw_1 --//
dw_1.move(gb_6.x + 25, gb_6.y + 75 )
dw_1.width = ii_leftpart_width * ii_resize_width - 50
dw_1.height = ii_upperpart_height * ii_resize_height - 90


//-- resize gb_1 --//
gb_1.move(gb_6.x + ii_leftpart_width* ii_resize_width , tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
gb_1.height = ii_upperpart_height * ii_resize_height
gb_1.width = 24

//-- resize gb_7 --//
gb_7.move( gb_1.x +gb_1.width, tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space)
gb_7.width = ii_midpart_width * ii_resize_width
gb_7.height = ii_fixedpart1_height* ii_resize_height
//-- resize dw_2 --//
dw_2.move( gb_7.x + 25, gb_7.y + 75)
dw_2.width =  ii_midpart_width * ii_resize_width - 50
dw_2.height = ii_fixedpart1_height * ii_resize_height - 90

//-- resize gb_8 --//
gb_8.move( gb_1.x +gb_1.width,  gb_7.y + gb_7.height )
gb_8.width = ii_midpart_width * ii_resize_width
gb_8.height = ii_fixedpart2_height* ii_resize_height
//-- resize dw_3 --//
dw_3.move(gb_8.x + 25, gb_8.y + 75)
dw_3.width =  ii_midpart_width* ii_resize_width - 50
dw_3.height = ii_fixedpart2_height* ii_resize_height  - 90

//-- resize gb_9 --//
gb_9.move( gb_1.x +gb_1.width,  gb_8.y + gb_8.height )
gb_9.width = ii_midpart_width * ii_resize_width 
gb_9.height = ii_upperpart_height * ii_resize_height - ii_fixedpart1_height* ii_resize_height  - ii_fixedpart2_height * ii_resize_height 
//-- resize dw_3 --//
dw_4.move(gb_9.x + 25, gb_9.y + 75)
dw_4.width =  ii_midpart_width* ii_resize_width  - 50
dw_4.height =  ii_upperpart_height * ii_resize_height - ii_fixedpart1_height* ii_resize_height - ii_fixedpart2_height* ii_resize_height - 90

//-- resize gb_1 --//
gb_10.move(gb_8.x + ii_midpart_width* ii_resize_width  , tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
gb_10.height = ii_upperpart_height* ii_resize_height
gb_10.width = 24

//-- resize tv_1 --//
tv_1.move(gb_10.x + gb_10.width , tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
tv_1.width =   ii_resize_width -  gb_10.x -  gb_10.width - this.ii_vscrollbar
tv_1.height = ii_upperpart_height * ii_resize_height


//-- resize horizontal line --//
gb_2.move( tab_action.x, gb_6.y + gb_6.height )
gb_2.width =   ii_resize_width - this.ii_vscrollbar
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//-- resize tab --//
tab_1.move( tab_action.x , gb_2.y + gb_2.height )
tab_1.width =   ii_resize_width - this.ii_vscrollbar
tab_1.height =  max(ii_resize_height - this.ii_hscrollbar - (gb_2.y + gb_2.height ), 0)		

return 1
end function

public function integer f_resize_2d_3rb ();

//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space)
dw_1.width = ii_resize_width - this.ii_vscrollbar
dw_1.height =  ii_upperpart_height

//-- resize horizontal line --//
gb_2.move( tab_action.x, dw_1.y + dw_1.height )
gb_2.width =  ii_resize_width - this.ii_vscrollbar
gb_2.height = 50

//-- resize dw_2 --//
dw_2.move( tab_action.x , gb_2.y + gb_2.height )
dw_2.width =  ii_resize_width - this.ii_vscrollbar
dw_2.height =  ii_resize_height  - gb_2.y - gb_2.height - this.ii_hscrollbar

dw_filter.width = this.ii_resize_width * 2 / 3
rb_1.move((this.ii_resize_width * 2 / 3) + 20, gb_filter.y + 60)
rb_2.move( rb_1.x + rb_1.width , dw_filter.y)
rb_3.move( rb_2.x + rb_2.width , dw_filter.y)

//rb_1.move( dw_filter.x +  dw_filter.width + 5, dw_filter.y)
return 1
end function

public function integer setredraw (boolean f);IF f THEN
   ii_redraw --
   IF ii_redraw <= 0 THEN
      ii_redraw = 0
      super::SetRedraw( TRUE )
      RETURN 1
   END IF
   RETURN 0
ELSE
   ii_redraw ++
   IF ii_redraw = 1 THEN &
      super::SetRedraw( FALSE )
END IF
RETURN 1
end function

public function integer f_resize_1d_1df_1df ();
//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_1.width = ii_leftpart_width * ii_resize_width
dw_1.height = ii_resize_height - (tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight) - this.ii_hscrollbar


//-- resize gb_1 --//
gb_1.move(dw_1.x + dw_1.width, dw_1.y)
gb_1.height = dw_1.height
gb_1.width = 24

//-- resize dw_4 (filter) --//
if dw_4.rowcount( ) = 0 then dw_4.insertrow( 0)
dw_4.move( gb_1.x + gb_1.width, dw_1.y)
dw_4.width =ii_resize_width * ii_midpart_width
dw_4.height =  dw_4.f_getheight( )
//-- resize dw_2 --//
dw_2.move( gb_1.x + gb_1.width, dw_4.y + dw_4.height )
dw_2.width = ii_resize_width * ii_midpart_width
dw_2.height = ii_resize_height - (dw_4.y + dw_4.height)

//-- resize veticle line --//
gb_10.move( dw_2.x + dw_2.width, dw_1.y )
gb_10.width = 24
gb_10.height = dw_1.height


//-- resize dw_5 (filter) --//
if dw_5.rowcount( ) = 0 then dw_5.insertrow( 0)
dw_5.move( gb_10.x + gb_10.width , dw_1.y  )
dw_5.width =ii_resize_width - gb_10.x - gb_10.width - this.ii_vscrollbar
dw_5.height =  dw_5.f_getheight( )
//-- resize dw_3 --//
dw_3.move( gb_10.x + gb_10.width , dw_5.y + dw_5.height)
dw_3.width =  ii_resize_width - gb_10.x - gb_10.width - this.ii_vscrollbar
dw_3.height =  ii_resize_height - (dw_5.y + dw_5.height)

return 1
end function

public function t_dw_mpl f_get_dw (integer vi_tabpage_index, integer vi_dw_index);
int					li_idx

t_dw_mpl		l_dw
s_tp_multi		l_tabpage


l_tabpage = this.tab_1.control[vi_tabpage_index]
if vi_dw_index = 1 then
	l_dw = l_tabpage.dw_1
elseif vi_dw_index = 2 then
	l_dw = l_tabpage.dw_2	
elseif vi_dw_index = 3 then
	l_dw = l_tabpage.dw_3
elseif vi_dw_index = 4 then
	l_dw = l_tabpage.dw_4
elseif vi_dw_index = 5 then
	l_dw = l_tabpage.dw_5
elseif vi_dw_index = 6 then
	l_dw = l_tabpage.dw_6
end if

return l_dw
end function

public function integer f_get_data_copied_ex (ref t_ds_db rds_copied[], ref s_str_dwo_related vstr_dwo_related[], string vs_type_copy, string vs_obj_related);/**********************************
copy những dòng được chọn vào datastore
**********************************/
b_obj_instantiate lc_obj
t_dw_mpl		ldw_copied,ldw_main,ldw_master, ldw_dr_cr_object
c_dwservice		lc_dwsr
c_string			lc_string
t_ds_db			lds_temp
double			ldc_values_return, ldc_remain_values,ldc_values_matching,ldb_id,ldb_doc_id,ladb_values_settle[],ldb_doc_id_nx,ldb_values_settle
double			ldb_dr_cr_object
string				las_match_f_column[],las_match_column[],las_rf_dwo[],las_column_copy[],ls_table_return,ls_update_table,las_col_matched_f[]
string				ls_t_ref_table,ls_dwo_matched_f,ls_col_matched_f,las_minus_dwo[]
long				ll_find,ll_find2,ll_row_count
int					li_idx,li_idx1,li_idx2,li_idx3,li_count_dwo_copy,li_count, li_rtn,lai_idx[]
boolean			lab_check_full_match[],lb_next_settle, lb_copy_full
ldw_main = this.f_get_dwmain( )
ic_obj_handling.is_copy_stage = 'data_getting'
for li_idx = 1 to upperbound(vstr_dwo_related[])
	if vs_obj_related <> vstr_dwo_related[li_idx].s_related_obj_name then continue //--nếu không phải obj cần copy thì bỏ qua--/
	li_count_dwo_copy = upperbound(vstr_dwo_related[li_idx].s_main_obj_dwo_copy)
	if li_count_dwo_copy > 0 then
		//-- Xử lý dữ liệu trường hợp copyt --//
		
		if vs_type_copy = 'copyt' then
			ldw_main.f_filter_detail( )
		end if
		for li_idx1 = 1 to li_count_dwo_copy //duyet tung dw can copy,roi copy va mang datastore
			ldw_copied= this.f_get_dw( vstr_dwo_related[li_idx].s_main_obj_dwo_copy[li_idx1])
			if not isvalid(ldw_copied) or isnull(ldw_copied) then continue 
			
			rds_copied[upperbound(rds_copied[]) + 1] = create t_ds_db			
			//--kiểm tra cột dữ liệu giống nhau dùng cho copy nhiều dw => 1dw với dk bắt buộc phải có những cột giống nhau--//
			if not lc_dwsr.f_is_object_col_check(vstr_dwo_related[li_idx].s_main_obj_column_chk[li_idx1] , ldw_copied) then return -1

			ldw_master = ldw_copied.f_get_idw_master( )
			if ldw_copied.f_get_ib_shared( ) then
				ldw_copied = ldw_master					
			else
				if ldw_copied.dataobject <> ldw_main.dataobject then
					ldw_copied.setsort( "object_ref_id asc ")
					ldw_copied.sort( )
				end if
			end if
			rds_copied[upperbound(rds_copied[])].dataobject = ldw_copied.dataobject
			if ldw_copied.dataobject = ldw_main.dataobject then //kiểm tra có phải là dw_main hay không
				ll_find = ldw_copied.find("gutter = 'Y'",1,ldw_copied.rowcount())
				if ll_find > 0 then
					lc_dwsr.f_copy_f_t( ldw_copied, rds_copied[upperbound(rds_copied[])], 0, 0)
				else
					lc_dwsr.f_copy_f_t( ldw_copied, rds_copied[upperbound(rds_copied[])], ldw_copied.getrow(),  ldw_copied.getrow())
				end if
			else //nếu không là dw_main
				if ldw_copied.f_get_ib_relation_1_1() then
					lc_dwsr.f_copy_f_t( ldw_copied, rds_copied[upperbound(rds_copied[])], 1, 1)
					if upper(rds_copied[upperbound(rds_copied[])].describe("invoice_object.coltype")) = 'NUMBER' then 
						vstr_dwo_related[li_idx].db_dr_cr_object = rds_copied[upperbound(rds_copied[])].getitemnumber(1,'invoice_object')
					end if
				else
//						if lc_dwsr.f_copy(ldw_master, ldw_copied, rds_copied[upperbound(rds_copied[])], vs_type_copy) = -1 then return -1
					//-- dùng hàm mới: cho phép copy chọn hoặc ko chọn ở line--//
					if upperbound(vstr_dwo_related[li_idx].b_selected[]) > 0 then
						if lc_dwsr.f_copy(ldw_master, ldw_copied, rds_copied[upperbound(rds_copied[])], vstr_dwo_related[li_idx].b_selected[li_idx1]) = -1 then return -1
					else
						if lc_dwsr.f_copy(ldw_master, ldw_copied, rds_copied[upperbound(rds_copied[])], vs_type_copy) = -1 then return -1
					end if
				end if
			end if

		next

	end if
next
return 1
end function

public function integer f_set_data_copied_new (t_ds_db vds_copied[], s_str_dwo_related vstr_dwo_related[], string ls_type_copy, string vs_obj_related, s_w_multi_rb vw_t_copy);/*----------------------
Chỉnh mới cho trường hợp copy TO : open window tab mới.
-------------------------------------------
*/
int 				li_idx,li_idx1,li_idx3,li_idx5,ll_find,li_count_rlt_copy, li_ds_cnt
long				ll_rtn
string				las_to_col[],las_from_col[],las_column_sum[],ls_obj_ref_id,ls_find,las_empty[],las_dr_cr_obj_column[]
string				las_obj_ref_id[],las_f_obj_column_chk[],las_t_obj_column_chk[], las_match_column[], las_match_f_column[]
double			ldb_t_doc_id
c_string			lc_string
t_ds_db			lds_copied_master,lds_copied_tmp,lds_matching,lds_temp,lds_temp_1
t_dw_mpl			ldw_main_t ,ldw_copied,ldw_master,ldw_temp
c_dwservice		lc_dwsr

powerobject		lpo_cr_dr_object

s_object_display		ls_obj_dis
s_str_dwo_related		ls_str_related[]


lds_matching = create t_ds_db
lds_copied_tmp = create t_ds_db
lds_matching.dataobject = 'ds_matching'
li_ds_cnt = upperbound(vds_copied[])
ic_obj_handling.is_copy_stage = 'data_setting'
for li_idx = 1 to upperbound(vstr_dwo_related)
	if vs_obj_related <> vstr_dwo_related[li_idx].s_related_obj_name then continue  //--nếu không phải obj cần copy thì bỏ qua--//
	
	ic_obj_handling.ib_copy_tax = vstr_dwo_related[li_idx].b_copy_tax
	li_count_rlt_copy = upperbound(vstr_dwo_related[li_idx].s_related_obj_dwo_copy)
	for li_idx1 = 1 to li_count_rlt_copy

		if li_idx1=1 then 
			ls_obj_dis = vw_t_copy.f_get_obj_handling( )
			ls_obj_dis.ib_copy_tax = ic_obj_handling.ib_copy_tax 
			ls_obj_dis.f_get_data_related( ls_str_related[])
			ls_obj_dis.f_set_data_related(vstr_dwo_related[] )
			ll_rtn = vw_t_copy.event e_add( )
			ldw_main_t = vw_t_copy.f_get_dwmain( )
			ldb_t_doc_id  = ldw_main_t.getitemnumber( ll_rtn, 'ID')
		end if
		
		if vds_copied[li_idx1].rowcount() = 0 and li_idx1 < li_count_rlt_copy then continue
		if vds_copied[li_idx1].rowcount() = 0 and li_idx1 = li_count_rlt_copy then exit		
		ldw_copied = vw_t_copy.f_get_dw( vstr_dwo_related[li_idx].s_related_obj_dwo_copy[li_idx1])
		
		las_to_col = las_empty
		las_from_col = las_empty
		las_column_sum = las_empty
		las_f_obj_column_chk = las_empty
		las_t_obj_column_chk = las_empty
		las_match_column = las_empty
		lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_related_obj_column_copy[li_idx1], ';', las_to_col)
		lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_main_obj_column_copy[li_idx1], ';', las_from_col)
		lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_main_obj_column_sum[li_idx1], ';', las_column_sum)
		lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_f_obj_column_chk[li_idx1], ';', las_f_obj_column_chk)
		lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_t_obj_column_chk[li_idx1], ';', las_t_obj_column_chk)
		if vstr_dwo_related[li_idx].s_main_obj_dwo_copy[li_idx1] = vstr_dwo_related[li_idx].s_match_f_dwo[ li_idx1] and &
			vstr_dwo_related[li_idx].s_related_obj_dwo_copy[li_idx1] = vstr_dwo_related[li_idx].s_match_t_dwo[ li_idx1] then
				lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_match_column[li_idx1], ';', las_match_column)
				lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_match_f_column[li_idx1], ';', las_match_f_column)
		end if
		if vstr_dwo_related[li_idx].b_f_sum[li_idx1] then
			lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_main_dr_cr_obj_column_sum[li_idx1], ';', las_dr_cr_obj_column)
			if isvalid(lpo_cr_dr_object) then
				if upper(ls_type_copy) = 'COPYT' then
					lds_temp = lpo_cr_dr_object
					if lds_temp.dataobject <> vstr_dwo_related[li_idx].s_main_dr_cr_obj_dwo_sum[li_idx1] then 
						for li_idx3 = 1 to upperbound(vds_copied[])
							if lds_temp.dataobject = vds_copied[li_idx3].dataobject then 
								lds_temp = vds_copied[li_idx3]
								exit
							end if
						next
					end if
				else
					lpo_cr_dr_object = this.f_get_dw( vstr_dwo_related[li_idx].s_main_dr_cr_obj_dwo_sum[li_idx1])
				end if
			else
				if upper(ls_type_copy) = 'COPYT' then
					for li_idx3 = 1 to li_ds_cnt //upperbound(vds_copied[])
						if vds_copied[li_idx3].dataobject =  vstr_dwo_related[li_idx].s_main_dr_cr_obj_dwo_sum[li_idx1] then
							lpo_cr_dr_object = vds_copied[li_idx3]
							exit
						end if
					next
				else
					lpo_cr_dr_object = this.f_get_dw( vstr_dwo_related[li_idx].s_main_dr_cr_obj_dwo_sum[li_idx1])
				end if
			end if
		end if
		lds_copied_master = lds_temp_1
		ldw_master = ldw_temp
		if li_idx1 > 1 then
			if vstr_dwo_related[li_idx].s_related_obj_dwo_copy[li_idx1] = vstr_dwo_related[li_idx].s_related_obj_dwo_copy[li_idx1 - 1]  and ldw_copied.rowcount() > 0 then // trường hợp 2 hay nhiều ds copy vào 1 dw
				ll_rtn = lc_dwsr.f_update_data_copied( las_from_col, las_to_col, vstr_dwo_related[li_idx].b_f_sum[li_idx1], las_f_obj_column_chk, las_t_obj_column_chk, las_column_sum, vds_copied[li_idx1], ldw_copied, lpo_cr_dr_object, las_dr_cr_obj_column, las_match_column, las_match_f_column,  ldb_t_doc_id, lds_matching, ic_obj_handling,vstr_dwo_related[li_idx])
				if ll_rtn = -1 then return -1
				continue
			elseif vstr_dwo_related[li_idx].s_main_obj_dwo_copy[li_idx1] = vstr_dwo_related[li_idx].s_main_obj_dwo_copy[li_idx1 - 1] then // trường hợp 1 ds copy ra 2 hay nhiều dw
				for li_idx5 = 1 to vds_copied[li_idx1].rowcount()
					las_obj_ref_id[li_idx5] = string(vds_copied[li_idx1].getitemnumber(li_idx5,'ID'))
				next
				lds_copied_tmp.dataobject = vds_copied[li_idx1].dataobject
				lc_dwsr.f_copy_f_t( vds_copied[li_idx1], lds_copied_tmp)
				lds_copied_master = lds_copied_tmp
//				ldw_copied = vw_t_copy.f_get_dw( vstr_dwo_related[li_idx].s_related_obj_dwo_copy[li_idx1]) // lấy dw thứ 2
//				if not isvalid(lds_copied_tmp) then
//					lds_copied_tmp = vds_copied[li_idx1 - 1] //lấy ds đầu tiên có dữ liệu cất vào ds tạm
//				else
//					if lds_copied_tmp.dataobject <> vds_copied[li_idx1 - 1].dataobject then lds_copied_tmp = vds_copied[li_idx1 - 1] //lấy ds đầu tiên có dữ liệu cất vào ds tạm
//				end if
//				ll_rtn = lc_dwsr.f_update_data_copied( las_from_col, las_to_col, vstr_dwo_related[li_idx].b_f_sum[li_idx1], las_f_obj_column_chk, las_t_obj_column_chk, las_column_sum, lds_copied_tmp, ldw_copied, lpo_cr_dr_object, las_dr_cr_obj_column, las_match_column, las_match_f_column,  ldb_t_doc_id, lds_matching, ic_obj_handling,vstr_dwo_related[li_idx])
//				if ll_rtn = -1 then return -1
//				continue
			end if
		end if
		//-- dời lên trên đầu vòng for --//
//		ldw_copied = vw_t_copy.f_get_dw( vstr_dwo_related[li_idx].s_related_obj_dwo_copy[li_idx1])
		ldw_master = ldw_copied.f_get_idw_master( )
		if ldw_copied.f_get_ib_shared( ) then
			ldw_copied = ldw_master
		end if
		if isvalid(ldw_copied) then
			if ldw_copied.dataobject = ldw_main_t.dataobject then //nếu là master
				if not vstr_dwo_related[li_idx].b_f_sum[li_idx1] then
					for li_idx3 = 1 to upperbound(las_to_col)
						ldw_copied.setitem( ll_rtn,las_to_col[li_idx3] ,vds_copied[li_idx1].f_getitemany( 1, las_from_col[li_idx3]) )
					next
				else //nếu có sum
					if vw_t_copy.f_set_data( vds_copied[li_idx1], lds_copied_master, ldw_copied, ldw_master, las_obj_ref_id, las_to_col, las_from_col, las_f_obj_column_chk, las_t_obj_column_chk, false, vstr_dwo_related[li_idx].b_f_sum[li_idx1], las_column_sum, lpo_cr_dr_object, las_dr_cr_obj_column, las_match_column, las_match_f_column, ldb_t_doc_id, lds_matching,vstr_dwo_related[li_idx]) = -1 then return -1
				end if
			else
				ldw_master = ldw_copied.f_get_idw_master( )
				if ldw_master.dataobject = ldw_main_t.dataobject then // detail cấp 1
					if isvalid(lds_copied_master) then
						if lds_copied_master.dataobject <> vds_copied[li_idx1].dataobject then
							ls_find = lc_dwsr.f_find_obj_ref_id( vds_copied[li_idx1])
							lc_string.f_stringtoarray(ls_find , ';', las_obj_ref_id)
						end if
					else
						ls_find = lc_dwsr.f_find_obj_ref_id( vds_copied[li_idx1])
						lc_string.f_stringtoarray(ls_find , ';', las_obj_ref_id)
					end if
					if ldw_copied.f_get_ib_relation_1_1()  then // dw copy đã được thêm mới sau khi mater của dw copy thêm mới, nên không cần thêm mới cho dw copy
						if vw_t_copy.f_set_data( vds_copied[li_idx1], lds_copied_master, ldw_copied,ldw_master,las_obj_ref_id, las_to_col,las_from_col, las_f_obj_column_chk, las_t_obj_column_chk, false, vstr_dwo_related[li_idx].b_f_sum[li_idx1], las_column_sum,lpo_cr_dr_object,las_dr_cr_obj_column, las_match_column, las_match_f_column, ldb_t_doc_id, lds_matching,vstr_dwo_related[li_idx]) = -1 then return -1
					else
						if vw_t_copy.f_set_data( vds_copied[li_idx1], lds_copied_master, ldw_copied,ldw_master,las_obj_ref_id, las_to_col,las_from_col, las_f_obj_column_chk, las_t_obj_column_chk, true, vstr_dwo_related[li_idx].b_f_sum[li_idx1], las_column_sum,lpo_cr_dr_object,las_dr_cr_obj_column, las_match_column, las_match_f_column, ldb_t_doc_id, lds_matching,vstr_dwo_related[li_idx]) = -1 then return -1
					end if
				else //detail cấp 2 trở đi
					//lấy object_ref_id khác nhau giữa các dòng của ds tức là copy nhiều mater của ds
					if not isvalid(lds_copied_master) then
						ls_find = lc_dwsr.f_find_obj_ref_id( vds_copied[li_idx1])
						lc_string.f_stringtoarray(ls_find , ';', las_obj_ref_id)
						//lấy ds master của ds đang copy
						//-- dời lên trên đầu vòng for --//
//						if vds_copied[li_idx1].rowcount() = 0 and li_idx1 < li_count_rlt_copy then continue
//						if vds_copied[li_idx1].rowcount() = 0 and li_idx1 = li_count_rlt_copy then exit
						for li_idx5 = 1 to li_ds_cnt
							if li_idx5 = li_idx1 then continue
							ll_find = vds_copied[li_idx5].find('ID =' + string(vds_copied[li_idx1].getitemnumber(1,'object_ref_id')),1,vds_copied[li_idx5].rowcount())
							if ll_find > 0 then 
								lds_copied_master = vds_copied[li_idx5]
								exit
							end if
						next
					end if
					if ldw_copied.f_get_ib_relation_1_1() then // dw copy đã được thêm mới sau khi mater của dw copy thêm mới, nên không cần thêm mới cho dw copy
						if vw_t_copy.f_set_data( vds_copied[li_idx1], lds_copied_master, ldw_copied,ldw_master,las_obj_ref_id, las_to_col,las_from_col, las_f_obj_column_chk, las_t_obj_column_chk, false, vstr_dwo_related[li_idx].b_f_sum[li_idx1], las_column_sum,lpo_cr_dr_object,las_dr_cr_obj_column, las_match_column, las_match_f_column, ldb_t_doc_id, lds_matching,vstr_dwo_related[li_idx]) = -1 then return -1
					else
						if vw_t_copy.f_set_data( vds_copied[li_idx1], lds_copied_master, ldw_copied,ldw_master,las_obj_ref_id, las_to_col,las_from_col, las_f_obj_column_chk, las_t_obj_column_chk, true, vstr_dwo_related[li_idx].b_f_sum[li_idx1], las_column_sum,lpo_cr_dr_object,las_dr_cr_obj_column, las_match_column, las_match_f_column, ldb_t_doc_id, lds_matching,vstr_dwo_related[li_idx]) = -1 then return -1
					end if
				end if
			end if
		else
			gf_messagebox('m.s_w_multi.f_set_data_copied.01','Thông báo','Khai báo copy tên dwo '+vstr_dwo_related[li_idx].s_related_obj_dwo_copy[li_idx1]+' chưa đúng','exclamation','ok',1)
			return -1
		end if
	next
next
if lds_matching.rowcount( ) > 0 then
	ls_obj_dis.dynamic f_set_ids_matching(lds_matching)
//	//-- update lại tax_pact nếu có--//
//	ic_obj_handling.dynamic f_update_tax_pct()
end if
//ic_obj_handling.ib_copy_tax = false
destroy lds_matching
destroy lds_copied_tmp
ls_obj_dis.f_set_data_related(ls_str_related[] )
return 1
end function

public function integer f_set_data_copied (t_ds_db vds_copied[], s_str_dwo_related vstr_dwo_related[], string ls_type_copy, string vs_obj_related, s_w_multi_rb vw_f_copy);int 				li_idx,li_idx1,li_idx3,li_idx5,ll_find,li_count_rlt_copy
long				ll_rtn
string				las_to_col[],las_from_col[],las_column_sum[],ls_obj_ref_id,ls_find,las_empty[],las_dr_cr_obj_column[]
string				las_obj_ref_id[],las_f_obj_column_chk[],las_t_obj_column_chk[], las_match_column[], las_match_f_column[]
double			ldb_t_doc_id
c_string			lc_string
t_ds_db			lds_copied_master,lds_copied_tmp,lds_matching,lds_temp,lds_temp_1
t_dw_mpl			ldw_main_t ,ldw_copied,ldw_master,ldw_temp
c_dwservice		lc_dwsr
t_transaction	lt_transaction
powerobject		lpo_cr_dr_object

s_object_display	ls_obj_dis
s_str_dwo_related	ls_str_related[]


lds_matching = create t_ds_db
lds_copied_tmp = create t_ds_db
lds_matching.dataobject = 'ds_matching'
this.f_get_transaction( lt_transaction)
ic_obj_handling.is_copy_stage = 'data_setting'
for li_idx = 1 to upperbound(vstr_dwo_related)
	if vs_obj_related <> vstr_dwo_related[li_idx].s_related_obj_name then continue  //--nếu không phải obj cần copy thì bỏ qua--//
	
	ic_obj_handling.ib_copy_tax = vstr_dwo_related[li_idx].b_copy_tax
	li_count_rlt_copy = upperbound(vstr_dwo_related[li_idx].s_related_obj_dwo_copy)
	for li_idx1 = 1 to li_count_rlt_copy
		if li_idx1=1 then 
			ls_obj_dis = this.f_get_obj_handling( )
			ls_obj_dis.ib_copy_tax = ic_obj_handling.ib_copy_tax 
			ls_obj_dis.f_get_data_related( ls_str_related[])
			ls_obj_dis.f_set_data_related(vstr_dwo_related[] )
			ll_rtn = this.event e_add( )
			ldw_main_t = this.f_get_dwmain( )
			ldb_t_doc_id  = ldw_main_t.getitemnumber( ll_rtn, 'ID')
		end if
		las_to_col = las_empty
		las_from_col = las_empty
		las_column_sum = las_empty
		las_f_obj_column_chk = las_empty
		las_t_obj_column_chk = las_empty
		las_match_column = las_empty
		lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_related_obj_column_copy[li_idx1], ';', las_to_col)
		lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_main_obj_column_copy[li_idx1], ';', las_from_col)
		lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_main_obj_column_sum[li_idx1], ';', las_column_sum)
		lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_f_obj_column_chk[li_idx1], ';', las_f_obj_column_chk)
		lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_t_obj_column_chk[li_idx1], ';', las_t_obj_column_chk)
		if vstr_dwo_related[li_idx].s_main_obj_dwo_copy[li_idx1] = vstr_dwo_related[li_idx].s_match_f_dwo[ li_idx1] and &
			vstr_dwo_related[li_idx].s_related_obj_dwo_copy[li_idx1] = vstr_dwo_related[li_idx].s_match_t_dwo[ li_idx1] then
				lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_match_column[li_idx1], ';', las_match_column)
				lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_match_f_column[li_idx1], ';', las_match_f_column)
		end if
		if vstr_dwo_related[li_idx].b_f_sum[li_idx1] then
			lc_string.f_stringtoarray( vstr_dwo_related[li_idx].s_main_dr_cr_obj_column_sum[li_idx1], ';', las_dr_cr_obj_column)
			if isvalid(lpo_cr_dr_object) then
				if upper(ls_type_copy) = 'COPYT' then
					lds_temp = lpo_cr_dr_object
					if lds_temp.dataobject <> vstr_dwo_related[li_idx].s_main_dr_cr_obj_dwo_sum[li_idx1] then 
						for li_idx3 = 1 to upperbound(vds_copied[])
							if lds_temp.dataobject = vds_copied[li_idx3].dataobject then 
								lds_temp = vds_copied[li_idx3]
								exit
							end if
						next
					end if
				else
					lpo_cr_dr_object = vw_f_copy.f_get_dw( vstr_dwo_related[li_idx].s_main_dr_cr_obj_dwo_sum[li_idx1])
				end if
			else
				if upper(ls_type_copy) = 'COPYT' then
					for li_idx3 = 1 to upperbound(vds_copied[])
						if vds_copied[li_idx3].dataobject =  vstr_dwo_related[li_idx].s_main_dr_cr_obj_dwo_sum[li_idx1] then
							lpo_cr_dr_object = vds_copied[li_idx3]
							exit
						end if
					next
				else
					lpo_cr_dr_object = vw_f_copy.f_get_dw( vstr_dwo_related[li_idx].s_main_dr_cr_obj_dwo_sum[li_idx1])
				end if
			end if
		end if
		lds_copied_master = lds_temp_1
		ldw_master = ldw_temp
		if li_idx1 > 1 then
			if vstr_dwo_related[li_idx].s_related_obj_dwo_copy[li_idx1] = vstr_dwo_related[li_idx].s_related_obj_dwo_copy[li_idx1 - 1] and ldw_copied.rowcount( ) > 0 then // trường hợp 2 hay nhiều ds copy vào 1 dw
				ll_rtn = lc_dwsr.f_update_data_copied( las_from_col, las_to_col, vstr_dwo_related[li_idx].b_f_sum[li_idx1], las_f_obj_column_chk, las_t_obj_column_chk, las_column_sum, vds_copied[li_idx1], ldw_copied, lpo_cr_dr_object, las_dr_cr_obj_column, las_match_column, las_match_f_column,  ldb_t_doc_id, lds_matching, ic_obj_handling,vstr_dwo_related[li_idx])
				if ll_rtn = -1 then return -1
				continue
			elseif vstr_dwo_related[li_idx].s_main_obj_dwo_copy[li_idx1] = vstr_dwo_related[li_idx].s_main_obj_dwo_copy[li_idx1 - 1] then // trường hợp 1 ds copy ra 2 hay nhiều dw
				for li_idx5 = 1 to vds_copied[li_idx1].rowcount()
					las_obj_ref_id[li_idx5] = string(vds_copied[li_idx1].getitemnumber(li_idx5,'ID'))
				next
				lds_copied_tmp.dataobject = vds_copied[li_idx1].dataobject
				lc_dwsr.f_copy_f_t( vds_copied[li_idx1], lds_copied_tmp)
				lds_copied_master = lds_copied_tmp
//				ldw_copied = this.f_get_dw( vstr_dwo_related[li_idx].s_related_obj_dwo_copy[li_idx1]) // lấy dw thứ 2
//				if not isvalid(lds_copied_tmp) then
//					lds_copied_tmp = vds_copied[li_idx1 - 1] //lấy ds đầu tiên có dữ liệu cất vào ds tạm
//				else
//					if lds_copied_tmp.dataobject <> vds_copied[li_idx1 - 1].dataobject then lds_copied_tmp = vds_copied[li_idx1 - 1] //lấy ds đầu tiên có dữ liệu cất vào ds tạm
//				end if
//				ll_rtn = lc_dwsr.f_update_data_copied( las_from_col, las_to_col, vstr_dwo_related[li_idx].b_f_sum[li_idx1], las_f_obj_column_chk, las_t_obj_column_chk, las_column_sum, lds_copied_tmp, ldw_copied, lpo_cr_dr_object, las_dr_cr_obj_column, las_match_column, las_match_f_column,  ldb_t_doc_id, lds_matching, ic_obj_handling,vstr_dwo_related[li_idx])
//				if ll_rtn = -1 then return -1
//				continue
			end if
		end if
		ldw_copied = this.f_get_dw( vstr_dwo_related[li_idx].s_related_obj_dwo_copy[li_idx1])
		ldw_master = ldw_copied.f_get_idw_master( )
		if ldw_copied.f_get_ib_shared( ) then
			ldw_copied = ldw_master
		end if
		if isvalid(ldw_copied) then
			if ldw_copied.dataobject = ldw_main_t.dataobject then //nếu là master
				if not vstr_dwo_related[li_idx].b_f_sum[li_idx1] then
					for li_idx3 = 1 to upperbound(las_to_col)
						ldw_copied.setitem( ll_rtn,las_to_col[li_idx3] ,vds_copied[li_idx1].f_getitemany( 1, las_from_col[li_idx3]) )
					next
				else //nếu có sum
					if this.f_set_data( vds_copied[li_idx1], lds_copied_master, ldw_copied, ldw_master, las_obj_ref_id, las_to_col, las_from_col, las_f_obj_column_chk, las_t_obj_column_chk, false, vstr_dwo_related[li_idx].b_f_sum[li_idx1], las_column_sum, lpo_cr_dr_object, las_dr_cr_obj_column, las_match_column, las_match_f_column, ldb_t_doc_id, lds_matching,vstr_dwo_related[li_idx]) = -1 then return -1
				end if
			else
				ldw_master = ldw_copied.f_get_idw_master( )
				if ldw_master.dataobject = ldw_main_t.dataobject then // detail cấp 1
					if isvalid(lds_copied_master) then
						if lds_copied_master.dataobject <> vds_copied[li_idx1].dataobject then
							ls_find = lc_dwsr.f_find_obj_ref_id( vds_copied[li_idx1])
							lc_string.f_stringtoarray(ls_find , ';', las_obj_ref_id)
						end if
					else
						ls_find = lc_dwsr.f_find_obj_ref_id( vds_copied[li_idx1])
						lc_string.f_stringtoarray(ls_find , ';', las_obj_ref_id)
					end if
					if ldw_copied.f_get_ib_relation_1_1()  then // dw copy đã được thêm mới sau khi mater của dw copy thêm mới, nên không cần thêm mới cho dw copy
						if this.f_set_data( vds_copied[li_idx1], lds_copied_master, ldw_copied,ldw_master,las_obj_ref_id, las_to_col,las_from_col, las_f_obj_column_chk, las_t_obj_column_chk, false, vstr_dwo_related[li_idx].b_f_sum[li_idx1], las_column_sum,lpo_cr_dr_object,las_dr_cr_obj_column, las_match_column, las_match_f_column, ldb_t_doc_id, lds_matching,vstr_dwo_related[li_idx]) = -1 then return -1
					else
						if this.f_set_data( vds_copied[li_idx1], lds_copied_master, ldw_copied,ldw_master,las_obj_ref_id, las_to_col,las_from_col, las_f_obj_column_chk, las_t_obj_column_chk, true, vstr_dwo_related[li_idx].b_f_sum[li_idx1], las_column_sum,lpo_cr_dr_object,las_dr_cr_obj_column, las_match_column, las_match_f_column, ldb_t_doc_id, lds_matching,vstr_dwo_related[li_idx]) = -1 then return -1
					end if
				else //detail cấp 2 trở đi
					//lấy object_ref_id khác nhau giữa các dòng của ds tức là copy nhiều mater của ds
					if not isvalid(lds_copied_master) then
						ls_find = lc_dwsr.f_find_obj_ref_id( vds_copied[li_idx1])
						lc_string.f_stringtoarray(ls_find , ';', las_obj_ref_id)
						//lấy ds master của ds đang copy
						if vds_copied[li_idx1].rowcount() = 0 and li_idx1 < li_count_rlt_copy then continue
						if vds_copied[li_idx1].rowcount() = 0 and li_idx1 = li_count_rlt_copy then exit
						for li_idx5 = 1 to upperbound(vds_copied)
							if li_idx5 = li_idx1 then continue
							ll_find = vds_copied[li_idx5].find('ID =' + string(vds_copied[li_idx1].getitemnumber(1,'object_ref_id')),1,vds_copied[li_idx5].rowcount())
							if ll_find > 0 then 
								lds_copied_master = vds_copied[li_idx5]
								exit
							end if
						next
					end if
					if ldw_copied.f_get_ib_relation_1_1() then // dw copy đã được thêm mới sau khi mater của dw copy thêm mới, nên không cần thêm mới cho dw copy
						if this.f_set_data( vds_copied[li_idx1], lds_copied_master, ldw_copied,ldw_master,las_obj_ref_id, las_to_col,las_from_col, las_f_obj_column_chk, las_t_obj_column_chk, false, vstr_dwo_related[li_idx].b_f_sum[li_idx1], las_column_sum,lpo_cr_dr_object,las_dr_cr_obj_column, las_match_column, las_match_f_column, ldb_t_doc_id, lds_matching,vstr_dwo_related[li_idx]) = -1 then return -1
					else
						if this.f_set_data( vds_copied[li_idx1], lds_copied_master, ldw_copied,ldw_master,las_obj_ref_id, las_to_col,las_from_col, las_f_obj_column_chk, las_t_obj_column_chk, true, vstr_dwo_related[li_idx].b_f_sum[li_idx1], las_column_sum,lpo_cr_dr_object,las_dr_cr_obj_column, las_match_column, las_match_f_column, ldb_t_doc_id, lds_matching,vstr_dwo_related[li_idx]) = -1 then return -1
					end if
				end if
			end if
		else
			gf_messagebox('m.s_w_multi.f_set_data_copied.01','Thông báo','Khai báo copy tên dwo '+vstr_dwo_related[li_idx].s_related_obj_dwo_copy[li_idx1]+' chưa đúng','exclamation','ok',1)
			return -1
		end if
	next
next
if lds_matching.rowcount( ) > 0 then
	ic_obj_handling.dynamic f_set_ids_matching(lds_matching)
//	//-- update lại tax_pact nếu có--//
//	ic_obj_handling.dynamic f_update_tax_pct()
end if
//ic_obj_handling.ib_copy_tax = false
destroy lds_matching
destroy lds_copied_tmp
ls_obj_dis.f_set_data_related(ls_str_related[] )
return 1
end function

public function integer f_ctrl_enable_button (t_dw_mpl vdw_focus);

this.ic_obj_handling.f_ctrl_enable_button( t_w_mdi.rbb_1, vdw_focus)
return 1
end function

public function integer f_filter_dwmain_new ();s_str_dwo_tabpage	lstr_dwo_tab[]
b_obj_instantiate		lobj_ins

t_dw_mpl			ldw_main
string					ls_filterstring, ls_text, ls_colname
double				ldb_ID
long					ll_currentrow, ll_originalrow


if dw_filter.is_filter_type = '1' then
		
	ls_text = this.dw_filter.gettext( ) // getitemstring( 1, 'filter_string')	
		
	if ic_obj_handling.classname( ) = 'u_valueset' or  ic_obj_handling.classname( ) = 'u_onhand'   then
		ic_obj_handling.f_get_dwo_tabpage( lstr_dwo_tab[])
		ldw_main = this.f_get_dw( lstr_dwo_tab[1].str_dwo[1].s_dwo_default)
		if isnull(ldw_main) then
			ldw_main = this.f_get_dwmain( )
		end if
	else
		ldw_main = this.f_get_dwmain( )
	end if
	
	if isnull(ls_text) or ls_text = '' then
		ls_filterstring = ''
	else
		ls_colname =  this.dw_filter.getitemstring( 1, 'colname')
		if ls_colname = '' or isnull(ls_colname) then
			if left(ldw_main.describe( 'obj_search.coltype'), 5) = 'char(' then 
				ls_colname = 'obj_search'
			elseif left(ldw_main.describe( 'doc_search.coltype'), 5) = 'char(' then
				ls_colname = 'doc_search'
			end if
		end if
		if isnull(ls_colname) or ls_colname ='' then
			ls_filterstring = lobj_ins.f_get_filterstring( ldw_main,ls_text )
		else
			ls_filterstring = lobj_ins.f_get_filterstring( ldw_main,ls_text , ls_colname)
		end if
	end if
	
	if isvalid(ldw_main) then
		ll_originalrow = ldw_main.getrow()
		if ll_originalrow > 0 then
			if ldw_main.describe( "ID.coltype") <> '!' then	ldb_ID = ldw_main.getitemnumber( ll_originalrow, 'ID')
		end if
		ldw_main.setfilter(ls_filterstring )
		ldw_main.filter( )
		ldw_main.f_set_gutter_rowcount( )
		if ldb_ID > 0 then
			ll_currentrow = ldw_main.find( "ID = "+string(ldb_ID), 1, ldw_main.rowcount())
			if ll_currentrow = 0 then ll_currentrow = 1
			ldw_main.scrolltorow( ll_currentrow)
			// truong hop copy from thi khong filter_detail
			if not ic_obj_handling.ib_copying then
				if ll_currentrow = 1 and ll_originalrow = 1 then
					ldw_main.f_filter_detail( )
					this.f_ctrl_enable_button(ldw_main )
	//				ic_obj_handling.f_ctrl_actionbuttons(ldw_main)
	//				this.triggerevent( "e_display_actionbutton" )
				end if
			end if
		elseif ldw_main.rowcount() = 1 or ldw_main.getrow( ) = 1  then
			ldw_main.f_filter_detail( )
		end if
	
	end if
	
	//ic_obj_handling.is_dwmain_filter = ls_filterstring
else
	this.f_filter_dwmain( )
end if
return 0
end function

public function integer f_filter_dwmain ();s_str_dwo_tabpage	lstr_dwo_tab[]

t_dw_mpl			ldw_main
string					ls_filterstring
double				ldb_ID
long					ll_currentrow, ll_originalrow

if ic_obj_handling.classname( ) = 'u_valueset' then
	ic_obj_handling.f_get_dwo_tabpage( lstr_dwo_tab[])
	ldw_main = this.f_get_dw( lstr_dwo_tab[1].str_dwo[1].s_dwo_default)
	if isnull(ldw_main) then
		ldw_main = this.f_get_dwmain( )
	end if
else
	ldw_main = this.f_get_dwmain( )
end if

ls_filterstring = dw_filter.f_get_filterstring_ex( ldw_main)
if isnull(ls_filterstring) or ls_filterstring = '' then
	ic_obj_handling.is_dwmain_filter = ''
//	return 0
end if

if isvalid(ldw_main) then
	ll_originalrow = ldw_main.getrow()
	if ll_originalrow > 0 then
		if ldw_main.describe( "ID.coltype") <> '!' then	ldb_ID = ldw_main.getitemnumber( ll_originalrow, 'ID')
	end if
	ldw_main.setfilter(ls_filterstring )
	ldw_main.filter( )
	ldw_main.f_set_gutter_rowcount( )
	if ldb_ID > 0 then
		ll_currentrow = ldw_main.find( "ID = "+string(ldb_ID), 1, ldw_main.rowcount())
		if ll_currentrow = 0 then ll_currentrow = 1
		ldw_main.scrolltorow( ll_currentrow)
		// truong hop copy from thi khong filter_detail
		if not ic_obj_handling.ib_copying then
			if ll_currentrow = 1 and ll_originalrow = 1 then
				ldw_main.f_filter_detail( )
//				ic_obj_handling.f_ctrl_actionbuttons(ldw_main)
//				this.triggerevent( "e_display_actionbutton" )
			end if
		end if
	end if
//	if ls_filterstring <> '' then		
//		dw_filter.setitem( 1, 'gutter', 'Y')
//	else
//		dw_filter.setitem( 1, 'gutter', 'N')
//	end if
end if

ic_obj_handling.is_dwmain_filter = ls_filterstring

return 0
end function

public function integer f_resize_up_1d_lo_1d_tb ();
//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight)
dw_1.width =  ii_resize_width - this.ii_vscrollbar
dw_1.height = ii_upperpart_height * ii_resize_height

//-- resize horizontal line --//
gb_2.move( tab_action.x, tab_action.y + tab_action.height + ii_spare_space + ii_filter_space + ii_text_spaceheight + dw_1.height)
gb_2.width =   ii_resize_width - this.ii_vscrollbar
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if

//-- resize dw_2 --//
dw_2.move( tab_action.x, gb_2.y + gb_2.height)
dw_2.width = ii_leftpart_width * ii_resize_width
dw_2.height = max(ii_resize_height - this.ii_hscrollbar - (gb_2.y + gb_2.height ), 0)	


//-- resize gb_1 --//
gb_1.move(dw_2.x + ii_leftpart_width* ii_resize_width, gb_2.y + gb_2.height)
gb_1.height = max(ii_resize_height - this.ii_hscrollbar - (gb_2.y + gb_2.height ), 0)	
gb_1.width = 24


//-- resize tab --//
tab_1.move( gb_1.x +gb_1.width, gb_2.y + gb_2.height )
tab_1.width =   ii_resize_width  - gb_1.x - gb_1.width  - this.ii_vscrollbar
tab_1.height =  max(ii_resize_height - this.ii_hscrollbar - (gb_2.y + gb_2.height ), 0)		

return 1
end function

public function integer f_resize_1d3d ();
//-- resize dw_1 --//
dw_1.move( tab_action.x, tab_action.y + tab_action.height + ii_text_spaceheight + ii_filter_space + ii_spare_space)
dw_1.width = ii_resize_width - this.ii_vscrollbar
dw_1.height =  ii_upperpart_height * ii_resize_height

//-- resize horizontal line --//
gb_2.move( tab_action.x, dw_1.y + dw_1.height )
gb_2.width =  ii_resize_width - this.ii_vscrollbar
gb_2.height = 50

//-- resize dw_2 --//
dw_2.move( tab_action.x , gb_2.y + gb_2.height )
dw_2.width =  ii_resize_width - this.ii_vscrollbar
dw_2.height =  dw_2.f_getheight( 1)

//-- resize dw_2 --//
dw_3.move( tab_action.x , dw_2.y + dw_2.height )
dw_3.width =  ii_resize_width - this.ii_vscrollbar
dw_3.height =   dw_3.f_getheight( 1)

//-- resize dw_2 --//
dw_4.move( tab_action.x , dw_3.y + dw_3.height )
dw_4.width =  ii_resize_width - this.ii_vscrollbar
dw_4.height =   dw_4.f_getheight( 1)

return 1
end function

on s_w_multi_rb.create
int iCurrent
call super::create
this.dw_2=create dw_2
this.tab_1=create tab_1
this.dw_4=create dw_4
this.tv_1=create tv_1
this.dw_5=create dw_5
this.dw_6=create dw_6
this.ddlb_1=create ddlb_1
this.ddlb_2=create ddlb_2
this.cbx_1=create cbx_1
this.htb_1=create htb_1
this.cbx_2=create cbx_2
this.sle_1=create sle_1
this.st_2=create st_2
this.gb_2=create gb_2
this.gb_1=create gb_1
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_5=create gb_5
this.gb_6=create gb_6
this.gb_8=create gb_8
this.gb_9=create gb_9
this.gb_10=create gb_10
this.gb_11=create gb_11
this.gb_12=create gb_12
this.dw_1=create dw_1
this.gb_7=create gb_7
this.dw_3=create dw_3
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_2
this.Control[iCurrent+2]=this.tab_1
this.Control[iCurrent+3]=this.dw_4
this.Control[iCurrent+4]=this.tv_1
this.Control[iCurrent+5]=this.dw_5
this.Control[iCurrent+6]=this.dw_6
this.Control[iCurrent+7]=this.ddlb_1
this.Control[iCurrent+8]=this.ddlb_2
this.Control[iCurrent+9]=this.cbx_1
this.Control[iCurrent+10]=this.htb_1
this.Control[iCurrent+11]=this.cbx_2
this.Control[iCurrent+12]=this.sle_1
this.Control[iCurrent+13]=this.st_2
this.Control[iCurrent+14]=this.gb_2
this.Control[iCurrent+15]=this.gb_1
this.Control[iCurrent+16]=this.gb_3
this.Control[iCurrent+17]=this.gb_4
this.Control[iCurrent+18]=this.gb_5
this.Control[iCurrent+19]=this.gb_6
this.Control[iCurrent+20]=this.gb_8
this.Control[iCurrent+21]=this.gb_9
this.Control[iCurrent+22]=this.gb_10
this.Control[iCurrent+23]=this.gb_11
this.Control[iCurrent+24]=this.gb_12
this.Control[iCurrent+25]=this.dw_1
this.Control[iCurrent+26]=this.gb_7
this.Control[iCurrent+27]=this.dw_3
this.Control[iCurrent+28]=this.rb_1
this.Control[iCurrent+29]=this.rb_2
this.Control[iCurrent+30]=this.rb_3
end on

on s_w_multi_rb.destroy
call super::destroy
destroy(this.dw_2)
destroy(this.tab_1)
destroy(this.dw_4)
destroy(this.tv_1)
destroy(this.dw_5)
destroy(this.dw_6)
destroy(this.ddlb_1)
destroy(this.ddlb_2)
destroy(this.cbx_1)
destroy(this.htb_1)
destroy(this.cbx_2)
destroy(this.sle_1)
destroy(this.st_2)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_5)
destroy(this.gb_6)
destroy(this.gb_8)
destroy(this.gb_9)
destroy(this.gb_10)
destroy(this.gb_11)
destroy(this.gb_12)
destroy(this.dw_1)
destroy(this.gb_7)
destroy(this.dw_3)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
end on

event e_print;call super::e_print;t_dw	ldw_print

ldw_print = ic_obj_handling.f_get_dw_print( )
if ldw_print.is_printtype = 'nodialog' then
	ldw_print.triggerevent( 'e_print_no_dialog')
else
	ldw_print.triggerevent( 'e_print')
end if
return 1
end event

event e_cancel;call super::e_cancel;datawindow     ldw_document
string              ls_status
int                   li_rtn
long				ll_currentrow
double			ldb_doc_id

ldw_document=this.f_get_dwmain()
if isvalid(ldw_document) then
	ls_status=ldw_document.getitemstring(ldw_document.getrow(), 'status')
	
	if ls_status = 'new' or ls_status = 'req_change' or ls_status = 'rejected' then 
	li_rtn = gf_messagebox('m.s_w_multi.e_cancel.01','Thông báo','Bạn có chắc chắn hủy phiếu này không','Question','yesno',2)
		if li_rtn=1 then
			connect using it_transaction;
			ldb_doc_id = ldw_document.getitemnumber(ldw_document.getrow(), 'ID')
			li_rtn=ic_obj_handling.event e_window('e_cancel')
			if li_rtn >0 then
				ldw_document.setitem( ldw_document.getrow(), 'status','cancelled')
				ldw_document.settransobject(it_transaction)
				li_rtn = ldw_document.update( true,false)
				if li_rtn = 1 then
					ldw_document.resetupdate( )
					commit using it_transaction;
					ll_currentrow = ldw_document.find( "ID = " + string(ldb_doc_id), 1, ldw_document.rowcount())
					ldw_document.scrolltorow( ll_currentrow)				
					disconnect using it_transaction;
					this.event e_refresh( )
					return li_rtn
				else
					Rollback;
					disconnect using it_transaction;
					return -1
				end if
				
			else
				Rollback;
				disconnect using it_transaction;
				return -1
			end if
			disconnect using it_transaction;
		end if
	end if
end if
return 0









end event

event e_allocate;call super::e_allocate;int				li_rtn

//-- thông báo đến object --//
li_rtn = ic_obj_handling.event e_window( 'e_allocate')
if li_rtn = -1 then 
	return -1
end if
end event

event e_amortize;call super::e_amortize;int				li_rtn

//-- thông báo đến object --//
li_rtn = ic_obj_handling.event e_window( 'e_amortize')
if li_rtn = -1 then 
	return -1
end if
end event

event e_sendmail;call super::e_sendmail;c_dwservice		lc_dwser
t_dw_mpl		ldw_print
string				ls_path

ldw_print = ic_obj_handling.f_get_dw_print( )
if isvalid(ldw_print) or not isnull(ldw_print) then
ls_path = ldw_print.event e_printnodialog( )
	if isnull(ls_path)then
		//message
	else
		lc_dwser.f_send_mail( '', '', '', '',ls_path , '',true)
		filedelete(ls_path)
		//gf_messagebox('m.s_w_multi.e_sendmail.01','Thông báo','Gửi mail thành công','exclamation','ok',1)
	end if
end if
ic_obj_handling.event e_window( 'e_sendmail')
return 0
end event

event e_postopen;/*****************************************************************
Chức năng: Thống báo đến object
------------------------
OVERRIDE
===================================================*/
int				li_rtn, li_idx
long			ll_row_found
string		ls_display_model,ls_select_SQL
s_str_drilldown_data 		lstr_drilldown_data

//this.f_set_resize() khoá vì đã gọi trong event resize
ls_display_model = ic_obj_handling.dynamic f_get_display_model()
this.f_resize(ls_display_model )	
//--kiẻm tra open drilldown --//
if ic_obj_handling.f_get_drilldown_data( lstr_drilldown_data) > 1 then	
	li_rtn = ic_obj_handling.dynamic event e_window('e_postopen')
	ic_obj_handling.f_open_drilldown_rpt( )
	idw_focus.setfocus( )
	this.f_ctrl_enable_button(  idw_focus)
//	this.event e_display_actionbutton( )
	ib_opening = false
	return li_rtn
else		
	//-- Neu open object return 0 thi thuc hien retrieve idw_focus --//
	if vi_preopen_return = 0 then
		//-- retrieve ds_book --//
		if not ic_obj_handling.ib_copying then ic_obj_handling.dynamic f_book(0,false)
		//-- retrieve dw_focus --//
		if ic_obj_handling.classname() = 'u_onhand' then
			idw_focus = this.f_get_dw( 'd_onhand_grid')
		end if
		idw_focus.dynamic event e_refresh() 
		
//		if idw_focus.dynamic event e_refresh() = -9 or idw_focus.dynamic event e_refresh() = 0  then
//			this.f_ctrl_enable_button(  idw_focus)
//			ic_obj_handling.f_ctrl_actionbuttons(idw_focus)
//		end if
		
		//-- scroll đến record được chọn trong window search --//
	//	if idw_focus.rowcount( ) > 0 then
	//		if t_w_mdi.iw_search.idb_object_id > 0 then
	//			ll_row_found = idw_focus.find("ID =" + string(t_w_mdi.iw_search.idb_object_id), 1,  idw_focus.rowcount( ))
	//			t_w_mdi.iw_search.idb_object_id = 0
	//			if ll_row_found > 0 then
	//				idw_focus.scrolltorow(ll_row_found)
	//			end if
	//		end if
	//	end if
	
		//-- retrieve các DW độc lập --//
		FOR li_idx = 1 to upperbound(iadw_none_md[] )
			ls_select_SQL = iadw_none_md[li_idx].describe("Datawindow.Table.Select")
			if ls_select_SQL<>'' and ls_select_SQL <> '!' and left(iadw_none_md[li_idx].dataobject,3) <> 'dr_' and  iadw_none_md[li_idx].dataobject <> idw_focus.dataobject then
				iadw_none_md[li_idx].dynamic event e_refresh( ) 
			end if
		NEXT	
	else
//		this.f_ctrl_enable_button( idw_focus)
//		ic_obj_handling.f_ctrl_actionbuttons(idw_focus)
	end if
end if

li_rtn = ic_obj_handling.dynamic event e_window('e_postopen')
idw_focus.setfocus( )
this.f_ctrl_enable_button(  idw_focus)
//this.event e_display_actionbutton( )
ib_opening = false
disconnect using it_transaction;
return li_rtn

end event

event e_refresh;//-- Override--//
int					li_return, li_idx
string				ls_select_SQL
t_dw_mpl			ldw_main

connect using it_transaction;

//ic_obj_handling.ib_refresh = true
ic_obj_handling.f_set_ib_refresh( true)
li_return = ic_obj_handling.event e_window('e_refresh')
if li_return = 0 then
	this.dw_filter.accepttext( )
	ldw_main = this.f_get_dwmain( )
	ldw_main.event e_refresh( )
else
	if idw_focus.classname( ) = 'dw_filter' then
		ldw_main = this.f_get_dwmain( )
		this.f_set_idwfocus(ldw_main )
	end if	
	this.idw_focus.dynamic event e_refresh( )
end if
ic_obj_handling.f_set_ib_refresh( false)
ldw_main = this.f_get_dwmain( )
ldw_main.setfocus( )

disconnect using it_transaction;
return 0
end event

event e_save;//-- OVERRIDE --//

//-- Thực hiện lưu dữ liệu, return 1 ok, -1 lỗi --//
int 		li_rtn
t_ds_db	lds_matching
t_dw_mpl	ldw_main

if ic_obj_handling.dynamic f_is_changed_dwo_4edit()  then
	
	return event e_saveclose( )
	
else
	connect using it_transaction;
	
	if idw_focus.classname( ) = 'dw_filter' then
		ldw_main = this.f_get_dwmain( )
		this.f_set_idwfocus(ldw_main )
	end if
	
	//-- Trước khi lưu --//
	li_rtn = this.event e_presave( )
	
	//-- Yêu cầu thực hiện lưu --//
	if li_rtn <> -1 then
		li_rtn = idw_focus.dynamic event e_save()
		if li_rtn <> -1 then
			li_rtn = idw_focus.dynamic event e_resetupdate()	
			if li_rtn = 1 then
				lds_matching = ic_obj_handling.dynamic f_get_ids_matching()
				if isvalid(lds_matching) then
	//				if lds_matching.rowcount( ) > 0 then
	//					li_rtn = lds_matching.update( true,false)
	//					if li_rtn = 1 then 
	//						lds_matching.resetupdate( )
	//					else
	//						rollback using it_transaction;
	//					end if
	//				end if
					lds_matching.reset()
					ic_obj_handling.ib_copying = false
					ic_obj_handling.ib_copy_tax = false
				end if
				if li_rtn = 1 then 
					commit using it_transaction;
				end if
				if it_transaction.sqlcode = 0 then
				else
					messagebox('ERROR','s_w_main.e_save(commit)')
				end if
			else
				rollback using it_transaction;
			end if
		else
			rollback using it_transaction;
		end if
		this.event e_postsave( li_rtn)
	end if
	
	disconnect using it_transaction;
	return li_rtn
end if
end event

event closequery;//-- override --//
string					ls_object
int						li_response, li_cnt
c_string				lc_string
t_w_main			lw_sheet
t_dw					ldw_null

if this.enabled = false then return 1 //-- khi đang open window child ko được đóng win parent --//

//-- kiểm tra tình trạng edit --//
if idw_focus.dynamic f_get_ib_editing() then
	li_response = gf_messagebox('m.s_w_main.closequery.01','Xác nhận lưu','Bạn có muốn lưu dữ liệu đang soạn thảo không?','question', 'yesnocancel',1)
	if  li_response = 1 then
		if this.event e_save( ) = -1 then
			return 1
		end if
	elseif li_response = 3 then
		return 1
	else
		t_w_mdi.rbb_1.f_change_action_button('e_save')
	end if
end if

//-- đóng window child trở về window cha --//
if this.ib_child and this.windowtype <> response! then
	if isvalid(this.iw_parent) then 
		this.iw_parent.enabled = true
		this.iw_parent.windowstate = Maximized!
	end if
end if

//-- Cập nhật picture index cua menu --//
//if not this.ib_child then
//	t_w_menu.f_change_pic_idx(ic_obj_main, 'close')
//end if

//-- xoa biến is_mainobject --//
//ls_object = ic_obj_main.f_get_menu_code( )
//if ls_object<> '' and not isnull(ls_object) then
//	t_w_mdi.is_menu_code = lc_string.f_globalreplace( t_w_mdi.is_menu_code, ic_obj_main.f_get_menu_code( ) +";" , "")
//end if



li_response = ic_obj_handling.dynamic event e_window_closequery()



//lw_sheet = t_w_mdi.
//lw_sheet = t_w_mdi.getnextsheet(this)
//Do while isvalid(lw_sheet)
//	if lw_sheet.classname( ) <> 's_w_background' then
//		li_cnt++
//	end if
//	lw_sheet = t_w_mdi.getnextsheet(lw_sheet)
//Loop
//if li_cnt = 0 then //-- Đóng tất cả sheets --//
//	t_w_mdi.f_create_ribbonbar()
//end if
//if not isvalid(lw_sheet) then
//	t_w_mdi.f_create_ribbonbar()
//end if
//-- release resource --//
//disconnect using it_transaction;
//destroy ic_obj_handling
destroy it_transaction

//if li_response = 0 then
//	destroy this.ic_obj_main
//end if
//
ib_closing = true
return 0
end event

event e_delete;//-- OVERRIDE --//

//-- Thực hiện xóa, return row number deleted, -1 lỗi --//
long 				ll_rtn
datawindow		ldw_main



if idw_focus.classname( ) = 'dw_filter' then return 0

connect using it_transaction;

//-- xác nhận chắc chắn xóa --//
ll_rtn =  this.event e_predelete( )

//-- Yêu càu thực hiện xóa --//
if ll_rtn = 1 then
	ll_rtn = idw_focus.dynamic event e_delete()
	if ll_rtn = -1 then
		rollback using it_transaction;
		idw_focus.dynamic event e_retrieve()
		disconnect using it_transaction;
		return 0
	else
		if  not idw_focus.dynamic f_get_ib_editing() then		
			commit using it_transaction;
		else
			//-- Nếu xóa dwmain khi đang edit thi se save và đóng edit --//			
			if ic_obj_handling.f_get_ib_changed_dwo_4edit( ) then
				ldw_main = this.f_get_dwmain( ) 
				if ldw_main= idw_focus then
					if idw_focus.update(true,false ) = 1 then
						commit using it_transaction;	
						idw_focus.dynamic event e_resetupdate()
						idw_focus.dynamic f_close_edit()
						this.event e_filteron( )				
					else
						rollback using  it_transaction;	
						gf_messagebox('m.s_w_main.e_delete.01','Thông báo','Không xóa được dữ liệu DW:@'+idw_focus.dataobject,'exclamation','ok',1)
						disconnect using it_transaction;
						return -1
					end if
				else
					//-- Không thực hiện gì cả: không chạy postdelete --//	
					disconnect using it_transaction;
					return 0
				end if
			else
				ldw_main = this.f_get_dwmain( ) 
				if ldw_main= idw_focus then
					if idw_focus.update(true,false ) = 1 then
						commit using it_transaction;	
						idw_focus.dynamic event e_resetupdate_del()
						idw_focus.scrolltorow(idw_focus.getrow( ) )
					else
						rollback using  it_transaction;	
						gf_messagebox('m.s_w_main.e_delete.01','Thông báo','Khống xóa được dữ liệu DW:@'+idw_focus.dataobject,'exclamation','ok',1)
						disconnect using it_transaction;
						return -1
					end if									
				else
					//-- Không thực hiện gì cả: không chạy postdelete --//	
					disconnect using it_transaction;
					return 0					
				end if
			end if			
		end if
	end if

	//-- Sau khi xóa thông báo object điều khiển trạng thái action --//
	this.event e_postdelete( )	
end if

disconnect using it_transaction;

return ll_rtn
end event

event e_add;//--overide--//
//-- Tạo đối tượng mới, return row number , -1 lỗi --//
long			ll_rtn
t_dw_mpl	ldw_main


setpointer(appstarting!)

connect using it_transaction; 

ldw_main = this.f_get_dwmain( )
if idw_focus.classname( ) = 'dw_filter' then
	this.f_set_idwfocus(ldw_main )
end if
//-- Trước khi add: Thay đổi giao diện dw sang edit --//
ll_rtn = this.event e_preadd( )

if ll_rtn <> -1 then
	//-- add record --//
	ll_rtn = idw_focus.dynamic event e_addrow()

	//-- set focus và goi object điều khiễn nút --//
	this.event e_postadd( )
end if
setpointer(arrow!)

disconnect using it_transaction;

return ll_rtn
end event

event e_modify;//-- Chỉnh sửa đối tượng, return rownumber, -1 lỗi --//
//-- OVERRIDE--//

int li_rtn
t_dw_mpl	ldw_main

connect using it_transaction;


if idw_focus.classname( ) = 'dw_filter' then
	ldw_main = this.f_get_dwmain( )
	this.f_set_idwfocus(ldw_main )
end if


//-- đổi giao diện sang giao diện editing --//
li_rtn = this.event e_premodify( )

if li_rtn <> -1 then
	
	//-- Gọi dw modify: set readonly, đổi trạng thái biến ib_editing --//
	li_rtn = idw_focus.triggerevent( 'e_modifyrow')
	
	//-- set focus và gọi object điều khiển action button --//
	this.event e_postmodify( )
end if


disconnect using it_transaction;

return li_rtn
end event

event e_saveclose;//--OVERRIDE--//

//-- Lưu dữ liệu và đóng window, return 1 ok, -1 lỗi --//
int li_rtn
t_dw_mpl		ldw_main

connect using it_transaction;
ib_saving = true

li_rtn = this.event e_save4close( )
if li_rtn = -1 then
	disconnect using it_transaction; 
	ib_saving = false
	return -1
end if
//-- close edit --//
if ic_obj_handling.dynamic f_is_changed_dwo_4edit()  then
	ldw_main = this.f_get_dwmain( )
	if isvalid(ldw_main) then
		ldw_main.f_close_edit() 
	else
		ib_saving = false
		return -1
	end if		
	
	this.event e_filteron_rb( )
//	-- set lại filter data nếu có--//
	this.f_filter_dwmain_new( )	
	
end if
ic_obj_handling.event e_window( 'e_saveclose')
disconnect using it_transaction;
ib_saving = false
return li_rtn
end event

event e_closeedit;//-- OVERRIDE--//

t_dw_mpl		ldw_main



if ic_obj_handling.dynamic f_is_changed_dwo_4edit()  then
	connect using it_transaction;
	this.ib_saving = true
	ldw_main = this.f_get_dwmain( )	
	if isvalid(ldw_main) then
		ldw_main.event e_rollback_modify( )
		ldw_main.f_close_edit()
	else
		return -1
	end if		
	
	this.event e_filteron_rb( )
	//-- set lại filter data nếu có--//
	this.f_filter_dwmain_new( )
//	if isvalid(ic_obj_handling.ids_filter_data ) then
//		if ic_obj_handling.ids_filter_data.rowcount() > 0 then			
//			ic_obj_handling.ids_filter_data.rowscopy( 1, 1, Primary!, dw_filter, 1, Primary!)	
//			this.f_filter_dwmain_new( )
//		end if
//	end if
	
	//--nếu đang copy thì sau khi save tắt chế độ copy--//
	if ic_obj_handling.f_get_ib_copying( ) then ic_obj_handling.f_set_ib_copying( false)
	
//	ic_obj_handling.f_ctrl_actionbuttons( idw_focus)
//	this.event e_display_actionbutton( )
	
	disconnect using it_transaction;
	this.ib_saving =  false
	idw_focus.setfocus( )	
	//-- change button --//
//	ic_obj_handling.f_change_action_button(t_w_mdi.rbb_1, 'e_save')
	//-- enbale button--//
//	ic_obj_handling.f_ctrl_enable_button(t_w_mdi.rbb_1 , ldw_main)
	return 1
end if

return 0

end event

event key;call super::key;t_dw			ldw_actionpane


if key=keyA! and keyflags = 2 then
elseif key=keyS! and keyflags = 2 then
	if idw_focus.accepttext( ) <> 1 then return 1	
	if this.f_get_dw_actionpane('d_action_edit',ldw_actionpane) = 1 then
		if ldw_actionpane.dynamic f_is_button_active('b_save') then
			this.event e_save( )
		elseif  ldw_actionpane.dynamic f_is_button_active('b_saveclose') then
			this.event e_saveclose( )
		end if
	end if

	return 1
elseif key=keyM! and keyflags = 2 then

	if this.f_get_dw_actionpane('d_action_edit',ldw_actionpane) = 1 then
		if ldw_actionpane.dynamic f_is_button_active('b_modify') then
			this.event e_modify( )
		end if
	end if

	return 1
elseif key=keyN! and keyflags = 2 then
	if idw_focus.accepttext( ) <> 1 then return 1

	if this.f_get_dw_actionpane('d_action_edit',ldw_actionpane) = 1 then
		if ldw_actionpane.dynamic f_is_button_active('b_add') then
			this.event e_add( )
		elseif  ldw_actionpane.dynamic f_is_button_active('b_add_multi') then
			this.event e_add( )
		end if
	end if

	return	 1
elseif key=keyI! and keyflags = 2 then
	if idw_focus.accepttext( ) <> 1 then return 1
	if this.f_get_dw_actionpane('d_action_edit',ldw_actionpane) = 1 then
		if ldw_actionpane.dynamic f_is_button_active('b_insert') then
			this.event e_insert( )
		end if
	end if

	return	 1
elseif key=keyD! and keyflags = 2 then

	if this.f_get_dw_actionpane('d_action_edit',ldw_actionpane) = 1 then
		if ldw_actionpane.dynamic f_is_button_active('b_delete') then
			this.event e_delete( )
		end if
	end if

	return	 1
end if
end event

event e_filteron_new;//-- override--//

datawindow			ldw_main
c_string				lc_string
t_dw					ldw_focus
int						li_cnt
long					ll_currow
string					las_colname_in_taborder[], ls_dwsyntax, ls_err, ls_vpos_max, ls_vpos,ls_display_model


// Gan dataobject cho dw_filter//
ldw_main = this.f_get_dwmain( )



gb_filter.visible = true
dw_filter.visible = true

ii_dwfilter_header = integer(dw_filter.describe( "datawindow.header.height"))

li_cnt = dw_filter.insertrow( 0)
dw_filter.scrolltorow(li_cnt)
ib_filter_on = true
dw_filter.f_retrieve_dwc_dwfilter( 'colname')
this.event e_filter_resize_new( )


//--resize window--//
ls_display_model = ic_obj_handling.dynamic f_get_display_model()
this.f_resize(ls_display_model )

if isvalid( ic_obj_handling.ids_filter_data) then
	if ic_obj_handling.ids_filter_data.rowcount( ) = 1 then
		dw_filter.reset( )
		ic_obj_handling.ids_filter_data.rowscopy(1,1,primary!,dw_filter, 1,primary!)
	end if
end if

//this.event e_ctrl_actionbutton( )
//this.event e_display_actionbutton( )

//-- set dw focus để chuẩn bị xử lý các chuổi đặt biệt của datetime và number--//
//ldw_focus = dw_filter
//dw_filter.inv_querymode.f_setdwfocus( ldw_focus)

return 0
end event

event e_insert;//-- override--//

//-- Tạo dòng mới, return row number , -1 lỗi --//

long ll_rtn
t_dw_mpl	ldw_main

connect using it_transaction; 

if idw_focus.classname( ) = 'dw_filter' then
	ldw_main = this.f_get_dwmain( )
	this.f_set_idwfocus(ldw_main )
end if

//-- Chì chèn record cho dw detail --//
ll_rtn = idw_focus.triggerevent( 'e_insertrow')

//-- set focus và goi object điều khiễn nút --//
this.event e_postadd( )

disconnect using it_transaction; 


return ll_rtn
end event

event e_resize_tab_action;call super::e_resize_tab_action;this.tab_action.move(0,0)
this.tab_action.width = 0
this.tab_action.height= 0

end event

event open;/*******************************************************
OVERRIDE:
------------------
Chức năng:
	- Tạo object chính
	- Gọi control action pane
	- gọi pre-open
	- gọi post-open: chỉ chạy e_postopen khi mở window thành công
------------------------------------------------------------------------------------------------*/

int 						li_rtn, li_width, li_height
string						ls_object, ls_parm, las_parm[], ls_display_model, ls_menu_code, ls_menu_text
window					lw_requester
c_obj_service			lc_obj_service
s_str_dw_md			lastr_dw_md_empty[]
s_str_dw_ms			lastr_dw_ms_empty[]
s_str_dwo_related		lstr_data_related[]	
datawindow				ldw_empty[]
c_menu_item			lc_menu_item

ib_opening = true
//-- Tạo connection voi database --//
it_transaction = create t_transaction
it_transaction.dbms =	SQLCA.DBMS
it_transaction.ServerName	 = SQLCA.ServerName
it_transaction.LogId	 = SQLCA.LogId
it_transaction.LogPass 	 = SQLCA.LogPass 
it_transaction.AutoCommit 	 = false 
it_transaction.DBParm	 = SQLCA.DBParm
connect using	it_transaction;	

if not isnull(message.stringparm) and message.stringparm <> '' then
	ls_parm = message.stringparm	
	setnull(message.stringparm)

	lc_obj_service.f_stringtoarray(ls_parm ,";",las_parm[])
	ic_obj_main = create using las_parm[1]
	if las_parm[2] <> '0' then
		ic_obj_main.f_set_menu_id(las_parm[2])	
		ls_menu_code = lc_menu_item.f_get_menu_code_ex( double(las_parm[2]), it_transaction)
		ic_obj_main.f_set_menu_code(ls_menu_code )
	end if
	//-- init dwsetup --//
	if upper(ic_obj_main.classname( )) = 'U_VALUESET_ENTRY' then
//		ic_obj_main.idwsetup_initial.f_init_ids_setup_dw( upper(ic_obj_main.classname( )) )
//	else
		ic_obj_main.idwsetup_initial.f_init_ids_setup_dw_ex( upper(ic_obj_main.f_get_menu_code( ) ), it_transaction )
	end if
	
	if las_parm[1] <> 'u_valueset_entry' then
		this.is_win_name = las_parm[1]
	else
		this.is_win_name = las_parm[1]+las_parm[2]
	end if

	if upperbound(las_parm[]) > 2 then
		this.title = las_parm[3]				
		this.is_win_grp = las_parm[4]
		this.is_sheet_type = las_parm[4]		
	else
		if las_parm[2] <> '0' then
			this.title = lc_menu_item.f_get_menu_label_ex(double(las_parm[2]), it_transaction )
		else 
			this.title = ic_obj_main.is_object_title
		end if
	end if
	ic_obj_main.f_init_policy_datastore_exx(it_transaction )

elseif not isnull(message.powerobjectparm ) then
	ic_obj_main = message.powerobjectparm
//	setnull(message.powerobjectparm)

	ic_obj_main.f_init_policy_datastore_exx(it_transaction )
	ls_menu_text = lc_menu_item.f_get_menu_label_ex(ic_obj_main.classname( ) ,it_transaction)
	if ls_menu_text <> '' then
		this.title  = ls_menu_text
	else
		this.title = ic_obj_main.is_object_title
	end if
	this.is_win_name = ic_obj_main.is_win_name
	this.is_win_grp = ic_obj_main.is_win_grp
	this.is_sheet_type = ic_obj_main.is_sheet_type
	
	//-- init dwsetup --//
	if upper(ic_obj_main.classname( )) = 'U_VALUESET_ENTRY' then
//		ic_obj_main.idwsetup_initial.f_init_ids_setup_dw( upper(ic_obj_main.classname( )) )
//	else
		ic_obj_main.idwsetup_initial.f_init_ids_setup_dw_ex( upper(ic_obj_main.f_get_menu_code( ) ), it_transaction )
	end if	
end if

is_popmenu = 'm_setup_user_access;m_edit_window_label;'
//-- create main object --//
lw_requester = this
ic_obj_main.dynamic f_set_wdisplay(lw_requester)

//-- ghi nhớ menu_id của window được open --//
ic_obj_handling = ic_obj_main

//-- pre-open : resize nội bộ đối tượng hoặc window display--//
this.f_set_resize( )  
li_rtn = this.event e_preopen( ) 
if li_rtn = -1 then return -1

//---------------------//
//-- TẠO RIBBON --//
//--------------------//
//if ic_obj_handling.dynamic f_create_actionpane(tab_action) = -1 then return -1
ic_obj_handling.f_update_ribbonbar( t_w_mdi.rbb_1)


//-- gán dwo cho dw cùa window --//
iastr_dw_ms = lastr_dw_ms_empty[]
iastr_dw_md = lastr_dw_md_empty[]
this.iwdw_detail[]  = ldw_empty[]
this.iwdw_share[] = ldw_empty[]
this.iadw_none_md[] = ldw_empty[]
this.f_set_dwo( )

//-- tao tabpage detail nếu có --//
if ic_obj_handling.dynamic f_create_tabpage() = -1 then return -1

//-- set master detail share --//
this.f_arrange_dwdetail( this.iwdw_detail[] )
this.f_arrage_dwshared( this.iwdw_share[] )
this.f_set_md_ms()

//-- set record security --//
this.f_set_record_security_ex( it_transaction )

//-- thông báo đến object : add where cua object nếu có--//
li_rtn = ic_obj_handling.event e_window( 'open')
if li_rtn = -1 then 
	return -1
end if
//-- resize --//
ic_obj_handling.f_get_resize_wdisplay(li_width ,li_height)
if li_width > 0 and li_height > 0 then
	this.width = li_width
	this.height = li_height
end if

//messagebox('open','open')

//-- post open --//
if li_rtn <> -1 then this.post event e_postopen(li_rtn )

end event

event resize;//-- Override --//

string		ls_display_model

if ib_closing then return
//if sizetype = 0 and this.ib_opening and not this.ib_child then return

//-- resize tab action --//
this.event e_resize_tab_action(newwidth, newheight)

//-- resize filter --//
if gb_filter.visible then
	this.event e_filter_resize_new( )
end if

if isvalid(ic_obj_handling) then
	ls_display_model = ic_obj_handling.dynamic f_get_display_model()
	this.ii_resize_width = newwidth
	this.ii_resize_height = newheight
	this.post f_resize(ls_display_model )	
	this.f_set_visible_ctrl(ls_display_model)
end if
end event

event e_postmodify;//-- Set focus và goi object điều khiển action --//
//-- OVerride --//

int				li_rtn

li_rtn = ic_obj_handling.dynamic event e_window( 'e_postmodify')
if li_rtn = -1 then 
	return -1
end if
//ic_obj_handling.f_ctrl_actionbuttons( idw_focus)
//this.event e_display_actionbutton( )
t_w_mdi.rbb_1.f_change_action_button('e_modify')
this.f_ctrl_enable_button(idw_focus)
return idw_focus.setfocus( )

end event

event e_postsave;
/******************************************************
chức năng: - setfocus cho control
				 - Thông báo object
				 - gọi điều khiển action button
Override
---------------------------------------------------------------------------------------*/

int				li_rtn


//li_rtn = ic_obj_handling.dynamic event e_window( 'e_postsave')
li_rtn = ic_obj_handling.event e_window_e_postsave(vi_save_return )
if li_rtn = -1 then 
	return -1
end if
//--nếu đang copy thì sau khi save tắt chế độ copy--//
if ic_obj_handling.f_get_ib_copying( ) then ic_obj_handling.f_set_ib_copying( false)
//ic_obj_handling.f_ctrl_actionbuttons( idw_focus)
//this.event e_display_actionbutton( )
t_w_mdi.rbb_1.f_change_action_button('e_save')
this.f_ctrl_enable_button(  idw_focus)
return idw_focus.setfocus( )

end event

event e_postadd;//-- Thực hiện sau khi tạo mớ: set focus cho control và gọi điều khiển action --//
//-- Override --//

int				li_rtn

li_rtn = ic_obj_handling.dynamic event e_window( 'e_postadd')
if li_rtn = -1 then 
	return -1
end if
//ic_obj_handling.f_ctrl_actionbuttons( idw_focus)
//this.event e_display_actionbutton( )
 this.f_ctrl_enable_button(  idw_focus)
return idw_focus.setfocus( )
end event

event e_postdelete;/******************************************************
chức năng: - setfocus cho control
				 - Thông báo object
				 - gọi điều khiển action button
Override
-----------------------------------------------------------------------------------------------*/
int				li_rtn

li_rtn = ic_obj_handling.dynamic event e_window( 'e_postdelete')
if li_rtn = -1 then 
	return -1
end if
//ic_obj_handling.f_ctrl_actionbuttons( idw_focus)
//this.event e_display_actionbutton( )

this.f_ctrl_enable_button(  idw_focus)
return idw_focus.setfocus( )
end event

event e_change_object_appeon;//-- OVERRIDE --//

boolean					lb_return_2_main,lb_multi_print
string						ls_display_model, ls_filterstring, ls_sqlnowhere, ls_currentwhere, ls_modify, ls_rtn,ls_dwo_view
double					ldb_main_ID
long						ll_row
int							li_idx,li_rtn
c_string					lc_string
s_str_dw_ms			lastr_dw_ms_empty[]
s_str_dw_md			lastr_dw_md_empty[]
t_transaction			lc_transaction
window					lw_requester
//t_dw_mpl					ldw_main, ldw_empty[]
s_object_display		lod_main
s_str_dwo_related		lstr_data_related[],lstr_related[]
s_str_dwo				lstr_dwo[]
s_str_drilldown_data	lstr_drilldown_data

ib_object_changing = true
//ldw_main = this.f_get_dwmain( )

if not isvalid(vpo_change_object) then return -1
if upper(left(vpo_change_object.classname(), 3)) = 'UR_' then // change drilldown report//	
//	ic_obj_handling.f_change_drilldown_rpt(vpo_change_object)
//	lb_multi_print = true
	li_rtn = ic_obj_handling.f_get_data_related(vpo_change_object.classname(), lstr_data_related[])
	if li_rtn = 0 then
		//-- xem lại khai báo đối tương liên quan trên object--//
		gf_messagebox('m.s_w_main.e_change_object.01','Thông báo','Không tìm thấy struct đối tượng liên quan','exclamation','ok',1)
		return -1
	end if	
	li_rtn = this.f_build_data_related( lstr_data_related[], lstr_drilldown_data) 
//	if li_rtn = -1 then lb_multi_print = false
//	vpo_change_object.f_set_data_related(lstr_data_related[])		
	vpo_change_object.f_set_drilldown_data(lstr_drilldown_data)
	vpo_change_object.is_object_title = lstr_data_related[1].s_text
	vpo_change_object.is_win_grp = 'DOC'
	vpo_change_object.is_sheet_type ='DOC'
	vpo_change_object.is_win_name = lstr_data_related[1].s_text	
	
	li_idx= t_w_mdi.wf_open_sheet_doc(vpo_change_object, 's_w_multi_rb' )
	ib_object_changing = false	
else
	/*
	//-- tat control --//
	this.dynamic f_set_invisible_ctrl()
	
	//-- tắt tìm kiếm --//
	if this.ib_querymode_on then this.event e_execquery( )
	*/
	lb_multi_print = true
	//--build data related--/
	if  not vpo_change_object.ib_copying then

		if vpo_change_object.classname() = 'b_view' then// Đối tượng In
			if ic_obj_handling.event e_window_e_view(vpo_change_object, ls_dwo_view ) = -1 then return -1
			li_rtn = ic_obj_handling.f_get_data_related(vpo_change_object.f_get_main_dwo( ), lstr_data_related[])
		else
			 li_rtn = ic_obj_handling.f_get_data_related(vpo_change_object.classname(), lstr_data_related[])
		end if
		if li_rtn = 0 then
			//-- xem lại khai báo đối tương liên quan trên object--//
			gf_messagebox('m.s_w_main.e_change_object.01','Thông báo','Không tìm thấy struct đối tượng liên quan','exclamation','ok',1)
			return -1
		end if
		li_rtn = this.f_build_data_related( lstr_data_related[], lstr_drilldown_data) 
//		if this.f_build_data_related( lstr_data_related[]) = -1 then lb_multi_print = false
		vpo_change_object.f_set_data_related(lstr_data_related[])		
		vpo_change_object.is_object_title = lstr_data_related[1].s_text
		vpo_change_object.is_win_grp = 'DOC'
		vpo_change_object.is_sheet_type ='DOC'
		vpo_change_object.is_win_name = lstr_data_related[1].s_text
									
	end if	
	
	li_idx= t_w_mdi.wf_open_sheet_doc(vpo_change_object, 's_w_multi_rb' )
	vpo_change_object.post event e_window_e_change_object()
	ib_object_changing = false
	
end if

return li_idx
end event

event e_user_trace;//-- override--//
this.f_openchildwithparm( 's_w_multi_n_rb', 'u_user_trace;0')
end event

event e_book;
//-- override--//
return this.f_openchildwithparm( 's_w_multi_n_rb', 'u_book;0')
end event

event activate;//-- Override --//
int							li_cnt
s_object_display		lod_main
t_dw_mpl				ldw_main
s_str_dwo_related		lstr_data_related[]

//

if  not this.ib_opening then 
	if t_w_mdi.is_active_win_name <> this.is_win_name	then
		t_w_mdi.is_active_win_name = this.is_win_name	
		if isvalid(ic_obj_handling) then
			ic_obj_handling.event e_window_activate()
			ic_obj_handling.post f_update_ribbonbar( t_w_mdi.rbb_1)	
			ldw_main =  this.f_get_dwmain( )
			this.f_set_idwfocus( ldw_main)
			this.post f_ctrl_enable_button(idw_focus )	
		end if
	end if
else
	t_w_mdi.is_active_win_name = this.is_win_name		
end if
return 0
end event

type st_1 from s_w_main`st_1 within s_w_multi_rb
integer x = 91
integer y = 1104
integer width = 590
boolean border = true
end type

type tab_action from s_w_main`tab_action within s_w_multi_rb
boolean visible = false
integer x = 279
integer y = 0
integer height = 308
integer taborder = 0
end type

event tab_action::selectionchanged;//-- overrdie --//
end event

event tab_action::selectionchanging;//- override --//
end event

type gb_filter from s_w_main`gb_filter within s_w_multi_rb
integer x = 133
integer y = 816
integer taborder = 0
end type

type dw_filter from s_w_main`dw_filter within s_w_multi_rb
integer x = 686
integer y = 1432
integer width = 498
integer taborder = 10
end type

event dw_filter::scrollhorizontal;//dw_1.modify("Datawindow.HorizontalScrollPosition="+this.describe("Datawindow.HorizontalScrollPosition"))
end event

type dw_2 from t_dw_mpl within s_w_multi_rb
integer x = 443
integer y = 668
integer height = 208
integer taborder = 30
boolean bringtotop = true
end type

type tab_1 from t_t within s_w_multi_rb
event type integer e_suspend_dw ( )
boolean visible = false
integer x = 133
integer y = 1424
integer height = 388
integer taborder = 80
boolean bringtotop = true
end type

event type integer e_suspend_dw();
int					li_idx1, li_idx2,li_cnt
t_dw				ldw_tmp,ladw_empty[]
datawindow		ladw_detail[],ladw_shared[]
//-- tìm và cất  dw--//

FOR li_idx1 = 1 to upperbound(this.control[])
	FOR li_idx2 = 1 to upperbound(this.control[li_idx1].control[])
		if this.control[li_idx1].control[li_idx2].typeof() = datawindow! then
			ldw_tmp =   this.control[li_idx1].control[li_idx2]
			if   ldw_tmp.dataobject <> '' then
				if upper( left(ic_obj_handling.classname( ),3)) <> 'UR_' then
					ic_obj_handling.f_set_suspend_data_tab(ldw_tmp)
				else
					ic_obj_handling.f_set_suspend_report_tab(ldw_tmp)
				end if
				setnull(ldw_tmp.is_originalSQL_NoWhere)
				setnull(ldw_tmp.is_originalwhereClause)
				setnull(ldw_tmp.is_currentwhere)
				ldw_tmp.dataobject = '' 
				
				li_cnt = ldw_tmp.dynamic f_getdwdetails(ladw_detail)
				if li_cnt > 0 then ldw_tmp.dynamic f_set_dwmaster(ladw_empty[])
				li_cnt = ldw_tmp.dynamic f_getdwshared(ladw_shared)
				if li_cnt > 0 then ldw_tmp.dynamic f_set_dwshare(ladw_empty[])
			end if
		end if
	NEXT
NEXT	
return 1
end event

event e_init_tabpages;call super::e_init_tabpages;int							li_idx,li_cnt, li_tabpagecnt
s_str_dwo_tabpage	lstr_dwo_tabpage
userobject				l_tabpage

li_tabpagecnt = upperbound(this.control) 
if li_tabpagecnt > 0 then
	FOR li_idx = li_tabpagecnt to 1 step -1
		l_tabpage = this.control[li_idx]
		this.closetab(l_tabpage)
	NEXT
end if

li_cnt = upperbound(ruo_tabpage[])
FOR li_idx = 1 to li_cnt
	lstr_dwo_tabpage = ruo_tabpage[li_idx].dynamic f_get_dwo_structure()
	this.opentabwithparm(ruo_tabpage[li_idx], lstr_dwo_tabpage, li_idx)
	this.ib_tabpage_creating = true
	this.selecttab(li_idx )
	this.control[this.selectedtab].triggerevent('e_resize')
NEXT	
if li_cnt > 0 then 
	this.ib_tabpage_creating = true
	this.selecttab(1 )
end if

return li_cnt
end event

event selectionchanged;call super::selectionchanged;s_tp_multi		l_tabpage
s_str_report		lstr_report
boolean			lb_retrieve_yn
t_dw_mpl		ldw_focus

//-- kiem tra object --//
if this.ib_tabpage_creating then 
	this.ib_tabpage_creating = false
	return
end if

if not parent.ib_opening then
	l_tabpage = this.control[newindex]
	ldw_focus = l_tabpage.dynamic event e_get_dwmain()
	if isvalid(ldw_focus) then
		ldw_focus.setfocus( )
//		ldw_focus.event e_refresh( )
	end if
end if

parent.f_send_message_to_object( this, 'selectionchanged')


end event

type dw_4 from t_dw_mpl within s_w_multi_rb
integer x = 2117
integer y = 848
integer height = 208
integer taborder = 50
boolean bringtotop = true
end type

type tv_1 from t_tv within s_w_multi_rb
integer x = 9
integer y = 416
integer taborder = 90
boolean bringtotop = true
end type

type dw_5 from t_dw_mpl within s_w_multi_rb
integer x = 1865
integer y = 1168
integer height = 208
integer taborder = 60
boolean bringtotop = true
end type

type dw_6 from t_dw_mpl within s_w_multi_rb
integer x = 2158
integer y = 1368
integer height = 208
integer taborder = 70
boolean bringtotop = true
end type

type ddlb_1 from t_ddlb within s_w_multi_rb
integer x = 475
integer y = 392
integer width = 837
integer height = 692
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
boolean autohscroll = true
boolean hscrollbar = true
boolean vscrollbar = true
end type

type ddlb_2 from t_ddlb within s_w_multi_rb
integer x = 1403
integer y = 404
integer width = 837
integer height = 740
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
boolean autohscroll = true
boolean hscrollbar = true
boolean vscrollbar = true
end type

type cbx_1 from t_cbx within s_w_multi_rb
integer x = 3003
integer y = 548
integer width = 736
integer height = 88
boolean bringtotop = true
string text = "Check box"
end type

event clicked;call super::clicked;//parent.f_send_message_to_object( this, 'clicked')
end event

type htb_1 from t_htb within s_w_multi_rb
integer x = 2811
integer y = 668
integer width = 763
integer height = 152
boolean bringtotop = true
integer maxposition = 200
integer position = 100
integer tickfrequency = 15
integer pagesize = 25
integer linesize = 25
end type

event pageleft;call super::pageleft;this.event moved( this.position )
end event

event pageright;call super::pageright;this.event moved( this.position )
end event

type cbx_2 from t_cbx within s_w_multi_rb
integer x = 3013
integer y = 912
integer width = 727
boolean bringtotop = true
end type

event clicked;call super::clicked;//parent.f_send_message_to_object( this, 'clicked')
end event

type sle_1 from t_sle within s_w_multi_rb
integer x = 2958
integer y = 1100
integer height = 92
integer taborder = 150
boolean bringtotop = true
end type

event getfocus;//
end event

event modified;call super::modified;parent.f_send_message_to_object( this, 'modified')
end event

type st_2 from t_st within s_w_multi_rb
integer x = 3365
integer y = 1108
integer width = 105
boolean bringtotop = true
string text = ""
end type

type gb_2 from t_g_line within s_w_multi_rb
integer x = 1253
integer y = 640
integer width = 699
end type

event e_mousemove;call super::e_mousemove;

int				li_y

if this.text = '>' then return
if flags = 1 then	
	li_y =  parent.pointery( ) 
	if li_y > tab_action.y + tab_action.height +300 and li_y < parent.workspaceheight( ) - 300 then 
		this.move( this.x, li_y - ii_click_y)
		this.setposition( ToTop!)
		ii_upperpart_height = max (this.y - tab_action.y - tab_action.height -  ii_text_spaceheight - ii_filter_space - ii_spare_space, 0) / parent.height
	end if
end if

end event

event e_left_mousedown;call super::e_left_mousedown;ii_click_y = ypos
if xpos >25 and xpos <80 and ypos > 0 and ypos < 50 then
	if this.text = '^' then
		 ii_upperpart_height_bak = ii_upperpart_height
		 ii_upperpart_height = 0
		 ii_fixedpart2_height_bak = ii_fixedpart2_height
		 ii_fixedpart2_height = 0
		 this.text = '>'
	elseif this.text = '>' then		
		 ii_upperpart_height = ii_upperpart_height_bak
		 ii_fixedpart2_height = ii_fixedpart2_height_bak
		 this.text = '^'		
	end if

end if
end event

event e_left_mouseup;call super::e_left_mouseup;//
//
//messagebox('tab.y','tab.y:'+string(tab_action.y) + ';this.y:'+string(this.y)+ ';this.pointery:'+&
//string(this.pointery())+';parent.pointery:'+string(parent.pointery())+&
//';parent.prentwindow().pointery:'+string(parent.parentwindow().pointery())+&
//';parent.workspacey:'+string(parent.workspacey())+& 
//';parent.prentwindow().workspacey:'+string(parent.parentwindow().workspacey())+& 
// ';...this.x:'+string(this.x)+&
// ';parent.workspacex:'+string(parent.workspacex())+& 
// ';parent.prentwindow().workspacex:'+string(parent.parentwindow().workspacex())+& 
// ';parent.prentwindow().pointerx:'+string(parent.parentwindow().pointerx())+&
// ';parent.pointerx:'+string(parent.pointerx())+&
// ';this.pointerx:'+string(this.pointerx()) +&
//';parent.prentwindow().workspaceheigt:' +string(parent.parentwindow().workspaceheight())+&
//';parent.workspaceheigt:' +string(parent.workspaceheight()))
end event

type gb_1 from t_g_line within s_w_multi_rb
integer x = 1152
integer y = 512
integer width = 23
integer height = 568
string pointer = "SizeWE!"
borderstyle borderstyle = stylelowered!
end type

event e_mousemove;call super::e_mousemove;
int				li_x

if flags = 1 then	
	li_x =  parent.pointerx( )
	if li_x > 140 and li_x < parent.workspacewidth( ) - 200 then 
		this.move( li_x - ii_click_x, this.y )
		this.setposition( ToTop!)
		ii_leftpart_width = this.x / parent.width
	end if
end if

end event

event e_left_mousedown;call super::e_left_mousedown;ii_click_x = xpos
end event

type gb_3 from t_g_line within s_w_multi_rb
integer x = 1285
integer y = 908
integer width = 699
end type

event e_mousemove;call super::e_mousemove;

int				li_y

if this.text = '>' then return
if flags = 1 then	
	li_y =  parent.pointery( )
	if li_y > gb_2.y + 150 and li_y < parent.workspaceheight( ) - 300  then 
		this.move( this.x, li_y - ii_click_y )
		this.setposition( ToTop!)
		ii_gb_3_height = max(this.y - gb_2.y - gb_2.height, 0)/ parent.height
	end if
end if

end event

event e_left_mousedown;call super::e_left_mousedown;ii_click_y = ypos
if xpos >25 and xpos <80 and ypos > 0 and ypos < 50 then
	if this.text = '^' then
		 ii_gb_3_height_bak = ii_gb_3_height
		 ii_gb_3_height = 0
		 ii_fixedpart3_height_bak = ii_fixedpart3_height
		 ii_fixedpart3_height = 0
		 this.text = '>'
	elseif this.text = '>' then		
		 ii_gb_3_height = ii_gb_3_height_bak
		 ii_fixedpart3_height = ii_fixedpart3_height_bak
		 this.text = '^'		
	end if
end if
end event

type gb_4 from t_g_line within s_w_multi_rb
integer x = 1243
integer y = 1044
integer width = 699
end type

event e_mousemove;call super::e_mousemove;

int				li_y

if this.text = '>' then return
if flags = 1 then	
	li_y =  parent.pointery( )
	if li_y > gb_3.y + 150  and li_y < parent.workspaceheight( ) - 300  then 
		this.move( this.x, li_y - ii_click_y )
		this.setposition( ToTop!)
		ii_gb_4_height = max(this.y - gb_3.y - gb_3.height, 0)/ parent.height
	end if
end if

end event

event e_left_mousedown;call super::e_left_mousedown;ii_click_y = ypos
if xpos >25 and xpos <80 and ypos > 0 and ypos < 50 then
	if this.text = '^' then
		 ii_gb_4_height_bak = ii_gb_4_height
		 ii_gb_4_height = 0
		 this.text = '>'
		 this.height = 50
	elseif this.text = '>' then		
		 ii_gb_4_height = ii_gb_4_height_bak
		 this.text = '^'		
		 this.height = 40
	end if
end if
end event

type gb_5 from t_g_line within s_w_multi_rb
integer x = 1285
integer y = 1228
integer width = 699
end type

event e_mousemove;call super::e_mousemove;

int				li_y

if this.text = '>' then return
if flags = 1 then	
	li_y =  parent.pointery( )
	if li_y > gb_4.y + 150 and li_y < parent.workspaceheight( ) - 300  then 
		this.move( this.x, li_y - ii_click_y )
		this.setposition( ToTop!)
		ii_gb_5_height = max(this.y - gb_4.y - gb_4.height, 0)/ parent.height
	end if
end if

end event

event e_left_mousedown;call super::e_left_mousedown;ii_click_y = ypos
if xpos >25 and xpos <80 and ypos > 0 and ypos < 50 then
	if this.text = '^' then
		 ii_gb_5_height_bak = ii_gb_5_height
		 ii_gb_5_height = 0
		 this.text = '>'
		 this.height = 50
	elseif this.text = '>' then		
		 ii_gb_5_height = ii_gb_5_height_bak
		 this.text = '^'		
		 this.height = 40
	end if
end if
end event

type gb_6 from t_gb within s_w_multi_rb
integer x = 2121
integer y = 876
end type

type gb_8 from t_gb within s_w_multi_rb
integer x = 1481
integer y = 1296
end type

type gb_9 from t_gb within s_w_multi_rb
integer x = 2062
integer y = 1376
end type

type gb_10 from t_g_line within s_w_multi_rb
integer x = 1339
integer y = 364
integer width = 23
integer height = 568
integer taborder = 110
string pointer = "SizeWE!"
borderstyle borderstyle = stylelowered!
end type

event e_mousemove;call super::e_mousemove;
int				li_x

if flags = 1 then	
	li_x =  parent.pointerx( )
	if li_x >140 + gb_1.x + gb_1.width and li_x < parent.workspacewidth( ) - 200 then 
		this.move( li_x - this.ii_click_x , this.y )
		this.setposition( ToTop!)
		ii_midpart_width = max(this.x - gb_1.x - gb_1.width,0) / parent.width
	end if
end if

end event

event e_left_mousedown;call super::e_left_mousedown;ii_click_x = xpos
end event

type gb_11 from t_g_line within s_w_multi_rb
integer x = 1339
integer y = 948
integer width = 23
integer height = 568
integer taborder = 130
string pointer = "SizeWE!"
borderstyle borderstyle = stylelowered!
end type

event e_mousemove;call super::e_mousemove;int				li_x

if flags = 1 then	
	li_x =  parent.pointerx( )
	if li_x >140 + gb_1.x + gb_1.width and li_x < parent.workspacewidth( ) - 200 then 
		this.move( li_x - this.ii_click_x , this.y )
		this.setposition( ToTop!)
		ii_gb_11_width = max(this.x - gb_1.x - gb_1.width,0) / parent.width
	end if
end if

end event

event e_left_mousedown;call super::e_left_mousedown;ii_click_x = xpos
end event

type gb_12 from t_gb within s_w_multi_rb
integer x = 2062
integer y = 1792
integer taborder = 100
end type

type dw_1 from t_dw_mpl within s_w_multi_rb
integer x = 3342
integer y = 260
integer width = 530
integer taborder = 20
boolean bringtotop = true
end type

event scrollhorizontal;call super::scrollhorizontal;dw_filter.modify("Datawindow.HorizontalScrollPosition="+this.describe("Datawindow.HorizontalScrollPosition"))
end event

type gb_7 from t_gb within s_w_multi_rb
integer x = 1637
integer y = 764
end type

type dw_3 from t_dw_mpl within s_w_multi_rb
integer x = 1701
integer y = 524
integer height = 208
integer taborder = 40
boolean bringtotop = true
end type

type rb_1 from t_rb within s_w_multi_rb
integer x = 59
integer y = 1324
boolean bringtotop = true
end type

event clicked;call super::clicked;b_obj_instantiate 	lb_ins

lb_ins.event e_rb_clicked( this, ic_obj_handling)
end event

type rb_2 from t_rb within s_w_multi_rb
integer x = 91
integer y = 1444
boolean bringtotop = true
end type

event clicked;call super::clicked;b_obj_instantiate 	lb_ins

lb_ins.event e_rb_clicked( this, ic_obj_handling)
end event

type rb_3 from t_rb within s_w_multi_rb
integer x = 133
integer y = 1608
boolean bringtotop = true
end type

event clicked;call super::clicked;b_obj_instantiate 	lb_ins

lb_ins.event e_rb_clicked( this, ic_obj_handling)
end event

