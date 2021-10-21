$PBExportHeader$c_err_message.sru
forward
global type c_err_message from s_object_display
end type
end forward

global type c_err_message from s_object_display
end type
global c_err_message c_err_message

type variables
protected:
String		is_bttn, is_bttntext[]

int  					DEFAULT_BTTN
string  				ICON 
string  				BUTTON
string					TEXT
string					TITLE
string					CODE
String					is_message
end variables

forward prototypes
public function string f_get_picture ()
public function integer f_init_message (string vs_msgparm)
public function integer f_init_message (error verr_system)
public function integer f_display_message ()
public function integer f_get_bttn_text (ref string ras_bttntext[])
public function integer f_get_init_button (ref string rs_bttn, ref string ras_bttntext[])
end prototypes

public function string f_get_picture ();string		ls_pic

ls_pic = 'pics\'+icon+string(rand(5))+".png"

return ls_pic
end function

public function integer f_init_message (string vs_msgparm);int						li_pos, li_rtn
string					las_parm[], ls_variable
c_obj_service		lc_obj_service


lc_obj_service.f_stringtoarray( vs_msgParm, '#', las_parm[])
if pos( las_parm[3], '@')> 0 then
	if lastpos( las_parm[3], '@') = pos( las_parm[3], '@') then
		ls_variable = mid( las_parm[3], pos( las_parm[3], '@') +1) 
	else
		ls_variable = mid( las_parm[3], pos( las_parm[3], '@') +1, lastpos( las_parm[3], '+') - pos( las_parm[3], '@') -1) 
	end if
end if

SELECT 
		   MESSAGE.CODE,		
		   MESSAGE.DEFAULT_BTTN,
            MESSAGE.BUTTON,
            MESSAGE.ICON,
            LABEL.TEXT,
            LABEL.TTDHELP
   INTO
		:CODE,	
		:DEFAULT_BTTN,
		:BUTTON ,
		:ICON,
		:TEXT,
		:TITLE      
FROM message
         JOIN label on (MESSAGE.CODE = LABEL.CODE)
WHERE LABEL.LANG = :gs_user_lang
    AND LABEL.SUBCODE = 'MESSAGE.TEXT'
    AND MESSAGE.CODE = :las_parm[1]
  using it_transaction;
  
if pos(TEXT,'@') > 0  then 
  is_message = lc_obj_service.f_globalreplace( TEXT, '@', ls_variable) 
else
	is_message = TEXT
end if
if it_transaction.sqlcode = -1 then
	messagebox('ERROR', it_transaction.sqlerrtext)
elseif it_transaction.sqlnrows = 0 then
	TITLE = '['+las_parm[2]+']'
	TEXT = las_parm[3]
	ICON = las_parm[4]
	BUTTON = las_parm[5]
	DEFAULT_BTTN = integer(las_parm[6])
	is_message = lc_obj_service.f_globalreplace( TEXT, '@', '')
end if

li_rtn = it_transaction.sqlcode

return li_rtn
end function

public function integer f_init_message (error verr_system);

TITLE = '[ ERROR ]'
TEXT = verr_system.text
ICON = 'stop'
BUTTON = 'abortcontinue'
DEFAULT_BTTN = 1
is_message = TEXT + '~n' + verr_system.object + '-' + verr_system.ObjectEvent + '-' + string (verr_system.line)

return 1
end function

public function integer f_display_message ();windowobject 		lwo_window[]
t_mle					l_mle
t_p					l_pic
t_cb					l_cb[]

int						li_idx, li_bttnCnt, li_x
string					ls_bttnText[]

this.f_get_bttn_text(ls_bttnText[] )
iw_display.setredraw( false)
iw_display.title = TITLE
lwo_window = iw_display.control	
For li_idx = 1 to upperbound(lwo_window)
	Choose Case lwo_window[li_idx].typeof()
		Case CommandButton!
			if lwo_window[li_idx].classname( ) = 'cb_1' then
				l_cb[1] =  lwo_window[li_idx]
				l_cb[1] .text = ls_bttnText[1]
				l_cb[1] .visible = true
				if DEFAULT_BTTN = 1 then
					l_cb[1].default = true
				end if
			elseif lwo_window[li_idx].classname( ) = 'cb_2' then
				l_cb[2] =  lwo_window[li_idx]
				if upperbound(ls_bttnText[]) > 1 then					
					l_cb[2].text = ls_bttnText[2]
					l_cb[2].visible = true
					if DEFAULT_BTTN = 2 then
						l_cb[2].default = true
					end if								
				else
					l_cb[2].visible = false
				end if
			elseif lwo_window[li_idx].classname( ) = 'cb_3' then
				l_cb[3] =  lwo_window[li_idx]
				if upperbound(ls_bttnText[]) > 2 then					
					l_cb[3].text = ls_bttnText[3]
					l_cb[3].visible = true
					if DEFAULT_BTTN = 2 then
						l_cb[3].default = true
					end if								
				else
					l_cb[3].visible = false
				end if
			elseif lwo_window[li_idx].classname( ) = 'cb_4' then
				l_cb[4] =  lwo_window[li_idx]
				if upperbound(ls_bttnText[]) = 4 then				
					l_cb[4].text = ls_bttnText[4]
					l_cb[4].visible = true
					if DEFAULT_BTTN = 2 then
						l_cb[4].default = true
					end if								
				else
					l_cb[4].visible = false
				end if
			end if
		case Picture!
			l_pic = lwo_window[li_idx]
			l_pic.picturename = this.f_get_picture( )
		case multilineedit!
			l_mle = lwo_window[li_idx]
			l_mle.text = is_message
	end choose 
