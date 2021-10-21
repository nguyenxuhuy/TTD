$PBExportHeader$n_xls_formatx.sru
forward
global type n_xls_formatx from nonvisualobject
end type
end forward

global type n_xls_formatx from nonvisualobject
end type
global n_xls_formatx n_xls_formatx

type variables
public CONSTANT integer B1 = 1
public CONSTANT integer B2 = 2
public CONSTANT integer B4 = 4
public constant integer BC_1000 = 64
public constant integer BC_100 = 16
public constant integer BC_10 = 4
public constant integer BC_1111 = 85
public integer ii_xf_index = 0
public uint ii_font_index = 0
public integer ii_num_format = 0
public string is_num_format = ""
public string is_font = "Arial"
public integer ii_size = 10
public uint ii_bold = 400
public integer ii_italic = 0
public uint ii_color = 32767
public integer ii_underline = 0
public integer ii_font_strikeout = 0
public integer ii_font_outline = 0
public integer ii_font_shadow = 0
public integer ii_font_script = 0
public integer ii_font_family = 0
public integer ii_font_charset = 0
public integer ii_hidden = 0
public integer ii_locked = 1
public integer ii_text_h_align = 0
public integer ii_text_wrap = 0
public integer ii_text_v_align = 1
public integer ii_text_justlast = 0
public integer ii_rotation = 0
public integer ii_fg_color = 64
public integer ii_bg_color = 65
public integer ii_pattern = 0
public integer ii_bottom = 0
public integer ii_top = 0
public integer ii_left = 0
public integer ii_right = 0
public integer ii_bottom_color = 64
public integer ii_top_color = 64
public integer ii_left_color = 64
public integer ii_right_color = 64

end variables

forward prototypes
protected function uint of_get_color (string as_color)
public function string of_get_font_key ()
public function string of_get_format_key ()
public function uint of_get_xf_index ()
public function integer of_set_align (string as_align)
public function integer of_set_bg_color (long al_colorindex)
public function integer of_set_bg_color (string as_color)
public function integer of_set_bold (boolean ab_bold)
public function integer of_set_border (integer ai_border_style)
public function integer of_set_border_color (long al_color_index)
public function integer of_set_border_color (string as_color)
public function integer of_set_bottom (integer ai_border_style)
public function integer of_set_bottom_color (long al_color_index)
public function integer of_set_bottom_color (string as_color)
public function integer of_set_color (long al_colorindex)
public function integer of_set_color (string as_color)
public function integer of_set_fg_color (long al_colorindex)
public function integer of_set_fg_color (string as_color)
public function integer of_set_font (string as_fontname)
public function integer of_set_hidden (boolean ab_option)
public function integer of_set_italic (boolean ab_italic)
public function integer of_set_left (integer ai_border_style)
public function integer of_set_left_color (long al_color_index)
public function integer of_set_left_color (string as_color)
public function integer of_set_locked (boolean ab_option)
public function integer of_set_merge ()
public function integer of_set_num_format (integer ai_builtin_format)
public function integer of_set_num_format (string as_num_format)
public function integer of_set_outline (boolean ab_option)
public function integer of_set_pattern (integer ai_pattern)
public function integer of_set_right (integer ai_border_style)
public function integer of_set_right_color (long al_color_index)
public function integer of_set_right_color (string as_color)
public function integer of_set_rotation (integer ai_rotation)
public function integer of_set_script (integer ai_script)
public function integer of_set_size (integer ai_size)
public function integer of_set_strikeout (boolean ab_option)
protected function integer of_set_text_h_align (uint ai_align)
public function integer of_set_text_justlast ()
protected function integer of_set_text_v_align (uint ai_align)
public function integer of_set_text_wrap (boolean ab_text_wrap)
public function integer of_set_top (integer ai_border_style)
public function integer of_set_top_color (long al_color_index)
public function integer of_set_top_color (string as_color)
public function integer of_set_underline (integer ai_style)
public function blob of_get_font (ref n_xls_subroutines anvo_sub)
public function blob of_get_xf (string as_style, ref n_xls_subroutines anvo_sub)
public function integer of_set_borders (integer ai_borders)
public function string of_get_format_short_key ()
public function integer of_copy (n_xls_formatx anvo_format)
end prototypes

