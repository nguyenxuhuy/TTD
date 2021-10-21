$PBExportHeader$w_pdf.srw
forward
global type w_pdf from window
end type
type cb_4 from commandbutton within w_pdf
end type
type cb_3 from commandbutton within w_pdf
end type
type mle_1 from multilineedit within w_pdf
end type
type dw_1 from datawindow within w_pdf
end type
type sle_masterpassword from singlelineedit within w_pdf
end type
type sle_userpassword from singlelineedit within w_pdf
end type
type cbx_plainmetadata from checkbox within w_pdf
end type
type cbx_accessible from checkbox within w_pdf
end type
type cbx_copy from checkbox within w_pdf
end type
type cbx_forms from checkbox within w_pdf
end type
type cbx_annots from checkbox within w_pdf
end type
type cbx_assemble from checkbox within w_pdf
end type
type cbx_modify from checkbox within w_pdf
end type
type cbx_hiresprint from checkbox within w_pdf
end type
type cbx_print from checkbox within w_pdf
end type
type cb_2 from commandbutton within w_pdf
end type
type st_5 from statictext within w_pdf
end type
type st_4 from statictext within w_pdf
end type
type ddlb_userprintspec from dropdownlistbox within w_pdf
end type
type ddlb_pdfstandard from dropdownlistbox within w_pdf
end type
type ddlb_imageformat from dropdownlistbox within w_pdf
end type
type st_3 from statictext within w_pdf
end type
type st_2 from statictext within w_pdf
end type
type st_1 from statictext within w_pdf
end type
type cb_1 from commandbutton within w_pdf
end type
type gb_1 from groupbox within w_pdf
end type
end forward

global type w_pdf from window
integer width = 3017
integer height = 2532
boolean titlebar = true
string title = "PDF"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_4 cb_4
cb_3 cb_3
mle_1 mle_1
dw_1 dw_1
sle_masterpassword sle_masterpassword
sle_userpassword sle_userpassword
cbx_plainmetadata cbx_plainmetadata
cbx_accessible cbx_accessible
cbx_copy cbx_copy
cbx_forms cbx_forms
cbx_annots cbx_annots
cbx_assemble cbx_assemble
cbx_modify cbx_modify
cbx_hiresprint cbx_hiresprint
cbx_print cbx_print
cb_2 cb_2
st_5 st_5
st_4 st_4
ddlb_userprintspec ddlb_userprintspec
ddlb_pdfstandard ddlb_pdfstandard
ddlb_imageformat ddlb_imageformat
st_3 st_3
st_2 st_2
st_1 st_1
cb_1 cb_1
gb_1 gb_1
end type
global w_pdf w_pdf

type variables
integer	imageformatindex = 1
integer	pdfstandardindex = 1		
integer	useprintspecindex = 1

string		userpassword
string		masterpassword

string		restrictions
string		is_attach_file,is_file_name

datastore	ids_dw_1
end variables

forward prototypes
private subroutine of_addrestriction (string as_restriction)
public subroutine f_save_to_file (t_dw_mpl vdw_handling, string vs_file_name, long vl_s_row, long vl_e_row)
public subroutine f_save_to_file_and_send_mail (t_dw_mpl vdw_handling, string vs_file_name, string vs_masterpass, string vs_userpass, string vs_col_obj_name, string vs_to_mail, string vs_cc_mail, string vs_subject_mail, string vs_body_mail)
end prototypes

private subroutine of_addrestriction (string as_restriction);IF restrictions <> '' THEN restrictions += ','
restrictions += as_restriction + '!'

end subroutine

public subroutine f_save_to_file (t_dw_mpl vdw_handling, string vs_file_name, long vl_s_row, long vl_e_row);
ids_dw_1.dataobject = vdw_handling.dataobject
vdw_handling.RowsCopy (vl_s_row,vl_e_row , primary!, ids_dw_1, 1, primary!)
is_file_name  = vs_file_name
cb_1.event clicked( )
return
end subroutine

