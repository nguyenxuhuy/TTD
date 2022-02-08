$PBExportHeader$c_w_return.srw
forward
global type c_w_return from window
end type
type dw_filter from t_dw_pos within c_w_return
end type
type cb_cancel from t_cb within c_w_return
end type
type cb_ok from t_cb within c_w_return
end type
type dw_find_bill from t_dw_pos within c_w_return
end type
end forward

global type c_w_return from window
integer width = 4672
integer height = 1880
boolean titlebar = true
string title = "Bill trả hàng"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event e_action_focus_down ( )
dw_filter dw_filter
cb_cancel cb_cancel
cb_ok cb_ok
dw_find_bill dw_find_bill
end type
global c_w_return c_w_return

type variables
t_transaction 			it_transaction
double					idb_cust_id
end variables

event e_action_focus_down();dw_find_bill.setfocus( )

end event

on c_w_return.create
this.dw_filter=create dw_filter
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.dw_find_bill=create dw_find_bill
this.Control[]={this.dw_filter,&
this.cb_cancel,&
this.cb_ok,&
this.dw_find_bill}
end on

on c_w_return.destroy
destroy(this.dw_filter)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.dw_find_bill)
end on

event key;if key= keyEnter! then
	if cb_ok.ib_focus then
		cb_ok.event clicked( )
		return 1
	elseif cb_cancel.ib_focus then
		cb_cancel.event clicked( )
		return 1
	else
		Send(Handle(this),256,9,Long(0,0))
		RETURN 1
	end if
end if
end event

event open;string		ls_backgoundcolor,ls_currentrowcolor, ls_modstring_currentrow, ls_modstring_color, lsa_colname[], ls_rtn
int			li_cnt, li_idx
it_transaction = message.powerobjectparm
setnull(message.powerobjectparm)

dw_filter.insertrow( 0)
dw_find_bill.settransobject( it_transaction )
dw_find_bill.retrieve(gi_user_comp_id, gdb_branch )
dw_find_bill.f_set_gutter_rowcount( )
dw_find_bill.inv_sort.f_setrequestor( dw_find_bill)
dw_find_bill.inv_sort.f_init( )

ls_backgoundcolor = string(536870912)
ls_currentrowcolor =string(rgb(255,231,99)) //vàng nâu
ls_modstring_currentrow = "536870912~~tif(getrow()=currentrow(),"+ls_currentrowcolor+","+ls_backgoundcolor+")"

li_cnt = dw_find_bill.f_getcolumns_visible(lsa_colname[] )
FOR li_idx = 1 to li_cnt
	ls_modstring_color =  lsa_colname[li_idx]+ '.background.mode=0 '+ lsa_colname[li_idx]+".background.color=~'"+ ls_modstring_currentrow+ "~'"
	ls_rtn = dw_find_bill.modify( ls_modstring_color)
NEXT
end event

type dw_filter from t_dw_pos within c_w_return
integer x = 14
integer y = 4
integer width = 3877
integer height = 132
integer taborder = 10
string dataobject = "d_filter_pos_form"
end type

event editchanged;call super::editchanged;string					ls_filterstring, ls_text

b_obj_instantiate	lobj_ins

ls_text = data
ls_filterstring = lobj_ins.f_get_filterstring( dw_find_bill , ls_text , 'doc_search')
dw_find_bill.setfilter( ls_filterstring)
dw_find_bill.filter( )
dw_find_bill.f_set_gutter_rowcount( )
end event

event e_dwnkey;//-- Override --//
if key= keydownarrow! and keyflags = 2 then
	parent.event e_action_focus_down( )
end if
end event

event losefocus;call super::losefocus;this.settext( '--------')
end event

event getfocus;call super::getfocus;this.settext( '')
end event

type cb_cancel from t_cb within c_w_return
integer x = 2551
integer y = 1644
integer taborder = 30
string text = "&Hủy"
end type

event clicked;call super::clicked;

close(parent)
end event

type cb_ok from t_cb within c_w_return
integer x = 2071
integer y = 1644
integer taborder = 20
string text = "&Trả hàng"
end type

event clicked;call super::clicked;long				ll_row
t_ds_db			lds_return

lds_return = create t_ds_db
lds_return.dataobject = dw_find_bill.dataobject

dw_find_bill.accepttext()

ll_row = dw_find_bill.find( "gutter = 'Y'", 1, dw_find_bill.rowcount( ) )
DO while ll_row > 0 
	dw_find_bill.rowscopy( ll_row, ll_row, primary!, lds_return, lds_return.rowcount( )+1 , primary!)
	ll_row = dw_find_bill.find( "gutter = 'Y'", ll_row + 1, dw_find_bill.rowcount( ) + 1)
LOOP

closewithreturn(parent, lds_return)
end event

type dw_find_bill from t_dw_pos within c_w_return
integer y = 144
integer width = 6240
integer height = 1460
integer taborder = 10
string dataobject = "d_find_bill_return_grid"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event e_dwnkey;//-- Override --//

long			ll_row
int				li_rtn_day
string			ls_code, ls_data
date			ld_trans

if key= keyEnter! then
	this.accepttext( )
	Send(Handle(this),256,9,Long(0,0))
	RETURN 1