protected function uint of_get_color (string as_color);choose case trim(lower(as_color))
	case "aqua"
		return 15
	case "cyan"
		return 15
	case "black"
		return 8
	case "blue"
		return 12
	case "brown"
		return 16
	case "magenta"
		return 14
	case "fuchsia"
		return 14
	case "gray"
		return 23
	case "grey"
		return 23
	case "green"
		return 17
	case "lime"
		return 11
	case "navy"
		return 18
	case "orange"
		return 53
	case "purple"
		return 20
	case "red"
		return 10
	case "silver"
		return 22
	case "white"
		return 9
	case "yellow"
		return 13
end choose

return 32767
end function

public function string of_get_font_key ();string ls_ret
uint li_pos

ls_ret = string(len(is_font),"00") + is_font + (string(ii_size,"00")) + (string(ii_font_script,"00")) + (string(ii_underline,"00")) + (string(ii_font_strikeout,"00")) + (string(ii_bold,"000")) + (string(ii_font_outline,"00")) + (string(ii_font_family,"0000")) + (string(ii_font_charset,"000000")) + (string(ii_font_shadow,"00")) + (string(ii_color,"000")) + string(ii_italic,"0")
li_pos = pos(ls_ret," ")

do while li_pos > 0
	ls_ret = replace(ls_ret,li_pos,1,"_")
	li_pos = pos(ls_ret," ")
loop

return ls_ret
end function

public function string of_get_format_key ();string ls_ret
uint li_pos


ls_ret = is_font + string(ii_size,"00") + string(ii_num_format,"000") + string(ii_bottom) + string(ii_top) + string(ii_left) + string(ii_right) +  + is_num_format + of_get_font_key() + string(ii_bottom_color,"000") + string(ii_top_color,"000") + string(ii_left_color,"000") + string(ii_right_color,"000") + string(ii_hidden,"0") + string(ii_locked,"0") + string(ii_text_h_align,"00") + string(ii_text_wrap,"0") + string(ii_text_v_align,"00") + string(ii_text_justlast,"00") + string(ii_rotation,"000") + string(ii_fg_color,"000") + string(ii_bg_color,"000") + string(ii_pattern,"000")

li_pos = pos(ls_ret," ")

do while li_pos > 0
	ls_ret = replace(ls_ret,li_pos,1,"_")
	li_pos = pos(ls_ret," ")
loop

return ls_ret
end function

public function uint of_get_xf_index ();return ii_xf_index
end function

public function integer of_set_align (string as_align);integer li_ret = 1

choose case trim(lower(as_align))
	case "left"
		of_set_text_h_align(1)
	case "centre", "center"
		of_set_text_h_align(2)
	case "right"
		of_set_text_h_align(3)
	case "fill"
		of_set_text_h_align(4)
	case "justify"
		of_set_text_h_align(5)
	case "merge"
		of_set_text_h_align(6)
	case "equal_space"
		of_set_text_h_align(7)
	case "top"
		of_set_text_v_align(0)
	case "vcentre", "vcenter"
		of_set_text_v_align(1)
	case "bottom"
		of_set_text_v_align(2)
	case "vjustify"
		of_set_text_v_align(3)
	case "vequal_space"
		of_set_text_v_align(4)
	case else
		return -1
end choose

return li_ret
end function

public function integer of_set_bg_color (long al_colorindex);integer li_ret = 1

if al_colorindex < 8 then
	al_colorindex += 8
end if

if al_colorindex > 63 then
	al_colorindex = 32767
end if

ii_bg_color = al_colorindex
return li_ret
end function

public function integer of_set_bg_color (string as_color);integer li_ret = 1

of_set_bg_color(of_get_color(as_color))
return li_ret
end function

public function integer of_set_bold (boolean ab_bold);integer li_ret = 1

if ab_bold then
	ii_bold = 700
else
	ii_bold = 400
end if

return li_ret
end function

public function integer of_set_border (integer ai_border_style);of_set_left(ai_border_style)
of_set_right(ai_border_style)
of_set_top(ai_border_style)
of_set_bottom(ai_border_style)
return 1
end function

public function integer of_set_border_color (long al_color_index);of_set_left_color(al_color_index)
of_set_right_color(al_color_index)
of_set_top_color(al_color_index)
of_set_bottom_color(al_color_index)
return 1
end function

public function integer of_set_border_color (string as_color);of_set_left_color(as_color)
of_set_right_color(as_color)
of_set_top_color(as_color)
of_set_bottom_color(as_color)
return 1
end function

public function integer of_set_bottom (integer ai_border_style);ii_bottom = ai_border_style
return 1
end function

public function integer of_set_bottom_color (long al_color_index);integer li_ret = 1

if al_color_index < 8 then
	al_color_index += 8
end if

if al_color_index > 63 then
	al_color_index = 32767
end if

