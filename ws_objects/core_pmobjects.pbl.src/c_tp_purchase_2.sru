$PBExportHeader$c_tp_purchase_2.sru
forward
global type c_tp_purchase_2 from t_tp
end type
type dw_20 from t_dw_pos within c_tp_purchase_2
end type
type dw_19 from t_dw_pos within c_tp_purchase_2
end type
type dw_18 from t_dw_pos within c_tp_purchase_2
end type
type dw_17 from t_dw_pos within c_tp_purchase_2
end type
type dw_16 from t_dw_pos within c_tp_purchase_2
end type
type dw_15 from t_dw_pos within c_tp_purchase_2
end type
type dw_14 from t_dw_pos within c_tp_purchase_2
end type
type dw_13 from t_dw_pos within c_tp_purchase_2
end type
type dw_12 from t_dw_pos within c_tp_purchase_2
end type
type dw_11 from t_dw_pos within c_tp_purchase_2
end type
type dw_10 from t_dw_pos within c_tp_purchase_2
end type
type dw_9 from t_dw_pos within c_tp_purchase_2
end type
type dw_8 from t_dw_pos within c_tp_purchase_2
end type
type dw_7 from t_dw_pos within c_tp_purchase_2
end type
type dw_6 from t_dw_pos within c_tp_purchase_2
end type
type dw_5 from t_dw_pos within c_tp_purchase_2
end type
type dw_4 from t_dw_pos within c_tp_purchase_2
end type
type dw_3 from t_dw_pos within c_tp_purchase_2
end type
type dw_2 from t_dw_pos within c_tp_purchase_2
end type
type dw_1 from t_dw_pos within c_tp_purchase_2
end type
end forward

global type c_tp_purchase_2 from t_tp
integer width = 3474
integer height = 2540
boolean vscrollbar = false
dw_20 dw_20
dw_19 dw_19
dw_18 dw_18
dw_17 dw_17
dw_16 dw_16
dw_15 dw_15
dw_14 dw_14
dw_13 dw_13
dw_12 dw_12
dw_11 dw_11
dw_10 dw_10
dw_9 dw_9
dw_8 dw_8
dw_7 dw_7
dw_6 dw_6
dw_5 dw_5
dw_4 dw_4
dw_3 dw_3
dw_2 dw_2
dw_1 dw_1
end type
global c_tp_purchase_2 c_tp_purchase_2

on c_tp_purchase_2.create
int iCurrent
call super::create
this.dw_20=create dw_20
this.dw_19=create dw_19
this.dw_18=create dw_18
this.dw_17=create dw_17
this.dw_16=create dw_16
this.dw_15=create dw_15
this.dw_14=create dw_14
this.dw_13=create dw_13
this.dw_12=create dw_12
this.dw_11=create dw_11
this.dw_10=create dw_10
this.dw_9=create dw_9
this.dw_8=create dw_8
this.dw_7=create dw_7
this.dw_6=create dw_6
this.dw_5=create dw_5
this.dw_4=create dw_4
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_20
this.Control[iCurrent+2]=this.dw_19
this.Control[iCurrent+3]=this.dw_18
this.Control[iCurrent+4]=this.dw_17
this.Control[iCurrent+5]=this.dw_16
this.Control[iCurrent+6]=this.dw_15
this.Control[iCurrent+7]=this.dw_14
this.Control[iCurrent+8]=this.dw_13
this.Control[iCurrent+9]=this.dw_12
this.Control[iCurrent+10]=this.dw_11
this.Control[iCurrent+11]=this.dw_10
this.Control[iCurrent+12]=this.dw_9
this.Control[iCurrent+13]=this.dw_8
this.Control[iCurrent+14]=this.dw_7
this.Control[iCurrent+15]=this.dw_6
this.Control[iCurrent+16]=this.dw_5
this.Control[iCurrent+17]=this.dw_4
this.Control[iCurrent+18]=this.dw_3
this.Control[iCurrent+19]=this.dw_2
this.Control[iCurrent+20]=this.dw_1
end on

