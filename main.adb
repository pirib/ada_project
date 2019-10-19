-- TODO: implement watchdog
-- TODO: make write_to_m1 and write_to_m2 private




--   direction

-- PACKAGES

-- Microbit



with MicroBit.Time;
with MicroBit.Accelerometer;
with MicroBit.IOs;
with MicroBit.Servos;


-- User

with Nav;  -- Package with driving instructions
with Sensor_v2;  use Sensor_v2; -- Package with sensor instructions

with Accelerometer;use Accelerometer;

procedure Main is

   -- PINS


   -- VARS

begin
   MicroBit.Accelerometer.Initialize;

   loop


      --  info: if the analog value to the engine ctrl function is too high(e.g +500)
      --   (e.g. drive forward) the less stable, the direction of the weels will be, even if the
      --  accelerometer reading are stable.
--
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
   --THIS IS WORKING: with both accelerometer and sensor, NB! Sensor needs to be powered from 5V Micro:Bit GPIO board
   -----------------------------------------------------------------------



      if Accelerometer.get_y < Accelerometer.tilt_max_y and
        Accelerometer.get_y > Accelerometer.tilt_min_y and
        Sensor_v2.read > Sensor_v2.travel_time_stop then
        -- MicroBit.Time.Delay_Ms(500);
         Nav.drive_forward;
      elsif Accelerometer.get_y > Accelerometer.tilt_max_y or
        Accelerometer.get_y < Accelerometer.tilt_min_y then
         Nav.stop;

      elsif  Sensor_v2.read < Sensor_v2.travel_time_stop then
         --MicroBit.Time.Delay_Ms(500);
         Nav.stop;
         MicroBit.Servos.Go(1, 90); -- -- left position servo
         if Sensor_v2.read < Sensor_v2.travel_time_stop then
            Nav.turn_right; -- in reality this is left currently
            MicroBit.Servos.Go(1, 45); -- back to start position servo
            MicroBit.Time.Delay_Ms(500);
         end if;
         MicroBit.Servos.Go(1, 0); -- turn servo right
         if Sensor_v2.read < Sensor_v2.travel_time_stop then
            Nav.turn_left; -- in reality this is right currently
            MicroBit.Servos.Go(1, 45); -- back to start position servo
            MicroBit.Time.Delay_Ms(500);
         end if;

      else
          Nav.drive_backward;

         end if;
      end loop;







   --          EXAMPLES
   --          ========


   --          ACCELEROMETER
   --          =============
   --
   --          acc:
   --          loop
   --  	    accelerometer.use_display;
   --  	    MicroBit.Time.Delay_Ms(100);
   --
   --          end loop acc;

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

   --null;
end Main;


