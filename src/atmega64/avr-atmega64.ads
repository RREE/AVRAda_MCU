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

package AVR.ATmega64 is
   pragma Preelaborate;

   CVS_Version : constant String := "$Id: avr-atmega64.ads 881 2008-11-16 22:55:31Z Rolf_Ebert $";


   --
   --  memory sizes
   --
   Flash_Size               : constant := 16#10000#;
   Flash_End                : constant := 16#ffff#;
   EEprom_Size              : constant := 16#0800#;
   E2end                    : constant := 16#07ff#;
   Int_SRAM_Start_Addr      : constant := 16#0100#;
   Int_SRAM_Size            : constant := 16#1000#;
   Ext_SRAM_Start_Addr      : constant := 16#1100#;

   --
   --  interrupts
   --
   Number_Of_Interrupts     : constant := 35;

   --  External Pin, Power-on Reset, Brown-out Reset, Watchdog Reset and
   --    JTAG AVR Reset
   Sig_RESET                : constant        :=  0;
   Sig_RESET_String         : constant String := "__vector_0";
   --  External Interrupt Request 0
   Sig_INT0                 : constant        :=  1;
   Sig_INT0_String          : constant String := "__vector_1";
   --  External Interrupt Request 1
   Sig_INT1                 : constant        :=  2;
   Sig_INT1_String          : constant String := "__vector_2";
   --  External Interrupt Request 2
   Sig_INT2                 : constant        :=  3;
   Sig_INT2_String          : constant String := "__vector_3";
   --  External Interrupt Request 3
   Sig_INT3                 : constant        :=  4;
   Sig_INT3_String          : constant String := "__vector_4";
   --  External Interrupt Request 4
   Sig_INT4                 : constant        :=  5;
   Sig_INT4_String          : constant String := "__vector_5";
   --  External Interrupt Request 5
   Sig_INT5                 : constant        :=  6;
   Sig_INT5_String          : constant String := "__vector_6";
   --  External Interrupt Request 6
   Sig_INT6                 : constant        :=  7;
   Sig_INT6_String          : constant String := "__vector_7";
   --  External Interrupt Request 7
   Sig_INT7                 : constant        :=  8;
   Sig_INT7_String          : constant String := "__vector_8";
   --  Timer/Counter2 Compare Match
   Sig_TIMER2_COMP          : constant        :=  9;
   Sig_TIMER2_COMP_String   : constant String := "__vector_9";
   --  Timer/Counter2 Overflow
   Sig_TIMER2_OVF           : constant        := 10;
   Sig_TIMER2_OVF_String    : constant String := "__vector_10";
   --  Timer/Counter1 Capture Event
   Sig_TIMER1_CAPT          : constant        := 11;
   Sig_TIMER1_CAPT_String   : constant String := "__vector_11";
   --  Timer/Counter1 Compare Match A
   Sig_TIMER1_COMPA         : constant        := 12;
   Sig_TIMER1_COMPA_String  : constant String := "__vector_12";
   --  Timer/Counter Compare Match B
   Sig_TIMER1_COMPB         : constant        := 13;
   Sig_TIMER1_COMPB_String  : constant String := "__vector_13";
   --  Timer/Counter1 Overflow
   Sig_TIMER1_OVF           : constant        := 14;
   Sig_TIMER1_OVF_String    : constant String := "__vector_14";
   --  Timer/Counter0 Compare Match
   Sig_TIMER0_COMP          : constant        := 15;
   Sig_TIMER0_COMP_String   : constant String := "__vector_15";
   --  Timer/Counter0 Overflow
   Sig_TIMER0_OVF           : constant        := 16;
   Sig_TIMER0_OVF_String    : constant String := "__vector_16";
   --  SPI Serial Transfer Complete
   Sig_SPI_STC              : constant        := 17;
   Sig_SPI_STC_String       : constant String := "__vector_17";
   --  USART0, Rx Complete
   Sig_USART0_RX            : constant        := 18;
   Sig_USART0_RX_String     : constant String := "__vector_18";
   --  USART0 Data Register Empty
   Sig_USART0_UDRE          : constant        := 19;
   Sig_USART0_UDRE_String   : constant String := "__vector_19";
   --  USART0, Tx Complete
   Sig_USART0_TX            : constant        := 20;
   Sig_USART0_TX_String     : constant String := "__vector_20";
   --  ADC Conversion Complete
   Sig_ADC                  : constant        := 21;
   Sig_ADC_String           : constant String := "__vector_21";
   --  EEPROM Ready
   Sig_EE_READY             : constant        := 22;
   Sig_EE_READY_String      : constant String := "__vector_22";
   --  Analog Comparator
   Sig_ANALOG_COMP          : constant        := 23;
   Sig_ANALOG_COMP_String   : constant String := "__vector_23";
   --  Timer/Counter1 Compare Match C
   Sig_TIMER1_COMPC         : constant        := 24;
   Sig_TIMER1_COMPC_String  : constant String := "__vector_24";
   --  Timer/Counter3 Capture Event
   Sig_TIMER3_CAPT          : constant        := 25;
   Sig_TIMER3_CAPT_String   : constant String := "__vector_25";
   --  Timer/Counter3 Compare Match A
   Sig_TIMER3_COMPA         : constant        := 26;
   Sig_TIMER3_COMPA_String  : constant String := "__vector_26";
   --  Timer/Counter3 Compare Match B
   Sig_TIMER3_COMPB         : constant        := 27;
   Sig_TIMER3_COMPB_String  : constant String := "__vector_27";
   --  Timer/Counter3 Compare Match C
   Sig_TIMER3_COMPC         : constant        := 28;
   Sig_TIMER3_COMPC_String  : constant String := "__vector_28";
   --  Timer/Counter3 Overflow
   Sig_TIMER3_OVF           : constant        := 29;
   Sig_TIMER3_OVF_String    : constant String := "__vector_29";
   --  USART1, Rx Complete
   Sig_USART1_RX            : constant        := 30;
   Sig_USART1_RX_String     : constant String := "__vector_30";
   --  USART1, Data Register Empty
   Sig_USART1_UDRE          : constant        := 31;
   Sig_USART1_UDRE_String   : constant String := "__vector_31";
   --  USART1, Tx Complete
   Sig_USART1_TX            : constant        := 32;
   Sig_USART1_TX_String     : constant String := "__vector_32";
   --  2-wire Serial Interface
   Sig_TWI                  : constant        := 33;
   Sig_TWI_String           : constant String := "__vector_33";
   --  Store Program Memory Read
   Sig_SPM_READY            : constant        := 34;
   Sig_SPM_READY_String     : constant String := "__vector_34";


   --
   --  I/O registers
   --

   --  USART Control and Status Register C
   UCSR1C_Addr              : constant Address    := 16#9d#;
   UCSR1C                   : Unsigned_8 ;
   for UCSR1C'Address use UCSR1C_Addr;
   pragma Volatile (UCSR1C);
   UCSR1C_Bits              : Bits_In_Byte;
   for UCSR1C_Bits'Address use UCSR1C_Addr;
   pragma Volatile (UCSR1C_Bits);
   --  Clock Polarity
   UCPOL1_Bit               : constant Bit_Number := 0;
   UCPOL1_Mask              : constant Unsigned_8 := 16#01#;
   --  Character Size
   UCSZ10_Bit               : constant Bit_Number := 1;
   UCSZ10_Mask              : constant Unsigned_8 := 16#02#;
   --  Character Size
   UCSZ11_Bit               : constant Bit_Number := 2;
   UCSZ11_Mask              : constant Unsigned_8 := 16#04#;
   --  Stop Bit Select
   USBS1_Bit                : constant Bit_Number := 3;
   USBS1_Mask               : constant Unsigned_8 := 16#08#;
   --  Parity Mode Bit 0
   UPM10_Bit                : constant Bit_Number := 4;
   UPM10_Mask               : constant Unsigned_8 := 16#10#;
   --  Parity Mode Bit 1
   UPM11_Bit                : constant Bit_Number := 5;
   UPM11_Mask               : constant Unsigned_8 := 16#20#;
   --  USART Mode Select
   UMSEL1_Bit               : constant Bit_Number := 6;
   UMSEL1_Mask              : constant Unsigned_8 := 16#40#;

   --  USART I/O Data Register
   UDR1_Addr                : constant Address    := 16#9c#;
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
   UCSR1A_Addr              : constant Address    := 16#9b#;
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
   --  Parity Error
   UPE1_Bit                 : constant Bit_Number := 2;
   UPE1_Mask                : constant Unsigned_8 := 16#04#;
   --  Data overRun
   DOR1_Bit                 : constant Bit_Number := 3;
   DOR1_Mask                : constant Unsigned_8 := 16#08#;
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
   UCSR1B_Addr              : constant Address    := 16#9a#;
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
   --  Character Size
   UCSZ12_Bit               : constant Bit_Number := 2;
   UCSZ12_Mask              : constant Unsigned_8 := 16#04#;
   --  Transmitter Enable
   TXEN1_Bit                : constant Bit_Number := 3;
   TXEN1_Mask               : constant Unsigned_8 := 16#08#;
   --  Receiver Enable
   RXEN1_Bit                : constant Bit_Number := 4;
   RXEN1_Mask               : constant Unsigned_8 := 16#10#;
   --  USART Data register Empty Interrupt Enable
   UDRIE1_Bit               : constant Bit_Number := 5;
   UDRIE1_Mask              : constant Unsigned_8 := 16#20#;
   --  TX Complete Interrupt Enable
   TXCIE1_Bit               : constant Bit_Number := 6;
   TXCIE1_Mask              : constant Unsigned_8 := 16#40#;
   --  RX Complete Interrupt Enable
   RXCIE1_Bit               : constant Bit_Number := 7;
   RXCIE1_Mask              : constant Unsigned_8 := 16#80#;

   --  USART Baud Rate Register Low Byte
   UBRR1L_Addr              : constant Address    := 16#99#;
   UBRR1                    : Unsigned_16;
   for UBRR1'Address use UBRR1L_Addr;
   pragma Volatile (UBRR1);
   UBRR1L                   : Unsigned_8 ;
   for UBRR1L'Address use UBRR1L_Addr;
   pragma Volatile (UBRR1L);
   UBRR1L_Bits              : Bits_In_Byte;
   for UBRR1L_Bits'Address use UBRR1L_Addr;
   pragma Volatile (UBRR1L_Bits);
   --  USART Baud Rate Register bit 0
   UBRR0_Bit                : constant Bit_Number := 0;
   UBRR0_Mask               : constant Unsigned_8 := 16#01#;
   --  USART Baud Rate Register bit 1
