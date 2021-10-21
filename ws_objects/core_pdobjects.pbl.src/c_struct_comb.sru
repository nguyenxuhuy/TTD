$PBExportHeader$c_struct_comb.sru
forward
global type c_struct_comb from s_object_display
end type
end forward

global type c_struct_comb from s_object_display
end type
global c_struct_comb c_struct_comb

type variables
double idb_object_ref_id
end variables

forward prototypes
public subroutine f_set_dwo_window ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_item_struct_comb_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_item_struct_comb_grid'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Tạo nhóm hàng'
end subroutine

on c_struct_comb.create
call super::create
end on

on c_struct_comb.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'flexible_data'
is_display_model = '1d'
is_object_title = 'Tạo nhóm hàng'

istr_actionpane[1].s_description = is_object_title
end event

event e_dw_clicked;call super::e_dw_clicked;string		ls_yn
long		ll_row
if vs_colname = 'gutter' then
	ls_yn = rdw_handling.getitemstring(vl_currentrow, 'gutter')
	
	rdw_handling.setitem(vl_currentrow, 'sel1', ls_yn)
	rdw_handling.setitem(vl_currentrow, 'sel2', ls_yn)
	rdw_handling.setitem(vl_currentrow, 'sel3', ls_yn)
elseif vs_colname = 'gutter_t' then
	if rdw_handling.rowcount() > 0 then
		ls_yn = rdw_handling.getitemstring(1, 'gutter')
		For ll_row = 1 to rdw_handling.rowcount() 
			rdw_handling.setitem(ll_row, 'sel1', ls_yn)
			rdw_handling.setitem(ll_row, 'sel2', ls_yn)
			rdw_handling.setitem(ll_row, 'sel3', ls_yn)			
		NEXT
	end if
end if
return ancestorreturnvalue
end event

event e_dw_e_save;//-- OVERRIDE --//

long					ll_row, ll_cnt
double				ldb_struct_id, ldb_id
string					ls_insrt_sql, ls_valueStr, ls_valuetmp, ls_char, ls_combCode, ls_combname, ls_combID, ls_valueStrAll
t_dw_mpl			ldw_main
b_obj_instantiate	lbo_ins

ldw_main = iw_display.f_get_dwmain( )
if lbo_ins.f_get_struct_id_n_combchar_ex( 'NHT_THM', ldb_struct_id, ls_char, it_transaction ) <> 1 then return -1

ls_insrt_sql = ' INSERT INTO VALUESET_VALUE (id, object_ref_table,created_date,last_mdf_date,created_by,last_mdf_by, object_ref_id, code,name,id_combination) '
ll_row = ldw_main.find( " gutter = 'Y'", 1, ldw_main.rowcount())
Do while ll_row > 0 
	//-- 24771803 : ID cùa struct nhóm thuốc 'NTH_THM'
	ll_cnt ++
	ls_combCode = ''
	ls_combname = ''
	ls_combID = ''
	SELECT SEQ_TABLE_ID.nextval into :ldb_id from dual using it_transaction ;
	
	ls_valueStr = " SELECT "+string(ldb_id)+ ", 'FLEXIBLE_DATA',sysdate, sysdate ," + string( gi_userid) +', '+ string( gi_userid) +', ' + string(ldb_struct_id) + ', '
	if ldw_main.getitemstring(ll_row, 'sel1') = 'Y' Then
		ls_valuetmp = ldw_main.getitemstring( ll_row, 'code_1')
		if isnull(ls_valuetmp) then ls_valuetmp = ''
		ls_combCode +=ls_valuetmp		
		ls_valuetmp = ldw_main.getitemstring( ll_row, 'name_1')
		if isnull(ls_valuetmp) then ls_valuetmp = ''
		ls_combname +=ls_valuetmp				
		ls_valuetmp = string(ldw_main.getitemnumber( ll_row, 'id_1'))
		ls_combID +=ls_valuetmp		
	else
		ls_valuetmp = string(ldw_main.getitemnumber( ll_row, 'id_1'))
		ls_combID +=ls_valuetmp			
	end if
	if ldw_main.getitemstring(ll_row, 'sel2') = 'Y' Then
		ls_valuetmp = ldw_main.getitemstring( ll_row, 'code_2')
		if isnull(ls_valuetmp) then ls_valuetmp = ''
		ls_combCode += ls_char + ls_valuetmp			
		ls_valuetmp = ldw_main.getitemstring( ll_row, 'name_2')
		if isnull(ls_valuetmp) then ls_valuetmp = ''
		ls_combname +=  ls_char + ls_valuetmp		
		ls_valuetmp = string(ldw_main.getitemnumber( ll_row, 'id_2'))
		ls_combID += ls_char +ls_valuetmp					
	else
		ls_combCode += ls_char 
		ls_combname +=  ls_char
		ls_valuetmp = string(ldw_main.getitemnumber( ll_row, 'id_2'))
		ls_combID += ls_char +ls_valuetmp					
	end if
	if ldw_main.getitemstring(ll_row, 'sel3') = 'Y' Then
		ls_valuetmp = ldw_main.getitemstring( ll_row, 'code_3')
		if isnull(ls_valuetmp) then ls_valuetmp = ''
		ls_combCode += ls_char + ls_valuetmp			
		ls_valuetmp = ldw_main.getitemstring( ll_row, 'name_3')
		if isnull(ls_valuetmp) then ls_valuetmp = ''
		ls_combname +=  ls_char + ls_valuetmp		
		ls_valuetmp = string(ldw_main.getitemnumber( ll_row, 'id_3'))
		ls_combID += ls_char +ls_valuetmp	
	else
		ls_combCode += ls_char 
		ls_combname +=  ls_char
		ls_valuetmp = string(ldw_main.getitemnumber( ll_row, 'id_3'))
		ls_combID += ls_char +ls_valuetmp	
	end if	
	ls_valueStr += "'"+ls_combCode +"', '" +ls_combname +"', '" + ls_combID +"' FROM dual"
	if ll_cnt = 1 then
		ls_valueStrAll = ls_valueStr
	else 
		ls_valueStrAll += ' UNION ALL ' + ls_valueStr
	end if
	
	ll_row = ldw_main.find( " gutter = 'Y'", ll_row + 1, ldw_main.rowcount() + 1)
LOOP 

if ll_cnt > 0 then

	ls_insrt_sql += ls_valueStrAll 
	
	EXECUTE immediate :ls_insrt_sql  using it_transaction;
end if
return 0
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;

if vs_editdata = 'N' then
	if vs_colname = 'sel1' then
		if rpo_dw.getitemstring(vl_currentrow, 'sel2') = 'N' and rpo_dw.getitemstring(vl_currentrow, 'sel3') = 'N' then
			rpo_dw.setitem(vl_currentrow, 'gutter', 'N')
		end if
	elseif vs_colname = 'sel2' then
		if rpo_dw.getitemstring(vl_currentrow, 'sel1') = 'N' and rpo_dw.getitemstring(vl_currentrow, 'sel3') = 'N' then
			rpo_dw.setitem(vl_currentrow, 'gutter', 'N')
		end if				
	elseif vs_colname = 'sel3' then
		if rpo_dw.getitemstring(vl_currentrow, 'sel1' )= 'N' and rpo_dw.getitemstring(vl_currentrow, 'sel2' )= 'N' then
			rpo_dw.setitem(vl_currentrow, 'gutter', 'N')
		end if				
	end if
end if
		
RETURN ancestorreturnvalue
end event

event e_window_e_postsave;call super::e_window_e_postsave;
return iw_display.event e_refresh( )
end event

