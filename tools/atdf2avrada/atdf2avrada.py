#! /usr/bin/env python
#-*- coding: utf-8 -*-
#
# Copyright (c) 2004  Theodore A. Roth
# Copyright (c) 2005, 2007, 2008  Rolf Ebert
# Copyright (c) 2023 Andrii Fil [root.fi36@gmail.com] [360xfa]
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# * Redistributions of source code must retain the above copyright
#   notice, this list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright
#   notice, this list of conditions and the following disclaimer in
#   the documentation and/or other materials provided with the
#   distribution.
#
# * Neither the name of the copyright holders nor the names of
#   contributors may be used to endorse or promote products derived
#   from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

from __future__ import print_function
from xml.parsers import expat
import math

class Element:
    'A parsed XML element'

    def __init__(self,name,attributes,depth=0):
        'Element constructor'
        # The element's tag name
        self.name = name
        # The element's attribute dictionary
        self.attributes = attributes
        # The element's cdata
        self.cdata = ''
        # The element's child element list (sequence)
        self.children = []

        self.depth = depth
        
    def AddChild(self, element, depth=0):
        'Add a reference to a child element'
        element.depth = depth
        self.children.append(element)
        
    def getAttribute(self,key):
        'Get an attribute value'
        return self.attributes.get(key)
    
    def getData(self):
        'Get the cdata'
        return self.cdata
        
    def getElements(self,name=''):
        'Get a list of child elements'
        #If no tag name is specified, return the all children
        if not name:
            return self.children
        else:
            # else return only those children with a matching tag name
            elements = []
            for element in self.children:
                if element.name == name:
                    elements.append(element)
            return elements

    def getElementsByAttr(self,attr,val=''):
        'Get a list of child elements by attribute'
        #If no value is specified, return the all children
        if not val:
            return self.children
        else:
            # else return only those child elements with a successful match
            elements = []
            for element in self.children:
                if element.getAttribute(attr) == val:
                    elements.append(element)
            return elements

    def getElementByAttr(self,attr,val=''):
        'Get a first of child elements by attribute'
        #If no value is specified, return the all children
        if not val:
            return self.children
        else:
            # else return the first matched element
            for element in self.children:
                if element.getAttribute(attr) == val:
                    return element

    def getSubTree (self, path):
        '''Path is a list of element names.
        The last element of the path is returned or None if the element is
        not found. The first name in path, should match self.name.

        This does not work if there are many children with the same name.
        '''
        if self.name != path[0]:
            return None

        if len (path) == 1:
            # We're are the last element in the path.
            return self

        for child in self.children:
            if child.name == path[1]:
                return child.getSubTree (path[1:])

        return None

    def __repr__(self):
        indent = '  ' * self.depth
        s ='%s[ %s, %s, "%s", {' % (indent, self.name, self.attributes,
                                      self.cdata)
        cs = ''
        for c in self.children:
            cs += '\n%s' % (c)

        if len (cs):
            s += '%s\n%s}]' % (cs,indent)
        else:
            s += '}]'

        return s

class Xml2Obj:
    'XML to Object'

    encoding = 'utf-8'
    
    def __init__(self):
        self.root = None
        self.nodeStack = []
        
    def StartElement(self,name,attributes):
        'SAX start element even handler'
        # Instantiate an Element object
        element = Element(name,attributes)
        
        # Push element onto the stack and make it a child of parent
        if len(self.nodeStack) > 0:
            parent = self.nodeStack[-1]
            parent.AddChild(element, parent.depth+1)
        else:
            self.root = element
        self.nodeStack.append(element)
        
    def EndElement(self,name):
        'SAX end element event handler'
        self.nodeStack = self.nodeStack[:-1]

    def CharacterData(self,data):
        'SAX character data event handler'
        if data.strip():
            data = data.encode(Xml2Obj.encoding)
            element = self.nodeStack[-1]
            element.cdata += data
            return

    def Parse(self,filename):
        # Create a SAX parser
        Parser = expat.ParserCreate()

        # SAX event handlers
        Parser.StartElementHandler = self.StartElement
        Parser.EndElementHandler = self.EndElement
        Parser.CharacterDataHandler = self.CharacterData

        # Parse the XML File
        ParserStatus = Parser.Parse(open(filename,'r').read(), 1)
        
        return self.root


