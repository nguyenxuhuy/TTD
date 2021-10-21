$PBExportHeader$c_map_n.sru
forward
global type c_map_n from s_object_display
end type
end forward

global type c_map_n from s_object_display
end type
global c_map_n c_map_n

type variables
string 			is_address_search     // địa chỉ cần tìm
string 			is_address_company // địa chỉ công ty
string				is_mapname 	//file bản đồ
string 			is_ApiKey 	//key kết nối google map
string				is_mapfile				// đường dẫn của file bản đồ
int		 			ii_mapfile				//số index khi open file bản đồ
boolean			ib_AD_search = false			//tìm địa chỉ
boolean			ib_RD_search	=false		//tìm đường
end variables

forward prototypes
public function integer f_create_body ()
public function integer f_add_directions ()
public function integer f_add_geocode ()
public function integer f_create_header ()
public function string f_constructor_map ()
public function string f_address_search (string vs_address)
public function string f_road_search (string vs_address_start, string vs_address_end)
public subroutine f_set_dwo_window ()
end prototypes

public function integer f_create_body ();string 		ls_header_info

ls_header_info ='<body>'
FileWriteEx(ii_mapfile, ls_header_info)
ls_header_info ='<div id="directions-panel"></div>'
FileWriteEx(ii_mapfile, ls_header_info)
ls_header_info ='<div id="map-canvas"/></div>'
FileWriteEx(ii_mapfile, ls_header_info)
ls_header_info ='<div id="warnings_panel" ></div>' //style="width:100%;height:10%;text-align:center"
FileWriteEx(ii_mapfile, ls_header_info)
ls_header_info ='</body>'
FileWriteEx(ii_mapfile, ls_header_info)

return 1
end function

public function integer f_add_directions ();string ls_header_info

ls_header_info ='var rendererOptions = {map: map,draggable: true}'
FileWriteEx(ii_mapfile, ls_header_info)
ls_header_info ='directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions)'
FileWriteEx(ii_mapfile, ls_header_info)
ls_header_info ='directionsDisplay.setPanel(document.getElementById("directions-panel"));'
FileWriteEx(ii_mapfile, ls_header_info)
ls_header_info ='var request = {origin: address_start,destination: address_end,travelMode: google.maps.TravelMode.DRIVING};'
FileWriteEx(ii_mapfile, ls_header_info)
ls_header_info ='directionsService.route(request, function(response, status) {'
FileWriteEx(ii_mapfile, ls_header_info)
ls_header_info ='if (status == google.maps.DirectionsStatus.OK) {'
FileWriteEx(ii_mapfile, ls_header_info)
ls_header_info ='var warnings = document.getElementById("warnings_panel");'
FileWriteEx(ii_mapfile, ls_header_info)
ls_header_info ='warnings.innerHTML = "<b>" + response.routes[0].warnings + "</b>";'
FileWriteEx(ii_mapfile, ls_header_info)
ls_header_info ='directionsDisplay.setDirections(response);}});'
FileWriteEx(ii_mapfile, ls_header_info)
ib_RD_search = false
return 1
end function

public function integer f_add_geocode ();string ls_header_info

ls_header_info ='if (address){geocoder.geocode( { "address": address}, function(results, status) {' //kiểm tra địa chỉ đã có dữ liệu không
FileWriteEx(ii_mapfile, ls_header_info)
ls_header_info ='if (status == google.maps.GeocoderStatus.OK) {' //nếu tìm thành công
FileWriteEx(ii_mapfile, ls_header_info)
ls_header_info ='map.setCenter(results[0].geometry.location);' //di chuyển về tọa độ tìm kiếm
FileWriteEx(ii_mapfile, ls_header_info)
ls_header_info ='marker = new google.maps.Marker({map: map,position: results[0].geometry.location,title: address});}' //tạo point đánh dấu điểm vừa tìm
FileWriteEx(ii_mapfile, ls_header_info)
ls_header_info ='else {alert("Không tìm thấy địa chỉ: '+is_address_search+'");}});}'
FileWriteEx(ii_mapfile, ls_header_info)
ib_AD_search = false

