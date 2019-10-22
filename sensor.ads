
package Sensor is

    type travel_time_us is new Integer;
   
    travel_time_stop : travel_time_us := 1; 
   
    function read return travel_time_us; 
   
   
   
end Sensor;
