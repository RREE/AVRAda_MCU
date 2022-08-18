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

package AVR.ATtiny24 is
   pragma Pure (AVR.ATtiny24);

   CVS_Version : constant String := "$Id: avr-attiny24.ads 881 2008-11-16 22:55:31Z Rolf_Ebert $";


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
   Number_Of_Interrupts     : constant := 17;

   --  External Pin, Power-on Reset, Brown-out Reset,Watchdog Reset
   Sig_RESET                : constant        :=  0;
   Sig_RESET_String         : constant String := "__vector_0";
   --  External Interrupt Request 0
   Sig_INT0                 : constant        :=  1;
   Sig_INT0_String          : constant String := "__vector_1";
   --  Pin Change Interrupt Request 0
   Sig_PCINT0               : constant        :=  2;
   Sig_PCINT0_String        : constant String := "__vector_2";
   --  Pin Change Interrupt Request 1
   Sig_PCINT1               : constant        :=  3;
   Sig_PCINT1_String        : constant String := "__vector_3";
   --  Watchdog Time-out
   Sig_WDT                  : constant        :=  4;
   Sig_WDT_String           : constant String := "__vector_4";
   --  Timer/Counter1 Capture Event
   Sig_TIMER1_CAPT          : constant        :=  5;
   Sig_TIMER1_CAPT_String   : constant String := "__vector_5";
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
   Sig_USI_START            : constant        := 15;
   Sig_USI_START_String     : constant String := "__vector_15";
   --  USI Overflow
   Sig_USI_OVF              : constant        := 16;
   Sig_USI_OVF_String       : constant String := "__vector_16";


   --
   --  I/O registers
   --

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

   --  Timer/Counter0 Output Compare Register B
   OCR0B                    : constant System.Address := 16#5c#;
   OCR0_0_Bit               : constant Bit_Number := 0;
   OCR0_0                   : constant Nat8       := 16#01#;
   OCR0_1_Bit               : constant Bit_Number := 1;
   OCR0_1                   : constant Nat8       := 16#02#;
   OCR0_2_Bit               : constant Bit_Number := 2;
   OCR0_2                   : constant Nat8       := 16#04#;
   OCR0_3_Bit               : constant Bit_Number := 3;
   OCR0_3                   : constant Nat8       := 16#08#;
   OCR0_4_Bit               : constant Bit_Number := 4;
   OCR0_4                   : constant Nat8       := 16#10#;
   OCR0_5_Bit               : constant Bit_Number := 5;
   OCR0_5                   : constant Nat8       := 16#20#;
   OCR0_6_Bit               : constant Bit_Number := 6;
   OCR0_6                   : constant Nat8       := 16#40#;
   OCR0_7_Bit               : constant Bit_Number := 7;
   OCR0_7                   : constant Nat8       := 16#80#;

   --  General Interrupt Mask Register
   GIMSK                    : constant System.Address := 16#5b#;
   --  Pin Change Interrupt Enable 0
   PCIE0_Bit                : constant Bit_Number := 4;
   PCIE0                    : constant Nat8       := 16#10#;
   --  Pin Change Interrupt Enable 1
   PCIE1_Bit                : constant Bit_Number := 5;
   PCIE1                    : constant Nat8       := 16#20#;
   --  External Interrupt Request 0 Enable
   INT0_Bit                 : constant Bit_Number := 6;
   INT0                     : constant Nat8       := 16#40#;

   --  General Interrupt Flag register
   GIFR                     : constant System.Address := 16#5a#;
   --  Pin Change Interrupt Flag 0
   PCIF0_Bit                : constant Bit_Number := 4;
   PCIF0                    : constant Nat8       := 16#10#;
   --  Pin Change Interrupt Flag 1
   PCIF1_Bit                : constant Bit_Number := 5;
   PCIF1                    : constant Nat8       := 16#20#;
   --  External Interrupt Flag 0
   INTF0_Bit                : constant Bit_Number := 6;
   INTF0                    : constant Nat8       := 16#40#;

   --  Timer/Counter Interrupt Mask Register
   TIMSK0                   : constant System.Address := 16#59#;
   --  Timer/Counter0 Overflow Interrupt Enable
   TOIE0_Bit                : constant Bit_Number := 0;
   TOIE0                    : constant Nat8       := 16#01#;
   --  Timer/Counter0 Output Compare Match A Interrupt Enable
   OCIE0A_Bit               : constant Bit_Number := 1;
   OCIE0A                   : constant Nat8       := 16#02#;
   --  Timer/Counter0 Output Compare Match B Interrupt Enable
   OCIE0B_Bit               : constant Bit_Number := 2;
   OCIE0B                   : constant Nat8       := 16#04#;

   --  Timer/Counter0 Interrupt Flag Register
   TIFR0                    : constant System.Address := 16#58#;
   --  Timer/Counter0 Overflow Flag
   TOV0_Bit                 : constant Bit_Number := 0;
   TOV0                     : constant Nat8       := 16#01#;
   --  Timer/Counter0 Output Compare Flag A
   OCF0A_Bit                : constant Bit_Number := 1;
   OCF0A                    : constant Nat8       := 16#02#;
   --  Timer/Counter0 Output Compare Flag B
   OCF0B_Bit                : constant Bit_Number := 2;
   OCF0B                    : constant Nat8       := 16#04#;

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
   --  Read fuse and lock bits
   RFLB_Bit                 : constant Bit_Number := 3;
   RFLB                     : constant Nat8       := 16#08#;
   --  Clear temporary page buffer
   CTPB_Bit                 : constant Bit_Number := 4;
   CTPB                     : constant Nat8       := 16#10#;

   --  Timer/Counter0 Output Compare Register A
   OCR0A                    : constant System.Address := 16#56#;

   --  MCU Control Register
   MCUCR                    : constant System.Address := 16#55#;
   --  Interrupt Sense Control 0 Bit 0
   ISC00_Bit                : constant Bit_Number := 0;
   ISC00                    : constant Nat8       := 16#01#;
   --  Interrupt Sense Control 0 Bit 1
   ISC01_Bit                : constant Bit_Number := 1;
   ISC01                    : constant Nat8       := 16#02#;
   --  Sleep Mode Select Bit 0
   SM0_Bit                  : constant Bit_Number := 3;
   SM0                      : constant Nat8       := 16#08#;
   --  Sleep Mode Select Bit 1
   SM1_Bit                  : constant Bit_Number := 4;
   SM1                      : constant Nat8       := 16#10#;
   --  Sleep Enable
   SE_Bit                   : constant Bit_Number := 5;
   SE                       : constant Nat8       := 16#20#;
   PUD_Bit                  : constant Bit_Number := 6;
   PUD                      : constant Nat8       := 16#40#;

   --  MCU Status Register
   MCUSR                    : constant System.Address := 16#54#;
   --  Power-on reset flag
   PORF_Bit                 : constant Bit_Number := 0;
   PORF                     : constant Nat8       := 16#01#;
   --  External Reset Flag
   EXTRF_Bit                : constant Bit_Number := 1;
   EXTRF                    : constant Nat8       := 16#02#;
   --  Brown-out Reset Flag
   BORF_Bit                 : constant Bit_Number := 2;
   BORF                     : constant Nat8       := 16#04#;
   --  Watchdog Reset Flag
   WDRF_Bit                 : constant Bit_Number := 3;
   WDRF                     : constant Nat8       := 16#08#;

   --  Timer/Counter Control Register B
   TCCR0B                   : constant System.Address := 16#53#;
   --  Clock Select bit 0
   CS00_Bit                 : constant Bit_Number := 0;
   CS00                     : constant Nat8       := 16#01#;
   --  Clock Select bit 1
   CS01_Bit                 : constant Bit_Number := 1;
   CS01                     : constant Nat8       := 16#02#;
   --  Clock Select bit 2
   CS02_Bit                 : constant Bit_Number := 2;
   CS02                     : constant Nat8       := 16#04#;
   --  Waveform Generation Mode bit 2
   WGM02_Bit                : constant Bit_Number := 3;
   WGM02                    : constant Nat8       := 16#08#;
   --  Force Output Compare B
   FOC0B_Bit                : constant Bit_Number := 6;
   FOC0B                    : constant Nat8       := 16#40#;
   --  Force Output Compare A
   FOC0A_Bit                : constant Bit_Number := 7;
   FOC0A                    : constant Nat8       := 16#80#;

   --  Timer/Counter0
   TCNT0                    : constant System.Address := 16#52#;
   TCNT0_0_Bit              : constant Bit_Number := 0;
   TCNT0_0                  : constant Nat8       := 16#01#;
   TCNT0_1_Bit              : constant Bit_Number := 1;
   TCNT0_1                  : constant Nat8       := 16#02#;
   TCNT0_2_Bit              : constant Bit_Number := 2;
   TCNT0_2                  : constant Nat8       := 16#04#;
   TCNT0_3_Bit              : constant Bit_Number := 3;
   TCNT0_3                  : constant Nat8       := 16#08#;
   TCNT0_4_Bit              : constant Bit_Number := 4;
   TCNT0_4                  : constant Nat8       := 16#10#;
   TCNT0_5_Bit              : constant Bit_Number := 5;
   TCNT0_5                  : constant Nat8       := 16#20#;
   TCNT0_6_Bit              : constant Bit_Number := 6;
   TCNT0_6                  : constant Nat8       := 16#40#;
   TCNT0_7_Bit              : constant Bit_Number := 7;
   TCNT0_7                  : constant Nat8       := 16#80#;

   --  Oscillator Calibration Value
   OSCCAL                   : constant System.Address := 16#51#;
   --  Oscillator Calibration Value Bit0
   CAL0_Bit                 : constant Bit_Number := 0;
   CAL0                     : constant Nat8       := 16#01#;
   --  Oscillator Calibration Value Bit1
   CAL1_Bit                 : constant Bit_Number := 1;
   CAL1                     : constant Nat8       := 16#02#;
   --  Oscillator Calibration Value Bit2
   CAL2_Bit                 : constant Bit_Number := 2;
   CAL2                     : constant Nat8       := 16#04#;
   --  Oscillator Calibration Value Bit3
   CAL3_Bit                 : constant Bit_Number := 3;
   CAL3                     : constant Nat8       := 16#08#;
   --  Oscillator Calibration Value Bit4
   CAL4_Bit                 : constant Bit_Number := 4;
   CAL4                     : constant Nat8       := 16#10#;
   --  Oscillator Calibration Value Bit5
   CAL5_Bit                 : constant Bit_Number := 5;
   CAL5                     : constant Nat8       := 16#20#;
   --  Oscillator Calibration Value Bit6
   CAL6_Bit                 : constant Bit_Number := 6;
   CAL6                     : constant Nat8       := 16#40#;
   --  Oscillator Calibration Value Bit7
   CAL7_Bit                 : constant Bit_Number := 7;
   CAL7                     : constant Nat8       := 16#80#;

   --  Timer/Counter  Control Register A
   TCCR0A                   : constant System.Address := 16#50#;
   --  Waveform Generation Mode bit 0
   WGM00_Bit                : constant Bit_Number := 0;
   WGM00                    : constant Nat8       := 16#01#;
   --  Waveform Generation Mode bit 1
   WGM01_Bit                : constant Bit_Number := 1;
   WGM01                    : constant Nat8       := 16#02#;
   --  Compare Match Output B Mode bit 0
   COM0B0_Bit               : constant Bit_Number := 4;
   COM0B0                   : constant Nat8       := 16#10#;
   --  Compare Match Output B Mode bit 1
   COM0B1_Bit               : constant Bit_Number := 5;
   COM0B1                   : constant Nat8       := 16#20#;
   --  Compare Match Output A Mode bit 0
   COM0A0_Bit               : constant Bit_Number := 6;
   COM0A0                   : constant Nat8       := 16#40#;
   --  Compare Match Output A Mode bit 1
   COM0A1_Bit               : constant Bit_Number := 7;
   COM0A1                   : constant Nat8       := 16#80#;

   --  Timer/Counter1 Control Register A
   TCCR1A                   : constant System.Address := 16#4f#;
   --  Pulse Width Modulator Select Bit 0
   WGM10_Bit                : constant Bit_Number := 0;
   WGM10                    : constant Nat8       := 16#01#;
   --  Pulse Width Modulator Select Bit 1
   WGM11_Bit                : constant Bit_Number := 1;
   WGM11                    : constant Nat8       := 16#02#;
   --  Comparet Ouput Mode 1B, bit 0
   COM1B0_Bit               : constant Bit_Number := 4;
   COM1B0                   : constant Nat8       := 16#10#;
   --  Compare Output Mode 1B, bit 1
   COM1B1_Bit               : constant Bit_Number := 5;
   COM1B1                   : constant Nat8       := 16#20#;
   --  Comparet Ouput Mode 1A, bit 0
   COM1A0_Bit               : constant Bit_Number := 6;
   COM1A0                   : constant Nat8       := 16#40#;
   --  Compare Output Mode 1A, bit 1
   COM1A1_Bit               : constant Bit_Number := 7;
   COM1A1                   : constant Nat8       := 16#80#;

   --  Timer/Counter1 Control Register B
   TCCR1B                   : constant System.Address := 16#4e#;
   --  Clock Select bit 0
   CS10_Bit                 : constant Bit_Number := 0;
   CS10                     : constant Nat8       := 16#01#;
   --  Clock Select 1 bit 1
   CS11_Bit                 : constant Bit_Number := 1;
   CS11                     : constant Nat8       := 16#02#;
   --  Clock Select1 bit 2
   CS12_Bit                 : constant Bit_Number := 2;
   CS12                     : constant Nat8       := 16#04#;
   --  Waveform Generation Mode Bit 2
   WGM12_Bit                : constant Bit_Number := 3;
   WGM12                    : constant Nat8       := 16#08#;
   --  Waveform Generation Mode Bit 3
   WGM13_Bit                : constant Bit_Number := 4;
   WGM13                    : constant Nat8       := 16#10#;
   --  Input Capture 1 Edge Select
   ICES1_Bit                : constant Bit_Number := 6;
   ICES1                    : constant Nat8       := 16#40#;
   --  Input Capture 1 Noise Canceler
   ICNC1_Bit                : constant Bit_Number := 7;
   ICNC1                    : constant Nat8       := 16#80#;

   --  Timer/Counter1 High Nat8
   TCNT1H                   : constant System.Address := 16#4d#;
   --  Timer/Counter1 High Nat8 bit 0
   TCNT1H0_Bit              : constant Bit_Number := 0;
   TCNT1H0                  : constant Nat8       := 16#01#;
   --  Timer/Counter1 High Nat8 bit 1
   TCNT1H1_Bit              : constant Bit_Number := 1;
   TCNT1H1                  : constant Nat8       := 16#02#;
   --  Timer/Counter1 High Nat8 bit 2
   TCNT1H2_Bit              : constant Bit_Number := 2;
   TCNT1H2                  : constant Nat8       := 16#04#;
   --  Timer/Counter1 High Nat8 bit 3
   TCNT1H3_Bit              : constant Bit_Number := 3;
   TCNT1H3                  : constant Nat8       := 16#08#;
   --  Timer/Counter1 High Nat8 bit 4
   TCNT1H4_Bit              : constant Bit_Number := 4;
   TCNT1H4                  : constant Nat8       := 16#10#;
   --  Timer/Counter1 High Nat8 bit 5
   TCNT1H5_Bit              : constant Bit_Number := 5;
   TCNT1H5                  : constant Nat8       := 16#20#;
   --  Timer/Counter1 High Nat8 bit 6
   TCNT1H6_Bit              : constant Bit_Number := 6;
   TCNT1H6                  : constant Nat8       := 16#40#;
   --  Timer/Counter1 High Nat8 bit 7
   TCNT1H7_Bit              : constant Bit_Number := 7;
   TCNT1H7                  : constant Nat8       := 16#80#;

   --  Timer/Counter1 Low Nat8
   TCNT1L                   : constant System.Address := 16#4c#;
   TCNT1                    : constant System.Address := 16#4c#;
   --  Timer/Counter1 Low Nat8 bit 0
   TCNT1L0_Bit              : constant Bit_Number := 0;
   TCNT1L0                  : constant Nat8       := 16#01#;
   --  Timer/Counter1 Low Nat8 bit 1
   TCNT1L1_Bit              : constant Bit_Number := 1;
   TCNT1L1                  : constant Nat8       := 16#02#;
   --  Timer/Counter1 Low Nat8 bit 2
   TCNT1L2_Bit              : constant Bit_Number := 2;
   TCNT1L2                  : constant Nat8       := 16#04#;
   --  Timer/Counter1 Low Nat8 bit 3
   TCNT1L3_Bit              : constant Bit_Number := 3;
   TCNT1L3                  : constant Nat8       := 16#08#;
   --  Timer/Counter1 Low Nat8 bit 4
   TCNT1L4_Bit              : constant Bit_Number := 4;
   TCNT1L4                  : constant Nat8       := 16#10#;
   --  Timer/Counter1 Low Nat8 bit 5
   TCNT1L5_Bit              : constant Bit_Number := 5;
   TCNT1L5                  : constant Nat8       := 16#20#;
   --  Timer/Counter1 Low Nat8 bit 6
   TCNT1L6_Bit              : constant Bit_Number := 6;
   TCNT1L6                  : constant Nat8       := 16#40#;
   --  Timer/Counter1 Low Nat8 bit 7
   TCNT1L7_Bit              : constant Bit_Number := 7;
   TCNT1L7                  : constant Nat8       := 16#80#;

   --  Timer/Counter1 Output Compare Register A High Nat8
   OCR1AH                   : constant System.Address := 16#4b#;
   --  Timer/Counter1 Output Compare Register High Nat8 bit 0
   OCR1AH0_Bit              : constant Bit_Number := 0;
   OCR1AH0                  : constant Nat8       := 16#01#;
   --  Timer/Counter1 Output Compare Register High Nat8 bit 1
   OCR1AH1_Bit              : constant Bit_Number := 1;
   OCR1AH1                  : constant Nat8       := 16#02#;
   --  Timer/Counter1 Output Compare Register High Nat8 bit 2
   OCR1AH2_Bit              : constant Bit_Number := 2;
   OCR1AH2                  : constant Nat8       := 16#04#;
   --  Timer/Counter1 Output Compare Register High Nat8 bit 3
   OCR1AH3_Bit              : constant Bit_Number := 3;
   OCR1AH3                  : constant Nat8       := 16#08#;
   --  Timer/Counter1 Output Compare Register High Nat8 bit 4
   OCR1AH4_Bit              : constant Bit_Number := 4;
   OCR1AH4                  : constant Nat8       := 16#10#;
   --  Timer/Counter1 Output Compare Register High Nat8 bit 5
   OCR1AH5_Bit              : constant Bit_Number := 5;
   OCR1AH5                  : constant Nat8       := 16#20#;
   --  Timer/Counter1 Output Compare Register High Nat8 bit 6
   OCR1AH6_Bit              : constant Bit_Number := 6;
   OCR1AH6                  : constant Nat8       := 16#40#;
   --  Timer/Counter1 Output Compare Register High Nat8 bit 7
   OCR1AH7_Bit              : constant Bit_Number := 7;
   OCR1AH7                  : constant Nat8       := 16#80#;

   --  Timer/Counter1 Output Compare Register A Low Nat8
   OCR1AL                   : constant System.Address := 16#4a#;
   OCR1A                    : constant System.Address := 16#4a#;
   --  Timer/Counter1 Output Compare Register Low Nat8 Bit 0
   OCR1AL0_Bit              : constant Bit_Number := 0;
   OCR1AL0                  : constant Nat8       := 16#01#;
   --  Timer/Counter1 Output Compare Register Low Nat8 Bit 1
   OCR1AL1_Bit              : constant Bit_Number := 1;
   OCR1AL1                  : constant Nat8       := 16#02#;
   --  Timer/Counter1 Output Compare Register Low Nat8 Bit 2
   OCR1AL2_Bit              : constant Bit_Number := 2;
   OCR1AL2                  : constant Nat8       := 16#04#;
   --  Timer/Counter1 Output Compare Register Low Nat8 Bit 3
   OCR1AL3_Bit              : constant Bit_Number := 3;
   OCR1AL3                  : constant Nat8       := 16#08#;
   --  Timer/Counter1 Output Compare Register Low Nat8 Bit 4
   OCR1AL4_Bit              : constant Bit_Number := 4;
   OCR1AL4                  : constant Nat8       := 16#10#;
   --  Timer/Counter1 Output Compare Register Low Nat8 Bit 5
   OCR1AL5_Bit              : constant Bit_Number := 5;
   OCR1AL5                  : constant Nat8       := 16#20#;
   --  Timer/Counter1 Output Compare Register Low Nat8 Bit 6
   OCR1AL6_Bit              : constant Bit_Number := 6;
   OCR1AL6                  : constant Nat8       := 16#40#;
   --  Timer/Counter1 Output Compare Register Low Nat8 Bit 7
   OCR1AL7_Bit              : constant Bit_Number := 7;
   OCR1AL7                  : constant Nat8       := 16#80#;

   --  Timer/Counter1 Output Compare Register B High Nat8
   OCR1BH                   : constant System.Address := 16#49#;

   --  Timer/Counter1 Output Compare Register B Low Nat8
   OCR1BL                   : constant System.Address := 16#48#;
   OCR1B                    : constant System.Address := 16#48#;

   DWDR                     : constant System.Address := 16#47#;

   --  Clock Prescale Register
   CLKPR                    : constant System.Address := 16#46#;
   --  Clock Prescaler Select Bit 0
   CLKPS0_Bit               : constant Bit_Number := 0;
   CLKPS0                   : constant Nat8       := 16#01#;
   --  Clock Prescaler Select Bit 1
   CLKPS1_Bit               : constant Bit_Number := 1;
   CLKPS1                   : constant Nat8       := 16#02#;
   --  Clock Prescaler Select Bit 2
   CLKPS2_Bit               : constant Bit_Number := 2;
   CLKPS2                   : constant Nat8       := 16#04#;
   --  Clock Prescaler Select Bit 3
   CLKPS3_Bit               : constant Bit_Number := 3;
   CLKPS3                   : constant Nat8       := 16#08#;
   --  Clock Prescaler Change Enable
   CLKPCE_Bit               : constant Bit_Number := 7;
   CLKPCE                   : constant Nat8       := 16#80#;

   --  Timer/Counter1 Input Capture Register High Nat8
   ICR1H                    : constant System.Address := 16#45#;
   --  Timer/Counter1 Input Capture Register High Nat8 bit 0
   ICR1H0_Bit               : constant Bit_Number := 0;
   ICR1H0                   : constant Nat8       := 16#01#;
   --  Timer/Counter1 Input Capture Register High Nat8 bit 1
   ICR1H1_Bit               : constant Bit_Number := 1;
   ICR1H1                   : constant Nat8       := 16#02#;
   --  Timer/Counter1 Input Capture Register High Nat8 bit 2
   ICR1H2_Bit               : constant Bit_Number := 2;
   ICR1H2                   : constant Nat8       := 16#04#;
   --  Timer/Counter1 Input Capture Register High Nat8 bit 3
   ICR1H3_Bit               : constant Bit_Number := 3;
   ICR1H3                   : constant Nat8       := 16#08#;
   --  Timer/Counter1 Input Capture Register High Nat8 bit 4
   ICR1H4_Bit               : constant Bit_Number := 4;
   ICR1H4                   : constant Nat8       := 16#10#;
   --  Timer/Counter1 Input Capture Register High Nat8 bit 5
   ICR1H5_Bit               : constant Bit_Number := 5;
   ICR1H5                   : constant Nat8       := 16#20#;
   --  Timer/Counter1 Input Capture Register High Nat8 bit 6
   ICR1H6_Bit               : constant Bit_Number := 6;
   ICR1H6                   : constant Nat8       := 16#40#;
   --  Timer/Counter1 Input Capture Register High Nat8 bit 7
   ICR1H7_Bit               : constant Bit_Number := 7;
   ICR1H7                   : constant Nat8       := 16#80#;

   --  Timer/Counter1 Input Capture Register Low Nat8
   ICR1L                    : constant System.Address := 16#44#;
   ICR1                     : constant System.Address := 16#44#;
   --  Timer/Counter1 Input Capture Register Low Nat8 bit 0
   ICR1L0_Bit               : constant Bit_Number := 0;
   ICR1L0                   : constant Nat8       := 16#01#;
   --  Timer/Counter1 Input Capture Register Low Nat8 bit 1
   ICR1L1_Bit               : constant Bit_Number := 1;
   ICR1L1                   : constant Nat8       := 16#02#;
   --  Timer/Counter1 Input Capture Register Low Nat8 bit 2
   ICR1L2_Bit               : constant Bit_Number := 2;
   ICR1L2                   : constant Nat8       := 16#04#;
   --  Timer/Counter1 Input Capture Register Low Nat8 bit 3
   ICR1L3_Bit               : constant Bit_Number := 3;
   ICR1L3                   : constant Nat8       := 16#08#;
   --  Timer/Counter1 Input Capture Register Low Nat8 bit 4
   ICR1L4_Bit               : constant Bit_Number := 4;
   ICR1L4                   : constant Nat8       := 16#10#;
   --  Timer/Counter1 Input Capture Register Low Nat8 bit 5
   ICR1L5_Bit               : constant Bit_Number := 5;
   ICR1L5                   : constant Nat8       := 16#20#;
   --  Timer/Counter1 Input Capture Register Low Nat8 bit 6
   ICR1L6_Bit               : constant Bit_Number := 6;
   ICR1L6                   : constant Nat8       := 16#40#;
   --  Timer/Counter1 Input Capture Register Low Nat8 bit 7
   ICR1L7_Bit               : constant Bit_Number := 7;
   ICR1L7                   : constant Nat8       := 16#80#;

   --  General Timer/Counter Control Register
   GTCCR                    : constant System.Address := 16#43#;
   --  Prescaler Reset Timer/CounterN
   PSR10_Bit                : constant Bit_Number := 0;
   PSR10                    : constant Nat8       := 16#01#;
   --  Timer/Counter Synchronization Mode
   TSM_Bit                  : constant Bit_Number := 7;
   TSM                      : constant Nat8       := 16#80#;

   --  Timer/Counter1 Control Register C
   TCCR1C                   : constant System.Address := 16#42#;
   --  Force Output Compare for Channel B
   FOC1B_Bit                : constant Bit_Number := 6;
   FOC1B                    : constant Nat8       := 16#40#;
   --  Force Output Compare for Channel A
   FOC1A_Bit                : constant Bit_Number := 7;
   FOC1A                    : constant Nat8       := 16#80#;

   --  Watchdog Timer Control Register
   WDTCSR                   : constant System.Address := 16#41#;
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

   --  Pin Change Enable Mask 1
   PCMSK1                   : constant System.Address := 16#40#;
   --  Pin Change Enable Mask Bit 8
   PCINT8_Bit               : constant Bit_Number := 0;
   PCINT8                   : constant Nat8       := 16#01#;
   --  Pin Change Enable Mask Bit 9
   PCINT9_Bit               : constant Bit_Number := 1;
   PCINT9                   : constant Nat8       := 16#02#;
   --  Pin Change Enable Mask Bit 10
   PCINT10_Bit              : constant Bit_Number := 2;
   PCINT10                  : constant Nat8       := 16#04#;
   --  Pin Change Enable Mask Bit 11
   PCINT11_Bit              : constant Bit_Number := 3;
   PCINT11                  : constant Nat8       := 16#08#;

   --  EEPROM Address Register High Nat8
   EEARH                    : constant System.Address := 16#3f#;
   --  EEPROM Read/Write Access Bit 0
   EEAR8_Bit                : constant Bit_Number := 0;
   EEAR8                    : constant Nat8       := 16#01#;

   --  EEPROM Address Register Low Nat8
   EEARL                    : constant System.Address := 16#3e#;
   EEAR                     : constant System.Address := 16#3e#;
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
   EEDR                     : constant System.Address := 16#3d#;
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
   EECR                     : constant System.Address := 16#3c#;
   --  EEPROM Read Enable
   EERE_Bit                 : constant Bit_Number := 0;
   EERE                     : constant Nat8       := 16#01#;
   --  EEPROM Write Enable
   EEPE_Bit                 : constant Bit_Number := 1;
   EEPE                     : constant Nat8       := 16#02#;
   --  EEPROM Master Write Enable
   EEMPE_Bit                : constant Bit_Number := 2;
   EEMPE                    : constant Nat8       := 16#04#;
   --  EEPROM Ready Interrupt Enable
   EERIE_Bit                : constant Bit_Number := 3;
   EERIE                    : constant Nat8       := 16#08#;
   --  EEPROM Programming Mode Bit 0
   EEPM0_Bit                : constant Bit_Number := 4;
   EEPM0                    : constant Nat8       := 16#10#;
   --  EEPROM Programming Mode Bit 1
   EEPM1_Bit                : constant Bit_Number := 5;
   EEPM1                    : constant Nat8       := 16#20#;

   --  Port A Data Register
   PORTA                    : constant System.Address := 16#3b#;
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
   DDRA                     : constant System.Address := 16#3a#;
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
   PINA                     : constant System.Address := 16#39#;
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

   --  Data Register, Port B
   PORTB                    : constant System.Address := 16#38#;
   PORTB0_Bit               : constant Bit_Number := 0;
   PORTB0                   : constant Nat8       := 16#01#;
   PORTB1_Bit               : constant Bit_Number := 1;
   PORTB1                   : constant Nat8       := 16#02#;
   PORTB2_Bit               : constant Bit_Number := 2;
   PORTB2                   : constant Nat8       := 16#04#;
   PORTB3_Bit               : constant Bit_Number := 3;
   PORTB3                   : constant Nat8       := 16#08#;

   --  Data Direction Register, Port B
   DDRB                     : constant System.Address := 16#37#;
   DDB0_Bit                 : constant Bit_Number := 0;
   DDB0                     : constant Nat8       := 16#01#;
   DDB1_Bit                 : constant Bit_Number := 1;
   DDB1                     : constant Nat8       := 16#02#;
   DDB2_Bit                 : constant Bit_Number := 2;
   DDB2                     : constant Nat8       := 16#04#;
   DDB3_Bit                 : constant Bit_Number := 3;
   DDB3                     : constant Nat8       := 16#08#;

   --  Input Pins, Port B
   PINB                     : constant System.Address := 16#36#;
   PINB0_Bit                : constant Bit_Number := 0;
   PINB0                    : constant Nat8       := 16#01#;
   PINB1_Bit                : constant Bit_Number := 1;
   PINB1                    : constant Nat8       := 16#02#;
   PINB2_Bit                : constant Bit_Number := 2;
   PINB2                    : constant Nat8       := 16#04#;
   PINB3_Bit                : constant Bit_Number := 3;
   PINB3                    : constant Nat8       := 16#08#;

   --  General Purpose I/O Register 2
   GPIOR2                   : constant System.Address := 16#35#;
   GPIOR20_Bit              : constant Bit_Number := 0;
   GPIOR20                  : constant Nat8       := 16#01#;
   GPIOR21_Bit              : constant Bit_Number := 1;
   GPIOR21                  : constant Nat8       := 16#02#;
   GPIOR22_Bit              : constant Bit_Number := 2;
   GPIOR22                  : constant Nat8       := 16#04#;
   GPIOR23_Bit              : constant Bit_Number := 3;
   GPIOR23                  : constant Nat8       := 16#08#;
   GPIOR24_Bit              : constant Bit_Number := 4;
   GPIOR24                  : constant Nat8       := 16#10#;
   GPIOR25_Bit              : constant Bit_Number := 5;
   GPIOR25                  : constant Nat8       := 16#20#;
   GPIOR26_Bit              : constant Bit_Number := 6;
   GPIOR26                  : constant Nat8       := 16#40#;
   GPIOR27_Bit              : constant Bit_Number := 7;
   GPIOR27                  : constant Nat8       := 16#80#;

   --  General Purpose I/O Register 1
   GPIOR1                   : constant System.Address := 16#34#;
   GPIOR10_Bit              : constant Bit_Number := 0;
   GPIOR10                  : constant Nat8       := 16#01#;
   GPIOR11_Bit              : constant Bit_Number := 1;
   GPIOR11                  : constant Nat8       := 16#02#;
   GPIOR12_Bit              : constant Bit_Number := 2;
   GPIOR12                  : constant Nat8       := 16#04#;
   GPIOR13_Bit              : constant Bit_Number := 3;
   GPIOR13                  : constant Nat8       := 16#08#;
   GPIOR14_Bit              : constant Bit_Number := 4;
   GPIOR14                  : constant Nat8       := 16#10#;
   GPIOR15_Bit              : constant Bit_Number := 5;
   GPIOR15                  : constant Nat8       := 16#20#;
   GPIOR16_Bit              : constant Bit_Number := 6;
   GPIOR16                  : constant Nat8       := 16#40#;
   GPIOR17_Bit              : constant Bit_Number := 7;
   GPIOR17                  : constant Nat8       := 16#80#;

   --  General Purpose I/O Register 0
   GPIOR0                   : constant System.Address := 16#33#;
   GPIOR00_Bit              : constant Bit_Number := 0;
   GPIOR00                  : constant Nat8       := 16#01#;
   GPIOR01_Bit              : constant Bit_Number := 1;
   GPIOR01                  : constant Nat8       := 16#02#;
   GPIOR02_Bit              : constant Bit_Number := 2;
   GPIOR02                  : constant Nat8       := 16#04#;
   GPIOR03_Bit              : constant Bit_Number := 3;
   GPIOR03                  : constant Nat8       := 16#08#;
   GPIOR04_Bit              : constant Bit_Number := 4;
   GPIOR04                  : constant Nat8       := 16#10#;
   GPIOR05_Bit              : constant Bit_Number := 5;
   GPIOR05                  : constant Nat8       := 16#20#;
   GPIOR06_Bit              : constant Bit_Number := 6;
   GPIOR06                  : constant Nat8       := 16#40#;
   GPIOR07_Bit              : constant Bit_Number := 7;
   GPIOR07                  : constant Nat8       := 16#80#;

   --  Pin Change Enable Mask 0
   PCMSK0                   : constant System.Address := 16#32#;
   --  Pin Change Enable Mask Bit 0
   PCINT0_Bit               : constant Bit_Number := 0;
   PCINT0                   : constant Nat8       := 16#01#;
   --  Pin Change Enable Mask Bit 1
   PCINT1_Bit               : constant Bit_Number := 1;
   PCINT1                   : constant Nat8       := 16#02#;
   --  Pin Change Enable Mask Bit 2
   PCINT2_Bit               : constant Bit_Number := 2;
   PCINT2                   : constant Nat8       := 16#04#;
   --  Pin Change Enable Mask Bit 3
   PCINT3_Bit               : constant Bit_Number := 3;
   PCINT3                   : constant Nat8       := 16#08#;
   --  Pin Change Enable Mask Bit 4
   PCINT4_Bit               : constant Bit_Number := 4;
   PCINT4                   : constant Nat8       := 16#10#;
   --  Pin Change Enable Mask Bit 5
   PCINT5_Bit               : constant Bit_Number := 5;
   PCINT5                   : constant Nat8       := 16#20#;
   --  Pin Change Enable Mask Bit 6
   PCINT6_Bit               : constant Bit_Number := 6;
   PCINT6                   : constant Nat8       := 16#40#;
   --  Pin Change Enable Mask Bit 7
   PCINT7_Bit               : constant Bit_Number := 7;
   PCINT7                   : constant Nat8       := 16#80#;

   --  USI Buffer Register
   USIBR                    : constant System.Address := 16#30#;
   --  USI Buffer Register bit 0
   USIBR0_Bit               : constant Bit_Number := 0;
   USIBR0                   : constant Nat8       := 16#01#;
   --  USI Buffer Register bit 1
   USIBR1_Bit               : constant Bit_Number := 1;
   USIBR1                   : constant Nat8       := 16#02#;
   --  USI Buffer Register bit 2
   USIBR2_Bit               : constant Bit_Number := 2;
   USIBR2                   : constant Nat8       := 16#04#;
   --  USI Buffer Register bit 3
   USIBR3_Bit               : constant Bit_Number := 3;
   USIBR3                   : constant Nat8       := 16#08#;
   --  USI Buffer Register bit 4
   USIBR4_Bit               : constant Bit_Number := 4;
   USIBR4                   : constant Nat8       := 16#10#;
   --  USI Buffer Register bit 5
   USIBR5_Bit               : constant Bit_Number := 5;
   USIBR5                   : constant Nat8       := 16#20#;
   --  USI Buffer Register bit 6
   USIBR6_Bit               : constant Bit_Number := 6;
   USIBR6                   : constant Nat8       := 16#40#;
   --  USI Buffer Register bit 7
   USIBR7_Bit               : constant Bit_Number := 7;
   USIBR7                   : constant Nat8       := 16#80#;

   --  USI Data Register
   USIDR                    : constant System.Address := 16#2f#;
   --  USI Data Register bit 0
   USIDR0_Bit               : constant Bit_Number := 0;
   USIDR0                   : constant Nat8       := 16#01#;
   --  USI Data Register bit 1
   USIDR1_Bit               : constant Bit_Number := 1;
   USIDR1                   : constant Nat8       := 16#02#;
   --  USI Data Register bit 2
   USIDR2_Bit               : constant Bit_Number := 2;
   USIDR2                   : constant Nat8       := 16#04#;
   --  USI Data Register bit 3
   USIDR3_Bit               : constant Bit_Number := 3;
   USIDR3                   : constant Nat8       := 16#08#;
   --  USI Data Register bit 4
   USIDR4_Bit               : constant Bit_Number := 4;
   USIDR4                   : constant Nat8       := 16#10#;
   --  USI Data Register bit 5
   USIDR5_Bit               : constant Bit_Number := 5;
   USIDR5                   : constant Nat8       := 16#20#;
   --  USI Data Register bit 6
   USIDR6_Bit               : constant Bit_Number := 6;
   USIDR6                   : constant Nat8       := 16#40#;
   --  USI Data Register bit 7
   USIDR7_Bit               : constant Bit_Number := 7;
   USIDR7                   : constant Nat8       := 16#80#;

   --  USI Status Register
   USISR                    : constant System.Address := 16#2e#;
   --  USI Counter Value Bit 0
   USICNT0_Bit              : constant Bit_Number := 0;
   USICNT0                  : constant Nat8       := 16#01#;
   --  USI Counter Value Bit 1
   USICNT1_Bit              : constant Bit_Number := 1;
   USICNT1                  : constant Nat8       := 16#02#;
   --  USI Counter Value Bit 2
   USICNT2_Bit              : constant Bit_Number := 2;
   USICNT2                  : constant Nat8       := 16#04#;
   --  USI Counter Value Bit 3
   USICNT3_Bit              : constant Bit_Number := 3;
   USICNT3                  : constant Nat8       := 16#08#;
   --  Data Output Collision
   USIDC_Bit                : constant Bit_Number := 4;
   USIDC                    : constant Nat8       := 16#10#;
   --  Stop Condition Flag
   USIPF_Bit                : constant Bit_Number := 5;
   USIPF                    : constant Nat8       := 16#20#;
   --  Counter Overflow Interrupt Flag
   USIOIF_Bit               : constant Bit_Number := 6;
   USIOIF                   : constant Nat8       := 16#40#;
   --  Start Condition Interrupt Flag
   USISIF_Bit               : constant Bit_Number := 7;
   USISIF                   : constant Nat8       := 16#80#;

   --  USI Control Register
   USICR                    : constant System.Address := 16#2d#;
   --  Toggle Clock Port Pin
   USITC_Bit                : constant Bit_Number := 0;
   USITC                    : constant Nat8       := 16#01#;
   --  Clock Strobe
   USICLK_Bit               : constant Bit_Number := 1;
   USICLK                   : constant Nat8       := 16#02#;
   --  USI Clock Source Select Bit 0
   USICS0_Bit               : constant Bit_Number := 2;
   USICS0                   : constant Nat8       := 16#04#;
   --  USI Clock Source Select Bit 1
   USICS1_Bit               : constant Bit_Number := 3;
   USICS1                   : constant Nat8       := 16#08#;
   --  USI Wire Mode Bit 0
   USIWM0_Bit               : constant Bit_Number := 4;
   USIWM0                   : constant Nat8       := 16#10#;
   --  USI Wire Mode Bit 1
   USIWM1_Bit               : constant Bit_Number := 5;
   USIWM1                   : constant Nat8       := 16#20#;
   --  Counter Overflow Interrupt Enable
   USIOIE_Bit               : constant Bit_Number := 6;
   USIOIE                   : constant Nat8       := 16#40#;
   --  Start Condition Interrupt Enable
   USISIE_Bit               : constant Bit_Number := 7;
   USISIE                   : constant Nat8       := 16#80#;

   --  Timer/Counter1 Interrupt Mask Register
   TIMSK1                   : constant System.Address := 16#2c#;
   --  Timer/Counter1 Overflow Interrupt Enable
   TOIE1_Bit                : constant Bit_Number := 0;
   TOIE1                    : constant Nat8       := 16#01#;
   --  Timer/Counter1 Output Compare A Match Interrupt Enable
   OCIE1A_Bit               : constant Bit_Number := 1;
   OCIE1A                   : constant Nat8       := 16#02#;
   --  Timer/Counter1 Output Compare B Match Interrupt Enable
   OCIE1B_Bit               : constant Bit_Number := 2;
   OCIE1B                   : constant Nat8       := 16#04#;
   --  Timer/Counter1 Input Capture Interrupt Enable
   ICIE1_Bit                : constant Bit_Number := 5;
   ICIE1                    : constant Nat8       := 16#20#;

   --  Timer/Counter Interrupt Flag register
   TIFR1                    : constant System.Address := 16#2b#;
   --  Timer/Counter1 Overflow Flag
   TOV1_Bit                 : constant Bit_Number := 0;
   TOV1                     : constant Nat8       := 16#01#;
   --  Timer/Counter1 Output Compare A Match Flag
   OCF1A_Bit                : constant Bit_Number := 1;
   OCF1A                    : constant Nat8       := 16#02#;
   --  Timer/Counter1 Output Compare B Match Flag
   OCF1B_Bit                : constant Bit_Number := 2;
   OCF1B                    : constant Nat8       := 16#04#;
   --  Timer/Counter1 Input Capture Flag
   ICF1_Bit                 : constant Bit_Number := 5;
   ICF1                     : constant Nat8       := 16#20#;

   --  Analog Comparator Control And Status Register
   ACSR                     : constant System.Address := 16#28#;
   --  Analog Comparator Interrupt Mode Select bit 0
   ACIS0_Bit                : constant Bit_Number := 0;
   ACIS0                    : constant Nat8       := 16#01#;
   --  Analog Comparator Interrupt Mode Select bit 1
   ACIS1_Bit                : constant Bit_Number := 1;
   ACIS1                    : constant Nat8       := 16#02#;
   --  Analog Comparator Input Capture Enable
   ACIC_Bit                 : constant Bit_Number := 2;
   ACIC                     : constant Nat8       := 16#04#;
   --  Analog Comparator Interrupt Enable
   ACIE_Bit                 : constant Bit_Number := 3;
   ACIE                     : constant Nat8       := 16#08#;
   --  Analog Comparator Interrupt Flag
   ACI_Bit                  : constant Bit_Number := 4;
   ACI                      : constant Nat8       := 16#10#;
   --  Analog Compare Output
   ACO_Bit                  : constant Bit_Number := 5;
   ACO                      : constant Nat8       := 16#20#;
   --  Analog Comparator Bandgap Select
   ACBG_Bit                 : constant Bit_Number := 6;
   ACBG                     : constant Nat8       := 16#40#;
   --  Analog Comparator Disable
   ACD_Bit                  : constant Bit_Number := 7;
   ACD                      : constant Nat8       := 16#80#;

   --  ADC Multiplexer Selection Register
   ADMUX                    : constant System.Address := 16#27#;
   --  Analog Channel and Gain Selection Bit 0
   MUX0_Bit                 : constant Bit_Number := 0;
   MUX0                     : constant Nat8       := 16#01#;
   --  Analog Channel and Gain Selection Bit 1
   MUX1_Bit                 : constant Bit_Number := 1;
   MUX1                     : constant Nat8       := 16#02#;
   --  Analog Channel and Gain Selection Bit 2
   MUX2_Bit                 : constant Bit_Number := 2;
   MUX2                     : constant Nat8       := 16#04#;
   --  Analog Channel and Gain Selection Bit 3
   MUX3_Bit                 : constant Bit_Number := 3;
   MUX3                     : constant Nat8       := 16#08#;
   --  Analog Channel and Gain Selection Bit 4
   MUX4_Bit                 : constant Bit_Number := 4;
   MUX4                     : constant Nat8       := 16#10#;
   --  Analog Channel and Gain Selection Bit 5
   MUX5_Bit                 : constant Bit_Number := 5;
   MUX5                     : constant Nat8       := 16#20#;
   --  Reference Selection Bit 0
   REFS0_Bit                : constant Bit_Number := 6;
   REFS0                    : constant Nat8       := 16#40#;
   --  Reference Selection Bit 1
   REFS1_Bit                : constant Bit_Number := 7;
   REFS1                    : constant Nat8       := 16#80#;

   --  ADC Control and Status Register A
   ADCSRA                   : constant System.Address := 16#26#;
   --  ADC  Prescaler Select Bit 0
   ADPS0_Bit                : constant Bit_Number := 0;
   ADPS0                    : constant Nat8       := 16#01#;
   --  ADC  Prescaler Select Bit 1
   ADPS1_Bit                : constant Bit_Number := 1;
   ADPS1                    : constant Nat8       := 16#02#;
   --  ADC  Prescaler Select Bit 2
   ADPS2_Bit                : constant Bit_Number := 2;
   ADPS2                    : constant Nat8       := 16#04#;
   --  ADC Interrupt Enable
   ADIE_Bit                 : constant Bit_Number := 3;
   ADIE                     : constant Nat8       := 16#08#;
   --  ADC Interrupt Flag
   ADIF_Bit                 : constant Bit_Number := 4;
   ADIF                     : constant Nat8       := 16#10#;
   --  ADC Auto Trigger Enable
   ADATE_Bit                : constant Bit_Number := 5;
   ADATE                    : constant Nat8       := 16#20#;
   --  ADC Start Conversion
   ADSC_Bit                 : constant Bit_Number := 6;
   ADSC                     : constant Nat8       := 16#40#;
   --  ADC Enable
   ADEN_Bit                 : constant Bit_Number := 7;
   ADEN                     : constant Nat8       := 16#80#;

   --  ADC Data Register High Nat8
   ADCH                     : constant System.Address := 16#25#;
   --  ADC Data Register High Nat8 Bit 0
   ADCH0_Bit                : constant Bit_Number := 0;
   ADCH0                    : constant Nat8       := 16#01#;
   --  ADC Data Register High Nat8 Bit 1
   ADCH1_Bit                : constant Bit_Number := 1;
   ADCH1                    : constant Nat8       := 16#02#;
   --  ADC Data Register High Nat8 Bit 2
   ADCH2_Bit                : constant Bit_Number := 2;
   ADCH2                    : constant Nat8       := 16#04#;
   --  ADC Data Register High Nat8 Bit 3
   ADCH3_Bit                : constant Bit_Number := 3;
   ADCH3                    : constant Nat8       := 16#08#;
   --  ADC Data Register High Nat8 Bit 4
   ADCH4_Bit                : constant Bit_Number := 4;
   ADCH4                    : constant Nat8       := 16#10#;
   --  ADC Data Register High Nat8 Bit 5
   ADCH5_Bit                : constant Bit_Number := 5;
   ADCH5                    : constant Nat8       := 16#20#;
   --  ADC Data Register High Nat8 Bit 6
   ADCH6_Bit                : constant Bit_Number := 6;
   ADCH6                    : constant Nat8       := 16#40#;
   --  ADC Data Register High Nat8 Bit 7
   ADCH7_Bit                : constant Bit_Number := 7;
   ADCH7                    : constant Nat8       := 16#80#;

   --  ADC Data Register Low Nat8
   ADCL                     : constant System.Address := 16#24#;
   ADC                      : constant System.Address := 16#24#;
   --  ADC Data Register Low Nat8 Bit 0
   ADCL0_Bit                : constant Bit_Number := 0;
   ADCL0                    : constant Nat8       := 16#01#;
   --  ADC Data Register Low Nat8 Bit 1
   ADCL1_Bit                : constant Bit_Number := 1;
   ADCL1                    : constant Nat8       := 16#02#;
   --  ADC Data Register Low Nat8 Bit 2
   ADCL2_Bit                : constant Bit_Number := 2;
   ADCL2                    : constant Nat8       := 16#04#;
   --  ADC Data Register Low Nat8 Bit 3
   ADCL3_Bit                : constant Bit_Number := 3;
   ADCL3                    : constant Nat8       := 16#08#;
   --  ADC Data Register Low Nat8 Bit 4
   ADCL4_Bit                : constant Bit_Number := 4;
   ADCL4                    : constant Nat8       := 16#10#;
   --  ADC Data Register Low Nat8 Bit 5
   ADCL5_Bit                : constant Bit_Number := 5;
   ADCL5                    : constant Nat8       := 16#20#;
   --  ADC Data Register Low Nat8 Bit 6
   ADCL6_Bit                : constant Bit_Number := 6;
   ADCL6                    : constant Nat8       := 16#40#;
   --  ADC Data Register Low Nat8 Bit 7
   ADCL7_Bit                : constant Bit_Number := 7;
   ADCL7                    : constant Nat8       := 16#80#;

   --  ADC Control and Status Register B
   ADCSRB                   : constant System.Address := 16#23#;
   --  ADC Auto Trigger Source bit 0
   ADTS0_Bit                : constant Bit_Number := 0;
   ADTS0                    : constant Nat8       := 16#01#;
   --  ADC Auto Trigger Source bit 1
   ADTS1_Bit                : constant Bit_Number := 1;
   ADTS1                    : constant Nat8       := 16#02#;
   --  ADC Auto Trigger Source bit 2
   ADTS2_Bit                : constant Bit_Number := 2;
   ADTS2                    : constant Nat8       := 16#04#;
   --  ADC Left Adjust Result
   ADLAR_Bit                : constant Bit_Number := 4;
   ADLAR                    : constant Nat8       := 16#10#;
   --  Analog Comparator Multiplexer Enable
   ACME_Bit                 : constant Bit_Number := 6;
   ACME                     : constant Nat8       := 16#40#;
   --  Bipolar Input Mode
   BIN_Bit                  : constant Bit_Number := 7;
   BIN                      : constant Nat8       := 16#80#;

   DIDR0                    : constant System.Address := 16#21#;
   --  ADC 0 Digital input buffer disable
   ADC0D_Bit                : constant Bit_Number := 0;
   ADC0D                    : constant Nat8       := 16#01#;
   --  ADC 1 Digital input buffer disable
   ADC1D_Bit                : constant Bit_Number := 1;
   ADC1D                    : constant Nat8       := 16#02#;
   --  ADC2 Digital Input Disable
   ADC2D_Bit                : constant Bit_Number := 2;
   ADC2D                    : constant Nat8       := 16#04#;
   --  ADC3 Digital Input Disable
   ADC3D_Bit                : constant Bit_Number := 3;
   ADC3D                    : constant Nat8       := 16#08#;
   --  ADC4 Digital Input Disable
   ADC4D_Bit                : constant Bit_Number := 4;
   ADC4D                    : constant Nat8       := 16#10#;
   --  ADC5 Digital Input Disable
   ADC5D_Bit                : constant Bit_Number := 5;
   ADC5D                    : constant Nat8       := 16#20#;
   --  ADC6 Digital Input Disable
   ADC6D_Bit                : constant Bit_Number := 6;
   ADC6D                    : constant Nat8       := 16#40#;
   --  ADC7 Digital Input Disable
   ADC7D_Bit                : constant Bit_Number := 7;
   ADC7D                    : constant Nat8       := 16#80#;

   --  Power Reduction Register
   PRR                      : constant System.Address := 16#20#;
   --  Power Reduction ADC
   PRADC_Bit                : constant Bit_Number := 0;
   PRADC                    : constant Nat8       := 16#01#;
   --  Power Reduction USI
   PRUSI_Bit                : constant Bit_Number := 1;
   PRUSI                    : constant Nat8       := 16#02#;
   --  Power Reduction Timer/Counter0
   PRTIM0_Bit               : constant Bit_Number := 2;
   PRTIM0                   : constant Nat8       := 16#04#;
   --  Power Reduction Timer/Counter1
   PRTIM1_Bit               : constant Bit_Number := 3;
   PRTIM1                   : constant Nat8       := 16#08#;



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


end AVR.ATtiny24;
