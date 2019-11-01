with Ada.Text_IO;

package body external_package is


    function print_sensor (Deadline : Integer) return Integer is
    begin
	
	while 0 < Deadline loop	    
	    Ada.Text_IO.Put_Line("SENSOR READING");
	    return 1;
	end loop;
	
	Ada.Text_IO.Put_Line("MISSED DEADLINE - SENSOR");
	return -1;
	
    end print_sensor;
   
    
    function print_accelerometer (Deadline : Integer) return Integer is
    begin

	while 0 < Deadline loop
	    Ada.Text_IO.Put_Line("ACCELEROMETER READING");
	    return 1;
	end loop;
	
	Ada.Text_IO.Put_Line("MISSED DEADLINE - ACCELEROMETER");
	return -1;

    end print_accelerometer;


    function print_nav (Deadline : Integer) return Integer is
    begin

	while 0 < Deadline loop
	    Ada.Text_IO.Put_Line("DRIVING");
	    return 1;
	end loop;
	
	Ada.Text_IO.Put_Line("MISSED DEADLINE - DRIVING");
	return -1;

    end print_nav;
    

end external_package;
