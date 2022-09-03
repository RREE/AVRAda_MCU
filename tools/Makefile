###########################################################################
## The AVR-Ada Library is free software;  you can redistribute it and/or ##
## modify it under terms of the  GNU General Public License as published ##
## by  the  Free Software  Foundation;  either  version 2, or  (at  your ##
## option) any later version.  The AVR#Ada Library is distributed in the ##
## hope that it will be useful, but  WITHOUT ANY WARRANTY;  without even ##
## the  implied warranty of MERCHANTABILITY or FITNESS FOR A  PARTICULAR ##
## PURPOSE. See the GNU General Public License for more details.         ##
###########################################################################

# The ATMEL XML files are typically installed in 
#   C:\Program Files\AVR Tools\Partdescriptionfiles
# GNU make on Windows does not like spaces in file or directory names.
# You better copy the XML files into another directory without spaces
# in the name!
XML_DIR      := C:/Programme/Atmel/AVR_Tools/Partdescriptionfiles
AVR_Ada_Home := K:/Data/Development/AVR-Ada
xmlconverter := $(AVR_Ada_Home)/tools/XML/Atmel2avrada.py

# we don't generate device specs for the following devices
excluded_parts := at86rf401 attiny28 attiny4 attiny15 attiny12 attiny11 at90s1200 \
   at89s51 at89s52 at90s8535comp atmega103comp \
   atmega161comp atmega406 at90s8515comp at90pwm2b at90pwm3b at90pwm324 \
   atmega16hva atmega2560 atmega2561 atmega32c1 atmega32hvb atmega32m1 atmega32u4 atmega48p at86rf401 \
   attiny24 attiny261 attiny43u attiny461 attiny861 \
   atxmega256a3 atxmega256a3b atxmega128a1 atxmega128a3 atxmega64a1 atxmega64a3 atxmega128a1_revd atmega16u4 

# all XML files in the XML_DIR.  Use the shell function with 'cd',
# rather than wildcard and nondir function due to possible blanks in
# the AVR installation path.
xml_files    := $(shell cd $(XML_DIR); echo *.xml)

# the devices are the lowercase XML filenames without filename
# extension.
devices      := $(shell echo $(patsubst %.xml,%,$(xml_files)) | tr A-Z a-z)

# we don't support some of the ATMEL devices, strip them out
supported_devices := $(filter-out $(excluded_parts), $(devices))

# the filenames of the device specs are built with a leading 'avr-'
# and the file extension '.ads'.
device_specs := $(patsubst %,avr-%.ads,$(supported_devices))

# the unpatched local files get a .raw extension
unpatched_specs := $(patsubst %,avr-%.raw,$(supported_devices))

# we modify some device specs "manually" after generation ...
local_diffs := $(patsubst %,%.udiff,$(supported_devices))

# the installation path of the device specs is the avr/<devicename> directory
install_dirs := $(patsubst %,$(AVR_Ada_Home)/avr/%,$(supported_devices))

installed_specs := $(patsubst %,$(AVR_Ada_Home)/avr/%/avr-%.ads,$(supported_devices))


#
# here start the targets and rules
#

all: $(device_specs) ; 

# just define dependency, but no command
unpatched_specs : $(xmlconverter) ;


# the selective vpath directive does not work on my system, therefor
# the big hammer VPATH.
#vpath AT%.xml $(XML_DIR)
VPATH = $(XML_DIR)

# we have to honor the depency on capital and small letters, first the
# general rule, than specialized rules for AT90S and AT90CAN.
avr-at%.raw: $(XML_DIR)/AT%.xml
	python $(xmlconverter) $< > $@

avr-at%p.raw: $(XML_DIR)/AT%P.xml
	python $(xmlconverter) $< > $@

avr-at90s%.raw: $(XML_DIR)/AT90S%.xml
	python $(xmlconverter) $< > $@

avr-at90can%.raw: $(XML_DIR)/AT90CAN%.xml
	python $(xmlconverter) $< > $@

avr-at90pwm%.raw: $(XML_DIR)/AT90PWM%.xml
	python $(xmlconverter) $< > $@

avr-at90pwm%b.raw: $(XML_DIR)/AT90PWM%B.xml
	python $(xmlconverter) $< > $@

avr-at90pwm%.raw: $(XML_DIR)/at90pwm%.xml
	python $(xmlconverter) $< > $@

avr-at90usb%.raw: $(XML_DIR)/AT90USB%.xml
	python $(xmlconverter) $< > $@


# now the rules to patch the files that have local differences, 
# just copy the files that don't need to be patched.
avr-%.ads: %.udiff avr-%.raw
	patch --forward --input=$< --output=$@ avr-$*.raw

avr-%.ads: avr-%.raw
	cp $< $@


# install the files into the corresponding directories.  We use
# gnatchop for copying and for splitting the bootloader part.
install: $(device_specs) $(install_dirs)
	for part in $(supported_devices) ; do \
	    gnatchop -w avr-$$part.ads $(AVR_Ada_Home)/avr/$$part ; \
	done

$(install_dirs):
	mkdir -p $@

clean:
	$(RM) avr-*.raw
	$(RM) *.s
	$(RM) *.rej
	$(RM) *.orig
	$(RM) *\~


# -*- makefile -*-

ifdef TRACE
.PHONY: _trace _value

_trace:
	@$(MAKE) --no-print-directory TRACE= $(TRACE)='$$(warning TRACE $(TRACE))$(shell $(MAKE) TRACE=$(TRACE) _value)'
_value:
	@echo '$(value $(TRACE))'
endif


print-%:
	@echo $* = $($*)

.PHONY: printvars

printvars:
	@$(foreach V,$(sort $(.VARIABLES)), \
           $(if $(filter-out environment% default automatic, \
           $(origin $V)),$(warning $V=$($V) ($(value $V)))))
