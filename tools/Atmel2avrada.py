#! /usr/bin/env python
#
# Copyright (c) 2004  Theodore A. Roth
# Copyright (c) 2005, 2007, 2008  Rolf Ebert
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
#
# $Id: Atmel2avrada.py 864 2008-11-08 12:18:15Z Rolf_Ebert $
#

import string
from xml.parsers import expat

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
        element = Element(name.encode(Xml2Obj.encoding),attributes)
        
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
        if string.strip(data):
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

def convert_vect_addr (addr):
    """Atmel defines vector addresses as 16-bits wide words in the atmel files
    while avr-libc defines them as byte addresses.

    The incoming addr is a string that looks like this: '$0034'

    We will convert that into a number and store it internally as such.
    """
    if addr[0] != '$':
        raise NotHexNumberErr, addr

    return int (addr[1:], 16) * 2

def print_wrapped (indent, line):
    ilen = len (indent)
    llen = len (line)
    print indent[:-1],
    if ilen + llen > 75:
        i = 75 - ilen
        while i:
            if line[i] == ' ':
                print line[:i]
                print_wrapped (indent+'  ', line[i+1:])
                break
            i -= 1
        else:
            # Couldn't find a place to wrap before col 75, try to find one
            # after.
            i = 76 - ilen
            while i < llen:
                if line[i] == ' ':
                    print line[:i]
                    print_wrapped (indent+'  ', line[i+1:])
                    break
                i += 1
            else:
                # Give up and just print the line.
                print line
    else:
        print line


def dump_instruction_core_info (root, depth=0):
    try:
        core = root.getSubTree (['AVRPART', 'CORE', 'CORE_VERSION']).getData()
    except:
        core = 'V0'
        # The part description file for ATtiny28 does not contain a
        # core version.  We set it to the simplest available
        
    print
    print '   --'
    print '   --  available assembler instructions'
    print '   --'
    print '   --  type to designate the instruction core of the devices.  See'
    print '   --  the help file of Atmel\'s "AVR Assembler 2".'
    print '   type Instruction_Core_Type is (V0, V0E, V1, V2, V2E, V3);'
    print '   Instruction_Core  : constant Instruction_Core_Type',
    print ':= %s;' % (core)

    lpm_ext = 0
    if core == 'V2E' or core == 'V3':
        lpm_ext = 1
    else:
        if core == 'V2':
            new_instr = root.getSubTree (['AVRPART',
                                          'CORE',
                                          'NEW_INSTRUCTIONS']).getData()
            if new_instr == '[lpm rd,z+]':
                lpm_ext = 1
            
    
    print '   Have_lpm_rd_Zplus : constant Boolean               :=',
    if lpm_ext :
        print 'True;'
    else:
        print 'False;'

    print '   EEprom_8bit_Addr  : constant Boolean               :='
    print '     (EEprom_Size <= 16#0100#);'
    print
        
    
def dump_header (root, boot=0, depth=0):
    print '---------------------------------------------------------------------------'
    print '-- The AVR-Ada Library is free software;  you can redistribute it and/or --'
    print '-- modify it under terms of the  GNU General Public License as published --'
    print '-- by  the  Free Software  Foundation;  either  version 2, or  (at  your --'
    print '-- option) any later version.  The AVR-Ada Library is distributed in the --'
    print '-- hope that it will be useful, but  WITHOUT ANY WARRANTY;  without even --'
    print '-- the  implied warranty of MERCHANTABILITY or FITNESS FOR A  PARTICULAR --'
    print '-- PURPOSE. See the GNU General Public License for more details.         --'
    print '--                                                                       --'
    print '-- As a special exception, if other files instantiate generics from this --'
    print '-- unit,  or  you  link  this  unit  with  other  files  to  produce  an --'
    print '-- executable   this  unit  does  not  by  itself  cause  the  resulting --'
    print '-- executable to  be  covered by the  GNU General  Public License.  This --'
    print '-- exception does  not  however  invalidate  any  other reasons why  the --'
    print '-- executable file might be covered by the GNU Public License.           --'
    print '---------------------------------------------------------------------------'

    name = root.getSubTree (['AVRPART', 'ADMIN', 'PART_NAME']).getData()
    print
    print 'with System;                   use System;  --   make Address visible'
    print 'with Interfaces;               use Interfaces;'
    print
    if boot:
        print 'package AVR.%s.Bootloader is' % (name)
        print '   pragma Preelaborate;'
        print 
    else:
        print 'package AVR.%s is' % (name)
        print '   pragma Preelaborate;'
        print
    
    # Avoid CVS changing ID in python script.
    print '   CVS_Version : constant String := "%s";' % ('$'+'Id$')
    print
    

