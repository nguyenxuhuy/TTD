$PBExportHeader$s_tp_multi.sru
forward
global type s_tp_multi from t_tp
end type
type tv_1 from t_tv within s_tp_multi
end type
type dw_6 from t_dw_mpl within s_tp_multi
end type
type dw_5 from t_dw_mpl within s_tp_multi
end type
type dw_4 from t_dw_mpl within s_tp_multi
end type
type dw_3 from t_dw_mpl within s_tp_multi
end type
type dw_2 from t_dw_mpl within s_tp_multi
end type
type dw_1 from t_dw_mpl within s_tp_multi
end type
type gb_1 from t_g_line within s_tp_multi
end type
type gb_6 from t_gb within s_tp_multi
end type
type gb_7 from t_gb within s_tp_multi
end type
type gb_2 from t_g_line within s_tp_multi
end type
type gb_3 from t_g_line within s_tp_multi
end type
type gb_4 from t_g_line within s_tp_multi
end type
type gb_5 from t_g_line within s_tp_multi
end type
type gb_8 from t_gb within s_tp_multi
end type
end forward

global type s_tp_multi from t_tp
integer width = 2437
integer height = 1884
long backcolor = 16776960
tv_1 tv_1
dw_6 dw_6
dw_5 dw_5
dw_4 dw_4
dw_3 dw_3
dw_2 dw_2
dw_1 dw_1
gb_1 gb_1
gb_6 gb_6
gb_7 gb_7
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
gb_5 gb_5
gb_8 gb_8
end type
global s_tp_multi s_tp_multi

type variables

dec 			ii_leftpart_width = 1200, ii_leftpart_width_bak
dec			ii_midpart_width, ii_midpart_width_bak
dec			ii_upperpart_height = 1000, ii_upperpart_height_bak
dec			ii_fixedpart1_height = 280, ii_fixedpart1_height_bak
dec			ii_fixedpart2_height = 280, ii_fixedpart2_height_bak
dec			ii_gb_3_height = 500, ii_gb_3_height_bak
dec			ii_gb_4_height, ii_gb_4_height_bak
dec			ii_gb_5_height, ii_gb_5_height_bak 
dec			ii_gb_10_width = 1750


s_str_dwo_tabpage			istr_dwo_tabpage
end variables

forward prototypes
public function integer f_arrange_dwdetail (datawindow vdw_detail[], ref s_str_dw_md rastr_dw_md[])
public function integer f_arrage_dwshared (datawindow vdw_shared[], ref s_str_dw_ms rastr_dw_ms[])
public function integer f_display_1dgb_2dfxgb ()
public function s_str_dwo_tabpage f_get_dwo_structure ()
public function integer f_display_1d ()
public function integer f_resize (string vs_display_model)
public function string f_get_display_model ()
public subroutine f_set_resize_parm ()
public function integer f_display_1dgb_1dgb ()
public function integer f_display_2d ()
public function integer f_display_2tp_2dw ()
public function integer f_display_3gb_3d ()
public function integer f_display_1dgb_1d ()
public function integer f_getparentwindow (ref s_w_main aw_parent)
public subroutine f_set_groupbox_text (groupbox vgb_handle, s_str_dwo rstr_dwo[])
public function integer f_display_1tv_1dgb ()
public function integer f_display_1dgb_1df_1df ()
public function integer f_display_1dgf_1dgf_1dg ()
public function integer f_display_1dgb_1dgf ()
public function integer f_display_1df_1df_1df ()
end prototypes

public function integer f_arrange_dwdetail (datawindow vdw_detail[], ref s_str_dw_md rastr_dw_md[]);int			li_idx1, li_idx2, li_masterCount, li_detailCount
string		ls_dwo_detail

li_masterCount = upperbound(rastr_dw_md[])
if li_masterCount = 1 then
	
	if upperbound(rastr_dw_md[1].dw_details[] ) = 0 then
		rastr_dw_md[1].dw_details[] = vdw_detail[]
	else
		li_detailCount = upperbound(vdw_detail[])
		FOR li_idx1 = 1 to li_detailCount
			rastr_dw_md[1].dw_details[li_detailCount + li_idx1] = vdw_detail[li_idx1]
		NEXT
	end if	
else
	FOR li_idx1 = 1 to li_masterCount
		FOR li_idx2 = 1 to upperbound(vdw_detail[])
			if pos(rastr_dw_md[li_idx1].s_dwo_detail, vdw_detail[li_idx2].dataobject+';') > 0 then
				rastr_dw_md[li_idx1].dw_details[upperbound(rastr_dw_md[li_idx1].dw_details[])+1] = vdw_detail[li_idx2]
			end if
		NEXT
	NEXT
end if
return li_masterCount
end function

public function integer f_arrage_dwshared (datawindow vdw_shared[], ref s_str_dw_ms rastr_dw_ms[]);int			li_idx1, li_idx2, li_masterCount, li_shareCount
string		ls_dwo_detail

li_masterCount = upperbound(rastr_dw_ms[])
if li_masterCount = 1 then
	if upperbound(rastr_dw_ms[1].dw_shared[] ) = 0 then
		rastr_dw_ms[1].dw_shared[] = vdw_shared[]
	else
		li_shareCount = upperbound(vdw_shared[])
		FOR li_idx1 = 1 to li_shareCount
			rastr_dw_ms[1].dw_shared[li_shareCount + li_idx1] = vdw_shared[li_idx1]
		NEXT
	end if
else
	FOR li_idx1 = 1 to li_masterCount
		FOR li_idx2 = 1 to upperbound(vdw_shared[])
			if pos(rastr_dw_ms[li_idx1].s_dwo_shared, vdw_shared[li_idx2].dataobject+';') > 0 then
				rastr_dw_ms[li_idx1].dw_shared[upperbound(rastr_dw_ms[li_idx1].dw_shared[])+1] = vdw_shared[li_idx2]
			end if
		NEXT
	NEXT
end if
return li_masterCount
end function

public function integer f_display_1dgb_2dfxgb ();//-- resize gb_6 --//
gb_6.move( 0 , 0 )
gb_6.width = ii_leftpart_width - 5
gb_6.height = this.height
gb_6.show( )

//-- resize dw_1 --//
dw_1.move( gb_6.x + 25 , gb_6.y + 75 )
dw_1.width = ii_leftpart_width - 50
dw_1.height = this.height - 90
dw_1.show( )

//-- resize gb_1 --//
gb_1.move(gb_6.x + ii_leftpart_width, 0)
gb_1.height = this.height
gb_1.width = 24
gb_1.show( )

//-- resize gb_7 --//
gb_7.move( gb_1.x + gb_1.width , 0 )
gb_7.width = this.width - gb_1.x - gb_1.width
gb_7.height = this.height
gb_7.show( )

