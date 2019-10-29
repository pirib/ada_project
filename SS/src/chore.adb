with Ada.Text_IO;
with Ada.Integer_Text_IO;


package body chore is

    procedure execute (Self : in out chore) is
    begin
	self.errand.all;
    end execute;
    -- Run the errand of the chore. AKA execute the task.

end chore;