on c_tp_purchase_2.destroy
call super::destroy
destroy(this.dw_20)
destroy(this.dw_19)
destroy(this.dw_18)
destroy(this.dw_17)
destroy(this.dw_16)
destroy(this.dw_15)
destroy(this.dw_14)
destroy(this.dw_13)
destroy(this.dw_12)
destroy(this.dw_11)
destroy(this.dw_10)
destroy(this.dw_9)
destroy(this.dw_8)
destroy(this.dw_7)
destroy(this.dw_6)
destroy(this.dw_5)
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_1)
end on

type dw_20 from t_dw_pos within c_tp_purchase_2
integer x = 2414
integer y = 1720
integer taborder = 80
string dataobject = "d_purchase_line_grid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean ib_drag = true
end type

event e_dwnkey;//-- Override --//

long				ll_row
window			lw_parent

if key = KeyF5! then
	 this.f_getparentwindow(lw_parent )
	 lw_parent.dynamic f_refresh()
elseif key = KeyDelete! then
	ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	Do while ll_row > 0 
		this.deleterow(ll_row)
		ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	LOOP
end if
end event

event itemchanged;call super::itemchanged;dec				ldc_qty, ldc_price, ldc_vat


choose case dwo.name
	case 'qty','price','vat'
		if dwo.name = 'qty' then
			ldc_qty = dec(data)
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'price' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = dec(data)
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'vat' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = dec(data)
		end if		
		this.setitem( row, 'amount', ldc_qty*ldc_price)
		this.setitem( row, 'base_amount',  ldc_qty*ldc_price)
		this.setitem( row, 'base_amount_ex_tax',  ldc_qty*ldc_price)
		this.setitem( row, 'vat_amount',  round(ldc_qty*ldc_price*ldc_vat/100, 0))		
end choose

end event

type dw_19 from t_dw_pos within c_tp_purchase_2
integer x = 1600
integer y = 1756
integer taborder = 70
string dataobject = "d_purchase_line_grid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean ib_drag = true
end type

event e_dwnkey;//-- Override --//

long				ll_row
window			lw_parent

if key = KeyF5! then
	 this.f_getparentwindow(lw_parent )
	 lw_parent.dynamic f_refresh()
elseif key = KeyDelete! then
	ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	Do while ll_row > 0 
		this.deleterow(ll_row)
		ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	LOOP
end if
end event

event itemchanged;call super::itemchanged;dec				ldc_qty, ldc_price, ldc_vat


choose case dwo.name
	case 'qty','price','vat'
		if dwo.name = 'qty' then
			ldc_qty = dec(data)
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'price' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = dec(data)
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'vat' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = dec(data)
		end if		
		this.setitem( row, 'amount', ldc_qty*ldc_price)
		this.setitem( row, 'base_amount',  ldc_qty*ldc_price)
		this.setitem( row, 'base_amount_ex_tax',  ldc_qty*ldc_price)
		this.setitem( row, 'vat_amount',  round(ldc_qty*ldc_price*ldc_vat/100, 0))		
end choose

end event

type dw_18 from t_dw_pos within c_tp_purchase_2
integer x = 846
integer y = 1724
integer taborder = 60
string dataobject = "d_purchase_line_grid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean ib_drag = true
end type

event e_dwnkey;//-- Override --//

long				ll_row
window			lw_parent

if key = KeyF5! then
	 this.f_getparentwindow(lw_parent )
	 lw_parent.dynamic f_refresh()
elseif key = KeyDelete! then
	ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	Do while ll_row > 0 
		this.deleterow(ll_row)
		ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	LOOP
end if
end event

event itemchanged;call super::itemchanged;dec				ldc_qty, ldc_price, ldc_vat


choose case dwo.name
	case 'qty','price','vat'
		if dwo.name = 'qty' then
			ldc_qty = dec(data)
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'price' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = dec(data)
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'vat' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = dec(data)
		end if		
		this.setitem( row, 'amount', ldc_qty*ldc_price)
		this.setitem( row, 'base_amount',  ldc_qty*ldc_price)
		this.setitem( row, 'base_amount_ex_tax',  ldc_qty*ldc_price)
		this.setitem( row, 'vat_amount',  round(ldc_qty*ldc_price*ldc_vat/100, 0))		
