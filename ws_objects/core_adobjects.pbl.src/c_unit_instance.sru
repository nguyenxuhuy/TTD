$PBExportHeader$c_unit_instance.sru
$PBExportComments$c_unit_instance
forward
global type c_unit_instance from s_object_instantiate
end type
end forward

global type c_unit_instance from s_object_instantiate
end type

type prototypes

end prototypes

type variables
string				is_dwo, is_unit_colname, is_value_colname[]
end variables

forward prototypes
public function double f_get_unit_class_id (string vs_unit_code)
public function double f_get_unit_class_id (double vdb_unit_id)
public function integer f_get_unit_standard (ref string rs_unit_code, ref double rdb_unit_id, double vdb_class_id)
public function boolean f_is_unit_conversion (double vdb_unit_id)
public function boolean f_is_unit_standard (double vdb_unit_id)
public function double f_db_round (double vdb_round_id, double vdb_values, t_transaction vt_transaction)
public function double f_get_unit_inventory_id (double vdb_item_id)
public function any f_current_dwdata (datawindow vdw_handle, string vs_dwo, string vs_colname)
public function double f_get_unit_inventory_id (string vs_item_code)
public function double f_round (datawindow vdw_handle, double vdb_round_id, double vdb_editdata)
public function integer f_get_data_4_rounding (s_str_unit vsa_str_unit[], datawindow vdw_handle, string vs_colname, string vs_editdata, ref any raa_data[])
public function double f_get_round_id (double vdb_unit_id, double vdb_item_id, string vs_type)
public function integer f_get_data_4_conversion_unit (double vdb_unit_id, double vdb_item_id, double vdb_data, ref double rdba_data_conver[])
public function integer f_get_base_cur (ref double rdb_id, ref string rs_code, ref string rs_name)
public function integer f_get_data_4_conversion_cur (s_str_unit vs_str_unit[], datawindow vdw_handle, double vdb_price_data, double vdb_qty, decimal vdc_rate, ref double rdba_data[], string vs_cur_code_amount, string vs_colname, long vl_row)
public function integer f_setitem_rounding (datawindow vdw_handle, s_str_unit vs_str_unit[], string vs_colname, double vdba_data[], string vs_type, string vs_editdata, long vl_row)
public function double f_round (ref t_transaction rt_transaction, double vdb_round_id, double vdb_editdata)
public function integer f_get_exchange_account_info (double vdb_curr_id, ref double rdba_exchange_account[], ref string rs_exchange_rate_method, ref string rs_trans_text)
public function integer f_get_data_4_rounding (s_str_unit vsa_str_unit[], datawindow vdw_handle, string vs_colname, string vs_editdata, ref any raa_data[], long vl_handle_row)
public function any f_current_dwdata (datawindow vdw_handle, string vs_dwo, string vs_colname, long vl_handle_row)
public function double f_get_round_diff (double vdb_item_id)
public function double f_get_unit_class_id_ex (string vs_unit_code, ref t_transaction rt_transaction)
public function double f_get_unit_class_id_ex (double vdb_unit_id, ref t_transaction rt_transaction)
public function integer f_get_unit_standard_ex (ref string rs_unit_code, ref double rdb_unit_id, double vdb_class_id, ref t_transaction rt_transaction)
public function integer f_get_base_cur_ex (ref double rdb_id, ref string rs_code, ref string rs_name, t_transaction rt_transaction)
public function double f_get_round_id_ex (double vdb_unit_id, double vdb_item_id, string vs_type, ref t_transaction rt_transaction)
public function double f_get_curr_id (string vs_code, t_transaction rt_transaction)
public function decimal f_get_exchange_rate (double vdb_curr_id, date vd_trans_date, ref t_transaction rt_transaction)
public function double f_round_ex (ref t_transaction rt_transaction, double vdb_round_id, double vdb_editdata)
end prototypes

public function double f_get_unit_class_id (string vs_unit_code);/*****************************************
Lấy lớp đơn vị class_id khi biết mã đơn vị unit_code
return -1 lỗi
******************************************/
double				ldb_class_id

select class_id into :ldb_class_id
from uom
where code = :vs_unit_code using SQLCA;
if SQLCA.sqlcode <> 0 then
	messagebox('lỗi','c_unit_instance.f_get_unit_class_id(line:10)')
	return -1
end if
if ldb_class_id >= 0 then
	return ldb_class_id
else
	return -1
end if

end function

public function double f_get_unit_class_id (double vdb_unit_id);/*****************************************
Lấy lớp đơn vị class_id khi biết mã đơn vị unit_id
return -1 lỗi
******************************************/
double				ldb_class_id

select class_id into :ldb_class_id
from uom
where ID = :vdb_unit_id using SQLCA;
if SQLCA.sqlcode <> 0 then
	messagebox('lỗi','c_unit_instance.f_get_unit_class_id(line:10)')
	return -1
end if
if ldb_class_id >= 0 then
	return ldb_class_id
else
	return -1
end if

end function

public function integer f_get_unit_standard (ref string rs_unit_code, ref double rdb_unit_id, double vdb_class_id);/*******************************************************
Lấy code và unit_id của đơn vị chuẩn trong cùng 1 lớp đơn vị class_id
return 	-1 lỗi
			1	thành công
*******************************************************/
double				ldb_unit_id
string					ls_unit_code

if vdb_class_id = -1 then return -1
select id,code into :ldb_unit_id,:ls_unit_code
from uom
where class_id = :vdb_class_id and base_yn = 'Y' using SQLCA;
if SQLCA.sqlcode <> 0 then
	messagebox('lỗi','c_unit_instance.f_get_unit_standard(line:15)')
	return -1
end if

rs_unit_code = ls_unit_code
rdb_unit_id = ldb_unit_id
return 1
end function

public function boolean f_is_unit_conversion (double vdb_unit_id);/***************************************
Kiểm tra đơn vị chuẩn đã có quy đổi đơn vị chưa
true:		đã có
false:		chưa có
***************************************/
long			ll_count

select count(ID) into :ll_count
from unit_conversion
where to_unit_id = :vdb_unit_id using SQLCA;
if SQLCA.sqlcode <> 0 then 
	messagebox('lỗi','c_unit_instance.f_check_unit_conversion(line:11)')
	return false
end if
if ll_count > 0 then
	return true
else
	return false
end if

end function

public function boolean f_is_unit_standard (double vdb_unit_id);/**********************************************
kiểm tra unit_id truyền vào có phải là unit_standard không
***********************************************/
double				ldb_class_id,ldb_unit_id_stan
string					ls_unit_code

ldb_class_id = this.f_get_unit_class_id(vdb_unit_id )
this.f_get_unit_standard( ls_unit_code, ldb_unit_id_stan, ldb_class_id)
if ldb_unit_id_stan = vdb_unit_id then
	return true
else
	return false
end if
end function

public function double f_db_round (double vdb_round_id, double vdb_values, t_transaction vt_transaction);//--Gọi hàm làm tròn trên database--//
double				ldb_rtn

ldb_rtn = vt_transaction.f_db_round( vdb_round_id, vdb_values)

return ldb_rtn
end function

public function double f_get_unit_inventory_id (double vdb_item_id);/***************************
Lấy đơn vị tồn kho khi biết item_id
***************************/
double				ldb_unit_inventory_id

//--Viết câu select lấy đơn vị tồn kho--//

select item.stock_uom into :ldb_unit_inventory_id
from item left join object on object.id = item.object_ref_id 
where object.id = :vdb_item_id using SQLCA;

return ldb_unit_inventory_id
end function

public function any f_current_dwdata (datawindow vdw_handle, string vs_dwo, string vs_colname);/**********************
Lấy data khi biết tên cột
return la_rtn: giá trị của cột
*********************/
window				lw_parent
t_dw_mpl			ldw_object

string					ls_unit_code
any					la_rtn

if upper(vs_colname) = 'BC' then
	 select UOM.CODE into :ls_unit_code 
    from UOM join UNIT_CLASS on UNIT_CLASS.ID = UOM.CLASS_ID 
                                                and UNIT_CLASS.CURRENCY_YN = 'Y' 
                                                and UOM.BASE_YN = 'Y' USING SQLCA;
    if SQLCA.sqlcode = 0 then
        la_rtn = ls_unit_code
    elseif SQLCA.sqlcode = 100 then
        //--chưa có đồng tiền hạch toán--//
        messagebox('Lỗi','c_unit_instance.f_current_dwdata(line:19)')
        return la_rtn
    else
        messagebox('Lỗi','c_unit_instance.f_current_dwdata(line:19)')
        return la_rtn
    end if
else
	
	if vdw_handle.dataobject = vs_dwo then
		la_rtn = vdw_handle.dynamic f_getitemany(vdw_handle.getrow(),vs_colname)
	else
		vdw_handle.dynamic f_getparentwindow(lw_parent)
		ldw_object = lw_parent.dynamic f_get_dw(vs_dwo)
		if not isnull(ldw_object) then
			if ldw_object.getrow() = 0 then 
				setnull(la_rtn)
				return la_rtn
			end if
			la_rtn = ldw_object.dynamic f_getitemany(ldw_object.getrow(),vs_colname)
		end if
	end if
end if
return la_rtn
end function

public function double f_get_unit_inventory_id (string vs_item_code);/*****************************
Lấy đơn vị tồn kho khi biết item_code
*****************************/
double				ldb_unit_inventory_id,ldb_item_id
string					ls_table

this.is_table = 'object'
ldb_item_id = this.f_get_id( vs_item_code)
ldb_unit_inventory_id = this.f_get_unit_inventory_id(ldb_item_id )
return ldb_unit_inventory_id
end function

public function double f_round (datawindow vdw_handle, double vdb_round_id, double vdb_editdata);/************************
Chức năng: làm tròn editdata 
return 0: không làm tròn
		 
************************/
double				ldb_data
window				lw_parent
t_transaction		lt_transaction

if vdb_round_id > 0 then
	vdw_handle.dynamic f_getparentwindow(lw_parent)
	lw_parent.dynamic f_get_transaction(lt_transaction)
	ldb_data = this.f_db_round( vdb_round_id, vdb_editdata, lt_transaction)
	return ldb_data
end if
setnull(ldb_data)
return ldb_data
end function

