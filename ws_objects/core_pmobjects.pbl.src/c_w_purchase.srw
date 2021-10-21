$PBExportHeader$c_w_purchase.srw
forward
global type c_w_purchase from window
end type
type rb_2 from radiobutton within c_w_purchase
end type
type rb_1 from radiobutton within c_w_purchase
end type
type tab_3 from tab within c_w_purchase
end type
type tabpage_3 from c_tp_purchase_3 within tab_3
end type
type tabpage_3 from c_tp_purchase_3 within tab_3
end type
type tab_3 from tab within c_w_purchase
tabpage_3 tabpage_3
end type
type tab_2 from tab within c_w_purchase
end type
type tabpage_2 from c_tp_purchase_2 within tab_2
end type
type tabpage_2 from c_tp_purchase_2 within tab_2
end type
type tab_2 from tab within c_w_purchase
tabpage_2 tabpage_2
end type
type tab_1 from tab within c_w_purchase
end type
type tabpage_1 from c_tp_purchase_1 within tab_1
end type
type tabpage_1 from c_tp_purchase_1 within tab_1
end type
type tab_1 from tab within c_w_purchase
tabpage_1 tabpage_1
end type
end forward

global type c_w_purchase from window
integer width = 3374
integer height = 2152
boolean titlebar = true
string title = "Điều phối đặt mua"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
windowdockstate windowdockstate = windowdockstatefloating!
event type long e_dw_dragdrop ( dragobject vdrag_source,  powerobject vpo_parent_source,  long vl_row,  dwobject vdwo,  t_dw_pos vdw_dest,  powerobject vpo_parent_dest )
event type integer e_update ( )
rb_2 rb_2
rb_1 rb_1
tab_3 tab_3
tab_2 tab_2
tab_1 tab_1
end type
global c_w_purchase c_w_purchase

type variables
t_transaction 			it_transaction
end variables

forward prototypes
public function integer f_resize ()
public function t_dw_pos f_get_dw_line (integer vi_index)
public function long f_retrieve_line (ref t_transaction rt_transaction)
public function t_transaction f_get_transaction ()
public function integer f_refresh ()
end prototypes

event type long e_dw_dragdrop(dragobject vdrag_source, powerobject vpo_parent_source, long vl_row, dwobject vdwo, t_dw_pos vdw_dest, powerobject vpo_parent_dest);long					ll_row, ll_found, ll_insrtRow, ll_doc_row
long					ll_row_src, ll_line_src, ll_lineNo_tmp, ll_line_dest
int						li_idx, li_rtn
double				ldb_version_id, ldb_qty, ldb_item_id, ldb_qty_dest, ldb_price, ldb_vat, ldb_vendor
any					la_warehouse_id
string					ls_vendname, ls_qty, ls_dwclassname
t_dw_pos			ldw_source, ldw_hdr
b_obj_instantiate	lbo_ins
c_dwsetup_initial	lc_dwsetup_initial

ldw_source = vdrag_source

if vpo_parent_dest.classname() = vpo_parent_source.classname() &
	and ldw_source.classname( ) = vdw_dest.classname( ) &
	and ldw_source.dataobject <> 'd_purchase_form' then return 0

if ldw_source.dataobject = 'd_purchase_form' and  vdw_dest.dataobject = 'd_purchase_form'  then
	if vl_row > 0 then					
		ll_row_src = ldw_source.getrow()
		if ll_row_src > 0 and vl_row <> ll_row_src  then
			ll_line_src = long(ldw_source.getitemstring( ll_row_src , 'document_loc'))
			ll_line_dest = long(vdw_dest.getitemstring( vl_row , 'document_loc'))
			ll_lineNo_tmp = ll_line_dest
			vdw_dest.setitem( vl_row, 'document_loc', string(ll_line_src))
			ldw_source.setitem( ll_row_src, 'document_loc', string(ll_lineNo_tmp))		
			vdw_dest.sort( )
			connect using it_transaction;		
			this.f_retrieve_line( it_transaction)
			disconnect using it_transaction;				
		end if
	end if		
	return 0  //-- kéo header --//
end if

if vpo_parent_dest.classname() = 'tabpage_2' then
	ldw_hdr = tab_2.tabpage_2.dw_1 
	li_idx = integer(right(vdw_dest.classname(),1)) - 1
	ldb_version_id = ldw_hdr.getitemnumber( li_idx, 'document_version_id')
elseif vpo_parent_dest.classname() = 'tabpage_1' then
	ldw_hdr = tab_1.tabpage_1.dw_1
	ldb_version_id = ldw_hdr.getitemnumber( 1, 'version_id')
	if vpo_parent_source.classname() = 'tabpage_2' then
		ldw_hdr = tab_2.tabpage_2.dw_1 
		li_idx = integer(right(ldw_source.classname(),1)) - 1
		ldb_vendor =  ldw_hdr.getitemnumber( li_idx, 'orders_bill_to_object')
		if isnull(ldb_vendor) then ldb_vendor = 0
		ls_vendname = ldw_hdr.getitemstring( li_idx, 'vend_short_name')
	end if
elseif vpo_parent_dest.classname() = 'tabpage_3' then
	ldw_hdr = tab_3.tabpage_3.dw_1
	ldb_version_id = ldw_hdr.getitemnumber( 1, 'version_id')
	if vpo_parent_source.classname() = 'tabpage_2' then
		ldw_hdr = tab_2.tabpage_2.dw_1 
		li_idx = integer(right(ldw_source.classname(),1)) - 1
		ldb_vendor =  ldw_hdr.getitemnumber( li_idx, 'orders_bill_to_object')
		ls_vendname = ldw_hdr.getitemstring( li_idx, 'vend_short_name')
	end if	
end if


