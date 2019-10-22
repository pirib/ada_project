
package Sensor is

    type travel_time_us is new Integer;
    
    travel_time_stop : travel_time_us := 15; 

    function read return Integer; 
    
end Sensor;
