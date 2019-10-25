with chore_class; use chore_class;


package Scheduling_scheme is

   
    type chore_queue is array (1..3) of chore;
   
   
    type schedule is tagged record
     
	normal_behaviour : chore_queue;
     
    end record;


    procedure start (Self : in out schedule);
    


end Scheduling_scheme;
