$PBExportHeader$c_structure.sru
forward
global type c_structure from b_popup_data
end type
end forward

global type c_structure from b_popup_data
end type
global c_structure c_structure

type variables
string		is_comb_char, is_struct_type, is_auto_comb_yn
double	idb_seq_id, idb_struct_id
end variables

forward prototypes
public subroutine f_set_dwo_window ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default = 'd_struct_popup_form'
istr_dwo[1].s_dwo_form = 'd_struct_popup_form'
istr_dwo[1].s_dwo_grid = ''
istr_dwo[1].b_master = false
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_details = ''
istr_dwo[1].s_dwo_shared = ''
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = false
istr_dwo[1].b_excel = false
istr_dwo[1].b_keyboardlocked = false
istr_dwo[1].s_description = 'Cấu trúc dữ liệu'

end subroutine

on c_structure.create
call super::create
end on

on c_structure.destroy
call super::destroy
end on

event constructor;call super::constructor;
ib_changed_dwo_4edit = false
ib_keyboardlocked = false
is_display_model ='1d'
is_object_title = 'Cấu trúc dữ liệu'

istr_actionpane[1].s_description = is_object_title
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;string		ls_null
double 	ldb_null
if vs_colname = 'value_code' then
	if vl_currentrow < rpo_dw.rowcount() then
		if rpo_dw.getitemstring(vl_currentrow + 1, 'depend_uprow_yn') = 'Y' then
			setnull(ls_null)
			setnull(ldb_null)
			rpo_dw.setitem(vl_currentrow + 1, 'value_code', ls_null)
			rpo_dw.setitem(vl_currentrow + 1, 'value_name', ls_null)
			rpo_dw.setitem(vl_currentrow + 1, 'value_id', ldb_null)
		end if
	end if
end if
return 0
end event

event e_window_e_okclose;//-- OVERRIDE--//

datawindow			ldw_structure
t_ds_db				lds_valueset
int						li_idx
long					ll_row
double				ldb_combine_id
string					ls_code_combine, ls_name_combine, ls_id_combine, ls_temp_str
string					ls_seq_yn, ls_seq_str, ls_null_yn, ls_colname
any					la_value[]
b_sequences		lb_sequences

ldw_structure = iw_display.dynamic f_get_dwmain()

FOR li_idx = 1 to ldw_structure.rowcount()
	ls_null_yn = ldw_structure.getitemstring( li_idx, 'null_yn')
	if ls_code_combine <> '' then ls_code_combine+=is_comb_char
	ls_temp_str = ldw_structure.getitemstring( li_idx, 'value_code')
	if isnull(ls_temp_str) or ls_temp_str ='' then 
		if isnull(ls_null_yn) or ls_null_yn = '' then
			ls_colname =  ldw_structure.getitemstring( li_idx, 'segment_name')
			gf_messagebox('m.c_structure.e_window_e_okclose.01','Thông báo','Chưa nhập dự liệu cột:@'+ls_colname  ,'exclamation','ok',1)
			return 
		end if
		ls_temp_str =''
	end if
	ls_code_combine += ls_temp_str
	
	if is_struct_type = 'struct_seq' then
		ls_seq_yn = ldw_structure.getitemstring( li_idx, 'seq_yn')
		if ls_seq_yn = 'Y' then
			if ls_seq_str <>'' then ls_seq_str += is_comb_char
			ls_seq_str += ls_temp_str
		end if
	end if
	
	if ls_name_combine <> '' then ls_name_combine+=is_comb_char
	ls_temp_str = ldw_structure.getitemstring( li_idx, 'value_name')
	if isnull(ls_temp_str) then ls_temp_str =''
	ls_name_combine += ls_temp_str
	
	if ls_id_combine <> '' then ls_id_combine+=is_comb_char
	ls_temp_str = ldw_structure.getitemstring( li_idx, 'value_code')
	if isnull(ls_temp_str) then ls_temp_str =''
	ls_id_combine +=ls_temp_str
NEXT	

lds_valueset = create t_ds_db
lds_valueset.dataobject = 'd_valueset_entry_grid'
lds_valueset.f_settransobject( sqlca)
	
if is_struct_type = 'struct_seq' then	

	if isnull(idb_seq_id) or idb_seq_id = 0 then				
		gf_messagebox('m.c_structure.e_window_e_okclose.02','Thông báo','Cấu trúc chưa khai báo đánh số'  ,'exclamation','ok',1)
		return 
	end if
	lb_sequences.f_init(idb_seq_id )
	ls_seq_str += is_comb_char
	ls_temp_str = lb_sequences.f_create_autonumber(ls_seq_str )
	ls_code_combine += mid(ls_temp_str, len(ls_seq_str))

	
	ll_row = lds_valueset.event e_addrow( )
	ldb_combine_id = this.f_create_id( )
	lds_valueset.setitem( ll_row, 'ID', ldb_combine_id)
	lds_valueset.setitem( ll_row, 'object_ref_id', idb_struct_id)
	lds_valueset.setitem( ll_row, 'object_ref_table', 'FLEXIBLE_DATA')
	lds_valueset.setitem( ll_row, 'code', ls_code_combine)
	lds_valueset.setitem( ll_row, 'name', ls_name_combine)
	lds_valueset.setitem( ll_row, 'id_combination', ls_id_combine)
	if lds_valueset.update( ) = 1 then
		lds_valueset.resetupdate( )
		commit using sqlca;
	else
		rollback using sqlca;
		gf_messagebox('m.c_structure.e_window_e_okclose.03','Thông báo','Không cập nhật được cấu trúc dữ liệu mới:@'+sqlca.sqlerrtext  ,'exclamation','ok',1)
		destroy lds_valueset
		return 
	end if
