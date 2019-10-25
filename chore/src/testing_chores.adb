with Ada.Text_IO;


package body testing_chores is

    function print_sensor return Integer is
    begin

	Ada.Text_IO.Put_Line("SENSOR READING");
	return 1;
	
    end print_sensor;
   
    
    function print_accelerometer  return Integer is
    begin

	Ada.Text_IO.Put_Line("ACCELEROMETER READING");
	return 2;
    
    end print_accelerometer;


    function print_nav  return Integer is
    begin

	Ada.Text_IO.Put_Line("DRIVING");
	return 3;
    
    end print_nav;

    function rts return Integer is
    begin
	return 4;
    end rts;


end testing_chores;
