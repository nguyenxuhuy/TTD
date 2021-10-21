$PBExportHeader$c_w_print.srw
forward
global type c_w_print from t_w_response
end type
type st_printername from t_st within c_w_print
end type
type ddplb_printers from t_ddplb within c_w_print
end type
type st_printerstatus from t_st within c_w_print
end type
type st_printertype from t_st within c_w_print
end type
type st_printerwhere from t_st within c_w_print
end type
type st_printercomment from t_st within c_w_print
end type
type printerstatus from t_st within c_w_print
end type
type printertype from t_st within c_w_print
end type
type printerwhere from t_st within c_w_print
end type
type printercomment from t_st within c_w_print
end type
type cbx_printtofile from t_cbx within c_w_print
end type
type rb_all from t_rb within c_w_print
end type
type rb_pages from t_rb within c_w_print
end type
type rb_selection from t_rb within c_w_print
end type
type st_from from t_st within c_w_print
end type
type st_to from t_st within c_w_print
end type
type em_frompage from t_em within c_w_print
end type
type em_topage from t_em within c_w_print
end type
type st_copies from t_st within c_w_print
end type
type em_copies from t_em within c_w_print
end type
type cbx_collate from t_cbx within c_w_print
end type
type p_collate from t_p within c_w_print
end type
type cb_properties from t_cb within c_w_print
end type
type gb_printer from t_gb within c_w_print
end type
type gb_range from t_gb within c_w_print
end type
type gb_copies from t_gb within c_w_print
end type
end forward

global type c_w_print from t_w_response
integer width = 2002
integer height = 1292
st_printername st_printername
ddplb_printers ddplb_printers
st_printerstatus st_printerstatus
st_printertype st_printertype
st_printerwhere st_printerwhere
st_printercomment st_printercomment
printerstatus printerstatus
printertype printertype
printerwhere printerwhere
printercomment printercomment
cbx_printtofile cbx_printtofile
rb_all rb_all
rb_pages rb_pages
rb_selection rb_selection
st_from st_from
st_to st_to
em_frompage em_frompage
em_topage em_topage
st_copies st_copies
em_copies em_copies
cbx_collate cbx_collate
p_collate p_collate
cb_properties cb_properties
gb_printer gb_printer
gb_range gb_range
gb_copies gb_copies
end type
global c_w_print c_w_print

type prototypes
function boolean OpenPrinter(string PrinterName, ref ulong hPrinter, ref t_s_printer_defaults null) library "winspool.drv" alias for "OpenPrinterW"  
function boolean ClosePrinter(ulong hPrinter) library "winspool.drv"  
function boolean GetPrinter(ulong hPrinter, ulong level, ref blob Printer, ulong cbbuf, ref ulong cbNeeded) library "winspool.drv" alias for "GetPrinterW"  
function boolean SetPrinter(ulong hPrinter, ulong level, ref blob Printer, ulong command) library "winspool.drv" alias for "SetPrinterW"  
function boolean PrinterProperties(ulong hwnd, ulong hprinter) library "winspool.drv"  
function ulong   CopyMem(ref t_s_printer_info_2 dest, ref blob source, ulong length) library "kernel32" alias for "RtlMoveMemory"  

end prototypes

type variables
protected:
long	il_minpage = 1
long	il_maxpage = 65535
t_s_printdlg istr_printdlg

Private:

