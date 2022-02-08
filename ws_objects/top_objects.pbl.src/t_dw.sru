$PBExportHeader$t_dw.sru
$PBExportComments$top data window control
forward
global type t_dw from datawindow
end type
end forward

global type t_dw from datawindow
integer width = 690
integer height = 400
string title = "top datawindow control"
boolean border = false
borderstyle borderstyle = stylelowered!
event e_mousemove pbm_dwnmousemove
event type long e_filter ( )
event type integer e_sort ( string vs_sort )
event type integer e_find ( string vs_find )
event type integer e_drilldown ( )
event type integer e_first ( )
event type integer e_last ( )
event type integer e_prior ( )
event type integer e_next ( )
event type long e_retrieve ( )
event type long e_refresh ( )
event e_vscroll pbm_vscroll
event e_rbuttondown pbm_dwnrbuttondown
event type integer e_firstpage ( )
event type long e_lastpage ( )
event type long e_nextpage ( )
event type long e_previouspage ( )
event type integer e_saveas ( string as_saveastype )
event type integer e_print ( )
event type integer e_mail ( )
event type long e_getfocus ( )
event type long e_losefocus ( )
event type long e_retrieveend ( long rowcount )
event type long e_rowfocuschanged ( long currentrow )
event type long e_rowfocuschanging ( long currentrow,  long newrow )
event type long e_editchanged ( long row,  dwobject dwo,  string data )
event e_dwnkey pbm_dwnkey
event e_dwnlbuttonup pbm_dwnlbuttonup
event e_resize_gutter ( )
event e_resize_dwfilter ( )
event e_dwdropdown pbm_dwndropdown
event type string e_printnodialog ( )
event type integer e_doubleclicked ( long vl_row,  string vs_colname )
event type integer e_print_no_dialog ( )
event e_command pbm_command
event e_rbuttonup pbm_dwnrbuttonup
end type
global t_dw t_dw

type prototypes
SUBROUTINE keybd_event( int bVk, int bScan, int dwFlags, int dwExtraInfo) LIBRARY "user32.dll"
end prototypes

type variables
c_dwsrv_sort 			inv_sort
c_dw_querymode 		inv_querymode
s_str_policy_attr		istr_rule_attr, istr_security_attr
s_str_dddw_where	istr_dddw_where
public:
string						is_visible_fields, is_editable_fields
string 					is_originalSQL_NoWhere, is_originalwhereClause, is_currentWhere, is_focus_colname
string						is_where_query_mode,is_record_where, is_join_match,is_join_query_mode, is_printType
string						is_popmenu = 'm_excel;m_setup_user_access;m_setup_deligate;m_setup_alert;m_edit_window_label;m_setup_dw;m_find;m_del_user_profile'
int							ii_print_copy = 1
boolean					ib_mousemoving, ib_doc_filter, ib_rebuild_relationwhere
boolean 					ib_drag, ib_mouse_down, ib_mouse_rdown
long 						il_dragged_row, il_mouse_down_y, il_mouse_down_x, il_dwc_currentrow
n_runandwait			in_runandwait
protected:

datawindow 			idw_master, iadw_detail[],  iadw_shared[], idw_total
string						is_enter_colname, is_lbttndown_colname, is_colDirlldown
boolean	ib_update, ib_insert, ib_delete, ib_query, ib_excel, ib_traceable, ib_print, ib_keyboardlocked
boolean 	ib_isdetail ,ib_ismaster, ib_iscascade_del, ib_isshared, ib_focus_Master, ib_dwmain
boolean	ib_dropdowning, ib_dropdown_scrolling, ib_dropdown_excepted,  ib_version_copying

boolean 	ib_cancelling, ib_deleting, ib_editing, ib_valuesetting, ib_inserting, ib_displaying,ib_relation_1_1
boolean	ib_saving, ib_retrieving, ib_edit_changing, ib_ref_table_yn
boolean 	ib_first_buildwhere
boolean 	ib_dataerror, ib_dummy_row_yn, ib_dummy_row
long		il_horzScrollPos, il_old_horzScrollPos, il_lbttndown_colX


end variables

forward prototypes
public function boolean f_isgrid ()
public function integer f_getparentwindow (ref window aw_parent)
public function any f_getitemany (long al_row, string as_column, dwbuffer adw_buffer, boolean ab_orig_value)
public function any f_getitemany (long al_row, string as_column)
public function integer f_getcolumns (ref string as_columns[])
public function string f_getlastcolumn (boolean ab_editableonly)
public function boolean f_iscolumnnull (long al_row, string as_column)
public function boolean f_iscolumnnull (long al_row, integer ai_column)
public function string f_getfirstcolumn (boolean ab_editableonly)
public function integer f_getcomputes (ref string as_computes[])
public function string f_get_accessible_name ()
public function string f_get_dataobject ()
public function integer f_getobjects (ref string rs_objlist[], string vs_objtype, string vs_band, boolean vb_visibleonly)
public function integer f_getobjects (ref string rs_objlist[])
public function long f_getwidth ()
public function long f_getheight ()
public function any f_getitemany (long al_row, integer ai_column, dwbuffer adw_buffer, boolean ab_orig_value)
public function any f_getitemany (long al_row, integer ai_column)
public function integer f_set_userprofile ()
public function integer f_getddlbvalue (string vs_colname, ref string rsa_value[])
public function integer f_getcolumns_sql (ref string as_columns[])
public function integer f_setzoom (integer ai_zoom)
public function integer f_getddlbvalue (string vs_colname, ref datastore rds_value)
public function integer f_savedefaultvalues ()
public function integer f_setdefaultvalues ()
public function integer f_setitem (long al_row, string as_column, string as_value)
public function integer f_setitem (long al_row, integer ai_column, string as_value)
public function integer f_ole_dw2xls (ref t_dw rdw_report)
public function integer f_get_visiblecolumns (ref string as_columns[])
public function integer f_getobjects (ref string rs_objlist[], string vs_objtype, string vs_band, string vs_tag)
public function integer f_getobjects_sort_xy (ref string as_columns[50, 100], string vs_objtype, string vs_band)
public function string f_getpriorcolumn (boolean ab_editableonly)
public function string f_getnextcolumn (boolean ab_editableonly)
public function integer f_setnextcolumn (boolean ab_editableonly)
public function integer f_setpriorcolumn (boolean ab_editableonly)
public subroutine f_set_readonly (boolean vb_readonly, boolean vb_query_mode)
protected function integer f_openprimarywindow (string vs_colname, string vs_winname, string vs_opentype)
protected function integer f_openprimarywindow (string vs_colname, string vs_opentype, string vs_window_click, string vs_datawindow_click)
public function integer f_openprimarywindow (string vs_colname, string vs_opentype)
public function integer f_get_enter_process_col (ref string rs_colname)
public function boolean f_getcol_noedit (string as_arraycol[], string as_col)
public function long f_getheight_4visible_rows ()
public function integer f_send_message_to_object (ref powerobject rpm_handling, string vs_message)
public function integer f_get_colname_in_taborder (ref string ras_colname_in_taborder[])
public function integer f_build_dwofilter ()
public function string f_get_filterstring ()
public function integer f_getcurrentsql (ref string rs_originalsql_nowhere, ref string rs_whereclause)
public function integer f_get_originalsql (ref string rs_originalsql_nowhere, ref string rs_originalwhereclause)
public function integer f_set_originalsql (string vs_originalsql_nowhere, string vs_originalwhereclause)
public function integer f_set_filterctrlvalue (string vs_colname, string vs_data)
public function integer f_add_where (string vs_columns, any va_data[])
public function integer f_send_message_to_object (ref datawindow vdw_focus, long vl_currentrow, string vs_message)
public function integer f_setup_user_access ()
public function integer f_set_properties ()
public function integer f_get_object_in_taborder (ref string ras_object_in_taborder[])
public function integer f_set_object_visible (string vs_objectname)
public function integer f_get_object_in_taborder_of_user (ref string ras_object_in_taborder[])
public function integer f_set_edit_limit (string vs_objectname)
public function integer f_build_sortstring (string vs_objectname, ref string rs_sortstring)
public function integer f_set_editable_column (string vs_colname, boolean vb_editing)
public function integer f_set_text_color (string vs_colname)
public function integer f_reset_visible_in_user_tabsequence ()
public function integer f_set_editable_property (boolean vb_editing)
public function integer f_set_editmask (string vs_colname, string vs_coltype, boolean vb_editing)
public function integer f_create_column_button (string vs_colname, string vs_bitmapname, string vs_filename, string vs_tooltip)
public function integer f_set_editable_4_filter (boolean vb_editing)
public function integer f_set_backcolor_property ()
public function integer f_create_struct_button (string vs_colname)
public function integer f_send_message_to_object (ref datawindow vdw_focus, long vl_currentrow, string vs_colname, string vs_message)
public subroutine f_set_scrollbar ()
public function integer f_set_editable_column (string vs_colname, boolean vb_editing, s_str_policy_attr vstr_security_attr, s_str_policy_attr vstr_rule_attr)
public function integer f_set_rule_attr (datastore vds_policy, long vl_row)
public subroutine f_set_rule_attr (s_str_policy_attr vstr_rule_attr)
public function s_str_policy_attr f_get_rule_attr ()
public function s_str_policy_attr f_get_security_attr ()
public function integer f_set_security_attr (datastore vds_policy, long vl_row)
public subroutine f_set_security_attr (s_str_policy_attr vstr_policy_attr)
public function integer f_set_editable_property_row (boolean vb_editing)
public function integer f_set_editable_property_specfield (boolean vb_editing)
public function integer f_set_backcolor_property_row ()
public subroutine f_set_currentwhere (string vs_currentwhereclause)
public function string f_get_currentwhere ()
public function integer f_add_where (string vs_where, string vs_operator)
public function long f_retrieve_dwc (string vs_colname)
public function integer f_rebuild_dwc_sql (ref datawindowchild rdwc_dddw, string vs_columns)
public subroutine f_reset_policy_attr (ref s_str_policy_attr rstr_policy_attr)
public function long f_get_policy_attr_union (s_str_policy_attr vstr_policy_attr, ref s_str_policy_attr rstr_policy_attr)
public function long f_get_policy_attr (datastore vds_policy, long vl_row, ref s_str_policy_attr rstr_policy_attr)
public function integer f_set_column_color (string vs_colname, s_str_policy_attr vstr_security_attr, s_str_policy_attr vstr_rule_attr, boolean vb_editing)
public function integer f_set_column_color (string vs_colname, boolean vb_editing)
public function integer f_create_dddw (long vl_setup_row)
public function string f_get_data_value_ddlb (string vs_data, string vs_colname)
public function integer f_create_dddw (long vl_setup_row, string vs_new_dddwo)
public function integer f_parse_filterstring (string vs_filterstring, ref string vsa_colname[], ref string vsa_colvalue[])
public subroutine f_set_ib_version_copying (boolean vb_version_copying)
public function boolean f_get_ib_version_copying ()
public function integer f_send_message_to_object (integer vi_xpos, integer vi_ypos, long vl_row, ref datawindow rdw_handling, string vs_message)
public function integer f_add_where_to_origin (string vs_where, string vs_operator)
public function integer f_add_where_to_origin (string vs_columns, any va_data[])
public function integer f_assembly_where (string vs_sql, string vs_where)
public function long f_set_gutter_rowcount ()
public function integer f_get_max_tabseq ()
public function string f_getlastcolumn_visible ()
public function integer f_check_col_moving (integer vi_moved_col_x, integer vi_xpos)
public function integer f_set_horizontalpos (long vl_horzpos)
public function integer f_set_drilldown_color (string vs_colname)
public subroutine f_set_attach_gutter_color ()
public subroutine f_set_number_format (string vs_colname, boolean lb_report)
public function integer f_change_where (string vs_where)
public function integer f_send_message_to_object (ref datawindow rdw_handling, string vs_message, keycode v_keycode, integer v_keyflags)
public function long f_retrieve_dwc_dwfilter (string vs_colname)
public function long f_getheight (integer vi_nbr_of_row)
public function integer f_getcolumns_visible (ref string as_columns[])
public function integer f_get_object_in_taborder_visible (ref string ras_object_in_taborder[])
public function integer f_get_cols_in_tabseq_visible (ref string ras_object_in_taborder[])
public function long f_retrieve_dwc_dwfilter (string vs_colname, string vs_dwo)
public function long f_retrieve_dwc_ex (string vs_colname)
public function boolean f_iscomputes (string vs_colname)
public function integer f_getcolumns_update (ref string as_columns[])
public subroutine f_set_security_fields (string ls_visible_fields, string ls_enable_fields)
public function string f_get_filterstring_ex (t_dw_mpl vdw_main)
end prototypes

event e_mousemove;
window			lw_parent

//-- kiểm tra w_search close chưa --//
this.f_getparentwindow(lw_parent )
if isvalid(lw_parent) then

	//-- set màu cho cột có cài đặt drilldown --//
	this.f_set_drilldown_color( dwo.name)
end if
IF ib_drag THEN
	IF ib_mouse_down or ib_mouse_rdown  THEN
		IF (Abs(PointerX() - il_mouse_down_x) > 50) OR (Abs(PointerY() - il_mouse_down_y) > 50) OR (PointerX() = 0) OR (PointerY() = 0) THEN
			Drag(Begin!)
			this.dragicon = 'RunReport5_icon_2!'
		END IF
	END IF
END IF
end event

event type integer e_firstpage();return this.ScrollToRow (0)
end event

event type long e_lastpage();long	ll_rc
string	ls_rc

ll_rc = ScrollToRow (2147483647)
if ll_rc > 0 then
	ls_rc = this.object.datawindow.firstrowonpage
	if IsNumber (ls_rc) then
		ll_rc = Long (ls_rc)
	else
		ll_rc = -1
	end if
end if

return ll_rc
end event

event type long e_nextpage();return this.ScrollNextPage()
end event

event type long e_previouspage();return this.ScrollPriorPage()
end event

event type integer e_saveas(string as_saveastype);Boolean				lb_prompt_for_file = true
Boolean				lb_excel_needed = false
String				ls_default_directory
String				ls_pathname,ls_filename
String				ls_extension,ls_filter
Integer				li_rc,li_pos,li_file
//c_uo_excel	luo_excel

SetPointer(Hourglass!)

// Check argument is recognized
If as_saveastype <> "excelwithlayout" and as_saveastype <> "excelrawdata" and as_saveastype <> "pdf" Then Return -1

// Check saveas type
lb_excel_needed = (Pos(as_saveastype,"excel") > 0)
If lb_excel_needed Then
//	luo_excel = create c_uo_excel
//	luo_excel.f_init()
End If

// Check there are some row in the DW
//If This.RowCount() <= 0 Then Return 0

ls_default_directory = GetCurrentDirectory ( )

// Prepare file extension, filter & default ouput file
If (Pos(as_saveastype,"excel") > 0) Then
	ls_extension = "*.xls"
	ls_filter = "Excel files (*.xls),*.xls"
	ls_pathname += "data.xls"
ElseIf as_saveastype = "pdf" Then
	ls_extension = "*.pdf"
	ls_filter = "PDF files (*.pdf),*.pdf"
	ls_pathname += "data.pdf"
End If

// Let the user choose a filename for the generated file (if permitted)
If lb_prompt_for_file and lower(as_saveastype) <>  "excelwithlayout" Then
	If GetFileSaveName("Save As",ls_pathname,ls_filename,ls_extension,ls_filter) <> 1 Then
		// Reset current directory to the application directory
		ChangeDirectory(ls_default_directory)		
		Return -1
	End If
End If

// Reset current directory to the application directory
ChangeDirectory(ls_default_directory)

// Perform action depending on the save as type
Choose Case lower(as_saveastype)
	Case "excelrawdata"
		li_rc = this.SaveAs(ls_pathname,Excel8!,true,EncodingUTF8!)
		If li_rc = 1 Then 
//			li_rc = luo_excel.f_create_xlssheet(this,ls_pathname, 1) 
		end if
	Case "excelwithlayout"
//		n_dwr_service_parm lnvo_parm
//		lnvo_parm = create n_dwr_service_parm
//		lnvo_parm.ib_hide_grid = true         //Hide gridlines
//		t_dw_mpl dw1
//		dw1 = create t_dw_mpl
//		dw1 = this
//		li_rc = uf_save_dw_as_excel_parm(dw1, ls_pathname, lnvo_parm)

		string       ls_file_name ,named
		int           li_return
		n_cst_xlshelper xlshelper  
		xlsHelper.of_setprintheader(1)
		xlsHelper.of_set_openexcel(true)
		  
		//EXCEL
		li_rc = GetFileSaveName("Select File",ls_file_name, named, "xls","Excel Files (*.xls),*.xls, Excel files (*.xlsx),*.xlsx")
			 
		//OPENOFFICE
		//li_return = GetFileSaveName("Select File",ls_file_name, named, "ods","OPENOFFICE (*.ods),*.ods,")
			
		IF li_rc =1 then
			xlsHelper.of_dw2excel(this,ls_file_name)
//			in_runandwait.of_set_options( true, 30*60)
//			in_runandwait.of_shellrun( ls_file_name, '', Maximized!)
		END IF 
	
	Case "pdf"
		this.Object.DataWindow.Export.PDF.Method = Distill!
//		this.Object.DataWindow.Printer = "\\prntsrvr\pr-6"
//		this.Object.DataWindow.Export.PDF.Distill.CustomPostScript="Yes" 
//		li_ret = dw_1.SaveAs("custom.PDF", PDF!, true)
		li_rc = this.SaveAs(ls_pathname,PDF!	,true,EncodingUTF8!)
		
End Choose

// If operation failed, display an error message
If li_rc <> 1 Then
	Choose Case as_saveastype
		Case "excelrawdata","excelwithlayout"
//			gf_MessageBox("msg_KhongTheTaoExcel")
		Case "pdf"
//			gf_MessageBox("msg_KhongTheTaoPDF")
	End Choose
End If
//trả lại thư mục ban đầu của bambo-100
ChangeDirectory(gs_path_pic)
Return li_rc
end event

event type integer e_print();boolean			lb_collate
integer			li_copies, li_rc
long				ll_rc, ll_pos, ll_pagecount, ll_cnt, ll_selected=0, ll_counter = 0
string				ls_pagecount, ls_copies, ls_collate, ls_printer, ls_currentprinter
string				ls_pathname = "Output", ls_filename, ls_val
t_s_printdlg		lstr_printdlg
datastore		lds_selection
t_dw				ldw_requester

setpointer(hourglass!)
// Initialize printdlg structure with current print values of DW
lstr_printdlg.b_allpages = true 

ls_copies = this.Object.DataWindow.Print.Copies
if not IsNumber (ls_copies) then	ls_copies = "1"

li_copies = Integer (ls_copies)
lstr_printdlg.l_copies = li_copies

ls_collate = this.Object.DataWindow.Print.Collate
if lower(ls_collate) = 'yes' then
	lb_collate = true
else
	lb_collate = false
end if
lstr_printdlg.b_collate = lb_collate

lstr_printdlg.l_frompage = 1
lstr_printdlg.l_minpage = 1

ls_pagecount = this.Describe ("Evaluate ('PageCount()', 1)")
if IsNumber (ls_pagecount) then
	ll_pagecount = Long (ls_pagecount)
	lstr_printdlg.l_maxpage = ll_pagecount
	lstr_printdlg.l_topage = ll_pagecount
end if

if this.GetSelectedRow (0) = 0 then	lstr_printdlg.b_disableselection = true

ldw_requester = this
if this.f_send_message_to_object( ldw_requester,'e_preprint') = -1 then return -1

// Open the print dialog window
OpenWithParm(c_w_print,lstr_printdlg)
lstr_printdlg = Message.PowerObjectParm

// Check disablepagenums property to know if user has confirmed or cancelled
If lstr_printdlg.b_disablepagenums Then
	// Page Range
	if lstr_printdlg.b_allpages then
		this.Object.DataWindow.Print.Page.Range = ""
	elseif lstr_printdlg.b_pagenums then
		this.Object.DataWindow.Print.Page.Range = String (lstr_printdlg.l_frompage) + "-" + String (lstr_printdlg.l_topage)
	elseif lstr_printdlg.b_selection then
		this.Object.DataWindow.Print.Page.Range = "selection"
	end if

	// Collate copies
	this.Object.DataWindow.Print.Collate = lstr_printdlg.b_collate

	// Number of copies
	this.Object.DataWindow.Print.Copies = lstr_printdlg.l_copies

	// Print to file (must prompt user for filename first)
	if lstr_printdlg.b_printtofile then
		if GetFileSaveName ("Print to File", ls_pathname, ls_filename, "prn", "Printer Files,*.prn,All Files,*.*") <= 0 then
			return -1
		else
			this.Object.DataWindow.Print.Filename = ls_pathname
		end if
	end if
else
	Return -1
end if

// Print selection
if this.Object.DataWindow.Print.Page.Range = "selection" then
	// Create a datastore to print selected rows
	lds_selection = create datastore
	lds_selection.dataobject = this.DataObject

	// First discard any data in the dataobject
	lds_selection.Reset()
		
	// Get selected count
	DO
		ll_selected = this.GetSelectedRow ( ll_selected )
		IF ll_selected > 0 THEN
			if this.RowsCopy (ll_selected,ll_selected , primary!, lds_selection, 2147483647, primary!) < 0 then
				destroy lds_selection
				return -1
			end if
			
			ll_counter++
		END IF
	LOOP WHILE ll_selected > 0

	if ll_counter > 0 then
		// Capture print properties of original DW
		// (Note:  this syntax uses Describe/Modify PS functions to avoid 64K segment limit)
		ls_val = this.Describe ("DataWindow.Print.Collate")
		lds_selection.Modify ("DataWindow.Print.Collate = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Color")
		lds_selection.Modify ("DataWindow.Print.Color = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Columns")
		lds_selection.Modify ("DataWindow.Print.Columns = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Columns.Width")
		lds_selection.Modify ("DataWindow.Print.Columns.Width = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Copies")
		lds_selection.Modify ("DataWindow.Print.Copies = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Documentname")
		lds_selection.Modify ("DataWindow.Print.Documentname = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Duplex")
		lds_selection.Modify ("DataWindow.Print.Duplex = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Filename")
		lds_selection.Modify ("DataWindow.Print.Filename = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Margin.Bottom")
		lds_selection.Modify ("DataWindow.Print.Margin.Bottom = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Margin.Left")
		lds_selection.Modify ("DataWindow.Print.Margin.Left = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Margin.Right")
		lds_selection.Modify ("DataWindow.Print.Margin.Right = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Margin.Top")
		lds_selection.Modify ("DataWindow.Print.Margin.Top = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Orientation")
		lds_selection.Modify ("DataWindow.Print.Orientation = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Page.Range")
		lds_selection.Modify ("DataWindow.Print.Page.Range = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Page.Rangeinclude")
		lds_selection.Modify ("DataWindow.Print.Page.Rangeinclude = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Paper.Size")
		lds_selection.Modify ("DataWindow.Print.Paper.Size = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Paper.Source")
		lds_selection.Modify ("DataWindow.Print.Paper.Source = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Prompt")
		lds_selection.Modify ("DataWindow.Print.Prompt = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Quality")
		lds_selection.Modify ("DataWindow.Print.Quality = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Scale")
		lds_selection.Modify ("DataWindow.Print.Scale = " + ls_val)
	end if
end if


// Check if a tray was chosen
ll_pos = LastPos(lstr_printdlg.s_printer,"|")
If ll_pos > 0 Then
	// Set printer
	ls_printer = Left(lstr_printdlg.s_printer,ll_pos -1)
Else
	// Set printer 
	ls_printer = lstr_printdlg.s_printer
End If

// Get current printer
ls_currentprinter = PrintGetPrinter()

// Set the printer from the print dialog
PrintSetPrinter(ls_printer)

// Print selection DS or DW
if IsValid (lds_selection) then
	// Print selection
	li_rc = lds_selection.Print (true)
	destroy lds_selection
else
	// Print DW
	li_rc = this.Print (true)
end if

// Reset DW print properties
this.Object.DataWindow.Print.Filename = ""
this.Object.DataWindow.Print.Page.Range = ""

// Reset current printer
PrintSetPrinter(ls_currentprinter)


if this.f_send_message_to_object( ldw_requester,'e_postprint') = -1 then return -1


Return li_rc
end event

event type integer e_mail(); //Return OpenSheetWithParm(u_w_mail,this,t_w_mdi,0,original!)
return 0
end event

event type long e_getfocus();return 0
end event

event type long e_losefocus();return 0
end event

event e_dwnkey;boolean				lb_querymode, lb_valueset_receive_number
int						li_idx,li_rtn, li_editpos, li_chk
string					ls_name, ls_editStyle, ls_data, ls_autocomplete_string, lsa_return_cols[], ls_col_curcode, ls_col_exrate, lsa_receive_cols[]
string					ls_coltype, ls_dwdatatype, ls_rtn_columns
any					la_data
double				ldb_exrate
long					ll_row_setup
s_w_main			lw_display
s_object_display	lod_handle
t_dw					ldw_main, ldw_requester
datawindowchild 	ldwc
c_string 				lc_string
c_dwservice			lc_dwservice

if key= keyEnter! then

	//-- Nếu là valueset : gọi auto complete --//
	this.f_getparentwindow( lw_display)
	lod_handle = lw_display.f_get_obj_handling( )	
	ls_name = this.getcolumnname( )
	ls_editStyle =  this.describe(ls_name+ ".Edit.Style")
	IF ls_editStyle = 'dddw' or ls_editStyle = 'ddlb' then

		if this.ib_dropdowning = false then 
//			this.dynamic keybd_event( 115,0,0,0 )			
			Send(Handle(this),256,9,Long(0,0))
			return 1
		else
			if  this.ib_dropdown_excepted then
				this.ib_dropdown_excepted = false 
				
				ls_data = this.gettext( )
				if ls_data = '' or isnull(ls_data) then
					ib_dropdowning = false
					Send(Handle(this),256,9,Long(0,0))	
					return 1				
				end if
				
				this.ib_dropdowning = false 
//				this.getchild( ls_name, ldwc)
//				il_dwc_currentrow = ldwc.getrow( )
				this.settext( ls_data)
				Send(Handle(this),256,9,Long(0,0))	
				return 1				
			else //-- khi gõ chưa đúng valueset --//
				ib_dropdowning = false
				ib_dropdown_scrolling = false
				
				if lod_handle.idwsetup_initial.is_ACCEPT_OUT_OF_LIST_YN = 'Y' then
					
				else
					ls_data = this.gettext( )
					if pos(ls_data ,';') = 0 then
						this.getchild( ls_name, ldwc)
						li_rtn = lc_string.f_stringtoarray(lod_handle.idwsetup_initial.is_return_column , ';', lsa_return_cols[])
						if li_rtn > 0 then
							la_data = lc_dwservice.f_getitemany_dwc( ldwc, ldwc.getrow() , lsa_return_cols[1])
							this.settext( string(la_data))
						end if
					end if
				end if
				Send(Handle(this),256,9,Long(0,0))			
				return 1				
			end if			
				
		end if

	end if		
	
	//--gọi lên object--//
	ldw_requester = this
	li_rtn = this.f_send_message_to_object( ldw_requester,'e_dwnkey',key, keyflags)
	if li_rtn = -1 then
		return 1
	elseif li_rtn = 2 then
		return 1
	end if

	if lod_handle.classname() = 'u_valueset' then
		lod_handle.event e_window_e_okclose( )
		return 1
	else

//		ldw_requester = this
//		li_rtn =  this.f_send_message_to_object( ldw_requester, 'e_dwnkey',key, keyflags)
		if li_rtn = -1 then return 1
		if this.ib_ismaster then
			//-- Truong hop dw dang grid --//
			if this.f_isgrid( ) then
				Send(Handle(this),256,9,Long(0,0))
				RETURN 1
			else  //-- Truong hop dw dang freeform --//	
	//			if is_enter_colname = '' then
	//				is_enter_colname = idwsetup_initial.f_get_enter_column()
	//			end if
				if is_enter_colname <> this.getcolumnname( ) then
					Send(Handle(this),256,9,Long(0,0))
					RETURN 1		
				else	
					FOR li_idx = 1 to upperbound(this.iadw_detail[])
						if this.iadw_detail[li_idx].dynamic f_get_ib_displaying() then
							this.iadw_detail[li_idx].setfocus()
							return 1
						end if
					NEXT					
					return 1					
				end if
			end if
		else //-- Truong hop là dw detail --//
			if this.f_isgrid( ) then	
				if this.ib_editing then
					if  this.getcolumnname( ) = this.f_getlastcolumn( true) then
						if this.accepttext( ) = -1 then return -1
						if this.dynamic f_get_ib_insert(this.istr_rule_attr, this.istr_security_attr ) then
							lw_display.event e_add( )
//							this.dynamic event e_addrow( )	
							return 1
						end if
					end if
				end if
			end if
			Send(Handle(this),256,9,Long(0,0))
			RETURN 1		
		end if
	end if
elseif key = keytab! then
		if this.ib_dropdowning  then 
			ls_name = this.getcolumnname( )
			ls_data = this.gettext( )
			if ls_data = '' or isnull(ls_data) then
				ib_dropdowning = false
				return 		
			end if
			
			ls_editStyle =  this.describe(ls_name+ ".Edit.Style")
			IF ls_editStyle = 'dddw' or ls_editStyle = 'ddlb' then			
				this.f_getparentwindow( lw_display)
				lod_handle = lw_display.f_get_obj_handling( )					
				this.getchild( ls_name, ldwc)
				li_rtn = lc_string.f_stringtoarray(lod_handle.idwsetup_initial.is_return_column , ';', lsa_return_cols[])
				if li_rtn > 0 then
					la_data = lc_dwservice.f_getitemany_dwc( ldwc, ldwc.getrow() , lsa_return_cols[1])
					
					if string(la_data) <> '' then
						this.settext( string(la_data))
					end if
					if this.gettext( ) <> '' then
						this.ib_dropdowning = false 
					end if			 
				else
					this.ib_dropdowning = false 
					this.settext( ls_data)
				end if
			end if
		end if	
	ldw_requester = this
	li_rtn = this.f_send_message_to_object( ldw_requester,'e_dwnkey',key, keyflags)
	
elseif  key= KeyDownArrow! or key = KeyUPArrow! then
	if this.classname( ) = 'dw_filter' then
		this.f_getparentwindow( lw_display)
		lod_handle = lw_display.f_get_obj_handling( )
		if lod_handle.classname() = 'u_valueset' then	
			ldw_main = lw_display.f_get_dwmain( )
			if  key= KeyDownArrow! then
				ldw_main.scrollnextrow( )
			elseif key = KeyUPArrow! then
				ldw_main.scrollpriorrow( )
			end if
			return 1
		end if	
	end if
else
		//--gọi lên object--//
	ldw_requester = this
	if this.f_send_message_to_object( ldw_requester,'e_dwnkey',key, keyflags) = -1 then return 1
end if
end event

event e_dwnlbuttonup;s_w_main		lw_parent
datawindow		ldw_main
int					li_xpos
string				ls_moving_col

//-- Nếu dạng lười gutter khong thay đồi width --//
if this.ib_dropdowning then return 0

//-- drag--//
IF ib_drag THEN
	ib_Mouse_Down = False
	this.dragicon = ''
	This.Drag(End!)
	this.selectrow(0, FALSE) 
END IF

IF this.object.datawindow.syntax.modified = "yes" THEN
	if this.f_isgrid( ) then
		this.setredraw( false)
		if this.f_getparentwindow(lw_parent ) = 1 then
			if lw_parent.dw_filter.visible then
				ldw_main = lw_parent.f_get_dwmain( )
				if this = ldw_main then
					lw_parent.post event e_filter_resize( )
				end if
			end if
		end if	
		if is_lbttndown_colname <> 'datawindow' then
			this.post f_check_col_moving( il_lbttndown_colX,xpos)
		end if
		this.post event e_resize_gutter( )		
	end if
end if
end event

event e_resize_gutter();int			ls_len
string		ls_gutter_text

//-- Nếu dạng lười gutter khong thay đồi width --//
IF this.object.datawindow.syntax.modified = "yes" THEN
	ls_gutter_text = this.describe( "gutter_t.text")
	ls_len =len(ls_gutter_text)*35
	this.modify( "gutter_t.x = 9 gutter_t.width="+string(ls_len))
	this.modify( "gutter.x = 9 gutter.width="+string(ls_len))
//	this.modify( "b_form.x =9 b_form.width="+string(ls_len))
	
	//-- goi resize dw_filer cua parent window --//
	
	this.setredraw( true)
end if
end event

event e_resize_dwfilter();window			lw_parent
string				las_col[]

this.f_get_colname_in_taborder( las_col[] )

if this.f_getparentwindow( lw_parent) = 1 then
	lw_parent.dynamic event e_filter_modify_display( las_col[])
end if
end event

event e_dwdropdown;string 	ls_colname, ls_text, ls_dddw_displaycol, ls_filter_str
long		ll_rtn
datawindowchild			ldwc
b_obj_instantiate			lbo_ins

