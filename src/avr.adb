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


package body AVR is


   function BN (Bit : Bit_Number) return Nat8 is
   begin
      return Shift_Left (Nat8'(1), Natural (Bit));
   end BN;


   --  return lower part as byte.  A simple type conversion
   function Low_Byte (W : Nat16) return Nat8 is
   begin
      return Nat8 (W and 16#00FF#);
   end Low_Byte;


   --  return upper part as byte.
   function High_Byte (W : Nat16) return Nat8 is
   begin
      return Nat8 (W / 256);
   end High_Byte;


end AVR;