//-- resize dw_2 --//
dw_2.move(gb_7.x + 25 , gb_7.y + 75 )
dw_2.width = this.width - gb_1.x - gb_1.width - 50
dw_2.height = max(this.height -  ii_fixedpart1_height - 90, 0)
dw_2.show( )

//-- resize dw_3 --//
dw_3.move( dw_2.x , dw_2.y + dw_2.height )
dw_3.width =  dw_2.width
dw_3.height =  min(ii_fixedpart1_height, this.height )
dw_3.show( )

return 1
end function

public function s_str_dwo_tabpage f_get_dwo_structure ();return  istr_dwo_tabpage
end function

public function integer f_display_1d ();

//-- resize dw_1 --//
dw_1.move( 0 , 0 )
dw_1.width = this.width
dw_1.height = this.height
dw_1.visible = true
return 1
end function

public function integer f_resize (string vs_display_model);
choose case vs_display_model
	case '1d'
		this.f_display_1d()
	case '2d'
		this.f_display_2d()
	case '1dgb_2dfxgb'
		this.f_display_1dgb_2dfxgb()
	case '1dgb_1dgb'
		this.f_display_1dgb_1dgb()
	case '2tp_2dw'
		this.f_display_2tp_2dw()
	case '3gb_3d'
		this.f_display_3gb_3d( )
	case '1dgb_1d'
		this.f_display_1dgb_1d( )
	case '1tv_1dgb'
		this.f_display_1tv_1dgb( )
	case '1dgb_1df_1df'
		this.f_display_1dgb_1df_1df( )		
	case '1df_1df_1df'
		this.f_display_1df_1df_1df( )				
	case '1dgb_1dgf'
		this.f_display_1dgb_1dgf()
end choose
this.setredraw( true)
return 1
end function

public function string f_get_display_model ();
return istr_dwo_tabpage.s_display_model
end function

public subroutine f_set_resize_parm ();window					lw_parent
s_object_display		lod_handle
int							li_row

if parent.dynamic f_getparentwindow(lw_parent) = 1 then
	lod_handle = lw_parent.dynamic f_get_obj_handling()
	
	li_row = lod_handle.ids_user_profile.find("user_id ="+string(gi_userid)+ " AND dwobject = 'tabpage_"+string(istr_dwo_tabpage.i_index)+	"' AND dwcontrol = 'ii_leftpart_width'", 1, lod_handle.ids_user_profile.rowcount())
	if li_row > 0 then
		ii_leftpart_width =  lod_handle.ids_user_profile.getitemnumber( li_row,'tabseq')
	else
		ii_leftpart_width = istr_dwo_tabpage.i_leftpart_width
	end if
	
	li_row = lod_handle.ids_user_profile.find("user_id ="+string(gi_userid)+ " AND dwobject = 'tabpage_"+string(istr_dwo_tabpage.i_index)+	"' AND dwcontrol = 'ii_midpart_width'", 1, lod_handle.ids_user_profile.rowcount())
	if li_row > 0 then
		ii_midpart_width =  lod_handle.ids_user_profile.getitemnumber( li_row,'tabseq')
	else
		ii_midpart_width = istr_dwo_tabpage.i_midpart_width
	end if	
	
	li_row = lod_handle.ids_user_profile.find( "user_id ="+string(gi_userid)+ " AND dwobject = 'tabpage_"+string(istr_dwo_tabpage.i_index)+	"' AND dwcontrol = 'ii_upperpart_height'", 1, lod_handle.ids_user_profile.rowcount())
	if li_row > 0 then
		ii_upperpart_height =  lod_handle.ids_user_profile.getitemnumber( li_row,'tabseq')
	else
		ii_upperpart_height = istr_dwo_tabpage.i_upperpart_height
	end if		

	li_row = lod_handle.ids_user_profile.find("user_id ="+string(gi_userid)+ " AND dwobject = 'tabpage_"+string(istr_dwo_tabpage.i_index)+	"' AND dwcontrol = 'ii_fixedpart1_height'", 1, lod_handle.ids_user_profile.rowcount())
	if li_row > 0 then
		ii_fixedpart1_height =  lod_handle.ids_user_profile.getitemnumber( li_row,'tabseq')
	else
		ii_fixedpart1_height = istr_dwo_tabpage.i_fixedpart1_height
	end if		
	
	li_row = lod_handle.ids_user_profile.find( "user_id ="+string(gi_userid)+ " AND dwobject = 'tabpage_"+string(istr_dwo_tabpage.i_index)+	"' AND dwcontrol = 'ii_fixedpart2_height'", 1, lod_handle.ids_user_profile.rowcount())
	if li_row > 0 then
		ii_fixedpart2_height =  lod_handle.ids_user_profile.getitemnumber( li_row,'tabseq')
	else
		ii_fixedpart2_height = istr_dwo_tabpage.i_fixedpart2_height
	end if			
	
	li_row = lod_handle.ids_user_profile.find( "user_id ="+string(gi_userid)+ " AND dwobject = 'tabpage_"+string(istr_dwo_tabpage.i_index)+	"' AND dwcontrol = 'ii_gb_3_height'", 1, lod_handle.ids_user_profile.rowcount())
	if li_row > 0 then
		ii_gb_3_height =  lod_handle.ids_user_profile.getitemnumber( li_row,'tabseq')
	else
		ii_gb_3_height = istr_dwo_tabpage.i_gb_3_height
	end if		
	
	li_row = lod_handle.ids_user_profile.find("user_id ="+string(gi_userid)+ " AND dwobject = 'tabpage_"+string(istr_dwo_tabpage.i_index)+	"' AND dwcontrol = 'ii_gb_4_height'", 1, lod_handle.ids_user_profile.rowcount())
	if li_row > 0 then
		ii_gb_4_height =  lod_handle.ids_user_profile.getitemnumber( li_row,'tabseq')
	else
		ii_gb_4_height = istr_dwo_tabpage.i_gb_4_height
	end if		
	
	li_row = lod_handle.ids_user_profile.find("user_id ="+string(gi_userid)+ " AND dwobject = 'tabpage_"+string(istr_dwo_tabpage.i_index)+	"' AND dwcontrol = 'ii_gb_5_height'", 1, lod_handle.ids_user_profile.rowcount())
	if li_row > 0 then
		ii_gb_5_height =  lod_handle.ids_user_profile.getitemnumber( li_row,'tabseq')
	else
		ii_gb_5_height = istr_dwo_tabpage.i_gb_5_height
	end if			
	
	li_row = lod_handle.ids_user_profile.find("user_id ="+string(gi_userid)+ " AND dwobject = 'tabpage_"+string(istr_dwo_tabpage.i_index)+"' AND dwcontrol = 'ii_gb_10_width'", 1, lod_handle.ids_user_profile.rowcount())
	if li_row > 0 then
		ii_gb_10_width =  lod_handle.ids_user_profile.getitemnumber( li_row,'tabseq')
	else
		ii_gb_10_width = istr_dwo_tabpage.i_gb_10_width
	end if				
	
