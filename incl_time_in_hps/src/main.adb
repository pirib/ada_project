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

    AC : chore.chore := (task_name => "acceller" ,
			 id => 1,
			 deadline => <>,
			 errand => external_package.print_accelerometer'Access
			);

    SS : chore.chore := (task_name => "sensor  " ,
			 id => 2,
			 deadline => <>,
			 errand => external_package.print_sensor'Access
			);

    DF : chore.chore := (task_name => "forward " ,
			 id => 3,
			 deadline => <>,
			 errand => external_package.print_nav'Access
			);

    DS : chore.chore := (task_name => "stopstop" ,
			 id => 4,
			 deadline => <>,
			 errand => external_package.print_nav'Access
			);


    -- This is the queue of HPS
    QJS : HPS.schedule := (major_queue => (AC, SS, DF, DS, AC, DS, SS) );

begin

    QJS.run;
    null;


end Main;




