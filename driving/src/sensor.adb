with MicroBit.IOs; use MicroBit.IOs;
with MicroBit.Time;


package body Sensor is

    --  PINS

    sensor_TRIG: constant Pin_Id := 0;  -- Output Pin
    sensor_ECHO: constant Pin_Id := 1;  -- Input Pin

    -- VARS
    
    duration_echo_us: travel_time_us; -- Duration of the pulse from ECHO pin measured in MicroSeconds


    function read return travel_time_us is
    begin
	duration_echo_us := 0;

	MicroBit.IOs.Set(sensor_TRIG, False);
	MicroBit.Time.Delay_Ms(10);

	MicroBit.IOs.Set(sensor_TRIG, True);
	MicroBit.Time.HAL_Delay.Delay_Microseconds(10);
	MicroBit.IOs.Set(sensor_TRIG, False);

	outerloop:
	loop

	    if MicroBit.IOs.Set(sensor_ECHO) then

		innerloop:
		loop
		    MicroBit.Time.HAL_Delay.Delay_Microseconds(1);
		    if MicroBit.IOs.Set(sensor_ECHO) then
			duration_echo_us := duration_echo_us + 1;
		    else
			return duration_echo_us;
		    end if;
		end loop innerloop;
		
	    end if;
	    
	end loop outerloop;

    end read;
   
   
end Sensor;
