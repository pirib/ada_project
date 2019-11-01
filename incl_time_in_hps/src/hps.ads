with chore; use chore;
with Ada.Text_IO;
with Ada.Integer_Text_IO;
with external_package;


package HPS is

   
   type chore_queue is array (1..7) of chore.chore;
   
   type schedule is tagged record
     
      major_queue : chore_queue;
     
   end record;

   
   procedure run (Self : in out schedule);
   
   
private
   
   function start_AC_period (Self : in out schedule;
                             AC_id : Integer;
                             I : Integer
                            ) return Integer;
   -- gets the start time of the accelerometer task period
   
   function estimated_time (Self : in out schedule;
                           period_start_time : Integer;
                             I : Integer
                          ) return Integer;
   -- predicts expected time for next task to finish
   -- using WCET for the next task
   
   
   procedure run_if_schedulable (Self : in out schedule;
                                 period_cnt : Integer;
                                 estimate_time : Integer;
                                 index_loop : Integer;
                                 AC_id : Integer;
                                 nxt_queue_var : in Integer;
                                 minor_queue_id : out Integer;
                                 exit_queue_flag : out Boolean;
                                 Answer : out Integer
                                );
   -- executes the task if it is schedulable:
   -- either task is expected to finish with the period of AC
   -- or the next task is AC
   
   procedure nxt_queue (nxt_queue : in Integer;
                        minor_queue_id : out Integer;
                        exit_queue_flag : out Boolean);
   -- sets the next queue to execute
   
end HPS;
