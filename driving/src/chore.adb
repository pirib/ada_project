

package body chore is

    function execute (Self : in out chore ; Deadline : MicroBit.Time.Time_Ms) return Integer is
	temp : Integer;
    begin
	temp := self.errand.all(Deadline); -- Actually execute a task

	-- decide if the value recevied is good or bad. 1 for good, -1 for bad
	if self.id = 1 then -- AC

	    if temp < -150 and temp > -350 then
		return 1; -- normal behavior value
	    else
		return -1; -- non horizontal value
	    end if;


	elsif self.id = 2 or self.id = 8 or self.id = 9 then -- SS

	    if temp < 100 then
		return -1; -- there is a wall
	    else
		return 1; -- there is no wall
	    end if;


	elsif self.id = 3 or self.id = 4 or self.id = 5 or self.id = 6 or self.id = 7 then  -- DS
	    return 1;  --task should only return normal behavior value

	    -- This will produce an errr by default
	else -- do error handling here: either call ERROR_q or restart from NB_q?
	    return 1;

	end if;

    end execute;
    -- Run the errand of the chore. AKA execute the task.



end chore;
