$PBExportHeader$c_sequences_entry.sru
forward
global type c_sequences_entry from s_object_display
end type
end forward

global type c_sequences_entry from s_object_display
end type
global c_sequences_entry c_sequences_entry

forward prototypes
public subroutine f_set_dwo_window ()
end prototypes

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_flexible_data_grid'
istr_dwo[1].s_dwo_form = ''
istr_dwo[1].s_dwo_grid = 'd_flexible_data_grid'
istr_dwo[1].b_master = true
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = true
istr_dwo[1].s_dwo_master = ''
istr_dwo[1].s_dwo_details = 'd_sequences_form;'
istr_dwo[1].s_dwo_shared = ''
istr_dwo[1].s_master_keycol = ''
istr_dwo[1].s_detail_keycol = ''
istr_dwo[1].b_ref_table_yn  = true
istr_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[1].b_insert = true
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = true
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Cách đánh số'

istr_dwo[2].s_dwo_default =  'd_sequences_form'
istr_dwo[2].s_dwo_form = 'd_sequences_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_master = false
//istr_dwo[2].b_dwmain = false
istr_dwo[2].b_cascade_del = true
istr_dwo[2].b_detail = true
istr_dwo[2].b_shared = false
istr_dwo[2].s_dwo_details = ''
istr_dwo[2].s_dwo_master = 'd_flexible_data_grid;'
istr_dwo[2].s_master_keycol = 'ID'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID'
istr_dwo[2].b_ref_table_yn  = true
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_focus_master = false
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].s_description = 'Cách đánh số '
istr_dwo[2].s_pic_ref_table = ''
istr_dwo[2].s_pic_ref_field = ''

end subroutine

on c_sequences_entry.create
call super::create
end on

on c_sequences_entry.destroy
call super::destroy
end on

event constructor;call super::constructor;is_table = 'sequences'
ib_changed_dwo_4edit = false
is_display_model = '1d_1d'
is_object_title = 'Cài đạt cách đánh số' 
istr_actionpane[1].s_description = is_object_title

end event

event e_dw_updatestart;call super::e_dw_updatestart;int					li_idx
double			ldb_seq_id, ll_nextvalue
b_sequences	lb_sequences

if rdw_requester.deletedcount() > 0 and rdw_requester.dataobject = 'd_flexible_data_grid' then
	FOR li_idx = 1 to rdw_requester.deletedcount() 
		ldb_seq_id = rdw_requester.getitemnumber(li_idx, 'ID', delete!, true)
		lb_sequences.f_drop_db_sequence_ex( ldb_seq_id, it_transaction )
	NEXT
elseif rdw_requester.dataobject = 'd_sequences_form' then
	//-- reset sequence --//
	ldb_seq_id = rdw_requester.getitemnumber(rdw_requester.getrow(), 'object_ref_id')
	ll_nextvalue = rdw_requester.getitemnumber(rdw_requester.getrow(), 'next_value')
	if lb_sequences.f_is_dbseq_existed_ex(string(ldb_seq_id), it_transaction) then
		lb_sequences.f_reset_db_sequence_ex( ldb_seq_id, ll_nextvalue, it_transaction)
	end if
end if
return 0
end event

event e_window_open;call super::e_window_open;datawindow			ldw_main
any					laa_value[]

//--add where object_ref_table --//
ldw_main = iw_display.dynamic f_get_dwmain()
laa_value[1] = '=SEQUENCES'
ldw_main.dynamic f_add_where('object_ref_table',laa_value[])

iw_display.dynamic f_set_ii_leftpart_width(1/2)

return 0
end event

event e_action_ctrl_bttn;call super::e_action_ctrl_bttn;datawindow				ldw_focus
int								li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	if not this.ib_copying then
		//-- control d_action_edit --//
		FOR li_idx = 1 to upperbound(istr_actionpane[]) 
			if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
				if ldw_focus.dynamic f_get_ib_shared() then
					ldw_focus = ldw_focus.dynamic f_getdwmaster()
				end if			
				if ldw_focus.dynamic f_get_ib_detail() then
					if ib_changed_dwo_4edit then
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify; b_filteron;b_refresh;b_delete;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron; b_refresh;b_delete;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_filteron; b_refresh;b_delete;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_add;b_insert;b_modify;b_filteron;b_refresh;b_delete;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
				istr_actionpane[li_idx].s_visible_buttons =  'b_book; b_attach; b_note;b_doc_trace_on;b_user_trace;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
				
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

