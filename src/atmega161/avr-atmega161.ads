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

package AVR.ATmega161 is
   pragma Preelaborate;

   CVS_Version : constant String := "$Id: avr-atmega161.ads 881 2008-11-16 22:55:31Z Rolf_Ebert $";


   --
   --  memory sizes
   --
   Flash_Size               : constant := 16#4000#;
   Flash_End                : constant := 16#3fff#;
   EEprom_Size              : constant := 16#0200#;
   E2end                    : constant := 16#01ff#;
   Int_SRAM_Start_Addr      : constant := 16#60#;
   Int_SRAM_Size            : constant := 16#400#;
   Ext_SRAM_Start_Addr      : constant := 16#460#;

   --
   --  interrupts
   --
   Number_Of_Interrupts     : constant := 21;

   --  External Reset, Power-on Reset and Watchdog Reset
   Sig_RESET                : constant        :=  0;
   Sig_RESET_String         : constant String := "__vector_0";
   --  External Interrupt 0
   Sig_INT0                 : constant        :=  1;
   Sig_INT0_String          : constant String := "__vector_1";
   --  External Interrupt 1
   Sig_INT1                 : constant        :=  2;
   Sig_INT1_String          : constant String := "__vector_2";
   --  External Interrupt 2
   Sig_INT2                 : constant        :=  3;
   Sig_INT2_String          : constant String := "__vector_3";
   --  Timer/Counter2 Compare Match
   Sig_TIMER2_COMP          : constant        :=  4;
   Sig_TIMER2_COMP_String   : constant String := "__vector_4";
   --  Timer/Counter2 Overflow
   Sig_TIMER2_OVF           : constant        :=  5;
   Sig_TIMER2_OVF_String    : constant String := "__vector_5";
   --  Timer/Counter1 Capture Event
   Sig_TIMER1_CAPT          : constant        :=  6;
   Sig_TIMER1_CAPT_String   : constant String := "__vector_6";
   --  Timer/Counter1 Compare Match A
   Sig_TIMER1_COMPA         : constant        :=  7;
   Sig_TIMER1_COMPA_String  : constant String := "__vector_7";
   --  Timer/Counter1 Compare Match B
   Sig_TIMER1_COMPB         : constant        :=  8;
   Sig_TIMER1_COMPB_String  : constant String := "__vector_8";
   --  Timer/Counter1 Overflow
   Sig_TIMER1_OVF           : constant        :=  9;
   Sig_TIMER1_OVF_String    : constant String := "__vector_9";
   --  Timer/Counter0 Compare Match
   Sig_TIMER0_COMP          : constant        := 10;
   Sig_TIMER0_COMP_String   : constant String := "__vector_10";
   --  Timer/Counter0 Overflow
   Sig_TIMER0_OVF           : constant        := 11;
   Sig_TIMER0_OVF_String    : constant String := "__vector_11";
   --  Serial Transfer Complete
   Sig_SPI_STC              : constant        := 12;
   Sig_SPI_STC_String       : constant String := "__vector_12";
   --  UART0, Rx Complete
   Sig_UART0_RX             : constant        := 13;
   Sig_UART0_RX_String      : constant String := "__vector_13";
   --  UART1, Rx Complete
   Sig_UART1_RX             : constant        := 14;
   Sig_UART1_RX_String      : constant String := "__vector_14";
   --  UART0 Data Register Empty
   Sig_UART0_UDRE           : constant        := 15;
   Sig_UART0_UDRE_String    : constant String := "__vector_15";
   --  UART1 Data Register Empty
   Sig_UART1_UDRE           : constant        := 16;
   Sig_UART1_UDRE_String    : constant String := "__vector_16";
   --  UART0, Tx Complete
   Sig_UART0_TX             : constant        := 17;
   Sig_UART0_TX_String      : constant String := "__vector_17";
   --  UART1, Tx Complete
   Sig_UART1_TX             : constant        := 18;
   Sig_UART1_TX_String      : constant String := "__vector_18";
   --  EEPROM Ready
   Sig_EE_RDY               : constant        := 19;
   Sig_EE_RDY_String        : constant String := "__vector_19";
   --  Analog Comparator
   Sig_ANA_COMP             : constant        := 20;
   Sig_ANA_COMP_String      : constant String := "__vector_20";


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

   --  General Interrupt Mask Register
   GIMSK_Addr               : constant Address    := 16#5b#;
   GIMSK                    : Unsigned_8 ;
   for GIMSK'Address use GIMSK_Addr;
   pragma Volatile (GIMSK);
   GIMSK_Bits               : Bits_In_Byte;
   for GIMSK_Bits'Address use GIMSK_Addr;
   pragma Volatile (GIMSK_Bits);
   --  External Interrupt Request 2 Enable
   INT2_Bit                 : constant Bit_Number := 5;
   INT2_Mask                : constant Unsigned_8 := 16#20#;
   --  External Interrupt Request 0 Enable
   INT0_Bit                 : constant Bit_Number := 6;
   INT0_Mask                : constant Unsigned_8 := 16#40#;
   --  External Interrupt Request 1 Enable
   INT1_Bit                 : constant Bit_Number := 7;
   INT1_Mask                : constant Unsigned_8 := 16#80#;

   --  General Interrupt Flag Register
   GIFR_Addr                : constant Address    := 16#5a#;
   GIFR                     : Unsigned_8 ;
   for GIFR'Address use GIFR_Addr;
   pragma Volatile (GIFR);
   GIFR_Bits                : Bits_In_Byte;
   for GIFR_Bits'Address use GIFR_Addr;
   pragma Volatile (GIFR_Bits);
   --  External Interrupt Flag 2
   INTF2_Bit                : constant Bit_Number := 5;
   INTF2_Mask               : constant Unsigned_8 := 16#20#;
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
   --  Timer/Counter0 Output Compare Match Interrupt register
   OCIE0_Bit                : constant Bit_Number := 0;
   OCIE0_Mask               : constant Unsigned_8 := 16#01#;
   --  Timer/Counter0 Overflow Interrupt Enable
   TOIE0_Bit                : constant Bit_Number := 1;
   TOIE0_Mask               : constant Unsigned_8 := 16#02#;
   --  Timer/Counter2 Output Compare Match Interrupt Enable
   OCIE2_Bit                : constant Bit_Number := 2;
   OCIE2_Mask               : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Input Capture Interrupt Enable
   TICIE1_Bit               : constant Bit_Number := 3;
   TICIE1_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter2 Overflow Interrupt Enable
   TOIE2_Bit                : constant Bit_Number := 4;
   TOIE2_Mask               : constant Unsigned_8 := 16#10#;
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
   --  Output Compare Flag 0
   OCF0_Bit                 : constant Bit_Number := 0;
   OCF0_Mask                : constant Unsigned_8 := 16#01#;
   --  Timer/Counter0 Overflow Flag
   TOV0_Bit                 : constant Bit_Number := 1;
   TOV0_Mask                : constant Unsigned_8 := 16#02#;
   --  Output Compare Flag 2
   OCF2_Bit                 : constant Bit_Number := 2;
   OCF2_Mask                : constant Unsigned_8 := 16#04#;
   --  Input Capture Flag 1
   ICF1_Bit                 : constant Bit_Number := 3;
   ICF1_Mask                : constant Unsigned_8 := 16#08#;
   --  Timer/Counter2 Overflow Flag
   TOV2_Bit                 : constant Bit_Number := 4;
   TOV2_Mask                : constant Unsigned_8 := 16#10#;
   --  Output Compare Flag 1B
   OCF1B_Bit                : constant Bit_Number := 5;
   OCF1B_Mask               : constant Unsigned_8 := 16#20#;
   --  Output Compare Flag 1A
   OCF1A_Bit                : constant Bit_Number := 6;
   OCF1A_Mask               : constant Unsigned_8 := 16#40#;
   --  Timer/Counter1 Overflow Flag
   TOV1_Bit                 : constant Bit_Number := 7;
   TOV1_Mask                : constant Unsigned_8 := 16#80#;

   --  Store Program Memory Control Register
   SPMCR_Addr               : constant Address    := 16#57#;
   SPMCR                    : Unsigned_8 ;
   for SPMCR'Address use SPMCR_Addr;
   pragma Volatile (SPMCR);
   SPMCR_Bits               : Bits_In_Byte;
   for SPMCR_Bits'Address use SPMCR_Addr;
   pragma Volatile (SPMCR_Bits);
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

   --  Extended MCU Control Register
   EMCUCR_Addr              : constant Address    := 16#56#;
   EMCUCR                   : Unsigned_8 ;
   for EMCUCR'Address use EMCUCR_Addr;
   pragma Volatile (EMCUCR);
   EMCUCR_Bits              : Bits_In_Byte;
   for EMCUCR_Bits'Address use EMCUCR_Addr;
   pragma Volatile (EMCUCR_Bits);
   --  Interrupt Sense Control 2
   ISC2_Bit                 : constant Bit_Number := 0;
   ISC2_Mask                : constant Unsigned_8 := 16#01#;
   --  Wait State Select Bit 1 for Upper Sector
   SRW11_Bit                : constant Bit_Number := 1;
   SRW11_Mask               : constant Unsigned_8 := 16#02#;
   --  Wait State Select Bit 0 for Lower Sector
   SRW00_Bit                : constant Bit_Number := 2;
   SRW00_Mask               : constant Unsigned_8 := 16#04#;
   --  Wait State Select Bit 1 for Lower Sector
   SRW01_Bit                : constant Bit_Number := 3;
   SRW01_Mask               : constant Unsigned_8 := 16#08#;
   --  Wait State Sector Limit Bit 0
   SRL0_Bit                 : constant Bit_Number := 4;
   SRL0_Mask                : constant Unsigned_8 := 16#10#;
   --  Wait State Sector Limit Bit 1
   SRL1_Bit                 : constant Bit_Number := 5;
   SRL1_Mask                : constant Unsigned_8 := 16#20#;
   --  Wait State Sector Limit Bit 2
   SRL2_Bit                 : constant Bit_Number := 6;
   SRL2_Mask                : constant Unsigned_8 := 16#40#;
   --  Sleep mode Select Bit 0
   SM0_Bit                  : constant Bit_Number := 7;
   SM0_Mask                 : constant Unsigned_8 := 16#80#;

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
   --  Interrupt Sense Control 1 bit 1
   ISC10_Bit                : constant Bit_Number := 2;
   ISC10_Mask               : constant Unsigned_8 := 16#04#;
   --  Interrupt Sense Control 1 bit 1
   ISC11_Bit                : constant Bit_Number := 3;
   ISC11_Mask               : constant Unsigned_8 := 16#08#;
   --  Sleep Mode Select
   SM1_Bit                  : constant Bit_Number := 4;
   SM1_Mask                 : constant Unsigned_8 := 16#10#;
   --  Sleep Enable
   SE_Bit                   : constant Bit_Number := 5;
   SE_Mask                  : constant Unsigned_8 := 16#20#;
   --  External SRAM Wait State Select
   SRW10_Bit                : constant Bit_Number := 6;
   SRW10_Mask               : constant Unsigned_8 := 16#40#;
   --  External SRAM Enable
   SRE_Bit                  : constant Bit_Number := 7;
   SRE_Mask                 : constant Unsigned_8 := 16#80#;

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

   --  Timer/Counter Control Register
   TCCR0_Addr               : constant Address    := 16#53#;
   TCCR0                    : Unsigned_8 ;
   for TCCR0'Address use TCCR0_Addr;
   pragma Volatile (TCCR0);
   TCCR0_Bits               : Bits_In_Byte;
   for TCCR0_Bits'Address use TCCR0_Addr;
   pragma Volatile (TCCR0_Bits);
   --  Clock Select 1
   CS00_Bit                 : constant Bit_Number := 0;
   CS00_Mask                : constant Unsigned_8 := 16#01#;
   --  Clock Select 1
   CS01_Bit                 : constant Bit_Number := 1;
   CS01_Mask                : constant Unsigned_8 := 16#02#;
   --  Clock Select 2
   CS02_Bit                 : constant Bit_Number := 2;
   CS02_Mask                : constant Unsigned_8 := 16#04#;
   --  Waveform Generation Mode 1
   WGM01_Bit                : constant Bit_Number := 3;
   WGM01_Mask               : constant Unsigned_8 := 16#08#;
   --  Compare match Output Mode 0
   COM00_Bit                : constant Bit_Number := 4;
   COM00_Mask               : constant Unsigned_8 := 16#10#;
   --  Compare Match Output Mode 1
   COM01_Bit                : constant Bit_Number := 5;
   COM01_Mask               : constant Unsigned_8 := 16#20#;
   --  Waveform Generation Mode 0
   WGM00_Bit                : constant Bit_Number := 6;
   WGM00_Mask               : constant Unsigned_8 := 16#40#;
   --  Force Output Compare
   FOC0_Bit                 : constant Bit_Number := 7;
   FOC0_Mask                : constant Unsigned_8 := 16#80#;

   --  Timer/Counter Register
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

   --  Output Compare Register
   OCR0_Addr                : constant Address    := 16#51#;
   OCR0                     : Unsigned_8 ;
   for OCR0'Address use OCR0_Addr;
   pragma Volatile (OCR0);
   OCR0_Bits                : Bits_In_Byte;
   for OCR0_Bits'Address use OCR0_Addr;
   pragma Volatile (OCR0_Bits);
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

   --  Special Function IO Register
   SFIOR_Addr               : constant Address    := 16#50#;
   SFIOR                    : Unsigned_8 ;
   for SFIOR'Address use SFIOR_Addr;
   pragma Volatile (SFIOR);
   SFIOR_Bits               : Bits_In_Byte;
   for SFIOR_Bits'Address use SFIOR_Addr;
   pragma Volatile (SFIOR_Bits);
   --  Prescaler Reset Timer/Counter1 and Timer/Counter0
   PSR10_Bit                : constant Bit_Number := 0;
   PSR10_Mask               : constant Unsigned_8 := 16#01#;
   --  Prescaler Reset Timer/Counter2
   PSR2_Bit                 : constant Bit_Number := 1;
   PSR2_Mask                : constant Unsigned_8 := 16#02#;

   --  Timer/Counter1 Control Register A
   TCCR1A_Addr              : constant Address    := 16#4f#;
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
   --  Force Output Compare 1B
   FOC1B_Bit                : constant Bit_Number := 2;
   FOC1B_Mask               : constant Unsigned_8 := 16#04#;
   --  Force Output Compare 1A
   FOC1A_Bit                : constant Bit_Number := 3;
   FOC1A_Mask               : constant Unsigned_8 := 16#08#;
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

   --  Timer/Counter1 Control Register B
   TCCR1B_Addr              : constant Address    := 16#4e#;
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

   --  Timer/Counter2 Control Register
   TCCR2_Addr               : constant Address    := 16#47#;
   TCCR2                    : Unsigned_8 ;
   for TCCR2'Address use TCCR2_Addr;
   pragma Volatile (TCCR2);
   TCCR2_Bits               : Bits_In_Byte;
   for TCCR2_Bits'Address use TCCR2_Addr;
   pragma Volatile (TCCR2_Bits);
   --  Clock Select bit 0
   CS20_Bit                 : constant Bit_Number := 0;
   CS20_Mask                : constant Unsigned_8 := 16#01#;
   --  Clock Select bit 1
   CS21_Bit                 : constant Bit_Number := 1;
   CS21_Mask                : constant Unsigned_8 := 16#02#;
   --  Clock Select bit 2
   CS22_Bit                 : constant Bit_Number := 2;
   CS22_Mask                : constant Unsigned_8 := 16#04#;
   --  Clear Timer/Counter2 on Compare Match
   CTC2_Bit                 : constant Bit_Number := 3;
   CTC2_Mask                : constant Unsigned_8 := 16#08#;
   --  Compare Output Mode bit 0
   COM20_Bit                : constant Bit_Number := 4;
   COM20_Mask               : constant Unsigned_8 := 16#10#;
   --  Compare Output Mode bit 1
   COM21_Bit                : constant Bit_Number := 5;
   COM21_Mask               : constant Unsigned_8 := 16#20#;
   --  Pulse Width Modulator Enable
   PWM2_Bit                 : constant Bit_Number := 6;
   PWM2_Mask                : constant Unsigned_8 := 16#40#;
   --  Force Output Compare
   FOC2_Bit                 : constant Bit_Number := 7;
   FOC2_Mask                : constant Unsigned_8 := 16#80#;

   --  Asynchronous Status Register
   ASSR_Addr                : constant Address    := 16#46#;
   ASSR                     : Unsigned_8 ;
   for ASSR'Address use ASSR_Addr;
   pragma Volatile (ASSR);
   ASSR_Bits                : Bits_In_Byte;
   for ASSR_Bits'Address use ASSR_Addr;
   pragma Volatile (ASSR_Bits);
   --  Timer/counter Control Register2 Update Busy
   TCR2UB_Bit               : constant Bit_Number := 0;
   TCR2UB_Mask              : constant Unsigned_8 := 16#01#;
   --  Output Compare Register2 Update Busy
   OCR2UB_Bit               : constant Bit_Number := 1;
   OCR2UB_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter2 Update Busy
   TCN2UB_Bit               : constant Bit_Number := 2;
   TCN2UB_Mask              : constant Unsigned_8 := 16#04#;
   --  Asynchronous Timer/counter2
   AS2_Bit                  : constant Bit_Number := 3;
   AS2_Mask                 : constant Unsigned_8 := 16#08#;

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

   --  Timer/Counter2
   TCNT2_Addr               : constant Address    := 16#43#;
   TCNT2                    : Unsigned_8 ;
   for TCNT2'Address use TCNT2_Addr;
   pragma Volatile (TCNT2);
   TCNT2_Bits               : Bits_In_Byte;
   for TCNT2_Bits'Address use TCNT2_Addr;
   pragma Volatile (TCNT2_Bits);
   --  Timer/Counter 2 bit 0
   TCNT2_0_Bit              : constant Bit_Number := 0;
   TCNT2_0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter 2 bit 1
   TCNT2_1_Bit              : constant Bit_Number := 1;
   TCNT2_1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter 2 bit 2
   TCNT2_2_Bit              : constant Bit_Number := 2;
   TCNT2_2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter 2 bit 3
   TCNT2_3_Bit              : constant Bit_Number := 3;
   TCNT2_3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter 2 bit 4
   TCNT2_4_Bit              : constant Bit_Number := 4;
   TCNT2_4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter 2 bit 5
   TCNT2_5_Bit              : constant Bit_Number := 5;
   TCNT2_5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter 2 bit 6
   TCNT2_6_Bit              : constant Bit_Number := 6;
   TCNT2_6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter 2 bit 7
   TCNT2_7_Bit              : constant Bit_Number := 7;
   TCNT2_7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter2 Output Compare Register
   OCR2_Addr                : constant Address    := 16#42#;
   OCR2                     : Unsigned_8 ;
   for OCR2'Address use OCR2_Addr;
   pragma Volatile (OCR2);
   OCR2_Bits                : Bits_In_Byte;
   for OCR2_Bits'Address use OCR2_Addr;
   pragma Volatile (OCR2_Bits);
   --  Timer/Counter2 Output Compare Register Bit 0
   OCR2_0_Bit               : constant Bit_Number := 0;
   OCR2_0_Mask              : constant Unsigned_8 := 16#01#;
   --  Timer/Counter2 Output Compare Register Bit 1
   OCR2_1_Bit               : constant Bit_Number := 1;
   OCR2_1_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter2 Output Compare Register Bit 2
   OCR2_2_Bit               : constant Bit_Number := 2;
   OCR2_2_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter2 Output Compare Register Bit 3
   OCR2_3_Bit               : constant Bit_Number := 3;
   OCR2_3_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter2 Output Compare Register Bit 4
   OCR2_4_Bit               : constant Bit_Number := 4;
   OCR2_4_Mask              : constant Unsigned_8 := 16#10#;
   --  Timer/Counter2 Output Compare Register Bit 5
   OCR2_5_Bit               : constant Bit_Number := 5;
   OCR2_5_Mask              : constant Unsigned_8 := 16#20#;
   --  Timer/Counter2 Output Compare Register Bit 6
   OCR2_6_Bit               : constant Bit_Number := 6;
   OCR2_6_Mask              : constant Unsigned_8 := 16#40#;
   --  Timer/Counter2 Output Compare Register Bit 7
   OCR2_7_Bit               : constant Bit_Number := 7;
   OCR2_7_Mask              : constant Unsigned_8 := 16#80#;

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

   --  High Byte Baud Rate Register
   UBRRHI_Addr              : constant Address    := 16#40#;
   UBRRHI                   : Unsigned_8 ;
   for UBRRHI'Address use UBRRHI_Addr;
   pragma Volatile (UBRRHI);
   UBRRHI_Bits              : Bits_In_Byte;
   for UBRRHI_Bits'Address use UBRRHI_Addr;
   pragma Volatile (UBRRHI_Bits);
   --  High Byte Baud Rate Register Port 0 Bit 0
   UBRRHI00_Bit             : constant Bit_Number := 0;
   UBRRHI00_Mask            : constant Unsigned_8 := 16#01#;
   --  High Byte Baud Rate Register Port 0 Bit 1
   UBRRHI01_Bit             : constant Bit_Number := 1;
   UBRRHI01_Mask            : constant Unsigned_8 := 16#02#;
   --  High Byte Baud Rate Register Port 0 Bit 2
   UBRRHI02_Bit             : constant Bit_Number := 2;
   UBRRHI02_Mask            : constant Unsigned_8 := 16#04#;
   --  High Byte Baud Rate Register Port 0 Bit 3
   UBRRHI03_Bit             : constant Bit_Number := 3;
   UBRRHI03_Mask            : constant Unsigned_8 := 16#08#;
   --  High Byte Baud Rate Register Port 0 Bit 0
   UBRRHI10_Bit             : constant Bit_Number := 4;
   UBRRHI10_Mask            : constant Unsigned_8 := 16#10#;
   --  High Byte Baud Rate Register Port 0 Bit 1
   UBRRHI11_Bit             : constant Bit_Number := 5;
   UBRRHI11_Mask            : constant Unsigned_8 := 16#20#;
   --  High Byte Baud Rate Register Port 0 Bit 2
   UBRRHI12_Bit             : constant Bit_Number := 6;
   UBRRHI12_Mask            : constant Unsigned_8 := 16#40#;
   --  High Byte Baud Rate Register Port 0 Bit 3
   UBRRHI13_Bit             : constant Bit_Number := 7;
   UBRRHI13_Mask            : constant Unsigned_8 := 16#80#;

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

   --  USART I/O Data Register
   UDR0_Addr                : constant Address    := 16#2c#;
   UDR0                     : Unsigned_8 ;
   for UDR0'Address use UDR0_Addr;
   pragma Volatile (UDR0);
   UDR0_Bits                : Bits_In_Byte;
   for UDR0_Bits'Address use UDR0_Addr;
   pragma Volatile (UDR0_Bits);
   --  USART I/O Data Register bit 0
   UDR00_Bit                : constant Bit_Number := 0;
   UDR00_Mask               : constant Unsigned_8 := 16#01#;
   --  USART I/O Data Register bit 1
   UDR01_Bit                : constant Bit_Number := 1;
   UDR01_Mask               : constant Unsigned_8 := 16#02#;
   --  USART I/O Data Register bit 2
   UDR02_Bit                : constant Bit_Number := 2;
   UDR02_Mask               : constant Unsigned_8 := 16#04#;
   --  USART I/O Data Register bit 3
   UDR03_Bit                : constant Bit_Number := 3;
   UDR03_Mask               : constant Unsigned_8 := 16#08#;
   --  USART I/O Data Register bit 4
   UDR04_Bit                : constant Bit_Number := 4;
   UDR04_Mask               : constant Unsigned_8 := 16#10#;
   --  USART I/O Data Register bit 5
   UDR05_Bit                : constant Bit_Number := 5;
   UDR05_Mask               : constant Unsigned_8 := 16#20#;
   --  USART I/O Data Register bit 6
   UDR06_Bit                : constant Bit_Number := 6;
   UDR06_Mask               : constant Unsigned_8 := 16#40#;
   --  USART I/O Data Register bit 7
   UDR07_Bit                : constant Bit_Number := 7;
   UDR07_Mask               : constant Unsigned_8 := 16#80#;

   --  USART Control and Status Register A
   UCSR0A_Addr              : constant Address    := 16#2b#;
   UCSR0A                   : Unsigned_8 ;
   for UCSR0A'Address use UCSR0A_Addr;
   pragma Volatile (UCSR0A);
   UCSR0A_Bits              : Bits_In_Byte;
   for UCSR0A_Bits'Address use UCSR0A_Addr;
   pragma Volatile (UCSR0A_Bits);
   --  Multi-processor Communication Mode
   MPCM0_Bit                : constant Bit_Number := 0;
   MPCM0_Mask               : constant Unsigned_8 := 16#01#;
   --  Double the USART transmission speed
   U2X0_Bit                 : constant Bit_Number := 1;
   U2X0_Mask                : constant Unsigned_8 := 16#02#;
   --  Data overRun
   OR0_Bit                  : constant Bit_Number := 3;
   OR0_Mask                 : constant Unsigned_8 := 16#08#;
   --  Framing Error
   FE0_Bit                  : constant Bit_Number := 4;
   FE0_Mask                 : constant Unsigned_8 := 16#10#;
   --  USART Data Register Empty
   UDRE0_Bit                : constant Bit_Number := 5;
   UDRE0_Mask               : constant Unsigned_8 := 16#20#;
   --  USART Transmitt Complete
   TXC0_Bit                 : constant Bit_Number := 6;
   TXC0_Mask                : constant Unsigned_8 := 16#40#;
   --  USART Receive Complete
   RXC0_Bit                 : constant Bit_Number := 7;
   RXC0_Mask                : constant Unsigned_8 := 16#80#;

   --  USART Control and Status Register B
   UCSR0B_Addr              : constant Address    := 16#2a#;
   UCSR0B                   : Unsigned_8 ;
   for UCSR0B'Address use UCSR0B_Addr;
   pragma Volatile (UCSR0B);
   UCSR0B_Bits              : Bits_In_Byte;
   for UCSR0B_Bits'Address use UCSR0B_Addr;
   pragma Volatile (UCSR0B_Bits);
   --  Transmit Data Bit 8
   TXB80_Bit                : constant Bit_Number := 0;
   TXB80_Mask               : constant Unsigned_8 := 16#01#;
   --  Receive Data Bit 8
   RXB80_Bit                : constant Bit_Number := 1;
   RXB80_Mask               : constant Unsigned_8 := 16#02#;
   --  9-Bit Character
   CHR90_Bit                : constant Bit_Number := 2;
   CHR90_Mask               : constant Unsigned_8 := 16#04#;
   --  Transmitter Enable
   TXEN0_Bit                : constant Bit_Number := 3;
   TXEN0_Mask               : constant Unsigned_8 := 16#08#;
   --  Receiver Enable
   RXEN0_Bit                : constant Bit_Number := 4;
   RXEN0_Mask               : constant Unsigned_8 := 16#10#;
   --  USART Data register Empty Interrupt Enable
   UDR0IE0_Bit              : constant Bit_Number := 5;
   UDR0IE0_Mask             : constant Unsigned_8 := 16#20#;
   --  TX Complete Interrupt Enable
   TXCIE0_Bit               : constant Bit_Number := 6;
   TXCIE0_Mask              : constant Unsigned_8 := 16#40#;
   --  RX Complete Interrupt Enable
   RXCIE0_Bit               : constant Bit_Number := 7;
   RXCIE0_Mask              : constant Unsigned_8 := 16#80#;

   --  USART Baud Rate Register Byte
   UBRR0_Addr               : constant Address    := 16#29#;
   UBRR0                    : Unsigned_8 ;
   for UBRR0'Address use UBRR0_Addr;
   pragma Volatile (UBRR0);
   UBRR0_Bits               : Bits_In_Byte;
   for UBRR0_Bits'Address use UBRR0_Addr;
   pragma Volatile (UBRR0_Bits);
   --  USART Baud Rate Register bit 0
   UBRR00_Bit               : constant Bit_Number := 0;
   UBRR00_Mask              : constant Unsigned_8 := 16#01#;
   --  USART Baud Rate Register bit 1
   UBRR01_Bit               : constant Bit_Number := 1;
   UBRR01_Mask              : constant Unsigned_8 := 16#02#;
   --  USART Baud Rate Register bit 2
   UBRR02_Bit               : constant Bit_Number := 2;
   UBRR02_Mask              : constant Unsigned_8 := 16#04#;
   --  USART Baud Rate Register bit 3
   UBRR03_Bit               : constant Bit_Number := 3;
   UBRR03_Mask              : constant Unsigned_8 := 16#08#;
   --  USART Baud Rate Register bit 4
   UBRR04_Bit               : constant Bit_Number := 4;
   UBRR04_Mask              : constant Unsigned_8 := 16#10#;
   --  USART Baud Rate Register bit 5
   UBRR05_Bit               : constant Bit_Number := 5;
   UBRR05_Mask              : constant Unsigned_8 := 16#20#;
   --  USART Baud Rate Register bit 6
   UBRR06_Bit               : constant Bit_Number := 6;
   UBRR06_Mask              : constant Unsigned_8 := 16#40#;
   --  USART Baud Rate Register bit 7
   UBRR07_Bit               : constant Bit_Number := 7;
   UBRR07_Mask              : constant Unsigned_8 := 16#80#;

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
   AINBG_Bit                : constant Bit_Number := 6;
   AINBG_Mask               : constant Unsigned_8 := 16#40#;
   --  Analog Comparator Disable
   ACD_Bit                  : constant Bit_Number := 7;
   ACD_Mask                 : constant Unsigned_8 := 16#80#;

   --  Port E Data Register
   PORTE_Addr               : constant Address    := 16#27#;
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
   DDRE_Addr                : constant Address    := 16#26#;
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
   PINE_Addr                : constant Address    := 16#25#;
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

   --  USART I/O Data Register
   UDR1_Addr                : constant Address    := 16#23#;
   UDR1                     : Unsigned_8 ;
   for UDR1'Address use UDR1_Addr;
   pragma Volatile (UDR1);
   UDR1_Bits                : Bits_In_Byte;
   for UDR1_Bits'Address use UDR1_Addr;
   pragma Volatile (UDR1_Bits);
   --  USART I/O Data Register bit 0
   UDR10_Bit                : constant Bit_Number := 0;
   UDR10_Mask               : constant Unsigned_8 := 16#01#;
   --  USART I/O Data Register bit 1
   UDR11_Bit                : constant Bit_Number := 1;
   UDR11_Mask               : constant Unsigned_8 := 16#02#;
   --  USART I/O Data Register bit 2
   UDR12_Bit                : constant Bit_Number := 2;
   UDR12_Mask               : constant Unsigned_8 := 16#04#;
   --  USART I/O Data Register bit 3
   UDR13_Bit                : constant Bit_Number := 3;
   UDR13_Mask               : constant Unsigned_8 := 16#08#;
   --  USART I/O Data Register bit 4
   UDR14_Bit                : constant Bit_Number := 4;
   UDR14_Mask               : constant Unsigned_8 := 16#10#;
   --  USART I/O Data Register bit 5
   UDR15_Bit                : constant Bit_Number := 5;
   UDR15_Mask               : constant Unsigned_8 := 16#20#;
   --  USART I/O Data Register bit 6
   UDR16_Bit                : constant Bit_Number := 6;
   UDR16_Mask               : constant Unsigned_8 := 16#40#;
   --  USART I/O Data Register bit 7
   UDR17_Bit                : constant Bit_Number := 7;
   UDR17_Mask               : constant Unsigned_8 := 16#80#;

   --  USART Control and Status Register A
   UCSR1A_Addr              : constant Address    := 16#22#;
   UCSR1A                   : Unsigned_8 ;
   for UCSR1A'Address use UCSR1A_Addr;
   pragma Volatile (UCSR1A);
   UCSR1A_Bits              : Bits_In_Byte;
   for UCSR1A_Bits'Address use UCSR1A_Addr;
   pragma Volatile (UCSR1A_Bits);
   --  Multi-processor Communication Mode
   MPCM1_Bit                : constant Bit_Number := 0;
   MPCM1_Mask               : constant Unsigned_8 := 16#01#;
   --  Double the USART transmission speed
   U2X1_Bit                 : constant Bit_Number := 1;
   U2X1_Mask                : constant Unsigned_8 := 16#02#;
   --  Data overRun
   OR1_Bit                  : constant Bit_Number := 3;
   OR1_Mask                 : constant Unsigned_8 := 16#08#;
   --  Framing Error
   FE1_Bit                  : constant Bit_Number := 4;
   FE1_Mask                 : constant Unsigned_8 := 16#10#;
   --  USART Data Register Empty
   UDRE1_Bit                : constant Bit_Number := 5;
   UDRE1_Mask               : constant Unsigned_8 := 16#20#;
   --  USART Transmitt Complete
   TXC1_Bit                 : constant Bit_Number := 6;
   TXC1_Mask                : constant Unsigned_8 := 16#40#;
   --  USART Receive Complete
   RXC1_Bit                 : constant Bit_Number := 7;
   RXC1_Mask                : constant Unsigned_8 := 16#80#;

   --  USART Control and Status Register B
   UCSR1B_Addr              : constant Address    := 16#21#;
   UCSR1B                   : Unsigned_8 ;
   for UCSR1B'Address use UCSR1B_Addr;
   pragma Volatile (UCSR1B);
   UCSR1B_Bits              : Bits_In_Byte;
   for UCSR1B_Bits'Address use UCSR1B_Addr;
   pragma Volatile (UCSR1B_Bits);
   --  Transmit Data Bit 8
   TXB81_Bit                : constant Bit_Number := 0;
   TXB81_Mask               : constant Unsigned_8 := 16#01#;
   --  Receive Data Bit 8
   RXB81_Bit                : constant Bit_Number := 1;
   RXB81_Mask               : constant Unsigned_8 := 16#02#;
   --  9-Bit Character
   CHR91_Bit                : constant Bit_Number := 2;
   CHR91_Mask               : constant Unsigned_8 := 16#04#;
   --  Transmitter Enable
   TXEN1_Bit                : constant Bit_Number := 3;
   TXEN1_Mask               : constant Unsigned_8 := 16#08#;
   --  Receiver Enable
   RXEN1_Bit                : constant Bit_Number := 4;
   RXEN1_Mask               : constant Unsigned_8 := 16#10#;
   --  USART Data register Empty Interrupt Enable
   UDR1IE1_Bit              : constant Bit_Number := 5;
   UDR1IE1_Mask             : constant Unsigned_8 := 16#20#;
   --  TX Complete Interrupt Enable
   TXCIE1_Bit               : constant Bit_Number := 6;
   TXCIE1_Mask              : constant Unsigned_8 := 16#40#;
   --  RX Complete Interrupt Enable
   RXCIE1_Bit               : constant Bit_Number := 7;
   RXCIE1_Mask              : constant Unsigned_8 := 16#80#;

   --  USART Baud Rate Register Byte
   UBRR1_Addr               : constant Address    := 16#20#;
   UBRR1                    : Unsigned_8 ;
   for UBRR1'Address use UBRR1_Addr;
   pragma Volatile (UBRR1);
   UBRR1_Bits               : Bits_In_Byte;
   for UBRR1_Bits'Address use UBRR1_Addr;
   pragma Volatile (UBRR1_Bits);
   --  USART Baud Rate Register bit 0
   UBRR10_Bit               : constant Bit_Number := 0;
   UBRR10_Mask              : constant Unsigned_8 := 16#01#;
   --  USART Baud Rate Register bit 1
   UBRR11_Bit               : constant Bit_Number := 1;
   UBRR11_Mask              : constant Unsigned_8 := 16#02#;
   --  USART Baud Rate Register bit 2
   UBRR12_Bit               : constant Bit_Number := 2;
   UBRR12_Mask              : constant Unsigned_8 := 16#04#;
   --  USART Baud Rate Register bit 3
   UBRR13_Bit               : constant Bit_Number := 3;
   UBRR13_Mask              : constant Unsigned_8 := 16#08#;
   --  USART Baud Rate Register bit 4
   UBRR14_Bit               : constant Bit_Number := 4;
   UBRR14_Mask              : constant Unsigned_8 := 16#10#;
   --  USART Baud Rate Register bit 5
   UBRR15_Bit               : constant Bit_Number := 5;
   UBRR15_Mask              : constant Unsigned_8 := 16#20#;
   --  USART Baud Rate Register bit 6
   UBRR16_Bit               : constant Bit_Number := 6;
   UBRR16_Mask              : constant Unsigned_8 := 16#40#;
   --  USART Baud Rate Register bit 7
   UBRR17_Bit               : constant Bit_Number := 7;
   UBRR17_Mask              : constant Unsigned_8 := 16#80#;



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


end AVR.ATmega161;