def dump_footer (root, boot=0):
    name = root.getSubTree (['AVRPART', 'ADMIN', 'PART_NAME']).getData()
    print
    if boot:
        print 'end AVR.%s.Bootloader;' % (name)
    else:
        print 'end AVR.%s;' % (name)


def dump_memory_sizes (root):
    path = ['AVRPART', 'MEMORY']
    mem = root.getSubTree (path)

    flash_size = int (mem.getElements ('PROG_FLASH')[0].getData ())
    eep_size = int (mem.getElements ('EEPROM')[0].getData ())

    isram = mem.getSubTree (['MEMORY', 'INT_SRAM'])
    if isram:
        isram_size = int (isram.getElements ('SIZE')[0].getData ())
        if isram_size :
            isram_start = isram.getElements ('START_ADDR')[0].getData ()[1:]
        else:
            isram_start = 0
    else:
        isram_size = 0
        isram_start = 0
        
    xsram = mem.getSubTree (['MEMORY', 'EXT_SRAM'])
    if xsram:
        xsram_size = int (xsram.getElements ('SIZE')[0].getData ())
        xsram_start = xsram.getElements ('START_ADDR')[0].getData ()
        if xsram_start == 'NA' or xsram_start == 'N/A':
            xsram_size = 0
            xsram_start = 0
        else:
            xsram_start = xsram_start[1:]
    else:
        xsram_size = 0
        xsram_start = 0
        
    print
    print '   --'
    print '   --  memory sizes'
    print '   --'
    print '   Flash_Size               : constant := 16#%04x#;' % (flash_size)
    print '   Flash_End                : constant := 16#%04x#;' % (flash_size-1)
    print '   EEprom_Size              : constant := 16#%04x#;' % (eep_size)
    if eep_size > 0:
        print '   E2end                    : constant := 16#%04x#;' % (eep_size-1)
    else:
        print '   E2end                    : constant := 0;'

    print '   Int_SRAM_Start_Addr      : constant := 16#%s#;' % (isram_start)
    print '   Int_SRAM_Size            : constant := 16#%x#;' % (isram_size)
    if xsram_start:
        print '   Ext_SRAM_Start_Addr      : constant := 16#%s#;' % (xsram_start)
#    print '   Ext_SRAM_Size            : constant := 16#%x#;' % (xsram_size)


def dump_vectors (root):
    """Get the interupt vectors.
    """
    path = [ 'AVRPART', 'INTERRUPT_VECTOR' ]

    irqs = root.getSubTree (path)

    if irqs:
        nvects = int (irqs.getElements ('NMB_VECTORS')[0].getData ())

        vectors = []
        for i in range (1, nvects+1):
            try:
                vect = irqs.getElements ('VECTOR%d' % (i))[0]

                name = vect.getElements ('SOURCE')[0].getData ()
                #  correct some naming problems in Atmel's XML files
                # oldname = name
                name = name.replace (", ", "_")
                name = name.replace (",", "_")
                name = name.replace ("/", "")
                name = name.replace (" ", "_")
                saddr = vect.getElements ('PROGRAM_ADDRESS')[0].getData ()
                desc = vect.getElements ('DEFINITION')[0].getData ()
                # if name != oldname :
                #    print 'XML name: "%s", Id: "%s"' % (oldname, name)
                    
                addr = convert_vect_addr (saddr)

                vectors.append ((addr, name, desc))
            except:
                name = 'DUMMY' #  statement needed for Python syntax

        # Determine the size of the vector insn from the address of
        # the 2nd vector.
        insn_size = vectors[1][0]
    else:
        nvects = 0
        vectors = []
        
    print
    print '   --'
    print '   --  interrupts'
    print '   --'
    print '   Number_Of_Interrupts     : constant := %d;' % (nvects)
    print
    
    n = 0
    for v in vectors:
        print_wrapped ('   --  ', v[2].strip())
        print '   Sig_%-20s : constant        := %2d;' % (v[1], n) 
        print '   Sig_%-20s : constant String := "__vector_%d";' % (v[1] + "_String", n)
        n += 1
    print
    print


