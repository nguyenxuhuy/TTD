$PBExportHeader$c_w_findbill.srw
forward
global type c_w_findbill from window
end type
type cb_exit from t_cb within c_w_findbill
end type
type cb_adjust from t_cb within c_w_findbill
end type
type cb_print from commandbutton within c_w_findbill
end type
type dw_filter from t_dw_pos within c_w_findbill
end type
type cb_ok from t_cb within c_w_findbill
end type
type dw_find_bill from t_dw_pos within c_w_findbill
end type
end forward

global type c_w_findbill from window
integer width = 4672
integer height = 2008
boolean titlebar = true
string title = "Lịch sử bill"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event e_action_focus_down ( )
cb_exit cb_exit
cb_adjust cb_adjust
cb_print cb_print
dw_filter dw_filter
cb_ok cb_ok
dw_find_bill dw_find_bill
end type
global c_w_findbill c_w_findbill

type variables
t_transaction 			it_transaction
double					idb_cust_id
end variables

event e_action_focus_down();dw_find_bill.setfocus( )

end event

on c_w_findbill.create
this.cb_exit=create cb_exit
this.cb_adjust=create cb_adjust
this.cb_print=create cb_print
this.dw_filter=create dw_filter
this.cb_ok=create cb_ok
this.dw_find_bill=create dw_find_bill
this.Control[]={this.cb_exit,&
this.cb_adjust,&
this.cb_print,&
this.dw_filter,&
this.cb_ok,&
this.dw_find_bill}
end on

on c_w_findbill.destroy
destroy(this.cb_exit)
destroy(this.cb_adjust)
destroy(this.cb_print)
destroy(this.dw_filter)
destroy(this.cb_ok)
destroy(this.dw_find_bill)
end on

event key;if key= keyEnter! then
	if cb_ok.ib_focus then
		cb_ok.event clicked( )
		return 1
	elseif cb_exit.ib_focus then
		cb_exit.event clicked( )
		return 1
	else
		Send(Handle(this),256,9,Long(0,0))
		RETURN 1
	end if
end if
end event

event open;string		ls_modstring_currentrow, ls_backgoundcolor, ls_currentrowcolor, lsa_colname[], ls_rtn, ls_modstring_color
int			li_cnt, li_idx

it_transaction = message.powerobjectparm
setnull(message.powerobjectparm)

dw_filter.insertrow( 0)
dw_find_bill.settransobject( it_transaction )
dw_find_bill.retrieve(gi_user_comp_id, gdb_branch  )

//dw_find_bill.inv_sort.f_setrequestor( dw_find_bill)
//dw_find_bill.inv_sort.f_init( )

ls_backgoundcolor = string(536870912)
ls_currentrowcolor =string(rgb(255,231,99)) //vàng nâu
ls_modstring_currentrow = "536870912~~tif(getrow()=currentrow(),"+ls_currentrowcolor+","+ls_backgoundcolor+")"

li_cnt = dw_find_bill.f_getcolumns_visible(lsa_colname[] )
FOR li_idx = 1 to li_cnt
	ls_modstring_color =  lsa_colname[li_idx]+ '.background.mode=0 '+ lsa_colname[li_idx]+".background.color=~'"+ ls_modstring_currentrow+ "~'"
	ls_rtn = dw_find_bill.modify( ls_modstring_color)
NEXT


end event

type cb_exit from t_cb within c_w_findbill
integer x = 2825
integer y = 1696
integer taborder = 60
string text = "&Đóng"
end type

event clicked;call super::clicked;close(parent)
end event

type cb_adjust from t_cb within c_w_findbill
integer x = 2386
integer y = 1696
integer taborder = 50
string text = "&Sửa bill"
end type

event clicked;call super::clicked;long				ll_row
double 			ldb_doc_id
date				ld_doc_date
t_ds_db			lds_return

lds_return = create t_ds_db
lds_return.dataobject = dw_find_bill.dataobject

