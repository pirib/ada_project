-- TODO: implement watchdog
-- TODO: make write_to_m1 and write_to_m2 private


-- PACKAGES

-- Microbit
with MicroBit.Time;


-- User
with Nav;  -- Package with driving instructions
with Sensor;  -- Package with sensor instructions
with Accelerometer;  use type accelerometer.acc_data;


procedure Main is

    -- PINS

    -- VARS

begin



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

    null;
end Main;


