$PBExportHeader$b_inventory.sru
forward
global type b_inventory from b_obj_instantiate
end type
end forward

global type b_inventory from b_obj_instantiate
end type

forward prototypes
public function integer f_get_counting_lock (double vdb_doc_id, double vdb_item_id, double vdb_wh_id, ref string rs_recv_yn[], ref string rs_issue_yn[], ref date rd_doc_date[], ref string rs_doc_code[])
public function boolean f_is_counting_locked (double vdb_doc_id, double vdb_item_id, double vdb_wh_id, string vs_trans_type, date vd_trans_date)
public function string f_get_related_doc_qty_yn (double vdb_doc_id)
end prototypes

public function integer f_get_counting_lock (double vdb_doc_id, double vdb_item_id, double vdb_wh_id, ref string rs_recv_yn[], ref string rs_issue_yn[], ref date rd_doc_date[], ref string rs_doc_code[]);t_ds_db			lds_counting_info
int					li_rtn, li_row
string				ls_tmp

lds_counting_info = create t_ds_db
lds_counting_info.dataobject = 'ds_get_counting_info'
lds_counting_info.f_settransobject(sqlca)
li_rtn = lds_counting_info.retrieve(vdb_item_id, vdb_wh_id , vdb_doc_id)
FOR li_row = 1 to li_rtn
	ls_tmp = lds_counting_info.getitemstring( li_row, 'lock_rec_yn')
	if isnull(ls_tmp) then ls_tmp ='N'
	rs_recv_yn[li_row] = ls_tmp
	ls_tmp = lds_counting_info.getitemstring( li_row, 'lock_issue_yn')
	if isnull(ls_tmp) then ls_tmp ='N'
	rs_issue_yn[li_row] = ls_tmp
	rd_doc_date[li_row] = date(lds_counting_info.getitemdatetime( li_row, 'document_date'))
	ls_tmp = lds_counting_info.getitemstring( li_row, 'document_code')
	if isnull(ls_tmp) then ls_tmp =''
	rs_doc_code[li_row] =  ls_tmp
NEXT
return li_rtn
end function

public function boolean f_is_counting_locked (double vdb_doc_id, double vdb_item_id, double vdb_wh_id, string vs_trans_type, date vd_trans_date);
int					li_rtn, li_idx
string				ls_doc_code[], ls_lock_rec[], ls_lock_issue[]
date				ld_doc_date[]

li_rtn = this.f_get_counting_lock( vdb_doc_id, vdb_item_id, vdb_wh_id, ls_lock_rec[], ls_lock_issue[], ld_doc_date[], ls_doc_code[])

FOR li_idx = 1 to li_rtn
	if lower(vs_trans_type) = 'in' then
		if vd_trans_date <= ld_doc_date[li_idx] then
			gf_messagebox('m.b_obj_instantiate.f_is_counting_locked.01','Thông báo','Mã hàng đang kiểm kê, không được nhập kho bằng hoặc trước ngày chốt kiểm kê:@'+string(ld_doc_date[li_idx]),'stop','ok',1) 		
			return true 
		elseif ls_lock_rec[li_idx] = 'Y' then
			gf_messagebox('m.b_obj_instantiate.f_is_counting_locked.02','Thông báo','Mã hàng đang kiểm kê, khoá không cho nhập kho, số phiếu kiểm kê:@'+string(ls_doc_code[li_idx]),'stop','ok',1) 		
			return true 
		end if
	else
		if vd_trans_date <= ld_doc_date[li_idx] then
			gf_messagebox('m.b_obj_instantiate.f_is_counting_locked.03','Thông báo','Mã hàng đang kiểm kê, không được xuất kho bằng hoặc trước ngày chốt kiểm kê:@'+string(ld_doc_date[li_idx]),'stop','ok',1) 		
			return true 
		elseif ls_lock_issue[li_idx] = 'Y' then
			gf_messagebox('m.b_obj_instantiate.f_is_counting_locked.04','Thông báo','Mã hàng đang kiểm kê, khoá không cho xuất kho, số phiếu kiểm kê:@'+string(ls_doc_code[li_idx]),'stop','ok',1) 		
			return true 
		end if		
	end if
NEXT
return false
end function

public function string f_get_related_doc_qty_yn (double vdb_doc_id);int		li_cnt

select count(t.f_doc_id) into :li_cnt
 from matching t 
    join document t1 on t1.id = t.f_doc_id
    join booked_slip t2 on t2.id= t1.version_id
    where t.t_doc_id = :vdb_doc_id
    and nvl(t2.QUANTITY_YN, 'N') = 'Y' using sqlca;
	 
if 	 li_cnt > 0 then
	return 'Y'
else
	select count(t.t_doc_id) into :li_cnt
	 from matching t 
		 join document t1 on t1.id = t.t_doc_id
		 join booked_slip t2 on t2.id= t1.version_id
		 where t.f_doc_id = :vdb_doc_id
		 and nvl(t2.QUANTITY_YN, 'N') = 'Y' using sqlca;	
	if li_cnt > 0 then
		return  'Y'
	else
		return 'N'
	end if
end if

return 'N'
end function

on b_inventory.create
call super::create
end on

on b_inventory.destroy
call super::destroy
end on