//-- Khởi tạo valueset object --//
ls_colname = this.getcolumnname( )
IF  this.describe(ls_colname + ".Edit.Style")  = 'dddw' and this.describe(ls_colname + '.dddw.name') <> '' then
	if this.classname( ) = 'dw_filter' then
//		this.ib_dropdowning = true
		this.f_retrieve_dwc_dwfilter(ls_colname )		
	else
		this.ib_dropdowning = true
		ll_rtn = this.f_retrieve_dwc_ex(ls_colname )
		if ll_rtn > 0 then
			ls_text = this.gettext( )
			if ls_text <> '' then
				this.getchild(ls_colname, ldwc)
				ls_dddw_displaycol = this.describe( ls_colname+ '.dddw.displaycolumn')
				ls_filter_str = lbo_ins.f_get_filterstring( ldwc, ls_text, ls_dddw_displaycol)
				ldwc.SetFilter(ls_filter_str)
				ldwc.Filter()							
			end if
		end if
		return 0
	end if
end if
end event

event type string e_printnodialog();boolean			lb_collate
integer			li_copies, li_rc
long				ll_rc, ll_pos, ll_pagecount, ll_cnt, ll_selected=0, ll_counter = 0
string				ls_pagecount, ls_copies, ls_collate, ls_printer, ls_currentprinter
string				ls_pathname , ls_filename = 'Data.pdf', ls_val
t_s_printdlg	lstr_printdlg
datastore	lds_selection

setpointer(hourglass!)
// Initialize printdlg structure with current print values of DW
lstr_printdlg.b_allpages = true 

ls_copies = this.Object.DataWindow.Print.Copies
if not IsNumber (ls_copies) then	ls_copies = "1"

li_copies = Integer (ls_copies)
lstr_printdlg.l_copies = li_copies

ls_collate = this.Object.DataWindow.Print.Collate
if lower(ls_collate) = 'yes' then
	lb_collate = true
else
	lb_collate = false
end if
lstr_printdlg.b_collate = lb_collate

lstr_printdlg.l_frompage = 1
lstr_printdlg.l_minpage = 1

ls_pagecount = this.Describe ("Evaluate ('PageCount()', 1)")
if IsNumber (ls_pagecount) then
	ll_pagecount = Long (ls_pagecount)
	lstr_printdlg.l_maxpage = ll_pagecount
	lstr_printdlg.l_topage = ll_pagecount
end if

setnull(ls_pathname)
this.Object.DataWindow.Print.Page.Range = ""
ls_currentprinter = PrintGetPrinter()

// Set the printer from the print dialog
PrintSetPrinter('Foxit Reader PDF Printer')

// Print selection DS or DW
if IsValid (lds_selection) then
	// Print selection
	li_rc = lds_selection.Print (true)
	destroy lds_selection
else
	// Print DW
	li_rc = this.Print (true)
end if
if li_rc = 1 then ls_pathname = GetCurrentDirectory ( ) +'\datawindow.pdf'
// Reset DW print properties
this.Object.DataWindow.Print.Filename = ""
this.Object.DataWindow.Print.Page.Range = ""

// Reset current printer
PrintSetPrinter(ls_currentprinter)

Return ls_pathname
end event

event type integer e_print_no_dialog();boolean			lb_collate
integer			li_copies, li_rc
long				ll_rc, ll_pos, ll_pagecount, ll_cnt, ll_selected=0, ll_counter = 0,ll_job
string				ls_pagecount, ls_copies, ls_collate, ls_printer, ls_currentprinter
string				ls_pathname = "Output", ls_filename, ls_val,ls_rtn
t_s_printdlg	lstr_printdlg
datastore	lds_selection

setpointer(hourglass!)
// Initialize printdlg structure with current print values of DW
lstr_printdlg.b_allpages = true 
// Lấy số tờ muốn in
ls_copies = this.Object.DataWindow.Print.Copies
// nếu không có thì mặc định là 1 tờ
if not IsNumber (ls_copies) then	ls_copies = "1"

li_copies = Integer (ls_copies)
lstr_printdlg.l_copies = li_copies

ls_collate = this.Object.DataWindow.Print.Collate
if lower(ls_collate) = 'yes' then
	lb_collate = true
else
	lb_collate = false
end if
lstr_printdlg.b_collate = lb_collate

lstr_printdlg.l_frompage = 1
lstr_printdlg.l_minpage = 1

ls_pagecount = this.Describe ("Evaluate ('PageCount()', 1)")
if IsNumber (ls_pagecount) then
	ll_pagecount = Long (ls_pagecount)
	lstr_printdlg.l_maxpage = ll_pagecount
	lstr_printdlg.l_topage = ll_pagecount
end if

if this.GetSelectedRow (0) = 0 then	lstr_printdlg.b_disableselection = true

// Open the print dialog window
//OpenWithParm(u_w_print,lstr_printdlg)
//lstr_printdlg = Message.PowerObjectParm

// Check disablepagenums property to know if user has confirmed or cancelled
lstr_printdlg.b_disablepagenums = true
If lstr_printdlg.b_disablepagenums Then
	// Page Range
	if lstr_printdlg.b_allpages then
		this.Object.DataWindow.Print.Page.Range = ""
	elseif lstr_printdlg.b_pagenums then
		this.Object.DataWindow.Print.Page.Range = String (lstr_printdlg.l_frompage) + "-" + String (lstr_printdlg.l_topage)
	elseif lstr_printdlg.b_selection then
		this.Object.DataWindow.Print.Page.Range = "selection"
	end if

	// Collate copies
	this.Object.DataWindow.Print.Collate = lstr_printdlg.b_collate

	// Number of copies
	this.Object.DataWindow.Print.Copies = lstr_printdlg.l_copies

	// Print to file (must prompt user for filename first)
	if lstr_printdlg.b_printtofile then
		if GetFileSaveName ("Print to File", ls_pathname, ls_filename, "prn", "Printer Files,*.prn,All Files,*.*") <= 0 then
			return -1
		else
			this.Object.DataWindow.Print.Filename = ls_pathname
		end if
	end if
else
	Return -1
end if

// Print selection
if this.Object.DataWindow.Print.Page.Range = "selection" then
	// Create a datastore to print selected rows
	lds_selection = create datastore
	lds_selection.dataobject = this.DataObject

	// First discard any data in the dataobject
	lds_selection.Reset()
		
	// Get selected count
	DO
		ll_selected = this.GetSelectedRow ( ll_selected )
		IF ll_selected > 0 THEN
			if this.RowsCopy (ll_selected,ll_selected , primary!, lds_selection, 2147483647, primary!) < 0 then
				destroy lds_selection
				return -1
			end if
			
			ll_counter++
		END IF
	LOOP WHILE ll_selected > 0

	if ll_counter > 0 then
		// Capture print properties of original DW
		// (Note:  this syntax uses Describe/Modify PS functions to avoid 64K segment limit)
		ls_val = this.Describe ("DataWindow.Print.Collate")
		lds_selection.Modify ("DataWindow.Print.Collate = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Color")
		lds_selection.Modify ("DataWindow.Print.Color = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Columns")
		lds_selection.Modify ("DataWindow.Print.Columns = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Columns.Width")
		lds_selection.Modify ("DataWindow.Print.Columns.Width = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Copies")
		lds_selection.Modify ("DataWindow.Print.Copies = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Documentname")
		lds_selection.Modify ("DataWindow.Print.Documentname = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Duplex")
		lds_selection.Modify ("DataWindow.Print.Duplex = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Filename")
		lds_selection.Modify ("DataWindow.Print.Filename = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Margin.Bottom")
		lds_selection.Modify ("DataWindow.Print.Margin.Bottom = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Margin.Left")
		lds_selection.Modify ("DataWindow.Print.Margin.Left = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Margin.Right")
		lds_selection.Modify ("DataWindow.Print.Margin.Right = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Margin.Top")
		lds_selection.Modify ("DataWindow.Print.Margin.Top = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Orientation")
		lds_selection.Modify ("DataWindow.Print.Orientation = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Page.Range")
		lds_selection.Modify ("DataWindow.Print.Page.Range = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Page.Rangeinclude")
		lds_selection.Modify ("DataWindow.Print.Page.Rangeinclude = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Paper.Size")
		lds_selection.Modify ("DataWindow.Print.Paper.Size = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Paper.Source")
		lds_selection.Modify ("DataWindow.Print.Paper.Source = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Prompt")
		lds_selection.Modify ("DataWindow.Print.Prompt = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Quality")
		lds_selection.Modify ("DataWindow.Print.Quality = " + ls_val)

		ls_val = this.Describe ("DataWindow.Print.Scale")
		lds_selection.Modify ("DataWindow.Print.Scale = " + ls_val)
	end if
end if


// Check if a tray was chosen
ll_pos = LastPos(lstr_printdlg.s_printer,"|")
If ll_pos > 0 Then
	// Set printer
	ls_printer = Left(lstr_printdlg.s_printer,ll_pos -1)
Else
	// Set printer 
	ls_printer = lstr_printdlg.s_printer
End If

// Get current printer
ls_currentprinter = PrintGetPrinter()

if isnull(ls_printer) or len(trim(ls_printer)) = 0 then
	// Set the printer from the print dialog
	PrintSetPrinter(ls_currentprinter)
else
	PrintSetPrinter(ls_printer)
end if

// Print selection DS or DW
if IsValid (lds_selection) then
	// Print selection
	//li_rc = lds_selection.Print (true)
	if ii_print_copy = 1 or ii_print_copy = 0 then
		li_rc = lds_selection.Print (false,false)
	elseif ii_print_copy = 2 then
		li_rc = lds_selection.Print (false,false)
		sleep(1)
		li_rc = lds_selection.Print (false,false)
	end if
	destroy lds_selection
else
	// Print DW
	//li_rc = this.Print (true)
	//ls_rtn = this.Modify ("DataWindow.Print.Prompt = 'no'")
	//ls_rtn = this.Modify ("DataWindow.Print.OverridePrintJob = 'yes'")
//	li_rc = this.Print (false,false)
	if  ii_print_copy = 1 or ii_print_copy = 0 then
		ll_job = PrintOpen('PhieuCom',false )
		li_rc = PrintDataWindow(ll_job, this)
		li_rc = PrintClose(ll_job)
	elseif ii_print_copy = 2 then
		ll_job = PrintOpen('PhieuCom',false )
		li_rc = PrintDataWindow(ll_job, this)
		li_rc = PrintClose(ll_job)		
		ll_job = PrintOpen('PhieuCom',false )
		li_rc = PrintDataWindow(ll_job, this)
		li_rc = PrintClose(ll_job)				
	end if
end if

// Reset DW print properties
//this.Object.DataWindow.Print.Filename = ""
//this.Object.DataWindow.Print.Page.Range = ""

// Reset current printer
PrintSetPrinter(ls_currentprinter)

Return li_rc
end event

event e_rbuttonup;//-- drag--//
IF ib_drag THEN
	ib_Mouse_rDown = False
	this.dragicon = ''
	This.Drag(End!)
	this.selectrow(0, FALSE) 
END IF

end event

public function boolean f_isgrid ();//

if (right( this.dataobject, 5) = '_grid' ) then
	return true
else
	Return (this.describe("DataWindow.Processing") = "1")
end if
end function

public function integer f_getparentwindow (ref window aw_parent);powerobject		lpo_parent

lpo_parent = this.GetParent()

// Loop getting the parent of the object until it is of type window!
do while IsValid (lpo_parent) 
	if lpo_parent.TypeOf() <> window! then
		lpo_parent = lpo_parent.GetParent()
	else
		exit
	end if
loop

if IsNull(lpo_parent) or not IsValid (lpo_parent) then
	setnull(aw_parent)	
	return -1
end if

aw_parent = lpo_parent

return 1
end function

public function any f_getitemany (long al_row, string as_column, dwbuffer adw_buffer, boolean ab_orig_value);any 		la_value

/*  Determine the datatype of the column and then call the appropriate 
	 GetItemxxx function and cast the returned value */
CHOOSE CASE Lower ( Left ( this.Describe ( as_column + ".ColType" ) , 5 ) )

		CASE "char(", "char"		//  CHARACTER DATATYPE
			la_value = this.GetItemString ( al_row, as_column, adw_buffer, ab_orig_value ) 
	
		CASE "date"					//  DATE DATATYPE
			la_value = this.GetItemDate ( al_row, as_column, adw_buffer, ab_orig_value ) 

		CASE "datet"				//  DATETIME DATATYPE
			la_value = this.GetItemDateTime ( al_row, as_column, adw_buffer, ab_orig_value ) 

		CASE "decim"				//  DECIMAL DATATYPE
			la_value = this.GetItemDecimal ( al_row, as_column, adw_buffer, ab_orig_value ) 
	
		CASE "numbe", "long", "ulong", "real", "int"				//  NUMBER DATATYPE	
			la_value = this.GetItemNumber ( al_row, as_column, adw_buffer, ab_orig_value ) 
	
		CASE "time", "times"		//  TIME DATATYPE
			la_value = this.GetItemTime ( al_row, as_column, adw_buffer, ab_orig_value ) 

		CASE ELSE 					
			SetNull ( la_value ) 

END CHOOSE

Return la_value
end function

public function any f_getitemany (long al_row, string as_column);Return f_GetItemany ( al_row, as_column, Primary!, FALSE )
end function

public function integer f_getcolumns (ref string as_columns[]);Integer	li_columns_count
String	ls_syntax,ls_columns[]
Long		ll_poscol,ll_posname

ls_syntax = this.describe("Datawindow.syntax")

If IsNull(ls_syntax) or Len(ls_syntax) = 0 Then Return -1

ll_poscol = Pos(ls_syntax,"column(")
Do While (ll_poscol > 0)
	ll_posname = Pos(ls_syntax,"name=",ll_poscol)
	ll_posname += 5

	li_columns_count ++

	ls_columns[li_columns_count] =Trim(Mid(ls_syntax,ll_posname,Pos(ls_syntax," ",ll_posname)-ll_posname))

	ll_poscol = Pos(ls_syntax,"column(",ll_poscol+1)
Loop

as_columns = ls_columns

Return li_columns_count

end function

public function string f_getlastcolumn (boolean ab_editableonly);//	Arguments:
//	  ab_editableonly:True -> Only take into account columns that can be modified.
//							False -> Take all columns into account (even protected ones).
//
//	Returns:	String
//	  Name of the last column (empty string if an error occured).


String	ls_columns[],ls_protect, ls_visible, ls_displayonly
Integer	li_i,li_max, li_lastcolumn = 0, li_pos, ll_cnt_noedit
Integer	li_taborder, li_maxtaborder = 0
//c_obj_service			lc_obj_srv


If IsNull(ab_editableonly) Then Return ""
//lc_obj_srv.f_stringtoarray(is_noedit_colname, ';',ls_noedit_colname[])
li_max = this.f_GetColumns(ls_columns)
For li_i=1 To li_max
	li_taborder = Long(this.describe(ls_columns[li_i] + ".TabSequence"))
	
	If ab_editableonly Then
		ls_visible = this.describe(ls_columns[li_i] + ".Visible")
		
		li_pos = Pos(ls_visible,"~t")
		If li_pos > 0 Then
			ls_visible = this.describe("Evaluate(~'" + Mid(ls_visible,li_pos +1, &
				(Len(ls_visible) - li_pos -1)) + "~'," + String(this.GetRow()) + ")")
		End If
		
		If ls_visible = "1" Then
			ls_protect = this.describe(ls_columns[li_i] + ".Protect")
			
			li_pos = Pos(ls_protect,"~t")
			If li_pos > 0 Then
				ls_protect = this.describe("Evaluate(~'" + Mid(ls_protect,li_pos +1, &
					(Len(ls_protect) - li_pos -1)) + "~'," + String(this.GetRow()) + ")")
			End If
		End If
	End If
	
	ls_displayonly ='no'
//	FOR ll_cnt_noedit = 1 to upperbound(is_noedit_colname[])
//		if is_noedit_colname[ll_cnt_noedit] = ls_columns[li_i] then
//			ls_displayonly = 'yes'
//			exit
//		end if
//	NEXT
	
	If (not ab_editableonly or (ls_visible = "1" and ls_protect = "0" and li_taborder > 0 and ls_displayonly = 'no' )) &
		and (li_taborder > li_maxtaborder) Then
		li_maxtaborder = li_taborder
		li_lastcolumn = li_i
	End If
Next

If li_lastcolumn > 0 Then
	Return ls_columns[li_lastcolumn]
Else
	Return ""
End If

end function

public function boolean f_iscolumnnull (long al_row, string as_column);Return IsNull(f_GetItemAny(al_row,as_column))

end function

public function boolean f_iscolumnnull (long al_row, integer ai_column);Return IsNull(f_GetItemAny(al_row,this.describe("#" + string(ai_column) + ".Name")))

end function

public function string f_getfirstcolumn (boolean ab_editableonly);//	Arguments:
//	  ab_editableonly:True -> Only take into account columns that can be modified.
//							False -> Take all columns into account (even protected ones).
//
//	Returns:	String
//	  Name of the last column (empty string if an error occured).


String				ls_columns[],ls_protect, ls_visible, ls_name, ls_displayonly
Integer				li_i,li_max, li_firstcolumn = 0, li_pos, ll_cnt_noedit
Integer				li_taborder, li_lowesttaborder = 999999

//c_obj_service		lc_obj_srv

If IsNull(ab_editableonly) Then Return ""
//lc_obj_srv.f_stringtoarray(is_noedit_colname, ';',ls_noedit_colname[])
li_max = this.f_GetColumns(ls_columns)
For li_i=1 To li_max
	li_taborder = Long(this.describe(ls_columns[li_i] + ".TabSequence"))
	ls_name = this.describe( ls_columns[li_i] + ".name")
	If ab_editableonly Then
		ls_visible = this.describe(ls_columns[li_i] + ".Visible")
		
		li_pos = Pos(ls_visible,"~t")
		If li_pos > 0 Then
			ls_visible = this.describe("Evaluate(~'" + Mid(ls_visible,li_pos +1, &
				(Len(ls_visible) - li_pos -1)) + "~'," + String(this.GetRow()) + ")")
		End If
		
		If ls_visible = "1" Then
			ls_protect = this.describe(ls_columns[li_i] + ".Protect")
			
			li_pos = Pos(ls_protect,"~t")
			If li_pos > 0 Then

				ls_protect = this.describe("~"Evaluate(~'" + Mid(ls_protect,li_pos +1, (Len(ls_protect) - li_pos -1)) + "~'," + String(this.GetRow()) + ")~"")
			End If
		End If
	End If
	
	ls_displayonly ='no'
//	FOR ll_cnt_noedit = 1 to upperbound(is_noedit_colname[])
//		if is_noedit_colname[ll_cnt_noedit] = ls_columns[li_i] then
//			ls_displayonly = 'yes'
//			exit
//		end if
//	NEXT
	
	If (not ab_editableonly or (ls_visible = "1" and (ls_protect = "0" or ls_protect = "!" ) and li_taborder > 0 and ls_displayonly = 'no' )) &
		and (li_taborder < li_lowesttaborder) Then
		if li_taborder = 10 and ls_name = 'gutter' then continue
		li_lowesttaborder = li_taborder
		li_firstcolumn = li_i
	End If
	
	if this.f_isgrid( ) then
		If  li_lowesttaborder = 20 Then Return ls_columns[li_firstcolumn]
	else
		If li_lowesttaborder = 10 Then Return ls_columns[li_firstcolumn]
	end if
Next

If li_firstcolumn > 0 Then
	Return ls_columns[li_firstcolumn]
End If

Return ""


end function

public function integer f_getcomputes (ref string as_computes[]);Integer	li_computes_count
String	ls_syntax,ls_computes[]
Long		ll_poscol,ll_posname

ls_syntax = this.describe("Datawindow.syntax")
If IsNull(ls_syntax) or Len(ls_syntax) = 0 Then Return -1

ll_poscol = Pos(ls_syntax,"compute(")
Do While (ll_poscol > 0)
	ll_posname = Pos(ls_syntax,"name=",ll_poscol)
	ll_posname += 5
	
	li_computes_count ++
	
	ls_computes[li_computes_count] =Trim(Mid(ls_syntax,ll_posname,Pos(ls_syntax," ",ll_posname)-ll_posname))
	
	ll_poscol = Pos(ls_syntax,"compute(",ll_poscol+1)
Loop

as_computes = ls_computes

Return li_computes_count

end function

public function string f_get_accessible_name ();return this.AccessibleName
end function

public function string f_get_dataobject ();Return Dataobject
end function

public function integer f_getobjects (ref string rs_objlist[], string vs_objtype, string vs_band, boolean vb_visibleonly);string	ls_ObjString, ls_ObjHolder
integer	li_Start=1, li_Tab, li_Count=0

/* Get the Object String */
ls_ObjString = This.Describe("Datawindow.Objects")

/* Get the first tab position. */
li_Tab =  Pos(ls_ObjString, "~t", li_Start)
Do While li_Tab > 0
	ls_ObjHolder = Mid(ls_ObjString, li_Start, (li_Tab - li_Start))

	// Determine if object is the right type and in the right band
	If (lower(This.Describe(ls_ObjHolder + ".type")) = lower(vs_ObjType) Or vs_ObjType = "*") And &
		(lower(This.Describe(ls_ObjHolder + ".band")) = lower(vs_Band) Or vs_Band = "*") And &
		(This.Describe(ls_ObjHolder + ".visible") = "1" Or Not vb_VisibleOnly) Then
			li_Count ++ 
			rs_ObjList[li_Count] = ls_ObjHolder
	End if

	/* Get the next tab position. */
	li_Start = li_Tab + 1
	li_Tab =  Pos(ls_ObjString, "~t", li_Start)
Loop 

// Check the last object
ls_ObjHolder = Mid(ls_ObjString, li_Start, Len(ls_ObjString))

// Determine if object is the right type and in the right band
If (lower(This.Describe(ls_ObjHolder + ".type")) = lower(vs_ObjType) or vs_ObjType = "*") And &
	(lower(This.Describe(ls_ObjHolder + ".band")) = lower(vs_Band) or vs_Band = "*") And &
	(This.Describe(ls_ObjHolder + ".visible") = "1" Or Not vb_VisibleOnly) Then
		li_Count ++
		rs_ObjList[li_Count] = ls_ObjHolder
End if

Return li_Count
end function

public function integer f_getobjects (ref string rs_objlist[]);Return f_GetObjects ( rs_objlist, "*", "*", FALSE ) 
end function

public function long f_getwidth ();long	ll_Width
long	ll_Return
integer	li_NumObjects
integer	li_Count
long	ll_X
long	ll_ObjWidth
string	ls_Objects[]

// Get the names of all visible objects in the datawindow
li_NumObjects = f_GetObjects(ls_Objects, "*", "*", True)

ll_Return = 0

For li_Count = 1 To li_NumObjects
	// Calculate the x position + the width of each object
	ll_X = Integer(This.Describe(ls_Objects[li_Count] + ".x"))
	ll_ObjWidth = Integer(This.Describe(ls_Objects[li_Count] + ".width"))
	ll_Width = ll_X + ll_ObjWidth

	// Return the rightmost value
	If ll_Width > ll_Return Then
		ll_Return = ll_Width
	End if
Next

Return ll_Return
end function

public function long f_getheight ();Integer	li_Bands, li_Cnt, li_group_level, li_header_cnt, ll_find
long		ll_height
long		ll_detail
String	ls_DWBands, ls_Band[]
c_obj_service lobj_srv

ls_DWBands = This.Describe("DataWindow.Bands")

li_Bands = lobj_srv.f_StringToArray (ls_DWBands, "~t", ls_Band)

For li_Cnt = 1 To li_Bands
	If ls_Band[li_Cnt] <> "detail" Then
		if pos(ls_Band[li_Cnt],'header.')> 0 then
			li_group_level = Integer(mid(ls_Band[li_Cnt], pos(ls_Band[li_Cnt], '.') + 1 ))
			ll_find = this.findgroupchange( 1, li_group_level )
			li_header_cnt = 0
			DO while ll_find > 0
				li_header_cnt++
				ll_find = this.findgroupchange( ll_find+1, li_group_level )
			LOOP 
		else
			li_header_cnt = 1
		end if
		ll_Height += li_header_cnt * Integer(This.Describe("Datawindow." + ls_Band[li_Cnt] + ".Height"))
	End if
Next

ll_Detail = this.rowcount() * Integer(This.Describe("Datawindow.Detail.Height"))

ll_Height += ll_Detail

Return ll_Height
end function

public function any f_getitemany (long al_row, integer ai_column, dwbuffer adw_buffer, boolean ab_orig_value);string ls_columnname 

ls_columnname = This.Describe ( "#" + String( ai_column ) + ".name" )

Return f_GetItemany ( al_row, ls_columnname, adw_buffer, ab_orig_value )
end function

public function any f_getitemany (long al_row, integer ai_column);string ls_columnname 

ls_columnname = This.Describe ( "#" + String( ai_column ) + ".name" )

Return f_GetItemany ( al_row, ls_columnname, Primary!, FALSE )
end function

public function integer f_set_userprofile ();/*==================================
Set thuộc tính cho objects của datawindow
---------------------------------------------------
return (integer): 1 thành công
					: 0 không set
					: -1 lỗi
==================================*/
//string ls_process, ls_ctrlname, ls_visible_01, ls_x, ls_width, ls_fontsize
//int li_idx
//if ids_user_profile.rowcount( ) = 0 then return 0
//if isnull(this.dataobject) or this.dataobject='' then return -1
//ls_process = this.Describe("DataWindow.Processing")
//
//For li_idx = 1 to ids_user_profile.rowcount( )
//	ls_ctrlname = ids_user_profile.getitemstring( li_idx, 'value')
//	ls_visible_01 = ids_user_profile.getitemstring( li_idx, 'visible_01')
//	ls_fontsize = ids_user_profile.getitemstring( li_idx, 'fontsize')
//	// set fontsize
//	string ls_test
//	ls_test = this.modify(ls_ctrlname+'.Font.height='+ ls_fontsize)
//	// set hidden
//	if  pos (is_hidden_col,ls_ctrlname , 1) = 0 then
//		ls_test = this.modify(ls_ctrlname+'.visible='+ ls_visible_01)
//		ls_test = this.modify(ls_ctrlname+'_t.visible='+ ls_visible_01)
//	end if
//	// set x and width
//	if ls_process = '1' and ls_visible_01 = '1' then
//		ls_x = ids_user_profile.getitemstring( li_idx, 'x')
//		ls_width = ids_user_profile.getitemstring( li_idx, 'width')
//		ls_test=	this.modify(ls_ctrlname+'.x='+ ls_x)
//		ls_test=	this.modify(ls_ctrlname+'.width='+ ls_width)
//		ls_test=	this.modify(ls_ctrlname+'_t.x='+ ls_x)
//		ls_test=	this.modify(ls_ctrlname+'_t.width='+ ls_width)	
//	end if
//NEXT
return 1
end function

public function integer f_getddlbvalue (string vs_colname, ref string rsa_value[]);string ls_valstring, ls_values[], ls_datavalue[]
int li_nbr_values, li_idx
c_obj_service lobj_srv
if this.describe(vs_colname+'.Edit.Style') <> 'ddlb' then return -1
ls_valstring = this.describe(vs_colname + ".Values")
li_nbr_values = lobj_srv.f_StringToArray(ls_valstring,"/",ls_values)
FOR li_idx = 1 to li_nbr_values
	rsa_value[li_idx]= mid(ls_values[li_idx], pos(ls_values[li_idx],'~t')+1, len(ls_values[li_idx]))
NEXT
return li_nbr_values
end function

public function integer f_getcolumns_sql (ref string as_columns[]);Integer	li_columns_count
String	ls_syntax,ls_columns[]
Long		ll_poscol,ll_posname

// Get the requestor DW syntax
ls_syntax = this.describe("Datawindow.syntax")
// Check syntax
If IsNull(ls_syntax) or Len(ls_syntax) = 0 Then Return -1

// Parse the syntax for columns
ll_poscol = Pos(ls_syntax,"column=(")
Do While (ll_poscol > 0)
	// Search for the name of the column
	ll_posname = Pos(ls_syntax,"name=",ll_poscol)
	// Advance cursor
	ll_posname = ll_posname + 5
	
	// Increment counter
	li_columns_count ++
	
	// Get the name of the column
	ls_columns[li_columns_count] =Trim(Mid(ls_syntax,ll_posname,Pos(ls_syntax," ",ll_posname)-ll_posname))
	
	// Get next column
	ll_poscol = Pos(ls_syntax,"column=(",ll_poscol+1)
Loop

// Return found columns
as_columns = ls_columns

Return li_columns_count
end function

public function integer f_setzoom (integer ai_zoom);if IsNull(ai_zoom) then 
	return -1
end if

This.object.datawindow.print.preview.zoom = ai_zoom
return 1
end function

public function integer f_getddlbvalue (string vs_colname, ref datastore rds_value);string ls_valstring, ls_values[], ls_datavalue[]
int li_nbr_values, li_idx, li_row
c_obj_service lobj_srv
datastore lds_value

lds_value = create datastore
lds_value.dataobject = 'd_ddlbvalue'

if this.describe(vs_colname+'.Edit.Style') <> 'ddlb' then return -1
ls_valstring = this.describe(vs_colname + ".Values")
li_nbr_values = lobj_srv.f_StringToArray(ls_valstring,"/",ls_values)
FOR li_idx = 1 to li_nbr_values
	li_row = lds_value.insertrow( 0)
	lds_value.setitem( li_row, 1, left(ls_values[li_idx], pos(ls_values[li_idx], '~t') - 1)  )
	lds_value.setitem( li_row, 2, mid(ls_values[li_idx], pos(ls_values[li_idx], '~t')+1)  )
NEXT
rds_value = lds_value
return li_nbr_values
end function

public function integer f_savedefaultvalues ();int li_i, li_cnt, li_exist
string ls_columns[], ls_dataobject, ls_column, ls_value
any la_value

If This.RowCount() = 0 or This.GetRow() = 0 Then Return -1
If This.AcceptText() <> 1 Then Return -1

li_cnt = This.f_getcolumns(ls_columns)
If li_cnt < 1 Then Return -1

ls_dataobject = This.DataObject
For li_i = 1 to li_cnt
	ls_column = ls_columns[li_i]
	la_value = This.f_getitemany(This.GetRow(), ls_column)
	if isnull(la_value) then continue
	ls_value = string(la_value)
	select count(*) into :li_exist 
		from erp_defaultvalues
			where dataobject = :ls_dataobject and dwcolumn = :ls_column and company_id = :gi_user_comp_id and user_id = :gi_userid;
	if li_exist = 0 then
		insert into erp_defaultvalues(dataobject, dwcolumn, value, company_id, user_id)
			values(:ls_dataobject, :ls_column, :ls_value, :gi_user_comp_id, :gi_userid);
	else
		update  erp_defaultvalues
			set value = :ls_value
				where dataobject = :ls_dataobject and dwcolumn = :ls_column and company_id = :gi_user_comp_id and user_id = :gi_userid;
	end if
	if sqlca.sqlcode <> 0 then
		messagebox('Save default values error', sqlca.sqlerrtext)
		rollback;
		return -1
	end if
Next

commit;
return 1
end function

public function integer f_setdefaultvalues ();string ls_dataobject, ls_dwcolumn, ls_value

ls_dataobject = this.DataObject
If IsNull(ls_dataobject) or Len(Trim(ls_dataobject)) = 0 Then Return -1
If This.RowCount() = 0 or This.GetRow() = 0 Then Return -1

declare c1 cursor for
	select dwcolumn, value
		from erp_defaultvalues
			where dataobject = :ls_dataobject and company_id = :gi_user_comp_id and user_id = :gi_userid;
open c1;
fetch c1 into :ls_dwcolumn, :ls_value;
do while sqlca.sqlcode = 0
	this.f_setitem(this.getrow(),ls_dwcolumn,ls_value)
	fetch c1 into :ls_dwcolumn, :ls_value;
loop
close c1;
Return 1
end function

public function integer f_setitem (long al_row, string as_column, string as_value);integer	li_rc
date		ld_val
decimal	ldc_val
double	ldb_val
long		ll_val
real		lr_val
string		ls_string_value
time		ltm_val
c_obj_service lobj_srv

if IsNull (al_row) or IsNull (as_column) then return -1

/*  Determine the datatype of the column and then call the SetItem
	 with proper datatype */

