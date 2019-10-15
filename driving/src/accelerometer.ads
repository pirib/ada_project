
package accelerometer is

    type acc_data is range -2 ** 9 .. 2 ** 9 - 1;
    
    tilt_stop_motors_y: constant acc_data := 65;
--      tilt_stop_motors_x: constant acc_data := 65;
    
    procedure Initialize;
    function Initialized return Boolean;

    procedure show_on_display;

    function get_x return acc_data;
    function get_y return acc_data;
    function get_z return acc_data;

end accelerometer;