dw_find_bill.accepttext( )

ll_row = dw_find_bill.find( "gutter = 'Y'", 1, dw_find_bill.rowcount( ) )
if ll_row > 0 then
	ld_doc_date = date(dw_find_bill.getitemdatetime(ll_row, "document_date"))
	if ld_doc_date <> gd_session_date then
		gf_messagebox('m.c_w_findbill.cb_adjust.clicked.01','Thông báo','Chỉ được chỉnh sửa bill của ngày hôm nay','exclamation','ok',1)
		return 0
	end if
	ldb_doc_id = dw_find_bill.getitemnumber(ll_row, "document_id")
	
	dw_find_bill.rowscopy( ll_row, ll_row, primary!, lds_return, lds_return.rowcount( ) + 1 , primary!)
	lds_return.setitem(lds_return.rowcount( ) ,'document_ref_code','adjust')
	ll_row = dw_find_bill.find( "document_id =" + string(ldb_doc_id), ll_row + 1, dw_find_bill.rowcount( ) + 1)
	DO while ll_row > 0		
		dw_find_bill.rowscopy( ll_row, ll_row, primary!, lds_return, lds_return.rowcount( ) + 1 , primary!)
//		lds_return.setitem(lds_return.rowcount( ) ,'document_ref_code','adjust')
		ll_row = dw_find_bill.find( "document_id =" + string(ldb_doc_id), ll_row + 1, dw_find_bill.rowcount( ) + 1)
	LOOP
end if
closewithreturn(parent, lds_return)
end event

type cb_print from commandbutton within c_w_findbill
integer x = 1490
integer y = 1696
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&In lại bill"
end type

event clicked;double			ldb_bill_id
long				ll_row
t_ds_db			lds_bill_print

//-- In bill --//
ll_row = dw_find_bill.find("gutter = 'Y'" ,1 , dw_find_bill.rowcount())
if ll_row > 0 then
	lds_bill_print = create t_ds_db
//	lds_bill_print.dataobject = 'dv_bill2_form'
	lds_bill_print.dataobject = 'dv_bill_copy_form'
	lds_bill_print.Modify("DataWindow.Print.Paper.Size=256") //-- size in milimet --//
	lds_bill_print.Modify("DataWindow.Print.CustomPage.Width=80") 
	lds_bill_print.Modify("DataWindow.Print.Margin.Top= 5")
	lds_bill_print.settransobject( sqlca)
	Do while ll_row > 0
		ldb_bill_id = dw_find_bill.getitemnumber( ll_row, 'document_id')	
		
		lds_bill_print.retrieve( ldb_bill_id)
		if lds_bill_print.retrieve( ldb_bill_id) > 0 then
//			openwithparm(c_w_test, lds_bill_print)
			lds_bill_print.print(false,false)	
		end if	
		ll_row = dw_find_bill.find("gutter = 'Y' and document_id <> "+string(ldb_bill_id) , ll_row+ 1 , dw_find_bill.rowcount() +1)	
	loop
end if
end event

type dw_filter from t_dw_pos within c_w_findbill
integer x = 14
integer y = 4
integer width = 3877
integer height = 132
integer taborder = 10
string dataobject = "d_filter_pos_form"
end type

event editchanged;call super::editchanged;string					ls_filterstring, ls_text

b_obj_instantiate	lobj_ins

if isnull(data) or data = '' then
	dw_find_bill.setfilter( '')
	dw_find_bill.filter( )
	dw_find_bill.f_set_gutter_rowcount( )		
else
	ls_text = data
	ls_filterstring = lobj_ins.f_get_filterstring( dw_find_bill , ls_text , 'doc_search')
	dw_find_bill.setfilter( ls_filterstring)
	dw_find_bill.filter( )
	dw_find_bill.f_set_gutter_rowcount( )	
end if

end event

event e_dwnkey;//-- override--//

if key= keydownarrow! and keyflags = 2 then
	parent.event e_action_focus_down( )
