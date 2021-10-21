$PBExportHeader$u_bank_voucher_payment.sru
forward
global type u_bank_voucher_payment from cl_bank_voucher_payment
end type
end forward

global type u_bank_voucher_payment from cl_bank_voucher_payment
end type
global u_bank_voucher_payment u_bank_voucher_payment

on u_bank_voucher_payment.create
call super::create
end on

on u_bank_voucher_payment.destroy
call super::destroy
end on

