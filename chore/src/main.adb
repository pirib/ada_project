with Ada.Text_IO;
with Ada.Integer_Text_IO;


with Scheduling_Scheme;

procedure Main is
    F1 : Scheduling_Scheme.chore;

    --  F1 : Scheduling_Scheme.chore := (task_name => 0);
    -- this is how you assign values upon initialization. Must be done for all of them, even if a default value is given
    -- To specify the default value for a component, you can use the <> notation.

    F2 : Scheduling_Scheme.chore;


begin

    -- this is how you edit the variables within your chore
    F1.task_name := "fiver";
    F1.start_time := 15;
    F2.start_time := 500;

    -- this is how you can access the variables within your chore
    Ada.Text_IO.Put_Line(F1.task_name);
    Ada.Integer_Text_IO.put(F1.start_time);

    -- this is how you access methods within your chores
    F1.Foo;
    F2.Foo;

    -- this is how you assign a procedure to your chores

    F1.assign_procedure(Scheduling_Scheme.testing_shit'Access);

    F1.assigned_procedure.all;  -- it works, but the procedure is in the package itself

end Main;


