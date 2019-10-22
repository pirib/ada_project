-- TODO: Make better named types for the record chore

--with Microbit.Time;


package Scheduling_Scheme is

    -- chore_procedure is now a pointer to a procedure
    type procedure_pointer is access procedure;

    type chore is tagged record
	-- Default values are assigned only if upon creating no other variables are assigned
	-- If upon initialization one value needs to be given, then the rest must be given as well

	task_name:  String(1..5) := "task ";  -- MUST be of length 5
	start_time: Integer := 0;
	deadline:   Integer := 0;
	period:     Integer := 0;
	priority:   Integer  := 0;

	-- this is the procedure under scrutiny
	assigned_procedure: procedure_pointer;

    end record;


    --  If you define a procedure taking a chore in the same package, it will be a method.
    procedure Foo (Self : in out chore);

    procedure assign_procedure ( Self : in out chore ; P: procedure_pointer);

    procedure testing_shit;

end Scheduling_Scheme;
