$PBExportHeader$n_xls_worksheetx.sru
forward
global type n_xls_worksheetx from nonvisualobject
end type
type ostr_colinfo from structure within n_xls_worksheetx
end type
type ostr_selection from structure within n_xls_worksheetx
end type
type ostr_panes from structure within n_xls_worksheetx
end type
end forward

type ostr_colinfo from structure
	uint ii_firstcol
	uint ii_lastcol
	double id_width = 8.43
	n_xls_formatx invo_format
	boolean ib_hidden = false
	boolean ib_exists
end type

type ostr_selection from structure
	uint ii_first_row
	integer ii_first_col
	uint ii_last_row
	integer ii_last_col
	boolean ib_exists
end type

type ostr_panes from structure
	double id_x
	double id_y
	uint ii_rowtop
	uint ii_colleft
	boolean ib_exists
end type

global type n_xls_worksheetx from nonvisualobject
end type
global n_xls_worksheetx n_xls_worksheetx

type variables
public CONSTANT integer B1 = 1
public CONSTANT integer B2 = 2
public CONSTANT integer B4 = 4
public string is_worksheetname
public n_xls_subroutines invo_sub
public uint ii_index = 0
public boolean ib_selected = false
public ulong il_offset = 0
public ulong il_datasize = 0
protected blob ib_data
public uint ii_print_rowmin = 0
public uint ii_print_rowmax = 0
public integer ii_print_colmin = 0
public uint ii_title_rowmin = 0
public uint ii_title_rowmax = 0
public integer ii_title_colmin = 0
public integer ii_title_colmax = 0
public integer ii_print_colmax = 0
public blob ib_worksheetname
protected ulong il_xls_rowmax = 65536
protected ulong il_xls_colmax = 256
protected ulong il_xls_strmax = 255
protected ulong il_dim_rowmin = 0
protected ulong il_dim_colmin = 0
protected ulong il_dim_rowmax = 0
protected ulong il_dim_colmax = 0
protected boolean ib_dim_changed = false
protected integer ii_active_pane = 3
protected boolean ib_frozen = false
protected uint ii_paper_size = 0
protected integer ii_orientation = 1
protected blob ib_header
protected blob ib_footer
protected uint ii_vcenter = 0
protected uint ii_hcenter = 0
protected double id_margin_head = 0.5
protected double id_margin_foot = 0.5
protected double id_margin_left = 0.75
protected double id_margin_right = 0.75
protected double id_margin_top = 1
protected double id_margin_bottom = 1
protected boolean ib_print_gridlines = true
protected boolean ib_screen_gridlines = false
protected boolean ib_print_headers = false
protected boolean ib_fit_page = false
protected uint ii_fit_width = 0
protected uint ii_fit_height = 0
protected uint ii_hbreaks[]
protected uint ii_vbreaks[]
protected boolean ib_protect = false
protected string is_password
protected double id_col_sizes[]
protected double id_row_sizes[]
protected integer ii_zoom = 100
protected integer ii_print_scale = 100
protected boolean ib_leading_zeros = false
protected uint ii_limit = 8224
protected boolean ib_col_hiddens[]
protected boolean ib_row_hiddens[]
public n_xls_formatx invo_url_format
public n_xls_formatx invo_default_format
public n_xls_formatx invo_null_format
public n_xls_workbookx invo_workbook
private ostr_colinfo istr_colinfo[]
private ostr_selection istr_selection
private ostr_panes istr_panes
public n_associated_ulong_srvx invo_key_col_sizes
public n_associated_ulong_srvx invo_key_row_sizes
public n_associated_ulong_srvx invo_key_col_formats
protected n_xls_formatx invo_col_formats[]
protected n_associated_ulong_srvx invo_key_col_hiddens
protected n_associated_ulong_srvx invo_key_row_hiddens
protected n_xls_datax invo_data
protected n_xls_datax invo_header

protected double id_default_row_height = 18

CONSTANT integer C_FORMAT_REC = 513
CONSTANT integer C_FORMAT_LEN = 6
CONSTANT integer C_FORMAT_LABEL = 516
CONSTANT integer C_STRING_REC = 253
CONSTANT integer C_STRING_LEN = 10
CONSTANT integer C_DOUBLE_REC = 515
CONSTANT integer C_DOUBLE_LEN = 14

boolean 	ib_enable_sst_hash = false
end variables

forward prototypes
public function integer of_activate ()
protected function blob of_add_continue (blob ab_data)
public function integer of_add_h_pagebreak (uint ai_hbreak)
public function integer of_add_v_pagebreak (uint ai_vbreak)
protected function integer of_append_data (blob ab_data)
protected function integer of_append_header (blob ab_data)
public function integer of_center_horizontally ()
public function integer of_center_horizontally (boolean ab_option)
public function integer of_center_vertically ()
public function integer of_center_vertically (boolean ab_option)
protected function integer of_check_dimensions (unsignedlong al_row, unsignedlong al_col)
public function integer of_close ()
protected function ulong of_encode_password (string as_password)
public function integer of_fit_to_pages (uint ai_width,uint ai_height)
public function integer of_freeze_panes (unsignedinteger ai_row, unsignedinteger ai_col, unsignedinteger ai_rowtop, unsignedinteger ai_colleft)
public function blob of_get_data ()
protected function uint of_get_excel_height (double ad_value)
protected function uint of_get_excel_width (double ad_value)
public function string of_get_name ()
public function blob of_get_name_unicode ()
public function integer of_hide_gridlines (uint ai_option)
public function integer of_insert_bitmap (readonly uint ai_row,readonly uint ai_col,readonly string as_bitmap_filename)
public function integer of_insert_bitmap (readonly uint ai_row,readonly uint ai_col,readonly string as_bitmap_filename,readonly uint ai_x,readonly uint ai_y)
public function integer of_insert_bitmap (readonly uint ai_row,readonly uint ai_col,readonly string as_bitmap_filename,readonly uint ai_x,readonly uint ai_y,readonly double ad_scale_width,readonly double ad_scale_height)
public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, blob ab_unicode_str, n_xls_formatx anvo_format)
public function integer of_merge_write (uint ai_first_row,uint ai_first_col,uint ai_last_row,uint ai_last_col,date ad_date,n_xls_formatx anvo_format)
public function integer of_merge_write (uint ai_first_row,uint ai_first_col,uint ai_last_row,uint ai_last_col,datetime adt_datetime,n_xls_formatx anvo_format)
public function integer of_merge_write (uint ai_first_row,uint ai_first_col,uint ai_last_row,uint ai_last_col,double adb_num,n_xls_formatx anvo_format)
public function integer of_merge_write (uint ai_first_row,uint ai_first_col,uint ai_last_row,uint ai_last_col,n_xls_formatx anvo_format)
public function integer of_merge_write (uint ai_first_row,uint ai_first_col,uint ai_last_row,uint ai_last_col,string as_str,n_xls_formatx anvo_format)
public function integer of_merge_write (uint ai_first_row,uint ai_first_col,uint ai_last_row,uint ai_last_col,time at_time,n_xls_formatx anvo_format)
public function integer of_position_image (uint ai_col_start,uint ai_row_start,uint ai_x1,uint ai_y1,uint ai_width,uint ai_height)
public function integer of_print_area (uint ai_first_row,uint ai_first_col,uint ai_last_row,uint ai_last_col)
public function integer of_print_row_col_headers (boolean ab_print_headers)
protected function integer of_process_bitmap (readonly string as_bitmap_filename,ref long al_width,ref long al_height,ref long al_size,ref blob ab_data)
public function integer of_protect (string as_password)
public function integer of_repeat_columns (uint ai_first_col,uint ai_last_col)
public function integer of_repeat_rows (uint ai_first_row,uint ai_last_row)
public function integer of_select ()
public function integer of_set_column (unsignedinteger ai_firstcol, unsignedinteger ai_lastcol, double ad_width, n_xls_formatx anvo_format, boolean ab_hidden)
public function integer of_set_column_format (long al_col,n_xls_formatx anvo_format)
public function integer of_set_column_hidden (long al_col,boolean ab_hidden)
public function integer of_set_column_width (long al_col,double ad_width)
public function integer of_set_column_width (long al_col,long al_width)
public function integer of_set_first_sheet ()
public function integer of_set_footer (blob ab_footer,double ad_margin_foot)
public function integer of_set_footer (string as_footer,double ad_margin_foot)
public function integer of_set_header (blob ab_header,double ad_margin_head)
public function integer of_set_header (string as_header,double ad_margin_head)
public function integer of_set_landscape ()
public function integer of_set_margin_bottom (double ad_margin)
public function integer of_set_margin_left (double ad_margin)
public function integer of_set_margin_right (double ad_margin)
public function integer of_set_margin_top (double ad_margin)
public function integer of_set_margins (double ad_margin)
public function integer of_set_margins_lr (double ad_margin)
public function integer of_set_margins_tb (double ad_margin)
public function integer of_set_paper ()
public function integer of_set_paper (uint ai_paper_size)
public function integer of_set_portrait ()
public function integer of_set_print_scale (uint ai_scale)
public function integer of_set_row (unsignedinteger ai_row, double ad_height, n_xls_formatx anvo_format, boolean ab_hidden)
public function integer of_set_row_format (long al_row,n_xls_formatx anvo_format)
public function integer of_set_row_height (long al_row, double ad_height)
public function integer of_set_row_height (long al_row, long al_height)
public function integer of_set_row_hidden (long al_row,boolean ab_hidden)
public function integer of_set_selection (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col)
public function integer of_set_selection (unsignedinteger ai_row, unsignedinteger ai_col)
public function integer of_set_zoom (uint ai_scale)
public function uint of_size_col (uint ai_col)
public function uint of_size_row (uint ai_row)
protected function integer of_sort_pagebreaks (ref uint ai_page_breaks[])
protected function integer of_store_bof (uint ai_type)
protected function integer of_store_defcol ()
protected function integer of_store_dimensions ()
protected function integer of_store_eof ()
protected function integer of_store_externsheet (string as_sheetname)
protected function integer of_store_footer ()
protected function integer of_store_gridset ()
protected function integer of_store_hbreak ()
protected function integer of_store_hcenter ()
protected function integer of_store_header ()
protected function integer of_store_margin_bottom ()
protected function integer of_store_margin_left ()
protected function integer of_store_margin_right ()
protected function integer of_store_margin_top ()
protected function integer of_store_obj_picture (readonly uint ai_col_start,readonly uint ai_x1,readonly uint ai_row_start,readonly uint ai_y1,readonly uint ai_col_end,readonly uint ai_x2,readonly uint ai_row_end,readonly uint ai_y2)
protected function integer of_store_password ()
protected function integer of_store_print_gridlines ()
protected function integer of_store_print_headers ()
protected function integer of_store_protect ()
protected function integer of_store_setup ()
protected function integer of_store_vbreak ()
protected function integer of_store_vcenter ()
protected function integer of_store_window2 ()
protected function integer of_store_wsbool ()
protected function integer of_store_zoom ()
public function integer of_thaw_panes (double ad_y, double ad_x, unsignedinteger ai_rowtop, unsignedinteger ai_colleft)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, date ad_date)
public function integer of_write (uint ai_row,uint ai_col,date ad_date,n_xls_formatx anvo_format)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, datetime adt_datetime)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, datetime adt_datetime, n_xls_formatx anvo_format)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, double adb_num)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, double adb_num, n_xls_formatx anvo_format)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, n_xls_formatx anvo_format)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, string as_str)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, string as_str, n_xls_formatx anvo_format)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, time at_time)
public function integer of_write (uint ai_row,uint ai_col,time at_time,n_xls_formatx anvo_format)
public function integer of_write_data (olestream astr_book)
protected function integer of_xf (unsignedinteger ai_row, unsignedinteger ai_col, n_xls_formatx anvo_format)
public function ulong of_bitand (ulong al_val1,ulong al_val2)
public function ulong of_bitor (ulong al_val1,ulong al_val2)
public function ulong of_bitshr (ulong al_val,integer ai_bitcount)
public function unsignedlong of_bitshl (unsignedlong al_val, integer ai_bitcount)
public function ulong of_bitxor (ulong al_val1,ulong al_val2)
public function integer of_merge_cells (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, ref blob ab_unicode_str, n_xls_formatx anvo_format)
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, ref blob ab_unicode_str)
public function integer of_set_column_width (long al_cols[], double ad_widths[])
public function integer of_set_row_height (long al_rows[], double ad_heights[])
public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col1, n_xls_formatx anvo_format, unsignedinteger ai_col2)
protected function integer of_store_colinfo (ref ostr_colinfo astr_colinfo)
protected function integer of_store_panes (ref ostr_panes astr_panes)
protected function integer of_store_selection (ref ostr_selection astr_selection)
public function integer of_set_default_rowheight (double ad_height)
public function integer of_store_default_row_height ()
public function integer of_set_sst_hash (boolean ab_switch)
end prototypes

