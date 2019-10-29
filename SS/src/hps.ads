with chore; use chore;
-- TODO: fix info from nxt task in scheduling queue chore.WCET_nxt_task

package HPS is

   type queue_length is range 1..3;
   
   type chore_queue is array (queue_length) of chore.chore;
       
   
   type schedule is tagged record
      
      execution_queue : chore_queue;
      counter_accelerometer : Integer  := 0; -- used?
     
   end record;

   procedure run (Self : in out schedule);
   
end HPS;
