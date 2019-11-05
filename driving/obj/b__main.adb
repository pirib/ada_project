pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E76 : Short_Integer; pragma Import (Ada, E76, "cortex_m__nvic_E");
   E47 : Short_Integer; pragma Import (Ada, E47, "mma8653_E");
   E71 : Short_Integer; pragma Import (Ada, E71, "nrf51__events_E");
   E19 : Short_Integer; pragma Import (Ada, E19, "nrf51__gpio_E");
   E90 : Short_Integer; pragma Import (Ada, E90, "nrf51__gpio__tasks_and_events_E");
   E73 : Short_Integer; pragma Import (Ada, E73, "nrf51__interrupts_E");
   E29 : Short_Integer; pragma Import (Ada, E29, "nrf51__rtc_E");
   E32 : Short_Integer; pragma Import (Ada, E32, "nrf51__spi_master_E");
   E55 : Short_Integer; pragma Import (Ada, E55, "nrf51__tasks_E");
   E88 : Short_Integer; pragma Import (Ada, E88, "nrf51__adc_E");
   E53 : Short_Integer; pragma Import (Ada, E53, "nrf51__clock_E");
   E92 : Short_Integer; pragma Import (Ada, E92, "nrf51__ppi_E");
   E36 : Short_Integer; pragma Import (Ada, E36, "nrf51__timers_E");
   E39 : Short_Integer; pragma Import (Ada, E39, "nrf51__twi_E");
   E07 : Short_Integer; pragma Import (Ada, E07, "nrf51__device_E");
   E45 : Short_Integer; pragma Import (Ada, E45, "microbit__i2c_E");
   E43 : Short_Integer; pragma Import (Ada, E43, "microbit__accelerometer_E");
   E86 : Short_Integer; pragma Import (Ada, E86, "microbit__ios_E");
   E98 : Short_Integer; pragma Import (Ada, E98, "microbit__servos_E");
   E51 : Short_Integer; pragma Import (Ada, E51, "microbit__time_E");
   E82 : Short_Integer; pragma Import (Ada, E82, "chore_E");
   E49 : Short_Integer; pragma Import (Ada, E49, "microbit__display_E");
   E04 : Short_Integer; pragma Import (Ada, E04, "accelerometer_E");
   E84 : Short_Integer; pragma Import (Ada, E84, "nav_E");
   E94 : Short_Integer; pragma Import (Ada, E94, "qjs_E");
   E96 : Short_Integer; pragma Import (Ada, E96, "sensor_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);


   procedure adainit is
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");

      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      null;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;


      E76 := E76 + 1;
      E47 := E47 + 1;
      E71 := E71 + 1;
      E19 := E19 + 1;
      E90 := E90 + 1;
      Nrf51.Interrupts'Elab_Body;
      E73 := E73 + 1;
      E29 := E29 + 1;
      E32 := E32 + 1;
      E55 := E55 + 1;
      E88 := E88 + 1;
      E53 := E53 + 1;
      E92 := E92 + 1;
      E36 := E36 + 1;
      E39 := E39 + 1;
      Nrf51.Device'Elab_Spec;
      E07 := E07 + 1;
      E45 := E45 + 1;
      Microbit.Accelerometer'Elab_Body;
      E43 := E43 + 1;
      Microbit.Ios'Elab_Spec;
      Microbit.Ios'Elab_Body;
      E86 := E86 + 1;
      E98 := E98 + 1;
      Microbit.Time'Elab_Body;
      E51 := E51 + 1;
      E82 := E82 + 1;
      Microbit.Display'Elab_Body;
      E49 := E49 + 1;
      E04 := E04 + 1;
      E84 := E84 + 1;
      E94 := E94 + 1;
      E96 := E96 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   F:\Code\Git\ada_project\driving\obj\chore.o
   --   F:\Code\Git\ada_project\driving\obj\accelerometer.o
   --   F:\Code\Git\ada_project\driving\obj\nav.o
   --   F:\Code\Git\ada_project\driving\obj\qjs.o
   --   F:\Code\Git\ada_project\driving\obj\sensor.o
   --   F:\Code\Git\ada_project\driving\obj\main.o
   --   -LF:\Code\Git\ada_project\driving\obj\
   --   -LF:\Code\Git\ada_project\driving\obj\
   --   -LF:\Code\Git\ada_project\Ada_Drivers_Library\boards\MicroBit\obj\zfp_lib_Debug\
   --   -LD:\software\gnatelf\arm-eabi\lib\gnat\zfp-cortex-m0\adalib\
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
