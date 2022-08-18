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

package AVR.AT86RF401 is
   pragma Pure (AVR.AT86RF401);

   CVS_Version : constant String := "$Id: avr-at86rf401.ads 591 2006-04-25 21:18:46Z berndtrog $";


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
   Number_Of_Interrupts     : constant := 3;

   --  Hardware pin, Watchdog or Button Reset
   Sig_RESETB               : constant        :=  0;
   Sig_RESETB_String        : constant String := "__vector_0";
   --  Transmission Done, Bit Timer Flag 2 Interrupt
   Sig_TXDONE               : constant        :=  1;
   Sig_TXDONE_String        : constant String := "__vector_1";
   --  Transmit Buffer Empty, Bit Itmer Flag 0 Interrupt
   Sig_TXEMPTY              : constant        :=  2;
   Sig_TXEMPTY_String       : constant String := "__vector_2";


   --
   --  I/O registers
   --

   --  Stack Pointer Low
   SPL                      : constant System.Address := 16#5d#;
   SP                       : constant System.Address := 16#5d#;
   --  Stack pointer bit 0
   SP0_Bit                  : constant Bit_Number := 0;
   SP0                      : constant Byte       := 16#01#;
   --  Stack pointer bit 1
   SP1_Bit                  : constant Bit_Number := 1;
   SP1                      : constant Byte       := 16#02#;
   --  Stack pointer bit 2
   SP2_Bit                  : constant Bit_Number := 2;
   SP2                      : constant Byte       := 16#04#;
   --  Stack pointer bit 3
   SP3_Bit                  : constant Bit_Number := 3;
   SP3                      : constant Byte       := 16#08#;
   SP4_Bit                  : constant Bit_Number := 4;
   SP4                      : constant Byte       := 16#10#;
   --  Stack pointer bit 5
   SP5_Bit                  : constant Bit_Number := 5;
   SP5                      : constant Byte       := 16#20#;
   --  Stack pointer bit 6
   SP6_Bit                  : constant Bit_Number := 6;
   SP6                      : constant Byte       := 16#40#;
   --  Stack pointer bit 7
   SP7_Bit                  : constant Bit_Number := 7;
   SP7                      : constant Byte       := 16#80#;

   --  Battery Low Configuration Register
   BL_CONFIG                : constant System.Address := 16#55#;
   --  Battery Low Detection Level bit 0
   BL0_Bit                  : constant Bit_Number := 0;
   BL0                      : constant Byte       := 16#01#;
   --  Battery Low Detection Level bit 1
   BL1_Bit                  : constant Bit_Number := 1;
   BL1                      : constant Byte       := 16#02#;
   --  Battery Low Detection Level bit 2
   BL2_Bit                  : constant Bit_Number := 2;
   BL2                      : constant Byte       := 16#04#;
   --  Battery Low Detection Level bit 3
   BL3_Bit                  : constant Bit_Number := 3;
   BL3                      : constant Byte       := 16#08#;
   BL4_Bit                  : constant Bit_Number := 4;
   BL4                      : constant Byte       := 16#10#;
   --  Battery Low Detection Level bit 5
   BL5_Bit                  : constant Bit_Number := 5;
   BL5                      : constant Byte       := 16#20#;
   --  Battery Low Valid
   BLV_Bit                  : constant Bit_Number := 6;
   BLV                      : constant Byte       := 16#40#;
   --  Battery Low
   BL_Bit                   : constant Bit_Number := 7;
   BL                       : constant Byte       := 16#80#;

   --  Button Detect Register
   B_DET                    : constant System.Address := 16#54#;
   --  Button Detect bit 0
   BD0_Bit                  : constant Bit_Number := 0;
   BD0                      : constant Byte       := 16#01#;
   --  Button Detect bit 1
   BD1_Bit                  : constant Bit_Number := 1;
   BD1                      : constant Byte       := 16#02#;
   --  Button Detect bit 2
   BD2_Bit                  : constant Bit_Number := 2;
   BD2                      : constant Byte       := 16#04#;
   --  Button Detect bit 3
   BD3_Bit                  : constant Bit_Number := 3;
   BD3                      : constant Byte       := 16#08#;
   BD4_Bit                  : constant Bit_Number := 4;
   BD4                      : constant Byte       := 16#10#;
   --  Button Detect bit 5
   BD5_Bit                  : constant Bit_Number := 5;
   BD5                      : constant Byte       := 16#20#;

   --  AVR Configuration Register
   AVR_CONFIG               : constant System.Address := 16#53#;
   --  Button Boot Mode
   BBM_Bit                  : constant Bit_Number := 0;
   BBM                      : constant Byte       := 16#01#;
   --  Sleep Bit
   SLEEP_Bit                : constant Bit_Number := 1;
   SLEEP                    : constant Byte       := 16#02#;
   --  Battery Low Indicator
   BLI_Bit                  : constant Bit_Number := 2;
   BLI                      : constant Byte       := 16#04#;
   --  Battery Dead
   BD_Bit                   : constant Bit_Number := 3;
   BD                       : constant Byte       := 16#08#;
   TM_Bit                   : constant Bit_Number := 4;
   TM                       : constant Byte       := 16#10#;
   --  AVR System Clock Select bit 0
   ACS0_Bit                 : constant Bit_Number := 5;
   ACS0                     : constant Byte       := 16#20#;
   --  AVR System Clock Select bit 1
   ACS1_Bit                 : constant Bit_Number := 6;
   ACS1                     : constant Byte       := 16#40#;

   --  I/O Data In register
   IO_DATIN                 : constant System.Address := 16#52#;
   --  I/O Data In Register bit 0
   IOI0_Bit                 : constant Bit_Number := 0;
   IOI0                     : constant Byte       := 16#01#;
   --  I/O Data In Register bit 1
   IOI1_Bit                 : constant Bit_Number := 1;
   IOI1                     : constant Byte       := 16#02#;
   --  I/O Data In Register bit 2
   IOI2_Bit                 : constant Bit_Number := 2;
   IOI2                     : constant Byte       := 16#04#;
   --  I/O Data In Register bit 3
   IOI3_Bit                 : constant Bit_Number := 3;
   IOI3                     : constant Byte       := 16#08#;
   --  I/O Data In Register bit 4
   IOI4_Bit                 : constant Bit_Number := 4;
   IOI4                     : constant Byte       := 16#10#;
   --  I/O Data In Register bit 5
   IOI5_Bit                 : constant Bit_Number := 5;
   IOI5                     : constant Byte       := 16#20#;

   --  I/O Data Out Register
   IO_DATOUT                : constant System.Address := 16#51#;
   --  I/O Data Out Register bit 0
   IOO0_Bit                 : constant Bit_Number := 0;
   IOO0                     : constant Byte       := 16#01#;
   --  I/O Data Out Register bit 1
   IOO1_Bit                 : constant Bit_Number := 1;
   IOO1                     : constant Byte       := 16#02#;
   --  I/O Data Out Register bit 2
   IOO2_Bit                 : constant Bit_Number := 2;
   IOO2                     : constant Byte       := 16#04#;
   --  I/O Data Out Register bit 3
   IOO3_Bit                 : constant Bit_Number := 3;
   IOO3                     : constant Byte       := 16#08#;
   --  I/O Data Out Register bit 4
   IOO4_Bit                 : constant Bit_Number := 4;
   IOO4                     : constant Byte       := 16#10#;
   --  I/O Data Out Register bit 5
   IOO5_Bit                 : constant Bit_Number := 5;
   IOO5                     : constant Byte       := 16#20#;

   --  I/O Enable Register
   IO_ENAB                  : constant System.Address := 16#50#;
   --  I/O Enable bit 0
   IOE0_Bit                 : constant Bit_Number := 0;
   IOE0                     : constant Byte       := 16#01#;
   --  I/O Enable bit 1
   IOE1_Bit                 : constant Bit_Number := 1;
   IOE1                     : constant Byte       := 16#02#;
   --  I/O Enable bit 2
   IOE2_Bit                 : constant Bit_Number := 2;
   IOE2                     : constant Byte       := 16#04#;
   --  I/O Enable bit 3
   IOE3_Bit                 : constant Bit_Number := 3;
   IOE3                     : constant Byte       := 16#08#;
   --  I/O Enable bit 4
   IOE4_Bit                 : constant Bit_Number := 4;
   IOE4                     : constant Byte       := 16#10#;
   --  I/O Enable bit 5
   IOE5_Bit                 : constant Bit_Number := 5;
   IOE5                     : constant Byte       := 16#20#;

   --  Watchdog Timer Control Register
   WDTCR                    : constant System.Address := 16#42#;
   --  Watch Dog Timer Prescaler bit 0
   WDP0_Bit                 : constant Bit_Number := 0;
   WDP0                     : constant Byte       := 16#01#;
   --  Watch Dog Timer Prescaler bit 1
   WDP1_Bit                 : constant Bit_Number := 1;
   WDP1                     : constant Byte       := 16#02#;
   --  Watch Dog Timer Prescaler bit 2
   WDP2_Bit                 : constant Bit_Number := 2;
   WDP2                     : constant Byte       := 16#04#;
   --  Watch Dog Enable
   WDE_Bit                  : constant Bit_Number := 3;
   WDE                      : constant Byte       := 16#08#;
   --  RW
   WDTOE_Bit                : constant Bit_Number := 4;
   WDTOE                    : constant Byte       := 16#10#;

   --  Bit Timer Counter Control Register
   BTCR                     : constant System.Address := 16#41#;
   --  Flag 0
   F0_Bit                   : constant Bit_Number := 0;
   F0                       : constant Byte       := 16#01#;
   --  Data Bit
   DATA_Bit                 : constant Bit_Number := 1;
   DATA                     : constant Byte       := 16#02#;
   --  Flag 2
   F2_Bit                   : constant Bit_Number := 2;
   F2                       : constant Byte       := 16#04#;
   --  Interrupt Enable
   IE_Bit                   : constant Bit_Number := 3;
   IE                       : constant Byte       := 16#08#;
   --  Bit Timer Mode bit 0
   M0_Bit                   : constant Bit_Number := 4;
   M0                       : constant Byte       := 16#10#;
   --  Bit Timer Mode bit 1
   M1_Bit                   : constant Bit_Number := 5;
   M1                       : constant Byte       := 16#20#;
   --  Timer Count Register bit 8
   C8_Bit                   : constant Bit_Number := 6;
   C8                       : constant Byte       := 16#40#;
   --  Timer Count Register bit 9
   C9_Bit                   : constant Bit_Number := 7;
   C9                       : constant Byte       := 16#80#;

   --  Timer Count register
   BTCNT                    : constant System.Address := 16#40#;
   --  Timer Count Register bit 7
   C0_Bit                   : constant Bit_Number := 0;
   C0                       : constant Byte       := 16#01#;
   --  Timer Count Register bit 7
   C1_Bit                   : constant Bit_Number := 1;
   C1                       : constant Byte       := 16#02#;
   --  Timer Count Register bit 7
   C2_Bit                   : constant Bit_Number := 2;
   C2                       : constant Byte       := 16#04#;
   --  Timer Count Register bit 7
   C3_Bit                   : constant Bit_Number := 3;
   C3                       : constant Byte       := 16#08#;
   --  Timer Count Register bit 7
   C4_Bit                   : constant Bit_Number := 4;
   C4                       : constant Byte       := 16#10#;
   --  Timer Count Register bit 7
   C5_Bit                   : constant Bit_Number := 5;
   C5                       : constant Byte       := 16#20#;
   --  Timer Count Register bit 7
   C6_Bit                   : constant Bit_Number := 6;
   C6                       : constant Byte       := 16#40#;
   --  Timer Count Register bit 7
   C7_Bit                   : constant Bit_Number := 7;
   C7                       : constant Byte       := 16#80#;

   --  EERPOM Address Register
   DEEAR                    : constant System.Address := 16#3e#;
   --  EEPROM Byte Address bit 0
   BA0_Bit                  : constant Bit_Number := 0;
   BA0                      : constant Byte       := 16#01#;
   --  EEPROM Byte Address bit 1
   BA1_Bit                  : constant Bit_Number := 1;
   BA1                      : constant Byte       := 16#02#;
   --  EEPROM Byte Address bit 2
   BA2_Bit                  : constant Bit_Number := 2;
   BA2                      : constant Byte       := 16#04#;
   --  EEPROM Page Address bit 3
   PA3_Bit                  : constant Bit_Number := 3;
   PA3                      : constant Byte       := 16#08#;
   --  EEPROM Page Address bit 4
   PA4_Bit                  : constant Bit_Number := 4;
   PA4                      : constant Byte       := 16#10#;
   --  EEPROM Page Address bit 5
   PA5_Bit                  : constant Bit_Number := 5;
   PA5                      : constant Byte       := 16#20#;
   --  EEPROM Page Address bit 6
   PA6_Bit                  : constant Bit_Number := 6;
   PA6                      : constant Byte       := 16#40#;

   --  EEPROM Data Register
   DEEDR                    : constant System.Address := 16#3d#;
   --  EEPROM Data Register bit 0
   ED0_Bit                  : constant Bit_Number := 0;
   ED0                      : constant Byte       := 16#01#;
   --  EEPROM Data Register bit 1
   ED1_Bit                  : constant Bit_Number := 1;
   ED1                      : constant Byte       := 16#02#;
   --  EEPROM Data Register bit 2
   ED2_Bit                  : constant Bit_Number := 2;
   ED2                      : constant Byte       := 16#04#;
   --  EEPROM Data Register bit 3
   ED3_Bit                  : constant Bit_Number := 3;
   ED3                      : constant Byte       := 16#08#;
   --  EEPROM Data Register bit 4
   ED4_Bit                  : constant Bit_Number := 4;
   ED4                      : constant Byte       := 16#10#;
   --  EEPROM Data Register bit 5
   ED5_Bit                  : constant Bit_Number := 5;
   ED5                      : constant Byte       := 16#20#;
   --  EEPROM Data Register bit 6
   ED6_Bit                  : constant Bit_Number := 6;
   ED6                      : constant Byte       := 16#40#;
   --  EEPROM Data Register bit 7
   ED7_Bit                  : constant Bit_Number := 7;
   ED7                      : constant Byte       := 16#80#;

   --  EEPROM Control Register
   DEECR                    : constant System.Address := 16#3c#;
   --  EEPROM Read Bit
   EER_Bit                  : constant Bit_Number := 0;
   EER                      : constant Byte       := 16#01#;
   --  EEPROM Load Bit
   EEL_Bit                  : constant Bit_Number := 1;
   EEL                      : constant Byte       := 16#02#;
   --  EEPROM Unlock Bit
   EEU_Bit                  : constant Bit_Number := 2;
   EEU                      : constant Byte       := 16#04#;
   --  EERPOM Busy Bit
   BSY_Bit                  : constant Bit_Number := 3;
   BSY                      : constant Byte       := 16#08#;

   --  Lock Detector Configuration register 2
   LOCKDET2                 : constant System.Address := 16#37#;
   --  Lock Count bit 0
   LC0_Bit                  : constant Bit_Number := 0;
   LC0                      : constant Byte       := 16#01#;
   --  Lock Count bit 1
   LC1_Bit                  : constant Bit_Number := 1;
   LC1                      : constant Byte       := 16#02#;
   --  Lock Count bit 2
   LC2_Bit                  : constant Bit_Number := 2;
   LC2                      : constant Byte       := 16#04#;
   --  Unlock Count bit 0
   ULC0_Bit                 : constant Bit_Number := 3;
   ULC0                     : constant Byte       := 16#08#;
   --  Unlock Count bit 1
   ULC1_Bit                 : constant Bit_Number := 4;
   ULC1                     : constant Byte       := 16#10#;
   --  Unlock Count bit 2
   ULC2_Bit                 : constant Bit_Number := 5;
   ULC2                     : constant Byte       := 16#20#;
   --  Lock Always True
   LAT_Bit                  : constant Bit_Number := 6;
   LAT                      : constant Byte       := 16#40#;
   --  Enable Unlock Detect
   EUD_Bit                  : constant Bit_Number := 7;
   EUD                      : constant Byte       := 16#80#;

   --  VCO Tuning Register
   VCOTUNE                  : constant System.Address := 16#36#;
   --  VCO Tuning Register bit 0
   VCOTUNE0_Bit             : constant Bit_Number := 0;
   VCOTUNE0                 : constant Byte       := 16#01#;
   --  VCO Tuning Register bit 1
   VCOTUNE1_Bit             : constant Bit_Number := 1;
   VCOTUNE1                 : constant Byte       := 16#02#;
   --  VCO Tuning Register bit 2
   VCOTUNE2_Bit             : constant Bit_Number := 2;
   VCOTUNE2                 : constant Byte       := 16#04#;
   --  VCO Tuning Register bit 3
   VCOTUNE3_Bit             : constant Bit_Number := 3;
   VCOTUNE3                 : constant Byte       := 16#08#;
   --  VCO Tuning Register bit 4
   VCOTUNE4_Bit             : constant Bit_Number := 4;
   VCOTUNE4                 : constant Byte       := 16#10#;
   --  VCO Voltage Detector bit 0
   VCOVDET0_Bit             : constant Bit_Number := 6;
   VCOVDET0                 : constant Byte       := 16#40#;
   --  VCO Voltage Detector bit 1
   VCOVDET1_Bit             : constant Bit_Number := 7;
   VCOVDET1                 : constant Byte       := 16#80#;

   --  Power Attenuation Control Register
   PWR_ATTEN                : constant System.Address := 16#34#;
   --  Power Control Fine bit 0
   PCF0_Bit                 : constant Bit_Number := 0;
   PCF0                     : constant Byte       := 16#01#;
   --  Power Control Fine bit 1
   PCF1_Bit                 : constant Bit_Number := 1;
   PCF1                     : constant Byte       := 16#02#;
   --  Power Control Fine bit 2
   PCF2_Bit                 : constant Bit_Number := 2;
   PCF2                     : constant Byte       := 16#04#;
   --  Power Control Coarse bit 0
   PCC0_Bit                 : constant Bit_Number := 3;
   PCC0                     : constant Byte       := 16#08#;
   --  Power Control Coarse bit 1
   PCC1_Bit                 : constant Bit_Number := 4;
   PCC1                     : constant Byte       := 16#10#;
   --  Power Control Coarse bit 2
   PCC2_Bit                 : constant Bit_Number := 5;
   PCC2                     : constant Byte       := 16#20#;

   --  Transmit Control Register
   TX_CNTL                  : constant System.Address := 16#32#;
   --  PLL Lock
   LOC_Bit                  : constant Bit_Number := 2;
   LOC                      : constant Byte       := 16#04#;
   --  Transmitter Key
   TXK_Bit                  : constant Bit_Number := 4;
   TXK                      : constant Byte       := 16#10#;
   --  Transmitter Enable
   TXE_Bit                  : constant Bit_Number := 5;
   TXE                      : constant Byte       := 16#20#;
   --  FSK Mode
   FSK_Bit                  : constant Bit_Number := 6;
   FSK                      : constant Byte       := 16#40#;

   --  Lock Detector Configuration Register 1
   LOCKDET1                 : constant System.Address := 16#30#;
   --  Cycle Slip Counter bit 0
   CS0_Bit                  : constant Bit_Number := 0;
   CS0                      : constant Byte       := 16#01#;
   --  Cycle Slip Counter bit 1
   CS1_Bit                  : constant Bit_Number := 1;
   CS1                      : constant Byte       := 16#02#;
   --  Black Out Disable
   BOD_Bit                  : constant Bit_Number := 2;
   BOD                      : constant Byte       := 16#04#;
   --  Enable Key On Bit
   ENKO_Bit                 : constant Bit_Number := 3;
   ENKO                     : constant Byte       := 16#08#;
   --  Unlock Conuter Control
   UPOK_Bit                 : constant Bit_Number := 4;
   UPOK                     : constant Byte       := 16#10#;



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


end AVR.AT86RF401;