public subroutine f_save_to_file_and_send_mail (t_dw_mpl vdw_handling, string vs_file_name, string vs_masterpass, string vs_userpass, string vs_col_obj_name, string vs_to_mail, string vs_cc_mail, string vs_subject_mail, string vs_body_mail);string				ls_obj_name,las_infor[],ls_staff_code,ls_pdf_name
long				ll_idx
date				ld_f_date,ld_t_date
c_dwservice		lc_dwser
u_tabpg_smtp	lobj_send_mail
u_tab_main		lu_tab_m

b_obj_instantiate	lb_ins


ids_dw_1 = create datastore
lobj_send_mail = create u_tabpg_smtp
ddlb_imageformat.selectitem( 1 )
ddlb_pdfstandard.selectitem( 1 )
ddlb_userprintspec.selectitem( 1 )
lu_tab_m = create u_tab_main
lobj_send_mail = lu_tab_m.f_get_tab_smtp( )
for ll_idx = 1 to vdw_handling.rowcount()
	if lb_ins.f_get_employ_info( vdw_handling.getitemstring(ll_idx,'staff_code'),las_infor[]) = 0 then continue
	masterpassword = las_infor[6]
	userpassword = las_infor[7]
	ls_staff_code = vdw_handling.getitemstring( ll_idx, 'staff_code')
	ld_f_date = date(vdw_handling.getitemdatetime( ll_idx, 'from_date'))
	ld_t_date = date(vdw_handling.getitemdatetime( ll_idx, 'to_date'))
	ls_pdf_name = ls_staff_code + '_' + string(ld_f_date,'ddmmyyyy') + '_' + string(ld_t_date,'ddmmyyyy') + '.pdf'
	this.f_save_to_file( vdw_handling, ls_pdf_name, ll_idx, ll_idx)
	lc_dwser.f_send_mail( las_infor[2], las_infor[5], vs_cc_mail, vs_subject_mail, is_attach_file, vs_body_mail, false)
	FileDelete ( is_attach_file )
next
destroy ids_dw_1
return 
end subroutine

on w_pdf.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.mle_1=create mle_1
this.dw_1=create dw_1
this.sle_masterpassword=create sle_masterpassword
this.sle_userpassword=create sle_userpassword
this.cbx_plainmetadata=create cbx_plainmetadata
this.cbx_accessible=create cbx_accessible
this.cbx_copy=create cbx_copy
this.cbx_forms=create cbx_forms
this.cbx_annots=create cbx_annots
this.cbx_assemble=create cbx_assemble
this.cbx_modify=create cbx_modify
this.cbx_hiresprint=create cbx_hiresprint
this.cbx_print=create cbx_print
this.cb_2=create cb_2
this.st_5=create st_5
this.st_4=create st_4
this.ddlb_userprintspec=create ddlb_userprintspec
this.ddlb_pdfstandard=create ddlb_pdfstandard
this.ddlb_imageformat=create ddlb_imageformat
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_1=create cb_1
this.gb_1=create gb_1
this.Control[]={this.cb_4,&
this.cb_3,&
this.mle_1,&
this.dw_1,&
this.sle_masterpassword,&
this.sle_userpassword,&
this.cbx_plainmetadata,&
this.cbx_accessible,&
this.cbx_copy,&
this.cbx_forms,&
this.cbx_annots,&
this.cbx_assemble,&
this.cbx_modify,&
this.cbx_hiresprint,&
this.cbx_print,&
this.cb_2,&
this.st_5,&
this.st_4,&
this.ddlb_userprintspec,&
this.ddlb_pdfstandard,&
this.ddlb_imageformat,&
this.st_3,&
this.st_2,&
this.st_1,&
this.cb_1,&
this.gb_1}
end on

on w_pdf.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.mle_1)
destroy(this.dw_1)
destroy(this.sle_masterpassword)
destroy(this.sle_userpassword)
destroy(this.cbx_plainmetadata)
destroy(this.cbx_accessible)
destroy(this.cbx_copy)
destroy(this.cbx_forms)
destroy(this.cbx_annots)
destroy(this.cbx_assemble)
destroy(this.cbx_modify)
destroy(this.cbx_hiresprint)
destroy(this.cbx_print)
destroy(this.cb_2)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.ddlb_userprintspec)
destroy(this.ddlb_pdfstandard)
destroy(this.ddlb_imageformat)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;ddlb_imageformat.selectitem( 1 )
ddlb_pdfstandard.selectitem( 1 )
ddlb_userprintspec.selectitem( 1 )
end event

