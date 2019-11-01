package body HPS is

    procedure run (Self : in out schedule) is
	highest_priority_task_id : Integer := 0;
	highest_priorty_task_priority: Integer := 0;

	minor_queue_id : Integer := 0;  -- NB 1-3, NH 4-5, SC 6-7

	Answer : Integer;

    begin


	LOOP

	    if minor_queue_id = 0 then
		FOR I in 1..3 LOOP
		    Answer := self.major_queue(I).execute( self.major_queue(I).deadline );
		END LOOP;
	    end if;

	    if minor_queue_id = 1 then
		FOR I in 4..5 LOOP
		    Answer := self.major_queue(I).execute( self.major_queue(I).deadline );
		END LOOP;
	    end if;

	    if minor_queue_id = 2 then
		FOR I in 6..7 LOOP
		    Answer := self.major_queue(I).execute( self.major_queue(I).deadline );
		END LOOP;
	    end if;



	END LOOP;

    end run;


end HPS;