end choose

end event

type dw_17 from t_dw_pos within c_tp_purchase_2
integer x = 133
integer y = 1712
integer taborder = 50
string dataobject = "d_purchase_line_grid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean ib_drag = true
end type

event e_dwnkey;//-- Override --//

long				ll_row
window			lw_parent

if key = KeyF5! then
	 this.f_getparentwindow(lw_parent )
	 lw_parent.dynamic f_refresh()
elseif key = KeyDelete! then
	ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	Do while ll_row > 0 
		this.deleterow(ll_row)
		ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	LOOP
end if
end event

event itemchanged;call super::itemchanged;dec				ldc_qty, ldc_price, ldc_vat


choose case dwo.name
	case 'qty','price','vat'
		if dwo.name = 'qty' then
			ldc_qty = dec(data)
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'price' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = dec(data)
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'vat' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = dec(data)
		end if		
		this.setitem( row, 'amount', ldc_qty*ldc_price)
		this.setitem( row, 'base_amount',  ldc_qty*ldc_price)
		this.setitem( row, 'base_amount_ex_tax',  ldc_qty*ldc_price)
		this.setitem( row, 'vat_amount',  round(ldc_qty*ldc_price*ldc_vat/100, 0))		
end choose

end event

type dw_16 from t_dw_pos within c_tp_purchase_2
integer x = 3035
integer y = 1284
integer taborder = 60
string dataobject = "d_purchase_line_grid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean ib_drag = true
end type

event e_dwnkey;//-- Override --//

long				ll_row
window			lw_parent

if key = KeyF5! then
	 this.f_getparentwindow(lw_parent )
	 lw_parent.dynamic f_refresh()
elseif key = KeyDelete! then
	ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	Do while ll_row > 0 
		this.deleterow(ll_row)
		ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	LOOP
end if
end event

event itemchanged;call super::itemchanged;dec				ldc_qty, ldc_price, ldc_vat


choose case dwo.name
	case 'qty','price','vat'
		if dwo.name = 'qty' then
			ldc_qty = dec(data)
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'price' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = dec(data)
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'vat' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = dec(data)
		end if		
		this.setitem( row, 'amount', ldc_qty*ldc_price)
		this.setitem( row, 'base_amount',  ldc_qty*ldc_price)
		this.setitem( row, 'base_amount_ex_tax',  ldc_qty*ldc_price)
		this.setitem( row, 'vat_amount',  round(ldc_qty*ldc_price*ldc_vat/100, 0))		
end choose

end event

type dw_15 from t_dw_pos within c_tp_purchase_2
integer x = 3035
integer y = 868
integer taborder = 50
string dataobject = "d_purchase_line_grid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean ib_drag = true
end type

event e_dwnkey;//-- Override --//

long				ll_row
window			lw_parent

if key = KeyF5! then
	 this.f_getparentwindow(lw_parent )
	 lw_parent.dynamic f_refresh()
elseif key = KeyDelete! then
	ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	Do while ll_row > 0 
		this.deleterow(ll_row)
		ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	LOOP
end if
end event

event itemchanged;call super::itemchanged;dec				ldc_qty, ldc_price, ldc_vat


choose case dwo.name
	case 'qty','price','vat'
		if dwo.name = 'qty' then
			ldc_qty = dec(data)
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'price' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = dec(data)
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'vat' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = dec(data)
		end if		
		this.setitem( row, 'amount', ldc_qty*ldc_price)
		this.setitem( row, 'base_amount',  ldc_qty*ldc_price)
		this.setitem( row, 'base_amount_ex_tax',  ldc_qty*ldc_price)
		this.setitem( row, 'vat_amount',  round(ldc_qty*ldc_price*ldc_vat/100, 0))		
end choose

end event

type dw_14 from t_dw_pos within c_tp_purchase_2
integer x = 3035
integer y = 452
integer taborder = 50
string dataobject = "d_purchase_line_grid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean ib_drag = true
end type

event e_dwnkey;//-- Override --//

long				ll_row
window			lw_parent

if key = KeyF5! then
	 this.f_getparentwindow(lw_parent )
	 lw_parent.dynamic f_refresh()
