with Ada.Integer_Text_IO;

package body Scheduling_scheme is

    procedure start (Self : in out schedule) is
    begin

	for I in 1..3 loop

	    if self.normal_behaviour(I).task_name = "accell" then
		self.acc_data := self.normal_behaviour(I).run;
	    elsif self.normal_behaviour(I).task_name = "naviga" then
		self.nav_data := self.normal_behaviour(I).run;
	    elsif self.normal_behaviour(I).task_name = "sensor" then
		self.sensor_data := self.normal_behaviour(I).run;
	    end if;

	end loop;

	Ada.Integer_Text_IO.Put ( self.sensor_data);
	Ada.Integer_Text_IO.Put ( self.acc_data);
	Ada.Integer_Text_IO.Put ( self.nav_data);

    end start;


end Scheduling_scheme;
