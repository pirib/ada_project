with MicroBit.IOs; use MicroBit.IOs;
with MicroBit.Time;


package body Sensor is

    --  PINS

   -- just playing here  copy Suri
  
    sensor_TRIG_pin: constant Pin_Id := 4;  -- sending the sensor
    sensor_ECHO_pin: constant Pin_Id := 3;  -- receiving from the sensor

    -- VARS
    duration_echo_us: travel_time_us; -- Duration of the pulse from ECHO pin measured in MicroSeconds


    function read return travel_time_us is
    begin
	duration_echo_us := 10;

	MicroBit.IOs.Set(sensor_TRIG_pin, False);
	MicroBit.Time.Delay_Ms(100);

	MicroBit.IOs.Set(sensor_TRIG_pin, True);
	MicroBit.Time.HAL_Delay.Delay_Microseconds(10);
        MicroBit.IOs.Set(sensor_TRIG_pin, False);
      
     

	outerloop:
      loop  -- if sensor_ECHO_pin is false all the time the loop never ends.

	    if MicroBit.IOs.Set(sensor_ECHO_pin) then

		innerloop:
		loop
		    MicroBit.Time.HAL_Delay.Delay_Microseconds(1);
		    if MicroBit.IOs.Set(sensor_ECHO_pin) then
			duration_echo_us := duration_echo_us + 1;
		    else
			return duration_echo_us;
		    end if;
            end loop innerloop;
            
            elsif not MicroBit.IOs.Set(sensor_ECHO_pin) then
		   return duration_echo_us;
         end if;	 
         -- return duration_echo_us; Maybe it should be here!
	end loop outerloop;

    end read;
   
   
end Sensor;
