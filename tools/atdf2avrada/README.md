# atdf2avrada
A new converter tool that converts files from [.atdf files](http://packs.download.atmel.com/) to ADA compatible files.

## atdf2avrada.py
Python script for convert .atdf to .ads.

Usage:
`python atdf2avrada.py [ATDF_FILE_PATH] [ADS_DIR_PATH]`

Example:
`python atdf2avrada.py ~/atdfs/ATtiny44.atdf .`

A directory will be created with 3 files::
```
attiny44
├─ avr-mcu.ads
├─ avr-attiny441-bootloader.ads
└─ avr-attiny441.ads
```

Support only .atdf with schema-version="0.3".
TODO:
 - Support .atdf with schema-version="4.5".

## convert_atdfs.py
Convert all .atdf files in directory

Usage:
`python convert_atdfs.py [ATDFS_DIR_PATH] [ADS_DIR_PATH]`

Example:
`python atdf2avrada.py ~/atdfs/ ./src/`

## compare_generated.py
Compares two .ads files to find differences. Displays strings from the first file that are not in the second file.

Usage:
`python compare_generated.py [FIRST_ADS] [SECOND_ADS]`

Example:
`python compare_generated.py ~/AVRAda_MCU/src/attiny44/avr-attiny44.ads attiny44/avr-attiny44.ads`
