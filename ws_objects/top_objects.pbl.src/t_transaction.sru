$PBExportHeader$t_transaction.sru
forward
global type t_transaction from transaction
end type
end forward

global type t_transaction from transaction
end type
global t_transaction t_transaction

type prototypes
FUNCTION int f_db_get_rate(long item_id, long from_unit_id, long user_comp_id, ref decimal convert_rate, ref decimal add) RPCFUNC ALIAS FOR "pak_item_unit.f_get_convert_rate"
FUNCTION int f_db_get_rate(long item_id, long from_unit_id, long to_unit_id, long user_comp_id, ref decimal convert_rate, ref decimal add) RPCFUNC ALIAS FOR "pak_item_unit.f_get_convert_rate"
FUNCTION double f_db_round(double p_round_id, double p_values) RPCFUNC ALIAS FOR "pak_uom.f_round"
FUNCTION double f_seq_nextval(string vs_seq_id ) RPCFUNC ALIAS FOR "f_seq_nextval"
FUNCTION boolean f_check_id_exists_table(double vdb_id , string vs_table ) RPCFUNC ALIAS FOR "f_check_id_exists_table"
FUNCTION int f_is_duplicated(string vs_table , string vs_where ) RPCFUNC ALIAS FOR "f_is_duplicated"
FUNCTION int f_update_pic(string vs_table , string vs_colname , double vdb_id ) RPCFUNC ALIAS FOR "f_update_pic"
FUNCTION string f_remove_pic(string vs_table , string vs_colname , double vdb_id ) RPCFUNC ALIAS FOR "f_remove_pic"
FUNCTION string f_get_ref_table( double vdb_ver_id , string vs_table ) RPCFUNC ALIAS FOR "f_get_ref_table"


FUNCTION double f_get_doc_id(double vdb_id , string vs_table ) RPCFUNC ALIAS FOR "f_get_doc_id"
FUNCTION double f_match_doc_count(double vdb_id , string vs_table ) RPCFUNC ALIAS FOR "f_match_doc_count"
FUNCTION double f_match_doc_value(string vs_f_match_column, double vdb_id , string vs_table ) RPCFUNC ALIAS FOR "f_match_doc_value"
FUNCTION double f_get_matched_value(string vs_f_match_column, double vdb_f_ref_id , string vs_t_ref_table ) RPCFUNC ALIAS FOR "f_get_matched_value"



SUBROUTINE f_db_upd_obj_balance_adj(date v_f_date, char v_sob) RPCFUNC ALIAS FOR "PRO_UPD_OBJ_BALANCE_ADJ"
SUBROUTINE f_db_upd_item_balance_adj(date v_f_date, char v_sob) RPCFUNC ALIAS FOR "PRO_UPD_ITEM_BALANCE_ADJ"


end prototypes

on t_transaction.create
call super::create
TriggerEvent( this, "constructor" )
end on

on t_transaction.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event dberror; 
choose case code
		
	case 3114		
		messagebox('Thông báo','Chương trình mất kết nối với cơ sở dữ liệu. Phải đóng lại. Vui lòng kiểm tra lại network trước khi mở lại', stopsign!, ok!,1)
		HALT CLOSE 
		return
	case 12543
		messagebox('Thông báo','Chương trình không kết nối với cơ sở dữ liệu. Phải đóng lại. Vui lòng kiểm tra lại network trước khi mở lại', stopsign!, ok!,1)
		HALT CLOSE
		return
	case 1843, 1840
		return -1		
	case else
		messagebox('Thông báo', string(code) +';'+ string(this.sqldbcode) )
		messagebox('Thông báo','Lỗi dữ liệu: chương trình tự đóng sau khi bấm OK <'+sqlerrortext+'>', stopsign!, ok!,1)
//		HALT CLOSE
		if this.database = 'multithread' then
			return
		else
//			HALT CLOSE
		end if
end choose
end event