def gather_io_info (root):
    """
    The bit information may be spread across multiple IO_MODULES.

    Man that sucks. :-(

    Oh, and it gets worse. They have duplicate bit elements, but the
    duplicates are not quite complete (see SFIOR in the mega128 file). Now,
    why couldn't they just list all the register info in a single linear
    table, then in the modules, just list the registers used by the module and
    look up the register info in the linear table?

    So what we will do is walk all modules the extract register info and put
    that info into a dictionary so we can look it up later.
    """
    io_reg_info = {}

    path = ['AVRPART', 'IO_MODULE']
    io_module = root.getSubTree (path)

    # Get the list of all modules.
    mod_list = io_module.getElements ('MODULE_LIST')[0].getData ()
    mod_list = mod_list[1:-1].split (':')

    for mod in mod_list:
        # Get the list of registers for the module.
        path = ['IO_MODULE', mod, 'LIST']
        reg_list = io_module.getSubTree (path).getData ()
        reg_list = reg_list[1:-1].split (':')
        for reg in reg_list:
            path[2] = reg
            element = io_module.getSubTree (path)
            if io_reg_info.has_key (reg):
                # NOTE: The ATtiny2313.xml has a bug (There's 2 'ICR1H'
                # entries in the reg list) that causes the following for loop
                # to go infinite. Argh! Removing the extra entry seems to get
                # things working again.
                for child in element.getElements ():
                    io_reg_info[reg].AddChild (child, element.depth+1)
            else:
                io_reg_info[reg] = element

    return io_reg_info

def dump_ioregs (root):
    path = ['AVRPART', 'MEMORY', 'IO_MEMORY']
    io_mem = root.getSubTree (path)
    ioregs = io_mem.getElements ()

    ioreg_info_dict = gather_io_info (root)

    reg_name_used = {}
    bit_name_used = {}
    # keep track of which names for bits have already been created.
    # Ada requires a common namespace for all constants, but Atmel
    # assigns the same bitname for several registers, namely the bit
    # names for the USARTx registers are the same for at90can128

    print '   --'
    print '   --  I/O registers'
    print '   --'
    print


    # Skip the first 6 elements since they just give start and stop
    # addresses.

    for ioreg in ioregs[6:]:
        name = ioreg.name
        try:
            reg_info = ioreg_info_dict[name]
            try:
                reg_desc = reg_info.getElements ('DESCRIPTION')[0].getData ()
            except IndexError:
                reg_desc = ''
        except KeyError:
            reg_info = None
            reg_desc = ''

        if reg_desc:
            print '   --  %s' % (reg_desc.strip())

        addr = ioreg.getElements ('IO_ADDR')[0].getData ()
        if addr == '':
            addr = "NA"
        if addr[0] == '$':
            addr = addr[1:]
        if addr == "NA":
            addr = ioreg.getElements ('MEM_ADDR')[0].getData ()
            if addr == '':
                addr = '0'
            if addr[0] == '$':
                addr = addr[1:]
            addr = int (addr, 16)
        else:
            # Add 0x20 so all addresses are memory mapped.
            addr = int (addr, 16) + 0x20
        addr_t = 'Address'

        # generate register only if address != 0 exists
        if addr != 0:

            #
            # output of general 8bit registers
            #
            print '   %-24s : constant %-10s := 16#%02x#;' % ((name + '_Addr'), addr_t, addr)
            reg_name_used[name] = True


            # see, if we have a 16bit register:
            # - the name ends in ...L
            # - another register exists that has the same leading part and 
            #   that ends in ...H
            # - the address of the ...H register is ...L + 1

            if name[-1:] == 'L' and ioreg_info_dict.has_key(name[:-1]+'H'):
                print '   %-24s : Unsigned_16;' % (name[:-1])
                print '   for %s\'Address use %s;' % (name[:-1], (name + '_Addr'))
                print '   pragma Volatile (%s);' % (name[:-1])
                reg_name_used[name[:-1]] = True

            
            print '   %-24s : Unsigned_8 ;' % (name)
            print '   for %s\'Address use %s;' % (name, (name + '_Addr')) 
            print '   pragma Volatile (%s);' % (name)
            print '   %-24s : Bits_In_Byte;' % (name + '_Bits')
            print '   for %s\'Address use %s;' % ((name + '_Bits'), (name + '_Addr')) 
            print '   pragma Volatile (%s);' % (name + '_Bits')

        for i in range (8):
            if reg_info is None:
                continue
            bit = 'BIT%d' % (i)
            bit_el = reg_info.getSubTree ([name, bit])
            if bit_el is None:
                continue
            bit_name = bit_el.getElements ('NAME')[0].getData ()
            # bit_name = bit_name + '_Bit'
            bit_name = bit_name.replace ("-", "_")
            if bit_name == 'OR' :
                bit_name = 'OR_Bit'
            
            # if this bit name has been created before, skip it now
            # assuming that it got the same value as before
            if (not bit_name_used.has_key(bit_name)):
                try:
                    bit_desc = bit_el.getElements ('DESCRIPTION')[0].getData ()
                except IndexError:
                    bit_desc = ''

                if bit_desc:
                    print_wrapped ('   --  ', bit_desc.strip())
                if reg_name_used.has_key(bit_name):
                    print '--',
                print '   %-24s : constant Bit_Number := %d;' % (bit_name + '_Bit', i)
                if reg_name_used.has_key(bit_name):
                    print '--',
                print '   %-24s : constant Unsigned_8 := 16#%02x#;' % (bit_name + '_Mask', 2**i)
                bit_name_used[bit_name] = 1
            # don't do anything if the name was already generated
        print
    print
    