if ldw_source.dataobject = vdw_dest.dataobject then
	 //-- kéo line PO--// //-- kéo PUR_INVOICE line--// cùng loại dw line
	ll_row = ldw_source.find( "gutter = 'Y'", 1, ldw_source.rowcount())
	if ldw_source.ib_mouse_rdown then 
		connect using it_transaction;
	end if
	if ll_row = 0 then
		ll_row = ldw_source.getrow( )
	end if
	
	Do while ll_row > 0 	
		if ldw_source.dataobject = 'd_purchase_line_grid' then
			ldb_item_id = ldw_source.getitemnumber( ll_row, 'item_id')
			ll_found = vdw_dest.find("item_id = "+string(ldb_item_id), 1, vdw_dest.rowcount())
		else
			ldb_item_id = ldw_source.getitemnumber( ll_row, 'object_id')
			ll_found = vdw_dest.find("object_id = "+string(ldb_item_id), 1, vdw_dest.rowcount())
		end if
		if ldw_source.ib_mouse_down then
			if ll_found = 0 then
				//-- kiểm tra thay đổi trạng thái PO dest trước khi copy --//				
				if vdw_dest.dataobject = 'd_purchase_line_grid' and vdw_dest.rowcount() = 0 then
					ls_dwclassname = vdw_dest.classname( )
					ll_doc_row = long( mid( ls_dwclassname , pos(ls_dwclassname,'_') +1 ))
					tab_2.tabpage_2.dw_1.setitem(ll_doc_row -1 , 'document_status', 'new')					
				end if
				
				ldw_source.rowscopy( ll_row, ll_row, primary!, vdw_dest, vdw_dest.rowcount()+1, primary!)
				connect using it_transaction;
				vdw_dest.setitem(vdw_dest.rowcount(), 'id', lbo_ins.f_create_id_ex( it_transaction ) )		
				disconnect using it_transaction;
				vdw_dest.setitem(vdw_dest.rowcount(), 'object_ref_id', ldb_version_id)
			else
				ldb_qty = ldw_source.getitemnumber( ll_row, 'qty')
				if isnull(ldb_qty) then ldb_qty = 0
				ldb_qty_dest = vdw_dest.getitemnumber( ll_found, 'qty')
				if isnull(ldb_qty_dest) then ldb_qty_dest = 0
				vdw_dest.setitem(ll_found, 'qty', ldb_qty + ldb_qty_dest)
				//-- cập nhật các cột liên quan: 'amount;base_amount;vat_amount;last_mdf_by;last_mdf_date' --//
				ldb_price = vdw_dest.getitemnumber( ll_found, 'price')
				ldb_vat = vdw_dest.getitemnumber( ll_found, 'vat')
				vdw_dest.setitem(ll_found, 'amount', (ldb_qty + ldb_qty_dest)*ldb_price)
				vdw_dest.setitem(ll_found, 'base_amount', (ldb_qty + ldb_qty_dest)*ldb_price)
				vdw_dest.setitem(ll_found, 'base_amount_ex_tax', (ldb_qty + ldb_qty_dest)*ldb_price)
				vdw_dest.setitem(ll_found, 'vat_amount', (ldb_qty + ldb_qty_dest)*ldb_price * ldb_vat /100)				
				vdw_dest.setitem(ll_found, 'last_mdf_by', gi_userid)
				vdw_dest.setitem(ll_found, 'last_mdf_date', today() )							
			end if
			ldw_source.deleterow(ll_row )
		//-- kiểm tra thay đổi trạng thái PO --//
			if ldw_source.dataobject = 'd_purchase_line_grid' and ldw_source.rowcount() = 0 then
				ls_dwclassname = ldw_source.classname( )
				ll_doc_row = long( mid( ls_dwclassname , pos(ls_dwclassname,'_') +1 ))
				tab_2.tabpage_2.dw_1.setitem(ll_doc_row -1 , 'document_status', 'full_receive')					
			end if			
		elseif  ldw_source.ib_mouse_rdown then
			ldb_price = ldw_source.getitemnumber( ll_row, 'price')
			ldb_vat = ldw_source.getitemnumber( ll_row, 'vat')
			ldb_qty = ldw_source.getitemnumber( ll_row, 'qty')
			if isnull(ldb_qty) then ldb_qty = 0
			ldw_source.setitem( ll_row, 'qty', ldb_qty - round(ldb_qty/2,0))		
			ldw_source.setitem(ll_row, 'amount', (ldb_qty - round(ldb_qty/2,0))*ldb_price)
			ldw_source.setitem(ll_row, 'base_amount', (ldb_qty - round(ldb_qty/2,0))*ldb_price)
			ldw_source.setitem(ll_row, 'base_amount_ex_tax', (ldb_qty - round(ldb_qty/2,0))*ldb_price)
			ldw_source.setitem(ll_row, 'vat_amount',  (ldb_qty - round(ldb_qty/2,0))*ldb_price * ldb_vat /100)						
			ldw_source.setitem(ll_row, 'last_mdf_by', gi_userid)
			ldw_source.setitem(ll_row, 'last_mdf_date', today() )			
						
			if ll_found = 0 then
				//-- kiểm tra thay đổi trạng thái PO dest trước khi copy --//				
				if vdw_dest.dataobject = 'd_purchase_line_grid' and vdw_dest.rowcount() = 0 then
					ls_dwclassname = vdw_dest.classname( )
					ll_doc_row = long( mid( ls_dwclassname , pos(ls_dwclassname,'_') +1 ))
					tab_2.tabpage_2.dw_1.setitem(ll_doc_row -1 , 'document_status', 'new')					
				end if
				
				ldw_source.rowscopy( ll_row, ll_row, primary!, vdw_dest, vdw_dest.rowcount()+1, primary!)
				vdw_dest.setitem(vdw_dest.rowcount(), 'object_ref_id', ldb_version_id)
				vdw_dest.setitem(vdw_dest.rowcount(), 'id', lbo_ins.f_create_id_ex( it_transaction ) )					
				//-- cập nhật các cột liên quan: 'qty;amount;base_amount;vat_amount;' --//
				ldb_price = vdw_dest.getitemnumber( vdw_dest.rowcount(), 'price')
				ldb_vat = vdw_dest.getitemnumber( vdw_dest.rowcount(), 'vat')					
				vdw_dest.setitem(vdw_dest.rowcount(), 'qty', round(ldb_qty/2,0))
				vdw_dest.setitem(vdw_dest.rowcount(), 'amount', round(ldb_qty/2,0)*ldb_price)
				vdw_dest.setitem(vdw_dest.rowcount(), 'base_amount', round(ldb_qty/2,0)*ldb_price)
				vdw_dest.setitem(vdw_dest.rowcount(), 'base_amount_ex_tax', round(ldb_qty/2,0)*ldb_price)
				vdw_dest.setitem(vdw_dest.rowcount(), 'vat_amount', round(ldb_qty/2,0)*ldb_price * ldb_vat /100)					
			else			
				ldb_qty_dest = vdw_dest.getitemnumber( ll_found, 'qty')
				if isnull(ldb_qty_dest) then ldb_qty_dest = 0			
				vdw_dest.setitem(ll_found , 'qty', round(ldb_qty/2,0) + ldb_qty_dest)		
				//-- cập nhật các cột liên quan: 'amount;base_amount;vat_amount;last_mdf_by;last_mdf_date' --//
				ldb_price = vdw_dest.getitemnumber( ll_found, 'price')
				ldb_vat = vdw_dest.getitemnumber( ll_found, 'vat')
				vdw_dest.setitem(ll_found, 'amount', (round(ldb_qty/2,0) + ldb_qty_dest)*ldb_price)
				vdw_dest.setitem(ll_found, 'base_amount', (round(ldb_qty/2,0) + ldb_qty_dest)*ldb_price)
				vdw_dest.setitem(ll_found, 'base_amount_ex_tax', (round(ldb_qty/2,0) + ldb_qty_dest)*ldb_price)
				vdw_dest.setitem(ll_found, 'vat_amount', (round(ldb_qty/2,0) + ldb_qty_dest)*ldb_price * ldb_vat /100)	
				vdw_dest.setitem(ll_found, 'last_mdf_by', gi_userid)
				vdw_dest.setitem(ll_found, 'last_mdf_date', today() )							
			end if
			ldw_source.setitem( ll_row, 'gutter', 'N')
		end if
		ll_row = ldw_source.find( "gutter = 'Y'",1, ldw_source.rowcount())
	LOOP			
