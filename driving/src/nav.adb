with MicroBit.IOs; use MicroBit.IOs;



package body Nav is

    --  PINS

    --  Motor 1 Pins left motor

    m1anal_pin: constant Pin_Id := 0; 
    m1in1_pin: constant Pin_Id := 16;
    m1in2_pin: constant Pin_Id := 15;      

    --  Motor 2 Pins right motor
    
    m2anal_pin: constant Pin_Id := 2;
    m2in1_pin: constant Pin_Id := 11;
    m2in2_pin: constant Pin_Id := 5;      
    
    
    --  Variables
    
    -- info: if the analog_value(low, med, high) to the engine ctrl function is too high(e.g +500)
    -- (e.g. drive forward) the less stable, the direction of the weels will be, even if the
    -- accelerometer reading are stable.
    
    zero: constant Analog_Value := 0;
    low: constant Analog_Value := 150;
    med: constant Analog_Value := 200;
    high: constant Analog_Value := 700;

    -- Indicates that these objects are unreferenced on purpose.
    Pragma Unreferenced(zero, low, med); 

    -- Putting the endings on with PWM. Used by default.
    procedure write_to_m1 (anal_value: Analog_Value; 
			   in_value: Boolean) is
    begin
	
	MicroBit.IOs.Write (m1anal_pin, anal_value);

	MicroBit.IOs.Set (m1in1_pin , in_value);	
	MicroBit.IOs.Set (m1in2_pin , not in_value);	
	
    end write_to_m1;

    procedure write_to_m2 (anal_value: Analog_Value; 
			   in_value: Boolean) is 
    begin
 
	MicroBit.IOs.Write (m2anal_pin, anal_value);	

	MicroBit.IOs.Set (m2in1_pin , in_value);	
	MicroBit.IOs.Set (m2in2_pin , not in_value);	
	
    end write_to_m2;


    -- Putting the endings on without PWM
    procedure write_to_m1 (in_value1: Boolean; 
			   in_value2: Boolean) is 
    begin
 
	MicroBit.IOs.Set (m2in1_pin , in_value1);	
	MicroBit.IOs.Set (m2in2_pin , in_value2);	
	
    end write_to_m1;

    procedure write_to_m2 (in_value1: Boolean; 
			   in_value2: Boolean) is 
    begin
 
	MicroBit.IOs.Set (m2in1_pin , in_value1);	
	MicroBit.IOs.Set (m2in2_pin , in_value2);	
	
    end write_to_m2;

    procedure stop is
    begin
	write_to_m1(zero, False);
	write_to_m2(zero, False);
    end stop;
    
    procedure drive_forward is
    begin
	write_to_m1(high, True);
	write_to_m2(high, True);
    end drive_forward;

    function stop (Deadline : MicroBit.Time.Time_Ms) return Integer is
	start_time : constant MicroBit.Time.Time_Ms := MicroBit.Time.Clock;
    begin

	while MicroBit.Time.Clock - start_time < Deadline loop
	    write_to_m1(False, False);
	    write_to_m2(False, False);
	    return 1;
	end loop;
	return -1;
	
    end stop;


    function drive_forward (Deadline : MicroBit.Time.Time_Ms) return Integer is
	start_time : constant MicroBit.Time.Time_Ms := MicroBit.Time.Clock;
    begin

	while MicroBit.Time.Clock - start_time < Deadline loop
	    write_to_m1(high, True);
	    write_to_m2(high, True);
	    return 1;
	end loop;
	return -1;
	
    end drive_forward;


    function drive_backward (Deadline : MicroBit.Time.Time_Ms) return Integer is
	start_time : constant MicroBit.Time.Time_Ms := MicroBit.Time.Clock;
    begin
	
	while MicroBit.Time.Clock - start_time < Deadline loop
	    write_to_m1(high, False);
	    write_to_m2(high, False);
	    return 1;
	end loop;
	return -1;
	
    end drive_backward;
    
    
    function turn_left (Deadline : MicroBit.Time.Time_Ms) return Integer is
	start_time : constant MicroBit.Time.Time_Ms := MicroBit.Time.Clock;
    begin

	ddl:
	while MicroBit.Time.Clock - start_time < Deadline loop
	    write_to_m1(high, True);
	    write_to_m2(high, False);
	    MicroBit.Time.Delay_Ms(50);
	    exit ddl when MicroBit.Time.Clock - start_time < Deadline;
	    stop;
	    return 1;
	end loop ddl;
	return -1;
	
    end turn_left;


    function turn_right (Deadline : MicroBit.Time.Time_Ms) return Integer is
	start_time : constant MicroBit.Time.Time_Ms := MicroBit.Time.Clock;
    begin

	ddl:
	while MicroBit.Time.Clock - start_time < Deadline loop
	    write_to_m1(high, False);
	    write_to_m2(high, True);
	    MicroBit.Time.Delay_Ms(50);
	    stop;
	    exit ddl when MicroBit.Time.Clock - start_time < Deadline;
	    return 1;
	end loop ddl;
	return -1;
	
    end turn_right;


   
    
    function turn_around( Deadline : MicroBit.Time.Time_Ms) return Integer is
	start_time : constant MicroBit.Time.Time_Ms := MicroBit.Time.Clock;
	temp: Integer := 0;
    begin
	
	ddl:
	while MicroBit.Time.Clock - start_time < Deadline loop
	    temp := turn_right(Deadline/2);
	    temp := turn_right(Deadline/2);
	    exit ddl when MicroBit.Time.Clock - start_time < Deadline;
	    return 1;
	end loop ddl;
	return temp;
	
    end turn_around;
    
    
end Nav;