CHOOSE CASE Lower ( Left ( This.Describe ( as_column + ".ColType" ) , 5 ) )

		CASE "char(", "char"		//  CHARACTER DATATYPE
			li_rc = This.SetItem ( al_row, as_column, as_value ) 
	
		CASE "date"			//  DATE DATATYPE
			li_rc = This.SetItem ( al_row, as_column, Date (as_value) ) 

		CASE "datet"		//  DATETIME DATATYPE
			int ll_count
			string ls_datetime[]
			date	ld_rc = 1900-01-01
			time	ltm_rc = 00:00:00.000000
			
			ll_count = lobj_srv.f_StringToArray (as_value, " ", ls_datetime)
			if ll_count <= 0 or ll_count > 3 then
				ld_val = ld_rc
				ltm_val = ltm_rc
			elseif ll_count = 1 then
				ld_val = Date (as_value)
				ltm_val = Time (as_value)
			elseif ll_count = 2 then
				ld_val = Date (ls_datetime[1])
				ltm_val = Time (ls_datetime[2])
			elseif ll_count = 3 then
				ld_val = Date (ls_datetime[1])
				ltm_val = Time (ls_datetime[2]+' '+ls_datetime[3])
			end if
			
			li_rc = This.SetItem (al_row, as_column, DateTime (ld_val, ltm_val))	

		CASE "decim"		//  DECIMAL DATATYPE
			/*  Replace formatting characters in passed string */
			ls_string_value = lobj_srv.f_GlobalReplace (as_value, "$", "" ) 
			ls_string_value = lobj_srv.f_GlobalReplace (ls_string_value, ",", "" ) 
			ls_string_value = lobj_srv.f_GlobalReplace (ls_string_value, "(", "-")
			ls_string_value = lobj_srv.f_GlobalReplace (ls_string_value, ")", "")
			if Pos (ls_string_value, "%") > 0 then
				ls_string_value = lobj_srv.f_GlobalReplace (ls_string_value, "%", "")
				ldc_val = Dec (ls_string_value) / 100
			else
				ldc_val = Dec (ls_string_value)
			end if

			li_rc = This.SetItem ( al_row, as_column, ldc_val) 
	
		CASE "numbe", "doubl"			//  NUMBER DATATYPE	
			/*  Replace formatting characters in passed string */
			ls_string_value = lobj_srv.f_GlobalReplace (as_value, "$", "" ) 
			ls_string_value = lobj_srv.f_GlobalReplace (ls_string_value, ",", "" ) 
			ls_string_value = lobj_srv.f_GlobalReplace (ls_string_value, "(", "-")
			ls_string_value = lobj_srv.f_GlobalReplace (ls_string_value, ")", "")
			if Pos (ls_string_value, "%") > 0 then
				ls_string_value = lobj_srv.f_GlobalReplace (ls_string_value, "%", "")
				ldb_val = Double (ls_string_value) / 100
			else
				ldb_val = Double (ls_string_value)
			end if
						
			li_rc = This.SetItem ( al_row, as_column, ldb_val) 
		
		CASE "real"				//  REAL DATATYPE	
			/*  Replace formatting characters in passed string */
			ls_string_value = lobj_srv.f_GlobalReplace (as_value, "$", "" ) 
			ls_string_value = lobj_srv.f_GlobalReplace (ls_string_value, ",", "" ) 
			ls_string_value = lobj_srv.f_GlobalReplace (ls_string_value, "(", "-")
			ls_string_value = lobj_srv.f_GlobalReplace (ls_string_value, ")", "")
			if Pos (ls_string_value, "%") > 0 then
				ls_string_value = lobj_srv.f_GlobalReplace (ls_string_value, "%", "")
				lr_val = Real (ls_string_value) / 100
			else
				lr_val = Real (ls_string_value)
			end if
						
			li_rc = This.SetItem ( al_row, as_column, lr_val) 
		
		CASE "long", "ulong"		//  LONG/INTEGER DATATYPE	
			/*  Replace formatting characters in passed string */
			ls_string_value = lobj_srv.f_GlobalReplace (as_value, "$", "" ) 
			ls_string_value = lobj_srv.f_GlobalReplace (ls_string_value, ",", "" ) 
			ls_string_value = lobj_srv.f_GlobalReplace (ls_string_value, "(", "-")
			ls_string_value = lobj_srv.f_GlobalReplace (ls_string_value, ")", "")
			if Pos (ls_string_value, "%") > 0 then
				ls_string_value = lobj_srv.f_GlobalReplace (ls_string_value, "%", "")
				ll_val = Long (ls_string_value) / 100
			else
				ll_val = Long (ls_string_value)
			end if
						
			li_rc = This.SetItem ( al_row, as_column, ll_val) 
		
		CASE "time", "times"		//  TIME DATATYPE
			li_rc = This.SetItem ( al_row, as_column, Time ( as_value ) ) 


END CHOOSE

Return li_rc
end function

public function integer f_setitem (long al_row, integer ai_column, string as_value);string ls_columnname

/* Get the Column Name from the Column Number. */
ls_columnname = This.Describe ( "#" + String ( ai_column) + ".Name" ) 

Return f_SetItem ( al_row, ls_columnname, as_value ) 
end function

public function integer f_ole_dw2xls (ref t_dw rdw_report);long ll_numcols , ll_numrows , ll_c , ll_r

OLEObject lole_xlapp , lole_xlsub

int li_ret
string ls_cols[]

// Set the # of columns and rows to process
// Currently Set to copy the entire DW

ll_numcols = rdw_report.f_get_visiblecolumns(ls_cols)
ll_numrows = rdw_report.RowCount()

// Create the oleobject variable xlapp
lole_xlApp = Create OLEObject
this.object.datawindow.groupby
// Connect to Excel and check the return code
li_ret = lole_xlApp.ConnectToNewObject( "Excel.Application" )
if li_ret < 0 then
//MessageBox("Connect to Excel Failed !",string(ret))
return -1
end if
this.object.grg
// Open a particular Excel file
lole_xlApp.Application.Workbooks.Open("c:\file1.xls") //,false,true
// Make Excel visible
//lole_xlApp.Application.Visible = true

// Resolve the Excel reference once
// This technique shortens the script and improves performance
lole_xlsub = lole_xlApp.Application.ActiveWorkbook.Worksheets[1]

// Loop thru the Datawindow and Excel sheet
// The for/next loop copies all rows for each column
For ll_c = 1 to ll_numcols
For ll_r = 1 to ll_numrows
lole_xlsub.cells[ll_r, ll_c] = rdw_report.object.data[ll_r, ll_c]

Next
Next

// Save opened file
//xlApp.Application.Activeworkbook.Save()

// SaveAs a different filename
//xlApp.Application.Activeworkbook.SaveAs("c:\file2.xls")

lole_xlApp.Application.Quit
// clean up
lole_xlApp.DisConnectObject()

Destroy lole_xlsub
Destroy lole_xlApp

return 1
end function

public function integer f_get_visiblecolumns (ref string as_columns[]);
Integer	li_columns_count, li_idx, li_visible_cols, li_x[], li_tmp_x, li_cnt

String ls_columns[], ls_column_temp, ls_computes[]

//--lay column--//
li_columns_count = integer(this.Object.DataWindow.Column.Count)

FOR li_idx = 1 to li_columns_count
	if this.describe( '#'+string(li_idx)+'.x') = '?' then continue
	if this.describe( '#'+string(li_idx)+'.visible') = '0' then continue
	li_visible_cols ++
	if li_visible_cols = 1 then 
		ls_columns[li_visible_cols] = this.describe( '#'+string(li_idx)+'.name')
		li_x[li_visible_cols] = integer(this.describe( '#'+string(li_idx)+'.x'))
	else
		li_tmp_x = integer(this.describe( '#'+string(li_idx)+'.x'))
		ls_column_temp = this.describe( '#'+string(li_idx)+'.name')
		li_cnt = 1
		DO 
			if li_tmp_x > li_x[li_visible_cols - li_cnt] then
				ls_columns[li_visible_cols - li_cnt + 1] = ls_column_temp
				li_x[li_visible_cols - li_cnt + 1] = li_tmp_x
				exit
			else
				ls_columns[li_visible_cols  - li_cnt + 1] = ls_columns[li_visible_cols - li_cnt ]
				li_x[li_visible_cols  - li_cnt + 1]  = li_x[li_visible_cols - li_cnt]
				li_cnt++
			end if 
			if li_cnt = li_visible_cols then
				ls_columns[li_visible_cols  - li_cnt + 1] = ls_column_temp
				li_x[li_visible_cols  - li_cnt + 1]  = li_tmp_x			
			end if
		LOOP while li_cnt < li_visible_cols
	end if
NEXT
//-- lay compute field --//
li_columns_count = this.f_getcomputes(ls_computes[])
FOR li_idx = 1 to li_columns_count
	if this.describe( ls_computes[li_idx] +'.x') = '?' then continue
	if this.describe(ls_computes[li_idx] +'.visible') = '0' then continue
	li_visible_cols ++
	if li_visible_cols = 1 then 
		ls_columns[li_visible_cols] = ls_computes[li_idx]
		li_x[li_visible_cols] = integer(this.describe( ls_computes[li_idx] +'.x'))
	else
		li_tmp_x = integer(this.describe(ls_computes[li_idx]+'.x'))
		ls_column_temp = ls_computes[li_idx] 
		li_cnt = 1
		DO 
			if li_tmp_x > li_x[li_visible_cols - li_cnt] then
				ls_columns[li_visible_cols - li_cnt + 1] = ls_column_temp
				li_x[li_visible_cols - li_cnt + 1] = li_tmp_x
				exit
			else
				ls_columns[li_visible_cols - li_cnt + 1] = ls_columns[li_visible_cols - li_cnt ]
				li_x[li_visible_cols - li_cnt + 1]  = li_x[li_visible_cols - li_cnt] 
				li_cnt++
			end if 
			if li_cnt = li_visible_cols then
				ls_columns[li_visible_cols  - li_cnt + 1] = ls_column_temp
				li_x[li_visible_cols  - li_cnt + 1]  = li_tmp_x			
			end if	
		LOOP while li_cnt < li_visible_cols
	end if
NEXT
as_columns = ls_columns
Return li_visible_cols

end function

public function integer f_getobjects (ref string rs_objlist[], string vs_objtype, string vs_band, string vs_tag);string lsa_objlist[], lsa_tags[]
integer	li_i =1, li_j, li_Count=0, li_grp
c_obj_service lc_obj_service

if this.f_getobjects( lsa_objlist, vs_objtype, vs_band, true) > 0 then
	lc_obj_service.f_stringtoarray( vs_tag, ';', lsa_tags)
	FOR li_i = 1 to upperbound(lsa_objlist)
		FOR li_j = 1 to upperbound(lsa_tags)
			if lower(lsa_tags[li_j]) = lower(this.describe(lsa_objlist[li_i]+'.tag')) then
				li_Count++
				rs_objlist[li_Count] = lsa_objlist[li_i]
				if lower(lsa_tags[li_j]) = 'g1' then li_grp =1
				if lower(lsa_tags[li_j]) = 'g2' then li_grp =2
				if lower(lsa_tags[li_j]) = 'g3' then li_grp =3
				if lower(lsa_tags[li_j]) = 'g4' then li_grp =4
				if lower(lsa_tags[li_j]) = 'g5' then li_grp =5
				if lower(lsa_tags[li_j]) = 'g6' then li_grp =6
				if lower(lsa_tags[li_j]) = 'g7' then li_grp =7
				if lower(lsa_tags[li_j]) = 'g7' then li_grp =8
				if lower(lsa_tags[li_j]) = 'g9' then li_grp =9
				if lower(lsa_tags[li_j]) = 'g10' then li_grp =10
			end if						
		NEXT
	NEXT
end if

Return li_grp
end function

public function integer f_getobjects_sort_xy (ref string as_columns[50, 100], string vs_objtype, string vs_band);
Integer	li_columns_count, li_idx, li_visible_cols, li_x[], li_y[], li_tmp_x, li_tmp_y, li_cnt
long ll_row, ll_col
String lsa_objects[], ls_column_temp, lsa_objects_sort[50, 100]

//--lay objects--//
li_columns_count = this.f_getobjects( lsa_objects[], '*', vs_band, true)

FOR li_idx = 1 to li_columns_count
	if this.describe(  lsa_objects[li_idx] +'.x') = '?' then continue
	if this.describe(  lsa_objects[li_idx] +'.y') = '?' then continue

	li_visible_cols ++
	if li_visible_cols = 1 then
		ll_row = li_visible_cols
		ll_col = li_visible_cols
		lsa_objects_sort[ll_row, ll_col] = this.describe( lsa_objects[li_idx] +'.name')
		li_x[ll_col] = integer(this.describe(  lsa_objects[li_idx] +'.x'))
		li_y[ll_row] = integer(this.describe(  lsa_objects[li_idx] +'.y'))
	else
		li_tmp_x = integer(this.describe(  lsa_objects[li_idx] +'.x'))
		li_tmp_y = integer(this.describe(  lsa_objects[li_idx] +'.y'))
		ls_column_temp = this.describe(  lsa_objects[li_idx] +'.name')
		li_cnt = 1
//		DO 
//			if li_tmp_x > li_x[li_visible_cols - li_cnt] + 8 then
//				ll_col = li_visible_cols - li_cnt + 1
//				li_x[ll_col] = li_tmp_x
//				exit
//			elseif li_tmp_x < li_x[li_visible_cols - li_cnt] - 8 then
////				ls_columns[li_visible_cols  - li_cnt + 1] = ls_columns[li_visible_cols - li_cnt ]
//				lsa_objects_sort[ll_row, ll_col + li_cnt] = lsa_objects_sort[ll_row, ll_col]
//				li_x[li_visible_cols  - li_cnt + 1]  = li_x[li_visible_cols - li_cnt]
//				li_cnt++
//			end if 
//			if li_cnt = li_visible_cols then
//				li_x[li_visible_cols  - li_cnt + 1]  = li_tmp_x			
//			end if
//		LOOP while li_cnt < li_visible_cols
//		
		
	end if
NEXT
////-- lay compute field --//
//li_columns_count = this.f_getcomputes(ls_computes[])
//FOR li_idx = 1 to li_columns_count
//	if this.describe( ls_computes[li_idx] +'.x') = '?' then continue
//	if this.describe(ls_computes[li_idx] +'.visible') = '0' then continue
//	li_visible_cols ++
//	if li_visible_cols = 1 then 
//		ls_columns[li_visible_cols] = ls_computes[li_idx]
//		li_x[li_visible_cols] = integer(this.describe( ls_computes[li_idx] +'.x'))
//	else
//		li_tmp_x = integer(this.describe(ls_computes[li_idx]+'.x'))
//		ls_column_temp = ls_computes[li_idx] 
//		li_cnt = 1
//		DO 
//			if li_tmp_x > li_x[li_visible_cols - li_cnt] then
//				ls_columns[li_visible_cols - li_cnt + 1] = ls_column_temp
//				li_x[li_visible_cols - li_cnt + 1] = li_tmp_x
//				exit
//			else
//				ls_columns[li_visible_cols - li_cnt + 1] = ls_columns[li_visible_cols - li_cnt ]
//				li_x[li_visible_cols - li_cnt + 1]  = li_x[li_visible_cols - li_cnt] 
//				li_cnt++
//			end if 
//			if li_cnt = li_visible_cols then
//				ls_columns[li_visible_cols  - li_cnt + 1] = ls_column_temp
//				li_x[li_visible_cols  - li_cnt + 1]  = li_tmp_x			
//			end if	
//		LOOP while li_cnt < li_visible_cols
//	end if
//NEXT
//as_columns = ls_columns
Return li_visible_cols

end function

public function string f_getpriorcolumn (boolean ab_editableonly);//	Arguments:
//	  ab_editableonly:True -> Only take into account columns that can be modified.
//							False -> Take all columns into account (even protected ones).
//
//	Returns:	String
//	  Name of the  column prior to the current column (empty string if an error occured).

String			ls_columns[],ls_protect, ls_visible, ls_name,ls_displayonly
Integer			li_i,li_max, li_priorcolumn , li_pos, ll_cnt_noedit
Integer			li_taborder, li_priortaborder = 999999, li_currenttaborder
//c_obj_service		lc_obj_srv

If IsNull(ab_editableonly) Then Return ""

//lc_obj_srv.f_stringtoarray(is_noedit_colname, ';',ls_noedit_colname[])
li_currenttaborder = Long(this.describe(this.getcolumnName( ) + ".TabSequence"))
li_priortaborder = 10
li_max = this.f_GetColumns(ls_columns)

For li_i=1 To li_max
	li_taborder = Long(this.describe(ls_columns[li_i] + ".TabSequence"))
	if li_taborder >= li_currenttaborder then continue
	If ab_editableonly Then
		ls_visible = this.describe(ls_columns[li_i] + ".Visible")
		li_pos = Pos(ls_visible,"~t")
		If li_pos > 0 Then
			ls_visible = this.describe("Evaluate(~'" + Mid(ls_visible,li_pos +1, &
				(Len(ls_visible) - li_pos -1)) + "~'," + String(this.GetRow()) + ")")
		End If
		
		If ls_visible = "1" Then
			ls_protect = this.describe(ls_columns[li_i] + ".Protect")
			li_pos = Pos(ls_protect,"~t")
			If li_pos > 0 Then
				ls_protect = this.describe("~"Evaluate(~'" + Mid(ls_protect,li_pos +1, (Len(ls_protect) - li_pos -1)) + "~'," + String(this.GetRow()) + ")~"")
			End If
		End If
	End If

	ls_displayonly ='no'	
//	FOR ll_cnt_noedit = 1 to upperbound(is_noedit_colname[])
//		if is_noedit_colname[ll_cnt_noedit] = ls_columns[li_i] then
//			ls_displayonly = 'yes'
//			exit
//		end if
//	NEXT
	
	If (not ab_editableonly or (ls_visible = "1" and (ls_protect = "0" or ls_protect = "!" ) and li_taborder > 0 and ls_displayonly = 'no' )) &
		and (li_taborder <= li_currenttaborder - 10 and li_taborder > li_priortaborder ) Then
		li_priortaborder = li_taborder
		li_priorcolumn = li_i
	End If
	
	If li_priortaborder = li_currenttaborder - 10 Then Return ls_columns[li_priorcolumn]
Next

If li_priorcolumn > 0 Then
	Return ls_columns[li_priorcolumn]
End If

Return ""


end function

public function string f_getnextcolumn (boolean ab_editableonly);//	Arguments:
//	  ab_editableonly:True -> Only take into account columns that can be modified.
//							False -> Take all columns into account (even protected ones).
//
//	Returns:	String
//	  Name of the  column next to the current column (empty string if an error occured).

String			ls_columns[],ls_protect, ls_visible, ls_name,ls_displayonly, ls_noedit_colname[]
Integer			li_i,li_max, li_nextcolumn , li_pos, ll_cnt_noedit
Integer			li_taborder, li_nexttaborder = 999999, li_currenttaborder
//c_obj_service		lc_obj_srv

If IsNull(ab_editableonly) Then Return ""

//lc_obj_srv.f_stringtoarray(is_noedit_colname, ';',ls_noedit_colname[])
li_currenttaborder = Long(this.describe(this.getcolumnName( ) + ".TabSequence"))
li_nexttaborder = li_currenttaborder + 10000
li_max = this.f_GetColumns(ls_columns)

For li_i=1 To li_max
	li_taborder = Long(this.describe(ls_columns[li_i] + ".TabSequence"))
	if li_taborder <= li_currenttaborder then continue
	If ab_editableonly Then
		ls_visible = this.describe(ls_columns[li_i] + ".Visible")
		li_pos = Pos(ls_visible,"~t")
		If li_pos > 0 Then
			ls_visible = this.describe("Evaluate(~'" + Mid(ls_visible,li_pos +1, &
				(Len(ls_visible) - li_pos -1)) + "~'," + String(this.GetRow()) + ")")
		End If
		
		If ls_visible = "1" Then
			ls_protect = this.describe(ls_columns[li_i] + ".Protect")
			li_pos = Pos(ls_protect,"~t")
			If li_pos > 0 Then
				ls_protect = this.describe("~"Evaluate(~'" + Mid(ls_protect,li_pos +1, (Len(ls_protect) - li_pos -1)) + "~'," + String(this.GetRow()) + ")~"")
			End If
		End If
	End If

	ls_displayonly ='no'	
//	FOR ll_cnt_noedit = 1 to upperbound(is_noedit_colname[])
//		if is_noedit_colname[ll_cnt_noedit] = ls_columns[li_i] then
//			ls_displayonly = 'yes'
//			exit
//		end if
//	NEXT
	
	If (not ab_editableonly or (ls_visible = "1" and (ls_protect = "0" or ls_protect = "!" ) and li_taborder > 0 and ls_displayonly = 'no' )) &
		and (li_taborder >= li_currenttaborder + 10 and li_taborder < li_nexttaborder ) Then
		li_nexttaborder = li_taborder
		li_nextcolumn = li_i
	End If
	
	If li_nexttaborder = li_currenttaborder + 10 Then Return ls_columns[li_nextcolumn]
Next

If li_nextcolumn > 0 Then
	Return ls_columns[li_nextcolumn]
End If

Return ""


end function

public function integer f_setnextcolumn (boolean ab_editableonly);//	Arguments:
//	  ab_editableonly:True -> Only take into account columns that can be modified.
//							False -> Take all columns into account (even protected ones).
//
//	Returns:	integer (1 succeed, -1 error)
//	  Name of the  column next to the current column (empty string if an error occured).

if isnull( ab_editableonly) then return -1
if this.f_getnextcolumn(ab_editableonly) = "" then return -1
this.setcolumn( this.f_getnextcolumn(ab_editableonly) )
return 1
end function

public function integer f_setpriorcolumn (boolean ab_editableonly);//	Arguments:
//	  ab_editableonly:True -> Only take into account columns that can be modified.
//							False -> Take all columns into account (even protected ones).
//
//	Returns:	integer (1 succeed, -1 error)
//	  Name of the  column next to the current column (empty string if an error occured).

if isnull( ab_editableonly) then return -1
if this.f_getpriorcolumn(ab_editableonly) = "" then return -1
this.setcolumn( this.f_getpriorcolumn(ab_editableonly) )
return 1
end function

public subroutine f_set_readonly (boolean vb_readonly, boolean vb_query_mode);int li_cols, li_idx, li_processing
string a, ls_type, ls_colname
window lw_parent

If IsNull(This.DataObject) or This.DataObject = '' Then Return 
this.f_getparentwindow( lw_parent)

li_cols = integer(this.Describe("DataWindow.Column.Count")) 
if vb_query_mode = true then
	FOR li_idx = 1 to li_cols
		ls_type = this.describe( "#"+string(li_idx)+".edit.style")
		ls_colname = this.describe( "#"+string(li_idx)+".name")
		if ls_type = '?' then continue
		if ls_type = 'edit'  then
			if vb_readonly   then 
				a=this.modify("#"+string(li_idx)+".edit.DisplayOnly='yes'")
			else
				a=this.modify("#"+string(li_idx)+".edit.DisplayOnly='no'")
			end if		
		else
			if vb_readonly then
				a=this.modify("#"+string(li_idx)+".protect=1")				
				this.modify("#"+string(li_idx)+".background.color='"+string(lw_parent.backcolor)+"'")
			else
				a=this.modify("#"+string(li_idx)+".protect=0")
				this.modify("#"+string(li_idx)+".background.color='"+string(this.object.datawindow.color)+"'")
			end if				
		end if
	NEXT			
else
	FOR li_idx = 1 to li_cols
		ls_type = this.describe( "#"+string(li_idx)+".edit.style")
		ls_colname = this.describe( "#"+string(li_idx)+".name")
		if ls_type = '?' then continue
		if ls_type = 'edit'  then
			if vb_readonly then 
				a=this.modify("#"+string(li_idx)+".edit.DisplayOnly='yes'")
			else
				a=this.modify("#"+string(li_idx)+".edit.DisplayOnly='no'")
			end if		
		else
			if vb_readonly then  
				a=this.modify("#"+string(li_idx)+".protect=1")				
				this.modify("#"+string(li_idx)+".background.color='"+string(lw_parent.backcolor)+"'")
			else
				a=this.modify("#"+string(li_idx)+".protect=0")
				this.modify("#"+string(li_idx)+".background.color='"+string(this.object.datawindow.color)+"'")
			end if				
		end if
	NEXT				
end if

end subroutine

protected function integer f_openprimarywindow (string vs_colname, string vs_winname, string vs_opentype);/*vs_opentype: ?: open normal
					+: open to addnew
					*: open window with data
*/
string ls_window_name, ls_value, ls_find, ls_data, ls_primary_col
int li_rt , li_pos
/*
t_w_main lw_opened, lw_parent

If IsNull(vs_colname) Then Return -1
li_pos = Pos('?+*', vs_opentype)
If li_pos = 0 Then Return -1
Try
	Select windowname, PRIMARY_COLNAME into :ls_window_name, :ls_primary_col
		From erp_primary_window 
			Where dwcolname = :vs_colname and nvl(window_click, :vs_winname) = :vs_winname;
	If SQLCA.SQLCode <> 0 or len(Trim(ls_window_name)) = 0 Then Return -1
//	bamboo-100.ib_has_rtn_btn= true
	This.f_getparentwindow( lw_parent)
	li_rt = OpenSheet(lw_opened, ls_window_name, t_w_mdi, 0, layered!)
	If li_rt = -1 Then Return -1	
	lw_opened.iw_parent = lw_parent
	lw_parent.Enabled = false
	lw_opened.ib_child = true
	lw_opened.is_primary_colname = ls_primary_col
	lw_opened.is_primary_opentype = vs_opentype
	t_dw_mpl ldw_master
	ldw_master= lw_opened.idw_focus.f_getdwmaster( )

	lw_opened.post f_set_idwfocus(ldw_master)
	If vs_opentype = '*' Then	
		If This.RowCount() > 0 Then
			ls_value = This.GetItemString(This.GetRow(),vs_colname)
			ls_find = vs_colname + " = '" + ls_value + "'"
			li_pos = lw_opened.idw_focus.Find(ls_find, 1, lw_opened.idw_focus.RowCount())
			If li_pos > 0 Then lw_opened.idw_focus.ScrollToRow(li_pos)
			
		End If
	Else
		If vs_opentype = '+' Then
	
			lw_opened.post event e_add()
		End If
	End If
	
				
catch (RuntimeError e)
	OpenWithParm(c_w_err,e.text)
End Try
*/
return 1
end function

protected function integer f_openprimarywindow (string vs_colname, string vs_opentype, string vs_window_click, string vs_datawindow_click);/*vs_opentype: ?: open normal
					+: open to addnew
					*: open window with data
*/
string ls_window_name, ls_value, ls_find, ls_data, ls_primary_col
int li_rt , li_pos
/*
t_w_main lw_opened, lw_parent

If IsNull(vs_colname) Then Return -1
li_pos = Pos('?+*', vs_opentype)
If li_pos = 0 Then Return -1
Try
	DECLARE Emp_drill_down  CURSOR FOR
	Select   t.PRIMARY_COLNAME , t.WINDOWNAME
	 From erp_primary_window t  
	Where trim(dwcolname) = trim(:vs_colname) and  nvl(trim(window_click), :vs_window_click) = trim(:vs_window_click) 
	and t.CUST_CHAR_01 =:vs_datawindow_click  
	and nvl(t.cust_char_06,'N') ='Y';
	 open Emp_drill_down;
	 fetch Emp_drill_down into :ls_primary_col , :ls_window_name;
	 close Emp_drill_down;		
	If SQLCA.SQLCode <> 0 or len(Trim(ls_window_name)) = 0 Then Return -1
//	bamboo-100.ib_has_rtn_btn= true
	This.f_getparentwindow( lw_parent)
	li_rt = OpenSheet(lw_opened, ls_window_name, t_w_mdi, 0, layered!)
	If li_rt = -1 Then Return -1	
	lw_opened.iw_parent = lw_parent
	lw_parent.Enabled = false
	lw_opened.ib_child = true
	lw_opened.is_primary_colname = ls_primary_col
	lw_opened.is_primary_opentype = vs_opentype
	t_dw_mpl ldw_master
	ldw_master= lw_opened.idw_focus.f_getdwmaster( )

	lw_opened.post f_set_idwfocus(ldw_master)
	If vs_opentype = '*' Then	
		If This.RowCount() > 0 Then
			ls_value = This.GetItemString(This.GetRow(),vs_colname)
			ls_find = vs_colname + " = '" + ls_value + "'"
			li_pos = lw_opened.idw_focus.Find(ls_find, 1, lw_opened.idw_focus.RowCount())
			If li_pos > 0 Then lw_opened.idw_focus.ScrollToRow(li_pos)
			
		End If
	Else
		If vs_opentype = '+' Then	
			lw_opened.post event e_add()
		End If
	End If
	
				
catch (RuntimeError e)
	OpenWithParm(c_w_err,e.text)
End Try
*/
return 1
end function

public function integer f_openprimarywindow (string vs_colname, string vs_opentype);/*vs_opentype: ?: open normal
					+: open to addnew
					*: open window with data
*/
string ls_window_name, ls_value, ls_find, ls_data, ls_primary_col
int li_rt , li_pos
/*
t_w_main lw_opened, lw_parent

If IsNull(vs_colname) Then Return -1
li_pos = Pos('?+*', vs_opentype)
If li_pos = 0 Then Return -1
Try
	Select windowname, PRIMARY_COLNAME into :ls_window_name, :ls_primary_col
		From erp_primary_window 
			Where dwcolname = :vs_colname;
	If SQLCA.SQLCode <> 0 or len(Trim(ls_window_name)) = 0 Then Return -1
//	bamboo-100.ib_has_rtn_btn= true
	This.f_getparentwindow( lw_parent)
	li_rt = OpenSheet(lw_opened, ls_window_name, t_w_mdi, 0, layered!)
	If li_rt = -1 Then Return -1	
	lw_opened.iw_parent = lw_parent
	lw_parent.Enabled = false
	lw_opened.ib_child = true
	lw_opened.is_primary_colname = ls_primary_col
	lw_opened.is_primary_opentype = vs_opentype
	t_dw_mpl ldw_master
	ldw_master= lw_opened.idw_focus.f_getdwmaster( )

	lw_opened.post f_set_idwfocus(ldw_master)
	If vs_opentype = '*' Then	
		If This.RowCount() > 0 Then
			ls_value = This.GetItemString(This.GetRow(),vs_colname)
			ls_find = vs_colname + " = '" + ls_value + "'"
			li_pos = lw_opened.idw_focus.Find(ls_find, 1, lw_opened.idw_focus.RowCount())
			If li_pos > 0 Then lw_opened.idw_focus.ScrollToRow(li_pos)
			
		End If
	Else
		If vs_opentype = '+' Then
	
			lw_opened.post event e_add()
		End If
	End If
	
				
catch (RuntimeError e)
//	OpenWithParm(c_w_err,e.text)
End Try
*/
return 1
end function

public function integer f_get_enter_process_col (ref string rs_colname);/*****************************************************************
Chức năng: lấy tên cột đã được cài đặt xử lý khi bấm enter
-----------------
Tham số:	
	rs_colname: tham số reference chưa tên cột trả về
----------------
Return:
	1 : thành công
	-1: lỗi
====================================================*/
string			ls_dwobject

if not isvalid(this) then return -1

ls_dwobject = this.dataobject
SELECT enter_process_col 
   INTO :rs_colname
   FROM DWCOLUMN_SETUP
WHERE DWOBJECT = :ls_dwobject
	AND COMPANY_ID = :gi_user_comp_id;

return sqlca.sqlcode

end function

public function boolean f_getcol_noedit (string as_arraycol[], string as_col);return true
end function

public function long f_getheight_4visible_rows ();Integer	li_Bands, li_Cnt
long		ll_height
long		ll_detail, ll_firstrow, ll_lastrow
String	ls_DWBands, ls_Band[]
c_obj_service lobj_srv

ls_DWBands = This.Describe("DataWindow.Bands")

li_Bands = lobj_srv.f_StringToArray (ls_DWBands, "~t", ls_Band)

For li_Cnt = 1 To li_Bands
	If ls_Band[li_Cnt] <> "detail" Then
		ll_Height += Integer(This.Describe("Datawindow." + &
							ls_Band[li_Cnt] + ".Height"))
	End if
Next

ll_firstrow =	long(this.Describe("DataWindow.FirstRowOnPage"))
ll_lastrow =	long(this.Describe("DataWindow.LASTRowOnPage"))

ll_Detail = (ll_lastrow - ll_firstrow +1) * Integer(This.Describe("Datawindow.Detail.Height"))

ll_Height += ll_Detail

Return ll_Height
end function

public function integer f_send_message_to_object (ref powerobject rpm_handling, string vs_message);int 					li_rtn
powerobject		lpo_handling
window				lw_display

if this.f_getparentwindow( lw_display) = 1 then
	lpo_handling = lw_display.dynamic f_get_obj_handling()
	if isvalid(lpo_handling) then
		return lpo_handling.dynamic f_handle_message(rpm_handling, vs_message)
	end if
end if
return -1

end function

public function integer f_get_colname_in_taborder (ref string ras_colname_in_taborder[]);int				li_colCount, li_counter, li_tabseq, li_row
string			las_colname[]
datastore	lds_colname_in_taborder

lds_colname_in_taborder = create datastore
lds_colname_in_taborder.dataobject = 'ds_colname_in_taborder'
li_colCount = this.f_getcolumns(las_colname[])
FOR li_counter = 1 to li_colCount
	li_tabseq = integer(this.describe( las_colname[li_counter]+".tabsequence" ))
	li_row = lds_colname_in_taborder.insertrow( 0)
	lds_colname_in_taborder.setitem( li_row, 'colname', las_colname[li_counter])
	lds_colname_in_taborder.setitem( li_row, 'tabsequence', li_tabseq)
