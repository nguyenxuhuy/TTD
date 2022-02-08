$PBExportHeader$c_item_label.sru
forward
global type c_item_label from s_object_display
end type
end forward

global type c_item_label from s_object_display
event e_action_fnd_expired ( )
event e_action_upd_price ( )
event e_action_print_label ( )
end type
global c_item_label c_item_label

type variables
boolean			ib_addnew, ib_input_complete
double			idb_object_id, idb_doc_id, idb_uom_id
end variables

forward prototypes
public subroutine f_set_actionpane ()
public subroutine f_set_dwo_window ()
public subroutine f_set_dwo_related ()
public function integer f_update_moving_avg (double vdb_item_id, double vdb_moving_avg, ref t_transaction rt_transaction)
public function double f_get_moving_avg (double vdb_item_id)
public function integer f_update_round_diff (double vdb_item_id, double vdb_round_diff, ref t_transaction rt_transaction)
public function double f_get_round_diff (double vdb_item_id)
public function boolean f_is_managed_qty (double vdb_item_id)
public function integer f_get_lot_or_serial_yn (double vdb_item_id, ref string rs_lot_yn, ref string rs_serial_yn)
public subroutine f_set_dwo_tabpage ()
public function integer f_get_retail_price (double vdb_item_id, double vdb_qty, double vdb_object_id, double vdb_currency, string vs_purchase_sales, date vd_trans_date, ref double rdc_price)
public function integer f_get_link_item (double vdb_item_id, ref double vadb_lnk_item[], ref double vadb_lnk_spec[], ref double vadb_lnk_qty[], ref t_transaction rt_transaction)
public function integer f_get_link_item (double vdb_item_id, double vdb_spec_id, ref double vadb_lnk_item[], ref double vadb_lnk_spec[], ref double vadb_lnk_qty[], ref t_transaction rt_transaction)
public function integer f_get_wholesales_price (double vdb_item_id, double vdb_qty, double vdb_currency_id, string vs_purchase_sales, date vd_trans_date, double vdb_customer_id, double vdb_sales_person, ref double rdb_wholesales_price)
public function integer f_get_discount (double vdb_item_id, double vdb_qty, double vdb_currency_id, string vs_purchase_sales, date vd_trans_date, double vdb_customer_id, double vdb_sales_person, ref double rdb_discount_amount, ref integer ri_discount_pct)
public function integer f_caculation_disc (double vdb_sales_price, ref double rdb_discount_amount, ref integer ri_discount_pct, ref double rdb_discount_price)
public function integer f_add_label (s_str_data vstr_data, ref t_transaction rt_transaction)
public function integer f_get_data_4_adding (ref s_str_data rstr_data)
end prototypes

event e_action_fnd_expired();s_str_data		lstr_data

open(c_w_expired_parm)
if not isvalid( message.powerobjectparm) then
	return
end if
lstr_data = message.powerobjectparm
setnull(message.powerobjectparm)

//-- thực hiện add label --//
connect using it_transaction;
this.f_add_label(lstr_data, it_transaction)
disconnect using it_transaction;		
end event

event e_action_upd_price();string				 ls_sql, ls_default
long				ll_row
date				ld_pur_date, ld_f_date, ld_t_date
double			ldb_item_id, ldb_trans_uom, ldc_max_price, ldb_price_id 
t_dw_mpl			ldw_label

ldw_label = iw_display.f_get_dw( 'd_retailed_price_upd_d_grid')

if ldw_label.rowcount() > 0 then
	connect using it_transaction;

	FOR ll_row = 1 to ldw_label.rowcount()

		ldc_max_price = ldw_label.getitemnumber(ll_row, 'retail_price')
		ldb_item_id = ldw_label.getitemnumber(ll_row, 'item_id')
		ldb_trans_uom =  ldw_label.getitemnumber(ll_row, 'trans_uom')
		ls_default =  ldw_label.getitemstring( ll_row, 'DFT_PRICE_YN')	
		if isnull(ls_default) then ls_default = 'N'
		
		//-- update hiệu lực giá cũ va2 insert gia moi --//
		ldb_price_id = ldw_label.getitemnumber( ll_row, 'id')
		if ldb_price_id  > 0 then

			ld_f_date = date(ldw_label.getitemdatetime( ll_row, 'f_date_old'))
			ld_t_date = date(ldw_label.getitemdatetime( ll_row, 't_date_old'))
			if isnull(ld_f_date) and ld_t_date >= relativeDate( today(), -1) then
				ls_sql = "Update ITEM_PRICE set t_date = to_date('"+string(ld_t_date) +"', '"+ gs_w_date_format+"')"
				ls_sql += " where ID =" +string(ldb_price_id)
				EXECUTE IMMEDIATE :ls_sql using it_transaction;		
				
				ld_f_date = date(ldw_label.getitemdatetime( ll_row, 'f_date'))
				if ldc_max_price > 0 and ld_f_date >= today() then
								
					ls_sql = "Insert into ITEM_PRICE (id,item_id,TRANS_UOM,retail_price, F_DATE, DFT_PRICE_YN," +& 
							"ITEM_APPLIED_TYPE,PRICE_TYPE,CURRENCY_ID,OBJECT_TYPE, OBJECT_APPLIED_TYPE," +&
							"company_id,branch_id,created_by,created_date,last_mdf_by,last_mdf_date )" + &
							"Values ("+ string(this.f_create_id_ex( it_transaction)) + ", " + string(ldb_item_id) +"," + string(ldb_trans_uom) +"," + string(ldc_max_price) +","+&
							" to_date('"+string(ld_f_date) +"', '"+ gs_w_date_format+"'), '" + ls_default +"' , 'spec', 'SALES', 23933, 'CUSTOMER', 'all', " +&
							string(gi_user_comp_id ) +"," + string( gdb_branch) +"," + string( gi_userid) +", to_date('"+string(today()) +"', '"+ gs_w_date_format+"'), " +&
							string( gi_userid) +", to_date('"+string(today()) +"', '"+ gs_w_date_format+"') )"								
					EXECUTE IMMEDIATE :ls_sql using it_transaction;
				end if			
			elseif not isnull(ld_f_date) and ld_t_date >= relativeDate( today(), -1) then
				ld_f_date = date(ldw_label.getitemdatetime( ll_row, 'f_date'))
				if ldc_max_price >0 and   ld_f_date >= today() then
					ls_sql = "Update ITEM_PRICE set retail_price = "+string(ldc_max_price)
					ls_sql += " where ID =" +string(ldb_price_id)			
					EXECUTE IMMEDIATE :ls_sql using it_transaction;
				end if
			end if
			
		else
			ld_f_date = date(ldw_label.getitemdatetime( ll_row, 'f_date'))
			if ldc_max_price > 0 and ld_f_date >= today() then
				ls_sql = "Insert into ITEM_PRICE (id,item_id,TRANS_UOM,retail_price, F_DATE, DFT_PRICE_YN," +& 
							"ITEM_APPLIED_TYPE,PRICE_TYPE,CURRENCY_ID,OBJECT_TYPE, OBJECT_APPLIED_TYPE," +&
							"company_id,branch_id,created_by,created_date,last_mdf_by,last_mdf_date )" + &
							"Values ("+ string(this.f_create_id_ex( it_transaction)) + ", " + string(ldb_item_id) +"," + string(ldb_trans_uom) +"," + string(ldc_max_price) +","+&
							" to_date('"+string(ld_f_date) +"', '"+ gs_w_date_format+"'), '" + ls_default +"' , 'spec', 'SALES', 23933, 'CUSTOMER', 'all', " +&
							string(gi_user_comp_id ) +"," + string( gdb_branch) +"," + string( gi_userid) +", to_date('"+string(today()) +"', '"+ gs_w_date_format+"'), " +&
							string( gi_userid) +", to_date('"+string(today()) +"', '"+ gs_w_date_format+"') )"	
				EXECUTE IMMEDIATE :ls_sql using it_transaction;
			end if
		end if			
	NEXT
	commit using it_transaction;
	disconnect using it_transaction;
	gf_messagebox('m.c_item_label.e_action_upd_price.01','Thông báo','Cập nhật hoàn tất','exclamation','ok',1)
end if

end event

event e_action_print_label();string				ls_QRcode, ls_qr_link, ls_barcode, ls_loc, ls_max_uom, ls_min_uom, ls_vendor, ls_sql, ls_default, ls_name, ls_po_nbr, ls_label_type
string				ls_pur_price, ls_tmp, ls_pur_price_tmp
int					li_rtn, li_label_qty, li_cnt, li_print_cnt, li_insertrow, li_idx
dec				ldc_pur_price, ldc_max_price, ldc_min_price, ldc_po_amt, ldc_pur_price_print, ldc_max_price_print
long				ll_found, ll_row, ll_printJob
date				ld_pur_date, ld_f_date, ld_t_date, ld_exp_date
double			ldb_item_id, ldb_trans_uom, ldb_id, ldb_pl_id
t_ds_db			lds_label, lds_print, lds_print_exp
t_dw_mpl		ldw_label, ldw_main, ldw_label_d
OLEObject		lole_QR


ldw_main = iw_display.f_get_dwmain( )
ldw_main.accepttext( )
ls_qr_link = ldw_main.getitemstring( 1, 'qr_link')
ls_label_type =  ldw_main.getitemstring( 1, 'label_type')

lds_print = create t_ds_db
if ls_label_type = '2' then
	lole_QR = create OLEObject
	li_rtn=lole_QR.ConnectToNewObject("Net.ConnectCode.QRCodeCOMLibrary")		
	if li_rtn<>0 then
		destroy lole_QR
		messagebox ("Error","QRCodeCOMLibrary not available")
	end if	
	lds_print.dataobject = 'ds_label_thm'
elseif ls_label_type = '3' then
	lds_print.dataobject = 'ds_label3_thm'
elseif ls_label_type = '4' then
	lds_print.dataobject = 'ds_label4_thm'
end if
lds_print.Modify("DataWindow.Print.Paper.Size=256") //-- size in milimet --//
lds_print.Modify("DataWindow.Print.CustomPage.Width=106") 
lds_print.Modify("DataWindow.Print.Margin.Top= 0")
lds_print.Modify("DataWindow.Print.Margin.Left= 0")
//lds_print.insertrow( 0)

lds_print_exp = create t_ds_db
lds_print_exp.dataobject = 'ds_label_exp_thm'
lds_print_exp.Modify("DataWindow.Print.Paper.Size=256") //-- size in milimet --//
lds_print_exp.Modify("DataWindow.Print.CustomPage.Width=106") 
lds_print_exp.Modify("DataWindow.Print.Margin.Top= 0")
lds_print_exp.Modify("DataWindow.Print.Margin.Left= 0")

//-- lấy dw_label sort them item--//

ldw_label = iw_display.f_get_dw( 'd_retailed_price_upd_grid')
ldw_label_d = iw_display.f_get_dw( 'd_retailed_price_upd_d_grid')
ldw_label_d.setfilter( '')
ldw_label_d.filter( )
ldw_label_d.setsort( "item_id a, retail_price d")
ldw_label_d.sort( )
	
if ls_label_type = '2' then
	ls_QRcode=lole_QR.Encode_QRCode(ls_qr_link,"L",8)
	destroy lole_QR
end if

//=======================================	//
long ll_place
string ls_setptr, ls_prntr
 
ls_setptr = ProfileString("global.ini",'printer','printer_name','n/a')
if ls_setptr = 'n/a' then
	PrintSetup()
	ls_prntr = PrintGetPrinter( )
	ll_place=pos (ls_prntr, "~t")
	ls_setptr=left(ls_prntr, ll_place -1)	 
	SetProfileString("global.ini",  "printer", "printer_name", ls_setptr)
end if
PrintSetPrinter (ls_setptr)
	
//-----------------------------------------------------------------------//	

if ldw_label_d.rowcount() > 0 then
	connect using it_transaction;
