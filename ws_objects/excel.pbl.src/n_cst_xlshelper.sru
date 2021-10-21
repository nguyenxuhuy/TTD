$PBExportHeader$n_cst_xlshelper.sru
forward
global type n_cst_xlshelper from nonvisualobject
end type
type os_size from structure within n_cst_xlshelper
end type
type os_fontlist from structure within n_cst_xlshelper
end type
type ostr_object from structure within n_cst_xlshelper
end type
type ostr_line from structure within n_cst_xlshelper
end type
type ostr_height from structure within n_cst_xlshelper
end type
type ostr_position from structure within n_cst_xlshelper
end type
end forward

type os_size from structure
	long		l_cx
	long		l_cy
end type

type os_fontlist from structure
	string		fontname
	integer		fontsize
	integer		fontweight
	integer		fontheight
end type

type ostr_object from structure
	string		reportname
	string		name
	string		band
	string		stype
	string		coltype
	string		format
	string		formatexp
	boolean		visible
	string		visibleexp
	string		fontname
	string		fontnameexp
	integer		fontsize
	string		fontsizeexp
	integer		fontweight
	string		fontweightexp
	long		fontcolor
	string		fontcolorexp
	long		fontitalic
	string		fontitalicexp
	integer		alignment
	string		alignmentexp
	long		bgcolor
	string		bgcolorexp
	integer		startrow
	integer		startcol
	integer		endrow
	long		endcol
	integer		sparse
	string		priorvalue
	integer		beginrow
	integer		rowindetail
	integer		objspace
	boolean		mergeflag
	boolean		cellflag
	long		border
	boolean		displayvalue
	integer		columnid
	integer		wraptext
	boolean		isborderonly
	boolean		expflag
	integer		bordercount
	string		borderkey[]
	integer		borderxf[]
	boolean		slipup
	integer		aboverows
	boolean		isreport
end type

type ostr_line from structure	
 string reportname
 string name
 string band
 long x1
 long y1
 long x2
 long y2
 long penwidth
 long pencolor
 long startcol
 long startrow
 long endcol
 long endrow
 string linetype
 long lastflag
 long firstflag
end type

type ostr_height from structure
	 string reportname
 string band
 long row
 long y
 long height
 long aboverows
end type

type ostr_position from structure
	integer		s_obj
	integer		e_obj
	integer		s_line
	integer		e_line
	integer		s_height
	integer		e_height
	string		bgcolorexp
	long		bgcolor
	long		startrow
	long		endrow
end type

global type n_cst_xlshelper from nonvisualobject autoinstantiate
end type

type prototypes
public function ulong getsyscolor (ulong nindex)  library "user32.dll" alias for "GetSysColor"
public function ulong getlocaleinfo (ulong locale,ulong lctype,ref string lplcdata,ulong cchdata)  library "kernel32.dll" alias for "GetLocaleInfoA"

public function ulong GetUserDefaultLangID() Library "kernel32" Alias FOR "GetUserDefaultLangID"
public function ulong GetUserDefaultLCID () Library "kernel32" Alias FOR "GetUserDefaultLCID"

end prototypes

type variables
public constant integer BC_1000 = 64
public constant integer BC_100 = 16
public constant integer BC_10 = 4
public constant integer BC_1111 = 85

protected boolean ib_openexcel = true
public boolean ib_showmsg = true
protected datastore ids_column
protected datastore ids_objects
protected datastore ids_reportobj
protected datastore ids_bands
protected datastore ids_line
protected datastore ids_rowheight
protected datawindow idw_requestor
protected datastore  ids_requestor
protected datawindowchild idwc_temp
protected integer ii_maxcol
protected long ii_borderbeginrow
protected long ii_borderendrow
protected long ii_detailrow
protected boolean ib_gridborder = false
protected boolean ib_mergecolumnheader = false
protected boolean ib_groupnewpage[]
protected string is_beginrowobj
protected boolean ib_outline = false
protected boolean ib_groupoutflag = true
protected boolean ib_formflag = true
protected integer ii_firstcolumn = 2
protected string is_borderendobj
protected string is_borderbeginobj
protected integer ii_printheader = 2
protected string is_units
protected window iw_parent
protected long ii_rowspace = 30
protected long ii_colspace = 30
protected string is_linetag = "0"
protected n_xls_workbookx invo_workbook
protected n_xls_worksheetx invo_worksheet

protected string is_format_currency
private os_fontlist istr_fontlist[]

public string MSG_NOTE_TITLE="note"
public string MSG_FILE_EXISTS="File already exists,continue?"
public string MSG_FILE_WRITE_SUCCESS = "Export success!"
public string MSG_FILE_OPEN_ERROR = "Please install Microsoft Office or OpenOffice!"

integer ii_cells[100,100]
integer ii_border_hash[65,256]

n_xls_formatx 		invo_default_border, invo_format_temp, invo_grid_temp
boolean ib_show_progress = true
integer ii_sub_borderbeginrow

private ostr_object istr_obj[], istr_empty_obj[]
private ostr_line istr_lines[],istr_empty_line[]
private ostr_height istr_rowheight[],istr_empty_rowheight[]
private ostr_position istr_position[],istr_empty_position[]

private ostr_position istr_oldpos[2]
private string is_oldband[]
private n_associated_ulong_srvx invo_colors

end variables

forward prototypes
protected subroutine of_check_property (ref string as_str, ref string as_expression)
protected function string of_get_currency_format ()
protected subroutine of_get_format (ref string as_format, ref string as_exp, string as_type)
protected function integer of_get_penwidth (integer ai_width)
protected subroutine of_getcolumninfo ()
protected subroutine of_getrowheight ()
protected function integer of_groupcount ()
protected function long of_parsetoarray (string as_source,string as_delimiter,ref string as_array[])
protected function string of_replace (string as_string1,string as_string2,string as_string3)
public subroutine of_setformflag (boolean ab_flag)
public subroutine of_setgridborder (boolean ab_flag)
public subroutine of_setgroupoutflag (boolean as_flag)
public subroutine of_setprintheader (integer ai_style)
public subroutine of_set_openexcel (boolean ab_flag)
public function long of_lastpos (string as_source, string as_target, long al_start)
public function integer of_analyze_cells ()
protected subroutine of_getcolrowinfo ()
protected subroutine of_getgridinfo (string as_reportname)
public function integer of_createstructure ()
protected function unsignedlong of_get_custom_color_index (unsignedlong al_color)
protected function unsignedlong of_get_color (unsignedlong al_color)
protected function string of_evaluate (integer ai_layer, string as_express, long al_row)
public function string of_describe (integer ai_layer, string as_exp)
protected function integer of_getobjects (string as_reportname)
protected subroutine of_init_dwsyntax ()
protected function integer of_outdata (string as_reportname, long ai_currow, string as_band, long ai_row)
public function integer of_dw2excel (datawindow adw, string as_filename, string as_arguments)
public function integer of_dw2excel (datawindow adw, string as_filename)
public function integer of_reg_border (integer ai_color, integer ai_border)
protected function string of_getdata (integer ai_layer, long ai_row, string as_objectname, string as_coltype, string as_format, boolean ab_displayvalue, integer ai_columnid, boolean ab_overlap)
public function integer of_dw2excel_invisible (datawindow adw, string as_filename, string as_arguments)
end prototypes

protected subroutine of_check_property (ref string as_str, ref string as_expression);string ls_str
long ll_pos

as_expression = ""

if as_str <> "!" and as_str <> "?" and as_str <> "" then
	ll_pos = pos(lower(as_str),"~t")

	if ll_pos > 0 then
		as_expression = right(as_str,len(as_str) - ll_pos)

		if right(as_expression,1) = "~"" then
			as_expression = trim(left(as_expression,len(as_expression) - 1))
		end if

		as_str = left(as_str,ll_pos - 1)

		if left(as_str,1) = "~"" then
			as_str = right(as_str,len(as_str) - 1)
		end if

	end if

	as_str = trim(as_str)
else
	as_str = ""
	as_expression = ""
end if
end subroutine

protected function string of_get_currency_format ();integer locale_user_default = 1024
integer locale_scurrency = 20
integer locale_smondecimalsep = 22
integer locale_smonthousandsep = 23
integer locale_icurrdigits = 25
integer locale_sintlsymbol = 21
integer locale_smongrouping = 24
integer li_len = 100
integer li_digits
string ls_temp
string ls_format
string ls_symbol
string ls_smondecimalsep
string ls_locale_smonthousandsep

locale_user_default = GetUserDefaultLCID()

ls_temp = space(li_len)
getlocaleinfo(locale_user_default,locale_scurrency,ls_temp,li_len)
ls_symbol = trim(ls_temp)
getlocaleinfo(locale_user_default,locale_icurrdigits,ls_temp,li_len)
li_digits = long(trim(ls_temp))
getlocaleinfo(locale_user_default,locale_smonthousandsep,ls_temp,li_len)
ls_locale_smonthousandsep = trim(ls_temp)
getlocaleinfo(locale_user_default,locale_smondecimalsep,ls_temp,li_len)
ls_smondecimalsep = trim(ls_temp)

if li_digits > 0 then
	ls_format = ls_symbol + "#" + ls_locale_smonthousandsep + "##0" + ls_smondecimalsep + fill("0",li_digits)
else
	ls_format = ls_symbol + "#,##0"
end if

return ls_format
end function

protected subroutine of_get_format (ref string as_format, ref string as_exp, string as_type);long ll_pos
long ll_cnt
string ls_arr[]

as_exp = ""
ll_pos = pos(as_format,"@")

if ll_pos > 0 then
	as_format = "[general]"
end if

ll_pos = pos(lower(as_format),"[general]")

do while ll_pos > 0

	if as_type = "D" then
		as_format = replace(as_format,ll_pos,9,"dd/mm/yyyy")		
	else

		if as_type = "DT" then
			 as_format = replace(as_format,ll_pos,9,"dd/mm/yyyy")			
		else

			if as_type = "T" then
				as_format = replace(as_format,ll_pos,9,"hh:mm")
			else
				as_format = replace(as_format,ll_pos,9,"@")
			end if

		end if

	end if

	ll_pos = pos(lower(as_format),"[general]")
loop

ll_pos = pos(lower(as_format),"[currency]")

do while ll_pos > 0
	as_format = replace(as_format,ll_pos,10,is_format_currency)
	ll_pos = pos(lower(as_format),"[currency]")
loop


ll_pos = pos(lower(as_format),'[shortdate] [time]')

do while ll_pos > 0
	as_format = replace(as_format,ll_pos, len('[shortdate] [time]'),"dd/mm/yyyy")
	ll_pos = pos(lower(as_format),'[shortdate] [time]')
loop

ll_pos = pos(lower(as_format),"[shortdate]")

do while ll_pos > 0
	as_format = replace(as_format,ll_pos,11,"dd/mm/yyyy")
	ll_pos = pos(lower(as_format),"[shortdate]")
loop

ll_pos = pos(lower(as_format),"[date]")

do while ll_pos > 0
	as_format = replace(as_format,ll_pos,6,"dd/mm/yyyy")
	ll_pos = pos(lower(as_format),"[date]")
loop

ll_pos = pos(lower(as_format),"[time]")

do while ll_pos > 0
	as_format = replace(as_format,ll_pos,6,"hh:mm")
	ll_pos = pos(lower(as_format),"[time]")
loop

