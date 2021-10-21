﻿$PBExportHeader$n_xls_workbook.sru
forward
global type n_xls_workbook from nonvisualobject
end type
end forward

global type n_xls_workbook from nonvisualobject
event type unsignedlong ue_add_string ( string as_value )
event type unsignedlong ue_add_unicode ( blob ab_string )
event ue_cancel ( )
end type
global n_xls_workbook n_xls_workbook

type variables

public CONSTANT integer B1 = 1
public CONSTANT integer B2 = 2
public CONSTANT integer B4 = 4
public string is_filename
public long il_formatindex = 0
public long il_worksheetindex = 0
public integer ii_activesheet = 0
public integer ii_firstsheet = 0
public uint ii_biff_version = 1280
public uint ii_xf_index = 14
public n_xls_worksheet invo_worksheets[]
public n_xls_format invo_formats[]
public n_cst_hash_unicode invo_xfs
public n_xls_subroutines invo_sub
private olestorage istg_doc
private olestorage invo_olestorage
private olestream istr_book
private boolean ib_fileclosed = true
public blob ib_sheetnames[]
private string is_sheetname = "Sheet1"
public integer ii_selected = 0
private integer ii_palette[4,56]
private uint iui_codepage = 1252
protected blob iblb_data
protected ulong il_datasize = 0
protected ulong il_biffsize = 0
protected uint iui_limit = 8224
protected boolean ib_1904 = false
public n_xls_format invo_tmp_format
public n_xls_format invo_url_format
public n_xls_data invo_data
public n_xls_sst invo_sst

public boolean ib_cancel
w_xls_service_progress iw_progress
end variables

forward prototypes
protected function blob of_add_continue (blob ablb_data)
public function n_xls_format of_add_format ()
public function long of_get_xf (ref n_xls_format anvo_format)
public function n_xls_worksheet of_add_worksheet ()
public function n_xls_worksheet of_add_worksheet (blob ab_worksheetname)
public function n_xls_worksheet of_add_worksheet (string as_worksheetname)
protected function integer of_append (blob ablb_data)
protected function integer of_append (blob ablb_header,blob ablb_data)
protected function integer of_append (blob ablb_header,blob ablb_data,blob ablb_add_data)
protected function integer of_calc_sheet_offsets ()
public function integer of_close ()
public function integer of_create (string as_filename)
protected function integer of_get_externs_size ()
protected function integer of_get_names_size ()
protected function boolean of_is_number (string as_str)
protected function boolean of_is_zero_started_number (string as_str)
public function integer of_set_codepage (uint aui_codepage)
public function integer of_set_custom_color (integer ai_index,integer ai_red,integer ai_green,integer ai_blue)
public function integer of_set_palette_xl97 ()
protected function integer of_store_1904 ()
protected function integer of_store_all_fonts ()
protected function integer of_store_all_num_formats ()
protected function integer of_store_all_styles ()
protected function integer of_store_all_xfs ()
protected function integer of_store_bof (integer ai_type)
protected function integer of_store_boundsheet (blob ab_sheetname,ulong al_offset)
protected function integer of_store_codepage ()
protected function integer of_store_eof ()
protected function integer of_store_externs ()
protected function integer of_store_externsheet ()
protected function integer of_store_name_long (uint ai_index,uint ai_type,uint ai_rowmin,uint ai_rowmax,uint ai_colmin,uint ai_colmax)
protected function integer of_store_name_short (uint ai_index,integer ai_type,uint ai_rowmin,uint ai_rowmax,integer ai_colmin,integer ai_colmax)
protected function integer of_store_names ()
protected function integer of_store_num_format (blob ab_format,uint ai_index)
protected function integer of_store_ole_file ()
protected function integer of_store_palette ()
protected function integer of_store_style ()
protected function integer of_store_supbook ()
protected function integer of_store_window1 ()
protected function integer of_store_workbook ()
public function n_xls_format of_add_format (string as_fontname, integer ai_fontsize, string as_align, boolean ab_bold, string as_border)
public function long of_reg_format (ref n_xls_format anvo_format, boolean ab_new)
public function integer of_show_progress (integer ai_progress)
public function boolean of_iscancel ()
protected function integer of_store_sst (long al_offset)
end prototypes

event ue_add_string;return invo_sst.of_add_string(as_value)
end event

event ue_add_unicode;return invo_sst.of_add_string(ab_string)
end event