//	ldw_label.setsort( "object_code a, retail_price d")
//	ldw_label.sort( )
	
	//-----------------//
	//Lấy dữ liệu //
	//----------------//	
	
	FOR ll_row = 1 to ldw_label_d.rowcount()	
		ldc_pur_price =  ldw_label_d.getitemnumber( ll_row, 'last_pur_price')
		ldc_pur_price = integer(ldc_pur_price/1000)
		ls_pur_price_tmp = string(ldc_pur_price)
		for li_idx = 1 to len(ls_pur_price_tmp)
			ls_tmp = mid(ls_pur_price_tmp,len(ls_pur_price_tmp) - li_idx +1 , 1)
			ls_pur_price += ls_tmp
		next
		ld_pur_date =  date(ldw_label_d.getitemdatetime( ll_row, 'pur_date'))
		ldc_max_price = ldw_label_d.getitemnumber(ll_row, 'retail_price')
		ls_max_uom =  ldw_label_d.getitemstring( ll_row, 'uom_code')	
		ldc_po_amt = ldw_label_d.getitemnumber( ll_row, 'po_amt')
		ldb_item_id = ldw_label_d.getitemnumber(ll_row, 'item_id')
		ldb_trans_uom =  ldw_label_d.getitemnumber(ll_row, 'trans_uom')
		ls_default =  ldw_label_d.getitemstring( ll_row, 'DFT_PRICE_YN')	
		if isnull(ls_default) then ls_default = 'N'
		ls_po_nbr =  ldw_label_d.getitemstring( ll_row, 'po_nbr')
		//-- lấy giá trị master --//
		ll_found = ldw_label.find("id ="+string(ldb_item_id), 1, ldw_label.rowcount( ))
		if ll_found  > 0 then
			ls_barcode = ldw_label.getitemstring( ll_found, 'object_code')	
			ls_vendor = ldw_label.getitemstring( ll_found, 'vend_name')		
			ls_loc =  ldw_label.getitemstring( ll_found, 'loc')
			ls_name =  ldw_label.getitemstring( ll_row, 'print_name')
			if ls_name = '' or isnull(ls_name) then
				ls_name =  ldw_label.getitemstring( ll_row, 'object_name')	
			end if			
		end if
		
		//-- In tem truoc đo đã gán giá trị --//
		if ll_row > 1 then
			if  ldb_item_id <> ldw_label_d.getitemnumber( ll_row -1, 'item_id')  then
				ld_exp_date = date( lds_print.getitemdatetime( 1, 'exp_date'))
				if  daysafter( today(), ld_exp_date) < 180 then
					if lds_print_exp.rowcount() > 0 then lds_print_exp.reset( )
					lds_print.rowscopy( 1, 1, primary!, lds_print_exp, 1,primary!)
					
					ll_printJob = PrintOpen('print label', false )
					if ls_label_type = '2' then
						FOR li_cnt = 1 to round(li_label_qty/2,0)
							if ldc_pur_price_print > 0 and ldc_max_price_print < ldc_pur_price_print then exit
							PrintDataWindow(ll_printJob, lds_print_exp)
		//					lds_print_exp.print(false, false)
						NEXT				
					elseif ls_label_type = '3' then
						
					elseif ls_label_type = '4' then
					end if
					PrintClose(ll_printJob)
				else
					
					ll_printJob = PrintOpen('print label', false )
					li_print_cnt = integer(li_label_qty/integer(ls_label_type))
					if mod(li_label_qty, integer(ls_label_type)) > 0 then li_print_cnt +=1					

					FOR li_cnt = 1 to li_print_cnt
						if ldc_pur_price_print > 0 and ldc_max_price_print < ldc_pur_price_print then exit
						PrintDataWindow(ll_printJob, lds_print)
	//					lds_print.print(false, false)
					NEXT				

					PrintClose(ll_printJob)
					lds_print.reset( )
				end if
			end if		
		end if
		
		//-- update hiệu lực giá cũ va insert gia moi --//
		ldb_id =  ldw_label_d.getitemnumber( ll_row, 'id')
		if ldb_id > 0 then
			ld_f_date = date(ldw_label_d.getitemdatetime( ll_row, 'f_date_old'))
			ld_t_date = date(ldw_label_d.getitemdatetime( ll_row, 't_date_old'))
			if isnull(ld_f_date) and ld_t_date >= relativeDate( today(), -1) then
				ls_sql = "Update ITEM_PRICE set t_date = to_date('"+string(ld_t_date) +"', '"+ gs_w_date_format+"') WHERE ID= " + string(ldb_id)
				EXECUTE IMMEDIATE :ls_sql using it_transaction;
				//-- insert giá mới --//
				ld_f_date = date(ldw_label_d.getitemdatetime( ll_row, 'f_date'))
				if ldc_max_price > 0 and ld_f_date >= today() then
					ls_sql = "Insert into ITEM_PRICE (id,item_id,TRANS_UOM,retail_price, F_DATE, DFT_PRICE_YN," +& 
								"ITEM_APPLIED_TYPE,PRICE_TYPE,CURRENCY_ID,OBJECT_TYPE, OBJECT_APPLIED_TYPE," +&
								"company_id,branch_id,created_by,created_date,last_mdf_by,last_mdf_date )" + &
								"Values ("+ string(this.f_create_id_ex( it_transaction)) + ", " + string(ldb_item_id) +"," + string(ldb_trans_uom) +"," + string(ldc_max_price) +","+&
								" to_date('"+string(ld_f_date) +"', '"+ gs_w_date_format+"'), '" + ls_default +"' , 'spec', 'SALES', 23933, 'CUSTOMER', 'all', " +&
								string(gi_user_comp_id ) +"," + string( gdb_branch) +"," + string( gi_userid) +", to_date('"+string(today()) +"', '"+ gs_w_date_format+"'), " +&
								string( gi_userid) +", to_date('"+string(today()) +"', '"+ gs_w_date_format+"') )"
					EXECUTE IMMEDIATE :ls_sql using it_transaction;
				end if				
			end if			
		else
			ld_f_date = date(ldw_label_d.getitemdatetime( ll_row, 'f_date'))
			if ldc_max_price > 0 and ld_f_date >= today() then
				ls_sql = "Insert into ITEM_PRICE (id,item_id,TRANS_UOM,retail_price, F_DATE, DFT_PRICE_YN," +& 
							"ITEM_APPLIED_TYPE,PRICE_TYPE,CURRENCY_ID,OBJECT_TYPE, OBJECT_APPLIED_TYPE," +&
							"company_id,branch_id,created_by,created_date,last_mdf_by,last_mdf_date )" + &
							"Values ("+ string(this.f_create_id_ex( it_transaction)) + ", " + string(ldb_item_id) +"," + string(ldb_trans_uom) +"," + string(ldc_max_price) +","+&
							" to_date('"+string(ld_f_date) +"', '"+ gs_w_date_format+"'), '" + ls_default +"' , 'spec', 'SALES', 23933, 'CUSTOMER', 'all', " +&
							string(gi_user_comp_id ) +"," + string( gdb_branch) +"," + string( gi_userid) +", to_date('"+string(today()) +"', '"+ gs_w_date_format+"'), " +&
							string( gi_userid) +", to_date('"+string(today()) +"', '"+ gs_w_date_format+"') )"
				EXECUTE IMMEDIATE :ls_sql using it_transaction;
			end if
		end if
		//-- cập nhật PO_LINE: label_yn --//
		if ls_po_nbr <> '' and not isnull(ls_po_nbr) then
			ldb_pl_id =  ldw_label_d.getitemnumber(ll_row, 'pl_id')
			ls_sql = "Update PUR_INVOICE_LINE set LABEL_PRINTED_YN = 'Y' where ID= " + string(ldb_pl_id)
			EXECUTE IMMEDIATE :ls_sql using it_transaction;
		end if
		//-- cập nhật tên bill --//		
		
		//-- set data and  print label --//
		if ldc_min_price = 0 then setnull(ldc_min_price)
		if ldc_pur_price = 0 then setnull(ldc_pur_price)
		if ldc_po_amt = 0 then setnull(ldc_po_amt)
		if ll_found > 0 then
			li_label_qty =  ldw_label.getitemnumber( ll_found, 'label_qty')
			if isnull(li_label_qty) then li_label_qty = 0
		end if		
		if ls_label_type = '2' then
			if ll_row = 1  then //-- max price --//
				if lds_print.rowcount( ) = 0 then	
					lds_print.insertrow( 0)
				end if
				if  left( ldw_label.getitemstring(ll_found, 'group_code'),3) <> 'HC.' then
					lds_print.setitem( 1, 'qrcode', ls_QRcode)
					lds_print.setitem( 1, 'thm_str', ls_qr_link)	
				end if
				lds_print.setitem( 1, 'barcode', '*'+ls_barcode+'*')
				lds_print.setitem( 1, 'pur_price', string(ldc_pur_price,'###0') )
				lds_print.setitem( 1, 'pur_date',  ld_pur_date )
				lds_print.setitem( 1, 'exp_date',   date(ldw_label_d.getitemdatetime( ll_row, 'expired_date')))
				lds_print.setitem( 1, 'max_price', string(ldc_max_price, '#,##0') )
				lds_print.setitem( 1, 'max_uom', ls_max_uom)
				lds_print.setitem( 1, 'pd_name', ls_name)
				lds_print.setitem( 1, 'vendor', ls_vendor)
				lds_print.setitem( 1, 'po_amt', string(ldc_po_amt, '#,##0'))
				lds_print.setitem( 1, 'loc', ls_loc)			
				ldc_pur_price_print = ldc_pur_price
				if isnull(ldc_pur_price_print) then ldc_pur_price_print = 0
				ldc_max_price_print = ldc_max_price
				if isnull(ldc_max_price_print) then ldc_max_price_print = 0
			elseif ll_row > 1 and ldb_item_id <> ldw_label_d.getitemnumber( ll_row -1, 'item_id') then
				if lds_print.rowcount( ) = 0 then	
					lds_print.insertrow( 0)
				end if				
				if  left( ldw_label.getitemstring(ll_found, 'group_code'),3) <> 'HC.' then
					lds_print.setitem( 1, 'qrcode', ls_QRcode)
					lds_print.setitem( 1, 'thm_str', ls_qr_link)	
				end if
				lds_print.setitem( 1, 'barcode', '*'+ls_barcode+'*')
				lds_print.setitem( 1, 'pur_price', string(ldc_pur_price,'###0') )
				lds_print.setitem( 1, 'pur_date',  ld_pur_date )
				lds_print.setitem( 1, 'exp_date',   date(ldw_label_d.getitemdatetime( ll_row, 'expired_date')))
				lds_print.setitem( 1, 'max_price', string(ldc_max_price, '#,##0') )
				lds_print.setitem( 1, 'max_uom', ls_max_uom)
				lds_print.setitem( 1, 'pd_name', ls_name)
				lds_print.setitem( 1, 'vendor', ls_vendor)
				lds_print.setitem( 1, 'po_amt', string(ldc_po_amt, '#,##0'))
				lds_print.setitem( 1, 'loc', ls_loc)			
				ldc_pur_price_print = ldc_pur_price
				if isnull(ldc_pur_price_print) then ldc_pur_price_print = 0
				ldc_max_price_print = ldc_max_price
				if isnull(ldc_max_price_print) then ldc_max_price_print = 0				
			elseif ll_row > 1 and ldb_item_id = ldw_label_d.getitemnumber( ll_row -1, 'item_id') then  //-- min price --//
				ldc_min_price = ldw_label_d.getitemnumber(ll_row, 'retail_price')
				ls_min_uom =  ldw_label_d.getitemstring( ll_row, 'uom_code')			
				lds_print.setitem( 1, 'min_price', string(ldc_min_price, '#,##0'))
				lds_print.setitem( 1, 'min_uom', ls_min_uom)			
			end if
		elseif ls_label_type = '3' or  ls_label_type = '4' then
			if ll_row = 1 then //-- max price --//	
				if lds_print.rowcount( ) = 0 then
					li_insertrow = lds_print.insertrow( 0)
				else
					li_insertrow = 1
				end if
				lds_print.setitem( li_insertrow, 'barcode', '*'+ls_barcode+'*')
				lds_print.setitem( 1, 'pur_price', ls_pur_price)
				lds_print.setitem( li_insertrow, 'pur_date',  today() )
				lds_print.setitem( li_insertrow, 'max_price', string(ldc_max_price, '#,##0') )
				lds_print.setitem( li_insertrow, 'max_uom', ls_max_uom)
				lds_print.setitem( li_insertrow, 'pd_name', ls_name)
				lds_print.setitem( li_insertrow, 'loc', ls_loc)			
				lds_print.setitem( li_insertrow, 'thm_str', ls_qr_link)	
				lds_print.setitem( li_insertrow, 'vendor', ls_vendor)
				
				ldc_pur_price_print = ldc_pur_price
				if isnull(ldc_pur_price_print) then ldc_pur_price_print = 0
				ldc_max_price_print = ldc_max_price
				if isnull(ldc_max_price_print) then ldc_max_price_print = 0				
			elseif  ll_row > 1 and  ldb_item_id <> ldw_label_d.getitemnumber( ll_row -1, 'item_id') then

				if lds_print.rowcount( ) = 0 then
					li_insertrow = lds_print.insertrow( 0)
				else
					li_insertrow = 1
				end if
				lds_print.setitem( li_insertrow, 'barcode', '*'+ls_barcode+'*')
				lds_print.setitem( 1, 'pur_price', ls_pur_price )
				lds_print.setitem( li_insertrow, 'pur_date',  today() )
				lds_print.setitem( li_insertrow, 'max_price', string(ldc_max_price, '#,##0') )
				lds_print.setitem( li_insertrow, 'max_uom', ls_max_uom)
				lds_print.setitem( li_insertrow, 'pd_name', ls_name)
				lds_print.setitem( li_insertrow, 'loc', ls_loc)			
				lds_print.setitem( li_insertrow, 'thm_str', ls_qr_link)	
				lds_print.setitem( li_insertrow, 'vendor', ls_vendor)
				
				ldc_pur_price_print = ldc_pur_price
				if isnull(ldc_pur_price_print) then ldc_pur_price_print = 0
				ldc_max_price_print = ldc_max_price
				if isnull(ldc_max_price_print) then ldc_max_price_print = 0				

			elseif ll_row > 1 and ldb_item_id = ldw_label_d.getitemnumber( ll_row -1, 'item_id') then  //-- min price --//				
				ldc_min_price = ldw_label_d.getitemnumber(ll_row, 'retail_price')
				ls_min_uom =  ldw_label_d.getitemstring( ll_row, 'uom_code')			

				lds_print.setitem( 1, 'min_price', string(ldc_min_price, '#,##0'))
				lds_print.setitem( 1, 'min_uom', ls_min_uom)	

			end if
		end if
	NEXT
	
	//-----------------//
	// insert data in //
	//----------------//
	commit using it_transaction;
	disconnect using it_transaction;

	
	//-- In tem cuối cùng--//
	if ldw_label_d.rowcount() = 1 or ll_row >= ldw_label_d.rowcount() then	
		/*
//		ld_exp_date = date( lds_print.getitemdatetime( 1, 'exp_date'))
		if  daysafter( today(), ld_exp_date) <= 180 then
			if lds_print_exp.rowcount() > 0 then lds_print_exp.reset( )
			lds_print.rowscopy( 1, 1, primary!, lds_print_exp, 1,primary!)
			
			ll_printJob = PrintOpen('print label', false )
			if ls_label_type = '2' then
				FOR li_cnt = 1 to round(li_label_qty/2,0)
					if ldc_pur_price_print > 0 and ldc_max_price_print < ldc_pur_price_print then exit
					PrintDataWindow(ll_printJob, lds_print_exp)
	
	//				openwithparm(c_w_test,lds_print_exp)
				NEXT					
			else
				if ldc_pur_price_print > 0 and ldc_max_price_print < ldc_pur_price_print then
					//-- ko in--//
				else
					PrintDataWindow(ll_printJob, lds_print)			
				end if				
			end if
			PrintClose(ll_printJob)		
		else */
			
			ll_printJob = PrintOpen('print label', false )
			li_print_cnt = integer(li_label_qty/integer(ls_label_type))
			if mod(li_label_qty, integer(ls_label_type)) > 0 then li_print_cnt +=1		
		
			FOR li_cnt = 1 to li_print_cnt
				if ldc_pur_price_print > 0 and ldc_max_price_print < ldc_pur_price_print then exit 
				PrintDataWindow(ll_printJob, lds_print)

//				openwithparm(c_w_test, lds_print)
			NEXT					
			PrintClose(ll_printJob)	
			lds_print.reset( )
//		end if		
	end if
	gf_messagebox('m.c_item_label.e_action_print_label.01','Thông báo','In hoàn tất','exclamation','ok',1)
end if

destroy lds_print
end event

public subroutine f_set_actionpane ();
//istr_actionpane[2].s_dwo_action = 'd_action_related_object'
//istr_actionpane[2].s_button_name =  'b_so;b_goods_delivery;b_sal_invoice;b_po;b_goods_receipt;b_pur_invoice;'
//istr_actionpane[2].s_objname_handling = this.classname( )
//istr_actionpane[2].s_description = 'Đối tượng liên quan'
//
//istr_actionpane[3].s_dwo_action = 'd_action_manage'
//istr_actionpane[3].s_button_name =  'b_book;b_note;b_doc_trace;b_user_trace;'
//istr_actionpane[3].s_objname_handling = this.classname( )
//istr_actionpane[3].s_description = 'Menu quản lý'
//
end subroutine

public subroutine f_set_dwo_window ();istr_dwo[1].s_dwo_default =  'd_label_search_form'
istr_dwo[1].s_dwo_form = 'd_label_search_form'
istr_dwo[1].s_dwo_grid = ''
istr_dwo[1].b_master = false
istr_dwo[1].b_detail = false
istr_dwo[1].b_cascade_del = false
istr_dwo[1].s_dwo_details = ''
istr_dwo[1].s_dwo_shared = ''
istr_dwo[1].s_dwo_master = ''
istr_dwo[1].s_master_keycol = ''
istr_dwo[1].s_detail_keycol = ''
istr_dwo[1].b_ref_table_yn  = false
istr_dwo[1].s_ref_table_field = ''
istr_dwo[1].b_insert = false
istr_dwo[1].b_update = true
istr_dwo[1].b_delete = false
istr_dwo[1].b_query = true
istr_dwo[1].b_print = true
istr_dwo[1].b_excel = true
istr_dwo[1].b_traceable = true
istr_dwo[1].b_keyboardlocked = false
istr_dwo[1].s_gb_name = 'gb_6'
istr_dwo[1].s_description = 'Chọn SP tạo nhãn'

/*
istr_dwo[2].s_dwo_default =  'd_item_form'
istr_dwo[2].s_dwo_form = 'd_item_form'
istr_dwo[2].s_dwo_grid = ''
istr_dwo[2].b_detail = true
istr_dwo[2].b_master = true
istr_dwo[2].b_cascade_del = true
istr_dwo[2].b_shared = false
istr_dwo[2].s_dwo_master = 'd_objects_item_grid;'
istr_dwo[2].s_dwo_details = 'd_item_purchase_price_grid;d_item_sales_price_grid;d_item_barcode_grid;d_item_catch_grid;d_coupon_serial_grid;'
istr_dwo[2].s_master_keycol = 'ID;'
istr_dwo[2].s_detail_keycol = 'OBJECT_REF_ID;'
istr_dwo[2].b_ref_table_yn  = true
istr_dwo[2].s_ref_table_field = 'OBJECT_REF_TABLE'
istr_dwo[2].b_relation_1_1 = true
istr_dwo[2].b_insert = true
istr_dwo[2].b_update = true
istr_dwo[2].b_delete = true
istr_dwo[2].b_query = true
istr_dwo[2].b_print = true
istr_dwo[2].b_excel = true
istr_dwo[2].b_traceable = true
istr_dwo[2].b_keyboardlocked = true
istr_dwo[2].b_focus_master = true
istr_dwo[2].s_description = 'Thuộc tính sản phẩm'
istr_dwo[2].s_pic_ref_table = ''
istr_dwo[2].s_pic_ref_field = ''
*/
//istr_dwo[3].s_dwo_default =  'd_unit_conversion_grid'
//istr_dwo[3].s_dwo_form = ''
//istr_dwo[3].s_dwo_grid = 'd_unit_conversion_grid'
//istr_dwo[3].b_detail = true
//istr_dwo[3].b_master = false
//istr_dwo[3].b_cascade_del = true
//istr_dwo[3].b_shared = false
//istr_dwo[3].s_dwo_master = 'd_objects_item_grid;'
//istr_dwo[3].s_dwo_details = ''
//istr_dwo[3].s_master_keycol = 'ID;'
//istr_dwo[3].s_detail_keycol = 'item_id;'
//istr_dwo[3].b_ref_table_yn  = false
//istr_dwo[3].s_ref_table_field = ''
//istr_dwo[3].b_relation_1_1 = true
//istr_dwo[3].b_insert = true
//istr_dwo[3].b_update = true
//istr_dwo[3].b_delete = true
//istr_dwo[3].b_query = true
//istr_dwo[3].b_print = true
//istr_dwo[3].b_excel = true
//istr_dwo[3].b_traceable = true
//istr_dwo[3].b_keyboardlocked = true
//istr_dwo[3].b_focus_master = true
//istr_dwo[3].s_description = 'Quy đổi đơn vị'
//istr_dwo[3].s_pic_ref_table = ''
//istr_dwo[3].s_pic_ref_field = ''
//
end subroutine