// Printer status constants
Constant ulong PRINTER_STATUS_PAUSED = 1
Constant ulong PRINTER_STATUS_ERROR = 2
Constant ulong PRINTER_STATUS_PENDING_DELETION = 4
Constant ulong PRINTER_STATUS_PAPER_JAM = 8
Constant ulong PRINTER_STATUS_PAPER_OUT = 16
Constant ulong PRINTER_STATUS_MANUAL_FEED = 32
Constant ulong PRINTER_STATUS_PAPER_PROBLEM = 64
Constant ulong PRINTER_STATUS_OFFLINE = 128
Constant ulong PRINTER_STATUS_IO_ACTIVE = 256
Constant ulong PRINTER_STATUS_BUSY = 512
Constant ulong PRINTER_STATUS_PRINTING = 1024
Constant ulong PRINTER_STATUS_OUTPUT_BIN_FULL = 2048
Constant ulong PRINTER_STATUS_NOT_AVAILABLE = 4096
Constant ulong PRINTER_STATUS_WAITING = 8192
Constant ulong PRINTER_STATUS_PROCESSING = 16384
Constant ulong PRINTER_STATUS_INITIALIZING = 32768
Constant ulong PRINTER_STATUS_WARMING_UP = 65536
Constant ulong PRINTER_STATUS_TONER_LOW = 131072
Constant ulong PRINTER_STATUS_NO_TONER = 262144
Constant ulong PRINTER_STATUS_PAGE_PUNT = 524288
Constant ulong PRINTER_STATUS_USER_INTERVENTION = 1048576
Constant ulong PRINTER_STATUS_OUT_OF_MEMORY = 2097152
Constant ulong PRINTER_STATUS_DOOR_OPEN = 4194304
Constant ulong PRINTER_STATUS_SERVER_UNKNOWN = 8388608
Constant ulong PRINTER_STATUS_POWER_SAVE = 16777216

end variables

forward prototypes
public function integer f_loadprinters ()
public function string f_getprinterstatustext (long al_printerstatus)
end prototypes

public function integer f_loadprinters ();String	ls_printers[],ls_temp[]
String	ls_printers_list, ls_printer, ls_default_printer
Integer	li_i, li_count, li_default_printer, li_pos
c_obj_service lobj_srv

// Reset list box
ddplb_printers.Reset()

// Get printers list
ls_printers_list = PrintGetPrinters()

// Parse the printers in a temporary array
li_count = lobj_srv.f_StringToArray(ls_printers_list,"~n",ls_printers)

// Loop on printers
For li_i=1 To li_count
	// Parse printer information in a temporary array
	lobj_srv.f_StringToArray(ls_printers[li_i],"~t",ls_temp)
	ls_printer = ls_temp[1]
	
	If Pos(ls_printer,"\\") = 0 Then
		ddplb_printers.AddItem(ls_printer,1)
	Else
		ddplb_printers.AddItem(ls_printer,2)
	End If
Next

// Get default printer name
ls_default_printer = PrintGetPrinter()
ls_default_printer = Left(ls_default_printer,Pos(ls_default_printer,"~t")-1)

// Find default printer in the printers list
li_default_printer = 1
If Not IsNull(ls_default_printer) and Len(ls_default_printer) > 0 Then
	li_pos = 0
	Do While True
		li_default_printer = ddplb_printers.FindItem(ls_default_printer,li_pos)
		If li_default_printer <= 0 or ddplb_printers.Text(li_default_printer) = ls_default_printer Then Exit
		li_pos ++
	Loop
	
	// Check if default printer was found
	If li_default_printer <= 0 Then li_default_printer = 1
End If

// Select the first printer
ddplb_printers.SelectItem(li_default_printer)
ddplb_printers.Event SelectionChanged(li_default_printer)


Return 1
end function

public function string f_getprinterstatustext (long al_printerstatus);c_ds_lang	lds_lang
string ls_null

If IsNull(al_printerstatus) Then Return ""

SetNull(ls_null)
lds_lang = create c_ds_lang

Choose Case al_printerstatus
	Case 0
//		Return lds_lang.f_get_lang_text("printer_status_ready", ls_null)	
		Return 'Ready'
	Case PRINTER_STATUS_PAUSED
//		Return lds_lang.f_get_lang_text("printer_status_paused", ls_null)	
		Return 'Paused'
	Case PRINTER_STATUS_ERROR
//		Return lds_lang.f_get_lang_text("printer_status_error", ls_null)	
		Return 'Error'
	Case PRINTER_STATUS_PENDING_DELETION