event ue_cancel();ib_cancel = true
setnull(iw_progress)
end event

protected function blob of_add_continue (blob ablb_data);uint lui_record = 60
blob lblb_header
blob lblb_temp
long ll_len

lblb_temp = blobmid(ablb_data,1,iui_limit)
ablb_data = blobmid(ablb_data,iui_limit + 1,len(ablb_data) - iui_limit)
blobedit(lblb_temp,3,invo_sub.of_pack(B2,iui_limit - 4))

do while len(ablb_data) > iui_limit
	lblb_header = invo_sub.of_pack(B2,lui_record) + invo_sub.of_pack(B2,iui_limit)
	lblb_temp = lblb_temp + lblb_header
	lblb_temp = lblb_temp + blobmid(ablb_data,1,iui_limit)
	ablb_data = blobmid(ablb_data,iui_limit + 1,len(ablb_data) - iui_limit)
loop

lblb_header = invo_sub.of_pack(B2,lui_record) + invo_sub.of_pack(B2,len(ablb_data))
lblb_temp = lblb_temp + lblb_header
lblb_temp = lblb_temp + ablb_data
return lblb_temp
end function

public function n_xls_format of_add_format ();n_xls_format lnvo_format

lnvo_format = create n_xls_format
return lnvo_format
end function

public function long of_get_xf (ref n_xls_format anvo_format);string ls_key
long li_ret

if anvo_format.ii_xf_index > 0 then
	return anvo_format.ii_xf_index
end if

ls_key = anvo_format.of_get_format_key()

li_ret = invo_xfs.of_get_value(blob(ls_key))
if IsNull(li_ret) then
	li_ret = 15
end if

return li_ret
end function

public function n_xls_worksheet of_add_worksheet ();return of_add_worksheet("")
end function

public function n_xls_worksheet of_add_worksheet (blob ab_worksheetname);integer li_ret = 1
integer li_i
integer li_len
string ls_name
n_xls_worksheet lnvo_cursheet
n_xls_worksheet lnvo_worksheet

ls_name = invo_sub.of_unicode2ansi(ab_worksheetname,0,"_")

do
	li_len = len(ab_worksheetname) / 2

	if li_len > 31 then
		messagebox("Error","Length of Worksheet name must be less then 31 symbols",stopsign!)
		li_ret = -1
		exit
	end if

	if match(ls_name,"[:*?/\]") then
		messagebox("Error","Invalid worksheet name",stopsign!)
		li_ret = -1
		exit
	end if

	if trim(ls_name) = "" then
		ab_worksheetname = invo_sub.of_ansi2unicode(is_sheetname + string(il_worksheetindex + 1))
		ls_name = invo_sub.of_unicode2ansi(ab_worksheetname,0,"_")
	end if

	for li_i = 1 to il_worksheetindex
		lnvo_cursheet = invo_worksheets[li_i]

		if lnvo_cursheet.ib_worksheetname = ab_worksheetname then
			messagebox("Error","Duplicate worksheet name",stopsign!)
			li_ret = -1
			exit
		end if

	next

	if li_ret <> 1 then
		exit
	end if

	lnvo_worksheet = create n_xls_worksheet
	lnvo_worksheet.invo_url_format = invo_url_format
	lnvo_worksheet.invo_workbook = this
	lnvo_worksheet.ib_worksheetname = ab_worksheetname
	lnvo_worksheet.is_worksheetname = ls_name
	il_worksheetindex ++
	lnvo_worksheet.ii_index = il_worksheetindex
	ib_sheetnames[il_worksheetindex] = lnvo_worksheet.ib_worksheetname
	invo_worksheets[il_worksheetindex] = lnvo_worksheet
loop until true

if li_ret <> 1 then

	if not isnull(lnvo_worksheet) then

		if isvalid(lnvo_worksheet) then
			destroy(lnvo_worksheet)
			setnull(lnvo_worksheet)
		end if

	end if

end if

return lnvo_worksheet
end function

public function n_xls_worksheet of_add_worksheet (string as_worksheetname);return of_add_worksheet(invo_sub.of_ansi2unicode(as_worksheetname))
end function

protected function integer of_append (blob ablb_data);integer li_ret = 1

if len(ablb_data) > iui_limit then
	ablb_data = of_add_continue(ablb_data)
end if

