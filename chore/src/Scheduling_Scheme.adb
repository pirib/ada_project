with Ada.Text_IO;
with Ada.Integer_Text_IO;

package body Scheduling_Scheme is

    procedure Foo (Self : in out chore) is
    begin
	Ada.Integer_Text_IO.Put(Self.start_time);
	Ada.Text_IO.Put_Line(Self.task_name);
    end Foo;

    procedure assign_procedure (Self : in out chore; P: procedure_pointer ) is
    begin
	self.assigned_procedure := P;
    end assign_procedure;

    procedure testing_shit is
    begin
	Ada.Text_IO.Put_Line("it worked!");
    end testing_shit;

end Scheduling_Scheme;
