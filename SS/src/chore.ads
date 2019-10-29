package chore is

    type function_pointer is access procedure;
    -- chore_procedure is now a pointer to a procedure


    type chore is tagged record

	task_name:        String(1..8) := "taskname";
	id:               Integer := 0;

	priority:         Integer := 0;
	start_time:       Integer := 0;

	execution_time:   Integer := 0;  -- this is basically a deadline
	period:           Integer := -1;  -- -1 if the task is aperiodic

	-- this is the procedure under scrutiny
	errand: function_pointer;

    end record;

    procedure execute (Self : in out chore);

end chore;
