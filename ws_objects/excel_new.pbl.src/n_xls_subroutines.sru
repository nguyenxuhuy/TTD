$PBExportHeader$n_xls_subroutines.sru
forward
global type n_xls_subroutines from nonvisualobject
end type
end forward

global type n_xls_subroutines from nonvisualobject
end type
global n_xls_subroutines n_xls_subroutines

type prototypes
public function ulong multibytetowidechar (uint codepage,ulong dwflags,ref string lpmultibytestr,integer cbmultibyte,ref blob lpwidecharstr,integer cchwidechar)  library "kernel32.dll" alias for "MultiByteToWideChar"
public function ulong widechartomultibyte (uint codepage,ulong dwflags,ref blob lpwidecharstr,integer cchwidechar,ref string lpmultibytestr,integer cchmultibyte,ref char lpdefaultchar,ref boolean lpuseddefaultchar)  library "kernel32.dll" alias for "WideCharToMultiByte"

function ulong LCMapString(ulong Locale,ulong dwMapFlags,ref string lpSrcStr,ulong cchSrc,ref string lpDestStr,ulong cchDest) LIBRARY "kernel32.dll" ALIAS FOR "LCMapStringA;ansi" 
end prototypes

type variables

end variables

forward prototypes
public function blob of_pack (character ac_conv_type, double ad_val)
public function blob of_pack_hex (string as_val)
public function blob of_pack (integer ac_conv_type, unsignedlong al_val)
public function blob of_ansi2unicode (string as_value)
public function string of_unicode2ansi (blob a_value)
public function string of_unicode2ansi (blob a_value, unsignedinteger ai_codepage)
public function string of_unicode2ansi (blob a_value, unsignedinteger ai_codepage, character ac_default_char)
public function string of_big2gb (string as_source, string as_type)
public function blob of_ansi2unicode (string as_value, unsignedlong ai_codepage)
end prototypes

public function blob of_pack (character ac_conv_type, double ad_val);blob{8} lb_ret
integer li

if ac_conv_type = "d" then
	li = blobedit(lb_ret,1,ad_val)
else
	messagebox("Error","Invalid argument type in of_pack('" + ac_conv_type + "', double)")
end if

if li > 0 then
	lb_ret = blobmid(lb_ret,1,li - 1)
else
	lb_ret = blob("")
end if

return lb_ret
end function

public function blob of_pack_hex (string as_val);blob lblb_val
blob{100} lblb_buff
integer li_buff_size = 100
integer li_buff_pos = 1
integer li_i
integer li_cnt
string ls_str[2]
integer li_j
integer li_val

setnull(lblb_val)
li_cnt = len(as_val)
lblb_buff = blob(space(li_buff_size))

for li_i = 1 to li_cnt step 2

	if li_i = li_cnt then
		ls_str[1] = "0"
		ls_str[2] = mid(as_val,li_i,1)
	else
		ls_str[1] = mid(as_val,li_i,1)
		ls_str[2] = mid(as_val,li_i + 1,1)
	end if

	li_val = 0

	for li_j = 1 to 2
		li_val = li_val * 16

		choose case ls_str[li_j]
			case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
				li_val += integer(ls_str[li_j])
			case "A"
				li_val = li_val + 10
			case "B"
				li_val = li_val + 11
			case "C"
				li_val = li_val + 12
			case "D"
				li_val = li_val + 13
			case "E"
				li_val = li_val + 14
			case "F"
				li_val = li_val + 15
		end choose

	next

	blobedit(lblb_buff,li_buff_pos,char(li_val))
	li_buff_pos ++

	if li_buff_pos = li_buff_size then

		if isnull(lblb_val) then
			lblb_val = lblb_buff
		else
			lblb_val = lblb_val + lblb_buff
		end if

		li_buff_pos = 1
	end if

next

if li_buff_pos > 1 then

	if isnull(lblb_val) then
		lblb_val = lblb_buff
	else
		lblb_val = lblb_val + lblb_buff
	end if