else//-- kéo PUR_INVOICE vs PO line--//
	if ldw_source.dataobject = 'd_pur_retail_line_grid' and vdw_dest.dataobject = 'd_purchase_line_grid'  then
		ll_row = ldw_source.find( "gutter = 'Y'", 1, ldw_source.rowcount())
		if ldw_source.ib_mouse_rdown then 
			connect using it_transaction;
		end if
		if ll_row = 0 then
			ll_row = ldw_source.getrow( )
		end if
		
		Do while ll_row > 0 	
			ldb_item_id = ldw_source.getitemnumber( ll_row, 'object_id')
			ll_found = vdw_dest.find("item_id = "+string(ldb_item_id), 1, vdw_dest.rowcount())		
			if ldw_source.ib_mouse_down then
				if ll_found = 0 then
					//-- kiểm tra thay đổi trạng thái PO dest trước khi copy --//				
					if vdw_dest.rowcount() = 0 then
						ls_dwclassname = vdw_dest.classname( )
						ll_doc_row = long( mid( ls_dwclassname , pos(ls_dwclassname,'_') +1 ))
						tab_2.tabpage_2.dw_1.setitem(ll_doc_row -1 , 'document_status', 'new')					
					end if					
					ll_insrtRow = vdw_dest.insertrow(0)			
					connect using it_transaction;
					vdw_dest.setitem(ll_insrtRow, 'id', lbo_ins.f_create_id_ex( it_transaction ) )
					disconnect using it_transaction;
					
					vdw_dest.setitem(ll_insrtRow, 'object_ref_id', ldb_version_id)
					vdw_dest.setitem(ll_insrtRow, 'object_ref_table', 'ORDERS' )
					vdw_dest.setitem(ll_insrtRow, 'company_id', gi_user_comp_id )
					vdw_dest.setitem(ll_insrtRow, 'branch_id', gdb_branch )
					vdw_dest.setitem(ll_insrtRow, 'created_by', gi_userid )
					vdw_dest.setitem(ll_insrtRow, 'created_date', today() )
					vdw_dest.setitem(ll_insrtRow, 'last_mdf_by', gi_userid)
					vdw_dest.setitem(ll_insrtRow, 'last_mdf_date', today() )					
					vdw_dest.setitem(ll_insrtRow, 'qty', ldw_source.getitemnumber(ll_row, 'qty') )
					vdw_dest.setitem(ll_insrtRow, 'price', ldw_source.getitemnumber(ll_row, 'price') )
					vdw_dest.setitem(ll_insrtRow, 'amount', ldw_source.getitemnumber(ll_row, 'amount') )
					vdw_dest.setitem(ll_insrtRow, 'base_amount', ldw_source.getitemnumber(ll_row, 'base_amount') )
					vdw_dest.setitem(ll_insrtRow, 'base_amount_ex_tax', ldw_source.getitemnumber(ll_row, 'base_amount_ex_tax') )
					vdw_dest.setitem(ll_insrtRow, 'vat', ldw_source.getitemnumber(ll_row, 'vat') )
					vdw_dest.setitem(ll_insrtRow, 'vat_amount', ldw_source.getitemnumber(ll_row, 'vat_amount') )
					vdw_dest.setitem(ll_insrtRow, 'item_id', ldb_item_id)
					vdw_dest.setitem(ll_insrtRow, 'line_text', ldw_source.getitemstring(ll_row, 'line_text') )
					vdw_dest.setitem(ll_insrtRow, 'trans_uom', ldw_source.getitemnumber(ll_row, 'trans_uom') )
					vdw_dest.setitem(ll_insrtRow, 'uom_code', ldw_source.getitemstring(ll_row, 'uom_code') )
					//-- kiểm tra thay đổi trạng thái PO --//
				else
					ldb_qty = ldw_source.getitemnumber( ll_row, 'qty')
					if isnull(ldb_qty) then ldb_qty = 0
					ldb_qty_dest = vdw_dest.getitemnumber( ll_found, 'qty')
					if isnull(ldb_qty_dest) then ldb_qty_dest = 0
					vdw_dest.setitem(ll_found, 'qty', ldb_qty + ldb_qty_dest)					
					//-- cập nhật các cột liên quan: 'amount;base_amount;vat_amount;last_mdf_by;last_mdf_date' --//
					ldb_price = vdw_dest.getitemnumber( ll_found, 'price')
					ldb_vat = vdw_dest.getitemnumber( ll_found, 'vat')
					vdw_dest.setitem(ll_found, 'amount', (ldb_qty + ldb_qty_dest)*ldb_price)
					vdw_dest.setitem(ll_found, 'base_amount', (ldb_qty + ldb_qty_dest)*ldb_price)
					vdw_dest.setitem(ll_found, 'base_amount_ex_tax', (ldb_qty + ldb_qty_dest)*ldb_price)
					vdw_dest.setitem(ll_found, 'vat_amount', (ldb_qty + ldb_qty_dest)*ldb_price * ldb_vat /100)
					vdw_dest.setitem(ll_found, 'last_mdf_by', gi_userid)
					vdw_dest.setitem(ll_found, 'last_mdf_date', today() )								
				end if
				ldw_source.deleterow(ll_row )
				
			elseif  ldw_source.ib_mouse_rdown then
				ldb_price = ldw_source.getitemnumber( ll_row, 'price')
				ldb_vat = ldw_source.getitemnumber( ll_row, 'vat')
				ldb_qty = ldw_source.getitemnumber( ll_row, 'qty')
				if isnull(ldb_qty) then ldb_qty = 0
				ldw_source.setitem( ll_row, 'qty', ldb_qty - round(ldb_qty/2,0))	
				ldw_source.setitem(ll_row, 'amount', (ldb_qty - round(ldb_qty/2,0))*ldb_price)
				ldw_source.setitem(ll_row, 'base_amount', (ldb_qty - round(ldb_qty/2,0))*ldb_price)
				ldw_source.setitem(ll_row, 'base_amount_ex_tax', (ldb_qty - round(ldb_qty/2,0))*ldb_price)
				ldw_source.setitem(ll_row, 'vat_amount',  (ldb_qty - round(ldb_qty/2,0))*ldb_price * ldb_vat /100)
				ldw_source.setitem(ll_row, 'last_mdf_by', gi_userid)
				ldw_source.setitem(ll_row, 'last_mdf_date', today() )			
												
				if ll_found = 0 then
					//-- kiểm tra thay đổi trạng thái PO dest trước khi copy --//				
					if vdw_dest.rowcount() = 0 then
						ls_dwclassname = vdw_dest.classname( )
						ll_doc_row = long( mid( ls_dwclassname , pos(ls_dwclassname,'_') +1 ))
						tab_2.tabpage_2.dw_1.setitem(ll_doc_row -1 , 'document_status', 'new')					
					end if		
					
					ll_insrtRow = vdw_dest.insertrow(0)				
					vdw_dest.setitem(ll_insrtRow, 'id',  lbo_ins.f_create_id_ex( it_transaction ) )
					vdw_dest.setitem(ll_insrtRow, 'object_ref_id', ldb_version_id)
					vdw_dest.setitem(ll_insrtRow, 'object_ref_table', 'ORDERS' )
					vdw_dest.setitem(ll_insrtRow, 'company_id', gi_user_comp_id )
					vdw_dest.setitem(ll_insrtRow, 'branch_id', gdb_branch )
					vdw_dest.setitem(ll_insrtRow, 'created_by', gi_userid )
					vdw_dest.setitem(ll_insrtRow, 'created_date', today() )
					vdw_dest.setitem(ll_insrtRow, 'last_mdf_by', gi_userid)
					vdw_dest.setitem(ll_insrtRow, 'last_mdf_date', today() )					
					vdw_dest.setitem(ll_insrtRow, 'qty',  round(ldb_qty/2,0) )
					ldb_price = ldw_source.getitemnumber(ll_row, 'price')
					vdw_dest.setitem(ll_insrtRow, 'price',  ldb_price)
					vdw_dest.setitem(ll_insrtRow, 'amount',  round(ldb_qty/2,0) * ldb_price )
					vdw_dest.setitem(ll_insrtRow, 'base_amount',  round(ldb_qty/2,0) * ldb_price )
					vdw_dest.setitem(ll_insrtRow, 'base_amount_ex_tax',  round(ldb_qty/2,0) * ldb_price )
					ldb_vat = ldw_source.getitemnumber(ll_row, 'vat')
					vdw_dest.setitem(ll_insrtRow, 'vat', ldb_vat )
					vdw_dest.setitem(ll_insrtRow, 'vat_amount',  round(ldb_qty/2,0) * ldb_price * ldb_vat /100 )
					vdw_dest.setitem(ll_insrtRow, 'item_id', ldb_item_id)
					vdw_dest.setitem(ll_insrtRow, 'line_text', ldw_source.getitemstring(ll_row, 'line_text') )		
					vdw_dest.setitem(ll_insrtRow, 'trans_uom', ldw_source.getitemnumber(ll_row, 'trans_uom') )
					vdw_dest.setitem(ll_insrtRow, 'uom_code', ldw_source.getitemstring(ll_row, 'uom_code') )					
				else			
					ldb_qty_dest = vdw_dest.getitemnumber( ll_found, 'qty')
					if isnull(ldb_qty_dest) then ldb_qty_dest = 0			
					vdw_dest.setitem(ll_found , 'qty', round(ldb_qty/2,0) + ldb_qty_dest)			
					//-- cập nhật các cột liên quan: 'amount;base_amount;vat_amount;last_mdf_by;last_mdf_date' --//
					ldb_price = vdw_dest.getitemnumber( ll_found, 'price')
					ldb_vat = vdw_dest.getitemnumber( ll_found, 'vat')
					vdw_dest.setitem(ll_found, 'amount', (round(ldb_qty/2,0) + ldb_qty_dest)*ldb_price)
					vdw_dest.setitem(ll_found, 'base_amount', (round(ldb_qty/2,0) + ldb_qty_dest)*ldb_price)
					vdw_dest.setitem(ll_found, 'base_amount_ex_tax', (round(ldb_qty/2,0) + ldb_qty_dest)*ldb_price)
					vdw_dest.setitem(ll_found, 'vat_amount', (round(ldb_qty/2,0) + ldb_qty_dest)*ldb_price * ldb_vat /100)
					vdw_dest.setitem(ll_found, 'last_mdf_by', gi_userid)
					vdw_dest.setitem(ll_found, 'last_mdf_date', today() )								
				end if
				ldw_source.setitem( ll_row, 'gutter', 'N')
			end if			
			ll_row = ldw_source.find( "gutter = 'Y'",1, ldw_source.rowcount())
		LOOP
	elseif vdw_dest.dataobject = 'd_pur_retail_line_grid' and ldw_source.dataobject = 'd_purchase_line_grid'  then
		ll_row = ldw_source.find( "gutter = 'Y'", 1, ldw_source.rowcount())
		if ldw_source.ib_mouse_rdown then 
			connect using it_transaction;
		end if
		if ll_row = 0 then
			ll_row = ldw_source.getrow( )
		end if
		connect using it_transaction;
		lc_dwsetup_initial.f_init_ids_setup_dw_ex( gdb_branch , 'u_detail_pur_invoice', it_transaction)
		disconnect using it_transaction;
		li_rtn = lc_dwsetup_initial.f_get_initvalue('d_pur_invoice_line_grid','warehouse_id',gdb_branch ,la_warehouse_id )

		Do while ll_row > 0 	
			ldb_item_id = ldw_source.getitemnumber( ll_row, 'item_id')
			ll_found = vdw_dest.find("object_id = "+string(ldb_item_id) +" AND subaccount ="+string(ldb_vendor), 1, vdw_dest.rowcount())		
			if ldw_source.ib_mouse_down then
				if ll_found = 0 then
					ll_insrtRow = vdw_dest.insertrow(0)			
					connect using it_transaction;
					vdw_dest.setitem(ll_insrtRow, 'id', lbo_ins.f_create_id_ex( it_transaction ) )
					disconnect using it_transaction;
					
					vdw_dest.setitem(ll_insrtRow, 'object_ref_id', ldb_version_id)
					vdw_dest.setitem(ll_insrtRow, 'object_ref_table', 'BOOKED_SLIP' )
					vdw_dest.setitem(ll_insrtRow, 'company_id', gi_user_comp_id )
					vdw_dest.setitem(ll_insrtRow, 'branch_id', gdb_branch )
					vdw_dest.setitem(ll_insrtRow, 'created_by', gi_userid )
					vdw_dest.setitem(ll_insrtRow, 'created_date', today() )
					vdw_dest.setitem(ll_insrtRow, 'last_mdf_by', gi_userid)
					vdw_dest.setitem(ll_insrtRow, 'last_mdf_date', today() )					
					vdw_dest.setitem(ll_insrtRow, 'qty', ldw_source.getitemnumber(ll_row, 'qty') )
					vdw_dest.setitem(ll_insrtRow, 'price', ldw_source.getitemnumber(ll_row, 'price') )
					vdw_dest.setitem(ll_insrtRow, 'amount', ldw_source.getitemnumber(ll_row, 'amount') )
					vdw_dest.setitem(ll_insrtRow, 'base_amount', ldw_source.getitemnumber(ll_row, 'base_amount') )
					vdw_dest.setitem(ll_insrtRow, 'base_amount_ex_tax', ldw_source.getitemnumber(ll_row, 'base_amount_ex_tax') )
					vdw_dest.setitem(ll_insrtRow, 'vat', ldw_source.getitemnumber(ll_row, 'vat') )
					vdw_dest.setitem(ll_insrtRow, 'vat_amount', ldw_source.getitemnumber(ll_row, 'vat_amount') )
					vdw_dest.setitem(ll_insrtRow, 'object_id', ldb_item_id)
					vdw_dest.setitem(ll_insrtRow, 'line_text', ldw_source.getitemstring(ll_row, 'line_text') )
					vdw_dest.setitem(ll_insrtRow, 'subaccount', ldb_vendor)
					vdw_dest.setitem(ll_insrtRow, 'vend_short_name', ls_vendname)
					vdw_dest.setitem(ll_insrtRow, 'trans_uom', ldw_source.getitemnumber(ll_row, 'trans_uom') )
					vdw_dest.setitem(ll_insrtRow, 'uom_code', ldw_source.getitemstring(ll_row, 'uom_code') )
					vdw_dest.setitem(ll_insrtRow, 'WAREHOUSE_ID', la_warehouse_id )
					
				else
					ldb_qty = ldw_source.getitemnumber( ll_row, 'qty')
					if isnull(ldb_qty) then ldb_qty = 0
					ldb_qty_dest = vdw_dest.getitemnumber( ll_found, 'qty')
					if isnull(ldb_qty_dest) then ldb_qty_dest = 0
					vdw_dest.setitem(ll_found, 'qty', ldb_qty + ldb_qty_dest)					
					//-- cập nhật các cột liên quan: 'amount;base_amount;vat_amount;last_mdf_by;last_mdf_date' --//
					ldb_price = vdw_dest.getitemnumber( ll_found, 'price')
					ldb_vat = vdw_dest.getitemnumber( ll_found, 'vat')
					vdw_dest.setitem(ll_found, 'amount', (ldb_qty + ldb_qty_dest)*ldb_price)
					vdw_dest.setitem(ll_found, 'base_amount', (ldb_qty + ldb_qty_dest)*ldb_price)
					vdw_dest.setitem(ll_found, 'base_amount_ex_tax', (ldb_qty + ldb_qty_dest)*ldb_price)
					vdw_dest.setitem(ll_found, 'vat_amount', (ldb_qty + ldb_qty_dest)*ldb_price * ldb_vat /100)
					vdw_dest.setitem(ll_found, 'last_mdf_by', gi_userid)
					vdw_dest.setitem(ll_found, 'last_mdf_date', today() )								
				end if
				ldw_source.deleterow(ll_row )
				//-- đổi trạng thái khi kéo hết PO: full_receive --//
				if ldw_source.rowcount( ) = 0 then
					ls_dwclassname = ldw_source.classname( )
					ll_doc_row = long( mid( ls_dwclassname , pos(ls_dwclassname,'_') +1 ))
					tab_2.tabpage_2.dw_1.setitem(ll_doc_row -1 , 'document_status', 'full_receive')
				end if				
			elseif  ldw_source.ib_mouse_rdown then
				ldb_price = ldw_source.getitemnumber( ll_row, 'price')
				ldb_vat = ldw_source.getitemnumber( ll_row, 'vat')
				ldb_qty = ldw_source.getitemnumber( ll_row, 'qty')
				if isnull(ldb_qty) then ldb_qty = 0
				ldw_source.setitem( ll_row, 'qty', ldb_qty - round(ldb_qty/2,0))	
				ldw_source.setitem(ll_row, 'amount', (ldb_qty - round(ldb_qty/2,0))*ldb_price)
				ldw_source.setitem(ll_row, 'base_amount', (ldb_qty - round(ldb_qty/2,0))*ldb_price)
				ldw_source.setitem(ll_row, 'base_amount_ex_tax', (ldb_qty - round(ldb_qty/2,0))*ldb_price)
				ldw_source.setitem(ll_row, 'vat_amount',  (ldb_qty - round(ldb_qty/2,0))*ldb_price * ldb_vat /100)
				ldw_source.setitem(ll_row, 'last_mdf_by', gi_userid)
				ldw_source.setitem(ll_row, 'last_mdf_date', today() )				
												
				if ll_found = 0 then
					ll_insrtRow = vdw_dest.insertrow(0)				
					vdw_dest.setitem(ll_insrtRow, 'id',  lbo_ins.f_create_id_ex( it_transaction ) )
					vdw_dest.setitem(ll_insrtRow, 'object_ref_id', ldb_version_id)
					vdw_dest.setitem(ll_insrtRow, 'object_ref_table', 'BOOKED_SLIP' )
					vdw_dest.setitem(ll_insrtRow, 'company_id', gi_user_comp_id )
					vdw_dest.setitem(ll_insrtRow, 'branch_id', gdb_branch )
					vdw_dest.setitem(ll_insrtRow, 'created_by', gi_userid )
					vdw_dest.setitem(ll_insrtRow, 'created_date', today() )
					vdw_dest.setitem(ll_insrtRow, 'last_mdf_by', gi_userid)
					vdw_dest.setitem(ll_insrtRow, 'last_mdf_date', today() )					
					vdw_dest.setitem(ll_insrtRow, 'qty',  round(ldb_qty/2,0) )
					ldb_price = ldw_source.getitemnumber(ll_row, 'price')
					vdw_dest.setitem(ll_insrtRow, 'price',  ldb_price)
					vdw_dest.setitem(ll_insrtRow, 'amount',  round(ldb_qty/2,0) * ldb_price )
					vdw_dest.setitem(ll_insrtRow, 'base_amount',  round(ldb_qty/2,0) * ldb_price )
					vdw_dest.setitem(ll_insrtRow, 'base_amount_ex_tax',  round(ldb_qty/2,0) * ldb_price )
					ldb_vat = ldw_source.getitemnumber(ll_row, 'vat')
					vdw_dest.setitem(ll_insrtRow, 'vat', ldb_vat )
					vdw_dest.setitem(ll_insrtRow, 'vat_amount',  round(ldb_qty/2,0) * ldb_price * ldb_vat /100 )
					vdw_dest.setitem(ll_insrtRow, 'object_id', ldb_item_id)
					vdw_dest.setitem(ll_insrtRow, 'line_text', ldw_source.getitemstring(ll_row, 'line_text') )				
					vdw_dest.setitem(ll_insrtRow, 'subaccount', ldb_vendor)
					vdw_dest.setitem(ll_insrtRow, 'vend_short_name', ls_vendname)
					vdw_dest.setitem(ll_insrtRow, 'trans_uom', ldw_source.getitemnumber(ll_row, 'trans_uom') )
					vdw_dest.setitem(ll_insrtRow, 'uom_code', ldw_source.getitemstring(ll_row, 'uom_code') )
					vdw_dest.setitem(ll_insrtRow, 'WAREHOUSE_ID', la_warehouse_id )
				else			
					ldb_qty_dest = vdw_dest.getitemnumber( ll_found, 'qty')
					if isnull(ldb_qty_dest) then ldb_qty_dest = 0			
					vdw_dest.setitem(ll_found , 'qty', round(ldb_qty/2,0) + ldb_qty_dest)			
					//-- cập nhật các cột liên quan: 'amount;base_amount;vat_amount;last_mdf_by;last_mdf_date' --//
					ldb_price = vdw_dest.getitemnumber( ll_found, 'price')
					ldb_vat = vdw_dest.getitemnumber( ll_found, 'vat')
					vdw_dest.setitem(ll_found, 'amount', (round(ldb_qty/2,0) + ldb_qty_dest)*ldb_price)
					vdw_dest.setitem(ll_found, 'base_amount', (round(ldb_qty/2,0) + ldb_qty_dest)*ldb_price)
					vdw_dest.setitem(ll_found, 'base_amount_ex_tax', (round(ldb_qty/2,0) + ldb_qty_dest)*ldb_price)
					vdw_dest.setitem(ll_found, 'vat_amount', (round(ldb_qty/2,0) + ldb_qty_dest)*ldb_price * ldb_vat /100)
					vdw_dest.setitem(ll_found, 'last_mdf_by', gi_userid)
					vdw_dest.setitem(ll_found, 'last_mdf_date', today() )								
				end if
				ldw_source.setitem( ll_row, 'gutter', 'N')
			end if			
			ll_row = ldw_source.find( "gutter = 'Y'",1, ldw_source.rowcount())
		LOOP		
	end if