type cb_4 from commandbutton within w_pdf
integer x = 2469
integer y = 1524
integer width = 402
integer height = 112
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save to Blob"
end type

event clicked;integer		li_file
blob			lblb_data
string			ls_pdfsource
datastore	lds

SetPointer ( HourGlass! )
lds = CREATE datastore
lds.DataObject = 'd_elevate2018'
lds.savenativepdftoblob( lblb_data )
ls_pdfsource = String ( lblb_data, EncodingUTF8! )
mle_1.Text = ls_pdfsource

li_file = FileOpen ( "elevate2018_blob.pdf", StreamMode!, Write!, LockReadWrite!, Replace!, EncodingUTF8! )
FileWriteEx ( li_file, lblb_data )
FileClose ( li_file )

end event

type cb_3 from commandbutton within w_pdf
integer x = 2487
integer y = 2304
integer width = 402
integer height = 112
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Close"
end type

event clicked;Close ( parent )
end event

type mle_1 from multilineedit within w_pdf
integer x = 128
integer y = 1376
integer width = 2213
integer height = 1056
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_pdf
boolean visible = false
integer x = 2505
integer y = 480
integer width = 366
integer height = 336
integer taborder = 40
string title = "none"
string dataobject = "d_elevate2018"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type sle_masterpassword from singlelineedit within w_pdf
integer x = 1170
integer y = 704
integer width = 1170
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;masterpassword = this.text
end event

type sle_userpassword from singlelineedit within w_pdf
integer x = 1170
integer y = 544
integer width = 1170
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;userpassword = this.text
end event

type cbx_plainmetadata from checkbox within w_pdf
integer x = 1591
integer y = 1200
integer width = 466
integer height = 80
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Plain Metadata"
end type

type cbx_accessible from checkbox within w_pdf
integer x = 1591
integer y = 1104
integer width = 402
integer height = 80
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Accessible"
end type

type cbx_copy from checkbox within w_pdf
integer x = 1591
integer y = 1008
integer width = 402
integer height = 80
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Copy"
end type

type cbx_forms from checkbox within w_pdf
integer x = 1006
integer y = 1200
integer width = 402
integer height = 80
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Forms"
end type

type cbx_annots from checkbox within w_pdf
integer x = 1006
integer y = 1104
integer width = 402
integer height = 80
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Annotations"
end type

type cbx_assemble from checkbox within w_pdf
integer x = 1006
integer y = 1008
integer width = 402
integer height = 80
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Assemble"
end type

type cbx_modify from checkbox within w_pdf
integer x = 457
integer y = 1200
integer width = 402
integer height = 80
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Modify"
end type

type cbx_hiresprint from checkbox within w_pdf
integer x = 457
integer y = 1104
integer width = 402
integer height = 80
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Hi Res Print"
end type

type cbx_print from checkbox within w_pdf
integer x = 457
integer y = 1008
integer width = 402
integer height = 80
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Print"
end type

type cb_2 from commandbutton within w_pdf
integer x = 2469
integer y = 1392
integer width = 402
integer height = 112
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save to Blob"
end type

event clicked;integer	li_file
blob		lblb_data
string		ls_pdfsource

SetPointer ( HourGlass! )
dw_1.SaveNativePDFToBlob ( lblb_data )
ls_pdfsource = String ( lblb_data, EncodingUTF8! )
mle_1.Text = ls_pdfsource

li_file = FileOpen ( "elevate2018_blob.pdf", StreamMode!, Write!, LockReadWrite!, Replace!, EncodingUTF8! )
FileWriteEx ( li_file, lblb_data )
FileClose ( li_file )



end event

type st_5 from statictext within w_pdf
integer x = 110
integer y = 704
integer width = 1024
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Export.PDF.NativePDF.MasterPassword"
boolean focusrectangle = false
end type

type st_4 from statictext within w_pdf
integer x = 110
integer y = 544
integer width = 965
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Export.PDF.NativePDF.UserPassword"
boolean focusrectangle = false
end type

