-- Done:
-- External Packages > rewrite procedures as functions with Deadline param, a while loop and a return
-- Chores > Rewrite procedure pointers to function (remember returns).


-- Pending:
-- HPS > Counter for accelerometer period. Priority assignment. Execution logic.



-- TODO Make better named types for the record chore
-- TODO Make a procedure printing out all information about a chore / Suraphel

-- TODO write description comments inside the packages under the declarations
-- TODO Explore an emergency exit construct for HPS https://stackoverflow.com/questions/23176305/ada-83only-how-to-end-an-entire-program-which-has-multiple-procedures/23178220#23178220
-- TODO Explore a possibility of using enums to replace id&task_name in chores


with Ada.Text_IO;
with Ada.Integer_Text_IO;

-- Scheduling
with Chore;
with HPS;  -- Hardware Processing Scheduler

-- Functional packages
with external_package;


procedure Main is

    -- Initializing tasks

    acc : chore.chore := (task_name => "acceller" ,
			  id => 1,
			  start_time => <>,
			  period => 500,
			  priority => 99,
			  execution_time => 100,
			  errand => external_package.print_accelerometer'Access
			 );

    --      sensor : chore.chore := (task_name => "sensor  " ,
    --  			     id => 1,
    --  			     start_time => <>,
    --  			     period => 300,
    --  			     priority => 2,
    --  			     execution_time => 100,
    --  			     errand => external_package.print_sensor'Access
    --  			    );
    --
    --      nav : chore.chore := (task_name => "navigati" ,
    --  			  id => 3,
    --  			  start_time => <>,
    --  			  period => 300,
    --  			  priority => 1,
    --  			  execution_time => 100,
    --  			  errand => external_package.print_nav'Access
    --  			 );



    -- This is the queue of HPS
   ss : HPS.schedule :=(
--       (period_start_time => <>,
--                           period_cnt => <>,
--                           current_time => <>,
--                           estimated_time => <>,
                         execution_queue => (acc, acc, acc),
			  counter_accelerometer => <>
			 );


begin

    -- Looping just once. When running on native ADA, for
--      FOR I in 1 .. 7 LOOP
--  	Ada.Integer_Text_IO.Put(I);
--  	Ada.Text_IO.Put(" ");
--  	ss.run;
--      END LOOP;
null;
end Main;




