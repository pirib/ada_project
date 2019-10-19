-- TODO: force dx and dy to be within 0...5 range and/or limit it to 3 bits
-- TODO: Get rid of Initialize withing get_x, get_y, get_z

--with MicroBit.Display;         
with MicroBit.Accelerometer;   use MicroBit.Accelerometer;
with MMA8653;                  use MMA8653;


package body Accelerometer is
   -- used to stop the car when it is picked up
  -- tilt_max_y: constant acc_data := 65;
  -- tilt_min_y: constant acc_data := -65;
   
   

    -- Used by display. Declared up here so doesnt have to redefine them on each procedure call.
    dx : Integer := 2;   
    dy : Integer := 2;
   

    -- Displays the accelerometer readings on led display. 
    procedure use_display is

    begin
	Initialize;
	--MicroBit.Display.Clear;
	
	if Data.X < -190 then
	    dx := 4;
	elsif Data.X > -190 and Data.X < -65 then
	    dx := 3;
	elsif Data.X > -65 and Data.X < 65 then	
	    dx := 2;
	elsif Data.X > 65 and Data.X < 190 then
	    dx := 1;
	elsif Data.X > 190 then
	    dx := 0;
	end if;
	
	if Data.Y < -190 then
	    dy:= 4;	    
	elsif Data.Y > -190 and Data.Y < -65 then
	    dy:= 3;
	elsif Data.Y > -65 and Data.Y < 65 then	
	    dy:= 2;
	elsif Data.Y > 65 and Data.Y < 190 then
	    dy:= 1;
	elsif Data.Y > 190 then
	    dy:= 0;
	end if;

	--MicroBit.Display.Set(dx,dy);

    end use_display;


    function get_x return acc_data is
    begin
	
	if not Initialized then
	    Initialize;
	end if;
	
	loop 
	    if Initialized then
		return acc_data(Data.x);
	    end if;
	end loop;
	
    end get_x;
    
   
    function get_y return acc_data is
    begin

		return acc_data(Data.y);
	
    end get_y;


    function get_z return acc_data is
    begin
	
	if not Initialized then
	    Initialize;
	end if;
	
	loop 
	    if Initialized then
		return acc_data(Data.z);
	    end if;
	end loop;
	
    end get_z;

end Accelerometer;