type ddlb_userprintspec from dropdownlistbox within w_pdf
integer x = 1170
integer y = 384
integer width = 1170
integer height = 384
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
string item[] = {"Yes","No"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;useprintspecindex = index
end event

type ddlb_pdfstandard from dropdownlistbox within w_pdf
integer x = 1170
integer y = 224
integer width = 1170
integer height = 576
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {"None","PDF/A-1a","PDF/A-1b","PDF/A-3a","PDF/A-3b","PDF/A-3u"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;pdfstandardindex = index

sle_masterpassword.enabled = (index = 1)
sle_userpassword.enabled = ( index = 1 )
cbx_plainmetadata.enabled = ( index = 1 )
cbx_accessible.enabled = ( index = 1 )
cbx_copy.enabled = ( index = 1 )
cbx_forms.enabled = ( index = 1 )
cbx_annots.enabled = ( index = 1 )
cbx_assemble.enabled = ( index = 1 )
cbx_modify.enabled = ( index = 1 )
cbx_hiresprint.enabled = ( index = 1 )
cbx_print.enabled = ( index = 1 )
end event

type ddlb_imageformat from dropdownlistbox within w_pdf
integer x = 1170
integer y = 64
integer width = 1170
integer height = 384
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean sorted = false
string item[] = {"JPG","BMP","PNG","GiF"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;imageformatindex = index
end event

type st_3 from statictext within w_pdf
integer x = 110
integer y = 384
integer width = 946
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Export.PDF.NativePDF.UsePrintSpec"
boolean focusrectangle = false
end type

type st_2 from statictext within w_pdf
integer x = 110
integer y = 224
integer width = 946
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Export.PDF.NativePDF.PDFStandard"
boolean focusrectangle = false
end type

type st_1 from statictext within w_pdf
integer x = 110
integer y = 64
integer width = 946
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Export.PDF.NativePDF.ImageFormat"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_pdf
integer x = 2487
integer y = 64
integer width = 402
integer height = 112
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save to File"
end type

event clicked;datastore		lds

lds = CREATE datastore
lds.DataObject = ids_dw_1.dataobject
// ids_dw_1.dataobject
if ids_dw_1.rowcount() > 0 then ids_dw_1.rowscopy( 1, 1, primary!, lds, 1, primary!)

lds.Object.DataWindow.Export.PDF.NativePDF.ImageFormat = imageformatindex - 1

lds.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = pdfstandardindex - 1

IF useprintspecindex = 1 THEN
	lds.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = 'Yes'
ELSE
	lds.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = 'No'
END IF 

//These options are only available for non PDF/A documents
IF ( pdfstandardindex - 1 ) = 0 THEN
	// Master password must also be set
	IF NOT IsNUll ( masterpassword ) THEN
		// User password is optional
		IF NOT IsNull ( userpassword ) THEN 
			
			lds.Object.DataWindow.Export.PDF.NativePDF.UserPassword = userpassword
		END IF
		lds.Object.DataWindow.Export.PDF.NativePDF.MasterPassword = masterpassword
		restrictions = ''
		IF cbx_print.checked THEN of_addrestriction ( 'noprint' )
		IF cbx_hiresprint.checked THEN of_addrestriction ( 'nohiresprint' )
		IF cbx_modify.checked THEN of_addrestriction ( 'nomodify' )
		IF cbx_assemble.checked THEN of_addrestriction ( 'noassemble' )
		IF cbx_annots.checked THEN of_addrestriction ( 'noannots' )
		IF cbx_forms.checked THEN of_addrestriction( 'noforms' )
		IF cbx_copy.checked THEN of_addrestriction ( 'nocopy' )
		IF cbx_accessible.checked THEN of_addrestriction ( 'noaccessible' ) 
		IF cbx_plainmetadata.checked THEN of_addrestriction ( 'plainmetadata' )
		IF restrictions <> '' THEN
			lds.Object.DataWindow.Export.PDF.NativePDF.Restrictions = restrictions
		END IF
	END IF
END IF

lds.SaveAs ( is_file_name, PDF!, TRUE )
is_attach_file = GetCurrentDirectory ( ) + '\'+is_file_name
//MessageBox ( "PDF Generation", "Done" )

end event

type gb_1 from groupbox within w_pdf
integer x = 110
integer y = 896
integer width = 2231
integer height = 448
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Export.PDF.NativePDF.Restrictions"
end type

