$PBExportHeader$systray.sru
forward
global type systray from nonvisualobject
end type
type guid from structure within systray
end type
type notifyicondata from structure within systray
end type
type dllversioninfo from structure within systray
end type
end forward

type guid from structure
	long		data1
	integer		data2
	integer		data3
	character		data4[7]
end type 

type notifyicondata from structure
	long		cbsize descriptor "comment" = "kích thước kiểu, có thể dùng hàm Len để lấy "
	long		hwnd descriptor "comment" = "handle của cửa sổ tạo trayicon "
	long		uid descriptor "comment" = "số hiệu của icon hiện có trong khay do chương trình tạo "
	long		uflags descriptor "comment" = "là cờ, cho phép các thành phần khác có được hoạt động hay không: "
	long		ucallbackmessage descriptor "comment" = "message mà trayicon gửi về cho form, thông thường ta chọn WM_M OUSEMOVE"
	long		hicon descriptor "comment" = "handle icon thể hiện trên khay. "
	character		sztip[128] descriptor "comment" = "tooltip của icon khi đưa trỏ chuột đến"
	long		dwstate
	long		dwstatemask
	character		szinfo[256]
	long		utimeout
	character		szinfotitle[64]
	long		dwinfoflags
	guid		guiditem
end type

type dllversioninfo from structure
	unsignedlong		cbsize
	unsignedlong		dwmajorversion
	unsignedlong		dwminorversion
	unsignedlong		dwbuildnumber
	unsignedlong		dwplatformid
end type

global type systray from nonvisualobject autoinstantiate
end type

type prototypes
//Function boolean Shell_NotifyIcon ( long dwMessage, ref notifyicondata pnid ) Library "shell32.dll" alias for "Shell_NotifyIcon;Ansi"
Public Function boolean Shell_NotifyIcon (Long dwMessage, Any lpData) Library "shell32" Alias For "Shell_NotifyIconW"
Function boolean SetForegroundWindow ( ulong hWnd ) Library "user32.dll"
//Function long LoadImageA ( long hInst, string lpszName, uint uType, int cxDesired, int cyDesired, uint fuLoad ) Library "user32.dll" alias for "LoadImageA;Ansi"
Function long LoadImageW ( long hInst, string lpszName, uint uType, int cxDesired, int cyDesired, uint fuLoad ) Library "user32.dll"
Function long ExtractIconA ( long hInst, string lpszExeFileName, uint nIconIndex) Library "shell32.dll" alias for "ExtractIconA;Ansi"
Function boolean DestroyIcon ( long hIcon ) Library "user32.dll"
Function boolean RegisterHotKey ( ulong hWnd, int id, uint fsModifiers, uint vk ) Library "user32.dll"
Function boolean UnregisterHotKey ( ulong hWnd, int id ) Library "user32.dll"
Function long DllGetVersion( ref dllversioninfo pdvi ) Library "comctl32.dll" alias for "DllGetVersion;Ansi"
//Function long LoadLibrary( string lpFileName ) Library "kernel32.dll" Alias For "LoadLibraryA;Ansi"
Function long LoadLibrary( string lpFileName ) Library "kernel32.dll" Alias For "LoadLibraryW"
Function boolean FreeLibrary( long hModule ) Library "kernel32.dll"
// no unicode version
Function long GetProcAddress( long hModule, string lpProcName ) Library "kernel32.dll" alias for "GetProcAddress;Ansi"
// get handle for specified window classname
FUNCTION ulong FindWindow(string classname,string windowname) LIBRARY "User32.dll" Alias For "FindWindowW"
// 
function boolean GetWindowRect(ulong hwnd, ref rect lpRect) LIBRARY "user32.dll" alias for "GetWindowRect;Ansi"
end prototypes

type variables
Long il_iconhandles[]
Long NOTIFYICONDATA_SIZE = 88
Long NOTIFYICON_VERSION = 1
boolean ib_close_yn = false
string is_tip
// function constants

CONSTANT long NIF_MESSAGE	= 1
CONSTANT long NIF_ICON		= 2
CONSTANT long NIF_TIP		= 4
CONSTANT long NIF_STATE		= 8
CONSTANT long NIF_INFO		= 16

CONSTANT long NIM_ADD		= 0
CONSTANT long NIM_MODIFY	= 1
CONSTANT long NIM_DELETE	= 2
CONSTANT long NIM_SETFOCUS	= 3
CONSTANT long NIM_SETVERSION	= 4
CONSTANT long NIM_VERSION	= 5

CONSTANT long NIS_HIDDEN	= 1
CONSTANT long NIS_SHAREDICON	= 2

CONSTANT long NIIF_NONE		= 0
CONSTANT long NIIF_INFO		= 1
CONSTANT long NIIF_WARNING	= 2
CONSTANT long NIIF_ERROR	= 3
CONSTANT long NIIF_GUID		= 5
CONSTANT long NIIF_ICON_MASK	= 15
CONSTANT long NIIF_NOSOUND	= 16

