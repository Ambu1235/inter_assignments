# Day 2 – Task 3: D Flip-Flop Design and Verification

## Overview

This project implements a **D (Data) Flip-Flop** using **Verilog HDL** and verifies its functionality through simulation in **Xilinx Vivado**. A D Flip-Flop is a fundamental sequential logic element used to store a single bit of data. The output updates only on the active clock edge, making it a key building block in synchronous digital systems.

## Objective

* Design a D Flip-Flop using Verilog HDL.
* Verify its operation through simulation.
* Analyze the synthesized RTL implementation in Vivado.

## Theory

A D Flip-Flop is a clocked sequential circuit that stores one bit of information. The value present at the input **D** is transferred to the output **Q** on the active edge of the clock and remains stored until the next clock event.

Unlike an SR Flip-Flop, the D Flip-Flop eliminates the invalid input condition by deriving the Set and Reset signals from a single data input.

### Internal Relationship

```text
S = D
R = D̅
```

This ensures that the Set and Reset inputs are never active simultaneously.

## Applications

* Registers
* Shift Registers
* Counters
* Memory Units
* Finite State Machines (FSMs)
* Digital Control Systems

## Inputs and Outputs

### Inputs

* **clk** – Clock signal
* **rst** – Reset signal
* **d** – Data input

### Outputs

* **q** – Stored output
* **qbar** – Complement output

## Truth Table

| Clock Edge | D | Q(next)     | Q̅(next)     |
| ---------- | - | ----------- | ------------ |
| ↑          | 0 | 0           | 1            |
| ↑          | 1 | 1           | 0            |
| No Edge    | X | Q(previous) | Q̅(previous) |

## Working Principle

The D Flip-Flop captures the value present at the data input during the active clock edge.

* When **D = 1**, the output is set HIGH.
* When **D = 0**, the output is reset LOW.
* The stored value remains unchanged between clock edges.
* Reset initializes the outputs to a known state.

## Design Features

* Positive-edge triggered operation
* Single-bit data storage
* Reset functionality
* Complementary outputs
* Elimination of invalid SR Flip-Flop states
* Synchronous operation

## RTL Analysis

The RTL schematic generated in Vivado confirms the implementation and includes:

* D Flip-Flop storage element
* Clock input circuitry
* Reset logic
* Output ports (**Q** and **Q̅**)
* Internal logic for data transfer and storage

The synthesized RTL accurately represents the behavior of a positive-edge triggered D Flip-Flop.

<img width="1197" height="474" alt="image" src="https://github.com/user-attachments/assets/45541783-07b0-49e8-9c9c-698cf5b1d46c" />


## Simulation and Verification

A Verilog testbench was developed to validate the functionality of the D Flip-Flop under various input conditions.

### Test Cases

| D | Clock Edge | Expected Q |
| - | ---------- | ---------- |
| 0 | ↑          | 0          |
| 1 | ↑          | 1          |
| 0 | ↑          | 0          |
| 1 | ↑          | 1          |

### Sample Observation

| Signal | Value |
| ------ | ----- |
| D      | 1     |
| CLK    | 1     |
| RST    | 0     |
| Q      | 1     |
| Q̅     | 0     |

The simulation waveform confirmed that the output correctly follows the input data on the active clock edge.

### Result

✅ PASS

<img width="1242" height="227" alt="image" src="https://github.com/user-attachments/assets/38c286ff-ec79-4bb8-9cee-f187ce00915e" />


## Observations

* The output **Q** followed the value of **D** at each positive clock edge.
* **Q̅** remained the logical complement of **Q**.
* The invalid state associated with SR Flip-Flops was eliminated.
* The circuit successfully stored and retained one bit of data.
* Reset initialized the outputs correctly.
* Simulation results matched the theoretical behavior.

## Conclusion

The **D Flip-Flop** was successfully designed, implemented, and verified using Verilog HDL in Xilinx Vivado. Simulation results confirmed correct data storage and transfer on the active clock edge, while RTL analysis verified the synthesized hardware implementation. This project provided practical experience in sequential circuit design, clocked storage elements, and digital system verification.