public subroutine f_set_dwo_related ();istr_dwo_related[1].s_related_obj_name = 'u_so'					// đối tượng copy đến
istr_dwo_related[1].s_main_obj_dwo = 	'd_objects_item_grid'	//datawindow quan hệ main
istr_dwo_related[1].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[1].s_related_obj_dwo =  'd_so_line_grid'	// datawindow quan hệ đến
istr_dwo_related[1].s_related_obj_column = 'item_id'			// cột quan hệ đến
istr_dwo_related[1].s_relatedtext_column = 'code'					
istr_dwo_related[1].s_text = 'Đơn bán hàng của : '
istr_dwo_related[1].s_main_obj_dwo_copy[1] = 'd_objects_item_grid' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[1] =  'ID;code;name;' // cột copy từ
istr_dwo_related[1].s_related_obj_dwo_copy[1] = 'd_so_line_grid' // datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[1] = 'item_ID;object_code;LINE_TEXT;' // cột copy đến

istr_dwo_related[1].s_main_obj_dwo_copy[2] = 'd_item_form' // datawindow copy từ
istr_dwo_related[1].s_main_obj_column_copy[2] =  'stock_uom;uom_code;' // cột copy từ
istr_dwo_related[1].s_related_obj_dwo_copy[2] = 'd_so_line_grid' // datawindow copy đến
istr_dwo_related[1].s_related_obj_column_copy[2] = 'trans_uom;uom_code;' // cột copy đến


istr_dwo_related[1].s_main_obj_column_chk[2] = ''
istr_dwo_related[1].s_related_obj_column_chk[2] = ''
istr_dwo_related[1].s_match_f_dwo[2] = ''
istr_dwo_related[1].s_match_t_dwo[2] = ''
istr_dwo_related[1].s_match_f_column[2] = ''
istr_dwo_related[1].s_match_t_column[2] = ''
istr_dwo_related[1].s_match_column[2] = ''
istr_dwo_related[1].s_main_obj_column_sum[2] = ''
istr_dwo_related[1].s_related_obj_column_sum[2] = ''
istr_dwo_related[1].b_f_sum[2] = false
istr_dwo_related[1].s_f_obj_column_chk[2] = ''
istr_dwo_related[1].s_t_obj_column_chk[2] = ''

istr_dwo_related[2].s_related_obj_name = 'u_po'					// đối tượng copy đến
istr_dwo_related[2].s_main_obj_dwo = 	'd_objects_item_grid'	//datawindow quan hệ main
istr_dwo_related[2].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[2].s_related_obj_dwo =  'd_po_line_grid'	// datawindow quan hệ đến
istr_dwo_related[2].s_related_obj_column = 'item_id'			// cột quan hệ đến
istr_dwo_related[2].s_relatedtext_column = 'code'					
istr_dwo_related[2].s_text = 'Đơn đặt mua của : '
istr_dwo_related[2].s_main_obj_dwo_copy[1] = 'd_objects_item_grid' // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[1] =  'ID;code;name;' // cột copy từ
istr_dwo_related[2].s_related_obj_dwo_copy[1] = 'd_po_line_grid' // datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[1] = 'item_ID;item_code;LINE_TEXT;' // cột copy đến

istr_dwo_related[2].s_main_obj_dwo_copy[2] = 'd_item_form' // datawindow copy từ
istr_dwo_related[2].s_main_obj_column_copy[2] =  'stock_uom;uom_code;' // cột copy từ
istr_dwo_related[2].s_related_obj_dwo_copy[2] = 'd_po_line_grid' // datawindow copy đến
istr_dwo_related[2].s_related_obj_column_copy[2] = 'trans_uom;uom_code;' // cột copy đến

istr_dwo_related[2].s_main_obj_column_chk[2] = ''
istr_dwo_related[2].s_related_obj_column_chk[2] = ''
istr_dwo_related[2].s_match_f_dwo[2] = ''
istr_dwo_related[2].s_match_t_dwo[2] = ''
istr_dwo_related[2].s_match_f_column[2] = ''
istr_dwo_related[2].s_match_t_column[2] = ''
istr_dwo_related[2].s_match_column[2] = ''
istr_dwo_related[2].s_main_obj_column_sum[2] = ''
istr_dwo_related[2].s_related_obj_column_sum[2] = ''
istr_dwo_related[2].b_f_sum[2] = false
istr_dwo_related[2].s_f_obj_column_chk[2] = ''
istr_dwo_related[2].s_t_obj_column_chk[2] = ''

istr_dwo_related[3].s_related_obj_name = 'u_goods_receipt'					// đối tượng copy đến
istr_dwo_related[3].s_main_obj_dwo = 	'd_objects_item_grid'	//datawindow quan hệ main
istr_dwo_related[3].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[3].s_related_obj_dwo =  'd_inventory_line_receipt_grid'	// datawindow quan hệ đến
istr_dwo_related[3].s_related_obj_column = 'item_id'			// cột quan hệ đến
istr_dwo_related[3].s_relatedtext_column = 'code'					
istr_dwo_related[3].s_text = 'Phiếu xuất kho của : '
istr_dwo_related[3].s_main_obj_dwo_copy[1] = 'd_objects_item_grid' // datawindow copy từ
istr_dwo_related[3].s_main_obj_column_copy[1] =  'ID;code;name;' // cột copy từ
istr_dwo_related[3].s_related_obj_dwo_copy[1] = 'd_inventory_line_receipt_grid' // datawindow copy đến
istr_dwo_related[3].s_related_obj_column_copy[1] = 'item_ID;item_code;LINE_TEXT;' // cột copy đến

istr_dwo_related[3].s_main_obj_dwo_copy[2] = 'd_item_form' // datawindow copy từ
istr_dwo_related[3].s_main_obj_column_copy[2] =  'stock_uom;uom_code;' // cột copy từ
istr_dwo_related[3].s_related_obj_dwo_copy[2] = 'd_inventory_line_receipt_grid' // datawindow copy đến
istr_dwo_related[3].s_related_obj_column_copy[2] = 'trans_uom;uom_code;' // cột copy đến

istr_dwo_related[3].s_main_obj_column_chk[2] = ''
istr_dwo_related[3].s_related_obj_column_chk[2] = ''
istr_dwo_related[3].s_match_f_dwo[2] = ''
istr_dwo_related[3].s_match_t_dwo[2] = ''
istr_dwo_related[3].s_match_f_column[2] = ''
istr_dwo_related[3].s_match_t_column[2] = ''
istr_dwo_related[3].s_match_column[2] = ''
istr_dwo_related[3].s_main_obj_column_sum[2] = ''
istr_dwo_related[3].s_related_obj_column_sum[2] = ''
istr_dwo_related[3].b_f_sum[2] = false
istr_dwo_related[3].s_f_obj_column_chk[2] = ''
istr_dwo_related[3].s_t_obj_column_chk[2] = ''

istr_dwo_related[4].s_related_obj_name = 'u_goods_delivery'					// đối tượng copy đến
istr_dwo_related[4].s_main_obj_dwo = 	'd_objects_item_grid'	//datawindow quan hệ main
istr_dwo_related[4].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[4].s_related_obj_dwo =  'd_inventory_line_delivery_grid'	// datawindow quan hệ đến
istr_dwo_related[4].s_related_obj_column = 'item_id'			// cột quan hệ đến
istr_dwo_related[4].s_relatedtext_column = 'code'					
istr_dwo_related[4].s_text = 'Phiếu xuất kho của : '
istr_dwo_related[4].s_main_obj_dwo_copy[1] = 'd_objects_item_grid' // datawindow copy từ
istr_dwo_related[4].s_main_obj_column_copy[1] =  'ID;code;name;' // cột copy từ
istr_dwo_related[4].s_related_obj_dwo_copy[1] = 'd_inventory_line_delivery_grid' // datawindow copy đến
istr_dwo_related[4].s_related_obj_column_copy[1] = 'item_ID;item_code;LINE_TEXT;' // cột copy đến

istr_dwo_related[4].s_main_obj_dwo_copy[2] = 'd_item_form' // datawindow copy từ
istr_dwo_related[4].s_main_obj_column_copy[2] =  'stock_uom;uom_code;' // cột copy từ
istr_dwo_related[4].s_related_obj_dwo_copy[2] = 'd_inventory_line_delivery_grid' // datawindow copy đến
istr_dwo_related[4].s_related_obj_column_copy[2] = 'trans_uom;uom_code;' // cột copy đến

istr_dwo_related[4].s_main_obj_column_chk[2] = ''
istr_dwo_related[4].s_related_obj_column_chk[2] = ''
istr_dwo_related[4].s_match_f_dwo[2] = ''
istr_dwo_related[4].s_match_t_dwo[2] = ''
istr_dwo_related[4].s_match_f_column[2] = ''
istr_dwo_related[4].s_match_t_column[2] = ''
istr_dwo_related[4].s_match_column[2] = ''
istr_dwo_related[4].s_main_obj_column_sum[2] = ''
istr_dwo_related[4].s_related_obj_column_sum[2] = ''
istr_dwo_related[4].b_f_sum[2] = false
istr_dwo_related[4].s_f_obj_column_chk[2] = ''
istr_dwo_related[4].s_t_obj_column_chk[2] = ''

istr_dwo_related[5].s_related_obj_name = 'u_pur_invoice'					// đối tượng copy đến
istr_dwo_related[5].s_main_obj_dwo = 	'd_objects_item_grid'	//datawindow quan hệ main
istr_dwo_related[5].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[5].s_related_obj_dwo =  'd_pur_invoice_line_grid'	// datawindow quan hệ đến
istr_dwo_related[5].s_related_obj_column = 'object_id'			// cột quan hệ đến
istr_dwo_related[5].s_relatedtext_column = 'code'					
istr_dwo_related[5].s_text = 'Hoá đơn mua của : '
istr_dwo_related[5].s_main_obj_dwo_copy[1] = 'd_objects_item_grid' // datawindow copy từ
istr_dwo_related[5].s_main_obj_column_copy[1] =  'ID;code;name;' // cột copy từ
istr_dwo_related[5].s_related_obj_dwo_copy[1] = 'd_pur_invoice_line_grid' // datawindow copy đến
istr_dwo_related[5].s_related_obj_column_copy[1] = 'object_ID;object_code;LINE_TEXT;' // cột copy đến

istr_dwo_related[5].s_main_obj_dwo_copy[2] = 'd_item_form' // datawindow copy từ
istr_dwo_related[5].s_main_obj_column_copy[2] =  'stock_uom;uom_code;' // cột copy từ
istr_dwo_related[5].s_related_obj_dwo_copy[2] = 'd_pur_invoice_line_grid' // datawindow copy đến
istr_dwo_related[5].s_related_obj_column_copy[2] = 'trans_uom;uom_code;' // cột copy đến

istr_dwo_related[5].s_main_obj_column_chk[2] = ''
istr_dwo_related[5].s_related_obj_column_chk[2] = ''
istr_dwo_related[5].s_match_f_dwo[2] = ''
istr_dwo_related[5].s_match_t_dwo[2] = ''
istr_dwo_related[5].s_match_f_column[2] = ''
istr_dwo_related[5].s_match_t_column[2] = ''
istr_dwo_related[5].s_match_column[2] = ''
istr_dwo_related[5].s_main_obj_column_sum[2] = ''
istr_dwo_related[5].s_related_obj_column_sum[2] = ''
istr_dwo_related[5].b_f_sum[2] = false
istr_dwo_related[5].s_f_obj_column_chk[2] = ''
istr_dwo_related[5].s_t_obj_column_chk[2] = ''

istr_dwo_related[6].s_related_obj_name = 'u_sal_invoice'					// đối tượng copy đến
istr_dwo_related[6].s_main_obj_dwo = 	'd_objects_item_grid'	//datawindow quan hệ main
istr_dwo_related[6].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[6].s_related_obj_dwo =  'd_sal_invoice_line_grid'	// datawindow quan hệ đến
istr_dwo_related[6].s_related_obj_column = 'object_id'			// cột quan hệ đến
istr_dwo_related[6].s_relatedtext_column = 'code'					
istr_dwo_related[6].s_text = 'Hóa đơn bán của : '
istr_dwo_related[6].s_main_obj_dwo_copy[1] = 'd_objects_item_grid' // datawindow copy từ
istr_dwo_related[6].s_main_obj_column_copy[1] =  'ID;code;name;' // cột copy từ
istr_dwo_related[6].s_related_obj_dwo_copy[1] = 'd_sal_invoice_line_grid' // datawindow copy đến
istr_dwo_related[6].s_related_obj_column_copy[1] = 'object_ID;object_code;LINE_TEXT;' // cột copy đến

istr_dwo_related[6].s_main_obj_dwo_copy[2] = 'd_item_form' // datawindow copy từ
istr_dwo_related[6].s_main_obj_column_copy[2] =  'stock_uom;uom_code;' // cột copy từ
istr_dwo_related[6].s_related_obj_dwo_copy[2] = 'd_sal_invoice_line_grid' // datawindow copy đến
istr_dwo_related[6].s_related_obj_column_copy[2] = 'trans_uom;uom_code;' // cột copy đến

istr_dwo_related[6].s_main_obj_column_chk[2] = ''
istr_dwo_related[6].s_related_obj_column_chk[2] = ''
istr_dwo_related[6].s_match_f_dwo[2] = ''
istr_dwo_related[6].s_match_t_dwo[2] = ''
istr_dwo_related[6].s_match_f_column[2] = ''
istr_dwo_related[6].s_match_t_column[2] = ''
istr_dwo_related[6].s_match_column[2] = ''
istr_dwo_related[6].s_main_obj_column_sum[2] = ''
istr_dwo_related[6].s_related_obj_column_sum[2] = ''
istr_dwo_related[6].b_f_sum[2] = false
istr_dwo_related[6].s_f_obj_column_chk[2] = ''
istr_dwo_related[6].s_t_obj_column_chk[2] = ''

istr_dwo_related[7].s_related_obj_name = 'u_item'					// đối tượng copy đến
istr_dwo_related[7].s_main_obj_dwo = 	'd_objects_item_grid'	//datawindow quan hệ main
istr_dwo_related[7].s_main_obj_column = 'id'			// cột quan hệ của main
istr_dwo_related[7].s_related_obj_dwo =  'd_objects_item_grid'	// datawindow quan hệ đến
istr_dwo_related[7].s_related_obj_column = 'id'			// cột quan hệ đến
istr_dwo_related[7].s_relatedtext_column = 'code'					
istr_dwo_related[7].s_text = 'Nhân bản khai báo mã hàng : '
istr_dwo_related[7].s_main_obj_dwo_copy[1] = 'd_objects_item_grid' // datawindow copy từ
istr_dwo_related[7].s_main_obj_column_copy[1] =  'short_name;name;active_yn;group_code;group_name;posting_code;posting_name;MANAGE_GROUP;POSTING_GROUP;' // cột copy từ
istr_dwo_related[7].s_related_obj_dwo_copy[1] = 'd_objects_item_grid' // datawindow copy đến
istr_dwo_related[7].s_related_obj_column_copy[1] =   'short_name;name;active_yn;group_code;group_name;posting_code;posting_name;MANAGE_GROUP;POSTING_GROUP;' // cột copy đến
istr_dwo_related[7].s_match_f_dwo[1] = 'd_objects_item_grid'
istr_dwo_related[7].s_match_t_dwo[1] ='d_objects_item_grid'