else
	gf_messagebox('m.s_tp_multi.f_set_resize_parm.01','Thông báo','Không lấy được window cha:m.s_tp_multi.f_set_resize_parm:line 5','exclamation','ok',1)
end if
end subroutine

public function integer f_display_1dgb_1dgb ();//-- resize gb_6 --//
gb_6.move( 0 , 0 )
gb_6.width =  this.width*ii_leftpart_width  - 5
gb_6.height = this.height
gb_6.show( )

//-- resize dw_1 --//
dw_1.move( gb_6.x + 25 , gb_6.y + 75 )
dw_1.width = this.width*ii_leftpart_width - 20
dw_1.height = this.height - 90
dw_1.show( )

//-- resize gb_1 --//
gb_1.move(gb_6.x + gb_6.width, 0)
gb_1.height = this.height
gb_1.width = 24
gb_1.show( )

//-- resize gb_7 --//
gb_7.move( gb_1.x + gb_1.width , 0 )
gb_7.width = this.width - gb_1.x - gb_1.width
gb_7.height = this.height
gb_7.show( )

//-- resize dw_2 --//
dw_2.move(gb_7.x + 25 , gb_7.y + 75 )
dw_2.width = this.width - gb_1.x - gb_1.width - 50
dw_2.height = max(this.height - 90, 0)
dw_2.show( )

return 1
end function

public function integer f_display_2d ();
//-- resize dw_1 --//
dw_1.move( 0 , 0 )
dw_1.width = this.width
dw_1.height = ii_upperpart_height *this.height
dw_1.show()

//-- resize gb_2 --//
if gb_2.text = '^' then
	gb_2.height = 35
else
	gb_2.height = 50
end if
gb_2.move( 0, dw_1.height )
gb_2.width =  this.width
gb_2.show( )

//-- resize dw_2 --//
dw_2.move( 0 , gb_2.y + gb_2.height )
dw_2.width = this.width
dw_2.height = this.height - dw_1.height  - gb_2.height
dw_2.show()

return 1
end function

public function integer f_display_2tp_2dw ();//-- resize gb_6 --//
gb_6.move( 0 , 0 )
gb_6.width = ii_leftpart_width - 5
gb_6.height = this.height
gb_6.show( )

//-- resize dw_1 --//
dw_1.move( gb_6.x + 25 , gb_6.y + 75 )
dw_1.width = ii_leftpart_width - 20
dw_1.height = this.height - 90
dw_1.show( )

//-- resize gb_1 --//
gb_1.move(gb_6.x + gb_6.width, 0)
gb_1.height = this.height
gb_1.width = 24
gb_1.show( )

//-- resize gb_7 --//
gb_7.move( gb_1.x + gb_1.width , 0 )
gb_7.width = this.width - gb_1.x - gb_1.width
gb_7.height = this.height
gb_7.show( )

//-- resize dw_2 --//
dw_2.move(gb_7.x + 25 , gb_7.y + 75 )
dw_2.width = this.width - gb_1.x - gb_1.width - 50
dw_2.height = max(this.height - 90, 0)
dw_2.show( )

return 1
end function

public function integer f_display_3gb_3d ();
gb_6.move( 0, 0)
gb_6.width = (this.width * 3) / 4
gb_6.height = this.height - 45
gb_6.show( )

dw_1.move( gb_6.x + 20 , gb_6.y + 75 )
dw_1.width = gb_6.width - 40
dw_1.height = gb_6.height - 45
dw_1.show( )

gb_7.move( gb_6.x + gb_6.width + 10, gb_6.y )
gb_7.width = this.width - gb_6.width -70
gb_7.height = (gb_6.height / 2) - 10
gb_7.show( )

dw_2.move( gb_7.x + 20 , gb_7.y + 75 )
dw_2.width = gb_7.width - 40
dw_2.height = gb_7.height - 45
dw_2.show( )

gb_8.move( gb_7.x , gb_7.y + gb_7.height + 10 )
gb_8.width = gb_7.width
gb_8.height = gb_7.height
gb_8.show( )

dw_3.move( gb_8.x + 20 , gb_8.y + 75 )
dw_3.width = gb_8.width - 40
dw_3.height = gb_8.height - 45
dw_3.show( )
return 1
end function

public function integer f_display_1dgb_1d ();
//-- resize dw_1 --//
dw_1.move( 0 , 0 )
dw_1.width = ii_leftpart_width *this.width
dw_1.height = this.height
dw_1.show()

//-- resize gb_1 --//
//gb_1.move( dw_1.width - 5, 0)
//gb_1.width =  65
//gb_1.height = dw_1.height
//gb_1.show( )

//-- resize dw_2 --//
dw_2.move( dw_1.width, 0 )
dw_2.width = this.width - dw_1.width 
dw_2.height = dw_1.height
dw_2.show()

return 1
end function

public function integer f_getparentwindow (ref s_w_main aw_parent);powerobject	lpo_parent

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

public subroutine f_set_groupbox_text (groupbox vgb_handle, s_str_dwo rstr_dwo[]);
int			li_idx
string		ls_text
FOR li_idx = 1 to upperbound(rstr_dwo[])
	if vgb_handle.classname( ) = rstr_dwo[li_idx].s_gb_name then
		ls_text = t_w_mdi.ids_lang_text.f_get_lang_text(rstr_dwo[li_idx].s_dwo_default )
		if ls_text = '' then
			ls_text = '[' +  rstr_dwo[li_idx].s_description +']'	
		end if
		vgb_handle.text =ls_text
		return 
	end if
NEXT
end subroutine

public function integer f_display_1tv_1dgb ();
//-- resize tv_1 --//
tv_1.move(0, 0 )
tv_1.width = this.width*ii_leftpart_width - 20
tv_1.height = this.height 
tv_1.show( )

//-- resize gb_1 --//
gb_1.move(tv_1.width, 0)
gb_1.height = this.height
gb_1.width = 24
gb_1.show( )

//-- resize gb_7 --//
gb_7.move( gb_1.x + gb_1.width , 0 )
gb_7.width = this.width - gb_1.x - gb_1.width
gb_7.height = this.height
gb_7.show( )

//-- resize dw_2 --//
dw_1.move(gb_7.x + 25 , gb_7.y + 75 )
dw_1.width = this.width - gb_1.x - gb_1.width - 50
dw_1.height = max(this.height - 90, 0)
dw_1.show( )

