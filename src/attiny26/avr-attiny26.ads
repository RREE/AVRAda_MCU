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

package AVR.ATtiny26 is
   pragma Preelaborate;

   CVS_Version : constant String := "$Id: avr-attiny26.ads 881 2008-11-16 22:55:31Z Rolf_Ebert $";


   --
   --  memory sizes
   --
   Flash_Size               : constant := 16#0800#;
   Flash_End                : constant := 16#07ff#;
   EEprom_Size              : constant := 16#0080#;
   E2end                    : constant := 16#007f#;
   Int_SRAM_Start_Addr      : constant := 16#60#;
   Int_SRAM_Size            : constant := 16#80#;

   --
   --  interrupts
   --
   Number_Of_Interrupts     : constant := 12;

   --  External Reset, Power-on Reset and Watchdog Reset
   Sig_RESET                : constant        :=  0;
   Sig_RESET_String         : constant String := "__vector_0";
   --  External Interrupt 0
   Sig_INT0                 : constant        :=  1;
   Sig_INT0_String          : constant String := "__vector_1";
   --  External Interrupt Request 0
   Sig_IO_PINS              : constant        :=  2;
   Sig_IO_PINS_String       : constant String := "__vector_2";
   --  Timer/Counter1 Compare Match 1A
   Sig_TIMER1_CMPA          : constant        :=  3;
   Sig_TIMER1_CMPA_String   : constant String := "__vector_3";
   --  Timer/Counter1 Compare Match 1B
   Sig_TIMER1_CMPB          : constant        :=  4;
   Sig_TIMER1_CMPB_String   : constant String := "__vector_4";
   --  Timer/Counter1 Overflow
   Sig_TIMER1_OVF1          : constant        :=  5;
   Sig_TIMER1_OVF1_String   : constant String := "__vector_5";
   --  Timer/Counter0 Overflow
   Sig_TIMER0_OVF0          : constant        :=  6;
   Sig_TIMER0_OVF0_String   : constant String := "__vector_6";
   --  USI Start
   Sig_USI_STRT             : constant        :=  7;
   Sig_USI_STRT_String      : constant String := "__vector_7";
   --  USI Overflow
   Sig_USI_OVF              : constant        :=  8;
   Sig_USI_OVF_String       : constant String := "__vector_8";
   --  EEPROM Ready
   Sig_EE_RDY               : constant        :=  9;
   Sig_EE_RDY_String        : constant String := "__vector_9";
   --  Analog Comparator
   Sig_ANA_COMP             : constant        := 10;
   Sig_ANA_COMP_String      : constant String := "__vector_10";
   --  ADC Conversion Complete
   Sig_ADC                  : constant        := 11;
   Sig_ADC_String           : constant String := "__vector_11";


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

   --  Stack Pointer
   SP_Addr                  : constant Address    := 16#5d#;
   SP                       : Unsigned_8 ;
   for SP'Address use SP_Addr;
   pragma Volatile (SP);
   SP_Bits                  : Bits_In_Byte;
   for SP_Bits'Address use SP_Addr;
   pragma Volatile (SP_Bits);
   --  Stack Pointer Bit 0
   SP0_Bit                  : constant Bit_Number := 0;
   SP0_Mask                 : constant Unsigned_8 := 16#01#;
   --  Stack Pointer Bit 1
   SP1_Bit                  : constant Bit_Number := 1;
   SP1_Mask                 : constant Unsigned_8 := 16#02#;
   --  Stack Pointer Bit 2
   SP2_Bit                  : constant Bit_Number := 2;
   SP2_Mask                 : constant Unsigned_8 := 16#04#;
   --  Stack Pointer Bit 3
   SP3_Bit                  : constant Bit_Number := 3;
   SP3_Mask                 : constant Unsigned_8 := 16#08#;
   --  Stack Pointer Bit 4
   SP4_Bit                  : constant Bit_Number := 4;
   SP4_Mask                 : constant Unsigned_8 := 16#10#;
   --  Stack Pointer Bit 5
   SP5_Bit                  : constant Bit_Number := 5;
   SP5_Mask                 : constant Unsigned_8 := 16#20#;
   --  Stack Pointer Bit 6
   SP6_Bit                  : constant Bit_Number := 6;
   SP6_Mask                 : constant Unsigned_8 := 16#40#;
   --  Stack Pointer Bit 7
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
   --  Pin Change Interrupt Enable 0
   PCIE0_Bit                : constant Bit_Number := 4;
   PCIE0_Mask               : constant Unsigned_8 := 16#10#;
   --  Pin Change Interrupt Enable 1
   PCIE1_Bit                : constant Bit_Number := 5;
   PCIE1_Mask               : constant Unsigned_8 := 16#20#;
   --  External Interrupt Request 0 Enable
   INT0_Bit                 : constant Bit_Number := 6;
   INT0_Mask                : constant Unsigned_8 := 16#40#;

   --  General Interrupt Flag register
   GIFR_Addr                : constant Address    := 16#5a#;
   GIFR                     : Unsigned_8 ;
   for GIFR'Address use GIFR_Addr;
   pragma Volatile (GIFR);
   GIFR_Bits                : Bits_In_Byte;
   for GIFR_Bits'Address use GIFR_Addr;
   pragma Volatile (GIFR_Bits);
   --  Pin Change Interrupt Flag
   PCIF_Bit                 : constant Bit_Number := 5;
   PCIF_Mask                : constant Unsigned_8 := 16#20#;
   --  External Interrupt Flag 0
   INTF0_Bit                : constant Bit_Number := 6;
   INTF0_Mask               : constant Unsigned_8 := 16#40#;

   --  Timer/Counter Interrupt Mask Register
   TIMSK_Addr               : constant Address    := 16#59#;
   TIMSK                    : Unsigned_8 ;
   for TIMSK'Address use TIMSK_Addr;
   pragma Volatile (TIMSK);
   TIMSK_Bits               : Bits_In_Byte;
   for TIMSK_Bits'Address use TIMSK_Addr;
   pragma Volatile (TIMSK_Bits);
   --  Timer/Counter0 Overflow Interrupt Enable
   TOIE0_Bit                : constant Bit_Number := 1;
   TOIE0_Mask               : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Overflow Interrupt Enable
   TOIE1_Bit                : constant Bit_Number := 2;
   TOIE1_Mask               : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Output Compare Interrupt Enable
   OCIE1B_Bit               : constant Bit_Number := 5;
   OCIE1B_Mask              : constant Unsigned_8 := 16#20#;
   --  Timer/Counter1 Output Compare Interrupt Enable
   OCIE1A_Bit               : constant Bit_Number := 6;
   OCIE1A_Mask              : constant Unsigned_8 := 16#40#;

   --  Timer/Counter Interrupt Flag register
   TIFR_Addr                : constant Address    := 16#58#;
   TIFR                     : Unsigned_8 ;
   for TIFR'Address use TIFR_Addr;
   pragma Volatile (TIFR);
   TIFR_Bits                : Bits_In_Byte;
   for TIFR_Bits'Address use TIFR_Addr;
   pragma Volatile (TIFR_Bits);
   --  Timer/Counter0 Overflow Flag
   TOV0_Bit                 : constant Bit_Number := 1;
   TOV0_Mask                : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Overflow Flag
   TOV1_Bit                 : constant Bit_Number := 2;
   TOV1_Mask                : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Output Compare Flag 1B
   OCF1B_Bit                : constant Bit_Number := 5;
   OCF1B_Mask               : constant Unsigned_8 := 16#20#;
   --  Timer/Counter1 Output Compare Flag 1A
   OCF1A_Bit                : constant Bit_Number := 6;
   OCF1A_Mask               : constant Unsigned_8 := 16#40#;

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
   --  Sleep Mode Select Bit 0
   SM0_Bit                  : constant Bit_Number := 3;
   SM0_Mask                 : constant Unsigned_8 := 16#08#;
   --  Sleep Mode Select Bit 1
   SM1_Bit                  : constant Bit_Number := 4;
   SM1_Mask                 : constant Unsigned_8 := 16#10#;
   --  Sleep Enable
   SE_Bit                   : constant Bit_Number := 5;
   SE_Mask                  : constant Unsigned_8 := 16#20#;
   --  Pull-up Disable
   PUD_Bit                  : constant Bit_Number := 6;
   PUD_Mask                 : constant Unsigned_8 := 16#40#;

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
   --  Prescaler Reset Timer/Counter0
   PSR0_Bit                 : constant Bit_Number := 3;
   PSR0_Mask                : constant Unsigned_8 := 16#08#;

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

   --  Status Register
   OSCCAL_Addr              : constant Address    := 16#51#;
   OSCCAL                   : Unsigned_8 ;
   for OSCCAL'Address use OSCCAL_Addr;
   pragma Volatile (OSCCAL);
   OSCCAL_Bits              : Bits_In_Byte;
   for OSCCAL_Bits'Address use OSCCAL_Addr;
   pragma Volatile (OSCCAL_Bits);
   --  Oscillator Calibration Value Bit 0
   CAL0_Bit                 : constant Bit_Number := 0;
   CAL0_Mask                : constant Unsigned_8 := 16#01#;
   --  Oscillator Calibration Value Bit 1
   CAL1_Bit                 : constant Bit_Number := 1;
   CAL1_Mask                : constant Unsigned_8 := 16#02#;
   --  Oscillator Calibration Value Bit 2
   CAL2_Bit                 : constant Bit_Number := 2;
   CAL2_Mask                : constant Unsigned_8 := 16#04#;
   --  Oscillator Calibration Value Bit 3
   CAL3_Bit                 : constant Bit_Number := 3;
   CAL3_Mask                : constant Unsigned_8 := 16#08#;
   --  Oscillator Calibration Value Bit 4
   CAL4_Bit                 : constant Bit_Number := 4;
   CAL4_Mask                : constant Unsigned_8 := 16#10#;
   --  Oscillator Calibration Value Bit 5
   CAL5_Bit                 : constant Bit_Number := 5;
   CAL5_Mask                : constant Unsigned_8 := 16#20#;
   --  Oscillator Calibration Value Bit 6
   CAL6_Bit                 : constant Bit_Number := 6;
   CAL6_Mask                : constant Unsigned_8 := 16#40#;
   --  Oscillator Calibration Value Bit 7
   CAL7_Bit                 : constant Bit_Number := 7;
   CAL7_Mask                : constant Unsigned_8 := 16#80#;

   --  Timer/Counter Control Register A
   TCCR1A_Addr              : constant Address    := 16#50#;
   TCCR1A                   : Unsigned_8 ;
   for TCCR1A'Address use TCCR1A_Addr;
   pragma Volatile (TCCR1A);
   TCCR1A_Bits              : Bits_In_Byte;
   for TCCR1A_Bits'Address use TCCR1A_Addr;
   pragma Volatile (TCCR1A_Bits);
   --  Pulse Width Modulator B Enable
   PWM1B_Bit                : constant Bit_Number := 0;
   PWM1B_Mask               : constant Unsigned_8 := 16#01#;
   --  Pulse Width Modulator A Enable
   PWM1A_Bit                : constant Bit_Number := 1;
   PWM1A_Mask               : constant Unsigned_8 := 16#02#;
   --  Force Output Compare Match 1B
   FOC1B_Bit                : constant Bit_Number := 2;
   FOC1B_Mask               : constant Unsigned_8 := 16#04#;
   --  Force Output Compare Match 1A
   FOC1A_Bit                : constant Bit_Number := 3;
   FOC1A_Mask               : constant Unsigned_8 := 16#08#;
   --  Comparator B Output Mode Bit 0
   COM1B0_Bit               : constant Bit_Number := 4;
   COM1B0_Mask              : constant Unsigned_8 := 16#10#;
   --  Comparator B Output Mode Bit 1
   COM1B1_Bit               : constant Bit_Number := 5;
   COM1B1_Mask              : constant Unsigned_8 := 16#20#;
   --  Comparator A Output Mode Bit 0
   COM1A0_Bit               : constant Bit_Number := 6;
   COM1A0_Mask              : constant Unsigned_8 := 16#40#;
   --  Comparator A Output Mode Bit 1
   COM1A1_Bit               : constant Bit_Number := 7;
   COM1A1_Mask              : constant Unsigned_8 := 16#80#;

   --  Timer/Counter Control Register B
   TCCR1B_Addr              : constant Address    := 16#4f#;
   TCCR1B                   : Unsigned_8 ;
   for TCCR1B'Address use TCCR1B_Addr;
   pragma Volatile (TCCR1B);
   TCCR1B_Bits              : Bits_In_Byte;
   for TCCR1B_Bits'Address use TCCR1B_Addr;
   pragma Volatile (TCCR1B_Bits);
   --  Clock Select Bits
   CS10_Bit                 : constant Bit_Number := 0;
   CS10_Mask                : constant Unsigned_8 := 16#01#;
   --  Clock Select Bits
   CS11_Bit                 : constant Bit_Number := 1;
   CS11_Mask                : constant Unsigned_8 := 16#02#;
   --  Clock Select Bits
   CS12_Bit                 : constant Bit_Number := 2;
   CS12_Mask                : constant Unsigned_8 := 16#04#;
   --  Clock Select Bits
   CS13_Bit                 : constant Bit_Number := 3;
   CS13_Mask                : constant Unsigned_8 := 16#08#;
   --  Prescaler Reset Timer/Counter1
   PSR1_Bit                 : constant Bit_Number := 6;
   PSR1_Mask                : constant Unsigned_8 := 16#40#;
   --  Clear Timer/Counter on Compare Match
   CTC1_Bit                 : constant Bit_Number := 7;
   CTC1_Mask                : constant Unsigned_8 := 16#80#;

   --  Timer/Counter Register
   TCNT1_Addr               : constant Address    := 16#4e#;
   TCNT1                    : Unsigned_8 ;
   for TCNT1'Address use TCNT1_Addr;
   pragma Volatile (TCNT1);
   TCNT1_Bits               : Bits_In_Byte;
   for TCNT1_Bits'Address use TCNT1_Addr;
   pragma Volatile (TCNT1_Bits);
   --  Timer/Counter Register Bit 0
   TCNT1_0_Bit              : constant Bit_Number := 0;
   TCNT1_0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter Register Bit 1
   TCNT1_1_Bit              : constant Bit_Number := 1;
   TCNT1_1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter Register Bit 2
   TCNT1_2_Bit              : constant Bit_Number := 2;
   TCNT1_2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter Register Bit 3
   TCNT1_3_Bit              : constant Bit_Number := 3;
   TCNT1_3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter Register Bit 4
   TCNT1_4_Bit              : constant Bit_Number := 4;
   TCNT1_4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter Register Bit 5
   TCNT1_5_Bit              : constant Bit_Number := 5;
   TCNT1_5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter Register Bit 6
   TCNT1_6_Bit              : constant Bit_Number := 6;
   TCNT1_6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter Register Bit 7
   TCNT1_7_Bit              : constant Bit_Number := 7;
   TCNT1_7_Mask             : constant Unsigned_8 := 16#80#;

   --  Output Compare Register
   OCR1A_Addr               : constant Address    := 16#4d#;
   OCR1A                    : Unsigned_8 ;
   for OCR1A'Address use OCR1A_Addr;
   pragma Volatile (OCR1A);
   OCR1A_Bits               : Bits_In_Byte;
   for OCR1A_Bits'Address use OCR1A_Addr;
   pragma Volatile (OCR1A_Bits);
   --  Output Compare Register A Bit 0
   OCR1A0_Bit               : constant Bit_Number := 0;
   OCR1A0_Mask              : constant Unsigned_8 := 16#01#;
   --  Output Compare Register A Bit 1
   OCR1A1_Bit               : constant Bit_Number := 1;
   OCR1A1_Mask              : constant Unsigned_8 := 16#02#;
   --  Output Compare Register A Bit 2
   OCR1A2_Bit               : constant Bit_Number := 2;
   OCR1A2_Mask              : constant Unsigned_8 := 16#04#;
   --  Output Compare Register A Bit 3
   OCR1A3_Bit               : constant Bit_Number := 3;
   OCR1A3_Mask              : constant Unsigned_8 := 16#08#;
   --  Output Compare Register A Bit 4
   OCR1A4_Bit               : constant Bit_Number := 4;
   OCR1A4_Mask              : constant Unsigned_8 := 16#10#;
   --  Output Compare Register A Bit 5
   OCR1A5_Bit               : constant Bit_Number := 5;
   OCR1A5_Mask              : constant Unsigned_8 := 16#20#;
   --  Output Compare Register A Bit 6
   OCR1A6_Bit               : constant Bit_Number := 6;
   OCR1A6_Mask              : constant Unsigned_8 := 16#40#;
   --  Output Compare Register A Bit 7
   OCR1A7_Bit               : constant Bit_Number := 7;
   OCR1A7_Mask              : constant Unsigned_8 := 16#80#;

   --  Output Compare Register
   OCR1B_Addr               : constant Address    := 16#4c#;
   OCR1B                    : Unsigned_8 ;
   for OCR1B'Address use OCR1B_Addr;
   pragma Volatile (OCR1B);
   OCR1B_Bits               : Bits_In_Byte;
   for OCR1B_Bits'Address use OCR1B_Addr;
   pragma Volatile (OCR1B_Bits);
   --  Output Compare Register B Bit 0
   OCR1B0_Bit               : constant Bit_Number := 0;
   OCR1B0_Mask              : constant Unsigned_8 := 16#01#;
   --  Output Compare Register B Bit 1
   OCR1B1_Bit               : constant Bit_Number := 1;
   OCR1B1_Mask              : constant Unsigned_8 := 16#02#;
   --  Output Compare Register B Bit 2
   OCR1B2_Bit               : constant Bit_Number := 2;
   OCR1B2_Mask              : constant Unsigned_8 := 16#04#;
   --  Output Compare Register B Bit 3
   OCR1B3_Bit               : constant Bit_Number := 3;
   OCR1B3_Mask              : constant Unsigned_8 := 16#08#;
   --  Output Compare Register B Bit 4
   OCR1B4_Bit               : constant Bit_Number := 4;
   OCR1B4_Mask              : constant Unsigned_8 := 16#10#;
   --  Output Compare Register B Bit 5
   OCR1B5_Bit               : constant Bit_Number := 5;
   OCR1B5_Mask              : constant Unsigned_8 := 16#20#;
   --  Output Compare Register B Bit 6
   OCR1B6_Bit               : constant Bit_Number := 6;
   OCR1B6_Mask              : constant Unsigned_8 := 16#40#;
   --  Output Compare Register B Bit 7
   OCR1B7_Bit               : constant Bit_Number := 7;
   OCR1B7_Mask              : constant Unsigned_8 := 16#80#;

   --  Output Compare Register
   OCR1C_Addr               : constant Address    := 16#4b#;
   OCR1C                    : Unsigned_8 ;
   for OCR1C'Address use OCR1C_Addr;
   pragma Volatile (OCR1C);
   OCR1C_Bits               : Bits_In_Byte;
   for OCR1C_Bits'Address use OCR1C_Addr;
   pragma Volatile (OCR1C_Bits);
   --  Output Compare Register C Bit 0
   OCR1C0_Bit               : constant Bit_Number := 0;
   OCR1C0_Mask              : constant Unsigned_8 := 16#01#;
   --  Output Compare Register C Bit 1
   OCR1C1_Bit               : constant Bit_Number := 1;
   OCR1C1_Mask              : constant Unsigned_8 := 16#02#;
   --  Output Compare Register C Bit 2
   OCR1C2_Bit               : constant Bit_Number := 2;
   OCR1C2_Mask              : constant Unsigned_8 := 16#04#;
   --  Output Compare Register C Bit 3
   OCR1C3_Bit               : constant Bit_Number := 3;
   OCR1C3_Mask              : constant Unsigned_8 := 16#08#;
   --  Output Compare Register C Bit 4
   OCR1C4_Bit               : constant Bit_Number := 4;
   OCR1C4_Mask              : constant Unsigned_8 := 16#10#;
   --  Output Compare Register C Bit 5
   OCR1C5_Bit               : constant Bit_Number := 5;
   OCR1C5_Mask              : constant Unsigned_8 := 16#20#;
   --  Output Compare Register C Bit 6
   OCR1C6_Bit               : constant Bit_Number := 6;
   OCR1C6_Mask              : constant Unsigned_8 := 16#40#;
   --  Output Compare Register C Bit 7
   OCR1C7_Bit               : constant Bit_Number := 7;
   OCR1C7_Mask              : constant Unsigned_8 := 16#80#;

   --  PLL Control and Status Register
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
   --  PCK Enable
   PCKE_Bit                 : constant Bit_Number := 2;
   PCKE_Mask                : constant Unsigned_8 := 16#04#;

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
   EEWE_Bit                 : constant Bit_Number := 1;
   EEWE_Mask                : constant Unsigned_8 := 16#02#;
   --  EEPROM Master Write Enable
   EEMWE_Bit                : constant Bit_Number := 2;
   EEMWE_Mask               : constant Unsigned_8 := 16#04#;
   --  EEProm Ready Interrupt Enable
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
   --  Analog Comparator Multiplexer Enable
   ACME_Bit                 : constant Bit_Number := 2;
   ACME_Mask                : constant Unsigned_8 := 16#04#;
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
   --  Analog Channel and Gain Selection Bits
   MUX3_Bit                 : constant Bit_Number := 3;
   MUX3_Mask                : constant Unsigned_8 := 16#08#;
   --  Analog Channel and Gain Selection Bits
   MUX4_Bit                 : constant Bit_Number := 4;
   MUX4_Mask                : constant Unsigned_8 := 16#10#;
   --  Left Adjust Result
   ADLAR_Bit                : constant Bit_Number := 5;
   ADLAR_Mask               : constant Unsigned_8 := 16#20#;
   --  Reference Selection Bit 0
   REFS0_Bit                : constant Bit_Number := 6;
   REFS0_Mask               : constant Unsigned_8 := 16#40#;
   --  Reference Selection Bit 1
   REFS1_Bit                : constant Bit_Number := 7;
   REFS1_Mask               : constant Unsigned_8 := 16#80#;

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


end AVR.ATtiny26;
