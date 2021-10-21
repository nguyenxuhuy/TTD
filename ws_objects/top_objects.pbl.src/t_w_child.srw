$PBExportHeader$t_w_child.srw
$PBExportComments$top window child
forward
global type t_w_child from window
end type
end forward

global type t_w_child from window
integer width = 3141
integer height = 1427
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
end type
global t_w_child t_w_child

type variables
Protected:
boolean ib_resize = true

int ii_left_margin1 = 5, ii_right_margin1 = 5, ii_top_margin1 = 2, ii_bottom_margin1 = 2

private:
end variables

on t_w_child.create
end on

on t_w_child.destroy
end on

