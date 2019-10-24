with Ada.Text_IO;
with Ada.Integer_Text_IO;

-- Scheduling
with Scheduling_Scheme;


-- Functional packages
with testing_chores;


procedure Main is

    sensor : Scheduling_Scheme.chore;
    servo : Scheduling_Scheme.chore;
    drive : Scheduling_Scheme.chore;


begin

    sensor.task_name := "senso";
    sensor.start_time := 0;
    sensor.deadline := 50;
    sensor.period := 100;
    sensor.assign_procedure(testing_chores.print_success'Access);

    servo.task_name := "servo";
    sensor.start_time := 0;
    sensor.deadline := 50;
    sensor.period := 100;
    sensor.assign_procedure(testing_chores.print_success'Access);


    drive.task_name := "drive";
    sensor.start_time := 0;
    sensor.deadline := 50;
    sensor.period := 100;
    sensor.assign_procedure(testing_chores.print_success'Access);


    sensor.assigned_procedure.all;
    null;

end Main;







-- EXAMPLE USAGES

--  procedure Main is
--      T1 : Scheduling_Scheme.chore;
--
--      --  T1 : Scheduling_Scheme.chore := (task_name => 0);
--      -- this is how you assign values upon initialization. Must be done for all of them, even if a default value is given
--      -- To specify the default value for a component, you can use the <> notation.
--
--      T2 : Scheduling_Scheme.chore;
--
--  begin
--
--      -- this is how you edit the variables within your chore
--      T1.task_name := "fiver";
--      T1.start_time := 15;
--      T2.start_time := 500;
--
--      -- this is how you can access the variables within your chore
--      Ada.Text_IO.Put_Line(T1.task_name);
--      Ada.Integer_Text_IO.put(T1.start_time);
--
--      -- this is how you access methods within your chores
--      T1.Foo;
--      T2.Foo;
--
--      -- this is how you assign a procedure to your chores
--
--      T1.assign_procedure(testing_chores.print_success'Access);
--
--      T1.assigned_procedure.all;
--
--
--
--  end Main;