public function integer of_activate ();integer li_ret

li_ret = of_select()

if li_ret = 1 then
	invo_workbook.ii_activesheet = ii_index
end if

return li_ret
end function

protected function blob of_add_continue (blob ab_data);uint li_record = 60
blob lb_header
blob lb_tmp
ulong ll_start_pos = 1

lb_tmp = blobmid(ab_data,1,ii_limit)
ab_data = blobmid(ab_data,ii_limit + 1,len(ab_data) - ii_limit)
blobedit(lb_tmp,3,invo_sub.of_pack(B2,ii_limit - 4))

do while len(ab_data) > ii_limit
	lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,ii_limit)
	lb_tmp = lb_tmp + lb_header
	lb_tmp = lb_tmp + blobmid(ab_data,1,ii_limit)
	ab_data = blobmid(ab_data,ii_limit + 1,len(ab_data) - ii_limit)
loop

if len(ab_data) > 0 then
	lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,len(ab_data))
	lb_tmp = lb_tmp + lb_header
	lb_tmp = lb_tmp + ab_data
end if

return lb_tmp
end function

public function integer of_add_h_pagebreak (uint ai_hbreak);ii_hbreaks[upperbound(ii_hbreaks) + 1] = ai_hbreak
return 1
end function

public function integer of_add_v_pagebreak (uint ai_vbreak);ii_vbreaks[upperbound(ii_vbreaks) + 1] = ai_vbreak
return 1
end function

protected function integer of_append_data (blob ab_data);integer li_ret = 1

if len(ab_data) > ii_limit then
	ab_data = of_add_continue(ab_data)
end if

il_datasize += len(ab_data)
invo_data.of_append(ab_data,0)
return li_ret
end function

protected function integer of_append_header (blob ab_data);integer li_ret = 1

if len(ab_data) > ii_limit then
	ab_data = of_add_continue(ab_data)
end if

il_datasize += len(ab_data)
invo_header.of_append(ab_data,0)
return li_ret
end function

public function integer of_center_horizontally ();return of_center_horizontally(true)
end function

public function integer of_center_horizontally (boolean ab_option);integer li_ret = 1

if ab_option then
	ii_hcenter = 1
else
	ii_hcenter = 0
end if

return li_ret
end function

public function integer of_center_vertically ();return of_center_vertically(true)
end function

public function integer of_center_vertically (boolean ab_option);integer li_ret = 1

if ab_option then
	ii_vcenter = 1
else
	ii_vcenter = 0
end if

return li_ret
end function

protected function integer of_check_dimensions (unsignedlong al_row, unsignedlong al_col);integer li_ret = 1

//if al_row > il_xls_rowmax then
//	return -2
//end if
//
//if al_col > il_xls_colmax then
//	return -2
//end if
//
//ib_dim_changed = true
//
//if al_row < il_dim_rowmin then
//	il_dim_rowmin = al_row
//end if
//
//if al_row > il_dim_rowmax then
//	il_dim_rowmax = al_row
//end if
//
//if al_col < il_dim_colmin then
//	il_dim_colmin = al_col
//end if
//
//if al_col > il_dim_colmax then
//	il_dim_colmax = al_col
//end if
//
return li_ret
end function

public function integer of_close ();integer li_ret = 1
uint li_i
uint li_cnt
long ll_i

of_store_bof(16)
li_cnt = upperbound(istr_colinfo)

if li_cnt > 0 then
	of_store_defcol()

	for li_i = li_cnt to 1 step -1
		of_store_colinfo(istr_colinfo[li_i])
	next

end if

of_store_print_headers()
of_store_print_gridlines()
of_store_gridset()
of_store_default_row_height()
of_store_wsbool()
of_store_hbreak()
of_store_vbreak()
of_store_setup()
of_store_protect()
of_store_password()
of_store_dimensions()
of_store_margin_bottom()
of_store_margin_top()
of_store_margin_right()
of_store_margin_left()
of_store_vcenter()
of_store_hcenter()
of_store_footer()
of_store_header()
of_store_window2()
of_store_zoom()

if istr_panes.ib_exists then
	of_store_panes(istr_panes)
end if

of_store_selection(istr_selection)
of_store_eof()
return li_ret
end function

protected function ulong of_encode_password (string as_password);ulong ll_ret
ulong ll_chars[]
uint li_count
uint li_i
ulong ll_low
ulong ll_high

li_count = len(as_password)

if li_count > 0 then

	for li_i = 1 to li_count
		ll_chars[li_i] = of_bitshl(asc(mid(as_password,li_i,1)),li_i)
		ll_low = of_bitand(ll_chars[li_i],32767)
		ll_high = of_bitshr(of_bitand(ll_chars[li_i],of_bitshl(32767,15)),15)
		ll_chars[li_i] = of_bitor(ll_low,ll_high)
	next

	ll_ret = 0

	for li_i = 1 to li_count
		ll_ret = of_bitxor(ll_ret,ll_chars[li_i])
	next

	ll_ret = of_bitxor(ll_ret,li_count)
	ll_ret = of_bitxor(ll_ret,52811)
else
	ll_ret = 0
end if

return ll_ret
end function

public function integer of_fit_to_pages (uint ai_width,uint ai_height);integer li_ret = 1

ib_fit_page = true
ii_fit_width = ai_width
ii_fit_height = ai_height
return li_ret
end function

public function integer of_freeze_panes (unsignedinteger ai_row, unsignedinteger ai_col, unsignedinteger ai_rowtop, unsignedinteger ai_colleft);integer li_ret = 1

istr_panes.ib_exists = true
istr_panes.id_y = ai_row
istr_panes.id_x = ai_col
istr_panes.ii_rowtop = ai_rowtop
istr_panes.ii_colleft = ai_colleft
ib_frozen = true
return li_ret
end function