return 1
end function

public function integer f_create_header ();/**************************
Tạo web map theo cú pháp html
Version của GGmap 3.14 (3.exp)
**************************/

string ls_header_info

ls_header_info ='<head>'
FileWriteEx(ii_mapfile, ls_header_info)

//ls_header_info ='<meta http-equiv="content-type" content="text/html; charset=utf-8"/>' // khởi tạo html
ls_header_info ='<meta http-equiv="X-UA-Compatible" content="IE=EDGE; charset=utf-8"/>'
FileWriteEx(ii_mapfile, ls_header_info)
// khởi tạo khung bản đồ, mặc định full web
ls_header_info ='<style type="text/css">'
FileWriteEx(ii_mapfile, ls_header_info)
ls_header_info ='html { height: 100%; }'
FileWriteEx(ii_mapfile, ls_header_info)
ls_header_info ='body { height: 100%; margin: 0; padding: 0;}'
FileWriteEx(ii_mapfile, ls_header_info)
ls_header_info ='#map-canvas { height: 100%;width:75%; float:left;position:fixed !important;}</style>'
FileWriteEx(ii_mapfile, ls_header_info)
if ib_RD_search then
	ls_header_info ='<style>' 
	FileWriteEx(ii_mapfile, ls_header_info)
	ls_header_info ='#directions-panel { height: 100%; float: right; width:25%;} #map-canvass {margin-right: auto;}' 
	FileWriteEx(ii_mapfile, ls_header_info)
	ls_header_info ='</style>' 
	FileWriteEx(ii_mapfile, ls_header_info)
end if

ls_header_info ='<title>Map</title>' 
FileWriteEx(ii_mapfile, ls_header_info)
//khởi tạo kết nối với GoogleMap
ls_header_info ='<script src="https://maps.googleapis.com/maps/api/js?v=3.expkey='
//ls_header_info ='<script src="https://maps.googleapis.com/maps/api/js?v=1.3key='
ls_header_info+= is_apiKey + '&sensor=false&language=vi"></script>' //bằng true khi sử dụng kết hợp GPS
FileWriteEx(ii_mapfile, ls_header_info)

ls_header_info ='<script type="text/javascript">'
FileWriteEx(ii_mapfile, ls_header_info)
//load map và tìm kiếm
if isnull(is_address_search) or is_address_search ='' then
	ls_header_info ='var map;var marker;'
	ib_AD_search = false
	ib_RD_search = false
else
	if ib_AD_search then// tìm địa chỉ
		ls_header_info ='var geocoder;var map;var marker;var address = '+'"'+ is_address_search +'"'+';' // truyền địa chỉ cần tìm 
		FileWriteEx(ii_mapfile, ls_header_info)
		ls_header_info ='geocoder = new google.maps.Geocoder();' //Khởi tạo object tìm kiếm trên web
		FileWriteEx(ii_mapfile, ls_header_info)
	elseif ib_RD_search then// tìm đường
		ls_header_info ='var directionsDisplay;var directionsService;var stepDisplay;var markerArray = [];var map;var marker;var address_start = '+'"'+ is_address_company +'"'+'; var address_end = '+'"'+is_address_search+'"'+';' // truyền địa chỉ cần tìm
		FileWriteEx(ii_mapfile, ls_header_info)
		ls_header_info ='directionsService = new google.maps.DirectionsService();' //Khởi tạo object tìm đường trên web
		FileWriteEx(ii_mapfile, ls_header_info)
	end if
end if