ii_bottom_color = al_color_index
return li_ret
end function

public function integer of_set_bottom_color (string as_color);integer li_ret = 1

of_set_bottom_color(of_get_color(as_color))
return li_ret
end function

public function integer of_set_color (long al_colorindex);integer li_ret = 1

if al_colorindex < 8 then
	al_colorindex += 8
end if

if al_colorindex > 63 then
	al_colorindex = 32767
end if

ii_color = al_colorindex
return li_ret
end function

public function integer of_set_color (string as_color);integer li_ret = 1

of_set_color(of_get_color(as_color))
return li_ret
end function

public function integer of_set_fg_color (long al_colorindex);integer li_ret = 1

if al_colorindex < 8 then
	al_colorindex += 8
end if

if al_colorindex > 63 then
	al_colorindex = 32767
end if

ii_fg_color = al_colorindex
return li_ret
end function

public function integer of_set_fg_color (string as_color);return of_set_fg_color(of_get_color(as_color))
end function

public function integer of_set_font (string as_fontname);integer li_ret = 1

is_font = as_fontname
return li_ret
end function

public function integer of_set_hidden (boolean ab_option);if ab_option then
	ii_hidden = 1
else
	ii_hidden = 0
end if

return 1
end function

public function integer of_set_italic (boolean ab_italic);integer li_ret = 1

if ab_italic then
	ii_italic = 1
else
	ii_italic = 0
end if

return li_ret
end function

public function integer of_set_left (integer ai_border_style);ii_left = ai_border_style
return 1
end function

public function integer of_set_left_color (long al_color_index);integer li_ret = 1

if al_color_index < 8 then
	al_color_index += 8
end if

if al_color_index > 63 then
	al_color_index = 32767
end if

ii_left_color = al_color_index
return li_ret
end function

public function integer of_set_left_color (string as_color);integer li_ret = 1

of_set_left_color(of_get_color(as_color))
return li_ret
end function

public function integer of_set_locked (boolean ab_option);if ab_option then
	ii_locked = 1
else
	ii_locked = 0
end if

return 1
end function

public function integer of_set_merge ();return of_set_text_h_align(6)
end function

public function integer of_set_num_format (integer ai_builtin_format);ii_num_format = ai_builtin_format
return 1
end function

public function integer of_set_num_format (string as_num_format);integer li_ret = 1

is_num_format = as_num_format
ii_num_format = 0
return li_ret
end function

public function integer of_set_outline (boolean ab_option);if ab_option then
	ii_font_outline = 1
else
	ii_font_outline = 0
end if

return 1
end function

public function integer of_set_pattern (integer ai_pattern);integer li_ret = 1

if ai_pattern < 0 or ai_pattern > 18 then
	li_ret = -1
else
	ii_pattern = ai_pattern
end if

return li_ret
end function

public function integer of_set_right (integer ai_border_style);ii_right = ai_border_style
return 1
end function

public function integer of_set_right_color (long al_color_index);integer li_ret = 1

if al_color_index < 8 then
	al_color_index += 8
end if

if al_color_index > 63 then
	al_color_index = 32767
end if

ii_right_color = al_color_index
return li_ret
end function

public function integer of_set_right_color (string as_color);integer li_ret = 1

of_set_right_color(of_get_color(as_color))
return li_ret
end function

public function integer of_set_rotation (integer ai_rotation);integer li_ret = 1

if (ai_rotation >= 0 and ai_rotation <= 180) or ai_rotation = 255 then
	ii_rotation = ai_rotation
else
	li_ret = -1
end if

return li_ret
end function

public function integer of_set_script (integer ai_script);integer li_ret = 1

if ai_script < 0 or ai_script > 2 then
	li_ret = -1
else
	ii_font_script = ai_script
end if

return li_ret
end function

public function integer of_set_size (integer ai_size);integer li_ret = 1

ii_size = ai_size
return li_ret
end function

public function integer of_set_strikeout (boolean ab_option);if ab_option then
	ii_font_strikeout = 1
else
	ii_font_strikeout = 0
end if

return 1
end function

protected function integer of_set_text_h_align (uint ai_align);ii_text_h_align = ai_align
return 1
end function

public function integer of_set_text_justlast ();ii_text_justlast = 1
return 1
end function

protected function integer of_set_text_v_align (uint ai_align);ii_text_v_align = ai_align
return 1
end function

public function integer of_set_text_wrap (boolean ab_text_wrap);integer li_ret = 1

if ab_text_wrap then
	ii_text_wrap = 1
else
	ii_text_wrap = 0
end if