public function blob of_get_data ();blob lb_tmp

if isnull(ib_data) then
	return ib_data
else
	lb_tmp = ib_data
	setnull(ib_data)
	return lb_tmp
end if
end function

protected function uint of_get_excel_height (double ad_value);uint li_w1
double ld_w1
double ld_w2

li_w1 = truncate(ad_value,0)
ld_w2 = ad_value - li_w1
ld_w2 = round(ld_w2 * 4,0) / 4
return ((li_w1 + ld_w2) * 20)
end function

protected function uint of_get_excel_width (double ad_value);uint li_w1
double ld_w1
double ld_w2
double ld_w

li_w1 = truncate(ad_value,0)
ld_w2 = ad_value - li_w1

if li_w1 > 0 then
	ld_w1 = li_w1 + 0.72
else
	ld_w1 = 0
end if

if li_w1 > 0 then
	ld_w = ld_w1 * 256 + ld_w2 * 256
else
	ld_w = ld_w1 * 256 + (ld_w2 * 256) * 1.8
end if

return ld_w
end function

public function string of_get_name ();return is_worksheetname
end function

public function blob of_get_name_unicode ();return ib_worksheetname
end function

public function integer of_hide_gridlines (uint ai_option);integer li_ret = 1

choose case ai_option
	case 0
		ib_print_gridlines = true
		ib_screen_gridlines = true
	case 1
		ib_print_gridlines = false
		ib_screen_gridlines = true
	case else
		ib_print_gridlines = false
		ib_screen_gridlines = false
end choose

return li_ret
end function

public function integer of_insert_bitmap (readonly uint ai_row,readonly uint ai_col,readonly string as_bitmap_filename);return of_insert_bitmap(ai_row,ai_col,as_bitmap_filename,0,0,1,1)
end function

public function integer of_insert_bitmap (readonly uint ai_row,readonly uint ai_col,readonly string as_bitmap_filename,readonly uint ai_x,readonly uint ai_y);return of_insert_bitmap(ai_row,ai_col,as_bitmap_filename,ai_x,ai_y,1,1)
end function

public function integer of_insert_bitmap (readonly uint ai_row,readonly uint ai_col,readonly string as_bitmap_filename,readonly uint ai_x,readonly uint ai_y,readonly double ad_scale_width,readonly double ad_scale_height);integer li_ret = 1
long li_width
long li_height
long li_size
blob lb_data
blob lb_header

li_ret = of_process_bitmap(as_bitmap_filename,li_width,li_height,li_size,lb_data)

if li_ret = 1 then
	li_width = li_width * ad_scale_width
	li_height = li_height * ad_scale_height
	li_ret = of_position_image(ai_col,ai_row,ai_x,ai_y,li_width,li_height)
end if

if li_ret = 1 then
	lb_header = invo_sub.of_pack(B2,127) + invo_sub.of_pack(B2,8 + li_size) + invo_sub.of_pack(B2,9) + invo_sub.of_pack(B2,1) + invo_sub.of_pack(B4,li_size)
	of_append_data(lb_header + lb_data)
end if

return li_ret
end function

public function integer of_merge_write (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col, blob ab_unicode_str, n_xls_formatx anvo_format);integer li_ret = 1
uint li_rwfirst
uint li_colfirst
uint li_rwlast
uint li_collast
uint li_i
uint li_j

li_rwfirst = ai_first_row
li_colfirst = ai_first_col
li_rwlast = ai_last_row
li_collast = ai_last_col

if li_rwfirst = li_rwlast and li_colfirst = li_collast then
	messagebox("Error","Can't merge single cell",stopsign!)
	return -1
end if

if li_rwfirst > li_rwlast then
	li_rwfirst = ai_last_row
	li_rwlast = ai_first_row
end if

if li_colfirst > li_collast then
	li_colfirst = ai_last_col
	li_collast = ai_first_col
end if

of_write(li_rwfirst,li_colfirst,ab_unicode_str,anvo_format)

for li_i = li_rwfirst to li_rwlast

	for li_j = li_colfirst to li_collast

		if li_i = li_rwfirst and li_j = li_colfirst then
		else
			of_write(li_i,li_j,anvo_format)
		end if

	next

next

of_merge_cells(li_rwfirst,li_colfirst,li_rwlast,li_collast)
return li_ret
end function

public function integer of_merge_write (uint ai_first_row,uint ai_first_col,uint ai_last_row,uint ai_last_col,date ad_date,n_xls_formatx anvo_format);double ld_val

ld_val = daysafter(1899-12-30,ad_date)
return of_merge_write(ai_first_row,ai_first_col,ai_last_row,ai_last_col,ld_val,anvo_format)
end function

public function integer of_merge_write (uint ai_first_row,uint ai_first_col,uint ai_last_row,uint ai_last_col,datetime adt_datetime,n_xls_formatx anvo_format);double ld_val
time lt_time
string ls_time
integer li_hour
integer li_minute
integer li_second

lt_time = time(adt_datetime)
ls_time = string(lt_time)
lt_time = time(ls_time)
li_hour = hour(lt_time)
li_minute = minute(lt_time)
li_second = second(lt_time)
ld_val = daysafter(1899-12-30,date(adt_datetime)) + (li_second + li_minute * 60 + li_hour * 3600) / (24 * 3600)
return of_merge_write(ai_first_row,ai_first_col,ai_last_row,ai_last_col,ld_val,anvo_format)
end function

public function integer of_merge_write (uint ai_first_row,uint ai_first_col,uint ai_last_row,uint ai_last_col,double adb_num,n_xls_formatx anvo_format);integer li_ret = 1
uint li_rwfirst
uint li_colfirst
uint li_rwlast
uint li_collast
uint li_i
uint li_j
n_xls_formatx lnvo_format

li_rwfirst = ai_first_row
li_colfirst = ai_first_col
li_rwlast = ai_last_row
li_collast = ai_last_col

if li_rwfirst = li_rwlast and li_colfirst = li_collast then
	messagebox("Error","Can't merge single cell",stopsign!)
	return -1
end if

if li_rwfirst > li_rwlast then
	li_rwfirst = ai_last_row
	li_rwlast = ai_first_row
end if

if li_colfirst > li_collast then
	li_colfirst = ai_last_col
	li_collast = ai_first_col
end if

of_write(li_rwfirst,li_colfirst,adb_num,anvo_format)

for li_i = li_rwfirst to li_rwlast

	for li_j = li_colfirst to li_collast

		if li_i = li_rwfirst and li_j = li_colfirst then
		else
			of_write(li_i,li_j,anvo_format)
		end if

	next

next

of_merge_cells(li_rwfirst,li_colfirst,li_rwlast,li_collast)
return li_ret
end function

public function integer of_merge_write (uint ai_first_row,uint ai_first_col,uint ai_last_row,uint ai_last_col,n_xls_formatx anvo_format);integer li_ret = 1
uint li_rwfirst
uint li_colfirst
uint li_rwlast
uint li_collast
uint li_i
uint li_j
n_xls_formatx lnvo_format

li_rwfirst = ai_first_row
li_colfirst = ai_first_col
li_rwlast = ai_last_row
li_collast = ai_last_col

if li_rwfirst = li_rwlast and li_colfirst = li_collast then
	messagebox("Error","Can't merge single cell",stopsign!)
	return -1
end if

if li_rwfirst > li_rwlast then
	li_rwfirst = ai_last_row
	li_rwlast = ai_first_row
end if

if li_colfirst > li_collast then
	li_colfirst = ai_last_col
	li_collast = ai_first_col
end if

of_write(li_rwfirst,li_colfirst,anvo_format)

for li_i = li_rwfirst to li_rwlast

	for li_j = li_colfirst to li_collast

		if li_i = li_rwfirst and li_j = li_colfirst then
		else
			of_write(li_i,li_j,anvo_format)
		end if

	next

next

of_merge_cells(li_rwfirst,li_colfirst,li_rwlast,li_collast)
return li_ret
end function

public function integer of_merge_write (uint ai_first_row,uint ai_first_col,uint ai_last_row,uint ai_last_col,string as_str,n_xls_formatx anvo_format);return of_merge_write(ai_first_row,ai_first_col,ai_last_row,ai_last_col,invo_sub.of_ansi2unicode(as_str),anvo_format)
end function

public function integer of_merge_write (uint ai_first_row,uint ai_first_col,uint ai_last_row,uint ai_last_col,time at_time,n_xls_formatx anvo_format);double ld_val
integer li_hour
integer li_minute
integer li_second

li_hour = hour(at_time)
li_minute = minute(at_time)
li_second = second(at_time)
ld_val = (li_second + li_minute * 60 + li_hour * 3600) / (24 * 3600)
return of_merge_write(ai_first_row,ai_first_col,ai_last_row,ai_last_col,ld_val,anvo_format)
end function

public function integer of_position_image (uint ai_col_start,uint ai_row_start,uint ai_x1,uint ai_y1,uint ai_width,uint ai_height);integer li_ret = 1
uint li_col_end
uint li_row_end
uint li_x2
uint li_y2

li_col_end = ai_col_start
li_row_end = ai_row_start

if ai_x1 >= of_size_col(ai_col_start) then
	ai_x1 = 0
end if

