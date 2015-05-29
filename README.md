# ESP 8266 Dev board
A couple of different layouts for development boards for the ESP 8266 WiFi module.

## ESP8266-dev
This board is intended as a low cost, easy to build and source entry point to ESP 8266 development. After removing (or de-populating) the ESP part of the dev board, it can also be used with a different firmware as an AVR ISP programmer, SPI interface or for a variety of other uses.

However the AVR-CDC firmware is only reliable up to 4800 baud and can't reliably negotiate the 500 mA needed for the reliable operation.

## ESP8266-dev-ftdi
This is a small badge-like breakout board with onboard RGB LEDs. The aim of this board is to provide an easy to use playground for the V-01 version of the ESP 8266 module, while still being able to be used as a general interface board.

The chip reset of the ESP8266 is only released after the 500mA has been successfully negotiated.

Since a FT230X is used, the UART interface is lacking the DTR signal.

## Notes
- The USB socket on the ftdi board is a bit to far away from the board edge