//		Return lds_lang.f_get_lang_text("printer_status_pending_deletion", ls_null)	
		Return 'Printer is being deleted'
	Case PRINTER_STATUS_PAPER_JAM
//		Return lds_lang.f_get_lang_text("printer_status_paper_jam", ls_null)	
		Return 'Paper jam'
	Case PRINTER_STATUS_PAPER_OUT
//		Return lds_lang.f_get_lang_text("printer_status_paper_out", ls_null)	
		Return 'Out of paper'
	Case PRINTER_STATUS_MANUAL_FEED
//		Return lds_lang.f_get_lang_text("printer_status_manual_feed", ls_null)	
		Return 'Manual feed'
	Case PRINTER_STATUS_PAPER_PROBLEM
//		Return lds_lang.f_get_lang_text("printer_status_paper_problem", ls_null)	
		Return 'Paper error'
	Case PRINTER_STATUS_OFFLINE
//		Return lds_lang.f_get_lang_text("printer_status_offline", ls_null)	
		Return 'Offline'
	Case PRINTER_STATUS_IO_ACTIVE
//		Return lds_lang.f_get_lang_text("printer_status_io_active", ls_null)	
		Return 'Receiving data'
	Case PRINTER_STATUS_BUSY
//		Return lds_lang.f_get_lang_text("printer_status_busy", ls_null)
		Return 'Busy'
	Case PRINTER_STATUS_PRINTING
//		Return lds_lang.f_get_lang_text("printer_status_printing", ls_null)	
		Return 'Printing'
	Case PRINTER_STATUS_OUTPUT_BIN_FULL
//		Return lds_lang.f_get_lang_text("printer_status_bin_full", ls_null)	
		Return 'Output bin full'
	Case PRINTER_STATUS_NOT_AVAILABLE
//		Return lds_lang.f_get_lang_text("printer_status_not_available", ls_null)	
		Return 'Not available'
	Case PRINTER_STATUS_WAITING
//		Return lds_lang.f_get_lang_text("printer_status_waiting", ls_null)	
		Return 'Waiting'
	Case PRINTER_STATUS_PROCESSING
//		Return lds_lang.f_get_lang_text("printer_status_processing", ls_null)	
		Return 'Processing'
	Case PRINTER_STATUS_INITIALIZING
//		Return lds_lang.f_get_lang_text("printer_status_initializing", ls_null)
		Return 'Initializing'
	Case PRINTER_STATUS_WARMING_UP
//		Return lds_lang.f_get_lang_text("printer_status_warming_up", ls_null)	
		Return 'Warming up'
	Case PRINTER_STATUS_TONER_LOW
//		Return lds_lang.f_get_lang_text("printer_status_toner_low", ls_null)	
		Return 'Toner low'
	Case PRINTER_STATUS_NO_TONER
//		Return lds_lang.f_get_lang_text("printer_status_no_toner", ls_null)	
		Return 'No more toner'
	Case PRINTER_STATUS_PAGE_PUNT
//		Return lds_lang.f_get_lang_text("printer_status_page_punt", ls_null)	
		Return 'Cannot print current page'
	Case PRINTER_STATUS_USER_INTERVENTION
//		Return lds_lang.f_get_lang_text("printer_status_user_intervention", ls_null)	
		Return 'User intervention requested'
	Case PRINTER_STATUS_OUT_OF_MEMORY
//		Return lds_lang.f_get_lang_text("printer_status_out_of_memory", ls_null)	
		Return 'Out of memory'
	Case PRINTER_STATUS_DOOR_OPEN
//		Return lds_lang.f_get_lang_text("printer_status_door_open", ls_null)	
		Return 'Door open'
	Case PRINTER_STATUS_SERVER_UNKNOWN
//		Return lds_lang.f_get_lang_text("printer_status_server_unknown", ls_null)	
		Return 'Unknown state'
	Case PRINTER_STATUS_POWER_SAVE
//		Return lds_lang.f_get_lang_text("printer_status_power_save", ls_null)	
		Return 'Standby'
	Case Else
		Return ""
