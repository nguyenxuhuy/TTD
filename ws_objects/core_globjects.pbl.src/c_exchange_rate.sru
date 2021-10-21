$PBExportHeader$c_exchange_rate.sru
forward
global type c_exchange_rate from s_object_display
end type
end forward

global type c_exchange_rate from s_object_display
end type
global c_exchange_rate c_exchange_rate

type variables
double				idb_class_id
string					is_base_code
end variables

forward prototypes
public subroutine f_set_dwo_window ()
public subroutine f_set_actionpane ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_currency_grid'
istr_dwo[1].s_dwo_form = 'd_currency_form'
istr_dwo[1].s_dwo_grid = 'd_currency_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_details = 'd_exchange_rate_grid;'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Ngoại tệ'

istr_dwo[2].s_dwo_default =  'd_exchange_rate_grid'
istr_dwo[2].s_dwo_form = ''
istr_dwo[2].s_dwo_grid = 'd_exchange_rate_grid'
istr_dwo[2].b_detail = true
istr_dwo[2].s_dwo_master = 'd_currency_grid;'
istr_dwo[2].s_master_keycol = 'ID;'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[2].b_ref_table_yn  = true
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].b_focus_master = false
istr_dwo[2].s_description = 'Tỉ giá ngoại tệ'
end subroutine

public subroutine f_set_actionpane ();istr_actionpane[2].s_dwo_action = 'd_action_manage'
istr_actionpane[2].s_objname_handling = this.classname( )
istr_actionpane[2].s_description = 'Menu quản lý'

end subroutine

on c_exchange_rate.create
call super::create
end on

on c_exchange_rate.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'UOM'
ib_changed_dwo_4edit = false
is_display_model = '2d'
ib_display_text = false
is_object_title = 'Ngoại tệ'

istr_actionpane[1].s_description = is_object_title
setnull(is_base_code)
setnull(idb_class_id)
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;long				ll_sell_rate,ll_buy_rate,ll_find

if rpo_dw.dataobject = 'd_exchange_rate_grid' then
	if vs_colname = 'one_rate_yn' then
		if vs_editdata = 'Y' then
			ll_sell_rate = rpo_dw.getitemnumber(vl_currentrow,'sell_rate')
			ll_buy_rate = rpo_dw.getitemnumber(vl_currentrow,'buy_rate')
			if ll_sell_rate <> ll_buy_rate then
				rpo_dw.setitem(vl_currentrow,'buy_rate',ll_sell_rate)
			end if
		end if
	end if
else
	if vs_colname = 'base_yn' then
		ll_find = rpo_dw.find("base_yn = 'Y'",1,rpo_dw.rowcount())
		if ll_find > 0 then
			//--kiểm tra bản trans action để xem có giao dịch chưa, nếu rồi thì không đc đổi--//
			
			//--tạm thời set base_yn = N tại dòng tìm thấy rồi set Y cho cột đc chọn--//
			rpo_dw.setitem(ll_find,'base_yn','N')
		end if
	end if
end if
return AncestorReturnValue
end event

event e_dw_e_postinsertrow;call super::e_dw_e_postinsertrow;
if mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject) - 5) = 'd_currency' then
	if not isnull(idb_class_id) then
		rpo_dw.setitem(vl_currentrow,'class_id',idb_class_id)
		rpo_dw.setitem(vl_currentrow,'multiple',1)
		setnull(idb_class_id)
	end if
elseif rpo_dw.dataobject = 'd_exchange_rate_grid' then
	if not isnull(is_base_code) then
		rpo_dw.setitem(vl_currentrow,'base_cur_code',is_base_code)
		setnull(is_base_code)
	end if
end if
return 0
end event

event e_dw_e_preinsertrow;call super::e_dw_e_preinsertrow;double 				ldb_class_id
string					ls_base_code

if mid(rpo_dw.dataobject,1,len(rpo_dw.dataobject) - 5) = 'd_currency' then
	select UNIT_CLASS.ID into :ldb_class_id from UNIT_CLASS where UNIT_CLASS.CURRENCY_YN = 'Y' USING it_transaction;
	if it_transaction.sqlcode = 0 then
		idb_class_id = ldb_class_id
	elseif it_transaction.sqlcode = 100 then
		gf_messagebox('m.c_exchange_rate.e_dw_e_preinsertrow.01','Thông báo','Chưa có lớp đơn vị tiền tệ ','exclamation','ok',1)
		return -1
	else
		//--có nhiều hơn 1 lớp đon vị tiền tệ, kiểm tra itemchanged của c_unit_class--//
		messagebox('Lỗi','c_exchange_rate.e_dw_e_preinsertrow(line:13)')
		return -1
	end if
elseif rpo_dw.dataobject = 'd_exchange_rate_grid' then
	select UOM.CODE into :ls_base_code 
	from UOM join UNIT_CLASS on UNIT_CLASS.ID = UOM.CLASS_ID 
	where UNIT_CLASS.CURRENCY_YN = 'Y' and UOM.BASE_YN = 'Y' using it_transaction;
	if it_transaction.sqlcode = 0 then
		is_base_code = ls_base_code
	elseif it_transaction.sqlcode = 100 then
		gf_messagebox('m.c_exchange_rate.e_dw_e_preinsertrow.02','Thông báo','Chưa có đồng tiền hạch toán ','exclamation','ok',1)
		return -1
	else
		//--có nhiều hơn 1 đồng tiền hạch toán, xem lại itemchanged của c_currency--//
		messagebox('Lỗi','c_exchange_rate.e_dw_e_preinsertrow(line:27)')
		return -1
	end if
end if
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;iw_display.f_set_ii_upperpart_height( 1/2)

return ancestorreturnvalue
end event