return 1
end function

public function integer f_display_1dgb_1df_1df ();//-- resize gb_6 --//
gb_6.move( 0 , 0 )
gb_6.width = ii_leftpart_width* this.width
gb_6.height = this.height
gb_6.show( )

//-- resize dw_1 --//
dw_1.move( gb_6.x + 25 , gb_6.y + 75 )
dw_1.width = gb_6.width - 50
dw_1.height = this.height - 90
dw_1.show( )

//-- resize gb_1 --//
gb_1.move(gb_6.x + gb_6.width, 0)
gb_1.height = this.height
gb_1.width = 24
gb_1.show( )

//-- resize gb_7 --//
gb_7.move( gb_1.x + gb_1.width , 0 )
gb_7.width = this.width * ii_midpart_width
gb_7.height = this.height
gb_7.show( )

//-- resize dw_4: DW filter --//
dw_4.show( )
//dw_4.dataobject = 'd_filter_new_form'
if dw_4.rowcount( ) = 0 then dw_4.insertrow( 0)
dw_4.move(gb_7.x + 25 , gb_7.y + 75 )
dw_4.width = gb_7.width - 50
dw_4.height =  dw_4.f_getheight( )

//-- resize dw_2 --//
dw_2.move(gb_7.x + 25 , dw_4.y + dw_4.height )
dw_2.width = gb_7.width - 50
dw_2.height =  this.height - dw_4.height - 90
dw_2.show( )

//-- resize gb_1 --//
gb_5.move(gb_7.x + gb_7.width, 0)
gb_5.height = this.height
gb_5.width = 24
gb_5.show( )

//-- resize gb_8 --//
gb_8.move( gb_5.x + gb_5.width , 0 )
gb_8.width = this.width - gb_5.x + gb_5.width
gb_8.height = this.height
gb_8.show( )

//-- resize dw_5: DW filter --//
dw_5.show( )
//dw_5.dataobject = 'd_filter_new_form'
if dw_5.rowcount( ) = 0 then dw_5.insertrow( 0)
dw_5.move(gb_8.x + 25 , gb_8.y + 75 )
dw_5.width = gb_8.width - 50
dw_5.height = dw_5.f_getheight( )

//-- resize dw_3 --//
dw_3.move( gb_8.x +25, dw_5.y + dw_5.height )
dw_3.width =  gb_8.width - 50
dw_3.height =  this.height - dw_5.height  - 90
dw_3.show( )

return 1
end function

public function integer f_display_1dgf_1dgf_1dg ();//-- Chưa code hoàn chỉnh --/

//-- resize gb_6 --//
gb_6.move( 0 , 0 )
gb_6.width = ii_leftpart_width* this.width
gb_6.height = this.height
gb_6.show( )

//-- resize dw_4: DW filter --//
dw_4.show( )
//dw_4.dataobject = 'd_filter_new_form'
if dw_4.rowcount( ) = 0 then dw_4.insertrow( 0)
dw_4.move(gb_7.x + 25 , gb_7.y + 75 )
dw_4.width = gb_7.width - 50
dw_4.height =  dw_4.f_getheight( )
//-- resize dw_1 --//
dw_1.move( gb_6.x + 25 , gb_6.y + 75 )
dw_1.width = gb_6.width - 50
dw_1.height = this.height - 90
dw_1.show( )

//-- resize gb_1 --//
gb_1.move(gb_6.x + gb_6.width, 0)
gb_1.height = this.height
gb_1.width = 24
gb_1.show( )

//-- resize gb_7 --//
gb_7.move( gb_1.x + gb_1.width , 0 )
gb_7.width = this.width * ii_midpart_width
gb_7.height = this.height
gb_7.show( )

//-- resize dw_5: DW filter --//
dw_5.show( )
//dw_5.dataobject = 'd_filter_new_form'
if dw_5.rowcount( ) = 0 then dw_5.insertrow( 0)
dw_5.move(gb_8.x + 25 , gb_8.y + 75 )
dw_5.width = gb_8.width - 50
dw_5.height = dw_5.f_getheight( )

//-- resize dw_2 --//
dw_2.move(gb_7.x + 25 , dw_4.y + dw_4.height )
dw_2.width = gb_7.width - 50
dw_2.height =  this.height - dw_4.height - 90
dw_2.show( )

//-- resize gb_8 --//
gb_8.move( dw_2.x + dw_2.width + 24 , 0 )
gb_8.width = this.width - dw_2.x - dw_2.width - 24
gb_8.height = this.height
gb_8.show( )


//-- resize dw_3 --//
dw_3.move( gb_8.x +25, dw_5.y + dw_5.height )
dw_3.width =  gb_8.width - 50
dw_3.height =  this.height - dw_5.height  - 90
dw_3.show( )

return 1
end function

public function integer f_display_1dgb_1dgf ();//-- resize gb_6 --//
gb_6.move( 0 , 0 )
gb_6.width =  this.width*ii_leftpart_width  - 5
gb_6.height = this.height
gb_6.show( )

//-- resize dw_1 --//
dw_1.move( gb_6.x + 25 , gb_6.y + 75 )
dw_1.width = this.width*ii_leftpart_width - 20
dw_1.height = this.height - 90
dw_1.show( )

//-- resize gb_1 --//
gb_1.move(gb_6.x + gb_6.width, 0)
gb_1.height = this.height
gb_1.width = 24
gb_1.show( )

//-- resize gb_7 --//
gb_7.move( gb_1.x + gb_1.width , 0 )
gb_7.width = this.width - gb_1.x - gb_1.width
gb_7.height = this.height
gb_7.show( )

//-- resize dw_4: DW filter --//
dw_3.show( )
//dw_4.dataobject = 'd_filter_new_form'
if dw_3.rowcount( ) = 0 then dw_3.insertrow( 0)
dw_3.move(gb_7.x + 25 , gb_7.y + 75 )
dw_3.width = gb_7.width - 50
dw_3.height =  dw_3.f_getheight( )

//-- resize dw_2 --//
dw_2.move(gb_7.x + 25 , dw_3.y + dw_3.height )
dw_2.width = gb_7.width - 50
dw_2.height =  this.height - dw_3.height - 90
dw_2.show( )

return 1
end function

public function integer f_display_1df_1df_1df ();//-- resize gb_6 --//
gb_6.move( 0 , 0 )
gb_6.width = ii_leftpart_width* this.width
gb_6.height = this.height
gb_6.show( )