End Choose

end function

on c_w_print.create
int iCurrent
call super::create
this.st_printername=create st_printername
this.ddplb_printers=create ddplb_printers
this.st_printerstatus=create st_printerstatus
this.st_printertype=create st_printertype
this.st_printerwhere=create st_printerwhere
this.st_printercomment=create st_printercomment
this.printerstatus=create printerstatus
this.printertype=create printertype
this.printerwhere=create printerwhere
this.printercomment=create printercomment
this.cbx_printtofile=create cbx_printtofile
this.rb_all=create rb_all
this.rb_pages=create rb_pages
this.rb_selection=create rb_selection
this.st_from=create st_from
this.st_to=create st_to
this.em_frompage=create em_frompage
this.em_topage=create em_topage
this.st_copies=create st_copies
this.em_copies=create em_copies
this.cbx_collate=create cbx_collate
this.p_collate=create p_collate
this.cb_properties=create cb_properties
this.gb_printer=create gb_printer
this.gb_range=create gb_range
this.gb_copies=create gb_copies
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_printername
this.Control[iCurrent+2]=this.ddplb_printers
this.Control[iCurrent+3]=this.st_printerstatus
this.Control[iCurrent+4]=this.st_printertype
this.Control[iCurrent+5]=this.st_printerwhere
this.Control[iCurrent+6]=this.st_printercomment
this.Control[iCurrent+7]=this.printerstatus
this.Control[iCurrent+8]=this.printertype
this.Control[iCurrent+9]=this.printerwhere
this.Control[iCurrent+10]=this.printercomment
this.Control[iCurrent+11]=this.cbx_printtofile
this.Control[iCurrent+12]=this.rb_all
this.Control[iCurrent+13]=this.rb_pages
this.Control[iCurrent+14]=this.rb_selection
this.Control[iCurrent+15]=this.st_from
this.Control[iCurrent+16]=this.st_to
this.Control[iCurrent+17]=this.em_frompage
this.Control[iCurrent+18]=this.em_topage
this.Control[iCurrent+19]=this.st_copies
this.Control[iCurrent+20]=this.em_copies
this.Control[iCurrent+21]=this.cbx_collate
this.Control[iCurrent+22]=this.p_collate
this.Control[iCurrent+23]=this.cb_properties
this.Control[iCurrent+24]=this.gb_printer
this.Control[iCurrent+25]=this.gb_range
this.Control[iCurrent+26]=this.gb_copies
end on

on c_w_print.destroy
call super::destroy
destroy(this.st_printername)
destroy(this.ddplb_printers)
destroy(this.st_printerstatus)
destroy(this.st_printertype)
destroy(this.st_printerwhere)
destroy(this.st_printercomment)
destroy(this.printerstatus)
destroy(this.printertype)
destroy(this.printerwhere)
destroy(this.printercomment)
destroy(this.cbx_printtofile)
destroy(this.rb_all)
destroy(this.rb_pages)
destroy(this.rb_selection)
destroy(this.st_from)
destroy(this.st_to)
destroy(this.em_frompage)
destroy(this.em_topage)
destroy(this.st_copies)
destroy(this.em_copies)
destroy(this.cbx_collate)
destroy(this.p_collate)
destroy(this.cb_properties)
destroy(this.gb_printer)
destroy(this.gb_range)
destroy(this.gb_copies)
end on

event open;call super::open;If IsNull(message.powerobjectparm) or Not IsValid(message.powerobjectparm) Then Return

istr_printdlg = message.powerobjectparm

// Check appropriate page range selection
rb_all.checked = istr_printdlg.b_allpages
rb_pages.checked = istr_printdlg.b_pagenums
rb_selection.checked = istr_printdlg.b_selection

// Disable page numbers option if requested
if istr_printdlg.b_disablepagenums then
	rb_pages.enabled = false
	em_frompage.enabled = false
	em_topage.enabled = false
end if

