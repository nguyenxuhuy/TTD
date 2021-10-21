$PBExportHeader$c_w_pr_pos.srw
forward
global type c_w_pr_pos from window
end type
type dw_filter from t_dw_pos within c_w_pr_pos
end type
type dw_pr_line from t_dw_pos within c_w_pr_pos
end type
end forward

global type c_w_pr_pos from window
integer width = 6254
integer height = 1880
boolean titlebar = true
string title = "Yêu cầu mua hàng"
boolean controlmenu = true
windowtype windowtype = response!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event e_action_focus_down ( )
dw_filter dw_filter
dw_pr_line dw_pr_line
end type
global c_w_pr_pos c_w_pr_pos

type variables
t_transaction 			it_transaction
double					idb_version_id, idb_uom_id, idb_object_id
boolean					ib_item_chosen, ib_complete
string						is_barcode, is_obj_name, is_obj_code
end variables

forward prototypes
public function integer f_new_pr ()
public function integer f_resize ()
end prototypes

public function integer f_new_pr ();double					ldb_doc_id, ldb_seq_id
string						ls_pr_code
b_obj_instantiate		lbo_ins
b_flexibledata			lbo_flex
b_sequences			lbo_seq
c_dwsetup_initial		lc_dwsetup_initial

ldb_doc_id = lbo_ins.f_create_id_ex( it_transaction ) 
idb_version_id =  lbo_ins.f_create_id_ex( it_transaction )

lc_dwsetup_initial.f_init_ids_setup_dw_ex( 'u_pr', it_transaction)

ls_pr_code = lc_dwsetup_initial.f_get_autonumber_ex('code', 'd_document_pr_grid', it_transaction)


INSERT into document(ID, company_id, branch_id, object_ref_table, created_by, created_date, last_mdf_by, last_mdf_date, doc_type, handled_by, version_id, status, trans_hdr_id, code, document_date)
values(:ldb_doc_id, :gi_user_comp_id, :gdb_branch, 'ORDERS', :gi_userid, sysdate, :gi_userid, sysdate, 'PR',:gi_userid, :idb_version_id, 'new', 25665058, :ls_pr_code, trunc(sysdate))
using it_transaction;

INSERT into ORDERS(ID, company_id, branch_id, object_ref_id, object_ref_table, created_by, created_date, last_mdf_by, last_mdf_date, doc_type, version_no)
values(:idb_version_id, :gi_user_comp_id, :gdb_branch, :ldb_doc_id, 'DOCUMENT', :gi_userid, sysdate, :gi_userid, sysdate, 'PR', 1)
using it_transaction;

commit using it_transaction;

return 1
end function

public function integer f_resize ();

//-- resize dw_doc --//
dw_filter.move( 0, 0)
dw_filter.width = this.width
dw_filter.height = dw_filter.f_getheight( )

//-- resize dw_bill_line --//
dw_pr_line.move( 0, dw_filter.y+ dw_filter.height + 100)
dw_pr_line.width = this.width
dw_pr_line.height = this.height - dw_filter.y - dw_filter.height - 100

return 1
end function

on c_w_pr_pos.create
this.dw_filter=create dw_filter
this.dw_pr_line=create dw_pr_line
this.Control[]={this.dw_filter,&
this.dw_pr_line}
end on

on c_w_pr_pos.destroy
destroy(this.dw_filter)
destroy(this.dw_pr_line)
end on

event open;string		ls_modstring_currentrow, ls_backgoundcolor, ls_currentrowcolor, lsa_colname[], ls_rtn, ls_modstring_color
int			li_cnt, li_rtn, li_idx
any		laa_data[]

datawindowchild		ldwc, ldwc_unit
c_dwservice				lc_dwservice

//-- Tạo connection voi database --//
it_transaction = create t_transaction
it_transaction.dbms =	SQLCA.DBMS
it_transaction.ServerName	 = SQLCA.ServerName
it_transaction.LogId	 = SQLCA.LogId
it_transaction.LogPass 	 = SQLCA.LogPass 
it_transaction.AutoCommit 	 = false 
it_transaction.DBParm	 = SQLCA.DBParm
connect using	it_transaction;	

