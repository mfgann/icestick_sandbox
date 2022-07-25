#!/bin/bash
cd ice40/examples/blinky
yosys -p 'synth_ice40 -top blinky -json blinky.json' blinky.v               # synthesize into blinky.json
nextpnr-ice40 --hx1k --json blinky.json --pcf blinky.pcf --asc blinky.asc   # run place and route
icepack blinky.asc blinky.bin                                               # generate binary bitstream file
iceprog blinky.bin