//-- resize dw_6: DW filter --//
dw_6.show( )
//dw_5.dataobject = 'd_filter_new_form'
if dw_6.rowcount( ) = 0 then dw_6.insertrow( 0)
dw_6.move(gb_6.x + 25 , gb_6.y + 75 )
dw_6.width = gb_6.width - 50
dw_6.height = dw_5.f_getheight( )

//-- resize dw_1 --//
dw_1.move( gb_6.x + 25 , dw_6.y + dw_4.height )
dw_1.width = gb_6.width - 50
dw_1.height = this.height - dw_6.height - 90
dw_1.show( )

//-- resize gb_1 --//
gb_1.move(gb_6.x + gb_6.width, 0)
gb_1.height = this.height
gb_1.width = 24
gb_1.show( )

//-- resize gb_7 --//
gb_7.move( gb_1.x + gb_1.width , 0 )
gb_7.width = this.width * ii_midpart_width
gb_7.height = this.height
gb_7.show( )

//-- resize dw_4: DW filter --//
dw_4.show( )
//dw_4.dataobject = 'd_filter_new_form'
if dw_4.rowcount( ) = 0 then dw_4.insertrow( 0)
dw_4.move(gb_7.x + 25 , gb_7.y + 75 )
dw_4.width = gb_7.width - 50
dw_4.height =  dw_4.f_getheight( )

//-- resize dw_2 --//
dw_2.move(gb_7.x + 25 , dw_4.y + dw_4.height )
dw_2.width = gb_7.width - 50
dw_2.height =  this.height - dw_4.height - 90
dw_2.show( )

//-- resize gb_1 --//
gb_5.move(gb_7.x + gb_7.width, 0)
gb_5.height = this.height
gb_5.width = 24
gb_5.show( )

//-- resize gb_8 --//
gb_8.move( gb_5.x + gb_5.width , 0 )
gb_8.width = this.width - gb_5.x + gb_5.width
gb_8.height = this.height
gb_8.show( )

//-- resize dw_5: DW filter --//
dw_5.show( )
//dw_5.dataobject = 'd_filter_new_form'
if dw_5.rowcount( ) = 0 then dw_5.insertrow( 0)
dw_5.move(gb_8.x + 25 , gb_8.y + 75 )
dw_5.width = gb_8.width - 50
dw_5.height = dw_5.f_getheight( )

//-- resize dw_3 --//
dw_3.move( gb_8.x +25, dw_5.y + dw_5.height )
dw_3.width =  gb_8.width - 50
dw_3.height =  this.height - dw_5.height  - 90
dw_3.show( )

return 1
end function

on s_tp_multi.create
int iCurrent
call super::create
this.tv_1=create tv_1
this.dw_6=create dw_6
this.dw_5=create dw_5
this.dw_4=create dw_4
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_6=create gb_6
this.gb_7=create gb_7
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_5=create gb_5
this.gb_8=create gb_8
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tv_1
this.Control[iCurrent+2]=this.dw_6
this.Control[iCurrent+3]=this.dw_5
this.Control[iCurrent+4]=this.dw_4
this.Control[iCurrent+5]=this.dw_3
this.Control[iCurrent+6]=this.dw_2
this.Control[iCurrent+7]=this.dw_1
this.Control[iCurrent+8]=this.gb_1
this.Control[iCurrent+9]=this.gb_6
this.Control[iCurrent+10]=this.gb_7
this.Control[iCurrent+11]=this.gb_2
this.Control[iCurrent+12]=this.gb_3
this.Control[iCurrent+13]=this.gb_4
this.Control[iCurrent+14]=this.gb_5
this.Control[iCurrent+15]=this.gb_8
end on

on s_tp_multi.destroy
call super::destroy
destroy(this.tv_1)
destroy(this.dw_6)
destroy(this.dw_5)
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_6)
destroy(this.gb_7)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_5)
destroy(this.gb_8)
end on

event e_resize;call super::e_resize;
if istr_dwo_tabpage.s_display_model=''  then return

dw_1.hide( )
dw_2.hide( )
dw_3.hide( )
dw_4.hide( )
dw_5.hide( )
dw_6.hide( )
tv_1.hide( )
gb_1.hide( )
gb_2.hide( )
gb_3.hide( )
gb_4.hide( )
gb_5.hide( )
gb_6.hide( )
gb_7.hide( )
gb_8.hide( )
this.setredraw( false)
this.post f_resize(istr_dwo_tabpage.s_display_model)
end event

event constructor;call super::constructor;string					ls_text, ls_label_code, ls_objname
s_w_main			lw_parent
s_object_display	lo_handle

istr_dwo_tabpage = message.powerobjectparm
setnull(message.powerobjectparm)

if isvalid(istr_dwo_tabpage) then 		
	if istr_dwo_tabpage.s_description='' then
		ls_label_code = istr_dwo_tabpage.str_dwo[1].s_dwo_default
		ls_label_code =  left(ls_label_code, len(ls_label_code) -5)
		this.f_getparentwindow( lw_parent)
		if isvalid(lw_parent) then
			lo_handle = lw_parent.f_get_obj_handling( )	
			ls_objname = upper(lo_handle.classname())
			ls_text = t_w_mdi.ids_lang_text.f_get_lang_text(ls_label_code , ls_objname)
		else
			ls_text = t_w_mdi.ids_lang_text.f_get_lang_text(ls_label_code )
		end if
		if ls_text = '' then
			ls_text = '['+  istr_dwo_tabpage.str_dwo[1].s_description + ']'
		end if
	else
		ls_text= '['+ istr_dwo_tabpage.s_description +']'
	end if
	this.text = ls_text

	//-- set resize parm --//
	this.f_set_resize_parm( )
	//-- gán dwo cho dw cùa window --//
	this.event e_set_dwo()	
end if
end event

event e_set_dwo;call super::e_set_dwo;c_obj_service				lc_obj_service
s_object_display			lpo_handling
t_dw_mpl						ladw_all[], ladw_details[], ladw_shared[], ldw_focus,ladw_none_md[]
s_str_dw_md 				lastr_dw_md[]
s_str_dw_ms 				lastr_dw_ms[]
s_str_dwo					lstr_dwo
window						lw_parent
t_transaction				lt_transaction
c_sql							lc_sql
string							las_master_keycol[],las_detail_keycol[], ls_suspend_sql, ls_rtn
long 							ll_cnt
int								li_idx1, li_idx2, li_count, li_dwo_cnt, li_rtn, li_idx3


li_count = upperbound(istr_dwo_tabpage.str_dwo[])
if parent.dynamic f_getparentwindow(lw_parent) = 1 then
	lw_parent.dynamic f_get_transaction(lt_transaction)
	lw_parent.dynamic f_get_dw_md_structure(lastr_dw_md[])
	lw_parent.dynamic f_get_dw_ms_structure(lastr_dw_ms[])
	lw_parent.dynamic f_get_iwdw_detail(ladw_details[])
	lw_parent.dynamic f_get_iwdw_share(ladw_shared[])
	lw_parent.dynamic f_get_iadw_none_md(ladw_none_md[])
	lpo_handling = lw_parent.dynamic f_get_obj_handling()
