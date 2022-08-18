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

package AVR.ATmega169 is
   pragma Preelaborate;

   CVS_Version : constant String := "$Id: avr-atmega169.ads 881 2008-11-16 22:55:31Z Rolf_Ebert $";


   --
   --  memory sizes
   --
   Flash_Size               : constant := 16#4000#;
   Flash_End                : constant := 16#3fff#;
   EEprom_Size              : constant := 16#0200#;
   E2end                    : constant := 16#01ff#;
   Int_SRAM_Start_Addr      : constant := 16#100#;
   Int_SRAM_Size            : constant := 16#400#;

   --
   --  interrupts
   --
   Number_Of_Interrupts     : constant := 23;

   --  External Pin,Power-on Reset,Brown-out Reset,Watchdog Reset,and JTAG
   --    AVR Reset. See Datasheet.
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
   --  Timer/Counter Compare Match B
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
   --  SPI Serial Transfer Complete
   Sig_SPI_STC              : constant        := 12;
   Sig_SPI_STC_String       : constant String := "__vector_12";
   --  USART0, Rx Complete
   Sig_USART0_RX            : constant        := 13;
   Sig_USART0_RX_String     : constant String := "__vector_13";
   --  USART0 Data register Empty
   Sig_USART0_UDRE          : constant        := 14;
   Sig_USART0_UDRE_String   : constant String := "__vector_14";
   --  USART0, Tx Complete
   Sig_USART0_TX            : constant        := 15;
   Sig_USART0_TX_String     : constant String := "__vector_15";
   --  USI Start Condition
   Sig_USI_START            : constant        := 16;
   Sig_USI_START_String     : constant String := "__vector_16";
   --  USI Overflow
   Sig_USI_OVERFLOW         : constant        := 17;
   Sig_USI_OVERFLOW_String  : constant String := "__vector_17";
   --  Analog Comparator
   Sig_ANALOG_COMP          : constant        := 18;
   Sig_ANALOG_COMP_String   : constant String := "__vector_18";
   --  ADC Conversion Complete
   Sig_ADC                  : constant        := 19;
   Sig_ADC_String           : constant String := "__vector_19";
   --  EEPROM Ready
   Sig_EE_READY             : constant        := 20;
   Sig_EE_READY_String      : constant String := "__vector_20";
   --  Store Program Memory Read
   Sig_SPM_READY            : constant        := 21;
   Sig_SPM_READY_String     : constant String := "__vector_21";
   --  LCD Start of Frame
   Sig_LCD                  : constant        := 22;
   Sig_LCD_String           : constant String := "__vector_22";


   --
   --  I/O registers
   --

   --  LCD Data Register 18
   LCDDR18_Addr             : constant Address    := 16#fe#;
   LCDDR18                  : Unsigned_8 ;
   for LCDDR18'Address use LCDDR18_Addr;
   pragma Volatile (LCDDR18);
   LCDDR18_Bits             : Bits_In_Byte;
   for LCDDR18_Bits'Address use LCDDR18_Addr;
   pragma Volatile (LCDDR18_Bits);
   SEG324_Bit               : constant Bit_Number := 0;
   SEG324_Mask              : constant Unsigned_8 := 16#01#;

   --  LCD Data Register 17
   LCDDR17_Addr             : constant Address    := 16#fd#;
   LCDDR17                  : Unsigned_8 ;
   for LCDDR17'Address use LCDDR17_Addr;
   pragma Volatile (LCDDR17);
   LCDDR17_Bits             : Bits_In_Byte;
   for LCDDR17_Bits'Address use LCDDR17_Addr;
   pragma Volatile (LCDDR17_Bits);
   SEG316_Bit               : constant Bit_Number := 0;
   SEG316_Mask              : constant Unsigned_8 := 16#01#;
   SEG317_Bit               : constant Bit_Number := 1;
   SEG317_Mask              : constant Unsigned_8 := 16#02#;
   SEG318_Bit               : constant Bit_Number := 2;
   SEG318_Mask              : constant Unsigned_8 := 16#04#;
   SEG319_Bit               : constant Bit_Number := 3;
   SEG319_Mask              : constant Unsigned_8 := 16#08#;
   SEG320_Bit               : constant Bit_Number := 4;
   SEG320_Mask              : constant Unsigned_8 := 16#10#;
   SEG321_Bit               : constant Bit_Number := 5;
   SEG321_Mask              : constant Unsigned_8 := 16#20#;
   SEG322_Bit               : constant Bit_Number := 6;
   SEG322_Mask              : constant Unsigned_8 := 16#40#;
   SEG323_Bit               : constant Bit_Number := 7;
   SEG323_Mask              : constant Unsigned_8 := 16#80#;

   --  LCD Data Register 16
   LCDDR16_Addr             : constant Address    := 16#fc#;
   LCDDR16                  : Unsigned_8 ;
   for LCDDR16'Address use LCDDR16_Addr;
   pragma Volatile (LCDDR16);
   LCDDR16_Bits             : Bits_In_Byte;
   for LCDDR16_Bits'Address use LCDDR16_Addr;
   pragma Volatile (LCDDR16_Bits);
   SEG308_Bit               : constant Bit_Number := 0;
   SEG308_Mask              : constant Unsigned_8 := 16#01#;
   SEG309_Bit               : constant Bit_Number := 1;
   SEG309_Mask              : constant Unsigned_8 := 16#02#;
   SEG310_Bit               : constant Bit_Number := 2;
   SEG310_Mask              : constant Unsigned_8 := 16#04#;
   SEG311_Bit               : constant Bit_Number := 3;
   SEG311_Mask              : constant Unsigned_8 := 16#08#;
   SEG312_Bit               : constant Bit_Number := 4;
   SEG312_Mask              : constant Unsigned_8 := 16#10#;
   SEG313_Bit               : constant Bit_Number := 5;
   SEG313_Mask              : constant Unsigned_8 := 16#20#;
   SEG314_Bit               : constant Bit_Number := 6;
   SEG314_Mask              : constant Unsigned_8 := 16#40#;
   SEG315_Bit               : constant Bit_Number := 7;
   SEG315_Mask              : constant Unsigned_8 := 16#80#;

   --  LCD Data Register 15
   LCDDR15_Addr             : constant Address    := 16#fb#;
   LCDDR15                  : Unsigned_8 ;
   for LCDDR15'Address use LCDDR15_Addr;
   pragma Volatile (LCDDR15);
   LCDDR15_Bits             : Bits_In_Byte;
   for LCDDR15_Bits'Address use LCDDR15_Addr;
   pragma Volatile (LCDDR15_Bits);
   SEG300_Bit               : constant Bit_Number := 0;
   SEG300_Mask              : constant Unsigned_8 := 16#01#;
   SEG301_Bit               : constant Bit_Number := 1;
   SEG301_Mask              : constant Unsigned_8 := 16#02#;
   SEG302_Bit               : constant Bit_Number := 2;
   SEG302_Mask              : constant Unsigned_8 := 16#04#;
   SEG303_Bit               : constant Bit_Number := 3;
   SEG303_Mask              : constant Unsigned_8 := 16#08#;
   SEG304_Bit               : constant Bit_Number := 4;
   SEG304_Mask              : constant Unsigned_8 := 16#10#;
   SEG305_Bit               : constant Bit_Number := 5;
   SEG305_Mask              : constant Unsigned_8 := 16#20#;
   SEG306_Bit               : constant Bit_Number := 6;
   SEG306_Mask              : constant Unsigned_8 := 16#40#;
   SEG307_Bit               : constant Bit_Number := 7;
   SEG307_Mask              : constant Unsigned_8 := 16#80#;

   --  LCD Data Register 13
   LCDDR13_Addr             : constant Address    := 16#f9#;
   LCDDR13                  : Unsigned_8 ;
   for LCDDR13'Address use LCDDR13_Addr;
   pragma Volatile (LCDDR13);
   LCDDR13_Bits             : Bits_In_Byte;
   for LCDDR13_Bits'Address use LCDDR13_Addr;
   pragma Volatile (LCDDR13_Bits);
   SEG224_Bit               : constant Bit_Number := 0;
   SEG224_Mask              : constant Unsigned_8 := 16#01#;

   --  LCD Data Register 12
   LCDDR12_Addr             : constant Address    := 16#f8#;
   LCDDR12                  : Unsigned_8 ;
   for LCDDR12'Address use LCDDR12_Addr;
   pragma Volatile (LCDDR12);
   LCDDR12_Bits             : Bits_In_Byte;
   for LCDDR12_Bits'Address use LCDDR12_Addr;
   pragma Volatile (LCDDR12_Bits);
   SEG216_Bit               : constant Bit_Number := 0;
   SEG216_Mask              : constant Unsigned_8 := 16#01#;
   SEG217_Bit               : constant Bit_Number := 1;
   SEG217_Mask              : constant Unsigned_8 := 16#02#;
   SEG218_Bit               : constant Bit_Number := 2;
   SEG218_Mask              : constant Unsigned_8 := 16#04#;
   SEG219_Bit               : constant Bit_Number := 3;
   SEG219_Mask              : constant Unsigned_8 := 16#08#;
   SEG220_Bit               : constant Bit_Number := 4;
   SEG220_Mask              : constant Unsigned_8 := 16#10#;
   SEG221_Bit               : constant Bit_Number := 5;
   SEG221_Mask              : constant Unsigned_8 := 16#20#;
   SEG222_Bit               : constant Bit_Number := 6;
   SEG222_Mask              : constant Unsigned_8 := 16#40#;
   SEG223_Bit               : constant Bit_Number := 7;
   SEG223_Mask              : constant Unsigned_8 := 16#80#;

   --  LCD Data Register 11
   LCDDR11_Addr             : constant Address    := 16#f7#;
   LCDDR11                  : Unsigned_8 ;
   for LCDDR11'Address use LCDDR11_Addr;
   pragma Volatile (LCDDR11);
   LCDDR11_Bits             : Bits_In_Byte;
   for LCDDR11_Bits'Address use LCDDR11_Addr;
   pragma Volatile (LCDDR11_Bits);
   SEG208_Bit               : constant Bit_Number := 0;
   SEG208_Mask              : constant Unsigned_8 := 16#01#;
   SEG209_Bit               : constant Bit_Number := 1;
   SEG209_Mask              : constant Unsigned_8 := 16#02#;
   SEG210_Bit               : constant Bit_Number := 2;
   SEG210_Mask              : constant Unsigned_8 := 16#04#;
   SEG211_Bit               : constant Bit_Number := 3;
   SEG211_Mask              : constant Unsigned_8 := 16#08#;
   SEG212_Bit               : constant Bit_Number := 4;
   SEG212_Mask              : constant Unsigned_8 := 16#10#;
   SEG213_Bit               : constant Bit_Number := 5;
   SEG213_Mask              : constant Unsigned_8 := 16#20#;
   SEG214_Bit               : constant Bit_Number := 6;
   SEG214_Mask              : constant Unsigned_8 := 16#40#;
   SEG215_Bit               : constant Bit_Number := 7;
   SEG215_Mask              : constant Unsigned_8 := 16#80#;

   --  LCD Data Register 10
   LCDDR10_Addr             : constant Address    := 16#f6#;
   LCDDR10                  : Unsigned_8 ;
   for LCDDR10'Address use LCDDR10_Addr;
   pragma Volatile (LCDDR10);
   LCDDR10_Bits             : Bits_In_Byte;
   for LCDDR10_Bits'Address use LCDDR10_Addr;
   pragma Volatile (LCDDR10_Bits);
   SEG200_Bit               : constant Bit_Number := 0;
   SEG200_Mask              : constant Unsigned_8 := 16#01#;
   SEG201_Bit               : constant Bit_Number := 1;
   SEG201_Mask              : constant Unsigned_8 := 16#02#;
   SEG202_Bit               : constant Bit_Number := 2;
   SEG202_Mask              : constant Unsigned_8 := 16#04#;
   SEG203_Bit               : constant Bit_Number := 3;
   SEG203_Mask              : constant Unsigned_8 := 16#08#;
   SEG204_Bit               : constant Bit_Number := 4;
   SEG204_Mask              : constant Unsigned_8 := 16#10#;
   SEG205_Bit               : constant Bit_Number := 5;
   SEG205_Mask              : constant Unsigned_8 := 16#20#;
   SEG206_Bit               : constant Bit_Number := 6;
   SEG206_Mask              : constant Unsigned_8 := 16#40#;
   SEG207_Bit               : constant Bit_Number := 7;
   SEG207_Mask              : constant Unsigned_8 := 16#80#;

   --  LCD Data Register 8
   LCDDR8_Addr              : constant Address    := 16#f4#;
   LCDDR8                   : Unsigned_8 ;
   for LCDDR8'Address use LCDDR8_Addr;
   pragma Volatile (LCDDR8);
   LCDDR8_Bits              : Bits_In_Byte;
   for LCDDR8_Bits'Address use LCDDR8_Addr;
   pragma Volatile (LCDDR8_Bits);
   SEG124_Bit               : constant Bit_Number := 0;
   SEG124_Mask              : constant Unsigned_8 := 16#01#;

   --  LCD Data Register 7
   LCDDR7_Addr              : constant Address    := 16#f3#;
   LCDDR7                   : Unsigned_8 ;
   for LCDDR7'Address use LCDDR7_Addr;
   pragma Volatile (LCDDR7);
   LCDDR7_Bits              : Bits_In_Byte;
   for LCDDR7_Bits'Address use LCDDR7_Addr;
   pragma Volatile (LCDDR7_Bits);
   SEG116_Bit               : constant Bit_Number := 0;
   SEG116_Mask              : constant Unsigned_8 := 16#01#;
   SEG117_Bit               : constant Bit_Number := 1;
   SEG117_Mask              : constant Unsigned_8 := 16#02#;
   SEG118_Bit               : constant Bit_Number := 2;
   SEG118_Mask              : constant Unsigned_8 := 16#04#;
   SEG119_Bit               : constant Bit_Number := 3;
   SEG119_Mask              : constant Unsigned_8 := 16#08#;
   SEG120_Bit               : constant Bit_Number := 4;
   SEG120_Mask              : constant Unsigned_8 := 16#10#;
   SEG121_Bit               : constant Bit_Number := 5;
   SEG121_Mask              : constant Unsigned_8 := 16#20#;
   SEG122_Bit               : constant Bit_Number := 6;
   SEG122_Mask              : constant Unsigned_8 := 16#40#;
   SEG123_Bit               : constant Bit_Number := 7;
   SEG123_Mask              : constant Unsigned_8 := 16#80#;

   --  LCD Data Register 6
   LCDDR6_Addr              : constant Address    := 16#f2#;
   LCDDR6                   : Unsigned_8 ;
   for LCDDR6'Address use LCDDR6_Addr;
   pragma Volatile (LCDDR6);
   LCDDR6_Bits              : Bits_In_Byte;
   for LCDDR6_Bits'Address use LCDDR6_Addr;
   pragma Volatile (LCDDR6_Bits);
   SEG108_Bit               : constant Bit_Number := 0;
   SEG108_Mask              : constant Unsigned_8 := 16#01#;
   SEG109_Bit               : constant Bit_Number := 1;
   SEG109_Mask              : constant Unsigned_8 := 16#02#;
   SEG110_Bit               : constant Bit_Number := 2;
   SEG110_Mask              : constant Unsigned_8 := 16#04#;
   SEG111_Bit               : constant Bit_Number := 3;
   SEG111_Mask              : constant Unsigned_8 := 16#08#;
   SEG112_Bit               : constant Bit_Number := 4;
   SEG112_Mask              : constant Unsigned_8 := 16#10#;
   SEG113_Bit               : constant Bit_Number := 5;
   SEG113_Mask              : constant Unsigned_8 := 16#20#;
   SEG114_Bit               : constant Bit_Number := 6;
   SEG114_Mask              : constant Unsigned_8 := 16#40#;
   SEG115_Bit               : constant Bit_Number := 7;
   SEG115_Mask              : constant Unsigned_8 := 16#80#;

   --  LCD Data Register 5
   LCDDR5_Addr              : constant Address    := 16#f1#;
   LCDDR5                   : Unsigned_8 ;
   for LCDDR5'Address use LCDDR5_Addr;
   pragma Volatile (LCDDR5);
   LCDDR5_Bits              : Bits_In_Byte;
   for LCDDR5_Bits'Address use LCDDR5_Addr;
   pragma Volatile (LCDDR5_Bits);
   SEG100_Bit               : constant Bit_Number := 0;
   SEG100_Mask              : constant Unsigned_8 := 16#01#;
   SEG101_Bit               : constant Bit_Number := 1;
   SEG101_Mask              : constant Unsigned_8 := 16#02#;
   SEG102_Bit               : constant Bit_Number := 2;
   SEG102_Mask              : constant Unsigned_8 := 16#04#;
   SEG103_Bit               : constant Bit_Number := 3;
   SEG103_Mask              : constant Unsigned_8 := 16#08#;
   SEG104_Bit               : constant Bit_Number := 4;
   SEG104_Mask              : constant Unsigned_8 := 16#10#;
   SEG105_Bit               : constant Bit_Number := 5;
   SEG105_Mask              : constant Unsigned_8 := 16#20#;
   SEG106_Bit               : constant Bit_Number := 6;
   SEG106_Mask              : constant Unsigned_8 := 16#40#;
   SEG107_Bit               : constant Bit_Number := 7;
   SEG107_Mask              : constant Unsigned_8 := 16#80#;

   --  LCD Data Register 3
   LCDDR3_Addr              : constant Address    := 16#ef#;
   LCDDR3                   : Unsigned_8 ;
   for LCDDR3'Address use LCDDR3_Addr;
   pragma Volatile (LCDDR3);
   LCDDR3_Bits              : Bits_In_Byte;
   for LCDDR3_Bits'Address use LCDDR3_Addr;
   pragma Volatile (LCDDR3_Bits);
   SEG024_Bit               : constant Bit_Number := 0;
   SEG024_Mask              : constant Unsigned_8 := 16#01#;

   --  LCD Data Register 2
   LCDDR2_Addr              : constant Address    := 16#ee#;
   LCDDR2                   : Unsigned_8 ;
   for LCDDR2'Address use LCDDR2_Addr;
   pragma Volatile (LCDDR2);
   LCDDR2_Bits              : Bits_In_Byte;
   for LCDDR2_Bits'Address use LCDDR2_Addr;
   pragma Volatile (LCDDR2_Bits);
   SEG016_Bit               : constant Bit_Number := 0;
   SEG016_Mask              : constant Unsigned_8 := 16#01#;
   SEG017_Bit               : constant Bit_Number := 1;
   SEG017_Mask              : constant Unsigned_8 := 16#02#;
   SEG018_Bit               : constant Bit_Number := 2;
   SEG018_Mask              : constant Unsigned_8 := 16#04#;
   SEG019_Bit               : constant Bit_Number := 3;
   SEG019_Mask              : constant Unsigned_8 := 16#08#;
   SEG020_Bit               : constant Bit_Number := 4;
   SEG020_Mask              : constant Unsigned_8 := 16#10#;
   SEG021_Bit               : constant Bit_Number := 5;
   SEG021_Mask              : constant Unsigned_8 := 16#20#;
   SEG022_Bit               : constant Bit_Number := 6;
   SEG022_Mask              : constant Unsigned_8 := 16#40#;
   SEG023_Bit               : constant Bit_Number := 7;
   SEG023_Mask              : constant Unsigned_8 := 16#80#;

   --  LCD Data Register 1
   LCDDR1_Addr              : constant Address    := 16#ed#;
   LCDDR1                   : Unsigned_8 ;
   for LCDDR1'Address use LCDDR1_Addr;
   pragma Volatile (LCDDR1);
   LCDDR1_Bits              : Bits_In_Byte;
   for LCDDR1_Bits'Address use LCDDR1_Addr;
   pragma Volatile (LCDDR1_Bits);
   SEG008_Bit               : constant Bit_Number := 0;
   SEG008_Mask              : constant Unsigned_8 := 16#01#;
   SEG009_Bit               : constant Bit_Number := 1;
   SEG009_Mask              : constant Unsigned_8 := 16#02#;
   SEG010_Bit               : constant Bit_Number := 2;
   SEG010_Mask              : constant Unsigned_8 := 16#04#;
   SEG011_Bit               : constant Bit_Number := 3;
   SEG011_Mask              : constant Unsigned_8 := 16#08#;
   SEG012_Bit               : constant Bit_Number := 4;
   SEG012_Mask              : constant Unsigned_8 := 16#10#;
   SEG013_Bit               : constant Bit_Number := 5;
   SEG013_Mask              : constant Unsigned_8 := 16#20#;
   SEG014_Bit               : constant Bit_Number := 6;
   SEG014_Mask              : constant Unsigned_8 := 16#40#;
   SEG015_Bit               : constant Bit_Number := 7;
   SEG015_Mask              : constant Unsigned_8 := 16#80#;

   --  LCD Data Register 0
   LCDDR0_Addr              : constant Address    := 16#ec#;
   LCDDR0                   : Unsigned_8 ;
   for LCDDR0'Address use LCDDR0_Addr;
   pragma Volatile (LCDDR0);
   LCDDR0_Bits              : Bits_In_Byte;
   for LCDDR0_Bits'Address use LCDDR0_Addr;
   pragma Volatile (LCDDR0_Bits);
   SEG000_Bit               : constant Bit_Number := 0;
   SEG000_Mask              : constant Unsigned_8 := 16#01#;
   SEG001_Bit               : constant Bit_Number := 1;
   SEG001_Mask              : constant Unsigned_8 := 16#02#;
   SEG002_Bit               : constant Bit_Number := 2;
   SEG002_Mask              : constant Unsigned_8 := 16#04#;
   SEG003_Bit               : constant Bit_Number := 3;
   SEG003_Mask              : constant Unsigned_8 := 16#08#;
   SEG004_Bit               : constant Bit_Number := 4;
   SEG004_Mask              : constant Unsigned_8 := 16#10#;
   SEG005_Bit               : constant Bit_Number := 5;
   SEG005_Mask              : constant Unsigned_8 := 16#20#;
   SEG006_Bit               : constant Bit_Number := 6;
   SEG006_Mask              : constant Unsigned_8 := 16#40#;
   SEG007_Bit               : constant Bit_Number := 7;
   SEG007_Mask              : constant Unsigned_8 := 16#80#;

   --  LCD Contrast Control Register
   LCDCCR_Addr              : constant Address    := 16#e7#;
   LCDCCR                   : Unsigned_8 ;
   for LCDCCR'Address use LCDCCR_Addr;
   pragma Volatile (LCDCCR);
   LCDCCR_Bits              : Bits_In_Byte;
   for LCDCCR_Bits'Address use LCDCCR_Addr;
   pragma Volatile (LCDCCR_Bits);
   --  LCD Contrast Control 0
   LCDCC0_Bit               : constant Bit_Number := 0;
   LCDCC0_Mask              : constant Unsigned_8 := 16#01#;
   --  LCD Contrast Control 1
   LCDCC1_Bit               : constant Bit_Number := 1;
   LCDCC1_Mask              : constant Unsigned_8 := 16#02#;
   --  LCD Contrast Control 2
   LCDCC2_Bit               : constant Bit_Number := 2;
   LCDCC2_Mask              : constant Unsigned_8 := 16#04#;
   --  LCD Contrast Control 3
   LCDCC3_Bit               : constant Bit_Number := 3;
   LCDCC3_Mask              : constant Unsigned_8 := 16#08#;
   --  LCD Display Configuration Bit 0
   LCDDC0_Bit               : constant Bit_Number := 5;
   LCDDC0_Mask              : constant Unsigned_8 := 16#20#;
   --  LCD Display Configuration Bit 1
   LCDDC1_Bit               : constant Bit_Number := 6;
   LCDDC1_Mask              : constant Unsigned_8 := 16#40#;
   --  LCD Display Configuration Bit 2
   LCDDC2_Bit               : constant Bit_Number := 7;
   LCDDC2_Mask              : constant Unsigned_8 := 16#80#;

   --  LCD Frame Rate Register
   LCDFRR_Addr              : constant Address    := 16#e6#;
   LCDFRR                   : Unsigned_8 ;
   for LCDFRR'Address use LCDFRR_Addr;
   pragma Volatile (LCDFRR);
   LCDFRR_Bits              : Bits_In_Byte;
   for LCDFRR_Bits'Address use LCDFRR_Addr;
   pragma Volatile (LCDFRR_Bits);
   --  LCD Clock Divider 0
   LCDCD0_Bit               : constant Bit_Number := 0;
   LCDCD0_Mask              : constant Unsigned_8 := 16#01#;
   --  LCD Clock Divider 1
   LCDCD1_Bit               : constant Bit_Number := 1;
   LCDCD1_Mask              : constant Unsigned_8 := 16#02#;
   --  LCD Clock Divider 2
   LCDCD2_Bit               : constant Bit_Number := 2;
   LCDCD2_Mask              : constant Unsigned_8 := 16#04#;
   --  LCD Prescaler Select 0
   LCDPS0_Bit               : constant Bit_Number := 4;
   LCDPS0_Mask              : constant Unsigned_8 := 16#10#;
   --  LCD Prescaler Select 1
   LCDPS1_Bit               : constant Bit_Number := 5;
   LCDPS1_Mask              : constant Unsigned_8 := 16#20#;
   --  LCD Prescaler Select 2
   LCDPS2_Bit               : constant Bit_Number := 6;
   LCDPS2_Mask              : constant Unsigned_8 := 16#40#;

   --  LCD Control and Status Register B
   LCDCRB_Addr              : constant Address    := 16#e5#;
   LCDCRB                   : Unsigned_8 ;
   for LCDCRB'Address use LCDCRB_Addr;
   pragma Volatile (LCDCRB);
   LCDCRB_Bits              : Bits_In_Byte;
   for LCDCRB_Bits'Address use LCDCRB_Addr;
   pragma Volatile (LCDCRB_Bits);
   --  LCD Port Mask 0
   LCDPM0_Bit               : constant Bit_Number := 0;
   LCDPM0_Mask              : constant Unsigned_8 := 16#01#;
   --  LCD Port Mask 1
   LCDPM1_Bit               : constant Bit_Number := 1;
   LCDPM1_Mask              : constant Unsigned_8 := 16#02#;
   --  LCD Port Mask 2
   LCDPM2_Bit               : constant Bit_Number := 2;
   LCDPM2_Mask              : constant Unsigned_8 := 16#04#;
   --  LCD Mux Select 0
   LCDMUX0_Bit              : constant Bit_Number := 4;
   LCDMUX0_Mask             : constant Unsigned_8 := 16#10#;
   --  LCD Mux Select 1
   LCDMUX1_Bit              : constant Bit_Number := 5;
   LCDMUX1_Mask             : constant Unsigned_8 := 16#20#;
   --  LCD 1/2 Bias Select
   LCD2B_Bit                : constant Bit_Number := 6;
   LCD2B_Mask               : constant Unsigned_8 := 16#40#;
   --  LCD CLock Select
   LCDCS_Bit                : constant Bit_Number := 7;
   LCDCS_Mask               : constant Unsigned_8 := 16#80#;

   --  LCD Control Register A
   LCDCRA_Addr              : constant Address    := 16#e4#;
   LCDCRA                   : Unsigned_8 ;
   for LCDCRA'Address use LCDCRA_Addr;
   pragma Volatile (LCDCRA);
   LCDCRA_Bits              : Bits_In_Byte;
   for LCDCRA_Bits'Address use LCDCRA_Addr;
   pragma Volatile (LCDCRA_Bits);
   --  LCD Blanking
   LCDBL_Bit                : constant Bit_Number := 0;
   LCDBL_Mask               : constant Unsigned_8 := 16#01#;
   --  LCD Interrupt Enable
   LCDIE_Bit                : constant Bit_Number := 3;
   LCDIE_Mask               : constant Unsigned_8 := 16#08#;
   --  LCD Interrupt Flag
   LCDIF_Bit                : constant Bit_Number := 4;
   LCDIF_Mask               : constant Unsigned_8 := 16#10#;
   --  LCD A or B waveform
   LCDAB_Bit                : constant Bit_Number := 6;
   LCDAB_Mask               : constant Unsigned_8 := 16#40#;
   --  LCD Enable
   LCDEN_Bit                : constant Bit_Number := 7;
   LCDEN_Mask               : constant Unsigned_8 := 16#80#;

   --  USART I/O Data Register
   UDR0_Addr                : constant Address    := 16#c6#;
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

   --  USART Baud Rate Register High Byte
   UBRR0H_Addr              : constant Address    := 16#c5#;
   UBRR0H                   : Unsigned_8 ;
   for UBRR0H'Address use UBRR0H_Addr;
   pragma Volatile (UBRR0H);
   UBRR0H_Bits              : Bits_In_Byte;
   for UBRR0H_Bits'Address use UBRR0H_Addr;
   pragma Volatile (UBRR0H_Bits);
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
   UMSEL0_Bit               : constant Bit_Number := 6;
   UMSEL0_Mask              : constant Unsigned_8 := 16#40#;

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
   --  USART Data Register Empty Interrupt Enable
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
   --  Double the USART Transmission Speed
   U2X0_Bit                 : constant Bit_Number := 1;
   U2X0_Mask                : constant Unsigned_8 := 16#02#;
   --  USART Parity Error
   UPE0_Bit                 : constant Bit_Number := 2;
   UPE0_Mask                : constant Unsigned_8 := 16#04#;
   --  Data OverRun
   DOR0_Bit                 : constant Bit_Number := 3;
   DOR0_Mask                : constant Unsigned_8 := 16#08#;
   --  Framing Error
   FE0_Bit                  : constant Bit_Number := 4;
   FE0_Mask                 : constant Unsigned_8 := 16#10#;
   --  USART Data Register Empty
   UDRE0_Bit                : constant Bit_Number := 5;
   UDRE0_Mask               : constant Unsigned_8 := 16#20#;
   --  USART Transmit Complete
   TXC0_Bit                 : constant Bit_Number := 6;
   TXC0_Mask                : constant Unsigned_8 := 16#40#;
   --  USART Receive Complete
   RXC0_Bit                 : constant Bit_Number := 7;
   RXC0_Mask                : constant Unsigned_8 := 16#80#;

   --  USI Data Register
   USIDR_Addr               : constant Address    := 16#ba#;
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
   USISR_Addr               : constant Address    := 16#b9#;
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
   USICR_Addr               : constant Address    := 16#b8#;
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

   --  Asynchronous Status Register
   ASSR_Addr                : constant Address    := 16#b6#;
   ASSR                     : Unsigned_8 ;
   for ASSR'Address use ASSR_Addr;
   pragma Volatile (ASSR);
   ASSR_Bits                : Bits_In_Byte;
   for ASSR_Bits'Address use ASSR_Addr;
   pragma Volatile (ASSR_Bits);
   --  TCR2UB: Timer/Counter Control Register2 Update Busy
   TCR2UB_Bit               : constant Bit_Number := 0;
   TCR2UB_Mask              : constant Unsigned_8 := 16#01#;
   --  Output Compare Register2 Update Busy
   OCR2UB_Bit               : constant Bit_Number := 1;
   OCR2UB_Mask              : constant Unsigned_8 := 16#02#;
   --  TCN2UB: Timer/Counter2 Update Busy
   TCN2UB_Bit               : constant Bit_Number := 2;
   TCN2UB_Mask              : constant Unsigned_8 := 16#04#;
   --  AS2: Asynchronous Timer/Counter2
   AS2_Bit                  : constant Bit_Number := 3;
   AS2_Mask                 : constant Unsigned_8 := 16#08#;
   --  Enable External Clock Interrupt
   EXCLK_Bit                : constant Bit_Number := 4;
   EXCLK_Mask               : constant Unsigned_8 := 16#10#;

   --  Timer/Counter2 Output Compare Register
   OCR2A_Addr               : constant Address    := 16#b3#;
   OCR2A                    : Unsigned_8 ;
   for OCR2A'Address use OCR2A_Addr;
   pragma Volatile (OCR2A);
   OCR2A_Bits               : Bits_In_Byte;
   for OCR2A_Bits'Address use OCR2A_Addr;
   pragma Volatile (OCR2A_Bits);
   --  Timer/Counter2 Output Compare Register Bit 0
   OCR2A0_Bit               : constant Bit_Number := 0;
   OCR2A0_Mask              : constant Unsigned_8 := 16#01#;
   --  Timer/Counter2 Output Compare Register Bit 1
   OCR2A1_Bit               : constant Bit_Number := 1;
   OCR2A1_Mask              : constant Unsigned_8 := 16#02#;
   --  Timer/Counter2 Output Compare Register Bit 2
   OCR2A2_Bit               : constant Bit_Number := 2;
   OCR2A2_Mask              : constant Unsigned_8 := 16#04#;
   --  Timer/Counter2 Output Compare Register Bit 3
   OCR2A3_Bit               : constant Bit_Number := 3;
   OCR2A3_Mask              : constant Unsigned_8 := 16#08#;
   --  Timer/Counter2 Output Compare Register Bit 4
   OCR2A4_Bit               : constant Bit_Number := 4;
   OCR2A4_Mask              : constant Unsigned_8 := 16#10#;
   --  Timer/Counter2 Output Compare Register Bit 5
   OCR2A5_Bit               : constant Bit_Number := 5;
   OCR2A5_Mask              : constant Unsigned_8 := 16#20#;
   --  Timer/Counter2 Output Compare Register Bit 6
   OCR2A6_Bit               : constant Bit_Number := 6;
   OCR2A6_Mask              : constant Unsigned_8 := 16#40#;
   --  Timer/Counter2 Output Compare Register Bit 7
   OCR2A7_Bit               : constant Bit_Number := 7;
   OCR2A7_Mask              : constant Unsigned_8 := 16#80#;

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

   TCCR2B_Addr              : constant Address    := 16#b1#;
   TCCR2B                   : Unsigned_8 ;
   for TCCR2B'Address use TCCR2B_Addr;
   pragma Volatile (TCCR2B);
   TCCR2B_Bits              : Bits_In_Byte;
   for TCCR2B_Bits'Address use TCCR2B_Addr;
   pragma Volatile (TCCR2B_Bits);

   --  Timer/Counter2 Control Register
   TCCR2A_Addr              : constant Address    := 16#b0#;
   TCCR2A                   : Unsigned_8 ;
   for TCCR2A'Address use TCCR2A_Addr;
   pragma Volatile (TCCR2A);
   TCCR2A_Bits              : Bits_In_Byte;
   for TCCR2A_Bits'Address use TCCR2A_Addr;
   pragma Volatile (TCCR2A_Bits);
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
   WGM21_Bit                : constant Bit_Number := 3;
   WGM21_Mask               : constant Unsigned_8 := 16#08#;
   --  Compare Output Mode bit 0
   COM2A0_Bit               : constant Bit_Number := 4;
   COM2A0_Mask              : constant Unsigned_8 := 16#10#;
   --  Compare Output Mode bit 1
   COM2A1_Bit               : constant Bit_Number := 5;
   COM2A1_Mask              : constant Unsigned_8 := 16#20#;
   --  Waveform Generation Mode
   WGM20_Bit                : constant Bit_Number := 6;
   WGM20_Mask               : constant Unsigned_8 := 16#40#;
   --  Force Output Compare A
   FOC2A_Bit                : constant Bit_Number := 7;
   FOC2A_Mask               : constant Unsigned_8 := 16#80#;

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

   --  Digital Input Disable Register 0
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
   --  Analog Comparator Multiplexer Enable
   ACME_Bit                 : constant Bit_Number := 6;
   ACME_Mask                : constant Unsigned_8 := 16#40#;

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

   --  Timer/Counter2 Interrupt Mask register
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
   --  Timer/Counter2 Output Compare Match Interrupt Enable
   OCIE2A_Bit               : constant Bit_Number := 1;
   OCIE2A_Mask              : constant Unsigned_8 := 16#02#;

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
   --  Timer/Counter0 Output Compare Match Interrupt Enable
   OCIE0A_Bit               : constant Bit_Number := 1;
   OCIE0A_Mask              : constant Unsigned_8 := 16#02#;

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

   --  External Interrupt Control Register
   EICRA_Addr               : constant Address    := 16#69#;
   EICRA                    : Unsigned_8 ;
   for EICRA'Address use EICRA_Addr;
   pragma Volatile (EICRA);
   EICRA_Bits               : Bits_In_Byte;
   for EICRA_Bits'Address use EICRA_Addr;
   pragma Volatile (EICRA_Bits);
   --  External Interrupt Sense Control 0 Bit 0
   ISC00_Bit                : constant Bit_Number := 0;
   ISC00_Mask               : constant Unsigned_8 := 16#01#;
   --  External Interrupt Sense Control 0 Bit 1
   ISC01_Bit                : constant Bit_Number := 1;
   ISC01_Mask               : constant Unsigned_8 := 16#02#;

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

   --  Power Reduction Register
   PRR_Addr                 : constant Address    := 16#64#;
   PRR                      : Unsigned_8 ;
   for PRR'Address use PRR_Addr;
   pragma Volatile (PRR);
   PRR_Bits                 : Bits_In_Byte;
   for PRR_Bits'Address use PRR_Addr;
   pragma Volatile (PRR_Bits);
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
   --  Power Reduction LCD
   PRLCD_Bit                : constant Bit_Number := 4;
   PRLCD_Mask               : constant Unsigned_8 := 16#10#;

   --  Clock Prescale Register
   CLKPR_Addr               : constant Address    := 16#61#;
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

   --  Watchdog Timer Control Register
   WDTCR_Addr               : constant Address    := 16#60#;
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
   OCR0A_Addr               : constant Address    := 16#47#;
   OCR0A                    : Unsigned_8 ;
   for OCR0A'Address use OCR0A_Addr;
   pragma Volatile (OCR0A);
   OCR0A_Bits               : Bits_In_Byte;
   for OCR0A_Bits'Address use OCR0A_Addr;
   pragma Volatile (OCR0A_Bits);
   OCR0A0_Bit               : constant Bit_Number := 0;
   OCR0A0_Mask              : constant Unsigned_8 := 16#01#;
   OCR0A1_Bit               : constant Bit_Number := 1;
   OCR0A1_Mask              : constant Unsigned_8 := 16#02#;
   OCR0A2_Bit               : constant Bit_Number := 2;
   OCR0A2_Mask              : constant Unsigned_8 := 16#04#;
   OCR0A3_Bit               : constant Bit_Number := 3;
   OCR0A3_Mask              : constant Unsigned_8 := 16#08#;
   OCR0A4_Bit               : constant Bit_Number := 4;
   OCR0A4_Mask              : constant Unsigned_8 := 16#10#;
   OCR0A5_Bit               : constant Bit_Number := 5;
   OCR0A5_Mask              : constant Unsigned_8 := 16#20#;
   OCR0A6_Bit               : constant Bit_Number := 6;
   OCR0A6_Mask              : constant Unsigned_8 := 16#40#;
   OCR0A7_Bit               : constant Bit_Number := 7;
   OCR0A7_Mask              : constant Unsigned_8 := 16#80#;

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

   --  Timer/Counter0 Control Register
   TCCR0A_Addr              : constant Address    := 16#44#;
   TCCR0A                   : Unsigned_8 ;
   for TCCR0A'Address use TCCR0A_Addr;
   pragma Volatile (TCCR0A);
   TCCR0A_Bits              : Bits_In_Byte;
   for TCCR0A_Bits'Address use TCCR0A_Addr;
   pragma Volatile (TCCR0A_Bits);
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
   COM0A0_Bit               : constant Bit_Number := 4;
   COM0A0_Mask              : constant Unsigned_8 := 16#10#;
   --  Compare Match Output Mode 1
   COM0A1_Bit               : constant Bit_Number := 5;
   COM0A1_Mask              : constant Unsigned_8 := 16#20#;
   --  Waveform Generation Mode 0
   WGM00_Bit                : constant Bit_Number := 6;
   WGM00_Mask               : constant Unsigned_8 := 16#40#;
   --  Force Output Compare
   FOC0A_Bit                : constant Bit_Number := 7;
   FOC0A_Mask               : constant Unsigned_8 := 16#80#;

   --  General Timer/Control Register
   GTCCR_Addr               : constant Address    := 16#43#;
   GTCCR                    : Unsigned_8 ;
   for GTCCR'Address use GTCCR_Addr;
   pragma Volatile (GTCCR);
   GTCCR_Bits               : Bits_In_Byte;
   for GTCCR_Bits'Address use GTCCR_Addr;
   pragma Volatile (GTCCR_Bits);
   --  Prescaler Reset Timer/Counter1 and Timer/Counter0
   PSR310_Bit               : constant Bit_Number := 0;
   PSR310_Mask              : constant Unsigned_8 := 16#01#;
   --  Prescaler Reset Timer/Counter2
   PSR2_Bit                 : constant Bit_Number := 1;
   PSR2_Mask                : constant Unsigned_8 := 16#02#;
   --  Timer/Counter Synchronization Mode
   TSM_Bit                  : constant Bit_Number := 7;
   TSM_Mask                 : constant Unsigned_8 := 16#80#;

   --  EEPROM Address Register High Byte
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
   EEWE_Bit                 : constant Bit_Number := 1;
   EEWE_Mask                : constant Unsigned_8 := 16#02#;
   --  EEPROM Master Write Enable
   EEMWE_Bit                : constant Bit_Number := 2;
   EEMWE_Mask               : constant Unsigned_8 := 16#04#;
   --  EEPROM Ready Interrupt Enable
   EERIE_Bit                : constant Bit_Number := 3;
   EERIE_Mask               : constant Unsigned_8 := 16#08#;

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
   --  Pin Change Interrupt Enable 0
   PCIE0_Bit                : constant Bit_Number := 6;
   PCIE0_Mask               : constant Unsigned_8 := 16#40#;
   --  Pin Change Interrupt Enable 1
   PCIE1_Bit                : constant Bit_Number := 7;
   PCIE1_Mask               : constant Unsigned_8 := 16#80#;

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
   --  Pin Change Interrupt Flag 0
   PCIF0_Bit                : constant Bit_Number := 6;
   PCIF0_Mask               : constant Unsigned_8 := 16#40#;
   --  Pin Change Interrupt Flag 1
   PCIF1_Bit                : constant Bit_Number := 7;
   PCIF1_Mask               : constant Unsigned_8 := 16#80#;

   --  Timer/Counter2 Interrupt Flag Register
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
   --  Timer/Counter2 Output Compare Flag 2
   OCF2A_Bit                : constant Bit_Number := 1;
   OCF2A_Mask               : constant Unsigned_8 := 16#02#;

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
   --  Timer/Counter0 Output Compare Flag 0
   OCF0A_Bit                : constant Bit_Number := 1;
   OCF0A_Mask               : constant Unsigned_8 := 16#02#;

   --  Port G Data Register
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

   --  Port G Data Direction Register
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

   --  Port G Input Pins
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
   Instruction_Core  : constant Instruction_Core_Type := V2E;
   Have_lpm_rd_Zplus : constant Boolean               := True;
   EEprom_8bit_Addr  : constant Boolean               :=
     (EEprom_Size <= 16#0100#);


end AVR.ATmega169;
