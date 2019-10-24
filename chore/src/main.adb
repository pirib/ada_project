-- TODO write description comments inside the packages under the declarations


with Ada.Text_IO;
with Ada.Integer_Text_IO;

-- Scheduling
with Scheduling_Scheme;


-- Functional packages
with testing_chores;


procedure Main is

    sensor : Scheduling_Scheme.chore := (task_name => "sensor" ,
					 start_time => 0,
					 deadline => 100,
					 errand => testing_chores.print_sensor'Access
					);

    acc : Scheduling_Scheme.chore := (task_name => "accell" ,
					 start_time => 0,
					 deadline => 200,
					 errand => testing_chores.print_accelerometer'Access
					);

    nav : Scheduling_Scheme.chore := (task_name => "naviga" ,
					 start_time => 0,
					 deadline => 150,
					 errand => testing_chores.print_nav'Access
					);
begin

    sensor.errand.all;
    acc.errand.all;
    nav.errand.all;


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


