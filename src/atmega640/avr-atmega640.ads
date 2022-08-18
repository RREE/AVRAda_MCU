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

package AVR.ATmega640 is
   pragma Preelaborate;

   CVS_Version : constant String := "$Id: avr-atmega640.ads 881 2008-11-16 22:55:31Z Rolf_Ebert $";


   --
   --  memory sizes
   --
   Flash_Size               : constant := 16#10000#;
   Flash_End                : constant := 16#ffff#;
   EEprom_Size              : constant := 16#1000#;
   E2end                    : constant := 16#0fff#;
   Int_SRAM_Start_Addr      : constant := 16#200#;
   Int_SRAM_Size            : constant := 16#2000#;
   Ext_SRAM_Start_Addr      : constant := 16#2200#;

   --
   --  interrupts
   --
   Number_Of_Interrupts     : constant := 57;

   --  External Pin,Power-on Reset,Brown-out Reset,Watchdog Reset,and JTAG
   --    AVR Reset. See Datasheet.
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
   --  Pin Change Interrupt Request 0
   Sig_PCINT0               : constant        :=  9;
   Sig_PCINT0_String        : constant String := "__vector_9";
   --  Pin Change Interrupt Request 1
   Sig_PCINT1               : constant        := 10;
   Sig_PCINT1_String        : constant String := "__vector_10";
   --  Pin Change Interrupt Request 2
   Sig_PCINT2               : constant        := 11;
   Sig_PCINT2_String        : constant String := "__vector_11";
   --  Watchdog Time-out Interrupt
   Sig_WDT                  : constant        := 12;
   Sig_WDT_String           : constant String := "__vector_12";
   --  Timer/Counter2 Compare Match A
   Sig_TIMER2_COMPA         : constant        := 13;
   Sig_TIMER2_COMPA_String  : constant String := "__vector_13";
   --  Timer/Counter2 Compare Match B
   Sig_TIMER2_COMPB         : constant        := 14;
   Sig_TIMER2_COMPB_String  : constant String := "__vector_14";
   --  Timer/Counter2 Overflow
   Sig_TIMER2_OVF           : constant        := 15;
   Sig_TIMER2_OVF_String    : constant String := "__vector_15";
   --  Timer/Counter1 Capture Event
   Sig_TIMER1_CAPT          : constant        := 16;
   Sig_TIMER1_CAPT_String   : constant String := "__vector_16";
   --  Timer/Counter1 Compare Match A
   Sig_TIMER1_COMPA         : constant        := 17;
   Sig_TIMER1_COMPA_String  : constant String := "__vector_17";
   --  Timer/Counter1 Compare Match B
   Sig_TIMER1_COMPB         : constant        := 18;
   Sig_TIMER1_COMPB_String  : constant String := "__vector_18";
   --  Timer/Counter1 Compare Match C
   Sig_TIMER1_COMPC         : constant        := 19;
   Sig_TIMER1_COMPC_String  : constant String := "__vector_19";
   --  Timer/Counter1 Overflow
   Sig_TIMER1_OVF           : constant        := 20;
   Sig_TIMER1_OVF_String    : constant String := "__vector_20";
   --  Timer/Counter0 Compare Match A
   Sig_TIMER0_COMPA         : constant        := 21;
   Sig_TIMER0_COMPA_String  : constant String := "__vector_21";
   --  Timer/Counter0 Compare Match B
   Sig_TIMER0_COMPB         : constant        := 22;
   Sig_TIMER0_COMPB_String  : constant String := "__vector_22";
   --  Timer/Counter0 Overflow
   Sig_TIMER0_OVF           : constant        := 23;
   Sig_TIMER0_OVF_String    : constant String := "__vector_23";
   --  SPI Serial Transfer Complete
   Sig_SPI_STC              : constant        := 24;
   Sig_SPI_STC_String       : constant String := "__vector_24";
   --  USART0, Rx Complete
   Sig_USART0_RX            : constant        := 25;
   Sig_USART0_RX_String     : constant String := "__vector_25";
   --  USART0 Data register Empty
   Sig_USART0_UDRE          : constant        := 26;
   Sig_USART0_UDRE_String   : constant String := "__vector_26";
   --  USART0, Tx Complete
   Sig_USART0_TX            : constant        := 27;
   Sig_USART0_TX_String     : constant String := "__vector_27";
   --  Analog Comparator
   Sig_ANALOG_COMP          : constant        := 28;
   Sig_ANALOG_COMP_String   : constant String := "__vector_28";
   --  ADC Conversion Complete
   Sig_ADC                  : constant        := 29;
   Sig_ADC_String           : constant String := "__vector_29";
   --  EEPROM Ready
   Sig_EE_READY             : constant        := 30;
   Sig_EE_READY_String      : constant String := "__vector_30";
   --  Timer/Counter3 Capture Event
   Sig_TIMER3_CAPT          : constant        := 31;
   Sig_TIMER3_CAPT_String   : constant String := "__vector_31";
   --  Timer/Counter3 Compare Match A
   Sig_TIMER3_COMPA         : constant        := 32;
   Sig_TIMER3_COMPA_String  : constant String := "__vector_32";
   --  Timer/Counter3 Compare Match B
   Sig_TIMER3_COMPB         : constant        := 33;
   Sig_TIMER3_COMPB_String  : constant String := "__vector_33";
   --  Timer/Counter3 Compare Match C
   Sig_TIMER3_COMPC         : constant        := 34;
   Sig_TIMER3_COMPC_String  : constant String := "__vector_34";
   --  Timer/Counter3 Overflow
   Sig_TIMER3_OVF           : constant        := 35;
   Sig_TIMER3_OVF_String    : constant String := "__vector_35";
   --  USART1, Rx Complete
   Sig_USART1_RX            : constant        := 36;
   Sig_USART1_RX_String     : constant String := "__vector_36";
   --  USART1 Data register Empty
   Sig_USART1_UDRE          : constant        := 37;
   Sig_USART1_UDRE_String   : constant String := "__vector_37";
   --  USART1, Tx Complete
   Sig_USART1_TX            : constant        := 38;
   Sig_USART1_TX_String     : constant String := "__vector_38";
   --  2-wire Serial Interface
   Sig_TWI                  : constant        := 39;
   Sig_TWI_String           : constant String := "__vector_39";
   --  Store Program Memory Read
   Sig_SPM_READY            : constant        := 40;
   Sig_SPM_READY_String     : constant String := "__vector_40";
   --  Timer/Counter4 Capture Event
   Sig_TIMER4_CAPT          : constant        := 41;
   Sig_TIMER4_CAPT_String   : constant String := "__vector_41";
   --  Timer/Counter4 Compare Match A
   Sig_TIMER4_COMPA         : constant        := 42;
   Sig_TIMER4_COMPA_String  : constant String := "__vector_42";
   --  Timer/Counter4 Compare Match B
   Sig_TIMER4_COMPB         : constant        := 43;
   Sig_TIMER4_COMPB_String  : constant String := "__vector_43";
   --  Timer/Counter4 Compare Match C
   Sig_TIMER4_COMPC         : constant        := 44;
   Sig_TIMER4_COMPC_String  : constant String := "__vector_44";
   --  Timer/Counter4 Overflow
   Sig_TIMER4_OVF           : constant        := 45;
   Sig_TIMER4_OVF_String    : constant String := "__vector_45";
   --  Timer/Counter5 Capture Event
   Sig_TIMER5_CAPT          : constant        := 46;
   Sig_TIMER5_CAPT_String   : constant String := "__vector_46";
   --  Timer/Counter5 Compare Match A
   Sig_TIMER5_COMPA         : constant        := 47;
   Sig_TIMER5_COMPA_String  : constant String := "__vector_47";
   --  Timer/Counter5 Compare Match B
   Sig_TIMER5_COMPB         : constant        := 48;
   Sig_TIMER5_COMPB_String  : constant String := "__vector_48";
   --  Timer/Counter5 Compare Match C
   Sig_TIMER5_COMPC         : constant        := 49;
   Sig_TIMER5_COMPC_String  : constant String := "__vector_49";
   --  Timer/Counter5 Overflow
   Sig_TIMER5_OVF           : constant        := 50;
   Sig_TIMER5_OVF_String    : constant String := "__vector_50";
   --  USART2, Rx Complete
   Sig_USART2_RX            : constant        := 51;
   Sig_USART2_RX_String     : constant String := "__vector_51";
   --  USART2 Data register Empty
   Sig_USART2_UDRE          : constant        := 52;
   Sig_USART2_UDRE_String   : constant String := "__vector_52";
   --  USART2, Tx Complete
   Sig_USART2_TX            : constant        := 53;
   Sig_USART2_TX_String     : constant String := "__vector_53";
   --  USART3, Rx Complete
   Sig_USART3_RX            : constant        := 54;
   Sig_USART3_RX_String     : constant String := "__vector_54";
   --  USART3 Data register Empty
   Sig_USART3_UDRE          : constant        := 55;
   Sig_USART3_UDRE_String   : constant String := "__vector_55";
   --  USART3, Tx Complete
   Sig_USART3_TX            : constant        := 56;
   Sig_USART3_TX_String     : constant String := "__vector_56";


   --
   --  I/O registers
   --

   --  USART I/O Data Register
   UDR3_Addr                : constant Address    := 16#136#;
   UDR3                     : Unsigned_8 ;
   for UDR3'Address use UDR3_Addr;
   pragma Volatile (UDR3);
   UDR3_Bits                : Bits_In_Byte;
   for UDR3_Bits'Address use UDR3_Addr;
   pragma Volatile (UDR3_Bits);
   --  USART I/O Data Register bit 0
   UDR3_0_Bit               : constant Bit_Number := 0;
   UDR3_0_Mask              : constant Unsigned_8 := 16#01#;
   --  USART I/O Data Register bit 1
   UDR3_1_Bit               : constant Bit_Number := 1;
   UDR3_1_Mask              : constant Unsigned_8 := 16#02#;
   --  USART I/O Data Register bit 2
   UDR3_2_Bit               : constant Bit_Number := 2;
   UDR3_2_Mask              : constant Unsigned_8 := 16#04#;
   --  USART I/O Data Register bit 3
   UDR3_3_Bit               : constant Bit_Number := 3;
   UDR3_3_Mask              : constant Unsigned_8 := 16#08#;
   --  USART I/O Data Register bit 4
   UDR3_4_Bit               : constant Bit_Number := 4;
   UDR3_4_Mask              : constant Unsigned_8 := 16#10#;
   --  USART I/O Data Register bit 5
   UDR3_5_Bit               : constant Bit_Number := 5;
   UDR3_5_Mask              : constant Unsigned_8 := 16#20#;
   --  USART I/O Data Register bit 6
   UDR3_6_Bit               : constant Bit_Number := 6;
   UDR3_6_Mask              : constant Unsigned_8 := 16#40#;
   --  USART I/O Data Register bit 7
   UDR3_7_Bit               : constant Bit_Number := 7;
   UDR3_7_Mask              : constant Unsigned_8 := 16#80#;

   --  USART Baud Rate Register High Byte
   UBRR3H_Addr              : constant Address    := 16#135#;
   UBRR3H                   : Unsigned_8 ;
   for UBRR3H'Address use UBRR3H_Addr;
   pragma Volatile (UBRR3H);
   UBRR3H_Bits              : Bits_In_Byte;
   for UBRR3H_Bits'Address use UBRR3H_Addr;
   pragma Volatile (UBRR3H_Bits);
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

   --  USART Baud Rate Register Low Byte
   UBRR3L_Addr              : constant Address    := 16#134#;
   UBRR3                    : Unsigned_16;
   for UBRR3'Address use UBRR3L_Addr;
   pragma Volatile (UBRR3);
   UBRR3L                   : Unsigned_8 ;
   for UBRR3L'Address use UBRR3L_Addr;
   pragma Volatile (UBRR3L);
   UBRR3L_Bits              : Bits_In_Byte;
   for UBRR3L_Bits'Address use UBRR3L_Addr;
   pragma Volatile (UBRR3L_Bits);
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
--    UBRR3_Bit                : constant Bit_Number := 3;
--    UBRR3_Mask               : constant Unsigned_8 := 16#08#;
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

   --  USART Control and Status Register C
   UCSR3C_Addr              : constant Address    := 16#132#;
   UCSR3C                   : Unsigned_8 ;
   for UCSR3C'Address use UCSR3C_Addr;
   pragma Volatile (UCSR3C);
   UCSR3C_Bits              : Bits_In_Byte;
   for UCSR3C_Bits'Address use UCSR3C_Addr;
   pragma Volatile (UCSR3C_Bits);
   --  Clock Polarity
   UCPOL3_Bit               : constant Bit_Number := 0;
   UCPOL3_Mask              : constant Unsigned_8 := 16#01#;
   --  Character Size
   UCSZ30_Bit               : constant Bit_Number := 1;
   UCSZ30_Mask              : constant Unsigned_8 := 16#02#;
   --  Character Size
   UCSZ31_Bit               : constant Bit_Number := 2;
   UCSZ31_Mask              : constant Unsigned_8 := 16#04#;
   --  Stop Bit Select
   USBS3_Bit                : constant Bit_Number := 3;
   USBS3_Mask               : constant Unsigned_8 := 16#08#;
   --  Parity Mode Bit 0
   UPM30_Bit                : constant Bit_Number := 4;
   UPM30_Mask               : constant Unsigned_8 := 16#10#;
   --  Parity Mode Bit 1
   UPM31_Bit                : constant Bit_Number := 5;
   UPM31_Mask               : constant Unsigned_8 := 16#20#;
   --  USART Mode Select
   UMSEL30_Bit              : constant Bit_Number := 6;
   UMSEL30_Mask             : constant Unsigned_8 := 16#40#;
   --  USART Mode Select
   UMSEL31_Bit              : constant Bit_Number := 7;
   UMSEL31_Mask             : constant Unsigned_8 := 16#80#;

   --  USART Control and Status Register B
   UCSR3B_Addr              : constant Address    := 16#131#;
   UCSR3B                   : Unsigned_8 ;
   for UCSR3B'Address use UCSR3B_Addr;
   pragma Volatile (UCSR3B);
   UCSR3B_Bits              : Bits_In_Byte;
   for UCSR3B_Bits'Address use UCSR3B_Addr;
   pragma Volatile (UCSR3B_Bits);
   --  Transmit Data Bit 8
   TXB83_Bit                : constant Bit_Number := 0;
   TXB83_Mask               : constant Unsigned_8 := 16#01#;
   --  Receive Data Bit 8
   RXB83_Bit                : constant Bit_Number := 1;
   RXB83_Mask               : constant Unsigned_8 := 16#02#;
   --  Character Size
   UCSZ32_Bit               : constant Bit_Number := 2;
   UCSZ32_Mask              : constant Unsigned_8 := 16#04#;
   --  Transmitter Enable
   TXEN3_Bit                : constant Bit_Number := 3;
   TXEN3_Mask               : constant Unsigned_8 := 16#08#;
   --  Receiver Enable
   RXEN3_Bit                : constant Bit_Number := 4;
   RXEN3_Mask               : constant Unsigned_8 := 16#10#;
   --  USART Data register Empty Interrupt Enable
   UDRIE3_Bit               : constant Bit_Number := 5;
   UDRIE3_Mask              : constant Unsigned_8 := 16#20#;
   --  TX Complete Interrupt Enable
   TXCIE3_Bit               : constant Bit_Number := 6;
   TXCIE3_Mask              : constant Unsigned_8 := 16#40#;
   --  RX Complete Interrupt Enable
   RXCIE3_Bit               : constant Bit_Number := 7;
   RXCIE3_Mask              : constant Unsigned_8 := 16#80#;

   --  USART Control and Status Register A
   UCSR3A_Addr              : constant Address    := 16#130#;
   UCSR3A                   : Unsigned_8 ;
   for UCSR3A'Address use UCSR3A_Addr;
   pragma Volatile (UCSR3A);
   UCSR3A_Bits              : Bits_In_Byte;
   for UCSR3A_Bits'Address use UCSR3A_Addr;
   pragma Volatile (UCSR3A_Bits);
   --  Multi-processor Communication Mode
   MPCM3_Bit                : constant Bit_Number := 0;
   MPCM3_Mask               : constant Unsigned_8 := 16#01#;
   --  Double the USART transmission speed
   U2X3_Bit                 : constant Bit_Number := 1;
   U2X3_Mask                : constant Unsigned_8 := 16#02#;
   --  Parity Error
   UPE3_Bit                 : constant Bit_Number := 2;
   UPE3_Mask                : constant Unsigned_8 := 16#04#;
   --  Data overRun
   DOR3_Bit                 : constant Bit_Number := 3;
   DOR3_Mask                : constant Unsigned_8 := 16#08#;
   --  Framing Error
   FE3_Bit                  : constant Bit_Number := 4;
   FE3_Mask                 : constant Unsigned_8 := 16#10#;
   --  USART Data Register Empty
   UDRE3_Bit                : constant Bit_Number := 5;
   UDRE3_Mask               : constant Unsigned_8 := 16#20#;
   --  USART Transmitt Complete
   TXC3_Bit                 : constant Bit_Number := 6;
   TXC3_Mask                : constant Unsigned_8 := 16#40#;
   --  USART Receive Complete
   RXC3_Bit                 : constant Bit_Number := 7;
   RXC3_Mask                : constant Unsigned_8 := 16#80#;

   --  Timer/Counter5 Output Compare Register B High Byte
   OCR5CH_Addr              : constant Address    := 16#12d#;
   OCR5CH                   : Unsigned_8 ;
   for OCR5CH'Address use OCR5CH_Addr;
   pragma Volatile (OCR5CH);
   OCR5CH_Bits              : Bits_In_Byte;
   for OCR5CH_Bits'Address use OCR5CH_Addr;
   pragma Volatile (OCR5CH_Bits);
   --  Timer/Counter5 Output Compare Register High Byte bit 0
   OCR5CH0_Bit              : constant Bit_Number := 0;
   OCR5CH0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter5 Output Compare Register High Byte bit 1
   OCR5CH1_Bit              : constant Bit_Number := 1;
   OCR5CH1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter5 Output Compare Register High Byte bit 2
   OCR5CH2_Bit              : constant Bit_Number := 2;
   OCR5CH2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter5 Output Compare Register High Byte bit 3
   OCR5CH3_Bit              : constant Bit_Number := 3;
   OCR5CH3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter5 Output Compare Register High Byte bit 4
   OCR5CH4_Bit              : constant Bit_Number := 4;
   OCR5CH4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter5 Output Compare Register High Byte bit 5
   OCR5CH5_Bit              : constant Bit_Number := 5;
   OCR5CH5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter5 Output Compare Register High Byte bit 6
   OCR5CH6_Bit              : constant Bit_Number := 6;
   OCR5CH6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter5 Output Compare Register High Byte bit 7
   OCR5CH7_Bit              : constant Bit_Number := 7;
   OCR5CH7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter5 Output Compare Register B Low Byte
   OCR5CL_Addr              : constant Address    := 16#12c#;
   OCR5C                    : Unsigned_16;
   for OCR5C'Address use OCR5CL_Addr;
   pragma Volatile (OCR5C);
   OCR5CL                   : Unsigned_8 ;
   for OCR5CL'Address use OCR5CL_Addr;
   pragma Volatile (OCR5CL);
   OCR5CL_Bits              : Bits_In_Byte;
   for OCR5CL_Bits'Address use OCR5CL_Addr;
   pragma Volatile (OCR5CL_Bits);
   --  Timer/Counter5 Output Compare Register Low Byte bit 0
   OCR5CL0_Bit              : constant Bit_Number := 0;
   OCR5CL0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter5 Output Compare Register Low Byte bit 1
   OCR5CL1_Bit              : constant Bit_Number := 1;
   OCR5CL1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter5 Output Compare Register Low Byte bit 2
   OCR5CL2_Bit              : constant Bit_Number := 2;
   OCR5CL2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter5 Output Compare Register Low Byte bit 3
   OCR5CL3_Bit              : constant Bit_Number := 3;
   OCR5CL3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter5 Output Compare Register Low Byte bit 4
   OCR5CL4_Bit              : constant Bit_Number := 4;
   OCR5CL4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter5 Output Compare Register Low Byte bit 5
   OCR5CL5_Bit              : constant Bit_Number := 5;
   OCR5CL5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter5 Output Compare Register Low Byte bit 6
   OCR5CL6_Bit              : constant Bit_Number := 6;
   OCR5CL6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter5 Output Compare Register Low Byte bit 7
   OCR5CL7_Bit              : constant Bit_Number := 7;
   OCR5CL7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter5 Output Compare Register B High Byte
   OCR5BH_Addr              : constant Address    := 16#12b#;
   OCR5BH                   : Unsigned_8 ;
   for OCR5BH'Address use OCR5BH_Addr;
   pragma Volatile (OCR5BH);
   OCR5BH_Bits              : Bits_In_Byte;
   for OCR5BH_Bits'Address use OCR5BH_Addr;
   pragma Volatile (OCR5BH_Bits);
   --  Timer/Counter5 Output Compare Register High Byte bit 0
   OCR5BH0_Bit              : constant Bit_Number := 0;
   OCR5BH0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter5 Output Compare Register High Byte bit 1
   OCR5BH1_Bit              : constant Bit_Number := 1;
   OCR5BH1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter5 Output Compare Register High Byte bit 2
   OCR5BH2_Bit              : constant Bit_Number := 2;
   OCR5BH2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter5 Output Compare Register High Byte bit 3
   OCR5BH3_Bit              : constant Bit_Number := 3;
   OCR5BH3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter5 Output Compare Register High Byte bit 4
   OCR5BH4_Bit              : constant Bit_Number := 4;
   OCR5BH4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter5 Output Compare Register High Byte bit 5
   OCR5BH5_Bit              : constant Bit_Number := 5;
   OCR5BH5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter5 Output Compare Register High Byte bit 6
   OCR5BH6_Bit              : constant Bit_Number := 6;
   OCR5BH6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter5 Output Compare Register High Byte bit 7
   OCR5BH7_Bit              : constant Bit_Number := 7;
   OCR5BH7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter5 Output Compare Register B Low Byte
   OCR5BL_Addr              : constant Address    := 16#12a#;
   OCR5B                    : Unsigned_16;
   for OCR5B'Address use OCR5BL_Addr;
   pragma Volatile (OCR5B);
   OCR5BL                   : Unsigned_8 ;
   for OCR5BL'Address use OCR5BL_Addr;
   pragma Volatile (OCR5BL);
   OCR5BL_Bits              : Bits_In_Byte;
   for OCR5BL_Bits'Address use OCR5BL_Addr;
   pragma Volatile (OCR5BL_Bits);
   --  Timer/Counter5 Output Compare Register Low Byte bit 0
   OCR5BL0_Bit              : constant Bit_Number := 0;
   OCR5BL0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter5 Output Compare Register Low Byte bit 1
   OCR5BL1_Bit              : constant Bit_Number := 1;
   OCR5BL1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter5 Output Compare Register Low Byte bit 2
   OCR5BL2_Bit              : constant Bit_Number := 2;
   OCR5BL2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter5 Output Compare Register Low Byte bit 3
   OCR5BL3_Bit              : constant Bit_Number := 3;
   OCR5BL3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter5 Output Compare Register Low Byte bit 4
   OCR5BL4_Bit              : constant Bit_Number := 4;
   OCR5BL4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter5 Output Compare Register Low Byte bit 5
   OCR5BL5_Bit              : constant Bit_Number := 5;
   OCR5BL5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter5 Output Compare Register Low Byte bit 6
   OCR5BL6_Bit              : constant Bit_Number := 6;
   OCR5BL6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter5 Output Compare Register Low Byte bit 7
   OCR5BL7_Bit              : constant Bit_Number := 7;
   OCR5BL7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter5 Outbut Compare Register A High Byte
   OCR5AH_Addr              : constant Address    := 16#129#;
   OCR5AH                   : Unsigned_8 ;
   for OCR5AH'Address use OCR5AH_Addr;
   pragma Volatile (OCR5AH);
   OCR5AH_Bits              : Bits_In_Byte;
   for OCR5AH_Bits'Address use OCR5AH_Addr;
   pragma Volatile (OCR5AH_Bits);
   --  Timer/Counter5 Outbut Compare Register High Byte bit 0
   OCR5AH0_Bit              : constant Bit_Number := 0;
   OCR5AH0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter5 Outbut Compare Register High Byte bit 1
   OCR5AH1_Bit              : constant Bit_Number := 1;
   OCR5AH1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter5 Outbut Compare Register High Byte bit 2
   OCR5AH2_Bit              : constant Bit_Number := 2;
   OCR5AH2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter5 Outbut Compare Register High Byte bit 3
   OCR5AH3_Bit              : constant Bit_Number := 3;
   OCR5AH3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter5 Outbut Compare Register High Byte bit 4
   OCR5AH4_Bit              : constant Bit_Number := 4;
   OCR5AH4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter5 Outbut Compare Register High Byte bit 5
   OCR5AH5_Bit              : constant Bit_Number := 5;
   OCR5AH5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter5 Outbut Compare Register High Byte bit 6
   OCR5AH6_Bit              : constant Bit_Number := 6;
   OCR5AH6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter5 Outbut Compare Register High Byte bit 7
   OCR5AH7_Bit              : constant Bit_Number := 7;
   OCR5AH7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter5 Outbut Compare Register A Low Byte
   OCR5AL_Addr              : constant Address    := 16#128#;
   OCR5A                    : Unsigned_16;
   for OCR5A'Address use OCR5AL_Addr;
   pragma Volatile (OCR5A);
   OCR5AL                   : Unsigned_8 ;
   for OCR5AL'Address use OCR5AL_Addr;
   pragma Volatile (OCR5AL);
   OCR5AL_Bits              : Bits_In_Byte;
   for OCR5AL_Bits'Address use OCR5AL_Addr;
   pragma Volatile (OCR5AL_Bits);
   --  Timer/Counter5 Outbut Compare Register Low Byte Bit 0
   OCR5AL0_Bit              : constant Bit_Number := 0;
   OCR5AL0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter5 Outbut Compare Register Low Byte Bit 1
   OCR5AL1_Bit              : constant Bit_Number := 1;
   OCR5AL1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter5 Outbut Compare Register Low Byte Bit 2
   OCR5AL2_Bit              : constant Bit_Number := 2;
   OCR5AL2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter5 Outbut Compare Register Low Byte Bit 3
   OCR5AL3_Bit              : constant Bit_Number := 3;
   OCR5AL3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter5 Outbut Compare Register Low Byte Bit 4
   OCR5AL4_Bit              : constant Bit_Number := 4;
   OCR5AL4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter5 Outbut Compare Register Low Byte Bit 5
   OCR5AL5_Bit              : constant Bit_Number := 5;
   OCR5AL5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter5 Outbut Compare Register Low Byte Bit 6
   OCR5AL6_Bit              : constant Bit_Number := 6;
   OCR5AL6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter5 Outbut Compare Register Low Byte Bit 7
   OCR5AL7_Bit              : constant Bit_Number := 7;
   OCR5AL7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter5 Input Capture Register High Byte
   ICR5H_Addr               : constant Address    := 16#127#;
   ICR5H                    : Unsigned_8 ;
   for ICR5H'Address use ICR5H_Addr;
   pragma Volatile (ICR5H);
   ICR5H_Bits               : Bits_In_Byte;
   for ICR5H_Bits'Address use ICR5H_Addr;
   pragma Volatile (ICR5H_Bits);
   --  Timer/Counter5 Input Capture Register High Byte bit 0
   ICR5H0_Bit               : constant Bit_Number := 0;
   ICR5H0_Mask              : constant Unsigned_8 := 16#01#;
   --  Timer/Counter5 Input Capture Register High Byte bit 1
   ICR5H1_Bit               : constant Bit_Number := 1;
   ICR5H1_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter5 Input Capture Register High Byte bit 2
   ICR5H2_Bit               : constant Bit_Number := 2;
   ICR5H2_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter5 Input Capture Register High Byte bit 3
   ICR5H3_Bit               : constant Bit_Number := 3;
   ICR5H3_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter5 Input Capture Register High Byte bit 4
   ICR5H4_Bit               : constant Bit_Number := 4;
   ICR5H4_Mask              : constant Unsigned_8 := 16#10#;
   --  Timer/Counter5 Input Capture Register High Byte bit 5
   ICR5H5_Bit               : constant Bit_Number := 5;
   ICR5H5_Mask              : constant Unsigned_8 := 16#20#;
   --  Timer/Counter5 Input Capture Register High Byte bit 6
   ICR5H6_Bit               : constant Bit_Number := 6;
   ICR5H6_Mask              : constant Unsigned_8 := 16#40#;
   --  Timer/Counter5 Input Capture Register High Byte bit 7
   ICR5H7_Bit               : constant Bit_Number := 7;
   ICR5H7_Mask              : constant Unsigned_8 := 16#80#;

   --  Timer/Counter5 Input Capture Register Low Byte
   ICR5L_Addr               : constant Address    := 16#126#;
   ICR5                     : Unsigned_16;
   for ICR5'Address use ICR5L_Addr;
   pragma Volatile (ICR5);
   ICR5L                    : Unsigned_8 ;
   for ICR5L'Address use ICR5L_Addr;
   pragma Volatile (ICR5L);
   ICR5L_Bits               : Bits_In_Byte;
   for ICR5L_Bits'Address use ICR5L_Addr;
   pragma Volatile (ICR5L_Bits);
   --  Timer/Counter5 Input Capture Register Low Byte bit 0
   ICR5L0_Bit               : constant Bit_Number := 0;
   ICR5L0_Mask              : constant Unsigned_8 := 16#01#;
   --  Timer/Counter5 Input Capture Register Low Byte bit 1
   ICR5L1_Bit               : constant Bit_Number := 1;
   ICR5L1_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter5 Input Capture Register Low Byte bit 2
   ICR5L2_Bit               : constant Bit_Number := 2;
   ICR5L2_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter5 Input Capture Register Low Byte bit 3
   ICR5L3_Bit               : constant Bit_Number := 3;
   ICR5L3_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter5 Input Capture Register Low Byte bit 4
   ICR5L4_Bit               : constant Bit_Number := 4;
   ICR5L4_Mask              : constant Unsigned_8 := 16#10#;
   --  Timer/Counter5 Input Capture Register Low Byte bit 5
   ICR5L5_Bit               : constant Bit_Number := 5;
   ICR5L5_Mask              : constant Unsigned_8 := 16#20#;
   --  Timer/Counter5 Input Capture Register Low Byte bit 6
   ICR5L6_Bit               : constant Bit_Number := 6;
   ICR5L6_Mask              : constant Unsigned_8 := 16#40#;
   --  Timer/Counter5 Input Capture Register Low Byte bit 7
   ICR5L7_Bit               : constant Bit_Number := 7;
   ICR5L7_Mask              : constant Unsigned_8 := 16#80#;

   --  Timer/Counter5 High Byte
   TCNT5H_Addr              : constant Address    := 16#125#;
   TCNT5H                   : Unsigned_8 ;
   for TCNT5H'Address use TCNT5H_Addr;
   pragma Volatile (TCNT5H);
   TCNT5H_Bits              : Bits_In_Byte;
   for TCNT5H_Bits'Address use TCNT5H_Addr;
   pragma Volatile (TCNT5H_Bits);
   --  Timer/Counter5 High Byte bit 0
   TCNT5H0_Bit              : constant Bit_Number := 0;
   TCNT5H0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter5 High Byte bit 1
   TCNT5H1_Bit              : constant Bit_Number := 1;
   TCNT5H1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter5 High Byte bit 2
   TCNT5H2_Bit              : constant Bit_Number := 2;
   TCNT5H2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter5 High Byte bit 3
   TCNT5H3_Bit              : constant Bit_Number := 3;
   TCNT5H3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter5 High Byte bit 4
   TCNT5H4_Bit              : constant Bit_Number := 4;
   TCNT5H4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter5 High Byte bit 5
   TCNT5H5_Bit              : constant Bit_Number := 5;
   TCNT5H5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter5 High Byte bit 6
   TCNT5H6_Bit              : constant Bit_Number := 6;
   TCNT5H6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter5 High Byte bit 7
   TCNT5H7_Bit              : constant Bit_Number := 7;
   TCNT5H7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter5 Low Byte
   TCNT5L_Addr              : constant Address    := 16#124#;
   TCNT5                    : Unsigned_16;
   for TCNT5'Address use TCNT5L_Addr;
   pragma Volatile (TCNT5);
   TCNT5L                   : Unsigned_8 ;
   for TCNT5L'Address use TCNT5L_Addr;
   pragma Volatile (TCNT5L);
   TCNT5L_Bits              : Bits_In_Byte;
   for TCNT5L_Bits'Address use TCNT5L_Addr;
   pragma Volatile (TCNT5L_Bits);
   --  Timer/Counter5 Low Byte bit 0
   TCNT5L0_Bit              : constant Bit_Number := 0;
   TCNT5L0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter5 Low Byte bit 1
   TCNT5L1_Bit              : constant Bit_Number := 1;
   TCNT5L1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter5 Low Byte bit 2
   TCNT5L2_Bit              : constant Bit_Number := 2;
   TCNT5L2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter5 Low Byte bit 3
   TCNT5L3_Bit              : constant Bit_Number := 3;
   TCNT5L3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter5 Low Byte bit 4
   TCNT5L4_Bit              : constant Bit_Number := 4;
   TCNT5L4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter5 Low Byte bit 5
   TCNT5L5_Bit              : constant Bit_Number := 5;
   TCNT5L5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter5 Low Byte bit 6
   TCNT5L6_Bit              : constant Bit_Number := 6;
   TCNT5L6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter5 Low Byte bit 7
   TCNT5L7_Bit              : constant Bit_Number := 7;
   TCNT5L7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter 5 Control Register C
   TCCR5C_Addr              : constant Address    := 16#122#;
   TCCR5C                   : Unsigned_8 ;
   for TCCR5C'Address use TCCR5C_Addr;
   pragma Volatile (TCCR5C);
   TCCR5C_Bits              : Bits_In_Byte;
   for TCCR5C_Bits'Address use TCCR5C_Addr;
   pragma Volatile (TCCR5C_Bits);
   --  Force Output Compare 5C
   FOC5C_Bit                : constant Bit_Number := 5;
   FOC5C_Mask               : constant Unsigned_8 := 16#20#;
   --  Force Output Compare 5B
   FOC5B_Bit                : constant Bit_Number := 6;
   FOC5B_Mask               : constant Unsigned_8 := 16#40#;
   --  Force Output Compare 5A
   FOC5A_Bit                : constant Bit_Number := 7;
   FOC5A_Mask               : constant Unsigned_8 := 16#80#;

   --  Timer/Counter5 Control Register B
   TCCR5B_Addr              : constant Address    := 16#121#;
   TCCR5B                   : Unsigned_8 ;
   for TCCR5B'Address use TCCR5B_Addr;
   pragma Volatile (TCCR5B);
   TCCR5B_Bits              : Bits_In_Byte;
   for TCCR5B_Bits'Address use TCCR5B_Addr;
   pragma Volatile (TCCR5B_Bits);
   --  Prescaler source of Timer/Counter 5
   CS50_Bit                 : constant Bit_Number := 0;
   CS50_Mask                : constant Unsigned_8 := 16#01#;
   --  Prescaler source of Timer/Counter 5
   CS51_Bit                 : constant Bit_Number := 1;
   CS51_Mask                : constant Unsigned_8 := 16#02#;
   --  Prescaler source of Timer/Counter 5
   CS52_Bit                 : constant Bit_Number := 2;
   CS52_Mask                : constant Unsigned_8 := 16#04#;
   --  Waveform Generation Mode
   WGM52_Bit                : constant Bit_Number := 3;
   WGM52_Mask               : constant Unsigned_8 := 16#08#;
   --  Waveform Generation Mode
   WGM53_Bit                : constant Bit_Number := 4;
   WGM53_Mask               : constant Unsigned_8 := 16#10#;
   --  Input Capture 5 Edge Select
   ICES5_Bit                : constant Bit_Number := 6;
   ICES5_Mask               : constant Unsigned_8 := 16#40#;
   --  Input Capture 5 Noise Canceler
   ICNC5_Bit                : constant Bit_Number := 7;
   ICNC5_Mask               : constant Unsigned_8 := 16#80#;

   --  Timer/Counter5 Control Register A
   TCCR5A_Addr              : constant Address    := 16#120#;
   TCCR5A                   : Unsigned_8 ;
   for TCCR5A'Address use TCCR5A_Addr;
   pragma Volatile (TCCR5A);
   TCCR5A_Bits              : Bits_In_Byte;
   for TCCR5A_Bits'Address use TCCR5A_Addr;
   pragma Volatile (TCCR5A_Bits);
   --  Waveform Generation Mode
   WGM50_Bit                : constant Bit_Number := 0;
   WGM50_Mask               : constant Unsigned_8 := 16#01#;
   --  Waveform Generation Mode
   WGM51_Bit                : constant Bit_Number := 1;
   WGM51_Mask               : constant Unsigned_8 := 16#02#;
   --  Compare Output Mode 5C, bit 0
   COM5C0_Bit               : constant Bit_Number := 2;
   COM5C0_Mask              : constant Unsigned_8 := 16#04#;
   --  Compare Output Mode 5C, bit 1
   COM5C1_Bit               : constant Bit_Number := 3;
   COM5C1_Mask              : constant Unsigned_8 := 16#08#;
   --  Compare Output Mode 5B, bit 0
   COM5B0_Bit               : constant Bit_Number := 4;
   COM5B0_Mask              : constant Unsigned_8 := 16#10#;
   --  Compare Output Mode 5B, bit 1
   COM5B1_Bit               : constant Bit_Number := 5;
   COM5B1_Mask              : constant Unsigned_8 := 16#20#;
   --  Compare Output Mode 5A, bit 0
   COM5A0_Bit               : constant Bit_Number := 6;
   COM5A0_Mask              : constant Unsigned_8 := 16#40#;
   --  Compare Output Mode 1A, bit 1
   COM5A1_Bit               : constant Bit_Number := 7;
   COM5A1_Mask              : constant Unsigned_8 := 16#80#;

   --  PORT L Data Register
   PORTL_Addr               : constant Address    := 16#10b#;
   PORT                     : Unsigned_16;
   for PORT'Address use PORTL_Addr;
   pragma Volatile (PORT);
   PORTL                    : Unsigned_8 ;
   for PORTL'Address use PORTL_Addr;
   pragma Volatile (PORTL);
   PORTL_Bits               : Bits_In_Byte;
   for PORTL_Bits'Address use PORTL_Addr;
   pragma Volatile (PORTL_Bits);
   --  PORT L Data Register bit 0
   PORTL0_Bit               : constant Bit_Number := 0;
   PORTL0_Mask              : constant Unsigned_8 := 16#01#;
   --  PORT L Data Register bit 1
   PORTL1_Bit               : constant Bit_Number := 1;
   PORTL1_Mask              : constant Unsigned_8 := 16#02#;
   --  PORT L Data Register bit 2
   PORTL2_Bit               : constant Bit_Number := 2;
   PORTL2_Mask              : constant Unsigned_8 := 16#04#;
   --  PORT L Data Register bit 3
   PORTL3_Bit               : constant Bit_Number := 3;
   PORTL3_Mask              : constant Unsigned_8 := 16#08#;
   --  PORT L Data Register bit 4
   PORTL4_Bit               : constant Bit_Number := 4;
   PORTL4_Mask              : constant Unsigned_8 := 16#10#;
   --  PORT L Data Register bit 5
   PORTL5_Bit               : constant Bit_Number := 5;
   PORTL5_Mask              : constant Unsigned_8 := 16#20#;
   --  PORT L Data Register bit 6
   PORTL6_Bit               : constant Bit_Number := 6;
   PORTL6_Mask              : constant Unsigned_8 := 16#40#;
   --  PORT L Data Register bit 7
   PORTL7_Bit               : constant Bit_Number := 7;
   PORTL7_Mask              : constant Unsigned_8 := 16#80#;

   --  PORT L Data Direction Register
   DDRL_Addr                : constant Address    := 16#10a#;
   DDR                      : Unsigned_16;
   for DDR'Address use DDRL_Addr;
   pragma Volatile (DDR);
   DDRL                     : Unsigned_8 ;
   for DDRL'Address use DDRL_Addr;
   pragma Volatile (DDRL);
   DDRL_Bits                : Bits_In_Byte;
   for DDRL_Bits'Address use DDRL_Addr;
   pragma Volatile (DDRL_Bits);
   --  PORT L Data Direction Register bit 0
   DDL0_Bit                 : constant Bit_Number := 0;
   DDL0_Mask                : constant Unsigned_8 := 16#01#;
   --  PORT L Data Direction Register bit 1
   DDL1_Bit                 : constant Bit_Number := 1;
   DDL1_Mask                : constant Unsigned_8 := 16#02#;
   --  PORT L Data Direction Register bit 2
   DDL2_Bit                 : constant Bit_Number := 2;
   DDL2_Mask                : constant Unsigned_8 := 16#04#;
   --  PORT L Data Direction Register bit 3
   DDL3_Bit                 : constant Bit_Number := 3;
   DDL3_Mask                : constant Unsigned_8 := 16#08#;
   --  PORT L Data Direction Register bit 4
   DDL4_Bit                 : constant Bit_Number := 4;
   DDL4_Mask                : constant Unsigned_8 := 16#10#;
   --  PORT L Data Direction Register bit 5
   DDL5_Bit                 : constant Bit_Number := 5;
   DDL5_Mask                : constant Unsigned_8 := 16#20#;
   --  PORT L Data Direction Register bit 6
   DDL6_Bit                 : constant Bit_Number := 6;
   DDL6_Mask                : constant Unsigned_8 := 16#40#;
   --  PORT L Data Direction Register bit 7
   DDL7_Bit                 : constant Bit_Number := 7;
   DDL7_Mask                : constant Unsigned_8 := 16#80#;

   --  PORT L Input Pins
   PINL_Addr                : constant Address    := 16#109#;
   PIN                      : Unsigned_16;
   for PIN'Address use PINL_Addr;
   pragma Volatile (PIN);
   PINL                     : Unsigned_8 ;
   for PINL'Address use PINL_Addr;
   pragma Volatile (PINL);
   PINL_Bits                : Bits_In_Byte;
   for PINL_Bits'Address use PINL_Addr;
   pragma Volatile (PINL_Bits);
   --  PORT L Input Pins bit 0
   PINL0_Bit                : constant Bit_Number := 0;
   PINL0_Mask               : constant Unsigned_8 := 16#01#;
   --  PORT L Input Pins bit 1
   PINL1_Bit                : constant Bit_Number := 1;
   PINL1_Mask               : constant Unsigned_8 := 16#02#;
   --  PORT L Input Pins bit 2
   PINL2_Bit                : constant Bit_Number := 2;
   PINL2_Mask               : constant Unsigned_8 := 16#04#;
   --  PORT L Input Pins bit 3
   PINL3_Bit                : constant Bit_Number := 3;
   PINL3_Mask               : constant Unsigned_8 := 16#08#;
   --  PORT L Input Pins bit 4
   PINL4_Bit                : constant Bit_Number := 4;
   PINL4_Mask               : constant Unsigned_8 := 16#10#;
   --  PORT L Input Pins bit 5
   PINL5_Bit                : constant Bit_Number := 5;
   PINL5_Mask               : constant Unsigned_8 := 16#20#;
   --  PORT L Input Pins bit 6
   PINL6_Bit                : constant Bit_Number := 6;
   PINL6_Mask               : constant Unsigned_8 := 16#40#;
   --  PORT L Input Pins bit 7
   PINL7_Bit                : constant Bit_Number := 7;
   PINL7_Mask               : constant Unsigned_8 := 16#80#;

   --  PORT K Data Register
   PORTK_Addr               : constant Address    := 16#108#;
   PORTK                    : Unsigned_8 ;
   for PORTK'Address use PORTK_Addr;
   pragma Volatile (PORTK);
   PORTK_Bits               : Bits_In_Byte;
   for PORTK_Bits'Address use PORTK_Addr;
   pragma Volatile (PORTK_Bits);
   --  PORT K Data Register bit 0
   PORTK0_Bit               : constant Bit_Number := 0;
   PORTK0_Mask              : constant Unsigned_8 := 16#01#;
   --  PORT K Data Register bit 1
   PORTK1_Bit               : constant Bit_Number := 1;
   PORTK1_Mask              : constant Unsigned_8 := 16#02#;
   --  PORT K Data Register bit 2
   PORTK2_Bit               : constant Bit_Number := 2;
   PORTK2_Mask              : constant Unsigned_8 := 16#04#;
   --  PORT K Data Register bit 3
   PORTK3_Bit               : constant Bit_Number := 3;
   PORTK3_Mask              : constant Unsigned_8 := 16#08#;
   --  PORT K Data Register bit 4
   PORTK4_Bit               : constant Bit_Number := 4;
   PORTK4_Mask              : constant Unsigned_8 := 16#10#;
   --  PORT K Data Register bit 5
   PORTK5_Bit               : constant Bit_Number := 5;
   PORTK5_Mask              : constant Unsigned_8 := 16#20#;
   --  PORT K Data Register bit 6
   PORTK6_Bit               : constant Bit_Number := 6;
   PORTK6_Mask              : constant Unsigned_8 := 16#40#;
   --  PORT K Data Register bit 7
   PORTK7_Bit               : constant Bit_Number := 7;
   PORTK7_Mask              : constant Unsigned_8 := 16#80#;

   --  PORT K Data Direction Register
   DDRK_Addr                : constant Address    := 16#107#;
   DDRK                     : Unsigned_8 ;
   for DDRK'Address use DDRK_Addr;
   pragma Volatile (DDRK);
   DDRK_Bits                : Bits_In_Byte;
   for DDRK_Bits'Address use DDRK_Addr;
   pragma Volatile (DDRK_Bits);
   --  PORT K Data Direction Register bit 0
   DDK0_Bit                 : constant Bit_Number := 0;
   DDK0_Mask                : constant Unsigned_8 := 16#01#;
   --  PORT K Data Direction Register bit 1
   DDK1_Bit                 : constant Bit_Number := 1;
   DDK1_Mask                : constant Unsigned_8 := 16#02#;
   --  PORT K Data Direction Register bit 2
   DDK2_Bit                 : constant Bit_Number := 2;
   DDK2_Mask                : constant Unsigned_8 := 16#04#;
   --  PORT K Data Direction Register bit 3
   DDK3_Bit                 : constant Bit_Number := 3;
   DDK3_Mask                : constant Unsigned_8 := 16#08#;
   --  PORT K Data Direction Register bit 4
   DDK4_Bit                 : constant Bit_Number := 4;
   DDK4_Mask                : constant Unsigned_8 := 16#10#;
   --  PORT K Data Direction Register bit 5
   DDK5_Bit                 : constant Bit_Number := 5;
   DDK5_Mask                : constant Unsigned_8 := 16#20#;
   --  PORT K Data Direction Register bit 6
   DDK6_Bit                 : constant Bit_Number := 6;
   DDK6_Mask                : constant Unsigned_8 := 16#40#;
   --  PORT K Data Direction Register bit 7
   DDK7_Bit                 : constant Bit_Number := 7;
   DDK7_Mask                : constant Unsigned_8 := 16#80#;

   --  PORT K Input Pins
   PINK_Addr                : constant Address    := 16#106#;
   PINK                     : Unsigned_8 ;
   for PINK'Address use PINK_Addr;
   pragma Volatile (PINK);
   PINK_Bits                : Bits_In_Byte;
   for PINK_Bits'Address use PINK_Addr;
   pragma Volatile (PINK_Bits);
   --  PORT K Input Pins bit 0
   PINK0_Bit                : constant Bit_Number := 0;
   PINK0_Mask               : constant Unsigned_8 := 16#01#;
   --  PORT K Input Pins bit 1
   PINK1_Bit                : constant Bit_Number := 1;
   PINK1_Mask               : constant Unsigned_8 := 16#02#;
   --  PORT K Input Pins bit 2
   PINK2_Bit                : constant Bit_Number := 2;
   PINK2_Mask               : constant Unsigned_8 := 16#04#;
   --  PORT K Input Pins bit 3
   PINK3_Bit                : constant Bit_Number := 3;
   PINK3_Mask               : constant Unsigned_8 := 16#08#;
   --  PORT K Input Pins bit 4
   PINK4_Bit                : constant Bit_Number := 4;
   PINK4_Mask               : constant Unsigned_8 := 16#10#;
   --  PORT K Input Pins bit 5
   PINK5_Bit                : constant Bit_Number := 5;
   PINK5_Mask               : constant Unsigned_8 := 16#20#;
   --  PORT K Input Pins bit 6
   PINK6_Bit                : constant Bit_Number := 6;
   PINK6_Mask               : constant Unsigned_8 := 16#40#;
   --  PORT K Input Pins bit 7
   PINK7_Bit                : constant Bit_Number := 7;
   PINK7_Mask               : constant Unsigned_8 := 16#80#;

   --  PORT J Data Register
   PORTJ_Addr               : constant Address    := 16#105#;
   PORTJ                    : Unsigned_8 ;
   for PORTJ'Address use PORTJ_Addr;
   pragma Volatile (PORTJ);
   PORTJ_Bits               : Bits_In_Byte;
   for PORTJ_Bits'Address use PORTJ_Addr;
   pragma Volatile (PORTJ_Bits);
   --  PORT J Data Register bit 0
   PORTJ0_Bit               : constant Bit_Number := 0;
   PORTJ0_Mask              : constant Unsigned_8 := 16#01#;
   --  PORT J Data Register bit 1
   PORTJ1_Bit               : constant Bit_Number := 1;
   PORTJ1_Mask              : constant Unsigned_8 := 16#02#;
   --  PORT J Data Register bit 2
   PORTJ2_Bit               : constant Bit_Number := 2;
   PORTJ2_Mask              : constant Unsigned_8 := 16#04#;
   --  PORT J Data Register bit 3
   PORTJ3_Bit               : constant Bit_Number := 3;
   PORTJ3_Mask              : constant Unsigned_8 := 16#08#;
   --  PORT J Data Register bit 4
   PORTJ4_Bit               : constant Bit_Number := 4;
   PORTJ4_Mask              : constant Unsigned_8 := 16#10#;
   --  PORT J Data Register bit 5
   PORTJ5_Bit               : constant Bit_Number := 5;
   PORTJ5_Mask              : constant Unsigned_8 := 16#20#;
   --  PORT J Data Register bit 6
   PORTJ6_Bit               : constant Bit_Number := 6;
   PORTJ6_Mask              : constant Unsigned_8 := 16#40#;
   --  PORT J Data Register bit 7
   PORTJ7_Bit               : constant Bit_Number := 7;
   PORTJ7_Mask              : constant Unsigned_8 := 16#80#;

   --  PORT J Data Direction Register
   DDRJ_Addr                : constant Address    := 16#104#;
   DDRJ                     : Unsigned_8 ;
   for DDRJ'Address use DDRJ_Addr;
   pragma Volatile (DDRJ);
   DDRJ_Bits                : Bits_In_Byte;
   for DDRJ_Bits'Address use DDRJ_Addr;
   pragma Volatile (DDRJ_Bits);
   --  PORT J Data Direction Register bit 0
   DDJ0_Bit                 : constant Bit_Number := 0;
   DDJ0_Mask                : constant Unsigned_8 := 16#01#;
   --  PORT J Data Direction Register bit 1
   DDJ1_Bit                 : constant Bit_Number := 1;
   DDJ1_Mask                : constant Unsigned_8 := 16#02#;
   --  PORT J Data Direction Register bit 2
   DDJ2_Bit                 : constant Bit_Number := 2;
   DDJ2_Mask                : constant Unsigned_8 := 16#04#;
   --  PORT J Data Direction Register bit 3
   DDJ3_Bit                 : constant Bit_Number := 3;
   DDJ3_Mask                : constant Unsigned_8 := 16#08#;
   --  PORT J Data Direction Register bit 4
   DDJ4_Bit                 : constant Bit_Number := 4;
   DDJ4_Mask                : constant Unsigned_8 := 16#10#;
   --  PORT J Data Direction Register bit 5
   DDJ5_Bit                 : constant Bit_Number := 5;
   DDJ5_Mask                : constant Unsigned_8 := 16#20#;
   --  PORT J Data Direction Register bit 6
   DDJ6_Bit                 : constant Bit_Number := 6;
   DDJ6_Mask                : constant Unsigned_8 := 16#40#;
   --  PORT J Data Direction Register bit 7
   DDJ7_Bit                 : constant Bit_Number := 7;
   DDJ7_Mask                : constant Unsigned_8 := 16#80#;

   --  PORT J Input Pins
   PINJ_Addr                : constant Address    := 16#103#;
   PINJ                     : Unsigned_8 ;
   for PINJ'Address use PINJ_Addr;
   pragma Volatile (PINJ);
   PINJ_Bits                : Bits_In_Byte;
   for PINJ_Bits'Address use PINJ_Addr;
   pragma Volatile (PINJ_Bits);
   --  PORT J Input Pins bit 0
   PINJ0_Bit                : constant Bit_Number := 0;
   PINJ0_Mask               : constant Unsigned_8 := 16#01#;
   --  PORT J Input Pins bit 1
   PINJ1_Bit                : constant Bit_Number := 1;
   PINJ1_Mask               : constant Unsigned_8 := 16#02#;
   --  PORT J Input Pins bit 2
   PINJ2_Bit                : constant Bit_Number := 2;
   PINJ2_Mask               : constant Unsigned_8 := 16#04#;
   --  PORT J Input Pins bit 3
   PINJ3_Bit                : constant Bit_Number := 3;
   PINJ3_Mask               : constant Unsigned_8 := 16#08#;
   --  PORT J Input Pins bit 4
   PINJ4_Bit                : constant Bit_Number := 4;
   PINJ4_Mask               : constant Unsigned_8 := 16#10#;
   --  PORT J Input Pins bit 5
   PINJ5_Bit                : constant Bit_Number := 5;
   PINJ5_Mask               : constant Unsigned_8 := 16#20#;
   --  PORT J Input Pins bit 6
   PINJ6_Bit                : constant Bit_Number := 6;
   PINJ6_Mask               : constant Unsigned_8 := 16#40#;
   --  PORT J Input Pins bit 7
   PINJ7_Bit                : constant Bit_Number := 7;
   PINJ7_Mask               : constant Unsigned_8 := 16#80#;

   --  PORT H Data Register
   PORTH_Addr               : constant Address    := 16#102#;
   PORTH                    : Unsigned_8 ;
   for PORTH'Address use PORTH_Addr;
   pragma Volatile (PORTH);
   PORTH_Bits               : Bits_In_Byte;
   for PORTH_Bits'Address use PORTH_Addr;
   pragma Volatile (PORTH_Bits);
   --  PORT H Data Register bit 0
   PORTH0_Bit               : constant Bit_Number := 0;
   PORTH0_Mask              : constant Unsigned_8 := 16#01#;
   --  PORT H Data Register bit 1
   PORTH1_Bit               : constant Bit_Number := 1;
   PORTH1_Mask              : constant Unsigned_8 := 16#02#;
   --  PORT H Data Register bit 2
   PORTH2_Bit               : constant Bit_Number := 2;
   PORTH2_Mask              : constant Unsigned_8 := 16#04#;
   --  PORT H Data Register bit 3
   PORTH3_Bit               : constant Bit_Number := 3;
   PORTH3_Mask              : constant Unsigned_8 := 16#08#;
   --  PORT H Data Register bit 4
   PORTH4_Bit               : constant Bit_Number := 4;
   PORTH4_Mask              : constant Unsigned_8 := 16#10#;
   --  PORT H Data Register bit 5
   PORTH5_Bit               : constant Bit_Number := 5;
   PORTH5_Mask              : constant Unsigned_8 := 16#20#;
   --  PORT H Data Register bit 6
   PORTH6_Bit               : constant Bit_Number := 6;
   PORTH6_Mask              : constant Unsigned_8 := 16#40#;
   --  PORT H Data Register bit 7
   PORTH7_Bit               : constant Bit_Number := 7;
   PORTH7_Mask              : constant Unsigned_8 := 16#80#;

   --  PORT H Data Direction Register
   DDRH_Addr                : constant Address    := 16#101#;
   DDRH                     : Unsigned_8 ;
   for DDRH'Address use DDRH_Addr;
   pragma Volatile (DDRH);
   DDRH_Bits                : Bits_In_Byte;
   for DDRH_Bits'Address use DDRH_Addr;
   pragma Volatile (DDRH_Bits);
   --  PORT H Data Direction Register bit 0
   DDH0_Bit                 : constant Bit_Number := 0;
   DDH0_Mask                : constant Unsigned_8 := 16#01#;
   --  PORT H Data Direction Register bit 1
   DDH1_Bit                 : constant Bit_Number := 1;
   DDH1_Mask                : constant Unsigned_8 := 16#02#;
   --  PORT H Data Direction Register bit 2
   DDH2_Bit                 : constant Bit_Number := 2;
   DDH2_Mask                : constant Unsigned_8 := 16#04#;
   --  PORT H Data Direction Register bit 3
   DDH3_Bit                 : constant Bit_Number := 3;
   DDH3_Mask                : constant Unsigned_8 := 16#08#;
   --  PORT H Data Direction Register bit 4
   DDH4_Bit                 : constant Bit_Number := 4;
   DDH4_Mask                : constant Unsigned_8 := 16#10#;
   --  PORT H Data Direction Register bit 5
   DDH5_Bit                 : constant Bit_Number := 5;
   DDH5_Mask                : constant Unsigned_8 := 16#20#;
   --  PORT H Data Direction Register bit 6
   DDH6_Bit                 : constant Bit_Number := 6;
   DDH6_Mask                : constant Unsigned_8 := 16#40#;
   --  PORT H Data Direction Register bit 7
   DDH7_Bit                 : constant Bit_Number := 7;
   DDH7_Mask                : constant Unsigned_8 := 16#80#;

   --  PORT H Input Pins
   PINH_Addr                : constant Address    := 16#100#;
   PINH                     : Unsigned_8 ;
   for PINH'Address use PINH_Addr;
   pragma Volatile (PINH);
   PINH_Bits                : Bits_In_Byte;
   for PINH_Bits'Address use PINH_Addr;
   pragma Volatile (PINH_Bits);
   --  PORT H Input Pins bit 0
   PINH0_Bit                : constant Bit_Number := 0;
   PINH0_Mask               : constant Unsigned_8 := 16#01#;
   --  PORT H Input Pins bit 1
   PINH1_Bit                : constant Bit_Number := 1;
   PINH1_Mask               : constant Unsigned_8 := 16#02#;
   --  PORT H Input Pins bit 2
   PINH2_Bit                : constant Bit_Number := 2;
   PINH2_Mask               : constant Unsigned_8 := 16#04#;
   --  PORT H Input Pins bit 3
   PINH3_Bit                : constant Bit_Number := 3;
   PINH3_Mask               : constant Unsigned_8 := 16#08#;
   --  PORT H Input Pins bit 4
   PINH4_Bit                : constant Bit_Number := 4;
   PINH4_Mask               : constant Unsigned_8 := 16#10#;
   --  PORT H Input Pins bit 5
   PINH5_Bit                : constant Bit_Number := 5;
   PINH5_Mask               : constant Unsigned_8 := 16#20#;
   --  PORT H Input Pins bit 6
   PINH6_Bit                : constant Bit_Number := 6;
   PINH6_Mask               : constant Unsigned_8 := 16#40#;
   --  PORT H Input Pins bit 7
   PINH7_Bit                : constant Bit_Number := 7;
   PINH7_Mask               : constant Unsigned_8 := 16#80#;

   --  USART I/O Data Register
   UDR2_Addr                : constant Address    := 16#d6#;
   UDR2                     : Unsigned_8 ;
   for UDR2'Address use UDR2_Addr;
   pragma Volatile (UDR2);
   UDR2_Bits                : Bits_In_Byte;
   for UDR2_Bits'Address use UDR2_Addr;
   pragma Volatile (UDR2_Bits);
   --  USART I/O Data Register bit 0
   UDR2_0_Bit               : constant Bit_Number := 0;
   UDR2_0_Mask              : constant Unsigned_8 := 16#01#;
   --  USART I/O Data Register bit 1
   UDR2_1_Bit               : constant Bit_Number := 1;
   UDR2_1_Mask              : constant Unsigned_8 := 16#02#;
   --  USART I/O Data Register bit 2
   UDR2_2_Bit               : constant Bit_Number := 2;
   UDR2_2_Mask              : constant Unsigned_8 := 16#04#;
   --  USART I/O Data Register bit 3
   UDR2_3_Bit               : constant Bit_Number := 3;
   UDR2_3_Mask              : constant Unsigned_8 := 16#08#;
   --  USART I/O Data Register bit 4
   UDR2_4_Bit               : constant Bit_Number := 4;
   UDR2_4_Mask              : constant Unsigned_8 := 16#10#;
   --  USART I/O Data Register bit 5
   UDR2_5_Bit               : constant Bit_Number := 5;
   UDR2_5_Mask              : constant Unsigned_8 := 16#20#;
   --  USART I/O Data Register bit 6
   UDR2_6_Bit               : constant Bit_Number := 6;
   UDR2_6_Mask              : constant Unsigned_8 := 16#40#;
   --  USART I/O Data Register bit 7
   UDR2_7_Bit               : constant Bit_Number := 7;
   UDR2_7_Mask              : constant Unsigned_8 := 16#80#;

   --  USART Baud Rate Register High Byte
   UBRR2H_Addr              : constant Address    := 16#d5#;
   UBRR2H                   : Unsigned_8 ;
   for UBRR2H'Address use UBRR2H_Addr;
   pragma Volatile (UBRR2H);
   UBRR2H_Bits              : Bits_In_Byte;
   for UBRR2H_Bits'Address use UBRR2H_Addr;
   pragma Volatile (UBRR2H_Bits);

   --  USART Baud Rate Register Low Byte
   UBRR2L_Addr              : constant Address    := 16#d4#;
   UBRR2                    : Unsigned_16;
   for UBRR2'Address use UBRR2L_Addr;
   pragma Volatile (UBRR2);
   UBRR2L                   : Unsigned_8 ;
   for UBRR2L'Address use UBRR2L_Addr;
   pragma Volatile (UBRR2L);
   UBRR2L_Bits              : Bits_In_Byte;
   for UBRR2L_Bits'Address use UBRR2L_Addr;
   pragma Volatile (UBRR2L_Bits);

   --  USART Control and Status Register C
   UCSR2C_Addr              : constant Address    := 16#d2#;
   UCSR2C                   : Unsigned_8 ;
   for UCSR2C'Address use UCSR2C_Addr;
   pragma Volatile (UCSR2C);
   UCSR2C_Bits              : Bits_In_Byte;
   for UCSR2C_Bits'Address use UCSR2C_Addr;
   pragma Volatile (UCSR2C_Bits);
   --  Clock Polarity
   UCPOL2_Bit               : constant Bit_Number := 0;
   UCPOL2_Mask              : constant Unsigned_8 := 16#01#;
   --  Character Size
   UCSZ20_Bit               : constant Bit_Number := 1;
   UCSZ20_Mask              : constant Unsigned_8 := 16#02#;
   --  Character Size
   UCSZ21_Bit               : constant Bit_Number := 2;
   UCSZ21_Mask              : constant Unsigned_8 := 16#04#;
   --  Stop Bit Select
   USBS2_Bit                : constant Bit_Number := 3;
   USBS2_Mask               : constant Unsigned_8 := 16#08#;
   --  Parity Mode Bit 0
   UPM20_Bit                : constant Bit_Number := 4;
   UPM20_Mask               : constant Unsigned_8 := 16#10#;
   --  Parity Mode Bit 1
   UPM21_Bit                : constant Bit_Number := 5;
   UPM21_Mask               : constant Unsigned_8 := 16#20#;
   --  USART Mode Select
   UMSEL20_Bit              : constant Bit_Number := 6;
   UMSEL20_Mask             : constant Unsigned_8 := 16#40#;
   --  USART Mode Select
   UMSEL21_Bit              : constant Bit_Number := 7;
   UMSEL21_Mask             : constant Unsigned_8 := 16#80#;

   --  USART Control and Status Register B
   UCSR2B_Addr              : constant Address    := 16#d1#;
   UCSR2B                   : Unsigned_8 ;
   for UCSR2B'Address use UCSR2B_Addr;
   pragma Volatile (UCSR2B);
   UCSR2B_Bits              : Bits_In_Byte;
   for UCSR2B_Bits'Address use UCSR2B_Addr;
   pragma Volatile (UCSR2B_Bits);
   --  Transmit Data Bit 8
   TXB82_Bit                : constant Bit_Number := 0;
   TXB82_Mask               : constant Unsigned_8 := 16#01#;
   --  Receive Data Bit 8
   RXB82_Bit                : constant Bit_Number := 1;
   RXB82_Mask               : constant Unsigned_8 := 16#02#;
   --  Character Size
   UCSZ22_Bit               : constant Bit_Number := 2;
   UCSZ22_Mask              : constant Unsigned_8 := 16#04#;
   --  Transmitter Enable
   TXEN2_Bit                : constant Bit_Number := 3;
   TXEN2_Mask               : constant Unsigned_8 := 16#08#;
   --  Receiver Enable
   RXEN2_Bit                : constant Bit_Number := 4;
   RXEN2_Mask               : constant Unsigned_8 := 16#10#;
   --  USART Data register Empty Interrupt Enable
   UDRIE2_Bit               : constant Bit_Number := 5;
   UDRIE2_Mask              : constant Unsigned_8 := 16#20#;
   --  TX Complete Interrupt Enable
   TXCIE2_Bit               : constant Bit_Number := 6;
   TXCIE2_Mask              : constant Unsigned_8 := 16#40#;
   --  RX Complete Interrupt Enable
   RXCIE2_Bit               : constant Bit_Number := 7;
   RXCIE2_Mask              : constant Unsigned_8 := 16#80#;

   --  USART Control and Status Register A
   UCSR2A_Addr              : constant Address    := 16#d0#;
   UCSR2A                   : Unsigned_8 ;
   for UCSR2A'Address use UCSR2A_Addr;
   pragma Volatile (UCSR2A);
   UCSR2A_Bits              : Bits_In_Byte;
   for UCSR2A_Bits'Address use UCSR2A_Addr;
   pragma Volatile (UCSR2A_Bits);
   --  Multi-processor Communication Mode
   MPCM2_Bit                : constant Bit_Number := 0;
   MPCM2_Mask               : constant Unsigned_8 := 16#01#;
   --  Double the USART transmission speed
   U2X2_Bit                 : constant Bit_Number := 1;
   U2X2_Mask                : constant Unsigned_8 := 16#02#;
   --  Parity Error
   UPE2_Bit                 : constant Bit_Number := 2;
   UPE2_Mask                : constant Unsigned_8 := 16#04#;
   --  Data overRun
   DOR2_Bit                 : constant Bit_Number := 3;
   DOR2_Mask                : constant Unsigned_8 := 16#08#;
   --  Framing Error
   FE2_Bit                  : constant Bit_Number := 4;
   FE2_Mask                 : constant Unsigned_8 := 16#10#;
   --  USART Data Register Empty
   UDRE2_Bit                : constant Bit_Number := 5;
   UDRE2_Mask               : constant Unsigned_8 := 16#20#;
   --  USART Transmitt Complete
   TXC2_Bit                 : constant Bit_Number := 6;
   TXC2_Mask                : constant Unsigned_8 := 16#40#;
   --  USART Receive Complete
   RXC2_Bit                 : constant Bit_Number := 7;
   RXC2_Mask                : constant Unsigned_8 := 16#80#;

   --  USART I/O Data Register
   UDR1_Addr                : constant Address    := 16#ce#;
   UDR1                     : Unsigned_8 ;
   for UDR1'Address use UDR1_Addr;
   pragma Volatile (UDR1);
   UDR1_Bits                : Bits_In_Byte;
   for UDR1_Bits'Address use UDR1_Addr;
   pragma Volatile (UDR1_Bits);
   --  USART I/O Data Register bit 0
   UDR1_0_Bit               : constant Bit_Number := 0;
   UDR1_0_Mask              : constant Unsigned_8 := 16#01#;
   --  USART I/O Data Register bit 1
   UDR1_1_Bit               : constant Bit_Number := 1;
   UDR1_1_Mask              : constant Unsigned_8 := 16#02#;
   --  USART I/O Data Register bit 2
   UDR1_2_Bit               : constant Bit_Number := 2;
   UDR1_2_Mask              : constant Unsigned_8 := 16#04#;
   --  USART I/O Data Register bit 3
   UDR1_3_Bit               : constant Bit_Number := 3;
   UDR1_3_Mask              : constant Unsigned_8 := 16#08#;
   --  USART I/O Data Register bit 4
   UDR1_4_Bit               : constant Bit_Number := 4;
   UDR1_4_Mask              : constant Unsigned_8 := 16#10#;
   --  USART I/O Data Register bit 5
   UDR1_5_Bit               : constant Bit_Number := 5;
   UDR1_5_Mask              : constant Unsigned_8 := 16#20#;
   --  USART I/O Data Register bit 6
   UDR1_6_Bit               : constant Bit_Number := 6;
   UDR1_6_Mask              : constant Unsigned_8 := 16#40#;
   --  USART I/O Data Register bit 7
   UDR1_7_Bit               : constant Bit_Number := 7;
   UDR1_7_Mask              : constant Unsigned_8 := 16#80#;

   --  USART Baud Rate Register High Byte
   UBRR1H_Addr              : constant Address    := 16#cd#;
   UBRR1H                   : Unsigned_8 ;
   for UBRR1H'Address use UBRR1H_Addr;
   pragma Volatile (UBRR1H);
   UBRR1H_Bits              : Bits_In_Byte;
   for UBRR1H_Bits'Address use UBRR1H_Addr;
   pragma Volatile (UBRR1H_Bits);

   --  USART Baud Rate Register Low Byte
   UBRR1L_Addr              : constant Address    := 16#cc#;
   UBRR1                    : Unsigned_16;
   for UBRR1'Address use UBRR1L_Addr;
   pragma Volatile (UBRR1);
   UBRR1L                   : Unsigned_8 ;
   for UBRR1L'Address use UBRR1L_Addr;
   pragma Volatile (UBRR1L);
   UBRR1L_Bits              : Bits_In_Byte;
   for UBRR1L_Bits'Address use UBRR1L_Addr;
   pragma Volatile (UBRR1L_Bits);

   --  USART Control and Status Register C
   UCSR1C_Addr              : constant Address    := 16#ca#;
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
   UMSEL10_Bit              : constant Bit_Number := 6;
   UMSEL10_Mask             : constant Unsigned_8 := 16#40#;
   --  USART Mode Select
   UMSEL11_Bit              : constant Bit_Number := 7;
   UMSEL11_Mask             : constant Unsigned_8 := 16#80#;

   --  USART Control and Status Register B
   UCSR1B_Addr              : constant Address    := 16#c9#;
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

   --  USART Control and Status Register A
   UCSR1A_Addr              : constant Address    := 16#c8#;
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

   --  USART I/O Data Register
   UDR0_Addr                : constant Address    := 16#c6#;
   UDR0                     : Unsigned_8 ;
   for UDR0'Address use UDR0_Addr;
   pragma Volatile (UDR0);
   UDR0_Bits                : Bits_In_Byte;
   for UDR0_Bits'Address use UDR0_Addr;
   pragma Volatile (UDR0_Bits);
   --  USART I/O Data Register bit 0
   UDR0_0_Bit               : constant Bit_Number := 0;
   UDR0_0_Mask              : constant Unsigned_8 := 16#01#;
   --  USART I/O Data Register bit 1
   UDR0_1_Bit               : constant Bit_Number := 1;
   UDR0_1_Mask              : constant Unsigned_8 := 16#02#;
   --  USART I/O Data Register bit 2
   UDR0_2_Bit               : constant Bit_Number := 2;
   UDR0_2_Mask              : constant Unsigned_8 := 16#04#;
   --  USART I/O Data Register bit 3
   UDR0_3_Bit               : constant Bit_Number := 3;
   UDR0_3_Mask              : constant Unsigned_8 := 16#08#;
   --  USART I/O Data Register bit 4
   UDR0_4_Bit               : constant Bit_Number := 4;
   UDR0_4_Mask              : constant Unsigned_8 := 16#10#;
   --  USART I/O Data Register bit 5
   UDR0_5_Bit               : constant Bit_Number := 5;
   UDR0_5_Mask              : constant Unsigned_8 := 16#20#;
   --  USART I/O Data Register bit 6
   UDR0_6_Bit               : constant Bit_Number := 6;
   UDR0_6_Mask              : constant Unsigned_8 := 16#40#;
   --  USART I/O Data Register bit 7
   UDR0_7_Bit               : constant Bit_Number := 7;
   UDR0_7_Mask              : constant Unsigned_8 := 16#80#;

   --  USART Baud Rate Register High Byte
   UBRR0H_Addr              : constant Address    := 16#c5#;
   UBRR0H                   : Unsigned_8 ;
   for UBRR0H'Address use UBRR0H_Addr;
   pragma Volatile (UBRR0H);
   UBRR0H_Bits              : Bits_In_Byte;
   for UBRR0H_Bits'Address use UBRR0H_Addr;
   pragma Volatile (UBRR0H_Bits);

   --  USART Baud Rate Register Low Byte
   UBRR0L_Addr              : constant Address    := 16#c4#;
   UBRR0                    : Unsigned_16;
   for UBRR0'Address use UBRR0L_Addr;
   pragma Volatile (UBRR0);
   UBRR0L                   : Unsigned_8 ;
   for UBRR0L'Address use UBRR0L_Addr;
   pragma Volatile (UBRR0L);
   UBRR0L_Bits              : Bits_In_Byte;
   for UBRR0L_Bits'Address use UBRR0L_Addr;
   pragma Volatile (UBRR0L_Bits);

   --  USART Control and Status Register C
   UCSR0C_Addr              : constant Address    := 16#c2#;
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
   UMSEL00_Bit              : constant Bit_Number := 6;
   UMSEL00_Mask             : constant Unsigned_8 := 16#40#;
   --  USART Mode Select
   UMSEL01_Bit              : constant Bit_Number := 7;
   UMSEL01_Mask             : constant Unsigned_8 := 16#80#;

   --  USART Control and Status Register B
   UCSR0B_Addr              : constant Address    := 16#c1#;
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

   --  USART Control and Status Register A
   UCSR0A_Addr              : constant Address    := 16#c0#;
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

   --  TWI (Slave) Address Mask Register
   TWAMR_Addr               : constant Address    := 16#bd#;
   TWAMR                    : Unsigned_8 ;
   for TWAMR'Address use TWAMR_Addr;
   pragma Volatile (TWAMR);
   TWAMR_Bits               : Bits_In_Byte;
   for TWAMR_Bits'Address use TWAMR_Addr;
   pragma Volatile (TWAMR_Bits);
   TWAM0_Bit                : constant Bit_Number := 1;
   TWAM0_Mask               : constant Unsigned_8 := 16#02#;
   TWAM1_Bit                : constant Bit_Number := 2;
   TWAM1_Mask               : constant Unsigned_8 := 16#04#;
   TWAM2_Bit                : constant Bit_Number := 3;
   TWAM2_Mask               : constant Unsigned_8 := 16#08#;
   TWAM3_Bit                : constant Bit_Number := 4;
   TWAM3_Mask               : constant Unsigned_8 := 16#10#;
   TWAM4_Bit                : constant Bit_Number := 5;
   TWAM4_Mask               : constant Unsigned_8 := 16#20#;
   TWAM5_Bit                : constant Bit_Number := 6;
   TWAM5_Mask               : constant Unsigned_8 := 16#40#;
   TWAM6_Bit                : constant Bit_Number := 7;
   TWAM6_Mask               : constant Unsigned_8 := 16#80#;

   --  TWI Control Register
   TWCR_Addr                : constant Address    := 16#bc#;
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
   TWDR_Addr                : constant Address    := 16#bb#;
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
   TWAR_Addr                : constant Address    := 16#ba#;
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
   TWSR_Addr                : constant Address    := 16#b9#;
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
   TWBR_Addr                : constant Address    := 16#b8#;
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

   --  Asynchronous Status Register
   ASSR_Addr                : constant Address    := 16#b6#;
   ASSR                     : Unsigned_8 ;
   for ASSR'Address use ASSR_Addr;
   pragma Volatile (ASSR);
   ASSR_Bits                : Bits_In_Byte;
   for ASSR_Bits'Address use ASSR_Addr;
   pragma Volatile (ASSR_Bits);
   --  Timer/Counter Control Register2 Update Busy
   TCR2BUB_Bit              : constant Bit_Number := 0;
   TCR2BUB_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter Control Register2 Update Busy
   TCR2AUB_Bit              : constant Bit_Number := 1;
   TCR2AUB_Mask             : constant Unsigned_8 := 16#02#;
   --  Output Compare Register 2 Update Busy
   OCR2BUB_Bit              : constant Bit_Number := 2;
   OCR2BUB_Mask             : constant Unsigned_8 := 16#04#;
   --  Output Compare Register2 Update Busy
   OCR2AUB_Bit              : constant Bit_Number := 3;
   OCR2AUB_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter2 Update Busy
   TCN2UB_Bit               : constant Bit_Number := 4;
   TCN2UB_Mask              : constant Unsigned_8 := 16#10#;
   --  Asynchronous Timer/Counter2
   AS2_Bit                  : constant Bit_Number := 5;
   AS2_Mask                 : constant Unsigned_8 := 16#20#;
   --  Enable External Clock Input
   EXCLK_Bit                : constant Bit_Number := 6;
   EXCLK_Mask               : constant Unsigned_8 := 16#40#;

   --  Timer/Counter2 Output Compare Register B
   OCR2B_Addr               : constant Address    := 16#b4#;
   OCR2B                    : Unsigned_8 ;
   for OCR2B'Address use OCR2B_Addr;
   pragma Volatile (OCR2B);
   OCR2B_Bits               : Bits_In_Byte;
   for OCR2B_Bits'Address use OCR2B_Addr;
   pragma Volatile (OCR2B_Bits);
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

   --  Timer/Counter2 Output Compare Register A
   OCR2A_Addr               : constant Address    := 16#b3#;
   OCR2A                    : Unsigned_8 ;
   for OCR2A'Address use OCR2A_Addr;
   pragma Volatile (OCR2A);
   OCR2A_Bits               : Bits_In_Byte;
   for OCR2A_Bits'Address use OCR2A_Addr;
   pragma Volatile (OCR2A_Bits);

   --  Timer/Counter2
   TCNT2_Addr               : constant Address    := 16#b2#;
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

   --  Timer/Counter2 Control Register B
   TCCR2B_Addr              : constant Address    := 16#b1#;
   TCCR2B                   : Unsigned_8 ;
   for TCCR2B'Address use TCCR2B_Addr;
   pragma Volatile (TCCR2B);
   TCCR2B_Bits              : Bits_In_Byte;
   for TCCR2B_Bits'Address use TCCR2B_Addr;
   pragma Volatile (TCCR2B_Bits);
   --  Clock Select bit 0
   CS20_Bit                 : constant Bit_Number := 0;
   CS20_Mask                : constant Unsigned_8 := 16#01#;
   --  Clock Select bit 1
   CS21_Bit                 : constant Bit_Number := 1;
   CS21_Mask                : constant Unsigned_8 := 16#02#;
   --  Clock Select bit 2
   CS22_Bit                 : constant Bit_Number := 2;
   CS22_Mask                : constant Unsigned_8 := 16#04#;
   --  Waveform Generation Mode
   WGM22_Bit                : constant Bit_Number := 3;
   WGM22_Mask               : constant Unsigned_8 := 16#08#;
   --  Force Output Compare B
   FOC2B_Bit                : constant Bit_Number := 6;
   FOC2B_Mask               : constant Unsigned_8 := 16#40#;
   --  Force Output Compare A
   FOC2A_Bit                : constant Bit_Number := 7;
   FOC2A_Mask               : constant Unsigned_8 := 16#80#;

   --  Timer/Counter2 Control Register A
   TCCR2A_Addr              : constant Address    := 16#b0#;
   TCCR2A                   : Unsigned_8 ;
   for TCCR2A'Address use TCCR2A_Addr;
   pragma Volatile (TCCR2A);
   TCCR2A_Bits              : Bits_In_Byte;
   for TCCR2A_Bits'Address use TCCR2A_Addr;
   pragma Volatile (TCCR2A_Bits);
   --  Waveform Genration Mode
   WGM20_Bit                : constant Bit_Number := 0;
   WGM20_Mask               : constant Unsigned_8 := 16#01#;
   --  Waveform Genration Mode
   WGM21_Bit                : constant Bit_Number := 1;
   WGM21_Mask               : constant Unsigned_8 := 16#02#;
   --  Compare Output Mode bit 0
   COM2B0_Bit               : constant Bit_Number := 4;
   COM2B0_Mask              : constant Unsigned_8 := 16#10#;
   --  Compare Output Mode bit 1
   COM2B1_Bit               : constant Bit_Number := 5;
   COM2B1_Mask              : constant Unsigned_8 := 16#20#;
   --  Compare Output Mode bit 1
   COM2A0_Bit               : constant Bit_Number := 6;
   COM2A0_Mask              : constant Unsigned_8 := 16#40#;
   --  Compare Output Mode bit 1
   COM2A1_Bit               : constant Bit_Number := 7;
   COM2A1_Mask              : constant Unsigned_8 := 16#80#;

   --  Timer/Counter4 Output Compare Register B High Byte
   OCR4CH_Addr              : constant Address    := 16#ad#;
   OCR4CH                   : Unsigned_8 ;
   for OCR4CH'Address use OCR4CH_Addr;
   pragma Volatile (OCR4CH);
   OCR4CH_Bits              : Bits_In_Byte;
   for OCR4CH_Bits'Address use OCR4CH_Addr;
   pragma Volatile (OCR4CH_Bits);
   --  Timer/Counter4 Output Compare Register High Byte bit 0
   OCR4CH0_Bit              : constant Bit_Number := 0;
   OCR4CH0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter4 Output Compare Register High Byte bit 1
   OCR4CH1_Bit              : constant Bit_Number := 1;
   OCR4CH1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter4 Output Compare Register High Byte bit 2
   OCR4CH2_Bit              : constant Bit_Number := 2;
   OCR4CH2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter4 Output Compare Register High Byte bit 3
   OCR4CH3_Bit              : constant Bit_Number := 3;
   OCR4CH3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter4 Output Compare Register High Byte bit 4
   OCR4CH4_Bit              : constant Bit_Number := 4;
   OCR4CH4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter4 Output Compare Register High Byte bit 5
   OCR4CH5_Bit              : constant Bit_Number := 5;
   OCR4CH5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter4 Output Compare Register High Byte bit 6
   OCR4CH6_Bit              : constant Bit_Number := 6;
   OCR4CH6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter4 Output Compare Register High Byte bit 7
   OCR4CH7_Bit              : constant Bit_Number := 7;
   OCR4CH7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter4 Output Compare Register B Low Byte
   OCR4CL_Addr              : constant Address    := 16#ac#;
   OCR4C                    : Unsigned_16;
   for OCR4C'Address use OCR4CL_Addr;
   pragma Volatile (OCR4C);
   OCR4CL                   : Unsigned_8 ;
   for OCR4CL'Address use OCR4CL_Addr;
   pragma Volatile (OCR4CL);
   OCR4CL_Bits              : Bits_In_Byte;
   for OCR4CL_Bits'Address use OCR4CL_Addr;
   pragma Volatile (OCR4CL_Bits);
   --  Timer/Counter4 Output Compare Register Low Byte bit 0
   OCR4CL0_Bit              : constant Bit_Number := 0;
   OCR4CL0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter4 Output Compare Register Low Byte bit 1
   OCR4CL1_Bit              : constant Bit_Number := 1;
   OCR4CL1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter4 Output Compare Register Low Byte bit 2
   OCR4CL2_Bit              : constant Bit_Number := 2;
   OCR4CL2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter4 Output Compare Register Low Byte bit 3
   OCR4CL3_Bit              : constant Bit_Number := 3;
   OCR4CL3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter4 Output Compare Register Low Byte bit 4
   OCR4CL4_Bit              : constant Bit_Number := 4;
   OCR4CL4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter4 Output Compare Register Low Byte bit 5
   OCR4CL5_Bit              : constant Bit_Number := 5;
   OCR4CL5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter4 Output Compare Register Low Byte bit 6
   OCR4CL6_Bit              : constant Bit_Number := 6;
   OCR4CL6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter4 Output Compare Register Low Byte bit 7
   OCR4CL7_Bit              : constant Bit_Number := 7;
   OCR4CL7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter4 Output Compare Register B High Byte
   OCR4BH_Addr              : constant Address    := 16#ab#;
   OCR4BH                   : Unsigned_8 ;
   for OCR4BH'Address use OCR4BH_Addr;
   pragma Volatile (OCR4BH);
   OCR4BH_Bits              : Bits_In_Byte;
   for OCR4BH_Bits'Address use OCR4BH_Addr;
   pragma Volatile (OCR4BH_Bits);
   --  Timer/Counter4 Output Compare Register High Byte bit 0
   OCR4BH0_Bit              : constant Bit_Number := 0;
   OCR4BH0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter4 Output Compare Register High Byte bit 1
   OCR4BH1_Bit              : constant Bit_Number := 1;
   OCR4BH1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter4 Output Compare Register High Byte bit 2
   OCR4BH2_Bit              : constant Bit_Number := 2;
   OCR4BH2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter4 Output Compare Register High Byte bit 3
   OCR4BH3_Bit              : constant Bit_Number := 3;
   OCR4BH3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter4 Output Compare Register High Byte bit 4
   OCR4BH4_Bit              : constant Bit_Number := 4;
   OCR4BH4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter4 Output Compare Register High Byte bit 5
   OCR4BH5_Bit              : constant Bit_Number := 5;
   OCR4BH5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter4 Output Compare Register High Byte bit 6
   OCR4BH6_Bit              : constant Bit_Number := 6;
   OCR4BH6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter4 Output Compare Register High Byte bit 7
   OCR4BH7_Bit              : constant Bit_Number := 7;
   OCR4BH7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter4 Output Compare Register B Low Byte
   OCR4BL_Addr              : constant Address    := 16#aa#;
   OCR4B                    : Unsigned_16;
   for OCR4B'Address use OCR4BL_Addr;
   pragma Volatile (OCR4B);
   OCR4BL                   : Unsigned_8 ;
   for OCR4BL'Address use OCR4BL_Addr;
   pragma Volatile (OCR4BL);
   OCR4BL_Bits              : Bits_In_Byte;
   for OCR4BL_Bits'Address use OCR4BL_Addr;
   pragma Volatile (OCR4BL_Bits);
   --  Timer/Counter4 Output Compare Register Low Byte bit 0
   OCR4BL0_Bit              : constant Bit_Number := 0;
   OCR4BL0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter4 Output Compare Register Low Byte bit 1
   OCR4BL1_Bit              : constant Bit_Number := 1;
   OCR4BL1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter4 Output Compare Register Low Byte bit 2
   OCR4BL2_Bit              : constant Bit_Number := 2;
   OCR4BL2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter4 Output Compare Register Low Byte bit 3
   OCR4BL3_Bit              : constant Bit_Number := 3;
   OCR4BL3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter4 Output Compare Register Low Byte bit 4
   OCR4BL4_Bit              : constant Bit_Number := 4;
   OCR4BL4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter4 Output Compare Register Low Byte bit 5
   OCR4BL5_Bit              : constant Bit_Number := 5;
   OCR4BL5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter4 Output Compare Register Low Byte bit 6
   OCR4BL6_Bit              : constant Bit_Number := 6;
   OCR4BL6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter4 Output Compare Register Low Byte bit 7
   OCR4BL7_Bit              : constant Bit_Number := 7;
   OCR4BL7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter4 Outbut Compare Register A High Byte
   OCR4AH_Addr              : constant Address    := 16#a9#;
   OCR4AH                   : Unsigned_8 ;
   for OCR4AH'Address use OCR4AH_Addr;
   pragma Volatile (OCR4AH);
   OCR4AH_Bits              : Bits_In_Byte;
   for OCR4AH_Bits'Address use OCR4AH_Addr;
   pragma Volatile (OCR4AH_Bits);
   --  Timer/Counter4 Outbut Compare Register High Byte bit 0
   OCR4AH0_Bit              : constant Bit_Number := 0;
   OCR4AH0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter4 Outbut Compare Register High Byte bit 1
   OCR4AH1_Bit              : constant Bit_Number := 1;
   OCR4AH1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter4 Outbut Compare Register High Byte bit 2
   OCR4AH2_Bit              : constant Bit_Number := 2;
   OCR4AH2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter4 Outbut Compare Register High Byte bit 3
   OCR4AH3_Bit              : constant Bit_Number := 3;
   OCR4AH3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter4 Outbut Compare Register High Byte bit 4
   OCR4AH4_Bit              : constant Bit_Number := 4;
   OCR4AH4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter4 Outbut Compare Register High Byte bit 5
   OCR4AH5_Bit              : constant Bit_Number := 5;
   OCR4AH5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter4 Outbut Compare Register High Byte bit 6
   OCR4AH6_Bit              : constant Bit_Number := 6;
   OCR4AH6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter4 Outbut Compare Register High Byte bit 7
   OCR4AH7_Bit              : constant Bit_Number := 7;
   OCR4AH7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter4 Outbut Compare Register A Low Byte
   OCR4AL_Addr              : constant Address    := 16#a8#;
   OCR4A                    : Unsigned_16;
   for OCR4A'Address use OCR4AL_Addr;
   pragma Volatile (OCR4A);
   OCR4AL                   : Unsigned_8 ;
   for OCR4AL'Address use OCR4AL_Addr;
   pragma Volatile (OCR4AL);
   OCR4AL_Bits              : Bits_In_Byte;
   for OCR4AL_Bits'Address use OCR4AL_Addr;
   pragma Volatile (OCR4AL_Bits);
   --  Timer/Counter4 Outbut Compare Register Low Byte Bit 0
   OCR4AL0_Bit              : constant Bit_Number := 0;
   OCR4AL0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter4 Outbut Compare Register Low Byte Bit 1
   OCR4AL1_Bit              : constant Bit_Number := 1;
   OCR4AL1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter4 Outbut Compare Register Low Byte Bit 2
   OCR4AL2_Bit              : constant Bit_Number := 2;
   OCR4AL2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter4 Outbut Compare Register Low Byte Bit 3
   OCR4AL3_Bit              : constant Bit_Number := 3;
   OCR4AL3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter4 Outbut Compare Register Low Byte Bit 4
   OCR4AL4_Bit              : constant Bit_Number := 4;
   OCR4AL4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter4 Outbut Compare Register Low Byte Bit 5
   OCR4AL5_Bit              : constant Bit_Number := 5;
   OCR4AL5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter4 Outbut Compare Register Low Byte Bit 6
   OCR4AL6_Bit              : constant Bit_Number := 6;
   OCR4AL6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter4 Outbut Compare Register Low Byte Bit 7
   OCR4AL7_Bit              : constant Bit_Number := 7;
   OCR4AL7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter4 Input Capture Register High Byte
   ICR4H_Addr               : constant Address    := 16#a7#;
   ICR4H                    : Unsigned_8 ;
   for ICR4H'Address use ICR4H_Addr;
   pragma Volatile (ICR4H);
   ICR4H_Bits               : Bits_In_Byte;
   for ICR4H_Bits'Address use ICR4H_Addr;
   pragma Volatile (ICR4H_Bits);
   --  Timer/Counter4 Input Capture Register High Byte bit 0
   ICR4H0_Bit               : constant Bit_Number := 0;
   ICR4H0_Mask              : constant Unsigned_8 := 16#01#;
   --  Timer/Counter4 Input Capture Register High Byte bit 1
   ICR4H1_Bit               : constant Bit_Number := 1;
   ICR4H1_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter4 Input Capture Register High Byte bit 2
   ICR4H2_Bit               : constant Bit_Number := 2;
   ICR4H2_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter4 Input Capture Register High Byte bit 3
   ICR4H3_Bit               : constant Bit_Number := 3;
   ICR4H3_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter4 Input Capture Register High Byte bit 4
   ICR4H4_Bit               : constant Bit_Number := 4;
   ICR4H4_Mask              : constant Unsigned_8 := 16#10#;
   --  Timer/Counter4 Input Capture Register High Byte bit 5
   ICR4H5_Bit               : constant Bit_Number := 5;
   ICR4H5_Mask              : constant Unsigned_8 := 16#20#;
   --  Timer/Counter4 Input Capture Register High Byte bit 6
   ICR4H6_Bit               : constant Bit_Number := 6;
   ICR4H6_Mask              : constant Unsigned_8 := 16#40#;
   --  Timer/Counter4 Input Capture Register High Byte bit 7
   ICR4H7_Bit               : constant Bit_Number := 7;
   ICR4H7_Mask              : constant Unsigned_8 := 16#80#;

   --  Timer/Counter4 Input Capture Register Low Byte
   ICR4L_Addr               : constant Address    := 16#a6#;
   ICR4                     : Unsigned_16;
   for ICR4'Address use ICR4L_Addr;
   pragma Volatile (ICR4);
   ICR4L                    : Unsigned_8 ;
   for ICR4L'Address use ICR4L_Addr;
   pragma Volatile (ICR4L);
   ICR4L_Bits               : Bits_In_Byte;
   for ICR4L_Bits'Address use ICR4L_Addr;
   pragma Volatile (ICR4L_Bits);
   --  Timer/Counter4 Input Capture Register Low Byte bit 0
   ICR4L0_Bit               : constant Bit_Number := 0;
   ICR4L0_Mask              : constant Unsigned_8 := 16#01#;
   --  Timer/Counter4 Input Capture Register Low Byte bit 1
   ICR4L1_Bit               : constant Bit_Number := 1;
   ICR4L1_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter4 Input Capture Register Low Byte bit 2
   ICR4L2_Bit               : constant Bit_Number := 2;
   ICR4L2_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter4 Input Capture Register Low Byte bit 3
   ICR4L3_Bit               : constant Bit_Number := 3;
   ICR4L3_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter4 Input Capture Register Low Byte bit 4
   ICR4L4_Bit               : constant Bit_Number := 4;
   ICR4L4_Mask              : constant Unsigned_8 := 16#10#;
   --  Timer/Counter4 Input Capture Register Low Byte bit 5
   ICR4L5_Bit               : constant Bit_Number := 5;
   ICR4L5_Mask              : constant Unsigned_8 := 16#20#;
   --  Timer/Counter4 Input Capture Register Low Byte bit 6
   ICR4L6_Bit               : constant Bit_Number := 6;
   ICR4L6_Mask              : constant Unsigned_8 := 16#40#;
   --  Timer/Counter4 Input Capture Register Low Byte bit 7
   ICR4L7_Bit               : constant Bit_Number := 7;
   ICR4L7_Mask              : constant Unsigned_8 := 16#80#;

   --  Timer/Counter4 High Byte
   TCNT4H_Addr              : constant Address    := 16#a5#;
   TCNT4H                   : Unsigned_8 ;
   for TCNT4H'Address use TCNT4H_Addr;
   pragma Volatile (TCNT4H);
   TCNT4H_Bits              : Bits_In_Byte;
   for TCNT4H_Bits'Address use TCNT4H_Addr;
   pragma Volatile (TCNT4H_Bits);
   --  Timer/Counter4 High Byte bit 0
   TCNT4H0_Bit              : constant Bit_Number := 0;
   TCNT4H0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter4 High Byte bit 1
   TCNT4H1_Bit              : constant Bit_Number := 1;
   TCNT4H1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter4 High Byte bit 2
   TCNT4H2_Bit              : constant Bit_Number := 2;
   TCNT4H2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter4 High Byte bit 3
   TCNT4H3_Bit              : constant Bit_Number := 3;
   TCNT4H3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter4 High Byte bit 4
   TCNT4H4_Bit              : constant Bit_Number := 4;
   TCNT4H4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter4 High Byte bit 5
   TCNT4H5_Bit              : constant Bit_Number := 5;
   TCNT4H5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter4 High Byte bit 6
   TCNT4H6_Bit              : constant Bit_Number := 6;
   TCNT4H6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter4 High Byte bit 7
   TCNT4H7_Bit              : constant Bit_Number := 7;
   TCNT4H7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter4 Low Byte
   TCNT4L_Addr              : constant Address    := 16#a4#;
   TCNT4                    : Unsigned_16;
   for TCNT4'Address use TCNT4L_Addr;
   pragma Volatile (TCNT4);
   TCNT4L                   : Unsigned_8 ;
   for TCNT4L'Address use TCNT4L_Addr;
   pragma Volatile (TCNT4L);
   TCNT4L_Bits              : Bits_In_Byte;
   for TCNT4L_Bits'Address use TCNT4L_Addr;
   pragma Volatile (TCNT4L_Bits);
   --  Timer/Counter4 Low Byte bit 0
   TCNT4L0_Bit              : constant Bit_Number := 0;
   TCNT4L0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter4 Low Byte bit 1
   TCNT4L1_Bit              : constant Bit_Number := 1;
   TCNT4L1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter4 Low Byte bit 2
   TCNT4L2_Bit              : constant Bit_Number := 2;
   TCNT4L2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter4 Low Byte bit 3
   TCNT4L3_Bit              : constant Bit_Number := 3;
   TCNT4L3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter4 Low Byte bit 4
   TCNT4L4_Bit              : constant Bit_Number := 4;
   TCNT4L4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter4 Low Byte bit 5
   TCNT4L5_Bit              : constant Bit_Number := 5;
   TCNT4L5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter4 Low Byte bit 6
   TCNT4L6_Bit              : constant Bit_Number := 6;
   TCNT4L6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter4 Low Byte bit 7
   TCNT4L7_Bit              : constant Bit_Number := 7;
   TCNT4L7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter 4 Control Register C
   TCCR4C_Addr              : constant Address    := 16#a2#;
   TCCR4C                   : Unsigned_8 ;
   for TCCR4C'Address use TCCR4C_Addr;
   pragma Volatile (TCCR4C);
   TCCR4C_Bits              : Bits_In_Byte;
   for TCCR4C_Bits'Address use TCCR4C_Addr;
   pragma Volatile (TCCR4C_Bits);
   --  Force Output Compare 4C
   FOC4C_Bit                : constant Bit_Number := 5;
   FOC4C_Mask               : constant Unsigned_8 := 16#20#;
   --  Force Output Compare 4B
   FOC4B_Bit                : constant Bit_Number := 6;
   FOC4B_Mask               : constant Unsigned_8 := 16#40#;
   --  Force Output Compare 4A
   FOC4A_Bit                : constant Bit_Number := 7;
   FOC4A_Mask               : constant Unsigned_8 := 16#80#;

   --  Timer/Counter4 Control Register B
   TCCR4B_Addr              : constant Address    := 16#a1#;
   TCCR4B                   : Unsigned_8 ;
   for TCCR4B'Address use TCCR4B_Addr;
   pragma Volatile (TCCR4B);
   TCCR4B_Bits              : Bits_In_Byte;
   for TCCR4B_Bits'Address use TCCR4B_Addr;
   pragma Volatile (TCCR4B_Bits);
   --  Prescaler source of Timer/Counter 4
   CS40_Bit                 : constant Bit_Number := 0;
   CS40_Mask                : constant Unsigned_8 := 16#01#;
   --  Prescaler source of Timer/Counter 4
   CS41_Bit                 : constant Bit_Number := 1;
   CS41_Mask                : constant Unsigned_8 := 16#02#;
   --  Prescaler source of Timer/Counter 4
   CS42_Bit                 : constant Bit_Number := 2;
   CS42_Mask                : constant Unsigned_8 := 16#04#;
   --  Waveform Generation Mode
   WGM42_Bit                : constant Bit_Number := 3;
   WGM42_Mask               : constant Unsigned_8 := 16#08#;
   --  Waveform Generation Mode
   WGM43_Bit                : constant Bit_Number := 4;
   WGM43_Mask               : constant Unsigned_8 := 16#10#;
   --  Input Capture 4 Edge Select
   ICES4_Bit                : constant Bit_Number := 6;
   ICES4_Mask               : constant Unsigned_8 := 16#40#;
   --  Input Capture 4 Noise Canceler
   ICNC4_Bit                : constant Bit_Number := 7;
   ICNC4_Mask               : constant Unsigned_8 := 16#80#;

   --  Timer/Counter4 Control Register A
   TCCR4A_Addr              : constant Address    := 16#a0#;
   TCCR4A                   : Unsigned_8 ;
   for TCCR4A'Address use TCCR4A_Addr;
   pragma Volatile (TCCR4A);
   TCCR4A_Bits              : Bits_In_Byte;
   for TCCR4A_Bits'Address use TCCR4A_Addr;
   pragma Volatile (TCCR4A_Bits);
   --  Waveform Generation Mode
   WGM40_Bit                : constant Bit_Number := 0;
   WGM40_Mask               : constant Unsigned_8 := 16#01#;
   --  Waveform Generation Mode
   WGM41_Bit                : constant Bit_Number := 1;
   WGM41_Mask               : constant Unsigned_8 := 16#02#;
   --  Compare Output Mode 4C, bit 0
   COM4C0_Bit               : constant Bit_Number := 2;
   COM4C0_Mask              : constant Unsigned_8 := 16#04#;
   --  Compare Output Mode 4C, bit 1
   COM4C1_Bit               : constant Bit_Number := 3;
   COM4C1_Mask              : constant Unsigned_8 := 16#08#;
   --  Compare Output Mode 4B, bit 0
   COM4B0_Bit               : constant Bit_Number := 4;
   COM4B0_Mask              : constant Unsigned_8 := 16#10#;
   --  Compare Output Mode 4B, bit 1
   COM4B1_Bit               : constant Bit_Number := 5;
   COM4B1_Mask              : constant Unsigned_8 := 16#20#;
   --  Compare Output Mode 4A, bit 0
   COM4A0_Bit               : constant Bit_Number := 6;
   COM4A0_Mask              : constant Unsigned_8 := 16#40#;
   --  Compare Output Mode 1A, bit 1
   COM4A1_Bit               : constant Bit_Number := 7;
   COM4A1_Mask              : constant Unsigned_8 := 16#80#;

   --  Timer/Counter3 Output Compare Register B High Byte
   OCR3CH_Addr              : constant Address    := 16#9d#;
   OCR3CH                   : Unsigned_8 ;
   for OCR3CH'Address use OCR3CH_Addr;
   pragma Volatile (OCR3CH);
   OCR3CH_Bits              : Bits_In_Byte;
   for OCR3CH_Bits'Address use OCR3CH_Addr;
   pragma Volatile (OCR3CH_Bits);
   --  Timer/Counter3 Output Compare Register High Byte bit 0
   OCR3CH0_Bit              : constant Bit_Number := 0;
   OCR3CH0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter3 Output Compare Register High Byte bit 1
   OCR3CH1_Bit              : constant Bit_Number := 1;
   OCR3CH1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter3 Output Compare Register High Byte bit 2
   OCR3CH2_Bit              : constant Bit_Number := 2;
   OCR3CH2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter3 Output Compare Register High Byte bit 3
   OCR3CH3_Bit              : constant Bit_Number := 3;
   OCR3CH3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter3 Output Compare Register High Byte bit 4
   OCR3CH4_Bit              : constant Bit_Number := 4;
   OCR3CH4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter3 Output Compare Register High Byte bit 5
   OCR3CH5_Bit              : constant Bit_Number := 5;
   OCR3CH5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter3 Output Compare Register High Byte bit 6
   OCR3CH6_Bit              : constant Bit_Number := 6;
   OCR3CH6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter3 Output Compare Register High Byte bit 7
   OCR3CH7_Bit              : constant Bit_Number := 7;
   OCR3CH7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter3 Output Compare Register B Low Byte
   OCR3CL_Addr              : constant Address    := 16#9c#;
   OCR3C                    : Unsigned_16;
   for OCR3C'Address use OCR3CL_Addr;
   pragma Volatile (OCR3C);
   OCR3CL                   : Unsigned_8 ;
   for OCR3CL'Address use OCR3CL_Addr;
   pragma Volatile (OCR3CL);
   OCR3CL_Bits              : Bits_In_Byte;
   for OCR3CL_Bits'Address use OCR3CL_Addr;
   pragma Volatile (OCR3CL_Bits);
   --  Timer/Counter3 Output Compare Register Low Byte bit 0
   OCR3CL0_Bit              : constant Bit_Number := 0;
   OCR3CL0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter3 Output Compare Register Low Byte bit 1
   OCR3CL1_Bit              : constant Bit_Number := 1;
   OCR3CL1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter3 Output Compare Register Low Byte bit 2
   OCR3CL2_Bit              : constant Bit_Number := 2;
   OCR3CL2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter3 Output Compare Register Low Byte bit 3
   OCR3CL3_Bit              : constant Bit_Number := 3;
   OCR3CL3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter3 Output Compare Register Low Byte bit 4
   OCR3CL4_Bit              : constant Bit_Number := 4;
   OCR3CL4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter3 Output Compare Register Low Byte bit 5
   OCR3CL5_Bit              : constant Bit_Number := 5;
   OCR3CL5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter3 Output Compare Register Low Byte bit 6
   OCR3CL6_Bit              : constant Bit_Number := 6;
   OCR3CL6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter3 Output Compare Register Low Byte bit 7
   OCR3CL7_Bit              : constant Bit_Number := 7;
   OCR3CL7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter3 Output Compare Register B High Byte
   OCR3BH_Addr              : constant Address    := 16#9b#;
   OCR3BH                   : Unsigned_8 ;
   for OCR3BH'Address use OCR3BH_Addr;
   pragma Volatile (OCR3BH);
   OCR3BH_Bits              : Bits_In_Byte;
   for OCR3BH_Bits'Address use OCR3BH_Addr;
   pragma Volatile (OCR3BH_Bits);
   --  Timer/Counter3 Output Compare Register High Byte bit 0
   OCR3BH0_Bit              : constant Bit_Number := 0;
   OCR3BH0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter3 Output Compare Register High Byte bit 1
   OCR3BH1_Bit              : constant Bit_Number := 1;
   OCR3BH1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter3 Output Compare Register High Byte bit 2
   OCR3BH2_Bit              : constant Bit_Number := 2;
   OCR3BH2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter3 Output Compare Register High Byte bit 3
   OCR3BH3_Bit              : constant Bit_Number := 3;
   OCR3BH3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter3 Output Compare Register High Byte bit 4
   OCR3BH4_Bit              : constant Bit_Number := 4;
   OCR3BH4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter3 Output Compare Register High Byte bit 5
   OCR3BH5_Bit              : constant Bit_Number := 5;
   OCR3BH5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter3 Output Compare Register High Byte bit 6
   OCR3BH6_Bit              : constant Bit_Number := 6;
   OCR3BH6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter3 Output Compare Register High Byte bit 7
   OCR3BH7_Bit              : constant Bit_Number := 7;
   OCR3BH7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter3 Output Compare Register B Low Byte
   OCR3BL_Addr              : constant Address    := 16#9a#;
   OCR3B                    : Unsigned_16;
   for OCR3B'Address use OCR3BL_Addr;
   pragma Volatile (OCR3B);
   OCR3BL                   : Unsigned_8 ;
   for OCR3BL'Address use OCR3BL_Addr;
   pragma Volatile (OCR3BL);
   OCR3BL_Bits              : Bits_In_Byte;
   for OCR3BL_Bits'Address use OCR3BL_Addr;
   pragma Volatile (OCR3BL_Bits);
   --  Timer/Counter3 Output Compare Register Low Byte bit 0
   OCR3BL0_Bit              : constant Bit_Number := 0;
   OCR3BL0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter3 Output Compare Register Low Byte bit 1
   OCR3BL1_Bit              : constant Bit_Number := 1;
   OCR3BL1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter3 Output Compare Register Low Byte bit 2
   OCR3BL2_Bit              : constant Bit_Number := 2;
   OCR3BL2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter3 Output Compare Register Low Byte bit 3
   OCR3BL3_Bit              : constant Bit_Number := 3;
   OCR3BL3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter3 Output Compare Register Low Byte bit 4
   OCR3BL4_Bit              : constant Bit_Number := 4;
   OCR3BL4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter3 Output Compare Register Low Byte bit 5
   OCR3BL5_Bit              : constant Bit_Number := 5;
   OCR3BL5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter3 Output Compare Register Low Byte bit 6
   OCR3BL6_Bit              : constant Bit_Number := 6;
   OCR3BL6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter3 Output Compare Register Low Byte bit 7
   OCR3BL7_Bit              : constant Bit_Number := 7;
   OCR3BL7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter3 Outbut Compare Register A High Byte
   OCR3AH_Addr              : constant Address    := 16#99#;
   OCR3AH                   : Unsigned_8 ;
   for OCR3AH'Address use OCR3AH_Addr;
   pragma Volatile (OCR3AH);
   OCR3AH_Bits              : Bits_In_Byte;
   for OCR3AH_Bits'Address use OCR3AH_Addr;
   pragma Volatile (OCR3AH_Bits);
   --  Timer/Counter3 Outbut Compare Register High Byte bit 0
   OCR3AH0_Bit              : constant Bit_Number := 0;
   OCR3AH0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter3 Outbut Compare Register High Byte bit 1
   OCR3AH1_Bit              : constant Bit_Number := 1;
   OCR3AH1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter3 Outbut Compare Register High Byte bit 2
   OCR3AH2_Bit              : constant Bit_Number := 2;
   OCR3AH2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter3 Outbut Compare Register High Byte bit 3
   OCR3AH3_Bit              : constant Bit_Number := 3;
   OCR3AH3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter3 Outbut Compare Register High Byte bit 4
   OCR3AH4_Bit              : constant Bit_Number := 4;
   OCR3AH4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter3 Outbut Compare Register High Byte bit 5
   OCR3AH5_Bit              : constant Bit_Number := 5;
   OCR3AH5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter3 Outbut Compare Register High Byte bit 6
   OCR3AH6_Bit              : constant Bit_Number := 6;
   OCR3AH6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter3 Outbut Compare Register High Byte bit 7
   OCR3AH7_Bit              : constant Bit_Number := 7;
   OCR3AH7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter3 Outbut Compare Register A Low Byte
   OCR3AL_Addr              : constant Address    := 16#98#;
   OCR3A                    : Unsigned_16;
   for OCR3A'Address use OCR3AL_Addr;
   pragma Volatile (OCR3A);
   OCR3AL                   : Unsigned_8 ;
   for OCR3AL'Address use OCR3AL_Addr;
   pragma Volatile (OCR3AL);
   OCR3AL_Bits              : Bits_In_Byte;
   for OCR3AL_Bits'Address use OCR3AL_Addr;
   pragma Volatile (OCR3AL_Bits);
   --  Timer/Counter3 Outbut Compare Register Low Byte Bit 0
   OCR3AL0_Bit              : constant Bit_Number := 0;
   OCR3AL0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter3 Outbut Compare Register Low Byte Bit 1
   OCR3AL1_Bit              : constant Bit_Number := 1;
   OCR3AL1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter3 Outbut Compare Register Low Byte Bit 2
   OCR3AL2_Bit              : constant Bit_Number := 2;
   OCR3AL2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter3 Outbut Compare Register Low Byte Bit 3
   OCR3AL3_Bit              : constant Bit_Number := 3;
   OCR3AL3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter3 Outbut Compare Register Low Byte Bit 4
   OCR3AL4_Bit              : constant Bit_Number := 4;
   OCR3AL4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter3 Outbut Compare Register Low Byte Bit 5
   OCR3AL5_Bit              : constant Bit_Number := 5;
   OCR3AL5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter3 Outbut Compare Register Low Byte Bit 6
   OCR3AL6_Bit              : constant Bit_Number := 6;
   OCR3AL6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter3 Outbut Compare Register Low Byte Bit 7
   OCR3AL7_Bit              : constant Bit_Number := 7;
   OCR3AL7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter3 Input Capture Register High Byte
   ICR3H_Addr               : constant Address    := 16#97#;
   ICR3H                    : Unsigned_8 ;
   for ICR3H'Address use ICR3H_Addr;
   pragma Volatile (ICR3H);
   ICR3H_Bits               : Bits_In_Byte;
   for ICR3H_Bits'Address use ICR3H_Addr;
   pragma Volatile (ICR3H_Bits);
   --  Timer/Counter3 Input Capture Register High Byte bit 0
   ICR3H0_Bit               : constant Bit_Number := 0;
   ICR3H0_Mask              : constant Unsigned_8 := 16#01#;
   --  Timer/Counter3 Input Capture Register High Byte bit 1
   ICR3H1_Bit               : constant Bit_Number := 1;
   ICR3H1_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter3 Input Capture Register High Byte bit 2
   ICR3H2_Bit               : constant Bit_Number := 2;
   ICR3H2_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter3 Input Capture Register High Byte bit 3
   ICR3H3_Bit               : constant Bit_Number := 3;
   ICR3H3_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter3 Input Capture Register High Byte bit 4
   ICR3H4_Bit               : constant Bit_Number := 4;
   ICR3H4_Mask              : constant Unsigned_8 := 16#10#;
   --  Timer/Counter3 Input Capture Register High Byte bit 5
   ICR3H5_Bit               : constant Bit_Number := 5;
   ICR3H5_Mask              : constant Unsigned_8 := 16#20#;
   --  Timer/Counter3 Input Capture Register High Byte bit 6
   ICR3H6_Bit               : constant Bit_Number := 6;
   ICR3H6_Mask              : constant Unsigned_8 := 16#40#;
   --  Timer/Counter3 Input Capture Register High Byte bit 7
   ICR3H7_Bit               : constant Bit_Number := 7;
   ICR3H7_Mask              : constant Unsigned_8 := 16#80#;

   --  Timer/Counter3 Input Capture Register Low Byte
   ICR3L_Addr               : constant Address    := 16#96#;
   ICR3                     : Unsigned_16;
   for ICR3'Address use ICR3L_Addr;
   pragma Volatile (ICR3);
   ICR3L                    : Unsigned_8 ;
   for ICR3L'Address use ICR3L_Addr;
   pragma Volatile (ICR3L);
   ICR3L_Bits               : Bits_In_Byte;
   for ICR3L_Bits'Address use ICR3L_Addr;
   pragma Volatile (ICR3L_Bits);
   --  Timer/Counter3 Input Capture Register Low Byte bit 0
   ICR3L0_Bit               : constant Bit_Number := 0;
   ICR3L0_Mask              : constant Unsigned_8 := 16#01#;
   --  Timer/Counter3 Input Capture Register Low Byte bit 1
   ICR3L1_Bit               : constant Bit_Number := 1;
   ICR3L1_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter3 Input Capture Register Low Byte bit 2
   ICR3L2_Bit               : constant Bit_Number := 2;
   ICR3L2_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter3 Input Capture Register Low Byte bit 3
   ICR3L3_Bit               : constant Bit_Number := 3;
   ICR3L3_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter3 Input Capture Register Low Byte bit 4
   ICR3L4_Bit               : constant Bit_Number := 4;
   ICR3L4_Mask              : constant Unsigned_8 := 16#10#;
   --  Timer/Counter3 Input Capture Register Low Byte bit 5
   ICR3L5_Bit               : constant Bit_Number := 5;
   ICR3L5_Mask              : constant Unsigned_8 := 16#20#;
   --  Timer/Counter3 Input Capture Register Low Byte bit 6
   ICR3L6_Bit               : constant Bit_Number := 6;
   ICR3L6_Mask              : constant Unsigned_8 := 16#40#;
   --  Timer/Counter3 Input Capture Register Low Byte bit 7
   ICR3L7_Bit               : constant Bit_Number := 7;
   ICR3L7_Mask              : constant Unsigned_8 := 16#80#;

   --  Timer/Counter3 High Byte
   TCNT3H_Addr              : constant Address    := 16#95#;
   TCNT3H                   : Unsigned_8 ;
   for TCNT3H'Address use TCNT3H_Addr;
   pragma Volatile (TCNT3H);
   TCNT3H_Bits              : Bits_In_Byte;
   for TCNT3H_Bits'Address use TCNT3H_Addr;
   pragma Volatile (TCNT3H_Bits);
   --  Timer/Counter3 High Byte bit 0
   TCNT3H0_Bit              : constant Bit_Number := 0;
   TCNT3H0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter3 High Byte bit 1
   TCNT3H1_Bit              : constant Bit_Number := 1;
   TCNT3H1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter3 High Byte bit 2
   TCNT3H2_Bit              : constant Bit_Number := 2;
   TCNT3H2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter3 High Byte bit 3
   TCNT3H3_Bit              : constant Bit_Number := 3;
   TCNT3H3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter3 High Byte bit 4
   TCNT3H4_Bit              : constant Bit_Number := 4;
   TCNT3H4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter3 High Byte bit 5
   TCNT3H5_Bit              : constant Bit_Number := 5;
   TCNT3H5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter3 High Byte bit 6
   TCNT3H6_Bit              : constant Bit_Number := 6;
   TCNT3H6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter3 High Byte bit 7
   TCNT3H7_Bit              : constant Bit_Number := 7;
   TCNT3H7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter3 Low Byte
   TCNT3L_Addr              : constant Address    := 16#94#;
   TCNT3                    : Unsigned_16;
   for TCNT3'Address use TCNT3L_Addr;
   pragma Volatile (TCNT3);
   TCNT3L                   : Unsigned_8 ;
   for TCNT3L'Address use TCNT3L_Addr;
   pragma Volatile (TCNT3L);
   TCNT3L_Bits              : Bits_In_Byte;
   for TCNT3L_Bits'Address use TCNT3L_Addr;
   pragma Volatile (TCNT3L_Bits);
   --  Timer/Counter3 Low Byte bit 0
   TCNT3L0_Bit              : constant Bit_Number := 0;
   TCNT3L0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter3 Low Byte bit 1
   TCNT3L1_Bit              : constant Bit_Number := 1;
   TCNT3L1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter3 Low Byte bit 2
   TCNT3L2_Bit              : constant Bit_Number := 2;
   TCNT3L2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter3 Low Byte bit 3
   TCNT3L3_Bit              : constant Bit_Number := 3;
   TCNT3L3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter3 Low Byte bit 4
   TCNT3L4_Bit              : constant Bit_Number := 4;
   TCNT3L4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter3 Low Byte bit 5
   TCNT3L5_Bit              : constant Bit_Number := 5;
   TCNT3L5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter3 Low Byte bit 6
   TCNT3L6_Bit              : constant Bit_Number := 6;
   TCNT3L6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter3 Low Byte bit 7
   TCNT3L7_Bit              : constant Bit_Number := 7;
   TCNT3L7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter 3 Control Register C
   TCCR3C_Addr              : constant Address    := 16#92#;
   TCCR3C                   : Unsigned_8 ;
   for TCCR3C'Address use TCCR3C_Addr;
   pragma Volatile (TCCR3C);
   TCCR3C_Bits              : Bits_In_Byte;
   for TCCR3C_Bits'Address use TCCR3C_Addr;
   pragma Volatile (TCCR3C_Bits);
   --  Force Output Compare 3C
   FOC3C_Bit                : constant Bit_Number := 5;
   FOC3C_Mask               : constant Unsigned_8 := 16#20#;
   --  Force Output Compare 3B
   FOC3B_Bit                : constant Bit_Number := 6;
   FOC3B_Mask               : constant Unsigned_8 := 16#40#;
   --  Force Output Compare 3A
   FOC3A_Bit                : constant Bit_Number := 7;
   FOC3A_Mask               : constant Unsigned_8 := 16#80#;

   --  Timer/Counter3 Control Register B
   TCCR3B_Addr              : constant Address    := 16#91#;
   TCCR3B                   : Unsigned_8 ;
   for TCCR3B'Address use TCCR3B_Addr;
   pragma Volatile (TCCR3B);
   TCCR3B_Bits              : Bits_In_Byte;
   for TCCR3B_Bits'Address use TCCR3B_Addr;
   pragma Volatile (TCCR3B_Bits);
   --  Prescaler source of Timer/Counter 3
   CS30_Bit                 : constant Bit_Number := 0;
   CS30_Mask                : constant Unsigned_8 := 16#01#;
   --  Prescaler source of Timer/Counter 3
   CS31_Bit                 : constant Bit_Number := 1;
   CS31_Mask                : constant Unsigned_8 := 16#02#;
   --  Prescaler source of Timer/Counter 3
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
   --  Input Capture 3 Noise Canceler
   ICNC3_Bit                : constant Bit_Number := 7;
   ICNC3_Mask               : constant Unsigned_8 := 16#80#;

   --  Timer/Counter3 Control Register A
   TCCR3A_Addr              : constant Address    := 16#90#;
   TCCR3A                   : Unsigned_8 ;
   for TCCR3A'Address use TCCR3A_Addr;
   pragma Volatile (TCCR3A);
   TCCR3A_Bits              : Bits_In_Byte;
   for TCCR3A_Bits'Address use TCCR3A_Addr;
   pragma Volatile (TCCR3A_Bits);
   --  Waveform Generation Mode
   WGM30_Bit                : constant Bit_Number := 0;
   WGM30_Mask               : constant Unsigned_8 := 16#01#;
   --  Waveform Generation Mode
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
   --  Compare Output Mode 3A, bit 0
   COM3A0_Bit               : constant Bit_Number := 6;
   COM3A0_Mask              : constant Unsigned_8 := 16#40#;
   --  Compare Output Mode 1A, bit 1
   COM3A1_Bit               : constant Bit_Number := 7;
   COM3A1_Mask              : constant Unsigned_8 := 16#80#;

   --  Timer/Counter1 Output Compare Register C High Byte
   OCR1CH_Addr              : constant Address    := 16#8d#;
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

   --  Timer/Counter1 Output Compare Register C Low Byte
   OCR1CL_Addr              : constant Address    := 16#8c#;
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

   --  Timer/Counter1 Output Compare Register B High Byte
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

   --  Timer/Counter1 Output Compare Register B Low Byte
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

   --  Timer/Counter1 Outbut Compare Register A High Byte
   OCR1AH_Addr              : constant Address    := 16#89#;
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

   --  Timer/Counter1 Outbut Compare Register A Low Byte
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

   --  Timer/Counter 1 Control Register C
   TCCR1C_Addr              : constant Address    := 16#82#;
   TCCR1C                   : Unsigned_8 ;
   for TCCR1C'Address use TCCR1C_Addr;
   pragma Volatile (TCCR1C);
   TCCR1C_Bits              : Bits_In_Byte;
   for TCCR1C_Bits'Address use TCCR1C_Addr;
   pragma Volatile (TCCR1C_Bits);
   --  Force Output Compare 1C
   FOC1C_Bit                : constant Bit_Number := 5;
   FOC1C_Mask               : constant Unsigned_8 := 16#20#;
   --  Force Output Compare 1B
   FOC1B_Bit                : constant Bit_Number := 6;
   FOC1B_Mask               : constant Unsigned_8 := 16#40#;
   --  Force Output Compare 1A
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
   --  Compare Output Mode 1A, bit 0
   COM1A0_Bit               : constant Bit_Number := 6;
   COM1A0_Mask              : constant Unsigned_8 := 16#40#;
   --  Compare Output Mode 1A, bit 1
   COM1A1_Bit               : constant Bit_Number := 7;
   COM1A1_Mask              : constant Unsigned_8 := 16#80#;

   --  Digital Input Disable Register 1
   DIDR1_Addr               : constant Address    := 16#7f#;
   DIDR1                    : Unsigned_8 ;
   for DIDR1'Address use DIDR1_Addr;
   pragma Volatile (DIDR1);
   DIDR1_Bits               : Bits_In_Byte;
   for DIDR1_Bits'Address use DIDR1_Addr;
   pragma Volatile (DIDR1_Bits);
   --  AIN0 Digital Input Disable
   AIN0D_Bit                : constant Bit_Number := 0;
   AIN0D_Mask               : constant Unsigned_8 := 16#01#;
   --  AIN1 Digital Input Disable
   AIN1D_Bit                : constant Bit_Number := 1;
   AIN1D_Mask               : constant Unsigned_8 := 16#02#;

   --  Digital Input Disable Register
   DIDR0_Addr               : constant Address    := 16#7e#;
   DIDR0                    : Unsigned_8 ;
   for DIDR0'Address use DIDR0_Addr;
   pragma Volatile (DIDR0);
   DIDR0_Bits               : Bits_In_Byte;
   for DIDR0_Bits'Address use DIDR0_Addr;
   pragma Volatile (DIDR0_Bits);
   ADC0D_Bit                : constant Bit_Number := 0;
   ADC0D_Mask               : constant Unsigned_8 := 16#01#;
   ADC1D_Bit                : constant Bit_Number := 1;
   ADC1D_Mask               : constant Unsigned_8 := 16#02#;
   ADC2D_Bit                : constant Bit_Number := 2;
   ADC2D_Mask               : constant Unsigned_8 := 16#04#;
   ADC3D_Bit                : constant Bit_Number := 3;
   ADC3D_Mask               : constant Unsigned_8 := 16#08#;
   ADC4D_Bit                : constant Bit_Number := 4;
   ADC4D_Mask               : constant Unsigned_8 := 16#10#;
   ADC5D_Bit                : constant Bit_Number := 5;
   ADC5D_Mask               : constant Unsigned_8 := 16#20#;
   ADC6D_Bit                : constant Bit_Number := 6;
   ADC6D_Mask               : constant Unsigned_8 := 16#40#;
   ADC7D_Bit                : constant Bit_Number := 7;
   ADC7D_Mask               : constant Unsigned_8 := 16#80#;

   --  Digital Input Disable Register
   DIDR2_Addr               : constant Address    := 16#7d#;
   DIDR2                    : Unsigned_8 ;
   for DIDR2'Address use DIDR2_Addr;
   pragma Volatile (DIDR2);
   DIDR2_Bits               : Bits_In_Byte;
   for DIDR2_Bits'Address use DIDR2_Addr;
   pragma Volatile (DIDR2_Bits);
   ADC8D_Bit                : constant Bit_Number := 0;
   ADC8D_Mask               : constant Unsigned_8 := 16#01#;
   ADC9D_Bit                : constant Bit_Number := 1;
   ADC9D_Mask               : constant Unsigned_8 := 16#02#;
   ADC10D_Bit               : constant Bit_Number := 2;
   ADC10D_Mask              : constant Unsigned_8 := 16#04#;
   ADC11D_Bit               : constant Bit_Number := 3;
   ADC11D_Mask              : constant Unsigned_8 := 16#08#;
   ADC12D_Bit               : constant Bit_Number := 4;
   ADC12D_Mask              : constant Unsigned_8 := 16#10#;
   ADC13D_Bit               : constant Bit_Number := 5;
   ADC13D_Mask              : constant Unsigned_8 := 16#20#;
   ADC14D_Bit               : constant Bit_Number := 6;
   ADC14D_Mask              : constant Unsigned_8 := 16#40#;
   ADC15D_Bit               : constant Bit_Number := 7;
   ADC15D_Mask              : constant Unsigned_8 := 16#80#;

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

   --  ADC Control and Status Register B
   ADCSRB_Addr              : constant Address    := 16#7b#;
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
   --  Analog Channel and Gain Selection Bits
   MUX5_Bit                 : constant Bit_Number := 3;
   MUX5_Mask                : constant Unsigned_8 := 16#08#;
   --  Analog Comparator Multiplexer Enable
   ACME_Bit                 : constant Bit_Number := 6;
   ACME_Mask                : constant Unsigned_8 := 16#40#;

   --  The ADC Control and Status register A
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

   --  External Memory Control Register B
   XMCRB_Addr               : constant Address    := 16#75#;
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

   --  External Memory Control Register A
   XMCRA_Addr               : constant Address    := 16#74#;
   XMCRA                    : Unsigned_8 ;
   for XMCRA'Address use XMCRA_Addr;
   pragma Volatile (XMCRA);
   XMCRA_Bits               : Bits_In_Byte;
   for XMCRA_Bits'Address use XMCRA_Addr;
   pragma Volatile (XMCRA_Bits);
   --  Wait state select bit lower page
   SRW00_Bit                : constant Bit_Number := 0;
   SRW00_Mask               : constant Unsigned_8 := 16#01#;
   --  Wait state select bit lower page
   SRW01_Bit                : constant Bit_Number := 1;
   SRW01_Mask               : constant Unsigned_8 := 16#02#;
   --  Wait state select bit upper page
   SRW10_Bit                : constant Bit_Number := 2;
   SRW10_Mask               : constant Unsigned_8 := 16#04#;
   --  Wait state select bit upper page
   SRW11_Bit                : constant Bit_Number := 3;
   SRW11_Mask               : constant Unsigned_8 := 16#08#;
   --  Wait state page limit
   SRL0_Bit                 : constant Bit_Number := 4;
   SRL0_Mask                : constant Unsigned_8 := 16#10#;
   --  Wait state page limit
   SRL1_Bit                 : constant Bit_Number := 5;
   SRL1_Mask                : constant Unsigned_8 := 16#20#;
   --  Wait state page limit
   SRL2_Bit                 : constant Bit_Number := 6;
   SRL2_Mask                : constant Unsigned_8 := 16#40#;
   --  External SRAM Enable
   SRE_Bit                  : constant Bit_Number := 7;
   SRE_Mask                 : constant Unsigned_8 := 16#80#;

   --  Timer/Counter5 Interrupt Mask Register
   TIMSK5_Addr              : constant Address    := 16#73#;
   TIMSK5                   : Unsigned_8 ;
   for TIMSK5'Address use TIMSK5_Addr;
   pragma Volatile (TIMSK5);
   TIMSK5_Bits              : Bits_In_Byte;
   for TIMSK5_Bits'Address use TIMSK5_Addr;
   pragma Volatile (TIMSK5_Bits);
   --  Timer/Counter5 Overflow Interrupt Enable
   TOIE5_Bit                : constant Bit_Number := 0;
   TOIE5_Mask               : constant Unsigned_8 := 16#01#;
   --  Timer/Counter5 Output Compare A Match Interrupt Enable
   OCIE5A_Bit               : constant Bit_Number := 1;
   OCIE5A_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter5 Output Compare B Match Interrupt Enable
   OCIE5B_Bit               : constant Bit_Number := 2;
   OCIE5B_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter5 Output Compare C Match Interrupt Enable
   OCIE5C_Bit               : constant Bit_Number := 3;
   OCIE5C_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter5 Input Capture Interrupt Enable
   ICIE5_Bit                : constant Bit_Number := 5;
   ICIE5_Mask               : constant Unsigned_8 := 16#20#;

   --  Timer/Counter4 Interrupt Mask Register
   TIMSK4_Addr              : constant Address    := 16#72#;
   TIMSK4                   : Unsigned_8 ;
   for TIMSK4'Address use TIMSK4_Addr;
   pragma Volatile (TIMSK4);
   TIMSK4_Bits              : Bits_In_Byte;
   for TIMSK4_Bits'Address use TIMSK4_Addr;
   pragma Volatile (TIMSK4_Bits);
   --  Timer/Counter4 Overflow Interrupt Enable
   TOIE4_Bit                : constant Bit_Number := 0;
   TOIE4_Mask               : constant Unsigned_8 := 16#01#;
   --  Timer/Counter4 Output Compare A Match Interrupt Enable
   OCIE4A_Bit               : constant Bit_Number := 1;
   OCIE4A_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter4 Output Compare B Match Interrupt Enable
   OCIE4B_Bit               : constant Bit_Number := 2;
   OCIE4B_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter4 Output Compare C Match Interrupt Enable
   OCIE4C_Bit               : constant Bit_Number := 3;
   OCIE4C_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter4 Input Capture Interrupt Enable
   ICIE4_Bit                : constant Bit_Number := 5;
   ICIE4_Mask               : constant Unsigned_8 := 16#20#;

   --  Timer/Counter3 Interrupt Mask Register
   TIMSK3_Addr              : constant Address    := 16#71#;
   TIMSK3                   : Unsigned_8 ;
   for TIMSK3'Address use TIMSK3_Addr;
   pragma Volatile (TIMSK3);
   TIMSK3_Bits              : Bits_In_Byte;
   for TIMSK3_Bits'Address use TIMSK3_Addr;
   pragma Volatile (TIMSK3_Bits);
   --  Timer/Counter3 Overflow Interrupt Enable
   TOIE3_Bit                : constant Bit_Number := 0;
   TOIE3_Mask               : constant Unsigned_8 := 16#01#;
   --  Timer/Counter3 Output Compare A Match Interrupt Enable
   OCIE3A_Bit               : constant Bit_Number := 1;
   OCIE3A_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter3 Output Compare B Match Interrupt Enable
   OCIE3B_Bit               : constant Bit_Number := 2;
   OCIE3B_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter3 Output Compare C Match Interrupt Enable
   OCIE3C_Bit               : constant Bit_Number := 3;
   OCIE3C_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter3 Input Capture Interrupt Enable
   ICIE3_Bit                : constant Bit_Number := 5;
   ICIE3_Mask               : constant Unsigned_8 := 16#20#;

   --  Timer/Counter Interrupt Mask register
   TIMSK2_Addr              : constant Address    := 16#70#;
   TIMSK2                   : Unsigned_8 ;
   for TIMSK2'Address use TIMSK2_Addr;
   pragma Volatile (TIMSK2);
   TIMSK2_Bits              : Bits_In_Byte;
   for TIMSK2_Bits'Address use TIMSK2_Addr;
   pragma Volatile (TIMSK2_Bits);
   --  Timer/Counter2 Overflow Interrupt Enable
   TOIE2_Bit                : constant Bit_Number := 0;
   TOIE2_Mask               : constant Unsigned_8 := 16#01#;
   --  Timer/Counter2 Output Compare Match A Interrupt Enable
   OCIE2A_Bit               : constant Bit_Number := 1;
   OCIE2A_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter2 Output Compare Match B Interrupt Enable
   OCIE2B_Bit               : constant Bit_Number := 2;
   OCIE2B_Mask              : constant Unsigned_8 := 16#04#;

   --  Timer/Counter1 Interrupt Mask Register
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
   --  Timer/Counter1 Output Compare A Match Interrupt Enable
   OCIE1A_Bit               : constant Bit_Number := 1;
   OCIE1A_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter1 Output Compare B Match Interrupt Enable
   OCIE1B_Bit               : constant Bit_Number := 2;
   OCIE1B_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter1 Output Compare C Match Interrupt Enable
   OCIE1C_Bit               : constant Bit_Number := 3;
   OCIE1C_Mask              : constant Unsigned_8 := 16#08#;
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

   --  Pin Change Mask Register 2
   PCMSK2_Addr              : constant Address    := 16#6d#;
   PCMSK2                   : Unsigned_8 ;
   for PCMSK2'Address use PCMSK2_Addr;
   pragma Volatile (PCMSK2);
   PCMSK2_Bits              : Bits_In_Byte;
   for PCMSK2_Bits'Address use PCMSK2_Addr;
   pragma Volatile (PCMSK2_Bits);
   --  Pin Change Enable Mask 16
   PCINT16_Bit              : constant Bit_Number := 0;
   PCINT16_Mask             : constant Unsigned_8 := 16#01#;
   --  Pin Change Enable Mask 17
   PCINT17_Bit              : constant Bit_Number := 1;
   PCINT17_Mask             : constant Unsigned_8 := 16#02#;
   --  Pin Change Enable Mask 18
   PCINT18_Bit              : constant Bit_Number := 2;
   PCINT18_Mask             : constant Unsigned_8 := 16#04#;
   --  Pin Change Enable Mask 19
   PCINT19_Bit              : constant Bit_Number := 3;
   PCINT19_Mask             : constant Unsigned_8 := 16#08#;
   --  Pin Change Enable Mask 20
   PCINT20_Bit              : constant Bit_Number := 4;
   PCINT20_Mask             : constant Unsigned_8 := 16#10#;
   --  Pin Change Enable Mask 21
   PCINT21_Bit              : constant Bit_Number := 5;
   PCINT21_Mask             : constant Unsigned_8 := 16#20#;
   --  Pin Change Enable Mask 22
   PCINT22_Bit              : constant Bit_Number := 6;
   PCINT22_Mask             : constant Unsigned_8 := 16#40#;
   --  Pin Change Enable Mask 23
   PCINT23_Bit              : constant Bit_Number := 7;
   PCINT23_Mask             : constant Unsigned_8 := 16#80#;

   --  Pin Change Mask Register 1
   PCMSK1_Addr              : constant Address    := 16#6c#;
   PCMSK1                   : Unsigned_8 ;
   for PCMSK1'Address use PCMSK1_Addr;
   pragma Volatile (PCMSK1);
   PCMSK1_Bits              : Bits_In_Byte;
   for PCMSK1_Bits'Address use PCMSK1_Addr;
   pragma Volatile (PCMSK1_Bits);
   --  Pin Change Enable Mask 8
   PCINT8_Bit               : constant Bit_Number := 0;
   PCINT8_Mask              : constant Unsigned_8 := 16#01#;
   --  Pin Change Enable Mask 9
   PCINT9_Bit               : constant Bit_Number := 1;
   PCINT9_Mask              : constant Unsigned_8 := 16#02#;
   --  Pin Change Enable Mask 10
   PCINT10_Bit              : constant Bit_Number := 2;
   PCINT10_Mask             : constant Unsigned_8 := 16#04#;
   --  Pin Change Enable Mask 11
   PCINT11_Bit              : constant Bit_Number := 3;
   PCINT11_Mask             : constant Unsigned_8 := 16#08#;
   --  Pin Change Enable Mask 12
   PCINT12_Bit              : constant Bit_Number := 4;
   PCINT12_Mask             : constant Unsigned_8 := 16#10#;
   --  Pin Change Enable Mask 13
   PCINT13_Bit              : constant Bit_Number := 5;
   PCINT13_Mask             : constant Unsigned_8 := 16#20#;
   --  Pin Change Enable Mask 14
   PCINT14_Bit              : constant Bit_Number := 6;
   PCINT14_Mask             : constant Unsigned_8 := 16#40#;
   --  Pin Change Enable Mask 15
   PCINT15_Bit              : constant Bit_Number := 7;
   PCINT15_Mask             : constant Unsigned_8 := 16#80#;

   --  Pin Change Mask Register 0
   PCMSK0_Addr              : constant Address    := 16#6b#;
   PCMSK0                   : Unsigned_8 ;
   for PCMSK0'Address use PCMSK0_Addr;
   pragma Volatile (PCMSK0);
   PCMSK0_Bits              : Bits_In_Byte;
   for PCMSK0_Bits'Address use PCMSK0_Addr;
   pragma Volatile (PCMSK0_Bits);
   --  Pin Change Enable Mask 0
   PCINT0_Bit               : constant Bit_Number := 0;
   PCINT0_Mask              : constant Unsigned_8 := 16#01#;
   --  Pin Change Enable Mask 1
   PCINT1_Bit               : constant Bit_Number := 1;
   PCINT1_Mask              : constant Unsigned_8 := 16#02#;
   --  Pin Change Enable Mask 2
   PCINT2_Bit               : constant Bit_Number := 2;
   PCINT2_Mask              : constant Unsigned_8 := 16#04#;
   --  Pin Change Enable Mask 3
   PCINT3_Bit               : constant Bit_Number := 3;
   PCINT3_Mask              : constant Unsigned_8 := 16#08#;
   --  Pin Change Enable Mask 4
   PCINT4_Bit               : constant Bit_Number := 4;
   PCINT4_Mask              : constant Unsigned_8 := 16#10#;
   --  Pin Change Enable Mask 5
   PCINT5_Bit               : constant Bit_Number := 5;
   PCINT5_Mask              : constant Unsigned_8 := 16#20#;
   --  Pin Change Enable Mask 6
   PCINT6_Bit               : constant Bit_Number := 6;
   PCINT6_Mask              : constant Unsigned_8 := 16#40#;
   --  Pin Change Enable Mask 7
   PCINT7_Bit               : constant Bit_Number := 7;
   PCINT7_Mask              : constant Unsigned_8 := 16#80#;

   --  External Interrupt Control Register B
   EICRB_Addr               : constant Address    := 16#6a#;
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
   --  External Interrupt Sense Control Bit
   ISC30_Bit                : constant Bit_Number := 6;
   ISC30_Mask               : constant Unsigned_8 := 16#40#;
   --  External Interrupt Sense Control Bit
   ISC31_Bit                : constant Bit_Number := 7;
   ISC31_Mask               : constant Unsigned_8 := 16#80#;

   --  Pin Change Interrupt Control Register
   PCICR_Addr               : constant Address    := 16#68#;
   PCICR                    : Unsigned_8 ;
   for PCICR'Address use PCICR_Addr;
   pragma Volatile (PCICR);
   PCICR_Bits               : Bits_In_Byte;
   for PCICR_Bits'Address use PCICR_Addr;
   pragma Volatile (PCICR_Bits);
   --  Pin Change Interrupt Enable 0
   PCIE0_Bit                : constant Bit_Number := 0;
   PCIE0_Mask               : constant Unsigned_8 := 16#01#;
   --  Pin Change Interrupt Enable 1
   PCIE1_Bit                : constant Bit_Number := 1;
   PCIE1_Mask               : constant Unsigned_8 := 16#02#;
   --  Pin Change Interrupt Enable 2
   PCIE2_Bit                : constant Bit_Number := 2;
   PCIE2_Mask               : constant Unsigned_8 := 16#04#;

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
   --  Oscillator Calibration Value Bit7
   CAL7_Bit                 : constant Bit_Number := 7;
   CAL7_Mask                : constant Unsigned_8 := 16#80#;

   --  Power Reduction Register1
   PRR1_Addr                : constant Address    := 16#65#;
   PRR1                     : Unsigned_8 ;
   for PRR1'Address use PRR1_Addr;
   pragma Volatile (PRR1);
   PRR1_Bits                : Bits_In_Byte;
   for PRR1_Bits'Address use PRR1_Addr;
   pragma Volatile (PRR1_Bits);
   --  Power Reduction USART1
   PRUSART1_Bit             : constant Bit_Number := 0;
   PRUSART1_Mask            : constant Unsigned_8 := 16#01#;
   --  Power Reduction USART2
   PRUSART2_Bit             : constant Bit_Number := 1;
   PRUSART2_Mask            : constant Unsigned_8 := 16#02#;
   --  Power Reduction USART3
   PRUSART3_Bit             : constant Bit_Number := 2;
   PRUSART3_Mask            : constant Unsigned_8 := 16#04#;
   --  Power Reduction Timer/Counter3
   PRTIM3_Bit               : constant Bit_Number := 3;
   PRTIM3_Mask              : constant Unsigned_8 := 16#08#;
   --  Power Reduction Timer/Counter4
   PRTIM4_Bit               : constant Bit_Number := 4;
   PRTIM4_Mask              : constant Unsigned_8 := 16#10#;
   --  Power Reduction Timer/Counter5
   PRTIM5_Bit               : constant Bit_Number := 5;
   PRTIM5_Mask              : constant Unsigned_8 := 16#20#;

   --  Power Reduction Register0
   PRR0_Addr                : constant Address    := 16#64#;
   PRR0                     : Unsigned_8 ;
   for PRR0'Address use PRR0_Addr;
   pragma Volatile (PRR0);
   PRR0_Bits                : Bits_In_Byte;
   for PRR0_Bits'Address use PRR0_Addr;
   pragma Volatile (PRR0_Bits);
   --  Power Reduction ADC
   PRADC_Bit                : constant Bit_Number := 0;
   PRADC_Mask               : constant Unsigned_8 := 16#01#;
   --  Power Reduction USART
   PRUSART0_Bit             : constant Bit_Number := 1;
   PRUSART0_Mask            : constant Unsigned_8 := 16#02#;
   --  Power Reduction Serial Peripheral Interface
   PRSPI_Bit                : constant Bit_Number := 2;
   PRSPI_Mask               : constant Unsigned_8 := 16#04#;
   --  Power Reduction Timer/Counter1
   PRTIM1_Bit               : constant Bit_Number := 3;
   PRTIM1_Mask              : constant Unsigned_8 := 16#08#;
   --  Power Reduction Timer/Counter0
   PRTIM0_Bit               : constant Bit_Number := 5;
   PRTIM0_Mask              : constant Unsigned_8 := 16#20#;
   --  Power Reduction Timer/Counter2
   PRTIM2_Bit               : constant Bit_Number := 6;
   PRTIM2_Mask              : constant Unsigned_8 := 16#40#;
   --  Power Reduction TWI
   PRTWI_Bit                : constant Bit_Number := 7;
   PRTWI_Mask               : constant Unsigned_8 := 16#80#;

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

   --  Extended Indirect Register
   EIND_Addr                : constant Address    := 16#5c#;
   EIND                     : Unsigned_8 ;
   for EIND'Address use EIND_Addr;
   pragma Volatile (EIND);
   EIND_Bits                : Bits_In_Byte;
   for EIND_Bits'Address use EIND_Addr;
   pragma Volatile (EIND_Bits);
   --  Bit 0
   EIND0_Bit                : constant Bit_Number := 0;
   EIND0_Mask               : constant Unsigned_8 := 16#01#;

   --  RAM Page Z Select Register
   RAMPZ_Addr               : constant Address    := 16#5b#;
   RAMPZ                    : Unsigned_8 ;
   for RAMPZ'Address use RAMPZ_Addr;
   pragma Volatile (RAMPZ);
   RAMPZ_Bits               : Bits_In_Byte;
   for RAMPZ_Bits'Address use RAMPZ_Addr;
   pragma Volatile (RAMPZ_Bits);
   --  RAM Page Z Select Register Bit 0
   RAMPZ0_Bit               : constant Bit_Number := 0;
   RAMPZ0_Mask              : constant Unsigned_8 := 16#01#;
   --  RAM Page Z Select Register Bit 1
   RAMPZ1_Bit               : constant Bit_Number := 1;
   RAMPZ1_Mask              : constant Unsigned_8 := 16#02#;

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
   --  Signature Row Read
   SIGRD_Bit                : constant Bit_Number := 5;
   SIGRD_Mask               : constant Unsigned_8 := 16#20#;
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
   --  JTAG Interface Disable
   JTD_Bit                  : constant Bit_Number := 7;
   JTD_Mask                 : constant Unsigned_8 := 16#80#;

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
   --  JTAG Reset Flag
   JTRF_Bit                 : constant Bit_Number := 4;
   JTRF_Mask                : constant Unsigned_8 := 16#10#;

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

   --  On-Chip Debug Related Register in I/O Memory
   OCDR_Addr                : constant Address    := 16#51#;
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

   --  Analog Comparator Control And Status Register
   ACSR_Addr                : constant Address    := 16#50#;
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

   --  General Purpose IO Register 2
   GPIOR2_Addr              : constant Address    := 16#4b#;
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
   GPIOR1_Addr              : constant Address    := 16#4a#;
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

   --  Timer/Counter0 Output Compare Register
   OCR0B_Addr               : constant Address    := 16#48#;
   OCR0B                    : Unsigned_8 ;
   for OCR0B'Address use OCR0B_Addr;
   pragma Volatile (OCR0B);
   OCR0B_Bits               : Bits_In_Byte;
   for OCR0B_Bits'Address use OCR0B_Addr;
   pragma Volatile (OCR0B_Bits);
   OCR0B_0_Bit              : constant Bit_Number := 0;
   OCR0B_0_Mask             : constant Unsigned_8 := 16#01#;
   OCR0B_1_Bit              : constant Bit_Number := 1;
   OCR0B_1_Mask             : constant Unsigned_8 := 16#02#;
   OCR0B_2_Bit              : constant Bit_Number := 2;
   OCR0B_2_Mask             : constant Unsigned_8 := 16#04#;
   OCR0B_3_Bit              : constant Bit_Number := 3;
   OCR0B_3_Mask             : constant Unsigned_8 := 16#08#;
   OCR0B_4_Bit              : constant Bit_Number := 4;
   OCR0B_4_Mask             : constant Unsigned_8 := 16#10#;
   OCR0B_5_Bit              : constant Bit_Number := 5;
   OCR0B_5_Mask             : constant Unsigned_8 := 16#20#;
   OCR0B_6_Bit              : constant Bit_Number := 6;
   OCR0B_6_Mask             : constant Unsigned_8 := 16#40#;
   OCR0B_7_Bit              : constant Bit_Number := 7;
   OCR0B_7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter0 Output Compare Register
   OCR0A_Addr               : constant Address    := 16#47#;
   OCR0A                    : Unsigned_8 ;
   for OCR0A'Address use OCR0A_Addr;
   pragma Volatile (OCR0A);
   OCR0A_Bits               : Bits_In_Byte;
   for OCR0A_Bits'Address use OCR0A_Addr;
   pragma Volatile (OCR0A_Bits);
   OCROA_0_Bit              : constant Bit_Number := 0;
   OCROA_0_Mask             : constant Unsigned_8 := 16#01#;
   OCROA_1_Bit              : constant Bit_Number := 1;
   OCROA_1_Mask             : constant Unsigned_8 := 16#02#;
   OCROA_2_Bit              : constant Bit_Number := 2;
   OCROA_2_Mask             : constant Unsigned_8 := 16#04#;
   OCROA_3_Bit              : constant Bit_Number := 3;
   OCROA_3_Mask             : constant Unsigned_8 := 16#08#;
   OCROA_4_Bit              : constant Bit_Number := 4;
   OCROA_4_Mask             : constant Unsigned_8 := 16#10#;
   OCROA_5_Bit              : constant Bit_Number := 5;
   OCROA_5_Mask             : constant Unsigned_8 := 16#20#;
   OCROA_6_Bit              : constant Bit_Number := 6;
   OCROA_6_Mask             : constant Unsigned_8 := 16#40#;
   OCROA_7_Bit              : constant Bit_Number := 7;
   OCROA_7_Mask             : constant Unsigned_8 := 16#80#;

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
   PSRSYNC_Bit              : constant Bit_Number := 0;
   PSRSYNC_Mask             : constant Unsigned_8 := 16#01#;
   --  Prescaler Reset Timer/Counter2
   PSRASY_Bit               : constant Bit_Number := 1;
   PSRASY_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter Synchronization Mode
   TSM_Bit                  : constant Bit_Number := 7;
   TSM_Mask                 : constant Unsigned_8 := 16#80#;

   --  EEPROM Address Register Low Byte
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

   --  EEPROM Address Register Low Byte
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

   --  Pin Change Interrupt Flag Register
   PCIFR_Addr               : constant Address    := 16#3b#;
   PCIFR                    : Unsigned_8 ;
   for PCIFR'Address use PCIFR_Addr;
   pragma Volatile (PCIFR);
   PCIFR_Bits               : Bits_In_Byte;
   for PCIFR_Bits'Address use PCIFR_Addr;
   pragma Volatile (PCIFR_Bits);
   --  Pin Change Interrupt Flag 0
   PCIF0_Bit                : constant Bit_Number := 0;
   PCIF0_Mask               : constant Unsigned_8 := 16#01#;
   --  Pin Change Interrupt Flag 1
   PCIF1_Bit                : constant Bit_Number := 1;
   PCIF1_Mask               : constant Unsigned_8 := 16#02#;
   --  Pin Change Interrupt Flag 2
   PCIF2_Bit                : constant Bit_Number := 2;
   PCIF2_Mask               : constant Unsigned_8 := 16#04#;

   --  Timer/Counter5 Interrupt Flag register
   TIFR5_Addr               : constant Address    := 16#3a#;
   TIFR5                    : Unsigned_8 ;
   for TIFR5'Address use TIFR5_Addr;
   pragma Volatile (TIFR5);
   TIFR5_Bits               : Bits_In_Byte;
   for TIFR5_Bits'Address use TIFR5_Addr;
   pragma Volatile (TIFR5_Bits);
   --  Timer/Counter5 Overflow Flag
   TOV5_Bit                 : constant Bit_Number := 0;
   TOV5_Mask                : constant Unsigned_8 := 16#01#;
   --  Output Compare Flag 5A
   OCF5A_Bit                : constant Bit_Number := 1;
   OCF5A_Mask               : constant Unsigned_8 := 16#02#;
   --  Output Compare Flag 5B
   OCF5B_Bit                : constant Bit_Number := 2;
   OCF5B_Mask               : constant Unsigned_8 := 16#04#;
   --  Output Compare Flag 5C
   OCF5C_Bit                : constant Bit_Number := 3;
   OCF5C_Mask               : constant Unsigned_8 := 16#08#;
   --  Input Capture Flag 5
   ICF5_Bit                 : constant Bit_Number := 5;
   ICF5_Mask                : constant Unsigned_8 := 16#20#;

   --  Timer/Counter4 Interrupt Flag register
   TIFR4_Addr               : constant Address    := 16#39#;
   TIFR4                    : Unsigned_8 ;
   for TIFR4'Address use TIFR4_Addr;
   pragma Volatile (TIFR4);
   TIFR4_Bits               : Bits_In_Byte;
   for TIFR4_Bits'Address use TIFR4_Addr;
   pragma Volatile (TIFR4_Bits);
   --  Timer/Counter4 Overflow Flag
   TOV4_Bit                 : constant Bit_Number := 0;
   TOV4_Mask                : constant Unsigned_8 := 16#01#;
   --  Output Compare Flag 4A
   OCF4A_Bit                : constant Bit_Number := 1;
   OCF4A_Mask               : constant Unsigned_8 := 16#02#;
   --  Output Compare Flag 4B
   OCF4B_Bit                : constant Bit_Number := 2;
   OCF4B_Mask               : constant Unsigned_8 := 16#04#;
   --  Output Compare Flag 4C
   OCF4C_Bit                : constant Bit_Number := 3;
   OCF4C_Mask               : constant Unsigned_8 := 16#08#;
   --  Input Capture Flag 4
   ICF4_Bit                 : constant Bit_Number := 5;
   ICF4_Mask                : constant Unsigned_8 := 16#20#;

   --  Timer/Counter3 Interrupt Flag register
   TIFR3_Addr               : constant Address    := 16#38#;
   TIFR3                    : Unsigned_8 ;
   for TIFR3'Address use TIFR3_Addr;
   pragma Volatile (TIFR3);
   TIFR3_Bits               : Bits_In_Byte;
   for TIFR3_Bits'Address use TIFR3_Addr;
   pragma Volatile (TIFR3_Bits);
   --  Timer/Counter3 Overflow Flag
   TOV3_Bit                 : constant Bit_Number := 0;
   TOV3_Mask                : constant Unsigned_8 := 16#01#;
   --  Output Compare Flag 3A
   OCF3A_Bit                : constant Bit_Number := 1;
   OCF3A_Mask               : constant Unsigned_8 := 16#02#;
   --  Output Compare Flag 3B
   OCF3B_Bit                : constant Bit_Number := 2;
   OCF3B_Mask               : constant Unsigned_8 := 16#04#;
   --  Output Compare Flag 3C
   OCF3C_Bit                : constant Bit_Number := 3;
   OCF3C_Mask               : constant Unsigned_8 := 16#08#;
   --  Input Capture Flag 3
   ICF3_Bit                 : constant Bit_Number := 5;
   ICF3_Mask                : constant Unsigned_8 := 16#20#;

   --  Timer/Counter Interrupt Flag Register
   TIFR2_Addr               : constant Address    := 16#37#;
   TIFR2                    : Unsigned_8 ;
   for TIFR2'Address use TIFR2_Addr;
   pragma Volatile (TIFR2);
   TIFR2_Bits               : Bits_In_Byte;
   for TIFR2_Bits'Address use TIFR2_Addr;
   pragma Volatile (TIFR2_Bits);
   --  Timer/Counter2 Overflow Flag
   TOV2_Bit                 : constant Bit_Number := 0;
   TOV2_Mask                : constant Unsigned_8 := 16#01#;
   --  Output Compare Flag 2A
   OCF2A_Bit                : constant Bit_Number := 1;
   OCF2A_Mask               : constant Unsigned_8 := 16#02#;
   --  Output Compare Flag 2B
   OCF2B_Bit                : constant Bit_Number := 2;
   OCF2B_Mask               : constant Unsigned_8 := 16#04#;

   --  Timer/Counter1 Interrupt Flag register
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
   --  Output Compare Flag 1C
   OCF1C_Bit                : constant Bit_Number := 3;
   OCF1C_Mask               : constant Unsigned_8 := 16#08#;
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

   --  Data Register, Port G
   PORTG_Addr               : constant Address    := 16#34#;
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
   PORTG5_Bit               : constant Bit_Number := 5;
   PORTG5_Mask              : constant Unsigned_8 := 16#20#;

   --  Data Direction Register, Port G
   DDRG_Addr                : constant Address    := 16#33#;
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
   DDG5_Bit                 : constant Bit_Number := 5;
   DDG5_Mask                : constant Unsigned_8 := 16#20#;

   --  Input Pins, Port G
   PING_Addr                : constant Address    := 16#32#;
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
   PING5_Bit                : constant Bit_Number := 5;
   PING5_Mask               : constant Unsigned_8 := 16#20#;

   --  Data Register, Port F
   PORTF_Addr               : constant Address    := 16#31#;
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
   DDRF_Addr                : constant Address    := 16#30#;
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

   --  Input Pins, Port F
   PINF_Addr                : constant Address    := 16#2f#;
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

   --  Data Register, Port E
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

   --  Port C Data Register
   PORTC_Addr               : constant Address    := 16#28#;
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
   DDRC_Addr                : constant Address    := 16#27#;
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
   PINC_Addr                : constant Address    := 16#26#;
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

   --  Port A Data Register
   PORTA_Addr               : constant Address    := 16#22#;
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
   DDRA_Addr                : constant Address    := 16#21#;
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
   PINA_Addr                : constant Address    := 16#20#;
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



   --
   --  available assembler instructions
   --
   --  type to designate the instruction core of the devices.  See
   --  the help file of Atmel's "AVR Assembler 2".
   type Instruction_Core_Type is (V0, V0E, V1, V2, V2E, V3);
   Instruction_Core  : constant Instruction_Core_Type := V3;
   Have_lpm_rd_Zplus : constant Boolean               := True;
   EEprom_8bit_Addr  : constant Boolean               :=
     (EEprom_Size <= 16#0100#);


end AVR.ATmega640;
