# AVRAda_MCU
Device (MCU) specific definitions for AVR microcontrollers

This crate contains the bit and port definitions for 106 MCUs that
Atmel (now Microchip Technology) released in the years around 2010 -
2015. If you use the more modern atxmega or attiny MCUs you currently
(fall 2022) have to write your own.

This crate is mostly useful with the run-time-system
[`AVRAda_RTS`](https://github.com/RREE/AVRAda_RTS). A library for most
on-chip peripherals like timers, GPIOs, AD-converters, etc. is in
[`AVRAda_Lib`](https://github.com/RREE/AVRAda_Lib).  See the examples
in [`AVRAda_Examples`](https://github.com/RREE/AVRAda_Examples).

## (Re-)creating the port and bit definitions

The port and bit definitions in this crate were for the most part
automatically generated from Atmel's XML files that were provided at
that time together with the development environment AVR-Studio