CONSTANT ulong NOTIFYICONDATA_V1_SIZE = 88  // pre-5.0 structure size
CONSTANT ulong NOTIFYICONDATA_V2_SIZE = 488 // pre-6.0 structure size
CONSTANT ulong NOTIFYICONDATA_V3_SIZE = 504 // 6.0+ structure size

CONSTANT long ICON_SMALL	= 0
CONSTANT long ICON_BIG		= 1

CONSTANT uint IMAGE_BITMAP	= 0
CONSTANT uint IMAGE_ICON	= 1
CONSTANT uint IMAGE_CURSOR	= 2

CONSTANT uint LR_DEFAULTCOLOR		= 0
CONSTANT uint LR_MONOCHROME		= 1
CONSTANT uint LR_COLOR			= 2
CONSTANT uint LR_COPYRETURNORG	= 4
CONSTANT uint LR_COPYDELETEORG	= 8
CONSTANT uint LR_LOADFROMFILE		= 16
CONSTANT uint LR_LOADTRANSPARENT	= 32
CONSTANT uint LR_DEFAULTSIZE		= 64
CONSTANT uint LR_VGACOLOR		= 128
CONSTANT uint LR_LOADMAP3DCOLORS	= 4096
CONSTANT uint LR_CREATEDIBSECTION	= 8192
CONSTANT uint LR_COPYFROMRESOURCE	= 16384
CONSTANT uint LR_SHARED		= 32768

// windows messages
CONSTANT long WM_GETICON		= 127
CONSTANT long WM_MOUSEMOVE		= 512
CONSTANT long WM_LBUTTONDOWN	= 513
CONSTANT long WM_LBUTTONUP		= 514
CONSTANT long WM_LBUTTONDBLCLK	= 515
CONSTANT long WM_RBUTTONDOWN	= 516
CONSTANT long WM_RBUTTONUP		= 517
CONSTANT long WM_RBUTTONDBLCLK	= 518
CONSTANT long PBM_CUSTOM01		= 1024

end variables

forward prototypes
public function integer f_add_icon (window aw_window, string as_image_icon)
public function long f_load_image (string as_imagename)
public subroutine f_set_focus (window aw_window)
public function integer f_delete_icon (window aw_window, boolean ab_show)
public function integer f_modify_icon (window aw_window, string as_image_icon)
end prototypes

public function integer f_add_icon (window aw_window, string as_image_icon);//ham nay set icon vao sys tray va an cua so chinh

NOTIFYICONDATA lstr_data
lstr_data.cbsize = NOTIFYICONDATA_SIZE
lstr_data.hwnd = Handle(aw_window)
lstr_data.uid = 1
lstr_data.uflags = NIF_ICON + NIF_TIP + NIF_MESSAGE
lstr_data.ucallbackmessage = PBM_CUSTOM01
lstr_data.hicon = f_load_image(as_image_icon)
lstr_data.sztip = 'Bamboo Alert' // aw_window.title
if Shell_NotifyIcon(NIM_ADD,lstr_data) then
	//aw_window.hide()//vi systray pm làm mất focus lên ko dc ẩn
	return 1
else
	return 0
end if
end function

public function long f_load_image (string as_imagename);// load image into memory from .ico, .cur or .ani file

Long ll_handle

CHOOSE CASE Lower(Right(as_imagename, 4))
	CASE ".ico"
		ll_handle = LoadImageW(0, as_imagename, IMAGE_ICON, 0, 0, LR_LOADFROMFILE + LR_DEFAULTSIZE)
	CASE ".cur", ".ani"
		ll_handle = LoadImageW(0, as_imagename, IMAGE_CURSOR, 0, 0, LR_LOADFROMFILE + LR_DEFAULTSIZE)
	CASE ELSE
END CHOOSE

Return ll_handle
end function

public subroutine f_set_focus (window aw_window);// give window proper focus
SetForegroundWindow(Handle(aw_window))
end subroutine

public function integer f_delete_icon (window aw_window, boolean ab_show);//ham nay set icon vao sys tray va an cua so chinh
NOTIFYICONDATA lstr_data
lstr_data.cbsize = NOTIFYICONDATA_SIZE
lstr_data.hwnd = Handle(aw_window)
lstr_data.uid = 1
// remove icon from system tray
if Shell_NotifyIcon(NIM_DELETE,lstr_data) then
	if ab_show then
		aw_window.show()
		f_set_focus(aw_window)
	end if
	return 1
else
	return 0
end if
end function

public function integer f_modify_icon (window aw_window, string as_image_icon);//ham nay set icon vao sys tray va an cua so chinh

NOTIFYICONDATA lstr_data
lstr_data.cbsize = NOTIFYICONDATA_SIZE
lstr_data.hwnd = Handle(aw_window)
lstr_data.uid = 1
lstr_data.uflags = NIF_ICON + NIF_TIP + NIF_MESSAGE
lstr_data.ucallbackmessage = PBM_CUSTOM01
lstr_data.hicon = f_load_image(as_image_icon)
lstr_data.sztip = aw_window.title
if Shell_NotifyIcon(NIM_MODIFY,lstr_data) then
	return 1
else
	return 0
end if
end function

on systray.create
call super::create
TriggerEvent( this, "constructor" )
end on

on systray.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

