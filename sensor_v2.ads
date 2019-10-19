
package Sensor_v2 is

    type travel_time_us is new Integer;

    travel_time_stop : travel_time_us := 100;

    function read return travel_time_us;



end Sensor_v2;
