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

package AVR.AT90S4434 is
   pragma Preelaborate;

   CVS_Version : constant String := "$Id: avr-at90s4434.ads 881 2008-11-16 22:55:31Z Rolf_Ebert $";


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
   Number_Of_Interrupts     : constant := 17;

   --  External Reset, Power-on Reset and Watchdog Reset
   Sig_RESET                : constant        :=  0;
   Sig_RESET_String         : constant String := "__vector_0";
   --  External Interrupt 0
   Sig_INT0                 : constant        :=  1;
   Sig_INT0_String          : constant String := "__vector_1";
   --  External Interrupt 1
   Sig_INT1                 : constant        :=  2;
   Sig_INT1_String          : constant String := "__vector_2";
   --  Timer/Counter2 Compare Match
   Sig_TIMER2_COMP          : constant        :=  3;
   Sig_TIMER2_COMP_String   : constant String := "__vector_3";
   --  Timer/Counter2 Overflow
   Sig_TIMER2_OVF           : constant        :=  4;
   Sig_TIMER2_OVF_String    : constant String := "__vector_4";
   --  Timer/Counter1 Capture Event
   Sig_TIMER1_CAPT          : constant        :=  5;
   Sig_TIMER1_CAPT_String   : constant String := "__vector_5";
   --  Timer/Counter1 Compare Match A
   Sig_TIMER1_COMPA         : constant        :=  6;
   Sig_TIMER1_COMPA_String  : constant String := "__vector_6";
   --  Timer/Counter1 Compare Match B
   Sig_TIMER1_COMPB         : constant        :=  7;
   Sig_TIMER1_COMPB_String  : constant String := "__vector_7";
   --  Timer/Counter1 Overflow
   Sig_TIMER1_OVF           : constant        :=  8;
   Sig_TIMER1_OVF_String    : constant String := "__vector_8";
   --  Timer/Counter0 Overflow
   Sig_TIMER0_OVF           : constant        :=  9;
   Sig_TIMER0_OVF_String    : constant String := "__vector_9";
   --  SPI Serial Transfer Complete
   Sig_SPI_STC              : constant        := 10;
   Sig_SPI_STC_String       : constant String := "__vector_10";
   --  UART, RX Complete
   Sig_UART_RX              : constant        := 11;
   Sig_UART_RX_String       : constant String := "__vector_11";
   --  UART Data Register Empty
   Sig_UART_UDRE            : constant        := 12;
   Sig_UART_UDRE_String     : constant String := "__vector_12";
   --  UART, TX Complete
   Sig_UART_TX              : constant        := 13;
   Sig_UART_TX_String       : constant String := "__vector_13";
   --  ADC Conversion Complete
   Sig_ADC                  : constant        := 14;
   Sig_ADC_String           : constant String := "__vector_14";
   --  EEPROM Ready
   Sig_EE_RDY               : constant        := 15;
   Sig_EE_RDY_String        : constant String := "__vector_15";
   --  Analog Comparator
   Sig_ANA_COMP             : constant        := 16;
   Sig_ANA_COMP_String      : constant String := "__vector_16";


   --
   --  I/O registers
   --

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

   --  General Interrupt Mask Register
   GIMSK_Addr               : constant Address    := 16#5b#;
   GIMSK                    : Unsigned_8 ;
   for GIMSK'Address use GIMSK_Addr;
   pragma Volatile (GIMSK);
   GIMSK_Bits               : Bits_In_Byte;
   for GIMSK_Bits'Address use GIMSK_Addr;
   pragma Volatile (GIMSK_Bits);
   --  External Interrupt Request 0 Enable
   INT0_Bit                 : constant Bit_Number := 6;
   INT0_Mask                : constant Unsigned_8 := 16#40#;
   --  External Interrupt Request 1 Enable
   INT1_Bit                 : constant Bit_Number := 7;
   INT1_Mask                : constant Unsigned_8 := 16#80#;

   --  General Interrupt Flag register
   GIFR_Addr                : constant Address    := 16#5a#;
   GIFR                     : Unsigned_8 ;
   for GIFR'Address use GIFR_Addr;
   pragma Volatile (GIFR);
   GIFR_Bits                : Bits_In_Byte;
   for GIFR_Bits'Address use GIFR_Addr;
   pragma Volatile (GIFR_Bits);
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
   --  Timer/Counter0 Overflow Interrupt Enable
   TOIE0_Bit                : constant Bit_Number := 0;
   TOIE0_Mask               : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Overflow Interrupt Enable
   TOIE1_Bit                : constant Bit_Number := 2;
   TOIE1_Mask               : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Output CompareB Match Interrupt Enable
   OCIE1B_Bit               : constant Bit_Number := 3;
   OCIE1B_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter1 Output CompareA Match Interrupt Enable
   OCIE1A_Bit               : constant Bit_Number := 4;
   OCIE1A_Mask              : constant Unsigned_8 := 16#10#;
   --  Timer/Counter1 Input Capture Interrupt Enable
   TICIE1_Bit               : constant Bit_Number := 5;
   TICIE1_Mask              : constant Unsigned_8 := 16#20#;
   --  Timer/Counter2 Overflow Interrupt Enable
   TOIE2_Bit                : constant Bit_Number := 6;
   TOIE2_Mask               : constant Unsigned_8 := 16#40#;
   --  Timer/Counter2 Output Compare Match Interrupt Enable
   OCIE2_Bit                : constant Bit_Number := 7;
   OCIE2_Mask               : constant Unsigned_8 := 16#80#;

   --  Timer/Counter Interrupt Flag register
   TIFR_Addr                : constant Address    := 16#58#;
   TIFR                     : Unsigned_8 ;
   for TIFR'Address use TIFR_Addr;
   pragma Volatile (TIFR);
   TIFR_Bits                : Bits_In_Byte;
   for TIFR_Bits'Address use TIFR_Addr;
   pragma Volatile (TIFR_Bits);
   --  Timer/Counter0 Overflow Flag
   TOV0_Bit                 : constant Bit_Number := 0;
   TOV0_Mask                : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Overflow Flag
   TOV1_Bit                 : constant Bit_Number := 2;
   TOV1_Mask                : constant Unsigned_8 := 16#04#;
   --  Output Compare Flag 1B
   OCF1B_Bit                : constant Bit_Number := 3;
   OCF1B_Mask               : constant Unsigned_8 := 16#08#;
   --  Output Compare Flag 1A
   OCF1A_Bit                : constant Bit_Number := 4;
   OCF1A_Mask               : constant Unsigned_8 := 16#10#;
   --  Input Capture Flag 1
   ICF1_Bit                 : constant Bit_Number := 5;
   ICF1_Mask                : constant Unsigned_8 := 16#20#;
   --  Timer/Counter2 Overflow Flag
   TOV2_Bit                 : constant Bit_Number := 6;
   TOV2_Mask                : constant Unsigned_8 := 16#40#;
   --  Output Compare Flag 2
   OCF2_Bit                 : constant Bit_Number := 7;
   OCF2_Mask                : constant Unsigned_8 := 16#80#;

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
   --  Sleep Mode Select 0
   SM0_Bit                  : constant Bit_Number := 4;
   SM0_Mask                 : constant Unsigned_8 := 16#10#;
   --  Sleep Mode Select 1
   SM1_Bit                  : constant Bit_Number := 5;
   SM1_Mask                 : constant Unsigned_8 := 16#20#;
   --  Sleep Enable
   SE_Bit                   : constant Bit_Number := 6;
   SE_Mask                  : constant Unsigned_8 := 16#40#;

   MCUSR_Addr               : constant Address    := 16#54#;
   MCUSR                    : Unsigned_8 ;
   for MCUSR'Address use MCUSR_Addr;
   pragma Volatile (MCUSR);
   MCUSR_Bits               : Bits_In_Byte;
   for MCUSR_Bits'Address use MCUSR_Addr;
   pragma Volatile (MCUSR_Bits);
   --  Power-on Reset Flag
   PORF_Bit                 : constant Bit_Number := 0;
   PORF_Mask                : constant Unsigned_8 := 16#01#;
   --  External Reset Flag
   EXTRF_Bit                : constant Bit_Number := 1;
   EXTRF_Mask               : constant Unsigned_8 := 16#02#;

   --  Timer/Counter0 Control Register
   TCCR0_Addr               : constant Address    := 16#53#;
   TCCR0                    : Unsigned_8 ;
   for TCCR0'Address use TCCR0_Addr;
   pragma Volatile (TCCR0);
   TCCR0_Bits               : Bits_In_Byte;
   for TCCR0_Bits'Address use TCCR0_Addr;
   pragma Volatile (TCCR0_Bits);
   --  Clock Select0 bit 0
   CS00_Bit                 : constant Bit_Number := 0;
   CS00_Mask                : constant Unsigned_8 := 16#01#;
   --  Clock Select0 bit 1
   CS01_Bit                 : constant Bit_Number := 1;
   CS01_Mask                : constant Unsigned_8 := 16#02#;
   --  Clock Select0 bit 2
   CS02_Bit                 : constant Bit_Number := 2;
   CS02_Mask                : constant Unsigned_8 := 16#04#;

   --  Timer Counter 0
   TCNT0_Addr               : constant Address    := 16#52#;
   TCNT0                    : Unsigned_8 ;
   for TCNT0'Address use TCNT0_Addr;
   pragma Volatile (TCNT0);
   TCNT0_Bits               : Bits_In_Byte;
   for TCNT0_Bits'Address use TCNT0_Addr;
   pragma Volatile (TCNT0_Bits);
   --  Timer Counter 0 bit 0
   TCNT00_Bit               : constant Bit_Number := 0;
   TCNT00_Mask              : constant Unsigned_8 := 16#01#;
   --  Timer Counter 0 bit 1
   TCNT01_Bit               : constant Bit_Number := 1;
   TCNT01_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer Counter 0 bit 2
   TCNT02_Bit               : constant Bit_Number := 2;
   TCNT02_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer Counter 0 bit 3
   TCNT03_Bit               : constant Bit_Number := 3;
   TCNT03_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer Counter 0 bit 4
   TCNT04_Bit               : constant Bit_Number := 4;
   TCNT04_Mask              : constant Unsigned_8 := 16#10#;
   --  Timer Counter 0 bit 5
   TCNT05_Bit               : constant Bit_Number := 5;
   TCNT05_Mask              : constant Unsigned_8 := 16#20#;
   --  Timer Counter 0 bit 6
   TCNT06_Bit               : constant Bit_Number := 6;
   TCNT06_Mask              : constant Unsigned_8 := 16#40#;
   --  Timer Counter 0 bit 7
   TCNT07_Bit               : constant Bit_Number := 7;
   TCNT07_Mask              : constant Unsigned_8 := 16#80#;

   --  Timer/Counter1 Control Register A
   TCCR1A_Addr              : constant Address    := 16#4f#;
   TCCR1A                   : Unsigned_8 ;
   for TCCR1A'Address use TCCR1A_Addr;
   pragma Volatile (TCCR1A);
   TCCR1A_Bits              : Bits_In_Byte;
   for TCCR1A_Bits'Address use TCCR1A_Addr;
   pragma Volatile (TCCR1A_Bits);
   --  Pulse Width Modulator Select Bit 0
   PWM10_Bit                : constant Bit_Number := 0;
   PWM10_Mask               : constant Unsigned_8 := 16#01#;
   --  Pulse Width Modulator Select Bit 1
   PWM11_Bit                : constant Bit_Number := 1;
   PWM11_Mask               : constant Unsigned_8 := 16#02#;
   --  Compare Output Mode 1B, bit 0
   COM1B0_Bit               : constant Bit_Number := 4;
   COM1B0_Mask              : constant Unsigned_8 := 16#10#;
   --  Compare Output Mode 1B, bit 1
   COM1B1_Bit               : constant Bit_Number := 5;
   COM1B1_Mask              : constant Unsigned_8 := 16#20#;
   --  Compare Ouput Mode 1A, bit 0
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
   --  Clock Select1 bit 0
   CS10_Bit                 : constant Bit_Number := 0;
   CS10_Mask                : constant Unsigned_8 := 16#01#;
   --  Clock Select1 bit 1
   CS11_Bit                 : constant Bit_Number := 1;
   CS11_Mask                : constant Unsigned_8 := 16#02#;
   --  Clock Select1 bit 2
   CS12_Bit                 : constant Bit_Number := 2;
   CS12_Mask                : constant Unsigned_8 := 16#04#;
   --  Clear Timer/Counter1 on Compare Match
   CTC1_Bit                 : constant Bit_Number := 3;
   CTC1_Mask                : constant Unsigned_8 := 16#08#;
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

   --  Timer/Counter1 Output Compare Register Low Byte
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

   --  Timer/Counter1 Output Compare Register High Byte
   OCR1BH_Addr              : constant Address    := 16#49#;
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

   --  Timer/Counter1 Input Capture Register High Byte
   ICR1H_Addr               : constant Address    := 16#47#;
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
   ICR1L_Addr               : constant Address    := 16#46#;
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

   --  Timer/Counter Control Register
   TCCR2_Addr               : constant Address    := 16#45#;
   TCCR2                    : Unsigned_8 ;
   for TCCR2'Address use TCCR2_Addr;
   pragma Volatile (TCCR2);
   TCCR2_Bits               : Bits_In_Byte;
   for TCCR2_Bits'Address use TCCR2_Addr;
   pragma Volatile (TCCR2_Bits);
   --  Clock Select
   CS20_Bit                 : constant Bit_Number := 0;
   CS20_Mask                : constant Unsigned_8 := 16#01#;
   --  Clock Select
   CS21_Bit                 : constant Bit_Number := 1;
   CS21_Mask                : constant Unsigned_8 := 16#02#;
   --  Clock Select
   CS22_Bit                 : constant Bit_Number := 2;
   CS22_Mask                : constant Unsigned_8 := 16#04#;
   --  Clear Timer/Counter Compare Match
   CTC2_Bit                 : constant Bit_Number := 3;
   CTC2_Mask                : constant Unsigned_8 := 16#08#;
   --  Compare Match Output Mode
   COM20_Bit                : constant Bit_Number := 4;
   COM20_Mask               : constant Unsigned_8 := 16#10#;
   --  Compare Match Output Mode
   COM21_Bit                : constant Bit_Number := 5;
   COM21_Mask               : constant Unsigned_8 := 16#20#;
   --  Pulse Width Modulator Enable
   PWM2_Bit                 : constant Bit_Number := 6;
   PWM2_Mask                : constant Unsigned_8 := 16#40#;

   --  Timer/Counter Register
   TCNT2_Addr               : constant Address    := 16#44#;
   TCNT2                    : Unsigned_8 ;
   for TCNT2'Address use TCNT2_Addr;
   pragma Volatile (TCNT2);
   TCNT2_Bits               : Bits_In_Byte;
   for TCNT2_Bits'Address use TCNT2_Addr;
   pragma Volatile (TCNT2_Bits);
   --  Timer/Counter Register Bit 0
   TCNT2_0_Bit              : constant Bit_Number := 0;
   TCNT2_0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter Register Bit 1
   TCNT2_1_Bit              : constant Bit_Number := 1;
   TCNT2_1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter Register Bit 2
   TCNT2_2_Bit              : constant Bit_Number := 2;
   TCNT2_2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter Register Bit 3
   TCNT2_3_Bit              : constant Bit_Number := 3;
   TCNT2_3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter Register Bit 4
   TCNT2_4_Bit              : constant Bit_Number := 4;
   TCNT2_4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter Register Bit 5
   TCNT2_5_Bit              : constant Bit_Number := 5;
   TCNT2_5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter Register Bit 6
   TCNT2_6_Bit              : constant Bit_Number := 6;
   TCNT2_6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter Register Bit 7
   TCNT2_7_Bit              : constant Bit_Number := 7;
   TCNT2_7_Mask             : constant Unsigned_8 := 16#80#;

   --  Output Compare Register
   OCR2_Addr                : constant Address    := 16#43#;
   OCR2                     : Unsigned_8 ;
   for OCR2'Address use OCR2_Addr;
   pragma Volatile (OCR2);
   OCR2_Bits                : Bits_In_Byte;
   for OCR2_Bits'Address use OCR2_Addr;
   pragma Volatile (OCR2_Bits);
   --  Output Compare Register Bit 0
   OCR2_0_Bit               : constant Bit_Number := 0;
   OCR2_0_Mask              : constant Unsigned_8 := 16#01#;
   --  Output Compare Register Bit 1
   OCR2_1_Bit               : constant Bit_Number := 1;
   OCR2_1_Mask              : constant Unsigned_8 := 16#02#;
   --  Output Compare Register Bit 2
   OCR2_2_Bit               : constant Bit_Number := 2;
   OCR2_2_Mask              : constant Unsigned_8 := 16#04#;
   --  Output Compare Register Bit 3
   OCR2_3_Bit               : constant Bit_Number := 3;
   OCR2_3_Mask              : constant Unsigned_8 := 16#08#;
   --  Output Compare Register Bit 4
   OCR2_4_Bit               : constant Bit_Number := 4;
   OCR2_4_Mask              : constant Unsigned_8 := 16#10#;
   --  Output Compare Register Bit 5
   OCR2_5_Bit               : constant Bit_Number := 5;
   OCR2_5_Mask              : constant Unsigned_8 := 16#20#;
   --  Output Compare Register Bit 6
   OCR2_6_Bit               : constant Bit_Number := 6;
   OCR2_6_Mask              : constant Unsigned_8 := 16#40#;
   --  Output Compare Register Bit 7
   OCR2_7_Bit               : constant Bit_Number := 7;
   OCR2_7_Mask              : constant Unsigned_8 := 16#80#;

   --  Asynchronous Status Register
   ASSR_Addr                : constant Address    := 16#42#;
   ASSR                     : Unsigned_8 ;
   for ASSR'Address use ASSR_Addr;
   pragma Volatile (ASSR);
   ASSR_Bits                : Bits_In_Byte;
   for ASSR_Bits'Address use ASSR_Addr;
   pragma Volatile (ASSR_Bits);
   --  Timer/Counter Control Register2 Update Busy
   TCR2UB_Bit               : constant Bit_Number := 0;
   TCR2UB_Mask              : constant Unsigned_8 := 16#01#;
   --  Output Compare Register2 Update Busy
   OCR2UB_Bit               : constant Bit_Number := 1;
   OCR2UB_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter2 Update Busy
   TCN2UB_Bit               : constant Bit_Number := 2;
   TCN2UB_Mask              : constant Unsigned_8 := 16#04#;
   --  Asynchronous Timer 2
   AS2_Bit                  : constant Bit_Number := 3;
   AS2_Mask                 : constant Unsigned_8 := 16#08#;

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
   --  RW
   WDTOE_Bit                : constant Bit_Number := 4;
   WDTOE_Mask               : constant Unsigned_8 := 16#10#;

   --  EEPROM Address Register High Byte
   EEARH_Addr               : constant Address    := 16#3f#;
   EEARH                    : Unsigned_8 ;
   for EEARH'Address use EEARH_Addr;
   pragma Volatile (EEARH);
   EEARH_Bits               : Bits_In_Byte;
   for EEARH_Bits'Address use EEARH_Addr;
   pragma Volatile (EEARH_Bits);
   --  EEPROM Read/Write Access Bit 8
   EEAR8_Bit                : constant Bit_Number := 0;
   EEAR8_Mask               : constant Unsigned_8 := 16#01#;

   --  EEPROM Address Register Low Byte
   EEARL_Addr               : constant Address    := 16#3e#;
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
   EEAR0_Bit                : constant Bit_Number := 0;
   EEAR0_Mask               : constant Unsigned_8 := 16#01#;
   --  EEPROM Read/Write Access Bit 1
   EEAR1_Bit                : constant Bit_Number := 1;
   EEAR1_Mask               : constant Unsigned_8 := 16#02#;
   --  EEPROM Read/Write Access Bit 2
   EEAR2_Bit                : constant Bit_Number := 2;
   EEAR2_Mask               : constant Unsigned_8 := 16#04#;
   --  EEPROM Read/Write Access Bit 3
   EEAR3_Bit                : constant Bit_Number := 3;
   EEAR3_Mask               : constant Unsigned_8 := 16#08#;
   --  EEPROM Read/Write Access Bit 4
   EEAR4_Bit                : constant Bit_Number := 4;
   EEAR4_Mask               : constant Unsigned_8 := 16#10#;
   --  EEPROM Read/Write Access Bit 5
   EEAR5_Bit                : constant Bit_Number := 5;
   EEAR5_Mask               : constant Unsigned_8 := 16#20#;
   --  EEPROM Read/Write Access Bit 6
   EEAR6_Bit                : constant Bit_Number := 6;
   EEAR6_Mask               : constant Unsigned_8 := 16#40#;
   --  EEPROM Read/Write Access Bit 7
   EEAR7_Bit                : constant Bit_Number := 7;
   EEAR7_Mask               : constant Unsigned_8 := 16#80#;

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
   EEWE_Bit                 : constant Bit_Number := 1;
   EEWE_Mask                : constant Unsigned_8 := 16#02#;
   --  EEPROM Master Write Enable
   EEMWE_Bit                : constant Bit_Number := 2;
   EEMWE_Mask               : constant Unsigned_8 := 16#04#;
   --  EEPROM Ready Interrupt Enable
   EERIE_Bit                : constant Bit_Number := 3;
   EERIE_Mask               : constant Unsigned_8 := 16#08#;

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
   --  Port A Data Register bit 3
   PORTA3_Bit               : constant Bit_Number := 3;
   PORTA3_Mask              : constant Unsigned_8 := 16#08#;
   --  Port A Data Register bit 4
   PORTA4_Bit               : constant Bit_Number := 4;
   PORTA4_Mask              : constant Unsigned_8 := 16#10#;
   --  Port A Data Register bit 5
   PORTA5_Bit               : constant Bit_Number := 5;
   PORTA5_Mask              : constant Unsigned_8 := 16#20#;
   --  Port A Data Register bit 6
   PORTA6_Bit               : constant Bit_Number := 6;
   PORTA6_Mask              : constant Unsigned_8 := 16#40#;
   --  Port A Data Register bit 7
   PORTA7_Bit               : constant Bit_Number := 7;
   PORTA7_Mask              : constant Unsigned_8 := 16#80#;

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
   --  Data Direction Register, Port A, bit 3
   DDA3_Bit                 : constant Bit_Number := 3;
   DDA3_Mask                : constant Unsigned_8 := 16#08#;
   --  Data Direction Register, Port A, bit 4
   DDA4_Bit                 : constant Bit_Number := 4;
   DDA4_Mask                : constant Unsigned_8 := 16#10#;
   --  Data Direction Register, Port A, bit 5
   DDA5_Bit                 : constant Bit_Number := 5;
   DDA5_Mask                : constant Unsigned_8 := 16#20#;
   --  Data Direction Register, Port A, bit 6
   DDA6_Bit                 : constant Bit_Number := 6;
   DDA6_Mask                : constant Unsigned_8 := 16#40#;
   --  Data Direction Register, Port A, bit 7
   DDA7_Bit                 : constant Bit_Number := 7;
   DDA7_Mask                : constant Unsigned_8 := 16#80#;

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
   --  Input Pins, Port A bit 3
   PINA3_Bit                : constant Bit_Number := 3;
   PINA3_Mask               : constant Unsigned_8 := 16#08#;
   --  Input Pins, Port A bit 4
   PINA4_Bit                : constant Bit_Number := 4;
   PINA4_Mask               : constant Unsigned_8 := 16#10#;
   --  Input Pins, Port A bit 5
   PINA5_Bit                : constant Bit_Number := 5;
   PINA5_Mask               : constant Unsigned_8 := 16#20#;
   --  Input Pins, Port A bit 6
   PINA6_Bit                : constant Bit_Number := 6;
   PINA6_Mask               : constant Unsigned_8 := 16#40#;
   --  Input Pins, Port A bit 7
   PINA7_Bit                : constant Bit_Number := 7;
   PINA7_Mask               : constant Unsigned_8 := 16#80#;

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

   --  Port C Data Register
   PORTC_Addr               : constant Address    := 16#35#;
   PORTC                    : Unsigned_8 ;
   for PORTC'Address use PORTC_Addr;
   pragma Volatile (PORTC);
   PORTC_Bits               : Bits_In_Byte;
   for PORTC_Bits'Address use PORTC_Addr;
   pragma Volatile (PORTC_Bits);
   --  Port C Data Register bit 0
   PORTC0_Bit               : constant Bit_Number := 0;
   PORTC0_Mask              : constant Unsigned_8 := 16#01#;
   --  Port C Data Register bit 1
   PORTC1_Bit               : constant Bit_Number := 1;
   PORTC1_Mask              : constant Unsigned_8 := 16#02#;
   --  Port C Data Register bit 2
   PORTC2_Bit               : constant Bit_Number := 2;
   PORTC2_Mask              : constant Unsigned_8 := 16#04#;
   --  Port C Data Register bit 3
   PORTC3_Bit               : constant Bit_Number := 3;
   PORTC3_Mask              : constant Unsigned_8 := 16#08#;
   --  Port C Data Register bit 4
   PORTC4_Bit               : constant Bit_Number := 4;
   PORTC4_Mask              : constant Unsigned_8 := 16#10#;
   --  Port C Data Register bit 5
   PORTC5_Bit               : constant Bit_Number := 5;
   PORTC5_Mask              : constant Unsigned_8 := 16#20#;
   --  Port C Data Register bit 6
   PORTC6_Bit               : constant Bit_Number := 6;
   PORTC6_Mask              : constant Unsigned_8 := 16#40#;
   --  Port C Data Register bit 7
   PORTC7_Bit               : constant Bit_Number := 7;
   PORTC7_Mask              : constant Unsigned_8 := 16#80#;

   --  Port C Data Direction Register
   DDRC_Addr                : constant Address    := 16#34#;
   DDRC                     : Unsigned_8 ;
   for DDRC'Address use DDRC_Addr;
   pragma Volatile (DDRC);
   DDRC_Bits                : Bits_In_Byte;
   for DDRC_Bits'Address use DDRC_Addr;
   pragma Volatile (DDRC_Bits);
   --  Port C Data Direction Register bit 0
   DDC0_Bit                 : constant Bit_Number := 0;
   DDC0_Mask                : constant Unsigned_8 := 16#01#;
   --  Port C Data Direction Register bit 1
   DDC1_Bit                 : constant Bit_Number := 1;
   DDC1_Mask                : constant Unsigned_8 := 16#02#;
   --  Port C Data Direction Register bit 2
   DDC2_Bit                 : constant Bit_Number := 2;
   DDC2_Mask                : constant Unsigned_8 := 16#04#;
   --  Port C Data Direction Register bit 3
   DDC3_Bit                 : constant Bit_Number := 3;
   DDC3_Mask                : constant Unsigned_8 := 16#08#;
   --  Port C Data Direction Register bit 4
   DDC4_Bit                 : constant Bit_Number := 4;
   DDC4_Mask                : constant Unsigned_8 := 16#10#;
   --  Port C Data Direction Register bit 5
   DDC5_Bit                 : constant Bit_Number := 5;
   DDC5_Mask                : constant Unsigned_8 := 16#20#;
   --  Port C Data Direction Register bit 6
   DDC6_Bit                 : constant Bit_Number := 6;
   DDC6_Mask                : constant Unsigned_8 := 16#40#;
   --  Port C Data Direction Register bit 7
   DDC7_Bit                 : constant Bit_Number := 7;
   DDC7_Mask                : constant Unsigned_8 := 16#80#;

   --  Port C Input Pins
   PINC_Addr                : constant Address    := 16#33#;
   PINC                     : Unsigned_8 ;
   for PINC'Address use PINC_Addr;
   pragma Volatile (PINC);
   PINC_Bits                : Bits_In_Byte;
   for PINC_Bits'Address use PINC_Addr;
   pragma Volatile (PINC_Bits);
   --  Port C Input Pins bit 0
   PINC0_Bit                : constant Bit_Number := 0;
   PINC0_Mask               : constant Unsigned_8 := 16#01#;
   --  Port C Input Pins bit 1
   PINC1_Bit                : constant Bit_Number := 1;
   PINC1_Mask               : constant Unsigned_8 := 16#02#;
   --  Port C Input Pins bit 2
   PINC2_Bit                : constant Bit_Number := 2;
   PINC2_Mask               : constant Unsigned_8 := 16#04#;
   --  Port C Input Pins bit 3
   PINC3_Bit                : constant Bit_Number := 3;
   PINC3_Mask               : constant Unsigned_8 := 16#08#;
   --  Port C Input Pins bit 4
   PINC4_Bit                : constant Bit_Number := 4;
   PINC4_Mask               : constant Unsigned_8 := 16#10#;
   --  Port C Input Pins bit 5
   PINC5_Bit                : constant Bit_Number := 5;
   PINC5_Mask               : constant Unsigned_8 := 16#20#;
   --  Port C Input Pins bit 6
   PINC6_Bit                : constant Bit_Number := 6;
   PINC6_Mask               : constant Unsigned_8 := 16#40#;
   --  Port C Input Pins bit 7
   PINC7_Bit                : constant Bit_Number := 7;
   PINC7_Mask               : constant Unsigned_8 := 16#80#;

   --  Port D Data Register
   PORTD_Addr               : constant Address    := 16#32#;
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
   DDRD_Addr                : constant Address    := 16#31#;
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
   PIND_Addr                : constant Address    := 16#30#;
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

   --  SPI Data Register
   SPDR_Addr                : constant Address    := 16#2f#;
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
   SPSR_Addr                : constant Address    := 16#2e#;
   SPSR                     : Unsigned_8 ;
   for SPSR'Address use SPSR_Addr;
   pragma Volatile (SPSR);
   SPSR_Bits                : Bits_In_Byte;
   for SPSR_Bits'Address use SPSR_Addr;
   pragma Volatile (SPSR_Bits);
   --  Write Collision Flag
   WCOL_Bit                 : constant Bit_Number := 6;
   WCOL_Mask                : constant Unsigned_8 := 16#40#;
   --  SPI Interrupt Flag
   SPIF_Bit                 : constant Bit_Number := 7;
   SPIF_Mask                : constant Unsigned_8 := 16#80#;

   --  SPI Control Register
   SPCR_Addr                : constant Address    := 16#2d#;
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

   --  UART I/O Data Register
   UDR_Addr                 : constant Address    := 16#2c#;
   UDR                      : Unsigned_8 ;
   for UDR'Address use UDR_Addr;
   pragma Volatile (UDR);
   UDR_Bits                 : Bits_In_Byte;
   for UDR_Bits'Address use UDR_Addr;
   pragma Volatile (UDR_Bits);
   --  UART I/O Data Register bit 0
   UDR0_Bit                 : constant Bit_Number := 0;
   UDR0_Mask                : constant Unsigned_8 := 16#01#;
   --  UART I/O Data Register bit 1
   UDR1_Bit                 : constant Bit_Number := 1;
   UDR1_Mask                : constant Unsigned_8 := 16#02#;
   --  UART I/O Data Register bit 2
   UDR2_Bit                 : constant Bit_Number := 2;
   UDR2_Mask                : constant Unsigned_8 := 16#04#;
   --  UART I/O Data Register bit 3
   UDR3_Bit                 : constant Bit_Number := 3;
   UDR3_Mask                : constant Unsigned_8 := 16#08#;
   --  UART I/O Data Register bit 4
   UDR4_Bit                 : constant Bit_Number := 4;
   UDR4_Mask                : constant Unsigned_8 := 16#10#;
   --  UART I/O Data Register bit 5
   UDR5_Bit                 : constant Bit_Number := 5;
   UDR5_Mask                : constant Unsigned_8 := 16#20#;
   --  UART I/O Data Register bit 6
   UDR6_Bit                 : constant Bit_Number := 6;
   UDR6_Mask                : constant Unsigned_8 := 16#40#;
   --  UART I/O Data Register bit 7
   UDR7_Bit                 : constant Bit_Number := 7;
   UDR7_Mask                : constant Unsigned_8 := 16#80#;

   --  UART Status Register
   USR_Addr                 : constant Address    := 16#2b#;
   USR                      : Unsigned_8 ;
   for USR'Address use USR_Addr;
   pragma Volatile (USR);
   USR_Bits                 : Bits_In_Byte;
   for USR_Bits'Address use USR_Addr;
   pragma Volatile (USR_Bits);
   --  Overrun
   OR_Bit_Bit               : constant Bit_Number := 3;
   OR_Bit_Mask              : constant Unsigned_8 := 16#08#;
   --  Framing Error
   FE_Bit                   : constant Bit_Number := 4;
   FE_Mask                  : constant Unsigned_8 := 16#10#;
   --  UART Data Register Empty
   UDRE_Bit                 : constant Bit_Number := 5;
   UDRE_Mask                : constant Unsigned_8 := 16#20#;
   --  UART Transmit Complete
   TXC_Bit                  : constant Bit_Number := 6;
   TXC_Mask                 : constant Unsigned_8 := 16#40#;
   --  UART Receive Complete
   RXC_Bit                  : constant Bit_Number := 7;
   RXC_Mask                 : constant Unsigned_8 := 16#80#;

   --  UART Control Register
   UCR_Addr                 : constant Address    := 16#2a#;
   UCR                      : Unsigned_8 ;
   for UCR'Address use UCR_Addr;
   pragma Volatile (UCR);
   UCR_Bits                 : Bits_In_Byte;
   for UCR_Bits'Address use UCR_Addr;
   pragma Volatile (UCR_Bits);
   --  Transmit Data Bit 8
   TXB8_Bit                 : constant Bit_Number := 0;
   TXB8_Mask                : constant Unsigned_8 := 16#01#;
   --  Receive Data Bit 8
   RXB8_Bit                 : constant Bit_Number := 1;
   RXB8_Mask                : constant Unsigned_8 := 16#02#;
   --  9-bit Characters
   CHR9_Bit                 : constant Bit_Number := 2;
   CHR9_Mask                : constant Unsigned_8 := 16#04#;
   --  Transmitter Enable
   TXEN_Bit                 : constant Bit_Number := 3;
   TXEN_Mask                : constant Unsigned_8 := 16#08#;
   --  Receiver Enable
   RXEN_Bit                 : constant Bit_Number := 4;
   RXEN_Mask                : constant Unsigned_8 := 16#10#;
   --  UART Data Register Empty Interrupt Enable
   UDRIE_Bit                : constant Bit_Number := 5;
   UDRIE_Mask               : constant Unsigned_8 := 16#20#;
   --  TX Complete Interrupt Enable
   TXCIE_Bit                : constant Bit_Number := 6;
   TXCIE_Mask               : constant Unsigned_8 := 16#40#;
   --  RX Complete Interrupt Enable
   RXCIE_Bit                : constant Bit_Number := 7;
   RXCIE_Mask               : constant Unsigned_8 := 16#80#;

   --  UART BAUD Rate Register
   UBRR_Addr                : constant Address    := 16#29#;
   UBRR                     : Unsigned_8 ;
   for UBRR'Address use UBRR_Addr;
   pragma Volatile (UBRR);
   UBRR_Bits                : Bits_In_Byte;
   for UBRR_Bits'Address use UBRR_Addr;
   pragma Volatile (UBRR_Bits);
   --  UART Baud Rate Register bit 0
   UBRR0_Bit                : constant Bit_Number := 0;
   UBRR0_Mask               : constant Unsigned_8 := 16#01#;
   --  UART Baud Rate Register bit 1
   UBRR1_Bit                : constant Bit_Number := 1;
   UBRR1_Mask               : constant Unsigned_8 := 16#02#;
   --  UART Baud Rate Register bit 2
   UBRR2_Bit                : constant Bit_Number := 2;
   UBRR2_Mask               : constant Unsigned_8 := 16#04#;
   --  UART Baud Rate Register bit 3
   UBRR3_Bit                : constant Bit_Number := 3;
   UBRR3_Mask               : constant Unsigned_8 := 16#08#;
   --  UART Baud Rate Register bit 4
   UBRR4_Bit                : constant Bit_Number := 4;
   UBRR4_Mask               : constant Unsigned_8 := 16#10#;
   --  UART Baud Rate Register bit 5
   UBRR5_Bit                : constant Bit_Number := 5;
   UBRR5_Mask               : constant Unsigned_8 := 16#20#;
   --  UART Baud Rate Register bit 6
   UBRR6_Bit                : constant Bit_Number := 6;
   UBRR6_Mask               : constant Unsigned_8 := 16#40#;
   --  UART Baud Rate Register bit 7
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
   --  Analog Comparator Input Capture Enable
   ACIC_Bit                 : constant Bit_Number := 2;
   ACIC_Mask                : constant Unsigned_8 := 16#04#;
   --  Analog Comparator Interrupt Enable
   ACIE_Bit                 : constant Bit_Number := 3;
   ACIE_Mask                : constant Unsigned_8 := 16#08#;
   --  Analog Comparator Interrupt Flag
   ACI_Bit                  : constant Bit_Number := 4;
   ACI_Mask                 : constant Unsigned_8 := 16#10#;
   --  Analog Comparator Output
   ACO_Bit                  : constant Bit_Number := 5;
   ACO_Mask                 : constant Unsigned_8 := 16#20#;
   --  Analog Comparator Disable
   ACD_Bit                  : constant Bit_Number := 7;
   ACD_Mask                 : constant Unsigned_8 := 16#80#;

   --  The ADC multiplexer Selection Register
   ADMUX_Addr               : constant Address    := 16#27#;
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

   --  The ADC Control and Status register
   ADCSR_Addr               : constant Address    := 16#26#;
   ADCSR                    : Unsigned_8 ;
   for ADCSR'Address use ADCSR_Addr;
   pragma Volatile (ADCSR);
   ADCSR_Bits               : Bits_In_Byte;
   for ADCSR_Bits'Address use ADCSR_Addr;
   pragma Volatile (ADCSR_Bits);
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
   --  ADC  Free Running Select
   ADFR_Bit                 : constant Bit_Number := 5;
   ADFR_Mask                : constant Unsigned_8 := 16#20#;
   --  ADC Start Conversion
   ADSC_Bit                 : constant Bit_Number := 6;
   ADSC_Mask                : constant Unsigned_8 := 16#40#;
   --  ADC Enable
   ADEN_Bit                 : constant Bit_Number := 7;
   ADEN_Mask                : constant Unsigned_8 := 16#80#;

   --  ADC Data Register High Byte
   ADCH_Addr                : constant Address    := 16#25#;
   ADCH                     : Unsigned_8 ;
   for ADCH'Address use ADCH_Addr;
   pragma Volatile (ADCH);
   ADCH_Bits                : Bits_In_Byte;
   for ADCH_Bits'Address use ADCH_Addr;
   pragma Volatile (ADCH_Bits);
   --  ADC Data Register High Byte Bit 0
   ADC8_Bit                 : constant Bit_Number := 0;
   ADC8_Mask                : constant Unsigned_8 := 16#01#;
   --  ADC Data Register High Byte Bit 1
   ADC9_Bit                 : constant Bit_Number := 1;
   ADC9_Mask                : constant Unsigned_8 := 16#02#;

   --  ADC Data Register Low Byte
   ADCL_Addr                : constant Address    := 16#24#;
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
   ADC0_Bit                 : constant Bit_Number := 0;
   ADC0_Mask                : constant Unsigned_8 := 16#01#;
   --  ADC Data Register Low Byte Bit 1
   ADC1_Bit                 : constant Bit_Number := 1;
   ADC1_Mask                : constant Unsigned_8 := 16#02#;
   --  ADC Data Register Low Byte Bit 2
   ADC2_Bit                 : constant Bit_Number := 2;
   ADC2_Mask                : constant Unsigned_8 := 16#04#;
   --  ADC Data Register Low Byte Bit 3
   ADC3_Bit                 : constant Bit_Number := 3;
   ADC3_Mask                : constant Unsigned_8 := 16#08#;
   --  ADC Data Register Low Byte Bit 4
   ADC4_Bit                 : constant Bit_Number := 4;
   ADC4_Mask                : constant Unsigned_8 := 16#10#;
   --  ADC Data Register Low Byte Bit 5
   ADC5_Bit                 : constant Bit_Number := 5;
   ADC5_Mask                : constant Unsigned_8 := 16#20#;
   --  ADC Data Register Low Byte Bit 6
   ADC6_Bit                 : constant Bit_Number := 6;
   ADC6_Mask                : constant Unsigned_8 := 16#40#;
   --  ADC Data Register Low Byte Bit 7
   ADC7_Bit                 : constant Bit_Number := 7;
   ADC7_Mask                : constant Unsigned_8 := 16#80#;



   --
   --  available assembler instructions
   --
   --  type to designate the instruction core of the devices.  See
   --  the help file of Atmel's "AVR Assembler 2".
   type Instruction_Core_Type is (V0, V0E, V1, V2, V2E, V3);
   Instruction_Core  : constant Instruction_Core_Type := V1;
   Have_lpm_rd_Zplus : constant Boolean               := False;
   EEprom_8bit_Addr  : constant Boolean               :=
     (EEprom_Size <= 16#0100#);


end AVR.AT90S4434;