end if

//-- set dwo --//
FOR li_idx1 = 1 to upperbound(this.control[])
	//-- set dwo cho dw tren window --//
	if this.control[li_idx1].typeof() = datawindow! then
		FOR li_idx2 = 1 to li_count
			if this.control[li_idx1].classname() = "dw_"+string(li_idx2) then
				li_dwo_cnt++
				ladw_all[li_idx2] = this.control[li_idx1]
//				//-- kiem tra xem co du lieu trong datastore ko --//
				if isvalid(istr_dwo_tabpage.str_dwo[li_idx2].ds_suspend_data)then
					if istr_dwo_tabpage.str_dwo[li_idx2].ds_suspend_data.dataobject <>''  then
						ladw_all[li_idx2].dataobject = istr_dwo_tabpage.str_dwo[li_idx2].ds_suspend_data.dataobject		
						ladw_all[li_idx2].f_set_ib_editing(istr_dwo_tabpage.str_dwo[li_idx2].b_suspend_editing )
						ladw_all[li_idx2].f_set_rule_attr(istr_dwo_tabpage.str_dwo[li_idx2].str_suspend_rule_attr )
						ladw_all[li_idx2].f_set_security_attr(istr_dwo_tabpage.str_dwo[li_idx2].str_suspend_security_attr )						
						ladw_all[li_idx2].is_originalwhereClause = istr_dwo_tabpage.str_dwo[li_idx2].s_suspend_originalwhere
						ladw_all[li_idx2].is_originalSQL_NoWhere = istr_dwo_tabpage.str_dwo[li_idx2].s_suspend_sqlnowhere	
						ladw_all[li_idx2].inv_querymode = istr_dwo_tabpage.str_dwo[li_idx2].c_suspend_querymode
						ladw_all[li_idx2].inv_sort = istr_dwo_tabpage.str_dwo[li_idx2].c_suspend_sort
						ls_suspend_sql = istr_dwo_tabpage.str_dwo[li_idx2].s_suspend_sqlnowhere	
						if ls_suspend_sql <> '' then
							lc_sql.f_addtowhereclause(ls_suspend_sql, istr_dwo_tabpage.str_dwo[li_idx2].s_suspend_where, ' AND ')
							ls_rtn = ladw_all[li_idx2].modify("Datawindow.Table.Select =~'"+ls_suspend_sql+"~'")
						end if
						//-- restore data --//
						istr_dwo_tabpage.str_dwo[li_idx2].ds_suspend_data.rowscopy( 1,istr_dwo_tabpage.str_dwo[li_idx2].ds_suspend_data.rowcount( ) , primary!,ladw_all[li_idx2] , 1, primary!)
						istr_dwo_tabpage.str_dwo[li_idx2].ds_suspend_data.rowscopy( 1,istr_dwo_tabpage.str_dwo[li_idx2].ds_suspend_data.filteredcount( ) , filter!,ladw_all[li_idx2] , 1, filter!)
						ladw_all[li_idx2].resetupdate( )
//						ladw_all[li_idx2].setredraw( true)
						//-- xoa datastore --//
						istr_dwo_tabpage.str_dwo[li_idx2].ds_suspend_data.dataobject = ''
						istr_dwo_tabpage.str_dwo[li_idx2].s_suspend_sqlnowhere = ''
						istr_dwo_tabpage.str_dwo[li_idx2].s_suspend_where =''							 
						 			 
					else
						ladw_all[li_idx2].dataobject = istr_dwo_tabpage.str_dwo[li_idx2].s_dwo_default	
						ladw_all[li_idx2].title = istr_dwo_tabpage.str_dwo[li_idx2].s_description	
						//-- set full security --//
						g_user.i_rule.f_set_policy_dwctrl(lpo_handling , ladw_all[li_idx2])						
					end if
				else
					ladw_all[li_idx2].dataobject = istr_dwo_tabpage.str_dwo[li_idx2].s_dwo_default
					ladw_all[li_idx2].title = istr_dwo_tabpage.str_dwo[li_idx2].s_description	
					//-- set full security --//
					g_user.i_rule.f_set_policy_dwctrl(lpo_handling , ladw_all[li_idx2])					
				end if								

				//-- set trans object --//
				ladw_all[li_idx2].settransobject( lt_transaction)
				ladw_all[li_idx2].f_set_dwo_grid(istr_dwo_tabpage.str_dwo[li_idx2].s_dwo_grid)
				ladw_all[li_idx2].f_set_dwo_form(istr_dwo_tabpage.str_dwo[li_idx2].s_dwo_form)	
				//-- set navigation --//
				if istr_dwo_tabpage.str_dwo[li_idx2].s_dwo_form <> '' and istr_dwo_tabpage.str_dwo[li_idx2].s_dwo_grid <> '' then
					ladw_all[li_idx2].f_set_ib_grid_n_form(true)
					ladw_all[li_idx2].f_create_navigate_bttn()
				elseif   istr_dwo_tabpage.str_dwo[li_idx2].s_dwo_form= '' then
					ladw_all[li_idx2].f_set_ib_grid_n_form(false)
					ladw_all[li_idx2].f_create_navigate_bttn()					
				end if				