il_datasize += len(ablb_data)
invo_data.of_append(ablb_data,0)
return li_ret
end function

protected function integer of_append (blob ablb_header,blob ablb_data);return of_append(ablb_header + ablb_data)
end function

protected function integer of_append (blob ablb_header,blob ablb_data,blob ablb_add_data);return of_append(ablb_header + ablb_data + ablb_add_data)
end function

protected function integer of_calc_sheet_offsets ();integer li_ret = 1
integer li_boundsheetheader = 12
integer li_eof = 4
ulong ll_offset
long ll_i
n_xls_worksheet lnvo_sheet

ll_offset = il_datasize

for ll_i = 1 to il_worksheetindex
	lnvo_sheet = invo_worksheets[ll_i]
	ll_offset += (li_boundsheetheader + len(lnvo_sheet.ib_worksheetname))
next

ll_offset += of_get_externs_size()
ll_offset += of_get_names_size()
ll_offset += li_eof

for ll_i = 1 to il_worksheetindex
	lnvo_sheet = invo_worksheets[ll_i]
	lnvo_sheet.il_offset = ll_offset
	ll_offset += lnvo_sheet.il_datasize
next

il_biffsize = ll_offset
return li_ret
end function

public function integer of_close ();integer li_ret = 1

if not ib_fileclosed then
	istr_book = create olestream
	li_ret = istr_book.open(istg_doc,"Workbook",stgwrite!)
	li_ret = of_store_workbook()
	istr_book.close()
	istg_doc.close()
end if

return li_ret
end function

public function integer of_create (string as_filename);integer li_ret = 1

invo_tmp_format = create n_xls_format
of_reg_format(invo_tmp_format,false)


invo_url_format = of_add_format()
invo_url_format.of_set_color("blue")
invo_url_format.of_set_underline(1)
of_reg_format(invo_url_format,false)

if as_filename = "" or isnull(as_filename) then
	messagebox("Error","File name must be specified",stopsign!)
	li_ret = -1
end if

if li_ret = 1 then

	if not ib_fileclosed then
		messagebox("Error","Current workbook is not closed",stopsign!)
		li_ret = -1
	end if

end if

if li_ret = 1 then
	istg_doc = create olestorage
	li_ret = istg_doc.open(as_filename,stgreadwrite!,stgexclusive!)

	if li_ret < 0 then
		messagebox("Error","File sharing violation~r~n" + "Cannot open the file",stopsign!)
		destroy(istg_doc)
		li_ret = -1
	else
		ib_fileclosed = false
		li_ret = 1
	end if

end if

if li_ret = 1 then
	li_ret = of_set_palette_xl97()
end if

return li_ret
end function

protected function integer of_get_externs_size ();integer li_cnt

li_cnt = upperbound(ib_sheetnames)
return (8 + 6 + 6 * li_cnt)
end function

protected function integer of_get_names_size ();integer li_ret
long ll_i
n_xls_worksheet lnvo_sheet

for ll_i = 1 to il_worksheetindex
	lnvo_sheet = invo_worksheets[ll_i]

	if not isnull(lnvo_sheet.ii_print_rowmin) then
		li_ret = li_ret + 31
	end if

next

for ll_i = 1 to il_worksheetindex
	lnvo_sheet = invo_worksheets[ll_i]

	if not isnull(lnvo_sheet.ii_title_rowmin) and  not isnull(lnvo_sheet.ii_title_colmin) then
		li_ret = li_ret + 46
	else

		if not isnull(lnvo_sheet.ii_title_rowmin) then
			li_ret = li_ret + 31
		else

			if not isnull(lnvo_sheet.ii_title_colmin) then
				li_ret = li_ret + 31
				continue
			end if

		end if

	end if

next

return li_ret
end function

protected function boolean of_is_number (string as_str);integer li_i
integer li_cnt
string ls_ch

as_str = trim(as_str)
li_cnt = len(as_str)

if li_cnt < 1 then
	return false
end if

for li_i = 1 to li_cnt
	ls_ch = mid(as_str,li_i,1)

	choose case ls_ch
		case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
			continue
		case else
			return false
	end choose

next

return true
end function

protected function boolean of_is_zero_started_number (string as_str);integer li_i
integer li_cnt
string ls_ch

as_str = trim(as_str)