public function integer f_get_data_4_rounding (s_str_unit vsa_str_unit[], datawindow vdw_handle, string vs_colname, string vs_editdata, ref any raa_data[]);/**********************************************
kiểm tra vs_colname là cột chứa data cần làm tròn hoặc
chứa đơn vị hoặc chứa mã hàng
return ll_idx:	ok (ll_idx cho biết đang ở struct của str_unit 
	để kiểm tra xem struct đó có cần setitem vào cột colname_conver hay không)
return 0:	ko thành công
	raa_data[1]: chứa data cần làm tròn
	raa_data[2]: chứa mã đơn vị(unit_code)
	raa_data[3]: chứa mã hàng(item_code)
	raa_data[4]: chứa loại làm tròn
**********************************************/
string					lsa_colname_datas[],lsa_colname_units[],lsa_colname_items[]
string					lsa_dwo_units[],lsa_dwo_items[],ls_types[], lsa_dwo_handle[]
any					laa_data[],laa_rtn
long					ll_rtn,ll_idx,ll_idx2,ll_idx_dwo
s_str_unit			lsa_str_unit[]
c_string				lc_string

lsa_str_unit = vsa_str_unit
ll_rtn = upperbound(lsa_str_unit[])
if ll_rtn > 0 then
	for ll_idx = 1 to ll_rtn
		//--làm tròn khi giá trị thay đổi--//
		//if vdw_handle.dataobject = lsa_str_unit[ll_idx].s_dwo_handing then
		if pos(lsa_str_unit[ll_idx].s_dwo_handing, vdw_handle.dataobject+';' ) > 0 then
			lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_colname_data, ';', lsa_colname_datas)
			lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_dwo_handing, ';', lsa_dwo_handle[])
			lsa_str_unit[ll_idx].s_colname_data = trim( lsa_str_unit[ll_idx].s_colname_data)
			for ll_idx2 = 1 to upperbound(lsa_colname_datas)				
				if lsa_colname_datas[ll_idx2] = vs_colname then
					lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_dwo_unit, ';', lsa_dwo_units)
					lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_colname_unit, ';', lsa_colname_units)
					lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_type, ';', ls_types)
					
					laa_data[1] = vs_editdata
					laa_rtn = f_current_dwdata(vdw_handle,lsa_dwo_units[ll_idx2],lsa_colname_units[ll_idx2])
					if isnull(laa_rtn) then 
						if ll_idx = ll_rtn then return 0
						continue
					end if
					laa_data[2] = laa_rtn
					if lower(ls_types[ll_idx2]) = 'item' then
						lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_dwo_object, ';', lsa_dwo_items)
						lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_colname_object, ';', lsa_colname_items)
						laa_rtn = f_current_dwdata(vdw_handle,lsa_dwo_items[ll_idx2],lsa_colname_items[ll_idx2])
						if isnull(laa_rtn) then return 0
						laa_data[3] = laa_rtn
					else //--Loại price và amound không cần mã hàng--//
						laa_data[3] = ''
					end if
					laa_data[4] = ls_types[ll_idx2]
					raa_data[] = laa_data[]
					return ll_idx
				end if
			next				
		end if
		//--làm tròn khi đơn vị thay đổi--//
		lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_dwo_unit, ';', lsa_dwo_units)
		for ll_idx_dwo = 1 to upperbound(lsa_dwo_units)
			//--kiểm tra dw đang edit có phải là dw chứa cột đơn vị không--//
			if vdw_handle.dataobject = lsa_dwo_units[ll_idx_dwo] then
				lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_colname_unit, ';', lsa_colname_units)
//				for ll_idx2 = 1 to upperbound(lsa_colname_units)
					if lsa_colname_units[ll_idx_dwo] = vs_colname then
						lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_colname_data, ';', lsa_colname_datas)
						lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_dwo_handing, ';', lsa_dwo_handle[])
						lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_type, ';', ls_types)
						if lower(ls_types[ll_idx_dwo]) = 'ex' or (lower(ls_types[ll_idx_dwo]) = '""' and ll_idx_dwo = upperbound(lsa_dwo_units)) then
							laa_data[1] = vs_editdata
							laa_data[2] = ''
						else
							laa_rtn = f_current_dwdata(vdw_handle,lsa_dwo_handle[ll_idx_dwo],lsa_colname_datas[ll_idx_dwo])
							if isnull(laa_rtn) or double(laa_rtn) = 0 then return 0
							laa_data[1] = laa_rtn
							laa_data[2] = vs_editdata
						end if
						if lower(ls_types[ll_idx_dwo]) = 'item' then
							lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_dwo_object, ';', lsa_dwo_items)
							lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_colname_object, ';', lsa_colname_items)
							laa_rtn =f_current_dwdata(vdw_handle,lsa_dwo_items[ll_idx_dwo],lsa_colname_items[ll_idx_dwo])
							if isnull(laa_rtn) then return 0
							laa_data[3] = laa_rtn
//						elseif lower(ls_types[ll_idx2]) = 'ex' then
						else //--Loại price và amound không cần mã hàng--//
							laa_data[3] = ''
						end if
						if lower(ls_types[ll_idx_dwo]) = '""' and ll_idx_dwo = upperbound(lsa_dwo_units) then
							laa_data[4] = 'ex'
						else
							laa_data[4] = ls_types[ll_idx_dwo]
						end if
						raa_data[] = laa_data[]
						return ll_idx
					end if
//				next
			end if
		next
		//--làm tròn khi mã hàng bị thay đổi--//
		lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_dwo_object, ';', lsa_dwo_items)
		for ll_idx_dwo = 1 to upperbound(lsa_dwo_items)
			//--kiểm tra dw đang edit có phải là dw chứa cột mã hàng không--//
			if vdw_handle.dataobject = lsa_dwo_items[ll_idx_dwo] then
				lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_colname_object, ';', lsa_colname_items)
				for ll_idx2 = 1 to upperbound(lsa_colname_items)
					if lsa_colname_items[ll_idx2] = vs_colname then
						lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_colname_data, ';', lsa_colname_datas)
						lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_dwo_unit, ';', lsa_dwo_units)
						lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_colname_unit, ';', lsa_colname_units)
						laa_rtn = f_current_dwdata(vdw_handle,lsa_dwo_items[ll_idx2],lsa_colname_datas[ll_idx2])
						if isnull(laa_rtn) then return 0
						laa_data[1] = laa_rtn
						laa_rtn = f_current_dwdata(vdw_handle,lsa_dwo_units[ll_idx2],lsa_colname_units[ll_idx2])
						if isnull(laa_rtn) then return 0
						laa_data[2] = laa_rtn
						laa_data[3] = vs_editdata
						laa_data[4] = 'item'
						raa_data[] = laa_data[]
						return ll_idx
					end if
				next
			end if
		next
	next
end if
return 0
end function

public function double f_get_round_id (double vdb_unit_id, double vdb_item_id, string vs_type);/******************************
Lấy round_id khi có unit_id và item_id
---------------------------------------------------------------
Tham số:	- vdb_unit_id: ID của đơn vị cần lấy phương thức làm tròn
				- vdb_item_id: ID của hàng hóa, sản phẩm (trường hợp là vdb_unit_id tiền tệ thì vdb_item_id = 0
				- vs_type: là 'item' - hàng hóa ,'price' - đơn giá  ,'amount' - thành tiền, 'bc' - tiền hạch toán
return round_id: thành công
					0: không có round_id
					-1: lỗi
*******************************/
double				ldb_round_id
int						li_cnt
b_obj_instantiate		lc_unit


if lower(vs_type) = 'bom' then
	//--lấy round_id từ bảng item--//
	select count(object.id) into :li_cnt
	from item join object on item.object_ref_id = object.id 
	where object.id = :vdb_item_id and item.stock_uom = :vdb_unit_id using SQLCA;
	if li_cnt=1 then
		select item.round_id into:ldb_round_id
		from item join object on item.object_ref_id = object.id 
		where object.id = :vdb_item_id and item.stock_uom = :vdb_unit_id using SQLCA;
		return ldb_round_id
	else
		gf_messagebox('m.c_unit_instance.f_get_round_id.01','Thông báo','Mã hàng sau chưa cài đặt phương thức làm tròn cho đơn vị tồn kho:@'+lc_unit.f_get_object_code(vdb_item_id),'exclamation','ok',1)
		return -1
	end if