elseif key = KeyDelete! then
	ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	Do while ll_row > 0 
		this.deleterow(ll_row)
		ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	LOOP
end if
end event

event itemchanged;call super::itemchanged;dec				ldc_qty, ldc_price, ldc_vat


choose case dwo.name
	case 'qty','price','vat'
		if dwo.name = 'qty' then
			ldc_qty = dec(data)
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'price' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = dec(data)
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'vat' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = dec(data)
		end if		
		this.setitem( row, 'amount', ldc_qty*ldc_price)
		this.setitem( row, 'base_amount',  ldc_qty*ldc_price)
		this.setitem( row, 'base_amount_ex_tax',  ldc_qty*ldc_price)
		this.setitem( row, 'vat_amount',  round(ldc_qty*ldc_price*ldc_vat/100, 0))		
end choose

end event

type dw_13 from t_dw_pos within c_tp_purchase_2
integer x = 2341
integer y = 1272
integer taborder = 50
string dataobject = "d_purchase_line_grid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean ib_drag = true
end type

event e_dwnkey;//-- Override --//

long				ll_row
window			lw_parent

if key = KeyF5! then
	 this.f_getparentwindow(lw_parent )
	 lw_parent.dynamic f_refresh()
elseif key = KeyDelete! then
	ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	Do while ll_row > 0 
		this.deleterow(ll_row)
		ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	LOOP
end if
end event

event itemchanged;call super::itemchanged;dec				ldc_qty, ldc_price, ldc_vat


choose case dwo.name
	case 'qty','price','vat'
		if dwo.name = 'qty' then
			ldc_qty = dec(data)
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'price' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = dec(data)
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'vat' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = dec(data)
		end if		
		this.setitem( row, 'amount', ldc_qty*ldc_price)
		this.setitem( row, 'base_amount',  ldc_qty*ldc_price)
		this.setitem( row, 'base_amount_ex_tax',  ldc_qty*ldc_price)
		this.setitem( row, 'vat_amount',  round(ldc_qty*ldc_price*ldc_vat/100, 0))		
end choose

end event

type dw_12 from t_dw_pos within c_tp_purchase_2
integer x = 1563
integer y = 1268
integer taborder = 50
string dataobject = "d_purchase_line_grid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean ib_drag = true
end type

event e_dwnkey;//-- Override --//

long				ll_row
window			lw_parent

if key = KeyF5! then
	 this.f_getparentwindow(lw_parent )
	 lw_parent.dynamic f_refresh()
elseif key = KeyDelete! then
	ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	Do while ll_row > 0 
		this.deleterow(ll_row)
		ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	LOOP
end if
end event

event itemchanged;call super::itemchanged;dec				ldc_qty, ldc_price, ldc_vat


choose case dwo.name
	case 'qty','price','vat'
		if dwo.name = 'qty' then
			ldc_qty = dec(data)
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'price' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = dec(data)
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'vat' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = dec(data)
		end if		
		this.setitem( row, 'amount', ldc_qty*ldc_price)
		this.setitem( row, 'base_amount',  ldc_qty*ldc_price)
		this.setitem( row, 'base_amount_ex_tax',  ldc_qty*ldc_price)
		this.setitem( row, 'vat_amount',  round(ldc_qty*ldc_price*ldc_vat/100, 0))		
end choose

end event

type dw_11 from t_dw_pos within c_tp_purchase_2
integer x = 786
integer y = 1304
integer taborder = 50
string dataobject = "d_purchase_line_grid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean ib_drag = true
end type

event e_dwnkey;//-- Override --//

long				ll_row
window			lw_parent

if key = KeyF5! then
	 this.f_getparentwindow(lw_parent )
	 lw_parent.dynamic f_refresh()
elseif key = KeyDelete! then
	ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	Do while ll_row > 0 
		this.deleterow(ll_row)
		ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	LOOP
end if
end event

event itemchanged;call super::itemchanged;dec				ldc_qty, ldc_price, ldc_vat