end if
end event

event losefocus;call super::losefocus;this.settext( '--------')
end event

event getfocus;call super::getfocus;this.settext('')
end event

type cb_ok from t_cb within c_w_findbill
integer x = 1934
integer y = 1696
integer taborder = 40
string text = "&Nạp"
end type

event clicked;call super::clicked;long				ll_row
t_ds_db			lds_return

lds_return = create t_ds_db
lds_return.dataobject = dw_find_bill.dataobject

dw_find_bill.accepttext( )

ll_row = dw_find_bill.find( "gutter = 'Y'", 1, dw_find_bill.rowcount( ) )
DO while ll_row > 0 
	dw_find_bill.rowscopy( ll_row, ll_row, primary!, lds_return, lds_return.rowcount( )+1 , primary!)
	ll_row = dw_find_bill.find( "gutter = 'Y'", ll_row + 1, dw_find_bill.rowcount( ) + 1)
LOOP

closewithreturn(parent, lds_return)
end event

type dw_find_bill from t_dw_pos within c_w_findbill
integer y = 144
integer width = 6240
integer height = 1460
integer taborder = 20
string dataobject = "d_find_bill_grid"
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
elseif key = KeyDownArrow! and keyflags = 2 then
	parent.event e_action_focus_down()
else
end if


end event

event clicked;
long			ll_row
string			ls_code, ls_data

if dwo.name = 'gutter' then
	ls_data = this.getitemstring( row, 'gutter')
	if ls_data = 'N' or isnull(ls_data) then		 
		ls_code =  this.getitemstring( row, 'code')
		if this.find( "gutter = 'Y'", 1, this.rowcount()) = 0 then
			ll_row = this.find( "code = '" + string(ls_code)+"'" , 1, this.rowcount()) 
			Do while ll_row > 0
				if ll_row <> row then	this.setitem( ll_row, 'gutter', 'Y')
				ll_row = this.find( "code = '" + string(ls_code)+"'" , ll_row + 1, this.rowcount() + 1) 
			loop
		end if
	end if
elseif dwo.name = 'gutter_t' then //
	if this.describe( "gutter_t.color") = string(rgb(255,0,0))  then //-- màu đỏ là đã chọn tất cả--//
		FOR ll_row = 1 to this.rowcount( )
			this.setitem( ll_row, 'gutter', 'N')	
		NEXT		
		this.modify("gutter_t.color  = '" +string(rgb(0,0,255))+"'")
	else
		FOR ll_row = 1 to this.rowcount( )
			this.setitem( ll_row, 'gutter', 'Y')						
		NEXT						
		this.modify("gutter_t.color  = '" +string(rgb(255,0,0))+"'")
	end if
end if

end event

event getfocus;call super::getfocus;if dw_find_bill.rowcount( ) > 0 then
	dw_find_bill.setcolumn( 'retail_price')
end if
end event

event itemchanged;call super::itemchanged;if dwo.name = 'retail_price' then
	if not (double(data) > 0 ) then
		gf_messagebox('m.c_w_findbill.dw_find_bill_itemchanged_01','Thông báo','Giá bán phải > 0','exclamation','ok',1)
		return 1
	end if
end if
end event

event itemerror;call super::itemerror;return 1
end event

event doubleclicked;call super::doubleclicked;long				ll_row
string				ls_code
t_ds_db			lds_load_bill

if  row > 0 then
	if dwo.name = 'code' then
		ls_code = this.getitemstring( row,  'code' )
		if ls_code <> '' and not isnull(ls_code) then
			lds_load_bill = create t_ds_db
			lds_load_bill.dataobject = 'ds_load_bill'
			lds_load_bill.settransobject(it_transaction ) 
			if lds_load_bill.retrieve(gi_user_comp_id, gdb_branch,  ls_code) > 0 then
				closewithreturn(parent, lds_load_bill)
			end if
		end if
	end if
end if

end event