end if

ldw_source.f_set_gutter_rowcount( )
vdw_dest.f_set_gutter_rowcount( )
if ldw_source.ib_mouse_rdown then 
	disconnect using it_transaction;
end if
return 0
end event

event type integer e_update();string					ls_err
int						li_idx, li_cnt
t_dw_pos			ldw_line



connect using it_transaction;
if tab_2.tabpage_2.dw_1.modifiedcount( ) > 0 then
	tab_2.tabpage_2.dw_1.settransobject(it_transaction )
	if tab_2.tabpage_2.dw_1.update( ) = -1 then
		ls_err = it_transaction.sqlerrtext
		rollback using it_transaction;
		disconnect using it_transaction;
		gf_messagebox('m.c_w_purchase.closequery.01','Thông báo','Lỗi cập nhật dữ liệu PO:@'+ls_err, 'stop','ok',1)	
		return 1
	end if
end if
li_cnt = tab_2.tabpage_2.dw_1.rowcount( )
if li_cnt > 19 then li_cnt = 19

FOR li_idx = 1 to li_cnt
	ldw_line = this.f_get_dw_line(li_idx )
	if ldw_line.deletedcount( )  +  ldw_line.modifiedcount( ) > 0 then
		ldw_line.settransobject(it_transaction )
		if ldw_line.update( ) = -1 then
			ls_err = it_transaction.sqlerrtext
			rollback using it_transaction;		
			disconnect using it_transaction;
			exit
		end if
	end if