elseif lower(vs_type) = 'item' then
	//--lấy round_id từ bảng item--//
	select item.round_id into:ldb_round_id
	from item left join object on object.id = item.object_ref_id
	where object.id = :vdb_item_id and item.stock_uom = :vdb_unit_id using SQLCA;
	if SQLCA.sqlcode = 0 then
		if isnull(ldb_round_id) or ldb_round_id = 0 then
			//--Lấy round_id trường hợp qui đổi đơn vị cùng lớp--//
			select uom_round_id into :ldb_round_id
			from UOM
			where ID = :vdb_unit_id using SQLCA;
			if SQLCA.sqlcode = 0 then
				if isnull(ldb_round_id) or ldb_round_id = 0 then
					gf_messagebox('m.c_unit_instance.f_get_round_id.04','Thông báo','Chưa cài đặt phương thức làm tròn cho đơn vị tính:@'+ lc_unit.f_get_object_code(vdb_unit_id) ,'exclamation','ok',1)
					return -1
				end if								
				return ldb_round_id
			elseif SQLCA.sqlcode = 100 then
				gf_messagebox('m.c_unit_instance.f_get_round_id.05','Thông báo','Chưa cài đặt phương thức làm tròn cho đơn vị tính:@'+ lc_unit.f_get_object_code(vdb_unit_id)   ,'exclamation','ok',1)
				return -1
			else
				messagebox('Lỗi','c_unit_instance.f_get_round_id(line:24)')
				return -1
			end if
		end if
		return ldb_round_id
	elseif SQLCA.sqlcode = 100 then
		//--Lấy round_id trường hợp qui đổi đơn vị khác lớp: từ đơn vị khác ra đơn vị tồn kho --//
		select round_id into :ldb_round_id
		from unit_conversion
		where FROM_UNIT_ID = :vdb_unit_id and item_id = :vdb_item_id using SQLCA;
		if SQLCA.sqlcode =0 then
			if isnull(ldb_round_id) or ldb_round_id = 0 then
				gf_messagebox('m.c_unit_instance.f_get_round_id.02','Thông báo','Mã hàng sau chưa cài đặt phương thức làm tròn cho đơn vị quy đổi:@'+lc_unit.f_get_object_code(vdb_item_id)+'-'+ lc_unit.f_get_object_code(vdb_unit_id) ,'exclamation','ok',1)
				return -1
			end if			
			return ldb_round_id
		elseif SQLCA.sqlcode = 100 then
			//--Lấy round_id trường hợp qui đổi đơn vị khác lớp: từ đơn vị tồn kho ra đơn vị khác --//
			select round_id into :ldb_round_id
			from unit_conversion
			where TO_UNIT_ID = :vdb_unit_id and item_id = :vdb_item_id using SQLCA;
			if SQLCA.sqlcode =0 then
				if isnull(ldb_round_id) or ldb_round_id = 0 then
					gf_messagebox('m.c_unit_instance.f_get_round_id.03','Thông báo','Mã hàng sau chưa cài đặt phương thức làm tròn cho đơn vị quy đổi:@'+lc_unit.f_get_object_code(vdb_item_id)+'-'+ lc_unit.f_get_object_code(vdb_unit_id) ,'exclamation','ok',1)
					return -1
				end if			
				return ldb_round_id			
			elseif SQLCA.sqlcode = 100 then
				//--Lấy round_id trường hợp qui đổi đơn vị cùng lớp--//
				select round_id into :ldb_round_id
				from unit_conversion
				where FROM_UNIT_ID = :vdb_unit_id and item_id = :vdb_item_id using SQLCA;
				if SQLCA.sqlcode = 0 then
					if isnull(ldb_round_id) or ldb_round_id = 0 then
						gf_messagebox('m.c_unit_instance.f_get_round_id.04','Thông báo','Mã hàng sau chưa cài đặt phương thức làm tròn cho đơn vị quy đổi:@'+lc_unit.f_get_object_code(vdb_item_id)+'-'+ lc_unit.f_get_object_code(vdb_unit_id) ,'exclamation','ok',1)
						return -1
					end if								
					return ldb_round_id
				elseif SQLCA.sqlcode = 100 then
					//--Lấy round_id trường hợp qui đổi đơn vị cùng lớp--//
					select uom_round_id into :ldb_round_id
					from UOM
					where ID = :vdb_unit_id using SQLCA;
					if SQLCA.sqlcode = 0 then
						if isnull(ldb_round_id) or ldb_round_id = 0 then
							gf_messagebox('m.c_unit_instance.f_get_round_id.04','Thông báo','Chưa cài đặt phương thức làm tròn cho đơn vị tính:@'+ lc_unit.f_get_object_code(vdb_unit_id) ,'exclamation','ok',1)
							return -1
						end if								
						return ldb_round_id
					elseif SQLCA.sqlcode = 100 then
						gf_messagebox('m.c_unit_instance.f_get_round_id.05','Thông báo','Chưa cài đặt phương thức làm tròn cho đơn vị tính:@'+ lc_unit.f_get_object_code(vdb_unit_id)   ,'exclamation','ok',1)
						return -1
					else
						messagebox('Lỗi','c_unit_instance.f_get_round_id(line:24)')
						return -1
					end if
					gf_messagebox('m.c_unit_instance.f_get_round_id.06','Thông báo','Mã hàng '+lc_unit.f_get_object_code(vdb_item_id)+' chưa cài đặt quy đổi cho đơn vị '+ lc_unit.f_get_object_code(vdb_unit_id)   ,'exclamation','ok',1)
					return -1
				else
					messagebox('Lỗi','c_unit_instance.f_get_round_id(line:24)')
					return -1
				end if
			end if
		else
			messagebox('Lỗi','c_unit_instance.f_get_round_id(line:28)')
			return -1
		end if
	else
		messagebox('Lỗi','c_unit_instance.f_get_round_id(line:32)')
		return -1
	end if
elseif lower(vs_type) = 'price' then
	select UOM.PRICE_ROUND_ID into :ldb_round_id from UOM where UOM.ID = :vdb_unit_id USING SQLCA;
	if SQLCA.sqlcode = 0 then
		if isnull(ldb_round_id) or ldb_round_id = 0 then
			gf_messagebox('m.c_unit_instance.f_get_round_id.06','Thông báo','Loại tiền sau chưa cài đặt phương thức làm tròn:@'+ lc_unit.f_get_object_code(vdb_unit_id) ,'exclamation','ok',1)
			return -1		
		end if
		return ldb_round_id
	elseif SQLCA.sqlcode = 100 then
		//--chưa cài đặt làm tròn giá--//
		gf_messagebox('m.c_unit_instance.f_get_round_id.07','Thông báo','Loại tiền sau chưa cài đặt phương thức làm tròn:@'+ lc_unit.f_get_object_code(vdb_unit_id) ,'exclamation','ok',1)
		return -1
	else
		messagebox('Lỗi','c_unit_instance.f_get_round_id(line:54)')
		return -1
	end if
elseif lower(vs_type) = 'amount' then
	select UOM.AMOUNT_ROUND_ID into :ldb_round_id from UOM where UOM.ID = :vdb_unit_id USING SQLCA;
	if SQLCA.sqlcode = 0 then
		if isnull(ldb_round_id) or ldb_round_id = 0 then
			gf_messagebox('m.c_unit_instance.f_get_round_id.08','Thông báo','Loại tiền sau chưa cài đặt phương thức làm tròn:@'+ lc_unit.f_get_object_code(vdb_unit_id) ,'exclamation','ok',1)
			return -1		
		end if		
		return ldb_round_id
	elseif SQLCA.sqlcode = 100 then
		//--chưa cài đặt làm tròn thành tiền hoặc đồng tiền hạch toán--//
		gf_messagebox('m.c_unit_instance.f_get_round_id.09','Thông báo','Chưa chọn loại tiền giao dịch','exclamation','ok',1)
		return -1
	else
		messagebox('Lỗi','c_unit_instance.f_get_round_id(line:66)')
		return -1
	end if
elseif lower(vs_type) = 'bc' then
	select uom.amount_round_id into :ldb_round_id from uom left join unit_class on uom.class_id = unit_class.id
	where unit_class.currency_yn = 'Y' and uom.base_yn = 'Y' USING SQLCA;
	if SQLCA.sqlcode = 0 then
		if isnull(ldb_round_id) or ldb_round_id = 0 then
			gf_messagebox('m.c_unit_instance.f_get_round_id.10','Thông báo','Loại tiền sau chưa cài đặt phương thức làm tròn:@'+ lc_unit.f_get_object_code(vdb_unit_id) ,'exclamation','ok',1)
			return -1		
		end if		
		return ldb_round_id
	elseif SQLCA.sqlcode = 100 then
		//--chưa cài đặt làm tròn thành tiền hoặc đồng tiền hạch toán--//
		gf_messagebox('m.c_unit_instance.f_get_round_id.11','Thông báo','Chưa chọn loại tiền giao dịch','exclamation','ok',1)
		return -1
	else
		messagebox('Lỗi','c_unit_instance.f_get_round_id(line:78)')
		return -1
	end if
elseif lower(vs_type) = 'account' then
	select ROUNDING.ID into :ldb_round_id from ROUNDING where lower(ROUNDING.TYPE) = 'standard' and rownum < 2;
	if isnull(ldb_round_id) then ldb_round_id = 0
	return ldb_round_id
end if
return 0
end function

public function integer f_get_data_4_conversion_unit (double vdb_unit_id, double vdb_item_id, double vdb_data, ref double rdba_data_conver[]);/****************************************
Lấy qui đổi đơn vị cho đơn vị giao dịch
return 0: không qui đổi
		-1: lỗi
		 1: ok
ref		rdba_data_conver[1]: data đã qui đổi
		rdba_data_conver[2]: chênh lệch làm tròn
		rdba_data_conver[3]: tỷ lệ quy đổi về đơn vị tồn kho
****************************************/
double				ldb_from_coefficient,ldb_to_coefficient,ldb_to_unit_id,ldb_diff, ldb_from_unit_id
double				ldb_unit_inventory_id,ldb_from_coefficient_inven,ldb_to_coefficient_inven, ldb_round_id
string					ls_unit_code,ls_item_code
int						li_count
c_unit_instance	lc_unit_instance

if vdb_item_id = 0 then return 0
lc_unit_instance.is_table = 'object'
ls_item_code = lc_unit_instance.f_get_code( vdb_item_id) 
lc_unit_instance.is_table = 'uom'
ldb_unit_inventory_id = this.f_get_unit_inventory_id(vdb_item_id )

if ldb_unit_inventory_id > 0 then
	ldb_round_id = this.f_get_round_id( ldb_unit_inventory_id , vdb_item_id, 'item')
	if vdb_unit_id = ldb_unit_inventory_id then 
		rdba_data_conver[1] = vdb_data
		rdba_data_conver[2] = 0
		rdba_data_conver[3] =  1
		rdba_data_conver[4] =  ldb_round_id
		return 0
	end if
else
	gf_messagebox('m.c_unit_instance.f_unit_conversion.01','Thông báo','Chưa cài đặt đơn vị tồn kho cho mã hàng @: '+ls_item_code,'exclamation','ok',1)
	return -1