NEXT
lds_colname_in_taborder.setsort( "tabsequence asc" )
lds_colname_in_taborder.sort( )
ras_colname_in_taborder[] = lds_colname_in_taborder.object.colname.primary

return li_colCount
end function

public function integer f_build_dwofilter ();
c_obj_service		lc_obj_service
int						li_colCount, li_idx, li_filter_header
string 				ls_colname[], ls_rtn, ls_x, ls_y, ls_text_name, ls_modify, ls_colType


li_colCount = this.f_get_colname_in_taborder(ls_colname[])
FOR li_idx = 1 to li_colCount
	if ls_colname[li_idx] = 'gutter' then continue
	ls_colType = this.describe( ls_colname[li_idx] + ".ColType")
	if lower(left(ls_colType,5)) = 'decim'  or lower(left(ls_colType,5)) = 'numbe' or lower(left(ls_colType,5)) = 'date' or lower(left(ls_colType,5)) = 'datet' then
		ls_x = this.describe( ls_colname[li_idx] + ".x")
		ls_y = this.describe( ls_colname[li_idx] + ".y")
		ls_text_name = "t_" + ls_colname[li_idx]
		ls_modify += ' create text(band=foreground alignment="2" text="=" border="0" color="33554432" x="'+ls_x+'" y="'+ls_y+'" height="76" width="101" html.valueishtml="0"  name='+ls_text_name+' visible="1"  font.face="Tahoma" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="17029116" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )'		
	end if
NEXT
ls_rtn = this.modify(ls_modify)
return 1
end function

public function string f_get_filterstring ();string			ls_filterString, ls_colname[], ls_colType, ls_data, ls_operator,ls_value,ls_text,ls_data1
string			ls_rtn,ls_ref_expression,ls_ref_data,ls_ref_format,ls_editType
int				li_idx, li_colCnt,li_i
boolean		lb_isnumber = true
c_string		lc_string


li_colCnt = this.f_getcolumns(ls_colname[] )

FOR li_idx = 1 to li_colCnt
	if ls_colname[li_idx] = 'gutter' then continue
	ls_colType = this.describe(ls_colname[li_idx]+ ".colType")
	ls_editType = this.describe(ls_colname[li_idx] + ".Edit.Style")
	If left(ls_colType,5) = 'char(' then
		if this.getcolumnname( ) = ls_colname[li_idx] then
			if ls_editType = 'ddlb' then
				ls_data = lower(trim(this.gettext( )))
				ls_data = this.f_get_data_value_ddlb( ls_data, ls_colname[li_idx])
			else
				ls_data = lower(trim(this.gettext( )))
			end if
		else
			if ls_editType = 'ddlb' then
				ls_data = lower(trim(this.getitemstring( 1, ls_colname[li_idx])))
				ls_data = this.f_get_data_value_ddlb( ls_data, ls_colname[li_idx])
			else
				ls_data = lower(trim(this.getitemstring( 1, ls_colname[li_idx])))
			end if
		end if
		if isnull(ls_data) or ls_data = '' or ls_data = "'" then continue
		if len(ls_data) = 1 and (ls_data = '*' or ls_data = '=') then ls_data = '' 
		if ls_filterString <> '' then ls_filterString += " and "
		ls_filterString += lc_string.f_get_expression( ls_data, ls_colType,ls_colname[li_idx], 'filter')
		
	elseif left(ls_colType,5) = 'numbe' or  left(ls_colType,5) = 'decim' then
		if this.describe(ls_colname[li_idx]+ "_qm.x") = '!' then
			if this.getcolumnname( ) = ls_colname[li_idx] then
				ls_data = trim(this.gettext( ))
			else		
				if  this.describe(ls_colname[li_idx] + "_filter.x") <> "!" then
					ls_data = this.describe( ls_colname[li_idx] + '_filter.text' )
				else
					ls_data = ''
				end if
			end if
		else
			ls_data = this.describe(ls_colname[li_idx]+ "_qm.text")
		end if
		if isnull(ls_data) or ls_data = '' then continue
		ls_data1 = ls_data
		if ls_filterString <> '' then ls_filterString += " and "
		
		ls_filterString += lc_string.f_get_expression( ls_data1, ls_colType,ls_colname[li_idx], 'filter')
		
	elseif left(ls_colType,5) = 'date' or  left(ls_colType,5) = 'datet' then
		if this.describe(ls_colname[li_idx]+ "_qm.x") = '!' then
			if this.getcolumnname( ) = ls_colname[li_idx] then
				ls_data = trim(this.gettext( ))
			else		
				if  this.describe(ls_colname[li_idx] + "_filter.x") <> "!" then
					ls_data = this.describe( ls_colname[li_idx] + '_filter.text' )
				else
					ls_data = ''
				end if
			end if
		else
			ls_data = this.describe(ls_colname[li_idx]+ "_qm.text")
		end if
		if isnull(ls_data) or ls_data = '' then continue
		if ls_filterString <> '' then ls_filterString += " and "
		ls_filterString += lc_string.f_get_expression( ls_data, ls_colType,ls_colname[li_idx], 'filter')
	end if
NEXT 

return ls_filterString
end function

public function integer f_getcurrentsql (ref string rs_originalsql_nowhere, ref string rs_whereclause);
c_obj_service			lc_obj_service
c_sql						lc_sql
t_s_sql_attr				lstr_sql_attr[]
string						ls_originalSQL

//-- Save the SQL select statement --//
ls_originalSQL = this.describe("Datawindow.Table.Select")

//-- Check for errors --//
If IsNull(ls_originalSQL) or Len(ls_originalSQL) = 0 Then
	Return -1
End If

//-- Prepare original SQL to be re-used in a modify DW function --//
ls_originalSQL = lc_obj_service.f_GlobalReplace(ls_originalSQL,"'","~~'")

//-- //
lc_sql.f_parse( ls_originalSQL, lstr_sql_attr[])
rs_whereclause = lstr_sql_attr[1].s_where
lstr_sql_attr[1].s_where = ''
rs_originalsql_nowhere = lc_sql.f_assemble(  lstr_sql_attr[])

Return 1

end function

public function integer f_get_originalsql (ref string rs_originalsql_nowhere, ref string rs_originalwhereclause);rs_originalSQL_nowhere = is_originalSQL_NoWhere
rs_originalWhereclause = is_originalwhereClause
return 1
end function

public function integer f_set_originalsql (string vs_originalsql_nowhere, string vs_originalwhereclause); is_originalSQL_NoWhere = vs_originalSQL_nowhere
 is_originalwhereClause = vs_originalWhereclause 
return 1
end function

public function integer f_set_filterctrlvalue (string vs_colname, string vs_data);String			ls_rc,ls_text,ls_bgcolor,ls_colType
Integer			li_pos
c_obj_service	lc_obj_ser

If IsNull(vs_colname) or Len(vs_colname) = 0 Then Return -1
ls_colType = this.describe( vs_colname + ".ColType")
If left(ls_colType,5) <> 'char(' then
	// Get text to display in the Filter control
	If IsNull(vs_data) Then
		ls_text = ""
	Else
		ls_text = vs_data
	End If
	
	// Check if Filter control already exists
	If this.Describe(vs_colname + "_filter.x") = "!" Then
		// Get background color of the column or background color of the DW,
		// if the column is transparent
		If this.describe(vs_colname + ".Background.Mode") <> "1" Then
			ls_bgcolor = this.describe(vs_colname + ".Background.Color")
		Else
			ls_bgcolor = this.describe("Datawindow.Color")
		End If
		
		// Create the Filter control
		ls_rc = this.Modify(&
		"create text(band="+ this.describe(vs_colname+".Band") &
			+ " color=~""+ lc_obj_ser.f_GlobalReplace(this.describe(vs_colname+".Color"),"~"","") +"~"" &
			+ " alignment=~""+ this.describe(vs_colname+".Alignment") +"~"" &
			+ " border=~""+ lc_obj_ser.f_GlobalReplace(this.describe(vs_colname+".Border"),"~"","") +"~"" &
			+ " x=~""+ lc_obj_ser.f_GlobalReplace(this.describe(vs_colname+".X"),"~"","") +"~"" &
			+ " y=~""+ lc_obj_ser.f_GlobalReplace(this.describe(vs_colname+".Y"),"~"","") +"~"" &
			+ " height=~""+ lc_obj_ser.f_GlobalReplace(this.describe(vs_colname+".height"),"~"","") +"~"" &
			+ " width=~""+ lc_obj_ser.f_GlobalReplace(this.describe(vs_colname+".width"),"~"","") +"~"" &
			+ " text=~""+ ls_text +"~" name="+ vs_colname + "_filter" &
			+ " font.face=~"Tahoma~" font.height=~"-9~" font.weight=~"400~"" &
			+ "font.family=~"2~" font.pitch=~"2~" font.charset=~"0~"" &
			+ "background.mode=~"0~" background.color=~""+ lc_obj_ser.f_GlobalReplace(ls_bgcolor,"~"","") +"~")")
		
	Else
		// Update Filter control's text
		ls_rc = this.modify(vs_colname + "_filter.text=~'" + ls_text + "~'")
	
	End If
end if

Return 1
end function

public function integer f_add_where (string vs_columns, any va_data[]);string					ls_currentSQL, ls_currentWhere, ls_rtn, las_columns[], ls_colType, ls_modify, ls_dbname, ls_value
int						li_colCount, li_idx
c_dwservice			lc_dwservice
c_sql					lc_sql
c_string				lc_string

if this.dynamic f_getcurrentSQL( ls_currentSQL, ls_currentWhere) =1 then
	li_colCount = lc_string.f_stringtoarray( vs_columns,';', las_columns[])
	FOR li_idx =1 to li_colCount
		ls_dbname =  las_columns[li_idx]
		if lc_dwservice.f_get_build_column( this,ls_dbname, ls_colType) = -1 then
			return -1			
		end if

		if ls_currentWhere <> '' then ls_currentWhere += ' AND '
		ls_currentWhere += lc_string.f_get_expression( string(va_data[li_idx] ), ls_colType, ls_dbname, 'build where')		
	NEXT

	lc_sql.f_addtowhereclause( ls_currentSQL, ls_currentWhere, " AND ")
	ls_modify = "Datawindow.Table.Select= '" + ls_currentSQL +"'"
	ls_rtn =this.modify(ls_modify )
	if ls_rtn <> '' then
		gf_messagebox('m.t_dw.f_add_where.01','Thông báo','Lỗi t_dw.f_add_where: line 29: (@'+ this.dataobject+'@)', 'exclamation','ok',1)
		return -1
	end if
end if		
	
return 1
end function

public function integer f_send_message_to_object (ref datawindow vdw_focus, long vl_currentrow, string vs_message);int 					li_rtn
s_object_display	lpo_handling
window				lw_display

if this.f_getparentwindow( lw_display) = 1 then
	lpo_handling = lw_display.dynamic f_get_obj_handling()
	if isvalid(lpo_handling) then
		return lpo_handling.f_handle_message(vdw_focus, vl_currentrow, vs_message)
	end if
end if
return -1
end function

public function integer f_setup_user_access ();
//-- Kiểm tra user có quyềnn mở đối tượng ko ? --//

//-- Tạo đối tượng --//

//-- open window --

return 1
end function

public function integer f_set_properties ();string					las_object[], ls_rtn, ls_coltype, ls_sortString, ls_idKey_code, ls_menu_code
string					ls_modstring, ls_dwdatatype, ls_dwdatatype_str, ls_dwo, ls_colname, lsa_colsort[], ls_findStr
int						li_colCnt, li_idx, li_rtn, li_sort_priority
long					ll_row_found
boolean				lb_report
c_string				lc_string
window				lw_parent	
s_object_display	lod_handle
s_str_policy_attr	lstr_rule_attr, lstr_security_attr

if this.dataobject =  '' then return -1
this.setredraw( false)

if this.f_getparentwindow( lw_parent)=1 then
	lod_handle = lw_parent.dynamic f_get_obj_handling()
	if left(lod_handle.classname(),3) = 'ur_' then
		lb_report = true
	end if
	ls_menu_code = lod_handle.f_get_menu_code( )
	if isnull(ls_menu_code) or ls_menu_code ='' then
		ls_menu_code = lod_handle.classname( )
	end if
end if

li_colCnt = this.f_get_object_in_taborder_of_user(las_object[] )
if this.f_isgrid( ) and lod_handle.classname( ) <> 'u_valueset'  then
	//-- ẩn các control của band detail --//
	FOR li_idx = 1 to li_colCnt
		ls_rtn = this.modify(las_object[li_idx]+ ".visible = 0")
		if ls_rtn <> '' then 
			gf_messagebox('m.t_dw.f_set_properties.01','Thông báo','Giao diện thay đổi, Vui lòng xoá tuỳ biến người dùng để tránh lỗi này','information','ok',1)
//			messagebox('Loi modify DW','t_dw.f_set_properties(lines:12)')
			return -1
		end if
	NEXT
end if

ls_dwo = left(this.dataobject, len(this.dataobject) - 5)
FOR li_idx = 1 to li_colCnt			
	ls_coltype = this.describe(las_object[li_idx]+'.coltype' )
	//-- Ẩn hiện các control theo thứ tự --//
	this.f_set_object_visible(las_object[li_idx])
	
	//-- set editable --//
	this.f_set_editable_column(las_object[li_idx] , false)	
	
	//-- Set limit --//
	If left(ls_coltype,4) = 'char' then
		this.f_set_edit_limit( las_object[li_idx])
	end if

	//-- set color cho field --//
	this.f_set_column_color(las_object[li_idx], false )
	
	//-- set text color cho field --//
	this.f_set_text_color(las_object[li_idx] )
	//-- set number format --//
	if ls_coltype= 'number' or ls_coltype= 'decimal' then
		if  this.describe(las_object[li_idx]+ ".tag") <> 'nf' then
			f_set_number_format(las_object[li_idx] , lb_report)
		end if
	end if
	//-- build sort--//
	/*
	ls_findStr = "dwobject = '"+ls_dwo +"' AND dwcolumn = '" +las_object[li_idx]+ "' AND sort_type <> 'none'  AND sort_type <> '' "
	ll_row_found= lod_handle.idwsetup_initial.ids_setup_dw.find(ls_findStr,1,lod_handle.idwsetup_initial.ids_setup_dw.rowcount())
	if ll_row_found > 0 then
		li_sort_priority = lod_handle.idwsetup_initial.ids_setup_dw.getitemnumber(ll_row_found,'sort_seq')	
		if isnull(li_sort_priority) then continue
		lsa_colsort[li_sort_priority] =  las_object[li_idx] +' '+ lod_handle.idwsetup_initial.ids_setup_dw.getitemstring(ll_row_found,'sort_type')
		ll_row_found = 0
	end if
	*/
NEXT

li_colCnt = this.f_getcomputes( las_object[])
FOR li_idx = 1 to li_colCnt
	ls_coltype = this.describe(las_object[li_idx]+'.coltype' )
	if ls_coltype= 'number' or ls_coltype= 'decimal' then
		if  this.describe(las_object[li_idx]+ ".tag") <> 'nf' then
			f_set_number_format(las_object[li_idx], lb_report )
		end if
	end if
NEXT

//-- build sort các cols không hiển thị và hiện thị --//
ls_findStr = "dwobject = '"+ls_dwo + "' AND sort_type <> 'none'  AND sort_type <> '' "
ll_row_found= lod_handle.idwsetup_initial.ids_setup_dw.find(ls_findStr,1,lod_handle.idwsetup_initial.ids_setup_dw.rowcount())
do while ll_row_found > 0
	ls_colname =  lod_handle.idwsetup_initial.ids_setup_dw.getitemstring(ll_row_found,'dwcolumn')	
	if  ls_colname = '' or isnull(ls_colname) then continue 	
	li_sort_priority = lod_handle.idwsetup_initial.ids_setup_dw.getitemnumber(ll_row_found,'sort_seq')	
	if isnull(li_sort_priority) then continue
	lsa_colsort[li_sort_priority] = ls_colname +' '+ lod_handle.idwsetup_initial.ids_setup_dw.getitemstring(ll_row_found,'sort_type')
	ll_row_found= lod_handle.idwsetup_initial.ids_setup_dw.find(ls_findStr, ll_row_found+1, lod_handle.idwsetup_initial.ids_setup_dw.rowcount() +1)
loop
	
//-- set sort dw --//
FOR li_idx = 1 to upperbound(lsa_colsort[])
	if isnull(lsa_colsort[li_idx]) or lsa_colsort[li_idx] = '' then continue
	if ls_sortString <> '' then ls_sortString += ','	
	ls_sortString += lsa_colsort[li_idx]
NEXT
if ls_sortString <> '' then
	ls_rtn = this.modify("DataWindow.Table.Sort= '"+ls_sortString +"'")
end if

//-- Set ngôn ngữ --//
t_w_mdi.ids_lang_text.f_set_dw_lang(this)

//-- set attachment gutter color --//
//if this.f_isgrid( ) then
//	this.f_set_attach_gutter_color( )
//end if

this.setredraw( true)
return 1	
end function

public function integer f_get_object_in_taborder (ref string ras_object_in_taborder[]);int				li_colCount, li_counter, li_tabseq, li_row
string			las_object[], las_computes[]
datastore	lds_object_in_taborder

lds_object_in_taborder = create datastore
lds_object_in_taborder.dataobject = 'ds_colname_in_taborder'
li_colCount = this.f_getcolumns( las_object[])
if li_colCount = 0 then
	//gf_messagebox('m.t_dw.f_get_object_in_taborder.01','Thông bao','Không tìm thấy DWO:@'+this.dataobject,'exclamation','ok',1)
	return -1
elseif li_colCount = -1 then
	gf_messagebox('m.t_dw.f_get_object_in_taborder.01','Thông báo','Không tìm thấy DWO:@'+this.dataobject,'exclamation','ok',1)
	return -1
end if

FOR li_counter = 1 to li_colCount
	li_tabseq = integer(this.describe( las_object[li_counter]+".tabsequence" ))
	li_row = lds_object_in_taborder.insertrow( 0)
	lds_object_in_taborder.setitem( li_row, 'colname', las_object[li_counter])
	lds_object_in_taborder.setitem( li_row, 'tabsequence', li_tabseq)
NEXT

li_colCount = this.f_getcomputes(las_computes[]) 
FOR li_counter = 1 to li_colCount
	li_tabseq = integer(this.describe( las_computes[li_counter]+".tabsequence" ))
	li_row = lds_object_in_taborder.insertrow( 0)
	lds_object_in_taborder.setitem( li_row, 'colname', las_computes[li_counter])
	lds_object_in_taborder.setitem( li_row, 'tabsequence', li_tabseq)
NEXT

lds_object_in_taborder.setsort( "tabsequence asc" )
lds_object_in_taborder.sort( )
ras_object_in_taborder[] = lds_object_in_taborder.object.colname.primary

return li_row
end function

public function integer f_set_object_visible (string vs_objectname);/*****************************************************

--------------------------------------------------------------------------------------*/
string					ls_hidden_yn, ls_hidden_criteria_col, ls_criteria, ls_coltype, ls_modString, ls_rtn
string					ls_criteria_dwsetup, ls_idKey_code, ls_modString_label, ls_label_tag,ls_findString
long					ll_row_found, ll_width
boolean				lb_visible_dwsetup, lb_visible_security
window				lw_parent
s_object_display	lod_handle

if this.describe( vs_objectname + ".tag") = 'nv' then
	 return 0
end if

//-- set hidden --//
if this.describe( vs_objectname + ".tag") = 'hidden' then
	ls_rtn = this.modify(vs_objectname+ ".Visible =0")
	return 1
end if

this.f_getparentwindow(lw_parent )
lod_handle = lw_parent.dynamic f_get_obj_handling()

if lod_handle.classname() = 'u_valueset' then return 1

ls_coltype = this.describe( vs_objectname + ".coltype")
//ls_type = this.describe( vs_objectname + ".type") 
ls_label_tag = this.describe( vs_objectname + "_t.tag") 
if ls_coltype = '!' then return 0
//-- visible theo dwsetup --//
ls_criteria_dwsetup = lod_handle.idwsetup_initial.f_get_visible_string(this.dataobject, vs_objectname , ls_coltype)

//-- Nếu không cấm thì luôn được phép --//
ls_modString = vs_objectname + ".Visible =1"

//-- Nếu dwsetup là không hiện thị thì không cần kiểm tra phân quyền --//
if ls_criteria_dwsetup = '0' then
	ls_rtn = this.modify(vs_objectname +  ".Visible =0")
	if ls_rtn <> '' then
		messagebox('Lỗi modify','t_dw.f_set_object_visible:line 16')
		return -1
	end if
	if ls_label_tag <> '!' then
		ls_rtn = this.modify(vs_objectname +  "_t.Visible =0")
	end if
	return 1	
else
//-- visible theo security --//
	lb_visible_security = this.dynamic f_get_ib_query()
	
	if not lb_visible_security  then
		ls_modString = vs_objectname + ".Visible =0"
		if ls_label_tag <> '!' then
			ls_modString_label =  vs_objectname+'_t' + ".Visible =0"
		end if
	elseif  lb_visible_security and (gi_userid = 0 or isnull(is_visible_fields) or pos(is_visible_fields,vs_objectname+';') > 0 ) and ls_criteria_dwsetup = '1' then 
		ls_modString = vs_objectname + ".Visible =1"
		if ls_label_tag <> '!' and ls_label_tag <> 'hidden'  then
			ls_modString_label =  vs_objectname+'_t' + ".Visible =1"
		elseif ls_label_tag = 'hidden' then
			ls_modString_label =  vs_objectname+'_t' + ".Visible =0"
		end if		
	elseif lb_visible_security  and (gi_userid = 0 or isnull(is_visible_fields) or pos(is_visible_fields,vs_objectname+';') > 0 ) and ls_criteria_dwsetup <> '1' then
		ls_modString =  vs_objectname + ".Visible ='0~t"+ls_criteria_dwsetup + "'"
		if ls_label_tag <> '!' and ls_label_tag <> 'hidden' then
			ls_modString_label =  vs_objectname+'_t' + ".Visible ='0~t"+ls_criteria_dwsetup + "'"
		elseif ls_label_tag = 'hidden' then
			ls_modString_label =  vs_objectname+'_t' + ".Visible =0"
		end if				
	elseif lb_visible_security  and pos(is_visible_fields,vs_objectname+';') = 0 and gi_userid > 0 then
		ls_modString = vs_objectname + ".Visible =0"
		if ls_label_tag <> '!' then
			ls_modString_label =  vs_objectname+'_t' + ".Visible =0"
		end if		
	end if		
end if

ls_rtn = this.modify(ls_modString)
if ls_modString_label <> '' then	ls_rtn = this.modify(ls_modString_label)
if ls_rtn <> '' then
	messagebox('Lỗi modify','t_dw.f_set_object_visible:loi modofy dw:@'+this.dataobject+'.'+vs_objectname)
	return -1
end if
//-- set colwidth --//
ls_findString =  " user_id ="+string(gi_userid)+" AND dwobject = '"+this.dataobject+"' AND dwcontrol ='"+vs_objectname+"'" 
ll_row_found = lod_handle.ids_user_profile.find(ls_findString, 1, lod_handle.ids_user_profile.rowcount())
if ll_row_found > 0 then
	ll_width = lod_handle.ids_user_profile.getitemnumber( ll_row_found, 'col_width')
	this.modify( vs_objectname + '.width='+string(ll_width))
end if

return 1
end function

public function integer f_get_object_in_taborder_of_user (ref string ras_object_in_taborder[]);int					 		li_rowCnt
any						la_data[]
s_object_display		lod_handle
window					lw_display

if this.f_isgrid( ) then
	this.f_getparentwindow(lw_display) 
	lod_handle = lw_display.dynamic f_get_obj_handling()
	lod_handle.ids_user_profile.setfilter( "dwobject = '"+ this.dataobject +"'")
	if lod_handle.ids_user_profile.filter( ) = -1 then
		gf_messagebox('m.t_dw.f_get_object_in_taborder_of_user.01','Thông báo','Lỗi filter ids_user_profile:f_get_object_in_taborder_of_user','stop','ok',1)
	end if
	
	li_rowCnt =  lod_handle.ids_user_profile.rowcount( ) 

	if li_rowCnt > 0 then
		lod_handle.ids_user_profile.setsort( "tabseq asc")
		lod_handle.ids_user_profile.sort( )
		ras_object_in_taborder[] = lod_handle.ids_user_profile.object.dwcontrol.primary
	end if
		
	if li_rowCnt = 0 then
		li_rowCnt = this.f_get_object_in_taborder(ras_object_in_taborder[])
	end if
	lod_handle.ids_user_profile.setfilter("")
	lod_handle.ids_user_profile.filter( )	
else
	li_rowCnt = this.f_get_object_in_taborder(ras_object_in_taborder[])
end if

return li_rowCnt

end function

public function integer f_set_edit_limit (string vs_objectname);/*****************************************************

--------------------------------------------------------------------------------------*/
int			li_limit, ll_row_found
string		ls_rtn, ls_modString, ls_dwo
window				lw_parent
s_object_display	lod_handle

if this.describe(vs_objectname+ ".edit.style") = 'radiobuttons' &
	or this.describe(vs_objectname+ ".edit.style")='checkbox' then return 0

if this.f_iscomputes(vs_objectname) then return 0 //-- nếu là compute field ko set --//

this.f_getparentwindow(lw_parent )
lod_handle = lw_parent.dynamic f_get_obj_handling()

ls_modString = vs_objectname + ".Edit.limit =0"
//--limit dwsetup --//
ls_dwo = left(this.dataobject, len(this.dataobject) - 5)
ll_row_found = lod_handle.idwsetup_initial.ids_setup_dw.find("dwobject = '"+ ls_dwo+ "' AND dwcolumn ='" + vs_objectname + "'",1, lod_handle.idwsetup_initial.ids_setup_dw.rowcount( ) )
if ll_row_found > 0 then	
	li_limit = lod_handle.idwsetup_initial.ids_setup_dw.getitemnumber(ll_row_found, 'limit')
	if isnull(li_limit) then li_limit = 0
	ls_modString = vs_objectname + ".Edit.limit =" + string(li_limit)
end if

ls_rtn = this.modify(ls_modString )
if ls_rtn <> '' then
	messagebox('Lỗi modify','t_dw.f_set_edit_limit:line 16')
	return -1
end if
return 1
end function

public function integer f_build_sortstring (string vs_objectname, ref string rs_sortstring);/*****************************************************

--------------------------------------------------------------------------------------*/
int			ll_row_found, li_sortseq, li_pos, li_counter
string		ls_sort_type, ls_first, ls_last, ls_dwo
c_string	lc_string
window				lw_parent
s_object_display	lod_handle

this.f_getparentwindow(lw_parent )
lod_handle = lw_parent.dynamic f_get_obj_handling()
ls_dwo = left(this.dataobject, len(this.dataobject) - 5)
ll_row_found = lod_handle.idwsetup_initial.ids_setup_dw.find("dwobject = '"+ls_dwo+ "' AND dwcolumn ='" + vs_objectname + "'",1, lod_handle.idwsetup_initial.ids_setup_dw.rowcount( ) )
if ll_row_found > 0 then	
	ls_sort_type = lod_handle.idwsetup_initial.ids_setup_dw.getitemstring(ll_row_found, 'SORT_TYPE')
	if isnull(ls_sort_type) or ls_sort_type = 'none' then 
		return 0
	else
		li_sortseq = lod_handle.idwsetup_initial.ids_setup_dw.getitemnumber(ll_row_found, 'SORT_SEQ')
		if li_sortseq = 0 or isnull(li_sortseq) then
			rs_sortstring = vs_objectname + ' ' + ls_sort_type
			return 1
		else
			if rs_sortstring <> '' then
				if li_sortseq = 1 then
					rs_sortstring =  vs_objectname + ' ' + ls_sort_type + rs_sortstring
				else
					li_pos = lc_string.f_pos( rs_sortstring, ',', li_sortseq)
					if li_pos = 0 then
						rs_sortstring += ', ' + vs_objectname + ' ' + ls_sort_type
					else
						ls_first =  left(rs_sortstring, lc_string.f_pos( rs_sortstring,',', li_sortseq - 1))
						ls_last =  mid(rs_sortstring, lc_string.f_pos( rs_sortstring, ',', li_sortseq))
						rs_sortstring = ls_first + vs_objectname + ' ' + ls_sort_type + ls_last
					end if
				end if		
			else
				FOR li_counter = 1 to li_sortseq							
					if li_counter = li_sortseq then
						rs_sortstring += vs_objectname + ' ' + ls_sort_type
					else
						rs_sortstring += ', '
					end if
				NEXT				
			end if
		end if
	end if
else
	return 0	
end if
return li_sortseq
end function

public function integer f_set_editable_column (string vs_colname, boolean vb_editing);
return this.f_set_editable_column(vs_colname , vb_editing,istr_security_attr,istr_rule_attr)

end function

public function integer f_set_text_color (string vs_colname);string					ls_textcolor, ls_coltype, ls_modstring_color, ls_rtn
window 				lw_parent
s_object_display	lod_handle

this.f_getparentwindow( lw_parent)
lod_handle = lw_parent.dynamic f_get_obj_handling()

ls_coltype = this.describe( vs_colname + ".coltype")

//-- modify mau cot bat buoc co khi lưu--//
ls_textcolor =  lod_handle.idwsetup_initial.f_get_textcolor_string(this.dataobject, vs_colname, ls_coltype, this)
if ls_textcolor = 'default' or isnull(ls_textcolor) then
	return 0
elseif pos(lower(ls_textcolor),'if') > 0 then
	ls_modstring_color = "0~~t"+ls_textcolor
else
	ls_modstring_color =  "0~~t"+ls_textcolor
end if

ls_modstring_color = vs_colname+".color=~'"+ ls_modstring_color+"~'"
ls_rtn= this.modify( ls_modstring_color)
if ls_rtn <> '' then
	messagebox('Lỗi modify','t_dw.f_set_text_color:line 19:@'+vs_colname)
	return -1
end if
return 1
end function

public function integer f_reset_visible_in_user_tabsequence ();int				li_colCnt, li_idx
string			las_object[], ls_rtn

if this.f_isgrid( ) then
	this.setredraw( false)
	li_colCnt = this.f_get_object_in_taborder_of_user(las_object[] )
	//-- ẩn các control của band detail --//
	FOR li_idx = 1 to li_colCnt
		ls_rtn = this.modify(las_object[li_idx]+ ".visible = 0")
		if ls_rtn <> '' then 
			messagebox('Loi','t_dw.f_set_properties(lines:12)')
			return -1
		end if
	NEXT
	
	FOR li_idx = 1 to li_colCnt		
		//-- Ẩn hiện các control theo thứ tự --//
		this.f_set_object_visible(las_object[li_idx])
	NEXT
	this.setredraw( true)
end if
return 1
end function

public function integer f_set_editable_property (boolean vb_editing);string					ls_column, ls_idKey_code, ls_coltype, ls_dwdatatype_str, ls_valuset_criteria_col, las_colname[]
string					ls_filterStr, ls_dwdatatype, ls_dwo
int						li_colCnt, li_idx, li_rtn		



li_colCnt = this.f_getcolumns( las_colname[])
//-- thuộc tính cho các cột theo phân quyền và chính sách của dw không phụ thuộc dữ liệu --//
FOR li_idx = 1 to li_colCnt		
	ls_coltype = this.describe(las_colname[li_idx]+'.coltype' )
	//-- set editable --//
	this.f_set_editable_column(las_colname[li_idx] , vb_editing)	

	//-- set color cho field --//
	this.f_set_column_color(las_colname[li_idx], vb_editing )

NEXT
//-- set thuộc tính các cột được cài đặt phân quyền và chính sách riêng có thể phụ thuộc dữ liệu--//
//this.f_set_editable_property_row(vb_editing)

//-- Set ngôn ngữ --//
t_w_mdi.ids_lang_text.f_set_dw_lang(this)


return 1	
end function

public function integer f_set_editmask (string vs_colname, string vs_coltype, boolean vb_editing);/******************************************************************
Chức năng: set editmask cho cột date, datetime hoặc struture khi đang soan thảo
----------------------------------------------------------------------------------------------------------
Tham số:
	- vs_colname: tên cột
	- vs_coltype: kiểu {'date', 'datetime','struct_segment'}
	- vb_editing: true (đang edit); bật editmask, false: tắt editmask 
===========================================================*/
string				ls_modstring, ls_rtn, ls_number_format, ls_struct_bttn, ls_calendar_bttn
int					li_width

this.setredraw( false)
If vb_editing then
	choose case vs_coltype
		case 'date'
			ls_calendar_bttn = 'b_calendar_'+vs_colname
			if this.describe( ls_calendar_bttn+".x") = '!' then
				this.f_create_column_button( vs_colname,ls_calendar_bttn , 'b_calendar.png', 'Lịch')
				ls_modstring += vs_colname + ".EditMask.mask = '"+gs_w_date_format+"' "
				ls_modstring += vs_colname + ".EditMask.FocusRectangle = yes "		
				ls_modstring += vs_colname + ".format =  '"+gs_w_date_format+"' "