NEXT

//-- save : lấy hàng --//
if tab_1.tabpage_1.dw_1.deletedcount( )  +  tab_1.tabpage_1.dw_1.modifiedcount( ) > 0 then
	tab_1.tabpage_1.dw_1.settransobject(it_transaction )
	if tab_1.tabpage_1.dw_1.update( ) = -1 then
		ls_err = it_transaction.sqlerrtext
		rollback using it_transaction;
		disconnect using it_transaction;
		gf_messagebox('m.c_w_purchase.closequery.03','Thông báo','Lỗi cập nhật dữ liệu lấy hàng:@'+ls_err, 'stop','ok',1)	
		return 1
	else
		//-- update line--//
		if tab_1.tabpage_1.dw_2.deletedcount( )  +  tab_1.tabpage_1.dw_2.modifiedcount( ) > 0 then
			tab_1.tabpage_1.dw_2.settransobject(it_transaction )
			if tab_1.tabpage_1.dw_2.update( ) = -1 then
				ls_err = it_transaction.sqlerrtext
				rollback using it_transaction;
				disconnect using it_transaction;
				gf_messagebox('m.c_w_purchase.closequery.04','Thông báo','Lỗi cập nhật dữ liệu lấy hàng chi tiết:@'+ls_err, 'stop','ok',1)	
				return 1			
			end if
		end if
	end if
end if

//-- save : mua lẻ --//
if tab_3.tabpage_3.dw_1.deletedcount( )  +  tab_3.tabpage_3.dw_1.modifiedcount( ) > 0 then
	tab_3.tabpage_3.dw_1.settransobject(it_transaction )
	if tab_3.tabpage_3.dw_1.update( ) = -1 then
		ls_err = it_transaction.sqlerrtext
		rollback using it_transaction;
		disconnect using it_transaction;
		gf_messagebox('m.c_w_purchase.closequery.03','Thông báo','Lỗi cập nhật dữ liệu lấy hàng:@'+ls_err, 'stop','ok',1)	
		return 1
	else
		//-- update line--//
		if tab_3.tabpage_3.dw_2.deletedcount( )  +  tab_3.tabpage_3.dw_2.modifiedcount( ) > 0 then
			tab_3.tabpage_3.dw_2.settransobject(it_transaction )
			if tab_3.tabpage_3.dw_2.update( ) = -1 then
				ls_err = it_transaction.sqlerrtext
				rollback using it_transaction;
				disconnect using it_transaction;
				gf_messagebox('m.c_w_purchase.closequery.04','Thông báo','Lỗi cập nhật dữ liệu lấy hàng chi tiết:@'+ls_err, 'stop','ok',1)	
				return 1			
			end if
		end if
	end if