dw_filter.insertrow( 0)

select count(id) 
into :li_cnt
from document 
where status = 'new' 
		and doc_type = 'PR' 
		and company_id = :gi_user_comp_id 
		and branch_id = :gdb_branch 
		using it_transaction;
		
if li_cnt = 1 then
	//-- load PR đã tạo--//
	select version_id
	into :idb_version_id
	from document 
	where status = 'new' 
			and doc_type = 'PR' 
			and company_id = :gi_user_comp_id 
			and branch_id = :gdb_branch 
			using it_transaction;	
elseif li_cnt > 1 then
	select version_id
	into :idb_version_id
	from document 
	where status = 'new' 
			and doc_type = 'PR' 
			and company_id = :gi_user_comp_id 
			and branch_id = :gdb_branch 
			and rownum = 1
			using it_transaction;		
else //-- tạo PR mới--//
	li_rtn = this.f_new_pr( )
end if

laa_data[1] = idb_version_id

dw_pr_line.f_add_where('object_ref_id',laa_data[])
dw_pr_line.settransobject( it_transaction )
dw_pr_line.retrieve( )

dw_pr_line.f_set_gutter_rowcount( )
dw_pr_line.inv_sort.f_setrequestor( dw_pr_line)
dw_pr_line.inv_sort.f_init( )

ls_backgoundcolor = string(536870912)
ls_currentrowcolor =string(rgb(255,231,99)) //vàng nâu
ls_modstring_currentrow = "536870912~~tif(getrow()=currentrow(),"+ls_currentrowcolor+","+ls_backgoundcolor+")"

li_cnt = dw_pr_line.f_getcolumns_visible(lsa_colname[] )
FOR li_idx = 1 to li_cnt
	ls_modstring_color =  lsa_colname[li_idx]+ '.background.mode=0 '+ lsa_colname[li_idx]+".background.color=~'"+ ls_modstring_currentrow+ "~'"
	ls_rtn = dw_pr_line.modify( ls_modstring_color)
NEXT

//-- retrieve dwc: tên hàng --//
this.dw_filter.getchild( 'name', ldwc)
//-- add where comapny --//
laa_data[1] = gi_user_comp_id
lc_dwservice.f_add_where_dwc(ldwc,  'company_id', laa_data[])
ldwc.settrans(it_transaction )
ldwc.retrieve( ) //-- Kết thúc retrieve dwc: tên hàng --//
ls_rtn = dw_filter.Modify( 'name.dddw.percentwidth= 200')

//-- retrieve dwc_unit: tên hàng --//
this.dw_filter.getchild( 'unit', ldwc_unit)
ldwc_unit.settrans(it_transaction )
ldwc_unit.retrieve( )
ls_rtn = dw_filter.Modify( 'unit.dddw.percentwidth= 250')

end event

event resize;this.post f_resize()
end event

event closequery;dw_pr_line.accepttext( )
if dw_pr_line.modifiedcount( ) + dw_pr_line.deletedcount( ) > 0 then
	if dw_pr_line.update() = 1 then
		commit using it_transaction;
	else
		gf_messagebox('m.c_w_pr_pos.closequery.01','Thông báo','Lỗi cập nhật:@'+ it_transaction.sqlerrtext ,'stop','ok',1)
		rollback using it_transaction;
	end if
	
end if
disconnect using it_transaction;
destroy it_transaction
end event

event key;
if key = keyEscape! then
	close(this)
end if
end event

type dw_filter from t_dw_pos within c_w_pr_pos
integer x = 14
integer y = 4
integer width = 3877
integer height = 252
integer taborder = 10
string dataobject = "d_pr_search_form"
end type

event e_dwnkey;//-- override--//

if key = keyEscape! then
	close(parent)
