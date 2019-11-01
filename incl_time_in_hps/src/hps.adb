-- Question: program logic:which minor_queue_id to run next?
--           How do we assign minor_queue_id?

package body HPS is

   function start_AC_period (Self : in out schedule;
                             AC_id : Integer;
                             I : Integer
                            ) return Integer is
      period_start_time : Integer := 0; -- Microbit.Time.Clock; -- equal to the start time of execution of a ACC chore
   begin
      if (Self.major_queue(I).execute( Self.major_queue(I).id) = AC_id) then
         period_start_time := 200; -- garbage value := Microbit.Time.Clock;
         return period_start_time;
      end if;
      return period_start_time;
   end;


   function estimated_time (Self : in out schedule;
                            period_start_time : Integer;
                            I : Integer
                           ) return Integer is
      current_time : Integer := 0; -- Microbit.Time.Clock; -- remove when implementing in Microbit
      estimate_time : Integer := 0;   -- Ms
   begin
      estimate_time := current_time + self.major_queue(I).deadline - period_start_time;
      return estimate_time;
   end;

   procedure nxt_queue (nxt_queue : in Integer;
                        minor_queue_id : out Integer;
                        exit_queue_flag : out Boolean) is
   begin
      minor_queue_id := nxt_queue;
      exit_queue_flag := True;
   end;


   procedure run_if_schedulable (Self : in out schedule;
                                 period_cnt : in Integer;
                                 estimate_time : in Integer;
                                 index_loop : Integer;
                                 AC_id : Integer;
                                 nxt_queue_var : in Integer;
                                 minor_queue_id : out Integer;
                                 exit_queue_flag : out Boolean;
                                 Answer : out Integer
                                ) is

   begin
      if (period_cnt > estimate_time)
        or (Self.major_queue(index_loop).execute( Self.major_queue(index_loop).id) = AC_id) then
         Answer := self.major_queue(index_loop).execute( self.major_queue(index_loop).deadline );
      else -- restart queue noraml behavior again, i.e. run AC
         nxt_queue(nxt_queue_var, minor_queue_id, exit_queue_flag);
      end if;
   end;


   procedure run (Self : in out schedule) is
      highest_priority_task_id : Integer := 0;
      highest_priorty_task_priority: Integer := 0;

      minor_queue_id : Integer := 0;  -- NB 1-3, NH 4-5, SC 6-7

      -- next queue to execute
      normal_behavior_q : Integer := 0;
      non_horizontal_q : Integer := 1;
      sensor_check_q : Integer := 2;

      Answer : Integer;

      -- AC placement in queue/array variables
      AC_id_que_1 : constant Integer := 1;
      AC_id_que_2 : constant Integer := 5;

      -- exit queue flag
      exit_flag : Boolean := False;

      -- time variables for scheduling
      period_start_time : Integer := 0; -- Microbit.Time.Clock; -- equal to the start time of execution of a ACC chore
      period_cnt : Integer := 500; -- store the assumed period of the ACC in ms
      estimate_time : Integer := 0; --updates after next task in queue's executed -- tell us if the next task finish in time to schedule the ACC task

   begin


      LOOP

         if minor_queue_id = 0 then -- normal behaviour AC, SS, DF,
            exit_flag := False;

            normal_behavior : FOR I in 1..3 LOOP

               -- start period ACC if ACC is next task to execute
               period_start_time := start_AC_period(self, AC_id_que_1, I);

               -- predict time for next task to finish
               estimate_time := estimated_time(self, period_start_time, I);

               -- Execute next task only if it is predicted to finish in time for ACC next period
               -- or next task is AC
               run_if_schedulable(Self, period_cnt, estimate_time, I, AC_id_que_1,
                                  normal_behavior_q, minor_queue_id,
                                  exit_flag, Answer);
               -- set next queue
               if (Answer = -1 and exit_flag = False) then -- exit when bad value and task was run
                  nxt_queue(non_horizontal_q, minor_queue_id, exit_flag);
               end if;

               exit normal_behavior when exit_flag = True;
            END LOOP normal_behavior;
         end if;


         if minor_queue_id = 1 then -- non-horizontal  DS, AC
            exit_flag := False;

            non_horizontal : FOR I in 4..5 LOOP
               -- start period ACC if ACC is next task to execute
               period_start_time := start_AC_period(self, AC_id_que_2, I);

               -- predict time for next task to finish
               estimate_time := estimated_time(Self, period_start_time, I);

               -- Execute next task only if it is predicted to finish in time for ACC next period
               -- or next task is AC
               run_if_schedulable(Self, period_cnt, estimate_time, I, AC_id_que_2,
                                  normal_behavior_q, minor_queue_id,
                                  exit_flag, Answer);

               if (Answer = 1 and exit_flag = False) then
                  nxt_queue(normal_behavior_q, minor_queue_id, exit_flag);
               end if;

               exit non_horizontal when exit_flag = True;
            END LOOP non_horizontal;
         end if;

         if minor_queue_id = 2 then -- Sensor Check  DS, SS
            exit_flag := False;

            sensor_check : FOR I in 6..7 LOOP

               -- predict time for next task to finish
               estimate_time := estimated_time(Self, period_start_time, I);

               -- Execute next task only if it is predicted to finish in time for ACC next period
               -- or next task is AC
               run_if_schedulable(Self, period_cnt, estimate_time, I, AC_id_que_1,
                                  normal_behavior_q, minor_queue_id,
                                  exit_flag, Answer);

               if (Answer = 1 and exit_flag = False) then -- different due to no AC task in this queue
                  nxt_queue(normal_behavior_q, minor_queue_id, exit_flag);
               end if;

               exit sensor_check when exit_flag = True;

            END LOOP sensor_check;
         end if;

      END LOOP;

   end run;


end HPS;
