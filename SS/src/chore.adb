with Ada.Text_IO;
with Ada.Integer_Text_IO;


package body chore is

    function execute (Self : in out chore ; Deadline : Integer) return Integer is
    begin
	return self.errand.all(Deadline);
    end execute;

    -- Run the errand of the chore. AKA execute the task.

end chore;
