________________________________________________________________________________
# SV_verification

This Repository is used to practice System Verilog Design and Verification. 

I have structured the verification in a modular format to support reuseability.
________________________________________________________________________________
## DUT 
The DUT or Device under test is a Sequence Detector made using a Finite State Machine.

![alt text](/docs/images/DUT.jpg)

### DUT Specifications

* The stream of bits is given to the input pin labeled '**Stream**'.
The '**Tone**' is supposed to be logic high when the last bit of the sequence **101001** is detected.

* The output **Count** is a counter to keep on incrementing the number of detected sequences.


### DUT Logic

#### Finite State Machine
![alt text](/docs/images/FSM.jpg)


________________________________________________________________________________
## Testbench Architecture

![alt text](/docs/images/SV_Testbench.jpg)

The Testbench Architecture consists of the Device Under Test (DUT) in this case the adder, the Generator, Driver,Scoreboard, Monitor, Transactions and Interface.

