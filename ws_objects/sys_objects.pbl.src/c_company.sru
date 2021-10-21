$PBExportHeader$c_company.sru
$PBExportComments$company class, kế thừa c_organisation
forward
global type c_company from c_organisation
end type
end forward

global type c_company from c_organisation autoinstantiate
end type

type variables
string is_bg_id
end variables

forward prototypes
public function string f_loadpicture ()
public function integer f_del_logo (long vl_comp_id)
end prototypes

public function string f_loadpicture ();/*create by Dan 07/08/09
   chuc nang: lay duong dan file hinh muon load len form
	    return: ls_path: thanh cong
		                   0: loi
*/

String ls_path
long   ll_value, ll_flen, li_FileNum,ll_loop,ll_count,ll_read
blob   lb_get, lb_tot, lbl_picture
 
 SELECTBLOB logo into :lbl_picture
		  FROM erp_legal_company
		WHERE company_id = :gi_user_comp_id;
		 
 if sqlca.sqlcode <> 0 then 
	 ls_path = ''
else
	 ls_path = GetCurrentDirectory() + '\pics\comp_logo.jpg'
	 if FileExists(ls_path)  then ls_path = Mid(ls_path,1,pos(ls_path,'.jpg') - 1) + '1.jpg'
	 
	  ll_flen = Len(lbl_picture)
	  li_FileNum = FileOpen(ls_path, StreamMode!, Write!, LockWrite!, Replace!)
	  
	   do while ll_flen > 0 
		 if ll_flen <= 32765 then 
			 lb_tot = lbl_picture 
			 ll_flen = 0 
		 else 
			 lb_tot        = blobmid(lbl_picture,1,32765) 
			 lbl_picture = blobmid(lbl_picture,32766) 
			 ll_flen      += -32765 
		 end if 
		 filewrite(li_FileNum,lb_tot) 
	  loop 
	  FileClose(li_FileNum)
	  SetPointer(Arrow!)
end if
return ls_path
end function

public function integer f_del_logo (long vl_comp_id);int li_return
blob lb_blob

setnull(lb_blob)
//UPDATE erp_legal_company
//	       set logo = :lb_blob
//	WHERE company_id = :vl_comp_id;
//	
if sqlca.sqlcode <> 0 then
	//gf_messagebox('msg_XoaLogoErr')
	return -1
end if
commit;
return 1
end function

on c_company.create
call super::create
end on

on c_company.destroy
call super::destroy
end on

