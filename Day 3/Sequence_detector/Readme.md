# Day 3 – Task 1: Sequence Detector (1110) Design and Verification

## Overview

This project implements a **Sequence Detector** for the binary pattern **1110** using **Verilog HDL**. The design is based on a **Moore Finite State Machine (FSM)** and was developed and verified using **Xilinx Vivado**. The detector continuously monitors a serial input stream and asserts an output signal whenever the sequence **1110** is successfully detected.

## Objective

* Design an FSM-based sequence detector for the pattern **1110**.
* Implement the design in Verilog HDL.
* Verify functionality through simulation and RTL analysis in Vivado.

## Theory

A sequence detector is a sequential digital circuit used to identify a predefined bit pattern from a serial data stream. The detector progresses through a series of states corresponding to partial matches of the target sequence.

### FSM States

| State | Description                                |
| ----- | ------------------------------------------ |
| S0    | Initial State                              |
| S1    | First '1' detected                         |
| S2    | Sequence '11' detected                     |
| S3    | Sequence '111' detected                    |
| S4    | Sequence '1110' detected (Output Asserted) |

The output signal is asserted when the FSM reaches the detection state corresponding to the complete sequence **1110**.

## Design Features

* Moore FSM architecture
* Synchronous clock operation
* Reset functionality
* Serial data sequence monitoring
* Sequence detection output generation

## Inputs and Outputs

### Inputs

* **clk** – System clock
* **rst** – Reset signal
* **din** – Serial input data

### Output

* **detected** – High when sequence **1110** is detected

## State Transition Flow

```text
S0 --1--> S1
S1 --1--> S2
S2 --1--> S3
S3 --0--> S4 (Detected)
```

## RTL Analysis

The synthesized RTL schematic confirms the FSM-based implementation and includes:

* State Register
* Next State Logic
* Detection Logic
* Clock and Reset Circuitry

## Simulation and Verification

A dedicated Verilog testbench was developed to validate the design.

### Test Pattern

```text
Input Stream : 1110
```

### Expected Result

```text
Detected = 1
```

The simulation waveform verified:

* Correct clock generation
* Proper reset operation
* Accurate state transitions
* Successful detection of the sequence **1110**

## Results

✅ Sequence detected successfully

✅ FSM transitioned through all expected states

✅ Detection output asserted at the correct instant

✅ Reset functionality operated correctly

State Diagram

<img width="766" height="599" alt="image" src="https://github.com/user-attachments/assets/a8949ab9-1000-4c38-bda3-fff1ff65853e" />

RTL Diagram

<img width="1032" height="517" alt="image" src="https://github.com/user-attachments/assets/4496fc54-af36-48aa-bad9-6fe77b6ad0dc" />

Graphs

<img width="1241" height="158" alt="image" src="https://github.com/user-attachments/assets/dc6a9316-af60-47b6-9131-520de7cbb581" />
<img width="1267" height="200" alt="image" src="https://github.com/user-attachments/assets/585c1510-f62b-4a29-9868-fa4279625449" />




## Conclusion

The **1110 Sequence Detector** was successfully designed, implemented, and verified using Verilog HDL. Simulation and RTL analysis confirmed correct FSM operation, proper state transitions, and reliable sequence detection. This project provided practical experience in FSM design, sequential logic implementation, and hardware verification using Xilinx Vivado.