--    UBRR1_Bit                : constant Bit_Number := 1;
--    UBRR1_Mask               : constant Unsigned_8 := 16#02#;
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

   --  USART Baud Rate Register Hight Byte
   UBRR1H_Addr              : constant Address    := 16#98#;
   UBRR1H                   : Unsigned_8 ;
   for UBRR1H'Address use UBRR1H_Addr;
   pragma Volatile (UBRR1H);
   UBRR1H_Bits              : Bits_In_Byte;
   for UBRR1H_Bits'Address use UBRR1H_Addr;
   pragma Volatile (UBRR1H_Bits);
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

   --  USART Control and Status Register C
   UCSR0C_Addr              : constant Address    := 16#95#;
   UCSR0C                   : Unsigned_8 ;
   for UCSR0C'Address use UCSR0C_Addr;
   pragma Volatile (UCSR0C);
   UCSR0C_Bits              : Bits_In_Byte;
   for UCSR0C_Bits'Address use UCSR0C_Addr;
   pragma Volatile (UCSR0C_Bits);
   --  Clock Polarity
   UCPOL0_Bit               : constant Bit_Number := 0;
   UCPOL0_Mask              : constant Unsigned_8 := 16#01#;
   --  Character Size
   UCSZ00_Bit               : constant Bit_Number := 1;
   UCSZ00_Mask              : constant Unsigned_8 := 16#02#;
   --  Character Size
   UCSZ01_Bit               : constant Bit_Number := 2;
   UCSZ01_Mask              : constant Unsigned_8 := 16#04#;
   --  Stop Bit Select
   USBS0_Bit                : constant Bit_Number := 3;
   USBS0_Mask               : constant Unsigned_8 := 16#08#;
   --  Parity Mode Bit 0
   UPM00_Bit                : constant Bit_Number := 4;
   UPM00_Mask               : constant Unsigned_8 := 16#10#;
   --  Parity Mode Bit 1
   UPM01_Bit                : constant Bit_Number := 5;
   UPM01_Mask               : constant Unsigned_8 := 16#20#;
   --  USART Mode Select
   UMSEL0_Bit               : constant Bit_Number := 6;
   UMSEL0_Mask              : constant Unsigned_8 := 16#40#;

   --  USART Baud Rate Register Hight Byte
   UBRR0H_Addr              : constant Address    := 16#90#;
   UBRR0H                   : Unsigned_8 ;
   for UBRR0H'Address use UBRR0H_Addr;
   pragma Volatile (UBRR0H);
   UBRR0H_Bits              : Bits_In_Byte;
   for UBRR0H_Bits'Address use UBRR0H_Addr;
   pragma Volatile (UBRR0H_Bits);

   --  The ADC Control and Status register B
   ADCSRB_Addr              : constant Address    := 16#8e#;
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

   --  Timer/Counter3 Control Register C
   TCCR3C_Addr              : constant Address    := 16#8c#;
   TCCR3C                   : Unsigned_8 ;
   for TCCR3C'Address use TCCR3C_Addr;
   pragma Volatile (TCCR3C);
   TCCR3C_Bits              : Bits_In_Byte;
   for TCCR3C_Bits'Address use TCCR3C_Addr;
   pragma Volatile (TCCR3C_Bits);
   --  Force Output Compare for channel C
   FOC3C_Bit                : constant Bit_Number := 5;
   FOC3C_Mask               : constant Unsigned_8 := 16#20#;
   --  Force Output Compare for channel B
   FOC3B_Bit                : constant Bit_Number := 6;
   FOC3B_Mask               : constant Unsigned_8 := 16#40#;
   --  Force Output Compare for channel A
   FOC3A_Bit                : constant Bit_Number := 7;
   FOC3A_Mask               : constant Unsigned_8 := 16#80#;

   --  Timer/Counter3 Control Register A
   TCCR3A_Addr              : constant Address    := 16#8b#;
   TCCR3A                   : Unsigned_8 ;
   for TCCR3A'Address use TCCR3A_Addr;
   pragma Volatile (TCCR3A);
   TCCR3A_Bits              : Bits_In_Byte;
   for TCCR3A_Bits'Address use TCCR3A_Addr;
   pragma Volatile (TCCR3A_Bits);
   --  Waveform Generation Mode Bit 0
   WGM30_Bit                : constant Bit_Number := 0;
   WGM30_Mask               : constant Unsigned_8 := 16#01#;
   --  Waveform Generation Mode Bit 1
   WGM31_Bit                : constant Bit_Number := 1;
   WGM31_Mask               : constant Unsigned_8 := 16#02#;
   --  Compare Output Mode 3C, bit 0
   COM3C0_Bit               : constant Bit_Number := 2;
   COM3C0_Mask              : constant Unsigned_8 := 16#04#;
   --  Compare Output Mode 3C, bit 1
   COM3C1_Bit               : constant Bit_Number := 3;
   COM3C1_Mask              : constant Unsigned_8 := 16#08#;
   --  Compare Output Mode 3B, bit 0
   COM3B0_Bit               : constant Bit_Number := 4;
   COM3B0_Mask              : constant Unsigned_8 := 16#10#;
   --  Compare Output Mode 3B, bit 1
   COM3B1_Bit               : constant Bit_Number := 5;
   COM3B1_Mask              : constant Unsigned_8 := 16#20#;
   --  Comparet Ouput Mode 3A, bit 0
   COM3A0_Bit               : constant Bit_Number := 6;
   COM3A0_Mask              : constant Unsigned_8 := 16#40#;
   --  Compare Output Mode 3A, bit 1
   COM3A1_Bit               : constant Bit_Number := 7;
   COM3A1_Mask              : constant Unsigned_8 := 16#80#;

   --  Timer/Counter3 Control Register B
   TCCR3B_Addr              : constant Address    := 16#8a#;
   TCCR3B                   : Unsigned_8 ;
   for TCCR3B'Address use TCCR3B_Addr;
   pragma Volatile (TCCR3B);
   TCCR3B_Bits              : Bits_In_Byte;
   for TCCR3B_Bits'Address use TCCR3B_Addr;
   pragma Volatile (TCCR3B_Bits);
   --  Clock Select 3 bit 0
   CS30_Bit                 : constant Bit_Number := 0;
   CS30_Mask                : constant Unsigned_8 := 16#01#;
   --  Clock Select 3 bit 1
   CS31_Bit                 : constant Bit_Number := 1;
   CS31_Mask                : constant Unsigned_8 := 16#02#;
   --  Clock Select3 bit 2
   CS32_Bit                 : constant Bit_Number := 2;
   CS32_Mask                : constant Unsigned_8 := 16#04#;
   --  Waveform Generation Mode
   WGM32_Bit                : constant Bit_Number := 3;
   WGM32_Mask               : constant Unsigned_8 := 16#08#;
   --  Waveform Generation Mode
   WGM33_Bit                : constant Bit_Number := 4;
   WGM33_Mask               : constant Unsigned_8 := 16#10#;
   --  Input Capture 3 Edge Select
   ICES3_Bit                : constant Bit_Number := 6;
   ICES3_Mask               : constant Unsigned_8 := 16#40#;
   --  Input Capture 3  Noise Canceler
   ICNC3_Bit                : constant Bit_Number := 7;
   ICNC3_Mask               : constant Unsigned_8 := 16#80#;

   --  Timer/Counter3 High Byte
   TCNT3H_Addr              : constant Address    := 16#89#;
   TCNT3H                   : Unsigned_8 ;
   for TCNT3H'Address use TCNT3H_Addr;
   pragma Volatile (TCNT3H);
   TCNT3H_Bits              : Bits_In_Byte;
   for TCNT3H_Bits'Address use TCNT3H_Addr;
   pragma Volatile (TCNT3H_Bits);
   --  Timer/Counter 3 bit 8
   TCNT3H0_Bit              : constant Bit_Number := 0;
   TCNT3H0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter 3 bit 9
   TCNT3H1_Bit              : constant Bit_Number := 1;
   TCNT3H1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter 3 bit 10
   TCNT3H2_Bit              : constant Bit_Number := 2;
   TCNT3H2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter 3 bit 11
   TCNT3H3_Bit              : constant Bit_Number := 3;
   TCNT3H3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter 3 bit 12
   TCNT3H4_Bit              : constant Bit_Number := 4;
   TCNT3H4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter 3 bit 13
   TCNT3H5_Bit              : constant Bit_Number := 5;
   TCNT3H5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter 3 bit 14
   TCNT3H6_Bit              : constant Bit_Number := 6;
   TCNT3H6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter 3 bit 15
   TCNT3H7_Bit              : constant Bit_Number := 7;
   TCNT3H7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter3 Low Byte
   TCNT3L_Addr              : constant Address    := 16#88#;
   TCNT3                    : Unsigned_16;
   for TCNT3'Address use TCNT3L_Addr;
   pragma Volatile (TCNT3);
   TCNT3L                   : Unsigned_8 ;
   for TCNT3L'Address use TCNT3L_Addr;
   pragma Volatile (TCNT3L);
   TCNT3L_Bits              : Bits_In_Byte;
   for TCNT3L_Bits'Address use TCNT3L_Addr;
   pragma Volatile (TCNT3L_Bits);
   --  Timer/Counter 3 bit 0
   TCN3L0_Bit               : constant Bit_Number := 0;
   TCN3L0_Mask              : constant Unsigned_8 := 16#01#;
   --  Timer/Counter 3 bit 1
   TCN3L1_Bit               : constant Bit_Number := 1;
   TCN3L1_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter 3 bit 2
   TCN3L2_Bit               : constant Bit_Number := 2;
   TCN3L2_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter 3 bit 3
   TCN3L3_Bit               : constant Bit_Number := 3;
   TCN3L3_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter 3 bit 4
   TCN3L4_Bit               : constant Bit_Number := 4;
   TCN3L4_Mask              : constant Unsigned_8 := 16#10#;
   --  Timer/Counter 3 bit 5
   TCN3L5_Bit               : constant Bit_Number := 5;
   TCN3L5_Mask              : constant Unsigned_8 := 16#20#;
   --  Timer/Counter 3 bit 6
   TCN3L6_Bit               : constant Bit_Number := 6;
   TCN3L6_Mask              : constant Unsigned_8 := 16#40#;
   --  Timer/Counter 3 bit 7
   TCN3L7_Bit               : constant Bit_Number := 7;
   TCN3L7_Mask              : constant Unsigned_8 := 16#80#;

   --  Timer/Counter3 Outbut Compare Register A High Byte
   OCR3AH_Addr              : constant Address    := 16#87#;
   OCR3AH                   : Unsigned_8 ;
   for OCR3AH'Address use OCR3AH_Addr;
   pragma Volatile (OCR3AH);
   OCR3AH_Bits              : Bits_In_Byte;
   for OCR3AH_Bits'Address use OCR3AH_Addr;
   pragma Volatile (OCR3AH_Bits);
   --  Timer/Counter3 Output Compare Register A bit 8
   OCR3AH0_Bit              : constant Bit_Number := 0;
   OCR3AH0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter3 Output Compare Register A bit 9
   OCR3AH1_Bit              : constant Bit_Number := 1;
   OCR3AH1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter3 Output Compare Register A bit 10
   OCR3AH2_Bit              : constant Bit_Number := 2;
   OCR3AH2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter3 Output Compare Register A bit 11
   OCR3AH3_Bit              : constant Bit_Number := 3;
   OCR3AH3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter3 Output Compare Register A bit 12
   OCR3AH4_Bit              : constant Bit_Number := 4;
   OCR3AH4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter3 Output Compare Register A bit 13
   OCR3AH5_Bit              : constant Bit_Number := 5;
   OCR3AH5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter3 Output Compare Register A bit 14
   OCR3AH6_Bit              : constant Bit_Number := 6;
   OCR3AH6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter3 Output Compare Register A bit 15
   OCR3AH7_Bit              : constant Bit_Number := 7;
   OCR3AH7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter3 Outbut Compare Register A Low Byte
   OCR3AL_Addr              : constant Address    := 16#86#;
   OCR3A                    : Unsigned_16;
   for OCR3A'Address use OCR3AL_Addr;
   pragma Volatile (OCR3A);
   OCR3AL                   : Unsigned_8 ;
   for OCR3AL'Address use OCR3AL_Addr;
   pragma Volatile (OCR3AL);
   OCR3AL_Bits              : Bits_In_Byte;
   for OCR3AL_Bits'Address use OCR3AL_Addr;
   pragma Volatile (OCR3AL_Bits);
   --  Timer/Counter3 Output Compare Register A bit 0
   OCR3AL0_Bit              : constant Bit_Number := 0;
   OCR3AL0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter3 Output Compare Register A bit 1
   OCR3AL1_Bit              : constant Bit_Number := 1;
   OCR3AL1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter3 Output Compare Register A bit 2
   OCR3AL2_Bit              : constant Bit_Number := 2;
   OCR3AL2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter3 Output Compare Register A bit 3
   OCR3AL3_Bit              : constant Bit_Number := 3;
   OCR3AL3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter3 Output Compare Register A bit 4
   OCR3AL4_Bit              : constant Bit_Number := 4;
   OCR3AL4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter3 Output Compare Register A bit 5
   OCR3AL5_Bit              : constant Bit_Number := 5;
   OCR3AL5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter3 Output Compare Register A bit 6
   OCR3AL6_Bit              : constant Bit_Number := 6;
   OCR3AL6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter3 Output Compare Register A bit 7
   OCR3AL7_Bit              : constant Bit_Number := 7;
   OCR3AL7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter3 Output Compare Register B High Byte
   OCR3BH_Addr              : constant Address    := 16#85#;
   OCR3BH                   : Unsigned_8 ;
   for OCR3BH'Address use OCR3BH_Addr;
   pragma Volatile (OCR3BH);
   OCR3BH_Bits              : Bits_In_Byte;
   for OCR3BH_Bits'Address use OCR3BH_Addr;
   pragma Volatile (OCR3BH_Bits);
   --  Timer/Counter3 Output Compare Register B bit 8
   OCR3BH0_Bit              : constant Bit_Number := 0;
   OCR3BH0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter3 Output Compare Register B bit 9
   OCR3BH1_Bit              : constant Bit_Number := 1;
   OCR3BH1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter3 Output Compare Register B bit 10
   OCR3BH2_Bit              : constant Bit_Number := 2;
   OCR3BH2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter3 Output Compare Register B bit 11
   OCR3BH3_Bit              : constant Bit_Number := 3;
   OCR3BH3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter3 Output Compare Register B bit 12
   OCR3BH4_Bit              : constant Bit_Number := 4;
   OCR3BH4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter3 Output Compare Register B bit 13
   OCR3BH5_Bit              : constant Bit_Number := 5;
   OCR3BH5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter3 Output Compare Register B bit 14
   OCR3BH6_Bit              : constant Bit_Number := 6;
   OCR3BH6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter3 Output Compare Register B bit 15
   OCR3BH7_Bit              : constant Bit_Number := 7;
   OCR3BH7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter3 Output Compare Register B Low Byte
   OCR3BL_Addr              : constant Address    := 16#84#;
   OCR3B                    : Unsigned_16;
   for OCR3B'Address use OCR3BL_Addr;
   pragma Volatile (OCR3B);
   OCR3BL                   : Unsigned_8 ;
   for OCR3BL'Address use OCR3BL_Addr;
   pragma Volatile (OCR3BL);
   OCR3BL_Bits              : Bits_In_Byte;
   for OCR3BL_Bits'Address use OCR3BL_Addr;
   pragma Volatile (OCR3BL_Bits);
   --  Timer/Counter3 Output Compare Register 3 B bit 0
   OCR3BL0_Bit              : constant Bit_Number := 0;
   OCR3BL0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter3 Output Compare Register B bit 1
   OCR3BL1_Bit              : constant Bit_Number := 1;
   OCR3BL1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter3 Output Compare Register B bit 2
   OCR3BL2_Bit              : constant Bit_Number := 2;
   OCR3BL2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter3 Output Compare Register B bit 3
   OCR3BL3_Bit              : constant Bit_Number := 3;
   OCR3BL3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter3 Output Compare Register B bit 4
   OCR3BL4_Bit              : constant Bit_Number := 4;
   OCR3BL4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter3 Output Compare Register B bit 5
   OCR3BL5_Bit              : constant Bit_Number := 5;
   OCR3BL5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter3 Output Compare Register B bit 6
   OCR3BL6_Bit              : constant Bit_Number := 6;
   OCR3BL6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter3 Output Compare Register B bit 7
   OCR3BL7_Bit              : constant Bit_Number := 7;
   OCR3BL7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter3 Output compare Register C High Byte
   OCR3CH_Addr              : constant Address    := 16#83#;
   OCR3CH                   : Unsigned_8 ;
   for OCR3CH'Address use OCR3CH_Addr;
   pragma Volatile (OCR3CH);
   OCR3CH_Bits              : Bits_In_Byte;
   for OCR3CH_Bits'Address use OCR3CH_Addr;
   pragma Volatile (OCR3CH_Bits);
   --  Timer/Counter3 Output compare Register C 8
   OCR3CH0_Bit              : constant Bit_Number := 0;
   OCR3CH0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter3 Output compare Register C 9
   OCR3CH1_Bit              : constant Bit_Number := 1;
   OCR3CH1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter3 Output compare Register C 10
   OCR3CH2_Bit              : constant Bit_Number := 2;
   OCR3CH2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter3 Output compare Register C 11
   OCR3CH3_Bit              : constant Bit_Number := 3;
   OCR3CH3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter3 Output compare Register C 12
   OCR3CH4_Bit              : constant Bit_Number := 4;
   OCR3CH4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter3 Output compare Register C 13
   OCR3CH5_Bit              : constant Bit_Number := 5;
   OCR3CH5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter3 Output compare Register C 14
   OCR3CH6_Bit              : constant Bit_Number := 6;
   OCR3CH6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter3 Output compare Register C 15
   OCR3CH7_Bit              : constant Bit_Number := 7;
   OCR3CH7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter3 Output compare register C Low byte
   OCR3CL_Addr              : constant Address    := 16#82#;
   OCR3C                    : Unsigned_16;
   for OCR3C'Address use OCR3CL_Addr;
   pragma Volatile (OCR3C);
   OCR3CL                   : Unsigned_8 ;
   for OCR3CL'Address use OCR3CL_Addr;
   pragma Volatile (OCR3CL);
   OCR3CL_Bits              : Bits_In_Byte;
   for OCR3CL_Bits'Address use OCR3CL_Addr;
   pragma Volatile (OCR3CL_Bits);
   --  Timer/Counter3 Output compare register C bit 0
   OCR3CL0_Bit              : constant Bit_Number := 0;
   OCR3CL0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter3 Output compare register C bit 1
   OCR3CL1_Bit              : constant Bit_Number := 1;
   OCR3CL1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter3 Output compare register C bit 2
   OCR3CL2_Bit              : constant Bit_Number := 2;
   OCR3CL2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter3 Output compare register C bit 3
   OCR3CL3_Bit              : constant Bit_Number := 3;
   OCR3CL3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter3 Output compare register C bit 4
   OCR3CL4_Bit              : constant Bit_Number := 4;
   OCR3CL4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter3 Output compare register C bit 5
   OCR3CL5_Bit              : constant Bit_Number := 5;
   OCR3CL5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter3 Output compare register C bit 6
   OCR3CL6_Bit              : constant Bit_Number := 6;
   OCR3CL6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter3 Output compare register C bit 7
   OCR3CL7_Bit              : constant Bit_Number := 7;
   OCR3CL7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter3 Input Capture Register High Byte
   ICR3H_Addr               : constant Address    := 16#81#;
   ICR3H                    : Unsigned_8 ;
   for ICR3H'Address use ICR3H_Addr;
   pragma Volatile (ICR3H);
   ICR3H_Bits               : Bits_In_Byte;
   for ICR3H_Bits'Address use ICR3H_Addr;
   pragma Volatile (ICR3H_Bits);
   --  Timer/Counter3 Input Capture Register bit 8
   ICR3H0_Bit               : constant Bit_Number := 0;
   ICR3H0_Mask              : constant Unsigned_8 := 16#01#;
   --  Timer/Counter3 Input Capture Register bit 9
   ICR3H1_Bit               : constant Bit_Number := 1;
   ICR3H1_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter3 Input Capture Register bit 10
   ICR3H2_Bit               : constant Bit_Number := 2;
   ICR3H2_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter3 Input Capture Register bit 11
   ICR3H3_Bit               : constant Bit_Number := 3;
   ICR3H3_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter3 Input Capture Register bit 12
   ICR3H4_Bit               : constant Bit_Number := 4;
   ICR3H4_Mask              : constant Unsigned_8 := 16#10#;
   --  Timer/Counter3 Input Capture Register bit 13
   ICR3H5_Bit               : constant Bit_Number := 5;
   ICR3H5_Mask              : constant Unsigned_8 := 16#20#;
   --  Timer/Counter3 Input Capture Register bit 14
   ICR3H6_Bit               : constant Bit_Number := 6;
   ICR3H6_Mask              : constant Unsigned_8 := 16#40#;
   --  Timer/Counter3 Input Capture Register bit 15
   ICR3H7_Bit               : constant Bit_Number := 7;
   ICR3H7_Mask              : constant Unsigned_8 := 16#80#;

   --  Timer/Counter3 Input Capture Register Low Byte
   ICR3L_Addr               : constant Address    := 16#80#;
   ICR3                     : Unsigned_16;
   for ICR3'Address use ICR3L_Addr;
   pragma Volatile (ICR3);
   ICR3L                    : Unsigned_8 ;
   for ICR3L'Address use ICR3L_Addr;
   pragma Volatile (ICR3L);
   ICR3L_Bits               : Bits_In_Byte;
   for ICR3L_Bits'Address use ICR3L_Addr;
   pragma Volatile (ICR3L_Bits);
   --  Timer/Counter3 Input Capture Register bit 0
   ICR3L0_Bit               : constant Bit_Number := 0;
   ICR3L0_Mask              : constant Unsigned_8 := 16#01#;
   --  Timer/Counter3 Input Capture Register bit 1
   ICR3L1_Bit               : constant Bit_Number := 1;
   ICR3L1_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter3 Input Capture Register bit 2
   ICR3L2_Bit               : constant Bit_Number := 2;
   ICR3L2_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter3 Input Capture Register bit 3
   ICR3L3_Bit               : constant Bit_Number := 3;
   ICR3L3_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter3 Input Capture Register bit 4
   ICR3L4_Bit               : constant Bit_Number := 4;
   ICR3L4_Mask              : constant Unsigned_8 := 16#10#;
   --  Timer/Counter3 Input Capture Register bit 5
   ICR3L5_Bit               : constant Bit_Number := 5;
   ICR3L5_Mask              : constant Unsigned_8 := 16#20#;
   --  Timer/Counter3 Input Capture Register bit 6
   ICR3L6_Bit               : constant Bit_Number := 6;
   ICR3L6_Mask              : constant Unsigned_8 := 16#40#;
   --  Timer/Counter3 Input Capture Register bit 7
   ICR3L7_Bit               : constant Bit_Number := 7;
   ICR3L7_Mask              : constant Unsigned_8 := 16#80#;

   --  Extended Timer/Counter Interrupt Mask Register
   ETIMSK_Addr              : constant Address    := 16#7d#;
   ETIMSK                   : Unsigned_8 ;
   for ETIMSK'Address use ETIMSK_Addr;
   pragma Volatile (ETIMSK);
   ETIMSK_Bits              : Bits_In_Byte;
   for ETIMSK_Bits'Address use ETIMSK_Addr;
   pragma Volatile (ETIMSK_Bits);
   --  Timer/Counter 1, Output Compare Match C Interrupt Enable
   OCIE1C_Bit               : constant Bit_Number := 0;
   OCIE1C_Mask              : constant Unsigned_8 := 16#01#;
   --  Timer/Counter3, Output Compare Match Interrupt Enable
   OCIE3C_Bit               : constant Bit_Number := 1;
   OCIE3C_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter3 Overflow Interrupt Enable
   TOIE3_Bit                : constant Bit_Number := 2;
   TOIE3_Mask               : constant Unsigned_8 := 16#04#;
   --  Timer/Counter3 Output CompareB Match Interrupt Enable
   OCIE3B_Bit               : constant Bit_Number := 3;
   OCIE3B_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter3 Output CompareA Match Interrupt Enable
   OCIE3A_Bit               : constant Bit_Number := 4;
   OCIE3A_Mask              : constant Unsigned_8 := 16#10#;
   --  Timer/Counter3 Input Capture Interrupt Enable
   TICIE3_Bit               : constant Bit_Number := 5;
   TICIE3_Mask              : constant Unsigned_8 := 16#20#;

   --  Extended Timer/Counter Interrupt Flag register
   ETIFR_Addr               : constant Address    := 16#7c#;
   ETIFR                    : Unsigned_8 ;
   for ETIFR'Address use ETIFR_Addr;
   pragma Volatile (ETIFR);
   ETIFR_Bits               : Bits_In_Byte;
   for ETIFR_Bits'Address use ETIFR_Addr;
   pragma Volatile (ETIFR_Bits);
   --  Timer/Counter 1, Output Compare C Match Flag
   OCF1C_Bit                : constant Bit_Number := 0;
   OCF1C_Mask               : constant Unsigned_8 := 16#01#;
   --  Timer/Counter3 Output Compare C Match Flag
   OCF3C_Bit                : constant Bit_Number := 1;
   OCF3C_Mask               : constant Unsigned_8 := 16#02#;
   --  Timer/Counter3 Overflow Flag
   TOV3_Bit                 : constant Bit_Number := 2;
   TOV3_Mask                : constant Unsigned_8 := 16#04#;
   --  Output Compare Flag 1B
   OCF3B_Bit                : constant Bit_Number := 3;
   OCF3B_Mask               : constant Unsigned_8 := 16#08#;
   --  Output Compare Flag 1A
   OCF3A_Bit                : constant Bit_Number := 4;
   OCF3A_Mask               : constant Unsigned_8 := 16#10#;
   --  Input Capture Flag 1
   ICF3_Bit                 : constant Bit_Number := 5;
   ICF3_Mask                : constant Unsigned_8 := 16#20#;

   --  Timer/Counter1 Control Register C
   TCCR1C_Addr              : constant Address    := 16#7a#;
   TCCR1C                   : Unsigned_8 ;
   for TCCR1C'Address use TCCR1C_Addr;
   pragma Volatile (TCCR1C);
   TCCR1C_Bits              : Bits_In_Byte;
   for TCCR1C_Bits'Address use TCCR1C_Addr;
   pragma Volatile (TCCR1C_Bits);
   --  Force Output Compare for channel C
   FOC1C_Bit                : constant Bit_Number := 5;
   FOC1C_Mask               : constant Unsigned_8 := 16#20#;
   --  Force Output Compare for channel B
   FOC1B_Bit                : constant Bit_Number := 6;
   FOC1B_Mask               : constant Unsigned_8 := 16#40#;
   --  Force Output Compare for channel A
   FOC1A_Bit                : constant Bit_Number := 7;
   FOC1A_Mask               : constant Unsigned_8 := 16#80#;

   --  Timer/Counter1 Output Compare Register High Byte
   OCR1CH_Addr              : constant Address    := 16#79#;
   OCR1CH                   : Unsigned_8 ;
   for OCR1CH'Address use OCR1CH_Addr;
   pragma Volatile (OCR1CH);
   OCR1CH_Bits              : Bits_In_Byte;
   for OCR1CH_Bits'Address use OCR1CH_Addr;
   pragma Volatile (OCR1CH_Bits);
   --  Timer/Counter1 Output Compare Register High Byte bit 0
   OCR1CH0_Bit              : constant Bit_Number := 0;
   OCR1CH0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Output Compare Register High Byte bit 1
   OCR1CH1_Bit              : constant Bit_Number := 1;
   OCR1CH1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Output Compare Register High Byte bit 2
   OCR1CH2_Bit              : constant Bit_Number := 2;
   OCR1CH2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Output Compare Register High Byte bit 3
   OCR1CH3_Bit              : constant Bit_Number := 3;
   OCR1CH3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter1 Output Compare Register High Byte bit 4
   OCR1CH4_Bit              : constant Bit_Number := 4;
   OCR1CH4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter1 Output Compare Register High Byte bit 5
   OCR1CH5_Bit              : constant Bit_Number := 5;
   OCR1CH5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter1 Output Compare Register High Byte bit 6
   OCR1CH6_Bit              : constant Bit_Number := 6;
   OCR1CH6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter1 Output Compare Register High Byte bit 7
   OCR1CH7_Bit              : constant Bit_Number := 7;
   OCR1CH7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter1 Output Compare Register Low Byte
   OCR1CL_Addr              : constant Address    := 16#78#;
   OCR1C                    : Unsigned_16;
   for OCR1C'Address use OCR1CL_Addr;
   pragma Volatile (OCR1C);
   OCR1CL                   : Unsigned_8 ;
   for OCR1CL'Address use OCR1CL_Addr;
   pragma Volatile (OCR1CL);
   OCR1CL_Bits              : Bits_In_Byte;
   for OCR1CL_Bits'Address use OCR1CL_Addr;
   pragma Volatile (OCR1CL_Bits);
   --  Timer/Counter1 Output Compare Register Low Byte bit 0
   OCR1CL0_Bit              : constant Bit_Number := 0;
   OCR1CL0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter1 Output Compare Register Low Byte bit 1
   OCR1CL1_Bit              : constant Bit_Number := 1;
   OCR1CL1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Output Compare Register Low Byte bit 2
   OCR1CL2_Bit              : constant Bit_Number := 2;
   OCR1CL2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Output Compare Register Low Byte bit 3
   OCR1CL3_Bit              : constant Bit_Number := 3;
   OCR1CL3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter1 Output Compare Register Low Byte bit 4
   OCR1CL4_Bit              : constant Bit_Number := 4;
   OCR1CL4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter1 Output Compare Register Low Byte bit 5
   OCR1CL5_Bit              : constant Bit_Number := 5;
   OCR1CL5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter1 Output Compare Register Low Byte bit 6
   OCR1CL6_Bit              : constant Bit_Number := 6;
   OCR1CL6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter1 Output Compare Register Low Byte bit 7
   OCR1CL7_Bit              : constant Bit_Number := 7;
   OCR1CL7_Mask             : constant Unsigned_8 := 16#80#;

   --  TWI Control Register
   TWCR_Addr                : constant Address    := 16#74#;
   TWCR                     : Unsigned_8 ;
   for TWCR'Address use TWCR_Addr;
   pragma Volatile (TWCR);
   TWCR_Bits                : Bits_In_Byte;
   for TWCR_Bits'Address use TWCR_Addr;
   pragma Volatile (TWCR_Bits);
   --  TWI Interrupt Enable
   TWIE_Bit                 : constant Bit_Number := 0;
   TWIE_Mask                : constant Unsigned_8 := 16#01#;
   --  TWI Enable Bit
   TWEN_Bit                 : constant Bit_Number := 2;
   TWEN_Mask                : constant Unsigned_8 := 16#04#;
   --  TWI Write Collition Flag
   TWWC_Bit                 : constant Bit_Number := 3;
   TWWC_Mask                : constant Unsigned_8 := 16#08#;
   --  TWI Stop Condition Bit
   TWSTO_Bit                : constant Bit_Number := 4;
   TWSTO_Mask               : constant Unsigned_8 := 16#10#;
   --  TWI Start Condition Bit
   TWSTA_Bit                : constant Bit_Number := 5;
   TWSTA_Mask               : constant Unsigned_8 := 16#20#;
   --  TWI Enable Acknowledge Bit
   TWEA_Bit                 : constant Bit_Number := 6;
   TWEA_Mask                : constant Unsigned_8 := 16#40#;
   --  TWI Interrupt Flag
   TWINT_Bit                : constant Bit_Number := 7;
   TWINT_Mask               : constant Unsigned_8 := 16#80#;

   --  TWI Data register
   TWDR_Addr                : constant Address    := 16#73#;
   TWDR                     : Unsigned_8 ;
   for TWDR'Address use TWDR_Addr;
   pragma Volatile (TWDR);
   TWDR_Bits                : Bits_In_Byte;
   for TWDR_Bits'Address use TWDR_Addr;
   pragma Volatile (TWDR_Bits);
   --  TWI Data Register Bit 0
   TWD0_Bit                 : constant Bit_Number := 0;
   TWD0_Mask                : constant Unsigned_8 := 16#01#;
   --  TWI Data Register Bit 1
   TWD1_Bit                 : constant Bit_Number := 1;
   TWD1_Mask                : constant Unsigned_8 := 16#02#;
   --  TWI Data Register Bit 2
   TWD2_Bit                 : constant Bit_Number := 2;
   TWD2_Mask                : constant Unsigned_8 := 16#04#;
   --  TWI Data Register Bit 3
   TWD3_Bit                 : constant Bit_Number := 3;
   TWD3_Mask                : constant Unsigned_8 := 16#08#;
   --  TWI Data Register Bit 4
   TWD4_Bit                 : constant Bit_Number := 4;
   TWD4_Mask                : constant Unsigned_8 := 16#10#;
   --  TWI Data Register Bit 5
   TWD5_Bit                 : constant Bit_Number := 5;
   TWD5_Mask                : constant Unsigned_8 := 16#20#;
   --  TWI Data Register Bit 6
   TWD6_Bit                 : constant Bit_Number := 6;
   TWD6_Mask                : constant Unsigned_8 := 16#40#;
   --  TWI Data Register Bit 7
   TWD7_Bit                 : constant Bit_Number := 7;
   TWD7_Mask                : constant Unsigned_8 := 16#80#;

   --  TWI (Slave) Address register
   TWAR_Addr                : constant Address    := 16#72#;
   TWAR                     : Unsigned_8 ;
   for TWAR'Address use TWAR_Addr;
   pragma Volatile (TWAR);
   TWAR_Bits                : Bits_In_Byte;
   for TWAR_Bits'Address use TWAR_Addr;
   pragma Volatile (TWAR_Bits);
   --  TWI General Call Recognition Enable Bit
   TWGCE_Bit                : constant Bit_Number := 0;
   TWGCE_Mask               : constant Unsigned_8 := 16#01#;
   --  TWI (Slave) Address register Bit 0
   TWA0_Bit                 : constant Bit_Number := 1;
   TWA0_Mask                : constant Unsigned_8 := 16#02#;
   --  TWI (Slave) Address register Bit 1
   TWA1_Bit                 : constant Bit_Number := 2;
   TWA1_Mask                : constant Unsigned_8 := 16#04#;
   --  TWI (Slave) Address register Bit 2
   TWA2_Bit                 : constant Bit_Number := 3;
   TWA2_Mask                : constant Unsigned_8 := 16#08#;
   --  TWI (Slave) Address register Bit 3
   TWA3_Bit                 : constant Bit_Number := 4;
   TWA3_Mask                : constant Unsigned_8 := 16#10#;
   --  TWI (Slave) Address register Bit 4
   TWA4_Bit                 : constant Bit_Number := 5;
   TWA4_Mask                : constant Unsigned_8 := 16#20#;
   --  TWI (Slave) Address register Bit 5
   TWA5_Bit                 : constant Bit_Number := 6;
   TWA5_Mask                : constant Unsigned_8 := 16#40#;
   --  TWI (Slave) Address register Bit 6
   TWA6_Bit                 : constant Bit_Number := 7;
   TWA6_Mask                : constant Unsigned_8 := 16#80#;

   --  TWI Status Register
   TWSR_Addr                : constant Address    := 16#71#;
   TWSR                     : Unsigned_8 ;
   for TWSR'Address use TWSR_Addr;
   pragma Volatile (TWSR);
   TWSR_Bits                : Bits_In_Byte;
   for TWSR_Bits'Address use TWSR_Addr;
   pragma Volatile (TWSR_Bits);
   --  TWI Prescaler
   TWPS0_Bit                : constant Bit_Number := 0;
   TWPS0_Mask               : constant Unsigned_8 := 16#01#;
   --  TWI Prescaler
   TWPS1_Bit                : constant Bit_Number := 1;
   TWPS1_Mask               : constant Unsigned_8 := 16#02#;
   --  TWI Status
   TWS3_Bit                 : constant Bit_Number := 3;
   TWS3_Mask                : constant Unsigned_8 := 16#08#;
   --  TWI Status
   TWS4_Bit                 : constant Bit_Number := 4;
   TWS4_Mask                : constant Unsigned_8 := 16#10#;
   --  TWI Status
   TWS5_Bit                 : constant Bit_Number := 5;
   TWS5_Mask                : constant Unsigned_8 := 16#20#;
   --  TWI Status
   TWS6_Bit                 : constant Bit_Number := 6;
   TWS6_Mask                : constant Unsigned_8 := 16#40#;
   --  TWI Status
   TWS7_Bit                 : constant Bit_Number := 7;
   TWS7_Mask                : constant Unsigned_8 := 16#80#;

   --  TWI Bit Rate register
   TWBR_Addr                : constant Address    := 16#70#;
   TWBR                     : Unsigned_8 ;
   for TWBR'Address use TWBR_Addr;
   pragma Volatile (TWBR);
   TWBR_Bits                : Bits_In_Byte;
   for TWBR_Bits'Address use TWBR_Addr;
   pragma Volatile (TWBR_Bits);
   TWBR0_Bit                : constant Bit_Number := 0;
   TWBR0_Mask               : constant Unsigned_8 := 16#01#;
   TWBR1_Bit                : constant Bit_Number := 1;
   TWBR1_Mask               : constant Unsigned_8 := 16#02#;
   TWBR2_Bit                : constant Bit_Number := 2;
   TWBR2_Mask               : constant Unsigned_8 := 16#04#;
   TWBR3_Bit                : constant Bit_Number := 3;
   TWBR3_Mask               : constant Unsigned_8 := 16#08#;
   TWBR4_Bit                : constant Bit_Number := 4;
   TWBR4_Mask               : constant Unsigned_8 := 16#10#;
   TWBR5_Bit                : constant Bit_Number := 5;
   TWBR5_Mask               : constant Unsigned_8 := 16#20#;
   TWBR6_Bit                : constant Bit_Number := 6;
   TWBR6_Mask               : constant Unsigned_8 := 16#40#;
   TWBR7_Bit                : constant Bit_Number := 7;
   TWBR7_Mask               : constant Unsigned_8 := 16#80#;

   --  Oscillator Calibration Value
   OSCCAL_Addr              : constant Address    := 16#6f#;
   OSCCAL                   : Unsigned_8 ;
   for OSCCAL'Address use OSCCAL_Addr;
   pragma Volatile (OSCCAL);
   OSCCAL_Bits              : Bits_In_Byte;
   for OSCCAL_Bits'Address use OSCCAL_Addr;
   pragma Volatile (OSCCAL_Bits);
   --  Oscillator Calibration Value
   CAL0_Bit                 : constant Bit_Number := 0;
   CAL0_Mask                : constant Unsigned_8 := 16#01#;
   --  Oscillator Calibration Value
   CAL1_Bit                 : constant Bit_Number := 1;
   CAL1_Mask                : constant Unsigned_8 := 16#02#;
   --  Oscillator Calibration Value
   CAL2_Bit                 : constant Bit_Number := 2;
   CAL2_Mask                : constant Unsigned_8 := 16#04#;
   --  Oscillator Calibration Value
   CAL3_Bit                 : constant Bit_Number := 3;
   CAL3_Mask                : constant Unsigned_8 := 16#08#;
   --  Oscillator Calibration Value
   CAL4_Bit                 : constant Bit_Number := 4;
   CAL4_Mask                : constant Unsigned_8 := 16#10#;
   --  Oscillator Calibration Value
   CAL5_Bit                 : constant Bit_Number := 5;
   CAL5_Mask                : constant Unsigned_8 := 16#20#;
   --  Oscillator Calibration Value
   CAL6_Bit                 : constant Bit_Number := 6;
   CAL6_Mask                : constant Unsigned_8 := 16#40#;
   --  Oscillator Calibration Value
   CAL7_Bit                 : constant Bit_Number := 7;
   CAL7_Mask                : constant Unsigned_8 := 16#80#;

   --  External Memory Control Register A
   XMCRA_Addr               : constant Address    := 16#6d#;
   XMCRA                    : Unsigned_8 ;
   for XMCRA'Address use XMCRA_Addr;
   pragma Volatile (XMCRA);
   XMCRA_Bits               : Bits_In_Byte;
   for XMCRA_Bits'Address use XMCRA_Addr;
   pragma Volatile (XMCRA_Bits);
   --  Wait state select bit upper page
   SRW11_Bit                : constant Bit_Number := 1;
   SRW11_Mask               : constant Unsigned_8 := 16#02#;
   --  Wait state select bit lower page
   SRW00_Bit                : constant Bit_Number := 2;
   SRW00_Mask               : constant Unsigned_8 := 16#04#;
   --  Wait state select bit lower page
   SRW01_Bit                : constant Bit_Number := 3;
   SRW01_Mask               : constant Unsigned_8 := 16#08#;
   --  Wait state page limit
   SRL0_Bit                 : constant Bit_Number := 4;
   SRL0_Mask                : constant Unsigned_8 := 16#10#;
   --  Wait state page limit
   SRL1_Bit                 : constant Bit_Number := 5;
   SRL1_Mask                : constant Unsigned_8 := 16#20#;
   --  Wait state page limit
   SRL2_Bit                 : constant Bit_Number := 6;
   SRL2_Mask                : constant Unsigned_8 := 16#40#;

   --  External Memory Control Register B
   XMCRB_Addr               : constant Address    := 16#6c#;
   XMCRB                    : Unsigned_8 ;
   for XMCRB'Address use XMCRB_Addr;
   pragma Volatile (XMCRB);
   XMCRB_Bits               : Bits_In_Byte;
   for XMCRB_Bits'Address use XMCRB_Addr;
   pragma Volatile (XMCRB_Bits);
   --  External Memory High Mask
   XMM0_Bit                 : constant Bit_Number := 0;
   XMM0_Mask                : constant Unsigned_8 := 16#01#;
   --  External Memory High Mask
   XMM1_Bit                 : constant Bit_Number := 1;
   XMM1_Mask                : constant Unsigned_8 := 16#02#;
   --  External Memory High Mask
   XMM2_Bit                 : constant Bit_Number := 2;
   XMM2_Mask                : constant Unsigned_8 := 16#04#;
   --  External Memory Bus Keeper Enable
   XMBK_Bit                 : constant Bit_Number := 7;
   XMBK_Mask                : constant Unsigned_8 := 16#80#;

   --  External Interrupt Control Register A
   EICRA_Addr               : constant Address    := 16#6a#;
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
   --  External Interrupt Sense Control Bit
   ISC30_Bit                : constant Bit_Number := 6;
   ISC30_Mask               : constant Unsigned_8 := 16#40#;
   --  External Interrupt Sense Control Bit
   ISC31_Bit                : constant Bit_Number := 7;
   ISC31_Mask               : constant Unsigned_8 := 16#80#;

   --  Store Program Memory Control Register
   SPMCSR_Addr              : constant Address    := 16#68#;
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

   --  Data Register, Port G
   PORTG_Addr               : constant Address    := 16#65#;
   PORTG                    : Unsigned_8 ;
   for PORTG'Address use PORTG_Addr;
   pragma Volatile (PORTG);
   PORTG_Bits               : Bits_In_Byte;
   for PORTG_Bits'Address use PORTG_Addr;
   pragma Volatile (PORTG_Bits);
   PORTG0_Bit               : constant Bit_Number := 0;
   PORTG0_Mask              : constant Unsigned_8 := 16#01#;
   PORTG1_Bit               : constant Bit_Number := 1;
   PORTG1_Mask              : constant Unsigned_8 := 16#02#;
   PORTG2_Bit               : constant Bit_Number := 2;
   PORTG2_Mask              : constant Unsigned_8 := 16#04#;
   PORTG3_Bit               : constant Bit_Number := 3;
   PORTG3_Mask              : constant Unsigned_8 := 16#08#;
   PORTG4_Bit               : constant Bit_Number := 4;
   PORTG4_Mask              : constant Unsigned_8 := 16#10#;

   --  Data Direction Register, Port G
   DDRG_Addr                : constant Address    := 16#64#;
   DDRG                     : Unsigned_8 ;
   for DDRG'Address use DDRG_Addr;
   pragma Volatile (DDRG);
   DDRG_Bits                : Bits_In_Byte;
   for DDRG_Bits'Address use DDRG_Addr;
   pragma Volatile (DDRG_Bits);
   DDG0_Bit                 : constant Bit_Number := 0;
   DDG0_Mask                : constant Unsigned_8 := 16#01#;
   DDG1_Bit                 : constant Bit_Number := 1;
   DDG1_Mask                : constant Unsigned_8 := 16#02#;
   DDG2_Bit                 : constant Bit_Number := 2;
   DDG2_Mask                : constant Unsigned_8 := 16#04#;
   DDG3_Bit                 : constant Bit_Number := 3;
   DDG3_Mask                : constant Unsigned_8 := 16#08#;
   DDG4_Bit                 : constant Bit_Number := 4;
   DDG4_Mask                : constant Unsigned_8 := 16#10#;

   --  Input Pins, Port G
   PING_Addr                : constant Address    := 16#63#;
   PING                     : Unsigned_8 ;
   for PING'Address use PING_Addr;
   pragma Volatile (PING);
   PING_Bits                : Bits_In_Byte;
   for PING_Bits'Address use PING_Addr;
   pragma Volatile (PING_Bits);
   PING0_Bit                : constant Bit_Number := 0;
   PING0_Mask               : constant Unsigned_8 := 16#01#;
   PING1_Bit                : constant Bit_Number := 1;
   PING1_Mask               : constant Unsigned_8 := 16#02#;
   PING2_Bit                : constant Bit_Number := 2;
   PING2_Mask               : constant Unsigned_8 := 16#04#;
   PING3_Bit                : constant Bit_Number := 3;
   PING3_Mask               : constant Unsigned_8 := 16#08#;
   PING4_Bit                : constant Bit_Number := 4;
   PING4_Mask               : constant Unsigned_8 := 16#10#;

   --  Data Register, Port F
   PORTF_Addr               : constant Address    := 16#62#;
   PORTF                    : Unsigned_8 ;
   for PORTF'Address use PORTF_Addr;
   pragma Volatile (PORTF);
   PORTF_Bits               : Bits_In_Byte;
   for PORTF_Bits'Address use PORTF_Addr;
   pragma Volatile (PORTF_Bits);
   PORTF0_Bit               : constant Bit_Number := 0;
   PORTF0_Mask              : constant Unsigned_8 := 16#01#;
   PORTF1_Bit               : constant Bit_Number := 1;
   PORTF1_Mask              : constant Unsigned_8 := 16#02#;
   PORTF2_Bit               : constant Bit_Number := 2;
   PORTF2_Mask              : constant Unsigned_8 := 16#04#;
   PORTF3_Bit               : constant Bit_Number := 3;
   PORTF3_Mask              : constant Unsigned_8 := 16#08#;
   PORTF4_Bit               : constant Bit_Number := 4;
   PORTF4_Mask              : constant Unsigned_8 := 16#10#;
   PORTF5_Bit               : constant Bit_Number := 5;
   PORTF5_Mask              : constant Unsigned_8 := 16#20#;
   PORTF6_Bit               : constant Bit_Number := 6;
   PORTF6_Mask              : constant Unsigned_8 := 16#40#;
   PORTF7_Bit               : constant Bit_Number := 7;
   PORTF7_Mask              : constant Unsigned_8 := 16#80#;

   --  Data Direction Register, Port F
   DDRF_Addr                : constant Address    := 16#61#;
   DDRF                     : Unsigned_8 ;
   for DDRF'Address use DDRF_Addr;
   pragma Volatile (DDRF);
   DDRF_Bits                : Bits_In_Byte;
   for DDRF_Bits'Address use DDRF_Addr;
   pragma Volatile (DDRF_Bits);
   DDF0_Bit                 : constant Bit_Number := 0;
   DDF0_Mask                : constant Unsigned_8 := 16#01#;
   DDF1_Bit                 : constant Bit_Number := 1;
   DDF1_Mask                : constant Unsigned_8 := 16#02#;
   DDF2_Bit                 : constant Bit_Number := 2;
   DDF2_Mask                : constant Unsigned_8 := 16#04#;
   DDF3_Bit                 : constant Bit_Number := 3;
   DDF3_Mask                : constant Unsigned_8 := 16#08#;
   DDF4_Bit                 : constant Bit_Number := 4;
   DDF4_Mask                : constant Unsigned_8 := 16#10#;
   DDF5_Bit                 : constant Bit_Number := 5;
   DDF5_Mask                : constant Unsigned_8 := 16#20#;
   DDF6_Bit                 : constant Bit_Number := 6;
   DDF6_Mask                : constant Unsigned_8 := 16#40#;
   DDF7_Bit                 : constant Bit_Number := 7;
   DDF7_Mask                : constant Unsigned_8 := 16#80#;

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

   --  XTAL Divide Control Register
   XDIV_Addr                : constant Address    := 16#5c#;
   XDIV                     : Unsigned_8 ;
   for XDIV'Address use XDIV_Addr;
   pragma Volatile (XDIV);
   XDIV_Bits                : Bits_In_Byte;
   for XDIV_Bits'Address use XDIV_Addr;
   pragma Volatile (XDIV_Bits);
   --  XTAl Divide Select Bit 0
   XDIV0_Bit                : constant Bit_Number := 0;
   XDIV0_Mask               : constant Unsigned_8 := 16#01#;
   --  XTAl Divide Select Bit 1
   XDIV1_Bit                : constant Bit_Number := 1;
   XDIV1_Mask               : constant Unsigned_8 := 16#02#;
   --  XTAl Divide Select Bit 2
   XDIV2_Bit                : constant Bit_Number := 2;
   XDIV2_Mask               : constant Unsigned_8 := 16#04#;
   --  XTAl Divide Select Bit 3
   XDIV3_Bit                : constant Bit_Number := 3;
   XDIV3_Mask               : constant Unsigned_8 := 16#08#;
   --  XTAl Divide Select Bit 4
   XDIV4_Bit                : constant Bit_Number := 4;
   XDIV4_Mask               : constant Unsigned_8 := 16#10#;
   --  XTAl Divide Select Bit 5
   XDIV5_Bit                : constant Bit_Number := 5;
   XDIV5_Mask               : constant Unsigned_8 := 16#20#;
   --  XTAl Divide Select Bit 6
   XDIV6_Bit                : constant Bit_Number := 6;
   XDIV6_Mask               : constant Unsigned_8 := 16#40#;
   --  XTAL Divide Enable
   XDIVEN_Bit               : constant Bit_Number := 7;
   XDIVEN_Mask              : constant Unsigned_8 := 16#80#;

   --  External Interrupt Control Register B
   EICRB_Addr               : constant Address    := 16#5a#;
   EICRB                    : Unsigned_8 ;
   for EICRB'Address use EICRB_Addr;
   pragma Volatile (EICRB);
   EICRB_Bits               : Bits_In_Byte;
   for EICRB_Bits'Address use EICRB_Addr;
   pragma Volatile (EICRB_Bits);
   --  External Interrupt 7-4 Sense Control Bit
   ISC40_Bit                : constant Bit_Number := 0;
   ISC40_Mask               : constant Unsigned_8 := 16#01#;
   --  External Interrupt 7-4 Sense Control Bit
   ISC41_Bit                : constant Bit_Number := 1;
   ISC41_Mask               : constant Unsigned_8 := 16#02#;
   --  External Interrupt 7-4 Sense Control Bit
   ISC50_Bit                : constant Bit_Number := 2;
   ISC50_Mask               : constant Unsigned_8 := 16#04#;
   --  External Interrupt 7-4 Sense Control Bit
   ISC51_Bit                : constant Bit_Number := 3;
   ISC51_Mask               : constant Unsigned_8 := 16#08#;
   --  External Interrupt 7-4 Sense Control Bit
   ISC60_Bit                : constant Bit_Number := 4;
   ISC60_Mask               : constant Unsigned_8 := 16#10#;
   --  External Interrupt 7-4 Sense Control Bit
   ISC61_Bit                : constant Bit_Number := 5;
   ISC61_Mask               : constant Unsigned_8 := 16#20#;
   --  External Interrupt 7-4 Sense Control Bit
   ISC70_Bit                : constant Bit_Number := 6;
   ISC70_Mask               : constant Unsigned_8 := 16#40#;
   --  External Interrupt 7-4 Sense Control Bit
   ISC71_Bit                : constant Bit_Number := 7;
   ISC71_Mask               : constant Unsigned_8 := 16#80#;

   --  External Interrupt Mask Register
   EIMSK_Addr               : constant Address    := 16#59#;
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
   --  External Interrupt Request 3 Enable
   INT3_Bit                 : constant Bit_Number := 3;
   INT3_Mask                : constant Unsigned_8 := 16#08#;
   --  External Interrupt Request 4 Enable
   INT4_Bit                 : constant Bit_Number := 4;
   INT4_Mask                : constant Unsigned_8 := 16#10#;
   --  External Interrupt Request 5 Enable
   INT5_Bit                 : constant Bit_Number := 5;
   INT5_Mask                : constant Unsigned_8 := 16#20#;
   --  External Interrupt Request 6 Enable
   INT6_Bit                 : constant Bit_Number := 6;
   INT6_Mask                : constant Unsigned_8 := 16#40#;
   --  External Interrupt Request 7 Enable
   INT7_Bit                 : constant Bit_Number := 7;
   INT7_Mask                : constant Unsigned_8 := 16#80#;

   --  External Interrupt Flag Register
   EIFR_Addr                : constant Address    := 16#58#;
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
   --  External Interrupt Flag 3
   INTF3_Bit                : constant Bit_Number := 3;
   INTF3_Mask               : constant Unsigned_8 := 16#08#;
   --  External Interrupt Flag 4
   INTF4_Bit                : constant Bit_Number := 4;
   INTF4_Mask               : constant Unsigned_8 := 16#10#;
   --  External Interrupt Flag 5
   INTF5_Bit                : constant Bit_Number := 5;
   INTF5_Mask               : constant Unsigned_8 := 16#20#;
   --  External Interrupt Flag 6
   INTF6_Bit                : constant Bit_Number := 6;
   INTF6_Mask               : constant Unsigned_8 := 16#40#;
   --  External Interrupt Flag 7
   INTF7_Bit                : constant Bit_Number := 7;
   INTF7_Mask               : constant Unsigned_8 := 16#80#;

   --  Timer/Counter Interrupt Mask Register
   TIMSK_Addr               : constant Address    := 16#57#;
   TIMSK                    : Unsigned_8 ;
   for TIMSK'Address use TIMSK_Addr;
   pragma Volatile (TIMSK);
   TIMSK_Bits               : Bits_In_Byte;
   for TIMSK_Bits'Address use TIMSK_Addr;
   pragma Volatile (TIMSK_Bits);
   --  Timer/Counter0 Overflow Interrupt Enable
   TOIE0_Bit                : constant Bit_Number := 0;
   TOIE0_Mask               : constant Unsigned_8 := 16#01#;
   --  Timer/Counter0 Output Compare Match Interrupt register
   OCIE0_Bit                : constant Bit_Number := 1;
   OCIE0_Mask               : constant Unsigned_8 := 16#02#;
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
   TOIE2_Bit                : constant Bit_Number := 6;
   TOIE2_Mask               : constant Unsigned_8 := 16#40#;
   OCIE2_Bit                : constant Bit_Number := 7;
   OCIE2_Mask               : constant Unsigned_8 := 16#80#;

   --  Timer/Counter Interrupt Flag register
   TIFR_Addr                : constant Address    := 16#56#;
   TIFR                     : Unsigned_8 ;
   for TIFR'Address use TIFR_Addr;
   pragma Volatile (TIFR);
   TIFR_Bits                : Bits_In_Byte;
   for TIFR_Bits'Address use TIFR_Addr;
   pragma Volatile (TIFR_Bits);
   --  Timer/Counter0 Overflow Flag
   TOV0_Bit                 : constant Bit_Number := 0;
   TOV0_Mask                : constant Unsigned_8 := 16#01#;
   --  Output Compare Flag 0
   OCF0_Bit                 : constant Bit_Number := 1;
   OCF0_Mask                : constant Unsigned_8 := 16#02#;
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
   --  Interrupt Vector Change Enable
   IVCE_Bit                 : constant Bit_Number := 0;
   IVCE_Mask                : constant Unsigned_8 := 16#01#;
   --  Interrupt Vector Select
   IVSEL_Bit                : constant Bit_Number := 1;
   IVSEL_Mask               : constant Unsigned_8 := 16#02#;
   --  Sleep Mode Select
   SM2_Bit                  : constant Bit_Number := 2;
   SM2_Mask                 : constant Unsigned_8 := 16#04#;
   --  Sleep Mode Select
   SM0_Bit                  : constant Bit_Number := 3;
   SM0_Mask                 : constant Unsigned_8 := 16#08#;
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

   --  MCU Control And Status Register
   MCUCSR_Addr              : constant Address    := 16#54#;
   MCUCSR                   : Unsigned_8 ;
   for MCUCSR'Address use MCUCSR_Addr;
   pragma Volatile (MCUCSR);
   MCUCSR_Bits              : Bits_In_Byte;
   for MCUCSR_Bits'Address use MCUCSR_Addr;
   pragma Volatile (MCUCSR_Bits);
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
   --  JTAG Reset Flag
   JTRF_Bit                 : constant Bit_Number := 4;
   JTRF_Mask                : constant Unsigned_8 := 16#10#;
   --  JTAG Interface Disable
   JTD_Bit                  : constant Bit_Number := 7;
   JTD_Mask                 : constant Unsigned_8 := 16#80#;

   --  Timer/Counter Control Register
   TCCR0_Addr               : constant Address    := 16#53#;
   TCCR0                    : Unsigned_8 ;
   for TCCR0'Address use TCCR0_Addr;
   pragma Volatile (TCCR0);
   TCCR0_Bits               : Bits_In_Byte;
   for TCCR0_Bits'Address use TCCR0_Addr;
   pragma Volatile (TCCR0_Bits);
   --  Clock Select 0
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

   --  Asynchronus Status Register
   ASSR_Addr                : constant Address    := 16#50#;
   ASSR                     : Unsigned_8 ;
   for ASSR'Address use ASSR_Addr;
   pragma Volatile (ASSR);
   ASSR_Bits                : Bits_In_Byte;
   for ASSR_Bits'Address use ASSR_Addr;
   pragma Volatile (ASSR_Bits);
   --  Timer/Counter Control Register 0 Update Busy
   TCR0UB_Bit               : constant Bit_Number := 0;
   TCR0UB_Mask              : constant Unsigned_8 := 16#01#;
   --  Output Compare register 0 Busy
   OCR0UB_Bit               : constant Bit_Number := 1;
   OCR0UB_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter0 Update Busy
   TCN0UB_Bit               : constant Bit_Number := 2;
   TCN0UB_Mask              : constant Unsigned_8 := 16#04#;
   --  Asynchronus Timer/Counter 0
   AS0_Bit                  : constant Bit_Number := 3;
   AS0_Mask                 : constant Unsigned_8 := 16#08#;

   --  Timer/Counter1 Control Register A
   TCCR1A_Addr              : constant Address    := 16#4f#;
   TCCR1A                   : Unsigned_8 ;
   for TCCR1A'Address use TCCR1A_Addr;
   pragma Volatile (TCCR1A);
   TCCR1A_Bits              : Bits_In_Byte;
   for TCCR1A_Bits'Address use TCCR1A_Addr;
   pragma Volatile (TCCR1A_Bits);
   --  Waveform Generation Mode Bit 0
   WGM10_Bit                : constant Bit_Number := 0;
   WGM10_Mask               : constant Unsigned_8 := 16#01#;
   --  Waveform Generation Mode Bit 1
   WGM11_Bit                : constant Bit_Number := 1;
   WGM11_Mask               : constant Unsigned_8 := 16#02#;
   --  Compare Output Mode 1C, bit 0
   COM1C0_Bit               : constant Bit_Number := 2;
   COM1C0_Mask              : constant Unsigned_8 := 16#04#;
   --  Compare Output Mode 1C, bit 1
   COM1C1_Bit               : constant Bit_Number := 3;
   COM1C1_Mask              : constant Unsigned_8 := 16#08#;
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
   --  Clock Select bit 0
   CS10_Bit                 : constant Bit_Number := 0;
   CS10_Mask                : constant Unsigned_8 := 16#01#;
   --  Clock Select 1 bit 1
   CS11_Bit                 : constant Bit_Number := 1;
   CS11_Mask                : constant Unsigned_8 := 16#02#;
   --  Clock Select1 bit 2
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
   --  Waveform Generation Mode
   WGM21_Bit                : constant Bit_Number := 3;
   WGM21_Mask               : constant Unsigned_8 := 16#08#;
   --  Compare Match Output Mode
   COM20_Bit                : constant Bit_Number := 4;
   COM20_Mask               : constant Unsigned_8 := 16#10#;
   --  Compare Match Output Mode
   COM21_Bit                : constant Bit_Number := 5;
   COM21_Mask               : constant Unsigned_8 := 16#20#;
   --  Wafeform Generation Mode
   WGM20_Bit                : constant Bit_Number := 6;
   WGM20_Mask               : constant Unsigned_8 := 16#40#;
   --  Force Output Compare
   FOC2_Bit                 : constant Bit_Number := 7;
   FOC2_Mask                : constant Unsigned_8 := 16#80#;

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

   --  On-Chip Debug Related Register in I/O Memory
   OCDR_Addr                : constant Address    := 16#42#;
   OCDR                     : Unsigned_8 ;
   for OCDR'Address use OCDR_Addr;
   pragma Volatile (OCDR);
   OCDR_Bits                : Bits_In_Byte;
   for OCDR_Bits'Address use OCDR_Addr;
   pragma Volatile (OCDR_Bits);
   --  On-Chip Debug Register Bit 0
   OCDR0_Bit                : constant Bit_Number := 0;
   OCDR0_Mask               : constant Unsigned_8 := 16#01#;
   --  On-Chip Debug Register Bit 1
   OCDR1_Bit                : constant Bit_Number := 1;
   OCDR1_Mask               : constant Unsigned_8 := 16#02#;
   --  On-Chip Debug Register Bit 2
   OCDR2_Bit                : constant Bit_Number := 2;
   OCDR2_Mask               : constant Unsigned_8 := 16#04#;
   --  On-Chip Debug Register Bit 3
   OCDR3_Bit                : constant Bit_Number := 3;
   OCDR3_Mask               : constant Unsigned_8 := 16#08#;
   --  On-Chip Debug Register Bit 4
   OCDR4_Bit                : constant Bit_Number := 4;
   OCDR4_Mask               : constant Unsigned_8 := 16#10#;
   --  On-Chip Debug Register Bit 5
   OCDR5_Bit                : constant Bit_Number := 5;
   OCDR5_Mask               : constant Unsigned_8 := 16#20#;
   --  On-Chip Debug Register Bit 6
   OCDR6_Bit                : constant Bit_Number := 6;
   OCDR6_Mask               : constant Unsigned_8 := 16#40#;
   --  On-Chip Debug Register Bit 7
   OCDR7_Bit                : constant Bit_Number := 7;
   OCDR7_Mask               : constant Unsigned_8 := 16#80#;

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

   --  Special Function IO Register
   SFIOR_Addr               : constant Address    := 16#40#;
   SFIOR                    : Unsigned_8 ;
   for SFIOR'Address use SFIOR_Addr;
   pragma Volatile (SFIOR);
   SFIOR_Bits               : Bits_In_Byte;
   for SFIOR_Bits'Address use SFIOR_Addr;
   pragma Volatile (SFIOR_Bits);
   --  Prescaler Reset Timer/Counter3, Timer/Counter2, and Timer/Counter1
   PSR321_Bit               : constant Bit_Number := 0;
   PSR321_Mask              : constant Unsigned_8 := 16#01#;
   --  Prescaler Reset Timer/Counter0
   PSR0_Bit                 : constant Bit_Number := 1;
   PSR0_Mask                : constant Unsigned_8 := 16#02#;
   --  Pull Up Disable
   PUD_Bit                  : constant Bit_Number := 2;
   PUD_Mask                 : constant Unsigned_8 := 16#04#;
   --  Analog Comparator Multiplexer Enable
   ACME_Bit                 : constant Bit_Number := 3;
   ACME_Mask                : constant Unsigned_8 := 16#08#;
   --  Timer/Counter Synchronization Mode
   TSM_Bit                  : constant Bit_Number := 7;
   TSM_Mask                 : constant Unsigned_8 := 16#80#;

   --  EEPROM Read/Write Access High Byte
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
   --  EEPROM Read/Write Access Bit 9
   EEAR9_Bit                : constant Bit_Number := 1;
   EEAR9_Mask               : constant Unsigned_8 := 16#02#;
   --  EEPROM Read/Write Access Bit 10
   EEAR10_Bit               : constant Bit_Number := 2;
   EEAR10_Mask              : constant Unsigned_8 := 16#04#;

   --  EEPROM Read/Write Access Low Byte
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
   --  Parity Error
   UPE0_Bit                 : constant Bit_Number := 2;
   UPE0_Mask                : constant Unsigned_8 := 16#04#;
   --  Data overRun
   DOR0_Bit                 : constant Bit_Number := 3;
   DOR0_Mask                : constant Unsigned_8 := 16#08#;
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
   --  Character Size
   UCSZ02_Bit               : constant Bit_Number := 2;
   UCSZ02_Mask              : constant Unsigned_8 := 16#04#;
   --  Transmitter Enable
   TXEN0_Bit                : constant Bit_Number := 3;
   TXEN0_Mask               : constant Unsigned_8 := 16#08#;
   --  Receiver Enable
   RXEN0_Bit                : constant Bit_Number := 4;
   RXEN0_Mask               : constant Unsigned_8 := 16#10#;
   --  USART Data register Empty Interrupt Enable
   UDRIE0_Bit               : constant Bit_Number := 5;
   UDRIE0_Mask              : constant Unsigned_8 := 16#20#;
   --  TX Complete Interrupt Enable
   TXCIE0_Bit               : constant Bit_Number := 6;
   TXCIE0_Mask              : constant Unsigned_8 := 16#40#;
   --  RX Complete Interrupt Enable
   RXCIE0_Bit               : constant Bit_Number := 7;
   RXCIE0_Mask              : constant Unsigned_8 := 16#80#;

   --  USART Baud Rate Register Low Byte
   UBRR0L_Addr              : constant Address    := 16#29#;
   UBRR0                    : Unsigned_16;
   for UBRR0'Address use UBRR0L_Addr;
   pragma Volatile (UBRR0);
   UBRR0L                   : Unsigned_8 ;
   for UBRR0L'Address use UBRR0L_Addr;
   pragma Volatile (UBRR0L);
   UBRR0L_Bits              : Bits_In_Byte;
   for UBRR0L_Bits'Address use UBRR0L_Addr;
   pragma Volatile (UBRR0L_Bits);

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

   --  The ADC Control and Status register A
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
   --  ADC  Auto Trigger Enable
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

   --  Data Register, Port E
   PORTE_Addr               : constant Address    := 16#23#;
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
   PORTE3_Bit               : constant Bit_Number := 3;
   PORTE3_Mask              : constant Unsigned_8 := 16#08#;
   PORTE4_Bit               : constant Bit_Number := 4;
   PORTE4_Mask              : constant Unsigned_8 := 16#10#;
   PORTE5_Bit               : constant Bit_Number := 5;
   PORTE5_Mask              : constant Unsigned_8 := 16#20#;
   PORTE6_Bit               : constant Bit_Number := 6;
   PORTE6_Mask              : constant Unsigned_8 := 16#40#;
   PORTE7_Bit               : constant Bit_Number := 7;
   PORTE7_Mask              : constant Unsigned_8 := 16#80#;

   --  Data Direction Register, Port E
   DDRE_Addr                : constant Address    := 16#22#;
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
   DDE3_Bit                 : constant Bit_Number := 3;
   DDE3_Mask                : constant Unsigned_8 := 16#08#;
   DDE4_Bit                 : constant Bit_Number := 4;
   DDE4_Mask                : constant Unsigned_8 := 16#10#;
   DDE5_Bit                 : constant Bit_Number := 5;
   DDE5_Mask                : constant Unsigned_8 := 16#20#;
   DDE6_Bit                 : constant Bit_Number := 6;
   DDE6_Mask                : constant Unsigned_8 := 16#40#;
   DDE7_Bit                 : constant Bit_Number := 7;
   DDE7_Mask                : constant Unsigned_8 := 16#80#;

   --  Input Pins, Port E
   PINE_Addr                : constant Address    := 16#21#;
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
   PINE3_Bit                : constant Bit_Number := 3;
   PINE3_Mask               : constant Unsigned_8 := 16#08#;
   PINE4_Bit                : constant Bit_Number := 4;
   PINE4_Mask               : constant Unsigned_8 := 16#10#;
   PINE5_Bit                : constant Bit_Number := 5;
   PINE5_Mask               : constant Unsigned_8 := 16#20#;
   PINE6_Bit                : constant Bit_Number := 6;
   PINE6_Mask               : constant Unsigned_8 := 16#40#;
   PINE7_Bit                : constant Bit_Number := 7;
   PINE7_Mask               : constant Unsigned_8 := 16#80#;

   --  Input Pins, Port F
   PINF_Addr                : constant Address    := 16#20#;
   PINF                     : Unsigned_8 ;
   for PINF'Address use PINF_Addr;
   pragma Volatile (PINF);
   PINF_Bits                : Bits_In_Byte;
   for PINF_Bits'Address use PINF_Addr;
   pragma Volatile (PINF_Bits);
   PINF0_Bit                : constant Bit_Number := 0;
   PINF0_Mask               : constant Unsigned_8 := 16#01#;
   PINF1_Bit                : constant Bit_Number := 1;
   PINF1_Mask               : constant Unsigned_8 := 16#02#;
   PINF2_Bit                : constant Bit_Number := 2;
   PINF2_Mask               : constant Unsigned_8 := 16#04#;
   PINF3_Bit                : constant Bit_Number := 3;
   PINF3_Mask               : constant Unsigned_8 := 16#08#;
   PINF4_Bit                : constant Bit_Number := 4;
   PINF4_Mask               : constant Unsigned_8 := 16#10#;
   PINF5_Bit                : constant Bit_Number := 5;
   PINF5_Mask               : constant Unsigned_8 := 16#20#;
   PINF6_Bit                : constant Bit_Number := 6;
   PINF6_Mask               : constant Unsigned_8 := 16#40#;
   PINF7_Bit                : constant Bit_Number := 7;
   PINF7_Mask               : constant Unsigned_8 := 16#80#;



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


end AVR.ATmega64;