return li_ret
end function

public function integer of_set_top (integer ai_border_style);ii_top = ai_border_style
return 1
end function

public function integer of_set_top_color (long al_color_index);integer li_ret = 1

if al_color_index < 8 then
	al_color_index += 8
end if

if al_color_index > 63 then
	al_color_index = 32767
end if

ii_top_color = al_color_index
return li_ret
end function

public function integer of_set_top_color (string as_color);integer li_ret = 1

of_set_top_color(of_get_color(as_color))
return li_ret
end function

public function integer of_set_underline (integer ai_style);ii_underline = ai_style
return 1
end function

public function blob of_get_font (ref n_xls_subroutines anvo_sub);uint li_record
uint li_length
uint li_dyheight
uint li_grbit
uint li_icv
uint li_bls
uint li_sss
uint li_uls
uint li_bfamily
uint li_bcharset
uint li_reserved
uint li_cch
blob lb_data, lb_fontname

lb_fontname = anvo_sub.of_ansi2unicode(is_font)
li_dyheight = ii_size * 20
li_icv = ii_color
li_bls = ii_bold
li_sss = ii_font_script
li_uls = ii_underline
li_bfamily = ii_font_family
li_bcharset = ii_font_charset
li_cch = len(lb_fontname) / 2
li_record = 49
li_length = 16 + li_cch * 2
li_reserved = 0
li_grbit = 0
li_grbit = li_grbit + ii_italic * 2
li_grbit = li_grbit + ii_font_strikeout * 8
li_grbit = li_grbit + ii_font_outline * 16
li_grbit = li_grbit + ii_font_shadow * 32
lb_data = anvo_sub.of_pack(B2,li_record) + anvo_sub.of_pack(B2,li_length) + anvo_sub.of_pack(B2,li_dyheight) + anvo_sub.of_pack(B2,li_grbit) + anvo_sub.of_pack(B2,li_icv) + anvo_sub.of_pack(B2,li_bls) + anvo_sub.of_pack(B2,li_sss) + anvo_sub.of_pack(B1,li_uls) + anvo_sub.of_pack(B1,li_bfamily) + anvo_sub.of_pack(B1,li_bcharset) + anvo_sub.of_pack(B1,li_reserved) + anvo_sub.of_pack(B1,li_cch) + anvo_sub.of_pack(B1,1) + lb_fontname
return lb_data
end function

public function blob of_get_xf (string as_style, ref n_xls_subroutines anvo_sub);uint li_record
uint li_length
uint li_ifnt
uint li_ifmt
uint li_style
uint li_align
ulong ll_border1
ulong ll_border2
uint li_pcolor
uint li_atr_num
uint li_atr_fnt
uint li_atr_alc
uint li_atr_bdr
uint li_atr_pat
uint li_atr_prot
uint li_rotation
uint li_grbit8
uint li_usedattr
blob lb_data

if as_style = "style" then
	li_style = 65525
else
	li_style = ii_locked + ii_hidden * 2
end if

if ii_num_format <> 0 then
	li_atr_num = 1
end if

if ii_font_index <> 0 then
	li_atr_fnt = 1
end if

if ii_text_h_align <> 0 or ii_text_v_align <> 2 or ii_text_wrap <> 0 then
	li_atr_alc = 1
end if

if ii_bottom <> 0 or ii_top <> 0 or ii_left <> 0 or ii_right <> 0 then
	li_atr_bdr = 1
end if

if ii_fg_color <> 64 or ii_bg_color <> 65 or ii_pattern <> 0 then
	li_atr_pat = 1
end if

if ii_hidden <> 0 or ii_locked <> 1 then
	li_atr_prot = 1
end if

if ii_fg_color = 32767 then
	ii_fg_color = 64
end if

if ii_bg_color = 32767 then
	ii_bg_color = 65
end if

if ii_bottom_color = 32767 then
	ii_bottom_color = 64
end if

if ii_top_color = 32767 then
	ii_top_color = 64
end if

if ii_left_color = 32767 then
	ii_left_color = 64
end if

if ii_right_color = 32767 then
	ii_right_color = 64
end if

if ii_bottom = 0 then
	ii_bottom_color = 0
end if

if ii_top = 0 then
	ii_top_color = 0
end if

if ii_left = 0 then
	ii_left_color = 0
end if

if ii_right = 0 then
	ii_right_color = 0
end if

if ii_pattern <= 1 and ii_bg_color <> 65 and ii_fg_color = 64 then
	ii_fg_color = ii_bg_color
	ii_bg_color = 64
	ii_pattern = 1