class Str:
    def __init__ (self, init_data=""):
        self.data = init_data

    def write (self, *args):
        self.data += " ".join(map(str, args)) + "\n"

    def __repr__ (self):
        return self.data

    def has_data (self):
        return self.data != ""


class Register:
    def __init__ (self, name, mask, caption, bitfields, addr, size):
        self.name = name
        self.mask = mask
        self.caption = caption
        self.bitfields = bitfields
        self.addr = addr
        self.size = size


def create_registers (obj):
    result = []
    size = int (obj.getAttribute ('size'))
    name = obj.getAttribute ('name')
    mask = obj.getAttribute ('mask')
    if mask is not None:
        mask = int (mask, 16)
    if mask == 0:
        return []
    addr = int (obj.getAttribute ('offset'), 16)
    size = int (obj.getAttribute ('size'))
    caption = obj.getAttribute ('caption')
    if caption is None:
        caption = "[%s]" % name
    reg_bitfields = obj.getElements ('bitfield')
    # default_bits_name = name
    # default_bits_caption = caption

    # if size == 2:
    #     if reg_bitfields:
    #         if len (reg_bitfields) > 1:
    #             print (name)
    #             raise ValueError
    #         bitfield_mask = int (reg_bitfields[0].getAttribute ('mask'), 16)
    #         if bitfield_mask == mask or mask is None:
    #             mask = bitfield_mask
    #             # default_bits_name = reg_bitfields[0].getAttribute ('name')
    #             # default_bits_caption = reg_bitfields[0].getAttribute ('caption')
    #             # reg_bitfields = []
    #         else:
    #             raise ValueError
    #     if mask is None:
    #         raise ValueError
        
    if mask is None:
        mask = 2 ** (8 * size) - 1

    if size == 2:
        name_h = name + "H"
        mask_h = mask >> 8
        bitfields_h = []
        caption_h = caption + " High Byte"
    elif size != 1:
        raise ValueError

    bitfields = []
    for bit in reg_bitfields:
        bit_name = bit.getAttribute ('name')
        bit_mask = int (bit.getAttribute ('mask'), 16)
        bit_caption = bit.getAttribute ('caption')
        if bit_mask > 0xffff:
            raise ValueError
        lsb = bit.getAttribute ('lsb')
        if lsb is None:
            bit_lsb = 0
        else:
            bit_lsb = int (lsb)
        if not bit_caption:
            bit_caption = "%s" % bit_name

        if size == 2:
            bit_mask_h = bit_mask >> 8
            bit_mask &= 0xff
            if bit_mask:
                bitfields += create_bitfields (bit_name, bit_mask, bit_caption, bit_lsb)
            if bit_mask_h:
                bitfields_h += create_bitfields (bit_name, bit_mask_h , bit_caption, bit_lsb + bin (bit_mask).count ('1'))
            bit_name += "L"
            caption_h = caption + " High"
            caption += " Low"
        else:
            bitfields += create_bitfields (bit_name, bit_mask, bit_caption, bit_lsb)

    if not bitfields:
        if size == 2:
            if mask == 0xffff:
                # name += "L"
                mask &= 0xff
                caption_h = caption + " High Byte"
                caption += " Low Byte"
                bitfields = create_bitfields (name + "L", mask, caption, 0)
                bitfields_h = create_bitfields (name_h, mask_h, caption_h, 0)
            else:
                mask &= 0xff
                bitfields = create_bitfields (name, mask, caption, 0)
                bitfields_h = create_bitfields (name, mask_h, caption, 8)
                # name += "L"
                caption_h = caption + " High"
                caption += " Low"
        else:
            bitfields = create_bitfields (name, mask & 0xff, caption, 0)

    if size == 2:
        name += "L"
        mask &= 0xff
        result.append (Register (name_h, mask_h, caption_h, bitfields_h, addr + 1, 1))

    result.append(Register (name, mask, caption, bitfields, addr, size))
    return result