else

	la_value[1] = idb_struct_id
	la_value[2] = '='+ls_id_combine
	lds_valueset.f_add_where( 'object_ref_id;id_combination', la_value[])	
	if lds_valueset.retrieve( ) = 1 then
		ldb_combine_id = lds_valueset.getitemnumber( 1,'ID')
	else
		if  is_auto_comb_yn = 'Y'  then //-- tự động combine và insert --//
			ll_row = lds_valueset.event e_addrow( )
			ldb_combine_id = this.f_create_id( )
			lds_valueset.setitem( ll_row, 'ID', ldb_combine_id)
			lds_valueset.setitem( ll_row, 'object_ref_id', idb_struct_id)
			lds_valueset.setitem( ll_row, 'object_ref_table', 'FLEXIBLE_DATA')
			lds_valueset.setitem( ll_row, 'code', ls_code_combine)
			lds_valueset.setitem( ll_row, 'name', ls_name_combine)
			lds_valueset.setitem( ll_row, 'id_combination', ls_id_combine)
			if lds_valueset.update( ) = 1 then
				lds_valueset.resetupdate( )
				commit using sqlca;
			else
				rollback using sqlca;
				gf_messagebox('m.c_structure.e_window_e_okclose.03','Thông báo','Không cập nhật được cấu trúc dữ liệu mới:@'+sqlca.sqlerrtext  ,'exclamation','ok',1)
				destroy lds_valueset
				return 
			end if		
		else
			gf_messagebox('m.c_structure.e_window_e_okclose.04','Thông báo','Dữ liệu lựa chọn không kết hợp được: vui lòng chọn lại','exclamation','ok',1)
			destroy lds_valueset	
			return 		
		end if				
	end if
end if
	

this.ipo_main.idwsetup_initial.iaa_rtn_data[1]  = ls_code_combine
this.ipo_main.idwsetup_initial.iaa_rtn_data[2]  = ls_name_combine
this.ipo_main.idwsetup_initial.iaa_rtn_data[3]  = ldb_combine_id
destroy lds_valueset
closewithreturn(iw_display,'ok')
end event

event e_window_e_postopen;
string					lsa_segment_code[], lsa_segment_name[], ls_segment_code, ls_segment_name
int						li_cnt, li_idx
any					la_value[]

c_string				lc_string
t_dw_mpl			ldw_structure
t_ds_db				lds_struct, lds_valueset

ldw_structure = iw_display.dynamic f_get_dwmain()
idb_struct_id = ldw_structure.getitemnumber( 1, 'object_ref_id')
lds_struct = create t_ds_db
lds_struct.dataobject = 'd_structure_grid'
la_value[1] = idb_struct_id
lds_struct.f_add_where( 'ID', la_value[])
lds_struct.settransobject( sqlca)
lds_struct.retrieve( )

is_comb_char = lds_struct.getitemstring(1,'combine_char')
if isnull(is_comb_char) then is_comb_char = ''
is_struct_type = lds_struct.getitemstring(1,'struct_type')
if isnull(is_struct_type) then is_struct_type = 'normal'
is_auto_comb_yn = lds_struct.getitemstring(1,'AUTO_COMBINE_YN')
if isnull(is_auto_comb_yn) then is_auto_comb_yn = 'Y'
idb_seq_id =  lds_struct.getitemnumber(1,'object_ref_id')

lds_valueset = create t_ds_db
lds_valueset.dataobject = 'd_valueset_entry_grid'
la_value[1] = idb_struct_id
la_value[2] = '='+this.is_currentdata
lds_valueset.f_add_where( 'object_ref_id;code', la_value[])
lds_valueset.f_settransobject( sqlca)
if lds_valueset.retrieve( ) > 0 then
	ls_segment_code = lds_valueset.getitemstring( 1, 'id_combination')
	ls_segment_name= lds_valueset.getitemstring( 1, 'name')
	li_cnt = lc_string.f_stringtoarray(ls_segment_code,is_comb_char, lsa_segment_code[])
	li_cnt = lc_string.f_stringtoarray(ls_segment_name,is_comb_char, lsa_segment_name[])
	
	FOR li_idx = 1 to li_cnt
		ldw_structure.setitem( li_idx, 'value_code',  lsa_segment_code[li_idx])
		ldw_structure.setitem( li_idx, 'value_name',  lsa_segment_name[li_idx])
	NEXT
end if

destroy lds_struct
destroy lds_valueset

return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;
this.f_set_resize_wdisplay( 2600, 2000)
return 0
end event

