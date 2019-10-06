-- TODO: implement watchdog
-- TODO: make write_to_m1 and write_to_m2 private


-- PACKAGES

-- Microbit

with MicroBit.IOs;
with MicroBit.Display;
with MicroBit.Time;

-- User

with Nav;  -- Package with driving instructions
with Sensor;  -- Package with sensor instructions


procedure Main is

    -- PINS


begin

    LOOP

	Nav.drive_forward;
	MicroBit.Time.Delay_ms(2000);
	Nav.turn_left;
	MicroBit.Time.Delay_ms(2000);
	Nav.turn_right;
	MicroBit.Time.Delay_ms(2000);
	Nav.drive_backward;
	MicroBit.Time.Delay_ms(2000);
	Nav.stop;
	MicroBit.Time.Delay_ms(2000);

    END LOOP;

end Main;