end if
	//--Qui đổi đơn vị khác lớp: Từ đơn vị khác đổi ra đvị tồn kho --//
	select from_coefficient,to_coefficient,to_unit_id,round_diff into :ldb_from_coefficient,:ldb_to_coefficient,:ldb_to_unit_id,:ldb_diff
	from unit_conversion
	where item_id = :vdb_item_id and from_unit_id = :vdb_unit_id using SQLCA;
	
	if SQLCA.sqlcode = 0 then
		if isnull(ldb_to_coefficient) then ldb_to_coefficient = 0
		if isnull(ldb_from_coefficient) or ldb_from_coefficient = 0 or ldb_to_coefficient = 0 then
			gf_messagebox('m.c_unit_instance.f_unit_conversion.02','Thông báo','Hệ số quy đổi đơn vị của mã hàng sau phải khác không: '+ls_item_code,'exclamation','ok',1)
			return -1			
		end if
		if isnull(ldb_diff) then ldb_diff = 0		
		rdba_data_conver[1] =  vdb_data / (ldb_to_coefficient / ldb_from_coefficient)
		rdba_data_conver[2] = ldb_diff
		rdba_data_conver[3] = (ldb_to_coefficient / ldb_from_coefficient)
		rdba_data_conver[4] =  ldb_round_id
		return 1
	elseif SQLCA.sqlcode = 100 then
		//--Qui đổi đơn vị khác lớp: Từ đơn vị tồn kho đổi ra đơn vị khác --//
		select count(from_unit_id) into :li_count
		from unit_conversion
		where item_id = :vdb_item_id and to_unit_id = :vdb_unit_id using SQLCA;	
		if li_count > 1 then
			gf_messagebox('m.c_unit_instance.f_unit_conversion.03','Thông báo','Mã hàng: '+ls_item_code + ' có 2 quy đổi cùng 1 đơn vị','exclamation','ok',1)
			return -1
		end if
		select from_coefficient,to_coefficient,from_unit_id,round_diff into :ldb_from_coefficient,:ldb_to_coefficient,:ldb_from_unit_id,:ldb_diff
		from unit_conversion
		where item_id = :vdb_item_id and to_unit_id = :vdb_unit_id using SQLCA;		
		if SQLCA.sqlcode = 0 then
			if isnull(ldb_from_coefficient) then ldb_from_coefficient = 0
			if isnull(ldb_to_coefficient) or ldb_to_coefficient = 0 or ldb_from_coefficient =  0 then
				gf_messagebox('m.c_unit_instance.f_unit_conversion.02','Thông báo','Hệ số quy đổi đơn vị của mã hàng sau phải khác không: '+ls_item_code,'exclamation','ok',1)
				return -1			
			end if
			if isnull(ldb_diff) then ldb_diff = 0			
			rdba_data_conver[1] = vdb_data / ( ldb_from_coefficient/ldb_to_coefficient )
			rdba_data_conver[2] = ldb_diff
			rdba_data_conver[3] = ( ldb_from_coefficient/ldb_to_coefficient )
			rdba_data_conver[4] =  ldb_round_id
			return 1
		elseif SQLCA.sqlcode = 100 then
			//--Qui đổi đơn vị cùng lớp--//
			select from_coefficient,to_coefficient,to_unit_id,round_diff into :ldb_from_coefficient,:ldb_to_coefficient,:ldb_to_unit_id,:ldb_diff
			from unit_conversion
			where from_unit_id = :vdb_unit_id and nvl(item_id,0) = 0 using SQLCA;
			
			if SQLCA.sqlcode = 0 then
				if isnull(ldb_to_coefficient) then ldb_to_coefficient = 0
				if isnull(ldb_from_coefficient) or ldb_from_coefficient = 0 then
					gf_messagebox('m.c_unit_instance.f_unit_conversion.02','Thông báo','Hệ số quy đổi đơn vị của mã hàng sau phải khác không: '+ls_item_code,'exclamation','ok',1)
					return -1			
				end if
				if isnull(ldb_diff) then ldb_diff = 0						
				//--đơn vị tồn kho giống với đơn vị chuẩn--//
				if ldb_unit_inventory_id = ldb_to_unit_id then
					rdba_data_conver[1] = vdb_data / (ldb_to_coefficient / ldb_from_coefficient)
					rdba_data_conver[2] = ldb_diff
					rdba_data_conver[3] = (ldb_to_coefficient / ldb_from_coefficient)
					rdba_data_conver[4] =  ldb_round_id
					return 1
				else
					//--Tìm quy đổi đơn vị của đơn vị tồn kho--//
					select from_coefficient,to_coefficient,round_diff into :ldb_from_coefficient_inven,:ldb_to_coefficient_inven,:ldb_diff
					from unit_conversion
					where from_unit_id = :ldb_unit_inventory_id and nvl(item_id,0) = 0 using SQLCA;
					
					if SQLCA.sqlcode = 0 then
						if isnull(ldb_to_coefficient_inven) then ldb_to_coefficient_inven = 0
						if isnull(ldb_from_coefficient_inven) or ldb_from_coefficient_inven = 0 then
							gf_messagebox('m.c_unit_instance.f_unit_conversion.02','Thông báo','Hệ số quy đổi đơn vị của mã hàng sau phải khác không: '+ls_item_code,'exclamation','ok',1)
							return -1			
						end if
						if isnull(ldb_diff) then ldb_diff = 0							
						rdba_data_conver[1] = (vdb_data * (ldb_to_coefficient / ldb_from_coefficient)) / (ldb_to_coefficient_inven/ldb_from_coefficient_inven)
						rdba_data_conver[2] = ldb_diff
						rdba_data_conver[3] = (ldb_to_coefficient / ldb_from_coefficient) / (ldb_to_coefficient_inven/ldb_from_coefficient_inven)
						rdba_data_conver[4] =  ldb_round_id
						return 1
					elseif SQLCA.sqlcode = 100 then
						ls_unit_code = lc_unit_instance.f_get_code(ldb_unit_inventory_id )
						gf_messagebox('m.c_unit_instance.f_unit_conversion.02','Thông báo','Chưa cài đặt qui đổi cho đơn vị @'+ls_unit_code+' của mã hàng @: '+ls_item_code,'exclamation','ok',1)
						return -1
					else
						//--message lỗi : lỗi database--//
						//messagebox('Lỗi','c_unit_instance.f_unit_conversion(line:38)')
						gf_messagebox('m.c_unit_instance.f_unit_conversion.02','Thông báo','Cài đặt quy đổi đơn vị chưa đúng!','exclamation','ok',1)
						return -1
					end if
				end if
			elseif SQLCA.sqlcode = 100 then
				ls_unit_code = lc_unit_instance.f_get_code(vdb_unit_id )
				gf_messagebox('m.c_unit_instance.f_unit_conversion.03','Thông báo','Chưa cài đặt qui đổi cho đơn vị @'+ls_unit_code+' của mã hàng @: '+ls_item_code,'exclamation','ok',1)
				return -1
			else
				//--message lỗi : lỗi database--//
				messagebox('Lỗi','c_unit_instance.f_unit_conversion(line:45)')
				return -1
			end if
		end if
	else
		//--message lỗi : lỗi database--//
		messagebox('Lỗi','c_unit_instance.f_unit_conversion(line:49)')
		return -1
	end if
return 0
end function

public function integer f_get_base_cur (ref double rdb_id, ref string rs_code, ref string rs_name);
select uom.id, uom.code, uom.name into :rdb_id , :rs_code , :rs_name 
from uom left join unit_class uc on uc.id = uom.class_id 
where upper(uom.base_yn) = 'Y' and upper(uc.CURRENCY_YN) = 'Y' using SQLCA;
if SQLCA.sqlcode = 0 then
	return 1
else
	return -1
end if
end function

public function integer f_get_data_4_conversion_cur (s_str_unit vs_str_unit[], datawindow vdw_handle, double vdb_price_data, double vdb_qty, decimal vdc_rate, ref double rdba_data[], string vs_cur_code_amount, string vs_colname, long vl_row);string 				lsa_col_datas[],lsa_col_units[],lsa_types[],lsa_dwo_units[], lsa_dwo_round[]
string					ls_cur_code_amount,ls_cur_code_exchange
decimal				ldc_rate
double				ldb_qty,ldb_amount,ldb_cur_id_amount,ldb_round_id_amount,ldb_exchange,ldb_cur_id_exchange
double				ldb_amount_data,ldb_price_data,ldb_exchange_data,ldb_round_id_exchange
boolean				lb_bc = false,lb_amount = false
int						li_idx,li_idx2, li_cnt
c_unit_instance		c_unit
c_string				lc_string
window				lw_parent
t_dw_mpl			ldw_object,ldw_handle, ldw_round

for li_idx = 1 to upperbound(vs_str_unit)
	vs_str_unit[li_idx].s_dwo_handing = trim(vs_str_unit[li_idx].s_dwo_handing)
	if right(vs_str_unit[li_idx].s_dwo_handing,1) <>';' then vs_str_unit[li_idx].s_dwo_handing +=';'
	if  pos(vs_str_unit[li_idx].s_dwo_handing, vdw_handle.dataobject+';' ) > 0 then
		ldw_handle = vdw_handle
		
		vs_str_unit[li_idx].s_colname_data = trim(vs_str_unit[li_idx].s_colname_data)
		if right(vs_str_unit[li_idx].s_colname_data,1) <>';' then vs_str_unit[li_idx].s_colname_data += ';'
		vs_str_unit[li_idx].s_colname_unit = trim(vs_str_unit[li_idx].s_colname_unit)
		if right(vs_str_unit[li_idx].s_colname_unit,1) <>';' then vs_str_unit[li_idx].s_colname_unit += ';'
		vs_str_unit[li_idx].s_colname_object = trim(vs_str_unit[li_idx].s_colname_object)
		if right(vs_str_unit[li_idx].s_colname_object,1) <>';' then vs_str_unit[li_idx].s_colname_object += ';'
		
		if pos(';'+vs_str_unit[li_idx].s_colname_data,';'+vs_colname+';') > 0 or &
			pos(';'+vs_str_unit[li_idx].s_colname_unit,';'+vs_colname+';') > 0 or &
			pos(';'+vs_str_unit[li_idx].s_colname_object,';'+vs_colname+';') > 0 then
			lc_string.f_stringtoarray( vs_str_unit[li_idx].s_colname_data, ';', lsa_col_datas)
			lc_string.f_stringtoarray( vs_str_unit[li_idx].s_dwo_unit, ';', lsa_dwo_units)
			lc_string.f_stringtoarray( vs_str_unit[li_idx].s_colname_unit, ';', lsa_col_units)
			lc_string.f_stringtoarray( vs_str_unit[li_idx].s_dwo_handing, ';', lsa_dwo_round[])
			
			vs_str_unit[li_idx].s_type = trim(vs_str_unit[li_idx].s_type)
			if right(vs_str_unit[li_idx].s_type,1) <>';' then vs_str_unit[li_idx].s_type += ';'		
			if pos(';'+vs_str_unit[li_idx].s_type,';bc;') > 0 then lb_bc = true
			if pos(';'+vs_str_unit[li_idx].s_type,';amount;') > 0 then lb_amount = true	
		end if
		if lb_amount then
			c_unit.is_table = 'UOM'
			ldw_handle.dynamic f_getparentwindow(lw_parent)
			if vdb_price_data = 0 and vdc_rate = 0 and vdb_qty <> 0 then
				//-- Lấy dw chứa cột đơn giá --//
				ldw_round = lw_parent.dynamic f_get_dw(lsa_dwo_round[2])
				if ldw_round.dataobject = vdw_handle.dataobject then
					ldb_price_data = vdw_handle.getitemnumber(vl_row,lsa_col_datas[2])
				else
					ldb_price_data = ldw_round.getitemnumber(ldw_round.getrow(),lsa_col_datas[2])
				end if
				if isnull(ldb_price_data)  then
					ldb_price_data = 0
				end if
				ldw_object = lw_parent.dynamic f_get_dw(lsa_dwo_units[upperbound(lsa_dwo_units)])
				if ldw_object.getrow() = 0 then return -1
				if ldw_object.dataobject = vdw_handle.dataobject then
					ldc_rate = vdw_handle.getitemnumber( vl_row, lsa_col_units[upperbound(lsa_dwo_units)])
				else
					ldc_rate = ldw_object.getitemnumber( ldw_object.getrow(), lsa_col_units[upperbound(lsa_dwo_units)])
				end if
				ldb_qty = vdb_qty
			elseif vdb_qty = 0 and vdc_rate = 0 then
				//-- Lấy dw chứa cột sl --//
				ldw_round = lw_parent.dynamic f_get_dw(lsa_dwo_round[1])
				if ldw_round.dataobject = vdw_handle.dataobject then
					ldb_qty = vdw_handle.getitemnumber(vl_row,lsa_col_datas[1])
				else
					ldb_qty = ldw_round.getitemnumber(ldw_round.getrow(),lsa_col_datas[1])
				end if
				if isnull(ldb_qty)  then
					ldb_qty = 0
				end if
				ldw_object = lw_parent.dynamic f_get_dw(lsa_dwo_units[upperbound(lsa_dwo_units)])
				if ldw_object.getrow() = 0 then return -1
				if ldw_object.dataobject = vdw_handle.dataobject then
					ldc_rate = vdw_handle.getitemnumber( vl_row, lsa_col_units[upperbound(lsa_dwo_units)])
				else
					ldc_rate = ldw_object.getitemnumber( ldw_object.getrow(), lsa_col_units[upperbound(lsa_dwo_units)])
				end if
				//-- Lấy dw chứa cột đơn giá --//