def create_bitfields (name, mask, caption, bit_lsb):
    mask_s = bin (mask)[:1:-1]
    is_multiple = not math.log(mask, 2).is_integer()
    i = bit_lsb
    bitfields = []
    for pos, b in enumerate(mask_s):
        if b != '1':
            continue
        bit = Bitfield ()
        if is_multiple or bit_lsb > 0:
            i_s = str (i)
            bit.caption = caption + (" bit %i" % i)
        else:
            i_s = ""
            bit.caption = caption
        bit.pos = pos
        bit.mask = 2**pos
        bit.name = "%s%s" % (name, i_s)
        i += 1

        bitfields.append(bit)

    return bitfields

class Bitfield:
    def __init__ (self):
        self.name = None
        self.mask = None
        self.caption = None
        self.values = None
        self.pos = None


class ATDF2Ada:
    def __init__ (self, root, path):
        self.root = root
        self.__out_s = Str ()
        self.all_names = []

        self.name = self.root.getSubTree (['avr-tools-device-file', 'devices', 'device']).getAttribute ('name')

        _mem = self.root.getSubTree (['avr-tools-device-file', 'devices', 'device', 'address-spaces'])
        if _mem.getElementByAttr ('name', 'prog').getElementByAttr ('name', 'FLASH') is None:
            print ("Ignore", self.name)
            return
        _periph = self.root.getSubTree (['avr-tools-device-file', 'devices', 'device', 'peripherals'])
        _params = _periph.getElementByAttr ('name', 'CPU').getSubTree (['module', 'instance', 'parameters'])
        _param_core_ver = _params .getElementByAttr ('name', 'CORE_VERSION')
        _core = _param_core_ver.getAttribute ('value')
        if _core not in ("V0", "V0E", "V1", "V2", "V2E", "V3"):
            print ("Ignore core", self.name)
            return

        out_name = self.name.lower ()
        import os
        out_dir = os.path.join (path, out_name)
        if not os.path.exists (out_dir):
            os.makedirs (out_dir)
        out_boot = os.path.join (out_dir, "avr-%s-bootloader.ads" % out_name)
        out_main = os.path.join (out_dir, "avr-%s.ads" % out_name)
        out_mcu = os.path.join (out_dir, "avr-mcu.ads")

        self.dump_header ()
        self.dump_memory_sizes ()
        self.dump_vectors ()
        self.dump_ioregs ()
        self.dump_instruction_core_info ()
        self.dump_footer ()
        with open(out_main, "w") as f:
            f.write(str(self.__out_s))

        self.__out_s = Str ()
        self.dump_header (boot=True)
        self.dump_boot_info ()
        self.dump_footer (boot=True)
        with open(out_boot, "w") as f:
            f.write(str(self.__out_s))

        self.__out_s = Str ()
        self.dump_avr_mcu ()
        with open(out_mcu, "w") as f:
            f.write(str(self.__out_s))

        print("Generated", self.name)


    def write (self, *args):
        self.__out_s.write(*args)


    def dump_avr_mcu (self):
        self.write ('pragma Style_Checks (Off);')
        self.write ('with AVR.%s;' % self.name.lower())
        self.write ('package AVR.MCU renames AVR.%s;' % self.name.lower())


    def dump_instruction_core_info (self):
        periph = self.root.getSubTree (['avr-tools-device-file', 'devices', 'device', 'peripherals'])
        params = periph.getElementByAttr ('name', 'CPU').getSubTree (['module', 'instance', 'parameters'])
        param_core_ver = params .getElementByAttr ('name', 'CORE_VERSION')
        param_new_instr = params .getElementByAttr ('name', 'NEW_INSTRUCTIONS')
        core = param_core_ver.getAttribute ('value')
        if core not in ("V0", "V0E", "V1", "V2", "V2E", "V3"):
            raise ValueError
            
        self.write ()
        self.write ('   --')
        self.write ('   --  available assembler instructions')
        self.write ('   --')
        self.write ('   --  type to designate the instruction core of the devices.  See')
        self.write ('   --  the help file of Atmel\'s "AVR Assembler 2".')
        self.write ('   type Instruction_Core_Type is (V0, V0E, V1, V2, V2E, V3);')
        self.write ('   Instruction_Core  : constant Instruction_Core_Type := %s;' % core)

        lpm_ext = False
        if core == 'V2E' or core == 'V3':
            lpm_ext = True
        elif core == 'V2' and param_new_instr is not None and param_new_instr.getAttribute ('value') == 'lpm rd,z+':
            lpm_ext = True
        
        self.write ('   Have_lpm_rd_Zplus : constant Boolean               := %s;' % str (lpm_ext))

        self.write ('   EEprom_8bit_Addr  : constant Boolean               :=')
        self.write ('     (EEprom_Size <= 16#0100#);')


    def dump_header (self, boot=0):
        self.write ('---------------------------------------------------------------------------')
        self.write ('-- The AVR-Ada Library is free software;  you can redistribute it and/or --')
        self.write ('-- modify it under terms of the  GNU General Public License as published --')
        self.write ('-- by  the  Free Software  Foundation;  either  version 2, or  (at  your --')
        self.write ('-- option) any later version.  The AVR-Ada Library is distributed in the --')
        self.write ('-- hope that it will be useful, but  WITHOUT ANY WARRANTY;  without even --')
        self.write ('-- the  implied warranty of MERCHANTABILITY or FITNESS FOR A  PARTICULAR --')
        self.write ('-- PURPOSE. See the GNU General Public License for more details.         --')
        self.write ('--                                                                       --')
        self.write ('-- As a special exception, if other files instantiate generics from this --')
        self.write ('-- unit,  or  you  link  this  unit  with  other  files  to  produce  an --')
        self.write ('-- executable   this  unit  does  not  by  itself  cause  the  resulting --')
        self.write ('-- executable to  be  covered by the  GNU General  Public License.  This --')
        self.write ('-- exception does  not  however  invalidate  any  other reasons why  the --')
        self.write ('-- executable file might be covered by the GNU Public License.           --')
        self.write ('---------------------------------------------------------------------------')
        self.write ('-- This file is automatically generated using the atdf2ada tool.         --')
        self.write ('---------------------------------------------------------------------------')

        self.write ()
        self.write ('with System;                   use System;  --   make Address visible')
        self.write ('with Interfaces;               use Interfaces;')
        self.write ()
        if boot:
            self.write ('package AVR.%s.Bootloader is' % (self.name))
            self.write ('   pragma Preelaborate;')
            self.write ()
        else:
            self.write ('package AVR.%s is' % (self.name))
            self.write ('   pragma Preelaborate;')
        

    def dump_footer (self, boot=False):
        self.write ()
        if boot:
            self.write('end AVR.%s.Bootloader;' % (self.name))
        else:
            self.write('end AVR.%s;' % (self.name))

    def dump_memory_sizes (self):
        mem = self.root.getSubTree (['avr-tools-device-file', 'devices', 'device', 'address-spaces'])

        flash_size = int (mem.getElementByAttr ('name', 'prog').getElementByAttr ('name', 'FLASH').getAttribute ('size'), 16)
        eep_obj = mem.getElementByAttr ('name', 'eeprom')
        if eep_obj:
            eep_size = int (eep_obj.getElementByAttr ('name', 'EEPROM').getAttribute ('size'), 16)
        else:
            eep_size = 0

        isram = mem.getElementByAttr ('name', 'data').getElementByAttr ('name', 'IRAM')
        if isram:
            isram_size = int (isram.getAttribute ('size'), 16)
            isram_start = int (isram.getAttribute ('start'), 16)
        else:
            isram_size = 0
            isram_start = 0
            
        xsram = mem.getElementByAttr ('name', 'data').getElementByAttr ('name', 'XRAM')
        if xsram:
            xsram_size = int (xsram.getAttribute ('size'), 16)
            xsram_start = int (xsram.getAttribute ('start'), 16)
        else:
            xsram_size = 0
            xsram_start = 0
            
        self.write ()
        self.write ('   --')
        self.write ('   --  memory sizes')
        self.write ('   --')
        self.write ('   Flash_Size               : constant := 16#%04x#;' % (flash_size))
        self.write ('   Flash_End                : constant := 16#%04x#;' % (flash_size-1))
        self.write ('   EEprom_Size              : constant := 16#%04x#;' % (eep_size))
        if eep_size > 0:
            self.write ('   E2end                    : constant := 16#%04x#;' % (eep_size-1))
        else:
            self.write ('   E2end                    : constant := 0;')

        self.write ('   Int_SRAM_Start_Addr      : constant := 16#%04x#;' % (isram_start))
        self.write ('   Int_SRAM_Size            : constant := 16#%04x#;' % (isram_size))
        if xsram_start:
            self.write ('   Ext_SRAM_Start_Addr      : constant := 16#%04x#;' % (xsram_start))

    def dump_vectors (self):
        """ Get the interupt vectors.
        """
        irqs = self.root.getSubTree (['avr-tools-device-file', 'devices', 'device', 'interrupts'])

        if irqs:
            nvects = len(irqs.children)

            vectors = []
            for interrupt in irqs.children:
                name = interrupt.getAttribute ("name")

                name = name.replace (", ", "_")
                name = name.replace (",", "_")
                name = name.replace ("/", "")
                name = name.replace (" ", "_")
                index = int(interrupt.getAttribute ("index"))
                saddr = interrupt.getAttribute ("name")
                desc = interrupt.getAttribute ("caption")
                if desc is None:
                    desc = "[%s]" % name

                vectors.append ((index, name, desc))

        else:
            nvects = 0
            vectors = []

        self.write ()
        self.write ('   --')
        self.write ('   -- interrupts')
        self.write ('   --')
        self.write ('   Number_Of_Interrupts     : constant := %d;' % (nvects))
        self.write ()
        
        for v in vectors:
            self.write ('   --', v[2].strip())
            self.write ('   Sig_%-20s : constant        := %2d;' % (v[1], v[0]))
            self.write ('   Sig_%-20s : constant String := "__vector_%d";' % (v[1] + "_String", v[0]))
        self.write ()
        self.write ()


    def dump_ioregs (self):
        modules = self.root.getSubTree (['avr-tools-device-file', 'modules'])

        registers = {}
        for module in modules.getElements ("module"):
            for register_group in module.getElements ('register-group'):
                register_s = Str ()
                for register_o in register_group.getElements ('register'):
                    for register in create_registers (register_o):
                        if register.addr < 0x20:
                            continue

                        if register.name in registers:
                            # print "[INFO] merge", register.name, [b.name for b in registers[register.name].bitfields], " ++ ", [b.name for b in register.bitfields]
                            registers[register.name].bitfields += register.bitfields
                        else:
                            registers[register.name] = register

        for reg in sorted (registers.values(), key=lambda reg: reg.addr, reverse=True):
            self.write ('   --', reg.caption if reg.caption is not None else "")
            self.write ("   %-24s : constant Address    := 16#%02x#;" % (reg.name + "_Addr", reg.addr))
            if reg.size == 2:
                main_name = reg.name[:-1]
                if main_name in self.all_names:
                    start = "-- "
                else:
                    start = ""
                    self.all_names.append (main_name)
                self.write ('   %s%-24s : Unsigned_16;' % (start, main_name))
                self.write ("   %sfor %s'Address use %s_Addr;" % (start, main_name, reg.name))
                self.write ('   %spragma Volatile (%s);' % (start, main_name))
            if reg.name in self.all_names:
                start = "-- "
            else:
                start = ""
                self.all_names.append (reg.name)
            self.write ("   %s%-24s : Unsigned_8;" % (start, reg.name))
            self.write ("   %sfor %s'Address use %s_Addr;" % (start, reg.name, reg.name))
            self.write ("   %spragma Volatile (%s);" % (start, reg.name))
            self.write ("   %s%-24s : Bits_In_Byte;" % (start, reg.name + '_Bits'))
            self.write ("   %sfor %s_Bits'Address use %s_Addr;" % (start, reg.name, reg.name))
            self.write ("   %spragma Volatile (%s_Bits);" % (start, reg.name))
            for bit in sorted (reg.bitfields, key=lambda bit: bit.pos):
                self.write ('   --', bit.caption)
                bit_name_bit = bit.name + "_Bit"
                bit_name_mask = bit.name + "_Mask"
                if bit_name_bit in self.all_names:
                    start = "-- "
                else:
                    start = ""
                    self.all_names.append (bit_name_bit)
                    self.all_names.append (bit_name_mask)
                self.write ('   %s%-24s : constant Bit_Number := %i;' % (start, bit_name_bit, bit.pos))
                self.write ('   %s%-24s : constant Unsigned_8 := 16#%02x#;' % (start, bit_name_mask, bit.mask))
            self.write ()

    def dump_boot_info (self):
        prog = self.root.getSubTree (['avr-tools-device-file', 'devices', 'device', 'address-spaces']).getElementByAttr ('name', 'prog')
        start = int (prog.getAttribute ('start'), 16)
        end = int (prog.getAttribute ('size'), 16)
        boots = []
        boots_start = end
        pagesize = None
        for mem_seg in prog.getElements ('memory-segment'):
            mem_seg_name = mem_seg.getAttribute ('name')
            mem_start = int (mem_seg.getAttribute ('start'), 16)
            mem_size = int (mem_seg.getAttribute ('size'), 16)
            mem_pagesize = int (mem_seg.getAttribute ('pagesize'), 16)
            if mem_seg_name.startswith ("BOOT_SECTION_"):
                if (int (mem_seg_name[len("BOOT_SECTION_"):]) - 1) != len (boots):
                    raise IndexError
                if mem_start < boots_start:
                    boots_start = mem_start
                boots.append ((mem_start, mem_size))
            elif mem_seg_name == "FLASH":
                pagesize = mem_pagesize
            else:
                raise ValueError
            if mem_pagesize != pagesize or mem_seg.getAttribute ("type") != "flash":
                raise ValueError
        if pagesize is None:
            raise ValueError

        rww_start = start
        rww_end = (boots_start // 2 - 1) if boots else 0
        nrww_start = (boots_start // 2) if boots else 0
        nrww_end = end // 2 - 1

        self.write ('   --')
        self.write ('   --  bootloader')
        self.write ('   --')
        self.write ('   Pagesize   : constant := %d;' % (pagesize))
        self.write ('   rww_Start  : constant := 16#%04x#;' % (rww_start))
        self.write ('   rww_End    : constant := 16#%04x#;' % (rww_end))
        self.write ('   nrww_Start : constant := 16#%04x#;' % (nrww_start))
        self.write ('   nrww_End   : constant := 16#%04x#;' % (nrww_end))
        self.write ()
        self.write ('   type Boot_Info_Type is record')
        self.write ('      Pages : Unsigned_8;')
        self.write ('      Start : System.Address;')
        self.write ('   end record;')
        self.write ('   pragma Style_Checks (Off);')

        if boots:
            self.write ('   type Boot_Info_Array is array (Unsigned_8 range <>) of Boot_Info_Type;')
            self.write ('   Boot_Info : constant Boot_Info_Array :=')
            boots_repr = []
            for i, boot in enumerate(boots, 1):
                boot_start, boot_size = boot
                pages = boot_size // pagesize
                boots_repr.append ('% 2d => (Pages => %d, Start => 16#%04x#)' % (i, pages, boot_start // 2))
            self.write ("     (%s);" % ",\n      ".join (boots_repr))

        self.write ('   pragma Style_Checks (On);')


def convert (atdf_path, out_path):
    parser = Xml2Obj ()
    root = parser.Parse (atdf_path)
    ATDF2Ada (root, out_path)


if __name__ == '__main__':
    import sys
    convert (sys.argv[1], sys.argv[2])