//				if istr_dwo_tabpage.str_dwo[li_idx2].s_dwo_form <> '' and istr_dwo_tabpage.str_dwo[li_idx2].s_dwo_grid <> '' then
//					ladw_all[li_idx2].f_create_navigate_bttn()
//				end if
				
				//-- set các biến instance --//
				ladw_all[li_idx2].f_set_ib_detail( istr_dwo_tabpage.str_dwo[li_idx2].b_detail )
				ladw_all[li_idx2].f_set_ib_master( istr_dwo_tabpage.str_dwo[li_idx2].b_master )
				ladw_all[li_idx2].f_set_ib_shared( istr_dwo_tabpage.str_dwo[li_idx2].b_shared )
				ladw_all[li_idx2].f_set_ib_cascade_del( istr_dwo_tabpage.str_dwo[li_idx2].b_cascade_del )
				ladw_all[li_idx2].f_set_ib_ref_table_yn( istr_dwo_tabpage.str_dwo[li_idx2].b_ref_table_yn )
				ladw_all[li_idx2].f_set_ref_table_field( istr_dwo_tabpage.str_dwo[li_idx2].s_ref_table_field )
				ladw_all[li_idx2].f_set_ib_insert( istr_dwo_tabpage.str_dwo[li_idx2].b_insert )
				ladw_all[li_idx2].f_set_ib_delete( istr_dwo_tabpage.str_dwo[li_idx2].b_delete )
				ladw_all[li_idx2].f_set_ib_update( istr_dwo_tabpage.str_dwo[li_idx2].b_update )
				ladw_all[li_idx2].f_set_ib_query( istr_dwo_tabpage.str_dwo[li_idx2].b_query )
				ladw_all[li_idx2].f_set_ib_print( istr_dwo_tabpage.str_dwo[li_idx2].b_print )
				ladw_all[li_idx2].f_set_ib_excel( istr_dwo_tabpage.str_dwo[li_idx2].b_excel )
				ladw_all[li_idx2].f_set_ib_traceable( istr_dwo_tabpage.str_dwo[li_idx2].b_traceable )
				ladw_all[li_idx2].ib_drag = istr_dwo_tabpage.str_dwo[li_idx2].b_drag
				ladw_all[li_idx2].ib_keynull = istr_dwo_tabpage.str_dwo[li_idx2].b_keynull
				ladw_all[li_idx2].f_set_ib_focus_master( istr_dwo_tabpage.str_dwo[li_idx2].b_focus_master )	
				ladw_all[li_idx2].f_set_ib_keyboardlocked( istr_dwo_tabpage.str_dwo[li_idx2].b_keyboardlocked )	
				ladw_all[li_idx2].f_set_ib_relation_1_1(istr_dwo_tabpage.str_dwo[li_idx2].b_relation_1_1 )
				ladw_all[li_idx2].is_popmenu += istr_dwo_tabpage.str_dwo[li_idx2].s_popmenu_items
				ladw_all[li_idx2].is_dwo_source = istr_dwo_tabpage.str_dwo[li_idx2].s_dwo_source
				ladw_all[li_idx2].is_col_source = istr_dwo_tabpage.str_dwo[li_idx2].s_col_source
				ladw_all[li_idx2].is_col_target = istr_dwo_tabpage.str_dwo[li_idx2].s_col_target
				
				//-- set dw propeties --//
				if ladw_all[li_idx2].describe("datawindow.processing") <> '4' then
					ladw_all[li_idx2].f_set_properties()	
				end if
				//-- set sort --//
				ladw_all[li_idx2].inv_sort.f_setrequestor(ladw_all[li_idx2])
				ladw_all[li_idx2].inv_sort.f_init( )	
				
				//-- ghi nhớ để set master-detail --//
				if  istr_dwo_tabpage.str_dwo[li_idx2].b_master and  istr_dwo_tabpage.str_dwo[li_idx2].s_dwo_details <> '' then
					lastr_dw_md[upperbound(lastr_dw_md[]) + 1].dw_master = ladw_all[li_idx2]
					lastr_dw_md[upperbound(lastr_dw_md[])].s_dwo_detail=   istr_dwo_tabpage.str_dwo[li_idx2].s_dwo_details
				end if
				
				//-- ghi nhớ để set master-shared --//
				if  istr_dwo_tabpage.str_dwo[li_idx2].b_master and  istr_dwo_tabpage.str_dwo[li_idx2].s_dwo_shared <> '' then
					lastr_dw_ms[upperbound(lastr_dw_ms[]) + 1].dw_master = ladw_all[li_idx2]
					lastr_dw_ms[upperbound(lastr_dw_ms[])].s_dwo_shared=   istr_dwo_tabpage.str_dwo[li_idx2].s_dwo_shared
				end if					
				//-- ghi nho dwdetail --//
				if istr_dwo_tabpage.str_dwo[li_idx2].b_detail then
					ladw_details[upperbound(ladw_details[])+1] =  ladw_all[li_idx2]
					lc_obj_service.f_stringtoarray( istr_dwo_tabpage.str_dwo[li_idx2].s_master_keycol , ';', las_master_keycol[])
					ladw_all[li_idx2].f_set_master_keycol(las_master_keycol[])
					lc_obj_service.f_stringtoarray( istr_dwo_tabpage.str_dwo[li_idx2].s_detail_keycol , ';', las_detail_keycol[])
					ladw_all[li_idx2].f_set_detail_keycol(las_detail_keycol[])
				end if				
				//-- ghi nho dwshared --//
				if istr_dwo_tabpage.str_dwo[li_idx2].b_shared then
					ladw_shared[upperbound(ladw_shared[])+1] =  ladw_all[li_idx2]
				end if						
				//-- ghi nhớ dw không master không detail--//
				if not istr_dwo_tabpage.str_dwo[li_idx2].b_master and not istr_dwo_tabpage.str_dwo[li_idx2].b_detail then
					ladw_none_md[upperbound(ladw_none_md[]) + 1] = ladw_all[li_idx2]
				end if
				//-- set dwfocus --//
				if li_idx2 =1 and istr_dwo_tabpage.b_fulltab then	
					if parent.dynamic f_getparentwindow(lw_parent) = 1 then
						ldw_focus = ladw_all[li_idx2]
						ldw_focus.object.datawindow.color = rgb(255,255,255)
						lw_parent.dynamic f_set_idwfocus(ldw_focus)
					end if
				end if
				exit
			end if
		NEXT
		if li_dwo_cnt = li_count then exit
//	elseif this.control[li_idx1].typeof()  = groupbox! then
//		FOR li_idx3 = 1 to li_count
//			lstr_dwo= istr_dwo_tabpage.str_dwo[li_idx3]
////			this.f_set_groupbox_text(this.control[li_idx1], lstr_dwo)
//		NEXT		
	end if
NEXT	

//-- arrage master_detail --//
lw_parent.dynamic f_set_iwdw_detail(ladw_details[])
lw_parent.dynamic f_set_dw_md_structure(lastr_dw_md[])

//-- arrage master shared --//
lw_parent.dynamic f_set_iwdw_share(ladw_shared[])
lw_parent.dynamic f_set_dw_ms_structure(lastr_dw_ms[])

//-- arrage none master detail --//
lw_parent.dynamic f_set_iadw_none_md(ladw_none_md[])

return 1
end event

event e_get_dwmain;call super::e_get_dwmain;return dw_1
end event

type tv_1 from t_tv within s_tp_multi
integer x = 1449
integer y = 1004
integer taborder = 60
boolean bringtotop = true
end type

type dw_6 from t_dw_mpl within s_tp_multi
integer x = 430
integer y = 1524
integer width = 832
integer height = 276
integer taborder = 60
end type

type dw_5 from t_dw_mpl within s_tp_multi
integer x = 174
integer y = 1220
integer width = 832
integer height = 276
integer taborder = 50
end type

