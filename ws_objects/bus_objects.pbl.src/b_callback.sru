$PBExportHeader$b_callback.sru
forward
global type b_callback from s_object
end type
end forward

global type b_callback from s_object
end type
global b_callback b_callback

type variables
//s_object_display	ic_report
//datawindow 			idw_report
datastore				ids_data_server
//window				iw_report
//tab					itab_report
int						ii_tabindex
string					is_post_msg
end variables

forward prototypes
public subroutine f_setw (window vw_report)
public subroutine f_setdw (datawindow vdw_report)
public subroutine f_settab (tab vtab_report)
public subroutine f_setdata (blob vblb_dwreport)
public subroutine f_set_obj_report (s_object_display vc_report)
public subroutine f_setdata_popup (blob vblb_dwreport)
public subroutine f_set_user_alert (long vl_user_id)
public subroutine f_finished_send_mail (long vl_num_of_cus)
public subroutine f_copy_datastore (t_dw_mpl vdw_handling)
end prototypes

public subroutine f_setw (window vw_report);
end subroutine

public subroutine f_setdw (datawindow vdw_report);
end subroutine

public subroutine f_settab (tab vtab_report);
end subroutine

public subroutine f_setdata (blob vblb_dwreport);
end subroutine

public subroutine f_set_obj_report (s_object_display vc_report);
end subroutine

public subroutine f_setdata_popup (blob vblb_dwreport);

end subroutine

public subroutine f_set_user_alert (long vl_user_id);
end subroutine

public subroutine f_finished_send_mail (long vl_num_of_cus);//string		ls_subject,ls_name
//if isvalid(idw_report) or not isnull(idw_report) then
//	ls_subject = idw_report.getitemstring( idw_report.getrow( ) , 'subject')
//	ls_name = idw_report.getitemstring( idw_report.getrow( ) , 'name')
//	gf_messagebox('m.b_callback.f_finished_send_mail.01','Thông báo','Đã gửi mail "'+ls_subject+'"' +' cho danh sách "'+ls_name+'". @ '+'Số lượng mail đã gửi: '+string(vl_num_of_cus),'exclamation','ok',1)
//else
//	gf_messagebox('m.b_callback.f_finished_send_mail.02','Thông báo','Đã gửi mail','exclamation','ok',1)
//end if
end subroutine

public subroutine f_copy_datastore (t_dw_mpl vdw_handling);
//ids_data[1] = create t_ds_db
//
//ids_data[1].dataobject = vdw_handling.dataobject
//ids_data[1].f_settransobject(SQLCA)
//vdw_handling.rowscopy( 1, vdw_handling.rowcount(), Primary!, ids_data[1], 1, Primary!)
end subroutine

on b_callback.create
call super::create
end on

on b_callback.destroy
call super::destroy
end on

