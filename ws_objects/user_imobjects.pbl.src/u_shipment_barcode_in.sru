$PBExportHeader$u_shipment_barcode_in.sru
forward
global type u_shipment_barcode_in from cl_shipment_barcode_in
end type
end forward

global type u_shipment_barcode_in from cl_shipment_barcode_in
end type
global u_shipment_barcode_in u_shipment_barcode_in

on u_shipment_barcode_in.create
call super::create
end on

on u_shipment_barcode_in.destroy
call super::destroy
end on

