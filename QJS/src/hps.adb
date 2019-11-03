package body HPS is

   procedure run (Self : in out schedule) is
      highest_priority_task_id : Integer := 0;
      highest_priorty_task_priority: Integer := 0;

      NB_q : constant Integer := 0;
      NH_q : constant Integer := 1;
      SC_q : constant Integer := 2;

      minor_queue_id : Integer := NB_q;  -- NB 1-3, NH 4-5, SC 6-7

      normal_behavior_val : constant Integer := -1; -- negative values should not conflict with sensor readings
      non_horizontal_val : constant Integer := -2; -- negative values should not conflict with sensor readings
      SC_threshold_min : constant Integer := 0; -- if value is less than this call sensor_check queue
      SC_threshold_max : constant Integer := 5; -- if value is less than this call sensor_check queue

      Answer : Integer;

   begin


      LOOP

         if minor_queue_id = NB_q then -- NB
            NB : FOR I in 1..3 LOOP
               Answer := self.major_queue(I).execute( self.major_queue(I).deadline );
               if (Answer = non_horizontal_val) then -- if Answer(AC) return non horizontal value
                  minor_queue_id := NH_q;
               elsif(Answer <= SC_threshold_max and Answer >= SC_threshold_min) then -- if Answer(SS) return to very close to obstacle
                  minor_queue_id := SC_q;
               end if;
               exit NB when minor_queue_id /= NB_q; -- exit queue if value changed
            END LOOP NB;
         end if;

         if minor_queue_id = NH_q then -- NH
            NH : FOR I in 4..5 LOOP
               Answer := self.major_queue(I).execute( self.major_queue(I).deadline );
               if (Answer = normal_behavior_val) then -- if Answer(AC) is horizontal change to NB
                  minor_queue_id := NB_q;
               end if;
               exit NH when minor_queue_id /= NH_q; -- exit queue if value changed
            END LOOP NH;
         end if;

         if minor_queue_id = SC_q then -- sensor check
            SC : FOR I in 6..7 LOOP
               Answer := self.major_queue(I).execute( self.major_queue(I).deadline );
               if (Answer = normal_behavior_val) then -- if Answer(SS) is states normal behavior
                  minor_queue_id := NB_q;
               end if;
               exit SC when minor_queue_id /= SC_q; -- not equal
            END LOOP SC;
         end if;

      END LOOP;

   end run;


end HPS;
