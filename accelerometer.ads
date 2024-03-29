package Accelerometer is
     
   

    type acc_data is range -2 ** 9 .. 2 ** 9 - 1;
    
   
   -- used to stop the car when it is picked up
   tilt_max_y: constant acc_data := -100;  -- old working value -220 or 200
   tilt_min_y: constant acc_data := -300;  -- old working value -260 or 300
   
   
    procedure use_display;

    function get_x return acc_data;
    function get_y return acc_data;
    function get_z return acc_data;

end Accelerometer;

--pragma