end if

if ls_err <> '' then	
	gf_messagebox('m.c_w_purchase.closequery.02','Thông báo','Lỗi cập nhật dữ liệu PO line:@'+ls_err, 'stop','ok',1)	
	return 1	
end if

commit using  it_transaction;
disconnect using it_transaction;
return 0


end event

public function integer f_resize ();
//-- resize tab_2 --//
tab_2.move(0 , 0)
tab_2.width = 3/5* this.width
tab_2.height = this.height - 200
//-- groupbox--//
rb_1 .move(900, 10)
rb_2 .move(rb_1.x+rb_1.width, 10)

tab_2.tabpage_2.width = tab_2.width
tab_2.tabpage_2.dw_1.move( 0, 0)
tab_2.tabpage_2.dw_1.width = tab_2.tabpage_2.width*20*1/4
tab_2.tabpage_2.dw_1.height =  tab_2.tabpage_2.height *1/7

tab_2.tabpage_2.dw_2.move( 0, tab_2.tabpage_2.dw_1.y + tab_2.tabpage_2.dw_1.height )
tab_2.tabpage_2.dw_2.width =  tab_2.width * 1/4
tab_2.tabpage_2.dw_2.height =  tab_2.tabpage_2.height *6/7 - 150

tab_2.tabpage_2.dw_3.move( tab_2.tabpage_2.dw_2.x + tab_2.tabpage_2.dw_2.width , tab_2.tabpage_2.dw_1.y + tab_2.tabpage_2.dw_1.height )
tab_2.tabpage_2.dw_3.width =  tab_2.width * 1/4
tab_2.tabpage_2.dw_3.height =  tab_2.tabpage_2.height *6/7 - 150

tab_2.tabpage_2.dw_4.move(  tab_2.tabpage_2.dw_3.x + tab_2.tabpage_2.dw_3.width, tab_2.tabpage_2.dw_1.y + tab_2.tabpage_2.dw_1.height )
tab_2.tabpage_2.dw_4.width =  tab_2.width * 1/4
tab_2.tabpage_2.dw_4.height =  tab_2.tabpage_2.height *6/7 - 150

tab_2.tabpage_2.dw_5.move(  tab_2.tabpage_2.dw_4.x + tab_2.tabpage_2.dw_4.width, tab_2.tabpage_2.dw_1.y + tab_2.tabpage_2.dw_1.height )
tab_2.tabpage_2.dw_5.width =  tab_2.width * 1/4
tab_2.tabpage_2.dw_5.height =  tab_2.tabpage_2.height *6/7 - 150

tab_2.tabpage_2.dw_6.move(  tab_2.tabpage_2.dw_5.x + tab_2.tabpage_2.dw_5.width, tab_2.tabpage_2.dw_1.y + tab_2.tabpage_2.dw_1.height )
tab_2.tabpage_2.dw_6.width =  tab_2.width * 1/4
tab_2.tabpage_2.dw_6.height =  tab_2.tabpage_2.height *6/7 - 150

tab_2.tabpage_2.dw_7.move(  tab_2.tabpage_2.dw_6.x + tab_2.tabpage_2.dw_6.width, tab_2.tabpage_2.dw_1.y + tab_2.tabpage_2.dw_1.height )
tab_2.tabpage_2.dw_7.width =  tab_2.width * 1/4
tab_2.tabpage_2.dw_7.height =  tab_2.tabpage_2.height *6/7 - 150

tab_2.tabpage_2.dw_8.move(  tab_2.tabpage_2.dw_7.x + tab_2.tabpage_2.dw_7.width, tab_2.tabpage_2.dw_1.y + tab_2.tabpage_2.dw_1.height )
tab_2.tabpage_2.dw_8.width =  tab_2.width * 1/4
tab_2.tabpage_2.dw_8.height =  tab_2.tabpage_2.height *6/7 - 150

tab_2.tabpage_2.dw_9.move(  tab_2.tabpage_2.dw_8.x + tab_2.tabpage_2.dw_8.width, tab_2.tabpage_2.dw_1.y + tab_2.tabpage_2.dw_1.height )
tab_2.tabpage_2.dw_9.width =  tab_2.width * 1/4
tab_2.tabpage_2.dw_9.height =  tab_2.tabpage_2.height *6/7 - 150

tab_2.tabpage_2.dw_10.move(  tab_2.tabpage_2.dw_9.x + tab_2.tabpage_2.dw_9.width, tab_2.tabpage_2.dw_1.y + tab_2.tabpage_2.dw_1.height )
tab_2.tabpage_2.dw_10.width =  tab_2.width * 1/4
tab_2.tabpage_2.dw_10.height =  tab_2.tabpage_2.height *6/7 - 150

tab_2.tabpage_2.dw_11.move(  tab_2.tabpage_2.dw_10.x + tab_2.tabpage_2.dw_10.width, tab_2.tabpage_2.dw_1.y + tab_2.tabpage_2.dw_1.height )
tab_2.tabpage_2.dw_11.width =  tab_2.width * 1/4
tab_2.tabpage_2.dw_11.height =  tab_2.tabpage_2.height *6/7 - 150

tab_2.tabpage_2.dw_12.move(  tab_2.tabpage_2.dw_11.x + tab_2.tabpage_2.dw_11.width, tab_2.tabpage_2.dw_1.y + tab_2.tabpage_2.dw_1.height )
tab_2.tabpage_2.dw_12.width =  tab_2.width * 1/4
tab_2.tabpage_2.dw_12.height =  tab_2.tabpage_2.height *6/7 - 150

tab_2.tabpage_2.dw_13.move(  tab_2.tabpage_2.dw_12.x + tab_2.tabpage_2.dw_12.width, tab_2.tabpage_2.dw_1.y + tab_2.tabpage_2.dw_1.height )
tab_2.tabpage_2.dw_13.width =  tab_2.width * 1/4
tab_2.tabpage_2.dw_13.height =  tab_2.tabpage_2.height *6/7 - 150

tab_2.tabpage_2.dw_14.move(  tab_2.tabpage_2.dw_13.x + tab_2.tabpage_2.dw_13.width, tab_2.tabpage_2.dw_1.y + tab_2.tabpage_2.dw_1.height )
tab_2.tabpage_2.dw_14.width =  tab_2.width * 1/4
tab_2.tabpage_2.dw_14.height =  tab_2.tabpage_2.height *6/7 - 150

tab_2.tabpage_2.dw_14.move(  tab_2.tabpage_2.dw_13.x + tab_2.tabpage_2.dw_13.width, tab_2.tabpage_2.dw_1.y + tab_2.tabpage_2.dw_1.height )
tab_2.tabpage_2.dw_14.width =  tab_2.width * 1/4
tab_2.tabpage_2.dw_14.height =  tab_2.tabpage_2.height *6/7 - 150

tab_2.tabpage_2.dw_15.move(  tab_2.tabpage_2.dw_14.x + tab_2.tabpage_2.dw_14.width, tab_2.tabpage_2.dw_1.y + tab_2.tabpage_2.dw_1.height )
tab_2.tabpage_2.dw_15.width =  tab_2.width * 1/4
tab_2.tabpage_2.dw_15.height =  tab_2.tabpage_2.height *6/7 - 200

tab_2.tabpage_2.dw_16.move(  tab_2.tabpage_2.dw_15.x + tab_2.tabpage_2.dw_15.width, tab_2.tabpage_2.dw_1.y + tab_2.tabpage_2.dw_1.height )
tab_2.tabpage_2.dw_16.width =  tab_2.width * 1/4
tab_2.tabpage_2.dw_16.height =  tab_2.tabpage_2.height *6/7 - 150

