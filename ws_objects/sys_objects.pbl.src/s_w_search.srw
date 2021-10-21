$PBExportHeader$s_w_search.srw
forward
global type s_w_search from t_w_main
end type
type dw_1 from t_dw within s_w_search
end type
type dw_search from t_dw within s_w_search
end type
end forward

global type s_w_search from t_w_main
integer width = 2185
integer height = 2016
boolean titlebar = false
string title = ""
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowtype windowtype = popup!
windowstate windowstate = normal!
boolean clientedge = false
dw_1 dw_1
dw_search dw_search
end type
global s_w_search s_w_search

type variables
string	is_role_user
double	idb_object_id

end variables

forward prototypes
public function integer f_set_search_text ()
end prototypes

public function integer f_set_search_text ();

if gs_user_lang = 'vi-vn' then
	t_w_mdi.iw_search.dw_search.setitem(1,'search','Gõ vào điều cần tìm và bấm "Enter"...')
else
	t_w_mdi.iw_search.dw_search.setitem( 1, 'search', 'Key in what to search and <Enter>...')
end if			

return 1
end function

on s_w_search.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.dw_search=create dw_search
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.dw_search
end on

on s_w_search.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.dw_search)
end on

event key;//-- override --//
end event

event open;call super::open;c_string	lc_string

this.hide( )
this.dw_search.insertrow( 0)
if gs_user_lang = 'vi-vn' then
	this.dw_search.setitem( 1, 'search', 'Gõ vào điều cần tìm và bấm "Enter"...')
else
	this.dw_search.setitem( 1, 'search', 'Key in what to search and <Enter>...')
end if
this.width = this.dw_search.width
this.height = this.dw_search.height

if gi_userid = 0 then this.dw_1.dataobject = 'd_search_result_admin_grid'
this.dw_1.settransobject( sqlca)
is_role_user = g_user.f_get_current_role_user_string( )
is_role_user = lc_string.f_globalreplace( is_role_user, ';', ';)|(;')
is_role_user = "(;"+is_role_user+";)"

dw_1.f_getcurrentsql(dw_1.is_originalsql_nowhere , dw_1.is_originalwhereclause)


//-- Set ngôn ngữ --//
t_w_mdi.ids_lang_text.f_set_dw_lang(dw_1)
end event

type dw_1 from t_dw within s_w_search
integer y = 108
integer width = 2176
integer height = 1776
integer taborder = 20
string dataobject = "d_search_result_mv"
boolean hscrollbar = true
boolean vscrollbar = true
string icon = "AppIcon!"
boolean livescroll = true
borderstyle borderstyle = stylebox!
end type

event constructor;//-- override --//
end event

event e_mousemove;call super::e_mousemove;
//this.scrolltorow( row)


end event

event clicked;//-- override --//

string				ls_menu_code
double 			ldb_menu_id, ldb_ID
long				ll_row_found
u_menu				lu_menu
t_w_main			lw_sheet
s_object_display	lpo_main
t_dw_mpl			ldw_main

ls_menu_code = this.getitemstring( row, 'menu_code')
if ls_menu_code = '' or isnull(ls_menu_code) then
	gf_messagebox('m.s_w_search.clicked.01','Thông báo','Chưa cài đặt đối tượng tìm kiếm','exclamation','ok',1)
	parent.f_set_search_text( )
	return 
end if
idb_object_id =  this.getitemnumber( row, 'search_ID')

if Pos(t_w_mdi.is_menu_code,ls_menu_code+";",1) = 0 then
	setpointer(hourglass!)
	t_w_mdi.is_menu_code +=ls_menu_code +";"
	t_w_menu.is_menu_code = ls_menu_code	
	lu_menu = create u_menu
	ldb_menu_id = lu_menu.f_get_id(ls_menu_code )
	if ldb_menu_id < 1 then 		
		gf_messagebox('m.s_w_search.clicked.01','Thông báo','Chưa cài đặt đối tượng tìm kiếm','exclamation','ok',1)
		destroy lu_menu
		parent.f_set_search_text( )
		return
	end if
	opensheetwithparm(lw_sheet, ls_menu_code+";"+string(ldb_menu_id), 's_w_multi',t_w_mdi,3, original!)		
	parent.height = dw_search.height
else
	lw_sheet = t_w_mdi.getfirstsheet()
	Do while isvalid(lw_sheet)
		if lw_sheet.classname() <> 's_w_background' then
			lpo_main = lw_sheet.dynamic f_get_obj_main()
			if lpo_main.f_get_menu_code( ) = ls_menu_code then
				lw_sheet.setposition( totop!)
				parent.height = dw_search.height
				ldw_main = lw_sheet.dynamic f_get_dwmain()
				if isvalid(ldw_main) then
					ll_row_found = ldw_main.find( "ID ="+string(idb_object_id), 1, ldw_main.rowcount())
					idb_object_id = 0
					if ll_row_found > 0 then 
						ldw_main.scrolltorow( ll_row_found)
					end if
				end if
				parent.f_set_search_text( )
				return
			end if
		end if
		lw_sheet = t_w_mdi.getNextSheet(lw_sheet)
	Loop
end if
parent.f_set_search_text( )

end event

type dw_search from t_dw within s_w_search
integer width = 2176
integer height = 108
integer taborder = 10
string dataobject = "d_search"
borderstyle borderstyle = stylebox!
end type

event constructor;//--Override --/
end event

event getfocus;call super::getfocus;
if not t_w_mdi.ib_opening then this.setitem(1, 'search', '')

end event

event e_dwnkey;//-- override --//
string				ls_data, ls_where
long				ll_dw_height, ll_w_height

c_string			lc_string

if key= keyEnter! then
	ls_data = this.gettext( )
	if isnull(ls_data) then ls_data =''
	if pos(ls_data,'"') > 0 then
		ls_data = lc_string.f_globalreplace(ls_data , '"', '%')
	else
		ls_data = '%'+ trim(ls_data)+'%'
		ls_data = lc_string.f_globalreplace(ls_data , ' ', ' %')		
	end if

	ls_data = upper(ls_data)
	ls_where = " upper(SEARCH_TEXT) LIKE ~~'" + ls_data+ "~~' AND NVL(SOB,~~'"+gs_sob+"~~') = ~~'" + gs_sob +"~~' AND NVL(lang,~~'"+gs_user_lang+"~~') = ~~'"+gs_user_lang+ "~~' "

	dw_1.f_add_where_to_origin(ls_where, 'AND')	
	if gi_userid > 0 then
		dw_1.retrieve(gi_user_comp_id, is_role_user )	
		dw_1.f_getcurrentsql( ls_data, ls_where)
	else
		dw_1.retrieve( gi_user_comp_id, is_role_user )	
	end if

	ll_dw_height = dw_1.f_getheight( )
	ll_w_height = min(t_w_mdi.height - t_w_mdi.MDI_1.microhelpheight , ll_dw_height  + dw_1.y + dw_search.height  )
	dw_1.height = ll_w_height - dw_search.height
	dw_1.width = 2185+800
	parent.height = ll_w_height
	parent.width = 2185+800+50
	
//	Send(Handle(this),256,9,Long(0,0))
//	RETURN 1
End if
end event

event clicked;call super::clicked;
if not t_w_mdi.ib_opening then this.setitem(1, 'search', '')
end event