//				ls_modstring += vs_colname + ".edit.FocusRectangle = yes "			
			end if
		case 'datetime'
			ls_calendar_bttn = 'b_calendar_'+vs_colname
			if this.describe( ls_calendar_bttn+".x") = '!' then
				this.f_create_column_button( vs_colname, ls_calendar_bttn , 'b_calendar.png', 'Lịch')
				ls_modstring += vs_colname + ".EditMask.mask = '"+gs_w_date_format+" hh:mm:ss' "
				ls_modstring += vs_colname + ".EditMask.FocusRectangle = yes "
				ls_modstring += vs_colname + ".format = '"+gs_w_date_format+" hh:mm:ss' "
//				ls_modstring += vs_colname + ".edit.FocusRectangle = yes "				
			end if
		case 'time'
			ls_modstring += vs_colname + '.EditMask.mask = ~"hh:mm~" '
			ls_modstring += vs_colname + ".EditMask.FocusRectangle = yes "			
		case 'STRUCT_SEGMENT'
			ls_struct_bttn = "b_struct_"+vs_colname
			if this.describe( ls_struct_bttn+".x") = '!' then
				this.f_create_struct_button(vs_colname )
			end if
		case else
			ls_modstring += vs_colname + ".EditMask.mask = '" + vs_coltype+"'"
			ls_modstring += vs_colname + ".EditMask.FocusRectangle = yes "					
	end choose
else	
	choose case vs_coltype
		case 'date'			
			this.setredraw( false)
			ls_modstring = vs_colname + ".format =  '"+gs_w_date_format+"' "
			ls_modstring += vs_colname + ".edit.FocusRectangle = yes "
			ls_rtn = this.modify( ls_modstring)
			ls_calendar_bttn = 'b_calendar_'+vs_colname
			if this.describe( ls_calendar_bttn+".x") <> '!' then
				ls_modstring = "destroy "+ls_calendar_bttn
				ls_rtn = this.modify( ls_modstring)
				if not this.f_isgrid( ) then
					li_width = integer(this.describe( vs_colname+'.width'))
					li_width += 105
					ls_rtn = this.modify(vs_colname+'.width ='+string(li_width))
				end if				
			end if
			this.setredraw( true)
			return 1
		case 'datetime'			
			this.setredraw( false)
			ls_modstring = vs_colname + ".format = '"+gs_w_date_format+" hh:mm:ss' "
			ls_modstring += vs_colname + ".edit.FocusRectangle = yes "
			ls_rtn = this.modify( ls_modstring)
			ls_calendar_bttn = 'b_calendar_'+vs_colname
			if this.describe( ls_calendar_bttn+".x") <> '!' then
				ls_modstring = "destroy "+ls_calendar_bttn
				ls_rtn = this.modify( ls_modstring)
				if not this.f_isgrid( ) then
					li_width = integer(this.describe( vs_colname+'.width'))
					li_width += 105
					ls_rtn = this.modify(vs_colname+'.width ='+string(li_width))
				end if				
			end if
			this.setredraw( true)
			return 1
		case 'time'
			ls_modstring += vs_colname + ".EditMask.mask = 'hh:mm' "
			ls_modstring += vs_colname + ".EditMask.FocusRectangle = yes "				
		case 'STRUCT_SEGMENT'
			ls_struct_bttn = "b_struct_"+vs_colname
			if this.describe(ls_struct_bttn+ ".x") <> '!' then
				ls_modstring = "destroy "+ ls_struct_bttn
				ls_rtn = this.modify( ls_modstring)
				if not this.f_isgrid( ) then
					li_width = integer(this.describe( vs_colname+'.width'))
					li_width += 105
					ls_rtn = this.modify(vs_colname+'.width ='+string(li_width))
				end if
			end if			
			this.setredraw( true)
			return 1			
		case else
			this.setredraw( false)
			ls_modstring = vs_colname + ".format = '" + vs_coltype + "'"
			ls_modstring += vs_colname + ".edit.FocusRectangle = yes "						
	end choose	
end if

ls_rtn = this.modify( ls_modstring)
this.setredraw( true)
return 1
end function

public function integer f_create_column_button (string vs_colname, string vs_bitmapname, string vs_filename, string vs_tooltip);string 		ls_button, ls_band, ls_rtn
int				li_x, li_y, li_width, li_tabseq, li_col_newwidth

li_x = integer(this.describe(vs_colname+ ".x"))
li_y = integer(this.describe(vs_colname+ ".y"))
li_width =  integer(this.describe(vs_colname+ ".width"))
ls_band = this.describe(vs_colname+ '.Band' )
//- tính x và width của bitmap --//
li_col_newwidth = (li_width - 105)
li_x += (li_width - 105)
li_width = 105

ls_button += 'create button(band='+ls_band+' text="" filename="Pics\'+vs_filename+ '" enabled=yes action="0" border="0" color="33554432" x="'+string(li_x)+'" y="'+string(li_y)+'" height="84" width="105" vtextalign="0" htextalign="0"  name='+vs_bitmapname+' visible="1"   font.face="Tahoma" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="67108864" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="1" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.tip="'+vs_tooltip+'" tooltip.transparency="0" transparency="0" )'	
this.setredraw( false)
ls_rtn = this.Modify(ls_button)

if not this.f_isgrid( ) then
	ls_rtn = this.Modify(vs_colname+'.width ='+string(li_col_newwidth))
end if

//li_tabseq = integer(this.Describe(vs_colname+".TabSequence"))
//li_tabseq = li_tabseq+1
//this.Modify(vs_bitmapname+".TabSequence = "+string(li_tabseq))
this.SetPosition ( vs_bitmapname, ls_band , true )
//ls_rtn = this.Modify(vs_bitmapname+".SuppressEventProcessing ='yes'")
this.setredraw( true)
if ls_rtn <> '' then
	gf_messagebox('m.t_dw_mpl.f_create_column_bitmap.01','Thông báo','Không tạo được icon của cột','exclamation','ok',1)
	return -1
end if
return 0

end function

public function integer f_set_editable_4_filter (boolean vb_editing);string					las_column[], ls_type, ls_displayonly, ls_protect, ls_rtn
int						li_colCnt, li_idx


if vb_editing then
	ls_displayonly = 'no'
	ls_protect = '0'	
else
	ls_displayonly = 'yes'
	ls_protect = '1'	
end if
li_colCnt = this.f_getcolumns(las_column[] )
FOR li_idx = 1 to li_colCnt			
	ls_type =  this.describe(las_column[li_idx]+  ".edit.style") 
	if ls_type = 'edit' then
		ls_rtn = this.modify( las_column[li_idx]+".edit.displayonly=" +ls_displayonly)
	else
		ls_rtn = this.modify( las_column[li_idx]+".protect="+ls_protect)
	end if		
NEXT

return 1	
end function

public function integer f_set_backcolor_property ();string					ls_column, ls_idKey_code, ls_coltype, ls_filterStr, las_colname[]
int						li_colCnt, li_idx, li_rtn
boolean				lb_found
s_object_display	lod_handle
window				lw_parent				
s_str_policy_attr	 lstr_rule_attr, lstr_security_attr
c_string				lc_string

this.f_getparentwindow( lw_parent)
lod_handle = lw_parent.dynamic f_get_obj_handling()

li_colCnt = this.f_getcolumns( las_colname[])
FOR li_idx = 1 to li_colCnt
	this.f_set_editable_column( las_colname[li_idx],false)
NEXT

if gi_userid > 0 and isvalid(lod_handle.ids_policy_rule)  then
	//-- filter rule for column --//
	ls_idKey_code = lod_handle.classname( )+'.'+ left(this.dataobject, len(this.dataobject) - 5)+'.*'
	ls_filterStr = lc_string.f_get_expression( ls_idKey_code, 'char()', 'identification_code', 'filter')	
	ls_filterStr+= ' and not isnull(dwobject_constraint)'
	lod_handle.ids_policy_rule.setfilter( ls_filterStr)
	lod_handle.ids_policy_rule.filter( )
	
	//-- filter security for column --//
	ls_idKey_code = lod_handle.classname( )+'.'+ left(this.dataobject, len(this.dataobject) - 5)+'.*'
	ls_filterStr = lc_string.f_get_expression( ls_idKey_code, 'char()', 'identification_code', 'filter')	
	ls_filterStr+= ' and not isnull(dwobject_constraint)'
	lod_handle.ids_policy_security.setfilter( ls_filterStr)
	lod_handle.ids_policy_security.filter( )
	
	//-- set escurity for column --//
	FOR li_idx = 1 to lod_handle.ids_policy_rule.rowcount( )
		//-- kiềm tra rule có applied theo đúng diều kiện ko --//
		if g_user.i_rule.f_is_policy_applied( lod_handle.ids_policy_rule, li_idx, lw_parent) then
			this.dynamic f_get_policy_attr(lod_handle.ids_policy_rule, li_idx, lstr_rule_attr)
		else
			continue
		end if		
		//-- tìm security của idkey --//
		ls_idKey_code = lod_handle.ids_policy_rule.getitemstring( li_idx, 'identification_code')
		li_rtn = lod_handle.ids_policy_security.find(  "identification_code ='" + ls_idKey_code+"'",1, lod_handle.ids_policy_security.rowcount( ))
		if li_rtn = 0 then
			lstr_security_attr = this.istr_security_attr
		elseif li_rtn > 0 then
//			DO
				if g_user.i_rule.f_is_policy_applied( lod_handle.ids_policy_security, li_rtn, lw_parent) then
					this.dynamic f_get_policy_attr(lod_handle.ids_policy_security, li_rtn, lstr_security_attr)
					lb_found = true
				end if				
//				li_rtn = lod_handle.ids_policy_security.find(  "identification_code ='" + ls_idKey_code+"'",li_rtn+1, lod_handle.ids_policy_security.rowcount( )+1)
//			LOOP WHILE li_rtn > 0
//			if not lb_found then lstr_security_attr = this.istr_security_attr
		end if
		ls_column = mid(ls_idKey_code, lc_string.f_pos( ls_idKey_code,'.', 2)+1)
		if right(ls_column,2) = '_t' then ls_column = mid(ls_column,1,pos(ls_column,'_t') - 1)
		
		//-- set color cho field --//
//		this.f_set_column_color( ls_column, lstr_security_attr, lstr_rule_attr)
		//-- visible --//
		this.f_set_object_visible(ls_column)		
		//-- set edit mask --//
		ls_coltype = this.describe( ls_column+ ".tag")
		if left(ls_coltype,4) = 'date' then			
			this.f_set_editmask( ls_column, ls_coltype, false)
		end if		
		
	NEXT
	
	//-- set escurity for column --//
	FOR li_idx = 1 to lod_handle.ids_policy_security.rowcount( )
		if g_user.i_rule.f_is_policy_applied( lod_handle.ids_policy_security, li_idx, lw_parent) then
			this.dynamic f_get_policy_attr(lod_handle.ids_policy_security, li_idx, lstr_security_attr)
		else
			continue
		end if				
		ls_idKey_code = lod_handle.ids_policy_security.getitemstring( li_idx, 'identification_code')
		li_rtn = lod_handle.ids_policy_rule.find(  "identification_code ='" + ls_idKey_code+"'",1, lod_handle.ids_policy_rule.rowcount( ))
		if li_rtn = 0 then
			lstr_rule_attr = this.istr_rule_attr
		elseif li_rtn > 0 then
			continue
		end if
		
		ls_column = mid(ls_idKey_code, lc_string.f_pos( ls_idKey_code,'.', 2)+1)
		if right(ls_column,2) = '_t' then ls_column = mid(ls_column,1,pos(ls_column,'_t') - 1)

		//-- set color cho field --//
//		this.f_set_column_color( ls_column, lstr_security_attr, lstr_rule_attr)
		//-- visible --//
		this.f_set_object_visible(ls_column)		
		//-- set edit mask --//
		ls_coltype = this.describe(ls_column + ".tag")
		if left(ls_coltype,4) = 'date' then			
			this.f_set_editmask(ls_column, ls_coltype, false)
		end if		
		
	NEXT
	//-- tra lai filter --//
	lod_handle.ids_policy_security.setfilter( '')
	lod_handle.ids_policy_security.filter( )
	lod_handle.ids_policy_rule.setfilter( '')
	lod_handle.ids_policy_rule.filter( )
end if			

return 1	
end function

public function integer f_create_struct_button (string vs_colname);string 		ls_button, ls_band, ls_rtn
int				li_x, li_y, li_width, li_tabseq, li_col_newwidth

li_x = integer(this.describe(vs_colname+ ".x"))
li_y = integer(this.describe(vs_colname+ ".y"))
li_width =  integer(this.describe(vs_colname+ ".width"))
ls_band = this.describe(vs_colname+ '.Band' )
//- tính x và width của bitmap --//
li_col_newwidth = li_width - 105
li_x += (li_width - 105)
li_width = 105

ls_button += 'create button(band='+ls_band+' text="..." enabled=yes action="0" border="0" color="33554432" x="'+string(li_x)+'" y="'+string(li_y)+'" height="84" width="105" vtextalign="0" htextalign="0"  name='+ 'b_struct_'+vs_colname+' visible="1"   font.face="Tahoma" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="67108864" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="1" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.tip="" tooltip.transparency="0" transparency="0" )'	
this.setredraw( false)
ls_rtn = this.Modify(ls_button)

if not this.f_isgrid( ) then
	ls_rtn = this.Modify(vs_colname+'.width ='+string(li_col_newwidth))
end if

this.setredraw( true)
if ls_rtn <> '' then
	gf_messagebox('m.t_dw_mpl.f_create_struct_button.01','Thông báo','Không tạo được icon của cột:t_dw_mpl.f_create_struct_button:@'+vs_colname,'exclamation','ok',1)
	return -1
end if
return 0

end function

public function integer f_send_message_to_object (ref datawindow vdw_focus, long vl_currentrow, string vs_colname, string vs_message);int 					li_rtn
s_object_display	lpo_handling
window				lw_display
if this.f_getparentwindow( lw_display) = 1 then
	lpo_handling = lw_display.dynamic f_get_obj_handling()
	if isvalid(lpo_handling) then
		return lpo_handling.f_handle_message(vdw_focus, vl_currentrow, vs_colname, vs_message)
	end if
end if
return -1
end function

public subroutine f_set_scrollbar ();int							li_idx
window					lw_display
s_object_display		lod_handle

//-- set scrollbar --//
this.f_getparentwindow( lw_display)
lod_handle = lw_display.dynamic f_get_obj_handling()
if this.f_isgrid( ) or  lod_handle.classname() = 'b_view'  then
	this.hscrollbar = true
	this.vscrollbar = true
	this.hsplitscroll = true
	this.livescroll = true
else
	this.vscrollbar = false
	this.hscrollbar = true
	this.hsplitscroll = false
	this.livescroll = false	
end if
if upperbound(iadw_shared[]) > 0 then
	FOR li_idx = 1 to upperbound(iadw_shared[])
		if iadw_shared[li_idx].dynamic f_isgrid() or  lod_handle.classname() = 'b_view'  then
			iadw_shared[li_idx].hscrollbar = true
			iadw_shared[li_idx].vscrollbar = true
			iadw_shared[li_idx].hsplitscroll = true
			iadw_shared[li_idx].livescroll = true			
		else
			iadw_shared[li_idx].hscrollbar = true
			iadw_shared[li_idx].vscrollbar = false
			iadw_shared[li_idx].hsplitscroll = false
			iadw_shared[li_idx].livescroll = false			
		end if
	NEXT
end if
end subroutine

public function integer f_set_editable_column (string vs_colname, boolean vb_editing, s_str_policy_attr vstr_security_attr, s_str_policy_attr vstr_rule_attr);long			ll_row_setup
string 		ls_displayonly_dwsetup, ls_displayonly_policy, ls_type, ls_coltype, ls_dwdatatype, ls_dwdatatype_str,ls_displayonly_protect
string			ls_displayonly, ls_protect, ls_modString_edit, ls_modString_else, ls_rtn, ls_dwo, ls_protect_save_yn
boolean 		lb_updatable_policy, lb_editing

window 					lw_parent
s_object_display		lpo_handling
c_string					lc_string

if vs_colname = 'gutter' then
	if vb_editing then
		ls_modString_else = vs_colname+".protect= 0 "
	else
		ls_modString_else = vs_colname+".protect= 1"
	end if
	ls_rtn = this.modify( ls_modString_else)
	return 1
end if

this.f_getparentwindow( lw_parent)
lpo_handling = lw_parent.dynamic f_get_obj_handling()
ls_coltype = this.describe( vs_colname + ".coltype")
ls_type = this.describe(vs_colname+".edit.style")
if ls_type = '?' or ls_type = '!' then
	return 0
end if

//-- SET chuổi modify thược tính readonly--//
ls_displayonly = 'yes'
ls_displayonly_protect = '1'
ls_protect = '1'


ls_displayonly_dwsetup = lpo_handling.idwsetup_initial.f_get_displayonly_string(this.dataobject , vs_colname, ls_coltype)

//-- dwsetup ko được edit thì ko cần kiểm tra phân quyền --//
if  ls_displayonly_dwsetup = 'yes'  then
	//-- luôn luôn khong edit--//
else
	//-- kiem tra phan quyen --//
	ls_displayonly_policy = 'no'
	lb_updatable_policy = this.dynamic f_get_ib_update(vstr_security_attr, vstr_rule_attr)
	//-- check security fields --//
	lb_updatable_policy = (gi_userid = 0) or lb_updatable_policy and ( isnull(is_editable_fields) or pos(is_editable_fields, vs_colname+';') > 0)
	if not lb_updatable_policy then
		//-- khong edit--//
	elseif lb_updatable_policy and  ls_displayonly_dwsetup = 'no'  then	//-- phân quyền được edit, cài đặt bảng được edit--//			
		if not this.ib_keyboardlocked or vb_editing then
			//-- kiểm tra khóa sau khi lưu --//		
			ls_protect_save_yn =  lpo_handling.idwsetup_initial.f_get_protect_save_string(this.dataobject , vs_colname, ls_coltype)
			if ls_protect_save_yn = 'no'  then
				//-- SET chuổi modify thược tính readonly--//
				ls_displayonly = 'no'
				ls_displayonly_protect = '0'
				
				ls_protect = '0'
			elseif  ls_protect_save_yn = 'yes'   then
				//-- SET chuổi modify thược tính readonly--//
				ls_displayonly_protect = "~'0~tif(IsRowNew(), 0,1)~'"
				ls_displayonly = ls_displayonly_protect
				ls_protect =   this.describe("Evaluate(~'if(IsRowNew(), 0,1)~' ," + string(this.getrow( ))+")")
			else
				//-- SET chuổi modify thuộc tính readonly--//
				ls_displayonly = ls_protect_save_yn
				ls_displayonly_protect = lc_string.f_globalreplace(ls_protect_save_yn,  "~~'yes~~'",  "1") 
				ls_displayonly_protect = lc_string.f_globalreplace(ls_displayonly_protect,  "~~'no~~'",  "0") 
				ls_displayonly_protect =  "~'0" +  "~~t"+ls_displayonly_protect+"~'"
				ls_displayonly = ls_displayonly_protect
				
				//-- kiểm tra tình trạng edit dòng hiện tại theo dữ liệu hiện tại để set biến lb_edting--//
				ls_protect_save_yn = this.describe("Evaluate(~' "+ ls_protect_save_yn+ "~'," + string(this.getrow( ))+')')
				if ls_protect_save_yn = 'yes' then
					ls_protect = '1' 
				else
					ls_protect = '0'			
				end if //-- KẾT THÚC : kiểm tra tình trạng edit dòng hiện tại theo dữ liệu hiện tại để set biến lb_edting--//
				
			end if
		end if	
	elseif lb_updatable_policy and  ls_displayonly_dwsetup <> 'no'  then //-- phân quyền được edit, cài đặt bảng phụ thuộc dữ liệu--//
		if not this.ib_keyboardlocked or vb_editing then			
			//-- SET chuổi modify thược tính readonly--//
			ls_displayonly = ls_displayonly_dwsetup
			ls_displayonly_protect = lc_string.f_globalreplace(ls_displayonly_dwsetup,  "~~'yes~~'",  "1") 
			ls_displayonly_protect = lc_string.f_globalreplace(ls_displayonly_protect,  "~~'no~~'",  "0") 		
			ls_displayonly_protect = "~'0" +  "~~t"+ls_displayonly_protect+"~'"
			ls_displayonly = ls_displayonly_protect
			
			//-- kiểm tra tình trạng edit dòng hiện tại theo dữ liệu hiện tại để set biến lb_edting--//
			ls_protect = this.describe("Evaluate(' "+ ls_displayonly_dwsetup+ "'," + string(this.getrow( ))+')')
			if ls_protect = 'no' then
				//-- kiểm tra khóa sau khi lưu --//
				ls_protect_save_yn =  lpo_handling.idwsetup_initial.f_get_protect_save_string(this.dataobject , vs_colname, ls_coltype)
				if ls_protect_save_yn <> 'no' and ls_protect_save_yn <> 'yes'   then
					ls_protect_save_yn = this.describe("Evaluate(' "+ ls_protect_save_yn+ "'," + string(this.getrow( ))+')')
				end if				
				if ls_protect_save_yn = 'yes' then
					ls_protect = this.describe("Evaluate(~'if(IsRowNew(), 0,1) ~' , "+ string(this.getrow( ))+")")
				else
					ls_protect = '0'			
				end if				
			else
				ls_protect = '1'
			end if		//-- KẾT THÚC : kiểm tra tình trạng edit dòng hiện tại theo dữ liệu hiện tại để set biến lb_edting--//
			
				
		end if
	end if
end if

if ls_protect = '1' then
	lb_editing =false
else
	lb_editing = lb_updatable_policy and (vb_editing or not this.ib_keyboardlocked)
end if

//-- set editmask for date--//
if left(ls_coltype,4) = 'date' or  left(ls_coltype,4) = 'char' then
	ls_coltype = this.describe(vs_colname+ ".tag")
	if ls_coltype <> '?' then this.f_set_editmask( vs_colname, ls_coltype, lb_editing)
end if

//-- set editmask for struct--//
ll_row_setup = lpo_handling.idwsetup_initial.f_get_dwdatatype_string( vs_colname, ls_coltype, this, ls_dwdatatype)
if ls_dwdatatype = 'STRUCT_SEGMENT' then
	this.f_set_editmask( vs_colname, 'STRUCT_SEGMENT', lb_editing)
end if

ls_modString_else = vs_colname+".protect="+ls_displayonly_protect
if ls_displayonly_protect <> ls_displayonly then
	ls_modString_edit = vs_colname+".edit.displayonly=" +ls_displayonly
else
	ls_modString_edit = ls_modString_else
end if

ls_type = this.describe(vs_colname+".edit.style")

if lb_editing then
	//-- kiểm tra cột dddw --//
	if (ls_dwdatatype ='valueset' or ls_dwdatatype ='dwo') then	
		if lpo_handling.idwsetup_initial.ids_setup_dw.rowcount( ) > 0 then
			this.f_create_dddw(ll_row_setup)
//			int li_rtn
//			li_rtn = this.f_retrieve_dwc_ex(vs_colname )
		end if	
	elseif  ls_type = 'edit' then
		ls_rtn = this.modify( ls_modString_edit)
		if ls_modString_edit = ls_modString_else then
			ls_rtn = this.modify(  vs_colname+".edit.displayonly= 'no'" )
		end if		
	elseif ls_type = 'richtext' then
		ls_modString_edit = vs_colname+".richedit.displayonly=" +ls_displayonly
		ls_rtn = this.modify( ls_modString_edit)
	elseif ls_type = 'inkedit' then
		ls_modString_edit = vs_colname+".inkedit.displayonly=" +'false'
		ls_rtn = this.modify( ls_modString_edit)
	else
		ls_rtn = this.modify( ls_modString_else)
	end if				
	
else
	if ls_type = 'edit' or ls_type = 'dddw'  then
		if vb_editing and  lpo_handling.idwsetup_initial.ids_setup_dw.rowcount( ) > 0 then
			if this.f_create_dddw(ll_row_setup) = 0 then			
				ls_rtn = this.modify( ls_modString_edit)
				if ls_modString_edit = ls_modString_else then
					ls_rtn = this.modify(  vs_colname+".edit.displayonly= 'no'" )
				end if					
			else
				ls_rtn = this.modify( ls_modString_else)	//-- khóa cột có cài valueset--//	
			end if
		else
			ls_rtn = this.modify( ls_modString_edit)
			if ls_modString_edit = ls_modString_else and lb_editing then
				ls_rtn = this.modify(  vs_colname+".edit.displayonly= 'no'" )
			end if			
		end if				
	elseif ls_type = 'richtext' then
		ls_modString_edit = vs_colname+".richedit.displayonly=" +ls_displayonly
		ls_rtn = this.modify( ls_modString_edit)
	elseif ls_type = 'inkedit' then
		ls_modString_edit = vs_colname+".inkedit.displayonly=" +'true'
		ls_rtn = this.modify( ls_modString_edit)
	else
		ls_rtn = this.modify( ls_modString_else)
	end if	
end if

if ls_rtn <> '' then
	messagebox('Lỗi modify','t_dw.f_set_editable_column:line 125->'+ this.dataobject + ';'+vs_colname )
	return -1
end if

return 1
end function

public function integer f_set_rule_attr (datastore vds_policy, long vl_row);if vl_row = 0 then // user admin
	istr_rule_attr.b_delete = true
	istr_rule_attr.b_insert = true
	istr_rule_attr.b_update = true
	istr_rule_attr.b_query = true	
	istr_rule_attr.b_excel = true
	istr_rule_attr.b_print = true
	istr_rule_attr.b_access = true
	istr_rule_attr.b_full_inherit = true
	return 1
end if

if  vds_policy.getitemstring(vl_row, 'full_inherit_yn') = 'Y' then
	istr_rule_attr.b_full_inherit = true
end if
if vds_policy.getitemstring(vl_row, 'print_yn') = 'Y' then
	istr_rule_attr.b_print = true
end if
if vds_policy.getitemstring(vl_row, 'excel_yn') = 'Y' then
	istr_rule_attr.b_excel = true
end if				
if vds_policy.getitemstring(vl_row, 'access_yn') = 'Y' then
	istr_rule_attr.b_access = true
end if			
if vds_policy.getitemstring(vl_row, 'delete_yn') = 'Y' then
	istr_rule_attr.b_delete = true
	istr_rule_attr.b_insert = true
	istr_rule_attr.b_update = true
	istr_rule_attr.b_query = true
elseif vds_policy.getitemstring(vl_row, 'insert_yn') = 'Y' then
	istr_rule_attr.b_delete = false
	istr_rule_attr.b_insert = true
	istr_rule_attr.b_update = true
	istr_rule_attr.b_query = true	
elseif vds_policy.getitemstring(vl_row, 'update_yn') = 'Y' then
	istr_rule_attr.b_delete = false
	istr_rule_attr.b_insert = false
	istr_rule_attr.b_update = true
	istr_rule_attr.b_query = true			
elseif vds_policy.getitemstring(vl_row, 'query_yn') = 'Y' then
	istr_rule_attr.b_delete = false
	istr_rule_attr.b_insert = false
	istr_rule_attr.b_update = false
	istr_rule_attr.b_query = true
else
	istr_rule_attr.b_delete = false
	istr_rule_attr.b_insert = false
	istr_rule_attr.b_update = false
	istr_rule_attr.b_query = false	
	return 0
end if

return 1
	
end function

public subroutine f_set_rule_attr (s_str_policy_attr vstr_rule_attr);istr_rule_attr = vstr_rule_attr

end subroutine

public function s_str_policy_attr f_get_rule_attr ();return istr_rule_attr

end function

public function s_str_policy_attr f_get_security_attr ();return istr_security_attr
end function

public function integer f_set_security_attr (datastore vds_policy, long vl_row);
if vl_row = 0 then // user admin
	istr_security_attr.b_delete = true
	istr_security_attr.b_insert = true
	istr_security_attr.b_update = true
	istr_security_attr.b_query = true	
	istr_security_attr.b_excel = true
	istr_security_attr.b_print = true
	istr_security_attr.b_access = true
	istr_security_attr.b_full_inherit = true
	return 1
end if

return 1
	
end function

public subroutine f_set_security_attr (s_str_policy_attr vstr_policy_attr);istr_security_attr = vstr_policy_attr

end subroutine

public function integer f_set_editable_property_row (boolean vb_editing);string					ls_idKey_code[], ls_colname, ls_filterStr, ls_colname_str
int						li_colCnt, li_idx, li_rtn
s_object_display	lod_handle
window				lw_parent				
s_str_policy_attr	lstr_rule_attr[], lstr_security_attr[]
c_string				lc_string

this.f_getparentwindow( lw_parent)
lod_handle = lw_parent.dynamic f_get_obj_handling()
//-- Kiểm tra các cột có phân quyền phụ thuộc dữ liệu --//
li_rtn = lod_handle.f_get_dw_policy_attr( this, lstr_rule_attr[], lstr_security_attr[], ls_idkey_code[])
if li_rtn = -1 then return -1
if li_rtn > 0 then
	FOR li_idx =1 to li_rtn		
		//-- thêm dấu ";" ở cuối cột để tránh tình trạng nhầm lẫn khi pos các cột như include_tax_yn_t --//
		ls_colname = mid(ls_idKey_code[li_idx], lc_string.f_pos( ls_idKey_code[li_idx],'.', 2)+1) + ';'
		if pos(ls_colname,'m_') > 0 then continue
		if right(ls_colname,3) = '_t;' then ls_colname = mid(ls_colname,1,pos(ls_colname,'_t;') - 1)
		this.f_set_editable_column( ls_colname,vb_editing, lstr_rule_attr[li_idx], lstr_security_attr[li_idx])
		
		this.f_set_column_color( ls_colname, lstr_security_attr[li_idx], lstr_rule_attr[li_idx], vb_editing)	
		ls_colname_str += ';'+ls_colname 
	NEXT
end if

/*-- khóa vì đã thay đổi f_set_editable_column: modify chuuổi phụ thuộc diều kiện dữ liệu --//
//-- Kiểm tra các cột có cài đặt bảng phụ thuộc dữ liệu --//
//if ls_colname_str <> '' then ls_colname_str += ';'
//lstr_rule_attr[1] = this.istr_rule_attr
//lstr_security_attr[1] = this.istr_security_attr
//ls_filterStr = "upper(dwobject) = '"+ left(upper(this.dataobject), len(this.dataobject)-5) + "' AND ("
//ls_filterStr += " (not isnull(BACKCLR_CRITERIA_VAL)) or (not isnull(HIDDEN_CRITERIA_VAL)) or (not isnull(MUST_BOOKED_CRITERIA_VAL)) "
//ls_filterStr += " or (not isnull(MUST_SAVE_CRITERIA_VAL)) or (not isnull(DISPLAYONLY_CRITERIA_VAL)) or (not isnull(TEXTCLR_CRITERIA_VAL)) "
//ls_filterStr += " or (not isnull(VALUESET_CRITERIA_VAL)) )"
//lod_handle.idwsetup_initial.ids_setup_dw.setfilter( ls_filterStr)
//lod_handle.idwsetup_initial.ids_setup_dw.filter( )
//FOR li_idx =1 to lod_handle.idwsetup_initial.ids_setup_dw.rowcount( )
//	ls_colname = lod_handle.idwsetup_initial.ids_setup_dw.getitemstring( li_idx, 'DWCOLUMN')
//	if pos(ls_colname_str ,';'+ls_colname +';') = 0 then
//		this.f_set_editable_column( ls_colname,vb_editing, lstr_rule_attr[1], lstr_security_attr[1])
//		this.f_set_column_color( ls_colname, lstr_security_attr[1], lstr_rule_attr[1], vb_editing)			
//	end if
//NEXT
//lod_handle.idwsetup_initial.ids_setup_dw.setfilter('')
//lod_handle.idwsetup_initial.ids_setup_dw.filter( )	
 -- khóa ngày: 27/12/2016-- */

return 1

end function

public function integer f_set_editable_property_specfield (boolean vb_editing);window					lw_parent
s_object_display		lod_handle
c_string					lc_string
s_str_policy_attr		lstr_rule_attr[], lstr_security_attr[]
string						ls_idkey_code[], ls_filterstring, ls_colname
int							li_idx, li_rtn

this.f_getparentwindow( lw_parent)
lod_handle = lw_parent.dynamic f_get_obj_handling()
li_rtn = lod_handle.f_get_dw_policy_attr( this, lstr_rule_attr[], lstr_security_attr[], ls_idkey_code[])
if li_rtn = -1 then return -1
FOR li_idx =1 to li_rtn
	ls_colname = mid(ls_idKey_code[li_idx], lc_string.f_pos( ls_idKey_code[li_idx],'.', 2)+1)
	if right(ls_colname,2) = '_t' then ls_colname = mid(ls_colname,1,pos(ls_colname,'_t') - 1)
	this.f_set_editable_column( ls_colname,vb_editing, lstr_rule_attr[li_idx], lstr_security_attr[li_idx])
	this.f_set_column_color( ls_colname, lstr_security_attr[li_idx], lstr_rule_attr[li_idx], vb_editing)	