if right(as_str,1) = "0" then
	li_cnt = len(as_str)

	if li_cnt < 2 then
		return false
	end if

	for li_i = 2 to li_cnt
		ls_ch = mid(as_str,li_i,1)

		choose case ls_ch
			case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
				continue
			case else
				return false
		end choose

	next

	return true
else
	return false
end if
end function

public function integer of_set_codepage (uint aui_codepage);iui_codepage = aui_codepage
return 1
end function

public function integer of_set_custom_color (integer ai_index,integer ai_red,integer ai_green,integer ai_blue);if ai_index < 8 or ai_index > 64 then
	messagebox("Error","Color index " + string(ai_index) + " outside range: 8 <= index <= 64")
	return -1
else

	if ai_red < 0 or ai_red > 255 or ai_green < 0 or ai_green > 255 or ai_blue < 0 or ai_blue > 255 then
		messagebox("Error","Color component outside range: 0 <= color <= 255")
		return -1
	else
		ai_index = ai_index - 7
		ii_palette[1,ai_index] = ai_red
		ii_palette[2,ai_index] = ai_green
		ii_palette[3,ai_index] = ai_blue
		ii_palette[4,ai_index] = 0
		return (ai_index + 7)
	end if

end if
end function

public function integer of_set_palette_xl97 ();ii_palette[] = {0,0,0,0,255,255,255,0,255,0,0,0,0,255,0,0,0,0,255,0,255,255,0,0,255,0,255,0,0,255,255,0,128,0,0,0,0,128,0,0,0,0,128,0,128,128,0,0,128,0,128,0,0,128,128,0,192,192,192,0,128,128,128,0,153,153,255,0,153,51,102,0,255,255,204,0,204,255,255,0,102,0,102,0,255,128,128,0,0,102,204,0,204,204,255,0,0,0,128,0,255,0,255,0,255,255,0,0,0,255,255,0,128,0,128,0,128,0,0,0,0,128,128,0,0,0,255,0,0,204,255,0,204,255,255,0,204,255,204,0,255,255,153,0,153,204,255,0,255,153,204,0,204,153,255,0,255,204,153,0,51,102,255,0,51,204,204,0,153,204,0,0,255,204,0,0,255,153,0,0,255,102,0,0,102,102,153,0,150,150,150,0,0,51,102,0,51,153,102,0,0,51,0,0,51,51,0,0,153,51,0,0,153,51,102,0,51,51,153,0,51,51,51,0}
return 1
end function

protected function integer of_store_1904 ();uint li_record = 34
uint li_length = 2
integer li_ret
blob lblb_header
blob lblb_data

lblb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)

if ib_1904 then
	lblb_data = invo_sub.of_pack(B2,1)
else
	lblb_data = invo_sub.of_pack(B2,0)
end if

li_ret = of_append(lblb_header,lblb_data)
return li_ret
end function

protected function integer of_store_all_fonts ();blob lb_font
string ls_key
string ls_font_keys[]
long ll_keys_cnt
long ll_format_cnt
long ll_i
long ll_j
long ll_key
integer li_ret = 1
n_xls_format lnvo_format

lb_font = invo_tmp_format.of_get_font(invo_sub)

for ll_i = 1 to 5
	of_append(lb_font)
next

ls_key = invo_tmp_format.of_get_font_key()
ll_keys_cnt ++
ls_font_keys[ll_keys_cnt] = ls_key
ll_format_cnt = upperbound(invo_formats)

for ll_i = 1 to ll_format_cnt
	lnvo_format = invo_formats[ll_i]
	ls_key = lnvo_format.of_get_font_key()
	ll_key = 0

	for ll_j = 1 to ll_keys_cnt

		if ls_font_keys[ll_j] = ls_key then
			ll_key = ll_j
			exit
		end if

	next

	if ll_key = 0 then
		ll_keys_cnt ++
		ls_font_keys[ll_keys_cnt] = ls_key
		ll_key = ll_keys_cnt
		lb_font = lnvo_format.of_get_font(invo_sub)
		of_append(lb_font)
	end if

	if ll_key > 1 then
		ll_key += 4
	else
		ll_key = 0
	end if

	lnvo_format.ii_font_index = ll_key
next

return li_ret
end function

protected function integer of_store_all_num_formats ();integer li_ret = 1
integer li_count
blob lb_formats[]
long ll_formats_cnt
long ll_i
long ll_j
long ll_used_format
blob lb_format
integer li_format
n_xls_format lnvo_format

