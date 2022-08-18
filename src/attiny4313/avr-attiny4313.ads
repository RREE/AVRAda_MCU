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

package AVR.ATtiny4313 is
   pragma Preelaborate;

   CVS_Version : constant String := "$Id$";


   --
   --  memory sizes
   --
   Flash_Size               : constant := 16#1000#;
   Flash_End                : constant := 16#0fff#;
   EEprom_Size              : constant := 16#0100#;
   E2end                    : constant := 16#00ff#;
   Int_SRAM_Start_Addr      : constant := 16#60#;
   Int_SRAM_Size            : constant := 16#100#;

   --
   --  interrupts
   --
   Number_Of_Interrupts     : constant := 21;

   --  External Reset, Power-on Reset and Watchdog Reset
   Sig_RESET                : constant        :=  0;
   Sig_RESET_String         : constant String := "__vector_0";
   --  External Interrupt Request 0
   Sig_INT0                 : constant        :=  1;
   Sig_INT0_String          : constant String := "__vector_1";
   --  External Interrupt Request 1
   Sig_INT1                 : constant        :=  2;
   Sig_INT1_String          : constant String := "__vector_2";
   --  Timer/Counter1 Capture Event
   Sig_TIMER1_CAPT          : constant        :=  3;
   Sig_TIMER1_CAPT_String   : constant String := "__vector_3";
   --  Timer/Counter1 Compare Match A
   Sig_TIMER1_COMPA         : constant        :=  4;
   Sig_TIMER1_COMPA_String  : constant String := "__vector_4";
   --  Timer/Counter1 Overflow
   Sig_TIMER1_OVF           : constant        :=  5;
   Sig_TIMER1_OVF_String    : constant String := "__vector_5";
   --  Timer/Counter0 Overflow
   Sig_TIMER0_OVF           : constant        :=  6;
   Sig_TIMER0_OVF_String    : constant String := "__vector_6";
   --  USART, Rx Complete
   Sig_USART_RX             : constant        :=  7;
   Sig_USART_RX_String      : constant String := "__vector_7";
   --  USART Data Register Empty
   Sig_USART_UDRE           : constant        :=  8;
   Sig_USART_UDRE_String    : constant String := "__vector_8";
   --  USART, Tx Complete
   Sig_USART_TX             : constant        :=  9;
   Sig_USART_TX_String      : constant String := "__vector_9";
   --  Analog Comparator
   Sig_ANA_COMP             : constant        := 10;
   Sig_ANA_COMP_String      : constant String := "__vector_10";
   --  Pin Change Interrupt Request B
   Sig_PCINT_B              : constant        := 11;
   Sig_PCINT_B_String       : constant String := "__vector_11";
   --
   Sig_TIMER1_COMPB         : constant        := 12;
   Sig_TIMER1_COMPB_String  : constant String := "__vector_12";
   --
   Sig_TIMER0_COMPA         : constant        := 13;
   Sig_TIMER0_COMPA_String  : constant String := "__vector_13";
   --
   Sig_TIMER0_COMPB         : constant        := 14;
   Sig_TIMER0_COMPB_String  : constant String := "__vector_14";
   --  USI Start Condition
   Sig_USI_START            : constant        := 15;
   Sig_USI_START_String     : constant String := "__vector_15";
   --  USI Overflow
   Sig_USI_OVERFLOW         : constant        := 16;
   Sig_USI_OVERFLOW_String  : constant String := "__vector_16";
   --
   Sig_EEPROM_Ready         : constant        := 17;
   Sig_EEPROM_Ready_String  : constant String := "__vector_17";
   --  Watchdog Timer Overflow
   Sig_WDT_OVERFLOW         : constant        := 18;
   Sig_WDT_OVERFLOW_String  : constant String := "__vector_18";
   --  Pin Change Interrupt Request A
   Sig_PCINT_A              : constant        := 19;
   Sig_PCINT_A_String       : constant String := "__vector_19";
   --  Pin Change Interrupt Request D
   Sig_PCINT_D              : constant        := 20;
   Sig_PCINT_D_String       : constant String := "__vector_20";


   --
   --  I/O registers
   --

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

   --  Timer/Counter0 Output Compare Register
   OCR0B_Addr               : constant Address    := 16#5c#;
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

   --  General Interrupt Mask Register
   GIMSK_Addr               : constant Address    := 16#5b#;
   GIMSK                    : Unsigned_8 ;
   for GIMSK'Address use GIMSK_Addr;
   pragma Volatile (GIMSK);
   GIMSK_Bits               : Bits_In_Byte;
   for GIMSK_Bits'Address use GIMSK_Addr;
   pragma Volatile (GIMSK_Bits);
   PCIE_Bit                 : constant Bit_Number := 5;
   PCIE_Mask                : constant Unsigned_8 := 16#20#;
   PCIE1_Bit                 : constant Bit_Number := 3;
   PCIE1_Mask                : constant Unsigned_8 := 16#08#;
   PCIE2_Bit                 : constant Bit_Number := 4;
   PCIE2_Mask                : constant Unsigned_8 := 16#10#;
   --  External Interrupt Request 0 Enable
   INT0_Bit                 : constant Bit_Number := 6;
   INT0_Mask                : constant Unsigned_8 := 16#40#;
   --  External Interrupt Request 1 Enable
   INT1_Bit                 : constant Bit_Number := 7;
   INT1_Mask                : constant Unsigned_8 := 16#80#;

   --  Extended Interrupt Flag Register
   EIFR_Addr                : constant Address    := 16#5a#;
   EIFR                     : Unsigned_8 ;
   for EIFR'Address use EIFR_Addr;
   pragma Volatile (EIFR);
   EIFR_Bits                : Bits_In_Byte;
   for EIFR_Bits'Address use EIFR_Addr;
   pragma Volatile (EIFR_Bits);
   PCIF_Bit                 : constant Bit_Number := 5;
   PCIF_Mask                : constant Unsigned_8 := 16#20#;
   --  External Interrupt Flag 0
   INTF0_Bit                : constant Bit_Number := 6;
   INTF0_Mask               : constant Unsigned_8 := 16#40#;
   --  External Interrupt Flag 1
   INTF1_Bit                : constant Bit_Number := 7;
   INTF1_Mask               : constant Unsigned_8 := 16#80#;

   --  Timer/Counter Interrupt Mask Register
   TIMSK_Addr               : constant Address    := 16#59#;
   TIMSK                    : Unsigned_8 ;
   for TIMSK'Address use TIMSK_Addr;
   pragma Volatile (TIMSK);
   TIMSK_Bits               : Bits_In_Byte;
   for TIMSK_Bits'Address use TIMSK_Addr;
   pragma Volatile (TIMSK_Bits);
   --  Timer/Counter0 Output Compare Match A Interrupt Enable
   OCIE0A_Bit               : constant Bit_Number := 0;
   OCIE0A_Mask              : constant Unsigned_8 := 16#01#;
   --  Timer/Counter0 Overflow Interrupt Enable
   TOIE0_Bit                : constant Bit_Number := 1;
   TOIE0_Mask               : constant Unsigned_8 := 16#02#;
   --  Timer/Counter0 Output Compare Match B Interrupt Enable
   OCIE0B_Bit               : constant Bit_Number := 2;
   OCIE0B_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Input Capture Interrupt Enable
   ICIE1_Bit                : constant Bit_Number := 3;
   ICIE1_Mask               : constant Unsigned_8 := 16#08#;
   --  Timer/Counter1 Output CompareB Match Interrupt Enable
   OCIE1B_Bit               : constant Bit_Number := 5;
   OCIE1B_Mask              : constant Unsigned_8 := 16#20#;
   --  Timer/Counter1 Output CompareA Match Interrupt Enable
   OCIE1A_Bit               : constant Bit_Number := 6;
   OCIE1A_Mask              : constant Unsigned_8 := 16#40#;
   --  Timer/Counter1 Overflow Interrupt Enable
   TOIE1_Bit                : constant Bit_Number := 7;
   TOIE1_Mask               : constant Unsigned_8 := 16#80#;

   --  Timer/Counter Interrupt Flag register
   TIFR_Addr                : constant Address    := 16#58#;
   TIFR                     : Unsigned_8 ;
   for TIFR'Address use TIFR_Addr;
   pragma Volatile (TIFR);
   TIFR_Bits                : Bits_In_Byte;
   for TIFR_Bits'Address use TIFR_Addr;
   pragma Volatile (TIFR_Bits);
   --  Timer/Counter0 Output Compare Flag 0A
   OCF0A_Bit                : constant Bit_Number := 0;
   OCF0A_Mask               : constant Unsigned_8 := 16#01#;
   --  Timer/Counter0 Overflow Flag
   TOV0_Bit                 : constant Bit_Number := 1;
   TOV0_Mask                : constant Unsigned_8 := 16#02#;
   --  Timer/Counter0 Output Compare Flag 0B
   OCF0B_Bit                : constant Bit_Number := 2;
   OCF0B_Mask               : constant Unsigned_8 := 16#04#;
   --  Input Capture Flag 1
   ICF1_Bit                 : constant Bit_Number := 3;
   ICF1_Mask                : constant Unsigned_8 := 16#08#;
   --  Output Compare Flag 1B
   OCF1B_Bit                : constant Bit_Number := 5;
   OCF1B_Mask               : constant Unsigned_8 := 16#20#;
   --  Output Compare Flag 1A
   OCF1A_Bit                : constant Bit_Number := 6;
   OCF1A_Mask               : constant Unsigned_8 := 16#40#;
   --  Timer/Counter1 Overflow Flag
   TOV1_Bit                 : constant Bit_Number := 7;
   TOV1_Mask                : constant Unsigned_8 := 16#80#;

   --  Store Program Memory Control and Status register
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
   --  Read Fuse and Lock Bits
   RFLB_Bit                 : constant Bit_Number := 3;
   RFLB_Mask                : constant Unsigned_8 := 16#08#;
   --  Clear Temporary Page Buffer
   CTPB_Bit                 : constant Bit_Number := 4;
   CTPB_Mask                : constant Unsigned_8 := 16#10#;

   --  Timer/Counter0 Output Compare Register
   OCR0A_Addr               : constant Address    := 16#56#;
   OCR0A                    : Unsigned_8 ;
   for OCR0A'Address use OCR0A_Addr;
   pragma Volatile (OCR0A);
   OCR0A_Bits               : Bits_In_Byte;
   for OCR0A_Bits'Address use OCR0A_Addr;
   pragma Volatile (OCR0A_Bits);
   OCR0A_0_Bit              : constant Bit_Number := 0;
   OCR0A_0_Mask             : constant Unsigned_8 := 16#01#;
   OCR0A_1_Bit              : constant Bit_Number := 1;
   OCR0A_1_Mask             : constant Unsigned_8 := 16#02#;
   OCR0A_2_Bit              : constant Bit_Number := 2;
   OCR0A_2_Mask             : constant Unsigned_8 := 16#04#;
   OCR0A_3_Bit              : constant Bit_Number := 3;
   OCR0A_3_Mask             : constant Unsigned_8 := 16#08#;
   OCR0A_4_Bit              : constant Bit_Number := 4;
   OCR0A_4_Mask             : constant Unsigned_8 := 16#10#;
   OCR0A_5_Bit              : constant Bit_Number := 5;
   OCR0A_5_Mask             : constant Unsigned_8 := 16#20#;
   OCR0A_6_Bit              : constant Bit_Number := 6;
   OCR0A_6_Mask             : constant Unsigned_8 := 16#40#;
   OCR0A_7_Bit              : constant Bit_Number := 7;
   OCR0A_7_Mask             : constant Unsigned_8 := 16#80#;

   --  MCU Control Register
   MCUCR_Addr               : constant Address    := 16#55#;
   MCUCR                    : Unsigned_8 ;
   for MCUCR'Address use MCUCR_Addr;
   pragma Volatile (MCUCR);
   MCUCR_Bits               : Bits_In_Byte;
   for MCUCR_Bits'Address use MCUCR_Addr;
   pragma Volatile (MCUCR_Bits);
   --  Interrupt Sense Control 0 bit 0
   ISC00_Bit                : constant Bit_Number := 0;
   ISC00_Mask               : constant Unsigned_8 := 16#01#;
   --  Interrupt Sense Control 0 bit 1
   ISC01_Bit                : constant Bit_Number := 1;
   ISC01_Mask               : constant Unsigned_8 := 16#02#;
   --  Interrupt Sense Control 1 bit 0
   ISC10_Bit                : constant Bit_Number := 2;
   ISC10_Mask               : constant Unsigned_8 := 16#04#;
   --  Interrupt Sense Control 1 bit 1
   ISC11_Bit                : constant Bit_Number := 3;
   ISC11_Mask               : constant Unsigned_8 := 16#08#;
   --  Sleep Mode Select Bit 0
   SM0_Bit                  : constant Bit_Number := 4;
   SM0_Mask                 : constant Unsigned_8 := 16#10#;
   --  Sleep Enable
   SE_Bit                   : constant Bit_Number := 5;
   SE_Mask                  : constant Unsigned_8 := 16#20#;
   --  Sleep Mode Select Bit 1
   SM1_Bit                  : constant Bit_Number := 6;
   SM1_Mask                 : constant Unsigned_8 := 16#40#;
   --  Pull-up Disable
   PUD_Bit                  : constant Bit_Number := 7;
   PUD_Mask                 : constant Unsigned_8 := 16#80#;

   --  MCU Status register
   MCUSR_Addr               : constant Address    := 16#54#;
   MCUSR                    : Unsigned_8 ;
   for MCUSR'Address use MCUSR_Addr;
   pragma Volatile (MCUSR);
   MCUSR_Bits               : Bits_In_Byte;
   for MCUSR_Bits'Address use MCUSR_Addr;
   pragma Volatile (MCUSR_Bits);
   --  Power-On Reset Flag
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

   --  Timer/Counter Control Register B
   TCCR0B_Addr              : constant Address    := 16#53#;
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
   --  Force Output Compare B
   FOC0A_Bit                : constant Bit_Number := 7;
   FOC0A_Mask               : constant Unsigned_8 := 16#80#;

   --  Timer/Counter0
   TCNT0_Addr               : constant Address    := 16#52#;
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

   --  Oscillator Calibration Register
   OSCCAL_Addr              : constant Address    := 16#51#;
   OSCCAL                   : Unsigned_8 ;
   for OSCCAL'Address use OSCCAL_Addr;
   pragma Volatile (OSCCAL);
   OSCCAL_Bits              : Bits_In_Byte;
   for OSCCAL_Bits'Address use OSCCAL_Addr;
   pragma Volatile (OSCCAL_Bits);
   --  Oscillatro Calibration Value Bit 0
   CAL0_Bit                 : constant Bit_Number := 0;
   CAL0_Mask                : constant Unsigned_8 := 16#01#;
   --  Oscillatro Calibration Value Bit 1
   CAL1_Bit                 : constant Bit_Number := 1;
   CAL1_Mask                : constant Unsigned_8 := 16#02#;
   --  Oscillatro Calibration Value Bit 2
   CAL2_Bit                 : constant Bit_Number := 2;
   CAL2_Mask                : constant Unsigned_8 := 16#04#;
   --  Oscillatro Calibration Value Bit 3
   CAL3_Bit                 : constant Bit_Number := 3;
   CAL3_Mask                : constant Unsigned_8 := 16#08#;
   --  Oscillatro Calibration Value Bit 4
   CAL4_Bit                 : constant Bit_Number := 4;
   CAL4_Mask                : constant Unsigned_8 := 16#10#;
   --  Oscillatro Calibration Value Bit 5
   CAL5_Bit                 : constant Bit_Number := 5;
   CAL5_Mask                : constant Unsigned_8 := 16#20#;
   --  Oscillatro Calibration Value Bit 6
   CAL6_Bit                 : constant Bit_Number := 6;
   CAL6_Mask                : constant Unsigned_8 := 16#40#;

   --  Timer/Counter  Control Register A
   TCCR0A_Addr              : constant Address    := 16#50#;
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
   --  Compare Match Output B Mode
   COM0B0_Bit               : constant Bit_Number := 4;
   COM0B0_Mask              : constant Unsigned_8 := 16#10#;
   --  Compare Match Output B Mode
   COM0B1_Bit               : constant Bit_Number := 5;
   COM0B1_Mask              : constant Unsigned_8 := 16#20#;
   --  Compare Match Output A Mode
   COM0A0_Bit               : constant Bit_Number := 6;
   COM0A0_Mask              : constant Unsigned_8 := 16#40#;
   --  Compare Match Output A Mode
   COM0A1_Bit               : constant Bit_Number := 7;
   COM0A1_Mask              : constant Unsigned_8 := 16#80#;

   --  Timer/Counter1 Control Register A
   TCCR1A_Addr              : constant Address    := 16#4f#;
   TCCR1A                   : Unsigned_8 ;
   for TCCR1A'Address use TCCR1A_Addr;
   pragma Volatile (TCCR1A);
   TCCR1A_Bits              : Bits_In_Byte;
   for TCCR1A_Bits'Address use TCCR1A_Addr;
   pragma Volatile (TCCR1A_Bits);
   --  Pulse Width Modulator Select Bit 0
   WGM10_Bit                : constant Bit_Number := 0;
   WGM10_Mask               : constant Unsigned_8 := 16#01#;
   --  Pulse Width Modulator Select Bit 1
   WGM11_Bit                : constant Bit_Number := 1;
   WGM11_Mask               : constant Unsigned_8 := 16#02#;
   --  Comparet Ouput Mode 1B, bit 0
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

   --  Timer/Counter1 Control Register B
   TCCR1B_Addr              : constant Address    := 16#4e#;
   TCCR1B                   : Unsigned_8 ;
   for TCCR1B'Address use TCCR1B_Addr;
   pragma Volatile (TCCR1B);
   TCCR1B_Bits              : Bits_In_Byte;
   for TCCR1B_Bits'Address use TCCR1B_Addr;
   pragma Volatile (TCCR1B_Bits);
   --  Clock Select bit 0
   CS10_Bit                 : constant Bit_Number := 0;
   CS10_Mask                : constant Unsigned_8 := 16#01#;
   --  Clock Select 1 bit 1
   CS11_Bit                 : constant Bit_Number := 1;
   CS11_Mask                : constant Unsigned_8 := 16#02#;
   --  Clock Select1 bit 2
   CS12_Bit                 : constant Bit_Number := 2;
   CS12_Mask                : constant Unsigned_8 := 16#04#;
   --  Waveform Generation Mode Bit 2
   WGM12_Bit                : constant Bit_Number := 3;
   WGM12_Mask               : constant Unsigned_8 := 16#08#;
   --  Waveform Generation Mode Bit 3
   WGM13_Bit                : constant Bit_Number := 4;
   WGM13_Mask               : constant Unsigned_8 := 16#10#;
   --  Input Capture 1 Edge Select
   ICES1_Bit                : constant Bit_Number := 6;
   ICES1_Mask               : constant Unsigned_8 := 16#40#;
   --  Input Capture 1 Noise Canceler
   ICNC1_Bit                : constant Bit_Number := 7;
   ICNC1_Mask               : constant Unsigned_8 := 16#80#;

   --  Timer/Counter1 High Byte
   TCNT1H_Addr              : constant Address    := 16#4d#;
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
   TCNT1L_Addr              : constant Address    := 16#4c#;
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

   --  Timer/Counter1 Outbut Compare Register High Byte
   OCR1AH_Addr              : constant Address    := 16#4b#;
   OCR1AH                   : Unsigned_8 ;
   for OCR1AH'Address use OCR1AH_Addr;
   pragma Volatile (OCR1AH);
   OCR1AH_Bits              : Bits_In_Byte;
   for OCR1AH_Bits'Address use OCR1AH_Addr;
   pragma Volatile (OCR1AH_Bits);
   --  Timer/Counter1 Outbut Compare Register High Byte bit 0
   OCR1AH0_Bit              : constant Bit_Number := 0;
   OCR1AH0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Outbut Compare Register High Byte bit 1
   OCR1AH1_Bit              : constant Bit_Number := 1;
   OCR1AH1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Outbut Compare Register High Byte bit 2
   OCR1AH2_Bit              : constant Bit_Number := 2;
   OCR1AH2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Outbut Compare Register High Byte bit 3
   OCR1AH3_Bit              : constant Bit_Number := 3;
   OCR1AH3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter1 Outbut Compare Register High Byte bit 4
   OCR1AH4_Bit              : constant Bit_Number := 4;
   OCR1AH4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter1 Outbut Compare Register High Byte bit 5
   OCR1AH5_Bit              : constant Bit_Number := 5;
   OCR1AH5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter1 Outbut Compare Register High Byte bit 6
   OCR1AH6_Bit              : constant Bit_Number := 6;
   OCR1AH6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter1 Outbut Compare Register High Byte bit 7
   OCR1AH7_Bit              : constant Bit_Number := 7;
   OCR1AH7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter1 Outbut Compare Register Low Byte
   OCR1AL_Addr              : constant Address    := 16#4a#;
   OCR1A                    : Unsigned_16;
   for OCR1A'Address use OCR1AL_Addr;
   pragma Volatile (OCR1A);
   OCR1AL                   : Unsigned_8 ;
   for OCR1AL'Address use OCR1AL_Addr;
   pragma Volatile (OCR1AL);
   OCR1AL_Bits              : Bits_In_Byte;
   for OCR1AL_Bits'Address use OCR1AL_Addr;
   pragma Volatile (OCR1AL_Bits);
   --  Timer/Counter1 Outbut Compare Register Low Byte Bit 0
   OCR1AL0_Bit              : constant Bit_Number := 0;
   OCR1AL0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Outbut Compare Register Low Byte Bit 1
   OCR1AL1_Bit              : constant Bit_Number := 1;
   OCR1AL1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Outbut Compare Register Low Byte Bit 2
   OCR1AL2_Bit              : constant Bit_Number := 2;
   OCR1AL2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Outbut Compare Register Low Byte Bit 3
   OCR1AL3_Bit              : constant Bit_Number := 3;
   OCR1AL3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter1 Outbut Compare Register Low Byte Bit 4
   OCR1AL4_Bit              : constant Bit_Number := 4;
   OCR1AL4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter1 Outbut Compare Register Low Byte Bit 5
   OCR1AL5_Bit              : constant Bit_Number := 5;
   OCR1AL5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter1 Outbut Compare Register Low Byte Bit 6
   OCR1AL6_Bit              : constant Bit_Number := 6;
   OCR1AL6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter1 Outbut Compare Register Low Byte Bit 7
   OCR1AL7_Bit              : constant Bit_Number := 7;
   OCR1AL7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter1 Outbut Compare Register High Byte
   OCR1BH_Addr              : constant Address    := 16#49#;
   OCR1BH                   : Unsigned_8 ;
   for OCR1BH'Address use OCR1BH_Addr;
   pragma Volatile (OCR1BH);
   OCR1BH_Bits              : Bits_In_Byte;
   for OCR1BH_Bits'Address use OCR1BH_Addr;
   pragma Volatile (OCR1BH_Bits);
   --  Timer/Counter1 Outbut Compare Register High Byte bit 0
   OCR1BH0_Bit              : constant Bit_Number := 0;
   OCR1BH0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Outbut Compare Register High Byte bit 1
   OCR1BH1_Bit              : constant Bit_Number := 1;
   OCR1BH1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Outbut Compare Register High Byte bit 2
   OCR1BH2_Bit              : constant Bit_Number := 2;
   OCR1BH2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Outbut Compare Register High Byte bit 3
   OCR1BH3_Bit              : constant Bit_Number := 3;
   OCR1BH3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter1 Outbut Compare Register High Byte bit 4
   OCR1BH4_Bit              : constant Bit_Number := 4;
   OCR1BH4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter1 Outbut Compare Register High Byte bit 5
   OCR1BH5_Bit              : constant Bit_Number := 5;
   OCR1BH5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter1 Outbut Compare Register High Byte bit 6
   OCR1BH6_Bit              : constant Bit_Number := 6;
   OCR1BH6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter1 Outbut Compare Register High Byte bit 7
   OCR1BH7_Bit              : constant Bit_Number := 7;
   OCR1BH7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter1 Output Compare Register Low Byte
   OCR1BL_Addr              : constant Address    := 16#48#;
   OCR1B                    : Unsigned_16;
   for OCR1B'Address use OCR1BL_Addr;
   pragma Volatile (OCR1B);
   OCR1BL                   : Unsigned_8 ;
   for OCR1BL'Address use OCR1BL_Addr;
   pragma Volatile (OCR1BL);
   OCR1BL_Bits              : Bits_In_Byte;
   for OCR1BL_Bits'Address use OCR1BL_Addr;
   pragma Volatile (OCR1BL_Bits);
   --  Timer/Counter1 Outbut Compare Register Low Byte Bit 0
   OCR1BL0_Bit              : constant Bit_Number := 0;
   OCR1BL0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Outbut Compare Register Low Byte Bit 1
   OCR1BL1_Bit              : constant Bit_Number := 1;
   OCR1BL1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Outbut Compare Register Low Byte Bit 2
   OCR1BL2_Bit              : constant Bit_Number := 2;
   OCR1BL2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Outbut Compare Register Low Byte Bit 3
   OCR1BL3_Bit              : constant Bit_Number := 3;
   OCR1BL3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter1 Outbut Compare Register Low Byte Bit 4
   OCR1BL4_Bit              : constant Bit_Number := 4;
   OCR1BL4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter1 Outbut Compare Register Low Byte Bit 5
   OCR1BL5_Bit              : constant Bit_Number := 5;
   OCR1BL5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter1 Outbut Compare Register Low Byte Bit 6
   OCR1BL6_Bit              : constant Bit_Number := 6;
   OCR1BL6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter1 Outbut Compare Register Low Byte Bit 7
   OCR1BL7_Bit              : constant Bit_Number := 7;
   OCR1BL7_Mask             : constant Unsigned_8 := 16#80#;

   --  Clock Prescale Register
   CLKPR_Addr               : constant Address    := 16#46#;
   CLKPR                    : Unsigned_8 ;
   for CLKPR'Address use CLKPR_Addr;
   pragma Volatile (CLKPR);
   CLKPR_Bits               : Bits_In_Byte;
   for CLKPR_Bits'Address use CLKPR_Addr;
   pragma Volatile (CLKPR_Bits);
   --  Clock Prescaler Select Bit 0
   CLKPS0_Bit               : constant Bit_Number := 0;
   CLKPS0_Mask              : constant Unsigned_8 := 16#01#;
   --  Clock Prescaler Select Bit 1
   CLKPS1_Bit               : constant Bit_Number := 1;
   CLKPS1_Mask              : constant Unsigned_8 := 16#02#;
   --  Clock Prescaler Select Bit 2
   CLKPS2_Bit               : constant Bit_Number := 2;
   CLKPS2_Mask              : constant Unsigned_8 := 16#04#;
   --  Clock Prescaler Select Bit 3
   CLKPS3_Bit               : constant Bit_Number := 3;
   CLKPS3_Mask              : constant Unsigned_8 := 16#08#;
   --  Clock Prescaler Change Enable
   CLKPCE_Bit               : constant Bit_Number := 7;
   CLKPCE_Mask              : constant Unsigned_8 := 16#80#;

   --  Timer/Counter1 Input Capture Register High Byte
   ICR1H_Addr               : constant Address    := 16#45#;
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
   ICR1L_Addr               : constant Address    := 16#44#;
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

   --  General Timer Counter Control Register
   GTCCR_Addr               : constant Address    := 16#43#;
   GTCCR                    : Unsigned_8 ;
   for GTCCR'Address use GTCCR_Addr;
   pragma Volatile (GTCCR);
   GTCCR_Bits               : Bits_In_Byte;
   for GTCCR_Bits'Address use GTCCR_Addr;
   pragma Volatile (GTCCR_Bits);
   PSR10_Bit                : constant Bit_Number := 0;
   PSR10_Mask               : constant Unsigned_8 := 16#01#;

   --  Timer/Counter1 Control Register C
   TCCR1C_Addr              : constant Address    := 16#42#;
   TCCR1C                   : Unsigned_8 ;
   for TCCR1C'Address use TCCR1C_Addr;
   pragma Volatile (TCCR1C);
   TCCR1C_Bits              : Bits_In_Byte;
   for TCCR1C_Bits'Address use TCCR1C_Addr;
   pragma Volatile (TCCR1C_Bits);
   --  Force Output Compare for Channel B
   FOC1B_Bit                : constant Bit_Number := 6;
   FOC1B_Mask               : constant Unsigned_8 := 16#40#;
   --  Force Output Compare for Channel A
   FOC1A_Bit                : constant Bit_Number := 7;
   FOC1A_Mask               : constant Unsigned_8 := 16#80#;

   --  Watchdog Timer Control Register
   WDTCR_Addr               : constant Address    := 16#41#;
   WDTCR                    : Unsigned_8 ;
   for WDTCR'Address use WDTCR_Addr;
   pragma Volatile (WDTCR);
   WDTCR_Bits               : Bits_In_Byte;
   for WDTCR_Bits'Address use WDTCR_Addr;
   pragma Volatile (WDTCR_Bits);
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

   --  Pin-Change Mask register
   PCMSK_Addr               : constant Address    := 16#40#;
   PCMSK                    : Unsigned_8 ;
   for PCMSK'Address use PCMSK_Addr;
   pragma Volatile (PCMSK);
   PCMSK_Bits               : Bits_In_Byte;
   for PCMSK_Bits'Address use PCMSK_Addr;
   pragma Volatile (PCMSK_Bits);
   --  Pin-Change Interrupt 0
   PCINT0_Bit               : constant Bit_Number := 0;
   PCINT0_Mask              : constant Unsigned_8 := 16#01#;
   --  Pin-Change Interrupt 1
   PCINT1_Bit               : constant Bit_Number := 1;
   PCINT1_Mask              : constant Unsigned_8 := 16#02#;
   --  Pin-Change Interrupt 2
   PCINT2_Bit               : constant Bit_Number := 2;
   PCINT2_Mask              : constant Unsigned_8 := 16#04#;
   --  Pin-Change Interrupt 3
   PCINT3_Bit               : constant Bit_Number := 3;
   PCINT3_Mask              : constant Unsigned_8 := 16#08#;
   --  Pin-Change Interrupt 4
   PCINT4_Bit               : constant Bit_Number := 4;
   PCINT4_Mask              : constant Unsigned_8 := 16#10#;
   --  Pin-Change Interrupt 5
   PCINT5_Bit               : constant Bit_Number := 5;
   PCINT5_Mask              : constant Unsigned_8 := 16#20#;
   --  Pin-Change Interrupt 6
   PCINT6_Bit               : constant Bit_Number := 6;
   PCINT6_Mask              : constant Unsigned_8 := 16#40#;
   --  Pin-Change Interrupt 7
   PCINT7_Bit               : constant Bit_Number := 7;
   PCINT7_Mask              : constant Unsigned_8 := 16#80#;

   --  EEPROM Read/Write Access
   EEAR_Addr                : constant Address    := 16#3e#;
   EEAR                     : Unsigned_8 ;
   for EEAR'Address use EEAR_Addr;
   pragma Volatile (EEAR);
   EEAR_Bits                : Bits_In_Byte;
   for EEAR_Bits'Address use EEAR_Addr;
   pragma Volatile (EEAR_Bits);
   --  EEPROM Read/Write Access bit 0
   EEAR0_Bit                : constant Bit_Number := 0;
   EEAR0_Mask               : constant Unsigned_8 := 16#01#;
   --  EEPROM Read/Write Access bit 1
   EEAR1_Bit                : constant Bit_Number := 1;
   EEAR1_Mask               : constant Unsigned_8 := 16#02#;
   --  EEPROM Read/Write Access bit 2
   EEAR2_Bit                : constant Bit_Number := 2;
   EEAR2_Mask               : constant Unsigned_8 := 16#04#;
   --  EEPROM Read/Write Access bit 3
   EEAR3_Bit                : constant Bit_Number := 3;
   EEAR3_Mask               : constant Unsigned_8 := 16#08#;
   --  EEPROM Read/Write Access bit 4
   EEAR4_Bit                : constant Bit_Number := 4;
   EEAR4_Mask               : constant Unsigned_8 := 16#10#;
   --  EEPROM Read/Write Access bit 5
   EEAR5_Bit                : constant Bit_Number := 5;
   EEAR5_Mask               : constant Unsigned_8 := 16#20#;
   --  EEPROM Read/Write Access bit 6
   EEAR6_Bit                : constant Bit_Number := 6;
   EEAR6_Mask               : constant Unsigned_8 := 16#40#;

   --  EEPROM Data Register
   EEDR_Addr                : constant Address    := 16#3d#;
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
   EECR_Addr                : constant Address    := 16#3c#;
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
   EEPE_Bit                 : constant Bit_Number := 1;
   EEPE_Mask                : constant Unsigned_8 := 16#02#;
   --  EEPROM Master Write Enable
   EEMPE_Bit                : constant Bit_Number := 2;
   EEMPE_Mask               : constant Unsigned_8 := 16#04#;
   --  EEProm Ready Interrupt Enable
   EERIE_Bit                : constant Bit_Number := 3;
   EERIE_Mask               : constant Unsigned_8 := 16#08#;
   EEPM0_Bit                : constant Bit_Number := 4;
   EEPM0_Mask               : constant Unsigned_8 := 16#10#;
   EEPM1_Bit                : constant Bit_Number := 5;
   EEPM1_Mask               : constant Unsigned_8 := 16#20#;

   --  Port A Data Register
   PORTA_Addr               : constant Address    := 16#3b#;
   PORTA                    : Unsigned_8 ;
   for PORTA'Address use PORTA_Addr;
   pragma Volatile (PORTA);
   PORTA_Bits               : Bits_In_Byte;
   for PORTA_Bits'Address use PORTA_Addr;
   pragma Volatile (PORTA_Bits);
   --  Port A Data Register bit 0
   PORTA0_Bit               : constant Bit_Number := 0;
   PORTA0_Mask              : constant Unsigned_8 := 16#01#;
   --  Port A Data Register bit 1
   PORTA1_Bit               : constant Bit_Number := 1;
   PORTA1_Mask              : constant Unsigned_8 := 16#02#;
   --  Port A Data Register bit 2
   PORTA2_Bit               : constant Bit_Number := 2;
   PORTA2_Mask              : constant Unsigned_8 := 16#04#;

   --  Port A Data Direction Register
   DDRA_Addr                : constant Address    := 16#3a#;
   DDRA                     : Unsigned_8 ;
   for DDRA'Address use DDRA_Addr;
   pragma Volatile (DDRA);
   DDRA_Bits                : Bits_In_Byte;
   for DDRA_Bits'Address use DDRA_Addr;
   pragma Volatile (DDRA_Bits);
   --  Data Direction Register, Port A, bit 0
   DDA0_Bit                 : constant Bit_Number := 0;
   DDA0_Mask                : constant Unsigned_8 := 16#01#;
   --  Data Direction Register, Port A, bit 1
   DDA1_Bit                 : constant Bit_Number := 1;
   DDA1_Mask                : constant Unsigned_8 := 16#02#;
   --  Data Direction Register, Port A, bit 2
   DDA2_Bit                 : constant Bit_Number := 2;
   DDA2_Mask                : constant Unsigned_8 := 16#04#;

   --  Port A Input Pins
   PINA_Addr                : constant Address    := 16#39#;
   PINA                     : Unsigned_8 ;
   for PINA'Address use PINA_Addr;
   pragma Volatile (PINA);
   PINA_Bits                : Bits_In_Byte;
   for PINA_Bits'Address use PINA_Addr;
   pragma Volatile (PINA_Bits);
   --  Input Pins, Port A bit 0
   PINA0_Bit                : constant Bit_Number := 0;
   PINA0_Mask               : constant Unsigned_8 := 16#01#;
   --  Input Pins, Port A bit 1
   PINA1_Bit                : constant Bit_Number := 1;
   PINA1_Mask               : constant Unsigned_8 := 16#02#;
   --  Input Pins, Port A bit 2
   PINA2_Bit                : constant Bit_Number := 2;
   PINA2_Mask               : constant Unsigned_8 := 16#04#;

   --  Port B Data Register
   PORTB_Addr               : constant Address    := 16#38#;
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
   DDRB_Addr                : constant Address    := 16#37#;
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
   PINB_Addr                : constant Address    := 16#36#;
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

   --  General Purpose I/O Register 2
   GPIOR2_Addr              : constant Address    := 16#35#;
   GPIOR2                   : Unsigned_8 ;
   for GPIOR2'Address use GPIOR2_Addr;
   pragma Volatile (GPIOR2);
   GPIOR2_Bits              : Bits_In_Byte;
   for GPIOR2_Bits'Address use GPIOR2_Addr;
   pragma Volatile (GPIOR2_Bits);
   --  General Purpose I/O Register 2 bit 0
   GPIOR20_Bit              : constant Bit_Number := 0;
   GPIOR20_Mask             : constant Unsigned_8 := 16#01#;
   --  General Purpose I/O Register 2 bit 1
   GPIOR21_Bit              : constant Bit_Number := 1;
   GPIOR21_Mask             : constant Unsigned_8 := 16#02#;
   --  General Purpose I/O Register 2 bit 2
   GPIOR22_Bit              : constant Bit_Number := 2;
   GPIOR22_Mask             : constant Unsigned_8 := 16#04#;
   --  General Purpose I/O Register 2 bit 3
   GPIOR23_Bit              : constant Bit_Number := 3;
   GPIOR23_Mask             : constant Unsigned_8 := 16#08#;
   --  General Purpose I/O Register 2 bit 4
   GPIOR24_Bit              : constant Bit_Number := 4;
   GPIOR24_Mask             : constant Unsigned_8 := 16#10#;
   --  General Purpose I/O Register 2 bit 5
   GPIOR25_Bit              : constant Bit_Number := 5;
   GPIOR25_Mask             : constant Unsigned_8 := 16#20#;
   --  General Purpose I/O Register 2 bit 6
   GPIOR26_Bit              : constant Bit_Number := 6;
   GPIOR26_Mask             : constant Unsigned_8 := 16#40#;
   --  General Purpose I/O Register 2 bit 7
   GPIOR27_Bit              : constant Bit_Number := 7;
   GPIOR27_Mask             : constant Unsigned_8 := 16#80#;

   --  General Purpose I/O Register 1
   GPIOR1_Addr              : constant Address    := 16#34#;
   GPIOR1                   : Unsigned_8 ;
   for GPIOR1'Address use GPIOR1_Addr;
   pragma Volatile (GPIOR1);
   GPIOR1_Bits              : Bits_In_Byte;
   for GPIOR1_Bits'Address use GPIOR1_Addr;
   pragma Volatile (GPIOR1_Bits);
   --  General Purpose I/O Register 1 bit 0
   GPIOR10_Bit              : constant Bit_Number := 0;
   GPIOR10_Mask             : constant Unsigned_8 := 16#01#;
   --  General Purpose I/O Register 1 bit 1
   GPIOR11_Bit              : constant Bit_Number := 1;
   GPIOR11_Mask             : constant Unsigned_8 := 16#02#;
   --  General Purpose I/O Register 1 bit 2
   GPIOR12_Bit              : constant Bit_Number := 2;
   GPIOR12_Mask             : constant Unsigned_8 := 16#04#;
   --  General Purpose I/O Register 1 bit 3
   GPIOR13_Bit              : constant Bit_Number := 3;
   GPIOR13_Mask             : constant Unsigned_8 := 16#08#;
   --  General Purpose I/O Register 1 bit 4
   GPIOR14_Bit              : constant Bit_Number := 4;
   GPIOR14_Mask             : constant Unsigned_8 := 16#10#;
   --  General Purpose I/O Register 1 bit 5
   GPIOR15_Bit              : constant Bit_Number := 5;
   GPIOR15_Mask             : constant Unsigned_8 := 16#20#;
   --  General Purpose I/O Register 1 bit 6
   GPIOR16_Bit              : constant Bit_Number := 6;
   GPIOR16_Mask             : constant Unsigned_8 := 16#40#;
   --  General Purpose I/O Register 1 bit 7
   GPIOR17_Bit              : constant Bit_Number := 7;
   GPIOR17_Mask             : constant Unsigned_8 := 16#80#;

   --  General Purpose I/O Register 0
   GPIOR0_Addr              : constant Address    := 16#33#;
   GPIOR0                   : Unsigned_8 ;
   for GPIOR0'Address use GPIOR0_Addr;
   pragma Volatile (GPIOR0);
   GPIOR0_Bits              : Bits_In_Byte;
   for GPIOR0_Bits'Address use GPIOR0_Addr;
   pragma Volatile (GPIOR0_Bits);
   --  General Purpose I/O Register 0 bit 0
   GPIOR00_Bit              : constant Bit_Number := 0;
   GPIOR00_Mask             : constant Unsigned_8 := 16#01#;
   --  General Purpose I/O Register 0 bit 1
   GPIOR01_Bit              : constant Bit_Number := 1;
   GPIOR01_Mask             : constant Unsigned_8 := 16#02#;
   --  General Purpose I/O Register 0 bit 2
   GPIOR02_Bit              : constant Bit_Number := 2;
   GPIOR02_Mask             : constant Unsigned_8 := 16#04#;
   --  General Purpose I/O Register 0 bit 3
   GPIOR03_Bit              : constant Bit_Number := 3;
   GPIOR03_Mask             : constant Unsigned_8 := 16#08#;
   --  General Purpose I/O Register 0 bit 4
   GPIOR04_Bit              : constant Bit_Number := 4;
   GPIOR04_Mask             : constant Unsigned_8 := 16#10#;
   --  General Purpose I/O Register 0 bit 5
   GPIOR05_Bit              : constant Bit_Number := 5;
   GPIOR05_Mask             : constant Unsigned_8 := 16#20#;
   --  General Purpose I/O Register 0 bit 6
   GPIOR06_Bit              : constant Bit_Number := 6;
   GPIOR06_Mask             : constant Unsigned_8 := 16#40#;
   --  General Purpose I/O Register 0 bit 7
   GPIOR07_Bit              : constant Bit_Number := 7;
   GPIOR07_Mask             : constant Unsigned_8 := 16#80#;

   --  Data Register, Port D
   PORTD_Addr               : constant Address    := 16#32#;
   PORTD                    : Unsigned_8 ;
   for PORTD'Address use PORTD_Addr;
   pragma Volatile (PORTD);
   PORTD_Bits               : Bits_In_Byte;
   for PORTD_Bits'Address use PORTD_Addr;
   pragma Volatile (PORTD_Bits);
   PORTD0_Bit               : constant Bit_Number := 0;
   PORTD0_Mask              : constant Unsigned_8 := 16#01#;
   PORTD1_Bit               : constant Bit_Number := 1;
   PORTD1_Mask              : constant Unsigned_8 := 16#02#;
   PORTD2_Bit               : constant Bit_Number := 2;
   PORTD2_Mask              : constant Unsigned_8 := 16#04#;
   PORTD3_Bit               : constant Bit_Number := 3;
   PORTD3_Mask              : constant Unsigned_8 := 16#08#;
   PORTD4_Bit               : constant Bit_Number := 4;
   PORTD4_Mask              : constant Unsigned_8 := 16#10#;
   PORTD5_Bit               : constant Bit_Number := 5;
   PORTD5_Mask              : constant Unsigned_8 := 16#20#;
   PORTD6_Bit               : constant Bit_Number := 6;
   PORTD6_Mask              : constant Unsigned_8 := 16#40#;

   --  Data Direction Register, Port D
   DDRD_Addr                : constant Address    := 16#31#;
   DDRD                     : Unsigned_8 ;
   for DDRD'Address use DDRD_Addr;
   pragma Volatile (DDRD);
   DDRD_Bits                : Bits_In_Byte;
   for DDRD_Bits'Address use DDRD_Addr;
   pragma Volatile (DDRD_Bits);
   DDD0_Bit                 : constant Bit_Number := 0;
   DDD0_Mask                : constant Unsigned_8 := 16#01#;
   DDD1_Bit                 : constant Bit_Number := 1;
   DDD1_Mask                : constant Unsigned_8 := 16#02#;
   DDD2_Bit                 : constant Bit_Number := 2;
   DDD2_Mask                : constant Unsigned_8 := 16#04#;
   DDD3_Bit                 : constant Bit_Number := 3;
   DDD3_Mask                : constant Unsigned_8 := 16#08#;
   DDD4_Bit                 : constant Bit_Number := 4;
   DDD4_Mask                : constant Unsigned_8 := 16#10#;
   DDD5_Bit                 : constant Bit_Number := 5;
   DDD5_Mask                : constant Unsigned_8 := 16#20#;
   DDD6_Bit                 : constant Bit_Number := 6;
   DDD6_Mask                : constant Unsigned_8 := 16#40#;

   --  Input Pins, Port D
   PIND_Addr                : constant Address    := 16#30#;
   PIND                     : Unsigned_8 ;
   for PIND'Address use PIND_Addr;
   pragma Volatile (PIND);
   PIND_Bits                : Bits_In_Byte;
   for PIND_Bits'Address use PIND_Addr;
   pragma Volatile (PIND_Bits);
   PIND0_Bit                : constant Bit_Number := 0;
   PIND0_Mask               : constant Unsigned_8 := 16#01#;
   PIND1_Bit                : constant Bit_Number := 1;
   PIND1_Mask               : constant Unsigned_8 := 16#02#;
   PIND2_Bit                : constant Bit_Number := 2;
   PIND2_Mask               : constant Unsigned_8 := 16#04#;
   PIND3_Bit                : constant Bit_Number := 3;
   PIND3_Mask               : constant Unsigned_8 := 16#08#;
   PIND4_Bit                : constant Bit_Number := 4;
   PIND4_Mask               : constant Unsigned_8 := 16#10#;
   PIND5_Bit                : constant Bit_Number := 5;
   PIND5_Mask               : constant Unsigned_8 := 16#20#;
   PIND6_Bit                : constant Bit_Number := 6;
   PIND6_Mask               : constant Unsigned_8 := 16#40#;

   --  USI Data Register
   USIDR_Addr               : constant Address    := 16#2f#;
   USIDR                    : Unsigned_8 ;
   for USIDR'Address use USIDR_Addr;
   pragma Volatile (USIDR);
   USIDR_Bits               : Bits_In_Byte;
   for USIDR_Bits'Address use USIDR_Addr;
   pragma Volatile (USIDR_Bits);
   --  USI Data Register bit 0
   USIDR0_Bit               : constant Bit_Number := 0;
   USIDR0_Mask              : constant Unsigned_8 := 16#01#;
   --  USI Data Register bit 1
   USIDR1_Bit               : constant Bit_Number := 1;
   USIDR1_Mask              : constant Unsigned_8 := 16#02#;
   --  USI Data Register bit 2
   USIDR2_Bit               : constant Bit_Number := 2;
   USIDR2_Mask              : constant Unsigned_8 := 16#04#;
   --  USI Data Register bit 3
   USIDR3_Bit               : constant Bit_Number := 3;
   USIDR3_Mask              : constant Unsigned_8 := 16#08#;
   --  USI Data Register bit 4
   USIDR4_Bit               : constant Bit_Number := 4;
   USIDR4_Mask              : constant Unsigned_8 := 16#10#;
   --  USI Data Register bit 5
   USIDR5_Bit               : constant Bit_Number := 5;
   USIDR5_Mask              : constant Unsigned_8 := 16#20#;
   --  USI Data Register bit 6
   USIDR6_Bit               : constant Bit_Number := 6;
   USIDR6_Mask              : constant Unsigned_8 := 16#40#;
   --  USI Data Register bit 7
   USIDR7_Bit               : constant Bit_Number := 7;
   USIDR7_Mask              : constant Unsigned_8 := 16#80#;

   --  USI Status Register
   USISR_Addr               : constant Address    := 16#2e#;
   USISR                    : Unsigned_8 ;
   for USISR'Address use USISR_Addr;
   pragma Volatile (USISR);
   USISR_Bits               : Bits_In_Byte;
   for USISR_Bits'Address use USISR_Addr;
   pragma Volatile (USISR_Bits);
   --  USI Counter Value Bit 0
   USICNT0_Bit              : constant Bit_Number := 0;
   USICNT0_Mask             : constant Unsigned_8 := 16#01#;
   --  USI Counter Value Bit 1
   USICNT1_Bit              : constant Bit_Number := 1;
   USICNT1_Mask             : constant Unsigned_8 := 16#02#;
   --  USI Counter Value Bit 2
   USICNT2_Bit              : constant Bit_Number := 2;
   USICNT2_Mask             : constant Unsigned_8 := 16#04#;
   --  USI Counter Value Bit 3
   USICNT3_Bit              : constant Bit_Number := 3;
   USICNT3_Mask             : constant Unsigned_8 := 16#08#;
   --  Data Output Collision
   USIDC_Bit                : constant Bit_Number := 4;
   USIDC_Mask               : constant Unsigned_8 := 16#10#;
   --  Stop Condition Flag
   USIPF_Bit                : constant Bit_Number := 5;
   USIPF_Mask               : constant Unsigned_8 := 16#20#;
   --  Counter Overflow Interrupt Flag
   USIOIF_Bit               : constant Bit_Number := 6;
   USIOIF_Mask              : constant Unsigned_8 := 16#40#;
   --  Start Condition Interrupt Flag
   USISIF_Bit               : constant Bit_Number := 7;
   USISIF_Mask              : constant Unsigned_8 := 16#80#;

   --  USI Control Register
   USICR_Addr               : constant Address    := 16#2d#;
   USICR                    : Unsigned_8 ;
   for USICR'Address use USICR_Addr;
   pragma Volatile (USICR);
   USICR_Bits               : Bits_In_Byte;
   for USICR_Bits'Address use USICR_Addr;
   pragma Volatile (USICR_Bits);
   --  Toggle Clock Port Pin
   USITC_Bit                : constant Bit_Number := 0;
   USITC_Mask               : constant Unsigned_8 := 16#01#;
   --  Clock Strobe
   USICLK_Bit               : constant Bit_Number := 1;
   USICLK_Mask              : constant Unsigned_8 := 16#02#;
   --  USI Clock Source Select Bit 0
   USICS0_Bit               : constant Bit_Number := 2;
   USICS0_Mask              : constant Unsigned_8 := 16#04#;
   --  USI Clock Source Select Bit 1
   USICS1_Bit               : constant Bit_Number := 3;
   USICS1_Mask              : constant Unsigned_8 := 16#08#;
   --  USI Wire Mode Bit 0
   USIWM0_Bit               : constant Bit_Number := 4;
   USIWM0_Mask              : constant Unsigned_8 := 16#10#;
   --  USI Wire Mode Bit 1
   USIWM1_Bit               : constant Bit_Number := 5;
   USIWM1_Mask              : constant Unsigned_8 := 16#20#;
   --  Counter Overflow Interrupt Enable
   USIOIE_Bit               : constant Bit_Number := 6;
   USIOIE_Mask              : constant Unsigned_8 := 16#40#;
   --  Start Condition Interrupt Enable
   USISIE_Bit               : constant Bit_Number := 7;
   USISIE_Mask              : constant Unsigned_8 := 16#80#;

   --  USART I/O Data Register
   UDR_Addr                 : constant Address    := 16#2c#;
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

   --  USART Control and Status Register A
   UCSRA_Addr               : constant Address    := 16#2b#;
   UCSRA                    : Unsigned_8 ;
   for UCSRA'Address use UCSRA_Addr;
   pragma Volatile (UCSRA);
   UCSRA_Bits               : Bits_In_Byte;
   for UCSRA_Bits'Address use UCSRA_Addr;
   pragma Volatile (UCSRA_Bits);
   --  Multi-processor Communication Mode
   MPCM_Bit                 : constant Bit_Number := 0;
   MPCM_Mask                : constant Unsigned_8 := 16#01#;
   --  Double the USART Transmission Speed
   U2X_Bit                  : constant Bit_Number := 1;
   U2X_Mask                 : constant Unsigned_8 := 16#02#;
   --  USART Parity Error
   UPE_Bit                  : constant Bit_Number := 2;
   UPE_Mask                 : constant Unsigned_8 := 16#04#;
   --  Data overRun
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

   --  USART Control and Status Register B
   UCSRB_Addr               : constant Address    := 16#2a#;
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
   --  USART Data register Empty Interrupt Enable
   UDRIE_Bit                : constant Bit_Number := 5;
   UDRIE_Mask               : constant Unsigned_8 := 16#20#;
   --  TX Complete Interrupt Enable
   TXCIE_Bit                : constant Bit_Number := 6;
   TXCIE_Mask               : constant Unsigned_8 := 16#40#;
   --  RX Complete Interrupt Enable
   RXCIE_Bit                : constant Bit_Number := 7;
   RXCIE_Mask               : constant Unsigned_8 := 16#80#;

   --  USART Baud Rate Register Low Byte
   UBRRL_Addr               : constant Address    := 16#29#;
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

   --  Analog Comparator Control And Status Register
   ACSR_Addr                : constant Address    := 16#28#;
   ACSR                     : Unsigned_8 ;
   for ACSR'Address use ACSR_Addr;
   pragma Volatile (ACSR);
   ACSR_Bits                : Bits_In_Byte;
   for ACSR_Bits'Address use ACSR_Addr;
   pragma Volatile (ACSR_Bits);
   --  Analog Comparator Interrupt Mode Select bit 0
   ACIS0_Bit                : constant Bit_Number := 0;
   ACIS0_Mask               : constant Unsigned_8 := 16#01#;
   --  Analog Comparator Interrupt Mode Select bit 1
   ACIS1_Bit                : constant Bit_Number := 1;
   ACIS1_Mask               : constant Unsigned_8 := 16#02#;
   ACIC_Bit                 : constant Bit_Number := 2;
   ACIC_Mask                : constant Unsigned_8 := 16#04#;
   --  Analog Comparator Interrupt Enable
   ACIE_Bit                 : constant Bit_Number := 3;
   ACIE_Mask                : constant Unsigned_8 := 16#08#;
   --  Analog Comparator Interrupt Flag
   ACI_Bit                  : constant Bit_Number := 4;
   ACI_Mask                 : constant Unsigned_8 := 16#10#;
   --  Analog Compare Output
   ACO_Bit                  : constant Bit_Number := 5;
   ACO_Mask                 : constant Unsigned_8 := 16#20#;
   --  Analog Comparator Bandgap Select
   ACBG_Bit                 : constant Bit_Number := 6;
   ACBG_Mask                : constant Unsigned_8 := 16#40#;
   --  Analog Comparator Disable
   ACD_Bit                  : constant Bit_Number := 7;
   ACD_Mask                 : constant Unsigned_8 := 16#80#;

   --  BOD control register
   BODCR_Addr               : constant Address    := 16#27#;
   BODCR                    : Unsigned_8 ;
   for BODCR'Address use BODCR_Addr;
   pragma Volatile (BODCR);
   BODCR_Bits               : Bits_In_Byte;
   for BODCR_Bits'Address use BODCR_Addr;
   pragma Volatile (BODCR_Bits);
   BPDSE_Bit                : constant Bit_Number := 0;
   BPDSE_Mask               : constant Unsigned_8 := 16#01#;
   BPDS_Bit                 : constant Bit_Number := 1;
   BPDS_Mask                : constant Unsigned_8 := 16#02#;

   --  Power reduction register
   PRR_Addr                 : constant Address    := 16#26#;
   PRR                      : Unsigned_8 ;
   for PRR'Address use PRR_Addr;
   pragma Volatile (PRR);
   PRR_Bits                 : Bits_In_Byte;
   for PRR_Bits'Address use PRR_Addr;
   pragma Volatile (PRR_Bits);
   PRUSART_Bit              : constant Bit_Number := 0;
   PRUSART_Mask             : constant Unsigned_8 := 16#01#;
   PRUSI_Bit                : constant Bit_Number := 1;
   PRUSI_Mask               : constant Unsigned_8 := 16#02#;
   PRTIM0_Bit               : constant Bit_Number := 2;
   PRTIM0_Mask              : constant Unsigned_8 := 16#04#;
   PRTIM1_Bit               : constant Bit_Number := 3;
   PRTIM1_Mask              : constant Unsigned_8 := 16#08#;

   --  Pin Change Interrupt Mask Register 2
   PCMSK2_Addr              : constant Address    := 16#25#;
   PCMSK2                   : Unsigned_8 ;
   for PCMSK2'Address use PCMSK2_Addr;
   pragma Volatile (PCMSK2);
   PCMSK2_Bits              : Bits_In_Byte;
   for PCMSK2_Bits'Address use PCMSK2_Addr;
   pragma Volatile (PCMSK2_Bits);
   --  Pin Change Interrupt Mask 11
   PCINT11_Bit              : constant Bit_Number := 0;
   PCINT11_Mask             : constant Unsigned_8 := 16#01#;
   --  Pin Change Interrupt Mask 12
   PCINT12_Bit              : constant Bit_Number := 1;
   PCINT12_Mask             : constant Unsigned_8 := 16#02#;
   --  Pin Change Interrupt Mask 13
   PCINT13_Bit              : constant Bit_Number := 2;
   PCINT13_Mask             : constant Unsigned_8 := 16#04#;
   --  Pin Change Interrupt Mask 14
   PCINT14_Bit              : constant Bit_Number := 3;
   PCINT14_Mask             : constant Unsigned_8 := 16#08#;
   --  Pin Change Interrupt Mask 15
   PCINT15_Bit              : constant Bit_Number := 4;
   PCINT15_Mask             : constant Unsigned_8 := 16#10#;
   --  Pin Change Interrupt Mask 16
   PCINT16_Bit              : constant Bit_Number := 5;
   PCINT16_Mask             : constant Unsigned_8 := 16#20#;
   --  Pin Change Interrupt Mask 17
   PCINT17_Bit              : constant Bit_Number := 6;
   PCINT17_Mask             : constant Unsigned_8 := 16#40#;

   --  Pin Change Interrupt Mask Register 1
   PCMSK1_Addr              : constant Address    := 16#24#;
   PCMSK1                   : Unsigned_8 ;
   for PCMSK1'Address use PCMSK1_Addr;
   pragma Volatile (PCMSK1);
   PCMSK1_Bits              : Bits_In_Byte;
   for PCMSK1_Bits'Address use PCMSK1_Addr;
   pragma Volatile (PCMSK1_Bits);
   --  Pin Change Interrupt Mask 8
   PCINT8_Bit               : constant Bit_Number := 0;
   PCINT8_Mask              : constant Unsigned_8 := 16#01#;
   --  Pin Change Interrupt Mask 9
   PCINT9_Bit               : constant Bit_Number := 1;
   PCINT9_Mask              : constant Unsigned_8 := 16#02#;
   --  Pin Change Interrupt Mask 10
   PCINT10_Bit              : constant Bit_Number := 2;
   PCINT10_Mask             : constant Unsigned_8 := 16#04#;

   --  USART Control and Status Register C
   UCSRC_Addr               : constant Address    := 16#23#;
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
   UMSEL_Bit                : constant Bit_Number := 6;
   UMSEL_Mask               : constant Unsigned_8 := 16#40#;

   --  USART Baud Rate Register High Byte
   UBRRH_Addr               : constant Address    := 16#22#;
   UBRRH                    : Unsigned_8 ;
   for UBRRH'Address use UBRRH_Addr;
   pragma Volatile (UBRRH);
   UBRRH_Bits               : Bits_In_Byte;
   for UBRRH_Bits'Address use UBRRH_Addr;
   pragma Volatile (UBRRH_Bits);
   --  USART Baud Rate Register bit 8
   UBRR8_Bit                : constant Bit_Number := 0;
   UBRR8_Mask               : constant Unsigned_8 := 16#01#;
   --  USART Baud Rate Register bit 9
   UBRR9_Bit                : constant Bit_Number := 1;
   UBRR9_Mask               : constant Unsigned_8 := 16#02#;
   --  USART Baud Rate Register bit 10
   UBRR10_Bit               : constant Bit_Number := 2;
   UBRR10_Mask              : constant Unsigned_8 := 16#04#;
   --  USART Baud Rate Register bit 11
   UBRR11_Bit               : constant Bit_Number := 3;
   UBRR11_Mask              : constant Unsigned_8 := 16#08#;

   --  Digital Input Disable Register 1
   DIDR_Addr                : constant Address    := 16#21#;
   DIDR                     : Unsigned_8 ;
   for DIDR'Address use DIDR_Addr;
   pragma Volatile (DIDR);
   DIDR_Bits                : Bits_In_Byte;
   for DIDR_Bits'Address use DIDR_Addr;
   pragma Volatile (DIDR_Bits);
   --  AIN0 Digital Input Disable
   AIN0D_Bit                : constant Bit_Number := 0;
   AIN0D_Mask               : constant Unsigned_8 := 16#01#;
   --  AIN1 Digital Input Disable
   AIN1D_Bit                : constant Bit_Number := 1;
   AIN1D_Mask               : constant Unsigned_8 := 16#02#;



   --
   --  available assembler instructions
   --
   --  type to designate the instruction core of the devices.  See
   --  the help file of Atmel's "AVR Assembler 2".
   type Instruction_Core_Type is (V0, V0E, V1, V2, V2E, V3);
   Instruction_Core  : constant Instruction_Core_Type := V2;
   Have_lpm_rd_Zplus : constant Boolean               := True;
   EEprom_8bit_Addr  : constant Boolean               :=
     (EEprom_Size <= 16#0100#);


end AVR.ATtiny4313;
