package accelerometer is

    type acc_data is range -2 ** 9 .. 2 ** 9 - 1;
    
    procedure use_display;

    function get_x return acc_data;
    function get_y return acc_data;
    function get_z return acc_data;

end accelerometer;
