------------------------------------------------------------------------------
--                                                                          --
--                       Copyright (C) 2018, AdaCore                        --
--                                                                          --
--  Redistribution and use in source and binary forms, with or without      --
--  modification, are permitted provided that the following conditions are  --
--  met:                                                                    --
--     1. Redistributions of source code must retain the above copyright    --
--        notice, this list of conditions and the following disclaimer.     --
--     2. Redistributions in binary form must reproduce the above copyright --
--        notice, this list of conditions and the following disclaimer in   --
--        the documentation and/or other materials provided with the        --
--        distribution.                                                     --
--     3. Neither the name of the copyright holder nor the names of its     --
--        contributors may be used to endorse or promote products derived   --
--        from this software without specific prior written permission.     --
--                                                                          --
--   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    --
--   "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      --
--   LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  --
--   A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   --
--   HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, --
--   SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       --
--   LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  --
--   DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  --
--   THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    --
--   (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  --
--   OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   --
--                                                                          --
------------------------------------------------------------------------------

with MicroBit.IOs;
with MicroBit.Time; use type Microbit.Time.Time_Ms;

--with MicroBit.Display;

package body Sensor_v2 is

    EchoPin : constant MicroBit.IOs.Pin_Id := 3;
    TrigPin : constant MicroBit.IOs.Pin_Id := 4;

    duration_echo_us: travel_time_us; -- Duration of the pulse from ECHO pin measured in MicroSeconds


   -- d: Integer;
    time_start: MicroBit.Time.Time_Ms;
    measurement_cycle: constant MicroBit.Time.Time_Ms := 60;

    function read return travel_time_us is
    begin


    duration_echo_us := 0;

    MicroBit.IOs.Set(TrigPin, False);
    MicroBit.Time.HAL_Delay.Delay_Microseconds(10);

    MicroBit.IOs.Set(TrigPin, True);
    MicroBit.Time.HAL_Delay.Delay_Microseconds(10);
    MicroBit.IOs.Set(TrigPin, False);

   time_start := MicroBit.Time.Clock;



    while MicroBit.Time.Clock-time_start < measurement_cycle loop

	if MicroBit.IOs.Set(EchoPin) then

	    MicroBit.Time.HAL_Delay.Delay_Microseconds(1);
	    if MicroBit.IOs.Set(EchoPin) then
		duration_echo_us := duration_echo_us + 1;
	   -- else
		--MicroBit.Display.Display( Integer'Image( d ) );
	    end if;

	end if;

      end loop;
        return duration_echo_us;
end read;



end Sensor_v2;
