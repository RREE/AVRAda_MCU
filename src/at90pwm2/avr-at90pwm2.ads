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

with System;                   use System;  --   make Address visible
with Interfaces;               use Interfaces;

package AVR.AT90PWM2 is
   pragma Preelaborate;

   CVS_Version : constant String := "$Id: avr-at90pwm2.ads 881 2008-11-16 22:55:31Z Rolf_Ebert $";


   --
   --  memory sizes
   --
   Flash_Size               : constant := 16#2000#;
   Flash_End                : constant := 16#1fff#;
   EEprom_Size              : constant := 16#0200#;
   E2end                    : constant := 16#01ff#;
   Int_SRAM_Start_Addr      : constant := 16#0100#;
   Int_SRAM_Size            : constant := 16#200#;

   --
   --  interrupts
   --
   Number_Of_Interrupts     : constant := 32;

   --  External Pin, Power-on Reset, Brown-out Reset, Watchdog Reset and
   --    JTAG AVR Reset
   Sig_RESET                : constant        :=  0;
   Sig_RESET_String         : constant String := "__vector_0";
   --  PSC2 Capture Event
   Sig_PSC2_CAPT            : constant        :=  1;
   Sig_PSC2_CAPT_String     : constant String := "__vector_1";
   --  PSC2 End Cycle
   Sig_PSC2_EC              : constant        :=  2;
   Sig_PSC2_EC_String       : constant String := "__vector_2";
   --  PSC1 Capture Event
   Sig_PSC1_CAPT            : constant        :=  3;
   Sig_PSC1_CAPT_String     : constant String := "__vector_3";
   --  PSC1 End Cycle
   Sig_PSC1_EC              : constant        :=  4;
   Sig_PSC1_EC_String       : constant String := "__vector_4";
   --  PSC0 Capture Event
   Sig_PSC0_CAPT            : constant        :=  5;
   Sig_PSC0_CAPT_String     : constant String := "__vector_5";
   --  PSC0 End Cycle
   Sig_PSC0_EC              : constant        :=  6;
   Sig_PSC0_EC_String       : constant String := "__vector_6";
   --  Analog Comparator 0
   Sig_ANALOG_COMP_0        : constant        :=  7;
   Sig_ANALOG_COMP_0_String : constant String := "__vector_7";
   --  Analog Comparator 1
   Sig_ANALOG_COMP_1        : constant        :=  8;
   Sig_ANALOG_COMP_1_String : constant String := "__vector_8";
   --  Analog Comparator 2
   Sig_ANALOG_COMP_2        : constant        :=  9;
   Sig_ANALOG_COMP_2_String : constant String := "__vector_9";
   --  External Interrupt Request 0
   Sig_INT0                 : constant        := 10;
   Sig_INT0_String          : constant String := "__vector_10";
   --  Timer/Counter1 Capture Event
   Sig_TIMER1_CAPT          : constant        := 11;
   Sig_TIMER1_CAPT_String   : constant String := "__vector_11";
   --  Timer/Counter1 Compare Match A
   Sig_TIMER1_COMPA         : constant        := 12;
   Sig_TIMER1_COMPA_String  : constant String := "__vector_12";
   --  Timer/Counter Compare Match B
   Sig_TIMER1_COMPB         : constant        := 13;
   Sig_TIMER1_COMPB_String  : constant String := "__vector_13";
   --  
   Sig_RESERVED15           : constant        := 14;
   Sig_RESERVED15_String    : constant String := "__vector_14";
   --  Timer/Counter1 Overflow
   Sig_TIMER1_OVF           : constant        := 15;
   Sig_TIMER1_OVF_String    : constant String := "__vector_15";
   --  Timer/Counter0 Compare Match A
   Sig_TIMER0_COMP_A        : constant        := 16;
   Sig_TIMER0_COMP_A_String : constant String := "__vector_16";
   --  Timer/Counter0 Overflow
   Sig_TIMER0_OVF           : constant        := 17;
   Sig_TIMER0_OVF_String    : constant String := "__vector_17";
   --  ADC Conversion Complete
   Sig_ADC                  : constant        := 18;
   Sig_ADC_String           : constant String := "__vector_18";
   --  External Interrupt Request 1
   Sig_INT1                 : constant        := 19;
   Sig_INT1_String          : constant String := "__vector_19";
   --  SPI Serial Transfer Complete
   Sig_SPI_STC              : constant        := 20;
   Sig_SPI_STC_String       : constant String := "__vector_20";
   --  USART, Rx Complete
   Sig_USART_RX             : constant        := 21;
   Sig_USART_RX_String      : constant String := "__vector_21";
   --  USART Data Register Empty
   Sig_USART_UDRE           : constant        := 22;
   Sig_USART_UDRE_String    : constant String := "__vector_22";
   --  USART, Tx Complete
   Sig_USART_TX             : constant        := 23;
   Sig_USART_TX_String      : constant String := "__vector_23";
   --  External Interrupt Request 2
   Sig_INT2                 : constant        := 24;
   Sig_INT2_String          : constant String := "__vector_24";
   --  Watchdog Timeout Interrupt
   Sig_WDT                  : constant        := 25;
   Sig_WDT_String           : constant String := "__vector_25";
   --  EEPROM Ready
   Sig_EE_READY             : constant        := 26;
   Sig_EE_READY_String      : constant String := "__vector_26";
   --  Timer Counter 0 Compare Match B
   Sig_TIMER0_COMPB         : constant        := 27;
   Sig_TIMER0_COMPB_String  : constant String := "__vector_27";
   --  External Interrupt Request 3
   Sig_INT3                 : constant        := 28;
   Sig_INT3_String          : constant String := "__vector_28";
   --  
   Sig_RESERVED30           : constant        := 29;
   Sig_RESERVED30_String    : constant String := "__vector_29";
   --  
   Sig_RESERVED31           : constant        := 30;
   Sig_RESERVED31_String    : constant String := "__vector_30";
   --  Store Program Memory Read
   Sig_SPM_READY            : constant        := 31;
   Sig_SPM_READY_String     : constant String := "__vector_31";


   --
   --  I/O registers
   --

   --  PSC 2 Input Capture Register High
   PICR2H_Addr              : constant Address    := 16#ff#;
   PICR2H                   : Unsigned_8 ;
   for PICR2H'Address use PICR2H_Addr;
   pragma Volatile (PICR2H);
   PICR2H_Bits              : Bits_In_Byte;
   for PICR2H_Bits'Address use PICR2H_Addr;
   pragma Volatile (PICR2H_Bits);
   PICR2_8_Bit              : constant Bit_Number := 0;
   PICR2_8_Mask             : constant Unsigned_8 := 16#01#;
   PICR2_9_Bit              : constant Bit_Number := 1;
   PICR2_9_Mask             : constant Unsigned_8 := 16#02#;
   PICR2_10_Bit             : constant Bit_Number := 2;
   PICR2_10_Mask            : constant Unsigned_8 := 16#04#;
   PICR2_11_Bit             : constant Bit_Number := 3;
   PICR2_11_Mask            : constant Unsigned_8 := 16#08#;

   --  PSC 2 Input Capture Register Low
   PICR2L_Addr              : constant Address    := 16#fe#;
   PICR2                    : Unsigned_16;
   for PICR2'Address use PICR2L_Addr;
   pragma Volatile (PICR2);
   PICR2L                   : Unsigned_8 ;
   for PICR2L'Address use PICR2L_Addr;
   pragma Volatile (PICR2L);
   PICR2L_Bits              : Bits_In_Byte;
   for PICR2L_Bits'Address use PICR2L_Addr;
   pragma Volatile (PICR2L_Bits);
   PICR2_0_Bit              : constant Bit_Number := 0;
   PICR2_0_Mask             : constant Unsigned_8 := 16#01#;
   PICR2_1_Bit              : constant Bit_Number := 1;
   PICR2_1_Mask             : constant Unsigned_8 := 16#02#;
   PICR2_2_Bit              : constant Bit_Number := 2;
   PICR2_2_Mask             : constant Unsigned_8 := 16#04#;
   PICR2_3_Bit              : constant Bit_Number := 3;
   PICR2_3_Mask             : constant Unsigned_8 := 16#08#;
   PICR2_4_Bit              : constant Bit_Number := 4;
   PICR2_4_Mask             : constant Unsigned_8 := 16#10#;
   PICR2_5_Bit              : constant Bit_Number := 5;
   PICR2_5_Mask             : constant Unsigned_8 := 16#20#;
   PICR2_6_Bit              : constant Bit_Number := 6;
   PICR2_6_Mask             : constant Unsigned_8 := 16#40#;
   PICR2_7_Bit              : constant Bit_Number := 7;
   PICR2_7_Mask             : constant Unsigned_8 := 16#80#;

   --  PSC 2 Input B Control
   PFRC2B_Addr              : constant Address    := 16#fd#;
   PFRC2B                   : Unsigned_8 ;
   for PFRC2B'Address use PFRC2B_Addr;
   pragma Volatile (PFRC2B);
   PFRC2B_Bits              : Bits_In_Byte;
   for PFRC2B_Bits'Address use PFRC2B_Addr;
   pragma Volatile (PFRC2B_Bits);
   --  PSC 2 Retrigger and Fault Mode for Part B
   PRFM2B0_Bit              : constant Bit_Number := 0;
   PRFM2B0_Mask             : constant Unsigned_8 := 16#01#;
   --  PSC 2 Retrigger and Fault Mode for Part B
   PRFM2B1_Bit              : constant Bit_Number := 1;
   PRFM2B1_Mask             : constant Unsigned_8 := 16#02#;
   --  PSC 2 Retrigger and Fault Mode for Part B
   PRFM2B2_Bit              : constant Bit_Number := 2;
   PRFM2B2_Mask             : constant Unsigned_8 := 16#04#;
   --  PSC 2 Retrigger and Fault Mode for Part B
   PRFM2B3_Bit              : constant Bit_Number := 3;
   PRFM2B3_Mask             : constant Unsigned_8 := 16#08#;
   --  PSC 2 Filter Enable on Input Part B
   PFLTE2B_Bit              : constant Bit_Number := 4;
   PFLTE2B_Mask             : constant Unsigned_8 := 16#10#;
   --  PSC 2 Edge Level Selector on Input Part B
   PELEV2B_Bit              : constant Bit_Number := 5;
   PELEV2B_Mask             : constant Unsigned_8 := 16#20#;
   --  PSC 2 Input Select for Part B
   PISEL2B_Bit              : constant Bit_Number := 6;
   PISEL2B_Mask             : constant Unsigned_8 := 16#40#;
   --  PSC 2 Capture Enable Input Part B
   PCAE2B_Bit               : constant Bit_Number := 7;
   PCAE2B_Mask              : constant Unsigned_8 := 16#80#;

   --  PSC 2 Input B Control
   PFRC2A_Addr              : constant Address    := 16#fc#;
   PFRC2A                   : Unsigned_8 ;
   for PFRC2A'Address use PFRC2A_Addr;
   pragma Volatile (PFRC2A);
   PFRC2A_Bits              : Bits_In_Byte;
   for PFRC2A_Bits'Address use PFRC2A_Addr;
   pragma Volatile (PFRC2A_Bits);
   --  PSC 2 Retrigger and Fault Mode for Part A
   PRFM2A0_Bit              : constant Bit_Number := 0;
   PRFM2A0_Mask             : constant Unsigned_8 := 16#01#;
   --  PSC 2 Retrigger and Fault Mode for Part A
   PRFM2A1_Bit              : constant Bit_Number := 1;
   PRFM2A1_Mask             : constant Unsigned_8 := 16#02#;
   --  PSC 2 Retrigger and Fault Mode for Part A
   PRFM2A2_Bit              : constant Bit_Number := 2;
   PRFM2A2_Mask             : constant Unsigned_8 := 16#04#;
   --  PSC 2 Retrigger and Fault Mode for Part A
   PRFM2A3_Bit              : constant Bit_Number := 3;
   PRFM2A3_Mask             : constant Unsigned_8 := 16#08#;
   --  PSC 2 Filter Enable on Input Part A
   PFLTE2A_Bit              : constant Bit_Number := 4;
   PFLTE2A_Mask             : constant Unsigned_8 := 16#10#;
   --  PSC 2 Edge Level Selector on Input Part A
   PELEV2A_Bit              : constant Bit_Number := 5;
   PELEV2A_Mask             : constant Unsigned_8 := 16#20#;
   --  PSC 2 Input Select for Part A
   PISEL2A_Bit              : constant Bit_Number := 6;
   PISEL2A_Mask             : constant Unsigned_8 := 16#40#;
   --  PSC 2 Capture Enable Input Part A
   PCAE2A_Bit               : constant Bit_Number := 7;
   PCAE2A_Mask              : constant Unsigned_8 := 16#80#;

   --  PSC 2 Control Register
   PCTL2_Addr               : constant Address    := 16#fb#;
   PCTL2                    : Unsigned_8 ;
   for PCTL2'Address use PCTL2_Addr;
   pragma Volatile (PCTL2);
   PCTL2_Bits               : Bits_In_Byte;
   for PCTL2_Bits'Address use PCTL2_Addr;
   pragma Volatile (PCTL2_Bits);
   --  PSC 2 Run
   PRUN2_Bit                : constant Bit_Number := 0;
   PRUN2_Mask               : constant Unsigned_8 := 16#01#;
   --  PSC2 Complete Cycle
   PCCYC2_Bit               : constant Bit_Number := 1;
   PCCYC2_Mask              : constant Unsigned_8 := 16#02#;
   --  PSC2 Auto Run
   PARUN2_Bit               : constant Bit_Number := 2;
   PARUN2_Mask              : constant Unsigned_8 := 16#04#;
   --  PSC 2 Asynchronous Output Control A
   PAOC2A_Bit               : constant Bit_Number := 3;
   PAOC2A_Mask              : constant Unsigned_8 := 16#08#;
   --  PSC 2 Asynchronous Output Control B
   PAOC2B_Bit               : constant Bit_Number := 4;
   PAOC2B_Mask              : constant Unsigned_8 := 16#10#;
   --  Balance Flank Width Modulation
   PBFM2_Bit                : constant Bit_Number := 5;
   PBFM2_Mask               : constant Unsigned_8 := 16#20#;
   --  PSC 2 Prescaler Select 0
   PPRE20_Bit               : constant Bit_Number := 6;
   PPRE20_Mask              : constant Unsigned_8 := 16#40#;
   --  PSC 2 Prescaler Select 1
   PPRE21_Bit               : constant Bit_Number := 7;
   PPRE21_Mask              : constant Unsigned_8 := 16#80#;

   --  PSC 2 Configuration Register
   PCNF2_Addr               : constant Address    := 16#fa#;
   PCNF2                    : Unsigned_8 ;
   for PCNF2'Address use PCNF2_Addr;
   pragma Volatile (PCNF2);
   PCNF2_Bits               : Bits_In_Byte;
   for PCNF2_Bits'Address use PCNF2_Addr;
   pragma Volatile (PCNF2_Bits);
   --  PSC 2 Output Matrix Enable
   POME2_Bit                : constant Bit_Number := 0;
   POME2_Mask               : constant Unsigned_8 := 16#01#;
   --  PSC 2 Input Clock Select
   PCLKSEL2_Bit             : constant Bit_Number := 1;
   PCLKSEL2_Mask            : constant Unsigned_8 := 16#02#;
   --  PSC 2 Output Polarity
   POP2_Bit                 : constant Bit_Number := 2;
   POP2_Mask                : constant Unsigned_8 := 16#04#;
   --  PSC 2 Mode
   PMODE20_Bit              : constant Bit_Number := 3;
   PMODE20_Mask             : constant Unsigned_8 := 16#08#;
   --  PSC 2 Mode
   PMODE21_Bit              : constant Bit_Number := 4;
   PMODE21_Mask             : constant Unsigned_8 := 16#10#;
   --  PSC 2 Lock
   PLOCK2_Bit               : constant Bit_Number := 5;
   PLOCK2_Mask              : constant Unsigned_8 := 16#20#;
   --  PSC 2 Autolock
   PALOCK2_Bit              : constant Bit_Number := 6;
   PALOCK2_Mask             : constant Unsigned_8 := 16#40#;
   --  PSC 2 Fifty
   PFIFTY2_Bit              : constant Bit_Number := 7;
   PFIFTY2_Mask             : constant Unsigned_8 := 16#80#;

   --  Output Compare RB Register High
   OCR2RBH_Addr             : constant Address    := 16#f9#;
   OCR2RBH                  : Unsigned_8 ;
   for OCR2RBH'Address use OCR2RBH_Addr;
   pragma Volatile (OCR2RBH);
   OCR2RBH_Bits             : Bits_In_Byte;
   for OCR2RBH_Bits'Address use OCR2RBH_Addr;
   pragma Volatile (OCR2RBH_Bits);
   OCR2RB_8_Bit             : constant Bit_Number := 0;
   OCR2RB_8_Mask            : constant Unsigned_8 := 16#01#;
   OCR2RB_9_Bit             : constant Bit_Number := 1;
   OCR2RB_9_Mask            : constant Unsigned_8 := 16#02#;
   OCR2RB_10_Bit            : constant Bit_Number := 2;
   OCR2RB_10_Mask           : constant Unsigned_8 := 16#04#;
   OCR2RB_11_Bit            : constant Bit_Number := 3;
   OCR2RB_11_Mask           : constant Unsigned_8 := 16#08#;
   OCR2RB_12_Bit            : constant Bit_Number := 4;
   OCR2RB_12_Mask           : constant Unsigned_8 := 16#10#;
   OCR2RB_13_Bit            : constant Bit_Number := 5;
   OCR2RB_13_Mask           : constant Unsigned_8 := 16#20#;
   OCR2RB_14_Bit            : constant Bit_Number := 6;
   OCR2RB_14_Mask           : constant Unsigned_8 := 16#40#;
   OCR2RB_15_Bit            : constant Bit_Number := 7;
   OCR2RB_15_Mask           : constant Unsigned_8 := 16#80#;

   --  Output Compare RB Register Low
   OCR2RBL_Addr             : constant Address    := 16#f8#;
   OCR2RB                   : Unsigned_16;
   for OCR2RB'Address use OCR2RBL_Addr;
   pragma Volatile (OCR2RB);
   OCR2RBL                  : Unsigned_8 ;
   for OCR2RBL'Address use OCR2RBL_Addr;
   pragma Volatile (OCR2RBL);
   OCR2RBL_Bits             : Bits_In_Byte;
   for OCR2RBL_Bits'Address use OCR2RBL_Addr;
   pragma Volatile (OCR2RBL_Bits);
   OCR2RB_0_Bit             : constant Bit_Number := 0;
   OCR2RB_0_Mask            : constant Unsigned_8 := 16#01#;
   OCR2RB_1_Bit             : constant Bit_Number := 1;
   OCR2RB_1_Mask            : constant Unsigned_8 := 16#02#;
   OCR2RB_2_Bit             : constant Bit_Number := 2;
   OCR2RB_2_Mask            : constant Unsigned_8 := 16#04#;
   OCR2RB_3_Bit             : constant Bit_Number := 3;
   OCR2RB_3_Mask            : constant Unsigned_8 := 16#08#;
   OCR2RB_4_Bit             : constant Bit_Number := 4;
   OCR2RB_4_Mask            : constant Unsigned_8 := 16#10#;
   OCR2RB_5_Bit             : constant Bit_Number := 5;
   OCR2RB_5_Mask            : constant Unsigned_8 := 16#20#;
   OCR2RB_6_Bit             : constant Bit_Number := 6;
   OCR2RB_6_Mask            : constant Unsigned_8 := 16#40#;
   OCR2RB_7_Bit             : constant Bit_Number := 7;
   OCR2RB_7_Mask            : constant Unsigned_8 := 16#80#;

   --  Output Compare SB Register High
   OCR2SBH_Addr             : constant Address    := 16#f7#;
   OCR2SBH                  : Unsigned_8 ;
   for OCR2SBH'Address use OCR2SBH_Addr;
   pragma Volatile (OCR2SBH);
   OCR2SBH_Bits             : Bits_In_Byte;
   for OCR2SBH_Bits'Address use OCR2SBH_Addr;
   pragma Volatile (OCR2SBH_Bits);
   OCR2SB_8_Bit             : constant Bit_Number := 0;
   OCR2SB_8_Mask            : constant Unsigned_8 := 16#01#;
   OCR2SB_9_Bit             : constant Bit_Number := 1;
   OCR2SB_9_Mask            : constant Unsigned_8 := 16#02#;
   OCR2SB_10_Bit            : constant Bit_Number := 2;
   OCR2SB_10_Mask           : constant Unsigned_8 := 16#04#;
   OCR2SB_11_Bit            : constant Bit_Number := 3;
   OCR2SB_11_Mask           : constant Unsigned_8 := 16#08#;

   --  Output Compare SB Register Low
   OCR2SBL_Addr             : constant Address    := 16#f6#;
   OCR2SB                   : Unsigned_16;
   for OCR2SB'Address use OCR2SBL_Addr;
   pragma Volatile (OCR2SB);
   OCR2SBL                  : Unsigned_8 ;
   for OCR2SBL'Address use OCR2SBL_Addr;
   pragma Volatile (OCR2SBL);
   OCR2SBL_Bits             : Bits_In_Byte;
   for OCR2SBL_Bits'Address use OCR2SBL_Addr;
   pragma Volatile (OCR2SBL_Bits);
   OCR2SB_0_Bit             : constant Bit_Number := 0;
   OCR2SB_0_Mask            : constant Unsigned_8 := 16#01#;
   OCR2SB_1_Bit             : constant Bit_Number := 1;
   OCR2SB_1_Mask            : constant Unsigned_8 := 16#02#;
   OCR2SB_2_Bit             : constant Bit_Number := 2;
   OCR2SB_2_Mask            : constant Unsigned_8 := 16#04#;
   OCR2SB_3_Bit             : constant Bit_Number := 3;
   OCR2SB_3_Mask            : constant Unsigned_8 := 16#08#;
   OCR2SB_4_Bit             : constant Bit_Number := 4;
   OCR2SB_4_Mask            : constant Unsigned_8 := 16#10#;
   OCR2SB_5_Bit             : constant Bit_Number := 5;
   OCR2SB_5_Mask            : constant Unsigned_8 := 16#20#;
   OCR2SB_6_Bit             : constant Bit_Number := 6;
   OCR2SB_6_Mask            : constant Unsigned_8 := 16#40#;
   OCR2SB_7_Bit             : constant Bit_Number := 7;
   OCR2SB_7_Mask            : constant Unsigned_8 := 16#80#;

   --  Output Compare RA Register High
   OCR2RAH_Addr             : constant Address    := 16#f5#;
   OCR2RAH                  : Unsigned_8 ;
   for OCR2RAH'Address use OCR2RAH_Addr;
   pragma Volatile (OCR2RAH);
   OCR2RAH_Bits             : Bits_In_Byte;
   for OCR2RAH_Bits'Address use OCR2RAH_Addr;
   pragma Volatile (OCR2RAH_Bits);
   OCR2RA_8_Bit             : constant Bit_Number := 0;
   OCR2RA_8_Mask            : constant Unsigned_8 := 16#01#;
   OCR2RA_9_Bit             : constant Bit_Number := 1;
   OCR2RA_9_Mask            : constant Unsigned_8 := 16#02#;
   OCR2RA_10_Bit            : constant Bit_Number := 2;
   OCR2RA_10_Mask           : constant Unsigned_8 := 16#04#;
   OCR2RA_11_Bit            : constant Bit_Number := 3;
   OCR2RA_11_Mask           : constant Unsigned_8 := 16#08#;

   --  Output Compare RA Register Low
   OCR2RAL_Addr             : constant Address    := 16#f4#;
   OCR2RA                   : Unsigned_16;
   for OCR2RA'Address use OCR2RAL_Addr;
   pragma Volatile (OCR2RA);
   OCR2RAL                  : Unsigned_8 ;
   for OCR2RAL'Address use OCR2RAL_Addr;
   pragma Volatile (OCR2RAL);
   OCR2RAL_Bits             : Bits_In_Byte;
   for OCR2RAL_Bits'Address use OCR2RAL_Addr;
   pragma Volatile (OCR2RAL_Bits);
   OCR2RA_0_Bit             : constant Bit_Number := 0;
   OCR2RA_0_Mask            : constant Unsigned_8 := 16#01#;
   OCR2RA_1_Bit             : constant Bit_Number := 1;
   OCR2RA_1_Mask            : constant Unsigned_8 := 16#02#;
   OCR2RA_2_Bit             : constant Bit_Number := 2;
   OCR2RA_2_Mask            : constant Unsigned_8 := 16#04#;
   OCR2RA_3_Bit             : constant Bit_Number := 3;
   OCR2RA_3_Mask            : constant Unsigned_8 := 16#08#;
   OCR2RA_4_Bit             : constant Bit_Number := 4;
   OCR2RA_4_Mask            : constant Unsigned_8 := 16#10#;
   OCR2RA_5_Bit             : constant Bit_Number := 5;
   OCR2RA_5_Mask            : constant Unsigned_8 := 16#20#;
   OCR2RA_6_Bit             : constant Bit_Number := 6;
   OCR2RA_6_Mask            : constant Unsigned_8 := 16#40#;
   OCR2RA_7_Bit             : constant Bit_Number := 7;
   OCR2RA_7_Mask            : constant Unsigned_8 := 16#80#;

   --  Output Compare SA Register High
   OCR2SAH_Addr             : constant Address    := 16#f3#;
   OCR2SAH                  : Unsigned_8 ;
   for OCR2SAH'Address use OCR2SAH_Addr;
   pragma Volatile (OCR2SAH);
   OCR2SAH_Bits             : Bits_In_Byte;
   for OCR2SAH_Bits'Address use OCR2SAH_Addr;
   pragma Volatile (OCR2SAH_Bits);
   OCR2SA_8_Bit             : constant Bit_Number := 0;
   OCR2SA_8_Mask            : constant Unsigned_8 := 16#01#;
   OCR2SA_9_Bit             : constant Bit_Number := 1;
   OCR2SA_9_Mask            : constant Unsigned_8 := 16#02#;
   OCR2SA_10_Bit            : constant Bit_Number := 2;
   OCR2SA_10_Mask           : constant Unsigned_8 := 16#04#;
   OCR2SA_11_Bit            : constant Bit_Number := 3;
   OCR2SA_11_Mask           : constant Unsigned_8 := 16#08#;

   --  Output Compare SA Register Low
   OCR2SAL_Addr             : constant Address    := 16#f2#;
   OCR2SA                   : Unsigned_16;
   for OCR2SA'Address use OCR2SAL_Addr;
   pragma Volatile (OCR2SA);
   OCR2SAL                  : Unsigned_8 ;
   for OCR2SAL'Address use OCR2SAL_Addr;
   pragma Volatile (OCR2SAL);
   OCR2SAL_Bits             : Bits_In_Byte;
   for OCR2SAL_Bits'Address use OCR2SAL_Addr;
   pragma Volatile (OCR2SAL_Bits);
   OCR2SA_0_Bit             : constant Bit_Number := 0;
   OCR2SA_0_Mask            : constant Unsigned_8 := 16#01#;
   OCR2SA_1_Bit             : constant Bit_Number := 1;
   OCR2SA_1_Mask            : constant Unsigned_8 := 16#02#;
   OCR2SA_2_Bit             : constant Bit_Number := 2;
   OCR2SA_2_Mask            : constant Unsigned_8 := 16#04#;
   OCR2SA_3_Bit             : constant Bit_Number := 3;
   OCR2SA_3_Mask            : constant Unsigned_8 := 16#08#;
   OCR2SA_4_Bit             : constant Bit_Number := 4;
   OCR2SA_4_Mask            : constant Unsigned_8 := 16#10#;
   OCR2SA_5_Bit             : constant Bit_Number := 5;
   OCR2SA_5_Mask            : constant Unsigned_8 := 16#20#;
   OCR2SA_6_Bit             : constant Bit_Number := 6;
   OCR2SA_6_Mask            : constant Unsigned_8 := 16#40#;
   OCR2SA_7_Bit             : constant Bit_Number := 7;
   OCR2SA_7_Mask            : constant Unsigned_8 := 16#80#;

   --  PSC 2 Output Matrix
   POM2_Addr                : constant Address    := 16#f1#;
   POM2                     : Unsigned_8 ;
   for POM2'Address use POM2_Addr;
   pragma Volatile (POM2);
   POM2_Bits                : Bits_In_Byte;
   for POM2_Bits'Address use POM2_Addr;
   pragma Volatile (POM2_Bits);
   --  Output Matrix Output A Ramp 0
   POMV2A0_Bit              : constant Bit_Number := 0;
   POMV2A0_Mask             : constant Unsigned_8 := 16#01#;
   --  Output Matrix Output A Ramp 1
   POMV2A1_Bit              : constant Bit_Number := 1;
   POMV2A1_Mask             : constant Unsigned_8 := 16#02#;
   --  Output Matrix Output A Ramp 2
   POMV2A2_Bit              : constant Bit_Number := 2;
   POMV2A2_Mask             : constant Unsigned_8 := 16#04#;
   --  Output Matrix Output A Ramp 3
   POMV2A3_Bit              : constant Bit_Number := 3;
   POMV2A3_Mask             : constant Unsigned_8 := 16#08#;
   --  Output Matrix Output B Ramp 0
   POMV2B0_Bit              : constant Bit_Number := 4;
   POMV2B0_Mask             : constant Unsigned_8 := 16#10#;
   --  Output Matrix Output B Ramp 2
   POMV2B1_Bit              : constant Bit_Number := 5;
   POMV2B1_Mask             : constant Unsigned_8 := 16#20#;
   --  Output Matrix Output B Ramp 2
   POMV2B2_Bit              : constant Bit_Number := 6;
   POMV2B2_Mask             : constant Unsigned_8 := 16#40#;
   --  Output Matrix Output B Ramp 3
   POMV2B3_Bit              : constant Bit_Number := 7;
   POMV2B3_Mask             : constant Unsigned_8 := 16#80#;

   --  PSC2 Synchro and Output Configuration
   PSOC2_Addr               : constant Address    := 16#f0#;
   PSOC2                    : Unsigned_8 ;
   for PSOC2'Address use PSOC2_Addr;
   pragma Volatile (PSOC2);
   PSOC2_Bits               : Bits_In_Byte;
   for PSOC2_Bits'Address use PSOC2_Addr;
   pragma Volatile (PSOC2_Bits);
   --  PSCOUT20 Output Enable
   POEN2A_Bit               : constant Bit_Number := 0;
   POEN2A_Mask              : constant Unsigned_8 := 16#01#;
   --  PSCOUT22 Output Enable
   POEN2C_Bit               : constant Bit_Number := 1;
   POEN2C_Mask              : constant Unsigned_8 := 16#02#;
   --  PSCOUT21 Output Enable
   POEN2B_Bit               : constant Bit_Number := 2;
   POEN2B_Mask              : constant Unsigned_8 := 16#04#;
   --  PSCOUT23 Output Enable
   POEN2D_Bit               : constant Bit_Number := 3;
   POEN2D_Mask              : constant Unsigned_8 := 16#08#;
   --  Synchronization Out for ADC Selection
   PSYNC2_0_Bit             : constant Bit_Number := 4;
   PSYNC2_0_Mask            : constant Unsigned_8 := 16#10#;
   --  Synchronization Out for ADC Selection
   PSYNC2_1_Bit             : constant Bit_Number := 5;
   PSYNC2_1_Mask            : constant Unsigned_8 := 16#20#;
   --  PSC 2 Output 22 Select
   POS22_Bit                : constant Bit_Number := 6;
   POS22_Mask               : constant Unsigned_8 := 16#40#;
   --  PSC 2 Output 23 Select
   POS23_Bit                : constant Bit_Number := 7;
   POS23_Mask               : constant Unsigned_8 := 16#80#;

   --  PSC 0 Input Capture Register High
   PICR0H_Addr              : constant Address    := 16#df#;
   PICR0H                   : Unsigned_8 ;
   for PICR0H'Address use PICR0H_Addr;
   pragma Volatile (PICR0H);
   PICR0H_Bits              : Bits_In_Byte;
   for PICR0H_Bits'Address use PICR0H_Addr;
   pragma Volatile (PICR0H_Bits);
   PICR0_8_Bit              : constant Bit_Number := 0;
   PICR0_8_Mask             : constant Unsigned_8 := 16#01#;
   PICR0_9_Bit              : constant Bit_Number := 1;
   PICR0_9_Mask             : constant Unsigned_8 := 16#02#;
   PICR0_10_Bit             : constant Bit_Number := 2;
   PICR0_10_Mask            : constant Unsigned_8 := 16#04#;
   PICR0_11_Bit             : constant Bit_Number := 3;
   PICR0_11_Mask            : constant Unsigned_8 := 16#08#;

   --  PSC 0 Input Capture Register Low
   PICR0L_Addr              : constant Address    := 16#de#;
   PICR0                    : Unsigned_16;
   for PICR0'Address use PICR0L_Addr;
   pragma Volatile (PICR0);
   PICR0L                   : Unsigned_8 ;
   for PICR0L'Address use PICR0L_Addr;
   pragma Volatile (PICR0L);
   PICR0L_Bits              : Bits_In_Byte;
   for PICR0L_Bits'Address use PICR0L_Addr;
   pragma Volatile (PICR0L_Bits);
   PICR0_0_Bit              : constant Bit_Number := 0;
   PICR0_0_Mask             : constant Unsigned_8 := 16#01#;
   PICR0_1_Bit              : constant Bit_Number := 1;
   PICR0_1_Mask             : constant Unsigned_8 := 16#02#;
   PICR0_2_Bit              : constant Bit_Number := 2;
   PICR0_2_Mask             : constant Unsigned_8 := 16#04#;
   PICR0_3_Bit              : constant Bit_Number := 3;
   PICR0_3_Mask             : constant Unsigned_8 := 16#08#;
   PICR0_4_Bit              : constant Bit_Number := 4;
   PICR0_4_Mask             : constant Unsigned_8 := 16#10#;
   PICR0_5_Bit              : constant Bit_Number := 5;
   PICR0_5_Mask             : constant Unsigned_8 := 16#20#;
   PICR0_6_Bit              : constant Bit_Number := 6;
   PICR0_6_Mask             : constant Unsigned_8 := 16#40#;
   PICR0_7_Bit              : constant Bit_Number := 7;
   PICR0_7_Mask             : constant Unsigned_8 := 16#80#;

   --  PSC 0 Input B Control
   PFRC0B_Addr              : constant Address    := 16#dd#;
   PFRC0B                   : Unsigned_8 ;
   for PFRC0B'Address use PFRC0B_Addr;
   pragma Volatile (PFRC0B);
   PFRC0B_Bits              : Bits_In_Byte;
   for PFRC0B_Bits'Address use PFRC0B_Addr;
   pragma Volatile (PFRC0B_Bits);
   --  PSC 0 Retrigger and Fault Mode for Part B
   PRFM0B0_Bit              : constant Bit_Number := 0;
   PRFM0B0_Mask             : constant Unsigned_8 := 16#01#;
   --  PSC 0 Retrigger and Fault Mode for Part B
   PRFM0B1_Bit              : constant Bit_Number := 1;
   PRFM0B1_Mask             : constant Unsigned_8 := 16#02#;
   --  PSC 0 Retrigger and Fault Mode for Part B
   PRFM0B2_Bit              : constant Bit_Number := 2;
   PRFM0B2_Mask             : constant Unsigned_8 := 16#04#;
   --  PSC 0 Retrigger and Fault Mode for Part B
   PRFM0B3_Bit              : constant Bit_Number := 3;
   PRFM0B3_Mask             : constant Unsigned_8 := 16#08#;
   --  PSC 0 Filter Enable on Input Part B
   PFLTE0B_Bit              : constant Bit_Number := 4;
   PFLTE0B_Mask             : constant Unsigned_8 := 16#10#;
   --  PSC 0 Edge Level Selector on Input Part B
   PELEV0B_Bit              : constant Bit_Number := 5;
   PELEV0B_Mask             : constant Unsigned_8 := 16#20#;
   --  PSC 0 Input Select for Part B
   PISEL0B_Bit              : constant Bit_Number := 6;
   PISEL0B_Mask             : constant Unsigned_8 := 16#40#;
   --  PSC 0 Capture Enable Input Part B
   PCAE0B_Bit               : constant Bit_Number := 7;
   PCAE0B_Mask              : constant Unsigned_8 := 16#80#;

   --  PSC 0 Input A Control
   PFRC0A_Addr              : constant Address    := 16#dc#;
   PFRC0A                   : Unsigned_8 ;
   for PFRC0A'Address use PFRC0A_Addr;
   pragma Volatile (PFRC0A);
   PFRC0A_Bits              : Bits_In_Byte;
   for PFRC0A_Bits'Address use PFRC0A_Addr;
   pragma Volatile (PFRC0A_Bits);
   --  PSC 0 Retrigger and Fault Mode for Part A
   PRFM0A0_Bit              : constant Bit_Number := 0;
   PRFM0A0_Mask             : constant Unsigned_8 := 16#01#;
   --  PSC 0 Retrigger and Fault Mode for Part A
   PRFM0A1_Bit              : constant Bit_Number := 1;
   PRFM0A1_Mask             : constant Unsigned_8 := 16#02#;
   --  PSC 0 Retrigger and Fault Mode for Part A
   PRFM0A2_Bit              : constant Bit_Number := 2;
   PRFM0A2_Mask             : constant Unsigned_8 := 16#04#;
   --  PSC 0 Retrigger and Fault Mode for Part A
   PRFM0A3_Bit              : constant Bit_Number := 3;
   PRFM0A3_Mask             : constant Unsigned_8 := 16#08#;
   --  PSC 0 Filter Enable on Input Part A
   PFLTE0A_Bit              : constant Bit_Number := 4;
   PFLTE0A_Mask             : constant Unsigned_8 := 16#10#;
   --  PSC 0 Edge Level Selector on Input Part A
   PELEV0A_Bit              : constant Bit_Number := 5;
   PELEV0A_Mask             : constant Unsigned_8 := 16#20#;
   --  PSC 0 Input Select for Part A
   PISEL0A_Bit              : constant Bit_Number := 6;
   PISEL0A_Mask             : constant Unsigned_8 := 16#40#;
   --  PSC 0 Capture Enable Input Part A
   PCAE0A_Bit               : constant Bit_Number := 7;
   PCAE0A_Mask              : constant Unsigned_8 := 16#80#;

   --  PSC 0 Control Register
   PCTL0_Addr               : constant Address    := 16#db#;
   PCTL0                    : Unsigned_8 ;
   for PCTL0'Address use PCTL0_Addr;
   pragma Volatile (PCTL0);
   PCTL0_Bits               : Bits_In_Byte;
   for PCTL0_Bits'Address use PCTL0_Addr;
   pragma Volatile (PCTL0_Bits);
   --  PSC 0 Run
   PRUN0_Bit                : constant Bit_Number := 0;
   PRUN0_Mask               : constant Unsigned_8 := 16#01#;
   --  PSC0 Complete Cycle
   PCCYC0_Bit               : constant Bit_Number := 1;
   PCCYC0_Mask              : constant Unsigned_8 := 16#02#;
   --  PSC0 Auto Run
   PARUN0_Bit               : constant Bit_Number := 2;
   PARUN0_Mask              : constant Unsigned_8 := 16#04#;
   --  PSC 0 Asynchronous Output Control A
   PAOC0A_Bit               : constant Bit_Number := 3;
   PAOC0A_Mask              : constant Unsigned_8 := 16#08#;
   --  PSC 0 Asynchronous Output Control B
   PAOC0B_Bit               : constant Bit_Number := 4;
   PAOC0B_Mask              : constant Unsigned_8 := 16#10#;
   --  PSC 0 Balance Flank Width Modulation
   PBFM0_Bit                : constant Bit_Number := 5;
   PBFM0_Mask               : constant Unsigned_8 := 16#20#;
   --  PSC 0 Prescaler Select 0
   PPRE00_Bit               : constant Bit_Number := 6;
   PPRE00_Mask              : constant Unsigned_8 := 16#40#;
   --  PSC 0 Prescaler Select 1
   PPRE01_Bit               : constant Bit_Number := 7;
   PPRE01_Mask              : constant Unsigned_8 := 16#80#;

   --  PSC 0 Configuration Register
   PCNF0_Addr               : constant Address    := 16#da#;
   PCNF0                    : Unsigned_8 ;
   for PCNF0'Address use PCNF0_Addr;
   pragma Volatile (PCNF0);
   PCNF0_Bits               : Bits_In_Byte;
   for PCNF0_Bits'Address use PCNF0_Addr;
   pragma Volatile (PCNF0_Bits);
   --  PSC 0 Input Clock Select
   PCLKSEL0_Bit             : constant Bit_Number := 1;
   PCLKSEL0_Mask            : constant Unsigned_8 := 16#02#;
   --  PSC 0 Output Polarity
   POP0_Bit                 : constant Bit_Number := 2;
   POP0_Mask                : constant Unsigned_8 := 16#04#;
   --  PSC 0 Mode
   PMODE00_Bit              : constant Bit_Number := 3;
   PMODE00_Mask             : constant Unsigned_8 := 16#08#;
   --  PSC 0 Mode
   PMODE01_Bit              : constant Bit_Number := 4;
   PMODE01_Mask             : constant Unsigned_8 := 16#10#;
   --  PSC 0 Lock
   PLOCK0_Bit               : constant Bit_Number := 5;
   PLOCK0_Mask              : constant Unsigned_8 := 16#20#;
   --  PSC 0 Autolock
   PALOCK0_Bit              : constant Bit_Number := 6;
   PALOCK0_Mask             : constant Unsigned_8 := 16#40#;
   --  PSC 0 Fifty
   PFIFTY0_Bit              : constant Bit_Number := 7;
   PFIFTY0_Mask             : constant Unsigned_8 := 16#80#;

   --  Output Compare RB Register High
   OCR0RBH_Addr             : constant Address    := 16#d9#;
   OCR0RBH                  : Unsigned_8 ;
   for OCR0RBH'Address use OCR0RBH_Addr;
   pragma Volatile (OCR0RBH);
   OCR0RBH_Bits             : Bits_In_Byte;
   for OCR0RBH_Bits'Address use OCR0RBH_Addr;
   pragma Volatile (OCR0RBH_Bits);
   OCR0RB_8_Bit             : constant Bit_Number := 0;
   OCR0RB_8_Mask            : constant Unsigned_8 := 16#01#;
   OCR0RB_9_Bit             : constant Bit_Number := 1;
   OCR0RB_9_Mask            : constant Unsigned_8 := 16#02#;
   OCR0RB_00_Bit            : constant Bit_Number := 2;
   OCR0RB_00_Mask           : constant Unsigned_8 := 16#04#;
   OCR0RB_01_Bit            : constant Bit_Number := 3;
   OCR0RB_01_Mask           : constant Unsigned_8 := 16#08#;
   OCR0RB_02_Bit            : constant Bit_Number := 4;
   OCR0RB_02_Mask           : constant Unsigned_8 := 16#10#;
   OCR0RB_03_Bit            : constant Bit_Number := 5;
   OCR0RB_03_Mask           : constant Unsigned_8 := 16#20#;
   OCR0RB_04_Bit            : constant Bit_Number := 6;
   OCR0RB_04_Mask           : constant Unsigned_8 := 16#40#;
   OCR0RB_05_Bit            : constant Bit_Number := 7;
   OCR0RB_05_Mask           : constant Unsigned_8 := 16#80#;

   --  Output Compare RB Register Low
   OCR0RBL_Addr             : constant Address    := 16#d8#;
   OCR0RB                   : Unsigned_16;
   for OCR0RB'Address use OCR0RBL_Addr;
   pragma Volatile (OCR0RB);
   OCR0RBL                  : Unsigned_8 ;
   for OCR0RBL'Address use OCR0RBL_Addr;
   pragma Volatile (OCR0RBL);
   OCR0RBL_Bits             : Bits_In_Byte;
   for OCR0RBL_Bits'Address use OCR0RBL_Addr;
   pragma Volatile (OCR0RBL_Bits);
   OCR0RB_0_Bit             : constant Bit_Number := 0;
   OCR0RB_0_Mask            : constant Unsigned_8 := 16#01#;
   OCR0RB_1_Bit             : constant Bit_Number := 1;
   OCR0RB_1_Mask            : constant Unsigned_8 := 16#02#;
   OCR0RB_2_Bit             : constant Bit_Number := 2;
   OCR0RB_2_Mask            : constant Unsigned_8 := 16#04#;
   OCR0RB_3_Bit             : constant Bit_Number := 3;
   OCR0RB_3_Mask            : constant Unsigned_8 := 16#08#;
   OCR0RB_4_Bit             : constant Bit_Number := 4;
   OCR0RB_4_Mask            : constant Unsigned_8 := 16#10#;
   OCR0RB_5_Bit             : constant Bit_Number := 5;
   OCR0RB_5_Mask            : constant Unsigned_8 := 16#20#;
   OCR0RB_6_Bit             : constant Bit_Number := 6;
   OCR0RB_6_Mask            : constant Unsigned_8 := 16#40#;
   OCR0RB_7_Bit             : constant Bit_Number := 7;
   OCR0RB_7_Mask            : constant Unsigned_8 := 16#80#;

   --  Output Compare SB Register High
   OCR0SBH_Addr             : constant Address    := 16#d7#;
   OCR0SBH                  : Unsigned_8 ;
   for OCR0SBH'Address use OCR0SBH_Addr;
   pragma Volatile (OCR0SBH);
   OCR0SBH_Bits             : Bits_In_Byte;
   for OCR0SBH_Bits'Address use OCR0SBH_Addr;
   pragma Volatile (OCR0SBH_Bits);
   OCR0SB_8_Bit             : constant Bit_Number := 0;
   OCR0SB_8_Mask            : constant Unsigned_8 := 16#01#;
   OCR0SB_9_Bit             : constant Bit_Number := 1;
   OCR0SB_9_Mask            : constant Unsigned_8 := 16#02#;
   OCR0SB_00_Bit            : constant Bit_Number := 2;
   OCR0SB_00_Mask           : constant Unsigned_8 := 16#04#;
   OCR0SB_01_Bit            : constant Bit_Number := 3;
   OCR0SB_01_Mask           : constant Unsigned_8 := 16#08#;

   --  Output Compare SB Register Low
   OCR0SBL_Addr             : constant Address    := 16#d6#;
   OCR0SB                   : Unsigned_16;
   for OCR0SB'Address use OCR0SBL_Addr;
   pragma Volatile (OCR0SB);
   OCR0SBL                  : Unsigned_8 ;
   for OCR0SBL'Address use OCR0SBL_Addr;
   pragma Volatile (OCR0SBL);
   OCR0SBL_Bits             : Bits_In_Byte;
   for OCR0SBL_Bits'Address use OCR0SBL_Addr;
   pragma Volatile (OCR0SBL_Bits);
   OCR0SB_0_Bit             : constant Bit_Number := 0;
   OCR0SB_0_Mask            : constant Unsigned_8 := 16#01#;
   OCR0SB_1_Bit             : constant Bit_Number := 1;
   OCR0SB_1_Mask            : constant Unsigned_8 := 16#02#;
   OCR0SB_2_Bit             : constant Bit_Number := 2;
   OCR0SB_2_Mask            : constant Unsigned_8 := 16#04#;
   OCR0SB_3_Bit             : constant Bit_Number := 3;
   OCR0SB_3_Mask            : constant Unsigned_8 := 16#08#;
   OCR0SB_4_Bit             : constant Bit_Number := 4;
   OCR0SB_4_Mask            : constant Unsigned_8 := 16#10#;
   OCR0SB_5_Bit             : constant Bit_Number := 5;
   OCR0SB_5_Mask            : constant Unsigned_8 := 16#20#;
   OCR0SB_6_Bit             : constant Bit_Number := 6;
   OCR0SB_6_Mask            : constant Unsigned_8 := 16#40#;
   OCR0SB_7_Bit             : constant Bit_Number := 7;
   OCR0SB_7_Mask            : constant Unsigned_8 := 16#80#;

   --  Output Compare RA Register High
   OCR0RAH_Addr             : constant Address    := 16#d5#;
   OCR0RAH                  : Unsigned_8 ;
   for OCR0RAH'Address use OCR0RAH_Addr;
   pragma Volatile (OCR0RAH);
   OCR0RAH_Bits             : Bits_In_Byte;
   for OCR0RAH_Bits'Address use OCR0RAH_Addr;
   pragma Volatile (OCR0RAH_Bits);
   OCR0RA_8_Bit             : constant Bit_Number := 0;
   OCR0RA_8_Mask            : constant Unsigned_8 := 16#01#;
   OCR0RA_9_Bit             : constant Bit_Number := 1;
   OCR0RA_9_Mask            : constant Unsigned_8 := 16#02#;
   OCR0RA_00_Bit            : constant Bit_Number := 2;
   OCR0RA_00_Mask           : constant Unsigned_8 := 16#04#;
   OCR0RA_01_Bit            : constant Bit_Number := 3;
   OCR0RA_01_Mask           : constant Unsigned_8 := 16#08#;

   --  Output Compare RA Register Low
   OCR0RAL_Addr             : constant Address    := 16#d4#;
   OCR0RA                   : Unsigned_16;
   for OCR0RA'Address use OCR0RAL_Addr;
   pragma Volatile (OCR0RA);
   OCR0RAL                  : Unsigned_8 ;
   for OCR0RAL'Address use OCR0RAL_Addr;
   pragma Volatile (OCR0RAL);
   OCR0RAL_Bits             : Bits_In_Byte;
   for OCR0RAL_Bits'Address use OCR0RAL_Addr;
   pragma Volatile (OCR0RAL_Bits);
   OCR0RA_0_Bit             : constant Bit_Number := 0;
   OCR0RA_0_Mask            : constant Unsigned_8 := 16#01#;
   OCR0RA_1_Bit             : constant Bit_Number := 1;
   OCR0RA_1_Mask            : constant Unsigned_8 := 16#02#;
   OCR0RA_2_Bit             : constant Bit_Number := 2;
   OCR0RA_2_Mask            : constant Unsigned_8 := 16#04#;
   OCR0RA_3_Bit             : constant Bit_Number := 3;
   OCR0RA_3_Mask            : constant Unsigned_8 := 16#08#;
   OCR0RA_4_Bit             : constant Bit_Number := 4;
   OCR0RA_4_Mask            : constant Unsigned_8 := 16#10#;
   OCR0RA_5_Bit             : constant Bit_Number := 5;
   OCR0RA_5_Mask            : constant Unsigned_8 := 16#20#;
   OCR0RA_6_Bit             : constant Bit_Number := 6;
   OCR0RA_6_Mask            : constant Unsigned_8 := 16#40#;
   OCR0RA_7_Bit             : constant Bit_Number := 7;
   OCR0RA_7_Mask            : constant Unsigned_8 := 16#80#;

   --  Output Compare SA Register High
   OCR0SAH_Addr             : constant Address    := 16#d3#;
   OCR0SAH                  : Unsigned_8 ;
   for OCR0SAH'Address use OCR0SAH_Addr;
   pragma Volatile (OCR0SAH);
   OCR0SAH_Bits             : Bits_In_Byte;
   for OCR0SAH_Bits'Address use OCR0SAH_Addr;
   pragma Volatile (OCR0SAH_Bits);
   OCR0SA_8_Bit             : constant Bit_Number := 0;
   OCR0SA_8_Mask            : constant Unsigned_8 := 16#01#;
   OCR0SA_9_Bit             : constant Bit_Number := 1;
   OCR0SA_9_Mask            : constant Unsigned_8 := 16#02#;
   OCR0SA_00_Bit            : constant Bit_Number := 2;
   OCR0SA_00_Mask           : constant Unsigned_8 := 16#04#;
   OCR0SA_01_Bit            : constant Bit_Number := 3;
   OCR0SA_01_Mask           : constant Unsigned_8 := 16#08#;

   --  Output Compare SA Register Low
   OCR0SAL_Addr             : constant Address    := 16#d2#;
   OCR0SA                   : Unsigned_16;
   for OCR0SA'Address use OCR0SAL_Addr;
   pragma Volatile (OCR0SA);
   OCR0SAL                  : Unsigned_8 ;
   for OCR0SAL'Address use OCR0SAL_Addr;
   pragma Volatile (OCR0SAL);
   OCR0SAL_Bits             : Bits_In_Byte;
   for OCR0SAL_Bits'Address use OCR0SAL_Addr;
   pragma Volatile (OCR0SAL_Bits);
   OCR0SA_0_Bit             : constant Bit_Number := 0;
   OCR0SA_0_Mask            : constant Unsigned_8 := 16#01#;
   OCR0SA_1_Bit             : constant Bit_Number := 1;
   OCR0SA_1_Mask            : constant Unsigned_8 := 16#02#;
   OCR0SA_2_Bit             : constant Bit_Number := 2;
   OCR0SA_2_Mask            : constant Unsigned_8 := 16#04#;
   OCR0SA_3_Bit             : constant Bit_Number := 3;
   OCR0SA_3_Mask            : constant Unsigned_8 := 16#08#;
   OCR0SA_4_Bit             : constant Bit_Number := 4;
   OCR0SA_4_Mask            : constant Unsigned_8 := 16#10#;
   OCR0SA_5_Bit             : constant Bit_Number := 5;
   OCR0SA_5_Mask            : constant Unsigned_8 := 16#20#;
   OCR0SA_6_Bit             : constant Bit_Number := 6;
   OCR0SA_6_Mask            : constant Unsigned_8 := 16#40#;
   OCR0SA_7_Bit             : constant Bit_Number := 7;
   OCR0SA_7_Mask            : constant Unsigned_8 := 16#80#;

   --  PSC0 Synchro and Output Configuration
   PSOC0_Addr               : constant Address    := 16#d0#;
   PSOC0                    : Unsigned_8 ;
   for PSOC0'Address use PSOC0_Addr;
   pragma Volatile (PSOC0);
   PSOC0_Bits               : Bits_In_Byte;
   for PSOC0_Bits'Address use PSOC0_Addr;
   pragma Volatile (PSOC0_Bits);
   --  PSCOUT00 Output Enable
   POEN0A_Bit               : constant Bit_Number := 0;
   POEN0A_Mask              : constant Unsigned_8 := 16#01#;
   --  PSCOUT01 Output Enable
   POEN0B_Bit               : constant Bit_Number := 2;
   POEN0B_Mask              : constant Unsigned_8 := 16#04#;
   --  Synchronization Out for ADC Selection
   PSYNC00_Bit              : constant Bit_Number := 4;
   PSYNC00_Mask             : constant Unsigned_8 := 16#10#;
   --  Synchronization Out for ADC Selection
   PSYNC01_Bit              : constant Bit_Number := 5;
   PSYNC01_Mask             : constant Unsigned_8 := 16#20#;

   --  EUSART I/O Data Register
   EUDR_Addr                : constant Address    := 16#ce#;
   EUDR                     : Unsigned_8 ;
   for EUDR'Address use EUDR_Addr;
   pragma Volatile (EUDR);
   EUDR_Bits                : Bits_In_Byte;
   for EUDR_Bits'Address use EUDR_Addr;
   pragma Volatile (EUDR_Bits);
   --  EUSART I/O Data Register bit 0
   EUDR0_Bit                : constant Bit_Number := 0;
   EUDR0_Mask               : constant Unsigned_8 := 16#01#;
   --  EUSART I/O Data Register bit 1
   EUDR1_Bit                : constant Bit_Number := 1;
   EUDR1_Mask               : constant Unsigned_8 := 16#02#;
   --  EUSART I/O Data Register bit 2
   EUDR2_Bit                : constant Bit_Number := 2;
   EUDR2_Mask               : constant Unsigned_8 := 16#04#;
   --  EUSART I/O Data Register bit 3
   EUDR3_Bit                : constant Bit_Number := 3;
   EUDR3_Mask               : constant Unsigned_8 := 16#08#;
   --  EUSART I/O Data Register bit 4
   EUDR4_Bit                : constant Bit_Number := 4;
   EUDR4_Mask               : constant Unsigned_8 := 16#10#;
   --  EUSART I/O Data Register bit 5
   EUDR5_Bit                : constant Bit_Number := 5;
   EUDR5_Mask               : constant Unsigned_8 := 16#20#;
   --  EUSART I/O Data Register bit 6
   EUDR6_Bit                : constant Bit_Number := 6;
   EUDR6_Mask               : constant Unsigned_8 := 16#40#;
   --  EUSART I/O Data Register bit 7
   EUDR7_Bit                : constant Bit_Number := 7;
   EUDR7_Mask               : constant Unsigned_8 := 16#80#;

   --  Manchester Receiver Baud Rate Register High Byte
   MUBRRH_Addr              : constant Address    := 16#cd#;
   MUBRRH                   : Unsigned_8 ;
   for MUBRRH'Address use MUBRRH_Addr;
   pragma Volatile (MUBRRH);
   MUBRRH_Bits              : Bits_In_Byte;
   for MUBRRH_Bits'Address use MUBRRH_Addr;
   pragma Volatile (MUBRRH_Bits);
   --  Manchester Receiver Baud Rate Register Bit 8
   MUBRR8_Bit               : constant Bit_Number := 0;
   MUBRR8_Mask              : constant Unsigned_8 := 16#01#;
   --  Manchester Receiver Baud Rate Register Bit 9
   MUBRR9_Bit               : constant Bit_Number := 1;
   MUBRR9_Mask              : constant Unsigned_8 := 16#02#;
   --  Manchester Receiver Baud Rate Register Bit 10
   MUBRR10_Bit              : constant Bit_Number := 2;
   MUBRR10_Mask             : constant Unsigned_8 := 16#04#;
   --  Manchester Receiver Baud Rate Register Bit 11
   MUBRR11_Bit              : constant Bit_Number := 3;
   MUBRR11_Mask             : constant Unsigned_8 := 16#08#;
   --  Manchester Receiver Baud Rate Register Bit 12
   MUBRR12_Bit              : constant Bit_Number := 4;
   MUBRR12_Mask             : constant Unsigned_8 := 16#10#;
   --  Manchester Receiver Baud Rate Register Bit 13
   MUBRR13_Bit              : constant Bit_Number := 5;
   MUBRR13_Mask             : constant Unsigned_8 := 16#20#;
   --  Manchester Receiver Baud Rate Register Bit 14
   MUBRR14_Bit              : constant Bit_Number := 6;
   MUBRR14_Mask             : constant Unsigned_8 := 16#40#;
   --  Manchester Receiver Baud Rate Register Bit 15
   MUBRR15_Bit              : constant Bit_Number := 7;
   MUBRR15_Mask             : constant Unsigned_8 := 16#80#;

   --  Manchester Receiver Baud Rate Register Low Byte
   MUBRRL_Addr              : constant Address    := 16#cc#;
   MUBRR                    : Unsigned_16;
   for MUBRR'Address use MUBRRL_Addr;
   pragma Volatile (MUBRR);
   MUBRRL                   : Unsigned_8 ;
   for MUBRRL'Address use MUBRRL_Addr;
   pragma Volatile (MUBRRL);
   MUBRRL_Bits              : Bits_In_Byte;
   for MUBRRL_Bits'Address use MUBRRL_Addr;
   pragma Volatile (MUBRRL_Bits);
   --  Manchester Receiver Baud Rate Register Bit 0
   MUBRR0_Bit               : constant Bit_Number := 0;
   MUBRR0_Mask              : constant Unsigned_8 := 16#01#;
   --  Manchester Receiver Baud Rate Register Bit 1
   MUBRR1_Bit               : constant Bit_Number := 1;
   MUBRR1_Mask              : constant Unsigned_8 := 16#02#;
   --  Manchester Receiver Baud Rate Register Bit 2
   MUBRR2_Bit               : constant Bit_Number := 2;
   MUBRR2_Mask              : constant Unsigned_8 := 16#04#;
   --  Manchester Receiver Baud Rate Register Bit 3
   MUBRR3_Bit               : constant Bit_Number := 3;
   MUBRR3_Mask              : constant Unsigned_8 := 16#08#;
   --  Manchester Receiver Baud Rate Register Bit 4
   MUBRR4_Bit               : constant Bit_Number := 4;
   MUBRR4_Mask              : constant Unsigned_8 := 16#10#;
   --  Manchester Receiver Baud Rate Register Bit 5
   MUBRR5_Bit               : constant Bit_Number := 5;
   MUBRR5_Mask              : constant Unsigned_8 := 16#20#;
   --  Manchester Receiver Baud Rate Register Bit 6
   MUBRR6_Bit               : constant Bit_Number := 6;
   MUBRR6_Mask              : constant Unsigned_8 := 16#40#;
   --  Manchester Receiver Baud Rate Register Bit 7
   MUBRR7_Bit               : constant Bit_Number := 7;
   MUBRR7_Mask              : constant Unsigned_8 := 16#80#;

   --  EUSART Status Register C
   EUCSRC_Addr              : constant Address    := 16#ca#;
   EUCSRC                   : Unsigned_8 ;
   for EUCSRC'Address use EUCSRC_Addr;
   pragma Volatile (EUCSRC);
   EUCSRC_Bits              : Bits_In_Byte;
   for EUCSRC_Bits'Address use EUCSRC_Addr;
   pragma Volatile (EUCSRC_Bits);
   --  Stop Bit 0
   STP0_Bit                 : constant Bit_Number := 0;
   STP0_Mask                : constant Unsigned_8 := 16#01#;
   --  Stop Bit 1
   STP1_Bit                 : constant Bit_Number := 1;
   STP1_Mask                : constant Unsigned_8 := 16#02#;
   --  F1617 Bit
   F1617_Bit                : constant Bit_Number := 2;
   F1617_Mask               : constant Unsigned_8 := 16#04#;
   --  Frame Error Manchester Bit
   FEM_Bit                  : constant Bit_Number := 3;
   FEM_Mask                 : constant Unsigned_8 := 16#08#;

   --  EUSART Control Register B
   EUCSRB_Addr              : constant Address    := 16#c9#;
   EUCSRB                   : Unsigned_8 ;
   for EUCSRB'Address use EUCSRB_Addr;
   pragma Volatile (EUCSRB);
   EUCSRB_Bits              : Bits_In_Byte;
   for EUCSRB_Bits'Address use EUCSRB_Addr;
   pragma Volatile (EUCSRB_Bits);
   --  Order Bit
   BODR_Bit                 : constant Bit_Number := 0;
   BODR_Mask                : constant Unsigned_8 := 16#01#;
   --  Manchester Mode Bit
   EMCH_Bit                 : constant Bit_Number := 1;
   EMCH_Mask                : constant Unsigned_8 := 16#02#;
   --  EUSBS Enable Bit
   EUSBS_Bit                : constant Bit_Number := 3;
   EUSBS_Mask               : constant Unsigned_8 := 16#08#;
   --  EUSART Enable Bit
   EUSART_Bit               : constant Bit_Number := 4;
   EUSART_Mask              : constant Unsigned_8 := 16#10#;

   --  EUSART Control and Status Register A
   EUCSRA_Addr              : constant Address    := 16#c8#;
   EUCSRA                   : Unsigned_8 ;
   for EUCSRA'Address use EUCSRA_Addr;
   pragma Volatile (EUCSRA);
   EUCSRA_Bits              : Bits_In_Byte;
   for EUCSRA_Bits'Address use EUCSRA_Addr;
   pragma Volatile (EUCSRA_Bits);
   --  EUSART Control and Status Register A Bit 0
   URxS0_Bit                : constant Bit_Number := 0;
   URxS0_Mask               : constant Unsigned_8 := 16#01#;
   --  EUSART Control and Status Register A Bit 1
   URxS1_Bit                : constant Bit_Number := 1;
   URxS1_Mask               : constant Unsigned_8 := 16#02#;
   --  EUSART Control and Status Register A Bit 2
   URxS2_Bit                : constant Bit_Number := 2;
   URxS2_Mask               : constant Unsigned_8 := 16#04#;
   --  EUSART Control and Status Register A Bit 3
   URxS3_Bit                : constant Bit_Number := 3;
   URxS3_Mask               : constant Unsigned_8 := 16#08#;
   --  EUSART Control and Status Register A Bit 4
   UTxS0_Bit                : constant Bit_Number := 4;
   UTxS0_Mask               : constant Unsigned_8 := 16#10#;
   --  EUSART Control and Status Register A Bit 5
   UTxS1_Bit                : constant Bit_Number := 5;
   UTxS1_Mask               : constant Unsigned_8 := 16#20#;
   --  EUSART Control and Status Register A Bit 6
   UTxS2_Bit                : constant Bit_Number := 6;
   UTxS2_Mask               : constant Unsigned_8 := 16#40#;
   --  EUSART Control and Status Register A Bit 7
   UTxS3_Bit                : constant Bit_Number := 7;
   UTxS3_Mask               : constant Unsigned_8 := 16#80#;

   --  USART I/O Data Register
   UDR_Addr                 : constant Address    := 16#c6#;
   UDR                      : Unsigned_8 ;
   for UDR'Address use UDR_Addr;
   pragma Volatile (UDR);
   UDR_Bits                 : Bits_In_Byte;
   for UDR_Bits'Address use UDR_Addr;
   pragma Volatile (UDR_Bits);
   --  USART I/O Data Register bit 0
   UDR0_Bit                 : constant Bit_Number := 0;
   UDR0_Mask                : constant Unsigned_8 := 16#01#;
   --  USART I/O Data Register bit 1
   UDR1_Bit                 : constant Bit_Number := 1;
   UDR1_Mask                : constant Unsigned_8 := 16#02#;
   --  USART I/O Data Register bit 2
   UDR2_Bit                 : constant Bit_Number := 2;
   UDR2_Mask                : constant Unsigned_8 := 16#04#;
   --  USART I/O Data Register bit 3
   UDR3_Bit                 : constant Bit_Number := 3;
   UDR3_Mask                : constant Unsigned_8 := 16#08#;
   --  USART I/O Data Register bit 4
   UDR4_Bit                 : constant Bit_Number := 4;
   UDR4_Mask                : constant Unsigned_8 := 16#10#;
   --  USART I/O Data Register bit 5
   UDR5_Bit                 : constant Bit_Number := 5;
   UDR5_Mask                : constant Unsigned_8 := 16#20#;
   --  USART I/O Data Register bit 6
   UDR6_Bit                 : constant Bit_Number := 6;
   UDR6_Mask                : constant Unsigned_8 := 16#40#;
   --  USART I/O Data Register bit 7
   UDR7_Bit                 : constant Bit_Number := 7;
   UDR7_Mask                : constant Unsigned_8 := 16#80#;

   --  USART Baud Rate Register High Byte
   UBRRH_Addr               : constant Address    := 16#c5#;
   UBRRH                    : Unsigned_8 ;
   for UBRRH'Address use UBRRH_Addr;
   pragma Volatile (UBRRH);
   UBRRH_Bits               : Bits_In_Byte;
   for UBRRH_Bits'Address use UBRRH_Addr;
   pragma Volatile (UBRRH_Bits);
   --  USART Baud Rate Register Bit 8
   UBRR8_Bit                : constant Bit_Number := 0;
   UBRR8_Mask               : constant Unsigned_8 := 16#01#;
   --  USART Baud Rate Register Bit 9
   UBRR9_Bit                : constant Bit_Number := 1;
   UBRR9_Mask               : constant Unsigned_8 := 16#02#;
   --  USART Baud Rate Register Bit 10
   UBRR10_Bit               : constant Bit_Number := 2;
   UBRR10_Mask              : constant Unsigned_8 := 16#04#;
   --  USART Baud Rate Register Bit 11
   UBRR11_Bit               : constant Bit_Number := 3;
   UBRR11_Mask              : constant Unsigned_8 := 16#08#;

   --  USART Baud Rate Register Low Byte
   UBRRL_Addr               : constant Address    := 16#c4#;
   UBRR                     : Unsigned_16;
   for UBRR'Address use UBRRL_Addr;
   pragma Volatile (UBRR);
   UBRRL                    : Unsigned_8 ;
   for UBRRL'Address use UBRRL_Addr;
   pragma Volatile (UBRRL);
   UBRRL_Bits               : Bits_In_Byte;
   for UBRRL_Bits'Address use UBRRL_Addr;
   pragma Volatile (UBRRL_Bits);
   --  USART Baud Rate Register bit 0
   UBRR0_Bit                : constant Bit_Number := 0;
   UBRR0_Mask               : constant Unsigned_8 := 16#01#;
   --  USART Baud Rate Register bit 1
   UBRR1_Bit                : constant Bit_Number := 1;
   UBRR1_Mask               : constant Unsigned_8 := 16#02#;
   --  USART Baud Rate Register bit 2
   UBRR2_Bit                : constant Bit_Number := 2;
   UBRR2_Mask               : constant Unsigned_8 := 16#04#;
   --  USART Baud Rate Register bit 3
   UBRR3_Bit                : constant Bit_Number := 3;
   UBRR3_Mask               : constant Unsigned_8 := 16#08#;
   --  USART Baud Rate Register bit 4
   UBRR4_Bit                : constant Bit_Number := 4;
   UBRR4_Mask               : constant Unsigned_8 := 16#10#;
   --  USART Baud Rate Register bit 5
   UBRR5_Bit                : constant Bit_Number := 5;
   UBRR5_Mask               : constant Unsigned_8 := 16#20#;
   --  USART Baud Rate Register bit 6
   UBRR6_Bit                : constant Bit_Number := 6;
   UBRR6_Mask               : constant Unsigned_8 := 16#40#;
   --  USART Baud Rate Register bit 7
   UBRR7_Bit                : constant Bit_Number := 7;
   UBRR7_Mask               : constant Unsigned_8 := 16#80#;

   --  USART Control an Status register C
   UCSRC_Addr               : constant Address    := 16#c2#;
   UCSRC                    : Unsigned_8 ;
   for UCSRC'Address use UCSRC_Addr;
   pragma Volatile (UCSRC);
   UCSRC_Bits               : Bits_In_Byte;
   for UCSRC_Bits'Address use UCSRC_Addr;
   pragma Volatile (UCSRC_Bits);
   --  Clock Polarity
   UCPOL_Bit                : constant Bit_Number := 0;
   UCPOL_Mask               : constant Unsigned_8 := 16#01#;
   --  Character Size Bit 0
   UCSZ0_Bit                : constant Bit_Number := 1;
   UCSZ0_Mask               : constant Unsigned_8 := 16#02#;
   --  Character Size Bit 1
   UCSZ1_Bit                : constant Bit_Number := 2;
   UCSZ1_Mask               : constant Unsigned_8 := 16#04#;
   --  Stop Bit Select
   USBS_Bit                 : constant Bit_Number := 3;
   USBS_Mask                : constant Unsigned_8 := 16#08#;
   --  Parity Mode Bit 0
   UPM0_Bit                 : constant Bit_Number := 4;
   UPM0_Mask                : constant Unsigned_8 := 16#10#;
   --  Parity Mode Bit 1
   UPM1_Bit                 : constant Bit_Number := 5;
   UPM1_Mask                : constant Unsigned_8 := 16#20#;
   --  USART Mode Select
   UMSEL0_Bit               : constant Bit_Number := 6;
   UMSEL0_Mask              : constant Unsigned_8 := 16#40#;

   --  USART Control an Status register B
   UCSRB_Addr               : constant Address    := 16#c1#;
   UCSRB                    : Unsigned_8 ;
   for UCSRB'Address use UCSRB_Addr;
   pragma Volatile (UCSRB);
   UCSRB_Bits               : Bits_In_Byte;
   for UCSRB_Bits'Address use UCSRB_Addr;
   pragma Volatile (UCSRB_Bits);
   --  Transmit Data Bit 8
   TXB8_Bit                 : constant Bit_Number := 0;
   TXB8_Mask                : constant Unsigned_8 := 16#01#;
   --  Receive Data Bit 8
   RXB8_Bit                 : constant Bit_Number := 1;
   RXB8_Mask                : constant Unsigned_8 := 16#02#;
   --  Character Size
   UCSZ2_Bit                : constant Bit_Number := 2;
   UCSZ2_Mask               : constant Unsigned_8 := 16#04#;
   --  Transmitter Enable
   TXEN_Bit                 : constant Bit_Number := 3;
   TXEN_Mask                : constant Unsigned_8 := 16#08#;
   --  Receiver Enable
   RXEN_Bit                 : constant Bit_Number := 4;
   RXEN_Mask                : constant Unsigned_8 := 16#10#;
   --  USART Data Register Empty Interrupt Enable
   UDRIE_Bit                : constant Bit_Number := 5;
   UDRIE_Mask               : constant Unsigned_8 := 16#20#;
   --  TX Complete Interrupt Enable
   TXCIE_Bit                : constant Bit_Number := 6;
   TXCIE_Mask               : constant Unsigned_8 := 16#40#;
   --  RX Complete Interrupt Enable
   RXCIE_Bit                : constant Bit_Number := 7;
   RXCIE_Mask               : constant Unsigned_8 := 16#80#;

   --  USART Control and Status register A
   UCSRA_Addr               : constant Address    := 16#c0#;
   UCSRA                    : Unsigned_8 ;
   for UCSRA'Address use UCSRA_Addr;
   pragma Volatile (UCSRA);
   UCSRA_Bits               : Bits_In_Byte;
   for UCSRA_Bits'Address use UCSRA_Addr;
   pragma Volatile (UCSRA_Bits);
   --  Multi-processor Communication Mode
   MPCM_Bit                 : constant Bit_Number := 0;
   MPCM_Mask                : constant Unsigned_8 := 16#01#;
   --  Double USART Transmission Bit
   U2X_Bit                  : constant Bit_Number := 1;
   U2X_Mask                 : constant Unsigned_8 := 16#02#;
   --  USART Parity Error
   UPE_Bit                  : constant Bit_Number := 2;
   UPE_Mask                 : constant Unsigned_8 := 16#04#;
   --  Data Overrun
   DOR_Bit                  : constant Bit_Number := 3;
   DOR_Mask                 : constant Unsigned_8 := 16#08#;
   --  Framing Error
   FE_Bit                   : constant Bit_Number := 4;
   FE_Mask                  : constant Unsigned_8 := 16#10#;
   --  USART Data Register Empty
   UDRE_Bit                 : constant Bit_Number := 5;
   UDRE_Mask                : constant Unsigned_8 := 16#20#;
   --  USART Transmitt Complete
   TXC_Bit                  : constant Bit_Number := 6;
   TXC_Mask                 : constant Unsigned_8 := 16#40#;
   --  USART Receive Complete
   RXC_Bit                  : constant Bit_Number := 7;
   RXC_Mask                 : constant Unsigned_8 := 16#80#;

   --  Analog Comparator 2 Control Register
   AC2CON_Addr              : constant Address    := 16#af#;
   AC2CON                   : Unsigned_8 ;
   for AC2CON'Address use AC2CON_Addr;
   pragma Volatile (AC2CON);
   AC2CON_Bits              : Bits_In_Byte;
   for AC2CON_Bits'Address use AC2CON_Addr;
   pragma Volatile (AC2CON_Bits);
   --  Analog Comparator 2 Multiplexer Register
   AC2M0_Bit                : constant Bit_Number := 0;
   AC2M0_Mask               : constant Unsigned_8 := 16#01#;
   --  Analog Comparator 2 Multiplexer Regsiter
   AC2M1_Bit                : constant Bit_Number := 1;
   AC2M1_Mask               : constant Unsigned_8 := 16#02#;
   --  Analog Comparator 2 Multiplexer Register
   AC2M2_Bit                : constant Bit_Number := 2;
   AC2M2_Mask               : constant Unsigned_8 := 16#04#;
   --  Analog Comparator 2 Interrupt Select Bit
   AC2IS0_Bit               : constant Bit_Number := 4;
   AC2IS0_Mask              : constant Unsigned_8 := 16#10#;
   --  Analog Comparator 2  Interrupt Select Bit
   AC2IS1_Bit               : constant Bit_Number := 5;
   AC2IS1_Mask              : constant Unsigned_8 := 16#20#;
   --  Analog Comparator 2 Interrupt Enable Bit
   AC2IE_Bit                : constant Bit_Number := 6;
   AC2IE_Mask               : constant Unsigned_8 := 16#40#;
   --  Analog Comparator 2 Enable Bit
   AC2EN_Bit                : constant Bit_Number := 7;
   AC2EN_Mask               : constant Unsigned_8 := 16#80#;

   --  Analog Comparator 1 Control Register
   AC1CON_Addr              : constant Address    := 16#ae#;
   AC1CON                   : Unsigned_8 ;
   for AC1CON'Address use AC1CON_Addr;
   pragma Volatile (AC1CON);
   AC1CON_Bits              : Bits_In_Byte;
   for AC1CON_Bits'Address use AC1CON_Addr;
   pragma Volatile (AC1CON_Bits);
   --  Analog Comparator 1 Multiplexer Register
   AC1M0_Bit                : constant Bit_Number := 0;
   AC1M0_Mask               : constant Unsigned_8 := 16#01#;
   --  Analog Comparator 1 Multiplexer Regsiter
   AC1M1_Bit                : constant Bit_Number := 1;
   AC1M1_Mask               : constant Unsigned_8 := 16#02#;
   --  Analog Comparator 1 Multiplexer Register
   AC1M2_Bit                : constant Bit_Number := 2;
   AC1M2_Mask               : constant Unsigned_8 := 16#04#;
   --  Analog Comparator 1 Interrupt Capture Enable Bit
   AC1ICE_Bit               : constant Bit_Number := 3;
   AC1ICE_Mask              : constant Unsigned_8 := 16#08#;
   --  Analog Comparator 1 Interrupt Select Bit
   AC1IS0_Bit               : constant Bit_Number := 4;
   AC1IS0_Mask              : constant Unsigned_8 := 16#10#;
   --  Analog Comparator 1  Interrupt Select Bit
   AC1IS1_Bit               : constant Bit_Number := 5;
   AC1IS1_Mask              : constant Unsigned_8 := 16#20#;
   --  Analog Comparator 1 Interrupt Enable Bit
   AC1IE_Bit                : constant Bit_Number := 6;
   AC1IE_Mask               : constant Unsigned_8 := 16#40#;
   --  Analog Comparator 1 Enable Bit
   AC1EN_Bit                : constant Bit_Number := 7;
   AC1EN_Mask               : constant Unsigned_8 := 16#80#;

   --  Analog Comparator 0 Control Register
   AC0CON_Addr              : constant Address    := 16#ad#;
   AC0CON                   : Unsigned_8 ;
   for AC0CON'Address use AC0CON_Addr;
   pragma Volatile (AC0CON);
   AC0CON_Bits              : Bits_In_Byte;
   for AC0CON_Bits'Address use AC0CON_Addr;
   pragma Volatile (AC0CON_Bits);
   --  Analog Comparator 0 Multiplexer Register
   AC0M0_Bit                : constant Bit_Number := 0;
   AC0M0_Mask               : constant Unsigned_8 := 16#01#;
   --  Analog Comparator 0 Multiplexer Regsiter
   AC0M1_Bit                : constant Bit_Number := 1;
   AC0M1_Mask               : constant Unsigned_8 := 16#02#;
   --  Analog Comparator 0 Multiplexer Register
   AC0M2_Bit                : constant Bit_Number := 2;
   AC0M2_Mask               : constant Unsigned_8 := 16#04#;
   --  Analog Comparator 0 Interrupt Select Bit
   AC0IS0_Bit               : constant Bit_Number := 4;
   AC0IS0_Mask              : constant Unsigned_8 := 16#10#;
   --  Analog Comparator 0  Interrupt Select Bit
   AC0IS1_Bit               : constant Bit_Number := 5;
   AC0IS1_Mask              : constant Unsigned_8 := 16#20#;
   --  Analog Comparator 0 Interrupt Enable Bit
   AC0IE_Bit                : constant Bit_Number := 6;
   AC0IE_Mask               : constant Unsigned_8 := 16#40#;
   --  Analog Comparator 0 Enable Bit
   AC0EN_Bit                : constant Bit_Number := 7;
   AC0EN_Mask               : constant Unsigned_8 := 16#80#;

   --  DAC Data Register High Byte
   DACH_Addr                : constant Address    := 16#ac#;
   DACH                     : Unsigned_8 ;
   for DACH'Address use DACH_Addr;
   pragma Volatile (DACH);
   DACH_Bits                : Bits_In_Byte;
   for DACH_Bits'Address use DACH_Addr;
   pragma Volatile (DACH_Bits);
   --  DAC Data Register High Byte Bit 0
   DACH0_Bit                : constant Bit_Number := 0;
   DACH0_Mask               : constant Unsigned_8 := 16#01#;
   --  DAC Data Register High Byte Bit 1
   DACH1_Bit                : constant Bit_Number := 1;
   DACH1_Mask               : constant Unsigned_8 := 16#02#;
   --  DAC Data Register High Byte Bit 2
   DACH2_Bit                : constant Bit_Number := 2;
   DACH2_Mask               : constant Unsigned_8 := 16#04#;
   --  DAC Data Register High Byte Bit 3
   DACH3_Bit                : constant Bit_Number := 3;
   DACH3_Mask               : constant Unsigned_8 := 16#08#;
   --  DAC Data Register High Byte Bit 4
   DACH4_Bit                : constant Bit_Number := 4;
   DACH4_Mask               : constant Unsigned_8 := 16#10#;
   --  DAC Data Register High Byte Bit 5
   DACH5_Bit                : constant Bit_Number := 5;
   DACH5_Mask               : constant Unsigned_8 := 16#20#;
   --  DAC Data Register High Byte Bit 6
   DACH6_Bit                : constant Bit_Number := 6;
   DACH6_Mask               : constant Unsigned_8 := 16#40#;
   --  DAC Data Register High Byte Bit 7
   DACH7_Bit                : constant Bit_Number := 7;
   DACH7_Mask               : constant Unsigned_8 := 16#80#;

   --  DAC Data Register Low Byte
   DACL_Addr                : constant Address    := 16#ab#;
   DAC                      : Unsigned_16;
   for DAC'Address use DACL_Addr;
   pragma Volatile (DAC);
   DACL                     : Unsigned_8 ;
   for DACL'Address use DACL_Addr;
   pragma Volatile (DACL);
   DACL_Bits                : Bits_In_Byte;
   for DACL_Bits'Address use DACL_Addr;
   pragma Volatile (DACL_Bits);
   --  DAC Data Register Low Byte Bit 0
   DACL0_Bit                : constant Bit_Number := 0;
   DACL0_Mask               : constant Unsigned_8 := 16#01#;
   --  DAC Data Register Low Byte Bit 1
   DACL1_Bit                : constant Bit_Number := 1;
   DACL1_Mask               : constant Unsigned_8 := 16#02#;
   --  DAC Data Register Low Byte Bit 2
   DACL2_Bit                : constant Bit_Number := 2;
   DACL2_Mask               : constant Unsigned_8 := 16#04#;
   --  DAC Data Register Low Byte Bit 3
   DACL3_Bit                : constant Bit_Number := 3;
   DACL3_Mask               : constant Unsigned_8 := 16#08#;
   --  DAC Data Register Low Byte Bit 4
   DACL4_Bit                : constant Bit_Number := 4;
   DACL4_Mask               : constant Unsigned_8 := 16#10#;
   --  DAC Data Register Low Byte Bit 5
   DACL5_Bit                : constant Bit_Number := 5;
   DACL5_Mask               : constant Unsigned_8 := 16#20#;
   --  DAC Data Register Low Byte Bit 6
   DACL6_Bit                : constant Bit_Number := 6;
   DACL6_Mask               : constant Unsigned_8 := 16#40#;
   --  DAC Data Register Low Byte Bit 7
   DACL7_Bit                : constant Bit_Number := 7;
   DACL7_Mask               : constant Unsigned_8 := 16#80#;

   --  DAC Control Register
   DACON_Addr               : constant Address    := 16#aa#;
   DACON                    : Unsigned_8 ;
   for DACON'Address use DACON_Addr;
   pragma Volatile (DACON);
   DACON_Bits               : Bits_In_Byte;
   for DACON_Bits'Address use DACON_Addr;
   pragma Volatile (DACON_Bits);
   --  DAC Enable Bit
   DAEN_Bit                 : constant Bit_Number := 0;
   DAEN_Mask                : constant Unsigned_8 := 16#01#;
   --  DAC Left Adjust
   DALA_Bit                 : constant Bit_Number := 2;
   DALA_Mask                : constant Unsigned_8 := 16#04#;
   --  DAC Trigger Selection Bit 0
   DATS0_Bit                : constant Bit_Number := 4;
   DATS0_Mask               : constant Unsigned_8 := 16#10#;
   --  DAC Trigger Selection Bit 1
   DATS1_Bit                : constant Bit_Number := 5;
   DATS1_Mask               : constant Unsigned_8 := 16#20#;
   --  DAC Trigger Selection Bit 2
   DATS2_Bit                : constant Bit_Number := 6;
   DATS2_Mask               : constant Unsigned_8 := 16#40#;
   --  DAC Auto Trigger Enable Bit
   DAATE_Bit                : constant Bit_Number := 7;
   DAATE_Mask               : constant Unsigned_8 := 16#80#;

   --  PSC2 Interrupt Mask Register
   PIM2_Addr                : constant Address    := 16#a5#;
   PIM2                     : Unsigned_8 ;
   for PIM2'Address use PIM2_Addr;
   pragma Volatile (PIM2);
   PIM2_Bits                : Bits_In_Byte;
   for PIM2_Bits'Address use PIM2_Addr;
   pragma Volatile (PIM2_Bits);
   --  End of Cycle Interrupt Enable
   PEOPE2_Bit               : constant Bit_Number := 0;
   PEOPE2_Mask              : constant Unsigned_8 := 16#01#;
   --  External Event A Interrupt Enable
   PEVE2A_Bit               : constant Bit_Number := 3;
   PEVE2A_Mask              : constant Unsigned_8 := 16#08#;
   --  External Event B Interrupt Enable
   PEVE2B_Bit               : constant Bit_Number := 4;
   PEVE2B_Mask              : constant Unsigned_8 := 16#10#;
   --  PSC 2 Synchro Error Interrupt Enable
   PSEIE2_Bit               : constant Bit_Number := 5;
   PSEIE2_Mask              : constant Unsigned_8 := 16#20#;

   --  PSC2 Interrupt Flag Register
   PIFR2_Addr               : constant Address    := 16#a4#;
   PIFR2                    : Unsigned_8 ;
   for PIFR2'Address use PIFR2_Addr;
   pragma Volatile (PIFR2);
   PIFR2_Bits               : Bits_In_Byte;
   for PIFR2_Bits'Address use PIFR2_Addr;
   pragma Volatile (PIFR2_Bits);
   --  End of PSC2 Interrupt
   PEOP2_Bit                : constant Bit_Number := 0;
   PEOP2_Mask               : constant Unsigned_8 := 16#01#;
   --  Ramp Number
   PRN20_Bit                : constant Bit_Number := 1;
   PRN20_Mask               : constant Unsigned_8 := 16#02#;
   --  Ramp Number
   PRN21_Bit                : constant Bit_Number := 2;
   PRN21_Mask               : constant Unsigned_8 := 16#04#;
   --  External Event A Interrupt
   PEV2A_Bit                : constant Bit_Number := 3;
   PEV2A_Mask               : constant Unsigned_8 := 16#08#;
   --  External Event B Interrupt
   PEV2B_Bit                : constant Bit_Number := 4;
   PEV2B_Mask               : constant Unsigned_8 := 16#10#;
   --  PSC 2 Synchro Error Interrupt
   PSEI2_Bit                : constant Bit_Number := 5;
   PSEI2_Mask               : constant Unsigned_8 := 16#20#;

   PIM1_Addr                : constant Address    := 16#a3#;
   PIM1                     : Unsigned_8 ;
   for PIM1'Address use PIM1_Addr;
   pragma Volatile (PIM1);
   PIM1_Bits                : Bits_In_Byte;
   for PIM1_Bits'Address use PIM1_Addr;
   pragma Volatile (PIM1_Bits);

   PIFR1_Addr               : constant Address    := 16#a2#;
   PIFR1                    : Unsigned_8 ;
   for PIFR1'Address use PIFR1_Addr;
   pragma Volatile (PIFR1);
   PIFR1_Bits               : Bits_In_Byte;
   for PIFR1_Bits'Address use PIFR1_Addr;
   pragma Volatile (PIFR1_Bits);

   --  PSC0 Interrupt Mask Register
   PIM0_Addr                : constant Address    := 16#a1#;
   PIM0                     : Unsigned_8 ;
   for PIM0'Address use PIM0_Addr;
   pragma Volatile (PIM0);
   PIM0_Bits                : Bits_In_Byte;
   for PIM0_Bits'Address use PIM0_Addr;
   pragma Volatile (PIM0_Bits);
   --  End of Cycle Interrupt Enable
   PEOPE0_Bit               : constant Bit_Number := 0;
   PEOPE0_Mask              : constant Unsigned_8 := 16#01#;
   --  External Event A Interrupt Enable
   PEVE0A_Bit               : constant Bit_Number := 3;
   PEVE0A_Mask              : constant Unsigned_8 := 16#08#;
   --  External Event B Interrupt Enable
   PEVE0B_Bit               : constant Bit_Number := 4;
   PEVE0B_Mask              : constant Unsigned_8 := 16#10#;
   --  PSC 0 Synchro Error Interrupt Enable
   PSEIE0_Bit               : constant Bit_Number := 5;
   PSEIE0_Mask              : constant Unsigned_8 := 16#20#;

   --  PSC0 Interrupt Flag Register
   PIFR0_Addr               : constant Address    := 16#a0#;
   PIFR0                    : Unsigned_8 ;
   for PIFR0'Address use PIFR0_Addr;
   pragma Volatile (PIFR0);
   PIFR0_Bits               : Bits_In_Byte;
   for PIFR0_Bits'Address use PIFR0_Addr;
   pragma Volatile (PIFR0_Bits);
   --  End of PSC0 Interrupt
   PEOP0_Bit                : constant Bit_Number := 0;
   PEOP0_Mask               : constant Unsigned_8 := 16#01#;
   --  Ramp Number
   PRN00_Bit                : constant Bit_Number := 1;
   PRN00_Mask               : constant Unsigned_8 := 16#02#;
   --  Ramp Number
   PRN01_Bit                : constant Bit_Number := 2;
   PRN01_Mask               : constant Unsigned_8 := 16#04#;
   --  External Event A Interrupt
   PEV0A_Bit                : constant Bit_Number := 3;
   PEV0A_Mask               : constant Unsigned_8 := 16#08#;
   --  External Event B Interrupt
   PEV0B_Bit                : constant Bit_Number := 4;
   PEV0B_Mask               : constant Unsigned_8 := 16#10#;
   --  PSC 0 Synchro Error Interrupt
   PSEI0_Bit                : constant Bit_Number := 5;
   PSEI0_Mask               : constant Unsigned_8 := 16#20#;

   --  Timer/Counter1 Output Compare Register High Byte
   OCR1BH_Addr              : constant Address    := 16#8b#;
   OCR1BH                   : Unsigned_8 ;
   for OCR1BH'Address use OCR1BH_Addr;
   pragma Volatile (OCR1BH);
   OCR1BH_Bits              : Bits_In_Byte;
   for OCR1BH_Bits'Address use OCR1BH_Addr;
   pragma Volatile (OCR1BH_Bits);
   --  Timer/Counter1 Output Compare Register High Byte bit 0
   OCR1BH0_Bit              : constant Bit_Number := 0;
   OCR1BH0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Output Compare Register High Byte bit 1
   OCR1BH1_Bit              : constant Bit_Number := 1;
   OCR1BH1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Output Compare Register High Byte bit 2
   OCR1BH2_Bit              : constant Bit_Number := 2;
   OCR1BH2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Output Compare Register High Byte bit 3
   OCR1BH3_Bit              : constant Bit_Number := 3;
   OCR1BH3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter1 Output Compare Register High Byte bit 4
   OCR1BH4_Bit              : constant Bit_Number := 4;
   OCR1BH4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter1 Output Compare Register High Byte bit 5
   OCR1BH5_Bit              : constant Bit_Number := 5;
   OCR1BH5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter1 Output Compare Register High Byte bit 6
   OCR1BH6_Bit              : constant Bit_Number := 6;
   OCR1BH6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter1 Output Compare Register High Byte bit 7
   OCR1BH7_Bit              : constant Bit_Number := 7;
   OCR1BH7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter1 Output Compare Register Low Byte
   OCR1BL_Addr              : constant Address    := 16#8a#;
   OCR1B                    : Unsigned_16;
   for OCR1B'Address use OCR1BL_Addr;
   pragma Volatile (OCR1B);
   OCR1BL                   : Unsigned_8 ;
   for OCR1BL'Address use OCR1BL_Addr;
   pragma Volatile (OCR1BL);
   OCR1BL_Bits              : Bits_In_Byte;
   for OCR1BL_Bits'Address use OCR1BL_Addr;
   pragma Volatile (OCR1BL_Bits);
   --  Timer/Counter1 Output Compare Register Low Byte bit 0
   OCR1BL0_Bit              : constant Bit_Number := 0;
   OCR1BL0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Output Compare Register Low Byte bit 1
   OCR1BL1_Bit              : constant Bit_Number := 1;
   OCR1BL1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Output Compare Register Low Byte bit 2
   OCR1BL2_Bit              : constant Bit_Number := 2;
   OCR1BL2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Output Compare Register Low Byte bit 3
   OCR1BL3_Bit              : constant Bit_Number := 3;
   OCR1BL3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter1 Output Compare Register Low Byte bit 4
   OCR1BL4_Bit              : constant Bit_Number := 4;
   OCR1BL4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter1 Output Compare Register Low Byte bit 5
   OCR1BL5_Bit              : constant Bit_Number := 5;
   OCR1BL5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter1 Output Compare Register Low Byte bit 6
   OCR1BL6_Bit              : constant Bit_Number := 6;
   OCR1BL6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter1 Output Compare Register Low Byte bit 7
   OCR1BL7_Bit              : constant Bit_Number := 7;
   OCR1BL7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter1 Output Compare Register High Byte
   OCR1AH_Addr              : constant Address    := 16#89#;
   OCR1AH                   : Unsigned_8 ;
   for OCR1AH'Address use OCR1AH_Addr;
   pragma Volatile (OCR1AH);
   OCR1AH_Bits              : Bits_In_Byte;
   for OCR1AH_Bits'Address use OCR1AH_Addr;
   pragma Volatile (OCR1AH_Bits);
   --  Timer/Counter1 Output Compare Register High Byte bit 0
   OCR1AH0_Bit              : constant Bit_Number := 0;
   OCR1AH0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Output Compare Register High Byte bit 1
   OCR1AH1_Bit              : constant Bit_Number := 1;
   OCR1AH1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Output Compare Register High Byte bit 2
   OCR1AH2_Bit              : constant Bit_Number := 2;
   OCR1AH2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Output Compare Register High Byte bit 3
   OCR1AH3_Bit              : constant Bit_Number := 3;
   OCR1AH3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter1 Output Compare Register High Byte bit 4
   OCR1AH4_Bit              : constant Bit_Number := 4;
   OCR1AH4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter1 Output Compare Register High Byte bit 5
   OCR1AH5_Bit              : constant Bit_Number := 5;
   OCR1AH5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter1 Output Compare Register High Byte bit 6
   OCR1AH6_Bit              : constant Bit_Number := 6;
   OCR1AH6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter1 Output Compare Register High Byte bit 7
   OCR1AH7_Bit              : constant Bit_Number := 7;
   OCR1AH7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter1 Output Compare Register Low Byte
   OCR1AL_Addr              : constant Address    := 16#88#;
   OCR1A                    : Unsigned_16;
   for OCR1A'Address use OCR1AL_Addr;
   pragma Volatile (OCR1A);
   OCR1AL                   : Unsigned_8 ;
   for OCR1AL'Address use OCR1AL_Addr;
   pragma Volatile (OCR1AL);
   OCR1AL_Bits              : Bits_In_Byte;
   for OCR1AL_Bits'Address use OCR1AL_Addr;
   pragma Volatile (OCR1AL_Bits);
   --  Timer/Counter1 Output Compare Register Low Byte Bit 0
   OCR1AL0_Bit              : constant Bit_Number := 0;
   OCR1AL0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Output Compare Register Low Byte Bit 1
   OCR1AL1_Bit              : constant Bit_Number := 1;
   OCR1AL1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Output Compare Register Low Byte Bit 2
   OCR1AL2_Bit              : constant Bit_Number := 2;
   OCR1AL2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Output Compare Register Low Byte Bit 3
   OCR1AL3_Bit              : constant Bit_Number := 3;
   OCR1AL3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter1 Output Compare Register Low Byte Bit 4
   OCR1AL4_Bit              : constant Bit_Number := 4;
   OCR1AL4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter1 Output Compare Register Low Byte Bit 5
   OCR1AL5_Bit              : constant Bit_Number := 5;
   OCR1AL5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter1 Output Compare Register Low Byte Bit 6
   OCR1AL6_Bit              : constant Bit_Number := 6;
   OCR1AL6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter1 Output Compare Register Low Byte Bit 7
   OCR1AL7_Bit              : constant Bit_Number := 7;
   OCR1AL7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter1 Input Capture Register High Byte
   ICR1H_Addr               : constant Address    := 16#87#;
   ICR1H                    : Unsigned_8 ;
   for ICR1H'Address use ICR1H_Addr;
   pragma Volatile (ICR1H);
   ICR1H_Bits               : Bits_In_Byte;
   for ICR1H_Bits'Address use ICR1H_Addr;
   pragma Volatile (ICR1H_Bits);
   --  Timer/Counter1 Input Capture Register High Byte bit 0
   ICR1H0_Bit               : constant Bit_Number := 0;
   ICR1H0_Mask              : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Input Capture Register High Byte bit 1
   ICR1H1_Bit               : constant Bit_Number := 1;
   ICR1H1_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Input Capture Register High Byte bit 2
   ICR1H2_Bit               : constant Bit_Number := 2;
   ICR1H2_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Input Capture Register High Byte bit 3
   ICR1H3_Bit               : constant Bit_Number := 3;
   ICR1H3_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter1 Input Capture Register High Byte bit 4
   ICR1H4_Bit               : constant Bit_Number := 4;
   ICR1H4_Mask              : constant Unsigned_8 := 16#10#;
   --  Timer/Counter1 Input Capture Register High Byte bit 5
   ICR1H5_Bit               : constant Bit_Number := 5;
   ICR1H5_Mask              : constant Unsigned_8 := 16#20#;
   --  Timer/Counter1 Input Capture Register High Byte bit 6
   ICR1H6_Bit               : constant Bit_Number := 6;
   ICR1H6_Mask              : constant Unsigned_8 := 16#40#;
   --  Timer/Counter1 Input Capture Register High Byte bit 7
   ICR1H7_Bit               : constant Bit_Number := 7;
   ICR1H7_Mask              : constant Unsigned_8 := 16#80#;

   --  Timer/Counter1 Input Capture Register Low Byte
   ICR1L_Addr               : constant Address    := 16#86#;
   ICR1                     : Unsigned_16;
   for ICR1'Address use ICR1L_Addr;
   pragma Volatile (ICR1);
   ICR1L                    : Unsigned_8 ;
   for ICR1L'Address use ICR1L_Addr;
   pragma Volatile (ICR1L);
   ICR1L_Bits               : Bits_In_Byte;
   for ICR1L_Bits'Address use ICR1L_Addr;
   pragma Volatile (ICR1L_Bits);
   --  Timer/Counter1 Input Capture Register Low Byte bit 0
   ICR1L0_Bit               : constant Bit_Number := 0;
   ICR1L0_Mask              : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Input Capture Register Low Byte bit 1
   ICR1L1_Bit               : constant Bit_Number := 1;
   ICR1L1_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Input Capture Register Low Byte bit 2
   ICR1L2_Bit               : constant Bit_Number := 2;
   ICR1L2_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Input Capture Register Low Byte bit 3
   ICR1L3_Bit               : constant Bit_Number := 3;
   ICR1L3_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter1 Input Capture Register Low Byte bit 4
   ICR1L4_Bit               : constant Bit_Number := 4;
   ICR1L4_Mask              : constant Unsigned_8 := 16#10#;
   --  Timer/Counter1 Input Capture Register Low Byte bit 5
   ICR1L5_Bit               : constant Bit_Number := 5;
   ICR1L5_Mask              : constant Unsigned_8 := 16#20#;
   --  Timer/Counter1 Input Capture Register Low Byte bit 6
   ICR1L6_Bit               : constant Bit_Number := 6;
   ICR1L6_Mask              : constant Unsigned_8 := 16#40#;
   --  Timer/Counter1 Input Capture Register Low Byte bit 7
   ICR1L7_Bit               : constant Bit_Number := 7;
   ICR1L7_Mask              : constant Unsigned_8 := 16#80#;

   --  Timer/Counter1 High Byte
   TCNT1H_Addr              : constant Address    := 16#85#;
   TCNT1H                   : Unsigned_8 ;
   for TCNT1H'Address use TCNT1H_Addr;
   pragma Volatile (TCNT1H);
   TCNT1H_Bits              : Bits_In_Byte;
   for TCNT1H_Bits'Address use TCNT1H_Addr;
   pragma Volatile (TCNT1H_Bits);
   --  Timer/Counter1 High Byte bit 0
   TCNT1H0_Bit              : constant Bit_Number := 0;
   TCNT1H0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 High Byte bit 1
   TCNT1H1_Bit              : constant Bit_Number := 1;
   TCNT1H1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 High Byte bit 2
   TCNT1H2_Bit              : constant Bit_Number := 2;
   TCNT1H2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 High Byte bit 3
   TCNT1H3_Bit              : constant Bit_Number := 3;
   TCNT1H3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter1 High Byte bit 4
   TCNT1H4_Bit              : constant Bit_Number := 4;
   TCNT1H4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter1 High Byte bit 5
   TCNT1H5_Bit              : constant Bit_Number := 5;
   TCNT1H5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter1 High Byte bit 6
   TCNT1H6_Bit              : constant Bit_Number := 6;
   TCNT1H6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter1 High Byte bit 7
   TCNT1H7_Bit              : constant Bit_Number := 7;
   TCNT1H7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter1 Low Byte
   TCNT1L_Addr              : constant Address    := 16#84#;
   TCNT1                    : Unsigned_16;
   for TCNT1'Address use TCNT1L_Addr;
   pragma Volatile (TCNT1);
   TCNT1L                   : Unsigned_8 ;
   for TCNT1L'Address use TCNT1L_Addr;
   pragma Volatile (TCNT1L);
   TCNT1L_Bits              : Bits_In_Byte;
   for TCNT1L_Bits'Address use TCNT1L_Addr;
   pragma Volatile (TCNT1L_Bits);
   --  Timer/Counter1 Low Byte bit 0
   TCNT1L0_Bit              : constant Bit_Number := 0;
   TCNT1L0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Low Byte bit 1
   TCNT1L1_Bit              : constant Bit_Number := 1;
   TCNT1L1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Low Byte bit 2
   TCNT1L2_Bit              : constant Bit_Number := 2;
   TCNT1L2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Low Byte bit 3
   TCNT1L3_Bit              : constant Bit_Number := 3;
   TCNT1L3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter1 Low Byte bit 4
   TCNT1L4_Bit              : constant Bit_Number := 4;
   TCNT1L4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter1 Low Byte bit 5
   TCNT1L5_Bit              : constant Bit_Number := 5;
   TCNT1L5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter1 Low Byte bit 6
   TCNT1L6_Bit              : constant Bit_Number := 6;
   TCNT1L6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter1 Low Byte bit 7
   TCNT1L7_Bit              : constant Bit_Number := 7;
   TCNT1L7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter1 Control Register C
   TCCR1C_Addr              : constant Address    := 16#82#;
   TCCR1C                   : Unsigned_8 ;
   for TCCR1C'Address use TCCR1C_Addr;
   pragma Volatile (TCCR1C);
   TCCR1C_Bits              : Bits_In_Byte;
   for TCCR1C_Bits'Address use TCCR1C_Addr;
   pragma Volatile (TCCR1C_Bits);
   FOC1B_Bit                : constant Bit_Number := 6;
   FOC1B_Mask               : constant Unsigned_8 := 16#40#;
   FOC1A_Bit                : constant Bit_Number := 7;
   FOC1A_Mask               : constant Unsigned_8 := 16#80#;

   --  Timer/Counter1 Control Register B
   TCCR1B_Addr              : constant Address    := 16#81#;
   TCCR1B                   : Unsigned_8 ;
   for TCCR1B'Address use TCCR1B_Addr;
   pragma Volatile (TCCR1B);
   TCCR1B_Bits              : Bits_In_Byte;
   for TCCR1B_Bits'Address use TCCR1B_Addr;
   pragma Volatile (TCCR1B_Bits);
   --  Prescaler source of Timer/Counter 1
   CS10_Bit                 : constant Bit_Number := 0;
   CS10_Mask                : constant Unsigned_8 := 16#01#;
   --  Prescaler source of Timer/Counter 1
   CS11_Bit                 : constant Bit_Number := 1;
   CS11_Mask                : constant Unsigned_8 := 16#02#;
   --  Prescaler source of Timer/Counter 1
   CS12_Bit                 : constant Bit_Number := 2;
   CS12_Mask                : constant Unsigned_8 := 16#04#;
   --  Waveform Generation Mode
   WGM12_Bit                : constant Bit_Number := 3;
   WGM12_Mask               : constant Unsigned_8 := 16#08#;
   --  Waveform Generation Mode
   WGM13_Bit                : constant Bit_Number := 4;
   WGM13_Mask               : constant Unsigned_8 := 16#10#;
   --  Input Capture 1 Edge Select
   ICES1_Bit                : constant Bit_Number := 6;
   ICES1_Mask               : constant Unsigned_8 := 16#40#;
   --  Input Capture 1 Noise Canceler
   ICNC1_Bit                : constant Bit_Number := 7;
   ICNC1_Mask               : constant Unsigned_8 := 16#80#;

   --  Timer/Counter1 Control Register A
   TCCR1A_Addr              : constant Address    := 16#80#;
   TCCR1A                   : Unsigned_8 ;
   for TCCR1A'Address use TCCR1A_Addr;
   pragma Volatile (TCCR1A);
   TCCR1A_Bits              : Bits_In_Byte;
   for TCCR1A_Bits'Address use TCCR1A_Addr;
   pragma Volatile (TCCR1A_Bits);
   --  Waveform Generation Mode
   WGM10_Bit                : constant Bit_Number := 0;
   WGM10_Mask               : constant Unsigned_8 := 16#01#;
   --  Waveform Generation Mode
   WGM11_Bit                : constant Bit_Number := 1;
   WGM11_Mask               : constant Unsigned_8 := 16#02#;
   --  Compare Output Mode 1B, bit 0
   COM1B0_Bit               : constant Bit_Number := 4;
   COM1B0_Mask              : constant Unsigned_8 := 16#10#;
   --  Compare Output Mode 1B, bit 1
   COM1B1_Bit               : constant Bit_Number := 5;
   COM1B1_Mask              : constant Unsigned_8 := 16#20#;
   --  Comparet Ouput Mode 1A, bit 0
   COM1A0_Bit               : constant Bit_Number := 6;
   COM1A0_Mask              : constant Unsigned_8 := 16#40#;
   --  Compare Output Mode 1A, bit 1
   COM1A1_Bit               : constant Bit_Number := 7;
   COM1A1_Mask              : constant Unsigned_8 := 16#80#;

   --  Digital Input Disable Register 0
   DIDR1_Addr               : constant Address    := 16#7f#;
   DIDR1                    : Unsigned_8 ;
   for DIDR1'Address use DIDR1_Addr;
   pragma Volatile (DIDR1);
   DIDR1_Bits               : Bits_In_Byte;
   for DIDR1_Bits'Address use DIDR1_Addr;
   pragma Volatile (DIDR1_Bits);
   ADC8D_Bit                : constant Bit_Number := 0;
   ADC8D_Mask               : constant Unsigned_8 := 16#01#;
   ADC9D_Bit                : constant Bit_Number := 1;
   ADC9D_Mask               : constant Unsigned_8 := 16#02#;
   ADC10D_Bit               : constant Bit_Number := 2;
   ADC10D_Mask              : constant Unsigned_8 := 16#04#;
   AMP0ND_Bit               : constant Bit_Number := 3;
   AMP0ND_Mask              : constant Unsigned_8 := 16#08#;
   AMP0PD_Bit               : constant Bit_Number := 4;
   AMP0PD_Mask              : constant Unsigned_8 := 16#10#;
   ACMP0D_Bit               : constant Bit_Number := 5;
   ACMP0D_Mask              : constant Unsigned_8 := 16#20#;

   --  Digital Input Disable Register 0
   DIDR0_Addr               : constant Address    := 16#7e#;
   DIDR0                    : Unsigned_8 ;
   for DIDR0'Address use DIDR0_Addr;
   pragma Volatile (DIDR0);
   DIDR0_Bits               : Bits_In_Byte;
   for DIDR0_Bits'Address use DIDR0_Addr;
   pragma Volatile (DIDR0_Bits);
   --  ADC0 Digital input Disable
   ADC0D_Bit                : constant Bit_Number := 0;
   ADC0D_Mask               : constant Unsigned_8 := 16#01#;
   --  ADC1 Digital input Disable
   ADC1D_Bit                : constant Bit_Number := 1;
   ADC1D_Mask               : constant Unsigned_8 := 16#02#;
   --  ADC2 Digital input Disable
   ADC2D_Bit                : constant Bit_Number := 2;
   ADC2D_Mask               : constant Unsigned_8 := 16#04#;
   --  ADC3 Digital input Disable
   ADC3D_Bit                : constant Bit_Number := 3;
   ADC3D_Mask               : constant Unsigned_8 := 16#08#;
   --  ADC4 Digital input Disable
   ADC4D_Bit                : constant Bit_Number := 4;
   ADC4D_Mask               : constant Unsigned_8 := 16#10#;
   --  ADC5 Digital input Disable
   ADC5D_Bit                : constant Bit_Number := 5;
   ADC5D_Mask               : constant Unsigned_8 := 16#20#;
   --  ADC6 Digital input Disable
   ADC6D_Bit                : constant Bit_Number := 6;
   ADC6D_Mask               : constant Unsigned_8 := 16#40#;
   --  ADC7 Digital input Disable
   ADC7D_Bit                : constant Bit_Number := 7;
   ADC7D_Mask               : constant Unsigned_8 := 16#80#;

   --  The ADC multiplexer Selection Register
   ADMUX_Addr               : constant Address    := 16#7c#;
   ADMUX                    : Unsigned_8 ;
   for ADMUX'Address use ADMUX_Addr;
   pragma Volatile (ADMUX);
   ADMUX_Bits               : Bits_In_Byte;
   for ADMUX_Bits'Address use ADMUX_Addr;
   pragma Volatile (ADMUX_Bits);
   --  Analog Channel and Gain Selection Bits
   MUX0_Bit                 : constant Bit_Number := 0;
   MUX0_Mask                : constant Unsigned_8 := 16#01#;
   --  Analog Channel and Gain Selection Bits
   MUX1_Bit                 : constant Bit_Number := 1;
   MUX1_Mask                : constant Unsigned_8 := 16#02#;
   --  Analog Channel and Gain Selection Bits
   MUX2_Bit                 : constant Bit_Number := 2;
   MUX2_Mask                : constant Unsigned_8 := 16#04#;
   --  Analog Channel and Gain Selection Bits
   MUX3_Bit                 : constant Bit_Number := 3;
   MUX3_Mask                : constant Unsigned_8 := 16#08#;
   --  Left Adjust Result
   ADLAR_Bit                : constant Bit_Number := 5;
   ADLAR_Mask               : constant Unsigned_8 := 16#20#;
   --  Reference Selection Bit 0
   REFS0_Bit                : constant Bit_Number := 6;
   REFS0_Mask               : constant Unsigned_8 := 16#40#;
   --  Reference Selection Bit 1
   REFS1_Bit                : constant Bit_Number := 7;
   REFS1_Mask               : constant Unsigned_8 := 16#80#;

   --  ADC Control and Status Register B
   ADCSRB_Addr              : constant Address    := 16#7b#;
   ADCSRB                   : Unsigned_8 ;
   for ADCSRB'Address use ADCSRB_Addr;
   pragma Volatile (ADCSRB);
   ADCSRB_Bits              : Bits_In_Byte;
   for ADCSRB_Bits'Address use ADCSRB_Addr;
   pragma Volatile (ADCSRB_Bits);
   --  ADC Auto Trigger Source 0
   ADTS0_Bit                : constant Bit_Number := 0;
   ADTS0_Mask               : constant Unsigned_8 := 16#01#;
   --  ADC Auto Trigger Source 1
   ADTS1_Bit                : constant Bit_Number := 1;
   ADTS1_Mask               : constant Unsigned_8 := 16#02#;
   --  ADC Auto Trigger Source 2
   ADTS2_Bit                : constant Bit_Number := 2;
   ADTS2_Mask               : constant Unsigned_8 := 16#04#;
   --  ADC Auto Trigger Source 3
   ADTS3_Bit                : constant Bit_Number := 3;
   ADTS3_Mask               : constant Unsigned_8 := 16#08#;
   --  ADC on Amplified Channel Start Conversion Request Bit
   ADASCR_Bit               : constant Bit_Number := 4;
   ADASCR_Mask              : constant Unsigned_8 := 16#10#;
   --  ADC High Speed Mode
   ADHSM_Bit                : constant Bit_Number := 7;
   ADHSM_Mask               : constant Unsigned_8 := 16#80#;

   --  The ADC Control and Status register
   ADCSRA_Addr              : constant Address    := 16#7a#;
   ADCSRA                   : Unsigned_8 ;
   for ADCSRA'Address use ADCSRA_Addr;
   pragma Volatile (ADCSRA);
   ADCSRA_Bits              : Bits_In_Byte;
   for ADCSRA_Bits'Address use ADCSRA_Addr;
   pragma Volatile (ADCSRA_Bits);
   --  ADC  Prescaler Select Bits
   ADPS0_Bit                : constant Bit_Number := 0;
   ADPS0_Mask               : constant Unsigned_8 := 16#01#;
   --  ADC  Prescaler Select Bits
   ADPS1_Bit                : constant Bit_Number := 1;
   ADPS1_Mask               : constant Unsigned_8 := 16#02#;
   --  ADC  Prescaler Select Bits
   ADPS2_Bit                : constant Bit_Number := 2;
   ADPS2_Mask               : constant Unsigned_8 := 16#04#;
   --  ADC Interrupt Enable
   ADIE_Bit                 : constant Bit_Number := 3;
   ADIE_Mask                : constant Unsigned_8 := 16#08#;
   --  ADC Interrupt Flag
   ADIF_Bit                 : constant Bit_Number := 4;
   ADIF_Mask                : constant Unsigned_8 := 16#10#;
   --  ADC Auto Trigger Enable
   ADATE_Bit                : constant Bit_Number := 5;
   ADATE_Mask               : constant Unsigned_8 := 16#20#;
   --  ADC Start Conversion
   ADSC_Bit                 : constant Bit_Number := 6;
   ADSC_Mask                : constant Unsigned_8 := 16#40#;
   --  ADC Enable
   ADEN_Bit                 : constant Bit_Number := 7;
   ADEN_Mask                : constant Unsigned_8 := 16#80#;

   --  ADC Data Register High Byte
   ADCH_Addr                : constant Address    := 16#79#;
   ADCH                     : Unsigned_8 ;
   for ADCH'Address use ADCH_Addr;
   pragma Volatile (ADCH);
   ADCH_Bits                : Bits_In_Byte;
   for ADCH_Bits'Address use ADCH_Addr;
   pragma Volatile (ADCH_Bits);
   --  ADC Data Register High Byte Bit 0
   ADCH0_Bit                : constant Bit_Number := 0;
   ADCH0_Mask               : constant Unsigned_8 := 16#01#;
   --  ADC Data Register High Byte Bit 1
   ADCH1_Bit                : constant Bit_Number := 1;
   ADCH1_Mask               : constant Unsigned_8 := 16#02#;
   --  ADC Data Register High Byte Bit 2
   ADCH2_Bit                : constant Bit_Number := 2;
   ADCH2_Mask               : constant Unsigned_8 := 16#04#;
   --  ADC Data Register High Byte Bit 3
   ADCH3_Bit                : constant Bit_Number := 3;
   ADCH3_Mask               : constant Unsigned_8 := 16#08#;
   --  ADC Data Register High Byte Bit 4
   ADCH4_Bit                : constant Bit_Number := 4;
   ADCH4_Mask               : constant Unsigned_8 := 16#10#;
   --  ADC Data Register High Byte Bit 5
   ADCH5_Bit                : constant Bit_Number := 5;
   ADCH5_Mask               : constant Unsigned_8 := 16#20#;
   --  ADC Data Register High Byte Bit 6
   ADCH6_Bit                : constant Bit_Number := 6;
   ADCH6_Mask               : constant Unsigned_8 := 16#40#;
   --  ADC Data Register High Byte Bit 7
   ADCH7_Bit                : constant Bit_Number := 7;
   ADCH7_Mask               : constant Unsigned_8 := 16#80#;

   --  ADC Data Register Low Byte
   ADCL_Addr                : constant Address    := 16#78#;
   ADC                      : Unsigned_16;
   for ADC'Address use ADCL_Addr;
   pragma Volatile (ADC);
   ADCL                     : Unsigned_8 ;
   for ADCL'Address use ADCL_Addr;
   pragma Volatile (ADCL);
   ADCL_Bits                : Bits_In_Byte;
   for ADCL_Bits'Address use ADCL_Addr;
   pragma Volatile (ADCL_Bits);
   --  ADC Data Register Low Byte Bit 0
   ADCL0_Bit                : constant Bit_Number := 0;
   ADCL0_Mask               : constant Unsigned_8 := 16#01#;
   --  ADC Data Register Low Byte Bit 1
   ADCL1_Bit                : constant Bit_Number := 1;
   ADCL1_Mask               : constant Unsigned_8 := 16#02#;
   --  ADC Data Register Low Byte Bit 2
   ADCL2_Bit                : constant Bit_Number := 2;
   ADCL2_Mask               : constant Unsigned_8 := 16#04#;
   --  ADC Data Register Low Byte Bit 3
   ADCL3_Bit                : constant Bit_Number := 3;
   ADCL3_Mask               : constant Unsigned_8 := 16#08#;
   --  ADC Data Register Low Byte Bit 4
   ADCL4_Bit                : constant Bit_Number := 4;
   ADCL4_Mask               : constant Unsigned_8 := 16#10#;
   --  ADC Data Register Low Byte Bit 5
   ADCL5_Bit                : constant Bit_Number := 5;
   ADCL5_Mask               : constant Unsigned_8 := 16#20#;
   --  ADC Data Register Low Byte Bit 6
   ADCL6_Bit                : constant Bit_Number := 6;
   ADCL6_Mask               : constant Unsigned_8 := 16#40#;
   --  ADC Data Register Low Byte Bit 7
   ADCL7_Bit                : constant Bit_Number := 7;
   ADCL7_Mask               : constant Unsigned_8 := 16#80#;

   AMP1CSR_Addr             : constant Address    := 16#77#;
   AMP1CSR                  : Unsigned_8 ;
   for AMP1CSR'Address use AMP1CSR_Addr;
   pragma Volatile (AMP1CSR);
   AMP1CSR_Bits             : Bits_In_Byte;
   for AMP1CSR_Bits'Address use AMP1CSR_Addr;
   pragma Volatile (AMP1CSR_Bits);
   AMP1TS0_Bit              : constant Bit_Number := 0;
   AMP1TS0_Mask             : constant Unsigned_8 := 16#01#;
   AMP1TS1_Bit              : constant Bit_Number := 1;
   AMP1TS1_Mask             : constant Unsigned_8 := 16#02#;
   AMP1G0_Bit               : constant Bit_Number := 4;
   AMP1G0_Mask              : constant Unsigned_8 := 16#10#;
   AMP1G1_Bit               : constant Bit_Number := 5;
   AMP1G1_Mask              : constant Unsigned_8 := 16#20#;
   AMP1IS_Bit               : constant Bit_Number := 6;
   AMP1IS_Mask              : constant Unsigned_8 := 16#40#;
   AMP1EN_Bit               : constant Bit_Number := 7;
   AMP1EN_Mask              : constant Unsigned_8 := 16#80#;

   AMP0CSR_Addr             : constant Address    := 16#76#;
   AMP0CSR                  : Unsigned_8 ;
   for AMP0CSR'Address use AMP0CSR_Addr;
   pragma Volatile (AMP0CSR);
   AMP0CSR_Bits             : Bits_In_Byte;
   for AMP0CSR_Bits'Address use AMP0CSR_Addr;
   pragma Volatile (AMP0CSR_Bits);
   AMP0TS0_Bit              : constant Bit_Number := 0;
   AMP0TS0_Mask             : constant Unsigned_8 := 16#01#;
   AMP0TS1_Bit              : constant Bit_Number := 1;
   AMP0TS1_Mask             : constant Unsigned_8 := 16#02#;
   AMP0G0_Bit               : constant Bit_Number := 4;
   AMP0G0_Mask              : constant Unsigned_8 := 16#10#;
   AMP0G1_Bit               : constant Bit_Number := 5;
   AMP0G1_Mask              : constant Unsigned_8 := 16#20#;
   AMP0IS_Bit               : constant Bit_Number := 6;
   AMP0IS_Mask              : constant Unsigned_8 := 16#40#;
   AMP0EN_Bit               : constant Bit_Number := 7;
   AMP0EN_Mask              : constant Unsigned_8 := 16#80#;

   --  Timer/Counter Interrupt Mask Register
   TIMSK1_Addr              : constant Address    := 16#6f#;
   TIMSK1                   : Unsigned_8 ;
   for TIMSK1'Address use TIMSK1_Addr;
   pragma Volatile (TIMSK1);
   TIMSK1_Bits              : Bits_In_Byte;
   for TIMSK1_Bits'Address use TIMSK1_Addr;
   pragma Volatile (TIMSK1_Bits);
   --  Timer/Counter1 Overflow Interrupt Enable
   TOIE1_Bit                : constant Bit_Number := 0;
   TOIE1_Mask               : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Output CompareA Match Interrupt Enable
   OCIE1A_Bit               : constant Bit_Number := 1;
   OCIE1A_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Output CompareB Match Interrupt Enable
   OCIE1B_Bit               : constant Bit_Number := 2;
   OCIE1B_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Input Capture Interrupt Enable
   ICIE1_Bit                : constant Bit_Number := 5;
   ICIE1_Mask               : constant Unsigned_8 := 16#20#;

   --  Timer/Counter0 Interrupt Mask Register
   TIMSK0_Addr              : constant Address    := 16#6e#;
   TIMSK0                   : Unsigned_8 ;
   for TIMSK0'Address use TIMSK0_Addr;
   pragma Volatile (TIMSK0);
   TIMSK0_Bits              : Bits_In_Byte;
   for TIMSK0_Bits'Address use TIMSK0_Addr;
   pragma Volatile (TIMSK0_Bits);
   --  Timer/Counter0 Overflow Interrupt Enable
   TOIE0_Bit                : constant Bit_Number := 0;
   TOIE0_Mask               : constant Unsigned_8 := 16#01#;
   --  Timer/Counter0 Output Compare Match A Interrupt Enable
   OCIE0A_Bit               : constant Bit_Number := 1;
   OCIE0A_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter0 Output Compare Match B Interrupt Enable
   OCIE0B_Bit               : constant Bit_Number := 2;
   OCIE0B_Mask              : constant Unsigned_8 := 16#04#;

   --  External Interrupt Control Register A
   EICRA_Addr               : constant Address    := 16#69#;
   EICRA                    : Unsigned_8 ;
   for EICRA'Address use EICRA_Addr;
   pragma Volatile (EICRA);
   EICRA_Bits               : Bits_In_Byte;
   for EICRA_Bits'Address use EICRA_Addr;
   pragma Volatile (EICRA_Bits);
   --  External Interrupt Sense Control Bit
   ISC00_Bit                : constant Bit_Number := 0;
   ISC00_Mask               : constant Unsigned_8 := 16#01#;
   --  External Interrupt Sense Control Bit
   ISC01_Bit                : constant Bit_Number := 1;
   ISC01_Mask               : constant Unsigned_8 := 16#02#;
   --  External Interrupt Sense Control Bit
   ISC10_Bit                : constant Bit_Number := 2;
   ISC10_Mask               : constant Unsigned_8 := 16#04#;
   --  External Interrupt Sense Control Bit
   ISC11_Bit                : constant Bit_Number := 3;
   ISC11_Mask               : constant Unsigned_8 := 16#08#;
   --  External Interrupt Sense Control Bit
   ISC20_Bit                : constant Bit_Number := 4;
   ISC20_Mask               : constant Unsigned_8 := 16#10#;
   --  External Interrupt Sense Control Bit
   ISC21_Bit                : constant Bit_Number := 5;
   ISC21_Mask               : constant Unsigned_8 := 16#20#;

   --  Oscillator Calibration Value
   OSCCAL_Addr              : constant Address    := 16#66#;
   OSCCAL                   : Unsigned_8 ;
   for OSCCAL'Address use OSCCAL_Addr;
   pragma Volatile (OSCCAL);
   OSCCAL_Bits              : Bits_In_Byte;
   for OSCCAL_Bits'Address use OSCCAL_Addr;
   pragma Volatile (OSCCAL_Bits);
   --  Oscillator Calibration Value Bit0
   CAL0_Bit                 : constant Bit_Number := 0;
   CAL0_Mask                : constant Unsigned_8 := 16#01#;
   --  Oscillator Calibration Value Bit1
   CAL1_Bit                 : constant Bit_Number := 1;
   CAL1_Mask                : constant Unsigned_8 := 16#02#;
   --  Oscillator Calibration Value Bit2
   CAL2_Bit                 : constant Bit_Number := 2;
   CAL2_Mask                : constant Unsigned_8 := 16#04#;
   --  Oscillator Calibration Value Bit3
   CAL3_Bit                 : constant Bit_Number := 3;
   CAL3_Mask                : constant Unsigned_8 := 16#08#;
   --  Oscillator Calibration Value Bit4
   CAL4_Bit                 : constant Bit_Number := 4;
   CAL4_Mask                : constant Unsigned_8 := 16#10#;
   --  Oscillator Calibration Value Bit5
   CAL5_Bit                 : constant Bit_Number := 5;
   CAL5_Mask                : constant Unsigned_8 := 16#20#;
   --  Oscillator Calibration Value Bit6
   CAL6_Bit                 : constant Bit_Number := 6;
   CAL6_Mask                : constant Unsigned_8 := 16#40#;

   --  Power Reduction Register
   PRR_Addr                 : constant Address    := 16#64#;
   PRR                      : Unsigned_8 ;
   for PRR'Address use PRR_Addr;
   pragma Volatile (PRR);
   PRR_Bits                 : Bits_In_Byte;
   for PRR_Bits'Address use PRR_Addr;
   pragma Volatile (PRR_Bits);
   --  Power Reduction ADC
   PRADC_Bit                : constant Bit_Number := 0;
   PRADC_Mask               : constant Unsigned_8 := 16#01#;
   --  Power Reduction USART
   PRUSART0_Bit             : constant Bit_Number := 1;
   PRUSART0_Mask            : constant Unsigned_8 := 16#02#;
   --  Power Reduction Serial Peripheral Interface
   PRSPI_Bit                : constant Bit_Number := 2;
   PRSPI_Mask               : constant Unsigned_8 := 16#04#;
   --  Power Reduction Timer/Counter0
   PRTIM0_Bit               : constant Bit_Number := 3;
   PRTIM0_Mask              : constant Unsigned_8 := 16#08#;
   --  Power Reduction Timer/Counter1
   PRTIM1_Bit               : constant Bit_Number := 4;
   PRTIM1_Mask              : constant Unsigned_8 := 16#10#;
   --  Power Reduction PSC0
   PRPSC0_Bit               : constant Bit_Number := 5;
   PRPSC0_Mask              : constant Unsigned_8 := 16#20#;
   --  Power Reduction PSC1
   PRPSC1_Bit               : constant Bit_Number := 6;
   PRPSC1_Mask              : constant Unsigned_8 := 16#40#;
   --  Power Reduction PSC2
   PRPSC2_Bit               : constant Bit_Number := 7;
   PRPSC2_Mask              : constant Unsigned_8 := 16#80#;

   CLKPR_Addr               : constant Address    := 16#61#;
   CLKPR                    : Unsigned_8 ;
   for CLKPR'Address use CLKPR_Addr;
   pragma Volatile (CLKPR);
   CLKPR_Bits               : Bits_In_Byte;
   for CLKPR_Bits'Address use CLKPR_Addr;
   pragma Volatile (CLKPR_Bits);
   CLKPS0_Bit               : constant Bit_Number := 0;
   CLKPS0_Mask              : constant Unsigned_8 := 16#01#;
   CLKPS1_Bit               : constant Bit_Number := 1;
   CLKPS1_Mask              : constant Unsigned_8 := 16#02#;
   CLKPS2_Bit               : constant Bit_Number := 2;
   CLKPS2_Mask              : constant Unsigned_8 := 16#04#;
   CLKPS3_Bit               : constant Bit_Number := 3;
   CLKPS3_Mask              : constant Unsigned_8 := 16#08#;
   CLKPCE_Bit               : constant Bit_Number := 7;
   CLKPCE_Mask              : constant Unsigned_8 := 16#80#;

   --  Watchdog Timer Control Register
   WDTCSR_Addr              : constant Address    := 16#60#;
   WDTCSR                   : Unsigned_8 ;
   for WDTCSR'Address use WDTCSR_Addr;
   pragma Volatile (WDTCSR);
   WDTCSR_Bits              : Bits_In_Byte;
   for WDTCSR_Bits'Address use WDTCSR_Addr;
   pragma Volatile (WDTCSR_Bits);
   --  Watch Dog Timer Prescaler bit 0
   WDP0_Bit                 : constant Bit_Number := 0;
   WDP0_Mask                : constant Unsigned_8 := 16#01#;
   --  Watch Dog Timer Prescaler bit 1
   WDP1_Bit                 : constant Bit_Number := 1;
   WDP1_Mask                : constant Unsigned_8 := 16#02#;
   --  Watch Dog Timer Prescaler bit 2
   WDP2_Bit                 : constant Bit_Number := 2;
   WDP2_Mask                : constant Unsigned_8 := 16#04#;
   --  Watch Dog Enable
   WDE_Bit                  : constant Bit_Number := 3;
   WDE_Mask                 : constant Unsigned_8 := 16#08#;
   --  Watchdog Change Enable
   WDCE_Bit                 : constant Bit_Number := 4;
   WDCE_Mask                : constant Unsigned_8 := 16#10#;
   --  Watchdog Timer Prescaler Bit 3
   WDP3_Bit                 : constant Bit_Number := 5;
   WDP3_Mask                : constant Unsigned_8 := 16#20#;
   --  Watchdog Timeout Interrupt Enable
   WDIE_Bit                 : constant Bit_Number := 6;
   WDIE_Mask                : constant Unsigned_8 := 16#40#;
   --  Watchdog Timeout Interrupt Flag
   WDIF_Bit                 : constant Bit_Number := 7;
   WDIF_Mask                : constant Unsigned_8 := 16#80#;

   --  Status Register
   SREG_Addr                : constant Address    := 16#5f#;
   SREG                     : Unsigned_8 ;
   for SREG'Address use SREG_Addr;
   pragma Volatile (SREG);
   SREG_Bits                : Bits_In_Byte;
   for SREG_Bits'Address use SREG_Addr;
   pragma Volatile (SREG_Bits);
   --  Carry Flag
   C_Bit                    : constant Bit_Number := 0;
   C_Mask                   : constant Unsigned_8 := 16#01#;
   --  Zero Flag
   Z_Bit                    : constant Bit_Number := 1;
   Z_Mask                   : constant Unsigned_8 := 16#02#;
   --  Negative Flag
   N_Bit                    : constant Bit_Number := 2;
   N_Mask                   : constant Unsigned_8 := 16#04#;
   --  Two's Complement Overflow Flag
   V_Bit                    : constant Bit_Number := 3;
   V_Mask                   : constant Unsigned_8 := 16#08#;
   --  Sign Bit
   S_Bit                    : constant Bit_Number := 4;
   S_Mask                   : constant Unsigned_8 := 16#10#;
   --  Half Carry Flag
   H_Bit                    : constant Bit_Number := 5;
   H_Mask                   : constant Unsigned_8 := 16#20#;
   --  Bit Copy Storage
   T_Bit                    : constant Bit_Number := 6;
   T_Mask                   : constant Unsigned_8 := 16#40#;
   --  Global Interrupt Enable
   I_Bit                    : constant Bit_Number := 7;
   I_Mask                   : constant Unsigned_8 := 16#80#;

   --  Stack Pointer High
   SPH_Addr                 : constant Address    := 16#5e#;
   SPH                      : Unsigned_8 ;
   for SPH'Address use SPH_Addr;
   pragma Volatile (SPH);
   SPH_Bits                 : Bits_In_Byte;
   for SPH_Bits'Address use SPH_Addr;
   pragma Volatile (SPH_Bits);
   --  Stack pointer bit 8
   SP8_Bit                  : constant Bit_Number := 0;
   SP8_Mask                 : constant Unsigned_8 := 16#01#;
   --  Stack pointer bit 9
   SP9_Bit                  : constant Bit_Number := 1;
   SP9_Mask                 : constant Unsigned_8 := 16#02#;
   --  Stack pointer bit 10
   SP10_Bit                 : constant Bit_Number := 2;
   SP10_Mask                : constant Unsigned_8 := 16#04#;
   --  Stack pointer bit 11
   SP11_Bit                 : constant Bit_Number := 3;
   SP11_Mask                : constant Unsigned_8 := 16#08#;
   --  Stack pointer bit 12
   SP12_Bit                 : constant Bit_Number := 4;
   SP12_Mask                : constant Unsigned_8 := 16#10#;
   --  Stack pointer bit 13
   SP13_Bit                 : constant Bit_Number := 5;
   SP13_Mask                : constant Unsigned_8 := 16#20#;
   --  Stack pointer bit 14
   SP14_Bit                 : constant Bit_Number := 6;
   SP14_Mask                : constant Unsigned_8 := 16#40#;
   --  Stack pointer bit 15
   SP15_Bit                 : constant Bit_Number := 7;
   SP15_Mask                : constant Unsigned_8 := 16#80#;

   --  Stack Pointer Low
   SPL_Addr                 : constant Address    := 16#5d#;
   SP                       : Unsigned_16;
   for SP'Address use SPL_Addr;
   pragma Volatile (SP);
   SPL                      : Unsigned_8 ;
   for SPL'Address use SPL_Addr;
   pragma Volatile (SPL);
   SPL_Bits                 : Bits_In_Byte;
   for SPL_Bits'Address use SPL_Addr;
   pragma Volatile (SPL_Bits);
   --  Stack pointer bit 0
   SP0_Bit                  : constant Bit_Number := 0;
   SP0_Mask                 : constant Unsigned_8 := 16#01#;
   --  Stack pointer bit 1
   SP1_Bit                  : constant Bit_Number := 1;
   SP1_Mask                 : constant Unsigned_8 := 16#02#;
   --  Stack pointer bit 2
   SP2_Bit                  : constant Bit_Number := 2;
   SP2_Mask                 : constant Unsigned_8 := 16#04#;
   --  Stack pointer bit 3
   SP3_Bit                  : constant Bit_Number := 3;
   SP3_Mask                 : constant Unsigned_8 := 16#08#;
   --  Stack pointer bit 4
   SP4_Bit                  : constant Bit_Number := 4;
   SP4_Mask                 : constant Unsigned_8 := 16#10#;
   --  Stack pointer bit 5
   SP5_Bit                  : constant Bit_Number := 5;
   SP5_Mask                 : constant Unsigned_8 := 16#20#;
   --  Stack pointer bit 6
   SP6_Bit                  : constant Bit_Number := 6;
   SP6_Mask                 : constant Unsigned_8 := 16#40#;
   --  Stack pointer bit 7
   SP7_Bit                  : constant Bit_Number := 7;
   SP7_Mask                 : constant Unsigned_8 := 16#80#;

   --  Store Program Memory Control Register
   SPMCSR_Addr              : constant Address    := 16#57#;
   SPMCSR                   : Unsigned_8 ;
   for SPMCSR'Address use SPMCSR_Addr;
   pragma Volatile (SPMCSR);
   SPMCSR_Bits              : Bits_In_Byte;
   for SPMCSR_Bits'Address use SPMCSR_Addr;
   pragma Volatile (SPMCSR_Bits);
   --  Store Program Memory Enable
   SPMEN_Bit                : constant Bit_Number := 0;
   SPMEN_Mask               : constant Unsigned_8 := 16#01#;
   --  Page Erase
   PGERS_Bit                : constant Bit_Number := 1;
   PGERS_Mask               : constant Unsigned_8 := 16#02#;
   --  Page Write
   PGWRT_Bit                : constant Bit_Number := 2;
   PGWRT_Mask               : constant Unsigned_8 := 16#04#;
   --  Boot Lock Bit Set
   BLBSET_Bit               : constant Bit_Number := 3;
   BLBSET_Mask              : constant Unsigned_8 := 16#08#;
   --  Read While Write section read enable
   RWWSRE_Bit               : constant Bit_Number := 4;
   RWWSRE_Mask              : constant Unsigned_8 := 16#10#;
   --  Read While Write Section Busy
   RWWSB_Bit                : constant Bit_Number := 6;
   RWWSB_Mask               : constant Unsigned_8 := 16#40#;
   --  SPM Interrupt Enable
   SPMIE_Bit                : constant Bit_Number := 7;
   SPMIE_Mask               : constant Unsigned_8 := 16#80#;

   --  MCU Control Register
   MCUCR_Addr               : constant Address    := 16#55#;
   MCUCR                    : Unsigned_8 ;
   for MCUCR'Address use MCUCR_Addr;
   pragma Volatile (MCUCR);
   MCUCR_Bits               : Bits_In_Byte;
   for MCUCR_Bits'Address use MCUCR_Addr;
   pragma Volatile (MCUCR_Bits);
   --  Interrupt Vector Change Enable
   IVCE_Bit                 : constant Bit_Number := 0;
   IVCE_Mask                : constant Unsigned_8 := 16#01#;
   --  Interrupt Vector Select
   IVSEL_Bit                : constant Bit_Number := 1;
   IVSEL_Mask               : constant Unsigned_8 := 16#02#;
   --  Pull-up disable
   PUD_Bit                  : constant Bit_Number := 4;
   PUD_Mask                 : constant Unsigned_8 := 16#10#;
   --  SPI Pin Select
   SPIPS_Bit                : constant Bit_Number := 7;
   SPIPS_Mask               : constant Unsigned_8 := 16#80#;

   --  MCU Status Register
   MCUSR_Addr               : constant Address    := 16#54#;
   MCUSR                    : Unsigned_8 ;
   for MCUSR'Address use MCUSR_Addr;
   pragma Volatile (MCUSR);
   MCUSR_Bits               : Bits_In_Byte;
   for MCUSR_Bits'Address use MCUSR_Addr;
   pragma Volatile (MCUSR_Bits);
   --  Power-on reset flag
   PORF_Bit                 : constant Bit_Number := 0;
   PORF_Mask                : constant Unsigned_8 := 16#01#;
   --  External Reset Flag
   EXTRF_Bit                : constant Bit_Number := 1;
   EXTRF_Mask               : constant Unsigned_8 := 16#02#;
   --  Brown-out Reset Flag
   BORF_Bit                 : constant Bit_Number := 2;
   BORF_Mask                : constant Unsigned_8 := 16#04#;
   --  Watchdog Reset Flag
   WDRF_Bit                 : constant Bit_Number := 3;
   WDRF_Mask                : constant Unsigned_8 := 16#08#;

   --  Sleep Mode Control Register
   SMCR_Addr                : constant Address    := 16#53#;
   SMCR                     : Unsigned_8 ;
   for SMCR'Address use SMCR_Addr;
   pragma Volatile (SMCR);
   SMCR_Bits                : Bits_In_Byte;
   for SMCR_Bits'Address use SMCR_Addr;
   pragma Volatile (SMCR_Bits);
   --  Sleep Enable
   SE_Bit                   : constant Bit_Number := 0;
   SE_Mask                  : constant Unsigned_8 := 16#01#;
   --  Sleep Mode Select bit 0
   SM0_Bit                  : constant Bit_Number := 1;
   SM0_Mask                 : constant Unsigned_8 := 16#02#;
   --  Sleep Mode Select bit 1
   SM1_Bit                  : constant Bit_Number := 2;
   SM1_Mask                 : constant Unsigned_8 := 16#04#;
   --  Sleep Mode Select bit 2
   SM2_Bit                  : constant Bit_Number := 3;
   SM2_Mask                 : constant Unsigned_8 := 16#08#;

   --  Analog Comparator Status Register
   ACSR_Addr                : constant Address    := 16#50#;
   ACSR                     : Unsigned_8 ;
   for ACSR'Address use ACSR_Addr;
   pragma Volatile (ACSR);
   ACSR_Bits                : Bits_In_Byte;
   for ACSR_Bits'Address use ACSR_Addr;
   pragma Volatile (ACSR_Bits);
   --  Analog Comparator 0 Output Bit
   AC0O_Bit                 : constant Bit_Number := 0;
   AC0O_Mask                : constant Unsigned_8 := 16#01#;
   --  Analog Comparator 1 Output Bit
   AC1O_Bit                 : constant Bit_Number := 1;
   AC1O_Mask                : constant Unsigned_8 := 16#02#;
   --  Analog Comparator 2 Output Bit
   AC2O_Bit                 : constant Bit_Number := 2;
   AC2O_Mask                : constant Unsigned_8 := 16#04#;
   --  Analog Comparator 0 Interrupt Flag Bit
   AC0IF_Bit                : constant Bit_Number := 4;
   AC0IF_Mask               : constant Unsigned_8 := 16#10#;
   --  Analog Comparator 1  Interrupt Flag Bit
   AC1IF_Bit                : constant Bit_Number := 5;
   AC1IF_Mask               : constant Unsigned_8 := 16#20#;
   --  Analog Comparator 2 Interrupt Flag Bit
   AC2IF_Bit                : constant Bit_Number := 6;
   AC2IF_Mask               : constant Unsigned_8 := 16#40#;
   --  Analog Comparator Clock Divider
   ACCKDIV_Bit              : constant Bit_Number := 7;
   ACCKDIV_Mask             : constant Unsigned_8 := 16#80#;

   --  SPI Data Register
   SPDR_Addr                : constant Address    := 16#4e#;
   SPDR                     : Unsigned_8 ;
   for SPDR'Address use SPDR_Addr;
   pragma Volatile (SPDR);
   SPDR_Bits                : Bits_In_Byte;
   for SPDR_Bits'Address use SPDR_Addr;
   pragma Volatile (SPDR_Bits);
   --  SPI Data Register bit 0
   SPDR0_Bit                : constant Bit_Number := 0;
   SPDR0_Mask               : constant Unsigned_8 := 16#01#;
   --  SPI Data Register bit 1
   SPDR1_Bit                : constant Bit_Number := 1;
   SPDR1_Mask               : constant Unsigned_8 := 16#02#;
   --  SPI Data Register bit 2
   SPDR2_Bit                : constant Bit_Number := 2;
   SPDR2_Mask               : constant Unsigned_8 := 16#04#;
   --  SPI Data Register bit 3
   SPDR3_Bit                : constant Bit_Number := 3;
   SPDR3_Mask               : constant Unsigned_8 := 16#08#;
   --  SPI Data Register bit 4
   SPDR4_Bit                : constant Bit_Number := 4;
   SPDR4_Mask               : constant Unsigned_8 := 16#10#;
   --  SPI Data Register bit 5
   SPDR5_Bit                : constant Bit_Number := 5;
   SPDR5_Mask               : constant Unsigned_8 := 16#20#;
   --  SPI Data Register bit 6
   SPDR6_Bit                : constant Bit_Number := 6;
   SPDR6_Mask               : constant Unsigned_8 := 16#40#;
   --  SPI Data Register bit 7
   SPDR7_Bit                : constant Bit_Number := 7;
   SPDR7_Mask               : constant Unsigned_8 := 16#80#;

   --  SPI Status Register
   SPSR_Addr                : constant Address    := 16#4d#;
   SPSR                     : Unsigned_8 ;
   for SPSR'Address use SPSR_Addr;
   pragma Volatile (SPSR);
   SPSR_Bits                : Bits_In_Byte;
   for SPSR_Bits'Address use SPSR_Addr;
   pragma Volatile (SPSR_Bits);
   --  Double SPI Speed Bit
   SPI2X_Bit                : constant Bit_Number := 0;
   SPI2X_Mask               : constant Unsigned_8 := 16#01#;
   --  Write Collision Flag
   WCOL_Bit                 : constant Bit_Number := 6;
   WCOL_Mask                : constant Unsigned_8 := 16#40#;
   --  SPI Interrupt Flag
   SPIF_Bit                 : constant Bit_Number := 7;
   SPIF_Mask                : constant Unsigned_8 := 16#80#;

   --  SPI Control Register
   SPCR_Addr                : constant Address    := 16#4c#;
   SPCR                     : Unsigned_8 ;
   for SPCR'Address use SPCR_Addr;
   pragma Volatile (SPCR);
   SPCR_Bits                : Bits_In_Byte;
   for SPCR_Bits'Address use SPCR_Addr;
   pragma Volatile (SPCR_Bits);
   --  SPI Clock Rate Select 0
   SPR0_Bit                 : constant Bit_Number := 0;
   SPR0_Mask                : constant Unsigned_8 := 16#01#;
   --  SPI Clock Rate Select 1
   SPR1_Bit                 : constant Bit_Number := 1;
   SPR1_Mask                : constant Unsigned_8 := 16#02#;
   --  Clock Phase
   CPHA_Bit                 : constant Bit_Number := 2;
   CPHA_Mask                : constant Unsigned_8 := 16#04#;
   --  Clock polarity
   CPOL_Bit                 : constant Bit_Number := 3;
   CPOL_Mask                : constant Unsigned_8 := 16#08#;
   --  Master/Slave Select
   MSTR_Bit                 : constant Bit_Number := 4;
   MSTR_Mask                : constant Unsigned_8 := 16#10#;
   --  Data Order
   DORD_Bit                 : constant Bit_Number := 5;
   DORD_Mask                : constant Unsigned_8 := 16#20#;
   --  SPI Enable
   SPE_Bit                  : constant Bit_Number := 6;
   SPE_Mask                 : constant Unsigned_8 := 16#40#;
   --  SPI Interrupt Enable
   SPIE_Bit                 : constant Bit_Number := 7;
   SPIE_Mask                : constant Unsigned_8 := 16#80#;

   --  PLL Control And Status Register
   PLLCSR_Addr              : constant Address    := 16#49#;
   PLLCSR                   : Unsigned_8 ;
   for PLLCSR'Address use PLLCSR_Addr;
   pragma Volatile (PLLCSR);
   PLLCSR_Bits              : Bits_In_Byte;
   for PLLCSR_Bits'Address use PLLCSR_Addr;
   pragma Volatile (PLLCSR_Bits);
   --  PLL Lock Detector
   PLOCK_Bit                : constant Bit_Number := 0;
   PLOCK_Mask               : constant Unsigned_8 := 16#01#;
   --  PLL Enable
   PLLE_Bit                 : constant Bit_Number := 1;
   PLLE_Mask                : constant Unsigned_8 := 16#02#;
   --  PLL Factor
   PLLF_Bit                 : constant Bit_Number := 2;
   PLLF_Mask                : constant Unsigned_8 := 16#04#;

   --  Timer/Counter0 Output Compare Register
   OCR0B_Addr               : constant Address    := 16#48#;
   OCR0B                    : Unsigned_8 ;
   for OCR0B'Address use OCR0B_Addr;
   pragma Volatile (OCR0B);
   OCR0B_Bits               : Bits_In_Byte;
   for OCR0B_Bits'Address use OCR0B_Addr;
   pragma Volatile (OCR0B_Bits);
   OCR0_0_Bit               : constant Bit_Number := 0;
   OCR0_0_Mask              : constant Unsigned_8 := 16#01#;
   OCR0_1_Bit               : constant Bit_Number := 1;
   OCR0_1_Mask              : constant Unsigned_8 := 16#02#;
   OCR0_2_Bit               : constant Bit_Number := 2;
   OCR0_2_Mask              : constant Unsigned_8 := 16#04#;
   OCR0_3_Bit               : constant Bit_Number := 3;
   OCR0_3_Mask              : constant Unsigned_8 := 16#08#;
   OCR0_4_Bit               : constant Bit_Number := 4;
   OCR0_4_Mask              : constant Unsigned_8 := 16#10#;
   OCR0_5_Bit               : constant Bit_Number := 5;
   OCR0_5_Mask              : constant Unsigned_8 := 16#20#;
   OCR0_6_Bit               : constant Bit_Number := 6;
   OCR0_6_Mask              : constant Unsigned_8 := 16#40#;
   OCR0_7_Bit               : constant Bit_Number := 7;
   OCR0_7_Mask              : constant Unsigned_8 := 16#80#;

   --  Timer/Counter0 Output Compare Register
   OCR0A_Addr               : constant Address    := 16#47#;
   OCR0A                    : Unsigned_8 ;
   for OCR0A'Address use OCR0A_Addr;
   pragma Volatile (OCR0A);
   OCR0A_Bits               : Bits_In_Byte;
   for OCR0A_Bits'Address use OCR0A_Addr;
   pragma Volatile (OCR0A_Bits);

   --  Timer/Counter0
   TCNT0_Addr               : constant Address    := 16#46#;
   TCNT0                    : Unsigned_8 ;
   for TCNT0'Address use TCNT0_Addr;
   pragma Volatile (TCNT0);
   TCNT0_Bits               : Bits_In_Byte;
   for TCNT0_Bits'Address use TCNT0_Addr;
   pragma Volatile (TCNT0_Bits);
   TCNT0_0_Bit              : constant Bit_Number := 0;
   TCNT0_0_Mask             : constant Unsigned_8 := 16#01#;
   TCNT0_1_Bit              : constant Bit_Number := 1;
   TCNT0_1_Mask             : constant Unsigned_8 := 16#02#;
   TCNT0_2_Bit              : constant Bit_Number := 2;
   TCNT0_2_Mask             : constant Unsigned_8 := 16#04#;
   TCNT0_3_Bit              : constant Bit_Number := 3;
   TCNT0_3_Mask             : constant Unsigned_8 := 16#08#;
   TCNT0_4_Bit              : constant Bit_Number := 4;
   TCNT0_4_Mask             : constant Unsigned_8 := 16#10#;
   TCNT0_5_Bit              : constant Bit_Number := 5;
   TCNT0_5_Mask             : constant Unsigned_8 := 16#20#;
   TCNT0_6_Bit              : constant Bit_Number := 6;
   TCNT0_6_Mask             : constant Unsigned_8 := 16#40#;
   TCNT0_7_Bit              : constant Bit_Number := 7;
   TCNT0_7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter Control Register B
   TCCR0B_Addr              : constant Address    := 16#45#;
   TCCR0B                   : Unsigned_8 ;
   for TCCR0B'Address use TCCR0B_Addr;
   pragma Volatile (TCCR0B);
   TCCR0B_Bits              : Bits_In_Byte;
   for TCCR0B_Bits'Address use TCCR0B_Addr;
   pragma Volatile (TCCR0B_Bits);
   --  Clock Select
   CS00_Bit                 : constant Bit_Number := 0;
   CS00_Mask                : constant Unsigned_8 := 16#01#;
   --  Clock Select
   CS01_Bit                 : constant Bit_Number := 1;
   CS01_Mask                : constant Unsigned_8 := 16#02#;
   --  Clock Select
   CS02_Bit                 : constant Bit_Number := 2;
   CS02_Mask                : constant Unsigned_8 := 16#04#;
   WGM02_Bit                : constant Bit_Number := 3;
   WGM02_Mask               : constant Unsigned_8 := 16#08#;
   --  Force Output Compare B
   FOC0B_Bit                : constant Bit_Number := 6;
   FOC0B_Mask               : constant Unsigned_8 := 16#40#;
   --  Force Output Compare A
   FOC0A_Bit                : constant Bit_Number := 7;
   FOC0A_Mask               : constant Unsigned_8 := 16#80#;

   --  Timer/Counter  Control Register A
   TCCR0A_Addr              : constant Address    := 16#44#;
   TCCR0A                   : Unsigned_8 ;
   for TCCR0A'Address use TCCR0A_Addr;
   pragma Volatile (TCCR0A);
   TCCR0A_Bits              : Bits_In_Byte;
   for TCCR0A_Bits'Address use TCCR0A_Addr;
   pragma Volatile (TCCR0A_Bits);
   --  Waveform Generation Mode
   WGM00_Bit                : constant Bit_Number := 0;
   WGM00_Mask               : constant Unsigned_8 := 16#01#;
   --  Waveform Generation Mode
   WGM01_Bit                : constant Bit_Number := 1;
   WGM01_Mask               : constant Unsigned_8 := 16#02#;
   --  Compare Output Mode, Fast PWm
   COM0B0_Bit               : constant Bit_Number := 4;
   COM0B0_Mask              : constant Unsigned_8 := 16#10#;
   --  Compare Output Mode, Fast PWm
   COM0B1_Bit               : constant Bit_Number := 5;
   COM0B1_Mask              : constant Unsigned_8 := 16#20#;
   --  Compare Output Mode, Phase Correct PWM Mode
   COM0A0_Bit               : constant Bit_Number := 6;
   COM0A0_Mask              : constant Unsigned_8 := 16#40#;
   --  Compare Output Mode, Phase Correct PWM Mode
   COM0A1_Bit               : constant Bit_Number := 7;
   COM0A1_Mask              : constant Unsigned_8 := 16#80#;

   --  General Timer/Counter Control Register
   GTCCR_Addr               : constant Address    := 16#43#;
   GTCCR                    : Unsigned_8 ;
   for GTCCR'Address use GTCCR_Addr;
   pragma Volatile (GTCCR);
   GTCCR_Bits               : Bits_In_Byte;
   for GTCCR_Bits'Address use GTCCR_Addr;
   pragma Volatile (GTCCR_Bits);
   --  Prescaler Reset Timer/Counter1 and Timer/Counter0
   PSR10_Bit                : constant Bit_Number := 0;
   PSR10_Mask               : constant Unsigned_8 := 16#01#;
   --  Timer1 Input Capture Selection Bit
   ICPSEL1_Bit              : constant Bit_Number := 6;
   ICPSEL1_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter Synchronization Mode
   TSM_Bit                  : constant Bit_Number := 7;
   TSM_Mask                 : constant Unsigned_8 := 16#80#;

   --  EEPROM Read/Write Access High Byte
   EEARH_Addr               : constant Address    := 16#42#;
   EEARH                    : Unsigned_8 ;
   for EEARH'Address use EEARH_Addr;
   pragma Volatile (EEARH);
   EEARH_Bits               : Bits_In_Byte;
   for EEARH_Bits'Address use EEARH_Addr;
   pragma Volatile (EEARH_Bits);
   --  EEPROM Read/Write Access Bit 8
   EEAR8_Bit                : constant Bit_Number := 0;
   EEAR8_Mask               : constant Unsigned_8 := 16#01#;
   --  EEPROM Read/Write Access Bit 9
   EEAR9_Bit                : constant Bit_Number := 1;
   EEAR9_Mask               : constant Unsigned_8 := 16#02#;
   --  EEPROM Read/Write Access Bit 10
   EEAR10_Bit               : constant Bit_Number := 2;
   EEAR10_Mask              : constant Unsigned_8 := 16#04#;
   --  EEPROM Read/Write Access Bit 11
   EEAR11_Bit               : constant Bit_Number := 3;
   EEAR11_Mask              : constant Unsigned_8 := 16#08#;

   --  EEPROM Read/Write Access Low Byte
   EEARL_Addr               : constant Address    := 16#41#;
   EEAR                     : Unsigned_16;
   for EEAR'Address use EEARL_Addr;
   pragma Volatile (EEAR);
   EEARL                    : Unsigned_8 ;
   for EEARL'Address use EEARL_Addr;
   pragma Volatile (EEARL);
   EEARL_Bits               : Bits_In_Byte;
   for EEARL_Bits'Address use EEARL_Addr;
   pragma Volatile (EEARL_Bits);
   --  EEPROM Read/Write Access Bit 0
   EEARL0_Bit               : constant Bit_Number := 0;
   EEARL0_Mask              : constant Unsigned_8 := 16#01#;
   --  EEPROM Read/Write Access Bit 1
   EEARL1_Bit               : constant Bit_Number := 1;
   EEARL1_Mask              : constant Unsigned_8 := 16#02#;
   --  EEPROM Read/Write Access Bit 2
   EEARL2_Bit               : constant Bit_Number := 2;
   EEARL2_Mask              : constant Unsigned_8 := 16#04#;
   --  EEPROM Read/Write Access Bit 3
   EEARL3_Bit               : constant Bit_Number := 3;
   EEARL3_Mask              : constant Unsigned_8 := 16#08#;
   --  EEPROM Read/Write Access Bit 4
   EEARL4_Bit               : constant Bit_Number := 4;
   EEARL4_Mask              : constant Unsigned_8 := 16#10#;
   --  EEPROM Read/Write Access Bit 5
   EEARL5_Bit               : constant Bit_Number := 5;
   EEARL5_Mask              : constant Unsigned_8 := 16#20#;
   --  EEPROM Read/Write Access Bit 6
   EEARL6_Bit               : constant Bit_Number := 6;
   EEARL6_Mask              : constant Unsigned_8 := 16#40#;
   --  EEPROM Read/Write Access Bit 7
   EEARL7_Bit               : constant Bit_Number := 7;
   EEARL7_Mask              : constant Unsigned_8 := 16#80#;

   --  EEPROM Data Register
   EEDR_Addr                : constant Address    := 16#40#;
   EEDR                     : Unsigned_8 ;
   for EEDR'Address use EEDR_Addr;
   pragma Volatile (EEDR);
   EEDR_Bits                : Bits_In_Byte;
   for EEDR_Bits'Address use EEDR_Addr;
   pragma Volatile (EEDR_Bits);
   --  EEPROM Data Register bit 0
   EEDR0_Bit                : constant Bit_Number := 0;
   EEDR0_Mask               : constant Unsigned_8 := 16#01#;
   --  EEPROM Data Register bit 1
   EEDR1_Bit                : constant Bit_Number := 1;
   EEDR1_Mask               : constant Unsigned_8 := 16#02#;
   --  EEPROM Data Register bit 2
   EEDR2_Bit                : constant Bit_Number := 2;
   EEDR2_Mask               : constant Unsigned_8 := 16#04#;
   --  EEPROM Data Register bit 3
   EEDR3_Bit                : constant Bit_Number := 3;
   EEDR3_Mask               : constant Unsigned_8 := 16#08#;
   --  EEPROM Data Register bit 4
   EEDR4_Bit                : constant Bit_Number := 4;
   EEDR4_Mask               : constant Unsigned_8 := 16#10#;
   --  EEPROM Data Register bit 5
   EEDR5_Bit                : constant Bit_Number := 5;
   EEDR5_Mask               : constant Unsigned_8 := 16#20#;
   --  EEPROM Data Register bit 6
   EEDR6_Bit                : constant Bit_Number := 6;
   EEDR6_Mask               : constant Unsigned_8 := 16#40#;
   --  EEPROM Data Register bit 7
   EEDR7_Bit                : constant Bit_Number := 7;
   EEDR7_Mask               : constant Unsigned_8 := 16#80#;

   --  EEPROM Control Register
   EECR_Addr                : constant Address    := 16#3f#;
   EECR                     : Unsigned_8 ;
   for EECR'Address use EECR_Addr;
   pragma Volatile (EECR);
   EECR_Bits                : Bits_In_Byte;
   for EECR_Bits'Address use EECR_Addr;
   pragma Volatile (EECR_Bits);
   --  EEPROM Read Enable
   EERE_Bit                 : constant Bit_Number := 0;
   EERE_Mask                : constant Unsigned_8 := 16#01#;
   --  EEPROM Write Enable
   EEWE_Bit                 : constant Bit_Number := 1;
   EEWE_Mask                : constant Unsigned_8 := 16#02#;
   --  EEPROM Master Write Enable
   EEMWE_Bit                : constant Bit_Number := 2;
   EEMWE_Mask               : constant Unsigned_8 := 16#04#;
   --  EEPROM Ready Interrupt Enable
   EERIE_Bit                : constant Bit_Number := 3;
   EERIE_Mask               : constant Unsigned_8 := 16#08#;

   --  General Purpose IO Register 0
   GPIOR0_Addr              : constant Address    := 16#3e#;
   GPIOR0                   : Unsigned_8 ;
   for GPIOR0'Address use GPIOR0_Addr;
   pragma Volatile (GPIOR0);
   GPIOR0_Bits              : Bits_In_Byte;
   for GPIOR0_Bits'Address use GPIOR0_Addr;
   pragma Volatile (GPIOR0_Bits);
   --  General Purpose IO Register 0 bit 0
   GPIOR00_Bit              : constant Bit_Number := 0;
   GPIOR00_Mask             : constant Unsigned_8 := 16#01#;
   --  General Purpose IO Register 0 bit 1
   GPIOR01_Bit              : constant Bit_Number := 1;
   GPIOR01_Mask             : constant Unsigned_8 := 16#02#;
   --  General Purpose IO Register 0 bit 2
   GPIOR02_Bit              : constant Bit_Number := 2;
   GPIOR02_Mask             : constant Unsigned_8 := 16#04#;
   --  General Purpose IO Register 0 bit 3
   GPIOR03_Bit              : constant Bit_Number := 3;
   GPIOR03_Mask             : constant Unsigned_8 := 16#08#;
   --  General Purpose IO Register 0 bit 4
   GPIOR04_Bit              : constant Bit_Number := 4;
   GPIOR04_Mask             : constant Unsigned_8 := 16#10#;
   --  General Purpose IO Register 0 bit 5
   GPIOR05_Bit              : constant Bit_Number := 5;
   GPIOR05_Mask             : constant Unsigned_8 := 16#20#;
   --  General Purpose IO Register 0 bit 6
   GPIOR06_Bit              : constant Bit_Number := 6;
   GPIOR06_Mask             : constant Unsigned_8 := 16#40#;
   --  General Purpose IO Register 0 bit 7
   GPIOR07_Bit              : constant Bit_Number := 7;
   GPIOR07_Mask             : constant Unsigned_8 := 16#80#;

   --  External Interrupt Mask Register
   EIMSK_Addr               : constant Address    := 16#3d#;
   EIMSK                    : Unsigned_8 ;
   for EIMSK'Address use EIMSK_Addr;
   pragma Volatile (EIMSK);
   EIMSK_Bits               : Bits_In_Byte;
   for EIMSK_Bits'Address use EIMSK_Addr;
   pragma Volatile (EIMSK_Bits);
   --  External Interrupt Request 0 Enable
   INT0_Bit                 : constant Bit_Number := 0;
   INT0_Mask                : constant Unsigned_8 := 16#01#;
   --  External Interrupt Request 1 Enable
   INT1_Bit                 : constant Bit_Number := 1;
   INT1_Mask                : constant Unsigned_8 := 16#02#;
   --  External Interrupt Request 2 Enable
   INT2_Bit                 : constant Bit_Number := 2;
   INT2_Mask                : constant Unsigned_8 := 16#04#;

   --  External Interrupt Flag Register
   EIFR_Addr                : constant Address    := 16#3c#;
   EIFR                     : Unsigned_8 ;
   for EIFR'Address use EIFR_Addr;
   pragma Volatile (EIFR);
   EIFR_Bits                : Bits_In_Byte;
   for EIFR_Bits'Address use EIFR_Addr;
   pragma Volatile (EIFR_Bits);
   --  External Interrupt Flag 0
   INTF0_Bit                : constant Bit_Number := 0;
   INTF0_Mask               : constant Unsigned_8 := 16#01#;
   --  External Interrupt Flag 1
   INTF1_Bit                : constant Bit_Number := 1;
   INTF1_Mask               : constant Unsigned_8 := 16#02#;
   --  External Interrupt Flag 2
   INTF2_Bit                : constant Bit_Number := 2;
   INTF2_Mask               : constant Unsigned_8 := 16#04#;

   --  General Purpose IO Register 3
   GPIOR3_Addr              : constant Address    := 16#3b#;
   GPIOR3                   : Unsigned_8 ;
   for GPIOR3'Address use GPIOR3_Addr;
   pragma Volatile (GPIOR3);
   GPIOR3_Bits              : Bits_In_Byte;
   for GPIOR3_Bits'Address use GPIOR3_Addr;
   pragma Volatile (GPIOR3_Bits);
   --  General Purpose IO Register 3 bit 0
   GPIOR30_Bit              : constant Bit_Number := 0;
   GPIOR30_Mask             : constant Unsigned_8 := 16#01#;
   --  General Purpose IO Register 3 bit 1
   GPIOR31_Bit              : constant Bit_Number := 1;
   GPIOR31_Mask             : constant Unsigned_8 := 16#02#;
   --  General Purpose IO Register 3 bit 2
   GPIOR32_Bit              : constant Bit_Number := 2;
   GPIOR32_Mask             : constant Unsigned_8 := 16#04#;
   --  General Purpose IO Register 3 bit 3
   GPIOR33_Bit              : constant Bit_Number := 3;
   GPIOR33_Mask             : constant Unsigned_8 := 16#08#;
   --  General Purpose IO Register 3 bit 4
   GPIOR34_Bit              : constant Bit_Number := 4;
   GPIOR34_Mask             : constant Unsigned_8 := 16#10#;
   --  General Purpose IO Register 3 bit 5
   GPIOR35_Bit              : constant Bit_Number := 5;
   GPIOR35_Mask             : constant Unsigned_8 := 16#20#;
   --  General Purpose IO Register 3 bit 6
   GPIOR36_Bit              : constant Bit_Number := 6;
   GPIOR36_Mask             : constant Unsigned_8 := 16#40#;
   --  General Purpose IO Register 3 bit 7
   GPIOR37_Bit              : constant Bit_Number := 7;
   GPIOR37_Mask             : constant Unsigned_8 := 16#80#;

   --  General Purpose IO Register 2
   GPIOR2_Addr              : constant Address    := 16#3a#;
   GPIOR2                   : Unsigned_8 ;
   for GPIOR2'Address use GPIOR2_Addr;
   pragma Volatile (GPIOR2);
   GPIOR2_Bits              : Bits_In_Byte;
   for GPIOR2_Bits'Address use GPIOR2_Addr;
   pragma Volatile (GPIOR2_Bits);
   --  General Purpose IO Register 2 bit 0
   GPIOR20_Bit              : constant Bit_Number := 0;
   GPIOR20_Mask             : constant Unsigned_8 := 16#01#;
   --  General Purpose IO Register 2 bit 1
   GPIOR21_Bit              : constant Bit_Number := 1;
   GPIOR21_Mask             : constant Unsigned_8 := 16#02#;
   --  General Purpose IO Register 2 bit 2
   GPIOR22_Bit              : constant Bit_Number := 2;
   GPIOR22_Mask             : constant Unsigned_8 := 16#04#;
   --  General Purpose IO Register 2 bit 3
   GPIOR23_Bit              : constant Bit_Number := 3;
   GPIOR23_Mask             : constant Unsigned_8 := 16#08#;
   --  General Purpose IO Register 2 bit 4
   GPIOR24_Bit              : constant Bit_Number := 4;
   GPIOR24_Mask             : constant Unsigned_8 := 16#10#;
   --  General Purpose IO Register 2 bit 5
   GPIOR25_Bit              : constant Bit_Number := 5;
   GPIOR25_Mask             : constant Unsigned_8 := 16#20#;
   --  General Purpose IO Register 2 bit 6
   GPIOR26_Bit              : constant Bit_Number := 6;
   GPIOR26_Mask             : constant Unsigned_8 := 16#40#;
   --  General Purpose IO Register 2 bit 7
   GPIOR27_Bit              : constant Bit_Number := 7;
   GPIOR27_Mask             : constant Unsigned_8 := 16#80#;

   --  General Purpose IO Register 1
   GPIOR1_Addr              : constant Address    := 16#39#;
   GPIOR1                   : Unsigned_8 ;
   for GPIOR1'Address use GPIOR1_Addr;
   pragma Volatile (GPIOR1);
   GPIOR1_Bits              : Bits_In_Byte;
   for GPIOR1_Bits'Address use GPIOR1_Addr;
   pragma Volatile (GPIOR1_Bits);
   --  General Purpose IO Register 1 bit 0
   GPIOR10_Bit              : constant Bit_Number := 0;
   GPIOR10_Mask             : constant Unsigned_8 := 16#01#;
   --  General Purpose IO Register 1 bit 1
   GPIOR11_Bit              : constant Bit_Number := 1;
   GPIOR11_Mask             : constant Unsigned_8 := 16#02#;
   --  General Purpose IO Register 1 bit 2
   GPIOR12_Bit              : constant Bit_Number := 2;
   GPIOR12_Mask             : constant Unsigned_8 := 16#04#;
   --  General Purpose IO Register 1 bit 3
   GPIOR13_Bit              : constant Bit_Number := 3;
   GPIOR13_Mask             : constant Unsigned_8 := 16#08#;
   --  General Purpose IO Register 1 bit 4
   GPIOR14_Bit              : constant Bit_Number := 4;
   GPIOR14_Mask             : constant Unsigned_8 := 16#10#;
   --  General Purpose IO Register 1 bit 5
   GPIOR15_Bit              : constant Bit_Number := 5;
   GPIOR15_Mask             : constant Unsigned_8 := 16#20#;
   --  General Purpose IO Register 1 bit 6
   GPIOR16_Bit              : constant Bit_Number := 6;
   GPIOR16_Mask             : constant Unsigned_8 := 16#40#;
   --  General Purpose IO Register 1 bit 7
   GPIOR17_Bit              : constant Bit_Number := 7;
   GPIOR17_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter Interrupt Flag register
   TIFR1_Addr               : constant Address    := 16#36#;
   TIFR1                    : Unsigned_8 ;
   for TIFR1'Address use TIFR1_Addr;
   pragma Volatile (TIFR1);
   TIFR1_Bits               : Bits_In_Byte;
   for TIFR1_Bits'Address use TIFR1_Addr;
   pragma Volatile (TIFR1_Bits);
   --  Timer/Counter1 Overflow Flag
   TOV1_Bit                 : constant Bit_Number := 0;
   TOV1_Mask                : constant Unsigned_8 := 16#01#;
   --  Output Compare Flag 1A
   OCF1A_Bit                : constant Bit_Number := 1;
   OCF1A_Mask               : constant Unsigned_8 := 16#02#;
   --  Output Compare Flag 1B
   OCF1B_Bit                : constant Bit_Number := 2;
   OCF1B_Mask               : constant Unsigned_8 := 16#04#;
   --  Input Capture Flag 1
   ICF1_Bit                 : constant Bit_Number := 5;
   ICF1_Mask                : constant Unsigned_8 := 16#20#;

   --  Timer/Counter0 Interrupt Flag register
   TIFR0_Addr               : constant Address    := 16#35#;
   TIFR0                    : Unsigned_8 ;
   for TIFR0'Address use TIFR0_Addr;
   pragma Volatile (TIFR0);
   TIFR0_Bits               : Bits_In_Byte;
   for TIFR0_Bits'Address use TIFR0_Addr;
   pragma Volatile (TIFR0_Bits);
   --  Timer/Counter0 Overflow Flag
   TOV0_Bit                 : constant Bit_Number := 0;
   TOV0_Mask                : constant Unsigned_8 := 16#01#;
   --  Timer/Counter0 Output Compare Flag 0A
   OCF0A_Bit                : constant Bit_Number := 1;
   OCF0A_Mask               : constant Unsigned_8 := 16#02#;
   --  Timer/Counter0 Output Compare Flag 0B
   OCF0B_Bit                : constant Bit_Number := 2;
   OCF0B_Mask               : constant Unsigned_8 := 16#04#;

   --  Port E Data Register
   PORTE_Addr               : constant Address    := 16#2e#;
   PORTE                    : Unsigned_8 ;
   for PORTE'Address use PORTE_Addr;
   pragma Volatile (PORTE);
   PORTE_Bits               : Bits_In_Byte;
   for PORTE_Bits'Address use PORTE_Addr;
   pragma Volatile (PORTE_Bits);
   PORTE0_Bit               : constant Bit_Number := 0;
   PORTE0_Mask              : constant Unsigned_8 := 16#01#;
   PORTE1_Bit               : constant Bit_Number := 1;
   PORTE1_Mask              : constant Unsigned_8 := 16#02#;
   PORTE2_Bit               : constant Bit_Number := 2;
   PORTE2_Mask              : constant Unsigned_8 := 16#04#;

   --  Port E Data Direction Register
   DDRE_Addr                : constant Address    := 16#2d#;
   DDRE                     : Unsigned_8 ;
   for DDRE'Address use DDRE_Addr;
   pragma Volatile (DDRE);
   DDRE_Bits                : Bits_In_Byte;
   for DDRE_Bits'Address use DDRE_Addr;
   pragma Volatile (DDRE_Bits);
   DDE0_Bit                 : constant Bit_Number := 0;
   DDE0_Mask                : constant Unsigned_8 := 16#01#;
   DDE1_Bit                 : constant Bit_Number := 1;
   DDE1_Mask                : constant Unsigned_8 := 16#02#;
   DDE2_Bit                 : constant Bit_Number := 2;
   DDE2_Mask                : constant Unsigned_8 := 16#04#;

   --  Port E Input Pins
   PINE_Addr                : constant Address    := 16#2c#;
   PINE                     : Unsigned_8 ;
   for PINE'Address use PINE_Addr;
   pragma Volatile (PINE);
   PINE_Bits                : Bits_In_Byte;
   for PINE_Bits'Address use PINE_Addr;
   pragma Volatile (PINE_Bits);
   PINE0_Bit                : constant Bit_Number := 0;
   PINE0_Mask               : constant Unsigned_8 := 16#01#;
   PINE1_Bit                : constant Bit_Number := 1;
   PINE1_Mask               : constant Unsigned_8 := 16#02#;
   PINE2_Bit                : constant Bit_Number := 2;
   PINE2_Mask               : constant Unsigned_8 := 16#04#;

   --  Port D Data Register
   PORTD_Addr               : constant Address    := 16#2b#;
   PORTD                    : Unsigned_8 ;
   for PORTD'Address use PORTD_Addr;
   pragma Volatile (PORTD);
   PORTD_Bits               : Bits_In_Byte;
   for PORTD_Bits'Address use PORTD_Addr;
   pragma Volatile (PORTD_Bits);
   --  Port D Data Register bit 0
   PORTD0_Bit               : constant Bit_Number := 0;
   PORTD0_Mask              : constant Unsigned_8 := 16#01#;
   --  Port D Data Register bit 1
   PORTD1_Bit               : constant Bit_Number := 1;
   PORTD1_Mask              : constant Unsigned_8 := 16#02#;
   --  Port D Data Register bit 2
   PORTD2_Bit               : constant Bit_Number := 2;
   PORTD2_Mask              : constant Unsigned_8 := 16#04#;
   --  Port D Data Register bit 3
   PORTD3_Bit               : constant Bit_Number := 3;
   PORTD3_Mask              : constant Unsigned_8 := 16#08#;
   --  Port D Data Register bit 4
   PORTD4_Bit               : constant Bit_Number := 4;
   PORTD4_Mask              : constant Unsigned_8 := 16#10#;
   --  Port D Data Register bit 5
   PORTD5_Bit               : constant Bit_Number := 5;
   PORTD5_Mask              : constant Unsigned_8 := 16#20#;
   --  Port D Data Register bit 6
   PORTD6_Bit               : constant Bit_Number := 6;
   PORTD6_Mask              : constant Unsigned_8 := 16#40#;
   --  Port D Data Register bit 7
   PORTD7_Bit               : constant Bit_Number := 7;
   PORTD7_Mask              : constant Unsigned_8 := 16#80#;

   --  Port D Data Direction Register
   DDRD_Addr                : constant Address    := 16#2a#;
   DDRD                     : Unsigned_8 ;
   for DDRD'Address use DDRD_Addr;
   pragma Volatile (DDRD);
   DDRD_Bits                : Bits_In_Byte;
   for DDRD_Bits'Address use DDRD_Addr;
   pragma Volatile (DDRD_Bits);
   --  Port D Data Direction Register bit 0
   DDD0_Bit                 : constant Bit_Number := 0;
   DDD0_Mask                : constant Unsigned_8 := 16#01#;
   --  Port D Data Direction Register bit 1
   DDD1_Bit                 : constant Bit_Number := 1;
   DDD1_Mask                : constant Unsigned_8 := 16#02#;
   --  Port D Data Direction Register bit 2
   DDD2_Bit                 : constant Bit_Number := 2;
   DDD2_Mask                : constant Unsigned_8 := 16#04#;
   --  Port D Data Direction Register bit 3
   DDD3_Bit                 : constant Bit_Number := 3;
   DDD3_Mask                : constant Unsigned_8 := 16#08#;
   --  Port D Data Direction Register bit 4
   DDD4_Bit                 : constant Bit_Number := 4;
   DDD4_Mask                : constant Unsigned_8 := 16#10#;
   --  Port D Data Direction Register bit 5
   DDD5_Bit                 : constant Bit_Number := 5;
   DDD5_Mask                : constant Unsigned_8 := 16#20#;
   --  Port D Data Direction Register bit 6
   DDD6_Bit                 : constant Bit_Number := 6;
   DDD6_Mask                : constant Unsigned_8 := 16#40#;
   --  Port D Data Direction Register bit 7
   DDD7_Bit                 : constant Bit_Number := 7;
   DDD7_Mask                : constant Unsigned_8 := 16#80#;

   --  Port D Input Pins
   PIND_Addr                : constant Address    := 16#29#;
   PIND                     : Unsigned_8 ;
   for PIND'Address use PIND_Addr;
   pragma Volatile (PIND);
   PIND_Bits                : Bits_In_Byte;
   for PIND_Bits'Address use PIND_Addr;
   pragma Volatile (PIND_Bits);
   --  Port D Input Pins bit 0
   PIND0_Bit                : constant Bit_Number := 0;
   PIND0_Mask               : constant Unsigned_8 := 16#01#;
   --  Port D Input Pins bit 1
   PIND1_Bit                : constant Bit_Number := 1;
   PIND1_Mask               : constant Unsigned_8 := 16#02#;
   --  Port D Input Pins bit 2
   PIND2_Bit                : constant Bit_Number := 2;
   PIND2_Mask               : constant Unsigned_8 := 16#04#;
   --  Port D Input Pins bit 3
   PIND3_Bit                : constant Bit_Number := 3;
   PIND3_Mask               : constant Unsigned_8 := 16#08#;
   --  Port D Input Pins bit 4
   PIND4_Bit                : constant Bit_Number := 4;
   PIND4_Mask               : constant Unsigned_8 := 16#10#;
   --  Port D Input Pins bit 5
   PIND5_Bit                : constant Bit_Number := 5;
   PIND5_Mask               : constant Unsigned_8 := 16#20#;
   --  Port D Input Pins bit 6
   PIND6_Bit                : constant Bit_Number := 6;
   PIND6_Mask               : constant Unsigned_8 := 16#40#;
   --  Port D Input Pins bit 7
   PIND7_Bit                : constant Bit_Number := 7;
   PIND7_Mask               : constant Unsigned_8 := 16#80#;

   PORTC_Addr               : constant Address    := 16#28#;
   PORTC                    : Unsigned_8 ;
   for PORTC'Address use PORTC_Addr;
   pragma Volatile (PORTC);
   PORTC_Bits               : Bits_In_Byte;
   for PORTC_Bits'Address use PORTC_Addr;
   pragma Volatile (PORTC_Bits);

   DDRC_Addr                : constant Address    := 16#27#;
   DDRC                     : Unsigned_8 ;
   for DDRC'Address use DDRC_Addr;
   pragma Volatile (DDRC);
   DDRC_Bits                : Bits_In_Byte;
   for DDRC_Bits'Address use DDRC_Addr;
   pragma Volatile (DDRC_Bits);

   PINC_Addr                : constant Address    := 16#26#;
   PINC                     : Unsigned_8 ;
   for PINC'Address use PINC_Addr;
   pragma Volatile (PINC);
   PINC_Bits                : Bits_In_Byte;
   for PINC_Bits'Address use PINC_Addr;
   pragma Volatile (PINC_Bits);

   --  Port B Data Register
   PORTB_Addr               : constant Address    := 16#25#;
   PORTB                    : Unsigned_8 ;
   for PORTB'Address use PORTB_Addr;
   pragma Volatile (PORTB);
   PORTB_Bits               : Bits_In_Byte;
   for PORTB_Bits'Address use PORTB_Addr;
   pragma Volatile (PORTB_Bits);
   --  Port B Data Register bit 0
   PORTB0_Bit               : constant Bit_Number := 0;
   PORTB0_Mask              : constant Unsigned_8 := 16#01#;
   --  Port B Data Register bit 1
   PORTB1_Bit               : constant Bit_Number := 1;
   PORTB1_Mask              : constant Unsigned_8 := 16#02#;
   --  Port B Data Register bit 2
   PORTB2_Bit               : constant Bit_Number := 2;
   PORTB2_Mask              : constant Unsigned_8 := 16#04#;
   --  Port B Data Register bit 3
   PORTB3_Bit               : constant Bit_Number := 3;
   PORTB3_Mask              : constant Unsigned_8 := 16#08#;
   --  Port B Data Register bit 4
   PORTB4_Bit               : constant Bit_Number := 4;
   PORTB4_Mask              : constant Unsigned_8 := 16#10#;
   --  Port B Data Register bit 5
   PORTB5_Bit               : constant Bit_Number := 5;
   PORTB5_Mask              : constant Unsigned_8 := 16#20#;
   --  Port B Data Register bit 6
   PORTB6_Bit               : constant Bit_Number := 6;
   PORTB6_Mask              : constant Unsigned_8 := 16#40#;
   --  Port B Data Register bit 7
   PORTB7_Bit               : constant Bit_Number := 7;
   PORTB7_Mask              : constant Unsigned_8 := 16#80#;

   --  Port B Data Direction Register
   DDRB_Addr                : constant Address    := 16#24#;
   DDRB                     : Unsigned_8 ;
   for DDRB'Address use DDRB_Addr;
   pragma Volatile (DDRB);
   DDRB_Bits                : Bits_In_Byte;
   for DDRB_Bits'Address use DDRB_Addr;
   pragma Volatile (DDRB_Bits);
   --  Port B Data Direction Register bit 0
   DDB0_Bit                 : constant Bit_Number := 0;
   DDB0_Mask                : constant Unsigned_8 := 16#01#;
   --  Port B Data Direction Register bit 1
   DDB1_Bit                 : constant Bit_Number := 1;
   DDB1_Mask                : constant Unsigned_8 := 16#02#;
   --  Port B Data Direction Register bit 2
   DDB2_Bit                 : constant Bit_Number := 2;
   DDB2_Mask                : constant Unsigned_8 := 16#04#;
   --  Port B Data Direction Register bit 3
   DDB3_Bit                 : constant Bit_Number := 3;
   DDB3_Mask                : constant Unsigned_8 := 16#08#;
   --  Port B Data Direction Register bit 4
   DDB4_Bit                 : constant Bit_Number := 4;
   DDB4_Mask                : constant Unsigned_8 := 16#10#;
   --  Port B Data Direction Register bit 5
   DDB5_Bit                 : constant Bit_Number := 5;
   DDB5_Mask                : constant Unsigned_8 := 16#20#;
   --  Port B Data Direction Register bit 6
   DDB6_Bit                 : constant Bit_Number := 6;
   DDB6_Mask                : constant Unsigned_8 := 16#40#;
   --  Port B Data Direction Register bit 7
   DDB7_Bit                 : constant Bit_Number := 7;
   DDB7_Mask                : constant Unsigned_8 := 16#80#;

   --  Port B Input Pins
   PINB_Addr                : constant Address    := 16#23#;
   PINB                     : Unsigned_8 ;
   for PINB'Address use PINB_Addr;
   pragma Volatile (PINB);
   PINB_Bits                : Bits_In_Byte;
   for PINB_Bits'Address use PINB_Addr;
   pragma Volatile (PINB_Bits);
   --  Port B Input Pins bit 0
   PINB0_Bit                : constant Bit_Number := 0;
   PINB0_Mask               : constant Unsigned_8 := 16#01#;
   --  Port B Input Pins bit 1
   PINB1_Bit                : constant Bit_Number := 1;
   PINB1_Mask               : constant Unsigned_8 := 16#02#;
   --  Port B Input Pins bit 2
   PINB2_Bit                : constant Bit_Number := 2;
   PINB2_Mask               : constant Unsigned_8 := 16#04#;
   --  Port B Input Pins bit 3
   PINB3_Bit                : constant Bit_Number := 3;
   PINB3_Mask               : constant Unsigned_8 := 16#08#;
   --  Port B Input Pins bit 4
   PINB4_Bit                : constant Bit_Number := 4;
   PINB4_Mask               : constant Unsigned_8 := 16#10#;
   --  Port B Input Pins bit 5
   PINB5_Bit                : constant Bit_Number := 5;
   PINB5_Mask               : constant Unsigned_8 := 16#20#;
   --  Port B Input Pins bit 6
   PINB6_Bit                : constant Bit_Number := 6;
   PINB6_Mask               : constant Unsigned_8 := 16#40#;
   --  Port B Input Pins bit 7
   PINB7_Bit                : constant Bit_Number := 7;
   PINB7_Mask               : constant Unsigned_8 := 16#80#;



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


end AVR.AT90PWM2;
