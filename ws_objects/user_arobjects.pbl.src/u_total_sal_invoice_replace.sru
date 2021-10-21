$PBExportHeader$u_total_sal_invoice_replace.sru
forward
global type u_total_sal_invoice_replace from u_total_sal_invoice
end type
end forward

global type u_total_sal_invoice_replace from u_total_sal_invoice
end type
global u_total_sal_invoice_replace u_total_sal_invoice_replace

on u_total_sal_invoice_replace.create
call super::create
end on

on u_total_sal_invoice_replace.destroy
call super::destroy
end on

