with Ada.Text_IO;
with Ada.Integer_Text_IO;
with external_package;


package body HPS is

   answer : Integer;

   procedure run (Self : in out schedule) is
      highest_priority_task_id : Integer := 0;
      highest_priorty_task_priority : Integer := 0;
      highest_priority_task_array_index : queue_length := 1;


      period_start_time : Integer := 0; -- Microbit.Time.Clock; -- equal to the start time of execution of a ACC chore
      period_cnt : Integer := 500; -- store the period of the ACC in ms

      current_time : Integer := 0; -- Microbit.Time.Clock; -- remove when implementing in Microbit

      estimated_time : Integer := 0; --updates after next task in queue's executed -- tell us if the next task finish in time to schedule the ACC task



   begin

      -- Find the task with the highest priority
      FOR I in queue_length LOOP
         if self.execution_queue(I).priority > highest_priorty_task_priority
         then
            highest_priority_task_id := self.execution_queue(I).id;
            highest_priorty_task_priority := self.execution_queue(I).priority;
            highest_priority_task_array_index := queue_length(I);

         end if;
      END LOOP;

      current_time := 400; -- remove when implemented in Microbit

      -- Estimated time for next task to finish
      estimated_time := current_time + self.execution_queue(highest_priority_task_array_index).execution_time - period_start_time;
      -- first task execution: period_start_time is zero --> problem?
      -- solution ? --> put if-statement "initialize for this period the period_start_time for ACC tasks"
      -- above estimated_time assignment



      -- only run task if estimated_time is less than period_cnt or the task is ACC
      if (estimated_time <period_cnt) or
        self.execution_queue(highest_priority_task_array_index).task_name = "acceller" then

         -- initialize for this period the period_start_time for ACC tasks
         if self.execution_queue(highest_priority_task_array_index).task_name = "acceller" then
            period_start_time := 200; -- garbage value := Microbit.Time.Clock;
         end if;

         -- Execute the task with highest priority
         FOR I in queue_length LOOP
            if self.execution_queue(I).id = highest_priority_task_id

            then
               -- does this actually RUN ANYTHING?
               Answer := self.execution_queue(I).execute( self.execution_queue(I).execution_time);
            end if;
         END LOOP;

         -- alternative to for loop above
         --Answer := self.execution_queue(highest_priority_task_array_index).execute( self.execution_queue(highest_priority_task_array_index).execution_time);

      end if;



   end run;

end HPS;
