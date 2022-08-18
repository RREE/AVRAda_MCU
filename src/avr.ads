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


--  The package AVR is the parent for the AVR hierarchy.  It defines
--  common alternative names for the basic integer types and some
--  other useful types.

with Ada.Unchecked_Conversion;
with Interfaces;                   use Interfaces;

package AVR is
   pragma Pure;

   --  Version information.  Named numbers are optimzed away if not used.
   AVR_Ada_Version_Major : constant := 1;
   AVR_Ada_Version_Minor : constant := 2;
   AVR_Ada_Version_Patch : constant := 0;



   type    Nibble      is mod 2 ** 4;

   subtype Nat8        is Unsigned_8;
   subtype Pos8        is Nat8 range 1 .. Nat8'Last;

   subtype Nat16       is Unsigned_16;
   subtype Pos16       is Nat16 range 1 .. Nat16'Last;

   subtype Nat32       is Unsigned_32;
   subtype Pos32       is Nat32 range 1 .. Nat32'Last;


   --  Bit_Number indexes the single bits in a byte
   type Bit_Number     is new Nat8 range 0 .. 7;


   --  Give access to every single bit in a byte as a boolean.
   type Bits_In_Byte is array (Bit_Number) of Boolean;
   pragma Pack (Bits_In_Byte);
   for Bits_In_Byte'Size use 8;
   --  It permits expressions like:
   --     Frame_Rate_Reg : Bits_In_Byte;
   --  begin
   --     Frame_Rate_Reg := (LCDCD0_Bit => True,
   --                        LCDCD1_Bit => True,
   --                        LCDCD2_Bit => True,
   --                        LCDPS0_Bit => False,
   --                        LCDPS1_Bit => False,
   --                        LCDPS2_Bit => False,
   --                        others     => False);
   function "+" is
      new Ada.Unchecked_Conversion (Source => Bits_In_Byte,
                                    Target => Unsigned_8);

   function "+" is
      new Ada.Unchecked_Conversion (Source => Unsigned_8,
                                    Target => Bits_In_Byte);

   type Nat8_Array is array (Nat8 range <>) of Nat8;
   type Int8_Array is array (Nat8 range <>) of Integer_8;

   type Nat16_Array is array (Nat8 range <>) of Nat16;
   type Int16_Array is array (Nat8 range <>) of Integer_16;

   type Nat32_Array is array (Nat8 range <>) of Nat32;
   type Int32_Array is array (Nat8 range <>) of Integer_32;


   --
   --  conversion routines
   --

   --  create a corresponding mask from a bit number, i.e. bit 3
   --  becomes 16#08#.  An easier way to achieve the same result is to
   --  use 2 ** Bit.  It generates optimal code, too, and does not
   --  require an inlined function.
   function BN (Bit : Bit_Number) return Nat8;
   pragma Inline_Always (BN);
   pragma Pure_Function (BN);


   --  alias names for GPIO register pin values
   function High return Boolean renames True;
   function Low return Boolean renames False;

   --  alias names for setting the data direction registers
   function DD_Output return Boolean renames True;
   function DD_Input return Boolean renames False;


   --  return lower part of 16 bit value as byte.
   function Low_Byte (W : Nat16) return Nat8;
   pragma Inline_Always (Low_Byte);
   pragma Pure_Function (Low_Byte);


   --  return upper part of 16 bit value as byte.
   function High_Byte (W : Nat16) return Nat8;
   pragma Inline_Always (High_Byte);
   pragma Pure_Function (High_Byte);

end AVR;