istr_dwo_related[7].s_main_obj_dwo_copy[2] = 'd_item_form' // datawindow copy từ
istr_dwo_related[7].s_main_obj_column_copy[2] =  'uom_code;uom_name;rounding_code;rounding_name;manufacturers;address;origin;cost_method;'+&
																			'quantity_yn;value_yn;lot_yn;serial_yn;STOCK_UOM;round_id' // cột copy từ
istr_dwo_related[7].s_related_obj_dwo_copy[2] = 'd_item_form' // datawindow copy đến
istr_dwo_related[7].s_related_obj_column_copy[2] =   'uom_code;uom_name;rounding_code;rounding_name;manufacturers;address;origin;cost_method;'+&
																			'quantity_yn;value_yn;lot_yn;serial_yn;STOCK_UOM;round_id'  // cột copy đến
istr_dwo_related[7].s_main_obj_dwo_copy[3] = 'd_item_spec_grid' // datawindow copy từ
istr_dwo_related[7].s_main_obj_column_copy[3] =  'spec_group;code;name;length;width;depth;color;net_weight;gross_weight;tare_weight;density;other_spec;other_desc'
istr_dwo_related[7].s_related_obj_dwo_copy[3] = 'd_item_spec_grid' // datawindow copy đến
istr_dwo_related[7].s_related_obj_column_copy[3] =   'spec_group;code;name;length;width;depth;color;net_weight;gross_weight;tare_weight;density;other_spec;other_desc'

istr_dwo_related[7].s_main_obj_dwo_copy[4] = 'd_item_catch_grid' // datawindow copy từ
istr_dwo_related[7].s_main_obj_column_copy[4] =  'spec_codespec_code;spec_name;catch_code;catch_short_name;catch_name;catch_qty;uom_code;spec_id;item_id;catch_uom'
istr_dwo_related[7].s_related_obj_dwo_copy[4] = 'd_item_catch_grid' // datawindow copy đến
istr_dwo_related[7].s_related_obj_column_copy[4] =   'spec_codespec_code;spec_name;catch_code;catch_short_name;catch_name;catch_qty;uom_code;spec_id;item_id;catch_uom'

istr_dwo_related[7].s_main_obj_column_chk[4] = ''
istr_dwo_related[7].s_related_obj_column_chk[4] = ''
istr_dwo_related[7].s_f_obj_column_chk[4] = ''
istr_dwo_related[7].s_t_obj_column_chk[4] = ''
istr_dwo_related[7].s_match_f_dwo[4] = '' 
istr_dwo_related[7].s_match_t_dwo[4] =''
istr_dwo_related[7].s_match_f_column[4] = ''
istr_dwo_related[7].s_match_t_column[4] = ''
istr_dwo_related[7].s_match_column[4] = ''
istr_dwo_related[7].s_main_obj_column_sum[4] = ''
istr_dwo_related[7].s_related_obj_column_sum[4] = ''
istr_dwo_related[7].b_f_sum[4] = false

istr_dwo_related[8].s_related_obj_name = 'u_unit_conversion'
istr_dwo_related[8].s_main_obj_dwo = 'd_objects_item_grid'
istr_dwo_related[8].s_main_obj_column = 'id'
istr_dwo_related[8].s_related_obj_dwo = 'd_unit_conversion_grid'
istr_dwo_related[8].s_related_obj_column = 'ITEM_ID'
istr_dwo_related[8].s_relatedtext_column = 'code;name'
istr_dwo_related[8].s_text = 'Quy đổi đơn vị của:'

istr_dwo_related[9].s_related_obj_name = 'u_dosage'
istr_dwo_related[9].s_main_obj_dwo = 'd_objects_item_grid'
istr_dwo_related[9].s_main_obj_column = 'id'
istr_dwo_related[9].s_related_obj_dwo = 'd_dosage_product_grid'
istr_dwo_related[9].s_related_obj_column = 'object_ref_id'
istr_dwo_related[9].s_relatedtext_column = 'name'
istr_dwo_related[9].s_text = 'Liều dùng thuốc: '
end subroutine

public function integer f_update_moving_avg (double vdb_item_id, double vdb_moving_avg, ref t_transaction rt_transaction);double			ldb_moving_avg
string				ls_item_code

if isnull(vdb_item_id) or vdb_item_id = 0 then return 0
if isnull(vdb_moving_avg) then vdb_moving_avg = 0


update item set moving_avg = :vdb_moving_avg where object_ref_id = :vdb_item_id using rt_transaction;
if rt_transaction.sqlcode = -1 then
	rollback using rt_transaction;
	ls_item_code = this.f_get_code(vdb_item_id )
	gf_messagebox('m.c_item.f_update_moving_avg.01','Thông báo','Không cập nhật được giá bình quân di động của mặt hàng:@'+ls_item_code,'stop','ok',1)
	return -1
else
	return 1
end if
end function

public function double f_get_moving_avg (double vdb_item_id);double			ldb_moving_avg


if isnull(vdb_item_id) or vdb_item_id = 0 then return -1

select moving_avg into :ldb_moving_avg from item where object_ref_id = :vdb_item_id using sqlca;

if isnull(ldb_moving_avg) then ldb_moving_avg = 0

return ldb_moving_avg
end function

public function integer f_update_round_diff (double vdb_item_id, double vdb_round_diff, ref t_transaction rt_transaction);double			ldb_moving_avg
string				ls_item_code

if isnull(vdb_item_id) or vdb_item_id = 0 then return 0
if isnull(vdb_round_diff) then vdb_round_diff = 0

update item set round_diff = :vdb_round_diff where object_ref_id = :vdb_item_id using rt_transaction;

if rt_transaction.sqlcode = -1 then
	rollback using rt_transaction;
	ls_item_code = this.f_get_code(vdb_item_id )
	gf_messagebox('m.c_item.f_update_round_diff.01','Thông báo','Không cập nhật được chênh lệch làm tròn quy đổi đơn vị của mặt hàng:@'+ls_item_code,'stop','ok',1)
	return -1
else
	return 1
end if
end function

public function double f_get_round_diff (double vdb_item_id);/**********************************************************************************
Chức năng: Lấy số chênh lệch làm tròn khi quy đổi đơn vị giao dịch sang đơn vị tốn kho, khi sửa ghi sồ (UNPOST)
 				 # Chênh lệch =  Số lược thực tế theo SKU chưa làm tròn - SL SKU đã làm tròn 
				 # Chênh lệch âm: thể hiện tồn kho hiện tại > hơn thực tế
				 # Chênh lệch dương: thể hiện tồn kho hiện tại < hơn thực tế
------------------------------------------------------------------------------------------------------------------------------------
Tham số: vdb_item_id: ID của mặt hàng
------------------
Return: số chênh lệch hiện tại của mã hàng.
==============================================================*/
double			ldb_round_diff

if isnull(vdb_item_id) or vdb_item_id = 0 then return 0

select round_diff into :ldb_round_diff from item where object_ref_id = :vdb_item_id using sqlca;

if sqlca.sqlcode = 0 then
	return ldb_round_diff
else
	return 0
end if
end function

public function boolean f_is_managed_qty (double vdb_item_id);boolean			lb_ok
string				ls_qty_yn

setnull(lb_ok)
if isnull(vdb_item_id) or vdb_item_id = 0 then	return lb_ok

select quantity_yn into :ls_qty_yn from item where object_ref_id = :vdb_item_id  using sqlca;

if sqlca.sqlcode = 0 then
	if ls_qty_yn = 'Y' then return true
	return false
else
	gf_messagebox('m.c_item.f_is_managed_qty.01','Thông báo','Lôi Select table:'+sqlca.sqlerrtext,'stop','ok',1)
	return lb_ok
end if


end function

public function integer f_get_lot_or_serial_yn (double vdb_item_id, ref string rs_lot_yn, ref string rs_serial_yn);
select nvl(item.lot_yn,'N'),nvl(item.serial_yn,'N') into :rs_lot_yn,:rs_serial_yn 
from item 
where item.object_ref_id = :vdb_item_id using SQLCA;
if SQLCA.sqlcode = 0 then
	return 1
else
	return -1
end if
end function

public subroutine f_set_dwo_tabpage ();iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model ='1dgb_1dgb'
iastr_dwo_tabpage[1].i_leftpart_width  =1/3
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_default =  'd_retailed_price_upd_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_grid = 'd_retailed_price_upd_grid'
iastr_dwo_tabpage[1].str_dwo[1].b_master = true
iastr_dwo_tabpage[1].str_dwo[1].b_detail = false
iastr_dwo_tabpage[1].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_master = ''
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_details = 'd_retailed_price_upd_d_grid'
iastr_dwo_tabpage[1].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[1].str_dwo[1].s_master_keycol = ''
iastr_dwo_tabpage[1].str_dwo[1].s_detail_keycol = ''
iastr_dwo_tabpage[1].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[1].s_ref_table_field = ''
iastr_dwo_tabpage[1].str_dwo[1].b_insert = false
iastr_dwo_tabpage[1].str_dwo[1].b_update = true
iastr_dwo_tabpage[1].str_dwo[1].b_delete = true
iastr_dwo_tabpage[1].str_dwo[1].b_query = true
iastr_dwo_tabpage[1].str_dwo[1].b_print = true
iastr_dwo_tabpage[1].str_dwo[1].b_excel = true
iastr_dwo_tabpage[1].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[1].b_keyboardlocked = false
iastr_dwo_tabpage[1].str_dwo[1].s_description ='Chi tiết in nhãn'
iastr_dwo_tabpage[1].i_index = 1

iastr_dwo_tabpage[1].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[1].s_display_model ='1dgb_1dgb'
//iastr_dwo_tabpage[1].i_upperpart_height  =730
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_default =  'd_retailed_price_upd_d_grid'
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_form = ''
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_grid = 'd_retailed_price_upd_d_grid'
iastr_dwo_tabpage[1].str_dwo[2].b_master = false
iastr_dwo_tabpage[1].str_dwo[2].b_detail = true
iastr_dwo_tabpage[1].str_dwo[2].b_cascade_del = true
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_master = 'd_retailed_price_upd_grid'
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_details = ''
iastr_dwo_tabpage[1].str_dwo[2].s_dwo_shared = ''
iastr_dwo_tabpage[1].str_dwo[2].s_master_keycol = 'id'
iastr_dwo_tabpage[1].str_dwo[2].s_detail_keycol = 'item_id'
iastr_dwo_tabpage[1].str_dwo[2].b_ref_table_yn  = false
iastr_dwo_tabpage[1].str_dwo[2].s_ref_table_field = ''
iastr_dwo_tabpage[1].str_dwo[2].b_insert = false
iastr_dwo_tabpage[1].str_dwo[2].b_update = true
iastr_dwo_tabpage[1].str_dwo[2].b_delete = true
iastr_dwo_tabpage[1].str_dwo[2].b_query = true
iastr_dwo_tabpage[1].str_dwo[2].b_print = true
iastr_dwo_tabpage[1].str_dwo[2].b_excel = true
iastr_dwo_tabpage[1].str_dwo[2].b_traceable = true
iastr_dwo_tabpage[1].str_dwo[2].b_keyboardlocked = false
iastr_dwo_tabpage[1].str_dwo[2].s_description ='Chi tiết cập nhật giá'
iastr_dwo_tabpage[1].i_index = 1

/*
iastr_dwo_tabpage[2].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[2].s_display_model = '1d'
//iastr_dwo_tabpage[2].i_upperpart_height  =730
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_default =  'd_item_barcode_grid'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_grid = 'd_item_barcode_grid'
iastr_dwo_tabpage[2].str_dwo[1].b_master = false
iastr_dwo_tabpage[2].str_dwo[1].b_detail = true
iastr_dwo_tabpage[2].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_master = 'd_item_form;'
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[2].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[2].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[2].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[2].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[2].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[2].str_dwo[1].b_insert = true
iastr_dwo_tabpage[2].str_dwo[1].b_update = true
iastr_dwo_tabpage[2].str_dwo[1].b_delete = true
iastr_dwo_tabpage[2].str_dwo[1].b_query = true
iastr_dwo_tabpage[2].str_dwo[1].b_print = true
iastr_dwo_tabpage[2].str_dwo[1].b_excel = true
iastr_dwo_tabpage[2].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[2].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[2].str_dwo[1].s_description ='Mã vạch'
iastr_dwo_tabpage[2].i_index = 2

iastr_dwo_tabpage[3].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[3].s_display_model = '1d'
//iastr_dwo_tabpage[3].i_upperpart_height  =730
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_default =  'd_item_catch_grid'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_grid = 'd_item_catch_grid'
iastr_dwo_tabpage[3].str_dwo[1].b_master = false
iastr_dwo_tabpage[3].str_dwo[1].b_detail = true
iastr_dwo_tabpage[3].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_master = 'd_item_form;'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[3].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[3].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[3].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[3].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
iastr_dwo_tabpage[3].str_dwo[1].b_insert = true
iastr_dwo_tabpage[3].str_dwo[1].b_update = true
iastr_dwo_tabpage[3].str_dwo[1].b_delete = true
iastr_dwo_tabpage[3].str_dwo[1].b_query = true
iastr_dwo_tabpage[3].str_dwo[1].b_print = true
iastr_dwo_tabpage[3].str_dwo[1].b_excel = true
iastr_dwo_tabpage[3].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[3].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[3].str_dwo[1].s_description ='Chiết tiết cấu thành'
iastr_dwo_tabpage[3].i_index = 3


iastr_dwo_tabpage[4].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[4].s_display_model = '1d'
iastr_dwo_tabpage[4].i_index = 4
//iastr_dwo_tabpage[4].i_upperpart_height  =730
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_default =  'd_item_link_grid'
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_grid = 'd_item_link_grid'
iastr_dwo_tabpage[4].str_dwo[1].b_master = false
iastr_dwo_tabpage[4].str_dwo[1].b_detail = true
iastr_dwo_tabpage[4].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_master = 'd_objects_item_grid;'
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[4].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[4].str_dwo[1].s_master_keycol = 'ID;'
iastr_dwo_tabpage[4].str_dwo[1].s_detail_keycol = 'object_ref_id;'
iastr_dwo_tabpage[4].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[4].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE'
iastr_dwo_tabpage[4].str_dwo[1].b_insert = true
iastr_dwo_tabpage[4].str_dwo[1].b_update = true
iastr_dwo_tabpage[4].str_dwo[1].b_delete = true
iastr_dwo_tabpage[4].str_dwo[1].b_query = true
iastr_dwo_tabpage[4].str_dwo[1].b_print = true
iastr_dwo_tabpage[4].str_dwo[1].b_excel = true
iastr_dwo_tabpage[4].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[4].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[4].str_dwo[1].s_description ='Tên dùng khác'



iastr_dwo_tabpage[3].s_tp_name = 's_tp_multi'
iastr_dwo_tabpage[3].s_display_model = '1d'
//iastr_dwo_tabpage[3].i_upperpart_height  =730
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_default =  'd_item_sales_price_grid'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_form = ''
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_grid = 'd_item_sales_price_grid'
iastr_dwo_tabpage[3].str_dwo[1].b_master = false
iastr_dwo_tabpage[3].str_dwo[1].b_detail = true
iastr_dwo_tabpage[3].str_dwo[1].b_cascade_del = true
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_master = 'd_item_form;'
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_details = ''
iastr_dwo_tabpage[3].str_dwo[1].s_dwo_shared = ''
iastr_dwo_tabpage[3].str_dwo[1].s_master_keycol = 'OBJECT_REF_ID;'
iastr_dwo_tabpage[3].str_dwo[1].s_detail_keycol = 'ITEM_ID;'
iastr_dwo_tabpage[3].str_dwo[1].b_ref_table_yn  = false
iastr_dwo_tabpage[3].str_dwo[1].s_ref_table_field = ''
iastr_dwo_tabpage[3].str_dwo[1].b_insert = true
iastr_dwo_tabpage[3].str_dwo[1].b_update = true
iastr_dwo_tabpage[3].str_dwo[1].b_delete = true
iastr_dwo_tabpage[3].str_dwo[1].b_query = true
iastr_dwo_tabpage[3].str_dwo[1].b_print = true
iastr_dwo_tabpage[3].str_dwo[1].b_excel = true
iastr_dwo_tabpage[3].str_dwo[1].b_traceable = true
iastr_dwo_tabpage[3].str_dwo[1].b_keyboardlocked = true
iastr_dwo_tabpage[3].str_dwo[1].s_description ='Giá bán'
iastr_dwo_tabpage[3].i_index = 3
*/