if ai_y1 >= of_size_row(ai_row_start) then
	ai_y1 = 0
end if

ai_width = ai_width + ai_x1 - 1
ai_height = ai_height + ai_y1 - 1

do while ai_width >= of_size_col(li_col_end)
	ai_width -= of_size_col(li_col_end)
	li_col_end ++
loop

do while ai_height >= of_size_row(li_row_end)
	ai_height -= of_size_row(li_row_end)
	li_row_end ++
loop

if of_size_col(ai_col_start) = 0 then
	return -1
end if

if of_size_col(li_col_end) = 0 then
	return -1
end if

if of_size_row(ai_row_start) = 0 then
	return -1
end if

if of_size_row(li_row_end) = 0 then
	return -1
end if

ai_x1 = (ai_x1 / of_size_col(ai_col_start)) * 1024
ai_y1 = (ai_y1 / of_size_row(ai_row_start)) * 256
li_x2 = (ai_width / of_size_col(li_col_end)) * 1024
li_y2 = (ai_height / of_size_row(li_row_end)) * 256
li_ret = of_store_obj_picture(ai_col_start,ai_x1,ai_row_start,ai_y1,li_col_end,li_x2,li_row_end,li_y2)
return li_ret
end function

public function integer of_print_area (uint ai_first_row,uint ai_first_col,uint ai_last_row,uint ai_last_col);integer li_ret = 1

ii_print_rowmin = ai_first_row
ii_print_colmin = ai_first_col
ii_print_rowmax = ai_last_row
ii_print_colmax = ai_last_col
return li_ret
end function

public function integer of_print_row_col_headers (boolean ab_print_headers);ib_print_headers = ab_print_headers
return 1
end function

protected function integer of_process_bitmap (readonly string as_bitmap_filename,ref long al_width,ref long al_height,ref long al_size,ref blob ab_data);integer li_ret = 1
integer li_file
blob lb_data_item
blob lb_data
ulong ll_size
uint li_planes
uint li_bitcount
ulong ll_compression
blob lb_header

li_file = fileopen(as_bitmap_filename,streammode!,read!,lockwrite!)

if li_file <> -1 then
	setnull(lb_data)

	do while fileread(li_file,lb_data_item) > 0

		if isnull(lb_data) then
			lb_data = lb_data_item
		else
			lb_data = lb_data + lb_data_item
		end if

	loop

	if isnull(lb_data) then
		li_ret = -1
	end if

	fileclose(li_file)
else
	li_ret = -1
	messagebox("Error","Couldn't open " + as_bitmap_filename,stopsign!)
end if

if li_ret = 1 then

	if len(lb_data) <= 54 then
		li_ret = -1
		messagebox("Error",as_bitmap_filename + " doesn't contain enough data",stopsign!)
	end if

end if

if li_ret = 1 then

	if string(blobmid(lb_data,1,2)) <> "BM" then
		li_ret = -1
		messagebox("Error",as_bitmap_filename + " doesn't appear to to be a valid bitmap image",stopsign!)
	end if

end if

if li_ret = 1 then
	ll_size = long(blobmid(lb_data,3,4))
	ll_size -= (54 - 12)
	al_width = long(blobmid(lb_data,19,4))
	al_height = long(blobmid(lb_data,23,4))

	if al_width > 65535 then
		li_ret = -1
		messagebox("Error",as_bitmap_filename + ": largest image width supported is 65535",stopsign!)
	end if

end if

if li_ret = 1 then

	if al_height > 65535 then
		li_ret = -1
		messagebox("Error",as_bitmap_filename + ": largest image height supported is 65535",stopsign!)
	end if

end if

if li_ret = 1 then
	li_planes = integer(blobmid(lb_data,27,2))
	li_bitcount = integer(blobmid(lb_data,29,2))

	if li_bitcount <> 24 then
		li_ret = -1
		messagebox("Error",as_bitmap_filename + " isn't a 24bit true color bitmap",stopsign!)
	end if

end if

if li_ret = 1 then

	if li_planes <> 1 then
		li_ret = -1
		messagebox("Error",as_bitmap_filename + ": only 1 plane supported in bitmap image",stopsign!)
	end if

end if

if li_ret = 1 then
	ll_compression = long(blobmid(lb_data,31,4))

	if ll_compression <> 0 then
		li_ret = -1
		messagebox("Error",as_bitmap_filename + ": compression not supported in bitmap image",stopsign!)
	end if

end if

if li_ret = 1 then
	lb_header = invo_sub.of_pack(B4,12) + invo_sub.of_pack(B2,al_width) + invo_sub.of_pack(B2,al_height) + invo_sub.of_pack(B2,1) + invo_sub.of_pack(B2,24)
	ab_data = lb_header + blobmid(lb_data,55,len(lb_data) - 55 + 1)
	al_size = ll_size
end if

return li_ret
end function

public function integer of_protect (string as_password);integer li_ret = 1

ib_protect = true
is_password = as_password
return li_ret
end function

public function integer of_repeat_columns (uint ai_first_col,uint ai_last_col);ii_title_colmin = ai_first_col
ii_title_colmax = ai_last_col
return 1
end function

public function integer of_repeat_rows (uint ai_first_row,uint ai_last_row);ii_title_rowmin = ai_first_row
ii_title_rowmax = ai_last_row
return 1
end function

public function integer of_select ();integer li_ret = 1

ib_selected = true
return li_ret
end function

public function integer of_set_column (unsignedinteger ai_firstcol, unsignedinteger ai_lastcol, double ad_width, n_xls_formatx anvo_format, boolean ab_hidden);integer li_ret = 1, li_index
double ld_width
uint li_i
ulong ll_key
n_xls_formatx lnvo_format

li_index = upperbound(istr_colinfo) + 1

istr_colinfo[li_index].ib_exists = true
istr_colinfo[li_index].ii_firstcol = ai_firstcol
istr_colinfo[li_index].ii_lastcol = ai_lastcol
istr_colinfo[li_index].id_width = ad_width

if not isnull(anvo_format) then

	if isvalid(anvo_format) then
		lnvo_format = create n_xls_formatx
		lnvo_format.of_copy(anvo_format)
		invo_workbook.of_reg_format(lnvo_format,false)
	else
		setnull(lnvo_format)
	end if

else
	setnull(lnvo_format)
end if

istr_colinfo[li_index].invo_format = lnvo_format
istr_colinfo[li_index].ib_hidden = ab_hidden

if ab_hidden then
	ld_width = 0
else
	ld_width = ad_width
end if

for li_i = ai_firstcol to ai_lastcol
	ll_key = invo_key_col_sizes.of_find_key(li_i)

	if ll_key < 1 then
		ll_key = invo_key_col_sizes.of_add_key(li_i)
	end if

	id_col_sizes[ll_key] = ad_width
next

if not isnull(ab_hidden) then

	for li_i = ai_firstcol to ai_lastcol
		ll_key = invo_key_col_hiddens.of_find_key(li_i)

		if ll_key < 1 then
			ll_key = invo_key_col_hiddens.of_add_key(li_i)
		end if

		ib_col_hiddens[ll_key] = ab_hidden
	next

end if

if not isnull(anvo_format) then

	if isvalid(anvo_format) then

		for li_i = ai_firstcol to ai_lastcol
			ll_key = invo_key_col_formats.of_find_key(li_i)

			if ll_key < 1 then
				ll_key = invo_key_col_formats.of_add_key(li_i)
			end if

			invo_col_formats[ll_key] = anvo_format
		next

	end if

end if

return li_ret
end function

public function integer of_set_column_format (long al_col,n_xls_formatx anvo_format);integer li_ret = 1
uint li_width
boolean lb_hidden = false
ulong ll_i

ll_i = invo_key_col_sizes.of_get_key_index(al_col)

if ll_i > 0 then
	li_width = id_col_sizes[ll_i]
else
	setnull(li_width)
end if

ll_i = invo_key_col_hiddens.of_get_key_index(al_col)

if ll_i > 0 then
	lb_hidden = ib_col_hiddens[ll_i]
else
	setnull(lb_hidden)
end if

li_ret = of_set_column(al_col,al_col,li_width,anvo_format,lb_hidden)
return li_ret
end function

public function integer of_set_column_hidden (long al_col,boolean ab_hidden);integer li_ret = 1
n_xls_formatx lnvo_format
uint li_width
ulong ll_i

ll_i = invo_key_col_formats.of_get_key_index(al_col)

if ll_i > 0 then
	lnvo_format = invo_col_formats[ll_i]
else
	setnull(lnvo_format)
end if

ll_i = invo_key_col_sizes.of_get_key_index(al_col)

if ll_i > 0 then
	li_width = id_col_sizes[ll_i]
else
	setnull(li_width)
end if

li_ret = of_set_column(al_col,al_col,li_width,lnvo_format,ab_hidden)
return li_ret
end function

public function integer of_set_column_width (long al_col,double ad_width);integer li_ret = 1
n_xls_formatx lnvo_format
boolean lb_hidden = false
ulong ll_i

ll_i = invo_key_col_formats.of_get_key_index(al_col)

if ll_i > 0 then
	lnvo_format = invo_col_formats[ll_i]
else
	setnull(lnvo_format)
end if

ll_i = invo_key_col_hiddens.of_get_key_index(al_col)

