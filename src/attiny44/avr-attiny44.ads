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

package AVR.ATtiny44 is
   pragma Preelaborate;

   CVS_Version : constant String := "$Id: avr-attiny44.ads 881 2008-11-16 22:55:31Z Rolf_Ebert $";


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

   --  External Pin, Power-on Reset, Brown-out Reset,Watchdog Reset
   Sig_RESET                : constant        :=  0;
   Sig_RESET_String         : constant String := "__vector_0";
   --  External Interrupt Request 0
   Sig_EXT_INT0             : constant        :=  1;
   Sig_EXT_INT0_String      : constant String := "__vector_1";
   --  Pin Change Interrupt Request 0
   Sig_PCINT0               : constant        :=  2;
   Sig_PCINT0_String        : constant String := "__vector_2";
   --  Pin Change Interrupt Request 1
   Sig_PCINT1               : constant        :=  3;
   Sig_PCINT1_String        : constant String := "__vector_3";
   --  Watchdog Time-out
   Sig_WATCHDOG             : constant        :=  4;
   Sig_WATCHDOG_String      : constant String := "__vector_4";
   --  Timer/Counter1 Capture Event
   Sig_TIM1_CAPT            : constant        :=  5;
   Sig_TIM1_CAPT_String     : constant String := "__vector_5";
   --  Timer/Counter1 Compare Match A
   Sig_TIM1_COMPA           : constant        :=  6;
   Sig_TIM1_COMPA_String    : constant String := "__vector_6";
   --  Timer/Counter1 Compare Match B
   Sig_TIM1_COMPB           : constant        :=  7;
   Sig_TIM1_COMPB_String    : constant String := "__vector_7";
   --  Timer/Counter1 Overflow
   Sig_TIM1_OVF             : constant        :=  8;
   Sig_TIM1_OVF_String      : constant String := "__vector_8";
   --  Timer/Counter0 Compare Match A
   Sig_TIM0_COMPA           : constant        :=  9;
   Sig_TIM0_COMPA_String    : constant String := "__vector_9";
   --  Timer/Counter0 Compare Match B
   Sig_TIM0_COMPB           : constant        := 10;
   Sig_TIM0_COMPB_String    : constant String := "__vector_10";
   --  Timer/Counter0 Overflow
   Sig_TIM0_OVF             : constant        := 11;
   Sig_TIM0_OVF_String      : constant String := "__vector_11";
   --  Analog Comparator
   Sig_ANA_COMP             : constant        := 12;
   Sig_ANA_COMP_String      : constant String := "__vector_12";
   --  ADC Conversion Complete
   Sig_ADC                  : constant        := 13;
   Sig_ADC_String           : constant String := "__vector_13";
   --  EEPROM Ready
   Sig_EE_RDY               : constant        := 14;
   Sig_EE_RDY_String        : constant String := "__vector_14";
   --  USI START
   Sig_USI_STR              : constant        := 15;
   Sig_USI_STR_String       : constant String := "__vector_15";
   --  USI Overflow
   Sig_USI_OVF              : constant        := 16;
   Sig_USI_OVF_String       : constant String := "__vector_16";


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

   --  Timer/Counter0 Output Compare Register B
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
   --  Pin Change Interrupt Flag 0
   PCIF0_Bit                : constant Bit_Number := 4;
   PCIF0_Mask               : constant Unsigned_8 := 16#10#;
   --  Pin Change Interrupt Flag 1
   PCIF1_Bit                : constant Bit_Number := 5;
   PCIF1_Mask               : constant Unsigned_8 := 16#20#;
   --  External Interrupt Flag 0
   INTF0_Bit                : constant Bit_Number := 6;
   INTF0_Mask               : constant Unsigned_8 := 16#40#;

   --  Timer/Counter Interrupt Mask Register
   TIMSK0_Addr              : constant Address    := 16#59#;
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

   --  Timer/Counter0 Interrupt Flag Register
   TIFR0_Addr               : constant Address    := 16#58#;
   TIFR0                    : Unsigned_8 ;
   for TIFR0'Address use TIFR0_Addr;
   pragma Volatile (TIFR0);
   TIFR0_Bits               : Bits_In_Byte;
   for TIFR0_Bits'Address use TIFR0_Addr;
   pragma Volatile (TIFR0_Bits);
   --  Timer/Counter0 Overflow Flag
   TOV0_Bit                 : constant Bit_Number := 0;
   TOV0_Mask                : constant Unsigned_8 := 16#01#;
   --  Timer/Counter0 Output Compare Flag A
   OCF0A_Bit                : constant Bit_Number := 1;
   OCF0A_Mask               : constant Unsigned_8 := 16#02#;
   --  Timer/Counter0 Output Compare Flag B
   OCF0B_Bit                : constant Bit_Number := 2;
   OCF0B_Mask               : constant Unsigned_8 := 16#04#;

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

   --  Timer/Counter0 Output Compare Register A
   OCR0A_Addr               : constant Address    := 16#56#;
   OCR0A                    : Unsigned_8 ;
   for OCR0A'Address use OCR0A_Addr;
   pragma Volatile (OCR0A);
   OCR0A_Bits               : Bits_In_Byte;
   for OCR0A_Bits'Address use OCR0A_Addr;
   pragma Volatile (OCR0A_Bits);

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
   PUD_Bit                  : constant Bit_Number := 6;
   PUD_Mask                 : constant Unsigned_8 := 16#40#;

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

   --  Timer/Counter Control Register B
   TCCR0B_Addr              : constant Address    := 16#53#;
   TCCR0B                   : Unsigned_8 ;
   for TCCR0B'Address use TCCR0B_Addr;
   pragma Volatile (TCCR0B);
   TCCR0B_Bits              : Bits_In_Byte;
   for TCCR0B_Bits'Address use TCCR0B_Addr;
   pragma Volatile (TCCR0B_Bits);
   --  Clock Select bit 0
   CS00_Bit                 : constant Bit_Number := 0;
   CS00_Mask                : constant Unsigned_8 := 16#01#;
   --  Clock Select bit 1
   CS01_Bit                 : constant Bit_Number := 1;
   CS01_Mask                : constant Unsigned_8 := 16#02#;
   --  Clock Select bit 2
   CS02_Bit                 : constant Bit_Number := 2;
   CS02_Mask                : constant Unsigned_8 := 16#04#;
   --  Waveform Generation Mode bit 2
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

   --  Oscillator Calibration Value
   OSCCAL_Addr              : constant Address    := 16#51#;
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
   --  Oscillator Calibration Value Bit7
   CAL7_Bit                 : constant Bit_Number := 7;
   CAL7_Mask                : constant Unsigned_8 := 16#80#;

   --  Timer/Counter  Control Register A
   TCCR0A_Addr              : constant Address    := 16#50#;
   TCCR0A                   : Unsigned_8 ;
   for TCCR0A'Address use TCCR0A_Addr;
   pragma Volatile (TCCR0A);
   TCCR0A_Bits              : Bits_In_Byte;
   for TCCR0A_Bits'Address use TCCR0A_Addr;
   pragma Volatile (TCCR0A_Bits);
   --  Waveform Generation Mode bit 0
   WGM00_Bit                : constant Bit_Number := 0;
   WGM00_Mask               : constant Unsigned_8 := 16#01#;
   --  Waveform Generation Mode bit 1
   WGM01_Bit                : constant Bit_Number := 1;
   WGM01_Mask               : constant Unsigned_8 := 16#02#;
   --  Compare Match Output B Mode bit 0
   COM0B0_Bit               : constant Bit_Number := 4;
   COM0B0_Mask              : constant Unsigned_8 := 16#10#;
   --  Compare Match Output B Mode bit 1
   COM0B1_Bit               : constant Bit_Number := 5;
   COM0B1_Mask              : constant Unsigned_8 := 16#20#;
   --  Compare Match Output A Mode bit 0
   COM0A0_Bit               : constant Bit_Number := 6;
   COM0A0_Mask              : constant Unsigned_8 := 16#40#;
   --  Compare Match Output A Mode bit 1
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

   --  Timer/Counter1 Output Compare Register A High Byte
   OCR1AH_Addr              : constant Address    := 16#4b#;
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

   --  Timer/Counter1 Output Compare Register A Low Byte
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

   --  Timer/Counter1 Output Compare Register B High Byte
   OCR1BH_Addr              : constant Address    := 16#49#;
   OCR1BH                   : Unsigned_8 ;
   for OCR1BH'Address use OCR1BH_Addr;
   pragma Volatile (OCR1BH);
   OCR1BH_Bits              : Bits_In_Byte;
   for OCR1BH_Bits'Address use OCR1BH_Addr;
   pragma Volatile (OCR1BH_Bits);

   --  Timer/Counter1 Output Compare Register B Low Byte
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

   DWDR_Addr                : constant Address    := 16#47#;
   DWDR                     : Unsigned_8 ;
   for DWDR'Address use DWDR_Addr;
   pragma Volatile (DWDR);
   DWDR_Bits                : Bits_In_Byte;
   for DWDR_Bits'Address use DWDR_Addr;
   pragma Volatile (DWDR_Bits);

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

   --  General Timer/Counter Control Register
   GTCCR_Addr               : constant Address    := 16#43#;
   GTCCR                    : Unsigned_8 ;
   for GTCCR'Address use GTCCR_Addr;
   pragma Volatile (GTCCR);
   GTCCR_Bits               : Bits_In_Byte;
   for GTCCR_Bits'Address use GTCCR_Addr;
   pragma Volatile (GTCCR_Bits);
   --  Prescaler Reset Timer/CounterN
   PSR10_Bit                : constant Bit_Number := 0;
   PSR10_Mask               : constant Unsigned_8 := 16#01#;
   --  Timer/Counter Synchronization Mode
   TSM_Bit                  : constant Bit_Number := 7;
   TSM_Mask                 : constant Unsigned_8 := 16#80#;

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
   WDTCSR_Addr              : constant Address    := 16#41#;
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

   --  Pin Change Enable Mask 1
   PCMSK1_Addr              : constant Address    := 16#40#;
   PCMSK1                   : Unsigned_8 ;
   for PCMSK1'Address use PCMSK1_Addr;
   pragma Volatile (PCMSK1);
   PCMSK1_Bits              : Bits_In_Byte;
   for PCMSK1_Bits'Address use PCMSK1_Addr;
   pragma Volatile (PCMSK1_Bits);
   --  Pin Change Enable Mask Bit 8
   PCINT8_Bit               : constant Bit_Number := 0;
   PCINT8_Mask              : constant Unsigned_8 := 16#01#;
   --  Pin Change Enable Mask Bit 9
   PCINT9_Bit               : constant Bit_Number := 1;
   PCINT9_Mask              : constant Unsigned_8 := 16#02#;
   --  Pin Change Enable Mask Bit 10
   PCINT10_Bit              : constant Bit_Number := 2;
   PCINT10_Mask             : constant Unsigned_8 := 16#04#;
   --  Pin Change Enable Mask Bit 11
   PCINT11_Bit              : constant Bit_Number := 3;
   PCINT11_Mask             : constant Unsigned_8 := 16#08#;

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

   --  General Purpose I/O Register 2
   GPIOR2_Addr              : constant Address    := 16#35#;
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

   --  General Purpose I/O Register 1
   GPIOR1_Addr              : constant Address    := 16#34#;
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

   --  General Purpose I/O Register 0
   GPIOR0_Addr              : constant Address    := 16#33#;
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

   --  Pin Change Enable Mask 0
   PCMSK0_Addr              : constant Address    := 16#32#;
   PCMSK0                   : Unsigned_8 ;
   for PCMSK0'Address use PCMSK0_Addr;
   pragma Volatile (PCMSK0);
   PCMSK0_Bits              : Bits_In_Byte;
   for PCMSK0_Bits'Address use PCMSK0_Addr;
   pragma Volatile (PCMSK0_Bits);
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
   --  Pin Change Enable Mask Bit 6
   PCINT6_Bit               : constant Bit_Number := 6;
   PCINT6_Mask              : constant Unsigned_8 := 16#40#;
   --  Pin Change Enable Mask Bit 7
   PCINT7_Bit               : constant Bit_Number := 7;
   PCINT7_Mask              : constant Unsigned_8 := 16#80#;

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

   --  Timer/Counter1 Interrupt Mask Register
   TIMSK1_Addr              : constant Address    := 16#2c#;
   TIMSK1                   : Unsigned_8 ;
   for TIMSK1'Address use TIMSK1_Addr;
   pragma Volatile (TIMSK1);
   TIMSK1_Bits              : Bits_In_Byte;
   for TIMSK1_Bits'Address use TIMSK1_Addr;
   pragma Volatile (TIMSK1_Bits);
   --  Timer/Counter1 Overflow Interrupt Enable
   TOIE1_Bit                : constant Bit_Number := 0;
   TOIE1_Mask               : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Output Compare A Match Interrupt Enable
   OCIE1A_Bit               : constant Bit_Number := 1;
   OCIE1A_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Output Compare B Match Interrupt Enable
   OCIE1B_Bit               : constant Bit_Number := 2;
   OCIE1B_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Input Capture Interrupt Enable
   ICIE1_Bit                : constant Bit_Number := 5;
   ICIE1_Mask               : constant Unsigned_8 := 16#20#;

   --  Timer/Counter Interrupt Flag register
   TIFR1_Addr               : constant Address    := 16#2b#;
   TIFR1                    : Unsigned_8 ;
   for TIFR1'Address use TIFR1_Addr;
   pragma Volatile (TIFR1);
   TIFR1_Bits               : Bits_In_Byte;
   for TIFR1_Bits'Address use TIFR1_Addr;
   pragma Volatile (TIFR1_Bits);
   --  Timer/Counter1 Overflow Flag
   TOV1_Bit                 : constant Bit_Number := 0;
   TOV1_Mask                : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Output Compare A Match Flag
   OCF1A_Bit                : constant Bit_Number := 1;
   OCF1A_Mask               : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Output Compare B Match Flag
   OCF1B_Bit                : constant Bit_Number := 2;
   OCF1B_Mask               : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Input Capture Flag
   ICF1_Bit                 : constant Bit_Number := 5;
   ICF1_Mask                : constant Unsigned_8 := 16#20#;

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
   --  Analog Compare Output
   ACO_Bit                  : constant Bit_Number := 5;
   ACO_Mask                 : constant Unsigned_8 := 16#20#;
   --  Analog Comparator Bandgap Select
   ACBG_Bit                 : constant Bit_Number := 6;
   ACBG_Mask                : constant Unsigned_8 := 16#40#;
   --  Analog Comparator Disable
   ACD_Bit                  : constant Bit_Number := 7;
   ACD_Mask                 : constant Unsigned_8 := 16#80#;

   --  ADC Multiplexer Selection Register
   ADMUX_Addr               : constant Address    := 16#27#;
   ADMUX                    : Unsigned_8 ;
   for ADMUX'Address use ADMUX_Addr;
   pragma Volatile (ADMUX);
   ADMUX_Bits               : Bits_In_Byte;
   for ADMUX_Bits'Address use ADMUX_Addr;
   pragma Volatile (ADMUX_Bits);
   --  Analog Channel and Gain Selection Bit 0
   MUX0_Bit                 : constant Bit_Number := 0;
   MUX0_Mask                : constant Unsigned_8 := 16#01#;
   --  Analog Channel and Gain Selection Bit 1
   MUX1_Bit                 : constant Bit_Number := 1;
   MUX1_Mask                : constant Unsigned_8 := 16#02#;
   --  Analog Channel and Gain Selection Bit 2
   MUX2_Bit                 : constant Bit_Number := 2;
   MUX2_Mask                : constant Unsigned_8 := 16#04#;
   --  Analog Channel and Gain Selection Bit 3
   MUX3_Bit                 : constant Bit_Number := 3;
   MUX3_Mask                : constant Unsigned_8 := 16#08#;
   --  Analog Channel and Gain Selection Bit 4
   MUX4_Bit                 : constant Bit_Number := 4;
   MUX4_Mask                : constant Unsigned_8 := 16#10#;
   --  Analog Channel and Gain Selection Bit 5
   MUX5_Bit                 : constant Bit_Number := 5;
   MUX5_Mask                : constant Unsigned_8 := 16#20#;
   --  Reference Selection Bit 0
   REFS0_Bit                : constant Bit_Number := 6;
   REFS0_Mask               : constant Unsigned_8 := 16#40#;
   --  Reference Selection Bit 1
   REFS1_Bit                : constant Bit_Number := 7;
   REFS1_Mask               : constant Unsigned_8 := 16#80#;

   --  ADC Control and Status Register A
   ADCSRA_Addr              : constant Address    := 16#26#;
   ADCSRA                   : Unsigned_8 ;
   for ADCSRA'Address use ADCSRA_Addr;
   pragma Volatile (ADCSRA);
   ADCSRA_Bits              : Bits_In_Byte;
   for ADCSRA_Bits'Address use ADCSRA_Addr;
   pragma Volatile (ADCSRA_Bits);
   --  ADC  Prescaler Select Bit 0
   ADPS0_Bit                : constant Bit_Number := 0;
   ADPS0_Mask               : constant Unsigned_8 := 16#01#;
   --  ADC  Prescaler Select Bit 1
   ADPS1_Bit                : constant Bit_Number := 1;
   ADPS1_Mask               : constant Unsigned_8 := 16#02#;
   --  ADC  Prescaler Select Bit 2
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
   --  ADC Auto Trigger Source bit 0
   ADTS0_Bit                : constant Bit_Number := 0;
   ADTS0_Mask               : constant Unsigned_8 := 16#01#;
   --  ADC Auto Trigger Source bit 1
   ADTS1_Bit                : constant Bit_Number := 1;
   ADTS1_Mask               : constant Unsigned_8 := 16#02#;
   --  ADC Auto Trigger Source bit 2
   ADTS2_Bit                : constant Bit_Number := 2;
   ADTS2_Mask               : constant Unsigned_8 := 16#04#;
   --  ADC Left Adjust Result
   ADLAR_Bit                : constant Bit_Number := 4;
   ADLAR_Mask               : constant Unsigned_8 := 16#10#;
   --  Analog Comparator Multiplexer Enable
   ACME_Bit                 : constant Bit_Number := 6;
   ACME_Mask                : constant Unsigned_8 := 16#40#;
   --  Bipolar Input Mode
   BIN_Bit                  : constant Bit_Number := 7;
   BIN_Mask                 : constant Unsigned_8 := 16#80#;

   DIDR0_Addr               : constant Address    := 16#21#;
   DIDR0                    : Unsigned_8 ;
   for DIDR0'Address use DIDR0_Addr;
   pragma Volatile (DIDR0);
   DIDR0_Bits               : Bits_In_Byte;
   for DIDR0_Bits'Address use DIDR0_Addr;
   pragma Volatile (DIDR0_Bits);
   --  ADC 0 Digital input buffer disable
   ADC0D_Bit                : constant Bit_Number := 0;
   ADC0D_Mask               : constant Unsigned_8 := 16#01#;
   --  ADC 1 Digital input buffer disable
   ADC1D_Bit                : constant Bit_Number := 1;
   ADC1D_Mask               : constant Unsigned_8 := 16#02#;
   --  ADC2 Digital Input Disable
   ADC2D_Bit                : constant Bit_Number := 2;
   ADC2D_Mask               : constant Unsigned_8 := 16#04#;
   --  ADC3 Digital Input Disable
   ADC3D_Bit                : constant Bit_Number := 3;
   ADC3D_Mask               : constant Unsigned_8 := 16#08#;
   --  ADC4 Digital Input Disable
   ADC4D_Bit                : constant Bit_Number := 4;
   ADC4D_Mask               : constant Unsigned_8 := 16#10#;
   --  ADC5 Digital Input Disable
   ADC5D_Bit                : constant Bit_Number := 5;
   ADC5D_Mask               : constant Unsigned_8 := 16#20#;
   --  ADC6 Digital Input Disable
   ADC6D_Bit                : constant Bit_Number := 6;
   ADC6D_Mask               : constant Unsigned_8 := 16#40#;
   --  ADC7 Digital Input Disable
   ADC7D_Bit                : constant Bit_Number := 7;
   ADC7D_Mask               : constant Unsigned_8 := 16#80#;

   --  Power Reduction Register
   PRR_Addr                 : constant Address    := 16#20#;
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


end AVR.ATtiny44;