li_count = upperbound(invo_formats)
for ll_i = 1 to li_count
	lnvo_format = invo_formats[ll_i]
	lb_format = invo_sub.of_ansi2unicode(lnvo_format.is_num_format)
	li_format = lnvo_format.ii_num_format

	if isnull(lb_format) or len(lb_format) = 0 then
	else
		ll_used_format = 0

		for ll_j = 1 to ll_formats_cnt

			if lb_formats[ll_j] = lb_format then
				ll_used_format = ll_j
				exit
			end if

		next

		if ll_used_format > 0 then
			lnvo_format.ii_num_format = ll_used_format + 164 - 1
		else
			ll_formats_cnt ++
			lb_formats[ll_formats_cnt] = lb_format
			lnvo_format.ii_num_format = ll_formats_cnt + 164 - 1
		end if

	end if

next

for ll_i = 1 to ll_formats_cnt
	of_store_num_format(lb_formats[ll_i],ll_i + 164 - 1)
next

return li_ret
end function

protected function integer of_store_all_styles ();integer li_ret

li_ret = of_store_style()
return li_ret
end function

protected function integer of_store_all_xfs ();integer li_ret = 1
integer li_count
blob lb_xf
long ll_i
n_xls_format lnvo_format

lb_xf = invo_tmp_format.of_get_xf("style",invo_sub)

for ll_i = 1 to 15
	of_append(lb_xf)
next

li_count = upperbound(invo_formats)
for ll_i = 1 to li_count
	lnvo_format = invo_formats[ll_i]
	lb_xf = lnvo_format.of_get_xf("cell",invo_sub)
	of_append(lb_xf)
next

return li_ret
end function

protected function integer of_store_bof (integer ai_type);uint li_record = 2057
uint li_len = 16
uint li_build = 6319
uint li_year = 1997
ulong ll_history_flag = 16449
ulong ll_lowest_version = 262
blob lblb_header
blob lblb_data

lblb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_len)
lblb_data = invo_sub.of_pack(B2,ii_biff_version) + invo_sub.of_pack(B2,ai_type) + invo_sub.of_pack(B2,li_build) + invo_sub.of_pack(B2,li_year) + invo_sub.of_pack(B4,ll_history_flag) + invo_sub.of_pack(B4,ll_lowest_version)
of_append(lblb_header + lblb_data)
return 1
end function

protected function integer of_store_boundsheet (blob ab_sheetname,ulong al_offset);integer li_ret = 1
uint li_record = 133
uint li_length
uint li_grbit
uint li_cch
blob lb_header
blob lb_data

li_cch = len(ab_sheetname) / 2
li_length = 8 + li_cch * 2
lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B4,al_offset) + invo_sub.of_pack(B2,li_grbit) + invo_sub.of_pack(B1,li_cch) + invo_sub.of_pack(B1,1) + ab_sheetname
of_append(lb_header,lb_data)
return li_ret
end function

protected function integer of_store_codepage ();uint li_record = 66
uint li_length = 2
blob lblb_header
blob lblb_data
integer li_ret

lblb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lblb_data = invo_sub.of_pack(B2,1200)
li_ret = of_append(lblb_header,lblb_data)
return li_ret
end function

protected function integer of_store_eof ();integer li_ret = 1
uint li_record = 10
uint li_length
blob lb_header

lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
of_append(lb_header)
return li_ret
end function

protected function integer of_store_externs ();of_store_supbook()
of_store_externsheet()
return 1
end function

protected function integer of_store_externsheet ();integer li_ret = 1
uint li_record = 23
uint li_length
blob lb_header
blob lb_data
integer li_i
integer li_cnt

li_cnt = upperbound(ib_sheetnames)
li_length = 2 + 6 * li_cnt
lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B2,li_cnt)

for li_i = li_cnt - 1 to 0 step -1
	lb_data = lb_data + invo_sub.of_pack(B2,0) + invo_sub.of_pack(B2,li_i) + invo_sub.of_pack(B2,li_i)
next

