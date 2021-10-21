$PBExportHeader$c_file.sru
$PBExportComments$Quản lý file
forward
global type c_file from nonvisualobject
end type
end forward

global type c_file from nonvisualobject autoinstantiate
end type

type variables
/*nvo_file's instance variables*/
PUBLIC PRIVATEWRITE String is_path, is_folder, is_filename
PUBLIC PRIVATEWRITE Boolean ib_set
PRIVATE OLEObject obj_shell

end variables

forward prototypes
public function boolean f_file_exists (string as_path)
public function boolean f_text_isnull (string as_test)
public function datetime f_getdetailof (string as_path)
end prototypes

public function boolean f_file_exists (string as_path);/*nvo_file.of_set_file( String as_path ) returns Boolean*/
IF FileExists( as_path ) THEN
  is_path = as_path
  is_folder = Left( is_path, LastPos( is_path, '\' ) )
  is_filename = Mid( is_path, LastPos( is_path, '\' ) + 1 )
  ib_set = TRUE
ELSE
  is_path = ''
  is_folder = ''
  is_filename = ''
  ib_set = FALSE
END IF

RETURN ib_set
end function

public function boolean f_text_isnull (string as_test);/*is_blank -- returns boolean -- argument: as_test*/
IF IsNull( as_test ) THEN RETURN TRUE
IF as_test = '' THEN RETURN TRUE

RETURN FALSE

end function

public function datetime f_getdetailof (string as_path);/*nvo_file.of_get_creation_date( ) returns DateTime*/
String ls_datetime, ls_time
DateTime ldt_file
Date ld_date
OLEObject obj_folder, obj_item


/*nvo_file.of_set_file( String as_path ) returns Boolean*/
IF FileExists( as_path ) THEN
  is_path = as_path
  is_folder = Left( is_path, LastPos( is_path, '\' ) )
  is_filename = Mid( is_path, LastPos( is_path, '\' ) + 1 )
  ib_set = TRUE
ELSE
  is_path = ''
  is_folder = ''
  is_filename = ''
  ib_set = FALSE
END IF

//first off, make sure the path is set to a valid file...
IF ib_set THEN
  obj_folder = obj_shell.NameSpace( is_folder ) //folder
  obj_item = obj_folder.ParseName( is_filename ) //file

  ls_datetime = obj_folder.GetDetailsOf( obj_item, 3 )
  //the date can be ripped directly out of the string
  ld_date = Date( ls_datetime )
  //time cannot be ripped directly out of the string
  //a blank space is the separator from the date & time
  ls_time = Mid( ls_datetime, Pos( ls_datetime, ' ' ) + 1 )
  
  //combine the two...
  ldt_file = DateTime( ld_date, Time( ls_time ) )
END IF

//clear up memory
DESTROY obj_folder
DESTROY obj_item

RETURN ldt_file
end function

on c_file.create
call super::create
TriggerEvent( this, "constructor" )
end on

on c_file.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;/*nvo_file constructor event*/
obj_shell = CREATE OLEObject
obj_shell.ConnectToNewObject( 'shell.application' )
end event

event destructor;/*nvo_file destructor event*/
DESTROY obj_shell
end event

