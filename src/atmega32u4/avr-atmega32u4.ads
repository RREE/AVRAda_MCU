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

package AVR.ATmega32U4 is
   pragma Preelaborate;

   CVS_Version : constant String := "$Id$";


   --
   --  memory sizes
   --
   Flash_Size               : constant := 16#8000#;
   Flash_End                : constant := 16#7fff#;
   EEprom_Size              : constant := 16#0400#;
   E2end                    : constant := 16#03ff#;
   Int_SRAM_Start_Addr      : constant := 16#100#;
   Int_SRAM_Size            : constant := 16#a00#;

   --
   --  interrupts
   --
   Number_Of_Interrupts     : constant := 43;

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
   --  Reserved1
   Sig_Reserved1            : constant        :=  5;
   Sig_Reserved1_String     : constant String := "__vector_5";
   --  Reserved2
   Sig_Reserved2            : constant        :=  6;
   Sig_Reserved2_String     : constant String := "__vector_6";
   --  External Interrupt Request 6
   Sig_INT6                 : constant        :=  7;
   Sig_INT6_String          : constant String := "__vector_7";
   --  Reserved3
   Sig_Reserved3            : constant        :=  8;
   Sig_Reserved3_String     : constant String := "__vector_8";
   --  Pin Change Interrupt Request 0
   Sig_PCINT0               : constant        :=  9;
   Sig_PCINT0_String        : constant String := "__vector_9";
   --  USB General Interrupt Request
   Sig_USB_GEN              : constant        := 10;
   Sig_USB_GEN_String       : constant String := "__vector_10";
   --  USB Endpoint/Pipe Interrupt Communication Request
   Sig_USB_COM              : constant        := 11;
   Sig_USB_COM_String       : constant String := "__vector_11";
   --  Watchdog Time-out Interrupt
   Sig_WDT                  : constant        := 12;
   Sig_WDT_String           : constant String := "__vector_12";
   --  Reserved4
   Sig_Reserved4            : constant        := 13;
   Sig_Reserved4_String     : constant String := "__vector_13";
   --  Reserved5
   Sig_Reserved5            : constant        := 14;
   Sig_Reserved5_String     : constant String := "__vector_14";
   --  Reserved6
   Sig_Reserved6            : constant        := 15;
   Sig_Reserved6_String     : constant String := "__vector_15";
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
   --  USART1, Rx Complete
   Sig_USART1_RX            : constant        := 25;
   Sig_USART1_RX_String     : constant String := "__vector_25";
   --  USART1 Data register Empty
   Sig_USART1_UDRE          : constant        := 26;
   Sig_USART1_UDRE_String   : constant String := "__vector_26";
   --  USART1, Tx Complete
   Sig_USART1_TX            : constant        := 27;
   Sig_USART1_TX_String     : constant String := "__vector_27";
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
   --  2-wire Serial Interface
   Sig_TWI                  : constant        := 36;
   Sig_TWI_String           : constant String := "__vector_36";
   --  Store Program Memory Read
   Sig_SPM_READY            : constant        := 37;
   Sig_SPM_READY_String     : constant String := "__vector_37";
   --  Timer/Counter4 Compare Match A
   Sig_TIMER4_COMPA         : constant        := 38;
   Sig_TIMER4_COMPA_String  : constant String := "__vector_38";
   --  Timer/Counter4 Compare Match B
   Sig_TIMER4_COMPB         : constant        := 39;
   Sig_TIMER4_COMPB_String  : constant String := "__vector_39";
   --  Timer/Counter4 Compare Match D
   Sig_TIMER4_COMPD         : constant        := 40;
   Sig_TIMER4_COMPD_String  : constant String := "__vector_40";
   --  Timer/Counter4 Overflow
   Sig_TIMER4_OVF           : constant        := 41;
   Sig_TIMER4_OVF_String    : constant String := "__vector_41";
   --  Timer/Counter4 Fault Protection Interrupt
   Sig_TIMER4_FPF           : constant        := 42;
   Sig_TIMER4_FPF_String    : constant String := "__vector_42";


   --
   --  I/O registers
   --

   --  PLL Status and Control register
   PLLCSR_Addr              : constant Address    := 16#49#;
   PLLCSR                   : Unsigned_8 ;
   for PLLCSR'Address use PLLCSR_Addr;
   pragma Volatile (PLLCSR);
   PLLCSR_Bits              : Bits_In_Byte;
   for PLLCSR_Bits'Address use PLLCSR_Addr;
   pragma Volatile (PLLCSR_Bits);
   --  PLL Lock Status Bit
   PLOCK_Bit                : constant Bit_Number := 0;
   PLOCK_Mask               : constant Unsigned_8 := 16#01#;
   --  PLL Enable Bit
   PLLE_Bit                 : constant Bit_Number := 1;
   PLLE_Mask                : constant Unsigned_8 := 16#02#;
   --  PLL prescaler Bit 2
   PINDIV_Bit               : constant Bit_Number := 4;
   PINDIV_Mask              : constant Unsigned_8 := 16#10#;

   --  PLL Frequency Control Register
   PLLFRQ_Addr              : constant Address    := 16#52#;
   PLLFRQ                   : Unsigned_8 ;
   for PLLFRQ'Address use PLLFRQ_Addr;
   pragma Volatile (PLLFRQ);
   PLLFRQ_Bits              : Bits_In_Byte;
   for PLLFRQ_Bits'Address use PLLFRQ_Addr;
   pragma Volatile (PLLFRQ_Bits);
   PDIV0_Bit                : constant Bit_Number := 0;
   PDIV0_Mask               : constant Unsigned_8 := 16#01#;
   PDIV1_Bit                : constant Bit_Number := 1;
   PDIV1_Mask               : constant Unsigned_8 := 16#02#;
   PDIV2_Bit                : constant Bit_Number := 2;
   PDIV2_Mask               : constant Unsigned_8 := 16#04#;
   PDIV3_Bit                : constant Bit_Number := 3;
   PDIV3_Mask               : constant Unsigned_8 := 16#08#;
   PLLTM0_Bit               : constant Bit_Number := 4;
   PLLTM0_Mask              : constant Unsigned_8 := 16#10#;
   PLLTM1_Bit               : constant Bit_Number := 5;
   PLLTM1_Mask              : constant Unsigned_8 := 16#20#;
   PLLUSB_Bit               : constant Bit_Number := 6;
   PLLUSB_Mask              : constant Unsigned_8 := 16#40#;
   PINMUX_Bit               : constant Bit_Number := 7;
   PINMUX_Mask              : constant Unsigned_8 := 16#80#;

   UEINT_Addr               : constant Address    := 16#f4#;
   UEINT                    : Unsigned_8 ;
   for UEINT'Address use UEINT_Addr;
   pragma Volatile (UEINT);
   UEINT_Bits               : Bits_In_Byte;
   for UEINT_Bits'Address use UEINT_Addr;
   pragma Volatile (UEINT_Bits);
   EPINT0_Bit               : constant Bit_Number := 0;
   EPINT0_Mask              : constant Unsigned_8 := 16#01#;
   EPINT1_Bit               : constant Bit_Number := 1;
   EPINT1_Mask              : constant Unsigned_8 := 16#02#;
   EPINT2_Bit               : constant Bit_Number := 2;
   EPINT2_Mask              : constant Unsigned_8 := 16#04#;
   EPINT3_Bit               : constant Bit_Number := 3;
   EPINT3_Mask              : constant Unsigned_8 := 16#08#;
   EPINT4_Bit               : constant Bit_Number := 4;
   EPINT4_Mask              : constant Unsigned_8 := 16#10#;
   EPINT5_Bit               : constant Bit_Number := 5;
   EPINT5_Mask              : constant Unsigned_8 := 16#20#;
   EPINT6_Bit               : constant Bit_Number := 6;
   EPINT6_Mask              : constant Unsigned_8 := 16#40#;

   UEBCHX_Addr              : constant Address    := 16#f3#;
   UEBCHX                   : Unsigned_8 ;
   for UEBCHX'Address use UEBCHX_Addr;
   pragma Volatile (UEBCHX);
   UEBCHX_Bits              : Bits_In_Byte;
   for UEBCHX_Bits'Address use UEBCHX_Addr;
   pragma Volatile (UEBCHX_Bits);

   UEBCLX_Addr              : constant Address    := 16#f2#;
   UEBCLX                   : Unsigned_8 ;
   for UEBCLX'Address use UEBCLX_Addr;
   pragma Volatile (UEBCLX);
   UEBCLX_Bits              : Bits_In_Byte;
   for UEBCLX_Bits'Address use UEBCLX_Addr;
   pragma Volatile (UEBCLX_Bits);
   BYCT0_Bit                : constant Bit_Number := 0;
   BYCT0_Mask               : constant Unsigned_8 := 16#01#;
   BYCT1_Bit                : constant Bit_Number := 1;
   BYCT1_Mask               : constant Unsigned_8 := 16#02#;
   BYCT2_Bit                : constant Bit_Number := 2;
   BYCT2_Mask               : constant Unsigned_8 := 16#04#;
   BYCT3_Bit                : constant Bit_Number := 3;
   BYCT3_Mask               : constant Unsigned_8 := 16#08#;
   BYCT4_Bit                : constant Bit_Number := 4;
   BYCT4_Mask               : constant Unsigned_8 := 16#10#;
   BYCT5_Bit                : constant Bit_Number := 5;
   BYCT5_Mask               : constant Unsigned_8 := 16#20#;
   BYCT6_Bit                : constant Bit_Number := 6;
   BYCT6_Mask               : constant Unsigned_8 := 16#40#;
   BYCT7_Bit                : constant Bit_Number := 7;
   BYCT7_Mask               : constant Unsigned_8 := 16#80#;

   UEDATX_Addr              : constant Address    := 16#f1#;
   UEDATX                   : Unsigned_8 ;
   for UEDATX'Address use UEDATX_Addr;
   pragma Volatile (UEDATX);
   UEDATX_Bits              : Bits_In_Byte;
   for UEDATX_Bits'Address use UEDATX_Addr;
   pragma Volatile (UEDATX_Bits);
   DAT0_Bit                 : constant Bit_Number := 0;
   DAT0_Mask                : constant Unsigned_8 := 16#01#;
   DAT1_Bit                 : constant Bit_Number := 1;
   DAT1_Mask                : constant Unsigned_8 := 16#02#;
   DAT2_Bit                 : constant Bit_Number := 2;
   DAT2_Mask                : constant Unsigned_8 := 16#04#;
   DAT3_Bit                 : constant Bit_Number := 3;
   DAT3_Mask                : constant Unsigned_8 := 16#08#;
   DAT4_Bit                 : constant Bit_Number := 4;
   DAT4_Mask                : constant Unsigned_8 := 16#10#;
   DAT5_Bit                 : constant Bit_Number := 5;
   DAT5_Mask                : constant Unsigned_8 := 16#20#;
   DAT6_Bit                 : constant Bit_Number := 6;
   DAT6_Mask                : constant Unsigned_8 := 16#40#;
   DAT7_Bit                 : constant Bit_Number := 7;
   DAT7_Mask                : constant Unsigned_8 := 16#80#;

   UEIENX_Addr              : constant Address    := 16#f0#;
   UEIENX                   : Unsigned_8 ;
   for UEIENX'Address use UEIENX_Addr;
   pragma Volatile (UEIENX);
   UEIENX_Bits              : Bits_In_Byte;
   for UEIENX_Bits'Address use UEIENX_Addr;
   pragma Volatile (UEIENX_Bits);
   TXINE_Bit                : constant Bit_Number := 0;
   TXINE_Mask               : constant Unsigned_8 := 16#01#;
   STALLEDE_Bit             : constant Bit_Number := 1;
   STALLEDE_Mask            : constant Unsigned_8 := 16#02#;
   RXOUTE_Bit               : constant Bit_Number := 2;
   RXOUTE_Mask              : constant Unsigned_8 := 16#04#;
   RXSTPE_Bit               : constant Bit_Number := 3;
   RXSTPE_Mask              : constant Unsigned_8 := 16#08#;
   NAKOUTE_Bit              : constant Bit_Number := 4;
   NAKOUTE_Mask             : constant Unsigned_8 := 16#10#;
   NAKINE_Bit               : constant Bit_Number := 6;
   NAKINE_Mask              : constant Unsigned_8 := 16#40#;
   FLERRE_Bit               : constant Bit_Number := 7;
   FLERRE_Mask              : constant Unsigned_8 := 16#80#;

   UESTA1X_Addr             : constant Address    := 16#ef#;
   UESTA1X                  : Unsigned_8 ;
   for UESTA1X'Address use UESTA1X_Addr;
   pragma Volatile (UESTA1X);
   UESTA1X_Bits             : Bits_In_Byte;
   for UESTA1X_Bits'Address use UESTA1X_Addr;
   pragma Volatile (UESTA1X_Bits);
   CURRBK0_Bit              : constant Bit_Number := 0;
   CURRBK0_Mask             : constant Unsigned_8 := 16#01#;
   CURRBK1_Bit              : constant Bit_Number := 1;
   CURRBK1_Mask             : constant Unsigned_8 := 16#02#;
   CTRLDIR_Bit              : constant Bit_Number := 2;
   CTRLDIR_Mask             : constant Unsigned_8 := 16#04#;

   UESTA0X_Addr             : constant Address    := 16#ee#;
   UESTA0X                  : Unsigned_8 ;
   for UESTA0X'Address use UESTA0X_Addr;
   pragma Volatile (UESTA0X);
   UESTA0X_Bits             : Bits_In_Byte;
   for UESTA0X_Bits'Address use UESTA0X_Addr;
   pragma Volatile (UESTA0X_Bits);
   NBUSYBK0_Bit             : constant Bit_Number := 0;
   NBUSYBK0_Mask            : constant Unsigned_8 := 16#01#;
   NBUSYBK1_Bit             : constant Bit_Number := 1;
   NBUSYBK1_Mask            : constant Unsigned_8 := 16#02#;
   DTSEQ0_Bit               : constant Bit_Number := 2;
   DTSEQ0_Mask              : constant Unsigned_8 := 16#04#;
   DTSEQ1_Bit               : constant Bit_Number := 3;
   DTSEQ1_Mask              : constant Unsigned_8 := 16#08#;
   UNDERFI_Bit              : constant Bit_Number := 5;
   UNDERFI_Mask             : constant Unsigned_8 := 16#20#;
   OVERFI_Bit               : constant Bit_Number := 6;
   OVERFI_Mask              : constant Unsigned_8 := 16#40#;
   CFGOK_Bit                : constant Bit_Number := 7;
   CFGOK_Mask               : constant Unsigned_8 := 16#80#;

   UECFG1X_Addr             : constant Address    := 16#ed#;
   UECFG1X                  : Unsigned_8 ;
   for UECFG1X'Address use UECFG1X_Addr;
   pragma Volatile (UECFG1X);
   UECFG1X_Bits             : Bits_In_Byte;
   for UECFG1X_Bits'Address use UECFG1X_Addr;
   pragma Volatile (UECFG1X_Bits);
   ALLOC_Bit                : constant Bit_Number := 1;
   ALLOC_Mask               : constant Unsigned_8 := 16#02#;
   EPBK0_Bit                : constant Bit_Number := 2;
   EPBK0_Mask               : constant Unsigned_8 := 16#04#;
   EPBK1_Bit                : constant Bit_Number := 3;
   EPBK1_Mask               : constant Unsigned_8 := 16#08#;
   EPSIZE0_Bit              : constant Bit_Number := 4;
   EPSIZE0_Mask             : constant Unsigned_8 := 16#10#;
   EPSIZE1_Bit              : constant Bit_Number := 5;
   EPSIZE1_Mask             : constant Unsigned_8 := 16#20#;
   EPSIZE2_Bit              : constant Bit_Number := 6;
   EPSIZE2_Mask             : constant Unsigned_8 := 16#40#;

   UECFG0X_Addr             : constant Address    := 16#ec#;
   UECFG0X                  : Unsigned_8 ;
   for UECFG0X'Address use UECFG0X_Addr;
   pragma Volatile (UECFG0X);
   UECFG0X_Bits             : Bits_In_Byte;
   for UECFG0X_Bits'Address use UECFG0X_Addr;
   pragma Volatile (UECFG0X_Bits);
   EPDIR_Bit                : constant Bit_Number := 0;
   EPDIR_Mask               : constant Unsigned_8 := 16#01#;
   EPTYPE0_Bit              : constant Bit_Number := 6;
   EPTYPE0_Mask             : constant Unsigned_8 := 16#40#;
   EPTYPE1_Bit              : constant Bit_Number := 7;
   EPTYPE1_Mask             : constant Unsigned_8 := 16#80#;

   UECONX_Addr              : constant Address    := 16#eb#;
   UECONX                   : Unsigned_8 ;
   for UECONX'Address use UECONX_Addr;
   pragma Volatile (UECONX);
   UECONX_Bits              : Bits_In_Byte;
   for UECONX_Bits'Address use UECONX_Addr;
   pragma Volatile (UECONX_Bits);
   EPEN_Bit                 : constant Bit_Number := 0;
   EPEN_Mask                : constant Unsigned_8 := 16#01#;
   RSTDT_Bit                : constant Bit_Number := 3;
   RSTDT_Mask               : constant Unsigned_8 := 16#08#;
   STALLRQC_Bit             : constant Bit_Number := 4;
   STALLRQC_Mask            : constant Unsigned_8 := 16#10#;
   STALLRQ_Bit              : constant Bit_Number := 5;
   STALLRQ_Mask             : constant Unsigned_8 := 16#20#;

   UERST_Addr               : constant Address    := 16#ea#;
   UERST                    : Unsigned_8 ;
   for UERST'Address use UERST_Addr;
   pragma Volatile (UERST);
   UERST_Bits               : Bits_In_Byte;
   for UERST_Bits'Address use UERST_Addr;
   pragma Volatile (UERST_Bits);
   EPRST0_Bit               : constant Bit_Number := 0;
   EPRST0_Mask              : constant Unsigned_8 := 16#01#;
   EPRST1_Bit               : constant Bit_Number := 1;
   EPRST1_Mask              : constant Unsigned_8 := 16#02#;
   EPRST2_Bit               : constant Bit_Number := 2;
   EPRST2_Mask              : constant Unsigned_8 := 16#04#;
   EPRST3_Bit               : constant Bit_Number := 3;
   EPRST3_Mask              : constant Unsigned_8 := 16#08#;
   EPRST4_Bit               : constant Bit_Number := 4;
   EPRST4_Mask              : constant Unsigned_8 := 16#10#;
   EPRST5_Bit               : constant Bit_Number := 5;
   EPRST5_Mask              : constant Unsigned_8 := 16#20#;
   EPRST6_Bit               : constant Bit_Number := 6;
   EPRST6_Mask              : constant Unsigned_8 := 16#40#;

   UENUM_Addr               : constant Address    := 16#e9#;
   UENUM                    : Unsigned_8 ;
   for UENUM'Address use UENUM_Addr;
   pragma Volatile (UENUM);
   UENUM_Bits               : Bits_In_Byte;
   for UENUM_Bits'Address use UENUM_Addr;
   pragma Volatile (UENUM_Bits);
   UENUM_0_Bit              : constant Bit_Number := 0;
   UENUM_0_Mask             : constant Unsigned_8 := 16#01#;
   UENUM_1_Bit              : constant Bit_Number := 1;
   UENUM_1_Mask             : constant Unsigned_8 := 16#02#;
   UENUM_2_Bit              : constant Bit_Number := 2;
   UENUM_2_Mask             : constant Unsigned_8 := 16#04#;

   UEINTX_Addr              : constant Address    := 16#e8#;
   UEINTX                   : Unsigned_8 ;
   for UEINTX'Address use UEINTX_Addr;
   pragma Volatile (UEINTX);
   UEINTX_Bits              : Bits_In_Byte;
   for UEINTX_Bits'Address use UEINTX_Addr;
   pragma Volatile (UEINTX_Bits);
   TXINI_Bit                : constant Bit_Number := 0;
   TXINI_Mask               : constant Unsigned_8 := 16#01#;
   STALLEDI_Bit             : constant Bit_Number := 1;
   STALLEDI_Mask            : constant Unsigned_8 := 16#02#;
   RXOUTI_Bit               : constant Bit_Number := 2;
   RXOUTI_Mask              : constant Unsigned_8 := 16#04#;
   RXSTPI_Bit               : constant Bit_Number := 3;
   RXSTPI_Mask              : constant Unsigned_8 := 16#08#;
   NAKOUTI_Bit              : constant Bit_Number := 4;
   NAKOUTI_Mask             : constant Unsigned_8 := 16#10#;
   RWAL_Bit                 : constant Bit_Number := 5;
   RWAL_Mask                : constant Unsigned_8 := 16#20#;
   NAKINI_Bit               : constant Bit_Number := 6;
   NAKINI_Mask              : constant Unsigned_8 := 16#40#;
   FIFOCON_Bit              : constant Bit_Number := 7;
   FIFOCON_Mask             : constant Unsigned_8 := 16#80#;

   UDMFN_Addr               : constant Address    := 16#e6#;
   UDMFN                    : Unsigned_8 ;
   for UDMFN'Address use UDMFN_Addr;
   pragma Volatile (UDMFN);
   UDMFN_Bits               : Bits_In_Byte;
   for UDMFN_Bits'Address use UDMFN_Addr;
   pragma Volatile (UDMFN_Bits);
   FNCERR_Bit               : constant Bit_Number := 4;
   FNCERR_Mask              : constant Unsigned_8 := 16#10#;

   UDFNUMH_Addr             : constant Address    := 16#e5#;
   UDFNUMH                  : Unsigned_8 ;
   for UDFNUMH'Address use UDFNUMH_Addr;
   pragma Volatile (UDFNUMH);
   UDFNUMH_Bits             : Bits_In_Byte;
   for UDFNUMH_Bits'Address use UDFNUMH_Addr;
   pragma Volatile (UDFNUMH_Bits);
   FNUM8_Bit                : constant Bit_Number := 0;
   FNUM8_Mask               : constant Unsigned_8 := 16#01#;
   FNUM9_Bit                : constant Bit_Number := 1;
   FNUM9_Mask               : constant Unsigned_8 := 16#02#;
   FNUM10_Bit               : constant Bit_Number := 2;
   FNUM10_Mask              : constant Unsigned_8 := 16#04#;

   UDFNUML_Addr             : constant Address    := 16#e4#;
   UDFNUM                   : Unsigned_16;
   for UDFNUM'Address use UDFNUML_Addr;
   pragma Volatile (UDFNUM);
   UDFNUML                  : Unsigned_8 ;
   for UDFNUML'Address use UDFNUML_Addr;
   pragma Volatile (UDFNUML);
   UDFNUML_Bits             : Bits_In_Byte;
   for UDFNUML_Bits'Address use UDFNUML_Addr;
   pragma Volatile (UDFNUML_Bits);
   FNUM0_Bit                : constant Bit_Number := 0;
   FNUM0_Mask               : constant Unsigned_8 := 16#01#;
   FNUM1_Bit                : constant Bit_Number := 1;
   FNUM1_Mask               : constant Unsigned_8 := 16#02#;
   FNUM2_Bit                : constant Bit_Number := 2;
   FNUM2_Mask               : constant Unsigned_8 := 16#04#;
   FNUM3_Bit                : constant Bit_Number := 3;
   FNUM3_Mask               : constant Unsigned_8 := 16#08#;
   FNUM4_Bit                : constant Bit_Number := 4;
   FNUM4_Mask               : constant Unsigned_8 := 16#10#;
   FNUM5_Bit                : constant Bit_Number := 5;
   FNUM5_Mask               : constant Unsigned_8 := 16#20#;
   FNUM6_Bit                : constant Bit_Number := 6;
   FNUM6_Mask               : constant Unsigned_8 := 16#40#;
   FNUM7_Bit                : constant Bit_Number := 7;
   FNUM7_Mask               : constant Unsigned_8 := 16#80#;

   UDADDR_Addr              : constant Address    := 16#e3#;
   UDADDR                   : Unsigned_8 ;
   for UDADDR'Address use UDADDR_Addr;
   pragma Volatile (UDADDR);
   UDADDR_Bits              : Bits_In_Byte;
   for UDADDR_Bits'Address use UDADDR_Addr;
   pragma Volatile (UDADDR_Bits);
   UADD0_Bit                : constant Bit_Number := 0;
   UADD0_Mask               : constant Unsigned_8 := 16#01#;
   UADD1_Bit                : constant Bit_Number := 1;
   UADD1_Mask               : constant Unsigned_8 := 16#02#;
   UADD2_Bit                : constant Bit_Number := 2;
   UADD2_Mask               : constant Unsigned_8 := 16#04#;
   UADD3_Bit                : constant Bit_Number := 3;
   UADD3_Mask               : constant Unsigned_8 := 16#08#;
   UADD4_Bit                : constant Bit_Number := 4;
   UADD4_Mask               : constant Unsigned_8 := 16#10#;
   UADD5_Bit                : constant Bit_Number := 5;
   UADD5_Mask               : constant Unsigned_8 := 16#20#;
   UADD6_Bit                : constant Bit_Number := 6;
   UADD6_Mask               : constant Unsigned_8 := 16#40#;
   ADDEN_Bit                : constant Bit_Number := 7;
   ADDEN_Mask               : constant Unsigned_8 := 16#80#;

   UDIEN_Addr               : constant Address    := 16#e2#;
   UDIEN                    : Unsigned_8 ;
   for UDIEN'Address use UDIEN_Addr;
   pragma Volatile (UDIEN);
   UDIEN_Bits               : Bits_In_Byte;
   for UDIEN_Bits'Address use UDIEN_Addr;
   pragma Volatile (UDIEN_Bits);
   SUSPE_Bit                : constant Bit_Number := 0;
   SUSPE_Mask               : constant Unsigned_8 := 16#01#;
   SOFE_Bit                 : constant Bit_Number := 2;
   SOFE_Mask                : constant Unsigned_8 := 16#04#;
   EORSTE_Bit               : constant Bit_Number := 3;
   EORSTE_Mask              : constant Unsigned_8 := 16#08#;
   WAKEUPE_Bit              : constant Bit_Number := 4;
   WAKEUPE_Mask             : constant Unsigned_8 := 16#10#;
   EORSME_Bit               : constant Bit_Number := 5;
   EORSME_Mask              : constant Unsigned_8 := 16#20#;
   UPRSME_Bit               : constant Bit_Number := 6;
   UPRSME_Mask              : constant Unsigned_8 := 16#40#;

   UDINT_Addr               : constant Address    := 16#e1#;
   UDINT                    : Unsigned_8 ;
   for UDINT'Address use UDINT_Addr;
   pragma Volatile (UDINT);
   UDINT_Bits               : Bits_In_Byte;
   for UDINT_Bits'Address use UDINT_Addr;
   pragma Volatile (UDINT_Bits);
   SUSPI_Bit                : constant Bit_Number := 0;
   SUSPI_Mask               : constant Unsigned_8 := 16#01#;
   SOFI_Bit                 : constant Bit_Number := 2;
   SOFI_Mask                : constant Unsigned_8 := 16#04#;
   EORSTI_Bit               : constant Bit_Number := 3;
   EORSTI_Mask              : constant Unsigned_8 := 16#08#;
   WAKEUPI_Bit              : constant Bit_Number := 4;
   WAKEUPI_Mask             : constant Unsigned_8 := 16#10#;
   EORSMI_Bit               : constant Bit_Number := 5;
   EORSMI_Mask              : constant Unsigned_8 := 16#20#;
   UPRSMI_Bit               : constant Bit_Number := 6;
   UPRSMI_Mask              : constant Unsigned_8 := 16#40#;

   UDCON_Addr               : constant Address    := 16#e0#;
   UDCON                    : Unsigned_8 ;
   for UDCON'Address use UDCON_Addr;
   pragma Volatile (UDCON);
   UDCON_Bits               : Bits_In_Byte;
   for UDCON_Bits'Address use UDCON_Addr;
   pragma Volatile (UDCON_Bits);
   DETACH_Bit               : constant Bit_Number := 0;
   DETACH_Mask              : constant Unsigned_8 := 16#01#;
   RMWKUP_Bit               : constant Bit_Number := 1;
   RMWKUP_Mask              : constant Unsigned_8 := 16#02#;
   --  USB low speed mode
   LSM_Bit                  : constant Bit_Number := 2;
   LSM_Mask                 : constant Unsigned_8 := 16#04#;
   RSTCPU_Bit               : constant Bit_Number := 3;
   RSTCPU_Mask              : constant Unsigned_8 := 16#08#;

   USBINT_Addr              : constant Address    := 16#da#;
   USBINT                   : Unsigned_8 ;
   for USBINT'Address use USBINT_Addr;
   pragma Volatile (USBINT);
   USBINT_Bits              : Bits_In_Byte;
   for USBINT_Bits'Address use USBINT_Addr;
   pragma Volatile (USBINT_Bits);
   VBUSTI_Bit               : constant Bit_Number := 0;
   VBUSTI_Mask              : constant Unsigned_8 := 16#01#;

   USBSTA_Addr              : constant Address    := 16#d9#;
   USBSTA                   : Unsigned_8 ;
   for USBSTA'Address use USBSTA_Addr;
   pragma Volatile (USBSTA);
   USBSTA_Bits              : Bits_In_Byte;
   for USBSTA_Bits'Address use USBSTA_Addr;
   pragma Volatile (USBSTA_Bits);
   VBUS_Bit                 : constant Bit_Number := 0;
   VBUS_Mask                : constant Unsigned_8 := 16#01#;
   SPEED_Bit                : constant Bit_Number := 3;
   SPEED_Mask               : constant Unsigned_8 := 16#08#;

   --  USB General Control Register
   USBCON_Addr              : constant Address    := 16#d8#;
   USBCON                   : Unsigned_8 ;
   for USBCON'Address use USBCON_Addr;
   pragma Volatile (USBCON);
   USBCON_Bits              : Bits_In_Byte;
   for USBCON_Bits'Address use USBCON_Addr;
   pragma Volatile (USBCON_Bits);
   VBUSTE_Bit               : constant Bit_Number := 0;
   VBUSTE_Mask              : constant Unsigned_8 := 16#01#;
   OTGPADE_Bit              : constant Bit_Number := 4;
   OTGPADE_Mask             : constant Unsigned_8 := 16#10#;
   FRZCLK_Bit               : constant Bit_Number := 5;
   FRZCLK_Mask              : constant Unsigned_8 := 16#20#;
   USBE_Bit                 : constant Bit_Number := 7;
   USBE_Mask                : constant Unsigned_8 := 16#80#;

   UHWCON_Addr              : constant Address    := 16#d7#;
   UHWCON                   : Unsigned_8 ;
   for UHWCON'Address use UHWCON_Addr;
   pragma Volatile (UHWCON);
   UHWCON_Bits              : Bits_In_Byte;
   for UHWCON_Bits'Address use UHWCON_Addr;
   pragma Volatile (UHWCON_Bits);
   UVREGE_Bit               : constant Bit_Number := 0;
   UVREGE_Mask              : constant Unsigned_8 := 16#01#;

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
   --  USART Baud Rate Register bit 8
   UBRR_8_Bit               : constant Bit_Number := 0;
   UBRR_8_Mask              : constant Unsigned_8 := 16#01#;
   --  USART Baud Rate Register bit 9
   UBRR_9_Bit               : constant Bit_Number := 1;
   UBRR_9_Mask              : constant Unsigned_8 := 16#02#;
   --  USART Baud Rate Register bit 10
   UBRR_10_Bit              : constant Bit_Number := 2;
   UBRR_10_Mask             : constant Unsigned_8 := 16#04#;
   --  USART Baud Rate Register bit 11
   UBRR_11_Bit              : constant Bit_Number := 3;
   UBRR_11_Mask             : constant Unsigned_8 := 16#08#;

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
   --  USART Baud Rate Register bit 0
   UBRR_0_Bit               : constant Bit_Number := 0;
   UBRR_0_Mask              : constant Unsigned_8 := 16#01#;
   --  USART Baud Rate Register bit 1
   UBRR_1_Bit               : constant Bit_Number := 1;
   UBRR_1_Mask              : constant Unsigned_8 := 16#02#;
   --  USART Baud Rate Register bit 2
   UBRR_2_Bit               : constant Bit_Number := 2;
   UBRR_2_Mask              : constant Unsigned_8 := 16#04#;
   --  USART Baud Rate Register bit 3
   UBRR_3_Bit               : constant Bit_Number := 3;
   UBRR_3_Mask              : constant Unsigned_8 := 16#08#;
   --  USART Baud Rate Register bit 4
   UBRR_4_Bit               : constant Bit_Number := 4;
   UBRR_4_Mask              : constant Unsigned_8 := 16#10#;
   --  USART Baud Rate Register bit 5
   UBRR_5_Bit               : constant Bit_Number := 5;
   UBRR_5_Mask              : constant Unsigned_8 := 16#20#;
   --  USART Baud Rate Register bit 6
   UBRR_6_Bit               : constant Bit_Number := 6;
   UBRR_6_Mask              : constant Unsigned_8 := 16#40#;
   --  USART Baud Rate Register bit 7
   UBRR_7_Bit               : constant Bit_Number := 7;
   UBRR_7_Mask              : constant Unsigned_8 := 16#80#;

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

   --  Timer/Counter3 Output Compare Register A High Byte
   OCR3AH_Addr              : constant Address    := 16#99#;
   OCR3AH                   : Unsigned_8 ;
   for OCR3AH'Address use OCR3AH_Addr;
   pragma Volatile (OCR3AH);
   OCR3AH_Bits              : Bits_In_Byte;
   for OCR3AH_Bits'Address use OCR3AH_Addr;
   pragma Volatile (OCR3AH_Bits);
   --  Timer/Counter3 Output Compare Register High Byte bit 0
   OCR3AH0_Bit              : constant Bit_Number := 0;
   OCR3AH0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter3 Output Compare Register High Byte bit 1
   OCR3AH1_Bit              : constant Bit_Number := 1;
   OCR3AH1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter3 Output Compare Register High Byte bit 2
   OCR3AH2_Bit              : constant Bit_Number := 2;
   OCR3AH2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter3 Output Compare Register High Byte bit 3
   OCR3AH3_Bit              : constant Bit_Number := 3;
   OCR3AH3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter3 Output Compare Register High Byte bit 4
   OCR3AH4_Bit              : constant Bit_Number := 4;
   OCR3AH4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter3 Output Compare Register High Byte bit 5
   OCR3AH5_Bit              : constant Bit_Number := 5;
   OCR3AH5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter3 Output Compare Register High Byte bit 6
   OCR3AH6_Bit              : constant Bit_Number := 6;
   OCR3AH6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter3 Output Compare Register High Byte bit 7
   OCR3AH7_Bit              : constant Bit_Number := 7;
   OCR3AH7_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter3 Output Compare Register A Low Byte
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
   --  Timer/Counter3 Output Compare Register Low Byte Bit 0
   OCR3AL0_Bit              : constant Bit_Number := 0;
   OCR3AL0_Mask             : constant Unsigned_8 := 16#01#;
   --  Timer/Counter3 Output Compare Register Low Byte Bit 1
   OCR3AL1_Bit              : constant Bit_Number := 1;
   OCR3AL1_Mask             : constant Unsigned_8 := 16#02#;
   --  Timer/Counter3 Output Compare Register Low Byte Bit 2
   OCR3AL2_Bit              : constant Bit_Number := 2;
   OCR3AL2_Mask             : constant Unsigned_8 := 16#04#;
   --  Timer/Counter3 Output Compare Register Low Byte Bit 3
   OCR3AL3_Bit              : constant Bit_Number := 3;
   OCR3AL3_Mask             : constant Unsigned_8 := 16#08#;
   --  Timer/Counter3 Output Compare Register Low Byte Bit 4
   OCR3AL4_Bit              : constant Bit_Number := 4;
   OCR3AL4_Mask             : constant Unsigned_8 := 16#10#;
   --  Timer/Counter3 Output Compare Register Low Byte Bit 5
   OCR3AL5_Bit              : constant Bit_Number := 5;
   OCR3AL5_Mask             : constant Unsigned_8 := 16#20#;
   --  Timer/Counter3 Output Compare Register Low Byte Bit 6
   OCR3AL6_Bit              : constant Bit_Number := 6;
   OCR3AL6_Mask             : constant Unsigned_8 := 16#40#;
   --  Timer/Counter3 Output Compare Register Low Byte Bit 7
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

   --  Timer/Counter1 Output Compare Register A High Byte
   OCR1AH_Addr              : constant Address    := 16#89#;
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

   --  Digital Input Disable Register 1
   DIDR0_Addr               : constant Address    := 16#7e#;
   DIDR0                    : Unsigned_8 ;
   for DIDR0'Address use DIDR0_Addr;
   pragma Volatile (DIDR0);
   DIDR0_Bits               : Bits_In_Byte;
   for DIDR0_Bits'Address use DIDR0_Addr;
   pragma Volatile (DIDR0_Bits);
   --  ADC0 Digital input Disable
   ADC0D_Bit                : constant Bit_Number := 0;
   ADC0D_Mask               : constant Unsigned_8 := 16#01#;
   --  ADC1 Digital input Disable
   ADC1D_Bit                : constant Bit_Number := 1;
   ADC1D_Mask               : constant Unsigned_8 := 16#02#;
   --  ADC2 Digital input Disable
   ADC2D_Bit                : constant Bit_Number := 2;
   ADC2D_Mask               : constant Unsigned_8 := 16#04#;
   --  ADC3 Digital input Disable
   ADC3D_Bit                : constant Bit_Number := 3;
   ADC3D_Mask               : constant Unsigned_8 := 16#08#;
   --  ADC4 Digital input Disable
   ADC4D_Bit                : constant Bit_Number := 4;
   ADC4D_Mask               : constant Unsigned_8 := 16#10#;
   --  ADC5 Digital input Disable
   ADC5D_Bit                : constant Bit_Number := 5;
   ADC5D_Mask               : constant Unsigned_8 := 16#20#;
   --  ADC6 Digital input Disable
   ADC6D_Bit                : constant Bit_Number := 6;
   ADC6D_Mask               : constant Unsigned_8 := 16#40#;
   --  ADC7 Digital input Disable
   ADC7D_Bit                : constant Bit_Number := 7;
   ADC7D_Mask               : constant Unsigned_8 := 16#80#;

   --  Digital Input Disable Register 1
   DIDR2_Addr               : constant Address    := 16#7d#;
   DIDR2                    : Unsigned_8 ;
   for DIDR2'Address use DIDR2_Addr;
   pragma Volatile (DIDR2);
   DIDR2_Bits               : Bits_In_Byte;
   for DIDR2_Bits'Address use DIDR2_Addr;
   pragma Volatile (DIDR2_Bits);
   --  ADC8 Digital input Disable
   ADC8D_Bit                : constant Bit_Number := 0;
   ADC8D_Mask               : constant Unsigned_8 := 16#01#;
   --  ADC9 Digital input Disable
   ADC9D_Bit                : constant Bit_Number := 1;
   ADC9D_Mask               : constant Unsigned_8 := 16#02#;
   --  ADC10 Digital input Disable
   ADC10D_Bit               : constant Bit_Number := 2;
   ADC10D_Mask              : constant Unsigned_8 := 16#04#;
   --  ADC11 Digital input Disable
   ADC11D_Bit               : constant Bit_Number := 3;
   ADC11D_Mask              : constant Unsigned_8 := 16#08#;
   --  ADC12 Digital input Disable
   ADC12D_Bit               : constant Bit_Number := 4;
   ADC12D_Mask              : constant Unsigned_8 := 16#10#;
   --  ADC13 Digital input Disable
   ADC13D_Bit               : constant Bit_Number := 5;
   ADC13D_Mask              : constant Unsigned_8 := 16#20#;

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
   --  ADC Auto Trigger Source 0
   ADTS0_Bit                : constant Bit_Number := 0;
   ADTS0_Mask               : constant Unsigned_8 := 16#01#;
   --  ADC Auto Trigger Source 1
   ADTS1_Bit                : constant Bit_Number := 1;
   ADTS1_Mask               : constant Unsigned_8 := 16#02#;
   --  ADC Auto Trigger Source 2
   ADTS2_Bit                : constant Bit_Number := 2;
   ADTS2_Mask               : constant Unsigned_8 := 16#04#;
   --  ADC Auto Trigger Source 3
   ADTS3_Bit                : constant Bit_Number := 4;
   ADTS3_Mask               : constant Unsigned_8 := 16#10#;
   --  Analog Channel and Gain Selection Bits
   MUX5_Bit                 : constant Bit_Number := 5;
   MUX5_Mask                : constant Unsigned_8 := 16#20#;
   --  Analog Comparator Multiplexer Enable
   ACME_Bit                 : constant Bit_Number := 6;
   ACME_Mask                : constant Unsigned_8 := 16#40#;
   --  ADC High Speed Mode
   ADHSM_Bit                : constant Bit_Number := 7;
   ADHSM_Mask               : constant Unsigned_8 := 16#80#;

   --  The ADC Control and Status register
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

   --  Timer/Counter4 Interrupt Mask Register
   TIMSK4_Addr              : constant Address    := 16#72#;
   TIMSK4                   : Unsigned_8 ;
   for TIMSK4'Address use TIMSK4_Addr;
   pragma Volatile (TIMSK4);
   TIMSK4_Bits              : Bits_In_Byte;
   for TIMSK4_Bits'Address use TIMSK4_Addr;
   pragma Volatile (TIMSK4_Bits);
   --  Timer/Counter4 Overflow Interrupt Enable
   TOIE4_Bit                : constant Bit_Number := 2;
   TOIE4_Mask               : constant Unsigned_8 := 16#04#;
   --  Timer/Counter4 Output Compare B Match Interrupt Enable
   OCIE4B_Bit               : constant Bit_Number := 5;
   OCIE4B_Mask              : constant Unsigned_8 := 16#20#;
   --  Timer/Counter4 Output Compare A Match Interrupt Enable
   OCIE4A_Bit               : constant Bit_Number := 6;
   OCIE4A_Mask              : constant Unsigned_8 := 16#40#;
   --  Timer/Counter4 Output Compare D Match Interrupt Enable
   OCIE4D_Bit               : constant Bit_Number := 7;
   OCIE4D_Mask              : constant Unsigned_8 := 16#80#;

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

   --  Oscillator Control Register
   RCCTRL_Addr              : constant Address    := 16#67#;
   RCCTRL                   : Unsigned_8 ;
   for RCCTRL'Address use RCCTRL_Addr;
   pragma Volatile (RCCTRL);
   RCCTRL_Bits              : Bits_In_Byte;
   for RCCTRL_Bits'Address use RCCTRL_Addr;
   pragma Volatile (RCCTRL_Bits);
   RCFREQ_Bit               : constant Bit_Number := 0;
   RCFREQ_Mask              : constant Unsigned_8 := 16#01#;

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
   --  Power Reduction Timer/Counter3
   PRTIM3_Bit               : constant Bit_Number := 3;
   PRTIM3_Mask              : constant Unsigned_8 := 16#08#;
   --  Power Reduction USB
   PRUSB_Bit                : constant Bit_Number := 7;
   PRUSB_Mask               : constant Unsigned_8 := 16#80#;

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

   --  Timer/Counter4 Interrupt Flag register
   TIFR4_Addr               : constant Address    := 16#39#;
   TIFR4                    : Unsigned_8 ;
   for TIFR4'Address use TIFR4_Addr;
   pragma Volatile (TIFR4);
   TIFR4_Bits               : Bits_In_Byte;
   for TIFR4_Bits'Address use TIFR4_Addr;
   pragma Volatile (TIFR4_Bits);
   --  Timer/Counter4 Overflow Flag
   TOV4_Bit                 : constant Bit_Number := 2;
   TOV4_Mask                : constant Unsigned_8 := 16#04#;
   --  Output Compare Flag 4B
   OCF4B_Bit                : constant Bit_Number := 5;
   OCF4B_Mask               : constant Unsigned_8 := 16#20#;
   --  Output Compare Flag 4A
   OCF4A_Bit                : constant Bit_Number := 6;
   OCF4A_Mask               : constant Unsigned_8 := 16#40#;
   --  Output Compare Flag 4D
   OCF4D_Bit                : constant Bit_Number := 7;
   OCF4D_Mask               : constant Unsigned_8 := 16#80#;

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

   TIFR2_Addr               : constant Address    := 16#37#;
   TIFR2                    : Unsigned_8 ;
   for TIFR2'Address use TIFR2_Addr;
   pragma Volatile (TIFR2);
   TIFR2_Bits               : Bits_In_Byte;
   for TIFR2_Bits'Address use TIFR2_Addr;
   pragma Volatile (TIFR2_Bits);

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
   PORTE2_Bit               : constant Bit_Number := 2;
   PORTE2_Mask              : constant Unsigned_8 := 16#04#;
   PORTE6_Bit               : constant Bit_Number := 6;
   PORTE6_Mask              : constant Unsigned_8 := 16#40#;

   --  Data Direction Register, Port E
   DDRE_Addr                : constant Address    := 16#2d#;
   DDRE                     : Unsigned_8 ;
   for DDRE'Address use DDRE_Addr;
   pragma Volatile (DDRE);
   DDRE_Bits                : Bits_In_Byte;
   for DDRE_Bits'Address use DDRE_Addr;
   pragma Volatile (DDRE_Bits);
   DDE2_Bit                 : constant Bit_Number := 2;
   DDE2_Mask                : constant Unsigned_8 := 16#04#;
   DDE6_Bit                 : constant Bit_Number := 6;
   DDE6_Mask                : constant Unsigned_8 := 16#40#;

   --  Input Pins, Port E
   PINE_Addr                : constant Address    := 16#2c#;
   PINE                     : Unsigned_8 ;
   for PINE'Address use PINE_Addr;
   pragma Volatile (PINE);
   PINE_Bits                : Bits_In_Byte;
   for PINE_Bits'Address use PINE_Addr;
   pragma Volatile (PINE_Bits);
   PINE2_Bit                : constant Bit_Number := 2;
   PINE2_Mask               : constant Unsigned_8 := 16#04#;
   PINE6_Bit                : constant Bit_Number := 6;
   PINE6_Mask               : constant Unsigned_8 := 16#40#;

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

   --  Timer/Counter 4 Dead Time Value
   DT4_Addr                 : constant Address    := 16#d4#;
   DT4                      : Unsigned_8 ;
   for DT4'Address use DT4_Addr;
   pragma Volatile (DT4);
   DT4_Bits                 : Bits_In_Byte;
   for DT4_Bits'Address use DT4_Addr;
   pragma Volatile (DT4_Bits);
   --  Timer/Counter 4 Dead Time Value Bit 0
   DT4L0_Bit                : constant Bit_Number := 0;
   DT4L0_Mask               : constant Unsigned_8 := 16#01#;
   --  Timer/Counter 4 Dead Time Value Bit 1
   DT4L1_Bit                : constant Bit_Number := 1;
   DT4L1_Mask               : constant Unsigned_8 := 16#02#;
   --  Timer/Counter 4 Dead Time Value Bit 2
   DT4L2_Bit                : constant Bit_Number := 2;
   DT4L2_Mask               : constant Unsigned_8 := 16#04#;
   --  Timer/Counter 4 Dead Time Value Bit 3
   DT4L3_Bit                : constant Bit_Number := 3;
   DT4L3_Mask               : constant Unsigned_8 := 16#08#;
   --  Timer/Counter 4 Dead Time Value Bit 4
   DT4L4_Bit                : constant Bit_Number := 4;
   DT4L4_Mask               : constant Unsigned_8 := 16#10#;
   --  Timer/Counter 4 Dead Time Value Bit 5
   DT4L5_Bit                : constant Bit_Number := 5;
   DT4L5_Mask               : constant Unsigned_8 := 16#20#;
   --  Timer/Counter 4 Dead Time Value Bit 6
   DT4L6_Bit                : constant Bit_Number := 6;
   DT4L6_Mask               : constant Unsigned_8 := 16#40#;
   --  Timer/Counter 4 Dead Time Value Bit 7
   DT4L7_Bit                : constant Bit_Number := 7;
   DT4L7_Mask               : constant Unsigned_8 := 16#80#;

   --  Timer/Counter4 Output Compare Register D
   OCR4D_Addr               : constant Address    := 16#d2#;
   OCR4D                    : Unsigned_8 ;
   for OCR4D'Address use OCR4D_Addr;
   pragma Volatile (OCR4D);
   OCR4D_Bits               : Bits_In_Byte;
   for OCR4D_Bits'Address use OCR4D_Addr;
   pragma Volatile (OCR4D_Bits);
   --  Timer/Counter4 Output Compare Register Low Byte bit 0
   OCR4D0_Bit               : constant Bit_Number := 0;
   OCR4D0_Mask              : constant Unsigned_8 := 16#01#;
   --  Timer/Counter4 Output Compare Register Low Byte bit 1
   OCR4D1_Bit               : constant Bit_Number := 1;
   OCR4D1_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter4 Output Compare Register Low Byte bit 2
   OCR4D2_Bit               : constant Bit_Number := 2;
   OCR4D2_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter4 Output Compare Register Low Byte bit 3
   OCR4D3_Bit               : constant Bit_Number := 3;
   OCR4D3_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter4 Output Compare Register Low Byte bit 4
   OCR4D4_Bit               : constant Bit_Number := 4;
   OCR4D4_Mask              : constant Unsigned_8 := 16#10#;
   --  Timer/Counter4 Output Compare Register Low Byte bit 5
   OCR4D5_Bit               : constant Bit_Number := 5;
   OCR4D5_Mask              : constant Unsigned_8 := 16#20#;
   --  Timer/Counter4 Output Compare Register Low Byte bit 6
   OCR4D6_Bit               : constant Bit_Number := 6;
   OCR4D6_Mask              : constant Unsigned_8 := 16#40#;
   --  Timer/Counter4 Output Compare Register Low Byte bit 7
   OCR4D7_Bit               : constant Bit_Number := 7;
   OCR4D7_Mask              : constant Unsigned_8 := 16#80#;

   --  Timer/Counter4 Output Compare Register C
   OCR4C_Addr               : constant Address    := 16#d1#;
   OCR4C                    : Unsigned_8 ;
   for OCR4C'Address use OCR4C_Addr;
   pragma Volatile (OCR4C);
   OCR4C_Bits               : Bits_In_Byte;
   for OCR4C_Bits'Address use OCR4C_Addr;
   pragma Volatile (OCR4C_Bits);
   --  Timer/Counter4 Output Compare Register bit 0
   OCR4C0_Bit               : constant Bit_Number := 0;
   OCR4C0_Mask              : constant Unsigned_8 := 16#01#;
   --  Timer/Counter4 Output Compare Register bit 1
   OCR4C1_Bit               : constant Bit_Number := 1;
   OCR4C1_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter4 Output Compare Register bit 2
   OCR4C2_Bit               : constant Bit_Number := 2;
   OCR4C2_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter4 Output Compare Register bit 3
   OCR4C3_Bit               : constant Bit_Number := 3;
   OCR4C3_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter4 Output Compare Register bit 4
   OCR4C4_Bit               : constant Bit_Number := 4;
   OCR4C4_Mask              : constant Unsigned_8 := 16#10#;
   --  Timer/Counter4 Output Compare Register bit 5
   OCR4C5_Bit               : constant Bit_Number := 5;
   OCR4C5_Mask              : constant Unsigned_8 := 16#20#;
   --  Timer/Counter4 Output Compare Register 6
   OCR4C6_Bit               : constant Bit_Number := 6;
   OCR4C6_Mask              : constant Unsigned_8 := 16#40#;
   --  Timer/Counter4 Output Compare Register bit 7
   OCR4C7_Bit               : constant Bit_Number := 7;
   OCR4C7_Mask              : constant Unsigned_8 := 16#80#;

   --  Timer/Counter4 Output Compare Register B
   OCR4B_Addr               : constant Address    := 16#d0#;
   OCR4B                    : Unsigned_8 ;
   for OCR4B'Address use OCR4B_Addr;
   pragma Volatile (OCR4B);
   OCR4B_Bits               : Bits_In_Byte;
   for OCR4B_Bits'Address use OCR4B_Addr;
   pragma Volatile (OCR4B_Bits);
   --  Timer/Counter4 Output Compare Register bit 0
   OCR4B0_Bit               : constant Bit_Number := 0;
   OCR4B0_Mask              : constant Unsigned_8 := 16#01#;
   --  Timer/Counter4 Output Compare Register bit 1
   OCR4B1_Bit               : constant Bit_Number := 1;
   OCR4B1_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter4 Output Compare Register bit 2
   OCR4B2_Bit               : constant Bit_Number := 2;
   OCR4B2_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter4 Output Compare Register bit 3
   OCR4B3_Bit               : constant Bit_Number := 3;
   OCR4B3_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter4 Output Compare Register bit 4
   OCR4B4_Bit               : constant Bit_Number := 4;
   OCR4B4_Mask              : constant Unsigned_8 := 16#10#;
   --  Timer/Counter4 Output Compare Register bit 5
   OCR4B5_Bit               : constant Bit_Number := 5;
   OCR4B5_Mask              : constant Unsigned_8 := 16#20#;
   --  Timer/Counter4 Output Compare Register bit 6
   OCR4B6_Bit               : constant Bit_Number := 6;
   OCR4B6_Mask              : constant Unsigned_8 := 16#40#;
   --  Timer/Counter4 Output Compare Register bit 7
   OCR4B7_Bit               : constant Bit_Number := 7;
   OCR4B7_Mask              : constant Unsigned_8 := 16#80#;

   --  Timer/Counter4 Output Compare Register A
   OCR4A_Addr               : constant Address    := 16#cf#;
   OCR4A                    : Unsigned_8 ;
   for OCR4A'Address use OCR4A_Addr;
   pragma Volatile (OCR4A);
   OCR4A_Bits               : Bits_In_Byte;
   for OCR4A_Bits'Address use OCR4A_Addr;
   pragma Volatile (OCR4A_Bits);
   --  Timer/Counter4 Output Compare Register Bit 0
   OCR4A0_Bit               : constant Bit_Number := 0;
   OCR4A0_Mask              : constant Unsigned_8 := 16#01#;
   --  Timer/Counter4 Output Compare Register Bit 1
   OCR4A1_Bit               : constant Bit_Number := 1;
   OCR4A1_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter4 Output Compare Register Low Byte Bit 2
   OCR4A2_Bit               : constant Bit_Number := 2;
   OCR4A2_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter4 Output Compare Register Low Byte Bit 3
   OCR4A3_Bit               : constant Bit_Number := 3;
   OCR4A3_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter4 Output Compare Register Bit 4
   OCR4A4_Bit               : constant Bit_Number := 4;
   OCR4A4_Mask              : constant Unsigned_8 := 16#10#;
   --  Timer/Counter4 Output Compare Register Bit 5
   OCR4A5_Bit               : constant Bit_Number := 5;
   OCR4A5_Mask              : constant Unsigned_8 := 16#20#;
   --  Timer/Counter4 Output Compare Register Bit 6
   OCR4A6_Bit               : constant Bit_Number := 6;
   OCR4A6_Mask              : constant Unsigned_8 := 16#40#;
   --  Timer/Counter4 Output Compare Register Bit 7
   OCR4A7_Bit               : constant Bit_Number := 7;
   OCR4A7_Mask              : constant Unsigned_8 := 16#80#;

   --  Timer/Counter 4 Control Register E
   TCCR4E_Addr              : constant Address    := 16#c4#;
   TCCR4E                   : Unsigned_8 ;
   for TCCR4E'Address use TCCR4E_Addr;
   pragma Volatile (TCCR4E);
   TCCR4E_Bits              : Bits_In_Byte;
   for TCCR4E_Bits'Address use TCCR4E_Addr;
   pragma Volatile (TCCR4E_Bits);
   --  Output Compare Override Enable bit
   OC4OE0_Bit               : constant Bit_Number := 0;
   OC4OE0_Mask              : constant Unsigned_8 := 16#01#;
   --  Output Compare Override Enable bit
   OC4OE1_Bit               : constant Bit_Number := 1;
   OC4OE1_Mask              : constant Unsigned_8 := 16#02#;
   --  Output Compare Override Enable bit
   OC4OE2_Bit               : constant Bit_Number := 2;
   OC4OE2_Mask              : constant Unsigned_8 := 16#04#;
   --  Output Compare Override Enable bit
   OC4OE3_Bit               : constant Bit_Number := 3;
   OC4OE3_Mask              : constant Unsigned_8 := 16#08#;
   --  Output Compare Override Enable bit
   OC4OE4_Bit               : constant Bit_Number := 4;
   OC4OE4_Mask              : constant Unsigned_8 := 16#10#;
   --  Output Compare Override Enable bit
   OC4OE5_Bit               : constant Bit_Number := 5;
   OC4OE5_Mask              : constant Unsigned_8 := 16#20#;
   --  Enhanced Compare/PWM Mode
   ENHC4_Bit                : constant Bit_Number := 6;
   ENHC4_Mask               : constant Unsigned_8 := 16#40#;
   --  Register Update Lock
   TLOCK4_Bit               : constant Bit_Number := 7;
   TLOCK4_Mask              : constant Unsigned_8 := 16#80#;

   --  Timer/Counter 4 Control Register D
   TCCR4D_Addr              : constant Address    := 16#c3#;
   TCCR4D                   : Unsigned_8 ;
   for TCCR4D'Address use TCCR4D_Addr;
   pragma Volatile (TCCR4D);
   TCCR4D_Bits              : Bits_In_Byte;
   for TCCR4D_Bits'Address use TCCR4D_Addr;
   pragma Volatile (TCCR4D_Bits);
   --  Waveform Generation Mode bits
   WGM40_Bit                : constant Bit_Number := 0;
   WGM40_Mask               : constant Unsigned_8 := 16#01#;
   --  Waveform Generation Mode bits
   WGM41_Bit                : constant Bit_Number := 1;
   WGM41_Mask               : constant Unsigned_8 := 16#02#;
   --  Fault Protection Interrupt Flag
   FPF4_Bit                 : constant Bit_Number := 2;
   FPF4_Mask                : constant Unsigned_8 := 16#04#;
   --  Fault Protection Analog Comparator Enable
   FPAC4_Bit                : constant Bit_Number := 3;
   FPAC4_Mask               : constant Unsigned_8 := 16#08#;
   --  Fault Protection Edge Select
   FPES4_Bit                : constant Bit_Number := 4;
   FPES4_Mask               : constant Unsigned_8 := 16#10#;
   --  Fault Protection Noise Canceler
   FPNC4_Bit                : constant Bit_Number := 5;
   FPNC4_Mask               : constant Unsigned_8 := 16#20#;
   --  Fault Protection Mode Enable
   FPEN4_Bit                : constant Bit_Number := 6;
   FPEN4_Mask               : constant Unsigned_8 := 16#40#;
   --  Fault Protection Interrupt Enable
   FPIE4_Bit                : constant Bit_Number := 7;
   FPIE4_Mask               : constant Unsigned_8 := 16#80#;

   --  Timer/Counter 4 Control Register C
   TCCR4C_Addr              : constant Address    := 16#c2#;
   TCCR4C                   : Unsigned_8 ;
   for TCCR4C'Address use TCCR4C_Addr;
   pragma Volatile (TCCR4C);
   TCCR4C_Bits              : Bits_In_Byte;
   for TCCR4C_Bits'Address use TCCR4C_Addr;
   pragma Volatile (TCCR4C_Bits);
   --  Pulse Width Modulator D Enable
   PWM4D_Bit                : constant Bit_Number := 0;
   PWM4D_Mask               : constant Unsigned_8 := 16#01#;
   --  Force Output Compare Match 4D
   FOC4D_Bit                : constant Bit_Number := 1;
   FOC4D_Mask               : constant Unsigned_8 := 16#02#;
   --  Comparator D Output Mode
   COM4D0_Bit               : constant Bit_Number := 2;
   COM4D0_Mask              : constant Unsigned_8 := 16#04#;
   --  Comparator D Output Mode
   COM4D1_Bit               : constant Bit_Number := 3;
   COM4D1_Mask              : constant Unsigned_8 := 16#08#;
   --  Comparator B Output Mode
   COM4B0S_Bit              : constant Bit_Number := 4;
   COM4B0S_Mask             : constant Unsigned_8 := 16#10#;
   --  Comparator B Output Mode
   COM4B1S_Bit              : constant Bit_Number := 5;
   COM4B1S_Mask             : constant Unsigned_8 := 16#20#;
   --  Comparator A Output Mode
   COM4A0S_Bit              : constant Bit_Number := 6;
   COM4A0S_Mask             : constant Unsigned_8 := 16#40#;
   --  Comparator A Output Mode
   COM4A1S_Bit              : constant Bit_Number := 7;
   COM4A1S_Mask             : constant Unsigned_8 := 16#80#;

   --  Timer/Counter4 Control Register B
   TCCR4B_Addr              : constant Address    := 16#c1#;
   TCCR4B                   : Unsigned_8 ;
   for TCCR4B'Address use TCCR4B_Addr;
   pragma Volatile (TCCR4B);
   TCCR4B_Bits              : Bits_In_Byte;
   for TCCR4B_Bits'Address use TCCR4B_Addr;
   pragma Volatile (TCCR4B_Bits);
   --  Clock Select Bit 0
   CS40_Bit                 : constant Bit_Number := 0;
   CS40_Mask                : constant Unsigned_8 := 16#01#;
   --  Clock Select Bit 1
   CS41_Bit                 : constant Bit_Number := 1;
   CS41_Mask                : constant Unsigned_8 := 16#02#;
   --  Clock Select Bit 2
   CS42_Bit                 : constant Bit_Number := 2;
   CS42_Mask                : constant Unsigned_8 := 16#04#;
   --  Clock Select Bit 3
   CS43_Bit                 : constant Bit_Number := 3;
   CS43_Mask                : constant Unsigned_8 := 16#08#;
   --  Dead Time Prescaler Bit 0
   DTPS40_Bit               : constant Bit_Number := 4;
   DTPS40_Mask              : constant Unsigned_8 := 16#10#;
   --  Dead Time Prescaler Bit 1
   DTPS41_Bit               : constant Bit_Number := 5;
   DTPS41_Mask              : constant Unsigned_8 := 16#20#;
   --  Prescaler Reset Timer/Counter 4
   PSR4_Bit                 : constant Bit_Number := 6;
   PSR4_Mask                : constant Unsigned_8 := 16#40#;
   --  PWM Inversion Mode
   PWM4X_Bit                : constant Bit_Number := 7;
   PWM4X_Mask               : constant Unsigned_8 := 16#80#;

   --  Timer/Counter4 Control Register A
   TCCR4A_Addr              : constant Address    := 16#c0#;
   TCCR4A                   : Unsigned_8 ;
   for TCCR4A'Address use TCCR4A_Addr;
   pragma Volatile (TCCR4A);
   TCCR4A_Bits              : Bits_In_Byte;
   for TCCR4A_Bits'Address use TCCR4A_Addr;
   pragma Volatile (TCCR4A_Bits);
   PWM4B_Bit                : constant Bit_Number := 0;
   PWM4B_Mask               : constant Unsigned_8 := 16#01#;
   PWM4A_Bit                : constant Bit_Number := 1;
   PWM4A_Mask               : constant Unsigned_8 := 16#02#;
   --  Force Output Compare Match 4B
   FOC4B_Bit                : constant Bit_Number := 2;
   FOC4B_Mask               : constant Unsigned_8 := 16#04#;
   --  Force Output Compare Match 4A
   FOC4A_Bit                : constant Bit_Number := 3;
   FOC4A_Mask               : constant Unsigned_8 := 16#08#;
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

   --  Timer/Counter4
   TC4H_Addr                : constant Address    := 16#bf#;
   TC4H                     : Unsigned_8 ;
   for TC4H'Address use TC4H_Addr;
   pragma Volatile (TC4H);
   TC4H_Bits                : Bits_In_Byte;
   for TC4H_Bits'Address use TC4H_Addr;
   pragma Volatile (TC4H_Bits);
   --  Timer/Counter4 bit 8
   TC48_Bit                 : constant Bit_Number := 0;
   TC48_Mask                : constant Unsigned_8 := 16#01#;
   --  Timer/Counter4 bit 9
   TC49_Bit                 : constant Bit_Number := 1;
   TC49_Mask                : constant Unsigned_8 := 16#02#;
   --  Timer/Counter4 bit 10
   TC410_Bit                : constant Bit_Number := 2;
   TC410_Mask               : constant Unsigned_8 := 16#04#;

   --  Timer/Counter4 Low Bytes
   TCNT4_Addr               : constant Address    := 16#be#;
   TCNT4                    : Unsigned_8 ;
   for TCNT4'Address use TCNT4_Addr;
   pragma Volatile (TCNT4);
   TCNT4_Bits               : Bits_In_Byte;
   for TCNT4_Bits'Address use TCNT4_Addr;
   pragma Volatile (TCNT4_Bits);
   --  Timer/Counter4 bit 0
   TC40_Bit                 : constant Bit_Number := 0;
   TC40_Mask                : constant Unsigned_8 := 16#01#;
   --  Timer/Counter4 bit 1
   TC41_Bit                 : constant Bit_Number := 1;
   TC41_Mask                : constant Unsigned_8 := 16#02#;
   --  Timer/Counter4 bit 2
   TC42_Bit                 : constant Bit_Number := 2;
   TC42_Mask                : constant Unsigned_8 := 16#04#;
   --  Timer/Counter4  bit 3
   TC43_Bit                 : constant Bit_Number := 3;
   TC43_Mask                : constant Unsigned_8 := 16#08#;
   --  Timer/Counter4 bit 4
   TC44_Bit                 : constant Bit_Number := 4;
   TC44_Mask                : constant Unsigned_8 := 16#10#;
   --  Timer/Counter4 bit 5
   TC45_Bit                 : constant Bit_Number := 5;
   TC45_Mask                : constant Unsigned_8 := 16#20#;
   --  Timer/Counter4 bit 6
   TC46_Bit                 : constant Bit_Number := 6;
   TC46_Mask                : constant Unsigned_8 := 16#40#;
   --  Timer/Counter4 bit 7
   TC47_Bit                 : constant Bit_Number := 7;
   TC47_Mask                : constant Unsigned_8 := 16#80#;

   CLKSEL1_Addr             : constant Address    := 16#c6#;
   CLKSEL1                  : Unsigned_8 ;
   for CLKSEL1'Address use CLKSEL1_Addr;
   pragma Volatile (CLKSEL1);
   CLKSEL1_Bits             : Bits_In_Byte;
   for CLKSEL1_Bits'Address use CLKSEL1_Addr;
   pragma Volatile (CLKSEL1_Bits);
   EXCKSEL0_Bit             : constant Bit_Number := 0;
   EXCKSEL0_Mask            : constant Unsigned_8 := 16#01#;
   EXCKSEL1_Bit             : constant Bit_Number := 1;
   EXCKSEL1_Mask            : constant Unsigned_8 := 16#02#;
   EXCKSEL2_Bit             : constant Bit_Number := 2;
   EXCKSEL2_Mask            : constant Unsigned_8 := 16#04#;
   EXCKSEL3_Bit             : constant Bit_Number := 3;
   EXCKSEL3_Mask            : constant Unsigned_8 := 16#08#;
   RCCKSEL0_Bit             : constant Bit_Number := 4;
   RCCKSEL0_Mask            : constant Unsigned_8 := 16#10#;
   RCCKSEL1_Bit             : constant Bit_Number := 5;
   RCCKSEL1_Mask            : constant Unsigned_8 := 16#20#;
   RCCKSEL2_Bit             : constant Bit_Number := 6;
   RCCKSEL2_Mask            : constant Unsigned_8 := 16#40#;
   RCCKSEL3_Bit             : constant Bit_Number := 7;
   RCCKSEL3_Mask            : constant Unsigned_8 := 16#80#;

   CLKSEL0_Addr             : constant Address    := 16#c5#;
   CLKSEL0                  : Unsigned_8 ;
   for CLKSEL0'Address use CLKSEL0_Addr;
   pragma Volatile (CLKSEL0);
   CLKSEL0_Bits             : Bits_In_Byte;
   for CLKSEL0_Bits'Address use CLKSEL0_Addr;
   pragma Volatile (CLKSEL0_Bits);
   CLKS_Bit                 : constant Bit_Number := 0;
   CLKS_Mask                : constant Unsigned_8 := 16#01#;
   EXTE_Bit                 : constant Bit_Number := 2;
   EXTE_Mask                : constant Unsigned_8 := 16#04#;
   RCE_Bit                  : constant Bit_Number := 3;
   RCE_Mask                 : constant Unsigned_8 := 16#08#;
   EXSUT0_Bit               : constant Bit_Number := 4;
   EXSUT0_Mask              : constant Unsigned_8 := 16#10#;
   EXSUT1_Bit               : constant Bit_Number := 5;
   EXSUT1_Mask              : constant Unsigned_8 := 16#20#;
   RCSUT0_Bit               : constant Bit_Number := 6;
   RCSUT0_Mask              : constant Unsigned_8 := 16#40#;
   RCSUT1_Bit               : constant Bit_Number := 7;
   RCSUT1_Mask              : constant Unsigned_8 := 16#80#;

   CLKSTA_Addr              : constant Address    := 16#c7#;
   CLKSTA                   : Unsigned_8 ;
   for CLKSTA'Address use CLKSTA_Addr;
   pragma Volatile (CLKSTA);
   CLKSTA_Bits              : Bits_In_Byte;
   for CLKSTA_Bits'Address use CLKSTA_Addr;
   pragma Volatile (CLKSTA_Bits);
   EXTON_Bit                : constant Bit_Number := 0;
   EXTON_Mask               : constant Unsigned_8 := 16#01#;
   RCON_Bit                 : constant Bit_Number := 1;
   RCON_Mask                : constant Unsigned_8 := 16#02#;



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


end AVR.ATmega32U4;