//iastr_dwo_tabpage[5].s_tp_name = 's_tp_multi'
//iastr_dwo_tabpage[5].s_display_model = '1d'
////iastr_dwo_tabpage[5].i_upperpart_height  =730
//iastr_dwo_tabpage[5].str_dwo[1].s_dwo_default =  'd_item_discount_price_grid'
//iastr_dwo_tabpage[5].str_dwo[1].s_dwo_form = ''
//iastr_dwo_tabpage[5].str_dwo[1].s_dwo_grid = 'd_item_discount_price_grid'
//iastr_dwo_tabpage[5].str_dwo[1].b_master = false
//iastr_dwo_tabpage[5].str_dwo[1].b_detail = true
//iastr_dwo_tabpage[5].str_dwo[1].b_cascade_del = true
//iastr_dwo_tabpage[5].str_dwo[1].s_dwo_master = 'd_item_form;'
//iastr_dwo_tabpage[5].str_dwo[1].s_dwo_details = ''
//iastr_dwo_tabpage[5].str_dwo[1].s_dwo_shared = ''
//iastr_dwo_tabpage[5].str_dwo[1].s_master_keycol = 'ID;'
//iastr_dwo_tabpage[5].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
//iastr_dwo_tabpage[5].str_dwo[1].b_ref_table_yn  = false
//iastr_dwo_tabpage[5].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE;'
//iastr_dwo_tabpage[5].str_dwo[1].b_insert = true
//iastr_dwo_tabpage[5].str_dwo[1].b_update = true
//iastr_dwo_tabpage[5].str_dwo[1].b_delete = true
//iastr_dwo_tabpage[5].str_dwo[1].b_query = true
//iastr_dwo_tabpage[5].str_dwo[1].b_print = true
//iastr_dwo_tabpage[5].str_dwo[1].b_excel = true
//iastr_dwo_tabpage[5].str_dwo[1].b_traceable = true
//iastr_dwo_tabpage[5].str_dwo[1].b_keyboardlocked = true
//iastr_dwo_tabpage[5].str_dwo[1].s_description ='Chiết khấu'
//iastr_dwo_tabpage[5].i_index = 5



//iastr_dwo_tabpage[6].s_tp_name = 's_tp_multi'
//iastr_dwo_tabpage[6].s_display_model = '1d'
////iastr_dwo_tabpage[6].i_upperpart_height  =730
//iastr_dwo_tabpage[6].str_dwo[1].s_dwo_default =  'd_coupon_serial_grid'
//iastr_dwo_tabpage[6].str_dwo[1].s_dwo_form = ''
//iastr_dwo_tabpage[6].str_dwo[1].s_dwo_grid = 'd_coupon_serial_grid'
//iastr_dwo_tabpage[6].str_dwo[1].b_master = false
//iastr_dwo_tabpage[6].str_dwo[1].b_detail = true
//iastr_dwo_tabpage[6].str_dwo[1].b_cascade_del = true
//iastr_dwo_tabpage[6].str_dwo[1].s_dwo_master = 'd_item_form;'
//iastr_dwo_tabpage[6].str_dwo[1].s_dwo_details = ''
//iastr_dwo_tabpage[6].str_dwo[1].s_dwo_shared = ''
//iastr_dwo_tabpage[6].str_dwo[1].s_master_keycol = 'OBJECT_REF_ID;'
//iastr_dwo_tabpage[6].str_dwo[1].s_detail_keycol = 'OBJECT_REF_ID;'
//iastr_dwo_tabpage[6].str_dwo[1].b_ref_table_yn  = false
//iastr_dwo_tabpage[6].str_dwo[1].s_ref_table_field = 'OBJECT_REF_TABLE'
//iastr_dwo_tabpage[6].str_dwo[1].b_insert = true
//iastr_dwo_tabpage[6].str_dwo[1].b_update = true
//iastr_dwo_tabpage[6].str_dwo[1].b_delete = true
//iastr_dwo_tabpage[6].str_dwo[1].b_query = true
//iastr_dwo_tabpage[6].str_dwo[1].b_print = true
//iastr_dwo_tabpage[6].str_dwo[1].b_excel = true
//iastr_dwo_tabpage[6].str_dwo[1].b_traceable = true
//iastr_dwo_tabpage[6].str_dwo[1].b_keyboardlocked = true
//iastr_dwo_tabpage[6].str_dwo[1].s_description ='Seri thẻ mua hàng'
//iastr_dwo_tabpage[6].i_index = 6
end subroutine

public function integer f_get_retail_price (double vdb_item_id, double vdb_qty, double vdb_object_id, double vdb_currency, string vs_purchase_sales, date vd_trans_date, ref double rdc_price);dec			ldc_price
double		ldb_object_manage_group
string			ls_item_code
int				li_count

//-- kiểm tra biến --
if isnull(vdb_item_id) or vdb_item_id = 0 or isnull(vdb_object_id) or isnull(vdb_currency) or vdb_currency = 0 then
	//gf_messagebox('m.c_item.d_get_retail_price.01','Thông báo','Không có mã hàng để lấy giá','exclamation','ok',1)
	return -1
end if
//if isnull(vdb_object_id)  then
//	//gf_messagebox('m.c_item.d_get_retail_price.02','Thông báo','Không có đối tượng áp lấy giá','exclamation','ok',1)
//	return -1
//end if
//if isnull(vdb_currency) or vdb_currency = 0 then
//	//gf_messagebox('m.c_item.d_get_retail_price.03','Thông báo','Không có loại để lấy giá','exclamation','ok',1)
//	return -1
//end if
//-- lấy giá riêng biệt --//
select count(id) into :li_count
from item_price
where item_id = :vdb_item_id
	 and upper(price_type) = upper(:vs_purchase_sales)
	and currency_id = :vdb_currency
	and ((:vdb_qty between nvl(from_qty,0) and nvl(to_qty,0)) OR (nvl(from_qty,0) = 0 and nvl(to_qty,0) = 0))
	and :vd_trans_date between nvl(f_date,to_date('01011900','ddmmrrrr')) and nvl(t_date,to_date('31123000','ddmmrrrr'))		
	and lower(object_applied_type) = 'spec'
	and applied_object_id = :vdb_object_id using sqlca;
if li_count > 1 then
	gf_messagebox('m.c_item.f_get_retail_price.01','Thông báo','Mã hàng này cài 2 giá cho cùng 1 đối tượng. Vào khai báo hàng hóa để chỉnh lại','exclamation','ok',1)
	rdc_price = 0
	return 0
end if
select retail_price into :ldc_price
from item_price
where item_id = :vdb_item_id
	 and upper(price_type) = upper(:vs_purchase_sales)
	and currency_id = :vdb_currency
	and ((:vdb_qty between nvl(from_qty,0) and nvl(to_qty,0)) OR (nvl(from_qty,0) = 0 and nvl(to_qty,0) = 0))
	and :vd_trans_date between nvl(f_date,to_date('01011900','ddmmrrrr')) and nvl(t_date,to_date('31123000','ddmmrrrr'))		
	and lower(object_applied_type) = 'spec'
	and applied_object_id = :vdb_object_id using sqlca;
if sqlca.sqlcode = 0 then
	rdc_price = ldc_price
elseif sqlca.sqlcode = 100 then
	//-- lấy giá theo nhóm --//
	if this.f_init_object( vdb_object_id) = 1 then
		ldb_object_manage_group = this.ids_attribute.getitemnumber( 1, 'manage_group')
		if isnull(ldb_object_manage_group) then ldb_object_manage_group = 0
		
		select count(id) into :li_count
		from item_price
		where item_id = :vdb_item_id
			 and upper(price_type) = upper(:vs_purchase_sales)
			and currency_id = :vdb_currency
			and ((:vdb_qty between nvl(from_qty,0) and nvl(to_qty,0)) OR (nvl(from_qty,0) = 0 and nvl(to_qty,0) = 0))
			and :vd_trans_date between nvl(f_date,to_date('01011900','ddmmrrrr')) and nvl(t_date,to_date('31123000','ddmmrrrr'))			
			and lower(object_applied_type) = 'group'
			and object_manage_group = :ldb_object_manage_group using sqlca;
		if li_count > 1 then
			gf_messagebox('m.c_item.f_get_retail_price.01','Thông báo','Mã hàng này cài 2 giá cho cùng 1 đối tượng. Vào khai báo hàng hóa để chỉnh lại','exclamation','ok',1)
			rdc_price = 0
			return 0
		end if
		
		select retail_price into :ldc_price
		from item_price
		where item_id = :vdb_item_id
			 and upper(price_type) = upper(:vs_purchase_sales)
			and currency_id = :vdb_currency
			and ((:vdb_qty between nvl(from_qty,0) and nvl(to_qty,0)) OR (nvl(from_qty,0) = 0 and nvl(to_qty,0) = 0))
			and :vd_trans_date between nvl(f_date,to_date('01011900','ddmmrrrr')) and nvl(t_date,to_date('31123000','ddmmrrrr'))			
			and lower(object_applied_type) = 'group'
			and object_manage_group = :ldb_object_manage_group using sqlca;	
			if sqlca.sqlcode = 0 then
				rdc_price = ldc_price
			elseif sqlca.sqlcode = 100 then	
				//-- lấy giá áp dụng tất cả --//
				select count(id) into :li_count
				from item_price
				where item_id = :vdb_item_id
					 and upper(price_type) = upper(:vs_purchase_sales)
					and currency_id = :vdb_currency
					and ((:vdb_qty between nvl(from_qty,0) and nvl(to_qty,0)) OR (nvl(from_qty,0) = 0 and nvl(to_qty,0) = 0))
					and :vd_trans_date between nvl(f_date,to_date('01011900','ddmmrrrr')) and nvl(t_date,to_date('31123000','ddmmrrrr'))
					and lower(object_applied_type) = 'all' using sqlca;	
				if li_count > 1 then
					gf_messagebox('m.c_item.f_get_retail_price.01','Thông báo','Mã hàng này cài 2 giá cho cùng 1 đối tượng. Vào khai báo hàng hóa để chỉnh lại','exclamation','ok',1)
					rdc_price = 0
					return 0
				end if
				select retail_price into :ldc_price
				from item_price
				where item_id = :vdb_item_id
					and upper(price_type) = upper(:vs_purchase_sales)
					and currency_id = :vdb_currency
					and ((:vdb_qty between nvl(from_qty,0) and nvl(to_qty,0)) OR (nvl(from_qty,0) = 0 and nvl(to_qty,0) = 0))
					and :vd_trans_date between nvl(f_date,to_date('01011900','ddmmrrrr')) and nvl(t_date,to_date('31123000','ddmmrrrr'))
					and lower(object_applied_type) = 'all' using sqlca;	
				if sqlca.sqlcode = 0 then
					rdc_price = ldc_price
				end if				
			else
				gf_messagebox('m.c_item.d_get_retail_price.05','Thông báo','Lỗi truy vẫn dữ liệu:@'+ sqlca.sqlerrtext ,'stop','ok',1)
				return -1							
			end if
	end if
else
	gf_messagebox('m.c_item.d_get_retail_price.05','Thông báo','Lỗi truy vẫn dữ liệu:@'+ sqlca.sqlerrtext ,'stop','ok',1)
	return -1									
end if
return 1
end function

public function integer f_get_link_item (double vdb_item_id, ref double vadb_lnk_item[], ref double vadb_lnk_spec[], ref double vadb_lnk_qty[], ref t_transaction rt_transaction);
return this.f_get_link_item( vdb_item_id,0, vadb_lnk_item[], vadb_lnk_spec[], vadb_lnk_qty[], rt_transaction)

end function

public function integer f_get_link_item (double vdb_item_id, double vdb_spec_id, ref double vadb_lnk_item[], ref double vadb_lnk_spec[], ref double vadb_lnk_qty[], ref t_transaction rt_transaction);any				laa_data[]
long				ll_cnt, ll_row
double			ldb_object_ref_id, ldb_item_qty, ldb_catch_qty, ldb_catch_uom, ldb_round_id
t_ds_db			lds_item_link

if isnull(vdb_item_id) or vdb_item_id = 0 then
	gf_messagebox('m.c_item.f_get_link_item.01','Thông báo','ID mã sản phẩm (dịch vụ) la 0 hoặc rỗng','exclamation','ok',1)
	return -1
end if
select id into :ldb_object_ref_id from item where object_ref_id = :vdb_item_id using sqlca;

if sqlca.sqlcode = 100 then 
	gf_messagebox('m.c_item.f_get_link_item.02','Thông báo','Không tìm thấy Mã SP/DV có ID:@'+string(vdb_item_id),'exclamation','ok',1)
	return 0
elseif sqlca.sqlcode = -1 then
	gf_messagebox('m.c_item.f_get_link_item.03','Thông báo','Lõi truy vấn database:@'+ sqlca.sqlerrtext ,'exclamation','ok',1)
	return -1	
end if

lds_item_link = create t_ds_db
lds_item_link.dataobject = 'd_item_catch_grid'
lds_item_link.f_settransobject( sqlca)
laa_data[1] = ldb_object_ref_id
if vdb_spec_id > 0 then laa_data[2] = vdb_spec_id
lds_item_link.f_add_where( 'object_ref_id', laa_data[])

ll_cnt = lds_item_link.retrieve( )
FOR ll_row = 1 to ll_cnt
	vadb_lnk_item[ll_row] = lds_item_link.getitemnumber( ll_row, 'catch_item')
	vadb_lnk_spec[ll_row] = lds_item_link.getitemnumber( ll_row, 'catch_spec')
	ldb_item_qty =  lds_item_link.getitemnumber( ll_row, 'item_qty')
	if isnull(ldb_item_qty) then ldb_item_qty =1
	ldb_catch_qty =  lds_item_link.getitemnumber( ll_row, 'catch_qty')
	if isnull(ldb_catch_qty) then ldb_catch_qty = 0
	ldb_catch_uom =  lds_item_link.getitemnumber( ll_row, 'catch_uom')
	ldb_round_id = this.ic_unit_instance.f_get_round_id( ldb_catch_uom, vadb_lnk_item[ll_row], 'item')
	if ldb_round_id = -1 then return -1
	vadb_lnk_qty[ll_row] = this.ic_unit_instance.f_round( rt_transaction,ldb_round_id , ldb_catch_qty/ldb_item_qty)
NEXT
destroy lds_item_link
return ll_cnt
end function

public function integer f_get_wholesales_price (double vdb_item_id, double vdb_qty, double vdb_currency_id, string vs_purchase_sales, date vd_trans_date, double vdb_customer_id, double vdb_sales_person, ref double rdb_wholesales_price);t_ds_db		lds_sales_price
boolean		lb_cus,lb_staff
double		ldb_staff_group,ldb_staff_id,ldb_customer_id
string			ls_filter,ls_filter_staff,ls_filter_customer
long			ll_retrieve,ll_find_staff,ll_find_customer,ll_idx
any			laa_data[]

//-- lấy nhóm nhân viên --//
select staff.dept_id into :ldb_staff_group
from object join staff on staff.object_ref_id = object.id
				join object obj1 on obj1.id = staff.dept_id
where object.id = :vdb_sales_person using SQLCA;
//-- lấy nhóm khách hàng(chưa lấy) --//
laa_data[1] = vdb_item_id
laa_data[2] = upper(vs_purchase_sales)
laa_data[3] = vdb_currency_id
lds_sales_price = create t_ds_db
lds_sales_price.dataobject = iastr_dwo_tabpage[3].str_dwo[1].s_dwo_default
lds_sales_price.f_settransobject( SQLCA)
lds_sales_price.f_add_where( 'item_id;price_type;currency_id', laa_data)
ll_retrieve = lds_sales_price.retrieve( )
if ll_retrieve = 0 then return 0 //-- không có cài đặt giá bán cho mặt hàng --//
//-- lọc theo khách hàng cụ thể --//
ls_filter = string(vdb_qty) + " between from_qty and to_qty and date('" + string(vd_trans_date) + "') between f_date and t_date "
ls_filter_customer = " and APPLIED_OBJECT_ID = " + string(vdb_customer_id) + " and object_applied_type = "+"'"+"spec"+"'" //+ " and (APPLIED_OBJECT_STAFF = " + string(vdb_sales_person) + " or STAFF_MANAGE_GROUP = " + string(ldb_staff_group) + ")"
lds_sales_price.setfilter( ls_filter + ls_filter_customer)
lds_sales_price.filter( )
if lds_sales_price.rowcount( ) > 0 then
	//-- lấy giá bán theo nhân viên --//
	ll_find_staff = lds_sales_price.find( "APPLIED_OBJECT_STAFF = " + string(vdb_sales_person), 1, lds_sales_price.rowcount( ))
	if ll_find_staff = 0 then
		//-- lấy giá bán theo nhóm nhân viên --//
		ll_find_staff = lds_sales_price.find( "STAFF_MANAGE_GROUP = " + string(ldb_staff_group), 1, lds_sales_price.rowcount( ))
		if ll_find_staff = 0 then
			//-- lấy giá theo tất cả nhân viên--//
			ll_find_staff = lds_sales_price.find( "staff_applied_type = 'all'", 1, lds_sales_price.rowcount( ))
		end if
	end if
	if ll_find_staff > 0 then rdb_wholesales_price = lds_sales_price.getitemnumber( ll_find_staff, 'wholesales_price')