end if

if ii_pattern <= 1 and ii_bg_color = 65 and ii_fg_color <> 64 then
	ii_bg_color = 64
	ii_pattern = 1
end if

choose case ii_rotation
	case 0
		li_rotation = 0
	case 1
		li_rotation = 255
	case 2
		li_rotation = 90
	case 3
		li_rotation = 180
end choose

li_ifnt = ii_font_index
li_ifmt = ii_num_format
li_align = ii_text_h_align + ii_text_wrap * 8 + ii_text_v_align * 16 + ii_text_justlast * 128
li_grbit8 = 0 + 0 * 16 + 0 * 64
li_usedattr = li_atr_num + li_atr_fnt * 2 + li_atr_alc * 4 + li_atr_bdr * 8 + li_atr_pat * 16 + li_atr_prot * 32
ll_border1 = ii_left + ii_right * 16 + ii_top * 256 + ii_bottom * 4096 + ii_left_color * 65536 + ii_right_color * 8388608
ll_border2 = ii_top_color + ii_bottom_color * 128 + 0 * 16384 + 0 * 2097152 + ii_pattern * 67108864
li_pcolor = ii_fg_color + ii_bg_color * 128
li_record = 224
li_length = 20
lb_data = anvo_sub.of_pack(B2,li_record) + anvo_sub.of_pack(B2,li_length) + anvo_sub.of_pack(B2,li_ifnt) + anvo_sub.of_pack(B2,li_ifmt) + anvo_sub.of_pack(B2,li_style) + anvo_sub.of_pack(B1,li_align) + anvo_sub.of_pack(B1,li_rotation) + anvo_sub.of_pack(B1,li_grbit8) + anvo_sub.of_pack(B1,li_usedattr * 4) + anvo_sub.of_pack(B4,ll_border1) + anvo_sub.of_pack(B4,ll_border2) + anvo_sub.of_pack(B2,li_pcolor)
return lb_data
end function

public function integer of_set_borders (integer ai_borders);if ai_borders <= 0 then
	ii_top = 0
	ii_bottom = 0
	ii_left =  0
	ii_right = 0
else
	ii_top = ai_borders/BC_1000
	ii_bottom = mod(integer(ai_borders/BC_100),BC_10)
	ii_left =  mod(ai_borders,BC_100)/4
	ii_right = mod(ai_borders,BC_10)
end if
RETURN 1

end function

public function string of_get_format_short_key ();RETURN   string(ii_top) + string(ii_bottom) + string(ii_left) + string(ii_right) &
			+ is_font + string(ii_text_wrap) + is_num_format + string(ii_size) + string(ii_bold) + string(ii_italic) &
			+ string(ii_text_h_align) + string(ii_color) + string(ii_bg_color)
end function

public function integer of_copy (n_xls_formatx anvo_format);
ii_font_index = anvo_format.ii_font_index
is_num_format = anvo_format.is_num_format
ii_num_format = anvo_format.ii_num_format
is_font = anvo_format.is_font
ii_size = anvo_format.ii_size
ii_bold = anvo_format.ii_bold
ii_italic = anvo_format.ii_italic
ii_color = anvo_format.ii_color
ii_underline = anvo_format.ii_underline
ii_font_strikeout = anvo_format.ii_font_strikeout
ii_font_outline = anvo_format.ii_font_outline
ii_font_shadow = anvo_format.ii_font_shadow
ii_font_script = anvo_format.ii_font_script
ii_font_family = anvo_format.ii_font_family
ii_font_charset = anvo_format.ii_font_charset
ii_hidden = anvo_format.ii_hidden
ii_locked = anvo_format.ii_locked
ii_text_h_align = anvo_format.ii_text_h_align
ii_text_wrap = anvo_format.ii_text_wrap
ii_text_v_align = anvo_format.ii_text_v_align
ii_text_justlast = anvo_format.ii_text_justlast
ii_rotation = anvo_format.ii_rotation
ii_fg_color = anvo_format.ii_fg_color
ii_bg_color = anvo_format.ii_bg_color
ii_pattern = anvo_format.ii_pattern
ii_bottom = anvo_format.ii_bottom
ii_top = anvo_format.ii_top
ii_left = anvo_format.ii_left
ii_right = anvo_format.ii_right
ii_bottom_color = anvo_format.ii_bottom_color
ii_top_color = anvo_format.ii_top_color
ii_left_color = anvo_format.ii_left_color
ii_right_color = anvo_format.ii_right_color

return 1
end function

on n_xls_formatx.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_xls_formatx.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

