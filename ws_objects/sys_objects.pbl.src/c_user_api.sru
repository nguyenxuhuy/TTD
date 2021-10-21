$PBExportHeader$c_user_api.sru
forward
global type c_user_api from nonvisualobject
end type
end forward

global type c_user_api from nonvisualobject autoinstantiate
end type

type prototypes
//API functions for library KERNEL32.DLL
Function ulong GetTempPath (ulong nBufferLength, ref string lpBuffer) Library "KERNEL32.DLL"  Alias for "GetTempPathW"

//SHELL32.DL
Function ulong ShellExecute (ulong hWnd, ref string lpOperation, ref string lpFile, ref string lpParameters, ref string lpDirectory, uint nShowCmd) Library "SHELL32.DLL" Alias for "ShellExecuteW"

Function boolean EmptyClipboard ( ) Library "user32.dll" Alias for "EmptyClipboard"
end prototypes

type variables
constant integer MAX_PATH          = 260
constant integer OFS_MAXPATHNAME = 128

/*
 * ShowWindow() Commands
 */
constant int SW_HIDE             = 0
constant int SW_SHOWNORMAL       = 1
constant int SW_NORMAL           = 1
constant int SW_SHOWMINIMIZED    = 2
constant int SW_SHOWMAXIMIZED    = 3
constant int SW_MAXIMIZE         = 3
constant int SW_SHOWNOACTIVATE   = 4
constant int SW_SHOW             = 5
constant int SW_MINIMIZE         = 6
constant int SW_SHOWMINNOACTIVE  = 7
constant int SW_SHOWNA           = 8
constant int SW_RESTORE          = 9
constant int SW_SHOWDEFAULT      = 10
constant int SW_FORCEMINIMIZE    = 11
constant int SW_MAX              = 11
end variables

on c_user_api.create
call super::create
TriggerEvent( this, "constructor" )
end on

on c_user_api.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

