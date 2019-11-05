with Microbit.Time;

package chore is

    type function_pointer is access function  (Deadline : Microbit.Time.Time_Ms)  return Integer;
    -- chore_procedure is now a pointer to a procedure


    type chore is tagged record

	task_name:        String(1..8) := "taskname";
	id:               Integer := 0;
	deadline:         Microbit.Time.Time_MS := 500;

	-- this is the procedure under scrutiny
	errand: function_pointer;

    end record;

    function execute (Self : in out chore ; Deadline : MicroBit.Time.Time_Ms) return Integer;

end chore;