choose case dwo.name
	case 'qty','price','vat'
		if dwo.name = 'qty' then
			ldc_qty = dec(data)
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'price' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = dec(data)
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'vat' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = dec(data)
		end if		
		this.setitem( row, 'amount', ldc_qty*ldc_price)
		this.setitem( row, 'base_amount',  ldc_qty*ldc_price)
		this.setitem( row, 'base_amount_ex_tax',  ldc_qty*ldc_price)
		this.setitem( row, 'vat_amount',  round(ldc_qty*ldc_price*ldc_vat/100, 0))		
end choose

end event

type dw_10 from t_dw_pos within c_tp_purchase_2
integer x = 23
integer y = 1316
integer taborder = 40
string dataobject = "d_purchase_line_grid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean ib_drag = true
end type

event e_dwnkey;//-- Override --//

long				ll_row
window			lw_parent

if key = KeyF5! then
	 this.f_getparentwindow(lw_parent )
	 lw_parent.dynamic f_refresh()
elseif key = KeyDelete! then
	ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	Do while ll_row > 0 
		this.deleterow(ll_row)
		ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	LOOP
end if
end event

event itemchanged;call super::itemchanged;dec				ldc_qty, ldc_price, ldc_vat


choose case dwo.name
	case 'qty','price','vat'
		if dwo.name = 'qty' then
			ldc_qty = dec(data)
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'price' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = dec(data)
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'vat' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = dec(data)
		end if		
		this.setitem( row, 'amount', ldc_qty*ldc_price)
		this.setitem( row, 'base_amount',  ldc_qty*ldc_price)
		this.setitem( row, 'base_amount_ex_tax',  ldc_qty*ldc_price)
		this.setitem( row, 'vat_amount',  round(ldc_qty*ldc_price*ldc_vat/100, 0))		
end choose

end event

type dw_9 from t_dw_pos within c_tp_purchase_2
integer x = 2295
integer y = 868
integer taborder = 40
string dataobject = "d_purchase_line_grid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean ib_drag = true
end type

event e_dwnkey;//-- Override --//

long				ll_row
window			lw_parent

if key = KeyF5! then
	 this.f_getparentwindow(lw_parent )
	 lw_parent.dynamic f_refresh()
elseif key = KeyDelete! then
	ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	Do while ll_row > 0 
		this.deleterow(ll_row)
		ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	LOOP
end if
end event

event itemchanged;call super::itemchanged;dec				ldc_qty, ldc_price, ldc_vat


choose case dwo.name
	case 'qty','price','vat'
		if dwo.name = 'qty' then
			ldc_qty = dec(data)
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'price' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = dec(data)
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'vat' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = dec(data)
		end if		
		this.setitem( row, 'amount', ldc_qty*ldc_price)
		this.setitem( row, 'base_amount',  ldc_qty*ldc_price)
		this.setitem( row, 'base_amount_ex_tax',  ldc_qty*ldc_price)
		this.setitem( row, 'vat_amount',  round(ldc_qty*ldc_price*ldc_vat/100, 0))		
end choose

end event

type dw_8 from t_dw_pos within c_tp_purchase_2
integer x = 1527
integer y = 848
integer taborder = 30
string dataobject = "d_purchase_line_grid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean ib_drag = true
end type

event e_dwnkey;//-- Override --//

long				ll_row
window			lw_parent

if key = KeyF5! then
	 this.f_getparentwindow(lw_parent )
	 lw_parent.dynamic f_refresh()
elseif key = KeyDelete! then
	ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	Do while ll_row > 0 
		this.deleterow(ll_row)
		ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	LOOP
end if
end event

event itemchanged;call super::itemchanged;dec				ldc_qty, ldc_price, ldc_vat


choose case dwo.name
	case 'qty','price','vat'
		if dwo.name = 'qty' then
			ldc_qty = dec(data)
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'price' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = dec(data)
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'vat' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = dec(data)
		end if		
		this.setitem( row, 'amount', ldc_qty*ldc_price)
		this.setitem( row, 'base_amount',  ldc_qty*ldc_price)
		this.setitem( row, 'base_amount_ex_tax',  ldc_qty*ldc_price)
		this.setitem( row, 'vat_amount',  round(ldc_qty*ldc_price*ldc_vat/100, 0))		
end choose

end event