of_append(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_name_long (uint ai_index,uint ai_type,uint ai_rowmin,uint ai_rowmax,uint ai_colmin,uint ai_colmax);integer li_ret = 1
uint li_record = 24
uint li_length = 42
uint li_grbit = 32
integer li_chkey
integer li_cch = 1
uint li_cce = 26
uint li_ixals
uint li_itab
integer li_cchcustmenu
integer li_cchdescription
integer li_cchhelptopic
integer li_cchstatustext
integer li_rgch
integer li_unknown03 = 41
uint li_unknown04 = 23
integer li_unknown05 = 59
blob lb_header
blob lb_data
uint li_ext_ref

li_ixals = ai_index + 1
li_itab = li_ixals
li_rgch = ai_type
li_ext_ref = upperbound(ib_sheetnames) - ai_index - 1
lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B2,li_grbit) + invo_sub.of_pack(B1,li_chkey) + invo_sub.of_pack(B1,li_cch) + invo_sub.of_pack(B2,li_cce) + invo_sub.of_pack(B2,ai_index) + invo_sub.of_pack(B2,li_itab) + invo_sub.of_pack(B1,li_cchcustmenu) + invo_sub.of_pack(B1,li_cchdescription) + invo_sub.of_pack(B1,li_cchhelptopic) + invo_sub.of_pack(B1,li_cchstatustext) + invo_sub.of_pack(B1,0) + invo_sub.of_pack(B1,li_rgch) + invo_sub.of_pack(B1,li_unknown03) + invo_sub.of_pack(B2,li_unknown04) + invo_sub.of_pack(B1,li_unknown05) + invo_sub.of_pack(B2,li_ext_ref) + invo_sub.of_pack(B2,0) + invo_sub.of_pack(B2,65535) + invo_sub.of_pack(B2,ai_colmin) + invo_sub.of_pack(B2,ai_colmax) + invo_sub.of_pack(B1,li_unknown05) + invo_sub.of_pack(B2,li_ext_ref) + invo_sub.of_pack(B2,ai_rowmin) + invo_sub.of_pack(B2,ai_rowmax) + invo_sub.of_pack(B2,0) + invo_sub.of_pack(B2,255) + invo_sub.of_pack(B1,16)
of_append(lb_header,lb_data)
return li_ret
end function

protected function integer of_store_name_short (uint ai_index,integer ai_type,uint ai_rowmin,uint ai_rowmax,integer ai_colmin,integer ai_colmax);integer li_ret = 1
uint li_record = 24
uint li_length = 27
uint li_grbit = 32
integer li_chkey
integer li_cch = 1
uint li_cce = 11
uint li_ixals
uint li_itab
integer li_cchcustmenu
integer li_cchdescription
integer li_cchhelptopic
integer li_cchstatustext
integer li_rgch
integer li_unknown03 = 59
uint li_unknown04
blob lb_header
blob lb_data

li_ixals = ai_index + 1
li_itab = li_ixals
li_rgch = ai_type
li_unknown04 = upperbound(ib_sheetnames) - ai_index - 1
lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B2,li_grbit) + invo_sub.of_pack(B1,li_chkey) + invo_sub.of_pack(B1,li_cch) + invo_sub.of_pack(B2,li_cce) + invo_sub.of_pack(B2,ai_index) + invo_sub.of_pack(B2,li_itab) + invo_sub.of_pack(B1,li_cchcustmenu) + invo_sub.of_pack(B1,li_cchdescription) + invo_sub.of_pack(B1,li_cchhelptopic) + invo_sub.of_pack(B1,li_cchstatustext) + invo_sub.of_pack(B1,0) + invo_sub.of_pack(B1,li_rgch) + invo_sub.of_pack(B1,li_unknown03) + invo_sub.of_pack(B2,li_unknown04) + invo_sub.of_pack(B2,ai_rowmin) + invo_sub.of_pack(B2,ai_rowmax) + invo_sub.of_pack(B2,ai_colmin) + invo_sub.of_pack(B2,ai_colmax)
of_append(lb_header,lb_data)
return li_ret
end function

protected function integer of_store_names ();integer li_ret = 1
long ll_i
n_xls_worksheet lnvo_sheet

for ll_i = 1 to il_worksheetindex
	lnvo_sheet = invo_worksheets[ll_i]

	if not isnull(lnvo_sheet.ii_print_rowmin) then
		of_store_name_short(ll_i - 1,6,lnvo_sheet.ii_print_rowmin,lnvo_sheet.ii_print_rowmax,lnvo_sheet.ii_print_colmin,lnvo_sheet.ii_print_colmax)
	end if

next