elseif key= keyEnter! then
	if this.getcolumnname( ) = 'note' then
		this.setcolumn('name')
		return 1
	else		
		Send(Handle(this),256,9,Long(0,0))
		RETURN 1
	end if
elseif  key= keytab! and keyflags = 1 then
elseif key= keytab! then
	if this.getcolumnname( ) = 'note' then
		this.setcolumn('name')
		return 1
	end if
end if	

end event

event itemfocuschanged;call super::itemfocuschanged;
string								ls_findStr, ls_note
long								ll_row
decimal 							ldc_qty, ldc_qty_count
datawindowchild 				ldwc_item, ldwc_unit

this.ib_dropdowning = false
if dwo.name = 'unit' then
	if ib_item_chosen then
		if this.getchild( 'name', ldwc_item)  = 1 then
			ldwc_item.setfilter( '')
			ldwc_item.filter( )
		end if
	end if
	//-- kiểm tra đơn vị: nếu chỉ có 1 đơn vị insert bill, nếu > 1 xổ list unit --//
	ldc_qty = this.getitemnumber( row, 'qty')
	if isnull(ldc_qty) then ldc_qty = 0
	if this.getchild( 'unit', ldwc_unit)  = 1 then
		if idb_object_id > 0 then  //-- y/c có mã hàng--//
			ldwc_unit.setfilter( " item_id = " + string(idb_object_id))
			ldwc_unit.filter( )
			if ldwc_unit.rowcount( ) = 1 then 
				this.setitem( row,'unit', ldwc_unit.getitemstring( 1, 'uom_code') )
				idb_uom_id = ldwc_unit.getitemnumber( 1, 'uom_id')
				return 0
			elseif ldwc_unit.rowcount( ) > 1 then 
				this.setitem( row,'unit', ldwc_unit.getitemstring(1, 'uom_code') )
				idb_uom_id = ldwc_unit.getitemnumber(1, 'uom_id')		
				ldwc_unit.scrolltorow(1)
				this.keybd_event( 115,0,0,0 )
				return 0			
			end if
		end if
	end if
	ib_item_chosen = false
elseif  dwo.name = 'name'   then	

	if (this.getitemstring(row, 'name') = is_obj_name or  this.getitemstring(row, 'name') = is_barcode ) and ib_complete and idb_uom_id > 0 then
		ldc_qty =  this.getitemnumber( row, 'qty')
		ldc_qty_count = this.getitemnumber( row, 'qty_count')
		ls_findStr = "line_text = '"+string(is_obj_name) + "' and TRANS_UOM = "+string(idb_uom_id)
		ll_row = dw_pr_line.find( ls_findStr , 1, dw_pr_line.rowcount( ) )
		if ll_row = 0 then
			ll_row = dw_pr_line.event e_addrow( )
			dw_pr_line.scrolltorow( ll_row)
			dw_pr_line.setitem(ll_row , 'line_text', is_obj_name)
			dw_pr_line.setitem(ll_row , 'item_code', is_obj_code)
			dw_pr_line.setitem(ll_row , 'qty', ldc_qty)
			dw_pr_line.setitem(ll_row , 'count_qty', ldc_qty_count)
			if idb_object_id = 0 then
				setnull(idb_object_id)
			end if
			dw_pr_line.setitem(ll_row , 'ITEM_ID', idb_object_id)
			dw_pr_line.setitem(ll_row , 'TRANS_UOM', idb_uom_id)
			dw_pr_line.setitem(ll_row , 'uom_code', this.getitemstring( 1, 'unit') )	
			dw_pr_line.setitem(ll_row , 'request_receive_date', today() )	
			dw_pr_line.setitem(ll_row , 'note', this.getitemstring( 1, 'note') )	
		else		
			dw_pr_line.setitem(ll_row , 'count_qty', ldc_qty_count)
			ldc_qty += dw_pr_line.getitemnumber( ll_row, 'qty')
			dw_pr_line.setitem(ll_row , 'qty', ldc_qty)
			ls_note = this.getitemstring( 1, 'note') 
			if not isnull(ls_note) and ls_note <> '' then
				dw_pr_line.setitem(ll_row , 'note',  ls_note)
			end if
		end if		

	end if
	ib_complete = false
	idb_uom_id = 0
	this.setitem( row, 'unit', '')
	this.setitem( row, 'uom_id', 0)
	this.setitem( row, 'qty', 0)
	this.setitem( row, 'qty_count', 0)
	this.setitem( row, 'note', '')
	keybd_event( 115,0,0,0 )

