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

package AVR.ATtiny85 is
   pragma Preelaborate;

   CVS_Version : constant String := "$Id: avr-attiny85.ads 881 2008-11-16 22:55:31Z Rolf_Ebert $";


   --
   --  memory sizes
   --
   Flash_Size               : constant := 16#2000#;
   Flash_End                : constant := 16#1fff#;
   EEprom_Size              : constant := 16#0200#;
   E2end                    : constant := 16#01ff#;
   Int_SRAM_Start_Addr      : constant := 16#60#;
   Int_SRAM_Size            : constant := 16#200#;

   --
   --  interrupts
   --
   Number_Of_Interrupts     : constant := 15;

   --  External Pin, Power-on Reset, Brown-out Reset,Watchdog Reset
   Sig_RESET                : constant        :=  0;
   Sig_RESET_String         : constant String := "__vector_0";
   --  External Interrupt 0
   Sig_INT0                 : constant        :=  1;
   Sig_INT0_String          : constant String := "__vector_1";
   --  Pin change Interrupt Request 0
   Sig_PCINT0               : constant        :=  2;
   Sig_PCINT0_String        : constant String := "__vector_2";
   --  Timer/Counter1 Compare Match 1A
   Sig_TIMER1_COMPA         : constant        :=  3;
   Sig_TIMER1_COMPA_String  : constant String := "__vector_3";
   --  Timer/Counter1 Overflow
   Sig_TIMER1_OVF           : constant        :=  4;
   Sig_TIMER1_OVF_String    : constant String := "__vector_4";
   --  Timer/Counter0 Overflow
   Sig_TIMER0_OVF           : constant        :=  5;
   Sig_TIMER0_OVF_String    : constant String := "__vector_5";
   --  EEPROM Ready
   Sig_EE_RDY               : constant        :=  6;
   Sig_EE_RDY_String        : constant String := "__vector_6";
   --  Analog comparator
   Sig_ANA_COMP             : constant        :=  7;
   Sig_ANA_COMP_String      : constant String := "__vector_7";
   --  ADC Conversion ready
   Sig_ADC                  : constant        :=  8;
   Sig_ADC_String           : constant String := "__vector_8";
   --  Timer/Counter1 Compare Match B
   Sig_TIMER1_COMPB         : constant        :=  9;
   Sig_TIMER1_COMPB_String  : constant String := "__vector_9";
   --  Timer/Counter0 Compare Match A
   Sig_TIMER0_COMPA         : constant        := 10;
   Sig_TIMER0_COMPA_String  : constant String := "__vector_10";
   --  Timer/Counter0 Compare Match B
   Sig_TIMER0_COMPB         : constant        := 11;
   Sig_TIMER0_COMPB_String  : constant String := "__vector_11";
   --  Watchdog Time-out
   Sig_WDT                  : constant        := 12;
   Sig_WDT_String           : constant String := "__vector_12";
   --  USI START
   Sig_USI_START            : constant        := 13;
   Sig_USI_START_String     : constant String := "__vector_13";
   --  USI Overflow
   Sig_USI_OVF              : constant        := 14;
   Sig_USI_OVF_String       : constant String := "__vector_14";


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

   --  Stack Pointer High Byte
   SPH_Addr                 : constant Address    := 16#5e#;
   SPH                      : Unsigned_8 ;
   for SPH'Address use SPH_Addr;
   pragma Volatile (SPH);
   SPH_Bits                 : Bits_In_Byte;
   for SPH_Bits'Address use SPH_Addr;
   pragma Volatile (SPH_Bits);
   --  Stack Pointer Bit 8
   SP8_Bit                  : constant Bit_Number := 0;
   SP8_Mask                 : constant Unsigned_8 := 16#01#;
   --  Stack Pointer Bit 9
   SP9_Bit                  : constant Bit_Number := 1;
   SP9_Mask                 : constant Unsigned_8 := 16#02#;

   --  Stack Pointer Low Byte
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
   --  Pin Change Interrupt Enable
   PCIE_Bit                 : constant Bit_Number := 5;
   PCIE_Mask                : constant Unsigned_8 := 16#20#;
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
   --  Timer/Counter0 Output Compare Match B Interrupt Enable
   OCIE0B_Bit               : constant Bit_Number := 3;
   OCIE0B_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter0 Output Compare Match A Interrupt Enable
   OCIE0A_Bit               : constant Bit_Number := 4;
   OCIE0A_Mask              : constant Unsigned_8 := 16#10#;
   --  OCIE1A: Timer/Counter1 Output Compare B Interrupt Enable
   OCIE1B_Bit               : constant Bit_Number := 5;
   OCIE1B_Mask              : constant Unsigned_8 := 16#20#;
   --  OCIE1A: Timer/Counter1 Output Compare Interrupt Enable
   OCIE1A_Bit               : constant Bit_Number := 6;
   OCIE1A_Mask              : constant Unsigned_8 := 16#40#;

   --  Timer/Counter0 Interrupt Flag register
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
   --  Timer/Counter0 Output Compare Flag 0B
   OCF0B_Bit                : constant Bit_Number := 3;
   OCF0B_Mask               : constant Unsigned_8 := 16#08#;
   --  Timer/Counter0 Output Compare Flag 0A
   OCF0A_Bit                : constant Bit_Number := 4;
   OCF0A_Mask               : constant Unsigned_8 := 16#10#;
   --  Timer/Counter1 Output Compare Flag 1B
   OCF1B_Bit                : constant Bit_Number := 5;
   OCF1B_Mask               : constant Unsigned_8 := 16#20#;
   --  Timer/Counter1 Output Compare Flag 1A
   OCF1A_Bit                : constant Bit_Number := 6;
   OCF1A_Mask               : constant Unsigned_8 := 16#40#;

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
   --  Read fuse and lock bits
   RFLB_Bit                 : constant Bit_Number := 3;
   RFLB_Mask                : constant Unsigned_8 := 16#08#;
   --  Clear temporary page buffer
   CTPB_Bit                 : constant Bit_Number := 4;
   CTPB_Mask                : constant Unsigned_8 := 16#10#;

   --  MCU Control Register
   MCUCR_Addr               : constant Address    := 16#55#;
   MCUCR                    : Unsigned_8 ;
   for MCUCR'Address use MCUCR_Addr;
   pragma Volatile (MCUCR);
   MCUCR_Bits               : Bits_In_Byte;
   for MCUCR_Bits'Address use MCUCR_Addr;
   pragma Volatile (MCUCR_Bits);
   --  Interrupt Sense Control 0 Bit 0
   ISC00_Bit                : constant Bit_Number := 0;
   ISC00_Mask               : constant Unsigned_8 := 16#01#;
   --  Interrupt Sense Control 0 Bit 1
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
   --  Force Output Compare A
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
   --  Oscillatro Calibration Value Bit 7
   CAL7_Bit                 : constant Bit_Number := 7;
   CAL7_Mask                : constant Unsigned_8 := 16#80#;

   --  Timer/Counter Control Register
   TCCR1_Addr               : constant Address    := 16#50#;
   TCCR1                    : Unsigned_8 ;
   for TCCR1'Address use TCCR1_Addr;
   pragma Volatile (TCCR1);
   TCCR1_Bits               : Bits_In_Byte;
   for TCCR1_Bits'Address use TCCR1_Addr;
   pragma Volatile (TCCR1_Bits);
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
   --  Compare Output Mode, Bit 1
   COM1A0_Bit               : constant Bit_Number := 4;
   COM1A0_Mask              : constant Unsigned_8 := 16#10#;
   --  Compare Output Mode, Bit 0
   COM1A1_Bit               : constant Bit_Number := 5;
   COM1A1_Mask              : constant Unsigned_8 := 16#20#;
   --  Pulse Width Modulator Enable
   PWM1A_Bit                : constant Bit_Number := 6;
   PWM1A_Mask               : constant Unsigned_8 := 16#40#;
   --  Clear Timer/Counter on Compare Match
   CTC1_Bit                 : constant Bit_Number := 7;
   CTC1_Mask                : constant Unsigned_8 := 16#80#;

   --  Timer/Counter Register
   TCNT1_Addr               : constant Address    := 16#4f#;
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
   OCR1A_Addr               : constant Address    := 16#4e#;
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

   --  Output compare register
   OCR1C_Addr               : constant Address    := 16#4d#;
   OCR1C                    : Unsigned_8 ;
   for OCR1C'Address use OCR1C_Addr;
   pragma Volatile (OCR1C);
   OCR1C_Bits               : Bits_In_Byte;
   for OCR1C_Bits'Address use OCR1C_Addr;
   pragma Volatile (OCR1C_Bits);
   OCR1C0_Bit               : constant Bit_Number := 0;
   OCR1C0_Mask              : constant Unsigned_8 := 16#01#;
   OCR1C1_Bit               : constant Bit_Number := 1;
   OCR1C1_Mask              : constant Unsigned_8 := 16#02#;
   OCR1C2_Bit               : constant Bit_Number := 2;
   OCR1C2_Mask              : constant Unsigned_8 := 16#04#;
   OCR1C3_Bit               : constant Bit_Number := 3;
   OCR1C3_Mask              : constant Unsigned_8 := 16#08#;
   OCR1C4_Bit               : constant Bit_Number := 4;
   OCR1C4_Mask              : constant Unsigned_8 := 16#10#;
   OCR1C5_Bit               : constant Bit_Number := 5;
   OCR1C5_Mask              : constant Unsigned_8 := 16#20#;
   OCR1C6_Bit               : constant Bit_Number := 6;
   OCR1C6_Mask              : constant Unsigned_8 := 16#40#;
   OCR1C7_Bit               : constant Bit_Number := 7;
   OCR1C7_Mask              : constant Unsigned_8 := 16#80#;

   --  General Timer/Counter Control Register
   GTCCR_Addr               : constant Address    := 16#4c#;
   GTCCR                    : Unsigned_8 ;
   for GTCCR'Address use GTCCR_Addr;
   pragma Volatile (GTCCR);
   GTCCR_Bits               : Bits_In_Byte;
   for GTCCR_Bits'Address use GTCCR_Addr;
   pragma Volatile (GTCCR_Bits);
   --  Prescaler Reset Timer/Counter1 and Timer/Counter0
   PSR0_Bit                 : constant Bit_Number := 0;
   PSR0_Mask                : constant Unsigned_8 := 16#01#;
   --  Prescaler Reset Timer/Counter1
   PSR1_Bit                 : constant Bit_Number := 1;
   PSR1_Mask                : constant Unsigned_8 := 16#02#;
   --  Force Output Compare 1A
   FOC1A_Bit                : constant Bit_Number := 2;
   FOC1A_Mask               : constant Unsigned_8 := 16#04#;
   --  Force Output Compare Match 1B
   FOC1B_Bit                : constant Bit_Number := 3;
   FOC1B_Mask               : constant Unsigned_8 := 16#08#;
   --  Comparator B Output Mode
   COM1B0_Bit               : constant Bit_Number := 4;
   COM1B0_Mask              : constant Unsigned_8 := 16#10#;
   --  Comparator B Output Mode
   COM1B1_Bit               : constant Bit_Number := 5;
   COM1B1_Mask              : constant Unsigned_8 := 16#20#;
   --  Pulse Width Modulator B Enable
   PWM1B_Bit                : constant Bit_Number := 6;
   PWM1B_Mask               : constant Unsigned_8 := 16#40#;
   --  Timer/Counter Synchronization Mode
   TSM_Bit                  : constant Bit_Number := 7;
   TSM_Mask                 : constant Unsigned_8 := 16#80#;

   --  Output Compare Register
   OCR1B_Addr               : constant Address    := 16#4b#;
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

   --  Timer/Counter  Control Register A
   TCCR0A_Addr              : constant Address    := 16#4a#;
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

   --  Timer/Counter0 Output Compare Register
   OCR0A_Addr               : constant Address    := 16#49#;
   OCR0A                    : Unsigned_8 ;
   for OCR0A'Address use OCR0A_Addr;
   pragma Volatile (OCR0A);
   OCR0A_Bits               : Bits_In_Byte;
   for OCR0A_Bits'Address use OCR0A_Addr;
   pragma Volatile (OCR0A_Bits);
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
   OCR0B_Addr               : constant Address    := 16#48#;
   OCR0B                    : Unsigned_8 ;
   for OCR0B'Address use OCR0B_Addr;
   pragma Volatile (OCR0B);
   OCR0B_Bits               : Bits_In_Byte;
   for OCR0B_Bits'Address use OCR0B_Addr;
   pragma Volatile (OCR0B_Bits);

   --  PLL Control and status register
   PLLCSR_Addr              : constant Address    := 16#47#;
   PLLCSR                   : Unsigned_8 ;
   for PLLCSR'Address use PLLCSR_Addr;
   pragma Volatile (PLLCSR);
   PLLCSR_Bits              : Bits_In_Byte;
   for PLLCSR_Bits'Address use PLLCSR_Addr;
   pragma Volatile (PLLCSR_Bits);
   --  PLL Lock detector
   PLOCK_Bit                : constant Bit_Number := 0;
   PLOCK_Mask               : constant Unsigned_8 := 16#01#;
   --  PLL Enable
   PLLE_Bit                 : constant Bit_Number := 1;
   PLLE_Mask                : constant Unsigned_8 := 16#02#;
   --  PCK Enable
   PCKE_Bit                 : constant Bit_Number := 2;
   PCKE_Mask                : constant Unsigned_8 := 16#04#;
   --  Low speed mode
   LSM_Bit                  : constant Bit_Number := 7;
   LSM_Mask                 : constant Unsigned_8 := 16#80#;

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

   --  Dead time value register
   DT1A_Addr                : constant Address    := 16#45#;
   DT1A                     : Unsigned_8 ;
   for DT1A'Address use DT1A_Addr;
   pragma Volatile (DT1A);
   DT1A_Bits                : Bits_In_Byte;
   for DT1A_Bits'Address use DT1A_Addr;
   pragma Volatile (DT1A_Bits);
   DTVL0_Bit                : constant Bit_Number := 0;
   DTVL0_Mask               : constant Unsigned_8 := 16#01#;
   DTVL1_Bit                : constant Bit_Number := 1;
   DTVL1_Mask               : constant Unsigned_8 := 16#02#;
   DTVL2_Bit                : constant Bit_Number := 2;
   DTVL2_Mask               : constant Unsigned_8 := 16#04#;
   DTVL3_Bit                : constant Bit_Number := 3;
   DTVL3_Mask               : constant Unsigned_8 := 16#08#;
   DTVH0_Bit                : constant Bit_Number := 4;
   DTVH0_Mask               : constant Unsigned_8 := 16#10#;
   DTVH1_Bit                : constant Bit_Number := 5;
   DTVH1_Mask               : constant Unsigned_8 := 16#20#;
   DTVH2_Bit                : constant Bit_Number := 6;
   DTVH2_Mask               : constant Unsigned_8 := 16#40#;
   DTVH3_Bit                : constant Bit_Number := 7;
   DTVH3_Mask               : constant Unsigned_8 := 16#80#;

   --  Dead time value B
   DT1B_Addr                : constant Address    := 16#44#;
   DT1B                     : Unsigned_8 ;
   for DT1B'Address use DT1B_Addr;
   pragma Volatile (DT1B);
   DT1B_Bits                : Bits_In_Byte;
   for DT1B_Bits'Address use DT1B_Addr;
   pragma Volatile (DT1B_Bits);

   --  Dead time prescaler register
   DTPS_Addr                : constant Address    := 16#43#;
   DTPS                     : Unsigned_8 ;
   for DTPS'Address use DTPS_Addr;
   pragma Volatile (DTPS);
   DTPS_Bits                : Bits_In_Byte;
   for DTPS_Bits'Address use DTPS_Addr;
   pragma Volatile (DTPS_Bits);
   DTPS0_Bit                : constant Bit_Number := 0;
   DTPS0_Mask               : constant Unsigned_8 := 16#01#;
   DTPS1_Bit                : constant Bit_Number := 1;
   DTPS1_Mask               : constant Unsigned_8 := 16#02#;

   --  debugWire data register
   DWDR_Addr                : constant Address    := 16#42#;
   DWDR                     : Unsigned_8 ;
   for DWDR'Address use DWDR_Addr;
   pragma Volatile (DWDR);
   DWDR_Bits                : Bits_In_Byte;
   for DWDR_Bits'Address use DWDR_Addr;
   pragma Volatile (DWDR_Bits);
   DWDR0_Bit                : constant Bit_Number := 0;
   DWDR0_Mask               : constant Unsigned_8 := 16#01#;
   DWDR1_Bit                : constant Bit_Number := 1;
   DWDR1_Mask               : constant Unsigned_8 := 16#02#;
   DWDR2_Bit                : constant Bit_Number := 2;
   DWDR2_Mask               : constant Unsigned_8 := 16#04#;
   DWDR3_Bit                : constant Bit_Number := 3;
   DWDR3_Mask               : constant Unsigned_8 := 16#08#;
   DWDR4_Bit                : constant Bit_Number := 4;
   DWDR4_Mask               : constant Unsigned_8 := 16#10#;
   DWDR5_Bit                : constant Bit_Number := 5;
   DWDR5_Mask               : constant Unsigned_8 := 16#20#;
   DWDR6_Bit                : constant Bit_Number := 6;
   DWDR6_Mask               : constant Unsigned_8 := 16#40#;
   DWDR7_Bit                : constant Bit_Number := 7;
   DWDR7_Mask               : constant Unsigned_8 := 16#80#;

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

   --  Power Reduction Register
   PRR_Addr                 : constant Address    := 16#40#;
   PRR                      : Unsigned_8 ;
   for PRR'Address use PRR_Addr;
   pragma Volatile (PRR);
   PRR_Bits                 : Bits_In_Byte;
   for PRR_Bits'Address use PRR_Addr;
   pragma Volatile (PRR_Bits);
   --  Power Reduction ADC
   PRADC_Bit                : constant Bit_Number := 0;
   PRADC_Mask               : constant Unsigned_8 := 16#01#;
   --  Power Reduction USI
   PRUSI_Bit                : constant Bit_Number := 1;
   PRUSI_Mask               : constant Unsigned_8 := 16#02#;
   --  Power Reduction Timer/Counter0
   PRTIM0_Bit               : constant Bit_Number := 2;
   PRTIM0_Mask              : constant Unsigned_8 := 16#04#;
   --  Power Reduction Timer/Counter1
   PRTIM1_Bit               : constant Bit_Number := 3;
   PRTIM1_Mask              : constant Unsigned_8 := 16#08#;

   --  EEPROM Address Register High Byte
   EEARH_Addr               : constant Address    := 16#3f#;
   EEARH                    : Unsigned_8 ;
   for EEARH'Address use EEARH_Addr;
   pragma Volatile (EEARH);
   EEARH_Bits               : Bits_In_Byte;
   for EEARH_Bits'Address use EEARH_Addr;
   pragma Volatile (EEARH_Bits);
   --  EEPROM Read/Write Access Bit 0
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
   EEPE_Bit                 : constant Bit_Number := 1;
   EEPE_Mask                : constant Unsigned_8 := 16#02#;
   --  EEPROM Master Write Enable
   EEMPE_Bit                : constant Bit_Number := 2;
   EEMPE_Mask               : constant Unsigned_8 := 16#04#;
   --  EEPROM Ready Interrupt Enable
   EERIE_Bit                : constant Bit_Number := 3;
   EERIE_Mask               : constant Unsigned_8 := 16#08#;
   --  EEPROM Programming Mode Bit 0
   EEPM0_Bit                : constant Bit_Number := 4;
   EEPM0_Mask               : constant Unsigned_8 := 16#10#;
   --  EEPROM Programming Mode Bit 1
   EEPM1_Bit                : constant Bit_Number := 5;
   EEPM1_Mask               : constant Unsigned_8 := 16#20#;

   --  Data Register, Port B
   PORTB_Addr               : constant Address    := 16#38#;
   PORTB                    : Unsigned_8 ;
   for PORTB'Address use PORTB_Addr;
   pragma Volatile (PORTB);
   PORTB_Bits               : Bits_In_Byte;
   for PORTB_Bits'Address use PORTB_Addr;
   pragma Volatile (PORTB_Bits);
   PORTB0_Bit               : constant Bit_Number := 0;
   PORTB0_Mask              : constant Unsigned_8 := 16#01#;
   PORTB1_Bit               : constant Bit_Number := 1;
   PORTB1_Mask              : constant Unsigned_8 := 16#02#;
   PORTB2_Bit               : constant Bit_Number := 2;
   PORTB2_Mask              : constant Unsigned_8 := 16#04#;
   PORTB3_Bit               : constant Bit_Number := 3;
   PORTB3_Mask              : constant Unsigned_8 := 16#08#;
   PORTB4_Bit               : constant Bit_Number := 4;
   PORTB4_Mask              : constant Unsigned_8 := 16#10#;
   PORTB5_Bit               : constant Bit_Number := 5;
   PORTB5_Mask              : constant Unsigned_8 := 16#20#;

   --  Data Direction Register, Port B
   DDRB_Addr                : constant Address    := 16#37#;
   DDRB                     : Unsigned_8 ;
   for DDRB'Address use DDRB_Addr;
   pragma Volatile (DDRB);
   DDRB_Bits                : Bits_In_Byte;
   for DDRB_Bits'Address use DDRB_Addr;
   pragma Volatile (DDRB_Bits);
   DDB0_Bit                 : constant Bit_Number := 0;
   DDB0_Mask                : constant Unsigned_8 := 16#01#;
   DDB1_Bit                 : constant Bit_Number := 1;
   DDB1_Mask                : constant Unsigned_8 := 16#02#;
   DDB2_Bit                 : constant Bit_Number := 2;
   DDB2_Mask                : constant Unsigned_8 := 16#04#;
   DDB3_Bit                 : constant Bit_Number := 3;
   DDB3_Mask                : constant Unsigned_8 := 16#08#;
   DDB4_Bit                 : constant Bit_Number := 4;
   DDB4_Mask                : constant Unsigned_8 := 16#10#;
   DDB5_Bit                 : constant Bit_Number := 5;
   DDB5_Mask                : constant Unsigned_8 := 16#20#;

   --  Input Pins, Port B
   PINB_Addr                : constant Address    := 16#36#;
   PINB                     : Unsigned_8 ;
   for PINB'Address use PINB_Addr;
   pragma Volatile (PINB);
   PINB_Bits                : Bits_In_Byte;
   for PINB_Bits'Address use PINB_Addr;
   pragma Volatile (PINB_Bits);
   PINB0_Bit                : constant Bit_Number := 0;
   PINB0_Mask               : constant Unsigned_8 := 16#01#;
   PINB1_Bit                : constant Bit_Number := 1;
   PINB1_Mask               : constant Unsigned_8 := 16#02#;
   PINB2_Bit                : constant Bit_Number := 2;
   PINB2_Mask               : constant Unsigned_8 := 16#04#;
   PINB3_Bit                : constant Bit_Number := 3;
   PINB3_Mask               : constant Unsigned_8 := 16#08#;
   PINB4_Bit                : constant Bit_Number := 4;
   PINB4_Mask               : constant Unsigned_8 := 16#10#;
   PINB5_Bit                : constant Bit_Number := 5;
   PINB5_Mask               : constant Unsigned_8 := 16#20#;

   --  Pin Change Enable Mask
   PCMSK_Addr               : constant Address    := 16#35#;
   PCMSK                    : Unsigned_8 ;
   for PCMSK'Address use PCMSK_Addr;
   pragma Volatile (PCMSK);
   PCMSK_Bits               : Bits_In_Byte;
   for PCMSK_Bits'Address use PCMSK_Addr;
   pragma Volatile (PCMSK_Bits);
   --  Pin Change Enable Mask Bit 0
   PCINT0_Bit               : constant Bit_Number := 0;
   PCINT0_Mask              : constant Unsigned_8 := 16#01#;
   --  Pin Change Enable Mask Bit 1
   PCINT1_Bit               : constant Bit_Number := 1;
   PCINT1_Mask              : constant Unsigned_8 := 16#02#;
   --  Pin Change Enable Mask Bit 2
   PCINT2_Bit               : constant Bit_Number := 2;
   PCINT2_Mask              : constant Unsigned_8 := 16#04#;
   --  Pin Change Enable Mask Bit 3
   PCINT3_Bit               : constant Bit_Number := 3;
   PCINT3_Mask              : constant Unsigned_8 := 16#08#;
   --  Pin Change Enable Mask Bit 4
   PCINT4_Bit               : constant Bit_Number := 4;
   PCINT4_Mask              : constant Unsigned_8 := 16#10#;
   --  Pin Change Enable Mask Bit 5
   PCINT5_Bit               : constant Bit_Number := 5;
   PCINT5_Mask              : constant Unsigned_8 := 16#20#;

   DIDR0_Addr               : constant Address    := 16#34#;
   DIDR0                    : Unsigned_8 ;
   for DIDR0'Address use DIDR0_Addr;
   pragma Volatile (DIDR0);
   DIDR0_Bits               : Bits_In_Byte;
   for DIDR0_Bits'Address use DIDR0_Addr;
   pragma Volatile (DIDR0_Bits);
   --  AIN0 Digital Input Disable
   AIN0D_Bit                : constant Bit_Number := 0;
   AIN0D_Mask               : constant Unsigned_8 := 16#01#;
   --  AIN1 Digital Input Disable
   AIN1D_Bit                : constant Bit_Number := 1;
   AIN1D_Mask               : constant Unsigned_8 := 16#02#;
   --  ADC1 Digital input Disable
   ADC1D_Bit                : constant Bit_Number := 2;
   ADC1D_Mask               : constant Unsigned_8 := 16#04#;
   --  ADC3 Digital input Disable
   ADC3D_Bit                : constant Bit_Number := 3;
   ADC3D_Mask               : constant Unsigned_8 := 16#08#;
   --  ADC2 Digital input Disable
   ADC2D_Bit                : constant Bit_Number := 4;
   ADC2D_Mask               : constant Unsigned_8 := 16#10#;
   --  ADC0 Digital input Disable
   ADC0D_Bit                : constant Bit_Number := 5;
   ADC0D_Mask               : constant Unsigned_8 := 16#20#;

   --  General Purpose IO register 2
   GPIOR2_Addr              : constant Address    := 16#33#;
   GPIOR2                   : Unsigned_8 ;
   for GPIOR2'Address use GPIOR2_Addr;
   pragma Volatile (GPIOR2);
   GPIOR2_Bits              : Bits_In_Byte;
   for GPIOR2_Bits'Address use GPIOR2_Addr;
   pragma Volatile (GPIOR2_Bits);
   GPIOR20_Bit              : constant Bit_Number := 0;
   GPIOR20_Mask             : constant Unsigned_8 := 16#01#;
   GPIOR21_Bit              : constant Bit_Number := 1;
   GPIOR21_Mask             : constant Unsigned_8 := 16#02#;
   GPIOR22_Bit              : constant Bit_Number := 2;
   GPIOR22_Mask             : constant Unsigned_8 := 16#04#;
   GPIOR23_Bit              : constant Bit_Number := 3;
   GPIOR23_Mask             : constant Unsigned_8 := 16#08#;
   GPIOR24_Bit              : constant Bit_Number := 4;
   GPIOR24_Mask             : constant Unsigned_8 := 16#10#;
   GPIOR25_Bit              : constant Bit_Number := 5;
   GPIOR25_Mask             : constant Unsigned_8 := 16#20#;
   GPIOR26_Bit              : constant Bit_Number := 6;
   GPIOR26_Mask             : constant Unsigned_8 := 16#40#;
   GPIOR27_Bit              : constant Bit_Number := 7;
   GPIOR27_Mask             : constant Unsigned_8 := 16#80#;

   --  General Purpose register 1
   GPIOR1_Addr              : constant Address    := 16#32#;
   GPIOR1                   : Unsigned_8 ;
   for GPIOR1'Address use GPIOR1_Addr;
   pragma Volatile (GPIOR1);
   GPIOR1_Bits              : Bits_In_Byte;
   for GPIOR1_Bits'Address use GPIOR1_Addr;
   pragma Volatile (GPIOR1_Bits);
   GPIOR10_Bit              : constant Bit_Number := 0;
   GPIOR10_Mask             : constant Unsigned_8 := 16#01#;
   GPIOR11_Bit              : constant Bit_Number := 1;
   GPIOR11_Mask             : constant Unsigned_8 := 16#02#;
   GPIOR12_Bit              : constant Bit_Number := 2;
   GPIOR12_Mask             : constant Unsigned_8 := 16#04#;
   GPIOR13_Bit              : constant Bit_Number := 3;
   GPIOR13_Mask             : constant Unsigned_8 := 16#08#;
   GPIOR14_Bit              : constant Bit_Number := 4;
   GPIOR14_Mask             : constant Unsigned_8 := 16#10#;
   GPIOR15_Bit              : constant Bit_Number := 5;
   GPIOR15_Mask             : constant Unsigned_8 := 16#20#;
   GPIOR16_Bit              : constant Bit_Number := 6;
   GPIOR16_Mask             : constant Unsigned_8 := 16#40#;
   GPIOR17_Bit              : constant Bit_Number := 7;
   GPIOR17_Mask             : constant Unsigned_8 := 16#80#;

   --  General purpose register 0
   GPIOR0_Addr              : constant Address    := 16#31#;
   GPIOR0                   : Unsigned_8 ;
   for GPIOR0'Address use GPIOR0_Addr;
   pragma Volatile (GPIOR0);
   GPIOR0_Bits              : Bits_In_Byte;
   for GPIOR0_Bits'Address use GPIOR0_Addr;
   pragma Volatile (GPIOR0_Bits);
   GPIOR00_Bit              : constant Bit_Number := 0;
   GPIOR00_Mask             : constant Unsigned_8 := 16#01#;
   GPIOR01_Bit              : constant Bit_Number := 1;
   GPIOR01_Mask             : constant Unsigned_8 := 16#02#;
   GPIOR02_Bit              : constant Bit_Number := 2;
   GPIOR02_Mask             : constant Unsigned_8 := 16#04#;
   GPIOR03_Bit              : constant Bit_Number := 3;
   GPIOR03_Mask             : constant Unsigned_8 := 16#08#;
   GPIOR04_Bit              : constant Bit_Number := 4;
   GPIOR04_Mask             : constant Unsigned_8 := 16#10#;
   GPIOR05_Bit              : constant Bit_Number := 5;
   GPIOR05_Mask             : constant Unsigned_8 := 16#20#;
   GPIOR06_Bit              : constant Bit_Number := 6;
   GPIOR06_Mask             : constant Unsigned_8 := 16#40#;
   GPIOR07_Bit              : constant Bit_Number := 7;
   GPIOR07_Mask             : constant Unsigned_8 := 16#80#;

   --  USI Buffer Register
   USIBR_Addr               : constant Address    := 16#30#;
   USIBR                    : Unsigned_8 ;
   for USIBR'Address use USIBR_Addr;
   pragma Volatile (USIBR);
   USIBR_Bits               : Bits_In_Byte;
   for USIBR_Bits'Address use USIBR_Addr;
   pragma Volatile (USIBR_Bits);
   --  USI Buffer Register bit 0
   USIBR0_Bit               : constant Bit_Number := 0;
   USIBR0_Mask              : constant Unsigned_8 := 16#01#;
   --  USI Buffer Register bit 1
   USIBR1_Bit               : constant Bit_Number := 1;
   USIBR1_Mask              : constant Unsigned_8 := 16#02#;
   --  USI Buffer Register bit 2
   USIBR2_Bit               : constant Bit_Number := 2;
   USIBR2_Mask              : constant Unsigned_8 := 16#04#;
   --  USI Buffer Register bit 3
   USIBR3_Bit               : constant Bit_Number := 3;
   USIBR3_Mask              : constant Unsigned_8 := 16#08#;
   --  USI Buffer Register bit 4
   USIBR4_Bit               : constant Bit_Number := 4;
   USIBR4_Mask              : constant Unsigned_8 := 16#10#;
   --  USI Buffer Register bit 5
   USIBR5_Bit               : constant Bit_Number := 5;
   USIBR5_Mask              : constant Unsigned_8 := 16#20#;
   --  USI Buffer Register bit 6
   USIBR6_Bit               : constant Bit_Number := 6;
   USIBR6_Mask              : constant Unsigned_8 := 16#40#;
   --  USI Buffer Register bit 7
   USIBR7_Bit               : constant Bit_Number := 7;
   USIBR7_Mask              : constant Unsigned_8 := 16#80#;

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
   --  Reference Selection Bit 2
   REFS2_Bit                : constant Bit_Number := 4;
   REFS2_Mask               : constant Unsigned_8 := 16#10#;
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
   ADCSRA_Addr              : constant Address    := 16#26#;
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

   --  ADC Control and Status Register B
   ADCSRB_Addr              : constant Address    := 16#23#;
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
   --  Input Polarity Mode
   IPR_Bit                  : constant Bit_Number := 5;
   IPR_Mask                 : constant Unsigned_8 := 16#20#;
   --  Analog Comparator Multiplexer Enable
   ACME_Bit                 : constant Bit_Number := 6;
   ACME_Mask                : constant Unsigned_8 := 16#40#;
   --  Bipolar Input Mode
   BIN_Bit                  : constant Bit_Number := 7;
   BIN_Mask                 : constant Unsigned_8 := 16#80#;



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


end AVR.ATtiny85;
