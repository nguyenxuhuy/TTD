$PBExportHeader$c_timing.sru
forward
global type c_timing from t_timing
end type
end forward

global type c_timing from t_timing
end type
global c_timing c_timing

type variables
t_transaction it_transaction
b_callback ib_callback
long il_interval_minute
string is_dwo
long il_user_id
end variables

forward prototypes
public function integer f_get_data ()
end prototypes

public function integer f_get_data ();t_ds_db			lds_report,lds_alert
string				ls_modify,ls_rtn
blob				lblb_report
long				ll_retrieve

lds_report = create t_ds_db
lds_report.dataobject = is_dwo
lds_report.f_settransobject(it_transaction )

ll_retrieve = lds_report.retrieve(il_user_id)
//messagebox(string(il_user_id) ,string(lds_report.rowcount()))
if ll_retrieve > 0 then
	lds_report.getfullstate( lblb_report)
	ib_callback.f_setdata_popup(lblb_report)
end if
destroy lds_report
return 1
end function

on c_timing.create
call super::create
end on

on c_timing.destroy
call super::destroy
end on

event timer;call super::timer;f_get_data()
this.stop()
this.start(il_interval_minute * 60)
//timer(il_interval_minute * 60) // ko dung dc cai nay
end event

