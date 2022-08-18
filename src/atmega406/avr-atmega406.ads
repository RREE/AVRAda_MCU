---------------------------------------------------------------------------
-- The AVR-Ada Library is free software;  you can redistribute it and/or --
-- modify it under terms of the  GNU General Public License as published --
-- by  the  Free Software  Foundation;  either  version 2, or  (at  your --
-- option) any later version.  The AVR-Ada Library is distributed in the --
-- hope that it will be useful, but  WITHOUT ANY WARRANTY;  without even --
-- the  implied warranty of MERCHANTABILITY or FITNESS FOR A  PARTICULAR --
-- PURPOSE. See the GNU General Public License for more details.         --
--                                                                       --
-- As a special exception, if other files instantiate generics from this --
-- unit,  or  you  link  this  unit  with  other  files  to  produce  an --
-- executable   this  unit  does  not  by  itself  cause  the  resulting --
-- executable to  be  covered by the  GNU General  Public License.  This --
-- exception does  not  however  invalidate  any  other reasons why  the --
-- executable file might be covered by the GNU Public License.           --
---------------------------------------------------------------------------

with System;               use System;  --   make Address visible

package AVR.ATmega406 is
   pragma Pure (AVR.ATmega406);

   CVS_Version : constant String := "$Id: avr-atmega406.ads 881 2008-11-16 22:55:31Z Rolf_Ebert $";


   --
   --  memory sizes
   --
   Flash_Size               : constant := 16#a000#;
   Flash_End                : constant := 16#9fff#;
   EEprom_Size              : constant := 16#0200#;
   E2end                    : constant := 16#01ff#;
   Int_SRAM_Start_Addr      : constant := 16#100#;
   Int_SRAM_Size            : constant := 16#800#;

   --
   --  interrupts
   --
   Number_Of_Interrupts     : constant := 23;

   --  External Pin, Power-on Reset, Brown-out Reset and Watchdog Reset
   Sig_RESET                : constant        :=  0;
   Sig_RESET_String         : constant String := "__vector_0";
   --  Battery Protection Interrupt
   Sig_BPINT                : constant        :=  1;
   Sig_BPINT_String         : constant String := "__vector_1";
   --  External Interrupt Request 0
   Sig_INT0                 : constant        :=  2;
   Sig_INT0_String          : constant String := "__vector_2";
   --  External Interrupt Request 1
   Sig_INT1                 : constant        :=  3;
   Sig_INT1_String          : constant String := "__vector_3";
   --  External Interrupt Request 2
   Sig_INT2                 : constant        :=  4;
   Sig_INT2_String          : constant String := "__vector_4";
   --  External Interrupt Request 3
   Sig_INT3                 : constant        :=  5;
   Sig_INT3_String          : constant String := "__vector_5";
   --  Pin Change Interrupt 0
   Sig_PCINT0               : constant        :=  6;
   Sig_PCINT0_String        : constant String := "__vector_6";
   --  Pin Change Interrupt 1
   Sig_PCINT1               : constant        :=  7;
   Sig_PCINT1_String        : constant String := "__vector_7";
   --  Watchdog Timeout Interrupt
   Sig_WDT                  : constant        :=  8;
   Sig_WDT_String           : constant String := "__vector_8";
   --  Wakeup timer overflow
   Sig_WAKE_UP              : constant        :=  9;
   Sig_WAKE_UP_String       : constant String := "__vector_9";
   --  Timer/Counter 1 Compare Match
   Sig_TIM1_COMP            : constant        := 10;
   Sig_TIM1_COMP_String     : constant String := "__vector_10";
   --  Timer/Counter 1 Overflow
   Sig_TIM1_OVF             : constant        := 11;
   Sig_TIM1_OVF_String      : constant String := "__vector_11";
   --  Timer/Counter0 Compare A Match
   Sig_TIM0_COMPA           : constant        := 12;
   Sig_TIM0_COMPA_String    : constant String := "__vector_12";
   --  Timer/Counter0 Compare B Match
   Sig_TIM0_COMPB           : constant        := 13;
   Sig_TIM0_COMPB_String    : constant String := "__vector_13";
   --  Timer/Counter0 Overflow
   Sig_TIM0_OVF             : constant        := 14;
   Sig_TIM0_OVF_String      : constant String := "__vector_14";
   --  Two-Wire Bus Connect/Disconnect
   Sig_TWI_BUS_CD           : constant        := 15;
   Sig_TWI_BUS_CD_String    : constant String := "__vector_15";
   --  Two-Wire Serial Interface
   Sig_TWI                  : constant        := 16;
   Sig_TWI_String           : constant String := "__vector_16";
   --  Voltage ADC Conversion Complete
   Sig_VADC                 : constant        := 17;
   Sig_VADC_String          : constant String := "__vector_17";
   --  Coulomb Counter ADC Conversion Complete
   Sig_CCADC_CONV           : constant        := 18;
   Sig_CCADC_CONV_String    : constant String := "__vector_18";
   --  Coloumb Counter ADC Regular Current
   Sig_CCADC_REG_CUR        : constant        := 19;
   Sig_CCADC_REG_CUR_String : constant String := "__vector_19";
   --  Coloumb Counter ADC Accumulator
   Sig_CCADC_ACC            : constant        := 20;
   Sig_CCADC_ACC_String     : constant String := "__vector_20";
   --  EEPROM Ready
   Sig_EE_READY             : constant        := 21;
   Sig_EE_READY_String      : constant String := "__vector_21";
   --  Store Program Memory Ready
   Sig_SPM_READY            : constant        := 22;
   Sig_SPM_READY_String     : constant String := "__vector_22";


   --
   --  I/O registers
   --

   --  Battery Protection Parameter Lock Register
   BPPLR                    : constant Address    := 16#f8#;
   --  Battery Protection Parameter Lock
   BPPL_Bit                 : constant Bit_Number := 0;
   BPPL                     : constant Nat8       := 16#01#;
   --  Battery Protection Parameter Lock Enable
   BPPLE_Bit                : constant Bit_Number := 1;
   BPPLE                    : constant Nat8       := 16#02#;

   --  Battery Protection Control Register
   BPCR                     : constant Address    := 16#f7#;
   CCD_Bit                  : constant Bit_Number := 0;
   CCD                      : constant Nat8       := 16#01#;
   DCD_Bit                  : constant Bit_Number := 1;
   DCD                      : constant Nat8       := 16#02#;
   SCD_Bit                  : constant Bit_Number := 2;
   SCD                      : constant Nat8       := 16#04#;
   DUVD_Bit                 : constant Bit_Number := 3;
   DUVD                     : constant Nat8       := 16#08#;

   --  Current Battery Protection Timing Register
   CBPTR                    : constant Address    := 16#f6#;
   OCPT0_Bit                : constant Bit_Number := 0;
   OCPT0                    : constant Nat8       := 16#01#;
   OCPT1_Bit                : constant Bit_Number := 1;
   OCPT1                    : constant Nat8       := 16#02#;
   OCPT2_Bit                : constant Bit_Number := 2;
   OCPT2                    : constant Nat8       := 16#04#;
   OCPT3_Bit                : constant Bit_Number := 3;
   OCPT3                    : constant Nat8       := 16#08#;
   SCPT0_Bit                : constant Bit_Number := 4;
   SCPT0                    : constant Nat8       := 16#10#;
   SCPT1_Bit                : constant Bit_Number := 5;
   SCPT1                    : constant Nat8       := 16#20#;
   SCPT2_Bit                : constant Bit_Number := 6;
   SCPT2                    : constant Nat8       := 16#40#;
   SCPT3_Bit                : constant Bit_Number := 7;
   SCPT3                    : constant Nat8       := 16#80#;

   --  Battery Protection OverCurrent Detection Level Register
   BPOCD                    : constant Address    := 16#f5#;
   CCDL0_Bit                : constant Bit_Number := 0;
   CCDL0                    : constant Nat8       := 16#01#;
   CCDL1_Bit                : constant Bit_Number := 1;
   CCDL1                    : constant Nat8       := 16#02#;
   CCDL2_Bit                : constant Bit_Number := 2;
   CCDL2                    : constant Nat8       := 16#04#;
   CCDL3_Bit                : constant Bit_Number := 3;
   CCDL3                    : constant Nat8       := 16#08#;
   DCDL0_Bit                : constant Bit_Number := 4;
   DCDL0                    : constant Nat8       := 16#10#;
   DCDL1_Bit                : constant Bit_Number := 5;
   DCDL1                    : constant Nat8       := 16#20#;
   DCDL2_Bit                : constant Bit_Number := 6;
   DCDL2                    : constant Nat8       := 16#40#;
   DCDL3_Bit                : constant Bit_Number := 7;
   DCDL3                    : constant Nat8       := 16#80#;

   --  Battery Protection Short-Circuit Detection Level Register
   BPSCD                    : constant Address    := 16#f4#;
   SCDL0_Bit                : constant Bit_Number := 0;
   SCDL0                    : constant Nat8       := 16#01#;
   SCDL1_Bit                : constant Bit_Number := 1;
   SCDL1                    : constant Nat8       := 16#02#;
   SCDL2_Bit                : constant Bit_Number := 2;
   SCDL2                    : constant Nat8       := 16#04#;
   SCDL3_Bit                : constant Bit_Number := 3;
   SCDL3                    : constant Nat8       := 16#08#;

   --  Battery Protection Deep Under Voltage Register
   BPDUV                    : constant Address    := 16#f3#;
   DUDL0_Bit                : constant Bit_Number := 0;
   DUDL0                    : constant Nat8       := 16#01#;
   DUDL1_Bit                : constant Bit_Number := 1;
   DUDL1                    : constant Nat8       := 16#02#;
   DUDL2_Bit                : constant Bit_Number := 2;
   DUDL2                    : constant Nat8       := 16#04#;
   DUDL3_Bit                : constant Bit_Number := 3;
   DUDL3                    : constant Nat8       := 16#08#;
   DUVT0_Bit                : constant Bit_Number := 4;
   DUVT0                    : constant Nat8       := 16#10#;
   DUVT1_Bit                : constant Bit_Number := 5;
   DUVT1                    : constant Nat8       := 16#20#;

   --  Battery Protection Interrupt Register
   BPIR                     : constant Address    := 16#f2#;
   SCIE_Bit                 : constant Bit_Number := 0;
   SCIE                     : constant Nat8       := 16#01#;
   DOCIE_Bit                : constant Bit_Number := 1;
   DOCIE                    : constant Nat8       := 16#02#;
   COCIE_Bit                : constant Bit_Number := 2;
   COCIE                    : constant Nat8       := 16#04#;
   --  Deep Under-voltage Early Warning Interrupt Enable
   DUVIE_Bit                : constant Bit_Number := 3;
   DUVIE                    : constant Nat8       := 16#08#;
   SCIF_Bit                 : constant Bit_Number := 4;
   SCIF                     : constant Nat8       := 16#10#;
   DOCIF_Bit                : constant Bit_Number := 5;
   DOCIF                    : constant Nat8       := 16#20#;
   --  Charge Over-current Protection Activated Interrupt Flag
   COCIF_Bit                : constant Bit_Number := 6;
   COCIF                    : constant Nat8       := 16#40#;
   --  Deep Under-voltage Early Warning Interrupt Flag
   DUVIF_Bit                : constant Bit_Number := 7;
   DUVIF                    : constant Nat8       := 16#80#;

   --  Cell Balancing Control Register
   CBCR                     : constant Address    := 16#f1#;
   --  Battery Protection Parameter Lock
   CBE1_Bit                 : constant Bit_Number := 0;
   CBE1                     : constant Nat8       := 16#01#;
   --  Cell Balancing Enable 2
   CBE2_Bit                 : constant Bit_Number := 1;
   CBE2                     : constant Nat8       := 16#02#;
   --  Cell Balancing Enable 4
   CBE3_Bit                 : constant Bit_Number := 2;
   CBE3                     : constant Nat8       := 16#04#;
   --  Cell Balancing Enable 4
   CBE4_Bit                 : constant Bit_Number := 3;
   CBE4                     : constant Nat8       := 16#08#;

   FCSR                     : constant Address    := 16#f0#;
   --  Precharge FET disable
   PFD_Bit                  : constant Bit_Number := 0;
   PFD                      : constant Nat8       := 16#01#;
   --  Charge FET Enable
   CFE_Bit                  : constant Bit_Number := 1;
   CFE                      : constant Nat8       := 16#02#;
   --  Discharge FET Enable
   DFE_Bit                  : constant Bit_Number := 2;
   DFE                      : constant Nat8       := 16#04#;
   --  Current Protection Status
   CPS_Bit                  : constant Bit_Number := 3;
   CPS                      : constant Nat8       := 16#08#;
   --  Pulse Width Modulation Modulation of OPC output
   PWMOPC_Bit               : constant Bit_Number := 4;
   PWMOPC                   : constant Nat8       := 16#10#;
   --  Pulse Width Modulation of OC output
   PWMOC_Bit                : constant Bit_Number := 5;
   PWMOC                    : constant Nat8       := 16#20#;

   --  CC-ADC Instantaneous Current
   CADICH                   : constant Address    := 16#e9#;
   --  When the CADSE bit is written to one, the ongoing CC-ADC conversion
   --    is aborted, and the CC-ADC enters Regular Current detection mode.
   CADICH0_Bit              : constant Bit_Number := 0;
   CADICH0                  : constant Nat8       := 16#01#;
   --  The CADSI bits determine the current sampling interval for the
   --    Regular Current detection in Power-down mode. The actual settings
   --      remain to be determined.
   CADICH1_Bit              : constant Bit_Number := 1;
   CADICH1                  : constant Nat8       := 16#02#;
   --  The CADSI bits determine the current sampling interval for the
   --    Regular Current detection in Power-down mode. The actual settings
   --      remain to be determined.
   CADICH2_Bit              : constant Bit_Number := 2;
   CADICH2                  : constant Nat8       := 16#04#;
   --  The CADACT bits determine the conversion time for the Accumulate
   --    Current output as shown in Table 43.
   CADICH3_Bit              : constant Bit_Number := 3;
   CADICH3                  : constant Nat8       := 16#08#;
   --  The CADACT bits determine the conversion time for the Accumulate
   --    Current output as shown in Table 43.
   CADICH4_Bit              : constant Bit_Number := 4;
   CADICH4                  : constant Nat8       := 16#10#;
   CADICH5_Bit              : constant Bit_Number := 5;
   CADICH5                  : constant Nat8       := 16#20#;
   CADICH6_Bit              : constant Bit_Number := 6;
   CADICH6                  : constant Nat8       := 16#40#;
   --  When the CADEN bit is cleared (zero), the CC-ADC is disabled. When
   --    the CADEN bit is set (one), the CC-ADC will continuously measure
   --      the voltage drop over the external sense resistor RSENSE. In
   --        Power-down, only the Regular Current detection is active. In
   --          Power-off, the CC-ADC is always disabled.
   CADICH7_Bit              : constant Bit_Number := 7;
   CADICH7                  : constant Nat8       := 16#80#;

   --  CC-ADC Instantaneous Current
   CADICL                   : constant Address    := 16#e8#;
   CADIC                    : constant Address    := 16#e8#;
   --  When the CADSE bit is written to one, the ongoing CC-ADC conversion
   --    is aborted, and the CC-ADC enters Regular Current detection mode.
   CADICL0_Bit              : constant Bit_Number := 0;
   CADICL0                  : constant Nat8       := 16#01#;
   --  The CADSI bits determine the current sampling interval for the
   --    Regular Current detection in Power-down mode. The actual settings
   --      remain to be determined.
   CADICL1_Bit              : constant Bit_Number := 1;
   CADICL1                  : constant Nat8       := 16#02#;
   --  The CADSI bits determine the current sampling interval for the
   --    Regular Current detection in Power-down mode. The actual settings
   --      remain to be determined.
   CADICL2_Bit              : constant Bit_Number := 2;
   CADICL2                  : constant Nat8       := 16#04#;
   --  The CADACT bits determine the conversion time for the Accumulate
   --    Current output as shown in Table 43.
   CADICL3_Bit              : constant Bit_Number := 3;
   CADICL3                  : constant Nat8       := 16#08#;
   --  The CADACT bits determine the conversion time for the Accumulate
   --    Current output as shown in Table 43.
   CADICL4_Bit              : constant Bit_Number := 4;
   CADICL4                  : constant Nat8       := 16#10#;
   CADICL5_Bit              : constant Bit_Number := 5;
   CADICL5                  : constant Nat8       := 16#20#;
   CADICL6_Bit              : constant Bit_Number := 6;
   CADICL6                  : constant Nat8       := 16#40#;
   --  When the CADEN bit is cleared (zero), the CC-ADC is disabled. When
   --    the CADEN bit is set (one), the CC-ADC will continuously measure
   --      the voltage drop over the external sense resistor RSENSE. In
   --        Power-down, only the Regular Current detection is active. In
   --          Power-off, the CC-ADC is always disabled.
   CADICL7_Bit              : constant Bit_Number := 7;
   CADICL7                  : constant Nat8       := 16#80#;

   --  CC-ADC Regular Discharge Current
   CADRDC                   : constant Address    := 16#e7#;
   --  When the CADSE bit is written to one, the ongoing CC-ADC conversion
   --    is aborted, and the CC-ADC enters Regular Current detection mode.
   CADRDC0_Bit              : constant Bit_Number := 0;
   CADRDC0                  : constant Nat8       := 16#01#;
   --  The CADSI bits determine the current sampling interval for the
   --    Regular Current detection in Power-down mode. The actual settings
   --      remain to be determined.
   CADRDC1_Bit              : constant Bit_Number := 1;
   CADRDC1                  : constant Nat8       := 16#02#;
   --  The CADSI bits determine the current sampling interval for the
   --    Regular Current detection in Power-down mode. The actual settings
   --      remain to be determined.
   CADRDC2_Bit              : constant Bit_Number := 2;
   CADRDC2                  : constant Nat8       := 16#04#;
   --  The CADACT bits determine the conversion time for the Accumulate
   --    Current output as shown in Table 43.
   CADRDC3_Bit              : constant Bit_Number := 3;
   CADRDC3                  : constant Nat8       := 16#08#;
   --  The CADACT bits determine the conversion time for the Accumulate
   --    Current output as shown in Table 43.
   CADRDC4_Bit              : constant Bit_Number := 4;
   CADRDC4                  : constant Nat8       := 16#10#;
   CADRDC5_Bit              : constant Bit_Number := 5;
   CADRDC5                  : constant Nat8       := 16#20#;
   CADRDC6_Bit              : constant Bit_Number := 6;
   CADRDC6                  : constant Nat8       := 16#40#;
   --  When the CADEN bit is cleared (zero), the CC-ADC is disabled. When
   --    the CADEN bit is set (one), the CC-ADC will continuously measure
   --      the voltage drop over the external sense resistor RSENSE. In
   --        Power-down, only the Regular Current detection is active. In
   --          Power-off, the CC-ADC is always disabled.
   CADRDC7_Bit              : constant Bit_Number := 7;
   CADRDC7                  : constant Nat8       := 16#80#;

   --  CC-ADC Regular Charge Current
   CADRCC                   : constant Address    := 16#e6#;
   --  When the CADSE bit is written to one, the ongoing CC-ADC conversion
   --    is aborted, and the CC-ADC enters Regular Current detection mode.
   CADRCC0_Bit              : constant Bit_Number := 0;
   CADRCC0                  : constant Nat8       := 16#01#;
   --  The CADSI bits determine the current sampling interval for the
   --    Regular Current detection in Power-down mode. The actual settings
   --      remain to be determined.
   CADRCC1_Bit              : constant Bit_Number := 1;
   CADRCC1                  : constant Nat8       := 16#02#;
   --  The CADSI bits determine the current sampling interval for the
   --    Regular Current detection in Power-down mode. The actual settings
   --      remain to be determined.
   CADRCC2_Bit              : constant Bit_Number := 2;
   CADRCC2                  : constant Nat8       := 16#04#;
   --  The CADACT bits determine the conversion time for the Accumulate
   --    Current output as shown in Table 43.
   CADRCC3_Bit              : constant Bit_Number := 3;
   CADRCC3                  : constant Nat8       := 16#08#;
   --  The CADACT bits determine the conversion time for the Accumulate
   --    Current output as shown in Table 43.
   CADRCC4_Bit              : constant Bit_Number := 4;
   CADRCC4                  : constant Nat8       := 16#10#;
   CADRCC5_Bit              : constant Bit_Number := 5;
   CADRCC5                  : constant Nat8       := 16#20#;
   CADRCC6_Bit              : constant Bit_Number := 6;
   CADRCC6                  : constant Nat8       := 16#40#;
   --  When the CADEN bit is cleared (zero), the CC-ADC is disabled. When
   --    the CADEN bit is set (one), the CC-ADC will continuously measure
   --      the voltage drop over the external sense resistor RSENSE. In
   --        Power-down, only the Regular Current detection is active. In
   --          Power-off, the CC-ADC is always disabled.
   CADRCC7_Bit              : constant Bit_Number := 7;
   CADRCC7                  : constant Nat8       := 16#80#;

   --  CC-ADC Control and Status Register B
   CADCSRB                  : constant Address    := 16#e5#;
   --  CC-ADC Instantaneous Current Interrupt Flag
   CADICIF_Bit              : constant Bit_Number := 0;
   CADICIF                  : constant Nat8       := 16#01#;
   --  CC-ADC Accumulate Current Interrupt Flag
   CADRCIF_Bit              : constant Bit_Number := 1;
   CADRCIF                  : constant Nat8       := 16#02#;
   --  CC-ADC Accumulate Current Interrupt Flag
   CADACIF_Bit              : constant Bit_Number := 2;
   CADACIF                  : constant Nat8       := 16#04#;
   --  CAD Instantenous Current Interrupt Enable
   CADICIE_Bit              : constant Bit_Number := 4;
   CADICIE                  : constant Nat8       := 16#10#;
   --  Regular Current Interrupt Enable
   CADRCIE_Bit              : constant Bit_Number := 5;
   CADRCIE                  : constant Nat8       := 16#20#;
   CADACIE_Bit              : constant Bit_Number := 6;
   CADACIE                  : constant Nat8       := 16#40#;

   --  CC-ADC Control and Status Register A
   CADCSRA                  : constant Address    := 16#e4#;
   --  When the CADSE bit is written to one, the ongoing CC-ADC conversion
   --    is aborted, and the CC-ADC enters Regular Current detection mode.
   CADSE_Bit                : constant Bit_Number := 0;
   CADSE                    : constant Nat8       := 16#01#;
   --  The CADSI bits determine the current sampling interval for the
   --    Regular Current detection in Power-down mode. The actual settings
   --      remain to be determined.
   CADSI0_Bit               : constant Bit_Number := 1;
   CADSI0                   : constant Nat8       := 16#02#;
   --  The CADSI bits determine the current sampling interval for the
   --    Regular Current detection in Power-down mode. The actual settings
   --      remain to be determined.
   CADSI1_Bit               : constant Bit_Number := 2;
   CADSI1                   : constant Nat8       := 16#04#;
   --  CC_ADC Accumulate Current Select Bit 0
   CADAS0_Bit               : constant Bit_Number := 3;
   CADAS0                   : constant Nat8       := 16#08#;
   --  CC_ADC Accumulate Current Select Bit 1
   CADAS1_Bit               : constant Bit_Number := 4;
   CADAS1                   : constant Nat8       := 16#10#;
   --  CC_ADC Update Busy
   CADUB_Bit                : constant Bit_Number := 5;
   CADUB                    : constant Nat8       := 16#20#;
   --  When the CADEN bit is cleared (zero), the CC-ADC is disabled. When
   --    the CADEN bit is set (one), the CC-ADC will continuously measure
   --      the voltage drop over the external sense resistor RSENSE. In
   --        Power-down, only the Regular Current detection is active. In
   --          Power-off, the CC-ADC is always disabled.
   CADEN_Bit                : constant Bit_Number := 7;
   CADEN                    : constant Nat8       := 16#80#;

   --  ADC Accumulate Current
   CADAC3                   : constant Address    := 16#e3#;
   CADAC24_Bit              : constant Bit_Number := 0;
   CADAC24                  : constant Nat8       := 16#01#;
   CADAC25_Bit              : constant Bit_Number := 1;
   CADAC25                  : constant Nat8       := 16#02#;
   CADAC26_Bit              : constant Bit_Number := 2;
   CADAC26                  : constant Nat8       := 16#04#;
   CADAC27_Bit              : constant Bit_Number := 3;
   CADAC27                  : constant Nat8       := 16#08#;
   CADAC28_Bit              : constant Bit_Number := 4;
   CADAC28                  : constant Nat8       := 16#10#;
   CADAC29_Bit              : constant Bit_Number := 5;
   CADAC29                  : constant Nat8       := 16#20#;
   CADAC30_Bit              : constant Bit_Number := 6;
   CADAC30                  : constant Nat8       := 16#40#;
   CADAC31_Bit              : constant Bit_Number := 7;
   CADAC31                  : constant Nat8       := 16#80#;

   --  ADC Accumulate Current
   CADAC2                   : constant Address    := 16#e2#;
   CADAC16_Bit              : constant Bit_Number := 0;
   CADAC16                  : constant Nat8       := 16#01#;
   CADAC17_Bit              : constant Bit_Number := 1;
   CADAC17                  : constant Nat8       := 16#02#;
   CADAC18_Bit              : constant Bit_Number := 2;
   CADAC18                  : constant Nat8       := 16#04#;
   CADAC19_Bit              : constant Bit_Number := 3;
   CADAC19                  : constant Nat8       := 16#08#;
   CADAC20_Bit              : constant Bit_Number := 4;
   CADAC20                  : constant Nat8       := 16#10#;
   CADAC21_Bit              : constant Bit_Number := 5;
   CADAC21                  : constant Nat8       := 16#20#;
   CADAC22_Bit              : constant Bit_Number := 6;
   CADAC22                  : constant Nat8       := 16#40#;
   CADAC23_Bit              : constant Bit_Number := 7;
   CADAC23                  : constant Nat8       := 16#80#;

   --  ADC Accumulate Current
   CADAC1                   : constant Address    := 16#e1#;
   CADAC08_Bit              : constant Bit_Number := 0;
   CADAC08                  : constant Nat8       := 16#01#;
   CADAC09_Bit              : constant Bit_Number := 1;
   CADAC09                  : constant Nat8       := 16#02#;
   CADAC10_Bit              : constant Bit_Number := 2;
   CADAC10                  : constant Nat8       := 16#04#;
   CADAC11_Bit              : constant Bit_Number := 3;
   CADAC11                  : constant Nat8       := 16#08#;
   CADAC12_Bit              : constant Bit_Number := 4;
   CADAC12                  : constant Nat8       := 16#10#;
   CADAC13_Bit              : constant Bit_Number := 5;
   CADAC13                  : constant Nat8       := 16#20#;
   CADAC14_Bit              : constant Bit_Number := 6;
   CADAC14                  : constant Nat8       := 16#40#;
   CADAC15_Bit              : constant Bit_Number := 7;
   CADAC15                  : constant Nat8       := 16#80#;

   --  ADC Accumulate Current
   CADAC0                   : constant Address    := 16#e0#;
   CADAC00_Bit              : constant Bit_Number := 0;
   CADAC00                  : constant Nat8       := 16#01#;
   CADAC01_Bit              : constant Bit_Number := 1;
   CADAC01                  : constant Nat8       := 16#02#;
   CADAC02_Bit              : constant Bit_Number := 2;
   CADAC02                  : constant Nat8       := 16#04#;
   CADAC03_Bit              : constant Bit_Number := 3;
   CADAC03                  : constant Nat8       := 16#08#;
   CADAC04_Bit              : constant Bit_Number := 4;
   CADAC04                  : constant Nat8       := 16#10#;
   CADAC05_Bit              : constant Bit_Number := 5;
   CADAC05                  : constant Nat8       := 16#20#;
   CADAC06_Bit              : constant Bit_Number := 6;
   CADAC06                  : constant Nat8       := 16#40#;
   CADAC07_Bit              : constant Bit_Number := 7;
   CADAC07                  : constant Nat8       := 16#80#;

   --  Bandgap Calibration of Resistor Ladder
   BGCRR                    : constant Address    := 16#d1#;
   --  Bandgap Calibration of Resistor Ladder Bit 0
   BGCR0_Bit                : constant Bit_Number := 0;
   BGCR0                    : constant Nat8       := 16#01#;
   --  Bandgap Calibration of Resistor Ladder Bit 1
   BGCR1_Bit                : constant Bit_Number := 1;
   BGCR1                    : constant Nat8       := 16#02#;
   --  Bandgap Calibration of Resistor Ladder Bit 2
   BGCR2_Bit                : constant Bit_Number := 2;
   BGCR2                    : constant Nat8       := 16#04#;
   --  Bandgap Calibration of Resistor Ladder Bit 3
   BGCR3_Bit                : constant Bit_Number := 3;
   BGCR3                    : constant Nat8       := 16#08#;
   --  Bandgap Calibration of Resistor Ladder Bit 4
   BGCR4_Bit                : constant Bit_Number := 4;
   BGCR4                    : constant Nat8       := 16#10#;
   --  Bandgap Calibration of Resistor Ladder Bit 5
   BGCR5_Bit                : constant Bit_Number := 5;
   BGCR5                    : constant Nat8       := 16#20#;
   --  Bandgap Calibration of Resistor Ladder Bit 6
   BGCR6_Bit                : constant Bit_Number := 6;
   BGCR6                    : constant Nat8       := 16#40#;
   --  Bandgap Calibration of Resistor Ladder Bit 7
   BGCR7_Bit                : constant Bit_Number := 7;
   BGCR7                    : constant Nat8       := 16#80#;

   --  Bandgap Calibration Register
   BGCCR                    : constant Address    := 16#d0#;
   --  BG Calibration of PTAT Current Bit 0
   BGCC0_Bit                : constant Bit_Number := 0;
   BGCC0                    : constant Nat8       := 16#01#;
   --  BG Calibration of PTAT Current Bit 1
   BGCC1_Bit                : constant Bit_Number := 1;
   BGCC1                    : constant Nat8       := 16#02#;
   --  BG Calibration of PTAT Current Bit 2
   BGCC2_Bit                : constant Bit_Number := 2;
   BGCC2                    : constant Nat8       := 16#04#;
   --  BG Calibration of PTAT Current Bit 3
   BGCC3_Bit                : constant Bit_Number := 3;
   BGCC3                    : constant Nat8       := 16#08#;
   --  BG Calibration of PTAT Current Bit 4
   BGCC4_Bit                : constant Bit_Number := 4;
   BGCC4                    : constant Nat8       := 16#10#;
   --  BG Calibration of PTAT Current Bit 5
   BGCC5_Bit                : constant Bit_Number := 5;
   BGCC5                    : constant Nat8       := 16#20#;
   --  Setting the BGD bit to one will disable the bandgap voltage
   --    reference. This bit must be cleared before enabling CC-ADC or
   --      V-ADC, and must remain unset while either ADC is enabled.
   BGD_Bit                  : constant Bit_Number := 7;
   BGD                      : constant Nat8       := 16#80#;

   --  Clock Control and Status Register
   CCSR                     : constant Address    := 16#c0#;
   --  Asynchronous Clock Select
   ACS_Bit                  : constant Bit_Number := 0;
   ACS                      : constant Nat8       := 16#01#;
   --  32 kHz Crystal Oscillator Enable
   XOE_Bit                  : constant Bit_Number := 1;
   XOE                      : constant Nat8       := 16#02#;

   --  TWI Bus Control and Status Register
   TWBCSR                   : constant Address    := 16#be#;
   --  TWI Bus Connect/Disconnect Interrupt Polarity
   TWBCIP_Bit               : constant Bit_Number := 0;
   TWBCIP                   : constant Nat8       := 16#01#;
   --  TWI Bus Disconnect Time-out Period
   TWBDT0_Bit               : constant Bit_Number := 1;
   TWBDT0                   : constant Nat8       := 16#02#;
   --  TWI Bus Disconnect Time-out Period
   TWBDT1_Bit               : constant Bit_Number := 2;
   TWBDT1                   : constant Nat8       := 16#04#;
   --  TWI Bus Connect/Disconnect Interrupt Enable
   TWBCIE_Bit               : constant Bit_Number := 6;
   TWBCIE                   : constant Nat8       := 16#40#;
   --  TWI Bus Connect/Disconnect Interrupt Flag
   TWBCIF_Bit               : constant Bit_Number := 7;
   TWBCIF                   : constant Nat8       := 16#80#;

   --  TWI (Slave) Address Mask Register
   TWAMR                    : constant Address    := 16#bd#;
   TWAM0_Bit                : constant Bit_Number := 1;
   TWAM0                    : constant Nat8       := 16#02#;
   TWAM1_Bit                : constant Bit_Number := 2;
   TWAM1                    : constant Nat8       := 16#04#;
   TWAM2_Bit                : constant Bit_Number := 3;
   TWAM2                    : constant Nat8       := 16#08#;
   TWAM3_Bit                : constant Bit_Number := 4;
   TWAM3                    : constant Nat8       := 16#10#;
   TWAM4_Bit                : constant Bit_Number := 5;
   TWAM4                    : constant Nat8       := 16#20#;
   TWAM5_Bit                : constant Bit_Number := 6;
   TWAM5                    : constant Nat8       := 16#40#;
   TWAM6_Bit                : constant Bit_Number := 7;
   TWAM6                    : constant Nat8       := 16#80#;

   --  TWI Control Register
   TWCR                     : constant Address    := 16#bc#;
   --  TWI Interrupt Enable
   TWIE_Bit                 : constant Bit_Number := 0;
   TWIE                     : constant Nat8       := 16#01#;
   --  TWI Enable Bit
   TWEN_Bit                 : constant Bit_Number := 2;
   TWEN                     : constant Nat8       := 16#04#;
   --  TWI Write Collition Flag
   TWWC_Bit                 : constant Bit_Number := 3;
   TWWC                     : constant Nat8       := 16#08#;
   --  TWI Stop Condition Bit
   TWSTO_Bit                : constant Bit_Number := 4;
   TWSTO                    : constant Nat8       := 16#10#;
   --  TWI Start Condition Bit
   TWSTA_Bit                : constant Bit_Number := 5;
   TWSTA                    : constant Nat8       := 16#20#;
   --  TWI Enable Acknowledge Bit
   TWEA_Bit                 : constant Bit_Number := 6;
   TWEA                     : constant Nat8       := 16#40#;
   --  TWI Interrupt Flag
   TWINT_Bit                : constant Bit_Number := 7;
   TWINT                    : constant Nat8       := 16#80#;

   --  TWI Data register
   TWDR                     : constant Address    := 16#bb#;
   --  TWI Data Register Bit 0
   TWD0_Bit                 : constant Bit_Number := 0;
   TWD0                     : constant Nat8       := 16#01#;
   --  TWI Data Register Bit 1
   TWD1_Bit                 : constant Bit_Number := 1;
   TWD1                     : constant Nat8       := 16#02#;
   --  TWI Data Register Bit 2
   TWD2_Bit                 : constant Bit_Number := 2;
   TWD2                     : constant Nat8       := 16#04#;
   --  TWI Data Register Bit 3
   TWD3_Bit                 : constant Bit_Number := 3;
   TWD3                     : constant Nat8       := 16#08#;
   --  TWI Data Register Bit 4
   TWD4_Bit                 : constant Bit_Number := 4;
   TWD4                     : constant Nat8       := 16#10#;
   --  TWI Data Register Bit 5
   TWD5_Bit                 : constant Bit_Number := 5;
   TWD5                     : constant Nat8       := 16#20#;
   --  TWI Data Register Bit 6
   TWD6_Bit                 : constant Bit_Number := 6;
   TWD6                     : constant Nat8       := 16#40#;
   --  TWI Data Register Bit 7
   TWD7_Bit                 : constant Bit_Number := 7;
   TWD7                     : constant Nat8       := 16#80#;

   --  TWI (Slave) Address register
   TWAR                     : constant Address    := 16#ba#;
   --  TWI General Call Recognition Enable Bit
   TWGCE_Bit                : constant Bit_Number := 0;
   TWGCE                    : constant Nat8       := 16#01#;
   --  TWI (Slave) Address register Bit 0
   TWA0_Bit                 : constant Bit_Number := 1;
   TWA0                     : constant Nat8       := 16#02#;
   --  TWI (Slave) Address register Bit 1
   TWA1_Bit                 : constant Bit_Number := 2;
   TWA1                     : constant Nat8       := 16#04#;
   --  TWI (Slave) Address register Bit 2
   TWA2_Bit                 : constant Bit_Number := 3;
   TWA2                     : constant Nat8       := 16#08#;
   --  TWI (Slave) Address register Bit 3
   TWA3_Bit                 : constant Bit_Number := 4;
   TWA3                     : constant Nat8       := 16#10#;
   --  TWI (Slave) Address register Bit 4
   TWA4_Bit                 : constant Bit_Number := 5;
   TWA4                     : constant Nat8       := 16#20#;
   --  TWI (Slave) Address register Bit 5
   TWA5_Bit                 : constant Bit_Number := 6;
   TWA5                     : constant Nat8       := 16#40#;
   --  TWI (Slave) Address register Bit 6
   TWA6_Bit                 : constant Bit_Number := 7;
   TWA6                     : constant Nat8       := 16#80#;

   --  TWI Status Register
   TWSR                     : constant Address    := 16#b9#;
   --  TWI Prescaler
   TWPS0_Bit                : constant Bit_Number := 0;
   TWPS0                    : constant Nat8       := 16#01#;
   --  TWI Prescaler
   TWPS1_Bit                : constant Bit_Number := 1;
   TWPS1                    : constant Nat8       := 16#02#;
   --  TWI Status
   TWS3_Bit                 : constant Bit_Number := 3;
   TWS3                     : constant Nat8       := 16#08#;
   --  TWI Status
   TWS4_Bit                 : constant Bit_Number := 4;
   TWS4                     : constant Nat8       := 16#10#;
   --  TWI Status
   TWS5_Bit                 : constant Bit_Number := 5;
   TWS5                     : constant Nat8       := 16#20#;
   --  TWI Status
   TWS6_Bit                 : constant Bit_Number := 6;
   TWS6                     : constant Nat8       := 16#40#;
   --  TWI Status
   TWS7_Bit                 : constant Bit_Number := 7;
   TWS7                     : constant Nat8       := 16#80#;

   --  TWI Bit Rate register
   TWBR                     : constant Address    := 16#b8#;
   TWBR0_Bit                : constant Bit_Number := 0;
   TWBR0                    : constant Nat8       := 16#01#;
   TWBR1_Bit                : constant Bit_Number := 1;
   TWBR1                    : constant Nat8       := 16#02#;
   TWBR2_Bit                : constant Bit_Number := 2;
   TWBR2                    : constant Nat8       := 16#04#;
   TWBR3_Bit                : constant Bit_Number := 3;
   TWBR3                    : constant Nat8       := 16#08#;
   TWBR4_Bit                : constant Bit_Number := 4;
   TWBR4                    : constant Nat8       := 16#10#;
   TWBR5_Bit                : constant Bit_Number := 5;
   TWBR5                    : constant Nat8       := 16#20#;
   TWBR6_Bit                : constant Bit_Number := 6;
   TWBR6                    : constant Nat8       := 16#40#;
   TWBR7_Bit                : constant Bit_Number := 7;
   TWBR7                    : constant Nat8       := 16#80#;

   --  Output Compare Register 1A High Nat8
   OCR1AH                   : constant Address    := 16#89#;
   OCR1AH0_Bit              : constant Bit_Number := 0;
   OCR1AH0                  : constant Nat8       := 16#01#;
   OCR1AH1_Bit              : constant Bit_Number := 1;
   OCR1AH1                  : constant Nat8       := 16#02#;
   OCR1AH2_Bit              : constant Bit_Number := 2;
   OCR1AH2                  : constant Nat8       := 16#04#;
   OCR1AH3_Bit              : constant Bit_Number := 3;
   OCR1AH3                  : constant Nat8       := 16#08#;
   OCR1AH4_Bit              : constant Bit_Number := 4;
   OCR1AH4                  : constant Nat8       := 16#10#;
   OCR1AH5_Bit              : constant Bit_Number := 5;
   OCR1AH5                  : constant Nat8       := 16#20#;
   OCR1AH6_Bit              : constant Bit_Number := 6;
   OCR1AH6                  : constant Nat8       := 16#40#;
   OCR1AH7_Bit              : constant Bit_Number := 7;
   OCR1AH7                  : constant Nat8       := 16#80#;

   --  Output Compare Register 1A Low Nat8
   OCR1AL                   : constant Address    := 16#88#;
   OCR1A                    : constant Address    := 16#88#;
   OCR1AL0_Bit              : constant Bit_Number := 0;
   OCR1AL0                  : constant Nat8       := 16#01#;
   OCR1AL1_Bit              : constant Bit_Number := 1;
   OCR1AL1                  : constant Nat8       := 16#02#;
   OCR1AL2_Bit              : constant Bit_Number := 2;
   OCR1AL2                  : constant Nat8       := 16#04#;
   OCR1AL3_Bit              : constant Bit_Number := 3;
   OCR1AL3                  : constant Nat8       := 16#08#;
   OCR1AL4_Bit              : constant Bit_Number := 4;
   OCR1AL4                  : constant Nat8       := 16#10#;
   OCR1AL5_Bit              : constant Bit_Number := 5;
   OCR1AL5                  : constant Nat8       := 16#20#;
   OCR1AL6_Bit              : constant Bit_Number := 6;
   OCR1AL6                  : constant Nat8       := 16#40#;
   OCR1AL7_Bit              : constant Bit_Number := 7;
   OCR1AL7                  : constant Nat8       := 16#80#;

   --  Timer Counter 1 High Nat8
   TCNT1H                   : constant Address    := 16#85#;
   --  Timer Counter 1 High Nat8 bit 0
   TCNT1H0_Bit              : constant Bit_Number := 0;
   TCNT1H0                  : constant Nat8       := 16#01#;
   --  Timer Counter 1 High Nat8 bit 1
   TCNT1H1_Bit              : constant Bit_Number := 1;
   TCNT1H1                  : constant Nat8       := 16#02#;
   --  Timer Counter 1 High Nat8 bit 2
   TCNT1H2_Bit              : constant Bit_Number := 2;
   TCNT1H2                  : constant Nat8       := 16#04#;
   --  Timer Counter 1 High Nat8 bit 3
   TCNT1H3_Bit              : constant Bit_Number := 3;
   TCNT1H3                  : constant Nat8       := 16#08#;
   --  Timer Counter 1 High Nat8 bit 4
   TCNT1H4_Bit              : constant Bit_Number := 4;
   TCNT1H4                  : constant Nat8       := 16#10#;
   --  Timer Counter 1 High Nat8 bit 5
   TCNT1H5_Bit              : constant Bit_Number := 5;
   TCNT1H5                  : constant Nat8       := 16#20#;
   --  Timer Counter 1 High Nat8 bit 6
   TCNT1H6_Bit              : constant Bit_Number := 6;
   TCNT1H6                  : constant Nat8       := 16#40#;
   --  Timer Counter 1 High Nat8 bit 7
   TCNT1H7_Bit              : constant Bit_Number := 7;
   TCNT1H7                  : constant Nat8       := 16#80#;

   --  Timer Counter 1 Low Nat8
   TCNT1L                   : constant Address    := 16#84#;
   TCNT1                    : constant Address    := 16#84#;
   --  Timer Counter 1 Low Nat8 bit 0
   TCNT1L0_Bit              : constant Bit_Number := 0;
   TCNT1L0                  : constant Nat8       := 16#01#;
   --  Timer Counter 1 Low Nat8 bit 1
   TCNT1L1_Bit              : constant Bit_Number := 1;
   TCNT1L1                  : constant Nat8       := 16#02#;
   --  Timer Counter 1 Low Nat8 bit 2
   TCNT1L2_Bit              : constant Bit_Number := 2;
   TCNT1L2                  : constant Nat8       := 16#04#;
   --  Timer Counter 1 Low Nat8 bit 3
   TCNT1L3_Bit              : constant Bit_Number := 3;
   TCNT1L3                  : constant Nat8       := 16#08#;
   --  Timer Counter 1 Low Nat8 bit 4
   TCNT1L4_Bit              : constant Bit_Number := 4;
   TCNT1L4                  : constant Nat8       := 16#10#;
   --  Timer Counter 1 Low Nat8 bit 5
   TCNT1L5_Bit              : constant Bit_Number := 5;
   TCNT1L5                  : constant Nat8       := 16#20#;
   --  Timer Counter 1 Low Nat8 bit 6
   TCNT1L6_Bit              : constant Bit_Number := 6;
   TCNT1L6                  : constant Nat8       := 16#40#;
   --  Timer Counter 1 Low Nat8 bit 7
   TCNT1L7_Bit              : constant Bit_Number := 7;
   TCNT1L7                  : constant Nat8       := 16#80#;

   --  Timer/Counter1 Control Register B
   TCCR1B                   : constant Address    := 16#81#;
   --  Clock Select1 bit 0
   CS10_Bit                 : constant Bit_Number := 0;
   CS10                     : constant Nat8       := 16#01#;
   --  Clock Select1 bit 1
   CS11_Bit                 : constant Bit_Number := 1;
   CS11                     : constant Nat8       := 16#02#;
   --  Clock Select1 bit 2
   CS12_Bit                 : constant Bit_Number := 2;
   CS12                     : constant Nat8       := 16#04#;
   --  Clear Timer/Counter on Compare Match
   CTC1_Bit                 : constant Bit_Number := 3;
   CTC1                     : constant Nat8       := 16#08#;

   --  Digital Input Disable Register
   DIDR0                    : constant Address    := 16#7e#;
   --  When this bit is written logic one, the digital input buffer of the
   --    corresponding V_ADC pin is disabled.
   VADC0D_Bit               : constant Bit_Number := 0;
   VADC0D                   : constant Nat8       := 16#01#;
   --  When this bit is written logic one, the digital input buffer of the
   --    corresponding V_ADC pin is disabled.
   VADC1D_Bit               : constant Bit_Number := 1;
   VADC1D                   : constant Nat8       := 16#02#;
   --  When this bit is written logic one, the digital input buffer of the
   --    corresponding V_ADC pin is disabled.
   VADC2D_Bit               : constant Bit_Number := 2;
   VADC2D                   : constant Nat8       := 16#04#;
   --  When this bit is written logic one, the digital input buffer of the
   --    corresponding V_ADC pin is disabled.
   VADC3D_Bit               : constant Bit_Number := 3;
   VADC3D                   : constant Nat8       := 16#08#;

   --  The VADC multiplexer Selection Register
   VADMUX                   : constant Address    := 16#7c#;
   --  Analog Channel and Gain Selection Bits
   VADMUX0_Bit              : constant Bit_Number := 0;
   VADMUX0                  : constant Nat8       := 16#01#;
   --  Analog Channel and Gain Selection Bits
   VADMUX1_Bit              : constant Bit_Number := 1;
   VADMUX1                  : constant Nat8       := 16#02#;
   --  Analog Channel and Gain Selection Bits
   VADMUX2_Bit              : constant Bit_Number := 2;
   VADMUX2                  : constant Nat8       := 16#04#;
   --  Analog Channel and Gain Selection Bits
   VADMUX3_Bit              : constant Bit_Number := 3;
   VADMUX3                  : constant Nat8       := 16#08#;

   --  The VADC Control and Status register
   VADCSR                   : constant Address    := 16#7a#;
   --  VADC Conversion Complete Interrupt Enable
   VADCCIE_Bit              : constant Bit_Number := 0;
   VADCCIE                  : constant Nat8       := 16#01#;
   --  VADC Conversion Complete Interrupt Flag
   VADCCIF_Bit              : constant Bit_Number := 1;
   VADCCIF                  : constant Nat8       := 16#02#;
   --  VADC Satrt Conversion
   VADSC_Bit                : constant Bit_Number := 2;
   VADSC                    : constant Nat8       := 16#04#;
   --  VADC Enable
   VADEN_Bit                : constant Bit_Number := 3;
   VADEN                    : constant Nat8       := 16#08#;

   --  VADC Data Register High Nat8
   VADCH                    : constant Address    := 16#79#;
   --  ADC Data Register High Nat8 Bit 0
   VADC8_Bit                : constant Bit_Number := 0;
   VADC8                    : constant Nat8       := 16#01#;
   --  ADC Data Register High Nat8 Bit 1
   VADC9_Bit                : constant Bit_Number := 1;
   VADC9                    : constant Nat8       := 16#02#;
   --  ADC Data Register High Nat8 Bit 2
   VADC10_Bit               : constant Bit_Number := 2;
   VADC10                   : constant Nat8       := 16#04#;
   --  ADC Data Register High Nat8 Bit 3
   VADC11_Bit               : constant Bit_Number := 3;
   VADC11                   : constant Nat8       := 16#08#;

   --  VADC Data Register Low Nat8
   VADCL                    : constant Address    := 16#78#;
   VADC                     : constant Address    := 16#78#;
   --  ADC Data Register Low Nat8 Bit 0
   VADC0_Bit                : constant Bit_Number := 0;
   VADC0                    : constant Nat8       := 16#01#;
   --  ADC Data Register Low Nat8 Bit 1
   VADC1_Bit                : constant Bit_Number := 1;
   VADC1                    : constant Nat8       := 16#02#;
   --  ADC Data Register Low Nat8 Bit 2
   VADC2_Bit                : constant Bit_Number := 2;
   VADC2                    : constant Nat8       := 16#04#;
   --  ADC Data Register Low Nat8 Bit 3
   VADC3_Bit                : constant Bit_Number := 3;
   VADC3                    : constant Nat8       := 16#08#;
   --  ADC Data Register Low Nat8 Bit 4
   VADC4_Bit                : constant Bit_Number := 4;
   VADC4                    : constant Nat8       := 16#10#;
   --  ADC Data Register Low Nat8 Bit 5
   VADC5_Bit                : constant Bit_Number := 5;
   VADC5                    : constant Nat8       := 16#20#;
   --  ADC Data Register Low Nat8 Bit 6
   VADC6_Bit                : constant Bit_Number := 6;
   VADC6                    : constant Nat8       := 16#40#;
   --  ADC Data Register Low Nat8 Bit 7
   VADC7_Bit                : constant Bit_Number := 7;
   VADC7                    : constant Nat8       := 16#80#;

   --  Timer/Counter Interrupt Mask Register
   TIMSK1                   : constant Address    := 16#6f#;
   --  Timer/Counter1 Overflow Interrupt Enable
   TOIE1_Bit                : constant Bit_Number := 0;
   TOIE1                    : constant Nat8       := 16#01#;
   --  Timer/Counter1 Output Compare Interrupt Enable
   OCIE1A_Bit               : constant Bit_Number := 1;
   OCIE1A                   : constant Nat8       := 16#02#;

   --  Timer/Counter Interrupt Mask Register
   TIMSK0                   : constant Address    := 16#6e#;
   --  Overflow Interrupt Enable
   TOIE0_Bit                : constant Bit_Number := 0;
   TOIE0                    : constant Nat8       := 16#01#;
   --  Output Compare Interrupt Enable
   OCIE0A_Bit               : constant Bit_Number := 1;
   OCIE0A                   : constant Nat8       := 16#02#;
   --  Output Compare Interrupt Enable
   OCIE0B_Bit               : constant Bit_Number := 2;
   OCIE0B                   : constant Nat8       := 16#04#;

   --  Pin Change Enable Mask Register 1
   PCMSK1                   : constant Address    := 16#6c#;
   --  Pin Change Enable Mask 8
   PCINT8_Bit               : constant Bit_Number := 0;
   PCINT8                   : constant Nat8       := 16#01#;
   --  Pin Change Enable Mask 9
   PCINT9_Bit               : constant Bit_Number := 1;
   PCINT9                   : constant Nat8       := 16#02#;
   --  Pin Change Enable Mask 10
   PCINT10_Bit              : constant Bit_Number := 2;
   PCINT10                  : constant Nat8       := 16#04#;
   --  Pin Change Enable Mask 11
   PCINT11_Bit              : constant Bit_Number := 3;
   PCINT11                  : constant Nat8       := 16#08#;
   --  Pin Change Enable Mask 12
   PCINT12_Bit              : constant Bit_Number := 4;
   PCINT12                  : constant Nat8       := 16#10#;
   --  Pin Change Enable Mask 13
   PCINT13_Bit              : constant Bit_Number := 5;
   PCINT13                  : constant Nat8       := 16#20#;
   --  Pin Change Enable Mask 14
   PCINT14_Bit              : constant Bit_Number := 6;
   PCINT14                  : constant Nat8       := 16#40#;
   --  Pin Change Enable Mask 15
   PCINT15_Bit              : constant Bit_Number := 7;
   PCINT15                  : constant Nat8       := 16#80#;

   --  Pin Change Enable Mask Register 0
   PCMSK0                   : constant Address    := 16#6b#;
   --  Pin Change Enable Mask 0
   PCINT0_Bit               : constant Bit_Number := 0;
   PCINT0                   : constant Nat8       := 16#01#;
   --  Pin Change Enable Mask 1
   PCINT1_Bit               : constant Bit_Number := 1;
   PCINT1                   : constant Nat8       := 16#02#;
   --  Pin Change Enable Mask 2
   PCINT2_Bit               : constant Bit_Number := 2;
   PCINT2                   : constant Nat8       := 16#04#;
   --  Pin Change Enable Mask 3
   PCINT3_Bit               : constant Bit_Number := 3;
   PCINT3                   : constant Nat8       := 16#08#;
   --  Pin Change Enable Mask 4
   PCINT4_Bit               : constant Bit_Number := 4;
   PCINT4                   : constant Nat8       := 16#10#;
   --  Pin Change Enable Mask 5
   PCINT5_Bit               : constant Bit_Number := 5;
   PCINT5                   : constant Nat8       := 16#20#;
   --  Pin Change Enable Mask 6
   PCINT6_Bit               : constant Bit_Number := 6;
   PCINT6                   : constant Nat8       := 16#40#;
   --  Pin Change Enable Mask 7
   PCINT7_Bit               : constant Bit_Number := 7;
   PCINT7                   : constant Nat8       := 16#80#;

   --  External Interrupt Control Register
   EICRA                    : constant Address    := 16#69#;
   --  External Interrupt Sense Control 0 Bit 0
   ISC00_Bit                : constant Bit_Number := 0;
   ISC00                    : constant Nat8       := 16#01#;
   --  External Interrupt Sense Control 0 Bit 1
   ISC01_Bit                : constant Bit_Number := 1;
   ISC01                    : constant Nat8       := 16#02#;
   --  External Interrupt Sense Control 1 Bit 0
   ISC10_Bit                : constant Bit_Number := 2;
   ISC10                    : constant Nat8       := 16#04#;
   --  External Interrupt Sense Control 1 Bit 1
   ISC11_Bit                : constant Bit_Number := 3;
   ISC11                    : constant Nat8       := 16#08#;
   --  External Interrupt Sense Control 2 Bit 0
   ISC20_Bit                : constant Bit_Number := 4;
   ISC20                    : constant Nat8       := 16#10#;
   --  External Interrupt Sense Control 2 Bit 1
   ISC21_Bit                : constant Bit_Number := 5;
   ISC21                    : constant Nat8       := 16#20#;
   --  External Interrupt Sense Control 3 Bit 0
   ISC30_Bit                : constant Bit_Number := 6;
   ISC30                    : constant Nat8       := 16#40#;
   --  External Interrupt Sense Control 3 Bit 1
   ISC31_Bit                : constant Bit_Number := 7;
   ISC31                    : constant Nat8       := 16#80#;

   --  Pin Change Interrupt Control Register
   PCICR                    : constant Address    := 16#68#;
   --  Pin Change Interrupt Enable 0
   PCIE0_Bit                : constant Bit_Number := 0;
   PCIE0                    : constant Nat8       := 16#01#;
   --  Pin Change Interrupt Enable 1
   PCIE1_Bit                : constant Bit_Number := 1;
   PCIE1                    : constant Nat8       := 16#02#;

   --  Fast Oscillator Calibration Value
   FOSCCAL                  : constant Address    := 16#66#;
   --  Oscillator Calibration Value Bit0
   FCAL0_Bit                : constant Bit_Number := 0;
   FCAL0                    : constant Nat8       := 16#01#;
   --  Oscillator Calibration Value Bit1
   FCAL1_Bit                : constant Bit_Number := 1;
   FCAL1                    : constant Nat8       := 16#02#;
   --  Oscillator Calibration Value Bit2
   FCAL2_Bit                : constant Bit_Number := 2;
   FCAL2                    : constant Nat8       := 16#04#;
   --  Oscillator Calibration Value Bit3
   FCAL3_Bit                : constant Bit_Number := 3;
   FCAL3                    : constant Nat8       := 16#08#;
   --  Oscillator Calibration Value Bit4
   FCAL4_Bit                : constant Bit_Number := 4;
   FCAL4                    : constant Nat8       := 16#10#;
   --  Oscillator Calibration Value Bit5
   FCAL5_Bit                : constant Bit_Number := 5;
   FCAL5                    : constant Nat8       := 16#20#;
   --  Oscillator Calibration Value Bit6
   FCAL6_Bit                : constant Bit_Number := 6;
   FCAL6                    : constant Nat8       := 16#40#;
   --  Oscillator Calibration Value Bit7
   FCAL7_Bit                : constant Bit_Number := 7;
   FCAL7                    : constant Nat8       := 16#80#;

   --  Power Reduction Register 0
   PRR0                     : constant Address    := 16#64#;
   --  Power Reduction V-ADC
   PRVADC_Bit               : constant Bit_Number := 0;
   PRVADC                   : constant Nat8       := 16#01#;
   --  Power Reduction Timer/Counter0
   PRTIM0_Bit               : constant Bit_Number := 1;
   PRTIM0                   : constant Nat8       := 16#02#;
   --  Power Reduction Timer/Counter1
   PRTIM1_Bit               : constant Bit_Number := 2;
   PRTIM1                   : constant Nat8       := 16#04#;
   --  Power Reduction TWI
   PRTWI_Bit                : constant Bit_Number := 3;
   PRTWI                    : constant Nat8       := 16#08#;

   --  Wake-up Timer Control Register
   WUTCSR                   : constant Address    := 16#62#;
   --  Wake-up Timer Prescaler Bit 0
   WUTP0_Bit                : constant Bit_Number := 0;
   WUTP0                    : constant Nat8       := 16#01#;
   --  Wake-up Timer Prescaler Bit 1
   WUTP1_Bit                : constant Bit_Number := 1;
   WUTP1                    : constant Nat8       := 16#02#;
   --  Wake-up Timer Prescaler Bit 2
   WUTP2_Bit                : constant Bit_Number := 2;
   WUTP2                    : constant Nat8       := 16#04#;
   --  Wake-up Timer Enable
   WUTE_Bit                 : constant Bit_Number := 3;
   WUTE                     : constant Nat8       := 16#08#;
   --  Wake-up Timer Reset
   WUTR_Bit                 : constant Bit_Number := 4;
   WUTR                     : constant Nat8       := 16#10#;
   --  Wake-up timer Calibration Flag
   WUTCF_Bit                : constant Bit_Number := 5;
   WUTCF                    : constant Nat8       := 16#20#;
   --  Wake-up Timer Interrupt Enable
   WUTIE_Bit                : constant Bit_Number := 6;
   WUTIE                    : constant Nat8       := 16#40#;
   --  Wake-up Timer Interrupt Flag
   WUTIF_Bit                : constant Bit_Number := 7;
   WUTIF                    : constant Nat8       := 16#80#;

   --  Watchdog Timer Control Register
   WDTCSR                   : constant Address    := 16#60#;
   --  Watch Dog Timer Prescaler bit 0
   WDP0_Bit                 : constant Bit_Number := 0;
   WDP0                     : constant Nat8       := 16#01#;
   --  Watch Dog Timer Prescaler bit 1
   WDP1_Bit                 : constant Bit_Number := 1;
   WDP1                     : constant Nat8       := 16#02#;
   --  Watch Dog Timer Prescaler bit 2
   WDP2_Bit                 : constant Bit_Number := 2;
   WDP2                     : constant Nat8       := 16#04#;
   --  Watch Dog Enable
   WDE_Bit                  : constant Bit_Number := 3;
   WDE                      : constant Nat8       := 16#08#;
   --  Watchdog Change Enable
   WDCE_Bit                 : constant Bit_Number := 4;
   WDCE                     : constant Nat8       := 16#10#;
   --  Watchdog Timer Prescaler Bit 3
   WDP3_Bit                 : constant Bit_Number := 5;
   WDP3                     : constant Nat8       := 16#20#;
   --  Watchdog Timeout Interrupt Enable
   WDIE_Bit                 : constant Bit_Number := 6;
   WDIE                     : constant Nat8       := 16#40#;
   --  Watchdog Timeout Interrupt Flag
   WDIF_Bit                 : constant Bit_Number := 7;
   WDIF                     : constant Nat8       := 16#80#;

   --  Status Register
   SREG                     : constant System.Address := 16#5f#;
   --  Carry Flag
   C_Bit                    : constant Bit_Number := 0;
   C                        : constant Nat8       := 16#01#;
   --  Zero Flag
   Z_Bit                    : constant Bit_Number := 1;
   Z                        : constant Nat8       := 16#02#;
   --  Negative Flag
   N_Bit                    : constant Bit_Number := 2;
   N                        : constant Nat8       := 16#04#;
   --  Two's Complement Overflow Flag
   V_Bit                    : constant Bit_Number := 3;
   V                        : constant Nat8       := 16#08#;
   --  Sign Bit
   S_Bit                    : constant Bit_Number := 4;
   S                        : constant Nat8       := 16#10#;
   --  Half Carry Flag
   H_Bit                    : constant Bit_Number := 5;
   H                        : constant Nat8       := 16#20#;
   --  Bit Copy Storage
   T_Bit                    : constant Bit_Number := 6;
   T                        : constant Nat8       := 16#40#;
   --  Global Interrupt Enable
   I_Bit                    : constant Bit_Number := 7;
   I                        : constant Nat8       := 16#80#;

   --  Stack Pointer High
   SPH                      : constant System.Address := 16#5e#;
   --  Stack pointer bit 8
   SP8_Bit                  : constant Bit_Number := 0;
   SP8                      : constant Nat8       := 16#01#;
   --  Stack pointer bit 9
   SP9_Bit                  : constant Bit_Number := 1;
   SP9                      : constant Nat8       := 16#02#;
   --  Stack pointer bit 10
   SP10_Bit                 : constant Bit_Number := 2;
   SP10                     : constant Nat8       := 16#04#;
   --  Stack pointer bit 11
   SP11_Bit                 : constant Bit_Number := 3;
   SP11                     : constant Nat8       := 16#08#;
   SP12_Bit                 : constant Bit_Number := 4;
   SP12                     : constant Nat8       := 16#10#;
   --  Stack pointer bit 13
   SP13_Bit                 : constant Bit_Number := 5;
   SP13                     : constant Nat8       := 16#20#;
   --  Stack pointer bit 14
   SP14_Bit                 : constant Bit_Number := 6;
   SP14                     : constant Nat8       := 16#40#;
   --  Stack pointer bit 15
   SP15_Bit                 : constant Bit_Number := 7;
   SP15                     : constant Nat8       := 16#80#;

   --  Stack Pointer Low
   SPL                      : constant System.Address := 16#5d#;
   SP                       : constant System.Address := 16#5d#;
   --  Stack pointer bit 0
   SP0_Bit                  : constant Bit_Number := 0;
   SP0                      : constant Nat8       := 16#01#;
   --  Stack pointer bit 1
   SP1_Bit                  : constant Bit_Number := 1;
   SP1                      : constant Nat8       := 16#02#;
   --  Stack pointer bit 2
   SP2_Bit                  : constant Bit_Number := 2;
   SP2                      : constant Nat8       := 16#04#;
   --  Stack pointer bit 3
   SP3_Bit                  : constant Bit_Number := 3;
   SP3                      : constant Nat8       := 16#08#;
   SP4_Bit                  : constant Bit_Number := 4;
   SP4                      : constant Nat8       := 16#10#;
   --  Stack pointer bit 5
   SP5_Bit                  : constant Bit_Number := 5;
   SP5                      : constant Nat8       := 16#20#;
   --  Stack pointer bit 6
   SP6_Bit                  : constant Bit_Number := 6;
   SP6                      : constant Nat8       := 16#40#;
   --  Stack pointer bit 7
   SP7_Bit                  : constant Bit_Number := 7;
   SP7                      : constant Nat8       := 16#80#;

   --  Store Program Memory Control Register
   SPMCSR                   : constant System.Address := 16#57#;
   --  Store Program Memory Enable
   SPMEN_Bit                : constant Bit_Number := 0;
   SPMEN                    : constant Nat8       := 16#01#;
   --  Page Erase
   PGERS_Bit                : constant Bit_Number := 1;
   PGERS                    : constant Nat8       := 16#02#;
   --  Page Write
   PGWRT_Bit                : constant Bit_Number := 2;
   PGWRT                    : constant Nat8       := 16#04#;
   --  Boot Lock Bit Set
   BLBSET_Bit               : constant Bit_Number := 3;
   BLBSET                   : constant Nat8       := 16#08#;
   --  Read While Write section read enable
   RWWSRE_Bit               : constant Bit_Number := 4;
   RWWSRE                   : constant Nat8       := 16#10#;
   --  Signature Row Read
   SIGRD_Bit                : constant Bit_Number := 5;
   SIGRD                    : constant Nat8       := 16#20#;
   --  Read While Write Section Busy
   RWWSB_Bit                : constant Bit_Number := 6;
   RWWSB                    : constant Nat8       := 16#40#;
   --  SPM Interrupt Enable
   SPMIE_Bit                : constant Bit_Number := 7;
   SPMIE                    : constant Nat8       := 16#80#;

   --  MCU Control Register
   MCUCR                    : constant System.Address := 16#55#;
   --  Interrupt Vector Change Enable
   IVCE_Bit                 : constant Bit_Number := 0;
   IVCE                     : constant Nat8       := 16#01#;
   --  Interrupt Vector Select
   IVSEL_Bit                : constant Bit_Number := 1;
   IVSEL                    : constant Nat8       := 16#02#;
   --  Pull-up disable
   PUD_Bit                  : constant Bit_Number := 4;
   PUD                      : constant Nat8       := 16#10#;
   --  JTAG Disable
   JTD_Bit                  : constant Bit_Number := 7;
   JTD                      : constant Nat8       := 16#80#;

   --  MCU Status Register
   MCUSR                    : constant System.Address := 16#54#;
   --  Power-on reset flag
   PORF_Bit                 : constant Bit_Number := 0;
   PORF                     : constant Nat8       := 16#01#;
   --  External Reset Flag
   EXTRF_Bit                : constant Bit_Number := 1;
   EXTRF                    : constant Nat8       := 16#02#;
   --  Brown-out Reset Flag
   BODRF_Bit                : constant Bit_Number := 2;
   BODRF                    : constant Nat8       := 16#04#;
   --  Watchdog Reset Flag
   WDRF_Bit                 : constant Bit_Number := 3;
   WDRF                     : constant Nat8       := 16#08#;
   --  JTAG Reset Flag
   JTRF_Bit                 : constant Bit_Number := 4;
   JTRF                     : constant Nat8       := 16#10#;

   --  Sleep Mode Control Register
   SMCR                     : constant System.Address := 16#53#;
   --  Sleep Enable
   SE_Bit                   : constant Bit_Number := 0;
   SE                       : constant Nat8       := 16#01#;
   --  Sleep Mode Select bit 0
   SM0_Bit                  : constant Bit_Number := 1;
   SM0                      : constant Nat8       := 16#02#;
   --  Sleep Mode Select bit 1
   SM1_Bit                  : constant Bit_Number := 2;
   SM1                      : constant Nat8       := 16#04#;
   --  Sleep Mode Select bit 2
   SM2_Bit                  : constant Bit_Number := 3;
   SM2                      : constant Nat8       := 16#08#;

   OCDR                     : constant System.Address := 16#51#;

   --  General Purpose IO Register 2
   GPIOR2                   : constant System.Address := 16#4b#;
   --  General Purpose IO Register 2 bit 0
   GPIOR20_Bit              : constant Bit_Number := 0;
   GPIOR20                  : constant Nat8       := 16#01#;
   --  General Purpose IO Register 2 bit 1
   GPIOR21_Bit              : constant Bit_Number := 1;
   GPIOR21                  : constant Nat8       := 16#02#;
   --  General Purpose IO Register 2 bit 2
   GPIOR22_Bit              : constant Bit_Number := 2;
   GPIOR22                  : constant Nat8       := 16#04#;
   --  General Purpose IO Register 2 bit 3
   GPIOR23_Bit              : constant Bit_Number := 3;
   GPIOR23                  : constant Nat8       := 16#08#;
   --  General Purpose IO Register 2 bit 4
   GPIOR24_Bit              : constant Bit_Number := 4;
   GPIOR24                  : constant Nat8       := 16#10#;
   --  General Purpose IO Register 2 bit 5
   GPIOR25_Bit              : constant Bit_Number := 5;
   GPIOR25                  : constant Nat8       := 16#20#;
   --  General Purpose IO Register 2 bit 6
   GPIOR26_Bit              : constant Bit_Number := 6;
   GPIOR26                  : constant Nat8       := 16#40#;
   --  General Purpose IO Register 2 bit 7
   GPIOR27_Bit              : constant Bit_Number := 7;
   GPIOR27                  : constant Nat8       := 16#80#;

   --  General Purpose IO Register 1
   GPIOR1                   : constant System.Address := 16#4a#;
   --  General Purpose IO Register 1 bit 0
   GPIOR10_Bit              : constant Bit_Number := 0;
   GPIOR10                  : constant Nat8       := 16#01#;
   --  General Purpose IO Register 1 bit 1
   GPIOR11_Bit              : constant Bit_Number := 1;
   GPIOR11                  : constant Nat8       := 16#02#;
   --  General Purpose IO Register 1 bit 2
   GPIOR12_Bit              : constant Bit_Number := 2;
   GPIOR12                  : constant Nat8       := 16#04#;
   --  General Purpose IO Register 1 bit 3
   GPIOR13_Bit              : constant Bit_Number := 3;
   GPIOR13                  : constant Nat8       := 16#08#;
   --  General Purpose IO Register 1 bit 4
   GPIOR14_Bit              : constant Bit_Number := 4;
   GPIOR14                  : constant Nat8       := 16#10#;
   --  General Purpose IO Register 1 bit 5
   GPIOR15_Bit              : constant Bit_Number := 5;
   GPIOR15                  : constant Nat8       := 16#20#;
   --  General Purpose IO Register 1 bit 6
   GPIOR16_Bit              : constant Bit_Number := 6;
   GPIOR16                  : constant Nat8       := 16#40#;
   --  General Purpose IO Register 1 bit 7
   GPIOR17_Bit              : constant Bit_Number := 7;
   GPIOR17                  : constant Nat8       := 16#80#;

   --  Output compare Register B
   OCR0B                    : constant System.Address := 16#48#;
   OCR0B0_Bit               : constant Bit_Number := 0;
   OCR0B0                   : constant Nat8       := 16#01#;
   OCR0B1_Bit               : constant Bit_Number := 1;
   OCR0B1                   : constant Nat8       := 16#02#;
   OCR0B2_Bit               : constant Bit_Number := 2;
   OCR0B2                   : constant Nat8       := 16#04#;
   OCR0B3_Bit               : constant Bit_Number := 3;
   OCR0B3                   : constant Nat8       := 16#08#;
   OCR0B4_Bit               : constant Bit_Number := 4;
   OCR0B4                   : constant Nat8       := 16#10#;
   OCR0B5_Bit               : constant Bit_Number := 5;
   OCR0B5                   : constant Nat8       := 16#20#;
   OCR0B6_Bit               : constant Bit_Number := 6;
   OCR0B6                   : constant Nat8       := 16#40#;
   OCR0B7_Bit               : constant Bit_Number := 7;
   OCR0B7                   : constant Nat8       := 16#80#;

   --  Output compare Register A
   OCR0A                    : constant System.Address := 16#47#;
   OCR0A0_Bit               : constant Bit_Number := 0;
   OCR0A0                   : constant Nat8       := 16#01#;
   OCR0A1_Bit               : constant Bit_Number := 1;
   OCR0A1                   : constant Nat8       := 16#02#;
   OCR0A2_Bit               : constant Bit_Number := 2;
   OCR0A2                   : constant Nat8       := 16#04#;
   OCR0A3_Bit               : constant Bit_Number := 3;
   OCR0A3                   : constant Nat8       := 16#08#;
   OCR0A4_Bit               : constant Bit_Number := 4;
   OCR0A4                   : constant Nat8       := 16#10#;
   OCR0A5_Bit               : constant Bit_Number := 5;
   OCR0A5                   : constant Nat8       := 16#20#;
   OCR0A6_Bit               : constant Bit_Number := 6;
   OCR0A6                   : constant Nat8       := 16#40#;
   OCR0A7_Bit               : constant Bit_Number := 7;
   OCR0A7                   : constant Nat8       := 16#80#;

   --  Timer Counter 0
   TCNT0                    : constant System.Address := 16#46#;
   --  Timer Counter 0 bit 0
   TCNT00_Bit               : constant Bit_Number := 0;
   TCNT00                   : constant Nat8       := 16#01#;
   --  Timer Counter 0 bit 1
   TCNT01_Bit               : constant Bit_Number := 1;
   TCNT01                   : constant Nat8       := 16#02#;
   --  Timer Counter 0 bit 2
   TCNT02_Bit               : constant Bit_Number := 2;
   TCNT02                   : constant Nat8       := 16#04#;
   --  Timer Counter 0 bit 3
   TCNT03_Bit               : constant Bit_Number := 3;
   TCNT03                   : constant Nat8       := 16#08#;
   --  Timer Counter 0 bit 4
   TCNT04_Bit               : constant Bit_Number := 4;
   TCNT04                   : constant Nat8       := 16#10#;
   --  Timer Counter 0 bit 5
   TCNT05_Bit               : constant Bit_Number := 5;
   TCNT05                   : constant Nat8       := 16#20#;
   --  Timer Counter 0 bit 6
   TCNT06_Bit               : constant Bit_Number := 6;
   TCNT06                   : constant Nat8       := 16#40#;
   --  Timer Counter 0 bit 7
   TCNT07_Bit               : constant Bit_Number := 7;
   TCNT07                   : constant Nat8       := 16#80#;

   --  Timer/Counter0 Control Register
   TCCR0B                   : constant System.Address := 16#45#;
   --  Clock Select0 bit 0
   CS00_Bit                 : constant Bit_Number := 0;
   CS00                     : constant Nat8       := 16#01#;
   --  Clock Select0 bit 1
   CS01_Bit                 : constant Bit_Number := 1;
   CS01                     : constant Nat8       := 16#02#;
   --  Clock Select0 bit 2
   CS02_Bit                 : constant Bit_Number := 2;
   CS02                     : constant Nat8       := 16#04#;
   WGM02_Bit                : constant Bit_Number := 3;
   WGM02                    : constant Nat8       := 16#08#;
   --  Waveform Generation Mode
   FOC0B_Bit                : constant Bit_Number := 6;
   FOC0B                    : constant Nat8       := 16#40#;
   --  Force Output Compare
   FOC0A_Bit                : constant Bit_Number := 7;
   FOC0A                    : constant Nat8       := 16#80#;

   --  Timer/Counter0 Control Register
   TCCR0A                   : constant System.Address := 16#44#;
   --  Clock Select0 bit 0
   WGM00_Bit                : constant Bit_Number := 0;
   WGM00                    : constant Nat8       := 16#01#;
   --  Clock Select0 bit 1
   WGM01_Bit                : constant Bit_Number := 1;
   WGM01                    : constant Nat8       := 16#02#;
   COM0B0_Bit               : constant Bit_Number := 4;
   COM0B0                   : constant Nat8       := 16#10#;
   COM0B1_Bit               : constant Bit_Number := 5;
   COM0B1                   : constant Nat8       := 16#20#;
   --  Waveform Generation Mode
   COM0A0_Bit               : constant Bit_Number := 6;
   COM0A0                   : constant Nat8       := 16#40#;
   --  Force Output Compare
   COM0A1_Bit               : constant Bit_Number := 7;
   COM0A1                   : constant Nat8       := 16#80#;

   --  General Timer/Counter Control Register
   GTCCR                    : constant System.Address := 16#43#;
   --  Prescaler Reset
   PSRSYNC_Bit              : constant Bit_Number := 0;
   PSRSYNC                  : constant Nat8       := 16#01#;
   --  Timer/Counter Synchronization Mode
   TSM_Bit                  : constant Bit_Number := 7;
   TSM                      : constant Nat8       := 16#80#;

   --  EEPROM Address Register High Nat8
   EEARH                    : constant System.Address := 16#42#;
   --  EEPROM Read/Write Access Bit 8
   EEAR8_Bit                : constant Bit_Number := 0;
   EEAR8                    : constant Nat8       := 16#01#;

   --  EEPROM Address Register Low Nat8
   EEARL                    : constant System.Address := 16#41#;
   EEAR                     : constant System.Address := 16#41#;
   --  EEPROM Read/Write Access Bit 0
   EEAR0_Bit                : constant Bit_Number := 0;
   EEAR0                    : constant Nat8       := 16#01#;
   --  EEPROM Read/Write Access Bit 1
   EEAR1_Bit                : constant Bit_Number := 1;
   EEAR1                    : constant Nat8       := 16#02#;
   --  EEPROM Read/Write Access Bit 2
   EEAR2_Bit                : constant Bit_Number := 2;
   EEAR2                    : constant Nat8       := 16#04#;
   --  EEPROM Read/Write Access Bit 3
   EEAR3_Bit                : constant Bit_Number := 3;
   EEAR3                    : constant Nat8       := 16#08#;
   --  EEPROM Read/Write Access Bit 4
   EEAR4_Bit                : constant Bit_Number := 4;
   EEAR4                    : constant Nat8       := 16#10#;
   --  EEPROM Read/Write Access Bit 5
   EEAR5_Bit                : constant Bit_Number := 5;
   EEAR5                    : constant Nat8       := 16#20#;
   --  EEPROM Read/Write Access Bit 6
   EEAR6_Bit                : constant Bit_Number := 6;
   EEAR6                    : constant Nat8       := 16#40#;
   --  EEPROM Read/Write Access Bit 7
   EEAR7_Bit                : constant Bit_Number := 7;
   EEAR7                    : constant Nat8       := 16#80#;

   --  EEPROM Data Register
   EEDR                     : constant System.Address := 16#40#;
   --  EEPROM Data Register bit 0
   EEDR0_Bit                : constant Bit_Number := 0;
   EEDR0                    : constant Nat8       := 16#01#;
   --  EEPROM Data Register bit 1
   EEDR1_Bit                : constant Bit_Number := 1;
   EEDR1                    : constant Nat8       := 16#02#;
   --  EEPROM Data Register bit 2
   EEDR2_Bit                : constant Bit_Number := 2;
   EEDR2                    : constant Nat8       := 16#04#;
   --  EEPROM Data Register bit 3
   EEDR3_Bit                : constant Bit_Number := 3;
   EEDR3                    : constant Nat8       := 16#08#;
   --  EEPROM Data Register bit 4
   EEDR4_Bit                : constant Bit_Number := 4;
   EEDR4                    : constant Nat8       := 16#10#;
   --  EEPROM Data Register bit 5
   EEDR5_Bit                : constant Bit_Number := 5;
   EEDR5                    : constant Nat8       := 16#20#;
   --  EEPROM Data Register bit 6
   EEDR6_Bit                : constant Bit_Number := 6;
   EEDR6                    : constant Nat8       := 16#40#;
   --  EEPROM Data Register bit 7
   EEDR7_Bit                : constant Bit_Number := 7;
   EEDR7                    : constant Nat8       := 16#80#;

   --  EEPROM Control Register
   EECR                     : constant System.Address := 16#3f#;
   --  EEPROM Read Enable
   EERE_Bit                 : constant Bit_Number := 0;
   EERE                     : constant Nat8       := 16#01#;
   --  EEPROM Programming Enable
   EEPE_Bit                 : constant Bit_Number := 1;
   EEPE                     : constant Nat8       := 16#02#;
   --  EEPROM Master Programming Enable
   EEMPE_Bit                : constant Bit_Number := 2;
   EEMPE                    : constant Nat8       := 16#04#;
   --  EEPROM Ready Interrupt Enable
   EERIE_Bit                : constant Bit_Number := 3;
   EERIE                    : constant Nat8       := 16#08#;
   --  EEPROM Programming Mode Bits
   EEPM0_Bit                : constant Bit_Number := 4;
   EEPM0                    : constant Nat8       := 16#10#;
   --  EEPROM Programming Mode Bits
   EEPM1_Bit                : constant Bit_Number := 5;
   EEPM1                    : constant Nat8       := 16#20#;

   --  General Purpose IO Register 0
   GPIOR0                   : constant System.Address := 16#3e#;
   --  General Purpose IO Register 0 bit 0
   GPIOR00_Bit              : constant Bit_Number := 0;
   GPIOR00                  : constant Nat8       := 16#01#;
   --  General Purpose IO Register 0 bit 1
   GPIOR01_Bit              : constant Bit_Number := 1;
   GPIOR01                  : constant Nat8       := 16#02#;
   --  General Purpose IO Register 0 bit 2
   GPIOR02_Bit              : constant Bit_Number := 2;
   GPIOR02                  : constant Nat8       := 16#04#;
   --  General Purpose IO Register 0 bit 3
   GPIOR03_Bit              : constant Bit_Number := 3;
   GPIOR03                  : constant Nat8       := 16#08#;
   --  General Purpose IO Register 0 bit 4
   GPIOR04_Bit              : constant Bit_Number := 4;
   GPIOR04                  : constant Nat8       := 16#10#;
   --  General Purpose IO Register 0 bit 5
   GPIOR05_Bit              : constant Bit_Number := 5;
   GPIOR05                  : constant Nat8       := 16#20#;
   --  General Purpose IO Register 0 bit 6
   GPIOR06_Bit              : constant Bit_Number := 6;
   GPIOR06                  : constant Nat8       := 16#40#;
   --  General Purpose IO Register 0 bit 7
   GPIOR07_Bit              : constant Bit_Number := 7;
   GPIOR07                  : constant Nat8       := 16#80#;

   --  External Interrupt Mask Register
   EIMSK                    : constant System.Address := 16#3d#;
   --  External Interrupt Request 0 Enable
   INT0_Bit                 : constant Bit_Number := 0;
   INT0                     : constant Nat8       := 16#01#;
   --  External Interrupt Request 1 Enable
   INT1_Bit                 : constant Bit_Number := 1;
   INT1                     : constant Nat8       := 16#02#;
   --  External Interrupt Request 1 Enable
   INT2_Bit                 : constant Bit_Number := 2;
   INT2                     : constant Nat8       := 16#04#;
   --  External Interrupt Request 1 Enable
   INT3_Bit                 : constant Bit_Number := 3;
   INT3                     : constant Nat8       := 16#08#;

   --  External Interrupt Flag Register
   EIFR                     : constant System.Address := 16#3c#;
   --  External Interrupt Flag 0
   INTF0_Bit                : constant Bit_Number := 0;
   INTF0                    : constant Nat8       := 16#01#;
   --  External Interrupt Flag 1
   INTF1_Bit                : constant Bit_Number := 1;
   INTF1                    : constant Nat8       := 16#02#;
   --  External Interrupt Flag 2
   INTF2_Bit                : constant Bit_Number := 2;
   INTF2                    : constant Nat8       := 16#04#;
   --  External Interrupt Flag 3
   INTF3_Bit                : constant Bit_Number := 3;
   INTF3                    : constant Nat8       := 16#08#;

   --  Pin Change Interrupt Flag Register
   PCIFR                    : constant System.Address := 16#3b#;
   --  Pin Change Interrupt Flag 1
   PCIF0_Bit                : constant Bit_Number := 0;
   PCIF0                    : constant Nat8       := 16#01#;
   --  Pin Change Interrupt Flag 1
   PCIF1_Bit                : constant Bit_Number := 1;
   PCIF1                    : constant Nat8       := 16#02#;

   --  Timer/Counter Interrupt Flag register
   TIFR1                    : constant System.Address := 16#36#;
   --  Timer/Counter1 Overflow Flag
   TOV1_Bit                 : constant Bit_Number := 0;
   TOV1                     : constant Nat8       := 16#01#;
   --  Timer/Counter1 Output Compare Flag A
   OCF1A_Bit                : constant Bit_Number := 1;
   OCF1A                    : constant Nat8       := 16#02#;

   --  Timer/Counter Interrupt Flag register
   TIFR0                    : constant System.Address := 16#35#;
   --  Overflow Flag
   TOV0_Bit                 : constant Bit_Number := 0;
   TOV0                     : constant Nat8       := 16#01#;
   --  Output Compare Flag
   OCF0A_Bit                : constant Bit_Number := 1;
   OCF0A                    : constant Nat8       := 16#02#;
   --  Output Compare Flag
   OCF0B_Bit                : constant Bit_Number := 2;
   OCF0B                    : constant Nat8       := 16#04#;

   --  Data Register, Port D
   PORTD                    : constant System.Address := 16#2b#;
   PORTD0_Bit               : constant Bit_Number := 0;
   PORTD0                   : constant Nat8       := 16#01#;
   PORTD1_Bit               : constant Bit_Number := 1;
   PORTD1                   : constant Nat8       := 16#02#;

   DDRD                     : constant System.Address := 16#2a#;
   DDD0_Bit                 : constant Bit_Number := 0;
   DDD0                     : constant Nat8       := 16#01#;
   DDD1_Bit                 : constant Bit_Number := 1;
   DDD1                     : constant Nat8       := 16#02#;

   --  Input Pins, Port D
   PIND                     : constant System.Address := 16#29#;
   PIND0_Bit                : constant Bit_Number := 0;
   PIND0                    : constant Nat8       := 16#01#;
   PIND1_Bit                : constant Bit_Number := 1;
   PIND1                    : constant Nat8       := 16#02#;

   --  Port C Data Register
   PORTC                    : constant System.Address := 16#28#;
   --  Port C Data Register bit 0
   PORTC0_Bit               : constant Bit_Number := 0;
   PORTC0                   : constant Nat8       := 16#01#;

   --  Port B Data Register
   PORTB                    : constant System.Address := 16#25#;
   --  Port B Data Register bit 0
   PORTB0_Bit               : constant Bit_Number := 0;
   PORTB0                   : constant Nat8       := 16#01#;
   --  Port B Data Register bit 1
   PORTB1_Bit               : constant Bit_Number := 1;
   PORTB1                   : constant Nat8       := 16#02#;
   --  Port B Data Register bit 2
   PORTB2_Bit               : constant Bit_Number := 2;
   PORTB2                   : constant Nat8       := 16#04#;
   --  Port B Data Register bit 3
   PORTB3_Bit               : constant Bit_Number := 3;
   PORTB3                   : constant Nat8       := 16#08#;
   --  Port B Data Register bit 4
   PORTB4_Bit               : constant Bit_Number := 4;
   PORTB4                   : constant Nat8       := 16#10#;
   --  Port B Data Register bit 5
   PORTB5_Bit               : constant Bit_Number := 5;
   PORTB5                   : constant Nat8       := 16#20#;
   --  Port B Data Register bit 6
   PORTB6_Bit               : constant Bit_Number := 6;
   PORTB6                   : constant Nat8       := 16#40#;
   --  Port B Data Register bit 7
   PORTB7_Bit               : constant Bit_Number := 7;
   PORTB7                   : constant Nat8       := 16#80#;

   --  Port B Data Direction Register
   DDRB                     : constant System.Address := 16#24#;
   --  Port B Data Direction Register bit 0
   DDB0_Bit                 : constant Bit_Number := 0;
   DDB0                     : constant Nat8       := 16#01#;
   --  Port B Data Direction Register bit 1
   DDB1_Bit                 : constant Bit_Number := 1;
   DDB1                     : constant Nat8       := 16#02#;
   --  Port B Data Direction Register bit 2
   DDB2_Bit                 : constant Bit_Number := 2;
   DDB2                     : constant Nat8       := 16#04#;
   --  Port B Data Direction Register bit 3
   DDB3_Bit                 : constant Bit_Number := 3;
   DDB3                     : constant Nat8       := 16#08#;
   --  Port B Data Direction Register bit 4
   DDB4_Bit                 : constant Bit_Number := 4;
   DDB4                     : constant Nat8       := 16#10#;
   --  Port B Data Direction Register bit 5
   DDB5_Bit                 : constant Bit_Number := 5;
   DDB5                     : constant Nat8       := 16#20#;
   --  Port B Data Direction Register bit 6
   DDB6_Bit                 : constant Bit_Number := 6;
   DDB6                     : constant Nat8       := 16#40#;
   --  Port B Data Direction Register bit 7
   DDB7_Bit                 : constant Bit_Number := 7;
   DDB7                     : constant Nat8       := 16#80#;

   --  Port B Input Pins
   PINB                     : constant System.Address := 16#23#;
   --  Port B Input Pins bit 0
   PINB0_Bit                : constant Bit_Number := 0;
   PINB0                    : constant Nat8       := 16#01#;
   --  Port B Input Pins bit 1
   PINB1_Bit                : constant Bit_Number := 1;
   PINB1                    : constant Nat8       := 16#02#;
   --  Port B Input Pins bit 2
   PINB2_Bit                : constant Bit_Number := 2;
   PINB2                    : constant Nat8       := 16#04#;
   --  Port B Input Pins bit 3
   PINB3_Bit                : constant Bit_Number := 3;
   PINB3                    : constant Nat8       := 16#08#;
   --  Port B Input Pins bit 4
   PINB4_Bit                : constant Bit_Number := 4;
   PINB4                    : constant Nat8       := 16#10#;
   --  Port B Input Pins bit 5
   PINB5_Bit                : constant Bit_Number := 5;
   PINB5                    : constant Nat8       := 16#20#;
   --  Port B Input Pins bit 6
   PINB6_Bit                : constant Bit_Number := 6;
   PINB6                    : constant Nat8       := 16#40#;
   --  Port B Input Pins bit 7
   PINB7_Bit                : constant Bit_Number := 7;
   PINB7                    : constant Nat8       := 16#80#;

   --  Port A Data Register
   PORTA                    : constant System.Address := 16#22#;
   --  Port A Data Register bit 0
   PORTA0_Bit               : constant Bit_Number := 0;
   PORTA0                   : constant Nat8       := 16#01#;
   --  Port A Data Register bit 1
   PORTA1_Bit               : constant Bit_Number := 1;
   PORTA1                   : constant Nat8       := 16#02#;
   --  Port A Data Register bit 2
   PORTA2_Bit               : constant Bit_Number := 2;
   PORTA2                   : constant Nat8       := 16#04#;
   --  Port A Data Register bit 3
   PORTA3_Bit               : constant Bit_Number := 3;
   PORTA3                   : constant Nat8       := 16#08#;
   --  Port A Data Register bit 4
   PORTA4_Bit               : constant Bit_Number := 4;
   PORTA4                   : constant Nat8       := 16#10#;
   --  Port A Data Register bit 5
   PORTA5_Bit               : constant Bit_Number := 5;
   PORTA5                   : constant Nat8       := 16#20#;
   --  Port A Data Register bit 6
   PORTA6_Bit               : constant Bit_Number := 6;
   PORTA6                   : constant Nat8       := 16#40#;
   --  Port A Data Register bit 7
   PORTA7_Bit               : constant Bit_Number := 7;
   PORTA7                   : constant Nat8       := 16#80#;

   --  Port A Data Direction Register
   DDRA                     : constant System.Address := 16#21#;
   --  Data Direction Register, Port A, bit 0
   DDA0_Bit                 : constant Bit_Number := 0;
   DDA0                     : constant Nat8       := 16#01#;
   --  Data Direction Register, Port A, bit 1
   DDA1_Bit                 : constant Bit_Number := 1;
   DDA1                     : constant Nat8       := 16#02#;
   --  Data Direction Register, Port A, bit 2
   DDA2_Bit                 : constant Bit_Number := 2;
   DDA2                     : constant Nat8       := 16#04#;
   --  Data Direction Register, Port A, bit 3
   DDA3_Bit                 : constant Bit_Number := 3;
   DDA3                     : constant Nat8       := 16#08#;
   --  Data Direction Register, Port A, bit 4
   DDA4_Bit                 : constant Bit_Number := 4;
   DDA4                     : constant Nat8       := 16#10#;
   --  Data Direction Register, Port A, bit 5
   DDA5_Bit                 : constant Bit_Number := 5;
   DDA5                     : constant Nat8       := 16#20#;
   --  Data Direction Register, Port A, bit 6
   DDA6_Bit                 : constant Bit_Number := 6;
   DDA6                     : constant Nat8       := 16#40#;
   --  Data Direction Register, Port A, bit 7
   DDA7_Bit                 : constant Bit_Number := 7;
   DDA7                     : constant Nat8       := 16#80#;

   --  Port A Input Pins
   PINA                     : constant System.Address := 16#20#;
   --  Input Pins, Port A bit 0
   PINA0_Bit                : constant Bit_Number := 0;
   PINA0                    : constant Nat8       := 16#01#;
   --  Input Pins, Port A bit 1
   PINA1_Bit                : constant Bit_Number := 1;
   PINA1                    : constant Nat8       := 16#02#;
   --  Input Pins, Port A bit 2
   PINA2_Bit                : constant Bit_Number := 2;
   PINA2                    : constant Nat8       := 16#04#;
   --  Input Pins, Port A bit 3
   PINA3_Bit                : constant Bit_Number := 3;
   PINA3                    : constant Nat8       := 16#08#;
   --  Input Pins, Port A bit 4
   PINA4_Bit                : constant Bit_Number := 4;
   PINA4                    : constant Nat8       := 16#10#;
   --  Input Pins, Port A bit 5
   PINA5_Bit                : constant Bit_Number := 5;
   PINA5                    : constant Nat8       := 16#20#;
   --  Input Pins, Port A bit 6
   PINA6_Bit                : constant Bit_Number := 6;
   PINA6                    : constant Nat8       := 16#40#;
   --  Input Pins, Port A bit 7
   PINA7_Bit                : constant Bit_Number := 7;
   PINA7                    : constant Nat8       := 16#80#;



   --
   --  available assembler instructions
   --
   --  type to designate the instruction core of the devices.  See
   --  the help file of Atmel's "AVR Assembler 2".
   type Instruction_Core_Type is (V0, V0E, V1, V2, V2E, V3);
   Instruction_Core  : constant Instruction_Core_Type := V2E;
   Have_lpm_rd_Zplus : constant Boolean               := True;
   EEprom_8bit_Addr  : constant Boolean               :=
     (EEprom_Size <= 16#0100#);


end AVR.ATmega406;