//				ldw_round = lw_parent.dynamic f_get_dw(lsa_dwo_round[2])
//				if ldw_round.dataobject = vdw_handle.dataobject then
//					ldb_price_data = vdw_handle.getitemnumber(vl_row,lsa_col_datas[2])
//				else
//					ldb_price_data = ldw_round.getitemnumber(ldw_round.getrow(),lsa_col_datas[2])
//				end if
//				if isnull(ldb_price_data)  then
//					ldb_price_data = 0
//				end if
				ldb_price_data = vdb_price_data
			elseif vdb_price_data = 0 and vdb_qty = 0 then
				ldw_object = lw_parent.dynamic f_get_dw(lsa_dwo_units[upperbound(lsa_dwo_units)])
				if ldw_object.getrow() = 0 then return -1
				//-- Lấy dw chứa cột đơn giá --//
				if lsa_dwo_round[2]<> '' then
					ldw_round = lw_parent.dynamic f_get_dw(lsa_dwo_round[2])			
					if ldw_round.dataobject = vdw_handle.dataobject then
						ldb_price_data = vdw_handle.getitemnumber(vl_row,lsa_col_datas[2])
					else
						if ldw_round.getrow() = 0 then return -1
						ldb_price_data = ldw_round.getitemnumber(ldw_round.getrow(),lsa_col_datas[2])
					end if
				end if
				//-- Lấy dw chứa cột sl --//
				if lsa_dwo_round[1] <> '' then
					ldw_round = lw_parent.dynamic f_get_dw(lsa_dwo_round[1])
					if ldw_round.dataobject = vdw_handle.dataobject then
						ldb_qty = vdw_handle.getitemnumber(vl_row,lsa_col_datas[1])
					else
						ldb_qty = ldw_round.getitemnumber(ldw_round.getrow(),lsa_col_datas[1])
					end if
				end if
				if isnull(ldb_price_data) or isnull(ldb_price_data) then
					ldb_price_data = 0
					ldb_qty = 0
				end if
				ldc_rate = vdc_rate
			end if			
			rdba_data[1] = ldb_price_data
			if lsa_dwo_round[2]<> ''  and  lsa_dwo_round[1] <> '' then
				ldb_amount = ldb_qty * ldb_price_data
			else
				ldw_round = lw_parent.dynamic f_get_dw(lsa_dwo_round[3])	
				ldb_amount =  ldw_round.getitemnumber(ldw_round.getrow(),lsa_col_datas[3])
				if isnull(ldb_amount) then ldb_amount = 0
			end if
			if vs_cur_code_amount <> '' then
				ls_cur_code_amount = vs_cur_code_amount
			else
				ls_cur_code_amount = string(this.f_current_dwdata( ldw_handle, lsa_dwo_units[3], lsa_col_units[3],vl_row))
			end if
			ldb_cur_id_amount = c_unit.f_get_id( ls_cur_code_amount)
			ldb_round_id_amount = this.f_get_round_id( ldb_cur_id_amount, 0, 'amount')
			rdba_data[4] = ldb_round_id_amount
			ldb_amount_data = this.f_round( ldw_handle, ldb_round_id_amount, ldb_amount)
			rdba_data[2] = ldb_amount_data
			if lb_bc then
				ldb_exchange = ldb_amount_data * ldc_rate
				ls_cur_code_exchange = string(this.f_current_dwdata( ldw_handle, '', 'BC',vl_row))
				ldb_cur_id_exchange = c_unit.f_get_id( ls_cur_code_exchange)
				ldb_round_id_exchange = this.f_get_round_id( ldb_cur_id_exchange, 0, 'BC')
				ldb_exchange_data = this.f_round( ldw_handle, ldb_round_id_exchange, ldb_exchange)
				rdba_data[3] = ldb_exchange_data
			end if
			rdba_data[5] = ldc_rate
		end if
		return 1
	end if
next
return 1
end function

public function integer f_setitem_rounding (datawindow vdw_handle, s_str_unit vs_str_unit[], string vs_colname, double vdba_data[], string vs_type, string vs_editdata, long vl_row);/***********************************************
Setitem cho các cột làm tròn, qui đổi và chênh lệch làm tròn
hoặc làm tròn giá,thành tiền và qui đổi tiền hạch toán
return 0: không setitem
		 1: setitem thành công
***********************************************/

int						li_idx,li_idx2, li_idx3
boolean				lb_setitem = false
string					lsa_col_datas[],lsa_col_units[],lsa_col_items[],lsa_types[], lsa_dwo_data[], lsa_dwo_unit[], ls_cur_code_exchange,ls_cur_code_amount
double 				ldb_qty, ldb_price, ldb_exchange_data, ldb_cur_id_exchange, ldb_round_id_exchange, ldb_round_id_amount,ldb_cur_id_amount
double				ldb_amount_data
decimal				ldc_rate
c_string				lc_string
c_unit_instance		c_unit
window				lw_parent
t_dw_mpl			ldw_object1,ldw_object2,ldw_object3, ldw_object4,  ldw_handle

vdw_handle.dynamic f_getparentwindow(lw_parent)
for li_idx = 1 to upperbound(vs_str_unit)
	vs_str_unit[li_idx].s_dwo_handing = trim(vs_str_unit[li_idx].s_dwo_handing)
	if right(vs_str_unit[li_idx].s_dwo_handing,1) <> ';' then vs_str_unit[li_idx].s_dwo_handing+=';'
	
	if pos(vs_str_unit[li_idx].s_dwo_handing, vdw_handle.dataobject+';' ) < 1 then continue
	lc_string.f_stringtoarray( vs_str_unit[li_idx].s_colname_data, ';', lsa_col_datas)
	lc_string.f_stringtoarray( vs_str_unit[li_idx].s_dwo_handing, ';', lsa_dwo_data[])	
	lc_string.f_stringtoarray( vs_str_unit[li_idx].s_colname_unit, ';', lsa_col_units)
	lc_string.f_stringtoarray( vs_str_unit[li_idx].s_dwo_unit , ';', lsa_dwo_unit[])
	lc_string.f_stringtoarray( vs_str_unit[li_idx].s_type, ';', lsa_types)
	
	for li_idx2 = 1 to upperbound(lsa_col_datas)
		if lsa_col_datas[li_idx2] = vs_colname then
			lb_setitem = true
			exit
		end if
		if lsa_col_units[li_idx2] = vs_colname then 
			lb_setitem = true		
			exit			
		end if
	next
	if lb_setitem then exit
	lc_string.f_stringtoarray( vs_str_unit[li_idx].s_colname_object, ';', lsa_col_items)
	for li_idx2 = 1 to upperbound(lsa_col_items)
		if lsa_col_items[li_idx2] = vs_colname then
			lb_setitem = true
			exit
		end if
	next
	if lb_setitem then exit
next
ldw_handle =  vdw_handle
if not isvalid(ldw_handle) then
	gf_messagebox('m.c_unit_instance.f_setitem_rounding.01','Thông báo','Cài đặt struct unit không đúng!','exclamation','ok',1)
	return -1
end if
if ldw_handle.rowcount( ) = 0 then
	gf_messagebox('m.c_unit_instance.f_setitem_rounding.02','Thông báo',' Không có dữ liệu!','exclamation','ok',1)
	return -1
end if