Next
//-- resize button --//
li_bttnCnt = upperbound(ls_bttnText[])
li_x = (4 - li_bttnCnt)*l_cb[1].width/2
FOR li_idx=1 to li_bttnCnt
	if li_idx = 1 then
		l_cb[li_idx].x = l_mle.x + li_x 
	else
		l_cb[li_idx].x = l_cb[li_idx - 1].x +  l_cb[li_idx - 1].width + 10  
	end if	
NEXT
iw_display.setredraw( true)
return 1
end function

public function integer f_get_bttn_text (ref string ras_bttntext[]);string						ls_bttnText, las_bttn[]
int							li_cnt, li_idx
c_string					lc_string
 select text into :ls_bttnText from label where code = :CODE and subcode = 'MESSAGE.BUTTON' and lang = :gs_user_lang using it_transaction;
 
 if it_transaction.sqlcode = -1 then
	messagebox('ERROR',it_transaction.sqlerrtext)
	return -1
elseif it_transaction.sqlnrows = 0 then
	li_cnt = lc_string.f_stringtoarray( is_bttn, ';', las_bttn[])
	FOR li_idx = 1 to li_cnt
		 if las_bttn[li_idx] = button then
			li_cnt = lc_string.f_stringtoarray(  is_bttntext[li_idx], ';',ras_bttntext[])
			return li_cnt
		end if
	NEXT
elseif it_transaction.sqlnrows = 1 then
	li_cnt = lc_string.f_stringtoarray( is_bttn, ';', las_bttn[])
	FOR li_idx = 1 to li_cnt
		 if las_bttn[li_idx] = ls_bttnText then
			li_cnt = lc_string.f_stringtoarray(  is_bttntext[li_idx], ';',ras_bttntext[])
			return li_cnt
		end if
	NEXT	
end if

li_cnt = lc_string.f_stringtoarray( ls_bttnText, ';', ras_bttntext[])
return li_cnt
end function

public function integer f_get_init_button (ref string rs_bttn, ref string ras_bttntext[]);rs_bttn =is_bttn
ras_bttnText[] = is_bttntext[]
return 1
end function

on c_err_message.create
call super::create
end on

on c_err_message.destroy
call super::destroy
end on

event constructor;//-- Overridew--//

is_bttn = 'ok;yesno;retrycancel;abortcontinue;yesnocancel;abortretryignore;yesyestoallno;yesyestoallnonotoall;'
is_bttntext[1] = 'OK'
is_bttntext[2] = 'Đồng ý; Không;'
is_bttntext[3] = 'Thử lại; Thoát;'
is_bttntext[4] = 'Dừng; Tiếp tục;'
is_bttntext[5] = 'Đồng ý; Không; Thoát;'
is_bttntext[6] = 'Dừng; Thử lại; Bỏ qua;'
is_bttntext[7] = 'Đồng ý; Đồng ý tất cả; Không;'
is_bttntext[8] = 'Đồng ý; Đồng ý tất cả; Không; Không tất cả;'


it_transaction = create t_transaction
it_transaction.dbms =	SQLCA.DBMS
it_transaction.ServerName	 = SQLCA.ServerName
it_transaction.LogId	 = SQLCA.LogId
it_transaction.LogPass 	 = SQLCA.LogPass 
it_transaction.AutoCommit 	 = false 
it_transaction.DBParm	 = SQLCA.DBParm
connect using	it_transaction;	

end event

event e_window_e_preopen;call super::e_window_e_preopen;
return this.f_display_message( )
end event

event destructor;call super::destructor;
disconnect using it_transaction;
destroy it_transaction
end event

