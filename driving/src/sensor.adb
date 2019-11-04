with MicroBit.IOs; use MicroBit.IOs;


package body Sensor is

    --  PINS

    sensor_TRIG_pin: constant Pin_Id := 8;  -- sending the sensor
    sensor_ECHO_pin: constant Pin_Id := 12;  -- receiving from the sensor

    -- VARS
    duration_echo_us: Integer; -- Duration of the pulse from ECHO pin measured in MicroSeconds

    function read return Integer is
    begin
	duration_echo_us := 0;

	MicroBit.IOs.Set(sensor_TRIG_pin, False);
	MicroBit.Time.HAL_Delay.Delay_Microseconds(10);

	MicroBit.IOs.Set(sensor_TRIG_pin, True);
	MicroBit.Time.HAL_Delay.Delay_Microseconds(10);
	MicroBit.IOs.Set(sensor_TRIG_pin, False);

	outerloop:
	loop

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
	    else
		return duration_echo_us;
	    end if;
	    
	end loop outerloop;

    end read;


    function read (Deadline : MicroBit.Time.Time_Ms) return Integer is
    begin
	duration_echo_us := 0;

	MicroBit.IOs.Set(sensor_TRIG_pin, False);
	MicroBit.Time.HAL_Delay.Delay_Microseconds(10);

	MicroBit.IOs.Set(sensor_TRIG_pin, True);
	MicroBit.Time.HAL_Delay.Delay_Microseconds(10);
	MicroBit.IOs.Set(sensor_TRIG_pin, False);

	outerloop:
	loop

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
	    else
		return duration_echo_us;
	    end if;
	    
	end loop outerloop;

    end read;


   
end Sensor;