ls_header_info ='function initialize() {'							// khởi tạo hàm load map
FileWriteEx(ii_mapfile, ls_header_info)
ls_header_info ='var DefaulLatLng = new google.maps.LatLng(10.79654,  	106.68829)' //tạo tọa độ mặc định: công ty phần mềm tre việt
FileWriteEx(ii_mapfile, ls_header_info)
ls_header_info ='var mapOptions = {center: DefaulLatLng,zoom: 16,mapTypeId: google.maps.MapTypeId.ROADMAP};' //tạo mức zoom và kiểu xem map
FileWriteEx(ii_mapfile, ls_header_info)
ls_header_info ='map = new google.maps.Map(document.getElementById("map-canvas"),mapOptions);'// khởi tạo map theo khung đã tạo
FileWriteEx(ii_mapfile, ls_header_info)
if ib_AD_search then
	f_add_geocode()
end if
if ib_RD_search then
	f_add_directions()
end if
//ls_header_info ='marker = new google.maps.Marker({position: DefaulLatLng,map: map,title: "Cty Phần mềm Tre Việt"});}}' //nếu không có địa chỉ tìm kiếm thì mở map tọa độ mặc định tại cty Tre Việt
ls_header_info ='}'
FileWriteEx(ii_mapfile, ls_header_info)
ls_header_info ='google.maps.event.addDomListener(window, "load", initialize);' //Load map
FileWriteEx(ii_mapfile, ls_header_info)

ls_header_info ='</script>'
FileWriteEx(ii_mapfile, ls_header_info)
ls_header_info ='</head>'
FileWriteEx(ii_mapfile, ls_header_info)

return 1
end function

public function string f_constructor_map ();string ls_default_directory,ls_mappage_content,ls_mapfile

ls_default_directory = GetCurrentDirectory ( )
if fileexists(is_mapname) then
	filedelete(is_mapname)
end if

