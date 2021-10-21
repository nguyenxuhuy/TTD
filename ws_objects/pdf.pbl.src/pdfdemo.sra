$PBExportHeader$pdfdemo.sra
$PBExportComments$Generated Application Object
forward
global type pdfdemo from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type pdfdemo from application
string appname = "pdfdemo"
end type
global pdfdemo pdfdemo

on pdfdemo.create
appname="pdfdemo"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on pdfdemo.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;Open ( w_pdf )
end event

