## Overview

This is an academic project completed as part of the Semester 2 Computer Organization and Digital Design Module. The project involved designing a 4-bit Nanoprocessor capable of executing basic arithmetic operations and displaying the output on a 7-Segment Display. Key components of the processor include a 72-bit Program ROM, a 32-bit Register Bank, Multiplexers, a Program Counter, and an Instruction Decoder. Below is a high-level diagram of the Nanoprocessor:

![Nanoprocessor Diagram](https://github.com/k-ranasinghe/Nanoprocessor-Design-VHDL/blob/main/images/processor-diagram.png?raw=true)

For further details, refer to the following documents:
- [Lab Manual](https://github.com/k-ranasinghe/Nanoprocessor-Design-VHDL/blob/9b81ea092f5efd99e5e1a7f0102a0ab3aaee1776/Lab%209-10%20_%20Microprocessor.pdf)
- [Project Report](https://github.com/k-ranasinghe/Nanoprocessor-Design-VHDL/blob/9b81ea092f5efd99e5e1a7f0102a0ab3aaee1776/lab%209-10%20Report.pdf)

## Project Components

### 1. Arithmetic Unit
- **Description:** A 4-bit arithmetic unit capable of adding and subtracting signed integers represented using 2's complement.
- **Implementation:** This unit is an extension of a 4-bit Ripple Carry Adder (RCA) designed in Lab 3.

### 2. Program Counter (PC)
- **Description:** A 3-bit counter that increments by 1 with each clock cycle and can be reset to 0.
- **Implementation:** Built using D Flip-Flops with a clear/reset input, based on Lab 5.

### 3. Multiplexers
- **Description:** Several k-way b-bit multiplexers are used to select among multiple inputs.
- **Types Implemented:**
  - 2-way 3-bit multiplexer
  - 2-way 4-bit multiplexer
  - 8-way 4-bit multiplexer

### 4. Register Bank
- **Description:** Contains 8 registers (R0 to R7), each 4 bits wide. R0 is hardcoded to 0.
- **Implementation:** Uses a 3-to-8 decoder from Lab 4 and D Flip-Flops with reset inputs.

### 5. Instruction Decoder
- **Description:** Decodes the instructions to activate the necessary components for execution.
- **Supported Instructions:**
  - MOVI R, d: Move immediate value d to register R.
  - ADD Ra, Rb: Add values in Ra and Rb, storing the result in Ra.
  - NEG R: Compute the 2's complement of R.
  - JZR R, d: Jump if R equals 0.

### 6. Program ROM
- **Description:** A 72-bit ROM storing the assembly program to be executed by the processor.
- **Implementation:** Built by extending a ROM-based LUT from Lab 7.

### 7. Buses
- **Description:** 3-bit, 4-bit, and 12-bit buses are used to interconnect various components.

### 8. Output Components
- **Description:** The output of Register R7 is connected to a 7-segment display and LEDs to show the result.

## Instruction Set

The Nanoprocessor supports the following instruction set:

| Instruction | Description | Format (12-bit instruction)                  |
|-------------|-------------|----------------------------------------------|
| `MOVI R, d` | Move immediate value `d` to register `R` | `1 0 R R R 0 0 0 d d d d` |
| `ADD Ra, Rb` | Add values in registers `Ra` and `Rb`, store result in `Ra` | `0 0 Ra Ra Ra Rb Rb Rb 0 0 0 0` |
| `NEG R`     | 2's complement of register `R` | `0 1 R R R 0 0 0 0 0 0 0` |
| `JZR R, d`  | Jump if value in register `R` is 0 | `1 1 R R R 0 0 0 0 d d d` |

## Assembly Program

An example assembly program to be executed by the Nanoprocessor:

```assembly
MOVI R7,0    ; R7 <- 0                     10_111_000_0000
MOVI R1,3    ; R1 <- 3                     10_001_000_0011
MOVI R2,-1   ; R2 <- -1                    10_010_000_1111	
ADD R7,R1    ; R7 <- R7 + R1               00_111_001_0000
ADD R1, R2   ; R1 <- R1 + R2               00_001_010_0000
JZR R1, 7    ; If R1 = 0 jump to line 7    11_001_0000_111
JZR R0, 3    ; If R0 = 0 jump to line 3    11_000_0000_011
```

## 7-Segment Display Mapping
| Decimal |	Binary | Hexadecimal |
|---------|--------|-------------|
|0 | 1000000	|	40|
|1 |	1111001	|	79|
|2 |	0100100	|	24|
|3 |	0110000	|	30|
|4 |	0011001	|	19|
|5 |	0010010	|	12|
|6 |	0000010	|	02|
|7 |	1111000	|	78|
|8 |	0000000	|	00|
|9 |	0010000	|	10|
|A |	0001000	|	08|
|B |	0000011	|	03|
|C |	1000110	|	46|
|D |	0100001	|	21|
|E |	0000110	|	06|
|F |	0001110	|	0E|

## Notes
Reset Button is set to PIN U18
```
##Buttons
set_property PACKAGE_PIN U18 [get_ports Res]
	set_property IOSTANDARD LVCMOS33 [get_ports Res]
```


**Expected behaviour of program**
- Initially the 7-segment display will output '0'.
- After a few seconds the 7-seg will output '3'.
- It takes few seconds because the clock is slowed to 2 second clock ticks.
- After few more seconds the 7-seg will display '5'.
- Few more seconds later the 7-seg will display '6'.
- After few more seconds the display will reset to '0'.
- Above steps well repeat again.

**Additional Notes**
- The same output as the 7-seg will be shown on the LEDs(LD0 - LD3) as well.
- During the simulation LD14 will light up a few times denoting zero output from add/subtract unit.
- Eventhough LD15 is connected to component it won't be used during this simulation because there won't be a negative overflow.
- When the reset button(U18) is pressed, the display will go back to '0' and continue from there on.

## Getting Started

### Prerequisites
- **Xilinx Vivado Design Suite(VHDL Simulator):** A tool for simulating VHDL code.
- **BASYS 3 Board:** Required for physical implementation and testing.

### Installation
- Clone the repository to your local machine using the command:
  ```bash
  git clone https://github.com/k-ranasinghe/Nanoprocessor-Design-VHDL.git