// Disable page selection if requested
rb_selection.enabled = not istr_printdlg.b_disableselection

// Collate
cbx_collate.checked = istr_printdlg.b_collate
if cbx_collate.checked then
	p_collate.picturename = "pics\collat2.bmp"
end if

// Copies
if istr_printdlg.l_copies < 1 then
	istr_printdlg.l_copies = 1
end if
em_copies.text = String (istr_printdlg.l_copies)

// Print to file
cbx_printtofile.checked = istr_printdlg.b_printtofile
cbx_printtofile.enabled = not istr_printdlg.b_disableprinttofile
cbx_printtofile.visible = not istr_printdlg.b_hideprinttofile

// Page range
em_frompage.text = String (istr_printdlg.l_frompage)
em_topage.text = String (istr_printdlg.l_topage)

// Calculate min and max page
il_minpage = istr_printdlg.l_minpage
if il_minpage < 1 then
	il_minpage = 1
end if
il_maxpage = istr_printdlg.l_maxpage
if il_maxpage > 65535 then
	il_maxpage = 65535
end if

if rb_pages.enabled then
	em_frompage.text = String (istr_printdlg.l_frompage)
end if

// Use the b_disablepagenums element to determine whether an action was taken for the dialog
SetNull (istr_printdlg.b_disablepagenums)

// Load printers
f_LoadPrinters()
end event

event closequery;call super::closequery;if IsNull (istr_printdlg.b_disablepagenums) then
	istr_printdlg.b_disablepagenums = false
end if

Message.Powerobjectparm = istr_printdlg
end event

type cb_cancel from t_w_response`cb_cancel within c_w_print
string accessibledescription = "prtcancel"
integer x = 1609
integer y = 1088
integer width = 343
integer height = 92
integer taborder = 7
integer textsize = -8
string facename = "MS Sans Serif"
boolean cancel = true
end type

event cb_cancel::clicked;call super::clicked;//istr_printdlg.b_disablepagenums = false

CloseWithReturn (parent, istr_printdlg)
end event

type cb_ok from t_w_response`cb_ok within c_w_print
string accessibledescription = "prtok"
integer x = 1262
integer y = 1088
integer width = 343
integer height = 92
integer taborder = 6
integer textsize = -8
string facename = "MS Sans Serif"
boolean default = true
end type

event cb_ok::clicked;call super::clicked;integer	li_copies
long	ll_frompage
long	ll_topage

ll_frompage = Long (em_frompage.text)
ll_topage = Long (em_topage.text)

// Validate page range
if rb_pages.enabled and rb_pages.checked then
	if ll_frompage < il_minpage or ll_frompage > il_maxpage then
//		gf_MessageBox ("msg_InvalidPaperRange")
		em_frompage.SetFocus()
		return
	end if

	if ll_topage < il_minpage or ll_topage > il_maxpage then
//		gf_MessageBox ("msg_InvalidPaperRange")
		em_topage.SetFocus()
		return
	end if
	
	if ll_frompage > ll_topage then
//		gf_MessageBox ("msg_InvalidPage")
		em_frompage.SetFocus()
		return
	end if
end if

// Validate number of copies
li_copies = Integer (em_copies.text)
if li_copies <= 0 then
//	gf_MessageBox ("msg_InvalidCopies")
	em_copies.SetFocus()
	return
end if

// Populate printdlg structure with values that the user selected from the print dialog
istr_printdlg.b_allpages = rb_all.checked
istr_printdlg.b_pagenums = rb_pages.checked
istr_printdlg.b_selection = rb_selection.checked
istr_printdlg.b_collate = cbx_collate.checked
istr_printdlg.l_copies = li_copies
istr_printdlg.b_printtofile = cbx_printtofile.checked
istr_printdlg.l_frompage = ll_frompage
istr_printdlg.l_topage = ll_topage

// Update the b_disablepagenums element which will be
// used to indicate that the default action was taken
istr_printdlg.b_disablepagenums = true

