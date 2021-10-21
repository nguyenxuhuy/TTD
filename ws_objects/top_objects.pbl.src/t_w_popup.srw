$PBExportHeader$t_w_popup.srw
$PBExportComments$top window popup
forward
global type t_w_popup from window
end type
end forward

global type t_w_popup from window
integer width = 3141
integer height = 1440
boolean titlebar = true
string title = "top popup"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
end type
global t_w_popup t_w_popup

on t_w_popup.create
end on

on t_w_popup.destroy
end on