if lb_setitem then
	if lower(vs_type) = 'item' then
		if lsa_col_datas[li_idx2] <>"" then ldw_handle.setitem(vl_row, lsa_col_datas[li_idx2],vdba_data[1])
		if vs_str_unit[li_idx].s_colname_convert <> '' then //-- chưa dùng --//
			ldw_handle.setitem(vl_row, vs_str_unit[li_idx].s_colname_convert,vdba_data[2])
			ldw_handle.setitem(vl_row, vs_str_unit[li_idx].s_colname_diff,vdba_data[3])
		end if
	elseif lower(vs_type) = 'cur' then
		if upperbound(vdba_data) > 0 then 
			if lsa_dwo_data[2] = lsa_dwo_data[3] and  lsa_dwo_data[3] =  lsa_dwo_data[1] and  lsa_dwo_data[3] =  lsa_dwo_data[4] then
				ldw_object2 = lw_parent.dynamic f_get_dw(lsa_dwo_data[2])
				ldw_object3 = ldw_object2
				ldw_object1 = ldw_object2
				ldw_object4 = ldw_object2
			else
				if lsa_dwo_data[1] <> '' then ldw_object1 = lw_parent.dynamic f_get_dw(lsa_dwo_data[1])
				if lsa_dwo_data[2] <> '' then ldw_object2 = lw_parent.dynamic f_get_dw(lsa_dwo_data[2])
				if lsa_dwo_data[3] <> '' then ldw_object3 = lw_parent.dynamic f_get_dw(lsa_dwo_data[3])		
				if lsa_dwo_data[4] <> '' then ldw_object4 = lw_parent.dynamic f_get_dw(lsa_dwo_data[4])
			end if
			if ( lsa_dwo_data[2] <> '' and not isvalid(ldw_object2) ) &
				or ( lsa_dwo_data[3] <> '' and  not isvalid(ldw_object3)) &
				or ( lsa_dwo_data[1] <> '' and not isvalid(ldw_object1)) &
				or ( lsa_dwo_data[4] <> '' and not isvalid(ldw_object4) ) then
					gf_messagebox('m.c_unit_instance.f_setitem_rounding.01','Thông báo','Cài đặt struct unit không đúng!','exclamation','ok',1)
					return -1
			end if
			if   isvalid(ldw_object1) then
				if  ldw_object1.rowcount( ) = 0 then
					gf_messagebox('m.c_unit_instance.f_setitem_rounding.02','Thông báo',' Không có dữ liệu!','exclamation','ok',1)
					return -1
				end if
			end if			
			if   isvalid(ldw_object2) then
				if  ldw_object2.rowcount( ) = 0 then
					gf_messagebox('m.c_unit_instance.f_setitem_rounding.02','Thông báo',' Không có dữ liệu!','exclamation','ok',1)
					return -1
				end if
			end if
			if   isvalid(ldw_object3) then
				if  ldw_object3.rowcount( ) = 0 then
					gf_messagebox('m.c_unit_instance.f_setitem_rounding.02','Thông báo',' Không có dữ liệu!','exclamation','ok',1)
					return -1
				end if
			end if
			if   isvalid(ldw_object4) then
				if  ldw_object4.rowcount( ) = 0 then
					gf_messagebox('m.c_unit_instance.f_setitem_rounding.02','Thông báo',' Không có dữ liệu!','exclamation','ok',1)
					return -1
				end if
			end if			

			
			if vdba_data[1] >= 0 then		
				if isnull(vdba_data[2]) then
					if lsa_col_datas[3] <> '' then ldw_object3.setitem(vl_row, lsa_col_datas[3],vdba_data[1])
				else
					if  lsa_col_datas[2] <>'' then ldw_object2.setitem(vl_row, lsa_col_datas[2],vdba_data[1])
					if  lsa_col_datas[3] <>'' then ldw_object3.setitem(vl_row, lsa_col_datas[3],vdba_data[2])
				end if
			end if			
			
			if upper(lsa_col_datas[4]) <> 'BC' then		
				if  lsa_col_datas[4] <>'' then ldw_object4.setitem(vl_row, lsa_col_datas[4],vdba_data[3])
			end if
			
			//-- khi thay đổi tỷ giá hoặc loại tiền trên master , phải cập nhật tất cả record khác--//
			if ldw_object3 <> ldw_handle then
				if lsa_col_datas[5] = vs_colname then
					ldc_rate = dec(vs_editdata)
				else
					if  lsa_col_datas[5] <> '' then ldc_rate = ldw_handle.getitemnumber(vl_row, lsa_col_datas[5])
				end if
				//-- lấy id làm tròn amount -//
				ls_cur_code_amount = string(this.f_current_dwdata( ldw_handle, lsa_dwo_unit[3], lsa_col_units[3]))
				ldb_cur_id_amount = c_unit.f_get_id( ls_cur_code_amount)
				ldb_round_id_amount = this.f_get_round_id( ldb_cur_id_amount, 0, 'amount')
				//-- lấy id làm tròn bc -//
				ls_cur_code_exchange = string(this.f_current_dwdata( ldw_handle, '', 'BC'))
				ldb_cur_id_exchange = c_unit.f_get_id( ls_cur_code_exchange)
				ldb_round_id_exchange = this.f_get_round_id( ldb_cur_id_exchange, 0, 'BC')
				
				if lsa_col_datas[1] <> '' and  lsa_col_datas[2] <> '' then
					ldw_handle = ldw_object1
				else
					ldw_handle = ldw_object3
				end if
				FOR li_idx3 = 1 to ldw_handle.rowcount( )
					if lsa_col_datas[1] <> '' then ldb_qty = ldw_handle.getitemnumber( li_idx3, lsa_col_datas[1])
					if  lsa_col_datas[2] <> '' then ldb_price = ldw_handle.getitemnumber( li_idx3, lsa_col_datas[2])
					if isnull(ldb_qty) then ldb_qty = 0
					if li_idx3 <> vl_row then
						if  lsa_col_datas[2] <> '' and  lsa_col_datas[1] <> '' then 
							ldw_handle.setitem(li_idx3, lsa_col_datas[2],ldb_price) //-- làm tròn đơn giá
							ldb_amount_data = ldb_qty * ldb_price
						else
							ldb_amount_data = ldw_handle.getitemnumber(li_idx3, lsa_col_datas[3])
						end if
						ldb_amount_data = this.f_round( ldw_handle, ldb_round_id_amount, ldb_amount_data)
						ldw_handle.setitem(li_idx3, lsa_col_datas[3], ldb_amount_data)	
						if upper(lsa_col_datas[4]) <> 'BC' then
							ldb_exchange_data = this.f_round( ldw_handle, ldb_round_id_exchange, ldb_amount_data * ldc_rate)
							ldb_exchange_data = this.f_round( ldw_handle, ldb_round_id_exchange, ldb_exchange_data)
							ldw_object4.setitem(li_idx3, lsa_col_datas[4],ldb_exchange_data)
						end if
					end if
				NEXT
			end if
		end if
	end if
	
	if pos(vs_str_unit[li_idx].s_colname_data+';',vs_colname+';') = 0 then
		if pos(vs_str_unit[li_idx].s_colname_unit+ ';',vs_colname+';') > 0 or pos(vs_str_unit[li_idx].s_colname_object+ ';',vs_colname+';') > 0 then
			vdw_handle.setitem(vl_row, vs_colname,vs_editdata)
		end if
	end if
	return 1
else
	return 0
end if
end function

public function double f_round (ref t_transaction rt_transaction, double vdb_round_id, double vdb_editdata);/************************
Chức năng: làm tròn editdata 
return 0: không làm tròn
		 
************************/
double				ldb_data

if vdb_round_id > 0 then
	ldb_data = this.f_db_round( vdb_round_id, vdb_editdata, rt_transaction)
	return ldb_data
end if
setnull(ldb_data)
return ldb_data
end function

public function integer f_get_exchange_account_info (double vdb_curr_id, ref double rdba_exchange_account[], ref string rs_exchange_rate_method, ref string rs_trans_text);
if vdb_curr_id = 0 or isnull(vdb_curr_id) then return 0

select realized_loss_account, realized_profit_account, unrealized_loss_account, unrealized_loss_account, exrate_method
into :rdba_exchange_account[1], :rdba_exchange_account[2], :rdba_exchange_account[3], :rdba_exchange_account[4], :rs_exchange_rate_method
from uom
where uom.id = :vdb_curr_id using sqlca;

if sqlca.sqlcode <> 0 then
	return -1
end if
return 1
end function

public function integer f_get_data_4_rounding (s_str_unit vsa_str_unit[], datawindow vdw_handle, string vs_colname, string vs_editdata, ref any raa_data[], long vl_handle_row);/**********************************************
kiểm tra vs_colname là cột chứa data cần làm tròn hoặc
chứa đơn vị hoặc chứa mã hàng
return ll_idx:	ok (ll_idx cho biết đang ở struct của str_unit 
	để kiểm tra xem struct đó có cần setitem vào cột colname_conver hay không)
return 0:	ko thành công
	raa_data[1]: chứa data cần làm tròn
	raa_data[2]: chứa mã đơn vị(unit_code)
	raa_data[3]: chứa mã hàng(item_code)
	raa_data[4]: chứa loại làm tròn
**********************************************/
string					lsa_colname_datas[],lsa_colname_units[],lsa_colname_items[]
string					lsa_dwo_units[],lsa_dwo_items[],ls_types[], lsa_dwo_handle[]
any					laa_data[],laa_rtn
long					ll_rtn,ll_idx,ll_idx2,ll_idx_dwo
s_str_unit			lsa_str_unit[]
c_string				lc_string

lsa_str_unit = vsa_str_unit
ll_rtn = upperbound(lsa_str_unit[])
if ll_rtn > 0 then
	for ll_idx = 1 to ll_rtn
		//--làm tròn khi giá trị thay đổi--//
		//if vdw_handle.dataobject = lsa_str_unit[ll_idx].s_dwo_handing then
		if pos(lsa_str_unit[ll_idx].s_dwo_handing, vdw_handle.dataobject+';' ) > 0 then
			lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_colname_data, ';', lsa_colname_datas)
			lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_dwo_handing, ';', lsa_dwo_handle[])
			lsa_str_unit[ll_idx].s_colname_data = trim( lsa_str_unit[ll_idx].s_colname_data)
			for ll_idx2 = 1 to upperbound(lsa_colname_datas)				
				if lsa_colname_datas[ll_idx2] = vs_colname then
					lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_dwo_unit, ';', lsa_dwo_units)
					lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_colname_unit, ';', lsa_colname_units)
					lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_type, ';', ls_types)
					
					laa_data[1] = vs_editdata
					laa_rtn = f_current_dwdata(vdw_handle,lsa_dwo_units[ll_idx2],lsa_colname_units[ll_idx2],vl_handle_row)
					if isnull(laa_rtn) then 
						if ll_idx = ll_rtn then return 0
						continue
					end if
					laa_data[2] = laa_rtn
					if lower(ls_types[ll_idx2]) = 'item' then
						lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_dwo_object, ';', lsa_dwo_items)
						lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_colname_object, ';', lsa_colname_items)
						laa_rtn = f_current_dwdata(vdw_handle,lsa_dwo_items[ll_idx2],lsa_colname_items[ll_idx2],vl_handle_row)
						if isnull(laa_rtn) then return 0
						laa_data[3] = laa_rtn
					else //--Loại price và amound không cần mã hàng--//
						laa_data[3] = ''
					end if
					laa_data[4] = ls_types[ll_idx2]
					raa_data[] = laa_data[]
					return ll_idx
				end if
			next				
		end if
		//--làm tròn khi đơn vị thay đổi--//
		lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_dwo_unit, ';', lsa_dwo_units)
		for ll_idx_dwo = 1 to upperbound(lsa_dwo_units)
			//--kiểm tra dw đang edit có phải là dw chứa cột đơn vị không--//
			if vdw_handle.dataobject = lsa_dwo_units[ll_idx_dwo] then
				lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_colname_unit, ';', lsa_colname_units)
//				for ll_idx2 = 1 to upperbound(lsa_colname_units)
					if lsa_colname_units[ll_idx_dwo] = vs_colname then
						lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_colname_data, ';', lsa_colname_datas)
						lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_dwo_handing, ';', lsa_dwo_handle[])
						lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_type, ';', ls_types)
						if lower(ls_types[ll_idx_dwo]) = 'ex' or (lower(ls_types[ll_idx_dwo]) = '""' and ll_idx_dwo = upperbound(lsa_dwo_units)) then
							laa_data[1] = vs_editdata
							laa_data[2] = ''
						else
							laa_rtn = f_current_dwdata(vdw_handle,lsa_dwo_handle[ll_idx_dwo],lsa_colname_datas[ll_idx_dwo],vl_handle_row)
							if isnull(laa_rtn) or double(laa_rtn) = 0  then return 0
							laa_data[1] = laa_rtn
							laa_data[2] = vs_editdata
						end if
						if lower(ls_types[ll_idx_dwo]) = 'item' then
							lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_dwo_object, ';', lsa_dwo_items)
							lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_colname_object, ';', lsa_colname_items)
							laa_rtn =f_current_dwdata(vdw_handle,lsa_dwo_items[ll_idx_dwo],lsa_colname_items[ll_idx_dwo],vl_handle_row)
							if isnull(laa_rtn) then return 0
							laa_data[3] = laa_rtn