CloseWithReturn (parent, istr_printdlg)
end event

type st_printername from t_st within c_w_print
string accessibledescription = "prtname"
integer x = 110
integer y = 128
integer width = 233
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "Name"
end type

type ddplb_printers from t_ddplb within c_w_print
integer x = 357
integer y = 116
integer width = 1518
integer height = 416
integer taborder = 1
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
boolean vscrollbar = true
string picturename[] = {"pics\printloc.bmp","pics\printnet.bmp"}
end type

event getfocus;//
end event

event selectionchanged;call super::selectionchanged;t_s_Printer_info_2	lstr_info  
t_s_Printer_defaults lstr_default  
string	ls_DriverName, ls_PortName, ls_printer
ulong	ll_handle, ll_cbNeeded = 0  
blob   lbl_buffer  
constant integer PRINTER_INFO_2_LEN = 84  

If index <= 0 or index > this.TotalItems() Then Return -1

ls_printer = this.Text
If IsNull(ls_printer) or Len(ls_printer) = 0 Then Return -1

If Not OpenPrinter (ls_printer, ll_handle, ref lstr_default) Then Return -1

lbl_buffer = Blob(Space(ll_cbNeeded)) 
GetPrinter(ll_handle, 2, ref lbl_buffer, ll_cbNeeded, ll_cbNeeded)
If ll_cbNeeded = 0 Then Return -1
lbl_buffer = Blob(Space(ll_cbNeeded)) 
If Not GetPrinter(ll_handle, 2, ref lbl_buffer, ll_cbNeeded, ll_cbNeeded) Then Return -1
CopyMem(lstr_info, lbl_buffer, PRINTER_INFO_2_LEN)  

printerstatus.Text = f_GetPrinterStatusText(lstr_info.status)
printertype.Text = String(lstr_info.drivername,"address")
printerwhere.Text = String(lstr_info.location,"address")
printercomment.Text = String(lstr_info.comment,"address")

Closeprinter(ll_handle)  

if printsetprinter(ls_printer)  <> 1 then 
//	gf_messagebox('msg_LoiMayIn')
end if
end event

type st_printerstatus from t_st within c_w_print
string accessibledescription = "prtstatus"
integer x = 110
integer y = 240
integer width = 270
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Status:"
end type

type st_printertype from t_st within c_w_print
string accessibledescription = "prttype"
integer x = 110
integer y = 320
integer width = 270
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Type:"
end type

type st_printerwhere from t_st within c_w_print
string accessibledescription = "prtwhere"
integer x = 110
integer y = 400
integer width = 270
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Where:"
end type

type st_printercomment from t_st within c_w_print
string accessibledescription = "prtcomment"
integer x = 110
integer y = 480
integer width = 270
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Comment:"
end type

type printerstatus from t_st within c_w_print
integer x = 393
integer y = 240
integer width = 823
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
boolean enabled = false
string text = ""
end type

type printertype from t_st within c_w_print
integer x = 393
integer y = 320
integer width = 1481
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
boolean enabled = false
string text = ""
end type

type printerwhere from t_st within c_w_print
integer x = 393
integer y = 400
integer width = 1481
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
boolean enabled = false
string text = ""
end type

type printercomment from t_st within c_w_print
integer x = 393
integer y = 480
integer width = 1481
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
boolean enabled = false
string text = ""
end type

type cbx_printtofile from t_cbx within c_w_print
string accessibledescription = "prttofile"
integer x = 1221
integer y = 240
integer width = 640
integer height = 64
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "Print to file"
boolean lefttext = true
boolean righttoleft = true
end type

type rb_all from t_rb within c_w_print
string accessibledescription = "prtall"
integer x = 91
integer y = 688
integer width = 933
integer height = 76
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "&All"
boolean checked = true
end type

event getfocus;//
end event

event clicked;call super::clicked;If This.checked Then
	em_frompage.text = ''
	em_topage.text = ''
End If
end event

