with Ada.Text_IO;


package body testing_chores is

    procedure print_sensor is
    begin

	Ada.Text_IO.Put_Line("SENSOR READING");
	
    end print_sensor;
   
    
    procedure print_accelerometer is
    begin

	Ada.Text_IO.Put_Line("ACCELEROMETER READING");
    
    end print_accelerometer;


    procedure print_nav is
    begin

	Ada.Text_IO.Put_Line("DRIVING");
    
    end print_nav;


end testing_chores;