end if

return lblb_val
end function

public function blob of_pack (integer ac_conv_type, unsignedlong al_val);blob{4} lb_ret
BlobEdit(lb_ret, 1, al_val)
RETURN BlobMid(lb_ret,1,ac_conv_type)
end function

public function blob of_ansi2unicode (string as_value);return of_ansi2unicode(as_value,0)
end function

public function string of_unicode2ansi (blob a_value);return of_unicode2ansi(a_value,0)
end function

public function string of_unicode2ansi (blob a_value, unsignedinteger ai_codepage);integer li_input_size
integer li_output_size
string ls_buff
char lc_def_char
boolean lb_use_def_char = false

if len(blob("*")) = 2 then
	return string(a_value)
end if

li_input_size = len(a_value) / 2
li_output_size = widechartomultibyte(ai_codepage,0,a_value,li_input_size,ls_buff,0,lc_def_char,lb_use_def_char)
ls_buff = space(li_output_size)
lc_def_char = "?"
lb_use_def_char = true
widechartomultibyte(ai_codepage,0,a_value,li_input_size,ls_buff,li_output_size,lc_def_char,lb_use_def_char)
return ls_buff
end function

public function string of_unicode2ansi (blob a_value, unsignedinteger ai_codepage, character ac_default_char);integer li_input_size
integer li_output_size
string ls_buff
char lc_def_char
boolean lb_use_def_char = false

if len(blob("*")) = 2 then
	return string(a_value)
end if

li_input_size = len(a_value) / 2
li_output_size = widechartomultibyte(ai_codepage,0,a_value,li_input_size,ls_buff,0,lc_def_char,lb_use_def_char)
ls_buff = space(li_output_size)
lc_def_char = ac_default_char
lb_use_def_char = true
widechartomultibyte(ai_codepage,0,a_value,li_input_size,ls_buff,li_output_size,lc_def_char,lb_use_def_char)
return ls_buff
end function

public function string of_big2gb (string as_source, string as_type);Constant long LCMAP_TRADITIONAL_CHINESE=67108864
Constant long LCMAP_SIMPLIFIED_CHINESE=33554432
string aa,b
//long c
//b=as_source
//c=len(b)*2+1
//aa=space(c)
//
//string sn
//ulong un
//blob unicode
//
//
//if Upper(as_type)='BIG' then
// LCMapString(2052,LCMAP_TRADITIONAL_CHINESE,b,-1,aa,c)
//else
// LCMapString(2052,LCMAP_SIMPLIFIED_CHINESE,b,-1,aa,c)
//end if
//
////MultiByteToWideChar (936, 0, aa, -1, unicode,c)
////WideCharToMultiByte (950, 0, unicode, -1, aa,c, sn,un)

return aa
end function

public function blob of_ansi2unicode (string as_value, unsignedlong ai_codepage);blob lc_buff
ulong li_output_size
ulong li_input_size
long ll_pos

//str2xls remove '~r'
ll_pos = pos(as_value,"~r~n")
do while ll_pos > 0
	as_value = replace(as_value,ll_pos,2,"~n")
	ll_pos = pos(as_value,"~r~n",ll_pos)
loop	
string ls_temp_buff

setnull(lc_buff)
li_input_size = len(as_value)
li_output_size = len(blob(as_value))

if li_input_size = li_output_size then
	lc_buff = blob("*")
	li_output_size = multibytetowidechar(ai_codepage,0,as_value,li_input_size,lc_buff,0)

	if li_output_size > 0 then
		ls_temp_buff = space(li_output_size * 2)
		lc_buff = blob(ls_temp_buff)
		li_output_size = multibytetowidechar(ai_codepage,0,as_value,li_input_size,lc_buff,li_output_size)
	else
		lc_buff = blob("")
	end if

else
	lc_buff = blob(as_value)
end if

return lc_buff
end function

on n_xls_subroutines.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_xls_subroutines.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

