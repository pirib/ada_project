pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E68 : Short_Integer; pragma Import (Ada, E68, "cortex_m__nvic_E");
   E63 : Short_Integer; pragma Import (Ada, E63, "nrf51__events_E");
   E17 : Short_Integer; pragma Import (Ada, E17, "nrf51__gpio_E");
   E78 : Short_Integer; pragma Import (Ada, E78, "nrf51__gpio__tasks_and_events_E");
   E65 : Short_Integer; pragma Import (Ada, E65, "nrf51__interrupts_E");
   E27 : Short_Integer; pragma Import (Ada, E27, "nrf51__rtc_E");
   E30 : Short_Integer; pragma Import (Ada, E30, "nrf51__spi_master_E");
   E47 : Short_Integer; pragma Import (Ada, E47, "nrf51__tasks_E");
   E76 : Short_Integer; pragma Import (Ada, E76, "nrf51__adc_E");
   E45 : Short_Integer; pragma Import (Ada, E45, "nrf51__clock_E");
   E80 : Short_Integer; pragma Import (Ada, E80, "nrf51__ppi_E");
   E34 : Short_Integer; pragma Import (Ada, E34, "nrf51__timers_E");
   E37 : Short_Integer; pragma Import (Ada, E37, "nrf51__twi_E");
   E05 : Short_Integer; pragma Import (Ada, E05, "nrf51__device_E");
   E74 : Short_Integer; pragma Import (Ada, E74, "microbit__ios_E");
   E43 : Short_Integer; pragma Import (Ada, E43, "microbit__time_E");
   E41 : Short_Integer; pragma Import (Ada, E41, "microbit__display_E");
   E82 : Short_Integer; pragma Import (Ada, E82, "nav_E");
   E84 : Short_Integer; pragma Import (Ada, E84, "sensor_E");

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


      E68 := E68 + 1;
      E63 := E63 + 1;
      E17 := E17 + 1;
      E78 := E78 + 1;
      Nrf51.Interrupts'Elab_Body;
      E65 := E65 + 1;
      E27 := E27 + 1;
      E30 := E30 + 1;
      E47 := E47 + 1;
      E76 := E76 + 1;
      E45 := E45 + 1;
      E80 := E80 + 1;
      E34 := E34 + 1;
      E37 := E37 + 1;
      Nrf51.Device'Elab_Spec;
      E05 := E05 + 1;
      Microbit.Ios'Elab_Spec;
      Microbit.Ios'Elab_Body;
      E74 := E74 + 1;
      Microbit.Time'Elab_Body;
      E43 := E43 + 1;
      Microbit.Display'Elab_Body;
      E41 := E41 + 1;
      E82 := E82 + 1;
      E84 := E84 + 1;
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
   --   F:\Code\Git\ada_project\driving\obj\nav.o
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
