$PBExportHeader$s_wr_valueset.srw
forward
global type s_wr_valueset from t_w_response
end type
type dw_filter from t_dw within s_wr_valueset
end type
type dw_1 from t_dw_mpl within s_wr_valueset
end type
end forward

global type s_wr_valueset from t_w_response
string title = ""
dw_filter dw_filter
dw_1 dw_1
end type
global s_wr_valueset s_wr_valueset

on s_wr_valueset.create
int iCurrent
call super::create
this.dw_filter=create dw_filter
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_filter
this.Control[iCurrent+2]=this.dw_1
end on

on s_wr_valueset.destroy
call super::destroy
destroy(this.dw_filter)
destroy(this.dw_1)
end on

type cb_cancel from t_w_response`cb_cancel within s_wr_valueset
integer x = 1742
integer y = 1380
end type

type cb_ok from t_w_response`cb_ok within s_wr_valueset
integer x = 1065
integer y = 1408
end type

type dw_filter from t_dw within s_wr_valueset
event type long e_itemchanged ( long row,  string vs_colname,  string vs_data )
integer x = 9
integer width = 1001
integer height = 188
integer taborder = 10
boolean bringtotop = true
string title = ""
borderstyle borderstyle = stylebox!
end type

event type long e_itemchanged(long row, string vs_colname, string vs_data);string 			ls_data,ls_right,ls_colname,ls_colType
decimal			ldc_data
date				ldt_data
boolean			lb_AllowOperators = false
//ls_data = vs_data
//ls_colname = vs_colname
//ls_colType = this.describe( ls_colname + ".ColType")
//choose case lower(left(ls_colType,5)) 
//	case 'char(' 
//	case 'numbe', 'decim'
//			this.f_set_filterctrlvalue( ls_colname, ls_data)
//			ldc_data = dec(ls_data)
//			this.setitem( row, ls_colname, ldc_data)
//			lb_AllowOperators = true
//			
//	case 'date','datet'
//			this.f_set_filterctrlvalue( ls_colname, ls_data)
//			ldt_data = date(ls_data)
//			this.setitem( row, ls_colname, ldt_data)
//			lb_AllowOperators = true
//			
//end choose
//
//if lb_AllowOperators then
//	return 2
//else
	return 0
//end if
end event

event clicked;call super::clicked;string					ls_colname[], ls_null, ls_colType
int						li_idx, li_colCnt, li_null
date					ld_null
datetime				ldt_null
datawindow			ldw_main

if dwo.name = 'gutter' then
	if this.getitemstring( 1, 'gutter') = 'N' then
//		ldw_main = parent.f_get_dwmain( )
		if isvalid(ldw_main) then
//			is_filterString =''
			ldw_main.setfilter( "")
			ldw_main.filter( )
			setnull(ls_null)
			setnull(li_null)
			setnull(ld_null)
			setnull(ldt_null)
			li_colCnt = this.f_getcolumns( ls_colname[])
			FOR li_idx = 1 to li_colCnt
				if ls_colname[li_idx] = 'gutter' then continue
				ls_colType = this.describe( ls_colname[li_idx]+ ".colType")
				if left(ls_colType, 5) = 'char(' then
					this.setitem( 1, ls_colname[li_idx], ls_null)
				elseif  left(ls_colType, 5) = 'numbe' or  left(ls_colType, 5) = 'decim' then
					this.setitem( 1, ls_colname[li_idx], li_null)
				elseif left(ls_colType, 5) = 'date' then
					this.setitem( 1, ls_colname[li_idx], ld_null)
				elseif left(ls_colType, 5) = 'datet' then
					this.setitem( 1, ls_colname[li_idx], ldt_null)
				end if
			NEXT
		end if
	end if
end if

end event

event editchanged;call super::editchanged;//parent.f_filter_dwmain( )

end event

event itemchanged;call super::itemchanged;return event e_itemchanged(1,dwo.name,data)

end event

event itemerror;call super::itemerror;If this.Describe(dwo.name + "_filter.x") = "!" Then
	return 2
else
	return event e_itemchanged(1,dwo.name,data)
	
end if
end event

event itemfocuschanged;call super::itemfocuschanged;
If this.describe(dwo.name + "_filter.x") <> "!" Then
	this.settext( this.describe( dwo.name + '_filter.text' ))
	this.SelectText(1,Len(this.gettext()))
end if
end event

event e_mousemove;call super::e_mousemove;t_m_operator		lm_operator

//if left(dwo.name,2) = "t_" then
//	lm_operator = create	t_m_operator
//	lm_operator.popmenu( t_w_mdi.pointerX() , t_w_mdi.pointerY() )
//	if  lm_operator.is_clicked_menu = '' then  lm_operator.is_clicked_menu = '='
//	this.modify(dwo.name+".text ='" + lm_operator.is_clicked_menu +"'")
//	parent.f_filter_dwmain( )
//	destroy lm_operator
//
//end if
//
end event

event e_vscroll;call super::e_vscroll;return 1
end event

event e_dwnlbuttonup;call super::e_dwnlbuttonup;//-- resize column cua dw_filter neu co --//
string	ls_dwoName

IF this.object.datawindow.syntax.modified = "yes" THEN
	this.event e_resize_dwfilter()
end if

ls_dwoName = string(dwo.name)
if ls_dwoName = 'datawindow' then
	this.setcolumn( 2)
elseif pos( ls_dwoName,'_t')> 0 then
	ls_dwoName = left(ls_dwoName, pos( ls_dwoName,'_t') -1)
	this.setcolumn( ls_dwoName)
elseif pos( ls_dwoName,'_filter')> 0 then
	ls_dwoName = left(ls_dwoName, pos( ls_dwoName,'_filter') -1)
	this.setcolumn( ls_dwoName)
	this.settext( this.describe( ls_dwoName + '_filter.text' ))
	this.SelectText(1,Len(this.gettext()))
else
	this.setcolumn( ls_dwoName)
end if

end event

type dw_1 from t_dw_mpl within s_wr_valueset
integer y = 212
integer width = 2784
integer taborder = 20
boolean bringtotop = true
end type

