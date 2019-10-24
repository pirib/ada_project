-- TODO: Make better named types for the record chore


--with Microbit.Time;


package Scheduling_Scheme is

    type procedure_pointer is access procedure;
    -- chore_procedure is now a pointer to a procedure


    type chore is tagged record
	-- Default values are assigned only if upon creating no other variables are assigned
	-- If upon initialization one value needs to be given, then the rest must be given as well

	task_name:  String(1..6) := "task  ";  -- MUST be of length 5
	start_time: Integer := 0;  -- Will get the value of the clock
	deadline:   Integer := 0;
	-- period:     Integer := 0;
	-- priority:   Integer  := 0;

	-- this is the procedure under scrutiny
	errand: procedure_pointer;

    end record;

    --  If you define a procedure taking a chore in the same package, it will be a method.


    procedure assign_errand ( Self : in out chore ; P: procedure_pointer);
    -- Procedure assigning the value of errand variable of a chore

end Scheduling_Scheme;
