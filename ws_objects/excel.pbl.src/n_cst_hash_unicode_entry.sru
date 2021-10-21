$PBExportHeader$n_cst_hash_unicode_entry.sru
forward
global type n_cst_hash_unicode_entry from nonvisualobject
end type

end forward

global type n_cst_hash_unicode_entry from nonvisualobject
end type
global n_cst_hash_unicode_entry n_cst_hash_unicode_entry

type variables
public n_cst_hash_unicode_entry invo_next
public ulong il_hash
public blob ib_key

public long il_value
end variables

on n_cst_hash_unicode_entry.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_hash_unicode_entry.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