elseif dwo.name = 'qty'   then
	if is_obj_name <> '' then
		if this.getchild( 'unit', ldwc_unit)  = 1 then
			if  ldwc_unit.getrow() > 0 then
				this.setitem( row,'unit', ldwc_unit.getitemstring( ldwc_unit.getrow(), 'uom_code') )
				idb_uom_id = ldwc_unit.getitemnumber( ldwc_unit.getrow(), 'uom_id')	
			end if
		end if
	end if
elseif dwo.name = 'note'   then	
	if is_obj_name <> '' and idb_uom_id > 0 then 
		ib_complete = true	
	end if	
end if
end event

event itemchanged;call super::itemchanged;
string						ls_obj_name, ls_obj_code, ls_barcode
long						ll_scrollrow
datawindowchild 		ldwc, ldwc_unit

if dwo.name = 'name' then
	if this.getchild( 'name', ldwc)  = 1 then
		if ldwc.getrow( ) > 0 then						
			ls_obj_name = ldwc.getitemstring(ldwc.getrow( ), 'object_name')
			ls_obj_code =  ldwc.getitemstring(ldwc.getrow( ), 'object_code')
			ls_barcode =  ldwc.getitemstring(ldwc.getrow( ), 'barcode')
			//-- Nếu là hàng hóa --//
			if ls_obj_name = data or ls_obj_code = data or ls_barcode = data then			
				idb_object_id = ldwc.getitemnumber(ldwc.getrow( ), 'object_id')
				if ls_barcode = data then												
					is_barcode = ls_barcode
					this.setitem( row, 'name', ls_obj_name)
					this.settext( ls_obj_name)								
				end if											
				is_obj_name = ls_obj_name
				is_obj_code = ls_obj_code
				idb_uom_id = 0
				ib_item_chosen = true
				
			else //-- ko tìm thấy item--//
				idb_object_id = 0
				is_obj_name = data
				idb_uom_id = 0
				ldwc.setfilter( '')		
				ldwc.filter( )							
			end if						
			if idb_object_id > 0 then
				ll_scrollrow = dw_pr_line.find( "item_id = "+string(idb_object_id), 1 , dw_pr_line.rowcount())
			else
				ll_scrollrow = dw_pr_line.find( "line_text = '"+data+"'", 1 , dw_pr_line.rowcount())
			end if
			if ll_scrollrow > 0 then
				dw_pr_line.scrolltorow(ll_scrollrow )
			end if
		else //-- dwc = 0 //
			idb_object_id = 0
			is_obj_name = ''				
			idb_uom_id = 0
			this.ib_dropdowning = false
			ldwc.setfilter( '')
			ldwc.filter( )						
//			gf_messagebox('m.dw_scan_barcode.01','Thông báo','Tên hàng hóa chứa đúng:@'+data,'exclamation','ok',1)
			return 1 //-- gõ tên hàng chưa đúng --//
		end if
	end if
elseif dwo.name = 'unit' then	
	if this.getitemstring(row, 'name') = is_obj_name then
//		ldc_qty = this.getitemnumber( row, 'qty')
//		if isnull(ldc_qty) then ldc_qty = 0		
		if this.getchild( 'unit', ldwc_unit)  = 1 then
			if ldwc_unit.getrow( ) > 0 then
				idb_uom_id = ldwc_unit.getitemnumber( ldwc_unit.getrow( ), 'uom_id')
			end if
		end if
	end if
end if
end event

event itemerror;call super::itemerror;if dwo.name = 'name' then
	return 1
