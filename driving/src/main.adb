-- TODO: implement watchdog
-- TODO: make write_to_m1 and write_to_m2 private


-- PACKAGES

-- Microbit
with MicroBit.Time;
with Microbit.Display;


-- User
with Nav;
with Sensor;          use type sensor.travel_time_us;
with Accelerometer;   use type accelerometer.acc_data;


procedure Main is

    -- PINS

    -- VARS

begin

select

    --   Accelerometer.Initialize;

    MicroBit.Display.Display( Integer'Image(  Integer(Sensor.read) ) );
    --MicroBit.Display.Display( String(Integer(sensor.travel_time_us'Image(Sensor.read)))  );
    MicroBit.Time.Delay_Ms(2000);

    -- loop
    --
    --        if Accelerometer.get_y < Accelerometer.tilt_max_y and
    --           Accelerometer.get_y > Accelerometer.tilt_min_y then
    --          --Sensor.read > Sensor.travel_time_stop then
    --           Nav.drive_forward;
    --  --        elsif
    --  --          Accelerometer.get_y < Accelerometer.tilt_max_y and
    --  --          Accelerometer.get_y > Accelerometer.tilt_min_y then
    --  --           Nav.stop;
    --
    --        elsif  Sensor.read < Sensor.travel_time_stop then
    --                 Nav.drive_backward;
    --        else
    --           Nav.turn_right;
    --          -- MicroBit.IOs.Write(0, 0);
    --        end if;
    --
    --        Microbit.Time.Delay_Ms(500); --  the longer the delay the shorter wheel interruptions
    --
    --     end loop;

    ----------------------------------------------------------------------
    --THIS IS WORKING: PHASE 1, OF FUNCTIONAL SENSOR CODE
    -----------------------------------------------------------------------


    --      loop
    --
    --  	if Sensor.read > Sensor.travel_time_stop then
    --  	    Nav.drive_forward;
    --  	elsif  Sensor.read <= Sensor.travel_time_stop then
    --  	    Nav.turn_left;
    --  	end if;
    --
    --  	Microbit.Time.Delay_ms(500);
    --
    --      end loop;


    --          EXAMPLES
    --          ========

    --          ACCELEROMETER
    --          =============
    --              Accelerometer.Initialize;
    --              acc:
    --              loop
    --          	accelerometer.show_on_display;
    --          	MicroBit.Time.Delay_Ms(100);
    --
    --              end loop acc;

    --          DRIVING
    --          =======
    --
    --          driving:
    --          LOOP
    --
    --          This is how you make the car move
    --
    --      	Nav.stop;
    --      	MicroBit.Time.Delay_ms(5000);
    --
    --      	Nav.drive_forward;
    --      	MicroBit.Time.Delay_ms(1000);
    --
    --      	Nav.turn_left;
    --      	MicroBit.Time.Delay_ms(500);
    --
    --      	Nav.turn_right;
    --      	MicroBit.Time.Delay_ms(1000);
    --
    --      	Nav.drive_backward;
    --      	MicroBit.Time.Delay_ms(500);
    --
    --          END LOOP driving;

    --    null;
end Main;