elseif key =keyspacebar! then
	ls_data = this.getitemstring( this.getrow(), 'gutter')
	if ls_data = 'N' or isnull(ls_data) then		
		ld_trans = date(this.getitemdatetime(  this.getrow(), 'document_date') )
		li_rtn_day = DaysAfter ( ld_trans, today() )
		if li_rtn_day <= 7 then
			this.setitem(  this.getrow(), 'return_qty', this.getitemnumber(  this.getrow(), 'qty') )
			this.setitem(  this.getrow(), 'return_price', this.getitemnumber(  this.getrow(), 'price') )
			this.setitem( this.getrow(), 'gutter', 'Y')
			//-- đổi màu:đỏ --//
			if this.find( "gutter = 'N' or isnull(gutter)", 1, this.rowcount()) = 0 then
				this.modify("gutter_t.color  = '" +string(rgb(255,0,0))+"'")
			end if			
		else			
			gf_messagebox('m.c_w_pos.dw_find_bill.e_dwnkey.01','Thông báo','Bill quá hạn 7 ngày không được trả !' + string(ld_trans),'exclamation','ok',1)
			return 0
		end if		
	else
		this.setitem( this.getrow(), 'gutter', 'N')
		this.setitem(  this.getrow(), 'return_qty', 0 )
		this.setitem(  this.getrow(), 'return_price', 0)		
		//-- đổi màu:đen --//
		if this.find( "gutter = 'Y'", 1, this.rowcount()) = 0 then
			this.modify("gutter_t.color  = '" +string(rgb(0,0,255))+"'")
		end if		
	end if
elseif key = KeyDownArrow! and keyflags = 2 then
	parent.event e_action_focus_down()
else
end if


end event

event clicked;call super::clicked;date			ld_trans
int				li_rtn_day
long			ll_row
string			ls_data

if dwo.name = 'gutter' then
	ls_data = this.getitemstring( row, 'gutter')
	if ls_data = 'N' or isnull(ls_data) then
//		this.setitem( row, 'gutter', 'Y')
		if idb_cust_id = 0 or isnull(idb_cust_id) then
			idb_cust_id = this.getitemnumber( row, 'cust_id')
		else
			if idb_cust_id <> this.getitemnumber( row, 'cust_id') then
				gf_messagebox('m.c_w_pos.e_action_return.01','Thông báo','Không được trả 2 bill có khách hàng khác nhau !','exclamation','ok',1)
				return 
			end if
		end if
		ld_trans = date(this.getitemdatetime( row, 'document_date') )
		li_rtn_day = DaysAfter ( ld_trans, today() )
		if li_rtn_day <= 7 then
			this.setitem( row, 'return_qty', this.getitemnumber( row, 'qty') )
			this.setitem( row, 'return_price', this.getitemnumber( row, 'price') )
		else			
			gf_messagebox('m.c_w_pos.e_action_return.02','Thông báo','Bill quá hạn 7 ngày không được trả !' + string(ld_trans),'exclamation','ok',1)
			this.post setitem( row, 'gutter', 'N')
			return
		end if
	else //-- tick bỏ--//
//		this.setitem( row, 'gutter', 'N')
		this.setitem( row, 'return_qty', 0 )
		this.setitem( row, 'return_price',0 )
		if this.find( "gutter = 'Y'", 1, this.rowcount()) = 0 then
			idb_cust_id = 0
		end if
	end if
elseif dwo.name = 'gutter_t' then //
	if this.describe( "gutter_t.color") = string(rgb(255,0,0))  then //-- màu đỏ là đã chọn tất cả--//
		FOR ll_row = 1 to this.rowcount( )
			this.setitem( ll_row, 'gutter', 'N')
			this.setitem( ll_row, 'return_qty', 0 )
			this.setitem( ll_row, 'return_price',0 )			
		NEXT		
		idb_cust_id = 0
		this.modify("gutter_t.color  = '" +string(rgb(0,0,255))+"'")
	else
		FOR ll_row = 1 to this.rowcount( )
			ld_trans = date(this.getitemdatetime( ll_row, 'document_date') )
			li_rtn_day = DaysAfter ( ld_trans, today() )
			if li_rtn_day <= 7 then
				this.setitem( ll_row, 'return_qty', this.getitemnumber( ll_row, 'qty') )
				this.setitem( ll_row, 'return_price', this.getitemnumber( ll_row, 'price') )
				this.setitem( ll_row, 'gutter', 'Y')	
			else			
				gf_messagebox('m.c_w_pos.e_action_return.02','Thông báo','Bill quá hạn 7 ngày không được trả !' + string(ld_trans),'exclamation','ok',1)
				return 0
			end if								
		NEXT						
		this.modify("gutter_t.color  = '" +string(rgb(255,0,0))+"'")
	end if
end if
end event

event getfocus;call super::getfocus;if dw_find_bill.rowcount( ) > 0 then
	dw_find_bill.setcolumn( 'return_qty')
end if
	
end event

event itemerror;call super::itemerror;return 1
end event

event itemchanged;call super::itemchanged;
if dwo.name = 'gutter' then
	if data = 'Y' then 
		this.setitem(row, 'return_qty' , this.getitemnumber( row, 'qty'))
		this.setitem(row, 'return_price' , this.getitemnumber( row, 'price'))
	else
		this.setitem(row, 'return_qty' , 0)
		this.setitem(row, 'return_price' , 0)
	end if
elseif dwo.name = 'return_qty' then
	if double(data) > this.getitemnumber( row, 'qty') then
		gf_messagebox('m.c_w_return.dw_find_bill.itemchanged_01','Thông báo','Số lượng trả không được lớn hơn số lượng mua','exclamation','ok',1)
		return 1
	end if
elseif dwo.name = 'return_price' then
	if double(data) > this.getitemnumber( row, 'price') then
		gf_messagebox('m.c_w_return.dw_find_bill.itemchanged_02','Thông báo','Giá trả không được lớn hơn giá mua','exclamation','ok',1)
		return 1
	end if	
end if
end event

