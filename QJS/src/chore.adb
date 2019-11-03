with Ada.Text_IO;
with Ada.Integer_Text_IO;


package body chore is

    function execute (Self : in out chore ; Deadline : Integer) return Integer is
	temp : Integer;
    begin
	temp := self.errand.all(Deadline); --

	-- decide if the value is good or bad
	if self.id = 1 then -- AC

	    if temp = 1 then
		return -1; -- normal behavior value
	    else
		return -2; -- non horizontal value
	    end if;

	elsif self.id = 2 then -- SS

	    if temp = 1 then
		return -1; -- normal behavior value
	    else
		return -2; -- non horizontal value
	    end if;

	elsif self.id = 3 then -- DF
                        --task should only return normal behavior value
	    if temp = 1 then
		return -1; -- normal behavior value
	    else
		return -2; -- non horizontal value
	    end if;

	elsif self.id = 4 then  -- DS
                         --task should only return non horizontal and sensor check value
	    if temp = 1 then
		return -1; -- normal behavior value
	    else
		return -2; -- non horizontal value
	    end if;

	end if;

    end execute;

    -- Run the errand of the chore. AKA execute the task.

end chore;