for ll_i = 1 to il_worksheetindex
	lnvo_sheet = invo_worksheets[ll_i]

	if not isnull(lnvo_sheet.ii_title_rowmin) and  not isnull(lnvo_sheet.ii_title_colmin) then
		of_store_name_long(ll_i - 1,7,lnvo_sheet.ii_title_rowmin,lnvo_sheet.ii_title_rowmax,lnvo_sheet.ii_title_colmin,lnvo_sheet.ii_title_colmax)
	else

		if not isnull(lnvo_sheet.ii_title_rowmin) then
			of_store_name_short(ll_i - 1,7,lnvo_sheet.ii_title_rowmin,lnvo_sheet.ii_title_rowmax,0,255)
		else

			if not isnull(lnvo_sheet.ii_title_colmin) then
				of_store_name_short(ll_i - 1,7,0,65535,lnvo_sheet.ii_title_colmin,lnvo_sheet.ii_title_colmax)
				continue
			end if

		end if

	end if

next

return li_ret
end function

protected function integer of_store_num_format (blob ab_format,uint ai_index);integer li_ret = 1
uint li_record = 1054
uint li_length
uint li_len_format
blob lb_header
blob lb_data
integer li_grbit = 1
integer li_cch

li_cch = len(ab_format) / 2
li_length = 5 + li_cch * 2
lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B2,ai_index) + invo_sub.of_pack(B2,li_cch) + invo_sub.of_pack(B1,li_grbit) + ab_format
of_append(lb_header,lb_data)
return li_ret
end function

protected function integer of_store_ole_file ();integer li_ret = 1
integer li_i
n_xls_worksheet lnvo_sheet

if li_ret = 1 then
	invo_data.of_write(istr_book)
end if

if li_ret = 1 then

	for li_i = 1 to il_worksheetindex
		lnvo_sheet = invo_worksheets[li_i]
		lnvo_sheet.of_write_data(istr_book)
	next

end if

return li_ret
end function

protected function integer of_store_palette ();integer li_ret = 1
uint li_record = 146
uint li_length
uint li_ccv
uint li_i
blob lb_header
blob lb_data
blob lb_data_item

li_ccv = 56
li_length = 2 + 4 * li_ccv

for li_i = 1 to li_ccv
	lb_data_item = invo_sub.of_pack(B1,ii_palette[1,li_i]) + invo_sub.of_pack(B1,ii_palette[2,li_i]) + invo_sub.of_pack(B1,ii_palette[3,li_i]) + invo_sub.of_pack(B1,ii_palette[4,li_i])

	if li_i = 1 then
		lb_data = lb_data_item
	else
		lb_data = lb_data + lb_data_item
	end if

next

lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length) + invo_sub.of_pack(B2,li_ccv)
of_append(lb_header,lb_data)
return li_ret
end function

protected function integer of_store_style ();integer li_ret
uint li_record = 659
uint li_length = 4
uint li_ixfe = 32768
integer li_builtin
integer li_ilevel = 255
blob lb_header
blob lb_data

lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B2,li_ixfe) + invo_sub.of_pack(B1,li_builtin) + invo_sub.of_pack(B1,li_ilevel)
of_append(lb_header,lb_data)
return li_ret
end function

protected function integer of_store_supbook ();uint li_record = 430
uint li_length = 4
blob lblb_header
blob lblb_data
integer li_ret

lblb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lblb_data = invo_sub.of_pack(B2,upperbound(ib_sheetnames)) + invo_sub.of_pack(B2,1025)
li_ret = of_append(lblb_header,lblb_data)
return li_ret
end function

protected function integer of_store_window1 ();integer li_ret = 1
uint li_record = 61
uint li_length = 18
uint li_xwn
uint li_ywn
uint li_dxwn = 9660
uint li_dywn = 5490
uint li_grbit = 56
uint li_wtabratio = 600
blob lblb_header
blob lblb_data

lblb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lblb_data = invo_sub.of_pack(B2,li_xwn) + invo_sub.of_pack(B2,li_ywn) + invo_sub.of_pack(B2,li_dxwn) + invo_sub.of_pack(B2,li_dywn) + invo_sub.of_pack(B2,li_grbit) + invo_sub.of_pack(B2,ii_activesheet) + invo_sub.of_pack(B2,ii_firstsheet) + invo_sub.of_pack(B2,ii_selected) + invo_sub.of_pack(B2,li_wtabratio)
of_append(lblb_header,lblb_data)
return li_ret
end function