type dw_7 from t_dw_pos within c_tp_purchase_2
integer x = 777
integer y = 860
integer taborder = 30
string dataobject = "d_purchase_line_grid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean ib_drag = true
end type

event e_dwnkey;//-- Override --//

long				ll_row
window			lw_parent

if key = KeyF5! then
	 this.f_getparentwindow(lw_parent )
	 lw_parent.dynamic f_refresh()
elseif key = KeyDelete! then
	ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	Do while ll_row > 0 
		this.deleterow(ll_row)
		ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	LOOP
end if
end event

event itemchanged;call super::itemchanged;dec				ldc_qty, ldc_price, ldc_vat


choose case dwo.name
	case 'qty','price','vat'
		if dwo.name = 'qty' then
			ldc_qty = dec(data)
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'price' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = dec(data)
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'vat' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = dec(data)
		end if		
		this.setitem( row, 'amount', ldc_qty*ldc_price)
		this.setitem( row, 'base_amount',  ldc_qty*ldc_price)
		this.setitem( row, 'base_amount_ex_tax',  ldc_qty*ldc_price)
		this.setitem( row, 'vat_amount',  round(ldc_qty*ldc_price*ldc_vat/100, 0))		
end choose

end event

type dw_6 from t_dw_pos within c_tp_purchase_2
integer x = 37
integer y = 892
integer taborder = 30
string dataobject = "d_purchase_line_grid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean ib_drag = true
end type

event e_dwnkey;//-- Override --//

long				ll_row
window			lw_parent

if key = KeyF5! then
	 this.f_getparentwindow(lw_parent )
	 lw_parent.dynamic f_refresh()
elseif key = KeyDelete! then
	ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	Do while ll_row > 0 
		this.deleterow(ll_row)
		ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	LOOP
end if
end event

event itemchanged;call super::itemchanged;dec				ldc_qty, ldc_price, ldc_vat


choose case dwo.name
	case 'qty','price','vat'
		if dwo.name = 'qty' then
			ldc_qty = dec(data)
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'price' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = dec(data)
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'vat' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = dec(data)
		end if		
		this.setitem( row, 'amount', ldc_qty*ldc_price)
		this.setitem( row, 'base_amount',  ldc_qty*ldc_price)
		this.setitem( row, 'base_amount_ex_tax',  ldc_qty*ldc_price)
		this.setitem( row, 'vat_amount',  round(ldc_qty*ldc_price*ldc_vat/100, 0))		
end choose

end event

type dw_5 from t_dw_pos within c_tp_purchase_2
integer x = 2295
integer y = 452
integer taborder = 30
string dataobject = "d_purchase_line_grid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean ib_drag = true
end type

event e_dwnkey;//-- Override --//

long				ll_row
window			lw_parent

if key = KeyF5! then
	 this.f_getparentwindow(lw_parent )
	 lw_parent.dynamic f_refresh()
elseif key = KeyDelete! then
	ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	Do while ll_row > 0 
		this.deleterow(ll_row)
		ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	LOOP
end if
end event

event itemchanged;call super::itemchanged;dec				ldc_qty, ldc_price, ldc_vat


choose case dwo.name
	case 'qty','price','vat'
		if dwo.name = 'qty' then
			ldc_qty = dec(data)
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'price' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = dec(data)
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'vat' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = dec(data)
		end if		
		this.setitem( row, 'amount', ldc_qty*ldc_price)
		this.setitem( row, 'base_amount',  ldc_qty*ldc_price)
		this.setitem( row, 'base_amount_ex_tax',  ldc_qty*ldc_price)
		this.setitem( row, 'vat_amount',  round(ldc_qty*ldc_price*ldc_vat/100, 0))		
end choose

end event

type dw_4 from t_dw_pos within c_tp_purchase_2
integer x = 1527
integer y = 432
integer taborder = 40
string dataobject = "d_purchase_line_grid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean ib_drag = true
end type

event e_dwnkey;//-- Override --//

long				ll_row
window			lw_parent

if key = KeyF5! then
	 this.f_getparentwindow(lw_parent )
	 lw_parent.dynamic f_refresh()