else
	//-- lọc theo nhóm khách hàng --//
	ls_filter_customer = " and object_applied_type = 'group'"
	lds_sales_price.setfilter( ls_filter + ls_filter_customer)
	lds_sales_price.filter( )
	if lds_sales_price.rowcount( ) > 0 then
		//-- chưa xử lý nhóm khách hàng--//
	else
		//-- lọc theo tất cả khách hàng --//
		ls_filter_customer = " and object_applied_type = 'all'"
		lds_sales_price.setfilter( ls_filter + ls_filter_customer)
		lds_sales_price.filter( )
		if lds_sales_price.rowcount( ) > 0 then
			//-- lấy giá bán theo nhân viên --//
			ll_find_staff = lds_sales_price.find( "APPLIED_OBJECT_STAFF = " + string(vdb_sales_person), 1, lds_sales_price.rowcount( ))
			if ll_find_staff = 0 then
				//-- lấy giá bán theo nhóm nhân viên --//
				ll_find_staff = lds_sales_price.find( "STAFF_MANAGE_GROUP = " + string(ldb_staff_group), 1, lds_sales_price.rowcount( ))
				if ll_find_staff = 0 then
					//-- lấy giá theo tất cả nhân viên--//
					ll_find_staff = lds_sales_price.find( "staff_applied_type = 'all'", 1, lds_sales_price.rowcount( ))
				end if
			end if
			if ll_find_staff > 0 then rdb_wholesales_price = lds_sales_price.getitemnumber( ll_find_staff, 'wholesales_price')
		end if
	end if
end if
destroy lds_sales_price
return 0
end function

public function integer f_get_discount (double vdb_item_id, double vdb_qty, double vdb_currency_id, string vs_purchase_sales, date vd_trans_date, double vdb_customer_id, double vdb_sales_person, ref double rdb_discount_amount, ref integer ri_discount_pct);t_ds_db		lds_sales_price
boolean		lb_cus,lb_staff,lb_got_disc
double		ldb_staff_group,ldb_staff_id,ldb_customer_id
string			ls_filter,ls_filter_staff,ls_filter_customer
long			ll_retrieve,ll_find_staff,ll_find_customer,ll_idx,ll_find
any			laa_data[]

//-- lấy nhóm nhân viên --//
select staff.dept_id into :ldb_staff_group
from object join staff on staff.object_ref_id = object.id
				join object obj1 on obj1.id = staff.dept_id
where object.id = :vdb_sales_person using SQLCA;
//-- lấy nhóm khách hàng(chưa lấy) --//
laa_data[1] = vdb_item_id
laa_data[2] = upper(vs_purchase_sales)
laa_data[3] = vdb_currency_id
lds_sales_price = create t_ds_db
lds_sales_price.dataobject = iastr_dwo_tabpage[3].str_dwo[1].s_dwo_default
lds_sales_price.f_settransobject( SQLCA)
lds_sales_price.f_add_where( 'item_id;price_type;currency_id', laa_data)
ll_retrieve = lds_sales_price.retrieve( )
if ll_retrieve = 0 then return 0 //-- không có cài đặt giá bán cho mặt hàng --//
if upper(vs_purchase_sales) = 'SALES' then
	//-- lọc theo khách hàng cụ thể --//
	ls_filter = string(vdb_qty) + " between from_qty and to_qty and date('" + string(vd_trans_date) + "') between f_date and t_date "
	ls_filter_customer = " and APPLIED_OBJECT_ID = " + string(vdb_customer_id) + " and object_applied_type = "+"'"+"spec"+"'" //+ " and (APPLIED_OBJECT_STAFF = " + string(vdb_sales_person) + " or STAFF_MANAGE_GROUP = " + string(ldb_staff_group) + ")"
	lds_sales_price.setfilter( ls_filter + ls_filter_customer)
	lds_sales_price.filter( )
	if lds_sales_price.rowcount( ) > 0 then
		//-- lấy giá bán theo nhân viên --//
		ll_find_staff = lds_sales_price.find( "APPLIED_OBJECT_STAFF = " + string(vdb_sales_person), 1, lds_sales_price.rowcount( ))
		if ll_find_staff = 0 then
			//-- lấy giá bán theo nhóm nhân viên --//
			ll_find_staff = lds_sales_price.find( "STAFF_MANAGE_GROUP = " + string(ldb_staff_group), 1, lds_sales_price.rowcount( ))
			if ll_find_staff = 0 then
				//-- lấy giá theo tất cả nhân viên--//
				ll_find_staff = lds_sales_price.find( "staff_applied_type = 'all'", 1, lds_sales_price.rowcount( ))
			end if
		end if
		if ll_find_staff > 0 then 
			rdb_discount_amount = lds_sales_price.getitemnumber( ll_find_staff, 'discount_amount')
			ri_discount_pct = lds_sales_price.getitemnumber( ll_find_staff, 'discount_pct')
			lb_got_disc = true
		end if
	else
		//-- lọc theo nhóm khách hàng --//
		ls_filter_customer = " and object_applied_type = 'group'"
		lds_sales_price.setfilter( ls_filter + ls_filter_customer)
		lds_sales_price.filter( )
		if lds_sales_price.rowcount( ) > 0 then
			//-- chưa xử lý nhóm khách hàng--//
		else
			//-- lọc theo tất cả khách hàng --//
			ls_filter_customer = " and object_applied_type = 'all'"
			lds_sales_price.setfilter( ls_filter + ls_filter_customer)
			lds_sales_price.filter( )
			if lds_sales_price.rowcount( ) > 0 then
				//-- lấy giá bán theo nhân viên --//
				ll_find_staff = lds_sales_price.find( "APPLIED_OBJECT_STAFF = " + string(vdb_sales_person), 1, lds_sales_price.rowcount( ))
				if ll_find_staff = 0 then
					//-- lấy giá bán theo nhóm nhân viên --//
					ll_find_staff = lds_sales_price.find( "STAFF_MANAGE_GROUP = " + string(ldb_staff_group), 1, lds_sales_price.rowcount( ))
					if ll_find_staff = 0 then
						//-- lấy giá theo tất cả nhân viên--//
						ll_find_staff = lds_sales_price.find( "staff_applied_type = 'all'", 1, lds_sales_price.rowcount( ))
					end if
				end if
				if ll_find_staff > 0 then 
					rdb_discount_amount = lds_sales_price.getitemnumber( ll_find_staff, 'discount_amount')
					ri_discount_pct = lds_sales_price.getitemnumber( ll_find_staff, 'discount_pct')
					lb_got_disc = true
				end if
			end if
		end if
	end if
	//-- lọc không theo giới hạn số lượng và ngày tháng và áp dụng cho tất cả--//
	if not lb_got_disc then
		ls_filter = "if(isnull(from_qty),0,from_qty ) = 0 and if(isnull(to_qty),0,to_qty ) = 0 and if(isnull(f_date),0,if(f_date = date('01/01/1900'),0,1)) = 0 and if(isnull(t_date),0,if(t_date = date('01/01/1900'),0,1)) = 0"
		lds_sales_price.setfilter( ls_filter)
		lds_sales_price.filter( )
		if lds_sales_price.rowcount( ) > 0 then
			ll_find = lds_sales_price.find( "staff_applied_type = 'all' and  object_applied_type = 'all'", 1, lds_sales_price.rowcount( ))
			if ll_find > 0 then
//				rdb_wholesales_price = lds_sales_price.getitemnumber( ll_find, 'wholesales_price')
				rdb_discount_amount = lds_sales_price.getitemnumber( ll_find, 'discount_amount')
				ri_discount_pct = lds_sales_price.getitemnumber( ll_find, 'discount_pct')
				lb_got_disc = true
			end if
		end if
	end if
elseif upper(vs_purchase_sales) = 'PURCHASE' then
end if
destroy lds_sales_price
return 0
end function

public function integer f_caculation_disc (double vdb_sales_price, ref double rdb_discount_amount, ref integer ri_discount_pct, ref double rdb_discount_price);/*
vdb_sales_price 			giá bán 
rdb_discount_amount		tiền chiết khấu
ri_discount_pct				% chiết khấu
rdb_discount_price		giá đã chiết khấu
*/
if vdb_sales_price = 0 then
	
elseif rdb_discount_amount = 0 then
	rdb_discount_price= vdb_sales_price / (1 + (ri_discount_pct/100))
	rdb_discount_amount = vdb_sales_price - rdb_discount_price
elseif ri_discount_pct = 0 then
	rdb_discount_price = vdb_sales_price - rdb_discount_amount
	ri_discount_pct = ((vdb_sales_price/rdb_discount_price) - 1) * 100
end if
return 0
end function

public function integer f_add_label (s_str_data vstr_data, ref t_transaction rt_transaction);int 				li_rtn
long				ll_cnt, ll_row, ll_insertRow, ll_row_max, ll_insertRow_m
dec				ldc_fr_factor, ldc_to_factor, ldc_fr_factor_m, ldc_to_factor_m, ldc_price, ldc_qty, ldc_pur_price, ldc_pur_price_max, ldc_po_amt
any				laa_value[]
double			ldb_item_id
string				ls_vend_name, ls_vend_name_tmp
boolean			lb_master_changed

t_ds_db			lds_label 
t_dw_mpl		ldw_label, ldw_label_detail
c_string			lc_string

lds_label = create t_ds_db
if vstr_data.s_data = 'item_auto' then
	lds_label.dataobject = 'ds_retailed_price_upd_item'
	lds_label.settransobject( rt_Transaction)
	ll_cnt =  lds_label.retrieve(vstr_data.aa_data[1],vstr_data.aa_data[3],vstr_data.aa_data[4] )
elseif vstr_data.s_data = 'item_uom' then
	lds_label.dataobject = 'ds_retailed_price_upd_uom'
	lds_label.settransobject( rt_Transaction)
	ll_cnt =  lds_label.retrieve(vstr_data.aa_data[1],vstr_data.aa_data[2],vstr_data.aa_data[3], vstr_data.aa_data[4] )
elseif vstr_data.s_data = 'pur_auto' then
	lds_label.dataobject = 'ds_retailed_price_upd_pur_inv'	
	laa_value[1] = lc_string.f_globalreplace( vstr_data.as_data[1], ',', ';')
	lds_label.f_add_where( 'line_id', laa_value[])
	lds_label.settransobject( rt_Transaction)
	ll_cnt =  lds_label.retrieve( )
elseif  vstr_data.s_data = 'po_uom' then
	lds_label.dataobject = 'ds_retailed_price_upd_po_uom'
	lds_label.settransobject( rt_Transaction)
	ll_cnt =  lds_label.retrieve(vstr_data.aa_data[1],vstr_data.aa_data[2],vstr_data.aa_data[3], vstr_data.aa_data[4])
	
elseif vstr_data.s_data = 'expired_day' then
	lds_label.dataobject = 'ds_retailed_price_upd_expired'
	lds_label.settransobject( rt_Transaction)
	ll_cnt =  lds_label.retrieve(vstr_data.aa_data[1],vstr_data.aa_data[2],vstr_data.aa_data[3] )
end if

if ll_cnt > 0 then
	ldw_label = iw_display.f_get_dw( 'd_retailed_price_upd_grid')
	ldw_label_detail =  iw_display.f_get_dw( 'd_retailed_price_upd_d_grid')
	if vstr_data.s_data <> 'pur_auto' then
		ll_row_max = lds_label.find("item_id = " + string(vstr_data.aa_data[1]) + " AND trans_uom= "+string(vstr_data.aa_data[2]) , 1, ll_cnt)
		if ll_row_max > 0 then
			ldc_fr_factor_m = lds_label.getitemnumber(ll_row_max, 'FROM_COEFFICIENT' )
			ldc_to_factor_m = lds_label.getitemnumber(ll_row_max, 'TO_COEFFICIENT' )		
			
		end if
	else
		ldc_po_amt = dec(lds_label.Describe("Evaluate('Sum(qty*last_pur_price)', 0)"))
	end if
	FOR ll_row = 1 to ll_cnt
		//--insert master--//
		if ldb_item_id <> lds_label.getitemnumber(ll_row, 'item_id' ) then
			ldb_item_id = lds_label.getitemnumber(ll_row, 'item_id' )
			lb_master_changed = true 
			ll_insertRow_m = ldw_label.insertrow(0)
			if vstr_data.s_data = 'pur_auto' then
				ldw_label.setitem(ll_insertRow_m, 'print_name',  lds_label.getitemstring(ll_row, 'print_name' ) )
			elseif vstr_data.s_data = 'item_auto' then
				ldw_label.setitem(ll_insertRow_m, 'print_name',  vstr_data.aa_data[5])
			end if
			
			ldw_label.setitem(ll_insertRow_m, 'id', ldb_item_id )
			ldw_label.setitem(ll_insertRow_m, 'object_code',  lds_label.getitemstring(ll_row, 'object_code' ) )
			ldw_label.setitem(ll_insertRow_m, 'object_name',  lds_label.getitemstring(ll_row, 'object_short_name' ))		
			ldw_label.setitem(ll_insertRow_m, 'label_qty',  lds_label.getitemnumber(ll_row, 'label_qty' ))			
			ldw_label.setitem(ll_insertRow_m, 'loc',  lds_label.getitemstring(ll_row, 'loc' ))
			ldw_label.scrolltorow( ll_insertRow_m)
		end if
							
		//-- chung cả PO và ITEM --//
		ll_insertRow = ldw_label_detail.insertrow(0)
		ldw_label_detail.setitem(ll_insertRow, 'id', lds_label.getitemnumber(ll_row, 'id' ) )
//		ldw_label.setitem(ll_insertRow, 'object_code',  lds_label.getitemstring(ll_row, 'object_code' ) )
//		ldw_label.setitem(ll_insertRow, 'object_name',  lds_label.getitemstring(ll_row, 'object_name' ))		
		
		ldw_label_detail.setitem(ll_insertRow, 'item_id',  lds_label.getitemnumber(ll_row, 'item_id' ))
		ldw_label_detail.setitem(ll_insertRow, 'trans_uom',  lds_label.getitemnumber(ll_row, 'trans_uom' ))
//		ldw_label_detail.setitem(ll_insertRow, 'loc',  lds_label.getitemstring(ll_row, 'loc' )) //-- get từ ds--//		
		ldw_label_detail.setitem(ll_insertRow, 'pur_date',  lds_label.getitemdatetime(ll_row, 'last_pur_date' )) //-- get từ ds--//
		ldw_label_detail.setitem(ll_insertRow, 'uom_code',  lds_label.getitemstring(ll_row, 'uom_code' ))		
		ldw_label_detail.setitem(ll_insertRow, 'dft_price_yn',  lds_label.getitemstring(ll_row, 'dft_price_yn' ))
//		ldw_label.setitem(ll_insertRow, 'label_qty',  lds_label.getitemnumber(ll_row, 'label_qty' ))
		ldw_label_detail.setitem(ll_insertRow, 'lot_no',  lds_label.getitemstring(ll_row, 'lot_no' ))