type dw_4 from t_dw_mpl within s_tp_multi
integer x = 430
integer y = 932
integer width = 832
integer height = 276
integer taborder = 40
end type

type dw_3 from t_dw_mpl within s_tp_multi
integer x = 1257
integer y = 584
integer width = 832
integer height = 276
integer taborder = 30
end type

type dw_2 from t_dw_mpl within s_tp_multi
integer x = 1033
integer y = 132
integer height = 452
integer taborder = 20
end type

type dw_1 from t_dw_mpl within s_tp_multi
integer x = 27
integer y = 112
integer height = 760
integer taborder = 10
end type

type gb_1 from t_g_line within s_tp_multi
integer x = 2377
integer y = 160
integer width = 41
integer height = 568
string pointer = "SizeWE!"
borderstyle borderstyle = stylelowered!
end type

event e_mousemove;call super::e_mousemove;int				li_x

if flags = 1 then	
	li_x =  parent.pointerx( )
	if li_x >140 and li_x < parent.width - 200 - ii_midpart_width then 
		this.move( li_x, this.y )
		this.setposition( ToTop!)
		ii_leftpart_width =  this.x / parent.width
	end if
end if

end event

type gb_6 from t_gb within s_tp_multi
integer width = 978
integer height = 900
string text = ""
end type

event constructor;call super::constructor;
int			li_idx
string		ls_text
FOR li_idx = 1 to upperbound(istr_dwo_tabpage.str_dwo[])
	if this.classname( ) = istr_dwo_tabpage.str_dwo[li_idx].s_gb_name then
		ls_text = t_w_mdi.ids_lang_text.f_get_lang_text(  istr_dwo_tabpage.str_dwo[li_idx].s_dwo_default )
		if ls_text = '' then
			ls_text = '[' +  istr_dwo_tabpage.str_dwo[li_idx].s_description +']'	
		end if
		this.text =ls_text
		return 
	end if
NEXT
end event

type gb_7 from t_gb within s_tp_multi
integer x = 1344
integer y = 16
integer width = 978
integer height = 900
string text = ""
end type

event constructor;call super::constructor;
int			li_idx
string		ls_text
FOR li_idx = 1 to upperbound(istr_dwo_tabpage.str_dwo[])
	if this.classname( ) = istr_dwo_tabpage.str_dwo[li_idx].s_gb_name then
		ls_text = t_w_mdi.ids_lang_text.f_get_lang_text(  istr_dwo_tabpage.str_dwo[li_idx].s_dwo_default )
		if ls_text = '' then
			ls_text = '[' +  istr_dwo_tabpage.str_dwo[li_idx].s_description +']'	
		end if
		this.text =ls_text
		return 
	end if
NEXT
end event

type gb_2 from t_g_line within s_tp_multi
integer x = 1371
integer y = 980
integer width = 699
end type

event e_mousemove;call super::e_mousemove;

int				li_y

if this.text = '>' then return
if flags = 1 then	
	li_y =  parent.pointery( )
	if li_y > 300 and li_y < parent.height - 250 then 
		this.move( this.x, li_y )
		this.setposition( ToTop!)
		ii_upperpart_height = this.y / parent.height
	end if
end if

end event

event e_left_mousedown;call super::e_left_mousedown;
if xpos >25 and xpos <80 and ypos > 0 and ypos < 50 then
	if this.text = '^' then
		 ii_upperpart_height_bak = ii_upperpart_height
		 ii_upperpart_height = 0
		 ii_fixedpart2_height_bak = ii_fixedpart2_height
		 ii_fixedpart2_height = 0
		 this.text = '>'
	elseif this.text = '>' then		
		 ii_upperpart_height = ii_upperpart_height_bak
		 ii_fixedpart2_height = ii_fixedpart2_height_bak
		 this.text = '^'		
	end if

end if
end event

type gb_3 from t_g_line within s_tp_multi
integer x = 1371
integer y = 1052
integer width = 699
end type

event e_mousemove;call super::e_mousemove;

int				li_y

if this.text = '>' then return
if flags = 1 then	
	li_y =  parent.pointery( )
	if li_y > 300 + ii_upperpart_height and li_y < parent.height - 300 - ii_gb_4_height - ii_gb_5_height then 
		this.move( this.x, li_y )
		this.setposition( ToTop!)
		ii_gb_3_height = (li_y - ii_upperpart_height * parent.height) / parent.height
	end if
end if

end event

event e_left_mousedown;call super::e_left_mousedown;
if xpos >25 and xpos <80 and ypos > 0 and ypos < 50 then
	if this.text = '^' then
		 ii_gb_3_height_bak = ii_gb_3_height
		 ii_gb_3_height = 0
		 this.text = '>'
	elseif this.text = '>' then		
		 ii_gb_3_height = ii_gb_3_height_bak
		 this.text = '^'		
	end if
end if
end event

type gb_4 from t_g_line within s_tp_multi
integer x = 1371
integer y = 1124
integer width = 699
end type

event e_left_mousedown;call super::e_left_mousedown;
if xpos >25 and xpos <80 and ypos > 0 and ypos < 50 then
	if this.text = '^' then
		 ii_gb_4_height_bak = ii_gb_4_height
		 ii_gb_4_height = 0
		 this.text = '>'
	elseif this.text = '>' then		
		 ii_gb_4_height = ii_gb_4_height_bak
		 this.text = '^'		
	end if
end if
end event

type gb_5 from t_g_line within s_tp_multi
integer x = 2222
integer y = 1184
integer width = 41
integer height = 396
string pointer = "SizeWE!"
end type

event e_mousemove;call super::e_mousemove;int				li_x

if flags = 1 then	
	li_x =  parent.pointerx( )
	if li_x >140 and li_x < parent.width - 200 - ii_midpart_width then 
		this.move( li_x, this.y )
		this.setposition( ToTop!)
		ii_midpart_width =  (this.x - (gb_1.x + gb_1.width)) / parent.width
	end if
end if

end event

type gb_8 from t_gb within s_tp_multi
integer x = 1147
integer y = 84
integer width = 978
integer height = 900
integer taborder = 20
end type

event constructor;call super::constructor;
int			li_idx
string		ls_text
FOR li_idx = 1 to upperbound(istr_dwo_tabpage.str_dwo[])
	if this.classname( ) = istr_dwo_tabpage.str_dwo[li_idx].s_gb_name then
		ls_text = t_w_mdi.ids_lang_text.f_get_lang_text(  istr_dwo_tabpage.str_dwo[li_idx].s_dwo_default )
		if ls_text = '' then
			ls_text = '[' +  istr_dwo_tabpage.str_dwo[li_idx].s_description +']'	
		end if
		this.text =ls_text
		return 
	end if
NEXT
end event