tab_2.tabpage_2.dw_17.move(  tab_2.tabpage_2.dw_16.x + tab_2.tabpage_2.dw_16.width, tab_2.tabpage_2.dw_1.y + tab_2.tabpage_2.dw_1.height )
tab_2.tabpage_2.dw_17.width =  tab_2.width * 1/4
tab_2.tabpage_2.dw_17.height =  tab_2.tabpage_2.height *6/7 - 150

tab_2.tabpage_2.dw_18.move(  tab_2.tabpage_2.dw_17.x + tab_2.tabpage_2.dw_17.width, tab_2.tabpage_2.dw_1.y + tab_2.tabpage_2.dw_1.height )
tab_2.tabpage_2.dw_18.width =  tab_2.width * 1/4
tab_2.tabpage_2.dw_18.height =  tab_2.tabpage_2.height *6/7 - 150

tab_2.tabpage_2.dw_19.move(  tab_2.tabpage_2.dw_18.x + tab_2.tabpage_2.dw_18.width, tab_2.tabpage_2.dw_1.y + tab_2.tabpage_2.dw_1.height )
tab_2.tabpage_2.dw_19.width =  tab_2.width * 1/4
tab_2.tabpage_2.dw_19.height =  tab_2.tabpage_2.height *6/7 - 150

tab_2.tabpage_2.dw_20.move(  tab_2.tabpage_2.dw_19.x + tab_2.tabpage_2.dw_19.width, tab_2.tabpage_2.dw_1.y + tab_2.tabpage_2.dw_1.height )
tab_2.tabpage_2.dw_20.width =  tab_2.width * 1/4
tab_2.tabpage_2.dw_20.height =  tab_2.tabpage_2.height *6/7 - 150

//-- resize tab_1 --//
tab_1.move(  tab_2.x + tab_2.width, 0)
tab_1.width = 1/5* this.width
tab_1.height = this.height - 200
tab_1.tabpage_1.dw_1.move( 0, 0)
tab_1.tabpage_1.dw_1.width =  tab_1.tabpage_1.width
tab_1.tabpage_1.dw_1.height =  tab_1.tabpage_1.height*1/7

tab_1.tabpage_1.dw_2.move( 0, tab_1.tabpage_1.dw_1.y  + tab_1.tabpage_1.dw_1.height )
tab_1.tabpage_1.dw_2.width =  tab_1.tabpage_1.width
tab_1.tabpage_1.dw_2.height =  tab_1.tabpage_1.height*6/7 - 150

//-- resize tab_3 --//
tab_3.move(  tab_1.x + tab_1.width, 0)
tab_3.width = 1/5* this.width
tab_3.height = this.height - 200
tab_3.tabpage_3.dw_1.move( 0, 0)
tab_3.tabpage_3.dw_1.width =  tab_3.tabpage_3.width
tab_3.tabpage_3.dw_1.height =  tab_3.tabpage_3.height*1/7

tab_3.tabpage_3.dw_2.move( 0, tab_3.tabpage_3.dw_1.y  + tab_3.tabpage_3.dw_1.height )
tab_3.tabpage_3.dw_2.width =  tab_3.tabpage_3.width
tab_3.tabpage_3.dw_2.height =  tab_3.tabpage_3.height*6/7 - 150

return 1
end function

public function t_dw_pos f_get_dw_line (integer vi_index);t_dw_pos lw_hdl


	if vi_index = 1 then
		return tab_2.tabpage_2.dw_2
	elseif  vi_index = 2 then
		return tab_2.tabpage_2.dw_3
	elseif  vi_index = 3 then
		return tab_2.tabpage_2.dw_4
	elseif  vi_index = 4 then
		return tab_2.tabpage_2.dw_5
	elseif  vi_index = 5 then
		return tab_2.tabpage_2.dw_6
	elseif  vi_index = 6 then
		return tab_2.tabpage_2.dw_7
	elseif  vi_index = 7 then
		return tab_2.tabpage_2.dw_8
	elseif  vi_index = 8 then
		return tab_2.tabpage_2.dw_9
	elseif  vi_index = 9 then
		return tab_2.tabpage_2.dw_10
	elseif  vi_index = 10 then
		return tab_2.tabpage_2.dw_11
	elseif  vi_index = 11 then
		return tab_2.tabpage_2.dw_12
	elseif  vi_index = 12 then
		return tab_2.tabpage_2.dw_13
	elseif  vi_index = 13 then
		return tab_2.tabpage_2.dw_14
	elseif  vi_index = 14 then
		return tab_2.tabpage_2.dw_15
	elseif  vi_index = 15 then
		return tab_2.tabpage_2.dw_16
	elseif  vi_index = 16 then
		return tab_2.tabpage_2.dw_17
	elseif  vi_index = 17 then
		return tab_2.tabpage_2.dw_18
	elseif  vi_index = 18 then
		return tab_2.tabpage_2.dw_19
	elseif  vi_index = 19 then
		return tab_2.tabpage_2.dw_20		
	end if

end function

public function long f_retrieve_line (ref t_transaction rt_transaction);int				li_cnt, li_idx
any 			laa_value[]
string			ls_loc
t_dw_pos	ldw_line

li_cnt = tab_2.tabpage_2.dw_1.rowcount( )

FOR li_idx = 1 to 19
	ldw_line = this.f_get_dw_line(li_idx )
	if li_idx <= li_cnt then
		laa_value[1] =  tab_2.tabpage_2.dw_1.getitemnumber(li_idx, 'document_version_id')
			
		ldw_line.f_add_where_to_origin( 'object_ref_id', laa_value[])
		ldw_line.settransobject( rt_transaction )
		ldw_line.retrieve(li_idx )
		ls_loc =  tab_2.tabpage_2.dw_1.getitemstring(li_idx, 'code')
		ls_loc =  tab_2.tabpage_2.dw_1.getitemstring(li_idx, 'document_loc')
		if isnull(ls_loc) or ls_loc ='' then 
			tab_2.tabpage_2.dw_1.setitem(li_idx, 'document_loc', string(li_idx))
		end if
	else
		ldw_line.reset( )
	end if
NEXT

return 1
end function

public function t_transaction f_get_transaction ();return it_transaction
end function

public function integer f_refresh ();any				laa_value[], laa_empty[]
int					li_cnt


	this.event e_update( )
	connect using	it_transaction;
	tab_2.tabpage_2.dw_1.settransobject( it_transaction)
	laa_value[1] = gi_user_comp_id
	laa_value[2] = gdb_branch
	if rb_1.checked then
		laa_value[3] = '=NCC-CS'
	else
		laa_value[3] =  '(NCC-CTY;NPP)'
	end if
	tab_2.tabpage_2.dw_1.f_add_where_to_origin( 'company_id;branch_id;valueset_value_code', laa_value[])
	tab_2.tabpage_2.dw_1.setsort( "document_loc a")
	li_cnt = tab_2.tabpage_2.dw_1.retrieve( )
	this.f_retrieve_line(it_transaction )
	
	//-- Lấy hàng --//
	tab_1.tabpage_1.dw_1.settransobject( it_transaction)
	laa_value[1] = gi_user_comp_id
	laa_value[2] = gdb_branch
	laa_value[3] = 25555418 //-- ID valueset lấy hàng--//
	laa_value[4] = '=new'
	tab_1.tabpage_1.dw_1.f_add_where_to_origin( 'company_id;branch_id;delivery_mode;status', laa_value[])
	li_cnt = tab_1.tabpage_1.dw_1.retrieve( )
	if li_cnt = 0 then
		//-- insert new pur_invoice_retail --//
		tab_1.tabpage_1.dw_1.event e_addrow( )
	end if
	laa_value[] = laa_empty[]
	laa_value[1] =  tab_1.tabpage_1.dw_1.getitemnumber(1, 'version_id')
	tab_1.tabpage_1.dw_2.f_add_where_to_origin( 'object_ref_id', laa_value[])
	tab_1.tabpage_1.dw_2.settransobject( it_transaction)
	tab_1.tabpage_1.dw_2.retrieve( )
	
	//-- Mua lẻ --//
	tab_3.tabpage_3.dw_1.settransobject( it_transaction)
	laa_value[1] = gi_user_comp_id
	laa_value[2] = gdb_branch
	laa_value[3] = 25555419 //-- ID valueset mua lẻ--//
	laa_value[4] = '=new'
	tab_3.tabpage_3.dw_1.f_add_where_to_origin( 'company_id;branch_id;delivery_mode;status', laa_value[])
	li_cnt = tab_3.tabpage_3.dw_1.retrieve( )
	if li_cnt = 0 then
		//-- insert new pur_invoice_retail --//
		tab_3.tabpage_3.dw_1.event e_addrow( )
	end if
	laa_value[] = laa_empty[]
	laa_value[1] =  tab_3.tabpage_3.dw_1.getitemnumber(1, 'version_id')
	tab_3.tabpage_3.dw_2.f_add_where_to_origin( 'object_ref_id', laa_value[])
	tab_3.tabpage_3.dw_2.settransobject( it_transaction)
	tab_3.tabpage_3.dw_2.retrieve( )
	
	
	disconnect using	it_transaction;	
	
	return 0
