


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

package AVR.ATmega406.Bootloader is
   pragma Pure (AVR.ATmega406.Bootloader);

   CVS_Version : constant String := "$Id: avr-atmega406-bootloader.ads 561 2006-04-22 16:03:31Z berndtrog $";

   --
   --  bootloader
   --
   Pagesize   : constant := 128;
   rww_Start  : constant := 16#0000#;
   rww_End    : constant := 16#47ff#;
   nrww_Start : constant := 16#4800#;
   nrww_End   : constant := 16#4fff#;

   type Boot_Info_Type is record
      Pages : Byte;
      Start : System.Address;
   end record;
   pragma Style_Checks (Off);
   type Boot_Info_Array is array (Byte range <>) of Boot_Info_Type;
   Boot_Info : constant Boot_Info_Array :=
     ( 1 => (Pages => 4, Start => 16#4F00#) ,
       2 => (Pages => 8, Start => 16#4E00#) ,
       3 => (Pages => 16, Start => 16#4C00#) ,
       4 => (Pages => 32, Start => 16#4800#) );
   pragma Style_Checks (On);

end AVR.ATmega406.Bootloader;
