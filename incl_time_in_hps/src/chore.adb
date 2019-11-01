with Ada.Text_IO;
with Ada.Integer_Text_IO;


package body chore is

    function execute (Self : in out chore ; Deadline : Integer) return Integer is
	sensor_read : Integer;
    begin
	sensor_read := self.errand.all(Deadline);

	-- decide if the value is good or bad
	if self.id = 1 then --ACC

	    if sensor_read = 1 then
		return 1; -- Good value
	    else
		return -1; -- Bad value
	    end if;

	elsif self.id = 2 then -- sensor

	    if sensor_read = 1 then
		return 1; -- Good value
	    else
		return -1; -- Bad value
	    end if;

	elsif self.id = 3 then -- forward

	    if sensor_read = 1 then
		return 1; -- Good value
	    else
		return -1; -- Bad value
	    end if;

	elsif self.id = 4 then -- stop driving

	    if sensor_read = 1 then
		return 1; -- Good value
	    else
		return -1; -- Bad value
	    end if;

	end if;

    end execute;

    -- Run the errand of the chore. AKA execute the task.

end chore;
