-- TODO Make a procedure printing out all information about a chore

with Ada.Text_IO;
with Ada.Integer_Text_IO;



package body Scheduling_Scheme is


    procedure assign_errand (Self : in out chore; P: procedure_pointer ) is
    begin
	self.errand := P;
    end assign_errand;
    -- Suraphel, you can edit it

end Scheduling_Scheme;
