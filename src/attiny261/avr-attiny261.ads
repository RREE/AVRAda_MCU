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

package AVR.ATtiny261 is
   pragma Pure (AVR.ATtiny261);

   CVS_Version : constant String := "$Id: avr-attiny261.ads 881 2008-11-16 22:55:31Z Rolf_Ebert $";


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
   Number_Of_Interrupts     : constant := 19;

   --  External Reset, Power-on Reset and Watchdog Reset
   Sig_RESET                : constant        :=  0;
   Sig_RESET_String         : constant String := "__vector_0";
   --  External Interrupt 0
   Sig_INT0                 : constant        :=  1;
   Sig_INT0_String          : constant String := "__vector_1";
   --  Pin Change Interrupt
   Sig_PCINT                : constant        :=  2;
   Sig_PCINT_String         : constant String := "__vector_2";
   --  Timer/Counter1 Compare Match 1A
   Sig_TIMER1_COMPA         : constant        :=  3;
   Sig_TIMER1_COMPA_String  : constant String := "__vector_3";
   --  Timer/Counter1 Compare Match 1B
   Sig_TIMER1_COMPB         : constant        :=  4;
   Sig_TIMER1_COMPB_String  : constant String := "__vector_4";
   --  Timer/Counter1 Overflow
   Sig_TIMER1_OVF           : constant        :=  5;
   Sig_TIMER1_OVF_String    : constant String := "__vector_5";
   --  Timer/Counter0 Overflow
   Sig_TIMER0_OVF           : constant        :=  6;
   Sig_TIMER0_OVF_String    : constant String := "__vector_6";
   --  USI Start
   Sig_USI_START            : constant        :=  7;
   Sig_USI_START_String     : constant String := "__vector_7";
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
   --  Watchdog Time-Out
   Sig_WDT                  : constant        := 12;
   Sig_WDT_String           : constant String := "__vector_12";
   --  External Interrupt 1
   Sig_INT1                 : constant        := 13;
   Sig_INT1_String          : constant String := "__vector_13";
   --  Timer/Counter0 Compare Match A
   Sig_TIMER0_COMPA         : constant        := 14;
   Sig_TIMER0_COMPA_String  : constant String := "__vector_14";
   --  Timer/Counter0 Compare Match B
   Sig_TIMER0_COMPB         : constant        := 15;
   Sig_TIMER0_COMPB_String  : constant String := "__vector_15";
   --  ADC Conversion Complete
   Sig_TIMER0_CAPT          : constant        := 16;
   Sig_TIMER0_CAPT_String   : constant String := "__vector_16";
   --  Timer/Counter1 Compare Match D
   Sig_TIMER1_COMPD         : constant        := 17;
   Sig_TIMER1_COMPD_String  : constant String := "__vector_17";
   --  Timer/Counter1 Fault Protection
   Sig_FAULT_PROTECTION     : constant        := 18;
   Sig_FAULT_PROTECTION_String : constant String := "__vector_18";


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

   --  Stack Pointer High Nat8
   SPH                      : constant System.Address := 16#5e#;
   --  Stack Pointer Bit 8
   SP8_Bit                  : constant Bit_Number := 0;
   SP8                      : constant Nat8       := 16#01#;
   --  Stack Pointer Bit 9
   SP9_Bit                  : constant Bit_Number := 1;
   SP9                      : constant Nat8       := 16#02#;

   --  Stack Pointer Low Nat8
   SPL                      : constant System.Address := 16#5d#;
   SP                       : constant System.Address := 16#5d#;
   --  Stack Pointer Bit 0
   SP0_Bit                  : constant Bit_Number := 0;
   SP0                      : constant Nat8       := 16#01#;
   --  Stack Pointer Bit 1
   SP1_Bit                  : constant Bit_Number := 1;
   SP1                      : constant Nat8       := 16#02#;
   --  Stack Pointer Bit 2
   SP2_Bit                  : constant Bit_Number := 2;
   SP2                      : constant Nat8       := 16#04#;
   --  Stack Pointer Bit 3
   SP3_Bit                  : constant Bit_Number := 3;
   SP3                      : constant Nat8       := 16#08#;
   SP4_Bit                  : constant Bit_Number := 4;
   SP4                      : constant Nat8       := 16#10#;
   --  Stack Pointer Bit 5
   SP5_Bit                  : constant Bit_Number := 5;
   SP5                      : constant Nat8       := 16#20#;
   --  Stack Pointer Bit 6
   SP6_Bit                  : constant Bit_Number := 6;
   SP6                      : constant Nat8       := 16#40#;
   --  Stack Pointer Bit 7
   SP7_Bit                  : constant Bit_Number := 7;
   SP7                      : constant Nat8       := 16#80#;

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
   --  External Interrupt Request 1 Enable
   INT1_Bit                 : constant Bit_Number := 7;
   INT1                     : constant Nat8       := 16#80#;

   --  General Interrupt Flag register
   GIFR                     : constant System.Address := 16#5a#;
   --  Pin Change Interrupt Flag
   PCIF_Bit                 : constant Bit_Number := 5;
   PCIF                     : constant Nat8       := 16#20#;
   --  External Interrupt Flag 0
   INTF0_Bit                : constant Bit_Number := 6;
   INTF0                    : constant Nat8       := 16#40#;
   --  External Interrupt Flag 1
   INTF1_Bit                : constant Bit_Number := 7;
   INTF1                    : constant Nat8       := 16#80#;

   --  Timer/Counter Interrupt Mask Register
   TIMSK                    : constant System.Address := 16#59#;
   --  Timer/Counter0 Input Capture Interrupt Enable
   TICIE0_Bit               : constant Bit_Number := 0;
   TICIE0                   : constant Nat8       := 16#01#;
   --  Timer/Counter0 Overflow Interrupt Enable
   TOIE0_Bit                : constant Bit_Number := 1;
   TOIE0                    : constant Nat8       := 16#02#;
   --  Timer/Counter1 Overflow Interrupt Enable
   TOIE1_Bit                : constant Bit_Number := 2;
   TOIE1                    : constant Nat8       := 16#04#;
   --  Timer/Counter0 Output Compare Match B Interrupt Enable
   OCIE0B_Bit               : constant Bit_Number := 3;
   OCIE0B                   : constant Nat8       := 16#08#;
   --  Timer/Counter0 Output Compare Match A Interrupt Enable
   OCIE0A_Bit               : constant Bit_Number := 4;
   OCIE0A                   : constant Nat8       := 16#10#;
   --  OCIE1A: Timer/Counter1 Output Compare B Interrupt Enable
   OCIE1B_Bit               : constant Bit_Number := 5;
   OCIE1B                   : constant Nat8       := 16#20#;
   --  OCIE1A: Timer/Counter1 Output Compare Interrupt Enable
   OCIE1A_Bit               : constant Bit_Number := 6;
   OCIE1A                   : constant Nat8       := 16#40#;
   --  OCIE1D: Timer/Counter1 Output Compare Interrupt Enable
   OCIE1D_Bit               : constant Bit_Number := 7;
   OCIE1D                   : constant Nat8       := 16#80#;

   --  Timer/Counter0 Interrupt Flag register
   TIFR                     : constant System.Address := 16#58#;
   --  Timer/Counter0 Input Capture Flag
   ICF0_Bit                 : constant Bit_Number := 0;
   ICF0                     : constant Nat8       := 16#01#;
   --  Timer/Counter0 Overflow Flag
   TOV0_Bit                 : constant Bit_Number := 1;
   TOV0                     : constant Nat8       := 16#02#;
   --  Timer/Counter1 Overflow Flag
   TOV1_Bit                 : constant Bit_Number := 2;
   TOV1                     : constant Nat8       := 16#04#;
   --  Timer/Counter0 Output Compare Flag 0B
   OCF0B_Bit                : constant Bit_Number := 3;
   OCF0B                    : constant Nat8       := 16#08#;
   --  Timer/Counter0 Output Compare Flag 0A
   OCF0A_Bit                : constant Bit_Number := 4;
   OCF0A                    : constant Nat8       := 16#10#;
   --  Timer/Counter1 Output Compare Flag 1B
   OCF1B_Bit                : constant Bit_Number := 5;
   OCF1B                    : constant Nat8       := 16#20#;
   --  Timer/Counter1 Output Compare Flag 1A
   OCF1A_Bit                : constant Bit_Number := 6;
   OCF1A                    : constant Nat8       := 16#40#;
   --  Timer/Counter1 Output Compare Flag 1D
   OCF1D_Bit                : constant Bit_Number := 7;
   OCF1D                    : constant Nat8       := 16#80#;

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

   --  Power Reduction Register
   PRR                      : constant System.Address := 16#56#;
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
   --  Pull-up Disable
   PUD_Bit                  : constant Bit_Number := 6;
   PUD                      : constant Nat8       := 16#40#;

   --  MCU Status register
   MCUSR                    : constant System.Address := 16#54#;
   --  Power-On Reset Flag
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
   --  Clock Select
   CS00_Bit                 : constant Bit_Number := 0;
   CS00                     : constant Nat8       := 16#01#;
   --  Clock Select
   CS01_Bit                 : constant Bit_Number := 1;
   CS01                     : constant Nat8       := 16#02#;
   --  Clock Select
   CS02_Bit                 : constant Bit_Number := 2;
   CS02                     : constant Nat8       := 16#04#;
   --  Timer/Counter 0 Prescaler Reset
   PSR0_Bit                 : constant Bit_Number := 3;
   PSR0                     : constant Nat8       := 16#08#;
   --  Timer/Counter Synchronization Mode
   TSM_Bit                  : constant Bit_Number := 4;
   TSM                      : constant Nat8       := 16#10#;

   --  Timer/Counter0 Low
   TCNT0L                   : constant System.Address := 16#52#;
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

   --  Oscillator Calibration Register
   OSCCAL                   : constant System.Address := 16#51#;
   --  Oscillatro Calibration Value Bit 0
   CAL0_Bit                 : constant Bit_Number := 0;
   CAL0                     : constant Nat8       := 16#01#;
   --  Oscillatro Calibration Value Bit 1
   CAL1_Bit                 : constant Bit_Number := 1;
   CAL1                     : constant Nat8       := 16#02#;
   --  Oscillatro Calibration Value Bit 2
   CAL2_Bit                 : constant Bit_Number := 2;
   CAL2                     : constant Nat8       := 16#04#;
   --  Oscillatro Calibration Value Bit 3
   CAL3_Bit                 : constant Bit_Number := 3;
   CAL3                     : constant Nat8       := 16#08#;
   --  Oscillatro Calibration Value Bit 4
   CAL4_Bit                 : constant Bit_Number := 4;
   CAL4                     : constant Nat8       := 16#10#;
   --  Oscillatro Calibration Value Bit 5
   CAL5_Bit                 : constant Bit_Number := 5;
   CAL5                     : constant Nat8       := 16#20#;
   --  Oscillatro Calibration Value Bit 6
   CAL6_Bit                 : constant Bit_Number := 6;
   CAL6                     : constant Nat8       := 16#40#;
   --  Oscillatro Calibration Value Bit 7
   CAL7_Bit                 : constant Bit_Number := 7;
   CAL7                     : constant Nat8       := 16#80#;

   --  Timer/Counter Control Register A
   TCCR1A                   : constant System.Address := 16#50#;
   --  Pulse Width Modulator Enable
   PWM1B_Bit                : constant Bit_Number := 0;
   PWM1B                    : constant Nat8       := 16#01#;
   --  Pulse Width Modulator Enable
   PWM1A_Bit                : constant Bit_Number := 1;
   PWM1A                    : constant Nat8       := 16#02#;
   --  Force Output Compare Match 1B
   FOC1B_Bit                : constant Bit_Number := 2;
   FOC1B                    : constant Nat8       := 16#04#;
   --  Force Output Compare Match 1A
   FOC1A_Bit                : constant Bit_Number := 3;
   FOC1A                    : constant Nat8       := 16#08#;
   --  Compare Output Mode, Bit 0
   COM1B0_Bit               : constant Bit_Number := 4;
   COM1B0                   : constant Nat8       := 16#10#;
   --  Compare Output Mode, Bit 1
   COM1B1_Bit               : constant Bit_Number := 5;
   COM1B1                   : constant Nat8       := 16#20#;
   --  Compare Output Mode, Bit 1
   COM1A0_Bit               : constant Bit_Number := 6;
   COM1A0                   : constant Nat8       := 16#40#;
   --  Compare Output Mode, Bit 0
   COM1A1_Bit               : constant Bit_Number := 7;
   COM1A1                   : constant Nat8       := 16#80#;

   --  Timer/Counter Control Register B
   TCCR1B                   : constant System.Address := 16#4f#;
   --  Clock Select Bits
   CS10_Bit                 : constant Bit_Number := 0;
   CS10                     : constant Nat8       := 16#01#;
   --  Clock Select Bits
   CS11_Bit                 : constant Bit_Number := 1;
   CS11                     : constant Nat8       := 16#02#;
   --  Clock Select Bits
   CS12_Bit                 : constant Bit_Number := 2;
   CS12                     : constant Nat8       := 16#04#;
   --  Clock Select Bits
   CS13_Bit                 : constant Bit_Number := 3;
   CS13                     : constant Nat8       := 16#08#;
   --  Dead Time Prescaler
   DTPS10_Bit               : constant Bit_Number := 4;
   DTPS10                   : constant Nat8       := 16#10#;
   --  Dead Time Prescaler
   DTPS11_Bit               : constant Bit_Number := 5;
   DTPS11                   : constant Nat8       := 16#20#;
   --  Timer/Counter 1 Prescaler reset
   PSR1_Bit                 : constant Bit_Number := 6;
   PSR1                     : constant Nat8       := 16#40#;

   --  Timer/Counter Register
   TCNT1                    : constant System.Address := 16#4e#;
   --  Timer/Counter Register Bit 0
   TC1H_0_Bit               : constant Bit_Number := 0;
   TC1H_0                   : constant Nat8       := 16#01#;
   --  Timer/Counter Register Bit 1
   TC1H_1_Bit               : constant Bit_Number := 1;
   TC1H_1                   : constant Nat8       := 16#02#;
   --  Timer/Counter Register Bit 2
   TC1H_2_Bit               : constant Bit_Number := 2;
   TC1H_2                   : constant Nat8       := 16#04#;
   --  Timer/Counter Register Bit 3
   TC1H_3_Bit               : constant Bit_Number := 3;
   TC1H_3                   : constant Nat8       := 16#08#;
   --  Timer/Counter Register Bit 4
   TC1H_4_Bit               : constant Bit_Number := 4;
   TC1H_4                   : constant Nat8       := 16#10#;
   --  Timer/Counter Register Bit 5
   TC1H_5_Bit               : constant Bit_Number := 5;
   TC1H_5                   : constant Nat8       := 16#20#;
   --  Timer/Counter Register Bit 6
   TC1H_6_Bit               : constant Bit_Number := 6;
   TC1H_6                   : constant Nat8       := 16#40#;
   --  Timer/Counter Register Bit 7
   TC1H_7_Bit               : constant Bit_Number := 7;
   TC1H_7                   : constant Nat8       := 16#80#;

   --  Output Compare Register
   OCR1A                    : constant System.Address := 16#4d#;
   --  Output Compare Register A Bit 0
   OCR1A0_Bit               : constant Bit_Number := 0;
   OCR1A0                   : constant Nat8       := 16#01#;
   --  Output Compare Register A Bit 1
   OCR1A1_Bit               : constant Bit_Number := 1;
   OCR1A1                   : constant Nat8       := 16#02#;
   --  Output Compare Register A Bit 2
   OCR1A2_Bit               : constant Bit_Number := 2;
   OCR1A2                   : constant Nat8       := 16#04#;
   --  Output Compare Register A Bit 3
   OCR1A3_Bit               : constant Bit_Number := 3;
   OCR1A3                   : constant Nat8       := 16#08#;
   --  Output Compare Register A Bit 4
   OCR1A4_Bit               : constant Bit_Number := 4;
   OCR1A4                   : constant Nat8       := 16#10#;
   --  Output Compare Register A Bit 5
   OCR1A5_Bit               : constant Bit_Number := 5;
   OCR1A5                   : constant Nat8       := 16#20#;
   --  Output Compare Register A Bit 6
   OCR1A6_Bit               : constant Bit_Number := 6;
   OCR1A6                   : constant Nat8       := 16#40#;
   --  Output Compare Register A Bit 7
   OCR1A7_Bit               : constant Bit_Number := 7;
   OCR1A7                   : constant Nat8       := 16#80#;

   --  Output Compare Register
   OCR1B                    : constant System.Address := 16#4c#;
   --  Output Compare Register B Bit 0
   OCR1B0_Bit               : constant Bit_Number := 0;
   OCR1B0                   : constant Nat8       := 16#01#;
   --  Output Compare Register B Bit 1
   OCR1B1_Bit               : constant Bit_Number := 1;
   OCR1B1                   : constant Nat8       := 16#02#;
   --  Output Compare Register B Bit 2
   OCR1B2_Bit               : constant Bit_Number := 2;
   OCR1B2                   : constant Nat8       := 16#04#;
   --  Output Compare Register B Bit 3
   OCR1B3_Bit               : constant Bit_Number := 3;
   OCR1B3                   : constant Nat8       := 16#08#;
   --  Output Compare Register B Bit 4
   OCR1B4_Bit               : constant Bit_Number := 4;
   OCR1B4                   : constant Nat8       := 16#10#;
   --  Output Compare Register B Bit 5
   OCR1B5_Bit               : constant Bit_Number := 5;
   OCR1B5                   : constant Nat8       := 16#20#;
   --  Output Compare Register B Bit 6
   OCR1B6_Bit               : constant Bit_Number := 6;
   OCR1B6                   : constant Nat8       := 16#40#;
   --  Output Compare Register B Bit 7
   OCR1B7_Bit               : constant Bit_Number := 7;
   OCR1B7                   : constant Nat8       := 16#80#;

   --  Output compare register
   OCR1C                    : constant System.Address := 16#4b#;
   OCR1C0_Bit               : constant Bit_Number := 0;
   OCR1C0                   : constant Nat8       := 16#01#;
   OCR1C1_Bit               : constant Bit_Number := 1;
   OCR1C1                   : constant Nat8       := 16#02#;
   OCR1C2_Bit               : constant Bit_Number := 2;
   OCR1C2                   : constant Nat8       := 16#04#;
   OCR1C3_Bit               : constant Bit_Number := 3;
   OCR1C3                   : constant Nat8       := 16#08#;
   OCR1C4_Bit               : constant Bit_Number := 4;
   OCR1C4                   : constant Nat8       := 16#10#;
   OCR1C5_Bit               : constant Bit_Number := 5;
   OCR1C5                   : constant Nat8       := 16#20#;
   OCR1C6_Bit               : constant Bit_Number := 6;
   OCR1C6                   : constant Nat8       := 16#40#;
   OCR1C7_Bit               : constant Bit_Number := 7;
   OCR1C7                   : constant Nat8       := 16#80#;

   --  Output compare register
   OCR1D                    : constant System.Address := 16#4a#;
   OCR1D0_Bit               : constant Bit_Number := 0;
   OCR1D0                   : constant Nat8       := 16#01#;
   OCR1D1_Bit               : constant Bit_Number := 1;
   OCR1D1                   : constant Nat8       := 16#02#;
   OCR1D2_Bit               : constant Bit_Number := 2;
   OCR1D2                   : constant Nat8       := 16#04#;
   OCR1D3_Bit               : constant Bit_Number := 3;
   OCR1D3                   : constant Nat8       := 16#08#;
   OCR1D4_Bit               : constant Bit_Number := 4;
   OCR1D4                   : constant Nat8       := 16#10#;
   OCR1D5_Bit               : constant Bit_Number := 5;
   OCR1D5                   : constant Nat8       := 16#20#;
   OCR1D6_Bit               : constant Bit_Number := 6;
   OCR1D6                   : constant Nat8       := 16#40#;

   --  PLL Control and status register
   PLLCSR                   : constant System.Address := 16#49#;
   --  PLL Lock detector
   PLOCK_Bit                : constant Bit_Number := 0;
   PLOCK                    : constant Nat8       := 16#01#;
   --  PLL Enable
   PLLE_Bit                 : constant Bit_Number := 1;
   PLLE                     : constant Nat8       := 16#02#;
   --  PCK Enable
   PCKE_Bit                 : constant Bit_Number := 2;
   PCKE                     : constant Nat8       := 16#04#;
   --  Low speed mode
   LSM_Bit                  : constant Bit_Number := 7;
   LSM                      : constant Nat8       := 16#80#;

   --  Clock Prescale Register
   CLKPR                    : constant System.Address := 16#48#;
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

   --  Timer/Counter Control Register C
   TCCR1C                   : constant System.Address := 16#47#;
   --  Pulse Width Modulator D Enable
   PWM1D_Bit                : constant Bit_Number := 0;
   PWM1D                    : constant Nat8       := 16#01#;
   --  Force Output Compare Match 1D
   FOC1D_Bit                : constant Bit_Number := 1;
   FOC1D                    : constant Nat8       := 16#02#;
   --  Comparator D output mode
   COM1D0_Bit               : constant Bit_Number := 2;
   COM1D0                   : constant Nat8       := 16#04#;
   --  Comparator D output mode
   COM1D1_Bit               : constant Bit_Number := 3;
   COM1D1                   : constant Nat8       := 16#08#;
   --  COM1B0 Shadow Bit
   COM1B0S_Bit              : constant Bit_Number := 4;
   COM1B0S                  : constant Nat8       := 16#10#;
   --  COM1B1 Shadow Bit
   COM1B1S_Bit              : constant Bit_Number := 5;
   COM1B1S                  : constant Nat8       := 16#20#;
   --  COM1A0 Shadow Bit
   COM1A0S_Bit              : constant Bit_Number := 6;
   COM1A0S                  : constant Nat8       := 16#40#;
   --  COM1A1 Shadow Bit
   COM1A1S_Bit              : constant Bit_Number := 7;
   COM1A1S                  : constant Nat8       := 16#80#;

   --  Timer/Counter Control Register D
   TCCR1D                   : constant System.Address := 16#46#;
   --  Waveform Generation Mode Bit
   WGM10_Bit                : constant Bit_Number := 0;
   WGM10                    : constant Nat8       := 16#01#;
   --  Waveform Generation Mode Bit
   WGM11_Bit                : constant Bit_Number := 1;
   WGM11                    : constant Nat8       := 16#02#;
   --  Fault Protection Interrupt Flag
   FPF1_Bit                 : constant Bit_Number := 2;
   FPF1                     : constant Nat8       := 16#04#;
   --  Fault Protection Analog Comparator Enable
   FPAC1_Bit                : constant Bit_Number := 3;
   FPAC1                    : constant Nat8       := 16#08#;
   --  Fault Protection Edge Select
   FPES1_Bit                : constant Bit_Number := 4;
   FPES1                    : constant Nat8       := 16#10#;
   --  Fault Protection Noise Canceler
   FPNC1_Bit                : constant Bit_Number := 5;
   FPNC1                    : constant Nat8       := 16#20#;
   --  Fault Protection Mode Enable
   FPEN1_Bit                : constant Bit_Number := 6;
   FPEN1                    : constant Nat8       := 16#40#;
   --  Fault Protection Interrupt Enable
   FPIE1_Bit                : constant Bit_Number := 7;
   FPIE1                    : constant Nat8       := 16#80#;

   --  Timer/Counter 1 Register High
   TC1H                     : constant System.Address := 16#45#;
   --  Timer/Counter Register Bit 0
   TC18_Bit                 : constant Bit_Number := 0;
   TC18                     : constant Nat8       := 16#01#;
   --  Timer/Counter Register Bit 1
   TC19_Bit                 : constant Bit_Number := 1;
   TC19                     : constant Nat8       := 16#02#;

   --  Timer/Counter 1 Dead Time Value
   DT1                      : constant System.Address := 16#44#;
   DT1L0_Bit                : constant Bit_Number := 0;
   DT1L0                    : constant Nat8       := 16#01#;
   DT1L1_Bit                : constant Bit_Number := 1;
   DT1L1                    : constant Nat8       := 16#02#;
   DT1L2_Bit                : constant Bit_Number := 2;
   DT1L2                    : constant Nat8       := 16#04#;
   DT1L3_Bit                : constant Bit_Number := 3;
   DT1L3                    : constant Nat8       := 16#08#;
   DT1H0_Bit                : constant Bit_Number := 4;
   DT1H0                    : constant Nat8       := 16#10#;
   DT1H1_Bit                : constant Bit_Number := 5;
   DT1H1                    : constant Nat8       := 16#20#;
   DT1H2_Bit                : constant Bit_Number := 6;
   DT1H2                    : constant Nat8       := 16#40#;
   DT1H3_Bit                : constant Bit_Number := 7;
   DT1H3                    : constant Nat8       := 16#80#;

   --  Pin Change Enable Mask 0
   PCMSK0                   : constant System.Address := 16#43#;
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

   --  Pin Change Enable Mask 1
   PCMSK1                   : constant System.Address := 16#42#;
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
   --  Pin Change Enable Mask Bit 12
   PCINT12_Bit              : constant Bit_Number := 4;
   PCINT12                  : constant Nat8       := 16#10#;
   --  Pin Change Enable Mask Bit 13
   PCINT13_Bit              : constant Bit_Number := 5;
   PCINT13                  : constant Nat8       := 16#20#;
   --  Pin Change Enable Mask Bit 14
   PCINT14_Bit              : constant Bit_Number := 6;
   PCINT14                  : constant Nat8       := 16#40#;
   --  Pin Change Enable Mask Bit 15
   PCINT15_Bit              : constant Bit_Number := 7;
   PCINT15                  : constant Nat8       := 16#80#;

   --  Watchdog Timer Control Register
   WDTCR                    : constant System.Address := 16#41#;
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

   --  debugWire data register
   DWDR                     : constant System.Address := 16#40#;
   DWDR0_Bit                : constant Bit_Number := 0;
   DWDR0                    : constant Nat8       := 16#01#;
   DWDR1_Bit                : constant Bit_Number := 1;
   DWDR1                    : constant Nat8       := 16#02#;
   DWDR2_Bit                : constant Bit_Number := 2;
   DWDR2                    : constant Nat8       := 16#04#;
   DWDR3_Bit                : constant Bit_Number := 3;
   DWDR3                    : constant Nat8       := 16#08#;
   DWDR4_Bit                : constant Bit_Number := 4;
   DWDR4                    : constant Nat8       := 16#10#;
   DWDR5_Bit                : constant Bit_Number := 5;
   DWDR5                    : constant Nat8       := 16#20#;
   DWDR6_Bit                : constant Bit_Number := 6;
   DWDR6                    : constant Nat8       := 16#40#;
   DWDR7_Bit                : constant Bit_Number := 7;
   DWDR7                    : constant Nat8       := 16#80#;

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

   --  Port B Data Register
   PORTB                    : constant System.Address := 16#38#;
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
   DDRB                     : constant System.Address := 16#37#;
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
   PINB                     : constant System.Address := 16#36#;
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

   --  Timer/Counter  Control Register A
   TCCR0A                   : constant System.Address := 16#35#;
   --  Analog Comparator Input Capture Enable
   ACIC0_Bit                : constant Bit_Number := 3;
   ACIC0                    : constant Nat8       := 16#08#;
   --  Input Capture Edge Select
   ICES0_Bit                : constant Bit_Number := 4;
   ICES0                    : constant Nat8       := 16#10#;
   --  Input Capture Noice Canceler
   ICNC0_Bit                : constant Bit_Number := 5;
   ICNC0                    : constant Nat8       := 16#20#;
   --  Input Capture Mode Enable
   ICEN0_Bit                : constant Bit_Number := 6;
   ICEN0                    : constant Nat8       := 16#40#;
   --  Timer/Counter 0 Width
   TCW0_Bit                 : constant Bit_Number := 7;
   TCW0                     : constant Nat8       := 16#80#;

   --  Timer/Counter0 High
   TCNT0H                   : constant System.Address := 16#34#;

   --  Timer/Counter0 Output Compare Register
   OCR0A                    : constant System.Address := 16#33#;
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

   --  Timer/Counter0 Output Compare Register
   OCR0B                    : constant System.Address := 16#32#;

   --  USI Pin Position
   USIPP                    : constant System.Address := 16#31#;
   --  USI Pin Position
   USIPOS_Bit               : constant Bit_Number := 0;
   USIPOS                   : constant Nat8       := 16#01#;

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

   --  General Purpose IO register 2
   GPIOR2                   : constant System.Address := 16#2c#;
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

   --  General Purpose register 1
   GPIOR1                   : constant System.Address := 16#2b#;
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

   --  General purpose register 0
   GPIOR0                   : constant System.Address := 16#2a#;
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

   --  Analog Comparator Control And Status Register B
   ACSRB                    : constant System.Address := 16#29#;
   --  Analog Comparator Multiplexer
   ACM0_Bit                 : constant Bit_Number := 0;
   ACM0                     : constant Nat8       := 16#01#;
   --  Analog Comparator Multiplexer
   ACM1_Bit                 : constant Bit_Number := 1;
   ACM1                     : constant Nat8       := 16#02#;
   --  Analog Comparator Multiplexer
   ACM2_Bit                 : constant Bit_Number := 2;
   ACM2                     : constant Nat8       := 16#04#;
   --  Hysteresis Level
   HLEV_Bit                 : constant Bit_Number := 6;
   HLEV                     : constant Nat8       := 16#40#;
   --  Hysteresis Select
   HSEL_Bit                 : constant Bit_Number := 7;
   HSEL                     : constant Nat8       := 16#80#;

   --  Analog Comparator Control And Status Register A
   ACSRA                    : constant System.Address := 16#28#;
   --  Analog Comparator Interrupt Mode Select bit 0
   ACIS0_Bit                : constant Bit_Number := 0;
   ACIS0                    : constant Nat8       := 16#01#;
   --  Analog Comparator Interrupt Mode Select bit 1
   ACIS1_Bit                : constant Bit_Number := 1;
   ACIS1                    : constant Nat8       := 16#02#;
   --  Analog Comparator Multiplexer Enable
   ACME_Bit                 : constant Bit_Number := 2;
   ACME                     : constant Nat8       := 16#04#;
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

   --  The ADC multiplexer Selection Register
   ADMUX                    : constant System.Address := 16#27#;
   --  Analog Channel and Gain Selection Bits
   MUX0_Bit                 : constant Bit_Number := 0;
   MUX0                     : constant Nat8       := 16#01#;
   --  Analog Channel and Gain Selection Bits
   MUX1_Bit                 : constant Bit_Number := 1;
   MUX1                     : constant Nat8       := 16#02#;
   --  Analog Channel and Gain Selection Bits
   MUX2_Bit                 : constant Bit_Number := 2;
   MUX2                     : constant Nat8       := 16#04#;
   --  Analog Channel and Gain Selection Bits
   MUX3_Bit                 : constant Bit_Number := 3;
   MUX3                     : constant Nat8       := 16#08#;
   --  Analog Channel and Gain Selection Bits
   MUX4_Bit                 : constant Bit_Number := 4;
   MUX4                     : constant Nat8       := 16#10#;
   --  Left Adjust Result
   ADLAR_Bit                : constant Bit_Number := 5;
   ADLAR                    : constant Nat8       := 16#20#;
   --  Reference Selection Bit 0
   REFS0_Bit                : constant Bit_Number := 6;
   REFS0                    : constant Nat8       := 16#40#;
   --  Reference Selection Bit 1
   REFS1_Bit                : constant Bit_Number := 7;
   REFS1                    : constant Nat8       := 16#80#;

   --  The ADC Control and Status register
   ADCSRA                   : constant System.Address := 16#26#;
   --  ADC Prescaler Select Bits
   ADPS0_Bit                : constant Bit_Number := 0;
   ADPS0                    : constant Nat8       := 16#01#;
   --  ADC Prescaler Select Bits
   ADPS1_Bit                : constant Bit_Number := 1;
   ADPS1                    : constant Nat8       := 16#02#;
   --  ADC Prescaler Select Bits
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
   --  ADC Auto Trigger Source 0
   ADTS0_Bit                : constant Bit_Number := 0;
   ADTS0                    : constant Nat8       := 16#01#;
   --  ADC Auto Trigger Source 1
   ADTS1_Bit                : constant Bit_Number := 1;
   ADTS1                    : constant Nat8       := 16#02#;
   --  ADC Auto Trigger Source 2
   ADTS2_Bit                : constant Bit_Number := 2;
   ADTS2                    : constant Nat8       := 16#04#;
   MUX5_Bit                 : constant Bit_Number := 3;
   MUX5                     : constant Nat8       := 16#08#;
   REFS2_Bit                : constant Bit_Number := 4;
   REFS2                    : constant Nat8       := 16#10#;
   --  Input Polarity Mode
   IPR_Bit                  : constant Bit_Number := 5;
   IPR                      : constant Nat8       := 16#20#;
   --  Gain Select
   GSEL_Bit                 : constant Bit_Number := 6;
   GSEL                     : constant Nat8       := 16#40#;
   --  Bipolar Input Mode
   BIN_Bit                  : constant Bit_Number := 7;
   BIN                      : constant Nat8       := 16#80#;

   --  Digital Input Disable Register 1
   DIDR1                    : constant System.Address := 16#22#;
   --  ADC7 Digital input Disable
   ADC7D_Bit                : constant Bit_Number := 4;
   ADC7D                    : constant Nat8       := 16#10#;
   --  ADC8 Digital input Disable
   ADC8D_Bit                : constant Bit_Number := 5;
   ADC8D                    : constant Nat8       := 16#20#;
   --  ADC9 Digital input Disable
   ADC9D_Bit                : constant Bit_Number := 6;
   ADC9D                    : constant Nat8       := 16#40#;
   --  ADC10 Digital input Disable
   ADC10D_Bit               : constant Bit_Number := 7;
   ADC10D                   : constant Nat8       := 16#80#;

   --  Digital Input Disable Register 0
   DIDR0                    : constant System.Address := 16#21#;
   --  ADC0 Digital input Disable
   ADC0D_Bit                : constant Bit_Number := 0;
   ADC0D                    : constant Nat8       := 16#01#;
   --  ADC1 Digital input Disable
   ADC1D_Bit                : constant Bit_Number := 1;
   ADC1D                    : constant Nat8       := 16#02#;
   --  ADC2 Digital input Disable
   ADC2D_Bit                : constant Bit_Number := 2;
   ADC2D                    : constant Nat8       := 16#04#;
   --  AREF Digital Input Disable
   AREFD_Bit                : constant Bit_Number := 3;
   AREFD                    : constant Nat8       := 16#08#;
   --  ADC3 Digital input Disable
   ADC3D_Bit                : constant Bit_Number := 4;
   ADC3D                    : constant Nat8       := 16#10#;
   --  ADC4 Digital input Disable
   ADC4D_Bit                : constant Bit_Number := 5;
   ADC4D                    : constant Nat8       := 16#20#;
   --  ADC5 Digital input Disable
   ADC5D_Bit                : constant Bit_Number := 6;
   ADC5D                    : constant Nat8       := 16#40#;
   --  ADC6 Digital input Disable
   ADC6D_Bit                : constant Bit_Number := 7;
   ADC6D                    : constant Nat8       := 16#80#;

   --  Timer/Counter1 Control Register E
   TCCR1E                   : constant System.Address := 16#20#;
   --  Ouput Compare Override Enable Bit 0
   OC1OE0_Bit               : constant Bit_Number := 0;
   OC1OE0                   : constant Nat8       := 16#01#;
   --  Ouput Compare Override Enable Bit 1
   OC1OE1_Bit               : constant Bit_Number := 1;
   OC1OE1                   : constant Nat8       := 16#02#;
   --  Ouput Compare Override Enable Bit 2
   OC1OE2_Bit               : constant Bit_Number := 2;
   OC1OE2                   : constant Nat8       := 16#04#;
   --  Ouput Compare Override Enable Bit 3
   OC1OE3_Bit               : constant Bit_Number := 3;
   OC1OE3                   : constant Nat8       := 16#08#;
   --  Ouput Compare Override Enable Bit 4
   OC1OE4_Bit               : constant Bit_Number := 4;
   OC1OE4                   : constant Nat8       := 16#10#;
   --  Ouput Compare Override Enable Bit 5
   OC1OE5_Bit               : constant Bit_Number := 5;
   OC1OE5                   : constant Nat8       := 16#20#;



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


end AVR.ATtiny261;
