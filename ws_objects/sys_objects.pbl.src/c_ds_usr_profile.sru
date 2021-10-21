$PBExportHeader$c_ds_usr_profile.sru
forward
global type c_ds_usr_profile from t_ds
end type
end forward

global type c_ds_usr_profile from t_ds
string dataobject = "ds_user_profile"
end type
global c_ds_usr_profile c_ds_usr_profile

type variables

end variables

forward prototypes
public function string f_get_visiblevalue (powerobject vpo_object)
public function integer f_set_userprofile (ref datawindow rdw_control)
public function integer f_buildwhere_of_profile (string vs_dwo)
public subroutine f_set_transaction (t_transaction vt_transaction)
end prototypes

public function string f_get_visiblevalue (powerobject vpo_object);/*==================================
Lấy giá trị ẩn/hiện của control
---------------------------------------------------
return (string): 0/1 thành công 
				  : '' lỗi
==================================*/
c_obj_service lc_obj_service
string ls_key_name, ls_value, ls_visible
int li_row

ls_key_name = lc_obj_service.f_get_parent_w_string( vpo_object)
ls_value = vpo_object.classname()
li_row =  this.retrieve(gi_userid, ls_key_name, ls_value)
if li_row = 0 then 
	return '1'
elseif li_row = 1 then 
	ls_visible = this.getitemstring( 1, 'visible_01')
	return ls_visible
else
	return ''
end if
end function

public function integer f_set_userprofile (ref datawindow rdw_control);/*==================================
Set thuộc tính cho objects của datawindow
---------------------------------------------------
return (integer): 1 thành công
					: 0 không set
					: -1 lỗi
==================================*/
string ls_process, ls_ctrlname, ls_visible_01, ls_x, ls_width, ls_fontsize
int li_idx
if this.rowcount( ) = 0 then return 0
if isnull(rdw_control.dataobject) or rdw_control.dataobject='' then return -1
ls_process = rdw_control.Describe("DataWindow.Processing")
For li_idx = 1 to this.rowcount( )
	ls_ctrlname = this.getitemstring( li_idx, 'value')
	ls_visible_01 = this.getitemstring( li_idx, 'visible_01')
	ls_fontsize = this.getitemstring( li_idx, 'fontsize')
	// set fontsize
	string ls_test
	ls_test = rdw_control.modify(ls_ctrlname+'.Font.height='+ ls_fontsize)
	//set hidden
	ls_test = rdw_control.modify(ls_ctrlname+'.visible='+ ls_visible_01)
	//set x and width
	if ls_process = '1' then
		ls_x = this.getitemstring( li_idx, 'x')
		ls_width = this.getitemstring( li_idx, 'width')
	ls_test=	rdw_control.modify(ls_ctrlname+'.x='+ ls_x)
	ls_test=	rdw_control.modify(ls_ctrlname+'.width='+ ls_width)
	end if
NEXT
return 1
end function

public function integer f_buildwhere_of_profile (string vs_dwo);string					ls_currentSQL, ls_currentWhere, ls_rtn, ls_modify

c_string				lc_string
c_sql					lc_sql

if this.dynamic f_getcurrentSQL( ls_currentSQL, ls_currentWhere) =1 then
	ls_currentWhere = "user_profile.user_id =" + string( gi_userid) + " AND user_profile.dwobject =~~'" +vs_dwo +"~~'"

	lc_sql.f_addtowhereclause( ls_currentSQL, ls_currentWhere, " AND ")
	ls_modify = "Datawindow.Table.Select= '" + ls_currentSQL +"'"
	ls_rtn =this.modify(ls_modify )
end if		
	
return 1
end function

public subroutine f_set_transaction (t_transaction vt_transaction);
it_transaction = vt_transaction
this.settransobject( it_transaction)
end subroutine

on c_ds_usr_profile.create
call super::create
end on

on c_ds_usr_profile.destroy
call super::destroy
end on

event e_save;call super::e_save;int li_rtn
if this.update(true,true ) = 1 then
	commit using it_transaction;
	return 0
else
//	gf_messagebox('msg_LuuKhongThanhCong')
	rollback using it_transaction;
	return -1
end if
end event