//						elseif lower(ls_types[ll_idx2]) = 'ex' then
						else //--Loại price và amound không cần mã hàng--//
							laa_data[3] = ''
						end if
						if lower(ls_types[ll_idx_dwo]) = '""' and ll_idx_dwo = upperbound(lsa_dwo_units) then
							laa_data[4] = 'ex'
						else
							laa_data[4] = ls_types[ll_idx_dwo]
						end if
						raa_data[] = laa_data[]
						return ll_idx
					end if
//				next
			end if
		next
		//--làm tròn khi mã hàng bị thay đổi--//
		lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_dwo_object, ';', lsa_dwo_items)
		for ll_idx_dwo = 1 to upperbound(lsa_dwo_items)
			//--kiểm tra dw đang edit có phải là dw chứa cột mã hàng không--//
			if vdw_handle.dataobject = lsa_dwo_items[ll_idx_dwo] then
				lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_colname_object, ';', lsa_colname_items)
				for ll_idx2 = 1 to upperbound(lsa_colname_items)
					if lsa_colname_items[ll_idx2] = vs_colname then
						lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_colname_data, ';', lsa_colname_datas)
						lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_dwo_unit, ';', lsa_dwo_units)
						lc_string.f_stringtoarray( lsa_str_unit[ll_idx].s_colname_unit, ';', lsa_colname_units)
						laa_rtn = f_current_dwdata(vdw_handle,lsa_dwo_items[ll_idx2],lsa_colname_datas[ll_idx2],vl_handle_row)
						if isnull(laa_rtn) then return 0
						laa_data[1] = laa_rtn
						laa_rtn = f_current_dwdata(vdw_handle,lsa_dwo_units[ll_idx2],lsa_colname_units[ll_idx2],vl_handle_row)
						if isnull(laa_rtn) then return 0
						laa_data[2] = laa_rtn
						laa_data[3] = vs_editdata
						laa_data[4] = 'item'
						raa_data[] = laa_data[]
						return ll_idx
					end if
				next
			end if
		next
	next
end if
return 0
end function

public function any f_current_dwdata (datawindow vdw_handle, string vs_dwo, string vs_colname, long vl_handle_row);/**********************
Lấy data khi biết tên cột
return la_rtn: giá trị của cột
*********************/
window				lw_parent
t_dw_mpl			ldw_object

string					ls_unit_code
any					la_rtn

if upper(vs_colname) = 'BC' then
	 select UOM.CODE into :ls_unit_code 
    from UOM join UNIT_CLASS on UNIT_CLASS.ID = UOM.CLASS_ID 
                                                and UNIT_CLASS.CURRENCY_YN = 'Y' 
                                                and UOM.BASE_YN = 'Y' USING SQLCA;
    if SQLCA.sqlcode = 0 then
        la_rtn = ls_unit_code
    elseif SQLCA.sqlcode = 100 then
        //--chưa có đồng tiền hạch toán--//
        messagebox('Lỗi','c_unit_instance.f_current_dwdata(line:19)')
        return la_rtn
    else
        messagebox('Lỗi','c_unit_instance.f_current_dwdata(line:19)')
        return la_rtn
    end if
else
	
	if vdw_handle.dataobject = vs_dwo then
		la_rtn = vdw_handle.dynamic f_getitemany(vl_handle_row,vs_colname)
	else
		vdw_handle.dynamic f_getparentwindow(lw_parent)
		ldw_object = lw_parent.dynamic f_get_dw(vs_dwo)
		if not isnull(ldw_object) then
			if ldw_object.getrow( ) = 0 then 
				setnull(la_rtn)
				return la_rtn
			end if
			la_rtn = ldw_object.dynamic f_getitemany(ldw_object.getrow( ) ,vs_colname)
		end if
	end if
end if
return la_rtn
end function

public function double f_get_round_diff (double vdb_item_id);/**********************************************************************************
Chức năng: Lấy số chênh lệch làm tròn khi quy đổi đơn vị giao dịch sang đơn vị tốn kho, khi sửa ghi sồ (UNPOST)
 				 # Chênh lệch =  Số lược thực tế theo SKU chưa làm tròn - SL SKU đã làm tròn 
				 # Chênh lệch âm: thể hiện tồn kho hiện tại > hơn thực tế
				 # Chênh lệch dương: thể hiện tồn kho hiện tại < hơn thực tế
------------------------------------------------------------------------------------------------------------------------------------
Tham số: vdb_item_id: ID của mặt hàng
------------------ 
Return: số chênh lệch hiện tại của mã hàng.
==============================================================*/
double			ldb_round_diff

if isnull(vdb_item_id) or vdb_item_id = 0 then return 0

select round_diff into :ldb_round_diff from item where object_ref_id = :vdb_item_id using sqlca;
 
if sqlca.sqlcode = 0 then
	return ldb_round_diff
else
	return 0
end if
end function

public function double f_get_unit_class_id_ex (string vs_unit_code, ref t_transaction rt_transaction);/*****************************************
Lấy lớp đơn vị class_id khi biết mã đơn vị unit_code
return -1 lỗi
******************************************/
double				ldb_class_id

select class_id into :ldb_class_id
from uom
where code = :vs_unit_code using rt_transaction;
if rt_transaction.sqlcode <> 0 then
	messagebox('lỗi','c_unit_instance.f_get_unit_class_id(line:10)')
	return -1
end if
if ldb_class_id >= 0 then
	return ldb_class_id
else
	return -1
end if

end function

public function double f_get_unit_class_id_ex (double vdb_unit_id, ref t_transaction rt_transaction);/*****************************************
Lấy lớp đơn vị class_id khi biết mã đơn vị unit_id
return -1 lỗi
******************************************/
double				ldb_class_id

select class_id into :ldb_class_id
from uom
where ID = :vdb_unit_id using rt_transaction;
if rt_transaction.sqlcode <> 0 then
	messagebox('lỗi','c_unit_instance.f_get_unit_class_id(line:10)')
	return -1
end if
if ldb_class_id >= 0 then
	return ldb_class_id
else
	return -1
end if

end function

public function integer f_get_unit_standard_ex (ref string rs_unit_code, ref double rdb_unit_id, double vdb_class_id, ref t_transaction rt_transaction);/*******************************************************
Lấy code và unit_id của đơn vị chuẩn trong cùng 1 lớp đơn vị class_id
return 	-1 lỗi
			1	thành công
*******************************************************/
double				ldb_unit_id
string					ls_unit_code

if vdb_class_id = -1 then return -1
select id,code into :ldb_unit_id,:ls_unit_code
from uom
where class_id = :vdb_class_id and base_yn = 'Y' using rt_transaction;
if rt_transaction.sqlcode <> 0 then
	messagebox('lỗi','c_unit_instance.f_get_unit_standard(line:15)')
	return -1
end if

rs_unit_code = ls_unit_code
rdb_unit_id = ldb_unit_id
return 1
end function

public function integer f_get_base_cur_ex (ref double rdb_id, ref string rs_code, ref string rs_name, t_transaction rt_transaction);
select uom.id, uom.code, uom.name into :rdb_id , :rs_code , :rs_name 
from uom left join unit_class uc on uc.id = uom.class_id 
where upper(uom.base_yn) = 'Y' and upper(uc.CURRENCY_YN) = 'Y' using rt_transaction;
if rt_transaction.sqlcode = 0 then
	return 1
else
	return -1
end if
end function

public function double f_get_round_id_ex (double vdb_unit_id, double vdb_item_id, string vs_type, ref t_transaction rt_transaction);/******************************
Lấy round_id khi có unit_id và item_id
---------------------------------------------------------------
Tham số:	- vdb_unit_id: ID của đơn vị cần lấy phương thức làm tròn
				- vdb_item_id: ID của hàng hóa, sản phẩm (trường hợp là vdb_unit_id tiền tệ thì vdb_item_id = 0
				- vs_type: là 'item' - hàng hóa ,'price' - đơn giá  ,'amount' - thành tiền, 'bc' - tiền hạch toán
return round_id: thành công
					0: không có round_id
					-1: lỗi
*******************************/
double				ldb_round_id
int						li_cnt
b_obj_instantiate		lc_unit


if lower(vs_type) = 'bom' then
	//--lấy round_id từ bảng item--//
	select count(object.id) into :li_cnt
	from item join object on item.object_ref_id = object.id 
	where object.id = :vdb_item_id and item.stock_uom = :vdb_unit_id using rt_transaction;
	if li_cnt=1 then
		select item.round_id into:ldb_round_id
		from item join object on item.object_ref_id = object.id 
		where object.id = :vdb_item_id and item.stock_uom = :vdb_unit_id using rt_transaction;
		return ldb_round_id
	else
		gf_messagebox('m.c_unit_instance.f_get_round_id.01','Thông báo','Mã hàng sau chưa cài đặt phương thức làm tròn cho đơn vị tồn kho:@'+lc_unit.f_get_object_code_ex(vdb_item_id, rt_transaction),'exclamation','ok',1)
		return -1
	end if
