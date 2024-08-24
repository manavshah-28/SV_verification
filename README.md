# SV_verification
This repo hosts the system verilog verification of an FSM Sequence Detector

## DUT 
The Sequence Detector specifications are as follows.

![alt text](/docs/images/DUT.jpg)

The stream of bits is given to the input pin labeled 'Stream'.
The Tone is supposed to be logic high when the last bit of the sequence 101001 is properly detected.

The output Count is a counter to keep on incrementing the number of detected sequences.

## Testbench Architecture
![alt text](/docs/images/SV_Testbench.jpg)

The Testbench Architecture consists of the Device Under Test (DUT) in this case the adder, the Generator, Driver,Scoreboard, Monitor, Transactions and Interface.