NEXT
return 1
/*
if gi_userid > 0 and isvalid(lod_handle.ids_policy_rule)  then
	//-- filter rule for column --//
	ls_idKey_code = lod_handle.classname( )+'.'+ left(this.dataobject, len(this.dataobject) - 5)+'.*'
	ls_filterString = lc_string.f_get_expression( ls_idKey_code, 'char()', 'identification_code', 'filter')	
	ls_filterString+= ' and isnull(dwobject_constraint)'
	lod_handle.ids_policy_rule.setfilter( ls_filterstring)
	lod_handle.ids_policy_rule.filter( )
	
	//-- filter security for column --//
//	ls_idKey_code = lod_handle.classname( )+'.'+ left(this.dataobject, len(this.dataobject) - 5)+'.*'
//	ls_filterString = lc_string.f_get_expression( ls_idKey_code, 'char()', 'identification_code', 'filter')	
//	ls_filterString+= ' and isnull(dwobject_constraint)'
	lod_handle.ids_policy_security.setfilter( ls_filterstring)
	lod_handle.ids_policy_security.filter( )
	
	//-- set escurity for column --//
	FOR li_idx = 1 to lod_handle.ids_policy_rule.rowcount( )
		ls_idKey_code = lod_handle.ids_policy_rule.getitemstring( li_idx, 'identification_code')
		if li_idx > 1 then
			if ls_idKey_code = lod_handle.ids_policy_rule.getitemstring( li_idx -1 , 'identification_code') then continue
		end if
//		this.f_get_policy_attr(lod_handle.ids_policy_rule, li_idx, lstr_rule_attr)
		
		li_rtn = lod_handle.ids_policy_security.find("identification_code ='"+ ls_idKey_code+"'",1, lod_handle.ids_policy_security.rowcount( ))
		if li_rtn = 0 then
			lstr_security_attr = this.istr_security_attr
		elseif li_rtn > 0 then
//			this.f_get_policy_attr(lod_handle.ids_policy_security, li_rtn, lstr_security_attr)
		end if
		ls_colname = mid(ls_idKey_code, lc_string.f_pos( ls_idKey_code,'.', 2)+1)
		if right(ls_colname,2) = '_t' then ls_colname = mid(ls_colname,1,pos(ls_colname,'_t') - 1)
		this.f_set_editable_column( ls_colname,vb_editing, lstr_rule_attr, lstr_security_attr)
		this.f_set_column_color( ls_colname, lstr_security_attr, lstr_rule_attr)
	NEXT
	
	//-- set escurity for column --//
	FOR li_idx = 1 to lod_handle.ids_policy_security.rowcount( )
		ls_idKey_code = lod_handle.ids_policy_security.getitemstring( li_idx, 'identification_code')
		if li_idx > 1 then
			if ls_idKey_code = lod_handle.ids_policy_security.getitemstring( li_idx -1 , 'identification_code') then continue
		end if		
//		this.f_get_policy_attr(lod_handle.ids_policy_security, li_idx, lstr_security_attr)
		
		li_rtn = lod_handle.ids_policy_rule.find( "identification_code ='"+ ls_idKey_code+"'",1, lod_handle.ids_policy_rule.rowcount( ))
		if li_rtn = 0 then
			lstr_rule_attr = this.istr_rule_attr
		elseif li_rtn > 0 then
			continue
		end if
		ls_colname = mid(ls_idKey_code, lc_string.f_pos( ls_idKey_code,'.', 2)+1)
		if right(ls_colname,2) = '_t' then ls_colname = mid(ls_colname,1,pos(ls_colname,'_t') - 1)
		this.f_set_editable_column( ls_colname,vb_editing, lstr_rule_attr, lstr_security_attr)
		this.f_set_column_color( ls_colname, lstr_security_attr, lstr_rule_attr)
	NEXT
	//-- tra lai filter --//
	lod_handle.ids_policy_security.setfilter( '')
	lod_handle.ids_policy_security.filter( )
	lod_handle.ids_policy_rule.setfilter( '')
	lod_handle.ids_policy_rule.filter( )
end if

return 1
*/

end function

public function integer f_set_backcolor_property_row ();string					ls_column, ls_idKey_code, ls_coltype, ls_filterStr, las_colname[]
int						li_colCnt, li_idx, li_rtn
boolean				lb_found
s_object_display	lod_handle
window				lw_parent				
s_str_policy_attr	 lstr_rule_attr, lstr_security_attr
c_string				lc_string

this.f_getparentwindow( lw_parent)
lod_handle = lw_parent.dynamic f_get_obj_handling()



if gi_userid > 0 and isvalid(lod_handle.ids_policy_rule)  then
	//-- filter rule for column --//
	ls_idKey_code = lod_handle.classname( )+'.'+ left(this.dataobject, len(this.dataobject) - 5)+'.*'
	ls_filterStr = lc_string.f_get_expression( ls_idKey_code, 'char()', 'identification_code', 'filter')	
	ls_filterStr+= ' and not isnull(dwobject_constraint)'
	lod_handle.ids_policy_rule.setfilter( ls_filterStr)
	lod_handle.ids_policy_rule.filter( )
	
	//-- filter security for column --//
	ls_idKey_code = lod_handle.classname( )+'.'+ left(this.dataobject, len(this.dataobject) - 5)+'.*'
	ls_filterStr = lc_string.f_get_expression( ls_idKey_code, 'char()', 'identification_code', 'filter')	
	ls_filterStr+= ' and not isnull(dwobject_constraint)'
	lod_handle.ids_policy_security.setfilter( ls_filterStr)
	lod_handle.ids_policy_security.filter( )
	
	//-- set escurity for column --//
	FOR li_idx = 1 to lod_handle.ids_policy_rule.rowcount( )
		//-- kiềm tra rule có applied theo đúng diều kiện ko --//
		if g_user.i_rule.f_is_policy_applied( lod_handle.ids_policy_rule, li_idx, lw_parent) then
			this.dynamic f_get_policy_attr(lod_handle.ids_policy_rule, li_idx, lstr_rule_attr)
		else
			continue
		end if		
		//-- tìm security của idkey --//
		ls_idKey_code = lod_handle.ids_policy_rule.getitemstring( li_idx, 'identification_code')
		li_rtn = lod_handle.ids_policy_security.find(  "identification_code ='" + ls_idKey_code+"'",1, lod_handle.ids_policy_security.rowcount( ))
		if li_rtn = 0 then
			lstr_security_attr = this.istr_security_attr
		elseif li_rtn > 0 then
			DO
				if g_user.i_rule.f_is_policy_applied( lod_handle.ids_policy_security, li_rtn, lw_parent) then
					this.dynamic f_get_policy_attr(lod_handle.ids_policy_security, li_rtn, lstr_security_attr)
					lb_found = true
				end if				
				li_rtn = lod_handle.ids_policy_security.find(  "identification_code ='" + ls_idKey_code+"'",li_rtn+1, lod_handle.ids_policy_security.rowcount( )+1)
			LOOP WHILE li_rtn > 0
			if not lb_found then lstr_security_attr = this.istr_security_attr
		end if
		ls_column = mid(ls_idKey_code, lc_string.f_pos( ls_idKey_code,'.', 2)+1)
		if right(ls_column,2) = '_t' then ls_column = mid(ls_column,1,pos(ls_column,'_t') - 1)
		
		//-- set color cho field --//
//		this.f_set_column_color( ls_column, lstr_security_attr, lstr_rule_attr)
		
	NEXT
	
	//-- set escurity for column --//
	FOR li_idx = 1 to lod_handle.ids_policy_security.rowcount( )
		if g_user.i_rule.f_is_policy_applied( lod_handle.ids_policy_security, li_idx, lw_parent) then
			this.dynamic f_get_policy_attr(lod_handle.ids_policy_security, li_idx, lstr_security_attr)
		else
			continue
		end if				
		ls_idKey_code = lod_handle.ids_policy_security.getitemstring( li_idx, 'identification_code')
		li_rtn = lod_handle.ids_policy_rule.find(  "identification_code ='" + ls_idKey_code+"'",1, lod_handle.ids_policy_rule.rowcount( ))
		if li_rtn = 0 then
			lstr_rule_attr = this.istr_rule_attr
		elseif li_rtn > 0 then
			continue
		end if
		
		ls_column = mid(ls_idKey_code, lc_string.f_pos( ls_idKey_code,'.', 2)+1)
		if right(ls_column,2) = '_t' then ls_column = mid(ls_column,1,pos(ls_column,'_t') - 1)

		//-- set color cho field --//
//		this.f_set_column_color( ls_column, lstr_security_attr, lstr_rule_attr)
		
	NEXT
	//-- tra lai filter --//
	lod_handle.ids_policy_security.setfilter( '')
	lod_handle.ids_policy_security.filter( )
	lod_handle.ids_policy_rule.setfilter( '')
	lod_handle.ids_policy_rule.filter( )
end if			

return 1	
end function

public subroutine f_set_currentwhere (string vs_currentwhereclause); is_currentWhere = vs_currentwhereclause 
end subroutine

public function string f_get_currentwhere ();return is_currentWhere 
end function

public function integer f_add_where (string vs_where, string vs_operator);string					ls_currentSQL, ls_currentWhere, ls_rtn, ls_modify

c_sql					lc_sql
c_string				lc_string

//vs_where = lc_string.f_GlobalReplace(vs_where,"'","~~'")

if this.dynamic f_getcurrentSQL( ls_currentSQL, ls_currentWhere) =1 then
	if ls_currentWhere <> "" then
		ls_currentWhere= "("+ls_currentWhere +") " + vs_operator + " (" + vs_where +")"	
	else
		ls_currentWhere = vs_where
	end if	
//	ls_currentSQL += " WHERE " + ls_currentWhere
//	ls_currentSQL = lc_string.f_globalreplace(ls_currentSQL, "'", "~~'")
	lc_sql.f_addtowhereclause( ls_currentSQL, ls_currentWhere, " AND ")
	ls_modify = "Datawindow.Table.Select= '" + ls_currentSQL +"'"
	ls_rtn =this.modify(ls_modify )
	if ls_rtn <> '' then
		gf_messagebox('m.t_dw.f_add_where.01','Thông báo','Lỗi t_dw.f_add_where: line 12:', 'exclamation','ok',1)
		return -1
	end if
end if		
	
return 1
end function

public function long f_retrieve_dwc (string vs_colname);long							ll_rowcount, ll_where_len, ll_percent, ll_setup_row
int								li_count, li_idx, li_dwcwidth, li_colwidth
string							ls_rtn_colname, ls_displaycolname, ls_return_column,ls_receive_column, ls_dddwo, ls_dwo,ls_object_name, ls_coltype, ls_dwdatatype
string							ls_rtn, ls_originalsql_nowhere, ls_where_rec, ls_whereclause, ls_originalwhere, ls_rebuild_dwc_sql, ls_dwc_filter, ls_dddwo_setup
string							ls_col_string, ls_dwo_tmp
boolean						lb_firstdrop
any							laa_value[]
double						ldb_setup_id

datawindowchild				ldwc
datawindow					ldw_main
s_object_display			lpo_valueset, lod_handling
s_str_dwo_related			lstr_data_related[]
window						lw_parent
c_string						lc_string
c_dwservice					lc_dwservice
c_sql							lc_sql
b_obj_instantiate			lbo_ins

if this.getchild( vs_colname, ldwc) = -1 then return -1
ls_coltype =  this.describe( vs_colname+ '.coltype' )
ls_dddwo = this.describe( vs_colname+ '.dddw.name' )
lc_dwservice.f_getcurrentsql( ldwc, ls_originalsql_nowhere,ls_originalwhere)

//-- build where theo gia trị phụ thuộc --//
if this.f_getparentwindow( lw_parent) = 1 then
	lod_handling = lw_parent.dynamic f_get_obj_handling()
end if
if this.classname( ) = 'dw_filter' then
	ldw_main = lw_parent.dynamic f_get_dwmain( )
	ls_dwo =  left(ldw_main.dataobject, len(ldw_main.dataobject) - 5)
else
	ls_dwo =  left(this.dataobject, len(this.dataobject) - 5)
end if

ll_setup_row = lod_handling.idwsetup_initial.f_get_dwdatatype_string(vs_colname, ls_coltype, this, ls_dwdatatype)
if ll_setup_row > 0 then
	ls_dddwo_setup = lod_handling.idwsetup_initial.ids_setup_dw.getitemstring(ll_setup_row, 'object_ref_code')
	if isnull(ls_dddwo_setup) then ls_dddwo_setup = ''
	//-- đổi dwo theo điều kiện nếu có --//
	if left(ls_dddwo, 2) = 'd_' then
		ls_dwo_tmp = left(ls_dddwo, len(ls_dddwo) -5)
	else
		ls_dwo_tmp = ls_dddwo
	end if
	if ls_dddwo_setup <> ls_dwo_tmp and ls_dddwo_setup <> '' then
		this.f_create_dddw( ll_setup_row,  ls_dddwo_setup)
		if this.getchild( vs_colname, ldwc) = -1 then return -1
		lc_dwservice.f_getcurrentsql( ldwc, ls_originalsql_nowhere,ls_originalwhere)
		ls_dddwo = ls_dddwo_setup + '_grid' //-- gắn 5 ký tự cuối để cắt đi cho giống các trường hợp khác --//
	end if
	
	ls_return_column =  lod_handling.idwsetup_initial.ids_setup_dw.getitemstring(ll_setup_row, 'return_column')
	lod_handling.idwsetup_initial.is_return_column = ls_return_column
	ls_receive_column = lod_handling.idwsetup_initial.ids_setup_dw.getitemstring(ll_setup_row,'receive_column')
	lod_handling.idwsetup_initial.is_receive_column = ls_receive_column
	ls_displaycolname = lod_handling.idwsetup_initial.ids_setup_dw.getitemstring( ll_setup_row, 'display_column')	
	if lastpos(ls_displaycolname,';') < len(ls_displaycolname) then ls_displaycolname +=';'	
	ldb_setup_id = lod_handling.idwsetup_initial.ids_setup_dw.getitemnumber(ll_setup_row,'ID')
	lod_handling.idwsetup_initial.ids_setup_dw.setfilter("ID ="+string(ldb_setup_id) + " and not isnull(DWVALUESET_RELATED_COLUMN)")
	lod_handling.idwsetup_initial.ids_setup_dw.filter( )
else
	return -1
end if

if pos(lower(ls_originalsql_nowhere), 'gutter') > 1 then
	lb_firstdrop = true
	//-- build record where security --//
	ls_object_name = lod_handling.idwsetup_initial.ids_setup_dw.getitemstring( ll_setup_row, 'object')
	ls_where_rec = lc_dwservice.f_buildwhere_rec_security( ldwc, mid(ls_dddwo,ll_setup_row,len(ls_dddwo)-5),ls_object_name)
	if ls_where_rec <> '' then
		if ls_originalwhere <> '' then ls_originalwhere+= ' AND '	
		ls_originalwhere += ls_where_rec
	end if
	if ls_originalwhere <> '' then
		istr_dddw_where.s_dddwo += ls_dddwo +';'
		istr_dddw_where.s_originalwhere += ls_originalwhere+';'
	end if	
	
	/*
	//-- kết hợp tất cả các cột hiển thị --//
	DO
		ls_rtn_colname =  lc_string.f_gettoken(ls_return_column , ';') + ';'
		if pos(ls_displaycolname, ls_rtn_colname) = 0 then
			ls_displaycolname += ls_rtn_colname
		end if
	LOOP WHILE  ls_return_column <> ''
	
//	//-- thêm column obj_search --//
//	if lower(ldwc.describe( "DataWindow.Table.Update") ) = 'valueset_value' then 
//		ls_displaycolname += 'obj_search;'
//		lc_dwservice.f_getcurrentsql( ldwc, ls_originalsql_nowhere,ls_originalwhere)
//		lbo_ins.f_left_join_dwh_search( 'd_valueset_entry_grid', ls_originalsql_nowhere)
//	end if	
	
	this.f_rebuild_dwc_SQL( ldwc,ls_displaycolname)
	lc_dwservice.f_getcurrentsql( ldwc, ls_originalsql_nowhere,ls_originalwhere)
	*/
end if	


lpo_valueset = create using 'u_valueset'
//-- Khởi tạo data related structure --//
lpo_valueset.dynamic f_get_data_related(lod_handling.idwsetup_initial.ids_setup_dw,lstr_data_related[], lod_handling)
//-- build data related --//
lw_parent.dynamic f_build_data_related( lstr_data_related[]) 

li_count = lc_dwservice.f_buildwhereclause_of_relation(ldwc, lstr_data_related[])
FOR li_idx = 1 to li_count
	if ls_whereclause <> '' then ls_whereclause +=  ' AND '
	ls_whereclause+=  lstr_data_related[li_idx].s_where	
NEXT
if ls_whereclause <> '' then ls_whereclause = '('+ls_whereclause+')'
destroy lpo_valueset

//-- lấy lại orginal where --//
ls_originalwhere = this.istr_dddw_where.s_originalwhere
if ls_originalwhere <> '' then
	if pos(this.istr_dddw_where.s_dddwo, ls_dddwo+';') = 0 then
		ls_originalwhere = ''
	else
		ls_rtn = mid(this.istr_dddw_where.s_dddwo,1 ,pos(this.istr_dddw_where.s_dddwo, ls_dddwo+';')+len(ls_dddwo))
		li_count = lc_string.f_countoccurrences(ls_rtn, ';')	
		if li_count = 1 then
			ls_originalwhere = mid(ls_originalwhere,1,pos(ls_originalwhere,';') -1)
		elseif li_count > 1 then
			ll_where_len = lc_string.f_pos(ls_originalwhere , ';', li_count) - lc_string.f_pos(ls_originalwhere , ';', li_count -1) - 1
			ls_originalwhere = mid(ls_originalwhere, lc_string.f_pos(ls_originalwhere , ';', li_count -1)+1, ll_where_len)
		end if
	end if
end if

if ls_whereclause <> '' then
	if ls_originalwhere <> '' then ls_whereclause = ls_originalwhere + ' AND ' + ls_whereclause
else
	ls_whereclause = ls_originalwhere
end if
lc_sql.f_addtowhereclause(ls_originalsql_nowhere,ls_whereclause , ' AND ')	
ls_rebuild_dwc_sql = 'Datawindow.Table.Select= ~"' + ls_originalsql_nowhere +'~"'
ls_rtn = ldwc.modify( ls_rebuild_dwc_sql)
//-- kiem tra language --//
if lc_dwservice.f_is_lang_dwc(ldwc ) then
	laa_value[1] = gs_user_lang
	ls_col_string = 'lang;'
//	lc_dwservice.f_add_where_dwc(ldwc,'lang;',laa_value[])
end if
//-- add where comapny --//
if lc_dwservice.f_is_company(ldwc ) then
	laa_value[upperbound(laa_value[])+1] = gi_user_comp_id
	ls_col_string += 'company_id;'
end if
//-- add where branch --//
if lc_dwservice.f_is_branch(ldwc ) then
	laa_value[upperbound(laa_value[])+1] = gdb_branch
	ls_col_string += 'branch_id;'
end if
if upperbound(laa_value[]) > 0 then
	lc_dwservice.f_add_where_dwc(ldwc, ls_col_string, laa_value[])
end if

if ls_rtn <> '' then
	gf_messagebox('m.t_dw_mpl.f_retrieve_dwc.01','Thông báo','Không modify SQL được:t_dw_mpl.f_retrieve_dwc()line:57','exclamation','ok',1) 
	return -1
end if
//-- resize dddwc --//
if lb_firstdrop then
	li_dwcwidth = lc_dwservice.f_getwidth( ldwc)
	li_colwidth = integer(this.describe( vs_colname +'.width'))
	ll_percent = li_dwcwidth/li_colwidth*100
	ls_rtn = this.Modify( vs_colname+ '.dddw.percentwidth='+string(ll_percent) )
end if

ldwc.settransobject( sqlca)
//ls_dwc_filter = this.gettext( )
//if isnull(ls_dwc_filter) then ls_dwc_filter =''
//if ls_dwc_filter <> '' then
//	ldwc.SetFilter("upper("+ ls_dddw_displaycol +") like '%"+ upper(ls_dwc_filter)+"%' ")
//else
	ldwc.setfilter( "")
//end if
ll_rowcount = ldwc.retrieve( )
lc_dwservice.f_set_gutter_rowcount(ldwc)

lod_handling.idwsetup_initial.ids_setup_dw.setfilter( "")
lod_handling.idwsetup_initial.ids_setup_dw.filter( )
lod_handling.idwsetup_initial.is_receive_column =''
return ll_rowcount
end function

public function integer f_rebuild_dwc_sql (ref datawindowchild rdwc_dddw, string vs_columns);
string					ls_currentSQL, ls_rebuildSQL, ls_dbname, ls_rtn, las_original_colname[], ls_delcol[]
string					las_dbname[], ls_empty[]
int						li_idx, li_rtn, li_colCnt
boolean				lb_notexist
c_sql					lc_sql
t_s_sql_attr 			lastr_sql[]
c_string				lc_string
c_dwservice			lc_dwservice

//-- lấy các cột không cần thiết --//
li_colCnt = lc_dwservice.f_getcolumns(rdwc_dddw, las_original_colname[] )
FOR li_idx = 1 to li_colCnt
	if pos(vs_columns, las_original_colname[li_idx]+';') = 0 then
		ls_delcol[upperbound(ls_delcol) + 1] = las_original_colname[li_idx]
	end if
NEXT

if lc_dwservice.f_get_tablesql( rdwc_dddw,ls_currentSQL) = 1 then
	li_rtn = lc_sql.f_parse(ls_currentSQL, lastr_sql[])
	if li_rtn = 1 then
		//-- Remove ORDER BY clause --//
		lastr_sql[1].s_order = ""	
		//- remove khoảng trắng trước dấu (,) --//
		lastr_sql[1].s_columns = lc_string.f_removesqlwhitespace(lastr_sql[1].s_columns )
//		 lc_string.f_globalreplace(  lastr_sql[1].s_columns , ' ,', ',',   lastr_sql[1].s_columns)
		For li_idx = 1 To upperbound(ls_delcol[] )				
			//-- Replace the selected columns of the detail by the linkage columns --//		
			if ls_delcol[li_idx] <>'gutter' then
				ls_dbname = rdwc_dddw.describe(ls_delcol[li_idx] + ".DBAlias")
				if pos(ls_dbname,'.') = 1 or ls_dbname = '?' then
					ls_dbname =  rdwc_dddw.describe(ls_delcol[li_idx] + ".DBName")
					if ls_dbname = '!' then
						ls_dbname = ls_delcol[li_idx]
					elseif ls_dbname = '?' then				
						messagebox('Thông báo','Không lấy được DBalias (dddw):@'+ls_delcol[li_idx] )
						return -1
					end if
				end if	
				//-- replace các cột xoá--//
				li_rtn = lc_string.f_globalreplace(  lastr_sql[1].s_columns , ls_dbname+',', '',   lastr_sql[1].s_columns)
				if li_rtn = 0 then
					 li_rtn = lc_string.f_globalreplace(  lastr_sql[1].s_columns , ls_dbname, '',   lastr_sql[1].s_columns)
					 if li_rtn = 0 then
						 li_rtn = lc_string.f_globalreplace(  lastr_sql[1].s_columns , "as "+ls_dbname+',', '',   lastr_sql[1].s_columns)
						 if li_rtn = 0 then
							li_rtn = lc_string.f_globalreplace(  lastr_sql[1].s_columns , "as "+ls_dbname, '',   lastr_sql[1].s_columns)
						 end if
					end if
				end if				
			else
				ls_dbname = "~~'~~' as gutter"
				li_rtn = lc_string.f_globalreplace(  lastr_sql[1].s_columns , ls_dbname + ',', '',   lastr_sql[1].s_columns)
				if li_rtn = 0 then
					ls_dbname = "~~'~~' gutter"
					li_rtn = lc_string.f_globalreplace(  lastr_sql[1].s_columns , ls_dbname + ',', '',   lastr_sql[1].s_columns)
				end if								
			end if
			//-- xoá dấu (,) nằm sau cùng --//
			if li_idx =  upperbound(ls_delcol[] ) then
				if lastpos(trim(lastr_sql[1].s_columns),',') = len(trim(lastr_sql[1].s_columns)) then
					lastr_sql[1].s_columns = mid(lastr_sql[1].s_columns,1,lastpos(lastr_sql[1].s_columns,',') -1)
				end if
			end if
			//-- destroy columname --//
			ls_rtn = rdwc_dddw.modify( " destroy column "+ls_delcol[li_idx])
			ls_rtn = rdwc_dddw.modify( " destroy "+ls_delcol[li_idx]+'_t')		
		Next			
		
		// Rebuild the detail SQL
		ls_rebuildSQL = lc_sql.f_Assemble(lastr_sql)
		ls_rebuildSQL = "Datawindow.Table.Select= ~'" + ls_rebuildSQL +"~'"
		ls_rtn =rdwc_dddw.modify(ls_rebuildSQL )		

		if ls_rtn <> '' then			
			gf_messagebox('m.t_dw_mpl.f_rebuild_dwc_sql.01','Thông báo','Không modify SQL được:t_dw_mpl.f_rebuild_dwc_sql()line:53','exclamation','ok',1) 
			return -1
		end if
	end if
else
	return -1
end if
return 0

end function

public subroutine f_reset_policy_attr (ref s_str_policy_attr rstr_policy_attr);
//-- xóa giá trị biến --//
	rstr_policy_attr.b_delete = false
	rstr_policy_attr.b_insert = false
	rstr_policy_attr.b_update = false
	rstr_policy_attr.b_query = false	
	rstr_policy_attr.b_excel = false
	rstr_policy_attr.b_print = false
	rstr_policy_attr.b_access = false
	rstr_policy_attr.b_full_inherit = false

	
end subroutine

public function long f_get_policy_attr_union (s_str_policy_attr vstr_policy_attr, ref s_str_policy_attr rstr_policy_attr);
	rstr_policy_attr.b_delete = rstr_policy_attr.b_delete or vstr_policy_attr.b_delete
	rstr_policy_attr.b_insert = rstr_policy_attr.b_insert or vstr_policy_attr.b_insert
	rstr_policy_attr.b_update = rstr_policy_attr.b_update or vstr_policy_attr.b_update
	rstr_policy_attr.b_query = rstr_policy_attr.b_query or vstr_policy_attr.b_query	
	rstr_policy_attr.b_excel = rstr_policy_attr.b_excel or vstr_policy_attr.b_excel
	rstr_policy_attr.b_print = rstr_policy_attr.b_print or vstr_policy_attr.b_print
	rstr_policy_attr.b_access = rstr_policy_attr.b_access or vstr_policy_attr.b_access
	rstr_policy_attr.b_full_inherit = rstr_policy_attr.b_full_inherit or vstr_policy_attr.b_full_inherit
	
return 1

	
end function

public function long f_get_policy_attr (datastore vds_policy, long vl_row, ref s_str_policy_attr rstr_policy_attr);//string						ls_idKey_code, ls_dwobject_const


//-- xóa giá trị biến --//
	rstr_policy_attr.b_delete = false
	rstr_policy_attr.b_insert = false
	rstr_policy_attr.b_update = false
	rstr_policy_attr.b_query = false	
	rstr_policy_attr.b_excel = false
	rstr_policy_attr.b_print = false
	rstr_policy_attr.b_access = false
	rstr_policy_attr.b_full_inherit = false

if vl_row = 0 then // user admin
	rstr_policy_attr.b_delete = true
	rstr_policy_attr.b_insert = true
	rstr_policy_attr.b_update = true
	rstr_policy_attr.b_query = true	
	rstr_policy_attr.b_excel = true
	rstr_policy_attr.b_print = true
	rstr_policy_attr.b_access = true
	rstr_policy_attr.b_full_inherit = true
	return 1
end if

if vds_policy.rowcount() = 0 then	return 0
//vl_row = vl_row
//ls_idKey_code = vds_policy.getitemstring( vl_row, 'identification_code')
//DO
//	ll_rtn_row = vl_row
	if  vds_policy.getitemstring(vl_row, 'full_inherit_yn') = 'Y' then
		rstr_policy_attr.b_full_inherit = true
	end if
	if vds_policy.getitemstring(vl_row, 'print_yn') = 'Y' then
		rstr_policy_attr.b_print = true
	end if
	if vds_policy.getitemstring(vl_row, 'excel_yn') = 'Y' then
		rstr_policy_attr.b_excel = true
	end if				
	if vds_policy.getitemstring(vl_row, 'access_yn') = 'Y' then
		rstr_policy_attr.b_access = true
	end if				
	
	if vds_policy.getitemstring(vl_row, 'delete_yn') = 'Y' then
		rstr_policy_attr.b_delete = true
		rstr_policy_attr.b_insert = true
		rstr_policy_attr.b_update = true
		rstr_policy_attr.b_query = true
	elseif vds_policy.getitemstring(vl_row, 'insert_yn') = 'Y' then
		rstr_policy_attr.b_delete = false
		rstr_policy_attr.b_insert = true
		rstr_policy_attr.b_update = true
		rstr_policy_attr.b_query = true	
	elseif vds_policy.getitemstring(vl_row, 'update_yn') = 'Y' then
		rstr_policy_attr.b_delete = false
		rstr_policy_attr.b_insert = false
		rstr_policy_attr.b_update = true
		rstr_policy_attr.b_query = true			
	elseif vds_policy.getitemstring(vl_row, 'query_yn') = 'Y' then
		rstr_policy_attr.b_delete = false 
		rstr_policy_attr.b_insert = false
		rstr_policy_attr.b_update = false
		rstr_policy_attr.b_query = true
	else
		rstr_policy_attr.b_delete = false
		rstr_policy_attr.b_insert = false
		rstr_policy_attr.b_update = false
		rstr_policy_attr.b_query = false				
	end if

return 1

	
end function

public function integer f_set_column_color (string vs_colname, s_str_policy_attr vstr_security_attr, s_str_policy_attr vstr_rule_attr, boolean vb_editing);
string			ls_backgoundcolor, ls_currentrowcolor, ls_mustsavecolor, ls_mustbookedcolor,ls_displayonlycolor
string			ls_rtn, ls_coltype, ls_must_save_string, ls_must_book_string, ls_displayonly_dwsetup, ls_backclr_setup
string			ls_modstring_color, ls_modstring_currentrow, ls_modstring_required, ls_modstring_mustsave, ls_modstring_mustbooked
boolean		lb_updatable_policy
window 				lw_parent
s_object_display	lod_handle

if this.f_getparentwindow( lw_parent)=1 then
	lod_handle = lw_parent.dynamic f_get_obj_handling()
end if

if  this.describe( vs_colname + ".x") = '?' then return 0 //-- nếu cột không hiển thì thì không kiểm tra --//

ls_coltype = this.describe( vs_colname + ".coltype")
if ls_coltype = 'datetime' then
	this.modify(vs_colname+ ".alignment='2'")
end if
ls_backclr_setup = lod_handle.idwsetup_initial.f_get_backcolor_string(this.dataobject, vs_colname, ls_coltype)
ls_backgoundcolor = string(536870912)

