# Day 2 – Task 1: 2-to-4 Decoder Design and Verification

## Overview

This project implements a **2-to-4 Decoder** using **Verilog HDL** and verifies its functionality through simulation in **Xilinx Vivado**. The decoder accepts a 2-bit binary input and activates one of four output lines corresponding to the input value. At any instant, only one output remains HIGH while all others remain LOW.

## Objective

* Design a 2-to-4 Decoder using Verilog HDL.
* Simulate and verify its functionality using Xilinx Vivado.
* Analyze the synthesized RTL representation of the design.

## Theory

A decoder is a combinational logic circuit that converts binary information from *n* input lines into a maximum of *2ⁿ* output lines.

For a **2-to-4 Decoder**, a 2-bit binary input is translated into one of four mutually exclusive output lines.

### Truth Table

| Input (I1 I0) | Output (Y3 Y2 Y1 Y0) |
| ------------- | -------------------- |
| 00            | 0001                 |
| 01            | 0010                 |
| 10            | 0100                 |
| 11            | 1000                 |

Only one output is asserted for each valid input combination.

## Design Features

* Combinational logic implementation
* One-hot output generation
* Verilog HDL case-statement based design
* Complete verification using simulation
* RTL synthesis and analysis

## Inputs and Outputs

### Input

* **i[1:0]** – 2-bit binary input

### Output

* **Y[3:0]** – 4-bit decoded output

## Decoder Logic

```verilog
case(i)
    2'b00 : Y = 4'b0001;
    2'b01 : Y = 4'b0010;
    2'b10 : Y = 4'b0100;
    2'b11 : Y = 4'b1000;
endcase
```

## Working Principle

The decoder continuously monitors the input and activates the corresponding output line:

```text
00 → Y0 = 1
01 → Y1 = 1
10 → Y2 = 1
11 → Y3 = 1
```

This process converts the binary input into a unique output signal.

## RTL Analysis

The synthesized RTL schematic generated in Vivado confirms the decoder implementation and includes:

* Input selection logic
* Output decoding circuitry
* Multiplexer-based logic realization
* Four unique output paths

The RTL representation accurately reflects the expected functionality of a 2-to-4 Decoder.

RTL DESIGN

<img width="1137" height="487" alt="image" src="https://github.com/user-attachments/assets/e9852121-b777-4984-8143-78a85b7b08f2" />


## Simulation and Verification

A Verilog testbench was developed to verify all possible input combinations.

Graph

<img width="1266" height="143" alt="image" src="https://github.com/user-attachments/assets/a1928ab0-01ff-4f02-bb79-eefb639ca14a" />


### Test Cases

| Input | Expected Output |
| ----- | --------------- |
| 00    | 0001            |
| 01    | 0010            |
| 10    | 0100            |
| 11    | 1000            |

### Sample Verification

| Input | Output |
| ----- | ------ |
| 10    | 0100   |
| 11    | 1000   |

### Result

✅ PASS

## Observations

* Only one output remained HIGH for each input combination.
* Output changed immediately in response to input changes.
* Simulation results matched the theoretical truth table.
* RTL analysis confirmed correct hardware synthesis.
* Decoder functionality was successfully verified.

## Conclusion

The **2-to-4 Decoder** was successfully designed, implemented, and verified using Verilog HDL in Xilinx Vivado. Simulation results matched the expected truth table, confirming the correctness of the design. This project provided practical experience in combinational logic design, Verilog HDL coding, simulation, verification, and RTL analysis.

