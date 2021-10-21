$PBExportHeader$u_total_sal_invoice_all.sru
forward
global type u_total_sal_invoice_all from u_total_sal_invoice
end type
end forward

global type u_total_sal_invoice_all from u_total_sal_invoice
end type
global u_total_sal_invoice_all u_total_sal_invoice_all

on u_total_sal_invoice_all.create
call super::create
end on

on u_total_sal_invoice_all.destroy
call super::destroy
end on

