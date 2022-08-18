


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

package AVR.ATtiny44.Bootloader is
   pragma Preelaborate;

   CVS_Version : constant String := "$Id: avr-attiny44-bootloader.ads 881 2008-11-16 22:55:31Z Rolf_Ebert $";

   --
   --  bootloader
   --
   Pagesize   : constant := 64;
   rww_Start  : constant := 16#0000#;
   rww_End    : constant := 16#0000#;
   nrww_Start : constant := 16#0000#;
   nrww_End   : constant := 16#07ff#;

   type Boot_Info_Type is record
      Pages : Unsigned_8;
      Start : System.Address;
   end record;
   pragma Style_Checks (Off);
   pragma Style_Checks (On);

end AVR.ATtiny44.Bootloader;