if ll_i > 0 then
	lb_hidden = ib_col_hiddens[ll_i]
else
	setnull(lb_hidden)
end if

li_ret = of_set_column(al_col,al_col,ad_width,lnvo_format,lb_hidden)
return li_ret
end function

public function integer of_set_column_width (long al_col,long al_width);integer li_ret = 1
n_xls_formatx lnvo_format
boolean lb_hidden = false
ulong ll_i

ll_i = invo_key_col_formats.of_get_key_index(al_col)

if ll_i > 0 then
	lnvo_format = invo_col_formats[ll_i]
else
	setnull(lnvo_format)
end if

ll_i = invo_key_col_hiddens.of_get_key_index(al_col)

if ll_i > 0 then
	lb_hidden = ib_col_hiddens[ll_i]
else
	setnull(lb_hidden)
end if

li_ret = of_set_column(al_col,al_col,al_width,lnvo_format,lb_hidden)
return li_ret
end function

public function integer of_set_first_sheet ();integer li_ret = 1

invo_workbook.ii_firstsheet = ii_index
return li_ret
end function

public function integer of_set_footer (blob ab_footer,double ad_margin_foot);integer li_ret = 1

if len(ab_footer) / 2 >= 255 then
	messagebox("Error","Footer string must be less than 255 characters",stopsign!)
	li_ret = -1
end if

if li_ret = 1 then
	ib_footer = ab_footer

	if isnull(ad_margin_foot) then
		id_margin_foot = 0.50
	else
		id_margin_foot = ad_margin_foot
	end if

end if

return li_ret
end function

public function integer of_set_footer (string as_footer,double ad_margin_foot);return of_set_footer(invo_sub.of_ansi2unicode(as_footer),ad_margin_foot)
end function

public function integer of_set_header (blob ab_header,double ad_margin_head);integer li_ret = 1

if len(ab_header) / 2 >= 255 then
	messagebox("Error","Header string must be less than 255 characters",stopsign!)
	li_ret = -1
end if

if li_ret = 1 then
	ib_header = ab_header

	if isnull(ad_margin_head) then
		id_margin_head = 0.50
	else
		id_margin_head = ad_margin_head
	end if

end if

return li_ret
end function

public function integer of_set_header (string as_header,double ad_margin_head);return of_set_header(invo_sub.of_ansi2unicode(as_header),ad_margin_head)
end function

public function integer of_set_landscape ();integer li_ret = 1

ii_orientation = 0
return li_ret
end function

public function integer of_set_margin_bottom (double ad_margin);id_margin_bottom = ad_margin
return 1
end function

public function integer of_set_margin_left (double ad_margin);id_margin_left = ad_margin
return 1
end function

public function integer of_set_margin_right (double ad_margin);id_margin_right = ad_margin
return 1
end function

public function integer of_set_margin_top (double ad_margin);id_margin_top = ad_margin
return 1
end function

public function integer of_set_margins (double ad_margin);of_set_margin_left(ad_margin)
of_set_margin_right(ad_margin)
of_set_margin_top(ad_margin)
of_set_margin_bottom(ad_margin)
return 1
end function

public function integer of_set_margins_lr (double ad_margin);of_set_margin_left(ad_margin)
of_set_margin_right(ad_margin)
return 1
end function

public function integer of_set_margins_tb (double ad_margin);of_set_margin_top(ad_margin)
of_set_margin_bottom(ad_margin)
return 1
end function

public function integer of_set_paper ();return of_set_paper(0)
end function

public function integer of_set_paper (uint ai_paper_size);integer li_ret = 1

ii_paper_size = ai_paper_size
return li_ret
end function

public function integer of_set_portrait ();integer li_ret = 1

ii_orientation = 1
return li_ret
end function

public function integer of_set_print_scale (uint ai_scale);integer li_ret = 1

if ai_scale < 10 or ai_scale > 400 then
	messagebox("Error","Print scale scale outside range: 10-400",stopsign!)
	li_ret = -1
end if

if li_ret = 1 then
	ib_fit_page = false
	ii_print_scale = ai_scale
end if

return li_ret
end function

public function integer of_set_row (unsignedinteger ai_row, double ad_height, n_xls_formatx anvo_format, boolean ab_hidden);integer li_ret = 1
integer li_record = 520
integer li_length = 16
integer li_colmic = 0
integer li_colmac = 0
integer li_irwmac = 0
integer li_reserved = 0
integer li_grbit = 320
integer li_ixfe = 15
integer li_miyrw = 255
ulong ll_i

if not isnull(ad_height) then
	li_miyrw = of_get_excel_height(ad_height)
end if

if isnull(ab_hidden) then
else
	if ab_hidden then
		li_grbit = li_grbit + 32
	end if
end if

invo_data.of_appendba(li_record,li_length,ai_row,li_colmic,li_colmac)
invo_data.of_appendba(li_miyrw,li_irwmac,li_reserved,li_grbit,li_ixfe)
il_datasize += 20

return li_ret
end function

public function integer of_set_row_format (long al_row,n_xls_formatx anvo_format);integer li_ret = 1
uint li_height
boolean lb_hidden = false

setnull(li_height)
setnull(lb_hidden)
li_ret = of_set_row(al_row,li_height,anvo_format,lb_hidden)
return li_ret
end function

public function integer of_set_row_height (long al_row, double ad_height);integer li_ret = 1
boolean lb_hidden = false

setnull(lb_hidden)
li_ret = of_set_row(al_row,ad_height,invo_null_format,lb_hidden)
return li_ret
end function

public function integer of_set_row_height (long al_row, long al_height);integer li_ret = 1
boolean lb_hidden = false

setnull(lb_hidden)
li_ret = of_set_row(al_row,al_height,invo_null_format,lb_hidden)
return li_ret
end function

public function integer of_set_row_hidden (long al_row,boolean ab_hidden);integer li_ret = 1
n_xls_formatx lnvo_format
uint li_height

setnull(li_height)
setnull(lnvo_format)
li_ret = of_set_row(al_row,li_height,lnvo_format,ab_hidden)
return li_ret
end function

public function integer of_set_selection (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col);integer li_ret = 1

istr_selection.ib_exists = true
istr_selection.ii_first_row = ai_first_row
istr_selection.ii_last_row = ai_last_row
istr_selection.ii_first_col = ai_first_col
istr_selection.ii_last_col = ai_last_col
return li_ret
end function

public function integer of_set_selection (unsignedinteger ai_row, unsignedinteger ai_col);integer li_ret = 1

istr_selection.ib_exists = true
istr_selection.ii_first_row = ai_row
istr_selection.ii_last_row = ai_row
istr_selection.ii_first_col = ai_col
istr_selection.ii_last_col = ai_col
return li_ret
end function

public function integer of_set_zoom (uint ai_scale);integer li_ret = 1

if ai_scale < 10 or ai_scale > 400 then
	messagebox("Error","Zoom factor outside range: 10-400",stopsign!)
	li_ret = -1
end if

if li_ret = 1 then
	ii_zoom = ai_scale
end if

return li_ret
end function

public function uint of_size_col (uint ai_col);uint li_ind

li_ind = invo_key_col_sizes.of_get_key_index(ai_col)

if li_ind > 0 then

	if id_col_sizes[li_ind] = 0 then
		return 0
	else
		return (id_col_sizes[li_ind] * 7 + 5)
	end if

else
	return 64
end if
end function

public function uint of_size_row (uint ai_row);uint li_ind

li_ind = invo_key_row_sizes.of_get_key_index(ai_row)

if li_ind > 0 then

	if id_row_sizes[li_ind] = 0 then
		return 0
	else
		return ((id_row_sizes[li_ind] * 4) / 3)
	end if

else
	return 17
end if
end function

protected function integer of_sort_pagebreaks (ref uint ai_page_breaks[]);integer li_ret = 1
n_associated_ulong_srvx invo_key_breaks
uint li_cnt
uint li_i
ulong ll_ind
uint li_new[]

invo_key_breaks = create n_associated_ulong_srvx
li_cnt = upperbound(ai_page_breaks)

for li_i = 1 to li_cnt

	if ai_page_breaks[li_i] > 0 then
		ll_ind = invo_key_breaks.of_get_key_index(ai_page_breaks[li_i])

		if ll_ind = 0 then
			invo_key_breaks.of_add_key(ai_page_breaks[li_i])
		end if

	end if

next

invo_key_breaks.of_sort_keys()
li_cnt = invo_key_breaks.of_get_keys_count()

for li_i = 1 to li_cnt
	li_new[li_i] = invo_key_breaks.of_get_key(li_i)
next

ai_page_breaks = li_new
return li_ret
end function

protected function integer of_store_bof (uint ai_type);integer li_ret = 1
uint li_record = 2057
uint li_length = 16
blob lb_header
blob lb_data
uint li_version
ulong ll_history_flag = 16449
ulong ll_lowest_version = 262
uint li_build = 6319
uint li_year = 1997

li_version = invo_workbook.ii_biff_version
lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B2,li_version) + invo_sub.of_pack(B2,ai_type) + invo_sub.of_pack(B2,li_build) + invo_sub.of_pack(B2,li_year) + invo_sub.of_pack(B4,ll_history_flag) + invo_sub.of_pack(B4,ll_lowest_version)
of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_defcol ();integer li_ret = 1
uint li_record = 85
uint li_length = 2
blob lb_header
blob lb_data
uint li_colwidth = 8

lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B2,li_colwidth)
of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_dimensions ();integer li_ret = 1
uint li_record = 512
uint li_length = 14
uint li_row_min
uint li_row_max
uint li_col_min
uint li_col_max
uint li_reserved
blob lb_header
blob lb_data

if ib_dim_changed then
	li_row_min = il_dim_rowmin
	li_row_max = il_dim_rowmax + 1
	li_col_min = il_dim_colmin
	li_col_max = il_dim_colmax + 1
else
	li_row_min = 0
	li_row_max = 0
	li_col_min = 0
	li_col_max = 256
end if

lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B4,li_row_min) + invo_sub.of_pack(B4,li_row_max) + invo_sub.of_pack(B2,li_col_min) + invo_sub.of_pack(B2,li_col_max) + invo_sub.of_pack(B2,li_reserved)
of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_eof ();integer li_ret = 1
uint li_record = 10
uint li_length
blob lb_header

lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
of_append_data(lb_header)
return li_ret
end function

protected function integer of_store_externsheet (string as_sheetname);integer li_ret = 1
uint li_record = 23
uint li_length
blob lb_header
blob lb_data
uint li_cch
uint li_rgch

if is_worksheetname = as_sheetname then
	as_sheetname = ""
	li_length = 2
	li_cch = 1
	li_rgch = 2
else
	li_length = 2 + len(as_sheetname)
	li_cch = len(as_sheetname)
	li_rgch = 3
end if

lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B1,li_cch) + invo_sub.of_pack(B1,li_rgch)

if len(as_sheetname) > 0 then
	lb_data = lb_data + blob(as_sheetname)
end if

of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_footer ();integer li_ret = 1
uint li_record = 21
uint li_length
blob lb_header
blob lb_data
uint li_cch

li_cch = len(ib_footer) / 2
li_length = 3 + li_cch * 2
lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B2,li_cch) + invo_sub.of_pack(B1,1) + ib_footer
of_append_data(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_gridset ();integer li_ret = 1
uint li_record = 130
uint li_length = 2
blob lb_header
blob lb_data
uint li_fgridset

if not ib_print_gridlines then
	li_fgridset = 1
end if

lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B2,li_fgridset)
of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_hbreak ();integer li_ret = 1
uint li_tmp[]
uint li_record = 27
uint li_length
blob lb_header
blob lb_data
uint li_cbrk
uint li_i

li_tmp = ii_hbreaks
of_sort_pagebreaks(li_tmp)
li_cbrk = upperbound(li_tmp)

if li_cbrk = 0 then
	return li_ret
end if

li_length = li_cbrk * 6 + 2
lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B2,li_cbrk)

for li_i = 1 to li_cbrk
	lb_data = lb_data + invo_sub.of_pack(B2,li_tmp[li_i]) + invo_sub.of_pack(B2,0) + invo_sub.of_pack(B2,255)
next

of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_hcenter ();integer li_ret = 1
uint li_record = 131
uint li_length = 2
blob lb_header
blob lb_data

lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B2,ii_hcenter)
of_append_data(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_header ();integer li_ret = 1
uint li_record = 20
uint li_length
blob lb_header
blob lb_data
uint li_cch

li_cch = len(ib_header) / 2
li_length = 3 + li_cch * 2
lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B2,li_cch) + invo_sub.of_pack(B1,1) + ib_header
of_append_data(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_margin_bottom ();integer li_ret = 1
uint li_record = 41
uint li_length = 8
blob lb_header
blob lb_data

lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack("d",id_margin_bottom)
of_append_data(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_margin_left ();integer li_ret = 1
uint li_record = 38
uint li_length = 8
blob lb_header
blob lb_data

lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack("d",id_margin_left)
of_append_data(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_margin_right ();integer li_ret = 1
uint li_record = 39
uint li_length = 8
blob lb_header
blob lb_data

lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack("d",id_margin_right)
of_append_data(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_margin_top ();integer li_ret = 1
uint li_record = 40
uint li_length = 8
blob lb_header
blob lb_data

lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack("d",id_margin_top)
of_append_data(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_obj_picture (readonly uint ai_col_start,readonly uint ai_x1,readonly uint ai_row_start,readonly uint ai_y1,readonly uint ai_col_end,readonly uint ai_x2,readonly uint ai_row_end,readonly uint ai_y2);integer li_ret = 1
blob lb_header

lb_header = invo_sub.of_pack(B2,93) + invo_sub.of_pack(B2,60) + invo_sub.of_pack(B4,1) + invo_sub.of_pack(B2,8) + invo_sub.of_pack(B2,1) + invo_sub.of_pack(B2,1556) + invo_sub.of_pack(B2,ai_col_start) + invo_sub.of_pack(B2,ai_x1) + invo_sub.of_pack(B2,ai_row_start) + invo_sub.of_pack(B2,ai_y1) + invo_sub.of_pack(B2,ai_col_end) + invo_sub.of_pack(B2,ai_x2) + invo_sub.of_pack(B2,ai_row_end) + invo_sub.of_pack(B2,ai_y2) + invo_sub.of_pack(B2,0) + invo_sub.of_pack(B4,0) + invo_sub.of_pack(B2,0) + invo_sub.of_pack(B1,9) + invo_sub.of_pack(B1,9) + invo_sub.of_pack(B1,0) + invo_sub.of_pack(B1,0) + invo_sub.of_pack(B1,8) + invo_sub.of_pack(B1,255) + invo_sub.of_pack(B1,1) + invo_sub.of_pack(B1,0) + invo_sub.of_pack(B2,0) + invo_sub.of_pack(B4,9) + invo_sub.of_pack(B2,0) + invo_sub.of_pack(B2,0) + invo_sub.of_pack(B2,0) + invo_sub.of_pack(B2,1) + invo_sub.of_pack(B4,0)
of_append_data(lb_header)
return li_ret
end function

protected function integer of_store_password ();integer li_ret = 1
uint li_record = 19
uint li_length = 2
blob lb_header
blob lb_data
uint li_wpassword

if not ib_protect then
	return li_ret
end if

li_wpassword = of_encode_password(is_password)
lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B2,li_wpassword)
of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_print_gridlines ();integer li_ret = 1
uint li_record = 43
uint li_length = 2
blob lb_header
blob lb_data
uint li_fprintgrid

if ib_print_gridlines then
	li_fprintgrid = 1
end if

lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B2,li_fprintgrid)
of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_print_headers ();integer li_ret = 1
uint li_record = 42
uint li_length = 2
blob lb_header
blob lb_data
uint li_fprintrwcol

if ib_print_headers then
	li_fprintrwcol = 1
end if

lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B2,li_fprintrwcol)
of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_protect ();integer li_ret = 1
uint li_record = 18
uint li_length = 2
blob lb_header
blob lb_data
uint li_flock

if not ib_protect then
	return li_ret
end if

li_flock = 1
lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B2,li_flock)
of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_setup ();integer li_ret = 1
uint li_record = 161
uint li_length = 34
blob lb_header
blob lb_data
uint li_ipagestart = 1
uint li_grbit
uint li_ires = 600
uint li_ivres = 600
uint li_icopies = 1
uint li_flefttoright
uint li_flandscape
uint li_fnopls
uint li_fnocolor
uint li_fdraft
uint li_fnotes
uint li_fnoorient
uint li_fusepage

li_flandscape = ii_orientation
li_grbit = li_flefttoright
li_grbit = li_grbit + li_flandscape * 2
li_grbit = li_grbit + li_fnopls * 4
li_grbit = li_grbit + li_fnocolor * 8
li_grbit = li_grbit + li_fdraft * 16
li_grbit = li_grbit + li_fnotes * 32
li_grbit = li_grbit + li_fnoorient * 64
li_grbit = li_grbit + li_fusepage * 128
lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B2,ii_paper_size) + invo_sub.of_pack(B2,ii_print_scale) + invo_sub.of_pack(B2,li_ipagestart) + invo_sub.of_pack(B2,ii_fit_width) + invo_sub.of_pack(B2,ii_fit_height) + invo_sub.of_pack(B2,li_grbit) + invo_sub.of_pack(B2,li_ires) + invo_sub.of_pack(B2,li_ivres) + invo_sub.of_pack("d",id_margin_head) + invo_sub.of_pack("d",id_margin_foot) + invo_sub.of_pack(B2,li_icopies)
of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_vbreak ();integer li_ret = 1
uint li_tmp[]
uint li_record = 26
uint li_length
blob lb_header
blob lb_data
uint li_cbrk
uint li_i

li_tmp = ii_vbreaks
of_sort_pagebreaks(li_tmp)
li_cbrk = upperbound(li_tmp)

if li_cbrk = 0 then
	return li_ret
end if

li_length = li_cbrk * 6 + 2
lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B2,li_cbrk)

for li_i = 1 to li_cbrk
	lb_data = lb_data + invo_sub.of_pack(B2,li_tmp[li_i]) + invo_sub.of_pack(B2,0) + invo_sub.of_pack(B2,65535)
next

of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_vcenter ();integer li_ret = 1
uint li_record = 132
uint li_length = 2
blob lb_header
blob lb_data

lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B2,ii_vcenter)
of_append_data(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_window2 ();integer li_ret = 1
uint li_record = 574
uint li_length = 18
blob lb_header
blob lb_data
uint li_grbit = 182
uint li_rwtop
uint li_colleft
integer li_fdspfmla
integer li_fdspgrid
integer li_fdsprwcol = 1
integer li_ffrozen
integer li_fdspzeros = 1
integer li_fdefaulthdr = 1
integer li_farabic
integer li_fdspguts = 1
integer li_ffrozennosplit
integer li_fselected
integer li_fpaged = 1

if ib_screen_gridlines then
	li_fdspgrid = 1
end if

if ib_frozen then
	li_ffrozen = 1
end if

if ib_selected then
	li_fselected = 1
end if

li_grbit = li_fdspfmla
li_grbit = li_grbit + li_fdspgrid * 2
li_grbit = li_grbit + li_fdsprwcol * 4
li_grbit = li_grbit + li_ffrozen * 8
li_grbit = li_grbit + li_fdspzeros * 16
li_grbit = li_grbit + li_fdefaulthdr * 32
li_grbit = li_grbit + li_farabic * 64
li_grbit = li_grbit + li_fdspguts * 128
li_grbit = li_grbit + li_ffrozennosplit * 256
li_grbit = li_grbit + li_fselected * 512
li_grbit = li_grbit + li_fpaged * 1024
lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B2,li_grbit) + invo_sub.of_pack(B2,li_rwtop) + invo_sub.of_pack(B2,li_colleft) + invo_sub.of_pack(B2,64) + invo_sub.of_pack(B2,0) + invo_sub.of_pack(B2,0) + invo_sub.of_pack(B2,0) + invo_sub.of_pack(B4,0)
of_append_data(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_wsbool ();integer li_ret = 1
uint li_record = 129
uint li_length = 2
blob lb_header
blob lb_data
uint li_grbit

if ib_fit_page then
	li_grbit = 1473
else
	li_grbit = 1217
end if

lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B2,li_grbit)
of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_zoom ();integer li_ret = 1
uint li_record = 160
uint li_length = 4
blob lb_header
blob lb_data

if ii_zoom = 100 then
	return li_ret
end if

lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B2,ii_zoom) + invo_sub.of_pack(B2,100)
of_append_data(lb_header + lb_data)
return li_ret
end function

public function integer of_thaw_panes (double ad_y, double ad_x, unsignedinteger ai_rowtop, unsignedinteger ai_colleft);integer li_ret = 1

istr_panes.ib_exists = true
istr_panes.id_y = ad_y
istr_panes.id_x = ad_x
istr_panes.ii_rowtop = ai_rowtop
istr_panes.ii_colleft = ai_colleft
ib_frozen = false
return li_ret
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col);return of_write(ai_row,ai_col,invo_null_format)
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, date ad_date);return of_write(ai_row,ai_col,ad_date,invo_default_format)
end function

public function integer of_write (uint ai_row,uint ai_col,date ad_date,n_xls_formatx anvo_format);double ld_val = 0

ld_val = daysafter(1899-12-30,ad_date)
return of_write(ai_row,ai_col,ld_val,anvo_format)
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, datetime adt_datetime);return of_write(ai_row,ai_col,adt_datetime,invo_default_format)
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, datetime adt_datetime, n_xls_formatx anvo_format);double ld_val
time lt_time
string ls_time
integer li_hour
integer li_minute
integer li_second

lt_time = time(adt_datetime)
ls_time = string(lt_time)
lt_time = time(ls_time)
li_hour = hour(lt_time)
li_minute = minute(lt_time)
li_second = second(lt_time)
ld_val = daysafter(1899-12-30,date(adt_datetime)) + (li_second + li_minute * 60 + li_hour * 3600) / (24 * 3600)

return of_write(ai_row,ai_col,ld_val,anvo_format)
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, double adb_num);return of_write(ai_row,ai_col,adb_num,invo_default_format)
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, double adb_num, n_xls_formatx anvo_format);
integer li_ret = 1
uint li_xf
long ll_pos = 1

li_xf = of_xf(ai_row,ai_col,anvo_format)

if of_check_dimensions(ai_row,ai_col) <> 1 then
	li_ret = -2
end if

if li_ret = 1 then
	IF IsNull(adb_num) Then
		invo_data.of_appendba(C_FORMAT_REC,C_FORMAT_LEN,ai_row,ai_col,li_xf)
		il_datasize += C_FORMAT_LEN + 4
	ELSE
		invo_data.of_appendba(C_DOUBLE_REC,C_DOUBLE_LEN,ai_row,ai_col,li_xf)
		invo_data.of_appendb8(adb_num)
		il_datasize += C_DOUBLE_LEN + 4
	END IF
end if

return li_ret

end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, n_xls_formatx anvo_format);integer li_ret = 1
uint li_xf

li_xf = of_xf(ai_row,ai_col,anvo_format)

if of_check_dimensions(ai_row,ai_col) <> 1 then
	li_ret = -2
end if

if li_ret = 1 then
	invo_data.of_appendba(C_FORMAT_REC,C_FORMAT_LEN,ai_row,ai_col,li_xf)
	il_datasize += C_FORMAT_LEN + 4
end if

return li_ret
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, string as_str);blob lb_unicode_str
lb_unicode_str = invo_sub.of_ansi2unicode(as_str)
return of_write(ai_row,ai_col,lb_unicode_str,invo_default_format)
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, string as_str, n_xls_formatx anvo_format);if IsNull(as_str) or as_str ='' then
	return of_write(ai_row,ai_col,anvo_format)
else
	blob lb_unicode_str
	lb_unicode_str = invo_sub.of_ansi2unicode(as_str)
	return of_write(ai_row,ai_col,lb_unicode_str,anvo_format)	
end if
	
return 1
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, time at_time);return of_write(ai_row,ai_col,at_time,invo_null_format)
end function

public function integer of_write (uint ai_row,uint ai_col,time at_time,n_xls_formatx anvo_format);double ld_val
integer li_hour
integer li_minute
integer li_second

li_hour = hour(at_time)
li_minute = minute(at_time)
li_second = second(at_time)
ld_val = (li_second + li_minute * 60 + li_hour * 3600) / (24 * 3600)
return of_write(ai_row,ai_col,ld_val,anvo_format)
end function

public function integer of_write_data (olestream astr_book);integer li_ret = 1

invo_header.of_write(astr_book)
invo_data.of_write(astr_book)
return li_ret
end function

protected function integer of_xf (unsignedinteger ai_row, unsignedinteger ai_col, n_xls_formatx anvo_format);uint li_xf = 15
ulong ll_key

if not isnull(anvo_format) then

	if isvalid(anvo_format) then
		if anvo_format.ii_xf_index > 0 then
			return anvo_format.ii_xf_index
		end if
		return invo_workbook.of_reg_format(anvo_format,false)
	end if

end if

ll_key = invo_key_col_formats.of_get_key_index(ai_col)

if ll_key > 0 then
	return invo_workbook.of_reg_format(invo_col_formats[ll_key],false)
end if

return li_xf
end function

public function ulong of_bitand (ulong al_val1,ulong al_val2);ulong ll_ret
integer li_i

for li_i = 0 to 31

	if mod(long(al_val1 / 2 ^ li_i),2) + mod(long(al_val2 / 2 ^ li_i),2) = 2 then
		ll_ret += 2 ^ li_i
	end if

next

return ll_ret
end function

public function ulong of_bitor (ulong al_val1,ulong al_val2);ulong ll_ret
integer li_i

for li_i = 0 to 31

	if mod(long(al_val1 / 2 ^ li_i),2) + mod(long(al_val2 / 2 ^ li_i),2) > 0 then
		ll_ret += 2 ^ li_i
	end if

next

return ll_ret
end function

public function ulong of_bitshr (ulong al_val,integer ai_bitcount);return (al_val / 2 ^ ai_bitcount)
end function

public function unsignedlong of_bitshl (unsignedlong al_val, integer ai_bitcount);return (al_val * 2 ^ ai_bitcount)
end function

public function ulong of_bitxor (ulong al_val1,ulong al_val2);ulong ll_ret
integer li_i

for li_i = 0 to 15

	if mod(long(al_val1 / 2 ^ li_i),2) <> mod(long(al_val2 / 2 ^ li_i),2) then
		ll_ret += 2 ^ li_i
	end if

next

return ll_ret
end function

public function integer of_merge_cells (unsignedinteger ai_first_row, unsignedinteger ai_first_col, unsignedinteger ai_last_row, unsignedinteger ai_last_col);integer li_ret = 1
uint li_record = 229
uint li_length = 10
blob lb_header
blob lb_data
uint li_clref = 1
uint li_rwfirst
uint li_colfirst
uint li_rwlast
uint li_collast

li_rwfirst = ai_first_row
li_colfirst = ai_first_col
li_rwlast = ai_last_row
li_collast = ai_last_col


if li_rwfirst = li_rwlast and li_colfirst = li_collast then
	return -1
end if

if li_rwfirst > li_rwlast then
	li_rwfirst = ai_last_row
	li_rwlast = ai_first_row
end if

if li_colfirst > li_collast then
	li_colfirst = ai_last_col
	li_collast = ai_first_col
end if

lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B2,li_clref) + invo_sub.of_pack(B2,li_rwfirst) + invo_sub.of_pack(B2,li_rwlast) + invo_sub.of_pack(B2,li_colfirst) + invo_sub.of_pack(B2,li_collast)
of_append_data(lb_header + lb_data)
return li_ret
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, ref blob ab_unicode_str, n_xls_formatx anvo_format);integer li_ret = 1
uint li_xf
ulong ll_sst_index
long ll_pos = 1

li_xf = of_xf(ai_row,ai_col,anvo_format)

if of_check_dimensions(ai_row,ai_col) <> 1 then
	li_ret = -2
end if

if li_ret = 1 then
	IF IsNull(ab_unicode_str) Then
		invo_data.of_appendba(C_FORMAT_REC,C_FORMAT_LEN,ai_row,ai_col,li_xf)
		il_datasize += C_FORMAT_LEN + 4
	ELSE
		if ib_enable_sst_hash then
			ll_sst_index = invo_workbook.event ue_add_unicode(ab_unicode_str)
			invo_data.of_appendba(C_STRING_REC,C_STRING_LEN,ai_row,ai_col,li_xf)
			invo_data.of_appendb4(ll_sst_index)
			il_datasize += C_STRING_LEN + 4
		else
			integer li_len
			li_len = len(ab_unicode_str)
			invo_data.of_appendba(C_FORMAT_LABEL, li_len + 9,ai_row,ai_col,li_xf)
			invo_data.of_appendb3(Integer(li_len/2),1)
			invo_data.of_append(ab_unicode_str,li_len)						
			il_datasize += li_len + 13
		end if
	END IF
end if

return li_ret
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col, ref blob ab_unicode_str);return of_write(ai_row,ai_col,ab_unicode_str,invo_default_format)
end function

public function integer of_set_column_width (long al_cols[], double ad_widths[]);integer li_ret = 1
integer li_index

FOR li_index = 1 TO UpperBound(al_cols)
	of_set_column_width(al_cols[li_index],ad_widths[li_index])
NEXT

return li_ret
end function

public function integer of_set_row_height (long al_rows[], double ad_heights[]);integer li_ret = 1
integer li_index

For li_index = 1 TO UpperBound(al_rows)
	of_set_row_height(al_rows[li_index], ad_heights[li_index])
NEXT

return li_ret
end function

public function integer of_write (unsignedinteger ai_row, unsignedinteger ai_col1, n_xls_formatx anvo_format, unsignedinteger ai_col2);integer li_ret = 1
uint li_xf
integer i,li_count

li_xf = of_xf(ai_row,ai_col2,anvo_format)

if of_check_dimensions(ai_row,ai_col2) <> 1 then
	li_ret = -2
end if

if li_ret = 1 then
	li_count = ai_col2 - ai_col1 + 1
	invo_data.of_appendb4(190,li_count * 2 + 6)
	invo_data.of_appendb4(ai_row,ai_col1)
	for i=1 to li_count
		invo_data.of_appendb2(li_xf)
	next
	invo_data.of_appendb2(ai_col2)
	il_datasize += li_count * 2 + 10
end if

return li_ret
end function

protected function integer of_store_colinfo (ref ostr_colinfo astr_colinfo);integer li_ret = 1
//uint li_record = 125
//uint li_length = 11
//blob lb_header
//blob lb_data
//uint li_coldx
//uint li_ixfe = 15
//uint li_grbit
//uint li_reserved
//n_xls_formatx lnvo_format
//
//li_coldx = of_get_excel_width(astr_colinfo.id_width)
//
//if astr_colinfo.ib_hidden then
//	li_grbit = 1
//end if
//
//if not isnull(astr_colinfo.invo_format) then
//
//	if isvalid(astr_colinfo.invo_format) then
//		lnvo_format = astr_colinfo.invo_format
//		li_ixfe = invo_workbook.of_get_xf(lnvo_format)
//	end if
//
//end if
//
//lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
//lb_data = invo_sub.of_pack(B2,astr_colinfo.ii_firstcol) + invo_sub.of_pack(B2,astr_colinfo.ii_lastcol) + invo_sub.of_pack(B2,li_coldx) + invo_sub.of_pack(B2,li_ixfe) + invo_sub.of_pack(B2,li_grbit) + invo_sub.of_pack(B1,li_reserved)
//of_append_header(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_panes (ref ostr_panes astr_panes);integer li_ret = 1
uint li_record = 65
uint li_length = 10
blob lb_header
blob lb_data
uint li_y
uint li_x
uint li_rwtop
uint li_colleft
uint li_pnnact

if ib_frozen then
	li_y = astr_panes.id_y
	li_x = astr_panes.id_x

	if isnull(astr_panes.ii_rowtop) then
		li_rwtop = li_y
	else
		li_rwtop = astr_panes.ii_rowtop
	end if

	if isnull(astr_panes.ii_colleft) then
		li_colleft = li_x
	else
		li_colleft = astr_panes.ii_colleft
	end if

else

	if isnull(astr_panes.ii_rowtop) then
		li_rwtop = 0
	else
		li_rwtop = astr_panes.ii_rowtop
	end if

	if isnull(astr_panes.ii_colleft) then
		li_colleft = 0
	else
		li_colleft = astr_panes.ii_colleft
	end if

	li_y = 20 * astr_panes.id_y + 255
	li_x = 113.879 * astr_panes.id_x + 390
end if

if li_x <> 0 and li_y <> 0 then
	li_pnnact = 0
end if

if li_x <> 0 and li_y = 0 then
	li_pnnact = 1
end if

if li_x = 0 and li_y <> 0 then
	li_pnnact = 2
end if

if li_x = 0 and li_y = 0 then
	li_pnnact = 3
end if

ii_active_pane = li_pnnact
lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B2,li_x) + invo_sub.of_pack(B2,li_y) + invo_sub.of_pack(B2,li_rwtop) + invo_sub.of_pack(B2,li_colleft) + invo_sub.of_pack(B2,li_pnnact)
of_append_data(lb_header + lb_data)
return li_ret
end function

protected function integer of_store_selection (ref ostr_selection astr_selection);integer li_ret = 1
uint li_record = 29
uint li_length = 15
blob lb_header
blob lb_data
uint li_pnn
uint li_irefact
uint li_cref = 1
uint li_rwact
uint li_colact
uint li_rwfirst
uint li_rwlast
uint li_colfirst
uint li_collast

li_pnn = ii_active_pane
li_rwact = astr_selection.ii_first_row
li_colact = astr_selection.ii_first_col

if astr_selection.ii_first_row > astr_selection.ii_last_row then
	li_rwfirst = astr_selection.ii_last_row
	li_rwlast = astr_selection.ii_first_row
else
	li_rwfirst = astr_selection.ii_first_row
	li_rwlast = astr_selection.ii_last_row
end if

if astr_selection.ii_first_col > astr_selection.ii_last_col then
	li_colfirst = astr_selection.ii_last_col
	li_collast = astr_selection.ii_first_col
else
	li_colfirst = astr_selection.ii_first_col
	li_collast = astr_selection.ii_last_col
end if

lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B1,li_pnn) + invo_sub.of_pack(B2,li_rwact) + invo_sub.of_pack(B2,li_colact) + invo_sub.of_pack(B2,li_irefact) + invo_sub.of_pack(B2,li_cref) + invo_sub.of_pack(B2,li_rwfirst) + invo_sub.of_pack(B2,li_rwlast) + invo_sub.of_pack(B1,li_colfirst) + invo_sub.of_pack(B1,li_collast)
of_append_data(lb_header + lb_data)
return li_ret
end function

public function integer of_set_default_rowheight (double ad_height);id_default_row_height = ad_height
return 1
end function

public function integer of_store_default_row_height ();integer li_ret = 1
uint li_record = 549
uint li_length = 4
uint li_height
blob lb_header
blob lb_data

li_height = of_get_excel_height(id_default_row_height)
lb_header = invo_sub.of_pack(B2,li_record) + invo_sub.of_pack(B2,li_length)
lb_data = invo_sub.of_pack(B2,1) + invo_sub.of_pack(B2,li_height)
of_append_data(lb_header + lb_data)
return li_ret
end function

public function integer of_set_sst_hash (boolean ab_switch);ib_enable_sst_hash = ab_switch
RETURN 1
end function

event constructor;invo_sub = create n_xls_subroutines
il_dim_rowmin = il_xls_rowmax + 1
il_dim_colmin = il_xls_colmax + 1
invo_data = create n_xls_datax
invo_header = create n_xls_datax
istr_selection.ib_exists = true
istr_selection.ii_first_row = 0
istr_selection.ii_last_row = 0
istr_selection.ii_first_col = 0
istr_selection.ii_last_col = 0
setnull(ii_title_rowmin)
setnull(ii_title_rowmax)
setnull(ii_title_colmin)
setnull(ii_title_colmax)
setnull(ii_print_rowmin)
setnull(ii_print_rowmax)
setnull(ii_print_colmin)
setnull(ii_print_colmax)
invo_key_col_sizes = create n_associated_ulong_srvx
invo_key_row_sizes = create n_associated_ulong_srvx
invo_key_col_formats = create n_associated_ulong_srvx
invo_key_col_hiddens = create n_associated_ulong_srvx
invo_key_row_hiddens = create n_associated_ulong_srvx

SetNull(invo_null_format)
end event

on n_xls_worksheetx.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_xls_worksheetx.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;destroy(invo_sub)
end event

