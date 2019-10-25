package body Scheduling_scheme is

    procedure start (Self : in out schedule) is
    begin

	for I in 1..3 loop
	    self.normal_behaviour(I).run;
	end loop;

    end start;


end Scheduling_scheme;