elseif lower(vs_type) = 'item' then
	//--lấy round_id từ bảng item--//
	select item.round_id into:ldb_round_id
	from item left join object on object.id = item.object_ref_id
	where object.id = :vdb_item_id and item.stock_uom = :vdb_unit_id using rt_transaction;
	if rt_transaction.sqlcode = 0 then
		if isnull(ldb_round_id) or ldb_round_id = 0 then
			//--Lấy round_id trường hợp qui đổi đơn vị cùng lớp--//
			select uom_round_id into :ldb_round_id
			from UOM
			where ID = :vdb_unit_id using rt_transaction;
			if rt_transaction.sqlcode = 0 then
				if isnull(ldb_round_id) or ldb_round_id = 0 then
					gf_messagebox('m.c_unit_instance.f_get_round_id.04','Thông báo','Chưa cài đặt phương thức làm tròn cho đơn vị tính:@'+ lc_unit.f_get_object_code_ex(vdb_unit_id, rt_transaction) ,'exclamation','ok',1)
					return -1
				end if								
				return ldb_round_id
			elseif rt_transaction.sqlcode = 100 then
				gf_messagebox('m.c_unit_instance.f_get_round_id.05','Thông báo','Chưa cài đặt phương thức làm tròn cho đơn vị tính:@'+ lc_unit.f_get_object_code_ex(vdb_unit_id, rt_transaction)   ,'exclamation','ok',1)
				return -1
			else
				messagebox('Lỗi','c_unit_instance.f_get_round_id(line:24)')
				return -1
			end if
		end if
		return ldb_round_id
	elseif rt_transaction.sqlcode = 100 then
		//--Lấy round_id trường hợp qui đổi đơn vị khác lớp: từ đơn vị khác ra đơn vị tồn kho --//
		select round_id into :ldb_round_id
		from unit_conversion
		where FROM_UNIT_ID = :vdb_unit_id and item_id = :vdb_item_id using rt_transaction;
		if rt_transaction.sqlcode =0 then
			if isnull(ldb_round_id) or ldb_round_id = 0 then
				gf_messagebox('m.c_unit_instance.f_get_round_id.02','Thông báo','Mã hàng sau chưa cài đặt phương thức làm tròn cho đơn vị quy đổi:@'+lc_unit.f_get_object_code_ex(vdb_item_id, rt_transaction)+'-'+ lc_unit.f_get_object_code_ex(vdb_unit_id, rt_transaction) ,'exclamation','ok',1)
				return -1
			end if			
			return ldb_round_id
		elseif rt_transaction.sqlcode = 100 then
			//--Lấy round_id trường hợp qui đổi đơn vị khác lớp: từ đơn vị tồn kho ra đơn vị khác --//
			select round_id into :ldb_round_id
			from unit_conversion
			where TO_UNIT_ID = :vdb_unit_id and item_id = :vdb_item_id using rt_transaction;
			if rt_transaction.sqlcode =0 then
				if isnull(ldb_round_id) or ldb_round_id = 0 then
					gf_messagebox('m.c_unit_instance.f_get_round_id.03','Thông báo','Mã hàng sau chưa cài đặt phương thức làm tròn cho đơn vị quy đổi:@'+lc_unit.f_get_object_code_ex(vdb_item_id, rt_transaction)+'-'+ lc_unit.f_get_object_code_ex(vdb_unit_id, rt_transaction) ,'exclamation','ok',1)
					return -1
				end if			
				return ldb_round_id			
			elseif rt_transaction.sqlcode = 100 then
				//--Lấy round_id trường hợp qui đổi đơn vị cùng lớp--//
				select round_id into :ldb_round_id
				from unit_conversion
				where FROM_UNIT_ID = :vdb_unit_id and item_id = :vdb_item_id using rt_transaction;
				if rt_transaction.sqlcode = 0 then
					if isnull(ldb_round_id) or ldb_round_id = 0 then
						gf_messagebox('m.c_unit_instance.f_get_round_id.04','Thông báo','Mã hàng sau chưa cài đặt phương thức làm tròn cho đơn vị quy đổi:@'+lc_unit.f_get_object_code_ex(vdb_item_id, rt_transaction)+'-'+ lc_unit.f_get_object_code_ex(vdb_unit_id, rt_transaction) ,'exclamation','ok',1)
						return -1
					end if								
					return ldb_round_id
				elseif rt_transaction.sqlcode = 100 then
					//--Lấy round_id trường hợp qui đổi đơn vị cùng lớp--//
					select uom_round_id into :ldb_round_id
					from UOM
					where ID = :vdb_unit_id using rt_transaction;
					if rt_transaction.sqlcode = 0 then
						if isnull(ldb_round_id) or ldb_round_id = 0 then
							gf_messagebox('m.c_unit_instance.f_get_round_id.04','Thông báo','Chưa cài đặt phương thức làm tròn cho đơn vị tính:@'+ lc_unit.f_get_object_code_ex(vdb_unit_id, rt_transaction) ,'exclamation','ok',1)
							return -1
						end if								
						return ldb_round_id
					elseif rt_transaction.sqlcode = 100 then
						gf_messagebox('m.c_unit_instance.f_get_round_id.05','Thông báo','Chưa cài đặt phương thức làm tròn cho đơn vị tính:@'+ lc_unit.f_get_object_code_ex(vdb_unit_id, rt_transaction)   ,'exclamation','ok',1)
						return -1
					else
						messagebox('Lỗi','c_unit_instance.f_get_round_id(line:24)')
						return -1
					end if
					gf_messagebox('m.c_unit_instance.f_get_round_id.06','Thông báo','Mã hàng '+lc_unit.f_get_object_code_ex(vdb_item_id, rt_transaction)+' chưa cài đặt quy đổi cho đơn vị '+ lc_unit.f_get_object_code_ex(vdb_unit_id, rt_transaction)   ,'exclamation','ok',1)
					return -1
				else
					messagebox('Lỗi','c_unit_instance.f_get_round_id(line:24)')
					return -1
				end if
			end if
		else
			messagebox('Lỗi','c_unit_instance.f_get_round_id(line:28)')
			return -1
		end if
	else
		messagebox('Lỗi','c_unit_instance.f_get_round_id(line:32)')
		return -1
	end if
elseif lower(vs_type) = 'price' then
	select UOM.PRICE_ROUND_ID into :ldb_round_id from UOM where UOM.ID = :vdb_unit_id USING rt_transaction;
	if rt_transaction.sqlcode = 0 then
		if isnull(ldb_round_id) or ldb_round_id = 0 then
			gf_messagebox('m.c_unit_instance.f_get_round_id.06','Thông báo','Loại tiền sau chưa cài đặt phương thức làm tròn:@'+ lc_unit.f_get_object_code_ex(vdb_unit_id, rt_transaction) ,'exclamation','ok',1)
			return -1		
		end if
		return ldb_round_id
	elseif rt_transaction.sqlcode = 100 then
		//--chưa cài đặt làm tròn giá--//
		gf_messagebox('m.c_unit_instance.f_get_round_id.07','Thông báo','Loại tiền sau chưa cài đặt phương thức làm tròn:@'+ lc_unit.f_get_object_code_ex(vdb_unit_id, rt_transaction) ,'exclamation','ok',1)
		return -1
	else
		messagebox('Lỗi','c_unit_instance.f_get_round_id(line:54)')
		return -1
	end if
elseif lower(vs_type) = 'amount' then
	select UOM.AMOUNT_ROUND_ID into :ldb_round_id from UOM where UOM.ID = :vdb_unit_id USING rt_transaction;
	if rt_transaction.sqlcode = 0 then
		if isnull(ldb_round_id) or ldb_round_id = 0 then
			gf_messagebox('m.c_unit_instance.f_get_round_id.08','Thông báo','Loại tiền sau chưa cài đặt phương thức làm tròn:@'+ lc_unit.f_get_object_code_ex(vdb_unit_id, rt_transaction) ,'exclamation','ok',1)
			return -1		
		end if		
		return ldb_round_id
	elseif rt_transaction.sqlcode = 100 then
		//--chưa cài đặt làm tròn thành tiền hoặc đồng tiền hạch toán--//
		gf_messagebox('m.c_unit_instance.f_get_round_id.09','Thông báo','Chưa chọn loại tiền giao dịch','exclamation','ok',1)
		return -1
	else
		messagebox('Lỗi','c_unit_instance.f_get_round_id(line:66)')
		return -1
	end if
elseif lower(vs_type) = 'bc' then
	select uom.amount_round_id into :ldb_round_id from uom left join unit_class on uom.class_id = unit_class.id
	where unit_class.currency_yn = 'Y' and uom.base_yn = 'Y' USING rt_transaction;
	if rt_transaction.sqlcode = 0 then
		if isnull(ldb_round_id) or ldb_round_id = 0 then
			gf_messagebox('m.c_unit_instance.f_get_round_id.10','Thông báo','Loại tiền sau chưa cài đặt phương thức làm tròn:@'+ lc_unit.f_get_object_code_ex(vdb_unit_id, rt_transaction) ,'exclamation','ok',1)
			return -1		
		end if		
		return ldb_round_id
	elseif rt_transaction.sqlcode = 100 then
		//--chưa cài đặt làm tròn thành tiền hoặc đồng tiền hạch toán--//
		gf_messagebox('m.c_unit_instance.f_get_round_id.11','Thông báo','Chưa chọn loại tiền giao dịch','exclamation','ok',1)
		return -1
	else
		messagebox('Lỗi','c_unit_instance.f_get_round_id(line:78)')
		return -1
	end if
elseif lower(vs_type) = 'account' then
	select ROUNDING.ID into :ldb_round_id from ROUNDING where lower(ROUNDING.TYPE) = 'standard' and rownum < 2 using rt_transaction;
	if isnull(ldb_round_id) then ldb_round_id = 0
	return ldb_round_id
end if
return 0
end function

public function double f_get_curr_id (string vs_code, t_transaction rt_transaction);double  ldb_id

select uom.id into :ldb_id 
from uom 
where upper(uom.code) = upper(:vs_code) using rt_transaction;

if rt_transaction.sqlcode = 0 then
	return ldb_id
else
	return -1
end if
end function

public function decimal f_get_exchange_rate (double vdb_curr_id, date vd_trans_date, ref t_transaction rt_transaction);dec			ldc_exrate
int				li_cnt

select count(id) into :li_cnt
from exchange_rate
where id = :vdb_curr_id
and  branch_id = :gdb_branch
and trans_date = ( select max(u.trans_date) from exchange_rate u where id = :vdb_curr_id and u.branch_id = :gdb_branch and u.trans_date <= trunc(sysdate))
using rt_transaction;

if li_cnt = 1 then
	select buy_rate into :ldc_exrate
	from exchange_rate
	where id = :vdb_curr_id
	and  branch_id = :gdb_branch
	and trans_date = ( select max(u.trans_date) from exchange_rate u where id = :vdb_curr_id and u.branch_id = :gdb_branch and u.trans_date <= trunc(sysdate))
	using rt_transaction;	
end if

return ldc_exrate
end function

public function double f_round_ex (ref t_transaction rt_transaction, double vdb_round_id, double vdb_editdata);/************************
Chức năng: làm tròn editdata 
return 0: không làm tròn
		 
************************/
double				ldb_data
int						li_digit
string					ls_type
if vdb_round_id > 0 then
	SELECT ROUNDING.TYPE, NVL(DECIMAL_DIGIT,0) 
			into :ls_type, :li_digit
             FROM ROUNDING
            WHERE ROUNDING.ID = :vdb_round_id using rt_transaction;
	if ls_type = 'standard' then
		ldb_data = round(vdb_editdata, li_digit)
	elseif ls_type = 'down' then
	elseif ls_type = 'up' then
	elseif ls_type = 'special' then
	end if

	return ldb_data
end if
setnull(ldb_data)
return ldb_data
end function

on c_unit_instance.create
call super::create
end on

on c_unit_instance.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'uom'
end event