elseif key = KeyDelete! then
	ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	Do while ll_row > 0 
		this.deleterow(ll_row)
		ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	LOOP
end if
end event

event itemchanged;call super::itemchanged;dec				ldc_qty, ldc_price, ldc_vat


choose case dwo.name
	case 'qty','price','vat'
		if dwo.name = 'qty' then
			ldc_qty = dec(data)
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'price' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = dec(data)
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'vat' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = dec(data)
		end if		
		this.setitem( row, 'amount', ldc_qty*ldc_price)
		this.setitem( row, 'base_amount',  ldc_qty*ldc_price)
		this.setitem( row, 'base_amount_ex_tax',  ldc_qty*ldc_price)
		this.setitem( row, 'vat_amount',  round(ldc_qty*ldc_price*ldc_vat/100, 0))		
end choose

end event

type dw_3 from t_dw_pos within c_tp_purchase_2
integer x = 777
integer y = 444
integer taborder = 30
string dataobject = "d_purchase_line_grid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean ib_drag = true
end type

event e_dwnkey;//-- Override --//

long				ll_row
window			lw_parent

if key = KeyF5! then
	 this.f_getparentwindow(lw_parent )
	 lw_parent.dynamic f_refresh()
elseif key = KeyDelete! then
	ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	Do while ll_row > 0 
		this.deleterow(ll_row)
		ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	LOOP
end if
end event

event itemchanged;call super::itemchanged;dec				ldc_qty, ldc_price, ldc_vat


choose case dwo.name
	case 'qty','price','vat'
		if dwo.name = 'qty' then
			ldc_qty = dec(data)
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'price' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = dec(data)
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'vat' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = dec(data)
		end if		
		this.setitem( row, 'amount', ldc_qty*ldc_price)
		this.setitem( row, 'base_amount',  ldc_qty*ldc_price)
		this.setitem( row, 'base_amount_ex_tax',  ldc_qty*ldc_price)
		this.setitem( row, 'vat_amount',  round(ldc_qty*ldc_price*ldc_vat/100, 0))		
end choose

end event

type dw_2 from t_dw_pos within c_tp_purchase_2
integer x = 37
integer y = 476
integer taborder = 20
string dataobject = "d_purchase_line_grid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean ib_drag = true
end type

event e_dwnkey;//-- Override --//

long				ll_row
window			lw_parent

if key = KeyF5! then
	 this.f_getparentwindow(lw_parent )
	 lw_parent.dynamic f_refresh()
elseif key = KeyDelete! then
	ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	Do while ll_row > 0 
		this.deleterow(ll_row)
		ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	LOOP
end if
end event

event itemchanged;call super::itemchanged;dec				ldc_qty, ldc_price, ldc_vat


choose case dwo.name
	case 'qty','price','vat'
		if dwo.name = 'qty' then
			ldc_qty = dec(data)
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'price' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = dec(data)
			ldc_vat = this.getitemnumber( row, 'vat')
		elseif dwo.name = 'vat' then
			ldc_qty = this.getitemnumber( row, 'qty')
			ldc_price = this.getitemnumber( row, 'price')
			ldc_vat = dec(data)
		end if		
		this.setitem( row, 'amount', ldc_qty*ldc_price)
		this.setitem( row, 'base_amount',  ldc_qty*ldc_price)
		this.setitem( row, 'base_amount_ex_tax',  ldc_qty*ldc_price)
		this.setitem( row, 'vat_amount',  round(ldc_qty*ldc_price*ldc_vat/100, 0))		
end choose

end event

type dw_1 from t_dw_pos within c_tp_purchase_2
integer x = 18
integer width = 2665
integer taborder = 10
string dataobject = "d_purchase_form"
boolean ib_drag = true
end type

event e_dwnkey;//-- Override --//

long				ll_row
window			lw_parent

if key = KeyF5! then
	 this.f_getparentwindow(lw_parent )
	 lw_parent.dynamic f_refresh()
elseif key = KeyDelete! then
	ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	Do while ll_row > 0 
		this.deleterow(ll_row)
		ll_row = this.find("gutter = 'Y'", 1, this.rowcount( ))
	LOOP
end if
end event

