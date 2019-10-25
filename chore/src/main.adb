-- TODO write description comments inside the packages under the declarations
-- TODO Make better named types for the record chore
-- TODO Make a procedure printing out all information about a chore / Suraphel
-- TODO Turn the range of the chore_queue into a variable / Suraphel



with Ada.Text_IO;
with Ada.Integer_Text_IO;

-- Scheduling
with chore_class;
with Scheduling_scheme;

-- Functional packages
with testing_chores;


procedure Main is

    sensor : Chore_Class.chore := (task_name => "sensor" ,
				   start_time => <>,
				   deadline => 100,
				   errand => testing_chores.print_sensor'Access
				  );

    acc : Chore_Class.chore := (task_name => "accell" ,
				start_time => <>,
				deadline => 200,
				errand => testing_chores.print_accelerometer'Access
			       );

    nav : Chore_Class.chore := (task_name => "naviga" ,
				start_time => <>,
				deadline => 150,
				errand => testing_chores.print_nav'Access
			       );

    rts : Chore_Class.chore := (task_name => "rts   " ,
				start_time => <>,
				deadline => 0,
				errand => testing_chores.print_nav'Access
			       );

    ss : Scheduling_scheme.schedule := (normal_behaviour => (sensor, acc, nav),
					sensor_data => <>,
					nav_data => <>,
					acc_data => <>
				       );

    --    not_horizontal : Scheduling_scheme.chore_queue := ( sensor, acc, rts );


begin


    ss.start;


    null;


end Main;