type rb_pages from t_rb within c_w_print
string accessibledescription = "prtpage"
integer x = 91
integer y = 796
integer width = 279
integer height = 76
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "Pa&ges"
end type

event getfocus;//
end event

type rb_selection from t_rb within c_w_print
string accessibledescription = "prtselection"
integer x = 91
integer y = 896
integer width = 933
integer height = 76
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "&Selection"
end type

event getfocus;//
end event

event clicked;call super::clicked;If This.checked Then
	em_frompage.text = ''
	em_topage.text = ''
End If
end event

type st_from from t_st within c_w_print
string accessibledescription = "prtfrom"
integer x = 375
integer y = 796
integer width = 155
integer height = 76
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
boolean enabled = false
string text = "from:"
alignment alignment = right!
end type

type st_to from t_st within c_w_print
string accessibledescription = "prtto"
integer x = 713
integer y = 796
integer width = 96
integer height = 76
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
boolean enabled = false
string text = "to:"
alignment alignment = right!
end type

type em_frompage from t_em within c_w_print
integer x = 549
integer y = 780
integer width = 151
integer height = 84
integer taborder = 2
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "1"
string mask = "#####"
end type

event getfocus;//
end event

event modified;call super::modified;rb_pages.checked = true
end event

type em_topage from t_em within c_w_print
integer x = 823
integer y = 780
integer width = 151
integer height = 84
integer taborder = 3
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = ""
string mask = "#####"
end type

event getfocus;//
end event

event modified;call super::modified;rb_pages.checked = true
end event

type st_copies from t_st within c_w_print
string accessibledescription = "prtnbrofcopies"
integer x = 1111
integer y = 684
integer width = 535
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Number of &copies:"
end type

type em_copies from t_em within c_w_print
integer x = 1659
integer y = 684
integer width = 229
integer height = 84
integer taborder = 4
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "1"
string mask = "####"
boolean spin = true
double increment = 1
string minmax = "1~~9999"
end type

event getfocus;//
end event

type cbx_collate from t_cbx within c_w_print
string accessibledescription = "prtcollate"
integer x = 1609
integer y = 864
integer width = 274
integer height = 64
boolean bringtotop = true
integer textsize = -8
string facename = "MS Sans Serif"
string text = "C&ollate"
boolean lefttext = true
boolean righttoleft = true
end type

event clicked;call super::clicked;If this.checked Then
	p_collate.picturename = "pics\collat2.bmp"
Else
	p_collate.picturename = "pics\uncollat2.bmp"
End If
end event

type p_collate from t_p within c_w_print
integer x = 1134
integer y = 832
integer width = 448
integer height = 124
boolean bringtotop = true
string picturename = "pics\uncollat2.bmp"
end type

type cb_properties from t_cb within c_w_print
string accessibledescription = "prtproperties"
integer x = 37
integer y = 1088
integer width = 343
integer height = 92
integer taborder = 5
boolean bringtotop = true
integer textsize = -9
string text = "Properties"
end type

event clicked;call super::clicked;string ls_printer, ls_printer_current

ls_printer = ddplb_printers.Text

ls_printer_current = PrintGetPrinter()

PrintSetPrinter (ls_printer)

PrintSetupPrinter ()

PrintSetPrinter (ls_printer_current)
end event

type gb_printer from t_gb within c_w_print
string accessibledescription = "printer"
integer x = 37
integer y = 12
integer width = 1902
integer height = 564
integer textsize = -8
string facename = "MS Sans Serif"
string text = "Printer"
end type

type gb_range from t_gb within c_w_print
string accessibledescription = "prtrange"
integer x = 37
integer y = 604
integer width = 1024
integer height = 416
integer textsize = -8
string facename = "MS Sans Serif"
string text = "Print range"
end type

type gb_copies from t_gb within c_w_print
string accessibledescription = "prtcopies"
integer x = 1079
integer y = 604
integer width = 859
integer height = 416
integer textsize = -8
string facename = "MS Sans Serif"
string text = "Copies"
end type