if ls_backclr_setup = 'default' then	
	ls_mustsavecolor = string(rgb(255,206,206)) // do nhat
	ls_mustbookedcolor = string(rgb(255,255,174)) // vang nhat
	if lod_handle.classname( ) = 'b_view' or upper(left(lod_handle.classname( ),3)) = 'UR_' then
		ls_displayonlycolor = string(536870912) // trang backgound
	else
		ls_displayonlycolor = string(rgb(239,239,239)) //xam
	end if
	ls_currentrowcolor =string(rgb(255,231,99)) //vàng nâu
	
	ls_modstring_color = ls_backgoundcolor
	
	//-- modify mau cua record hien tai --//
	if this.f_isgrid( ) then
		ls_modstring_currentrow = "If(getrow()=currentrow(),"+ls_currentrowcolor+","+ls_backgoundcolor+")"
	else
		ls_modstring_currentrow = ls_backgoundcolor
	end if
	//-- Nếu không đang chế độ thảo và khóa bàn phím --//
	if this.ib_keyboardlocked and not vb_editing then
		if this.f_isgrid( ) then
			ls_modstring_color +=  '~~t'+ls_modstring_currentrow
		end if
	else
		ls_modstring_mustsave = "If(getrow()=currentrow(),"+ls_mustsavecolor+","+ls_backgoundcolor+")" 	
		ls_modstring_mustbooked = "If(getrow()=currentrow(),"+ls_mustbookedcolor+","+ls_backgoundcolor+")" 	 
		
		//-- modify mau cot bat buoc co khi lưu--//
		ls_must_save_string =  lod_handle.idwsetup_initial.f_get_must_save_string(this.dataobject, vs_colname, ls_coltype)
		if ls_must_save_string = 'yes' then
			ls_modstring_required = ls_modstring_mustsave	
		elseif  ls_must_save_string = 'no' then
		//	ls_modstring_required = ls_modstring_currentrow
		else
			ls_modstring_required  = "If("+ls_must_save_string+"= ~~'yes~~',"+ls_modstring_mustsave+" ,"+ ls_modstring_currentrow+")"
		end if
		
		//-- modify mau cot bat buoc co khi ghi so--//
		if ls_modstring_required = '' then
			ls_must_book_string =  lod_handle.idwsetup_initial.f_get_must_booked_string(this.dataobject, vs_colname, ls_coltype)
			if ls_must_book_string = 'yes' then
				ls_modstring_required = ls_modstring_mustbooked
			elseif  ls_must_book_string = 'no' then
				ls_modstring_required = ls_modstring_currentrow
			else
				ls_modstring_required  = "If("+ls_must_book_string+"= ~~'yes~~',"+ls_modstring_mustbooked+" ,"+ ls_modstring_currentrow+")"	
			end if
		end if
		
		//-- modify mau cot display only --//
		ls_displayonly_dwsetup = lod_handle.idwsetup_initial.f_get_displayonly_string(this.dataobject ,vs_colname, ls_coltype)
		//-- dwsetup ko được edit thì ko cần kiểm tra phân quyền --//
		if  ls_displayonly_dwsetup = 'yes'  then
			ls_modstring_color = ls_displayonlycolor 
		else
			lb_updatable_policy = this.dynamic f_get_ib_update(vstr_security_attr, vstr_rule_attr)
			//-- check security fields --//
			lb_updatable_policy = (gi_userid = 0) or lb_updatable_policy and ( isnull(is_editable_fields) or pos(is_editable_fields, vs_colname+';') > 0)			
			//-- kiem tra phan quyen --//
			if not lb_updatable_policy then
				ls_modstring_color += "~~tIf(getrow()=currentrow(),"+ls_displayonlycolor+","+ls_backgoundcolor+")"
			elseif lb_updatable_policy and  ls_displayonly_dwsetup = 'no'  then		
				ls_modstring_color += "~~t"+ ls_modstring_required
			elseif lb_updatable_policy and  ls_displayonly_dwsetup <> 'no'  then
				ls_modstring_color += "~tIf("+ls_displayonly_dwsetup+"= ~~'yes~~',"+ls_displayonlycolor+" ,"+ ls_modstring_required+")"		
			end if
		end if
	end if
else
	ls_modstring_color = ls_backgoundcolor+ "~~t"+ls_backclr_setup
end if

ls_modstring_color = vs_colname+ '.background.mode=0 '+vs_colname+".background.color=~'"+ ls_modstring_color+ "~'"
	
ls_rtn = this.modify( ls_modstring_color)
if ls_rtn <> '' then
	messagebox('Lỗi modify','t_dw.f_set_column_color:line 62:@'+ vs_colname)
	return -1
end if
return 1
end function

public function integer f_set_column_color (string vs_colname, boolean vb_editing);
return this.f_set_column_color( vs_colname, istr_security_attr, istr_rule_attr, vb_editing )

end function

public function integer f_create_dddw (long vl_setup_row);
string						ls_rtn, ls_dddwo, ls_datacolname, ls_displaycolname, ls_dddw_colname, ls_DWdatatype, lsa_dispcols[]
int							li_limit, li_Cnt, li_percent
c_string					lc_string
window					lw_display
s_object_display		lod_handle

this.f_getparentwindow( lw_display)
lod_handle = lw_display.dynamic f_get_obj_handling()

//-- Khởi tạo valueset object (1)--//
if lod_handle.idwsetup_initial.ids_setup_dw.rowcount( ) > 0 then
	ls_dddw_colname =  lod_handle.idwsetup_initial.ids_setup_dw.getitemstring( vl_setup_row, 'dwcolumn')	
	IF  this.describe(ls_dddw_colname + ".Edit.Style")  = 'dddw' then 
		if this.describe( ls_dddw_colname+ '.dddw.name') <>'' then	return 1
	end if
	
	ls_DWdatatype =  lod_handle.idwsetup_initial.ids_setup_dw.getitemstring( vl_setup_row, 'DWDATATYPE')
	if ls_DWdatatype = 'dwo' then
		ls_dddwo =  lod_handle.idwsetup_initial.ids_setup_dw.getitemstring( vl_setup_row, 'object_ref_code')
		if ls_dddwo = '' or isnull(ls_dddwo) then return 0
		if left(ls_dddwo, 2) = 'd_' then
			ls_dddwo += '_grid'
		elseif left(ls_dddwo, 3) <> 'dd_' then
			return 0
		end if
	else
		return 0
	end if

	li_limit = lod_handle.idwsetup_initial.ids_setup_dw.getitemnumber( vl_setup_row, 'limit')
	ls_displaycolname =  lod_handle.idwsetup_initial.ids_setup_dw.getitemstring( vl_setup_row, 'display_column')
	li_Cnt = lc_string.f_stringtoarray( ls_displaycolname, ';',  lsa_dispcols[])
	if li_Cnt > 5 then
		li_percent = 700
	else
		li_percent = 150* li_Cnt
	end if	
	ls_datacolname = lc_string.f_gettoken(ls_displaycolname , ';')



	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.name=' +  ls_dddwo ) 
	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.autoretrieve=no' ) 		
	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.useasborder=yes' ) 
	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.hscrollbar=yes' ) 
	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.hscrollbar=yes' )  
	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.vscrollbar=yes' )
	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.AutoHScroll=yes' )
	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.allowedit=yes' )	
	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.nilisnull=yes' )	
	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.displaycolumn=' +  ls_datacolname) 		
	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.datacolumn=' + ls_datacolname ) 
	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.lines= 0' )
	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.percentwidth=' +string(li_percent) )
	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.limit=' +string(li_limit) )

end if
return 1
end function

public function string f_get_data_value_ddlb (string vs_data, string vs_colname);c_string	lc_string
string 	ls_source,ls_rtn,ls_char,ls_mid,ls_source_values[],ls_source_value,ls_mids[],ls_left,ls_right
int			li_i,li_count_char,li_rtn,li_j


ls_source = vs_data
ls_rtn = ''
if pos(ls_source,'>') > 0 or pos(ls_source,'<') > 0 or pos(ls_source,'=') > 0 or (pos(ls_source,'(') > 0 and pos(ls_source,')') > 0) then
	if match(ls_source,'^<> *') then
		if pos(ls_source,'(') = 0 then
			ls_mid = trim(mid(ls_source,pos(ls_source,'>') + 1,len(ls_source)))
			ls_left = trim(left(ls_source,pos(ls_source,'>')))
		else
			ls_mid = trim(mid(ls_source,pos(ls_source,'(')+1,pos(ls_source,')') - pos(ls_source,'(')-1))
			ls_left = trim(left(ls_source,pos(ls_source,'(')))
			ls_right = trim(right(ls_source,len(ls_source) - pos(ls_source,')')+1))
		end if
	elseif match(ls_source,'^<= *') or match(ls_source,'^>= *') then
		if pos(ls_source,'(') = 0 then
			ls_mid = trim(mid(ls_source,pos(ls_source,'=') + 1,len(ls_source)))
			ls_left = trim(left(ls_source,pos(ls_source,'=')))
		else
			ls_mid = trim(mid(ls_source,pos(ls_source,'(') +1,pos(ls_source,')') - pos(ls_source,'(')-1 ))
			ls_left = trim(left(ls_source,pos(ls_source,'(')))
			ls_right = trim(right(ls_source,len(ls_source) - pos(ls_source,')')+1))
		end if
	elseif match(ls_source,'^< *') then
		if pos(ls_source,'(') = 0 then
			ls_mid = trim(mid(ls_source,pos(ls_source,'<') + 1,len(ls_source)))
			ls_left = trim(left(ls_source,pos(ls_source,'<')))
		else
			ls_mid = trim(mid(ls_source,pos(ls_source,'(') +1,pos(ls_source,')') - pos(ls_source,'(')-1 ))
			ls_left = trim(left(ls_source,pos(ls_source,'(')))
			ls_right = trim(right(ls_source,len(ls_source) - pos(ls_source,')')+1))
		end if
	elseif match(ls_source,'^> *') then
		if pos(ls_source,'(') = 0 then
			ls_mid = trim(mid(ls_source,pos(ls_source,'>') + 1,len(ls_source)))
			ls_left = trim(left(ls_source,pos(ls_source,'>')))
		else
			ls_mid = trim(mid(ls_source,pos(ls_source,'(') +1,pos(ls_source,')') - pos(ls_source,'(')-1 ))
			ls_left = trim(left(ls_source,pos(ls_source,'(')))
			ls_right = trim(right(ls_source,len(ls_source) - pos(ls_source,')')+1))
		end if
	elseif pos(ls_source,'(') > 0 and pos(ls_source,')') > 0 then
		ls_mid = trim(mid(ls_source,pos(ls_source,'(') +1,pos(ls_source,')') - pos(ls_source,'(')-1 ))
		ls_left = trim(left(ls_source,pos(ls_source,'(')))
		ls_right = trim(right(ls_source,len(ls_source) - pos(ls_source,')')+1))
	end if
else
	ls_mid = vs_data
end if

ls_source_value = this.describe(vs_colname+ '.values')
li_rtn = lc_string.f_stringtoarray(ls_source_value,'/',ls_source_values[])
if pos(ls_mid,';') = 0 then
	if li_rtn <> 0 then
		for li_i = 1 to UpperBound(ls_source_values[])
			if pos(lower(ls_source_values[li_i]),lower(trim(ls_mid))) > 0 then
				li_rtn = pos(ls_source_values[li_i],'~t')
				ls_rtn = mid(ls_source_values[li_i],li_rtn+1,len(ls_source_values[li_i]) - li_rtn)
				exit
			end if
		next
	end if
else
	li_rtn = lc_string.f_stringtoarray(ls_mid,';',ls_mids[])
	for li_i = 1 to UpperBound(ls_mids[])
		for li_j = 1 to UpperBound(ls_source_values[])
			if pos(lower(ls_source_values[li_j]),lower(trim(ls_mids[li_i]))) > 0 then
				li_rtn = pos(ls_source_values[li_j],'~t')
				ls_rtn = ls_rtn + mid(ls_source_values[li_j],li_rtn+1,len(ls_source_values[li_j]) - li_rtn)
				if li_i <> UpperBound(ls_mids[]) then
					ls_rtn += ';'
				end if
				exit
			end if
		next
	next
end if
ls_rtn = ls_left + ls_rtn + ls_right

return ls_rtn
end function

public function integer f_create_dddw (long vl_setup_row, string vs_new_dddwo);
string						ls_rtn, ls_dddwo, ls_datacolname, ls_displaycolname, ls_dddw_colname,  lsa_dispcols[]
int							li_limit, li_Cnt, li_percent
c_string					lc_string
window					lw_display
s_object_display		lod_handle

this.f_getparentwindow( lw_display)
lod_handle = lw_display.dynamic f_get_obj_handling()

//-- Khởi tạo valueset object (2) --//
if lod_handle.idwsetup_initial.ids_setup_dw.rowcount( ) > 0 then
	ls_dddw_colname =  lod_handle.idwsetup_initial.ids_setup_dw.getitemstring( vl_setup_row, 'dwcolumn')	
	IF  this.describe(ls_dddw_colname + ".Edit.Style")  = 'dddw' then 
		if this.describe( ls_dddw_colname+ '.dddw.name') = vs_new_dddwo then	return 0
	end if

	ls_dddwo =  lod_handle.idwsetup_initial.ids_setup_dw.getitemstring( vl_setup_row, 'object_ref_code')
	if ls_dddwo = '' or isnull(ls_dddwo) then return 0
	if left(ls_dddwo, 2) = 'd_' then
		ls_dddwo += '_grid'
	end if

	li_limit = lod_handle.idwsetup_initial.ids_setup_dw.getitemnumber( vl_setup_row, 'limit')
	ls_displaycolname =  lod_handle.idwsetup_initial.ids_setup_dw.getitemstring( vl_setup_row, 'display_column')
	li_Cnt = lc_string.f_stringtoarray( ls_displaycolname, ';',  lsa_dispcols[])
	if li_Cnt > 5 then
		li_percent = 700
	else
		li_percent = 150* li_Cnt
	end if		
	ls_datacolname = lc_string.f_gettoken(ls_displaycolname , ';')



	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.name=' +  ls_dddwo ) 
	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.autoretrieve=no' ) 		
	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.useasborder=yes' ) 
	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.hscrollbar=yes' ) 
	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.hscrollbar=yes' )  
	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.vscrollbar=yes' )
	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.AutoHScroll=yes' )
	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.allowedit=yes' )	
	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.nilisnull=yes' )	
	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.displaycolumn=' +  ls_datacolname) 		
	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.datacolumn=' + ls_datacolname ) 
	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.lines= 0' )
	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.percentwidth=' +string(li_percent) )
	ls_rtn = this.Modify( ls_dddw_colname+ '.dddw.limit=' +string(li_limit) )

end if
return 1
end function

public function integer f_parse_filterstring (string vs_filterstring, ref string vsa_colname[], ref string vsa_colvalue[]);/*******************************************************************************************
Chức năng: Chuyển chuỗi cú pháp filter "vs_filterStrig" thành mảng tên cột "vsa_colname" và mảng giá trị filter "vsa_colvalue"
--------------------------------------------------------------------------------------------------------------------------------------------------
Return:  thành công trả về số phần tử của mảng tên cột, lỗi trả về -1
=================================================================================*/



return 1
end function

public subroutine f_set_ib_version_copying (boolean vb_version_copying);
this.ib_version_copying = vb_version_copying
end subroutine

public function boolean f_get_ib_version_copying ();
return this.ib_version_copying
end function

public function integer f_send_message_to_object (integer vi_xpos, integer vi_ypos, long vl_row, ref datawindow rdw_handling, string vs_message);int 					li_rtn
s_object_display	lpo_handling
window				lw_display
if this.f_getparentwindow( lw_display) = 1 then
	lpo_handling = lw_display.dynamic f_get_obj_handling()
	if isvalid(lpo_handling) then
		return lpo_handling.f_handle_message( vi_xpos, vi_ypos, vl_row, rdw_handling, vs_message)
	end if
end if
return -1
end function

public function integer f_add_where_to_origin (string vs_where, string vs_operator);string					ls_currentSQL, ls_currentWhere, ls_rtn, ls_modify

c_sql					lc_sql
c_string				lc_string

if not isnull(this.is_originalsql_nowhere) and is_originalsql_nowhere <>''  then
	ls_currentSQL = this.is_originalsql_nowhere	
	ls_currentWhere = this.is_originalwhereclause
else
	this.dynamic f_getcurrentSQL( ls_currentSQL, ls_currentWhere) 
end if	

if ls_currentWhere <> "" then
	ls_currentWhere= "("+ls_currentWhere +") " + vs_operator + " (" + vs_where +")"	
else
	ls_currentWhere = vs_where
end if	
	
lc_sql.f_addtowhereclause( ls_currentSQL, ls_currentWhere, " AND ")
ls_modify = "Datawindow.Table.Select= '" + ls_currentSQL +"'"
ls_rtn =this.modify(ls_modify )
if ls_rtn <> '' then
	gf_messagebox('m.t_dw.f_add_where.01','Thông báo','Lỗi t_dw.f_add_where: line 12:', 'exclamation','ok',1)
	return -1
end if
	
return 1
end function

public function integer f_add_where_to_origin (string vs_columns, any va_data[]);string					ls_currentSQL, ls_currentWhere, ls_rtn, las_columns[], ls_colType, ls_modify, ls_dbname, ls_value
int						li_colCount, li_idx
c_dwservice			lc_dwservice
c_sql					lc_sql
c_string				lc_string

if not isnull(is_originalsql_nowhere) and is_originalsql_nowhere <> ''  then
	ls_currentSQL = is_originalsql_nowhere
	ls_currentWhere = is_originalwhereclause
else
	this.dynamic f_getcurrentSQL( ls_currentSQL, ls_currentWhere)
	ls_currentWhere =''
end if


li_colCount = lc_string.f_stringtoarray( vs_columns,';', las_columns[])
FOR li_idx =1 to li_colCount
	ls_dbname =  las_columns[li_idx]
	if lc_dwservice.f_get_build_column( this,ls_dbname, ls_colType) = -1 then
		return -1			
	end if

	if ls_currentWhere <> '' then ls_currentWhere += ' AND '
	ls_currentWhere += lc_string.f_get_expression( string(va_data[li_idx] ), ls_colType, ls_dbname, 'build where')		
NEXT

lc_sql.f_addtowhereclause( ls_currentSQL, ls_currentWhere, " AND ")
ls_modify = "Datawindow.Table.Select= '" + ls_currentSQL +"'"
ls_rtn =this.modify(ls_modify )
if ls_rtn <> '' then
	gf_messagebox('m.t_dw.f_add_where.01','Thông báo','Lỗi t_dw.f_add_where: line 29: (@'+ this.dataobject+'@)', 'exclamation','ok',1)
	return -1
end if
	
return 1
end function

public function integer f_assembly_where (string vs_sql, string vs_where);
string			ls_sql, ls_modify, ls_rtn

	ls_sql = vs_sql + " WHERE " + vs_where
	ls_modify = "Datawindow.Table.Select= '" + ls_sql +"'"
	ls_rtn =this.modify(ls_modify )
	if ls_rtn <> '' then
		gf_messagebox('m.t_dw.f_add_where.01','Thông báo','Lỗi t_dw.f_add_where: line 12:', 'exclamation','ok',1)
		return -1
	end if

return 1
end function

public function long f_set_gutter_rowcount ();
long		ll_rowCnt,ll_len
string		ls_gutter_text

if this.describe( "gutter_t.x") <> '?' and this.describe( "gutter_t.x") <> '!' then
	ll_rowCnt = this.rowcount( )
	this.modify( "gutter_t.text = '["+string(ll_rowCnt) +"]'" )
	ls_gutter_text = this.describe( "gutter_t.text")
	ll_len =len(ls_gutter_text)*35
	this.modify( "gutter_t.x = 9 gutter_t.width="+string(ll_len))
	this.modify( "gutter.x = 9 gutter.width="+string(ll_len))
	this.modify( "b_form.x =9 b_form.width="+string(ll_len))	
	this.modify("gutter_t.color  = '" +string(rgb(0,0,255))+"'")
end if
return ll_rowCnt
end function

public function integer f_get_max_tabseq ();int		li_seq, li_i, li_taborder, li_maxtaborder
string	ls_cols[]


li_seq = this.f_getcolumns_visible(  ls_cols[]) //this.f_get_visiblecolumns( ls_cols[])

For li_i=1 To li_seq
	li_taborder = Long(this.describe(ls_cols[li_i] + ".TabSequence"))	
	If (li_taborder > li_maxtaborder) Then
		li_maxtaborder = li_taborder
	End If
Next

return li_maxtaborder
end function

public function string f_getlastcolumn_visible ();//	Arguments:
//	  ab_editableonly:True -> Only take into account columns that can be modified.
//							False -> Take all columns into account (even protected ones).
//
//	Returns:	String
//	  Name of the last column (empty string if an error occured).


String	ls_columns[],ls_protect, ls_visible, ls_displayonly
Integer	li_i,li_max, li_lastcolumn = 0, li_pos, ll_cnt_noedit
Integer	li_taborder, li_maxtaborder = 0



li_max = this.f_GetColumns(ls_columns)
For li_i=1 To li_max
	li_taborder = Long(this.describe(ls_columns[li_i] + ".TabSequence"))
	

	ls_visible = this.describe(ls_columns[li_i] + ".Visible")
		

	
	If ls_visible = "1" and (li_taborder > li_maxtaborder) Then
		li_maxtaborder = li_taborder
		li_lastcolumn = li_i
	End If
Next

If li_lastcolumn > 0 Then
	Return ls_columns[li_lastcolumn]
Else
	Return ""
End If

end function

public function integer f_check_col_moving (integer vi_moved_col_x, integer vi_xpos);string			ls_colname, ls_style, ls_lbttndown_colname, ls_last_colname
int				li_tabseq, li_max_seq
		
if this.f_isgrid( ) then	
//	if right(vs_colname,2) = '_t'  then
//		ls_colname = left(vs_colname, len(string(vs_colname)) -2)
//	else
//		ls_colname =vs_colname
//	end if
	
	if  right(is_lbttndown_colname,2) = '_t'  then
		ls_lbttndown_colname =  left(is_lbttndown_colname, len(string(is_lbttndown_colname)) -2)
	else
		ls_lbttndown_colname = is_lbttndown_colname
	end if
	ls_style =  this.describe(ls_lbttndown_colname+ ".edit.style")
	if ls_style = 'checkbox' then
		li_max_seq = this.f_get_max_tabseq( )
		li_tabseq = integer(this.describe(ls_lbttndown_colname+".tabsequence" ))		
//		if ls_colname = 'datawindow' then 				
//			ls_last_colname = this.f_getlastcolumn_visible( )
//			li_tabseq = integer(this.describe( ls_last_colname+'.x' ))
//			if li_tabseq <  PixelsToUnits(vi_xpos, XPixelsToUnits!) then
//				li_tabseq = li_max_seq
//			else
//				li_tabseq = li_max_seq  -1
//			end if
//		else
//			li_tabseq = integer(this.describe( ls_colname+'.x' ))
//			if  li_tabseq >  PixelsToUnits(vi_xpos, XPixelsToUnits!) then
//				li_tabseq = li_max_seq				
//			else
//				li_tabseq = integer(this.describe(ls_colname+".tabsequence" ))
//			end if
//		end if
		
		if li_tabseq = li_max_seq then

			this.modify( ls_lbttndown_colname+"_t.x ="+string(vi_moved_col_x))
			this.modify(  ls_lbttndown_colname+".x ="+string(vi_moved_col_x))			
			gf_messagebox('m.t_dw.f_check_col_moving.01','Thông báo','Không thể đặt cột kiểu CHECKBOX ở sau cùng','exclamation','ok',1)
			this.setredraw( true)
			il_lbttndown_colX =0

			return 0
		end if
	end if
end if
return 0
end function

public function integer f_set_horizontalpos (long vl_horzpos);this.setredraw( false)
this.modify( "DataWindow.HorizontalScrollPosition ="+string( vl_horzpos ))
this.setredraw( true)
return 1
end function

public function integer f_set_drilldown_color (string vs_colname);string					ls_rtn, ls_object, ls_modstring_color
window 				lw_parent
s_object_display	lod_handle

this.f_getparentwindow( lw_parent)
if lw_parent.classname() = 's_w_multi' then
	lod_handle = lw_parent.dynamic f_get_obj_handling()
	
	
	
	//-- modify mau cột có cài đặt drilldown --//
	ls_object =  lod_handle.idwsetup_initial.f_get_drilldown_object( this.dataobject, vs_colname) 
	if ls_object<>'' and not isnull(ls_object) then
		ls_modstring_color = vs_colname+".color=~'"+ string(rgb(0,164,0))+"~'"
		ls_rtn= this.modify( ls_modstring_color)
		if ls_rtn <> '' then
			messagebox('Lỗi modify','t_dw.f_set_drilldown_color:line 14:@'+vs_colname)
			return -1
		end if
		setpointer(Hyperlink!)
		return 1
	end if
end if
setpointer(arrow!)
return 1
end function

public subroutine f_set_attach_gutter_color ();
this.modify("gutter.color= '33554432~tif( isnull (attachment_line_no),0 ,rgb(0,255,0)) '")

end subroutine

public subroutine f_set_number_format (string vs_colname, boolean lb_report);string		ls_format_dec, ls_format_nbr, ls_modstring, ls_rtn

if lb_report then
	ls_format_dec = '#,##0.00'
else
	ls_format_dec = '#,##0.#########'
end if
ls_format_nbr = '#,##0'
ls_modstring = vs_colname + ".format = ~'[general]~~tif (round("+vs_colname+",0)= "+vs_colname+",~~'"+ls_format_nbr+"~~',~~'"+ls_format_dec+"~~') ~'"
ls_rtn = this.modify( ls_modstring)
end subroutine

public function integer f_change_where (string vs_where);string					ls_currentSQL, ls_currentWhere, ls_rtn, ls_modify

c_sql					lc_sql
c_string				lc_string

//vs_where = lc_string.f_GlobalReplace(vs_where,"'","~~'")

if this.dynamic f_getcurrentSQL( ls_currentSQL, ls_currentWhere) =1 then

	ls_currentWhere = vs_where

	lc_sql.f_addtowhereclause( ls_currentSQL, ls_currentWhere, " AND ")
	ls_modify = "Datawindow.Table.Select= '" + ls_currentSQL +"'"
	ls_rtn =this.modify(ls_modify )
	if ls_rtn <> '' then
		gf_messagebox('m.t_dw.f_add_where.01','Thông báo','Lỗi t_dw.f_add_where: line 12:', 'exclamation','ok',1)
		return -1
	end if
end if		
	
return 1
end function

public function integer f_send_message_to_object (ref datawindow rdw_handling, string vs_message, keycode v_keycode, integer v_keyflags);int 					li_rtn
s_object_display		lpo_handling
window				lw_display

if this.f_getparentwindow( lw_display) = 1 then
	lpo_handling = lw_display.dynamic f_get_obj_handling()
	if isvalid(lpo_handling) then
		return lpo_handling.f_handle_message(rdw_handling, vs_message, v_keycode, v_keyflags)
	end if
end if
return -1

end function

public function long f_retrieve_dwc_dwfilter (string vs_colname);any							laa_value[]
string							ls_col_string, ls_dwo, ls_objectname
long							ll_rowcount
datawindowchild			ldwc
datawindow					ldw_main
s_w_main						lw_parent
c_dwservice					lc_dwservice
s_object_display			lsod_handle

if this.getchild( vs_colname, ldwc) = -1 then return -1

//-- build where theo gia trị phụ thuộc --//
if this.f_getparentwindow( lw_parent) <> 1 then return 0
lsod_handle = lw_parent.f_get_obj_handling( )

ldw_main = lw_parent.dynamic f_get_dwmain( )
ls_dwo = ldw_main.dataobject
if left(ls_dwo,2)= 'd_' then
	ls_dwo =  left(ls_dwo, len(ls_dwo) - 5)
end if


if ls_dwo = this.getitemstring( 1, 'dwo') then return 0

ls_objectname =lsod_handle.classname( )
if ls_objectname = 'u_valueset' and left(ls_dwo,3)= 'dd_'  then
	ls_objectname = ls_dwo
elseif  ls_objectname = 'u_valueset' and left(ls_dwo,2)= 'd_' then
	ls_objectname = mid(ls_dwo,3)
end if

this.setitem( 1, 'dwo', ls_dwo)
laa_value[1] = '='+gs_user_lang
laa_value[2] = '='+ls_dwo
laa_value[3] = ls_objectname

ls_col_string = 'lang;DWOBJECT;SUBCODE;'

lc_dwservice.f_add_where_dwc(ldwc, ls_col_string, laa_value[])
	
ldwc.settransobject( sqlca)
	
ll_rowcount = ldwc.retrieve( )
if ll_rowcount > 0 then ldwc.insertrow(1)
return ll_rowcount
end function

public function long f_getheight (integer vi_nbr_of_row);Integer	li_Bands, li_Cnt, li_group_level, li_header_cnt, ll_find
long		ll_height
long		ll_detail
String	ls_DWBands, ls_Band[]
c_obj_service lobj_srv

ls_DWBands = This.Describe("DataWindow.Bands")

li_Bands = lobj_srv.f_StringToArray (ls_DWBands, "~t", ls_Band)

For li_Cnt = 1 To li_Bands
	If ls_Band[li_Cnt] <> "detail" Then
		if pos(ls_Band[li_Cnt],'header.')> 0 then
			li_group_level = Integer(mid(ls_Band[li_Cnt], pos(ls_Band[li_Cnt], '.') + 1 ))
			ll_find = this.findgroupchange( 1, li_group_level )
			li_header_cnt = 0
			DO while ll_find > 0
				li_header_cnt++
				ll_find = this.findgroupchange( ll_find+1, li_group_level )
			LOOP 
		else
			li_header_cnt = 1
		end if
		ll_Height += li_header_cnt * Integer(This.Describe("Datawindow." + ls_Band[li_Cnt] + ".Height"))
	End if
Next

ll_Detail = vi_nbr_of_row * Integer(This.Describe("Datawindow.Detail.Height"))

ll_Height += ll_Detail

Return ll_Height
end function

public function integer f_getcolumns_visible (ref string as_columns[]);Integer	li_columns_count
String	ls_syntax,ls_columns[], ls_colname, ls_visible
Long		ll_poscol,ll_posname

ls_syntax = this.describe("Datawindow.syntax")

If IsNull(ls_syntax) or Len(ls_syntax) = 0 Then Return -1 

ll_poscol = Pos(ls_syntax,"column(")
Do While (ll_poscol > 0)
	ll_posname = Pos(ls_syntax,"name=",ll_poscol)
	ll_posname += 5
	
	ls_colname = Trim(Mid(ls_syntax,ll_posname,Pos(ls_syntax," ",ll_posname)-ll_posname))
	ls_visible = this.describe(ls_colname + ".Visible")
	if ls_visible = '1' then
		li_columns_count ++
		ls_columns[li_columns_count] =Trim(Mid(ls_syntax,ll_posname,Pos(ls_syntax," ",ll_posname)-ll_posname))
	end if
	ll_poscol = Pos(ls_syntax,"column(",ll_poscol+1)
Loop

as_columns = ls_columns

Return li_columns_count

end function

public function integer f_get_object_in_taborder_visible (ref string ras_object_in_taborder[]);int				li_colCount, li_counter, li_tabseq, li_row
string			las_object[]
datastore	lds_object_in_taborder

lds_object_in_taborder = create datastore
lds_object_in_taborder.dataobject = 'ds_colname_in_taborder'
li_colCount = this.f_getcolumns_visible( las_object[])
if li_colCount = 0 then
	//gf_messagebox('m.t_dw.f_get_object_in_taborder.01','Thông bao','Không tìm thấy DWO:@'+this.dataobject,'exclamation','ok',1)
	return -1
elseif li_colCount = -1 then
	gf_messagebox('m.t_dw.f_get_object_in_taborder.01','Thông báo','Không tìm thấy DWO:@'+this.dataobject,'exclamation','ok',1)
	return -1
end if

FOR li_counter = 1 to li_colCount
	li_tabseq = integer(this.describe( las_object[li_counter]+".tabsequence" ))
	li_row = lds_object_in_taborder.insertrow( 0)
	lds_object_in_taborder.setitem( li_row, 'colname', las_object[li_counter])
	lds_object_in_taborder.setitem( li_row, 'tabsequence', li_tabseq)
NEXT

lds_object_in_taborder.setsort( "tabsequence asc" )
lds_object_in_taborder.sort( )
ras_object_in_taborder[] = lds_object_in_taborder.object.colname.primary

return li_row
end function

public function integer f_get_cols_in_tabseq_visible (ref string ras_object_in_taborder[]);int					 		li_rowCnt
any						la_data[]
s_object_display		lod_handle
window					lw_display

if this.f_isgrid( ) then
	this.f_getparentwindow(lw_display) 
	lod_handle = lw_display.dynamic f_get_obj_handling()
	lod_handle.ids_user_profile.setfilter( "dwobject = '"+ this.dataobject +"'")
	if lod_handle.ids_user_profile.filter( ) = -1 then
		gf_messagebox('m.t_dw.f_get_object_in_taborder_of_user.01','Thông báo','Lỗi filter ids_user_profile:f_get_object_in_taborder_of_user','stop','ok',1)
	end if
	
	li_rowCnt =  lod_handle.ids_user_profile.rowcount( ) 

	if li_rowCnt > 0 then
		lod_handle.ids_user_profile.setsort( "tabseq asc")
		lod_handle.ids_user_profile.sort( )
		ras_object_in_taborder[] = lod_handle.ids_user_profile.object.dwcontrol.primary
	end if 
		
	if li_rowCnt = 0 then
		li_rowCnt = this.f_get_object_in_taborder_visible(ras_object_in_taborder[])
	end if
	lod_handle.ids_user_profile.setfilter("")
	lod_handle.ids_user_profile.filter( )	
else
	li_rowCnt = this.f_get_object_in_taborder_visible(ras_object_in_taborder[])
end if

return li_rowCnt

end function

public function long f_retrieve_dwc_dwfilter (string vs_colname, string vs_dwo);any							laa_value[]
string							ls_col_string, ls_dwo, ls_objectname
long							ll_rowcount
datawindowchild			ldwc
datawindow					ldw_main
s_w_main						lw_parent
c_dwservice					lc_dwservice
s_object_display			lsod_handle

if this.getchild( vs_colname, ldwc) = -1 then return -1

//-- build where theo gia trị phụ thuộc --//
ls_dwo = vs_dwo
if left(ls_dwo,2)= 'd_' then
	ls_dwo =  left(ls_dwo, len(ls_dwo) - 5)
end if
if ls_dwo = this.getitemstring( 1, 'dwo') then return 0

if this.f_getparentwindow( lw_parent) <> 1 then return 0
lsod_handle = lw_parent.f_get_obj_handling( )
ls_objectname =lsod_handle.classname( )
if ls_objectname = 'u_valueset' and left(ls_dwo,3)= 'dd_'  then
	ls_objectname = ls_dwo