def dump_boot_info (root):
    path = ['AVRPART', 'MEMORY', 'BOOT_CONFIG']

    info = root.getSubTree (path)
    if info:
        # The device has bootloader support.
        
        try:
            data = info.getElements ('NRWW_START_ADDR')[0].getData ()
        except:
            return
        
        if data[0] == '$':
            data = data[1:]
        if data == 'x' or data == 'NA':
            nrww_start = 0
        else:
            nrww_start = int (data, 16)
        
        data = info.getElements ('NRWW_STOP_ADDR')[0].getData ()
        if data[0] == '$':
            data = data[1:]
        if data == 'x' or data == 'NA':
            nrww_end = 0
        else:
            nrww_end = int (data, 16)
        
        data = info.getElements ('RWW_START_ADDR')[0].getData ()
        if data[0] == '$':
            data = data[1:]
        if data == 'x' or data == 'NA':
            rww_start = 0
        else:
            rww_start = int (data, 16)

        data = info.getElements ('RWW_STOP_ADDR')[0].getData ()
        if data[0] == '$':
            data = data[1:]
        if data == 'x' or data == 'NA':
            rww_end = 0
        else:
            rww_end = int (data, 16)

        # The Atmel files give the pagesize in words, we need it in bytes.
        
        pagesize = 2 * int (info.getElements ('PAGESIZE')[0].getData ())

        print '   --'
        print '   --  bootloader'
        print '   --'
        print '   Pagesize   : constant := %d;' % (pagesize)
        print '   rww_Start  : constant := 16#%04x#;' % (rww_start)
        print '   rww_End    : constant := 16#%04x#;' % (rww_end)
        print '   nrww_Start : constant := 16#%04x#;' % (nrww_start)
        print '   nrww_End   : constant := 16#%04x#;' % (nrww_end)
        print
        print '   type Boot_Info_Type is record'
        print '      Pages : Unsigned_8;'
        print '      Start : System.Address;'
        print '   end record;'
        print '   pragma Style_Checks (Off);'
        
        first_line_printed = False;
        
        for i in range (8):
            try:
                mode = info.getElements ('BOOTSZMODE%d' % (i))[0]
            except IndexError:
                continue

            data = mode.getElements ('PAGES')[0].getData ()
            if data == 'x':
                data = 'FIXME!'
            pages = data

            data = mode.getElements ('BOOTSTART')[0].getData ()
            if data[0] == '$':
                data = '16#' + data[1:] + '#'
            if data == 'x':
                start = '"FIXME: Broken xml from Atmel!"'
            else:
                start = data

            if first_line_printed:
                print ','
                print '      ',
            else:
                print '   type Boot_Info_Array is array (Unsigned_8 range <>)',
                print 'of Boot_Info_Type;'
                print '   Boot_Info : constant Boot_Info_Array :='
                print '     (',
                first_line_printed = True;
                
            print '%d => (Pages => %s, Start => %s)' % (i, pages, start),

        if first_line_printed:
            print ');'
        print '   pragma Style_Checks (On);'

if __name__ == '__main__':
    import sys

    parser = Xml2Obj()
    root = parser.Parse(sys.argv[1])

    dump_header (root)
    dump_memory_sizes (root)
    dump_vectors (root)
    dump_ioregs (root)
    dump_instruction_core_info (root)
    dump_footer (root)
    
    path = ['AVRPART', 'MEMORY', 'BOOT_CONFIG']
    info = root.getSubTree (path)
    if info:
        # The device has bootloader support.
        print
        print
        print
        dump_header (root, 1)
        dump_boot_info (root)
        dump_footer (root, 1)