end function

on c_w_purchase.create
this.rb_2=create rb_2
this.rb_1=create rb_1
this.tab_3=create tab_3
this.tab_2=create tab_2
this.tab_1=create tab_1
this.Control[]={this.rb_2,&
this.rb_1,&
this.tab_3,&
this.tab_2,&
this.tab_1}
end on

on c_w_purchase.destroy
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.tab_3)
destroy(this.tab_2)
destroy(this.tab_1)
end on

event resize;
this.post f_resize()
end event

event open;int			li_cnt, li_idx
double	ldb_object_ref_id
any		laa_value[], laa_empty[]

t_dw_pos	ldw_line

//-- Tạo connection voi database --//
it_transaction = create t_transaction
it_transaction.dbms =	SQLCA.DBMS
it_transaction.ServerName	 = SQLCA.ServerName
it_transaction.LogId	 = SQLCA.LogId
it_transaction.LogPass 	 = SQLCA.LogPass 
it_transaction.AutoCommit 	 = false 
it_transaction.DBParm	 = SQLCA.DBParm

this.f_refresh( )
end event

event closequery;string					ls_err
int						li_idx, li_cnt
t_dw_pos			ldw_line



connect using it_transaction;
if tab_2.tabpage_2.dw_1.modifiedcount( ) > 0 then
	tab_2.tabpage_2.dw_1.settransobject(it_transaction )
	if tab_2.tabpage_2.dw_1.update( ) = -1 then
		ls_err = it_transaction.sqlerrtext
		rollback using it_transaction;
		disconnect using it_transaction;
		gf_messagebox('m.c_w_purchase.closequery.01','Thông báo','Lỗi cập nhật dữ liệu PO:@'+ls_err, 'stop','ok',1)	
		return 1
	end if
end if
li_cnt = tab_2.tabpage_2.dw_1.rowcount( )
if li_cnt > 19 then li_cnt = 19

FOR li_idx = 1 to li_cnt
	ldw_line = this.f_get_dw_line(li_idx )
	if ldw_line.deletedcount( )  +  ldw_line.modifiedcount( ) > 0 then
		ldw_line.settransobject(it_transaction )
		if ldw_line.update( ) = -1 then
			ls_err = it_transaction.sqlerrtext
			rollback using it_transaction;		
			disconnect using it_transaction;
			exit
		end if
	end if
NEXT

//-- save : lấy hàng --//
tab_1.tabpage_1.dw_1.settransobject(it_transaction )
if tab_1.tabpage_1.dw_1.update( ) = -1 then
	ls_err = it_transaction.sqlerrtext
	rollback using it_transaction;
	disconnect using it_transaction;
	gf_messagebox('m.c_w_purchase.closequery.03','Thông báo','Lỗi cập nhật dữ liệu lấy hàng:@'+ls_err, 'stop','ok',1)	
	return 1
else
	//-- update line--//
	tab_1.tabpage_1.dw_2.settransobject(it_transaction )
	if tab_1.tabpage_1.dw_2.update( ) = -1 then
		ls_err = it_transaction.sqlerrtext
		rollback using it_transaction;
		disconnect using it_transaction;
		gf_messagebox('m.c_w_purchase.closequery.04','Thông báo','Lỗi cập nhật dữ liệu lấy hàng chi tiết:@'+ls_err, 'stop','ok',1)	
		return 1			
	end if
end if

//-- save : mua lẻ --//
tab_3.tabpage_3.dw_1.settransobject(it_transaction )
if tab_3.tabpage_3.dw_1.update( ) = -1 then
	ls_err = it_transaction.sqlerrtext
	rollback using it_transaction;
	disconnect using it_transaction;
	gf_messagebox('m.c_w_purchase.closequery.03','Thông báo','Lỗi cập nhật dữ liệu lấy hàng:@'+ls_err, 'stop','ok',1)	
	return 1
else
	//-- update line--//
	tab_3.tabpage_3.dw_2.settransobject(it_transaction )
	if tab_3.tabpage_3.dw_2.update( ) = -1 then
		ls_err = it_transaction.sqlerrtext
		rollback using it_transaction;
		disconnect using it_transaction;
		gf_messagebox('m.c_w_purchase.closequery.04','Thông báo','Lỗi cập nhật dữ liệu lấy hàng chi tiết:@'+ls_err, 'stop','ok',1)	
		return 1			
	end if
end if


if ls_err <> '' then	
	gf_messagebox('m.c_w_purchase.closequery.02','Thông báo','Lỗi cập nhật dữ liệu PO line:@'+ls_err, 'stop','ok',1)	
	return 1	
end if
commit using  it_transaction;
disconnect using it_transaction;
return 0


end event

event key;
if key = KeyEscape! then
	close(this)
elseif key = KeyF5! then
	this.f_refresh( )
end if
end event

type rb_2 from radiobutton within c_w_purchase
integer x = 1710
integer y = 64
integer width = 485
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Công ty+NPP"
borderstyle borderstyle = styleraised!
end type

event clicked;parent.f_refresh()
end event

type rb_1 from radiobutton within c_w_purchase
integer x = 2693
integer y = 56
integer width = 457
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "NCC-CS"
boolean checked = true
borderstyle borderstyle = styleraised!
end type

event clicked;parent.f_refresh()
end event

type tab_3 from tab within c_w_purchase
integer x = 2135
integer y = 188
integer width = 1152
integer height = 864
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_3 tabpage_3
end type

on tab_3.create
this.tabpage_3=create tabpage_3
this.Control[]={this.tabpage_3}
end on

on tab_3.destroy
destroy(this.tabpage_3)
end on

type tabpage_3 from c_tp_purchase_3 within tab_3
integer x = 18
integer y = 112
integer width = 1115
integer height = 736
string text = "Mua lẻ"
end type

type tab_2 from tab within c_w_purchase
integer x = 841
integer y = 152
integer width = 1152
integer height = 864
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_2 tabpage_2
end type

on tab_2.create
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_2}
end on

on tab_2.destroy
destroy(this.tabpage_2)
end on

type tabpage_2 from c_tp_purchase_2 within tab_2
integer x = 18
integer y = 112
integer width = 1115
integer height = 736
string text = "PO đang làm kế hoạch"
end type

type tab_1 from tab within c_w_purchase
integer x = 37
integer y = 64
integer width = 791
integer height = 864
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tabpage_1)
end on

type tabpage_1 from c_tp_purchase_1 within tab_1
integer x = 18
integer y = 112
integer width = 754
integer height = 736
string text = "Lấy hàng"
end type

