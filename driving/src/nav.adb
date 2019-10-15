with MicroBit.IOs; use MicroBit.IOs;   -- Visible to the body of Drive

package body Nav is

    --  PINS

    --  Motor 1 Pins left motor

    m1anal_pin: constant Pin_Id := 0; 
    m1in1_pin: constant Pin_Id := 16;
    m1in2_pin: constant Pin_Id := 15;      

    --  Motor 2 Pins right motor
    
    m2anal_pin: constant Pin_Id := 1;
    m2in1_pin: constant Pin_Id := 8;
    m2in2_pin: constant Pin_Id := 12;      
    
    
    --  Variables
    
    zero: constant Analog_Value := 0; 
    
    low:  constant Analog_Value := 500;
    med:  constant Analog_Value := 750;
    high: constant Analog_Value := 1000;


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




    procedure drive_forward is
    begin

	write_to_m1(high, True);
	write_to_m2(high, True);

    end drive_forward;


    procedure drive_backward is
    begin

	write_to_m1(high, False);
	write_to_m2(high, False);

    end drive_backward;
    
    
    procedure turn_left is
    begin

	write_to_m1(high, True);
	write_to_m2(high, False);
	
    end turn_left;


    procedure turn_right is
    begin
	
	write_to_m1(high, False);
	write_to_m2(high, True);

    end turn_right;


    procedure stop is
    begin
	
	write_to_m1(False, False);
	write_to_m2(False, False);

    end stop;

    
    
   
    
end Nav;