end if
end event

event editchanged;call super::editchanged;int								li_editpos, li_rtn
string							ls_data, ls_autocomplete_string, ls_rtn
datawindowchild			ldwc

If dwo.name = 'name' then

	if this.getchild( dwo.name, ldwc) = -1 then return
	li_editpos = this.position()
	ls_data = data 
//	if len(mid(ls_data,li_editpos -1,1)) > 1 then li_editpos ++		
	ls_autocomplete_string = this.f_get_autocomplete_string(dwo.name, ls_data, 'dddw', ldwc, 'obj_search')		
	if lower(left(trim(ls_autocomplete_string),len(ls_data))) = lower(ls_data) then
		this.settext( ls_autocomplete_string)		
	else
		this.settext(ls_data)
	end if	
	If len(ls_data) = len(ls_autocomplete_string) THEN
		 This.SelectText (Len (ls_autocomplete_string)+1, 0)
	Else
		This.SelectText (li_editpos, Len (ls_autocomplete_string))
	End If	
	
	if this.ib_dropdowning = false then 
		keybd_event( 115,0,0,0 )
		this.ib_dropdowning = true
	end if
	
end if
end event

event losefocus;call super::losefocus;this.ib_dropdowning = false
end event

event e_dwdropdown;//-- override --//
this.ib_dropdowning = true
end event

type dw_pr_line from t_dw_pos within c_w_pr_pos
integer y = 268
integer width = 6240
integer height = 1416
integer taborder = 20
string dataobject = "d_pr_line_pos_grid"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event e_dwnkey;//-- Override --//

long			ll_row
string			ls_code, ls_data

if key= keyEnter! then
	this.accepttext( )
	Send(Handle(this),256,9,Long(0,0))
	RETURN 1
elseif key =keyspacebar! then
	ls_data = this.getitemstring( this.getrow(), 'gutter')
	if ls_data = 'N' or isnull(ls_data) then		
		ls_code =  this.getitemstring( this.getrow(), 'code')
		if this.find( "gutter = 'Y'", 1, this.rowcount()) = 0 then
			ll_row = this.find( "code = '" + string(ls_code)+"'" , 1, this.rowcount()) 
			Do while ll_row > 0
				this.setitem( ll_row, 'gutter', 'Y')
				ll_row = this.find( "code = '" + string(ls_code)+"'" , ll_row + 1, this.rowcount() + 1) 
			loop
		else
			this.setitem( this.getrow(), 'gutter', 'Y')
		end if
		//-- đổi màu:đỏ --//
		if this.find( "gutter = 'N' or isnull(gutter)", 1, this.rowcount()) = 0 then
			this.modify("gutter_t.color  = '" +string(rgb(255,0,0))+"'")
		end if					
	else
		this.setitem( this.getrow(), 'gutter', 'N')
		//-- đổi màu:đen --//
		if this.find( "gutter = 'Y'", 1, this.rowcount()) = 0 then
			this.modify("gutter_t.color  = '" +string(rgb(0,0,255))+"'")
		end if				
	end if
elseif  key= keyDelete! then
	ll_row = this.find( "gutter = 'Y'", 1, this.rowcount())
	Do while ll_row > 0
		this.deleterow(ll_row )
		ll_row = this.find( "gutter = 'Y'", ll_row + 1, this.rowcount() + 1)
	LOOP
elseif key = keyEscape! then
	close(parent)

end if


end event

event itemerror;call super::itemerror;return 1
end event

event e_postinsertrow;call super::e_postinsertrow;
b_obj_instantiate 				lbo_ins

this.setitem( vl_row , 'id', lbo_ins.f_create_id_ex( it_transaction ) )
this.setitem( vl_row , 'object_ref_id',  idb_version_id)
this.setitem( vl_row , 'object_ref_table', 'ORDERS' )
this.setitem( vl_row , 'company_id', gi_user_comp_id )
this.setitem( vl_row , 'branch_id', gdb_branch )

return vl_row
end event