as_format = of_replace(as_format,"'","~"")
as_format = of_replace(as_format,"@","General")

if pos(as_format,";") > 0 then
	ll_cnt = of_parsetoarray(as_format,";",ls_arr)

	choose case as_type
		case "N"
			if ll_cnt > 3 then
				ll_cnt = 3
			end if
	end choose

	integer li,li_count
	as_format =""
	if ll_cnt > 0 then
		as_format = ls_arr[1]
		for li=2 To ll_cnt
			as_format = as_format + ";" + ls_arr[li]
		next
	end if
end if

ll_pos = pos(lower(as_format),"~t")

if ll_pos > 0 then
	as_exp = right(as_format,len(as_format) - ll_pos)

	if right(as_exp,1) = "~"" then
		as_exp = trim(left(as_exp,len(as_exp) - 1))
	end if

	as_format = left(as_format,ll_pos - 1)

	if left(as_format,1) = "~"" then
		as_format = right(as_format,len(as_format) - 1)
	end if

end if
end subroutine

protected function integer of_get_penwidth (integer ai_width);choose case is_units
	case "1"
		ai_width = pixelstounits(ai_width,ypixelstounits!)
	case "2"
		ai_width = pixelstounits(ai_width * 0.096,ypixelstounits!)
	case "3"
		ai_width = pixelstounits(ai_width * 0.0378,ypixelstounits!)
end choose

if ai_width > 10 then
	ai_width = 5
else

	if ai_width > 5 then
		ai_width = 2
	else
		ai_width = 1
	end if

end if

return ai_width
end function

protected subroutine of_getcolumninfo ();long li
long lj
long lk
long li_row
long li_colcount
string ls_processing
uint li_startcol
long ll_minwidth
long ll_linespace

ls_processing = idw_requestor.describe("datawindow.processing")
ll_linespace = 50

choose case is_units
	case "1"
		ll_linespace = unitstopixels(ll_linespace,xunitstopixels!)
	case "2"
		ll_linespace = unitstopixels(ll_linespace,xunitstopixels!) * 0.1041
	case "3"
		ll_linespace = unitstopixels(ll_linespace,xunitstopixels!) * 2.646
end choose

if ii_firstcolumn <= 1 then
	ii_firstcolumn = 1
else
	ii_firstcolumn = 2
end if

li_startcol = ii_firstcolumn - 1

if ((ls_processing = "1") or (ls_processing = "4")) then
	ids_objects.setfilter("band='detail' AND Stype<>'line' ")
	ids_objects.filter()
	ids_objects.rowscopy(1,ids_objects.rowcount(),primary!,ids_column,ids_column.rowcount() + 1,primary!)
	ids_column.setsort("x a , y A ")
	ids_column.sort()

	for li = 1 to ids_column.rowcount()
		li_startcol ++
		ids_column.object.startcol[li] = li_startcol
		ids_column.object.endcol[li] = li_startcol
		ids_column.object.startrow[li] = 1
		ids_column.object.endrow[li] = 1
	next

else

	if ib_formflag then
		ids_line.setfilter("linetype='v'")
		ids_line.filter()
		ids_line.setsort("x1 A ")
		ids_line.sort()
		ib_formflag = false

		if ids_line.rowcount() > 0 then

			if ids_line.find("x1> " + string(ids_line.object.x1[1] + ll_linespace) + " AND X2< " + string(ids_line.object.x2[ids_line.rowcount()] - ll_linespace) + " AND Band='" + ids_line.object.band[1] + "'",1,ids_line.rowcount()) > 0 then
				ids_objects.setfilter("name<>'report_title' and  band<>'footer' and stype<>'report' and x< " + string(ids_line.object.x1[1]))
				ids_objects.filter()
				ib_formflag = true
				ib_gridborder = false
			end if

		end if

	end if

	if not ib_formflag then
		ids_objects.setfilter("name<>'report_title' and band<>'footer' and stype<>'report'  ")
		ids_objects.filter()
	end if

	ids_objects.setsort("x A  ")
	ids_objects.sort()

	if ids_objects.rowcount() > 0 then
		li_startcol ++
		
		li_row = ids_column.insertrow(0)
		ids_column.object.name[li_row] = ids_objects.object.name[1]
		ids_column.object.reportname[li_row] = ids_objects.object.reportname[1]
		ids_column.object.x[li_row] = ids_objects.object.x[1]
		ids_column.object.startcol[li_row] = li_startcol
		ids_column.object.endcol[li_row] = li_startcol

		for li = 1 to ids_objects.rowcount()
			lj = ids_column.rowcount()

			if ids_objects.object.x[li] - ids_column.object.x[lj] > ii_colspace then
				ids_column.object.width[lj] = (ids_objects.object.x[li] - ids_column.object.x[lj])


				li_startcol ++
				li_row = ids_column.insertrow(0)
				ids_column.object.x[li_row] = ids_objects.object.x[li]
				ids_column.object.name[li_row] = ids_objects.object.name[li]
				ids_column.object.reportname[li_row] = ids_objects.object.reportname[li]
				ids_column.object.startcol[li_row] = li_startcol
				ids_column.object.endcol[li_row] = li_startcol
				ids_column.object.width[li_row] = ids_objects.object.width[li]
			end if

			ids_objects.object.startcol[li] = li_startcol
			ids_objects.object.endcol[li] = li_startcol
		next

	end if

	if ids_column.rowcount() <= 0 and ids_line.rowcount() > 0 then
		li_startcol ++
		li_row = ids_column.insertrow(0)
		ids_column.object.reportname[li_row] = ids_line.object.reportname[1]
		ids_column.object.name[li_row] = ids_line.object.name[1]
		ids_column.object.x[li_row] = ids_line.object.x1[1]
		ids_column.object.startcol[li_row] = li_startcol
		ids_column.object.endcol[li_row] = li_startcol
		ids_line.object.startcol[1] = li_row
	end if

	for li = 1 to ids_line.rowcount()
		lj = ids_column.rowcount()

		if ids_line.object.x1[li] - ids_column.object.x[lj] > ii_colspace then
			ids_column.object.width[lj] = (ids_line.object.x1[li] - ids_column.object.x[lj])
			li_startcol ++
			li_row = ids_column.insertrow(0)
			ids_column.object.reportname[li_row] = ids_line.object.reportname[li]
			ids_column.object.x[li_row] = ids_line.object.x1[li]
			ids_column.object.name[li_row] = ids_line.object.name[li]
			ids_column.object.startcol[li_row] = li_startcol
			ids_column.object.endcol[li_row] = li_startcol
			ids_column.object.width[li_row] = (ids_line.object.x2[li] - ids_line.object.x1[li])
		end if

		ids_line.object.startcol[li] = li_startcol
		ids_line.object.endcol[li] = li_startcol
	next

	if ib_formflag then
		li = ids_line.rowcount()

		if li > 0 then
			ids_objects.setfilter("x> " + string(ids_line.object.x2[li]))
			ids_objects.filter()
			ids_objects.setsort("x A  ")
			ids_objects.sort()

			if ids_objects.rowcount() > 0 then

				if ids_column.rowcount() <= 0 then
					li_startcol ++
					li_row = ids_column.insertrow(0)
					ids_column.object.reportname[li_row] = ids_objects.object.reportname[1]
					ids_column.object.name[li_row] = ids_objects.object.name[1]
					ids_column.object.x[li_row] = ids_objects.object.x[1]
					ids_column.object.startcol[li_row] = li_startcol
					ids_column.object.endcol[li_row] = li_startcol
					ids_objects.object.startcol[1] = li_startcol
				end if

				for li = 1 to ids_objects.rowcount()
					lj = ids_column.rowcount()

					if ids_objects.object.x[li] - ids_column.object.x[lj] > ii_colspace then
						ids_column.object.width[lj] = (ids_objects.object.x[li] - ids_column.object.x[lj])
						li_startcol ++
						li_row = ids_column.insertrow(0)
						ids_column.object.x[li_row] = ids_objects.object.x[li]
						ids_column.object.reportname[li_row] = ids_objects.object.reportname[li]
						ids_column.object.name[li_row] = ids_objects.object.name[li]
						ids_column.object.startcol[li_row] = li_startcol
						ids_column.object.endcol[li_row] = li_startcol
						ids_column.object.width[li_row] = ids_objects.object.width[li]
					end if

					ids_objects.object.startcol[li] = li_startcol
					ids_objects.object.endcol[li] = li_startcol
				next

			end if

		end if

	end if

end if

if li_startcol > 256 then
	messagebox(MSG_NOTE_TITLE,"must less than 256 columns!")
	ids_objects.reset()
	ids_column.reset()
	ids_line.reset()
	return
end if

ll_minwidth = 20

choose case is_units
	case "1"
		ll_minwidth = unitstopixels(ll_minwidth,xunitstopixels!)
	case "2"
		ll_minwidth = unitstopixels(ll_minwidth,xunitstopixels!) * 0.1041
	case "3"
		ll_minwidth = unitstopixels(ll_minwidth,xunitstopixels!) * 2.646
end choose

if ii_firstcolumn > 1 and ids_column.rowcount() > 0 then
	ids_column.insertrow(1)
	ids_column.object.width[1] = ids_column.object.x[2]

	if ids_column.object.width[1] < ll_minwidth then
		ids_column.object.width[1] = ll_minwidth
	end if

	ids_column.object.startcol[1] = 1
	ids_column.object.endcol[1] = 1
	ids_column.object.x[1] = (ids_column.object.width[1] * -1)
end if
end subroutine

protected subroutine of_getrowheight ();long li
long lk
string ls_reportname
string ls_band
string ls_processing
string ls_prior_band
long li_count
integer li_rowcount
long li_row
long li_beginrow
long li_endrow
long li_bandrow
long li_detailrows
long li_row2
long li_height
long li_y
long li_y2
datastore lds_temp
boolean lb_border = false

ids_objects.setfilter("")
ids_objects.filter()
ids_objects.setsort("ReportName A ,Band A, y A   ")
ids_objects.sort()
ids_line.setfilter("")
ids_line.filter()

if ids_line.rowcount() > 0 then
	lb_border = true
	ids_line.setsort("ReportName A ,Band A, Y1 A")
	ids_line.sort()
end if

lds_temp = create datastore
ls_processing = idw_requestor.describe("datawindow.processing")
ids_rowheight.setsort("Row A")
li_count = ids_objects.rowcount()

if ids_reportobj.rowcount() > 0 then
	ids_reportobj.setsort("Y A")
	ids_reportobj.sort()
end if

for li = 1 to li_count

	if (((ids_objects.object.reportname[li] <> ls_reportname) or (ids_objects.object.band[li] <> ls_band)) or (ls_processing = "4" and ls_band <> ls_prior_band)) then

		if ((ids_objects.object.reportname[li] <> ls_reportname) or (ids_objects.object.band[li] <> ls_band)) then
			ls_reportname = ids_objects.object.reportname[li]
			ls_band = ids_objects.object.band[li]
			li_bandrow = 0

			if ids_objects.object.reportname[li] = "" then
				li_y = 0
			else
				li_y = long(idw_requestor.describe(ids_objects.object.reportname[li] + ".Y"))
			end if

		end if

		if ls_processing = "4" then
			li_row2 = ids_bands.find("ReportName='" + ids_objects.object.reportname[li] + "' AND OldBand='" + idw_requestor.describe(ids_objects.object.name[li] + ".band") + "' ",1,ids_bands.rowcount())
		else
			li_row2 = ids_bands.find("ReportName='" + ids_objects.object.reportname[li] + "' AND Band='" + ls_band + "' ",1,ids_bands.rowcount())
		end if

		if li_row2 > 0 then
			ids_bands.object.startrow[li_row2] = ids_objects.object.startrow[li]
			ids_bands.object.endrow[li_row2] = ids_objects.object.endrow[li]
		end if

	else

		if li_row2 > 0 then

			if ids_objects.object.startrow[li] < ids_bands.object.startrow[li_row2] then
				ids_bands.object.startrow[li_row2] = ids_objects.object.startrow[li]
			end if

			if ids_objects.object.endrow[li] > ids_bands.object.endrow[li_row2] then
				ids_bands.object.endrow[li_row2] = ids_objects.object.endrow[li]
			end if

		end if

		if ids_objects.object.startrow[li] = li_bandrow then
			continue
		end if

	end if

	if ids_objects.object.isreport[li] = "1" then
		li_y = ids_objects.object.y2[li]
	else

		if ids_objects.object.startrow[li] = ids_objects.object.endrow[li] then
			li_row = ids_rowheight.find("ReportName='" + ids_objects.object.reportname[li] + "' AND Band='" + ids_objects.object.band[li] + "' AND Row=" + string(ids_objects.object.startrow[li]),1,ids_rowheight.rowcount())

			if li_row <= 0 then
				lk = ids_rowheight.insertrow(0)
				ids_rowheight.object.reportname[lk] = ids_objects.object.reportname[li]
				ids_rowheight.object.band[lk] = ids_objects.object.band[li]
				ids_rowheight.object.row[lk] = ids_objects.object.startrow[li]
				ids_rowheight.object.aboverows[lk] = 0
				ids_rowheight.object.y[lk] = ids_objects.object.y[li]

				if ids_objects.object.band[li] = "detail" then

					if ids_objects.object.startrow[li] > li_detailrows then
						li_detailrows = ids_objects.object.startrow[li]
					end if

				end if

				li_row = ids_objects.find("ReportName='" + ids_objects.object.reportname[li] + "' AND Band='" + ids_objects.object.band[li] + "' AND Y>" + string(ids_objects.object.y2[li] - ii_rowspace),li + 1,ids_objects.rowcount())

				if li_row > 0 then
					li_y2 = ids_objects.object.y[li_row]
				else

					if ls_processing = "4" and ls_band = "header" then

						if idw_requestor.describe(ids_objects.object.name[li] + ".band") <> ls_prior_band then
							li_y = 0
							ls_prior_band = idw_requestor.describe(ids_objects.object.name[li] + ".band")
						end if

						li_y2 = long(idw_requestor.describe("datawindow." + ls_prior_band + ".Height"))
					else

						if ids_objects.object.reportname[li] = "" then
							li_row = ids_reportobj.find("Band='" + ls_band + "' AND Y>" + string(ids_objects.object.y[li]),1,ids_reportobj.rowcount())

							if li_row > 0 then
								li_y2 = ids_reportobj.object.y[li_row]
							else
								li_y2 = long(idw_requestor.describe("datawindow." + ls_band + ".Height"))
							end if

						else
							lds_temp.dataobject = idw_requestor.describe(ids_objects.object.reportname[li] + ".dataobject")
							li_y2 = long(lds_temp.describe("datawindow." + ls_band + ".Height")) + long(idw_requestor.describe(ids_objects.object.reportname[li] + ".Y"))
						end if

					end if

				end if

				ids_rowheight.object.height[lk] = (li_y2 - li_y)
				li_height = 0

				if lb_border then

					if ids_objects.object.startrow[li] > 1 then
						li_beginrow = ids_line.find("ReportName='" + ids_objects.object.reportname[li] + "' AND Band='" + ids_objects.object.band[li] + "' AND linetype='h' and startrow=" + string(ids_objects.object.startrow[li] - 1),ids_line.rowcount(),1)
					else
						li_beginrow = ids_line.find("ReportName='" + ids_objects.object.reportname[li] + "' AND Band='" + ids_objects.object.band[li] + "' AND linetype='h' and startrow=" + string(ids_objects.object.startrow[li]),1,ids_line.rowcount())
					end if

					if li_beginrow > 0 then
						li_y = ids_line.object.y1[li_beginrow]
					else

						if ids_objects.object.startrow[li] = 1 then
							li_y = 0
						else
							li_y = ids_objects.object.y[li]
						end if

					end if

					if ids_objects.object.startrow[li] > 1 then
						li_endrow = ids_line.find("ReportName='" + ids_objects.object.reportname[li] + "' AND Band='" + ids_objects.object.band[li] + "' AND linetype='h' and startrow=" + string(ids_objects.object.startrow[li]),1,ids_line.rowcount())
					else
						li_endrow = ids_line.find("ReportName='" + ids_objects.object.reportname[li] + "' AND Band='" + ids_objects.object.band[li] + "' AND linetype='h' and startrow=" + string(ids_objects.object.startrow[li]),ids_line.rowcount(),1)
					end if

					if li_endrow > 0 then
						li_height = ids_line.object.y1[li_endrow] - li_y
					end if

				end if

				if li_height > 0 then
					ids_rowheight.object.height[lk] = li_height
				end if

				li_bandrow = ids_objects.object.startrow[li]
				li_y = li_y2
			end if

		end if

	end if

next

for li = ids_rowheight.rowcount() to 1 step -1

	choose case is_units
		case "0"
			li_height = ids_rowheight.object.height[li]
		case "1"
			li_height = pixelstounits(ids_rowheight.object.height[li],ypixelstounits!)
		case "2"
			li_height = pixelstounits((ids_rowheight.object.height[li] * 96) / 1000,ypixelstounits!)
		case "3"
			li_height = pixelstounits((ids_rowheight.object.height[li] * 37.8) / 1000,ypixelstounits!)
	end choose

	if li_height < 60 then
		li_height = 60
	end if

	ids_rowheight.object.height[li] = (li_height / 4.9)

next

destroy(lds_temp)
end subroutine

protected function integer of_groupcount ();string ls_temp, ls_processing
long li
long li_pos
long li_pos2
long li_groupcount

ls_temp = idw_requestor.describe("datawindow.bands")
ls_processing = idw_requestor.Describe("DataWindow.Processing")

li_pos = 1

do while li_pos > 0
	if ls_processing = '8' then  ///-- trường hợp tree dw --//
		li_pos = pos(ls_temp,"tree.level.",li_pos)
	else
		li_pos = pos(ls_temp,"header.",li_pos)
	end if
	if li_pos > 0 then
		li_groupcount ++
		li_pos ++
	end if
loop


if li_groupcount > 0 then
	ls_temp = idw_requestor.describe("datawindow.syntax")
	li_pos = pos(ls_temp,"group(level=1 ")
	ls_temp = mid(ls_temp,li_pos)
	li = 1

	do while li_pos > 0
		li_pos2 = pos(ls_temp,"group(level=" + string(li))

		if li_pos2 > 0 then
			li_pos = pos(mid(ls_temp,li_pos2 - li_pos),"newpage=yes")
		else
			li_pos = pos(ls_temp,"newpage=yes",li_pos)
		end if

		if li_pos > 0 then
			ib_groupnewpage[li] = true
		else
			ib_groupnewpage[li] = false
		end if

		li_pos = li_pos2
		li ++
	loop

end if
//////////////////////////////////////////////
//if li_groupcount = 1 then
//
//	if ib_groupnewpage[1] then
//		ib_groupoutflag = false
//	end if
//
//end if
/////////////////////////////////////////////
return li_groupcount
end function

protected function long of_parsetoarray (string as_source,string as_delimiter,ref string as_array[]);long ll_dellen
long ll_pos
long ll_count
long ll_start
long ll_length
string ls_holder
long ll_null

if ((isnull(as_source)) or (isnull(as_delimiter))) then
	setnull(ll_null)
	return ll_null
end if

if trim(as_source) = "" then
	return 0
end if

ll_dellen = len(as_delimiter)
ll_pos = pos(upper(as_source),upper(as_delimiter))

if ll_pos = 0 then
	as_array[1] = as_source
	return 1
end if

ll_count = 0
ll_start = 1

do while ll_pos > 0
	ll_length = ll_pos - ll_start
	ls_holder = mid(as_source,ll_start,ll_length)
	ll_count ++
	as_array[ll_count] = ls_holder
	ll_start = ll_pos + ll_dellen
	ll_pos = pos(upper(as_source),upper(as_delimiter),ll_start)
loop

ls_holder = mid(as_source,ll_start,len(as_source))

if len(ls_holder) > 0 then
	ll_count ++
	as_array[ll_count] = ls_holder
end if

return ll_count
end function

protected function string of_replace (string as_string1,string as_string2,string as_string3);long ll_pos
long ll_f

long ll_r

ll_f = len(as_string2)
ll_r = len(as_string3)
ll_pos = pos(as_string1,as_string2)

do while ll_pos <> 0
	as_string1 = replace(as_string1,ll_pos,ll_f,as_string3)
	ll_pos = pos(as_string1,as_string2,ll_pos + ll_r)
loop

return as_string1
end function

public subroutine of_setformflag (boolean ab_flag);ib_formflag = ab_flag
end subroutine

public subroutine of_setgridborder (boolean ab_flag);ib_gridborder = ab_flag
end subroutine

public subroutine of_setgroupoutflag (boolean as_flag);ib_groupoutflag = as_flag
end subroutine

public subroutine of_setprintheader (integer ai_style);ii_printheader = ai_style
end subroutine

public subroutine of_set_openexcel (boolean ab_flag);ib_openexcel = ab_flag
end subroutine

public function long of_lastpos (string as_source, string as_target, long al_start);Long	ll_Cnt, ll_Pos

//Check for Null Parameters.
IF IsNull(as_source) or IsNull(as_target) or IsNull(al_start) Then
	SetNull(ll_Cnt)
	Return ll_Cnt
End If

//Check for an empty string
If Len(as_Source) = 0 Then
	Return 0
End If

// Check for the starting position, 0 means start at the end.
If al_start=0 Then  
	al_start=Len(as_Source)
End If

//Perform find
For ll_Cnt = al_start to 1 Step -1
	ll_Pos = Pos(as_Source, as_Target, ll_Cnt)
	If ll_Pos = ll_Cnt Then 
		//String was found
		Return ll_Cnt
	End If
Next

//String was not found
Return 0

end function

public function integer of_analyze_cells ();string ls_bands[], ls_property,ls_objects[]
integer li, lj, li_row, li_beginrow, li_endrow
integer li_count
string ls_processing
string ls_syntax,ls_err,ls_exp

ls_processing = idw_requestor.describe("datawindow.Processing")

if ls_processing = "4" then
	idw_requestor.modify("DataWindow.Crosstab.StaticMode=Yes")
end if

is_linetag = trim(is_linetag)
is_format_currency = of_get_currency_format()
is_units = idw_requestor.describe("datawindow.units")

if ii_rowspace < 0 then
	ii_rowspace = 30
end if

if ii_colspace < 0 then
	ii_colspace = 30
end if

choose case is_units
	case "1"
		ii_rowspace = unitstopixels(ii_rowspace,xunitstopixels!)
		ii_colspace = unitstopixels(ii_colspace,yunitstopixels!)
	case "2"
		ii_rowspace = (unitstopixels(ii_rowspace,xunitstopixels!) * 0.01041) * 1000
		ii_colspace = (unitstopixels(ii_colspace,yunitstopixels!) * 0.01041) * 1000
	case "3"
		ii_rowspace = (unitstopixels(ii_rowspace,xunitstopixels!) * 0.02646) * 1000
		ii_colspace = (unitstopixels(ii_colspace,yunitstopixels!) * 0.02646) * 1000
end choose

ls_exp = idw_requestor.describe("dw2xls_formflag.Tag")
idw_requestor.modify("dw2xls_formflag.visible='0'")

if ls_exp = "0" then
	ib_formflag = false
else

	if ls_exp = "1" then
		ib_formflag = true
	end if

end if

of_getobjects('')
of_getgridinfo("")
of_getcolumninfo()
of_getcolrowinfo()
of_getrowheight()


string ls_findstring

for li = 1 to ids_line.rowcount()
//	if trim(lower(ids_line.object.name[li])) = 'gutter' then return 1
	ls_findstring = "reportname='" + ids_line.object.reportname[li] + "' AND Band='" + ids_line.object.band[li] + "'" &
			 + " AND Y2<=" + string(ids_line.object.y1[li] + ii_rowspace)
	li_row = ids_objects.find(ls_findstring,1,ids_objects.rowcount())
	if li_row > 0 then
		ids_line.object.firstflag[li] = 1
	end if
next

if ib_mergecolumnheader then

	if trim(is_beginrowobj) <> "" then
		li = ids_objects.find("reportName='' AND name='" + trim(lower(is_beginrowobj)) + "'",1,ids_objects.rowcount())

		if li > 0 then
			li_beginrow = ids_objects.object.startrow[li]
		end if

	end if

	if li_beginrow = 0 then
		ids_objects.setfilter("reportName='' AND band='header' AND Right(name,2)='_t' ")
		ids_objects.filter()
		li_beginrow = long(ids_objects.describe("Evaluate('Min(StartRow)',1)"))
	end if

	if li_beginrow > 0 then
		ids_objects.setfilter("reportName='' AND band='header' AND StartRow>=" + string(li_beginrow))
		ids_objects.filter()
		ids_objects.setsort(" X A ,Y A ,X2 A ")
		ids_objects.sort()
		li_endrow = long(ids_objects.describe("Evaluate('Max(EndRow)',1)"))

		for li_row = 1 to ids_objects.rowcount()
//			ids_objects
			if ids_objects.object.startrow[li_row] > li_beginrow then

				if li_row = 1 then
					ids_objects.object.startrow[li_row] = li_beginrow
				else
					lj = ids_objects.find("endrow<" + string(ids_objects.object.startrow[li_row]) + " AND x<=" + string(ids_objects.object.x2[li_row]) + " AND x2>=" + string(ids_objects.object.x[li_row]),ids_objects.rowcount(),1)

					if lj > 1 then
						ids_objects.object.startrow[li_row] = (ids_objects.object.endrow[lj] + 1)
					else
						ids_objects.object.startrow[li_row] = li_beginrow
					end if

				end if

			end if

			if ids_objects.object.endrow[li_row] < li_endrow then

				if li_row = ids_objects.rowcount() then
					ids_objects.object.endrow[li_row] = li_endrow
				else
					lj = ids_objects.find("startrow>" + string(ids_objects.object.endrow[li_row]) + " AND x<=" + string(ids_objects.object.x2[li_row]) + " AND x2>=" + string(ids_objects.object.x[li_row]),1,ids_objects.rowcount())

					if lj > 1 then
						ids_objects.object.endrow[li_row] = (ids_objects.object.startrow[lj] - 1)
					else
						ids_objects.object.endrow[li_row] = li_endrow
					end if

				end if

			end if

			if ids_objects.object.endrow[li_row] < ids_objects.object.startrow[li_row] then
				ids_objects.object.endrow[li_row] = ids_objects.object.startrow[li_row]
			end if

		next

		if li_beginrow > 0 then
			ii_borderbeginrow = li_beginrow
		end if

	end if

end if

if ii_borderbeginrow > 0 then
	li = ids_objects.find("reportName='' AND name='report_title'",1,ids_objects.rowcount())

	if li > 0 then

		if ids_objects.object.endrow[li] >= ii_borderbeginrow then
			ii_borderbeginrow = ids_objects.object.endrow[li] + 2
		end if

	end if

end if

if ids_reportobj.rowcount() > 0 then
	ids_reportobj.setsort(" y A ,X A ")
	ids_reportobj.sort()

	for li = 1 to ids_reportobj.rowcount()
		ids_objects.setfilter("reportname='' AND y2<=" + idw_requestor.describe(ids_reportobj.object.name[li] + ".y"))
		ids_objects.filter()
		li_row = long(ids_objects.describe("Evaluate('Max(EndRow)',0)"))
		ids_reportobj.object.startrow[li] = (li_row + 1)
	next

end if

if ls_processing = "1" then
	ib_gridborder = true
	invo_worksheet.of_hide_gridlines(1)
elseif ls_processing = "4" then
	invo_worksheet.of_hide_gridlines(1)
end if

of_createstructure()

ids_objects.setfilter("reportname<>''")
ids_objects.filter()

if ids_objects.rowcount() > 0 then
	ids_objects.rowsmove(1,ids_objects.rowcount(),primary!,ids_objects,1,delete!)
	ids_objects.resetupdate()
	ids_objects.SetFilter('')
	ids_objects.Filter()
end if

RETURN 1
end function

protected subroutine of_getcolrowinfo ();long li, lj, li_row, li_count, li_startcol, li_endcol, li_y, li_beginrow, li_colcount
string ls_processing, ls_band
boolean lb_foregroundflag = false
boolean lb_border = false
datastore lds_temp
long ll_objspace = 100, ll_space, li_line_top, li_line_bottom, li_line_left, li_line_right

ls_processing = idw_requestor.describe("datawindow.processing")
ids_column.setsort("x A ")
ids_column.sort()
ii_maxcol = long(ids_column.describe("Evaluate('Max(EndCol)',1)"))
ids_objects.setfilter("isReport<>'1' ")
ids_objects.filter()
ids_line.setfilter("")
ids_line.filter()

if ids_line.rowcount() > 0 then
	lb_border = true
end if

if lb_border then
	string ls_err
	lds_temp = create datastore
	lds_temp.create(ids_line.describe("datawindow.syntax"),ls_err)
	ids_line.setfilter("lineType='v'")
	ids_line.filter()
	ids_line.rowscopy(1,ids_line.rowcount(),primary!,lds_temp,1,primary!)
	ids_line.setfilter("lineType='h'")
	ids_line.setsort("ReportName A, Band A, Y1 A ")
	ids_line.filter()
	ids_line.sort()
	lds_temp.setsort("ReportName A, Band A, X1 A ")
	lds_temp.sort()

	if ids_line.rowcount() > 0 and ib_formflag then

		for li = 1 to ids_objects.rowcount()
			li_row = ids_line.find("reportname='" + ids_objects.object.reportname[li] + "' AND Band='" + ids_objects.object.band[li] + "' AND y1<= " + string(ids_objects.object.y[li] + ii_rowspace) + " and x1< " + string(ids_objects.object.x2[li]) + " and x2> " + string(ids_objects.object.x[li]),ids_line.rowcount(),1)

			if li_row > 0 then
				ids_objects.object.topline[li] = ids_line.object.y1[li_row]
			end if

			li_row = ids_line.find("reportname='" + ids_objects.object.reportname[li] + "' AND Band='" + ids_objects.object.band[li] + "'  AND y1>= " + string(ids_objects.object.y2[li] - ii_rowspace) + " and x1< " + string(ids_objects.object.x2[li]) + " and x2> " + string(ids_objects.object.x[li]),1,ids_line.rowcount())

			if li_row > 0 then
				ids_objects.object.bottomline[li] = ids_line.object.y1[li_row]
			end if

			li_row = lds_temp.find("reportname='" + ids_objects.object.reportname[li] + "' AND Band='" + ids_objects.object.band[li] + "' " + "  AND y1<= " + string(ids_objects.object.y[li] + ii_rowspace) + " AND Y2>= " + string(ids_objects.object.y2[li] - ii_rowspace) + " AND x1< " + string(ids_objects.object.x[li] + ii_colspace),lds_temp.rowcount(),1)

			if li_row > 0 then
				ids_objects.object.leftline[li] = lds_temp.object.x1[li_row]
				ids_objects.object.startcol[li] = lds_temp.object.startcol[li_row]
			end if

			li_row = lds_temp.find("reportname='" + ids_objects.object.reportname[li] + "' AND  Band='" + ids_objects.object.band[li] + "' " + " AND y1<= " + string(ids_objects.object.y[li] + ii_rowspace) + " AND Y2>= " + string(ids_objects.object.y2[li] - ii_rowspace) + " AND x1> " + string(ids_objects.object.x2[li] - ii_colspace),1,lds_temp.rowcount())

			if li_row > 0 then
				ids_objects.object.rightline[li] = lds_temp.object.x1[li_row]
				ids_objects.object.endcol[li] = (lds_temp.object.startcol[li_row] - 1)
			end if

		next

		destroy(lds_temp)
	end if

end if

ids_objects.setsort("reportName A , Band A, y A  ")
ids_objects.sort()
li_count = ids_objects.rowcount()

for lj = 1 to 2

	for li = 1 to li_count
		li_row = ids_objects.find("reportname='" + ids_objects.object.reportname[li] + "' AND y2< " + string(ids_objects.object.y[li]) + " AND Band='" + ids_objects.object.band[li] + "'",li - 1,1)

		if li_row > 0 then
			ids_objects.object.startrow[li] = (ids_objects.object.endrow[li_row] + 1)
			ids_objects.object.endrow[li] = ids_objects.object.startrow[li]
		end if

		li_row = ids_objects.find("reportname='" + ids_objects.object.reportname[li] + "' AND y>" + string(ids_objects.object.y2[li] - ii_rowspace) + " AND Band='" + ids_objects.object.band[li] + "'",li + 1,ids_objects.rowcount())

		if li_row > 0 then

			if ids_objects.object.startrow[li_row] > ids_objects.object.startrow[li] then
				ids_objects.object.endrow[li] = (ids_objects.object.startrow[li_row] - 1)
			end if

		else
			li_row = ids_objects.find("reportname='" + ids_objects.object.reportname[li] + "' AND EndRow>" + string(ids_objects.object.endrow[li]) + " AND Band='" + ids_objects.object.band[li] + "'",1,ids_objects.rowcount())

			if li_row > 0 then
				ids_objects.object.endrow[li] = ids_objects.object.endrow[li_row]
			end if

		end if

	next

next

ids_objects.setsort(" x A   ")
ids_objects.setfilter("isreport<>'1' ")
ids_objects.filter()
ids_objects.sort()
li_count = ids_objects.rowcount()

for li = 1 to li_count
	li_startcol = 0
	li_endcol = 0

	if ids_objects.object.name[li] = "report_title" and ids_objects.object.reportname[li] = "" then

		if ids_objects.find("startrow=" + string(ids_objects.object.startrow[li]) + " AND Name<>'report_title'",1,ids_objects.rowcount()) <= 0 then
			ids_objects.object.startcol[li] = ii_firstcolumn
			ids_objects.object.endcol[li] = ii_maxcol
			continue
		end if

	end if

	li_row = 1

	if ids_objects.object.leftline[li] > 0 and ids_objects.object.rightline[li] > 0 then
		li_row = ids_objects.find("reportname='" + ids_objects.object.reportname[li] + "' AND  Band='" + ids_objects.object.band[li] + "' " + " AND name<>'" + ids_objects.object.name[li] + "' AND TopLine=" + string(ids_objects.object.topline[li]) + " AND BottomLine=" + string(ids_objects.object.bottomline[li]) + " AND LeftLine=" + string(ids_objects.object.leftline[li]) + " AND RightLine=" + string(ids_objects.object.rightline[li]),1,ids_objects.rowcount())

		if li_row > 0 then
			ids_objects.object.cellflag[li] = "1"
		end if

	end if

	if li_row > 0 then
		li_row = ids_column.find("x2<=" + string(ids_objects.object.x[li] + ii_colspace),ids_column.rowcount(),ii_firstcolumn)

		if li_row > 0 then
			li_startcol = ids_column.object.endcol[li_row] + 1
		else
			li_startcol = ii_firstcolumn
		end if

		li_row = ids_column.find("x>" + string(ids_objects.object.x2[li] - ii_colspace),ii_firstcolumn,ids_column.rowcount())

		if li_row > 0 then
			li_endcol = ids_column.object.startcol[li_row] - 1
		else
			li_endcol = ii_maxcol
		end if

		ids_objects.object.startcol[li] = li_startcol
		ids_objects.object.endcol[li] = li_endcol
	end if

	if ids_objects.object.endcol[li] < ids_objects.object.startcol[li] then
		ids_objects.object.endcol[li] = ids_objects.object.startcol[li]
	end if

next

ids_objects.setfilter("LeftLine>0 AND RightLine>0 AND (TopLine>0 OR BottomLine>0) AND CellFlag<>'1' ")
ids_objects.setsort("ReportName A ,Band A , y A, X A   ")
ids_objects.filter()
ids_objects.sort()

if ids_line.rowcount() > 0 and ids_objects.rowcount() > 0 then

	for li = 1 to ids_objects.rowcount()

		if ids_objects.object.topline[li] = 0 and ids_objects.object.band[li] = "header" then
			continue
		else

			if ids_objects.object.bottomline[li] = 0 and ids_objects.object.band[li] = "summary" then
				continue
			end if

		end if

		li_line_top = 0
		li_line_bottom = 0

		if ids_objects.object.topline[li] > 0 then
			li_line_top = ids_line.find("reportname='" + ids_objects.object.reportname[li] + "' AND Band='" + ids_objects.object.band[li] + "' AND LineType='h' " + " and x1< " + string(ids_objects.object.x2[li]) + " and x2> " + string(ids_objects.object.x[li]) + " AND y1= " + string(ids_objects.object.topline[li]),ids_line.rowcount(),1)
		end if

		if li_line_top > 0 then
			li_row = ids_objects.find("reportname='" + ids_objects.object.reportname[li] + "' AND Band='" + ids_objects.object.band[li] + "' " + " AND name<>'' AND y>= " + string(ids_line.object.y1[li_line_top] - ii_rowspace) + " AND x< " + string(ids_line.object.x2[li_line_top]) + " AND x2> " + string(ids_line.object.x1[li_line_top]),1,li - 1)

			if li_row > 0 then
				ids_objects.object.startrow[li] = ids_objects.object.startrow[li_row]
			end if

		else

			if ids_objects.object.band[li] <> "summary" and ids_objects.object.band[li] <> "footer" then
				ids_objects.object.startrow[li] = 1
			end if

		end if

		if ids_objects.object.bottomline[li] > 0 then
			li_line_bottom = ids_line.find("reportname='" + ids_objects.object.reportname[li] + "' AND Band='" + ids_objects.object.band[li] + "' AND LineType='h' " + " and x1< " + string(ids_objects.object.x2[li]) + " and x2> " + string(ids_objects.object.x[li]) + " AND y1= " + string(ids_objects.object.bottomline[li]),ids_line.rowcount(),1)
		end if

		if li_line_bottom > 0 then
			li_row = ids_objects.find("reportname='" + ids_objects.object.reportname[li] + "' AND Band='" + ids_objects.object.band[li] + "' " + " AND name<>'' AND y< " + string(ids_line.object.y1[li_line_bottom]) + " AND x< " + string(ids_line.object.x2[li_line_bottom]) + " AND x2> " + string(ids_line.object.x1[li_line_bottom]),ids_objects.rowcount(),li + 1)

			if li_row > 0 then

				if ids_objects.object.endrow[li_row] > ids_objects.object.endrow[li] then
					ids_objects.object.endrow[li] = ids_objects.object.endrow[li_row]
				end if

			end if

		else

			if ids_objects.object.band[li] <> "summary" and ids_objects.object.band[li] <> "footer" then
				li_row = ids_objects.find(" reportname='" + ids_objects.object.reportname[li] + "'  AND Band='" + ids_objects.object.band[li] + "' " + " AND name<>'' AND EndRow>" + string(ids_objects.object.endrow[li]),ids_objects.rowcount(),li + 1)

				if li_row > 0 then
					ids_objects.object.endrow[li] = ids_objects.object.endrow[li_row]
				end if

			end if

		end if

		if ids_objects.object.endrow[li] < ids_objects.object.startrow[li] then
			ids_objects.object.endrow[li] = ids_objects.object.startrow[li]
		end if

	next

	destroy(lds_temp)
end if

if ls_processing = "4" then
	ids_objects.setfilter("reportName='' AND band='header[1]' And name<>'' ")
	ids_objects.filter()

	for li_row = 1 to ids_objects.rowcount()
		ids_objects.object.band[li_row] = "header"
	next

	li_beginrow = long(ids_objects.describe("Evaluate('Max(EndRow)',1)"))

	if lb_foregroundflag then
		ii_borderbeginrow = li_beginrow
	end if

	ii_borderbeginrow = ii_borderbeginrow + 1
	li_beginrow = li_beginrow + 1
	li_count = long(ids_objects.describe("Evaluate('Max(EndRow)',1)"))
	li_y = long(idw_requestor.describe("datawindow.header[1].height"))
	li = 2
	ls_band = "header[" + string(li) + "]"

	do while idw_requestor.describe("datawindow." + ls_band + ".height") <> "!"
		ids_objects.setfilter("reportName='' AND band='" + ls_band + "'")
		ids_objects.filter()
		ids_objects.sort()

		for li_row = 1 to ids_objects.rowcount()
			ids_objects.object.band[li_row] = "header"
			ids_objects.object.y[li_row] = (ids_objects.object.y[li_row] + li_y)
			ids_objects.object.startrow[li_row] = (ids_objects.object.startrow[li_row] + li_count)
			ids_objects.object.endrow[li_row] = (ids_objects.object.endrow[li_row] + li_count)
		next

		li_count = long(ids_objects.describe("Evaluate('Max(EndRow)',1)"))
		li_y += long(idw_requestor.describe("datawindow." + ls_band + ".height"))
		li ++
		ls_band = "header[" + string(li) + "]"
	loop

end if

if lb_border then
	ids_objects.setfilter("isReport<>'1' ")
	ids_objects.filter()
	ids_objects.setsort("StartRow A, EndRow A  ")
	ids_objects.sort()
	ids_line.setfilter("")
	ids_line.filter()
	ids_line.setsort(" Y1 A ")
	ids_line.sort()

	for li = 1 to ids_line.rowcount()
		li_row = 0

		if ids_line.object.linetype[li] = "h" then
			li_row = ids_objects.find("reportname='" + ids_line.object.reportname[li] + "' AND Band='" + ids_line.object.band[li] + "' AND  y2<= " + string(ids_line.object.y1[li] + ii_rowspace),ids_objects.rowcount(),1)

			if li_row > 0 then
				ids_line.object.startrow[li] = ids_objects.object.startrow[li_row]
			else
				ids_line.object.startrow[li] = 1
			end if

		else
			li_row = ids_objects.find("reportname='" + ids_line.object.reportname[li] + "' AND Band='" + ids_line.object.band[li] + "' AND  y>= " + string(ids_line.object.y1[li] - ii_rowspace),1,ids_objects.rowcount())

			if li_row > 0 then
				ids_line.object.startrow[li] = ids_objects.object.startrow[li_row]
			end if

		end if

		ids_line.object.endrow[li] = ids_line.object.startrow[li]

		if ids_line.object.linetype[li] = "v" then
			li_row = ids_objects.find("reportname='" + ids_line.object.reportname[li] + "' AND Band='" + ids_line.object.band[li] + "' AND y2<= " + string(ids_line.object.y2[li] + ii_rowspace),ids_objects.rowcount(),1)

			if li_row > 0 then
				ids_line.object.endrow[li] = ids_objects.object.endrow[li_row]
			end if

		end if

	next

	ids_line.setfilter("")
	ids_line.filter()
	ids_line.setsort("x1 A  ")
	ids_line.sort()
	li_colcount = long(ids_column.describe("Evaluate('Max(EndCol)',1)"))

	for li = 1 to ids_line.rowcount()
		li_row = ids_column.find("x<= " + string(ids_line.object.x1[li] + ii_colspace),ids_column.rowcount(),ii_firstcolumn)

		if li_row > 0 then
			ids_line.object.startcol[li] = ids_column.object.startcol[li_row]
		else
			ids_line.object.startcol[li] = ii_firstcolumn
		end if

		ids_line.object.endcol[li] = ids_line.object.startcol[li]

		if ids_line.object.linetype[li] = "h" then
			li_row = ids_column.find("x>= " + string(ids_line.object.x2[li] - ii_colspace),ii_firstcolumn,ids_column.rowcount())

			if li_row > 0 then

				if ids_column.object.startcol[li_row] > ids_line.object.startcol[li] then
					ids_line.object.endcol[li] = (ids_column.object.startcol[li_row] - 1)
				end if

			else
				ids_line.object.endcol[li] = li_colcount
			end if

		end if

	next

end if

ids_column.setfilter("")
ids_column.filter()
ids_column.setsort("StartCol A")
ids_column.sort()
ids_objects.setfilter("isreport<>'1' ")
ids_objects.filter()
ids_objects.setsort("ReportName A,Band A , X  A ,StartRow A ,X2 A ")
ids_objects.sort()
li_count = ids_objects.rowcount()

choose case is_units
	case "1"
		ll_objspace = unitstopixels(ll_objspace,xunitstopixels!)
	case "2"
		ll_objspace = (unitstopixels(ll_objspace,xunitstopixels!) * 0.01041) * 1000
	case "3"
		ll_objspace = (unitstopixels(ll_objspace,xunitstopixels!) * 0.02646) * 1000
end choose

for li = 1 to li_count

	if ids_objects.object.isborderonly[li] = "1" then
	else

		if ids_objects.object.alignment[li] = 1 then

			if ids_objects.object.startcol[li] >= 1 and ids_objects.object.startcol[li] <= ids_column.rowcount() then
				ll_space = ids_objects.object.x[li] - ids_column.object.x[ids_objects.object.startcol[li]]

				choose case is_units
					case "1"
						ll_space = pixelstounits(ll_space,xpixelstounits!)
					case "2"
						ll_space = pixelstounits((ll_space * 96) / 1000,xpixelstounits!)
					case "3"
						ll_space = pixelstounits((ll_space * 37.8) / 1000,xpixelstounits!)
				end choose

				if ll_space <= 50 then
					ll_space = 0
				end if

				ids_objects.object.objspace[li] = ll_space
			end if

		end if

		if li > 1 then
			li_row = ids_objects.find("reportname='" + ids_objects.object.reportname[li] + "' AND " + "band='" + ids_objects.object.band[li] + "' and " + "isborderonly<>'1' and " + "startrow<=" + string(ids_objects.object.endrow[li]) + " and " + "endrow>=" + string(ids_objects.object.startrow[li]) + " AND " + "endcol>=" + string(ids_objects.object.startcol[li]),li - 1,1)

			if li_row > 0 then

				if ids_objects.object.endcol[li] > ids_objects.object.endcol[li_row] then

					if ids_column.object.x[ids_objects.object.startcol[li] + 1] - ids_objects.object.x[li] < ll_objspace then
						ids_objects.object.startcol[li] = (ids_objects.object.startcol[li] + 1)
						ids_objects.object.objspace[li] = 0
						continue
					end if

				end if

				if ids_objects.object.startcol[li] > 0 and ids_objects.object.startcol[li] <= ids_column.rowcount() then

					if ids_objects.object.x2[li_row] - ids_column.object.x[ids_objects.object.startcol[li]] < ll_objspace then

						if ids_objects.object.endcol[li_row] > ids_objects.object.startcol[li_row] then
							ids_objects.object.endcol[li_row] = (ids_objects.object.startcol[li] - 1)
							ids_objects.object.objspace[li] = 0
							continue
						else

							if ids_objects.object.endcol[li] > ids_objects.object.startcol[li] then
								ids_objects.object.endcol[li] = (ids_objects.object.endcol[li] - 1)
								continue
							end if

						end if

					end if

				end if

				ids_objects.object.startcol[li] = ids_objects.object.startcol[li_row]

				if ids_objects.object.x[li] > ids_objects.object.x2[li_row] and ids_objects.object.startrow[li] = ids_objects.object.startrow[li_row] then
					ll_space = ids_objects.object.x[li] - ids_objects.object.x2[li_row]

					choose case is_units
						case "1"
							ll_space = pixelstounits(ll_space,xpixelstounits!)
						case "2"
							ll_space = pixelstounits((ll_space * 96) / 1000,xpixelstounits!)
						case "3"
							ll_space = pixelstounits((ll_space * 37.8) / 1000,xpixelstounits!)
					end choose

					if ll_space <= 50 then
						ll_space = 0
					end if

					ids_objects.object.objspace[li] = ll_space
					ids_objects.object.mergeflag[li_row] = "1"
					ll_space = ids_objects.object.width[li_row]

					choose case is_units
						case "1"
							ll_space = pixelstounits(ll_space,xpixelstounits!)
						case "2"
							ll_space = pixelstounits((ll_space * 96) / 1000,xpixelstounits!)
						case "3"
							ll_space = pixelstounits((ll_space * 37.8) / 1000,xpixelstounits!)
					end choose

					if ll_space <= 50 then
						ll_space = 0
					end if

					ids_objects.object.width[li_row] = ll_space
				end if

			else
				li_row = ids_objects.find("reportname='" + ids_objects.object.reportname[li] + "' AND " + "band='" + ids_objects.object.band[li] + "' and " + "isborderonly='1' and " + "startrow<=" + string(ids_objects.object.endrow[li]) + " and " + "endrow>=" + string(ids_objects.object.startrow[li]) + " AND " + "startcol<=" + string(ids_objects.object.endcol[li]) + " AND " + "endcol>=" + string(ids_objects.object.startcol[li]),1,ids_objects.rowcount())

				if li_row > 0 then
					li_beginrow = ids_objects.find("reportname='" + ids_objects.object.reportname[li_row] + "' AND " + "band='" + ids_objects.object.band[li_row] + "' and " + "isborderonly<>'1' and " + "startrow<=" + string(ids_objects.object.endrow[li_row]) + " and " + "endrow>=" + string(ids_objects.object.startrow[li_row]) + " AND " + "startcol<=" + string(ids_objects.object.endcol[li_row]) + " AND " + "endcol>=" + string(ids_objects.object.startcol[li_row]) + " AND " + "getRow()<>" + string(li),1,ids_objects.rowcount())

					if li_beginrow <= 0 then
						ids_objects.object.startrow[li] = ids_objects.object.startrow[li_row]
						ids_objects.object.endrow[li] = ids_objects.object.endrow[li_row]
						ids_objects.object.startcol[li] = ids_objects.object.startcol[li_row]
						ids_objects.object.endcol[li] = ids_objects.object.endcol[li_row]
					end if

				end if

			end if

		end if

	end if

next


for li = 1 to ids_reportobj.rowcount()
	li_row = ids_objects.find("ReportName='" + ids_reportobj.object.name[li] + "'",1,ids_objects.rowcount())

	if li_row > 0 then
		ids_reportobj.object.startcol[li] = ids_objects.object.startcol[li_row]
	end if

	li_row = ids_objects.find("ReportName='" + ids_reportobj.object.name[li] + "'",ids_objects.rowcount(),1)

	if li_row > 0 then
		ids_reportobj.object.endcol[li] = ids_objects.object.endcol[li_row]
	end if

next



destroy(lds_temp)
end subroutine

protected subroutine of_getgridinfo (string as_reportname);integer li
integer lj
integer li_row
long li_x
long li_y
long li_width = 20
long li_space = 50

if ids_line.rowcount() <= 0 then
	return
end if

choose case is_units
	case "1"
		li_width = unitstopixels(li_width,xunitstopixels!)
		li_space = unitstopixels(li_space,yunitstopixels!)
	case "2"
		li_width = unitstopixels(li_width,xunitstopixels!) * 0.1041
		li_space = unitstopixels(li_space,yunitstopixels!) * 0.1041
	case "3"
		li_width = unitstopixels(li_width,xunitstopixels!) * 2.646
		li_space = unitstopixels(li_space,yunitstopixels!) * 2.646
end choose

ids_line.setfilter("")
ids_line.filter()

for li = ids_line.rowcount() to 1 step -1

	if ids_line.object.x2[li] = ids_line.object.x1[li] and ids_line.object.y2[li] = ids_line.object.y1[li] then
		ids_line.deleterow(li)
	else

		if ((ids_line.object.x2[li] < 0 and ids_line.object.x1[li] < 0) or (ids_line.object.y2[li] < 0 and ids_line.object.y1[li] < 0)) then
			ids_line.deleterow(li)
		else

			if ids_line.object.x2[li] < ids_line.object.x1[li] then
				li_x = ids_line.object.x1[li]
				ids_line.object.x1[li] = ids_line.object.x2[li]
				ids_line.object.x2[li] = li_x
			end if

			if ids_line.object.y2[li] < ids_line.object.y1[li] then
				li_y = ids_line.object.y1[li]
				ids_line.object.y1[li] = ids_line.object.y2[li]
				ids_line.object.y2[li] = li_y
			end if

			if ids_line.object.x2[li] - ids_line.object.x1[li] > li_width then
				ids_line.object.linetype[li] = "h"
			else
				ids_line.object.linetype[li] = "v"
			end if

		end if

	end if

next

ids_line.setfilter("lineType='h'")
ids_line.filter()
ids_line.setsort("ReportName A, Band A ,Y1 A")
ids_line.sort()
ids_objects.setfilter("")
ids_objects.setsort(" Y A")
ids_objects.filter()
ids_objects.sort()

for li = ids_line.rowcount() to 2 step -1

	if ((ids_line.object.reportname[li] <> ids_line.object.reportname[li - 1]) or (ids_line.object.band[li] <> ids_line.object.band[li - 1])) then
	else
		li_row = ids_objects.find("ReportName='" + ids_line.object.reportname[li] + "' AND Band='" + ids_line.object.band[li] + "' AND y> " + string(ids_line.object.y1[li - 1] - ii_rowspace) + " AND Y2< " + string(ids_line.object.y1[li] + ii_rowspace),1,ids_objects.rowcount())

		if li_row <= 0 then

			if ids_line.object.y1[li] - ids_line.object.y1[li - 1] > li_space then
				li_row = ids_objects.insertrow(0)
				ids_objects.object.x[li_row] = (ids_line.object.x1[li - 1] + ii_colspace)
				ids_objects.object.y[li_row] = (ids_line.object.y1[li - 1] + ii_rowspace)
				ids_objects.object.width[li_row] = li_space
				ids_objects.object.height[li_row] = li_space
				ids_objects.object.band[li_row] = ids_line.object.band[li]
				ids_objects.object.reportname[li_row] = as_reportname
				ids_objects.object.name[li_row] = ""
			end if

		end if

	end if

next
end subroutine

public function integer of_createstructure ();
integer i, li_rowcount, li_count, li_row, li_k , li_pos_index
string ls_name, ls_type, ls_reportname, ls_band, ls_filter
boolean lb_newband
integer li_start, li_end

//ids_objects.SetSort("reportname A,band A, Sparse A,StartCol A, StartRow A")
ids_objects.SetSort("reportname A,band A, Sparse A, Y A, X A, StartRow A, StartCol A")
ids_objects.Sort()
ids_objects.saveas("c:\1.xls", excel!, true)

FOR li_row = 1 TO ids_bands.RowCount()	
	ls_reportname = ids_bands.GetItemString(li_row, "reportname")
	ls_band = ids_bands.GetItemString(li_row, "band")
	
	ls_filter = "reportname='" + ls_reportname +"' and band='" + ls_band + "'"
	li_start = UpperBound(istr_obj)
	li_k = li_start
	
	ids_objects.SetFilter(ls_filter)
	ids_objects.Filter()
	li_rowcount = ids_objects.RowCount()
	FOR i= 1 To li_rowcount
		ls_name = ids_objects.object.name[i]
		ls_type = ids_objects.object.stype[i]
		if trim(lower(ls_name)) = 'gutter' then 
			string ls_name_1
			ls_name_1 = ls_name
		end if
		
		IF ls_name = '' THEN CONTINUE
		IF ids_objects.object.isborderonly[i] ='1' THEN CONTINUE
		IF ids_objects.object.visible[i] = '0' THEN CONTINUE

		li_k ++
		istr_obj[li_k].name = ids_objects.object.name[i]
		istr_obj[li_k].reportname = ls_reportname
		istr_obj[li_k].band = ls_band		
		istr_obj[li_k].stype = ids_objects.object.stype[i]
		istr_obj[li_k].coltype = ids_objects.object.coltype[i]
		istr_obj[li_k].format = ids_objects.object.format[i]
		istr_obj[li_k].formatexp = ids_objects.object.formatexp[i]
		istr_obj[li_k].visible = (ids_objects.object.visible[i] = '1')
		istr_obj[li_k].visibleexp = ids_objects.object.visibleexp[i]
		istr_obj[li_k].fontname = ids_objects.object.fontname[i]
		istr_obj[li_k].fontnameexp = ids_objects.object.fontnameexp[i]
		istr_obj[li_k].fontsize = ids_objects.object.fontsize[i]
		istr_obj[li_k].fontsizeexp = ids_objects.object.fontsizeexp[i]
		istr_obj[li_k].fontweight = ids_objects.object.fontweight[i]
		istr_obj[li_k].fontweightexp = ids_objects.object.fontweightexp[i]
		istr_obj[li_k].fontcolor = ids_objects.object.fontcolor[i]
		istr_obj[li_k].fontcolorexp = ids_objects.object.fontcolorexp[i]
		istr_obj[li_k].fontitalic = ids_objects.object.fontitalic[i]
		istr_obj[li_k].fontitalicexp = ids_objects.object.fontitalicexp[i]
		istr_obj[li_k].alignment = ids_objects.object.alignment[i]
		istr_obj[li_k].alignmentexp = ids_objects.object.alignmentexp[i]
		istr_obj[li_k].bgcolor = ids_objects.object.bgcolor[i]
		istr_obj[li_k].bgcolorexp = ids_objects.object.bgcolorexp[i]
		istr_obj[li_k].startrow = ids_objects.object.startrow[i]
		istr_obj[li_k].startcol = ids_objects.object.startcol[i]
		istr_obj[li_k].endrow = ids_objects.object.endrow[i]
		istr_obj[li_k].endcol = ids_objects.object.endcol[i]
		istr_obj[li_k].sparse = ids_objects.object.sparse[i]
		istr_obj[li_k].priorvalue = ids_objects.object.priorvalue[i]
		istr_obj[li_k].beginrow = ids_objects.object.beginrow[i]
		istr_obj[li_k].rowindetail = ids_objects.object.rowindetail[i]
		istr_obj[li_k].objspace = ids_objects.object.objspace[i]
		istr_obj[li_k].mergeflag = (ids_objects.object.mergeflag[i] = '1')
		istr_obj[li_k].cellflag = (ids_objects.object.cellflag[i] = '1')
		istr_obj[li_k].border = ids_objects.object.border[i]
		if istr_obj[li_k].border = 2 then
			istr_obj[li_k].border = BC_1111
		elseif  istr_obj[li_k].border = 4 then
			istr_obj[li_k].border = BC_100
		else
			istr_obj[li_k].border = 0
		end if
		istr_obj[li_k].displayvalue =(ids_objects.object.displayvalue[i] ='1')
		istr_obj[li_k].columnid = ids_objects.object.columnid[i]
		istr_obj[li_k].wraptext = ids_objects.object.wraptext[i]
		istr_obj[li_k].isborderonly = (ids_objects.object.isborderonly[i] = '1')
		istr_obj[li_k].expflag = (ids_objects.object.expflag[i] = '1')
		istr_obj[li_k].borderkey[1] = ""
		istr_obj[li_k].borderxf[1] = 0
		istr_obj[li_k].bordercount = 0
		istr_obj[li_k].slipup = (ids_objects.object.slipup[i] = '1')
		istr_obj[li_k].aboverows = ids_objects.object.aboverows[i]
		istr_obj[li_k].isreport = (ids_objects.object.isreport[i] = '1')
		ids_objects.SetItem(i,"position",li_k)
	NEXT
	
	istr_position[li_row].s_obj = li_start + 1
	istr_position[li_row].e_obj = li_k
	
	//row height	
	li_start = UpperBound(istr_rowheight)
	li_k = li_start
	
	ids_rowheight.SetFilter(ls_filter)
	ids_rowheight.Filter()
	ids_rowheight.sort()
	li_rowcount = ids_rowheight.RowCount()
	FOR i= 1 To li_rowcount
		li_k ++
		istr_rowheight[li_k].reportname = ids_rowheight.object.reportname[i]
		istr_rowheight[li_k].band = ids_rowheight.object.band[i]
		istr_rowheight[li_k].row = ids_rowheight.object.row[i]
		istr_rowheight[li_k].y = ids_rowheight.object.y[i]
		istr_rowheight[li_k].height = ids_rowheight.object.height[i]
		istr_rowheight[li_k].aboverows = ids_rowheight.object.aboverows[i]
		ids_rowheight.SetItem(i,"position",li_k)
	NEXT
	
	istr_position[li_row].s_height = li_start + 1
	istr_position[li_row].e_height = li_k
	
	li_start = UpperBound(istr_lines)
	li_k = li_start
	
	ids_line.SetFilter(ls_filter)
	ids_line.Filter()
	li_rowcount = ids_line.RowCount()
	FOR i= 1 To li_rowcount
		li_k ++
		istr_lines[li_k].reportname = ids_line.object.reportname[i]
		istr_lines[li_k].name = ids_line.object.name[i]
		istr_lines[li_k].band = ids_line.object.band[i]
		istr_lines[li_k].x1 = ids_line.object.x1[i]
		istr_lines[li_k].y1 = ids_line.object.y1[i]
		istr_lines[li_k].x2 = ids_line.object.x2[i]
		istr_lines[li_k].y2 = ids_line.object.y2[i]
		istr_lines[li_k].penwidth = ids_line.object.penwidth[i]
		if istr_lines[li_k].penwidth > 3 then istr_lines[li_k].penwidth = 3
		istr_lines[li_k].pencolor = ids_line.object.pencolor[i]
		istr_lines[li_k].startcol = ids_line.object.startcol[i]
		istr_lines[li_k].startrow = ids_line.object.startrow[i]
		istr_lines[li_k].endcol = ids_line.object.endcol[i]
		istr_lines[li_k].endrow = ids_line.object.endrow[i]
		istr_lines[li_k].linetype = ids_line.object.linetype[i]
		istr_lines[li_k].lastflag = ids_line.object.lastflag[i]
		istr_lines[li_k].firstflag = ids_line.object.firstflag[i]		
	NEXT
	
	istr_position[li_row].s_line = li_start + 1
	istr_position[li_row].e_line = li_k
	istr_position[li_row].bgcolorexp = ids_bands.GetItemString(li_row, "colorexp")
	istr_position[li_row].bgcolor = ids_bands.GetItemNumber(li_row, "color")
	istr_position[li_row].startrow = ids_bands.GetItemNumber(li_row, "startrow")
	istr_position[li_row].endrow = ids_bands.GetItemNumber(li_row, "endrow")
NEXT

RETURN 1
end function

protected function unsignedlong of_get_custom_color_index (unsignedlong al_color);ulong ll_index
integer li_red
integer li_green
integer li_blue

if al_color = 536870912 then
	return 65
end if

if al_color = 0 then
	return 8
else

	if al_color = 16777215 then
		return 9
	else

		if al_color = 255 then
			return 10
		else

			if al_color = 16711680 then
				return 12
			else

				if al_color = 65280 then
					return 11
				end if

			end if

		end if

	end if

end if

ll_index = invo_colors.of_find_key(al_color)

if ll_index > 0 then
	return (64 - integer(ll_index))
else

	if invo_colors.of_get_keys_count() > 63 - 8 then
		return -1
	else
		ll_index = invo_colors.of_add_key(al_color)
		li_red = mod(al_color,256)
		li_green = mod(truncate(al_color / 256,0),256)
		li_blue = mod(truncate(al_color / (256 * 256),0),256)
		invo_workbook.of_set_custom_color(64 - ll_index,li_red,li_green,li_blue)
		return (64 - ll_index)
	end if

end if
end function

protected function unsignedlong of_get_color (unsignedlong al_color);ulong ll_index

if ((al_color <= 16777215) or (al_color = 536870912)) then
	return al_color
end if

if al_color = 67108864 then
	ll_index = 15
else

	if al_color = 268435456 then
		ll_index = 12
	else
		ll_index = al_color - 134217728
	end if

end if

al_color = getsyscolor(ll_index)

if al_color < 0 then
	al_color = 0
end if

return al_color
end function

protected function string of_evaluate (integer ai_layer, string as_express, long al_row);string ls_ret
integer li_pos

as_express = trim(as_express)

if left(as_express,1) = "'" and right(as_express,1) = "'" then
	as_express = mid(as_express,2,len(as_express) - 2)
else

	if left(as_express,1) = "~"" and right(as_express,1) = "~"" then
		as_express = mid(as_express,2,len(as_express) - 2)
	end if

end if

li_pos = pos(as_express,"~t")

if li_pos > 0 then
	as_express = mid(as_express,li_pos + 1)
end if

as_express = of_replace(as_express,"'","~"")

if ai_layer = 1 then
	if al_row = 0 then al_row = idw_requestor.GetRow()
	ls_ret = idw_requestor.describe("Evaluate('" + as_express + "'," + string(al_row) + ")")
else
	if al_row = 0 then al_row = ids_requestor.GetRow()
	ls_ret = ids_requestor.describe("Evaluate('" + as_express + "'," + string(al_row) + ")")
end if

if ((ls_ret = "?") or (ls_ret = "!")) then
	ls_ret = ""
end if

return ls_ret
end function

public function string of_describe (integer ai_layer, string as_exp);if ai_layer = 1 then
	RETURN idw_requestor.Describe(as_exp)
else
	RETURN ids_requestor.Describe(as_exp)
end if
end function

protected function integer of_getobjects (string as_reportname);integer li_layer
string ls_type, ls_band, ls_oldband, ls_expression
string ls_name, ls_objects[], ls_processing, ls_format, ls_coltype
integer li,lj,lk, li_row,li_col,li_count
long li_x,li_y,li_x2,li_height
boolean lb_foregroundflag = false
string ls_bands[],ls_exp, ls_visible, ls_visibleexp
ulong li_color
datastore lds_temp
long li_x1
long li_y1
long li_width1

integer li_colcount
if as_reportname = '' then
	li_layer = 1
else
	li_layer = 2
	ids_requestor = create datastore
	ids_requestor.dataobject = idw_requestor.describe(as_reportname + ".DataObject ")
	
	li_x1 = long(idw_requestor.describe(as_reportname + ".x"))
	li_y1 = long(idw_requestor.describe(as_reportname + ".Y"))
	li_width1 = long(idw_requestor.describe(as_reportname + ".Width"))
	
	if of_describe(li_layer,"datawindow.units") <> is_units then
		messagebox("Error","datawindow.units error(parent and sub report)")
		return -1
	end if
end if

lds_temp = create datastore
lds_temp.Create(of_describe(li_layer,"DataWindow.Syntax"))

ls_processing = of_describe(li_layer,"datawindow.Processing")
li_count = of_parsetoarray(of_describe(li_layer,"datawindow.bands"),"~t",ls_bands)

for li = 1 to li_count
	li_row = ids_bands.insertrow(0)
	ids_bands.object.reportname[li_row] = as_reportname
	ids_bands.object.band[li_row] = ls_bands[li]
	ids_bands.object.band[li_row] = ls_bands[li]
	ids_bands.object.oldband[li_row] = ls_bands[li]
	lj = pos(ls_bands[li],"[")

	if lj > 0 then
		ids_bands.object.band[li_row] = left(ls_bands[li],lj - 1)
	end if

	ls_format = of_describe(li_layer,"datawindow." + ls_bands[li] + ".color")
	of_check_property(ls_format,ls_exp)
	ids_bands.object.colorexp[li_row] = ls_exp
	if ls_exp = "" then
		li_color = of_get_color(long(ls_format))
		if li_color <> 0 then
			ids_bands.object.color[li_row] = of_get_custom_color_index(li_color)
		else
			ids_bands.object.color[li_row] = 65
		end if
	end if
next

ls_type = of_describe(li_layer,"datawindow.objects")
li_count = of_parsetoarray(ls_type,"~t",ls_objects)
ls_type = ""

for li = 1 to li_count

	if ids_objects.find("ReportName='" + as_reportname +"' AND Name='" + ls_objects[li] + "'",1,li_count) > 0 then
	else
		ls_band = of_describe(li_layer,ls_objects[li] + ".Band")

		if ((ls_band = "?") or (ls_band = "!")) then
		else
			ls_type = of_describe(li_layer,ls_objects[li] + ".Type")
			ls_oldband = ls_band
			
			boolean lb_continue
			lb_continue = true
			if ((ls_band = "foreground") or (ls_band = "background")) then
				lb_continue = false
				if ls_type <> "line" then
					ls_format = of_describe(li_layer,ls_objects[li] + ".Y")
				else
					ls_format = of_describe(li_layer,ls_objects[li] + ".Y1")
				end if

				of_check_property(ls_format,ls_exp)

				if ls_exp <> "" then
					ls_format = of_evaluate(li_layer,ls_exp,0)
				end if

				li_y = long(ls_format)

				if ls_processing = "4" then

					if li_y <= long(of_describe(li_layer,"datawindow.header[1].height")) then
						ls_band = "header[1]"

						lb_foregroundflag = true
					else
						continue
					end if
					lb_continue = true
				elseif li_y <= long(of_describe(li_layer,"datawindow.header.height")) then
					ls_band = "header"
					lb_continue = true
				end if

			end if
			if lb_continue then

				li_height = long(of_describe(li_layer,"datawindow." + ls_band + ".height"))

				if li_height <= 10 then
				else

					if ls_type = "line" then

						if long(of_describe(li_layer,ls_objects[li] + ".Y1")) > li_height then
							continue
						end if

					else

						if long(of_describe(li_layer,ls_objects[li] + ".Y")) > li_height then
							continue
						end if

					end if

					ls_visible = trim(of_describe(li_layer,ls_objects[li] + ".Visible"))
					of_check_property(ls_visible,ls_visibleexp)

					if li_layer = 1 and ls_type = "report" then

						if ((ls_visible = "0") or (ls_visibleexp = "0")) then
							continue
						end if

						li_row = ids_reportobj.insertrow(0)
						ids_reportobj.object.name[li_row] = ls_objects[li]
						ids_reportobj.object.band[li_row] = ls_band
						ids_reportobj.object.x[li_row] = long(of_describe(li_layer,ls_objects[li] + ".x"))
						ids_reportobj.object.width[li_row] = long(of_describe(li_layer,ls_objects[li] + ".Width"))
						ids_reportobj.object.y[li_row] = long(of_describe(li_layer,ls_objects[li] + ".y"))
						ids_reportobj.object.height[li_row] = long(of_describe(li_layer,ls_objects[li] + ".Height"))
						ids_reportobj.object.rowindetail[li_row] = 1
						
						of_getobjects(ls_objects[li])
						
						li_row = ids_objects.insertrow(0)
						
						ids_objects.object.reportname[li_row] = as_reportname
						ids_objects.object.name[li_row] = ""
						ids_objects.object.band[li_row] = ls_band
						ids_objects.object.x[li_row] = long(of_describe(li_layer,ls_objects[li] + ".x"))
						ids_objects.object.width[li_row] = long(of_describe(li_layer,ls_objects[li] + ".Width"))
						ids_objects.object.y[li_row] = long(of_describe(li_layer,ls_objects[li] + ".y"))
						ids_objects.object.height[li_row] = long(of_describe(li_layer,ls_objects[li] + ".Height"))
						ids_objects.object.isreport[li_row] = "1"
					else
					
				
					if ls_type = "line" then
						if not ib_formflag then
							continue
						end if

						if ((ls_visible = "0") or (ls_visibleexp = "0")) then
							continue
						end if

						if of_describe(li_layer,ls_objects[li] + ".Tag") = is_linetag then
							continue
						end if

						li_row = ids_line.insertrow(0)
						ids_line.object.reportname[li_row] = as_reportname
						ids_line.object.name[li_row] = ls_objects[li]
						ids_line.object.band[li_row] = ls_band
						ls_format = of_describe(li_layer,ls_objects[li] + ".x1")
						of_check_property(ls_format,ls_exp)

						if ls_exp <> "" then
							ls_format = of_evaluate(li_layer,ls_exp,0)
						end if

						ids_line.object.x1[li_row] = (long(ls_format) + li_x1)
						ls_format = of_describe(li_layer,ls_objects[li] + ".x2")
						of_check_property(ls_format,ls_exp)

						if ls_exp <> "" then
							ls_format = of_evaluate(li_layer,ls_exp,0)
						end if

						ids_line.object.x2[li_row] = (long(ls_format) + li_x1)
						ls_format = of_describe(li_layer,ls_objects[li] + ".Y1")
						of_check_property(ls_format,ls_exp)

						if ls_exp <> "" then
							ls_format = of_evaluate(li_layer,ls_exp,0)
						end if

						ids_line.object.y1[li_row] = (long(ls_format) + li_y1)
						ls_format = of_describe(li_layer,ls_objects[li] + ".Y2")
						of_check_property(ls_format,ls_exp)

						if ls_exp <> "" then
							ls_format = of_evaluate(li_layer,ls_exp,0)
						end if

						ids_line.object.y2[li_row] = (long(ls_format) + li_y1)
						ls_format = of_describe(li_layer,ls_objects[li] + ".Pen.Color")
						of_check_property(ls_format,ls_exp)

						if ls_exp <> "" then
							ls_format = of_evaluate(li_layer,ls_exp,0)
						end if
						
						ids_line.object.pencolor[li_row] = of_get_custom_color_index(of_get_color(long(ls_format)))

						choose case of_describe(li_layer,ls_objects[li] + ".pen.style")
							case "1"
								ids_line.object.penwidth[li_row] = 3
							case "2"
								ids_line.object.penwidth[li_row] = 4
							case else
								ids_line.object.penwidth[li_row] = of_get_penwidth(long(of_describe(li_layer,ls_objects[li] + ".Pen.Width")))
						end choose

					else
						
							ls_format = of_describe(li_layer,ls_objects[li] + ".x")
							of_check_property(ls_format,ls_exp)
	
							if ls_exp <> "" then
								ls_format = of_evaluate(li_layer,ls_exp,0)
							end if
							
						if long(ls_format) > li_width1  and li_layer > 1 then
						else

						if ls_type <> "text" and ls_type <> "column" and ls_type <> "compute" and of_describe(li_layer,ls_objects[li] + ".border") <> "2" then
						else

							if ls_type = "compute" then
								ls_expression = of_describe(li_layer,ls_objects[li] + ".Expression")

								if ((ls_expression = "?") or (ls_expression = "!")) then
									continue
								end if

							end if

							if ls_objects[li] = "sys_back" and ls_oldband = "foreground" then
							else

								if ls_objects[li] = "sys_lastcol" and ls_oldband = "detail" then
								else

									if ((ls_visible = "0") or (ls_visibleexp = "0")) then

										if ls_processing = "1" and ls_band = "detail" then
											li_x = long(lds_temp.describe(ls_objects[li] + ".x"))
											li_x2 = li_x + long(lds_temp.describe(ls_objects[li] + ".width"))

											for lj = 1 to li_count

												if of_describe(li_layer,ls_objects[lj] + ".Band") <> "detail" then

													if long(lds_temp.describe(ls_objects[lj] + ".x")) >= li_x and long(lds_temp.describe(ls_objects[lj] + ".x")) + long(lds_temp.describe(ls_objects[lj] + ".Width")) <= li_x2 then
														idw_requestor.modify(ls_objects[lj] + ".visible='0' ")
														li_row = ids_objects.find("reportname='' AND name='" + ls_objects[lj] + "'",1,ids_objects.rowcount())

														if li_row > 0 then
															ids_objects.deleterow(li_row)
														end if

													end if

												end if

											next

										end if

									else
										ls_coltype = of_describe(li_layer,ls_objects[li] + ".ColType")

										if ((ls_coltype = "?") or (ls_coltype = "!")) then
											ls_coltype = "S"
										else

											if left(ls_coltype,4) = "char" then
												ls_coltype = "S"
											else

												if ls_coltype = "datetime" then
													ls_coltype = "DT"
												else

													if ls_coltype = "date" then
														ls_coltype = "D"
													else

														if ls_coltype = "time" then
															ls_coltype = "T"
														else
															ls_coltype = "N"
														end if

													end if

												end if

											end if

										end if

										li_row = ids_objects.insertrow(0)
										ids_objects.object.reportname[li_row] = as_reportname
										ids_objects.object.name[li_row] = ls_objects[li]
										ids_objects.object.band[li_row] = ls_band
										ids_objects.object.stype[li_row] = ls_type
										ids_objects.object.coltype[li_row] = ls_coltype
										ls_format = of_describe(li_layer,ls_objects[li] + ".x")
										of_check_property(ls_format,ls_exp)

										if ls_exp <> "" then
											ls_format = of_evaluate(li_layer,ls_exp,0)
										end if

										ids_objects.object.x[li_row] = long(ls_format)
										ls_format = of_describe(li_layer,ls_objects[li] + ".Y")
										of_check_property(ls_format,ls_exp)

										if ls_exp <> "" then
											ls_format = of_evaluate(li_layer,ls_exp,0)
										end if

										ids_objects.object.y[li_row] = long(ls_format)
										ls_format = of_describe(li_layer,ls_objects[li] + ".Width")
										of_check_property(ls_format,ls_exp)

										if ls_exp <> "" then
											ls_format = of_evaluate(li_layer,ls_exp,0)
										end if

										ids_objects.object.width[li_row] = long(ls_format)
										ls_format = of_describe(li_layer,ls_objects[li] + ".Height")
										of_check_property(ls_format,ls_exp)

										if ls_exp <> "" then
											ls_format = of_evaluate(li_layer,ls_exp,0)
										end if

										ids_objects.object.height[li_row] = long(ls_format)

										if ((ids_objects.object.x2[li_row] <= 0) or (ids_objects.object.y2[li_row] <= 0)) then
											ids_objects.deleterow(li_row)
										else
											if li_layer > 1 then	
												ids_objects.object.x[li_row] = (ids_objects.object.x[li_row] + li_x1)
												ids_objects.object.y[li_row] = (ids_objects.object.y[li_row] + li_y1)

												if ids_objects.object.x2[li_row] > li_width1 + li_x1 then
													ids_objects.object.width[li_row] = (li_width1 + li_x1 - ids_objects.object.x[li_row])
												end if
											end if
											ids_objects.object.visible[li_row] = ls_visible
											ids_objects.object.visibleexp[li_row] = ls_visibleexp

											if ls_objects[li] <> "report_title" then

												if trim(of_describe(li_layer,ls_objects[li] + ".Tag")) <> "0" then
													ids_objects.object.border[li_row] = long(of_describe(li_layer,ls_objects[li] + ".Border"))
												end if

											end if

											if ls_type <> "text" and ls_type <> "column" and ls_type <> "compute" then
												ids_objects.object.isborderonly[li_row] = "1"
												ids_objects.object.border[li_row] = 2
												continue
											else

												if ls_type = "text" then
													if of_describe(li_layer,ls_objects[li] + ".Text") = "" then

														if of_describe(li_layer,ls_objects[li] + ".Border") = "2" and of_describe(li_layer,ls_objects[li] + ".Tag") <> "0" then
															ids_objects.object.isborderonly[li_row] = "1"
															ids_objects.object.border[li_row] = 2
															continue
														else
															ids_objects.deleterow(li_row)
															continue
														end if

													end if

												end if

											end if

											ls_format = trim(of_describe(li_layer,ls_objects[li] + ".Format"))

											of_get_format(ls_format,ls_exp,ls_coltype)
//											if  ls_format = 'dd/mm/yyyy hh:mm' then  
//												ls_format = 'dd/mm/yyyy' 
//											end if 
											ids_objects.object.format[li_row] = ls_format
											ids_objects.object.formatexp[li_row] = ls_exp
											ls_format = of_describe(li_layer,ls_objects[li] + ".Color")
											of_check_property(ls_format,ls_exp)
											ids_objects.object.fontcolorexp[li_row] = ls_exp

											if ls_exp = "" then
												li_color = of_get_color(long(ls_format))
												ids_objects.object.fontcolor[li_row] = of_get_custom_color_index(li_color)
											end if

											ls_format = of_describe(li_layer,ls_objects[li] + ".background.Color")
											of_check_property(ls_format,ls_exp)
											ids_objects.object.bgcolorexp[li_row] = ls_exp

											if ls_exp = "" then
												li_color = of_get_color(long(ls_format))

												if li_color = 0 then
													li_color = 65
												else
													li_color = of_get_custom_color_index(li_color)
												end if

												ids_objects.object.bgcolor[li_row] = li_color
											end if

											ls_format = of_describe(li_layer,ls_objects[li] + ".Font.Weight")
											of_check_property(ls_format,ls_exp)
											ids_objects.object.fontweight[li_row] = long(ls_format)
											ids_objects.object.fontweightexp[li_row] = ls_exp
											ls_format = of_describe(li_layer,ls_objects[li] + ".Font.Height")
											of_check_property(ls_format,ls_exp)
											ids_objects.object.fontsize[li_row] = abs(long(ls_format))
											ids_objects.object.fontsizeexp[li_row] = ls_exp

											if ids_objects.object.fontsize[li_row] <= 0 then
												ids_objects.object.fontsize[li_row] = 9
											end if

											ls_format = of_describe(li_layer,ls_objects[li] + ".font.italic")
											of_check_property(ls_format,ls_exp)
											ids_objects.object.fontitalic[li_row] = long(ls_format)
											ids_objects.object.fontitalicexp[li_row] = ls_exp
											ls_format = of_describe(li_layer,ls_objects[li] + ".font.face")
											of_check_property(ls_format,ls_exp)
											ids_objects.object.fontname[li_row] = ls_format
											ids_objects.object.fontnameexp[li_row] = ls_exp
											ls_format = of_describe(li_layer,ls_objects[li] + ".Alignment")
											of_check_property(ls_format,ls_exp)
											ids_objects.object.alignmentexp[li_row] = ls_exp

											choose case ls_format
												case "1"
													ids_objects.object.alignment[li_row] = 3
												case "2"
													ids_objects.object.alignment[li_row] = 2
												case else
													ids_objects.object.alignment[li_row] = 1
											end choose
																						
											ids_objects.object.columnid[li_row] = long(of_describe(li_layer,ls_objects[li] + ".ID"))
											ls_format = of_describe(li_layer,ls_objects[li] + ".Edit.Style")
											if (((ls_format = "dddw") or (ls_format = "ddlb")) or (of_describe(li_layer,ls_objects[li] + ".Edit.CodeTable") = "yes")) then
												ids_objects.object.displayvalue[li_row] = "1"
											else
												ids_objects.object.displayvalue[li_row] = "0"
											end if

											ids_objects.object.rowindetail[li_row] = 1
											
											if ls_type ='text' or ls_type='groupbox' then
												ids_objects.object.wraptext[li_row] = 1
											end if

											if ids_objects.object.formatexp[li_row] = "" and ids_objects.object.fontnameexp[li_row] = "" and &
												ids_objects.object.fontweightexp[li_row] = "" and ids_objects.object.fontcolorexp[li_row] = "" and &
												ids_objects.object.fontitalicexp[li_row] = "" and ids_objects.object.alignmentexp[li_row] = "" and &
												ids_objects.object.bgcolorexp[li_row] = "" then
												ids_objects.object.expflag[li_row] = "0"
											else
												ids_objects.object.expflag[li_row] = "1"
											end if

											if of_describe(li_layer,ls_objects[li] + ".SlipUp") = "no" then
												ids_objects.object.slipup[li_row] = "0"
											else
												ids_objects.object.slipup[li_row] = "1"
											end if

											ids_objects.object.aboverows[li_row] = 0
										end if

									end if

								end if

							end if

						end if
						end if
					   end if
					end if

				end if

			end if

		end if

	end if

next

if long(of_describe(li_layer,"datawindow.rows_per_detail")) > 1 then
	ls_type = of_describe(li_layer,"datawindow.syntax")
	li = pos(ls_type,"column(")

	do while li > 0
		lj = pos(ls_type,"column(",li + 5)

		if lj = 0 then
			li_count = 1024
		else
			li_count = lj - li - 1
		end if

		ls_band = mid(ls_type,li,li_count)
		li = pos(ls_band,"name=") + len("name=")
		li_count = pos(ls_band," ",li + 1) - li
		ls_name = mid(ls_band,li,li_count)
		li_row = ids_objects.find("ReportName='" + as_reportname +"' AND Name='" + ls_name + "' ",1,ids_objects.rowcount())

		if li_row > 0 then
			li = pos(ls_band,"row_in_detail=") + len("row_in_detail=")
			li_count = pos(ls_band," ",li + 1) - li
			lk = long(mid(ls_band,li,li_count))

			if lk > 0 then
				ids_objects.object.rowindetail[li_row] = lk
			end if

		end if

		li = lj
	loop

	ls_type = ""
	ls_band = ""
	
	if as_reportname <> ''  then
		li_row = ids_reportobj.find("name='" + as_reportname + "'",1,ids_reportobj.rowcount())
	
		if li_row > 0 then
			ids_reportobj.object.rowindetail[li_row] = long(of_describe(li_layer,"datawindow.rows_per_detail"))
		end if
	end if
end if


ls_type = of_describe(li_layer,"datawindow.sparse")

if ls_type <> "" then
	li_count = of_parsetoarray(ls_type,"~t",ls_objects)

	for li = 1 to li_count
		li_row = ids_objects.find("reportName='" + as_reportname + "' AND name='" + ls_objects[li] + "'",1,ids_objects.rowcount())

		if li_row > 0 then
			ids_objects.object.sparse[li_row] = li_count
		end if

	next

end if
destroy(lds_temp)
return 1
end function

protected subroutine of_init_dwsyntax ();string ls_dwsyntax_band
string ls_dwsyntax_objects
string ls_dwsyntax_lineobjects
string ls_dwsyntax_rowheight
string ls_err
ls_dwsyntax_band ="release 6; &
datawindow(units=0 timer_interval=0 color=0 processing=0 ) &
table(column=(type=char(30) name=reportname dbname='reportname' ) &
 column=(type=char(12) name=band dbname='band' ) &
 column=(type=char(12) name=oldband dbname='oldband' ) &
 column=(type=long name=startrow dbname='startrow' ) &
 column=(type=long name=endrow dbname='endrow' ) &
 column=(type=long name=color dbname='color' ) &
 column=(type=char(128) name=colorexp dbname='colorexp' ) &
 column=(type=long name=height dbname='height' ) &
 column=(type=char(10) name=autoheight dbname='autoheight' ))"

 ls_dwsyntax_lineobjects ="release 6; &
datawindow(units=0 timer_interval=0 color=1073741824 processing=0) &
table(column=(type=char(30) name=reportname dbname='reportname' ) &
column=(type=char(50) name=name dbname='name' ) &
column=(type=char(10) name=band dbname='band' ) &
column=(type=long initial='0' name=x1 dbname='x1' ) &
column=(type=long initial='0' name=y1 dbname='y1' ) &
column=(type=long initial='0' name=x2 dbname='x2' ) &
column=(type=long initial='0' name=y2 dbname='y2' ) &
column=(type=long initial='0' name=penwidth dbname='penwidth' ) &
column=(type=long initial='0' name=pencolor dbname='pencolor' ) &
column=(type=long initial='0' name=startcol dbname='startcol' ) &
column=(type=long initial='0' name=startrow dbname='startrow' ) &
column=(type=long initial='0' name=endcol dbname='endcol' ) &
column=(type=long initial='0' name=endrow dbname='endrow' ) &
column=(type=char(1) name=linetype dbname='linetype' ) &
column=(type=long initial='0' name=lastflag dbname='lastflag' ) &
column=(type=long initial='0' name=firstflag dbname='firstflag' ))"

 ls_dwsyntax_objects ="release 6; &
datawindow(units=0 timer_interval=0 color=0 processing=0) &
table(column=(type=char(50) name=reportname dbname='reportname' ) &
 column=(type=char(60) name=name dbname='name' ) &
 column=(type=char(10) name=band dbname='band' ) &
 column=(type=char(10) name=stype dbname='stype' ) &
 column=(type=char(10) name=coltype dbname='coltype' ) &
 column=(type=char(30) name=format dbname='format' ) &
 column=(type=char(128) name=formatexp dbname='formatexp' ) &
 column=(type=char(1) name=visible dbname='visible' initial='1' ) &
 column=(type=char(128) name=visibleexp dbname='visibleexp' ) &
 column=(type=char(20) name=fontname dbname='fontname' ) &
 column=(type=char(128) name=fontnameexp dbname='fontnameexp' ) &
 column=(type=long name=fontsize dbname='fontsize' ) &
 column=(type=char(128) name=fontsizeexp dbname='fontsizeexp' ) &
 column=(type=long name=fontweight dbname='fontweight' initial='400' ) &
 column=(type=char(128) name=fontweightexp dbname='fontweightexp' ) &
 column=(type=long name=fontcolor dbname='fontcolor' initial='0' ) &
 column=(type=char(128) name=fontcolorexp dbname='fontcolorexp' ) &
 column=(type=long name=fontitalic dbname='fontitalic' initial='0' ) &
 column=(type=char(128) name=fontitalicexp dbname='fontitalicexp' ) &
 column=(type=long name=alignment dbname='alignment' initial='0' ) &
 column=(type=char(128) name=alignmentexp dbname='alignmentexp' ) &
 column=(type=long name=bgcolor dbname='bgcolor' initial='0' ) &
 column=(type=char(128) name=bgcolorexp dbname='bgcolorexp' ) &
 column=(type=long name=x dbname='x' initial='0' ) &
 column=(type=long name=y dbname='y' initial='0' ) &
 column=(type=long name=width dbname='width' initial='0' ) &
 column=(type=long name=height dbname='height' initial='0' ) &
 column=(type=long name=startrow dbname='startrow' initial='1' ) &
 column=(type=long name=startcol dbname='startcol' initial='1' ) &
 column=(type=long name=endrow dbname='endrow' initial='1' ) &
 column=(type=long name=endcol dbname='endcol' initial='1' ) &
 column=(type=long name=sparse dbname='Sparse' initial='0' ) &
 column=(type=char(255) name=priorvalue dbname='priorvalue' ) &
 column=(type=long name=beginrow dbname='beginrow' initial='0' ) &
 column=(type=long name=leftline dbname='leftline' initial='0' ) &
 column=(type=long name=rightline dbname='rightline' initial='0' ) &
 column=(type=long name=topline dbname='topline' initial='0' ) &
 column=(type=long name=bottomline dbname='bottomline' initial='0' ) &
 column=(type=long name=rowindetail dbname='rowindetail' initial='0' ) &
 column=(type=long name=objspace dbname='objspace' initial='0' ) &
 column=(type=char(1) name=mergeflag dbname='mergeFlag' initial='0' ) &
 column=(type=char(1) name=cellflag dbname='cellflag' initial='0' ) &
 column=(type=long name=border dbname='border' initial='0' ) &
 column=(type=char(1) name=displayvalue dbname='displayvalue' initial='0' ) &
 column=(type=long name=columnid dbname='columnid' initial='0' ) &
 column=(type=long name=wraptext dbname='wrapText' initial='0' ) &
 column=(type=char(1) name=isborderonly dbname='isborderonly' initial='0' ) &
 column=(type=char(1) name=expflag dbname='expFlag' initial='0' ) &
 column=(type=long name=xfindex dbname='xfindex' initial='0' ) &
 column=(type=char(12) name=borderkey dbname='borderKey' ) &
 column=(type=char(1) name=slipup dbname='slipup' initial='0' ) &
 column=(type=long name=aboverows dbname='aboverows' initial='0' ) &
 column=(type=char(1) name=isreport dbname='isReport' initial='0' ) &
 column=(type=long name=position dbname='position' initial='0' ) &
 ) &
compute(band=detail expression='x+width'border='0' x='1189' y='0' height='76' width='251' name=x2) &
compute(band=detail expression='y+height'border='0' x='1449' y='12' height='76' width='251' name=y2) "


ls_dwsyntax_rowheight="release 6; &
datawindow(units=0 timer_interval=0 color=0 processing=0) &
table(column=(type=char(30) name=reportname dbname='reportname' ) &
 column=(type=char(10) name=band dbname='band' ) &
 column=(type=long name=row dbname='row' initial='0' ) &
 column=(type=long name=y dbname='y' initial='0' ) &
 column=(type=long name=height dbname='height' initial='0' ) &
 column=(type=long name=position dbname='position' initial='0' ) &
 column=(type=long name=aboverows dbname='aboverows' initial='0' ))"
 
 
ids_column = create datastore
ids_column.create(ls_dwsyntax_objects,ls_err)
ids_objects = create datastore
ids_objects.create(ls_dwsyntax_objects,ls_err)
ids_line = create datastore
ids_line.create(ls_dwsyntax_lineobjects,ls_err)
ids_rowheight = create datastore
ids_rowheight.create(ls_dwsyntax_rowheight,ls_err)
ids_bands = create datastore
ids_bands.create(ls_dwsyntax_band,ls_err)
ids_reportobj = create datastore
ids_reportobj.create(ls_dwsyntax_objects)
end subroutine

protected function integer of_outdata (string as_reportname, long ai_currow, string as_band, long ai_row);integer li_layer
integer li_xfindex, li_bk
long li_outlines, li_height, ll_rowcount,li_datarow
integer li_border, li_penwidth
string ls_value,ls_name, ls_type, ls_property, ls_format, ls_coltype
integer li,lj,lk,li_count,li_groupcount,li_row
boolean lb_visible
integer li_startrow, li_startcol, li_endrow, li_endcol, li_currow
ulong li_color, li_band_bgcolor
boolean lb_overlap = false
boolean lb_skip_sparse
boolean lb_prior_sparse
string ls_borderkey
boolean lb_have_line
double ldec_val
datetime ldt_val
time lt_val
date ld_val
int 	   li_endcol_pre, li_row_pre

Yield()
 



if invo_workbook.of_iscancel() then 
	return 0
end if

if as_reportname <> '' then
	ll_rowcount = ids_requestor.RowCount()
	li_layer = 2
else
	ll_rowcount = idw_requestor.RowCount()
	li_layer = 1
end if

if ib_show_progress and ai_row > 0 Then
	integer li_progress
	li_progress = integer(ai_row * 100 / ll_rowcount)
	invo_workbook.of_show_progress(li_progress)
end if

if is_oldband[li_layer] <> as_band then
	string ls_find
	ls_find = "reportname = '" + as_reportname + "' and band ='" + as_band + "'"
	li_row = ids_bands.find(ls_find, 1, ids_bands.RowCount())	
	istr_oldpos[li_layer] = istr_position[li_row]
	is_oldband[li_layer + 1] = ""
	
	if istr_oldpos[li_layer].s_obj > istr_oldpos[li_layer].e_obj or istr_oldpos[li_layer].e_obj = 0 then
		
		if as_band <> 'summary' then 
			is_oldband[li_layer] = as_band
			return li_outlines //////////////
		end if
	end if
	
end if

if istr_oldpos[li_layer].bgcolorexp <> '' then		
	li_band_bgcolor = long(of_evaluate(li_layer,istr_oldpos[li_layer].bgcolorexp,ai_row))
	li_band_bgcolor = of_get_color(li_band_bgcolor)
	if li_band_bgcolor <> 0 then
		li_band_bgcolor = of_get_custom_color_index(li_band_bgcolor)
	end if
else
	li_band_bgcolor = istr_oldpos[li_layer].bgcolor	
end if

if li_layer = 1 and (ids_reportobj.rowcount() > 0 or ids_reportobj.filteredcount()>0) then
	
	if is_oldband[li_layer] <> as_band then
		ids_reportobj.setfilter("band ='" + as_band + "'")
		ids_reportobj.filter()
	end if

	if ids_reportobj.rowcount() > 0 then

		li_currow = ai_currow
		ids_requestor = create datastore

	for li = 1 to ids_reportobj.rowcount()
			ii_sub_borderbeginrow = 0
			ls_name = ids_reportobj.object.name[li]
			if trim(lower(ls_name)) = 'gutter' then continue
			is_oldband[li_layer + 1] = ""
			ids_requestor.dataobject = idw_requestor.describe(ls_name + ".DataObject")

			if idw_requestor.describe("DataWindow.Nested") = "yes" and ai_row > 0 then

				choose case ls_name
					case "dw_1"

						if len(string(idw_requestor.object.dw_1[ai_row].object.datawindow.syntax.data)) > 10 then
							ids_requestor.object.data = idw_requestor.object.dw_1[ai_row].object.data
						end if

					case "dw_2"
						
						if len(string(idw_requestor.object.dw_2[ai_row].object.datawindow.syntax.data)) > 10 then
							ids_requestor.object.data = idw_requestor.object.dw_2[ai_row].object.data
						end if

					case "dw_3"

						if len(string(idw_requestor.object.dw_3[ai_row].object.datawindow.syntax.data)) > 10 then
							ids_requestor.object.data = idw_requestor.object.dw_3[ai_row].object.data
						end if

					case "dw_4"

						if len(string(idw_requestor.object.dw_4[ai_row].object.datawindow.syntax.data)) > 10 then
							ids_requestor.object.data = idw_requestor.object.dw_4[ai_row].object.data
						end if

					case "dw_5"

						if len(string(idw_requestor.object.dw_5[ai_row].object.datawindow.syntax.data)) > 10 then
							ids_requestor.object.data = idw_requestor.object.dw_5[ai_row].object.data
						end if

				end choose

			else
				idw_requestor.getchild(ls_name,idwc_temp)
				idwc_temp.rowscopy(1,idwc_temp.rowcount(),primary!,ids_requestor,1,primary!)
			end if

			li_currow = ai_currow + ids_reportobj.object.startrow[li] + ids_reportobj.object.aboverows[li] - 1

			if ll_rowcount > 0 then
				li_currow += of_outdata(ls_name,li_currow,"header",1)
			else
				li_currow += of_outdata(ls_name,li_currow,"header",0)
			end if
			
			ls_value = ids_requestor.describe("datawindow.bands")
			li_row = 1
			li_groupcount = 0
			do while li_row > 0
				li_row = pos(ls_value,"header.",li_row)
				if li_row > 0 then
					li_groupcount ++
					li_row ++
				end if
			loop
///////////////////
			for li_row = 1 to ids_requestor.rowcount()
				for lj = 1 to li_groupcount
					if ids_requestor.findgroupchange(li_row,lj) = li_row then
						if li_row <> 1 then
							if long(ids_requestor.describe("datawindow.trailer." + string(lj) + ".height")) > 0 then
								li_currow += of_outdata(ls_name,li_currow,"trailer." + string(lj),li_row - 1)
							end if
						end if
					end if
				next
				

				li_currow += of_outdata(ls_name,li_currow,"detail",li_row)
				li_row = li_row + ids_reportobj.object.rowindetail[li] - 1
			next

			for lj = 1 to li_groupcount
				li_currow += of_outdata(ls_name,li_currow,"trailer." + string(lj),ll_rowcount)
			next			

			li_currow += of_outdata(ls_name,li_currow,"summary",ll_rowcount)
			li_row = ids_reportobj.find("Y>" + string(ids_reportobj.object.y2[li]),li + 1,ids_reportobj.rowcount())

			do while li_row > 0
				ids_reportobj.object.aboverows[li_row] = (li_currow - ai_currow - ids_reportobj.object.startrow[li] + 1)
				if li_row >= ids_reportobj.rowcount() then
					exit
				end if

				li_row = ids_reportobj.find("Y>" + string(ids_reportobj.object.y2[li]),li_row + 1,ids_reportobj.rowcount())
			loop

			li_row = ids_objects.find("Y>" + string(ids_reportobj.object.y2[li]) + " AND Slipup='1' ",1,ids_objects.rowcount())
/////////////////////////
			do while li_row > 0
				ids_objects.object.aboverows[li_row] = (li_currow - ai_currow - ids_reportobj.object.startrow[li] + 1)
				if ids_objects.object.position[li_row] > 0 then
					istr_obj[long(ids_objects.object.position[li_row])].aboverows = (li_currow - ai_currow - ids_reportobj.object.startrow[li] + 1)
				end if
				if li_row >= ids_objects.rowcount() then
					exit
				end if
				li_row = ids_objects.find("Y>" + string(ids_reportobj.object.y2[li]),li_row + 1,ids_objects.rowcount())
			loop

			ids_rowheight.setfilter("band='" + as_band + "' AND ReportName='' ")
			ids_rowheight.filter()
			ids_rowheight.sort()
			li_row = ids_rowheight.find("Y>" + string(ids_reportobj.object.y2[li]),1,ids_rowheight.rowcount())

			do while li_row > 0
				ids_rowheight.object.aboverows[li_row] = (li_currow - ai_currow - ids_reportobj.object.startrow[li] + 1)
				istr_rowheight[long(ids_rowheight.object.position[li_row])].aboverows = (li_currow - ai_currow - ids_reportobj.object.startrow[li] + 1)
				if li_row >= ids_rowheight.rowcount() then
					exit
				end if
				li_row = ids_rowheight.find("Y>" + string(ids_reportobj.object.y2[li]),li_row + 1,ids_rowheight.rowcount())
			loop

	next

	end if

	li_outlines = li_currow - ai_currow ////////////

	if li_outlines < 0 then //////////////
		li_outlines = 0
	end if

end if

for li = istr_oldpos[li_layer].s_height to istr_oldpos[li_layer].e_height
//	if trim(lower(ls_name)) = 'gutter' then continue
	if istr_rowheight[li].height > 0 then
		invo_worksheet.of_set_row_height(ai_currow + istr_rowheight[li].row + istr_rowheight[li].aboverows - 1,double(istr_rowheight[li].height))
	end if
next

lb_have_line = (istr_oldpos[li_layer].s_line <= istr_oldpos[li_layer].e_line)

if ib_gridborder or lb_have_line or (li_band_bgcolor <> 0 and li_band_bgcolor <> 65) then
	for lk = istr_oldpos[li_layer].startrow to istr_oldpos[li_layer].endrow
		for lj = ii_firstcolumn to ii_maxcol
			ii_cells[lk , lj] = 0
		next
	next
end if

for li = istr_oldpos[li_layer].s_line to istr_oldpos[li_layer].e_line	
	li_penwidth = istr_lines[li].penwidth	
	for lk = istr_lines[li].startrow to istr_lines[li].endrow
		for lj = istr_lines[li].startcol to istr_lines[li].endcol
			if lk > 0 and lj > 0 then
				if istr_lines[li].linetype = "h" then					
					li_border = ii_cells[lk , lj]
					if lk = 1 then
						if istr_lines[li].firstflag > 0 then
							li_border = integer(li_border/BC_1000) * BC_1000 + BC_100 * li_penwidth + mod(li_border,BC_100) //bottom + 100
						else
							li_border = BC_1000 * li_penwidth + mod(li_border,BC_1000) //top +1000
						end if
					else
						li_border = integer(li_border/BC_1000) * BC_1000 + BC_100 * li_penwidth + mod(li_border,BC_100) //bottom + 100
					end if
					ii_cells[lk , lj] = li_border
				else
					if lj = ii_maxcol and lj > 1 then
						li_border = ii_cells[lk , lj - 1]
						li_border = integer(li_border/BC_10) * BC_10 + li_penwidth  //right +1
						ii_cells[lk , lj - 1] =  li_border
					else							
						li_border = ii_cells[lk , lj]
						li_border = integer(li_border/BC_100) * BC_100 + BC_10 * li_penwidth + mod(li_border,BC_10)    //left + 10
						ii_cells[lk , lj] =  li_border
					end if
				end if
			end if				
		next
	
	next
next

li_endrow = 0
lb_prior_sparse = true

for li = istr_oldpos[li_layer].s_obj to istr_oldpos[li_layer].e_obj
	
	li_datarow = istr_obj[li].rowindetail + ai_row - 1
	
	if li_datarow > ll_rowcount then
		continue
	end if
	
	if istr_obj[li].visibleexp <> '' then
		lb_visible = (of_evaluate(li_layer,istr_obj[li].visibleexp,ai_row) = '1')
	else
		lb_visible = istr_obj[li].visible
	end if
	
	if lb_visible = false then
		continue
	end if
	
	li_endrow = istr_obj[li].endrow + istr_obj[li].aboverows
	if li_endrow > li_outlines then ///////////////
		li_outlines = li_endrow
	end if
	
	ls_name = istr_obj[li].name
	ls_type = istr_obj[li].stype
	ls_coltype = istr_obj[li].coltype
	li_startrow = istr_obj[li].startrow + istr_obj[li].aboverows
	li_startcol = istr_obj[li].startcol	
	li_endcol = istr_obj[li].endcol
	
	//neu o bat dau da co du lieu -> di chuyen sang o ke tiep
	if (li_row_pre = li_startrow) and (li_endcol_pre = li_startcol) then li_startcol = li_startcol + 1
	li_endcol_pre = li_endcol
	li_row_pre	  = li_startrow
	
	ls_value = ""
	lb_overlap = false	
	li_border = istr_obj[li].border
	
	li_currow = li_startrow + ai_currow
				///////////////
				//if li_currow = 19 then DEBUGBREAK()
				////////////////////////

	if li_layer = 1 then
		if ii_borderbeginrow <= 0 then
			if as_band = "header" and right(ls_name,2) = "_t" then
				ii_borderbeginrow = li_currow
			end if	
		end if
	
		if ii_detailrow <= 0 then
			if as_band = "detail"  then
				ii_detailrow = li_currow
			end if
		end if
	
	else
		if ii_sub_borderbeginrow <= 0 then
			if as_band = "header" and right(ls_name,2) = "_t" then
				ii_sub_borderbeginrow = li_currow
			end if
		end if
	end if	

	if ib_gridborder then
		if li_currow >= ii_borderbeginrow and ii_borderbeginrow >0 then
			li_border = BC_1111
		end if		
	elseif lb_have_line and li_border = 0 then
		if li_startcol = ii_maxcol then
			li_border = ii_cells[li_startrow , li_startcol - 1]
		else
			li_border = ii_cells[li_startrow , li_startcol]
		end if
		if li_border >= 10000 then li_border = mod(li_border,10000)
	end if
	
	li_xfindex = 0	
	ls_borderkey = string(li_border)
	if istr_obj[li].expflag = false then
		for li_bk = 1 to istr_obj[li].bordercount
			if istr_obj[li].borderkey[li_bk] = ls_borderkey then
				li_xfindex = istr_obj[li].borderxf[li_bk]
				exit
			end if
		next
	end if
	
	if li_xfindex <= 0 then
		
		invo_format_temp.of_set_borders(li_border)		
		invo_format_temp.ii_text_wrap = istr_obj[li].wraptext
		
		if istr_obj[li].formatexp = '' then
			invo_format_temp.of_set_num_format(istr_obj[li].format)
		else
			invo_format_temp.of_set_num_format(of_evaluate(li_layer,istr_obj[li].formatexp,ai_row))
		end if
		
		if istr_obj[li].fontsizeexp = '' then
			invo_format_temp.ii_size = istr_obj[li].fontsize
		else
			invo_format_temp.ii_size = abs(long(of_evaluate(li_layer,istr_obj[li].fontsizeexp,ai_row)))
		end if

		if istr_obj[li].fontnameexp = '' then
			invo_format_temp.of_set_font(istr_obj[li].fontname)
		else
			invo_format_temp.of_set_font(of_evaluate(li_layer,istr_obj[li].fontnameexp,ai_row))
		end if

		if istr_obj[li].fontweightexp = '' then
			invo_format_temp.ii_bold = istr_obj[li].fontweight
		else
			invo_format_temp.ii_bold = long(of_evaluate(li_layer,istr_obj[li].fontweightexp,ai_row))
		end if

		if istr_obj[li].fontitalicexp = '' then
			invo_format_temp.ii_italic = istr_obj[li].fontitalic
		else
			invo_format_temp.ii_italic = long(of_evaluate(li_layer,istr_obj[li].fontitalicexp,ai_row))
		end if

		if istr_obj[li].alignmentexp = '' then
			invo_format_temp.ii_text_h_align = istr_obj[li].alignment
		else

			choose case of_evaluate(li_layer,istr_obj[li].alignmentexp,ai_row)
				case "1"
					invo_format_temp.ii_text_h_align = 3
				case "2"
					invo_format_temp.ii_text_h_align = 2
				case else
					invo_format_temp.ii_text_h_align = 1
			end choose

		end if

		if istr_obj[li].fontcolorexp = '' then
			invo_format_temp.ii_color = istr_obj[li].fontcolor
		else
			li_color = long(of_evaluate(li_layer,istr_obj[li].fontcolorexp,ai_row))
			li_color = of_get_color(li_color)
			invo_format_temp.ii_color = of_get_custom_color_index(li_color)
		end if

		if istr_obj[li].bgcolorexp = '' then
			li_color = istr_obj[li].bgcolor
		else
			li_color = long(of_evaluate(li_layer,istr_obj[li].bgcolorexp,ai_row))
			li_color = of_get_color(li_color)
			if li_color <> 0 then
				li_color = of_get_custom_color_index(li_color)
			end if
		end if

		if li_color <> 0 and li_color <> 65 then
			invo_format_temp.of_set_bg_color(li_color)
		elseif li_band_bgcolor <> 0 then
			invo_format_temp.of_set_bg_color(li_band_bgcolor)
		else
			invo_format_temp.of_set_bg_color(65)
		end if
						
		if istr_obj[li].expflag then
			ls_borderkey = invo_format_temp.of_get_format_short_key()
			for li_bk = 1 to istr_obj[li].bordercount
				if istr_obj[li].borderkey[li_bk] = ls_borderkey then
					li_xfindex = istr_obj[li].borderxf[li_bk]
					exit
				end if
			next
		end if
		if li_xfindex > 0 then
			invo_format_temp.ii_xf_index = li_xfindex
		else
			invo_format_temp.ii_xf_index = 0		
			li_xfindex = invo_workbook.of_reg_format(invo_format_temp,true)
			istr_obj[li].bordercount ++
			istr_obj[li].borderkey[istr_obj[li].bordercount] = ls_borderkey
			istr_obj[li].borderxf[istr_obj[li].bordercount] = li_xfindex
		end if
	else
		invo_format_temp.ii_xf_index = li_xfindex
	end if
	
	lb_skip_sparse = false

	if istr_obj[li].sparse > 0  then
		ls_value = of_getdata(li_layer, li_datarow,ls_name,ls_coltype,invo_format_temp.is_num_format,istr_obj[li].displayvalue,istr_obj[li].columnid,lb_overlap)
		if ls_value = istr_obj[li].priorvalue then
			lb_skip_sparse = lb_prior_sparse	
		else
			lb_prior_sparse = false
			istr_obj[li].priorvalue = ls_value
		end if
	end if	
	
	if ls_type = 'column' or ls_type ='compute' then
		CHOOSE CASE ls_coltype
			CASE "S"
				if lb_skip_sparse then
					SetNull(ls_value)
				elseif istr_obj[li].displayvalue then
					ls_value = of_getdata(li_layer, li_datarow,ls_name,ls_coltype,invo_format_temp.is_num_format,istr_obj[li].displayvalue,istr_obj[li].columnid,lb_overlap)
				else
					if li_layer = 1 then
						ls_value = idw_requestor.GetItemString(li_datarow,ls_name)
					else
						ls_value = ids_requestor.GetItemString(li_datarow,ls_name)
					end if
				end if
			invo_worksheet.of_write(li_currow - 1,li_startcol - 1,ls_value,invo_format_temp)
			CASE "N"
				if lb_skip_sparse then
					invo_worksheet.of_write(li_currow - 1,li_startcol - 1,invo_format_temp)
				elseif istr_obj[li].displayvalue then
					ls_value = of_getdata(li_layer, li_datarow,ls_name,ls_coltype,invo_format_temp.is_num_format,istr_obj[li].displayvalue,istr_obj[li].columnid,lb_overlap)
					invo_worksheet.of_write(li_currow - 1,li_startcol - 1,ls_value,invo_format_temp)
				else
					if li_layer = 1 then
						ldec_val = idw_requestor.getitemnumber(li_datarow,ls_name)
					else
						ldec_val = ids_requestor.getitemnumber(li_datarow,ls_name)
					end if
					invo_worksheet.of_write(li_currow - 1,li_startcol - 1,ldec_val,invo_format_temp)
				end if				
			CASE "DT"				
				if lb_skip_sparse then
					SetNull(ldt_val)
				else
					if li_datarow = 40000 then
						li_datarow = 40000
					end if 
					if li_datarow = 43000 then
						li_datarow = 43000
					end if 
					if li_layer = 1 then
						ldt_val = idw_requestor.GetItemDateTime(li_datarow,ls_name)
					else
						ldt_val = ids_requestor.GetItemDateTime(li_datarow,ls_name)
					end if
				end if
				invo_worksheet.of_write(li_currow - 1,li_startcol - 1,ldt_val,invo_format_temp)
			CASE "T"
				if lb_skip_sparse then
					SetNull(lt_val)
				else
					if li_layer = 1 then
						lt_val = idw_requestor.GetItemTime(li_datarow,ls_name)
					else
						lt_val = ids_requestor.GetItemTime(li_datarow,ls_name)
					end if
				end if
				invo_worksheet.of_write(li_currow - 1,li_startcol - 1,lt_val,invo_format_temp)
			CASE "D"				
				if lb_skip_sparse then
					SetNull(ld_val)
				else
					if li_layer = 1 then
						ld_val = idw_requestor.GetItemDate(li_datarow,ls_name)
					else
						ld_val = ids_requestor.GetItemDate(li_datarow,ls_name)
					end if
				end if
				invo_worksheet.of_write(li_currow - 1,li_startcol - 1,ld_val,invo_format_temp)
		END CHOOSE
	else		
		if li_layer = 1 then
			ls_value = idw_requestor.describe(ls_name + ".text")
		else
			ls_value = ids_requestor.describe(ls_name + ".text")
		end if

		if ((left(ls_value,1) = "~"") or (left(ls_value,1) = "'")) then
			ls_value = mid(ls_value,2,len(ls_value) - 2)
		end if

		lj = pos(ls_value,"~t")

		if lj > 0 then
			ls_value = of_evaluate(li_layer,mid(ls_value,lj + 1),ai_row)
		end if

		if ((ls_value = "!") or (ls_value = "?")) then
			ls_value = ""
		end if
		invo_worksheet.of_write(li_currow - 1,li_startcol - 1,ls_value,invo_format_temp)				
	end if
	if ((li_startrow <> li_endrow) or (li_startcol <> li_endcol)) then
		invo_worksheet.of_merge_cells(li_currow - 1,li_startcol - 1,li_endrow + ai_currow - 1,li_endcol - 1)
	end if
	ii_cells[li_startrow , li_startcol] += 10000
next


integer li_col
for li = istr_oldpos[li_layer].s_line to istr_oldpos[li_layer].e_line		
	for lk = istr_lines[li].startrow to istr_lines[li].endrow
		for lj = istr_lines[li].startcol to istr_lines[li].endcol
			if lk > 0 and lj > 0 then
				if istr_lines[li].linetype = "h" then					
					li_col = lj
				else
					if lj = ii_maxcol and lj > 1 then
						li_col = lj - 1
					else							
						li_col = lj
					end if
				end if
				li_border = ii_cells[lk , li_col]
				IF li_border < 10000 and li_border > 0 then
					invo_grid_temp.ii_xf_index = this.of_reg_border(li_band_bgcolor,li_border)
					invo_worksheet.of_write(lk + ai_currow - 1,li_col - 1,invo_grid_temp)
					ii_cells[lk , li_col] += 10000
				end if
			end if
		next
	next
next

if ib_gridborder then
	boolean lb_draw_grid
	if li_layer = 1 then
		if ii_borderendrow <= 0 then ii_borderendrow = li_currow
		li_currow = istr_oldpos[li_layer].startrow + ai_currow
		lb_draw_grid = (li_currow > ii_borderbeginrow and ii_maxcol > 0 and ii_borderbeginrow > 0)
	else
		lb_draw_grid = (li_currow >= ii_sub_borderbeginrow and ii_sub_borderbeginrow > 0)
	end if

	if lb_draw_grid  then
		invo_default_border.ii_xf_index = this.of_reg_border(li_band_bgcolor,li_border)
		lk = istr_oldpos[li_layer].startrow
		for lj = ii_firstcolumn to ii_maxcol			
			if  ii_cells[lk , lj] < 10000 then //not saved
				invo_worksheet.of_write(li_currow - 1,lj - 1,invo_default_border)
			end if
		next
	end if
elseif li_band_bgcolor <> 0 and li_band_bgcolor <> 65 then
	for lk = istr_oldpos[li_layer].startrow to istr_oldpos[li_layer].endrow
		for lj = ii_firstcolumn to ii_maxcol
			if ii_cells[lk , lj] < 10000 then
				invo_grid_temp.ii_xf_index = this.of_reg_border(li_band_bgcolor,li_border)
				invo_worksheet.of_write(lk + ai_currow - 1,lj - 1,invo_grid_temp)
			end if
		next
	next
end if

is_oldband[li_layer] = as_band


return li_outlines
end function

public function integer of_dw2excel (datawindow adw, string as_filename, string as_arguments);//arguments= "key;value" eg: "openexcel;1;printheader;2"
long li, lj, li_row, li_col, li_rows_per_detail, li_layer = 1, ll_flag,ll_rtn
double ld_width
long li_currow, li_count, li_groupcount
string ls_args[], ls_range,ls_excelversion, ls_processing
window lw
OLEobject ole_excel,ole_workbook
ole_excel = Create OLEobject 
ole_workbook = Create OLEobject 
c_company lc_comp

ll_flag = 0
if not isvalid(adw) then
	return -1
end if

if fileexists(as_filename) then
//	if messagebox(MSG_NOTE_TITLE,MSG_FILE_EXISTS + "("+as_filename+")" ,question!,yesno!) = 2 then
//		return -1	
//	end if
	filedelete(as_filename)
end if

idw_requestor = adw
invo_workbook = create n_xls_workbookx
ls_processing = idw_requestor.Describe("DataWindow.Processing")

if invo_workbook.of_create(as_filename) < 0 then
	destroy(invo_workbook)
	return -1
end if

setpointer(hourglass!)

of_init_dwsyntax()
invo_format_temp = create n_xls_formatx
invo_grid_temp = create n_xls_formatx
invo_default_border = create n_xls_formatx
invo_default_border.of_set_borders(BC_1111)
invo_colors = create n_associated_ulong_srvx

invo_worksheet = invo_workbook.of_add_worksheet()

li_count = of_ParseToArray(lower(as_arguments),";",ls_args)
for li = 1 To li_count step 2
	choose case ls_args[li]
		case 'printheader'
			of_setprintheader(integer(ls_args[li+1]))
		case 'openexcel'
			ib_openexcel = (ls_args[li+1] = '1')
		case 'gridlines'
			invo_worksheet.of_hide_gridlines(integer(ls_args[li+1]))
		case 'ssthash'
			invo_worksheet.of_set_sst_hash((ls_args[li+1] = '1'))
		case 'showmsg'
			ib_showmsg = (ls_args[li+1] = '1')
	end choose
next

idw_requestor.accepttext()
li_groupcount = of_groupcount()
if li_groupcount > 0 then
	idw_requestor.groupcalc()
end if

is_oldband[li_layer] = ''
of_analyze_cells()

ids_column.setfilter("")
ids_column.setsort("StartCol A")
ids_column.filter()
ids_column.sort()
ids_objects.setsort(" X A, StartCol A , StartRow A ")
ids_objects.sort()

for li = 1 to ids_column.rowcount()
	li_col = ids_column.object.startcol[li]
	ld_width = ids_column.object.width[li]

	choose case is_units
		case "1"
			ld_width = pixelstounits(ld_width,xpixelstounits!)
		case "2"
			ld_width = pixelstounits((ld_width * 96) / 1000,xpixelstounits!)
		case "3"
			ld_width = pixelstounits((ld_width * 37.8) / 1000,xpixelstounits!)
	end choose

	ld_width = ld_width / 28

	if ld_width > 0 then
		invo_worksheet.of_set_column_width(li_col - 1,ld_width)
	end if

next

if ib_show_progress then	
	invo_workbook.of_show_progress(0)
end if

if idw_requestor.rowcount() > 0 then
	li_currow = of_outdata('',0,"header",1)
else
	li_currow = of_outdata('',0,"header",0)
end if

li_count = idw_requestor.rowcount()
li_rows_per_detail = long(idw_requestor.describe("datawindow.rows_per_detail"))

for li_row = 1 to li_count
	////////////
//	if li_row = 89 then debugbreak()
	///////////
	for lj = li_groupcount to 1 step -1 

		if invo_workbook.of_iscancel() then 
			li_row = li_count + 1
			exit
		end if
	
		if ib_groupoutflag then

			if idw_requestor.findgroupchange(li_row,lj) = li_row then

				if li_row <> 1 then
						
						if long(idw_requestor.describe("datawindow.trailer." + string(lj) + ".height")) > 0 then
							li_currow += of_outdata('',li_currow,"trailer." + string(lj),li_row - 1)
						end if
	
						if lj <= upperbound(ib_groupnewpage) then
	
							if ib_groupnewpage[lj] then
								invo_worksheet.of_add_h_pagebreak(li_currow)
							end if
	
						end if
					
				end if

//				if ((ii_printheader <> 1) or (li_row = 1)) then
//		
//							if long(idw_requestor.describe("datawindow.header." + string(lj) + ".height")) > 0 then
//								li_currow += of_outdata('',li_currow,"header." + string(lj),li_row)
//							end if
//		
//					end if

			end if

		else

//			if li_row = 1 then
//
//				if long(idw_requestor.describe("datawindow.header." + string(lj) + ".height")) > 0 then
//					li_currow += of_outdata('',li_currow,"header." + string(lj),li_row)
//				end if

//			end if

		end if

	next

	for lj = 1 to li_groupcount  

		if invo_workbook.of_iscancel() then 
			li_row = li_count + 1
			exit
		end if
	
		if ib_groupoutflag then

			if idw_requestor.findgroupchange(li_row,lj) = li_row then

				if li_row <> 1 then
						
							if long(idw_requestor.describe("datawindow.header." + string(lj) + ".height")) > 0 then
								if ls_processing = '8' then
									li_currow += of_outdata('',li_currow,"tree.level." + string(lj),li_row)
								else
									li_currow += of_outdata('',li_currow,"header." + string(lj),li_row)
								end if
							end if
							ll_flag = 1 
						if lj <= upperbound(ib_groupnewpage) then
	
							if ib_groupnewpage[lj] then
								invo_worksheet.of_add_h_pagebreak(li_currow)
							end if
	
						end if
					
				end if

				if ((ii_printheader <> 1) or (li_row = 1)) then
		
							if long(idw_requestor.describe("datawindow.header." + string(lj) + ".height")) > 0 then
								if ls_processing = '8' then
									li_currow += of_outdata('',li_currow,"tree.level." + string(lj),li_row)
								else
									li_currow += of_outdata('',li_currow,"header." + string(lj),li_row)
								end if								
//								li_currow += of_outdata('',li_currow,"header." + string(lj),li_row)
							end if
		
					end if

			end if

		else

			if li_row = 1 then

				if long(idw_requestor.describe("datawindow.header." + string(lj) + ".height")) > 0 then
					if ls_processing = '8' then
						li_currow += of_outdata('',li_currow,"tree.level." + string(lj),li_row)
					else
						li_currow += of_outdata('',li_currow,"header." + string(lj),li_row)
					end if								
//					li_currow += of_outdata('',li_currow,"header." + string(lj),li_row)
				end if

			end if

		end if

	next

	li_currow += of_outdata('',li_currow,"detail",li_row)
	li_row = li_row + li_rows_per_detail - 1
next

for lj = li_groupcount to 1 step -1
	if invo_workbook.of_iscancel() then 
		exit
	end if
	li_currow += of_outdata('',li_currow,"trailer." + string(lj),idw_requestor.rowcount())
next

li_currow += of_outdata('',li_currow,"summary",idw_requestor.rowcount())

if ii_borderbeginrow <= 0 then
	ii_borderbeginrow = ii_detailrow
end if

li_currow += of_outdata('',li_currow,"footer",idw_requestor.rowcount())

if ii_printheader <> 0 then
	li_currow = 0
	ids_objects.setfilter("band='header'")
	ids_objects.filter()
	li_currow = long(ids_objects.describe("Evaluate('Max(EndRow)',0)"))
///////////////////////////////////////////////////////////////////
	if ii_printheader = 1 then
		if li_groupcount = 1 and ll_flag = 0 then
			for li = 1 to li_groupcount
				if ls_processing = '8' then
					ids_objects.setfilter("band='tree.level." + string(li) + "'")
				else
					ids_objects.setfilter("band='header." + string(li) + "'")
				end if								
//				ids_objects.setfilter("band='header." + string(li) + "'")
				ids_objects.filter()
				li_currow += long(ids_objects.describe("Evaluate('Max(EndRow)',0)"))
			next
		else
			li_currow=li_currow
		end if
	end if
//////////////////////////////////////////////////////////////////////

	if li_currow > 0 then
		invo_worksheet.of_repeat_rows(0,li_currow - 1)
		invo_worksheet.of_freeze_panes(li_currow,0,li_currow,0)
	end if

end if
///////////////////////////////////////////////////
invo_worksheet.of_set_paper(long(idw_requestor.describe("datawindow.print.paper.size")))

if idw_requestor.describe("datawindow.print.Orientation") = "1" then
	invo_worksheet.of_set_landscape()
else
	invo_worksheet.of_set_portrait()
end if

invo_worksheet.of_set_print_scale(long(idw_requestor.describe("datawindow.zoom ")))

ld_width = long(idw_requestor.describe("datawindow.print.margin.Left"))

choose case is_units
	case "0"
		ld_width = unitstopixels(ld_width,xunitstopixels!) * 0.0104
	case "1"
		ld_width = ld_width * 0.0104
	case "3"
		ld_width = (ld_width / 1000) / 2.54
end choose

invo_worksheet.of_set_margin_left(ld_width)
ld_width = long(idw_requestor.describe("datawindow.print.margin.right"))

choose case is_units
	case "0"
		ld_width = unitstopixels(ld_width,xunitstopixels!) * 0.0104
	case "1"
		ld_width = ld_width * 0.0104
	case "3"
		ld_width = (ld_width / 1000) / 2.54
end choose

invo_worksheet.of_set_margin_right(ld_width)
ld_width = long(idw_requestor.describe("datawindow.print.margin.top"))

choose case is_units
	case "0"
		ld_width = unitstopixels(ld_width,xunitstopixels!) * 0.0104
	case "1"
		ld_width = ld_width * 0.0104
	case "3"
		ld_width = (ld_width / 1000) / 2.54
end choose

invo_worksheet.of_set_margin_top(ld_width)
ld_width = long(idw_requestor.describe("datawindow.print.margin.bottom"))

choose case is_units
	case "0"
		ld_width = unitstopixels(ld_width,xunitstopixels!) * 0.0104
	case "1"
		ld_width = ld_width * 0.0104
	case "3"
		ld_width = (ld_width / 1000) / 2.54
end choose

invo_worksheet.of_set_margin_bottom(ld_width)
invo_workbook.of_close()

if isvalid(lw) then
	close(lw)
end if


if invo_workbook.of_iscancel() then
	filedelete(as_filename)
end if

if ib_show_progress then
	invo_workbook.of_show_progress(10000)
end if 


///////////////////////////////////////////////////////////////////////////Xuat hinh ra file excel
	long li_x,li_y,ll_w,ll_h,ll
	string ls_patch
	ls_patch = idw_requestor.describe('p_logo.visible')
	if ls_patch = '1' then//co control p_logo va co hien thi
		li_x= dec(idw_requestor.object.p_logo.x)/6.75				
		li_y= dec(idw_requestor.object.p_logo.y)/6.75
		RegistryGet("HKEY_CLASSES_ROOT\Excel.Application\CurVer","",RegString!,ls_excelversion) // lấy version hiện tại của office
		if ole_excel.ConnectToNewObject(ls_excelversion) = 0 then
			ole_excel.WorkBooks.Open(as_filename) 
			ole_excel.Columns("A").ColumnWidth = 9.6
			ls_patch=idw_requestor.describe("p_logo.filename")
//			ls_patch=idw_requestor.object.p_logo.filename
//			ls_patch = idw_requestor.getitemstring(1,'p_logo')
//			ls_patch = GetCurrentDirectory ( ) + '\' + ls_patch
			ole_excel.ActiveSheet.Pictures.Insert(ls_patch).select
			ole_excel.Selection.ShapeRange.Width=53
			ole_excel.Selection.ShapeRange.Height=53
			//Dinh toa do hinh x,y
			if li_x>100 then
				ole_excel.Selection.ShapeRange.Left =  li_x   // x
				ole_excel.Selection.ShapeRange.Top =  li_y  // y
			else
				ole_excel.Selection.ShapeRange.Left =  0
				ole_excel.Selection.ShapeRange.Top =  0
			end if
			// Save
			ole_workbook = ole_excel.application.workbooks(1)
			ole_excel.DisplayAlerts = false
			ole_workbook.save()
			// Quit
			  ole_excel.application.quit()
			  ole_excel.DisconnectObject()
			  destroy ole_Excel
		end if
	end if
///////////////////////////////////////////////////////////////////////////////

if not invo_workbook.of_iscancel() then
	if ib_openexcel  then			
		string ls_null				
		long ll_rc
	
//		in_runandwait.of_set_options( true, 30*60)
//		in_runandwait.of_shellrun( as_filename, 'open', Maximized!)
		SetNull(ls_null)
		Environment env
		GetEnvironment(env)
		if env.PBMajorRevision >= 10 then
			ll_rc = ShellExecute100(0,"open",""+as_filename+"",ls_null,ls_null,1)			
		else
			ll_rc = ShellExecute080(0,"open",""+as_filename+"",ls_null,ls_null,1)
		end if
		if ll_rc < 32 then
			MessageBox(MSG_NOTE_TITLE,MSG_FILE_OPEN_ERROR)
		end if
	else
	
		if ib_showmsg then
			messagebox(MSG_NOTE_TITLE,MSG_FILE_WRITE_SUCCESS + ":" + as_filename + "")
		end if
	
	end if
end if

//clear
istr_obj[] = istr_empty_obj[]
istr_lines[] = istr_empty_line[]
istr_rowheight[] = istr_empty_rowheight[]
istr_position[] = istr_empty_position[]

destroy(invo_workbook)
destroy(invo_worksheet)
destroy invo_format_temp
destroy invo_grid_temp
destroy invo_default_border
destroy invo_colors
destroy(ids_line)
destroy(ids_rowheight)
destroy(ids_column)
destroy(ids_objects)
destroy(ids_reportobj)
destroy(ids_bands)
if isvalid(ids_requestor) then destroy(ids_requestor)

setpointer(arrow!)
return 1

/////////////////////////////////////////////////////////////////////////////Xuat hinh ra file excel 2010
//try
//	long li_x,li_y,ll_w,ll_h,ll
//	string ls_patch
//	ls_patch = idw_requestor.describe('p_logo.visible')
//	if ls_patch = '1' then//co control p_logo va co hien thi
//		li_x= dec(idw_requestor.object.p_logo.x)/6.75				
//		li_y= dec(idw_requestor.object.p_logo.y)/6.75				
//		if ole_excel.ConnectToNewObject("excel.application") = 0 then
//			ole_excel.WorkBooks.Open(as_filename) 
//			ole_excel.Columns("A").ColumnWidth = 9.6
//			ls_patch=idw_requestor.object.p_logo.filename
//			ole_excel.ActiveSheet.Pictures.Insert(ls_patch).select
//			ole_excel.Selection.ShapeRange.Width=53
//			ole_excel.Selection.ShapeRange.Height=53
//			//Dinh toa do hinh x,y
//			if li_x>100 then
//				ole_excel.Selection.ShapeRange.Left =  li_x   // x
//				ole_excel.Selection.ShapeRange.Top =  li_y  // y
//			else
//				ole_excel.Selection.ShapeRange.Left =  0
//				ole_excel.Selection.ShapeRange.Top =  0
//			end if
//			// Save
//			ole_excel.DisplayAlerts = false
//			// chuy?n sang d?nh d?ng office 2007 ho?c hon
//				//RegistryGet("HKEY_CLASSES_ROOT\Excel.Application\CurVer","",RegString!,ls_value) // l?y version hi?n t?i c?a office
//				//Mid(ls_value, LastPos(ls_value, '.') + 1)
//				// if pos('12,13,14,15,16,17,18',ls_value)=1 then
//					// las_filename=as_filename+'x'
//					// ole_excel.Application.ActiveWorkbook.SaveAs(las_filename,xlWorkbookDefault)//51
//				// end if
//			ole_excel.Save()
//			// Quit
//			  ole_excel.application.quit()
//			  ole_excel.DisconnectObject()
//			  destroy ole_Excel
//		end if
//	end if
//catch (runtimeerror lre)
//		messagebox('Thông Báo','Không thể xuất LOGO do máy dang sử dụng Office 2010 hoặc hon ~r~n'+&
//							'Ðể xuất LOGO hãy chuyển File Excel sang chế độ COMPATIBILITY ~r~n'+&
//							'Cách chuyển: ~r~n'+&
//							'Trong giao diện Excel, chọn FILE, chọn EDIT ANYWAY, chọn OK ~r~n'+&
//							'Bây giờ hãy xuất Excel lại vào File vừa chỉnh sửa')
//end try
/////////////////////////////////////////////////////////////////////////////////
end function

public function integer of_dw2excel (datawindow adw, string as_filename);RETURN of_dw2excel(adw,as_filename,'')
end function

public function integer of_reg_border (integer ai_color, integer ai_border);integer li_index
if ai_color = 0 then ai_color = 65
li_index = ai_border + 1
if ii_border_hash[ai_color,li_index] > 0 then	
else
	n_xls_formatx lnvo_format
	lnvo_format = create n_xls_formatx
	lnvo_format.of_set_bg_color(ai_color)
	lnvo_format.of_set_borders(ai_border)
	invo_workbook.of_reg_format(lnvo_format,false)
	ii_border_hash[ai_color,li_index] = lnvo_format.ii_xf_index	
end if

RETURN ii_border_hash[ai_color,li_index]
end function

protected function string of_getdata (integer ai_layer, long ai_row, string as_objectname, string as_coltype, string as_format, boolean ab_displayvalue, integer ai_columnid, boolean ab_overlap);string ls_ret, ls_values, ls_coltype, ls_datacolumn, ls_style
long li, lj, li_child_err

if ((ab_displayvalue ) or (ab_overlap = false)) then
	as_format = ""
end if
if ai_row <= 0 then
	if ai_layer = 1 then
		ls_ret = idw_requestor.describe("Evaluate('" + as_objectname + "',0)")
	else
		ls_ret = ids_requestor.describe("Evaluate('" + as_objectname + "',0)")
	end if

	if ((ls_ret = "!") or (ls_ret = "?")) then
		ls_ret = ""
	end if

	if as_coltype = "DT" then
		ls_ret = string(datetime(blob(ls_ret)),as_format)
	else

		if as_coltype = "D" then
			ls_ret = string(date(ls_ret),as_format)
		end if

	end if

	return ls_ret
end if

if ab_displayvalue then
	if ai_layer = 1 then
		ls_ret = idw_requestor.describe("Evaluate('LookUpDisplay(" + as_objectname + ") ', " + string(ai_row) + ")")
	else
		ls_ret = ids_requestor.describe("Evaluate('LookUpDisplay(" + as_objectname + ") ', " + string(ai_row) + ")")
	end if

	if ls_ret <> "!" and ls_ret <> "?" then
		return ls_ret
	else
		ls_ret = ""
	end if
else
	if ai_layer = 1 then
		choose case as_coltype
			case "S"
				ls_ret = idw_requestor.getitemstring(ai_row,as_objectname)
			case "N"
				ls_ret = string(idw_requestor.getitemnumber(ai_row,as_objectname))
			case "DT"
				ls_ret = string(idw_requestor.getitemdatetime(ai_row,as_objectname),as_format)
			case "D"
				ls_ret = string(idw_requestor.getitemdate(ai_row,as_objectname),as_format)
			case "T"
				ls_ret = string(idw_requestor.getitemtime(ai_row,as_objectname),as_format)
		end choose
	else
		choose case as_coltype
			case "S"
				ls_ret = ids_requestor.getitemstring(ai_row,as_objectname)
			case "N"
				ls_ret = string(ids_requestor.getitemnumber(ai_row,as_objectname))
			case "DT"
				ls_ret = string(ids_requestor.getitemdatetime(ai_row,as_objectname),as_format)
			case "D"
				ls_ret = string(ids_requestor.getitemdate(ai_row,as_objectname),as_format)
			case "T"
				ls_ret = string(ids_requestor.getitemtime(ai_row,as_objectname),as_format)
		end choose
	end if
end if
//
//
if ab_displayvalue  /*and ab_columnid = false */and ls_ret <> "" then

		if ai_layer = 1 then
			ls_style  = idw_requestor.describe(as_objectname + ".edit.style")			
			if ls_style = 'dddw' then 				
				ls_datacolumn = idw_requestor.describe(as_objectname + ".DDDW.DataColumn")
				li_child_err = idw_requestor.getchild(as_objectname,idwc_temp)
			end if
		else
			ls_style  = ids_requestor.describe(as_objectname + ".edit.style")			
			if ls_style ='dddw' then 				
				ls_datacolumn = ids_requestor.describe(as_objectname + ".DDDW.DataColumn")
				li_child_err = ids_requestor.getchild(as_objectname,idwc_temp)
			end if
		end if
		if ls_style ='dddw' then			
			if isvalid(idwc_temp) then
				ls_coltype = idwc_temp.describe(ls_datacolumn + ".ColType")
				choose case left(ls_coltype,4)
					case "char", "date"
						li = idwc_temp.find(ls_datacolumn + "='" + ls_ret + "'",1,idwc_temp.rowcount())
					case else
						li = idwc_temp.find(ls_datacolumn + "=" + ls_ret,1,idwc_temp.rowcount())
				end choose	
				if li > 0 then
					ls_ret = idwc_temp.describe("Evaluate('" + idw_requestor.describe(as_objectname + ".DDDW.DisplayColumn") + "'," + string(li) + " )")
				end if
	
			end if
		else
			if ai_layer = 1 then
				ls_values = idw_requestor.describe(as_objectname + ".Values")
			else
				ls_values = ids_requestor.describe(as_objectname + ".Values")
			end if
			li = pos(ls_values,"~t" + ls_ret)
	
			if li > 0 then
				lj = of_lastpos(left(ls_values,li),"/",0)
				ls_ret = mid(ls_values,lj + 1,li - lj - 1)
			end if
		end if
end if
return ls_ret
end function

public function integer of_dw2excel_invisible (datawindow adw, string as_filename, string as_arguments);//arguments= "key;value" eg: "openexcel;1;printheader;2"
long li, lj, li_row, li_col, li_rows_per_detail, li_layer = 1, ll_flag
double ld_width
long li_currow, li_count, li_groupcount
string ls_args[], ls_range
window lw
OLEobject ole_excel
ole_excel = Create OLEobject 
c_company lc_comp
ib_show_progress = false
ll_flag = 0
if not isvalid(adw) then
	return -1
end if

if fileexists(as_filename) then
//	if messagebox(MSG_NOTE_TITLE,MSG_FILE_EXISTS + "("+as_filename+")" ,question!,yesno!) = 2 then
//		return -1	
//	end if
	filedelete(as_filename)
end if

idw_requestor = adw
invo_workbook = create n_xls_workbookx

if invo_workbook.of_create(as_filename) < 0 then
	destroy(invo_workbook)
	return -1
end if

setpointer(hourglass!)

of_init_dwsyntax()
invo_format_temp = create n_xls_formatx
invo_grid_temp = create n_xls_formatx
invo_default_border = create n_xls_formatx
invo_default_border.of_set_borders(BC_1111)
invo_colors = create n_associated_ulong_srvx

invo_worksheet = invo_workbook.of_add_worksheet()

li_count = of_ParseToArray(lower(as_arguments),";",ls_args)
for li = 1 To li_count step 2
	choose case ls_args[li]
		case 'printheader'
			of_setprintheader(integer(ls_args[li+1]))
		case 'openexcel'
			ib_openexcel = (ls_args[li+1] = '1')
		case 'gridlines'
			invo_worksheet.of_hide_gridlines(integer(ls_args[li+1]))
		case 'ssthash'
			invo_worksheet.of_set_sst_hash((ls_args[li+1] = '1'))
		case 'showmsg'
			ib_showmsg = (ls_args[li+1] = '1')
	end choose
next

idw_requestor.accepttext()
li_groupcount = of_groupcount()
if li_groupcount > 0 then
	idw_requestor.groupcalc()
end if

is_oldband[li_layer] = ''
of_analyze_cells()

ids_column.setfilter("")
ids_column.setsort("StartCol A")
ids_column.filter()
ids_column.sort()
ids_objects.setsort(" X A, StartCol A , StartRow A ")
ids_objects.sort()

for li = 1 to ids_column.rowcount()
	li_col = ids_column.object.startcol[li]
	ld_width = ids_column.object.width[li]

	choose case is_units
		case "1"
			ld_width = pixelstounits(ld_width,xpixelstounits!)
		case "2"
			ld_width = pixelstounits((ld_width * 96) / 1000,xpixelstounits!)
		case "3"
			ld_width = pixelstounits((ld_width * 37.8) / 1000,xpixelstounits!)
	end choose

	ld_width = ld_width / 28

	if ld_width > 0 then
		invo_worksheet.of_set_column_width(li_col - 1,ld_width)
	end if

next

if ib_show_progress then	
	invo_workbook.of_show_progress(0)
end if

if idw_requestor.rowcount() > 0 then
	li_currow = of_outdata('',0,"header",1)
else
	li_currow = of_outdata('',0,"header",0)
end if

li_count = idw_requestor.rowcount()
li_rows_per_detail = long(idw_requestor.describe("datawindow.rows_per_detail"))

for li_row = 1 to li_count
	////////////
//	if li_row = 89 then debugbreak()
	///////////
	for lj = li_groupcount to 1 step -1 

		if invo_workbook.of_iscancel() then 
			li_row = li_count + 1
			exit
		end if
	
		if ib_groupoutflag then

			if idw_requestor.findgroupchange(li_row,lj) = li_row then

				if li_row <> 1 then
						
						if long(idw_requestor.describe("datawindow.trailer." + string(lj) + ".height")) > 0 then
							li_currow += of_outdata('',li_currow,"trailer." + string(lj),li_row - 1)
						end if
	
						if lj <= upperbound(ib_groupnewpage) then
	
							if ib_groupnewpage[lj] then
								invo_worksheet.of_add_h_pagebreak(li_currow)
							end if
	
						end if
					
				end if

//				if ((ii_printheader <> 1) or (li_row = 1)) then
//		
//							if long(idw_requestor.describe("datawindow.header." + string(lj) + ".height")) > 0 then
//								li_currow += of_outdata('',li_currow,"header." + string(lj),li_row)
//							end if
//		
//					end if

			end if

		else

//			if li_row = 1 then
//
//				if long(idw_requestor.describe("datawindow.header." + string(lj) + ".height")) > 0 then
//					li_currow += of_outdata('',li_currow,"header." + string(lj),li_row)
//				end if

//			end if

		end if

	next

	for lj = 1 to li_groupcount  

		if invo_workbook.of_iscancel() then 
			li_row = li_count + 1
			exit
		end if
	
		if ib_groupoutflag then

			if idw_requestor.findgroupchange(li_row,lj) = li_row then

				if li_row <> 1 then
						
							if long(idw_requestor.describe("datawindow.header." + string(lj) + ".height")) > 0 then
								li_currow += of_outdata('',li_currow,"header." + string(lj),li_row)
							end if
							ll_flag = 1 
						if lj <= upperbound(ib_groupnewpage) then
	
							if ib_groupnewpage[lj] then
								invo_worksheet.of_add_h_pagebreak(li_currow)
							end if
	
						end if
					
				end if

				if ((ii_printheader <> 1) or (li_row = 1)) then
		
							if long(idw_requestor.describe("datawindow.header." + string(lj) + ".height")) > 0 then
								li_currow += of_outdata('',li_currow,"header." + string(lj),li_row)
							end if
		
					end if

			end if

		else

			if li_row = 1 then

				if long(idw_requestor.describe("datawindow.header." + string(lj) + ".height")) > 0 then
					li_currow += of_outdata('',li_currow,"header." + string(lj),li_row)
				end if

			end if

		end if

	next

	li_currow += of_outdata('',li_currow,"detail",li_row)
	li_row = li_row + li_rows_per_detail - 1
next

for lj = li_groupcount to 1 step -1
	if invo_workbook.of_iscancel() then 
		exit
	end if
	li_currow += of_outdata('',li_currow,"trailer." + string(lj),idw_requestor.rowcount())
next

li_currow += of_outdata('',li_currow,"summary",idw_requestor.rowcount())

if ii_borderbeginrow <= 0 then
	ii_borderbeginrow = ii_detailrow
end if

li_currow += of_outdata('',li_currow,"footer",idw_requestor.rowcount())

if ii_printheader <> 0 then
	li_currow = 0
	ids_objects.setfilter("band='header'")
	ids_objects.filter()
	li_currow = long(ids_objects.describe("Evaluate('Max(EndRow)',0)"))
///////////////////////////////////////////////////////////////////
	if ii_printheader = 1 then
		if li_groupcount = 1 and ll_flag = 0 then
			for li = 1 to li_groupcount
				ids_objects.setfilter("band='header." + string(li) + "'")
				ids_objects.filter()
				li_currow += long(ids_objects.describe("Evaluate('Max(EndRow)',0)"))
			next
		else
			li_currow=li_currow
		end if
	end if
//////////////////////////////////////////////////////////////////////

	if li_currow > 0 then
		invo_worksheet.of_repeat_rows(0,li_currow - 1)
		invo_worksheet.of_freeze_panes(li_currow,0,li_currow,0)
	end if

end if
///////////////////////////////////////////////////
invo_worksheet.of_set_paper(long(idw_requestor.describe("datawindow.print.paper.size")))

if idw_requestor.describe("datawindow.print.Orientation") = "1" then
	invo_worksheet.of_set_landscape()
else
	invo_worksheet.of_set_portrait()
end if

invo_worksheet.of_set_print_scale(long(idw_requestor.describe("datawindow.zoom ")))

ld_width = long(idw_requestor.describe("datawindow.print.margin.Left"))

choose case is_units
	case "0"
		ld_width = unitstopixels(ld_width,xunitstopixels!) * 0.0104
	case "1"
		ld_width = ld_width * 0.0104
	case "3"
		ld_width = (ld_width / 1000) / 2.54
end choose

invo_worksheet.of_set_margin_left(ld_width)
ld_width = long(idw_requestor.describe("datawindow.print.margin.right"))

choose case is_units
	case "0"
		ld_width = unitstopixels(ld_width,xunitstopixels!) * 0.0104
	case "1"
		ld_width = ld_width * 0.0104
	case "3"
		ld_width = (ld_width / 1000) / 2.54
end choose

invo_worksheet.of_set_margin_right(ld_width)
ld_width = long(idw_requestor.describe("datawindow.print.margin.top"))

choose case is_units
	case "0"
		ld_width = unitstopixels(ld_width,xunitstopixels!) * 0.0104
	case "1"
		ld_width = ld_width * 0.0104
	case "3"
		ld_width = (ld_width / 1000) / 2.54
end choose

invo_worksheet.of_set_margin_top(ld_width)
ld_width = long(idw_requestor.describe("datawindow.print.margin.bottom"))

choose case is_units
	case "0"
		ld_width = unitstopixels(ld_width,xunitstopixels!) * 0.0104
	case "1"
		ld_width = ld_width * 0.0104
	case "3"
		ld_width = (ld_width / 1000) / 2.54
end choose

invo_worksheet.of_set_margin_bottom(ld_width)
invo_workbook.of_close()

if isvalid(lw) then
	close(lw)
end if


if invo_workbook.of_iscancel() then
	filedelete(as_filename)
end if

if ib_show_progress then
	invo_workbook.of_show_progress(10000)
end if 


///////////////////////////////////////////////////////////////////////////Xuat hinh ra file excel
//	long li_x,li_y,ll_w,ll_h,ll
//	string ls_patch
//	ls_patch = idw_requestor.describe('p_logo.visible')
//	if ls_patch = '1' then//co control p_logo va co hien thi
//		li_x= dec(idw_requestor.object.p_logo.x)/6.75				
//		li_y= dec(idw_requestor.object.p_logo.y)/6.75				
//		if ole_excel.ConnectToNewObject("excel.application") = 0 then
//			ole_excel.WorkBooks.Open(as_filename) 
//			ole_excel.Columns("A").ColumnWidth = 9.6
//			ls_patch=idw_requestor.object.p_logo.filename
//			ole_excel.ActiveSheet.Pictures.Insert(ls_patch).select
//			ole_excel.Selection.ShapeRange.Width=53
//			ole_excel.Selection.ShapeRange.Height=53
//			//Dinh toa do hinh x,y
//			if li_x>100 then
//				ole_excel.Selection.ShapeRange.Left =  li_x   // x
//				ole_excel.Selection.ShapeRange.Top =  li_y  // y
//			else
//				ole_excel.Selection.ShapeRange.Left =  0
//				ole_excel.Selection.ShapeRange.Top =  0
//			end if
//			// Save
//			//	ole_excel.WorkBooks.close()
//			ole_excel.DisplayAlerts = false
//			ole_excel.Save()
//			// Quit
//			  ole_excel.application.quit()
//			  ole_excel.DisconnectObject()
//			  destroy ole_Excel
//		end if
//	end if
///////////////////////////////////////////////////////////////////////////////

if not invo_workbook.of_iscancel() then
	if ib_openexcel  then			
		string ls_null				
		long ll_rc
		SetNull(ls_null)
		Environment env
		GetEnvironment(env)
		if env.PBMajorRevision >= 10 then
			ll_rc = ShellExecute100(0,"open",""+as_filename+"",ls_null,ls_null,1)			
		else
			ll_rc = ShellExecute080(0,"open",""+as_filename+"",ls_null,ls_null,1)
		end if
		if ll_rc < 32 then
			MessageBox(MSG_NOTE_TITLE,MSG_FILE_OPEN_ERROR)
		end if
	else
	
		if ib_showmsg then
			messagebox(MSG_NOTE_TITLE,MSG_FILE_WRITE_SUCCESS + ":" + as_filename + "")
		end if
	
	end if
end if

//clear
istr_obj[] = istr_empty_obj[]
istr_lines[] = istr_empty_line[]
istr_rowheight[] = istr_empty_rowheight[]
istr_position[] = istr_empty_position[]

destroy(invo_workbook)
destroy(invo_worksheet)
destroy invo_format_temp
destroy invo_grid_temp
destroy invo_default_border
destroy invo_colors
destroy(ids_line)
destroy(ids_rowheight)
destroy(ids_column)
destroy(ids_objects)
destroy(ids_reportobj)
destroy(ids_bands)
if isvalid(ids_requestor) then destroy(ids_requestor)

setpointer(arrow!)
return 1

/////////////////////////////////////////////////////////////////////////////Xuat hinh ra file excel 2010
//try
//	long li_x,li_y,ll_w,ll_h,ll
//	string ls_patch
//	ls_patch = idw_requestor.describe('p_logo.visible')
//	if ls_patch = '1' then//co control p_logo va co hien thi
//		li_x= dec(idw_requestor.object.p_logo.x)/6.75				
//		li_y= dec(idw_requestor.object.p_logo.y)/6.75				
//		if ole_excel.ConnectToNewObject("excel.application") = 0 then
//			ole_excel.WorkBooks.Open(as_filename) 
//			ole_excel.Columns("A").ColumnWidth = 9.6
//			ls_patch=idw_requestor.object.p_logo.filename
//			ole_excel.ActiveSheet.Pictures.Insert(ls_patch).select
//			ole_excel.Selection.ShapeRange.Width=53
//			ole_excel.Selection.ShapeRange.Height=53
//			//Dinh toa do hinh x,y
//			if li_x>100 then
//				ole_excel.Selection.ShapeRange.Left =  li_x   // x
//				ole_excel.Selection.ShapeRange.Top =  li_y  // y
//			else
//				ole_excel.Selection.ShapeRange.Left =  0
//				ole_excel.Selection.ShapeRange.Top =  0
//			end if
//			// Save
//			ole_excel.DisplayAlerts = false
//			// chuy?n sang d?nh d?ng office 2007 ho?c hon
//				//RegistryGet("HKEY_CLASSES_ROOT\Excel.Application\CurVer","",RegString!,ls_value) // l?y version hi?n t?i c?a office
//				//Mid(ls_value, LastPos(ls_value, '.') + 1)
//				// if pos('12,13,14,15,16,17,18',ls_value)=1 then
//					// las_filename=as_filename+'x'
//					// ole_excel.Application.ActiveWorkbook.SaveAs(las_filename,xlWorkbookDefault)//51
//				// end if
//			ole_excel.Save()
//			// Quit
//			  ole_excel.application.quit()
//			  ole_excel.DisconnectObject()
//			  destroy ole_Excel
//		end if
//	end if
//catch (runtimeerror lre)
//		messagebox('Thông Báo','Không thể xuất LOGO do máy dang sử dụng Office 2010 hoặc hon ~r~n'+&
//							'Ðể xuất LOGO hãy chuyển File Excel sang chế độ COMPATIBILITY ~r~n'+&
//							'Cách chuyển: ~r~n'+&
//							'Trong giao diện Excel, chọn FILE, chọn EDIT ANYWAY, chọn OK ~r~n'+&
//							'Bây giờ hãy xuất Excel lại vào File vừa chỉnh sửa')
//end try
/////////////////////////////////////////////////////////////////////////////////
end function

on n_cst_xlshelper.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_xlshelper.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;//===============================================================
//this component is modified by dragon, 2008-12-20
//just for export performance
//===============================================================

ulong ll_localid,ll_langid

ll_langid  =GetUserDefaultLangID()

IF ll_langid = 2052 THEN
	MSG_NOTE_TITLE="提示"
	MSG_FILE_EXISTS="文件已经存在,是否继续?"
	MSG_FILE_WRITE_SUCCESS = "报表已成功导出"
	MSG_FILE_OPEN_ERROR = "无法开启Excel文件,请检查是否正确安装Microsoft Office或Open Office!"
ELSEIF ll_langid = 1028 THEN
	MSG_NOTE_TITLE="矗ボ"
	MSG_FILE_EXISTS="ゅン竒,琌膥尿?"
	MSG_FILE_WRITE_SUCCESS = "厨Θ旧"
	MSG_FILE_OPEN_ERROR = "礚猭秨币Excelゅン,叫浪琩琌タ絋杆Microsoft Office┪Open Office!"
END IF
end event

