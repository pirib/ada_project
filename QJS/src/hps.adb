package body HPS is

    procedure run (Self : in out schedule) is

	-- Minor Queue's IDs
	NB_q : constant Integer := 0;  -- Normal Behaviour
	NH_q : constant Integer := 1;  -- Not Horizontal
	SC_q : constant Integer := 2;  -- Sensor Collision


	current_queue_id : Integer := NB_q;  -- NB 1-3, NH 4-5, SC 6-7

	normal_behavior_val : constant Integer := -1; -- negative values should not conflict with sensor readings
	non_horizontal_val : constant Integer := -2; -- negative values should not conflict with sensor readings
	SC_threshold_min : constant Integer := 0; -- if value is less than this call sensor_check queue
	SC_threshold_max : constant Integer := 5; -- if value is less than this call sensor_check queue

	Answer : Integer;
	current_task_id : Integer;

    begin


	--  	LOOP
	--
	--  	    if current_queue_id = NB_q then -- NB
	--  		NB : FOR I in 1..3 LOOP
	--  		    Answer := self.major_queue(I).execute( self.major_queue(I).deadline );
	--  		    if (Answer = non_horizontal_val) then -- if Answer(AC) return non horizontal value
	--  			current_queue_id := NH_q;
	--  		    elsif(Answer <= SC_threshold_max and Answer >= SC_threshold_min) then -- if Answer(SS) return to very close to obstacle
	--  			current_queue_id := SC_q;
	--  		    end if;
	--  		    exit NB when current_queue_id /= NB_q; -- exit queue if value changed
	--  		END LOOP NB;
	--  	    end if;
	--
	--
	--  	    if current_queue_id = NH_q then -- NH
	--  		NH : FOR I in 4..5 LOOP
	--  		    Answer := self.major_queue(I).execute( self.major_queue(I).deadline );
	--  		    if (Answer = normal_behavior_val) then -- if Answer(AC) is horizontal change to NB
	--  			current_queue_id := NB_q;
	--  		    end if;
	--  		    exit NH when current_queue_id /= NH_q; -- exit queue if value changed
	--  		END LOOP NH;
	--  	    end if;
	--
	--
	--  	    if current_queue_id = SC_q then -- sensor check
	--  		SC : FOR I in 6..7 LOOP
	--  		    Answer := self.major_queue(I).execute( self.major_queue(I).deadline );
	--  		    if (Answer = normal_behavior_val) then -- if Answer(SS) is states normal behavior
	--  			current_queue_id := NB_q;
	--  		    end if;
	--  		    exit SC when current_queue_id /= SC_q; -- not equal
	--  		END LOOP SC;
	--  	    end if;
	--
	--  	END LOOP;


	LOOP


	    --  Normal Behaviour
	    if current_queue_id = NB_q then -- NB

		NB :
		FOR I in 1..3 LOOP  -- (AC, SS, DF)

		    Answer := self.major_queue(I).execute( self.major_queue(I).deadline );
		    current_task_id := self.major_queue(I).id;

		    if current_task_id = 1 and Answer = -1 then -- If the value from AC is bad
			current_queue_id := NH_q;

		    elsif current_task_id = 2 and Answer = -1 then -- If the value from SS is bad
			current_queue_id := SC_q;

		    end if;

		    exit NB when current_queue_id /= NB_q;
		END LOOP NB;


		--  Not Horizontal Queue
	    elsif current_queue_id = NH_q then -- NH

		NH :
		FOR I in 4..5 LOOP  -- (DS, AC)

		    Answer := self.major_queue(I).execute( self.major_queue(I).deadline );
		    current_task_id := self.major_queue(I).id;

		    if current_task_id = 1 and answer = 1 then -- If the value from AC is good
			current_queue_id := NB_q;
		    end if;

		    exit NH when current_queue_id /= NH_q;
		END LOOP NH;


		-- Sensor check Queue
	    elsif current_queue_id = SC_q then

		SC :
		FOR I in 6..7 LOOP  -- (DS, SS)  -- Need to add AC

		    Answer := self.major_queue(I).execute( self.major_queue(I).deadline );
		    current_task_id := self.major_queue(I).id;

		    if current_task_id = 2 and answer = 1 then -- If the value from SS is good
			current_queue_id := NB_q;
		    end if;

		    exit SC when current_queue_id /= SC_q;
		END LOOP SC;

	    end if;


	END LOOP;


    end run;


end HPS;
