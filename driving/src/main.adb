-- TODO add servo code for SS, SL, SR tasks/functions
-- TODO Turn Around code

-- PACKAGES

-- Microbit
with MicroBit.Time;


-- EXTERNAL PACKAGES
with Nav;
with Sensor;          use type sensor.travel_time_us;
with Accelerometer;

-- SCHEDULING
with Chore;
with QJS;

procedure Main is

    -- Initializing tasks

    AC : constant chore.chore := (task_name => "acceller" ,
				  id => 1,
				  deadline => <>,
				  errand => accelerometer.check_acc'Access
				 );

    SS : constant chore.chore := (task_name => "sensorst" ,
				  id => 2,
				  deadline => <>,
				  errand => sensor.sensor_straight'Access
				 );

    DF : constant chore.chore := (task_name => "forward " ,
				  id => 3,
				  deadline => <>,
				  errand => nav.drive_forward'Access
				 );

    DS : constant chore.chore := (task_name => "stopstop" ,
				  id => 4,
				  deadline => <>,
				  errand => nav.stop'Access
				 );

    TL : constant chore.chore := (task_name => "turnleft" ,
				  id => 5,
				  deadline => <>,
				  errand => nav.turn_left'Access
				 );

    TR : constant chore.chore := (task_name => "turnrigh" ,
				  id => 6,
				  deadline => <>,
				  errand => nav.turn_right'Access
				 );

    TA : constant chore.chore := (task_name => "turnarou" ,
				  id => 7,
				  deadline => <>,
				  errand => nav.drive_forward'Access -- NEEDS CHANGING
				 );

    SL : constant chore.chore := (task_name => "sensleft" ,
				  id => 8,
				  deadline => <>,
				  errand => sensor.sensor_left'Access
				 );

    SR : constant chore.chore := (task_name => "sensrigh" ,
				  id => 9,
				  deadline => <>,
				  errand => sensor.sensor_right'Access
				 );


    Schedule : QJS.schedule := (major_queue => (AC, SS, DF, DS, AC, DS, SL, SR, TA, TL, TR) );

    --   NB:  AC SS DF
    --   NH:    DS AC
    --   SC:      DS SL SR TA
    --   TR:        TR
    --   TL:          TL
    --   ERROR:

begin

    Accelerometer.Initialize;

    Schedule.run;


    -- ============================================================
    -- OLD STUFF
    -- =============================================================

    --MicroBit.Display.Display( String(Integer(sensor.travel_time_us'Image(Sensor.read)))  );
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


    null;

end Main;