//		ldw_label.setitem(ll_insertRow, 'vend_name',  lds_label.getitemstring(ll_row, 'vend_name' ))
		ldw_label_detail.setitem(ll_insertRow, 'expired_date',  lds_label.getitemdatetime(ll_row, 'expired_date' ))
		ldw_label_detail.setitem(ll_insertRow, 'fr_factor',   lds_label.getitemnumber(ll_row, 'FROM_COEFFICIENT' ))
		ldw_label_detail.setitem(ll_insertRow, 'to_factor',   lds_label.getitemnumber(ll_row, 'TO_COEFFICIENT' ))		
		
		ldc_pur_price = lds_label.getitemnumber(ll_row, 'last_pur_price' )
		ls_vend_name_tmp = lds_label.getitemstring(ll_row, 'vend_name' )
		if isnull(ls_vend_name_tmp) then ls_vend_name_tmp =''
		//-- các trường riêng --//
		if left(vstr_data.s_data,4) = 'pur_'  then // -- cap nhất giá PO --//
			//-- set last_pur_price --//			//--insert master--//
			if lb_master_changed or ls_vend_name <> ls_vend_name_tmp then
				ldc_pur_price_max = 0
				ll_row_max = 0
				lb_master_changed = false
				ls_vend_name = lds_label.getitemstring(ll_row, 'vend_name' )
				if isnull(ls_vend_name) then ls_vend_name = ''				
				if ldc_pur_price > 0 then				
					ll_row_max = ll_row
					ldc_pur_price_max = ldc_pur_price
					ldc_fr_factor_m = lds_label.getitemnumber(ll_row_max, 'FROM_COEFFICIENT' )
					ldc_to_factor_m = lds_label.getitemnumber(ll_row_max, 'TO_COEFFICIENT' )		
					ldw_label_detail.setitem(ll_insertRow, 'last_pur_price', ldc_pur_price )
				end if						
			end if
			
			if ll_row <> ll_row_max then
				ldc_fr_factor =  lds_label.getitemnumber(ll_row, 'FROM_COEFFICIENT' )
				if isnull(ldc_fr_factor) or ldc_fr_factor = 0 then ldc_fr_factor = 1
				ldc_to_factor = lds_label.getitemnumber(ll_row, 'TO_COEFFICIENT' )		
				if isnull(ldc_to_factor_m) or ldc_to_factor_m = 0 then ldc_to_factor_m = 1
				ldc_pur_price = round( ldc_pur_price_max *(ldc_fr_factor_m /ldc_to_factor_m) * (ldc_to_factor /ldc_fr_factor),0)
				ldw_label_detail.setitem(ll_insertRow, 'last_pur_price', ldc_pur_price )
			end if  //-- kết thúc set last_pur_price --//
			ldc_price = lds_label.getitemnumber(ll_row, 'retail_price' )
			if ldc_price > 0 then				
				ldw_label_detail.setitem(ll_insertRow, 'profit', round((ldc_price - ldc_pur_price )/ldc_price*100 ,1))
			end if
			ldw_label_detail.setitem(ll_insertRow, 'retail_price', ldc_price )
			ldw_label_detail.setitem(ll_insertRow, 'f_date',   lds_label.getitemdatetime(ll_row, 'f_date' ))
			ldw_label_detail.setitem(ll_insertRow, 'retail_price_old',  lds_label.getitemnumber(ll_row, 'retail_price_old' ))
			ldw_label_detail.setitem(ll_insertRow, 'f_date_old',  lds_label.getitemdatetime(ll_row, 'f_date_old' ))
			ldw_label_detail.setitem(ll_insertRow, 't_date_old',  lds_label.getitemdatetime(ll_row, 't_date_old' ))	
//			ldw_label_detail.setitem(ll_insertRow, 'print_name',   lds_label.getitemstring(ll_row, 'print_name' ) )					
			ldw_label_detail.setitem(ll_insertRow, 'po_amt', ldc_po_amt )
			ldw_label_detail.setitem(ll_insertRow, 'po_nbr',  lds_label.getitemstring(ll_row, 'doc_code' ))
			ldw_label_detail.setitem(ll_insertRow, 'pl_id',  lds_label.getitemnumber(ll_row, 'line_id' ))			

		elseif left(vstr_data.s_data,5) = 'item_'  then  //-- price > 0 --//

			
			if vstr_data.aa_data[6] > 0 then //-- lấy giá user gõ vào --//
				ldc_pur_price_max = vstr_data.aa_data[6]
			end if
			if ll_row_max = ll_row then
				ldc_pur_price = ldc_pur_price_max
			else
				ldc_fr_factor =  lds_label.getitemnumber(ll_row, 'FROM_COEFFICIENT' )
				if isnull(ldc_fr_factor) or ldc_fr_factor = 0 then ldc_fr_factor = 1
				if isnull(ldc_to_factor_m) or ldc_to_factor_m = 0 then ldc_to_factor_m = 1
				ldc_to_factor =  lds_label.getitemnumber(ll_row, 'TO_COEFFICIENT' )				
				ldc_pur_price = round( ldc_pur_price_max *(ldc_fr_factor_m /ldc_to_factor_m) * (ldc_to_factor /ldc_fr_factor),0)
			end if
			ldw_label_detail.setitem(ll_insertRow, 'last_pur_price',  ldc_pur_price )			
			
			if  vstr_data.db_data > 0 then
				ldc_price = vstr_data.db_data
				if lds_label.getitemnumber(ll_row, 'trans_uom' ) = vstr_data.aa_data[2] then
					ldw_label_detail.setitem(ll_insertRow, 'retail_price',  ldc_price )					
				else 
					ldc_price = round( vstr_data.db_data * (ldc_fr_factor_m/ldc_to_factor_m) * (ldc_to_factor/ldc_fr_factor)   , 0) 
					ldw_label_detail.setitem(ll_insertRow, 'retail_price',  ldc_price )						
				end if
				ldw_label_detail.setitem(ll_insertRow, 'f_date',  today())
				if  lds_label.getitemnumber(ll_row, 'id' ) > 0 then
					ldw_label_detail.setitem(ll_insertRow, 'retail_price_old',  lds_label.getitemnumber(ll_row, 'retail_price' ))
					ldw_label_detail.setitem(ll_insertRow, 'f_date_old',  lds_label.getitemdatetime(ll_row, 'f_date' ))
					ldw_label_detail.setitem(ll_insertRow, 't_date_old',  relativeDate(today(), -1)	)		
				end if
//				ldw_label.setitem(ll_insertRow, 'print_name',  vstr_data.aa_data[5])
			else
				ldc_price =  lds_label.getitemnumber(ll_row, 'retail_price' )
				if isnull(ldc_price) then ldc_price = 0
				ldw_label_detail.setitem(ll_insertRow, 'retail_price', ldc_price)
				ldw_label_detail.setitem(ll_insertRow, 'f_date',   lds_label.getitemdatetime(ll_row, 'f_date' ))
				ldw_label_detail.setitem(ll_insertRow, 'retail_price_old',  lds_label.getitemnumber(ll_row, 'retail_price_old' ))
				ldw_label_detail.setitem(ll_insertRow, 'f_date_old',  lds_label.getitemdatetime(ll_row, 'f_date_old' ))
				ldw_label_detail.setitem(ll_insertRow, 't_date_old',  lds_label.getitemdatetime(ll_row, 't_date_old' ))				
				ldw_label_detail.setitem(ll_insertRow, 'profit',  lds_label.getitemnumber(ll_row, 'profit' ))
//				ldw_label.scrolltorow( ll_insertRow)
			end if
			if ldc_pur_price = 0 or isnull(ldc_pur_price)	then 
				ldw_label_detail.setitem(ll_insertRow, 'profit', 100 )
			else
				ldw_label_detail.setitem(ll_insertRow, 'profit', round( (ldc_price - ldc_pur_price )/ldc_pur_price *100,0) )
			end if
		end if		
	NEXT
	
	ldw_label.f_set_gutter_rowcount( )
end if

return ll_cnt

end function

public function integer f_get_data_4_adding (ref s_str_data rstr_data);
string					ls_po_nbr, ls_auto, ls_new
double				ldb_object_id, ldb_uom_id, ldb_price
long					ll_label_qty, ll_fnd
decimal				ldc_profit, ldc_pur_price


t_dw_mpl			ldw_label, ldw_parm

ldw_parm = iw_display.f_get_dw('d_label_search_form')

ldw_parm.accepttext()

ls_auto = ldw_parm.getitemstring(1,'auto_yn') 
if isnull(ls_auto) then ls_auto = 'N'
ls_new =  ldw_parm.getitemstring(1,'new_print_yn') 
if isnull(ls_new) then ls_new = 'N'		
ll_label_qty = ldw_parm.getitemnumber(1, 'qty')
if  isnull(ll_label_qty) then ll_label_qty = 0 
ldc_profit = ldw_parm.getitemnumber(1, 'profit')
if  isnull(ldc_profit) then ldc_profit = 0 
ldb_object_id = ldw_parm.getitemnumber(1, 'item_id')
if ldb_object_id = 0 or isnull(ldb_object_id) then return 0		
ldb_uom_id = ldw_parm.getitemnumber(1, 'uom_id')
if  isnull(ldb_uom_id) then ldb_uom_id = 0 
ldb_price = ldw_parm.getitemnumber(1, 'price') 
if  isnull(ldb_price) then ldb_price = 0 
ldc_pur_price = ldw_parm.getitemnumber(1, 'last_pur_price') 
if  isnull(ldc_pur_price) then ldc_pur_price = 0 
ls_po_nbr = ldw_parm.getitemstring(1,'po_nbr') 		
if not isnull(ls_po_nbr) and ls_po_nbr <> '' then  //-- add PO --//
	//-- kiểm tra đã add chưa? --//
	ldw_label = iw_display.f_get_dw( 'd_retailed_price_upd_grid')
	if ldw_label.rowcount( ) > 0 then
		ll_fnd = ldw_label.find(" po_nbr = '"+ls_po_nbr + "'" , 1 ,  ldw_label.rowcount( ))
		if ll_fnd > 0 then
			ldw_label.scrolltorow( ll_fnd)
			return 0
		end if
	end if //-- kết thức: kiểm tra đã add chưa? --//
	
	//-- lấy thông tin label --//
	rstr_data.db_data = ldb_price
	rstr_data.aa_data[1] = ldb_object_id
	rstr_data.aa_data[2] = ll_label_qty
	rstr_data.aa_data[3] = ldc_profit
	rstr_data.aa_data[4] = ls_new	
	if ls_auto = 'Y' then
		rstr_data.s_data = 'po_auto'
	else
		rstr_data.s_data = 'po_uom'
	end if					
else //-- add từng ITEM --//
	//-- kiểm tra đã add chưa? --//
	ldw_label = iw_display.f_get_dw( 'd_retailed_price_upd_grid')
	if ldw_label.rowcount( ) > 0 then
		ll_fnd = ldw_label.find("id = "+string(ldb_object_id) , 1 ,  ldw_label.rowcount( ))
		if ll_fnd > 0 then
			ldw_label.scrolltorow( ll_fnd)
			return 0
		end if
	end if //-- kết thức: kiểm tra đã add chưa? --//
	
	//-- lấy thông tin label --//
	rstr_data.db_data = ldb_price
	rstr_data.aa_data[1] = ldb_object_id
	rstr_data.aa_data[2] = ldb_uom_id
	rstr_data.aa_data[3] = ll_label_qty
	rstr_data.aa_data[4] = ldc_profit
	rstr_data.aa_data[5] =  ldw_parm.getitemstring(1,'print_name') 
	rstr_data.aa_data[6] =  ldc_pur_price	
	if ls_auto = 'Y' then
		rstr_data.s_data = 'item_auto'
	else
		rstr_data.s_data = 'item_uom'
	end if			
end if
return 1
end function

on c_item_label.create
call super::create
end on

on c_item_label.destroy
call super::destroy
end on

event constructor;call super::constructor;ib_changed_dwo_4edit = false
is_display_model = 'up_1d_lo_tb'
ib_display_text = false
is_object_title = 'In nhãn/ cập nhật giá sản phẩm'
istr_actionpane[1].s_button_name = 'b_add_multi;b_insert;b_modify;b_save;b_query;b_execquery;b_filteron;b_item_barcode;b_refresh;b_delete;b_copyt_multi;b_purchase_multi;b_sales_multi;'
//istr_actionpane[1].s_button_has_sub = 'b_add_multi;'
//istr_actionpane[1].sa_sub_button[1]='b_add;b_copyt_seft;'
//istr_actionpane[1].sa_sub_button[2]='b_copyt_pur_invoice;b_copyt_sal_invoice;'
//istr_actionpane[1].sa_sub_button[3]='b_copyt_po;b_copyt_pur_invoice;'
//istr_actionpane[1].sa_sub_button[4]='b_copyt_so;b_copyt_sal_invoice;'
istr_actionpane[1].sa_enabled_subbutton[] = istr_actionpane[1].sa_sub_button[]
istr_actionpane[1].s_objname_handling = this.classname( )
istr_actionpane[1].s_description = is_object_title

end event

event e_window_open;call super::e_window_open;int						li_cnt
string					ls_new_yn, ls_rtn
t_dw_mpl			ldw_main
datawindowchild	ldwc, ldwc_unit


ldw_main = iw_display.f_get_dwmain()
ldw_main.insertrow(0)
ldw_main.setitem(1, 'new_print_yn','N')
ldw_main.setitem(1, 'auto_yn','Y')
ldw_main.setitem(1, 'label_type','4')
ls_new_yn ='N' // ldw_main.getitemstring( 1, 'new_print_yn')
//if isnull(ls_new_yn) then ls_new_yn = 'N'
//ldw_main.setitem(1, 'qr_link','https://nhathuocthaiminh.vn')
ldw_main.setitem(1, 'qr_link','Nhathuocthaiminh.vn')


// retrieve dddw --//
ldw_main.getchild( 'name', ldwc)
ldwc.settransobject(it_transaction )
ldwc.retrieve(gi_user_comp_id, ls_new_yn ) //-- Kết thúc retrieve dwc: tên hàng --//
ls_rtn = ldw_main.Modify( 'name.dddw.percentwidth= 200')

//-- update item_price --//
select count(v.item_id) into :li_cnt
from v_uom_item v
where v.company_id = :gi_user_comp_id
and (V.TO_COEFFICIENT > 1 or V.FROM_COEFFICIENT = 1 and V.TO_COEFFICIENT = 1)
and not exists (select null from item_price t1 where t1.item_id = v.item_id and t1.trans_uom = V.UOM_ID and t1.company_id = v.company_id  and t1.price_type = 'SALES'  )
using it_transaction;

if li_cnt > 0 then
	insert into item_price( id, item_id, company_id, branch_id, created_by, created_Date, last_mdf_by, last_mdf_date,
                                retail_price, f_Date, currency_id, ITEM_APPLIED_TYPE, OBJECT_APPLIED_TYPE, OBJECT_TYPE,
                                PRICE_TYPE,TRANS_UOM)
	select seq_table_id.nextval, v.item_id, :gi_user_comp_id, :gdb_branch , :gi_userid , sysdate, :gi_userid, sysdate,
                                null, trunc(sysdate) ,23933, 'spec','all','CUSTOMER',
                                'SALES',v.uom_id
             from v_uom_item v
                where v.company_id = :gi_user_comp_id
                and (V.TO_COEFFICIENT > 1 or V.FROM_COEFFICIENT = 1 and V.TO_COEFFICIENT = 1)
                and not exists (select null from item_price t1 where t1.item_id = v.item_id and t1.trans_uom = V.UOM_ID and t1.company_id = v.company_id  and t1.price_type = 'SALES'  )
	using it_transaction;
	commit using it_transaction;
end if


return  1
end event

event e_action_ctrl_bttn;//-- Override --//
datawindow				ldw_focus
int								li_idx

ldw_focus = iw_display.dynamic f_get_idwfocus()