protected function integer of_store_workbook ();long ll_i
n_xls_worksheet lnvo_sheet

if il_worksheetindex = 0 then
	of_add_worksheet()
end if

if ii_activesheet = 0 then
	lnvo_sheet = invo_worksheets[1]
	lnvo_sheet.ib_selected = true
end if

for ll_i = 1 to il_worksheetindex
	lnvo_sheet = invo_worksheets[ll_i]

	if lnvo_sheet.ib_selected then
		ii_selected ++
	end if

	lnvo_sheet.of_close()
next

of_store_bof(5)
of_store_codepage()
of_store_window1()
of_store_1904()
of_store_all_fonts()
of_store_all_num_formats()
of_store_all_xfs()
of_store_all_styles()
of_store_palette()
of_store_sst(il_datasize)

of_calc_sheet_offsets()

for ll_i = 1 to il_worksheetindex
	lnvo_sheet = invo_worksheets[ll_i]
	of_store_boundsheet(lnvo_sheet.ib_worksheetname,lnvo_sheet.il_offset)
next

of_store_externs()
of_store_names()
of_store_eof()
return of_store_ole_file()
end function

public function n_xls_format of_add_format (string as_fontname, integer ai_fontsize, string as_align, boolean ab_bold, string as_border);char lc_borders[]

n_xls_format lnvo_format

lnvo_format = create n_xls_format

IF len(as_fontname) > 0 Then lnvo_format.of_set_font(as_fontname)
IF len(as_align) > 0 THEN  lnvo_format.of_set_align(as_align)

lnvo_format.of_set_bold(ab_bold)

lnvo_format.ii_size = ai_fontsize


IF Len(as_border) = 4 AND IsNumber(as_border) THEN
	lc_borders = as_border
	lnvo_format.ii_top = Integer(lc_borders[1])
	lnvo_format.ii_bottom = Integer(lc_borders[2])
	lnvo_format.ii_left = Integer(lc_borders[3])
	lnvo_format.ii_right = Integer(lc_borders[4])	
END IF

RETURN lnvo_format
end function

public function long of_reg_format (ref n_xls_format anvo_format, boolean ab_new);string ls_key
long li_ret
blob lb_key

if anvo_format.ii_xf_index > 0 then
	li_ret = anvo_format.ii_xf_index
else
	ls_key = anvo_format.of_get_format_key()
	lb_key = blob(ls_key)
	
	li_ret = invo_xfs.of_get_value(lb_key)
	
	if isnull(li_ret) or li_ret = 0 then
		ii_xf_index ++
		il_formatindex ++
		if ab_new then
			invo_formats[il_formatindex] = create n_xls_format
			invo_formats[il_formatindex].of_copy(anvo_format)
			invo_formats[il_formatindex].ii_xf_index = ii_xf_index
		else
			invo_formats[il_formatindex] = anvo_format			
		end if
		invo_xfs.of_set_value(lb_key,ii_xf_index)
		anvo_format.ii_xf_index = ii_xf_index
		
		li_ret = ii_xf_index
	else
		anvo_format.ii_xf_index = li_ret
	end if

end if

return li_ret
end function

public function integer of_show_progress (integer ai_progress);if ai_progress > 100 then
	if isvalid(iw_progress) then
		close(iw_progress)
		setnull(iw_progress)
	end if
else
	if isvalid(iw_progress) then
	else
		openwithparm(iw_progress,this)
	end if
	iw_progress.event ue_show_progress(ai_progress)	
end if 

return 1
end function

public function boolean of_iscancel ();return ib_cancel
end function

protected function integer of_store_sst (long al_offset);integer li_ret = 1
long ll_size

ll_size = invo_sst.of_get_sst(al_offset)

invo_data.of_write(istr_book)
invo_sst.of_write(istr_book)

il_datasize += ll_size

return li_ret
end function

event constructor;ii_biff_version = 1536
invo_data = create n_xls_data
invo_sst = create n_xls_sst
invo_sub = create n_xls_subroutines
invo_xfs = create n_cst_hash_unicode
end event

on n_xls_workbook.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_xls_workbook.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;destroy(invo_sst)
destroy(invo_sub)
destroy(invo_xfs)

integer li_index
for li_index = 1 to UpperBound(invo_formats)
	destroy invo_formats[li_index]
next
destroy istr_book
destroy istg_doc
return
end event