ii_mapfile = FileOpen(ls_default_directory + '\' +is_mapname, LineMode!, Write!, LockReadWrite!, Replace!, EncodingUTF8!)
ls_mappage_content = '<!DOCTYPE html>'
FileWriteEx(ii_mapfile, ls_mappage_content)

ls_mappage_content ='<html>'
FileWriteEx(ii_mapfile, ls_mappage_content)

f_create_header()
f_create_body()

ls_mappage_content ="</html>"
FileWriteEx(ii_mapfile, ls_mappage_content)

FileClose(ii_mapfile)

ls_mapfile = ls_default_directory + '\' +is_mapname

return ls_mapfile
end function

public function string f_address_search (string vs_address);is_address_search = vs_address
ib_AD_search = true
is_mapfile = f_constructor_map()
return is_mapfile
end function

public function string f_road_search (string vs_address_start, string vs_address_end);ib_RD_search = true
is_address_company = vs_address_start
is_address_search = vs_address_end
is_mapfile = f_constructor_map()
return is_mapfile

end function

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_address_map_form'
istr_dwo[1].s_dwo_form = 'd_address_map_form'
istr_dwo[1].s_dwo_grid = ''
istr_dwo[1].b_master = false
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_details = ''
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_keyboardlocked = true
istr_dwo[1].s_description = 'Bản đồ'
end subroutine

on c_map_n.create
call super::create
end on

on c_map_n.destroy
call super::destroy
end on

event constructor;call super::constructor;is_mapname = 'TTDGGMAP.htm'
is_ApiKey = 'AIzaSyCKtU7HYzfBdkBQpGm9RxOJbgFnFdWl98I'

is_table = 'BUSINESS_ADDRESS'
ib_changed_dwo_4edit = false
is_object_title = 'Bản đồ'

istr_actionpane[1].s_description = is_object_title
end event

event e_window_e_preopen;call super::e_window_e_preopen;return 1
end event

event e_action_ctrl_retrieveend;datawindow				ldw_focus
int							li_idx
string						ls_case

ldw_focus = iw_display.dynamic f_get_idwfocus()


if isvalid(ldw_focus) then
	//-- control d_action_edit --//
	FOR li_idx = 1 to upperbound(istr_actionpane[]) 
		if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
			if ldw_focus.dynamic f_get_ib_shared() then
				ldw_focus = ldw_focus.dynamic f_getdwmaster()
			end if
			if ldw_focus.dynamic f_get_ib_detail() then
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_modify;b_saveclose;b_query;b_filteron;b_refresh;b_delete;'
					istr_actionpane[li_idx].s_enabled_buttons='b_modify;b_query;b_filteron;b_refresh;b_delete;'							
				else
					istr_actionpane[li_idx].s_visible_buttons='b_modify;b_save;'
					istr_actionpane[li_idx].s_enabled_buttons='b_modify;'							
				end if
			else
				if ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_saveclose;b_query;b_filteron;b_refresh;b_delete;'
					istr_actionpane[li_idx].s_enabled_buttons='b_add;b_modify;b_query;b_filteron;b_refresh;b_delete;'										
				else
					istr_actionpane[li_idx].s_visible_buttons='b_modify;b_save;'
					istr_actionpane[li_idx].s_enabled_buttons='b_modify;'														
				end if
			end if
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
		elseif  istr_actionpane[li_idx].s_dwo_action = 'd_transaction' then	
		end if		
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_action_ctrl_e_postmodifyrow;datawindow				ldw_focus
int								li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	//-- control d_action_edit --//
	FOR li_idx = 1 to upperbound(istr_actionpane[]) 
		if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
			if ldw_focus.dynamic f_get_ib_shared() then
				ldw_focus = ldw_focus.dynamic f_getdwmaster()
			end if			
			if ldw_focus.dynamic f_get_ib_detail() then
				if ib_changed_dwo_4edit then
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify; b_saveclose;b_refresh;b_delete;'
						istr_actionpane[li_idx].s_enabled_buttons = 'b_add;b_insert;b_saveclose;b_refresh;b_delete;'
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_modify; b_saveclose;b_refresh;b_delete;'
						istr_actionpane[li_idx].s_enabled_buttons = 'b_add;b_saveclose;b_refresh;b_delete;'						
					end if
				else
					if ldw_focus.dynamic f_isgrid() then
						istr_actionpane[li_idx].s_visible_buttons = 'b_add;b_insert;b_modify;b_save; b_refresh;b_delete;'
						istr_actionpane[li_idx].s_enabled_buttons = 'b_add;b_insert;b_save;b_refresh;b_delete;'	
					else
						istr_actionpane[li_idx].s_visible_buttons = 'b_modify;b_save;'
						istr_actionpane[li_idx].s_enabled_buttons = 'b_save;'							
					end if
				end if
			else				
				if  ib_changed_dwo_4edit then
					istr_actionpane[li_idx].s_visible_buttons='b_add;b_modify;b_saveclose;b_refresh;b_delete;'
					istr_actionpane[li_idx].s_enabled_buttons='b_saveclose;b_refresh;b_delete;'		
				else
					istr_actionpane[li_idx].s_visible_buttons='b_modify;b_save;'
					istr_actionpane[li_idx].s_enabled_buttons='b_save;'							
				end if
			end if
		elseif istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then
			
		end if				
	NEXT
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

event e_action_ctrl_bttn;datawindow				ldw_focus
int								li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	if not this.ib_copying then
		//-- control d_action_edit --//
		FOR li_idx = 1 to upperbound(istr_actionpane[]) 
			if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
				if ldw_focus.dynamic f_get_ib_shared() then
					ldw_focus = ldw_focus.dynamic f_getdwmaster()
				end if			
				if ldw_focus.dynamic f_get_ib_detail() then
					if ib_changed_dwo_4edit then
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_modify; b_saveclose;b_refresh;b_close;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_modify; b_saveclose;b_refresh;b_close;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_modify;b_save; b_refresh;b_close;'
						else
							istr_actionpane[li_idx].s_visible_buttons = 'b_modify;b_save; b_refresh;b_close;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons='b_modify;b_saveclose;b_refresh;b_close;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_modify;b_saveclose;b_refresh;b_close;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
				
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
				istr_actionpane[li_idx].s_visible_buttons =  ''
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
				
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0
end event