elseif  ls_objectname = 'u_valueset' and left(ls_dwo,2)= 'd_' then
	ls_objectname = mid(ls_dwo,3)
end if

this.setitem( 1, 'dwo', ls_dwo)
laa_value[1] = '='+gs_user_lang
laa_value[2] = '='+ls_dwo
laa_value[3] = ls_objectname

ls_col_string = 'lang;DWOBJECT;SUBCODE;'

lc_dwservice.f_add_where_dwc(ldwc, ls_col_string, laa_value[])
	
ldwc.settransobject( sqlca)
	
ll_rowcount = ldwc.retrieve( )
if ll_rowcount > 0 then ldwc.insertrow(1)
return ll_rowcount
end function

public function long f_retrieve_dwc_ex (string vs_colname);long							ll_rowcount, ll_where_len, ll_percent, ll_setup_row
int								li_count, li_idx, li_dwcwidth, li_colwidth
string							ls_rtn_colname, ls_displaycolname, ls_return_column,ls_receive_column, ls_dddwo, ls_dwo,ls_object_name, ls_coltype, ls_dwdatatype
string							ls_rtn, ls_originalsql_nowhere, ls_where_rec, ls_whereclause, ls_originalwhere, ls_rebuild_dwc_sql, ls_dwc_filter, ls_dddwo_setup
string							ls_col_string, ls_dwo_tmp, ls_dwo_rec
boolean						lb_firstdrop
any							laa_value[]
double						ldb_setup_id

datawindowchild				ldwc
datawindow					ldw_main
s_object_display			lpo_valueset, lod_handling
s_str_dwo_related			lstr_data_related[]
s_w_main					lw_parent
c_string						lc_string
c_dwservice					lc_dwservice
c_sql							lc_sql
b_obj_instantiate			lbo_ins
t_ds_db						lds_dwsetup

t_transaction				lt_transaction

if this.getchild( vs_colname, ldwc) = -1 then return -1

//if ldwc.rowcount() > 0 then
//	ldwc.setfilter( "")
//	ldwc.filter( )
//	return ldwc.rowcount() 
//end if

ls_coltype =  this.describe( vs_colname+ '.coltype' )
ls_dddwo = this.describe( vs_colname+ '.dddw.name' )
//lc_dwservice.f_getcurrentsql( ldwc, ls_originalsql_nowhere,ls_originalwhere)
lc_dwservice.f_getorginsql( ls_dddwo,  ls_originalsql_nowhere,ls_originalwhere)


//-- build where theo gia trị phụ thuộc --//
if this.f_getparentwindow( lw_parent) = 1 then
	lod_handling = lw_parent.dynamic f_get_obj_handling()
end if
if this.classname( ) = 'dw_filter' then
	ldw_main = lw_parent.dynamic f_get_dwmain( )
	ls_dwo =  left(ldw_main.dataobject, len(ldw_main.dataobject) - 5)
else
	ls_dwo =  left(this.dataobject, len(this.dataobject) - 5)
end if

ll_setup_row = lod_handling.idwsetup_initial.f_get_dwdatatype_string(vs_colname, ls_coltype, this, ls_dwdatatype)
if ll_setup_row > 0 then
	ls_dddwo_setup = lod_handling.idwsetup_initial.ids_setup_dw.getitemstring(ll_setup_row, 'object_ref_code')
	if isnull(ls_dddwo_setup) then ls_dddwo_setup = ''
	//-- đổi dwo theo điều kiện nếu có --//
	if left(ls_dddwo, 2) = 'd_' then
		ls_dwo_tmp = left(ls_dddwo, len(ls_dddwo) -5)
	else
		ls_dwo_tmp = ls_dddwo
	end if
	if ls_dddwo_setup <> ls_dwo_tmp and ls_dddwo_setup <> '' then
		this.f_create_dddw( ll_setup_row,  ls_dddwo_setup)
		if this.getchild( vs_colname, ldwc) = -1 then return -1
		lc_dwservice.f_getcurrentsql( ldwc, ls_originalsql_nowhere,ls_originalwhere)
		ls_dddwo = ls_dddwo_setup + '_grid' //-- gắn 5 ký tự cuối để cắt đi cho giống các trường hợp khác --//
	end if
	
	ls_return_column =  lod_handling.idwsetup_initial.ids_setup_dw.getitemstring(ll_setup_row, 'return_column')
	lod_handling.idwsetup_initial.is_return_column = ls_return_column
	ls_receive_column = lod_handling.idwsetup_initial.ids_setup_dw.getitemstring(ll_setup_row,'receive_column')
	lod_handling.idwsetup_initial.is_receive_column = ls_receive_column
	lod_handling.idwsetup_initial.is_ACCEPT_OUT_OF_LIST_YN = lod_handling.idwsetup_initial.ids_setup_dw.getitemstring(ll_setup_row,'ACCEPT_OUT_OF_LIST_YN')
	ls_displaycolname = lod_handling.idwsetup_initial.ids_setup_dw.getitemstring( ll_setup_row, 'display_column')	
	if lastpos(ls_displaycolname,';') < len(ls_displaycolname) then ls_displaycolname +=';'	
	ldb_setup_id = lod_handling.idwsetup_initial.ids_setup_dw.getitemnumber(ll_setup_row,'ID')
	lds_dwsetup = create t_ds_db
	lds_dwsetup.dataobject = lod_handling.idwsetup_initial.ids_setup_dw.dataobject
	lod_handling.idwsetup_initial.ids_setup_dw.rowscopy( 1, lod_handling.idwsetup_initial.ids_setup_dw.rowcount(), primary!, lds_dwsetup, 1, primary!)
	lds_dwsetup.setfilter("ID ="+string(ldb_setup_id) + " and not isnull(DWVALUESET_RELATED_COLUMN)")
	lds_dwsetup.filter( )
//	lod_handling.idwsetup_initial.ids_setup_dw.setfilter("ID ="+string(ldb_setup_id) + " and not isnull(DWVALUESET_RELATED_COLUMN)")
//	lod_handling.idwsetup_initial.ids_setup_dw.filter( )
else
	return -1
end if

lw_parent.f_get_transaction( lt_transaction) 

//if pos(lower(ls_originalsql_nowhere), 'gutter') > 1 then
if ldwc.rowcount() = 0 then
	lb_firstdrop = true

	
//	if ls_originalwhere <> '' then
//		istr_dddw_where.s_dddwo += ls_dddwo +';'
//		istr_dddw_where.s_originalwhere += ls_originalwhere+';'
//	end if	
	
	/*
	//-- kết hợp tất cả các cột hiển thị --//
	DO
		ls_rtn_colname =  lc_string.f_gettoken(ls_return_column , ';') + ';'
		if pos(ls_displaycolname, ls_rtn_colname) = 0 then
			ls_displaycolname += ls_rtn_colname
		end if
	LOOP WHILE  ls_return_column <> ''
	
//	//-- thêm column obj_search --//
//	if lower(ldwc.describe( "DataWindow.Table.Update") ) = 'valueset_value' then 
//		ls_displaycolname += 'obj_search;'
//		lc_dwservice.f_getcurrentsql( ldwc, ls_originalsql_nowhere,ls_originalwhere)
//		lbo_ins.f_left_join_dwh_search( 'd_valueset_entry_grid', ls_originalsql_nowhere)
//	end if	
	
	this.f_rebuild_dwc_SQL( ldwc,ls_displaycolname)
	lc_dwservice.f_getcurrentsql( ldwc, ls_originalsql_nowhere,ls_originalwhere)
	*/
end if	

lpo_valueset = create using 'u_valueset'
//-- Khởi tạo data related structure --//
lpo_valueset.dynamic f_get_data_related(lds_dwsetup,lstr_data_related[], lod_handling)
// kiểm tra đã retrieve rồi mà ko phục thuộc dữ liệu ko cần retrieve lại --//
if upperbound(lstr_data_related[]) > 0 and  ldwc.rowcount() > 0  then
	if lstr_data_related[1].s_criteria_type = 'fixed' then
//		lod_handling.idwsetup_initial.ids_setup_dw.setfilter( "")
//		lod_handling.idwsetup_initial.ids_setup_dw.filter( )
		return ldwc.rowcount() 
	end if
end if

//-- build record where security --//
ls_object_name = lod_handling.idwsetup_initial.ids_setup_dw.getitemstring( ll_setup_row, 'object_record_ref')
ls_dwo_rec = lod_handling.idwsetup_initial.ids_setup_dw.getitemstring( ll_setup_row, 'object_ref_name')
ls_where_rec = lc_dwservice.f_buildwhere_rec_security_ex( ldwc, ls_dwo_rec, upper(ls_object_name) )
if ls_where_rec <> '' then
	if ls_originalwhere <> '' then ls_originalwhere+= ' AND '	
	ls_originalwhere += ls_where_rec
end if
//-- build data related --//
lw_parent.dynamic f_build_data_related( lstr_data_related[]) 

li_count = lc_dwservice.f_buildwhereclause_of_relation(ldwc, lstr_data_related[])
FOR li_idx = 1 to li_count
	if ls_whereclause <> '' then ls_whereclause +=  ' AND '
	ls_whereclause+=  lstr_data_related[li_idx].s_where	
NEXT
if ls_whereclause <> '' then ls_whereclause = '('+ls_whereclause+')'
destroy lpo_valueset
destroy lds_dwsetup

//-- lấy lại orginal where --//
/* không dùng: 02/01/2021, thay thế = dwservice.f_getoriginsql() --//
ls_originalwhere = this.istr_dddw_where.s_originalwhere
if ls_originalwhere <> '' then
	if pos(this.istr_dddw_where.s_dddwo, ls_dddwo+';') = 0 then
		ls_originalwhere = ''
	else
		ls_rtn = mid(this.istr_dddw_where.s_dddwo,1 ,pos(this.istr_dddw_where.s_dddwo, ls_dddwo+';')+len(ls_dddwo))
		li_count = lc_string.f_countoccurrences(ls_rtn, ';')	
		if li_count = 1 then
			ls_originalwhere = mid(ls_originalwhere,1,pos(ls_originalwhere,';') -1)
		elseif li_count > 1 then
			ll_where_len = lc_string.f_pos(ls_originalwhere , ';', li_count) - lc_string.f_pos(ls_originalwhere , ';', li_count -1) - 1
			ls_originalwhere = mid(ls_originalwhere, lc_string.f_pos(ls_originalwhere , ';', li_count -1)+1, ll_where_len)
		end if
	end if
end if
*/
if ls_whereclause <> '' then
	if ls_originalwhere <> '' then ls_whereclause = ls_originalwhere + ' AND ' + ls_whereclause
else
	ls_whereclause = ls_originalwhere
end if
lc_sql.f_addtowhereclause(ls_originalsql_nowhere,ls_whereclause , ' AND ')	
ls_rebuild_dwc_sql = 'Datawindow.Table.Select= ~"' + ls_originalsql_nowhere +'~"'
ls_rtn = ldwc.modify( ls_rebuild_dwc_sql)
//-- kiem tra language --//
if lc_dwservice.f_is_lang_dwc(ldwc ) then
	laa_value[1] = gs_user_lang
	ls_col_string = 'lang;'
//	lc_dwservice.f_add_where_dwc(ldwc,'lang;',laa_value[])
end if
//-- add where comapny --//
if lc_dwservice.f_is_company(ldwc ) then
	laa_value[upperbound(laa_value[])+1] = gi_user_comp_id
	ls_col_string += 'company_id;'
end if
//-- add where branch --//
if ls_object_name <> '' and not isnull(ls_object_name) then
	connect using lt_transaction;
	if lbo_ins.f_is_branch_yn_ex( ls_object_name, lt_transaction) then
		laa_value[upperbound(laa_value[])+1] = gdb_branch
		ls_col_string += 'branch_id;'
	end if
	disconnect using lt_transaction;
end if
if upperbound(laa_value[]) > 0 then
	lc_dwservice.f_add_where_dwc(ldwc, ls_col_string, laa_value[])
end if

if ls_rtn <> '' then
	gf_messagebox('m.t_dw_mpl.f_retrieve_dwc.01','Thông báo','Không modify SQL được:t_dw_mpl.f_retrieve_dwc()line:57','exclamation','ok',1) 
	return -1
end if
//-- resize dddwc --//
if lb_firstdrop then
	li_dwcwidth = lc_dwservice.f_getwidth( ldwc)
	li_colwidth = integer(this.describe( vs_colname +'.width'))
	ll_percent = li_dwcwidth/li_colwidth*100
	ls_rtn = this.Modify( vs_colname+ '.dddw.percentwidth='+string(ll_percent) )
end if

ldwc.settransobject(lt_transaction)
//ls_dwc_filter = this.gettext( )
//if isnull(ls_dwc_filter) then ls_dwc_filter =''
//if ls_dwc_filter <> '' then
//	ldwc.SetFilter("upper("+ ls_dddw_displaycol +") like '%"+ upper(ls_dwc_filter)+"%' ")
//else
	ldwc.setfilter( "")
//end if
ll_rowcount = ldwc.retrieve( )

lc_dwservice.f_set_gutter_rowcount(ldwc)

//lod_handling.idwsetup_initial.ids_setup_dw.setfilter( "")
//lod_handling.idwsetup_initial.ids_setup_dw.filter( )
lod_handling.idwsetup_initial.is_receive_column =''
return ll_rowcount
end function

public function boolean f_iscomputes (string vs_colname);Integer	li_computes_count
String	ls_syntax,ls_computes[]
Long		ll_poscol,ll_posname

ls_syntax = this.describe("Datawindow.syntax")
If IsNull(ls_syntax) or Len(ls_syntax) = 0 Then Return false

ll_poscol = Pos(ls_syntax,"compute(")
Do While (ll_poscol > 0)
	ll_posname = Pos(ls_syntax,"name=",ll_poscol)
	ll_posname += 5
	
	li_computes_count ++
	
	if vs_colname =Trim(Mid(ls_syntax,ll_posname,Pos(ls_syntax," ",ll_posname)-ll_posname)) then
		return true
	end if
	
	ll_poscol = Pos(ls_syntax,"compute(",ll_poscol+1)
Loop

Return false

end function

public function integer f_getcolumns_update (ref string as_columns[]);Integer	li_columns_count
String	ls_syntax,ls_columns[]
Long		ll_poscol,ll_posname

ls_syntax = this.describe("Datawindow.syntax")

If IsNull(ls_syntax) or Len(ls_syntax) = 0 Then Return -1

ll_poscol = Pos(ls_syntax,"column(")
Do While (ll_poscol > 0)
	ll_posname = Pos(ls_syntax,"name=",ll_poscol)
	if Pos(ls_syntax,"update=yes",ll_poscol) < ll_posname then
		ll_posname += 5
	
		li_columns_count ++
	
		ls_columns[li_columns_count] =Trim(Mid(ls_syntax,ll_posname,Pos(ls_syntax," ",ll_posname)-ll_posname))
	end if
	ll_poscol = Pos(ls_syntax,"column(",ll_poscol+1)
Loop

as_columns = ls_columns

Return li_columns_count

end function

public subroutine f_set_security_fields (string ls_visible_fields, string ls_enable_fields);is_visible_fields = ls_visible_fields
is_editable_fields = ls_enable_fields
end subroutine

public function string f_get_filterstring_ex (t_dw_mpl vdw_main);string			ls_filterString, ls_colname[], ls_colType, ls_data, ls_operator,ls_value,ls_text,ls_data1
string			ls_rtn,ls_ref_expression,ls_ref_data,ls_ref_format,ls_editType
int				li_idx, li_colCnt,li_i
boolean		lb_isnumber = true
c_string		lc_string


li_colCnt = this.f_getcolumns(ls_colname[] )

FOR li_idx = 1 to li_colCnt
	if ls_colname[li_idx] = 'gutter' then continue
	ls_colType = vdw_main.describe(ls_colname[li_idx]+ ".colType")
	ls_editType = vdw_main.describe(ls_colname[li_idx] + ".Edit.Style")
	ls_data = lower(trim(this.getitemstring( 1, ls_colname[li_idx])))
	If left(ls_colType,5) = 'char(' then
//		if this.getcolumnname( ) = ls_colname[li_idx] then
//			if ls_editType = 'ddlb' then
//				ls_data = lower(trim(this.gettext( )))
//				ls_data = this.f_get_data_value_ddlb( ls_data, ls_colname[li_idx])
//			else
//				ls_data = lower(trim(this.gettext( )))
//			end if
//		else
//			if ls_editType = 'ddlb' then
//				ls_data = lower(trim(this.getitemstring( 1, ls_colname[li_idx])))
//				ls_data = this.f_get_data_value_ddlb( ls_data, ls_colname[li_idx])
//			else
//				ls_data = lower(trim(this.getitemstring( 1, ls_colname[li_idx])))
//			end if 
//		end if
		if isnull(ls_data) or ls_data = '' or ls_data = "'" then continue
		if len(ls_data) = 1 and (ls_data = '*' or ls_data = '=') then ls_data = '' 
		if ls_filterString <> '' then ls_filterString += " and "
		ls_filterString += lc_string.f_get_expression( ls_data, ls_colType,ls_colname[li_idx], 'filter')
		
	elseif left(ls_colType,5) = 'numbe' or  left(ls_colType,5) = 'decim' then
//		if this.describe(ls_colname[li_idx]+ "_qm.x") = '!' then
//			if this.getcolumnname( ) = ls_colname[li_idx] then
//				ls_data = trim(this.gettext( ))
//			else		
//				if  this.describe(ls_colname[li_idx] + "_filter.x") <> "!" then
//					ls_data = this.describe( ls_colname[li_idx] + '_filter.text' )
//				else
//					ls_data = ''
//				end if
//			end if
//		else
//			ls_data = this.describe(ls_colname[li_idx]+ "_qm.text")
//		end if
		if isnull(ls_data) or ls_data = '' then continue
		ls_data1 = ls_data
		if ls_filterString <> '' then ls_filterString += " and "
		
		ls_filterString += lc_string.f_get_expression( ls_data1, ls_colType,ls_colname[li_idx], 'filter')
		
	elseif left(ls_colType,5) = 'date' or  left(ls_colType,5) = 'datet' then
//		if this.describe(ls_colname[li_idx]+ "_qm.x") = '!' then
//			if this.getcolumnname( ) = ls_colname[li_idx] then
//				ls_data = trim(this.gettext( ))
//			else		
//				if  this.describe(ls_colname[li_idx] + "_filter.x") <> "!" then
//					ls_data = this.describe( ls_colname[li_idx] + '_filter.text' )
//				else
//					ls_data = ''
//				end if
//			end if
//		else
//			ls_data = this.describe(ls_colname[li_idx]+ "_qm.text")
//		end if
		if isnull(ls_data) or ls_data = '' then continue
		if ls_filterString <> '' then ls_filterString += " and "
		ls_filterString += lc_string.f_get_expression( ls_data, ls_colType,ls_colname[li_idx], 'filter')
	end if
NEXT 

return ls_filterString
end function

on t_dw.create
end on

on t_dw.destroy
end on

event constructor;s_w_main		lw_parent

if this.f_getparentwindow(lw_parent ) = 1 then
	if not lw_parent.f_get_ib_object_changing( )  then
		setnull(is_originalwhereClause)
		setnull(is_originalSQL_NoWhere)
		setnull(is_currentWhere)
	end if
end if
//-- Set ngôn ngữ --//
//t_w_mdi.ids_lang_text.post f_set_dw_lang(this)
end event

event clicked;datawindow		ldw_handling
string				ls_selected
long				ll_row_found, ll_row

s_object_display	lod_handle
s_w_main			lw_display

is_lbttndown_colname = dwo.name
il_lbttndown_colX = long(this.describe( is_lbttndown_colname+".x"))

//-- đóng w_menu --//
//if isvalid(t_w_menu) then
//	if t_w_menu.st_2.visible = true and t_w_menu.width > t_w_menu.p_1.width  then
//		t_w_menu.f_roll_in()
//	end if
//end if
ldw_handling = this
this.f_getparentwindow( lw_display)
lod_handle = lw_display.f_get_obj_handling( )
if row > 0 then
	//-- Xử lý chọn khi click vào gutter --//
	
	If dwo.name = 'gutter' then		
//		this.modify("gutter_t.text= '[ ]'")
		ls_selected = this.getitemstring( row, 'gutter')
		if keydown(KeyShift!) then
			if ls_selected ='N' or isnull(ls_selected) then
				this.setitem( row, 'gutter', 'Y')
				ll_row_found = this.find( "gutter ='Y'", 1, row+1)
				if  ll_row_found > 0 and ll_row_found < row  then
					FOR ll_row = ll_row_found to row -1
						this.setitem( ll_row, 'gutter', 'Y')
					NEXT
				else
					ll_row_found = this.find( "gutter ='Y'", row+1, this.rowcount()+1)
					if  ll_row_found > 0 then
						FOR ll_row = row+1 to ll_row_found -1
							this.setitem( ll_row, 'gutter', 'Y')
						NEXT						
					end if
				end if
			else
				this.setitem( row, 'gutter', 'N')
				ll_row_found = this.find( "gutter ='Y'", 1, row+1)
				if  ll_row_found > 0 and ll_row_found < row  then
					FOR ll_row = ll_row_found to row -1
						this.setitem( ll_row, 'gutter', 'N')
					NEXT
				else
					ll_row_found = this.find( "gutter ='Y'", this.rowcount(), row+1)
					if  ll_row_found > 0 then
						FOR ll_row = row+1 to ll_row_found
							this.setitem( ll_row, 'gutter', 'N')
						NEXT						
					end if
				end if			
			end if		
		else
			if ls_selected ='N' or isnull(ls_selected) then
				this.setitem( row, 'gutter', 'Y')
			else
				this.setitem( row, 'gutter', 'N')
			end if
		end if
		//--scroll đến dòng vừa tích gutter (09/12/2015)--//
		this.scrolltorow( row)
		if this.ib_editing = false then
			this.resetupdate( )
		end if				
		//-- Thông báo cho obj_handling --//
		return this.f_send_message_to_object( ldw_handling,row, dwo.name, "clicked")
	else//neu la cot gutter thi ko scroll dong
		this.scrolltorow(row)
	end if
else
	if lod_handle.ib_copying then return 
	if dwo.name = 'gutter_t' then //
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
		return this.f_send_message_to_object( ldw_handling,row, dwo.name, "clicked")
	end if
end if
IF ib_drag and right(dwo.name,2) <> '_t' and dwo.name <> 'datawindow' THEN
	ib_mouse_down = TRUE
	il_mouse_down_x = xpos
	il_mouse_down_y = ypos
ELSE
	ib_mouse_down = FALSE
END IF
return this.f_send_message_to_object( ldw_handling,row, dwo.name, "clicked")


end event

event rbuttondown;int							li_rtn,li_idx
string						ls_col_text,ls_data,ls_col_name,ls_col_type,ls_filter, ls_idkey_code[],ls_popup_name,ls_popmenu, ls_find_val
//boolean					
t_m_popup_object		lm_popup
t_dw_mpl				ldw_request
b_obj_instantiate		lbo_inst
s_w_main				lw_parent
s_object_display		lod_handle
b_popup_data			lb_popup_data
t_ds_db					lds_return
c_string					lc_string
c_dwservice				lc_dwser
s_str_policy_attr		lstr_rule_attr[], lstr_security_attr[]
u_dwcolumn_setup	lc_dwcolumn_setup

//-- thong báo object rightclick truoc khi thực hiện-- //
ldw_request = this
li_rtn = this.f_send_message_to_object(ldw_request, 'rbuttondown')
if li_rtn = -1 then 
	return -1
end if
this.scrolltorow( row)
//-drag--//
IF ib_drag THEN
	ib_mouse_rdown = TRUE
	il_mouse_down_x = PixelsToUnits(xpos, XPixelsToUnits!) 
	il_mouse_down_y = PixelsToUnits(ypos, YPixelsToUnits!) 
ELSE
	ib_mouse_rdown = FALSE
END IF

if li_rtn = 0 then
	ls_popmenu = is_popmenu
	this.f_getparentwindow( lw_parent)
	lod_handle = lw_parent.f_get_obj_handling()
	//-- Kiểm tra các menu popup có phân quyền --//
	li_rtn = lod_handle.f_get_dw_policy_attr( this, lstr_rule_attr[], lstr_security_attr[], ls_idkey_code[])
	if lod_handle.f_get_menu_id( ) = '0' then return -1
	for li_idx = 1 to li_rtn
		ls_popup_name = mid(ls_idKey_code[li_idx], lc_string.f_pos( ls_idKey_code[li_idx],'.', 2)+1) + ';'
		if pos(ls_popup_name,'m_') = 0 then continue 
		if not (lstr_security_attr[li_idx].b_query and lstr_rule_attr[li_idx].b_query) and not (lstr_security_attr[li_idx].b_access and lstr_rule_attr[li_idx].b_access) then
			ls_popmenu = lc_string.f_globalreplace(ls_popmenu , ls_popup_name , '')
		else
		end if
	next
	
	lm_popup = create	t_m_popup_object
	lm_popup.is_show_menu = ls_popmenu
	if dwo.name = 'datawindow' then
		lm_popup.is_show_menu = lc_string.f_globalreplace(lm_popup.is_show_menu , 'm_go_to_main_window;', '')
	end if
	lm_popup.is_object_name = this.classname()
	lm_popup.idwo_clicked = dwo
	LM_POPUP.IPO_CLICKED = THIS 
	
	//-- Thông báo cho object popup --//
	li_rtn = this.f_send_message_to_object(lm_popup, 'popup')
	if li_rtn = -1 then 
		destroy lm_popup
		return -1
	end if

	//-- show popup menu --//
	lm_popup.popmenu( PixelsToUnits(xpos, XPixelsToUnits!)+ lw_parent.WorkSpaceX ( ) ,  PixelsToUnits(ypos, YPixelsToUnits!)   + lw_parent.WorkSpaceY ( ))
	//-- xử lý khi user click chọn popmenu --//
	if 'm_edit_window_label' = lm_popup.is_clicked_menu  then
		if this.f_getparentwindow( lw_parent) = 1 then
			lw_parent.f_openchildwithparm('s_w_multi_popup','c_label_window;0;' + this.dataobject)
		end if
	elseif  'm_edit_obj_label' = lm_popup.is_clicked_menu  then
		if this.f_getparentwindow( lw_parent) = 1 then
			lw_parent.f_openchildwithparm('s_w_multi_n','c_label_object;0;' + this.dataobject )
		end if		
	elseif 'm_excel' = lm_popup.is_clicked_menu  then
		ldw_request.dynamic event e_saveas( "excelwithlayout")
	elseif 'm_find' = lm_popup.is_clicked_menu  then
		open(s_wr_input)
		ls_find_val = message.stringparm
		setnull(message.stringparm)
		if ls_find_val = ';exit;' or isnull(ls_find_val) or ls_find_val = '' then return
		ls_find_val= lbo_inst.f_get_filterstring( this, ls_find_val)
		li_rtn = this.find( ls_find_val, 1, this.rowcount())
		if li_rtn > 0 then
			return this.scrolltorow(li_rtn )
		else
			gf_messagebox('m.t_dw.r_buttondown.01','Thông báo','Không tìm thấy dữ liệu tương ứng!','exclamation','ok',1)
			return
		end if
	elseif 'm_del_user_profile'  = lm_popup.is_clicked_menu  then
		this.f_getparentwindow( lw_parent)
		lod_handle = lw_parent.f_get_obj_handling()
		close(lw_parent)
		return t_w_mdi.f_delete_user_profile( lod_handle.classname())		
	elseif 'm_setup_user_access'  = lm_popup.is_clicked_menu  then
		//--mở form phân quyền--//
		if this.f_getparentwindow( lw_parent) = 1 then
			lw_parent.f_openchildwithparm('s_w_multi_n_max_rb','u_rec_security;0;' + this.dataobject)
		end if
	elseif 'm_setup_deligate' = lm_popup.is_clicked_menu  then
		//--mở form ủy quyền--//
		if this.f_getparentwindow( lw_parent) = 1 then
			lw_parent.f_openchildwithparm('s_w_multi_n','u_appli_deligate;0;' + this.dataobject)
		end if
	elseif 'm_setup_alert' = lm_popup.is_clicked_menu  then		
	elseif 'm_setup_dw' = lm_popup.is_clicked_menu  then
		lc_dwcolumn_setup = create u_dwcolumn_setup
		if this.f_getparentwindow( lw_parent) = 1 then
			lod_handle = lw_parent.f_get_obj_handling()
			if lod_handle.classname( ) <> 'u_valueset_entry' then
				lw_parent.is_rightclicked_objname = lod_handle.classname() + ';'+this.dataobject
			else
				lw_parent.is_rightclicked_objname = lod_handle.f_get_menu_code( ) + ';'+this.dataobject
			end if
			lw_parent.f_openchildwithparm( 's_w_multi_n_max_rb', lc_dwcolumn_setup)
//			lw_parent.f_openchildwithparm('s_w_multi','c_dwcolumn_setup;0;' + lod_handle.classname() + ';'+this.dataobject)				
		end if
	elseif lm_popup.is_clicked_menu = 'm_filter_detail' then
		ls_col_name= string(dwo.name)			
		if right(ls_col_name,2) = '_t' then 
			ls_col_text = this.describe(ls_col_name+ ".text")
			ls_col_name = left(ls_col_name,len(ls_col_name) - 2)
		else
			ls_col_text = this.describe(ls_col_name+'_t' + ".text")
		end if
		if ls_col_name <> 'datawindow' then
			lb_popup_data = create b_popup_data
			lb_popup_data.f_init_popup_display( '1d', 'dp_data_filter_form',' ','Nhập giá trị lọc cho cột "'+ls_col_text+'"','Lọc theo cột ', 2500, 800)
			lb_popup_data.is_display_column = 'data_filter;'
			openwithparm(s_wr_multi, lb_popup_data)
			lds_return = message.powerobjectparm
			if isvalid(lds_return) then			
				setnull( message.powerobjectparm)
				ls_data = lds_return.getitemstring( 1, 'data_filter')
				if isnull(ls_data) then ls_data = ''
				lc_dwser.f_get_build_column( this, ls_col_name,ls_col_type)
				if not lod_handle.ib_copying then
	//				this.f_get_originalsql( /*ref string rs_originalsql_nowhere*/, /*ref string rs_originalwhereclause */)
					ls_filter = this.describe("datawindow.table.filter")
					if ls_filter = '?' then ls_filter = ''
					lc_string.f_globalreplace( ls_filter, '~~', '')
				end if
				if ls_filter <> '' then ls_filter = '('+ ls_filter + ')' + ' AND '
				ls_filter += lc_string.f_get_expression( ls_data,ls_col_type, ls_col_name,'filter')
				this.setfilter(ls_filter )
				this.filter( )
			end if
		end if
	end if
	//-- Thông báo cho object menu duoc click--//
	if lm_popup.is_clicked_menu <> '' then
		li_rtn = this.f_send_message_to_object(lm_popup, 'clicked')
	end if
	destroy lm_popup
end if
end event

event dberror;//-- return 3: bỏ qua không trigger dberror của transaction --//

s_w_main lw_parent

choose case sqldbcode
	case -3
		gf_messagebox('m.t_dw.dberror.01','Thông báo','Trong lúc soạn thảo, dữ liệu đã thay đổi bởi user khác. Bấm nút <OK> để nạp lại dữ liệu!',&
								'exclamation','ok',1)
		this.reselectrow( row)
		return 3
	case 1
		gf_messagebox('m.t_dw.dberror.02','Thông báo','Dữ liệu trùng khóa index!', 'stop','ok',1)
		this.reselectrow( row)
		return 3	 	
	case 2292
		gf_messagebox('m.t_dw.dberror.03','Thông báo','Đã có dữ liệu liên quan!', 'stop','ok',1)
		this.reselectrow( row)
		return 3
	case 3113
		this.f_getparentwindow( lw_parent)
		messagebox('Thông báo','Kết nối dữ liệu bị ngắt, Cần nạp lại dữ liệu ')
		lw_parent.F_RESEt_dwo_trans( )		
//		gf_messagebox('m.t_dw.dberror.04','Thông báo','Kết nối dữ liệu bị ngắt, Cần nạp lại dữ liệu ', 'exclamation','ok',1)
		lw_parent.post event e_refresh( )
		return 3		
	case else
		gf_messagebox('m.t_dw.dberror.04','Thông báo','Lỗi:@ '+sqlerrtext,'exclamation','ok',1)
end choose
end event

event scrollhorizontal;il_old_horzScrollPos = il_horzScrollPos
il_horzScrollPos = scrollpos
end event

event dragwithin;IF ib_drag THEN
	if row> 0 then
		this.selectrow(0, FALSE) 
		this.selectrow(row, TRUE) 
	else
		this.selectrow(0, FALSE) 
	end if
end if
end event

event dragleave;IF ib_drag THEN
		this.selectrow(0, FALSE) 
end if
end event

event dragdrop;window		lw_parent

//-- drag--//
IF ib_drag THEN
	this.selectrow(0, FALSE) 
	this.f_getparentwindow( lw_parent)
	lw_parent.dynamic event e_dw_dragdrop( source, row, dwo, this)
END IF

end event