if isvalid(ldw_focus) then
	if not this.ib_copying then
		//-- control d_action_edit --//
		FOR li_idx = 1 to upperbound(istr_actionpane[]) 
			if istr_actionpane[li_idx].s_dwo_action = 'd_action_edit' then
				if ldw_focus.dynamic f_get_ib_shared() then
					ldw_focus = ldw_focus.dynamic f_getdwmaster()
				end if			
				if ldw_focus.dynamic f_get_ib_detail() then
					if ib_changed_dwo_4edit then
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons = 'b_fnd_expired;b_delete;b_print_label;b_upd_price;'
						else
							istr_actionpane[li_idx].s_visible_buttons ='b_fnd_expired;b_delete;b_print_label;b_upd_price;'
						end if
					else
						if ldw_focus.dynamic f_isgrid() then
							istr_actionpane[li_idx].s_visible_buttons =  'b_fnd_expired;b_delete;b_print_label;b_upd_price;'
						else
							istr_actionpane[li_idx].s_visible_buttons =  'b_fnd_expired;b_delete;b_print_label;b_upd_price;'
						end if
					end if
				else				
					if  ib_changed_dwo_4edit then
						istr_actionpane[li_idx].s_visible_buttons= 'b_fnd_expired;b_delete;b_print_label;b_upd_price;'
					else
						istr_actionpane[li_idx].s_visible_buttons='b_fnd_expired;b_delete;b_print_label;b_upd_price;'
					end if
				end if
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_object' then
//				istr_actionpane[li_idx].s_visible_buttons =  'b_so;b_goods_delivery;b_sal_invoice;b_po;b_goods_receipt;b_pur_invoice;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_manage' then	
//				istr_actionpane[li_idx].s_visible_buttons =  'b_book; b_attach; b_note;b_user_trace;'
			elseif  istr_actionpane[li_idx].s_dwo_action = 'd_action_related_report' then			
				
			end if				
		NEXT
	end if
	iw_display.dynamic event e_ctrl_actionbutton()
end if
return 0


//
return 0
end event

event e_window_e_preopen;call super::e_window_e_preopen;//--resize parm --//

iw_display.dynamic f_set_ii_upperpart_height(2/11)

return 0
end event

event e_dw_e_itemfocuschanged;call super::e_dw_e_itemfocuschanged;s_str_data					lstr_data
datawindowchild			ldwc_unit, ldwc

if rpo_dw.dataobject = 'd_label_search_form' then
	if vs_colname = 'unit' then
		ib_input_complete = false
		if rpo_dw.getchild( 'unit', ldwc_unit)  = 1 then
			rpo_dw.dynamic f_retrieve_dwc_ex(vs_colname )
			if ldwc_unit.rowcount( ) > 0 then 
				rpo_dw.setitem( vl_currentrow ,'price',0 )
				rpo_dw.setitem( vl_currentrow ,'unit', ldwc_unit.getitemstring(1 , 'uom_code') )
				rpo_dw.setitem( vl_currentrow, 'old_price', ldwc_unit.getitemnumber( 1 , 'retail_price') )
				rpo_dw.setitem( vl_currentrow, 'last_pur_price', ldwc_unit.getitemnumber( 1, 'last_pur_price') )
				idb_uom_id = ldwc_unit.getitemnumber(1 , 'uom_id')			
				rpo_dw.setitem( vl_currentrow, 'uom_id', idb_uom_id )
				return 0
			else
				rpo_dw.setitem( vl_currentrow ,'price',0 )
				rpo_dw.setitem( vl_currentrow ,'unit','' )
				rpo_dw.setitem( vl_currentrow, 'old_price', 0)
				rpo_dw.setitem( vl_currentrow, 'last_pur_price',0)
				idb_uom_id = 0	
				rpo_dw.setitem( vl_currentrow, 'uom_id', 0 )				
			end if
		end if
	
	//	ib_item_chosen = false
	elseif  vs_colname = 'name'   then	
		if ib_input_complete then
			ib_input_complete = false
			rpo_dw.accepttext()		
			if this.f_get_data_4_adding( lstr_data) = 0 then return 0
			//-- thực hiện add label --//
			connect using it_transaction;
			this.f_add_label(lstr_data, it_transaction)
			disconnect using it_transaction;		
			rpo_dw.setitem( vl_currentrow ,'price',0 )
			rpo_dw.setitem( vl_currentrow ,'unit','' )
			rpo_dw.setitem( vl_currentrow, 'old_price', 0)
			rpo_dw.setitem( vl_currentrow, 'last_pur_price',0)
			rpo_dw.setitem( vl_currentrow, 'profit',0)
			idb_uom_id = 0	
			rpo_dw.setitem( vl_currentrow, 'uom_id', 0 )				
		end if
		rpo_dw.getchild( 'name', ldwc)
		ldwc.setfilter( '')
		ldwc.filter( )
		rpo_dw.dynamic keybd_event( 115,0,0,0 )
	elseif vs_colname = 'price'   then
		if rpo_dw.getitemnumber(vl_currentrow, 'qty') > 0 then
			ib_input_complete = true
		end if
	else
		ib_input_complete = false
	end if
end if
end event

event e_dw_e_itemchanged;call super::e_dw_e_itemchanged;decimal						ldc_price, ldc_last_pur, ldc_profit, ldc_old_price , ldc_fr_factor_max, ldc_to_factor_max, ldc_fr_factor, ldc_to_factor, ldc_pur_price
string							ls_obj_name, ls_obj_type, ls_obj_code
date							ld_f_date, ld_t_date
double						ldb_price_id, ldb_item_id
int								li_label_qty, li_row
datawindowchild 			ldwc, ldwc_unit

//ib_input_complete = false

if rpo_dw.dataobject = 'd_label_search_form' then
	if vs_colname = 'name' then
		if rpo_dw.getchild( 'name', ldwc)  = 1 then
			if ldwc.getrow( ) > 0 then						
				ls_obj_name = ldwc.getitemstring(ldwc.getrow( ), 'object_name')
				ls_obj_type =  ldwc.getitemstring(ldwc.getrow( ), 'object_ref_table')
				ls_obj_code =  ldwc.getitemstring(ldwc.getrow( ), 'object_code')
				//-- Nếu là hàng hóa --//
				if lower(ls_obj_type) = 'item' then
					idb_object_id = ldwc.getitemnumber(ldwc.getrow( ), 'object_id')	
					rpo_dw.setitem( 1, 'item_id', idb_object_id)
					rpo_dw.setitem( 1, 'print_name', ldwc.getitemstring(ldwc.getrow( ), 'print_name'))
					rpo_dw.setitem( 1, 'unit',  ldwc.getitemstring(ldwc.getrow( ), 'uom_code')	)
					rpo_dw.setitem( 1, 'old_price',  ldwc.getitemnumber(ldwc.getrow( ), 'retail_price')	)
					rpo_dw.setitem( 1, 'uom_id',  ldwc.getitemnumber(ldwc.getrow( ), 'uom_id')	)
					idb_uom_id = ldwc.getitemnumber(ldwc.getrow( ), 'uom_id')	
				//-- Nếu là khách hàng --//
				elseif lower(ls_obj_type) = 'vendor' then
					idb_object_id= ldwc.getitemnumber(ldwc.getrow( ), 'object_id')
					rpo_dw.setitem( 1, 'item_id', idb_object_id)
					ls_obj_code =  ldwc.getitemstring(ldwc.getrow( ), 'object_code')
					rpo_dw.setitem( 1, 'po_nbr', ls_obj_code)					
				end if				
			else //-- dwc = 0 //
				idb_object_id = 0
				ldwc.setfilter( '')
				ldwc.filter( )						
				return 1 //-- gõ tên hàng chưa đúng --//
			end if
		end if
	elseif vs_colname = 'unit' then	
		if rpo_dw.getchild( 'unit', ldwc_unit)  = 1 then
			if ldwc_unit.getrow( ) > 0 then
				idb_uom_id = ldwc_unit.getitemnumber( ldwc_unit.getrow( ), 'uom_id')
				ldc_price = ldwc_unit.getitemnumber( ldwc_unit.getrow( ), 'retail_price')	
				rpo_dw.setitem( 1, 'old_price', ldc_price)
				rpo_dw.setitem( 1, 'last_pur_price', ldwc_unit.getitemnumber( ldwc_unit.getrow( ), 'last_pur_price')	)
			end if
		end if
	elseif vs_colname = 'profit' then	
		ldc_last_pur = rpo_dw.getitemnumber(1, 'last_pur_price')
		if isnull(ldc_last_pur) then ldc_last_pur = 0
		rpo_dw.setitem( 1, 'price', round(ldc_last_pur + ldc_last_pur*dec(vs_editdata )/100 , 0) )
	elseif vs_colname = 'price' then	
		ldc_last_pur = rpo_dw.getitemnumber(1, 'last_pur_price')
		if isnull(ldc_last_pur) or ldc_last_pur = 0  then ldc_last_pur = 1
		rpo_dw.setitem( 1, 'profit', round( (dec(vs_editdata ) - ldc_last_pur)/ ldc_last_pur*100 , 0) )
	elseif  vs_colname = 'last_pur_price' then	
		ldc_price = rpo_dw.getitemnumber(1, 'price')
		if isnull(ldc_price) or ldc_price = 0 then
			ldc_profit = rpo_dw.getitemnumber(1, 'profit')
			if ldc_profit > 0 then //-- cập nhật price --//
				rpo_dw.setitem( 1, 'price', round(dec(vs_editdata ) + dec(vs_editdata )*ldc_profit/100 , 0) )
			end if
		else
			//-- cập nhật profit --//
			rpo_dw.setitem( 1, 'profit', round( (ldc_price - dec(vs_editdata ))/ dec(vs_editdata )*100 , 0) )
		end if
	elseif vs_colname = 'new_print_yn' then	
		// retrieve dddw --//
		rpo_dw.getchild( 'name', ldwc)
		connect using it_transaction;
		ldwc.settransobject(it_transaction )
		ldwc.retrieve(gi_user_comp_id, gdb_branch,  vs_editdata  ) //-- Kết thúc retrieve dwc: tên hàng --//						
		disconnect using it_transaction;
	elseif  vs_colname = 'qty' then	
		if dec(vs_editdata) > 0 then
			ib_input_complete = true
		else
			ib_input_complete = false
		end if
	end if
elseif rpo_dw.dataobject = 'd_retailed_price_upd_d_grid' then
	if vs_colname = 'profit' then	
		ldc_profit = dec(vs_editdata)
		ldb_item_id = rpo_dw.getitemnumber(vl_currentrow, 'item_id')		
		li_row = rpo_dw.find(" item_id = " + string(ldb_item_id) ,1, rpo_dw.rowcount() )
		DO while li_row > 0 
			ldc_last_pur = rpo_dw.getitemnumber(li_row , 'last_pur_price')
			if isnull(ldc_last_pur) then ldc_last_pur = 0
			ldc_price = round(ldc_last_pur + ldc_last_pur*ldc_profit/100, 0) 
			rpo_dw.setitem(li_row, 'retail_price', ldc_price)
			rpo_dw.setitem(li_row, 'profit', ldc_profit)
			ldc_old_price = rpo_dw.getitemnumber(li_row, 'retail_price_old')
			if isnull(ldc_old_price) then ldc_old_price = 0
			if ldc_price <> ldc_old_price then
				rpo_dw.setitem( li_row, 'f_date', today() )			
				ldb_price_id = rpo_dw.getitemnumber(li_row, 'id')
				if ldb_price_id > 0 then								
					setnull(ld_f_date)
					rpo_dw.setitem( li_row, 'f_date_old', ld_f_date )
					rpo_dw.setitem( li_row, 't_date_old', relativeDate( today(), -1) )		
				end if
			end if
			li_row = rpo_dw.find(" item_id = " + string(ldb_item_id) ,li_row + 1, rpo_dw.rowcount()+1 )
		LOOP
	elseif vs_colname = 'retail_price' then	
		ldc_last_pur = rpo_dw.getitemnumber(vl_currentrow, 'last_pur_price')
		if isnull(ldc_last_pur) OR ldc_last_pur = 0	 then
			rpo_dw.setitem( vl_currentrow, 'profit', 100 )
		ELSE
			rpo_dw.setitem( vl_currentrow, 'profit', round( ((dec(vs_editdata ) - ldc_last_pur)/ ldc_last_pur)*100 , 1) )
		end if
		ldc_old_price = rpo_dw.getitemnumber(vl_currentrow, 'retail_price_old')
		if isnull(ldc_old_price) then ldc_old_price = 0
		if dec(vs_editdata ) <> ldc_old_price then
			rpo_dw.setitem( vl_currentrow, 'f_date', today() )
			ldb_price_id = rpo_dw.getitemnumber(vl_currentrow, 'id')
			if ldb_price_id > 0 then															
				setnull(ld_f_date)
				rpo_dw.setitem( vl_currentrow, 'f_date_old', ld_f_date )
				rpo_dw.setitem( vl_currentrow, 't_date_old',  relativeDate( today(), -1)  )						
			end if
		end if
	elseif vs_colname = 'last_pur_price' then			
		ldc_last_pur = dec(vs_editdata)
		ldb_item_id = rpo_dw.getitemnumber(vl_currentrow, 'item_id')		
		ldc_profit = rpo_dw.getitemnumber(vl_currentrow, 'profit')
		ldc_fr_factor_max = rpo_dw.getitemnumber(vl_currentrow, 'fr_factor')
		ldc_to_factor_max = rpo_dw.getitemnumber(vl_currentrow, 'to_factor')		
		if isnull(ldc_to_factor_max) or ldc_to_factor_max = 0 then ldc_to_factor_max =1		
		li_row = rpo_dw.find(" item_id = " + string(ldb_item_id) ,1, rpo_dw.rowcount() )
		DO while li_row > 0 
			if li_row = vl_currentrow then
				ldc_price = round( ldc_last_pur + ldc_last_pur* ldc_profit/100 , 0)
			else
				ldc_profit = rpo_dw.getitemnumber(li_row, 'profit')
				ldc_fr_factor = rpo_dw.getitemnumber(li_row, 'fr_factor')
				if isnull(ldc_fr_factor) or ldc_fr_factor = 0 then ldc_fr_factor =1
				ldc_to_factor = rpo_dw.getitemnumber(li_row, 'to_factor')
				ldc_pur_price = round(ldc_last_pur * (ldc_fr_factor_max/ldc_to_factor_max) * (ldc_to_factor/ldc_fr_factor) ,0)
				ldc_price = round( ldc_pur_price + ldc_pur_price* ldc_profit/100 , 0)			
				rpo_dw.setitem( li_row, 'last_pur_price', ldc_pur_price )
			end if
			rpo_dw.setitem( li_row, 'retail_price', ldc_price )
			li_row = rpo_dw.find(" item_id = " + string(ldb_item_id) ,li_row + 1, rpo_dw.rowcount() + 1)
		LOOP							
	end if
elseif rpo_dw.dataobject = 'd_retailed_price_upd_grid' then
	
end if
return 0
end event

event e_dw_dwnkey;call super::e_dw_dwnkey;
if v_keycode = keyEnter! then
	if rpo_dw.getcolumnname( ) = 'price' then
		rpo_dw.setcolumn('name')
		return 2
	else		
		Send(Handle(this),256,9,Long(0,0))
		RETURN 1
	end if
elseif  v_keycode= keytab! and v_keyflags = 1 then
elseif v_keycode= keytab! then
	if rpo_dw.getcolumnname( ) = 'price' then
		rpo_dw.setcolumn('name')
		return 2
	end if
end if
end event

event e_dw_clicked;call super::e_dw_clicked;string					ls_po_nbr, ls_auto, ls_new
double				ldb_object_id, ldb_uom_id, ldb_price
long					ll_label_qty, ll_fnd
decimal				ldc_profit

s_str_data			lstr_data
t_dw_mpl			ldw_label

if rdw_handling.dataobject = 'd_label_search_form' then
	rdw_handling.accepttext()
	if vs_colname = 't_add' then
		if this.f_get_data_4_adding( lstr_data) = 0 then return 0
		//-- thực hiện add label --//
		connect using it_transaction;
		this.f_add_label(lstr_data, it_transaction)
		disconnect using it_transaction;		
	end if
end if
return 0
end event

event e_dw_e_predelete;call super::e_dw_e_predelete;
if rpo_dw.dataobject = 'd_retailed_price_upd_grid' or rpo_dw.dataobject = 'd_retailed_price_upd_d_grid'  then
	return 2
end if
end event

event e_window_e_change_object;call super::e_window_e_change_object;s_str_data			ls_str_data

if istr_data_related[1].s_main_obj_dwo = 'd_pur_invoice_line_grid' then
	if upperbound(istr_data_related[1].s_data[]) > 0 then
		ls_str_data.s_data = 'pur_auto'
		ls_str_data.as_data[] = istr_data_related[1].s_data[]
		connect using it_transaction ;
		this.f_add_label( ls_str_data, it_transaction)
		disconnect using it_transaction ;
	end if
end if

return 1
end event

