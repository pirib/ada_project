with Ada.Text_IO;
with Ada.Integer_Text_IO;


package body chore_class is

    --      procedure assign_errand (Self : in out chore; P: procedure_pointer ) is
    --      begin
    --  	self.errand := P;
    --      end assign_errand;
    -- Suraphel, you can edit it

    function run (Self : in out chore) return Integer is
    begin
	return self.errand.all;
    end run;

end chore_class;
